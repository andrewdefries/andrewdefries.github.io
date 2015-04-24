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
-3.000506, -0.383289, -0.8087829, 1, 0, 0, 1,
-2.599207, 0.2535707, -0.4071793, 1, 0.007843138, 0, 1,
-2.540303, 1.188485, -1.818665, 1, 0.01176471, 0, 1,
-2.365978, 0.2742095, -3.190964, 1, 0.01960784, 0, 1,
-2.359433, 0.00276037, -3.209517, 1, 0.02352941, 0, 1,
-2.352426, 0.06469089, -2.740202, 1, 0.03137255, 0, 1,
-2.350719, 0.09892548, -0.7645007, 1, 0.03529412, 0, 1,
-2.287902, -0.01084066, -0.9933047, 1, 0.04313726, 0, 1,
-2.266599, -0.8365626, -1.741705, 1, 0.04705882, 0, 1,
-2.262584, 0.1185459, -3.323164, 1, 0.05490196, 0, 1,
-2.201114, 0.3387505, -1.369448, 1, 0.05882353, 0, 1,
-2.176318, -0.904337, -2.083586, 1, 0.06666667, 0, 1,
-2.168628, -1.639902, -2.730723, 1, 0.07058824, 0, 1,
-2.144961, -0.2294685, -0.6283453, 1, 0.07843138, 0, 1,
-2.133912, 0.741572, 0.2766691, 1, 0.08235294, 0, 1,
-2.07616, 0.1924673, -3.384384, 1, 0.09019608, 0, 1,
-2.039467, 0.7520735, -3.008434, 1, 0.09411765, 0, 1,
-2.02261, -0.4855742, -1.534318, 1, 0.1019608, 0, 1,
-1.987083, -1.33739, -3.543907, 1, 0.1098039, 0, 1,
-1.944537, -0.5113093, -2.269913, 1, 0.1137255, 0, 1,
-1.94198, 0.2007316, -1.952767, 1, 0.1215686, 0, 1,
-1.941465, -0.987896, -2.543326, 1, 0.1254902, 0, 1,
-1.93892, 1.204256, -0.3119967, 1, 0.1333333, 0, 1,
-1.929304, -1.606631, -4.429356, 1, 0.1372549, 0, 1,
-1.921488, 0.153308, -3.26263, 1, 0.145098, 0, 1,
-1.880018, 0.009029801, -3.672397, 1, 0.1490196, 0, 1,
-1.875615, 0.902512, -0.5578524, 1, 0.1568628, 0, 1,
-1.869826, 0.8673927, -1.97463, 1, 0.1607843, 0, 1,
-1.863649, 0.6138591, -2.35144, 1, 0.1686275, 0, 1,
-1.851136, -0.3071088, -2.457403, 1, 0.172549, 0, 1,
-1.811626, 0.04058907, -2.619005, 1, 0.1803922, 0, 1,
-1.779188, 0.7912408, -2.113953, 1, 0.1843137, 0, 1,
-1.771576, -1.43526, -1.28719, 1, 0.1921569, 0, 1,
-1.765564, -0.9048603, -3.957756, 1, 0.1960784, 0, 1,
-1.741804, 0.4975615, -1.213241, 1, 0.2039216, 0, 1,
-1.741278, -0.9880107, -2.863409, 1, 0.2117647, 0, 1,
-1.728048, 1.317127, -0.9840197, 1, 0.2156863, 0, 1,
-1.70547, 1.754512, -1.564889, 1, 0.2235294, 0, 1,
-1.6698, 0.2929711, -1.105833, 1, 0.227451, 0, 1,
-1.657627, -0.5407152, -1.826772, 1, 0.2352941, 0, 1,
-1.656059, 0.5498311, -1.079979, 1, 0.2392157, 0, 1,
-1.649323, 1.138957, -0.2902996, 1, 0.2470588, 0, 1,
-1.64271, -1.545364, -2.04828, 1, 0.2509804, 0, 1,
-1.638431, -0.7285466, -3.075959, 1, 0.2588235, 0, 1,
-1.603064, -1.092913, -3.549099, 1, 0.2627451, 0, 1,
-1.595019, -1.536767, -1.867221, 1, 0.2705882, 0, 1,
-1.592502, -1.052349, -2.262282, 1, 0.2745098, 0, 1,
-1.591528, -0.3352334, -1.647663, 1, 0.282353, 0, 1,
-1.585678, -2.059505, -3.190055, 1, 0.2862745, 0, 1,
-1.57612, 0.5348291, -1.630777, 1, 0.2941177, 0, 1,
-1.569654, -1.050251, -2.297455, 1, 0.3019608, 0, 1,
-1.566041, -0.1435751, -1.894813, 1, 0.3058824, 0, 1,
-1.55689, 0.1097034, -3.144127, 1, 0.3137255, 0, 1,
-1.53864, -0.174684, -0.07765102, 1, 0.3176471, 0, 1,
-1.519449, 0.6062744, -1.25714, 1, 0.3254902, 0, 1,
-1.505012, 1.269392, -1.633609, 1, 0.3294118, 0, 1,
-1.503208, -0.5577112, -2.13201, 1, 0.3372549, 0, 1,
-1.496066, 1.088728, -1.00676, 1, 0.3411765, 0, 1,
-1.491643, -1.010567, -3.32647, 1, 0.3490196, 0, 1,
-1.486513, 0.2039043, -2.652444, 1, 0.3529412, 0, 1,
-1.465734, 0.1948822, -1.402369, 1, 0.3607843, 0, 1,
-1.450059, 0.5430481, -1.420465, 1, 0.3647059, 0, 1,
-1.44859, -1.409495, -2.81128, 1, 0.372549, 0, 1,
-1.437689, 0.494893, -1.756029, 1, 0.3764706, 0, 1,
-1.433404, 1.275659, -0.1823056, 1, 0.3843137, 0, 1,
-1.429986, -0.2505872, 0.7055823, 1, 0.3882353, 0, 1,
-1.429454, 0.4656095, 1.002595, 1, 0.3960784, 0, 1,
-1.412752, 0.7626646, -3.725552, 1, 0.4039216, 0, 1,
-1.409163, -0.03590081, -2.281159, 1, 0.4078431, 0, 1,
-1.407327, 0.2562352, 1.128233, 1, 0.4156863, 0, 1,
-1.402888, 0.6952991, -0.7647002, 1, 0.4196078, 0, 1,
-1.39171, 0.576449, -0.9880621, 1, 0.427451, 0, 1,
-1.379873, -0.3950251, -1.708493, 1, 0.4313726, 0, 1,
-1.372386, -1.547051, -2.441701, 1, 0.4392157, 0, 1,
-1.371668, -1.454431, -3.943227, 1, 0.4431373, 0, 1,
-1.367701, -3.33859, -1.45468, 1, 0.4509804, 0, 1,
-1.363573, 0.1067228, -0.7084133, 1, 0.454902, 0, 1,
-1.351472, 0.2398674, -1.16996, 1, 0.4627451, 0, 1,
-1.346243, 2.071191, 0.3335549, 1, 0.4666667, 0, 1,
-1.339435, -0.7017956, -1.684504, 1, 0.4745098, 0, 1,
-1.337214, 0.9625909, -0.3699555, 1, 0.4784314, 0, 1,
-1.336636, -0.2093025, -2.178451, 1, 0.4862745, 0, 1,
-1.334727, -0.1705993, -2.939672, 1, 0.4901961, 0, 1,
-1.334721, 0.2329994, -1.513859, 1, 0.4980392, 0, 1,
-1.333213, -0.8467172, -3.246188, 1, 0.5058824, 0, 1,
-1.324005, -0.4212521, -3.466357, 1, 0.509804, 0, 1,
-1.320708, 1.04853, 0.6104566, 1, 0.5176471, 0, 1,
-1.316042, 0.3189878, -1.593916, 1, 0.5215687, 0, 1,
-1.30865, -1.322997, -1.797935, 1, 0.5294118, 0, 1,
-1.29997, -0.3273351, -1.897135, 1, 0.5333334, 0, 1,
-1.294502, -1.160578, -1.855436, 1, 0.5411765, 0, 1,
-1.294134, 0.1784688, -2.901899, 1, 0.5450981, 0, 1,
-1.286622, 0.622453, -0.4489819, 1, 0.5529412, 0, 1,
-1.279932, -1.219366, -4.686517, 1, 0.5568628, 0, 1,
-1.263506, -1.022189, -1.116525, 1, 0.5647059, 0, 1,
-1.263131, 1.59666, -0.4008024, 1, 0.5686275, 0, 1,
-1.262186, 0.02337128, -1.426545, 1, 0.5764706, 0, 1,
-1.259263, 0.2383617, -0.381273, 1, 0.5803922, 0, 1,
-1.257038, 0.5234092, -0.449845, 1, 0.5882353, 0, 1,
-1.255562, -1.233994, -1.41572, 1, 0.5921569, 0, 1,
-1.241811, 1.028761, -0.8893237, 1, 0.6, 0, 1,
-1.225882, 0.9313824, -2.727278, 1, 0.6078432, 0, 1,
-1.221735, 0.4829331, -2.475023, 1, 0.6117647, 0, 1,
-1.220884, 0.7563322, -0.7950634, 1, 0.6196079, 0, 1,
-1.219982, 0.2989502, -0.5925507, 1, 0.6235294, 0, 1,
-1.215824, 0.5390687, 0.03726137, 1, 0.6313726, 0, 1,
-1.215721, -0.003838379, -0.8956375, 1, 0.6352941, 0, 1,
-1.208408, -0.02807887, -2.194833, 1, 0.6431373, 0, 1,
-1.207519, 0.6849093, -1.769716, 1, 0.6470588, 0, 1,
-1.205649, -1.24408, -2.977513, 1, 0.654902, 0, 1,
-1.204863, 1.19895, -0.1130079, 1, 0.6588235, 0, 1,
-1.204763, -0.8576519, -2.328083, 1, 0.6666667, 0, 1,
-1.20372, 0.2940138, -0.8622898, 1, 0.6705883, 0, 1,
-1.198014, 0.9375638, -0.03345041, 1, 0.6784314, 0, 1,
-1.196607, 0.8889089, -2.397744, 1, 0.682353, 0, 1,
-1.186978, -0.4300819, 0.2405466, 1, 0.6901961, 0, 1,
-1.16124, 0.875416, 0.4858869, 1, 0.6941177, 0, 1,
-1.155212, -0.3915739, -1.674924, 1, 0.7019608, 0, 1,
-1.145589, -0.2006421, -1.406182, 1, 0.7098039, 0, 1,
-1.144192, 1.003896, 0.05136437, 1, 0.7137255, 0, 1,
-1.139494, -1.49047, -3.064795, 1, 0.7215686, 0, 1,
-1.136052, 1.736862, -2.38271, 1, 0.7254902, 0, 1,
-1.129074, 1.038511, 0.1973785, 1, 0.7333333, 0, 1,
-1.11751, 1.606605, -0.7714305, 1, 0.7372549, 0, 1,
-1.092757, 0.07029176, -2.745248, 1, 0.7450981, 0, 1,
-1.09117, -1.326777, -2.562733, 1, 0.7490196, 0, 1,
-1.089483, 0.3154688, -1.75412, 1, 0.7568628, 0, 1,
-1.089, 0.4132876, -1.92554, 1, 0.7607843, 0, 1,
-1.086585, -0.4916866, -2.787127, 1, 0.7686275, 0, 1,
-1.07968, -1.236082, -1.93897, 1, 0.772549, 0, 1,
-1.07927, -0.5632657, -0.7359404, 1, 0.7803922, 0, 1,
-1.076277, 1.020367, -0.997654, 1, 0.7843137, 0, 1,
-1.066042, -1.585196, -1.861674, 1, 0.7921569, 0, 1,
-1.065799, 1.276209, -1.257632, 1, 0.7960784, 0, 1,
-1.064256, -0.2135133, -1.073094, 1, 0.8039216, 0, 1,
-1.063846, 1.715177, 0.4916753, 1, 0.8117647, 0, 1,
-1.032777, -0.6570474, -1.255229, 1, 0.8156863, 0, 1,
-1.030486, -0.3249092, -3.135202, 1, 0.8235294, 0, 1,
-1.025964, 0.740531, -3.179044, 1, 0.827451, 0, 1,
-1.01979, -0.1500591, -0.8558324, 1, 0.8352941, 0, 1,
-1.01942, -0.8569642, -2.303464, 1, 0.8392157, 0, 1,
-1.016294, 0.4092709, -1.039213, 1, 0.8470588, 0, 1,
-1.013174, -1.135376, -3.193356, 1, 0.8509804, 0, 1,
-1.011714, 0.4660536, -0.08313138, 1, 0.8588235, 0, 1,
-1.008534, -0.172946, -2.029573, 1, 0.8627451, 0, 1,
-1.008371, -1.236209, -1.436994, 1, 0.8705882, 0, 1,
-1.008034, 0.8594943, -0.8803024, 1, 0.8745098, 0, 1,
-1.004687, -0.4288709, -2.286787, 1, 0.8823529, 0, 1,
-1.002944, 0.7530329, 0.2249711, 1, 0.8862745, 0, 1,
-0.9983503, 1.135529, 1.036635, 1, 0.8941177, 0, 1,
-0.9978012, 0.5074381, -2.586232, 1, 0.8980392, 0, 1,
-0.9944796, -0.9281775, -4.164619, 1, 0.9058824, 0, 1,
-0.9846717, -0.6108809, -2.775032, 1, 0.9137255, 0, 1,
-0.9813756, 0.3192964, -1.143503, 1, 0.9176471, 0, 1,
-0.9802184, -0.2017586, -3.358475, 1, 0.9254902, 0, 1,
-0.9768044, 1.7671, -0.6524889, 1, 0.9294118, 0, 1,
-0.9747868, -0.8914274, -2.05696, 1, 0.9372549, 0, 1,
-0.9702871, -0.7249914, -3.072742, 1, 0.9411765, 0, 1,
-0.9682992, 0.6135869, -0.1637035, 1, 0.9490196, 0, 1,
-0.9576191, 0.0267325, -3.087477, 1, 0.9529412, 0, 1,
-0.957045, -0.09251891, -3.069302, 1, 0.9607843, 0, 1,
-0.9419925, 0.2619208, -1.246521, 1, 0.9647059, 0, 1,
-0.9397557, -0.05745192, -3.088561, 1, 0.972549, 0, 1,
-0.937082, -0.4381439, -2.785837, 1, 0.9764706, 0, 1,
-0.9317322, 0.6450216, -2.444196, 1, 0.9843137, 0, 1,
-0.9295929, -0.7616626, -3.124668, 1, 0.9882353, 0, 1,
-0.9266197, 0.8657892, -1.277292, 1, 0.9960784, 0, 1,
-0.9188007, -0.8823325, -2.775898, 0.9960784, 1, 0, 1,
-0.9095511, -0.8736092, -1.729549, 0.9921569, 1, 0, 1,
-0.9087827, 0.3690698, -1.030034, 0.9843137, 1, 0, 1,
-0.8936926, 0.8740354, 0.3875977, 0.9803922, 1, 0, 1,
-0.8927362, 0.7444814, -2.370364, 0.972549, 1, 0, 1,
-0.8925796, -0.9640326, -2.796508, 0.9686275, 1, 0, 1,
-0.8737648, 0.4432259, 0.5577732, 0.9607843, 1, 0, 1,
-0.8736917, 0.1241061, -2.131653, 0.9568627, 1, 0, 1,
-0.8695524, 1.106678, -3.807053, 0.9490196, 1, 0, 1,
-0.8676075, -1.234268, -2.781771, 0.945098, 1, 0, 1,
-0.864191, -0.753289, -3.442325, 0.9372549, 1, 0, 1,
-0.8591981, -2.402455, -2.433851, 0.9333333, 1, 0, 1,
-0.8566288, 0.2368776, -1.863304, 0.9254902, 1, 0, 1,
-0.8556697, 1.139583, -0.2195034, 0.9215686, 1, 0, 1,
-0.8530119, -0.3116691, -1.34117, 0.9137255, 1, 0, 1,
-0.8515902, 0.5313627, -1.129978, 0.9098039, 1, 0, 1,
-0.8489664, 2.494526, 0.387585, 0.9019608, 1, 0, 1,
-0.8323495, 0.4232118, 0.3756004, 0.8941177, 1, 0, 1,
-0.8273222, -0.4676176, -2.999325, 0.8901961, 1, 0, 1,
-0.8242592, 1.280943, 0.8130714, 0.8823529, 1, 0, 1,
-0.8180269, 1.732377, -0.6284093, 0.8784314, 1, 0, 1,
-0.8169406, -1.168251, -1.236077, 0.8705882, 1, 0, 1,
-0.804173, -0.3832751, -0.3851944, 0.8666667, 1, 0, 1,
-0.8032985, -1.173582, -1.113353, 0.8588235, 1, 0, 1,
-0.8027341, 0.382406, -0.154721, 0.854902, 1, 0, 1,
-0.7999292, -1.506184, -2.31332, 0.8470588, 1, 0, 1,
-0.7983899, -0.1768814, 0.262473, 0.8431373, 1, 0, 1,
-0.798372, -0.4481686, -3.689112, 0.8352941, 1, 0, 1,
-0.7943074, 0.6220989, -1.893012, 0.8313726, 1, 0, 1,
-0.7939339, 0.1922996, -0.707485, 0.8235294, 1, 0, 1,
-0.7923267, -1.132919, -2.397501, 0.8196079, 1, 0, 1,
-0.7922305, 0.6014376, -0.7191382, 0.8117647, 1, 0, 1,
-0.7905901, -0.3716428, -2.313205, 0.8078431, 1, 0, 1,
-0.7902876, -1.394893, -3.406779, 0.8, 1, 0, 1,
-0.7860773, 0.7113959, -0.8874845, 0.7921569, 1, 0, 1,
-0.7851944, 0.2854527, -1.469075, 0.7882353, 1, 0, 1,
-0.7790535, 0.3829446, -3.587289, 0.7803922, 1, 0, 1,
-0.7702872, -1.282207, -2.737362, 0.7764706, 1, 0, 1,
-0.7665312, -2.55785, -3.397901, 0.7686275, 1, 0, 1,
-0.7655689, 0.1722906, -2.375467, 0.7647059, 1, 0, 1,
-0.7618698, -0.9795007, -2.239614, 0.7568628, 1, 0, 1,
-0.7602021, 1.15233, -1.717939, 0.7529412, 1, 0, 1,
-0.7493996, -0.8802804, -1.215504, 0.7450981, 1, 0, 1,
-0.7358779, -0.3120898, 0.1373575, 0.7411765, 1, 0, 1,
-0.7348301, -0.6849023, -2.414165, 0.7333333, 1, 0, 1,
-0.7327545, 0.2948412, -0.4065114, 0.7294118, 1, 0, 1,
-0.7306108, -1.623155, -2.502987, 0.7215686, 1, 0, 1,
-0.7240255, -0.5376099, -3.487287, 0.7176471, 1, 0, 1,
-0.7225175, -1.904023, -3.618742, 0.7098039, 1, 0, 1,
-0.7202765, 0.6045523, -2.929312, 0.7058824, 1, 0, 1,
-0.7082137, -0.7137065, -2.294059, 0.6980392, 1, 0, 1,
-0.7051241, -0.1539023, -1.914491, 0.6901961, 1, 0, 1,
-0.7028049, 0.5223563, -0.2104332, 0.6862745, 1, 0, 1,
-0.7020261, -0.4498546, -4.004972, 0.6784314, 1, 0, 1,
-0.7016218, -0.2330048, -1.896518, 0.6745098, 1, 0, 1,
-0.7001262, 0.3244829, -1.692555, 0.6666667, 1, 0, 1,
-0.6970564, 0.9134848, -2.071982, 0.6627451, 1, 0, 1,
-0.6967752, -0.1288482, -3.676332, 0.654902, 1, 0, 1,
-0.6927701, 2.319129, -0.8553253, 0.6509804, 1, 0, 1,
-0.6905428, 0.5318658, -1.962038, 0.6431373, 1, 0, 1,
-0.6880897, -0.2333768, -1.237606, 0.6392157, 1, 0, 1,
-0.686552, 0.1253823, -1.075991, 0.6313726, 1, 0, 1,
-0.6828158, 0.5253583, -0.9035888, 0.627451, 1, 0, 1,
-0.678278, -1.699474, -1.824902, 0.6196079, 1, 0, 1,
-0.6773084, -0.1460293, -2.370297, 0.6156863, 1, 0, 1,
-0.6764376, -0.6038074, -2.35059, 0.6078432, 1, 0, 1,
-0.674469, -0.3871406, -1.041872, 0.6039216, 1, 0, 1,
-0.6711861, -0.1769804, 0.5561575, 0.5960785, 1, 0, 1,
-0.6698158, 0.03828507, -2.589818, 0.5882353, 1, 0, 1,
-0.6636319, -1.281517, -2.085091, 0.5843138, 1, 0, 1,
-0.6593957, 0.4484921, -2.131885, 0.5764706, 1, 0, 1,
-0.6580461, 1.628586, 1.230274, 0.572549, 1, 0, 1,
-0.656414, 2.339002, -0.377896, 0.5647059, 1, 0, 1,
-0.6549995, 0.8503736, -2.150702, 0.5607843, 1, 0, 1,
-0.6481673, -2.03336, -1.554803, 0.5529412, 1, 0, 1,
-0.6414567, -0.3351249, -1.07166, 0.5490196, 1, 0, 1,
-0.6410637, -1.031969, -3.353505, 0.5411765, 1, 0, 1,
-0.6287396, 2.029202, 1.085841, 0.5372549, 1, 0, 1,
-0.6254107, -0.6028226, -3.03636, 0.5294118, 1, 0, 1,
-0.6208097, -0.06409813, -0.3829812, 0.5254902, 1, 0, 1,
-0.6179997, 1.5567, -0.3735604, 0.5176471, 1, 0, 1,
-0.6128832, -0.3802416, -1.867941, 0.5137255, 1, 0, 1,
-0.6119798, -0.1119591, -0.4204835, 0.5058824, 1, 0, 1,
-0.6094576, 1.104246, -2.048955, 0.5019608, 1, 0, 1,
-0.6062239, -0.7556347, -3.049397, 0.4941176, 1, 0, 1,
-0.5992593, -0.7398334, -3.468507, 0.4862745, 1, 0, 1,
-0.5991358, -0.5972166, -2.974871, 0.4823529, 1, 0, 1,
-0.593822, -1.434005, -2.778707, 0.4745098, 1, 0, 1,
-0.5931122, -0.01001624, -0.2522976, 0.4705882, 1, 0, 1,
-0.5929369, 1.594284, -1.538014, 0.4627451, 1, 0, 1,
-0.5928029, -0.4172336, -1.516572, 0.4588235, 1, 0, 1,
-0.5873452, -0.5995261, -4.785729, 0.4509804, 1, 0, 1,
-0.5865233, -0.9757419, -1.938498, 0.4470588, 1, 0, 1,
-0.585948, 0.3988434, -1.734336, 0.4392157, 1, 0, 1,
-0.5830216, -0.6925793, -2.676559, 0.4352941, 1, 0, 1,
-0.5823911, 0.7947761, -0.7682101, 0.427451, 1, 0, 1,
-0.5791446, 1.09753, -0.2279864, 0.4235294, 1, 0, 1,
-0.5752985, -0.2299521, -2.340522, 0.4156863, 1, 0, 1,
-0.5732133, -0.7723356, -2.005685, 0.4117647, 1, 0, 1,
-0.5682938, 0.1398819, -1.319559, 0.4039216, 1, 0, 1,
-0.5671774, -0.1096245, -0.5443594, 0.3960784, 1, 0, 1,
-0.5651097, 0.003992788, -3.471903, 0.3921569, 1, 0, 1,
-0.5643236, 0.6152769, -1.677242, 0.3843137, 1, 0, 1,
-0.5597707, -0.1857329, -0.5479399, 0.3803922, 1, 0, 1,
-0.5581349, -0.430521, -4.02863, 0.372549, 1, 0, 1,
-0.5579653, -0.8972604, -2.164891, 0.3686275, 1, 0, 1,
-0.5526138, 1.306525, 0.4515167, 0.3607843, 1, 0, 1,
-0.5478812, -0.05425965, 0.3700975, 0.3568628, 1, 0, 1,
-0.5474769, -0.9966981, -3.683195, 0.3490196, 1, 0, 1,
-0.5443399, -0.4598174, -1.640315, 0.345098, 1, 0, 1,
-0.5432374, 1.733684, 0.06781719, 0.3372549, 1, 0, 1,
-0.5398964, -0.6186423, -2.519412, 0.3333333, 1, 0, 1,
-0.5351586, 0.4843908, 0.6983141, 0.3254902, 1, 0, 1,
-0.5313122, 0.8163866, -0.5212859, 0.3215686, 1, 0, 1,
-0.5301296, 0.6365126, -2.38537, 0.3137255, 1, 0, 1,
-0.521059, -2.345812, -2.991748, 0.3098039, 1, 0, 1,
-0.5184959, 0.5325248, -0.9923193, 0.3019608, 1, 0, 1,
-0.5092554, -0.04935829, -2.486232, 0.2941177, 1, 0, 1,
-0.5076939, 1.088448, -1.373413, 0.2901961, 1, 0, 1,
-0.5062087, -0.626, -3.617396, 0.282353, 1, 0, 1,
-0.5025605, 0.663668, -0.4829821, 0.2784314, 1, 0, 1,
-0.5012209, 1.485312, -0.4712594, 0.2705882, 1, 0, 1,
-0.5010011, 0.5069611, 1.663225, 0.2666667, 1, 0, 1,
-0.5005825, -0.6810581, -3.07599, 0.2588235, 1, 0, 1,
-0.5003452, -0.4899527, -3.474048, 0.254902, 1, 0, 1,
-0.495869, 1.616045, 1.432492, 0.2470588, 1, 0, 1,
-0.4958158, -0.1317765, -3.154423, 0.2431373, 1, 0, 1,
-0.4909217, 0.4112146, -0.6958461, 0.2352941, 1, 0, 1,
-0.4846588, -0.4785287, -3.086464, 0.2313726, 1, 0, 1,
-0.4771491, 0.4502889, -0.1350667, 0.2235294, 1, 0, 1,
-0.4751774, -0.5196447, -2.567426, 0.2196078, 1, 0, 1,
-0.4713998, 1.195504, -0.1743306, 0.2117647, 1, 0, 1,
-0.4675753, -1.550427, -3.4387, 0.2078431, 1, 0, 1,
-0.4660594, -0.8382994, -2.309748, 0.2, 1, 0, 1,
-0.464288, 0.3019871, -1.740474, 0.1921569, 1, 0, 1,
-0.4618789, 0.3854093, -0.008505023, 0.1882353, 1, 0, 1,
-0.4591118, 0.2870032, -2.471778, 0.1803922, 1, 0, 1,
-0.4567886, -1.033185, -2.698292, 0.1764706, 1, 0, 1,
-0.455956, -0.1027427, -3.287346, 0.1686275, 1, 0, 1,
-0.4487056, 0.2066119, -2.397869, 0.1647059, 1, 0, 1,
-0.4464688, 0.05432852, -0.378165, 0.1568628, 1, 0, 1,
-0.4446516, 0.08483568, -0.454024, 0.1529412, 1, 0, 1,
-0.4439583, 0.37606, -1.37608, 0.145098, 1, 0, 1,
-0.4389835, -0.110951, -1.060498, 0.1411765, 1, 0, 1,
-0.4377686, 0.1230105, -0.940508, 0.1333333, 1, 0, 1,
-0.4343731, -1.389976, -4.371235, 0.1294118, 1, 0, 1,
-0.4329138, -0.4781591, -2.516203, 0.1215686, 1, 0, 1,
-0.4316457, -0.1065719, -1.916573, 0.1176471, 1, 0, 1,
-0.4292889, -1.008696, -4.329658, 0.1098039, 1, 0, 1,
-0.4268981, -0.4062712, -0.1867811, 0.1058824, 1, 0, 1,
-0.4170281, -0.5995254, -2.135665, 0.09803922, 1, 0, 1,
-0.4137021, -0.764789, -3.30029, 0.09019608, 1, 0, 1,
-0.4134118, -1.178853, -2.970888, 0.08627451, 1, 0, 1,
-0.4133782, 1.241675, -0.248747, 0.07843138, 1, 0, 1,
-0.4119944, 1.118729, 0.2475305, 0.07450981, 1, 0, 1,
-0.4114969, 0.6255626, -1.828866, 0.06666667, 1, 0, 1,
-0.4096358, -0.4488895, -1.617671, 0.0627451, 1, 0, 1,
-0.4071013, -0.9413184, -3.98838, 0.05490196, 1, 0, 1,
-0.4061218, 0.5566688, 0.8029985, 0.05098039, 1, 0, 1,
-0.4048448, -0.9697567, -3.901461, 0.04313726, 1, 0, 1,
-0.4045129, 1.027795, -1.365258, 0.03921569, 1, 0, 1,
-0.3991277, 1.081952, 0.1326433, 0.03137255, 1, 0, 1,
-0.3972663, -0.4178173, -1.573828, 0.02745098, 1, 0, 1,
-0.3942635, 0.0517269, -0.1435001, 0.01960784, 1, 0, 1,
-0.3890354, 0.6382136, -0.6200573, 0.01568628, 1, 0, 1,
-0.3886359, -0.8889042, -2.170537, 0.007843138, 1, 0, 1,
-0.3882847, -1.191446, -1.509493, 0.003921569, 1, 0, 1,
-0.3825211, 0.2625777, -0.3894342, 0, 1, 0.003921569, 1,
-0.3789321, 0.09297398, -0.04551947, 0, 1, 0.01176471, 1,
-0.3712739, -1.520475, -3.660007, 0, 1, 0.01568628, 1,
-0.3702935, 0.7427917, 0.1540017, 0, 1, 0.02352941, 1,
-0.3692693, 0.3440515, -0.3091417, 0, 1, 0.02745098, 1,
-0.368394, 0.7023305, 0.1398082, 0, 1, 0.03529412, 1,
-0.3658926, 0.9475342, -0.8009539, 0, 1, 0.03921569, 1,
-0.3623527, -1.483476, -4.832938, 0, 1, 0.04705882, 1,
-0.361979, 0.42166, -2.9167, 0, 1, 0.05098039, 1,
-0.3581205, -0.4573278, -1.380669, 0, 1, 0.05882353, 1,
-0.3559199, -0.572239, -0.9230757, 0, 1, 0.0627451, 1,
-0.3547741, 1.62323, 0.7496824, 0, 1, 0.07058824, 1,
-0.3543256, -0.008726165, -1.314792, 0, 1, 0.07450981, 1,
-0.3528173, -0.9195616, -1.591576, 0, 1, 0.08235294, 1,
-0.3520675, 0.6207061, 0.4423227, 0, 1, 0.08627451, 1,
-0.3517432, 0.06708374, -1.003743, 0, 1, 0.09411765, 1,
-0.3476057, -1.802509, -3.707757, 0, 1, 0.1019608, 1,
-0.3455808, 0.4380377, -0.8014012, 0, 1, 0.1058824, 1,
-0.3455536, 1.460594, 0.7797855, 0, 1, 0.1137255, 1,
-0.3433769, -0.8492539, -2.09899, 0, 1, 0.1176471, 1,
-0.3417968, -0.1656662, -1.192283, 0, 1, 0.1254902, 1,
-0.340545, -0.1617463, -0.7292414, 0, 1, 0.1294118, 1,
-0.3356598, -0.3274119, -2.094127, 0, 1, 0.1372549, 1,
-0.3347886, -0.3047642, -1.427758, 0, 1, 0.1411765, 1,
-0.3344932, -2.350672, -1.9401, 0, 1, 0.1490196, 1,
-0.3247457, -0.4106544, -1.918845, 0, 1, 0.1529412, 1,
-0.3241441, 0.7725726, -2.043231, 0, 1, 0.1607843, 1,
-0.3219145, 0.6075124, -0.7090828, 0, 1, 0.1647059, 1,
-0.3171269, -0.3163928, -2.875543, 0, 1, 0.172549, 1,
-0.3157298, -0.9095141, -1.808356, 0, 1, 0.1764706, 1,
-0.3144418, 1.380122, -1.546355, 0, 1, 0.1843137, 1,
-0.3142983, -0.06432286, -1.54828, 0, 1, 0.1882353, 1,
-0.3136676, 0.4557667, -0.747452, 0, 1, 0.1960784, 1,
-0.3052376, 0.2416026, -0.4588102, 0, 1, 0.2039216, 1,
-0.3041291, -1.338383, -3.677892, 0, 1, 0.2078431, 1,
-0.3010302, -1.533772, -2.183202, 0, 1, 0.2156863, 1,
-0.2991049, -1.466348, -3.529073, 0, 1, 0.2196078, 1,
-0.2955171, -0.7743769, -2.876063, 0, 1, 0.227451, 1,
-0.2936727, 1.227274, 0.03698499, 0, 1, 0.2313726, 1,
-0.2925328, 0.2164205, -1.767648, 0, 1, 0.2392157, 1,
-0.2880012, -1.185768, -4.480103, 0, 1, 0.2431373, 1,
-0.2874027, -0.4942813, -3.512549, 0, 1, 0.2509804, 1,
-0.2801276, 1.00706, -0.1944044, 0, 1, 0.254902, 1,
-0.2753157, -0.04924667, -0.5447773, 0, 1, 0.2627451, 1,
-0.2721434, 0.8414387, 2.431746, 0, 1, 0.2666667, 1,
-0.2705202, 1.463729, 0.7331387, 0, 1, 0.2745098, 1,
-0.2684272, 0.6583721, -0.7603393, 0, 1, 0.2784314, 1,
-0.2665704, 0.0155935, -1.407116, 0, 1, 0.2862745, 1,
-0.2655944, 0.543914, -0.1573759, 0, 1, 0.2901961, 1,
-0.2633319, 2.053266, 2.392557, 0, 1, 0.2980392, 1,
-0.2627314, 0.4059344, -1.700134, 0, 1, 0.3058824, 1,
-0.2609715, 1.545716, 0.7534716, 0, 1, 0.3098039, 1,
-0.2523583, -1.629579, -2.612599, 0, 1, 0.3176471, 1,
-0.2492737, 1.980042, -0.6704563, 0, 1, 0.3215686, 1,
-0.2463095, -0.257393, -2.194487, 0, 1, 0.3294118, 1,
-0.2457709, 0.1646133, -2.52799, 0, 1, 0.3333333, 1,
-0.2437091, 0.6721331, -1.555542, 0, 1, 0.3411765, 1,
-0.2388515, -0.4310161, -4.515416, 0, 1, 0.345098, 1,
-0.2378363, -0.4828328, -3.632024, 0, 1, 0.3529412, 1,
-0.2327343, 0.8687329, 0.793797, 0, 1, 0.3568628, 1,
-0.2301903, -1.167261, -3.688052, 0, 1, 0.3647059, 1,
-0.2278072, -0.09503737, -2.551073, 0, 1, 0.3686275, 1,
-0.2239517, -1.767385, -2.97309, 0, 1, 0.3764706, 1,
-0.2232651, 0.3288196, -1.32903, 0, 1, 0.3803922, 1,
-0.2217292, 0.7516012, 1.236432, 0, 1, 0.3882353, 1,
-0.2217112, -1.122421, -3.960621, 0, 1, 0.3921569, 1,
-0.2203705, -0.3990629, -1.977506, 0, 1, 0.4, 1,
-0.2195846, -0.7931572, -2.086002, 0, 1, 0.4078431, 1,
-0.2183971, 0.5989606, -0.115141, 0, 1, 0.4117647, 1,
-0.2161501, -0.8564928, -3.300278, 0, 1, 0.4196078, 1,
-0.2147063, 1.075871, -0.03885321, 0, 1, 0.4235294, 1,
-0.2140707, -1.361741, -3.586894, 0, 1, 0.4313726, 1,
-0.2131042, -2.853002, -3.197392, 0, 1, 0.4352941, 1,
-0.210851, -1.225489, -3.585916, 0, 1, 0.4431373, 1,
-0.2108465, 1.050143, -1.192543, 0, 1, 0.4470588, 1,
-0.2059653, -0.2879285, -5.094348, 0, 1, 0.454902, 1,
-0.2042352, 0.6387194, -0.7830295, 0, 1, 0.4588235, 1,
-0.2025558, 2.005663, 0.3720171, 0, 1, 0.4666667, 1,
-0.200491, 1.345347, 1.026461, 0, 1, 0.4705882, 1,
-0.1981834, 1.358376, 0.8115789, 0, 1, 0.4784314, 1,
-0.1977831, -0.9691486, -2.55034, 0, 1, 0.4823529, 1,
-0.1956401, -0.2771682, -2.22857, 0, 1, 0.4901961, 1,
-0.1928128, 0.678904, 0.6832265, 0, 1, 0.4941176, 1,
-0.1921143, -0.2640065, -3.036373, 0, 1, 0.5019608, 1,
-0.1906211, -0.719874, -5.391794, 0, 1, 0.509804, 1,
-0.1900519, -0.2619964, -3.458911, 0, 1, 0.5137255, 1,
-0.1891886, 0.2278738, -0.7866378, 0, 1, 0.5215687, 1,
-0.1891139, -0.2679911, -2.789395, 0, 1, 0.5254902, 1,
-0.1821963, -0.04711112, -2.458247, 0, 1, 0.5333334, 1,
-0.1818034, -0.6991137, -1.698046, 0, 1, 0.5372549, 1,
-0.1797399, -1.713931, -2.726593, 0, 1, 0.5450981, 1,
-0.1708957, -0.2995902, -4.170791, 0, 1, 0.5490196, 1,
-0.1705704, -0.365541, -3.891413, 0, 1, 0.5568628, 1,
-0.1689016, 1.257023, -1.234728, 0, 1, 0.5607843, 1,
-0.1652479, 0.8343305, 0.361919, 0, 1, 0.5686275, 1,
-0.1641492, -2.541598, -2.150276, 0, 1, 0.572549, 1,
-0.1640746, -1.11425, -3.216949, 0, 1, 0.5803922, 1,
-0.1589209, 0.678422, -1.356746, 0, 1, 0.5843138, 1,
-0.1581408, 1.418154, 1.217915, 0, 1, 0.5921569, 1,
-0.1574867, -0.4951153, -3.226707, 0, 1, 0.5960785, 1,
-0.1496961, 1.582462, -0.3087628, 0, 1, 0.6039216, 1,
-0.1462559, 0.4259521, -1.075999, 0, 1, 0.6117647, 1,
-0.145293, 0.6687849, 0.4747294, 0, 1, 0.6156863, 1,
-0.1392323, -0.1054185, -2.43533, 0, 1, 0.6235294, 1,
-0.1356775, 0.2642225, -0.648262, 0, 1, 0.627451, 1,
-0.1342017, -2.236779, -4.425183, 0, 1, 0.6352941, 1,
-0.1285692, 0.8145764, -0.8187349, 0, 1, 0.6392157, 1,
-0.1270462, 1.111271, -1.526885, 0, 1, 0.6470588, 1,
-0.1245841, 0.8104333, 0.3751603, 0, 1, 0.6509804, 1,
-0.1242276, -0.3552547, -2.193739, 0, 1, 0.6588235, 1,
-0.1235323, -0.9719568, -1.342818, 0, 1, 0.6627451, 1,
-0.1212825, 0.2168046, -0.7523446, 0, 1, 0.6705883, 1,
-0.1177228, -1.617275, -3.99144, 0, 1, 0.6745098, 1,
-0.1110359, -0.3400424, -3.499368, 0, 1, 0.682353, 1,
-0.1087457, -0.1632705, -3.633424, 0, 1, 0.6862745, 1,
-0.1070337, 1.513047, -1.983293, 0, 1, 0.6941177, 1,
-0.1070141, 1.711671, 0.3932988, 0, 1, 0.7019608, 1,
-0.1040902, -0.4740789, -2.300524, 0, 1, 0.7058824, 1,
-0.1040104, -0.3547727, -3.054472, 0, 1, 0.7137255, 1,
-0.09336649, -0.8548315, -2.034453, 0, 1, 0.7176471, 1,
-0.09304607, -1.177859, -3.404315, 0, 1, 0.7254902, 1,
-0.09182113, -0.002590641, -0.7902617, 0, 1, 0.7294118, 1,
-0.09101585, -1.758462, -2.438679, 0, 1, 0.7372549, 1,
-0.08804793, -0.715478, -2.408948, 0, 1, 0.7411765, 1,
-0.08658592, -0.2528349, -1.763285, 0, 1, 0.7490196, 1,
-0.07739854, -1.42038, -2.521588, 0, 1, 0.7529412, 1,
-0.07220806, -0.9456454, -1.939377, 0, 1, 0.7607843, 1,
-0.07134849, 2.453655, -1.182253, 0, 1, 0.7647059, 1,
-0.07012434, 1.824125, -0.6169977, 0, 1, 0.772549, 1,
-0.06713878, -0.6405536, -3.672992, 0, 1, 0.7764706, 1,
-0.06490649, -1.753026, -3.241002, 0, 1, 0.7843137, 1,
-0.06478152, -1.360152, -4.527374, 0, 1, 0.7882353, 1,
-0.0583952, -0.8678316, -3.598177, 0, 1, 0.7960784, 1,
-0.0571468, 0.7476171, 1.628824, 0, 1, 0.8039216, 1,
-0.05697672, 0.4222749, -0.09231825, 0, 1, 0.8078431, 1,
-0.05562742, -0.8988403, -3.630217, 0, 1, 0.8156863, 1,
-0.05444985, 1.770561, 0.9098362, 0, 1, 0.8196079, 1,
-0.0445789, -0.09800229, -2.956351, 0, 1, 0.827451, 1,
-0.04228712, -0.8503485, -2.338434, 0, 1, 0.8313726, 1,
-0.03830122, 0.8987405, 0.7189937, 0, 1, 0.8392157, 1,
-0.02945087, 0.7317642, -1.874023, 0, 1, 0.8431373, 1,
-0.02818681, -0.4168427, -2.201256, 0, 1, 0.8509804, 1,
-0.02592622, 0.9022679, -1.676342, 0, 1, 0.854902, 1,
-0.02578902, -1.25247, -2.946651, 0, 1, 0.8627451, 1,
-0.0253427, -1.192785, -1.575871, 0, 1, 0.8666667, 1,
-0.02351063, -0.1474537, -4.667416, 0, 1, 0.8745098, 1,
-0.02304331, -1.455967, -2.930992, 0, 1, 0.8784314, 1,
-0.007189247, 0.5474099, -1.61202, 0, 1, 0.8862745, 1,
-0.004003323, -0.8161619, -2.510793, 0, 1, 0.8901961, 1,
0.001372525, 1.837133, 0.7694748, 0, 1, 0.8980392, 1,
0.002663898, -0.6130862, 4.844634, 0, 1, 0.9058824, 1,
0.003779355, -0.1739167, 4.170945, 0, 1, 0.9098039, 1,
0.004273526, -1.030055, 2.167221, 0, 1, 0.9176471, 1,
0.004829967, 0.107292, 1.879492, 0, 1, 0.9215686, 1,
0.005620285, -0.7502547, 4.605121, 0, 1, 0.9294118, 1,
0.007509781, 0.0687206, 0.01798594, 0, 1, 0.9333333, 1,
0.009034478, 1.782311, 0.9584454, 0, 1, 0.9411765, 1,
0.01132489, 0.4596214, 0.01094398, 0, 1, 0.945098, 1,
0.01146882, 1.330724, -0.01325104, 0, 1, 0.9529412, 1,
0.01668562, -1.502033, 2.775114, 0, 1, 0.9568627, 1,
0.01695787, 1.774781, -0.1647571, 0, 1, 0.9647059, 1,
0.01809428, 2.610149, -0.6639223, 0, 1, 0.9686275, 1,
0.01836234, 1.022179, 0.2779645, 0, 1, 0.9764706, 1,
0.01871401, 0.7959028, -1.36162, 0, 1, 0.9803922, 1,
0.01884891, 0.8311351, -0.3544042, 0, 1, 0.9882353, 1,
0.02131904, -0.1632048, 1.138058, 0, 1, 0.9921569, 1,
0.02361611, 1.891637, 0.5978031, 0, 1, 1, 1,
0.0264708, -0.8031131, 3.361876, 0, 0.9921569, 1, 1,
0.02701941, 1.217698, 1.412674, 0, 0.9882353, 1, 1,
0.02705489, 1.093647, 1.263743, 0, 0.9803922, 1, 1,
0.02937715, 0.1101788, 0.3438032, 0, 0.9764706, 1, 1,
0.0315214, -0.3581931, 3.877476, 0, 0.9686275, 1, 1,
0.03182068, 1.273444, 0.159694, 0, 0.9647059, 1, 1,
0.03226254, 1.233641, -0.1906214, 0, 0.9568627, 1, 1,
0.03427063, -0.4909092, 3.830734, 0, 0.9529412, 1, 1,
0.03548438, -0.2085766, 3.971868, 0, 0.945098, 1, 1,
0.03555087, -0.8961244, 2.847261, 0, 0.9411765, 1, 1,
0.03679469, 0.3050652, -0.287029, 0, 0.9333333, 1, 1,
0.0374263, -0.1347654, 2.941314, 0, 0.9294118, 1, 1,
0.04182197, -1.018664, 0.7229442, 0, 0.9215686, 1, 1,
0.04672317, 1.079773, -0.1361199, 0, 0.9176471, 1, 1,
0.04951607, 0.2688932, 0.008823121, 0, 0.9098039, 1, 1,
0.04969361, 0.3307801, 0.3428039, 0, 0.9058824, 1, 1,
0.06073732, 0.04286638, 2.470742, 0, 0.8980392, 1, 1,
0.0641077, 0.09400742, 0.7559875, 0, 0.8901961, 1, 1,
0.06768309, 1.274381, -2.085438, 0, 0.8862745, 1, 1,
0.06914444, 1.278152, -0.9433094, 0, 0.8784314, 1, 1,
0.07167178, 0.3361123, -0.3192172, 0, 0.8745098, 1, 1,
0.07250839, -0.5975962, 2.662359, 0, 0.8666667, 1, 1,
0.07310469, -0.720427, 3.80882, 0, 0.8627451, 1, 1,
0.07354452, 0.1371066, -1.085247, 0, 0.854902, 1, 1,
0.07406504, -0.1157977, 0.4135693, 0, 0.8509804, 1, 1,
0.08192564, -0.8867267, 2.446703, 0, 0.8431373, 1, 1,
0.0875195, -0.3227369, 2.907005, 0, 0.8392157, 1, 1,
0.09027552, 0.5350483, 0.05607707, 0, 0.8313726, 1, 1,
0.09249423, 1.139409, 1.431894, 0, 0.827451, 1, 1,
0.09817471, 1.360225, 2.139758, 0, 0.8196079, 1, 1,
0.0984083, 2.221662, 1.911405, 0, 0.8156863, 1, 1,
0.1002615, 0.0461875, 1.814926, 0, 0.8078431, 1, 1,
0.1008363, 1.19208, 0.612376, 0, 0.8039216, 1, 1,
0.1078719, 0.06247995, 0.7787732, 0, 0.7960784, 1, 1,
0.1109942, 0.7917226, 0.9242916, 0, 0.7882353, 1, 1,
0.1118198, 1.696376, -0.5831622, 0, 0.7843137, 1, 1,
0.1131876, -1.040137, 0.6004362, 0, 0.7764706, 1, 1,
0.1138691, -0.386727, 2.482119, 0, 0.772549, 1, 1,
0.1165657, 1.055203, 0.3389378, 0, 0.7647059, 1, 1,
0.1169098, 0.166462, 0.2098464, 0, 0.7607843, 1, 1,
0.1203943, -2.492869, 3.403631, 0, 0.7529412, 1, 1,
0.1205962, 0.3725663, -0.5801592, 0, 0.7490196, 1, 1,
0.1242811, -0.2064207, 2.616976, 0, 0.7411765, 1, 1,
0.1256698, -0.9950281, 3.735114, 0, 0.7372549, 1, 1,
0.1269448, 0.1396541, 1.209749, 0, 0.7294118, 1, 1,
0.1285697, 0.256041, 1.246148, 0, 0.7254902, 1, 1,
0.1293595, 0.2389615, 0.5505393, 0, 0.7176471, 1, 1,
0.1295972, 0.1528192, 0.7424445, 0, 0.7137255, 1, 1,
0.1297811, -1.11687, 3.092919, 0, 0.7058824, 1, 1,
0.1311179, 0.7217634, 0.3225564, 0, 0.6980392, 1, 1,
0.1360503, -0.4745652, 4.132846, 0, 0.6941177, 1, 1,
0.1370719, 0.5882807, 1.394558, 0, 0.6862745, 1, 1,
0.1406823, -1.311476, 2.933356, 0, 0.682353, 1, 1,
0.1470914, -1.068381, 2.122842, 0, 0.6745098, 1, 1,
0.1474553, -0.4395141, 1.191505, 0, 0.6705883, 1, 1,
0.1503277, 0.2016965, 1.604452, 0, 0.6627451, 1, 1,
0.1518346, -0.9220406, 2.547391, 0, 0.6588235, 1, 1,
0.1534516, -2.468316, 3.472116, 0, 0.6509804, 1, 1,
0.154442, -0.904875, 4.517158, 0, 0.6470588, 1, 1,
0.1608835, -0.1303362, 3.275923, 0, 0.6392157, 1, 1,
0.1618002, -0.5854765, 5.971932, 0, 0.6352941, 1, 1,
0.1634627, -0.1858379, 3.253133, 0, 0.627451, 1, 1,
0.1699776, 1.50723, -0.1292872, 0, 0.6235294, 1, 1,
0.171307, 1.24146, -0.9455674, 0, 0.6156863, 1, 1,
0.174523, -1.51125, 5.034368, 0, 0.6117647, 1, 1,
0.17732, -1.199619, 4.836682, 0, 0.6039216, 1, 1,
0.1774986, 0.3308935, 1.106796, 0, 0.5960785, 1, 1,
0.1795668, -3.2233, 4.302111, 0, 0.5921569, 1, 1,
0.1812349, 2.018376, -0.3985365, 0, 0.5843138, 1, 1,
0.1838755, 0.778011, 2.643905, 0, 0.5803922, 1, 1,
0.1844169, 1.796294, 0.2435097, 0, 0.572549, 1, 1,
0.1848925, -0.260994, 0.9952746, 0, 0.5686275, 1, 1,
0.1883096, -0.6646884, 3.554427, 0, 0.5607843, 1, 1,
0.1898925, 0.5886477, -1.008161, 0, 0.5568628, 1, 1,
0.1918414, -1.327426, 2.760098, 0, 0.5490196, 1, 1,
0.1918584, 0.06654482, 3.132603, 0, 0.5450981, 1, 1,
0.1927062, -1.374671, 3.34978, 0, 0.5372549, 1, 1,
0.1929836, 0.4531353, 0.5799791, 0, 0.5333334, 1, 1,
0.199323, 1.066059, 0.5994564, 0, 0.5254902, 1, 1,
0.1997048, 0.27619, -0.9279748, 0, 0.5215687, 1, 1,
0.1997179, 0.5859999, 1.128313, 0, 0.5137255, 1, 1,
0.2031047, -0.4991988, 3.304101, 0, 0.509804, 1, 1,
0.2039129, -0.7548466, 2.216968, 0, 0.5019608, 1, 1,
0.2039954, -0.8256652, 3.358813, 0, 0.4941176, 1, 1,
0.2055915, 1.251299, 0.5610433, 0, 0.4901961, 1, 1,
0.206074, 0.647291, -0.1212197, 0, 0.4823529, 1, 1,
0.2087421, -0.9044604, 2.950062, 0, 0.4784314, 1, 1,
0.2095203, -0.8365108, 3.318808, 0, 0.4705882, 1, 1,
0.2099944, 0.1110677, 0.2463952, 0, 0.4666667, 1, 1,
0.2111961, 0.3790901, 1.668482, 0, 0.4588235, 1, 1,
0.2114628, 0.0324291, 0.7678423, 0, 0.454902, 1, 1,
0.212352, -0.5546328, 3.21891, 0, 0.4470588, 1, 1,
0.2128439, 0.204487, -1.910392, 0, 0.4431373, 1, 1,
0.2184562, 1.015922, 0.08051986, 0, 0.4352941, 1, 1,
0.2191339, 0.3849916, 1.121102, 0, 0.4313726, 1, 1,
0.2209795, 0.01709889, 1.689793, 0, 0.4235294, 1, 1,
0.2340412, 0.08168235, 2.658463, 0, 0.4196078, 1, 1,
0.2341148, -1.375453, 4.114564, 0, 0.4117647, 1, 1,
0.235909, 1.172842, 0.1394854, 0, 0.4078431, 1, 1,
0.2359094, -1.134437, 4.092334, 0, 0.4, 1, 1,
0.2363309, 0.5286792, 1.324966, 0, 0.3921569, 1, 1,
0.2381423, 1.165821, 0.1306494, 0, 0.3882353, 1, 1,
0.2498802, -0.1099139, 1.865383, 0, 0.3803922, 1, 1,
0.2628363, -0.4139613, 2.156663, 0, 0.3764706, 1, 1,
0.2629447, 1.147967, -1.182263, 0, 0.3686275, 1, 1,
0.264368, -1.471119, 3.000801, 0, 0.3647059, 1, 1,
0.2652457, -0.1271034, -0.3861793, 0, 0.3568628, 1, 1,
0.2660551, 0.5356709, -0.8739763, 0, 0.3529412, 1, 1,
0.2669826, 1.740718, -0.7197199, 0, 0.345098, 1, 1,
0.2755962, -1.725768, 4.723191, 0, 0.3411765, 1, 1,
0.2776548, -0.486659, 2.712865, 0, 0.3333333, 1, 1,
0.2780626, 0.5867693, -0.6561797, 0, 0.3294118, 1, 1,
0.2806944, -0.7293195, 1.809002, 0, 0.3215686, 1, 1,
0.2813779, -0.9725969, 2.598354, 0, 0.3176471, 1, 1,
0.2838256, 2.141957, -0.9887831, 0, 0.3098039, 1, 1,
0.2897318, -0.1127381, 0.4323476, 0, 0.3058824, 1, 1,
0.2952664, -0.6651254, 3.177085, 0, 0.2980392, 1, 1,
0.2982004, -0.8790543, 2.123893, 0, 0.2901961, 1, 1,
0.2996767, 0.2983236, 1.154832, 0, 0.2862745, 1, 1,
0.3017728, -0.3315832, 2.847517, 0, 0.2784314, 1, 1,
0.305189, -0.01828174, 0.5547266, 0, 0.2745098, 1, 1,
0.3067234, 0.5749121, 0.6733537, 0, 0.2666667, 1, 1,
0.3095025, -1.604366, 3.717026, 0, 0.2627451, 1, 1,
0.3127243, 0.6802652, 0.3506159, 0, 0.254902, 1, 1,
0.3186377, 0.03934914, 0.617423, 0, 0.2509804, 1, 1,
0.320157, -2.006526, 4.374203, 0, 0.2431373, 1, 1,
0.3202433, 1.772901, 1.214223, 0, 0.2392157, 1, 1,
0.3210907, 1.007335, -0.2413132, 0, 0.2313726, 1, 1,
0.321859, 0.5241773, 1.898668, 0, 0.227451, 1, 1,
0.3231861, 0.09709606, 1.632077, 0, 0.2196078, 1, 1,
0.3335241, -0.1211208, -0.459159, 0, 0.2156863, 1, 1,
0.3336476, 1.110082, 1.308507, 0, 0.2078431, 1, 1,
0.3338639, -0.1681277, 2.583339, 0, 0.2039216, 1, 1,
0.3366475, 1.164604, 1.232153, 0, 0.1960784, 1, 1,
0.3477098, 0.7852058, 1.214646, 0, 0.1882353, 1, 1,
0.3503397, 0.183577, 1.295393, 0, 0.1843137, 1, 1,
0.3507198, 0.5717783, 0.105906, 0, 0.1764706, 1, 1,
0.3537669, 0.221745, 2.35568, 0, 0.172549, 1, 1,
0.3551371, -0.8330299, 1.223861, 0, 0.1647059, 1, 1,
0.3568884, -0.5414795, 1.609994, 0, 0.1607843, 1, 1,
0.3586762, 2.034989, -0.1008558, 0, 0.1529412, 1, 1,
0.3587493, -0.4999425, 2.587465, 0, 0.1490196, 1, 1,
0.3611739, 0.1220499, -0.5504866, 0, 0.1411765, 1, 1,
0.3665611, -1.505202, 3.167357, 0, 0.1372549, 1, 1,
0.3706982, -0.1932266, 0.9460259, 0, 0.1294118, 1, 1,
0.3749642, -1.104074, 2.573554, 0, 0.1254902, 1, 1,
0.3765486, 0.5943259, -0.2184347, 0, 0.1176471, 1, 1,
0.378248, -0.4739034, 2.071862, 0, 0.1137255, 1, 1,
0.384614, -1.227259, 2.941446, 0, 0.1058824, 1, 1,
0.3852112, 1.372476, -1.114449, 0, 0.09803922, 1, 1,
0.3874469, 0.1055063, 1.429214, 0, 0.09411765, 1, 1,
0.3891565, -0.852688, 1.27383, 0, 0.08627451, 1, 1,
0.3900109, -0.07375548, 1.002158, 0, 0.08235294, 1, 1,
0.3923609, -1.101823, 2.88704, 0, 0.07450981, 1, 1,
0.3949354, -0.626366, 1.568071, 0, 0.07058824, 1, 1,
0.3966395, -0.5755993, 3.039937, 0, 0.0627451, 1, 1,
0.4002462, 0.03443271, 3.141002, 0, 0.05882353, 1, 1,
0.4104272, -0.3825727, 3.166237, 0, 0.05098039, 1, 1,
0.4111833, -0.3708325, 2.020213, 0, 0.04705882, 1, 1,
0.4136362, -0.3003557, 1.525215, 0, 0.03921569, 1, 1,
0.415005, -0.1144982, 2.662614, 0, 0.03529412, 1, 1,
0.4161471, -0.1531567, 2.709869, 0, 0.02745098, 1, 1,
0.4192761, -0.4625438, 1.604202, 0, 0.02352941, 1, 1,
0.420996, -1.110364, 3.22271, 0, 0.01568628, 1, 1,
0.4245594, -1.146195, 5.296634, 0, 0.01176471, 1, 1,
0.4252718, 0.1737778, 1.637964, 0, 0.003921569, 1, 1,
0.4271505, 0.1378068, 1.086422, 0.003921569, 0, 1, 1,
0.4289317, 1.540147, 1.862501, 0.007843138, 0, 1, 1,
0.4295056, -0.9649018, 2.266873, 0.01568628, 0, 1, 1,
0.4319697, 1.140517, 1.489462, 0.01960784, 0, 1, 1,
0.4354908, 0.1551566, 1.261521, 0.02745098, 0, 1, 1,
0.43574, 0.8633527, -0.05889672, 0.03137255, 0, 1, 1,
0.4366104, 0.8989979, 0.1393204, 0.03921569, 0, 1, 1,
0.4393182, -1.889818, 1.967644, 0.04313726, 0, 1, 1,
0.4417396, -0.6247883, 2.524758, 0.05098039, 0, 1, 1,
0.4444008, -0.019442, 0.7304233, 0.05490196, 0, 1, 1,
0.4460281, -0.4034461, 2.272242, 0.0627451, 0, 1, 1,
0.4482019, -0.3851018, 1.802912, 0.06666667, 0, 1, 1,
0.4527519, 0.08848885, 1.95921, 0.07450981, 0, 1, 1,
0.4554272, 1.992796, -0.3623943, 0.07843138, 0, 1, 1,
0.4567676, -0.3964901, 4.276251, 0.08627451, 0, 1, 1,
0.4602409, 1.110014, -0.03100135, 0.09019608, 0, 1, 1,
0.4709173, 0.7875453, 0.7111903, 0.09803922, 0, 1, 1,
0.4730213, -0.03511821, 1.061606, 0.1058824, 0, 1, 1,
0.4749361, -0.7383883, 2.546044, 0.1098039, 0, 1, 1,
0.476588, 0.206931, 1.406271, 0.1176471, 0, 1, 1,
0.4791137, 0.114083, 2.366125, 0.1215686, 0, 1, 1,
0.4826583, -0.1280519, -0.1089907, 0.1294118, 0, 1, 1,
0.4846967, -0.7288721, 3.782037, 0.1333333, 0, 1, 1,
0.4866794, 0.5764713, 0.2129359, 0.1411765, 0, 1, 1,
0.4881462, 0.2704876, 2.107242, 0.145098, 0, 1, 1,
0.4916923, 0.4847932, 2.657747, 0.1529412, 0, 1, 1,
0.4917683, -1.704908, 3.037676, 0.1568628, 0, 1, 1,
0.4921739, 1.213108, -1.070493, 0.1647059, 0, 1, 1,
0.4944839, -0.5174116, 2.487401, 0.1686275, 0, 1, 1,
0.5010492, -1.661588, 3.613248, 0.1764706, 0, 1, 1,
0.5036346, -0.2080991, 2.467597, 0.1803922, 0, 1, 1,
0.5042382, -0.02862481, 1.89651, 0.1882353, 0, 1, 1,
0.5080611, -1.035229, 3.24746, 0.1921569, 0, 1, 1,
0.5081814, 0.3829798, 1.038339, 0.2, 0, 1, 1,
0.5127822, -1.488009, 1.889932, 0.2078431, 0, 1, 1,
0.513913, 0.9640436, 0.1792055, 0.2117647, 0, 1, 1,
0.5139333, 1.107632, 1.884384, 0.2196078, 0, 1, 1,
0.5227139, -0.4977504, 1.959118, 0.2235294, 0, 1, 1,
0.5292996, -1.049672, 2.627371, 0.2313726, 0, 1, 1,
0.5306251, 0.5346581, 0.1185182, 0.2352941, 0, 1, 1,
0.5335016, -0.197648, 1.526213, 0.2431373, 0, 1, 1,
0.5340992, 0.03623421, 0.9341528, 0.2470588, 0, 1, 1,
0.5341727, -1.419859, 3.480991, 0.254902, 0, 1, 1,
0.5352613, -0.0744863, 2.763136, 0.2588235, 0, 1, 1,
0.5359117, -0.2117236, 1.894988, 0.2666667, 0, 1, 1,
0.5361255, -0.7342816, 2.089997, 0.2705882, 0, 1, 1,
0.5409778, 0.7389957, 0.09172777, 0.2784314, 0, 1, 1,
0.545232, 0.247395, 1.003167, 0.282353, 0, 1, 1,
0.5484204, 0.9444039, 0.1878443, 0.2901961, 0, 1, 1,
0.5490744, -0.3575964, 0.2708396, 0.2941177, 0, 1, 1,
0.5511751, 0.6634576, 1.283865, 0.3019608, 0, 1, 1,
0.55195, 0.6461682, 1.146218, 0.3098039, 0, 1, 1,
0.5561818, 0.8575431, 1.154203, 0.3137255, 0, 1, 1,
0.5590826, -0.3308915, 1.730468, 0.3215686, 0, 1, 1,
0.5634036, -0.4685283, 3.273792, 0.3254902, 0, 1, 1,
0.5637428, -0.1350381, 2.312894, 0.3333333, 0, 1, 1,
0.5644222, 0.5082895, -0.3502142, 0.3372549, 0, 1, 1,
0.566474, 0.9042726, 1.304916, 0.345098, 0, 1, 1,
0.5669585, 0.9827434, 0.4896016, 0.3490196, 0, 1, 1,
0.5686745, 1.380038, -0.7540396, 0.3568628, 0, 1, 1,
0.5827056, 1.650115, 1.647678, 0.3607843, 0, 1, 1,
0.582882, -0.3730573, 2.869322, 0.3686275, 0, 1, 1,
0.5833852, 0.9274831, 1.623474, 0.372549, 0, 1, 1,
0.583604, -0.1173696, -0.06201309, 0.3803922, 0, 1, 1,
0.5862811, -0.8113586, 1.887889, 0.3843137, 0, 1, 1,
0.5916656, -0.4238952, -0.2338975, 0.3921569, 0, 1, 1,
0.5963056, 1.88582, -0.1927181, 0.3960784, 0, 1, 1,
0.6049945, -0.369208, 1.288796, 0.4039216, 0, 1, 1,
0.6081296, -0.2428521, 1.524367, 0.4117647, 0, 1, 1,
0.6090102, -0.148484, 1.491668, 0.4156863, 0, 1, 1,
0.6098268, 0.2388542, 1.366492, 0.4235294, 0, 1, 1,
0.6110755, 0.2267743, 3.233312, 0.427451, 0, 1, 1,
0.6136966, -0.7298374, 2.449077, 0.4352941, 0, 1, 1,
0.6145138, 1.084784, 1.14518, 0.4392157, 0, 1, 1,
0.6172684, -1.637426, 1.431427, 0.4470588, 0, 1, 1,
0.6209237, -0.7819376, 2.422814, 0.4509804, 0, 1, 1,
0.6253595, -0.3171705, 2.500901, 0.4588235, 0, 1, 1,
0.6287132, -0.7513735, 1.898108, 0.4627451, 0, 1, 1,
0.6346999, 0.1186914, 1.675754, 0.4705882, 0, 1, 1,
0.6352315, 0.1189278, 0.9864129, 0.4745098, 0, 1, 1,
0.6378501, -0.9755669, 3.087463, 0.4823529, 0, 1, 1,
0.637965, -0.4196431, -0.09811687, 0.4862745, 0, 1, 1,
0.6401092, 0.7687425, 0.07671022, 0.4941176, 0, 1, 1,
0.6418909, -0.6877116, 1.954568, 0.5019608, 0, 1, 1,
0.6488699, 0.5141965, -0.12085, 0.5058824, 0, 1, 1,
0.6527198, 0.01905515, 1.295949, 0.5137255, 0, 1, 1,
0.6535254, 0.649483, 0.7391468, 0.5176471, 0, 1, 1,
0.6617565, 1.034405, 2.880008, 0.5254902, 0, 1, 1,
0.663784, -1.257391, 2.087607, 0.5294118, 0, 1, 1,
0.6646623, 0.9667786, 0.6312556, 0.5372549, 0, 1, 1,
0.6658185, 0.5425667, -0.008852475, 0.5411765, 0, 1, 1,
0.6682075, 0.2852641, -0.07870159, 0.5490196, 0, 1, 1,
0.67184, -1.477515, 2.841429, 0.5529412, 0, 1, 1,
0.6720777, 0.3144519, 1.576609, 0.5607843, 0, 1, 1,
0.6761109, -0.2497405, 1.596938, 0.5647059, 0, 1, 1,
0.6766196, 0.07268491, 0.6599355, 0.572549, 0, 1, 1,
0.6812333, 0.044856, 0.8100193, 0.5764706, 0, 1, 1,
0.6865305, -0.04492836, 3.212659, 0.5843138, 0, 1, 1,
0.6896199, -1.294421, 2.070696, 0.5882353, 0, 1, 1,
0.690205, -0.09089611, 3.365171, 0.5960785, 0, 1, 1,
0.6909741, -0.3857384, 2.547469, 0.6039216, 0, 1, 1,
0.6960297, -0.7915064, 2.969311, 0.6078432, 0, 1, 1,
0.6982213, 1.078153, 1.49492, 0.6156863, 0, 1, 1,
0.7067289, -0.7722125, 2.241123, 0.6196079, 0, 1, 1,
0.7073827, -1.021231, 0.9111201, 0.627451, 0, 1, 1,
0.7080513, -0.2125534, 1.91466, 0.6313726, 0, 1, 1,
0.7129999, -1.432413, 3.349306, 0.6392157, 0, 1, 1,
0.7222053, 0.4257492, 1.985302, 0.6431373, 0, 1, 1,
0.7289234, 1.421762, 0.5185986, 0.6509804, 0, 1, 1,
0.7293696, 0.4093541, 0.8973489, 0.654902, 0, 1, 1,
0.730598, -2.446792, 3.354884, 0.6627451, 0, 1, 1,
0.7374197, -1.594923, 3.495021, 0.6666667, 0, 1, 1,
0.7381412, 0.2084155, 1.055252, 0.6745098, 0, 1, 1,
0.7390407, 0.578176, 1.013835, 0.6784314, 0, 1, 1,
0.7434301, 0.683129, -0.767042, 0.6862745, 0, 1, 1,
0.7450032, 1.687956, -1.3323, 0.6901961, 0, 1, 1,
0.7479248, -0.8008456, 2.179992, 0.6980392, 0, 1, 1,
0.7527694, 0.5797758, 1.20336, 0.7058824, 0, 1, 1,
0.7543334, 1.133523, 0.93269, 0.7098039, 0, 1, 1,
0.7632613, 1.266951, 1.444454, 0.7176471, 0, 1, 1,
0.7694874, -0.6512631, 3.420889, 0.7215686, 0, 1, 1,
0.7703153, -0.7873312, 1.83918, 0.7294118, 0, 1, 1,
0.7729055, -1.181371, 3.304143, 0.7333333, 0, 1, 1,
0.7799224, 0.1381725, 0.8285255, 0.7411765, 0, 1, 1,
0.7812471, -0.8699909, 1.373953, 0.7450981, 0, 1, 1,
0.7845983, 1.157926, -0.4189485, 0.7529412, 0, 1, 1,
0.7880332, 0.7492005, 0.1188671, 0.7568628, 0, 1, 1,
0.7925696, 1.349455, -0.2167884, 0.7647059, 0, 1, 1,
0.7961596, -0.2539834, 1.993018, 0.7686275, 0, 1, 1,
0.7979852, 0.3865743, 1.227955, 0.7764706, 0, 1, 1,
0.798263, 1.406695, 0.6044785, 0.7803922, 0, 1, 1,
0.7983346, 0.8088203, 0.7960417, 0.7882353, 0, 1, 1,
0.7983417, 0.1050698, 0.7550682, 0.7921569, 0, 1, 1,
0.8004687, 0.4977889, -0.9781335, 0.8, 0, 1, 1,
0.8110695, -0.3603949, 1.131563, 0.8078431, 0, 1, 1,
0.8112859, 0.2627362, 1.51369, 0.8117647, 0, 1, 1,
0.8113654, -0.9959954, 0.5592736, 0.8196079, 0, 1, 1,
0.8160299, -1.36984, 3.271819, 0.8235294, 0, 1, 1,
0.8175726, 0.7801837, 0.6624968, 0.8313726, 0, 1, 1,
0.818031, -2.449817, 2.731894, 0.8352941, 0, 1, 1,
0.8209072, -0.4808782, 2.446856, 0.8431373, 0, 1, 1,
0.8214967, -0.1140448, 1.791809, 0.8470588, 0, 1, 1,
0.8225673, 2.138901, 1.251722, 0.854902, 0, 1, 1,
0.8232557, 0.1102678, 1.427533, 0.8588235, 0, 1, 1,
0.8238225, -0.1778652, 0.5335905, 0.8666667, 0, 1, 1,
0.8262585, 0.2484665, 2.625259, 0.8705882, 0, 1, 1,
0.8272024, 1.778169, -0.9292368, 0.8784314, 0, 1, 1,
0.8282069, 1.154321, 1.486719, 0.8823529, 0, 1, 1,
0.8291119, -0.5501899, 1.404345, 0.8901961, 0, 1, 1,
0.8327038, -0.1918641, 1.518768, 0.8941177, 0, 1, 1,
0.8463336, 1.702578, 2.389398, 0.9019608, 0, 1, 1,
0.8491407, 0.6068935, 1.759888, 0.9098039, 0, 1, 1,
0.8563592, -0.4510999, 2.639955, 0.9137255, 0, 1, 1,
0.858251, -1.421017, 1.717517, 0.9215686, 0, 1, 1,
0.8587891, -1.084131, 3.797468, 0.9254902, 0, 1, 1,
0.8647398, 2.427026, 1.042806, 0.9333333, 0, 1, 1,
0.8675659, 1.294908, 1.154626, 0.9372549, 0, 1, 1,
0.8697295, -1.744702, 2.825631, 0.945098, 0, 1, 1,
0.87976, 0.9900952, 0.1968394, 0.9490196, 0, 1, 1,
0.8834291, 0.6385563, 1.088465, 0.9568627, 0, 1, 1,
0.8841674, -3.008038, 3.91637, 0.9607843, 0, 1, 1,
0.8910132, -1.195434, 2.143767, 0.9686275, 0, 1, 1,
0.89749, -0.7331629, 2.340086, 0.972549, 0, 1, 1,
0.8999473, 0.5787581, 3.152846, 0.9803922, 0, 1, 1,
0.9024572, 1.247012, 0.4809286, 0.9843137, 0, 1, 1,
0.9100434, -0.02059255, 3.928898, 0.9921569, 0, 1, 1,
0.917161, 0.9115101, 0.8595171, 0.9960784, 0, 1, 1,
0.9233834, 0.8518698, -0.1366075, 1, 0, 0.9960784, 1,
0.9266882, 0.6072456, 1.193352, 1, 0, 0.9882353, 1,
0.9275354, -1.696585, 3.794119, 1, 0, 0.9843137, 1,
0.9276542, 0.4876264, 0.5504991, 1, 0, 0.9764706, 1,
0.9302014, 1.693886, 2.170155, 1, 0, 0.972549, 1,
0.9388537, 0.9281166, -0.6820314, 1, 0, 0.9647059, 1,
0.9394143, -0.1607746, 3.884095, 1, 0, 0.9607843, 1,
0.9401296, 0.3301944, 2.673323, 1, 0, 0.9529412, 1,
0.961385, 2.311138, 1.679896, 1, 0, 0.9490196, 1,
0.9615044, -0.6977376, 3.065571, 1, 0, 0.9411765, 1,
0.9620578, 1.455828, 3.277394, 1, 0, 0.9372549, 1,
0.9760716, -0.02180146, 1.117164, 1, 0, 0.9294118, 1,
0.9830782, 0.1288991, 2.202066, 1, 0, 0.9254902, 1,
0.9854555, -1.432799, 3.844669, 1, 0, 0.9176471, 1,
0.989468, 1.251224, 2.184685, 1, 0, 0.9137255, 1,
1.002688, 1.646105, 0.8968797, 1, 0, 0.9058824, 1,
1.005491, 2.011304, 0.9593991, 1, 0, 0.9019608, 1,
1.018858, 0.7417257, 1.938109, 1, 0, 0.8941177, 1,
1.020109, -0.03400176, 1.315347, 1, 0, 0.8862745, 1,
1.021468, -2.056447, 1.122055, 1, 0, 0.8823529, 1,
1.029785, 0.03569898, 2.200088, 1, 0, 0.8745098, 1,
1.047728, -0.3954192, 1.785946, 1, 0, 0.8705882, 1,
1.058871, -1.422857, 0.9985547, 1, 0, 0.8627451, 1,
1.060403, -0.008946484, 2.334884, 1, 0, 0.8588235, 1,
1.068287, 2.011138, 2.615818, 1, 0, 0.8509804, 1,
1.068488, -1.606552, 1.196004, 1, 0, 0.8470588, 1,
1.078167, 0.2532654, 1.455405, 1, 0, 0.8392157, 1,
1.082899, 0.428498, 1.702917, 1, 0, 0.8352941, 1,
1.083148, 0.5506897, 0.6819597, 1, 0, 0.827451, 1,
1.088312, -1.180417, 1.9467, 1, 0, 0.8235294, 1,
1.117555, -0.4200431, 2.245781, 1, 0, 0.8156863, 1,
1.121113, -0.008365414, 3.791243, 1, 0, 0.8117647, 1,
1.134542, 0.5141248, 0.09423206, 1, 0, 0.8039216, 1,
1.136529, -0.6779074, 2.145131, 1, 0, 0.7960784, 1,
1.141907, 0.6975725, 0.868064, 1, 0, 0.7921569, 1,
1.143403, 0.392712, 0.1911999, 1, 0, 0.7843137, 1,
1.145912, 0.7396898, 1.343107, 1, 0, 0.7803922, 1,
1.154223, 1.520887, 1.474424, 1, 0, 0.772549, 1,
1.15447, 0.5522473, 1.360274, 1, 0, 0.7686275, 1,
1.158882, -0.4071533, 0.3230606, 1, 0, 0.7607843, 1,
1.168365, 3.566061, -0.2977502, 1, 0, 0.7568628, 1,
1.189522, 0.200123, 3.059018, 1, 0, 0.7490196, 1,
1.196152, 0.8963751, -0.1999131, 1, 0, 0.7450981, 1,
1.200686, 0.2794332, 1.371214, 1, 0, 0.7372549, 1,
1.202788, -1.165534, 3.672743, 1, 0, 0.7333333, 1,
1.218766, -0.8803428, 2.125663, 1, 0, 0.7254902, 1,
1.22425, -0.3737225, 2.404367, 1, 0, 0.7215686, 1,
1.229426, 1.786929, -0.4825628, 1, 0, 0.7137255, 1,
1.23034, 0.4220398, 3.235397, 1, 0, 0.7098039, 1,
1.234194, -1.482675, 2.449475, 1, 0, 0.7019608, 1,
1.236001, -0.1047013, 1.653626, 1, 0, 0.6941177, 1,
1.257036, 4.154176, 1.221725, 1, 0, 0.6901961, 1,
1.26381, -1.430904, 2.590074, 1, 0, 0.682353, 1,
1.267071, 0.4980438, 2.047765, 1, 0, 0.6784314, 1,
1.272006, 1.343398, 1.540583, 1, 0, 0.6705883, 1,
1.275485, 1.028231, 1.382414, 1, 0, 0.6666667, 1,
1.278446, -1.078436, 2.790548, 1, 0, 0.6588235, 1,
1.278722, -0.9584661, 2.743782, 1, 0, 0.654902, 1,
1.311169, -1.070343, 1.559639, 1, 0, 0.6470588, 1,
1.315263, 1.342549, -1.120366, 1, 0, 0.6431373, 1,
1.317526, -2.922097, 1.904683, 1, 0, 0.6352941, 1,
1.328897, -1.615478, 3.429924, 1, 0, 0.6313726, 1,
1.334554, -1.705077, 1.944079, 1, 0, 0.6235294, 1,
1.346254, -0.8106294, 3.088995, 1, 0, 0.6196079, 1,
1.353208, 0.7591431, -0.419748, 1, 0, 0.6117647, 1,
1.35752, -1.320519, 1.568503, 1, 0, 0.6078432, 1,
1.368006, -0.5174108, 0.4560421, 1, 0, 0.6, 1,
1.370518, 0.5592406, 0.2801141, 1, 0, 0.5921569, 1,
1.371894, 1.933732, 1.588903, 1, 0, 0.5882353, 1,
1.378865, -1.776462, 3.30558, 1, 0, 0.5803922, 1,
1.383099, 0.3374407, 2.259177, 1, 0, 0.5764706, 1,
1.385073, 0.5255154, 0.7543067, 1, 0, 0.5686275, 1,
1.389491, -0.2084973, 0.6862855, 1, 0, 0.5647059, 1,
1.40083, 0.1302207, 3.59274, 1, 0, 0.5568628, 1,
1.405198, 0.2090925, -0.6695514, 1, 0, 0.5529412, 1,
1.437572, 1.593233, 2.493297, 1, 0, 0.5450981, 1,
1.448348, 0.3585835, 1.07731, 1, 0, 0.5411765, 1,
1.456017, -0.809234, 2.607237, 1, 0, 0.5333334, 1,
1.457157, -0.7000566, 2.174159, 1, 0, 0.5294118, 1,
1.465657, 0.229888, 2.168553, 1, 0, 0.5215687, 1,
1.475153, 1.7058, 0.7904817, 1, 0, 0.5176471, 1,
1.477133, -0.1763699, 2.098055, 1, 0, 0.509804, 1,
1.479423, -0.5947105, 2.385391, 1, 0, 0.5058824, 1,
1.481292, -1.389501, 3.360788, 1, 0, 0.4980392, 1,
1.487736, 0.7933933, 0.4621901, 1, 0, 0.4901961, 1,
1.49425, -0.002861234, 0.6152112, 1, 0, 0.4862745, 1,
1.497574, 2.00745, 0.05076193, 1, 0, 0.4784314, 1,
1.505701, -1.55995, 3.800086, 1, 0, 0.4745098, 1,
1.511939, 0.03777898, 1.631404, 1, 0, 0.4666667, 1,
1.512237, -0.3739836, 1.166303, 1, 0, 0.4627451, 1,
1.523121, -2.383957, 4.152625, 1, 0, 0.454902, 1,
1.525573, 0.5513863, 0.9624511, 1, 0, 0.4509804, 1,
1.55066, 0.2668648, 1.551368, 1, 0, 0.4431373, 1,
1.559709, 2.183648, -0.5345393, 1, 0, 0.4392157, 1,
1.564506, 0.9710366, 1.395847, 1, 0, 0.4313726, 1,
1.576934, -0.5443791, 2.164092, 1, 0, 0.427451, 1,
1.582061, 0.8043911, 1.309924, 1, 0, 0.4196078, 1,
1.59752, 1.413677, 2.47286, 1, 0, 0.4156863, 1,
1.611543, 1.088225, 2.319707, 1, 0, 0.4078431, 1,
1.616606, -0.1480461, 1.86729, 1, 0, 0.4039216, 1,
1.617734, -1.075044, 3.548489, 1, 0, 0.3960784, 1,
1.617882, 1.518522, 0.001380019, 1, 0, 0.3882353, 1,
1.630237, -2.149251, 2.820342, 1, 0, 0.3843137, 1,
1.637112, 0.4323418, 2.156215, 1, 0, 0.3764706, 1,
1.651313, -1.365731, 2.334965, 1, 0, 0.372549, 1,
1.651847, -0.06039201, 3.106549, 1, 0, 0.3647059, 1,
1.663922, 0.1460245, 1.829351, 1, 0, 0.3607843, 1,
1.673995, -0.9551134, 2.723491, 1, 0, 0.3529412, 1,
1.680674, 0.6340546, 0.8622917, 1, 0, 0.3490196, 1,
1.689548, 0.3309104, 0.2882726, 1, 0, 0.3411765, 1,
1.69518, -0.2467344, 0.9592687, 1, 0, 0.3372549, 1,
1.699353, 1.119402, -1.22741, 1, 0, 0.3294118, 1,
1.700741, -0.2369744, 2.029012, 1, 0, 0.3254902, 1,
1.711953, -2.185032, 3.034748, 1, 0, 0.3176471, 1,
1.717675, -0.4594908, 2.403182, 1, 0, 0.3137255, 1,
1.720235, 0.1069904, 1.486464, 1, 0, 0.3058824, 1,
1.723805, -0.7777691, 1.772605, 1, 0, 0.2980392, 1,
1.723836, -0.1521122, 2.222801, 1, 0, 0.2941177, 1,
1.73677, -0.05034231, 0.008280828, 1, 0, 0.2862745, 1,
1.752789, 0.842669, 1.460387, 1, 0, 0.282353, 1,
1.757823, -1.105787, 2.574446, 1, 0, 0.2745098, 1,
1.765682, -0.3344249, 0.7791075, 1, 0, 0.2705882, 1,
1.777672, 0.0572752, 2.549191, 1, 0, 0.2627451, 1,
1.777792, -0.6408765, 2.033782, 1, 0, 0.2588235, 1,
1.79083, -0.9532111, 2.549254, 1, 0, 0.2509804, 1,
1.817683, -0.9969971, 4.042091, 1, 0, 0.2470588, 1,
1.844724, 1.791298, 1.404559, 1, 0, 0.2392157, 1,
1.844786, 0.2900625, 3.093401, 1, 0, 0.2352941, 1,
1.846457, -0.1754429, 2.60162, 1, 0, 0.227451, 1,
1.847773, -1.030269, 1.666672, 1, 0, 0.2235294, 1,
1.861478, -1.237656, 1.908279, 1, 0, 0.2156863, 1,
1.871051, -1.615443, 1.344521, 1, 0, 0.2117647, 1,
1.890304, 0.02133569, 0.6626863, 1, 0, 0.2039216, 1,
1.893772, 0.400854, 1.604249, 1, 0, 0.1960784, 1,
1.915496, 0.7627122, 1.72864, 1, 0, 0.1921569, 1,
1.925948, 0.1334547, 0.5555559, 1, 0, 0.1843137, 1,
1.927629, 1.314159, 0.1297299, 1, 0, 0.1803922, 1,
1.948167, -1.00438, 0.720073, 1, 0, 0.172549, 1,
1.972728, -0.04077437, 2.298326, 1, 0, 0.1686275, 1,
1.984331, 0.3749326, 2.952506, 1, 0, 0.1607843, 1,
2.001362, -0.3334639, 1.471269, 1, 0, 0.1568628, 1,
2.034135, -0.9302473, 2.408849, 1, 0, 0.1490196, 1,
2.040205, -0.0549867, 1.336855, 1, 0, 0.145098, 1,
2.045971, -2.935175, 1.800675, 1, 0, 0.1372549, 1,
2.062696, -0.8734004, 2.846367, 1, 0, 0.1333333, 1,
2.091342, -0.3705024, 0.6623085, 1, 0, 0.1254902, 1,
2.124325, 0.3273299, 1.183985, 1, 0, 0.1215686, 1,
2.14922, 0.4423363, 1.155209, 1, 0, 0.1137255, 1,
2.199406, 0.7421597, 1.239364, 1, 0, 0.1098039, 1,
2.201116, 2.371357, 0.7491375, 1, 0, 0.1019608, 1,
2.34017, 0.2751937, 1.544051, 1, 0, 0.09411765, 1,
2.375731, -0.3847471, 0.3536144, 1, 0, 0.09019608, 1,
2.41993, -0.1884843, 1.926573, 1, 0, 0.08235294, 1,
2.426738, -1.174337, 1.783139, 1, 0, 0.07843138, 1,
2.523869, -0.39404, 1.299909, 1, 0, 0.07058824, 1,
2.55018, 0.1866962, 1.193325, 1, 0, 0.06666667, 1,
2.564569, 0.8840304, 0.5112619, 1, 0, 0.05882353, 1,
2.580735, -0.3087734, -1.230147, 1, 0, 0.05490196, 1,
2.646247, 1.622039, 1.490373, 1, 0, 0.04705882, 1,
2.679525, -0.5103068, 1.112168, 1, 0, 0.04313726, 1,
2.714406, 1.505522, 2.288623, 1, 0, 0.03529412, 1,
2.762006, -0.1100437, -0.2658509, 1, 0, 0.03137255, 1,
2.955702, 1.685296, 1.794984, 1, 0, 0.02352941, 1,
2.982009, 0.3722611, 2.85536, 1, 0, 0.01960784, 1,
2.988957, -0.2985701, 1.441059, 1, 0, 0.01176471, 1,
3.050133, -2.853997, 1.339734, 1, 0, 0.007843138, 1
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
0.02481353, -4.608613, -7.317945, 0, -0.5, 0.5, 0.5,
0.02481353, -4.608613, -7.317945, 1, -0.5, 0.5, 0.5,
0.02481353, -4.608613, -7.317945, 1, 1.5, 0.5, 0.5,
0.02481353, -4.608613, -7.317945, 0, 1.5, 0.5, 0.5
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
-4.026089, 0.407793, -7.317945, 0, -0.5, 0.5, 0.5,
-4.026089, 0.407793, -7.317945, 1, -0.5, 0.5, 0.5,
-4.026089, 0.407793, -7.317945, 1, 1.5, 0.5, 0.5,
-4.026089, 0.407793, -7.317945, 0, 1.5, 0.5, 0.5
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
-4.026089, -4.608613, 0.2900693, 0, -0.5, 0.5, 0.5,
-4.026089, -4.608613, 0.2900693, 1, -0.5, 0.5, 0.5,
-4.026089, -4.608613, 0.2900693, 1, 1.5, 0.5, 0.5,
-4.026089, -4.608613, 0.2900693, 0, 1.5, 0.5, 0.5
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
-3, -3.450981, -5.56225,
3, -3.450981, -5.56225,
-3, -3.450981, -5.56225,
-3, -3.64392, -5.854866,
-2, -3.450981, -5.56225,
-2, -3.64392, -5.854866,
-1, -3.450981, -5.56225,
-1, -3.64392, -5.854866,
0, -3.450981, -5.56225,
0, -3.64392, -5.854866,
1, -3.450981, -5.56225,
1, -3.64392, -5.854866,
2, -3.450981, -5.56225,
2, -3.64392, -5.854866,
3, -3.450981, -5.56225,
3, -3.64392, -5.854866
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
-3, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
-3, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
-3, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5,
-2, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
-2, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
-2, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
-2, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5,
-1, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
-1, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
-1, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
-1, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5,
0, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
0, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
0, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
0, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5,
1, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
1, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
1, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
1, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5,
2, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
2, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
2, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
2, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5,
3, -4.029797, -6.440097, 0, -0.5, 0.5, 0.5,
3, -4.029797, -6.440097, 1, -0.5, 0.5, 0.5,
3, -4.029797, -6.440097, 1, 1.5, 0.5, 0.5,
3, -4.029797, -6.440097, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.091265, -2, -5.56225,
-3.091265, 4, -5.56225,
-3.091265, -2, -5.56225,
-3.247069, -2, -5.854866,
-3.091265, 0, -5.56225,
-3.247069, 0, -5.854866,
-3.091265, 2, -5.56225,
-3.247069, 2, -5.854866,
-3.091265, 4, -5.56225,
-3.247069, 4, -5.854866
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
"0",
"2",
"4"
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
-3.558677, -2, -6.440097, 0, -0.5, 0.5, 0.5,
-3.558677, -2, -6.440097, 1, -0.5, 0.5, 0.5,
-3.558677, -2, -6.440097, 1, 1.5, 0.5, 0.5,
-3.558677, -2, -6.440097, 0, 1.5, 0.5, 0.5,
-3.558677, 0, -6.440097, 0, -0.5, 0.5, 0.5,
-3.558677, 0, -6.440097, 1, -0.5, 0.5, 0.5,
-3.558677, 0, -6.440097, 1, 1.5, 0.5, 0.5,
-3.558677, 0, -6.440097, 0, 1.5, 0.5, 0.5,
-3.558677, 2, -6.440097, 0, -0.5, 0.5, 0.5,
-3.558677, 2, -6.440097, 1, -0.5, 0.5, 0.5,
-3.558677, 2, -6.440097, 1, 1.5, 0.5, 0.5,
-3.558677, 2, -6.440097, 0, 1.5, 0.5, 0.5,
-3.558677, 4, -6.440097, 0, -0.5, 0.5, 0.5,
-3.558677, 4, -6.440097, 1, -0.5, 0.5, 0.5,
-3.558677, 4, -6.440097, 1, 1.5, 0.5, 0.5,
-3.558677, 4, -6.440097, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.091265, -3.450981, -4,
-3.091265, -3.450981, 4,
-3.091265, -3.450981, -4,
-3.247069, -3.64392, -4,
-3.091265, -3.450981, -2,
-3.247069, -3.64392, -2,
-3.091265, -3.450981, 0,
-3.247069, -3.64392, 0,
-3.091265, -3.450981, 2,
-3.247069, -3.64392, 2,
-3.091265, -3.450981, 4,
-3.247069, -3.64392, 4
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
-3.558677, -4.029797, -4, 0, -0.5, 0.5, 0.5,
-3.558677, -4.029797, -4, 1, -0.5, 0.5, 0.5,
-3.558677, -4.029797, -4, 1, 1.5, 0.5, 0.5,
-3.558677, -4.029797, -4, 0, 1.5, 0.5, 0.5,
-3.558677, -4.029797, -2, 0, -0.5, 0.5, 0.5,
-3.558677, -4.029797, -2, 1, -0.5, 0.5, 0.5,
-3.558677, -4.029797, -2, 1, 1.5, 0.5, 0.5,
-3.558677, -4.029797, -2, 0, 1.5, 0.5, 0.5,
-3.558677, -4.029797, 0, 0, -0.5, 0.5, 0.5,
-3.558677, -4.029797, 0, 1, -0.5, 0.5, 0.5,
-3.558677, -4.029797, 0, 1, 1.5, 0.5, 0.5,
-3.558677, -4.029797, 0, 0, 1.5, 0.5, 0.5,
-3.558677, -4.029797, 2, 0, -0.5, 0.5, 0.5,
-3.558677, -4.029797, 2, 1, -0.5, 0.5, 0.5,
-3.558677, -4.029797, 2, 1, 1.5, 0.5, 0.5,
-3.558677, -4.029797, 2, 0, 1.5, 0.5, 0.5,
-3.558677, -4.029797, 4, 0, -0.5, 0.5, 0.5,
-3.558677, -4.029797, 4, 1, -0.5, 0.5, 0.5,
-3.558677, -4.029797, 4, 1, 1.5, 0.5, 0.5,
-3.558677, -4.029797, 4, 0, 1.5, 0.5, 0.5
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
-3.091265, -3.450981, -5.56225,
-3.091265, 4.266567, -5.56225,
-3.091265, -3.450981, 6.142388,
-3.091265, 4.266567, 6.142388,
-3.091265, -3.450981, -5.56225,
-3.091265, -3.450981, 6.142388,
-3.091265, 4.266567, -5.56225,
-3.091265, 4.266567, 6.142388,
-3.091265, -3.450981, -5.56225,
3.140892, -3.450981, -5.56225,
-3.091265, -3.450981, 6.142388,
3.140892, -3.450981, 6.142388,
-3.091265, 4.266567, -5.56225,
3.140892, 4.266567, -5.56225,
-3.091265, 4.266567, 6.142388,
3.140892, 4.266567, 6.142388,
3.140892, -3.450981, -5.56225,
3.140892, 4.266567, -5.56225,
3.140892, -3.450981, 6.142388,
3.140892, 4.266567, 6.142388,
3.140892, -3.450981, -5.56225,
3.140892, -3.450981, 6.142388,
3.140892, 4.266567, -5.56225,
3.140892, 4.266567, 6.142388
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
var radius = 8.192712;
var distance = 36.4503;
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
mvMatrix.translate( -0.02481353, -0.407793, -0.2900693 );
mvMatrix.scale( 1.421357, 1.147789, 0.7568043 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.4503);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
N-(p-tolyl)-Sulfamid<-read.table("N-(p-tolyl)-Sulfamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-N-(p-tolyl)-Sulfamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
y<-N-(p-tolyl)-Sulfamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
```

```r
z<-N-(p-tolyl)-Sulfamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'N' not found
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
-3.000506, -0.383289, -0.8087829, 0, 0, 1, 1, 1,
-2.599207, 0.2535707, -0.4071793, 1, 0, 0, 1, 1,
-2.540303, 1.188485, -1.818665, 1, 0, 0, 1, 1,
-2.365978, 0.2742095, -3.190964, 1, 0, 0, 1, 1,
-2.359433, 0.00276037, -3.209517, 1, 0, 0, 1, 1,
-2.352426, 0.06469089, -2.740202, 1, 0, 0, 1, 1,
-2.350719, 0.09892548, -0.7645007, 0, 0, 0, 1, 1,
-2.287902, -0.01084066, -0.9933047, 0, 0, 0, 1, 1,
-2.266599, -0.8365626, -1.741705, 0, 0, 0, 1, 1,
-2.262584, 0.1185459, -3.323164, 0, 0, 0, 1, 1,
-2.201114, 0.3387505, -1.369448, 0, 0, 0, 1, 1,
-2.176318, -0.904337, -2.083586, 0, 0, 0, 1, 1,
-2.168628, -1.639902, -2.730723, 0, 0, 0, 1, 1,
-2.144961, -0.2294685, -0.6283453, 1, 1, 1, 1, 1,
-2.133912, 0.741572, 0.2766691, 1, 1, 1, 1, 1,
-2.07616, 0.1924673, -3.384384, 1, 1, 1, 1, 1,
-2.039467, 0.7520735, -3.008434, 1, 1, 1, 1, 1,
-2.02261, -0.4855742, -1.534318, 1, 1, 1, 1, 1,
-1.987083, -1.33739, -3.543907, 1, 1, 1, 1, 1,
-1.944537, -0.5113093, -2.269913, 1, 1, 1, 1, 1,
-1.94198, 0.2007316, -1.952767, 1, 1, 1, 1, 1,
-1.941465, -0.987896, -2.543326, 1, 1, 1, 1, 1,
-1.93892, 1.204256, -0.3119967, 1, 1, 1, 1, 1,
-1.929304, -1.606631, -4.429356, 1, 1, 1, 1, 1,
-1.921488, 0.153308, -3.26263, 1, 1, 1, 1, 1,
-1.880018, 0.009029801, -3.672397, 1, 1, 1, 1, 1,
-1.875615, 0.902512, -0.5578524, 1, 1, 1, 1, 1,
-1.869826, 0.8673927, -1.97463, 1, 1, 1, 1, 1,
-1.863649, 0.6138591, -2.35144, 0, 0, 1, 1, 1,
-1.851136, -0.3071088, -2.457403, 1, 0, 0, 1, 1,
-1.811626, 0.04058907, -2.619005, 1, 0, 0, 1, 1,
-1.779188, 0.7912408, -2.113953, 1, 0, 0, 1, 1,
-1.771576, -1.43526, -1.28719, 1, 0, 0, 1, 1,
-1.765564, -0.9048603, -3.957756, 1, 0, 0, 1, 1,
-1.741804, 0.4975615, -1.213241, 0, 0, 0, 1, 1,
-1.741278, -0.9880107, -2.863409, 0, 0, 0, 1, 1,
-1.728048, 1.317127, -0.9840197, 0, 0, 0, 1, 1,
-1.70547, 1.754512, -1.564889, 0, 0, 0, 1, 1,
-1.6698, 0.2929711, -1.105833, 0, 0, 0, 1, 1,
-1.657627, -0.5407152, -1.826772, 0, 0, 0, 1, 1,
-1.656059, 0.5498311, -1.079979, 0, 0, 0, 1, 1,
-1.649323, 1.138957, -0.2902996, 1, 1, 1, 1, 1,
-1.64271, -1.545364, -2.04828, 1, 1, 1, 1, 1,
-1.638431, -0.7285466, -3.075959, 1, 1, 1, 1, 1,
-1.603064, -1.092913, -3.549099, 1, 1, 1, 1, 1,
-1.595019, -1.536767, -1.867221, 1, 1, 1, 1, 1,
-1.592502, -1.052349, -2.262282, 1, 1, 1, 1, 1,
-1.591528, -0.3352334, -1.647663, 1, 1, 1, 1, 1,
-1.585678, -2.059505, -3.190055, 1, 1, 1, 1, 1,
-1.57612, 0.5348291, -1.630777, 1, 1, 1, 1, 1,
-1.569654, -1.050251, -2.297455, 1, 1, 1, 1, 1,
-1.566041, -0.1435751, -1.894813, 1, 1, 1, 1, 1,
-1.55689, 0.1097034, -3.144127, 1, 1, 1, 1, 1,
-1.53864, -0.174684, -0.07765102, 1, 1, 1, 1, 1,
-1.519449, 0.6062744, -1.25714, 1, 1, 1, 1, 1,
-1.505012, 1.269392, -1.633609, 1, 1, 1, 1, 1,
-1.503208, -0.5577112, -2.13201, 0, 0, 1, 1, 1,
-1.496066, 1.088728, -1.00676, 1, 0, 0, 1, 1,
-1.491643, -1.010567, -3.32647, 1, 0, 0, 1, 1,
-1.486513, 0.2039043, -2.652444, 1, 0, 0, 1, 1,
-1.465734, 0.1948822, -1.402369, 1, 0, 0, 1, 1,
-1.450059, 0.5430481, -1.420465, 1, 0, 0, 1, 1,
-1.44859, -1.409495, -2.81128, 0, 0, 0, 1, 1,
-1.437689, 0.494893, -1.756029, 0, 0, 0, 1, 1,
-1.433404, 1.275659, -0.1823056, 0, 0, 0, 1, 1,
-1.429986, -0.2505872, 0.7055823, 0, 0, 0, 1, 1,
-1.429454, 0.4656095, 1.002595, 0, 0, 0, 1, 1,
-1.412752, 0.7626646, -3.725552, 0, 0, 0, 1, 1,
-1.409163, -0.03590081, -2.281159, 0, 0, 0, 1, 1,
-1.407327, 0.2562352, 1.128233, 1, 1, 1, 1, 1,
-1.402888, 0.6952991, -0.7647002, 1, 1, 1, 1, 1,
-1.39171, 0.576449, -0.9880621, 1, 1, 1, 1, 1,
-1.379873, -0.3950251, -1.708493, 1, 1, 1, 1, 1,
-1.372386, -1.547051, -2.441701, 1, 1, 1, 1, 1,
-1.371668, -1.454431, -3.943227, 1, 1, 1, 1, 1,
-1.367701, -3.33859, -1.45468, 1, 1, 1, 1, 1,
-1.363573, 0.1067228, -0.7084133, 1, 1, 1, 1, 1,
-1.351472, 0.2398674, -1.16996, 1, 1, 1, 1, 1,
-1.346243, 2.071191, 0.3335549, 1, 1, 1, 1, 1,
-1.339435, -0.7017956, -1.684504, 1, 1, 1, 1, 1,
-1.337214, 0.9625909, -0.3699555, 1, 1, 1, 1, 1,
-1.336636, -0.2093025, -2.178451, 1, 1, 1, 1, 1,
-1.334727, -0.1705993, -2.939672, 1, 1, 1, 1, 1,
-1.334721, 0.2329994, -1.513859, 1, 1, 1, 1, 1,
-1.333213, -0.8467172, -3.246188, 0, 0, 1, 1, 1,
-1.324005, -0.4212521, -3.466357, 1, 0, 0, 1, 1,
-1.320708, 1.04853, 0.6104566, 1, 0, 0, 1, 1,
-1.316042, 0.3189878, -1.593916, 1, 0, 0, 1, 1,
-1.30865, -1.322997, -1.797935, 1, 0, 0, 1, 1,
-1.29997, -0.3273351, -1.897135, 1, 0, 0, 1, 1,
-1.294502, -1.160578, -1.855436, 0, 0, 0, 1, 1,
-1.294134, 0.1784688, -2.901899, 0, 0, 0, 1, 1,
-1.286622, 0.622453, -0.4489819, 0, 0, 0, 1, 1,
-1.279932, -1.219366, -4.686517, 0, 0, 0, 1, 1,
-1.263506, -1.022189, -1.116525, 0, 0, 0, 1, 1,
-1.263131, 1.59666, -0.4008024, 0, 0, 0, 1, 1,
-1.262186, 0.02337128, -1.426545, 0, 0, 0, 1, 1,
-1.259263, 0.2383617, -0.381273, 1, 1, 1, 1, 1,
-1.257038, 0.5234092, -0.449845, 1, 1, 1, 1, 1,
-1.255562, -1.233994, -1.41572, 1, 1, 1, 1, 1,
-1.241811, 1.028761, -0.8893237, 1, 1, 1, 1, 1,
-1.225882, 0.9313824, -2.727278, 1, 1, 1, 1, 1,
-1.221735, 0.4829331, -2.475023, 1, 1, 1, 1, 1,
-1.220884, 0.7563322, -0.7950634, 1, 1, 1, 1, 1,
-1.219982, 0.2989502, -0.5925507, 1, 1, 1, 1, 1,
-1.215824, 0.5390687, 0.03726137, 1, 1, 1, 1, 1,
-1.215721, -0.003838379, -0.8956375, 1, 1, 1, 1, 1,
-1.208408, -0.02807887, -2.194833, 1, 1, 1, 1, 1,
-1.207519, 0.6849093, -1.769716, 1, 1, 1, 1, 1,
-1.205649, -1.24408, -2.977513, 1, 1, 1, 1, 1,
-1.204863, 1.19895, -0.1130079, 1, 1, 1, 1, 1,
-1.204763, -0.8576519, -2.328083, 1, 1, 1, 1, 1,
-1.20372, 0.2940138, -0.8622898, 0, 0, 1, 1, 1,
-1.198014, 0.9375638, -0.03345041, 1, 0, 0, 1, 1,
-1.196607, 0.8889089, -2.397744, 1, 0, 0, 1, 1,
-1.186978, -0.4300819, 0.2405466, 1, 0, 0, 1, 1,
-1.16124, 0.875416, 0.4858869, 1, 0, 0, 1, 1,
-1.155212, -0.3915739, -1.674924, 1, 0, 0, 1, 1,
-1.145589, -0.2006421, -1.406182, 0, 0, 0, 1, 1,
-1.144192, 1.003896, 0.05136437, 0, 0, 0, 1, 1,
-1.139494, -1.49047, -3.064795, 0, 0, 0, 1, 1,
-1.136052, 1.736862, -2.38271, 0, 0, 0, 1, 1,
-1.129074, 1.038511, 0.1973785, 0, 0, 0, 1, 1,
-1.11751, 1.606605, -0.7714305, 0, 0, 0, 1, 1,
-1.092757, 0.07029176, -2.745248, 0, 0, 0, 1, 1,
-1.09117, -1.326777, -2.562733, 1, 1, 1, 1, 1,
-1.089483, 0.3154688, -1.75412, 1, 1, 1, 1, 1,
-1.089, 0.4132876, -1.92554, 1, 1, 1, 1, 1,
-1.086585, -0.4916866, -2.787127, 1, 1, 1, 1, 1,
-1.07968, -1.236082, -1.93897, 1, 1, 1, 1, 1,
-1.07927, -0.5632657, -0.7359404, 1, 1, 1, 1, 1,
-1.076277, 1.020367, -0.997654, 1, 1, 1, 1, 1,
-1.066042, -1.585196, -1.861674, 1, 1, 1, 1, 1,
-1.065799, 1.276209, -1.257632, 1, 1, 1, 1, 1,
-1.064256, -0.2135133, -1.073094, 1, 1, 1, 1, 1,
-1.063846, 1.715177, 0.4916753, 1, 1, 1, 1, 1,
-1.032777, -0.6570474, -1.255229, 1, 1, 1, 1, 1,
-1.030486, -0.3249092, -3.135202, 1, 1, 1, 1, 1,
-1.025964, 0.740531, -3.179044, 1, 1, 1, 1, 1,
-1.01979, -0.1500591, -0.8558324, 1, 1, 1, 1, 1,
-1.01942, -0.8569642, -2.303464, 0, 0, 1, 1, 1,
-1.016294, 0.4092709, -1.039213, 1, 0, 0, 1, 1,
-1.013174, -1.135376, -3.193356, 1, 0, 0, 1, 1,
-1.011714, 0.4660536, -0.08313138, 1, 0, 0, 1, 1,
-1.008534, -0.172946, -2.029573, 1, 0, 0, 1, 1,
-1.008371, -1.236209, -1.436994, 1, 0, 0, 1, 1,
-1.008034, 0.8594943, -0.8803024, 0, 0, 0, 1, 1,
-1.004687, -0.4288709, -2.286787, 0, 0, 0, 1, 1,
-1.002944, 0.7530329, 0.2249711, 0, 0, 0, 1, 1,
-0.9983503, 1.135529, 1.036635, 0, 0, 0, 1, 1,
-0.9978012, 0.5074381, -2.586232, 0, 0, 0, 1, 1,
-0.9944796, -0.9281775, -4.164619, 0, 0, 0, 1, 1,
-0.9846717, -0.6108809, -2.775032, 0, 0, 0, 1, 1,
-0.9813756, 0.3192964, -1.143503, 1, 1, 1, 1, 1,
-0.9802184, -0.2017586, -3.358475, 1, 1, 1, 1, 1,
-0.9768044, 1.7671, -0.6524889, 1, 1, 1, 1, 1,
-0.9747868, -0.8914274, -2.05696, 1, 1, 1, 1, 1,
-0.9702871, -0.7249914, -3.072742, 1, 1, 1, 1, 1,
-0.9682992, 0.6135869, -0.1637035, 1, 1, 1, 1, 1,
-0.9576191, 0.0267325, -3.087477, 1, 1, 1, 1, 1,
-0.957045, -0.09251891, -3.069302, 1, 1, 1, 1, 1,
-0.9419925, 0.2619208, -1.246521, 1, 1, 1, 1, 1,
-0.9397557, -0.05745192, -3.088561, 1, 1, 1, 1, 1,
-0.937082, -0.4381439, -2.785837, 1, 1, 1, 1, 1,
-0.9317322, 0.6450216, -2.444196, 1, 1, 1, 1, 1,
-0.9295929, -0.7616626, -3.124668, 1, 1, 1, 1, 1,
-0.9266197, 0.8657892, -1.277292, 1, 1, 1, 1, 1,
-0.9188007, -0.8823325, -2.775898, 1, 1, 1, 1, 1,
-0.9095511, -0.8736092, -1.729549, 0, 0, 1, 1, 1,
-0.9087827, 0.3690698, -1.030034, 1, 0, 0, 1, 1,
-0.8936926, 0.8740354, 0.3875977, 1, 0, 0, 1, 1,
-0.8927362, 0.7444814, -2.370364, 1, 0, 0, 1, 1,
-0.8925796, -0.9640326, -2.796508, 1, 0, 0, 1, 1,
-0.8737648, 0.4432259, 0.5577732, 1, 0, 0, 1, 1,
-0.8736917, 0.1241061, -2.131653, 0, 0, 0, 1, 1,
-0.8695524, 1.106678, -3.807053, 0, 0, 0, 1, 1,
-0.8676075, -1.234268, -2.781771, 0, 0, 0, 1, 1,
-0.864191, -0.753289, -3.442325, 0, 0, 0, 1, 1,
-0.8591981, -2.402455, -2.433851, 0, 0, 0, 1, 1,
-0.8566288, 0.2368776, -1.863304, 0, 0, 0, 1, 1,
-0.8556697, 1.139583, -0.2195034, 0, 0, 0, 1, 1,
-0.8530119, -0.3116691, -1.34117, 1, 1, 1, 1, 1,
-0.8515902, 0.5313627, -1.129978, 1, 1, 1, 1, 1,
-0.8489664, 2.494526, 0.387585, 1, 1, 1, 1, 1,
-0.8323495, 0.4232118, 0.3756004, 1, 1, 1, 1, 1,
-0.8273222, -0.4676176, -2.999325, 1, 1, 1, 1, 1,
-0.8242592, 1.280943, 0.8130714, 1, 1, 1, 1, 1,
-0.8180269, 1.732377, -0.6284093, 1, 1, 1, 1, 1,
-0.8169406, -1.168251, -1.236077, 1, 1, 1, 1, 1,
-0.804173, -0.3832751, -0.3851944, 1, 1, 1, 1, 1,
-0.8032985, -1.173582, -1.113353, 1, 1, 1, 1, 1,
-0.8027341, 0.382406, -0.154721, 1, 1, 1, 1, 1,
-0.7999292, -1.506184, -2.31332, 1, 1, 1, 1, 1,
-0.7983899, -0.1768814, 0.262473, 1, 1, 1, 1, 1,
-0.798372, -0.4481686, -3.689112, 1, 1, 1, 1, 1,
-0.7943074, 0.6220989, -1.893012, 1, 1, 1, 1, 1,
-0.7939339, 0.1922996, -0.707485, 0, 0, 1, 1, 1,
-0.7923267, -1.132919, -2.397501, 1, 0, 0, 1, 1,
-0.7922305, 0.6014376, -0.7191382, 1, 0, 0, 1, 1,
-0.7905901, -0.3716428, -2.313205, 1, 0, 0, 1, 1,
-0.7902876, -1.394893, -3.406779, 1, 0, 0, 1, 1,
-0.7860773, 0.7113959, -0.8874845, 1, 0, 0, 1, 1,
-0.7851944, 0.2854527, -1.469075, 0, 0, 0, 1, 1,
-0.7790535, 0.3829446, -3.587289, 0, 0, 0, 1, 1,
-0.7702872, -1.282207, -2.737362, 0, 0, 0, 1, 1,
-0.7665312, -2.55785, -3.397901, 0, 0, 0, 1, 1,
-0.7655689, 0.1722906, -2.375467, 0, 0, 0, 1, 1,
-0.7618698, -0.9795007, -2.239614, 0, 0, 0, 1, 1,
-0.7602021, 1.15233, -1.717939, 0, 0, 0, 1, 1,
-0.7493996, -0.8802804, -1.215504, 1, 1, 1, 1, 1,
-0.7358779, -0.3120898, 0.1373575, 1, 1, 1, 1, 1,
-0.7348301, -0.6849023, -2.414165, 1, 1, 1, 1, 1,
-0.7327545, 0.2948412, -0.4065114, 1, 1, 1, 1, 1,
-0.7306108, -1.623155, -2.502987, 1, 1, 1, 1, 1,
-0.7240255, -0.5376099, -3.487287, 1, 1, 1, 1, 1,
-0.7225175, -1.904023, -3.618742, 1, 1, 1, 1, 1,
-0.7202765, 0.6045523, -2.929312, 1, 1, 1, 1, 1,
-0.7082137, -0.7137065, -2.294059, 1, 1, 1, 1, 1,
-0.7051241, -0.1539023, -1.914491, 1, 1, 1, 1, 1,
-0.7028049, 0.5223563, -0.2104332, 1, 1, 1, 1, 1,
-0.7020261, -0.4498546, -4.004972, 1, 1, 1, 1, 1,
-0.7016218, -0.2330048, -1.896518, 1, 1, 1, 1, 1,
-0.7001262, 0.3244829, -1.692555, 1, 1, 1, 1, 1,
-0.6970564, 0.9134848, -2.071982, 1, 1, 1, 1, 1,
-0.6967752, -0.1288482, -3.676332, 0, 0, 1, 1, 1,
-0.6927701, 2.319129, -0.8553253, 1, 0, 0, 1, 1,
-0.6905428, 0.5318658, -1.962038, 1, 0, 0, 1, 1,
-0.6880897, -0.2333768, -1.237606, 1, 0, 0, 1, 1,
-0.686552, 0.1253823, -1.075991, 1, 0, 0, 1, 1,
-0.6828158, 0.5253583, -0.9035888, 1, 0, 0, 1, 1,
-0.678278, -1.699474, -1.824902, 0, 0, 0, 1, 1,
-0.6773084, -0.1460293, -2.370297, 0, 0, 0, 1, 1,
-0.6764376, -0.6038074, -2.35059, 0, 0, 0, 1, 1,
-0.674469, -0.3871406, -1.041872, 0, 0, 0, 1, 1,
-0.6711861, -0.1769804, 0.5561575, 0, 0, 0, 1, 1,
-0.6698158, 0.03828507, -2.589818, 0, 0, 0, 1, 1,
-0.6636319, -1.281517, -2.085091, 0, 0, 0, 1, 1,
-0.6593957, 0.4484921, -2.131885, 1, 1, 1, 1, 1,
-0.6580461, 1.628586, 1.230274, 1, 1, 1, 1, 1,
-0.656414, 2.339002, -0.377896, 1, 1, 1, 1, 1,
-0.6549995, 0.8503736, -2.150702, 1, 1, 1, 1, 1,
-0.6481673, -2.03336, -1.554803, 1, 1, 1, 1, 1,
-0.6414567, -0.3351249, -1.07166, 1, 1, 1, 1, 1,
-0.6410637, -1.031969, -3.353505, 1, 1, 1, 1, 1,
-0.6287396, 2.029202, 1.085841, 1, 1, 1, 1, 1,
-0.6254107, -0.6028226, -3.03636, 1, 1, 1, 1, 1,
-0.6208097, -0.06409813, -0.3829812, 1, 1, 1, 1, 1,
-0.6179997, 1.5567, -0.3735604, 1, 1, 1, 1, 1,
-0.6128832, -0.3802416, -1.867941, 1, 1, 1, 1, 1,
-0.6119798, -0.1119591, -0.4204835, 1, 1, 1, 1, 1,
-0.6094576, 1.104246, -2.048955, 1, 1, 1, 1, 1,
-0.6062239, -0.7556347, -3.049397, 1, 1, 1, 1, 1,
-0.5992593, -0.7398334, -3.468507, 0, 0, 1, 1, 1,
-0.5991358, -0.5972166, -2.974871, 1, 0, 0, 1, 1,
-0.593822, -1.434005, -2.778707, 1, 0, 0, 1, 1,
-0.5931122, -0.01001624, -0.2522976, 1, 0, 0, 1, 1,
-0.5929369, 1.594284, -1.538014, 1, 0, 0, 1, 1,
-0.5928029, -0.4172336, -1.516572, 1, 0, 0, 1, 1,
-0.5873452, -0.5995261, -4.785729, 0, 0, 0, 1, 1,
-0.5865233, -0.9757419, -1.938498, 0, 0, 0, 1, 1,
-0.585948, 0.3988434, -1.734336, 0, 0, 0, 1, 1,
-0.5830216, -0.6925793, -2.676559, 0, 0, 0, 1, 1,
-0.5823911, 0.7947761, -0.7682101, 0, 0, 0, 1, 1,
-0.5791446, 1.09753, -0.2279864, 0, 0, 0, 1, 1,
-0.5752985, -0.2299521, -2.340522, 0, 0, 0, 1, 1,
-0.5732133, -0.7723356, -2.005685, 1, 1, 1, 1, 1,
-0.5682938, 0.1398819, -1.319559, 1, 1, 1, 1, 1,
-0.5671774, -0.1096245, -0.5443594, 1, 1, 1, 1, 1,
-0.5651097, 0.003992788, -3.471903, 1, 1, 1, 1, 1,
-0.5643236, 0.6152769, -1.677242, 1, 1, 1, 1, 1,
-0.5597707, -0.1857329, -0.5479399, 1, 1, 1, 1, 1,
-0.5581349, -0.430521, -4.02863, 1, 1, 1, 1, 1,
-0.5579653, -0.8972604, -2.164891, 1, 1, 1, 1, 1,
-0.5526138, 1.306525, 0.4515167, 1, 1, 1, 1, 1,
-0.5478812, -0.05425965, 0.3700975, 1, 1, 1, 1, 1,
-0.5474769, -0.9966981, -3.683195, 1, 1, 1, 1, 1,
-0.5443399, -0.4598174, -1.640315, 1, 1, 1, 1, 1,
-0.5432374, 1.733684, 0.06781719, 1, 1, 1, 1, 1,
-0.5398964, -0.6186423, -2.519412, 1, 1, 1, 1, 1,
-0.5351586, 0.4843908, 0.6983141, 1, 1, 1, 1, 1,
-0.5313122, 0.8163866, -0.5212859, 0, 0, 1, 1, 1,
-0.5301296, 0.6365126, -2.38537, 1, 0, 0, 1, 1,
-0.521059, -2.345812, -2.991748, 1, 0, 0, 1, 1,
-0.5184959, 0.5325248, -0.9923193, 1, 0, 0, 1, 1,
-0.5092554, -0.04935829, -2.486232, 1, 0, 0, 1, 1,
-0.5076939, 1.088448, -1.373413, 1, 0, 0, 1, 1,
-0.5062087, -0.626, -3.617396, 0, 0, 0, 1, 1,
-0.5025605, 0.663668, -0.4829821, 0, 0, 0, 1, 1,
-0.5012209, 1.485312, -0.4712594, 0, 0, 0, 1, 1,
-0.5010011, 0.5069611, 1.663225, 0, 0, 0, 1, 1,
-0.5005825, -0.6810581, -3.07599, 0, 0, 0, 1, 1,
-0.5003452, -0.4899527, -3.474048, 0, 0, 0, 1, 1,
-0.495869, 1.616045, 1.432492, 0, 0, 0, 1, 1,
-0.4958158, -0.1317765, -3.154423, 1, 1, 1, 1, 1,
-0.4909217, 0.4112146, -0.6958461, 1, 1, 1, 1, 1,
-0.4846588, -0.4785287, -3.086464, 1, 1, 1, 1, 1,
-0.4771491, 0.4502889, -0.1350667, 1, 1, 1, 1, 1,
-0.4751774, -0.5196447, -2.567426, 1, 1, 1, 1, 1,
-0.4713998, 1.195504, -0.1743306, 1, 1, 1, 1, 1,
-0.4675753, -1.550427, -3.4387, 1, 1, 1, 1, 1,
-0.4660594, -0.8382994, -2.309748, 1, 1, 1, 1, 1,
-0.464288, 0.3019871, -1.740474, 1, 1, 1, 1, 1,
-0.4618789, 0.3854093, -0.008505023, 1, 1, 1, 1, 1,
-0.4591118, 0.2870032, -2.471778, 1, 1, 1, 1, 1,
-0.4567886, -1.033185, -2.698292, 1, 1, 1, 1, 1,
-0.455956, -0.1027427, -3.287346, 1, 1, 1, 1, 1,
-0.4487056, 0.2066119, -2.397869, 1, 1, 1, 1, 1,
-0.4464688, 0.05432852, -0.378165, 1, 1, 1, 1, 1,
-0.4446516, 0.08483568, -0.454024, 0, 0, 1, 1, 1,
-0.4439583, 0.37606, -1.37608, 1, 0, 0, 1, 1,
-0.4389835, -0.110951, -1.060498, 1, 0, 0, 1, 1,
-0.4377686, 0.1230105, -0.940508, 1, 0, 0, 1, 1,
-0.4343731, -1.389976, -4.371235, 1, 0, 0, 1, 1,
-0.4329138, -0.4781591, -2.516203, 1, 0, 0, 1, 1,
-0.4316457, -0.1065719, -1.916573, 0, 0, 0, 1, 1,
-0.4292889, -1.008696, -4.329658, 0, 0, 0, 1, 1,
-0.4268981, -0.4062712, -0.1867811, 0, 0, 0, 1, 1,
-0.4170281, -0.5995254, -2.135665, 0, 0, 0, 1, 1,
-0.4137021, -0.764789, -3.30029, 0, 0, 0, 1, 1,
-0.4134118, -1.178853, -2.970888, 0, 0, 0, 1, 1,
-0.4133782, 1.241675, -0.248747, 0, 0, 0, 1, 1,
-0.4119944, 1.118729, 0.2475305, 1, 1, 1, 1, 1,
-0.4114969, 0.6255626, -1.828866, 1, 1, 1, 1, 1,
-0.4096358, -0.4488895, -1.617671, 1, 1, 1, 1, 1,
-0.4071013, -0.9413184, -3.98838, 1, 1, 1, 1, 1,
-0.4061218, 0.5566688, 0.8029985, 1, 1, 1, 1, 1,
-0.4048448, -0.9697567, -3.901461, 1, 1, 1, 1, 1,
-0.4045129, 1.027795, -1.365258, 1, 1, 1, 1, 1,
-0.3991277, 1.081952, 0.1326433, 1, 1, 1, 1, 1,
-0.3972663, -0.4178173, -1.573828, 1, 1, 1, 1, 1,
-0.3942635, 0.0517269, -0.1435001, 1, 1, 1, 1, 1,
-0.3890354, 0.6382136, -0.6200573, 1, 1, 1, 1, 1,
-0.3886359, -0.8889042, -2.170537, 1, 1, 1, 1, 1,
-0.3882847, -1.191446, -1.509493, 1, 1, 1, 1, 1,
-0.3825211, 0.2625777, -0.3894342, 1, 1, 1, 1, 1,
-0.3789321, 0.09297398, -0.04551947, 1, 1, 1, 1, 1,
-0.3712739, -1.520475, -3.660007, 0, 0, 1, 1, 1,
-0.3702935, 0.7427917, 0.1540017, 1, 0, 0, 1, 1,
-0.3692693, 0.3440515, -0.3091417, 1, 0, 0, 1, 1,
-0.368394, 0.7023305, 0.1398082, 1, 0, 0, 1, 1,
-0.3658926, 0.9475342, -0.8009539, 1, 0, 0, 1, 1,
-0.3623527, -1.483476, -4.832938, 1, 0, 0, 1, 1,
-0.361979, 0.42166, -2.9167, 0, 0, 0, 1, 1,
-0.3581205, -0.4573278, -1.380669, 0, 0, 0, 1, 1,
-0.3559199, -0.572239, -0.9230757, 0, 0, 0, 1, 1,
-0.3547741, 1.62323, 0.7496824, 0, 0, 0, 1, 1,
-0.3543256, -0.008726165, -1.314792, 0, 0, 0, 1, 1,
-0.3528173, -0.9195616, -1.591576, 0, 0, 0, 1, 1,
-0.3520675, 0.6207061, 0.4423227, 0, 0, 0, 1, 1,
-0.3517432, 0.06708374, -1.003743, 1, 1, 1, 1, 1,
-0.3476057, -1.802509, -3.707757, 1, 1, 1, 1, 1,
-0.3455808, 0.4380377, -0.8014012, 1, 1, 1, 1, 1,
-0.3455536, 1.460594, 0.7797855, 1, 1, 1, 1, 1,
-0.3433769, -0.8492539, -2.09899, 1, 1, 1, 1, 1,
-0.3417968, -0.1656662, -1.192283, 1, 1, 1, 1, 1,
-0.340545, -0.1617463, -0.7292414, 1, 1, 1, 1, 1,
-0.3356598, -0.3274119, -2.094127, 1, 1, 1, 1, 1,
-0.3347886, -0.3047642, -1.427758, 1, 1, 1, 1, 1,
-0.3344932, -2.350672, -1.9401, 1, 1, 1, 1, 1,
-0.3247457, -0.4106544, -1.918845, 1, 1, 1, 1, 1,
-0.3241441, 0.7725726, -2.043231, 1, 1, 1, 1, 1,
-0.3219145, 0.6075124, -0.7090828, 1, 1, 1, 1, 1,
-0.3171269, -0.3163928, -2.875543, 1, 1, 1, 1, 1,
-0.3157298, -0.9095141, -1.808356, 1, 1, 1, 1, 1,
-0.3144418, 1.380122, -1.546355, 0, 0, 1, 1, 1,
-0.3142983, -0.06432286, -1.54828, 1, 0, 0, 1, 1,
-0.3136676, 0.4557667, -0.747452, 1, 0, 0, 1, 1,
-0.3052376, 0.2416026, -0.4588102, 1, 0, 0, 1, 1,
-0.3041291, -1.338383, -3.677892, 1, 0, 0, 1, 1,
-0.3010302, -1.533772, -2.183202, 1, 0, 0, 1, 1,
-0.2991049, -1.466348, -3.529073, 0, 0, 0, 1, 1,
-0.2955171, -0.7743769, -2.876063, 0, 0, 0, 1, 1,
-0.2936727, 1.227274, 0.03698499, 0, 0, 0, 1, 1,
-0.2925328, 0.2164205, -1.767648, 0, 0, 0, 1, 1,
-0.2880012, -1.185768, -4.480103, 0, 0, 0, 1, 1,
-0.2874027, -0.4942813, -3.512549, 0, 0, 0, 1, 1,
-0.2801276, 1.00706, -0.1944044, 0, 0, 0, 1, 1,
-0.2753157, -0.04924667, -0.5447773, 1, 1, 1, 1, 1,
-0.2721434, 0.8414387, 2.431746, 1, 1, 1, 1, 1,
-0.2705202, 1.463729, 0.7331387, 1, 1, 1, 1, 1,
-0.2684272, 0.6583721, -0.7603393, 1, 1, 1, 1, 1,
-0.2665704, 0.0155935, -1.407116, 1, 1, 1, 1, 1,
-0.2655944, 0.543914, -0.1573759, 1, 1, 1, 1, 1,
-0.2633319, 2.053266, 2.392557, 1, 1, 1, 1, 1,
-0.2627314, 0.4059344, -1.700134, 1, 1, 1, 1, 1,
-0.2609715, 1.545716, 0.7534716, 1, 1, 1, 1, 1,
-0.2523583, -1.629579, -2.612599, 1, 1, 1, 1, 1,
-0.2492737, 1.980042, -0.6704563, 1, 1, 1, 1, 1,
-0.2463095, -0.257393, -2.194487, 1, 1, 1, 1, 1,
-0.2457709, 0.1646133, -2.52799, 1, 1, 1, 1, 1,
-0.2437091, 0.6721331, -1.555542, 1, 1, 1, 1, 1,
-0.2388515, -0.4310161, -4.515416, 1, 1, 1, 1, 1,
-0.2378363, -0.4828328, -3.632024, 0, 0, 1, 1, 1,
-0.2327343, 0.8687329, 0.793797, 1, 0, 0, 1, 1,
-0.2301903, -1.167261, -3.688052, 1, 0, 0, 1, 1,
-0.2278072, -0.09503737, -2.551073, 1, 0, 0, 1, 1,
-0.2239517, -1.767385, -2.97309, 1, 0, 0, 1, 1,
-0.2232651, 0.3288196, -1.32903, 1, 0, 0, 1, 1,
-0.2217292, 0.7516012, 1.236432, 0, 0, 0, 1, 1,
-0.2217112, -1.122421, -3.960621, 0, 0, 0, 1, 1,
-0.2203705, -0.3990629, -1.977506, 0, 0, 0, 1, 1,
-0.2195846, -0.7931572, -2.086002, 0, 0, 0, 1, 1,
-0.2183971, 0.5989606, -0.115141, 0, 0, 0, 1, 1,
-0.2161501, -0.8564928, -3.300278, 0, 0, 0, 1, 1,
-0.2147063, 1.075871, -0.03885321, 0, 0, 0, 1, 1,
-0.2140707, -1.361741, -3.586894, 1, 1, 1, 1, 1,
-0.2131042, -2.853002, -3.197392, 1, 1, 1, 1, 1,
-0.210851, -1.225489, -3.585916, 1, 1, 1, 1, 1,
-0.2108465, 1.050143, -1.192543, 1, 1, 1, 1, 1,
-0.2059653, -0.2879285, -5.094348, 1, 1, 1, 1, 1,
-0.2042352, 0.6387194, -0.7830295, 1, 1, 1, 1, 1,
-0.2025558, 2.005663, 0.3720171, 1, 1, 1, 1, 1,
-0.200491, 1.345347, 1.026461, 1, 1, 1, 1, 1,
-0.1981834, 1.358376, 0.8115789, 1, 1, 1, 1, 1,
-0.1977831, -0.9691486, -2.55034, 1, 1, 1, 1, 1,
-0.1956401, -0.2771682, -2.22857, 1, 1, 1, 1, 1,
-0.1928128, 0.678904, 0.6832265, 1, 1, 1, 1, 1,
-0.1921143, -0.2640065, -3.036373, 1, 1, 1, 1, 1,
-0.1906211, -0.719874, -5.391794, 1, 1, 1, 1, 1,
-0.1900519, -0.2619964, -3.458911, 1, 1, 1, 1, 1,
-0.1891886, 0.2278738, -0.7866378, 0, 0, 1, 1, 1,
-0.1891139, -0.2679911, -2.789395, 1, 0, 0, 1, 1,
-0.1821963, -0.04711112, -2.458247, 1, 0, 0, 1, 1,
-0.1818034, -0.6991137, -1.698046, 1, 0, 0, 1, 1,
-0.1797399, -1.713931, -2.726593, 1, 0, 0, 1, 1,
-0.1708957, -0.2995902, -4.170791, 1, 0, 0, 1, 1,
-0.1705704, -0.365541, -3.891413, 0, 0, 0, 1, 1,
-0.1689016, 1.257023, -1.234728, 0, 0, 0, 1, 1,
-0.1652479, 0.8343305, 0.361919, 0, 0, 0, 1, 1,
-0.1641492, -2.541598, -2.150276, 0, 0, 0, 1, 1,
-0.1640746, -1.11425, -3.216949, 0, 0, 0, 1, 1,
-0.1589209, 0.678422, -1.356746, 0, 0, 0, 1, 1,
-0.1581408, 1.418154, 1.217915, 0, 0, 0, 1, 1,
-0.1574867, -0.4951153, -3.226707, 1, 1, 1, 1, 1,
-0.1496961, 1.582462, -0.3087628, 1, 1, 1, 1, 1,
-0.1462559, 0.4259521, -1.075999, 1, 1, 1, 1, 1,
-0.145293, 0.6687849, 0.4747294, 1, 1, 1, 1, 1,
-0.1392323, -0.1054185, -2.43533, 1, 1, 1, 1, 1,
-0.1356775, 0.2642225, -0.648262, 1, 1, 1, 1, 1,
-0.1342017, -2.236779, -4.425183, 1, 1, 1, 1, 1,
-0.1285692, 0.8145764, -0.8187349, 1, 1, 1, 1, 1,
-0.1270462, 1.111271, -1.526885, 1, 1, 1, 1, 1,
-0.1245841, 0.8104333, 0.3751603, 1, 1, 1, 1, 1,
-0.1242276, -0.3552547, -2.193739, 1, 1, 1, 1, 1,
-0.1235323, -0.9719568, -1.342818, 1, 1, 1, 1, 1,
-0.1212825, 0.2168046, -0.7523446, 1, 1, 1, 1, 1,
-0.1177228, -1.617275, -3.99144, 1, 1, 1, 1, 1,
-0.1110359, -0.3400424, -3.499368, 1, 1, 1, 1, 1,
-0.1087457, -0.1632705, -3.633424, 0, 0, 1, 1, 1,
-0.1070337, 1.513047, -1.983293, 1, 0, 0, 1, 1,
-0.1070141, 1.711671, 0.3932988, 1, 0, 0, 1, 1,
-0.1040902, -0.4740789, -2.300524, 1, 0, 0, 1, 1,
-0.1040104, -0.3547727, -3.054472, 1, 0, 0, 1, 1,
-0.09336649, -0.8548315, -2.034453, 1, 0, 0, 1, 1,
-0.09304607, -1.177859, -3.404315, 0, 0, 0, 1, 1,
-0.09182113, -0.002590641, -0.7902617, 0, 0, 0, 1, 1,
-0.09101585, -1.758462, -2.438679, 0, 0, 0, 1, 1,
-0.08804793, -0.715478, -2.408948, 0, 0, 0, 1, 1,
-0.08658592, -0.2528349, -1.763285, 0, 0, 0, 1, 1,
-0.07739854, -1.42038, -2.521588, 0, 0, 0, 1, 1,
-0.07220806, -0.9456454, -1.939377, 0, 0, 0, 1, 1,
-0.07134849, 2.453655, -1.182253, 1, 1, 1, 1, 1,
-0.07012434, 1.824125, -0.6169977, 1, 1, 1, 1, 1,
-0.06713878, -0.6405536, -3.672992, 1, 1, 1, 1, 1,
-0.06490649, -1.753026, -3.241002, 1, 1, 1, 1, 1,
-0.06478152, -1.360152, -4.527374, 1, 1, 1, 1, 1,
-0.0583952, -0.8678316, -3.598177, 1, 1, 1, 1, 1,
-0.0571468, 0.7476171, 1.628824, 1, 1, 1, 1, 1,
-0.05697672, 0.4222749, -0.09231825, 1, 1, 1, 1, 1,
-0.05562742, -0.8988403, -3.630217, 1, 1, 1, 1, 1,
-0.05444985, 1.770561, 0.9098362, 1, 1, 1, 1, 1,
-0.0445789, -0.09800229, -2.956351, 1, 1, 1, 1, 1,
-0.04228712, -0.8503485, -2.338434, 1, 1, 1, 1, 1,
-0.03830122, 0.8987405, 0.7189937, 1, 1, 1, 1, 1,
-0.02945087, 0.7317642, -1.874023, 1, 1, 1, 1, 1,
-0.02818681, -0.4168427, -2.201256, 1, 1, 1, 1, 1,
-0.02592622, 0.9022679, -1.676342, 0, 0, 1, 1, 1,
-0.02578902, -1.25247, -2.946651, 1, 0, 0, 1, 1,
-0.0253427, -1.192785, -1.575871, 1, 0, 0, 1, 1,
-0.02351063, -0.1474537, -4.667416, 1, 0, 0, 1, 1,
-0.02304331, -1.455967, -2.930992, 1, 0, 0, 1, 1,
-0.007189247, 0.5474099, -1.61202, 1, 0, 0, 1, 1,
-0.004003323, -0.8161619, -2.510793, 0, 0, 0, 1, 1,
0.001372525, 1.837133, 0.7694748, 0, 0, 0, 1, 1,
0.002663898, -0.6130862, 4.844634, 0, 0, 0, 1, 1,
0.003779355, -0.1739167, 4.170945, 0, 0, 0, 1, 1,
0.004273526, -1.030055, 2.167221, 0, 0, 0, 1, 1,
0.004829967, 0.107292, 1.879492, 0, 0, 0, 1, 1,
0.005620285, -0.7502547, 4.605121, 0, 0, 0, 1, 1,
0.007509781, 0.0687206, 0.01798594, 1, 1, 1, 1, 1,
0.009034478, 1.782311, 0.9584454, 1, 1, 1, 1, 1,
0.01132489, 0.4596214, 0.01094398, 1, 1, 1, 1, 1,
0.01146882, 1.330724, -0.01325104, 1, 1, 1, 1, 1,
0.01668562, -1.502033, 2.775114, 1, 1, 1, 1, 1,
0.01695787, 1.774781, -0.1647571, 1, 1, 1, 1, 1,
0.01809428, 2.610149, -0.6639223, 1, 1, 1, 1, 1,
0.01836234, 1.022179, 0.2779645, 1, 1, 1, 1, 1,
0.01871401, 0.7959028, -1.36162, 1, 1, 1, 1, 1,
0.01884891, 0.8311351, -0.3544042, 1, 1, 1, 1, 1,
0.02131904, -0.1632048, 1.138058, 1, 1, 1, 1, 1,
0.02361611, 1.891637, 0.5978031, 1, 1, 1, 1, 1,
0.0264708, -0.8031131, 3.361876, 1, 1, 1, 1, 1,
0.02701941, 1.217698, 1.412674, 1, 1, 1, 1, 1,
0.02705489, 1.093647, 1.263743, 1, 1, 1, 1, 1,
0.02937715, 0.1101788, 0.3438032, 0, 0, 1, 1, 1,
0.0315214, -0.3581931, 3.877476, 1, 0, 0, 1, 1,
0.03182068, 1.273444, 0.159694, 1, 0, 0, 1, 1,
0.03226254, 1.233641, -0.1906214, 1, 0, 0, 1, 1,
0.03427063, -0.4909092, 3.830734, 1, 0, 0, 1, 1,
0.03548438, -0.2085766, 3.971868, 1, 0, 0, 1, 1,
0.03555087, -0.8961244, 2.847261, 0, 0, 0, 1, 1,
0.03679469, 0.3050652, -0.287029, 0, 0, 0, 1, 1,
0.0374263, -0.1347654, 2.941314, 0, 0, 0, 1, 1,
0.04182197, -1.018664, 0.7229442, 0, 0, 0, 1, 1,
0.04672317, 1.079773, -0.1361199, 0, 0, 0, 1, 1,
0.04951607, 0.2688932, 0.008823121, 0, 0, 0, 1, 1,
0.04969361, 0.3307801, 0.3428039, 0, 0, 0, 1, 1,
0.06073732, 0.04286638, 2.470742, 1, 1, 1, 1, 1,
0.0641077, 0.09400742, 0.7559875, 1, 1, 1, 1, 1,
0.06768309, 1.274381, -2.085438, 1, 1, 1, 1, 1,
0.06914444, 1.278152, -0.9433094, 1, 1, 1, 1, 1,
0.07167178, 0.3361123, -0.3192172, 1, 1, 1, 1, 1,
0.07250839, -0.5975962, 2.662359, 1, 1, 1, 1, 1,
0.07310469, -0.720427, 3.80882, 1, 1, 1, 1, 1,
0.07354452, 0.1371066, -1.085247, 1, 1, 1, 1, 1,
0.07406504, -0.1157977, 0.4135693, 1, 1, 1, 1, 1,
0.08192564, -0.8867267, 2.446703, 1, 1, 1, 1, 1,
0.0875195, -0.3227369, 2.907005, 1, 1, 1, 1, 1,
0.09027552, 0.5350483, 0.05607707, 1, 1, 1, 1, 1,
0.09249423, 1.139409, 1.431894, 1, 1, 1, 1, 1,
0.09817471, 1.360225, 2.139758, 1, 1, 1, 1, 1,
0.0984083, 2.221662, 1.911405, 1, 1, 1, 1, 1,
0.1002615, 0.0461875, 1.814926, 0, 0, 1, 1, 1,
0.1008363, 1.19208, 0.612376, 1, 0, 0, 1, 1,
0.1078719, 0.06247995, 0.7787732, 1, 0, 0, 1, 1,
0.1109942, 0.7917226, 0.9242916, 1, 0, 0, 1, 1,
0.1118198, 1.696376, -0.5831622, 1, 0, 0, 1, 1,
0.1131876, -1.040137, 0.6004362, 1, 0, 0, 1, 1,
0.1138691, -0.386727, 2.482119, 0, 0, 0, 1, 1,
0.1165657, 1.055203, 0.3389378, 0, 0, 0, 1, 1,
0.1169098, 0.166462, 0.2098464, 0, 0, 0, 1, 1,
0.1203943, -2.492869, 3.403631, 0, 0, 0, 1, 1,
0.1205962, 0.3725663, -0.5801592, 0, 0, 0, 1, 1,
0.1242811, -0.2064207, 2.616976, 0, 0, 0, 1, 1,
0.1256698, -0.9950281, 3.735114, 0, 0, 0, 1, 1,
0.1269448, 0.1396541, 1.209749, 1, 1, 1, 1, 1,
0.1285697, 0.256041, 1.246148, 1, 1, 1, 1, 1,
0.1293595, 0.2389615, 0.5505393, 1, 1, 1, 1, 1,
0.1295972, 0.1528192, 0.7424445, 1, 1, 1, 1, 1,
0.1297811, -1.11687, 3.092919, 1, 1, 1, 1, 1,
0.1311179, 0.7217634, 0.3225564, 1, 1, 1, 1, 1,
0.1360503, -0.4745652, 4.132846, 1, 1, 1, 1, 1,
0.1370719, 0.5882807, 1.394558, 1, 1, 1, 1, 1,
0.1406823, -1.311476, 2.933356, 1, 1, 1, 1, 1,
0.1470914, -1.068381, 2.122842, 1, 1, 1, 1, 1,
0.1474553, -0.4395141, 1.191505, 1, 1, 1, 1, 1,
0.1503277, 0.2016965, 1.604452, 1, 1, 1, 1, 1,
0.1518346, -0.9220406, 2.547391, 1, 1, 1, 1, 1,
0.1534516, -2.468316, 3.472116, 1, 1, 1, 1, 1,
0.154442, -0.904875, 4.517158, 1, 1, 1, 1, 1,
0.1608835, -0.1303362, 3.275923, 0, 0, 1, 1, 1,
0.1618002, -0.5854765, 5.971932, 1, 0, 0, 1, 1,
0.1634627, -0.1858379, 3.253133, 1, 0, 0, 1, 1,
0.1699776, 1.50723, -0.1292872, 1, 0, 0, 1, 1,
0.171307, 1.24146, -0.9455674, 1, 0, 0, 1, 1,
0.174523, -1.51125, 5.034368, 1, 0, 0, 1, 1,
0.17732, -1.199619, 4.836682, 0, 0, 0, 1, 1,
0.1774986, 0.3308935, 1.106796, 0, 0, 0, 1, 1,
0.1795668, -3.2233, 4.302111, 0, 0, 0, 1, 1,
0.1812349, 2.018376, -0.3985365, 0, 0, 0, 1, 1,
0.1838755, 0.778011, 2.643905, 0, 0, 0, 1, 1,
0.1844169, 1.796294, 0.2435097, 0, 0, 0, 1, 1,
0.1848925, -0.260994, 0.9952746, 0, 0, 0, 1, 1,
0.1883096, -0.6646884, 3.554427, 1, 1, 1, 1, 1,
0.1898925, 0.5886477, -1.008161, 1, 1, 1, 1, 1,
0.1918414, -1.327426, 2.760098, 1, 1, 1, 1, 1,
0.1918584, 0.06654482, 3.132603, 1, 1, 1, 1, 1,
0.1927062, -1.374671, 3.34978, 1, 1, 1, 1, 1,
0.1929836, 0.4531353, 0.5799791, 1, 1, 1, 1, 1,
0.199323, 1.066059, 0.5994564, 1, 1, 1, 1, 1,
0.1997048, 0.27619, -0.9279748, 1, 1, 1, 1, 1,
0.1997179, 0.5859999, 1.128313, 1, 1, 1, 1, 1,
0.2031047, -0.4991988, 3.304101, 1, 1, 1, 1, 1,
0.2039129, -0.7548466, 2.216968, 1, 1, 1, 1, 1,
0.2039954, -0.8256652, 3.358813, 1, 1, 1, 1, 1,
0.2055915, 1.251299, 0.5610433, 1, 1, 1, 1, 1,
0.206074, 0.647291, -0.1212197, 1, 1, 1, 1, 1,
0.2087421, -0.9044604, 2.950062, 1, 1, 1, 1, 1,
0.2095203, -0.8365108, 3.318808, 0, 0, 1, 1, 1,
0.2099944, 0.1110677, 0.2463952, 1, 0, 0, 1, 1,
0.2111961, 0.3790901, 1.668482, 1, 0, 0, 1, 1,
0.2114628, 0.0324291, 0.7678423, 1, 0, 0, 1, 1,
0.212352, -0.5546328, 3.21891, 1, 0, 0, 1, 1,
0.2128439, 0.204487, -1.910392, 1, 0, 0, 1, 1,
0.2184562, 1.015922, 0.08051986, 0, 0, 0, 1, 1,
0.2191339, 0.3849916, 1.121102, 0, 0, 0, 1, 1,
0.2209795, 0.01709889, 1.689793, 0, 0, 0, 1, 1,
0.2340412, 0.08168235, 2.658463, 0, 0, 0, 1, 1,
0.2341148, -1.375453, 4.114564, 0, 0, 0, 1, 1,
0.235909, 1.172842, 0.1394854, 0, 0, 0, 1, 1,
0.2359094, -1.134437, 4.092334, 0, 0, 0, 1, 1,
0.2363309, 0.5286792, 1.324966, 1, 1, 1, 1, 1,
0.2381423, 1.165821, 0.1306494, 1, 1, 1, 1, 1,
0.2498802, -0.1099139, 1.865383, 1, 1, 1, 1, 1,
0.2628363, -0.4139613, 2.156663, 1, 1, 1, 1, 1,
0.2629447, 1.147967, -1.182263, 1, 1, 1, 1, 1,
0.264368, -1.471119, 3.000801, 1, 1, 1, 1, 1,
0.2652457, -0.1271034, -0.3861793, 1, 1, 1, 1, 1,
0.2660551, 0.5356709, -0.8739763, 1, 1, 1, 1, 1,
0.2669826, 1.740718, -0.7197199, 1, 1, 1, 1, 1,
0.2755962, -1.725768, 4.723191, 1, 1, 1, 1, 1,
0.2776548, -0.486659, 2.712865, 1, 1, 1, 1, 1,
0.2780626, 0.5867693, -0.6561797, 1, 1, 1, 1, 1,
0.2806944, -0.7293195, 1.809002, 1, 1, 1, 1, 1,
0.2813779, -0.9725969, 2.598354, 1, 1, 1, 1, 1,
0.2838256, 2.141957, -0.9887831, 1, 1, 1, 1, 1,
0.2897318, -0.1127381, 0.4323476, 0, 0, 1, 1, 1,
0.2952664, -0.6651254, 3.177085, 1, 0, 0, 1, 1,
0.2982004, -0.8790543, 2.123893, 1, 0, 0, 1, 1,
0.2996767, 0.2983236, 1.154832, 1, 0, 0, 1, 1,
0.3017728, -0.3315832, 2.847517, 1, 0, 0, 1, 1,
0.305189, -0.01828174, 0.5547266, 1, 0, 0, 1, 1,
0.3067234, 0.5749121, 0.6733537, 0, 0, 0, 1, 1,
0.3095025, -1.604366, 3.717026, 0, 0, 0, 1, 1,
0.3127243, 0.6802652, 0.3506159, 0, 0, 0, 1, 1,
0.3186377, 0.03934914, 0.617423, 0, 0, 0, 1, 1,
0.320157, -2.006526, 4.374203, 0, 0, 0, 1, 1,
0.3202433, 1.772901, 1.214223, 0, 0, 0, 1, 1,
0.3210907, 1.007335, -0.2413132, 0, 0, 0, 1, 1,
0.321859, 0.5241773, 1.898668, 1, 1, 1, 1, 1,
0.3231861, 0.09709606, 1.632077, 1, 1, 1, 1, 1,
0.3335241, -0.1211208, -0.459159, 1, 1, 1, 1, 1,
0.3336476, 1.110082, 1.308507, 1, 1, 1, 1, 1,
0.3338639, -0.1681277, 2.583339, 1, 1, 1, 1, 1,
0.3366475, 1.164604, 1.232153, 1, 1, 1, 1, 1,
0.3477098, 0.7852058, 1.214646, 1, 1, 1, 1, 1,
0.3503397, 0.183577, 1.295393, 1, 1, 1, 1, 1,
0.3507198, 0.5717783, 0.105906, 1, 1, 1, 1, 1,
0.3537669, 0.221745, 2.35568, 1, 1, 1, 1, 1,
0.3551371, -0.8330299, 1.223861, 1, 1, 1, 1, 1,
0.3568884, -0.5414795, 1.609994, 1, 1, 1, 1, 1,
0.3586762, 2.034989, -0.1008558, 1, 1, 1, 1, 1,
0.3587493, -0.4999425, 2.587465, 1, 1, 1, 1, 1,
0.3611739, 0.1220499, -0.5504866, 1, 1, 1, 1, 1,
0.3665611, -1.505202, 3.167357, 0, 0, 1, 1, 1,
0.3706982, -0.1932266, 0.9460259, 1, 0, 0, 1, 1,
0.3749642, -1.104074, 2.573554, 1, 0, 0, 1, 1,
0.3765486, 0.5943259, -0.2184347, 1, 0, 0, 1, 1,
0.378248, -0.4739034, 2.071862, 1, 0, 0, 1, 1,
0.384614, -1.227259, 2.941446, 1, 0, 0, 1, 1,
0.3852112, 1.372476, -1.114449, 0, 0, 0, 1, 1,
0.3874469, 0.1055063, 1.429214, 0, 0, 0, 1, 1,
0.3891565, -0.852688, 1.27383, 0, 0, 0, 1, 1,
0.3900109, -0.07375548, 1.002158, 0, 0, 0, 1, 1,
0.3923609, -1.101823, 2.88704, 0, 0, 0, 1, 1,
0.3949354, -0.626366, 1.568071, 0, 0, 0, 1, 1,
0.3966395, -0.5755993, 3.039937, 0, 0, 0, 1, 1,
0.4002462, 0.03443271, 3.141002, 1, 1, 1, 1, 1,
0.4104272, -0.3825727, 3.166237, 1, 1, 1, 1, 1,
0.4111833, -0.3708325, 2.020213, 1, 1, 1, 1, 1,
0.4136362, -0.3003557, 1.525215, 1, 1, 1, 1, 1,
0.415005, -0.1144982, 2.662614, 1, 1, 1, 1, 1,
0.4161471, -0.1531567, 2.709869, 1, 1, 1, 1, 1,
0.4192761, -0.4625438, 1.604202, 1, 1, 1, 1, 1,
0.420996, -1.110364, 3.22271, 1, 1, 1, 1, 1,
0.4245594, -1.146195, 5.296634, 1, 1, 1, 1, 1,
0.4252718, 0.1737778, 1.637964, 1, 1, 1, 1, 1,
0.4271505, 0.1378068, 1.086422, 1, 1, 1, 1, 1,
0.4289317, 1.540147, 1.862501, 1, 1, 1, 1, 1,
0.4295056, -0.9649018, 2.266873, 1, 1, 1, 1, 1,
0.4319697, 1.140517, 1.489462, 1, 1, 1, 1, 1,
0.4354908, 0.1551566, 1.261521, 1, 1, 1, 1, 1,
0.43574, 0.8633527, -0.05889672, 0, 0, 1, 1, 1,
0.4366104, 0.8989979, 0.1393204, 1, 0, 0, 1, 1,
0.4393182, -1.889818, 1.967644, 1, 0, 0, 1, 1,
0.4417396, -0.6247883, 2.524758, 1, 0, 0, 1, 1,
0.4444008, -0.019442, 0.7304233, 1, 0, 0, 1, 1,
0.4460281, -0.4034461, 2.272242, 1, 0, 0, 1, 1,
0.4482019, -0.3851018, 1.802912, 0, 0, 0, 1, 1,
0.4527519, 0.08848885, 1.95921, 0, 0, 0, 1, 1,
0.4554272, 1.992796, -0.3623943, 0, 0, 0, 1, 1,
0.4567676, -0.3964901, 4.276251, 0, 0, 0, 1, 1,
0.4602409, 1.110014, -0.03100135, 0, 0, 0, 1, 1,
0.4709173, 0.7875453, 0.7111903, 0, 0, 0, 1, 1,
0.4730213, -0.03511821, 1.061606, 0, 0, 0, 1, 1,
0.4749361, -0.7383883, 2.546044, 1, 1, 1, 1, 1,
0.476588, 0.206931, 1.406271, 1, 1, 1, 1, 1,
0.4791137, 0.114083, 2.366125, 1, 1, 1, 1, 1,
0.4826583, -0.1280519, -0.1089907, 1, 1, 1, 1, 1,
0.4846967, -0.7288721, 3.782037, 1, 1, 1, 1, 1,
0.4866794, 0.5764713, 0.2129359, 1, 1, 1, 1, 1,
0.4881462, 0.2704876, 2.107242, 1, 1, 1, 1, 1,
0.4916923, 0.4847932, 2.657747, 1, 1, 1, 1, 1,
0.4917683, -1.704908, 3.037676, 1, 1, 1, 1, 1,
0.4921739, 1.213108, -1.070493, 1, 1, 1, 1, 1,
0.4944839, -0.5174116, 2.487401, 1, 1, 1, 1, 1,
0.5010492, -1.661588, 3.613248, 1, 1, 1, 1, 1,
0.5036346, -0.2080991, 2.467597, 1, 1, 1, 1, 1,
0.5042382, -0.02862481, 1.89651, 1, 1, 1, 1, 1,
0.5080611, -1.035229, 3.24746, 1, 1, 1, 1, 1,
0.5081814, 0.3829798, 1.038339, 0, 0, 1, 1, 1,
0.5127822, -1.488009, 1.889932, 1, 0, 0, 1, 1,
0.513913, 0.9640436, 0.1792055, 1, 0, 0, 1, 1,
0.5139333, 1.107632, 1.884384, 1, 0, 0, 1, 1,
0.5227139, -0.4977504, 1.959118, 1, 0, 0, 1, 1,
0.5292996, -1.049672, 2.627371, 1, 0, 0, 1, 1,
0.5306251, 0.5346581, 0.1185182, 0, 0, 0, 1, 1,
0.5335016, -0.197648, 1.526213, 0, 0, 0, 1, 1,
0.5340992, 0.03623421, 0.9341528, 0, 0, 0, 1, 1,
0.5341727, -1.419859, 3.480991, 0, 0, 0, 1, 1,
0.5352613, -0.0744863, 2.763136, 0, 0, 0, 1, 1,
0.5359117, -0.2117236, 1.894988, 0, 0, 0, 1, 1,
0.5361255, -0.7342816, 2.089997, 0, 0, 0, 1, 1,
0.5409778, 0.7389957, 0.09172777, 1, 1, 1, 1, 1,
0.545232, 0.247395, 1.003167, 1, 1, 1, 1, 1,
0.5484204, 0.9444039, 0.1878443, 1, 1, 1, 1, 1,
0.5490744, -0.3575964, 0.2708396, 1, 1, 1, 1, 1,
0.5511751, 0.6634576, 1.283865, 1, 1, 1, 1, 1,
0.55195, 0.6461682, 1.146218, 1, 1, 1, 1, 1,
0.5561818, 0.8575431, 1.154203, 1, 1, 1, 1, 1,
0.5590826, -0.3308915, 1.730468, 1, 1, 1, 1, 1,
0.5634036, -0.4685283, 3.273792, 1, 1, 1, 1, 1,
0.5637428, -0.1350381, 2.312894, 1, 1, 1, 1, 1,
0.5644222, 0.5082895, -0.3502142, 1, 1, 1, 1, 1,
0.566474, 0.9042726, 1.304916, 1, 1, 1, 1, 1,
0.5669585, 0.9827434, 0.4896016, 1, 1, 1, 1, 1,
0.5686745, 1.380038, -0.7540396, 1, 1, 1, 1, 1,
0.5827056, 1.650115, 1.647678, 1, 1, 1, 1, 1,
0.582882, -0.3730573, 2.869322, 0, 0, 1, 1, 1,
0.5833852, 0.9274831, 1.623474, 1, 0, 0, 1, 1,
0.583604, -0.1173696, -0.06201309, 1, 0, 0, 1, 1,
0.5862811, -0.8113586, 1.887889, 1, 0, 0, 1, 1,
0.5916656, -0.4238952, -0.2338975, 1, 0, 0, 1, 1,
0.5963056, 1.88582, -0.1927181, 1, 0, 0, 1, 1,
0.6049945, -0.369208, 1.288796, 0, 0, 0, 1, 1,
0.6081296, -0.2428521, 1.524367, 0, 0, 0, 1, 1,
0.6090102, -0.148484, 1.491668, 0, 0, 0, 1, 1,
0.6098268, 0.2388542, 1.366492, 0, 0, 0, 1, 1,
0.6110755, 0.2267743, 3.233312, 0, 0, 0, 1, 1,
0.6136966, -0.7298374, 2.449077, 0, 0, 0, 1, 1,
0.6145138, 1.084784, 1.14518, 0, 0, 0, 1, 1,
0.6172684, -1.637426, 1.431427, 1, 1, 1, 1, 1,
0.6209237, -0.7819376, 2.422814, 1, 1, 1, 1, 1,
0.6253595, -0.3171705, 2.500901, 1, 1, 1, 1, 1,
0.6287132, -0.7513735, 1.898108, 1, 1, 1, 1, 1,
0.6346999, 0.1186914, 1.675754, 1, 1, 1, 1, 1,
0.6352315, 0.1189278, 0.9864129, 1, 1, 1, 1, 1,
0.6378501, -0.9755669, 3.087463, 1, 1, 1, 1, 1,
0.637965, -0.4196431, -0.09811687, 1, 1, 1, 1, 1,
0.6401092, 0.7687425, 0.07671022, 1, 1, 1, 1, 1,
0.6418909, -0.6877116, 1.954568, 1, 1, 1, 1, 1,
0.6488699, 0.5141965, -0.12085, 1, 1, 1, 1, 1,
0.6527198, 0.01905515, 1.295949, 1, 1, 1, 1, 1,
0.6535254, 0.649483, 0.7391468, 1, 1, 1, 1, 1,
0.6617565, 1.034405, 2.880008, 1, 1, 1, 1, 1,
0.663784, -1.257391, 2.087607, 1, 1, 1, 1, 1,
0.6646623, 0.9667786, 0.6312556, 0, 0, 1, 1, 1,
0.6658185, 0.5425667, -0.008852475, 1, 0, 0, 1, 1,
0.6682075, 0.2852641, -0.07870159, 1, 0, 0, 1, 1,
0.67184, -1.477515, 2.841429, 1, 0, 0, 1, 1,
0.6720777, 0.3144519, 1.576609, 1, 0, 0, 1, 1,
0.6761109, -0.2497405, 1.596938, 1, 0, 0, 1, 1,
0.6766196, 0.07268491, 0.6599355, 0, 0, 0, 1, 1,
0.6812333, 0.044856, 0.8100193, 0, 0, 0, 1, 1,
0.6865305, -0.04492836, 3.212659, 0, 0, 0, 1, 1,
0.6896199, -1.294421, 2.070696, 0, 0, 0, 1, 1,
0.690205, -0.09089611, 3.365171, 0, 0, 0, 1, 1,
0.6909741, -0.3857384, 2.547469, 0, 0, 0, 1, 1,
0.6960297, -0.7915064, 2.969311, 0, 0, 0, 1, 1,
0.6982213, 1.078153, 1.49492, 1, 1, 1, 1, 1,
0.7067289, -0.7722125, 2.241123, 1, 1, 1, 1, 1,
0.7073827, -1.021231, 0.9111201, 1, 1, 1, 1, 1,
0.7080513, -0.2125534, 1.91466, 1, 1, 1, 1, 1,
0.7129999, -1.432413, 3.349306, 1, 1, 1, 1, 1,
0.7222053, 0.4257492, 1.985302, 1, 1, 1, 1, 1,
0.7289234, 1.421762, 0.5185986, 1, 1, 1, 1, 1,
0.7293696, 0.4093541, 0.8973489, 1, 1, 1, 1, 1,
0.730598, -2.446792, 3.354884, 1, 1, 1, 1, 1,
0.7374197, -1.594923, 3.495021, 1, 1, 1, 1, 1,
0.7381412, 0.2084155, 1.055252, 1, 1, 1, 1, 1,
0.7390407, 0.578176, 1.013835, 1, 1, 1, 1, 1,
0.7434301, 0.683129, -0.767042, 1, 1, 1, 1, 1,
0.7450032, 1.687956, -1.3323, 1, 1, 1, 1, 1,
0.7479248, -0.8008456, 2.179992, 1, 1, 1, 1, 1,
0.7527694, 0.5797758, 1.20336, 0, 0, 1, 1, 1,
0.7543334, 1.133523, 0.93269, 1, 0, 0, 1, 1,
0.7632613, 1.266951, 1.444454, 1, 0, 0, 1, 1,
0.7694874, -0.6512631, 3.420889, 1, 0, 0, 1, 1,
0.7703153, -0.7873312, 1.83918, 1, 0, 0, 1, 1,
0.7729055, -1.181371, 3.304143, 1, 0, 0, 1, 1,
0.7799224, 0.1381725, 0.8285255, 0, 0, 0, 1, 1,
0.7812471, -0.8699909, 1.373953, 0, 0, 0, 1, 1,
0.7845983, 1.157926, -0.4189485, 0, 0, 0, 1, 1,
0.7880332, 0.7492005, 0.1188671, 0, 0, 0, 1, 1,
0.7925696, 1.349455, -0.2167884, 0, 0, 0, 1, 1,
0.7961596, -0.2539834, 1.993018, 0, 0, 0, 1, 1,
0.7979852, 0.3865743, 1.227955, 0, 0, 0, 1, 1,
0.798263, 1.406695, 0.6044785, 1, 1, 1, 1, 1,
0.7983346, 0.8088203, 0.7960417, 1, 1, 1, 1, 1,
0.7983417, 0.1050698, 0.7550682, 1, 1, 1, 1, 1,
0.8004687, 0.4977889, -0.9781335, 1, 1, 1, 1, 1,
0.8110695, -0.3603949, 1.131563, 1, 1, 1, 1, 1,
0.8112859, 0.2627362, 1.51369, 1, 1, 1, 1, 1,
0.8113654, -0.9959954, 0.5592736, 1, 1, 1, 1, 1,
0.8160299, -1.36984, 3.271819, 1, 1, 1, 1, 1,
0.8175726, 0.7801837, 0.6624968, 1, 1, 1, 1, 1,
0.818031, -2.449817, 2.731894, 1, 1, 1, 1, 1,
0.8209072, -0.4808782, 2.446856, 1, 1, 1, 1, 1,
0.8214967, -0.1140448, 1.791809, 1, 1, 1, 1, 1,
0.8225673, 2.138901, 1.251722, 1, 1, 1, 1, 1,
0.8232557, 0.1102678, 1.427533, 1, 1, 1, 1, 1,
0.8238225, -0.1778652, 0.5335905, 1, 1, 1, 1, 1,
0.8262585, 0.2484665, 2.625259, 0, 0, 1, 1, 1,
0.8272024, 1.778169, -0.9292368, 1, 0, 0, 1, 1,
0.8282069, 1.154321, 1.486719, 1, 0, 0, 1, 1,
0.8291119, -0.5501899, 1.404345, 1, 0, 0, 1, 1,
0.8327038, -0.1918641, 1.518768, 1, 0, 0, 1, 1,
0.8463336, 1.702578, 2.389398, 1, 0, 0, 1, 1,
0.8491407, 0.6068935, 1.759888, 0, 0, 0, 1, 1,
0.8563592, -0.4510999, 2.639955, 0, 0, 0, 1, 1,
0.858251, -1.421017, 1.717517, 0, 0, 0, 1, 1,
0.8587891, -1.084131, 3.797468, 0, 0, 0, 1, 1,
0.8647398, 2.427026, 1.042806, 0, 0, 0, 1, 1,
0.8675659, 1.294908, 1.154626, 0, 0, 0, 1, 1,
0.8697295, -1.744702, 2.825631, 0, 0, 0, 1, 1,
0.87976, 0.9900952, 0.1968394, 1, 1, 1, 1, 1,
0.8834291, 0.6385563, 1.088465, 1, 1, 1, 1, 1,
0.8841674, -3.008038, 3.91637, 1, 1, 1, 1, 1,
0.8910132, -1.195434, 2.143767, 1, 1, 1, 1, 1,
0.89749, -0.7331629, 2.340086, 1, 1, 1, 1, 1,
0.8999473, 0.5787581, 3.152846, 1, 1, 1, 1, 1,
0.9024572, 1.247012, 0.4809286, 1, 1, 1, 1, 1,
0.9100434, -0.02059255, 3.928898, 1, 1, 1, 1, 1,
0.917161, 0.9115101, 0.8595171, 1, 1, 1, 1, 1,
0.9233834, 0.8518698, -0.1366075, 1, 1, 1, 1, 1,
0.9266882, 0.6072456, 1.193352, 1, 1, 1, 1, 1,
0.9275354, -1.696585, 3.794119, 1, 1, 1, 1, 1,
0.9276542, 0.4876264, 0.5504991, 1, 1, 1, 1, 1,
0.9302014, 1.693886, 2.170155, 1, 1, 1, 1, 1,
0.9388537, 0.9281166, -0.6820314, 1, 1, 1, 1, 1,
0.9394143, -0.1607746, 3.884095, 0, 0, 1, 1, 1,
0.9401296, 0.3301944, 2.673323, 1, 0, 0, 1, 1,
0.961385, 2.311138, 1.679896, 1, 0, 0, 1, 1,
0.9615044, -0.6977376, 3.065571, 1, 0, 0, 1, 1,
0.9620578, 1.455828, 3.277394, 1, 0, 0, 1, 1,
0.9760716, -0.02180146, 1.117164, 1, 0, 0, 1, 1,
0.9830782, 0.1288991, 2.202066, 0, 0, 0, 1, 1,
0.9854555, -1.432799, 3.844669, 0, 0, 0, 1, 1,
0.989468, 1.251224, 2.184685, 0, 0, 0, 1, 1,
1.002688, 1.646105, 0.8968797, 0, 0, 0, 1, 1,
1.005491, 2.011304, 0.9593991, 0, 0, 0, 1, 1,
1.018858, 0.7417257, 1.938109, 0, 0, 0, 1, 1,
1.020109, -0.03400176, 1.315347, 0, 0, 0, 1, 1,
1.021468, -2.056447, 1.122055, 1, 1, 1, 1, 1,
1.029785, 0.03569898, 2.200088, 1, 1, 1, 1, 1,
1.047728, -0.3954192, 1.785946, 1, 1, 1, 1, 1,
1.058871, -1.422857, 0.9985547, 1, 1, 1, 1, 1,
1.060403, -0.008946484, 2.334884, 1, 1, 1, 1, 1,
1.068287, 2.011138, 2.615818, 1, 1, 1, 1, 1,
1.068488, -1.606552, 1.196004, 1, 1, 1, 1, 1,
1.078167, 0.2532654, 1.455405, 1, 1, 1, 1, 1,
1.082899, 0.428498, 1.702917, 1, 1, 1, 1, 1,
1.083148, 0.5506897, 0.6819597, 1, 1, 1, 1, 1,
1.088312, -1.180417, 1.9467, 1, 1, 1, 1, 1,
1.117555, -0.4200431, 2.245781, 1, 1, 1, 1, 1,
1.121113, -0.008365414, 3.791243, 1, 1, 1, 1, 1,
1.134542, 0.5141248, 0.09423206, 1, 1, 1, 1, 1,
1.136529, -0.6779074, 2.145131, 1, 1, 1, 1, 1,
1.141907, 0.6975725, 0.868064, 0, 0, 1, 1, 1,
1.143403, 0.392712, 0.1911999, 1, 0, 0, 1, 1,
1.145912, 0.7396898, 1.343107, 1, 0, 0, 1, 1,
1.154223, 1.520887, 1.474424, 1, 0, 0, 1, 1,
1.15447, 0.5522473, 1.360274, 1, 0, 0, 1, 1,
1.158882, -0.4071533, 0.3230606, 1, 0, 0, 1, 1,
1.168365, 3.566061, -0.2977502, 0, 0, 0, 1, 1,
1.189522, 0.200123, 3.059018, 0, 0, 0, 1, 1,
1.196152, 0.8963751, -0.1999131, 0, 0, 0, 1, 1,
1.200686, 0.2794332, 1.371214, 0, 0, 0, 1, 1,
1.202788, -1.165534, 3.672743, 0, 0, 0, 1, 1,
1.218766, -0.8803428, 2.125663, 0, 0, 0, 1, 1,
1.22425, -0.3737225, 2.404367, 0, 0, 0, 1, 1,
1.229426, 1.786929, -0.4825628, 1, 1, 1, 1, 1,
1.23034, 0.4220398, 3.235397, 1, 1, 1, 1, 1,
1.234194, -1.482675, 2.449475, 1, 1, 1, 1, 1,
1.236001, -0.1047013, 1.653626, 1, 1, 1, 1, 1,
1.257036, 4.154176, 1.221725, 1, 1, 1, 1, 1,
1.26381, -1.430904, 2.590074, 1, 1, 1, 1, 1,
1.267071, 0.4980438, 2.047765, 1, 1, 1, 1, 1,
1.272006, 1.343398, 1.540583, 1, 1, 1, 1, 1,
1.275485, 1.028231, 1.382414, 1, 1, 1, 1, 1,
1.278446, -1.078436, 2.790548, 1, 1, 1, 1, 1,
1.278722, -0.9584661, 2.743782, 1, 1, 1, 1, 1,
1.311169, -1.070343, 1.559639, 1, 1, 1, 1, 1,
1.315263, 1.342549, -1.120366, 1, 1, 1, 1, 1,
1.317526, -2.922097, 1.904683, 1, 1, 1, 1, 1,
1.328897, -1.615478, 3.429924, 1, 1, 1, 1, 1,
1.334554, -1.705077, 1.944079, 0, 0, 1, 1, 1,
1.346254, -0.8106294, 3.088995, 1, 0, 0, 1, 1,
1.353208, 0.7591431, -0.419748, 1, 0, 0, 1, 1,
1.35752, -1.320519, 1.568503, 1, 0, 0, 1, 1,
1.368006, -0.5174108, 0.4560421, 1, 0, 0, 1, 1,
1.370518, 0.5592406, 0.2801141, 1, 0, 0, 1, 1,
1.371894, 1.933732, 1.588903, 0, 0, 0, 1, 1,
1.378865, -1.776462, 3.30558, 0, 0, 0, 1, 1,
1.383099, 0.3374407, 2.259177, 0, 0, 0, 1, 1,
1.385073, 0.5255154, 0.7543067, 0, 0, 0, 1, 1,
1.389491, -0.2084973, 0.6862855, 0, 0, 0, 1, 1,
1.40083, 0.1302207, 3.59274, 0, 0, 0, 1, 1,
1.405198, 0.2090925, -0.6695514, 0, 0, 0, 1, 1,
1.437572, 1.593233, 2.493297, 1, 1, 1, 1, 1,
1.448348, 0.3585835, 1.07731, 1, 1, 1, 1, 1,
1.456017, -0.809234, 2.607237, 1, 1, 1, 1, 1,
1.457157, -0.7000566, 2.174159, 1, 1, 1, 1, 1,
1.465657, 0.229888, 2.168553, 1, 1, 1, 1, 1,
1.475153, 1.7058, 0.7904817, 1, 1, 1, 1, 1,
1.477133, -0.1763699, 2.098055, 1, 1, 1, 1, 1,
1.479423, -0.5947105, 2.385391, 1, 1, 1, 1, 1,
1.481292, -1.389501, 3.360788, 1, 1, 1, 1, 1,
1.487736, 0.7933933, 0.4621901, 1, 1, 1, 1, 1,
1.49425, -0.002861234, 0.6152112, 1, 1, 1, 1, 1,
1.497574, 2.00745, 0.05076193, 1, 1, 1, 1, 1,
1.505701, -1.55995, 3.800086, 1, 1, 1, 1, 1,
1.511939, 0.03777898, 1.631404, 1, 1, 1, 1, 1,
1.512237, -0.3739836, 1.166303, 1, 1, 1, 1, 1,
1.523121, -2.383957, 4.152625, 0, 0, 1, 1, 1,
1.525573, 0.5513863, 0.9624511, 1, 0, 0, 1, 1,
1.55066, 0.2668648, 1.551368, 1, 0, 0, 1, 1,
1.559709, 2.183648, -0.5345393, 1, 0, 0, 1, 1,
1.564506, 0.9710366, 1.395847, 1, 0, 0, 1, 1,
1.576934, -0.5443791, 2.164092, 1, 0, 0, 1, 1,
1.582061, 0.8043911, 1.309924, 0, 0, 0, 1, 1,
1.59752, 1.413677, 2.47286, 0, 0, 0, 1, 1,
1.611543, 1.088225, 2.319707, 0, 0, 0, 1, 1,
1.616606, -0.1480461, 1.86729, 0, 0, 0, 1, 1,
1.617734, -1.075044, 3.548489, 0, 0, 0, 1, 1,
1.617882, 1.518522, 0.001380019, 0, 0, 0, 1, 1,
1.630237, -2.149251, 2.820342, 0, 0, 0, 1, 1,
1.637112, 0.4323418, 2.156215, 1, 1, 1, 1, 1,
1.651313, -1.365731, 2.334965, 1, 1, 1, 1, 1,
1.651847, -0.06039201, 3.106549, 1, 1, 1, 1, 1,
1.663922, 0.1460245, 1.829351, 1, 1, 1, 1, 1,
1.673995, -0.9551134, 2.723491, 1, 1, 1, 1, 1,
1.680674, 0.6340546, 0.8622917, 1, 1, 1, 1, 1,
1.689548, 0.3309104, 0.2882726, 1, 1, 1, 1, 1,
1.69518, -0.2467344, 0.9592687, 1, 1, 1, 1, 1,
1.699353, 1.119402, -1.22741, 1, 1, 1, 1, 1,
1.700741, -0.2369744, 2.029012, 1, 1, 1, 1, 1,
1.711953, -2.185032, 3.034748, 1, 1, 1, 1, 1,
1.717675, -0.4594908, 2.403182, 1, 1, 1, 1, 1,
1.720235, 0.1069904, 1.486464, 1, 1, 1, 1, 1,
1.723805, -0.7777691, 1.772605, 1, 1, 1, 1, 1,
1.723836, -0.1521122, 2.222801, 1, 1, 1, 1, 1,
1.73677, -0.05034231, 0.008280828, 0, 0, 1, 1, 1,
1.752789, 0.842669, 1.460387, 1, 0, 0, 1, 1,
1.757823, -1.105787, 2.574446, 1, 0, 0, 1, 1,
1.765682, -0.3344249, 0.7791075, 1, 0, 0, 1, 1,
1.777672, 0.0572752, 2.549191, 1, 0, 0, 1, 1,
1.777792, -0.6408765, 2.033782, 1, 0, 0, 1, 1,
1.79083, -0.9532111, 2.549254, 0, 0, 0, 1, 1,
1.817683, -0.9969971, 4.042091, 0, 0, 0, 1, 1,
1.844724, 1.791298, 1.404559, 0, 0, 0, 1, 1,
1.844786, 0.2900625, 3.093401, 0, 0, 0, 1, 1,
1.846457, -0.1754429, 2.60162, 0, 0, 0, 1, 1,
1.847773, -1.030269, 1.666672, 0, 0, 0, 1, 1,
1.861478, -1.237656, 1.908279, 0, 0, 0, 1, 1,
1.871051, -1.615443, 1.344521, 1, 1, 1, 1, 1,
1.890304, 0.02133569, 0.6626863, 1, 1, 1, 1, 1,
1.893772, 0.400854, 1.604249, 1, 1, 1, 1, 1,
1.915496, 0.7627122, 1.72864, 1, 1, 1, 1, 1,
1.925948, 0.1334547, 0.5555559, 1, 1, 1, 1, 1,
1.927629, 1.314159, 0.1297299, 1, 1, 1, 1, 1,
1.948167, -1.00438, 0.720073, 1, 1, 1, 1, 1,
1.972728, -0.04077437, 2.298326, 1, 1, 1, 1, 1,
1.984331, 0.3749326, 2.952506, 1, 1, 1, 1, 1,
2.001362, -0.3334639, 1.471269, 1, 1, 1, 1, 1,
2.034135, -0.9302473, 2.408849, 1, 1, 1, 1, 1,
2.040205, -0.0549867, 1.336855, 1, 1, 1, 1, 1,
2.045971, -2.935175, 1.800675, 1, 1, 1, 1, 1,
2.062696, -0.8734004, 2.846367, 1, 1, 1, 1, 1,
2.091342, -0.3705024, 0.6623085, 1, 1, 1, 1, 1,
2.124325, 0.3273299, 1.183985, 0, 0, 1, 1, 1,
2.14922, 0.4423363, 1.155209, 1, 0, 0, 1, 1,
2.199406, 0.7421597, 1.239364, 1, 0, 0, 1, 1,
2.201116, 2.371357, 0.7491375, 1, 0, 0, 1, 1,
2.34017, 0.2751937, 1.544051, 1, 0, 0, 1, 1,
2.375731, -0.3847471, 0.3536144, 1, 0, 0, 1, 1,
2.41993, -0.1884843, 1.926573, 0, 0, 0, 1, 1,
2.426738, -1.174337, 1.783139, 0, 0, 0, 1, 1,
2.523869, -0.39404, 1.299909, 0, 0, 0, 1, 1,
2.55018, 0.1866962, 1.193325, 0, 0, 0, 1, 1,
2.564569, 0.8840304, 0.5112619, 0, 0, 0, 1, 1,
2.580735, -0.3087734, -1.230147, 0, 0, 0, 1, 1,
2.646247, 1.622039, 1.490373, 0, 0, 0, 1, 1,
2.679525, -0.5103068, 1.112168, 1, 1, 1, 1, 1,
2.714406, 1.505522, 2.288623, 1, 1, 1, 1, 1,
2.762006, -0.1100437, -0.2658509, 1, 1, 1, 1, 1,
2.955702, 1.685296, 1.794984, 1, 1, 1, 1, 1,
2.982009, 0.3722611, 2.85536, 1, 1, 1, 1, 1,
2.988957, -0.2985701, 1.441059, 1, 1, 1, 1, 1,
3.050133, -2.853997, 1.339734, 1, 1, 1, 1, 1
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
var radius = 10.04431;
var distance = 35.28021;
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
mvMatrix.translate( -0.02481365, -0.407793, -0.2900693 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.28021);
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