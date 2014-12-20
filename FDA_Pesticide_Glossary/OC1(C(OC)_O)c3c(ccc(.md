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
-2.999656, 1.097235, -2.768317, 1, 0, 0, 1,
-2.735902, 2.864513, -1.642451, 1, 0.007843138, 0, 1,
-2.662844, 0.6581393, -0.9621624, 1, 0.01176471, 0, 1,
-2.582773, 0.3630717, -1.284159, 1, 0.01960784, 0, 1,
-2.579193, 0.2109788, -1.078149, 1, 0.02352941, 0, 1,
-2.565201, -0.8995235, -0.8585567, 1, 0.03137255, 0, 1,
-2.458369, -0.2919896, -2.147567, 1, 0.03529412, 0, 1,
-2.351304, 1.235993, -0.218647, 1, 0.04313726, 0, 1,
-2.338279, 0.2578679, -1.011618, 1, 0.04705882, 0, 1,
-2.319413, 1.675685, -2.976448, 1, 0.05490196, 0, 1,
-2.2858, -0.2282759, -1.303737, 1, 0.05882353, 0, 1,
-2.261161, 0.2586132, 0.09137053, 1, 0.06666667, 0, 1,
-2.241785, 0.2238088, 0.4126035, 1, 0.07058824, 0, 1,
-2.199279, -1.362258, -2.141675, 1, 0.07843138, 0, 1,
-2.195309, -3.466754, -2.793477, 1, 0.08235294, 0, 1,
-2.145051, -0.5894856, -1.226681, 1, 0.09019608, 0, 1,
-2.139924, 0.6780581, -2.33957, 1, 0.09411765, 0, 1,
-2.118732, -1.003946, -3.342779, 1, 0.1019608, 0, 1,
-2.067087, -1.207809, -0.6524984, 1, 0.1098039, 0, 1,
-1.99217, 0.8334116, -1.572655, 1, 0.1137255, 0, 1,
-1.976564, -1.184559, -0.2176552, 1, 0.1215686, 0, 1,
-1.952088, 1.057952, 0.4642213, 1, 0.1254902, 0, 1,
-1.949318, 2.297927, -2.514615, 1, 0.1333333, 0, 1,
-1.914687, -2.247034, -2.20647, 1, 0.1372549, 0, 1,
-1.891344, -0.8306289, -1.105229, 1, 0.145098, 0, 1,
-1.877302, -0.2074967, -1.441991, 1, 0.1490196, 0, 1,
-1.84082, 0.2776559, -2.703918, 1, 0.1568628, 0, 1,
-1.834232, 0.2886408, -0.9116027, 1, 0.1607843, 0, 1,
-1.806869, -1.805861, -0.4130432, 1, 0.1686275, 0, 1,
-1.806051, -1.240277, -4.307074, 1, 0.172549, 0, 1,
-1.802723, -1.241335, -3.099782, 1, 0.1803922, 0, 1,
-1.782697, 1.083734, -1.144679, 1, 0.1843137, 0, 1,
-1.770545, -0.1690837, -1.782912, 1, 0.1921569, 0, 1,
-1.769134, 0.2469384, -2.815535, 1, 0.1960784, 0, 1,
-1.756978, -2.021984, -2.156561, 1, 0.2039216, 0, 1,
-1.752562, -1.446773, -2.283848, 1, 0.2117647, 0, 1,
-1.75157, 0.6357186, -0.579104, 1, 0.2156863, 0, 1,
-1.733732, -0.3243372, -0.5320316, 1, 0.2235294, 0, 1,
-1.715925, 1.220609, -3.105608, 1, 0.227451, 0, 1,
-1.710669, 0.009192368, -0.9136482, 1, 0.2352941, 0, 1,
-1.690791, -1.507623, -2.905832, 1, 0.2392157, 0, 1,
-1.69031, -0.009844133, -1.95946, 1, 0.2470588, 0, 1,
-1.67013, 0.4534527, -2.809398, 1, 0.2509804, 0, 1,
-1.668463, 0.4883561, 0.3779621, 1, 0.2588235, 0, 1,
-1.650273, 0.2681658, -0.8557643, 1, 0.2627451, 0, 1,
-1.648774, -0.9594936, -1.439271, 1, 0.2705882, 0, 1,
-1.647228, 0.449837, -1.104218, 1, 0.2745098, 0, 1,
-1.642196, -0.3785084, -0.4593343, 1, 0.282353, 0, 1,
-1.631656, 0.3161245, -1.279566, 1, 0.2862745, 0, 1,
-1.629719, -0.3301667, -1.943745, 1, 0.2941177, 0, 1,
-1.628976, 0.7976046, -0.8593056, 1, 0.3019608, 0, 1,
-1.620201, -1.225577, -2.468411, 1, 0.3058824, 0, 1,
-1.618947, 0.9380369, -1.071203, 1, 0.3137255, 0, 1,
-1.615439, 0.3199438, -1.779496, 1, 0.3176471, 0, 1,
-1.606935, 0.0404139, -2.203246, 1, 0.3254902, 0, 1,
-1.597384, -2.443219, -2.478552, 1, 0.3294118, 0, 1,
-1.593745, 0.3048176, -1.498984, 1, 0.3372549, 0, 1,
-1.5898, 0.6818967, -0.3976671, 1, 0.3411765, 0, 1,
-1.58173, -0.4205826, -1.418101, 1, 0.3490196, 0, 1,
-1.573315, -0.8470096, -3.40592, 1, 0.3529412, 0, 1,
-1.56957, 0.6592726, 1.192479, 1, 0.3607843, 0, 1,
-1.553873, -2.071084, -2.550819, 1, 0.3647059, 0, 1,
-1.548887, 0.5025595, 0.5479469, 1, 0.372549, 0, 1,
-1.546834, 0.613883, -1.235646, 1, 0.3764706, 0, 1,
-1.539114, -2.043854, -3.014961, 1, 0.3843137, 0, 1,
-1.532888, -1.851567, -4.095592, 1, 0.3882353, 0, 1,
-1.512508, 2.594061, -1.423838, 1, 0.3960784, 0, 1,
-1.511966, -1.61396, -1.095923, 1, 0.4039216, 0, 1,
-1.509715, -0.2673205, -0.3109222, 1, 0.4078431, 0, 1,
-1.50345, 0.3624544, -2.623382, 1, 0.4156863, 0, 1,
-1.493347, -0.2230932, -0.2800861, 1, 0.4196078, 0, 1,
-1.481191, -0.07360567, -2.364793, 1, 0.427451, 0, 1,
-1.469939, 0.4901157, -3.915256, 1, 0.4313726, 0, 1,
-1.466038, -0.8014891, -2.776386, 1, 0.4392157, 0, 1,
-1.462684, -0.9027411, -1.933853, 1, 0.4431373, 0, 1,
-1.45892, -0.1809343, -2.034626, 1, 0.4509804, 0, 1,
-1.451737, 1.664057, -1.462942, 1, 0.454902, 0, 1,
-1.449201, 0.4573844, -1.465458, 1, 0.4627451, 0, 1,
-1.432985, 0.8860367, -1.863425, 1, 0.4666667, 0, 1,
-1.418442, 0.4132611, -1.107093, 1, 0.4745098, 0, 1,
-1.407673, -0.5683938, -2.275105, 1, 0.4784314, 0, 1,
-1.3934, -0.6361363, -1.26572, 1, 0.4862745, 0, 1,
-1.379303, -1.340266, -3.969322, 1, 0.4901961, 0, 1,
-1.375719, -0.8124508, -4.007722, 1, 0.4980392, 0, 1,
-1.375405, 2.436771, -0.4919632, 1, 0.5058824, 0, 1,
-1.37157, -0.4094152, -0.5068836, 1, 0.509804, 0, 1,
-1.360332, 0.257965, -1.765622, 1, 0.5176471, 0, 1,
-1.357101, 0.9148743, -1.541724, 1, 0.5215687, 0, 1,
-1.352462, 0.7291642, -0.5628208, 1, 0.5294118, 0, 1,
-1.341448, 1.00194, -0.5904897, 1, 0.5333334, 0, 1,
-1.330684, -0.382259, -3.061348, 1, 0.5411765, 0, 1,
-1.327973, -0.4667695, -1.123132, 1, 0.5450981, 0, 1,
-1.324925, -1.880668, -2.274114, 1, 0.5529412, 0, 1,
-1.320629, 0.0381315, -3.002468, 1, 0.5568628, 0, 1,
-1.319493, 0.3040446, -0.454811, 1, 0.5647059, 0, 1,
-1.319129, -0.7088208, -1.128469, 1, 0.5686275, 0, 1,
-1.30822, -0.1249632, -2.042579, 1, 0.5764706, 0, 1,
-1.304793, 0.7047112, 0.08253614, 1, 0.5803922, 0, 1,
-1.299848, -0.7249394, -2.126885, 1, 0.5882353, 0, 1,
-1.296696, 0.8536478, -2.601597, 1, 0.5921569, 0, 1,
-1.294743, -0.1898672, -2.958729, 1, 0.6, 0, 1,
-1.293876, 2.548536, 0.08902264, 1, 0.6078432, 0, 1,
-1.288359, 2.679186, -1.753251, 1, 0.6117647, 0, 1,
-1.280912, -1.762898, -2.954063, 1, 0.6196079, 0, 1,
-1.270235, -0.7541087, -3.144253, 1, 0.6235294, 0, 1,
-1.264281, 0.3563914, -3.184417, 1, 0.6313726, 0, 1,
-1.258955, -0.1216477, -0.6438018, 1, 0.6352941, 0, 1,
-1.258618, -1.210554, -0.8738649, 1, 0.6431373, 0, 1,
-1.24886, 1.309206, 0.431511, 1, 0.6470588, 0, 1,
-1.239296, -1.807591, -1.765567, 1, 0.654902, 0, 1,
-1.235156, 0.825759, -0.7419037, 1, 0.6588235, 0, 1,
-1.226958, 0.2940159, -0.9924737, 1, 0.6666667, 0, 1,
-1.223712, -0.3097394, -3.525565, 1, 0.6705883, 0, 1,
-1.222606, -0.1451325, -1.661985, 1, 0.6784314, 0, 1,
-1.213227, -1.145867, -2.256468, 1, 0.682353, 0, 1,
-1.211627, 1.0004, 0.4437709, 1, 0.6901961, 0, 1,
-1.20609, -0.3630997, -2.469138, 1, 0.6941177, 0, 1,
-1.196437, 1.186971, -3.406051, 1, 0.7019608, 0, 1,
-1.189763, 0.9896219, -1.145871, 1, 0.7098039, 0, 1,
-1.174125, 1.101596, -2.380239, 1, 0.7137255, 0, 1,
-1.165278, 0.7949365, -0.587001, 1, 0.7215686, 0, 1,
-1.165096, 0.2761951, -0.5338102, 1, 0.7254902, 0, 1,
-1.164882, -1.251491, -3.782138, 1, 0.7333333, 0, 1,
-1.159367, -0.1392316, -1.429784, 1, 0.7372549, 0, 1,
-1.159308, -1.751773, -4.435715, 1, 0.7450981, 0, 1,
-1.159204, 0.3092982, -0.9471012, 1, 0.7490196, 0, 1,
-1.148052, -2.103258, -1.312325, 1, 0.7568628, 0, 1,
-1.140013, -1.084226, -0.008973375, 1, 0.7607843, 0, 1,
-1.132677, -0.5745967, -2.841374, 1, 0.7686275, 0, 1,
-1.128872, -0.6593235, -1.308103, 1, 0.772549, 0, 1,
-1.126757, 0.6970235, -1.397018, 1, 0.7803922, 0, 1,
-1.119558, -0.7437287, -1.663836, 1, 0.7843137, 0, 1,
-1.115982, -1.51466, -1.778875, 1, 0.7921569, 0, 1,
-1.115201, -0.7342961, -1.505209, 1, 0.7960784, 0, 1,
-1.11316, -1.002471, -2.089488, 1, 0.8039216, 0, 1,
-1.110564, 0.6084937, -1.204448, 1, 0.8117647, 0, 1,
-1.081912, -1.371472, -1.372519, 1, 0.8156863, 0, 1,
-1.081114, -0.9687089, -3.326409, 1, 0.8235294, 0, 1,
-1.080599, 0.2699705, -1.837489, 1, 0.827451, 0, 1,
-1.075264, -0.5728857, -2.406677, 1, 0.8352941, 0, 1,
-1.07002, 0.4477372, 0.4187979, 1, 0.8392157, 0, 1,
-1.067237, 0.7098093, -1.477501, 1, 0.8470588, 0, 1,
-1.067032, -0.7210904, 1.497185, 1, 0.8509804, 0, 1,
-1.056702, 0.2572146, -3.448465, 1, 0.8588235, 0, 1,
-1.052764, 0.4137836, -2.13753, 1, 0.8627451, 0, 1,
-1.037094, -0.3723899, -2.967012, 1, 0.8705882, 0, 1,
-1.034129, -0.9503376, -2.103584, 1, 0.8745098, 0, 1,
-1.023567, -2.787931, -2.002319, 1, 0.8823529, 0, 1,
-1.019819, -1.817887, -3.542757, 1, 0.8862745, 0, 1,
-1.010218, -0.4336664, -2.384418, 1, 0.8941177, 0, 1,
-1.007119, -0.702165, -2.251145, 1, 0.8980392, 0, 1,
-0.9871513, -1.118115, -0.9478198, 1, 0.9058824, 0, 1,
-0.9756625, 0.4726036, -1.362726, 1, 0.9137255, 0, 1,
-0.973255, 0.2973047, -1.821121, 1, 0.9176471, 0, 1,
-0.9687052, 0.4590928, -1.574329, 1, 0.9254902, 0, 1,
-0.9643338, 0.663025, -0.5128803, 1, 0.9294118, 0, 1,
-0.9555675, 0.6465842, 0.7013065, 1, 0.9372549, 0, 1,
-0.9522458, 1.57972, -0.6098087, 1, 0.9411765, 0, 1,
-0.94533, -0.1928904, -1.241316, 1, 0.9490196, 0, 1,
-0.9441851, -0.3604253, -1.344285, 1, 0.9529412, 0, 1,
-0.9296378, 0.7156999, -0.8146003, 1, 0.9607843, 0, 1,
-0.9231769, -1.870518, -3.042561, 1, 0.9647059, 0, 1,
-0.9204965, -0.5508877, -2.374694, 1, 0.972549, 0, 1,
-0.9191868, -1.199248, -1.607765, 1, 0.9764706, 0, 1,
-0.905407, 0.935528, 0.1413371, 1, 0.9843137, 0, 1,
-0.8938953, 1.496515, 0.3579307, 1, 0.9882353, 0, 1,
-0.8909314, -0.07656386, -1.593962, 1, 0.9960784, 0, 1,
-0.8907062, 0.544803, -1.594124, 0.9960784, 1, 0, 1,
-0.8891248, -0.1278031, -0.8715064, 0.9921569, 1, 0, 1,
-0.8850704, -0.3031439, -1.106809, 0.9843137, 1, 0, 1,
-0.884096, -0.7386902, -2.193597, 0.9803922, 1, 0, 1,
-0.8767964, 0.09958965, -0.9214952, 0.972549, 1, 0, 1,
-0.8765122, 0.9269364, 0.053542, 0.9686275, 1, 0, 1,
-0.8749535, -0.8153582, -2.37302, 0.9607843, 1, 0, 1,
-0.8710199, -0.3355805, -2.28386, 0.9568627, 1, 0, 1,
-0.8655966, -1.315934, -3.798651, 0.9490196, 1, 0, 1,
-0.8620412, 2.590718, -1.167882, 0.945098, 1, 0, 1,
-0.8570941, 0.04483879, -2.75507, 0.9372549, 1, 0, 1,
-0.855257, -0.9273331, -1.595532, 0.9333333, 1, 0, 1,
-0.8530281, -0.9156616, -3.299626, 0.9254902, 1, 0, 1,
-0.8511984, -0.2490024, -1.441617, 0.9215686, 1, 0, 1,
-0.8453627, 0.7209571, -0.3299443, 0.9137255, 1, 0, 1,
-0.8407502, -0.524751, -3.081682, 0.9098039, 1, 0, 1,
-0.8388072, 1.12379, 0.02030959, 0.9019608, 1, 0, 1,
-0.8379342, 0.6990658, -1.106119, 0.8941177, 1, 0, 1,
-0.8342416, 0.1195033, -0.2200996, 0.8901961, 1, 0, 1,
-0.8263988, 0.01331477, -0.8553025, 0.8823529, 1, 0, 1,
-0.8246137, -0.4236789, -2.345571, 0.8784314, 1, 0, 1,
-0.8233944, 0.9663346, -1.870539, 0.8705882, 1, 0, 1,
-0.8229341, -0.1304341, -1.411471, 0.8666667, 1, 0, 1,
-0.8067166, 0.2894198, -2.556547, 0.8588235, 1, 0, 1,
-0.8014502, -0.1411826, -1.303429, 0.854902, 1, 0, 1,
-0.7969268, 0.8874298, -0.1187407, 0.8470588, 1, 0, 1,
-0.7959202, 0.09101821, -2.102428, 0.8431373, 1, 0, 1,
-0.7937725, 1.412306, 0.001910223, 0.8352941, 1, 0, 1,
-0.7913036, -1.059255, -1.486387, 0.8313726, 1, 0, 1,
-0.7878805, 0.778643, -0.1235812, 0.8235294, 1, 0, 1,
-0.7865805, 0.03129128, -3.479906, 0.8196079, 1, 0, 1,
-0.7850432, 0.8805557, -0.819348, 0.8117647, 1, 0, 1,
-0.7849018, 1.208212, -0.990885, 0.8078431, 1, 0, 1,
-0.7826885, 0.2720124, -0.9631405, 0.8, 1, 0, 1,
-0.7810237, -0.3473006, -3.401167, 0.7921569, 1, 0, 1,
-0.7763857, 0.3308874, -1.662536, 0.7882353, 1, 0, 1,
-0.7711642, 3.425486, -0.3574439, 0.7803922, 1, 0, 1,
-0.7663919, 0.08088236, -1.887179, 0.7764706, 1, 0, 1,
-0.7612604, 1.834777, -0.7009749, 0.7686275, 1, 0, 1,
-0.7530343, -1.456925, -1.709006, 0.7647059, 1, 0, 1,
-0.7479693, -1.227459, -3.16139, 0.7568628, 1, 0, 1,
-0.745575, -0.5808859, 0.1757685, 0.7529412, 1, 0, 1,
-0.7441252, 1.566586, 0.1178916, 0.7450981, 1, 0, 1,
-0.7354167, -0.4419512, -3.997735, 0.7411765, 1, 0, 1,
-0.7345102, -0.8346978, -2.559821, 0.7333333, 1, 0, 1,
-0.7279392, 1.415438, -0.4209656, 0.7294118, 1, 0, 1,
-0.7210845, -0.5915597, -2.086523, 0.7215686, 1, 0, 1,
-0.7204574, 0.9295319, -1.090095, 0.7176471, 1, 0, 1,
-0.7184567, -0.8713047, -2.128912, 0.7098039, 1, 0, 1,
-0.7173312, -2.982609, -3.839848, 0.7058824, 1, 0, 1,
-0.7167365, 0.3466105, -1.494571, 0.6980392, 1, 0, 1,
-0.7108112, -0.9532498, -2.8966, 0.6901961, 1, 0, 1,
-0.7053641, -0.6767697, -2.789483, 0.6862745, 1, 0, 1,
-0.7013125, -0.8448279, -3.130793, 0.6784314, 1, 0, 1,
-0.6921622, 0.9189472, -0.9692003, 0.6745098, 1, 0, 1,
-0.6887937, -1.480825, -3.836088, 0.6666667, 1, 0, 1,
-0.6834677, 0.815368, 0.4628252, 0.6627451, 1, 0, 1,
-0.681724, 0.04791054, -0.6335881, 0.654902, 1, 0, 1,
-0.6714769, 1.829724, -0.264439, 0.6509804, 1, 0, 1,
-0.668079, -0.4309473, -2.03527, 0.6431373, 1, 0, 1,
-0.6542972, -0.7326884, -3.557471, 0.6392157, 1, 0, 1,
-0.6447926, -0.5450777, -2.919162, 0.6313726, 1, 0, 1,
-0.6386243, 1.067393, -2.64225, 0.627451, 1, 0, 1,
-0.6314836, -0.8531033, -2.241747, 0.6196079, 1, 0, 1,
-0.630439, -1.381855, -1.731083, 0.6156863, 1, 0, 1,
-0.630307, -0.006098443, -1.9065, 0.6078432, 1, 0, 1,
-0.6286913, 1.334835, 2.839629, 0.6039216, 1, 0, 1,
-0.6270302, -0.4091418, -3.435327, 0.5960785, 1, 0, 1,
-0.6250759, 1.829365, 0.5246004, 0.5882353, 1, 0, 1,
-0.6104037, 0.2321193, -1.957788, 0.5843138, 1, 0, 1,
-0.6076851, 0.1167421, -2.191056, 0.5764706, 1, 0, 1,
-0.6069691, -0.3138332, -0.8459072, 0.572549, 1, 0, 1,
-0.6038788, -0.5771276, -1.226757, 0.5647059, 1, 0, 1,
-0.6027679, -0.3540131, -2.710541, 0.5607843, 1, 0, 1,
-0.6024638, 0.03997307, -2.222605, 0.5529412, 1, 0, 1,
-0.5979386, -0.4316812, -1.625357, 0.5490196, 1, 0, 1,
-0.5949489, 0.1415155, 0.3397188, 0.5411765, 1, 0, 1,
-0.5934183, -0.2886441, -0.8754979, 0.5372549, 1, 0, 1,
-0.590427, 0.7402268, -1.540818, 0.5294118, 1, 0, 1,
-0.5881468, 2.008408, -0.9806729, 0.5254902, 1, 0, 1,
-0.5870994, 0.5296923, -1.933006, 0.5176471, 1, 0, 1,
-0.5818525, 0.01963719, -0.9787909, 0.5137255, 1, 0, 1,
-0.5806597, -0.8248123, -3.859087, 0.5058824, 1, 0, 1,
-0.5798665, 0.4280246, -1.538545, 0.5019608, 1, 0, 1,
-0.5717722, -0.4674022, -1.29493, 0.4941176, 1, 0, 1,
-0.5689403, -1.00833, -3.09594, 0.4862745, 1, 0, 1,
-0.564852, -0.9958451, -2.027792, 0.4823529, 1, 0, 1,
-0.5643811, 0.2145838, -1.617947, 0.4745098, 1, 0, 1,
-0.5567324, 1.132385, -0.5474301, 0.4705882, 1, 0, 1,
-0.556491, 2.376997, -2.194046, 0.4627451, 1, 0, 1,
-0.5516554, -0.8584127, -2.803986, 0.4588235, 1, 0, 1,
-0.5419422, 1.455659, -0.7536051, 0.4509804, 1, 0, 1,
-0.536139, 1.561097, 1.685485, 0.4470588, 1, 0, 1,
-0.5343215, -0.4503067, -1.60692, 0.4392157, 1, 0, 1,
-0.5337831, 0.5622918, -1.650514, 0.4352941, 1, 0, 1,
-0.5326895, -0.521292, -2.813033, 0.427451, 1, 0, 1,
-0.528941, -0.3589008, -0.3723712, 0.4235294, 1, 0, 1,
-0.5262554, 0.2067399, -1.809325, 0.4156863, 1, 0, 1,
-0.5216037, -2.056323, -3.453343, 0.4117647, 1, 0, 1,
-0.5190913, 0.4033893, -1.262213, 0.4039216, 1, 0, 1,
-0.5190523, 0.8382339, -0.08382134, 0.3960784, 1, 0, 1,
-0.5158445, -0.3068124, -2.129089, 0.3921569, 1, 0, 1,
-0.5155245, 0.7346717, 1.362607, 0.3843137, 1, 0, 1,
-0.5138434, 0.7481465, -0.2184755, 0.3803922, 1, 0, 1,
-0.5135438, -0.4828561, -2.537453, 0.372549, 1, 0, 1,
-0.5132738, -0.8931094, -1.853002, 0.3686275, 1, 0, 1,
-0.5096001, -0.6976871, -1.384868, 0.3607843, 1, 0, 1,
-0.5040945, 1.405576, 0.8412386, 0.3568628, 1, 0, 1,
-0.5031664, 0.7143447, -0.2785947, 0.3490196, 1, 0, 1,
-0.4943353, -0.4188565, -1.341512, 0.345098, 1, 0, 1,
-0.4934595, 0.9811316, -1.056862, 0.3372549, 1, 0, 1,
-0.4925111, -0.2472458, -1.894825, 0.3333333, 1, 0, 1,
-0.4919664, 0.3673011, -1.07245, 0.3254902, 1, 0, 1,
-0.4850751, 0.7576882, -1.500098, 0.3215686, 1, 0, 1,
-0.4822019, -0.4788743, -1.728033, 0.3137255, 1, 0, 1,
-0.4805708, 0.02352525, -2.270049, 0.3098039, 1, 0, 1,
-0.4777486, 1.136502, 0.1864968, 0.3019608, 1, 0, 1,
-0.4769913, 0.7095531, -0.7816316, 0.2941177, 1, 0, 1,
-0.4759158, 0.03897594, -1.27307, 0.2901961, 1, 0, 1,
-0.4752641, 0.08186714, -2.1181, 0.282353, 1, 0, 1,
-0.4701492, 2.104256, -2.3475, 0.2784314, 1, 0, 1,
-0.4696717, -0.5758272, -1.972705, 0.2705882, 1, 0, 1,
-0.4676075, -0.9250106, -3.197031, 0.2666667, 1, 0, 1,
-0.4625082, 0.1595798, -1.153019, 0.2588235, 1, 0, 1,
-0.4594771, -0.4544187, -2.125872, 0.254902, 1, 0, 1,
-0.4588516, 0.7050179, -2.395167, 0.2470588, 1, 0, 1,
-0.4499293, 2.278582, 0.2472002, 0.2431373, 1, 0, 1,
-0.4453273, 0.7785867, -1.370886, 0.2352941, 1, 0, 1,
-0.4374354, -1.624311, -1.916177, 0.2313726, 1, 0, 1,
-0.4324959, -0.8529033, -2.360964, 0.2235294, 1, 0, 1,
-0.4280707, 1.206936, -0.4600336, 0.2196078, 1, 0, 1,
-0.4278915, -1.422711, -1.717399, 0.2117647, 1, 0, 1,
-0.4274784, 0.3298745, -1.215559, 0.2078431, 1, 0, 1,
-0.4260732, -2.016618, -2.733444, 0.2, 1, 0, 1,
-0.4253009, -0.1464101, -2.49428, 0.1921569, 1, 0, 1,
-0.4218449, 2.736957, -0.05162151, 0.1882353, 1, 0, 1,
-0.4175509, -0.7623439, -1.756996, 0.1803922, 1, 0, 1,
-0.4173086, -0.7207777, -3.136366, 0.1764706, 1, 0, 1,
-0.4105832, -0.3631353, -3.252499, 0.1686275, 1, 0, 1,
-0.4087422, 0.3257708, -0.4151956, 0.1647059, 1, 0, 1,
-0.4078991, 1.30946, 1.282266, 0.1568628, 1, 0, 1,
-0.4069155, -1.270005, -3.787814, 0.1529412, 1, 0, 1,
-0.400314, -1.11887, -1.990217, 0.145098, 1, 0, 1,
-0.3991996, -2.355353, -1.916492, 0.1411765, 1, 0, 1,
-0.3983313, 0.9058938, 0.1222298, 0.1333333, 1, 0, 1,
-0.3947331, -0.5398346, -2.679485, 0.1294118, 1, 0, 1,
-0.390365, 0.09753548, -1.561725, 0.1215686, 1, 0, 1,
-0.3889942, 0.4435287, -0.7829136, 0.1176471, 1, 0, 1,
-0.3883131, 0.8100561, 0.1063329, 0.1098039, 1, 0, 1,
-0.3807161, -1.773506, -4.276785, 0.1058824, 1, 0, 1,
-0.3793702, 0.9144402, 0.1697228, 0.09803922, 1, 0, 1,
-0.3767813, -0.5938966, -2.510649, 0.09019608, 1, 0, 1,
-0.3741359, -2.142348, -1.998788, 0.08627451, 1, 0, 1,
-0.3647606, -0.1524376, -2.621207, 0.07843138, 1, 0, 1,
-0.3644496, -0.1364102, -1.645378, 0.07450981, 1, 0, 1,
-0.3639719, -0.0416608, -3.024713, 0.06666667, 1, 0, 1,
-0.3593241, -0.0926915, -1.476141, 0.0627451, 1, 0, 1,
-0.35914, 0.2970067, -2.507886, 0.05490196, 1, 0, 1,
-0.3579744, -0.7715804, -3.827183, 0.05098039, 1, 0, 1,
-0.3527404, 1.549425, -1.98277, 0.04313726, 1, 0, 1,
-0.3499531, 0.5343212, -0.1772867, 0.03921569, 1, 0, 1,
-0.3493471, -0.5080507, -1.567096, 0.03137255, 1, 0, 1,
-0.3330252, -0.4255112, -4.988553, 0.02745098, 1, 0, 1,
-0.3319931, -1.483137, -2.695244, 0.01960784, 1, 0, 1,
-0.330831, -1.083365, -1.95293, 0.01568628, 1, 0, 1,
-0.330381, 0.3004071, -0.6117213, 0.007843138, 1, 0, 1,
-0.3299557, -1.317322, -1.433925, 0.003921569, 1, 0, 1,
-0.3268721, 0.7796763, 0.9778189, 0, 1, 0.003921569, 1,
-0.3238105, 0.9747384, 0.6100469, 0, 1, 0.01176471, 1,
-0.3234815, -0.1111155, -0.7208542, 0, 1, 0.01568628, 1,
-0.3233476, 0.6249407, -1.856449, 0, 1, 0.02352941, 1,
-0.322696, -0.8717187, -3.001591, 0, 1, 0.02745098, 1,
-0.3214977, 0.6501056, -2.233199, 0, 1, 0.03529412, 1,
-0.3155788, -0.2513076, -1.921154, 0, 1, 0.03921569, 1,
-0.3137092, -0.1578064, -1.318277, 0, 1, 0.04705882, 1,
-0.3071717, -0.06856314, 1.344463, 0, 1, 0.05098039, 1,
-0.3070274, 0.3478982, 0.6427026, 0, 1, 0.05882353, 1,
-0.3028177, 0.2926882, -1.045712, 0, 1, 0.0627451, 1,
-0.300812, -0.4931143, -0.5535734, 0, 1, 0.07058824, 1,
-0.298536, 1.249934, -2.44276, 0, 1, 0.07450981, 1,
-0.2975574, 0.2565977, -0.6131468, 0, 1, 0.08235294, 1,
-0.2949875, -2.037109, -2.824204, 0, 1, 0.08627451, 1,
-0.2942263, 0.5792209, -1.081197, 0, 1, 0.09411765, 1,
-0.2910492, -0.1419768, -2.347617, 0, 1, 0.1019608, 1,
-0.2827514, 0.8467046, -0.8945481, 0, 1, 0.1058824, 1,
-0.2795525, -0.7337325, -2.349753, 0, 1, 0.1137255, 1,
-0.2772108, -1.084001, -4.080979, 0, 1, 0.1176471, 1,
-0.2766792, 0.6610878, -2.084905, 0, 1, 0.1254902, 1,
-0.2762387, -1.692052, -1.505518, 0, 1, 0.1294118, 1,
-0.2746636, 1.357005, 0.9175751, 0, 1, 0.1372549, 1,
-0.2733346, 0.8673186, 0.8123654, 0, 1, 0.1411765, 1,
-0.2733073, -0.9644534, -4.392171, 0, 1, 0.1490196, 1,
-0.2730081, -1.046977, -2.097276, 0, 1, 0.1529412, 1,
-0.2695963, -1.424633, -1.287241, 0, 1, 0.1607843, 1,
-0.2688279, 0.08462603, -1.396438, 0, 1, 0.1647059, 1,
-0.2613153, 0.02315866, -1.73433, 0, 1, 0.172549, 1,
-0.2597825, 1.716184, -0.8074451, 0, 1, 0.1764706, 1,
-0.2553854, -0.3301119, -2.629558, 0, 1, 0.1843137, 1,
-0.2522557, 0.429049, -1.08742, 0, 1, 0.1882353, 1,
-0.2515751, 0.8534522, 0.1336438, 0, 1, 0.1960784, 1,
-0.2498843, -0.5669779, -2.384136, 0, 1, 0.2039216, 1,
-0.2498326, 0.7753115, -0.5831112, 0, 1, 0.2078431, 1,
-0.2496061, -1.423659, -2.188441, 0, 1, 0.2156863, 1,
-0.2493691, -2.502194, -3.053396, 0, 1, 0.2196078, 1,
-0.2486309, 0.9836517, -0.1100489, 0, 1, 0.227451, 1,
-0.2455061, 0.1102789, -1.110115, 0, 1, 0.2313726, 1,
-0.243959, 0.3488563, -0.6739726, 0, 1, 0.2392157, 1,
-0.2438121, -0.3267512, -2.271746, 0, 1, 0.2431373, 1,
-0.2437843, -1.137328, -4.03388, 0, 1, 0.2509804, 1,
-0.2429573, -0.9543374, -4.004725, 0, 1, 0.254902, 1,
-0.2423389, -0.3758884, -3.91282, 0, 1, 0.2627451, 1,
-0.2419702, 1.787471, -0.5451037, 0, 1, 0.2666667, 1,
-0.2397749, 0.3461695, -0.5705295, 0, 1, 0.2745098, 1,
-0.2395501, -1.236524, -2.776562, 0, 1, 0.2784314, 1,
-0.2326482, 1.295249, 1.55372, 0, 1, 0.2862745, 1,
-0.2305924, 0.8677966, -0.5880975, 0, 1, 0.2901961, 1,
-0.2296594, -0.3809465, -2.076532, 0, 1, 0.2980392, 1,
-0.2282998, 0.4031245, -0.2996518, 0, 1, 0.3058824, 1,
-0.2275635, -1.455559, -2.855031, 0, 1, 0.3098039, 1,
-0.2266762, 0.4453921, 0.326621, 0, 1, 0.3176471, 1,
-0.2264603, -1.195374, -1.962417, 0, 1, 0.3215686, 1,
-0.2187787, 0.207546, -0.507745, 0, 1, 0.3294118, 1,
-0.2180914, 2.483477, 0.5485665, 0, 1, 0.3333333, 1,
-0.2167214, 2.12664, -1.549918, 0, 1, 0.3411765, 1,
-0.2122604, 1.21802, 0.6545212, 0, 1, 0.345098, 1,
-0.2094131, -1.397406, -1.495937, 0, 1, 0.3529412, 1,
-0.2093698, 1.746685, 1.319921, 0, 1, 0.3568628, 1,
-0.2091424, -0.307961, -1.748314, 0, 1, 0.3647059, 1,
-0.2018328, -0.1206527, -1.701045, 0, 1, 0.3686275, 1,
-0.1991421, 0.9219244, -1.138883, 0, 1, 0.3764706, 1,
-0.1925554, -0.5985738, -4.400368, 0, 1, 0.3803922, 1,
-0.1920404, 0.9289283, -0.3191326, 0, 1, 0.3882353, 1,
-0.1912175, 0.401612, -1.363505, 0, 1, 0.3921569, 1,
-0.1902869, 0.03390255, -2.781401, 0, 1, 0.4, 1,
-0.1863231, -1.165177, -3.286943, 0, 1, 0.4078431, 1,
-0.1860726, -0.1443158, -1.340239, 0, 1, 0.4117647, 1,
-0.1853651, -1.239174, -1.800397, 0, 1, 0.4196078, 1,
-0.1794397, -0.2244344, -2.053844, 0, 1, 0.4235294, 1,
-0.1761054, -1.348752, -2.072442, 0, 1, 0.4313726, 1,
-0.1683903, -0.1110844, -3.010972, 0, 1, 0.4352941, 1,
-0.167201, -0.03306386, 0.4873791, 0, 1, 0.4431373, 1,
-0.1614157, -1.084938, -4.888752, 0, 1, 0.4470588, 1,
-0.1610654, -0.7957014, -3.300235, 0, 1, 0.454902, 1,
-0.1592307, 0.4547653, 0.2432892, 0, 1, 0.4588235, 1,
-0.1584613, 0.4319215, -0.7414064, 0, 1, 0.4666667, 1,
-0.1561781, -2.12607, -4.383419, 0, 1, 0.4705882, 1,
-0.1524675, 1.621273, 0.3724353, 0, 1, 0.4784314, 1,
-0.1480836, 0.6704119, -0.637283, 0, 1, 0.4823529, 1,
-0.145762, 1.852687, 0.6827319, 0, 1, 0.4901961, 1,
-0.1448778, 0.05049432, -2.061445, 0, 1, 0.4941176, 1,
-0.1426756, -0.7864601, -2.625596, 0, 1, 0.5019608, 1,
-0.1401591, -1.429142, -3.273722, 0, 1, 0.509804, 1,
-0.1393581, 0.3515833, 0.9864725, 0, 1, 0.5137255, 1,
-0.1313009, -0.5916523, -1.66662, 0, 1, 0.5215687, 1,
-0.1292909, 0.1281426, -2.347295, 0, 1, 0.5254902, 1,
-0.1234942, -0.6796304, -0.917814, 0, 1, 0.5333334, 1,
-0.1226388, 0.8303391, -0.2168195, 0, 1, 0.5372549, 1,
-0.1209462, -0.2762541, -1.707957, 0, 1, 0.5450981, 1,
-0.1196996, -0.0673148, -2.72969, 0, 1, 0.5490196, 1,
-0.1182216, 1.944373, 0.6769914, 0, 1, 0.5568628, 1,
-0.1171668, 1.403386, -1.131824, 0, 1, 0.5607843, 1,
-0.1149276, 0.8351211, 0.2117455, 0, 1, 0.5686275, 1,
-0.112277, -1.96733, -3.335352, 0, 1, 0.572549, 1,
-0.1122575, -0.8893681, -3.427582, 0, 1, 0.5803922, 1,
-0.1016295, -1.408099, -2.872919, 0, 1, 0.5843138, 1,
-0.1009396, -0.5046184, -1.917317, 0, 1, 0.5921569, 1,
-0.09902199, -1.0484, -1.792163, 0, 1, 0.5960785, 1,
-0.0984082, 0.06763488, 0.1029191, 0, 1, 0.6039216, 1,
-0.09278943, -0.515912, -4.197516, 0, 1, 0.6117647, 1,
-0.08541287, 0.1467663, -0.128768, 0, 1, 0.6156863, 1,
-0.08421013, 0.08138403, -1.136878, 0, 1, 0.6235294, 1,
-0.07979516, 0.5599363, -0.7434429, 0, 1, 0.627451, 1,
-0.07767993, 0.192629, -0.4726216, 0, 1, 0.6352941, 1,
-0.07633276, -0.1958957, -3.563829, 0, 1, 0.6392157, 1,
-0.0757952, 1.30872, -0.007279006, 0, 1, 0.6470588, 1,
-0.07465046, -0.468504, -4.916879, 0, 1, 0.6509804, 1,
-0.07383848, -0.3776112, -4.021618, 0, 1, 0.6588235, 1,
-0.07382473, 0.5229809, -0.176302, 0, 1, 0.6627451, 1,
-0.06830551, 0.2183501, -0.5625138, 0, 1, 0.6705883, 1,
-0.06740725, -1.017597, -3.139371, 0, 1, 0.6745098, 1,
-0.06003445, 0.3158731, 0.3121423, 0, 1, 0.682353, 1,
-0.05870375, 0.441461, 0.5299824, 0, 1, 0.6862745, 1,
-0.05455511, -1.392043, -2.596821, 0, 1, 0.6941177, 1,
-0.04868257, 1.491328, -0.2811958, 0, 1, 0.7019608, 1,
-0.04844767, -1.908258, -3.092877, 0, 1, 0.7058824, 1,
-0.04512909, -1.024044, -2.693863, 0, 1, 0.7137255, 1,
-0.04429882, -1.172097, -3.008792, 0, 1, 0.7176471, 1,
-0.04374585, -1.117626, -2.693879, 0, 1, 0.7254902, 1,
-0.04191618, -0.926551, -2.422992, 0, 1, 0.7294118, 1,
-0.0408861, 1.032604, -2.006123, 0, 1, 0.7372549, 1,
-0.03900403, 0.4298401, 0.6023873, 0, 1, 0.7411765, 1,
-0.03775523, -0.5601238, -2.514542, 0, 1, 0.7490196, 1,
-0.0312677, 1.487546, -0.1081861, 0, 1, 0.7529412, 1,
-0.03123442, -2.109913, -4.054975, 0, 1, 0.7607843, 1,
-0.02859534, 0.3816661, 1.34991, 0, 1, 0.7647059, 1,
-0.02735937, -0.1238284, -3.581249, 0, 1, 0.772549, 1,
-0.02656458, -0.2889761, -1.096908, 0, 1, 0.7764706, 1,
-0.02594439, -0.3269832, -1.823767, 0, 1, 0.7843137, 1,
-0.02259441, 1.012113, -1.533109, 0, 1, 0.7882353, 1,
-0.02249639, -2.210177, -3.054286, 0, 1, 0.7960784, 1,
-0.02179479, -0.2094049, -3.005428, 0, 1, 0.8039216, 1,
-0.01973439, -0.9867193, -4.062104, 0, 1, 0.8078431, 1,
-0.01221594, -1.873379, -3.62327, 0, 1, 0.8156863, 1,
-0.008993406, 1.163511, 0.4342658, 0, 1, 0.8196079, 1,
-0.002612299, 1.865097, 0.3395481, 0, 1, 0.827451, 1,
-0.001486185, -0.8624163, -4.072667, 0, 1, 0.8313726, 1,
-6.237135e-06, -0.7118789, -2.848053, 0, 1, 0.8392157, 1,
0.0003271646, -0.3135076, 3.717251, 0, 1, 0.8431373, 1,
0.001921973, 0.009079186, -0.5116022, 0, 1, 0.8509804, 1,
0.002040113, -0.5271587, 1.362927, 0, 1, 0.854902, 1,
0.004715441, -1.153385, 1.8323, 0, 1, 0.8627451, 1,
0.006340823, 0.9313244, 3.043204, 0, 1, 0.8666667, 1,
0.007967919, 0.1803688, -0.3483479, 0, 1, 0.8745098, 1,
0.008041745, 0.50032, 0.3110657, 0, 1, 0.8784314, 1,
0.01225562, -0.2953711, 2.85266, 0, 1, 0.8862745, 1,
0.01349899, -1.756004, 2.269566, 0, 1, 0.8901961, 1,
0.01428768, -0.1295224, 6.385431, 0, 1, 0.8980392, 1,
0.02004729, -1.264622, 3.090962, 0, 1, 0.9058824, 1,
0.02041194, -0.3286282, 2.736486, 0, 1, 0.9098039, 1,
0.02071515, 0.09042296, 0.7218996, 0, 1, 0.9176471, 1,
0.02644939, 1.124382, -0.6613355, 0, 1, 0.9215686, 1,
0.03091207, 0.0563292, 2.106601, 0, 1, 0.9294118, 1,
0.03958321, -0.2212462, 2.070441, 0, 1, 0.9333333, 1,
0.04100341, -0.03206079, 2.751639, 0, 1, 0.9411765, 1,
0.04189205, 1.618879, 1.831982, 0, 1, 0.945098, 1,
0.04261641, 0.7008108, 0.5533137, 0, 1, 0.9529412, 1,
0.0438313, -0.7037236, 3.946478, 0, 1, 0.9568627, 1,
0.04895813, -0.16371, 1.944829, 0, 1, 0.9647059, 1,
0.04981816, 1.100344, -0.9577574, 0, 1, 0.9686275, 1,
0.04999007, 1.046735, -0.9359846, 0, 1, 0.9764706, 1,
0.05010363, 0.5418323, -1.913008, 0, 1, 0.9803922, 1,
0.05122888, 0.1613251, 0.06837996, 0, 1, 0.9882353, 1,
0.05750558, -0.1414128, 2.712132, 0, 1, 0.9921569, 1,
0.0584602, 0.2373558, 0.4647833, 0, 1, 1, 1,
0.06436034, 0.08587909, 1.961125, 0, 0.9921569, 1, 1,
0.065239, -1.111014, 3.404018, 0, 0.9882353, 1, 1,
0.06608245, 1.336531, 0.7424605, 0, 0.9803922, 1, 1,
0.06649254, 0.3326163, -1.368762, 0, 0.9764706, 1, 1,
0.06904944, -0.08124463, 2.704496, 0, 0.9686275, 1, 1,
0.07359993, 0.9396029, -0.356637, 0, 0.9647059, 1, 1,
0.07456109, -1.433539, 4.029964, 0, 0.9568627, 1, 1,
0.07496619, -0.4502763, 2.132965, 0, 0.9529412, 1, 1,
0.07900646, -0.1935898, 2.956094, 0, 0.945098, 1, 1,
0.08088396, 1.038098, -1.187378, 0, 0.9411765, 1, 1,
0.08140238, 1.159742, 0.6122003, 0, 0.9333333, 1, 1,
0.08451878, -1.72738, 4.576678, 0, 0.9294118, 1, 1,
0.09017034, -0.8484763, 2.87256, 0, 0.9215686, 1, 1,
0.09087622, -0.6823929, 2.222085, 0, 0.9176471, 1, 1,
0.09384085, 0.1517341, 1.67588, 0, 0.9098039, 1, 1,
0.09687684, -0.7578289, 2.209347, 0, 0.9058824, 1, 1,
0.09857561, -0.7244416, 3.800919, 0, 0.8980392, 1, 1,
0.09958662, 0.0315763, 0.6164826, 0, 0.8901961, 1, 1,
0.1032924, 0.2584431, 1.004588, 0, 0.8862745, 1, 1,
0.1174917, -0.5613677, 3.274624, 0, 0.8784314, 1, 1,
0.1192789, -0.5490991, 3.503079, 0, 0.8745098, 1, 1,
0.1208965, -0.9111395, 2.628148, 0, 0.8666667, 1, 1,
0.1216552, -1.547521, 2.532895, 0, 0.8627451, 1, 1,
0.1224959, -0.7279799, 1.881625, 0, 0.854902, 1, 1,
0.1226985, -0.7413427, 1.565191, 0, 0.8509804, 1, 1,
0.1253527, -0.148715, 4.042221, 0, 0.8431373, 1, 1,
0.1336231, 0.5203039, -1.551071, 0, 0.8392157, 1, 1,
0.1339332, 0.1426702, 0.6820089, 0, 0.8313726, 1, 1,
0.134677, 1.152175, -0.6179958, 0, 0.827451, 1, 1,
0.1350673, -0.2070048, 1.479533, 0, 0.8196079, 1, 1,
0.1354851, 0.1406616, 0.5688742, 0, 0.8156863, 1, 1,
0.1360687, -0.007217074, 1.400298, 0, 0.8078431, 1, 1,
0.1378202, 0.2222575, -0.08336093, 0, 0.8039216, 1, 1,
0.1379023, -0.3115901, 3.687544, 0, 0.7960784, 1, 1,
0.1380352, -1.566319, 3.313761, 0, 0.7882353, 1, 1,
0.1384816, 1.487344, -1.276922, 0, 0.7843137, 1, 1,
0.1386875, 0.1098166, -0.1638812, 0, 0.7764706, 1, 1,
0.1390916, -0.7363945, 2.714583, 0, 0.772549, 1, 1,
0.1422652, -1.191401, 3.861565, 0, 0.7647059, 1, 1,
0.1434556, 0.7587791, 0.2186701, 0, 0.7607843, 1, 1,
0.1436775, 0.1193292, 0.6448008, 0, 0.7529412, 1, 1,
0.1454076, -0.4309445, 4.196282, 0, 0.7490196, 1, 1,
0.1459197, 1.669662, -0.1977779, 0, 0.7411765, 1, 1,
0.146069, -0.4028017, 4.112051, 0, 0.7372549, 1, 1,
0.1462021, 0.8895275, 0.3398117, 0, 0.7294118, 1, 1,
0.1471393, -0.8300572, 4.437836, 0, 0.7254902, 1, 1,
0.1493969, -1.221498, 3.530158, 0, 0.7176471, 1, 1,
0.1516661, -0.449751, 3.946077, 0, 0.7137255, 1, 1,
0.1537119, -0.2050517, 3.248645, 0, 0.7058824, 1, 1,
0.1548375, 0.881261, -0.7856911, 0, 0.6980392, 1, 1,
0.1577221, -1.337005, 2.43644, 0, 0.6941177, 1, 1,
0.1578246, 0.3102245, 0.4952939, 0, 0.6862745, 1, 1,
0.1602384, 2.132046, 1.134784, 0, 0.682353, 1, 1,
0.1655512, -0.9284143, 2.387007, 0, 0.6745098, 1, 1,
0.1661223, -1.456163, 2.736559, 0, 0.6705883, 1, 1,
0.1665815, 1.314945, -1.196812, 0, 0.6627451, 1, 1,
0.1695398, 1.309042, 0.5651925, 0, 0.6588235, 1, 1,
0.1714157, -1.49669, 1.480532, 0, 0.6509804, 1, 1,
0.171614, -1.288836, 2.693545, 0, 0.6470588, 1, 1,
0.1720996, -0.5246025, 4.352529, 0, 0.6392157, 1, 1,
0.1752634, -0.3873088, 3.149657, 0, 0.6352941, 1, 1,
0.1756299, -0.8451064, 3.245421, 0, 0.627451, 1, 1,
0.1826344, 0.9265732, 0.3395968, 0, 0.6235294, 1, 1,
0.183558, 1.163304, -0.8486307, 0, 0.6156863, 1, 1,
0.1851662, 0.4758104, -0.3318762, 0, 0.6117647, 1, 1,
0.186721, -1.060115, 3.455948, 0, 0.6039216, 1, 1,
0.18749, 1.686892, 0.5261213, 0, 0.5960785, 1, 1,
0.1894651, -1.755139, 2.419415, 0, 0.5921569, 1, 1,
0.1944668, -0.1077166, 2.601541, 0, 0.5843138, 1, 1,
0.1987627, -0.4639144, 3.843843, 0, 0.5803922, 1, 1,
0.2053823, -1.468194, 3.512238, 0, 0.572549, 1, 1,
0.2069117, -0.335541, 1.456104, 0, 0.5686275, 1, 1,
0.207427, -0.6340652, 2.378863, 0, 0.5607843, 1, 1,
0.2107697, -1.366429, 3.476788, 0, 0.5568628, 1, 1,
0.2113204, -0.3874613, 3.493186, 0, 0.5490196, 1, 1,
0.2192783, 2.004438, 0.6332257, 0, 0.5450981, 1, 1,
0.2235451, -0.921865, 3.443405, 0, 0.5372549, 1, 1,
0.2260142, -1.606103, 3.334542, 0, 0.5333334, 1, 1,
0.2290767, -0.2695601, 3.711646, 0, 0.5254902, 1, 1,
0.2315707, -0.8022762, 2.319066, 0, 0.5215687, 1, 1,
0.232982, 0.6161829, 1.050837, 0, 0.5137255, 1, 1,
0.2345205, 1.527407, 1.09666, 0, 0.509804, 1, 1,
0.2345608, 0.6449472, 0.3262691, 0, 0.5019608, 1, 1,
0.2351935, -0.4103561, 1.089141, 0, 0.4941176, 1, 1,
0.2408114, -0.2646227, 0.02108101, 0, 0.4901961, 1, 1,
0.2419065, 0.6058559, -0.2044446, 0, 0.4823529, 1, 1,
0.2465643, 0.3584403, 1.515844, 0, 0.4784314, 1, 1,
0.2562214, 0.05668546, 0.2204314, 0, 0.4705882, 1, 1,
0.2577834, 2.0369, -0.8132727, 0, 0.4666667, 1, 1,
0.2585601, 0.02887532, 1.887383, 0, 0.4588235, 1, 1,
0.2593711, 0.1748764, 1.560721, 0, 0.454902, 1, 1,
0.2623565, 1.792114, -2.000638, 0, 0.4470588, 1, 1,
0.2642228, -0.890296, 3.065523, 0, 0.4431373, 1, 1,
0.2651114, 0.7524682, 2.021964, 0, 0.4352941, 1, 1,
0.2668509, -1.510748, 3.320187, 0, 0.4313726, 1, 1,
0.2673339, -0.9372527, 5.065645, 0, 0.4235294, 1, 1,
0.271807, -1.863621, 1.93843, 0, 0.4196078, 1, 1,
0.2719634, 1.132852, -0.09067593, 0, 0.4117647, 1, 1,
0.272728, 0.2690381, 0.1335675, 0, 0.4078431, 1, 1,
0.2758902, 1.589333, 0.07064846, 0, 0.4, 1, 1,
0.2773256, -0.7031963, 5.166873, 0, 0.3921569, 1, 1,
0.2780475, 2.194316, 1.285474, 0, 0.3882353, 1, 1,
0.2780761, -1.188778, 2.090718, 0, 0.3803922, 1, 1,
0.2804459, 0.365579, 1.94277, 0, 0.3764706, 1, 1,
0.2877585, -0.9277014, 3.064198, 0, 0.3686275, 1, 1,
0.2905765, -0.8811973, 2.584666, 0, 0.3647059, 1, 1,
0.2919734, -0.1136698, 2.418706, 0, 0.3568628, 1, 1,
0.2950264, 1.052366, 0.3684175, 0, 0.3529412, 1, 1,
0.2986639, 1.560088, 1.090398, 0, 0.345098, 1, 1,
0.3012562, 0.1554577, 1.349662, 0, 0.3411765, 1, 1,
0.3071551, -1.381089, 2.935649, 0, 0.3333333, 1, 1,
0.3102041, -1.514599, 2.850104, 0, 0.3294118, 1, 1,
0.3139076, -2.072959, 2.444798, 0, 0.3215686, 1, 1,
0.3153643, -0.3919027, 0.7682747, 0, 0.3176471, 1, 1,
0.315391, -1.100651, 2.637474, 0, 0.3098039, 1, 1,
0.3173253, -0.04710856, 1.421455, 0, 0.3058824, 1, 1,
0.3178345, -0.7949108, 3.035649, 0, 0.2980392, 1, 1,
0.3188826, -0.110785, 1.503384, 0, 0.2901961, 1, 1,
0.3280884, 0.02502066, 0.6129766, 0, 0.2862745, 1, 1,
0.3291445, 1.869532, 0.3617747, 0, 0.2784314, 1, 1,
0.3302288, 0.6339259, 0.7801172, 0, 0.2745098, 1, 1,
0.3362263, -0.09632963, 1.197628, 0, 0.2666667, 1, 1,
0.3402523, -0.349447, 1.908214, 0, 0.2627451, 1, 1,
0.3433408, -1.944492, 3.840708, 0, 0.254902, 1, 1,
0.3437923, -1.638775, 1.686517, 0, 0.2509804, 1, 1,
0.3477539, 1.589384, -1.155504, 0, 0.2431373, 1, 1,
0.3492044, 2.775922, -2.277434, 0, 0.2392157, 1, 1,
0.3511088, 0.7562177, 1.154861, 0, 0.2313726, 1, 1,
0.3512948, 1.229597, 1.093407, 0, 0.227451, 1, 1,
0.3522864, 0.3514622, 2.609343, 0, 0.2196078, 1, 1,
0.3555858, 0.4268857, -0.6094645, 0, 0.2156863, 1, 1,
0.3602581, -2.513848, 1.585278, 0, 0.2078431, 1, 1,
0.3617497, -0.4307951, 1.284977, 0, 0.2039216, 1, 1,
0.3620511, 0.7267032, 1.409807, 0, 0.1960784, 1, 1,
0.3623896, 1.141105, -0.5333102, 0, 0.1882353, 1, 1,
0.3636892, -0.4035223, 1.489406, 0, 0.1843137, 1, 1,
0.3654045, 0.03159656, 2.701392, 0, 0.1764706, 1, 1,
0.3709571, 0.8466132, 0.520318, 0, 0.172549, 1, 1,
0.3740875, -0.01262511, 0.06019505, 0, 0.1647059, 1, 1,
0.3742826, -0.676648, 3.808923, 0, 0.1607843, 1, 1,
0.3757514, -0.6041313, 3.604635, 0, 0.1529412, 1, 1,
0.3817113, 0.4227655, 0.4921039, 0, 0.1490196, 1, 1,
0.3832612, -1.657929, 1.790394, 0, 0.1411765, 1, 1,
0.391986, 0.307084, 1.832328, 0, 0.1372549, 1, 1,
0.3932023, 0.3529315, 1.020699, 0, 0.1294118, 1, 1,
0.3988899, -0.725139, 2.219922, 0, 0.1254902, 1, 1,
0.4043549, -1.166925, 3.734003, 0, 0.1176471, 1, 1,
0.4046268, -0.3159981, 2.388716, 0, 0.1137255, 1, 1,
0.4071509, 0.8496062, 0.8693169, 0, 0.1058824, 1, 1,
0.4074023, 0.2839411, 1.352286, 0, 0.09803922, 1, 1,
0.4077757, 1.750981, -0.02173724, 0, 0.09411765, 1, 1,
0.4113669, -0.5090241, 2.613817, 0, 0.08627451, 1, 1,
0.4118725, -1.096748, 1.791393, 0, 0.08235294, 1, 1,
0.4163503, 0.3001548, 1.890576, 0, 0.07450981, 1, 1,
0.4163767, 0.2140899, 1.914916, 0, 0.07058824, 1, 1,
0.4177524, 0.2287758, 1.501388, 0, 0.0627451, 1, 1,
0.4202521, 0.1346676, 2.318594, 0, 0.05882353, 1, 1,
0.4236497, 1.154759, 0.08567949, 0, 0.05098039, 1, 1,
0.4240556, -0.1667118, 1.330145, 0, 0.04705882, 1, 1,
0.4257456, 0.03864685, 1.721223, 0, 0.03921569, 1, 1,
0.4263135, 0.3211501, 2.747546, 0, 0.03529412, 1, 1,
0.4291048, 0.04468962, 2.086966, 0, 0.02745098, 1, 1,
0.4297344, 1.560859, -1.01255, 0, 0.02352941, 1, 1,
0.4303248, 0.09749635, 0.6619763, 0, 0.01568628, 1, 1,
0.4331406, -1.076845, 2.772857, 0, 0.01176471, 1, 1,
0.4345377, 0.4797819, 0.09421739, 0, 0.003921569, 1, 1,
0.4378302, -0.8280683, 1.608426, 0.003921569, 0, 1, 1,
0.4389122, 1.207497, 1.864713, 0.007843138, 0, 1, 1,
0.4400516, 1.197292, 0.2098806, 0.01568628, 0, 1, 1,
0.4404681, 0.5070204, 2.549278, 0.01960784, 0, 1, 1,
0.4435696, -2.307112, 4.197543, 0.02745098, 0, 1, 1,
0.4471923, -0.9754162, 3.369424, 0.03137255, 0, 1, 1,
0.4478372, -0.4419841, 3.608826, 0.03921569, 0, 1, 1,
0.4484484, -1.194308, 3.165956, 0.04313726, 0, 1, 1,
0.4495821, 1.369847, 1.225582, 0.05098039, 0, 1, 1,
0.4526895, 0.157904, 0.5810802, 0.05490196, 0, 1, 1,
0.4592489, -0.01613149, 2.204156, 0.0627451, 0, 1, 1,
0.4602067, -0.3598253, -0.2816449, 0.06666667, 0, 1, 1,
0.4609415, 0.575129, 0.004567572, 0.07450981, 0, 1, 1,
0.4631144, 1.072132, 0.7908041, 0.07843138, 0, 1, 1,
0.4658199, 0.500232, 2.737499, 0.08627451, 0, 1, 1,
0.4662044, -0.3296347, 1.200475, 0.09019608, 0, 1, 1,
0.470125, 0.2987182, 2.416197, 0.09803922, 0, 1, 1,
0.4750849, 0.7277946, -0.05328497, 0.1058824, 0, 1, 1,
0.4793274, -1.197688, 2.552147, 0.1098039, 0, 1, 1,
0.480322, -0.1616917, 1.494479, 0.1176471, 0, 1, 1,
0.4803765, -0.4213426, 1.096528, 0.1215686, 0, 1, 1,
0.4829752, -0.08565426, 2.475389, 0.1294118, 0, 1, 1,
0.4840095, 0.841342, 1.513527, 0.1333333, 0, 1, 1,
0.4845794, 0.8614761, 0.5318453, 0.1411765, 0, 1, 1,
0.4868644, 1.939934, 2.093866, 0.145098, 0, 1, 1,
0.4928924, 0.3670218, 1.677184, 0.1529412, 0, 1, 1,
0.4931521, 0.4917257, 0.8580545, 0.1568628, 0, 1, 1,
0.4998535, -1.404389, 2.3467, 0.1647059, 0, 1, 1,
0.5010298, -0.2387471, 0.4077861, 0.1686275, 0, 1, 1,
0.502333, -0.5574508, 4.178901, 0.1764706, 0, 1, 1,
0.5094207, 0.4216134, 0.257954, 0.1803922, 0, 1, 1,
0.516895, -2.149986, 4.195294, 0.1882353, 0, 1, 1,
0.5301535, -0.7606716, 1.056968, 0.1921569, 0, 1, 1,
0.5338847, 0.5165034, 1.651093, 0.2, 0, 1, 1,
0.5343874, -0.4712149, 2.868176, 0.2078431, 0, 1, 1,
0.5383537, 0.4894969, 0.7028762, 0.2117647, 0, 1, 1,
0.5389825, -0.4293615, 2.718218, 0.2196078, 0, 1, 1,
0.5405949, 0.7330377, 0.627362, 0.2235294, 0, 1, 1,
0.5444608, 0.5881107, 0.7999789, 0.2313726, 0, 1, 1,
0.5520098, 0.5070679, 1.97687, 0.2352941, 0, 1, 1,
0.5526798, 0.7020602, 0.9007402, 0.2431373, 0, 1, 1,
0.5530583, -1.207353, 2.563662, 0.2470588, 0, 1, 1,
0.5540333, -0.6545121, 2.247239, 0.254902, 0, 1, 1,
0.5552368, 1.16317, -1.415427, 0.2588235, 0, 1, 1,
0.5572476, -0.01386974, 0.5543767, 0.2666667, 0, 1, 1,
0.5588466, 0.1914974, 1.73519, 0.2705882, 0, 1, 1,
0.5602663, 1.86809, 0.8957685, 0.2784314, 0, 1, 1,
0.5628914, 0.6633501, 1.19621, 0.282353, 0, 1, 1,
0.5629292, -0.614245, 1.065941, 0.2901961, 0, 1, 1,
0.572087, 0.1135464, 1.617501, 0.2941177, 0, 1, 1,
0.5860581, 2.001704, 0.6283547, 0.3019608, 0, 1, 1,
0.5955727, 0.7294719, 0.02408084, 0.3098039, 0, 1, 1,
0.5971264, 0.8655308, 1.736055, 0.3137255, 0, 1, 1,
0.5988365, 0.6235058, 0.4616401, 0.3215686, 0, 1, 1,
0.6022706, -0.5145401, 2.580024, 0.3254902, 0, 1, 1,
0.602965, 2.833679, 0.452432, 0.3333333, 0, 1, 1,
0.6083269, 1.80063, 1.721547, 0.3372549, 0, 1, 1,
0.6102704, -0.696744, 0.6399665, 0.345098, 0, 1, 1,
0.610876, -0.3739359, 2.997641, 0.3490196, 0, 1, 1,
0.6195619, 0.2892768, 0.9640125, 0.3568628, 0, 1, 1,
0.6215034, 0.3997723, -0.07752248, 0.3607843, 0, 1, 1,
0.6244497, -0.1835291, 2.30895, 0.3686275, 0, 1, 1,
0.6252244, -0.04560176, 0.4749643, 0.372549, 0, 1, 1,
0.6263541, -0.5346914, 2.856687, 0.3803922, 0, 1, 1,
0.6389668, 0.8851889, 1.795296, 0.3843137, 0, 1, 1,
0.6493157, -1.043485, 1.29556, 0.3921569, 0, 1, 1,
0.6537282, 0.9749293, 0.3445501, 0.3960784, 0, 1, 1,
0.6631376, 0.04544948, 1.810563, 0.4039216, 0, 1, 1,
0.6670923, 1.600538, 0.4354105, 0.4117647, 0, 1, 1,
0.669706, 0.1952505, 1.634136, 0.4156863, 0, 1, 1,
0.6713206, 0.1766407, 0.42845, 0.4235294, 0, 1, 1,
0.6726354, -0.5757049, 1.094664, 0.427451, 0, 1, 1,
0.673479, 0.207811, 0.9789127, 0.4352941, 0, 1, 1,
0.6745535, -0.477473, 1.791589, 0.4392157, 0, 1, 1,
0.6777579, -0.6561436, 1.691445, 0.4470588, 0, 1, 1,
0.6822625, -0.7226537, 3.719518, 0.4509804, 0, 1, 1,
0.685021, 0.7482636, -0.9518671, 0.4588235, 0, 1, 1,
0.6858346, -0.5245613, 0.9451618, 0.4627451, 0, 1, 1,
0.6906035, -1.583604, 2.924846, 0.4705882, 0, 1, 1,
0.6913424, -0.505359, 2.215966, 0.4745098, 0, 1, 1,
0.6947277, -0.5659373, 1.939912, 0.4823529, 0, 1, 1,
0.6975309, 0.4135842, 0.8022509, 0.4862745, 0, 1, 1,
0.6987438, -0.6668257, 2.701776, 0.4941176, 0, 1, 1,
0.702493, -1.104508, 2.910995, 0.5019608, 0, 1, 1,
0.7041623, -0.4299867, 2.430937, 0.5058824, 0, 1, 1,
0.7064404, -0.8902982, 1.888447, 0.5137255, 0, 1, 1,
0.7069106, -0.8374603, 2.543663, 0.5176471, 0, 1, 1,
0.7073523, 0.7879822, 0.6897039, 0.5254902, 0, 1, 1,
0.7095046, -2.716084, 3.842384, 0.5294118, 0, 1, 1,
0.7127985, 1.364916, 0.699254, 0.5372549, 0, 1, 1,
0.7154779, 0.264442, -0.002859352, 0.5411765, 0, 1, 1,
0.7163283, -0.8839616, 3.2942, 0.5490196, 0, 1, 1,
0.7166377, -0.1206461, 0.3406569, 0.5529412, 0, 1, 1,
0.7175709, -0.5443673, 1.513897, 0.5607843, 0, 1, 1,
0.7185335, -0.5350058, 1.480779, 0.5647059, 0, 1, 1,
0.7233737, 1.553895, -0.7351304, 0.572549, 0, 1, 1,
0.7259369, -0.126596, 1.529777, 0.5764706, 0, 1, 1,
0.7314971, 0.8387497, -1.090474, 0.5843138, 0, 1, 1,
0.7321282, -0.4424685, 2.883096, 0.5882353, 0, 1, 1,
0.7324933, -0.4334093, 2.084081, 0.5960785, 0, 1, 1,
0.7335445, 0.7853684, 0.3606369, 0.6039216, 0, 1, 1,
0.7376962, -0.9758745, 2.873222, 0.6078432, 0, 1, 1,
0.7379559, 1.43037, 0.8297606, 0.6156863, 0, 1, 1,
0.7444436, 0.4535815, 1.81627, 0.6196079, 0, 1, 1,
0.7451459, 0.4715962, 2.817567, 0.627451, 0, 1, 1,
0.747501, -1.465109, 0.3846848, 0.6313726, 0, 1, 1,
0.7559242, -0.5810225, 3.476469, 0.6392157, 0, 1, 1,
0.7564626, 0.868656, -1.37915, 0.6431373, 0, 1, 1,
0.7608922, -0.1532666, 2.577237, 0.6509804, 0, 1, 1,
0.7614594, -2.071495, 1.78076, 0.654902, 0, 1, 1,
0.7709484, 0.6002033, 1.38359, 0.6627451, 0, 1, 1,
0.7815879, -1.008963, 4.183111, 0.6666667, 0, 1, 1,
0.7875339, -0.1888329, 1.114747, 0.6745098, 0, 1, 1,
0.7933517, 0.5676765, -1.676876, 0.6784314, 0, 1, 1,
0.79493, 0.236641, 1.871122, 0.6862745, 0, 1, 1,
0.7958795, -0.4228083, 1.587912, 0.6901961, 0, 1, 1,
0.8002854, 0.4238379, 1.467527, 0.6980392, 0, 1, 1,
0.8054433, -0.7887217, 3.119134, 0.7058824, 0, 1, 1,
0.8073621, 0.1181957, 0.3921259, 0.7098039, 0, 1, 1,
0.8078129, -0.2476675, 1.313502, 0.7176471, 0, 1, 1,
0.8133586, -1.625755, 1.467042, 0.7215686, 0, 1, 1,
0.8138095, -1.167529, 2.684454, 0.7294118, 0, 1, 1,
0.815048, 0.4516689, -0.5623614, 0.7333333, 0, 1, 1,
0.8195059, 0.09462967, 2.997231, 0.7411765, 0, 1, 1,
0.82293, -0.7865892, 3.103335, 0.7450981, 0, 1, 1,
0.8243223, 1.641161, -0.06572793, 0.7529412, 0, 1, 1,
0.8372871, 1.084639, -0.5476292, 0.7568628, 0, 1, 1,
0.8377613, -1.597401, 2.430599, 0.7647059, 0, 1, 1,
0.8465607, -2.096658, 3.329114, 0.7686275, 0, 1, 1,
0.8467525, 0.6864753, 2.388612, 0.7764706, 0, 1, 1,
0.8477658, 0.05640737, 2.631478, 0.7803922, 0, 1, 1,
0.8478467, -0.1101907, 1.591183, 0.7882353, 0, 1, 1,
0.8528998, -0.2094122, 4.346142, 0.7921569, 0, 1, 1,
0.8566274, 0.0848548, 1.548989, 0.8, 0, 1, 1,
0.8627052, -0.4558685, 1.726149, 0.8078431, 0, 1, 1,
0.8726485, 0.3330102, 2.065026, 0.8117647, 0, 1, 1,
0.8775416, 0.4876855, 1.54384, 0.8196079, 0, 1, 1,
0.8834034, -0.177885, 2.548203, 0.8235294, 0, 1, 1,
0.8840985, -0.02871536, 2.48676, 0.8313726, 0, 1, 1,
0.894443, -0.6065801, 2.544408, 0.8352941, 0, 1, 1,
0.9013611, 0.1992634, 1.475868, 0.8431373, 0, 1, 1,
0.9015875, 1.120706, 0.4452154, 0.8470588, 0, 1, 1,
0.9029546, -0.4805177, -0.2081281, 0.854902, 0, 1, 1,
0.9046198, 1.04481, 0.579599, 0.8588235, 0, 1, 1,
0.9154845, 1.019067, -0.6448238, 0.8666667, 0, 1, 1,
0.9210495, 2.121167, 0.1584469, 0.8705882, 0, 1, 1,
0.9225734, 0.592532, 0.104997, 0.8784314, 0, 1, 1,
0.9244072, -0.08330478, -0.6281317, 0.8823529, 0, 1, 1,
0.9286527, -0.499934, 1.826475, 0.8901961, 0, 1, 1,
0.9287317, -1.318373, 3.085529, 0.8941177, 0, 1, 1,
0.9316952, 1.805679, -0.168714, 0.9019608, 0, 1, 1,
0.9333228, 1.363399, 1.526711, 0.9098039, 0, 1, 1,
0.9489335, -0.6450974, 2.638255, 0.9137255, 0, 1, 1,
0.9534165, -1.885721, 3.116814, 0.9215686, 0, 1, 1,
0.9543307, 0.6409638, 1.020666, 0.9254902, 0, 1, 1,
0.9647642, 0.203659, 0.3690716, 0.9333333, 0, 1, 1,
0.9792815, 0.6982059, 0.4808975, 0.9372549, 0, 1, 1,
0.9949675, -0.1524843, 1.8038, 0.945098, 0, 1, 1,
0.9951608, 1.206306, 1.891071, 0.9490196, 0, 1, 1,
0.9962308, -0.9334923, 1.475443, 0.9568627, 0, 1, 1,
0.9984342, -0.8063819, 3.125985, 0.9607843, 0, 1, 1,
1.005878, -0.4815123, 2.469019, 0.9686275, 0, 1, 1,
1.011132, 0.7664889, 0.9137537, 0.972549, 0, 1, 1,
1.01335, -0.2587404, 1.279878, 0.9803922, 0, 1, 1,
1.016804, -0.5874606, 0.04282818, 0.9843137, 0, 1, 1,
1.017675, -0.1001464, 2.356505, 0.9921569, 0, 1, 1,
1.018672, -1.775968, 2.715029, 0.9960784, 0, 1, 1,
1.031999, -0.6716295, 2.517169, 1, 0, 0.9960784, 1,
1.036372, -0.9334981, 2.154505, 1, 0, 0.9882353, 1,
1.046496, 0.1532919, -0.1961296, 1, 0, 0.9843137, 1,
1.050038, -2.042003, 2.690787, 1, 0, 0.9764706, 1,
1.054136, -0.3574695, 3.042624, 1, 0, 0.972549, 1,
1.057513, -1.033142, 2.376431, 1, 0, 0.9647059, 1,
1.060406, 0.7397521, 3.041307, 1, 0, 0.9607843, 1,
1.065201, 0.6056268, 1.777665, 1, 0, 0.9529412, 1,
1.072841, -0.2422394, 1.525571, 1, 0, 0.9490196, 1,
1.074771, -1.277068, 2.095376, 1, 0, 0.9411765, 1,
1.080158, 0.6938899, 1.631914, 1, 0, 0.9372549, 1,
1.086968, 0.7564688, 2.666668, 1, 0, 0.9294118, 1,
1.098976, 0.1798974, 0.5693008, 1, 0, 0.9254902, 1,
1.100525, -0.3243552, 2.137104, 1, 0, 0.9176471, 1,
1.101063, 1.302079, -0.7137344, 1, 0, 0.9137255, 1,
1.101289, 0.9203877, -0.2872577, 1, 0, 0.9058824, 1,
1.108797, -0.4934771, 1.279601, 1, 0, 0.9019608, 1,
1.109838, -0.9606553, 2.197485, 1, 0, 0.8941177, 1,
1.119151, -1.414378, 0.7983868, 1, 0, 0.8862745, 1,
1.124482, -0.2562821, 0.4415105, 1, 0, 0.8823529, 1,
1.126365, -1.143508, 3.34338, 1, 0, 0.8745098, 1,
1.136972, -0.5056826, 3.596076, 1, 0, 0.8705882, 1,
1.139231, 0.6183913, 0.4656477, 1, 0, 0.8627451, 1,
1.140914, 0.8337309, -1.22527, 1, 0, 0.8588235, 1,
1.143016, 0.6824582, 1.368052, 1, 0, 0.8509804, 1,
1.144642, -0.2556573, 0.190707, 1, 0, 0.8470588, 1,
1.145023, -1.231715, 4.94636, 1, 0, 0.8392157, 1,
1.159047, -0.6643951, 2.214598, 1, 0, 0.8352941, 1,
1.164886, 0.5006616, 0.1093542, 1, 0, 0.827451, 1,
1.165294, -1.162892, 0.9778942, 1, 0, 0.8235294, 1,
1.170143, 1.054633, 1.136258, 1, 0, 0.8156863, 1,
1.174235, -0.0391592, 3.063867, 1, 0, 0.8117647, 1,
1.174561, 0.4636153, 2.406747, 1, 0, 0.8039216, 1,
1.17587, -0.8484652, 1.931486, 1, 0, 0.7960784, 1,
1.183187, -0.1621918, 1.06243, 1, 0, 0.7921569, 1,
1.191506, -1.594383, 3.19969, 1, 0, 0.7843137, 1,
1.192965, -0.001167682, 2.201277, 1, 0, 0.7803922, 1,
1.1989, 0.9952311, -0.1051276, 1, 0, 0.772549, 1,
1.202146, 0.01163945, 2.324775, 1, 0, 0.7686275, 1,
1.210762, 1.694777, 1.875929, 1, 0, 0.7607843, 1,
1.216896, 1.308313, 0.4681022, 1, 0, 0.7568628, 1,
1.217499, 1.226688, 0.03833962, 1, 0, 0.7490196, 1,
1.222976, -0.5035795, 1.72874, 1, 0, 0.7450981, 1,
1.223815, 0.3516134, 0.3507728, 1, 0, 0.7372549, 1,
1.227968, 0.07531045, 1.726117, 1, 0, 0.7333333, 1,
1.23194, 0.1899862, 1.354877, 1, 0, 0.7254902, 1,
1.235171, -0.5996387, 0.9777747, 1, 0, 0.7215686, 1,
1.244133, 0.7323312, 1.964397, 1, 0, 0.7137255, 1,
1.250133, 0.4721647, 2.726279, 1, 0, 0.7098039, 1,
1.250465, 0.7138705, -0.9541144, 1, 0, 0.7019608, 1,
1.25202, 0.9387427, 0.5751761, 1, 0, 0.6941177, 1,
1.252097, -0.8202524, 2.46803, 1, 0, 0.6901961, 1,
1.256861, 0.694059, 1.609102, 1, 0, 0.682353, 1,
1.278909, -0.4215213, 3.084022, 1, 0, 0.6784314, 1,
1.281971, 0.9122668, 1.003299, 1, 0, 0.6705883, 1,
1.284669, 1.036788, 0.6053384, 1, 0, 0.6666667, 1,
1.2885, -0.5009084, 2.923355, 1, 0, 0.6588235, 1,
1.288748, -0.08499541, 1.032724, 1, 0, 0.654902, 1,
1.293611, -0.8181337, 2.882639, 1, 0, 0.6470588, 1,
1.307348, -1.164587, 3.529492, 1, 0, 0.6431373, 1,
1.311025, 0.1773553, 3.345263, 1, 0, 0.6352941, 1,
1.313651, -0.80681, 2.881551, 1, 0, 0.6313726, 1,
1.318651, 0.1883081, 0.4366064, 1, 0, 0.6235294, 1,
1.318809, -0.6457143, 0.9600614, 1, 0, 0.6196079, 1,
1.321034, -1.218923, 2.348496, 1, 0, 0.6117647, 1,
1.32905, -0.5203963, 2.261359, 1, 0, 0.6078432, 1,
1.335839, -1.21464, 0.6019884, 1, 0, 0.6, 1,
1.336771, 1.024594, 0.2736805, 1, 0, 0.5921569, 1,
1.358205, 0.315717, 0.380111, 1, 0, 0.5882353, 1,
1.362476, 0.2123539, 2.525196, 1, 0, 0.5803922, 1,
1.363338, 0.4243555, 2.483812, 1, 0, 0.5764706, 1,
1.372623, -0.8015923, 0.9347634, 1, 0, 0.5686275, 1,
1.377873, 0.1016035, 1.22033, 1, 0, 0.5647059, 1,
1.381579, 0.1739908, 1.081843, 1, 0, 0.5568628, 1,
1.390025, 1.273099, 0.6425097, 1, 0, 0.5529412, 1,
1.391042, -1.06908, 2.624406, 1, 0, 0.5450981, 1,
1.396257, 1.832272, 1.164401, 1, 0, 0.5411765, 1,
1.3965, -0.5620571, 2.885974, 1, 0, 0.5333334, 1,
1.398059, 0.8446204, 0.2655506, 1, 0, 0.5294118, 1,
1.411167, 0.6429113, 0.6276765, 1, 0, 0.5215687, 1,
1.421764, -0.880319, 2.96373, 1, 0, 0.5176471, 1,
1.423255, -0.1873174, 1.124266, 1, 0, 0.509804, 1,
1.439886, 1.260284, 0.08939981, 1, 0, 0.5058824, 1,
1.444335, 0.9927653, 0.5049976, 1, 0, 0.4980392, 1,
1.445892, 1.640488, 0.5104627, 1, 0, 0.4901961, 1,
1.44754, 0.5898581, 1.383187, 1, 0, 0.4862745, 1,
1.452773, 0.05586376, 1.057166, 1, 0, 0.4784314, 1,
1.459238, 0.1275756, 0.6117195, 1, 0, 0.4745098, 1,
1.472657, -1.202198, 3.066254, 1, 0, 0.4666667, 1,
1.47727, -0.7259302, 0.863239, 1, 0, 0.4627451, 1,
1.48838, -1.738796, 2.518148, 1, 0, 0.454902, 1,
1.490379, 1.448869, 0.5231632, 1, 0, 0.4509804, 1,
1.494545, 1.36408, -0.902512, 1, 0, 0.4431373, 1,
1.515301, 0.5196749, 0.8901308, 1, 0, 0.4392157, 1,
1.530416, 1.050344, -1.060923, 1, 0, 0.4313726, 1,
1.535775, 0.7359473, 3.064315, 1, 0, 0.427451, 1,
1.546373, -0.1715249, 1.685685, 1, 0, 0.4196078, 1,
1.550097, -1.10118, 3.667922, 1, 0, 0.4156863, 1,
1.552429, -0.3552453, 3.935222, 1, 0, 0.4078431, 1,
1.553893, -1.652041, 1.612332, 1, 0, 0.4039216, 1,
1.555378, -1.274569, 2.196216, 1, 0, 0.3960784, 1,
1.560014, 1.976213, 0.7183285, 1, 0, 0.3882353, 1,
1.560972, 0.7791256, 0.01311101, 1, 0, 0.3843137, 1,
1.561658, -1.073618, 3.206831, 1, 0, 0.3764706, 1,
1.564089, 1.185137, 0.849539, 1, 0, 0.372549, 1,
1.569147, 1.14365, 1.109693, 1, 0, 0.3647059, 1,
1.570661, 0.7379936, 2.184884, 1, 0, 0.3607843, 1,
1.578935, 0.9965666, 1.255406, 1, 0, 0.3529412, 1,
1.578948, -0.2650402, 0.9970111, 1, 0, 0.3490196, 1,
1.591663, 0.7112606, 2.556167, 1, 0, 0.3411765, 1,
1.602022, 0.4809538, 1.285721, 1, 0, 0.3372549, 1,
1.606665, -0.8223446, 0.8783271, 1, 0, 0.3294118, 1,
1.622729, -0.6190351, -0.08812736, 1, 0, 0.3254902, 1,
1.635724, 1.266713, -0.1364359, 1, 0, 0.3176471, 1,
1.636523, -1.217713, 1.655163, 1, 0, 0.3137255, 1,
1.652294, -1.457769, 1.929718, 1, 0, 0.3058824, 1,
1.658053, -1.406306, 1.421355, 1, 0, 0.2980392, 1,
1.66324, 1.340836, 0.4304738, 1, 0, 0.2941177, 1,
1.671269, 0.9992883, 0.6308433, 1, 0, 0.2862745, 1,
1.689099, 0.6357472, 1.373123, 1, 0, 0.282353, 1,
1.690606, 1.107375, 1.071427, 1, 0, 0.2745098, 1,
1.700578, -1.068277, 0.7732348, 1, 0, 0.2705882, 1,
1.702287, -1.628675, 2.562742, 1, 0, 0.2627451, 1,
1.70507, -0.1882035, 1.181613, 1, 0, 0.2588235, 1,
1.714206, -0.4554482, 4.53056, 1, 0, 0.2509804, 1,
1.740037, 0.1286208, 0.4121095, 1, 0, 0.2470588, 1,
1.75304, 1.089283, 0.3809084, 1, 0, 0.2392157, 1,
1.754968, -0.8917788, 2.366936, 1, 0, 0.2352941, 1,
1.762043, -2.245535, 2.242308, 1, 0, 0.227451, 1,
1.775214, 0.8183974, 0.4678773, 1, 0, 0.2235294, 1,
1.785084, 0.7346337, -0.02216923, 1, 0, 0.2156863, 1,
1.798291, -0.5409912, 1.850464, 1, 0, 0.2117647, 1,
1.812166, 0.09139927, 2.077249, 1, 0, 0.2039216, 1,
1.827162, 0.6691623, 1.447467, 1, 0, 0.1960784, 1,
1.84712, -0.1519736, 0.2267435, 1, 0, 0.1921569, 1,
1.871472, -1.25955, 3.101316, 1, 0, 0.1843137, 1,
1.88732, 0.2922324, 1.804882, 1, 0, 0.1803922, 1,
1.933302, 0.841528, 2.762905, 1, 0, 0.172549, 1,
1.934194, 0.105361, 0.9503576, 1, 0, 0.1686275, 1,
1.935441, -0.3628618, 1.264333, 1, 0, 0.1607843, 1,
1.939263, -0.2627956, 0.9098867, 1, 0, 0.1568628, 1,
1.94026, 0.7853439, 1.261252, 1, 0, 0.1490196, 1,
1.94947, -0.5868577, 1.507401, 1, 0, 0.145098, 1,
1.951678, 0.9565447, 2.763227, 1, 0, 0.1372549, 1,
2.024184, 1.384372, 0.6005654, 1, 0, 0.1333333, 1,
2.034504, -0.9315714, 0.3743438, 1, 0, 0.1254902, 1,
2.037577, 0.9699305, 2.078269, 1, 0, 0.1215686, 1,
2.073476, 1.311906, 1.26237, 1, 0, 0.1137255, 1,
2.081884, -1.099005, 1.696379, 1, 0, 0.1098039, 1,
2.156403, 1.584196, 1.09478, 1, 0, 0.1019608, 1,
2.164529, 0.4245358, 1.233022, 1, 0, 0.09411765, 1,
2.186135, 1.770993, -1.281837, 1, 0, 0.09019608, 1,
2.389689, 0.89276, 0.6977977, 1, 0, 0.08235294, 1,
2.404261, 1.922339, 1.559313, 1, 0, 0.07843138, 1,
2.525206, 0.6790841, 2.23252, 1, 0, 0.07058824, 1,
2.614682, -1.748135, 0.687159, 1, 0, 0.06666667, 1,
2.72438, 0.8505463, 1.613551, 1, 0, 0.05882353, 1,
2.725614, 1.254592, 0.6759846, 1, 0, 0.05490196, 1,
2.906432, -0.5064443, 1.807082, 1, 0, 0.04705882, 1,
2.918921, 0.2689853, 2.146363, 1, 0, 0.04313726, 1,
2.933888, -0.7646825, 3.256749, 1, 0, 0.03529412, 1,
2.955094, 0.5475703, 0.334491, 1, 0, 0.03137255, 1,
2.967353, 0.4267429, 2.987939, 1, 0, 0.02352941, 1,
3.002567, -0.2805833, 3.074237, 1, 0, 0.01960784, 1,
3.045468, -0.6559516, 0.6143684, 1, 0, 0.01176471, 1,
3.258361, -0.009456329, 0.4339217, 1, 0, 0.007843138, 1
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
0.1293525, -4.634989, -6.916443, 0, -0.5, 0.5, 0.5,
0.1293525, -4.634989, -6.916443, 1, -0.5, 0.5, 0.5,
0.1293525, -4.634989, -6.916443, 1, 1.5, 0.5, 0.5,
0.1293525, -4.634989, -6.916443, 0, 1.5, 0.5, 0.5
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
-4.06039, -0.02063394, -6.916443, 0, -0.5, 0.5, 0.5,
-4.06039, -0.02063394, -6.916443, 1, -0.5, 0.5, 0.5,
-4.06039, -0.02063394, -6.916443, 1, 1.5, 0.5, 0.5,
-4.06039, -0.02063394, -6.916443, 0, 1.5, 0.5, 0.5
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
-4.06039, -4.634989, 0.6984391, 0, -0.5, 0.5, 0.5,
-4.06039, -4.634989, 0.6984391, 1, -0.5, 0.5, 0.5,
-4.06039, -4.634989, 0.6984391, 1, 1.5, 0.5, 0.5,
-4.06039, -4.634989, 0.6984391, 0, 1.5, 0.5, 0.5
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
-2, -3.570138, -5.159163,
3, -3.570138, -5.159163,
-2, -3.570138, -5.159163,
-2, -3.747613, -5.452043,
-1, -3.570138, -5.159163,
-1, -3.747613, -5.452043,
0, -3.570138, -5.159163,
0, -3.747613, -5.452043,
1, -3.570138, -5.159163,
1, -3.747613, -5.452043,
2, -3.570138, -5.159163,
2, -3.747613, -5.452043,
3, -3.570138, -5.159163,
3, -3.747613, -5.452043
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
-2, -4.102563, -6.037803, 0, -0.5, 0.5, 0.5,
-2, -4.102563, -6.037803, 1, -0.5, 0.5, 0.5,
-2, -4.102563, -6.037803, 1, 1.5, 0.5, 0.5,
-2, -4.102563, -6.037803, 0, 1.5, 0.5, 0.5,
-1, -4.102563, -6.037803, 0, -0.5, 0.5, 0.5,
-1, -4.102563, -6.037803, 1, -0.5, 0.5, 0.5,
-1, -4.102563, -6.037803, 1, 1.5, 0.5, 0.5,
-1, -4.102563, -6.037803, 0, 1.5, 0.5, 0.5,
0, -4.102563, -6.037803, 0, -0.5, 0.5, 0.5,
0, -4.102563, -6.037803, 1, -0.5, 0.5, 0.5,
0, -4.102563, -6.037803, 1, 1.5, 0.5, 0.5,
0, -4.102563, -6.037803, 0, 1.5, 0.5, 0.5,
1, -4.102563, -6.037803, 0, -0.5, 0.5, 0.5,
1, -4.102563, -6.037803, 1, -0.5, 0.5, 0.5,
1, -4.102563, -6.037803, 1, 1.5, 0.5, 0.5,
1, -4.102563, -6.037803, 0, 1.5, 0.5, 0.5,
2, -4.102563, -6.037803, 0, -0.5, 0.5, 0.5,
2, -4.102563, -6.037803, 1, -0.5, 0.5, 0.5,
2, -4.102563, -6.037803, 1, 1.5, 0.5, 0.5,
2, -4.102563, -6.037803, 0, 1.5, 0.5, 0.5,
3, -4.102563, -6.037803, 0, -0.5, 0.5, 0.5,
3, -4.102563, -6.037803, 1, -0.5, 0.5, 0.5,
3, -4.102563, -6.037803, 1, 1.5, 0.5, 0.5,
3, -4.102563, -6.037803, 0, 1.5, 0.5, 0.5
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
-3.093526, -3, -5.159163,
-3.093526, 3, -5.159163,
-3.093526, -3, -5.159163,
-3.25467, -3, -5.452043,
-3.093526, -2, -5.159163,
-3.25467, -2, -5.452043,
-3.093526, -1, -5.159163,
-3.25467, -1, -5.452043,
-3.093526, 0, -5.159163,
-3.25467, 0, -5.452043,
-3.093526, 1, -5.159163,
-3.25467, 1, -5.452043,
-3.093526, 2, -5.159163,
-3.25467, 2, -5.452043,
-3.093526, 3, -5.159163,
-3.25467, 3, -5.452043
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
-3.576958, -3, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, -3, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, -3, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, -3, -6.037803, 0, 1.5, 0.5, 0.5,
-3.576958, -2, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, -2, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, -2, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, -2, -6.037803, 0, 1.5, 0.5, 0.5,
-3.576958, -1, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, -1, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, -1, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, -1, -6.037803, 0, 1.5, 0.5, 0.5,
-3.576958, 0, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, 0, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, 0, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, 0, -6.037803, 0, 1.5, 0.5, 0.5,
-3.576958, 1, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, 1, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, 1, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, 1, -6.037803, 0, 1.5, 0.5, 0.5,
-3.576958, 2, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, 2, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, 2, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, 2, -6.037803, 0, 1.5, 0.5, 0.5,
-3.576958, 3, -6.037803, 0, -0.5, 0.5, 0.5,
-3.576958, 3, -6.037803, 1, -0.5, 0.5, 0.5,
-3.576958, 3, -6.037803, 1, 1.5, 0.5, 0.5,
-3.576958, 3, -6.037803, 0, 1.5, 0.5, 0.5
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
-3.093526, -3.570138, -4,
-3.093526, -3.570138, 6,
-3.093526, -3.570138, -4,
-3.25467, -3.747613, -4,
-3.093526, -3.570138, -2,
-3.25467, -3.747613, -2,
-3.093526, -3.570138, 0,
-3.25467, -3.747613, 0,
-3.093526, -3.570138, 2,
-3.25467, -3.747613, 2,
-3.093526, -3.570138, 4,
-3.25467, -3.747613, 4,
-3.093526, -3.570138, 6,
-3.25467, -3.747613, 6
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
"4",
"6"
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
-3.576958, -4.102563, -4, 0, -0.5, 0.5, 0.5,
-3.576958, -4.102563, -4, 1, -0.5, 0.5, 0.5,
-3.576958, -4.102563, -4, 1, 1.5, 0.5, 0.5,
-3.576958, -4.102563, -4, 0, 1.5, 0.5, 0.5,
-3.576958, -4.102563, -2, 0, -0.5, 0.5, 0.5,
-3.576958, -4.102563, -2, 1, -0.5, 0.5, 0.5,
-3.576958, -4.102563, -2, 1, 1.5, 0.5, 0.5,
-3.576958, -4.102563, -2, 0, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 0, 0, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 0, 1, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 0, 1, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 0, 0, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 2, 0, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 2, 1, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 2, 1, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 2, 0, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 4, 0, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 4, 1, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 4, 1, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 4, 0, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 6, 0, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 6, 1, -0.5, 0.5, 0.5,
-3.576958, -4.102563, 6, 1, 1.5, 0.5, 0.5,
-3.576958, -4.102563, 6, 0, 1.5, 0.5, 0.5
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
-3.093526, -3.570138, -5.159163,
-3.093526, 3.52887, -5.159163,
-3.093526, -3.570138, 6.556041,
-3.093526, 3.52887, 6.556041,
-3.093526, -3.570138, -5.159163,
-3.093526, -3.570138, 6.556041,
-3.093526, 3.52887, -5.159163,
-3.093526, 3.52887, 6.556041,
-3.093526, -3.570138, -5.159163,
3.352231, -3.570138, -5.159163,
-3.093526, -3.570138, 6.556041,
3.352231, -3.570138, 6.556041,
-3.093526, 3.52887, -5.159163,
3.352231, 3.52887, -5.159163,
-3.093526, 3.52887, 6.556041,
3.352231, 3.52887, 6.556041,
3.352231, -3.570138, -5.159163,
3.352231, 3.52887, -5.159163,
3.352231, -3.570138, 6.556041,
3.352231, 3.52887, 6.556041,
3.352231, -3.570138, -5.159163,
3.352231, -3.570138, 6.556041,
3.352231, 3.52887, -5.159163,
3.352231, 3.52887, 6.556041
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
var radius = 8.083938;
var distance = 35.96635;
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
mvMatrix.translate( -0.1293525, 0.02063394, -0.6984391 );
mvMatrix.scale( 1.35601, 1.23123, 0.7460828 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.96635);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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


