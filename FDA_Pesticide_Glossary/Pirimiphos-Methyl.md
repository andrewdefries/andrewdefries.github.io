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
-3.21137, -0.4417098, -1.601604, 1, 0, 0, 1,
-3.038881, -0.6231014, -1.324018, 1, 0.007843138, 0, 1,
-2.973427, -0.9442095, -1.892017, 1, 0.01176471, 0, 1,
-2.921331, 0.02783963, -3.163421, 1, 0.01960784, 0, 1,
-2.911422, -0.8165411, 0.1846306, 1, 0.02352941, 0, 1,
-2.813909, -0.08759121, -1.115958, 1, 0.03137255, 0, 1,
-2.73237, 0.9642695, -0.9213186, 1, 0.03529412, 0, 1,
-2.602248, 1.598388, -2.189117, 1, 0.04313726, 0, 1,
-2.449411, 0.2404225, 0.1676998, 1, 0.04705882, 0, 1,
-2.418618, 0.2519312, 0.2427531, 1, 0.05490196, 0, 1,
-2.412301, 0.1223649, -0.349378, 1, 0.05882353, 0, 1,
-2.337885, -0.388682, -2.321238, 1, 0.06666667, 0, 1,
-2.333089, 0.4818285, -1.162296, 1, 0.07058824, 0, 1,
-2.324948, -1.424484, -3.231041, 1, 0.07843138, 0, 1,
-2.277232, -0.7772087, -2.71338, 1, 0.08235294, 0, 1,
-2.202568, 0.276339, -1.393924, 1, 0.09019608, 0, 1,
-2.162533, 1.021544, -1.07638, 1, 0.09411765, 0, 1,
-2.135968, 0.9896634, -2.414829, 1, 0.1019608, 0, 1,
-2.068375, -0.9278547, -1.792346, 1, 0.1098039, 0, 1,
-2.023841, 0.2456985, -1.447001, 1, 0.1137255, 0, 1,
-2.005355, 1.613757, 0.7700515, 1, 0.1215686, 0, 1,
-2.001311, -0.3592133, -0.99937, 1, 0.1254902, 0, 1,
-1.9807, 0.3023235, -2.103965, 1, 0.1333333, 0, 1,
-1.952371, 0.2128888, -1.437008, 1, 0.1372549, 0, 1,
-1.914787, -0.9611463, -2.577469, 1, 0.145098, 0, 1,
-1.91043, 0.2454459, -1.763527, 1, 0.1490196, 0, 1,
-1.886954, -0.09989776, -0.1414657, 1, 0.1568628, 0, 1,
-1.885874, 0.4914518, -0.8886442, 1, 0.1607843, 0, 1,
-1.868129, 1.080463, -2.021469, 1, 0.1686275, 0, 1,
-1.861294, 1.95756, 1.779338, 1, 0.172549, 0, 1,
-1.859026, 1.49896, -1.33267, 1, 0.1803922, 0, 1,
-1.855991, -1.634289, -1.073139, 1, 0.1843137, 0, 1,
-1.831849, 0.4571036, -1.606156, 1, 0.1921569, 0, 1,
-1.795836, -0.7032759, -1.602265, 1, 0.1960784, 0, 1,
-1.791469, 0.5976363, 0.05139128, 1, 0.2039216, 0, 1,
-1.776036, 0.4899376, -0.6189308, 1, 0.2117647, 0, 1,
-1.750168, -1.668392, -2.549706, 1, 0.2156863, 0, 1,
-1.746574, -0.8026612, -0.7931855, 1, 0.2235294, 0, 1,
-1.743489, -2.168987, 0.3399515, 1, 0.227451, 0, 1,
-1.741647, -0.3775698, -1.710187, 1, 0.2352941, 0, 1,
-1.741395, 1.307771, -0.8817219, 1, 0.2392157, 0, 1,
-1.734462, -1.137445, -2.104336, 1, 0.2470588, 0, 1,
-1.708541, -0.03525195, -1.270384, 1, 0.2509804, 0, 1,
-1.702199, 1.686636, 0.074029, 1, 0.2588235, 0, 1,
-1.698189, 0.2056165, -1.93282, 1, 0.2627451, 0, 1,
-1.685126, -1.634114, -1.639004, 1, 0.2705882, 0, 1,
-1.678931, 1.016156, -1.104655, 1, 0.2745098, 0, 1,
-1.677325, 0.410804, -0.959751, 1, 0.282353, 0, 1,
-1.672782, -0.03707556, -1.5135, 1, 0.2862745, 0, 1,
-1.670718, 1.462416, -2.270967, 1, 0.2941177, 0, 1,
-1.66225, 0.3185143, -2.776271, 1, 0.3019608, 0, 1,
-1.653821, 1.533993, -0.3627312, 1, 0.3058824, 0, 1,
-1.648238, -1.459792, -3.907183, 1, 0.3137255, 0, 1,
-1.645895, -2.351974, -2.392462, 1, 0.3176471, 0, 1,
-1.640702, 1.077564, -0.6293832, 1, 0.3254902, 0, 1,
-1.636445, -0.446785, -0.5163786, 1, 0.3294118, 0, 1,
-1.616825, 1.495821, -0.1090464, 1, 0.3372549, 0, 1,
-1.605428, -0.6546299, -0.7244676, 1, 0.3411765, 0, 1,
-1.604728, -0.04133254, -2.119106, 1, 0.3490196, 0, 1,
-1.588833, -1.340192, -2.223886, 1, 0.3529412, 0, 1,
-1.588453, -0.8756613, -4.568034, 1, 0.3607843, 0, 1,
-1.57781, 1.246846, -0.6321301, 1, 0.3647059, 0, 1,
-1.573087, -1.491413, -1.848438, 1, 0.372549, 0, 1,
-1.564791, -0.02850733, -2.365442, 1, 0.3764706, 0, 1,
-1.546997, 3.160822, -0.1265502, 1, 0.3843137, 0, 1,
-1.545167, 0.0723706, -0.2042183, 1, 0.3882353, 0, 1,
-1.518869, -0.6641157, -1.610272, 1, 0.3960784, 0, 1,
-1.492523, -0.2631512, -1.462349, 1, 0.4039216, 0, 1,
-1.477177, 0.1132051, -1.244481, 1, 0.4078431, 0, 1,
-1.46391, 1.75572, -1.051118, 1, 0.4156863, 0, 1,
-1.463601, 0.7800855, -1.502577, 1, 0.4196078, 0, 1,
-1.450556, -0.5464975, -2.504822, 1, 0.427451, 0, 1,
-1.437804, 1.314564, -0.7859801, 1, 0.4313726, 0, 1,
-1.433413, -0.7045594, -2.260071, 1, 0.4392157, 0, 1,
-1.430416, -1.613868, -2.128103, 1, 0.4431373, 0, 1,
-1.421094, 0.2731142, -1.970353, 1, 0.4509804, 0, 1,
-1.416575, 0.2684423, -0.7875467, 1, 0.454902, 0, 1,
-1.387974, 0.9460608, -0.49952, 1, 0.4627451, 0, 1,
-1.365217, 0.9081027, -0.03164624, 1, 0.4666667, 0, 1,
-1.362413, -1.368828, -2.362241, 1, 0.4745098, 0, 1,
-1.35933, 0.5701385, -3.123667, 1, 0.4784314, 0, 1,
-1.352319, 0.5142568, -2.993444, 1, 0.4862745, 0, 1,
-1.348292, -1.285687, -2.886775, 1, 0.4901961, 0, 1,
-1.346091, -1.015264, -3.16025, 1, 0.4980392, 0, 1,
-1.343117, -0.8367633, -1.172672, 1, 0.5058824, 0, 1,
-1.338682, 1.365164, -1.695799, 1, 0.509804, 0, 1,
-1.337042, -1.201811, -0.7164354, 1, 0.5176471, 0, 1,
-1.324475, 0.9207126, -1.290404, 1, 0.5215687, 0, 1,
-1.320525, 1.670979, -0.7705597, 1, 0.5294118, 0, 1,
-1.318486, -1.093867, -1.655848, 1, 0.5333334, 0, 1,
-1.317817, 1.193926, -1.89557, 1, 0.5411765, 0, 1,
-1.304143, -0.3052374, -1.718429, 1, 0.5450981, 0, 1,
-1.298272, -2.00734, -2.622824, 1, 0.5529412, 0, 1,
-1.290897, 0.7734346, -1.441564, 1, 0.5568628, 0, 1,
-1.282421, -0.6792836, -0.1651314, 1, 0.5647059, 0, 1,
-1.272958, 0.1087555, -0.1748617, 1, 0.5686275, 0, 1,
-1.25929, -0.5025716, -1.486811, 1, 0.5764706, 0, 1,
-1.257159, 0.1384578, -0.5168124, 1, 0.5803922, 0, 1,
-1.254966, -0.5356395, -1.363447, 1, 0.5882353, 0, 1,
-1.240119, 0.4524929, 0.2775351, 1, 0.5921569, 0, 1,
-1.239982, -1.050637, -1.645805, 1, 0.6, 0, 1,
-1.237498, -0.7871792, -3.514458, 1, 0.6078432, 0, 1,
-1.231216, -0.5890315, -2.020325, 1, 0.6117647, 0, 1,
-1.229194, 0.3549088, -1.328142, 1, 0.6196079, 0, 1,
-1.226646, -1.280208, -1.608582, 1, 0.6235294, 0, 1,
-1.213747, -0.4593236, -2.297556, 1, 0.6313726, 0, 1,
-1.206051, 0.331513, -2.011518, 1, 0.6352941, 0, 1,
-1.205005, 0.6680637, -2.480212, 1, 0.6431373, 0, 1,
-1.201496, 0.1509041, -1.114676, 1, 0.6470588, 0, 1,
-1.201348, 1.406933, -1.883803, 1, 0.654902, 0, 1,
-1.198717, 2.251269, 1.433738, 1, 0.6588235, 0, 1,
-1.197369, -1.053533, -1.987911, 1, 0.6666667, 0, 1,
-1.190974, -0.02352818, -2.377791, 1, 0.6705883, 0, 1,
-1.176476, -0.2872209, -4.060288, 1, 0.6784314, 0, 1,
-1.168121, 0.4026275, -1.092417, 1, 0.682353, 0, 1,
-1.163766, -0.7451288, -1.742792, 1, 0.6901961, 0, 1,
-1.15624, 0.5883518, -0.2498672, 1, 0.6941177, 0, 1,
-1.155304, -0.07897528, -2.045633, 1, 0.7019608, 0, 1,
-1.154787, 2.169861, -0.1390549, 1, 0.7098039, 0, 1,
-1.149335, -1.12023, -1.320862, 1, 0.7137255, 0, 1,
-1.146235, -1.382824, -3.056653, 1, 0.7215686, 0, 1,
-1.140278, -0.06304093, -0.214581, 1, 0.7254902, 0, 1,
-1.137481, 0.5601816, 0.4213271, 1, 0.7333333, 0, 1,
-1.132149, -0.2871437, -1.291081, 1, 0.7372549, 0, 1,
-1.129686, 0.0564246, -1.640651, 1, 0.7450981, 0, 1,
-1.123483, 0.1803873, -3.7214, 1, 0.7490196, 0, 1,
-1.116127, -0.497838, -1.524746, 1, 0.7568628, 0, 1,
-1.113025, 1.513999, -1.177424, 1, 0.7607843, 0, 1,
-1.110955, 0.8204572, -0.7343102, 1, 0.7686275, 0, 1,
-1.096708, 0.4705532, -0.1597971, 1, 0.772549, 0, 1,
-1.094876, -0.9387609, -2.775626, 1, 0.7803922, 0, 1,
-1.091556, 0.4464614, -2.186749, 1, 0.7843137, 0, 1,
-1.091447, 1.185032, -0.993941, 1, 0.7921569, 0, 1,
-1.090788, -1.065071, -1.271787, 1, 0.7960784, 0, 1,
-1.085181, -0.8205381, -2.267158, 1, 0.8039216, 0, 1,
-1.084473, -0.7499821, -2.357134, 1, 0.8117647, 0, 1,
-1.083637, -0.8159141, -2.896518, 1, 0.8156863, 0, 1,
-1.069203, 0.6665868, -2.007085, 1, 0.8235294, 0, 1,
-1.069056, -0.2385685, -1.200231, 1, 0.827451, 0, 1,
-1.068819, -1.013735, -3.630266, 1, 0.8352941, 0, 1,
-1.066743, 0.1626161, -0.9479272, 1, 0.8392157, 0, 1,
-1.063206, -0.1238343, -0.7572696, 1, 0.8470588, 0, 1,
-1.059482, -0.1319854, -2.085443, 1, 0.8509804, 0, 1,
-1.05838, 0.09755386, -1.580735, 1, 0.8588235, 0, 1,
-1.050343, 0.7230105, -1.867768, 1, 0.8627451, 0, 1,
-1.048728, 1.083981, -1.499677, 1, 0.8705882, 0, 1,
-1.036321, 1.136841, -0.4147565, 1, 0.8745098, 0, 1,
-1.035702, -1.352021, -1.5434, 1, 0.8823529, 0, 1,
-1.03366, 0.8281142, 0.2430189, 1, 0.8862745, 0, 1,
-1.031384, -0.6873758, -2.402046, 1, 0.8941177, 0, 1,
-1.027826, -0.1335544, -0.1766594, 1, 0.8980392, 0, 1,
-1.02441, -0.1513668, -2.091184, 1, 0.9058824, 0, 1,
-1.020069, 0.9648984, -1.392403, 1, 0.9137255, 0, 1,
-1.015924, -0.2699086, -2.103939, 1, 0.9176471, 0, 1,
-1.013626, 0.4772407, -1.569902, 1, 0.9254902, 0, 1,
-1.013515, -1.230395, -2.644014, 1, 0.9294118, 0, 1,
-1.012835, -0.2159773, -0.7851354, 1, 0.9372549, 0, 1,
-1.003117, 1.053791, -1.694081, 1, 0.9411765, 0, 1,
-0.9979583, -0.4405772, -2.641514, 1, 0.9490196, 0, 1,
-0.9952849, 2.179496, -0.2656449, 1, 0.9529412, 0, 1,
-0.9918556, -0.8080731, -1.881289, 1, 0.9607843, 0, 1,
-0.9918455, 1.289303, 0.5395516, 1, 0.9647059, 0, 1,
-0.9916624, 0.1786261, -0.1751129, 1, 0.972549, 0, 1,
-0.9912287, -0.489254, -3.259097, 1, 0.9764706, 0, 1,
-0.9858089, -0.471318, -1.431396, 1, 0.9843137, 0, 1,
-0.9701716, -1.074094, -0.5175479, 1, 0.9882353, 0, 1,
-0.9651379, 0.4326893, -1.147334, 1, 0.9960784, 0, 1,
-0.9646393, 0.9602366, 0.1214939, 0.9960784, 1, 0, 1,
-0.9553401, -1.250776, -3.218939, 0.9921569, 1, 0, 1,
-0.9542823, 1.54338, -1.82643, 0.9843137, 1, 0, 1,
-0.9528219, -0.6062823, -1.801876, 0.9803922, 1, 0, 1,
-0.9435993, 0.7327865, -1.516614, 0.972549, 1, 0, 1,
-0.9435657, 0.6327422, 0.2637216, 0.9686275, 1, 0, 1,
-0.9422684, -1.07661, -3.832236, 0.9607843, 1, 0, 1,
-0.939531, 1.174995, -1.193419, 0.9568627, 1, 0, 1,
-0.9343456, -0.4159973, -2.534306, 0.9490196, 1, 0, 1,
-0.9303825, 0.7636901, 1.229969, 0.945098, 1, 0, 1,
-0.9273522, 0.5983327, -1.366313, 0.9372549, 1, 0, 1,
-0.9186987, 0.4590237, -1.603437, 0.9333333, 1, 0, 1,
-0.9131213, -0.9222321, -1.591902, 0.9254902, 1, 0, 1,
-0.9110065, 0.06887091, -1.035068, 0.9215686, 1, 0, 1,
-0.903257, -1.144731, -3.740469, 0.9137255, 1, 0, 1,
-0.9005321, -0.520348, -0.641394, 0.9098039, 1, 0, 1,
-0.8962979, -1.861042, -3.134907, 0.9019608, 1, 0, 1,
-0.8843761, 0.02016255, -2.6114, 0.8941177, 1, 0, 1,
-0.8831969, 0.836827, -1.235459, 0.8901961, 1, 0, 1,
-0.8825267, 0.01304486, -1.471085, 0.8823529, 1, 0, 1,
-0.8809133, -0.8156534, -2.08173, 0.8784314, 1, 0, 1,
-0.8804405, 1.455941, -1.243982, 0.8705882, 1, 0, 1,
-0.875864, -1.438164, -2.385157, 0.8666667, 1, 0, 1,
-0.8725235, -0.1194971, -2.961388, 0.8588235, 1, 0, 1,
-0.8677126, -0.6066626, -1.737668, 0.854902, 1, 0, 1,
-0.8665864, -0.8516399, -1.932124, 0.8470588, 1, 0, 1,
-0.8620282, -1.52364, -3.940003, 0.8431373, 1, 0, 1,
-0.8552853, -0.5203894, -2.320606, 0.8352941, 1, 0, 1,
-0.8494433, -1.492641, -2.487729, 0.8313726, 1, 0, 1,
-0.8472747, 0.8662826, 0.1911448, 0.8235294, 1, 0, 1,
-0.8422405, 0.2003149, -2.198784, 0.8196079, 1, 0, 1,
-0.8416815, -0.2278602, -3.221225, 0.8117647, 1, 0, 1,
-0.8368065, 0.6676288, -1.15225, 0.8078431, 1, 0, 1,
-0.8367599, -0.006599956, -3.09349, 0.8, 1, 0, 1,
-0.8327507, 0.117703, -3.666202, 0.7921569, 1, 0, 1,
-0.8314002, -0.8554185, -1.08162, 0.7882353, 1, 0, 1,
-0.8214135, 0.8334941, -1.489914, 0.7803922, 1, 0, 1,
-0.8124757, -0.5386617, -3.667997, 0.7764706, 1, 0, 1,
-0.8100116, -0.8484874, -1.859932, 0.7686275, 1, 0, 1,
-0.8077756, -0.9388277, -3.098714, 0.7647059, 1, 0, 1,
-0.8006369, 0.127883, -1.60179, 0.7568628, 1, 0, 1,
-0.7928445, 0.7772523, -0.5574143, 0.7529412, 1, 0, 1,
-0.7922302, -2.447522, -1.921613, 0.7450981, 1, 0, 1,
-0.7801783, 1.018818, 0.8424809, 0.7411765, 1, 0, 1,
-0.7778243, -0.1343461, -1.467383, 0.7333333, 1, 0, 1,
-0.777766, 0.0607306, -2.254342, 0.7294118, 1, 0, 1,
-0.7775281, 0.03515379, -1.634434, 0.7215686, 1, 0, 1,
-0.7755079, -0.731466, -1.886547, 0.7176471, 1, 0, 1,
-0.759121, -0.7546831, -4.603444, 0.7098039, 1, 0, 1,
-0.7583283, 0.5984212, 0.8500835, 0.7058824, 1, 0, 1,
-0.7579417, -0.1551328, -1.2124, 0.6980392, 1, 0, 1,
-0.753799, 1.87355, 1.706171, 0.6901961, 1, 0, 1,
-0.7440776, -0.8389603, -3.243862, 0.6862745, 1, 0, 1,
-0.743718, 2.068322, -1.281673, 0.6784314, 1, 0, 1,
-0.7418094, 1.54902, -0.3022054, 0.6745098, 1, 0, 1,
-0.7397781, -0.4627545, -2.610293, 0.6666667, 1, 0, 1,
-0.7366928, -0.6309204, -2.893008, 0.6627451, 1, 0, 1,
-0.7363319, -0.4943542, -1.396683, 0.654902, 1, 0, 1,
-0.7340695, 0.02860476, -2.529004, 0.6509804, 1, 0, 1,
-0.731356, -2.205245, -2.850173, 0.6431373, 1, 0, 1,
-0.7302366, 0.3722825, -2.1773, 0.6392157, 1, 0, 1,
-0.729933, -1.278938, -3.274077, 0.6313726, 1, 0, 1,
-0.7297216, -1.065109, -3.565088, 0.627451, 1, 0, 1,
-0.7262827, -0.6320776, -2.437404, 0.6196079, 1, 0, 1,
-0.722452, 0.1650991, -2.194611, 0.6156863, 1, 0, 1,
-0.7140999, -0.736725, -0.6389756, 0.6078432, 1, 0, 1,
-0.7121305, 1.229153, 0.9326524, 0.6039216, 1, 0, 1,
-0.7114295, 0.1976641, -1.244819, 0.5960785, 1, 0, 1,
-0.7077101, 0.8329925, -0.9125524, 0.5882353, 1, 0, 1,
-0.7060256, -0.2527067, -1.790799, 0.5843138, 1, 0, 1,
-0.7033256, -1.52659, -2.179705, 0.5764706, 1, 0, 1,
-0.7030758, -0.2542199, -1.127896, 0.572549, 1, 0, 1,
-0.7018117, -0.3548046, -0.5039334, 0.5647059, 1, 0, 1,
-0.6957265, -0.6638163, -2.597716, 0.5607843, 1, 0, 1,
-0.6892241, -0.413651, -1.685009, 0.5529412, 1, 0, 1,
-0.6812004, 0.6147638, -3.006878, 0.5490196, 1, 0, 1,
-0.6781318, 1.623888, -0.9722201, 0.5411765, 1, 0, 1,
-0.6729919, 1.078253, -1.005133, 0.5372549, 1, 0, 1,
-0.67233, 0.7150813, -1.351153, 0.5294118, 1, 0, 1,
-0.6678114, -0.06503195, -2.74392, 0.5254902, 1, 0, 1,
-0.6667835, -1.01682, -1.482138, 0.5176471, 1, 0, 1,
-0.6620162, 1.022144, -0.7122826, 0.5137255, 1, 0, 1,
-0.6569922, 0.1848778, -0.8533627, 0.5058824, 1, 0, 1,
-0.6567258, 0.8111905, -3.0425, 0.5019608, 1, 0, 1,
-0.6545289, -0.1410625, -1.34318, 0.4941176, 1, 0, 1,
-0.6503142, -0.07883599, -2.724408, 0.4862745, 1, 0, 1,
-0.6490834, -0.9544476, -1.180112, 0.4823529, 1, 0, 1,
-0.6468768, -0.6810045, -1.593627, 0.4745098, 1, 0, 1,
-0.6462553, -0.7922216, -2.698019, 0.4705882, 1, 0, 1,
-0.6449002, -0.8533335, -1.424338, 0.4627451, 1, 0, 1,
-0.6405193, 0.7200141, -1.853966, 0.4588235, 1, 0, 1,
-0.6392402, 0.5752318, -2.342513, 0.4509804, 1, 0, 1,
-0.639104, -0.6995174, -3.295872, 0.4470588, 1, 0, 1,
-0.6366686, -1.44738, -6.193848, 0.4392157, 1, 0, 1,
-0.6315024, -0.6330872, -2.107774, 0.4352941, 1, 0, 1,
-0.6311563, 1.222757, -1.477216, 0.427451, 1, 0, 1,
-0.6286501, -0.3982372, -2.745974, 0.4235294, 1, 0, 1,
-0.6281983, 0.2094548, -1.872761, 0.4156863, 1, 0, 1,
-0.6243799, -0.2112249, -1.711848, 0.4117647, 1, 0, 1,
-0.6241766, -0.4503309, -2.797834, 0.4039216, 1, 0, 1,
-0.6224417, 0.6081821, -0.6112273, 0.3960784, 1, 0, 1,
-0.6203954, -0.6095061, -2.677373, 0.3921569, 1, 0, 1,
-0.6067626, -0.5233727, -2.548293, 0.3843137, 1, 0, 1,
-0.6045864, 0.4295339, -1.521072, 0.3803922, 1, 0, 1,
-0.6039608, -0.1828092, -0.03455272, 0.372549, 1, 0, 1,
-0.5948601, -0.05188689, -1.718269, 0.3686275, 1, 0, 1,
-0.5924703, -0.9369785, -2.615797, 0.3607843, 1, 0, 1,
-0.5907163, 0.1692941, -0.07286316, 0.3568628, 1, 0, 1,
-0.5905414, 1.006233, -0.02942858, 0.3490196, 1, 0, 1,
-0.5893093, 0.2566128, 0.0251815, 0.345098, 1, 0, 1,
-0.5878497, -0.9842629, -3.144096, 0.3372549, 1, 0, 1,
-0.5861999, -0.4466116, -2.576915, 0.3333333, 1, 0, 1,
-0.5826315, 0.1969309, -0.6515212, 0.3254902, 1, 0, 1,
-0.5822095, -0.2654543, -0.4706531, 0.3215686, 1, 0, 1,
-0.5819014, 0.3465704, 0.4133868, 0.3137255, 1, 0, 1,
-0.5806721, -1.208269, -1.560451, 0.3098039, 1, 0, 1,
-0.5735667, -0.1406544, -1.270506, 0.3019608, 1, 0, 1,
-0.572463, 0.6712403, -1.635349, 0.2941177, 1, 0, 1,
-0.572381, -0.2284156, -1.325888, 0.2901961, 1, 0, 1,
-0.5707766, 0.08214771, -1.021948, 0.282353, 1, 0, 1,
-0.5666456, 0.5079628, -0.1119543, 0.2784314, 1, 0, 1,
-0.5636947, 1.326935, -0.8836061, 0.2705882, 1, 0, 1,
-0.5613894, 1.647282, -2.585762, 0.2666667, 1, 0, 1,
-0.5595784, -2.193241, -4.178633, 0.2588235, 1, 0, 1,
-0.5584976, -0.05175159, -0.1240653, 0.254902, 1, 0, 1,
-0.5581546, 0.1973691, -1.008488, 0.2470588, 1, 0, 1,
-0.5570378, -1.304274, -2.236701, 0.2431373, 1, 0, 1,
-0.5511484, 0.4130366, -1.104423, 0.2352941, 1, 0, 1,
-0.5466721, -0.4309482, -1.013188, 0.2313726, 1, 0, 1,
-0.5465394, 0.1556449, -1.63231, 0.2235294, 1, 0, 1,
-0.5456302, -2.052551, -0.7919167, 0.2196078, 1, 0, 1,
-0.5438969, 2.020442, -1.41568, 0.2117647, 1, 0, 1,
-0.5431758, -0.9745821, -4.627964, 0.2078431, 1, 0, 1,
-0.5412989, -0.07973044, -0.9992516, 0.2, 1, 0, 1,
-0.5390332, 1.406556, -0.07009149, 0.1921569, 1, 0, 1,
-0.5384263, 0.992364, -1.184829, 0.1882353, 1, 0, 1,
-0.5360581, -1.820411, -3.428011, 0.1803922, 1, 0, 1,
-0.5358081, -1.079159, -2.077823, 0.1764706, 1, 0, 1,
-0.534176, 0.2462446, -1.390529, 0.1686275, 1, 0, 1,
-0.5226381, -0.4002877, -0.6861109, 0.1647059, 1, 0, 1,
-0.5216349, -1.269545, -1.693238, 0.1568628, 1, 0, 1,
-0.5214738, -0.9063863, -2.508847, 0.1529412, 1, 0, 1,
-0.516313, 0.762022, -0.02943155, 0.145098, 1, 0, 1,
-0.5159066, -0.0006489561, -3.461219, 0.1411765, 1, 0, 1,
-0.5137387, 0.006260443, -2.051179, 0.1333333, 1, 0, 1,
-0.511353, -0.2790757, -2.320387, 0.1294118, 1, 0, 1,
-0.5094458, 1.149982, -2.327722, 0.1215686, 1, 0, 1,
-0.5051965, -1.904079, -3.438273, 0.1176471, 1, 0, 1,
-0.503675, -0.7745182, -4.701746, 0.1098039, 1, 0, 1,
-0.5034046, -0.4510376, -2.432265, 0.1058824, 1, 0, 1,
-0.4968188, 1.52693, 0.4530348, 0.09803922, 1, 0, 1,
-0.4950739, -0.7261716, -2.74648, 0.09019608, 1, 0, 1,
-0.4879752, -1.773275, -1.402159, 0.08627451, 1, 0, 1,
-0.4843431, 0.2241843, -0.8355042, 0.07843138, 1, 0, 1,
-0.4841231, -1.190314, -1.17344, 0.07450981, 1, 0, 1,
-0.4796501, 0.08570078, -2.103131, 0.06666667, 1, 0, 1,
-0.4794984, 0.4389594, -0.909476, 0.0627451, 1, 0, 1,
-0.4794641, 1.657036, -0.4363208, 0.05490196, 1, 0, 1,
-0.4794323, 0.5214642, -1.552542, 0.05098039, 1, 0, 1,
-0.4788649, -0.9553841, -3.431715, 0.04313726, 1, 0, 1,
-0.4715366, 1.031602, -1.030652, 0.03921569, 1, 0, 1,
-0.470369, 1.244819, 0.1901942, 0.03137255, 1, 0, 1,
-0.4637327, 0.4072577, -1.684568, 0.02745098, 1, 0, 1,
-0.4628233, 0.7563788, 0.3272499, 0.01960784, 1, 0, 1,
-0.4610896, -1.483939, -1.988248, 0.01568628, 1, 0, 1,
-0.4600098, -1.428582, -2.771774, 0.007843138, 1, 0, 1,
-0.4569572, -0.5378354, -2.945174, 0.003921569, 1, 0, 1,
-0.4540416, -0.764304, -3.238486, 0, 1, 0.003921569, 1,
-0.4493065, 2.53465, 0.4207484, 0, 1, 0.01176471, 1,
-0.4492523, -0.8232354, -1.700479, 0, 1, 0.01568628, 1,
-0.4450418, 0.6061828, 0.2573103, 0, 1, 0.02352941, 1,
-0.4414034, -0.2801965, -3.004445, 0, 1, 0.02745098, 1,
-0.4382186, 0.6551467, -0.1023508, 0, 1, 0.03529412, 1,
-0.4332793, 0.8201759, -0.4610729, 0, 1, 0.03921569, 1,
-0.425916, 1.765034, -0.8144739, 0, 1, 0.04705882, 1,
-0.4247732, 0.6788489, -0.2430233, 0, 1, 0.05098039, 1,
-0.3997569, -0.1558726, -1.739496, 0, 1, 0.05882353, 1,
-0.3996096, 0.9470327, -1.639329, 0, 1, 0.0627451, 1,
-0.390438, 1.058644, -0.4935997, 0, 1, 0.07058824, 1,
-0.3844555, -0.3293645, -4.049045, 0, 1, 0.07450981, 1,
-0.3809002, 0.07956622, -0.07708883, 0, 1, 0.08235294, 1,
-0.3803864, -0.746429, -2.053371, 0, 1, 0.08627451, 1,
-0.3803523, 0.1231451, 0.2254153, 0, 1, 0.09411765, 1,
-0.3755328, 1.504834, 2.150287, 0, 1, 0.1019608, 1,
-0.362971, -0.2196568, -2.617741, 0, 1, 0.1058824, 1,
-0.3593245, 1.91947, 1.521917, 0, 1, 0.1137255, 1,
-0.3561845, 0.6623126, -2.208203, 0, 1, 0.1176471, 1,
-0.3462997, -0.1460722, -2.010822, 0, 1, 0.1254902, 1,
-0.3402277, 0.799086, 0.122976, 0, 1, 0.1294118, 1,
-0.3393587, -0.5675508, -1.810519, 0, 1, 0.1372549, 1,
-0.3377835, 0.705704, -1.20308, 0, 1, 0.1411765, 1,
-0.3370568, -0.3695734, -2.352717, 0, 1, 0.1490196, 1,
-0.3282464, -0.1008387, -2.351226, 0, 1, 0.1529412, 1,
-0.3223365, -0.3358519, -1.469432, 0, 1, 0.1607843, 1,
-0.3207624, -1.711894, -2.887354, 0, 1, 0.1647059, 1,
-0.3154086, 0.6662773, -1.711117, 0, 1, 0.172549, 1,
-0.3146024, -0.606217, -2.37262, 0, 1, 0.1764706, 1,
-0.313441, -0.8094609, -2.334479, 0, 1, 0.1843137, 1,
-0.3104316, -0.5871575, -4.330493, 0, 1, 0.1882353, 1,
-0.3096269, -0.5450074, -2.313753, 0, 1, 0.1960784, 1,
-0.3068342, 0.2043091, -1.52238, 0, 1, 0.2039216, 1,
-0.3031619, -0.4457058, -1.889306, 0, 1, 0.2078431, 1,
-0.3029383, 0.9094597, 0.226583, 0, 1, 0.2156863, 1,
-0.3001326, 1.96581, -0.02334898, 0, 1, 0.2196078, 1,
-0.2972326, 0.4166617, 0.09024884, 0, 1, 0.227451, 1,
-0.2968116, -0.2840145, -3.909055, 0, 1, 0.2313726, 1,
-0.2957901, 2.506141, -0.5466184, 0, 1, 0.2392157, 1,
-0.2916209, 0.03378641, -1.221655, 0, 1, 0.2431373, 1,
-0.2865398, 1.817844, 0.9781581, 0, 1, 0.2509804, 1,
-0.2807446, -0.6379789, -2.470601, 0, 1, 0.254902, 1,
-0.2802477, -0.9564963, -2.708433, 0, 1, 0.2627451, 1,
-0.2763623, 0.9372194, 0.05996636, 0, 1, 0.2666667, 1,
-0.2761129, -1.428267, -4.853147, 0, 1, 0.2745098, 1,
-0.2750365, 0.209414, -0.7058538, 0, 1, 0.2784314, 1,
-0.273511, -0.04263971, -2.054875, 0, 1, 0.2862745, 1,
-0.271812, -0.1009459, -0.1605769, 0, 1, 0.2901961, 1,
-0.2704403, 0.8470012, -0.3882235, 0, 1, 0.2980392, 1,
-0.2701719, 0.8501242, 0.1146798, 0, 1, 0.3058824, 1,
-0.264034, 0.709377, -0.6061125, 0, 1, 0.3098039, 1,
-0.2610018, 0.2293069, -2.425243, 0, 1, 0.3176471, 1,
-0.260448, -0.4381863, -0.9061961, 0, 1, 0.3215686, 1,
-0.252504, 0.300437, -0.695475, 0, 1, 0.3294118, 1,
-0.2516584, 0.262121, -0.6391743, 0, 1, 0.3333333, 1,
-0.2441333, 1.556449, 0.6276117, 0, 1, 0.3411765, 1,
-0.2387047, 0.7214333, -1.023207, 0, 1, 0.345098, 1,
-0.2381831, -2.075634, -2.238198, 0, 1, 0.3529412, 1,
-0.2364241, -0.9762273, -3.369986, 0, 1, 0.3568628, 1,
-0.2323015, -0.05861636, -2.93905, 0, 1, 0.3647059, 1,
-0.2276069, -0.6742487, -3.143793, 0, 1, 0.3686275, 1,
-0.2243785, -0.7321507, -3.641962, 0, 1, 0.3764706, 1,
-0.2235892, -1.003778, -1.559003, 0, 1, 0.3803922, 1,
-0.2229086, -0.526466, -4.510702, 0, 1, 0.3882353, 1,
-0.2222863, -1.249239, -2.026471, 0, 1, 0.3921569, 1,
-0.2202352, -0.07433102, -2.153715, 0, 1, 0.4, 1,
-0.2140185, -0.6847808, -2.986783, 0, 1, 0.4078431, 1,
-0.2133438, -0.6146598, -4.096584, 0, 1, 0.4117647, 1,
-0.2110141, -0.2976761, -1.725407, 0, 1, 0.4196078, 1,
-0.2107643, -1.107073, -2.419065, 0, 1, 0.4235294, 1,
-0.2072317, 0.6245819, 0.4109978, 0, 1, 0.4313726, 1,
-0.2032536, 0.7171346, -0.004487091, 0, 1, 0.4352941, 1,
-0.2031579, -0.6858581, -3.520612, 0, 1, 0.4431373, 1,
-0.2016179, 1.296409, -0.08519818, 0, 1, 0.4470588, 1,
-0.2014356, 1.024247, -0.6245114, 0, 1, 0.454902, 1,
-0.1987485, 0.117411, 0.5586597, 0, 1, 0.4588235, 1,
-0.196413, 0.4808233, -1.691468, 0, 1, 0.4666667, 1,
-0.1959361, -0.09395437, -2.930004, 0, 1, 0.4705882, 1,
-0.1952107, 0.3259773, -1.152552, 0, 1, 0.4784314, 1,
-0.1921832, 0.9384719, 0.395054, 0, 1, 0.4823529, 1,
-0.1850536, -0.5622214, -2.35949, 0, 1, 0.4901961, 1,
-0.1835137, 0.4432224, 0.4962479, 0, 1, 0.4941176, 1,
-0.1828308, 0.01829081, -1.053428, 0, 1, 0.5019608, 1,
-0.1777863, -0.1108456, -2.13723, 0, 1, 0.509804, 1,
-0.1769209, -0.54353, -3.399396, 0, 1, 0.5137255, 1,
-0.1665964, -1.326638, -3.572538, 0, 1, 0.5215687, 1,
-0.1658752, -0.2534108, -2.649029, 0, 1, 0.5254902, 1,
-0.1648402, -1.04216, -3.513375, 0, 1, 0.5333334, 1,
-0.1627227, -0.5557653, -3.471808, 0, 1, 0.5372549, 1,
-0.160924, -0.7910267, -4.035509, 0, 1, 0.5450981, 1,
-0.1580211, -0.1044933, -1.085819, 0, 1, 0.5490196, 1,
-0.1565461, 1.502655, 2.691869, 0, 1, 0.5568628, 1,
-0.1475734, -0.4766354, -5.188341, 0, 1, 0.5607843, 1,
-0.1471298, 0.3377848, 0.6165535, 0, 1, 0.5686275, 1,
-0.1451886, -1.871822, -2.175818, 0, 1, 0.572549, 1,
-0.1389, -0.81411, -4.302188, 0, 1, 0.5803922, 1,
-0.1383481, 0.3933328, -1.249877, 0, 1, 0.5843138, 1,
-0.1371554, -1.240892, -3.749, 0, 1, 0.5921569, 1,
-0.133814, -0.5642302, -2.723938, 0, 1, 0.5960785, 1,
-0.1332218, 0.8739209, -0.452875, 0, 1, 0.6039216, 1,
-0.1331351, -3.135464, -3.804108, 0, 1, 0.6117647, 1,
-0.133119, 1.706861, -0.08877747, 0, 1, 0.6156863, 1,
-0.1320643, -0.1633979, -2.162847, 0, 1, 0.6235294, 1,
-0.1303948, 0.7296916, -1.233541, 0, 1, 0.627451, 1,
-0.1297662, -1.263115, -4.039186, 0, 1, 0.6352941, 1,
-0.1288517, -0.02650345, -0.8847428, 0, 1, 0.6392157, 1,
-0.123276, 0.7563056, -2.539518, 0, 1, 0.6470588, 1,
-0.1222503, -0.1632159, -2.031604, 0, 1, 0.6509804, 1,
-0.1210604, -0.5423091, -2.436535, 0, 1, 0.6588235, 1,
-0.1188403, -0.5477364, -2.563257, 0, 1, 0.6627451, 1,
-0.1165922, 0.9756181, -0.930909, 0, 1, 0.6705883, 1,
-0.1161083, 0.3458889, -0.4353687, 0, 1, 0.6745098, 1,
-0.1148874, 0.6964983, 1.649764, 0, 1, 0.682353, 1,
-0.1108628, 0.468715, -1.174016, 0, 1, 0.6862745, 1,
-0.1082974, 1.21983, 0.6479667, 0, 1, 0.6941177, 1,
-0.1082549, 1.056126, -1.027081, 0, 1, 0.7019608, 1,
-0.1071264, -1.640166, -3.654617, 0, 1, 0.7058824, 1,
-0.1058814, 0.9331271, 1.029862, 0, 1, 0.7137255, 1,
-0.1048013, -0.2090915, -1.993289, 0, 1, 0.7176471, 1,
-0.1030998, -0.3584734, -1.995135, 0, 1, 0.7254902, 1,
-0.09968811, -1.241304, -3.227695, 0, 1, 0.7294118, 1,
-0.09651666, -0.3818186, -3.555529, 0, 1, 0.7372549, 1,
-0.09473948, -2.359036, -1.264099, 0, 1, 0.7411765, 1,
-0.0934798, -0.3860728, -2.877685, 0, 1, 0.7490196, 1,
-0.09050021, 0.1122671, -0.0521534, 0, 1, 0.7529412, 1,
-0.08893393, 0.06308927, 0.3127273, 0, 1, 0.7607843, 1,
-0.08693834, -0.0037067, -2.050218, 0, 1, 0.7647059, 1,
-0.08626499, -0.6587007, -2.014365, 0, 1, 0.772549, 1,
-0.08612301, -0.539462, -4.995315, 0, 1, 0.7764706, 1,
-0.08470552, 0.3594583, -0.3569503, 0, 1, 0.7843137, 1,
-0.08437034, -1.570395, -2.606884, 0, 1, 0.7882353, 1,
-0.0832764, -1.270216, -4.517859, 0, 1, 0.7960784, 1,
-0.08178958, -0.1869738, -1.046556, 0, 1, 0.8039216, 1,
-0.08120426, -2.17416, -3.685597, 0, 1, 0.8078431, 1,
-0.07666881, -1.644901, -1.585572, 0, 1, 0.8156863, 1,
-0.07575575, -1.541474, -4.097578, 0, 1, 0.8196079, 1,
-0.0753965, -1.226137, -1.585423, 0, 1, 0.827451, 1,
-0.0752485, -0.3429525, -1.898232, 0, 1, 0.8313726, 1,
-0.07339148, 1.644409, 0.7048688, 0, 1, 0.8392157, 1,
-0.07155854, 1.543701, -0.4419288, 0, 1, 0.8431373, 1,
-0.06873601, 1.250571, 1.56566, 0, 1, 0.8509804, 1,
-0.06774125, -0.8892408, -4.167976, 0, 1, 0.854902, 1,
-0.06769149, 0.3791317, -0.08757726, 0, 1, 0.8627451, 1,
-0.06437638, -0.1575461, -3.529979, 0, 1, 0.8666667, 1,
-0.05779641, 0.783155, 0.1869028, 0, 1, 0.8745098, 1,
-0.05362124, 0.2889121, -1.099008, 0, 1, 0.8784314, 1,
-0.04908484, 0.6669934, -0.2113148, 0, 1, 0.8862745, 1,
-0.04296705, -0.3812273, -2.9833, 0, 1, 0.8901961, 1,
-0.04077335, -0.01136319, -1.429326, 0, 1, 0.8980392, 1,
-0.03765493, -0.333427, -3.232162, 0, 1, 0.9058824, 1,
-0.03413945, 0.5787448, 0.4879327, 0, 1, 0.9098039, 1,
-0.03248582, -1.097017, -3.939167, 0, 1, 0.9176471, 1,
-0.02994282, 1.274302, -0.460038, 0, 1, 0.9215686, 1,
-0.02838613, -3.187343, -2.702814, 0, 1, 0.9294118, 1,
-0.02291491, 0.1720617, -0.6721857, 0, 1, 0.9333333, 1,
-0.01575871, -1.229847, -2.248911, 0, 1, 0.9411765, 1,
-0.01489052, -0.6768404, -1.960517, 0, 1, 0.945098, 1,
-0.01428244, -0.9958021, -3.110427, 0, 1, 0.9529412, 1,
-0.01411843, -0.3321673, -4.511506, 0, 1, 0.9568627, 1,
-0.01402441, -0.9075102, -1.568734, 0, 1, 0.9647059, 1,
-0.01191263, -2.155159, -2.121322, 0, 1, 0.9686275, 1,
-0.009799927, 0.1761236, -0.770756, 0, 1, 0.9764706, 1,
-0.004230483, -0.1830764, -2.077748, 0, 1, 0.9803922, 1,
-0.001322862, -0.69732, -5.036867, 0, 1, 0.9882353, 1,
-0.001175931, -0.499347, -2.97837, 0, 1, 0.9921569, 1,
0.002060262, 0.985659, -1.020721, 0, 1, 1, 1,
0.005095756, 0.4859852, 0.4231686, 0, 0.9921569, 1, 1,
0.005413906, -0.3012205, 3.491855, 0, 0.9882353, 1, 1,
0.007720864, 0.6465352, -0.2192283, 0, 0.9803922, 1, 1,
0.00860683, -0.21443, 2.587676, 0, 0.9764706, 1, 1,
0.01118335, -1.183607, 3.352122, 0, 0.9686275, 1, 1,
0.02054529, -1.696462, 3.54465, 0, 0.9647059, 1, 1,
0.02113952, -0.9018241, 3.612494, 0, 0.9568627, 1, 1,
0.02169521, -1.483474, 3.953785, 0, 0.9529412, 1, 1,
0.02388103, -0.1167236, 3.761616, 0, 0.945098, 1, 1,
0.02845981, -0.2572184, 3.924698, 0, 0.9411765, 1, 1,
0.02875479, 0.5992197, -0.9269806, 0, 0.9333333, 1, 1,
0.02931661, 0.4411046, 0.8890418, 0, 0.9294118, 1, 1,
0.02944769, -1.081805, 3.195257, 0, 0.9215686, 1, 1,
0.03001491, -0.5688856, 2.331425, 0, 0.9176471, 1, 1,
0.03366014, -0.2020382, 2.929489, 0, 0.9098039, 1, 1,
0.0355132, 0.4379219, -0.5228666, 0, 0.9058824, 1, 1,
0.03876252, -0.3831918, 3.454158, 0, 0.8980392, 1, 1,
0.03906988, -0.3517921, 2.579034, 0, 0.8901961, 1, 1,
0.03918185, 0.07527497, 1.202821, 0, 0.8862745, 1, 1,
0.03960133, -1.020292, 3.032278, 0, 0.8784314, 1, 1,
0.04348378, 2.101414, 0.2934998, 0, 0.8745098, 1, 1,
0.04364369, -0.25027, 2.369842, 0, 0.8666667, 1, 1,
0.04743923, 1.120637, 1.716142, 0, 0.8627451, 1, 1,
0.04886669, -0.7434055, 3.512185, 0, 0.854902, 1, 1,
0.04926232, -1.828705, 4.629936, 0, 0.8509804, 1, 1,
0.05892263, 0.2648482, -1.06583, 0, 0.8431373, 1, 1,
0.06166831, 0.1712348, 0.1630155, 0, 0.8392157, 1, 1,
0.06288793, -1.361135, 2.482367, 0, 0.8313726, 1, 1,
0.06574621, -0.5313305, 4.137246, 0, 0.827451, 1, 1,
0.0659648, -0.2840398, 2.43338, 0, 0.8196079, 1, 1,
0.06795888, 0.7827895, -1.444138, 0, 0.8156863, 1, 1,
0.0717699, 0.1300573, -1.472654, 0, 0.8078431, 1, 1,
0.07443464, -1.340188, 2.915765, 0, 0.8039216, 1, 1,
0.07629237, 0.7144647, 0.3210535, 0, 0.7960784, 1, 1,
0.07846436, 1.715815, 0.4525585, 0, 0.7882353, 1, 1,
0.08079438, 0.7552534, 0.8954834, 0, 0.7843137, 1, 1,
0.08549603, -1.174658, 3.625984, 0, 0.7764706, 1, 1,
0.08632414, 0.3634916, 0.1624006, 0, 0.772549, 1, 1,
0.08679086, -0.9870135, 3.22377, 0, 0.7647059, 1, 1,
0.09038299, -0.7784587, 2.117289, 0, 0.7607843, 1, 1,
0.09093032, 0.3551635, 0.8649345, 0, 0.7529412, 1, 1,
0.09312866, 1.013711, 0.5625152, 0, 0.7490196, 1, 1,
0.09323984, 1.414821, 0.6815718, 0, 0.7411765, 1, 1,
0.09490938, 0.01739351, 0.6125771, 0, 0.7372549, 1, 1,
0.09738253, -0.1670232, 1.448911, 0, 0.7294118, 1, 1,
0.09969571, -0.1745684, 3.214835, 0, 0.7254902, 1, 1,
0.1009983, -0.798432, 3.705216, 0, 0.7176471, 1, 1,
0.1035388, -0.6947492, 2.592122, 0, 0.7137255, 1, 1,
0.1085261, -0.8309937, 2.684, 0, 0.7058824, 1, 1,
0.1088006, 0.2259209, -0.2702413, 0, 0.6980392, 1, 1,
0.1093594, -0.5715525, 4.201762, 0, 0.6941177, 1, 1,
0.1108429, 0.1760541, -0.8277912, 0, 0.6862745, 1, 1,
0.1150872, -0.8340858, 2.614747, 0, 0.682353, 1, 1,
0.1163821, -0.7627205, 2.168839, 0, 0.6745098, 1, 1,
0.1190678, 0.3304962, 0.3051969, 0, 0.6705883, 1, 1,
0.1193145, 0.4134789, -0.6117742, 0, 0.6627451, 1, 1,
0.1215931, 0.5426938, 1.381376, 0, 0.6588235, 1, 1,
0.1259956, -0.6186435, 3.694369, 0, 0.6509804, 1, 1,
0.128206, 2.405293, -0.1468318, 0, 0.6470588, 1, 1,
0.1288151, 1.087235, 0.0850711, 0, 0.6392157, 1, 1,
0.1309361, 0.3975135, -1.039757, 0, 0.6352941, 1, 1,
0.131779, 0.07731215, 1.258873, 0, 0.627451, 1, 1,
0.13739, 0.9155241, 0.3331628, 0, 0.6235294, 1, 1,
0.1418438, 0.3167173, 0.9621287, 0, 0.6156863, 1, 1,
0.1425385, 0.4327121, -1.374257, 0, 0.6117647, 1, 1,
0.1425406, 1.255039, 2.033171, 0, 0.6039216, 1, 1,
0.1477541, 0.2492965, -0.5256748, 0, 0.5960785, 1, 1,
0.1523416, 0.2722836, 0.943412, 0, 0.5921569, 1, 1,
0.1657939, -0.2834171, 2.261662, 0, 0.5843138, 1, 1,
0.1684161, -0.3058903, 2.989032, 0, 0.5803922, 1, 1,
0.1712469, 0.891651, 0.3641028, 0, 0.572549, 1, 1,
0.1754116, 0.4099047, 1.708107, 0, 0.5686275, 1, 1,
0.1802912, -0.2379955, 3.487078, 0, 0.5607843, 1, 1,
0.1816365, -1.269904, 3.495439, 0, 0.5568628, 1, 1,
0.1816374, -0.5347438, 4.684657, 0, 0.5490196, 1, 1,
0.1841814, 1.467622, -0.6307738, 0, 0.5450981, 1, 1,
0.1849285, -0.2941944, 2.661085, 0, 0.5372549, 1, 1,
0.1881295, -0.2433632, 2.652466, 0, 0.5333334, 1, 1,
0.1885221, -2.269377, 3.164873, 0, 0.5254902, 1, 1,
0.1944024, -0.7704822, 3.940477, 0, 0.5215687, 1, 1,
0.2049311, 0.3153984, -0.583234, 0, 0.5137255, 1, 1,
0.2109053, 1.432971, 1.928614, 0, 0.509804, 1, 1,
0.2167492, -0.5567991, 3.565798, 0, 0.5019608, 1, 1,
0.2216469, -2.121634, 1.611406, 0, 0.4941176, 1, 1,
0.2257681, -0.1276994, 2.194915, 0, 0.4901961, 1, 1,
0.2295795, -0.339709, 2.688152, 0, 0.4823529, 1, 1,
0.2303069, -0.7577882, 2.753687, 0, 0.4784314, 1, 1,
0.234391, -0.4423413, 1.782372, 0, 0.4705882, 1, 1,
0.2352459, -0.1491413, 2.837533, 0, 0.4666667, 1, 1,
0.2362353, -1.085854, 2.679839, 0, 0.4588235, 1, 1,
0.2378652, -1.112426, 2.735316, 0, 0.454902, 1, 1,
0.2392768, -0.5163029, 3.427816, 0, 0.4470588, 1, 1,
0.239423, 1.032951, -1.159945, 0, 0.4431373, 1, 1,
0.2440762, -0.2662272, 3.601075, 0, 0.4352941, 1, 1,
0.2514834, 0.04740022, 0.9571322, 0, 0.4313726, 1, 1,
0.2516716, 0.5394996, 0.5155677, 0, 0.4235294, 1, 1,
0.2529064, -0.290185, 3.722016, 0, 0.4196078, 1, 1,
0.2560888, 0.9217887, -0.1569928, 0, 0.4117647, 1, 1,
0.2582431, -0.317417, 2.302922, 0, 0.4078431, 1, 1,
0.2646783, -0.9326253, 1.523335, 0, 0.4, 1, 1,
0.2686636, -0.9766206, 2.454134, 0, 0.3921569, 1, 1,
0.270742, -1.376717, 2.749501, 0, 0.3882353, 1, 1,
0.2749822, 0.3592916, 0.2250549, 0, 0.3803922, 1, 1,
0.2751336, -2.373197, 5.140296, 0, 0.3764706, 1, 1,
0.2769069, -0.5681932, 3.243385, 0, 0.3686275, 1, 1,
0.2782141, 0.09272157, 1.838783, 0, 0.3647059, 1, 1,
0.2788536, 0.6001275, -0.4082457, 0, 0.3568628, 1, 1,
0.2809216, -0.8295797, 1.51046, 0, 0.3529412, 1, 1,
0.3046973, 1.307265, 1.188294, 0, 0.345098, 1, 1,
0.3050994, -0.019688, 3.306319, 0, 0.3411765, 1, 1,
0.3080037, 0.2659468, 0.4760121, 0, 0.3333333, 1, 1,
0.3115858, 0.9300968, 0.1103688, 0, 0.3294118, 1, 1,
0.3262596, -0.04780899, 2.497324, 0, 0.3215686, 1, 1,
0.3274251, 0.5348972, 0.3225648, 0, 0.3176471, 1, 1,
0.3328994, 3.315216, -0.04708412, 0, 0.3098039, 1, 1,
0.3329602, -1.516694, 1.734959, 0, 0.3058824, 1, 1,
0.3392895, 0.8167174, 0.2596584, 0, 0.2980392, 1, 1,
0.3434194, 1.101961, -1.567111, 0, 0.2901961, 1, 1,
0.3440775, -1.691308, 2.952816, 0, 0.2862745, 1, 1,
0.3526966, -2.026582, 3.323041, 0, 0.2784314, 1, 1,
0.3528681, 1.574376, -1.022762, 0, 0.2745098, 1, 1,
0.352899, -0.5643393, 1.811789, 0, 0.2666667, 1, 1,
0.3546498, -1.136301, 3.215528, 0, 0.2627451, 1, 1,
0.3556964, -0.6281894, 2.724313, 0, 0.254902, 1, 1,
0.3593108, -0.2998273, 1.284717, 0, 0.2509804, 1, 1,
0.3604356, 2.407119, 1.484557, 0, 0.2431373, 1, 1,
0.3605018, 0.7010829, -0.4720747, 0, 0.2392157, 1, 1,
0.3614398, 1.147884, 0.8116847, 0, 0.2313726, 1, 1,
0.3618633, -0.1033363, 2.951015, 0, 0.227451, 1, 1,
0.3669002, -1.545591, 3.389769, 0, 0.2196078, 1, 1,
0.3680221, 0.3767996, -0.1992858, 0, 0.2156863, 1, 1,
0.3690139, 0.5886247, 1.195327, 0, 0.2078431, 1, 1,
0.3699064, 0.7205391, 2.029724, 0, 0.2039216, 1, 1,
0.3725361, -0.4832292, 2.772984, 0, 0.1960784, 1, 1,
0.3743347, -0.2829064, 2.210207, 0, 0.1882353, 1, 1,
0.3754926, -1.335686, 2.521202, 0, 0.1843137, 1, 1,
0.3780442, 0.2846779, -0.3678713, 0, 0.1764706, 1, 1,
0.3801865, -0.004474347, 1.061311, 0, 0.172549, 1, 1,
0.3888617, -1.491284, 3.206144, 0, 0.1647059, 1, 1,
0.3918917, -0.7368792, 3.563394, 0, 0.1607843, 1, 1,
0.4001769, -2.191702, 3.463342, 0, 0.1529412, 1, 1,
0.4018937, -1.191661, 4.592694, 0, 0.1490196, 1, 1,
0.4025614, 0.1656706, 3.345902, 0, 0.1411765, 1, 1,
0.4046868, 0.2345076, 3.412589, 0, 0.1372549, 1, 1,
0.4066035, 1.457008, -0.5166496, 0, 0.1294118, 1, 1,
0.4073902, -1.002417, 3.496105, 0, 0.1254902, 1, 1,
0.4078939, -0.1784033, 2.479757, 0, 0.1176471, 1, 1,
0.4109194, -0.1738361, 1.655763, 0, 0.1137255, 1, 1,
0.4129735, 1.626532, 2.066353, 0, 0.1058824, 1, 1,
0.4173711, -0.2644546, 2.683048, 0, 0.09803922, 1, 1,
0.41958, -0.6828697, 3.672568, 0, 0.09411765, 1, 1,
0.4205962, -0.4220539, 0.6595253, 0, 0.08627451, 1, 1,
0.422449, 1.161922, 0.6454133, 0, 0.08235294, 1, 1,
0.4290993, -0.01411647, 2.752327, 0, 0.07450981, 1, 1,
0.4314708, 1.62098, 0.5735974, 0, 0.07058824, 1, 1,
0.4332876, -1.152787, 1.709004, 0, 0.0627451, 1, 1,
0.4357646, 0.3931253, 0.1328922, 0, 0.05882353, 1, 1,
0.4359947, 0.2207401, 1.9988, 0, 0.05098039, 1, 1,
0.4365883, -0.3117703, 2.535703, 0, 0.04705882, 1, 1,
0.4398659, 1.105289, -0.8346979, 0, 0.03921569, 1, 1,
0.444107, 1.775557, -0.6651662, 0, 0.03529412, 1, 1,
0.444307, -0.4199708, 3.484872, 0, 0.02745098, 1, 1,
0.4507288, 0.4092801, 0.008038496, 0, 0.02352941, 1, 1,
0.4541856, 0.6483617, 0.5304283, 0, 0.01568628, 1, 1,
0.4604559, 1.24539, -0.7229377, 0, 0.01176471, 1, 1,
0.4640418, 0.7128169, -0.9180961, 0, 0.003921569, 1, 1,
0.4665606, 0.4242269, 1.730222, 0.003921569, 0, 1, 1,
0.4695141, -1.037686, 3.617571, 0.007843138, 0, 1, 1,
0.472896, 0.8764836, 1.072619, 0.01568628, 0, 1, 1,
0.4742876, -0.1644874, 2.822391, 0.01960784, 0, 1, 1,
0.4763097, -0.6162441, 1.179267, 0.02745098, 0, 1, 1,
0.4763962, -0.2196876, 3.201233, 0.03137255, 0, 1, 1,
0.4795305, 0.7893388, 1.636388, 0.03921569, 0, 1, 1,
0.4805214, 0.14784, 1.026883, 0.04313726, 0, 1, 1,
0.4831596, 0.6444072, 0.5555354, 0.05098039, 0, 1, 1,
0.491062, 0.1726968, 0.107794, 0.05490196, 0, 1, 1,
0.510925, -0.8226679, 4.056997, 0.0627451, 0, 1, 1,
0.5112142, -1.7093, 1.470991, 0.06666667, 0, 1, 1,
0.5168822, -0.5298588, 1.802143, 0.07450981, 0, 1, 1,
0.5169548, -0.9465392, 2.141415, 0.07843138, 0, 1, 1,
0.5244644, -0.752085, 0.5755237, 0.08627451, 0, 1, 1,
0.5282886, 0.2877681, 0.8261618, 0.09019608, 0, 1, 1,
0.5308216, 0.07259656, 2.370819, 0.09803922, 0, 1, 1,
0.5320495, 0.6479725, 2.631315, 0.1058824, 0, 1, 1,
0.5325415, 1.519766, -0.7756858, 0.1098039, 0, 1, 1,
0.5365394, -1.63038, 2.597249, 0.1176471, 0, 1, 1,
0.541882, -1.487884, 3.078478, 0.1215686, 0, 1, 1,
0.5467311, -0.142185, 1.47716, 0.1294118, 0, 1, 1,
0.5556864, 0.955354, -0.1681201, 0.1333333, 0, 1, 1,
0.5582104, 1.218801, 1.374919, 0.1411765, 0, 1, 1,
0.5586467, 0.2147695, -0.1822306, 0.145098, 0, 1, 1,
0.5615311, 0.5848126, -0.1712726, 0.1529412, 0, 1, 1,
0.5657065, -1.1077, 2.817189, 0.1568628, 0, 1, 1,
0.5667217, 0.9330423, 1.799778, 0.1647059, 0, 1, 1,
0.568374, 0.1389949, 2.518178, 0.1686275, 0, 1, 1,
0.5702294, 0.545277, -0.823062, 0.1764706, 0, 1, 1,
0.5786384, 1.415017, 2.009534, 0.1803922, 0, 1, 1,
0.5790995, -1.859515, 2.430988, 0.1882353, 0, 1, 1,
0.5802951, 1.102053, 1.096947, 0.1921569, 0, 1, 1,
0.5814626, 0.6561812, 1.512602, 0.2, 0, 1, 1,
0.5827435, -0.7075588, 3.763491, 0.2078431, 0, 1, 1,
0.5832339, -0.355713, 2.561053, 0.2117647, 0, 1, 1,
0.5839863, 0.6478294, 3.053659, 0.2196078, 0, 1, 1,
0.5851758, 1.223686, -0.3210208, 0.2235294, 0, 1, 1,
0.5872442, -1.411012, 2.168518, 0.2313726, 0, 1, 1,
0.5937374, -1.598415, 2.713754, 0.2352941, 0, 1, 1,
0.5945752, 2.034785, 0.06191284, 0.2431373, 0, 1, 1,
0.5995288, -0.7689161, 2.720267, 0.2470588, 0, 1, 1,
0.6058835, -0.4881688, 2.560804, 0.254902, 0, 1, 1,
0.6137045, -0.01136139, 0.6900538, 0.2588235, 0, 1, 1,
0.6163049, 1.485595, -1.264022, 0.2666667, 0, 1, 1,
0.6195297, -0.9054968, 2.968328, 0.2705882, 0, 1, 1,
0.6196195, -0.4361317, 1.933576, 0.2784314, 0, 1, 1,
0.622546, -1.447065, 0.1320989, 0.282353, 0, 1, 1,
0.6231907, -0.009007501, 0.7798665, 0.2901961, 0, 1, 1,
0.6303586, -0.5625763, 2.577711, 0.2941177, 0, 1, 1,
0.6316572, -0.604997, 1.157809, 0.3019608, 0, 1, 1,
0.6365952, 0.3206825, 1.148328, 0.3098039, 0, 1, 1,
0.6372856, -0.1356267, 0.7717229, 0.3137255, 0, 1, 1,
0.6407921, -1.320838, 2.508292, 0.3215686, 0, 1, 1,
0.6420753, -1.836702, 1.473301, 0.3254902, 0, 1, 1,
0.6448249, -0.2417041, 2.193953, 0.3333333, 0, 1, 1,
0.6473793, 1.603353, -0.4433997, 0.3372549, 0, 1, 1,
0.649447, 0.3576236, 0.5006096, 0.345098, 0, 1, 1,
0.6543148, -0.8409868, 3.578252, 0.3490196, 0, 1, 1,
0.6583002, -0.54947, 3.219266, 0.3568628, 0, 1, 1,
0.6664838, 0.836225, 0.01946214, 0.3607843, 0, 1, 1,
0.6682322, -1.158036, 2.291464, 0.3686275, 0, 1, 1,
0.6737447, -1.785666, 1.728213, 0.372549, 0, 1, 1,
0.6760575, 0.2027377, -0.09511195, 0.3803922, 0, 1, 1,
0.6783277, -0.6208885, 1.484866, 0.3843137, 0, 1, 1,
0.6805956, -0.313235, 1.349412, 0.3921569, 0, 1, 1,
0.683898, -2.240734, 2.355762, 0.3960784, 0, 1, 1,
0.6852382, 0.6351812, 0.1843306, 0.4039216, 0, 1, 1,
0.6867955, -1.765944, 1.170356, 0.4117647, 0, 1, 1,
0.6870765, -0.9075975, 2.826885, 0.4156863, 0, 1, 1,
0.6946343, 0.1754454, -0.4954747, 0.4235294, 0, 1, 1,
0.6993464, 2.109976, -0.9440047, 0.427451, 0, 1, 1,
0.7014249, -1.147814, 4.3698, 0.4352941, 0, 1, 1,
0.7047417, -1.088621, 3.872663, 0.4392157, 0, 1, 1,
0.7112621, -0.6722244, 3.210099, 0.4470588, 0, 1, 1,
0.712481, -0.2596316, 3.962344, 0.4509804, 0, 1, 1,
0.7175033, 0.7358144, 0.4083648, 0.4588235, 0, 1, 1,
0.7313353, -1.494179, 2.890381, 0.4627451, 0, 1, 1,
0.7378817, -0.5391114, 3.888256, 0.4705882, 0, 1, 1,
0.7407128, -0.3821648, 2.476033, 0.4745098, 0, 1, 1,
0.7415381, -2.52297, 3.172707, 0.4823529, 0, 1, 1,
0.7460446, 0.7154901, 0.2237047, 0.4862745, 0, 1, 1,
0.7495049, 0.8376576, 0.04835019, 0.4941176, 0, 1, 1,
0.7543973, 0.4274196, 1.909324, 0.5019608, 0, 1, 1,
0.756271, -0.04651118, 0.9910395, 0.5058824, 0, 1, 1,
0.7594912, -0.7109577, 3.135232, 0.5137255, 0, 1, 1,
0.7694132, 1.869957, 1.791385, 0.5176471, 0, 1, 1,
0.7712728, 0.3741102, 2.547773, 0.5254902, 0, 1, 1,
0.7764382, 1.568, -0.7228658, 0.5294118, 0, 1, 1,
0.7790897, -1.138135, 4.090144, 0.5372549, 0, 1, 1,
0.7806875, -0.01428979, 0.2035001, 0.5411765, 0, 1, 1,
0.780926, -0.6090645, 2.839384, 0.5490196, 0, 1, 1,
0.7840205, -0.1770689, 2.164762, 0.5529412, 0, 1, 1,
0.7879658, 1.248891, 2.250679, 0.5607843, 0, 1, 1,
0.7956524, -2.490878, 2.942088, 0.5647059, 0, 1, 1,
0.8006136, -0.7733253, 2.2123, 0.572549, 0, 1, 1,
0.8053939, -0.3489909, 0.4942763, 0.5764706, 0, 1, 1,
0.8065608, -0.3349058, 1.689003, 0.5843138, 0, 1, 1,
0.8093123, 1.491256, 1.31445, 0.5882353, 0, 1, 1,
0.8099907, 0.2502135, 0.5879312, 0.5960785, 0, 1, 1,
0.8109113, -0.3687195, 2.252011, 0.6039216, 0, 1, 1,
0.8178492, -0.6080767, 0.9930319, 0.6078432, 0, 1, 1,
0.8185005, -2.038547, 2.515883, 0.6156863, 0, 1, 1,
0.8210901, -1.466674, 3.241234, 0.6196079, 0, 1, 1,
0.8314193, -0.8611695, 2.227018, 0.627451, 0, 1, 1,
0.8334372, 0.04100934, 0.8633568, 0.6313726, 0, 1, 1,
0.8436756, 0.3409809, 0.6365918, 0.6392157, 0, 1, 1,
0.8465198, -0.1263708, 2.59205, 0.6431373, 0, 1, 1,
0.8484242, 0.4662167, 0.7249317, 0.6509804, 0, 1, 1,
0.8484735, -1.044626, 4.046929, 0.654902, 0, 1, 1,
0.8492234, 2.027426, -0.3581401, 0.6627451, 0, 1, 1,
0.8499889, 1.720936, 2.641929, 0.6666667, 0, 1, 1,
0.8505161, 0.1920601, 0.1895338, 0.6745098, 0, 1, 1,
0.853707, -1.56471, 0.489158, 0.6784314, 0, 1, 1,
0.856637, -0.2592657, 1.289804, 0.6862745, 0, 1, 1,
0.8590823, 0.1465856, 2.107459, 0.6901961, 0, 1, 1,
0.8616841, -0.649487, 1.678299, 0.6980392, 0, 1, 1,
0.8621228, 0.9667051, 0.7600234, 0.7058824, 0, 1, 1,
0.862995, -0.08413766, 0.08871863, 0.7098039, 0, 1, 1,
0.864498, 0.6876237, 0.9076644, 0.7176471, 0, 1, 1,
0.8648912, -0.7771258, 1.921051, 0.7215686, 0, 1, 1,
0.8651845, 2.271577, -0.1908871, 0.7294118, 0, 1, 1,
0.8664536, 2.558837, 0.386801, 0.7333333, 0, 1, 1,
0.8675218, 0.7701218, 0.559139, 0.7411765, 0, 1, 1,
0.8679442, -0.8850957, 2.616347, 0.7450981, 0, 1, 1,
0.8683822, -0.5299699, 3.425267, 0.7529412, 0, 1, 1,
0.8692285, -0.3637083, 2.723081, 0.7568628, 0, 1, 1,
0.874711, -0.5610471, 2.682688, 0.7647059, 0, 1, 1,
0.8848541, 0.05709532, 0.1180752, 0.7686275, 0, 1, 1,
0.8857889, 0.1322235, 1.565197, 0.7764706, 0, 1, 1,
0.8883258, -0.09062485, 1.546686, 0.7803922, 0, 1, 1,
0.9036844, -0.3328485, -0.08572855, 0.7882353, 0, 1, 1,
0.9076591, 0.1372209, 0.3980708, 0.7921569, 0, 1, 1,
0.9101002, -0.8242045, 0.2724798, 0.8, 0, 1, 1,
0.9201075, -1.246498, 3.164229, 0.8078431, 0, 1, 1,
0.9203169, 0.2459279, 0.9458098, 0.8117647, 0, 1, 1,
0.9215442, -0.2465121, 1.869884, 0.8196079, 0, 1, 1,
0.9238648, 0.6099479, 2.845906, 0.8235294, 0, 1, 1,
0.926082, 0.03818032, 1.152654, 0.8313726, 0, 1, 1,
0.9295471, 0.1478186, 0.5302307, 0.8352941, 0, 1, 1,
0.9299222, -0.09149562, 3.306671, 0.8431373, 0, 1, 1,
0.9437065, -0.2220539, 1.49036, 0.8470588, 0, 1, 1,
0.950238, -0.1719137, 1.918194, 0.854902, 0, 1, 1,
0.95522, -1.294724, 3.583853, 0.8588235, 0, 1, 1,
0.9633045, 0.3654471, 2.210544, 0.8666667, 0, 1, 1,
0.9642681, 0.6462404, 1.698479, 0.8705882, 0, 1, 1,
0.9663944, 1.065328, 1.035928, 0.8784314, 0, 1, 1,
0.9664179, 0.3377335, 1.813671, 0.8823529, 0, 1, 1,
0.9675954, 0.8481188, 1.867795, 0.8901961, 0, 1, 1,
0.9693057, -0.2716887, 2.958108, 0.8941177, 0, 1, 1,
0.9741929, 0.43369, 2.312263, 0.9019608, 0, 1, 1,
0.9742922, -0.2507655, 3.196112, 0.9098039, 0, 1, 1,
0.9785874, 1.171545, 1.356038, 0.9137255, 0, 1, 1,
0.9834241, 0.7964356, -0.0116575, 0.9215686, 0, 1, 1,
0.9845595, 1.990685, 0.4611569, 0.9254902, 0, 1, 1,
0.985721, -1.156049, 1.28146, 0.9333333, 0, 1, 1,
0.9880778, -0.05085256, 2.0169, 0.9372549, 0, 1, 1,
0.9883425, -0.3437417, 2.023367, 0.945098, 0, 1, 1,
0.9907838, -0.3683452, 1.602587, 0.9490196, 0, 1, 1,
1.00734, 0.5936923, 0.2364059, 0.9568627, 0, 1, 1,
1.007557, 0.763047, 0.1790685, 0.9607843, 0, 1, 1,
1.010488, -0.561646, 3.092603, 0.9686275, 0, 1, 1,
1.011047, 0.5028664, -0.5085999, 0.972549, 0, 1, 1,
1.016203, -0.4640827, 2.654804, 0.9803922, 0, 1, 1,
1.016527, 1.057627, 0.7406215, 0.9843137, 0, 1, 1,
1.01677, -1.747036, 2.366442, 0.9921569, 0, 1, 1,
1.019706, 0.03467141, 0.6380983, 0.9960784, 0, 1, 1,
1.022587, -0.8113449, 2.664333, 1, 0, 0.9960784, 1,
1.031748, 0.1354815, 1.253186, 1, 0, 0.9882353, 1,
1.039459, -1.23308, 2.865224, 1, 0, 0.9843137, 1,
1.045351, 1.439213, 0.3908342, 1, 0, 0.9764706, 1,
1.047901, 0.4483481, 0.04895101, 1, 0, 0.972549, 1,
1.051147, 1.111325, -0.06229262, 1, 0, 0.9647059, 1,
1.05455, -0.5970097, 2.727384, 1, 0, 0.9607843, 1,
1.055788, -0.4578121, 2.532039, 1, 0, 0.9529412, 1,
1.060027, 0.2404966, 3.846396, 1, 0, 0.9490196, 1,
1.063725, -0.9651908, 2.072918, 1, 0, 0.9411765, 1,
1.065722, 0.2665263, 1.253567, 1, 0, 0.9372549, 1,
1.077911, -0.7674699, 2.572526, 1, 0, 0.9294118, 1,
1.077927, 0.4062166, 2.208212, 1, 0, 0.9254902, 1,
1.082282, -0.1314646, 2.786278, 1, 0, 0.9176471, 1,
1.086069, 0.2370797, 2.502589, 1, 0, 0.9137255, 1,
1.090169, -0.04377181, 2.852313, 1, 0, 0.9058824, 1,
1.090559, -0.3214043, 3.000998, 1, 0, 0.9019608, 1,
1.092767, 2.067727, 0.3052466, 1, 0, 0.8941177, 1,
1.104877, -0.7029048, 1.409089, 1, 0, 0.8862745, 1,
1.106319, 0.3190753, 1.235934, 1, 0, 0.8823529, 1,
1.107334, -0.3128803, 1.639658, 1, 0, 0.8745098, 1,
1.108315, -0.4950475, 1.616279, 1, 0, 0.8705882, 1,
1.118257, 0.5468174, 1.506504, 1, 0, 0.8627451, 1,
1.118767, -0.9202842, 2.731092, 1, 0, 0.8588235, 1,
1.120564, -1.253529, 1.397585, 1, 0, 0.8509804, 1,
1.120638, -0.9233835, 4.530032, 1, 0, 0.8470588, 1,
1.122792, 0.6559211, 1.509215, 1, 0, 0.8392157, 1,
1.128254, 0.3823722, -1.534439, 1, 0, 0.8352941, 1,
1.1283, -0.1927428, 3.131627, 1, 0, 0.827451, 1,
1.133485, 0.4418993, 1.404294, 1, 0, 0.8235294, 1,
1.13441, -0.1582208, 2.465423, 1, 0, 0.8156863, 1,
1.137099, -1.177649, 2.1998, 1, 0, 0.8117647, 1,
1.138303, -0.8730211, 1.243775, 1, 0, 0.8039216, 1,
1.146631, 2.086314, -1.080112, 1, 0, 0.7960784, 1,
1.161613, -1.942525, 3.437335, 1, 0, 0.7921569, 1,
1.162636, -0.1743763, 1.950736, 1, 0, 0.7843137, 1,
1.169075, 1.179458, 0.5534497, 1, 0, 0.7803922, 1,
1.175425, -0.3938709, 0.6487343, 1, 0, 0.772549, 1,
1.185211, 1.125429, 0.904245, 1, 0, 0.7686275, 1,
1.190547, 0.1786554, 1.516008, 1, 0, 0.7607843, 1,
1.191334, -2.140737, 1.970171, 1, 0, 0.7568628, 1,
1.192262, -0.3426403, 1.179684, 1, 0, 0.7490196, 1,
1.198052, 1.172781, -0.8093756, 1, 0, 0.7450981, 1,
1.200082, -0.9635658, 2.096972, 1, 0, 0.7372549, 1,
1.203614, -0.859262, 2.36106, 1, 0, 0.7333333, 1,
1.204131, -1.524192, 1.059486, 1, 0, 0.7254902, 1,
1.20416, -1.432609, 0.7966409, 1, 0, 0.7215686, 1,
1.204981, -1.430548, 1.289331, 1, 0, 0.7137255, 1,
1.21244, -1.171219, 1.942084, 1, 0, 0.7098039, 1,
1.213826, -2.931483, 3.255987, 1, 0, 0.7019608, 1,
1.213981, -0.9967376, 1.90888, 1, 0, 0.6941177, 1,
1.238282, -1.265162, 2.117841, 1, 0, 0.6901961, 1,
1.250216, -1.160839, 3.542484, 1, 0, 0.682353, 1,
1.253086, 0.02141304, 0.9200561, 1, 0, 0.6784314, 1,
1.256056, 1.213521, 0.7867265, 1, 0, 0.6705883, 1,
1.257969, -0.9692092, 1.041299, 1, 0, 0.6666667, 1,
1.276122, -1.100945, 2.902885, 1, 0, 0.6588235, 1,
1.276336, 0.3028752, 1.555101, 1, 0, 0.654902, 1,
1.278501, -1.08036, 2.811432, 1, 0, 0.6470588, 1,
1.279106, -0.0679152, 2.05401, 1, 0, 0.6431373, 1,
1.282306, -0.1813966, 0.5146049, 1, 0, 0.6352941, 1,
1.288532, -0.9785422, 2.459892, 1, 0, 0.6313726, 1,
1.294754, 0.4775933, 0.8796965, 1, 0, 0.6235294, 1,
1.295951, -0.1895733, 0.9237169, 1, 0, 0.6196079, 1,
1.303458, 0.11952, 1.175644, 1, 0, 0.6117647, 1,
1.304574, 0.9225225, 3.068483, 1, 0, 0.6078432, 1,
1.30912, -0.6339025, 2.496226, 1, 0, 0.6, 1,
1.310498, 0.2870173, 1.732609, 1, 0, 0.5921569, 1,
1.313399, 0.6816193, 3.014105, 1, 0, 0.5882353, 1,
1.327438, -0.5715095, 2.411102, 1, 0, 0.5803922, 1,
1.33039, 0.4920959, 0.9317402, 1, 0, 0.5764706, 1,
1.331439, 0.04616188, -0.388922, 1, 0, 0.5686275, 1,
1.335478, -3.431862, 3.122285, 1, 0, 0.5647059, 1,
1.345791, 0.6050766, -0.9091925, 1, 0, 0.5568628, 1,
1.357153, 0.02769049, 4.510611, 1, 0, 0.5529412, 1,
1.368596, 1.806061, -2.130096, 1, 0, 0.5450981, 1,
1.388805, 0.4424557, 1.78089, 1, 0, 0.5411765, 1,
1.395922, 1.556818, 0.8933349, 1, 0, 0.5333334, 1,
1.400782, -0.4759683, 0.4748855, 1, 0, 0.5294118, 1,
1.405591, 1.489073, -0.4658817, 1, 0, 0.5215687, 1,
1.41861, -0.07349616, 1.07365, 1, 0, 0.5176471, 1,
1.427244, -0.35799, 1.692443, 1, 0, 0.509804, 1,
1.431692, -0.7315448, 2.519989, 1, 0, 0.5058824, 1,
1.431859, -0.2711239, 2.188339, 1, 0, 0.4980392, 1,
1.442918, -2.393252, 2.222856, 1, 0, 0.4901961, 1,
1.444221, -0.5691224, 1.330095, 1, 0, 0.4862745, 1,
1.446938, 1.652271, 2.012719, 1, 0, 0.4784314, 1,
1.454675, 0.6963299, 3.421238, 1, 0, 0.4745098, 1,
1.458752, 1.605909, 1.627116, 1, 0, 0.4666667, 1,
1.460212, -0.06933872, 1.171487, 1, 0, 0.4627451, 1,
1.468727, -0.2834779, 1.202718, 1, 0, 0.454902, 1,
1.475569, 0.4017895, 0.8756967, 1, 0, 0.4509804, 1,
1.476517, 0.2511427, 1.515024, 1, 0, 0.4431373, 1,
1.491972, 0.09641905, 2.531202, 1, 0, 0.4392157, 1,
1.498006, 0.1677374, 1.116912, 1, 0, 0.4313726, 1,
1.50613, 1.489823, -0.4879145, 1, 0, 0.427451, 1,
1.509655, 0.1105681, 1.390753, 1, 0, 0.4196078, 1,
1.509711, -1.284199, 4.194528, 1, 0, 0.4156863, 1,
1.512648, -0.6950602, 4.346362, 1, 0, 0.4078431, 1,
1.520855, 0.5342997, 1.853755, 1, 0, 0.4039216, 1,
1.521731, -0.03125459, 1.3749, 1, 0, 0.3960784, 1,
1.535539, 1.449939, 0.4032017, 1, 0, 0.3882353, 1,
1.552206, 1.225789, 1.242106, 1, 0, 0.3843137, 1,
1.555493, 0.7343239, 3.558259, 1, 0, 0.3764706, 1,
1.582181, 0.4704095, 2.236406, 1, 0, 0.372549, 1,
1.585717, -2.291202, 1.324216, 1, 0, 0.3647059, 1,
1.589073, 1.352871, 0.9462391, 1, 0, 0.3607843, 1,
1.60359, 0.3457573, 2.037075, 1, 0, 0.3529412, 1,
1.611241, -1.049356, 2.030639, 1, 0, 0.3490196, 1,
1.622058, 0.6914421, 1.7753, 1, 0, 0.3411765, 1,
1.623528, 1.265029, 0.6390198, 1, 0, 0.3372549, 1,
1.62839, 0.3848468, -0.3462081, 1, 0, 0.3294118, 1,
1.635008, 0.1591098, 2.91604, 1, 0, 0.3254902, 1,
1.638076, 0.1031872, 1.870958, 1, 0, 0.3176471, 1,
1.663015, 0.8656768, -0.5174843, 1, 0, 0.3137255, 1,
1.663443, -0.8781689, 1.48956, 1, 0, 0.3058824, 1,
1.681838, 1.632417, 0.9720623, 1, 0, 0.2980392, 1,
1.683836, -1.324098, 2.803163, 1, 0, 0.2941177, 1,
1.689661, -0.9018435, 2.356261, 1, 0, 0.2862745, 1,
1.700207, -0.5209603, -1.000044, 1, 0, 0.282353, 1,
1.705598, -1.327993, 2.098241, 1, 0, 0.2745098, 1,
1.708118, 0.01872363, 1.570156, 1, 0, 0.2705882, 1,
1.735834, -0.6274182, 1.232804, 1, 0, 0.2627451, 1,
1.763334, -1.836511, 1.67985, 1, 0, 0.2588235, 1,
1.76978, -0.9418305, 2.776805, 1, 0, 0.2509804, 1,
1.797799, -0.949891, 2.965052, 1, 0, 0.2470588, 1,
1.800161, -2.003161, 3.636399, 1, 0, 0.2392157, 1,
1.828236, -2.515327, 2.067884, 1, 0, 0.2352941, 1,
1.914749, 0.4180906, 2.762454, 1, 0, 0.227451, 1,
1.914937, -0.273781, 1.603917, 1, 0, 0.2235294, 1,
1.925749, 0.2771314, 1.164494, 1, 0, 0.2156863, 1,
1.925876, -1.581542, 3.781456, 1, 0, 0.2117647, 1,
1.935675, 0.2817764, 1.16977, 1, 0, 0.2039216, 1,
1.967555, -0.9256791, 1.396101, 1, 0, 0.1960784, 1,
1.96969, 0.7058079, 0.8266866, 1, 0, 0.1921569, 1,
2.017313, -0.04298991, 1.754566, 1, 0, 0.1843137, 1,
2.018813, 0.572216, 1.02175, 1, 0, 0.1803922, 1,
2.020241, 0.1939876, 1.20462, 1, 0, 0.172549, 1,
2.071815, 1.486291, 0.835241, 1, 0, 0.1686275, 1,
2.078092, 0.0248782, 2.795847, 1, 0, 0.1607843, 1,
2.102369, 0.2770589, 3.555702, 1, 0, 0.1568628, 1,
2.117806, 0.08107606, 0.7768697, 1, 0, 0.1490196, 1,
2.123533, 0.4450518, 1.290038, 1, 0, 0.145098, 1,
2.142324, 0.1929911, 1.198513, 1, 0, 0.1372549, 1,
2.16313, -0.3351114, 0.6249266, 1, 0, 0.1333333, 1,
2.167453, -0.471752, 0.1155029, 1, 0, 0.1254902, 1,
2.194385, -1.814888, 2.121749, 1, 0, 0.1215686, 1,
2.203087, 0.7206547, 0.6488331, 1, 0, 0.1137255, 1,
2.211549, -0.1566341, 1.89981, 1, 0, 0.1098039, 1,
2.252315, 0.4260151, 1.615456, 1, 0, 0.1019608, 1,
2.257188, 1.009982, 0.02236376, 1, 0, 0.09411765, 1,
2.286687, -0.4140954, 2.566444, 1, 0, 0.09019608, 1,
2.329225, -0.1428747, 1.101932, 1, 0, 0.08235294, 1,
2.346503, 0.8136495, 0.4760359, 1, 0, 0.07843138, 1,
2.382779, 0.5293819, 1.586362, 1, 0, 0.07058824, 1,
2.437602, 1.361761, 3.596431, 1, 0, 0.06666667, 1,
2.446501, -1.184983, 1.887746, 1, 0, 0.05882353, 1,
2.45976, 0.2897794, 0.4950028, 1, 0, 0.05490196, 1,
2.520921, -0.1026063, 0.2954339, 1, 0, 0.04705882, 1,
2.554968, -0.09136873, 2.465538, 1, 0, 0.04313726, 1,
2.569359, 0.3079832, 2.810469, 1, 0, 0.03529412, 1,
2.595975, -0.2271016, -0.7953757, 1, 0, 0.03137255, 1,
2.654658, -0.07430831, 1.361298, 1, 0, 0.02352941, 1,
2.699739, 1.755422, 0.9614627, 1, 0, 0.01960784, 1,
3.280577, 1.845775, 2.666382, 1, 0, 0.01176471, 1,
3.441606, 0.3614502, 1.043705, 1, 0, 0.007843138, 1
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
0.1151181, -4.575492, -8.114985, 0, -0.5, 0.5, 0.5,
0.1151181, -4.575492, -8.114985, 1, -0.5, 0.5, 0.5,
0.1151181, -4.575492, -8.114985, 1, 1.5, 0.5, 0.5,
0.1151181, -4.575492, -8.114985, 0, 1.5, 0.5, 0.5
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
-4.339049, -0.05832303, -8.114985, 0, -0.5, 0.5, 0.5,
-4.339049, -0.05832303, -8.114985, 1, -0.5, 0.5, 0.5,
-4.339049, -0.05832303, -8.114985, 1, 1.5, 0.5, 0.5,
-4.339049, -0.05832303, -8.114985, 0, 1.5, 0.5, 0.5
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
-4.339049, -4.575492, -0.5267758, 0, -0.5, 0.5, 0.5,
-4.339049, -4.575492, -0.5267758, 1, -0.5, 0.5, 0.5,
-4.339049, -4.575492, -0.5267758, 1, 1.5, 0.5, 0.5,
-4.339049, -4.575492, -0.5267758, 0, 1.5, 0.5, 0.5
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
-3, -3.533068, -6.36386,
3, -3.533068, -6.36386,
-3, -3.533068, -6.36386,
-3, -3.706806, -6.655714,
-2, -3.533068, -6.36386,
-2, -3.706806, -6.655714,
-1, -3.533068, -6.36386,
-1, -3.706806, -6.655714,
0, -3.533068, -6.36386,
0, -3.706806, -6.655714,
1, -3.533068, -6.36386,
1, -3.706806, -6.655714,
2, -3.533068, -6.36386,
2, -3.706806, -6.655714,
3, -3.533068, -6.36386,
3, -3.706806, -6.655714
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
-3, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
-3, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
-3, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
-3, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5,
-2, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
-2, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
-2, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
-2, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5,
-1, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
-1, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
-1, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
-1, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5,
0, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
0, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
0, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
0, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5,
1, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
1, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
1, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
1, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5,
2, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
2, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
2, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
2, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5,
3, -4.05428, -7.239422, 0, -0.5, 0.5, 0.5,
3, -4.05428, -7.239422, 1, -0.5, 0.5, 0.5,
3, -4.05428, -7.239422, 1, 1.5, 0.5, 0.5,
3, -4.05428, -7.239422, 0, 1.5, 0.5, 0.5
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
-3.311165, -3, -6.36386,
-3.311165, 3, -6.36386,
-3.311165, -3, -6.36386,
-3.482479, -3, -6.655714,
-3.311165, -2, -6.36386,
-3.482479, -2, -6.655714,
-3.311165, -1, -6.36386,
-3.482479, -1, -6.655714,
-3.311165, 0, -6.36386,
-3.482479, 0, -6.655714,
-3.311165, 1, -6.36386,
-3.482479, 1, -6.655714,
-3.311165, 2, -6.36386,
-3.482479, 2, -6.655714,
-3.311165, 3, -6.36386,
-3.482479, 3, -6.655714
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
-3.825107, -3, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, -3, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, -3, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, -3, -7.239422, 0, 1.5, 0.5, 0.5,
-3.825107, -2, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, -2, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, -2, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, -2, -7.239422, 0, 1.5, 0.5, 0.5,
-3.825107, -1, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, -1, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, -1, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, -1, -7.239422, 0, 1.5, 0.5, 0.5,
-3.825107, 0, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, 0, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, 0, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, 0, -7.239422, 0, 1.5, 0.5, 0.5,
-3.825107, 1, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, 1, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, 1, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, 1, -7.239422, 0, 1.5, 0.5, 0.5,
-3.825107, 2, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, 2, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, 2, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, 2, -7.239422, 0, 1.5, 0.5, 0.5,
-3.825107, 3, -7.239422, 0, -0.5, 0.5, 0.5,
-3.825107, 3, -7.239422, 1, -0.5, 0.5, 0.5,
-3.825107, 3, -7.239422, 1, 1.5, 0.5, 0.5,
-3.825107, 3, -7.239422, 0, 1.5, 0.5, 0.5
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
-3.311165, -3.533068, -6,
-3.311165, -3.533068, 4,
-3.311165, -3.533068, -6,
-3.482479, -3.706806, -6,
-3.311165, -3.533068, -4,
-3.482479, -3.706806, -4,
-3.311165, -3.533068, -2,
-3.482479, -3.706806, -2,
-3.311165, -3.533068, 0,
-3.482479, -3.706806, 0,
-3.311165, -3.533068, 2,
-3.482479, -3.706806, 2,
-3.311165, -3.533068, 4,
-3.482479, -3.706806, 4
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
"-6",
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
-3.825107, -4.05428, -6, 0, -0.5, 0.5, 0.5,
-3.825107, -4.05428, -6, 1, -0.5, 0.5, 0.5,
-3.825107, -4.05428, -6, 1, 1.5, 0.5, 0.5,
-3.825107, -4.05428, -6, 0, 1.5, 0.5, 0.5,
-3.825107, -4.05428, -4, 0, -0.5, 0.5, 0.5,
-3.825107, -4.05428, -4, 1, -0.5, 0.5, 0.5,
-3.825107, -4.05428, -4, 1, 1.5, 0.5, 0.5,
-3.825107, -4.05428, -4, 0, 1.5, 0.5, 0.5,
-3.825107, -4.05428, -2, 0, -0.5, 0.5, 0.5,
-3.825107, -4.05428, -2, 1, -0.5, 0.5, 0.5,
-3.825107, -4.05428, -2, 1, 1.5, 0.5, 0.5,
-3.825107, -4.05428, -2, 0, 1.5, 0.5, 0.5,
-3.825107, -4.05428, 0, 0, -0.5, 0.5, 0.5,
-3.825107, -4.05428, 0, 1, -0.5, 0.5, 0.5,
-3.825107, -4.05428, 0, 1, 1.5, 0.5, 0.5,
-3.825107, -4.05428, 0, 0, 1.5, 0.5, 0.5,
-3.825107, -4.05428, 2, 0, -0.5, 0.5, 0.5,
-3.825107, -4.05428, 2, 1, -0.5, 0.5, 0.5,
-3.825107, -4.05428, 2, 1, 1.5, 0.5, 0.5,
-3.825107, -4.05428, 2, 0, 1.5, 0.5, 0.5,
-3.825107, -4.05428, 4, 0, -0.5, 0.5, 0.5,
-3.825107, -4.05428, 4, 1, -0.5, 0.5, 0.5,
-3.825107, -4.05428, 4, 1, 1.5, 0.5, 0.5,
-3.825107, -4.05428, 4, 0, 1.5, 0.5, 0.5
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
-3.311165, -3.533068, -6.36386,
-3.311165, 3.416422, -6.36386,
-3.311165, -3.533068, 5.310308,
-3.311165, 3.416422, 5.310308,
-3.311165, -3.533068, -6.36386,
-3.311165, -3.533068, 5.310308,
-3.311165, 3.416422, -6.36386,
-3.311165, 3.416422, 5.310308,
-3.311165, -3.533068, -6.36386,
3.541401, -3.533068, -6.36386,
-3.311165, -3.533068, 5.310308,
3.541401, -3.533068, 5.310308,
-3.311165, 3.416422, -6.36386,
3.541401, 3.416422, -6.36386,
-3.311165, 3.416422, 5.310308,
3.541401, 3.416422, 5.310308,
3.541401, -3.533068, -6.36386,
3.541401, 3.416422, -6.36386,
3.541401, -3.533068, 5.310308,
3.541401, 3.416422, 5.310308,
3.541401, -3.533068, -6.36386,
3.541401, -3.533068, 5.310308,
3.541401, 3.416422, -6.36386,
3.541401, 3.416422, 5.310308
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
var radius = 8.12527;
var distance = 36.15025;
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
mvMatrix.translate( -0.1151181, 0.05832303, 0.5267758 );
mvMatrix.scale( 1.282031, 1.26415, 0.7525334 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.15025);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Pirimiphos-Methyl<-read.table("Pirimiphos-Methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pirimiphos-Methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
```

```r
y<-Pirimiphos-Methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
```

```r
z<-Pirimiphos-Methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pirimiphos' not found
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
-3.21137, -0.4417098, -1.601604, 0, 0, 1, 1, 1,
-3.038881, -0.6231014, -1.324018, 1, 0, 0, 1, 1,
-2.973427, -0.9442095, -1.892017, 1, 0, 0, 1, 1,
-2.921331, 0.02783963, -3.163421, 1, 0, 0, 1, 1,
-2.911422, -0.8165411, 0.1846306, 1, 0, 0, 1, 1,
-2.813909, -0.08759121, -1.115958, 1, 0, 0, 1, 1,
-2.73237, 0.9642695, -0.9213186, 0, 0, 0, 1, 1,
-2.602248, 1.598388, -2.189117, 0, 0, 0, 1, 1,
-2.449411, 0.2404225, 0.1676998, 0, 0, 0, 1, 1,
-2.418618, 0.2519312, 0.2427531, 0, 0, 0, 1, 1,
-2.412301, 0.1223649, -0.349378, 0, 0, 0, 1, 1,
-2.337885, -0.388682, -2.321238, 0, 0, 0, 1, 1,
-2.333089, 0.4818285, -1.162296, 0, 0, 0, 1, 1,
-2.324948, -1.424484, -3.231041, 1, 1, 1, 1, 1,
-2.277232, -0.7772087, -2.71338, 1, 1, 1, 1, 1,
-2.202568, 0.276339, -1.393924, 1, 1, 1, 1, 1,
-2.162533, 1.021544, -1.07638, 1, 1, 1, 1, 1,
-2.135968, 0.9896634, -2.414829, 1, 1, 1, 1, 1,
-2.068375, -0.9278547, -1.792346, 1, 1, 1, 1, 1,
-2.023841, 0.2456985, -1.447001, 1, 1, 1, 1, 1,
-2.005355, 1.613757, 0.7700515, 1, 1, 1, 1, 1,
-2.001311, -0.3592133, -0.99937, 1, 1, 1, 1, 1,
-1.9807, 0.3023235, -2.103965, 1, 1, 1, 1, 1,
-1.952371, 0.2128888, -1.437008, 1, 1, 1, 1, 1,
-1.914787, -0.9611463, -2.577469, 1, 1, 1, 1, 1,
-1.91043, 0.2454459, -1.763527, 1, 1, 1, 1, 1,
-1.886954, -0.09989776, -0.1414657, 1, 1, 1, 1, 1,
-1.885874, 0.4914518, -0.8886442, 1, 1, 1, 1, 1,
-1.868129, 1.080463, -2.021469, 0, 0, 1, 1, 1,
-1.861294, 1.95756, 1.779338, 1, 0, 0, 1, 1,
-1.859026, 1.49896, -1.33267, 1, 0, 0, 1, 1,
-1.855991, -1.634289, -1.073139, 1, 0, 0, 1, 1,
-1.831849, 0.4571036, -1.606156, 1, 0, 0, 1, 1,
-1.795836, -0.7032759, -1.602265, 1, 0, 0, 1, 1,
-1.791469, 0.5976363, 0.05139128, 0, 0, 0, 1, 1,
-1.776036, 0.4899376, -0.6189308, 0, 0, 0, 1, 1,
-1.750168, -1.668392, -2.549706, 0, 0, 0, 1, 1,
-1.746574, -0.8026612, -0.7931855, 0, 0, 0, 1, 1,
-1.743489, -2.168987, 0.3399515, 0, 0, 0, 1, 1,
-1.741647, -0.3775698, -1.710187, 0, 0, 0, 1, 1,
-1.741395, 1.307771, -0.8817219, 0, 0, 0, 1, 1,
-1.734462, -1.137445, -2.104336, 1, 1, 1, 1, 1,
-1.708541, -0.03525195, -1.270384, 1, 1, 1, 1, 1,
-1.702199, 1.686636, 0.074029, 1, 1, 1, 1, 1,
-1.698189, 0.2056165, -1.93282, 1, 1, 1, 1, 1,
-1.685126, -1.634114, -1.639004, 1, 1, 1, 1, 1,
-1.678931, 1.016156, -1.104655, 1, 1, 1, 1, 1,
-1.677325, 0.410804, -0.959751, 1, 1, 1, 1, 1,
-1.672782, -0.03707556, -1.5135, 1, 1, 1, 1, 1,
-1.670718, 1.462416, -2.270967, 1, 1, 1, 1, 1,
-1.66225, 0.3185143, -2.776271, 1, 1, 1, 1, 1,
-1.653821, 1.533993, -0.3627312, 1, 1, 1, 1, 1,
-1.648238, -1.459792, -3.907183, 1, 1, 1, 1, 1,
-1.645895, -2.351974, -2.392462, 1, 1, 1, 1, 1,
-1.640702, 1.077564, -0.6293832, 1, 1, 1, 1, 1,
-1.636445, -0.446785, -0.5163786, 1, 1, 1, 1, 1,
-1.616825, 1.495821, -0.1090464, 0, 0, 1, 1, 1,
-1.605428, -0.6546299, -0.7244676, 1, 0, 0, 1, 1,
-1.604728, -0.04133254, -2.119106, 1, 0, 0, 1, 1,
-1.588833, -1.340192, -2.223886, 1, 0, 0, 1, 1,
-1.588453, -0.8756613, -4.568034, 1, 0, 0, 1, 1,
-1.57781, 1.246846, -0.6321301, 1, 0, 0, 1, 1,
-1.573087, -1.491413, -1.848438, 0, 0, 0, 1, 1,
-1.564791, -0.02850733, -2.365442, 0, 0, 0, 1, 1,
-1.546997, 3.160822, -0.1265502, 0, 0, 0, 1, 1,
-1.545167, 0.0723706, -0.2042183, 0, 0, 0, 1, 1,
-1.518869, -0.6641157, -1.610272, 0, 0, 0, 1, 1,
-1.492523, -0.2631512, -1.462349, 0, 0, 0, 1, 1,
-1.477177, 0.1132051, -1.244481, 0, 0, 0, 1, 1,
-1.46391, 1.75572, -1.051118, 1, 1, 1, 1, 1,
-1.463601, 0.7800855, -1.502577, 1, 1, 1, 1, 1,
-1.450556, -0.5464975, -2.504822, 1, 1, 1, 1, 1,
-1.437804, 1.314564, -0.7859801, 1, 1, 1, 1, 1,
-1.433413, -0.7045594, -2.260071, 1, 1, 1, 1, 1,
-1.430416, -1.613868, -2.128103, 1, 1, 1, 1, 1,
-1.421094, 0.2731142, -1.970353, 1, 1, 1, 1, 1,
-1.416575, 0.2684423, -0.7875467, 1, 1, 1, 1, 1,
-1.387974, 0.9460608, -0.49952, 1, 1, 1, 1, 1,
-1.365217, 0.9081027, -0.03164624, 1, 1, 1, 1, 1,
-1.362413, -1.368828, -2.362241, 1, 1, 1, 1, 1,
-1.35933, 0.5701385, -3.123667, 1, 1, 1, 1, 1,
-1.352319, 0.5142568, -2.993444, 1, 1, 1, 1, 1,
-1.348292, -1.285687, -2.886775, 1, 1, 1, 1, 1,
-1.346091, -1.015264, -3.16025, 1, 1, 1, 1, 1,
-1.343117, -0.8367633, -1.172672, 0, 0, 1, 1, 1,
-1.338682, 1.365164, -1.695799, 1, 0, 0, 1, 1,
-1.337042, -1.201811, -0.7164354, 1, 0, 0, 1, 1,
-1.324475, 0.9207126, -1.290404, 1, 0, 0, 1, 1,
-1.320525, 1.670979, -0.7705597, 1, 0, 0, 1, 1,
-1.318486, -1.093867, -1.655848, 1, 0, 0, 1, 1,
-1.317817, 1.193926, -1.89557, 0, 0, 0, 1, 1,
-1.304143, -0.3052374, -1.718429, 0, 0, 0, 1, 1,
-1.298272, -2.00734, -2.622824, 0, 0, 0, 1, 1,
-1.290897, 0.7734346, -1.441564, 0, 0, 0, 1, 1,
-1.282421, -0.6792836, -0.1651314, 0, 0, 0, 1, 1,
-1.272958, 0.1087555, -0.1748617, 0, 0, 0, 1, 1,
-1.25929, -0.5025716, -1.486811, 0, 0, 0, 1, 1,
-1.257159, 0.1384578, -0.5168124, 1, 1, 1, 1, 1,
-1.254966, -0.5356395, -1.363447, 1, 1, 1, 1, 1,
-1.240119, 0.4524929, 0.2775351, 1, 1, 1, 1, 1,
-1.239982, -1.050637, -1.645805, 1, 1, 1, 1, 1,
-1.237498, -0.7871792, -3.514458, 1, 1, 1, 1, 1,
-1.231216, -0.5890315, -2.020325, 1, 1, 1, 1, 1,
-1.229194, 0.3549088, -1.328142, 1, 1, 1, 1, 1,
-1.226646, -1.280208, -1.608582, 1, 1, 1, 1, 1,
-1.213747, -0.4593236, -2.297556, 1, 1, 1, 1, 1,
-1.206051, 0.331513, -2.011518, 1, 1, 1, 1, 1,
-1.205005, 0.6680637, -2.480212, 1, 1, 1, 1, 1,
-1.201496, 0.1509041, -1.114676, 1, 1, 1, 1, 1,
-1.201348, 1.406933, -1.883803, 1, 1, 1, 1, 1,
-1.198717, 2.251269, 1.433738, 1, 1, 1, 1, 1,
-1.197369, -1.053533, -1.987911, 1, 1, 1, 1, 1,
-1.190974, -0.02352818, -2.377791, 0, 0, 1, 1, 1,
-1.176476, -0.2872209, -4.060288, 1, 0, 0, 1, 1,
-1.168121, 0.4026275, -1.092417, 1, 0, 0, 1, 1,
-1.163766, -0.7451288, -1.742792, 1, 0, 0, 1, 1,
-1.15624, 0.5883518, -0.2498672, 1, 0, 0, 1, 1,
-1.155304, -0.07897528, -2.045633, 1, 0, 0, 1, 1,
-1.154787, 2.169861, -0.1390549, 0, 0, 0, 1, 1,
-1.149335, -1.12023, -1.320862, 0, 0, 0, 1, 1,
-1.146235, -1.382824, -3.056653, 0, 0, 0, 1, 1,
-1.140278, -0.06304093, -0.214581, 0, 0, 0, 1, 1,
-1.137481, 0.5601816, 0.4213271, 0, 0, 0, 1, 1,
-1.132149, -0.2871437, -1.291081, 0, 0, 0, 1, 1,
-1.129686, 0.0564246, -1.640651, 0, 0, 0, 1, 1,
-1.123483, 0.1803873, -3.7214, 1, 1, 1, 1, 1,
-1.116127, -0.497838, -1.524746, 1, 1, 1, 1, 1,
-1.113025, 1.513999, -1.177424, 1, 1, 1, 1, 1,
-1.110955, 0.8204572, -0.7343102, 1, 1, 1, 1, 1,
-1.096708, 0.4705532, -0.1597971, 1, 1, 1, 1, 1,
-1.094876, -0.9387609, -2.775626, 1, 1, 1, 1, 1,
-1.091556, 0.4464614, -2.186749, 1, 1, 1, 1, 1,
-1.091447, 1.185032, -0.993941, 1, 1, 1, 1, 1,
-1.090788, -1.065071, -1.271787, 1, 1, 1, 1, 1,
-1.085181, -0.8205381, -2.267158, 1, 1, 1, 1, 1,
-1.084473, -0.7499821, -2.357134, 1, 1, 1, 1, 1,
-1.083637, -0.8159141, -2.896518, 1, 1, 1, 1, 1,
-1.069203, 0.6665868, -2.007085, 1, 1, 1, 1, 1,
-1.069056, -0.2385685, -1.200231, 1, 1, 1, 1, 1,
-1.068819, -1.013735, -3.630266, 1, 1, 1, 1, 1,
-1.066743, 0.1626161, -0.9479272, 0, 0, 1, 1, 1,
-1.063206, -0.1238343, -0.7572696, 1, 0, 0, 1, 1,
-1.059482, -0.1319854, -2.085443, 1, 0, 0, 1, 1,
-1.05838, 0.09755386, -1.580735, 1, 0, 0, 1, 1,
-1.050343, 0.7230105, -1.867768, 1, 0, 0, 1, 1,
-1.048728, 1.083981, -1.499677, 1, 0, 0, 1, 1,
-1.036321, 1.136841, -0.4147565, 0, 0, 0, 1, 1,
-1.035702, -1.352021, -1.5434, 0, 0, 0, 1, 1,
-1.03366, 0.8281142, 0.2430189, 0, 0, 0, 1, 1,
-1.031384, -0.6873758, -2.402046, 0, 0, 0, 1, 1,
-1.027826, -0.1335544, -0.1766594, 0, 0, 0, 1, 1,
-1.02441, -0.1513668, -2.091184, 0, 0, 0, 1, 1,
-1.020069, 0.9648984, -1.392403, 0, 0, 0, 1, 1,
-1.015924, -0.2699086, -2.103939, 1, 1, 1, 1, 1,
-1.013626, 0.4772407, -1.569902, 1, 1, 1, 1, 1,
-1.013515, -1.230395, -2.644014, 1, 1, 1, 1, 1,
-1.012835, -0.2159773, -0.7851354, 1, 1, 1, 1, 1,
-1.003117, 1.053791, -1.694081, 1, 1, 1, 1, 1,
-0.9979583, -0.4405772, -2.641514, 1, 1, 1, 1, 1,
-0.9952849, 2.179496, -0.2656449, 1, 1, 1, 1, 1,
-0.9918556, -0.8080731, -1.881289, 1, 1, 1, 1, 1,
-0.9918455, 1.289303, 0.5395516, 1, 1, 1, 1, 1,
-0.9916624, 0.1786261, -0.1751129, 1, 1, 1, 1, 1,
-0.9912287, -0.489254, -3.259097, 1, 1, 1, 1, 1,
-0.9858089, -0.471318, -1.431396, 1, 1, 1, 1, 1,
-0.9701716, -1.074094, -0.5175479, 1, 1, 1, 1, 1,
-0.9651379, 0.4326893, -1.147334, 1, 1, 1, 1, 1,
-0.9646393, 0.9602366, 0.1214939, 1, 1, 1, 1, 1,
-0.9553401, -1.250776, -3.218939, 0, 0, 1, 1, 1,
-0.9542823, 1.54338, -1.82643, 1, 0, 0, 1, 1,
-0.9528219, -0.6062823, -1.801876, 1, 0, 0, 1, 1,
-0.9435993, 0.7327865, -1.516614, 1, 0, 0, 1, 1,
-0.9435657, 0.6327422, 0.2637216, 1, 0, 0, 1, 1,
-0.9422684, -1.07661, -3.832236, 1, 0, 0, 1, 1,
-0.939531, 1.174995, -1.193419, 0, 0, 0, 1, 1,
-0.9343456, -0.4159973, -2.534306, 0, 0, 0, 1, 1,
-0.9303825, 0.7636901, 1.229969, 0, 0, 0, 1, 1,
-0.9273522, 0.5983327, -1.366313, 0, 0, 0, 1, 1,
-0.9186987, 0.4590237, -1.603437, 0, 0, 0, 1, 1,
-0.9131213, -0.9222321, -1.591902, 0, 0, 0, 1, 1,
-0.9110065, 0.06887091, -1.035068, 0, 0, 0, 1, 1,
-0.903257, -1.144731, -3.740469, 1, 1, 1, 1, 1,
-0.9005321, -0.520348, -0.641394, 1, 1, 1, 1, 1,
-0.8962979, -1.861042, -3.134907, 1, 1, 1, 1, 1,
-0.8843761, 0.02016255, -2.6114, 1, 1, 1, 1, 1,
-0.8831969, 0.836827, -1.235459, 1, 1, 1, 1, 1,
-0.8825267, 0.01304486, -1.471085, 1, 1, 1, 1, 1,
-0.8809133, -0.8156534, -2.08173, 1, 1, 1, 1, 1,
-0.8804405, 1.455941, -1.243982, 1, 1, 1, 1, 1,
-0.875864, -1.438164, -2.385157, 1, 1, 1, 1, 1,
-0.8725235, -0.1194971, -2.961388, 1, 1, 1, 1, 1,
-0.8677126, -0.6066626, -1.737668, 1, 1, 1, 1, 1,
-0.8665864, -0.8516399, -1.932124, 1, 1, 1, 1, 1,
-0.8620282, -1.52364, -3.940003, 1, 1, 1, 1, 1,
-0.8552853, -0.5203894, -2.320606, 1, 1, 1, 1, 1,
-0.8494433, -1.492641, -2.487729, 1, 1, 1, 1, 1,
-0.8472747, 0.8662826, 0.1911448, 0, 0, 1, 1, 1,
-0.8422405, 0.2003149, -2.198784, 1, 0, 0, 1, 1,
-0.8416815, -0.2278602, -3.221225, 1, 0, 0, 1, 1,
-0.8368065, 0.6676288, -1.15225, 1, 0, 0, 1, 1,
-0.8367599, -0.006599956, -3.09349, 1, 0, 0, 1, 1,
-0.8327507, 0.117703, -3.666202, 1, 0, 0, 1, 1,
-0.8314002, -0.8554185, -1.08162, 0, 0, 0, 1, 1,
-0.8214135, 0.8334941, -1.489914, 0, 0, 0, 1, 1,
-0.8124757, -0.5386617, -3.667997, 0, 0, 0, 1, 1,
-0.8100116, -0.8484874, -1.859932, 0, 0, 0, 1, 1,
-0.8077756, -0.9388277, -3.098714, 0, 0, 0, 1, 1,
-0.8006369, 0.127883, -1.60179, 0, 0, 0, 1, 1,
-0.7928445, 0.7772523, -0.5574143, 0, 0, 0, 1, 1,
-0.7922302, -2.447522, -1.921613, 1, 1, 1, 1, 1,
-0.7801783, 1.018818, 0.8424809, 1, 1, 1, 1, 1,
-0.7778243, -0.1343461, -1.467383, 1, 1, 1, 1, 1,
-0.777766, 0.0607306, -2.254342, 1, 1, 1, 1, 1,
-0.7775281, 0.03515379, -1.634434, 1, 1, 1, 1, 1,
-0.7755079, -0.731466, -1.886547, 1, 1, 1, 1, 1,
-0.759121, -0.7546831, -4.603444, 1, 1, 1, 1, 1,
-0.7583283, 0.5984212, 0.8500835, 1, 1, 1, 1, 1,
-0.7579417, -0.1551328, -1.2124, 1, 1, 1, 1, 1,
-0.753799, 1.87355, 1.706171, 1, 1, 1, 1, 1,
-0.7440776, -0.8389603, -3.243862, 1, 1, 1, 1, 1,
-0.743718, 2.068322, -1.281673, 1, 1, 1, 1, 1,
-0.7418094, 1.54902, -0.3022054, 1, 1, 1, 1, 1,
-0.7397781, -0.4627545, -2.610293, 1, 1, 1, 1, 1,
-0.7366928, -0.6309204, -2.893008, 1, 1, 1, 1, 1,
-0.7363319, -0.4943542, -1.396683, 0, 0, 1, 1, 1,
-0.7340695, 0.02860476, -2.529004, 1, 0, 0, 1, 1,
-0.731356, -2.205245, -2.850173, 1, 0, 0, 1, 1,
-0.7302366, 0.3722825, -2.1773, 1, 0, 0, 1, 1,
-0.729933, -1.278938, -3.274077, 1, 0, 0, 1, 1,
-0.7297216, -1.065109, -3.565088, 1, 0, 0, 1, 1,
-0.7262827, -0.6320776, -2.437404, 0, 0, 0, 1, 1,
-0.722452, 0.1650991, -2.194611, 0, 0, 0, 1, 1,
-0.7140999, -0.736725, -0.6389756, 0, 0, 0, 1, 1,
-0.7121305, 1.229153, 0.9326524, 0, 0, 0, 1, 1,
-0.7114295, 0.1976641, -1.244819, 0, 0, 0, 1, 1,
-0.7077101, 0.8329925, -0.9125524, 0, 0, 0, 1, 1,
-0.7060256, -0.2527067, -1.790799, 0, 0, 0, 1, 1,
-0.7033256, -1.52659, -2.179705, 1, 1, 1, 1, 1,
-0.7030758, -0.2542199, -1.127896, 1, 1, 1, 1, 1,
-0.7018117, -0.3548046, -0.5039334, 1, 1, 1, 1, 1,
-0.6957265, -0.6638163, -2.597716, 1, 1, 1, 1, 1,
-0.6892241, -0.413651, -1.685009, 1, 1, 1, 1, 1,
-0.6812004, 0.6147638, -3.006878, 1, 1, 1, 1, 1,
-0.6781318, 1.623888, -0.9722201, 1, 1, 1, 1, 1,
-0.6729919, 1.078253, -1.005133, 1, 1, 1, 1, 1,
-0.67233, 0.7150813, -1.351153, 1, 1, 1, 1, 1,
-0.6678114, -0.06503195, -2.74392, 1, 1, 1, 1, 1,
-0.6667835, -1.01682, -1.482138, 1, 1, 1, 1, 1,
-0.6620162, 1.022144, -0.7122826, 1, 1, 1, 1, 1,
-0.6569922, 0.1848778, -0.8533627, 1, 1, 1, 1, 1,
-0.6567258, 0.8111905, -3.0425, 1, 1, 1, 1, 1,
-0.6545289, -0.1410625, -1.34318, 1, 1, 1, 1, 1,
-0.6503142, -0.07883599, -2.724408, 0, 0, 1, 1, 1,
-0.6490834, -0.9544476, -1.180112, 1, 0, 0, 1, 1,
-0.6468768, -0.6810045, -1.593627, 1, 0, 0, 1, 1,
-0.6462553, -0.7922216, -2.698019, 1, 0, 0, 1, 1,
-0.6449002, -0.8533335, -1.424338, 1, 0, 0, 1, 1,
-0.6405193, 0.7200141, -1.853966, 1, 0, 0, 1, 1,
-0.6392402, 0.5752318, -2.342513, 0, 0, 0, 1, 1,
-0.639104, -0.6995174, -3.295872, 0, 0, 0, 1, 1,
-0.6366686, -1.44738, -6.193848, 0, 0, 0, 1, 1,
-0.6315024, -0.6330872, -2.107774, 0, 0, 0, 1, 1,
-0.6311563, 1.222757, -1.477216, 0, 0, 0, 1, 1,
-0.6286501, -0.3982372, -2.745974, 0, 0, 0, 1, 1,
-0.6281983, 0.2094548, -1.872761, 0, 0, 0, 1, 1,
-0.6243799, -0.2112249, -1.711848, 1, 1, 1, 1, 1,
-0.6241766, -0.4503309, -2.797834, 1, 1, 1, 1, 1,
-0.6224417, 0.6081821, -0.6112273, 1, 1, 1, 1, 1,
-0.6203954, -0.6095061, -2.677373, 1, 1, 1, 1, 1,
-0.6067626, -0.5233727, -2.548293, 1, 1, 1, 1, 1,
-0.6045864, 0.4295339, -1.521072, 1, 1, 1, 1, 1,
-0.6039608, -0.1828092, -0.03455272, 1, 1, 1, 1, 1,
-0.5948601, -0.05188689, -1.718269, 1, 1, 1, 1, 1,
-0.5924703, -0.9369785, -2.615797, 1, 1, 1, 1, 1,
-0.5907163, 0.1692941, -0.07286316, 1, 1, 1, 1, 1,
-0.5905414, 1.006233, -0.02942858, 1, 1, 1, 1, 1,
-0.5893093, 0.2566128, 0.0251815, 1, 1, 1, 1, 1,
-0.5878497, -0.9842629, -3.144096, 1, 1, 1, 1, 1,
-0.5861999, -0.4466116, -2.576915, 1, 1, 1, 1, 1,
-0.5826315, 0.1969309, -0.6515212, 1, 1, 1, 1, 1,
-0.5822095, -0.2654543, -0.4706531, 0, 0, 1, 1, 1,
-0.5819014, 0.3465704, 0.4133868, 1, 0, 0, 1, 1,
-0.5806721, -1.208269, -1.560451, 1, 0, 0, 1, 1,
-0.5735667, -0.1406544, -1.270506, 1, 0, 0, 1, 1,
-0.572463, 0.6712403, -1.635349, 1, 0, 0, 1, 1,
-0.572381, -0.2284156, -1.325888, 1, 0, 0, 1, 1,
-0.5707766, 0.08214771, -1.021948, 0, 0, 0, 1, 1,
-0.5666456, 0.5079628, -0.1119543, 0, 0, 0, 1, 1,
-0.5636947, 1.326935, -0.8836061, 0, 0, 0, 1, 1,
-0.5613894, 1.647282, -2.585762, 0, 0, 0, 1, 1,
-0.5595784, -2.193241, -4.178633, 0, 0, 0, 1, 1,
-0.5584976, -0.05175159, -0.1240653, 0, 0, 0, 1, 1,
-0.5581546, 0.1973691, -1.008488, 0, 0, 0, 1, 1,
-0.5570378, -1.304274, -2.236701, 1, 1, 1, 1, 1,
-0.5511484, 0.4130366, -1.104423, 1, 1, 1, 1, 1,
-0.5466721, -0.4309482, -1.013188, 1, 1, 1, 1, 1,
-0.5465394, 0.1556449, -1.63231, 1, 1, 1, 1, 1,
-0.5456302, -2.052551, -0.7919167, 1, 1, 1, 1, 1,
-0.5438969, 2.020442, -1.41568, 1, 1, 1, 1, 1,
-0.5431758, -0.9745821, -4.627964, 1, 1, 1, 1, 1,
-0.5412989, -0.07973044, -0.9992516, 1, 1, 1, 1, 1,
-0.5390332, 1.406556, -0.07009149, 1, 1, 1, 1, 1,
-0.5384263, 0.992364, -1.184829, 1, 1, 1, 1, 1,
-0.5360581, -1.820411, -3.428011, 1, 1, 1, 1, 1,
-0.5358081, -1.079159, -2.077823, 1, 1, 1, 1, 1,
-0.534176, 0.2462446, -1.390529, 1, 1, 1, 1, 1,
-0.5226381, -0.4002877, -0.6861109, 1, 1, 1, 1, 1,
-0.5216349, -1.269545, -1.693238, 1, 1, 1, 1, 1,
-0.5214738, -0.9063863, -2.508847, 0, 0, 1, 1, 1,
-0.516313, 0.762022, -0.02943155, 1, 0, 0, 1, 1,
-0.5159066, -0.0006489561, -3.461219, 1, 0, 0, 1, 1,
-0.5137387, 0.006260443, -2.051179, 1, 0, 0, 1, 1,
-0.511353, -0.2790757, -2.320387, 1, 0, 0, 1, 1,
-0.5094458, 1.149982, -2.327722, 1, 0, 0, 1, 1,
-0.5051965, -1.904079, -3.438273, 0, 0, 0, 1, 1,
-0.503675, -0.7745182, -4.701746, 0, 0, 0, 1, 1,
-0.5034046, -0.4510376, -2.432265, 0, 0, 0, 1, 1,
-0.4968188, 1.52693, 0.4530348, 0, 0, 0, 1, 1,
-0.4950739, -0.7261716, -2.74648, 0, 0, 0, 1, 1,
-0.4879752, -1.773275, -1.402159, 0, 0, 0, 1, 1,
-0.4843431, 0.2241843, -0.8355042, 0, 0, 0, 1, 1,
-0.4841231, -1.190314, -1.17344, 1, 1, 1, 1, 1,
-0.4796501, 0.08570078, -2.103131, 1, 1, 1, 1, 1,
-0.4794984, 0.4389594, -0.909476, 1, 1, 1, 1, 1,
-0.4794641, 1.657036, -0.4363208, 1, 1, 1, 1, 1,
-0.4794323, 0.5214642, -1.552542, 1, 1, 1, 1, 1,
-0.4788649, -0.9553841, -3.431715, 1, 1, 1, 1, 1,
-0.4715366, 1.031602, -1.030652, 1, 1, 1, 1, 1,
-0.470369, 1.244819, 0.1901942, 1, 1, 1, 1, 1,
-0.4637327, 0.4072577, -1.684568, 1, 1, 1, 1, 1,
-0.4628233, 0.7563788, 0.3272499, 1, 1, 1, 1, 1,
-0.4610896, -1.483939, -1.988248, 1, 1, 1, 1, 1,
-0.4600098, -1.428582, -2.771774, 1, 1, 1, 1, 1,
-0.4569572, -0.5378354, -2.945174, 1, 1, 1, 1, 1,
-0.4540416, -0.764304, -3.238486, 1, 1, 1, 1, 1,
-0.4493065, 2.53465, 0.4207484, 1, 1, 1, 1, 1,
-0.4492523, -0.8232354, -1.700479, 0, 0, 1, 1, 1,
-0.4450418, 0.6061828, 0.2573103, 1, 0, 0, 1, 1,
-0.4414034, -0.2801965, -3.004445, 1, 0, 0, 1, 1,
-0.4382186, 0.6551467, -0.1023508, 1, 0, 0, 1, 1,
-0.4332793, 0.8201759, -0.4610729, 1, 0, 0, 1, 1,
-0.425916, 1.765034, -0.8144739, 1, 0, 0, 1, 1,
-0.4247732, 0.6788489, -0.2430233, 0, 0, 0, 1, 1,
-0.3997569, -0.1558726, -1.739496, 0, 0, 0, 1, 1,
-0.3996096, 0.9470327, -1.639329, 0, 0, 0, 1, 1,
-0.390438, 1.058644, -0.4935997, 0, 0, 0, 1, 1,
-0.3844555, -0.3293645, -4.049045, 0, 0, 0, 1, 1,
-0.3809002, 0.07956622, -0.07708883, 0, 0, 0, 1, 1,
-0.3803864, -0.746429, -2.053371, 0, 0, 0, 1, 1,
-0.3803523, 0.1231451, 0.2254153, 1, 1, 1, 1, 1,
-0.3755328, 1.504834, 2.150287, 1, 1, 1, 1, 1,
-0.362971, -0.2196568, -2.617741, 1, 1, 1, 1, 1,
-0.3593245, 1.91947, 1.521917, 1, 1, 1, 1, 1,
-0.3561845, 0.6623126, -2.208203, 1, 1, 1, 1, 1,
-0.3462997, -0.1460722, -2.010822, 1, 1, 1, 1, 1,
-0.3402277, 0.799086, 0.122976, 1, 1, 1, 1, 1,
-0.3393587, -0.5675508, -1.810519, 1, 1, 1, 1, 1,
-0.3377835, 0.705704, -1.20308, 1, 1, 1, 1, 1,
-0.3370568, -0.3695734, -2.352717, 1, 1, 1, 1, 1,
-0.3282464, -0.1008387, -2.351226, 1, 1, 1, 1, 1,
-0.3223365, -0.3358519, -1.469432, 1, 1, 1, 1, 1,
-0.3207624, -1.711894, -2.887354, 1, 1, 1, 1, 1,
-0.3154086, 0.6662773, -1.711117, 1, 1, 1, 1, 1,
-0.3146024, -0.606217, -2.37262, 1, 1, 1, 1, 1,
-0.313441, -0.8094609, -2.334479, 0, 0, 1, 1, 1,
-0.3104316, -0.5871575, -4.330493, 1, 0, 0, 1, 1,
-0.3096269, -0.5450074, -2.313753, 1, 0, 0, 1, 1,
-0.3068342, 0.2043091, -1.52238, 1, 0, 0, 1, 1,
-0.3031619, -0.4457058, -1.889306, 1, 0, 0, 1, 1,
-0.3029383, 0.9094597, 0.226583, 1, 0, 0, 1, 1,
-0.3001326, 1.96581, -0.02334898, 0, 0, 0, 1, 1,
-0.2972326, 0.4166617, 0.09024884, 0, 0, 0, 1, 1,
-0.2968116, -0.2840145, -3.909055, 0, 0, 0, 1, 1,
-0.2957901, 2.506141, -0.5466184, 0, 0, 0, 1, 1,
-0.2916209, 0.03378641, -1.221655, 0, 0, 0, 1, 1,
-0.2865398, 1.817844, 0.9781581, 0, 0, 0, 1, 1,
-0.2807446, -0.6379789, -2.470601, 0, 0, 0, 1, 1,
-0.2802477, -0.9564963, -2.708433, 1, 1, 1, 1, 1,
-0.2763623, 0.9372194, 0.05996636, 1, 1, 1, 1, 1,
-0.2761129, -1.428267, -4.853147, 1, 1, 1, 1, 1,
-0.2750365, 0.209414, -0.7058538, 1, 1, 1, 1, 1,
-0.273511, -0.04263971, -2.054875, 1, 1, 1, 1, 1,
-0.271812, -0.1009459, -0.1605769, 1, 1, 1, 1, 1,
-0.2704403, 0.8470012, -0.3882235, 1, 1, 1, 1, 1,
-0.2701719, 0.8501242, 0.1146798, 1, 1, 1, 1, 1,
-0.264034, 0.709377, -0.6061125, 1, 1, 1, 1, 1,
-0.2610018, 0.2293069, -2.425243, 1, 1, 1, 1, 1,
-0.260448, -0.4381863, -0.9061961, 1, 1, 1, 1, 1,
-0.252504, 0.300437, -0.695475, 1, 1, 1, 1, 1,
-0.2516584, 0.262121, -0.6391743, 1, 1, 1, 1, 1,
-0.2441333, 1.556449, 0.6276117, 1, 1, 1, 1, 1,
-0.2387047, 0.7214333, -1.023207, 1, 1, 1, 1, 1,
-0.2381831, -2.075634, -2.238198, 0, 0, 1, 1, 1,
-0.2364241, -0.9762273, -3.369986, 1, 0, 0, 1, 1,
-0.2323015, -0.05861636, -2.93905, 1, 0, 0, 1, 1,
-0.2276069, -0.6742487, -3.143793, 1, 0, 0, 1, 1,
-0.2243785, -0.7321507, -3.641962, 1, 0, 0, 1, 1,
-0.2235892, -1.003778, -1.559003, 1, 0, 0, 1, 1,
-0.2229086, -0.526466, -4.510702, 0, 0, 0, 1, 1,
-0.2222863, -1.249239, -2.026471, 0, 0, 0, 1, 1,
-0.2202352, -0.07433102, -2.153715, 0, 0, 0, 1, 1,
-0.2140185, -0.6847808, -2.986783, 0, 0, 0, 1, 1,
-0.2133438, -0.6146598, -4.096584, 0, 0, 0, 1, 1,
-0.2110141, -0.2976761, -1.725407, 0, 0, 0, 1, 1,
-0.2107643, -1.107073, -2.419065, 0, 0, 0, 1, 1,
-0.2072317, 0.6245819, 0.4109978, 1, 1, 1, 1, 1,
-0.2032536, 0.7171346, -0.004487091, 1, 1, 1, 1, 1,
-0.2031579, -0.6858581, -3.520612, 1, 1, 1, 1, 1,
-0.2016179, 1.296409, -0.08519818, 1, 1, 1, 1, 1,
-0.2014356, 1.024247, -0.6245114, 1, 1, 1, 1, 1,
-0.1987485, 0.117411, 0.5586597, 1, 1, 1, 1, 1,
-0.196413, 0.4808233, -1.691468, 1, 1, 1, 1, 1,
-0.1959361, -0.09395437, -2.930004, 1, 1, 1, 1, 1,
-0.1952107, 0.3259773, -1.152552, 1, 1, 1, 1, 1,
-0.1921832, 0.9384719, 0.395054, 1, 1, 1, 1, 1,
-0.1850536, -0.5622214, -2.35949, 1, 1, 1, 1, 1,
-0.1835137, 0.4432224, 0.4962479, 1, 1, 1, 1, 1,
-0.1828308, 0.01829081, -1.053428, 1, 1, 1, 1, 1,
-0.1777863, -0.1108456, -2.13723, 1, 1, 1, 1, 1,
-0.1769209, -0.54353, -3.399396, 1, 1, 1, 1, 1,
-0.1665964, -1.326638, -3.572538, 0, 0, 1, 1, 1,
-0.1658752, -0.2534108, -2.649029, 1, 0, 0, 1, 1,
-0.1648402, -1.04216, -3.513375, 1, 0, 0, 1, 1,
-0.1627227, -0.5557653, -3.471808, 1, 0, 0, 1, 1,
-0.160924, -0.7910267, -4.035509, 1, 0, 0, 1, 1,
-0.1580211, -0.1044933, -1.085819, 1, 0, 0, 1, 1,
-0.1565461, 1.502655, 2.691869, 0, 0, 0, 1, 1,
-0.1475734, -0.4766354, -5.188341, 0, 0, 0, 1, 1,
-0.1471298, 0.3377848, 0.6165535, 0, 0, 0, 1, 1,
-0.1451886, -1.871822, -2.175818, 0, 0, 0, 1, 1,
-0.1389, -0.81411, -4.302188, 0, 0, 0, 1, 1,
-0.1383481, 0.3933328, -1.249877, 0, 0, 0, 1, 1,
-0.1371554, -1.240892, -3.749, 0, 0, 0, 1, 1,
-0.133814, -0.5642302, -2.723938, 1, 1, 1, 1, 1,
-0.1332218, 0.8739209, -0.452875, 1, 1, 1, 1, 1,
-0.1331351, -3.135464, -3.804108, 1, 1, 1, 1, 1,
-0.133119, 1.706861, -0.08877747, 1, 1, 1, 1, 1,
-0.1320643, -0.1633979, -2.162847, 1, 1, 1, 1, 1,
-0.1303948, 0.7296916, -1.233541, 1, 1, 1, 1, 1,
-0.1297662, -1.263115, -4.039186, 1, 1, 1, 1, 1,
-0.1288517, -0.02650345, -0.8847428, 1, 1, 1, 1, 1,
-0.123276, 0.7563056, -2.539518, 1, 1, 1, 1, 1,
-0.1222503, -0.1632159, -2.031604, 1, 1, 1, 1, 1,
-0.1210604, -0.5423091, -2.436535, 1, 1, 1, 1, 1,
-0.1188403, -0.5477364, -2.563257, 1, 1, 1, 1, 1,
-0.1165922, 0.9756181, -0.930909, 1, 1, 1, 1, 1,
-0.1161083, 0.3458889, -0.4353687, 1, 1, 1, 1, 1,
-0.1148874, 0.6964983, 1.649764, 1, 1, 1, 1, 1,
-0.1108628, 0.468715, -1.174016, 0, 0, 1, 1, 1,
-0.1082974, 1.21983, 0.6479667, 1, 0, 0, 1, 1,
-0.1082549, 1.056126, -1.027081, 1, 0, 0, 1, 1,
-0.1071264, -1.640166, -3.654617, 1, 0, 0, 1, 1,
-0.1058814, 0.9331271, 1.029862, 1, 0, 0, 1, 1,
-0.1048013, -0.2090915, -1.993289, 1, 0, 0, 1, 1,
-0.1030998, -0.3584734, -1.995135, 0, 0, 0, 1, 1,
-0.09968811, -1.241304, -3.227695, 0, 0, 0, 1, 1,
-0.09651666, -0.3818186, -3.555529, 0, 0, 0, 1, 1,
-0.09473948, -2.359036, -1.264099, 0, 0, 0, 1, 1,
-0.0934798, -0.3860728, -2.877685, 0, 0, 0, 1, 1,
-0.09050021, 0.1122671, -0.0521534, 0, 0, 0, 1, 1,
-0.08893393, 0.06308927, 0.3127273, 0, 0, 0, 1, 1,
-0.08693834, -0.0037067, -2.050218, 1, 1, 1, 1, 1,
-0.08626499, -0.6587007, -2.014365, 1, 1, 1, 1, 1,
-0.08612301, -0.539462, -4.995315, 1, 1, 1, 1, 1,
-0.08470552, 0.3594583, -0.3569503, 1, 1, 1, 1, 1,
-0.08437034, -1.570395, -2.606884, 1, 1, 1, 1, 1,
-0.0832764, -1.270216, -4.517859, 1, 1, 1, 1, 1,
-0.08178958, -0.1869738, -1.046556, 1, 1, 1, 1, 1,
-0.08120426, -2.17416, -3.685597, 1, 1, 1, 1, 1,
-0.07666881, -1.644901, -1.585572, 1, 1, 1, 1, 1,
-0.07575575, -1.541474, -4.097578, 1, 1, 1, 1, 1,
-0.0753965, -1.226137, -1.585423, 1, 1, 1, 1, 1,
-0.0752485, -0.3429525, -1.898232, 1, 1, 1, 1, 1,
-0.07339148, 1.644409, 0.7048688, 1, 1, 1, 1, 1,
-0.07155854, 1.543701, -0.4419288, 1, 1, 1, 1, 1,
-0.06873601, 1.250571, 1.56566, 1, 1, 1, 1, 1,
-0.06774125, -0.8892408, -4.167976, 0, 0, 1, 1, 1,
-0.06769149, 0.3791317, -0.08757726, 1, 0, 0, 1, 1,
-0.06437638, -0.1575461, -3.529979, 1, 0, 0, 1, 1,
-0.05779641, 0.783155, 0.1869028, 1, 0, 0, 1, 1,
-0.05362124, 0.2889121, -1.099008, 1, 0, 0, 1, 1,
-0.04908484, 0.6669934, -0.2113148, 1, 0, 0, 1, 1,
-0.04296705, -0.3812273, -2.9833, 0, 0, 0, 1, 1,
-0.04077335, -0.01136319, -1.429326, 0, 0, 0, 1, 1,
-0.03765493, -0.333427, -3.232162, 0, 0, 0, 1, 1,
-0.03413945, 0.5787448, 0.4879327, 0, 0, 0, 1, 1,
-0.03248582, -1.097017, -3.939167, 0, 0, 0, 1, 1,
-0.02994282, 1.274302, -0.460038, 0, 0, 0, 1, 1,
-0.02838613, -3.187343, -2.702814, 0, 0, 0, 1, 1,
-0.02291491, 0.1720617, -0.6721857, 1, 1, 1, 1, 1,
-0.01575871, -1.229847, -2.248911, 1, 1, 1, 1, 1,
-0.01489052, -0.6768404, -1.960517, 1, 1, 1, 1, 1,
-0.01428244, -0.9958021, -3.110427, 1, 1, 1, 1, 1,
-0.01411843, -0.3321673, -4.511506, 1, 1, 1, 1, 1,
-0.01402441, -0.9075102, -1.568734, 1, 1, 1, 1, 1,
-0.01191263, -2.155159, -2.121322, 1, 1, 1, 1, 1,
-0.009799927, 0.1761236, -0.770756, 1, 1, 1, 1, 1,
-0.004230483, -0.1830764, -2.077748, 1, 1, 1, 1, 1,
-0.001322862, -0.69732, -5.036867, 1, 1, 1, 1, 1,
-0.001175931, -0.499347, -2.97837, 1, 1, 1, 1, 1,
0.002060262, 0.985659, -1.020721, 1, 1, 1, 1, 1,
0.005095756, 0.4859852, 0.4231686, 1, 1, 1, 1, 1,
0.005413906, -0.3012205, 3.491855, 1, 1, 1, 1, 1,
0.007720864, 0.6465352, -0.2192283, 1, 1, 1, 1, 1,
0.00860683, -0.21443, 2.587676, 0, 0, 1, 1, 1,
0.01118335, -1.183607, 3.352122, 1, 0, 0, 1, 1,
0.02054529, -1.696462, 3.54465, 1, 0, 0, 1, 1,
0.02113952, -0.9018241, 3.612494, 1, 0, 0, 1, 1,
0.02169521, -1.483474, 3.953785, 1, 0, 0, 1, 1,
0.02388103, -0.1167236, 3.761616, 1, 0, 0, 1, 1,
0.02845981, -0.2572184, 3.924698, 0, 0, 0, 1, 1,
0.02875479, 0.5992197, -0.9269806, 0, 0, 0, 1, 1,
0.02931661, 0.4411046, 0.8890418, 0, 0, 0, 1, 1,
0.02944769, -1.081805, 3.195257, 0, 0, 0, 1, 1,
0.03001491, -0.5688856, 2.331425, 0, 0, 0, 1, 1,
0.03366014, -0.2020382, 2.929489, 0, 0, 0, 1, 1,
0.0355132, 0.4379219, -0.5228666, 0, 0, 0, 1, 1,
0.03876252, -0.3831918, 3.454158, 1, 1, 1, 1, 1,
0.03906988, -0.3517921, 2.579034, 1, 1, 1, 1, 1,
0.03918185, 0.07527497, 1.202821, 1, 1, 1, 1, 1,
0.03960133, -1.020292, 3.032278, 1, 1, 1, 1, 1,
0.04348378, 2.101414, 0.2934998, 1, 1, 1, 1, 1,
0.04364369, -0.25027, 2.369842, 1, 1, 1, 1, 1,
0.04743923, 1.120637, 1.716142, 1, 1, 1, 1, 1,
0.04886669, -0.7434055, 3.512185, 1, 1, 1, 1, 1,
0.04926232, -1.828705, 4.629936, 1, 1, 1, 1, 1,
0.05892263, 0.2648482, -1.06583, 1, 1, 1, 1, 1,
0.06166831, 0.1712348, 0.1630155, 1, 1, 1, 1, 1,
0.06288793, -1.361135, 2.482367, 1, 1, 1, 1, 1,
0.06574621, -0.5313305, 4.137246, 1, 1, 1, 1, 1,
0.0659648, -0.2840398, 2.43338, 1, 1, 1, 1, 1,
0.06795888, 0.7827895, -1.444138, 1, 1, 1, 1, 1,
0.0717699, 0.1300573, -1.472654, 0, 0, 1, 1, 1,
0.07443464, -1.340188, 2.915765, 1, 0, 0, 1, 1,
0.07629237, 0.7144647, 0.3210535, 1, 0, 0, 1, 1,
0.07846436, 1.715815, 0.4525585, 1, 0, 0, 1, 1,
0.08079438, 0.7552534, 0.8954834, 1, 0, 0, 1, 1,
0.08549603, -1.174658, 3.625984, 1, 0, 0, 1, 1,
0.08632414, 0.3634916, 0.1624006, 0, 0, 0, 1, 1,
0.08679086, -0.9870135, 3.22377, 0, 0, 0, 1, 1,
0.09038299, -0.7784587, 2.117289, 0, 0, 0, 1, 1,
0.09093032, 0.3551635, 0.8649345, 0, 0, 0, 1, 1,
0.09312866, 1.013711, 0.5625152, 0, 0, 0, 1, 1,
0.09323984, 1.414821, 0.6815718, 0, 0, 0, 1, 1,
0.09490938, 0.01739351, 0.6125771, 0, 0, 0, 1, 1,
0.09738253, -0.1670232, 1.448911, 1, 1, 1, 1, 1,
0.09969571, -0.1745684, 3.214835, 1, 1, 1, 1, 1,
0.1009983, -0.798432, 3.705216, 1, 1, 1, 1, 1,
0.1035388, -0.6947492, 2.592122, 1, 1, 1, 1, 1,
0.1085261, -0.8309937, 2.684, 1, 1, 1, 1, 1,
0.1088006, 0.2259209, -0.2702413, 1, 1, 1, 1, 1,
0.1093594, -0.5715525, 4.201762, 1, 1, 1, 1, 1,
0.1108429, 0.1760541, -0.8277912, 1, 1, 1, 1, 1,
0.1150872, -0.8340858, 2.614747, 1, 1, 1, 1, 1,
0.1163821, -0.7627205, 2.168839, 1, 1, 1, 1, 1,
0.1190678, 0.3304962, 0.3051969, 1, 1, 1, 1, 1,
0.1193145, 0.4134789, -0.6117742, 1, 1, 1, 1, 1,
0.1215931, 0.5426938, 1.381376, 1, 1, 1, 1, 1,
0.1259956, -0.6186435, 3.694369, 1, 1, 1, 1, 1,
0.128206, 2.405293, -0.1468318, 1, 1, 1, 1, 1,
0.1288151, 1.087235, 0.0850711, 0, 0, 1, 1, 1,
0.1309361, 0.3975135, -1.039757, 1, 0, 0, 1, 1,
0.131779, 0.07731215, 1.258873, 1, 0, 0, 1, 1,
0.13739, 0.9155241, 0.3331628, 1, 0, 0, 1, 1,
0.1418438, 0.3167173, 0.9621287, 1, 0, 0, 1, 1,
0.1425385, 0.4327121, -1.374257, 1, 0, 0, 1, 1,
0.1425406, 1.255039, 2.033171, 0, 0, 0, 1, 1,
0.1477541, 0.2492965, -0.5256748, 0, 0, 0, 1, 1,
0.1523416, 0.2722836, 0.943412, 0, 0, 0, 1, 1,
0.1657939, -0.2834171, 2.261662, 0, 0, 0, 1, 1,
0.1684161, -0.3058903, 2.989032, 0, 0, 0, 1, 1,
0.1712469, 0.891651, 0.3641028, 0, 0, 0, 1, 1,
0.1754116, 0.4099047, 1.708107, 0, 0, 0, 1, 1,
0.1802912, -0.2379955, 3.487078, 1, 1, 1, 1, 1,
0.1816365, -1.269904, 3.495439, 1, 1, 1, 1, 1,
0.1816374, -0.5347438, 4.684657, 1, 1, 1, 1, 1,
0.1841814, 1.467622, -0.6307738, 1, 1, 1, 1, 1,
0.1849285, -0.2941944, 2.661085, 1, 1, 1, 1, 1,
0.1881295, -0.2433632, 2.652466, 1, 1, 1, 1, 1,
0.1885221, -2.269377, 3.164873, 1, 1, 1, 1, 1,
0.1944024, -0.7704822, 3.940477, 1, 1, 1, 1, 1,
0.2049311, 0.3153984, -0.583234, 1, 1, 1, 1, 1,
0.2109053, 1.432971, 1.928614, 1, 1, 1, 1, 1,
0.2167492, -0.5567991, 3.565798, 1, 1, 1, 1, 1,
0.2216469, -2.121634, 1.611406, 1, 1, 1, 1, 1,
0.2257681, -0.1276994, 2.194915, 1, 1, 1, 1, 1,
0.2295795, -0.339709, 2.688152, 1, 1, 1, 1, 1,
0.2303069, -0.7577882, 2.753687, 1, 1, 1, 1, 1,
0.234391, -0.4423413, 1.782372, 0, 0, 1, 1, 1,
0.2352459, -0.1491413, 2.837533, 1, 0, 0, 1, 1,
0.2362353, -1.085854, 2.679839, 1, 0, 0, 1, 1,
0.2378652, -1.112426, 2.735316, 1, 0, 0, 1, 1,
0.2392768, -0.5163029, 3.427816, 1, 0, 0, 1, 1,
0.239423, 1.032951, -1.159945, 1, 0, 0, 1, 1,
0.2440762, -0.2662272, 3.601075, 0, 0, 0, 1, 1,
0.2514834, 0.04740022, 0.9571322, 0, 0, 0, 1, 1,
0.2516716, 0.5394996, 0.5155677, 0, 0, 0, 1, 1,
0.2529064, -0.290185, 3.722016, 0, 0, 0, 1, 1,
0.2560888, 0.9217887, -0.1569928, 0, 0, 0, 1, 1,
0.2582431, -0.317417, 2.302922, 0, 0, 0, 1, 1,
0.2646783, -0.9326253, 1.523335, 0, 0, 0, 1, 1,
0.2686636, -0.9766206, 2.454134, 1, 1, 1, 1, 1,
0.270742, -1.376717, 2.749501, 1, 1, 1, 1, 1,
0.2749822, 0.3592916, 0.2250549, 1, 1, 1, 1, 1,
0.2751336, -2.373197, 5.140296, 1, 1, 1, 1, 1,
0.2769069, -0.5681932, 3.243385, 1, 1, 1, 1, 1,
0.2782141, 0.09272157, 1.838783, 1, 1, 1, 1, 1,
0.2788536, 0.6001275, -0.4082457, 1, 1, 1, 1, 1,
0.2809216, -0.8295797, 1.51046, 1, 1, 1, 1, 1,
0.3046973, 1.307265, 1.188294, 1, 1, 1, 1, 1,
0.3050994, -0.019688, 3.306319, 1, 1, 1, 1, 1,
0.3080037, 0.2659468, 0.4760121, 1, 1, 1, 1, 1,
0.3115858, 0.9300968, 0.1103688, 1, 1, 1, 1, 1,
0.3262596, -0.04780899, 2.497324, 1, 1, 1, 1, 1,
0.3274251, 0.5348972, 0.3225648, 1, 1, 1, 1, 1,
0.3328994, 3.315216, -0.04708412, 1, 1, 1, 1, 1,
0.3329602, -1.516694, 1.734959, 0, 0, 1, 1, 1,
0.3392895, 0.8167174, 0.2596584, 1, 0, 0, 1, 1,
0.3434194, 1.101961, -1.567111, 1, 0, 0, 1, 1,
0.3440775, -1.691308, 2.952816, 1, 0, 0, 1, 1,
0.3526966, -2.026582, 3.323041, 1, 0, 0, 1, 1,
0.3528681, 1.574376, -1.022762, 1, 0, 0, 1, 1,
0.352899, -0.5643393, 1.811789, 0, 0, 0, 1, 1,
0.3546498, -1.136301, 3.215528, 0, 0, 0, 1, 1,
0.3556964, -0.6281894, 2.724313, 0, 0, 0, 1, 1,
0.3593108, -0.2998273, 1.284717, 0, 0, 0, 1, 1,
0.3604356, 2.407119, 1.484557, 0, 0, 0, 1, 1,
0.3605018, 0.7010829, -0.4720747, 0, 0, 0, 1, 1,
0.3614398, 1.147884, 0.8116847, 0, 0, 0, 1, 1,
0.3618633, -0.1033363, 2.951015, 1, 1, 1, 1, 1,
0.3669002, -1.545591, 3.389769, 1, 1, 1, 1, 1,
0.3680221, 0.3767996, -0.1992858, 1, 1, 1, 1, 1,
0.3690139, 0.5886247, 1.195327, 1, 1, 1, 1, 1,
0.3699064, 0.7205391, 2.029724, 1, 1, 1, 1, 1,
0.3725361, -0.4832292, 2.772984, 1, 1, 1, 1, 1,
0.3743347, -0.2829064, 2.210207, 1, 1, 1, 1, 1,
0.3754926, -1.335686, 2.521202, 1, 1, 1, 1, 1,
0.3780442, 0.2846779, -0.3678713, 1, 1, 1, 1, 1,
0.3801865, -0.004474347, 1.061311, 1, 1, 1, 1, 1,
0.3888617, -1.491284, 3.206144, 1, 1, 1, 1, 1,
0.3918917, -0.7368792, 3.563394, 1, 1, 1, 1, 1,
0.4001769, -2.191702, 3.463342, 1, 1, 1, 1, 1,
0.4018937, -1.191661, 4.592694, 1, 1, 1, 1, 1,
0.4025614, 0.1656706, 3.345902, 1, 1, 1, 1, 1,
0.4046868, 0.2345076, 3.412589, 0, 0, 1, 1, 1,
0.4066035, 1.457008, -0.5166496, 1, 0, 0, 1, 1,
0.4073902, -1.002417, 3.496105, 1, 0, 0, 1, 1,
0.4078939, -0.1784033, 2.479757, 1, 0, 0, 1, 1,
0.4109194, -0.1738361, 1.655763, 1, 0, 0, 1, 1,
0.4129735, 1.626532, 2.066353, 1, 0, 0, 1, 1,
0.4173711, -0.2644546, 2.683048, 0, 0, 0, 1, 1,
0.41958, -0.6828697, 3.672568, 0, 0, 0, 1, 1,
0.4205962, -0.4220539, 0.6595253, 0, 0, 0, 1, 1,
0.422449, 1.161922, 0.6454133, 0, 0, 0, 1, 1,
0.4290993, -0.01411647, 2.752327, 0, 0, 0, 1, 1,
0.4314708, 1.62098, 0.5735974, 0, 0, 0, 1, 1,
0.4332876, -1.152787, 1.709004, 0, 0, 0, 1, 1,
0.4357646, 0.3931253, 0.1328922, 1, 1, 1, 1, 1,
0.4359947, 0.2207401, 1.9988, 1, 1, 1, 1, 1,
0.4365883, -0.3117703, 2.535703, 1, 1, 1, 1, 1,
0.4398659, 1.105289, -0.8346979, 1, 1, 1, 1, 1,
0.444107, 1.775557, -0.6651662, 1, 1, 1, 1, 1,
0.444307, -0.4199708, 3.484872, 1, 1, 1, 1, 1,
0.4507288, 0.4092801, 0.008038496, 1, 1, 1, 1, 1,
0.4541856, 0.6483617, 0.5304283, 1, 1, 1, 1, 1,
0.4604559, 1.24539, -0.7229377, 1, 1, 1, 1, 1,
0.4640418, 0.7128169, -0.9180961, 1, 1, 1, 1, 1,
0.4665606, 0.4242269, 1.730222, 1, 1, 1, 1, 1,
0.4695141, -1.037686, 3.617571, 1, 1, 1, 1, 1,
0.472896, 0.8764836, 1.072619, 1, 1, 1, 1, 1,
0.4742876, -0.1644874, 2.822391, 1, 1, 1, 1, 1,
0.4763097, -0.6162441, 1.179267, 1, 1, 1, 1, 1,
0.4763962, -0.2196876, 3.201233, 0, 0, 1, 1, 1,
0.4795305, 0.7893388, 1.636388, 1, 0, 0, 1, 1,
0.4805214, 0.14784, 1.026883, 1, 0, 0, 1, 1,
0.4831596, 0.6444072, 0.5555354, 1, 0, 0, 1, 1,
0.491062, 0.1726968, 0.107794, 1, 0, 0, 1, 1,
0.510925, -0.8226679, 4.056997, 1, 0, 0, 1, 1,
0.5112142, -1.7093, 1.470991, 0, 0, 0, 1, 1,
0.5168822, -0.5298588, 1.802143, 0, 0, 0, 1, 1,
0.5169548, -0.9465392, 2.141415, 0, 0, 0, 1, 1,
0.5244644, -0.752085, 0.5755237, 0, 0, 0, 1, 1,
0.5282886, 0.2877681, 0.8261618, 0, 0, 0, 1, 1,
0.5308216, 0.07259656, 2.370819, 0, 0, 0, 1, 1,
0.5320495, 0.6479725, 2.631315, 0, 0, 0, 1, 1,
0.5325415, 1.519766, -0.7756858, 1, 1, 1, 1, 1,
0.5365394, -1.63038, 2.597249, 1, 1, 1, 1, 1,
0.541882, -1.487884, 3.078478, 1, 1, 1, 1, 1,
0.5467311, -0.142185, 1.47716, 1, 1, 1, 1, 1,
0.5556864, 0.955354, -0.1681201, 1, 1, 1, 1, 1,
0.5582104, 1.218801, 1.374919, 1, 1, 1, 1, 1,
0.5586467, 0.2147695, -0.1822306, 1, 1, 1, 1, 1,
0.5615311, 0.5848126, -0.1712726, 1, 1, 1, 1, 1,
0.5657065, -1.1077, 2.817189, 1, 1, 1, 1, 1,
0.5667217, 0.9330423, 1.799778, 1, 1, 1, 1, 1,
0.568374, 0.1389949, 2.518178, 1, 1, 1, 1, 1,
0.5702294, 0.545277, -0.823062, 1, 1, 1, 1, 1,
0.5786384, 1.415017, 2.009534, 1, 1, 1, 1, 1,
0.5790995, -1.859515, 2.430988, 1, 1, 1, 1, 1,
0.5802951, 1.102053, 1.096947, 1, 1, 1, 1, 1,
0.5814626, 0.6561812, 1.512602, 0, 0, 1, 1, 1,
0.5827435, -0.7075588, 3.763491, 1, 0, 0, 1, 1,
0.5832339, -0.355713, 2.561053, 1, 0, 0, 1, 1,
0.5839863, 0.6478294, 3.053659, 1, 0, 0, 1, 1,
0.5851758, 1.223686, -0.3210208, 1, 0, 0, 1, 1,
0.5872442, -1.411012, 2.168518, 1, 0, 0, 1, 1,
0.5937374, -1.598415, 2.713754, 0, 0, 0, 1, 1,
0.5945752, 2.034785, 0.06191284, 0, 0, 0, 1, 1,
0.5995288, -0.7689161, 2.720267, 0, 0, 0, 1, 1,
0.6058835, -0.4881688, 2.560804, 0, 0, 0, 1, 1,
0.6137045, -0.01136139, 0.6900538, 0, 0, 0, 1, 1,
0.6163049, 1.485595, -1.264022, 0, 0, 0, 1, 1,
0.6195297, -0.9054968, 2.968328, 0, 0, 0, 1, 1,
0.6196195, -0.4361317, 1.933576, 1, 1, 1, 1, 1,
0.622546, -1.447065, 0.1320989, 1, 1, 1, 1, 1,
0.6231907, -0.009007501, 0.7798665, 1, 1, 1, 1, 1,
0.6303586, -0.5625763, 2.577711, 1, 1, 1, 1, 1,
0.6316572, -0.604997, 1.157809, 1, 1, 1, 1, 1,
0.6365952, 0.3206825, 1.148328, 1, 1, 1, 1, 1,
0.6372856, -0.1356267, 0.7717229, 1, 1, 1, 1, 1,
0.6407921, -1.320838, 2.508292, 1, 1, 1, 1, 1,
0.6420753, -1.836702, 1.473301, 1, 1, 1, 1, 1,
0.6448249, -0.2417041, 2.193953, 1, 1, 1, 1, 1,
0.6473793, 1.603353, -0.4433997, 1, 1, 1, 1, 1,
0.649447, 0.3576236, 0.5006096, 1, 1, 1, 1, 1,
0.6543148, -0.8409868, 3.578252, 1, 1, 1, 1, 1,
0.6583002, -0.54947, 3.219266, 1, 1, 1, 1, 1,
0.6664838, 0.836225, 0.01946214, 1, 1, 1, 1, 1,
0.6682322, -1.158036, 2.291464, 0, 0, 1, 1, 1,
0.6737447, -1.785666, 1.728213, 1, 0, 0, 1, 1,
0.6760575, 0.2027377, -0.09511195, 1, 0, 0, 1, 1,
0.6783277, -0.6208885, 1.484866, 1, 0, 0, 1, 1,
0.6805956, -0.313235, 1.349412, 1, 0, 0, 1, 1,
0.683898, -2.240734, 2.355762, 1, 0, 0, 1, 1,
0.6852382, 0.6351812, 0.1843306, 0, 0, 0, 1, 1,
0.6867955, -1.765944, 1.170356, 0, 0, 0, 1, 1,
0.6870765, -0.9075975, 2.826885, 0, 0, 0, 1, 1,
0.6946343, 0.1754454, -0.4954747, 0, 0, 0, 1, 1,
0.6993464, 2.109976, -0.9440047, 0, 0, 0, 1, 1,
0.7014249, -1.147814, 4.3698, 0, 0, 0, 1, 1,
0.7047417, -1.088621, 3.872663, 0, 0, 0, 1, 1,
0.7112621, -0.6722244, 3.210099, 1, 1, 1, 1, 1,
0.712481, -0.2596316, 3.962344, 1, 1, 1, 1, 1,
0.7175033, 0.7358144, 0.4083648, 1, 1, 1, 1, 1,
0.7313353, -1.494179, 2.890381, 1, 1, 1, 1, 1,
0.7378817, -0.5391114, 3.888256, 1, 1, 1, 1, 1,
0.7407128, -0.3821648, 2.476033, 1, 1, 1, 1, 1,
0.7415381, -2.52297, 3.172707, 1, 1, 1, 1, 1,
0.7460446, 0.7154901, 0.2237047, 1, 1, 1, 1, 1,
0.7495049, 0.8376576, 0.04835019, 1, 1, 1, 1, 1,
0.7543973, 0.4274196, 1.909324, 1, 1, 1, 1, 1,
0.756271, -0.04651118, 0.9910395, 1, 1, 1, 1, 1,
0.7594912, -0.7109577, 3.135232, 1, 1, 1, 1, 1,
0.7694132, 1.869957, 1.791385, 1, 1, 1, 1, 1,
0.7712728, 0.3741102, 2.547773, 1, 1, 1, 1, 1,
0.7764382, 1.568, -0.7228658, 1, 1, 1, 1, 1,
0.7790897, -1.138135, 4.090144, 0, 0, 1, 1, 1,
0.7806875, -0.01428979, 0.2035001, 1, 0, 0, 1, 1,
0.780926, -0.6090645, 2.839384, 1, 0, 0, 1, 1,
0.7840205, -0.1770689, 2.164762, 1, 0, 0, 1, 1,
0.7879658, 1.248891, 2.250679, 1, 0, 0, 1, 1,
0.7956524, -2.490878, 2.942088, 1, 0, 0, 1, 1,
0.8006136, -0.7733253, 2.2123, 0, 0, 0, 1, 1,
0.8053939, -0.3489909, 0.4942763, 0, 0, 0, 1, 1,
0.8065608, -0.3349058, 1.689003, 0, 0, 0, 1, 1,
0.8093123, 1.491256, 1.31445, 0, 0, 0, 1, 1,
0.8099907, 0.2502135, 0.5879312, 0, 0, 0, 1, 1,
0.8109113, -0.3687195, 2.252011, 0, 0, 0, 1, 1,
0.8178492, -0.6080767, 0.9930319, 0, 0, 0, 1, 1,
0.8185005, -2.038547, 2.515883, 1, 1, 1, 1, 1,
0.8210901, -1.466674, 3.241234, 1, 1, 1, 1, 1,
0.8314193, -0.8611695, 2.227018, 1, 1, 1, 1, 1,
0.8334372, 0.04100934, 0.8633568, 1, 1, 1, 1, 1,
0.8436756, 0.3409809, 0.6365918, 1, 1, 1, 1, 1,
0.8465198, -0.1263708, 2.59205, 1, 1, 1, 1, 1,
0.8484242, 0.4662167, 0.7249317, 1, 1, 1, 1, 1,
0.8484735, -1.044626, 4.046929, 1, 1, 1, 1, 1,
0.8492234, 2.027426, -0.3581401, 1, 1, 1, 1, 1,
0.8499889, 1.720936, 2.641929, 1, 1, 1, 1, 1,
0.8505161, 0.1920601, 0.1895338, 1, 1, 1, 1, 1,
0.853707, -1.56471, 0.489158, 1, 1, 1, 1, 1,
0.856637, -0.2592657, 1.289804, 1, 1, 1, 1, 1,
0.8590823, 0.1465856, 2.107459, 1, 1, 1, 1, 1,
0.8616841, -0.649487, 1.678299, 1, 1, 1, 1, 1,
0.8621228, 0.9667051, 0.7600234, 0, 0, 1, 1, 1,
0.862995, -0.08413766, 0.08871863, 1, 0, 0, 1, 1,
0.864498, 0.6876237, 0.9076644, 1, 0, 0, 1, 1,
0.8648912, -0.7771258, 1.921051, 1, 0, 0, 1, 1,
0.8651845, 2.271577, -0.1908871, 1, 0, 0, 1, 1,
0.8664536, 2.558837, 0.386801, 1, 0, 0, 1, 1,
0.8675218, 0.7701218, 0.559139, 0, 0, 0, 1, 1,
0.8679442, -0.8850957, 2.616347, 0, 0, 0, 1, 1,
0.8683822, -0.5299699, 3.425267, 0, 0, 0, 1, 1,
0.8692285, -0.3637083, 2.723081, 0, 0, 0, 1, 1,
0.874711, -0.5610471, 2.682688, 0, 0, 0, 1, 1,
0.8848541, 0.05709532, 0.1180752, 0, 0, 0, 1, 1,
0.8857889, 0.1322235, 1.565197, 0, 0, 0, 1, 1,
0.8883258, -0.09062485, 1.546686, 1, 1, 1, 1, 1,
0.9036844, -0.3328485, -0.08572855, 1, 1, 1, 1, 1,
0.9076591, 0.1372209, 0.3980708, 1, 1, 1, 1, 1,
0.9101002, -0.8242045, 0.2724798, 1, 1, 1, 1, 1,
0.9201075, -1.246498, 3.164229, 1, 1, 1, 1, 1,
0.9203169, 0.2459279, 0.9458098, 1, 1, 1, 1, 1,
0.9215442, -0.2465121, 1.869884, 1, 1, 1, 1, 1,
0.9238648, 0.6099479, 2.845906, 1, 1, 1, 1, 1,
0.926082, 0.03818032, 1.152654, 1, 1, 1, 1, 1,
0.9295471, 0.1478186, 0.5302307, 1, 1, 1, 1, 1,
0.9299222, -0.09149562, 3.306671, 1, 1, 1, 1, 1,
0.9437065, -0.2220539, 1.49036, 1, 1, 1, 1, 1,
0.950238, -0.1719137, 1.918194, 1, 1, 1, 1, 1,
0.95522, -1.294724, 3.583853, 1, 1, 1, 1, 1,
0.9633045, 0.3654471, 2.210544, 1, 1, 1, 1, 1,
0.9642681, 0.6462404, 1.698479, 0, 0, 1, 1, 1,
0.9663944, 1.065328, 1.035928, 1, 0, 0, 1, 1,
0.9664179, 0.3377335, 1.813671, 1, 0, 0, 1, 1,
0.9675954, 0.8481188, 1.867795, 1, 0, 0, 1, 1,
0.9693057, -0.2716887, 2.958108, 1, 0, 0, 1, 1,
0.9741929, 0.43369, 2.312263, 1, 0, 0, 1, 1,
0.9742922, -0.2507655, 3.196112, 0, 0, 0, 1, 1,
0.9785874, 1.171545, 1.356038, 0, 0, 0, 1, 1,
0.9834241, 0.7964356, -0.0116575, 0, 0, 0, 1, 1,
0.9845595, 1.990685, 0.4611569, 0, 0, 0, 1, 1,
0.985721, -1.156049, 1.28146, 0, 0, 0, 1, 1,
0.9880778, -0.05085256, 2.0169, 0, 0, 0, 1, 1,
0.9883425, -0.3437417, 2.023367, 0, 0, 0, 1, 1,
0.9907838, -0.3683452, 1.602587, 1, 1, 1, 1, 1,
1.00734, 0.5936923, 0.2364059, 1, 1, 1, 1, 1,
1.007557, 0.763047, 0.1790685, 1, 1, 1, 1, 1,
1.010488, -0.561646, 3.092603, 1, 1, 1, 1, 1,
1.011047, 0.5028664, -0.5085999, 1, 1, 1, 1, 1,
1.016203, -0.4640827, 2.654804, 1, 1, 1, 1, 1,
1.016527, 1.057627, 0.7406215, 1, 1, 1, 1, 1,
1.01677, -1.747036, 2.366442, 1, 1, 1, 1, 1,
1.019706, 0.03467141, 0.6380983, 1, 1, 1, 1, 1,
1.022587, -0.8113449, 2.664333, 1, 1, 1, 1, 1,
1.031748, 0.1354815, 1.253186, 1, 1, 1, 1, 1,
1.039459, -1.23308, 2.865224, 1, 1, 1, 1, 1,
1.045351, 1.439213, 0.3908342, 1, 1, 1, 1, 1,
1.047901, 0.4483481, 0.04895101, 1, 1, 1, 1, 1,
1.051147, 1.111325, -0.06229262, 1, 1, 1, 1, 1,
1.05455, -0.5970097, 2.727384, 0, 0, 1, 1, 1,
1.055788, -0.4578121, 2.532039, 1, 0, 0, 1, 1,
1.060027, 0.2404966, 3.846396, 1, 0, 0, 1, 1,
1.063725, -0.9651908, 2.072918, 1, 0, 0, 1, 1,
1.065722, 0.2665263, 1.253567, 1, 0, 0, 1, 1,
1.077911, -0.7674699, 2.572526, 1, 0, 0, 1, 1,
1.077927, 0.4062166, 2.208212, 0, 0, 0, 1, 1,
1.082282, -0.1314646, 2.786278, 0, 0, 0, 1, 1,
1.086069, 0.2370797, 2.502589, 0, 0, 0, 1, 1,
1.090169, -0.04377181, 2.852313, 0, 0, 0, 1, 1,
1.090559, -0.3214043, 3.000998, 0, 0, 0, 1, 1,
1.092767, 2.067727, 0.3052466, 0, 0, 0, 1, 1,
1.104877, -0.7029048, 1.409089, 0, 0, 0, 1, 1,
1.106319, 0.3190753, 1.235934, 1, 1, 1, 1, 1,
1.107334, -0.3128803, 1.639658, 1, 1, 1, 1, 1,
1.108315, -0.4950475, 1.616279, 1, 1, 1, 1, 1,
1.118257, 0.5468174, 1.506504, 1, 1, 1, 1, 1,
1.118767, -0.9202842, 2.731092, 1, 1, 1, 1, 1,
1.120564, -1.253529, 1.397585, 1, 1, 1, 1, 1,
1.120638, -0.9233835, 4.530032, 1, 1, 1, 1, 1,
1.122792, 0.6559211, 1.509215, 1, 1, 1, 1, 1,
1.128254, 0.3823722, -1.534439, 1, 1, 1, 1, 1,
1.1283, -0.1927428, 3.131627, 1, 1, 1, 1, 1,
1.133485, 0.4418993, 1.404294, 1, 1, 1, 1, 1,
1.13441, -0.1582208, 2.465423, 1, 1, 1, 1, 1,
1.137099, -1.177649, 2.1998, 1, 1, 1, 1, 1,
1.138303, -0.8730211, 1.243775, 1, 1, 1, 1, 1,
1.146631, 2.086314, -1.080112, 1, 1, 1, 1, 1,
1.161613, -1.942525, 3.437335, 0, 0, 1, 1, 1,
1.162636, -0.1743763, 1.950736, 1, 0, 0, 1, 1,
1.169075, 1.179458, 0.5534497, 1, 0, 0, 1, 1,
1.175425, -0.3938709, 0.6487343, 1, 0, 0, 1, 1,
1.185211, 1.125429, 0.904245, 1, 0, 0, 1, 1,
1.190547, 0.1786554, 1.516008, 1, 0, 0, 1, 1,
1.191334, -2.140737, 1.970171, 0, 0, 0, 1, 1,
1.192262, -0.3426403, 1.179684, 0, 0, 0, 1, 1,
1.198052, 1.172781, -0.8093756, 0, 0, 0, 1, 1,
1.200082, -0.9635658, 2.096972, 0, 0, 0, 1, 1,
1.203614, -0.859262, 2.36106, 0, 0, 0, 1, 1,
1.204131, -1.524192, 1.059486, 0, 0, 0, 1, 1,
1.20416, -1.432609, 0.7966409, 0, 0, 0, 1, 1,
1.204981, -1.430548, 1.289331, 1, 1, 1, 1, 1,
1.21244, -1.171219, 1.942084, 1, 1, 1, 1, 1,
1.213826, -2.931483, 3.255987, 1, 1, 1, 1, 1,
1.213981, -0.9967376, 1.90888, 1, 1, 1, 1, 1,
1.238282, -1.265162, 2.117841, 1, 1, 1, 1, 1,
1.250216, -1.160839, 3.542484, 1, 1, 1, 1, 1,
1.253086, 0.02141304, 0.9200561, 1, 1, 1, 1, 1,
1.256056, 1.213521, 0.7867265, 1, 1, 1, 1, 1,
1.257969, -0.9692092, 1.041299, 1, 1, 1, 1, 1,
1.276122, -1.100945, 2.902885, 1, 1, 1, 1, 1,
1.276336, 0.3028752, 1.555101, 1, 1, 1, 1, 1,
1.278501, -1.08036, 2.811432, 1, 1, 1, 1, 1,
1.279106, -0.0679152, 2.05401, 1, 1, 1, 1, 1,
1.282306, -0.1813966, 0.5146049, 1, 1, 1, 1, 1,
1.288532, -0.9785422, 2.459892, 1, 1, 1, 1, 1,
1.294754, 0.4775933, 0.8796965, 0, 0, 1, 1, 1,
1.295951, -0.1895733, 0.9237169, 1, 0, 0, 1, 1,
1.303458, 0.11952, 1.175644, 1, 0, 0, 1, 1,
1.304574, 0.9225225, 3.068483, 1, 0, 0, 1, 1,
1.30912, -0.6339025, 2.496226, 1, 0, 0, 1, 1,
1.310498, 0.2870173, 1.732609, 1, 0, 0, 1, 1,
1.313399, 0.6816193, 3.014105, 0, 0, 0, 1, 1,
1.327438, -0.5715095, 2.411102, 0, 0, 0, 1, 1,
1.33039, 0.4920959, 0.9317402, 0, 0, 0, 1, 1,
1.331439, 0.04616188, -0.388922, 0, 0, 0, 1, 1,
1.335478, -3.431862, 3.122285, 0, 0, 0, 1, 1,
1.345791, 0.6050766, -0.9091925, 0, 0, 0, 1, 1,
1.357153, 0.02769049, 4.510611, 0, 0, 0, 1, 1,
1.368596, 1.806061, -2.130096, 1, 1, 1, 1, 1,
1.388805, 0.4424557, 1.78089, 1, 1, 1, 1, 1,
1.395922, 1.556818, 0.8933349, 1, 1, 1, 1, 1,
1.400782, -0.4759683, 0.4748855, 1, 1, 1, 1, 1,
1.405591, 1.489073, -0.4658817, 1, 1, 1, 1, 1,
1.41861, -0.07349616, 1.07365, 1, 1, 1, 1, 1,
1.427244, -0.35799, 1.692443, 1, 1, 1, 1, 1,
1.431692, -0.7315448, 2.519989, 1, 1, 1, 1, 1,
1.431859, -0.2711239, 2.188339, 1, 1, 1, 1, 1,
1.442918, -2.393252, 2.222856, 1, 1, 1, 1, 1,
1.444221, -0.5691224, 1.330095, 1, 1, 1, 1, 1,
1.446938, 1.652271, 2.012719, 1, 1, 1, 1, 1,
1.454675, 0.6963299, 3.421238, 1, 1, 1, 1, 1,
1.458752, 1.605909, 1.627116, 1, 1, 1, 1, 1,
1.460212, -0.06933872, 1.171487, 1, 1, 1, 1, 1,
1.468727, -0.2834779, 1.202718, 0, 0, 1, 1, 1,
1.475569, 0.4017895, 0.8756967, 1, 0, 0, 1, 1,
1.476517, 0.2511427, 1.515024, 1, 0, 0, 1, 1,
1.491972, 0.09641905, 2.531202, 1, 0, 0, 1, 1,
1.498006, 0.1677374, 1.116912, 1, 0, 0, 1, 1,
1.50613, 1.489823, -0.4879145, 1, 0, 0, 1, 1,
1.509655, 0.1105681, 1.390753, 0, 0, 0, 1, 1,
1.509711, -1.284199, 4.194528, 0, 0, 0, 1, 1,
1.512648, -0.6950602, 4.346362, 0, 0, 0, 1, 1,
1.520855, 0.5342997, 1.853755, 0, 0, 0, 1, 1,
1.521731, -0.03125459, 1.3749, 0, 0, 0, 1, 1,
1.535539, 1.449939, 0.4032017, 0, 0, 0, 1, 1,
1.552206, 1.225789, 1.242106, 0, 0, 0, 1, 1,
1.555493, 0.7343239, 3.558259, 1, 1, 1, 1, 1,
1.582181, 0.4704095, 2.236406, 1, 1, 1, 1, 1,
1.585717, -2.291202, 1.324216, 1, 1, 1, 1, 1,
1.589073, 1.352871, 0.9462391, 1, 1, 1, 1, 1,
1.60359, 0.3457573, 2.037075, 1, 1, 1, 1, 1,
1.611241, -1.049356, 2.030639, 1, 1, 1, 1, 1,
1.622058, 0.6914421, 1.7753, 1, 1, 1, 1, 1,
1.623528, 1.265029, 0.6390198, 1, 1, 1, 1, 1,
1.62839, 0.3848468, -0.3462081, 1, 1, 1, 1, 1,
1.635008, 0.1591098, 2.91604, 1, 1, 1, 1, 1,
1.638076, 0.1031872, 1.870958, 1, 1, 1, 1, 1,
1.663015, 0.8656768, -0.5174843, 1, 1, 1, 1, 1,
1.663443, -0.8781689, 1.48956, 1, 1, 1, 1, 1,
1.681838, 1.632417, 0.9720623, 1, 1, 1, 1, 1,
1.683836, -1.324098, 2.803163, 1, 1, 1, 1, 1,
1.689661, -0.9018435, 2.356261, 0, 0, 1, 1, 1,
1.700207, -0.5209603, -1.000044, 1, 0, 0, 1, 1,
1.705598, -1.327993, 2.098241, 1, 0, 0, 1, 1,
1.708118, 0.01872363, 1.570156, 1, 0, 0, 1, 1,
1.735834, -0.6274182, 1.232804, 1, 0, 0, 1, 1,
1.763334, -1.836511, 1.67985, 1, 0, 0, 1, 1,
1.76978, -0.9418305, 2.776805, 0, 0, 0, 1, 1,
1.797799, -0.949891, 2.965052, 0, 0, 0, 1, 1,
1.800161, -2.003161, 3.636399, 0, 0, 0, 1, 1,
1.828236, -2.515327, 2.067884, 0, 0, 0, 1, 1,
1.914749, 0.4180906, 2.762454, 0, 0, 0, 1, 1,
1.914937, -0.273781, 1.603917, 0, 0, 0, 1, 1,
1.925749, 0.2771314, 1.164494, 0, 0, 0, 1, 1,
1.925876, -1.581542, 3.781456, 1, 1, 1, 1, 1,
1.935675, 0.2817764, 1.16977, 1, 1, 1, 1, 1,
1.967555, -0.9256791, 1.396101, 1, 1, 1, 1, 1,
1.96969, 0.7058079, 0.8266866, 1, 1, 1, 1, 1,
2.017313, -0.04298991, 1.754566, 1, 1, 1, 1, 1,
2.018813, 0.572216, 1.02175, 1, 1, 1, 1, 1,
2.020241, 0.1939876, 1.20462, 1, 1, 1, 1, 1,
2.071815, 1.486291, 0.835241, 1, 1, 1, 1, 1,
2.078092, 0.0248782, 2.795847, 1, 1, 1, 1, 1,
2.102369, 0.2770589, 3.555702, 1, 1, 1, 1, 1,
2.117806, 0.08107606, 0.7768697, 1, 1, 1, 1, 1,
2.123533, 0.4450518, 1.290038, 1, 1, 1, 1, 1,
2.142324, 0.1929911, 1.198513, 1, 1, 1, 1, 1,
2.16313, -0.3351114, 0.6249266, 1, 1, 1, 1, 1,
2.167453, -0.471752, 0.1155029, 1, 1, 1, 1, 1,
2.194385, -1.814888, 2.121749, 0, 0, 1, 1, 1,
2.203087, 0.7206547, 0.6488331, 1, 0, 0, 1, 1,
2.211549, -0.1566341, 1.89981, 1, 0, 0, 1, 1,
2.252315, 0.4260151, 1.615456, 1, 0, 0, 1, 1,
2.257188, 1.009982, 0.02236376, 1, 0, 0, 1, 1,
2.286687, -0.4140954, 2.566444, 1, 0, 0, 1, 1,
2.329225, -0.1428747, 1.101932, 0, 0, 0, 1, 1,
2.346503, 0.8136495, 0.4760359, 0, 0, 0, 1, 1,
2.382779, 0.5293819, 1.586362, 0, 0, 0, 1, 1,
2.437602, 1.361761, 3.596431, 0, 0, 0, 1, 1,
2.446501, -1.184983, 1.887746, 0, 0, 0, 1, 1,
2.45976, 0.2897794, 0.4950028, 0, 0, 0, 1, 1,
2.520921, -0.1026063, 0.2954339, 0, 0, 0, 1, 1,
2.554968, -0.09136873, 2.465538, 1, 1, 1, 1, 1,
2.569359, 0.3079832, 2.810469, 1, 1, 1, 1, 1,
2.595975, -0.2271016, -0.7953757, 1, 1, 1, 1, 1,
2.654658, -0.07430831, 1.361298, 1, 1, 1, 1, 1,
2.699739, 1.755422, 0.9614627, 1, 1, 1, 1, 1,
3.280577, 1.845775, 2.666382, 1, 1, 1, 1, 1,
3.441606, 0.3614502, 1.043705, 1, 1, 1, 1, 1
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
var radius = 9.978897;
var distance = 35.05045;
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
mvMatrix.translate( -0.1151183, 0.05832314, 0.5267758 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.05045);
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