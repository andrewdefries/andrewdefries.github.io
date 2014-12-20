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
-2.626471, 0.2525521, -0.006923016, 1, 0, 0, 1,
-2.605558, -0.1023199, -1.107, 1, 0.007843138, 0, 1,
-2.596748, -0.6628185, -1.46143, 1, 0.01176471, 0, 1,
-2.574971, 0.3480478, 0.03235671, 1, 0.01960784, 0, 1,
-2.572655, 0.6239029, -2.407128, 1, 0.02352941, 0, 1,
-2.496923, 0.5609766, -1.611437, 1, 0.03137255, 0, 1,
-2.462171, 0.07113234, -4.895163, 1, 0.03529412, 0, 1,
-2.453618, 0.5317525, -0.3199727, 1, 0.04313726, 0, 1,
-2.453172, 0.2706096, -2.435011, 1, 0.04705882, 0, 1,
-2.425068, -2.003483, -2.380553, 1, 0.05490196, 0, 1,
-2.414267, -0.04163999, -1.320752, 1, 0.05882353, 0, 1,
-2.391284, 0.6810713, -2.633167, 1, 0.06666667, 0, 1,
-2.376309, -0.4910516, -0.8939829, 1, 0.07058824, 0, 1,
-2.345092, -0.4734718, -0.8426484, 1, 0.07843138, 0, 1,
-2.32215, 0.4078656, 0.03341274, 1, 0.08235294, 0, 1,
-2.321948, -1.488209, -4.019247, 1, 0.09019608, 0, 1,
-2.29367, 0.7260693, -2.276389, 1, 0.09411765, 0, 1,
-2.257274, -0.1035139, -1.634603, 1, 0.1019608, 0, 1,
-2.166948, 0.06438961, -2.753568, 1, 0.1098039, 0, 1,
-2.150818, -0.8295446, -4.389195, 1, 0.1137255, 0, 1,
-2.150571, 1.455426, -1.605956, 1, 0.1215686, 0, 1,
-2.14849, 0.1716843, -0.0788719, 1, 0.1254902, 0, 1,
-2.144204, 0.06763116, -1.889373, 1, 0.1333333, 0, 1,
-2.137992, -0.2274078, -1.351682, 1, 0.1372549, 0, 1,
-2.128675, -0.1811123, -2.236661, 1, 0.145098, 0, 1,
-2.118921, 0.1773369, -0.3447914, 1, 0.1490196, 0, 1,
-2.106449, -1.997993, -0.9067032, 1, 0.1568628, 0, 1,
-2.095416, -0.04162152, -1.574746, 1, 0.1607843, 0, 1,
-2.063375, -0.1830968, -0.5820731, 1, 0.1686275, 0, 1,
-2.0445, -1.436822, -1.04514, 1, 0.172549, 0, 1,
-2.035255, 1.588737, -0.5084808, 1, 0.1803922, 0, 1,
-2.03093, -0.1963839, -2.684972, 1, 0.1843137, 0, 1,
-2.022136, 0.7499253, -1.086371, 1, 0.1921569, 0, 1,
-1.991591, -3.064949, -2.491328, 1, 0.1960784, 0, 1,
-1.988018, 0.2464681, -0.9699435, 1, 0.2039216, 0, 1,
-1.931828, -1.905833, -3.178645, 1, 0.2117647, 0, 1,
-1.919667, -0.1898375, -0.1442702, 1, 0.2156863, 0, 1,
-1.919525, -0.3320628, -2.474661, 1, 0.2235294, 0, 1,
-1.906629, 0.2231531, -2.877717, 1, 0.227451, 0, 1,
-1.899077, 0.335173, -1.151788, 1, 0.2352941, 0, 1,
-1.801957, 0.05490259, -3.074905, 1, 0.2392157, 0, 1,
-1.799305, -1.02091, -0.6990939, 1, 0.2470588, 0, 1,
-1.781762, 0.09910657, 0.4489931, 1, 0.2509804, 0, 1,
-1.769484, -0.6837075, -1.313383, 1, 0.2588235, 0, 1,
-1.768226, -0.8936679, -0.688576, 1, 0.2627451, 0, 1,
-1.763139, -0.9502252, -1.219931, 1, 0.2705882, 0, 1,
-1.755308, 0.9290174, -2.867009, 1, 0.2745098, 0, 1,
-1.746462, 0.6438358, -0.579491, 1, 0.282353, 0, 1,
-1.727553, 1.534222, -0.8006089, 1, 0.2862745, 0, 1,
-1.725841, -1.564494, -2.085641, 1, 0.2941177, 0, 1,
-1.718355, 1.711722, -1.939673, 1, 0.3019608, 0, 1,
-1.701075, -0.5802271, -2.833306, 1, 0.3058824, 0, 1,
-1.689267, -0.1485927, 1.847015, 1, 0.3137255, 0, 1,
-1.688499, 2.861384, 0.1605515, 1, 0.3176471, 0, 1,
-1.684939, -0.9293303, -1.57013, 1, 0.3254902, 0, 1,
-1.653224, -0.1101437, -1.404979, 1, 0.3294118, 0, 1,
-1.62875, -0.5163807, -0.9933515, 1, 0.3372549, 0, 1,
-1.618874, 0.2687379, 0.8022721, 1, 0.3411765, 0, 1,
-1.612984, -0.714021, -1.506998, 1, 0.3490196, 0, 1,
-1.581257, -1.258432, -1.988816, 1, 0.3529412, 0, 1,
-1.581136, -0.3593262, -2.957626, 1, 0.3607843, 0, 1,
-1.579351, -0.2989323, -2.241004, 1, 0.3647059, 0, 1,
-1.576185, -0.9526404, -2.853207, 1, 0.372549, 0, 1,
-1.574002, 1.373351, -1.385269, 1, 0.3764706, 0, 1,
-1.559013, 0.07243593, -0.3892456, 1, 0.3843137, 0, 1,
-1.526359, -0.1064065, -1.546053, 1, 0.3882353, 0, 1,
-1.514126, 0.262778, 1.3244, 1, 0.3960784, 0, 1,
-1.49788, 0.9502211, -1.29936, 1, 0.4039216, 0, 1,
-1.495417, -0.5297686, -1.715326, 1, 0.4078431, 0, 1,
-1.486362, -0.2499155, -2.864444, 1, 0.4156863, 0, 1,
-1.482193, -0.2143751, -1.640055, 1, 0.4196078, 0, 1,
-1.470917, -0.3864362, -2.0546, 1, 0.427451, 0, 1,
-1.468806, 0.1669217, -3.026407, 1, 0.4313726, 0, 1,
-1.468567, 0.62901, -0.1170431, 1, 0.4392157, 0, 1,
-1.465133, -0.4056387, -1.726608, 1, 0.4431373, 0, 1,
-1.459292, -1.206082, -3.576398, 1, 0.4509804, 0, 1,
-1.453512, 0.1112252, -1.154029, 1, 0.454902, 0, 1,
-1.452026, -0.7370116, -0.7814371, 1, 0.4627451, 0, 1,
-1.449944, 0.09478773, -1.49804, 1, 0.4666667, 0, 1,
-1.445965, -0.6887624, -0.02849709, 1, 0.4745098, 0, 1,
-1.440168, -1.432345, -2.550627, 1, 0.4784314, 0, 1,
-1.44002, 0.7311365, -0.4548342, 1, 0.4862745, 0, 1,
-1.432626, -1.073048, -2.121988, 1, 0.4901961, 0, 1,
-1.432146, 0.1079568, -1.31977, 1, 0.4980392, 0, 1,
-1.42374, -1.010083, -1.227125, 1, 0.5058824, 0, 1,
-1.416742, -0.8724651, -3.302545, 1, 0.509804, 0, 1,
-1.414141, 1.779411, 0.8302556, 1, 0.5176471, 0, 1,
-1.401319, 0.1324313, -1.456387, 1, 0.5215687, 0, 1,
-1.397911, -1.645453, -2.421469, 1, 0.5294118, 0, 1,
-1.387674, -0.5868829, -3.208825, 1, 0.5333334, 0, 1,
-1.385811, 0.9197364, -0.1600056, 1, 0.5411765, 0, 1,
-1.382638, 0.8207197, -2.359143, 1, 0.5450981, 0, 1,
-1.371703, 0.1605131, -2.252726, 1, 0.5529412, 0, 1,
-1.370853, -1.208502, -0.5151092, 1, 0.5568628, 0, 1,
-1.367954, -0.7681466, -2.209306, 1, 0.5647059, 0, 1,
-1.366445, -0.07791191, -1.675102, 1, 0.5686275, 0, 1,
-1.36455, 0.1497614, -1.471954, 1, 0.5764706, 0, 1,
-1.353873, -1.003807, -3.782842, 1, 0.5803922, 0, 1,
-1.339535, -0.8613389, -2.81117, 1, 0.5882353, 0, 1,
-1.33593, 0.6858566, -1.160666, 1, 0.5921569, 0, 1,
-1.333404, 1.213023, -1.863547, 1, 0.6, 0, 1,
-1.332733, 0.7358927, -2.058867, 1, 0.6078432, 0, 1,
-1.326657, 0.5833353, 1.514508, 1, 0.6117647, 0, 1,
-1.325896, 0.3910649, -1.13262, 1, 0.6196079, 0, 1,
-1.324592, -1.257974, -3.431071, 1, 0.6235294, 0, 1,
-1.323679, 1.615202, -1.102849, 1, 0.6313726, 0, 1,
-1.316414, -0.3152493, -1.710237, 1, 0.6352941, 0, 1,
-1.316189, 1.564644, -0.6086036, 1, 0.6431373, 0, 1,
-1.309029, 1.851916, -0.131139, 1, 0.6470588, 0, 1,
-1.308028, -0.6530457, -1.695879, 1, 0.654902, 0, 1,
-1.305615, 0.07730626, -1.249103, 1, 0.6588235, 0, 1,
-1.305173, 0.9350217, 0.01631942, 1, 0.6666667, 0, 1,
-1.299581, 0.964964, -2.030313, 1, 0.6705883, 0, 1,
-1.298563, -0.2906228, -3.299387, 1, 0.6784314, 0, 1,
-1.289898, 0.7867485, -1.382369, 1, 0.682353, 0, 1,
-1.280929, 0.1382748, -1.234595, 1, 0.6901961, 0, 1,
-1.280281, -1.380856, -1.457657, 1, 0.6941177, 0, 1,
-1.277851, -0.4102681, -2.337352, 1, 0.7019608, 0, 1,
-1.263528, 0.8264651, -1.370213, 1, 0.7098039, 0, 1,
-1.259887, -1.289142, -2.472034, 1, 0.7137255, 0, 1,
-1.251424, 0.7591773, -1.442147, 1, 0.7215686, 0, 1,
-1.24924, 0.8941016, -0.2406182, 1, 0.7254902, 0, 1,
-1.244206, -0.5124782, -3.165591, 1, 0.7333333, 0, 1,
-1.240391, 0.1846958, -2.558692, 1, 0.7372549, 0, 1,
-1.226936, -1.205224, -2.793691, 1, 0.7450981, 0, 1,
-1.225819, -0.1087087, -1.847425, 1, 0.7490196, 0, 1,
-1.212293, -1.191464, -1.303527, 1, 0.7568628, 0, 1,
-1.210638, -0.1779221, -1.960499, 1, 0.7607843, 0, 1,
-1.21, -0.1824089, 0.1302868, 1, 0.7686275, 0, 1,
-1.205427, 1.113487, -0.2293492, 1, 0.772549, 0, 1,
-1.203112, -1.637942, -2.648255, 1, 0.7803922, 0, 1,
-1.198317, -0.2250844, -2.284528, 1, 0.7843137, 0, 1,
-1.197425, -0.2115448, -2.050919, 1, 0.7921569, 0, 1,
-1.196778, 0.08907218, -1.433501, 1, 0.7960784, 0, 1,
-1.193932, 0.2639827, -0.247243, 1, 0.8039216, 0, 1,
-1.193018, 0.3092232, -1.785302, 1, 0.8117647, 0, 1,
-1.181209, 0.4474711, -1.419298, 1, 0.8156863, 0, 1,
-1.179345, 1.700565, -0.9276001, 1, 0.8235294, 0, 1,
-1.178055, -0.8929893, 0.1123484, 1, 0.827451, 0, 1,
-1.177151, 0.939467, -2.736617, 1, 0.8352941, 0, 1,
-1.159275, -0.04603019, -0.8131655, 1, 0.8392157, 0, 1,
-1.154417, 1.039038, 0.1804339, 1, 0.8470588, 0, 1,
-1.152228, -1.603996, -1.597902, 1, 0.8509804, 0, 1,
-1.151909, 0.5052558, -1.642769, 1, 0.8588235, 0, 1,
-1.15113, 0.2792789, -1.2619, 1, 0.8627451, 0, 1,
-1.150151, 0.02430101, -1.735261, 1, 0.8705882, 0, 1,
-1.149089, 0.3915415, -1.897267, 1, 0.8745098, 0, 1,
-1.140122, -0.5652283, -1.750465, 1, 0.8823529, 0, 1,
-1.132959, -1.679014, -3.063214, 1, 0.8862745, 0, 1,
-1.127499, -0.1518127, -2.071769, 1, 0.8941177, 0, 1,
-1.121847, -0.258615, -0.5905487, 1, 0.8980392, 0, 1,
-1.114982, 0.5183188, -1.571991, 1, 0.9058824, 0, 1,
-1.11169, -0.6271616, -0.9051409, 1, 0.9137255, 0, 1,
-1.106029, 0.3588313, -3.379623, 1, 0.9176471, 0, 1,
-1.101811, 1.327512, 0.195235, 1, 0.9254902, 0, 1,
-1.100854, -0.1799724, -2.349862, 1, 0.9294118, 0, 1,
-1.099905, 0.6805107, -2.255562, 1, 0.9372549, 0, 1,
-1.094363, 0.04916953, -1.349801, 1, 0.9411765, 0, 1,
-1.070297, -0.1310577, -2.098472, 1, 0.9490196, 0, 1,
-1.070185, -2.224286, -3.511333, 1, 0.9529412, 0, 1,
-1.060749, -0.4072061, -1.573663, 1, 0.9607843, 0, 1,
-1.058469, 0.3370807, -1.181327, 1, 0.9647059, 0, 1,
-1.054883, 1.738627, -1.677789, 1, 0.972549, 0, 1,
-1.053678, -1.442789, -1.969128, 1, 0.9764706, 0, 1,
-1.035194, -0.5502148, -3.746397, 1, 0.9843137, 0, 1,
-1.034674, -1.283315, -3.298954, 1, 0.9882353, 0, 1,
-1.033638, 0.6355113, -1.282146, 1, 0.9960784, 0, 1,
-1.032704, 1.54367, -1.085659, 0.9960784, 1, 0, 1,
-1.030311, 1.097307, -0.22587, 0.9921569, 1, 0, 1,
-1.024514, -0.905047, -1.990714, 0.9843137, 1, 0, 1,
-1.016284, -2.171135, -0.4552835, 0.9803922, 1, 0, 1,
-1.009761, 0.4143098, -1.929255, 0.972549, 1, 0, 1,
-1.009281, -1.938811, -3.95252, 0.9686275, 1, 0, 1,
-1.006647, -0.4274941, -0.8694173, 0.9607843, 1, 0, 1,
-1.005108, 0.2903895, -0.2089696, 0.9568627, 1, 0, 1,
-1.004256, 0.1652911, -2.615816, 0.9490196, 1, 0, 1,
-1.002299, -0.3052295, -1.716268, 0.945098, 1, 0, 1,
-0.9984072, 0.768115, 1.242191, 0.9372549, 1, 0, 1,
-0.9952981, 2.19883, -1.024751, 0.9333333, 1, 0, 1,
-0.9950804, -0.003901219, -1.240783, 0.9254902, 1, 0, 1,
-0.9933953, 2.070074, -1.287908, 0.9215686, 1, 0, 1,
-0.9918189, 0.6401157, -1.276944, 0.9137255, 1, 0, 1,
-0.991507, -1.356587, -4.637126, 0.9098039, 1, 0, 1,
-0.9885982, -1.936767, -3.513617, 0.9019608, 1, 0, 1,
-0.9851022, -1.117041, -2.559459, 0.8941177, 1, 0, 1,
-0.9836284, -1.106873, -1.805808, 0.8901961, 1, 0, 1,
-0.9770506, 1.020365, -0.8186166, 0.8823529, 1, 0, 1,
-0.9724795, 0.5433643, -0.2556181, 0.8784314, 1, 0, 1,
-0.9695874, -0.4528112, -3.675, 0.8705882, 1, 0, 1,
-0.9693063, 1.205836, -1.196744, 0.8666667, 1, 0, 1,
-0.957469, 1.712499, -0.7159849, 0.8588235, 1, 0, 1,
-0.9528, -0.5042059, -1.927152, 0.854902, 1, 0, 1,
-0.9499891, 0.4819025, -0.3016667, 0.8470588, 1, 0, 1,
-0.9414789, 0.2212278, 0.2948471, 0.8431373, 1, 0, 1,
-0.9388762, 0.58994, 0.1636527, 0.8352941, 1, 0, 1,
-0.9356542, 0.8020218, -2.475699, 0.8313726, 1, 0, 1,
-0.9279801, -0.4153156, -1.755558, 0.8235294, 1, 0, 1,
-0.9255794, 0.5039119, 0.8694683, 0.8196079, 1, 0, 1,
-0.9193811, -0.5256753, -2.637367, 0.8117647, 1, 0, 1,
-0.9122384, -1.868198, -2.508903, 0.8078431, 1, 0, 1,
-0.9096084, 0.4102306, -0.7364655, 0.8, 1, 0, 1,
-0.9011101, -0.946624, -2.699628, 0.7921569, 1, 0, 1,
-0.8925181, 0.452194, -2.116718, 0.7882353, 1, 0, 1,
-0.8913012, 0.8772151, -1.965014, 0.7803922, 1, 0, 1,
-0.876754, -0.4538368, -2.537131, 0.7764706, 1, 0, 1,
-0.8707702, -0.8007204, -1.199989, 0.7686275, 1, 0, 1,
-0.870104, 0.1531128, -2.312214, 0.7647059, 1, 0, 1,
-0.8683116, 2.787557, 0.3299947, 0.7568628, 1, 0, 1,
-0.8681636, -2.2758, -3.10996, 0.7529412, 1, 0, 1,
-0.8581334, -2.719244, -4.330993, 0.7450981, 1, 0, 1,
-0.8498546, 0.1808198, -0.9845741, 0.7411765, 1, 0, 1,
-0.8433203, -1.37978, -0.794857, 0.7333333, 1, 0, 1,
-0.8423117, 0.8318976, -0.9222217, 0.7294118, 1, 0, 1,
-0.8400068, -0.1514085, -1.576321, 0.7215686, 1, 0, 1,
-0.8327198, -0.6344168, -2.56059, 0.7176471, 1, 0, 1,
-0.8304767, 0.1046628, 0.1169621, 0.7098039, 1, 0, 1,
-0.828308, 2.894914, -0.336126, 0.7058824, 1, 0, 1,
-0.825653, 1.173245, -2.26878, 0.6980392, 1, 0, 1,
-0.8174752, -0.4863057, -1.551375, 0.6901961, 1, 0, 1,
-0.8160228, -1.060445, -1.540748, 0.6862745, 1, 0, 1,
-0.8096255, 0.03234698, -2.329931, 0.6784314, 1, 0, 1,
-0.8080325, 1.096527, -1.324137, 0.6745098, 1, 0, 1,
-0.8024993, 0.6769503, -0.8612569, 0.6666667, 1, 0, 1,
-0.801912, -0.03972329, -0.302368, 0.6627451, 1, 0, 1,
-0.7977525, 1.435032, -0.1831757, 0.654902, 1, 0, 1,
-0.7960757, 0.4706171, 1.392313, 0.6509804, 1, 0, 1,
-0.7946779, -1.027327, -2.982111, 0.6431373, 1, 0, 1,
-0.793864, 1.083623, 0.7435979, 0.6392157, 1, 0, 1,
-0.7877647, 0.7922319, -1.341806, 0.6313726, 1, 0, 1,
-0.7805485, 1.693025, 0.1897789, 0.627451, 1, 0, 1,
-0.7767128, 0.07939854, -1.805088, 0.6196079, 1, 0, 1,
-0.7750149, -0.7574054, -2.399244, 0.6156863, 1, 0, 1,
-0.7729601, 2.590832, -1.62355, 0.6078432, 1, 0, 1,
-0.7715324, 0.4091355, -0.9510844, 0.6039216, 1, 0, 1,
-0.7680264, -0.1647994, -3.029729, 0.5960785, 1, 0, 1,
-0.7639993, -0.7766573, -4.197076, 0.5882353, 1, 0, 1,
-0.7556757, -1.342062, -3.134509, 0.5843138, 1, 0, 1,
-0.7551723, 2.19208, -1.356157, 0.5764706, 1, 0, 1,
-0.754988, 0.5826178, 0.4066489, 0.572549, 1, 0, 1,
-0.7545143, 0.1389649, -2.541549, 0.5647059, 1, 0, 1,
-0.7544947, -0.66368, -1.080368, 0.5607843, 1, 0, 1,
-0.7503398, -0.04467945, -2.511292, 0.5529412, 1, 0, 1,
-0.7474075, 2.496911, 0.6486528, 0.5490196, 1, 0, 1,
-0.7376404, 0.9473368, -1.660246, 0.5411765, 1, 0, 1,
-0.7353314, -0.1727187, -2.561212, 0.5372549, 1, 0, 1,
-0.7330956, 0.2078734, -2.096159, 0.5294118, 1, 0, 1,
-0.7283235, 0.4248797, -1.08184, 0.5254902, 1, 0, 1,
-0.7276884, 1.514186, 0.5867823, 0.5176471, 1, 0, 1,
-0.7273591, 0.4451863, -3.273052, 0.5137255, 1, 0, 1,
-0.7261589, -0.2997937, -0.7765647, 0.5058824, 1, 0, 1,
-0.7253388, -0.2942965, -1.749491, 0.5019608, 1, 0, 1,
-0.7230502, -1.423381, -1.632726, 0.4941176, 1, 0, 1,
-0.7148814, 0.03166296, -1.168312, 0.4862745, 1, 0, 1,
-0.7133389, -0.9521317, -2.065605, 0.4823529, 1, 0, 1,
-0.7110585, -0.458359, -1.921957, 0.4745098, 1, 0, 1,
-0.708488, -0.755361, -3.457389, 0.4705882, 1, 0, 1,
-0.6956471, 1.243622, 0.2090061, 0.4627451, 1, 0, 1,
-0.6939584, -0.5341729, 0.4222685, 0.4588235, 1, 0, 1,
-0.6937957, -0.4842405, -1.318441, 0.4509804, 1, 0, 1,
-0.6924842, -2.046982, -3.779045, 0.4470588, 1, 0, 1,
-0.6924701, -0.1483026, -0.05189988, 0.4392157, 1, 0, 1,
-0.6777033, -0.1436965, -2.442563, 0.4352941, 1, 0, 1,
-0.6775188, 1.521968, -0.1599703, 0.427451, 1, 0, 1,
-0.6731021, -0.1372574, -1.428496, 0.4235294, 1, 0, 1,
-0.6729374, 0.95609, -0.5175972, 0.4156863, 1, 0, 1,
-0.6727294, 0.4142364, -1.542956, 0.4117647, 1, 0, 1,
-0.6706775, -0.9770418, 0.8335292, 0.4039216, 1, 0, 1,
-0.6702023, -0.854219, -3.193422, 0.3960784, 1, 0, 1,
-0.66948, -0.9008936, -3.05204, 0.3921569, 1, 0, 1,
-0.6630944, -0.5624513, -3.824236, 0.3843137, 1, 0, 1,
-0.6571897, 1.36102, 1.012321, 0.3803922, 1, 0, 1,
-0.6554255, 1.29493, -0.6956408, 0.372549, 1, 0, 1,
-0.645779, 2.453002, -1.929786, 0.3686275, 1, 0, 1,
-0.6443434, 0.6044167, -0.4695938, 0.3607843, 1, 0, 1,
-0.6396996, 0.1830708, -2.830735, 0.3568628, 1, 0, 1,
-0.6378965, 0.7363907, -1.145521, 0.3490196, 1, 0, 1,
-0.6364777, 0.08096915, -2.620828, 0.345098, 1, 0, 1,
-0.6355296, -1.73709, -2.779534, 0.3372549, 1, 0, 1,
-0.6308381, 1.82667, 0.210695, 0.3333333, 1, 0, 1,
-0.6286029, -0.3502778, -3.097573, 0.3254902, 1, 0, 1,
-0.6284906, -0.9849995, -3.372361, 0.3215686, 1, 0, 1,
-0.6236705, 0.8715597, -0.714611, 0.3137255, 1, 0, 1,
-0.6204445, -1.531904, -4.075142, 0.3098039, 1, 0, 1,
-0.6182287, 0.4381817, -0.6571939, 0.3019608, 1, 0, 1,
-0.6109348, 0.6529377, -1.144941, 0.2941177, 1, 0, 1,
-0.6107334, 1.075658, -1.31919, 0.2901961, 1, 0, 1,
-0.6101032, -0.6325169, -3.36544, 0.282353, 1, 0, 1,
-0.6072373, -0.1972447, 0.7710511, 0.2784314, 1, 0, 1,
-0.6005863, 0.02248986, -1.779527, 0.2705882, 1, 0, 1,
-0.5986107, -1.112193, -2.489095, 0.2666667, 1, 0, 1,
-0.5936795, -0.5044242, -2.303538, 0.2588235, 1, 0, 1,
-0.5932521, -0.3071927, -3.023642, 0.254902, 1, 0, 1,
-0.5930548, -0.2913873, -2.442424, 0.2470588, 1, 0, 1,
-0.5925549, -0.6606954, -2.430914, 0.2431373, 1, 0, 1,
-0.5917839, 1.104874, -0.7600889, 0.2352941, 1, 0, 1,
-0.5821103, -0.4514681, -3.97271, 0.2313726, 1, 0, 1,
-0.5813102, -0.5275841, -4.651895, 0.2235294, 1, 0, 1,
-0.5742443, 0.6929209, -0.6531712, 0.2196078, 1, 0, 1,
-0.5726456, 1.705093, -1.587692, 0.2117647, 1, 0, 1,
-0.5695614, -0.355511, -2.14575, 0.2078431, 1, 0, 1,
-0.5691539, -1.079208, -2.181668, 0.2, 1, 0, 1,
-0.5666002, 0.3303147, -1.027631, 0.1921569, 1, 0, 1,
-0.5665985, 1.651573, -0.3551236, 0.1882353, 1, 0, 1,
-0.5653251, 2.0188, -0.2320376, 0.1803922, 1, 0, 1,
-0.5636436, 0.0698435, -1.536424, 0.1764706, 1, 0, 1,
-0.5611703, 0.8575776, -0.5206419, 0.1686275, 1, 0, 1,
-0.5608533, -2.142096, -3.277266, 0.1647059, 1, 0, 1,
-0.5605637, 0.673114, -0.693404, 0.1568628, 1, 0, 1,
-0.5591853, 0.2874817, -1.552111, 0.1529412, 1, 0, 1,
-0.5427956, -0.7064565, -1.520488, 0.145098, 1, 0, 1,
-0.5423099, -0.7600253, -1.654881, 0.1411765, 1, 0, 1,
-0.5405212, 0.4473676, -0.8286055, 0.1333333, 1, 0, 1,
-0.5403386, -0.4345975, -2.463591, 0.1294118, 1, 0, 1,
-0.5401086, 0.2770656, -1.935641, 0.1215686, 1, 0, 1,
-0.5391468, 1.709288, 0.4052093, 0.1176471, 1, 0, 1,
-0.5378307, -1.272642, -3.600994, 0.1098039, 1, 0, 1,
-0.5357085, 1.491223, 0.006186135, 0.1058824, 1, 0, 1,
-0.5350047, 0.1280282, -0.7224143, 0.09803922, 1, 0, 1,
-0.5343407, 0.07626434, -2.230065, 0.09019608, 1, 0, 1,
-0.5229521, 1.638355, -0.3542527, 0.08627451, 1, 0, 1,
-0.5208461, 0.2568394, -0.5936264, 0.07843138, 1, 0, 1,
-0.5188048, 0.2305681, 0.5720292, 0.07450981, 1, 0, 1,
-0.5164313, -0.9136825, -1.075834, 0.06666667, 1, 0, 1,
-0.5152044, -0.5133291, -3.039352, 0.0627451, 1, 0, 1,
-0.5068517, -0.8449289, -4.09255, 0.05490196, 1, 0, 1,
-0.5055608, 0.03235361, -1.384243, 0.05098039, 1, 0, 1,
-0.503324, -0.4308364, -1.624961, 0.04313726, 1, 0, 1,
-0.5026285, -0.4566177, -2.62101, 0.03921569, 1, 0, 1,
-0.5022497, 0.9361778, 0.4870915, 0.03137255, 1, 0, 1,
-0.5020772, 0.7464626, -1.798741, 0.02745098, 1, 0, 1,
-0.5006742, 0.6382807, -0.1501407, 0.01960784, 1, 0, 1,
-0.5005678, -0.9754008, -2.329401, 0.01568628, 1, 0, 1,
-0.4984091, -0.995109, -4.870359, 0.007843138, 1, 0, 1,
-0.4973218, 1.220252, -1.04432, 0.003921569, 1, 0, 1,
-0.4957501, -1.931499, -2.628351, 0, 1, 0.003921569, 1,
-0.4956284, 0.7788362, 0.9360558, 0, 1, 0.01176471, 1,
-0.494601, 0.03621605, -3.08036, 0, 1, 0.01568628, 1,
-0.4923779, -0.4374241, -0.8651678, 0, 1, 0.02352941, 1,
-0.4910389, 1.113724, -1.943703, 0, 1, 0.02745098, 1,
-0.4904446, -0.9605489, -4.782862, 0, 1, 0.03529412, 1,
-0.4895367, 0.1726438, -1.527404, 0, 1, 0.03921569, 1,
-0.4886154, 1.375531, 0.05565296, 0, 1, 0.04705882, 1,
-0.4823273, 0.7935586, -0.439861, 0, 1, 0.05098039, 1,
-0.4800427, -1.579676, -3.907702, 0, 1, 0.05882353, 1,
-0.4759939, 2.586513, -0.6477871, 0, 1, 0.0627451, 1,
-0.4757117, -0.7167961, -1.540739, 0, 1, 0.07058824, 1,
-0.4751648, 1.327549, 0.05472867, 0, 1, 0.07450981, 1,
-0.4739497, 0.5974315, -0.3460926, 0, 1, 0.08235294, 1,
-0.4730912, -2.036507, -0.6357879, 0, 1, 0.08627451, 1,
-0.4713315, -0.3798072, -1.827513, 0, 1, 0.09411765, 1,
-0.4708574, 0.17198, 0.4657165, 0, 1, 0.1019608, 1,
-0.467592, 1.123496, -0.461917, 0, 1, 0.1058824, 1,
-0.4674578, 0.9027039, -0.06376477, 0, 1, 0.1137255, 1,
-0.4673175, -0.2980462, -2.866095, 0, 1, 0.1176471, 1,
-0.4627872, 1.292375, -1.238257, 0, 1, 0.1254902, 1,
-0.4562967, 0.647401, -0.7425817, 0, 1, 0.1294118, 1,
-0.4522355, 0.09253252, -4.144978, 0, 1, 0.1372549, 1,
-0.4514143, -0.9611157, -4.181617, 0, 1, 0.1411765, 1,
-0.4427414, 0.3936318, -0.884269, 0, 1, 0.1490196, 1,
-0.4392396, -1.153269, -1.360593, 0, 1, 0.1529412, 1,
-0.4333104, 0.1387371, -1.304939, 0, 1, 0.1607843, 1,
-0.4323953, 0.9453669, -1.419367, 0, 1, 0.1647059, 1,
-0.431683, 3.077701, -1.646323, 0, 1, 0.172549, 1,
-0.430813, 0.8668667, -1.190731, 0, 1, 0.1764706, 1,
-0.4248871, 0.1112886, -0.000130399, 0, 1, 0.1843137, 1,
-0.4217246, -0.8612981, -2.819151, 0, 1, 0.1882353, 1,
-0.4214136, 0.6808012, -0.9683517, 0, 1, 0.1960784, 1,
-0.420052, 0.9675699, -1.378423, 0, 1, 0.2039216, 1,
-0.4165752, -0.8172892, -2.116453, 0, 1, 0.2078431, 1,
-0.4061256, 0.4220141, -0.1491211, 0, 1, 0.2156863, 1,
-0.4026006, 0.5228524, -0.1448732, 0, 1, 0.2196078, 1,
-0.4002791, 0.9285347, -2.776235, 0, 1, 0.227451, 1,
-0.3971251, 0.247607, -0.5989071, 0, 1, 0.2313726, 1,
-0.3946608, 0.3943757, 0.247026, 0, 1, 0.2392157, 1,
-0.3935207, -0.180328, -1.092657, 0, 1, 0.2431373, 1,
-0.3882031, 0.9932489, -1.295403, 0, 1, 0.2509804, 1,
-0.3869902, 0.3664108, -1.883343, 0, 1, 0.254902, 1,
-0.3834896, 0.8384792, 0.1554277, 0, 1, 0.2627451, 1,
-0.380934, 2.515443, 0.389856, 0, 1, 0.2666667, 1,
-0.378575, 0.2794607, -1.446846, 0, 1, 0.2745098, 1,
-0.3761867, 1.719719, 0.5395721, 0, 1, 0.2784314, 1,
-0.3739219, 0.265106, -0.7016658, 0, 1, 0.2862745, 1,
-0.3671104, 0.1485149, -0.7945814, 0, 1, 0.2901961, 1,
-0.3660074, -0.6608253, -3.136845, 0, 1, 0.2980392, 1,
-0.3636104, 0.02737909, -2.840193, 0, 1, 0.3058824, 1,
-0.3623255, 1.39882, -1.082081, 0, 1, 0.3098039, 1,
-0.3614152, -0.3921188, -2.010856, 0, 1, 0.3176471, 1,
-0.3589927, -1.744701, -1.330375, 0, 1, 0.3215686, 1,
-0.3559057, -1.362463, -3.670535, 0, 1, 0.3294118, 1,
-0.3465587, -1.209053, -3.004929, 0, 1, 0.3333333, 1,
-0.3447352, 0.4707255, -0.2086343, 0, 1, 0.3411765, 1,
-0.3379239, 0.2586282, -0.04083655, 0, 1, 0.345098, 1,
-0.3377674, 0.387689, -0.9992588, 0, 1, 0.3529412, 1,
-0.3332717, 0.398487, 1.144095, 0, 1, 0.3568628, 1,
-0.3308947, 0.8269242, -0.3985185, 0, 1, 0.3647059, 1,
-0.3288139, -0.8539462, -4.130595, 0, 1, 0.3686275, 1,
-0.3244677, 1.094475, 2.078571, 0, 1, 0.3764706, 1,
-0.3242429, -1.355124, -1.868065, 0, 1, 0.3803922, 1,
-0.3225411, -0.7866927, -4.65156, 0, 1, 0.3882353, 1,
-0.3208109, -0.5747431, -4.11754, 0, 1, 0.3921569, 1,
-0.3204707, -1.085728, -2.028439, 0, 1, 0.4, 1,
-0.3195772, -0.02119401, -2.954702, 0, 1, 0.4078431, 1,
-0.3156561, 1.265188, -1.450361, 0, 1, 0.4117647, 1,
-0.3140606, 0.0475405, -1.169327, 0, 1, 0.4196078, 1,
-0.3124817, -0.5342513, -1.045137, 0, 1, 0.4235294, 1,
-0.3123718, 0.3861216, -2.098164, 0, 1, 0.4313726, 1,
-0.3082357, -0.632341, -2.775236, 0, 1, 0.4352941, 1,
-0.3082185, -0.1497233, 0.02595411, 0, 1, 0.4431373, 1,
-0.3043249, -0.6567895, -2.537275, 0, 1, 0.4470588, 1,
-0.2979145, 0.1166937, -2.352939, 0, 1, 0.454902, 1,
-0.2964823, 0.3393879, -1.649137, 0, 1, 0.4588235, 1,
-0.2884237, 0.7044109, -0.08991108, 0, 1, 0.4666667, 1,
-0.2814399, -0.4750925, -1.688141, 0, 1, 0.4705882, 1,
-0.2805434, -0.4160375, -3.258442, 0, 1, 0.4784314, 1,
-0.2787898, -0.2224665, -4.534818, 0, 1, 0.4823529, 1,
-0.267649, -0.4042498, -2.306183, 0, 1, 0.4901961, 1,
-0.2666322, -2.344609, -2.106096, 0, 1, 0.4941176, 1,
-0.2655807, -1.947549, -1.546118, 0, 1, 0.5019608, 1,
-0.2625635, -0.7151482, -2.816686, 0, 1, 0.509804, 1,
-0.2619026, 2.19004, -0.114059, 0, 1, 0.5137255, 1,
-0.2618867, -0.4240683, -2.409449, 0, 1, 0.5215687, 1,
-0.2607293, 0.1164048, -2.511266, 0, 1, 0.5254902, 1,
-0.2542213, 0.8086262, -1.146102, 0, 1, 0.5333334, 1,
-0.2533048, -0.9109014, -3.348356, 0, 1, 0.5372549, 1,
-0.2524686, 1.524232, 0.6804671, 0, 1, 0.5450981, 1,
-0.2445962, -0.9824364, -3.236756, 0, 1, 0.5490196, 1,
-0.242191, 0.3783133, -0.228624, 0, 1, 0.5568628, 1,
-0.2399368, 0.2294121, -1.863232, 0, 1, 0.5607843, 1,
-0.2388376, -1.111898, -4.102332, 0, 1, 0.5686275, 1,
-0.2376237, 0.5728047, -0.2963482, 0, 1, 0.572549, 1,
-0.2360286, 1.060336, -0.6380274, 0, 1, 0.5803922, 1,
-0.2305614, 0.243107, -1.340761, 0, 1, 0.5843138, 1,
-0.2294046, 0.2161228, -1.26411, 0, 1, 0.5921569, 1,
-0.2290867, 0.733912, -0.1000466, 0, 1, 0.5960785, 1,
-0.2262454, 1.869733, -0.06687275, 0, 1, 0.6039216, 1,
-0.2258329, -0.629825, -4.145324, 0, 1, 0.6117647, 1,
-0.2230628, -0.1638819, -1.518538, 0, 1, 0.6156863, 1,
-0.2184978, -2.47182, -3.242343, 0, 1, 0.6235294, 1,
-0.2173112, 0.3667223, -2.306201, 0, 1, 0.627451, 1,
-0.2154684, -0.9617078, -2.076853, 0, 1, 0.6352941, 1,
-0.2137257, -1.457057, -0.7589399, 0, 1, 0.6392157, 1,
-0.2115283, -1.668685, -2.379543, 0, 1, 0.6470588, 1,
-0.2034092, 0.5263535, 0.1424046, 0, 1, 0.6509804, 1,
-0.1990152, 2.250481, -0.09305601, 0, 1, 0.6588235, 1,
-0.1985443, -1.856541, -4.105739, 0, 1, 0.6627451, 1,
-0.1968363, -0.4732432, -0.7135955, 0, 1, 0.6705883, 1,
-0.1954131, 1.43902, -1.217368, 0, 1, 0.6745098, 1,
-0.1953502, -1.194479, -2.821386, 0, 1, 0.682353, 1,
-0.1950057, -0.8841728, -3.569989, 0, 1, 0.6862745, 1,
-0.1943739, -0.7356981, -4.363912, 0, 1, 0.6941177, 1,
-0.1932347, -0.4382478, -2.317215, 0, 1, 0.7019608, 1,
-0.1872029, 0.2428062, -0.5300861, 0, 1, 0.7058824, 1,
-0.1863179, -1.495094, -1.115362, 0, 1, 0.7137255, 1,
-0.1825128, -0.8650639, -1.618078, 0, 1, 0.7176471, 1,
-0.1804565, 1.75936, -0.7442002, 0, 1, 0.7254902, 1,
-0.1801468, 0.8078184, -0.6767794, 0, 1, 0.7294118, 1,
-0.1792816, 0.7414498, -0.2906292, 0, 1, 0.7372549, 1,
-0.1768741, 0.1427403, -0.05743966, 0, 1, 0.7411765, 1,
-0.1766562, -0.1882703, -1.085372, 0, 1, 0.7490196, 1,
-0.1742179, 0.8484809, 0.337496, 0, 1, 0.7529412, 1,
-0.1708025, 1.142879, -0.006639065, 0, 1, 0.7607843, 1,
-0.1618228, -1.100636, -4.357847, 0, 1, 0.7647059, 1,
-0.1615426, 0.9755304, 0.4262556, 0, 1, 0.772549, 1,
-0.1584577, -0.06486338, -4.210646, 0, 1, 0.7764706, 1,
-0.1574499, -0.873457, -1.707439, 0, 1, 0.7843137, 1,
-0.1569533, -0.3566638, -2.16537, 0, 1, 0.7882353, 1,
-0.1566072, 1.31003, -1.151888, 0, 1, 0.7960784, 1,
-0.1536992, 0.5182377, 1.119039, 0, 1, 0.8039216, 1,
-0.153535, 0.3563744, -0.2985041, 0, 1, 0.8078431, 1,
-0.1530377, -1.857705, -3.177005, 0, 1, 0.8156863, 1,
-0.152213, 0.1076948, -0.8070753, 0, 1, 0.8196079, 1,
-0.1489665, -0.6312309, -4.386849, 0, 1, 0.827451, 1,
-0.1461806, -0.9330688, -3.008203, 0, 1, 0.8313726, 1,
-0.1461524, 0.4017256, -2.268214, 0, 1, 0.8392157, 1,
-0.1426455, -0.4088736, -1.326349, 0, 1, 0.8431373, 1,
-0.1411386, 0.5439746, 0.6105856, 0, 1, 0.8509804, 1,
-0.1386404, 0.4300082, 0.4729276, 0, 1, 0.854902, 1,
-0.1381737, -0.9162376, -3.571394, 0, 1, 0.8627451, 1,
-0.1356338, 1.05709, -0.05326444, 0, 1, 0.8666667, 1,
-0.1339827, -0.9833282, -4.515857, 0, 1, 0.8745098, 1,
-0.1295695, 0.347112, -1.71585, 0, 1, 0.8784314, 1,
-0.1287272, -0.8593666, -3.18525, 0, 1, 0.8862745, 1,
-0.128344, 0.5360355, -0.4672891, 0, 1, 0.8901961, 1,
-0.1279685, 0.6391978, 0.2739149, 0, 1, 0.8980392, 1,
-0.1246738, -0.6824496, -1.8604, 0, 1, 0.9058824, 1,
-0.12316, -0.5888359, -0.3525816, 0, 1, 0.9098039, 1,
-0.1223863, 1.123332, 0.2176588, 0, 1, 0.9176471, 1,
-0.1140352, 1.992951, 1.540873, 0, 1, 0.9215686, 1,
-0.1116647, 1.768118, 0.6990148, 0, 1, 0.9294118, 1,
-0.1060999, 0.9171078, -0.2032145, 0, 1, 0.9333333, 1,
-0.1012356, 1.836709, 0.9847087, 0, 1, 0.9411765, 1,
-0.09969468, 0.331543, -2.847388, 0, 1, 0.945098, 1,
-0.09821052, 1.093928, 0.8107616, 0, 1, 0.9529412, 1,
-0.09541809, -0.4498067, -4.573537, 0, 1, 0.9568627, 1,
-0.09071665, -0.7361336, -3.474777, 0, 1, 0.9647059, 1,
-0.0866477, 1.845272, -0.840631, 0, 1, 0.9686275, 1,
-0.08546507, -0.7033563, -2.429708, 0, 1, 0.9764706, 1,
-0.08294532, -1.05276, -2.666526, 0, 1, 0.9803922, 1,
-0.0826116, 1.374424, 0.7696554, 0, 1, 0.9882353, 1,
-0.08184651, 0.7816388, 0.7490144, 0, 1, 0.9921569, 1,
-0.07773925, -0.6538548, -3.380865, 0, 1, 1, 1,
-0.07344642, -0.1641206, -3.204633, 0, 0.9921569, 1, 1,
-0.07266399, -0.6688654, -1.997202, 0, 0.9882353, 1, 1,
-0.07059077, -0.1390073, -2.5532, 0, 0.9803922, 1, 1,
-0.06964875, -0.9518454, -4.127743, 0, 0.9764706, 1, 1,
-0.06756609, -0.9718304, -1.879461, 0, 0.9686275, 1, 1,
-0.06707059, -0.2156696, -2.240953, 0, 0.9647059, 1, 1,
-0.06563758, 0.9665388, -1.691417, 0, 0.9568627, 1, 1,
-0.06543475, -0.1256488, -2.948741, 0, 0.9529412, 1, 1,
-0.0645446, -1.152604, -3.204892, 0, 0.945098, 1, 1,
-0.06367636, -0.8525962, -3.348088, 0, 0.9411765, 1, 1,
-0.06309918, 1.494302, 0.1235388, 0, 0.9333333, 1, 1,
-0.06209214, -1.272224, -3.799963, 0, 0.9294118, 1, 1,
-0.06204484, -0.1098314, -2.529768, 0, 0.9215686, 1, 1,
-0.0602859, -1.40923, -4.15281, 0, 0.9176471, 1, 1,
-0.056964, -1.518686, -3.882323, 0, 0.9098039, 1, 1,
-0.04928672, 0.03627934, -0.2039993, 0, 0.9058824, 1, 1,
-0.04650478, -1.682761, -2.084162, 0, 0.8980392, 1, 1,
-0.04442208, -0.3923816, -1.176426, 0, 0.8901961, 1, 1,
-0.04310532, 1.588238, 0.1122294, 0, 0.8862745, 1, 1,
-0.04226381, 1.076453, -1.174302, 0, 0.8784314, 1, 1,
-0.0372922, 0.2080349, 0.980472, 0, 0.8745098, 1, 1,
-0.03395453, -1.491165, -2.78253, 0, 0.8666667, 1, 1,
-0.03375578, -2.160048, -2.200915, 0, 0.8627451, 1, 1,
-0.02789945, 0.02691139, 0.6122648, 0, 0.854902, 1, 1,
-0.02194008, 1.474569, -1.37003, 0, 0.8509804, 1, 1,
-0.01724147, -0.3686619, -2.408213, 0, 0.8431373, 1, 1,
-0.01234471, -0.5908929, -3.845218, 0, 0.8392157, 1, 1,
-0.01165403, -1.012804, -3.045394, 0, 0.8313726, 1, 1,
-0.01003026, -1.21067, -1.939752, 0, 0.827451, 1, 1,
-0.00501318, 1.960102, -0.02334394, 0, 0.8196079, 1, 1,
-0.0006629892, -0.5220423, -1.939417, 0, 0.8156863, 1, 1,
-0.0001704697, 0.2824572, 1.234473, 0, 0.8078431, 1, 1,
0.00272582, 1.259879, 0.9840972, 0, 0.8039216, 1, 1,
0.004784186, 1.195966, 3.371032, 0, 0.7960784, 1, 1,
0.007710785, 0.6294256, 0.541241, 0, 0.7882353, 1, 1,
0.008924746, -0.5508495, 1.813242, 0, 0.7843137, 1, 1,
0.01085738, -0.2753487, 2.060215, 0, 0.7764706, 1, 1,
0.0184413, -1.101857, 2.862774, 0, 0.772549, 1, 1,
0.02151335, -0.7803362, 3.270346, 0, 0.7647059, 1, 1,
0.02174768, 1.462763, -0.4972702, 0, 0.7607843, 1, 1,
0.02231217, 2.224519, -0.4481645, 0, 0.7529412, 1, 1,
0.03108868, -0.729043, 2.558988, 0, 0.7490196, 1, 1,
0.03294968, 0.1157484, 0.5306621, 0, 0.7411765, 1, 1,
0.03495484, -0.8943591, 2.140694, 0, 0.7372549, 1, 1,
0.03708356, -0.4912152, 3.001191, 0, 0.7294118, 1, 1,
0.03728448, 0.01347015, 0.3400684, 0, 0.7254902, 1, 1,
0.03887841, 0.1436516, 0.7004371, 0, 0.7176471, 1, 1,
0.04631382, -1.43331, 2.441538, 0, 0.7137255, 1, 1,
0.04779774, 2.746438, -0.9210849, 0, 0.7058824, 1, 1,
0.04879788, -0.6149087, 4.281427, 0, 0.6980392, 1, 1,
0.05183995, -0.660262, 2.723838, 0, 0.6941177, 1, 1,
0.0625676, -1.34214, 2.135164, 0, 0.6862745, 1, 1,
0.062596, -1.080141, 4.204565, 0, 0.682353, 1, 1,
0.06567299, 0.5492513, 0.5866761, 0, 0.6745098, 1, 1,
0.06592285, 0.5878667, 0.748718, 0, 0.6705883, 1, 1,
0.06602802, -0.473494, 2.310393, 0, 0.6627451, 1, 1,
0.06659617, -0.006729509, 3.226211, 0, 0.6588235, 1, 1,
0.0673561, 1.74056, 0.03205005, 0, 0.6509804, 1, 1,
0.06774154, -1.6929, 2.281799, 0, 0.6470588, 1, 1,
0.06777692, 0.5280956, -0.2534793, 0, 0.6392157, 1, 1,
0.06986938, 0.6373946, 1.542123, 0, 0.6352941, 1, 1,
0.06990053, -0.3531287, 4.094871, 0, 0.627451, 1, 1,
0.07501959, -0.6243929, 3.373403, 0, 0.6235294, 1, 1,
0.07996555, -0.5628563, 3.231997, 0, 0.6156863, 1, 1,
0.08724307, 0.9898666, 1.161391, 0, 0.6117647, 1, 1,
0.09053382, 0.7705139, -0.409335, 0, 0.6039216, 1, 1,
0.09232839, 0.9127847, -0.751819, 0, 0.5960785, 1, 1,
0.09280257, 0.7892656, 0.08311977, 0, 0.5921569, 1, 1,
0.1011332, 0.1212442, 1.409707, 0, 0.5843138, 1, 1,
0.1101503, -0.261941, 3.122892, 0, 0.5803922, 1, 1,
0.1135446, 0.9140766, -0.07587332, 0, 0.572549, 1, 1,
0.1142602, -0.9119485, 1.955701, 0, 0.5686275, 1, 1,
0.1144105, 1.073747, -0.6676567, 0, 0.5607843, 1, 1,
0.1163086, 0.1012602, 3.160495, 0, 0.5568628, 1, 1,
0.1188376, -0.2932522, 2.417479, 0, 0.5490196, 1, 1,
0.1191256, -0.67541, 3.839979, 0, 0.5450981, 1, 1,
0.1241654, -0.2549343, 4.883097, 0, 0.5372549, 1, 1,
0.125207, -1.552411, 3.395, 0, 0.5333334, 1, 1,
0.1257708, -0.3060178, 2.386735, 0, 0.5254902, 1, 1,
0.1270854, 0.9333698, -0.4767726, 0, 0.5215687, 1, 1,
0.1275536, 1.15784, 0.2959405, 0, 0.5137255, 1, 1,
0.1278461, -2.039463, 2.883555, 0, 0.509804, 1, 1,
0.131514, 0.5115745, 0.4185915, 0, 0.5019608, 1, 1,
0.1318741, -0.4572023, 5.461694, 0, 0.4941176, 1, 1,
0.1365555, 0.126529, 1.471754, 0, 0.4901961, 1, 1,
0.1409449, 0.156556, 1.127772, 0, 0.4823529, 1, 1,
0.1423998, 0.003333095, 0.579769, 0, 0.4784314, 1, 1,
0.1466717, 0.1376326, 1.49674, 0, 0.4705882, 1, 1,
0.1476208, -0.9810277, 2.609894, 0, 0.4666667, 1, 1,
0.1499772, 1.162125, -0.2988802, 0, 0.4588235, 1, 1,
0.1532403, 0.1416997, 2.933437, 0, 0.454902, 1, 1,
0.1541493, 0.7090636, -1.871643, 0, 0.4470588, 1, 1,
0.1578639, 0.09099904, -1.120911, 0, 0.4431373, 1, 1,
0.1633115, -0.5765377, 3.025169, 0, 0.4352941, 1, 1,
0.1665815, -0.7751784, 4.359406, 0, 0.4313726, 1, 1,
0.1688201, -1.072328, 0.3795401, 0, 0.4235294, 1, 1,
0.1739084, 1.309879, 0.4394511, 0, 0.4196078, 1, 1,
0.1773549, -0.2013441, 1.657485, 0, 0.4117647, 1, 1,
0.1786895, 0.5609689, 1.830013, 0, 0.4078431, 1, 1,
0.179169, 0.2086692, -1.147556, 0, 0.4, 1, 1,
0.1839601, 0.1257288, -0.1023082, 0, 0.3921569, 1, 1,
0.1843136, 0.4422037, -0.6435611, 0, 0.3882353, 1, 1,
0.1883383, 0.620544, -0.4075128, 0, 0.3803922, 1, 1,
0.1889925, 0.7081146, 1.744146, 0, 0.3764706, 1, 1,
0.1912114, 0.02241241, 1.350901, 0, 0.3686275, 1, 1,
0.1975101, 2.617957, 1.163971, 0, 0.3647059, 1, 1,
0.2005443, 1.609337, 0.2155106, 0, 0.3568628, 1, 1,
0.2006581, 0.5407847, 2.901531, 0, 0.3529412, 1, 1,
0.2012958, -0.4840462, 3.655764, 0, 0.345098, 1, 1,
0.2052474, -0.9591307, 3.028024, 0, 0.3411765, 1, 1,
0.2094759, -3.11935, 3.633103, 0, 0.3333333, 1, 1,
0.2118515, -1.028646, 4.063635, 0, 0.3294118, 1, 1,
0.213151, 1.640889, -0.8901501, 0, 0.3215686, 1, 1,
0.2168647, 1.356381, 0.4433516, 0, 0.3176471, 1, 1,
0.2192472, 0.3274643, 1.946068, 0, 0.3098039, 1, 1,
0.2197159, -0.224558, 3.883572, 0, 0.3058824, 1, 1,
0.2199903, -1.031856, 3.555207, 0, 0.2980392, 1, 1,
0.2271145, 0.680512, -1.332216, 0, 0.2901961, 1, 1,
0.22714, -0.2102367, 0.7251998, 0, 0.2862745, 1, 1,
0.2286839, 1.682931, 0.719739, 0, 0.2784314, 1, 1,
0.230895, -1.787759, 2.380774, 0, 0.2745098, 1, 1,
0.2368467, -0.9479764, 0.8161186, 0, 0.2666667, 1, 1,
0.2385206, 0.97641, -0.01459701, 0, 0.2627451, 1, 1,
0.239261, 0.4325336, 1.934723, 0, 0.254902, 1, 1,
0.2439143, 0.1621756, 1.00248, 0, 0.2509804, 1, 1,
0.2471857, 1.24689, 0.2289898, 0, 0.2431373, 1, 1,
0.2525611, 0.05503224, 1.480821, 0, 0.2392157, 1, 1,
0.2527717, -0.2969909, 0.1931738, 0, 0.2313726, 1, 1,
0.2551439, 0.5563112, 0.7259095, 0, 0.227451, 1, 1,
0.2564839, -0.185963, 3.280322, 0, 0.2196078, 1, 1,
0.2604344, -0.2127313, 1.295971, 0, 0.2156863, 1, 1,
0.2637084, -0.7564126, 1.521306, 0, 0.2078431, 1, 1,
0.2745495, 1.799855, 0.5348226, 0, 0.2039216, 1, 1,
0.2809314, 0.4620901, 1.808692, 0, 0.1960784, 1, 1,
0.281306, 0.8209497, 0.7417305, 0, 0.1882353, 1, 1,
0.2814693, -1.39222, 1.977281, 0, 0.1843137, 1, 1,
0.284362, -0.4482099, 4.581095, 0, 0.1764706, 1, 1,
0.2895634, 0.4381314, -0.9398858, 0, 0.172549, 1, 1,
0.291774, -1.272023, 1.81766, 0, 0.1647059, 1, 1,
0.2924719, 0.8352922, 0.2847909, 0, 0.1607843, 1, 1,
0.2956641, -0.7963799, 2.573303, 0, 0.1529412, 1, 1,
0.2998311, 0.8881158, 1.220096, 0, 0.1490196, 1, 1,
0.3052181, -0.7946931, 3.648994, 0, 0.1411765, 1, 1,
0.3109162, 0.08631198, 2.933758, 0, 0.1372549, 1, 1,
0.3124933, 0.7930582, 0.4212406, 0, 0.1294118, 1, 1,
0.312997, 0.008537906, 1.680059, 0, 0.1254902, 1, 1,
0.3133987, 1.416247, 1.066734, 0, 0.1176471, 1, 1,
0.3144036, 1.571505, 0.2376099, 0, 0.1137255, 1, 1,
0.3157124, 0.4335597, -1.547247, 0, 0.1058824, 1, 1,
0.3178854, -1.928366, 2.034133, 0, 0.09803922, 1, 1,
0.3214194, -0.2914361, 2.478958, 0, 0.09411765, 1, 1,
0.3228229, 0.9040051, 0.05744097, 0, 0.08627451, 1, 1,
0.3240647, -0.3279808, 3.172163, 0, 0.08235294, 1, 1,
0.3246628, 0.5407998, 0.169145, 0, 0.07450981, 1, 1,
0.327339, -0.1478138, 2.660036, 0, 0.07058824, 1, 1,
0.3283504, 0.4037758, -0.5363188, 0, 0.0627451, 1, 1,
0.3292663, 1.731925, 0.3444559, 0, 0.05882353, 1, 1,
0.3292908, 1.584184, 1.063553, 0, 0.05098039, 1, 1,
0.3295696, 0.4711072, 0.2151815, 0, 0.04705882, 1, 1,
0.333284, 0.4715244, 0.6491162, 0, 0.03921569, 1, 1,
0.334404, -1.906449, 3.673368, 0, 0.03529412, 1, 1,
0.3392813, -0.2481638, 2.232343, 0, 0.02745098, 1, 1,
0.3394828, 0.7506586, 0.6980004, 0, 0.02352941, 1, 1,
0.3404053, 0.9898857, -0.1004375, 0, 0.01568628, 1, 1,
0.342637, 0.3719984, 0.5039636, 0, 0.01176471, 1, 1,
0.3447735, 1.897185, -0.07558405, 0, 0.003921569, 1, 1,
0.3563516, 1.873972, 0.1882774, 0.003921569, 0, 1, 1,
0.3565161, -1.053287, 3.258901, 0.007843138, 0, 1, 1,
0.3595499, 0.9123927, 1.161153, 0.01568628, 0, 1, 1,
0.3613385, 0.08017068, 0.3056097, 0.01960784, 0, 1, 1,
0.3633793, 0.7397994, 0.7831693, 0.02745098, 0, 1, 1,
0.3644214, -0.2480529, 2.785842, 0.03137255, 0, 1, 1,
0.364708, 0.1312485, 2.109188, 0.03921569, 0, 1, 1,
0.3673241, 0.8161374, -1.030908, 0.04313726, 0, 1, 1,
0.3682383, -1.581299, 0.9735088, 0.05098039, 0, 1, 1,
0.376872, -0.2299932, 1.767316, 0.05490196, 0, 1, 1,
0.3789612, -0.5176648, 1.80862, 0.0627451, 0, 1, 1,
0.3821682, 0.6870294, 1.004369, 0.06666667, 0, 1, 1,
0.3848457, -0.7325944, 2.277272, 0.07450981, 0, 1, 1,
0.3877033, 2.804459, -1.116228, 0.07843138, 0, 1, 1,
0.3939033, -0.07405958, 0.4677978, 0.08627451, 0, 1, 1,
0.3941414, -0.3983585, 2.54944, 0.09019608, 0, 1, 1,
0.3970629, -1.548994, 2.880955, 0.09803922, 0, 1, 1,
0.4007967, -0.05150859, 1.042035, 0.1058824, 0, 1, 1,
0.4010256, 0.9922325, -0.2941627, 0.1098039, 0, 1, 1,
0.4038618, 0.3268532, -0.1989572, 0.1176471, 0, 1, 1,
0.4044417, 0.5027614, -0.01527904, 0.1215686, 0, 1, 1,
0.4048877, 0.198732, 1.439957, 0.1294118, 0, 1, 1,
0.4063651, 0.468789, 2.056726, 0.1333333, 0, 1, 1,
0.4074871, 0.9463717, -0.2731323, 0.1411765, 0, 1, 1,
0.410068, -1.923224, 1.66236, 0.145098, 0, 1, 1,
0.4126961, 0.061201, -0.8555389, 0.1529412, 0, 1, 1,
0.4132663, -1.690702, 2.585781, 0.1568628, 0, 1, 1,
0.4134719, 0.2975095, 0.7092701, 0.1647059, 0, 1, 1,
0.4136637, 1.709146, -0.2972113, 0.1686275, 0, 1, 1,
0.4139635, -0.4778181, 3.186518, 0.1764706, 0, 1, 1,
0.414377, -0.5295147, 3.211204, 0.1803922, 0, 1, 1,
0.4212839, 2.382032, -1.439896, 0.1882353, 0, 1, 1,
0.4218988, 0.5020066, 2.902999, 0.1921569, 0, 1, 1,
0.4228691, -1.248523, 1.891057, 0.2, 0, 1, 1,
0.4271932, 1.301792, -0.4011887, 0.2078431, 0, 1, 1,
0.4280655, 1.276999, 2.694755, 0.2117647, 0, 1, 1,
0.4319884, -0.8212893, 2.602956, 0.2196078, 0, 1, 1,
0.4323164, -0.3611661, 2.403853, 0.2235294, 0, 1, 1,
0.4337921, -0.1060011, 2.447755, 0.2313726, 0, 1, 1,
0.4351853, 0.1402965, 1.715631, 0.2352941, 0, 1, 1,
0.4354596, -0.3546622, 1.925321, 0.2431373, 0, 1, 1,
0.4359697, -1.063559, 4.159033, 0.2470588, 0, 1, 1,
0.4366734, 0.5252111, 1.493736, 0.254902, 0, 1, 1,
0.4387413, 0.8775389, 1.469304, 0.2588235, 0, 1, 1,
0.4421453, 0.3696814, -0.4116091, 0.2666667, 0, 1, 1,
0.4492392, 0.9397097, -0.01212543, 0.2705882, 0, 1, 1,
0.4549807, -1.929934, 3.00329, 0.2784314, 0, 1, 1,
0.4582394, -1.601046, 4.365079, 0.282353, 0, 1, 1,
0.4621063, -0.7574157, 3.183165, 0.2901961, 0, 1, 1,
0.462942, -0.8600637, 1.394822, 0.2941177, 0, 1, 1,
0.4668632, -0.4549319, 2.96188, 0.3019608, 0, 1, 1,
0.4719818, 1.03938, -0.2686247, 0.3098039, 0, 1, 1,
0.480187, -1.42559, 2.612487, 0.3137255, 0, 1, 1,
0.4815717, 0.734103, 0.6766886, 0.3215686, 0, 1, 1,
0.4821354, 0.5761355, 1.012654, 0.3254902, 0, 1, 1,
0.4901248, 1.483911, 1.074296, 0.3333333, 0, 1, 1,
0.4908349, 0.5651803, 1.81233, 0.3372549, 0, 1, 1,
0.4983425, -0.2249859, 1.5226, 0.345098, 0, 1, 1,
0.4986308, -1.955122, 3.287454, 0.3490196, 0, 1, 1,
0.500498, -0.4075142, 1.830162, 0.3568628, 0, 1, 1,
0.5161073, -0.4029014, 1.739454, 0.3607843, 0, 1, 1,
0.5165296, 0.1289255, 0.5969176, 0.3686275, 0, 1, 1,
0.5204839, -1.04728, 2.761038, 0.372549, 0, 1, 1,
0.5280654, -0.3226007, 2.263852, 0.3803922, 0, 1, 1,
0.5293637, 0.2127114, 0.7741783, 0.3843137, 0, 1, 1,
0.5295191, -0.3977119, 2.011666, 0.3921569, 0, 1, 1,
0.5322154, 0.2961485, 0.1763372, 0.3960784, 0, 1, 1,
0.5361246, 0.4033069, 1.447042, 0.4039216, 0, 1, 1,
0.5387177, 0.3560719, 2.919179, 0.4117647, 0, 1, 1,
0.5420734, 0.08908568, 0.6823195, 0.4156863, 0, 1, 1,
0.5422281, 1.335078, 1.49332, 0.4235294, 0, 1, 1,
0.543846, -1.27036, 2.290598, 0.427451, 0, 1, 1,
0.5440416, -0.9678659, 1.177901, 0.4352941, 0, 1, 1,
0.544184, 0.6542079, 0.7172427, 0.4392157, 0, 1, 1,
0.5459824, 1.536663, 0.4831245, 0.4470588, 0, 1, 1,
0.5522171, 0.3348263, -1.45432, 0.4509804, 0, 1, 1,
0.5558721, -0.07048436, 3.417903, 0.4588235, 0, 1, 1,
0.5566679, 0.8042449, 1.069225, 0.4627451, 0, 1, 1,
0.5579486, 0.6396979, 3.282175, 0.4705882, 0, 1, 1,
0.5602847, 0.05889343, 2.320931, 0.4745098, 0, 1, 1,
0.5605739, -0.2061356, 1.974447, 0.4823529, 0, 1, 1,
0.5620139, 2.514184, 1.467416, 0.4862745, 0, 1, 1,
0.5624506, -1.292966, 1.946402, 0.4941176, 0, 1, 1,
0.5734742, -1.22733, 1.036989, 0.5019608, 0, 1, 1,
0.5736983, -0.2421157, 2.01195, 0.5058824, 0, 1, 1,
0.5746521, 0.1134261, 2.408257, 0.5137255, 0, 1, 1,
0.5797397, -1.685693, 3.548404, 0.5176471, 0, 1, 1,
0.582391, 0.97596, 0.5551318, 0.5254902, 0, 1, 1,
0.5834575, -0.2172756, 1.675329, 0.5294118, 0, 1, 1,
0.5848829, -0.7223578, 1.438164, 0.5372549, 0, 1, 1,
0.585041, 0.6766915, 1.185481, 0.5411765, 0, 1, 1,
0.5868131, 1.840183, -1.058138, 0.5490196, 0, 1, 1,
0.5962418, 0.9789372, 0.890396, 0.5529412, 0, 1, 1,
0.5976125, 0.4331977, 1.498355, 0.5607843, 0, 1, 1,
0.5982713, -0.6008248, 5.051496, 0.5647059, 0, 1, 1,
0.5990856, 0.9294055, 1.176995, 0.572549, 0, 1, 1,
0.602013, 2.037421, 0.2192806, 0.5764706, 0, 1, 1,
0.6037604, 1.029405, 2.549479, 0.5843138, 0, 1, 1,
0.6073999, 0.6344696, 0.7699638, 0.5882353, 0, 1, 1,
0.6128023, -1.259455, 2.003671, 0.5960785, 0, 1, 1,
0.6166863, 0.4632918, 2.358002, 0.6039216, 0, 1, 1,
0.6214116, 1.246989, 0.7013105, 0.6078432, 0, 1, 1,
0.6274712, -0.03354979, 1.953999, 0.6156863, 0, 1, 1,
0.6308013, 0.1655641, 0.4212609, 0.6196079, 0, 1, 1,
0.6329505, 1.492228, 1.898074, 0.627451, 0, 1, 1,
0.6338111, -1.268435, 2.106169, 0.6313726, 0, 1, 1,
0.6375834, 0.5118667, 1.697404, 0.6392157, 0, 1, 1,
0.6431155, 0.731801, 3.00963, 0.6431373, 0, 1, 1,
0.6460381, 0.82502, -0.4703164, 0.6509804, 0, 1, 1,
0.6470392, 0.7196674, 1.602176, 0.654902, 0, 1, 1,
0.6528901, 0.8304714, 1.429354, 0.6627451, 0, 1, 1,
0.6656269, 1.137069, -0.6061354, 0.6666667, 0, 1, 1,
0.6660522, 0.04369253, 2.628128, 0.6745098, 0, 1, 1,
0.6703403, -0.4483539, 1.067161, 0.6784314, 0, 1, 1,
0.6727282, -0.01173161, 3.083615, 0.6862745, 0, 1, 1,
0.6832045, -0.6471339, 2.95149, 0.6901961, 0, 1, 1,
0.6842983, -0.5353271, 3.362913, 0.6980392, 0, 1, 1,
0.6866783, -1.659884, 3.443004, 0.7058824, 0, 1, 1,
0.6884586, 1.086833, 2.661561, 0.7098039, 0, 1, 1,
0.6888247, 1.002475, -0.3738324, 0.7176471, 0, 1, 1,
0.7002461, -1.085564, 2.336379, 0.7215686, 0, 1, 1,
0.7023088, -1.584238, 3.502354, 0.7294118, 0, 1, 1,
0.7128829, -1.480424, 4.214225, 0.7333333, 0, 1, 1,
0.7131462, 0.6752988, 1.81276, 0.7411765, 0, 1, 1,
0.7158398, 0.8141375, 0.2515686, 0.7450981, 0, 1, 1,
0.7223744, 0.6759388, 2.011942, 0.7529412, 0, 1, 1,
0.7288794, 0.06287862, 1.724367, 0.7568628, 0, 1, 1,
0.7305346, -0.6798303, 2.791633, 0.7647059, 0, 1, 1,
0.7305353, -0.9024845, 2.746589, 0.7686275, 0, 1, 1,
0.7371066, 1.011981, 0.3210782, 0.7764706, 0, 1, 1,
0.7386197, 0.2429697, 2.80969, 0.7803922, 0, 1, 1,
0.7414497, -2.145484, 2.743149, 0.7882353, 0, 1, 1,
0.7431624, 0.7890011, 3.095333, 0.7921569, 0, 1, 1,
0.7440972, -0.7207776, 3.186514, 0.8, 0, 1, 1,
0.7468206, -0.8070702, 2.053689, 0.8078431, 0, 1, 1,
0.7473248, 0.6982263, 0.6615692, 0.8117647, 0, 1, 1,
0.7531772, -1.290674, 3.039004, 0.8196079, 0, 1, 1,
0.7568339, -0.8777875, 4.22225, 0.8235294, 0, 1, 1,
0.7569852, -0.3756783, 1.106063, 0.8313726, 0, 1, 1,
0.758736, -0.5715036, 3.310443, 0.8352941, 0, 1, 1,
0.7608835, 1.601061, -2.184491, 0.8431373, 0, 1, 1,
0.7735509, -0.5615374, 2.190562, 0.8470588, 0, 1, 1,
0.7770956, -0.2760754, 3.384238, 0.854902, 0, 1, 1,
0.7806481, -1.327966, 1.373486, 0.8588235, 0, 1, 1,
0.7809377, 0.3318703, 1.537749, 0.8666667, 0, 1, 1,
0.7811438, 0.6951467, 0.8584799, 0.8705882, 0, 1, 1,
0.7896477, -0.372164, 3.350599, 0.8784314, 0, 1, 1,
0.7896503, 1.208127, 0.9438248, 0.8823529, 0, 1, 1,
0.7897074, -0.04914444, 2.692195, 0.8901961, 0, 1, 1,
0.7898147, -0.1375481, 1.135128, 0.8941177, 0, 1, 1,
0.7898701, 1.391068, 1.426763, 0.9019608, 0, 1, 1,
0.7996753, -0.8397204, 2.598607, 0.9098039, 0, 1, 1,
0.801984, -0.972262, 3.182761, 0.9137255, 0, 1, 1,
0.8126437, -0.3214605, -0.1148353, 0.9215686, 0, 1, 1,
0.8148745, 0.3320337, 0.1075666, 0.9254902, 0, 1, 1,
0.81725, -0.5749232, 3.592065, 0.9333333, 0, 1, 1,
0.8197886, 0.4671215, 0.560271, 0.9372549, 0, 1, 1,
0.8226877, -0.9382513, 3.179854, 0.945098, 0, 1, 1,
0.8299243, 0.8585911, 1.969206, 0.9490196, 0, 1, 1,
0.8465122, 1.123578, 0.7300864, 0.9568627, 0, 1, 1,
0.8517009, 1.108538, 0.1282286, 0.9607843, 0, 1, 1,
0.8522475, 1.633247, -0.7075371, 0.9686275, 0, 1, 1,
0.8588552, 1.374035, 0.6483455, 0.972549, 0, 1, 1,
0.8637483, -0.4746456, 0.9813934, 0.9803922, 0, 1, 1,
0.8668667, -0.007039403, 1.458757, 0.9843137, 0, 1, 1,
0.8682898, 0.6037769, -0.1988469, 0.9921569, 0, 1, 1,
0.8713273, 0.8075397, 1.813631, 0.9960784, 0, 1, 1,
0.8753493, -0.3441436, 0.7499489, 1, 0, 0.9960784, 1,
0.8777132, 0.6829445, -0.8323607, 1, 0, 0.9882353, 1,
0.8806265, -0.6689568, 2.774624, 1, 0, 0.9843137, 1,
0.8842449, 0.4301743, 1.28771, 1, 0, 0.9764706, 1,
0.8864627, -0.2933986, 0.9565737, 1, 0, 0.972549, 1,
0.8868576, 0.4242997, 0.9697545, 1, 0, 0.9647059, 1,
0.887308, 0.4580562, 1.941889, 1, 0, 0.9607843, 1,
0.8957983, 0.01998048, 2.343825, 1, 0, 0.9529412, 1,
0.9086919, -0.2261717, 1.366974, 1, 0, 0.9490196, 1,
0.9130843, -0.9183031, 2.212217, 1, 0, 0.9411765, 1,
0.9149181, -0.447472, 1.257479, 1, 0, 0.9372549, 1,
0.9160783, -0.7742901, 2.184954, 1, 0, 0.9294118, 1,
0.9169331, -0.5255044, 3.305341, 1, 0, 0.9254902, 1,
0.9203235, 0.4003218, 0.3137228, 1, 0, 0.9176471, 1,
0.9223161, -0.6876459, 0.6357734, 1, 0, 0.9137255, 1,
0.9247318, 0.7879714, 0.8439797, 1, 0, 0.9058824, 1,
0.9259214, 1.825722, 0.6594614, 1, 0, 0.9019608, 1,
0.9404216, -0.2322396, 2.155973, 1, 0, 0.8941177, 1,
0.9419551, -0.554754, 1.448285, 1, 0, 0.8862745, 1,
0.9441996, -1.461677, 4.183553, 1, 0, 0.8823529, 1,
0.9534855, -0.5376759, 2.184929, 1, 0, 0.8745098, 1,
0.9577908, 1.24894, 0.3934084, 1, 0, 0.8705882, 1,
0.9644069, 0.3557569, 2.135122, 1, 0, 0.8627451, 1,
0.9702771, -0.1380272, 1.027162, 1, 0, 0.8588235, 1,
0.972196, 0.2406434, 3.048816, 1, 0, 0.8509804, 1,
0.9726033, 0.5107538, 0.07173523, 1, 0, 0.8470588, 1,
0.9742647, -1.481936, 1.322047, 1, 0, 0.8392157, 1,
0.9768279, -0.7559414, 1.142585, 1, 0, 0.8352941, 1,
0.9796155, -1.445951, 2.573952, 1, 0, 0.827451, 1,
0.9832471, -0.6101696, 1.918465, 1, 0, 0.8235294, 1,
0.9847283, 0.09032607, 1.063272, 1, 0, 0.8156863, 1,
0.9890204, 1.720252, -0.08706103, 1, 0, 0.8117647, 1,
0.9910883, -1.148176, 3.449025, 1, 0, 0.8039216, 1,
0.9934396, 0.3340288, 1.082201, 1, 0, 0.7960784, 1,
0.9975752, -1.207334, 2.788083, 1, 0, 0.7921569, 1,
1.00385, -0.4707861, -0.05641959, 1, 0, 0.7843137, 1,
1.004367, 0.1904869, 0.7647929, 1, 0, 0.7803922, 1,
1.02113, -0.4152761, 1.334477, 1, 0, 0.772549, 1,
1.023425, -0.9293389, 0.8181507, 1, 0, 0.7686275, 1,
1.023827, 0.6969254, 2.614333, 1, 0, 0.7607843, 1,
1.024789, 0.4664978, 0.9782594, 1, 0, 0.7568628, 1,
1.025338, -1.052762, 1.519928, 1, 0, 0.7490196, 1,
1.026676, 1.256949, 1.421701, 1, 0, 0.7450981, 1,
1.051322, -1.12895, 2.605852, 1, 0, 0.7372549, 1,
1.057575, 0.4026529, 1.558059, 1, 0, 0.7333333, 1,
1.05842, 0.3995035, 2.655733, 1, 0, 0.7254902, 1,
1.067207, -0.9024689, 2.892562, 1, 0, 0.7215686, 1,
1.067419, -1.159949, 2.530762, 1, 0, 0.7137255, 1,
1.08053, 2.076928, -0.07465903, 1, 0, 0.7098039, 1,
1.093122, 0.3438016, 1.467096, 1, 0, 0.7019608, 1,
1.093286, -0.7280706, 1.35461, 1, 0, 0.6941177, 1,
1.093638, -0.1239796, 1.828696, 1, 0, 0.6901961, 1,
1.111014, -0.3615133, 0.5540113, 1, 0, 0.682353, 1,
1.11408, -1.093213, 2.022192, 1, 0, 0.6784314, 1,
1.122365, 0.2569996, 1.031882, 1, 0, 0.6705883, 1,
1.126398, -0.4792919, 1.212687, 1, 0, 0.6666667, 1,
1.132662, 1.695371, -0.2484853, 1, 0, 0.6588235, 1,
1.163057, 1.193582, 0.4931823, 1, 0, 0.654902, 1,
1.163658, 1.079537, -0.5205487, 1, 0, 0.6470588, 1,
1.164618, 1.808431, 1.036217, 1, 0, 0.6431373, 1,
1.166524, 0.2450556, 1.923846, 1, 0, 0.6352941, 1,
1.170386, 0.2376798, 1.294061, 1, 0, 0.6313726, 1,
1.172167, -0.1261569, 3.193968, 1, 0, 0.6235294, 1,
1.173523, 0.8675861, 1.786566, 1, 0, 0.6196079, 1,
1.1754, 0.08121455, 2.482048, 1, 0, 0.6117647, 1,
1.182206, 1.027688, 2.500438, 1, 0, 0.6078432, 1,
1.188197, -0.5295327, 3.31133, 1, 0, 0.6, 1,
1.200197, -0.6386547, 2.828844, 1, 0, 0.5921569, 1,
1.206197, 0.02111453, 1.973634, 1, 0, 0.5882353, 1,
1.21431, 0.8610181, 0.6655242, 1, 0, 0.5803922, 1,
1.216678, -1.041378, 2.947507, 1, 0, 0.5764706, 1,
1.219021, 0.2288763, 2.797499, 1, 0, 0.5686275, 1,
1.227363, -0.7452366, 2.598682, 1, 0, 0.5647059, 1,
1.228505, -0.2094932, 2.943175, 1, 0, 0.5568628, 1,
1.241761, 0.6708189, 1.524288, 1, 0, 0.5529412, 1,
1.243211, 1.153338, 0.6093477, 1, 0, 0.5450981, 1,
1.243934, -0.6405707, 2.172201, 1, 0, 0.5411765, 1,
1.268094, 0.05079553, 1.136326, 1, 0, 0.5333334, 1,
1.27532, 0.2499858, 1.569679, 1, 0, 0.5294118, 1,
1.28106, 1.06163, 1.613619, 1, 0, 0.5215687, 1,
1.28594, -0.113062, 2.783068, 1, 0, 0.5176471, 1,
1.287727, 0.06488759, 1.729285, 1, 0, 0.509804, 1,
1.28938, -1.537597, 2.393059, 1, 0, 0.5058824, 1,
1.294182, 0.5487593, 1.52816, 1, 0, 0.4980392, 1,
1.306448, 0.2727428, 1.792801, 1, 0, 0.4901961, 1,
1.309292, -1.82149, 2.919574, 1, 0, 0.4862745, 1,
1.310289, 0.8236899, -0.4535481, 1, 0, 0.4784314, 1,
1.312711, 1.195656, -0.3863809, 1, 0, 0.4745098, 1,
1.320927, -2.070856, 2.627703, 1, 0, 0.4666667, 1,
1.326038, -0.4194413, 3.421863, 1, 0, 0.4627451, 1,
1.341543, 0.7561179, -1.957063, 1, 0, 0.454902, 1,
1.348876, 0.04167723, 0.9255662, 1, 0, 0.4509804, 1,
1.349039, -0.7557381, 1.404921, 1, 0, 0.4431373, 1,
1.349384, -0.3231028, 1.606167, 1, 0, 0.4392157, 1,
1.350878, 1.083948, 0.8415789, 1, 0, 0.4313726, 1,
1.352685, 0.492357, 0.999311, 1, 0, 0.427451, 1,
1.364561, -1.96416, 3.390321, 1, 0, 0.4196078, 1,
1.371947, 0.4995854, 1.132409, 1, 0, 0.4156863, 1,
1.372012, -1.180061, 3.077772, 1, 0, 0.4078431, 1,
1.375179, 0.03338167, 0.8007178, 1, 0, 0.4039216, 1,
1.384421, -0.8983307, 1.509872, 1, 0, 0.3960784, 1,
1.393005, -0.6515579, 1.216478, 1, 0, 0.3882353, 1,
1.398627, 1.157712, 2.901386, 1, 0, 0.3843137, 1,
1.405751, -0.6567964, 1.958277, 1, 0, 0.3764706, 1,
1.415755, 0.4487432, 1.522442, 1, 0, 0.372549, 1,
1.433656, 0.613336, 0.7316256, 1, 0, 0.3647059, 1,
1.458483, 1.345395, 0.06381347, 1, 0, 0.3607843, 1,
1.475717, -0.1600163, 2.707674, 1, 0, 0.3529412, 1,
1.481217, 0.6654046, 0.9044511, 1, 0, 0.3490196, 1,
1.503163, 0.6183567, 1.76808, 1, 0, 0.3411765, 1,
1.522281, 1.283443, -1.214315, 1, 0, 0.3372549, 1,
1.529546, -0.1728128, 1.477842, 1, 0, 0.3294118, 1,
1.54664, -0.2389957, 2.496103, 1, 0, 0.3254902, 1,
1.559327, 0.03036532, 2.317213, 1, 0, 0.3176471, 1,
1.571986, -1.321057, 2.480596, 1, 0, 0.3137255, 1,
1.576327, 0.7806879, -0.6977029, 1, 0, 0.3058824, 1,
1.589415, -1.313187, 2.322178, 1, 0, 0.2980392, 1,
1.590148, -0.6634079, -0.09534958, 1, 0, 0.2941177, 1,
1.595608, -0.0510268, 2.942162, 1, 0, 0.2862745, 1,
1.604554, 0.9197722, -0.08019043, 1, 0, 0.282353, 1,
1.616023, -0.2580994, 2.957542, 1, 0, 0.2745098, 1,
1.627952, -0.6995134, 1.597468, 1, 0, 0.2705882, 1,
1.631649, -0.1550418, 1.186787, 1, 0, 0.2627451, 1,
1.659986, 0.5989457, 0.7218899, 1, 0, 0.2588235, 1,
1.662772, 1.532637, 1.475771, 1, 0, 0.2509804, 1,
1.699687, -0.08975747, 2.15514, 1, 0, 0.2470588, 1,
1.704648, -1.391961, 2.304397, 1, 0, 0.2392157, 1,
1.708336, 0.6253983, 1.32614, 1, 0, 0.2352941, 1,
1.713075, 0.6287564, 1.384702, 1, 0, 0.227451, 1,
1.740279, 0.2061199, 0.5584505, 1, 0, 0.2235294, 1,
1.745843, -0.5471637, 1.463786, 1, 0, 0.2156863, 1,
1.765321, 0.9607258, 1.2667, 1, 0, 0.2117647, 1,
1.7689, 0.8054504, 1.326793, 1, 0, 0.2039216, 1,
1.786507, -3.100383, 2.197994, 1, 0, 0.1960784, 1,
1.792545, -0.3511276, 1.558548, 1, 0, 0.1921569, 1,
1.814867, -0.5265144, 2.369526, 1, 0, 0.1843137, 1,
1.835056, -0.0552713, 1.845108, 1, 0, 0.1803922, 1,
1.845496, -1.015405, 3.266741, 1, 0, 0.172549, 1,
1.868576, 0.4016865, 1.044707, 1, 0, 0.1686275, 1,
1.927311, 0.7046403, 1.007537, 1, 0, 0.1607843, 1,
1.930926, -0.9545403, 3.083084, 1, 0, 0.1568628, 1,
1.976817, 1.057801, 1.71713, 1, 0, 0.1490196, 1,
1.984913, 0.5108303, 0.718595, 1, 0, 0.145098, 1,
2.023808, 1.749195, 1.689027, 1, 0, 0.1372549, 1,
2.036377, -0.2662764, 1.41784, 1, 0, 0.1333333, 1,
2.041921, -0.5091726, 2.149818, 1, 0, 0.1254902, 1,
2.046726, 1.397966, -0.2491617, 1, 0, 0.1215686, 1,
2.068153, -1.722001, 2.072527, 1, 0, 0.1137255, 1,
2.135013, 0.8636376, 1.699789, 1, 0, 0.1098039, 1,
2.160654, 1.084787, 1.696118, 1, 0, 0.1019608, 1,
2.201611, 1.361793, 1.472434, 1, 0, 0.09411765, 1,
2.20869, -0.288686, 1.813661, 1, 0, 0.09019608, 1,
2.209244, -0.7511804, 2.314152, 1, 0, 0.08235294, 1,
2.210151, 0.216548, 3.245049, 1, 0, 0.07843138, 1,
2.24418, 0.4454473, 2.448308, 1, 0, 0.07058824, 1,
2.247316, -0.2413405, 0.7996401, 1, 0, 0.06666667, 1,
2.300071, -0.7848067, 2.186028, 1, 0, 0.05882353, 1,
2.302258, 0.4235152, 0.9144089, 1, 0, 0.05490196, 1,
2.447185, -1.439531, 2.806305, 1, 0, 0.04705882, 1,
2.457797, -0.3871717, 0.9429888, 1, 0, 0.04313726, 1,
2.507515, 0.3452288, 0.902092, 1, 0, 0.03529412, 1,
2.566439, 0.8169953, 1.827613, 1, 0, 0.03137255, 1,
2.611754, -0.6584229, 1.095345, 1, 0, 0.02352941, 1,
2.738394, 0.5752249, 2.416961, 1, 0, 0.01960784, 1,
2.965705, 0.2892436, 1.620896, 1, 0, 0.01176471, 1,
3.023451, 0.006918401, 3.06871, 1, 0, 0.007843138, 1
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
0.19849, -4.16975, -6.650651, 0, -0.5, 0.5, 0.5,
0.19849, -4.16975, -6.650651, 1, -0.5, 0.5, 0.5,
0.19849, -4.16975, -6.650651, 1, 1.5, 0.5, 0.5,
0.19849, -4.16975, -6.650651, 0, 1.5, 0.5, 0.5
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
-3.584132, -0.02082431, -6.650651, 0, -0.5, 0.5, 0.5,
-3.584132, -0.02082431, -6.650651, 1, -0.5, 0.5, 0.5,
-3.584132, -0.02082431, -6.650651, 1, 1.5, 0.5, 0.5,
-3.584132, -0.02082431, -6.650651, 0, 1.5, 0.5, 0.5
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
-3.584132, -4.16975, 0.2832656, 0, -0.5, 0.5, 0.5,
-3.584132, -4.16975, 0.2832656, 1, -0.5, 0.5, 0.5,
-3.584132, -4.16975, 0.2832656, 1, 1.5, 0.5, 0.5,
-3.584132, -4.16975, 0.2832656, 0, 1.5, 0.5, 0.5
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
-2, -3.212306, -5.050516,
3, -3.212306, -5.050516,
-2, -3.212306, -5.050516,
-2, -3.37188, -5.317205,
-1, -3.212306, -5.050516,
-1, -3.37188, -5.317205,
0, -3.212306, -5.050516,
0, -3.37188, -5.317205,
1, -3.212306, -5.050516,
1, -3.37188, -5.317205,
2, -3.212306, -5.050516,
2, -3.37188, -5.317205,
3, -3.212306, -5.050516,
3, -3.37188, -5.317205
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
-2, -3.691028, -5.850583, 0, -0.5, 0.5, 0.5,
-2, -3.691028, -5.850583, 1, -0.5, 0.5, 0.5,
-2, -3.691028, -5.850583, 1, 1.5, 0.5, 0.5,
-2, -3.691028, -5.850583, 0, 1.5, 0.5, 0.5,
-1, -3.691028, -5.850583, 0, -0.5, 0.5, 0.5,
-1, -3.691028, -5.850583, 1, -0.5, 0.5, 0.5,
-1, -3.691028, -5.850583, 1, 1.5, 0.5, 0.5,
-1, -3.691028, -5.850583, 0, 1.5, 0.5, 0.5,
0, -3.691028, -5.850583, 0, -0.5, 0.5, 0.5,
0, -3.691028, -5.850583, 1, -0.5, 0.5, 0.5,
0, -3.691028, -5.850583, 1, 1.5, 0.5, 0.5,
0, -3.691028, -5.850583, 0, 1.5, 0.5, 0.5,
1, -3.691028, -5.850583, 0, -0.5, 0.5, 0.5,
1, -3.691028, -5.850583, 1, -0.5, 0.5, 0.5,
1, -3.691028, -5.850583, 1, 1.5, 0.5, 0.5,
1, -3.691028, -5.850583, 0, 1.5, 0.5, 0.5,
2, -3.691028, -5.850583, 0, -0.5, 0.5, 0.5,
2, -3.691028, -5.850583, 1, -0.5, 0.5, 0.5,
2, -3.691028, -5.850583, 1, 1.5, 0.5, 0.5,
2, -3.691028, -5.850583, 0, 1.5, 0.5, 0.5,
3, -3.691028, -5.850583, 0, -0.5, 0.5, 0.5,
3, -3.691028, -5.850583, 1, -0.5, 0.5, 0.5,
3, -3.691028, -5.850583, 1, 1.5, 0.5, 0.5,
3, -3.691028, -5.850583, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-2.711219, -3, -5.050516,
-2.711219, 3, -5.050516,
-2.711219, -3, -5.050516,
-2.856705, -3, -5.317205,
-2.711219, -2, -5.050516,
-2.856705, -2, -5.317205,
-2.711219, -1, -5.050516,
-2.856705, -1, -5.317205,
-2.711219, 0, -5.050516,
-2.856705, 0, -5.317205,
-2.711219, 1, -5.050516,
-2.856705, 1, -5.317205,
-2.711219, 2, -5.050516,
-2.856705, 2, -5.317205,
-2.711219, 3, -5.050516,
-2.856705, 3, -5.317205
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.147676, -3, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, -3, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, -3, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, -3, -5.850583, 0, 1.5, 0.5, 0.5,
-3.147676, -2, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, -2, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, -2, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, -2, -5.850583, 0, 1.5, 0.5, 0.5,
-3.147676, -1, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, -1, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, -1, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, -1, -5.850583, 0, 1.5, 0.5, 0.5,
-3.147676, 0, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, 0, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, 0, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, 0, -5.850583, 0, 1.5, 0.5, 0.5,
-3.147676, 1, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, 1, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, 1, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, 1, -5.850583, 0, 1.5, 0.5, 0.5,
-3.147676, 2, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, 2, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, 2, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, 2, -5.850583, 0, 1.5, 0.5, 0.5,
-3.147676, 3, -5.850583, 0, -0.5, 0.5, 0.5,
-3.147676, 3, -5.850583, 1, -0.5, 0.5, 0.5,
-3.147676, 3, -5.850583, 1, 1.5, 0.5, 0.5,
-3.147676, 3, -5.850583, 0, 1.5, 0.5, 0.5
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
-2.711219, -3.212306, -4,
-2.711219, -3.212306, 4,
-2.711219, -3.212306, -4,
-2.856705, -3.37188, -4,
-2.711219, -3.212306, -2,
-2.856705, -3.37188, -2,
-2.711219, -3.212306, 0,
-2.856705, -3.37188, 0,
-2.711219, -3.212306, 2,
-2.856705, -3.37188, 2,
-2.711219, -3.212306, 4,
-2.856705, -3.37188, 4
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
-3.147676, -3.691028, -4, 0, -0.5, 0.5, 0.5,
-3.147676, -3.691028, -4, 1, -0.5, 0.5, 0.5,
-3.147676, -3.691028, -4, 1, 1.5, 0.5, 0.5,
-3.147676, -3.691028, -4, 0, 1.5, 0.5, 0.5,
-3.147676, -3.691028, -2, 0, -0.5, 0.5, 0.5,
-3.147676, -3.691028, -2, 1, -0.5, 0.5, 0.5,
-3.147676, -3.691028, -2, 1, 1.5, 0.5, 0.5,
-3.147676, -3.691028, -2, 0, 1.5, 0.5, 0.5,
-3.147676, -3.691028, 0, 0, -0.5, 0.5, 0.5,
-3.147676, -3.691028, 0, 1, -0.5, 0.5, 0.5,
-3.147676, -3.691028, 0, 1, 1.5, 0.5, 0.5,
-3.147676, -3.691028, 0, 0, 1.5, 0.5, 0.5,
-3.147676, -3.691028, 2, 0, -0.5, 0.5, 0.5,
-3.147676, -3.691028, 2, 1, -0.5, 0.5, 0.5,
-3.147676, -3.691028, 2, 1, 1.5, 0.5, 0.5,
-3.147676, -3.691028, 2, 0, 1.5, 0.5, 0.5,
-3.147676, -3.691028, 4, 0, -0.5, 0.5, 0.5,
-3.147676, -3.691028, 4, 1, -0.5, 0.5, 0.5,
-3.147676, -3.691028, 4, 1, 1.5, 0.5, 0.5,
-3.147676, -3.691028, 4, 0, 1.5, 0.5, 0.5
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
-2.711219, -3.212306, -5.050516,
-2.711219, 3.170657, -5.050516,
-2.711219, -3.212306, 5.617047,
-2.711219, 3.170657, 5.617047,
-2.711219, -3.212306, -5.050516,
-2.711219, -3.212306, 5.617047,
-2.711219, 3.170657, -5.050516,
-2.711219, 3.170657, 5.617047,
-2.711219, -3.212306, -5.050516,
3.108199, -3.212306, -5.050516,
-2.711219, -3.212306, 5.617047,
3.108199, -3.212306, 5.617047,
-2.711219, 3.170657, -5.050516,
3.108199, 3.170657, -5.050516,
-2.711219, 3.170657, 5.617047,
3.108199, 3.170657, 5.617047,
3.108199, -3.212306, -5.050516,
3.108199, 3.170657, -5.050516,
3.108199, -3.212306, 5.617047,
3.108199, 3.170657, 5.617047,
3.108199, -3.212306, -5.050516,
3.108199, -3.212306, 5.617047,
3.108199, 3.170657, -5.050516,
3.108199, 3.170657, 5.617047
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
var radius = 7.32945;
var distance = 32.60955;
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
mvMatrix.translate( -0.19849, 0.02082431, -0.2832656 );
mvMatrix.scale( 1.361776, 1.241547, 0.7428824 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.60955);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


