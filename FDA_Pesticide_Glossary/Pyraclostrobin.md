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
-2.985608, 0.7054217, -0.5113418, 1, 0, 0, 1,
-2.793969, 0.1548239, -4.038592, 1, 0.007843138, 0, 1,
-2.75991, -0.5928295, -1.051665, 1, 0.01176471, 0, 1,
-2.640277, -0.862626, -2.525161, 1, 0.01960784, 0, 1,
-2.613257, -0.5781591, -2.171169, 1, 0.02352941, 0, 1,
-2.521345, 0.7453668, 0.03619051, 1, 0.03137255, 0, 1,
-2.51671, 1.591544, -2.923897, 1, 0.03529412, 0, 1,
-2.447694, 0.7129298, -1.824287, 1, 0.04313726, 0, 1,
-2.349827, -1.368337, -2.501465, 1, 0.04705882, 0, 1,
-2.323118, -0.3678596, -2.108706, 1, 0.05490196, 0, 1,
-2.303403, 1.992555, 0.8682237, 1, 0.05882353, 0, 1,
-2.270824, -2.433183, -3.043178, 1, 0.06666667, 0, 1,
-2.155719, 0.7752041, -0.9864317, 1, 0.07058824, 0, 1,
-2.151976, -1.247839, -2.670698, 1, 0.07843138, 0, 1,
-2.145887, -0.319734, -2.23332, 1, 0.08235294, 0, 1,
-2.141815, 0.5233579, -0.8144136, 1, 0.09019608, 0, 1,
-2.112339, -0.9505002, -1.476289, 1, 0.09411765, 0, 1,
-2.094023, 0.6600614, -1.767267, 1, 0.1019608, 0, 1,
-2.091384, -0.7070138, -0.6715921, 1, 0.1098039, 0, 1,
-2.07657, 0.06861237, -1.600564, 1, 0.1137255, 0, 1,
-2.075001, -0.3594671, -2.491418, 1, 0.1215686, 0, 1,
-2.018285, -2.867271, -4.527482, 1, 0.1254902, 0, 1,
-1.932759, -0.4658566, -1.16052, 1, 0.1333333, 0, 1,
-1.920148, 1.097505, -1.684192, 1, 0.1372549, 0, 1,
-1.915223, -0.6050535, 0.7930263, 1, 0.145098, 0, 1,
-1.906026, 0.7361939, -1.016472, 1, 0.1490196, 0, 1,
-1.900647, 0.7512519, -1.026233, 1, 0.1568628, 0, 1,
-1.886244, -1.377829, -3.76485, 1, 0.1607843, 0, 1,
-1.879923, -0.9665508, -2.140684, 1, 0.1686275, 0, 1,
-1.850303, 0.6358657, -2.709909, 1, 0.172549, 0, 1,
-1.821407, -1.925547, -1.920279, 1, 0.1803922, 0, 1,
-1.819099, 0.07329719, -0.7310925, 1, 0.1843137, 0, 1,
-1.814472, 1.130407, -2.178272, 1, 0.1921569, 0, 1,
-1.804004, 0.1923735, 0.03568863, 1, 0.1960784, 0, 1,
-1.7987, 0.3364692, -1.456224, 1, 0.2039216, 0, 1,
-1.773443, -0.6153526, -1.943097, 1, 0.2117647, 0, 1,
-1.770885, 1.242355, -2.611685, 1, 0.2156863, 0, 1,
-1.750842, -1.15037, -0.7439576, 1, 0.2235294, 0, 1,
-1.748982, -1.952783, -3.795266, 1, 0.227451, 0, 1,
-1.735805, -0.3876562, -2.773264, 1, 0.2352941, 0, 1,
-1.725995, 0.7494538, -1.15062, 1, 0.2392157, 0, 1,
-1.708982, 0.5910792, -1.460923, 1, 0.2470588, 0, 1,
-1.707762, 0.5697513, -2.104507, 1, 0.2509804, 0, 1,
-1.686435, 0.9634038, -1.789651, 1, 0.2588235, 0, 1,
-1.676119, 1.187085, -0.1213725, 1, 0.2627451, 0, 1,
-1.674946, -0.9746221, -2.456558, 1, 0.2705882, 0, 1,
-1.661955, -1.250227, -3.23914, 1, 0.2745098, 0, 1,
-1.650488, 0.6931286, -1.906379, 1, 0.282353, 0, 1,
-1.631921, -2.363144, -2.46672, 1, 0.2862745, 0, 1,
-1.6292, -1.306682, -3.072236, 1, 0.2941177, 0, 1,
-1.607604, -1.064152, -0.9976053, 1, 0.3019608, 0, 1,
-1.604176, -0.3684568, -0.6037628, 1, 0.3058824, 0, 1,
-1.573354, 0.3441289, 0.9190202, 1, 0.3137255, 0, 1,
-1.552943, -0.3771378, -2.961345, 1, 0.3176471, 0, 1,
-1.531097, -0.4185822, -3.186767, 1, 0.3254902, 0, 1,
-1.523954, 1.60552, -0.7709532, 1, 0.3294118, 0, 1,
-1.520012, -0.9817144, -2.383179, 1, 0.3372549, 0, 1,
-1.517941, -0.09979512, -1.632042, 1, 0.3411765, 0, 1,
-1.51735, -1.985865, -3.421191, 1, 0.3490196, 0, 1,
-1.509918, -0.833846, -2.525811, 1, 0.3529412, 0, 1,
-1.467788, -0.3778412, -0.4884498, 1, 0.3607843, 0, 1,
-1.458091, 0.322161, -2.297706, 1, 0.3647059, 0, 1,
-1.449133, -0.1440724, -2.192625, 1, 0.372549, 0, 1,
-1.445383, -0.003998242, -1.073535, 1, 0.3764706, 0, 1,
-1.436534, -1.070306, -0.7832147, 1, 0.3843137, 0, 1,
-1.433547, 0.4069935, -1.672409, 1, 0.3882353, 0, 1,
-1.429627, -1.242223, -4.350534, 1, 0.3960784, 0, 1,
-1.424434, 0.04875621, -2.694406, 1, 0.4039216, 0, 1,
-1.422347, 0.4776791, -0.1844994, 1, 0.4078431, 0, 1,
-1.406817, -0.08444612, -1.75133, 1, 0.4156863, 0, 1,
-1.406102, 0.01394356, -2.548036, 1, 0.4196078, 0, 1,
-1.392125, -0.8783196, -2.139358, 1, 0.427451, 0, 1,
-1.366174, -1.67466, -0.3069533, 1, 0.4313726, 0, 1,
-1.358536, 1.857292, -1.662296, 1, 0.4392157, 0, 1,
-1.355435, -0.8811383, -2.640281, 1, 0.4431373, 0, 1,
-1.341124, 0.7702681, -0.5192075, 1, 0.4509804, 0, 1,
-1.339077, 0.02092154, -2.112834, 1, 0.454902, 0, 1,
-1.338336, -0.1032578, -0.7180933, 1, 0.4627451, 0, 1,
-1.327539, 1.292771, 0.5841281, 1, 0.4666667, 0, 1,
-1.306291, -0.7765981, -1.431187, 1, 0.4745098, 0, 1,
-1.296976, -0.738122, -1.770373, 1, 0.4784314, 0, 1,
-1.29639, 1.582178, -1.429989, 1, 0.4862745, 0, 1,
-1.281537, 0.1829496, -0.4780122, 1, 0.4901961, 0, 1,
-1.277765, -2.810097, -3.30028, 1, 0.4980392, 0, 1,
-1.276987, 0.4644024, -2.613706, 1, 0.5058824, 0, 1,
-1.257421, -0.9089109, -2.82349, 1, 0.509804, 0, 1,
-1.249051, 0.7043785, -0.2350343, 1, 0.5176471, 0, 1,
-1.248694, 0.1969537, -2.166676, 1, 0.5215687, 0, 1,
-1.247534, 0.8602708, -2.117009, 1, 0.5294118, 0, 1,
-1.225771, 0.8829265, -0.9548235, 1, 0.5333334, 0, 1,
-1.223003, -0.1491084, -1.733737, 1, 0.5411765, 0, 1,
-1.222412, -0.6764206, -4.090502, 1, 0.5450981, 0, 1,
-1.216084, 0.5703594, -2.560806, 1, 0.5529412, 0, 1,
-1.213079, 0.172812, -1.376333, 1, 0.5568628, 0, 1,
-1.21166, -1.287725, -2.799597, 1, 0.5647059, 0, 1,
-1.20328, -0.6548945, -3.460001, 1, 0.5686275, 0, 1,
-1.19354, 1.104808, 0.1577962, 1, 0.5764706, 0, 1,
-1.180349, 0.4155936, -1.806535, 1, 0.5803922, 0, 1,
-1.168027, 0.606373, -2.163998, 1, 0.5882353, 0, 1,
-1.166577, 0.1519466, -1.8428, 1, 0.5921569, 0, 1,
-1.164424, -0.809966, -1.498033, 1, 0.6, 0, 1,
-1.163786, 0.7665616, -0.7737133, 1, 0.6078432, 0, 1,
-1.159364, -0.4577056, 0.4890484, 1, 0.6117647, 0, 1,
-1.149213, -0.5626229, -2.5785, 1, 0.6196079, 0, 1,
-1.145881, -0.718944, -1.861438, 1, 0.6235294, 0, 1,
-1.143158, -0.3438505, -1.182665, 1, 0.6313726, 0, 1,
-1.14019, 0.3018316, -1.821956, 1, 0.6352941, 0, 1,
-1.134245, -2.026166, -0.9942585, 1, 0.6431373, 0, 1,
-1.133665, -0.8974277, -2.079273, 1, 0.6470588, 0, 1,
-1.129774, 0.2320873, -1.462498, 1, 0.654902, 0, 1,
-1.126397, 0.9357681, -0.8886062, 1, 0.6588235, 0, 1,
-1.126072, -1.845828, -0.8067575, 1, 0.6666667, 0, 1,
-1.118187, 1.601685, -2.057548, 1, 0.6705883, 0, 1,
-1.11437, -1.636568, -2.51362, 1, 0.6784314, 0, 1,
-1.11283, 0.1338331, -1.990101, 1, 0.682353, 0, 1,
-1.106763, -0.6635306, -0.6939715, 1, 0.6901961, 0, 1,
-1.098679, 0.7832485, -2.673938, 1, 0.6941177, 0, 1,
-1.093822, 1.419737, -0.2838745, 1, 0.7019608, 0, 1,
-1.091495, 0.7855525, -0.5441965, 1, 0.7098039, 0, 1,
-1.088681, 0.5281289, -1.828115, 1, 0.7137255, 0, 1,
-1.080078, 0.7709876, -0.4344096, 1, 0.7215686, 0, 1,
-1.075136, -0.110577, -1.69377, 1, 0.7254902, 0, 1,
-1.072672, 0.4749853, -0.6115981, 1, 0.7333333, 0, 1,
-1.071134, 1.458006, -1.287771, 1, 0.7372549, 0, 1,
-1.070778, 0.556749, -1.568424, 1, 0.7450981, 0, 1,
-1.066418, 2.48724, -0.3715247, 1, 0.7490196, 0, 1,
-1.061938, -0.7741557, -3.75445, 1, 0.7568628, 0, 1,
-1.054313, 0.6555848, -1.011837, 1, 0.7607843, 0, 1,
-1.054262, -0.01606939, -1.675043, 1, 0.7686275, 0, 1,
-1.047956, 0.1339095, 0.2382861, 1, 0.772549, 0, 1,
-1.047603, -1.206316, -2.665123, 1, 0.7803922, 0, 1,
-1.045282, -1.663355, -1.18944, 1, 0.7843137, 0, 1,
-1.043525, 1.349292, 0.7168301, 1, 0.7921569, 0, 1,
-1.038705, -0.3112997, -3.309848, 1, 0.7960784, 0, 1,
-1.033509, 0.19974, -2.581784, 1, 0.8039216, 0, 1,
-1.033056, -1.009858, -4.28467, 1, 0.8117647, 0, 1,
-1.03143, 0.5627236, -0.4676723, 1, 0.8156863, 0, 1,
-1.025525, 0.4651559, 0.6751994, 1, 0.8235294, 0, 1,
-1.021056, -1.033612, -1.292442, 1, 0.827451, 0, 1,
-1.02056, -0.7118766, -2.129478, 1, 0.8352941, 0, 1,
-1.020207, -0.107091, -2.279862, 1, 0.8392157, 0, 1,
-1.016283, 0.717278, -2.106771, 1, 0.8470588, 0, 1,
-1.007734, -0.09430589, -1.0447, 1, 0.8509804, 0, 1,
-1.006881, -0.59737, -1.7582, 1, 0.8588235, 0, 1,
-1.005212, 0.4287561, -1.014529, 1, 0.8627451, 0, 1,
-1.003687, 1.030497, -1.516658, 1, 0.8705882, 0, 1,
-0.9981877, -1.210853, -0.785889, 1, 0.8745098, 0, 1,
-0.9973518, 0.4518072, -0.3689687, 1, 0.8823529, 0, 1,
-0.9940036, 0.1905235, -1.933771, 1, 0.8862745, 0, 1,
-0.9896566, -1.851102, -3.002201, 1, 0.8941177, 0, 1,
-0.9874137, 0.4203442, -2.40437, 1, 0.8980392, 0, 1,
-0.9872443, -1.484122, -1.000674, 1, 0.9058824, 0, 1,
-0.9855276, 1.024949, 0.8961046, 1, 0.9137255, 0, 1,
-0.9732041, -0.3290698, -1.642815, 1, 0.9176471, 0, 1,
-0.9724186, 0.4431977, -0.4681703, 1, 0.9254902, 0, 1,
-0.9705589, 0.8894851, -0.4004019, 1, 0.9294118, 0, 1,
-0.9691319, -0.9350275, 0.1068235, 1, 0.9372549, 0, 1,
-0.9619952, 0.1256448, -1.978178, 1, 0.9411765, 0, 1,
-0.9617761, -0.09777678, -1.378643, 1, 0.9490196, 0, 1,
-0.9579311, 0.5981863, -0.1156507, 1, 0.9529412, 0, 1,
-0.956565, 0.2857248, -2.409993, 1, 0.9607843, 0, 1,
-0.95373, 0.8374133, -1.584488, 1, 0.9647059, 0, 1,
-0.9523944, 1.00593, -0.8467225, 1, 0.972549, 0, 1,
-0.9486083, -0.8888174, -4.761825, 1, 0.9764706, 0, 1,
-0.9455764, -1.567539, -3.315839, 1, 0.9843137, 0, 1,
-0.9380413, 1.657701, -0.3249763, 1, 0.9882353, 0, 1,
-0.9346946, -1.351169, -3.759488, 1, 0.9960784, 0, 1,
-0.9265622, -0.4704275, -1.030544, 0.9960784, 1, 0, 1,
-0.9229756, 0.596253, -1.165457, 0.9921569, 1, 0, 1,
-0.9201298, 0.8405348, -1.52942, 0.9843137, 1, 0, 1,
-0.9105719, 0.9848896, -0.4101376, 0.9803922, 1, 0, 1,
-0.9004943, -1.054963, -2.348195, 0.972549, 1, 0, 1,
-0.9001204, -1.155643, -4.371396, 0.9686275, 1, 0, 1,
-0.8890325, 0.4175085, -1.46104, 0.9607843, 1, 0, 1,
-0.8885463, 0.7941954, -1.395177, 0.9568627, 1, 0, 1,
-0.8845237, 1.081922, -1.272006, 0.9490196, 1, 0, 1,
-0.8818427, -0.3221511, -1.76748, 0.945098, 1, 0, 1,
-0.8816391, 0.9108559, 0.3308826, 0.9372549, 1, 0, 1,
-0.880257, 1.12557, -0.619154, 0.9333333, 1, 0, 1,
-0.878257, -0.6239774, -1.970834, 0.9254902, 1, 0, 1,
-0.8751036, 1.093667, -0.2896865, 0.9215686, 1, 0, 1,
-0.8743219, -1.018686, -2.32333, 0.9137255, 1, 0, 1,
-0.8736747, 1.029751, 0.1694683, 0.9098039, 1, 0, 1,
-0.8612493, -0.2887732, -3.031977, 0.9019608, 1, 0, 1,
-0.8589519, 0.61077, -2.217266, 0.8941177, 1, 0, 1,
-0.8518776, 0.8548021, -1.449766, 0.8901961, 1, 0, 1,
-0.8504487, 0.5521975, 0.7372088, 0.8823529, 1, 0, 1,
-0.844477, -0.6344263, -1.864714, 0.8784314, 1, 0, 1,
-0.8428571, 0.3846448, -0.1665342, 0.8705882, 1, 0, 1,
-0.8426024, -1.368301, -4.415566, 0.8666667, 1, 0, 1,
-0.8393635, -0.06571077, -1.862997, 0.8588235, 1, 0, 1,
-0.8374103, -0.2236497, -0.3499694, 0.854902, 1, 0, 1,
-0.8373891, 2.155835, -1.467304, 0.8470588, 1, 0, 1,
-0.8353443, -0.3811028, -2.577653, 0.8431373, 1, 0, 1,
-0.8340964, 0.1008857, 0.9268039, 0.8352941, 1, 0, 1,
-0.822598, -1.0494, -1.987796, 0.8313726, 1, 0, 1,
-0.8219294, 1.598819, -0.5558323, 0.8235294, 1, 0, 1,
-0.8128802, 0.15641, -2.28239, 0.8196079, 1, 0, 1,
-0.8095316, -2.062955, -2.630274, 0.8117647, 1, 0, 1,
-0.8095129, -0.9120979, -2.682106, 0.8078431, 1, 0, 1,
-0.8050387, -1.087427, -2.211511, 0.8, 1, 0, 1,
-0.8027261, 0.06304344, -1.610159, 0.7921569, 1, 0, 1,
-0.8010187, -0.4429273, -2.860718, 0.7882353, 1, 0, 1,
-0.789594, 1.630224, -1.580602, 0.7803922, 1, 0, 1,
-0.7883433, -1.103602, -2.994622, 0.7764706, 1, 0, 1,
-0.7873515, -1.700283, -4.054194, 0.7686275, 1, 0, 1,
-0.7789431, 0.5925069, -0.08925886, 0.7647059, 1, 0, 1,
-0.7779067, 0.6038304, -1.768997, 0.7568628, 1, 0, 1,
-0.7716787, -0.1548709, -1.949414, 0.7529412, 1, 0, 1,
-0.765029, 0.7867832, -0.06502132, 0.7450981, 1, 0, 1,
-0.7523106, 0.5462124, -1.196394, 0.7411765, 1, 0, 1,
-0.7487431, -1.051169, -4.256446, 0.7333333, 1, 0, 1,
-0.7484913, 0.4072089, -0.5381746, 0.7294118, 1, 0, 1,
-0.7470919, 0.3121941, -1.422373, 0.7215686, 1, 0, 1,
-0.7450266, 1.77861, 0.271732, 0.7176471, 1, 0, 1,
-0.7403164, 0.6983784, -2.194968, 0.7098039, 1, 0, 1,
-0.7363271, 0.6318146, -0.8128624, 0.7058824, 1, 0, 1,
-0.7361437, 0.5408182, 1.065224, 0.6980392, 1, 0, 1,
-0.7357427, 0.03692273, -2.12478, 0.6901961, 1, 0, 1,
-0.7317329, -1.956893, -2.418985, 0.6862745, 1, 0, 1,
-0.7309285, -0.746938, -2.304251, 0.6784314, 1, 0, 1,
-0.7277031, -0.6334534, -1.422064, 0.6745098, 1, 0, 1,
-0.7271121, 0.6054186, -1.620977, 0.6666667, 1, 0, 1,
-0.7212059, 0.02569979, -0.8375946, 0.6627451, 1, 0, 1,
-0.7191198, 0.1274826, -1.247488, 0.654902, 1, 0, 1,
-0.7181673, 0.2256565, -0.5751788, 0.6509804, 1, 0, 1,
-0.71373, 1.218816, 0.4571668, 0.6431373, 1, 0, 1,
-0.7116427, -1.596699, -1.783749, 0.6392157, 1, 0, 1,
-0.7112217, -1.355066, -2.081079, 0.6313726, 1, 0, 1,
-0.7108422, 1.027143, 1.301002, 0.627451, 1, 0, 1,
-0.7104566, 2.439512, -1.352705, 0.6196079, 1, 0, 1,
-0.7095701, -0.9690728, -1.586642, 0.6156863, 1, 0, 1,
-0.7069365, -0.8831839, -3.57966, 0.6078432, 1, 0, 1,
-0.7050616, 0.9901518, -0.9063206, 0.6039216, 1, 0, 1,
-0.7050256, -0.9118576, -1.838031, 0.5960785, 1, 0, 1,
-0.7010786, -0.6077875, -2.56047, 0.5882353, 1, 0, 1,
-0.6995911, 0.5450199, -0.853193, 0.5843138, 1, 0, 1,
-0.6988414, 0.7344517, -1.446127, 0.5764706, 1, 0, 1,
-0.6920508, -0.9967507, -1.951194, 0.572549, 1, 0, 1,
-0.6892642, 1.4311, 1.252924, 0.5647059, 1, 0, 1,
-0.6888971, -1.866218, -3.580331, 0.5607843, 1, 0, 1,
-0.6886466, 0.1327116, -1.268289, 0.5529412, 1, 0, 1,
-0.6844614, -0.4794088, -1.30063, 0.5490196, 1, 0, 1,
-0.6764936, -2.090022, -1.925528, 0.5411765, 1, 0, 1,
-0.6720712, -1.17382, -2.24311, 0.5372549, 1, 0, 1,
-0.6710737, -1.193015, -2.917271, 0.5294118, 1, 0, 1,
-0.668593, -0.8027694, -1.969385, 0.5254902, 1, 0, 1,
-0.6645523, 0.6134341, -0.3229941, 0.5176471, 1, 0, 1,
-0.6621781, -0.549196, -3.168929, 0.5137255, 1, 0, 1,
-0.6621646, 0.8380183, -0.751476, 0.5058824, 1, 0, 1,
-0.6618149, -0.5714059, -2.677461, 0.5019608, 1, 0, 1,
-0.6611439, -0.5791512, -2.118561, 0.4941176, 1, 0, 1,
-0.6600975, -2.523911, -3.849715, 0.4862745, 1, 0, 1,
-0.6486866, 1.058469, -0.390561, 0.4823529, 1, 0, 1,
-0.6431561, 0.297413, 0.1137411, 0.4745098, 1, 0, 1,
-0.6355787, -0.169377, -0.8441287, 0.4705882, 1, 0, 1,
-0.6353512, -0.4230932, -2.411495, 0.4627451, 1, 0, 1,
-0.6312267, 0.04407135, -0.2881312, 0.4588235, 1, 0, 1,
-0.6296853, -0.8378668, -2.144971, 0.4509804, 1, 0, 1,
-0.6296724, 1.255089, -2.311828, 0.4470588, 1, 0, 1,
-0.6290152, -1.835065, -3.275622, 0.4392157, 1, 0, 1,
-0.6234061, -1.119095, -0.6924813, 0.4352941, 1, 0, 1,
-0.6221604, -1.409537, -2.282684, 0.427451, 1, 0, 1,
-0.6166522, -1.628417, -3.663537, 0.4235294, 1, 0, 1,
-0.6125761, -1.587643, -3.396641, 0.4156863, 1, 0, 1,
-0.6117453, 0.2257835, -1.516699, 0.4117647, 1, 0, 1,
-0.6080984, -0.3526215, -1.495228, 0.4039216, 1, 0, 1,
-0.6073104, -1.280738, -4.826388, 0.3960784, 1, 0, 1,
-0.6036492, 0.2853118, -1.080624, 0.3921569, 1, 0, 1,
-0.6024815, -1.0077, -1.79716, 0.3843137, 1, 0, 1,
-0.6008436, 1.324426, 0.9399913, 0.3803922, 1, 0, 1,
-0.5989947, -1.108358, -1.451465, 0.372549, 1, 0, 1,
-0.5958551, 0.1018648, -0.8998541, 0.3686275, 1, 0, 1,
-0.5942038, -1.7835, -1.636072, 0.3607843, 1, 0, 1,
-0.5931849, -0.01885939, -2.480379, 0.3568628, 1, 0, 1,
-0.5924104, -0.6069084, -3.320916, 0.3490196, 1, 0, 1,
-0.5892037, -0.5895659, -3.934824, 0.345098, 1, 0, 1,
-0.5845582, -0.3321601, -2.259211, 0.3372549, 1, 0, 1,
-0.5781071, 0.6809474, -0.5516116, 0.3333333, 1, 0, 1,
-0.5746052, 1.171168, -1.45285, 0.3254902, 1, 0, 1,
-0.568212, 1.150444, 0.8867676, 0.3215686, 1, 0, 1,
-0.5631133, 0.6504878, -1.854603, 0.3137255, 1, 0, 1,
-0.5535234, 1.133693, -0.9928021, 0.3098039, 1, 0, 1,
-0.5470526, -0.1657731, -1.712097, 0.3019608, 1, 0, 1,
-0.546728, 0.2960012, -0.5426016, 0.2941177, 1, 0, 1,
-0.5466874, -0.7705359, -2.14252, 0.2901961, 1, 0, 1,
-0.5465196, 0.6548144, -1.506581, 0.282353, 1, 0, 1,
-0.5459757, -1.246028, -3.095803, 0.2784314, 1, 0, 1,
-0.5458926, -1.310441, -2.867612, 0.2705882, 1, 0, 1,
-0.5436418, 1.747404, 1.126661, 0.2666667, 1, 0, 1,
-0.5435969, -1.060355, -2.150637, 0.2588235, 1, 0, 1,
-0.5417726, 0.9972826, 0.4891151, 0.254902, 1, 0, 1,
-0.5399708, 1.010214, -1.101358, 0.2470588, 1, 0, 1,
-0.5387963, 0.1226994, -0.9505885, 0.2431373, 1, 0, 1,
-0.5306944, -0.2943853, -3.399357, 0.2352941, 1, 0, 1,
-0.5298485, -0.9205385, -4.780587, 0.2313726, 1, 0, 1,
-0.5191845, 0.449062, 0.7176017, 0.2235294, 1, 0, 1,
-0.5144572, -1.127017, -2.536136, 0.2196078, 1, 0, 1,
-0.514173, -1.824787, -3.381647, 0.2117647, 1, 0, 1,
-0.5064555, 0.8473886, -1.474212, 0.2078431, 1, 0, 1,
-0.5043628, 0.315482, 0.03509072, 0.2, 1, 0, 1,
-0.4982349, -0.7399639, -2.450011, 0.1921569, 1, 0, 1,
-0.4975547, 1.082004, -0.008359424, 0.1882353, 1, 0, 1,
-0.4965478, -0.1119165, 0.4285305, 0.1803922, 1, 0, 1,
-0.4950639, 1.401311, -0.9501255, 0.1764706, 1, 0, 1,
-0.4949786, -1.148857, -2.188747, 0.1686275, 1, 0, 1,
-0.4927743, 0.257737, 0.0002948034, 0.1647059, 1, 0, 1,
-0.4919704, -0.5532799, -1.615805, 0.1568628, 1, 0, 1,
-0.491845, 0.7537255, -0.448777, 0.1529412, 1, 0, 1,
-0.4896885, -0.5075802, -1.775121, 0.145098, 1, 0, 1,
-0.4876789, -0.7226917, -3.184023, 0.1411765, 1, 0, 1,
-0.4795786, -0.3955772, -1.547345, 0.1333333, 1, 0, 1,
-0.4788009, -0.7545852, -1.505194, 0.1294118, 1, 0, 1,
-0.4769076, -0.2071418, -1.754173, 0.1215686, 1, 0, 1,
-0.4764973, 2.049393, 0.7506899, 0.1176471, 1, 0, 1,
-0.4761775, 0.1301211, -1.722708, 0.1098039, 1, 0, 1,
-0.4671038, 1.025069, -0.2789072, 0.1058824, 1, 0, 1,
-0.4666727, -0.02215403, -1.670369, 0.09803922, 1, 0, 1,
-0.4629488, 0.919601, -1.072367, 0.09019608, 1, 0, 1,
-0.4603315, -1.085216, -3.348172, 0.08627451, 1, 0, 1,
-0.4565089, 0.9910367, 0.2715629, 0.07843138, 1, 0, 1,
-0.456492, -0.006548506, -2.125637, 0.07450981, 1, 0, 1,
-0.4558911, -1.119056, -4.255563, 0.06666667, 1, 0, 1,
-0.4543419, 0.7996302, 0.634007, 0.0627451, 1, 0, 1,
-0.4538902, 0.007773108, -2.779821, 0.05490196, 1, 0, 1,
-0.4530104, 1.20828, -0.8267022, 0.05098039, 1, 0, 1,
-0.4515948, 0.5838671, 0.04812035, 0.04313726, 1, 0, 1,
-0.4501974, 0.02735272, 1.072361, 0.03921569, 1, 0, 1,
-0.4493461, 1.743562, 0.0140941, 0.03137255, 1, 0, 1,
-0.4435348, 2.007528, 0.7076571, 0.02745098, 1, 0, 1,
-0.4421772, 0.3266125, -1.384708, 0.01960784, 1, 0, 1,
-0.441531, 0.07698012, -0.5405684, 0.01568628, 1, 0, 1,
-0.4407672, 2.617889, -1.025786, 0.007843138, 1, 0, 1,
-0.4399265, 0.2921121, -1.028093, 0.003921569, 1, 0, 1,
-0.4352443, -1.263907, -2.151865, 0, 1, 0.003921569, 1,
-0.434158, -0.7228284, -4.603182, 0, 1, 0.01176471, 1,
-0.4306705, -1.44621, -3.320349, 0, 1, 0.01568628, 1,
-0.4269789, 0.0346479, -3.731332, 0, 1, 0.02352941, 1,
-0.4213561, -0.03807524, -2.023304, 0, 1, 0.02745098, 1,
-0.4200976, 0.2428489, -0.850872, 0, 1, 0.03529412, 1,
-0.4171989, 0.783006, -0.4619467, 0, 1, 0.03921569, 1,
-0.4158235, -0.1954138, -2.247864, 0, 1, 0.04705882, 1,
-0.4156842, -0.9279389, -2.24717, 0, 1, 0.05098039, 1,
-0.4153814, -0.1274828, -1.948342, 0, 1, 0.05882353, 1,
-0.4143316, -0.3947625, -1.495826, 0, 1, 0.0627451, 1,
-0.4123507, -0.3225789, -2.152625, 0, 1, 0.07058824, 1,
-0.4122925, 1.872196, 0.3753701, 0, 1, 0.07450981, 1,
-0.4091554, 0.3533057, -0.6792067, 0, 1, 0.08235294, 1,
-0.4083706, 0.003893171, -0.5579526, 0, 1, 0.08627451, 1,
-0.4081608, 0.01238962, -1.677171, 0, 1, 0.09411765, 1,
-0.4062164, -0.9217901, -2.511733, 0, 1, 0.1019608, 1,
-0.4055608, -1.087121, -3.391907, 0, 1, 0.1058824, 1,
-0.4055431, 1.246642, 1.303304, 0, 1, 0.1137255, 1,
-0.4007177, 0.585508, -0.7613858, 0, 1, 0.1176471, 1,
-0.4001436, 0.5032768, 0.7326071, 0, 1, 0.1254902, 1,
-0.3984303, 0.776552, -0.1583785, 0, 1, 0.1294118, 1,
-0.3977816, -0.02247319, -0.9039622, 0, 1, 0.1372549, 1,
-0.395022, 0.8494744, -2.203231, 0, 1, 0.1411765, 1,
-0.3919248, 2.096624, -1.254624, 0, 1, 0.1490196, 1,
-0.3909159, -0.06514036, -1.917297, 0, 1, 0.1529412, 1,
-0.3875478, -0.8654853, -2.256094, 0, 1, 0.1607843, 1,
-0.3859544, -0.09072252, -1.181734, 0, 1, 0.1647059, 1,
-0.3854897, 0.8318654, 0.2096525, 0, 1, 0.172549, 1,
-0.3833485, -1.24884, -1.284717, 0, 1, 0.1764706, 1,
-0.3777852, -0.9202096, -4.013996, 0, 1, 0.1843137, 1,
-0.377131, 0.5042603, 1.085855, 0, 1, 0.1882353, 1,
-0.3757844, 0.06960677, -0.1825764, 0, 1, 0.1960784, 1,
-0.374943, -0.5854639, -0.9878643, 0, 1, 0.2039216, 1,
-0.3690771, -0.9453484, -3.300802, 0, 1, 0.2078431, 1,
-0.3666201, -0.02668977, -0.6694729, 0, 1, 0.2156863, 1,
-0.3642849, -0.3820724, -1.599893, 0, 1, 0.2196078, 1,
-0.3622711, -1.421506, -2.479731, 0, 1, 0.227451, 1,
-0.3621584, -0.8574122, -2.286711, 0, 1, 0.2313726, 1,
-0.3587564, 0.3909049, -0.1054648, 0, 1, 0.2392157, 1,
-0.3552325, 3.182138, 1.525654, 0, 1, 0.2431373, 1,
-0.3551549, -0.415884, -3.357793, 0, 1, 0.2509804, 1,
-0.3528132, -1.619951, -5.736732, 0, 1, 0.254902, 1,
-0.3490067, -0.7168378, -3.628022, 0, 1, 0.2627451, 1,
-0.3471124, 0.9734613, 0.7884012, 0, 1, 0.2666667, 1,
-0.3442283, 0.6505331, -0.6283859, 0, 1, 0.2745098, 1,
-0.343991, 0.4137628, 0.2294548, 0, 1, 0.2784314, 1,
-0.3434017, 0.03988468, -1.983218, 0, 1, 0.2862745, 1,
-0.3427868, -1.172893, -5.10608, 0, 1, 0.2901961, 1,
-0.3354546, 0.5472102, -2.142459, 0, 1, 0.2980392, 1,
-0.3312146, 0.5466791, -0.2589756, 0, 1, 0.3058824, 1,
-0.3311977, -0.531492, -2.700964, 0, 1, 0.3098039, 1,
-0.3286767, 1.146588, 0.8911296, 0, 1, 0.3176471, 1,
-0.3281313, -1.010848, -3.361702, 0, 1, 0.3215686, 1,
-0.3265078, 1.05238, -0.08827396, 0, 1, 0.3294118, 1,
-0.3244564, -0.4609312, -3.057032, 0, 1, 0.3333333, 1,
-0.3223188, -1.05714, -1.303892, 0, 1, 0.3411765, 1,
-0.3222194, -1.329965, -2.992222, 0, 1, 0.345098, 1,
-0.3213201, 1.820522, -0.4030363, 0, 1, 0.3529412, 1,
-0.3153834, 0.3700221, -2.195849, 0, 1, 0.3568628, 1,
-0.3141896, 0.3476787, -1.235071, 0, 1, 0.3647059, 1,
-0.3131258, -1.282336, -1.559812, 0, 1, 0.3686275, 1,
-0.3121033, 0.9302382, -0.452167, 0, 1, 0.3764706, 1,
-0.3110816, 0.36089, 0.8702524, 0, 1, 0.3803922, 1,
-0.3104736, 1.263599, 0.494622, 0, 1, 0.3882353, 1,
-0.3077022, -0.1115051, -3.020904, 0, 1, 0.3921569, 1,
-0.3072141, 1.32147, 0.8069961, 0, 1, 0.4, 1,
-0.3066014, -0.1785661, -2.573273, 0, 1, 0.4078431, 1,
-0.3063298, 1.316774, 0.06711128, 0, 1, 0.4117647, 1,
-0.3058833, 0.4387095, -0.8826303, 0, 1, 0.4196078, 1,
-0.2982343, 0.6665515, 1.054273, 0, 1, 0.4235294, 1,
-0.2916254, -0.7873251, -0.6143258, 0, 1, 0.4313726, 1,
-0.2803625, -0.7243217, -2.77907, 0, 1, 0.4352941, 1,
-0.2791614, 1.909007, -1.647521, 0, 1, 0.4431373, 1,
-0.2769701, 1.757111, 0.841027, 0, 1, 0.4470588, 1,
-0.2764946, 0.6839281, -0.3562739, 0, 1, 0.454902, 1,
-0.276299, 1.38364, -0.6528639, 0, 1, 0.4588235, 1,
-0.2747657, -0.7255016, -1.422401, 0, 1, 0.4666667, 1,
-0.2682851, -0.8527225, -3.802707, 0, 1, 0.4705882, 1,
-0.268269, -0.8294772, -3.428739, 0, 1, 0.4784314, 1,
-0.2595088, -0.2073106, -1.640941, 0, 1, 0.4823529, 1,
-0.2543578, -0.8093299, -1.787575, 0, 1, 0.4901961, 1,
-0.2521832, -0.8291038, -3.143301, 0, 1, 0.4941176, 1,
-0.2483155, -0.3808409, -3.025357, 0, 1, 0.5019608, 1,
-0.2481302, 0.4318308, -0.4741923, 0, 1, 0.509804, 1,
-0.2469071, 0.8335052, -0.1512408, 0, 1, 0.5137255, 1,
-0.2451375, -0.8197598, -3.013391, 0, 1, 0.5215687, 1,
-0.2448721, 0.6893117, -0.7006654, 0, 1, 0.5254902, 1,
-0.2440621, -2.093034, -3.095428, 0, 1, 0.5333334, 1,
-0.2437198, -0.6739575, -3.744942, 0, 1, 0.5372549, 1,
-0.2399212, 0.7656978, 0.4850237, 0, 1, 0.5450981, 1,
-0.23523, -2.082088, -2.317419, 0, 1, 0.5490196, 1,
-0.2317947, -0.1195511, -3.196217, 0, 1, 0.5568628, 1,
-0.2301247, 0.4613915, -2.613066, 0, 1, 0.5607843, 1,
-0.2287123, -0.7283061, -3.638743, 0, 1, 0.5686275, 1,
-0.22699, -0.1853458, -0.4389676, 0, 1, 0.572549, 1,
-0.226167, -0.7753615, -4.877841, 0, 1, 0.5803922, 1,
-0.2245753, 0.5246661, -2.887809, 0, 1, 0.5843138, 1,
-0.2223028, 1.960544, -0.3792709, 0, 1, 0.5921569, 1,
-0.2219552, -1.110819, -3.146252, 0, 1, 0.5960785, 1,
-0.2177085, 0.1851064, -1.180982, 0, 1, 0.6039216, 1,
-0.2157491, 0.2736179, 1.238353, 0, 1, 0.6117647, 1,
-0.2145578, 0.8977653, -0.002513904, 0, 1, 0.6156863, 1,
-0.2124631, -0.2125997, -3.267672, 0, 1, 0.6235294, 1,
-0.2083063, -0.1041151, -0.07103061, 0, 1, 0.627451, 1,
-0.1977058, -1.061684, -4.083419, 0, 1, 0.6352941, 1,
-0.1956976, -0.4366825, -1.759191, 0, 1, 0.6392157, 1,
-0.1949147, -2.10863, -3.170294, 0, 1, 0.6470588, 1,
-0.1899842, -2.358073, -2.452328, 0, 1, 0.6509804, 1,
-0.1865695, -0.7642047, -0.6609173, 0, 1, 0.6588235, 1,
-0.182442, 0.4660262, 1.676948, 0, 1, 0.6627451, 1,
-0.1824268, -0.474996, -2.963135, 0, 1, 0.6705883, 1,
-0.1735888, 1.254662, 0.3007469, 0, 1, 0.6745098, 1,
-0.1705384, -0.2726983, -2.753676, 0, 1, 0.682353, 1,
-0.1704668, 2.06931, -2.020124, 0, 1, 0.6862745, 1,
-0.1667072, -0.4754065, -0.7645202, 0, 1, 0.6941177, 1,
-0.1615823, 0.357434, -0.4893567, 0, 1, 0.7019608, 1,
-0.1606995, -0.3209877, -3.480458, 0, 1, 0.7058824, 1,
-0.1599243, 0.3106071, -0.5615203, 0, 1, 0.7137255, 1,
-0.159814, -0.9920263, -4.660245, 0, 1, 0.7176471, 1,
-0.1566439, -0.484049, -3.583556, 0, 1, 0.7254902, 1,
-0.1523352, 1.04402, -1.344545, 0, 1, 0.7294118, 1,
-0.1489088, -0.3350046, -3.88746, 0, 1, 0.7372549, 1,
-0.1482505, -1.08642, -3.010301, 0, 1, 0.7411765, 1,
-0.1462362, -0.2508355, -1.303966, 0, 1, 0.7490196, 1,
-0.1441758, -0.743041, -4.072091, 0, 1, 0.7529412, 1,
-0.14355, 1.419101, 1.6156, 0, 1, 0.7607843, 1,
-0.1427029, -0.8958288, -3.227461, 0, 1, 0.7647059, 1,
-0.1420266, 0.4817163, -0.8201861, 0, 1, 0.772549, 1,
-0.140963, 0.7310825, -1.196707, 0, 1, 0.7764706, 1,
-0.1380506, 0.02516481, -2.083082, 0, 1, 0.7843137, 1,
-0.1372796, 0.1229519, -3.516931, 0, 1, 0.7882353, 1,
-0.1353909, -1.177753, -1.430368, 0, 1, 0.7960784, 1,
-0.1345396, -0.005141458, -0.8420785, 0, 1, 0.8039216, 1,
-0.1323027, -1.623959, -3.60103, 0, 1, 0.8078431, 1,
-0.1307909, -1.052753, -4.454976, 0, 1, 0.8156863, 1,
-0.1251168, 2.728058, 1.215915, 0, 1, 0.8196079, 1,
-0.1228272, 0.5332745, 0.1525382, 0, 1, 0.827451, 1,
-0.1206635, -0.02866548, -1.437775, 0, 1, 0.8313726, 1,
-0.1204619, 0.714594, -1.505128, 0, 1, 0.8392157, 1,
-0.1198075, 0.6233646, -0.7459842, 0, 1, 0.8431373, 1,
-0.1079421, 0.1291695, -0.01322639, 0, 1, 0.8509804, 1,
-0.1042206, -0.2187275, -2.298843, 0, 1, 0.854902, 1,
-0.1019533, 0.4903837, 1.471174, 0, 1, 0.8627451, 1,
-0.0986544, -2.486918, -3.813603, 0, 1, 0.8666667, 1,
-0.09828235, 1.304367, -0.08364258, 0, 1, 0.8745098, 1,
-0.09532636, 0.9206136, -0.7884694, 0, 1, 0.8784314, 1,
-0.09391733, -1.377535, -3.354819, 0, 1, 0.8862745, 1,
-0.08907648, 0.4298873, 0.9311305, 0, 1, 0.8901961, 1,
-0.08776329, 1.219427, 2.720688, 0, 1, 0.8980392, 1,
-0.08751338, 1.080099, 0.6348231, 0, 1, 0.9058824, 1,
-0.0842391, -1.191526, -5.026391, 0, 1, 0.9098039, 1,
-0.08386325, -0.1361902, -1.446292, 0, 1, 0.9176471, 1,
-0.08308456, -0.2388022, -2.459902, 0, 1, 0.9215686, 1,
-0.08041301, 0.1215671, 0.5955355, 0, 1, 0.9294118, 1,
-0.08024082, -0.2715185, -1.359847, 0, 1, 0.9333333, 1,
-0.07267072, 0.03345041, -2.315742, 0, 1, 0.9411765, 1,
-0.0669634, 0.5347801, -1.150312, 0, 1, 0.945098, 1,
-0.06432138, -0.604936, -2.627284, 0, 1, 0.9529412, 1,
-0.06325205, 0.5006808, 1.426758, 0, 1, 0.9568627, 1,
-0.06281549, 0.1238272, 0.4786353, 0, 1, 0.9647059, 1,
-0.05642482, -1.606309, -4.669317, 0, 1, 0.9686275, 1,
-0.05464469, 0.9009283, 0.3603885, 0, 1, 0.9764706, 1,
-0.05254634, 0.9011404, -0.366002, 0, 1, 0.9803922, 1,
-0.05224031, -1.138001, -4.556999, 0, 1, 0.9882353, 1,
-0.05156885, -0.6588057, -2.180619, 0, 1, 0.9921569, 1,
-0.04866249, 0.5481537, 0.6010548, 0, 1, 1, 1,
-0.0479622, 0.3144417, 0.2785399, 0, 0.9921569, 1, 1,
-0.046405, 0.4732029, 0.3467984, 0, 0.9882353, 1, 1,
-0.04246083, -0.8104703, -2.156794, 0, 0.9803922, 1, 1,
-0.03993909, -0.7486482, -1.531255, 0, 0.9764706, 1, 1,
-0.0382576, 2.316925, 0.9843686, 0, 0.9686275, 1, 1,
-0.03641398, 0.07298508, -0.1508323, 0, 0.9647059, 1, 1,
-0.03069644, 1.1672, 0.2578925, 0, 0.9568627, 1, 1,
-0.03066548, -0.3387288, -4.611327, 0, 0.9529412, 1, 1,
-0.03057842, -1.765655, -2.381617, 0, 0.945098, 1, 1,
-0.01494871, -2.122, -2.907784, 0, 0.9411765, 1, 1,
-0.007982308, 0.4437969, 0.6529478, 0, 0.9333333, 1, 1,
-0.006493285, 0.0860418, -0.6443115, 0, 0.9294118, 1, 1,
-0.006203238, -0.6882748, -2.935256, 0, 0.9215686, 1, 1,
-0.002998431, 0.01713415, 2.015589, 0, 0.9176471, 1, 1,
-0.001465159, -1.009619, -3.156255, 0, 0.9098039, 1, 1,
0.001971552, 0.7169428, -0.1548396, 0, 0.9058824, 1, 1,
0.002583836, -0.3270241, 2.38796, 0, 0.8980392, 1, 1,
0.006019454, 0.2346874, 0.7738222, 0, 0.8901961, 1, 1,
0.007116746, -1.06221, 2.940614, 0, 0.8862745, 1, 1,
0.01037419, -0.7736768, 2.439636, 0, 0.8784314, 1, 1,
0.01369921, -0.08916789, 3.288186, 0, 0.8745098, 1, 1,
0.02311086, -0.2861511, 5.315029, 0, 0.8666667, 1, 1,
0.02931795, 1.522998, -1.059844, 0, 0.8627451, 1, 1,
0.03437011, -1.468239, 4.17823, 0, 0.854902, 1, 1,
0.03667488, -0.12456, 1.245499, 0, 0.8509804, 1, 1,
0.0373266, -2.199872, 2.041782, 0, 0.8431373, 1, 1,
0.0396456, -0.7374781, 2.333744, 0, 0.8392157, 1, 1,
0.03968113, -0.4104176, 4.142112, 0, 0.8313726, 1, 1,
0.04367052, -0.2441413, 4.487849, 0, 0.827451, 1, 1,
0.05215033, 0.1013813, -1.003167, 0, 0.8196079, 1, 1,
0.05700607, 0.5775084, -1.396398, 0, 0.8156863, 1, 1,
0.05875261, -0.9578798, 3.974842, 0, 0.8078431, 1, 1,
0.06282036, 1.321643, -2.303327, 0, 0.8039216, 1, 1,
0.06538533, 0.8543965, -1.509779, 0, 0.7960784, 1, 1,
0.06984801, -0.4666343, 3.353702, 0, 0.7882353, 1, 1,
0.07366906, -1.26432, 2.191457, 0, 0.7843137, 1, 1,
0.07819438, 0.05508373, 0.6535667, 0, 0.7764706, 1, 1,
0.07840769, 1.330134, -0.2120619, 0, 0.772549, 1, 1,
0.08097617, -0.2958951, 1.425021, 0, 0.7647059, 1, 1,
0.08266452, -0.8709917, 2.844899, 0, 0.7607843, 1, 1,
0.08454276, 0.7260221, -0.5730775, 0, 0.7529412, 1, 1,
0.08831013, -1.120985, 4.405937, 0, 0.7490196, 1, 1,
0.09452581, 0.335368, 1.143204, 0, 0.7411765, 1, 1,
0.09504613, -0.2463628, 1.547557, 0, 0.7372549, 1, 1,
0.09543316, -0.8962231, 3.774486, 0, 0.7294118, 1, 1,
0.09990643, 0.2376913, -0.4671434, 0, 0.7254902, 1, 1,
0.1034203, -0.6341664, 3.896825, 0, 0.7176471, 1, 1,
0.1118773, -0.08545249, 1.474464, 0, 0.7137255, 1, 1,
0.118527, -1.108059, 3.011984, 0, 0.7058824, 1, 1,
0.1207485, -0.4040715, 1.063891, 0, 0.6980392, 1, 1,
0.1234525, -0.5719314, 1.165306, 0, 0.6941177, 1, 1,
0.1241534, -0.2690794, 3.777953, 0, 0.6862745, 1, 1,
0.1251528, 0.5584416, -0.1284988, 0, 0.682353, 1, 1,
0.1287185, 1.224431, 0.5626854, 0, 0.6745098, 1, 1,
0.129382, 1.053545, -1.340507, 0, 0.6705883, 1, 1,
0.1326634, -0.2405364, 2.323555, 0, 0.6627451, 1, 1,
0.1361231, -1.053464, 5.802306, 0, 0.6588235, 1, 1,
0.136873, 0.618488, 1.108781, 0, 0.6509804, 1, 1,
0.1386428, 0.2042068, 1.240674, 0, 0.6470588, 1, 1,
0.1427184, 1.014264, 2.156221, 0, 0.6392157, 1, 1,
0.1444088, 1.838384, -0.7627079, 0, 0.6352941, 1, 1,
0.1466273, 0.2050686, 0.2731669, 0, 0.627451, 1, 1,
0.1486253, -0.6913384, 5.893373, 0, 0.6235294, 1, 1,
0.1507813, 0.1742912, -0.6228454, 0, 0.6156863, 1, 1,
0.1517091, 2.952963, -1.008092, 0, 0.6117647, 1, 1,
0.1524953, -0.2091814, 2.901642, 0, 0.6039216, 1, 1,
0.1531184, 0.306013, 0.2645234, 0, 0.5960785, 1, 1,
0.1537883, 0.5645334, -1.405998, 0, 0.5921569, 1, 1,
0.1556863, 0.1477658, -0.5264216, 0, 0.5843138, 1, 1,
0.1558427, -0.1713686, 1.49172, 0, 0.5803922, 1, 1,
0.1559038, -0.3001307, 4.085467, 0, 0.572549, 1, 1,
0.1609622, -0.1847177, 3.49236, 0, 0.5686275, 1, 1,
0.1614683, -1.154048, 4.756568, 0, 0.5607843, 1, 1,
0.1673305, -0.3606472, 2.195698, 0, 0.5568628, 1, 1,
0.170901, 0.104124, 1.356762, 0, 0.5490196, 1, 1,
0.1716276, 0.09352576, 0.7084664, 0, 0.5450981, 1, 1,
0.1749233, -1.588647, 2.783932, 0, 0.5372549, 1, 1,
0.1831423, -0.3584559, 2.995452, 0, 0.5333334, 1, 1,
0.187519, -0.01781086, 1.248243, 0, 0.5254902, 1, 1,
0.1894695, 0.3463416, 1.405206, 0, 0.5215687, 1, 1,
0.1981105, 1.256009, 1.262145, 0, 0.5137255, 1, 1,
0.198323, 1.47221, 1.069207, 0, 0.509804, 1, 1,
0.2009507, 1.11, -0.5991338, 0, 0.5019608, 1, 1,
0.2042408, -1.575644, 3.177716, 0, 0.4941176, 1, 1,
0.2043808, -0.5641701, 2.182945, 0, 0.4901961, 1, 1,
0.2049087, 0.09628479, 2.44385, 0, 0.4823529, 1, 1,
0.2095674, 0.7079531, 0.2693382, 0, 0.4784314, 1, 1,
0.2129684, -0.1712091, 1.76951, 0, 0.4705882, 1, 1,
0.219465, -0.2994224, 2.86097, 0, 0.4666667, 1, 1,
0.2198101, 1.458299, 0.6051753, 0, 0.4588235, 1, 1,
0.2209605, -0.5579979, 3.025657, 0, 0.454902, 1, 1,
0.2247776, -0.5584084, 2.31601, 0, 0.4470588, 1, 1,
0.2255734, 0.2322612, -0.2815253, 0, 0.4431373, 1, 1,
0.2261, 0.7866731, 0.7328656, 0, 0.4352941, 1, 1,
0.2275464, 1.467631, 0.09341706, 0, 0.4313726, 1, 1,
0.2416515, 0.7217587, 1.506101, 0, 0.4235294, 1, 1,
0.2541757, -0.8747839, 3.848015, 0, 0.4196078, 1, 1,
0.256777, -0.4672422, 3.197159, 0, 0.4117647, 1, 1,
0.2579251, 0.2779528, 0.5589828, 0, 0.4078431, 1, 1,
0.2583612, 1.872183, -0.3546487, 0, 0.4, 1, 1,
0.2587227, -1.696034, 4.444594, 0, 0.3921569, 1, 1,
0.2609311, 0.7691113, 0.9062121, 0, 0.3882353, 1, 1,
0.2622631, -1.823679, 2.264993, 0, 0.3803922, 1, 1,
0.2625345, -1.721412, 2.637726, 0, 0.3764706, 1, 1,
0.2656597, 1.053393, 0.4448882, 0, 0.3686275, 1, 1,
0.2707498, 1.04652, -1.224352, 0, 0.3647059, 1, 1,
0.2782538, 0.1803567, 0.169893, 0, 0.3568628, 1, 1,
0.2786737, 0.3004846, 0.5208938, 0, 0.3529412, 1, 1,
0.2797218, 1.112646, -0.6083511, 0, 0.345098, 1, 1,
0.280137, 1.723772, 0.8764554, 0, 0.3411765, 1, 1,
0.2804528, -1.438868, 2.892583, 0, 0.3333333, 1, 1,
0.2853851, 0.5659966, 1.00834, 0, 0.3294118, 1, 1,
0.2866019, -0.4635366, 3.096399, 0, 0.3215686, 1, 1,
0.2882843, -0.04572422, 3.275779, 0, 0.3176471, 1, 1,
0.2964085, 1.272727, 0.1060295, 0, 0.3098039, 1, 1,
0.2996663, -0.6637791, 3.976248, 0, 0.3058824, 1, 1,
0.3020426, -0.01630405, 0.6343136, 0, 0.2980392, 1, 1,
0.3049255, -1.191424, 4.376026, 0, 0.2901961, 1, 1,
0.3131199, 0.817824, -0.3166343, 0, 0.2862745, 1, 1,
0.3142197, -0.3269143, 2.739318, 0, 0.2784314, 1, 1,
0.3146956, 0.3023832, 0.2195894, 0, 0.2745098, 1, 1,
0.316666, 0.3919071, 1.450373, 0, 0.2666667, 1, 1,
0.318723, 0.1214599, -1.026497, 0, 0.2627451, 1, 1,
0.3256646, 0.5093857, 0.839367, 0, 0.254902, 1, 1,
0.3267678, 2.319043, 2.207305, 0, 0.2509804, 1, 1,
0.3303212, -0.5544084, 1.953534, 0, 0.2431373, 1, 1,
0.3331342, 1.272647, 1.13111, 0, 0.2392157, 1, 1,
0.3351682, 0.2009985, 0.7636406, 0, 0.2313726, 1, 1,
0.3378254, -0.5846289, 2.32707, 0, 0.227451, 1, 1,
0.3460164, -0.4345111, 4.172535, 0, 0.2196078, 1, 1,
0.3470988, -1.312423, 1.566156, 0, 0.2156863, 1, 1,
0.3497265, -1.592773, 3.589236, 0, 0.2078431, 1, 1,
0.3505364, 0.6021762, 1.239511, 0, 0.2039216, 1, 1,
0.3511382, 0.249039, -0.06766699, 0, 0.1960784, 1, 1,
0.3538585, 2.051456, -0.6545944, 0, 0.1882353, 1, 1,
0.3572067, -1.93474, 3.964491, 0, 0.1843137, 1, 1,
0.3586816, -1.403043, 2.723589, 0, 0.1764706, 1, 1,
0.3593905, -0.8014505, 3.124801, 0, 0.172549, 1, 1,
0.3623258, -1.761495, 2.241842, 0, 0.1647059, 1, 1,
0.364358, -0.08422931, 2.415178, 0, 0.1607843, 1, 1,
0.3685931, 0.1022359, 0.2667122, 0, 0.1529412, 1, 1,
0.3691088, 0.5129082, 0.3106399, 0, 0.1490196, 1, 1,
0.3748148, 0.562776, 3.167697, 0, 0.1411765, 1, 1,
0.3748754, 1.581771, 1.477755, 0, 0.1372549, 1, 1,
0.382503, 0.2230152, 1.53781, 0, 0.1294118, 1, 1,
0.3848636, -0.6363755, 2.641328, 0, 0.1254902, 1, 1,
0.3849162, -1.16748, 2.776992, 0, 0.1176471, 1, 1,
0.3888137, -0.535816, 2.340194, 0, 0.1137255, 1, 1,
0.3961734, -0.7960779, 3.825008, 0, 0.1058824, 1, 1,
0.3970197, 0.4762991, 1.432977, 0, 0.09803922, 1, 1,
0.4012985, 0.7079968, 1.147399, 0, 0.09411765, 1, 1,
0.4035636, 0.3312975, 1.256323, 0, 0.08627451, 1, 1,
0.4082782, -0.4697847, 4.348543, 0, 0.08235294, 1, 1,
0.4085839, -0.749964, 3.041093, 0, 0.07450981, 1, 1,
0.4141071, -0.5467339, 2.629211, 0, 0.07058824, 1, 1,
0.4159914, 0.8766169, 1.452657, 0, 0.0627451, 1, 1,
0.4170959, 0.7598421, -0.3603838, 0, 0.05882353, 1, 1,
0.4195214, 0.2095144, 0.3241675, 0, 0.05098039, 1, 1,
0.4266683, 0.5218045, 0.299674, 0, 0.04705882, 1, 1,
0.4268682, 0.0602749, 0.8813283, 0, 0.03921569, 1, 1,
0.4271294, -1.204245, 2.534354, 0, 0.03529412, 1, 1,
0.4314997, 0.3264693, 1.173365, 0, 0.02745098, 1, 1,
0.4328721, 0.06358538, -0.5825818, 0, 0.02352941, 1, 1,
0.4459066, 0.839199, -0.7150126, 0, 0.01568628, 1, 1,
0.4467393, 0.8066314, 1.376034, 0, 0.01176471, 1, 1,
0.4474248, -0.228917, 1.998534, 0, 0.003921569, 1, 1,
0.4482218, -0.3438996, 1.721942, 0.003921569, 0, 1, 1,
0.4487102, 1.779765, -0.200605, 0.007843138, 0, 1, 1,
0.4492662, 1.144097, 1.658151, 0.01568628, 0, 1, 1,
0.4496601, 0.0634644, 0.3206218, 0.01960784, 0, 1, 1,
0.4509092, 1.361233, 0.3545372, 0.02745098, 0, 1, 1,
0.4525153, -1.199813, 1.922847, 0.03137255, 0, 1, 1,
0.4531361, -0.07166749, 1.45976, 0.03921569, 0, 1, 1,
0.4535703, -0.140411, 3.117781, 0.04313726, 0, 1, 1,
0.4574822, -0.3378835, 2.435433, 0.05098039, 0, 1, 1,
0.4578706, 0.2218823, 1.708161, 0.05490196, 0, 1, 1,
0.4611573, 0.5559659, -1.017345, 0.0627451, 0, 1, 1,
0.4613023, 0.08190944, 1.921102, 0.06666667, 0, 1, 1,
0.4630615, -1.466329, 1.656234, 0.07450981, 0, 1, 1,
0.471691, 0.3285315, 0.4811757, 0.07843138, 0, 1, 1,
0.4833573, -0.7105417, 1.506256, 0.08627451, 0, 1, 1,
0.4834878, -0.4368064, 0.3617264, 0.09019608, 0, 1, 1,
0.4838488, 0.9407088, 3.051584, 0.09803922, 0, 1, 1,
0.4838659, 1.518054, 0.6848121, 0.1058824, 0, 1, 1,
0.4851006, -0.4909843, 3.52793, 0.1098039, 0, 1, 1,
0.4855247, -0.6680272, 3.24378, 0.1176471, 0, 1, 1,
0.4855287, -0.2631814, 2.53018, 0.1215686, 0, 1, 1,
0.4855509, -0.3909856, 4.204891, 0.1294118, 0, 1, 1,
0.4865347, -0.334298, 4.285615, 0.1333333, 0, 1, 1,
0.4874811, 1.298887, 0.3038817, 0.1411765, 0, 1, 1,
0.4879458, -0.8930134, 3.140745, 0.145098, 0, 1, 1,
0.4927884, -0.690296, 2.572089, 0.1529412, 0, 1, 1,
0.4967237, 0.1238621, 0.2597548, 0.1568628, 0, 1, 1,
0.4991547, 0.6911822, 2.689884, 0.1647059, 0, 1, 1,
0.4991729, 0.5028681, 0.4389379, 0.1686275, 0, 1, 1,
0.4996718, -0.1267959, 1.850636, 0.1764706, 0, 1, 1,
0.5007348, 2.12427, 0.2533388, 0.1803922, 0, 1, 1,
0.5009369, 2.666407, 0.7644868, 0.1882353, 0, 1, 1,
0.5015477, -0.1848854, 2.56879, 0.1921569, 0, 1, 1,
0.5025337, -0.1411247, 2.460209, 0.2, 0, 1, 1,
0.5160487, -1.856433, 1.907389, 0.2078431, 0, 1, 1,
0.5199552, 0.343729, 0.3185377, 0.2117647, 0, 1, 1,
0.5216379, -0.1803608, 0.1876066, 0.2196078, 0, 1, 1,
0.5227891, 1.609826, 0.6061594, 0.2235294, 0, 1, 1,
0.5258884, 1.312708, 0.6156443, 0.2313726, 0, 1, 1,
0.5263603, 1.713645, 1.199318, 0.2352941, 0, 1, 1,
0.5312728, -0.4715234, 2.04463, 0.2431373, 0, 1, 1,
0.5317544, 0.2401333, 1.414945, 0.2470588, 0, 1, 1,
0.5322016, 0.7458366, 0.5841273, 0.254902, 0, 1, 1,
0.5347031, 0.8554273, -1.14708, 0.2588235, 0, 1, 1,
0.5347823, -2.561247, 4.063758, 0.2666667, 0, 1, 1,
0.5413189, 0.2831296, 0.302828, 0.2705882, 0, 1, 1,
0.5414154, -1.231474, 1.711909, 0.2784314, 0, 1, 1,
0.5439345, 1.656982, -0.09199464, 0.282353, 0, 1, 1,
0.5476983, 0.4695009, -0.6436414, 0.2901961, 0, 1, 1,
0.5484611, 1.929894, 0.02742573, 0.2941177, 0, 1, 1,
0.5582217, 0.9023179, 0.4460315, 0.3019608, 0, 1, 1,
0.559831, 0.1743916, 2.370249, 0.3098039, 0, 1, 1,
0.5609309, -0.4417809, 2.921948, 0.3137255, 0, 1, 1,
0.5628349, 0.278577, 0.5653417, 0.3215686, 0, 1, 1,
0.5631006, -1.237157, 3.099523, 0.3254902, 0, 1, 1,
0.5640246, -1.040319, 1.547726, 0.3333333, 0, 1, 1,
0.567364, -1.365927, 3.865945, 0.3372549, 0, 1, 1,
0.5692563, 0.2815461, 0.7871045, 0.345098, 0, 1, 1,
0.5695989, 0.1163633, 0.4342915, 0.3490196, 0, 1, 1,
0.5778806, -0.02720941, 2.861748, 0.3568628, 0, 1, 1,
0.5791651, -0.405148, 2.784218, 0.3607843, 0, 1, 1,
0.5793532, -0.9055408, 3.302214, 0.3686275, 0, 1, 1,
0.5839063, 0.3642251, 1.16007, 0.372549, 0, 1, 1,
0.585142, 1.43895, 0.2496589, 0.3803922, 0, 1, 1,
0.5924092, 0.2316607, 1.122255, 0.3843137, 0, 1, 1,
0.5983596, -0.5439466, 3.221836, 0.3921569, 0, 1, 1,
0.5988631, -2.016876, 4.081821, 0.3960784, 0, 1, 1,
0.5989481, 1.289946, 0.9403653, 0.4039216, 0, 1, 1,
0.5992593, 1.82399, 0.755311, 0.4117647, 0, 1, 1,
0.599363, 0.08632431, 1.72308, 0.4156863, 0, 1, 1,
0.6008165, -0.2729236, 0.3264169, 0.4235294, 0, 1, 1,
0.601321, -0.4879457, 2.016576, 0.427451, 0, 1, 1,
0.603344, -0.05744068, 0.8119491, 0.4352941, 0, 1, 1,
0.6034149, 0.07513652, 2.082211, 0.4392157, 0, 1, 1,
0.6073017, 1.195733, 0.7876941, 0.4470588, 0, 1, 1,
0.6119685, -1.547552, 3.152503, 0.4509804, 0, 1, 1,
0.6128219, -0.6607202, 3.452508, 0.4588235, 0, 1, 1,
0.6149312, -0.1273163, 0.9492454, 0.4627451, 0, 1, 1,
0.619947, -0.2292025, 1.62351, 0.4705882, 0, 1, 1,
0.6323913, -0.1093589, 2.095578, 0.4745098, 0, 1, 1,
0.6401684, 1.130065, 1.311351, 0.4823529, 0, 1, 1,
0.6433706, -0.3286241, 0.6094064, 0.4862745, 0, 1, 1,
0.645355, 2.055298, -1.626428, 0.4941176, 0, 1, 1,
0.6474283, -0.1443981, 2.321394, 0.5019608, 0, 1, 1,
0.6477253, -1.644791, 2.479808, 0.5058824, 0, 1, 1,
0.6492674, 0.06500259, 0.2079416, 0.5137255, 0, 1, 1,
0.6525785, 1.149206, 0.1009198, 0.5176471, 0, 1, 1,
0.6531463, 0.8812725, 1.498807, 0.5254902, 0, 1, 1,
0.654129, 0.4136502, 0.1423763, 0.5294118, 0, 1, 1,
0.6594664, -0.6922731, 1.861703, 0.5372549, 0, 1, 1,
0.6596425, 1.647969, 1.772428, 0.5411765, 0, 1, 1,
0.660743, -1.453911, 4.303036, 0.5490196, 0, 1, 1,
0.6633797, 0.03233225, 2.328777, 0.5529412, 0, 1, 1,
0.6640509, 0.4459019, 1.290778, 0.5607843, 0, 1, 1,
0.6646845, 0.04774444, 3.085676, 0.5647059, 0, 1, 1,
0.6648988, -0.3872243, 1.752348, 0.572549, 0, 1, 1,
0.6726515, 0.7236449, 0.3115996, 0.5764706, 0, 1, 1,
0.6729332, 0.3886218, 1.658747, 0.5843138, 0, 1, 1,
0.6734725, -0.392178, 2.024749, 0.5882353, 0, 1, 1,
0.676407, 1.132314, 1.814763, 0.5960785, 0, 1, 1,
0.6777977, 2.458257, -0.3828994, 0.6039216, 0, 1, 1,
0.6858144, -0.8399001, 3.055378, 0.6078432, 0, 1, 1,
0.6919764, 0.5502772, -1.375543, 0.6156863, 0, 1, 1,
0.6929198, -1.210111, 2.829119, 0.6196079, 0, 1, 1,
0.7023067, -0.7641522, 3.421933, 0.627451, 0, 1, 1,
0.7099012, 1.026867, 2.081294, 0.6313726, 0, 1, 1,
0.7108599, -0.7574754, 4.026841, 0.6392157, 0, 1, 1,
0.7109497, 0.8899044, 0.2970287, 0.6431373, 0, 1, 1,
0.7110869, -1.001961, 3.050228, 0.6509804, 0, 1, 1,
0.7209954, -0.3291946, 2.390352, 0.654902, 0, 1, 1,
0.7279729, 1.751372, 1.096528, 0.6627451, 0, 1, 1,
0.7330027, 0.4706115, 0.869541, 0.6666667, 0, 1, 1,
0.7358131, -1.201891, 2.950596, 0.6745098, 0, 1, 1,
0.7404549, 0.9504927, 2.273529, 0.6784314, 0, 1, 1,
0.7463821, -0.4311826, 2.473849, 0.6862745, 0, 1, 1,
0.7556074, -0.3058278, 4.512705, 0.6901961, 0, 1, 1,
0.7568975, 0.4392042, 1.308639, 0.6980392, 0, 1, 1,
0.7633684, -0.6062607, 1.750727, 0.7058824, 0, 1, 1,
0.7638127, 2.234418, 0.9381421, 0.7098039, 0, 1, 1,
0.7668945, 1.03232, -0.6357905, 0.7176471, 0, 1, 1,
0.7713305, 0.7146538, 1.003696, 0.7215686, 0, 1, 1,
0.7720095, 0.6580918, 1.600556, 0.7294118, 0, 1, 1,
0.7733555, -0.1014898, 0.7047352, 0.7333333, 0, 1, 1,
0.7747495, 0.2081613, 0.1335139, 0.7411765, 0, 1, 1,
0.7790499, -0.1984866, 3.405182, 0.7450981, 0, 1, 1,
0.7793986, 0.4845421, 1.806638, 0.7529412, 0, 1, 1,
0.7826026, -0.4495924, 2.557219, 0.7568628, 0, 1, 1,
0.7847394, -1.319985, 3.147115, 0.7647059, 0, 1, 1,
0.7855336, 0.8696978, 2.290783, 0.7686275, 0, 1, 1,
0.7862335, 2.641644, 2.063607, 0.7764706, 0, 1, 1,
0.7871367, 1.903814, 0.06546022, 0.7803922, 0, 1, 1,
0.7917458, 0.6111735, 0.5225963, 0.7882353, 0, 1, 1,
0.7919862, 0.08926638, 2.358197, 0.7921569, 0, 1, 1,
0.7991254, -0.6025525, 2.715288, 0.8, 0, 1, 1,
0.8095362, -1.284721, 0.1893686, 0.8078431, 0, 1, 1,
0.8120886, -0.05758683, 1.712941, 0.8117647, 0, 1, 1,
0.818099, 0.6158326, -0.1478409, 0.8196079, 0, 1, 1,
0.8196161, 0.8789406, -0.3869354, 0.8235294, 0, 1, 1,
0.8307392, -1.354666, 2.119118, 0.8313726, 0, 1, 1,
0.8351447, -0.7157062, 1.128591, 0.8352941, 0, 1, 1,
0.8366411, -0.7449243, 3.089765, 0.8431373, 0, 1, 1,
0.8370253, 0.2387395, 2.325072, 0.8470588, 0, 1, 1,
0.8375278, 2.597018, 0.5538133, 0.854902, 0, 1, 1,
0.8384804, 0.2924012, 2.322883, 0.8588235, 0, 1, 1,
0.8503047, -0.1594839, 1.11437, 0.8666667, 0, 1, 1,
0.8597058, 2.067912, 0.02730428, 0.8705882, 0, 1, 1,
0.8643629, 0.9289526, 0.2878802, 0.8784314, 0, 1, 1,
0.877046, -1.315482, 1.664615, 0.8823529, 0, 1, 1,
0.8936208, -0.2090665, 1.064375, 0.8901961, 0, 1, 1,
0.8940281, -0.0883964, 1.506416, 0.8941177, 0, 1, 1,
0.899536, -0.9570115, 1.870703, 0.9019608, 0, 1, 1,
0.9018533, -0.2069377, 0.7593349, 0.9098039, 0, 1, 1,
0.9079115, 0.4447199, -0.2085359, 0.9137255, 0, 1, 1,
0.9085718, -0.5406755, 3.206355, 0.9215686, 0, 1, 1,
0.9089336, -0.5244827, 2.694767, 0.9254902, 0, 1, 1,
0.9089425, 0.05195893, -0.05183432, 0.9333333, 0, 1, 1,
0.9095395, 0.3327103, 2.110217, 0.9372549, 0, 1, 1,
0.9140666, 0.4266608, 1.061648, 0.945098, 0, 1, 1,
0.9152896, -0.1659158, 1.849792, 0.9490196, 0, 1, 1,
0.9202091, -0.3303442, 1.484188, 0.9568627, 0, 1, 1,
0.9203488, -1.529652, 1.148767, 0.9607843, 0, 1, 1,
0.9206415, -0.7287455, -0.2149314, 0.9686275, 0, 1, 1,
0.9219657, -0.6122398, 3.032207, 0.972549, 0, 1, 1,
0.9229676, -0.8975194, 0.8083375, 0.9803922, 0, 1, 1,
0.9239351, 0.2296905, -0.4345294, 0.9843137, 0, 1, 1,
0.9279538, -0.1846578, 3.030993, 0.9921569, 0, 1, 1,
0.9313952, -2.108212, 1.330951, 0.9960784, 0, 1, 1,
0.9354587, 0.7298199, 1.227929, 1, 0, 0.9960784, 1,
0.9357238, -1.26352, 3.482327, 1, 0, 0.9882353, 1,
0.9408068, -0.3464178, 0.9425644, 1, 0, 0.9843137, 1,
0.9596331, -0.9448019, 1.80002, 1, 0, 0.9764706, 1,
0.9603621, -0.7593394, 1.638001, 1, 0, 0.972549, 1,
0.965075, 0.4943992, 3.144125, 1, 0, 0.9647059, 1,
0.9666741, 0.3336741, 1.833899, 1, 0, 0.9607843, 1,
0.9690116, -0.03593627, 1.066934, 1, 0, 0.9529412, 1,
0.9764525, 0.2409746, 1.036172, 1, 0, 0.9490196, 1,
0.9767433, -0.590504, 3.244939, 1, 0, 0.9411765, 1,
0.9807196, 0.2546317, 0.2718042, 1, 0, 0.9372549, 1,
0.986656, 0.6079023, 0.6883379, 1, 0, 0.9294118, 1,
0.9947152, 0.1588978, -0.6073779, 1, 0, 0.9254902, 1,
0.998584, -1.416943, 1.113698, 1, 0, 0.9176471, 1,
0.9987279, -2.07604, 1.427833, 1, 0, 0.9137255, 1,
0.9992123, 0.7678139, 1.898655, 1, 0, 0.9058824, 1,
1.002346, -1.387578, 3.055724, 1, 0, 0.9019608, 1,
1.005374, 0.01458157, 3.011249, 1, 0, 0.8941177, 1,
1.008085, -0.4253846, 0.286761, 1, 0, 0.8862745, 1,
1.018989, -0.2296975, 3.034006, 1, 0, 0.8823529, 1,
1.02065, 0.7585796, 0.7854189, 1, 0, 0.8745098, 1,
1.021807, 0.9349881, 3.148214, 1, 0, 0.8705882, 1,
1.030941, -0.5068626, 1.993119, 1, 0, 0.8627451, 1,
1.03419, -0.8791462, 0.09129415, 1, 0, 0.8588235, 1,
1.039208, 0.8127032, -0.8278633, 1, 0, 0.8509804, 1,
1.048087, 1.696155, 0.6023335, 1, 0, 0.8470588, 1,
1.051756, -0.4845041, 2.989419, 1, 0, 0.8392157, 1,
1.055874, -0.4405053, 2.13427, 1, 0, 0.8352941, 1,
1.056895, 1.063355, 1.280974, 1, 0, 0.827451, 1,
1.063386, -1.260411, 2.05508, 1, 0, 0.8235294, 1,
1.064413, -1.399861, 4.139734, 1, 0, 0.8156863, 1,
1.064729, 1.361864, 0.4127371, 1, 0, 0.8117647, 1,
1.076664, 0.30199, 1.399048, 1, 0, 0.8039216, 1,
1.083815, 0.09278537, 1.527028, 1, 0, 0.7960784, 1,
1.086073, -0.77812, 3.705652, 1, 0, 0.7921569, 1,
1.08611, -1.139572, 4.446756, 1, 0, 0.7843137, 1,
1.086686, -0.3930539, 1.705933, 1, 0, 0.7803922, 1,
1.088831, 0.5136415, 0.4831626, 1, 0, 0.772549, 1,
1.095698, 0.537301, 1.439352, 1, 0, 0.7686275, 1,
1.106042, 0.2698754, 0.6918184, 1, 0, 0.7607843, 1,
1.106749, 0.0714941, 2.818196, 1, 0, 0.7568628, 1,
1.114455, 1.109619, 1.552024, 1, 0, 0.7490196, 1,
1.1349, -0.6082859, 3.234813, 1, 0, 0.7450981, 1,
1.140989, 0.9825845, 0.8648892, 1, 0, 0.7372549, 1,
1.14747, -1.959336, 3.874174, 1, 0, 0.7333333, 1,
1.14805, 0.9028922, 2.90627, 1, 0, 0.7254902, 1,
1.152724, -0.316296, 2.512733, 1, 0, 0.7215686, 1,
1.159282, -1.155263, 0.7332297, 1, 0, 0.7137255, 1,
1.167348, 1.253147, -0.1804295, 1, 0, 0.7098039, 1,
1.179908, 0.7527053, 1.773778, 1, 0, 0.7019608, 1,
1.183608, -1.264959, 0.7784144, 1, 0, 0.6941177, 1,
1.188343, 0.6598465, 1.876486, 1, 0, 0.6901961, 1,
1.192127, -0.9497414, 1.813531, 1, 0, 0.682353, 1,
1.197838, 1.119107, 0.1669014, 1, 0, 0.6784314, 1,
1.199407, 1.151287, 1.283017, 1, 0, 0.6705883, 1,
1.206284, -0.5916654, 2.249197, 1, 0, 0.6666667, 1,
1.213673, 1.020893, 2.154439, 1, 0, 0.6588235, 1,
1.222276, 0.7949079, 1.262034, 1, 0, 0.654902, 1,
1.229193, 2.03248, 1.552075, 1, 0, 0.6470588, 1,
1.239448, 0.3625788, 1.244406, 1, 0, 0.6431373, 1,
1.241544, 0.09189478, 0.03277309, 1, 0, 0.6352941, 1,
1.252219, 0.6185025, 0.3520551, 1, 0, 0.6313726, 1,
1.252495, 0.7240064, 1.95717, 1, 0, 0.6235294, 1,
1.261888, -1.05545, 2.986973, 1, 0, 0.6196079, 1,
1.265071, -1.001273, 3.301414, 1, 0, 0.6117647, 1,
1.265795, 1.658387, -0.1185625, 1, 0, 0.6078432, 1,
1.265942, 0.06450289, 2.465145, 1, 0, 0.6, 1,
1.269856, 0.2605101, 1.941015, 1, 0, 0.5921569, 1,
1.271271, -0.5580714, 3.855849, 1, 0, 0.5882353, 1,
1.274532, -0.1578199, 1.76215, 1, 0, 0.5803922, 1,
1.276113, -1.356131, 2.660188, 1, 0, 0.5764706, 1,
1.277512, 1.13763, 0.9442251, 1, 0, 0.5686275, 1,
1.299295, -0.6167993, 1.335825, 1, 0, 0.5647059, 1,
1.309697, 0.2616535, 1.739728, 1, 0, 0.5568628, 1,
1.314476, 1.789774, 1.187841, 1, 0, 0.5529412, 1,
1.317108, 0.6232968, 3.226654, 1, 0, 0.5450981, 1,
1.322641, 1.35419, 0.760954, 1, 0, 0.5411765, 1,
1.329125, -0.8829532, 2.014133, 1, 0, 0.5333334, 1,
1.337738, -0.9475513, 1.600079, 1, 0, 0.5294118, 1,
1.342916, 1.478649, 1.67495, 1, 0, 0.5215687, 1,
1.34359, 0.5697315, -0.9207643, 1, 0, 0.5176471, 1,
1.35063, -0.2259426, 0.8372615, 1, 0, 0.509804, 1,
1.352505, -1.450757, 1.335019, 1, 0, 0.5058824, 1,
1.353151, 0.4293282, -1.195029, 1, 0, 0.4980392, 1,
1.362337, -0.1549877, 0.8179412, 1, 0, 0.4901961, 1,
1.36666, 0.1579823, 1.698408, 1, 0, 0.4862745, 1,
1.368045, 1.386356, 0.8396192, 1, 0, 0.4784314, 1,
1.368075, 1.4192, 1.806831, 1, 0, 0.4745098, 1,
1.368901, 0.4798747, 1.916108, 1, 0, 0.4666667, 1,
1.374314, -0.5247837, 1.085808, 1, 0, 0.4627451, 1,
1.376814, 1.699526, 1.205672, 1, 0, 0.454902, 1,
1.38248, 0.06858983, 1.74016, 1, 0, 0.4509804, 1,
1.382481, -1.583371, 3.104622, 1, 0, 0.4431373, 1,
1.391342, -1.607813, 2.301975, 1, 0, 0.4392157, 1,
1.397699, -0.8276017, 1.638215, 1, 0, 0.4313726, 1,
1.404397, 1.123765, 0.9474463, 1, 0, 0.427451, 1,
1.407538, 0.3754141, 1.439466, 1, 0, 0.4196078, 1,
1.414, 1.569088, 1.036852, 1, 0, 0.4156863, 1,
1.422585, 0.2472782, 1.447869, 1, 0, 0.4078431, 1,
1.423623, -0.5482864, 3.495663, 1, 0, 0.4039216, 1,
1.443622, -0.5164474, 1.665001, 1, 0, 0.3960784, 1,
1.455007, -0.4517505, 2.247759, 1, 0, 0.3882353, 1,
1.457769, 0.01903162, 1.2511, 1, 0, 0.3843137, 1,
1.467059, 0.3949366, 0.6150968, 1, 0, 0.3764706, 1,
1.469482, 0.1596151, 1.371587, 1, 0, 0.372549, 1,
1.476184, -0.6501056, 3.760161, 1, 0, 0.3647059, 1,
1.478682, -1.647558, 2.494834, 1, 0, 0.3607843, 1,
1.481852, -0.6634908, 1.866404, 1, 0, 0.3529412, 1,
1.515702, -0.9120844, 1.935184, 1, 0, 0.3490196, 1,
1.517928, 0.2942804, 1.560684, 1, 0, 0.3411765, 1,
1.526102, 0.7984358, 1.253069, 1, 0, 0.3372549, 1,
1.530453, -0.2633213, 0.7896765, 1, 0, 0.3294118, 1,
1.555909, -0.3784953, 1.958551, 1, 0, 0.3254902, 1,
1.555992, -0.02016982, 1.036517, 1, 0, 0.3176471, 1,
1.575611, 1.165307, 2.469846, 1, 0, 0.3137255, 1,
1.586072, 0.5645785, 0.9098195, 1, 0, 0.3058824, 1,
1.590622, -0.9531558, 4.235605, 1, 0, 0.2980392, 1,
1.600553, 1.554821, 1.611295, 1, 0, 0.2941177, 1,
1.603372, 1.548448, -1.85879, 1, 0, 0.2862745, 1,
1.631943, 1.32739, 0.6004645, 1, 0, 0.282353, 1,
1.637792, -2.006283, 1.387677, 1, 0, 0.2745098, 1,
1.656628, 0.03763782, 3.040141, 1, 0, 0.2705882, 1,
1.668187, -1.785372, 1.369489, 1, 0, 0.2627451, 1,
1.696335, -0.1067432, 0.1162492, 1, 0, 0.2588235, 1,
1.696936, -0.4748009, 0.8066971, 1, 0, 0.2509804, 1,
1.713027, 1.420802, 1.093429, 1, 0, 0.2470588, 1,
1.726974, 1.168872, -0.1731694, 1, 0, 0.2392157, 1,
1.756788, -0.5150495, 1.616822, 1, 0, 0.2352941, 1,
1.762082, 1.215274, 1.02754, 1, 0, 0.227451, 1,
1.762262, -1.45327, 1.576548, 1, 0, 0.2235294, 1,
1.777628, -0.8779602, 2.346593, 1, 0, 0.2156863, 1,
1.804281, -1.026414, -0.3743038, 1, 0, 0.2117647, 1,
1.811771, -0.1349966, 2.850214, 1, 0, 0.2039216, 1,
1.82138, 0.8689248, 0.9524185, 1, 0, 0.1960784, 1,
1.822067, 0.8772001, 2.040447, 1, 0, 0.1921569, 1,
1.834922, 0.7612062, 1.495989, 1, 0, 0.1843137, 1,
1.85675, 0.3781902, -0.2386196, 1, 0, 0.1803922, 1,
1.859667, -0.338655, 0.7265324, 1, 0, 0.172549, 1,
1.892487, 1.258142, -0.8870464, 1, 0, 0.1686275, 1,
1.894329, 0.4652172, 1.382403, 1, 0, 0.1607843, 1,
1.922715, -0.4034, 2.940982, 1, 0, 0.1568628, 1,
1.936858, -0.561056, 3.035856, 1, 0, 0.1490196, 1,
1.942183, -2.093042, 2.732102, 1, 0, 0.145098, 1,
1.953645, 0.5019519, 0.9762784, 1, 0, 0.1372549, 1,
1.989628, 1.314116, 0.4947546, 1, 0, 0.1333333, 1,
2.018412, -0.2756943, 2.374387, 1, 0, 0.1254902, 1,
2.070633, 1.230928, 1.223354, 1, 0, 0.1215686, 1,
2.07227, -0.3926713, 1.590307, 1, 0, 0.1137255, 1,
2.078173, 0.5429152, 1.475267, 1, 0, 0.1098039, 1,
2.093946, -0.6151434, 0.7884844, 1, 0, 0.1019608, 1,
2.102003, -0.1400773, 1.217069, 1, 0, 0.09411765, 1,
2.147835, -0.8829464, 1.834137, 1, 0, 0.09019608, 1,
2.163561, -0.4999285, 2.848521, 1, 0, 0.08235294, 1,
2.178658, 0.02064899, 1.428497, 1, 0, 0.07843138, 1,
2.238877, 0.5439095, 1.830092, 1, 0, 0.07058824, 1,
2.290993, 0.3136983, 2.50136, 1, 0, 0.06666667, 1,
2.308577, -1.403421, 3.814506, 1, 0, 0.05882353, 1,
2.310473, -0.3540681, 0.8955753, 1, 0, 0.05490196, 1,
2.326236, -0.2231298, 2.4052, 1, 0, 0.04705882, 1,
2.475064, -0.4766774, 0.9801968, 1, 0, 0.04313726, 1,
2.638457, 0.5170327, 2.739516, 1, 0, 0.03529412, 1,
2.669307, -2.092345, 2.469099, 1, 0, 0.03137255, 1,
2.871502, -0.9357008, 0.165278, 1, 0, 0.02352941, 1,
3.027716, -0.4646187, 1.926293, 1, 0, 0.01960784, 1,
3.178797, -1.402552, 3.362459, 1, 0, 0.01176471, 1,
3.193524, -3.304796, 2.856164, 1, 0, 0.007843138, 1
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
0.1039582, -4.404332, -7.708035, 0, -0.5, 0.5, 0.5,
0.1039582, -4.404332, -7.708035, 1, -0.5, 0.5, 0.5,
0.1039582, -4.404332, -7.708035, 1, 1.5, 0.5, 0.5,
0.1039582, -4.404332, -7.708035, 0, 1.5, 0.5, 0.5
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
-4.032971, -0.06132913, -7.708035, 0, -0.5, 0.5, 0.5,
-4.032971, -0.06132913, -7.708035, 1, -0.5, 0.5, 0.5,
-4.032971, -0.06132913, -7.708035, 1, 1.5, 0.5, 0.5,
-4.032971, -0.06132913, -7.708035, 0, 1.5, 0.5, 0.5
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
-4.032971, -4.404332, 0.07832003, 0, -0.5, 0.5, 0.5,
-4.032971, -4.404332, 0.07832003, 1, -0.5, 0.5, 0.5,
-4.032971, -4.404332, 0.07832003, 1, 1.5, 0.5, 0.5,
-4.032971, -4.404332, 0.07832003, 0, 1.5, 0.5, 0.5
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
-2, -3.4021, -5.911184,
3, -3.4021, -5.911184,
-2, -3.4021, -5.911184,
-2, -3.569139, -6.210659,
-1, -3.4021, -5.911184,
-1, -3.569139, -6.210659,
0, -3.4021, -5.911184,
0, -3.569139, -6.210659,
1, -3.4021, -5.911184,
1, -3.569139, -6.210659,
2, -3.4021, -5.911184,
2, -3.569139, -6.210659,
3, -3.4021, -5.911184,
3, -3.569139, -6.210659
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
-2, -3.903216, -6.80961, 0, -0.5, 0.5, 0.5,
-2, -3.903216, -6.80961, 1, -0.5, 0.5, 0.5,
-2, -3.903216, -6.80961, 1, 1.5, 0.5, 0.5,
-2, -3.903216, -6.80961, 0, 1.5, 0.5, 0.5,
-1, -3.903216, -6.80961, 0, -0.5, 0.5, 0.5,
-1, -3.903216, -6.80961, 1, -0.5, 0.5, 0.5,
-1, -3.903216, -6.80961, 1, 1.5, 0.5, 0.5,
-1, -3.903216, -6.80961, 0, 1.5, 0.5, 0.5,
0, -3.903216, -6.80961, 0, -0.5, 0.5, 0.5,
0, -3.903216, -6.80961, 1, -0.5, 0.5, 0.5,
0, -3.903216, -6.80961, 1, 1.5, 0.5, 0.5,
0, -3.903216, -6.80961, 0, 1.5, 0.5, 0.5,
1, -3.903216, -6.80961, 0, -0.5, 0.5, 0.5,
1, -3.903216, -6.80961, 1, -0.5, 0.5, 0.5,
1, -3.903216, -6.80961, 1, 1.5, 0.5, 0.5,
1, -3.903216, -6.80961, 0, 1.5, 0.5, 0.5,
2, -3.903216, -6.80961, 0, -0.5, 0.5, 0.5,
2, -3.903216, -6.80961, 1, -0.5, 0.5, 0.5,
2, -3.903216, -6.80961, 1, 1.5, 0.5, 0.5,
2, -3.903216, -6.80961, 0, 1.5, 0.5, 0.5,
3, -3.903216, -6.80961, 0, -0.5, 0.5, 0.5,
3, -3.903216, -6.80961, 1, -0.5, 0.5, 0.5,
3, -3.903216, -6.80961, 1, 1.5, 0.5, 0.5,
3, -3.903216, -6.80961, 0, 1.5, 0.5, 0.5
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
-3.078295, -3, -5.911184,
-3.078295, 3, -5.911184,
-3.078295, -3, -5.911184,
-3.237407, -3, -6.210659,
-3.078295, -2, -5.911184,
-3.237407, -2, -6.210659,
-3.078295, -1, -5.911184,
-3.237407, -1, -6.210659,
-3.078295, 0, -5.911184,
-3.237407, 0, -6.210659,
-3.078295, 1, -5.911184,
-3.237407, 1, -6.210659,
-3.078295, 2, -5.911184,
-3.237407, 2, -6.210659,
-3.078295, 3, -5.911184,
-3.237407, 3, -6.210659
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
-3.555633, -3, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, -3, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, -3, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, -3, -6.80961, 0, 1.5, 0.5, 0.5,
-3.555633, -2, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, -2, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, -2, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, -2, -6.80961, 0, 1.5, 0.5, 0.5,
-3.555633, -1, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, -1, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, -1, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, -1, -6.80961, 0, 1.5, 0.5, 0.5,
-3.555633, 0, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, 0, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, 0, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, 0, -6.80961, 0, 1.5, 0.5, 0.5,
-3.555633, 1, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, 1, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, 1, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, 1, -6.80961, 0, 1.5, 0.5, 0.5,
-3.555633, 2, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, 2, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, 2, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, 2, -6.80961, 0, 1.5, 0.5, 0.5,
-3.555633, 3, -6.80961, 0, -0.5, 0.5, 0.5,
-3.555633, 3, -6.80961, 1, -0.5, 0.5, 0.5,
-3.555633, 3, -6.80961, 1, 1.5, 0.5, 0.5,
-3.555633, 3, -6.80961, 0, 1.5, 0.5, 0.5
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
-3.078295, -3.4021, -4,
-3.078295, -3.4021, 4,
-3.078295, -3.4021, -4,
-3.237407, -3.569139, -4,
-3.078295, -3.4021, -2,
-3.237407, -3.569139, -2,
-3.078295, -3.4021, 0,
-3.237407, -3.569139, 0,
-3.078295, -3.4021, 2,
-3.237407, -3.569139, 2,
-3.078295, -3.4021, 4,
-3.237407, -3.569139, 4
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
-3.555633, -3.903216, -4, 0, -0.5, 0.5, 0.5,
-3.555633, -3.903216, -4, 1, -0.5, 0.5, 0.5,
-3.555633, -3.903216, -4, 1, 1.5, 0.5, 0.5,
-3.555633, -3.903216, -4, 0, 1.5, 0.5, 0.5,
-3.555633, -3.903216, -2, 0, -0.5, 0.5, 0.5,
-3.555633, -3.903216, -2, 1, -0.5, 0.5, 0.5,
-3.555633, -3.903216, -2, 1, 1.5, 0.5, 0.5,
-3.555633, -3.903216, -2, 0, 1.5, 0.5, 0.5,
-3.555633, -3.903216, 0, 0, -0.5, 0.5, 0.5,
-3.555633, -3.903216, 0, 1, -0.5, 0.5, 0.5,
-3.555633, -3.903216, 0, 1, 1.5, 0.5, 0.5,
-3.555633, -3.903216, 0, 0, 1.5, 0.5, 0.5,
-3.555633, -3.903216, 2, 0, -0.5, 0.5, 0.5,
-3.555633, -3.903216, 2, 1, -0.5, 0.5, 0.5,
-3.555633, -3.903216, 2, 1, 1.5, 0.5, 0.5,
-3.555633, -3.903216, 2, 0, 1.5, 0.5, 0.5,
-3.555633, -3.903216, 4, 0, -0.5, 0.5, 0.5,
-3.555633, -3.903216, 4, 1, -0.5, 0.5, 0.5,
-3.555633, -3.903216, 4, 1, 1.5, 0.5, 0.5,
-3.555633, -3.903216, 4, 0, 1.5, 0.5, 0.5
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
-3.078295, -3.4021, -5.911184,
-3.078295, 3.279442, -5.911184,
-3.078295, -3.4021, 6.067824,
-3.078295, 3.279442, 6.067824,
-3.078295, -3.4021, -5.911184,
-3.078295, -3.4021, 6.067824,
-3.078295, 3.279442, -5.911184,
-3.078295, 3.279442, 6.067824,
-3.078295, -3.4021, -5.911184,
3.286211, -3.4021, -5.911184,
-3.078295, -3.4021, 6.067824,
3.286211, -3.4021, 6.067824,
-3.078295, 3.279442, -5.911184,
3.286211, 3.279442, -5.911184,
-3.078295, 3.279442, 6.067824,
3.286211, 3.279442, 6.067824,
3.286211, -3.4021, -5.911184,
3.286211, 3.279442, -5.911184,
3.286211, -3.4021, 6.067824,
3.286211, 3.279442, 6.067824,
3.286211, -3.4021, -5.911184,
3.286211, -3.4021, 6.067824,
3.286211, 3.279442, -5.911184,
3.286211, 3.279442, 6.067824
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
var radius = 8.074355;
var distance = 35.92372;
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
mvMatrix.translate( -0.1039582, 0.06132913, -0.07832003 );
mvMatrix.scale( 1.371693, 1.306607, 0.7287874 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.92372);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Pyraclostrobin<-read.table("Pyraclostrobin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pyraclostrobin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
```

```r
y<-Pyraclostrobin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
```

```r
z<-Pyraclostrobin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pyraclostrobin' not found
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
-2.985608, 0.7054217, -0.5113418, 0, 0, 1, 1, 1,
-2.793969, 0.1548239, -4.038592, 1, 0, 0, 1, 1,
-2.75991, -0.5928295, -1.051665, 1, 0, 0, 1, 1,
-2.640277, -0.862626, -2.525161, 1, 0, 0, 1, 1,
-2.613257, -0.5781591, -2.171169, 1, 0, 0, 1, 1,
-2.521345, 0.7453668, 0.03619051, 1, 0, 0, 1, 1,
-2.51671, 1.591544, -2.923897, 0, 0, 0, 1, 1,
-2.447694, 0.7129298, -1.824287, 0, 0, 0, 1, 1,
-2.349827, -1.368337, -2.501465, 0, 0, 0, 1, 1,
-2.323118, -0.3678596, -2.108706, 0, 0, 0, 1, 1,
-2.303403, 1.992555, 0.8682237, 0, 0, 0, 1, 1,
-2.270824, -2.433183, -3.043178, 0, 0, 0, 1, 1,
-2.155719, 0.7752041, -0.9864317, 0, 0, 0, 1, 1,
-2.151976, -1.247839, -2.670698, 1, 1, 1, 1, 1,
-2.145887, -0.319734, -2.23332, 1, 1, 1, 1, 1,
-2.141815, 0.5233579, -0.8144136, 1, 1, 1, 1, 1,
-2.112339, -0.9505002, -1.476289, 1, 1, 1, 1, 1,
-2.094023, 0.6600614, -1.767267, 1, 1, 1, 1, 1,
-2.091384, -0.7070138, -0.6715921, 1, 1, 1, 1, 1,
-2.07657, 0.06861237, -1.600564, 1, 1, 1, 1, 1,
-2.075001, -0.3594671, -2.491418, 1, 1, 1, 1, 1,
-2.018285, -2.867271, -4.527482, 1, 1, 1, 1, 1,
-1.932759, -0.4658566, -1.16052, 1, 1, 1, 1, 1,
-1.920148, 1.097505, -1.684192, 1, 1, 1, 1, 1,
-1.915223, -0.6050535, 0.7930263, 1, 1, 1, 1, 1,
-1.906026, 0.7361939, -1.016472, 1, 1, 1, 1, 1,
-1.900647, 0.7512519, -1.026233, 1, 1, 1, 1, 1,
-1.886244, -1.377829, -3.76485, 1, 1, 1, 1, 1,
-1.879923, -0.9665508, -2.140684, 0, 0, 1, 1, 1,
-1.850303, 0.6358657, -2.709909, 1, 0, 0, 1, 1,
-1.821407, -1.925547, -1.920279, 1, 0, 0, 1, 1,
-1.819099, 0.07329719, -0.7310925, 1, 0, 0, 1, 1,
-1.814472, 1.130407, -2.178272, 1, 0, 0, 1, 1,
-1.804004, 0.1923735, 0.03568863, 1, 0, 0, 1, 1,
-1.7987, 0.3364692, -1.456224, 0, 0, 0, 1, 1,
-1.773443, -0.6153526, -1.943097, 0, 0, 0, 1, 1,
-1.770885, 1.242355, -2.611685, 0, 0, 0, 1, 1,
-1.750842, -1.15037, -0.7439576, 0, 0, 0, 1, 1,
-1.748982, -1.952783, -3.795266, 0, 0, 0, 1, 1,
-1.735805, -0.3876562, -2.773264, 0, 0, 0, 1, 1,
-1.725995, 0.7494538, -1.15062, 0, 0, 0, 1, 1,
-1.708982, 0.5910792, -1.460923, 1, 1, 1, 1, 1,
-1.707762, 0.5697513, -2.104507, 1, 1, 1, 1, 1,
-1.686435, 0.9634038, -1.789651, 1, 1, 1, 1, 1,
-1.676119, 1.187085, -0.1213725, 1, 1, 1, 1, 1,
-1.674946, -0.9746221, -2.456558, 1, 1, 1, 1, 1,
-1.661955, -1.250227, -3.23914, 1, 1, 1, 1, 1,
-1.650488, 0.6931286, -1.906379, 1, 1, 1, 1, 1,
-1.631921, -2.363144, -2.46672, 1, 1, 1, 1, 1,
-1.6292, -1.306682, -3.072236, 1, 1, 1, 1, 1,
-1.607604, -1.064152, -0.9976053, 1, 1, 1, 1, 1,
-1.604176, -0.3684568, -0.6037628, 1, 1, 1, 1, 1,
-1.573354, 0.3441289, 0.9190202, 1, 1, 1, 1, 1,
-1.552943, -0.3771378, -2.961345, 1, 1, 1, 1, 1,
-1.531097, -0.4185822, -3.186767, 1, 1, 1, 1, 1,
-1.523954, 1.60552, -0.7709532, 1, 1, 1, 1, 1,
-1.520012, -0.9817144, -2.383179, 0, 0, 1, 1, 1,
-1.517941, -0.09979512, -1.632042, 1, 0, 0, 1, 1,
-1.51735, -1.985865, -3.421191, 1, 0, 0, 1, 1,
-1.509918, -0.833846, -2.525811, 1, 0, 0, 1, 1,
-1.467788, -0.3778412, -0.4884498, 1, 0, 0, 1, 1,
-1.458091, 0.322161, -2.297706, 1, 0, 0, 1, 1,
-1.449133, -0.1440724, -2.192625, 0, 0, 0, 1, 1,
-1.445383, -0.003998242, -1.073535, 0, 0, 0, 1, 1,
-1.436534, -1.070306, -0.7832147, 0, 0, 0, 1, 1,
-1.433547, 0.4069935, -1.672409, 0, 0, 0, 1, 1,
-1.429627, -1.242223, -4.350534, 0, 0, 0, 1, 1,
-1.424434, 0.04875621, -2.694406, 0, 0, 0, 1, 1,
-1.422347, 0.4776791, -0.1844994, 0, 0, 0, 1, 1,
-1.406817, -0.08444612, -1.75133, 1, 1, 1, 1, 1,
-1.406102, 0.01394356, -2.548036, 1, 1, 1, 1, 1,
-1.392125, -0.8783196, -2.139358, 1, 1, 1, 1, 1,
-1.366174, -1.67466, -0.3069533, 1, 1, 1, 1, 1,
-1.358536, 1.857292, -1.662296, 1, 1, 1, 1, 1,
-1.355435, -0.8811383, -2.640281, 1, 1, 1, 1, 1,
-1.341124, 0.7702681, -0.5192075, 1, 1, 1, 1, 1,
-1.339077, 0.02092154, -2.112834, 1, 1, 1, 1, 1,
-1.338336, -0.1032578, -0.7180933, 1, 1, 1, 1, 1,
-1.327539, 1.292771, 0.5841281, 1, 1, 1, 1, 1,
-1.306291, -0.7765981, -1.431187, 1, 1, 1, 1, 1,
-1.296976, -0.738122, -1.770373, 1, 1, 1, 1, 1,
-1.29639, 1.582178, -1.429989, 1, 1, 1, 1, 1,
-1.281537, 0.1829496, -0.4780122, 1, 1, 1, 1, 1,
-1.277765, -2.810097, -3.30028, 1, 1, 1, 1, 1,
-1.276987, 0.4644024, -2.613706, 0, 0, 1, 1, 1,
-1.257421, -0.9089109, -2.82349, 1, 0, 0, 1, 1,
-1.249051, 0.7043785, -0.2350343, 1, 0, 0, 1, 1,
-1.248694, 0.1969537, -2.166676, 1, 0, 0, 1, 1,
-1.247534, 0.8602708, -2.117009, 1, 0, 0, 1, 1,
-1.225771, 0.8829265, -0.9548235, 1, 0, 0, 1, 1,
-1.223003, -0.1491084, -1.733737, 0, 0, 0, 1, 1,
-1.222412, -0.6764206, -4.090502, 0, 0, 0, 1, 1,
-1.216084, 0.5703594, -2.560806, 0, 0, 0, 1, 1,
-1.213079, 0.172812, -1.376333, 0, 0, 0, 1, 1,
-1.21166, -1.287725, -2.799597, 0, 0, 0, 1, 1,
-1.20328, -0.6548945, -3.460001, 0, 0, 0, 1, 1,
-1.19354, 1.104808, 0.1577962, 0, 0, 0, 1, 1,
-1.180349, 0.4155936, -1.806535, 1, 1, 1, 1, 1,
-1.168027, 0.606373, -2.163998, 1, 1, 1, 1, 1,
-1.166577, 0.1519466, -1.8428, 1, 1, 1, 1, 1,
-1.164424, -0.809966, -1.498033, 1, 1, 1, 1, 1,
-1.163786, 0.7665616, -0.7737133, 1, 1, 1, 1, 1,
-1.159364, -0.4577056, 0.4890484, 1, 1, 1, 1, 1,
-1.149213, -0.5626229, -2.5785, 1, 1, 1, 1, 1,
-1.145881, -0.718944, -1.861438, 1, 1, 1, 1, 1,
-1.143158, -0.3438505, -1.182665, 1, 1, 1, 1, 1,
-1.14019, 0.3018316, -1.821956, 1, 1, 1, 1, 1,
-1.134245, -2.026166, -0.9942585, 1, 1, 1, 1, 1,
-1.133665, -0.8974277, -2.079273, 1, 1, 1, 1, 1,
-1.129774, 0.2320873, -1.462498, 1, 1, 1, 1, 1,
-1.126397, 0.9357681, -0.8886062, 1, 1, 1, 1, 1,
-1.126072, -1.845828, -0.8067575, 1, 1, 1, 1, 1,
-1.118187, 1.601685, -2.057548, 0, 0, 1, 1, 1,
-1.11437, -1.636568, -2.51362, 1, 0, 0, 1, 1,
-1.11283, 0.1338331, -1.990101, 1, 0, 0, 1, 1,
-1.106763, -0.6635306, -0.6939715, 1, 0, 0, 1, 1,
-1.098679, 0.7832485, -2.673938, 1, 0, 0, 1, 1,
-1.093822, 1.419737, -0.2838745, 1, 0, 0, 1, 1,
-1.091495, 0.7855525, -0.5441965, 0, 0, 0, 1, 1,
-1.088681, 0.5281289, -1.828115, 0, 0, 0, 1, 1,
-1.080078, 0.7709876, -0.4344096, 0, 0, 0, 1, 1,
-1.075136, -0.110577, -1.69377, 0, 0, 0, 1, 1,
-1.072672, 0.4749853, -0.6115981, 0, 0, 0, 1, 1,
-1.071134, 1.458006, -1.287771, 0, 0, 0, 1, 1,
-1.070778, 0.556749, -1.568424, 0, 0, 0, 1, 1,
-1.066418, 2.48724, -0.3715247, 1, 1, 1, 1, 1,
-1.061938, -0.7741557, -3.75445, 1, 1, 1, 1, 1,
-1.054313, 0.6555848, -1.011837, 1, 1, 1, 1, 1,
-1.054262, -0.01606939, -1.675043, 1, 1, 1, 1, 1,
-1.047956, 0.1339095, 0.2382861, 1, 1, 1, 1, 1,
-1.047603, -1.206316, -2.665123, 1, 1, 1, 1, 1,
-1.045282, -1.663355, -1.18944, 1, 1, 1, 1, 1,
-1.043525, 1.349292, 0.7168301, 1, 1, 1, 1, 1,
-1.038705, -0.3112997, -3.309848, 1, 1, 1, 1, 1,
-1.033509, 0.19974, -2.581784, 1, 1, 1, 1, 1,
-1.033056, -1.009858, -4.28467, 1, 1, 1, 1, 1,
-1.03143, 0.5627236, -0.4676723, 1, 1, 1, 1, 1,
-1.025525, 0.4651559, 0.6751994, 1, 1, 1, 1, 1,
-1.021056, -1.033612, -1.292442, 1, 1, 1, 1, 1,
-1.02056, -0.7118766, -2.129478, 1, 1, 1, 1, 1,
-1.020207, -0.107091, -2.279862, 0, 0, 1, 1, 1,
-1.016283, 0.717278, -2.106771, 1, 0, 0, 1, 1,
-1.007734, -0.09430589, -1.0447, 1, 0, 0, 1, 1,
-1.006881, -0.59737, -1.7582, 1, 0, 0, 1, 1,
-1.005212, 0.4287561, -1.014529, 1, 0, 0, 1, 1,
-1.003687, 1.030497, -1.516658, 1, 0, 0, 1, 1,
-0.9981877, -1.210853, -0.785889, 0, 0, 0, 1, 1,
-0.9973518, 0.4518072, -0.3689687, 0, 0, 0, 1, 1,
-0.9940036, 0.1905235, -1.933771, 0, 0, 0, 1, 1,
-0.9896566, -1.851102, -3.002201, 0, 0, 0, 1, 1,
-0.9874137, 0.4203442, -2.40437, 0, 0, 0, 1, 1,
-0.9872443, -1.484122, -1.000674, 0, 0, 0, 1, 1,
-0.9855276, 1.024949, 0.8961046, 0, 0, 0, 1, 1,
-0.9732041, -0.3290698, -1.642815, 1, 1, 1, 1, 1,
-0.9724186, 0.4431977, -0.4681703, 1, 1, 1, 1, 1,
-0.9705589, 0.8894851, -0.4004019, 1, 1, 1, 1, 1,
-0.9691319, -0.9350275, 0.1068235, 1, 1, 1, 1, 1,
-0.9619952, 0.1256448, -1.978178, 1, 1, 1, 1, 1,
-0.9617761, -0.09777678, -1.378643, 1, 1, 1, 1, 1,
-0.9579311, 0.5981863, -0.1156507, 1, 1, 1, 1, 1,
-0.956565, 0.2857248, -2.409993, 1, 1, 1, 1, 1,
-0.95373, 0.8374133, -1.584488, 1, 1, 1, 1, 1,
-0.9523944, 1.00593, -0.8467225, 1, 1, 1, 1, 1,
-0.9486083, -0.8888174, -4.761825, 1, 1, 1, 1, 1,
-0.9455764, -1.567539, -3.315839, 1, 1, 1, 1, 1,
-0.9380413, 1.657701, -0.3249763, 1, 1, 1, 1, 1,
-0.9346946, -1.351169, -3.759488, 1, 1, 1, 1, 1,
-0.9265622, -0.4704275, -1.030544, 1, 1, 1, 1, 1,
-0.9229756, 0.596253, -1.165457, 0, 0, 1, 1, 1,
-0.9201298, 0.8405348, -1.52942, 1, 0, 0, 1, 1,
-0.9105719, 0.9848896, -0.4101376, 1, 0, 0, 1, 1,
-0.9004943, -1.054963, -2.348195, 1, 0, 0, 1, 1,
-0.9001204, -1.155643, -4.371396, 1, 0, 0, 1, 1,
-0.8890325, 0.4175085, -1.46104, 1, 0, 0, 1, 1,
-0.8885463, 0.7941954, -1.395177, 0, 0, 0, 1, 1,
-0.8845237, 1.081922, -1.272006, 0, 0, 0, 1, 1,
-0.8818427, -0.3221511, -1.76748, 0, 0, 0, 1, 1,
-0.8816391, 0.9108559, 0.3308826, 0, 0, 0, 1, 1,
-0.880257, 1.12557, -0.619154, 0, 0, 0, 1, 1,
-0.878257, -0.6239774, -1.970834, 0, 0, 0, 1, 1,
-0.8751036, 1.093667, -0.2896865, 0, 0, 0, 1, 1,
-0.8743219, -1.018686, -2.32333, 1, 1, 1, 1, 1,
-0.8736747, 1.029751, 0.1694683, 1, 1, 1, 1, 1,
-0.8612493, -0.2887732, -3.031977, 1, 1, 1, 1, 1,
-0.8589519, 0.61077, -2.217266, 1, 1, 1, 1, 1,
-0.8518776, 0.8548021, -1.449766, 1, 1, 1, 1, 1,
-0.8504487, 0.5521975, 0.7372088, 1, 1, 1, 1, 1,
-0.844477, -0.6344263, -1.864714, 1, 1, 1, 1, 1,
-0.8428571, 0.3846448, -0.1665342, 1, 1, 1, 1, 1,
-0.8426024, -1.368301, -4.415566, 1, 1, 1, 1, 1,
-0.8393635, -0.06571077, -1.862997, 1, 1, 1, 1, 1,
-0.8374103, -0.2236497, -0.3499694, 1, 1, 1, 1, 1,
-0.8373891, 2.155835, -1.467304, 1, 1, 1, 1, 1,
-0.8353443, -0.3811028, -2.577653, 1, 1, 1, 1, 1,
-0.8340964, 0.1008857, 0.9268039, 1, 1, 1, 1, 1,
-0.822598, -1.0494, -1.987796, 1, 1, 1, 1, 1,
-0.8219294, 1.598819, -0.5558323, 0, 0, 1, 1, 1,
-0.8128802, 0.15641, -2.28239, 1, 0, 0, 1, 1,
-0.8095316, -2.062955, -2.630274, 1, 0, 0, 1, 1,
-0.8095129, -0.9120979, -2.682106, 1, 0, 0, 1, 1,
-0.8050387, -1.087427, -2.211511, 1, 0, 0, 1, 1,
-0.8027261, 0.06304344, -1.610159, 1, 0, 0, 1, 1,
-0.8010187, -0.4429273, -2.860718, 0, 0, 0, 1, 1,
-0.789594, 1.630224, -1.580602, 0, 0, 0, 1, 1,
-0.7883433, -1.103602, -2.994622, 0, 0, 0, 1, 1,
-0.7873515, -1.700283, -4.054194, 0, 0, 0, 1, 1,
-0.7789431, 0.5925069, -0.08925886, 0, 0, 0, 1, 1,
-0.7779067, 0.6038304, -1.768997, 0, 0, 0, 1, 1,
-0.7716787, -0.1548709, -1.949414, 0, 0, 0, 1, 1,
-0.765029, 0.7867832, -0.06502132, 1, 1, 1, 1, 1,
-0.7523106, 0.5462124, -1.196394, 1, 1, 1, 1, 1,
-0.7487431, -1.051169, -4.256446, 1, 1, 1, 1, 1,
-0.7484913, 0.4072089, -0.5381746, 1, 1, 1, 1, 1,
-0.7470919, 0.3121941, -1.422373, 1, 1, 1, 1, 1,
-0.7450266, 1.77861, 0.271732, 1, 1, 1, 1, 1,
-0.7403164, 0.6983784, -2.194968, 1, 1, 1, 1, 1,
-0.7363271, 0.6318146, -0.8128624, 1, 1, 1, 1, 1,
-0.7361437, 0.5408182, 1.065224, 1, 1, 1, 1, 1,
-0.7357427, 0.03692273, -2.12478, 1, 1, 1, 1, 1,
-0.7317329, -1.956893, -2.418985, 1, 1, 1, 1, 1,
-0.7309285, -0.746938, -2.304251, 1, 1, 1, 1, 1,
-0.7277031, -0.6334534, -1.422064, 1, 1, 1, 1, 1,
-0.7271121, 0.6054186, -1.620977, 1, 1, 1, 1, 1,
-0.7212059, 0.02569979, -0.8375946, 1, 1, 1, 1, 1,
-0.7191198, 0.1274826, -1.247488, 0, 0, 1, 1, 1,
-0.7181673, 0.2256565, -0.5751788, 1, 0, 0, 1, 1,
-0.71373, 1.218816, 0.4571668, 1, 0, 0, 1, 1,
-0.7116427, -1.596699, -1.783749, 1, 0, 0, 1, 1,
-0.7112217, -1.355066, -2.081079, 1, 0, 0, 1, 1,
-0.7108422, 1.027143, 1.301002, 1, 0, 0, 1, 1,
-0.7104566, 2.439512, -1.352705, 0, 0, 0, 1, 1,
-0.7095701, -0.9690728, -1.586642, 0, 0, 0, 1, 1,
-0.7069365, -0.8831839, -3.57966, 0, 0, 0, 1, 1,
-0.7050616, 0.9901518, -0.9063206, 0, 0, 0, 1, 1,
-0.7050256, -0.9118576, -1.838031, 0, 0, 0, 1, 1,
-0.7010786, -0.6077875, -2.56047, 0, 0, 0, 1, 1,
-0.6995911, 0.5450199, -0.853193, 0, 0, 0, 1, 1,
-0.6988414, 0.7344517, -1.446127, 1, 1, 1, 1, 1,
-0.6920508, -0.9967507, -1.951194, 1, 1, 1, 1, 1,
-0.6892642, 1.4311, 1.252924, 1, 1, 1, 1, 1,
-0.6888971, -1.866218, -3.580331, 1, 1, 1, 1, 1,
-0.6886466, 0.1327116, -1.268289, 1, 1, 1, 1, 1,
-0.6844614, -0.4794088, -1.30063, 1, 1, 1, 1, 1,
-0.6764936, -2.090022, -1.925528, 1, 1, 1, 1, 1,
-0.6720712, -1.17382, -2.24311, 1, 1, 1, 1, 1,
-0.6710737, -1.193015, -2.917271, 1, 1, 1, 1, 1,
-0.668593, -0.8027694, -1.969385, 1, 1, 1, 1, 1,
-0.6645523, 0.6134341, -0.3229941, 1, 1, 1, 1, 1,
-0.6621781, -0.549196, -3.168929, 1, 1, 1, 1, 1,
-0.6621646, 0.8380183, -0.751476, 1, 1, 1, 1, 1,
-0.6618149, -0.5714059, -2.677461, 1, 1, 1, 1, 1,
-0.6611439, -0.5791512, -2.118561, 1, 1, 1, 1, 1,
-0.6600975, -2.523911, -3.849715, 0, 0, 1, 1, 1,
-0.6486866, 1.058469, -0.390561, 1, 0, 0, 1, 1,
-0.6431561, 0.297413, 0.1137411, 1, 0, 0, 1, 1,
-0.6355787, -0.169377, -0.8441287, 1, 0, 0, 1, 1,
-0.6353512, -0.4230932, -2.411495, 1, 0, 0, 1, 1,
-0.6312267, 0.04407135, -0.2881312, 1, 0, 0, 1, 1,
-0.6296853, -0.8378668, -2.144971, 0, 0, 0, 1, 1,
-0.6296724, 1.255089, -2.311828, 0, 0, 0, 1, 1,
-0.6290152, -1.835065, -3.275622, 0, 0, 0, 1, 1,
-0.6234061, -1.119095, -0.6924813, 0, 0, 0, 1, 1,
-0.6221604, -1.409537, -2.282684, 0, 0, 0, 1, 1,
-0.6166522, -1.628417, -3.663537, 0, 0, 0, 1, 1,
-0.6125761, -1.587643, -3.396641, 0, 0, 0, 1, 1,
-0.6117453, 0.2257835, -1.516699, 1, 1, 1, 1, 1,
-0.6080984, -0.3526215, -1.495228, 1, 1, 1, 1, 1,
-0.6073104, -1.280738, -4.826388, 1, 1, 1, 1, 1,
-0.6036492, 0.2853118, -1.080624, 1, 1, 1, 1, 1,
-0.6024815, -1.0077, -1.79716, 1, 1, 1, 1, 1,
-0.6008436, 1.324426, 0.9399913, 1, 1, 1, 1, 1,
-0.5989947, -1.108358, -1.451465, 1, 1, 1, 1, 1,
-0.5958551, 0.1018648, -0.8998541, 1, 1, 1, 1, 1,
-0.5942038, -1.7835, -1.636072, 1, 1, 1, 1, 1,
-0.5931849, -0.01885939, -2.480379, 1, 1, 1, 1, 1,
-0.5924104, -0.6069084, -3.320916, 1, 1, 1, 1, 1,
-0.5892037, -0.5895659, -3.934824, 1, 1, 1, 1, 1,
-0.5845582, -0.3321601, -2.259211, 1, 1, 1, 1, 1,
-0.5781071, 0.6809474, -0.5516116, 1, 1, 1, 1, 1,
-0.5746052, 1.171168, -1.45285, 1, 1, 1, 1, 1,
-0.568212, 1.150444, 0.8867676, 0, 0, 1, 1, 1,
-0.5631133, 0.6504878, -1.854603, 1, 0, 0, 1, 1,
-0.5535234, 1.133693, -0.9928021, 1, 0, 0, 1, 1,
-0.5470526, -0.1657731, -1.712097, 1, 0, 0, 1, 1,
-0.546728, 0.2960012, -0.5426016, 1, 0, 0, 1, 1,
-0.5466874, -0.7705359, -2.14252, 1, 0, 0, 1, 1,
-0.5465196, 0.6548144, -1.506581, 0, 0, 0, 1, 1,
-0.5459757, -1.246028, -3.095803, 0, 0, 0, 1, 1,
-0.5458926, -1.310441, -2.867612, 0, 0, 0, 1, 1,
-0.5436418, 1.747404, 1.126661, 0, 0, 0, 1, 1,
-0.5435969, -1.060355, -2.150637, 0, 0, 0, 1, 1,
-0.5417726, 0.9972826, 0.4891151, 0, 0, 0, 1, 1,
-0.5399708, 1.010214, -1.101358, 0, 0, 0, 1, 1,
-0.5387963, 0.1226994, -0.9505885, 1, 1, 1, 1, 1,
-0.5306944, -0.2943853, -3.399357, 1, 1, 1, 1, 1,
-0.5298485, -0.9205385, -4.780587, 1, 1, 1, 1, 1,
-0.5191845, 0.449062, 0.7176017, 1, 1, 1, 1, 1,
-0.5144572, -1.127017, -2.536136, 1, 1, 1, 1, 1,
-0.514173, -1.824787, -3.381647, 1, 1, 1, 1, 1,
-0.5064555, 0.8473886, -1.474212, 1, 1, 1, 1, 1,
-0.5043628, 0.315482, 0.03509072, 1, 1, 1, 1, 1,
-0.4982349, -0.7399639, -2.450011, 1, 1, 1, 1, 1,
-0.4975547, 1.082004, -0.008359424, 1, 1, 1, 1, 1,
-0.4965478, -0.1119165, 0.4285305, 1, 1, 1, 1, 1,
-0.4950639, 1.401311, -0.9501255, 1, 1, 1, 1, 1,
-0.4949786, -1.148857, -2.188747, 1, 1, 1, 1, 1,
-0.4927743, 0.257737, 0.0002948034, 1, 1, 1, 1, 1,
-0.4919704, -0.5532799, -1.615805, 1, 1, 1, 1, 1,
-0.491845, 0.7537255, -0.448777, 0, 0, 1, 1, 1,
-0.4896885, -0.5075802, -1.775121, 1, 0, 0, 1, 1,
-0.4876789, -0.7226917, -3.184023, 1, 0, 0, 1, 1,
-0.4795786, -0.3955772, -1.547345, 1, 0, 0, 1, 1,
-0.4788009, -0.7545852, -1.505194, 1, 0, 0, 1, 1,
-0.4769076, -0.2071418, -1.754173, 1, 0, 0, 1, 1,
-0.4764973, 2.049393, 0.7506899, 0, 0, 0, 1, 1,
-0.4761775, 0.1301211, -1.722708, 0, 0, 0, 1, 1,
-0.4671038, 1.025069, -0.2789072, 0, 0, 0, 1, 1,
-0.4666727, -0.02215403, -1.670369, 0, 0, 0, 1, 1,
-0.4629488, 0.919601, -1.072367, 0, 0, 0, 1, 1,
-0.4603315, -1.085216, -3.348172, 0, 0, 0, 1, 1,
-0.4565089, 0.9910367, 0.2715629, 0, 0, 0, 1, 1,
-0.456492, -0.006548506, -2.125637, 1, 1, 1, 1, 1,
-0.4558911, -1.119056, -4.255563, 1, 1, 1, 1, 1,
-0.4543419, 0.7996302, 0.634007, 1, 1, 1, 1, 1,
-0.4538902, 0.007773108, -2.779821, 1, 1, 1, 1, 1,
-0.4530104, 1.20828, -0.8267022, 1, 1, 1, 1, 1,
-0.4515948, 0.5838671, 0.04812035, 1, 1, 1, 1, 1,
-0.4501974, 0.02735272, 1.072361, 1, 1, 1, 1, 1,
-0.4493461, 1.743562, 0.0140941, 1, 1, 1, 1, 1,
-0.4435348, 2.007528, 0.7076571, 1, 1, 1, 1, 1,
-0.4421772, 0.3266125, -1.384708, 1, 1, 1, 1, 1,
-0.441531, 0.07698012, -0.5405684, 1, 1, 1, 1, 1,
-0.4407672, 2.617889, -1.025786, 1, 1, 1, 1, 1,
-0.4399265, 0.2921121, -1.028093, 1, 1, 1, 1, 1,
-0.4352443, -1.263907, -2.151865, 1, 1, 1, 1, 1,
-0.434158, -0.7228284, -4.603182, 1, 1, 1, 1, 1,
-0.4306705, -1.44621, -3.320349, 0, 0, 1, 1, 1,
-0.4269789, 0.0346479, -3.731332, 1, 0, 0, 1, 1,
-0.4213561, -0.03807524, -2.023304, 1, 0, 0, 1, 1,
-0.4200976, 0.2428489, -0.850872, 1, 0, 0, 1, 1,
-0.4171989, 0.783006, -0.4619467, 1, 0, 0, 1, 1,
-0.4158235, -0.1954138, -2.247864, 1, 0, 0, 1, 1,
-0.4156842, -0.9279389, -2.24717, 0, 0, 0, 1, 1,
-0.4153814, -0.1274828, -1.948342, 0, 0, 0, 1, 1,
-0.4143316, -0.3947625, -1.495826, 0, 0, 0, 1, 1,
-0.4123507, -0.3225789, -2.152625, 0, 0, 0, 1, 1,
-0.4122925, 1.872196, 0.3753701, 0, 0, 0, 1, 1,
-0.4091554, 0.3533057, -0.6792067, 0, 0, 0, 1, 1,
-0.4083706, 0.003893171, -0.5579526, 0, 0, 0, 1, 1,
-0.4081608, 0.01238962, -1.677171, 1, 1, 1, 1, 1,
-0.4062164, -0.9217901, -2.511733, 1, 1, 1, 1, 1,
-0.4055608, -1.087121, -3.391907, 1, 1, 1, 1, 1,
-0.4055431, 1.246642, 1.303304, 1, 1, 1, 1, 1,
-0.4007177, 0.585508, -0.7613858, 1, 1, 1, 1, 1,
-0.4001436, 0.5032768, 0.7326071, 1, 1, 1, 1, 1,
-0.3984303, 0.776552, -0.1583785, 1, 1, 1, 1, 1,
-0.3977816, -0.02247319, -0.9039622, 1, 1, 1, 1, 1,
-0.395022, 0.8494744, -2.203231, 1, 1, 1, 1, 1,
-0.3919248, 2.096624, -1.254624, 1, 1, 1, 1, 1,
-0.3909159, -0.06514036, -1.917297, 1, 1, 1, 1, 1,
-0.3875478, -0.8654853, -2.256094, 1, 1, 1, 1, 1,
-0.3859544, -0.09072252, -1.181734, 1, 1, 1, 1, 1,
-0.3854897, 0.8318654, 0.2096525, 1, 1, 1, 1, 1,
-0.3833485, -1.24884, -1.284717, 1, 1, 1, 1, 1,
-0.3777852, -0.9202096, -4.013996, 0, 0, 1, 1, 1,
-0.377131, 0.5042603, 1.085855, 1, 0, 0, 1, 1,
-0.3757844, 0.06960677, -0.1825764, 1, 0, 0, 1, 1,
-0.374943, -0.5854639, -0.9878643, 1, 0, 0, 1, 1,
-0.3690771, -0.9453484, -3.300802, 1, 0, 0, 1, 1,
-0.3666201, -0.02668977, -0.6694729, 1, 0, 0, 1, 1,
-0.3642849, -0.3820724, -1.599893, 0, 0, 0, 1, 1,
-0.3622711, -1.421506, -2.479731, 0, 0, 0, 1, 1,
-0.3621584, -0.8574122, -2.286711, 0, 0, 0, 1, 1,
-0.3587564, 0.3909049, -0.1054648, 0, 0, 0, 1, 1,
-0.3552325, 3.182138, 1.525654, 0, 0, 0, 1, 1,
-0.3551549, -0.415884, -3.357793, 0, 0, 0, 1, 1,
-0.3528132, -1.619951, -5.736732, 0, 0, 0, 1, 1,
-0.3490067, -0.7168378, -3.628022, 1, 1, 1, 1, 1,
-0.3471124, 0.9734613, 0.7884012, 1, 1, 1, 1, 1,
-0.3442283, 0.6505331, -0.6283859, 1, 1, 1, 1, 1,
-0.343991, 0.4137628, 0.2294548, 1, 1, 1, 1, 1,
-0.3434017, 0.03988468, -1.983218, 1, 1, 1, 1, 1,
-0.3427868, -1.172893, -5.10608, 1, 1, 1, 1, 1,
-0.3354546, 0.5472102, -2.142459, 1, 1, 1, 1, 1,
-0.3312146, 0.5466791, -0.2589756, 1, 1, 1, 1, 1,
-0.3311977, -0.531492, -2.700964, 1, 1, 1, 1, 1,
-0.3286767, 1.146588, 0.8911296, 1, 1, 1, 1, 1,
-0.3281313, -1.010848, -3.361702, 1, 1, 1, 1, 1,
-0.3265078, 1.05238, -0.08827396, 1, 1, 1, 1, 1,
-0.3244564, -0.4609312, -3.057032, 1, 1, 1, 1, 1,
-0.3223188, -1.05714, -1.303892, 1, 1, 1, 1, 1,
-0.3222194, -1.329965, -2.992222, 1, 1, 1, 1, 1,
-0.3213201, 1.820522, -0.4030363, 0, 0, 1, 1, 1,
-0.3153834, 0.3700221, -2.195849, 1, 0, 0, 1, 1,
-0.3141896, 0.3476787, -1.235071, 1, 0, 0, 1, 1,
-0.3131258, -1.282336, -1.559812, 1, 0, 0, 1, 1,
-0.3121033, 0.9302382, -0.452167, 1, 0, 0, 1, 1,
-0.3110816, 0.36089, 0.8702524, 1, 0, 0, 1, 1,
-0.3104736, 1.263599, 0.494622, 0, 0, 0, 1, 1,
-0.3077022, -0.1115051, -3.020904, 0, 0, 0, 1, 1,
-0.3072141, 1.32147, 0.8069961, 0, 0, 0, 1, 1,
-0.3066014, -0.1785661, -2.573273, 0, 0, 0, 1, 1,
-0.3063298, 1.316774, 0.06711128, 0, 0, 0, 1, 1,
-0.3058833, 0.4387095, -0.8826303, 0, 0, 0, 1, 1,
-0.2982343, 0.6665515, 1.054273, 0, 0, 0, 1, 1,
-0.2916254, -0.7873251, -0.6143258, 1, 1, 1, 1, 1,
-0.2803625, -0.7243217, -2.77907, 1, 1, 1, 1, 1,
-0.2791614, 1.909007, -1.647521, 1, 1, 1, 1, 1,
-0.2769701, 1.757111, 0.841027, 1, 1, 1, 1, 1,
-0.2764946, 0.6839281, -0.3562739, 1, 1, 1, 1, 1,
-0.276299, 1.38364, -0.6528639, 1, 1, 1, 1, 1,
-0.2747657, -0.7255016, -1.422401, 1, 1, 1, 1, 1,
-0.2682851, -0.8527225, -3.802707, 1, 1, 1, 1, 1,
-0.268269, -0.8294772, -3.428739, 1, 1, 1, 1, 1,
-0.2595088, -0.2073106, -1.640941, 1, 1, 1, 1, 1,
-0.2543578, -0.8093299, -1.787575, 1, 1, 1, 1, 1,
-0.2521832, -0.8291038, -3.143301, 1, 1, 1, 1, 1,
-0.2483155, -0.3808409, -3.025357, 1, 1, 1, 1, 1,
-0.2481302, 0.4318308, -0.4741923, 1, 1, 1, 1, 1,
-0.2469071, 0.8335052, -0.1512408, 1, 1, 1, 1, 1,
-0.2451375, -0.8197598, -3.013391, 0, 0, 1, 1, 1,
-0.2448721, 0.6893117, -0.7006654, 1, 0, 0, 1, 1,
-0.2440621, -2.093034, -3.095428, 1, 0, 0, 1, 1,
-0.2437198, -0.6739575, -3.744942, 1, 0, 0, 1, 1,
-0.2399212, 0.7656978, 0.4850237, 1, 0, 0, 1, 1,
-0.23523, -2.082088, -2.317419, 1, 0, 0, 1, 1,
-0.2317947, -0.1195511, -3.196217, 0, 0, 0, 1, 1,
-0.2301247, 0.4613915, -2.613066, 0, 0, 0, 1, 1,
-0.2287123, -0.7283061, -3.638743, 0, 0, 0, 1, 1,
-0.22699, -0.1853458, -0.4389676, 0, 0, 0, 1, 1,
-0.226167, -0.7753615, -4.877841, 0, 0, 0, 1, 1,
-0.2245753, 0.5246661, -2.887809, 0, 0, 0, 1, 1,
-0.2223028, 1.960544, -0.3792709, 0, 0, 0, 1, 1,
-0.2219552, -1.110819, -3.146252, 1, 1, 1, 1, 1,
-0.2177085, 0.1851064, -1.180982, 1, 1, 1, 1, 1,
-0.2157491, 0.2736179, 1.238353, 1, 1, 1, 1, 1,
-0.2145578, 0.8977653, -0.002513904, 1, 1, 1, 1, 1,
-0.2124631, -0.2125997, -3.267672, 1, 1, 1, 1, 1,
-0.2083063, -0.1041151, -0.07103061, 1, 1, 1, 1, 1,
-0.1977058, -1.061684, -4.083419, 1, 1, 1, 1, 1,
-0.1956976, -0.4366825, -1.759191, 1, 1, 1, 1, 1,
-0.1949147, -2.10863, -3.170294, 1, 1, 1, 1, 1,
-0.1899842, -2.358073, -2.452328, 1, 1, 1, 1, 1,
-0.1865695, -0.7642047, -0.6609173, 1, 1, 1, 1, 1,
-0.182442, 0.4660262, 1.676948, 1, 1, 1, 1, 1,
-0.1824268, -0.474996, -2.963135, 1, 1, 1, 1, 1,
-0.1735888, 1.254662, 0.3007469, 1, 1, 1, 1, 1,
-0.1705384, -0.2726983, -2.753676, 1, 1, 1, 1, 1,
-0.1704668, 2.06931, -2.020124, 0, 0, 1, 1, 1,
-0.1667072, -0.4754065, -0.7645202, 1, 0, 0, 1, 1,
-0.1615823, 0.357434, -0.4893567, 1, 0, 0, 1, 1,
-0.1606995, -0.3209877, -3.480458, 1, 0, 0, 1, 1,
-0.1599243, 0.3106071, -0.5615203, 1, 0, 0, 1, 1,
-0.159814, -0.9920263, -4.660245, 1, 0, 0, 1, 1,
-0.1566439, -0.484049, -3.583556, 0, 0, 0, 1, 1,
-0.1523352, 1.04402, -1.344545, 0, 0, 0, 1, 1,
-0.1489088, -0.3350046, -3.88746, 0, 0, 0, 1, 1,
-0.1482505, -1.08642, -3.010301, 0, 0, 0, 1, 1,
-0.1462362, -0.2508355, -1.303966, 0, 0, 0, 1, 1,
-0.1441758, -0.743041, -4.072091, 0, 0, 0, 1, 1,
-0.14355, 1.419101, 1.6156, 0, 0, 0, 1, 1,
-0.1427029, -0.8958288, -3.227461, 1, 1, 1, 1, 1,
-0.1420266, 0.4817163, -0.8201861, 1, 1, 1, 1, 1,
-0.140963, 0.7310825, -1.196707, 1, 1, 1, 1, 1,
-0.1380506, 0.02516481, -2.083082, 1, 1, 1, 1, 1,
-0.1372796, 0.1229519, -3.516931, 1, 1, 1, 1, 1,
-0.1353909, -1.177753, -1.430368, 1, 1, 1, 1, 1,
-0.1345396, -0.005141458, -0.8420785, 1, 1, 1, 1, 1,
-0.1323027, -1.623959, -3.60103, 1, 1, 1, 1, 1,
-0.1307909, -1.052753, -4.454976, 1, 1, 1, 1, 1,
-0.1251168, 2.728058, 1.215915, 1, 1, 1, 1, 1,
-0.1228272, 0.5332745, 0.1525382, 1, 1, 1, 1, 1,
-0.1206635, -0.02866548, -1.437775, 1, 1, 1, 1, 1,
-0.1204619, 0.714594, -1.505128, 1, 1, 1, 1, 1,
-0.1198075, 0.6233646, -0.7459842, 1, 1, 1, 1, 1,
-0.1079421, 0.1291695, -0.01322639, 1, 1, 1, 1, 1,
-0.1042206, -0.2187275, -2.298843, 0, 0, 1, 1, 1,
-0.1019533, 0.4903837, 1.471174, 1, 0, 0, 1, 1,
-0.0986544, -2.486918, -3.813603, 1, 0, 0, 1, 1,
-0.09828235, 1.304367, -0.08364258, 1, 0, 0, 1, 1,
-0.09532636, 0.9206136, -0.7884694, 1, 0, 0, 1, 1,
-0.09391733, -1.377535, -3.354819, 1, 0, 0, 1, 1,
-0.08907648, 0.4298873, 0.9311305, 0, 0, 0, 1, 1,
-0.08776329, 1.219427, 2.720688, 0, 0, 0, 1, 1,
-0.08751338, 1.080099, 0.6348231, 0, 0, 0, 1, 1,
-0.0842391, -1.191526, -5.026391, 0, 0, 0, 1, 1,
-0.08386325, -0.1361902, -1.446292, 0, 0, 0, 1, 1,
-0.08308456, -0.2388022, -2.459902, 0, 0, 0, 1, 1,
-0.08041301, 0.1215671, 0.5955355, 0, 0, 0, 1, 1,
-0.08024082, -0.2715185, -1.359847, 1, 1, 1, 1, 1,
-0.07267072, 0.03345041, -2.315742, 1, 1, 1, 1, 1,
-0.0669634, 0.5347801, -1.150312, 1, 1, 1, 1, 1,
-0.06432138, -0.604936, -2.627284, 1, 1, 1, 1, 1,
-0.06325205, 0.5006808, 1.426758, 1, 1, 1, 1, 1,
-0.06281549, 0.1238272, 0.4786353, 1, 1, 1, 1, 1,
-0.05642482, -1.606309, -4.669317, 1, 1, 1, 1, 1,
-0.05464469, 0.9009283, 0.3603885, 1, 1, 1, 1, 1,
-0.05254634, 0.9011404, -0.366002, 1, 1, 1, 1, 1,
-0.05224031, -1.138001, -4.556999, 1, 1, 1, 1, 1,
-0.05156885, -0.6588057, -2.180619, 1, 1, 1, 1, 1,
-0.04866249, 0.5481537, 0.6010548, 1, 1, 1, 1, 1,
-0.0479622, 0.3144417, 0.2785399, 1, 1, 1, 1, 1,
-0.046405, 0.4732029, 0.3467984, 1, 1, 1, 1, 1,
-0.04246083, -0.8104703, -2.156794, 1, 1, 1, 1, 1,
-0.03993909, -0.7486482, -1.531255, 0, 0, 1, 1, 1,
-0.0382576, 2.316925, 0.9843686, 1, 0, 0, 1, 1,
-0.03641398, 0.07298508, -0.1508323, 1, 0, 0, 1, 1,
-0.03069644, 1.1672, 0.2578925, 1, 0, 0, 1, 1,
-0.03066548, -0.3387288, -4.611327, 1, 0, 0, 1, 1,
-0.03057842, -1.765655, -2.381617, 1, 0, 0, 1, 1,
-0.01494871, -2.122, -2.907784, 0, 0, 0, 1, 1,
-0.007982308, 0.4437969, 0.6529478, 0, 0, 0, 1, 1,
-0.006493285, 0.0860418, -0.6443115, 0, 0, 0, 1, 1,
-0.006203238, -0.6882748, -2.935256, 0, 0, 0, 1, 1,
-0.002998431, 0.01713415, 2.015589, 0, 0, 0, 1, 1,
-0.001465159, -1.009619, -3.156255, 0, 0, 0, 1, 1,
0.001971552, 0.7169428, -0.1548396, 0, 0, 0, 1, 1,
0.002583836, -0.3270241, 2.38796, 1, 1, 1, 1, 1,
0.006019454, 0.2346874, 0.7738222, 1, 1, 1, 1, 1,
0.007116746, -1.06221, 2.940614, 1, 1, 1, 1, 1,
0.01037419, -0.7736768, 2.439636, 1, 1, 1, 1, 1,
0.01369921, -0.08916789, 3.288186, 1, 1, 1, 1, 1,
0.02311086, -0.2861511, 5.315029, 1, 1, 1, 1, 1,
0.02931795, 1.522998, -1.059844, 1, 1, 1, 1, 1,
0.03437011, -1.468239, 4.17823, 1, 1, 1, 1, 1,
0.03667488, -0.12456, 1.245499, 1, 1, 1, 1, 1,
0.0373266, -2.199872, 2.041782, 1, 1, 1, 1, 1,
0.0396456, -0.7374781, 2.333744, 1, 1, 1, 1, 1,
0.03968113, -0.4104176, 4.142112, 1, 1, 1, 1, 1,
0.04367052, -0.2441413, 4.487849, 1, 1, 1, 1, 1,
0.05215033, 0.1013813, -1.003167, 1, 1, 1, 1, 1,
0.05700607, 0.5775084, -1.396398, 1, 1, 1, 1, 1,
0.05875261, -0.9578798, 3.974842, 0, 0, 1, 1, 1,
0.06282036, 1.321643, -2.303327, 1, 0, 0, 1, 1,
0.06538533, 0.8543965, -1.509779, 1, 0, 0, 1, 1,
0.06984801, -0.4666343, 3.353702, 1, 0, 0, 1, 1,
0.07366906, -1.26432, 2.191457, 1, 0, 0, 1, 1,
0.07819438, 0.05508373, 0.6535667, 1, 0, 0, 1, 1,
0.07840769, 1.330134, -0.2120619, 0, 0, 0, 1, 1,
0.08097617, -0.2958951, 1.425021, 0, 0, 0, 1, 1,
0.08266452, -0.8709917, 2.844899, 0, 0, 0, 1, 1,
0.08454276, 0.7260221, -0.5730775, 0, 0, 0, 1, 1,
0.08831013, -1.120985, 4.405937, 0, 0, 0, 1, 1,
0.09452581, 0.335368, 1.143204, 0, 0, 0, 1, 1,
0.09504613, -0.2463628, 1.547557, 0, 0, 0, 1, 1,
0.09543316, -0.8962231, 3.774486, 1, 1, 1, 1, 1,
0.09990643, 0.2376913, -0.4671434, 1, 1, 1, 1, 1,
0.1034203, -0.6341664, 3.896825, 1, 1, 1, 1, 1,
0.1118773, -0.08545249, 1.474464, 1, 1, 1, 1, 1,
0.118527, -1.108059, 3.011984, 1, 1, 1, 1, 1,
0.1207485, -0.4040715, 1.063891, 1, 1, 1, 1, 1,
0.1234525, -0.5719314, 1.165306, 1, 1, 1, 1, 1,
0.1241534, -0.2690794, 3.777953, 1, 1, 1, 1, 1,
0.1251528, 0.5584416, -0.1284988, 1, 1, 1, 1, 1,
0.1287185, 1.224431, 0.5626854, 1, 1, 1, 1, 1,
0.129382, 1.053545, -1.340507, 1, 1, 1, 1, 1,
0.1326634, -0.2405364, 2.323555, 1, 1, 1, 1, 1,
0.1361231, -1.053464, 5.802306, 1, 1, 1, 1, 1,
0.136873, 0.618488, 1.108781, 1, 1, 1, 1, 1,
0.1386428, 0.2042068, 1.240674, 1, 1, 1, 1, 1,
0.1427184, 1.014264, 2.156221, 0, 0, 1, 1, 1,
0.1444088, 1.838384, -0.7627079, 1, 0, 0, 1, 1,
0.1466273, 0.2050686, 0.2731669, 1, 0, 0, 1, 1,
0.1486253, -0.6913384, 5.893373, 1, 0, 0, 1, 1,
0.1507813, 0.1742912, -0.6228454, 1, 0, 0, 1, 1,
0.1517091, 2.952963, -1.008092, 1, 0, 0, 1, 1,
0.1524953, -0.2091814, 2.901642, 0, 0, 0, 1, 1,
0.1531184, 0.306013, 0.2645234, 0, 0, 0, 1, 1,
0.1537883, 0.5645334, -1.405998, 0, 0, 0, 1, 1,
0.1556863, 0.1477658, -0.5264216, 0, 0, 0, 1, 1,
0.1558427, -0.1713686, 1.49172, 0, 0, 0, 1, 1,
0.1559038, -0.3001307, 4.085467, 0, 0, 0, 1, 1,
0.1609622, -0.1847177, 3.49236, 0, 0, 0, 1, 1,
0.1614683, -1.154048, 4.756568, 1, 1, 1, 1, 1,
0.1673305, -0.3606472, 2.195698, 1, 1, 1, 1, 1,
0.170901, 0.104124, 1.356762, 1, 1, 1, 1, 1,
0.1716276, 0.09352576, 0.7084664, 1, 1, 1, 1, 1,
0.1749233, -1.588647, 2.783932, 1, 1, 1, 1, 1,
0.1831423, -0.3584559, 2.995452, 1, 1, 1, 1, 1,
0.187519, -0.01781086, 1.248243, 1, 1, 1, 1, 1,
0.1894695, 0.3463416, 1.405206, 1, 1, 1, 1, 1,
0.1981105, 1.256009, 1.262145, 1, 1, 1, 1, 1,
0.198323, 1.47221, 1.069207, 1, 1, 1, 1, 1,
0.2009507, 1.11, -0.5991338, 1, 1, 1, 1, 1,
0.2042408, -1.575644, 3.177716, 1, 1, 1, 1, 1,
0.2043808, -0.5641701, 2.182945, 1, 1, 1, 1, 1,
0.2049087, 0.09628479, 2.44385, 1, 1, 1, 1, 1,
0.2095674, 0.7079531, 0.2693382, 1, 1, 1, 1, 1,
0.2129684, -0.1712091, 1.76951, 0, 0, 1, 1, 1,
0.219465, -0.2994224, 2.86097, 1, 0, 0, 1, 1,
0.2198101, 1.458299, 0.6051753, 1, 0, 0, 1, 1,
0.2209605, -0.5579979, 3.025657, 1, 0, 0, 1, 1,
0.2247776, -0.5584084, 2.31601, 1, 0, 0, 1, 1,
0.2255734, 0.2322612, -0.2815253, 1, 0, 0, 1, 1,
0.2261, 0.7866731, 0.7328656, 0, 0, 0, 1, 1,
0.2275464, 1.467631, 0.09341706, 0, 0, 0, 1, 1,
0.2416515, 0.7217587, 1.506101, 0, 0, 0, 1, 1,
0.2541757, -0.8747839, 3.848015, 0, 0, 0, 1, 1,
0.256777, -0.4672422, 3.197159, 0, 0, 0, 1, 1,
0.2579251, 0.2779528, 0.5589828, 0, 0, 0, 1, 1,
0.2583612, 1.872183, -0.3546487, 0, 0, 0, 1, 1,
0.2587227, -1.696034, 4.444594, 1, 1, 1, 1, 1,
0.2609311, 0.7691113, 0.9062121, 1, 1, 1, 1, 1,
0.2622631, -1.823679, 2.264993, 1, 1, 1, 1, 1,
0.2625345, -1.721412, 2.637726, 1, 1, 1, 1, 1,
0.2656597, 1.053393, 0.4448882, 1, 1, 1, 1, 1,
0.2707498, 1.04652, -1.224352, 1, 1, 1, 1, 1,
0.2782538, 0.1803567, 0.169893, 1, 1, 1, 1, 1,
0.2786737, 0.3004846, 0.5208938, 1, 1, 1, 1, 1,
0.2797218, 1.112646, -0.6083511, 1, 1, 1, 1, 1,
0.280137, 1.723772, 0.8764554, 1, 1, 1, 1, 1,
0.2804528, -1.438868, 2.892583, 1, 1, 1, 1, 1,
0.2853851, 0.5659966, 1.00834, 1, 1, 1, 1, 1,
0.2866019, -0.4635366, 3.096399, 1, 1, 1, 1, 1,
0.2882843, -0.04572422, 3.275779, 1, 1, 1, 1, 1,
0.2964085, 1.272727, 0.1060295, 1, 1, 1, 1, 1,
0.2996663, -0.6637791, 3.976248, 0, 0, 1, 1, 1,
0.3020426, -0.01630405, 0.6343136, 1, 0, 0, 1, 1,
0.3049255, -1.191424, 4.376026, 1, 0, 0, 1, 1,
0.3131199, 0.817824, -0.3166343, 1, 0, 0, 1, 1,
0.3142197, -0.3269143, 2.739318, 1, 0, 0, 1, 1,
0.3146956, 0.3023832, 0.2195894, 1, 0, 0, 1, 1,
0.316666, 0.3919071, 1.450373, 0, 0, 0, 1, 1,
0.318723, 0.1214599, -1.026497, 0, 0, 0, 1, 1,
0.3256646, 0.5093857, 0.839367, 0, 0, 0, 1, 1,
0.3267678, 2.319043, 2.207305, 0, 0, 0, 1, 1,
0.3303212, -0.5544084, 1.953534, 0, 0, 0, 1, 1,
0.3331342, 1.272647, 1.13111, 0, 0, 0, 1, 1,
0.3351682, 0.2009985, 0.7636406, 0, 0, 0, 1, 1,
0.3378254, -0.5846289, 2.32707, 1, 1, 1, 1, 1,
0.3460164, -0.4345111, 4.172535, 1, 1, 1, 1, 1,
0.3470988, -1.312423, 1.566156, 1, 1, 1, 1, 1,
0.3497265, -1.592773, 3.589236, 1, 1, 1, 1, 1,
0.3505364, 0.6021762, 1.239511, 1, 1, 1, 1, 1,
0.3511382, 0.249039, -0.06766699, 1, 1, 1, 1, 1,
0.3538585, 2.051456, -0.6545944, 1, 1, 1, 1, 1,
0.3572067, -1.93474, 3.964491, 1, 1, 1, 1, 1,
0.3586816, -1.403043, 2.723589, 1, 1, 1, 1, 1,
0.3593905, -0.8014505, 3.124801, 1, 1, 1, 1, 1,
0.3623258, -1.761495, 2.241842, 1, 1, 1, 1, 1,
0.364358, -0.08422931, 2.415178, 1, 1, 1, 1, 1,
0.3685931, 0.1022359, 0.2667122, 1, 1, 1, 1, 1,
0.3691088, 0.5129082, 0.3106399, 1, 1, 1, 1, 1,
0.3748148, 0.562776, 3.167697, 1, 1, 1, 1, 1,
0.3748754, 1.581771, 1.477755, 0, 0, 1, 1, 1,
0.382503, 0.2230152, 1.53781, 1, 0, 0, 1, 1,
0.3848636, -0.6363755, 2.641328, 1, 0, 0, 1, 1,
0.3849162, -1.16748, 2.776992, 1, 0, 0, 1, 1,
0.3888137, -0.535816, 2.340194, 1, 0, 0, 1, 1,
0.3961734, -0.7960779, 3.825008, 1, 0, 0, 1, 1,
0.3970197, 0.4762991, 1.432977, 0, 0, 0, 1, 1,
0.4012985, 0.7079968, 1.147399, 0, 0, 0, 1, 1,
0.4035636, 0.3312975, 1.256323, 0, 0, 0, 1, 1,
0.4082782, -0.4697847, 4.348543, 0, 0, 0, 1, 1,
0.4085839, -0.749964, 3.041093, 0, 0, 0, 1, 1,
0.4141071, -0.5467339, 2.629211, 0, 0, 0, 1, 1,
0.4159914, 0.8766169, 1.452657, 0, 0, 0, 1, 1,
0.4170959, 0.7598421, -0.3603838, 1, 1, 1, 1, 1,
0.4195214, 0.2095144, 0.3241675, 1, 1, 1, 1, 1,
0.4266683, 0.5218045, 0.299674, 1, 1, 1, 1, 1,
0.4268682, 0.0602749, 0.8813283, 1, 1, 1, 1, 1,
0.4271294, -1.204245, 2.534354, 1, 1, 1, 1, 1,
0.4314997, 0.3264693, 1.173365, 1, 1, 1, 1, 1,
0.4328721, 0.06358538, -0.5825818, 1, 1, 1, 1, 1,
0.4459066, 0.839199, -0.7150126, 1, 1, 1, 1, 1,
0.4467393, 0.8066314, 1.376034, 1, 1, 1, 1, 1,
0.4474248, -0.228917, 1.998534, 1, 1, 1, 1, 1,
0.4482218, -0.3438996, 1.721942, 1, 1, 1, 1, 1,
0.4487102, 1.779765, -0.200605, 1, 1, 1, 1, 1,
0.4492662, 1.144097, 1.658151, 1, 1, 1, 1, 1,
0.4496601, 0.0634644, 0.3206218, 1, 1, 1, 1, 1,
0.4509092, 1.361233, 0.3545372, 1, 1, 1, 1, 1,
0.4525153, -1.199813, 1.922847, 0, 0, 1, 1, 1,
0.4531361, -0.07166749, 1.45976, 1, 0, 0, 1, 1,
0.4535703, -0.140411, 3.117781, 1, 0, 0, 1, 1,
0.4574822, -0.3378835, 2.435433, 1, 0, 0, 1, 1,
0.4578706, 0.2218823, 1.708161, 1, 0, 0, 1, 1,
0.4611573, 0.5559659, -1.017345, 1, 0, 0, 1, 1,
0.4613023, 0.08190944, 1.921102, 0, 0, 0, 1, 1,
0.4630615, -1.466329, 1.656234, 0, 0, 0, 1, 1,
0.471691, 0.3285315, 0.4811757, 0, 0, 0, 1, 1,
0.4833573, -0.7105417, 1.506256, 0, 0, 0, 1, 1,
0.4834878, -0.4368064, 0.3617264, 0, 0, 0, 1, 1,
0.4838488, 0.9407088, 3.051584, 0, 0, 0, 1, 1,
0.4838659, 1.518054, 0.6848121, 0, 0, 0, 1, 1,
0.4851006, -0.4909843, 3.52793, 1, 1, 1, 1, 1,
0.4855247, -0.6680272, 3.24378, 1, 1, 1, 1, 1,
0.4855287, -0.2631814, 2.53018, 1, 1, 1, 1, 1,
0.4855509, -0.3909856, 4.204891, 1, 1, 1, 1, 1,
0.4865347, -0.334298, 4.285615, 1, 1, 1, 1, 1,
0.4874811, 1.298887, 0.3038817, 1, 1, 1, 1, 1,
0.4879458, -0.8930134, 3.140745, 1, 1, 1, 1, 1,
0.4927884, -0.690296, 2.572089, 1, 1, 1, 1, 1,
0.4967237, 0.1238621, 0.2597548, 1, 1, 1, 1, 1,
0.4991547, 0.6911822, 2.689884, 1, 1, 1, 1, 1,
0.4991729, 0.5028681, 0.4389379, 1, 1, 1, 1, 1,
0.4996718, -0.1267959, 1.850636, 1, 1, 1, 1, 1,
0.5007348, 2.12427, 0.2533388, 1, 1, 1, 1, 1,
0.5009369, 2.666407, 0.7644868, 1, 1, 1, 1, 1,
0.5015477, -0.1848854, 2.56879, 1, 1, 1, 1, 1,
0.5025337, -0.1411247, 2.460209, 0, 0, 1, 1, 1,
0.5160487, -1.856433, 1.907389, 1, 0, 0, 1, 1,
0.5199552, 0.343729, 0.3185377, 1, 0, 0, 1, 1,
0.5216379, -0.1803608, 0.1876066, 1, 0, 0, 1, 1,
0.5227891, 1.609826, 0.6061594, 1, 0, 0, 1, 1,
0.5258884, 1.312708, 0.6156443, 1, 0, 0, 1, 1,
0.5263603, 1.713645, 1.199318, 0, 0, 0, 1, 1,
0.5312728, -0.4715234, 2.04463, 0, 0, 0, 1, 1,
0.5317544, 0.2401333, 1.414945, 0, 0, 0, 1, 1,
0.5322016, 0.7458366, 0.5841273, 0, 0, 0, 1, 1,
0.5347031, 0.8554273, -1.14708, 0, 0, 0, 1, 1,
0.5347823, -2.561247, 4.063758, 0, 0, 0, 1, 1,
0.5413189, 0.2831296, 0.302828, 0, 0, 0, 1, 1,
0.5414154, -1.231474, 1.711909, 1, 1, 1, 1, 1,
0.5439345, 1.656982, -0.09199464, 1, 1, 1, 1, 1,
0.5476983, 0.4695009, -0.6436414, 1, 1, 1, 1, 1,
0.5484611, 1.929894, 0.02742573, 1, 1, 1, 1, 1,
0.5582217, 0.9023179, 0.4460315, 1, 1, 1, 1, 1,
0.559831, 0.1743916, 2.370249, 1, 1, 1, 1, 1,
0.5609309, -0.4417809, 2.921948, 1, 1, 1, 1, 1,
0.5628349, 0.278577, 0.5653417, 1, 1, 1, 1, 1,
0.5631006, -1.237157, 3.099523, 1, 1, 1, 1, 1,
0.5640246, -1.040319, 1.547726, 1, 1, 1, 1, 1,
0.567364, -1.365927, 3.865945, 1, 1, 1, 1, 1,
0.5692563, 0.2815461, 0.7871045, 1, 1, 1, 1, 1,
0.5695989, 0.1163633, 0.4342915, 1, 1, 1, 1, 1,
0.5778806, -0.02720941, 2.861748, 1, 1, 1, 1, 1,
0.5791651, -0.405148, 2.784218, 1, 1, 1, 1, 1,
0.5793532, -0.9055408, 3.302214, 0, 0, 1, 1, 1,
0.5839063, 0.3642251, 1.16007, 1, 0, 0, 1, 1,
0.585142, 1.43895, 0.2496589, 1, 0, 0, 1, 1,
0.5924092, 0.2316607, 1.122255, 1, 0, 0, 1, 1,
0.5983596, -0.5439466, 3.221836, 1, 0, 0, 1, 1,
0.5988631, -2.016876, 4.081821, 1, 0, 0, 1, 1,
0.5989481, 1.289946, 0.9403653, 0, 0, 0, 1, 1,
0.5992593, 1.82399, 0.755311, 0, 0, 0, 1, 1,
0.599363, 0.08632431, 1.72308, 0, 0, 0, 1, 1,
0.6008165, -0.2729236, 0.3264169, 0, 0, 0, 1, 1,
0.601321, -0.4879457, 2.016576, 0, 0, 0, 1, 1,
0.603344, -0.05744068, 0.8119491, 0, 0, 0, 1, 1,
0.6034149, 0.07513652, 2.082211, 0, 0, 0, 1, 1,
0.6073017, 1.195733, 0.7876941, 1, 1, 1, 1, 1,
0.6119685, -1.547552, 3.152503, 1, 1, 1, 1, 1,
0.6128219, -0.6607202, 3.452508, 1, 1, 1, 1, 1,
0.6149312, -0.1273163, 0.9492454, 1, 1, 1, 1, 1,
0.619947, -0.2292025, 1.62351, 1, 1, 1, 1, 1,
0.6323913, -0.1093589, 2.095578, 1, 1, 1, 1, 1,
0.6401684, 1.130065, 1.311351, 1, 1, 1, 1, 1,
0.6433706, -0.3286241, 0.6094064, 1, 1, 1, 1, 1,
0.645355, 2.055298, -1.626428, 1, 1, 1, 1, 1,
0.6474283, -0.1443981, 2.321394, 1, 1, 1, 1, 1,
0.6477253, -1.644791, 2.479808, 1, 1, 1, 1, 1,
0.6492674, 0.06500259, 0.2079416, 1, 1, 1, 1, 1,
0.6525785, 1.149206, 0.1009198, 1, 1, 1, 1, 1,
0.6531463, 0.8812725, 1.498807, 1, 1, 1, 1, 1,
0.654129, 0.4136502, 0.1423763, 1, 1, 1, 1, 1,
0.6594664, -0.6922731, 1.861703, 0, 0, 1, 1, 1,
0.6596425, 1.647969, 1.772428, 1, 0, 0, 1, 1,
0.660743, -1.453911, 4.303036, 1, 0, 0, 1, 1,
0.6633797, 0.03233225, 2.328777, 1, 0, 0, 1, 1,
0.6640509, 0.4459019, 1.290778, 1, 0, 0, 1, 1,
0.6646845, 0.04774444, 3.085676, 1, 0, 0, 1, 1,
0.6648988, -0.3872243, 1.752348, 0, 0, 0, 1, 1,
0.6726515, 0.7236449, 0.3115996, 0, 0, 0, 1, 1,
0.6729332, 0.3886218, 1.658747, 0, 0, 0, 1, 1,
0.6734725, -0.392178, 2.024749, 0, 0, 0, 1, 1,
0.676407, 1.132314, 1.814763, 0, 0, 0, 1, 1,
0.6777977, 2.458257, -0.3828994, 0, 0, 0, 1, 1,
0.6858144, -0.8399001, 3.055378, 0, 0, 0, 1, 1,
0.6919764, 0.5502772, -1.375543, 1, 1, 1, 1, 1,
0.6929198, -1.210111, 2.829119, 1, 1, 1, 1, 1,
0.7023067, -0.7641522, 3.421933, 1, 1, 1, 1, 1,
0.7099012, 1.026867, 2.081294, 1, 1, 1, 1, 1,
0.7108599, -0.7574754, 4.026841, 1, 1, 1, 1, 1,
0.7109497, 0.8899044, 0.2970287, 1, 1, 1, 1, 1,
0.7110869, -1.001961, 3.050228, 1, 1, 1, 1, 1,
0.7209954, -0.3291946, 2.390352, 1, 1, 1, 1, 1,
0.7279729, 1.751372, 1.096528, 1, 1, 1, 1, 1,
0.7330027, 0.4706115, 0.869541, 1, 1, 1, 1, 1,
0.7358131, -1.201891, 2.950596, 1, 1, 1, 1, 1,
0.7404549, 0.9504927, 2.273529, 1, 1, 1, 1, 1,
0.7463821, -0.4311826, 2.473849, 1, 1, 1, 1, 1,
0.7556074, -0.3058278, 4.512705, 1, 1, 1, 1, 1,
0.7568975, 0.4392042, 1.308639, 1, 1, 1, 1, 1,
0.7633684, -0.6062607, 1.750727, 0, 0, 1, 1, 1,
0.7638127, 2.234418, 0.9381421, 1, 0, 0, 1, 1,
0.7668945, 1.03232, -0.6357905, 1, 0, 0, 1, 1,
0.7713305, 0.7146538, 1.003696, 1, 0, 0, 1, 1,
0.7720095, 0.6580918, 1.600556, 1, 0, 0, 1, 1,
0.7733555, -0.1014898, 0.7047352, 1, 0, 0, 1, 1,
0.7747495, 0.2081613, 0.1335139, 0, 0, 0, 1, 1,
0.7790499, -0.1984866, 3.405182, 0, 0, 0, 1, 1,
0.7793986, 0.4845421, 1.806638, 0, 0, 0, 1, 1,
0.7826026, -0.4495924, 2.557219, 0, 0, 0, 1, 1,
0.7847394, -1.319985, 3.147115, 0, 0, 0, 1, 1,
0.7855336, 0.8696978, 2.290783, 0, 0, 0, 1, 1,
0.7862335, 2.641644, 2.063607, 0, 0, 0, 1, 1,
0.7871367, 1.903814, 0.06546022, 1, 1, 1, 1, 1,
0.7917458, 0.6111735, 0.5225963, 1, 1, 1, 1, 1,
0.7919862, 0.08926638, 2.358197, 1, 1, 1, 1, 1,
0.7991254, -0.6025525, 2.715288, 1, 1, 1, 1, 1,
0.8095362, -1.284721, 0.1893686, 1, 1, 1, 1, 1,
0.8120886, -0.05758683, 1.712941, 1, 1, 1, 1, 1,
0.818099, 0.6158326, -0.1478409, 1, 1, 1, 1, 1,
0.8196161, 0.8789406, -0.3869354, 1, 1, 1, 1, 1,
0.8307392, -1.354666, 2.119118, 1, 1, 1, 1, 1,
0.8351447, -0.7157062, 1.128591, 1, 1, 1, 1, 1,
0.8366411, -0.7449243, 3.089765, 1, 1, 1, 1, 1,
0.8370253, 0.2387395, 2.325072, 1, 1, 1, 1, 1,
0.8375278, 2.597018, 0.5538133, 1, 1, 1, 1, 1,
0.8384804, 0.2924012, 2.322883, 1, 1, 1, 1, 1,
0.8503047, -0.1594839, 1.11437, 1, 1, 1, 1, 1,
0.8597058, 2.067912, 0.02730428, 0, 0, 1, 1, 1,
0.8643629, 0.9289526, 0.2878802, 1, 0, 0, 1, 1,
0.877046, -1.315482, 1.664615, 1, 0, 0, 1, 1,
0.8936208, -0.2090665, 1.064375, 1, 0, 0, 1, 1,
0.8940281, -0.0883964, 1.506416, 1, 0, 0, 1, 1,
0.899536, -0.9570115, 1.870703, 1, 0, 0, 1, 1,
0.9018533, -0.2069377, 0.7593349, 0, 0, 0, 1, 1,
0.9079115, 0.4447199, -0.2085359, 0, 0, 0, 1, 1,
0.9085718, -0.5406755, 3.206355, 0, 0, 0, 1, 1,
0.9089336, -0.5244827, 2.694767, 0, 0, 0, 1, 1,
0.9089425, 0.05195893, -0.05183432, 0, 0, 0, 1, 1,
0.9095395, 0.3327103, 2.110217, 0, 0, 0, 1, 1,
0.9140666, 0.4266608, 1.061648, 0, 0, 0, 1, 1,
0.9152896, -0.1659158, 1.849792, 1, 1, 1, 1, 1,
0.9202091, -0.3303442, 1.484188, 1, 1, 1, 1, 1,
0.9203488, -1.529652, 1.148767, 1, 1, 1, 1, 1,
0.9206415, -0.7287455, -0.2149314, 1, 1, 1, 1, 1,
0.9219657, -0.6122398, 3.032207, 1, 1, 1, 1, 1,
0.9229676, -0.8975194, 0.8083375, 1, 1, 1, 1, 1,
0.9239351, 0.2296905, -0.4345294, 1, 1, 1, 1, 1,
0.9279538, -0.1846578, 3.030993, 1, 1, 1, 1, 1,
0.9313952, -2.108212, 1.330951, 1, 1, 1, 1, 1,
0.9354587, 0.7298199, 1.227929, 1, 1, 1, 1, 1,
0.9357238, -1.26352, 3.482327, 1, 1, 1, 1, 1,
0.9408068, -0.3464178, 0.9425644, 1, 1, 1, 1, 1,
0.9596331, -0.9448019, 1.80002, 1, 1, 1, 1, 1,
0.9603621, -0.7593394, 1.638001, 1, 1, 1, 1, 1,
0.965075, 0.4943992, 3.144125, 1, 1, 1, 1, 1,
0.9666741, 0.3336741, 1.833899, 0, 0, 1, 1, 1,
0.9690116, -0.03593627, 1.066934, 1, 0, 0, 1, 1,
0.9764525, 0.2409746, 1.036172, 1, 0, 0, 1, 1,
0.9767433, -0.590504, 3.244939, 1, 0, 0, 1, 1,
0.9807196, 0.2546317, 0.2718042, 1, 0, 0, 1, 1,
0.986656, 0.6079023, 0.6883379, 1, 0, 0, 1, 1,
0.9947152, 0.1588978, -0.6073779, 0, 0, 0, 1, 1,
0.998584, -1.416943, 1.113698, 0, 0, 0, 1, 1,
0.9987279, -2.07604, 1.427833, 0, 0, 0, 1, 1,
0.9992123, 0.7678139, 1.898655, 0, 0, 0, 1, 1,
1.002346, -1.387578, 3.055724, 0, 0, 0, 1, 1,
1.005374, 0.01458157, 3.011249, 0, 0, 0, 1, 1,
1.008085, -0.4253846, 0.286761, 0, 0, 0, 1, 1,
1.018989, -0.2296975, 3.034006, 1, 1, 1, 1, 1,
1.02065, 0.7585796, 0.7854189, 1, 1, 1, 1, 1,
1.021807, 0.9349881, 3.148214, 1, 1, 1, 1, 1,
1.030941, -0.5068626, 1.993119, 1, 1, 1, 1, 1,
1.03419, -0.8791462, 0.09129415, 1, 1, 1, 1, 1,
1.039208, 0.8127032, -0.8278633, 1, 1, 1, 1, 1,
1.048087, 1.696155, 0.6023335, 1, 1, 1, 1, 1,
1.051756, -0.4845041, 2.989419, 1, 1, 1, 1, 1,
1.055874, -0.4405053, 2.13427, 1, 1, 1, 1, 1,
1.056895, 1.063355, 1.280974, 1, 1, 1, 1, 1,
1.063386, -1.260411, 2.05508, 1, 1, 1, 1, 1,
1.064413, -1.399861, 4.139734, 1, 1, 1, 1, 1,
1.064729, 1.361864, 0.4127371, 1, 1, 1, 1, 1,
1.076664, 0.30199, 1.399048, 1, 1, 1, 1, 1,
1.083815, 0.09278537, 1.527028, 1, 1, 1, 1, 1,
1.086073, -0.77812, 3.705652, 0, 0, 1, 1, 1,
1.08611, -1.139572, 4.446756, 1, 0, 0, 1, 1,
1.086686, -0.3930539, 1.705933, 1, 0, 0, 1, 1,
1.088831, 0.5136415, 0.4831626, 1, 0, 0, 1, 1,
1.095698, 0.537301, 1.439352, 1, 0, 0, 1, 1,
1.106042, 0.2698754, 0.6918184, 1, 0, 0, 1, 1,
1.106749, 0.0714941, 2.818196, 0, 0, 0, 1, 1,
1.114455, 1.109619, 1.552024, 0, 0, 0, 1, 1,
1.1349, -0.6082859, 3.234813, 0, 0, 0, 1, 1,
1.140989, 0.9825845, 0.8648892, 0, 0, 0, 1, 1,
1.14747, -1.959336, 3.874174, 0, 0, 0, 1, 1,
1.14805, 0.9028922, 2.90627, 0, 0, 0, 1, 1,
1.152724, -0.316296, 2.512733, 0, 0, 0, 1, 1,
1.159282, -1.155263, 0.7332297, 1, 1, 1, 1, 1,
1.167348, 1.253147, -0.1804295, 1, 1, 1, 1, 1,
1.179908, 0.7527053, 1.773778, 1, 1, 1, 1, 1,
1.183608, -1.264959, 0.7784144, 1, 1, 1, 1, 1,
1.188343, 0.6598465, 1.876486, 1, 1, 1, 1, 1,
1.192127, -0.9497414, 1.813531, 1, 1, 1, 1, 1,
1.197838, 1.119107, 0.1669014, 1, 1, 1, 1, 1,
1.199407, 1.151287, 1.283017, 1, 1, 1, 1, 1,
1.206284, -0.5916654, 2.249197, 1, 1, 1, 1, 1,
1.213673, 1.020893, 2.154439, 1, 1, 1, 1, 1,
1.222276, 0.7949079, 1.262034, 1, 1, 1, 1, 1,
1.229193, 2.03248, 1.552075, 1, 1, 1, 1, 1,
1.239448, 0.3625788, 1.244406, 1, 1, 1, 1, 1,
1.241544, 0.09189478, 0.03277309, 1, 1, 1, 1, 1,
1.252219, 0.6185025, 0.3520551, 1, 1, 1, 1, 1,
1.252495, 0.7240064, 1.95717, 0, 0, 1, 1, 1,
1.261888, -1.05545, 2.986973, 1, 0, 0, 1, 1,
1.265071, -1.001273, 3.301414, 1, 0, 0, 1, 1,
1.265795, 1.658387, -0.1185625, 1, 0, 0, 1, 1,
1.265942, 0.06450289, 2.465145, 1, 0, 0, 1, 1,
1.269856, 0.2605101, 1.941015, 1, 0, 0, 1, 1,
1.271271, -0.5580714, 3.855849, 0, 0, 0, 1, 1,
1.274532, -0.1578199, 1.76215, 0, 0, 0, 1, 1,
1.276113, -1.356131, 2.660188, 0, 0, 0, 1, 1,
1.277512, 1.13763, 0.9442251, 0, 0, 0, 1, 1,
1.299295, -0.6167993, 1.335825, 0, 0, 0, 1, 1,
1.309697, 0.2616535, 1.739728, 0, 0, 0, 1, 1,
1.314476, 1.789774, 1.187841, 0, 0, 0, 1, 1,
1.317108, 0.6232968, 3.226654, 1, 1, 1, 1, 1,
1.322641, 1.35419, 0.760954, 1, 1, 1, 1, 1,
1.329125, -0.8829532, 2.014133, 1, 1, 1, 1, 1,
1.337738, -0.9475513, 1.600079, 1, 1, 1, 1, 1,
1.342916, 1.478649, 1.67495, 1, 1, 1, 1, 1,
1.34359, 0.5697315, -0.9207643, 1, 1, 1, 1, 1,
1.35063, -0.2259426, 0.8372615, 1, 1, 1, 1, 1,
1.352505, -1.450757, 1.335019, 1, 1, 1, 1, 1,
1.353151, 0.4293282, -1.195029, 1, 1, 1, 1, 1,
1.362337, -0.1549877, 0.8179412, 1, 1, 1, 1, 1,
1.36666, 0.1579823, 1.698408, 1, 1, 1, 1, 1,
1.368045, 1.386356, 0.8396192, 1, 1, 1, 1, 1,
1.368075, 1.4192, 1.806831, 1, 1, 1, 1, 1,
1.368901, 0.4798747, 1.916108, 1, 1, 1, 1, 1,
1.374314, -0.5247837, 1.085808, 1, 1, 1, 1, 1,
1.376814, 1.699526, 1.205672, 0, 0, 1, 1, 1,
1.38248, 0.06858983, 1.74016, 1, 0, 0, 1, 1,
1.382481, -1.583371, 3.104622, 1, 0, 0, 1, 1,
1.391342, -1.607813, 2.301975, 1, 0, 0, 1, 1,
1.397699, -0.8276017, 1.638215, 1, 0, 0, 1, 1,
1.404397, 1.123765, 0.9474463, 1, 0, 0, 1, 1,
1.407538, 0.3754141, 1.439466, 0, 0, 0, 1, 1,
1.414, 1.569088, 1.036852, 0, 0, 0, 1, 1,
1.422585, 0.2472782, 1.447869, 0, 0, 0, 1, 1,
1.423623, -0.5482864, 3.495663, 0, 0, 0, 1, 1,
1.443622, -0.5164474, 1.665001, 0, 0, 0, 1, 1,
1.455007, -0.4517505, 2.247759, 0, 0, 0, 1, 1,
1.457769, 0.01903162, 1.2511, 0, 0, 0, 1, 1,
1.467059, 0.3949366, 0.6150968, 1, 1, 1, 1, 1,
1.469482, 0.1596151, 1.371587, 1, 1, 1, 1, 1,
1.476184, -0.6501056, 3.760161, 1, 1, 1, 1, 1,
1.478682, -1.647558, 2.494834, 1, 1, 1, 1, 1,
1.481852, -0.6634908, 1.866404, 1, 1, 1, 1, 1,
1.515702, -0.9120844, 1.935184, 1, 1, 1, 1, 1,
1.517928, 0.2942804, 1.560684, 1, 1, 1, 1, 1,
1.526102, 0.7984358, 1.253069, 1, 1, 1, 1, 1,
1.530453, -0.2633213, 0.7896765, 1, 1, 1, 1, 1,
1.555909, -0.3784953, 1.958551, 1, 1, 1, 1, 1,
1.555992, -0.02016982, 1.036517, 1, 1, 1, 1, 1,
1.575611, 1.165307, 2.469846, 1, 1, 1, 1, 1,
1.586072, 0.5645785, 0.9098195, 1, 1, 1, 1, 1,
1.590622, -0.9531558, 4.235605, 1, 1, 1, 1, 1,
1.600553, 1.554821, 1.611295, 1, 1, 1, 1, 1,
1.603372, 1.548448, -1.85879, 0, 0, 1, 1, 1,
1.631943, 1.32739, 0.6004645, 1, 0, 0, 1, 1,
1.637792, -2.006283, 1.387677, 1, 0, 0, 1, 1,
1.656628, 0.03763782, 3.040141, 1, 0, 0, 1, 1,
1.668187, -1.785372, 1.369489, 1, 0, 0, 1, 1,
1.696335, -0.1067432, 0.1162492, 1, 0, 0, 1, 1,
1.696936, -0.4748009, 0.8066971, 0, 0, 0, 1, 1,
1.713027, 1.420802, 1.093429, 0, 0, 0, 1, 1,
1.726974, 1.168872, -0.1731694, 0, 0, 0, 1, 1,
1.756788, -0.5150495, 1.616822, 0, 0, 0, 1, 1,
1.762082, 1.215274, 1.02754, 0, 0, 0, 1, 1,
1.762262, -1.45327, 1.576548, 0, 0, 0, 1, 1,
1.777628, -0.8779602, 2.346593, 0, 0, 0, 1, 1,
1.804281, -1.026414, -0.3743038, 1, 1, 1, 1, 1,
1.811771, -0.1349966, 2.850214, 1, 1, 1, 1, 1,
1.82138, 0.8689248, 0.9524185, 1, 1, 1, 1, 1,
1.822067, 0.8772001, 2.040447, 1, 1, 1, 1, 1,
1.834922, 0.7612062, 1.495989, 1, 1, 1, 1, 1,
1.85675, 0.3781902, -0.2386196, 1, 1, 1, 1, 1,
1.859667, -0.338655, 0.7265324, 1, 1, 1, 1, 1,
1.892487, 1.258142, -0.8870464, 1, 1, 1, 1, 1,
1.894329, 0.4652172, 1.382403, 1, 1, 1, 1, 1,
1.922715, -0.4034, 2.940982, 1, 1, 1, 1, 1,
1.936858, -0.561056, 3.035856, 1, 1, 1, 1, 1,
1.942183, -2.093042, 2.732102, 1, 1, 1, 1, 1,
1.953645, 0.5019519, 0.9762784, 1, 1, 1, 1, 1,
1.989628, 1.314116, 0.4947546, 1, 1, 1, 1, 1,
2.018412, -0.2756943, 2.374387, 1, 1, 1, 1, 1,
2.070633, 1.230928, 1.223354, 0, 0, 1, 1, 1,
2.07227, -0.3926713, 1.590307, 1, 0, 0, 1, 1,
2.078173, 0.5429152, 1.475267, 1, 0, 0, 1, 1,
2.093946, -0.6151434, 0.7884844, 1, 0, 0, 1, 1,
2.102003, -0.1400773, 1.217069, 1, 0, 0, 1, 1,
2.147835, -0.8829464, 1.834137, 1, 0, 0, 1, 1,
2.163561, -0.4999285, 2.848521, 0, 0, 0, 1, 1,
2.178658, 0.02064899, 1.428497, 0, 0, 0, 1, 1,
2.238877, 0.5439095, 1.830092, 0, 0, 0, 1, 1,
2.290993, 0.3136983, 2.50136, 0, 0, 0, 1, 1,
2.308577, -1.403421, 3.814506, 0, 0, 0, 1, 1,
2.310473, -0.3540681, 0.8955753, 0, 0, 0, 1, 1,
2.326236, -0.2231298, 2.4052, 0, 0, 0, 1, 1,
2.475064, -0.4766774, 0.9801968, 1, 1, 1, 1, 1,
2.638457, 0.5170327, 2.739516, 1, 1, 1, 1, 1,
2.669307, -2.092345, 2.469099, 1, 1, 1, 1, 1,
2.871502, -0.9357008, 0.165278, 1, 1, 1, 1, 1,
3.027716, -0.4646187, 1.926293, 1, 1, 1, 1, 1,
3.178797, -1.402552, 3.362459, 1, 1, 1, 1, 1,
3.193524, -3.304796, 2.856164, 1, 1, 1, 1, 1
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
var radius = 9.910781;
var distance = 34.8112;
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
mvMatrix.translate( -0.1039582, 0.06132913, -0.07832003 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.8112);
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
