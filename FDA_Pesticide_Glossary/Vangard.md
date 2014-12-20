---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.742334, -0.510752, -1.823504, 1, 0, 0, 1,
-2.705958, -0.2308308, -0.4677282, 1, 0.007843138, 0, 1,
-2.596424, -0.5933, -1.074656, 1, 0.01176471, 0, 1,
-2.561565, 2.100459, -0.2966972, 1, 0.01960784, 0, 1,
-2.500109, 0.8959154, -0.3288708, 1, 0.02352941, 0, 1,
-2.44178, -0.601869, -1.901637, 1, 0.03137255, 0, 1,
-2.341814, -0.3808066, -0.787021, 1, 0.03529412, 0, 1,
-2.31227, -0.3914694, -0.8758907, 1, 0.04313726, 0, 1,
-2.271345, -1.383919, -0.7964423, 1, 0.04705882, 0, 1,
-2.252169, 0.1711714, -2.040616, 1, 0.05490196, 0, 1,
-2.222393, 0.3324513, -1.524069, 1, 0.05882353, 0, 1,
-2.153188, 1.019559, -3.162913, 1, 0.06666667, 0, 1,
-2.132764, 0.2685799, -1.790674, 1, 0.07058824, 0, 1,
-2.131604, 0.6384313, -2.010278, 1, 0.07843138, 0, 1,
-2.088175, -0.4073745, -2.467112, 1, 0.08235294, 0, 1,
-2.055316, -0.0451625, -1.002142, 1, 0.09019608, 0, 1,
-2.04839, -0.3195538, -1.911187, 1, 0.09411765, 0, 1,
-2.025093, 0.9049374, -1.501857, 1, 0.1019608, 0, 1,
-1.986906, 1.738626, -1.012304, 1, 0.1098039, 0, 1,
-1.972997, 0.8399919, -1.523228, 1, 0.1137255, 0, 1,
-1.945052, -0.5727625, -2.422313, 1, 0.1215686, 0, 1,
-1.93291, -0.4181126, -2.956261, 1, 0.1254902, 0, 1,
-1.930563, 0.6352567, -0.7271537, 1, 0.1333333, 0, 1,
-1.92087, 1.603618, 0.266488, 1, 0.1372549, 0, 1,
-1.918321, 0.5147592, -1.921103, 1, 0.145098, 0, 1,
-1.901981, -0.1677842, -0.3747924, 1, 0.1490196, 0, 1,
-1.899059, -0.609246, -2.263374, 1, 0.1568628, 0, 1,
-1.896042, 0.4373445, -1.803773, 1, 0.1607843, 0, 1,
-1.872962, -1.045744, -2.371991, 1, 0.1686275, 0, 1,
-1.864532, 0.7890005, -2.264529, 1, 0.172549, 0, 1,
-1.852312, -0.1534765, -2.7913, 1, 0.1803922, 0, 1,
-1.841933, -0.9631202, -2.334, 1, 0.1843137, 0, 1,
-1.833923, -1.269584, -2.302901, 1, 0.1921569, 0, 1,
-1.802435, 1.373417, -0.8560491, 1, 0.1960784, 0, 1,
-1.80232, -1.667327, -1.473454, 1, 0.2039216, 0, 1,
-1.799485, -0.2410816, -0.4119906, 1, 0.2117647, 0, 1,
-1.788489, 1.361571, -1.271557, 1, 0.2156863, 0, 1,
-1.784015, -0.3416625, -3.205466, 1, 0.2235294, 0, 1,
-1.781895, 0.7577296, -1.547799, 1, 0.227451, 0, 1,
-1.773911, -0.1165981, -1.819822, 1, 0.2352941, 0, 1,
-1.753639, 1.208752, -2.128697, 1, 0.2392157, 0, 1,
-1.747206, -0.3840453, -3.083148, 1, 0.2470588, 0, 1,
-1.746572, -0.6788979, -0.7769352, 1, 0.2509804, 0, 1,
-1.723355, 2.453902, 0.2154954, 1, 0.2588235, 0, 1,
-1.71585, -1.305986, -2.8664, 1, 0.2627451, 0, 1,
-1.669371, 0.698554, -0.7452285, 1, 0.2705882, 0, 1,
-1.664601, -1.562292, -2.141406, 1, 0.2745098, 0, 1,
-1.646133, 1.40828, -0.02271663, 1, 0.282353, 0, 1,
-1.621228, -1.245419, -3.942827, 1, 0.2862745, 0, 1,
-1.618105, -0.08600979, -2.453218, 1, 0.2941177, 0, 1,
-1.610859, 0.1421244, -1.173628, 1, 0.3019608, 0, 1,
-1.598057, 0.2706055, -1.615184, 1, 0.3058824, 0, 1,
-1.591387, 0.4317913, -0.8820275, 1, 0.3137255, 0, 1,
-1.583115, 0.407691, -0.9122297, 1, 0.3176471, 0, 1,
-1.580985, 0.2155812, -1.770457, 1, 0.3254902, 0, 1,
-1.561268, -1.559895, -1.742777, 1, 0.3294118, 0, 1,
-1.546379, -1.440502, -3.077033, 1, 0.3372549, 0, 1,
-1.534843, 0.2405918, -1.319901, 1, 0.3411765, 0, 1,
-1.531138, -0.5635729, -1.065673, 1, 0.3490196, 0, 1,
-1.52698, 0.3636371, -2.142177, 1, 0.3529412, 0, 1,
-1.523238, -0.8935031, -1.739039, 1, 0.3607843, 0, 1,
-1.515882, 0.5774983, 1.3364, 1, 0.3647059, 0, 1,
-1.510618, -0.3583563, -3.012286, 1, 0.372549, 0, 1,
-1.505391, 1.132892, -1.223967, 1, 0.3764706, 0, 1,
-1.499478, -0.8202839, -3.791274, 1, 0.3843137, 0, 1,
-1.491964, -0.9051896, -1.15238, 1, 0.3882353, 0, 1,
-1.477537, 0.5707439, -1.501292, 1, 0.3960784, 0, 1,
-1.464495, 0.2622853, -1.507834, 1, 0.4039216, 0, 1,
-1.450804, 0.881649, -2.762732, 1, 0.4078431, 0, 1,
-1.449848, 0.454339, 0.459988, 1, 0.4156863, 0, 1,
-1.44762, -1.023439, -2.844725, 1, 0.4196078, 0, 1,
-1.434304, 1.390718, -0.5615945, 1, 0.427451, 0, 1,
-1.428403, -0.2369592, -2.879883, 1, 0.4313726, 0, 1,
-1.420414, -0.90842, -3.692086, 1, 0.4392157, 0, 1,
-1.419911, 0.3176225, -2.006958, 1, 0.4431373, 0, 1,
-1.415993, 1.063967, -1.32992, 1, 0.4509804, 0, 1,
-1.412534, 0.1135115, -1.14743, 1, 0.454902, 0, 1,
-1.400378, 0.4179867, -0.543883, 1, 0.4627451, 0, 1,
-1.373818, 1.628918, -1.997322, 1, 0.4666667, 0, 1,
-1.371682, 1.178606, 0.9769661, 1, 0.4745098, 0, 1,
-1.367727, -0.785477, -2.253425, 1, 0.4784314, 0, 1,
-1.363579, 0.411576, -1.614698, 1, 0.4862745, 0, 1,
-1.363542, 0.8044504, -1.216772, 1, 0.4901961, 0, 1,
-1.356245, 0.04900548, 0.5603335, 1, 0.4980392, 0, 1,
-1.351948, 0.4558279, -1.578325, 1, 0.5058824, 0, 1,
-1.317354, 0.9744294, -1.152879, 1, 0.509804, 0, 1,
-1.316582, 0.2636272, -2.000791, 1, 0.5176471, 0, 1,
-1.307169, 0.8403965, 0.6393904, 1, 0.5215687, 0, 1,
-1.289387, 0.929055, -1.224228, 1, 0.5294118, 0, 1,
-1.288663, 1.560617, -0.4152017, 1, 0.5333334, 0, 1,
-1.276472, -0.6971691, -1.81976, 1, 0.5411765, 0, 1,
-1.270824, 0.5427254, -1.119974, 1, 0.5450981, 0, 1,
-1.264536, -0.7258404, -4.151044, 1, 0.5529412, 0, 1,
-1.262655, 0.780292, -0.4088003, 1, 0.5568628, 0, 1,
-1.247734, -0.7155665, -2.700536, 1, 0.5647059, 0, 1,
-1.242993, -0.9070529, -2.05171, 1, 0.5686275, 0, 1,
-1.235746, 0.8188062, -0.7282718, 1, 0.5764706, 0, 1,
-1.23179, 0.8510961, 0.1480334, 1, 0.5803922, 0, 1,
-1.226194, 1.18818, -1.619773, 1, 0.5882353, 0, 1,
-1.219522, 0.9226438, -1.135214, 1, 0.5921569, 0, 1,
-1.217268, 1.116482, -0.6450107, 1, 0.6, 0, 1,
-1.212983, -0.3174788, -1.91262, 1, 0.6078432, 0, 1,
-1.206053, -0.3881519, -1.450058, 1, 0.6117647, 0, 1,
-1.200099, 0.8972343, -2.375752, 1, 0.6196079, 0, 1,
-1.189757, 0.4309393, -0.5640402, 1, 0.6235294, 0, 1,
-1.18433, 1.411143, -1.771715, 1, 0.6313726, 0, 1,
-1.183029, -1.156707, -2.396258, 1, 0.6352941, 0, 1,
-1.179672, -0.1192819, -0.946582, 1, 0.6431373, 0, 1,
-1.177354, -1.554633, -3.861333, 1, 0.6470588, 0, 1,
-1.176905, -0.3168485, -2.978574, 1, 0.654902, 0, 1,
-1.176815, 0.04454925, -1.634806, 1, 0.6588235, 0, 1,
-1.172042, -0.7007755, -1.540767, 1, 0.6666667, 0, 1,
-1.168391, 0.01104504, -1.678871, 1, 0.6705883, 0, 1,
-1.167562, -0.3122754, -1.980418, 1, 0.6784314, 0, 1,
-1.162461, 0.740267, -0.4467361, 1, 0.682353, 0, 1,
-1.160422, 0.786344, -2.516371, 1, 0.6901961, 0, 1,
-1.157498, -0.3433786, -1.261044, 1, 0.6941177, 0, 1,
-1.154917, -0.9629163, -3.187194, 1, 0.7019608, 0, 1,
-1.154786, -0.4324965, -3.518581, 1, 0.7098039, 0, 1,
-1.152705, 1.192003, 0.6401509, 1, 0.7137255, 0, 1,
-1.133023, 0.8290578, 0.5084237, 1, 0.7215686, 0, 1,
-1.114395, 0.5347629, -0.3025776, 1, 0.7254902, 0, 1,
-1.112267, 0.2747453, -1.287372, 1, 0.7333333, 0, 1,
-1.104454, -1.591259, -2.201453, 1, 0.7372549, 0, 1,
-1.103544, 0.4967974, -2.871397, 1, 0.7450981, 0, 1,
-1.101548, -1.397779, -2.07183, 1, 0.7490196, 0, 1,
-1.101522, -0.7760382, -3.471368, 1, 0.7568628, 0, 1,
-1.092645, -1.880622, -1.905076, 1, 0.7607843, 0, 1,
-1.082205, 0.8785757, -0.5281261, 1, 0.7686275, 0, 1,
-1.081797, -1.06407, -3.336848, 1, 0.772549, 0, 1,
-1.077204, 0.7256679, -2.395587, 1, 0.7803922, 0, 1,
-1.075584, -0.8952253, -2.221608, 1, 0.7843137, 0, 1,
-1.07515, 0.5134227, -2.223344, 1, 0.7921569, 0, 1,
-1.075084, -1.652237, -2.198676, 1, 0.7960784, 0, 1,
-1.057637, 0.01125588, -1.619565, 1, 0.8039216, 0, 1,
-1.047747, -0.04844088, -0.9988407, 1, 0.8117647, 0, 1,
-1.039182, -0.07067066, -2.385083, 1, 0.8156863, 0, 1,
-1.03844, 1.127098, -0.2980773, 1, 0.8235294, 0, 1,
-1.036041, 0.2763975, -4.232935, 1, 0.827451, 0, 1,
-1.035694, 0.2876351, -1.6292, 1, 0.8352941, 0, 1,
-1.031978, 0.1236138, -0.600773, 1, 0.8392157, 0, 1,
-1.0275, 0.4440891, -2.109362, 1, 0.8470588, 0, 1,
-1.02136, -0.5250829, -1.572076, 1, 0.8509804, 0, 1,
-1.019539, -0.2895217, -2.091665, 1, 0.8588235, 0, 1,
-1.006129, -1.356918, -1.391925, 1, 0.8627451, 0, 1,
-1.005745, 0.4424182, -0.9680021, 1, 0.8705882, 0, 1,
-1.00395, -1.800368, -3.05442, 1, 0.8745098, 0, 1,
-0.9981066, -1.496481, -0.597272, 1, 0.8823529, 0, 1,
-0.997444, -0.4014499, -1.915336, 1, 0.8862745, 0, 1,
-0.9970374, 2.409245, -0.06218604, 1, 0.8941177, 0, 1,
-0.9954109, -2.309907, -2.987251, 1, 0.8980392, 0, 1,
-0.9949004, -1.307779, -3.113619, 1, 0.9058824, 0, 1,
-0.9929845, 1.727365, -1.412398, 1, 0.9137255, 0, 1,
-0.9918807, -1.695811, -2.421371, 1, 0.9176471, 0, 1,
-0.9872409, -0.4967065, -2.530363, 1, 0.9254902, 0, 1,
-0.9849969, -0.2754443, -1.181529, 1, 0.9294118, 0, 1,
-0.9808453, -0.2620689, -3.115563, 1, 0.9372549, 0, 1,
-0.9807644, 0.2255403, 0.6836085, 1, 0.9411765, 0, 1,
-0.9786531, -1.66825, -2.14752, 1, 0.9490196, 0, 1,
-0.9783563, -2.349301, -2.825933, 1, 0.9529412, 0, 1,
-0.9756782, 0.6414413, -2.714058, 1, 0.9607843, 0, 1,
-0.9742079, -0.4698307, -2.654229, 1, 0.9647059, 0, 1,
-0.9735975, -1.074627, -1.325501, 1, 0.972549, 0, 1,
-0.9710581, -0.7193702, -2.393952, 1, 0.9764706, 0, 1,
-0.9701751, 0.834342, -0.8266168, 1, 0.9843137, 0, 1,
-0.9656803, 1.474816, -1.011476, 1, 0.9882353, 0, 1,
-0.9610829, 1.132756, -1.359356, 1, 0.9960784, 0, 1,
-0.9608752, -0.8573751, -3.159571, 0.9960784, 1, 0, 1,
-0.9600822, -1.089083, -1.622107, 0.9921569, 1, 0, 1,
-0.9560739, 0.3883223, -0.3320389, 0.9843137, 1, 0, 1,
-0.9473709, -1.66838, -1.560856, 0.9803922, 1, 0, 1,
-0.9467894, 0.01409386, -1.618706, 0.972549, 1, 0, 1,
-0.9456459, -0.9207798, -1.840026, 0.9686275, 1, 0, 1,
-0.9444709, 1.875987, -1.977484, 0.9607843, 1, 0, 1,
-0.9424954, 0.9691355, -1.930619, 0.9568627, 1, 0, 1,
-0.9373344, -0.9689654, -2.140693, 0.9490196, 1, 0, 1,
-0.9342936, 0.3085469, -2.352804, 0.945098, 1, 0, 1,
-0.9327966, 0.8053116, -0.6131381, 0.9372549, 1, 0, 1,
-0.9323718, -1.244863, -3.279197, 0.9333333, 1, 0, 1,
-0.9304859, 0.4068235, -1.608891, 0.9254902, 1, 0, 1,
-0.9256347, -0.9452066, -1.828609, 0.9215686, 1, 0, 1,
-0.9255601, 0.2289503, -2.003674, 0.9137255, 1, 0, 1,
-0.9233236, 0.1532418, -1.849197, 0.9098039, 1, 0, 1,
-0.9182857, -0.6305402, -2.246692, 0.9019608, 1, 0, 1,
-0.907601, 0.0001597145, -1.173642, 0.8941177, 1, 0, 1,
-0.9031599, -0.4484213, -1.918519, 0.8901961, 1, 0, 1,
-0.8937962, 0.6855981, -0.1714083, 0.8823529, 1, 0, 1,
-0.8928322, 0.1747063, -0.7015055, 0.8784314, 1, 0, 1,
-0.8914837, 1.015051, -0.7118115, 0.8705882, 1, 0, 1,
-0.8903406, 0.6892543, -0.754989, 0.8666667, 1, 0, 1,
-0.887631, -0.2959456, -1.025329, 0.8588235, 1, 0, 1,
-0.8867315, 0.4941481, -0.9464037, 0.854902, 1, 0, 1,
-0.8864281, -0.9295034, -3.352424, 0.8470588, 1, 0, 1,
-0.8794744, -1.488726, -1.817538, 0.8431373, 1, 0, 1,
-0.8779915, 0.2650099, -2.53886, 0.8352941, 1, 0, 1,
-0.8708006, -1.193478, -2.174314, 0.8313726, 1, 0, 1,
-0.8697102, 2.012042, -2.344634, 0.8235294, 1, 0, 1,
-0.868871, -0.4090134, -3.190652, 0.8196079, 1, 0, 1,
-0.8677506, -0.2057675, -1.363107, 0.8117647, 1, 0, 1,
-0.8674981, 0.2119362, -0.3583945, 0.8078431, 1, 0, 1,
-0.8630095, 1.129871, -0.8208985, 0.8, 1, 0, 1,
-0.8598711, 0.5295609, -0.1128863, 0.7921569, 1, 0, 1,
-0.8567429, -1.974497, -1.686556, 0.7882353, 1, 0, 1,
-0.8550018, 0.5413535, -1.291585, 0.7803922, 1, 0, 1,
-0.8483877, -0.7984063, -1.954817, 0.7764706, 1, 0, 1,
-0.8468917, 1.247161, 0.003943566, 0.7686275, 1, 0, 1,
-0.8460757, -0.6154324, -1.383987, 0.7647059, 1, 0, 1,
-0.8460108, -0.3015819, -1.532875, 0.7568628, 1, 0, 1,
-0.8419918, 1.515209, -1.025429, 0.7529412, 1, 0, 1,
-0.8401373, -0.274773, -3.962221, 0.7450981, 1, 0, 1,
-0.8338627, 2.64685, -0.6355087, 0.7411765, 1, 0, 1,
-0.8285112, 0.2458518, -2.159979, 0.7333333, 1, 0, 1,
-0.8266364, -1.129727, -4.566235, 0.7294118, 1, 0, 1,
-0.8231455, 2.680677, -0.3242714, 0.7215686, 1, 0, 1,
-0.8208732, 0.1204709, -1.975361, 0.7176471, 1, 0, 1,
-0.8182923, 0.4627323, -0.1681435, 0.7098039, 1, 0, 1,
-0.817381, 0.2307204, -1.704481, 0.7058824, 1, 0, 1,
-0.8169253, -0.5989432, -1.227721, 0.6980392, 1, 0, 1,
-0.8147686, -0.6611775, -3.074728, 0.6901961, 1, 0, 1,
-0.8144234, 0.7360021, 0.2534224, 0.6862745, 1, 0, 1,
-0.8125923, -0.06367815, -1.347651, 0.6784314, 1, 0, 1,
-0.8125647, -1.135179, -3.595027, 0.6745098, 1, 0, 1,
-0.8089663, 0.7685121, -0.4704527, 0.6666667, 1, 0, 1,
-0.8086717, 0.02518924, -3.043007, 0.6627451, 1, 0, 1,
-0.7870106, 0.5722364, -0.8641412, 0.654902, 1, 0, 1,
-0.7863381, 0.7377409, 1.104409, 0.6509804, 1, 0, 1,
-0.7857267, 2.39486, -0.4782901, 0.6431373, 1, 0, 1,
-0.7850903, 0.9556333, 0.299842, 0.6392157, 1, 0, 1,
-0.7796782, 0.07424624, -0.4374964, 0.6313726, 1, 0, 1,
-0.7761879, 0.3444587, 0.1574729, 0.627451, 1, 0, 1,
-0.7584864, -0.05433221, -1.832965, 0.6196079, 1, 0, 1,
-0.7576543, -0.2716203, -1.202553, 0.6156863, 1, 0, 1,
-0.7533945, 0.920044, 0.6317891, 0.6078432, 1, 0, 1,
-0.7467897, -1.614822, -2.104174, 0.6039216, 1, 0, 1,
-0.7428959, -0.04939062, -2.08048, 0.5960785, 1, 0, 1,
-0.7393699, 1.357549, 0.5112962, 0.5882353, 1, 0, 1,
-0.7360003, -1.216023, -3.609256, 0.5843138, 1, 0, 1,
-0.7340143, 1.18946, -1.313065, 0.5764706, 1, 0, 1,
-0.7304171, 0.1265626, -1.843695, 0.572549, 1, 0, 1,
-0.7240865, 1.810207, -0.0966337, 0.5647059, 1, 0, 1,
-0.7216439, 0.5734069, -0.8697761, 0.5607843, 1, 0, 1,
-0.7206331, -0.6640087, -2.343736, 0.5529412, 1, 0, 1,
-0.7201476, 1.667332, -0.6597179, 0.5490196, 1, 0, 1,
-0.7137766, -0.6819359, -0.8758624, 0.5411765, 1, 0, 1,
-0.708739, -0.001737977, -2.236964, 0.5372549, 1, 0, 1,
-0.7066157, -0.3146487, -3.546796, 0.5294118, 1, 0, 1,
-0.7058832, -0.6231186, -1.271267, 0.5254902, 1, 0, 1,
-0.7051696, 0.9584577, -2.311361, 0.5176471, 1, 0, 1,
-0.7049129, 0.1132551, -1.676628, 0.5137255, 1, 0, 1,
-0.7013565, -0.5610002, -2.764492, 0.5058824, 1, 0, 1,
-0.7006534, -1.42908, -4.613532, 0.5019608, 1, 0, 1,
-0.6972501, -1.087049, -1.237894, 0.4941176, 1, 0, 1,
-0.6883525, -0.3146566, -3.90257, 0.4862745, 1, 0, 1,
-0.6861499, -2.087049, -1.946197, 0.4823529, 1, 0, 1,
-0.6836892, 0.2207481, -0.6398958, 0.4745098, 1, 0, 1,
-0.682856, 0.7115154, -0.4587595, 0.4705882, 1, 0, 1,
-0.6812266, -0.3999759, -2.616327, 0.4627451, 1, 0, 1,
-0.6804824, -0.02564361, -0.7398394, 0.4588235, 1, 0, 1,
-0.6797432, 0.3855794, -3.193404, 0.4509804, 1, 0, 1,
-0.6790125, -2.495626, -3.460665, 0.4470588, 1, 0, 1,
-0.6788152, 0.9128612, -0.1320255, 0.4392157, 1, 0, 1,
-0.6783715, 0.07063209, -2.230001, 0.4352941, 1, 0, 1,
-0.6774373, -2.335367, -2.668073, 0.427451, 1, 0, 1,
-0.6772885, 1.91632, -0.06342768, 0.4235294, 1, 0, 1,
-0.6771245, -0.5540561, -1.584098, 0.4156863, 1, 0, 1,
-0.6723101, 0.4456865, -1.380753, 0.4117647, 1, 0, 1,
-0.6675317, -0.605804, -1.60776, 0.4039216, 1, 0, 1,
-0.6655806, -1.752285, -2.588993, 0.3960784, 1, 0, 1,
-0.6654202, -0.5167168, -4.217521, 0.3921569, 1, 0, 1,
-0.6649283, 1.132423, -0.02515661, 0.3843137, 1, 0, 1,
-0.6639761, 0.12757, -0.2001253, 0.3803922, 1, 0, 1,
-0.6616052, -0.571481, -3.343256, 0.372549, 1, 0, 1,
-0.6597577, -0.8768576, -2.040486, 0.3686275, 1, 0, 1,
-0.658724, -0.8349489, -0.8789943, 0.3607843, 1, 0, 1,
-0.6568512, -1.369719, -3.320725, 0.3568628, 1, 0, 1,
-0.6565785, 0.6296893, 0.2502994, 0.3490196, 1, 0, 1,
-0.6557915, -0.194879, -0.2131432, 0.345098, 1, 0, 1,
-0.6531382, 0.4630356, -1.001101, 0.3372549, 1, 0, 1,
-0.6525354, -0.8358892, -3.539459, 0.3333333, 1, 0, 1,
-0.6502566, 0.1576023, -2.405591, 0.3254902, 1, 0, 1,
-0.6499028, 1.206064, -3.242691, 0.3215686, 1, 0, 1,
-0.6418905, 0.5734786, -2.302542, 0.3137255, 1, 0, 1,
-0.6401196, -0.8047761, -3.621589, 0.3098039, 1, 0, 1,
-0.6330451, 0.1265715, 1.499205, 0.3019608, 1, 0, 1,
-0.6320531, -0.05943351, -2.717311, 0.2941177, 1, 0, 1,
-0.6306844, 0.02981884, -0.9893292, 0.2901961, 1, 0, 1,
-0.6255142, 0.1918215, -0.3827464, 0.282353, 1, 0, 1,
-0.6251062, 0.9644423, 1.258977, 0.2784314, 1, 0, 1,
-0.6240367, -0.7370475, -2.73271, 0.2705882, 1, 0, 1,
-0.6238279, 1.266998, -0.9588508, 0.2666667, 1, 0, 1,
-0.6200176, 0.8191934, 0.3875141, 0.2588235, 1, 0, 1,
-0.6162537, -0.1490242, -0.07883316, 0.254902, 1, 0, 1,
-0.6147017, -0.05415353, -2.504866, 0.2470588, 1, 0, 1,
-0.612744, -1.74834, -1.213173, 0.2431373, 1, 0, 1,
-0.6124449, 0.3139543, -1.957958, 0.2352941, 1, 0, 1,
-0.6082939, -1.678154, -4.372794, 0.2313726, 1, 0, 1,
-0.6066963, 0.7780373, -1.12716, 0.2235294, 1, 0, 1,
-0.6019195, 0.2549007, -2.050877, 0.2196078, 1, 0, 1,
-0.5902727, 0.9844826, 0.2864187, 0.2117647, 1, 0, 1,
-0.5893854, 0.788039, -1.950555, 0.2078431, 1, 0, 1,
-0.5840816, 0.1703556, -2.216981, 0.2, 1, 0, 1,
-0.5769841, -0.1900325, -1.469666, 0.1921569, 1, 0, 1,
-0.5679156, -1.634473, -3.446015, 0.1882353, 1, 0, 1,
-0.5678621, 0.1439748, -0.1155817, 0.1803922, 1, 0, 1,
-0.5676965, 0.1263213, -1.155515, 0.1764706, 1, 0, 1,
-0.5516126, 0.1235511, -2.260069, 0.1686275, 1, 0, 1,
-0.5435135, -0.09455364, -1.274804, 0.1647059, 1, 0, 1,
-0.5431322, 1.254458, 0.5099858, 0.1568628, 1, 0, 1,
-0.541239, -2.535729, -2.612258, 0.1529412, 1, 0, 1,
-0.5396463, -0.4163188, -1.369916, 0.145098, 1, 0, 1,
-0.5367492, -1.022686, -4.952155, 0.1411765, 1, 0, 1,
-0.533015, 0.1463791, -2.305152, 0.1333333, 1, 0, 1,
-0.528697, 0.2709091, -1.043888, 0.1294118, 1, 0, 1,
-0.5262201, -0.9332395, -4.210102, 0.1215686, 1, 0, 1,
-0.5210323, -0.4728327, -3.407867, 0.1176471, 1, 0, 1,
-0.5207678, -0.8257802, -2.630116, 0.1098039, 1, 0, 1,
-0.5204435, -0.1208574, -1.313662, 0.1058824, 1, 0, 1,
-0.5183478, -0.4400492, -0.02498138, 0.09803922, 1, 0, 1,
-0.5159246, -0.8206301, -5.521515, 0.09019608, 1, 0, 1,
-0.5157791, 1.001463, -1.033162, 0.08627451, 1, 0, 1,
-0.5138195, -0.7122708, -1.825203, 0.07843138, 1, 0, 1,
-0.511627, -0.2895173, -1.4676, 0.07450981, 1, 0, 1,
-0.504544, -2.509373, -1.557688, 0.06666667, 1, 0, 1,
-0.4950448, 0.08352792, -0.07673942, 0.0627451, 1, 0, 1,
-0.4880205, -0.184037, -1.75166, 0.05490196, 1, 0, 1,
-0.4848517, -0.6173159, -2.343021, 0.05098039, 1, 0, 1,
-0.4802815, -0.1749951, -1.400051, 0.04313726, 1, 0, 1,
-0.4800656, 0.04326994, -1.522301, 0.03921569, 1, 0, 1,
-0.4726187, 0.8640407, 1.611225, 0.03137255, 1, 0, 1,
-0.4564744, -0.7527192, -2.658555, 0.02745098, 1, 0, 1,
-0.4472702, -1.208973, -3.511279, 0.01960784, 1, 0, 1,
-0.4433588, -0.2380082, -1.11818, 0.01568628, 1, 0, 1,
-0.4429704, -0.9139485, -2.733067, 0.007843138, 1, 0, 1,
-0.4375961, 2.179793, 0.4510019, 0.003921569, 1, 0, 1,
-0.4357622, -0.09629938, -0.9583954, 0, 1, 0.003921569, 1,
-0.4353747, 1.246197, 1.119341, 0, 1, 0.01176471, 1,
-0.4279059, -0.2469818, -1.304853, 0, 1, 0.01568628, 1,
-0.4259501, -0.3176303, -0.04357727, 0, 1, 0.02352941, 1,
-0.4243752, -1.990678, -3.14932, 0, 1, 0.02745098, 1,
-0.4234738, 1.482593, 0.1043384, 0, 1, 0.03529412, 1,
-0.4221979, 2.024308, 0.9069493, 0, 1, 0.03921569, 1,
-0.4152204, 0.4009551, 0.7802117, 0, 1, 0.04705882, 1,
-0.4143779, -1.469768, -4.927763, 0, 1, 0.05098039, 1,
-0.4118122, -1.015411, -0.6322987, 0, 1, 0.05882353, 1,
-0.4108134, -0.5264605, -1.302618, 0, 1, 0.0627451, 1,
-0.40769, -1.506337, -1.589524, 0, 1, 0.07058824, 1,
-0.3997995, 0.03901186, -2.761768, 0, 1, 0.07450981, 1,
-0.3974264, 0.331145, -2.464995, 0, 1, 0.08235294, 1,
-0.3967689, -0.1892045, -2.367446, 0, 1, 0.08627451, 1,
-0.3842932, 1.021266, -0.3478516, 0, 1, 0.09411765, 1,
-0.3837678, 0.4429458, -0.1461249, 0, 1, 0.1019608, 1,
-0.381871, -1.174308, -3.658355, 0, 1, 0.1058824, 1,
-0.381814, -0.7108207, -2.873392, 0, 1, 0.1137255, 1,
-0.3807122, 1.992689, -2.651155, 0, 1, 0.1176471, 1,
-0.3790431, -1.042363, -2.168181, 0, 1, 0.1254902, 1,
-0.3783994, 0.7239742, -0.6695818, 0, 1, 0.1294118, 1,
-0.3773493, -0.2973431, -2.360711, 0, 1, 0.1372549, 1,
-0.3763198, 2.076096, 0.08459681, 0, 1, 0.1411765, 1,
-0.3759666, 0.682153, -0.9882872, 0, 1, 0.1490196, 1,
-0.374557, 1.341841, 1.560829, 0, 1, 0.1529412, 1,
-0.3703314, -0.02688042, -3.079691, 0, 1, 0.1607843, 1,
-0.3701808, -2.154672, -3.586133, 0, 1, 0.1647059, 1,
-0.3594839, -0.7678961, -3.384546, 0, 1, 0.172549, 1,
-0.3540931, 0.6196587, -0.6052089, 0, 1, 0.1764706, 1,
-0.3470638, 0.6529678, -2.051435, 0, 1, 0.1843137, 1,
-0.3462356, 0.4916649, 0.5912626, 0, 1, 0.1882353, 1,
-0.3462285, -1.910887, -4.130592, 0, 1, 0.1960784, 1,
-0.3459919, 1.685736, -2.127915, 0, 1, 0.2039216, 1,
-0.3386612, -0.5426772, -2.339642, 0, 1, 0.2078431, 1,
-0.3349435, 1.32414, -0.6042006, 0, 1, 0.2156863, 1,
-0.3344853, 0.3227016, -2.974784, 0, 1, 0.2196078, 1,
-0.3256253, -0.5982202, -2.689492, 0, 1, 0.227451, 1,
-0.3204313, 1.823975, -2.084133, 0, 1, 0.2313726, 1,
-0.3144422, -1.128014, -1.334334, 0, 1, 0.2392157, 1,
-0.310376, 0.1411772, -0.332892, 0, 1, 0.2431373, 1,
-0.3064126, 0.7183737, -0.7089572, 0, 1, 0.2509804, 1,
-0.3043608, 0.4183585, -0.8557804, 0, 1, 0.254902, 1,
-0.3015023, 1.584451, -0.6420019, 0, 1, 0.2627451, 1,
-0.301392, 0.7967029, 0.3959816, 0, 1, 0.2666667, 1,
-0.3009004, 0.09417772, -1.724382, 0, 1, 0.2745098, 1,
-0.2971896, -0.1945195, -3.600305, 0, 1, 0.2784314, 1,
-0.2941429, 0.1641233, -0.867922, 0, 1, 0.2862745, 1,
-0.2924988, -0.5130102, -1.926589, 0, 1, 0.2901961, 1,
-0.2873302, -0.1966116, -2.098787, 0, 1, 0.2980392, 1,
-0.2852968, -0.5162215, -2.736014, 0, 1, 0.3058824, 1,
-0.2805591, 0.2212343, -3.231107, 0, 1, 0.3098039, 1,
-0.2790201, 1.526097, -0.1722497, 0, 1, 0.3176471, 1,
-0.2742337, -0.4071579, -1.374981, 0, 1, 0.3215686, 1,
-0.2723283, 0.08845945, -0.2511427, 0, 1, 0.3294118, 1,
-0.2704824, -1.117068, -3.09505, 0, 1, 0.3333333, 1,
-0.2678356, 0.1759221, -2.883384, 0, 1, 0.3411765, 1,
-0.2626006, -0.3260754, -1.798549, 0, 1, 0.345098, 1,
-0.2579155, 0.3168077, -2.031523, 0, 1, 0.3529412, 1,
-0.2558934, 0.8129824, -0.1920067, 0, 1, 0.3568628, 1,
-0.2544987, -0.9258622, -2.406443, 0, 1, 0.3647059, 1,
-0.2492387, -0.1972994, -2.281552, 0, 1, 0.3686275, 1,
-0.244977, -0.2449498, -3.940459, 0, 1, 0.3764706, 1,
-0.2435253, 1.291916, -0.1952386, 0, 1, 0.3803922, 1,
-0.2391656, -0.05904346, -2.924383, 0, 1, 0.3882353, 1,
-0.2383374, 0.6086811, -2.058333, 0, 1, 0.3921569, 1,
-0.2326029, 0.1177384, -0.7383517, 0, 1, 0.4, 1,
-0.2325169, 0.7358149, -0.07530967, 0, 1, 0.4078431, 1,
-0.2316613, 0.996237, -0.3931816, 0, 1, 0.4117647, 1,
-0.2301303, -1.956116, -1.325764, 0, 1, 0.4196078, 1,
-0.2237949, -2.467372, -2.816062, 0, 1, 0.4235294, 1,
-0.2216622, 1.63297, -0.09233544, 0, 1, 0.4313726, 1,
-0.220028, 1.269051, -0.1366023, 0, 1, 0.4352941, 1,
-0.2176879, 1.284308, -0.6676363, 0, 1, 0.4431373, 1,
-0.2119767, -0.5410372, -3.603131, 0, 1, 0.4470588, 1,
-0.2114608, -1.309939, -2.145013, 0, 1, 0.454902, 1,
-0.2108961, 0.01997483, -1.892605, 0, 1, 0.4588235, 1,
-0.2080076, 2.481615, -0.7298117, 0, 1, 0.4666667, 1,
-0.2074821, -0.6408404, -2.408745, 0, 1, 0.4705882, 1,
-0.2061702, -1.093306, -3.688327, 0, 1, 0.4784314, 1,
-0.2048483, 0.9474962, 1.217822, 0, 1, 0.4823529, 1,
-0.2024337, -0.01195121, -2.185676, 0, 1, 0.4901961, 1,
-0.1974279, 0.7046623, -0.1012111, 0, 1, 0.4941176, 1,
-0.1940371, 1.38809, 1.196343, 0, 1, 0.5019608, 1,
-0.1936301, -1.031248, -1.724565, 0, 1, 0.509804, 1,
-0.1929777, 0.6195992, -1.333268, 0, 1, 0.5137255, 1,
-0.1912656, 0.5674409, -2.035434, 0, 1, 0.5215687, 1,
-0.1874252, 0.2350856, -0.8648597, 0, 1, 0.5254902, 1,
-0.1855801, -0.7468757, -3.189273, 0, 1, 0.5333334, 1,
-0.1827357, 0.4724719, 1.598618, 0, 1, 0.5372549, 1,
-0.1824065, -0.04741258, -2.26685, 0, 1, 0.5450981, 1,
-0.1780695, -1.232367, -2.876936, 0, 1, 0.5490196, 1,
-0.1749642, 0.4586987, -0.4988266, 0, 1, 0.5568628, 1,
-0.174526, 0.2146206, -0.9567238, 0, 1, 0.5607843, 1,
-0.1740754, 0.4864752, -0.4612406, 0, 1, 0.5686275, 1,
-0.17193, 0.0374885, -1.95369, 0, 1, 0.572549, 1,
-0.1718484, -0.1309141, -2.751919, 0, 1, 0.5803922, 1,
-0.1715016, 1.139805, -0.1184141, 0, 1, 0.5843138, 1,
-0.1693419, -0.3804705, -2.851565, 0, 1, 0.5921569, 1,
-0.1682416, 0.874721, -0.1637341, 0, 1, 0.5960785, 1,
-0.1674327, -0.4010147, -3.96641, 0, 1, 0.6039216, 1,
-0.1668916, 0.7216536, -0.3577933, 0, 1, 0.6117647, 1,
-0.1631432, -1.021369, -4.23895, 0, 1, 0.6156863, 1,
-0.1622734, 1.680845, 3.636696, 0, 1, 0.6235294, 1,
-0.1590133, -0.2793711, -2.013232, 0, 1, 0.627451, 1,
-0.155517, -0.0236024, -1.283769, 0, 1, 0.6352941, 1,
-0.1553551, -0.8108182, -3.377086, 0, 1, 0.6392157, 1,
-0.1534131, 0.6084263, -0.03108577, 0, 1, 0.6470588, 1,
-0.1463632, 0.114208, -2.523526, 0, 1, 0.6509804, 1,
-0.1455361, 0.2656861, -0.2083283, 0, 1, 0.6588235, 1,
-0.1450776, -1.22046, -2.660339, 0, 1, 0.6627451, 1,
-0.1425417, 1.394781, 0.01902165, 0, 1, 0.6705883, 1,
-0.1371131, -2.764744, -4.963977, 0, 1, 0.6745098, 1,
-0.1349263, -0.9255859, -3.541928, 0, 1, 0.682353, 1,
-0.1339223, 1.183026, 0.1090875, 0, 1, 0.6862745, 1,
-0.1335396, -0.9230523, -1.44968, 0, 1, 0.6941177, 1,
-0.127892, 0.1232237, -1.186491, 0, 1, 0.7019608, 1,
-0.12719, -0.9589092, -1.664344, 0, 1, 0.7058824, 1,
-0.1180932, -1.548591, -2.846317, 0, 1, 0.7137255, 1,
-0.1158437, 0.579345, -0.2684644, 0, 1, 0.7176471, 1,
-0.1138638, -0.5697774, -1.997653, 0, 1, 0.7254902, 1,
-0.1128717, 0.5321218, -1.15651, 0, 1, 0.7294118, 1,
-0.1119061, 1.649755, -1.260348, 0, 1, 0.7372549, 1,
-0.1032658, -0.9468066, -1.138565, 0, 1, 0.7411765, 1,
-0.1016423, -0.9673418, -2.677069, 0, 1, 0.7490196, 1,
-0.09968679, -0.5421016, -3.905548, 0, 1, 0.7529412, 1,
-0.09961984, -0.3744645, -1.649325, 0, 1, 0.7607843, 1,
-0.09410311, 0.4984594, -0.2341431, 0, 1, 0.7647059, 1,
-0.0925658, -1.317504, -2.364131, 0, 1, 0.772549, 1,
-0.09195738, 1.21844, -0.7993305, 0, 1, 0.7764706, 1,
-0.09066021, -0.03689313, -2.120653, 0, 1, 0.7843137, 1,
-0.09035446, -0.07449962, -2.493975, 0, 1, 0.7882353, 1,
-0.08545898, -0.7621091, -4.397378, 0, 1, 0.7960784, 1,
-0.08444309, 1.142456, 0.9095975, 0, 1, 0.8039216, 1,
-0.08394678, 0.6561876, -0.6174178, 0, 1, 0.8078431, 1,
-0.08210177, 0.8351931, -0.72211, 0, 1, 0.8156863, 1,
-0.08071394, 0.867752, -0.4694428, 0, 1, 0.8196079, 1,
-0.07925127, 0.6370389, -1.120217, 0, 1, 0.827451, 1,
-0.07862246, -0.5075783, -1.346763, 0, 1, 0.8313726, 1,
-0.07746598, 0.3778896, 1.019327, 0, 1, 0.8392157, 1,
-0.07694276, -0.7813819, -3.656224, 0, 1, 0.8431373, 1,
-0.07658535, 0.5262373, 2.82848, 0, 1, 0.8509804, 1,
-0.06888235, 0.718796, 1.246252, 0, 1, 0.854902, 1,
-0.06784704, -0.009585216, -3.678805, 0, 1, 0.8627451, 1,
-0.06467421, -1.626134, -2.85664, 0, 1, 0.8666667, 1,
-0.06386595, 1.333418, 0.7516611, 0, 1, 0.8745098, 1,
-0.06307148, 1.665341, 0.120361, 0, 1, 0.8784314, 1,
-0.06305923, -0.2606496, -3.299692, 0, 1, 0.8862745, 1,
-0.06104173, -0.2000177, -3.474726, 0, 1, 0.8901961, 1,
-0.05937576, -0.6086131, -1.970408, 0, 1, 0.8980392, 1,
-0.05093783, 1.536997, -0.07049278, 0, 1, 0.9058824, 1,
-0.05093721, -1.419008, -4.049748, 0, 1, 0.9098039, 1,
-0.049888, 1.475204, 1.36227, 0, 1, 0.9176471, 1,
-0.04912412, 0.4007929, 0.1278044, 0, 1, 0.9215686, 1,
-0.04883095, -0.8726914, -3.219442, 0, 1, 0.9294118, 1,
-0.04157033, -0.9848455, -2.757227, 0, 1, 0.9333333, 1,
-0.04066493, 1.260875, 1.537983, 0, 1, 0.9411765, 1,
-0.03630504, 0.08893702, -0.7702209, 0, 1, 0.945098, 1,
-0.03416476, -1.397073, -1.944407, 0, 1, 0.9529412, 1,
-0.03129249, 0.7238234, 1.466416, 0, 1, 0.9568627, 1,
-0.03077778, 0.1986266, -1.076441, 0, 1, 0.9647059, 1,
-0.03073629, 2.37019, 0.3140388, 0, 1, 0.9686275, 1,
-0.02917041, 1.402361, -0.6579546, 0, 1, 0.9764706, 1,
-0.0284432, -0.1931187, -3.621569, 0, 1, 0.9803922, 1,
-0.0271083, -0.05340242, -2.550978, 0, 1, 0.9882353, 1,
-0.02408605, 0.3352458, 1.686557, 0, 1, 0.9921569, 1,
-0.02406007, 0.03963978, -0.2375072, 0, 1, 1, 1,
-0.01716013, 0.3797975, -1.079832, 0, 0.9921569, 1, 1,
-0.01583246, -1.397187, -4.038501, 0, 0.9882353, 1, 1,
-0.01499955, 1.258991, 1.370097, 0, 0.9803922, 1, 1,
-0.01231906, 0.6113369, -0.1688734, 0, 0.9764706, 1, 1,
-0.008290077, -1.735721, -1.783473, 0, 0.9686275, 1, 1,
-0.002346592, -0.8425184, -2.985458, 0, 0.9647059, 1, 1,
-0.000670356, 0.2378892, -2.040526, 0, 0.9568627, 1, 1,
0.001359903, -1.194189, 3.379511, 0, 0.9529412, 1, 1,
0.009659495, 0.1827762, 0.3147146, 0, 0.945098, 1, 1,
0.01348994, -0.3262275, 2.064261, 0, 0.9411765, 1, 1,
0.01789942, -0.08197222, 2.325686, 0, 0.9333333, 1, 1,
0.01866089, 1.96331, 1.600185, 0, 0.9294118, 1, 1,
0.0213047, -0.3699245, 3.785742, 0, 0.9215686, 1, 1,
0.02220781, -1.480019, 2.839548, 0, 0.9176471, 1, 1,
0.02565634, -0.184741, 3.18188, 0, 0.9098039, 1, 1,
0.02593572, -0.367696, 2.521574, 0, 0.9058824, 1, 1,
0.02731061, -1.613048, 3.705267, 0, 0.8980392, 1, 1,
0.02754034, 0.0211067, 0.6343623, 0, 0.8901961, 1, 1,
0.02787728, 1.106035, -1.023241, 0, 0.8862745, 1, 1,
0.0331131, 0.003016601, 2.832175, 0, 0.8784314, 1, 1,
0.03359431, 0.1588525, 0.03235667, 0, 0.8745098, 1, 1,
0.03590633, -0.6367158, 2.762371, 0, 0.8666667, 1, 1,
0.03672639, -0.7924753, 2.435509, 0, 0.8627451, 1, 1,
0.04029429, -1.168606, 1.864247, 0, 0.854902, 1, 1,
0.0445262, 1.48305, 1.027368, 0, 0.8509804, 1, 1,
0.04554515, 0.3620774, 1.548239, 0, 0.8431373, 1, 1,
0.05074792, 0.1539208, 1.342492, 0, 0.8392157, 1, 1,
0.05217395, 1.671726, 0.8885574, 0, 0.8313726, 1, 1,
0.05436114, 0.6825151, 0.2677806, 0, 0.827451, 1, 1,
0.05954374, -0.2423521, 3.232617, 0, 0.8196079, 1, 1,
0.06423408, -1.913134, 3.989426, 0, 0.8156863, 1, 1,
0.06675973, 0.3217176, 0.9100016, 0, 0.8078431, 1, 1,
0.06993324, -1.876648, 2.970132, 0, 0.8039216, 1, 1,
0.07272793, -1.108959, 3.415352, 0, 0.7960784, 1, 1,
0.07357766, -1.68567, 3.362979, 0, 0.7882353, 1, 1,
0.07599279, -0.582931, 2.505181, 0, 0.7843137, 1, 1,
0.07699359, 0.3054031, 0.001544625, 0, 0.7764706, 1, 1,
0.07722629, -0.1674036, 3.926148, 0, 0.772549, 1, 1,
0.07915236, 0.6490396, 0.5131853, 0, 0.7647059, 1, 1,
0.08170149, 0.8421783, -1.279593, 0, 0.7607843, 1, 1,
0.08476199, -0.3519478, 3.250836, 0, 0.7529412, 1, 1,
0.0857791, 1.692964, 0.6652467, 0, 0.7490196, 1, 1,
0.08806816, -0.877629, 4.150637, 0, 0.7411765, 1, 1,
0.08972506, 0.9508802, 0.01872418, 0, 0.7372549, 1, 1,
0.09036273, -1.611225, 2.922715, 0, 0.7294118, 1, 1,
0.09212917, 0.4539338, 0.005294302, 0, 0.7254902, 1, 1,
0.09295695, -0.3793188, 3.389424, 0, 0.7176471, 1, 1,
0.09564149, 1.233651, 1.665531, 0, 0.7137255, 1, 1,
0.09973508, -0.7741449, 3.337725, 0, 0.7058824, 1, 1,
0.1073933, -0.7831677, 2.444637, 0, 0.6980392, 1, 1,
0.1089091, 0.6356761, -1.093383, 0, 0.6941177, 1, 1,
0.109258, 0.7167128, -0.8326582, 0, 0.6862745, 1, 1,
0.1093742, -0.1079597, 1.870329, 0, 0.682353, 1, 1,
0.1137248, 1.24494, -0.5351379, 0, 0.6745098, 1, 1,
0.1195067, 0.5394675, -0.5465948, 0, 0.6705883, 1, 1,
0.1221959, -1.570967, 4.41593, 0, 0.6627451, 1, 1,
0.1228609, -0.7498801, 4.040413, 0, 0.6588235, 1, 1,
0.123115, -0.2226831, 1.007164, 0, 0.6509804, 1, 1,
0.1274103, -0.1651129, 1.679674, 0, 0.6470588, 1, 1,
0.1279417, 0.9912055, 0.8013066, 0, 0.6392157, 1, 1,
0.1287507, 0.4106429, 1.01783, 0, 0.6352941, 1, 1,
0.1319158, -1.058381, 3.563505, 0, 0.627451, 1, 1,
0.1403031, -0.025819, 2.178769, 0, 0.6235294, 1, 1,
0.1407023, -0.7738159, 1.190105, 0, 0.6156863, 1, 1,
0.1452405, -0.09434892, 2.624059, 0, 0.6117647, 1, 1,
0.1455349, -0.843346, 3.452905, 0, 0.6039216, 1, 1,
0.1456469, 0.4965164, 0.813212, 0, 0.5960785, 1, 1,
0.1499664, 0.2844839, 0.2265957, 0, 0.5921569, 1, 1,
0.1577533, -0.3215574, 2.967102, 0, 0.5843138, 1, 1,
0.1653578, -1.140308, 3.983766, 0, 0.5803922, 1, 1,
0.1660029, -1.342896, 2.920474, 0, 0.572549, 1, 1,
0.1672512, -0.48524, 1.727415, 0, 0.5686275, 1, 1,
0.1702592, 0.4663269, 1.324318, 0, 0.5607843, 1, 1,
0.1746529, 0.05532454, 1.845495, 0, 0.5568628, 1, 1,
0.1754218, 1.370199, 0.5835605, 0, 0.5490196, 1, 1,
0.1756846, -0.5934275, 2.621322, 0, 0.5450981, 1, 1,
0.176292, -0.1335821, 2.925387, 0, 0.5372549, 1, 1,
0.1763836, -0.01539783, 3.81788, 0, 0.5333334, 1, 1,
0.1839519, -1.605144, 2.516195, 0, 0.5254902, 1, 1,
0.1879598, -1.139301, 3.469881, 0, 0.5215687, 1, 1,
0.1926284, -0.08718862, 1.373985, 0, 0.5137255, 1, 1,
0.1936114, 1.480919, -0.01478069, 0, 0.509804, 1, 1,
0.1959282, 1.466694, 1.816646, 0, 0.5019608, 1, 1,
0.2004467, 0.6398234, -0.5060083, 0, 0.4941176, 1, 1,
0.2040025, 0.9966297, 0.9474268, 0, 0.4901961, 1, 1,
0.2043409, -1.077625, 4.8431, 0, 0.4823529, 1, 1,
0.2081303, -0.7791833, 2.620121, 0, 0.4784314, 1, 1,
0.2163369, -0.03293439, 1.187183, 0, 0.4705882, 1, 1,
0.2208338, 1.639623, -0.7957965, 0, 0.4666667, 1, 1,
0.2221076, 1.279515, 0.1119519, 0, 0.4588235, 1, 1,
0.2221709, -0.4060195, 3.551545, 0, 0.454902, 1, 1,
0.225219, -1.948813, 4.037834, 0, 0.4470588, 1, 1,
0.2260913, 0.3288657, -0.4031788, 0, 0.4431373, 1, 1,
0.2278678, 0.1822285, 0.7340299, 0, 0.4352941, 1, 1,
0.2353481, -0.6605271, 3.331747, 0, 0.4313726, 1, 1,
0.2459916, 0.8320545, -0.9208202, 0, 0.4235294, 1, 1,
0.2497449, 1.911287, -0.8746881, 0, 0.4196078, 1, 1,
0.2523701, -1.432425, 4.340635, 0, 0.4117647, 1, 1,
0.2526639, -0.3416869, 1.677981, 0, 0.4078431, 1, 1,
0.2572655, -0.6039166, 3.633408, 0, 0.4, 1, 1,
0.2573601, -0.8948867, 2.288369, 0, 0.3921569, 1, 1,
0.2610262, 0.4400066, 0.4729373, 0, 0.3882353, 1, 1,
0.2617643, 0.1778995, 1.153516, 0, 0.3803922, 1, 1,
0.2620937, 0.2730132, 1.145637, 0, 0.3764706, 1, 1,
0.2688905, -0.9974643, 2.026376, 0, 0.3686275, 1, 1,
0.2712361, -0.005616949, 2.934294, 0, 0.3647059, 1, 1,
0.2733848, -0.8288953, 2.696536, 0, 0.3568628, 1, 1,
0.2745533, -0.01682227, 2.473221, 0, 0.3529412, 1, 1,
0.2751854, 1.379697, 0.8265666, 0, 0.345098, 1, 1,
0.2756661, 0.5005403, 3.016677, 0, 0.3411765, 1, 1,
0.2765388, 1.284139, 0.5497987, 0, 0.3333333, 1, 1,
0.2782212, 0.2657476, 0.7392721, 0, 0.3294118, 1, 1,
0.2786458, -0.8552181, 3.484053, 0, 0.3215686, 1, 1,
0.2789995, -0.8926163, 3.575271, 0, 0.3176471, 1, 1,
0.2793599, 1.24484, 0.1867303, 0, 0.3098039, 1, 1,
0.2803489, 0.0174811, 0.7591547, 0, 0.3058824, 1, 1,
0.2814361, -0.1271686, 1.687725, 0, 0.2980392, 1, 1,
0.2848302, 0.5386509, -0.2539141, 0, 0.2901961, 1, 1,
0.2852142, -0.5205554, -0.400353, 0, 0.2862745, 1, 1,
0.2870699, 0.5698787, 0.3632458, 0, 0.2784314, 1, 1,
0.2891824, -0.634492, 3.439872, 0, 0.2745098, 1, 1,
0.290759, -0.2341805, 1.836275, 0, 0.2666667, 1, 1,
0.2990058, 0.6323209, -1.637168, 0, 0.2627451, 1, 1,
0.3013528, -0.4151628, 3.696873, 0, 0.254902, 1, 1,
0.3080563, 0.3497152, 1.508871, 0, 0.2509804, 1, 1,
0.3089317, -1.265816, 3.393935, 0, 0.2431373, 1, 1,
0.3091459, 0.4692244, 0.584468, 0, 0.2392157, 1, 1,
0.3104996, 0.4826182, 0.4692944, 0, 0.2313726, 1, 1,
0.3125552, -0.5182947, 3.64087, 0, 0.227451, 1, 1,
0.3146795, 2.227771, 1.653055, 0, 0.2196078, 1, 1,
0.3152519, 0.3125168, 0.426148, 0, 0.2156863, 1, 1,
0.3173964, 0.1164848, 1.691737, 0, 0.2078431, 1, 1,
0.3198324, 0.9361609, 0.04817681, 0, 0.2039216, 1, 1,
0.3210458, -1.462053, 0.03825787, 0, 0.1960784, 1, 1,
0.3218911, 0.6813233, -0.8265162, 0, 0.1882353, 1, 1,
0.3224514, 0.6087505, 0.4375975, 0, 0.1843137, 1, 1,
0.3252198, 0.4153607, 1.54621, 0, 0.1764706, 1, 1,
0.3295706, -1.003205, 2.541566, 0, 0.172549, 1, 1,
0.3300417, 1.462219, 0.8630079, 0, 0.1647059, 1, 1,
0.3305601, 0.7915587, -2.547197, 0, 0.1607843, 1, 1,
0.331596, -0.8621546, 2.461769, 0, 0.1529412, 1, 1,
0.3402787, 1.711056, -1.625601, 0, 0.1490196, 1, 1,
0.3442682, -1.829265, 2.527757, 0, 0.1411765, 1, 1,
0.3503577, 0.1588035, 1.104666, 0, 0.1372549, 1, 1,
0.3529336, 0.2164178, -0.3142096, 0, 0.1294118, 1, 1,
0.3543254, 1.507877, -0.8493169, 0, 0.1254902, 1, 1,
0.3545997, 0.2509483, 0.852953, 0, 0.1176471, 1, 1,
0.3546649, -2.377025, 0.9546161, 0, 0.1137255, 1, 1,
0.3547825, 0.248601, 1.043748, 0, 0.1058824, 1, 1,
0.3563254, 0.2137393, -0.4175704, 0, 0.09803922, 1, 1,
0.3576134, 0.3946744, 0.5822267, 0, 0.09411765, 1, 1,
0.3611655, -0.3481856, 1.380048, 0, 0.08627451, 1, 1,
0.3621828, -0.495947, 4.077002, 0, 0.08235294, 1, 1,
0.3674006, -0.6668374, 3.119785, 0, 0.07450981, 1, 1,
0.3679661, -0.05211787, 0.8680499, 0, 0.07058824, 1, 1,
0.375039, -0.9922249, 1.707743, 0, 0.0627451, 1, 1,
0.383284, 1.724876, 0.4850091, 0, 0.05882353, 1, 1,
0.3834953, -0.1466778, 2.021943, 0, 0.05098039, 1, 1,
0.3847327, -1.961052, 1.892451, 0, 0.04705882, 1, 1,
0.3948179, -0.8993569, 1.387689, 0, 0.03921569, 1, 1,
0.398248, -1.35545, 0.2013933, 0, 0.03529412, 1, 1,
0.3992498, 0.6653296, -0.3265705, 0, 0.02745098, 1, 1,
0.4006136, -0.5616909, 3.142503, 0, 0.02352941, 1, 1,
0.401442, 0.02689833, 2.466529, 0, 0.01568628, 1, 1,
0.4091642, 0.1588527, 2.754677, 0, 0.01176471, 1, 1,
0.410086, 1.645489, 0.4322216, 0, 0.003921569, 1, 1,
0.4145343, 0.08918577, 1.657861, 0.003921569, 0, 1, 1,
0.4175787, -1.512533, 1.052461, 0.007843138, 0, 1, 1,
0.4196593, 0.2346503, 2.465462, 0.01568628, 0, 1, 1,
0.4209989, -0.7596667, 2.306009, 0.01960784, 0, 1, 1,
0.4256191, -1.260292, 2.97315, 0.02745098, 0, 1, 1,
0.4258758, -0.3562529, 0.3603753, 0.03137255, 0, 1, 1,
0.4314056, -0.2141344, 2.5466, 0.03921569, 0, 1, 1,
0.4336024, 0.4116314, 1.218174, 0.04313726, 0, 1, 1,
0.4356258, -1.936783, 1.970967, 0.05098039, 0, 1, 1,
0.4357812, 0.4252363, 0.6653447, 0.05490196, 0, 1, 1,
0.4360256, 0.5969792, -0.6700895, 0.0627451, 0, 1, 1,
0.4411454, -0.07957209, 1.840742, 0.06666667, 0, 1, 1,
0.4412957, -0.6458114, 2.633754, 0.07450981, 0, 1, 1,
0.4458713, -0.2642354, 1.944212, 0.07843138, 0, 1, 1,
0.4459211, -0.7865145, 2.15724, 0.08627451, 0, 1, 1,
0.4549493, 1.511367, -0.3414906, 0.09019608, 0, 1, 1,
0.4567128, 1.254761, 0.7048165, 0.09803922, 0, 1, 1,
0.4575031, 0.8661548, 1.708601, 0.1058824, 0, 1, 1,
0.4611744, -1.314922, 2.521154, 0.1098039, 0, 1, 1,
0.4689852, -1.484395, 2.581381, 0.1176471, 0, 1, 1,
0.4700058, 0.2325238, 1.322887, 0.1215686, 0, 1, 1,
0.4735539, -0.9717191, 1.09335, 0.1294118, 0, 1, 1,
0.4769076, -0.8093087, 1.711313, 0.1333333, 0, 1, 1,
0.4784502, -0.5669733, 2.455506, 0.1411765, 0, 1, 1,
0.4930015, -0.1531741, 2.644387, 0.145098, 0, 1, 1,
0.4948699, -1.825693, 3.320874, 0.1529412, 0, 1, 1,
0.4995406, 0.6584054, 2.451728, 0.1568628, 0, 1, 1,
0.5027434, 0.2342597, 0.9028337, 0.1647059, 0, 1, 1,
0.50388, -0.7862455, 1.967175, 0.1686275, 0, 1, 1,
0.5064057, -0.5972807, 3.719411, 0.1764706, 0, 1, 1,
0.508811, -1.221861, 2.788419, 0.1803922, 0, 1, 1,
0.509504, -0.01551213, 1.470501, 0.1882353, 0, 1, 1,
0.5099754, -0.1159115, 0.03710264, 0.1921569, 0, 1, 1,
0.5109321, 0.4030848, -0.697619, 0.2, 0, 1, 1,
0.5124456, 0.5954142, 1.173709, 0.2078431, 0, 1, 1,
0.5186625, -0.4759978, 2.206451, 0.2117647, 0, 1, 1,
0.5189708, -1.060742, 1.907061, 0.2196078, 0, 1, 1,
0.5193378, -0.9242154, 0.8617446, 0.2235294, 0, 1, 1,
0.5227746, 0.8451746, 0.05368186, 0.2313726, 0, 1, 1,
0.5261585, 0.02540796, -0.255155, 0.2352941, 0, 1, 1,
0.5269457, 0.4300857, 1.312719, 0.2431373, 0, 1, 1,
0.5336056, -0.7014948, 1.925066, 0.2470588, 0, 1, 1,
0.538593, 0.1074827, 1.481001, 0.254902, 0, 1, 1,
0.544972, 0.7321503, -0.1285187, 0.2588235, 0, 1, 1,
0.5450072, 0.06693478, 0.4587273, 0.2666667, 0, 1, 1,
0.5587626, 0.1874112, 1.638603, 0.2705882, 0, 1, 1,
0.5664699, 0.736241, 2.187078, 0.2784314, 0, 1, 1,
0.5701507, 0.8725111, -0.04830293, 0.282353, 0, 1, 1,
0.5721353, -2.026895, 3.921478, 0.2901961, 0, 1, 1,
0.5764492, -0.600071, 4.825564, 0.2941177, 0, 1, 1,
0.5849379, 0.08077393, 1.511881, 0.3019608, 0, 1, 1,
0.5853415, 0.7853357, -0.0375388, 0.3098039, 0, 1, 1,
0.5921112, 0.3477437, 0.7954001, 0.3137255, 0, 1, 1,
0.5929507, 2.498793, -0.3010556, 0.3215686, 0, 1, 1,
0.5943816, -0.6551178, 2.257082, 0.3254902, 0, 1, 1,
0.5962747, -0.5452614, 3.331968, 0.3333333, 0, 1, 1,
0.5984386, 0.6756975, 1.393539, 0.3372549, 0, 1, 1,
0.6065508, 0.8269926, -0.1246099, 0.345098, 0, 1, 1,
0.6081785, -1.710159, 2.827523, 0.3490196, 0, 1, 1,
0.6083366, 0.309833, 1.257058, 0.3568628, 0, 1, 1,
0.6156951, -0.3634759, 2.631777, 0.3607843, 0, 1, 1,
0.6201742, -1.139095, 3.968142, 0.3686275, 0, 1, 1,
0.6236651, 1.465016, -0.1229582, 0.372549, 0, 1, 1,
0.6240017, 0.3080984, 1.483512, 0.3803922, 0, 1, 1,
0.6252697, 0.6868032, 2.638524, 0.3843137, 0, 1, 1,
0.6254076, 0.496618, -0.3778504, 0.3921569, 0, 1, 1,
0.6273874, -0.1576426, 1.92886, 0.3960784, 0, 1, 1,
0.6274748, -0.8463097, 2.469149, 0.4039216, 0, 1, 1,
0.6275843, -0.3630153, 1.415417, 0.4117647, 0, 1, 1,
0.6278599, 0.9938734, -1.110728, 0.4156863, 0, 1, 1,
0.6299578, -1.037404, 2.895685, 0.4235294, 0, 1, 1,
0.6331164, -1.281, 2.314108, 0.427451, 0, 1, 1,
0.6464604, -2.839818, 3.668277, 0.4352941, 0, 1, 1,
0.647141, 1.085092, 0.8786045, 0.4392157, 0, 1, 1,
0.6608762, -1.210454, 3.356218, 0.4470588, 0, 1, 1,
0.6623824, 0.4470023, 0.6996312, 0.4509804, 0, 1, 1,
0.6637575, -1.428002, 3.431901, 0.4588235, 0, 1, 1,
0.6680866, -1.40646, 3.63496, 0.4627451, 0, 1, 1,
0.6699629, -0.3368277, 2.873592, 0.4705882, 0, 1, 1,
0.673326, -1.220142, 2.875238, 0.4745098, 0, 1, 1,
0.6738926, -0.6834211, 0.5102227, 0.4823529, 0, 1, 1,
0.6761376, 0.08203268, 1.773628, 0.4862745, 0, 1, 1,
0.6761761, -0.3998531, 4.888764, 0.4941176, 0, 1, 1,
0.6774405, -0.1627526, 3.405454, 0.5019608, 0, 1, 1,
0.6832079, 1.841718, 1.331265, 0.5058824, 0, 1, 1,
0.6961582, -0.3626827, 2.10398, 0.5137255, 0, 1, 1,
0.6998138, -0.6317002, 2.759036, 0.5176471, 0, 1, 1,
0.6998516, -1.110248, 2.631097, 0.5254902, 0, 1, 1,
0.7022344, -1.193763, 1.581531, 0.5294118, 0, 1, 1,
0.7028206, -1.064191, 2.49396, 0.5372549, 0, 1, 1,
0.7059897, 0.6071621, 0.6824808, 0.5411765, 0, 1, 1,
0.7106631, -1.26349, 3.027296, 0.5490196, 0, 1, 1,
0.7211504, -1.999217, 3.982996, 0.5529412, 0, 1, 1,
0.7233901, -0.3315969, 0.6877438, 0.5607843, 0, 1, 1,
0.7234069, -0.5585607, 2.778532, 0.5647059, 0, 1, 1,
0.7262095, 0.2279201, 0.5121608, 0.572549, 0, 1, 1,
0.7268984, 0.4206721, 1.499406, 0.5764706, 0, 1, 1,
0.7384129, -1.099906, 4.596296, 0.5843138, 0, 1, 1,
0.7458048, 0.08656434, 0.8890477, 0.5882353, 0, 1, 1,
0.7467414, 0.604871, -0.975082, 0.5960785, 0, 1, 1,
0.7520732, 0.9279572, 0.5753636, 0.6039216, 0, 1, 1,
0.7544903, -0.2633693, 0.6458435, 0.6078432, 0, 1, 1,
0.7571712, -1.965937, 3.784536, 0.6156863, 0, 1, 1,
0.7585797, -1.090693, 2.983038, 0.6196079, 0, 1, 1,
0.7590041, 1.186688, -0.1643894, 0.627451, 0, 1, 1,
0.7593676, -1.234464, 2.098735, 0.6313726, 0, 1, 1,
0.7613075, -0.6482376, 0.8045344, 0.6392157, 0, 1, 1,
0.7616291, 0.2452829, 1.259595, 0.6431373, 0, 1, 1,
0.764148, -0.7676074, 2.028358, 0.6509804, 0, 1, 1,
0.768481, 1.214264, -0.2198367, 0.654902, 0, 1, 1,
0.768841, -1.385559, 2.407551, 0.6627451, 0, 1, 1,
0.7699754, -0.6697133, 1.576936, 0.6666667, 0, 1, 1,
0.7700601, 0.2751605, 0.8528309, 0.6745098, 0, 1, 1,
0.7787012, -0.509339, 1.90205, 0.6784314, 0, 1, 1,
0.7805732, 0.9404861, 1.380141, 0.6862745, 0, 1, 1,
0.7824796, -1.918567, 2.938065, 0.6901961, 0, 1, 1,
0.7920799, -1.044163, 2.879879, 0.6980392, 0, 1, 1,
0.7934813, 0.4131439, 1.209045, 0.7058824, 0, 1, 1,
0.7939762, -0.07052547, 2.749739, 0.7098039, 0, 1, 1,
0.7947741, 0.1132796, 3.48633, 0.7176471, 0, 1, 1,
0.798727, -0.9034923, 1.783198, 0.7215686, 0, 1, 1,
0.7988807, 0.3774964, -0.5242161, 0.7294118, 0, 1, 1,
0.8005818, 0.0275955, 0.7347372, 0.7333333, 0, 1, 1,
0.8045399, 0.544629, 1.064022, 0.7411765, 0, 1, 1,
0.8050461, -2.340482, 3.03357, 0.7450981, 0, 1, 1,
0.8061307, -0.9485818, 3.740781, 0.7529412, 0, 1, 1,
0.8124395, 1.373541, 0.1444592, 0.7568628, 0, 1, 1,
0.8146296, 0.1605632, 1.78398, 0.7647059, 0, 1, 1,
0.8172325, -0.7857555, 2.751164, 0.7686275, 0, 1, 1,
0.8182765, -0.6851484, 2.595079, 0.7764706, 0, 1, 1,
0.8200796, -0.5296791, 1.990785, 0.7803922, 0, 1, 1,
0.8235363, -0.3998712, 2.675961, 0.7882353, 0, 1, 1,
0.8250912, -1.636779, 4.108259, 0.7921569, 0, 1, 1,
0.8267248, -0.6633465, 2.261018, 0.8, 0, 1, 1,
0.8274983, 0.2571283, 2.304715, 0.8078431, 0, 1, 1,
0.8290818, -0.4244022, 1.872333, 0.8117647, 0, 1, 1,
0.8348152, -0.4252184, 2.426502, 0.8196079, 0, 1, 1,
0.8402705, 0.5312603, -1.416188, 0.8235294, 0, 1, 1,
0.8482322, -0.5460392, 2.132254, 0.8313726, 0, 1, 1,
0.8512305, 0.3301304, -0.3443114, 0.8352941, 0, 1, 1,
0.8532953, -0.2193464, 2.893409, 0.8431373, 0, 1, 1,
0.8545238, 1.078399, 0.9316545, 0.8470588, 0, 1, 1,
0.8564849, -1.22668, 1.715533, 0.854902, 0, 1, 1,
0.8568325, -1.045971, 1.267008, 0.8588235, 0, 1, 1,
0.8659056, 1.097498, 0.4456525, 0.8666667, 0, 1, 1,
0.8668309, 1.728861, -1.243333, 0.8705882, 0, 1, 1,
0.8685657, -0.4448176, 1.557318, 0.8784314, 0, 1, 1,
0.8701483, 0.1870493, 1.459785, 0.8823529, 0, 1, 1,
0.8725735, -1.62447, 3.323333, 0.8901961, 0, 1, 1,
0.8738852, 0.01265553, 1.536624, 0.8941177, 0, 1, 1,
0.8774886, 1.811857, 0.3389075, 0.9019608, 0, 1, 1,
0.878346, 0.3342479, 3.22753, 0.9098039, 0, 1, 1,
0.8792714, 0.816257, -1.4721, 0.9137255, 0, 1, 1,
0.8819125, 0.9869231, 0.9536729, 0.9215686, 0, 1, 1,
0.8854346, 0.5546552, 2.011256, 0.9254902, 0, 1, 1,
0.8917546, 0.3986729, 2.81395, 0.9333333, 0, 1, 1,
0.8925246, 0.1546226, 1.890871, 0.9372549, 0, 1, 1,
0.8956059, 0.09860047, 1.154508, 0.945098, 0, 1, 1,
0.9013766, -1.080092, 2.557766, 0.9490196, 0, 1, 1,
0.9029234, -1.273163, 2.07959, 0.9568627, 0, 1, 1,
0.9075631, -0.9290698, 2.035251, 0.9607843, 0, 1, 1,
0.908457, -0.5244908, 2.522921, 0.9686275, 0, 1, 1,
0.909847, 0.03520557, 0.6543381, 0.972549, 0, 1, 1,
0.9127966, 0.1443132, 2.205255, 0.9803922, 0, 1, 1,
0.9153918, 1.089663, -0.2530553, 0.9843137, 0, 1, 1,
0.916748, 0.9568304, 1.148844, 0.9921569, 0, 1, 1,
0.9231923, -0.4540339, 1.18298, 0.9960784, 0, 1, 1,
0.9256467, 0.9215684, 1.166454, 1, 0, 0.9960784, 1,
0.9265975, 0.5070572, 0.7037874, 1, 0, 0.9882353, 1,
0.9345392, 1.441329, 0.472856, 1, 0, 0.9843137, 1,
0.9350607, -0.5080567, 2.669037, 1, 0, 0.9764706, 1,
0.9366732, -0.9235456, 1.49756, 1, 0, 0.972549, 1,
0.9383936, 0.4190231, 1.21118, 1, 0, 0.9647059, 1,
0.9448411, 1.219084, 3.089751, 1, 0, 0.9607843, 1,
0.9618509, 1.499239, 0.420994, 1, 0, 0.9529412, 1,
0.9648702, 0.2091827, 1.552858, 1, 0, 0.9490196, 1,
0.9663025, -1.073835, 2.169415, 1, 0, 0.9411765, 1,
0.9745435, 0.6027456, 2.492735, 1, 0, 0.9372549, 1,
0.9756936, -0.3833998, 2.159003, 1, 0, 0.9294118, 1,
0.9810625, 0.8567642, 2.221236, 1, 0, 0.9254902, 1,
0.9833896, -0.9452915, 2.113496, 1, 0, 0.9176471, 1,
0.9936004, 0.1027169, 1.988668, 1, 0, 0.9137255, 1,
0.9997151, -0.5392591, 0.1270499, 1, 0, 0.9058824, 1,
1.002949, -0.3729106, 2.859735, 1, 0, 0.9019608, 1,
1.01434, -0.7556934, 3.275887, 1, 0, 0.8941177, 1,
1.021703, -0.9699345, 2.795528, 1, 0, 0.8862745, 1,
1.035942, -0.6084728, -0.2379304, 1, 0, 0.8823529, 1,
1.042786, 0.9257116, -0.2267256, 1, 0, 0.8745098, 1,
1.043653, -0.4379533, 1.362236, 1, 0, 0.8705882, 1,
1.044571, -1.539216, 3.098927, 1, 0, 0.8627451, 1,
1.04563, -0.9246442, 1.683774, 1, 0, 0.8588235, 1,
1.052688, -0.7310507, 2.211526, 1, 0, 0.8509804, 1,
1.056042, 0.05643283, 0.5448768, 1, 0, 0.8470588, 1,
1.059127, -0.660919, 1.086666, 1, 0, 0.8392157, 1,
1.063185, -0.1150112, 2.299093, 1, 0, 0.8352941, 1,
1.065022, 0.4146943, 0.5837935, 1, 0, 0.827451, 1,
1.06614, 2.06071, -0.6956308, 1, 0, 0.8235294, 1,
1.07837, -1.457666, 1.740849, 1, 0, 0.8156863, 1,
1.078408, -0.03232769, 0.1761633, 1, 0, 0.8117647, 1,
1.08135, -0.3547203, 0.2031652, 1, 0, 0.8039216, 1,
1.082651, 0.4748258, 3.047964, 1, 0, 0.7960784, 1,
1.085553, 0.2618571, 1.932773, 1, 0, 0.7921569, 1,
1.087088, -0.92149, 2.138553, 1, 0, 0.7843137, 1,
1.095606, 0.7551425, 1.74168, 1, 0, 0.7803922, 1,
1.09735, -0.1325312, 2.154185, 1, 0, 0.772549, 1,
1.099533, -0.3712368, 0.7111651, 1, 0, 0.7686275, 1,
1.100449, 0.5755772, 1.515145, 1, 0, 0.7607843, 1,
1.108484, -0.5081619, 1.82428, 1, 0, 0.7568628, 1,
1.117007, 0.7830499, 2.442029, 1, 0, 0.7490196, 1,
1.124084, 0.3897437, 0.6902915, 1, 0, 0.7450981, 1,
1.126519, -1.092337, 2.268595, 1, 0, 0.7372549, 1,
1.128973, 0.3277591, 3.529751, 1, 0, 0.7333333, 1,
1.131332, -0.4036433, 1.583794, 1, 0, 0.7254902, 1,
1.131578, -0.5497817, 3.760201, 1, 0, 0.7215686, 1,
1.136114, -0.2097061, 1.818808, 1, 0, 0.7137255, 1,
1.139753, 0.5173657, 1.050087, 1, 0, 0.7098039, 1,
1.169984, 0.9725956, 1.78069, 1, 0, 0.7019608, 1,
1.172976, -0.09557063, 2.378767, 1, 0, 0.6941177, 1,
1.187871, -0.9440074, 2.530798, 1, 0, 0.6901961, 1,
1.202399, 0.4728163, 1.074971, 1, 0, 0.682353, 1,
1.203655, -0.5574507, 1.621206, 1, 0, 0.6784314, 1,
1.204313, 1.132098, 1.757789, 1, 0, 0.6705883, 1,
1.206249, 0.03639546, 1.49113, 1, 0, 0.6666667, 1,
1.208082, 0.7883905, 2.007169, 1, 0, 0.6588235, 1,
1.218437, -0.5513077, 0.1719853, 1, 0, 0.654902, 1,
1.221352, 0.5989181, 2.662081, 1, 0, 0.6470588, 1,
1.222048, 0.2955607, -0.5932065, 1, 0, 0.6431373, 1,
1.228434, 0.8672256, 1.088807, 1, 0, 0.6352941, 1,
1.232733, 0.1797756, 1.320696, 1, 0, 0.6313726, 1,
1.234865, -0.6239135, 4.102298, 1, 0, 0.6235294, 1,
1.23713, -0.5823331, 2.595414, 1, 0, 0.6196079, 1,
1.237922, 0.3703333, -1.236943, 1, 0, 0.6117647, 1,
1.240855, 0.453688, 1.679669, 1, 0, 0.6078432, 1,
1.243543, 1.265064, 2.365812, 1, 0, 0.6, 1,
1.267826, -0.6726539, 3.153044, 1, 0, 0.5921569, 1,
1.275149, -0.8851599, 4.390619, 1, 0, 0.5882353, 1,
1.277566, -1.138079, 2.009701, 1, 0, 0.5803922, 1,
1.290546, 0.8795876, 2.596056, 1, 0, 0.5764706, 1,
1.290558, -0.1957247, 2.84766, 1, 0, 0.5686275, 1,
1.295043, -0.8480274, 1.592162, 1, 0, 0.5647059, 1,
1.301034, -1.447194, 1.019826, 1, 0, 0.5568628, 1,
1.301643, 0.1389837, 2.300086, 1, 0, 0.5529412, 1,
1.303112, 0.3507506, 1.61784, 1, 0, 0.5450981, 1,
1.306, 0.1775848, 1.911487, 1, 0, 0.5411765, 1,
1.31415, 0.4663285, 2.107953, 1, 0, 0.5333334, 1,
1.315873, 1.162634, 0.2603503, 1, 0, 0.5294118, 1,
1.316868, -0.970503, 2.831092, 1, 0, 0.5215687, 1,
1.318811, 0.8394164, 2.22366, 1, 0, 0.5176471, 1,
1.319329, 0.3358773, 0.02028273, 1, 0, 0.509804, 1,
1.322276, -0.9337372, 0.5653051, 1, 0, 0.5058824, 1,
1.328094, -0.5983365, 2.827189, 1, 0, 0.4980392, 1,
1.331267, 0.09757458, 1.28192, 1, 0, 0.4901961, 1,
1.332203, 0.7521126, 1.743539, 1, 0, 0.4862745, 1,
1.341471, -0.6546973, 1.924543, 1, 0, 0.4784314, 1,
1.364158, -0.1105001, 2.221491, 1, 0, 0.4745098, 1,
1.372006, 0.7891633, 1.650326, 1, 0, 0.4666667, 1,
1.382075, -0.428022, 0.9225503, 1, 0, 0.4627451, 1,
1.391469, -0.7118433, 2.210174, 1, 0, 0.454902, 1,
1.392984, 0.9459433, 3.541959, 1, 0, 0.4509804, 1,
1.399251, 1.82687, 0.6000716, 1, 0, 0.4431373, 1,
1.403445, -0.07029045, 2.307532, 1, 0, 0.4392157, 1,
1.406061, -0.6281607, 0.3392622, 1, 0, 0.4313726, 1,
1.406531, 0.4020314, 0.46056, 1, 0, 0.427451, 1,
1.407531, 0.3121617, 1.411551, 1, 0, 0.4196078, 1,
1.414932, -1.63758, 2.507547, 1, 0, 0.4156863, 1,
1.415785, 0.7449339, -0.1568158, 1, 0, 0.4078431, 1,
1.434766, -0.3669989, 2.049217, 1, 0, 0.4039216, 1,
1.46765, 0.08402057, 0.7255613, 1, 0, 0.3960784, 1,
1.474169, -1.605532, 0.1703474, 1, 0, 0.3882353, 1,
1.479461, 0.3426062, -0.5643644, 1, 0, 0.3843137, 1,
1.490947, -0.6754476, 0.5808789, 1, 0, 0.3764706, 1,
1.492665, 0.9037707, 1.050334, 1, 0, 0.372549, 1,
1.494528, 1.421924, 1.573586, 1, 0, 0.3647059, 1,
1.511256, -1.377217, 2.654698, 1, 0, 0.3607843, 1,
1.518191, -1.156793, 2.057983, 1, 0, 0.3529412, 1,
1.521382, -0.979062, 1.180057, 1, 0, 0.3490196, 1,
1.536567, 2.071554, 1.041006, 1, 0, 0.3411765, 1,
1.546282, 0.7918797, 0.6740691, 1, 0, 0.3372549, 1,
1.560565, 0.6426386, 1.430423, 1, 0, 0.3294118, 1,
1.566662, -0.2886307, 0.7500933, 1, 0, 0.3254902, 1,
1.568958, 0.1997698, 0.5250346, 1, 0, 0.3176471, 1,
1.57996, -1.50485, 1.105816, 1, 0, 0.3137255, 1,
1.584016, 1.865141, 0.6559856, 1, 0, 0.3058824, 1,
1.598329, -0.2390741, 1.769814, 1, 0, 0.2980392, 1,
1.601326, 1.11726, 1.12207, 1, 0, 0.2941177, 1,
1.601644, -1.413812, 3.155646, 1, 0, 0.2862745, 1,
1.610574, -0.2677424, 3.340642, 1, 0, 0.282353, 1,
1.612433, 0.07278764, 2.048863, 1, 0, 0.2745098, 1,
1.618194, -1.643941, 0.3342558, 1, 0, 0.2705882, 1,
1.624796, 0.05857226, 0.4506599, 1, 0, 0.2627451, 1,
1.630376, -1.211159, 2.625755, 1, 0, 0.2588235, 1,
1.638569, -0.3204164, 2.914202, 1, 0, 0.2509804, 1,
1.639354, 0.4872437, 0.427835, 1, 0, 0.2470588, 1,
1.660393, 0.639909, 2.146552, 1, 0, 0.2392157, 1,
1.663806, -0.2203583, 2.050411, 1, 0, 0.2352941, 1,
1.690489, -0.3613334, 2.17779, 1, 0, 0.227451, 1,
1.699131, -0.7097756, 3.793687, 1, 0, 0.2235294, 1,
1.707398, -1.150091, 1.539108, 1, 0, 0.2156863, 1,
1.726416, 0.9527385, 0.07775007, 1, 0, 0.2117647, 1,
1.741665, -1.245744, 2.746219, 1, 0, 0.2039216, 1,
1.742106, 0.9556119, 1.579413, 1, 0, 0.1960784, 1,
1.752664, 0.577874, 2.122729, 1, 0, 0.1921569, 1,
1.765901, 0.8519339, -0.7690501, 1, 0, 0.1843137, 1,
1.788083, 0.4731132, 1.422873, 1, 0, 0.1803922, 1,
1.802371, 1.266285, 2.67553, 1, 0, 0.172549, 1,
1.812539, 1.265253, 0.537078, 1, 0, 0.1686275, 1,
1.844006, 1.887543, 0.07978006, 1, 0, 0.1607843, 1,
1.85972, 0.3689139, 0.4538121, 1, 0, 0.1568628, 1,
1.881591, 0.1892237, 0.433723, 1, 0, 0.1490196, 1,
1.896491, -0.4672031, 1.822344, 1, 0, 0.145098, 1,
1.905342, -1.600966, 3.04707, 1, 0, 0.1372549, 1,
1.934685, 1.931802, 0.4861407, 1, 0, 0.1333333, 1,
1.970609, -0.6541364, 1.680486, 1, 0, 0.1254902, 1,
2.008351, 0.8325256, 1.291588, 1, 0, 0.1215686, 1,
2.021839, 0.3357842, 2.596138, 1, 0, 0.1137255, 1,
2.049099, 0.3133831, -1.208889, 1, 0, 0.1098039, 1,
2.064051, 0.5675426, 2.452408, 1, 0, 0.1019608, 1,
2.087997, -2.717869, 2.63809, 1, 0, 0.09411765, 1,
2.089389, -0.9722695, 0.8893625, 1, 0, 0.09019608, 1,
2.17844, -0.02955472, -0.3298434, 1, 0, 0.08235294, 1,
2.39404, 0.3573148, 2.330023, 1, 0, 0.07843138, 1,
2.400595, -0.649626, 3.864442, 1, 0, 0.07058824, 1,
2.466149, -1.244451, 2.362602, 1, 0, 0.06666667, 1,
2.479073, -1.514632, 0.6222435, 1, 0, 0.05882353, 1,
2.491562, -0.591125, 2.594294, 1, 0, 0.05490196, 1,
2.533975, -1.296998, 0.7116072, 1, 0, 0.04705882, 1,
2.574058, -1.591707, 2.31917, 1, 0, 0.04313726, 1,
2.604953, -0.6182896, 0.7287684, 1, 0, 0.03529412, 1,
2.685801, 1.321758, 2.044619, 1, 0, 0.03137255, 1,
2.694436, -0.1155103, 1.724653, 1, 0, 0.02352941, 1,
2.695117, -0.4471798, 2.884982, 1, 0, 0.01960784, 1,
2.714551, -0.6420007, 2.363647, 1, 0, 0.01176471, 1,
2.720734, -0.2187328, 2.223332, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.01079965, -3.775542, -7.286057, 0, -0.5, 0.5, 0.5,
-0.01079965, -3.775542, -7.286057, 1, -0.5, 0.5, 0.5,
-0.01079965, -3.775542, -7.286057, 1, 1.5, 0.5, 0.5,
-0.01079965, -3.775542, -7.286057, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.668324, -0.07957089, -7.286057, 0, -0.5, 0.5, 0.5,
-3.668324, -0.07957089, -7.286057, 1, -0.5, 0.5, 0.5,
-3.668324, -0.07957089, -7.286057, 1, 1.5, 0.5, 0.5,
-3.668324, -0.07957089, -7.286057, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.668324, -3.775542, -0.3163757, 0, -0.5, 0.5, 0.5,
-3.668324, -3.775542, -0.3163757, 1, -0.5, 0.5, 0.5,
-3.668324, -3.775542, -0.3163757, 1, 1.5, 0.5, 0.5,
-3.668324, -3.775542, -0.3163757, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -2.922626, -5.67767,
2, -2.922626, -5.67767,
-2, -2.922626, -5.67767,
-2, -3.064779, -5.945734,
-1, -2.922626, -5.67767,
-1, -3.064779, -5.945734,
0, -2.922626, -5.67767,
0, -3.064779, -5.945734,
1, -2.922626, -5.67767,
1, -3.064779, -5.945734,
2, -2.922626, -5.67767,
2, -3.064779, -5.945734
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.349084, -6.481863, 0, -0.5, 0.5, 0.5,
-2, -3.349084, -6.481863, 1, -0.5, 0.5, 0.5,
-2, -3.349084, -6.481863, 1, 1.5, 0.5, 0.5,
-2, -3.349084, -6.481863, 0, 1.5, 0.5, 0.5,
-1, -3.349084, -6.481863, 0, -0.5, 0.5, 0.5,
-1, -3.349084, -6.481863, 1, -0.5, 0.5, 0.5,
-1, -3.349084, -6.481863, 1, 1.5, 0.5, 0.5,
-1, -3.349084, -6.481863, 0, 1.5, 0.5, 0.5,
0, -3.349084, -6.481863, 0, -0.5, 0.5, 0.5,
0, -3.349084, -6.481863, 1, -0.5, 0.5, 0.5,
0, -3.349084, -6.481863, 1, 1.5, 0.5, 0.5,
0, -3.349084, -6.481863, 0, 1.5, 0.5, 0.5,
1, -3.349084, -6.481863, 0, -0.5, 0.5, 0.5,
1, -3.349084, -6.481863, 1, -0.5, 0.5, 0.5,
1, -3.349084, -6.481863, 1, 1.5, 0.5, 0.5,
1, -3.349084, -6.481863, 0, 1.5, 0.5, 0.5,
2, -3.349084, -6.481863, 0, -0.5, 0.5, 0.5,
2, -3.349084, -6.481863, 1, -0.5, 0.5, 0.5,
2, -3.349084, -6.481863, 1, 1.5, 0.5, 0.5,
2, -3.349084, -6.481863, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.82428, -2, -5.67767,
-2.82428, 2, -5.67767,
-2.82428, -2, -5.67767,
-2.964954, -2, -5.945734,
-2.82428, -1, -5.67767,
-2.964954, -1, -5.945734,
-2.82428, 0, -5.67767,
-2.964954, 0, -5.945734,
-2.82428, 1, -5.67767,
-2.964954, 1, -5.945734,
-2.82428, 2, -5.67767,
-2.964954, 2, -5.945734
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.246302, -2, -6.481863, 0, -0.5, 0.5, 0.5,
-3.246302, -2, -6.481863, 1, -0.5, 0.5, 0.5,
-3.246302, -2, -6.481863, 1, 1.5, 0.5, 0.5,
-3.246302, -2, -6.481863, 0, 1.5, 0.5, 0.5,
-3.246302, -1, -6.481863, 0, -0.5, 0.5, 0.5,
-3.246302, -1, -6.481863, 1, -0.5, 0.5, 0.5,
-3.246302, -1, -6.481863, 1, 1.5, 0.5, 0.5,
-3.246302, -1, -6.481863, 0, 1.5, 0.5, 0.5,
-3.246302, 0, -6.481863, 0, -0.5, 0.5, 0.5,
-3.246302, 0, -6.481863, 1, -0.5, 0.5, 0.5,
-3.246302, 0, -6.481863, 1, 1.5, 0.5, 0.5,
-3.246302, 0, -6.481863, 0, 1.5, 0.5, 0.5,
-3.246302, 1, -6.481863, 0, -0.5, 0.5, 0.5,
-3.246302, 1, -6.481863, 1, -0.5, 0.5, 0.5,
-3.246302, 1, -6.481863, 1, 1.5, 0.5, 0.5,
-3.246302, 1, -6.481863, 0, 1.5, 0.5, 0.5,
-3.246302, 2, -6.481863, 0, -0.5, 0.5, 0.5,
-3.246302, 2, -6.481863, 1, -0.5, 0.5, 0.5,
-3.246302, 2, -6.481863, 1, 1.5, 0.5, 0.5,
-3.246302, 2, -6.481863, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.82428, -2.922626, -4,
-2.82428, -2.922626, 4,
-2.82428, -2.922626, -4,
-2.964954, -3.064779, -4,
-2.82428, -2.922626, -2,
-2.964954, -3.064779, -2,
-2.82428, -2.922626, 0,
-2.964954, -3.064779, 0,
-2.82428, -2.922626, 2,
-2.964954, -3.064779, 2,
-2.82428, -2.922626, 4,
-2.964954, -3.064779, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.246302, -3.349084, -4, 0, -0.5, 0.5, 0.5,
-3.246302, -3.349084, -4, 1, -0.5, 0.5, 0.5,
-3.246302, -3.349084, -4, 1, 1.5, 0.5, 0.5,
-3.246302, -3.349084, -4, 0, 1.5, 0.5, 0.5,
-3.246302, -3.349084, -2, 0, -0.5, 0.5, 0.5,
-3.246302, -3.349084, -2, 1, -0.5, 0.5, 0.5,
-3.246302, -3.349084, -2, 1, 1.5, 0.5, 0.5,
-3.246302, -3.349084, -2, 0, 1.5, 0.5, 0.5,
-3.246302, -3.349084, 0, 0, -0.5, 0.5, 0.5,
-3.246302, -3.349084, 0, 1, -0.5, 0.5, 0.5,
-3.246302, -3.349084, 0, 1, 1.5, 0.5, 0.5,
-3.246302, -3.349084, 0, 0, 1.5, 0.5, 0.5,
-3.246302, -3.349084, 2, 0, -0.5, 0.5, 0.5,
-3.246302, -3.349084, 2, 1, -0.5, 0.5, 0.5,
-3.246302, -3.349084, 2, 1, 1.5, 0.5, 0.5,
-3.246302, -3.349084, 2, 0, 1.5, 0.5, 0.5,
-3.246302, -3.349084, 4, 0, -0.5, 0.5, 0.5,
-3.246302, -3.349084, 4, 1, -0.5, 0.5, 0.5,
-3.246302, -3.349084, 4, 1, 1.5, 0.5, 0.5,
-3.246302, -3.349084, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.82428, -2.922626, -5.67767,
-2.82428, 2.763484, -5.67767,
-2.82428, -2.922626, 5.044918,
-2.82428, 2.763484, 5.044918,
-2.82428, -2.922626, -5.67767,
-2.82428, -2.922626, 5.044918,
-2.82428, 2.763484, -5.67767,
-2.82428, 2.763484, 5.044918,
-2.82428, -2.922626, -5.67767,
2.80268, -2.922626, -5.67767,
-2.82428, -2.922626, 5.044918,
2.80268, -2.922626, 5.044918,
-2.82428, 2.763484, -5.67767,
2.80268, 2.763484, -5.67767,
-2.82428, 2.763484, 5.044918,
2.80268, 2.763484, 5.044918,
2.80268, -2.922626, -5.67767,
2.80268, 2.763484, -5.67767,
2.80268, -2.922626, 5.044918,
2.80268, 2.763484, 5.044918,
2.80268, -2.922626, -5.67767,
2.80268, -2.922626, 5.044918,
2.80268, 2.763484, -5.67767,
2.80268, 2.763484, 5.044918
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.143543;
var distance = 31.78243;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.01079965, 0.07957089, 0.3163757 );
mvMatrix.scale( 1.372631, 1.358352, 0.7203241 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.78243);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Vangard<-read.table("Vangard.xyz")
```

```
## Error in read.table("Vangard.xyz"): no lines available in input
```

```r
x<-Vangard$V2
```

```
## Error in eval(expr, envir, enclos): object 'Vangard' not found
```

```r
y<-Vangard$V3
```

```
## Error in eval(expr, envir, enclos): object 'Vangard' not found
```

```r
z<-Vangard$V4
```

```
## Error in eval(expr, envir, enclos): object 'Vangard' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.742334, -0.510752, -1.823504, 0, 0, 1, 1, 1,
-2.705958, -0.2308308, -0.4677282, 1, 0, 0, 1, 1,
-2.596424, -0.5933, -1.074656, 1, 0, 0, 1, 1,
-2.561565, 2.100459, -0.2966972, 1, 0, 0, 1, 1,
-2.500109, 0.8959154, -0.3288708, 1, 0, 0, 1, 1,
-2.44178, -0.601869, -1.901637, 1, 0, 0, 1, 1,
-2.341814, -0.3808066, -0.787021, 0, 0, 0, 1, 1,
-2.31227, -0.3914694, -0.8758907, 0, 0, 0, 1, 1,
-2.271345, -1.383919, -0.7964423, 0, 0, 0, 1, 1,
-2.252169, 0.1711714, -2.040616, 0, 0, 0, 1, 1,
-2.222393, 0.3324513, -1.524069, 0, 0, 0, 1, 1,
-2.153188, 1.019559, -3.162913, 0, 0, 0, 1, 1,
-2.132764, 0.2685799, -1.790674, 0, 0, 0, 1, 1,
-2.131604, 0.6384313, -2.010278, 1, 1, 1, 1, 1,
-2.088175, -0.4073745, -2.467112, 1, 1, 1, 1, 1,
-2.055316, -0.0451625, -1.002142, 1, 1, 1, 1, 1,
-2.04839, -0.3195538, -1.911187, 1, 1, 1, 1, 1,
-2.025093, 0.9049374, -1.501857, 1, 1, 1, 1, 1,
-1.986906, 1.738626, -1.012304, 1, 1, 1, 1, 1,
-1.972997, 0.8399919, -1.523228, 1, 1, 1, 1, 1,
-1.945052, -0.5727625, -2.422313, 1, 1, 1, 1, 1,
-1.93291, -0.4181126, -2.956261, 1, 1, 1, 1, 1,
-1.930563, 0.6352567, -0.7271537, 1, 1, 1, 1, 1,
-1.92087, 1.603618, 0.266488, 1, 1, 1, 1, 1,
-1.918321, 0.5147592, -1.921103, 1, 1, 1, 1, 1,
-1.901981, -0.1677842, -0.3747924, 1, 1, 1, 1, 1,
-1.899059, -0.609246, -2.263374, 1, 1, 1, 1, 1,
-1.896042, 0.4373445, -1.803773, 1, 1, 1, 1, 1,
-1.872962, -1.045744, -2.371991, 0, 0, 1, 1, 1,
-1.864532, 0.7890005, -2.264529, 1, 0, 0, 1, 1,
-1.852312, -0.1534765, -2.7913, 1, 0, 0, 1, 1,
-1.841933, -0.9631202, -2.334, 1, 0, 0, 1, 1,
-1.833923, -1.269584, -2.302901, 1, 0, 0, 1, 1,
-1.802435, 1.373417, -0.8560491, 1, 0, 0, 1, 1,
-1.80232, -1.667327, -1.473454, 0, 0, 0, 1, 1,
-1.799485, -0.2410816, -0.4119906, 0, 0, 0, 1, 1,
-1.788489, 1.361571, -1.271557, 0, 0, 0, 1, 1,
-1.784015, -0.3416625, -3.205466, 0, 0, 0, 1, 1,
-1.781895, 0.7577296, -1.547799, 0, 0, 0, 1, 1,
-1.773911, -0.1165981, -1.819822, 0, 0, 0, 1, 1,
-1.753639, 1.208752, -2.128697, 0, 0, 0, 1, 1,
-1.747206, -0.3840453, -3.083148, 1, 1, 1, 1, 1,
-1.746572, -0.6788979, -0.7769352, 1, 1, 1, 1, 1,
-1.723355, 2.453902, 0.2154954, 1, 1, 1, 1, 1,
-1.71585, -1.305986, -2.8664, 1, 1, 1, 1, 1,
-1.669371, 0.698554, -0.7452285, 1, 1, 1, 1, 1,
-1.664601, -1.562292, -2.141406, 1, 1, 1, 1, 1,
-1.646133, 1.40828, -0.02271663, 1, 1, 1, 1, 1,
-1.621228, -1.245419, -3.942827, 1, 1, 1, 1, 1,
-1.618105, -0.08600979, -2.453218, 1, 1, 1, 1, 1,
-1.610859, 0.1421244, -1.173628, 1, 1, 1, 1, 1,
-1.598057, 0.2706055, -1.615184, 1, 1, 1, 1, 1,
-1.591387, 0.4317913, -0.8820275, 1, 1, 1, 1, 1,
-1.583115, 0.407691, -0.9122297, 1, 1, 1, 1, 1,
-1.580985, 0.2155812, -1.770457, 1, 1, 1, 1, 1,
-1.561268, -1.559895, -1.742777, 1, 1, 1, 1, 1,
-1.546379, -1.440502, -3.077033, 0, 0, 1, 1, 1,
-1.534843, 0.2405918, -1.319901, 1, 0, 0, 1, 1,
-1.531138, -0.5635729, -1.065673, 1, 0, 0, 1, 1,
-1.52698, 0.3636371, -2.142177, 1, 0, 0, 1, 1,
-1.523238, -0.8935031, -1.739039, 1, 0, 0, 1, 1,
-1.515882, 0.5774983, 1.3364, 1, 0, 0, 1, 1,
-1.510618, -0.3583563, -3.012286, 0, 0, 0, 1, 1,
-1.505391, 1.132892, -1.223967, 0, 0, 0, 1, 1,
-1.499478, -0.8202839, -3.791274, 0, 0, 0, 1, 1,
-1.491964, -0.9051896, -1.15238, 0, 0, 0, 1, 1,
-1.477537, 0.5707439, -1.501292, 0, 0, 0, 1, 1,
-1.464495, 0.2622853, -1.507834, 0, 0, 0, 1, 1,
-1.450804, 0.881649, -2.762732, 0, 0, 0, 1, 1,
-1.449848, 0.454339, 0.459988, 1, 1, 1, 1, 1,
-1.44762, -1.023439, -2.844725, 1, 1, 1, 1, 1,
-1.434304, 1.390718, -0.5615945, 1, 1, 1, 1, 1,
-1.428403, -0.2369592, -2.879883, 1, 1, 1, 1, 1,
-1.420414, -0.90842, -3.692086, 1, 1, 1, 1, 1,
-1.419911, 0.3176225, -2.006958, 1, 1, 1, 1, 1,
-1.415993, 1.063967, -1.32992, 1, 1, 1, 1, 1,
-1.412534, 0.1135115, -1.14743, 1, 1, 1, 1, 1,
-1.400378, 0.4179867, -0.543883, 1, 1, 1, 1, 1,
-1.373818, 1.628918, -1.997322, 1, 1, 1, 1, 1,
-1.371682, 1.178606, 0.9769661, 1, 1, 1, 1, 1,
-1.367727, -0.785477, -2.253425, 1, 1, 1, 1, 1,
-1.363579, 0.411576, -1.614698, 1, 1, 1, 1, 1,
-1.363542, 0.8044504, -1.216772, 1, 1, 1, 1, 1,
-1.356245, 0.04900548, 0.5603335, 1, 1, 1, 1, 1,
-1.351948, 0.4558279, -1.578325, 0, 0, 1, 1, 1,
-1.317354, 0.9744294, -1.152879, 1, 0, 0, 1, 1,
-1.316582, 0.2636272, -2.000791, 1, 0, 0, 1, 1,
-1.307169, 0.8403965, 0.6393904, 1, 0, 0, 1, 1,
-1.289387, 0.929055, -1.224228, 1, 0, 0, 1, 1,
-1.288663, 1.560617, -0.4152017, 1, 0, 0, 1, 1,
-1.276472, -0.6971691, -1.81976, 0, 0, 0, 1, 1,
-1.270824, 0.5427254, -1.119974, 0, 0, 0, 1, 1,
-1.264536, -0.7258404, -4.151044, 0, 0, 0, 1, 1,
-1.262655, 0.780292, -0.4088003, 0, 0, 0, 1, 1,
-1.247734, -0.7155665, -2.700536, 0, 0, 0, 1, 1,
-1.242993, -0.9070529, -2.05171, 0, 0, 0, 1, 1,
-1.235746, 0.8188062, -0.7282718, 0, 0, 0, 1, 1,
-1.23179, 0.8510961, 0.1480334, 1, 1, 1, 1, 1,
-1.226194, 1.18818, -1.619773, 1, 1, 1, 1, 1,
-1.219522, 0.9226438, -1.135214, 1, 1, 1, 1, 1,
-1.217268, 1.116482, -0.6450107, 1, 1, 1, 1, 1,
-1.212983, -0.3174788, -1.91262, 1, 1, 1, 1, 1,
-1.206053, -0.3881519, -1.450058, 1, 1, 1, 1, 1,
-1.200099, 0.8972343, -2.375752, 1, 1, 1, 1, 1,
-1.189757, 0.4309393, -0.5640402, 1, 1, 1, 1, 1,
-1.18433, 1.411143, -1.771715, 1, 1, 1, 1, 1,
-1.183029, -1.156707, -2.396258, 1, 1, 1, 1, 1,
-1.179672, -0.1192819, -0.946582, 1, 1, 1, 1, 1,
-1.177354, -1.554633, -3.861333, 1, 1, 1, 1, 1,
-1.176905, -0.3168485, -2.978574, 1, 1, 1, 1, 1,
-1.176815, 0.04454925, -1.634806, 1, 1, 1, 1, 1,
-1.172042, -0.7007755, -1.540767, 1, 1, 1, 1, 1,
-1.168391, 0.01104504, -1.678871, 0, 0, 1, 1, 1,
-1.167562, -0.3122754, -1.980418, 1, 0, 0, 1, 1,
-1.162461, 0.740267, -0.4467361, 1, 0, 0, 1, 1,
-1.160422, 0.786344, -2.516371, 1, 0, 0, 1, 1,
-1.157498, -0.3433786, -1.261044, 1, 0, 0, 1, 1,
-1.154917, -0.9629163, -3.187194, 1, 0, 0, 1, 1,
-1.154786, -0.4324965, -3.518581, 0, 0, 0, 1, 1,
-1.152705, 1.192003, 0.6401509, 0, 0, 0, 1, 1,
-1.133023, 0.8290578, 0.5084237, 0, 0, 0, 1, 1,
-1.114395, 0.5347629, -0.3025776, 0, 0, 0, 1, 1,
-1.112267, 0.2747453, -1.287372, 0, 0, 0, 1, 1,
-1.104454, -1.591259, -2.201453, 0, 0, 0, 1, 1,
-1.103544, 0.4967974, -2.871397, 0, 0, 0, 1, 1,
-1.101548, -1.397779, -2.07183, 1, 1, 1, 1, 1,
-1.101522, -0.7760382, -3.471368, 1, 1, 1, 1, 1,
-1.092645, -1.880622, -1.905076, 1, 1, 1, 1, 1,
-1.082205, 0.8785757, -0.5281261, 1, 1, 1, 1, 1,
-1.081797, -1.06407, -3.336848, 1, 1, 1, 1, 1,
-1.077204, 0.7256679, -2.395587, 1, 1, 1, 1, 1,
-1.075584, -0.8952253, -2.221608, 1, 1, 1, 1, 1,
-1.07515, 0.5134227, -2.223344, 1, 1, 1, 1, 1,
-1.075084, -1.652237, -2.198676, 1, 1, 1, 1, 1,
-1.057637, 0.01125588, -1.619565, 1, 1, 1, 1, 1,
-1.047747, -0.04844088, -0.9988407, 1, 1, 1, 1, 1,
-1.039182, -0.07067066, -2.385083, 1, 1, 1, 1, 1,
-1.03844, 1.127098, -0.2980773, 1, 1, 1, 1, 1,
-1.036041, 0.2763975, -4.232935, 1, 1, 1, 1, 1,
-1.035694, 0.2876351, -1.6292, 1, 1, 1, 1, 1,
-1.031978, 0.1236138, -0.600773, 0, 0, 1, 1, 1,
-1.0275, 0.4440891, -2.109362, 1, 0, 0, 1, 1,
-1.02136, -0.5250829, -1.572076, 1, 0, 0, 1, 1,
-1.019539, -0.2895217, -2.091665, 1, 0, 0, 1, 1,
-1.006129, -1.356918, -1.391925, 1, 0, 0, 1, 1,
-1.005745, 0.4424182, -0.9680021, 1, 0, 0, 1, 1,
-1.00395, -1.800368, -3.05442, 0, 0, 0, 1, 1,
-0.9981066, -1.496481, -0.597272, 0, 0, 0, 1, 1,
-0.997444, -0.4014499, -1.915336, 0, 0, 0, 1, 1,
-0.9970374, 2.409245, -0.06218604, 0, 0, 0, 1, 1,
-0.9954109, -2.309907, -2.987251, 0, 0, 0, 1, 1,
-0.9949004, -1.307779, -3.113619, 0, 0, 0, 1, 1,
-0.9929845, 1.727365, -1.412398, 0, 0, 0, 1, 1,
-0.9918807, -1.695811, -2.421371, 1, 1, 1, 1, 1,
-0.9872409, -0.4967065, -2.530363, 1, 1, 1, 1, 1,
-0.9849969, -0.2754443, -1.181529, 1, 1, 1, 1, 1,
-0.9808453, -0.2620689, -3.115563, 1, 1, 1, 1, 1,
-0.9807644, 0.2255403, 0.6836085, 1, 1, 1, 1, 1,
-0.9786531, -1.66825, -2.14752, 1, 1, 1, 1, 1,
-0.9783563, -2.349301, -2.825933, 1, 1, 1, 1, 1,
-0.9756782, 0.6414413, -2.714058, 1, 1, 1, 1, 1,
-0.9742079, -0.4698307, -2.654229, 1, 1, 1, 1, 1,
-0.9735975, -1.074627, -1.325501, 1, 1, 1, 1, 1,
-0.9710581, -0.7193702, -2.393952, 1, 1, 1, 1, 1,
-0.9701751, 0.834342, -0.8266168, 1, 1, 1, 1, 1,
-0.9656803, 1.474816, -1.011476, 1, 1, 1, 1, 1,
-0.9610829, 1.132756, -1.359356, 1, 1, 1, 1, 1,
-0.9608752, -0.8573751, -3.159571, 1, 1, 1, 1, 1,
-0.9600822, -1.089083, -1.622107, 0, 0, 1, 1, 1,
-0.9560739, 0.3883223, -0.3320389, 1, 0, 0, 1, 1,
-0.9473709, -1.66838, -1.560856, 1, 0, 0, 1, 1,
-0.9467894, 0.01409386, -1.618706, 1, 0, 0, 1, 1,
-0.9456459, -0.9207798, -1.840026, 1, 0, 0, 1, 1,
-0.9444709, 1.875987, -1.977484, 1, 0, 0, 1, 1,
-0.9424954, 0.9691355, -1.930619, 0, 0, 0, 1, 1,
-0.9373344, -0.9689654, -2.140693, 0, 0, 0, 1, 1,
-0.9342936, 0.3085469, -2.352804, 0, 0, 0, 1, 1,
-0.9327966, 0.8053116, -0.6131381, 0, 0, 0, 1, 1,
-0.9323718, -1.244863, -3.279197, 0, 0, 0, 1, 1,
-0.9304859, 0.4068235, -1.608891, 0, 0, 0, 1, 1,
-0.9256347, -0.9452066, -1.828609, 0, 0, 0, 1, 1,
-0.9255601, 0.2289503, -2.003674, 1, 1, 1, 1, 1,
-0.9233236, 0.1532418, -1.849197, 1, 1, 1, 1, 1,
-0.9182857, -0.6305402, -2.246692, 1, 1, 1, 1, 1,
-0.907601, 0.0001597145, -1.173642, 1, 1, 1, 1, 1,
-0.9031599, -0.4484213, -1.918519, 1, 1, 1, 1, 1,
-0.8937962, 0.6855981, -0.1714083, 1, 1, 1, 1, 1,
-0.8928322, 0.1747063, -0.7015055, 1, 1, 1, 1, 1,
-0.8914837, 1.015051, -0.7118115, 1, 1, 1, 1, 1,
-0.8903406, 0.6892543, -0.754989, 1, 1, 1, 1, 1,
-0.887631, -0.2959456, -1.025329, 1, 1, 1, 1, 1,
-0.8867315, 0.4941481, -0.9464037, 1, 1, 1, 1, 1,
-0.8864281, -0.9295034, -3.352424, 1, 1, 1, 1, 1,
-0.8794744, -1.488726, -1.817538, 1, 1, 1, 1, 1,
-0.8779915, 0.2650099, -2.53886, 1, 1, 1, 1, 1,
-0.8708006, -1.193478, -2.174314, 1, 1, 1, 1, 1,
-0.8697102, 2.012042, -2.344634, 0, 0, 1, 1, 1,
-0.868871, -0.4090134, -3.190652, 1, 0, 0, 1, 1,
-0.8677506, -0.2057675, -1.363107, 1, 0, 0, 1, 1,
-0.8674981, 0.2119362, -0.3583945, 1, 0, 0, 1, 1,
-0.8630095, 1.129871, -0.8208985, 1, 0, 0, 1, 1,
-0.8598711, 0.5295609, -0.1128863, 1, 0, 0, 1, 1,
-0.8567429, -1.974497, -1.686556, 0, 0, 0, 1, 1,
-0.8550018, 0.5413535, -1.291585, 0, 0, 0, 1, 1,
-0.8483877, -0.7984063, -1.954817, 0, 0, 0, 1, 1,
-0.8468917, 1.247161, 0.003943566, 0, 0, 0, 1, 1,
-0.8460757, -0.6154324, -1.383987, 0, 0, 0, 1, 1,
-0.8460108, -0.3015819, -1.532875, 0, 0, 0, 1, 1,
-0.8419918, 1.515209, -1.025429, 0, 0, 0, 1, 1,
-0.8401373, -0.274773, -3.962221, 1, 1, 1, 1, 1,
-0.8338627, 2.64685, -0.6355087, 1, 1, 1, 1, 1,
-0.8285112, 0.2458518, -2.159979, 1, 1, 1, 1, 1,
-0.8266364, -1.129727, -4.566235, 1, 1, 1, 1, 1,
-0.8231455, 2.680677, -0.3242714, 1, 1, 1, 1, 1,
-0.8208732, 0.1204709, -1.975361, 1, 1, 1, 1, 1,
-0.8182923, 0.4627323, -0.1681435, 1, 1, 1, 1, 1,
-0.817381, 0.2307204, -1.704481, 1, 1, 1, 1, 1,
-0.8169253, -0.5989432, -1.227721, 1, 1, 1, 1, 1,
-0.8147686, -0.6611775, -3.074728, 1, 1, 1, 1, 1,
-0.8144234, 0.7360021, 0.2534224, 1, 1, 1, 1, 1,
-0.8125923, -0.06367815, -1.347651, 1, 1, 1, 1, 1,
-0.8125647, -1.135179, -3.595027, 1, 1, 1, 1, 1,
-0.8089663, 0.7685121, -0.4704527, 1, 1, 1, 1, 1,
-0.8086717, 0.02518924, -3.043007, 1, 1, 1, 1, 1,
-0.7870106, 0.5722364, -0.8641412, 0, 0, 1, 1, 1,
-0.7863381, 0.7377409, 1.104409, 1, 0, 0, 1, 1,
-0.7857267, 2.39486, -0.4782901, 1, 0, 0, 1, 1,
-0.7850903, 0.9556333, 0.299842, 1, 0, 0, 1, 1,
-0.7796782, 0.07424624, -0.4374964, 1, 0, 0, 1, 1,
-0.7761879, 0.3444587, 0.1574729, 1, 0, 0, 1, 1,
-0.7584864, -0.05433221, -1.832965, 0, 0, 0, 1, 1,
-0.7576543, -0.2716203, -1.202553, 0, 0, 0, 1, 1,
-0.7533945, 0.920044, 0.6317891, 0, 0, 0, 1, 1,
-0.7467897, -1.614822, -2.104174, 0, 0, 0, 1, 1,
-0.7428959, -0.04939062, -2.08048, 0, 0, 0, 1, 1,
-0.7393699, 1.357549, 0.5112962, 0, 0, 0, 1, 1,
-0.7360003, -1.216023, -3.609256, 0, 0, 0, 1, 1,
-0.7340143, 1.18946, -1.313065, 1, 1, 1, 1, 1,
-0.7304171, 0.1265626, -1.843695, 1, 1, 1, 1, 1,
-0.7240865, 1.810207, -0.0966337, 1, 1, 1, 1, 1,
-0.7216439, 0.5734069, -0.8697761, 1, 1, 1, 1, 1,
-0.7206331, -0.6640087, -2.343736, 1, 1, 1, 1, 1,
-0.7201476, 1.667332, -0.6597179, 1, 1, 1, 1, 1,
-0.7137766, -0.6819359, -0.8758624, 1, 1, 1, 1, 1,
-0.708739, -0.001737977, -2.236964, 1, 1, 1, 1, 1,
-0.7066157, -0.3146487, -3.546796, 1, 1, 1, 1, 1,
-0.7058832, -0.6231186, -1.271267, 1, 1, 1, 1, 1,
-0.7051696, 0.9584577, -2.311361, 1, 1, 1, 1, 1,
-0.7049129, 0.1132551, -1.676628, 1, 1, 1, 1, 1,
-0.7013565, -0.5610002, -2.764492, 1, 1, 1, 1, 1,
-0.7006534, -1.42908, -4.613532, 1, 1, 1, 1, 1,
-0.6972501, -1.087049, -1.237894, 1, 1, 1, 1, 1,
-0.6883525, -0.3146566, -3.90257, 0, 0, 1, 1, 1,
-0.6861499, -2.087049, -1.946197, 1, 0, 0, 1, 1,
-0.6836892, 0.2207481, -0.6398958, 1, 0, 0, 1, 1,
-0.682856, 0.7115154, -0.4587595, 1, 0, 0, 1, 1,
-0.6812266, -0.3999759, -2.616327, 1, 0, 0, 1, 1,
-0.6804824, -0.02564361, -0.7398394, 1, 0, 0, 1, 1,
-0.6797432, 0.3855794, -3.193404, 0, 0, 0, 1, 1,
-0.6790125, -2.495626, -3.460665, 0, 0, 0, 1, 1,
-0.6788152, 0.9128612, -0.1320255, 0, 0, 0, 1, 1,
-0.6783715, 0.07063209, -2.230001, 0, 0, 0, 1, 1,
-0.6774373, -2.335367, -2.668073, 0, 0, 0, 1, 1,
-0.6772885, 1.91632, -0.06342768, 0, 0, 0, 1, 1,
-0.6771245, -0.5540561, -1.584098, 0, 0, 0, 1, 1,
-0.6723101, 0.4456865, -1.380753, 1, 1, 1, 1, 1,
-0.6675317, -0.605804, -1.60776, 1, 1, 1, 1, 1,
-0.6655806, -1.752285, -2.588993, 1, 1, 1, 1, 1,
-0.6654202, -0.5167168, -4.217521, 1, 1, 1, 1, 1,
-0.6649283, 1.132423, -0.02515661, 1, 1, 1, 1, 1,
-0.6639761, 0.12757, -0.2001253, 1, 1, 1, 1, 1,
-0.6616052, -0.571481, -3.343256, 1, 1, 1, 1, 1,
-0.6597577, -0.8768576, -2.040486, 1, 1, 1, 1, 1,
-0.658724, -0.8349489, -0.8789943, 1, 1, 1, 1, 1,
-0.6568512, -1.369719, -3.320725, 1, 1, 1, 1, 1,
-0.6565785, 0.6296893, 0.2502994, 1, 1, 1, 1, 1,
-0.6557915, -0.194879, -0.2131432, 1, 1, 1, 1, 1,
-0.6531382, 0.4630356, -1.001101, 1, 1, 1, 1, 1,
-0.6525354, -0.8358892, -3.539459, 1, 1, 1, 1, 1,
-0.6502566, 0.1576023, -2.405591, 1, 1, 1, 1, 1,
-0.6499028, 1.206064, -3.242691, 0, 0, 1, 1, 1,
-0.6418905, 0.5734786, -2.302542, 1, 0, 0, 1, 1,
-0.6401196, -0.8047761, -3.621589, 1, 0, 0, 1, 1,
-0.6330451, 0.1265715, 1.499205, 1, 0, 0, 1, 1,
-0.6320531, -0.05943351, -2.717311, 1, 0, 0, 1, 1,
-0.6306844, 0.02981884, -0.9893292, 1, 0, 0, 1, 1,
-0.6255142, 0.1918215, -0.3827464, 0, 0, 0, 1, 1,
-0.6251062, 0.9644423, 1.258977, 0, 0, 0, 1, 1,
-0.6240367, -0.7370475, -2.73271, 0, 0, 0, 1, 1,
-0.6238279, 1.266998, -0.9588508, 0, 0, 0, 1, 1,
-0.6200176, 0.8191934, 0.3875141, 0, 0, 0, 1, 1,
-0.6162537, -0.1490242, -0.07883316, 0, 0, 0, 1, 1,
-0.6147017, -0.05415353, -2.504866, 0, 0, 0, 1, 1,
-0.612744, -1.74834, -1.213173, 1, 1, 1, 1, 1,
-0.6124449, 0.3139543, -1.957958, 1, 1, 1, 1, 1,
-0.6082939, -1.678154, -4.372794, 1, 1, 1, 1, 1,
-0.6066963, 0.7780373, -1.12716, 1, 1, 1, 1, 1,
-0.6019195, 0.2549007, -2.050877, 1, 1, 1, 1, 1,
-0.5902727, 0.9844826, 0.2864187, 1, 1, 1, 1, 1,
-0.5893854, 0.788039, -1.950555, 1, 1, 1, 1, 1,
-0.5840816, 0.1703556, -2.216981, 1, 1, 1, 1, 1,
-0.5769841, -0.1900325, -1.469666, 1, 1, 1, 1, 1,
-0.5679156, -1.634473, -3.446015, 1, 1, 1, 1, 1,
-0.5678621, 0.1439748, -0.1155817, 1, 1, 1, 1, 1,
-0.5676965, 0.1263213, -1.155515, 1, 1, 1, 1, 1,
-0.5516126, 0.1235511, -2.260069, 1, 1, 1, 1, 1,
-0.5435135, -0.09455364, -1.274804, 1, 1, 1, 1, 1,
-0.5431322, 1.254458, 0.5099858, 1, 1, 1, 1, 1,
-0.541239, -2.535729, -2.612258, 0, 0, 1, 1, 1,
-0.5396463, -0.4163188, -1.369916, 1, 0, 0, 1, 1,
-0.5367492, -1.022686, -4.952155, 1, 0, 0, 1, 1,
-0.533015, 0.1463791, -2.305152, 1, 0, 0, 1, 1,
-0.528697, 0.2709091, -1.043888, 1, 0, 0, 1, 1,
-0.5262201, -0.9332395, -4.210102, 1, 0, 0, 1, 1,
-0.5210323, -0.4728327, -3.407867, 0, 0, 0, 1, 1,
-0.5207678, -0.8257802, -2.630116, 0, 0, 0, 1, 1,
-0.5204435, -0.1208574, -1.313662, 0, 0, 0, 1, 1,
-0.5183478, -0.4400492, -0.02498138, 0, 0, 0, 1, 1,
-0.5159246, -0.8206301, -5.521515, 0, 0, 0, 1, 1,
-0.5157791, 1.001463, -1.033162, 0, 0, 0, 1, 1,
-0.5138195, -0.7122708, -1.825203, 0, 0, 0, 1, 1,
-0.511627, -0.2895173, -1.4676, 1, 1, 1, 1, 1,
-0.504544, -2.509373, -1.557688, 1, 1, 1, 1, 1,
-0.4950448, 0.08352792, -0.07673942, 1, 1, 1, 1, 1,
-0.4880205, -0.184037, -1.75166, 1, 1, 1, 1, 1,
-0.4848517, -0.6173159, -2.343021, 1, 1, 1, 1, 1,
-0.4802815, -0.1749951, -1.400051, 1, 1, 1, 1, 1,
-0.4800656, 0.04326994, -1.522301, 1, 1, 1, 1, 1,
-0.4726187, 0.8640407, 1.611225, 1, 1, 1, 1, 1,
-0.4564744, -0.7527192, -2.658555, 1, 1, 1, 1, 1,
-0.4472702, -1.208973, -3.511279, 1, 1, 1, 1, 1,
-0.4433588, -0.2380082, -1.11818, 1, 1, 1, 1, 1,
-0.4429704, -0.9139485, -2.733067, 1, 1, 1, 1, 1,
-0.4375961, 2.179793, 0.4510019, 1, 1, 1, 1, 1,
-0.4357622, -0.09629938, -0.9583954, 1, 1, 1, 1, 1,
-0.4353747, 1.246197, 1.119341, 1, 1, 1, 1, 1,
-0.4279059, -0.2469818, -1.304853, 0, 0, 1, 1, 1,
-0.4259501, -0.3176303, -0.04357727, 1, 0, 0, 1, 1,
-0.4243752, -1.990678, -3.14932, 1, 0, 0, 1, 1,
-0.4234738, 1.482593, 0.1043384, 1, 0, 0, 1, 1,
-0.4221979, 2.024308, 0.9069493, 1, 0, 0, 1, 1,
-0.4152204, 0.4009551, 0.7802117, 1, 0, 0, 1, 1,
-0.4143779, -1.469768, -4.927763, 0, 0, 0, 1, 1,
-0.4118122, -1.015411, -0.6322987, 0, 0, 0, 1, 1,
-0.4108134, -0.5264605, -1.302618, 0, 0, 0, 1, 1,
-0.40769, -1.506337, -1.589524, 0, 0, 0, 1, 1,
-0.3997995, 0.03901186, -2.761768, 0, 0, 0, 1, 1,
-0.3974264, 0.331145, -2.464995, 0, 0, 0, 1, 1,
-0.3967689, -0.1892045, -2.367446, 0, 0, 0, 1, 1,
-0.3842932, 1.021266, -0.3478516, 1, 1, 1, 1, 1,
-0.3837678, 0.4429458, -0.1461249, 1, 1, 1, 1, 1,
-0.381871, -1.174308, -3.658355, 1, 1, 1, 1, 1,
-0.381814, -0.7108207, -2.873392, 1, 1, 1, 1, 1,
-0.3807122, 1.992689, -2.651155, 1, 1, 1, 1, 1,
-0.3790431, -1.042363, -2.168181, 1, 1, 1, 1, 1,
-0.3783994, 0.7239742, -0.6695818, 1, 1, 1, 1, 1,
-0.3773493, -0.2973431, -2.360711, 1, 1, 1, 1, 1,
-0.3763198, 2.076096, 0.08459681, 1, 1, 1, 1, 1,
-0.3759666, 0.682153, -0.9882872, 1, 1, 1, 1, 1,
-0.374557, 1.341841, 1.560829, 1, 1, 1, 1, 1,
-0.3703314, -0.02688042, -3.079691, 1, 1, 1, 1, 1,
-0.3701808, -2.154672, -3.586133, 1, 1, 1, 1, 1,
-0.3594839, -0.7678961, -3.384546, 1, 1, 1, 1, 1,
-0.3540931, 0.6196587, -0.6052089, 1, 1, 1, 1, 1,
-0.3470638, 0.6529678, -2.051435, 0, 0, 1, 1, 1,
-0.3462356, 0.4916649, 0.5912626, 1, 0, 0, 1, 1,
-0.3462285, -1.910887, -4.130592, 1, 0, 0, 1, 1,
-0.3459919, 1.685736, -2.127915, 1, 0, 0, 1, 1,
-0.3386612, -0.5426772, -2.339642, 1, 0, 0, 1, 1,
-0.3349435, 1.32414, -0.6042006, 1, 0, 0, 1, 1,
-0.3344853, 0.3227016, -2.974784, 0, 0, 0, 1, 1,
-0.3256253, -0.5982202, -2.689492, 0, 0, 0, 1, 1,
-0.3204313, 1.823975, -2.084133, 0, 0, 0, 1, 1,
-0.3144422, -1.128014, -1.334334, 0, 0, 0, 1, 1,
-0.310376, 0.1411772, -0.332892, 0, 0, 0, 1, 1,
-0.3064126, 0.7183737, -0.7089572, 0, 0, 0, 1, 1,
-0.3043608, 0.4183585, -0.8557804, 0, 0, 0, 1, 1,
-0.3015023, 1.584451, -0.6420019, 1, 1, 1, 1, 1,
-0.301392, 0.7967029, 0.3959816, 1, 1, 1, 1, 1,
-0.3009004, 0.09417772, -1.724382, 1, 1, 1, 1, 1,
-0.2971896, -0.1945195, -3.600305, 1, 1, 1, 1, 1,
-0.2941429, 0.1641233, -0.867922, 1, 1, 1, 1, 1,
-0.2924988, -0.5130102, -1.926589, 1, 1, 1, 1, 1,
-0.2873302, -0.1966116, -2.098787, 1, 1, 1, 1, 1,
-0.2852968, -0.5162215, -2.736014, 1, 1, 1, 1, 1,
-0.2805591, 0.2212343, -3.231107, 1, 1, 1, 1, 1,
-0.2790201, 1.526097, -0.1722497, 1, 1, 1, 1, 1,
-0.2742337, -0.4071579, -1.374981, 1, 1, 1, 1, 1,
-0.2723283, 0.08845945, -0.2511427, 1, 1, 1, 1, 1,
-0.2704824, -1.117068, -3.09505, 1, 1, 1, 1, 1,
-0.2678356, 0.1759221, -2.883384, 1, 1, 1, 1, 1,
-0.2626006, -0.3260754, -1.798549, 1, 1, 1, 1, 1,
-0.2579155, 0.3168077, -2.031523, 0, 0, 1, 1, 1,
-0.2558934, 0.8129824, -0.1920067, 1, 0, 0, 1, 1,
-0.2544987, -0.9258622, -2.406443, 1, 0, 0, 1, 1,
-0.2492387, -0.1972994, -2.281552, 1, 0, 0, 1, 1,
-0.244977, -0.2449498, -3.940459, 1, 0, 0, 1, 1,
-0.2435253, 1.291916, -0.1952386, 1, 0, 0, 1, 1,
-0.2391656, -0.05904346, -2.924383, 0, 0, 0, 1, 1,
-0.2383374, 0.6086811, -2.058333, 0, 0, 0, 1, 1,
-0.2326029, 0.1177384, -0.7383517, 0, 0, 0, 1, 1,
-0.2325169, 0.7358149, -0.07530967, 0, 0, 0, 1, 1,
-0.2316613, 0.996237, -0.3931816, 0, 0, 0, 1, 1,
-0.2301303, -1.956116, -1.325764, 0, 0, 0, 1, 1,
-0.2237949, -2.467372, -2.816062, 0, 0, 0, 1, 1,
-0.2216622, 1.63297, -0.09233544, 1, 1, 1, 1, 1,
-0.220028, 1.269051, -0.1366023, 1, 1, 1, 1, 1,
-0.2176879, 1.284308, -0.6676363, 1, 1, 1, 1, 1,
-0.2119767, -0.5410372, -3.603131, 1, 1, 1, 1, 1,
-0.2114608, -1.309939, -2.145013, 1, 1, 1, 1, 1,
-0.2108961, 0.01997483, -1.892605, 1, 1, 1, 1, 1,
-0.2080076, 2.481615, -0.7298117, 1, 1, 1, 1, 1,
-0.2074821, -0.6408404, -2.408745, 1, 1, 1, 1, 1,
-0.2061702, -1.093306, -3.688327, 1, 1, 1, 1, 1,
-0.2048483, 0.9474962, 1.217822, 1, 1, 1, 1, 1,
-0.2024337, -0.01195121, -2.185676, 1, 1, 1, 1, 1,
-0.1974279, 0.7046623, -0.1012111, 1, 1, 1, 1, 1,
-0.1940371, 1.38809, 1.196343, 1, 1, 1, 1, 1,
-0.1936301, -1.031248, -1.724565, 1, 1, 1, 1, 1,
-0.1929777, 0.6195992, -1.333268, 1, 1, 1, 1, 1,
-0.1912656, 0.5674409, -2.035434, 0, 0, 1, 1, 1,
-0.1874252, 0.2350856, -0.8648597, 1, 0, 0, 1, 1,
-0.1855801, -0.7468757, -3.189273, 1, 0, 0, 1, 1,
-0.1827357, 0.4724719, 1.598618, 1, 0, 0, 1, 1,
-0.1824065, -0.04741258, -2.26685, 1, 0, 0, 1, 1,
-0.1780695, -1.232367, -2.876936, 1, 0, 0, 1, 1,
-0.1749642, 0.4586987, -0.4988266, 0, 0, 0, 1, 1,
-0.174526, 0.2146206, -0.9567238, 0, 0, 0, 1, 1,
-0.1740754, 0.4864752, -0.4612406, 0, 0, 0, 1, 1,
-0.17193, 0.0374885, -1.95369, 0, 0, 0, 1, 1,
-0.1718484, -0.1309141, -2.751919, 0, 0, 0, 1, 1,
-0.1715016, 1.139805, -0.1184141, 0, 0, 0, 1, 1,
-0.1693419, -0.3804705, -2.851565, 0, 0, 0, 1, 1,
-0.1682416, 0.874721, -0.1637341, 1, 1, 1, 1, 1,
-0.1674327, -0.4010147, -3.96641, 1, 1, 1, 1, 1,
-0.1668916, 0.7216536, -0.3577933, 1, 1, 1, 1, 1,
-0.1631432, -1.021369, -4.23895, 1, 1, 1, 1, 1,
-0.1622734, 1.680845, 3.636696, 1, 1, 1, 1, 1,
-0.1590133, -0.2793711, -2.013232, 1, 1, 1, 1, 1,
-0.155517, -0.0236024, -1.283769, 1, 1, 1, 1, 1,
-0.1553551, -0.8108182, -3.377086, 1, 1, 1, 1, 1,
-0.1534131, 0.6084263, -0.03108577, 1, 1, 1, 1, 1,
-0.1463632, 0.114208, -2.523526, 1, 1, 1, 1, 1,
-0.1455361, 0.2656861, -0.2083283, 1, 1, 1, 1, 1,
-0.1450776, -1.22046, -2.660339, 1, 1, 1, 1, 1,
-0.1425417, 1.394781, 0.01902165, 1, 1, 1, 1, 1,
-0.1371131, -2.764744, -4.963977, 1, 1, 1, 1, 1,
-0.1349263, -0.9255859, -3.541928, 1, 1, 1, 1, 1,
-0.1339223, 1.183026, 0.1090875, 0, 0, 1, 1, 1,
-0.1335396, -0.9230523, -1.44968, 1, 0, 0, 1, 1,
-0.127892, 0.1232237, -1.186491, 1, 0, 0, 1, 1,
-0.12719, -0.9589092, -1.664344, 1, 0, 0, 1, 1,
-0.1180932, -1.548591, -2.846317, 1, 0, 0, 1, 1,
-0.1158437, 0.579345, -0.2684644, 1, 0, 0, 1, 1,
-0.1138638, -0.5697774, -1.997653, 0, 0, 0, 1, 1,
-0.1128717, 0.5321218, -1.15651, 0, 0, 0, 1, 1,
-0.1119061, 1.649755, -1.260348, 0, 0, 0, 1, 1,
-0.1032658, -0.9468066, -1.138565, 0, 0, 0, 1, 1,
-0.1016423, -0.9673418, -2.677069, 0, 0, 0, 1, 1,
-0.09968679, -0.5421016, -3.905548, 0, 0, 0, 1, 1,
-0.09961984, -0.3744645, -1.649325, 0, 0, 0, 1, 1,
-0.09410311, 0.4984594, -0.2341431, 1, 1, 1, 1, 1,
-0.0925658, -1.317504, -2.364131, 1, 1, 1, 1, 1,
-0.09195738, 1.21844, -0.7993305, 1, 1, 1, 1, 1,
-0.09066021, -0.03689313, -2.120653, 1, 1, 1, 1, 1,
-0.09035446, -0.07449962, -2.493975, 1, 1, 1, 1, 1,
-0.08545898, -0.7621091, -4.397378, 1, 1, 1, 1, 1,
-0.08444309, 1.142456, 0.9095975, 1, 1, 1, 1, 1,
-0.08394678, 0.6561876, -0.6174178, 1, 1, 1, 1, 1,
-0.08210177, 0.8351931, -0.72211, 1, 1, 1, 1, 1,
-0.08071394, 0.867752, -0.4694428, 1, 1, 1, 1, 1,
-0.07925127, 0.6370389, -1.120217, 1, 1, 1, 1, 1,
-0.07862246, -0.5075783, -1.346763, 1, 1, 1, 1, 1,
-0.07746598, 0.3778896, 1.019327, 1, 1, 1, 1, 1,
-0.07694276, -0.7813819, -3.656224, 1, 1, 1, 1, 1,
-0.07658535, 0.5262373, 2.82848, 1, 1, 1, 1, 1,
-0.06888235, 0.718796, 1.246252, 0, 0, 1, 1, 1,
-0.06784704, -0.009585216, -3.678805, 1, 0, 0, 1, 1,
-0.06467421, -1.626134, -2.85664, 1, 0, 0, 1, 1,
-0.06386595, 1.333418, 0.7516611, 1, 0, 0, 1, 1,
-0.06307148, 1.665341, 0.120361, 1, 0, 0, 1, 1,
-0.06305923, -0.2606496, -3.299692, 1, 0, 0, 1, 1,
-0.06104173, -0.2000177, -3.474726, 0, 0, 0, 1, 1,
-0.05937576, -0.6086131, -1.970408, 0, 0, 0, 1, 1,
-0.05093783, 1.536997, -0.07049278, 0, 0, 0, 1, 1,
-0.05093721, -1.419008, -4.049748, 0, 0, 0, 1, 1,
-0.049888, 1.475204, 1.36227, 0, 0, 0, 1, 1,
-0.04912412, 0.4007929, 0.1278044, 0, 0, 0, 1, 1,
-0.04883095, -0.8726914, -3.219442, 0, 0, 0, 1, 1,
-0.04157033, -0.9848455, -2.757227, 1, 1, 1, 1, 1,
-0.04066493, 1.260875, 1.537983, 1, 1, 1, 1, 1,
-0.03630504, 0.08893702, -0.7702209, 1, 1, 1, 1, 1,
-0.03416476, -1.397073, -1.944407, 1, 1, 1, 1, 1,
-0.03129249, 0.7238234, 1.466416, 1, 1, 1, 1, 1,
-0.03077778, 0.1986266, -1.076441, 1, 1, 1, 1, 1,
-0.03073629, 2.37019, 0.3140388, 1, 1, 1, 1, 1,
-0.02917041, 1.402361, -0.6579546, 1, 1, 1, 1, 1,
-0.0284432, -0.1931187, -3.621569, 1, 1, 1, 1, 1,
-0.0271083, -0.05340242, -2.550978, 1, 1, 1, 1, 1,
-0.02408605, 0.3352458, 1.686557, 1, 1, 1, 1, 1,
-0.02406007, 0.03963978, -0.2375072, 1, 1, 1, 1, 1,
-0.01716013, 0.3797975, -1.079832, 1, 1, 1, 1, 1,
-0.01583246, -1.397187, -4.038501, 1, 1, 1, 1, 1,
-0.01499955, 1.258991, 1.370097, 1, 1, 1, 1, 1,
-0.01231906, 0.6113369, -0.1688734, 0, 0, 1, 1, 1,
-0.008290077, -1.735721, -1.783473, 1, 0, 0, 1, 1,
-0.002346592, -0.8425184, -2.985458, 1, 0, 0, 1, 1,
-0.000670356, 0.2378892, -2.040526, 1, 0, 0, 1, 1,
0.001359903, -1.194189, 3.379511, 1, 0, 0, 1, 1,
0.009659495, 0.1827762, 0.3147146, 1, 0, 0, 1, 1,
0.01348994, -0.3262275, 2.064261, 0, 0, 0, 1, 1,
0.01789942, -0.08197222, 2.325686, 0, 0, 0, 1, 1,
0.01866089, 1.96331, 1.600185, 0, 0, 0, 1, 1,
0.0213047, -0.3699245, 3.785742, 0, 0, 0, 1, 1,
0.02220781, -1.480019, 2.839548, 0, 0, 0, 1, 1,
0.02565634, -0.184741, 3.18188, 0, 0, 0, 1, 1,
0.02593572, -0.367696, 2.521574, 0, 0, 0, 1, 1,
0.02731061, -1.613048, 3.705267, 1, 1, 1, 1, 1,
0.02754034, 0.0211067, 0.6343623, 1, 1, 1, 1, 1,
0.02787728, 1.106035, -1.023241, 1, 1, 1, 1, 1,
0.0331131, 0.003016601, 2.832175, 1, 1, 1, 1, 1,
0.03359431, 0.1588525, 0.03235667, 1, 1, 1, 1, 1,
0.03590633, -0.6367158, 2.762371, 1, 1, 1, 1, 1,
0.03672639, -0.7924753, 2.435509, 1, 1, 1, 1, 1,
0.04029429, -1.168606, 1.864247, 1, 1, 1, 1, 1,
0.0445262, 1.48305, 1.027368, 1, 1, 1, 1, 1,
0.04554515, 0.3620774, 1.548239, 1, 1, 1, 1, 1,
0.05074792, 0.1539208, 1.342492, 1, 1, 1, 1, 1,
0.05217395, 1.671726, 0.8885574, 1, 1, 1, 1, 1,
0.05436114, 0.6825151, 0.2677806, 1, 1, 1, 1, 1,
0.05954374, -0.2423521, 3.232617, 1, 1, 1, 1, 1,
0.06423408, -1.913134, 3.989426, 1, 1, 1, 1, 1,
0.06675973, 0.3217176, 0.9100016, 0, 0, 1, 1, 1,
0.06993324, -1.876648, 2.970132, 1, 0, 0, 1, 1,
0.07272793, -1.108959, 3.415352, 1, 0, 0, 1, 1,
0.07357766, -1.68567, 3.362979, 1, 0, 0, 1, 1,
0.07599279, -0.582931, 2.505181, 1, 0, 0, 1, 1,
0.07699359, 0.3054031, 0.001544625, 1, 0, 0, 1, 1,
0.07722629, -0.1674036, 3.926148, 0, 0, 0, 1, 1,
0.07915236, 0.6490396, 0.5131853, 0, 0, 0, 1, 1,
0.08170149, 0.8421783, -1.279593, 0, 0, 0, 1, 1,
0.08476199, -0.3519478, 3.250836, 0, 0, 0, 1, 1,
0.0857791, 1.692964, 0.6652467, 0, 0, 0, 1, 1,
0.08806816, -0.877629, 4.150637, 0, 0, 0, 1, 1,
0.08972506, 0.9508802, 0.01872418, 0, 0, 0, 1, 1,
0.09036273, -1.611225, 2.922715, 1, 1, 1, 1, 1,
0.09212917, 0.4539338, 0.005294302, 1, 1, 1, 1, 1,
0.09295695, -0.3793188, 3.389424, 1, 1, 1, 1, 1,
0.09564149, 1.233651, 1.665531, 1, 1, 1, 1, 1,
0.09973508, -0.7741449, 3.337725, 1, 1, 1, 1, 1,
0.1073933, -0.7831677, 2.444637, 1, 1, 1, 1, 1,
0.1089091, 0.6356761, -1.093383, 1, 1, 1, 1, 1,
0.109258, 0.7167128, -0.8326582, 1, 1, 1, 1, 1,
0.1093742, -0.1079597, 1.870329, 1, 1, 1, 1, 1,
0.1137248, 1.24494, -0.5351379, 1, 1, 1, 1, 1,
0.1195067, 0.5394675, -0.5465948, 1, 1, 1, 1, 1,
0.1221959, -1.570967, 4.41593, 1, 1, 1, 1, 1,
0.1228609, -0.7498801, 4.040413, 1, 1, 1, 1, 1,
0.123115, -0.2226831, 1.007164, 1, 1, 1, 1, 1,
0.1274103, -0.1651129, 1.679674, 1, 1, 1, 1, 1,
0.1279417, 0.9912055, 0.8013066, 0, 0, 1, 1, 1,
0.1287507, 0.4106429, 1.01783, 1, 0, 0, 1, 1,
0.1319158, -1.058381, 3.563505, 1, 0, 0, 1, 1,
0.1403031, -0.025819, 2.178769, 1, 0, 0, 1, 1,
0.1407023, -0.7738159, 1.190105, 1, 0, 0, 1, 1,
0.1452405, -0.09434892, 2.624059, 1, 0, 0, 1, 1,
0.1455349, -0.843346, 3.452905, 0, 0, 0, 1, 1,
0.1456469, 0.4965164, 0.813212, 0, 0, 0, 1, 1,
0.1499664, 0.2844839, 0.2265957, 0, 0, 0, 1, 1,
0.1577533, -0.3215574, 2.967102, 0, 0, 0, 1, 1,
0.1653578, -1.140308, 3.983766, 0, 0, 0, 1, 1,
0.1660029, -1.342896, 2.920474, 0, 0, 0, 1, 1,
0.1672512, -0.48524, 1.727415, 0, 0, 0, 1, 1,
0.1702592, 0.4663269, 1.324318, 1, 1, 1, 1, 1,
0.1746529, 0.05532454, 1.845495, 1, 1, 1, 1, 1,
0.1754218, 1.370199, 0.5835605, 1, 1, 1, 1, 1,
0.1756846, -0.5934275, 2.621322, 1, 1, 1, 1, 1,
0.176292, -0.1335821, 2.925387, 1, 1, 1, 1, 1,
0.1763836, -0.01539783, 3.81788, 1, 1, 1, 1, 1,
0.1839519, -1.605144, 2.516195, 1, 1, 1, 1, 1,
0.1879598, -1.139301, 3.469881, 1, 1, 1, 1, 1,
0.1926284, -0.08718862, 1.373985, 1, 1, 1, 1, 1,
0.1936114, 1.480919, -0.01478069, 1, 1, 1, 1, 1,
0.1959282, 1.466694, 1.816646, 1, 1, 1, 1, 1,
0.2004467, 0.6398234, -0.5060083, 1, 1, 1, 1, 1,
0.2040025, 0.9966297, 0.9474268, 1, 1, 1, 1, 1,
0.2043409, -1.077625, 4.8431, 1, 1, 1, 1, 1,
0.2081303, -0.7791833, 2.620121, 1, 1, 1, 1, 1,
0.2163369, -0.03293439, 1.187183, 0, 0, 1, 1, 1,
0.2208338, 1.639623, -0.7957965, 1, 0, 0, 1, 1,
0.2221076, 1.279515, 0.1119519, 1, 0, 0, 1, 1,
0.2221709, -0.4060195, 3.551545, 1, 0, 0, 1, 1,
0.225219, -1.948813, 4.037834, 1, 0, 0, 1, 1,
0.2260913, 0.3288657, -0.4031788, 1, 0, 0, 1, 1,
0.2278678, 0.1822285, 0.7340299, 0, 0, 0, 1, 1,
0.2353481, -0.6605271, 3.331747, 0, 0, 0, 1, 1,
0.2459916, 0.8320545, -0.9208202, 0, 0, 0, 1, 1,
0.2497449, 1.911287, -0.8746881, 0, 0, 0, 1, 1,
0.2523701, -1.432425, 4.340635, 0, 0, 0, 1, 1,
0.2526639, -0.3416869, 1.677981, 0, 0, 0, 1, 1,
0.2572655, -0.6039166, 3.633408, 0, 0, 0, 1, 1,
0.2573601, -0.8948867, 2.288369, 1, 1, 1, 1, 1,
0.2610262, 0.4400066, 0.4729373, 1, 1, 1, 1, 1,
0.2617643, 0.1778995, 1.153516, 1, 1, 1, 1, 1,
0.2620937, 0.2730132, 1.145637, 1, 1, 1, 1, 1,
0.2688905, -0.9974643, 2.026376, 1, 1, 1, 1, 1,
0.2712361, -0.005616949, 2.934294, 1, 1, 1, 1, 1,
0.2733848, -0.8288953, 2.696536, 1, 1, 1, 1, 1,
0.2745533, -0.01682227, 2.473221, 1, 1, 1, 1, 1,
0.2751854, 1.379697, 0.8265666, 1, 1, 1, 1, 1,
0.2756661, 0.5005403, 3.016677, 1, 1, 1, 1, 1,
0.2765388, 1.284139, 0.5497987, 1, 1, 1, 1, 1,
0.2782212, 0.2657476, 0.7392721, 1, 1, 1, 1, 1,
0.2786458, -0.8552181, 3.484053, 1, 1, 1, 1, 1,
0.2789995, -0.8926163, 3.575271, 1, 1, 1, 1, 1,
0.2793599, 1.24484, 0.1867303, 1, 1, 1, 1, 1,
0.2803489, 0.0174811, 0.7591547, 0, 0, 1, 1, 1,
0.2814361, -0.1271686, 1.687725, 1, 0, 0, 1, 1,
0.2848302, 0.5386509, -0.2539141, 1, 0, 0, 1, 1,
0.2852142, -0.5205554, -0.400353, 1, 0, 0, 1, 1,
0.2870699, 0.5698787, 0.3632458, 1, 0, 0, 1, 1,
0.2891824, -0.634492, 3.439872, 1, 0, 0, 1, 1,
0.290759, -0.2341805, 1.836275, 0, 0, 0, 1, 1,
0.2990058, 0.6323209, -1.637168, 0, 0, 0, 1, 1,
0.3013528, -0.4151628, 3.696873, 0, 0, 0, 1, 1,
0.3080563, 0.3497152, 1.508871, 0, 0, 0, 1, 1,
0.3089317, -1.265816, 3.393935, 0, 0, 0, 1, 1,
0.3091459, 0.4692244, 0.584468, 0, 0, 0, 1, 1,
0.3104996, 0.4826182, 0.4692944, 0, 0, 0, 1, 1,
0.3125552, -0.5182947, 3.64087, 1, 1, 1, 1, 1,
0.3146795, 2.227771, 1.653055, 1, 1, 1, 1, 1,
0.3152519, 0.3125168, 0.426148, 1, 1, 1, 1, 1,
0.3173964, 0.1164848, 1.691737, 1, 1, 1, 1, 1,
0.3198324, 0.9361609, 0.04817681, 1, 1, 1, 1, 1,
0.3210458, -1.462053, 0.03825787, 1, 1, 1, 1, 1,
0.3218911, 0.6813233, -0.8265162, 1, 1, 1, 1, 1,
0.3224514, 0.6087505, 0.4375975, 1, 1, 1, 1, 1,
0.3252198, 0.4153607, 1.54621, 1, 1, 1, 1, 1,
0.3295706, -1.003205, 2.541566, 1, 1, 1, 1, 1,
0.3300417, 1.462219, 0.8630079, 1, 1, 1, 1, 1,
0.3305601, 0.7915587, -2.547197, 1, 1, 1, 1, 1,
0.331596, -0.8621546, 2.461769, 1, 1, 1, 1, 1,
0.3402787, 1.711056, -1.625601, 1, 1, 1, 1, 1,
0.3442682, -1.829265, 2.527757, 1, 1, 1, 1, 1,
0.3503577, 0.1588035, 1.104666, 0, 0, 1, 1, 1,
0.3529336, 0.2164178, -0.3142096, 1, 0, 0, 1, 1,
0.3543254, 1.507877, -0.8493169, 1, 0, 0, 1, 1,
0.3545997, 0.2509483, 0.852953, 1, 0, 0, 1, 1,
0.3546649, -2.377025, 0.9546161, 1, 0, 0, 1, 1,
0.3547825, 0.248601, 1.043748, 1, 0, 0, 1, 1,
0.3563254, 0.2137393, -0.4175704, 0, 0, 0, 1, 1,
0.3576134, 0.3946744, 0.5822267, 0, 0, 0, 1, 1,
0.3611655, -0.3481856, 1.380048, 0, 0, 0, 1, 1,
0.3621828, -0.495947, 4.077002, 0, 0, 0, 1, 1,
0.3674006, -0.6668374, 3.119785, 0, 0, 0, 1, 1,
0.3679661, -0.05211787, 0.8680499, 0, 0, 0, 1, 1,
0.375039, -0.9922249, 1.707743, 0, 0, 0, 1, 1,
0.383284, 1.724876, 0.4850091, 1, 1, 1, 1, 1,
0.3834953, -0.1466778, 2.021943, 1, 1, 1, 1, 1,
0.3847327, -1.961052, 1.892451, 1, 1, 1, 1, 1,
0.3948179, -0.8993569, 1.387689, 1, 1, 1, 1, 1,
0.398248, -1.35545, 0.2013933, 1, 1, 1, 1, 1,
0.3992498, 0.6653296, -0.3265705, 1, 1, 1, 1, 1,
0.4006136, -0.5616909, 3.142503, 1, 1, 1, 1, 1,
0.401442, 0.02689833, 2.466529, 1, 1, 1, 1, 1,
0.4091642, 0.1588527, 2.754677, 1, 1, 1, 1, 1,
0.410086, 1.645489, 0.4322216, 1, 1, 1, 1, 1,
0.4145343, 0.08918577, 1.657861, 1, 1, 1, 1, 1,
0.4175787, -1.512533, 1.052461, 1, 1, 1, 1, 1,
0.4196593, 0.2346503, 2.465462, 1, 1, 1, 1, 1,
0.4209989, -0.7596667, 2.306009, 1, 1, 1, 1, 1,
0.4256191, -1.260292, 2.97315, 1, 1, 1, 1, 1,
0.4258758, -0.3562529, 0.3603753, 0, 0, 1, 1, 1,
0.4314056, -0.2141344, 2.5466, 1, 0, 0, 1, 1,
0.4336024, 0.4116314, 1.218174, 1, 0, 0, 1, 1,
0.4356258, -1.936783, 1.970967, 1, 0, 0, 1, 1,
0.4357812, 0.4252363, 0.6653447, 1, 0, 0, 1, 1,
0.4360256, 0.5969792, -0.6700895, 1, 0, 0, 1, 1,
0.4411454, -0.07957209, 1.840742, 0, 0, 0, 1, 1,
0.4412957, -0.6458114, 2.633754, 0, 0, 0, 1, 1,
0.4458713, -0.2642354, 1.944212, 0, 0, 0, 1, 1,
0.4459211, -0.7865145, 2.15724, 0, 0, 0, 1, 1,
0.4549493, 1.511367, -0.3414906, 0, 0, 0, 1, 1,
0.4567128, 1.254761, 0.7048165, 0, 0, 0, 1, 1,
0.4575031, 0.8661548, 1.708601, 0, 0, 0, 1, 1,
0.4611744, -1.314922, 2.521154, 1, 1, 1, 1, 1,
0.4689852, -1.484395, 2.581381, 1, 1, 1, 1, 1,
0.4700058, 0.2325238, 1.322887, 1, 1, 1, 1, 1,
0.4735539, -0.9717191, 1.09335, 1, 1, 1, 1, 1,
0.4769076, -0.8093087, 1.711313, 1, 1, 1, 1, 1,
0.4784502, -0.5669733, 2.455506, 1, 1, 1, 1, 1,
0.4930015, -0.1531741, 2.644387, 1, 1, 1, 1, 1,
0.4948699, -1.825693, 3.320874, 1, 1, 1, 1, 1,
0.4995406, 0.6584054, 2.451728, 1, 1, 1, 1, 1,
0.5027434, 0.2342597, 0.9028337, 1, 1, 1, 1, 1,
0.50388, -0.7862455, 1.967175, 1, 1, 1, 1, 1,
0.5064057, -0.5972807, 3.719411, 1, 1, 1, 1, 1,
0.508811, -1.221861, 2.788419, 1, 1, 1, 1, 1,
0.509504, -0.01551213, 1.470501, 1, 1, 1, 1, 1,
0.5099754, -0.1159115, 0.03710264, 1, 1, 1, 1, 1,
0.5109321, 0.4030848, -0.697619, 0, 0, 1, 1, 1,
0.5124456, 0.5954142, 1.173709, 1, 0, 0, 1, 1,
0.5186625, -0.4759978, 2.206451, 1, 0, 0, 1, 1,
0.5189708, -1.060742, 1.907061, 1, 0, 0, 1, 1,
0.5193378, -0.9242154, 0.8617446, 1, 0, 0, 1, 1,
0.5227746, 0.8451746, 0.05368186, 1, 0, 0, 1, 1,
0.5261585, 0.02540796, -0.255155, 0, 0, 0, 1, 1,
0.5269457, 0.4300857, 1.312719, 0, 0, 0, 1, 1,
0.5336056, -0.7014948, 1.925066, 0, 0, 0, 1, 1,
0.538593, 0.1074827, 1.481001, 0, 0, 0, 1, 1,
0.544972, 0.7321503, -0.1285187, 0, 0, 0, 1, 1,
0.5450072, 0.06693478, 0.4587273, 0, 0, 0, 1, 1,
0.5587626, 0.1874112, 1.638603, 0, 0, 0, 1, 1,
0.5664699, 0.736241, 2.187078, 1, 1, 1, 1, 1,
0.5701507, 0.8725111, -0.04830293, 1, 1, 1, 1, 1,
0.5721353, -2.026895, 3.921478, 1, 1, 1, 1, 1,
0.5764492, -0.600071, 4.825564, 1, 1, 1, 1, 1,
0.5849379, 0.08077393, 1.511881, 1, 1, 1, 1, 1,
0.5853415, 0.7853357, -0.0375388, 1, 1, 1, 1, 1,
0.5921112, 0.3477437, 0.7954001, 1, 1, 1, 1, 1,
0.5929507, 2.498793, -0.3010556, 1, 1, 1, 1, 1,
0.5943816, -0.6551178, 2.257082, 1, 1, 1, 1, 1,
0.5962747, -0.5452614, 3.331968, 1, 1, 1, 1, 1,
0.5984386, 0.6756975, 1.393539, 1, 1, 1, 1, 1,
0.6065508, 0.8269926, -0.1246099, 1, 1, 1, 1, 1,
0.6081785, -1.710159, 2.827523, 1, 1, 1, 1, 1,
0.6083366, 0.309833, 1.257058, 1, 1, 1, 1, 1,
0.6156951, -0.3634759, 2.631777, 1, 1, 1, 1, 1,
0.6201742, -1.139095, 3.968142, 0, 0, 1, 1, 1,
0.6236651, 1.465016, -0.1229582, 1, 0, 0, 1, 1,
0.6240017, 0.3080984, 1.483512, 1, 0, 0, 1, 1,
0.6252697, 0.6868032, 2.638524, 1, 0, 0, 1, 1,
0.6254076, 0.496618, -0.3778504, 1, 0, 0, 1, 1,
0.6273874, -0.1576426, 1.92886, 1, 0, 0, 1, 1,
0.6274748, -0.8463097, 2.469149, 0, 0, 0, 1, 1,
0.6275843, -0.3630153, 1.415417, 0, 0, 0, 1, 1,
0.6278599, 0.9938734, -1.110728, 0, 0, 0, 1, 1,
0.6299578, -1.037404, 2.895685, 0, 0, 0, 1, 1,
0.6331164, -1.281, 2.314108, 0, 0, 0, 1, 1,
0.6464604, -2.839818, 3.668277, 0, 0, 0, 1, 1,
0.647141, 1.085092, 0.8786045, 0, 0, 0, 1, 1,
0.6608762, -1.210454, 3.356218, 1, 1, 1, 1, 1,
0.6623824, 0.4470023, 0.6996312, 1, 1, 1, 1, 1,
0.6637575, -1.428002, 3.431901, 1, 1, 1, 1, 1,
0.6680866, -1.40646, 3.63496, 1, 1, 1, 1, 1,
0.6699629, -0.3368277, 2.873592, 1, 1, 1, 1, 1,
0.673326, -1.220142, 2.875238, 1, 1, 1, 1, 1,
0.6738926, -0.6834211, 0.5102227, 1, 1, 1, 1, 1,
0.6761376, 0.08203268, 1.773628, 1, 1, 1, 1, 1,
0.6761761, -0.3998531, 4.888764, 1, 1, 1, 1, 1,
0.6774405, -0.1627526, 3.405454, 1, 1, 1, 1, 1,
0.6832079, 1.841718, 1.331265, 1, 1, 1, 1, 1,
0.6961582, -0.3626827, 2.10398, 1, 1, 1, 1, 1,
0.6998138, -0.6317002, 2.759036, 1, 1, 1, 1, 1,
0.6998516, -1.110248, 2.631097, 1, 1, 1, 1, 1,
0.7022344, -1.193763, 1.581531, 1, 1, 1, 1, 1,
0.7028206, -1.064191, 2.49396, 0, 0, 1, 1, 1,
0.7059897, 0.6071621, 0.6824808, 1, 0, 0, 1, 1,
0.7106631, -1.26349, 3.027296, 1, 0, 0, 1, 1,
0.7211504, -1.999217, 3.982996, 1, 0, 0, 1, 1,
0.7233901, -0.3315969, 0.6877438, 1, 0, 0, 1, 1,
0.7234069, -0.5585607, 2.778532, 1, 0, 0, 1, 1,
0.7262095, 0.2279201, 0.5121608, 0, 0, 0, 1, 1,
0.7268984, 0.4206721, 1.499406, 0, 0, 0, 1, 1,
0.7384129, -1.099906, 4.596296, 0, 0, 0, 1, 1,
0.7458048, 0.08656434, 0.8890477, 0, 0, 0, 1, 1,
0.7467414, 0.604871, -0.975082, 0, 0, 0, 1, 1,
0.7520732, 0.9279572, 0.5753636, 0, 0, 0, 1, 1,
0.7544903, -0.2633693, 0.6458435, 0, 0, 0, 1, 1,
0.7571712, -1.965937, 3.784536, 1, 1, 1, 1, 1,
0.7585797, -1.090693, 2.983038, 1, 1, 1, 1, 1,
0.7590041, 1.186688, -0.1643894, 1, 1, 1, 1, 1,
0.7593676, -1.234464, 2.098735, 1, 1, 1, 1, 1,
0.7613075, -0.6482376, 0.8045344, 1, 1, 1, 1, 1,
0.7616291, 0.2452829, 1.259595, 1, 1, 1, 1, 1,
0.764148, -0.7676074, 2.028358, 1, 1, 1, 1, 1,
0.768481, 1.214264, -0.2198367, 1, 1, 1, 1, 1,
0.768841, -1.385559, 2.407551, 1, 1, 1, 1, 1,
0.7699754, -0.6697133, 1.576936, 1, 1, 1, 1, 1,
0.7700601, 0.2751605, 0.8528309, 1, 1, 1, 1, 1,
0.7787012, -0.509339, 1.90205, 1, 1, 1, 1, 1,
0.7805732, 0.9404861, 1.380141, 1, 1, 1, 1, 1,
0.7824796, -1.918567, 2.938065, 1, 1, 1, 1, 1,
0.7920799, -1.044163, 2.879879, 1, 1, 1, 1, 1,
0.7934813, 0.4131439, 1.209045, 0, 0, 1, 1, 1,
0.7939762, -0.07052547, 2.749739, 1, 0, 0, 1, 1,
0.7947741, 0.1132796, 3.48633, 1, 0, 0, 1, 1,
0.798727, -0.9034923, 1.783198, 1, 0, 0, 1, 1,
0.7988807, 0.3774964, -0.5242161, 1, 0, 0, 1, 1,
0.8005818, 0.0275955, 0.7347372, 1, 0, 0, 1, 1,
0.8045399, 0.544629, 1.064022, 0, 0, 0, 1, 1,
0.8050461, -2.340482, 3.03357, 0, 0, 0, 1, 1,
0.8061307, -0.9485818, 3.740781, 0, 0, 0, 1, 1,
0.8124395, 1.373541, 0.1444592, 0, 0, 0, 1, 1,
0.8146296, 0.1605632, 1.78398, 0, 0, 0, 1, 1,
0.8172325, -0.7857555, 2.751164, 0, 0, 0, 1, 1,
0.8182765, -0.6851484, 2.595079, 0, 0, 0, 1, 1,
0.8200796, -0.5296791, 1.990785, 1, 1, 1, 1, 1,
0.8235363, -0.3998712, 2.675961, 1, 1, 1, 1, 1,
0.8250912, -1.636779, 4.108259, 1, 1, 1, 1, 1,
0.8267248, -0.6633465, 2.261018, 1, 1, 1, 1, 1,
0.8274983, 0.2571283, 2.304715, 1, 1, 1, 1, 1,
0.8290818, -0.4244022, 1.872333, 1, 1, 1, 1, 1,
0.8348152, -0.4252184, 2.426502, 1, 1, 1, 1, 1,
0.8402705, 0.5312603, -1.416188, 1, 1, 1, 1, 1,
0.8482322, -0.5460392, 2.132254, 1, 1, 1, 1, 1,
0.8512305, 0.3301304, -0.3443114, 1, 1, 1, 1, 1,
0.8532953, -0.2193464, 2.893409, 1, 1, 1, 1, 1,
0.8545238, 1.078399, 0.9316545, 1, 1, 1, 1, 1,
0.8564849, -1.22668, 1.715533, 1, 1, 1, 1, 1,
0.8568325, -1.045971, 1.267008, 1, 1, 1, 1, 1,
0.8659056, 1.097498, 0.4456525, 1, 1, 1, 1, 1,
0.8668309, 1.728861, -1.243333, 0, 0, 1, 1, 1,
0.8685657, -0.4448176, 1.557318, 1, 0, 0, 1, 1,
0.8701483, 0.1870493, 1.459785, 1, 0, 0, 1, 1,
0.8725735, -1.62447, 3.323333, 1, 0, 0, 1, 1,
0.8738852, 0.01265553, 1.536624, 1, 0, 0, 1, 1,
0.8774886, 1.811857, 0.3389075, 1, 0, 0, 1, 1,
0.878346, 0.3342479, 3.22753, 0, 0, 0, 1, 1,
0.8792714, 0.816257, -1.4721, 0, 0, 0, 1, 1,
0.8819125, 0.9869231, 0.9536729, 0, 0, 0, 1, 1,
0.8854346, 0.5546552, 2.011256, 0, 0, 0, 1, 1,
0.8917546, 0.3986729, 2.81395, 0, 0, 0, 1, 1,
0.8925246, 0.1546226, 1.890871, 0, 0, 0, 1, 1,
0.8956059, 0.09860047, 1.154508, 0, 0, 0, 1, 1,
0.9013766, -1.080092, 2.557766, 1, 1, 1, 1, 1,
0.9029234, -1.273163, 2.07959, 1, 1, 1, 1, 1,
0.9075631, -0.9290698, 2.035251, 1, 1, 1, 1, 1,
0.908457, -0.5244908, 2.522921, 1, 1, 1, 1, 1,
0.909847, 0.03520557, 0.6543381, 1, 1, 1, 1, 1,
0.9127966, 0.1443132, 2.205255, 1, 1, 1, 1, 1,
0.9153918, 1.089663, -0.2530553, 1, 1, 1, 1, 1,
0.916748, 0.9568304, 1.148844, 1, 1, 1, 1, 1,
0.9231923, -0.4540339, 1.18298, 1, 1, 1, 1, 1,
0.9256467, 0.9215684, 1.166454, 1, 1, 1, 1, 1,
0.9265975, 0.5070572, 0.7037874, 1, 1, 1, 1, 1,
0.9345392, 1.441329, 0.472856, 1, 1, 1, 1, 1,
0.9350607, -0.5080567, 2.669037, 1, 1, 1, 1, 1,
0.9366732, -0.9235456, 1.49756, 1, 1, 1, 1, 1,
0.9383936, 0.4190231, 1.21118, 1, 1, 1, 1, 1,
0.9448411, 1.219084, 3.089751, 0, 0, 1, 1, 1,
0.9618509, 1.499239, 0.420994, 1, 0, 0, 1, 1,
0.9648702, 0.2091827, 1.552858, 1, 0, 0, 1, 1,
0.9663025, -1.073835, 2.169415, 1, 0, 0, 1, 1,
0.9745435, 0.6027456, 2.492735, 1, 0, 0, 1, 1,
0.9756936, -0.3833998, 2.159003, 1, 0, 0, 1, 1,
0.9810625, 0.8567642, 2.221236, 0, 0, 0, 1, 1,
0.9833896, -0.9452915, 2.113496, 0, 0, 0, 1, 1,
0.9936004, 0.1027169, 1.988668, 0, 0, 0, 1, 1,
0.9997151, -0.5392591, 0.1270499, 0, 0, 0, 1, 1,
1.002949, -0.3729106, 2.859735, 0, 0, 0, 1, 1,
1.01434, -0.7556934, 3.275887, 0, 0, 0, 1, 1,
1.021703, -0.9699345, 2.795528, 0, 0, 0, 1, 1,
1.035942, -0.6084728, -0.2379304, 1, 1, 1, 1, 1,
1.042786, 0.9257116, -0.2267256, 1, 1, 1, 1, 1,
1.043653, -0.4379533, 1.362236, 1, 1, 1, 1, 1,
1.044571, -1.539216, 3.098927, 1, 1, 1, 1, 1,
1.04563, -0.9246442, 1.683774, 1, 1, 1, 1, 1,
1.052688, -0.7310507, 2.211526, 1, 1, 1, 1, 1,
1.056042, 0.05643283, 0.5448768, 1, 1, 1, 1, 1,
1.059127, -0.660919, 1.086666, 1, 1, 1, 1, 1,
1.063185, -0.1150112, 2.299093, 1, 1, 1, 1, 1,
1.065022, 0.4146943, 0.5837935, 1, 1, 1, 1, 1,
1.06614, 2.06071, -0.6956308, 1, 1, 1, 1, 1,
1.07837, -1.457666, 1.740849, 1, 1, 1, 1, 1,
1.078408, -0.03232769, 0.1761633, 1, 1, 1, 1, 1,
1.08135, -0.3547203, 0.2031652, 1, 1, 1, 1, 1,
1.082651, 0.4748258, 3.047964, 1, 1, 1, 1, 1,
1.085553, 0.2618571, 1.932773, 0, 0, 1, 1, 1,
1.087088, -0.92149, 2.138553, 1, 0, 0, 1, 1,
1.095606, 0.7551425, 1.74168, 1, 0, 0, 1, 1,
1.09735, -0.1325312, 2.154185, 1, 0, 0, 1, 1,
1.099533, -0.3712368, 0.7111651, 1, 0, 0, 1, 1,
1.100449, 0.5755772, 1.515145, 1, 0, 0, 1, 1,
1.108484, -0.5081619, 1.82428, 0, 0, 0, 1, 1,
1.117007, 0.7830499, 2.442029, 0, 0, 0, 1, 1,
1.124084, 0.3897437, 0.6902915, 0, 0, 0, 1, 1,
1.126519, -1.092337, 2.268595, 0, 0, 0, 1, 1,
1.128973, 0.3277591, 3.529751, 0, 0, 0, 1, 1,
1.131332, -0.4036433, 1.583794, 0, 0, 0, 1, 1,
1.131578, -0.5497817, 3.760201, 0, 0, 0, 1, 1,
1.136114, -0.2097061, 1.818808, 1, 1, 1, 1, 1,
1.139753, 0.5173657, 1.050087, 1, 1, 1, 1, 1,
1.169984, 0.9725956, 1.78069, 1, 1, 1, 1, 1,
1.172976, -0.09557063, 2.378767, 1, 1, 1, 1, 1,
1.187871, -0.9440074, 2.530798, 1, 1, 1, 1, 1,
1.202399, 0.4728163, 1.074971, 1, 1, 1, 1, 1,
1.203655, -0.5574507, 1.621206, 1, 1, 1, 1, 1,
1.204313, 1.132098, 1.757789, 1, 1, 1, 1, 1,
1.206249, 0.03639546, 1.49113, 1, 1, 1, 1, 1,
1.208082, 0.7883905, 2.007169, 1, 1, 1, 1, 1,
1.218437, -0.5513077, 0.1719853, 1, 1, 1, 1, 1,
1.221352, 0.5989181, 2.662081, 1, 1, 1, 1, 1,
1.222048, 0.2955607, -0.5932065, 1, 1, 1, 1, 1,
1.228434, 0.8672256, 1.088807, 1, 1, 1, 1, 1,
1.232733, 0.1797756, 1.320696, 1, 1, 1, 1, 1,
1.234865, -0.6239135, 4.102298, 0, 0, 1, 1, 1,
1.23713, -0.5823331, 2.595414, 1, 0, 0, 1, 1,
1.237922, 0.3703333, -1.236943, 1, 0, 0, 1, 1,
1.240855, 0.453688, 1.679669, 1, 0, 0, 1, 1,
1.243543, 1.265064, 2.365812, 1, 0, 0, 1, 1,
1.267826, -0.6726539, 3.153044, 1, 0, 0, 1, 1,
1.275149, -0.8851599, 4.390619, 0, 0, 0, 1, 1,
1.277566, -1.138079, 2.009701, 0, 0, 0, 1, 1,
1.290546, 0.8795876, 2.596056, 0, 0, 0, 1, 1,
1.290558, -0.1957247, 2.84766, 0, 0, 0, 1, 1,
1.295043, -0.8480274, 1.592162, 0, 0, 0, 1, 1,
1.301034, -1.447194, 1.019826, 0, 0, 0, 1, 1,
1.301643, 0.1389837, 2.300086, 0, 0, 0, 1, 1,
1.303112, 0.3507506, 1.61784, 1, 1, 1, 1, 1,
1.306, 0.1775848, 1.911487, 1, 1, 1, 1, 1,
1.31415, 0.4663285, 2.107953, 1, 1, 1, 1, 1,
1.315873, 1.162634, 0.2603503, 1, 1, 1, 1, 1,
1.316868, -0.970503, 2.831092, 1, 1, 1, 1, 1,
1.318811, 0.8394164, 2.22366, 1, 1, 1, 1, 1,
1.319329, 0.3358773, 0.02028273, 1, 1, 1, 1, 1,
1.322276, -0.9337372, 0.5653051, 1, 1, 1, 1, 1,
1.328094, -0.5983365, 2.827189, 1, 1, 1, 1, 1,
1.331267, 0.09757458, 1.28192, 1, 1, 1, 1, 1,
1.332203, 0.7521126, 1.743539, 1, 1, 1, 1, 1,
1.341471, -0.6546973, 1.924543, 1, 1, 1, 1, 1,
1.364158, -0.1105001, 2.221491, 1, 1, 1, 1, 1,
1.372006, 0.7891633, 1.650326, 1, 1, 1, 1, 1,
1.382075, -0.428022, 0.9225503, 1, 1, 1, 1, 1,
1.391469, -0.7118433, 2.210174, 0, 0, 1, 1, 1,
1.392984, 0.9459433, 3.541959, 1, 0, 0, 1, 1,
1.399251, 1.82687, 0.6000716, 1, 0, 0, 1, 1,
1.403445, -0.07029045, 2.307532, 1, 0, 0, 1, 1,
1.406061, -0.6281607, 0.3392622, 1, 0, 0, 1, 1,
1.406531, 0.4020314, 0.46056, 1, 0, 0, 1, 1,
1.407531, 0.3121617, 1.411551, 0, 0, 0, 1, 1,
1.414932, -1.63758, 2.507547, 0, 0, 0, 1, 1,
1.415785, 0.7449339, -0.1568158, 0, 0, 0, 1, 1,
1.434766, -0.3669989, 2.049217, 0, 0, 0, 1, 1,
1.46765, 0.08402057, 0.7255613, 0, 0, 0, 1, 1,
1.474169, -1.605532, 0.1703474, 0, 0, 0, 1, 1,
1.479461, 0.3426062, -0.5643644, 0, 0, 0, 1, 1,
1.490947, -0.6754476, 0.5808789, 1, 1, 1, 1, 1,
1.492665, 0.9037707, 1.050334, 1, 1, 1, 1, 1,
1.494528, 1.421924, 1.573586, 1, 1, 1, 1, 1,
1.511256, -1.377217, 2.654698, 1, 1, 1, 1, 1,
1.518191, -1.156793, 2.057983, 1, 1, 1, 1, 1,
1.521382, -0.979062, 1.180057, 1, 1, 1, 1, 1,
1.536567, 2.071554, 1.041006, 1, 1, 1, 1, 1,
1.546282, 0.7918797, 0.6740691, 1, 1, 1, 1, 1,
1.560565, 0.6426386, 1.430423, 1, 1, 1, 1, 1,
1.566662, -0.2886307, 0.7500933, 1, 1, 1, 1, 1,
1.568958, 0.1997698, 0.5250346, 1, 1, 1, 1, 1,
1.57996, -1.50485, 1.105816, 1, 1, 1, 1, 1,
1.584016, 1.865141, 0.6559856, 1, 1, 1, 1, 1,
1.598329, -0.2390741, 1.769814, 1, 1, 1, 1, 1,
1.601326, 1.11726, 1.12207, 1, 1, 1, 1, 1,
1.601644, -1.413812, 3.155646, 0, 0, 1, 1, 1,
1.610574, -0.2677424, 3.340642, 1, 0, 0, 1, 1,
1.612433, 0.07278764, 2.048863, 1, 0, 0, 1, 1,
1.618194, -1.643941, 0.3342558, 1, 0, 0, 1, 1,
1.624796, 0.05857226, 0.4506599, 1, 0, 0, 1, 1,
1.630376, -1.211159, 2.625755, 1, 0, 0, 1, 1,
1.638569, -0.3204164, 2.914202, 0, 0, 0, 1, 1,
1.639354, 0.4872437, 0.427835, 0, 0, 0, 1, 1,
1.660393, 0.639909, 2.146552, 0, 0, 0, 1, 1,
1.663806, -0.2203583, 2.050411, 0, 0, 0, 1, 1,
1.690489, -0.3613334, 2.17779, 0, 0, 0, 1, 1,
1.699131, -0.7097756, 3.793687, 0, 0, 0, 1, 1,
1.707398, -1.150091, 1.539108, 0, 0, 0, 1, 1,
1.726416, 0.9527385, 0.07775007, 1, 1, 1, 1, 1,
1.741665, -1.245744, 2.746219, 1, 1, 1, 1, 1,
1.742106, 0.9556119, 1.579413, 1, 1, 1, 1, 1,
1.752664, 0.577874, 2.122729, 1, 1, 1, 1, 1,
1.765901, 0.8519339, -0.7690501, 1, 1, 1, 1, 1,
1.788083, 0.4731132, 1.422873, 1, 1, 1, 1, 1,
1.802371, 1.266285, 2.67553, 1, 1, 1, 1, 1,
1.812539, 1.265253, 0.537078, 1, 1, 1, 1, 1,
1.844006, 1.887543, 0.07978006, 1, 1, 1, 1, 1,
1.85972, 0.3689139, 0.4538121, 1, 1, 1, 1, 1,
1.881591, 0.1892237, 0.433723, 1, 1, 1, 1, 1,
1.896491, -0.4672031, 1.822344, 1, 1, 1, 1, 1,
1.905342, -1.600966, 3.04707, 1, 1, 1, 1, 1,
1.934685, 1.931802, 0.4861407, 1, 1, 1, 1, 1,
1.970609, -0.6541364, 1.680486, 1, 1, 1, 1, 1,
2.008351, 0.8325256, 1.291588, 0, 0, 1, 1, 1,
2.021839, 0.3357842, 2.596138, 1, 0, 0, 1, 1,
2.049099, 0.3133831, -1.208889, 1, 0, 0, 1, 1,
2.064051, 0.5675426, 2.452408, 1, 0, 0, 1, 1,
2.087997, -2.717869, 2.63809, 1, 0, 0, 1, 1,
2.089389, -0.9722695, 0.8893625, 1, 0, 0, 1, 1,
2.17844, -0.02955472, -0.3298434, 0, 0, 0, 1, 1,
2.39404, 0.3573148, 2.330023, 0, 0, 0, 1, 1,
2.400595, -0.649626, 3.864442, 0, 0, 0, 1, 1,
2.466149, -1.244451, 2.362602, 0, 0, 0, 1, 1,
2.479073, -1.514632, 0.6222435, 0, 0, 0, 1, 1,
2.491562, -0.591125, 2.594294, 0, 0, 0, 1, 1,
2.533975, -1.296998, 0.7116072, 0, 0, 0, 1, 1,
2.574058, -1.591707, 2.31917, 1, 1, 1, 1, 1,
2.604953, -0.6182896, 0.7287684, 1, 1, 1, 1, 1,
2.685801, 1.321758, 2.044619, 1, 1, 1, 1, 1,
2.694436, -0.1155103, 1.724653, 1, 1, 1, 1, 1,
2.695117, -0.4471798, 2.884982, 1, 1, 1, 1, 1,
2.714551, -0.6420007, 2.363647, 1, 1, 1, 1, 1,
2.720734, -0.2187328, 2.223332, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.974784;
var distance = 31.52355;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.01079965, 0.07957089, 0.3163757 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.52355);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
