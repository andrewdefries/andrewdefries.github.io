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
-3.473028, -0.8499835, -2.365309, 1, 0, 0, 1,
-2.665834, -0.6033581, -3.15125, 1, 0.007843138, 0, 1,
-2.618112, 0.272521, -1.77654, 1, 0.01176471, 0, 1,
-2.592262, -0.3421642, -3.407657, 1, 0.01960784, 0, 1,
-2.585105, 0.856694, -1.943672, 1, 0.02352941, 0, 1,
-2.542051, -1.287919, -1.096931, 1, 0.03137255, 0, 1,
-2.420256, -0.7946766, -0.2011977, 1, 0.03529412, 0, 1,
-2.285553, -1.014956, -1.177363, 1, 0.04313726, 0, 1,
-2.259117, 0.4236411, -2.021977, 1, 0.04705882, 0, 1,
-2.235856, -2.416056, -3.592587, 1, 0.05490196, 0, 1,
-2.201487, 0.8692758, -0.3196395, 1, 0.05882353, 0, 1,
-2.142262, 1.252882, -0.4172107, 1, 0.06666667, 0, 1,
-2.139326, -0.1263438, -2.888811, 1, 0.07058824, 0, 1,
-2.116571, -1.317846, -1.899569, 1, 0.07843138, 0, 1,
-2.093093, -0.5430883, -0.6110827, 1, 0.08235294, 0, 1,
-2.09239, -0.2732337, -3.872612, 1, 0.09019608, 0, 1,
-2.080119, 0.7505506, -1.341791, 1, 0.09411765, 0, 1,
-2.043594, 0.6101713, -1.987265, 1, 0.1019608, 0, 1,
-2.037855, -0.2637031, -1.415609, 1, 0.1098039, 0, 1,
-2.036783, -0.3690268, -4.29636, 1, 0.1137255, 0, 1,
-2.02908, -1.299129, -2.293714, 1, 0.1215686, 0, 1,
-2.007508, -0.6059209, -1.663215, 1, 0.1254902, 0, 1,
-1.98452, 0.4251152, -1.318029, 1, 0.1333333, 0, 1,
-1.981054, 0.7131596, -0.8083944, 1, 0.1372549, 0, 1,
-1.889168, 1.887691, -1.557197, 1, 0.145098, 0, 1,
-1.879701, 0.1647417, -3.857523, 1, 0.1490196, 0, 1,
-1.874354, 0.3784726, -1.870986, 1, 0.1568628, 0, 1,
-1.857962, -0.201617, -1.733526, 1, 0.1607843, 0, 1,
-1.856037, 1.542419, -0.9504843, 1, 0.1686275, 0, 1,
-1.844737, 0.7538822, 0.0565025, 1, 0.172549, 0, 1,
-1.844359, -1.636023, -2.369586, 1, 0.1803922, 0, 1,
-1.836308, 0.8904677, 1.418276, 1, 0.1843137, 0, 1,
-1.830997, 0.2131703, -1.416317, 1, 0.1921569, 0, 1,
-1.813453, 0.9104, -2.718378, 1, 0.1960784, 0, 1,
-1.798793, 0.6098405, -3.485805, 1, 0.2039216, 0, 1,
-1.797145, -0.4557284, -0.207762, 1, 0.2117647, 0, 1,
-1.796558, -1.051156, -1.624141, 1, 0.2156863, 0, 1,
-1.782622, 0.8591332, -0.6024523, 1, 0.2235294, 0, 1,
-1.756947, 0.8064955, -1.605264, 1, 0.227451, 0, 1,
-1.752652, -0.465384, -1.898418, 1, 0.2352941, 0, 1,
-1.747194, 0.2337038, -1.087619, 1, 0.2392157, 0, 1,
-1.727106, 0.6478003, -2.099536, 1, 0.2470588, 0, 1,
-1.724846, -0.4449661, -2.549444, 1, 0.2509804, 0, 1,
-1.720535, -1.207636, -3.866558, 1, 0.2588235, 0, 1,
-1.713346, -0.2846124, -2.457344, 1, 0.2627451, 0, 1,
-1.708746, -0.9756117, -2.555993, 1, 0.2705882, 0, 1,
-1.707057, -1.122711, -0.9708232, 1, 0.2745098, 0, 1,
-1.696535, -0.1615599, -0.2300082, 1, 0.282353, 0, 1,
-1.693329, 0.4901406, -1.148029, 1, 0.2862745, 0, 1,
-1.685244, -0.3058709, -1.428724, 1, 0.2941177, 0, 1,
-1.683051, 2.363802, -0.1389468, 1, 0.3019608, 0, 1,
-1.65688, -1.639849, -2.291747, 1, 0.3058824, 0, 1,
-1.650133, 0.9402495, -0.4665227, 1, 0.3137255, 0, 1,
-1.619822, -0.7612039, -1.171676, 1, 0.3176471, 0, 1,
-1.579514, -0.3606102, -3.414225, 1, 0.3254902, 0, 1,
-1.56965, 0.5632197, -0.6769568, 1, 0.3294118, 0, 1,
-1.566388, 0.688123, -0.908066, 1, 0.3372549, 0, 1,
-1.558405, 0.1522924, -0.6283363, 1, 0.3411765, 0, 1,
-1.55101, -0.4134989, -4.468693, 1, 0.3490196, 0, 1,
-1.544787, 0.7483001, -1.312621, 1, 0.3529412, 0, 1,
-1.543468, 0.2857117, -1.169743, 1, 0.3607843, 0, 1,
-1.535969, -0.1451942, -0.05050032, 1, 0.3647059, 0, 1,
-1.529927, 0.0005442057, -1.575695, 1, 0.372549, 0, 1,
-1.522419, 1.275266, -0.3929849, 1, 0.3764706, 0, 1,
-1.516043, 1.426012, -1.029995, 1, 0.3843137, 0, 1,
-1.513797, 1.432719, -0.9323817, 1, 0.3882353, 0, 1,
-1.512194, -0.1354123, -1.581471, 1, 0.3960784, 0, 1,
-1.482676, 0.9748467, 0.921914, 1, 0.4039216, 0, 1,
-1.481989, 1.144456, 1.573612, 1, 0.4078431, 0, 1,
-1.470387, 1.352967, -1.462212, 1, 0.4156863, 0, 1,
-1.448514, 0.2746591, -1.206678, 1, 0.4196078, 0, 1,
-1.447619, 0.3561036, -2.074883, 1, 0.427451, 0, 1,
-1.438022, 0.5059884, -0.1853454, 1, 0.4313726, 0, 1,
-1.437484, 1.130397, -0.1527952, 1, 0.4392157, 0, 1,
-1.428104, 0.6523322, -2.787216, 1, 0.4431373, 0, 1,
-1.424388, -0.9872885, -2.66779, 1, 0.4509804, 0, 1,
-1.423856, 0.01471565, -1.923244, 1, 0.454902, 0, 1,
-1.416919, 1.275009, -0.6041278, 1, 0.4627451, 0, 1,
-1.41496, 0.8670983, -2.355807, 1, 0.4666667, 0, 1,
-1.405833, 0.5431076, -2.778937, 1, 0.4745098, 0, 1,
-1.405216, -1.24168, -1.194307, 1, 0.4784314, 0, 1,
-1.40406, -1.429472, -2.58202, 1, 0.4862745, 0, 1,
-1.403846, -0.1693805, -1.506267, 1, 0.4901961, 0, 1,
-1.403399, 0.2000262, -1.421973, 1, 0.4980392, 0, 1,
-1.384465, -1.108422, -1.911745, 1, 0.5058824, 0, 1,
-1.383474, -1.155124, -1.339561, 1, 0.509804, 0, 1,
-1.375013, -0.5884685, -2.748016, 1, 0.5176471, 0, 1,
-1.372484, 0.6228796, -0.4907575, 1, 0.5215687, 0, 1,
-1.366536, -0.6119605, -2.4038, 1, 0.5294118, 0, 1,
-1.360909, 0.2127153, -0.9554066, 1, 0.5333334, 0, 1,
-1.35416, 1.640467, -1.046906, 1, 0.5411765, 0, 1,
-1.351646, 0.08681184, -1.09783, 1, 0.5450981, 0, 1,
-1.350222, -1.441559, -1.766203, 1, 0.5529412, 0, 1,
-1.344113, -0.3639268, -0.9447449, 1, 0.5568628, 0, 1,
-1.341212, 0.4968755, -3.430664, 1, 0.5647059, 0, 1,
-1.327605, -1.045659, -1.434852, 1, 0.5686275, 0, 1,
-1.327075, 0.3103312, -2.670489, 1, 0.5764706, 0, 1,
-1.31291, -0.5522439, -2.072596, 1, 0.5803922, 0, 1,
-1.311985, -0.3680697, -2.847658, 1, 0.5882353, 0, 1,
-1.310349, 2.000994, -1.560119, 1, 0.5921569, 0, 1,
-1.300413, -0.9744899, -2.767125, 1, 0.6, 0, 1,
-1.289105, 1.213999, -1.805126, 1, 0.6078432, 0, 1,
-1.282903, 0.6695972, -1.193113, 1, 0.6117647, 0, 1,
-1.275065, 1.367241, -1.401284, 1, 0.6196079, 0, 1,
-1.273631, 1.086048, -3.096936, 1, 0.6235294, 0, 1,
-1.266573, -0.06120492, -2.383469, 1, 0.6313726, 0, 1,
-1.254212, 0.8400121, -1.170553, 1, 0.6352941, 0, 1,
-1.250274, -1.014057, -1.704805, 1, 0.6431373, 0, 1,
-1.241183, -0.3490365, -1.697873, 1, 0.6470588, 0, 1,
-1.240818, -0.2629094, -1.064566, 1, 0.654902, 0, 1,
-1.239906, 0.2199587, -2.003628, 1, 0.6588235, 0, 1,
-1.2341, 1.648451, 0.6674736, 1, 0.6666667, 0, 1,
-1.232105, 0.6119462, 0.1549714, 1, 0.6705883, 0, 1,
-1.228471, 0.8915434, -0.8309294, 1, 0.6784314, 0, 1,
-1.217802, -0.7405673, -1.796886, 1, 0.682353, 0, 1,
-1.212574, -0.7679935, -2.16847, 1, 0.6901961, 0, 1,
-1.20898, 0.3159292, -2.029878, 1, 0.6941177, 0, 1,
-1.201265, -0.03777601, 0.3083075, 1, 0.7019608, 0, 1,
-1.187339, 2.110275, -0.9234086, 1, 0.7098039, 0, 1,
-1.18349, 0.3363161, -1.176764, 1, 0.7137255, 0, 1,
-1.175512, -0.2960566, -2.409405, 1, 0.7215686, 0, 1,
-1.16829, 0.1730365, -2.588129, 1, 0.7254902, 0, 1,
-1.168181, 0.774434, -1.606825, 1, 0.7333333, 0, 1,
-1.162777, -1.396855, -2.70356, 1, 0.7372549, 0, 1,
-1.161472, -0.4890236, -2.171816, 1, 0.7450981, 0, 1,
-1.15645, 0.5530582, -0.5529592, 1, 0.7490196, 0, 1,
-1.149957, -0.3011553, -0.6418089, 1, 0.7568628, 0, 1,
-1.146052, -0.8941445, -3.440827, 1, 0.7607843, 0, 1,
-1.139142, -0.2620115, -2.885364, 1, 0.7686275, 0, 1,
-1.138556, 1.10142, -0.05977434, 1, 0.772549, 0, 1,
-1.137625, 1.075072, -0.3781891, 1, 0.7803922, 0, 1,
-1.136989, 0.3950323, -2.023044, 1, 0.7843137, 0, 1,
-1.133994, 1.8557, -0.4963259, 1, 0.7921569, 0, 1,
-1.130611, -0.7417369, -1.295541, 1, 0.7960784, 0, 1,
-1.128057, -0.4923134, -3.001203, 1, 0.8039216, 0, 1,
-1.126628, 0.5648656, 0.3538862, 1, 0.8117647, 0, 1,
-1.11543, 0.1656184, -2.764415, 1, 0.8156863, 0, 1,
-1.113495, -0.06123677, -0.4227497, 1, 0.8235294, 0, 1,
-1.111377, 1.491179, -0.6053941, 1, 0.827451, 0, 1,
-1.111292, 1.608241, -0.1615072, 1, 0.8352941, 0, 1,
-1.110894, -1.130868, -0.2893412, 1, 0.8392157, 0, 1,
-1.109699, -0.2389909, -2.854036, 1, 0.8470588, 0, 1,
-1.108214, 0.397282, -1.110656, 1, 0.8509804, 0, 1,
-1.10071, 1.681081, -1.324739, 1, 0.8588235, 0, 1,
-1.099592, 0.7663111, -2.283093, 1, 0.8627451, 0, 1,
-1.095741, -0.5859492, -2.081667, 1, 0.8705882, 0, 1,
-1.085665, -0.6205998, 0.1839519, 1, 0.8745098, 0, 1,
-1.052056, 0.6210146, 0.4749026, 1, 0.8823529, 0, 1,
-1.050131, 1.551767, -1.116531, 1, 0.8862745, 0, 1,
-1.048914, -0.77022, -4.622572, 1, 0.8941177, 0, 1,
-1.044402, 0.3148401, -2.239374, 1, 0.8980392, 0, 1,
-1.030306, -2.6382, -2.863402, 1, 0.9058824, 0, 1,
-1.027205, 0.07586096, -1.333829, 1, 0.9137255, 0, 1,
-1.021147, -1.026305, -2.415197, 1, 0.9176471, 0, 1,
-1.019822, -0.05722997, -3.478152, 1, 0.9254902, 0, 1,
-1.019709, -0.5568011, -1.84797, 1, 0.9294118, 0, 1,
-1.015148, 0.5843919, -0.6558242, 1, 0.9372549, 0, 1,
-1.015121, 0.2711177, -0.8895398, 1, 0.9411765, 0, 1,
-1.013518, -0.3244174, -1.657562, 1, 0.9490196, 0, 1,
-1.012738, 0.8334381, -1.032796, 1, 0.9529412, 0, 1,
-1.01009, -0.6423345, -1.040421, 1, 0.9607843, 0, 1,
-1.005112, 0.2938311, -1.909856, 1, 0.9647059, 0, 1,
-1.004914, -0.2300515, -1.316019, 1, 0.972549, 0, 1,
-1.001767, 0.777151, -1.43719, 1, 0.9764706, 0, 1,
-0.9903345, 1.038705, -0.5440684, 1, 0.9843137, 0, 1,
-0.9879152, -0.7166777, -2.391206, 1, 0.9882353, 0, 1,
-0.9748062, 0.4691669, -1.032789, 1, 0.9960784, 0, 1,
-0.9717381, -1.446916, -2.704116, 0.9960784, 1, 0, 1,
-0.9638582, -0.8580513, -4.357843, 0.9921569, 1, 0, 1,
-0.9620401, -0.04229603, -2.449512, 0.9843137, 1, 0, 1,
-0.9587113, -0.1951103, -0.05495472, 0.9803922, 1, 0, 1,
-0.9579242, -0.3365745, -1.413683, 0.972549, 1, 0, 1,
-0.9532622, 1.688714, -2.638773, 0.9686275, 1, 0, 1,
-0.9524148, 0.4090667, -0.6752709, 0.9607843, 1, 0, 1,
-0.949493, -0.5169563, -1.494264, 0.9568627, 1, 0, 1,
-0.9490187, 1.03029, -0.1987426, 0.9490196, 1, 0, 1,
-0.9433759, -1.152621, -4.032041, 0.945098, 1, 0, 1,
-0.9433099, 0.2009423, -1.312241, 0.9372549, 1, 0, 1,
-0.9426537, -0.2353882, -2.025339, 0.9333333, 1, 0, 1,
-0.9371997, -0.137814, -0.3477019, 0.9254902, 1, 0, 1,
-0.9342831, -0.1294261, -1.689422, 0.9215686, 1, 0, 1,
-0.931787, -0.8446299, -1.802781, 0.9137255, 1, 0, 1,
-0.9310816, 0.8804206, -0.5365281, 0.9098039, 1, 0, 1,
-0.9286685, -2.069686, -2.983602, 0.9019608, 1, 0, 1,
-0.9278113, 0.4453622, -0.1575604, 0.8941177, 1, 0, 1,
-0.9132442, -0.202878, -1.592923, 0.8901961, 1, 0, 1,
-0.9113454, -0.420827, -0.1145416, 0.8823529, 1, 0, 1,
-0.9096307, -0.8003381, -1.399508, 0.8784314, 1, 0, 1,
-0.9063604, -0.8111192, -3.474357, 0.8705882, 1, 0, 1,
-0.8957227, 1.031868, -1.423725, 0.8666667, 1, 0, 1,
-0.8916703, -1.388554, -4.015661, 0.8588235, 1, 0, 1,
-0.889333, 1.649876, 0.3694142, 0.854902, 1, 0, 1,
-0.8872061, 1.627988, -0.835097, 0.8470588, 1, 0, 1,
-0.885065, -0.6494883, -3.914807, 0.8431373, 1, 0, 1,
-0.8838353, 1.025405, -1.408886, 0.8352941, 1, 0, 1,
-0.8782625, -1.072903, -0.6639148, 0.8313726, 1, 0, 1,
-0.8776816, 1.567659, -0.9709078, 0.8235294, 1, 0, 1,
-0.8774059, 0.8231545, 0.1724307, 0.8196079, 1, 0, 1,
-0.8697872, 0.7238986, -2.055343, 0.8117647, 1, 0, 1,
-0.8691903, -0.6645521, -1.733273, 0.8078431, 1, 0, 1,
-0.8687211, 1.233124, -2.390142, 0.8, 1, 0, 1,
-0.8554428, 0.3465978, -1.599379, 0.7921569, 1, 0, 1,
-0.8463186, 2.122632, -0.1859455, 0.7882353, 1, 0, 1,
-0.8435746, 0.5737979, 2.047962, 0.7803922, 1, 0, 1,
-0.8319641, -0.7316755, -2.116001, 0.7764706, 1, 0, 1,
-0.8271153, -0.2568147, -0.5941394, 0.7686275, 1, 0, 1,
-0.8250546, -0.5235018, -0.5254311, 0.7647059, 1, 0, 1,
-0.8165665, 0.2802781, -0.2387698, 0.7568628, 1, 0, 1,
-0.8142623, 0.2006401, -2.079031, 0.7529412, 1, 0, 1,
-0.8134719, -0.08435714, 0.3394711, 0.7450981, 1, 0, 1,
-0.8122632, 0.3310674, -1.293931, 0.7411765, 1, 0, 1,
-0.8122085, -0.5857341, -2.736487, 0.7333333, 1, 0, 1,
-0.8104954, 0.8754412, 0.07005127, 0.7294118, 1, 0, 1,
-0.8082942, -0.160569, -0.7602847, 0.7215686, 1, 0, 1,
-0.8071842, 1.201626, -0.7207922, 0.7176471, 1, 0, 1,
-0.8028185, 0.4778638, -0.918099, 0.7098039, 1, 0, 1,
-0.7973961, -0.5983325, -2.031222, 0.7058824, 1, 0, 1,
-0.7968975, 0.03577702, -0.6398409, 0.6980392, 1, 0, 1,
-0.7954559, -0.8467888, -3.61224, 0.6901961, 1, 0, 1,
-0.7945585, 0.6402589, -0.6709417, 0.6862745, 1, 0, 1,
-0.7897811, 0.3631802, -1.005866, 0.6784314, 1, 0, 1,
-0.7880446, 0.7704127, -0.3568957, 0.6745098, 1, 0, 1,
-0.784636, -1.443487, -2.116087, 0.6666667, 1, 0, 1,
-0.7815555, -1.219037, -3.008681, 0.6627451, 1, 0, 1,
-0.777851, -0.05529297, -1.40241, 0.654902, 1, 0, 1,
-0.7731566, -2.503543, -2.675508, 0.6509804, 1, 0, 1,
-0.7712832, 1.251341, -0.290525, 0.6431373, 1, 0, 1,
-0.764958, -0.1475523, -3.376507, 0.6392157, 1, 0, 1,
-0.7635365, -1.235736, -3.285503, 0.6313726, 1, 0, 1,
-0.7585125, -0.4442781, -2.260594, 0.627451, 1, 0, 1,
-0.7544817, -1.428695, -2.20995, 0.6196079, 1, 0, 1,
-0.750012, 0.7282522, -1.948396, 0.6156863, 1, 0, 1,
-0.7487986, 1.589854, -1.314246, 0.6078432, 1, 0, 1,
-0.7478625, -0.7558833, -2.606079, 0.6039216, 1, 0, 1,
-0.7453738, 0.4018396, -0.005355406, 0.5960785, 1, 0, 1,
-0.74101, -0.2051039, -0.6554158, 0.5882353, 1, 0, 1,
-0.7377005, -0.01465333, -3.424643, 0.5843138, 1, 0, 1,
-0.7315699, 0.4918038, -1.248398, 0.5764706, 1, 0, 1,
-0.7255322, 0.9931388, -2.737439, 0.572549, 1, 0, 1,
-0.7239993, -0.06998146, -2.83644, 0.5647059, 1, 0, 1,
-0.720718, 0.02602245, -2.846108, 0.5607843, 1, 0, 1,
-0.7165545, -0.5430754, -1.604672, 0.5529412, 1, 0, 1,
-0.7139581, -1.052974, -2.32763, 0.5490196, 1, 0, 1,
-0.7096517, 1.550016, 0.1639951, 0.5411765, 1, 0, 1,
-0.7029969, -1.654382, -2.636395, 0.5372549, 1, 0, 1,
-0.7011979, 0.8198018, -0.9642713, 0.5294118, 1, 0, 1,
-0.7000757, -0.1498753, -2.108124, 0.5254902, 1, 0, 1,
-0.6997604, -1.690726, -2.04795, 0.5176471, 1, 0, 1,
-0.6991524, 0.05853209, -2.298505, 0.5137255, 1, 0, 1,
-0.6898921, 1.460424, -1.799872, 0.5058824, 1, 0, 1,
-0.6803242, -1.222191, -2.131185, 0.5019608, 1, 0, 1,
-0.6800597, -0.1007648, -4.323865, 0.4941176, 1, 0, 1,
-0.6793066, -0.3218087, -1.720045, 0.4862745, 1, 0, 1,
-0.6717125, -2.227607, -2.243685, 0.4823529, 1, 0, 1,
-0.6706251, -1.464326, -5.034454, 0.4745098, 1, 0, 1,
-0.6701941, -0.6791473, -1.193312, 0.4705882, 1, 0, 1,
-0.6672586, -1.829292, -2.174403, 0.4627451, 1, 0, 1,
-0.6650787, 1.316752, -0.6251906, 0.4588235, 1, 0, 1,
-0.664563, 0.2497173, 0.4178195, 0.4509804, 1, 0, 1,
-0.6641036, 2.300752, -0.5740692, 0.4470588, 1, 0, 1,
-0.661072, 0.3971781, -2.489711, 0.4392157, 1, 0, 1,
-0.6595418, 0.6515684, -0.5734897, 0.4352941, 1, 0, 1,
-0.6547366, -0.6940537, -2.066813, 0.427451, 1, 0, 1,
-0.6538585, 0.5755075, -0.942951, 0.4235294, 1, 0, 1,
-0.6536137, 0.04788429, 0.5352523, 0.4156863, 1, 0, 1,
-0.6516889, -2.636038, -1.33077, 0.4117647, 1, 0, 1,
-0.6493719, 0.8830338, -2.101768, 0.4039216, 1, 0, 1,
-0.6490986, -0.4914414, -2.743473, 0.3960784, 1, 0, 1,
-0.6427999, -0.1712713, -0.8691906, 0.3921569, 1, 0, 1,
-0.6426359, 0.1106736, -0.6229232, 0.3843137, 1, 0, 1,
-0.6361369, 0.7372851, 3.101191, 0.3803922, 1, 0, 1,
-0.6327066, -0.01962031, -1.490513, 0.372549, 1, 0, 1,
-0.6265814, -0.6333734, -2.619445, 0.3686275, 1, 0, 1,
-0.624878, -1.597745, -3.336526, 0.3607843, 1, 0, 1,
-0.6210822, 1.569297, -0.9338357, 0.3568628, 1, 0, 1,
-0.6172897, 1.492907, -1.832478, 0.3490196, 1, 0, 1,
-0.6106905, -0.5131278, -1.532508, 0.345098, 1, 0, 1,
-0.6100626, -1.720079, -1.71094, 0.3372549, 1, 0, 1,
-0.6086515, -1.089226, -2.44722, 0.3333333, 1, 0, 1,
-0.6028163, -0.5807856, -3.474512, 0.3254902, 1, 0, 1,
-0.6012416, -0.05791169, -2.900434, 0.3215686, 1, 0, 1,
-0.5980516, -1.461403, -1.862617, 0.3137255, 1, 0, 1,
-0.5938287, -0.06798816, -1.155178, 0.3098039, 1, 0, 1,
-0.5924356, 1.142604, -1.175595, 0.3019608, 1, 0, 1,
-0.5764366, -0.1184209, -1.254695, 0.2941177, 1, 0, 1,
-0.5751481, 0.2242797, -0.8296716, 0.2901961, 1, 0, 1,
-0.5735916, -1.314234, -4.236648, 0.282353, 1, 0, 1,
-0.5712503, 0.6150604, -3.945566, 0.2784314, 1, 0, 1,
-0.5667195, 0.629961, -1.134824, 0.2705882, 1, 0, 1,
-0.5663372, -0.4557596, -3.716339, 0.2666667, 1, 0, 1,
-0.566139, -0.4969327, -0.5066711, 0.2588235, 1, 0, 1,
-0.5589232, 0.9097506, -1.668735, 0.254902, 1, 0, 1,
-0.5579095, -0.05003809, -2.778206, 0.2470588, 1, 0, 1,
-0.5573467, -1.98797, -3.47006, 0.2431373, 1, 0, 1,
-0.5521159, 1.210087, 0.3995864, 0.2352941, 1, 0, 1,
-0.5507393, 1.231193, 0.1375282, 0.2313726, 1, 0, 1,
-0.5478769, -1.525755, -3.920758, 0.2235294, 1, 0, 1,
-0.5445542, 1.393868, -2.073353, 0.2196078, 1, 0, 1,
-0.5428625, 0.9753753, -3.173388, 0.2117647, 1, 0, 1,
-0.5395559, -0.06002944, -1.913892, 0.2078431, 1, 0, 1,
-0.539217, -0.7745917, -3.413799, 0.2, 1, 0, 1,
-0.5388715, 2.469351, -0.5023397, 0.1921569, 1, 0, 1,
-0.530872, -1.007457, -2.257855, 0.1882353, 1, 0, 1,
-0.5301694, -0.5225266, -2.464835, 0.1803922, 1, 0, 1,
-0.5268825, -0.9338516, -1.51945, 0.1764706, 1, 0, 1,
-0.5262808, 2.541852, -1.360699, 0.1686275, 1, 0, 1,
-0.5255873, -0.4465052, -0.5756167, 0.1647059, 1, 0, 1,
-0.521935, 0.7641623, -0.7543026, 0.1568628, 1, 0, 1,
-0.5184777, 0.5626078, -0.6126059, 0.1529412, 1, 0, 1,
-0.5147397, -0.6777819, -0.9966958, 0.145098, 1, 0, 1,
-0.5140736, 0.03245826, 0.4068834, 0.1411765, 1, 0, 1,
-0.5125588, 1.036397, -2.039518, 0.1333333, 1, 0, 1,
-0.5111694, -3.256918, -1.4939, 0.1294118, 1, 0, 1,
-0.5108635, 1.104609, 2.019344, 0.1215686, 1, 0, 1,
-0.5061039, 0.08980252, -2.308837, 0.1176471, 1, 0, 1,
-0.5049258, -0.5200807, -1.492038, 0.1098039, 1, 0, 1,
-0.5042542, -0.7378182, -3.064034, 0.1058824, 1, 0, 1,
-0.5026886, -0.9157991, -2.358878, 0.09803922, 1, 0, 1,
-0.50235, 0.7768351, -1.756889, 0.09019608, 1, 0, 1,
-0.5011349, 1.245539, 0.05752986, 0.08627451, 1, 0, 1,
-0.4996106, -0.3433736, -1.675077, 0.07843138, 1, 0, 1,
-0.4980753, -0.8626959, -1.899457, 0.07450981, 1, 0, 1,
-0.4977702, 0.4608246, 0.0019102, 0.06666667, 1, 0, 1,
-0.4958227, 0.510947, 0.3923496, 0.0627451, 1, 0, 1,
-0.4926499, 0.5280061, -0.211179, 0.05490196, 1, 0, 1,
-0.4906642, -0.6644498, -3.7101, 0.05098039, 1, 0, 1,
-0.4895577, -1.036775, -2.815988, 0.04313726, 1, 0, 1,
-0.4878046, 0.7844724, -0.4143603, 0.03921569, 1, 0, 1,
-0.4855269, 0.2621954, 0.08869436, 0.03137255, 1, 0, 1,
-0.4855234, 0.409323, -0.4723863, 0.02745098, 1, 0, 1,
-0.4838646, 0.9321808, -1.289827, 0.01960784, 1, 0, 1,
-0.4767849, 1.146712, -0.5208029, 0.01568628, 1, 0, 1,
-0.474222, -0.553861, -3.074869, 0.007843138, 1, 0, 1,
-0.4736802, -1.43957, -4.63726, 0.003921569, 1, 0, 1,
-0.4697963, -0.3652646, -3.07331, 0, 1, 0.003921569, 1,
-0.4601676, 0.3400007, -1.544855, 0, 1, 0.01176471, 1,
-0.4533017, 0.3738734, -1.491736, 0, 1, 0.01568628, 1,
-0.4511101, 0.00365876, -3.387798, 0, 1, 0.02352941, 1,
-0.4437036, -0.1263047, -2.562842, 0, 1, 0.02745098, 1,
-0.4358469, -0.3647726, -3.502596, 0, 1, 0.03529412, 1,
-0.432039, -0.25821, -1.368765, 0, 1, 0.03921569, 1,
-0.4239049, 0.5759491, 0.353901, 0, 1, 0.04705882, 1,
-0.4213338, -1.408655, -4.436546, 0, 1, 0.05098039, 1,
-0.4172547, -2.053416, -2.983261, 0, 1, 0.05882353, 1,
-0.4170981, 0.3179478, -0.6524285, 0, 1, 0.0627451, 1,
-0.4109347, -0.100958, -1.125699, 0, 1, 0.07058824, 1,
-0.4074487, 0.7486588, 1.272336, 0, 1, 0.07450981, 1,
-0.4069349, -0.4296665, -1.324007, 0, 1, 0.08235294, 1,
-0.4062124, 0.3878278, -1.21077, 0, 1, 0.08627451, 1,
-0.4058618, 0.7150961, 0.08661121, 0, 1, 0.09411765, 1,
-0.4042313, -0.2558105, -3.853478, 0, 1, 0.1019608, 1,
-0.4025392, 1.213202, 0.5987599, 0, 1, 0.1058824, 1,
-0.402364, -1.501516, -3.294914, 0, 1, 0.1137255, 1,
-0.4012165, -0.2530234, -2.680899, 0, 1, 0.1176471, 1,
-0.3913567, -0.2010346, -1.438388, 0, 1, 0.1254902, 1,
-0.3912386, 0.3226837, -1.482789, 0, 1, 0.1294118, 1,
-0.3892322, -1.400197, -0.1770558, 0, 1, 0.1372549, 1,
-0.3825133, 0.06865618, -1.096662, 0, 1, 0.1411765, 1,
-0.3769311, 0.02894621, -2.632189, 0, 1, 0.1490196, 1,
-0.3769086, -0.1257252, -2.910109, 0, 1, 0.1529412, 1,
-0.3712296, -0.862427, -2.040677, 0, 1, 0.1607843, 1,
-0.3701914, -0.02013249, -0.2062436, 0, 1, 0.1647059, 1,
-0.3682701, 0.09830692, -2.409867, 0, 1, 0.172549, 1,
-0.3645221, -0.5652515, -2.619094, 0, 1, 0.1764706, 1,
-0.3643605, 0.1054452, -1.974543, 0, 1, 0.1843137, 1,
-0.3629673, 0.4705311, -1.685633, 0, 1, 0.1882353, 1,
-0.3627322, -1.058154, -4.081103, 0, 1, 0.1960784, 1,
-0.3606446, 0.02717709, -1.07288, 0, 1, 0.2039216, 1,
-0.3586436, 0.1892131, -1.181907, 0, 1, 0.2078431, 1,
-0.3565296, -0.4794124, -2.360692, 0, 1, 0.2156863, 1,
-0.3558619, 1.146966, -1.920698, 0, 1, 0.2196078, 1,
-0.3553754, 1.093159, -1.337578, 0, 1, 0.227451, 1,
-0.351772, -0.4246206, -1.824183, 0, 1, 0.2313726, 1,
-0.3451777, 0.5113946, 0.4084865, 0, 1, 0.2392157, 1,
-0.3400598, 0.8600312, -2.09628, 0, 1, 0.2431373, 1,
-0.3395791, -0.8294774, -2.789022, 0, 1, 0.2509804, 1,
-0.3357317, 0.4941486, -1.012275, 0, 1, 0.254902, 1,
-0.3337432, 0.196463, -1.526697, 0, 1, 0.2627451, 1,
-0.3319158, -0.4395897, -2.68773, 0, 1, 0.2666667, 1,
-0.3317946, 0.657965, -1.977383, 0, 1, 0.2745098, 1,
-0.3310191, 0.3091168, -1.375469, 0, 1, 0.2784314, 1,
-0.3297894, 0.8254037, -0.3024198, 0, 1, 0.2862745, 1,
-0.323233, 1.423755, 0.3965666, 0, 1, 0.2901961, 1,
-0.3231012, -0.6912258, -2.263009, 0, 1, 0.2980392, 1,
-0.3227502, -0.07878178, -1.562955, 0, 1, 0.3058824, 1,
-0.3225496, 0.1339212, 0.4710813, 0, 1, 0.3098039, 1,
-0.322342, -0.839668, -3.332417, 0, 1, 0.3176471, 1,
-0.3191673, 0.8881177, 0.2482767, 0, 1, 0.3215686, 1,
-0.3190113, -0.833165, -0.7838285, 0, 1, 0.3294118, 1,
-0.3181781, -0.7235504, -3.934858, 0, 1, 0.3333333, 1,
-0.3142415, 1.22737, -1.08435, 0, 1, 0.3411765, 1,
-0.3129769, -1.35475, -3.844898, 0, 1, 0.345098, 1,
-0.3090335, 0.1946492, -2.240066, 0, 1, 0.3529412, 1,
-0.3076389, 0.3399114, 0.1774761, 0, 1, 0.3568628, 1,
-0.2996556, -0.9660009, -3.6098, 0, 1, 0.3647059, 1,
-0.2994117, -0.6023257, -4.012164, 0, 1, 0.3686275, 1,
-0.297353, 1.006683, 0.8559195, 0, 1, 0.3764706, 1,
-0.2950181, 1.117152, -1.100005, 0, 1, 0.3803922, 1,
-0.2840922, -0.25262, -2.059567, 0, 1, 0.3882353, 1,
-0.2834097, -0.09796613, -1.304797, 0, 1, 0.3921569, 1,
-0.2830358, -1.228261, -2.839521, 0, 1, 0.4, 1,
-0.2803128, -1.182521, -4.109448, 0, 1, 0.4078431, 1,
-0.2791965, -0.6445426, -3.201498, 0, 1, 0.4117647, 1,
-0.2755313, -1.618847, -4.169325, 0, 1, 0.4196078, 1,
-0.2640075, -0.03797424, -1.82849, 0, 1, 0.4235294, 1,
-0.263324, -1.212669, -3.819185, 0, 1, 0.4313726, 1,
-0.2511699, -1.027023, -2.509408, 0, 1, 0.4352941, 1,
-0.2499755, 0.9830121, -1.63942, 0, 1, 0.4431373, 1,
-0.2499687, 0.8506098, -1.836842, 0, 1, 0.4470588, 1,
-0.2483408, 1.089366, 0.8727427, 0, 1, 0.454902, 1,
-0.2421159, -0.3186083, -3.058976, 0, 1, 0.4588235, 1,
-0.2413595, 0.2300536, 1.427204, 0, 1, 0.4666667, 1,
-0.2403132, -1.825824, -4.276906, 0, 1, 0.4705882, 1,
-0.2396405, -0.9130504, -3.053726, 0, 1, 0.4784314, 1,
-0.2381015, -0.4297245, -3.18808, 0, 1, 0.4823529, 1,
-0.2347441, 1.273209, 0.01140666, 0, 1, 0.4901961, 1,
-0.2304731, -0.688532, -2.753719, 0, 1, 0.4941176, 1,
-0.2288506, 1.31125, -1.004517, 0, 1, 0.5019608, 1,
-0.2280442, 0.377214, -2.736894, 0, 1, 0.509804, 1,
-0.2280086, -2.780278, -3.525016, 0, 1, 0.5137255, 1,
-0.226943, 0.2331918, 1.037774, 0, 1, 0.5215687, 1,
-0.2197054, 0.6932619, 0.3507588, 0, 1, 0.5254902, 1,
-0.2156038, -1.853776, -3.61272, 0, 1, 0.5333334, 1,
-0.2118158, -1.355347, -1.741003, 0, 1, 0.5372549, 1,
-0.2076722, 1.074958, -0.9633663, 0, 1, 0.5450981, 1,
-0.2047418, -0.2213215, -1.646903, 0, 1, 0.5490196, 1,
-0.2021807, -0.02357518, -2.605744, 0, 1, 0.5568628, 1,
-0.2008122, 0.2945696, -0.1799779, 0, 1, 0.5607843, 1,
-0.1966293, 0.2897723, -0.3795622, 0, 1, 0.5686275, 1,
-0.1929079, -2.198632, -3.205383, 0, 1, 0.572549, 1,
-0.1914114, -0.8037827, -4.266146, 0, 1, 0.5803922, 1,
-0.1903547, 0.1306365, -1.309752, 0, 1, 0.5843138, 1,
-0.1870893, -0.5228478, -4.863572, 0, 1, 0.5921569, 1,
-0.1860863, 0.4765994, -0.5447491, 0, 1, 0.5960785, 1,
-0.1859123, -0.5528995, -2.85477, 0, 1, 0.6039216, 1,
-0.1819492, -0.409495, -2.38977, 0, 1, 0.6117647, 1,
-0.1778456, -0.6740291, -2.895288, 0, 1, 0.6156863, 1,
-0.1763904, -0.9985021, -3.406366, 0, 1, 0.6235294, 1,
-0.1750741, 0.2536106, 0.5083612, 0, 1, 0.627451, 1,
-0.1732669, 0.8361189, -0.3238852, 0, 1, 0.6352941, 1,
-0.1730562, -0.6961918, -4.520555, 0, 1, 0.6392157, 1,
-0.1680483, 0.7653005, 0.5169634, 0, 1, 0.6470588, 1,
-0.1661167, -0.5496452, -2.39619, 0, 1, 0.6509804, 1,
-0.1643869, 0.08885626, -2.510622, 0, 1, 0.6588235, 1,
-0.1639249, 1.342577, -0.9785711, 0, 1, 0.6627451, 1,
-0.1587166, -0.09087325, -0.9050952, 0, 1, 0.6705883, 1,
-0.1553713, -1.842407, -3.289464, 0, 1, 0.6745098, 1,
-0.1524964, 0.2415838, -0.5427604, 0, 1, 0.682353, 1,
-0.1505042, -2.166241, -2.97898, 0, 1, 0.6862745, 1,
-0.1471389, 0.7818537, 2.290318, 0, 1, 0.6941177, 1,
-0.1454114, 0.1003634, 0.5328513, 0, 1, 0.7019608, 1,
-0.1451597, -0.1025713, -1.995622, 0, 1, 0.7058824, 1,
-0.1437719, -1.477744, -1.843521, 0, 1, 0.7137255, 1,
-0.1390374, -1.668666, -1.838306, 0, 1, 0.7176471, 1,
-0.1376087, -0.4106045, -3.384748, 0, 1, 0.7254902, 1,
-0.1370702, 1.091297, -0.7512026, 0, 1, 0.7294118, 1,
-0.1303702, -0.7851564, -2.000457, 0, 1, 0.7372549, 1,
-0.1214338, 0.6071284, -0.9670241, 0, 1, 0.7411765, 1,
-0.1174491, 0.6505154, 0.2747191, 0, 1, 0.7490196, 1,
-0.1168339, -0.5177249, -4.752131, 0, 1, 0.7529412, 1,
-0.111786, 0.1971249, 0.9081392, 0, 1, 0.7607843, 1,
-0.1019437, -0.07212009, -1.694203, 0, 1, 0.7647059, 1,
-0.09928248, 1.621972, 1.464537, 0, 1, 0.772549, 1,
-0.09559583, 0.1673327, -0.8917838, 0, 1, 0.7764706, 1,
-0.09489713, 0.1093335, -2.543626, 0, 1, 0.7843137, 1,
-0.09463628, 0.421739, -1.502943, 0, 1, 0.7882353, 1,
-0.08748881, 0.425838, 0.1579541, 0, 1, 0.7960784, 1,
-0.08653294, -0.3023404, -3.090937, 0, 1, 0.8039216, 1,
-0.08572767, 0.1546073, 1.348451, 0, 1, 0.8078431, 1,
-0.08092822, 1.08755, -1.089661, 0, 1, 0.8156863, 1,
-0.07461209, -1.45295, -2.678747, 0, 1, 0.8196079, 1,
-0.07077839, -0.09966648, -4.25246, 0, 1, 0.827451, 1,
-0.06917208, 2.412903, 1.071669, 0, 1, 0.8313726, 1,
-0.06442785, -0.2544777, -1.0594, 0, 1, 0.8392157, 1,
-0.06429304, -0.6155345, -4.526761, 0, 1, 0.8431373, 1,
-0.06354925, -1.29878, -0.6789554, 0, 1, 0.8509804, 1,
-0.05877626, -1.524704, -2.44775, 0, 1, 0.854902, 1,
-0.05532908, 0.2140618, -1.281853, 0, 1, 0.8627451, 1,
-0.05509711, -0.4107225, -2.487375, 0, 1, 0.8666667, 1,
-0.05040814, -0.2691906, -2.933436, 0, 1, 0.8745098, 1,
-0.0500135, 0.3765922, 0.4313761, 0, 1, 0.8784314, 1,
-0.04972427, 0.8825259, 0.7988067, 0, 1, 0.8862745, 1,
-0.04375878, -0.9134348, -3.18455, 0, 1, 0.8901961, 1,
-0.03756071, 0.8588818, -0.6954995, 0, 1, 0.8980392, 1,
-0.03595623, -0.4850752, -0.832184, 0, 1, 0.9058824, 1,
-0.03376081, -0.1497969, -3.170208, 0, 1, 0.9098039, 1,
-0.03167514, -0.6064224, -1.694705, 0, 1, 0.9176471, 1,
-0.02851879, 1.975334, -1.949052, 0, 1, 0.9215686, 1,
-0.02781224, 0.3768101, -0.19768, 0, 1, 0.9294118, 1,
-0.02610971, -1.194632, -4.018816, 0, 1, 0.9333333, 1,
-0.0222499, 0.5464752, 0.6521039, 0, 1, 0.9411765, 1,
-0.02073301, -0.8570634, -4.469054, 0, 1, 0.945098, 1,
-0.01779584, 1.152809, -1.501348, 0, 1, 0.9529412, 1,
-0.01596799, -1.462971, -4.196919, 0, 1, 0.9568627, 1,
-0.01187508, -1.370763, -1.184981, 0, 1, 0.9647059, 1,
-0.0005829333, 0.8818537, -0.4149927, 0, 1, 0.9686275, 1,
-0.0004015775, 2.383855, -0.4493338, 0, 1, 0.9764706, 1,
0.0007003059, -0.01845956, 4.148117, 0, 1, 0.9803922, 1,
0.001830131, -0.1620222, 4.122843, 0, 1, 0.9882353, 1,
0.004040385, 1.541552, 0.1067491, 0, 1, 0.9921569, 1,
0.007655594, 1.135071, -0.7557094, 0, 1, 1, 1,
0.008542163, 0.8510162, 0.2497355, 0, 0.9921569, 1, 1,
0.008776617, 0.1435346, -0.7113214, 0, 0.9882353, 1, 1,
0.008920387, 0.8283547, 1.711517, 0, 0.9803922, 1, 1,
0.009450231, 0.3247371, 0.1566454, 0, 0.9764706, 1, 1,
0.01302732, 1.115012, 1.74562, 0, 0.9686275, 1, 1,
0.01438719, 1.003788, 0.2546248, 0, 0.9647059, 1, 1,
0.01791819, 0.5035251, 2.516697, 0, 0.9568627, 1, 1,
0.01881291, -0.7408105, 3.695145, 0, 0.9529412, 1, 1,
0.01910183, 2.102787, 0.4806868, 0, 0.945098, 1, 1,
0.01979028, 0.32023, -0.007167746, 0, 0.9411765, 1, 1,
0.02455459, -0.9877191, 3.021901, 0, 0.9333333, 1, 1,
0.02669844, -0.4001669, 1.910071, 0, 0.9294118, 1, 1,
0.03033773, -0.8630204, 3.78227, 0, 0.9215686, 1, 1,
0.03352255, -1.007658, 2.390372, 0, 0.9176471, 1, 1,
0.0339454, -0.3677965, 1.424779, 0, 0.9098039, 1, 1,
0.03411584, 0.5156045, 0.3280538, 0, 0.9058824, 1, 1,
0.03726587, 1.396253, 1.444875, 0, 0.8980392, 1, 1,
0.03798718, 0.1441714, 0.7960273, 0, 0.8901961, 1, 1,
0.04354454, 0.6173711, 2.231324, 0, 0.8862745, 1, 1,
0.04490444, -0.9480841, 3.994091, 0, 0.8784314, 1, 1,
0.04753946, 0.7071862, 0.7365044, 0, 0.8745098, 1, 1,
0.05355574, 0.877933, 0.354031, 0, 0.8666667, 1, 1,
0.05777245, 0.8623099, -0.03127842, 0, 0.8627451, 1, 1,
0.0579156, -2.270133, 2.97441, 0, 0.854902, 1, 1,
0.05870515, -1.005331, 3.968604, 0, 0.8509804, 1, 1,
0.06033203, -0.05906092, 2.217137, 0, 0.8431373, 1, 1,
0.06423539, 0.1804124, -0.08027246, 0, 0.8392157, 1, 1,
0.06533286, -1.116738, 1.848716, 0, 0.8313726, 1, 1,
0.06877937, 0.2016396, -0.8986322, 0, 0.827451, 1, 1,
0.07028352, 0.7392741, -0.6280349, 0, 0.8196079, 1, 1,
0.07364354, 0.04065474, 0.3774455, 0, 0.8156863, 1, 1,
0.07480472, -0.9380469, 2.700397, 0, 0.8078431, 1, 1,
0.07661392, 0.943633, -0.5495591, 0, 0.8039216, 1, 1,
0.07698021, -0.5343511, 3.711917, 0, 0.7960784, 1, 1,
0.08235312, 0.4997756, 0.79631, 0, 0.7882353, 1, 1,
0.08235931, -0.8252829, 3.523796, 0, 0.7843137, 1, 1,
0.08860923, -1.032882, 3.104146, 0, 0.7764706, 1, 1,
0.08869513, 3.020242, 0.5246271, 0, 0.772549, 1, 1,
0.08989362, -0.6648416, 2.588182, 0, 0.7647059, 1, 1,
0.08999466, -0.9019252, 1.199262, 0, 0.7607843, 1, 1,
0.09056113, -0.3457877, 1.872323, 0, 0.7529412, 1, 1,
0.09289893, -0.4225457, 3.209357, 0, 0.7490196, 1, 1,
0.09792247, 0.5181483, 1.998072, 0, 0.7411765, 1, 1,
0.09874219, -0.2602154, 4.322083, 0, 0.7372549, 1, 1,
0.1046143, -0.4209527, 4.047949, 0, 0.7294118, 1, 1,
0.1047576, 0.6596131, 0.08932104, 0, 0.7254902, 1, 1,
0.1048547, -0.9753953, 4.401688, 0, 0.7176471, 1, 1,
0.1060418, 1.385533, -0.07865463, 0, 0.7137255, 1, 1,
0.109463, -0.7094204, 2.411046, 0, 0.7058824, 1, 1,
0.1159362, -2.093887, 4.083591, 0, 0.6980392, 1, 1,
0.1169816, 0.1282801, 1.993814, 0, 0.6941177, 1, 1,
0.1192251, -0.674376, 3.407367, 0, 0.6862745, 1, 1,
0.1277868, -0.9348993, 2.863202, 0, 0.682353, 1, 1,
0.1359319, -0.2838926, 1.961492, 0, 0.6745098, 1, 1,
0.1371318, -0.01585125, 0.8743678, 0, 0.6705883, 1, 1,
0.1428262, -0.6878316, 2.259844, 0, 0.6627451, 1, 1,
0.1442889, 0.4388132, 1.656559, 0, 0.6588235, 1, 1,
0.1451544, 0.7614496, -2.041893, 0, 0.6509804, 1, 1,
0.1497842, 0.9396614, 0.131733, 0, 0.6470588, 1, 1,
0.1502617, -0.9994094, 4.659276, 0, 0.6392157, 1, 1,
0.1506953, -1.29229, 4.144984, 0, 0.6352941, 1, 1,
0.1516811, -1.287682, 3.635419, 0, 0.627451, 1, 1,
0.1636554, 0.3118561, 2.386928, 0, 0.6235294, 1, 1,
0.1639287, 1.204163, 1.772831, 0, 0.6156863, 1, 1,
0.1658032, 0.07840062, 2.0562, 0, 0.6117647, 1, 1,
0.1723933, -0.677394, 2.22841, 0, 0.6039216, 1, 1,
0.172846, -0.2159889, 3.312367, 0, 0.5960785, 1, 1,
0.1742223, -0.4181489, 3.031051, 0, 0.5921569, 1, 1,
0.1802556, 0.5161612, 0.7253319, 0, 0.5843138, 1, 1,
0.1862237, -1.026534, 2.71806, 0, 0.5803922, 1, 1,
0.1877998, -1.406515, 3.697223, 0, 0.572549, 1, 1,
0.1881687, -0.1658583, 5.007666, 0, 0.5686275, 1, 1,
0.1898719, 1.764004, 0.6081626, 0, 0.5607843, 1, 1,
0.1904375, 0.8950842, -1.043108, 0, 0.5568628, 1, 1,
0.2013011, 1.500094, -1.18128, 0, 0.5490196, 1, 1,
0.2033943, 1.468222, 0.5387316, 0, 0.5450981, 1, 1,
0.2033961, 1.872717, 0.2295775, 0, 0.5372549, 1, 1,
0.2083922, 0.4264948, -0.06032287, 0, 0.5333334, 1, 1,
0.2124476, 1.462215, -0.4497935, 0, 0.5254902, 1, 1,
0.2125161, -0.1221142, 2.54804, 0, 0.5215687, 1, 1,
0.2163894, 1.497073, 0.7150255, 0, 0.5137255, 1, 1,
0.2164986, 0.7158824, -1.090844, 0, 0.509804, 1, 1,
0.2165048, 2.201503, -0.5643681, 0, 0.5019608, 1, 1,
0.2197202, -0.8182698, 2.522356, 0, 0.4941176, 1, 1,
0.2198401, 0.4571164, 0.6107977, 0, 0.4901961, 1, 1,
0.2257242, 0.276815, 1.034424, 0, 0.4823529, 1, 1,
0.2269423, -0.2696547, 1.498858, 0, 0.4784314, 1, 1,
0.2296401, 0.453281, -0.7580626, 0, 0.4705882, 1, 1,
0.2304859, -1.183345, 4.53478, 0, 0.4666667, 1, 1,
0.2319698, 0.07611492, 2.23415, 0, 0.4588235, 1, 1,
0.2321138, 0.9848646, -0.1692603, 0, 0.454902, 1, 1,
0.2337235, -0.5709308, 4.127539, 0, 0.4470588, 1, 1,
0.2341767, 0.2043976, 0.8803153, 0, 0.4431373, 1, 1,
0.2364831, -0.6342422, 2.761589, 0, 0.4352941, 1, 1,
0.2433103, -0.5442421, 2.220037, 0, 0.4313726, 1, 1,
0.2488919, -0.9529468, 3.420827, 0, 0.4235294, 1, 1,
0.2504405, 0.2490269, -0.4209762, 0, 0.4196078, 1, 1,
0.2521765, 1.438691, -0.2562344, 0, 0.4117647, 1, 1,
0.2550395, -1.920068, 3.13054, 0, 0.4078431, 1, 1,
0.2582405, 0.5598449, 1.309469, 0, 0.4, 1, 1,
0.2641341, -0.00469865, 1.538063, 0, 0.3921569, 1, 1,
0.2696712, 0.3943372, 1.129448, 0, 0.3882353, 1, 1,
0.2725562, 1.685815, 0.7913498, 0, 0.3803922, 1, 1,
0.2761608, 0.5499627, 1.06862, 0, 0.3764706, 1, 1,
0.2776219, -0.4047302, 2.816778, 0, 0.3686275, 1, 1,
0.2847779, -1.242288, 1.308592, 0, 0.3647059, 1, 1,
0.2866646, -1.072384, 0.5707331, 0, 0.3568628, 1, 1,
0.2867591, -0.4887101, 1.170962, 0, 0.3529412, 1, 1,
0.2871378, 1.30287, 0.495361, 0, 0.345098, 1, 1,
0.2883668, -0.3256044, 2.363769, 0, 0.3411765, 1, 1,
0.2909008, -1.070822, 2.865258, 0, 0.3333333, 1, 1,
0.2974139, -1.78883, 3.630079, 0, 0.3294118, 1, 1,
0.2976997, -0.825348, 4.547836, 0, 0.3215686, 1, 1,
0.2988844, 0.4709042, 1.98894, 0, 0.3176471, 1, 1,
0.2990256, 0.1614764, -0.8599706, 0, 0.3098039, 1, 1,
0.3062467, 0.7600091, 0.1561028, 0, 0.3058824, 1, 1,
0.3087198, -1.208544, 2.601641, 0, 0.2980392, 1, 1,
0.3090106, 0.2001667, 2.095581, 0, 0.2901961, 1, 1,
0.3131773, 0.1666641, 1.724985, 0, 0.2862745, 1, 1,
0.3143108, -0.445683, 2.927982, 0, 0.2784314, 1, 1,
0.3184312, 0.2701737, -1.533818, 0, 0.2745098, 1, 1,
0.3252116, 0.5472095, -0.3055254, 0, 0.2666667, 1, 1,
0.3309962, -0.6341634, 2.73823, 0, 0.2627451, 1, 1,
0.3315845, -1.380506, 3.493557, 0, 0.254902, 1, 1,
0.3342304, -1.010746, 3.021632, 0, 0.2509804, 1, 1,
0.3345008, -0.5391526, 1.564383, 0, 0.2431373, 1, 1,
0.3358731, 2.003389, -0.5894384, 0, 0.2392157, 1, 1,
0.3364431, -0.3068972, 2.951418, 0, 0.2313726, 1, 1,
0.336492, -0.6950543, 2.109293, 0, 0.227451, 1, 1,
0.3366744, -1.040624, 2.573388, 0, 0.2196078, 1, 1,
0.3367534, -0.5299585, 3.634636, 0, 0.2156863, 1, 1,
0.3373851, -0.5453686, 1.538254, 0, 0.2078431, 1, 1,
0.3419536, 0.09080379, 1.760792, 0, 0.2039216, 1, 1,
0.3450131, 0.4798325, -1.142206, 0, 0.1960784, 1, 1,
0.3459265, 0.05383445, 1.357353, 0, 0.1882353, 1, 1,
0.3463752, -0.4969137, 2.500792, 0, 0.1843137, 1, 1,
0.3519033, -2.326345, 3.929097, 0, 0.1764706, 1, 1,
0.3559011, -1.308742, 2.900171, 0, 0.172549, 1, 1,
0.3559734, -1.157958, 3.51594, 0, 0.1647059, 1, 1,
0.3569411, 0.8677868, 0.5208297, 0, 0.1607843, 1, 1,
0.35892, 2.425924, -1.117664, 0, 0.1529412, 1, 1,
0.3593792, 0.02592427, 1.810538, 0, 0.1490196, 1, 1,
0.3614854, 0.155797, 1.507519, 0, 0.1411765, 1, 1,
0.3621354, 0.5286807, -1.296502, 0, 0.1372549, 1, 1,
0.3625444, 0.5613869, 0.315436, 0, 0.1294118, 1, 1,
0.3715388, -0.3858907, 2.53472, 0, 0.1254902, 1, 1,
0.3723634, 1.214507, -1.090241, 0, 0.1176471, 1, 1,
0.3760728, 1.092841, -0.3982294, 0, 0.1137255, 1, 1,
0.3789344, -0.8682942, 3.742276, 0, 0.1058824, 1, 1,
0.3835061, 0.5281633, 1.696716, 0, 0.09803922, 1, 1,
0.3869009, -0.6028557, 1.992852, 0, 0.09411765, 1, 1,
0.3885708, -1.179564, 2.59846, 0, 0.08627451, 1, 1,
0.3896291, -0.3144158, 3.527877, 0, 0.08235294, 1, 1,
0.397295, 0.6163506, -1.062374, 0, 0.07450981, 1, 1,
0.4006608, 0.04627565, 1.341344, 0, 0.07058824, 1, 1,
0.4019811, -1.052553, 2.63522, 0, 0.0627451, 1, 1,
0.4068604, 0.2645157, 1.177166, 0, 0.05882353, 1, 1,
0.4090224, 0.4006293, 0.4677238, 0, 0.05098039, 1, 1,
0.420005, -0.4601533, 1.357474, 0, 0.04705882, 1, 1,
0.4203181, -1.293856, 2.795041, 0, 0.03921569, 1, 1,
0.4210732, -0.331403, 1.571581, 0, 0.03529412, 1, 1,
0.4272097, 1.632165, 1.706397, 0, 0.02745098, 1, 1,
0.4314261, 1.579995, 1.094601, 0, 0.02352941, 1, 1,
0.4326366, -0.9751416, 3.180517, 0, 0.01568628, 1, 1,
0.4330662, -0.210731, 2.800199, 0, 0.01176471, 1, 1,
0.4360425, 0.5971668, -0.1712428, 0, 0.003921569, 1, 1,
0.4495336, -1.901215, 2.975751, 0.003921569, 0, 1, 1,
0.4536807, -0.4673646, 4.019142, 0.007843138, 0, 1, 1,
0.4586497, -0.5741478, 4.29313, 0.01568628, 0, 1, 1,
0.4597233, -0.1092834, 1.890874, 0.01960784, 0, 1, 1,
0.460614, 1.787219, 0.9445306, 0.02745098, 0, 1, 1,
0.4614409, 0.02499586, 2.731912, 0.03137255, 0, 1, 1,
0.464135, 0.3687521, 1.989688, 0.03921569, 0, 1, 1,
0.4751796, -1.242972, 1.009669, 0.04313726, 0, 1, 1,
0.4772817, -0.5320647, 3.240829, 0.05098039, 0, 1, 1,
0.4791275, 0.0002806978, 0.7930747, 0.05490196, 0, 1, 1,
0.4791298, 0.6766312, 0.3359058, 0.0627451, 0, 1, 1,
0.4804682, 0.5853509, 1.300824, 0.06666667, 0, 1, 1,
0.4817357, -0.2872259, 2.460488, 0.07450981, 0, 1, 1,
0.481807, -0.007221158, 1.609606, 0.07843138, 0, 1, 1,
0.4834419, 0.1020248, 0.945043, 0.08627451, 0, 1, 1,
0.4870479, -0.7758639, 2.29745, 0.09019608, 0, 1, 1,
0.4907495, -0.2666452, 2.649857, 0.09803922, 0, 1, 1,
0.4928403, 0.2746075, 0.5716414, 0.1058824, 0, 1, 1,
0.4940567, 0.37282, 0.3265227, 0.1098039, 0, 1, 1,
0.4956173, -0.9745197, 3.433099, 0.1176471, 0, 1, 1,
0.4965198, -3.00237, 2.104314, 0.1215686, 0, 1, 1,
0.4970874, 1.114502, 0.4653778, 0.1294118, 0, 1, 1,
0.497629, 1.000767, 1.223471, 0.1333333, 0, 1, 1,
0.5009334, 0.7879311, -1.157992, 0.1411765, 0, 1, 1,
0.5045481, -0.4320053, 3.127691, 0.145098, 0, 1, 1,
0.5049335, -1.695003, 2.212813, 0.1529412, 0, 1, 1,
0.5056455, -0.6467385, 2.367788, 0.1568628, 0, 1, 1,
0.50572, -0.2433315, 0.4723721, 0.1647059, 0, 1, 1,
0.5092516, -0.3365792, 2.239865, 0.1686275, 0, 1, 1,
0.5127746, 1.823226, 0.4431356, 0.1764706, 0, 1, 1,
0.5138507, -0.6350158, -0.7268279, 0.1803922, 0, 1, 1,
0.5216004, 0.2711426, 0.6069251, 0.1882353, 0, 1, 1,
0.5355366, 0.6438578, 1.65562, 0.1921569, 0, 1, 1,
0.5383087, 1.058044, 1.293002, 0.2, 0, 1, 1,
0.5384156, -0.6227724, 2.573684, 0.2078431, 0, 1, 1,
0.5387999, 1.223475, -0.07409906, 0.2117647, 0, 1, 1,
0.5455676, 0.6298801, 0.6604828, 0.2196078, 0, 1, 1,
0.5480963, 0.6431693, 1.214309, 0.2235294, 0, 1, 1,
0.5540056, 0.01508403, 0.9529945, 0.2313726, 0, 1, 1,
0.5604199, -1.813246, 3.455175, 0.2352941, 0, 1, 1,
0.5619267, -0.9454044, 2.842627, 0.2431373, 0, 1, 1,
0.5749267, 1.340111, 0.2897256, 0.2470588, 0, 1, 1,
0.5776175, 0.7118697, 1.403478, 0.254902, 0, 1, 1,
0.5799268, 1.241106, 1.333762, 0.2588235, 0, 1, 1,
0.5833791, -0.4522351, 3.233262, 0.2666667, 0, 1, 1,
0.5835389, -0.8833095, 3.497558, 0.2705882, 0, 1, 1,
0.5893624, -2.108067, 2.618276, 0.2784314, 0, 1, 1,
0.6014896, 0.63432, 0.3145436, 0.282353, 0, 1, 1,
0.6088582, -0.08251811, 2.189943, 0.2901961, 0, 1, 1,
0.6101406, -1.066196, -0.2121107, 0.2941177, 0, 1, 1,
0.6139736, 1.497298, -1.348591, 0.3019608, 0, 1, 1,
0.6141686, -0.4828306, 1.694114, 0.3098039, 0, 1, 1,
0.6145823, 0.7813144, 1.464779, 0.3137255, 0, 1, 1,
0.6171108, 1.191243, 1.345496, 0.3215686, 0, 1, 1,
0.6175624, -2.33568, 2.506729, 0.3254902, 0, 1, 1,
0.6179067, -1.181851, 1.705188, 0.3333333, 0, 1, 1,
0.6191113, -0.2362417, 3.259855, 0.3372549, 0, 1, 1,
0.6193953, 0.7019889, -0.3880111, 0.345098, 0, 1, 1,
0.6197917, -0.5635602, 2.460281, 0.3490196, 0, 1, 1,
0.622529, -0.03573625, 2.707252, 0.3568628, 0, 1, 1,
0.6331874, 0.5933715, -0.8766601, 0.3607843, 0, 1, 1,
0.6354091, 0.7372553, 0.5333302, 0.3686275, 0, 1, 1,
0.6355552, 1.252135, 1.568471, 0.372549, 0, 1, 1,
0.6362865, -0.8444893, 2.023752, 0.3803922, 0, 1, 1,
0.6384663, 0.4767751, 0.8605754, 0.3843137, 0, 1, 1,
0.6427839, -0.7932447, 2.185774, 0.3921569, 0, 1, 1,
0.6494007, 0.05826287, -0.7424021, 0.3960784, 0, 1, 1,
0.6550689, 0.1434319, 1.64361, 0.4039216, 0, 1, 1,
0.656723, -1.132524, 3.231287, 0.4117647, 0, 1, 1,
0.660051, 1.312238, 1.55065, 0.4156863, 0, 1, 1,
0.6655264, 1.695915, -1.183575, 0.4235294, 0, 1, 1,
0.6665563, 0.05763681, -0.3652564, 0.427451, 0, 1, 1,
0.6665771, 0.8282783, -0.03980811, 0.4352941, 0, 1, 1,
0.6669677, -0.5299101, 1.325465, 0.4392157, 0, 1, 1,
0.6724051, -0.2543976, 1.848976, 0.4470588, 0, 1, 1,
0.6733779, 1.048976, 1.341282, 0.4509804, 0, 1, 1,
0.6773353, -0.05945539, 2.720397, 0.4588235, 0, 1, 1,
0.689673, 0.2270669, 1.269742, 0.4627451, 0, 1, 1,
0.6927043, -0.1269275, 3.305814, 0.4705882, 0, 1, 1,
0.6931393, -0.9010026, 0.1262217, 0.4745098, 0, 1, 1,
0.6958413, 1.216035, -1.655899, 0.4823529, 0, 1, 1,
0.697488, 0.805289, 0.5720567, 0.4862745, 0, 1, 1,
0.7009446, -1.241966, 4.275009, 0.4941176, 0, 1, 1,
0.7069759, -0.274557, 1.988962, 0.5019608, 0, 1, 1,
0.7104958, -0.2608074, 3.097791, 0.5058824, 0, 1, 1,
0.7176714, -0.7712188, 2.177845, 0.5137255, 0, 1, 1,
0.7226368, 0.5604883, 0.1673966, 0.5176471, 0, 1, 1,
0.7229214, -1.282198, 2.022951, 0.5254902, 0, 1, 1,
0.7229269, 2.017404, -0.3168739, 0.5294118, 0, 1, 1,
0.7281813, 1.663117, -0.1707045, 0.5372549, 0, 1, 1,
0.7293879, -0.7585615, 0.6833866, 0.5411765, 0, 1, 1,
0.73029, 0.3100176, 1.1195, 0.5490196, 0, 1, 1,
0.7312478, 0.05645767, 2.119522, 0.5529412, 0, 1, 1,
0.7323594, 0.09605293, 1.387874, 0.5607843, 0, 1, 1,
0.7495136, 0.138674, 2.459617, 0.5647059, 0, 1, 1,
0.7569689, 1.811288, 0.6278397, 0.572549, 0, 1, 1,
0.757175, 1.640633, -0.2225028, 0.5764706, 0, 1, 1,
0.7587704, -1.468205, 0.8978905, 0.5843138, 0, 1, 1,
0.76109, 0.3515218, 2.006123, 0.5882353, 0, 1, 1,
0.77198, -0.2463819, 1.503907, 0.5960785, 0, 1, 1,
0.7732787, -0.1053413, 2.026299, 0.6039216, 0, 1, 1,
0.7869158, 0.2869491, 1.655603, 0.6078432, 0, 1, 1,
0.7875347, 0.7420985, 1.297722, 0.6156863, 0, 1, 1,
0.7902566, -0.5560336, 1.723356, 0.6196079, 0, 1, 1,
0.7909489, 0.4368392, 0.02339208, 0.627451, 0, 1, 1,
0.7910574, -2.329489, 2.27315, 0.6313726, 0, 1, 1,
0.7913811, 0.4781194, 0.1028997, 0.6392157, 0, 1, 1,
0.7990102, 2.026091, 0.3555189, 0.6431373, 0, 1, 1,
0.8116292, 1.203558, -0.7317576, 0.6509804, 0, 1, 1,
0.814487, -0.6205232, 3.29671, 0.654902, 0, 1, 1,
0.8180891, -1.541921, 3.055966, 0.6627451, 0, 1, 1,
0.8181587, 2.692404, -0.380104, 0.6666667, 0, 1, 1,
0.819092, -0.3508982, 2.198646, 0.6745098, 0, 1, 1,
0.820185, -1.048265, 1.654772, 0.6784314, 0, 1, 1,
0.8210931, 0.3694209, 1.942814, 0.6862745, 0, 1, 1,
0.8218666, -1.168606, 2.51697, 0.6901961, 0, 1, 1,
0.8224633, 1.326994, -0.4596246, 0.6980392, 0, 1, 1,
0.8247684, -0.07459714, 1.390844, 0.7058824, 0, 1, 1,
0.8276489, 1.096334, 0.575891, 0.7098039, 0, 1, 1,
0.833578, 0.6320421, -1.059158, 0.7176471, 0, 1, 1,
0.8370007, 0.9595391, 1.535571, 0.7215686, 0, 1, 1,
0.847038, -0.4040464, -0.4272153, 0.7294118, 0, 1, 1,
0.8496009, 0.6338193, 1.06342, 0.7333333, 0, 1, 1,
0.8567963, -0.4140018, 1.343637, 0.7411765, 0, 1, 1,
0.8569806, -0.5156702, 1.604244, 0.7450981, 0, 1, 1,
0.8577513, 1.502617, -0.14332, 0.7529412, 0, 1, 1,
0.8600906, -0.1700251, 3.914331, 0.7568628, 0, 1, 1,
0.8603958, -1.427011, 1.496686, 0.7647059, 0, 1, 1,
0.8611374, 0.4375789, 1.406646, 0.7686275, 0, 1, 1,
0.8622653, -0.2584164, 1.133392, 0.7764706, 0, 1, 1,
0.8766698, -1.879624, 1.453581, 0.7803922, 0, 1, 1,
0.8789901, -0.06045891, 4.050915, 0.7882353, 0, 1, 1,
0.8822688, -1.042093, 3.006585, 0.7921569, 0, 1, 1,
0.883117, -1.661663, 3.099944, 0.8, 0, 1, 1,
0.8923922, -1.749315, 4.172387, 0.8078431, 0, 1, 1,
0.8946449, -0.6576592, 2.871078, 0.8117647, 0, 1, 1,
0.8955968, -1.20385, 2.787227, 0.8196079, 0, 1, 1,
0.8966941, -0.5679677, 2.66817, 0.8235294, 0, 1, 1,
0.9043558, 0.7744525, 0.8051065, 0.8313726, 0, 1, 1,
0.9110848, -0.1590981, 0.6374213, 0.8352941, 0, 1, 1,
0.9116135, -1.621779, 3.374965, 0.8431373, 0, 1, 1,
0.9135528, 0.4531768, 0.564716, 0.8470588, 0, 1, 1,
0.9144992, 0.02518874, 0.5514932, 0.854902, 0, 1, 1,
0.9146851, 0.01958078, 1.744637, 0.8588235, 0, 1, 1,
0.9170502, 0.2551544, 2.587486, 0.8666667, 0, 1, 1,
0.9208443, -0.559208, 2.809102, 0.8705882, 0, 1, 1,
0.9226021, -0.06571109, 1.95095, 0.8784314, 0, 1, 1,
0.9306527, 0.9559173, 1.327056, 0.8823529, 0, 1, 1,
0.9314242, -0.4688768, 1.471125, 0.8901961, 0, 1, 1,
0.9317542, -1.801633, 2.113188, 0.8941177, 0, 1, 1,
0.933149, -0.785737, 2.231728, 0.9019608, 0, 1, 1,
0.9366984, 0.3460609, 1.29996, 0.9098039, 0, 1, 1,
0.9432476, -0.5176163, 3.877968, 0.9137255, 0, 1, 1,
0.9481217, -0.6160719, 2.249587, 0.9215686, 0, 1, 1,
0.950715, -0.5645443, 0.1684422, 0.9254902, 0, 1, 1,
0.9519994, 1.166614, 1.664379, 0.9333333, 0, 1, 1,
0.9535146, -1.248199, 2.888843, 0.9372549, 0, 1, 1,
0.957753, -1.196884, 3.148682, 0.945098, 0, 1, 1,
0.967254, 0.9612398, 2.981088, 0.9490196, 0, 1, 1,
0.9724098, -0.6595131, -0.1778384, 0.9568627, 0, 1, 1,
0.9872437, -0.5907488, 3.616226, 0.9607843, 0, 1, 1,
0.9898381, 0.4859551, -1.189416, 0.9686275, 0, 1, 1,
0.9941461, -0.7012109, 0.6471107, 0.972549, 0, 1, 1,
0.9991263, 0.9558672, -0.04419055, 0.9803922, 0, 1, 1,
1.005011, 1.124945, 0.6063976, 0.9843137, 0, 1, 1,
1.019649, 0.9351255, 1.084742, 0.9921569, 0, 1, 1,
1.020066, 0.07242517, 0.5265726, 0.9960784, 0, 1, 1,
1.021099, -1.088286, 3.182472, 1, 0, 0.9960784, 1,
1.026617, -0.4109394, 2.116713, 1, 0, 0.9882353, 1,
1.031003, -0.8833664, 2.050583, 1, 0, 0.9843137, 1,
1.038431, 0.05099704, 1.565276, 1, 0, 0.9764706, 1,
1.041711, -1.674294, 3.230185, 1, 0, 0.972549, 1,
1.042853, -0.5416203, 1.770526, 1, 0, 0.9647059, 1,
1.04288, -1.599723, 1.139772, 1, 0, 0.9607843, 1,
1.047518, -1.122657, 3.0031, 1, 0, 0.9529412, 1,
1.052356, -1.772459, 3.215555, 1, 0, 0.9490196, 1,
1.053057, -1.003761, 0.2858106, 1, 0, 0.9411765, 1,
1.054539, 1.068879, 0.4647577, 1, 0, 0.9372549, 1,
1.057703, 0.6841277, -0.107586, 1, 0, 0.9294118, 1,
1.064314, -1.131972, 0.3680991, 1, 0, 0.9254902, 1,
1.070421, 0.0686198, 2.231224, 1, 0, 0.9176471, 1,
1.070677, -0.7453133, 1.241737, 1, 0, 0.9137255, 1,
1.075131, 0.7589542, 2.578128, 1, 0, 0.9058824, 1,
1.078063, 1.214737, -0.8081743, 1, 0, 0.9019608, 1,
1.092106, -1.017621, 0.6558902, 1, 0, 0.8941177, 1,
1.102361, 1.073206, 0.5469564, 1, 0, 0.8862745, 1,
1.102605, 0.4032011, 0.03440404, 1, 0, 0.8823529, 1,
1.105473, -1.830076, 4.066061, 1, 0, 0.8745098, 1,
1.111189, -1.261343, 1.211796, 1, 0, 0.8705882, 1,
1.111805, -2.156067, 1.272891, 1, 0, 0.8627451, 1,
1.112278, 0.9597925, 0.07182597, 1, 0, 0.8588235, 1,
1.124114, -1.232866, 2.302583, 1, 0, 0.8509804, 1,
1.152693, 0.3162732, 2.723217, 1, 0, 0.8470588, 1,
1.158085, 0.9625494, 1.697064, 1, 0, 0.8392157, 1,
1.161379, -0.1299033, 1.689184, 1, 0, 0.8352941, 1,
1.175573, 0.5032975, 1.059721, 1, 0, 0.827451, 1,
1.176452, -0.8501083, 4.053124, 1, 0, 0.8235294, 1,
1.179517, -0.0577383, 0.3075535, 1, 0, 0.8156863, 1,
1.184125, 0.732611, 0.9073068, 1, 0, 0.8117647, 1,
1.191964, 2.12013, 0.1129107, 1, 0, 0.8039216, 1,
1.199584, -0.1634481, 1.466475, 1, 0, 0.7960784, 1,
1.207318, -0.01792481, 4.138698, 1, 0, 0.7921569, 1,
1.209309, -0.03509912, 2.212073, 1, 0, 0.7843137, 1,
1.222241, -0.09397852, 0.8723099, 1, 0, 0.7803922, 1,
1.233018, -1.232128, 2.731425, 1, 0, 0.772549, 1,
1.233717, 0.7470284, 1.636847, 1, 0, 0.7686275, 1,
1.237502, -0.09598147, 1.410206, 1, 0, 0.7607843, 1,
1.237665, 1.137013, 0.3465127, 1, 0, 0.7568628, 1,
1.239079, -1.526108, 1.758577, 1, 0, 0.7490196, 1,
1.245309, -0.7808546, 2.632404, 1, 0, 0.7450981, 1,
1.246513, -0.258129, -0.372714, 1, 0, 0.7372549, 1,
1.248812, 2.160674, -0.9391902, 1, 0, 0.7333333, 1,
1.255411, 1.230029, 0.3213721, 1, 0, 0.7254902, 1,
1.256226, 0.951972, 2.734977, 1, 0, 0.7215686, 1,
1.259482, 0.6845677, 1.132743, 1, 0, 0.7137255, 1,
1.260695, 0.9280453, 1.610074, 1, 0, 0.7098039, 1,
1.271975, 1.049338, -1.215123, 1, 0, 0.7019608, 1,
1.276981, 1.04399, 0.1085477, 1, 0, 0.6941177, 1,
1.292027, -0.3549998, 2.324878, 1, 0, 0.6901961, 1,
1.293283, -0.04086597, 2.092422, 1, 0, 0.682353, 1,
1.295043, 1.846201, 0.2396658, 1, 0, 0.6784314, 1,
1.295347, 0.1503142, 3.127599, 1, 0, 0.6705883, 1,
1.298048, 0.120769, 1.128149, 1, 0, 0.6666667, 1,
1.306252, -0.6827179, 1.131631, 1, 0, 0.6588235, 1,
1.312653, -0.6964647, 3.989198, 1, 0, 0.654902, 1,
1.313821, 2.172205, 1.855595, 1, 0, 0.6470588, 1,
1.341214, -0.1142342, 1.080953, 1, 0, 0.6431373, 1,
1.341483, -2.658373, 2.105094, 1, 0, 0.6352941, 1,
1.347993, 0.1758366, 0.5715593, 1, 0, 0.6313726, 1,
1.360836, -0.1082186, 1.255432, 1, 0, 0.6235294, 1,
1.361074, -0.7089447, 2.191844, 1, 0, 0.6196079, 1,
1.361789, 2.355601, 0.2310459, 1, 0, 0.6117647, 1,
1.363367, 0.4488364, 2.515222, 1, 0, 0.6078432, 1,
1.372278, 1.456917, 0.813304, 1, 0, 0.6, 1,
1.392329, 1.054947, 0.2374779, 1, 0, 0.5921569, 1,
1.429422, -0.5739362, 3.876814, 1, 0, 0.5882353, 1,
1.440517, 0.1035673, 0.2948473, 1, 0, 0.5803922, 1,
1.445042, 0.7858445, 0.5788065, 1, 0, 0.5764706, 1,
1.450835, -0.1864165, 1.940989, 1, 0, 0.5686275, 1,
1.452235, -0.582089, 2.797939, 1, 0, 0.5647059, 1,
1.460032, -0.3694817, 2.708835, 1, 0, 0.5568628, 1,
1.462198, 0.1990541, 2.2033, 1, 0, 0.5529412, 1,
1.464353, -1.064813, 0.8955148, 1, 0, 0.5450981, 1,
1.470337, 0.4261748, 0.2316247, 1, 0, 0.5411765, 1,
1.473844, 0.2653825, -0.6685433, 1, 0, 0.5333334, 1,
1.474587, 0.1341519, 1.34066, 1, 0, 0.5294118, 1,
1.480779, -0.5326561, 3.386885, 1, 0, 0.5215687, 1,
1.488873, 1.872491, -0.143192, 1, 0, 0.5176471, 1,
1.495651, 0.5217659, 1.981781, 1, 0, 0.509804, 1,
1.500509, 0.389657, 1.283521, 1, 0, 0.5058824, 1,
1.500747, 0.6013973, 1.793216, 1, 0, 0.4980392, 1,
1.503772, 0.9117385, 1.656471, 1, 0, 0.4901961, 1,
1.515868, 0.9201468, -0.08132233, 1, 0, 0.4862745, 1,
1.520642, 1.232134, 0.3205998, 1, 0, 0.4784314, 1,
1.520816, -0.1251274, 1.799841, 1, 0, 0.4745098, 1,
1.521611, 0.2977933, 1.247838, 1, 0, 0.4666667, 1,
1.5608, 0.6879056, 0.9540787, 1, 0, 0.4627451, 1,
1.566752, 0.03742776, 2.218352, 1, 0, 0.454902, 1,
1.568967, 0.4993319, 0.7353237, 1, 0, 0.4509804, 1,
1.575571, 0.2364645, 1.121802, 1, 0, 0.4431373, 1,
1.582656, -0.7297974, 1.830829, 1, 0, 0.4392157, 1,
1.59526, 0.7514249, 2.565886, 1, 0, 0.4313726, 1,
1.597204, 0.1781861, 1.038767, 1, 0, 0.427451, 1,
1.599167, 0.02938244, 2.370808, 1, 0, 0.4196078, 1,
1.603018, -1.074649, 1.434504, 1, 0, 0.4156863, 1,
1.611208, 0.4147193, -0.2935148, 1, 0, 0.4078431, 1,
1.635515, 0.9217428, 0.151433, 1, 0, 0.4039216, 1,
1.640574, 0.6227118, 0.6609658, 1, 0, 0.3960784, 1,
1.643249, -1.078458, 2.579914, 1, 0, 0.3882353, 1,
1.65999, 0.7093513, -0.5768743, 1, 0, 0.3843137, 1,
1.692178, -0.1086657, 2.026198, 1, 0, 0.3764706, 1,
1.699485, 1.574449, 0.7337147, 1, 0, 0.372549, 1,
1.70435, -1.068877, 2.318288, 1, 0, 0.3647059, 1,
1.719906, -1.620835, 0.1475365, 1, 0, 0.3607843, 1,
1.723052, -1.651676, 2.358036, 1, 0, 0.3529412, 1,
1.74071, 0.2276382, 0.5373181, 1, 0, 0.3490196, 1,
1.741814, 0.09652486, -0.01739766, 1, 0, 0.3411765, 1,
1.747375, 0.7041205, 0.9374426, 1, 0, 0.3372549, 1,
1.747931, 1.931502, 2.317642, 1, 0, 0.3294118, 1,
1.75363, -1.613573, 1.789567, 1, 0, 0.3254902, 1,
1.761408, -0.1160781, 1.186204, 1, 0, 0.3176471, 1,
1.778789, -0.04388411, 1.90237, 1, 0, 0.3137255, 1,
1.781231, -0.07315879, 1.717777, 1, 0, 0.3058824, 1,
1.781864, 1.013757, 2.779492, 1, 0, 0.2980392, 1,
1.787382, -0.9332515, 2.131229, 1, 0, 0.2941177, 1,
1.789374, -0.602616, 1.687951, 1, 0, 0.2862745, 1,
1.79074, 1.367996, -0.5303469, 1, 0, 0.282353, 1,
1.796607, -1.225016, 1.43513, 1, 0, 0.2745098, 1,
1.810907, 1.392261, 0.03178789, 1, 0, 0.2705882, 1,
1.821259, -1.008084, 2.569458, 1, 0, 0.2627451, 1,
1.821451, 0.5822701, 0.8108662, 1, 0, 0.2588235, 1,
1.833516, -1.69767, 2.865449, 1, 0, 0.2509804, 1,
1.861125, -0.7666361, 2.657921, 1, 0, 0.2470588, 1,
1.861167, -0.1327597, 1.677241, 1, 0, 0.2392157, 1,
1.872199, 0.3821271, 2.507627, 1, 0, 0.2352941, 1,
1.876052, -1.186227, 2.878628, 1, 0, 0.227451, 1,
1.897051, 0.8806155, -0.05284837, 1, 0, 0.2235294, 1,
1.897825, 0.6155, 3.324017, 1, 0, 0.2156863, 1,
1.899039, -2.151398, 1.643154, 1, 0, 0.2117647, 1,
1.926383, -0.2633931, 1.612377, 1, 0, 0.2039216, 1,
1.926788, -0.3608317, 1.469931, 1, 0, 0.1960784, 1,
1.940192, -0.0970681, 1.612677, 1, 0, 0.1921569, 1,
1.950866, -0.8868678, 2.493077, 1, 0, 0.1843137, 1,
1.964106, -0.0706442, 1.669445, 1, 0, 0.1803922, 1,
1.974288, 0.1052063, 0.1982747, 1, 0, 0.172549, 1,
2.016925, -1.071676, 3.972193, 1, 0, 0.1686275, 1,
2.109155, -1.413341, 2.588022, 1, 0, 0.1607843, 1,
2.111849, -0.8475559, 0.1715096, 1, 0, 0.1568628, 1,
2.117799, -0.2413851, 0.7900428, 1, 0, 0.1490196, 1,
2.143298, -0.4773046, 1.050294, 1, 0, 0.145098, 1,
2.144475, -1.213535, 1.615341, 1, 0, 0.1372549, 1,
2.146403, -1.439183, 0.9173131, 1, 0, 0.1333333, 1,
2.15074, -0.5457913, 0.5629333, 1, 0, 0.1254902, 1,
2.199875, -0.9192017, 2.542529, 1, 0, 0.1215686, 1,
2.211551, 0.6363777, 0.8190584, 1, 0, 0.1137255, 1,
2.226624, -0.002629002, 1.247581, 1, 0, 0.1098039, 1,
2.251904, 0.7745173, 1.223318, 1, 0, 0.1019608, 1,
2.26583, -1.137188, 1.41694, 1, 0, 0.09411765, 1,
2.273832, 0.2371017, -0.0471421, 1, 0, 0.09019608, 1,
2.279889, -0.4140798, 2.974938, 1, 0, 0.08235294, 1,
2.358106, 0.5927901, 1.644993, 1, 0, 0.07843138, 1,
2.374045, -0.6443623, 0.4645651, 1, 0, 0.07058824, 1,
2.430357, 2.018353, 1.204772, 1, 0, 0.06666667, 1,
2.542957, -0.005642081, 2.326513, 1, 0, 0.05882353, 1,
2.556945, -0.5944082, 2.642828, 1, 0, 0.05490196, 1,
2.701854, -1.204594, 3.723678, 1, 0, 0.04705882, 1,
2.732399, -0.9480613, 2.552396, 1, 0, 0.04313726, 1,
2.754591, -1.347027, 2.622613, 1, 0, 0.03529412, 1,
2.9648, -2.106764, 1.876691, 1, 0, 0.03137255, 1,
2.974452, -1.296233, 1.085205, 1, 0, 0.02352941, 1,
2.986682, 1.260678, 1.751238, 1, 0, 0.01960784, 1,
3.907058, 1.364127, 2.344488, 1, 0, 0.01176471, 1,
4.764407, 0.4616532, 1.028023, 1, 0, 0.007843138, 1
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
0.6456896, -4.320897, -6.736593, 0, -0.5, 0.5, 0.5,
0.6456896, -4.320897, -6.736593, 1, -0.5, 0.5, 0.5,
0.6456896, -4.320897, -6.736593, 1, 1.5, 0.5, 0.5,
0.6456896, -4.320897, -6.736593, 0, 1.5, 0.5, 0.5
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
-4.869273, -0.118338, -6.736593, 0, -0.5, 0.5, 0.5,
-4.869273, -0.118338, -6.736593, 1, -0.5, 0.5, 0.5,
-4.869273, -0.118338, -6.736593, 1, 1.5, 0.5, 0.5,
-4.869273, -0.118338, -6.736593, 0, 1.5, 0.5, 0.5
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
-4.869273, -4.320897, -0.01339412, 0, -0.5, 0.5, 0.5,
-4.869273, -4.320897, -0.01339412, 1, -0.5, 0.5, 0.5,
-4.869273, -4.320897, -0.01339412, 1, 1.5, 0.5, 0.5,
-4.869273, -4.320897, -0.01339412, 0, 1.5, 0.5, 0.5
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
-2, -3.351075, -5.185086,
4, -3.351075, -5.185086,
-2, -3.351075, -5.185086,
-2, -3.512712, -5.44367,
0, -3.351075, -5.185086,
0, -3.512712, -5.44367,
2, -3.351075, -5.185086,
2, -3.512712, -5.44367,
4, -3.351075, -5.185086,
4, -3.512712, -5.44367
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
"0",
"2",
"4"
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
-2, -3.835986, -5.960839, 0, -0.5, 0.5, 0.5,
-2, -3.835986, -5.960839, 1, -0.5, 0.5, 0.5,
-2, -3.835986, -5.960839, 1, 1.5, 0.5, 0.5,
-2, -3.835986, -5.960839, 0, 1.5, 0.5, 0.5,
0, -3.835986, -5.960839, 0, -0.5, 0.5, 0.5,
0, -3.835986, -5.960839, 1, -0.5, 0.5, 0.5,
0, -3.835986, -5.960839, 1, 1.5, 0.5, 0.5,
0, -3.835986, -5.960839, 0, 1.5, 0.5, 0.5,
2, -3.835986, -5.960839, 0, -0.5, 0.5, 0.5,
2, -3.835986, -5.960839, 1, -0.5, 0.5, 0.5,
2, -3.835986, -5.960839, 1, 1.5, 0.5, 0.5,
2, -3.835986, -5.960839, 0, 1.5, 0.5, 0.5,
4, -3.835986, -5.960839, 0, -0.5, 0.5, 0.5,
4, -3.835986, -5.960839, 1, -0.5, 0.5, 0.5,
4, -3.835986, -5.960839, 1, 1.5, 0.5, 0.5,
4, -3.835986, -5.960839, 0, 1.5, 0.5, 0.5
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
-3.59659, -3, -5.185086,
-3.59659, 3, -5.185086,
-3.59659, -3, -5.185086,
-3.808703, -3, -5.44367,
-3.59659, -2, -5.185086,
-3.808703, -2, -5.44367,
-3.59659, -1, -5.185086,
-3.808703, -1, -5.44367,
-3.59659, 0, -5.185086,
-3.808703, 0, -5.44367,
-3.59659, 1, -5.185086,
-3.808703, 1, -5.44367,
-3.59659, 2, -5.185086,
-3.808703, 2, -5.44367,
-3.59659, 3, -5.185086,
-3.808703, 3, -5.44367
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
-4.232931, -3, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, -3, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, -3, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, -3, -5.960839, 0, 1.5, 0.5, 0.5,
-4.232931, -2, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, -2, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, -2, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, -2, -5.960839, 0, 1.5, 0.5, 0.5,
-4.232931, -1, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, -1, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, -1, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, -1, -5.960839, 0, 1.5, 0.5, 0.5,
-4.232931, 0, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, 0, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, 0, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, 0, -5.960839, 0, 1.5, 0.5, 0.5,
-4.232931, 1, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, 1, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, 1, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, 1, -5.960839, 0, 1.5, 0.5, 0.5,
-4.232931, 2, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, 2, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, 2, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, 2, -5.960839, 0, 1.5, 0.5, 0.5,
-4.232931, 3, -5.960839, 0, -0.5, 0.5, 0.5,
-4.232931, 3, -5.960839, 1, -0.5, 0.5, 0.5,
-4.232931, 3, -5.960839, 1, 1.5, 0.5, 0.5,
-4.232931, 3, -5.960839, 0, 1.5, 0.5, 0.5
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
-3.59659, -3.351075, -4,
-3.59659, -3.351075, 4,
-3.59659, -3.351075, -4,
-3.808703, -3.512712, -4,
-3.59659, -3.351075, -2,
-3.808703, -3.512712, -2,
-3.59659, -3.351075, 0,
-3.808703, -3.512712, 0,
-3.59659, -3.351075, 2,
-3.808703, -3.512712, 2,
-3.59659, -3.351075, 4,
-3.808703, -3.512712, 4
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
-4.232931, -3.835986, -4, 0, -0.5, 0.5, 0.5,
-4.232931, -3.835986, -4, 1, -0.5, 0.5, 0.5,
-4.232931, -3.835986, -4, 1, 1.5, 0.5, 0.5,
-4.232931, -3.835986, -4, 0, 1.5, 0.5, 0.5,
-4.232931, -3.835986, -2, 0, -0.5, 0.5, 0.5,
-4.232931, -3.835986, -2, 1, -0.5, 0.5, 0.5,
-4.232931, -3.835986, -2, 1, 1.5, 0.5, 0.5,
-4.232931, -3.835986, -2, 0, 1.5, 0.5, 0.5,
-4.232931, -3.835986, 0, 0, -0.5, 0.5, 0.5,
-4.232931, -3.835986, 0, 1, -0.5, 0.5, 0.5,
-4.232931, -3.835986, 0, 1, 1.5, 0.5, 0.5,
-4.232931, -3.835986, 0, 0, 1.5, 0.5, 0.5,
-4.232931, -3.835986, 2, 0, -0.5, 0.5, 0.5,
-4.232931, -3.835986, 2, 1, -0.5, 0.5, 0.5,
-4.232931, -3.835986, 2, 1, 1.5, 0.5, 0.5,
-4.232931, -3.835986, 2, 0, 1.5, 0.5, 0.5,
-4.232931, -3.835986, 4, 0, -0.5, 0.5, 0.5,
-4.232931, -3.835986, 4, 1, -0.5, 0.5, 0.5,
-4.232931, -3.835986, 4, 1, 1.5, 0.5, 0.5,
-4.232931, -3.835986, 4, 0, 1.5, 0.5, 0.5
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
-3.59659, -3.351075, -5.185086,
-3.59659, 3.114399, -5.185086,
-3.59659, -3.351075, 5.158298,
-3.59659, 3.114399, 5.158298,
-3.59659, -3.351075, -5.185086,
-3.59659, -3.351075, 5.158298,
-3.59659, 3.114399, -5.185086,
-3.59659, 3.114399, 5.158298,
-3.59659, -3.351075, -5.185086,
4.887969, -3.351075, -5.185086,
-3.59659, -3.351075, 5.158298,
4.887969, -3.351075, 5.158298,
-3.59659, 3.114399, -5.185086,
4.887969, 3.114399, -5.185086,
-3.59659, 3.114399, 5.158298,
4.887969, 3.114399, 5.158298,
4.887969, -3.351075, -5.185086,
4.887969, 3.114399, -5.185086,
4.887969, -3.351075, 5.158298,
4.887969, 3.114399, 5.158298,
4.887969, -3.351075, -5.185086,
4.887969, -3.351075, 5.158298,
4.887969, 3.114399, -5.185086,
4.887969, 3.114399, 5.158298
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
var radius = 7.934162;
var distance = 35.29998;
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
mvMatrix.translate( -0.6456896, 0.118338, 0.01339412 );
mvMatrix.scale( 1.011081, 1.326828, 0.8293777 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29998);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Phencyclidine<-read.table("Phencyclidine.xyz")
```

```
## Error in read.table("Phencyclidine.xyz"): no lines available in input
```

```r
x<-Phencyclidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phencyclidine' not found
```

```r
y<-Phencyclidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phencyclidine' not found
```

```r
z<-Phencyclidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phencyclidine' not found
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
-3.473028, -0.8499835, -2.365309, 0, 0, 1, 1, 1,
-2.665834, -0.6033581, -3.15125, 1, 0, 0, 1, 1,
-2.618112, 0.272521, -1.77654, 1, 0, 0, 1, 1,
-2.592262, -0.3421642, -3.407657, 1, 0, 0, 1, 1,
-2.585105, 0.856694, -1.943672, 1, 0, 0, 1, 1,
-2.542051, -1.287919, -1.096931, 1, 0, 0, 1, 1,
-2.420256, -0.7946766, -0.2011977, 0, 0, 0, 1, 1,
-2.285553, -1.014956, -1.177363, 0, 0, 0, 1, 1,
-2.259117, 0.4236411, -2.021977, 0, 0, 0, 1, 1,
-2.235856, -2.416056, -3.592587, 0, 0, 0, 1, 1,
-2.201487, 0.8692758, -0.3196395, 0, 0, 0, 1, 1,
-2.142262, 1.252882, -0.4172107, 0, 0, 0, 1, 1,
-2.139326, -0.1263438, -2.888811, 0, 0, 0, 1, 1,
-2.116571, -1.317846, -1.899569, 1, 1, 1, 1, 1,
-2.093093, -0.5430883, -0.6110827, 1, 1, 1, 1, 1,
-2.09239, -0.2732337, -3.872612, 1, 1, 1, 1, 1,
-2.080119, 0.7505506, -1.341791, 1, 1, 1, 1, 1,
-2.043594, 0.6101713, -1.987265, 1, 1, 1, 1, 1,
-2.037855, -0.2637031, -1.415609, 1, 1, 1, 1, 1,
-2.036783, -0.3690268, -4.29636, 1, 1, 1, 1, 1,
-2.02908, -1.299129, -2.293714, 1, 1, 1, 1, 1,
-2.007508, -0.6059209, -1.663215, 1, 1, 1, 1, 1,
-1.98452, 0.4251152, -1.318029, 1, 1, 1, 1, 1,
-1.981054, 0.7131596, -0.8083944, 1, 1, 1, 1, 1,
-1.889168, 1.887691, -1.557197, 1, 1, 1, 1, 1,
-1.879701, 0.1647417, -3.857523, 1, 1, 1, 1, 1,
-1.874354, 0.3784726, -1.870986, 1, 1, 1, 1, 1,
-1.857962, -0.201617, -1.733526, 1, 1, 1, 1, 1,
-1.856037, 1.542419, -0.9504843, 0, 0, 1, 1, 1,
-1.844737, 0.7538822, 0.0565025, 1, 0, 0, 1, 1,
-1.844359, -1.636023, -2.369586, 1, 0, 0, 1, 1,
-1.836308, 0.8904677, 1.418276, 1, 0, 0, 1, 1,
-1.830997, 0.2131703, -1.416317, 1, 0, 0, 1, 1,
-1.813453, 0.9104, -2.718378, 1, 0, 0, 1, 1,
-1.798793, 0.6098405, -3.485805, 0, 0, 0, 1, 1,
-1.797145, -0.4557284, -0.207762, 0, 0, 0, 1, 1,
-1.796558, -1.051156, -1.624141, 0, 0, 0, 1, 1,
-1.782622, 0.8591332, -0.6024523, 0, 0, 0, 1, 1,
-1.756947, 0.8064955, -1.605264, 0, 0, 0, 1, 1,
-1.752652, -0.465384, -1.898418, 0, 0, 0, 1, 1,
-1.747194, 0.2337038, -1.087619, 0, 0, 0, 1, 1,
-1.727106, 0.6478003, -2.099536, 1, 1, 1, 1, 1,
-1.724846, -0.4449661, -2.549444, 1, 1, 1, 1, 1,
-1.720535, -1.207636, -3.866558, 1, 1, 1, 1, 1,
-1.713346, -0.2846124, -2.457344, 1, 1, 1, 1, 1,
-1.708746, -0.9756117, -2.555993, 1, 1, 1, 1, 1,
-1.707057, -1.122711, -0.9708232, 1, 1, 1, 1, 1,
-1.696535, -0.1615599, -0.2300082, 1, 1, 1, 1, 1,
-1.693329, 0.4901406, -1.148029, 1, 1, 1, 1, 1,
-1.685244, -0.3058709, -1.428724, 1, 1, 1, 1, 1,
-1.683051, 2.363802, -0.1389468, 1, 1, 1, 1, 1,
-1.65688, -1.639849, -2.291747, 1, 1, 1, 1, 1,
-1.650133, 0.9402495, -0.4665227, 1, 1, 1, 1, 1,
-1.619822, -0.7612039, -1.171676, 1, 1, 1, 1, 1,
-1.579514, -0.3606102, -3.414225, 1, 1, 1, 1, 1,
-1.56965, 0.5632197, -0.6769568, 1, 1, 1, 1, 1,
-1.566388, 0.688123, -0.908066, 0, 0, 1, 1, 1,
-1.558405, 0.1522924, -0.6283363, 1, 0, 0, 1, 1,
-1.55101, -0.4134989, -4.468693, 1, 0, 0, 1, 1,
-1.544787, 0.7483001, -1.312621, 1, 0, 0, 1, 1,
-1.543468, 0.2857117, -1.169743, 1, 0, 0, 1, 1,
-1.535969, -0.1451942, -0.05050032, 1, 0, 0, 1, 1,
-1.529927, 0.0005442057, -1.575695, 0, 0, 0, 1, 1,
-1.522419, 1.275266, -0.3929849, 0, 0, 0, 1, 1,
-1.516043, 1.426012, -1.029995, 0, 0, 0, 1, 1,
-1.513797, 1.432719, -0.9323817, 0, 0, 0, 1, 1,
-1.512194, -0.1354123, -1.581471, 0, 0, 0, 1, 1,
-1.482676, 0.9748467, 0.921914, 0, 0, 0, 1, 1,
-1.481989, 1.144456, 1.573612, 0, 0, 0, 1, 1,
-1.470387, 1.352967, -1.462212, 1, 1, 1, 1, 1,
-1.448514, 0.2746591, -1.206678, 1, 1, 1, 1, 1,
-1.447619, 0.3561036, -2.074883, 1, 1, 1, 1, 1,
-1.438022, 0.5059884, -0.1853454, 1, 1, 1, 1, 1,
-1.437484, 1.130397, -0.1527952, 1, 1, 1, 1, 1,
-1.428104, 0.6523322, -2.787216, 1, 1, 1, 1, 1,
-1.424388, -0.9872885, -2.66779, 1, 1, 1, 1, 1,
-1.423856, 0.01471565, -1.923244, 1, 1, 1, 1, 1,
-1.416919, 1.275009, -0.6041278, 1, 1, 1, 1, 1,
-1.41496, 0.8670983, -2.355807, 1, 1, 1, 1, 1,
-1.405833, 0.5431076, -2.778937, 1, 1, 1, 1, 1,
-1.405216, -1.24168, -1.194307, 1, 1, 1, 1, 1,
-1.40406, -1.429472, -2.58202, 1, 1, 1, 1, 1,
-1.403846, -0.1693805, -1.506267, 1, 1, 1, 1, 1,
-1.403399, 0.2000262, -1.421973, 1, 1, 1, 1, 1,
-1.384465, -1.108422, -1.911745, 0, 0, 1, 1, 1,
-1.383474, -1.155124, -1.339561, 1, 0, 0, 1, 1,
-1.375013, -0.5884685, -2.748016, 1, 0, 0, 1, 1,
-1.372484, 0.6228796, -0.4907575, 1, 0, 0, 1, 1,
-1.366536, -0.6119605, -2.4038, 1, 0, 0, 1, 1,
-1.360909, 0.2127153, -0.9554066, 1, 0, 0, 1, 1,
-1.35416, 1.640467, -1.046906, 0, 0, 0, 1, 1,
-1.351646, 0.08681184, -1.09783, 0, 0, 0, 1, 1,
-1.350222, -1.441559, -1.766203, 0, 0, 0, 1, 1,
-1.344113, -0.3639268, -0.9447449, 0, 0, 0, 1, 1,
-1.341212, 0.4968755, -3.430664, 0, 0, 0, 1, 1,
-1.327605, -1.045659, -1.434852, 0, 0, 0, 1, 1,
-1.327075, 0.3103312, -2.670489, 0, 0, 0, 1, 1,
-1.31291, -0.5522439, -2.072596, 1, 1, 1, 1, 1,
-1.311985, -0.3680697, -2.847658, 1, 1, 1, 1, 1,
-1.310349, 2.000994, -1.560119, 1, 1, 1, 1, 1,
-1.300413, -0.9744899, -2.767125, 1, 1, 1, 1, 1,
-1.289105, 1.213999, -1.805126, 1, 1, 1, 1, 1,
-1.282903, 0.6695972, -1.193113, 1, 1, 1, 1, 1,
-1.275065, 1.367241, -1.401284, 1, 1, 1, 1, 1,
-1.273631, 1.086048, -3.096936, 1, 1, 1, 1, 1,
-1.266573, -0.06120492, -2.383469, 1, 1, 1, 1, 1,
-1.254212, 0.8400121, -1.170553, 1, 1, 1, 1, 1,
-1.250274, -1.014057, -1.704805, 1, 1, 1, 1, 1,
-1.241183, -0.3490365, -1.697873, 1, 1, 1, 1, 1,
-1.240818, -0.2629094, -1.064566, 1, 1, 1, 1, 1,
-1.239906, 0.2199587, -2.003628, 1, 1, 1, 1, 1,
-1.2341, 1.648451, 0.6674736, 1, 1, 1, 1, 1,
-1.232105, 0.6119462, 0.1549714, 0, 0, 1, 1, 1,
-1.228471, 0.8915434, -0.8309294, 1, 0, 0, 1, 1,
-1.217802, -0.7405673, -1.796886, 1, 0, 0, 1, 1,
-1.212574, -0.7679935, -2.16847, 1, 0, 0, 1, 1,
-1.20898, 0.3159292, -2.029878, 1, 0, 0, 1, 1,
-1.201265, -0.03777601, 0.3083075, 1, 0, 0, 1, 1,
-1.187339, 2.110275, -0.9234086, 0, 0, 0, 1, 1,
-1.18349, 0.3363161, -1.176764, 0, 0, 0, 1, 1,
-1.175512, -0.2960566, -2.409405, 0, 0, 0, 1, 1,
-1.16829, 0.1730365, -2.588129, 0, 0, 0, 1, 1,
-1.168181, 0.774434, -1.606825, 0, 0, 0, 1, 1,
-1.162777, -1.396855, -2.70356, 0, 0, 0, 1, 1,
-1.161472, -0.4890236, -2.171816, 0, 0, 0, 1, 1,
-1.15645, 0.5530582, -0.5529592, 1, 1, 1, 1, 1,
-1.149957, -0.3011553, -0.6418089, 1, 1, 1, 1, 1,
-1.146052, -0.8941445, -3.440827, 1, 1, 1, 1, 1,
-1.139142, -0.2620115, -2.885364, 1, 1, 1, 1, 1,
-1.138556, 1.10142, -0.05977434, 1, 1, 1, 1, 1,
-1.137625, 1.075072, -0.3781891, 1, 1, 1, 1, 1,
-1.136989, 0.3950323, -2.023044, 1, 1, 1, 1, 1,
-1.133994, 1.8557, -0.4963259, 1, 1, 1, 1, 1,
-1.130611, -0.7417369, -1.295541, 1, 1, 1, 1, 1,
-1.128057, -0.4923134, -3.001203, 1, 1, 1, 1, 1,
-1.126628, 0.5648656, 0.3538862, 1, 1, 1, 1, 1,
-1.11543, 0.1656184, -2.764415, 1, 1, 1, 1, 1,
-1.113495, -0.06123677, -0.4227497, 1, 1, 1, 1, 1,
-1.111377, 1.491179, -0.6053941, 1, 1, 1, 1, 1,
-1.111292, 1.608241, -0.1615072, 1, 1, 1, 1, 1,
-1.110894, -1.130868, -0.2893412, 0, 0, 1, 1, 1,
-1.109699, -0.2389909, -2.854036, 1, 0, 0, 1, 1,
-1.108214, 0.397282, -1.110656, 1, 0, 0, 1, 1,
-1.10071, 1.681081, -1.324739, 1, 0, 0, 1, 1,
-1.099592, 0.7663111, -2.283093, 1, 0, 0, 1, 1,
-1.095741, -0.5859492, -2.081667, 1, 0, 0, 1, 1,
-1.085665, -0.6205998, 0.1839519, 0, 0, 0, 1, 1,
-1.052056, 0.6210146, 0.4749026, 0, 0, 0, 1, 1,
-1.050131, 1.551767, -1.116531, 0, 0, 0, 1, 1,
-1.048914, -0.77022, -4.622572, 0, 0, 0, 1, 1,
-1.044402, 0.3148401, -2.239374, 0, 0, 0, 1, 1,
-1.030306, -2.6382, -2.863402, 0, 0, 0, 1, 1,
-1.027205, 0.07586096, -1.333829, 0, 0, 0, 1, 1,
-1.021147, -1.026305, -2.415197, 1, 1, 1, 1, 1,
-1.019822, -0.05722997, -3.478152, 1, 1, 1, 1, 1,
-1.019709, -0.5568011, -1.84797, 1, 1, 1, 1, 1,
-1.015148, 0.5843919, -0.6558242, 1, 1, 1, 1, 1,
-1.015121, 0.2711177, -0.8895398, 1, 1, 1, 1, 1,
-1.013518, -0.3244174, -1.657562, 1, 1, 1, 1, 1,
-1.012738, 0.8334381, -1.032796, 1, 1, 1, 1, 1,
-1.01009, -0.6423345, -1.040421, 1, 1, 1, 1, 1,
-1.005112, 0.2938311, -1.909856, 1, 1, 1, 1, 1,
-1.004914, -0.2300515, -1.316019, 1, 1, 1, 1, 1,
-1.001767, 0.777151, -1.43719, 1, 1, 1, 1, 1,
-0.9903345, 1.038705, -0.5440684, 1, 1, 1, 1, 1,
-0.9879152, -0.7166777, -2.391206, 1, 1, 1, 1, 1,
-0.9748062, 0.4691669, -1.032789, 1, 1, 1, 1, 1,
-0.9717381, -1.446916, -2.704116, 1, 1, 1, 1, 1,
-0.9638582, -0.8580513, -4.357843, 0, 0, 1, 1, 1,
-0.9620401, -0.04229603, -2.449512, 1, 0, 0, 1, 1,
-0.9587113, -0.1951103, -0.05495472, 1, 0, 0, 1, 1,
-0.9579242, -0.3365745, -1.413683, 1, 0, 0, 1, 1,
-0.9532622, 1.688714, -2.638773, 1, 0, 0, 1, 1,
-0.9524148, 0.4090667, -0.6752709, 1, 0, 0, 1, 1,
-0.949493, -0.5169563, -1.494264, 0, 0, 0, 1, 1,
-0.9490187, 1.03029, -0.1987426, 0, 0, 0, 1, 1,
-0.9433759, -1.152621, -4.032041, 0, 0, 0, 1, 1,
-0.9433099, 0.2009423, -1.312241, 0, 0, 0, 1, 1,
-0.9426537, -0.2353882, -2.025339, 0, 0, 0, 1, 1,
-0.9371997, -0.137814, -0.3477019, 0, 0, 0, 1, 1,
-0.9342831, -0.1294261, -1.689422, 0, 0, 0, 1, 1,
-0.931787, -0.8446299, -1.802781, 1, 1, 1, 1, 1,
-0.9310816, 0.8804206, -0.5365281, 1, 1, 1, 1, 1,
-0.9286685, -2.069686, -2.983602, 1, 1, 1, 1, 1,
-0.9278113, 0.4453622, -0.1575604, 1, 1, 1, 1, 1,
-0.9132442, -0.202878, -1.592923, 1, 1, 1, 1, 1,
-0.9113454, -0.420827, -0.1145416, 1, 1, 1, 1, 1,
-0.9096307, -0.8003381, -1.399508, 1, 1, 1, 1, 1,
-0.9063604, -0.8111192, -3.474357, 1, 1, 1, 1, 1,
-0.8957227, 1.031868, -1.423725, 1, 1, 1, 1, 1,
-0.8916703, -1.388554, -4.015661, 1, 1, 1, 1, 1,
-0.889333, 1.649876, 0.3694142, 1, 1, 1, 1, 1,
-0.8872061, 1.627988, -0.835097, 1, 1, 1, 1, 1,
-0.885065, -0.6494883, -3.914807, 1, 1, 1, 1, 1,
-0.8838353, 1.025405, -1.408886, 1, 1, 1, 1, 1,
-0.8782625, -1.072903, -0.6639148, 1, 1, 1, 1, 1,
-0.8776816, 1.567659, -0.9709078, 0, 0, 1, 1, 1,
-0.8774059, 0.8231545, 0.1724307, 1, 0, 0, 1, 1,
-0.8697872, 0.7238986, -2.055343, 1, 0, 0, 1, 1,
-0.8691903, -0.6645521, -1.733273, 1, 0, 0, 1, 1,
-0.8687211, 1.233124, -2.390142, 1, 0, 0, 1, 1,
-0.8554428, 0.3465978, -1.599379, 1, 0, 0, 1, 1,
-0.8463186, 2.122632, -0.1859455, 0, 0, 0, 1, 1,
-0.8435746, 0.5737979, 2.047962, 0, 0, 0, 1, 1,
-0.8319641, -0.7316755, -2.116001, 0, 0, 0, 1, 1,
-0.8271153, -0.2568147, -0.5941394, 0, 0, 0, 1, 1,
-0.8250546, -0.5235018, -0.5254311, 0, 0, 0, 1, 1,
-0.8165665, 0.2802781, -0.2387698, 0, 0, 0, 1, 1,
-0.8142623, 0.2006401, -2.079031, 0, 0, 0, 1, 1,
-0.8134719, -0.08435714, 0.3394711, 1, 1, 1, 1, 1,
-0.8122632, 0.3310674, -1.293931, 1, 1, 1, 1, 1,
-0.8122085, -0.5857341, -2.736487, 1, 1, 1, 1, 1,
-0.8104954, 0.8754412, 0.07005127, 1, 1, 1, 1, 1,
-0.8082942, -0.160569, -0.7602847, 1, 1, 1, 1, 1,
-0.8071842, 1.201626, -0.7207922, 1, 1, 1, 1, 1,
-0.8028185, 0.4778638, -0.918099, 1, 1, 1, 1, 1,
-0.7973961, -0.5983325, -2.031222, 1, 1, 1, 1, 1,
-0.7968975, 0.03577702, -0.6398409, 1, 1, 1, 1, 1,
-0.7954559, -0.8467888, -3.61224, 1, 1, 1, 1, 1,
-0.7945585, 0.6402589, -0.6709417, 1, 1, 1, 1, 1,
-0.7897811, 0.3631802, -1.005866, 1, 1, 1, 1, 1,
-0.7880446, 0.7704127, -0.3568957, 1, 1, 1, 1, 1,
-0.784636, -1.443487, -2.116087, 1, 1, 1, 1, 1,
-0.7815555, -1.219037, -3.008681, 1, 1, 1, 1, 1,
-0.777851, -0.05529297, -1.40241, 0, 0, 1, 1, 1,
-0.7731566, -2.503543, -2.675508, 1, 0, 0, 1, 1,
-0.7712832, 1.251341, -0.290525, 1, 0, 0, 1, 1,
-0.764958, -0.1475523, -3.376507, 1, 0, 0, 1, 1,
-0.7635365, -1.235736, -3.285503, 1, 0, 0, 1, 1,
-0.7585125, -0.4442781, -2.260594, 1, 0, 0, 1, 1,
-0.7544817, -1.428695, -2.20995, 0, 0, 0, 1, 1,
-0.750012, 0.7282522, -1.948396, 0, 0, 0, 1, 1,
-0.7487986, 1.589854, -1.314246, 0, 0, 0, 1, 1,
-0.7478625, -0.7558833, -2.606079, 0, 0, 0, 1, 1,
-0.7453738, 0.4018396, -0.005355406, 0, 0, 0, 1, 1,
-0.74101, -0.2051039, -0.6554158, 0, 0, 0, 1, 1,
-0.7377005, -0.01465333, -3.424643, 0, 0, 0, 1, 1,
-0.7315699, 0.4918038, -1.248398, 1, 1, 1, 1, 1,
-0.7255322, 0.9931388, -2.737439, 1, 1, 1, 1, 1,
-0.7239993, -0.06998146, -2.83644, 1, 1, 1, 1, 1,
-0.720718, 0.02602245, -2.846108, 1, 1, 1, 1, 1,
-0.7165545, -0.5430754, -1.604672, 1, 1, 1, 1, 1,
-0.7139581, -1.052974, -2.32763, 1, 1, 1, 1, 1,
-0.7096517, 1.550016, 0.1639951, 1, 1, 1, 1, 1,
-0.7029969, -1.654382, -2.636395, 1, 1, 1, 1, 1,
-0.7011979, 0.8198018, -0.9642713, 1, 1, 1, 1, 1,
-0.7000757, -0.1498753, -2.108124, 1, 1, 1, 1, 1,
-0.6997604, -1.690726, -2.04795, 1, 1, 1, 1, 1,
-0.6991524, 0.05853209, -2.298505, 1, 1, 1, 1, 1,
-0.6898921, 1.460424, -1.799872, 1, 1, 1, 1, 1,
-0.6803242, -1.222191, -2.131185, 1, 1, 1, 1, 1,
-0.6800597, -0.1007648, -4.323865, 1, 1, 1, 1, 1,
-0.6793066, -0.3218087, -1.720045, 0, 0, 1, 1, 1,
-0.6717125, -2.227607, -2.243685, 1, 0, 0, 1, 1,
-0.6706251, -1.464326, -5.034454, 1, 0, 0, 1, 1,
-0.6701941, -0.6791473, -1.193312, 1, 0, 0, 1, 1,
-0.6672586, -1.829292, -2.174403, 1, 0, 0, 1, 1,
-0.6650787, 1.316752, -0.6251906, 1, 0, 0, 1, 1,
-0.664563, 0.2497173, 0.4178195, 0, 0, 0, 1, 1,
-0.6641036, 2.300752, -0.5740692, 0, 0, 0, 1, 1,
-0.661072, 0.3971781, -2.489711, 0, 0, 0, 1, 1,
-0.6595418, 0.6515684, -0.5734897, 0, 0, 0, 1, 1,
-0.6547366, -0.6940537, -2.066813, 0, 0, 0, 1, 1,
-0.6538585, 0.5755075, -0.942951, 0, 0, 0, 1, 1,
-0.6536137, 0.04788429, 0.5352523, 0, 0, 0, 1, 1,
-0.6516889, -2.636038, -1.33077, 1, 1, 1, 1, 1,
-0.6493719, 0.8830338, -2.101768, 1, 1, 1, 1, 1,
-0.6490986, -0.4914414, -2.743473, 1, 1, 1, 1, 1,
-0.6427999, -0.1712713, -0.8691906, 1, 1, 1, 1, 1,
-0.6426359, 0.1106736, -0.6229232, 1, 1, 1, 1, 1,
-0.6361369, 0.7372851, 3.101191, 1, 1, 1, 1, 1,
-0.6327066, -0.01962031, -1.490513, 1, 1, 1, 1, 1,
-0.6265814, -0.6333734, -2.619445, 1, 1, 1, 1, 1,
-0.624878, -1.597745, -3.336526, 1, 1, 1, 1, 1,
-0.6210822, 1.569297, -0.9338357, 1, 1, 1, 1, 1,
-0.6172897, 1.492907, -1.832478, 1, 1, 1, 1, 1,
-0.6106905, -0.5131278, -1.532508, 1, 1, 1, 1, 1,
-0.6100626, -1.720079, -1.71094, 1, 1, 1, 1, 1,
-0.6086515, -1.089226, -2.44722, 1, 1, 1, 1, 1,
-0.6028163, -0.5807856, -3.474512, 1, 1, 1, 1, 1,
-0.6012416, -0.05791169, -2.900434, 0, 0, 1, 1, 1,
-0.5980516, -1.461403, -1.862617, 1, 0, 0, 1, 1,
-0.5938287, -0.06798816, -1.155178, 1, 0, 0, 1, 1,
-0.5924356, 1.142604, -1.175595, 1, 0, 0, 1, 1,
-0.5764366, -0.1184209, -1.254695, 1, 0, 0, 1, 1,
-0.5751481, 0.2242797, -0.8296716, 1, 0, 0, 1, 1,
-0.5735916, -1.314234, -4.236648, 0, 0, 0, 1, 1,
-0.5712503, 0.6150604, -3.945566, 0, 0, 0, 1, 1,
-0.5667195, 0.629961, -1.134824, 0, 0, 0, 1, 1,
-0.5663372, -0.4557596, -3.716339, 0, 0, 0, 1, 1,
-0.566139, -0.4969327, -0.5066711, 0, 0, 0, 1, 1,
-0.5589232, 0.9097506, -1.668735, 0, 0, 0, 1, 1,
-0.5579095, -0.05003809, -2.778206, 0, 0, 0, 1, 1,
-0.5573467, -1.98797, -3.47006, 1, 1, 1, 1, 1,
-0.5521159, 1.210087, 0.3995864, 1, 1, 1, 1, 1,
-0.5507393, 1.231193, 0.1375282, 1, 1, 1, 1, 1,
-0.5478769, -1.525755, -3.920758, 1, 1, 1, 1, 1,
-0.5445542, 1.393868, -2.073353, 1, 1, 1, 1, 1,
-0.5428625, 0.9753753, -3.173388, 1, 1, 1, 1, 1,
-0.5395559, -0.06002944, -1.913892, 1, 1, 1, 1, 1,
-0.539217, -0.7745917, -3.413799, 1, 1, 1, 1, 1,
-0.5388715, 2.469351, -0.5023397, 1, 1, 1, 1, 1,
-0.530872, -1.007457, -2.257855, 1, 1, 1, 1, 1,
-0.5301694, -0.5225266, -2.464835, 1, 1, 1, 1, 1,
-0.5268825, -0.9338516, -1.51945, 1, 1, 1, 1, 1,
-0.5262808, 2.541852, -1.360699, 1, 1, 1, 1, 1,
-0.5255873, -0.4465052, -0.5756167, 1, 1, 1, 1, 1,
-0.521935, 0.7641623, -0.7543026, 1, 1, 1, 1, 1,
-0.5184777, 0.5626078, -0.6126059, 0, 0, 1, 1, 1,
-0.5147397, -0.6777819, -0.9966958, 1, 0, 0, 1, 1,
-0.5140736, 0.03245826, 0.4068834, 1, 0, 0, 1, 1,
-0.5125588, 1.036397, -2.039518, 1, 0, 0, 1, 1,
-0.5111694, -3.256918, -1.4939, 1, 0, 0, 1, 1,
-0.5108635, 1.104609, 2.019344, 1, 0, 0, 1, 1,
-0.5061039, 0.08980252, -2.308837, 0, 0, 0, 1, 1,
-0.5049258, -0.5200807, -1.492038, 0, 0, 0, 1, 1,
-0.5042542, -0.7378182, -3.064034, 0, 0, 0, 1, 1,
-0.5026886, -0.9157991, -2.358878, 0, 0, 0, 1, 1,
-0.50235, 0.7768351, -1.756889, 0, 0, 0, 1, 1,
-0.5011349, 1.245539, 0.05752986, 0, 0, 0, 1, 1,
-0.4996106, -0.3433736, -1.675077, 0, 0, 0, 1, 1,
-0.4980753, -0.8626959, -1.899457, 1, 1, 1, 1, 1,
-0.4977702, 0.4608246, 0.0019102, 1, 1, 1, 1, 1,
-0.4958227, 0.510947, 0.3923496, 1, 1, 1, 1, 1,
-0.4926499, 0.5280061, -0.211179, 1, 1, 1, 1, 1,
-0.4906642, -0.6644498, -3.7101, 1, 1, 1, 1, 1,
-0.4895577, -1.036775, -2.815988, 1, 1, 1, 1, 1,
-0.4878046, 0.7844724, -0.4143603, 1, 1, 1, 1, 1,
-0.4855269, 0.2621954, 0.08869436, 1, 1, 1, 1, 1,
-0.4855234, 0.409323, -0.4723863, 1, 1, 1, 1, 1,
-0.4838646, 0.9321808, -1.289827, 1, 1, 1, 1, 1,
-0.4767849, 1.146712, -0.5208029, 1, 1, 1, 1, 1,
-0.474222, -0.553861, -3.074869, 1, 1, 1, 1, 1,
-0.4736802, -1.43957, -4.63726, 1, 1, 1, 1, 1,
-0.4697963, -0.3652646, -3.07331, 1, 1, 1, 1, 1,
-0.4601676, 0.3400007, -1.544855, 1, 1, 1, 1, 1,
-0.4533017, 0.3738734, -1.491736, 0, 0, 1, 1, 1,
-0.4511101, 0.00365876, -3.387798, 1, 0, 0, 1, 1,
-0.4437036, -0.1263047, -2.562842, 1, 0, 0, 1, 1,
-0.4358469, -0.3647726, -3.502596, 1, 0, 0, 1, 1,
-0.432039, -0.25821, -1.368765, 1, 0, 0, 1, 1,
-0.4239049, 0.5759491, 0.353901, 1, 0, 0, 1, 1,
-0.4213338, -1.408655, -4.436546, 0, 0, 0, 1, 1,
-0.4172547, -2.053416, -2.983261, 0, 0, 0, 1, 1,
-0.4170981, 0.3179478, -0.6524285, 0, 0, 0, 1, 1,
-0.4109347, -0.100958, -1.125699, 0, 0, 0, 1, 1,
-0.4074487, 0.7486588, 1.272336, 0, 0, 0, 1, 1,
-0.4069349, -0.4296665, -1.324007, 0, 0, 0, 1, 1,
-0.4062124, 0.3878278, -1.21077, 0, 0, 0, 1, 1,
-0.4058618, 0.7150961, 0.08661121, 1, 1, 1, 1, 1,
-0.4042313, -0.2558105, -3.853478, 1, 1, 1, 1, 1,
-0.4025392, 1.213202, 0.5987599, 1, 1, 1, 1, 1,
-0.402364, -1.501516, -3.294914, 1, 1, 1, 1, 1,
-0.4012165, -0.2530234, -2.680899, 1, 1, 1, 1, 1,
-0.3913567, -0.2010346, -1.438388, 1, 1, 1, 1, 1,
-0.3912386, 0.3226837, -1.482789, 1, 1, 1, 1, 1,
-0.3892322, -1.400197, -0.1770558, 1, 1, 1, 1, 1,
-0.3825133, 0.06865618, -1.096662, 1, 1, 1, 1, 1,
-0.3769311, 0.02894621, -2.632189, 1, 1, 1, 1, 1,
-0.3769086, -0.1257252, -2.910109, 1, 1, 1, 1, 1,
-0.3712296, -0.862427, -2.040677, 1, 1, 1, 1, 1,
-0.3701914, -0.02013249, -0.2062436, 1, 1, 1, 1, 1,
-0.3682701, 0.09830692, -2.409867, 1, 1, 1, 1, 1,
-0.3645221, -0.5652515, -2.619094, 1, 1, 1, 1, 1,
-0.3643605, 0.1054452, -1.974543, 0, 0, 1, 1, 1,
-0.3629673, 0.4705311, -1.685633, 1, 0, 0, 1, 1,
-0.3627322, -1.058154, -4.081103, 1, 0, 0, 1, 1,
-0.3606446, 0.02717709, -1.07288, 1, 0, 0, 1, 1,
-0.3586436, 0.1892131, -1.181907, 1, 0, 0, 1, 1,
-0.3565296, -0.4794124, -2.360692, 1, 0, 0, 1, 1,
-0.3558619, 1.146966, -1.920698, 0, 0, 0, 1, 1,
-0.3553754, 1.093159, -1.337578, 0, 0, 0, 1, 1,
-0.351772, -0.4246206, -1.824183, 0, 0, 0, 1, 1,
-0.3451777, 0.5113946, 0.4084865, 0, 0, 0, 1, 1,
-0.3400598, 0.8600312, -2.09628, 0, 0, 0, 1, 1,
-0.3395791, -0.8294774, -2.789022, 0, 0, 0, 1, 1,
-0.3357317, 0.4941486, -1.012275, 0, 0, 0, 1, 1,
-0.3337432, 0.196463, -1.526697, 1, 1, 1, 1, 1,
-0.3319158, -0.4395897, -2.68773, 1, 1, 1, 1, 1,
-0.3317946, 0.657965, -1.977383, 1, 1, 1, 1, 1,
-0.3310191, 0.3091168, -1.375469, 1, 1, 1, 1, 1,
-0.3297894, 0.8254037, -0.3024198, 1, 1, 1, 1, 1,
-0.323233, 1.423755, 0.3965666, 1, 1, 1, 1, 1,
-0.3231012, -0.6912258, -2.263009, 1, 1, 1, 1, 1,
-0.3227502, -0.07878178, -1.562955, 1, 1, 1, 1, 1,
-0.3225496, 0.1339212, 0.4710813, 1, 1, 1, 1, 1,
-0.322342, -0.839668, -3.332417, 1, 1, 1, 1, 1,
-0.3191673, 0.8881177, 0.2482767, 1, 1, 1, 1, 1,
-0.3190113, -0.833165, -0.7838285, 1, 1, 1, 1, 1,
-0.3181781, -0.7235504, -3.934858, 1, 1, 1, 1, 1,
-0.3142415, 1.22737, -1.08435, 1, 1, 1, 1, 1,
-0.3129769, -1.35475, -3.844898, 1, 1, 1, 1, 1,
-0.3090335, 0.1946492, -2.240066, 0, 0, 1, 1, 1,
-0.3076389, 0.3399114, 0.1774761, 1, 0, 0, 1, 1,
-0.2996556, -0.9660009, -3.6098, 1, 0, 0, 1, 1,
-0.2994117, -0.6023257, -4.012164, 1, 0, 0, 1, 1,
-0.297353, 1.006683, 0.8559195, 1, 0, 0, 1, 1,
-0.2950181, 1.117152, -1.100005, 1, 0, 0, 1, 1,
-0.2840922, -0.25262, -2.059567, 0, 0, 0, 1, 1,
-0.2834097, -0.09796613, -1.304797, 0, 0, 0, 1, 1,
-0.2830358, -1.228261, -2.839521, 0, 0, 0, 1, 1,
-0.2803128, -1.182521, -4.109448, 0, 0, 0, 1, 1,
-0.2791965, -0.6445426, -3.201498, 0, 0, 0, 1, 1,
-0.2755313, -1.618847, -4.169325, 0, 0, 0, 1, 1,
-0.2640075, -0.03797424, -1.82849, 0, 0, 0, 1, 1,
-0.263324, -1.212669, -3.819185, 1, 1, 1, 1, 1,
-0.2511699, -1.027023, -2.509408, 1, 1, 1, 1, 1,
-0.2499755, 0.9830121, -1.63942, 1, 1, 1, 1, 1,
-0.2499687, 0.8506098, -1.836842, 1, 1, 1, 1, 1,
-0.2483408, 1.089366, 0.8727427, 1, 1, 1, 1, 1,
-0.2421159, -0.3186083, -3.058976, 1, 1, 1, 1, 1,
-0.2413595, 0.2300536, 1.427204, 1, 1, 1, 1, 1,
-0.2403132, -1.825824, -4.276906, 1, 1, 1, 1, 1,
-0.2396405, -0.9130504, -3.053726, 1, 1, 1, 1, 1,
-0.2381015, -0.4297245, -3.18808, 1, 1, 1, 1, 1,
-0.2347441, 1.273209, 0.01140666, 1, 1, 1, 1, 1,
-0.2304731, -0.688532, -2.753719, 1, 1, 1, 1, 1,
-0.2288506, 1.31125, -1.004517, 1, 1, 1, 1, 1,
-0.2280442, 0.377214, -2.736894, 1, 1, 1, 1, 1,
-0.2280086, -2.780278, -3.525016, 1, 1, 1, 1, 1,
-0.226943, 0.2331918, 1.037774, 0, 0, 1, 1, 1,
-0.2197054, 0.6932619, 0.3507588, 1, 0, 0, 1, 1,
-0.2156038, -1.853776, -3.61272, 1, 0, 0, 1, 1,
-0.2118158, -1.355347, -1.741003, 1, 0, 0, 1, 1,
-0.2076722, 1.074958, -0.9633663, 1, 0, 0, 1, 1,
-0.2047418, -0.2213215, -1.646903, 1, 0, 0, 1, 1,
-0.2021807, -0.02357518, -2.605744, 0, 0, 0, 1, 1,
-0.2008122, 0.2945696, -0.1799779, 0, 0, 0, 1, 1,
-0.1966293, 0.2897723, -0.3795622, 0, 0, 0, 1, 1,
-0.1929079, -2.198632, -3.205383, 0, 0, 0, 1, 1,
-0.1914114, -0.8037827, -4.266146, 0, 0, 0, 1, 1,
-0.1903547, 0.1306365, -1.309752, 0, 0, 0, 1, 1,
-0.1870893, -0.5228478, -4.863572, 0, 0, 0, 1, 1,
-0.1860863, 0.4765994, -0.5447491, 1, 1, 1, 1, 1,
-0.1859123, -0.5528995, -2.85477, 1, 1, 1, 1, 1,
-0.1819492, -0.409495, -2.38977, 1, 1, 1, 1, 1,
-0.1778456, -0.6740291, -2.895288, 1, 1, 1, 1, 1,
-0.1763904, -0.9985021, -3.406366, 1, 1, 1, 1, 1,
-0.1750741, 0.2536106, 0.5083612, 1, 1, 1, 1, 1,
-0.1732669, 0.8361189, -0.3238852, 1, 1, 1, 1, 1,
-0.1730562, -0.6961918, -4.520555, 1, 1, 1, 1, 1,
-0.1680483, 0.7653005, 0.5169634, 1, 1, 1, 1, 1,
-0.1661167, -0.5496452, -2.39619, 1, 1, 1, 1, 1,
-0.1643869, 0.08885626, -2.510622, 1, 1, 1, 1, 1,
-0.1639249, 1.342577, -0.9785711, 1, 1, 1, 1, 1,
-0.1587166, -0.09087325, -0.9050952, 1, 1, 1, 1, 1,
-0.1553713, -1.842407, -3.289464, 1, 1, 1, 1, 1,
-0.1524964, 0.2415838, -0.5427604, 1, 1, 1, 1, 1,
-0.1505042, -2.166241, -2.97898, 0, 0, 1, 1, 1,
-0.1471389, 0.7818537, 2.290318, 1, 0, 0, 1, 1,
-0.1454114, 0.1003634, 0.5328513, 1, 0, 0, 1, 1,
-0.1451597, -0.1025713, -1.995622, 1, 0, 0, 1, 1,
-0.1437719, -1.477744, -1.843521, 1, 0, 0, 1, 1,
-0.1390374, -1.668666, -1.838306, 1, 0, 0, 1, 1,
-0.1376087, -0.4106045, -3.384748, 0, 0, 0, 1, 1,
-0.1370702, 1.091297, -0.7512026, 0, 0, 0, 1, 1,
-0.1303702, -0.7851564, -2.000457, 0, 0, 0, 1, 1,
-0.1214338, 0.6071284, -0.9670241, 0, 0, 0, 1, 1,
-0.1174491, 0.6505154, 0.2747191, 0, 0, 0, 1, 1,
-0.1168339, -0.5177249, -4.752131, 0, 0, 0, 1, 1,
-0.111786, 0.1971249, 0.9081392, 0, 0, 0, 1, 1,
-0.1019437, -0.07212009, -1.694203, 1, 1, 1, 1, 1,
-0.09928248, 1.621972, 1.464537, 1, 1, 1, 1, 1,
-0.09559583, 0.1673327, -0.8917838, 1, 1, 1, 1, 1,
-0.09489713, 0.1093335, -2.543626, 1, 1, 1, 1, 1,
-0.09463628, 0.421739, -1.502943, 1, 1, 1, 1, 1,
-0.08748881, 0.425838, 0.1579541, 1, 1, 1, 1, 1,
-0.08653294, -0.3023404, -3.090937, 1, 1, 1, 1, 1,
-0.08572767, 0.1546073, 1.348451, 1, 1, 1, 1, 1,
-0.08092822, 1.08755, -1.089661, 1, 1, 1, 1, 1,
-0.07461209, -1.45295, -2.678747, 1, 1, 1, 1, 1,
-0.07077839, -0.09966648, -4.25246, 1, 1, 1, 1, 1,
-0.06917208, 2.412903, 1.071669, 1, 1, 1, 1, 1,
-0.06442785, -0.2544777, -1.0594, 1, 1, 1, 1, 1,
-0.06429304, -0.6155345, -4.526761, 1, 1, 1, 1, 1,
-0.06354925, -1.29878, -0.6789554, 1, 1, 1, 1, 1,
-0.05877626, -1.524704, -2.44775, 0, 0, 1, 1, 1,
-0.05532908, 0.2140618, -1.281853, 1, 0, 0, 1, 1,
-0.05509711, -0.4107225, -2.487375, 1, 0, 0, 1, 1,
-0.05040814, -0.2691906, -2.933436, 1, 0, 0, 1, 1,
-0.0500135, 0.3765922, 0.4313761, 1, 0, 0, 1, 1,
-0.04972427, 0.8825259, 0.7988067, 1, 0, 0, 1, 1,
-0.04375878, -0.9134348, -3.18455, 0, 0, 0, 1, 1,
-0.03756071, 0.8588818, -0.6954995, 0, 0, 0, 1, 1,
-0.03595623, -0.4850752, -0.832184, 0, 0, 0, 1, 1,
-0.03376081, -0.1497969, -3.170208, 0, 0, 0, 1, 1,
-0.03167514, -0.6064224, -1.694705, 0, 0, 0, 1, 1,
-0.02851879, 1.975334, -1.949052, 0, 0, 0, 1, 1,
-0.02781224, 0.3768101, -0.19768, 0, 0, 0, 1, 1,
-0.02610971, -1.194632, -4.018816, 1, 1, 1, 1, 1,
-0.0222499, 0.5464752, 0.6521039, 1, 1, 1, 1, 1,
-0.02073301, -0.8570634, -4.469054, 1, 1, 1, 1, 1,
-0.01779584, 1.152809, -1.501348, 1, 1, 1, 1, 1,
-0.01596799, -1.462971, -4.196919, 1, 1, 1, 1, 1,
-0.01187508, -1.370763, -1.184981, 1, 1, 1, 1, 1,
-0.0005829333, 0.8818537, -0.4149927, 1, 1, 1, 1, 1,
-0.0004015775, 2.383855, -0.4493338, 1, 1, 1, 1, 1,
0.0007003059, -0.01845956, 4.148117, 1, 1, 1, 1, 1,
0.001830131, -0.1620222, 4.122843, 1, 1, 1, 1, 1,
0.004040385, 1.541552, 0.1067491, 1, 1, 1, 1, 1,
0.007655594, 1.135071, -0.7557094, 1, 1, 1, 1, 1,
0.008542163, 0.8510162, 0.2497355, 1, 1, 1, 1, 1,
0.008776617, 0.1435346, -0.7113214, 1, 1, 1, 1, 1,
0.008920387, 0.8283547, 1.711517, 1, 1, 1, 1, 1,
0.009450231, 0.3247371, 0.1566454, 0, 0, 1, 1, 1,
0.01302732, 1.115012, 1.74562, 1, 0, 0, 1, 1,
0.01438719, 1.003788, 0.2546248, 1, 0, 0, 1, 1,
0.01791819, 0.5035251, 2.516697, 1, 0, 0, 1, 1,
0.01881291, -0.7408105, 3.695145, 1, 0, 0, 1, 1,
0.01910183, 2.102787, 0.4806868, 1, 0, 0, 1, 1,
0.01979028, 0.32023, -0.007167746, 0, 0, 0, 1, 1,
0.02455459, -0.9877191, 3.021901, 0, 0, 0, 1, 1,
0.02669844, -0.4001669, 1.910071, 0, 0, 0, 1, 1,
0.03033773, -0.8630204, 3.78227, 0, 0, 0, 1, 1,
0.03352255, -1.007658, 2.390372, 0, 0, 0, 1, 1,
0.0339454, -0.3677965, 1.424779, 0, 0, 0, 1, 1,
0.03411584, 0.5156045, 0.3280538, 0, 0, 0, 1, 1,
0.03726587, 1.396253, 1.444875, 1, 1, 1, 1, 1,
0.03798718, 0.1441714, 0.7960273, 1, 1, 1, 1, 1,
0.04354454, 0.6173711, 2.231324, 1, 1, 1, 1, 1,
0.04490444, -0.9480841, 3.994091, 1, 1, 1, 1, 1,
0.04753946, 0.7071862, 0.7365044, 1, 1, 1, 1, 1,
0.05355574, 0.877933, 0.354031, 1, 1, 1, 1, 1,
0.05777245, 0.8623099, -0.03127842, 1, 1, 1, 1, 1,
0.0579156, -2.270133, 2.97441, 1, 1, 1, 1, 1,
0.05870515, -1.005331, 3.968604, 1, 1, 1, 1, 1,
0.06033203, -0.05906092, 2.217137, 1, 1, 1, 1, 1,
0.06423539, 0.1804124, -0.08027246, 1, 1, 1, 1, 1,
0.06533286, -1.116738, 1.848716, 1, 1, 1, 1, 1,
0.06877937, 0.2016396, -0.8986322, 1, 1, 1, 1, 1,
0.07028352, 0.7392741, -0.6280349, 1, 1, 1, 1, 1,
0.07364354, 0.04065474, 0.3774455, 1, 1, 1, 1, 1,
0.07480472, -0.9380469, 2.700397, 0, 0, 1, 1, 1,
0.07661392, 0.943633, -0.5495591, 1, 0, 0, 1, 1,
0.07698021, -0.5343511, 3.711917, 1, 0, 0, 1, 1,
0.08235312, 0.4997756, 0.79631, 1, 0, 0, 1, 1,
0.08235931, -0.8252829, 3.523796, 1, 0, 0, 1, 1,
0.08860923, -1.032882, 3.104146, 1, 0, 0, 1, 1,
0.08869513, 3.020242, 0.5246271, 0, 0, 0, 1, 1,
0.08989362, -0.6648416, 2.588182, 0, 0, 0, 1, 1,
0.08999466, -0.9019252, 1.199262, 0, 0, 0, 1, 1,
0.09056113, -0.3457877, 1.872323, 0, 0, 0, 1, 1,
0.09289893, -0.4225457, 3.209357, 0, 0, 0, 1, 1,
0.09792247, 0.5181483, 1.998072, 0, 0, 0, 1, 1,
0.09874219, -0.2602154, 4.322083, 0, 0, 0, 1, 1,
0.1046143, -0.4209527, 4.047949, 1, 1, 1, 1, 1,
0.1047576, 0.6596131, 0.08932104, 1, 1, 1, 1, 1,
0.1048547, -0.9753953, 4.401688, 1, 1, 1, 1, 1,
0.1060418, 1.385533, -0.07865463, 1, 1, 1, 1, 1,
0.109463, -0.7094204, 2.411046, 1, 1, 1, 1, 1,
0.1159362, -2.093887, 4.083591, 1, 1, 1, 1, 1,
0.1169816, 0.1282801, 1.993814, 1, 1, 1, 1, 1,
0.1192251, -0.674376, 3.407367, 1, 1, 1, 1, 1,
0.1277868, -0.9348993, 2.863202, 1, 1, 1, 1, 1,
0.1359319, -0.2838926, 1.961492, 1, 1, 1, 1, 1,
0.1371318, -0.01585125, 0.8743678, 1, 1, 1, 1, 1,
0.1428262, -0.6878316, 2.259844, 1, 1, 1, 1, 1,
0.1442889, 0.4388132, 1.656559, 1, 1, 1, 1, 1,
0.1451544, 0.7614496, -2.041893, 1, 1, 1, 1, 1,
0.1497842, 0.9396614, 0.131733, 1, 1, 1, 1, 1,
0.1502617, -0.9994094, 4.659276, 0, 0, 1, 1, 1,
0.1506953, -1.29229, 4.144984, 1, 0, 0, 1, 1,
0.1516811, -1.287682, 3.635419, 1, 0, 0, 1, 1,
0.1636554, 0.3118561, 2.386928, 1, 0, 0, 1, 1,
0.1639287, 1.204163, 1.772831, 1, 0, 0, 1, 1,
0.1658032, 0.07840062, 2.0562, 1, 0, 0, 1, 1,
0.1723933, -0.677394, 2.22841, 0, 0, 0, 1, 1,
0.172846, -0.2159889, 3.312367, 0, 0, 0, 1, 1,
0.1742223, -0.4181489, 3.031051, 0, 0, 0, 1, 1,
0.1802556, 0.5161612, 0.7253319, 0, 0, 0, 1, 1,
0.1862237, -1.026534, 2.71806, 0, 0, 0, 1, 1,
0.1877998, -1.406515, 3.697223, 0, 0, 0, 1, 1,
0.1881687, -0.1658583, 5.007666, 0, 0, 0, 1, 1,
0.1898719, 1.764004, 0.6081626, 1, 1, 1, 1, 1,
0.1904375, 0.8950842, -1.043108, 1, 1, 1, 1, 1,
0.2013011, 1.500094, -1.18128, 1, 1, 1, 1, 1,
0.2033943, 1.468222, 0.5387316, 1, 1, 1, 1, 1,
0.2033961, 1.872717, 0.2295775, 1, 1, 1, 1, 1,
0.2083922, 0.4264948, -0.06032287, 1, 1, 1, 1, 1,
0.2124476, 1.462215, -0.4497935, 1, 1, 1, 1, 1,
0.2125161, -0.1221142, 2.54804, 1, 1, 1, 1, 1,
0.2163894, 1.497073, 0.7150255, 1, 1, 1, 1, 1,
0.2164986, 0.7158824, -1.090844, 1, 1, 1, 1, 1,
0.2165048, 2.201503, -0.5643681, 1, 1, 1, 1, 1,
0.2197202, -0.8182698, 2.522356, 1, 1, 1, 1, 1,
0.2198401, 0.4571164, 0.6107977, 1, 1, 1, 1, 1,
0.2257242, 0.276815, 1.034424, 1, 1, 1, 1, 1,
0.2269423, -0.2696547, 1.498858, 1, 1, 1, 1, 1,
0.2296401, 0.453281, -0.7580626, 0, 0, 1, 1, 1,
0.2304859, -1.183345, 4.53478, 1, 0, 0, 1, 1,
0.2319698, 0.07611492, 2.23415, 1, 0, 0, 1, 1,
0.2321138, 0.9848646, -0.1692603, 1, 0, 0, 1, 1,
0.2337235, -0.5709308, 4.127539, 1, 0, 0, 1, 1,
0.2341767, 0.2043976, 0.8803153, 1, 0, 0, 1, 1,
0.2364831, -0.6342422, 2.761589, 0, 0, 0, 1, 1,
0.2433103, -0.5442421, 2.220037, 0, 0, 0, 1, 1,
0.2488919, -0.9529468, 3.420827, 0, 0, 0, 1, 1,
0.2504405, 0.2490269, -0.4209762, 0, 0, 0, 1, 1,
0.2521765, 1.438691, -0.2562344, 0, 0, 0, 1, 1,
0.2550395, -1.920068, 3.13054, 0, 0, 0, 1, 1,
0.2582405, 0.5598449, 1.309469, 0, 0, 0, 1, 1,
0.2641341, -0.00469865, 1.538063, 1, 1, 1, 1, 1,
0.2696712, 0.3943372, 1.129448, 1, 1, 1, 1, 1,
0.2725562, 1.685815, 0.7913498, 1, 1, 1, 1, 1,
0.2761608, 0.5499627, 1.06862, 1, 1, 1, 1, 1,
0.2776219, -0.4047302, 2.816778, 1, 1, 1, 1, 1,
0.2847779, -1.242288, 1.308592, 1, 1, 1, 1, 1,
0.2866646, -1.072384, 0.5707331, 1, 1, 1, 1, 1,
0.2867591, -0.4887101, 1.170962, 1, 1, 1, 1, 1,
0.2871378, 1.30287, 0.495361, 1, 1, 1, 1, 1,
0.2883668, -0.3256044, 2.363769, 1, 1, 1, 1, 1,
0.2909008, -1.070822, 2.865258, 1, 1, 1, 1, 1,
0.2974139, -1.78883, 3.630079, 1, 1, 1, 1, 1,
0.2976997, -0.825348, 4.547836, 1, 1, 1, 1, 1,
0.2988844, 0.4709042, 1.98894, 1, 1, 1, 1, 1,
0.2990256, 0.1614764, -0.8599706, 1, 1, 1, 1, 1,
0.3062467, 0.7600091, 0.1561028, 0, 0, 1, 1, 1,
0.3087198, -1.208544, 2.601641, 1, 0, 0, 1, 1,
0.3090106, 0.2001667, 2.095581, 1, 0, 0, 1, 1,
0.3131773, 0.1666641, 1.724985, 1, 0, 0, 1, 1,
0.3143108, -0.445683, 2.927982, 1, 0, 0, 1, 1,
0.3184312, 0.2701737, -1.533818, 1, 0, 0, 1, 1,
0.3252116, 0.5472095, -0.3055254, 0, 0, 0, 1, 1,
0.3309962, -0.6341634, 2.73823, 0, 0, 0, 1, 1,
0.3315845, -1.380506, 3.493557, 0, 0, 0, 1, 1,
0.3342304, -1.010746, 3.021632, 0, 0, 0, 1, 1,
0.3345008, -0.5391526, 1.564383, 0, 0, 0, 1, 1,
0.3358731, 2.003389, -0.5894384, 0, 0, 0, 1, 1,
0.3364431, -0.3068972, 2.951418, 0, 0, 0, 1, 1,
0.336492, -0.6950543, 2.109293, 1, 1, 1, 1, 1,
0.3366744, -1.040624, 2.573388, 1, 1, 1, 1, 1,
0.3367534, -0.5299585, 3.634636, 1, 1, 1, 1, 1,
0.3373851, -0.5453686, 1.538254, 1, 1, 1, 1, 1,
0.3419536, 0.09080379, 1.760792, 1, 1, 1, 1, 1,
0.3450131, 0.4798325, -1.142206, 1, 1, 1, 1, 1,
0.3459265, 0.05383445, 1.357353, 1, 1, 1, 1, 1,
0.3463752, -0.4969137, 2.500792, 1, 1, 1, 1, 1,
0.3519033, -2.326345, 3.929097, 1, 1, 1, 1, 1,
0.3559011, -1.308742, 2.900171, 1, 1, 1, 1, 1,
0.3559734, -1.157958, 3.51594, 1, 1, 1, 1, 1,
0.3569411, 0.8677868, 0.5208297, 1, 1, 1, 1, 1,
0.35892, 2.425924, -1.117664, 1, 1, 1, 1, 1,
0.3593792, 0.02592427, 1.810538, 1, 1, 1, 1, 1,
0.3614854, 0.155797, 1.507519, 1, 1, 1, 1, 1,
0.3621354, 0.5286807, -1.296502, 0, 0, 1, 1, 1,
0.3625444, 0.5613869, 0.315436, 1, 0, 0, 1, 1,
0.3715388, -0.3858907, 2.53472, 1, 0, 0, 1, 1,
0.3723634, 1.214507, -1.090241, 1, 0, 0, 1, 1,
0.3760728, 1.092841, -0.3982294, 1, 0, 0, 1, 1,
0.3789344, -0.8682942, 3.742276, 1, 0, 0, 1, 1,
0.3835061, 0.5281633, 1.696716, 0, 0, 0, 1, 1,
0.3869009, -0.6028557, 1.992852, 0, 0, 0, 1, 1,
0.3885708, -1.179564, 2.59846, 0, 0, 0, 1, 1,
0.3896291, -0.3144158, 3.527877, 0, 0, 0, 1, 1,
0.397295, 0.6163506, -1.062374, 0, 0, 0, 1, 1,
0.4006608, 0.04627565, 1.341344, 0, 0, 0, 1, 1,
0.4019811, -1.052553, 2.63522, 0, 0, 0, 1, 1,
0.4068604, 0.2645157, 1.177166, 1, 1, 1, 1, 1,
0.4090224, 0.4006293, 0.4677238, 1, 1, 1, 1, 1,
0.420005, -0.4601533, 1.357474, 1, 1, 1, 1, 1,
0.4203181, -1.293856, 2.795041, 1, 1, 1, 1, 1,
0.4210732, -0.331403, 1.571581, 1, 1, 1, 1, 1,
0.4272097, 1.632165, 1.706397, 1, 1, 1, 1, 1,
0.4314261, 1.579995, 1.094601, 1, 1, 1, 1, 1,
0.4326366, -0.9751416, 3.180517, 1, 1, 1, 1, 1,
0.4330662, -0.210731, 2.800199, 1, 1, 1, 1, 1,
0.4360425, 0.5971668, -0.1712428, 1, 1, 1, 1, 1,
0.4495336, -1.901215, 2.975751, 1, 1, 1, 1, 1,
0.4536807, -0.4673646, 4.019142, 1, 1, 1, 1, 1,
0.4586497, -0.5741478, 4.29313, 1, 1, 1, 1, 1,
0.4597233, -0.1092834, 1.890874, 1, 1, 1, 1, 1,
0.460614, 1.787219, 0.9445306, 1, 1, 1, 1, 1,
0.4614409, 0.02499586, 2.731912, 0, 0, 1, 1, 1,
0.464135, 0.3687521, 1.989688, 1, 0, 0, 1, 1,
0.4751796, -1.242972, 1.009669, 1, 0, 0, 1, 1,
0.4772817, -0.5320647, 3.240829, 1, 0, 0, 1, 1,
0.4791275, 0.0002806978, 0.7930747, 1, 0, 0, 1, 1,
0.4791298, 0.6766312, 0.3359058, 1, 0, 0, 1, 1,
0.4804682, 0.5853509, 1.300824, 0, 0, 0, 1, 1,
0.4817357, -0.2872259, 2.460488, 0, 0, 0, 1, 1,
0.481807, -0.007221158, 1.609606, 0, 0, 0, 1, 1,
0.4834419, 0.1020248, 0.945043, 0, 0, 0, 1, 1,
0.4870479, -0.7758639, 2.29745, 0, 0, 0, 1, 1,
0.4907495, -0.2666452, 2.649857, 0, 0, 0, 1, 1,
0.4928403, 0.2746075, 0.5716414, 0, 0, 0, 1, 1,
0.4940567, 0.37282, 0.3265227, 1, 1, 1, 1, 1,
0.4956173, -0.9745197, 3.433099, 1, 1, 1, 1, 1,
0.4965198, -3.00237, 2.104314, 1, 1, 1, 1, 1,
0.4970874, 1.114502, 0.4653778, 1, 1, 1, 1, 1,
0.497629, 1.000767, 1.223471, 1, 1, 1, 1, 1,
0.5009334, 0.7879311, -1.157992, 1, 1, 1, 1, 1,
0.5045481, -0.4320053, 3.127691, 1, 1, 1, 1, 1,
0.5049335, -1.695003, 2.212813, 1, 1, 1, 1, 1,
0.5056455, -0.6467385, 2.367788, 1, 1, 1, 1, 1,
0.50572, -0.2433315, 0.4723721, 1, 1, 1, 1, 1,
0.5092516, -0.3365792, 2.239865, 1, 1, 1, 1, 1,
0.5127746, 1.823226, 0.4431356, 1, 1, 1, 1, 1,
0.5138507, -0.6350158, -0.7268279, 1, 1, 1, 1, 1,
0.5216004, 0.2711426, 0.6069251, 1, 1, 1, 1, 1,
0.5355366, 0.6438578, 1.65562, 1, 1, 1, 1, 1,
0.5383087, 1.058044, 1.293002, 0, 0, 1, 1, 1,
0.5384156, -0.6227724, 2.573684, 1, 0, 0, 1, 1,
0.5387999, 1.223475, -0.07409906, 1, 0, 0, 1, 1,
0.5455676, 0.6298801, 0.6604828, 1, 0, 0, 1, 1,
0.5480963, 0.6431693, 1.214309, 1, 0, 0, 1, 1,
0.5540056, 0.01508403, 0.9529945, 1, 0, 0, 1, 1,
0.5604199, -1.813246, 3.455175, 0, 0, 0, 1, 1,
0.5619267, -0.9454044, 2.842627, 0, 0, 0, 1, 1,
0.5749267, 1.340111, 0.2897256, 0, 0, 0, 1, 1,
0.5776175, 0.7118697, 1.403478, 0, 0, 0, 1, 1,
0.5799268, 1.241106, 1.333762, 0, 0, 0, 1, 1,
0.5833791, -0.4522351, 3.233262, 0, 0, 0, 1, 1,
0.5835389, -0.8833095, 3.497558, 0, 0, 0, 1, 1,
0.5893624, -2.108067, 2.618276, 1, 1, 1, 1, 1,
0.6014896, 0.63432, 0.3145436, 1, 1, 1, 1, 1,
0.6088582, -0.08251811, 2.189943, 1, 1, 1, 1, 1,
0.6101406, -1.066196, -0.2121107, 1, 1, 1, 1, 1,
0.6139736, 1.497298, -1.348591, 1, 1, 1, 1, 1,
0.6141686, -0.4828306, 1.694114, 1, 1, 1, 1, 1,
0.6145823, 0.7813144, 1.464779, 1, 1, 1, 1, 1,
0.6171108, 1.191243, 1.345496, 1, 1, 1, 1, 1,
0.6175624, -2.33568, 2.506729, 1, 1, 1, 1, 1,
0.6179067, -1.181851, 1.705188, 1, 1, 1, 1, 1,
0.6191113, -0.2362417, 3.259855, 1, 1, 1, 1, 1,
0.6193953, 0.7019889, -0.3880111, 1, 1, 1, 1, 1,
0.6197917, -0.5635602, 2.460281, 1, 1, 1, 1, 1,
0.622529, -0.03573625, 2.707252, 1, 1, 1, 1, 1,
0.6331874, 0.5933715, -0.8766601, 1, 1, 1, 1, 1,
0.6354091, 0.7372553, 0.5333302, 0, 0, 1, 1, 1,
0.6355552, 1.252135, 1.568471, 1, 0, 0, 1, 1,
0.6362865, -0.8444893, 2.023752, 1, 0, 0, 1, 1,
0.6384663, 0.4767751, 0.8605754, 1, 0, 0, 1, 1,
0.6427839, -0.7932447, 2.185774, 1, 0, 0, 1, 1,
0.6494007, 0.05826287, -0.7424021, 1, 0, 0, 1, 1,
0.6550689, 0.1434319, 1.64361, 0, 0, 0, 1, 1,
0.656723, -1.132524, 3.231287, 0, 0, 0, 1, 1,
0.660051, 1.312238, 1.55065, 0, 0, 0, 1, 1,
0.6655264, 1.695915, -1.183575, 0, 0, 0, 1, 1,
0.6665563, 0.05763681, -0.3652564, 0, 0, 0, 1, 1,
0.6665771, 0.8282783, -0.03980811, 0, 0, 0, 1, 1,
0.6669677, -0.5299101, 1.325465, 0, 0, 0, 1, 1,
0.6724051, -0.2543976, 1.848976, 1, 1, 1, 1, 1,
0.6733779, 1.048976, 1.341282, 1, 1, 1, 1, 1,
0.6773353, -0.05945539, 2.720397, 1, 1, 1, 1, 1,
0.689673, 0.2270669, 1.269742, 1, 1, 1, 1, 1,
0.6927043, -0.1269275, 3.305814, 1, 1, 1, 1, 1,
0.6931393, -0.9010026, 0.1262217, 1, 1, 1, 1, 1,
0.6958413, 1.216035, -1.655899, 1, 1, 1, 1, 1,
0.697488, 0.805289, 0.5720567, 1, 1, 1, 1, 1,
0.7009446, -1.241966, 4.275009, 1, 1, 1, 1, 1,
0.7069759, -0.274557, 1.988962, 1, 1, 1, 1, 1,
0.7104958, -0.2608074, 3.097791, 1, 1, 1, 1, 1,
0.7176714, -0.7712188, 2.177845, 1, 1, 1, 1, 1,
0.7226368, 0.5604883, 0.1673966, 1, 1, 1, 1, 1,
0.7229214, -1.282198, 2.022951, 1, 1, 1, 1, 1,
0.7229269, 2.017404, -0.3168739, 1, 1, 1, 1, 1,
0.7281813, 1.663117, -0.1707045, 0, 0, 1, 1, 1,
0.7293879, -0.7585615, 0.6833866, 1, 0, 0, 1, 1,
0.73029, 0.3100176, 1.1195, 1, 0, 0, 1, 1,
0.7312478, 0.05645767, 2.119522, 1, 0, 0, 1, 1,
0.7323594, 0.09605293, 1.387874, 1, 0, 0, 1, 1,
0.7495136, 0.138674, 2.459617, 1, 0, 0, 1, 1,
0.7569689, 1.811288, 0.6278397, 0, 0, 0, 1, 1,
0.757175, 1.640633, -0.2225028, 0, 0, 0, 1, 1,
0.7587704, -1.468205, 0.8978905, 0, 0, 0, 1, 1,
0.76109, 0.3515218, 2.006123, 0, 0, 0, 1, 1,
0.77198, -0.2463819, 1.503907, 0, 0, 0, 1, 1,
0.7732787, -0.1053413, 2.026299, 0, 0, 0, 1, 1,
0.7869158, 0.2869491, 1.655603, 0, 0, 0, 1, 1,
0.7875347, 0.7420985, 1.297722, 1, 1, 1, 1, 1,
0.7902566, -0.5560336, 1.723356, 1, 1, 1, 1, 1,
0.7909489, 0.4368392, 0.02339208, 1, 1, 1, 1, 1,
0.7910574, -2.329489, 2.27315, 1, 1, 1, 1, 1,
0.7913811, 0.4781194, 0.1028997, 1, 1, 1, 1, 1,
0.7990102, 2.026091, 0.3555189, 1, 1, 1, 1, 1,
0.8116292, 1.203558, -0.7317576, 1, 1, 1, 1, 1,
0.814487, -0.6205232, 3.29671, 1, 1, 1, 1, 1,
0.8180891, -1.541921, 3.055966, 1, 1, 1, 1, 1,
0.8181587, 2.692404, -0.380104, 1, 1, 1, 1, 1,
0.819092, -0.3508982, 2.198646, 1, 1, 1, 1, 1,
0.820185, -1.048265, 1.654772, 1, 1, 1, 1, 1,
0.8210931, 0.3694209, 1.942814, 1, 1, 1, 1, 1,
0.8218666, -1.168606, 2.51697, 1, 1, 1, 1, 1,
0.8224633, 1.326994, -0.4596246, 1, 1, 1, 1, 1,
0.8247684, -0.07459714, 1.390844, 0, 0, 1, 1, 1,
0.8276489, 1.096334, 0.575891, 1, 0, 0, 1, 1,
0.833578, 0.6320421, -1.059158, 1, 0, 0, 1, 1,
0.8370007, 0.9595391, 1.535571, 1, 0, 0, 1, 1,
0.847038, -0.4040464, -0.4272153, 1, 0, 0, 1, 1,
0.8496009, 0.6338193, 1.06342, 1, 0, 0, 1, 1,
0.8567963, -0.4140018, 1.343637, 0, 0, 0, 1, 1,
0.8569806, -0.5156702, 1.604244, 0, 0, 0, 1, 1,
0.8577513, 1.502617, -0.14332, 0, 0, 0, 1, 1,
0.8600906, -0.1700251, 3.914331, 0, 0, 0, 1, 1,
0.8603958, -1.427011, 1.496686, 0, 0, 0, 1, 1,
0.8611374, 0.4375789, 1.406646, 0, 0, 0, 1, 1,
0.8622653, -0.2584164, 1.133392, 0, 0, 0, 1, 1,
0.8766698, -1.879624, 1.453581, 1, 1, 1, 1, 1,
0.8789901, -0.06045891, 4.050915, 1, 1, 1, 1, 1,
0.8822688, -1.042093, 3.006585, 1, 1, 1, 1, 1,
0.883117, -1.661663, 3.099944, 1, 1, 1, 1, 1,
0.8923922, -1.749315, 4.172387, 1, 1, 1, 1, 1,
0.8946449, -0.6576592, 2.871078, 1, 1, 1, 1, 1,
0.8955968, -1.20385, 2.787227, 1, 1, 1, 1, 1,
0.8966941, -0.5679677, 2.66817, 1, 1, 1, 1, 1,
0.9043558, 0.7744525, 0.8051065, 1, 1, 1, 1, 1,
0.9110848, -0.1590981, 0.6374213, 1, 1, 1, 1, 1,
0.9116135, -1.621779, 3.374965, 1, 1, 1, 1, 1,
0.9135528, 0.4531768, 0.564716, 1, 1, 1, 1, 1,
0.9144992, 0.02518874, 0.5514932, 1, 1, 1, 1, 1,
0.9146851, 0.01958078, 1.744637, 1, 1, 1, 1, 1,
0.9170502, 0.2551544, 2.587486, 1, 1, 1, 1, 1,
0.9208443, -0.559208, 2.809102, 0, 0, 1, 1, 1,
0.9226021, -0.06571109, 1.95095, 1, 0, 0, 1, 1,
0.9306527, 0.9559173, 1.327056, 1, 0, 0, 1, 1,
0.9314242, -0.4688768, 1.471125, 1, 0, 0, 1, 1,
0.9317542, -1.801633, 2.113188, 1, 0, 0, 1, 1,
0.933149, -0.785737, 2.231728, 1, 0, 0, 1, 1,
0.9366984, 0.3460609, 1.29996, 0, 0, 0, 1, 1,
0.9432476, -0.5176163, 3.877968, 0, 0, 0, 1, 1,
0.9481217, -0.6160719, 2.249587, 0, 0, 0, 1, 1,
0.950715, -0.5645443, 0.1684422, 0, 0, 0, 1, 1,
0.9519994, 1.166614, 1.664379, 0, 0, 0, 1, 1,
0.9535146, -1.248199, 2.888843, 0, 0, 0, 1, 1,
0.957753, -1.196884, 3.148682, 0, 0, 0, 1, 1,
0.967254, 0.9612398, 2.981088, 1, 1, 1, 1, 1,
0.9724098, -0.6595131, -0.1778384, 1, 1, 1, 1, 1,
0.9872437, -0.5907488, 3.616226, 1, 1, 1, 1, 1,
0.9898381, 0.4859551, -1.189416, 1, 1, 1, 1, 1,
0.9941461, -0.7012109, 0.6471107, 1, 1, 1, 1, 1,
0.9991263, 0.9558672, -0.04419055, 1, 1, 1, 1, 1,
1.005011, 1.124945, 0.6063976, 1, 1, 1, 1, 1,
1.019649, 0.9351255, 1.084742, 1, 1, 1, 1, 1,
1.020066, 0.07242517, 0.5265726, 1, 1, 1, 1, 1,
1.021099, -1.088286, 3.182472, 1, 1, 1, 1, 1,
1.026617, -0.4109394, 2.116713, 1, 1, 1, 1, 1,
1.031003, -0.8833664, 2.050583, 1, 1, 1, 1, 1,
1.038431, 0.05099704, 1.565276, 1, 1, 1, 1, 1,
1.041711, -1.674294, 3.230185, 1, 1, 1, 1, 1,
1.042853, -0.5416203, 1.770526, 1, 1, 1, 1, 1,
1.04288, -1.599723, 1.139772, 0, 0, 1, 1, 1,
1.047518, -1.122657, 3.0031, 1, 0, 0, 1, 1,
1.052356, -1.772459, 3.215555, 1, 0, 0, 1, 1,
1.053057, -1.003761, 0.2858106, 1, 0, 0, 1, 1,
1.054539, 1.068879, 0.4647577, 1, 0, 0, 1, 1,
1.057703, 0.6841277, -0.107586, 1, 0, 0, 1, 1,
1.064314, -1.131972, 0.3680991, 0, 0, 0, 1, 1,
1.070421, 0.0686198, 2.231224, 0, 0, 0, 1, 1,
1.070677, -0.7453133, 1.241737, 0, 0, 0, 1, 1,
1.075131, 0.7589542, 2.578128, 0, 0, 0, 1, 1,
1.078063, 1.214737, -0.8081743, 0, 0, 0, 1, 1,
1.092106, -1.017621, 0.6558902, 0, 0, 0, 1, 1,
1.102361, 1.073206, 0.5469564, 0, 0, 0, 1, 1,
1.102605, 0.4032011, 0.03440404, 1, 1, 1, 1, 1,
1.105473, -1.830076, 4.066061, 1, 1, 1, 1, 1,
1.111189, -1.261343, 1.211796, 1, 1, 1, 1, 1,
1.111805, -2.156067, 1.272891, 1, 1, 1, 1, 1,
1.112278, 0.9597925, 0.07182597, 1, 1, 1, 1, 1,
1.124114, -1.232866, 2.302583, 1, 1, 1, 1, 1,
1.152693, 0.3162732, 2.723217, 1, 1, 1, 1, 1,
1.158085, 0.9625494, 1.697064, 1, 1, 1, 1, 1,
1.161379, -0.1299033, 1.689184, 1, 1, 1, 1, 1,
1.175573, 0.5032975, 1.059721, 1, 1, 1, 1, 1,
1.176452, -0.8501083, 4.053124, 1, 1, 1, 1, 1,
1.179517, -0.0577383, 0.3075535, 1, 1, 1, 1, 1,
1.184125, 0.732611, 0.9073068, 1, 1, 1, 1, 1,
1.191964, 2.12013, 0.1129107, 1, 1, 1, 1, 1,
1.199584, -0.1634481, 1.466475, 1, 1, 1, 1, 1,
1.207318, -0.01792481, 4.138698, 0, 0, 1, 1, 1,
1.209309, -0.03509912, 2.212073, 1, 0, 0, 1, 1,
1.222241, -0.09397852, 0.8723099, 1, 0, 0, 1, 1,
1.233018, -1.232128, 2.731425, 1, 0, 0, 1, 1,
1.233717, 0.7470284, 1.636847, 1, 0, 0, 1, 1,
1.237502, -0.09598147, 1.410206, 1, 0, 0, 1, 1,
1.237665, 1.137013, 0.3465127, 0, 0, 0, 1, 1,
1.239079, -1.526108, 1.758577, 0, 0, 0, 1, 1,
1.245309, -0.7808546, 2.632404, 0, 0, 0, 1, 1,
1.246513, -0.258129, -0.372714, 0, 0, 0, 1, 1,
1.248812, 2.160674, -0.9391902, 0, 0, 0, 1, 1,
1.255411, 1.230029, 0.3213721, 0, 0, 0, 1, 1,
1.256226, 0.951972, 2.734977, 0, 0, 0, 1, 1,
1.259482, 0.6845677, 1.132743, 1, 1, 1, 1, 1,
1.260695, 0.9280453, 1.610074, 1, 1, 1, 1, 1,
1.271975, 1.049338, -1.215123, 1, 1, 1, 1, 1,
1.276981, 1.04399, 0.1085477, 1, 1, 1, 1, 1,
1.292027, -0.3549998, 2.324878, 1, 1, 1, 1, 1,
1.293283, -0.04086597, 2.092422, 1, 1, 1, 1, 1,
1.295043, 1.846201, 0.2396658, 1, 1, 1, 1, 1,
1.295347, 0.1503142, 3.127599, 1, 1, 1, 1, 1,
1.298048, 0.120769, 1.128149, 1, 1, 1, 1, 1,
1.306252, -0.6827179, 1.131631, 1, 1, 1, 1, 1,
1.312653, -0.6964647, 3.989198, 1, 1, 1, 1, 1,
1.313821, 2.172205, 1.855595, 1, 1, 1, 1, 1,
1.341214, -0.1142342, 1.080953, 1, 1, 1, 1, 1,
1.341483, -2.658373, 2.105094, 1, 1, 1, 1, 1,
1.347993, 0.1758366, 0.5715593, 1, 1, 1, 1, 1,
1.360836, -0.1082186, 1.255432, 0, 0, 1, 1, 1,
1.361074, -0.7089447, 2.191844, 1, 0, 0, 1, 1,
1.361789, 2.355601, 0.2310459, 1, 0, 0, 1, 1,
1.363367, 0.4488364, 2.515222, 1, 0, 0, 1, 1,
1.372278, 1.456917, 0.813304, 1, 0, 0, 1, 1,
1.392329, 1.054947, 0.2374779, 1, 0, 0, 1, 1,
1.429422, -0.5739362, 3.876814, 0, 0, 0, 1, 1,
1.440517, 0.1035673, 0.2948473, 0, 0, 0, 1, 1,
1.445042, 0.7858445, 0.5788065, 0, 0, 0, 1, 1,
1.450835, -0.1864165, 1.940989, 0, 0, 0, 1, 1,
1.452235, -0.582089, 2.797939, 0, 0, 0, 1, 1,
1.460032, -0.3694817, 2.708835, 0, 0, 0, 1, 1,
1.462198, 0.1990541, 2.2033, 0, 0, 0, 1, 1,
1.464353, -1.064813, 0.8955148, 1, 1, 1, 1, 1,
1.470337, 0.4261748, 0.2316247, 1, 1, 1, 1, 1,
1.473844, 0.2653825, -0.6685433, 1, 1, 1, 1, 1,
1.474587, 0.1341519, 1.34066, 1, 1, 1, 1, 1,
1.480779, -0.5326561, 3.386885, 1, 1, 1, 1, 1,
1.488873, 1.872491, -0.143192, 1, 1, 1, 1, 1,
1.495651, 0.5217659, 1.981781, 1, 1, 1, 1, 1,
1.500509, 0.389657, 1.283521, 1, 1, 1, 1, 1,
1.500747, 0.6013973, 1.793216, 1, 1, 1, 1, 1,
1.503772, 0.9117385, 1.656471, 1, 1, 1, 1, 1,
1.515868, 0.9201468, -0.08132233, 1, 1, 1, 1, 1,
1.520642, 1.232134, 0.3205998, 1, 1, 1, 1, 1,
1.520816, -0.1251274, 1.799841, 1, 1, 1, 1, 1,
1.521611, 0.2977933, 1.247838, 1, 1, 1, 1, 1,
1.5608, 0.6879056, 0.9540787, 1, 1, 1, 1, 1,
1.566752, 0.03742776, 2.218352, 0, 0, 1, 1, 1,
1.568967, 0.4993319, 0.7353237, 1, 0, 0, 1, 1,
1.575571, 0.2364645, 1.121802, 1, 0, 0, 1, 1,
1.582656, -0.7297974, 1.830829, 1, 0, 0, 1, 1,
1.59526, 0.7514249, 2.565886, 1, 0, 0, 1, 1,
1.597204, 0.1781861, 1.038767, 1, 0, 0, 1, 1,
1.599167, 0.02938244, 2.370808, 0, 0, 0, 1, 1,
1.603018, -1.074649, 1.434504, 0, 0, 0, 1, 1,
1.611208, 0.4147193, -0.2935148, 0, 0, 0, 1, 1,
1.635515, 0.9217428, 0.151433, 0, 0, 0, 1, 1,
1.640574, 0.6227118, 0.6609658, 0, 0, 0, 1, 1,
1.643249, -1.078458, 2.579914, 0, 0, 0, 1, 1,
1.65999, 0.7093513, -0.5768743, 0, 0, 0, 1, 1,
1.692178, -0.1086657, 2.026198, 1, 1, 1, 1, 1,
1.699485, 1.574449, 0.7337147, 1, 1, 1, 1, 1,
1.70435, -1.068877, 2.318288, 1, 1, 1, 1, 1,
1.719906, -1.620835, 0.1475365, 1, 1, 1, 1, 1,
1.723052, -1.651676, 2.358036, 1, 1, 1, 1, 1,
1.74071, 0.2276382, 0.5373181, 1, 1, 1, 1, 1,
1.741814, 0.09652486, -0.01739766, 1, 1, 1, 1, 1,
1.747375, 0.7041205, 0.9374426, 1, 1, 1, 1, 1,
1.747931, 1.931502, 2.317642, 1, 1, 1, 1, 1,
1.75363, -1.613573, 1.789567, 1, 1, 1, 1, 1,
1.761408, -0.1160781, 1.186204, 1, 1, 1, 1, 1,
1.778789, -0.04388411, 1.90237, 1, 1, 1, 1, 1,
1.781231, -0.07315879, 1.717777, 1, 1, 1, 1, 1,
1.781864, 1.013757, 2.779492, 1, 1, 1, 1, 1,
1.787382, -0.9332515, 2.131229, 1, 1, 1, 1, 1,
1.789374, -0.602616, 1.687951, 0, 0, 1, 1, 1,
1.79074, 1.367996, -0.5303469, 1, 0, 0, 1, 1,
1.796607, -1.225016, 1.43513, 1, 0, 0, 1, 1,
1.810907, 1.392261, 0.03178789, 1, 0, 0, 1, 1,
1.821259, -1.008084, 2.569458, 1, 0, 0, 1, 1,
1.821451, 0.5822701, 0.8108662, 1, 0, 0, 1, 1,
1.833516, -1.69767, 2.865449, 0, 0, 0, 1, 1,
1.861125, -0.7666361, 2.657921, 0, 0, 0, 1, 1,
1.861167, -0.1327597, 1.677241, 0, 0, 0, 1, 1,
1.872199, 0.3821271, 2.507627, 0, 0, 0, 1, 1,
1.876052, -1.186227, 2.878628, 0, 0, 0, 1, 1,
1.897051, 0.8806155, -0.05284837, 0, 0, 0, 1, 1,
1.897825, 0.6155, 3.324017, 0, 0, 0, 1, 1,
1.899039, -2.151398, 1.643154, 1, 1, 1, 1, 1,
1.926383, -0.2633931, 1.612377, 1, 1, 1, 1, 1,
1.926788, -0.3608317, 1.469931, 1, 1, 1, 1, 1,
1.940192, -0.0970681, 1.612677, 1, 1, 1, 1, 1,
1.950866, -0.8868678, 2.493077, 1, 1, 1, 1, 1,
1.964106, -0.0706442, 1.669445, 1, 1, 1, 1, 1,
1.974288, 0.1052063, 0.1982747, 1, 1, 1, 1, 1,
2.016925, -1.071676, 3.972193, 1, 1, 1, 1, 1,
2.109155, -1.413341, 2.588022, 1, 1, 1, 1, 1,
2.111849, -0.8475559, 0.1715096, 1, 1, 1, 1, 1,
2.117799, -0.2413851, 0.7900428, 1, 1, 1, 1, 1,
2.143298, -0.4773046, 1.050294, 1, 1, 1, 1, 1,
2.144475, -1.213535, 1.615341, 1, 1, 1, 1, 1,
2.146403, -1.439183, 0.9173131, 1, 1, 1, 1, 1,
2.15074, -0.5457913, 0.5629333, 1, 1, 1, 1, 1,
2.199875, -0.9192017, 2.542529, 0, 0, 1, 1, 1,
2.211551, 0.6363777, 0.8190584, 1, 0, 0, 1, 1,
2.226624, -0.002629002, 1.247581, 1, 0, 0, 1, 1,
2.251904, 0.7745173, 1.223318, 1, 0, 0, 1, 1,
2.26583, -1.137188, 1.41694, 1, 0, 0, 1, 1,
2.273832, 0.2371017, -0.0471421, 1, 0, 0, 1, 1,
2.279889, -0.4140798, 2.974938, 0, 0, 0, 1, 1,
2.358106, 0.5927901, 1.644993, 0, 0, 0, 1, 1,
2.374045, -0.6443623, 0.4645651, 0, 0, 0, 1, 1,
2.430357, 2.018353, 1.204772, 0, 0, 0, 1, 1,
2.542957, -0.005642081, 2.326513, 0, 0, 0, 1, 1,
2.556945, -0.5944082, 2.642828, 0, 0, 0, 1, 1,
2.701854, -1.204594, 3.723678, 0, 0, 0, 1, 1,
2.732399, -0.9480613, 2.552396, 1, 1, 1, 1, 1,
2.754591, -1.347027, 2.622613, 1, 1, 1, 1, 1,
2.9648, -2.106764, 1.876691, 1, 1, 1, 1, 1,
2.974452, -1.296233, 1.085205, 1, 1, 1, 1, 1,
2.986682, 1.260678, 1.751238, 1, 1, 1, 1, 1,
3.907058, 1.364127, 2.344488, 1, 1, 1, 1, 1,
4.764407, 0.4616532, 1.028023, 1, 1, 1, 1, 1
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
var radius = 9.812979;
var distance = 34.46767;
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
mvMatrix.translate( -0.6456895, 0.1183381, 0.01339412 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.46767);
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
