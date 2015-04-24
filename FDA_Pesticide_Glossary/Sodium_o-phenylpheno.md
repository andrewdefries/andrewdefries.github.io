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
-3.442164, -1.664402, -2.073112, 1, 0, 0, 1,
-3.019537, -0.5439008, -1.913243, 1, 0.007843138, 0, 1,
-2.779276, 0.3352006, -2.047252, 1, 0.01176471, 0, 1,
-2.710095, 0.05969739, -1.497629, 1, 0.01960784, 0, 1,
-2.632867, -0.4134252, -2.229576, 1, 0.02352941, 0, 1,
-2.596607, -0.3127899, -1.964465, 1, 0.03137255, 0, 1,
-2.557376, 0.2891944, -1.50175, 1, 0.03529412, 0, 1,
-2.441943, -0.6533593, -2.669675, 1, 0.04313726, 0, 1,
-2.375123, -0.7186631, -3.396919, 1, 0.04705882, 0, 1,
-2.30011, 0.8984239, -2.655599, 1, 0.05490196, 0, 1,
-2.295909, 0.7411359, 0.1524235, 1, 0.05882353, 0, 1,
-2.292261, -0.7868531, -1.750376, 1, 0.06666667, 0, 1,
-2.29005, -1.699858, 0.03577788, 1, 0.07058824, 0, 1,
-2.28877, 1.641723, -1.547405, 1, 0.07843138, 0, 1,
-2.261683, -1.654901, -2.974801, 1, 0.08235294, 0, 1,
-2.156121, -0.4574475, -2.589546, 1, 0.09019608, 0, 1,
-2.155606, -0.5971918, -2.390941, 1, 0.09411765, 0, 1,
-2.116152, -0.5787514, 0.07877536, 1, 0.1019608, 0, 1,
-2.100299, -1.314922, -2.96011, 1, 0.1098039, 0, 1,
-2.062028, -0.3865995, -2.889388, 1, 0.1137255, 0, 1,
-2.050081, -1.073472, -2.629935, 1, 0.1215686, 0, 1,
-2.031981, 0.2447201, -3.295174, 1, 0.1254902, 0, 1,
-1.994764, -1.534773, -0.4860258, 1, 0.1333333, 0, 1,
-1.967209, -1.565576, -3.270657, 1, 0.1372549, 0, 1,
-1.960174, 0.7678872, -0.6581172, 1, 0.145098, 0, 1,
-1.945207, -1.49568, -2.717584, 1, 0.1490196, 0, 1,
-1.930888, 0.8272609, -0.04257488, 1, 0.1568628, 0, 1,
-1.912012, -1.576766, -0.1312803, 1, 0.1607843, 0, 1,
-1.910011, 0.03236232, -2.097943, 1, 0.1686275, 0, 1,
-1.90734, -1.055608, 0.5407301, 1, 0.172549, 0, 1,
-1.903317, 0.9945332, -2.029693, 1, 0.1803922, 0, 1,
-1.891347, 1.245631, -0.6213594, 1, 0.1843137, 0, 1,
-1.864476, 0.2160525, -2.837758, 1, 0.1921569, 0, 1,
-1.864016, -1.418644, -2.818741, 1, 0.1960784, 0, 1,
-1.862614, -0.5165669, -1.994423, 1, 0.2039216, 0, 1,
-1.847144, 0.1430812, -0.4500822, 1, 0.2117647, 0, 1,
-1.820839, 2.064616, -0.7849395, 1, 0.2156863, 0, 1,
-1.818606, -0.03973531, -1.399472, 1, 0.2235294, 0, 1,
-1.809638, 0.0683274, -1.71533, 1, 0.227451, 0, 1,
-1.805262, -0.7916544, 0.2745025, 1, 0.2352941, 0, 1,
-1.798181, 1.361508, -2.321018, 1, 0.2392157, 0, 1,
-1.794795, -0.08007786, -0.9889564, 1, 0.2470588, 0, 1,
-1.793711, -1.845588, -2.425285, 1, 0.2509804, 0, 1,
-1.78612, -0.1298679, -1.450063, 1, 0.2588235, 0, 1,
-1.779505, 0.1056023, -2.01109, 1, 0.2627451, 0, 1,
-1.748956, -2.306195, -0.0946972, 1, 0.2705882, 0, 1,
-1.74104, 0.03482693, -0.3158689, 1, 0.2745098, 0, 1,
-1.717495, -1.097554, -1.846832, 1, 0.282353, 0, 1,
-1.688559, -0.7953827, -1.31997, 1, 0.2862745, 0, 1,
-1.680645, -0.544302, -3.387732, 1, 0.2941177, 0, 1,
-1.67707, -0.9135414, -1.947199, 1, 0.3019608, 0, 1,
-1.63421, 1.687961, -1.088207, 1, 0.3058824, 0, 1,
-1.630196, -0.9393971, -1.572986, 1, 0.3137255, 0, 1,
-1.605662, 0.2273288, 0.15749, 1, 0.3176471, 0, 1,
-1.602079, -1.194479, -1.383223, 1, 0.3254902, 0, 1,
-1.592375, 0.2331876, -1.153295, 1, 0.3294118, 0, 1,
-1.591321, 0.3036948, -1.371316, 1, 0.3372549, 0, 1,
-1.586977, 0.1242511, -0.3451431, 1, 0.3411765, 0, 1,
-1.585244, 1.331485, -1.626783, 1, 0.3490196, 0, 1,
-1.56418, -1.165437, -3.011306, 1, 0.3529412, 0, 1,
-1.561705, 1.460542, -0.5860923, 1, 0.3607843, 0, 1,
-1.559642, -0.3397309, -1.8196, 1, 0.3647059, 0, 1,
-1.552591, -2.182577, -3.13784, 1, 0.372549, 0, 1,
-1.537947, 0.8745152, 0.4553497, 1, 0.3764706, 0, 1,
-1.533345, 1.644176, -1.790241, 1, 0.3843137, 0, 1,
-1.530926, 1.657649, -0.7304166, 1, 0.3882353, 0, 1,
-1.527272, 0.4837992, -1.344492, 1, 0.3960784, 0, 1,
-1.525411, -0.414722, -2.590891, 1, 0.4039216, 0, 1,
-1.51436, 1.220325, -2.175145, 1, 0.4078431, 0, 1,
-1.513848, 0.003859725, -1.248037, 1, 0.4156863, 0, 1,
-1.513476, 1.555131, -0.08405434, 1, 0.4196078, 0, 1,
-1.495681, -0.4533311, -1.801799, 1, 0.427451, 0, 1,
-1.488443, 0.2988283, -1.139922, 1, 0.4313726, 0, 1,
-1.478772, -2.109478, -5.17989, 1, 0.4392157, 0, 1,
-1.472375, 2.330651, 0.3378964, 1, 0.4431373, 0, 1,
-1.471368, 0.925887, -1.548304, 1, 0.4509804, 0, 1,
-1.465738, -0.06370122, 1.015615, 1, 0.454902, 0, 1,
-1.459427, 0.4801385, -1.264741, 1, 0.4627451, 0, 1,
-1.458854, 1.622597, -0.8044939, 1, 0.4666667, 0, 1,
-1.451645, -0.6763968, -0.8385113, 1, 0.4745098, 0, 1,
-1.449226, -1.580621, -2.888104, 1, 0.4784314, 0, 1,
-1.433122, -0.8705555, -1.224052, 1, 0.4862745, 0, 1,
-1.423938, -0.1195934, -1.780047, 1, 0.4901961, 0, 1,
-1.418573, 0.4282878, 0.3194189, 1, 0.4980392, 0, 1,
-1.415894, 0.04720289, -1.687322, 1, 0.5058824, 0, 1,
-1.407816, 0.8337755, -1.630925, 1, 0.509804, 0, 1,
-1.397978, 1.466602, -1.279152, 1, 0.5176471, 0, 1,
-1.366852, -0.3182285, -3.745432, 1, 0.5215687, 0, 1,
-1.364941, -0.8326623, -2.083708, 1, 0.5294118, 0, 1,
-1.358961, -0.4574435, -1.520673, 1, 0.5333334, 0, 1,
-1.350633, -1.122419, -0.7466353, 1, 0.5411765, 0, 1,
-1.348056, -0.9093671, -1.793891, 1, 0.5450981, 0, 1,
-1.331776, 0.2273648, 0.4855445, 1, 0.5529412, 0, 1,
-1.315912, 0.7563187, -1.166117, 1, 0.5568628, 0, 1,
-1.315071, 2.805162, -0.4498827, 1, 0.5647059, 0, 1,
-1.30468, 1.246398, -0.6561685, 1, 0.5686275, 0, 1,
-1.30149, 2.251526, -0.3911892, 1, 0.5764706, 0, 1,
-1.295448, 0.9472706, -1.540216, 1, 0.5803922, 0, 1,
-1.289553, 0.8918757, 0.3168659, 1, 0.5882353, 0, 1,
-1.289532, -0.8854522, -1.781133, 1, 0.5921569, 0, 1,
-1.288534, 0.2432672, -0.6453525, 1, 0.6, 0, 1,
-1.280174, -1.017025, -1.561187, 1, 0.6078432, 0, 1,
-1.263119, -0.9325775, -1.328087, 1, 0.6117647, 0, 1,
-1.256136, 1.077841, -0.2883321, 1, 0.6196079, 0, 1,
-1.248762, 0.2333443, -1.444952, 1, 0.6235294, 0, 1,
-1.244294, -0.3057287, -0.875273, 1, 0.6313726, 0, 1,
-1.235293, 0.02113811, -2.448831, 1, 0.6352941, 0, 1,
-1.23198, -0.2162252, -3.793987, 1, 0.6431373, 0, 1,
-1.2228, 1.080031, -0.7449504, 1, 0.6470588, 0, 1,
-1.221752, -0.4440614, -0.9750041, 1, 0.654902, 0, 1,
-1.216872, -0.8828616, -1.73203, 1, 0.6588235, 0, 1,
-1.215057, 2.254361, -0.2264321, 1, 0.6666667, 0, 1,
-1.214002, 1.363716, -0.7446993, 1, 0.6705883, 0, 1,
-1.213766, -1.079952, -1.958991, 1, 0.6784314, 0, 1,
-1.198883, -1.252104, -2.718477, 1, 0.682353, 0, 1,
-1.196402, 0.6938992, 0.2796388, 1, 0.6901961, 0, 1,
-1.194817, 0.6687694, -0.6878322, 1, 0.6941177, 0, 1,
-1.188644, 0.7873517, -0.08364433, 1, 0.7019608, 0, 1,
-1.186569, 1.139977, 0.4462998, 1, 0.7098039, 0, 1,
-1.185175, -1.524554, -2.113213, 1, 0.7137255, 0, 1,
-1.185031, 0.3302509, -0.7025103, 1, 0.7215686, 0, 1,
-1.183815, -2.092651, -1.626578, 1, 0.7254902, 0, 1,
-1.18184, 0.2988141, -3.047101, 1, 0.7333333, 0, 1,
-1.175545, 0.2103584, -2.937708, 1, 0.7372549, 0, 1,
-1.173703, -0.1182333, -1.06271, 1, 0.7450981, 0, 1,
-1.173678, -0.544774, -1.320108, 1, 0.7490196, 0, 1,
-1.172899, 0.5139292, -2.149437, 1, 0.7568628, 0, 1,
-1.171623, 0.1556454, -2.000136, 1, 0.7607843, 0, 1,
-1.158688, 0.5473032, -0.01265433, 1, 0.7686275, 0, 1,
-1.152575, -0.5259005, -1.250717, 1, 0.772549, 0, 1,
-1.149238, 0.1179104, -2.613057, 1, 0.7803922, 0, 1,
-1.14619, 0.159265, -0.8701701, 1, 0.7843137, 0, 1,
-1.143497, 2.178524, -0.02473411, 1, 0.7921569, 0, 1,
-1.138008, 0.6173689, 0.06862186, 1, 0.7960784, 0, 1,
-1.121529, 1.079081, -0.9261628, 1, 0.8039216, 0, 1,
-1.119845, 0.3930164, -0.7349506, 1, 0.8117647, 0, 1,
-1.11875, 0.01170374, -1.179272, 1, 0.8156863, 0, 1,
-1.11354, 0.6105056, 0.2044761, 1, 0.8235294, 0, 1,
-1.101403, -1.802973, -3.627161, 1, 0.827451, 0, 1,
-1.101268, 0.3970273, -1.346291, 1, 0.8352941, 0, 1,
-1.096628, 2.69711, 0.03410013, 1, 0.8392157, 0, 1,
-1.086736, 1.478448, -1.22598, 1, 0.8470588, 0, 1,
-1.083986, 1.366059, 0.6679425, 1, 0.8509804, 0, 1,
-1.083839, -1.017708, -2.776706, 1, 0.8588235, 0, 1,
-1.083067, 1.584228, -0.8650353, 1, 0.8627451, 0, 1,
-1.074929, -1.673471, -5.855939, 1, 0.8705882, 0, 1,
-1.07316, 1.425752, -0.648541, 1, 0.8745098, 0, 1,
-1.070827, -0.7072992, -3.684366, 1, 0.8823529, 0, 1,
-1.066136, -2.839621, -3.619497, 1, 0.8862745, 0, 1,
-1.064502, 0.8527154, -2.058421, 1, 0.8941177, 0, 1,
-1.059579, 1.349217, 0.4929307, 1, 0.8980392, 0, 1,
-1.058988, 1.528892, -0.05954508, 1, 0.9058824, 0, 1,
-1.057664, 1.598806, -1.922652, 1, 0.9137255, 0, 1,
-1.05759, 1.832591, -1.227216, 1, 0.9176471, 0, 1,
-1.055845, -0.8413132, -1.221139, 1, 0.9254902, 0, 1,
-1.054643, -0.9735337, -2.570096, 1, 0.9294118, 0, 1,
-1.048071, -2.76293, -3.728048, 1, 0.9372549, 0, 1,
-1.034504, 1.427132, -0.8557659, 1, 0.9411765, 0, 1,
-1.033792, 1.157208, -0.6697254, 1, 0.9490196, 0, 1,
-1.030198, -0.7192971, -2.704225, 1, 0.9529412, 0, 1,
-1.029751, -0.1606471, -1.034855, 1, 0.9607843, 0, 1,
-1.026304, 1.399337, -0.819547, 1, 0.9647059, 0, 1,
-1.018358, -0.6012581, -2.439019, 1, 0.972549, 0, 1,
-1.018166, -0.544799, -1.361001, 1, 0.9764706, 0, 1,
-1.014506, -0.1493452, -1.694325, 1, 0.9843137, 0, 1,
-1.01123, -1.117399, -2.409557, 1, 0.9882353, 0, 1,
-1.010908, 1.879504, -1.530939, 1, 0.9960784, 0, 1,
-1.005377, -1.426145, -2.444682, 0.9960784, 1, 0, 1,
-1.004527, -0.6984892, -1.266992, 0.9921569, 1, 0, 1,
-1.00327, 2.182865, 0.908661, 0.9843137, 1, 0, 1,
-1.002555, 0.07599678, -2.067333, 0.9803922, 1, 0, 1,
-1.001032, -0.5168554, -4.661254, 0.972549, 1, 0, 1,
-0.9992701, 0.996805, -1.07834, 0.9686275, 1, 0, 1,
-0.9981429, -2.039057, -2.824938, 0.9607843, 1, 0, 1,
-0.9895754, -0.2022316, -0.5225438, 0.9568627, 1, 0, 1,
-0.987027, -0.6696777, -2.142617, 0.9490196, 1, 0, 1,
-0.9827107, 1.260461, -2.025257, 0.945098, 1, 0, 1,
-0.9788117, 1.331569, -0.6425542, 0.9372549, 1, 0, 1,
-0.9759753, -1.780895, -3.032845, 0.9333333, 1, 0, 1,
-0.9757046, 0.9086517, -0.6648925, 0.9254902, 1, 0, 1,
-0.970436, 0.3725158, -2.76462, 0.9215686, 1, 0, 1,
-0.9674405, -1.189688, -2.732115, 0.9137255, 1, 0, 1,
-0.9575099, 0.9003096, -2.303543, 0.9098039, 1, 0, 1,
-0.957257, 0.4699625, -1.889794, 0.9019608, 1, 0, 1,
-0.9539942, -0.1792479, -2.178558, 0.8941177, 1, 0, 1,
-0.9530684, 1.424793, -1.153211, 0.8901961, 1, 0, 1,
-0.946987, 1.0797, -0.2906335, 0.8823529, 1, 0, 1,
-0.9410022, -0.1152003, -1.616501, 0.8784314, 1, 0, 1,
-0.9382508, -0.3368054, -1.446579, 0.8705882, 1, 0, 1,
-0.9375103, -1.521298, -1.746441, 0.8666667, 1, 0, 1,
-0.9374766, 0.2162903, -1.327733, 0.8588235, 1, 0, 1,
-0.9324351, -1.238321, -3.25631, 0.854902, 1, 0, 1,
-0.9242283, -0.2662968, -2.921487, 0.8470588, 1, 0, 1,
-0.9141949, 0.3566283, -0.5642253, 0.8431373, 1, 0, 1,
-0.9117392, -1.590493, -4.672241, 0.8352941, 1, 0, 1,
-0.9086931, 1.354033, -0.6436329, 0.8313726, 1, 0, 1,
-0.8993289, 3.368153, -1.124861, 0.8235294, 1, 0, 1,
-0.8971496, -0.6836346, -3.12192, 0.8196079, 1, 0, 1,
-0.8938681, 0.03795824, -2.101348, 0.8117647, 1, 0, 1,
-0.8885911, 0.5786076, -1.130347, 0.8078431, 1, 0, 1,
-0.8867341, -0.9420431, -3.627596, 0.8, 1, 0, 1,
-0.8862257, 0.02200328, -2.989106, 0.7921569, 1, 0, 1,
-0.8791852, -0.03016852, -1.354516, 0.7882353, 1, 0, 1,
-0.8781917, 0.9237112, -1.875896, 0.7803922, 1, 0, 1,
-0.8743096, 0.438158, -1.120819, 0.7764706, 1, 0, 1,
-0.8734812, 0.5795354, 1.421052, 0.7686275, 1, 0, 1,
-0.8703299, 0.3769842, -0.1810114, 0.7647059, 1, 0, 1,
-0.858116, -0.5747526, -1.378234, 0.7568628, 1, 0, 1,
-0.8580399, -0.2353846, -1.466584, 0.7529412, 1, 0, 1,
-0.8544326, -0.1133725, -2.789255, 0.7450981, 1, 0, 1,
-0.8523636, 0.6619888, -1.055016, 0.7411765, 1, 0, 1,
-0.8506985, 0.5223184, -2.870804, 0.7333333, 1, 0, 1,
-0.8458509, -0.3081069, -2.673318, 0.7294118, 1, 0, 1,
-0.8456251, 1.099202, -1.403569, 0.7215686, 1, 0, 1,
-0.8431538, 1.298372, -1.854926, 0.7176471, 1, 0, 1,
-0.8426628, 0.7614877, -3.251524, 0.7098039, 1, 0, 1,
-0.8401648, -0.9951076, -1.973683, 0.7058824, 1, 0, 1,
-0.8377207, -0.1981438, -0.8184682, 0.6980392, 1, 0, 1,
-0.836031, -0.02093701, -1.938122, 0.6901961, 1, 0, 1,
-0.8298639, 3.264567e-05, 0.3685118, 0.6862745, 1, 0, 1,
-0.8280182, 0.6272292, -3.224887, 0.6784314, 1, 0, 1,
-0.8262265, -0.9007353, -3.038545, 0.6745098, 1, 0, 1,
-0.8222697, 0.3345851, -1.008967, 0.6666667, 1, 0, 1,
-0.8185139, 0.5227039, -0.7757152, 0.6627451, 1, 0, 1,
-0.8162952, -1.448354, -3.409969, 0.654902, 1, 0, 1,
-0.8154628, -2.79279, -4.139615, 0.6509804, 1, 0, 1,
-0.8139984, -0.5662429, -1.338639, 0.6431373, 1, 0, 1,
-0.8132848, 1.126959, -1.369852, 0.6392157, 1, 0, 1,
-0.8130117, 2.019234, 1.384273, 0.6313726, 1, 0, 1,
-0.811873, -0.3708486, -1.126183, 0.627451, 1, 0, 1,
-0.808934, -0.3045039, -1.308842, 0.6196079, 1, 0, 1,
-0.8075761, 0.8827641, 1.101087, 0.6156863, 1, 0, 1,
-0.7972368, 0.4155798, -1.245941, 0.6078432, 1, 0, 1,
-0.7829571, 1.498005, -0.5530879, 0.6039216, 1, 0, 1,
-0.7815158, -0.5538366, -1.450573, 0.5960785, 1, 0, 1,
-0.7778722, -0.4411237, -1.507872, 0.5882353, 1, 0, 1,
-0.7777342, -0.689626, -0.9664043, 0.5843138, 1, 0, 1,
-0.7721918, 1.587296, -0.7871165, 0.5764706, 1, 0, 1,
-0.770216, 0.6779657, -1.95341, 0.572549, 1, 0, 1,
-0.7668446, 1.277645, -0.5737039, 0.5647059, 1, 0, 1,
-0.7588894, 1.18347, 1.673956, 0.5607843, 1, 0, 1,
-0.7542032, 0.2586059, -0.6787443, 0.5529412, 1, 0, 1,
-0.7528801, -0.1565718, -0.9243789, 0.5490196, 1, 0, 1,
-0.7456228, -0.2105004, -3.985105, 0.5411765, 1, 0, 1,
-0.7392564, -0.8545703, -0.06965584, 0.5372549, 1, 0, 1,
-0.7337744, -0.4319696, -2.804291, 0.5294118, 1, 0, 1,
-0.7309859, 0.6662754, -3.26937, 0.5254902, 1, 0, 1,
-0.7284194, 0.1528439, -1.459354, 0.5176471, 1, 0, 1,
-0.7262446, -2.327132, -3.154186, 0.5137255, 1, 0, 1,
-0.7259767, -0.1008723, -1.139867, 0.5058824, 1, 0, 1,
-0.7253916, 2.18926, 0.4040067, 0.5019608, 1, 0, 1,
-0.7205341, -0.2933989, -2.838623, 0.4941176, 1, 0, 1,
-0.7174405, -1.58429, -4.286088, 0.4862745, 1, 0, 1,
-0.7071564, -1.256526, -5.07759, 0.4823529, 1, 0, 1,
-0.7067392, 0.5843136, 0.6902929, 0.4745098, 1, 0, 1,
-0.6977375, 0.4294038, -1.085208, 0.4705882, 1, 0, 1,
-0.6972474, 1.735974, 0.5737011, 0.4627451, 1, 0, 1,
-0.6924995, -0.5317382, -2.481001, 0.4588235, 1, 0, 1,
-0.687102, 0.3746418, -2.204675, 0.4509804, 1, 0, 1,
-0.686116, -1.125714, -1.851436, 0.4470588, 1, 0, 1,
-0.6842668, -0.2943749, -2.421242, 0.4392157, 1, 0, 1,
-0.6841863, -0.8150382, -2.278542, 0.4352941, 1, 0, 1,
-0.6817971, 0.8253314, -1.395465, 0.427451, 1, 0, 1,
-0.6816323, 0.9300866, -2.986449, 0.4235294, 1, 0, 1,
-0.6810687, -0.09686988, -0.5932217, 0.4156863, 1, 0, 1,
-0.6769965, 1.286878, -1.392461, 0.4117647, 1, 0, 1,
-0.6747594, 0.1957747, -1.750278, 0.4039216, 1, 0, 1,
-0.669222, 0.1153917, -0.4360328, 0.3960784, 1, 0, 1,
-0.6670264, -1.15707, -4.33054, 0.3921569, 1, 0, 1,
-0.6643997, -1.777172, -4.449783, 0.3843137, 1, 0, 1,
-0.6633981, -0.6297403, -1.644657, 0.3803922, 1, 0, 1,
-0.6580608, 0.4260521, -0.3178674, 0.372549, 1, 0, 1,
-0.6487192, 1.764994, 0.05746216, 0.3686275, 1, 0, 1,
-0.6477532, 0.6863999, -1.572295, 0.3607843, 1, 0, 1,
-0.6442, -0.3889358, -4.642339, 0.3568628, 1, 0, 1,
-0.643625, -0.7787357, -1.99722, 0.3490196, 1, 0, 1,
-0.6419379, -2.587091, -3.201226, 0.345098, 1, 0, 1,
-0.6377939, 1.595859, -0.09372327, 0.3372549, 1, 0, 1,
-0.6315859, 1.705236, -1.374606, 0.3333333, 1, 0, 1,
-0.627278, -0.6175084, -3.459605, 0.3254902, 1, 0, 1,
-0.6239753, 1.422444, -0.4538103, 0.3215686, 1, 0, 1,
-0.6168217, -1.20476, -2.173556, 0.3137255, 1, 0, 1,
-0.614906, -0.5852805, -2.005262, 0.3098039, 1, 0, 1,
-0.6137854, 1.075681, -1.796211, 0.3019608, 1, 0, 1,
-0.613341, -0.7676601, -2.248549, 0.2941177, 1, 0, 1,
-0.6111406, -0.2225658, -2.324687, 0.2901961, 1, 0, 1,
-0.6099827, -0.1547049, -2.054734, 0.282353, 1, 0, 1,
-0.6073403, -1.543486, -3.247861, 0.2784314, 1, 0, 1,
-0.5917462, -0.06780738, -1.58041, 0.2705882, 1, 0, 1,
-0.5904546, 0.3504382, -1.367792, 0.2666667, 1, 0, 1,
-0.5900494, 1.524664, -0.570891, 0.2588235, 1, 0, 1,
-0.5859231, -0.1584943, -1.529247, 0.254902, 1, 0, 1,
-0.5847953, 0.0442775, -1.016224, 0.2470588, 1, 0, 1,
-0.5833808, -0.1750362, -2.748231, 0.2431373, 1, 0, 1,
-0.5810977, 1.838752, 0.4301422, 0.2352941, 1, 0, 1,
-0.5781544, -0.0623689, -0.8908832, 0.2313726, 1, 0, 1,
-0.5578495, 0.06400771, -0.8278547, 0.2235294, 1, 0, 1,
-0.5558999, 0.1114093, 0.09194872, 0.2196078, 1, 0, 1,
-0.5529155, -0.6984974, -1.665679, 0.2117647, 1, 0, 1,
-0.5488594, 0.3377608, -1.587093, 0.2078431, 1, 0, 1,
-0.5480415, 1.875301, 0.5427054, 0.2, 1, 0, 1,
-0.5467626, 0.6758118, -2.206183, 0.1921569, 1, 0, 1,
-0.5447258, 0.6353901, -1.773599, 0.1882353, 1, 0, 1,
-0.5446087, 1.05704, -1.582838, 0.1803922, 1, 0, 1,
-0.5431076, 0.41152, -1.020889, 0.1764706, 1, 0, 1,
-0.5392203, 0.1227144, -1.038101, 0.1686275, 1, 0, 1,
-0.537497, 0.1467178, -1.670501, 0.1647059, 1, 0, 1,
-0.5333443, -0.8289694, -2.866146, 0.1568628, 1, 0, 1,
-0.532453, 0.6424299, -1.276461, 0.1529412, 1, 0, 1,
-0.5290713, -0.4251862, -1.653582, 0.145098, 1, 0, 1,
-0.5265615, 0.2939476, -1.174687, 0.1411765, 1, 0, 1,
-0.522698, 0.306368, -0.2490096, 0.1333333, 1, 0, 1,
-0.5215167, 0.4860632, -0.08443385, 0.1294118, 1, 0, 1,
-0.5192536, 0.2274241, -3.102704, 0.1215686, 1, 0, 1,
-0.517241, 0.1762331, 0.7765118, 0.1176471, 1, 0, 1,
-0.5135348, 0.9786037, -2.138632, 0.1098039, 1, 0, 1,
-0.5114465, -2.039574, -2.522358, 0.1058824, 1, 0, 1,
-0.511126, 1.261289, 0.2323029, 0.09803922, 1, 0, 1,
-0.5084735, 3.006676, 0.8027521, 0.09019608, 1, 0, 1,
-0.5060227, -1.770812, -3.654038, 0.08627451, 1, 0, 1,
-0.5051118, -0.1844094, -2.177663, 0.07843138, 1, 0, 1,
-0.5000746, 1.258801, -1.64155, 0.07450981, 1, 0, 1,
-0.4980785, 1.634025, -1.409442, 0.06666667, 1, 0, 1,
-0.4906396, -0.7202894, -2.196489, 0.0627451, 1, 0, 1,
-0.4903592, 0.8670262, 1.397734, 0.05490196, 1, 0, 1,
-0.4880821, 0.8557256, -0.3122116, 0.05098039, 1, 0, 1,
-0.4850948, 1.087193, -1.261407, 0.04313726, 1, 0, 1,
-0.484668, -1.052462, -2.115937, 0.03921569, 1, 0, 1,
-0.4807872, -0.7221709, -2.110226, 0.03137255, 1, 0, 1,
-0.4804168, 1.269398, -0.3867477, 0.02745098, 1, 0, 1,
-0.4803329, 0.1733295, -0.8600619, 0.01960784, 1, 0, 1,
-0.4786559, -0.2467311, -2.505839, 0.01568628, 1, 0, 1,
-0.4746619, 2.028756, -1.338595, 0.007843138, 1, 0, 1,
-0.4633009, 0.7990248, 1.448105, 0.003921569, 1, 0, 1,
-0.4628667, 1.542276, 1.121652, 0, 1, 0.003921569, 1,
-0.4605286, 0.1445967, -1.331248, 0, 1, 0.01176471, 1,
-0.4584104, -1.474124, -2.030859, 0, 1, 0.01568628, 1,
-0.457731, -0.573957, -2.191277, 0, 1, 0.02352941, 1,
-0.45515, 0.1020566, -1.395189, 0, 1, 0.02745098, 1,
-0.4442462, 0.9888938, -1.978632, 0, 1, 0.03529412, 1,
-0.441788, 0.3165523, -1.052235, 0, 1, 0.03921569, 1,
-0.4414216, 0.4850258, -2.728413, 0, 1, 0.04705882, 1,
-0.4405573, 0.8998818, -1.96244, 0, 1, 0.05098039, 1,
-0.4258289, -0.6348477, -3.330156, 0, 1, 0.05882353, 1,
-0.4249206, -0.3376707, -3.145177, 0, 1, 0.0627451, 1,
-0.4231129, 0.2276755, -2.089133, 0, 1, 0.07058824, 1,
-0.4204759, 1.657704, -0.3370718, 0, 1, 0.07450981, 1,
-0.410868, -1.000819, -2.977148, 0, 1, 0.08235294, 1,
-0.4077262, 0.2790104, -0.9458595, 0, 1, 0.08627451, 1,
-0.4057446, -0.2835617, -3.913794, 0, 1, 0.09411765, 1,
-0.4043211, 0.7995511, -0.7980012, 0, 1, 0.1019608, 1,
-0.4040149, 0.2904134, -1.963439, 0, 1, 0.1058824, 1,
-0.4023862, 1.151037, -1.660361, 0, 1, 0.1137255, 1,
-0.3975202, 0.6663378, 1.128595, 0, 1, 0.1176471, 1,
-0.3947482, 0.1830726, -0.08568867, 0, 1, 0.1254902, 1,
-0.3880459, -0.2488961, -2.215343, 0, 1, 0.1294118, 1,
-0.3817427, 0.2799303, -1.97188, 0, 1, 0.1372549, 1,
-0.3816059, 1.091438, -1.072923, 0, 1, 0.1411765, 1,
-0.3761462, 0.6598635, -0.05510357, 0, 1, 0.1490196, 1,
-0.3733536, 0.9052777, 0.5175962, 0, 1, 0.1529412, 1,
-0.3681302, -0.7465045, -3.086803, 0, 1, 0.1607843, 1,
-0.3623593, 1.090241, -0.4963514, 0, 1, 0.1647059, 1,
-0.3576491, -1.209156, -3.394561, 0, 1, 0.172549, 1,
-0.351161, -1.95822, -2.829348, 0, 1, 0.1764706, 1,
-0.3485107, -0.05724443, -0.6906767, 0, 1, 0.1843137, 1,
-0.3473948, -0.00302268, -2.999173, 0, 1, 0.1882353, 1,
-0.3472248, -1.484213, -2.468112, 0, 1, 0.1960784, 1,
-0.3452043, -1.516904, -3.810658, 0, 1, 0.2039216, 1,
-0.3421121, -0.3739891, -2.568209, 0, 1, 0.2078431, 1,
-0.3390816, -0.8616852, -3.589922, 0, 1, 0.2156863, 1,
-0.3390352, -1.743798, -4.017374, 0, 1, 0.2196078, 1,
-0.3372348, -0.7356659, -3.290504, 0, 1, 0.227451, 1,
-0.3360117, 0.7950887, 0.7284384, 0, 1, 0.2313726, 1,
-0.3343729, 0.04482583, -2.447569, 0, 1, 0.2392157, 1,
-0.3331735, 1.01519, -0.8666693, 0, 1, 0.2431373, 1,
-0.3323062, 1.086876, 0.145785, 0, 1, 0.2509804, 1,
-0.3307213, -0.3391927, -1.559686, 0, 1, 0.254902, 1,
-0.33046, 0.6418471, -1.287154, 0, 1, 0.2627451, 1,
-0.330175, 0.6092293, -2.435823, 0, 1, 0.2666667, 1,
-0.3295679, -0.1046748, -4.280453, 0, 1, 0.2745098, 1,
-0.3273049, -1.018388, -3.300907, 0, 1, 0.2784314, 1,
-0.32568, 1.457668, -0.3780989, 0, 1, 0.2862745, 1,
-0.3183348, 2.513821, 1.410815, 0, 1, 0.2901961, 1,
-0.3128171, -0.5689396, -3.39652, 0, 1, 0.2980392, 1,
-0.3109767, -0.1425294, -1.35671, 0, 1, 0.3058824, 1,
-0.3067251, -0.2820684, -2.838653, 0, 1, 0.3098039, 1,
-0.3046895, -0.1568267, -1.20114, 0, 1, 0.3176471, 1,
-0.3035194, 0.48505, -1.135178, 0, 1, 0.3215686, 1,
-0.3019144, 1.018182, 0.3788648, 0, 1, 0.3294118, 1,
-0.2996443, -0.5933404, -2.175323, 0, 1, 0.3333333, 1,
-0.298916, 0.2327951, -1.169316, 0, 1, 0.3411765, 1,
-0.2940564, -2.447154, -4.263308, 0, 1, 0.345098, 1,
-0.2937186, 1.165727, 0.3202955, 0, 1, 0.3529412, 1,
-0.291339, -0.4813359, -3.712757, 0, 1, 0.3568628, 1,
-0.290973, 0.4310915, -1.401806, 0, 1, 0.3647059, 1,
-0.2879672, 0.718207, -1.899365, 0, 1, 0.3686275, 1,
-0.2856038, 1.547946, -0.3008171, 0, 1, 0.3764706, 1,
-0.2854336, -0.3766804, -3.93038, 0, 1, 0.3803922, 1,
-0.2759239, 0.3557837, 1.48751, 0, 1, 0.3882353, 1,
-0.2756513, 1.282666, 0.9917257, 0, 1, 0.3921569, 1,
-0.2686149, -0.0598975, -2.161951, 0, 1, 0.4, 1,
-0.268017, 1.240524, -2.513098, 0, 1, 0.4078431, 1,
-0.2648953, -0.03496366, -2.966673, 0, 1, 0.4117647, 1,
-0.2559286, -0.09165673, -2.585161, 0, 1, 0.4196078, 1,
-0.2553149, 0.1498201, -1.127054, 0, 1, 0.4235294, 1,
-0.2549765, 0.2862518, 0.5271111, 0, 1, 0.4313726, 1,
-0.2503151, -2.814017, -3.432588, 0, 1, 0.4352941, 1,
-0.2449991, -0.890664, -3.59859, 0, 1, 0.4431373, 1,
-0.2433602, 0.66164, 0.7874613, 0, 1, 0.4470588, 1,
-0.2416289, -0.314365, -2.095493, 0, 1, 0.454902, 1,
-0.2385938, 1.777056, 1.391283, 0, 1, 0.4588235, 1,
-0.2359018, -0.2218304, -1.678497, 0, 1, 0.4666667, 1,
-0.2288009, -0.2437362, -2.618987, 0, 1, 0.4705882, 1,
-0.2287931, 0.2146707, -0.1897036, 0, 1, 0.4784314, 1,
-0.227575, -0.6599737, -3.461895, 0, 1, 0.4823529, 1,
-0.2274394, 2.173565, -0.02199826, 0, 1, 0.4901961, 1,
-0.2253829, -0.5106512, -2.266333, 0, 1, 0.4941176, 1,
-0.2248743, -0.3908195, -4.207517, 0, 1, 0.5019608, 1,
-0.2241866, 0.5440605, 1.153089, 0, 1, 0.509804, 1,
-0.2238151, -0.04441603, 0.2441525, 0, 1, 0.5137255, 1,
-0.2220773, -0.5908722, -2.446355, 0, 1, 0.5215687, 1,
-0.2220314, -0.8216678, -3.824179, 0, 1, 0.5254902, 1,
-0.2142676, -1.214699, -2.790782, 0, 1, 0.5333334, 1,
-0.208731, 0.6163641, -2.586619, 0, 1, 0.5372549, 1,
-0.2069216, 1.237308, 0.3180797, 0, 1, 0.5450981, 1,
-0.20233, 0.3787463, 0.254523, 0, 1, 0.5490196, 1,
-0.1963063, -0.4947402, -2.813532, 0, 1, 0.5568628, 1,
-0.1957784, -0.2711369, -3.252087, 0, 1, 0.5607843, 1,
-0.1948401, 0.8997219, -0.4617079, 0, 1, 0.5686275, 1,
-0.1910891, 0.9042063, 0.3530677, 0, 1, 0.572549, 1,
-0.1817061, 0.2939708, -1.217093, 0, 1, 0.5803922, 1,
-0.179047, 0.8178183, -0.8505892, 0, 1, 0.5843138, 1,
-0.1763482, 1.534339, 1.365314, 0, 1, 0.5921569, 1,
-0.173214, -0.7185385, -2.694447, 0, 1, 0.5960785, 1,
-0.165741, -1.074472, -2.555757, 0, 1, 0.6039216, 1,
-0.163531, 0.3830081, -0.4653078, 0, 1, 0.6117647, 1,
-0.1544575, 0.1037354, -1.515166, 0, 1, 0.6156863, 1,
-0.1539828, -0.5355017, -3.297381, 0, 1, 0.6235294, 1,
-0.1532328, 2.179524, 1.576276, 0, 1, 0.627451, 1,
-0.1456792, 2.053332, 0.3328807, 0, 1, 0.6352941, 1,
-0.1416253, 0.9200729, -1.580179, 0, 1, 0.6392157, 1,
-0.1415538, -0.3167927, -1.68714, 0, 1, 0.6470588, 1,
-0.1402201, 1.206055, 0.3071614, 0, 1, 0.6509804, 1,
-0.1390594, 0.6028581, -0.5123409, 0, 1, 0.6588235, 1,
-0.1374469, -0.1194024, -2.918243, 0, 1, 0.6627451, 1,
-0.1348733, -0.7174683, -3.248864, 0, 1, 0.6705883, 1,
-0.1341742, 1.353071, -0.4189542, 0, 1, 0.6745098, 1,
-0.1337617, -1.386889, -2.687581, 0, 1, 0.682353, 1,
-0.1331598, -1.211774, -3.576003, 0, 1, 0.6862745, 1,
-0.1316292, 1.337331, 1.114679, 0, 1, 0.6941177, 1,
-0.1308356, -0.5839505, -2.924108, 0, 1, 0.7019608, 1,
-0.1288764, 0.05937669, -0.06427415, 0, 1, 0.7058824, 1,
-0.1282347, 1.611148, 0.01555346, 0, 1, 0.7137255, 1,
-0.1269876, -1.191433, -2.152422, 0, 1, 0.7176471, 1,
-0.1239623, -0.966251, -3.464903, 0, 1, 0.7254902, 1,
-0.1216134, -0.08404387, -0.9104787, 0, 1, 0.7294118, 1,
-0.1200506, -0.7049477, -3.392791, 0, 1, 0.7372549, 1,
-0.1085398, -0.61869, -3.051456, 0, 1, 0.7411765, 1,
-0.1058343, 0.4639809, -1.460616, 0, 1, 0.7490196, 1,
-0.1047823, -0.09861641, -1.091342, 0, 1, 0.7529412, 1,
-0.1040851, -0.355944, -3.770138, 0, 1, 0.7607843, 1,
-0.103118, 0.1331132, -0.2498097, 0, 1, 0.7647059, 1,
-0.1017314, 0.5197013, 0.0886555, 0, 1, 0.772549, 1,
-0.1012212, 0.3069145, 0.3114968, 0, 1, 0.7764706, 1,
-0.1010024, -1.90622, -1.361335, 0, 1, 0.7843137, 1,
-0.09544974, -1.224268, -3.509692, 0, 1, 0.7882353, 1,
-0.09527364, -0.8676811, -3.54145, 0, 1, 0.7960784, 1,
-0.09507637, 0.2680382, -0.9456777, 0, 1, 0.8039216, 1,
-0.09062286, -0.6342366, -1.87525, 0, 1, 0.8078431, 1,
-0.09061614, 0.4345832, -0.8785976, 0, 1, 0.8156863, 1,
-0.08680605, -1.126075, -2.504694, 0, 1, 0.8196079, 1,
-0.08596468, 2.048107, -0.07639029, 0, 1, 0.827451, 1,
-0.08522663, -1.427233, -3.892852, 0, 1, 0.8313726, 1,
-0.08154146, 0.1982182, 0.2097798, 0, 1, 0.8392157, 1,
-0.07897293, 0.9763052, -0.5207276, 0, 1, 0.8431373, 1,
-0.0780202, 1.702645, -0.8777408, 0, 1, 0.8509804, 1,
-0.0775755, -0.2120225, -2.72238, 0, 1, 0.854902, 1,
-0.07205575, 0.2938671, -1.618321, 0, 1, 0.8627451, 1,
-0.06590924, -2.26362, -0.7709547, 0, 1, 0.8666667, 1,
-0.06397874, -0.1295037, -2.290189, 0, 1, 0.8745098, 1,
-0.05831476, -0.7727522, -2.821427, 0, 1, 0.8784314, 1,
-0.05596009, -0.534551, -2.760797, 0, 1, 0.8862745, 1,
-0.05343004, 1.210728, 1.530602, 0, 1, 0.8901961, 1,
-0.05001095, 0.8838348, -0.881587, 0, 1, 0.8980392, 1,
-0.04984568, -0.6348696, -1.095739, 0, 1, 0.9058824, 1,
-0.04901147, -0.7966702, -1.598756, 0, 1, 0.9098039, 1,
-0.04772101, -0.2764583, -3.394561, 0, 1, 0.9176471, 1,
-0.04706859, -0.9879182, -3.089326, 0, 1, 0.9215686, 1,
-0.04505746, 1.127339, 0.3969587, 0, 1, 0.9294118, 1,
-0.04271147, 0.1504424, 1.691584, 0, 1, 0.9333333, 1,
-0.04034393, -1.738164, -3.167093, 0, 1, 0.9411765, 1,
-0.04000076, 1.184938, -0.8469211, 0, 1, 0.945098, 1,
-0.03945823, 0.09999276, -0.4450534, 0, 1, 0.9529412, 1,
-0.03584638, -1.455985, -4.347294, 0, 1, 0.9568627, 1,
-0.03558053, -1.007932, -3.752079, 0, 1, 0.9647059, 1,
-0.0303544, 0.5319138, 0.1746525, 0, 1, 0.9686275, 1,
-0.028268, -0.4143116, -2.739721, 0, 1, 0.9764706, 1,
-0.02782521, 0.4193399, 1.232279, 0, 1, 0.9803922, 1,
-0.02714019, -0.4524505, -3.559862, 0, 1, 0.9882353, 1,
-0.02449293, 1.625099, -0.1730898, 0, 1, 0.9921569, 1,
-0.02300868, -0.3093656, -4.714062, 0, 1, 1, 1,
-0.01766684, 0.4916596, -1.631769, 0, 0.9921569, 1, 1,
-0.01673315, 0.2505771, -0.872781, 0, 0.9882353, 1, 1,
-0.01555161, 0.9990365, 0.7348915, 0, 0.9803922, 1, 1,
-0.01374435, 2.028306, 0.9615593, 0, 0.9764706, 1, 1,
-0.01055558, -0.3762538, -2.912926, 0, 0.9686275, 1, 1,
-0.007631491, -0.2201203, -3.340352, 0, 0.9647059, 1, 1,
-0.007515419, 0.3907119, 0.7187111, 0, 0.9568627, 1, 1,
0.0007093142, 0.3794945, -1.105563, 0, 0.9529412, 1, 1,
0.003460776, -0.6072577, 2.269049, 0, 0.945098, 1, 1,
0.006796643, -0.6577255, 1.709977, 0, 0.9411765, 1, 1,
0.007661409, 1.586969, 1.188597, 0, 0.9333333, 1, 1,
0.009296379, -0.8479957, 4.574561, 0, 0.9294118, 1, 1,
0.01027639, -0.3507481, 1.93528, 0, 0.9215686, 1, 1,
0.01145787, -1.298225, 2.459195, 0, 0.9176471, 1, 1,
0.01358557, -1.414259, 3.366515, 0, 0.9098039, 1, 1,
0.01528959, -2.316319, 3.799671, 0, 0.9058824, 1, 1,
0.02071588, -1.514168, 2.916664, 0, 0.8980392, 1, 1,
0.02173581, -0.1848658, 0.9454747, 0, 0.8901961, 1, 1,
0.02720901, 1.186448, 0.5649763, 0, 0.8862745, 1, 1,
0.02843894, -0.2828698, 4.50701, 0, 0.8784314, 1, 1,
0.02855345, 0.199553, 0.7748746, 0, 0.8745098, 1, 1,
0.03018687, 1.354914, -1.140047, 0, 0.8666667, 1, 1,
0.0329974, -0.3256594, 1.181231, 0, 0.8627451, 1, 1,
0.03719707, 0.8363552, -0.557014, 0, 0.854902, 1, 1,
0.04387177, 0.1680029, 2.355366, 0, 0.8509804, 1, 1,
0.04404971, 0.6794296, 1.506335, 0, 0.8431373, 1, 1,
0.04648913, 0.1589813, 0.8936551, 0, 0.8392157, 1, 1,
0.0475218, -0.1585025, 1.359501, 0, 0.8313726, 1, 1,
0.05329756, 0.1380165, 0.2426947, 0, 0.827451, 1, 1,
0.06954566, -0.4226277, 1.772029, 0, 0.8196079, 1, 1,
0.07008314, 0.9520907, -0.2755976, 0, 0.8156863, 1, 1,
0.07116448, -1.602876, 2.772527, 0, 0.8078431, 1, 1,
0.07158253, 0.5411197, -0.03628183, 0, 0.8039216, 1, 1,
0.07428709, 0.07228021, -0.2564735, 0, 0.7960784, 1, 1,
0.07704842, -0.2248589, 2.69437, 0, 0.7882353, 1, 1,
0.07750221, -1.084617, 3.834277, 0, 0.7843137, 1, 1,
0.08272109, -1.009993, 2.311291, 0, 0.7764706, 1, 1,
0.08301702, -1.291837, 4.480349, 0, 0.772549, 1, 1,
0.08970328, -0.8557902, 3.520482, 0, 0.7647059, 1, 1,
0.09155406, -0.5926028, 4.604328, 0, 0.7607843, 1, 1,
0.0919487, 0.2727185, 0.2445592, 0, 0.7529412, 1, 1,
0.09296621, 0.003918659, 0.7321582, 0, 0.7490196, 1, 1,
0.09505501, -0.5378081, 2.425876, 0, 0.7411765, 1, 1,
0.09828841, 2.263092, 0.2027769, 0, 0.7372549, 1, 1,
0.1013263, -0.3782545, 3.304692, 0, 0.7294118, 1, 1,
0.1025929, -2.0726, 3.594654, 0, 0.7254902, 1, 1,
0.1040309, -0.3728965, 2.96573, 0, 0.7176471, 1, 1,
0.104117, -0.8110697, 2.477056, 0, 0.7137255, 1, 1,
0.1044575, 0.08884028, 0.4878952, 0, 0.7058824, 1, 1,
0.1045909, -1.78009, 2.315519, 0, 0.6980392, 1, 1,
0.1081946, 0.06418285, 0.984513, 0, 0.6941177, 1, 1,
0.1087698, 0.7222815, -0.6199364, 0, 0.6862745, 1, 1,
0.1095187, -2.302413, 4.425483, 0, 0.682353, 1, 1,
0.1107717, 0.1263907, 0.1433891, 0, 0.6745098, 1, 1,
0.1127757, -0.7598228, 3.789988, 0, 0.6705883, 1, 1,
0.1167743, -1.329306, 4.515984, 0, 0.6627451, 1, 1,
0.1187938, -0.52011, 2.820184, 0, 0.6588235, 1, 1,
0.1222915, 0.4801041, 1.123843, 0, 0.6509804, 1, 1,
0.1236985, -0.3905366, 2.835859, 0, 0.6470588, 1, 1,
0.1237277, 0.2784104, 0.8357848, 0, 0.6392157, 1, 1,
0.1351598, -0.3119173, 3.177096, 0, 0.6352941, 1, 1,
0.1360342, -0.7425857, 3.273943, 0, 0.627451, 1, 1,
0.1361582, 0.4342247, -0.3059562, 0, 0.6235294, 1, 1,
0.13636, -0.2841059, 3.723798, 0, 0.6156863, 1, 1,
0.1371791, -0.5737433, 3.08864, 0, 0.6117647, 1, 1,
0.1381037, -0.8167102, 1.881211, 0, 0.6039216, 1, 1,
0.1389807, 0.204355, 0.3401168, 0, 0.5960785, 1, 1,
0.1398195, -0.6654117, 3.728561, 0, 0.5921569, 1, 1,
0.1406801, -0.276867, 2.954144, 0, 0.5843138, 1, 1,
0.1413944, -2.809816, 3.583223, 0, 0.5803922, 1, 1,
0.1524144, 2.125816, -0.6848476, 0, 0.572549, 1, 1,
0.1549267, 0.5429326, 0.7522966, 0, 0.5686275, 1, 1,
0.1561124, -1.405537, 0.4859028, 0, 0.5607843, 1, 1,
0.1590936, -1.379524, 3.302145, 0, 0.5568628, 1, 1,
0.1622812, 0.4680188, -0.9645545, 0, 0.5490196, 1, 1,
0.1634039, 0.1758627, 0.3476054, 0, 0.5450981, 1, 1,
0.163758, 0.3823472, 2.174372, 0, 0.5372549, 1, 1,
0.1693585, 0.4246225, -0.944526, 0, 0.5333334, 1, 1,
0.171644, 0.273672, -1.133449, 0, 0.5254902, 1, 1,
0.1729752, -1.944499, 2.975131, 0, 0.5215687, 1, 1,
0.1755706, -0.9460286, -0.5253948, 0, 0.5137255, 1, 1,
0.1792187, -1.399017, 3.180274, 0, 0.509804, 1, 1,
0.1799759, -0.4812339, 1.425069, 0, 0.5019608, 1, 1,
0.1811475, 0.2946364, 1.977533, 0, 0.4941176, 1, 1,
0.1833849, -1.135638, 3.469764, 0, 0.4901961, 1, 1,
0.1859716, 1.294511, -0.6788092, 0, 0.4823529, 1, 1,
0.1927123, -1.139874, 4.354064, 0, 0.4784314, 1, 1,
0.1928832, -0.7112735, 2.52005, 0, 0.4705882, 1, 1,
0.1935255, -0.2050786, 2.315598, 0, 0.4666667, 1, 1,
0.2002439, -0.9740823, 3.733713, 0, 0.4588235, 1, 1,
0.2026658, 0.1471435, 0.480159, 0, 0.454902, 1, 1,
0.2050246, -0.31411, 2.738068, 0, 0.4470588, 1, 1,
0.2131558, 1.32866, 1.027363, 0, 0.4431373, 1, 1,
0.2140606, 0.7616225, 0.6390132, 0, 0.4352941, 1, 1,
0.2191261, -0.6709375, 3.401726, 0, 0.4313726, 1, 1,
0.2194766, 1.05701, 0.7387099, 0, 0.4235294, 1, 1,
0.2248775, -0.7092699, 3.422165, 0, 0.4196078, 1, 1,
0.224976, -0.7202541, 2.938035, 0, 0.4117647, 1, 1,
0.2256483, 1.034794, -1.415114, 0, 0.4078431, 1, 1,
0.2280904, 1.086637, 1.667112, 0, 0.4, 1, 1,
0.2304954, 0.7310826, -0.150532, 0, 0.3921569, 1, 1,
0.2366848, 0.7142909, 0.8982109, 0, 0.3882353, 1, 1,
0.2425649, -1.777728, 2.861865, 0, 0.3803922, 1, 1,
0.2477973, -0.8071234, 2.695714, 0, 0.3764706, 1, 1,
0.2487788, 0.1838835, 1.446243, 0, 0.3686275, 1, 1,
0.2544391, -1.108811, 4.323549, 0, 0.3647059, 1, 1,
0.2548327, 0.2383231, 0.4993157, 0, 0.3568628, 1, 1,
0.2562546, 1.980436, 1.795684, 0, 0.3529412, 1, 1,
0.2583996, -0.3398555, 4.31834, 0, 0.345098, 1, 1,
0.2600248, 0.5191239, 0.3890291, 0, 0.3411765, 1, 1,
0.2609905, -0.3804808, 2.449027, 0, 0.3333333, 1, 1,
0.2618918, -0.1690022, 2.251333, 0, 0.3294118, 1, 1,
0.2629219, -0.652125, 2.771862, 0, 0.3215686, 1, 1,
0.2630052, 0.1314768, 0.7727477, 0, 0.3176471, 1, 1,
0.2656845, 2.375074, 0.08181919, 0, 0.3098039, 1, 1,
0.265784, 0.310362, -0.6409554, 0, 0.3058824, 1, 1,
0.2780159, 1.098927, -0.2782587, 0, 0.2980392, 1, 1,
0.280487, -0.5084618, 1.860045, 0, 0.2901961, 1, 1,
0.2821258, 2.143881, 0.2771867, 0, 0.2862745, 1, 1,
0.2834896, -0.7207544, 2.067503, 0, 0.2784314, 1, 1,
0.28575, 0.2268586, 2.778679, 0, 0.2745098, 1, 1,
0.2875822, -0.3583539, 3.140138, 0, 0.2666667, 1, 1,
0.2876777, -1.335414, 3.286128, 0, 0.2627451, 1, 1,
0.2903855, -0.5718522, 3.863313, 0, 0.254902, 1, 1,
0.2914782, -0.3068476, 1.786074, 0, 0.2509804, 1, 1,
0.2924098, -0.1393214, 3.100377, 0, 0.2431373, 1, 1,
0.2931455, 1.565554, -2.659826, 0, 0.2392157, 1, 1,
0.2988487, -0.5137372, 1.561062, 0, 0.2313726, 1, 1,
0.2989752, -1.277514, 3.036077, 0, 0.227451, 1, 1,
0.3019978, -0.3265083, 2.309549, 0, 0.2196078, 1, 1,
0.3044167, 1.305159, 0.9796373, 0, 0.2156863, 1, 1,
0.3078591, -2.060065, 2.124288, 0, 0.2078431, 1, 1,
0.31312, -0.8743998, 2.045586, 0, 0.2039216, 1, 1,
0.3158229, 0.3184167, 1.571578, 0, 0.1960784, 1, 1,
0.315831, -0.5181312, 5.265753, 0, 0.1882353, 1, 1,
0.3165784, 0.3401237, 0.5090209, 0, 0.1843137, 1, 1,
0.3191032, -1.062498, 2.166623, 0, 0.1764706, 1, 1,
0.31969, -1.084227, 5.378935, 0, 0.172549, 1, 1,
0.3229565, 0.202986, -1.741169, 0, 0.1647059, 1, 1,
0.3274675, 1.606128, -1.716216, 0, 0.1607843, 1, 1,
0.3282237, -1.433946, 0.9569795, 0, 0.1529412, 1, 1,
0.3292119, -2.127101, 3.701682, 0, 0.1490196, 1, 1,
0.334118, -1.110215, 2.665514, 0, 0.1411765, 1, 1,
0.334819, -0.5506814, 2.241225, 0, 0.1372549, 1, 1,
0.3377739, 0.2207088, 0.7506603, 0, 0.1294118, 1, 1,
0.3427908, 0.2173627, -0.6211068, 0, 0.1254902, 1, 1,
0.3451502, -0.009577382, 0.9105142, 0, 0.1176471, 1, 1,
0.3456176, -0.6682932, 1.922748, 0, 0.1137255, 1, 1,
0.3499576, 3.067593, 0.1337308, 0, 0.1058824, 1, 1,
0.3515863, 0.03297252, -0.4163791, 0, 0.09803922, 1, 1,
0.3602345, -0.2195813, 2.609329, 0, 0.09411765, 1, 1,
0.3622859, 0.8552314, -0.3114562, 0, 0.08627451, 1, 1,
0.3663161, 1.368416, -1.940711, 0, 0.08235294, 1, 1,
0.3707217, 0.1364828, 2.304406, 0, 0.07450981, 1, 1,
0.3764556, -1.15739, 2.089748, 0, 0.07058824, 1, 1,
0.3812713, -1.292287, 1.159627, 0, 0.0627451, 1, 1,
0.3863132, -1.124081, 3.509711, 0, 0.05882353, 1, 1,
0.3869824, 0.0818148, 1.322046, 0, 0.05098039, 1, 1,
0.3906135, -0.9383897, 4.236694, 0, 0.04705882, 1, 1,
0.3909081, 0.1240603, 1.398977, 0, 0.03921569, 1, 1,
0.3913104, 0.193434, 2.465698, 0, 0.03529412, 1, 1,
0.3938261, -0.1353299, 1.77605, 0, 0.02745098, 1, 1,
0.3941799, -1.320973, 4.807999, 0, 0.02352941, 1, 1,
0.3973596, -0.7211148, 2.990445, 0, 0.01568628, 1, 1,
0.3984118, 0.3982082, 0.6618444, 0, 0.01176471, 1, 1,
0.3991638, -0.3521716, 3.435195, 0, 0.003921569, 1, 1,
0.4007782, -0.2600424, 3.016622, 0.003921569, 0, 1, 1,
0.4061519, 0.4812929, 0.5038867, 0.007843138, 0, 1, 1,
0.408988, 0.7320957, -1.029692, 0.01568628, 0, 1, 1,
0.414722, -0.1886348, 0.5859162, 0.01960784, 0, 1, 1,
0.4147614, -0.04425968, 1.186178, 0.02745098, 0, 1, 1,
0.4171164, -0.2258028, 1.454187, 0.03137255, 0, 1, 1,
0.4173291, -0.4211168, 2.557112, 0.03921569, 0, 1, 1,
0.4231555, -0.2795462, 1.648798, 0.04313726, 0, 1, 1,
0.4243962, -0.1809203, 1.52572, 0.05098039, 0, 1, 1,
0.4254335, 0.8074716, 0.7947295, 0.05490196, 0, 1, 1,
0.4306566, -1.196337, 3.956278, 0.0627451, 0, 1, 1,
0.4334534, 0.5693923, 0.5235138, 0.06666667, 0, 1, 1,
0.4371484, 0.5026393, 1.32447, 0.07450981, 0, 1, 1,
0.4443255, 0.210268, 1.722356, 0.07843138, 0, 1, 1,
0.4513961, -2.300654, 2.724122, 0.08627451, 0, 1, 1,
0.4600563, -0.3228627, 1.078561, 0.09019608, 0, 1, 1,
0.4604872, 0.8875455, -0.6166715, 0.09803922, 0, 1, 1,
0.4608155, -0.6547212, 0.8949975, 0.1058824, 0, 1, 1,
0.4610396, -2.23382, 3.891217, 0.1098039, 0, 1, 1,
0.4623993, 0.6990529, -0.6951547, 0.1176471, 0, 1, 1,
0.4631673, 0.6051329, 1.148487, 0.1215686, 0, 1, 1,
0.467125, -0.6937327, 5.951969, 0.1294118, 0, 1, 1,
0.4696223, 0.8015071, -0.5381625, 0.1333333, 0, 1, 1,
0.4722632, -0.1555327, 3.648821, 0.1411765, 0, 1, 1,
0.4742697, 0.8114138, -0.07124774, 0.145098, 0, 1, 1,
0.4788924, -0.2501304, -0.04377932, 0.1529412, 0, 1, 1,
0.4873226, -2.247453, 3.866431, 0.1568628, 0, 1, 1,
0.4978635, 0.4642083, -0.1991839, 0.1647059, 0, 1, 1,
0.501397, 1.379665, -0.2178461, 0.1686275, 0, 1, 1,
0.5026838, 1.609549, 0.340433, 0.1764706, 0, 1, 1,
0.5034687, 0.3260181, 1.774698, 0.1803922, 0, 1, 1,
0.5034729, 0.4041014, 2.220942, 0.1882353, 0, 1, 1,
0.5062677, 0.3220862, 1.659033, 0.1921569, 0, 1, 1,
0.515566, 0.5533542, 0.9955051, 0.2, 0, 1, 1,
0.5177835, 0.2427635, -0.5497984, 0.2078431, 0, 1, 1,
0.5194095, 0.5007519, 0.05403266, 0.2117647, 0, 1, 1,
0.5198319, 0.1795327, 2.247484, 0.2196078, 0, 1, 1,
0.5200114, 0.0696861, 3.120951, 0.2235294, 0, 1, 1,
0.5248522, 1.291461, -0.0505242, 0.2313726, 0, 1, 1,
0.5250944, 0.3323663, 0.03986563, 0.2352941, 0, 1, 1,
0.5256946, -0.7726662, 2.848212, 0.2431373, 0, 1, 1,
0.5265232, 1.599609, 2.100424, 0.2470588, 0, 1, 1,
0.5285012, 1.070325, -0.9810281, 0.254902, 0, 1, 1,
0.5296525, 1.717473, -0.4632812, 0.2588235, 0, 1, 1,
0.5297756, 0.1279529, 1.089601, 0.2666667, 0, 1, 1,
0.5364898, 1.041055, 0.1847554, 0.2705882, 0, 1, 1,
0.5385267, -0.3052404, 2.576999, 0.2784314, 0, 1, 1,
0.545897, 0.3061444, -0.4120554, 0.282353, 0, 1, 1,
0.5472936, 0.2614627, 0.08942242, 0.2901961, 0, 1, 1,
0.5473017, 0.4913358, 0.06080149, 0.2941177, 0, 1, 1,
0.5511709, 0.8829603, 0.4344487, 0.3019608, 0, 1, 1,
0.5544106, -1.161173, 1.085467, 0.3098039, 0, 1, 1,
0.558989, 0.8221536, -0.3952168, 0.3137255, 0, 1, 1,
0.5655814, 0.4838455, 0.4262501, 0.3215686, 0, 1, 1,
0.5735185, 0.3978741, 0.9875943, 0.3254902, 0, 1, 1,
0.5744373, -0.6500918, 2.898201, 0.3333333, 0, 1, 1,
0.5833974, 0.7286678, -0.3318717, 0.3372549, 0, 1, 1,
0.5835759, 0.2854925, 1.115524, 0.345098, 0, 1, 1,
0.5851426, -1.301261, 1.802871, 0.3490196, 0, 1, 1,
0.5926538, -0.7330366, 2.466955, 0.3568628, 0, 1, 1,
0.5932908, -0.6935709, 0.7256159, 0.3607843, 0, 1, 1,
0.5950097, 1.250079, 2.017535, 0.3686275, 0, 1, 1,
0.6041246, 1.040137, -1.189326, 0.372549, 0, 1, 1,
0.6054542, -0.06773808, 1.150157, 0.3803922, 0, 1, 1,
0.6081935, -0.9733287, 4.99337, 0.3843137, 0, 1, 1,
0.6159102, 1.344626, 2.731818, 0.3921569, 0, 1, 1,
0.6189148, 0.5358841, 1.073566, 0.3960784, 0, 1, 1,
0.619274, -0.3164371, 1.335983, 0.4039216, 0, 1, 1,
0.6199106, 2.606288, 0.07371514, 0.4117647, 0, 1, 1,
0.6210911, 0.4364854, 1.223546, 0.4156863, 0, 1, 1,
0.6220132, -0.4672021, 1.930935, 0.4235294, 0, 1, 1,
0.6321974, 0.2502866, -0.08450478, 0.427451, 0, 1, 1,
0.6368495, -0.2900177, 1.600329, 0.4352941, 0, 1, 1,
0.6399723, 1.242383, 1.714046, 0.4392157, 0, 1, 1,
0.6447082, -0.442134, 1.645421, 0.4470588, 0, 1, 1,
0.6500983, -0.4718398, 1.086284, 0.4509804, 0, 1, 1,
0.6520388, 1.578499, 0.137703, 0.4588235, 0, 1, 1,
0.6532254, 0.7656956, 0.2409736, 0.4627451, 0, 1, 1,
0.6549554, -1.180503, 2.995016, 0.4705882, 0, 1, 1,
0.6553517, -1.031503, 0.02720947, 0.4745098, 0, 1, 1,
0.661521, -0.273512, 2.67903, 0.4823529, 0, 1, 1,
0.664278, 0.03376905, 1.740524, 0.4862745, 0, 1, 1,
0.6659417, -0.5405639, 2.389317, 0.4941176, 0, 1, 1,
0.6716434, -1.32065, 2.502675, 0.5019608, 0, 1, 1,
0.6757358, 0.1234338, 1.763063, 0.5058824, 0, 1, 1,
0.6812244, 0.5632262, 0.5094582, 0.5137255, 0, 1, 1,
0.68735, 1.117347, 1.817977, 0.5176471, 0, 1, 1,
0.6901765, -0.1050944, 1.243938, 0.5254902, 0, 1, 1,
0.6912563, 0.5000344, 1.304277, 0.5294118, 0, 1, 1,
0.6946899, 2.053251, 1.714127, 0.5372549, 0, 1, 1,
0.6957411, 0.4329722, 0.4019858, 0.5411765, 0, 1, 1,
0.6998665, -2.115903, 4.123569, 0.5490196, 0, 1, 1,
0.7016058, -0.5054463, 2.899304, 0.5529412, 0, 1, 1,
0.7080457, -0.9352113, 2.743443, 0.5607843, 0, 1, 1,
0.7089242, -1.384869, -0.237582, 0.5647059, 0, 1, 1,
0.7094445, 0.7532279, 1.9557, 0.572549, 0, 1, 1,
0.7099422, -0.01020921, -0.3141615, 0.5764706, 0, 1, 1,
0.7117331, 0.6632003, 0.2321779, 0.5843138, 0, 1, 1,
0.7121967, -2.029341, 1.859779, 0.5882353, 0, 1, 1,
0.7126823, 0.638945, 0.9271777, 0.5960785, 0, 1, 1,
0.7136434, -0.8043807, 2.386583, 0.6039216, 0, 1, 1,
0.7171547, -0.3690292, 2.328805, 0.6078432, 0, 1, 1,
0.7201211, 0.8770453, 2.298514, 0.6156863, 0, 1, 1,
0.7247381, -0.2807586, 0.9045192, 0.6196079, 0, 1, 1,
0.7268131, 0.7009033, 1.725935, 0.627451, 0, 1, 1,
0.7284858, 0.8858814, -0.1839966, 0.6313726, 0, 1, 1,
0.7289479, -1.250483, 2.022329, 0.6392157, 0, 1, 1,
0.7305108, -0.5481133, 1.943722, 0.6431373, 0, 1, 1,
0.7343681, -0.2503614, 1.387967, 0.6509804, 0, 1, 1,
0.7407296, 1.279605, -0.687851, 0.654902, 0, 1, 1,
0.7417076, -0.01938569, 1.697748, 0.6627451, 0, 1, 1,
0.7481519, -0.3625935, 3.394526, 0.6666667, 0, 1, 1,
0.7556985, 1.163641, 0.2223628, 0.6745098, 0, 1, 1,
0.7587702, -0.8367661, 0.5641962, 0.6784314, 0, 1, 1,
0.7589039, 0.2320787, 2.719092, 0.6862745, 0, 1, 1,
0.7613166, -1.005982, 3.705644, 0.6901961, 0, 1, 1,
0.7626976, 1.065416, -0.8551531, 0.6980392, 0, 1, 1,
0.7630886, 0.3802864, 1.573323, 0.7058824, 0, 1, 1,
0.7659486, -0.6023313, 1.833622, 0.7098039, 0, 1, 1,
0.76614, 0.2672944, 1.962518, 0.7176471, 0, 1, 1,
0.7721407, -1.193241, 2.789684, 0.7215686, 0, 1, 1,
0.7762536, -0.4144474, 2.361685, 0.7294118, 0, 1, 1,
0.7771573, -0.5544985, 2.707644, 0.7333333, 0, 1, 1,
0.7791402, -0.2150145, 1.59267, 0.7411765, 0, 1, 1,
0.7804148, -0.7093537, 4.302925, 0.7450981, 0, 1, 1,
0.7910119, -0.5556093, 2.634444, 0.7529412, 0, 1, 1,
0.7939449, 0.5636158, 1.220989, 0.7568628, 0, 1, 1,
0.7962294, -0.5091013, 1.494744, 0.7647059, 0, 1, 1,
0.7976891, -1.428242, 1.222883, 0.7686275, 0, 1, 1,
0.798673, -1.188177, 0.8938164, 0.7764706, 0, 1, 1,
0.8095511, -0.5258518, 2.284884, 0.7803922, 0, 1, 1,
0.814481, 1.194702, 1.767131, 0.7882353, 0, 1, 1,
0.8175379, -0.04920982, 2.248496, 0.7921569, 0, 1, 1,
0.8228885, -1.027545, 1.636773, 0.8, 0, 1, 1,
0.8232621, 1.641266, -0.1008164, 0.8078431, 0, 1, 1,
0.8261437, -0.3908136, 1.253624, 0.8117647, 0, 1, 1,
0.8266248, 0.9587455, -0.5791763, 0.8196079, 0, 1, 1,
0.8280983, 0.3072401, 1.54444, 0.8235294, 0, 1, 1,
0.8300924, 0.4829612, 0.5012335, 0.8313726, 0, 1, 1,
0.8325967, 1.99169, 0.3254998, 0.8352941, 0, 1, 1,
0.8396579, -0.708366, 0.5583873, 0.8431373, 0, 1, 1,
0.8402206, -0.04916218, 1.781847, 0.8470588, 0, 1, 1,
0.8469343, -1.101968, 3.418884, 0.854902, 0, 1, 1,
0.8508424, -2.445743, 2.584177, 0.8588235, 0, 1, 1,
0.8533528, -1.264144, 1.918133, 0.8666667, 0, 1, 1,
0.8568394, 0.1357124, 1.599668, 0.8705882, 0, 1, 1,
0.865978, 1.08239, -1.093263, 0.8784314, 0, 1, 1,
0.8699567, -0.745887, 1.166574, 0.8823529, 0, 1, 1,
0.876408, -0.1974648, 2.417482, 0.8901961, 0, 1, 1,
0.8809636, -0.4227809, 2.287689, 0.8941177, 0, 1, 1,
0.8829812, 0.4530797, 1.205066, 0.9019608, 0, 1, 1,
0.8870823, 0.09369252, 1.741257, 0.9098039, 0, 1, 1,
0.89303, -1.147131, 1.356682, 0.9137255, 0, 1, 1,
0.8947057, -0.724462, 0.5136497, 0.9215686, 0, 1, 1,
0.9046386, -1.073054, 1.367299, 0.9254902, 0, 1, 1,
0.907903, -0.06464592, 1.803371, 0.9333333, 0, 1, 1,
0.9083025, 0.4016784, 0.5910283, 0.9372549, 0, 1, 1,
0.9152355, -0.06258038, 4.123626, 0.945098, 0, 1, 1,
0.915949, -1.523402, 0.8764785, 0.9490196, 0, 1, 1,
0.9162246, -0.2794216, 2.955935, 0.9568627, 0, 1, 1,
0.9191697, 0.3590721, 0.7090893, 0.9607843, 0, 1, 1,
0.9232266, -0.05852022, 1.678784, 0.9686275, 0, 1, 1,
0.9256142, 1.918652, -0.07844368, 0.972549, 0, 1, 1,
0.9282616, -0.8944184, 1.765762, 0.9803922, 0, 1, 1,
0.928531, 0.7956024, 2.705152, 0.9843137, 0, 1, 1,
0.9322763, -0.7564218, 3.51989, 0.9921569, 0, 1, 1,
0.9326431, 0.000587745, 1.675767, 0.9960784, 0, 1, 1,
0.9339685, -1.152507, 2.749035, 1, 0, 0.9960784, 1,
0.9387012, -0.1709648, 1.762979, 1, 0, 0.9882353, 1,
0.9485959, -0.2083966, 1.137694, 1, 0, 0.9843137, 1,
0.949093, 0.2299297, 2.238762, 1, 0, 0.9764706, 1,
0.9508042, 0.1006092, 0.5332806, 1, 0, 0.972549, 1,
0.9531593, -0.4050981, 3.422635, 1, 0, 0.9647059, 1,
0.9531831, 1.187631, 1.068597, 1, 0, 0.9607843, 1,
0.9548063, 1.707355, 1.276685, 1, 0, 0.9529412, 1,
0.9593588, 2.008747, 0.2388899, 1, 0, 0.9490196, 1,
0.9630961, -0.2624888, 0.8593742, 1, 0, 0.9411765, 1,
0.9638615, 0.1366455, 2.576549, 1, 0, 0.9372549, 1,
0.9643257, 0.4212577, 1.733984, 1, 0, 0.9294118, 1,
0.9686916, -1.792835, 3.122879, 1, 0, 0.9254902, 1,
0.9827092, -0.7197195, 2.719054, 1, 0, 0.9176471, 1,
0.9897378, 0.5316256, 0.4467778, 1, 0, 0.9137255, 1,
1.000529, 0.2896419, 0.7692272, 1, 0, 0.9058824, 1,
1.001062, 2.072663, -0.7607771, 1, 0, 0.9019608, 1,
1.005001, 0.4973011, 0.6253181, 1, 0, 0.8941177, 1,
1.005944, -0.7863013, 1.698398, 1, 0, 0.8862745, 1,
1.00599, -1.378249, 4.965178, 1, 0, 0.8823529, 1,
1.012815, -0.1278939, 2.087055, 1, 0, 0.8745098, 1,
1.015532, -0.0771994, 1.051141, 1, 0, 0.8705882, 1,
1.018923, 1.123733, 0.9161783, 1, 0, 0.8627451, 1,
1.018943, 0.7460198, 1.131136, 1, 0, 0.8588235, 1,
1.026307, -1.460325, 0.7132434, 1, 0, 0.8509804, 1,
1.035635, -1.460309, 1.98729, 1, 0, 0.8470588, 1,
1.035942, -0.1732655, 2.487391, 1, 0, 0.8392157, 1,
1.041601, 0.3972681, 0.06570016, 1, 0, 0.8352941, 1,
1.042088, -0.1605968, 2.834553, 1, 0, 0.827451, 1,
1.045502, 1.18686, 0.853505, 1, 0, 0.8235294, 1,
1.046684, 0.1977891, 1.60412, 1, 0, 0.8156863, 1,
1.052451, 1.607458, 2.012522, 1, 0, 0.8117647, 1,
1.053178, -0.2348673, 2.081882, 1, 0, 0.8039216, 1,
1.064145, 1.658813, 1.056258, 1, 0, 0.7960784, 1,
1.067196, -0.9839447, 1.451551, 1, 0, 0.7921569, 1,
1.074074, -0.457356, 1.041771, 1, 0, 0.7843137, 1,
1.078091, 0.6305223, 1.189454, 1, 0, 0.7803922, 1,
1.082232, 0.2772212, 1.183414, 1, 0, 0.772549, 1,
1.084426, 0.06059159, 2.211339, 1, 0, 0.7686275, 1,
1.089465, 0.1157821, 1.931815, 1, 0, 0.7607843, 1,
1.090076, -1.41749, 4.438217, 1, 0, 0.7568628, 1,
1.097968, 0.2635599, 0.5920651, 1, 0, 0.7490196, 1,
1.107347, -1.068626, 3.729656, 1, 0, 0.7450981, 1,
1.108352, 0.05182877, 0.5765724, 1, 0, 0.7372549, 1,
1.110803, -0.4088712, 1.306331, 1, 0, 0.7333333, 1,
1.123617, -0.8478379, 1.765545, 1, 0, 0.7254902, 1,
1.124157, 0.1457624, 1.771729, 1, 0, 0.7215686, 1,
1.124267, 0.07498768, 1.717685, 1, 0, 0.7137255, 1,
1.125845, -0.1648591, 2.019311, 1, 0, 0.7098039, 1,
1.125949, 0.722639, 1.927451, 1, 0, 0.7019608, 1,
1.128803, -2.1305, 1.837005, 1, 0, 0.6941177, 1,
1.134739, 1.718359, 0.5091743, 1, 0, 0.6901961, 1,
1.143224, 1.363237, -1.226034, 1, 0, 0.682353, 1,
1.145559, 0.2861719, 2.825975, 1, 0, 0.6784314, 1,
1.147668, 0.5487605, 2.246063, 1, 0, 0.6705883, 1,
1.156553, -0.5050247, 3.160775, 1, 0, 0.6666667, 1,
1.163609, 1.240205, 0.6853672, 1, 0, 0.6588235, 1,
1.167001, -0.3653483, 1.514869, 1, 0, 0.654902, 1,
1.176855, -0.3990854, 1.91665, 1, 0, 0.6470588, 1,
1.177729, -0.8104057, 1.271836, 1, 0, 0.6431373, 1,
1.178935, -0.2712812, 3.076093, 1, 0, 0.6352941, 1,
1.179489, -0.3098595, 2.885612, 1, 0, 0.6313726, 1,
1.186916, 0.8343664, 1.099407, 1, 0, 0.6235294, 1,
1.188806, 0.3394812, 1.315516, 1, 0, 0.6196079, 1,
1.196377, -0.01331306, 0.9710243, 1, 0, 0.6117647, 1,
1.197754, -0.3363057, 1.973302, 1, 0, 0.6078432, 1,
1.202767, 0.6619355, -0.6840014, 1, 0, 0.6, 1,
1.211696, 1.334506, 1.517751, 1, 0, 0.5921569, 1,
1.229079, -0.8178955, 1.938207, 1, 0, 0.5882353, 1,
1.239513, -1.205796, 2.716065, 1, 0, 0.5803922, 1,
1.245829, 0.7746896, 0.4542097, 1, 0, 0.5764706, 1,
1.253152, -1.554295, 2.062376, 1, 0, 0.5686275, 1,
1.253479, 2.029344, 3.182359, 1, 0, 0.5647059, 1,
1.260779, 0.777313, 0.9729169, 1, 0, 0.5568628, 1,
1.263172, 0.7249907, 0.8486976, 1, 0, 0.5529412, 1,
1.263744, 0.9034151, 0.7463126, 1, 0, 0.5450981, 1,
1.263978, 0.592062, -0.2007105, 1, 0, 0.5411765, 1,
1.268873, 0.03828371, 1.838176, 1, 0, 0.5333334, 1,
1.269861, -1.115476, 2.689985, 1, 0, 0.5294118, 1,
1.272005, -0.6798306, 2.664692, 1, 0, 0.5215687, 1,
1.279868, 1.089, 2.283867, 1, 0, 0.5176471, 1,
1.283746, -0.1374331, 2.434578, 1, 0, 0.509804, 1,
1.299762, 0.4229209, -0.5332986, 1, 0, 0.5058824, 1,
1.301635, -1.31212, 2.501967, 1, 0, 0.4980392, 1,
1.306233, -0.2295918, 1.648728, 1, 0, 0.4901961, 1,
1.308011, 0.9773905, 1.608235, 1, 0, 0.4862745, 1,
1.309647, 0.08049326, 2.266787, 1, 0, 0.4784314, 1,
1.31397, 0.2954271, 2.166131, 1, 0, 0.4745098, 1,
1.322142, -1.625283, 2.96966, 1, 0, 0.4666667, 1,
1.345384, 1.992355, -0.7271555, 1, 0, 0.4627451, 1,
1.349799, 0.4510811, 0.7686611, 1, 0, 0.454902, 1,
1.359322, 0.5973321, 1.436291, 1, 0, 0.4509804, 1,
1.369491, 0.7371317, 1.142091, 1, 0, 0.4431373, 1,
1.37116, -0.0314251, 1.882938, 1, 0, 0.4392157, 1,
1.371982, 0.6113158, 1.219584, 1, 0, 0.4313726, 1,
1.372706, 1.216349, 1.116372, 1, 0, 0.427451, 1,
1.374684, -0.1572791, 1.563388, 1, 0, 0.4196078, 1,
1.380662, 1.331669, 0.2500302, 1, 0, 0.4156863, 1,
1.382738, -0.2904668, 1.707303, 1, 0, 0.4078431, 1,
1.393195, -0.6441395, 0.5330058, 1, 0, 0.4039216, 1,
1.426116, -0.8573561, 1.319407, 1, 0, 0.3960784, 1,
1.430583, 1.276046, 0.2458376, 1, 0, 0.3882353, 1,
1.440018, -1.812752, 2.391768, 1, 0, 0.3843137, 1,
1.440426, 1.817834, -1.804847, 1, 0, 0.3764706, 1,
1.442115, 0.4588165, -0.07585335, 1, 0, 0.372549, 1,
1.442636, -0.5929292, 4.156738, 1, 0, 0.3647059, 1,
1.444241, 1.198845, -0.3971657, 1, 0, 0.3607843, 1,
1.444584, -0.5449639, 3.224093, 1, 0, 0.3529412, 1,
1.445586, 0.9237959, 0.4216978, 1, 0, 0.3490196, 1,
1.447009, -0.6781511, 1.380027, 1, 0, 0.3411765, 1,
1.448284, 1.55412, 1.085753, 1, 0, 0.3372549, 1,
1.492072, 0.3789006, 0.5404487, 1, 0, 0.3294118, 1,
1.502428, 1.223155, 0.261244, 1, 0, 0.3254902, 1,
1.510017, -0.6414596, 1.780784, 1, 0, 0.3176471, 1,
1.51182, 0.1424651, 1.424176, 1, 0, 0.3137255, 1,
1.514111, -0.005412965, 2.35092, 1, 0, 0.3058824, 1,
1.536812, 0.6545759, 1.02489, 1, 0, 0.2980392, 1,
1.546181, -0.06875943, 0.1724307, 1, 0, 0.2941177, 1,
1.550467, 0.2527609, 2.293694, 1, 0, 0.2862745, 1,
1.552753, -0.1874401, 2.491045, 1, 0, 0.282353, 1,
1.573195, 0.5102799, -0.5732311, 1, 0, 0.2745098, 1,
1.578681, -0.755331, 2.376238, 1, 0, 0.2705882, 1,
1.58122, -0.865558, 2.25281, 1, 0, 0.2627451, 1,
1.587795, -0.6306266, 2.865056, 1, 0, 0.2588235, 1,
1.592891, -0.2985537, 1.545681, 1, 0, 0.2509804, 1,
1.594438, 0.4487332, 1.183555, 1, 0, 0.2470588, 1,
1.60904, -1.877339, 1.918959, 1, 0, 0.2392157, 1,
1.609373, -1.016904, 3.171673, 1, 0, 0.2352941, 1,
1.65521, -0.2976028, 1.056553, 1, 0, 0.227451, 1,
1.673266, 0.4570432, 2.383558, 1, 0, 0.2235294, 1,
1.68981, 2.412719, 2.851668, 1, 0, 0.2156863, 1,
1.727812, 1.380323, 2.354857, 1, 0, 0.2117647, 1,
1.765737, 1.465093, 2.531083, 1, 0, 0.2039216, 1,
1.768714, -0.1781963, 0.7886987, 1, 0, 0.1960784, 1,
1.798379, 0.9723076, 0.3108058, 1, 0, 0.1921569, 1,
1.805353, 1.136777, 1.528029, 1, 0, 0.1843137, 1,
1.834898, -0.5280838, 1.262433, 1, 0, 0.1803922, 1,
1.837655, -1.050647, 2.493322, 1, 0, 0.172549, 1,
1.870225, -0.01941332, 2.240775, 1, 0, 0.1686275, 1,
1.901801, -0.357177, 2.539245, 1, 0, 0.1607843, 1,
1.924775, -1.952571, 2.17189, 1, 0, 0.1568628, 1,
1.934827, 0.5856871, 2.773169, 1, 0, 0.1490196, 1,
1.963324, 0.01435545, 0.4756941, 1, 0, 0.145098, 1,
1.98606, -1.903332, 2.524312, 1, 0, 0.1372549, 1,
1.989723, -0.06073134, -0.8609499, 1, 0, 0.1333333, 1,
2.013064, -0.7176545, 2.290583, 1, 0, 0.1254902, 1,
2.015066, 0.6345105, 2.898994, 1, 0, 0.1215686, 1,
2.027756, 1.024481, -0.2416668, 1, 0, 0.1137255, 1,
2.062015, -1.310616, 2.260294, 1, 0, 0.1098039, 1,
2.091883, 0.6578591, 2.511911, 1, 0, 0.1019608, 1,
2.118942, 1.361315, 2.455561, 1, 0, 0.09411765, 1,
2.129982, 0.5236388, 1.669408, 1, 0, 0.09019608, 1,
2.241816, -1.491568, 3.362342, 1, 0, 0.08235294, 1,
2.298755, 1.187903, 0.872006, 1, 0, 0.07843138, 1,
2.445358, 0.7146676, 2.68204, 1, 0, 0.07058824, 1,
2.469587, 1.401718, 1.684206, 1, 0, 0.06666667, 1,
2.484415, 1.437197, 1.610301, 1, 0, 0.05882353, 1,
2.516879, 1.447211, 0.0954558, 1, 0, 0.05490196, 1,
2.55076, 0.6461924, 1.984771, 1, 0, 0.04705882, 1,
2.566171, 2.188955, 0.06150949, 1, 0, 0.04313726, 1,
2.58388, 0.3097376, 0.2871957, 1, 0, 0.03529412, 1,
2.600476, 0.9556808, 1.558514, 1, 0, 0.03137255, 1,
2.642489, -0.5260793, 3.506308, 1, 0, 0.02352941, 1,
2.775071, -0.3778886, 2.149647, 1, 0, 0.01960784, 1,
2.898085, 1.343549, 1.612099, 1, 0, 0.01176471, 1,
3.09639, 0.6816766, 2.848592, 1, 0, 0.007843138, 1
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
-0.1728868, -3.891839, -7.857379, 0, -0.5, 0.5, 0.5,
-0.1728868, -3.891839, -7.857379, 1, -0.5, 0.5, 0.5,
-0.1728868, -3.891839, -7.857379, 1, 1.5, 0.5, 0.5,
-0.1728868, -3.891839, -7.857379, 0, 1.5, 0.5, 0.5
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
-4.550448, 0.2642661, -7.857379, 0, -0.5, 0.5, 0.5,
-4.550448, 0.2642661, -7.857379, 1, -0.5, 0.5, 0.5,
-4.550448, 0.2642661, -7.857379, 1, 1.5, 0.5, 0.5,
-4.550448, 0.2642661, -7.857379, 0, 1.5, 0.5, 0.5
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
-4.550448, -3.891839, 0.04801488, 0, -0.5, 0.5, 0.5,
-4.550448, -3.891839, 0.04801488, 1, -0.5, 0.5, 0.5,
-4.550448, -3.891839, 0.04801488, 1, 1.5, 0.5, 0.5,
-4.550448, -3.891839, 0.04801488, 0, 1.5, 0.5, 0.5
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
-3, -2.932738, -6.033058,
3, -2.932738, -6.033058,
-3, -2.932738, -6.033058,
-3, -3.092588, -6.337111,
-2, -2.932738, -6.033058,
-2, -3.092588, -6.337111,
-1, -2.932738, -6.033058,
-1, -3.092588, -6.337111,
0, -2.932738, -6.033058,
0, -3.092588, -6.337111,
1, -2.932738, -6.033058,
1, -3.092588, -6.337111,
2, -2.932738, -6.033058,
2, -3.092588, -6.337111,
3, -2.932738, -6.033058,
3, -3.092588, -6.337111
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
-3, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
-3, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
-3, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
-3, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5,
-2, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
-2, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
-2, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
-2, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5,
-1, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
-1, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
-1, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
-1, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5,
0, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
0, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
0, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
0, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5,
1, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
1, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
1, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
1, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5,
2, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
2, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
2, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
2, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5,
3, -3.412288, -6.945219, 0, -0.5, 0.5, 0.5,
3, -3.412288, -6.945219, 1, -0.5, 0.5, 0.5,
3, -3.412288, -6.945219, 1, 1.5, 0.5, 0.5,
3, -3.412288, -6.945219, 0, 1.5, 0.5, 0.5
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
-3.540242, -2, -6.033058,
-3.540242, 3, -6.033058,
-3.540242, -2, -6.033058,
-3.70861, -2, -6.337111,
-3.540242, -1, -6.033058,
-3.70861, -1, -6.337111,
-3.540242, 0, -6.033058,
-3.70861, 0, -6.337111,
-3.540242, 1, -6.033058,
-3.70861, 1, -6.337111,
-3.540242, 2, -6.033058,
-3.70861, 2, -6.337111,
-3.540242, 3, -6.033058,
-3.70861, 3, -6.337111
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
-4.045345, -2, -6.945219, 0, -0.5, 0.5, 0.5,
-4.045345, -2, -6.945219, 1, -0.5, 0.5, 0.5,
-4.045345, -2, -6.945219, 1, 1.5, 0.5, 0.5,
-4.045345, -2, -6.945219, 0, 1.5, 0.5, 0.5,
-4.045345, -1, -6.945219, 0, -0.5, 0.5, 0.5,
-4.045345, -1, -6.945219, 1, -0.5, 0.5, 0.5,
-4.045345, -1, -6.945219, 1, 1.5, 0.5, 0.5,
-4.045345, -1, -6.945219, 0, 1.5, 0.5, 0.5,
-4.045345, 0, -6.945219, 0, -0.5, 0.5, 0.5,
-4.045345, 0, -6.945219, 1, -0.5, 0.5, 0.5,
-4.045345, 0, -6.945219, 1, 1.5, 0.5, 0.5,
-4.045345, 0, -6.945219, 0, 1.5, 0.5, 0.5,
-4.045345, 1, -6.945219, 0, -0.5, 0.5, 0.5,
-4.045345, 1, -6.945219, 1, -0.5, 0.5, 0.5,
-4.045345, 1, -6.945219, 1, 1.5, 0.5, 0.5,
-4.045345, 1, -6.945219, 0, 1.5, 0.5, 0.5,
-4.045345, 2, -6.945219, 0, -0.5, 0.5, 0.5,
-4.045345, 2, -6.945219, 1, -0.5, 0.5, 0.5,
-4.045345, 2, -6.945219, 1, 1.5, 0.5, 0.5,
-4.045345, 2, -6.945219, 0, 1.5, 0.5, 0.5,
-4.045345, 3, -6.945219, 0, -0.5, 0.5, 0.5,
-4.045345, 3, -6.945219, 1, -0.5, 0.5, 0.5,
-4.045345, 3, -6.945219, 1, 1.5, 0.5, 0.5,
-4.045345, 3, -6.945219, 0, 1.5, 0.5, 0.5
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
-3.540242, -2.932738, -4,
-3.540242, -2.932738, 4,
-3.540242, -2.932738, -4,
-3.70861, -3.092588, -4,
-3.540242, -2.932738, -2,
-3.70861, -3.092588, -2,
-3.540242, -2.932738, 0,
-3.70861, -3.092588, 0,
-3.540242, -2.932738, 2,
-3.70861, -3.092588, 2,
-3.540242, -2.932738, 4,
-3.70861, -3.092588, 4
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
-4.045345, -3.412288, -4, 0, -0.5, 0.5, 0.5,
-4.045345, -3.412288, -4, 1, -0.5, 0.5, 0.5,
-4.045345, -3.412288, -4, 1, 1.5, 0.5, 0.5,
-4.045345, -3.412288, -4, 0, 1.5, 0.5, 0.5,
-4.045345, -3.412288, -2, 0, -0.5, 0.5, 0.5,
-4.045345, -3.412288, -2, 1, -0.5, 0.5, 0.5,
-4.045345, -3.412288, -2, 1, 1.5, 0.5, 0.5,
-4.045345, -3.412288, -2, 0, 1.5, 0.5, 0.5,
-4.045345, -3.412288, 0, 0, -0.5, 0.5, 0.5,
-4.045345, -3.412288, 0, 1, -0.5, 0.5, 0.5,
-4.045345, -3.412288, 0, 1, 1.5, 0.5, 0.5,
-4.045345, -3.412288, 0, 0, 1.5, 0.5, 0.5,
-4.045345, -3.412288, 2, 0, -0.5, 0.5, 0.5,
-4.045345, -3.412288, 2, 1, -0.5, 0.5, 0.5,
-4.045345, -3.412288, 2, 1, 1.5, 0.5, 0.5,
-4.045345, -3.412288, 2, 0, 1.5, 0.5, 0.5,
-4.045345, -3.412288, 4, 0, -0.5, 0.5, 0.5,
-4.045345, -3.412288, 4, 1, -0.5, 0.5, 0.5,
-4.045345, -3.412288, 4, 1, 1.5, 0.5, 0.5,
-4.045345, -3.412288, 4, 0, 1.5, 0.5, 0.5
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
-3.540242, -2.932738, -6.033058,
-3.540242, 3.46127, -6.033058,
-3.540242, -2.932738, 6.129087,
-3.540242, 3.46127, 6.129087,
-3.540242, -2.932738, -6.033058,
-3.540242, -2.932738, 6.129087,
-3.540242, 3.46127, -6.033058,
-3.540242, 3.46127, 6.129087,
-3.540242, -2.932738, -6.033058,
3.194468, -2.932738, -6.033058,
-3.540242, -2.932738, 6.129087,
3.194468, -2.932738, 6.129087,
-3.540242, 3.46127, -6.033058,
3.194468, 3.46127, -6.033058,
-3.540242, 3.46127, 6.129087,
3.194468, 3.46127, 6.129087,
3.194468, -2.932738, -6.033058,
3.194468, 3.46127, -6.033058,
3.194468, -2.932738, 6.129087,
3.194468, 3.46127, 6.129087,
3.194468, -2.932738, -6.033058,
3.194468, -2.932738, 6.129087,
3.194468, 3.46127, -6.033058,
3.194468, 3.46127, 6.129087
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
var radius = 8.171079;
var distance = 36.35405;
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
mvMatrix.translate( 0.1728868, -0.2642661, -0.04801488 );
mvMatrix.scale( 1.311821, 1.38172, 0.7264122 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.35405);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Sodium_o-phenylpheno<-read.table("Sodium_o-phenylpheno.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sodium_o-phenylpheno$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
```

```r
y<-Sodium_o-phenylpheno$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
```

```r
z<-Sodium_o-phenylpheno$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_o' not found
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
-3.442164, -1.664402, -2.073112, 0, 0, 1, 1, 1,
-3.019537, -0.5439008, -1.913243, 1, 0, 0, 1, 1,
-2.779276, 0.3352006, -2.047252, 1, 0, 0, 1, 1,
-2.710095, 0.05969739, -1.497629, 1, 0, 0, 1, 1,
-2.632867, -0.4134252, -2.229576, 1, 0, 0, 1, 1,
-2.596607, -0.3127899, -1.964465, 1, 0, 0, 1, 1,
-2.557376, 0.2891944, -1.50175, 0, 0, 0, 1, 1,
-2.441943, -0.6533593, -2.669675, 0, 0, 0, 1, 1,
-2.375123, -0.7186631, -3.396919, 0, 0, 0, 1, 1,
-2.30011, 0.8984239, -2.655599, 0, 0, 0, 1, 1,
-2.295909, 0.7411359, 0.1524235, 0, 0, 0, 1, 1,
-2.292261, -0.7868531, -1.750376, 0, 0, 0, 1, 1,
-2.29005, -1.699858, 0.03577788, 0, 0, 0, 1, 1,
-2.28877, 1.641723, -1.547405, 1, 1, 1, 1, 1,
-2.261683, -1.654901, -2.974801, 1, 1, 1, 1, 1,
-2.156121, -0.4574475, -2.589546, 1, 1, 1, 1, 1,
-2.155606, -0.5971918, -2.390941, 1, 1, 1, 1, 1,
-2.116152, -0.5787514, 0.07877536, 1, 1, 1, 1, 1,
-2.100299, -1.314922, -2.96011, 1, 1, 1, 1, 1,
-2.062028, -0.3865995, -2.889388, 1, 1, 1, 1, 1,
-2.050081, -1.073472, -2.629935, 1, 1, 1, 1, 1,
-2.031981, 0.2447201, -3.295174, 1, 1, 1, 1, 1,
-1.994764, -1.534773, -0.4860258, 1, 1, 1, 1, 1,
-1.967209, -1.565576, -3.270657, 1, 1, 1, 1, 1,
-1.960174, 0.7678872, -0.6581172, 1, 1, 1, 1, 1,
-1.945207, -1.49568, -2.717584, 1, 1, 1, 1, 1,
-1.930888, 0.8272609, -0.04257488, 1, 1, 1, 1, 1,
-1.912012, -1.576766, -0.1312803, 1, 1, 1, 1, 1,
-1.910011, 0.03236232, -2.097943, 0, 0, 1, 1, 1,
-1.90734, -1.055608, 0.5407301, 1, 0, 0, 1, 1,
-1.903317, 0.9945332, -2.029693, 1, 0, 0, 1, 1,
-1.891347, 1.245631, -0.6213594, 1, 0, 0, 1, 1,
-1.864476, 0.2160525, -2.837758, 1, 0, 0, 1, 1,
-1.864016, -1.418644, -2.818741, 1, 0, 0, 1, 1,
-1.862614, -0.5165669, -1.994423, 0, 0, 0, 1, 1,
-1.847144, 0.1430812, -0.4500822, 0, 0, 0, 1, 1,
-1.820839, 2.064616, -0.7849395, 0, 0, 0, 1, 1,
-1.818606, -0.03973531, -1.399472, 0, 0, 0, 1, 1,
-1.809638, 0.0683274, -1.71533, 0, 0, 0, 1, 1,
-1.805262, -0.7916544, 0.2745025, 0, 0, 0, 1, 1,
-1.798181, 1.361508, -2.321018, 0, 0, 0, 1, 1,
-1.794795, -0.08007786, -0.9889564, 1, 1, 1, 1, 1,
-1.793711, -1.845588, -2.425285, 1, 1, 1, 1, 1,
-1.78612, -0.1298679, -1.450063, 1, 1, 1, 1, 1,
-1.779505, 0.1056023, -2.01109, 1, 1, 1, 1, 1,
-1.748956, -2.306195, -0.0946972, 1, 1, 1, 1, 1,
-1.74104, 0.03482693, -0.3158689, 1, 1, 1, 1, 1,
-1.717495, -1.097554, -1.846832, 1, 1, 1, 1, 1,
-1.688559, -0.7953827, -1.31997, 1, 1, 1, 1, 1,
-1.680645, -0.544302, -3.387732, 1, 1, 1, 1, 1,
-1.67707, -0.9135414, -1.947199, 1, 1, 1, 1, 1,
-1.63421, 1.687961, -1.088207, 1, 1, 1, 1, 1,
-1.630196, -0.9393971, -1.572986, 1, 1, 1, 1, 1,
-1.605662, 0.2273288, 0.15749, 1, 1, 1, 1, 1,
-1.602079, -1.194479, -1.383223, 1, 1, 1, 1, 1,
-1.592375, 0.2331876, -1.153295, 1, 1, 1, 1, 1,
-1.591321, 0.3036948, -1.371316, 0, 0, 1, 1, 1,
-1.586977, 0.1242511, -0.3451431, 1, 0, 0, 1, 1,
-1.585244, 1.331485, -1.626783, 1, 0, 0, 1, 1,
-1.56418, -1.165437, -3.011306, 1, 0, 0, 1, 1,
-1.561705, 1.460542, -0.5860923, 1, 0, 0, 1, 1,
-1.559642, -0.3397309, -1.8196, 1, 0, 0, 1, 1,
-1.552591, -2.182577, -3.13784, 0, 0, 0, 1, 1,
-1.537947, 0.8745152, 0.4553497, 0, 0, 0, 1, 1,
-1.533345, 1.644176, -1.790241, 0, 0, 0, 1, 1,
-1.530926, 1.657649, -0.7304166, 0, 0, 0, 1, 1,
-1.527272, 0.4837992, -1.344492, 0, 0, 0, 1, 1,
-1.525411, -0.414722, -2.590891, 0, 0, 0, 1, 1,
-1.51436, 1.220325, -2.175145, 0, 0, 0, 1, 1,
-1.513848, 0.003859725, -1.248037, 1, 1, 1, 1, 1,
-1.513476, 1.555131, -0.08405434, 1, 1, 1, 1, 1,
-1.495681, -0.4533311, -1.801799, 1, 1, 1, 1, 1,
-1.488443, 0.2988283, -1.139922, 1, 1, 1, 1, 1,
-1.478772, -2.109478, -5.17989, 1, 1, 1, 1, 1,
-1.472375, 2.330651, 0.3378964, 1, 1, 1, 1, 1,
-1.471368, 0.925887, -1.548304, 1, 1, 1, 1, 1,
-1.465738, -0.06370122, 1.015615, 1, 1, 1, 1, 1,
-1.459427, 0.4801385, -1.264741, 1, 1, 1, 1, 1,
-1.458854, 1.622597, -0.8044939, 1, 1, 1, 1, 1,
-1.451645, -0.6763968, -0.8385113, 1, 1, 1, 1, 1,
-1.449226, -1.580621, -2.888104, 1, 1, 1, 1, 1,
-1.433122, -0.8705555, -1.224052, 1, 1, 1, 1, 1,
-1.423938, -0.1195934, -1.780047, 1, 1, 1, 1, 1,
-1.418573, 0.4282878, 0.3194189, 1, 1, 1, 1, 1,
-1.415894, 0.04720289, -1.687322, 0, 0, 1, 1, 1,
-1.407816, 0.8337755, -1.630925, 1, 0, 0, 1, 1,
-1.397978, 1.466602, -1.279152, 1, 0, 0, 1, 1,
-1.366852, -0.3182285, -3.745432, 1, 0, 0, 1, 1,
-1.364941, -0.8326623, -2.083708, 1, 0, 0, 1, 1,
-1.358961, -0.4574435, -1.520673, 1, 0, 0, 1, 1,
-1.350633, -1.122419, -0.7466353, 0, 0, 0, 1, 1,
-1.348056, -0.9093671, -1.793891, 0, 0, 0, 1, 1,
-1.331776, 0.2273648, 0.4855445, 0, 0, 0, 1, 1,
-1.315912, 0.7563187, -1.166117, 0, 0, 0, 1, 1,
-1.315071, 2.805162, -0.4498827, 0, 0, 0, 1, 1,
-1.30468, 1.246398, -0.6561685, 0, 0, 0, 1, 1,
-1.30149, 2.251526, -0.3911892, 0, 0, 0, 1, 1,
-1.295448, 0.9472706, -1.540216, 1, 1, 1, 1, 1,
-1.289553, 0.8918757, 0.3168659, 1, 1, 1, 1, 1,
-1.289532, -0.8854522, -1.781133, 1, 1, 1, 1, 1,
-1.288534, 0.2432672, -0.6453525, 1, 1, 1, 1, 1,
-1.280174, -1.017025, -1.561187, 1, 1, 1, 1, 1,
-1.263119, -0.9325775, -1.328087, 1, 1, 1, 1, 1,
-1.256136, 1.077841, -0.2883321, 1, 1, 1, 1, 1,
-1.248762, 0.2333443, -1.444952, 1, 1, 1, 1, 1,
-1.244294, -0.3057287, -0.875273, 1, 1, 1, 1, 1,
-1.235293, 0.02113811, -2.448831, 1, 1, 1, 1, 1,
-1.23198, -0.2162252, -3.793987, 1, 1, 1, 1, 1,
-1.2228, 1.080031, -0.7449504, 1, 1, 1, 1, 1,
-1.221752, -0.4440614, -0.9750041, 1, 1, 1, 1, 1,
-1.216872, -0.8828616, -1.73203, 1, 1, 1, 1, 1,
-1.215057, 2.254361, -0.2264321, 1, 1, 1, 1, 1,
-1.214002, 1.363716, -0.7446993, 0, 0, 1, 1, 1,
-1.213766, -1.079952, -1.958991, 1, 0, 0, 1, 1,
-1.198883, -1.252104, -2.718477, 1, 0, 0, 1, 1,
-1.196402, 0.6938992, 0.2796388, 1, 0, 0, 1, 1,
-1.194817, 0.6687694, -0.6878322, 1, 0, 0, 1, 1,
-1.188644, 0.7873517, -0.08364433, 1, 0, 0, 1, 1,
-1.186569, 1.139977, 0.4462998, 0, 0, 0, 1, 1,
-1.185175, -1.524554, -2.113213, 0, 0, 0, 1, 1,
-1.185031, 0.3302509, -0.7025103, 0, 0, 0, 1, 1,
-1.183815, -2.092651, -1.626578, 0, 0, 0, 1, 1,
-1.18184, 0.2988141, -3.047101, 0, 0, 0, 1, 1,
-1.175545, 0.2103584, -2.937708, 0, 0, 0, 1, 1,
-1.173703, -0.1182333, -1.06271, 0, 0, 0, 1, 1,
-1.173678, -0.544774, -1.320108, 1, 1, 1, 1, 1,
-1.172899, 0.5139292, -2.149437, 1, 1, 1, 1, 1,
-1.171623, 0.1556454, -2.000136, 1, 1, 1, 1, 1,
-1.158688, 0.5473032, -0.01265433, 1, 1, 1, 1, 1,
-1.152575, -0.5259005, -1.250717, 1, 1, 1, 1, 1,
-1.149238, 0.1179104, -2.613057, 1, 1, 1, 1, 1,
-1.14619, 0.159265, -0.8701701, 1, 1, 1, 1, 1,
-1.143497, 2.178524, -0.02473411, 1, 1, 1, 1, 1,
-1.138008, 0.6173689, 0.06862186, 1, 1, 1, 1, 1,
-1.121529, 1.079081, -0.9261628, 1, 1, 1, 1, 1,
-1.119845, 0.3930164, -0.7349506, 1, 1, 1, 1, 1,
-1.11875, 0.01170374, -1.179272, 1, 1, 1, 1, 1,
-1.11354, 0.6105056, 0.2044761, 1, 1, 1, 1, 1,
-1.101403, -1.802973, -3.627161, 1, 1, 1, 1, 1,
-1.101268, 0.3970273, -1.346291, 1, 1, 1, 1, 1,
-1.096628, 2.69711, 0.03410013, 0, 0, 1, 1, 1,
-1.086736, 1.478448, -1.22598, 1, 0, 0, 1, 1,
-1.083986, 1.366059, 0.6679425, 1, 0, 0, 1, 1,
-1.083839, -1.017708, -2.776706, 1, 0, 0, 1, 1,
-1.083067, 1.584228, -0.8650353, 1, 0, 0, 1, 1,
-1.074929, -1.673471, -5.855939, 1, 0, 0, 1, 1,
-1.07316, 1.425752, -0.648541, 0, 0, 0, 1, 1,
-1.070827, -0.7072992, -3.684366, 0, 0, 0, 1, 1,
-1.066136, -2.839621, -3.619497, 0, 0, 0, 1, 1,
-1.064502, 0.8527154, -2.058421, 0, 0, 0, 1, 1,
-1.059579, 1.349217, 0.4929307, 0, 0, 0, 1, 1,
-1.058988, 1.528892, -0.05954508, 0, 0, 0, 1, 1,
-1.057664, 1.598806, -1.922652, 0, 0, 0, 1, 1,
-1.05759, 1.832591, -1.227216, 1, 1, 1, 1, 1,
-1.055845, -0.8413132, -1.221139, 1, 1, 1, 1, 1,
-1.054643, -0.9735337, -2.570096, 1, 1, 1, 1, 1,
-1.048071, -2.76293, -3.728048, 1, 1, 1, 1, 1,
-1.034504, 1.427132, -0.8557659, 1, 1, 1, 1, 1,
-1.033792, 1.157208, -0.6697254, 1, 1, 1, 1, 1,
-1.030198, -0.7192971, -2.704225, 1, 1, 1, 1, 1,
-1.029751, -0.1606471, -1.034855, 1, 1, 1, 1, 1,
-1.026304, 1.399337, -0.819547, 1, 1, 1, 1, 1,
-1.018358, -0.6012581, -2.439019, 1, 1, 1, 1, 1,
-1.018166, -0.544799, -1.361001, 1, 1, 1, 1, 1,
-1.014506, -0.1493452, -1.694325, 1, 1, 1, 1, 1,
-1.01123, -1.117399, -2.409557, 1, 1, 1, 1, 1,
-1.010908, 1.879504, -1.530939, 1, 1, 1, 1, 1,
-1.005377, -1.426145, -2.444682, 1, 1, 1, 1, 1,
-1.004527, -0.6984892, -1.266992, 0, 0, 1, 1, 1,
-1.00327, 2.182865, 0.908661, 1, 0, 0, 1, 1,
-1.002555, 0.07599678, -2.067333, 1, 0, 0, 1, 1,
-1.001032, -0.5168554, -4.661254, 1, 0, 0, 1, 1,
-0.9992701, 0.996805, -1.07834, 1, 0, 0, 1, 1,
-0.9981429, -2.039057, -2.824938, 1, 0, 0, 1, 1,
-0.9895754, -0.2022316, -0.5225438, 0, 0, 0, 1, 1,
-0.987027, -0.6696777, -2.142617, 0, 0, 0, 1, 1,
-0.9827107, 1.260461, -2.025257, 0, 0, 0, 1, 1,
-0.9788117, 1.331569, -0.6425542, 0, 0, 0, 1, 1,
-0.9759753, -1.780895, -3.032845, 0, 0, 0, 1, 1,
-0.9757046, 0.9086517, -0.6648925, 0, 0, 0, 1, 1,
-0.970436, 0.3725158, -2.76462, 0, 0, 0, 1, 1,
-0.9674405, -1.189688, -2.732115, 1, 1, 1, 1, 1,
-0.9575099, 0.9003096, -2.303543, 1, 1, 1, 1, 1,
-0.957257, 0.4699625, -1.889794, 1, 1, 1, 1, 1,
-0.9539942, -0.1792479, -2.178558, 1, 1, 1, 1, 1,
-0.9530684, 1.424793, -1.153211, 1, 1, 1, 1, 1,
-0.946987, 1.0797, -0.2906335, 1, 1, 1, 1, 1,
-0.9410022, -0.1152003, -1.616501, 1, 1, 1, 1, 1,
-0.9382508, -0.3368054, -1.446579, 1, 1, 1, 1, 1,
-0.9375103, -1.521298, -1.746441, 1, 1, 1, 1, 1,
-0.9374766, 0.2162903, -1.327733, 1, 1, 1, 1, 1,
-0.9324351, -1.238321, -3.25631, 1, 1, 1, 1, 1,
-0.9242283, -0.2662968, -2.921487, 1, 1, 1, 1, 1,
-0.9141949, 0.3566283, -0.5642253, 1, 1, 1, 1, 1,
-0.9117392, -1.590493, -4.672241, 1, 1, 1, 1, 1,
-0.9086931, 1.354033, -0.6436329, 1, 1, 1, 1, 1,
-0.8993289, 3.368153, -1.124861, 0, 0, 1, 1, 1,
-0.8971496, -0.6836346, -3.12192, 1, 0, 0, 1, 1,
-0.8938681, 0.03795824, -2.101348, 1, 0, 0, 1, 1,
-0.8885911, 0.5786076, -1.130347, 1, 0, 0, 1, 1,
-0.8867341, -0.9420431, -3.627596, 1, 0, 0, 1, 1,
-0.8862257, 0.02200328, -2.989106, 1, 0, 0, 1, 1,
-0.8791852, -0.03016852, -1.354516, 0, 0, 0, 1, 1,
-0.8781917, 0.9237112, -1.875896, 0, 0, 0, 1, 1,
-0.8743096, 0.438158, -1.120819, 0, 0, 0, 1, 1,
-0.8734812, 0.5795354, 1.421052, 0, 0, 0, 1, 1,
-0.8703299, 0.3769842, -0.1810114, 0, 0, 0, 1, 1,
-0.858116, -0.5747526, -1.378234, 0, 0, 0, 1, 1,
-0.8580399, -0.2353846, -1.466584, 0, 0, 0, 1, 1,
-0.8544326, -0.1133725, -2.789255, 1, 1, 1, 1, 1,
-0.8523636, 0.6619888, -1.055016, 1, 1, 1, 1, 1,
-0.8506985, 0.5223184, -2.870804, 1, 1, 1, 1, 1,
-0.8458509, -0.3081069, -2.673318, 1, 1, 1, 1, 1,
-0.8456251, 1.099202, -1.403569, 1, 1, 1, 1, 1,
-0.8431538, 1.298372, -1.854926, 1, 1, 1, 1, 1,
-0.8426628, 0.7614877, -3.251524, 1, 1, 1, 1, 1,
-0.8401648, -0.9951076, -1.973683, 1, 1, 1, 1, 1,
-0.8377207, -0.1981438, -0.8184682, 1, 1, 1, 1, 1,
-0.836031, -0.02093701, -1.938122, 1, 1, 1, 1, 1,
-0.8298639, 3.264567e-05, 0.3685118, 1, 1, 1, 1, 1,
-0.8280182, 0.6272292, -3.224887, 1, 1, 1, 1, 1,
-0.8262265, -0.9007353, -3.038545, 1, 1, 1, 1, 1,
-0.8222697, 0.3345851, -1.008967, 1, 1, 1, 1, 1,
-0.8185139, 0.5227039, -0.7757152, 1, 1, 1, 1, 1,
-0.8162952, -1.448354, -3.409969, 0, 0, 1, 1, 1,
-0.8154628, -2.79279, -4.139615, 1, 0, 0, 1, 1,
-0.8139984, -0.5662429, -1.338639, 1, 0, 0, 1, 1,
-0.8132848, 1.126959, -1.369852, 1, 0, 0, 1, 1,
-0.8130117, 2.019234, 1.384273, 1, 0, 0, 1, 1,
-0.811873, -0.3708486, -1.126183, 1, 0, 0, 1, 1,
-0.808934, -0.3045039, -1.308842, 0, 0, 0, 1, 1,
-0.8075761, 0.8827641, 1.101087, 0, 0, 0, 1, 1,
-0.7972368, 0.4155798, -1.245941, 0, 0, 0, 1, 1,
-0.7829571, 1.498005, -0.5530879, 0, 0, 0, 1, 1,
-0.7815158, -0.5538366, -1.450573, 0, 0, 0, 1, 1,
-0.7778722, -0.4411237, -1.507872, 0, 0, 0, 1, 1,
-0.7777342, -0.689626, -0.9664043, 0, 0, 0, 1, 1,
-0.7721918, 1.587296, -0.7871165, 1, 1, 1, 1, 1,
-0.770216, 0.6779657, -1.95341, 1, 1, 1, 1, 1,
-0.7668446, 1.277645, -0.5737039, 1, 1, 1, 1, 1,
-0.7588894, 1.18347, 1.673956, 1, 1, 1, 1, 1,
-0.7542032, 0.2586059, -0.6787443, 1, 1, 1, 1, 1,
-0.7528801, -0.1565718, -0.9243789, 1, 1, 1, 1, 1,
-0.7456228, -0.2105004, -3.985105, 1, 1, 1, 1, 1,
-0.7392564, -0.8545703, -0.06965584, 1, 1, 1, 1, 1,
-0.7337744, -0.4319696, -2.804291, 1, 1, 1, 1, 1,
-0.7309859, 0.6662754, -3.26937, 1, 1, 1, 1, 1,
-0.7284194, 0.1528439, -1.459354, 1, 1, 1, 1, 1,
-0.7262446, -2.327132, -3.154186, 1, 1, 1, 1, 1,
-0.7259767, -0.1008723, -1.139867, 1, 1, 1, 1, 1,
-0.7253916, 2.18926, 0.4040067, 1, 1, 1, 1, 1,
-0.7205341, -0.2933989, -2.838623, 1, 1, 1, 1, 1,
-0.7174405, -1.58429, -4.286088, 0, 0, 1, 1, 1,
-0.7071564, -1.256526, -5.07759, 1, 0, 0, 1, 1,
-0.7067392, 0.5843136, 0.6902929, 1, 0, 0, 1, 1,
-0.6977375, 0.4294038, -1.085208, 1, 0, 0, 1, 1,
-0.6972474, 1.735974, 0.5737011, 1, 0, 0, 1, 1,
-0.6924995, -0.5317382, -2.481001, 1, 0, 0, 1, 1,
-0.687102, 0.3746418, -2.204675, 0, 0, 0, 1, 1,
-0.686116, -1.125714, -1.851436, 0, 0, 0, 1, 1,
-0.6842668, -0.2943749, -2.421242, 0, 0, 0, 1, 1,
-0.6841863, -0.8150382, -2.278542, 0, 0, 0, 1, 1,
-0.6817971, 0.8253314, -1.395465, 0, 0, 0, 1, 1,
-0.6816323, 0.9300866, -2.986449, 0, 0, 0, 1, 1,
-0.6810687, -0.09686988, -0.5932217, 0, 0, 0, 1, 1,
-0.6769965, 1.286878, -1.392461, 1, 1, 1, 1, 1,
-0.6747594, 0.1957747, -1.750278, 1, 1, 1, 1, 1,
-0.669222, 0.1153917, -0.4360328, 1, 1, 1, 1, 1,
-0.6670264, -1.15707, -4.33054, 1, 1, 1, 1, 1,
-0.6643997, -1.777172, -4.449783, 1, 1, 1, 1, 1,
-0.6633981, -0.6297403, -1.644657, 1, 1, 1, 1, 1,
-0.6580608, 0.4260521, -0.3178674, 1, 1, 1, 1, 1,
-0.6487192, 1.764994, 0.05746216, 1, 1, 1, 1, 1,
-0.6477532, 0.6863999, -1.572295, 1, 1, 1, 1, 1,
-0.6442, -0.3889358, -4.642339, 1, 1, 1, 1, 1,
-0.643625, -0.7787357, -1.99722, 1, 1, 1, 1, 1,
-0.6419379, -2.587091, -3.201226, 1, 1, 1, 1, 1,
-0.6377939, 1.595859, -0.09372327, 1, 1, 1, 1, 1,
-0.6315859, 1.705236, -1.374606, 1, 1, 1, 1, 1,
-0.627278, -0.6175084, -3.459605, 1, 1, 1, 1, 1,
-0.6239753, 1.422444, -0.4538103, 0, 0, 1, 1, 1,
-0.6168217, -1.20476, -2.173556, 1, 0, 0, 1, 1,
-0.614906, -0.5852805, -2.005262, 1, 0, 0, 1, 1,
-0.6137854, 1.075681, -1.796211, 1, 0, 0, 1, 1,
-0.613341, -0.7676601, -2.248549, 1, 0, 0, 1, 1,
-0.6111406, -0.2225658, -2.324687, 1, 0, 0, 1, 1,
-0.6099827, -0.1547049, -2.054734, 0, 0, 0, 1, 1,
-0.6073403, -1.543486, -3.247861, 0, 0, 0, 1, 1,
-0.5917462, -0.06780738, -1.58041, 0, 0, 0, 1, 1,
-0.5904546, 0.3504382, -1.367792, 0, 0, 0, 1, 1,
-0.5900494, 1.524664, -0.570891, 0, 0, 0, 1, 1,
-0.5859231, -0.1584943, -1.529247, 0, 0, 0, 1, 1,
-0.5847953, 0.0442775, -1.016224, 0, 0, 0, 1, 1,
-0.5833808, -0.1750362, -2.748231, 1, 1, 1, 1, 1,
-0.5810977, 1.838752, 0.4301422, 1, 1, 1, 1, 1,
-0.5781544, -0.0623689, -0.8908832, 1, 1, 1, 1, 1,
-0.5578495, 0.06400771, -0.8278547, 1, 1, 1, 1, 1,
-0.5558999, 0.1114093, 0.09194872, 1, 1, 1, 1, 1,
-0.5529155, -0.6984974, -1.665679, 1, 1, 1, 1, 1,
-0.5488594, 0.3377608, -1.587093, 1, 1, 1, 1, 1,
-0.5480415, 1.875301, 0.5427054, 1, 1, 1, 1, 1,
-0.5467626, 0.6758118, -2.206183, 1, 1, 1, 1, 1,
-0.5447258, 0.6353901, -1.773599, 1, 1, 1, 1, 1,
-0.5446087, 1.05704, -1.582838, 1, 1, 1, 1, 1,
-0.5431076, 0.41152, -1.020889, 1, 1, 1, 1, 1,
-0.5392203, 0.1227144, -1.038101, 1, 1, 1, 1, 1,
-0.537497, 0.1467178, -1.670501, 1, 1, 1, 1, 1,
-0.5333443, -0.8289694, -2.866146, 1, 1, 1, 1, 1,
-0.532453, 0.6424299, -1.276461, 0, 0, 1, 1, 1,
-0.5290713, -0.4251862, -1.653582, 1, 0, 0, 1, 1,
-0.5265615, 0.2939476, -1.174687, 1, 0, 0, 1, 1,
-0.522698, 0.306368, -0.2490096, 1, 0, 0, 1, 1,
-0.5215167, 0.4860632, -0.08443385, 1, 0, 0, 1, 1,
-0.5192536, 0.2274241, -3.102704, 1, 0, 0, 1, 1,
-0.517241, 0.1762331, 0.7765118, 0, 0, 0, 1, 1,
-0.5135348, 0.9786037, -2.138632, 0, 0, 0, 1, 1,
-0.5114465, -2.039574, -2.522358, 0, 0, 0, 1, 1,
-0.511126, 1.261289, 0.2323029, 0, 0, 0, 1, 1,
-0.5084735, 3.006676, 0.8027521, 0, 0, 0, 1, 1,
-0.5060227, -1.770812, -3.654038, 0, 0, 0, 1, 1,
-0.5051118, -0.1844094, -2.177663, 0, 0, 0, 1, 1,
-0.5000746, 1.258801, -1.64155, 1, 1, 1, 1, 1,
-0.4980785, 1.634025, -1.409442, 1, 1, 1, 1, 1,
-0.4906396, -0.7202894, -2.196489, 1, 1, 1, 1, 1,
-0.4903592, 0.8670262, 1.397734, 1, 1, 1, 1, 1,
-0.4880821, 0.8557256, -0.3122116, 1, 1, 1, 1, 1,
-0.4850948, 1.087193, -1.261407, 1, 1, 1, 1, 1,
-0.484668, -1.052462, -2.115937, 1, 1, 1, 1, 1,
-0.4807872, -0.7221709, -2.110226, 1, 1, 1, 1, 1,
-0.4804168, 1.269398, -0.3867477, 1, 1, 1, 1, 1,
-0.4803329, 0.1733295, -0.8600619, 1, 1, 1, 1, 1,
-0.4786559, -0.2467311, -2.505839, 1, 1, 1, 1, 1,
-0.4746619, 2.028756, -1.338595, 1, 1, 1, 1, 1,
-0.4633009, 0.7990248, 1.448105, 1, 1, 1, 1, 1,
-0.4628667, 1.542276, 1.121652, 1, 1, 1, 1, 1,
-0.4605286, 0.1445967, -1.331248, 1, 1, 1, 1, 1,
-0.4584104, -1.474124, -2.030859, 0, 0, 1, 1, 1,
-0.457731, -0.573957, -2.191277, 1, 0, 0, 1, 1,
-0.45515, 0.1020566, -1.395189, 1, 0, 0, 1, 1,
-0.4442462, 0.9888938, -1.978632, 1, 0, 0, 1, 1,
-0.441788, 0.3165523, -1.052235, 1, 0, 0, 1, 1,
-0.4414216, 0.4850258, -2.728413, 1, 0, 0, 1, 1,
-0.4405573, 0.8998818, -1.96244, 0, 0, 0, 1, 1,
-0.4258289, -0.6348477, -3.330156, 0, 0, 0, 1, 1,
-0.4249206, -0.3376707, -3.145177, 0, 0, 0, 1, 1,
-0.4231129, 0.2276755, -2.089133, 0, 0, 0, 1, 1,
-0.4204759, 1.657704, -0.3370718, 0, 0, 0, 1, 1,
-0.410868, -1.000819, -2.977148, 0, 0, 0, 1, 1,
-0.4077262, 0.2790104, -0.9458595, 0, 0, 0, 1, 1,
-0.4057446, -0.2835617, -3.913794, 1, 1, 1, 1, 1,
-0.4043211, 0.7995511, -0.7980012, 1, 1, 1, 1, 1,
-0.4040149, 0.2904134, -1.963439, 1, 1, 1, 1, 1,
-0.4023862, 1.151037, -1.660361, 1, 1, 1, 1, 1,
-0.3975202, 0.6663378, 1.128595, 1, 1, 1, 1, 1,
-0.3947482, 0.1830726, -0.08568867, 1, 1, 1, 1, 1,
-0.3880459, -0.2488961, -2.215343, 1, 1, 1, 1, 1,
-0.3817427, 0.2799303, -1.97188, 1, 1, 1, 1, 1,
-0.3816059, 1.091438, -1.072923, 1, 1, 1, 1, 1,
-0.3761462, 0.6598635, -0.05510357, 1, 1, 1, 1, 1,
-0.3733536, 0.9052777, 0.5175962, 1, 1, 1, 1, 1,
-0.3681302, -0.7465045, -3.086803, 1, 1, 1, 1, 1,
-0.3623593, 1.090241, -0.4963514, 1, 1, 1, 1, 1,
-0.3576491, -1.209156, -3.394561, 1, 1, 1, 1, 1,
-0.351161, -1.95822, -2.829348, 1, 1, 1, 1, 1,
-0.3485107, -0.05724443, -0.6906767, 0, 0, 1, 1, 1,
-0.3473948, -0.00302268, -2.999173, 1, 0, 0, 1, 1,
-0.3472248, -1.484213, -2.468112, 1, 0, 0, 1, 1,
-0.3452043, -1.516904, -3.810658, 1, 0, 0, 1, 1,
-0.3421121, -0.3739891, -2.568209, 1, 0, 0, 1, 1,
-0.3390816, -0.8616852, -3.589922, 1, 0, 0, 1, 1,
-0.3390352, -1.743798, -4.017374, 0, 0, 0, 1, 1,
-0.3372348, -0.7356659, -3.290504, 0, 0, 0, 1, 1,
-0.3360117, 0.7950887, 0.7284384, 0, 0, 0, 1, 1,
-0.3343729, 0.04482583, -2.447569, 0, 0, 0, 1, 1,
-0.3331735, 1.01519, -0.8666693, 0, 0, 0, 1, 1,
-0.3323062, 1.086876, 0.145785, 0, 0, 0, 1, 1,
-0.3307213, -0.3391927, -1.559686, 0, 0, 0, 1, 1,
-0.33046, 0.6418471, -1.287154, 1, 1, 1, 1, 1,
-0.330175, 0.6092293, -2.435823, 1, 1, 1, 1, 1,
-0.3295679, -0.1046748, -4.280453, 1, 1, 1, 1, 1,
-0.3273049, -1.018388, -3.300907, 1, 1, 1, 1, 1,
-0.32568, 1.457668, -0.3780989, 1, 1, 1, 1, 1,
-0.3183348, 2.513821, 1.410815, 1, 1, 1, 1, 1,
-0.3128171, -0.5689396, -3.39652, 1, 1, 1, 1, 1,
-0.3109767, -0.1425294, -1.35671, 1, 1, 1, 1, 1,
-0.3067251, -0.2820684, -2.838653, 1, 1, 1, 1, 1,
-0.3046895, -0.1568267, -1.20114, 1, 1, 1, 1, 1,
-0.3035194, 0.48505, -1.135178, 1, 1, 1, 1, 1,
-0.3019144, 1.018182, 0.3788648, 1, 1, 1, 1, 1,
-0.2996443, -0.5933404, -2.175323, 1, 1, 1, 1, 1,
-0.298916, 0.2327951, -1.169316, 1, 1, 1, 1, 1,
-0.2940564, -2.447154, -4.263308, 1, 1, 1, 1, 1,
-0.2937186, 1.165727, 0.3202955, 0, 0, 1, 1, 1,
-0.291339, -0.4813359, -3.712757, 1, 0, 0, 1, 1,
-0.290973, 0.4310915, -1.401806, 1, 0, 0, 1, 1,
-0.2879672, 0.718207, -1.899365, 1, 0, 0, 1, 1,
-0.2856038, 1.547946, -0.3008171, 1, 0, 0, 1, 1,
-0.2854336, -0.3766804, -3.93038, 1, 0, 0, 1, 1,
-0.2759239, 0.3557837, 1.48751, 0, 0, 0, 1, 1,
-0.2756513, 1.282666, 0.9917257, 0, 0, 0, 1, 1,
-0.2686149, -0.0598975, -2.161951, 0, 0, 0, 1, 1,
-0.268017, 1.240524, -2.513098, 0, 0, 0, 1, 1,
-0.2648953, -0.03496366, -2.966673, 0, 0, 0, 1, 1,
-0.2559286, -0.09165673, -2.585161, 0, 0, 0, 1, 1,
-0.2553149, 0.1498201, -1.127054, 0, 0, 0, 1, 1,
-0.2549765, 0.2862518, 0.5271111, 1, 1, 1, 1, 1,
-0.2503151, -2.814017, -3.432588, 1, 1, 1, 1, 1,
-0.2449991, -0.890664, -3.59859, 1, 1, 1, 1, 1,
-0.2433602, 0.66164, 0.7874613, 1, 1, 1, 1, 1,
-0.2416289, -0.314365, -2.095493, 1, 1, 1, 1, 1,
-0.2385938, 1.777056, 1.391283, 1, 1, 1, 1, 1,
-0.2359018, -0.2218304, -1.678497, 1, 1, 1, 1, 1,
-0.2288009, -0.2437362, -2.618987, 1, 1, 1, 1, 1,
-0.2287931, 0.2146707, -0.1897036, 1, 1, 1, 1, 1,
-0.227575, -0.6599737, -3.461895, 1, 1, 1, 1, 1,
-0.2274394, 2.173565, -0.02199826, 1, 1, 1, 1, 1,
-0.2253829, -0.5106512, -2.266333, 1, 1, 1, 1, 1,
-0.2248743, -0.3908195, -4.207517, 1, 1, 1, 1, 1,
-0.2241866, 0.5440605, 1.153089, 1, 1, 1, 1, 1,
-0.2238151, -0.04441603, 0.2441525, 1, 1, 1, 1, 1,
-0.2220773, -0.5908722, -2.446355, 0, 0, 1, 1, 1,
-0.2220314, -0.8216678, -3.824179, 1, 0, 0, 1, 1,
-0.2142676, -1.214699, -2.790782, 1, 0, 0, 1, 1,
-0.208731, 0.6163641, -2.586619, 1, 0, 0, 1, 1,
-0.2069216, 1.237308, 0.3180797, 1, 0, 0, 1, 1,
-0.20233, 0.3787463, 0.254523, 1, 0, 0, 1, 1,
-0.1963063, -0.4947402, -2.813532, 0, 0, 0, 1, 1,
-0.1957784, -0.2711369, -3.252087, 0, 0, 0, 1, 1,
-0.1948401, 0.8997219, -0.4617079, 0, 0, 0, 1, 1,
-0.1910891, 0.9042063, 0.3530677, 0, 0, 0, 1, 1,
-0.1817061, 0.2939708, -1.217093, 0, 0, 0, 1, 1,
-0.179047, 0.8178183, -0.8505892, 0, 0, 0, 1, 1,
-0.1763482, 1.534339, 1.365314, 0, 0, 0, 1, 1,
-0.173214, -0.7185385, -2.694447, 1, 1, 1, 1, 1,
-0.165741, -1.074472, -2.555757, 1, 1, 1, 1, 1,
-0.163531, 0.3830081, -0.4653078, 1, 1, 1, 1, 1,
-0.1544575, 0.1037354, -1.515166, 1, 1, 1, 1, 1,
-0.1539828, -0.5355017, -3.297381, 1, 1, 1, 1, 1,
-0.1532328, 2.179524, 1.576276, 1, 1, 1, 1, 1,
-0.1456792, 2.053332, 0.3328807, 1, 1, 1, 1, 1,
-0.1416253, 0.9200729, -1.580179, 1, 1, 1, 1, 1,
-0.1415538, -0.3167927, -1.68714, 1, 1, 1, 1, 1,
-0.1402201, 1.206055, 0.3071614, 1, 1, 1, 1, 1,
-0.1390594, 0.6028581, -0.5123409, 1, 1, 1, 1, 1,
-0.1374469, -0.1194024, -2.918243, 1, 1, 1, 1, 1,
-0.1348733, -0.7174683, -3.248864, 1, 1, 1, 1, 1,
-0.1341742, 1.353071, -0.4189542, 1, 1, 1, 1, 1,
-0.1337617, -1.386889, -2.687581, 1, 1, 1, 1, 1,
-0.1331598, -1.211774, -3.576003, 0, 0, 1, 1, 1,
-0.1316292, 1.337331, 1.114679, 1, 0, 0, 1, 1,
-0.1308356, -0.5839505, -2.924108, 1, 0, 0, 1, 1,
-0.1288764, 0.05937669, -0.06427415, 1, 0, 0, 1, 1,
-0.1282347, 1.611148, 0.01555346, 1, 0, 0, 1, 1,
-0.1269876, -1.191433, -2.152422, 1, 0, 0, 1, 1,
-0.1239623, -0.966251, -3.464903, 0, 0, 0, 1, 1,
-0.1216134, -0.08404387, -0.9104787, 0, 0, 0, 1, 1,
-0.1200506, -0.7049477, -3.392791, 0, 0, 0, 1, 1,
-0.1085398, -0.61869, -3.051456, 0, 0, 0, 1, 1,
-0.1058343, 0.4639809, -1.460616, 0, 0, 0, 1, 1,
-0.1047823, -0.09861641, -1.091342, 0, 0, 0, 1, 1,
-0.1040851, -0.355944, -3.770138, 0, 0, 0, 1, 1,
-0.103118, 0.1331132, -0.2498097, 1, 1, 1, 1, 1,
-0.1017314, 0.5197013, 0.0886555, 1, 1, 1, 1, 1,
-0.1012212, 0.3069145, 0.3114968, 1, 1, 1, 1, 1,
-0.1010024, -1.90622, -1.361335, 1, 1, 1, 1, 1,
-0.09544974, -1.224268, -3.509692, 1, 1, 1, 1, 1,
-0.09527364, -0.8676811, -3.54145, 1, 1, 1, 1, 1,
-0.09507637, 0.2680382, -0.9456777, 1, 1, 1, 1, 1,
-0.09062286, -0.6342366, -1.87525, 1, 1, 1, 1, 1,
-0.09061614, 0.4345832, -0.8785976, 1, 1, 1, 1, 1,
-0.08680605, -1.126075, -2.504694, 1, 1, 1, 1, 1,
-0.08596468, 2.048107, -0.07639029, 1, 1, 1, 1, 1,
-0.08522663, -1.427233, -3.892852, 1, 1, 1, 1, 1,
-0.08154146, 0.1982182, 0.2097798, 1, 1, 1, 1, 1,
-0.07897293, 0.9763052, -0.5207276, 1, 1, 1, 1, 1,
-0.0780202, 1.702645, -0.8777408, 1, 1, 1, 1, 1,
-0.0775755, -0.2120225, -2.72238, 0, 0, 1, 1, 1,
-0.07205575, 0.2938671, -1.618321, 1, 0, 0, 1, 1,
-0.06590924, -2.26362, -0.7709547, 1, 0, 0, 1, 1,
-0.06397874, -0.1295037, -2.290189, 1, 0, 0, 1, 1,
-0.05831476, -0.7727522, -2.821427, 1, 0, 0, 1, 1,
-0.05596009, -0.534551, -2.760797, 1, 0, 0, 1, 1,
-0.05343004, 1.210728, 1.530602, 0, 0, 0, 1, 1,
-0.05001095, 0.8838348, -0.881587, 0, 0, 0, 1, 1,
-0.04984568, -0.6348696, -1.095739, 0, 0, 0, 1, 1,
-0.04901147, -0.7966702, -1.598756, 0, 0, 0, 1, 1,
-0.04772101, -0.2764583, -3.394561, 0, 0, 0, 1, 1,
-0.04706859, -0.9879182, -3.089326, 0, 0, 0, 1, 1,
-0.04505746, 1.127339, 0.3969587, 0, 0, 0, 1, 1,
-0.04271147, 0.1504424, 1.691584, 1, 1, 1, 1, 1,
-0.04034393, -1.738164, -3.167093, 1, 1, 1, 1, 1,
-0.04000076, 1.184938, -0.8469211, 1, 1, 1, 1, 1,
-0.03945823, 0.09999276, -0.4450534, 1, 1, 1, 1, 1,
-0.03584638, -1.455985, -4.347294, 1, 1, 1, 1, 1,
-0.03558053, -1.007932, -3.752079, 1, 1, 1, 1, 1,
-0.0303544, 0.5319138, 0.1746525, 1, 1, 1, 1, 1,
-0.028268, -0.4143116, -2.739721, 1, 1, 1, 1, 1,
-0.02782521, 0.4193399, 1.232279, 1, 1, 1, 1, 1,
-0.02714019, -0.4524505, -3.559862, 1, 1, 1, 1, 1,
-0.02449293, 1.625099, -0.1730898, 1, 1, 1, 1, 1,
-0.02300868, -0.3093656, -4.714062, 1, 1, 1, 1, 1,
-0.01766684, 0.4916596, -1.631769, 1, 1, 1, 1, 1,
-0.01673315, 0.2505771, -0.872781, 1, 1, 1, 1, 1,
-0.01555161, 0.9990365, 0.7348915, 1, 1, 1, 1, 1,
-0.01374435, 2.028306, 0.9615593, 0, 0, 1, 1, 1,
-0.01055558, -0.3762538, -2.912926, 1, 0, 0, 1, 1,
-0.007631491, -0.2201203, -3.340352, 1, 0, 0, 1, 1,
-0.007515419, 0.3907119, 0.7187111, 1, 0, 0, 1, 1,
0.0007093142, 0.3794945, -1.105563, 1, 0, 0, 1, 1,
0.003460776, -0.6072577, 2.269049, 1, 0, 0, 1, 1,
0.006796643, -0.6577255, 1.709977, 0, 0, 0, 1, 1,
0.007661409, 1.586969, 1.188597, 0, 0, 0, 1, 1,
0.009296379, -0.8479957, 4.574561, 0, 0, 0, 1, 1,
0.01027639, -0.3507481, 1.93528, 0, 0, 0, 1, 1,
0.01145787, -1.298225, 2.459195, 0, 0, 0, 1, 1,
0.01358557, -1.414259, 3.366515, 0, 0, 0, 1, 1,
0.01528959, -2.316319, 3.799671, 0, 0, 0, 1, 1,
0.02071588, -1.514168, 2.916664, 1, 1, 1, 1, 1,
0.02173581, -0.1848658, 0.9454747, 1, 1, 1, 1, 1,
0.02720901, 1.186448, 0.5649763, 1, 1, 1, 1, 1,
0.02843894, -0.2828698, 4.50701, 1, 1, 1, 1, 1,
0.02855345, 0.199553, 0.7748746, 1, 1, 1, 1, 1,
0.03018687, 1.354914, -1.140047, 1, 1, 1, 1, 1,
0.0329974, -0.3256594, 1.181231, 1, 1, 1, 1, 1,
0.03719707, 0.8363552, -0.557014, 1, 1, 1, 1, 1,
0.04387177, 0.1680029, 2.355366, 1, 1, 1, 1, 1,
0.04404971, 0.6794296, 1.506335, 1, 1, 1, 1, 1,
0.04648913, 0.1589813, 0.8936551, 1, 1, 1, 1, 1,
0.0475218, -0.1585025, 1.359501, 1, 1, 1, 1, 1,
0.05329756, 0.1380165, 0.2426947, 1, 1, 1, 1, 1,
0.06954566, -0.4226277, 1.772029, 1, 1, 1, 1, 1,
0.07008314, 0.9520907, -0.2755976, 1, 1, 1, 1, 1,
0.07116448, -1.602876, 2.772527, 0, 0, 1, 1, 1,
0.07158253, 0.5411197, -0.03628183, 1, 0, 0, 1, 1,
0.07428709, 0.07228021, -0.2564735, 1, 0, 0, 1, 1,
0.07704842, -0.2248589, 2.69437, 1, 0, 0, 1, 1,
0.07750221, -1.084617, 3.834277, 1, 0, 0, 1, 1,
0.08272109, -1.009993, 2.311291, 1, 0, 0, 1, 1,
0.08301702, -1.291837, 4.480349, 0, 0, 0, 1, 1,
0.08970328, -0.8557902, 3.520482, 0, 0, 0, 1, 1,
0.09155406, -0.5926028, 4.604328, 0, 0, 0, 1, 1,
0.0919487, 0.2727185, 0.2445592, 0, 0, 0, 1, 1,
0.09296621, 0.003918659, 0.7321582, 0, 0, 0, 1, 1,
0.09505501, -0.5378081, 2.425876, 0, 0, 0, 1, 1,
0.09828841, 2.263092, 0.2027769, 0, 0, 0, 1, 1,
0.1013263, -0.3782545, 3.304692, 1, 1, 1, 1, 1,
0.1025929, -2.0726, 3.594654, 1, 1, 1, 1, 1,
0.1040309, -0.3728965, 2.96573, 1, 1, 1, 1, 1,
0.104117, -0.8110697, 2.477056, 1, 1, 1, 1, 1,
0.1044575, 0.08884028, 0.4878952, 1, 1, 1, 1, 1,
0.1045909, -1.78009, 2.315519, 1, 1, 1, 1, 1,
0.1081946, 0.06418285, 0.984513, 1, 1, 1, 1, 1,
0.1087698, 0.7222815, -0.6199364, 1, 1, 1, 1, 1,
0.1095187, -2.302413, 4.425483, 1, 1, 1, 1, 1,
0.1107717, 0.1263907, 0.1433891, 1, 1, 1, 1, 1,
0.1127757, -0.7598228, 3.789988, 1, 1, 1, 1, 1,
0.1167743, -1.329306, 4.515984, 1, 1, 1, 1, 1,
0.1187938, -0.52011, 2.820184, 1, 1, 1, 1, 1,
0.1222915, 0.4801041, 1.123843, 1, 1, 1, 1, 1,
0.1236985, -0.3905366, 2.835859, 1, 1, 1, 1, 1,
0.1237277, 0.2784104, 0.8357848, 0, 0, 1, 1, 1,
0.1351598, -0.3119173, 3.177096, 1, 0, 0, 1, 1,
0.1360342, -0.7425857, 3.273943, 1, 0, 0, 1, 1,
0.1361582, 0.4342247, -0.3059562, 1, 0, 0, 1, 1,
0.13636, -0.2841059, 3.723798, 1, 0, 0, 1, 1,
0.1371791, -0.5737433, 3.08864, 1, 0, 0, 1, 1,
0.1381037, -0.8167102, 1.881211, 0, 0, 0, 1, 1,
0.1389807, 0.204355, 0.3401168, 0, 0, 0, 1, 1,
0.1398195, -0.6654117, 3.728561, 0, 0, 0, 1, 1,
0.1406801, -0.276867, 2.954144, 0, 0, 0, 1, 1,
0.1413944, -2.809816, 3.583223, 0, 0, 0, 1, 1,
0.1524144, 2.125816, -0.6848476, 0, 0, 0, 1, 1,
0.1549267, 0.5429326, 0.7522966, 0, 0, 0, 1, 1,
0.1561124, -1.405537, 0.4859028, 1, 1, 1, 1, 1,
0.1590936, -1.379524, 3.302145, 1, 1, 1, 1, 1,
0.1622812, 0.4680188, -0.9645545, 1, 1, 1, 1, 1,
0.1634039, 0.1758627, 0.3476054, 1, 1, 1, 1, 1,
0.163758, 0.3823472, 2.174372, 1, 1, 1, 1, 1,
0.1693585, 0.4246225, -0.944526, 1, 1, 1, 1, 1,
0.171644, 0.273672, -1.133449, 1, 1, 1, 1, 1,
0.1729752, -1.944499, 2.975131, 1, 1, 1, 1, 1,
0.1755706, -0.9460286, -0.5253948, 1, 1, 1, 1, 1,
0.1792187, -1.399017, 3.180274, 1, 1, 1, 1, 1,
0.1799759, -0.4812339, 1.425069, 1, 1, 1, 1, 1,
0.1811475, 0.2946364, 1.977533, 1, 1, 1, 1, 1,
0.1833849, -1.135638, 3.469764, 1, 1, 1, 1, 1,
0.1859716, 1.294511, -0.6788092, 1, 1, 1, 1, 1,
0.1927123, -1.139874, 4.354064, 1, 1, 1, 1, 1,
0.1928832, -0.7112735, 2.52005, 0, 0, 1, 1, 1,
0.1935255, -0.2050786, 2.315598, 1, 0, 0, 1, 1,
0.2002439, -0.9740823, 3.733713, 1, 0, 0, 1, 1,
0.2026658, 0.1471435, 0.480159, 1, 0, 0, 1, 1,
0.2050246, -0.31411, 2.738068, 1, 0, 0, 1, 1,
0.2131558, 1.32866, 1.027363, 1, 0, 0, 1, 1,
0.2140606, 0.7616225, 0.6390132, 0, 0, 0, 1, 1,
0.2191261, -0.6709375, 3.401726, 0, 0, 0, 1, 1,
0.2194766, 1.05701, 0.7387099, 0, 0, 0, 1, 1,
0.2248775, -0.7092699, 3.422165, 0, 0, 0, 1, 1,
0.224976, -0.7202541, 2.938035, 0, 0, 0, 1, 1,
0.2256483, 1.034794, -1.415114, 0, 0, 0, 1, 1,
0.2280904, 1.086637, 1.667112, 0, 0, 0, 1, 1,
0.2304954, 0.7310826, -0.150532, 1, 1, 1, 1, 1,
0.2366848, 0.7142909, 0.8982109, 1, 1, 1, 1, 1,
0.2425649, -1.777728, 2.861865, 1, 1, 1, 1, 1,
0.2477973, -0.8071234, 2.695714, 1, 1, 1, 1, 1,
0.2487788, 0.1838835, 1.446243, 1, 1, 1, 1, 1,
0.2544391, -1.108811, 4.323549, 1, 1, 1, 1, 1,
0.2548327, 0.2383231, 0.4993157, 1, 1, 1, 1, 1,
0.2562546, 1.980436, 1.795684, 1, 1, 1, 1, 1,
0.2583996, -0.3398555, 4.31834, 1, 1, 1, 1, 1,
0.2600248, 0.5191239, 0.3890291, 1, 1, 1, 1, 1,
0.2609905, -0.3804808, 2.449027, 1, 1, 1, 1, 1,
0.2618918, -0.1690022, 2.251333, 1, 1, 1, 1, 1,
0.2629219, -0.652125, 2.771862, 1, 1, 1, 1, 1,
0.2630052, 0.1314768, 0.7727477, 1, 1, 1, 1, 1,
0.2656845, 2.375074, 0.08181919, 1, 1, 1, 1, 1,
0.265784, 0.310362, -0.6409554, 0, 0, 1, 1, 1,
0.2780159, 1.098927, -0.2782587, 1, 0, 0, 1, 1,
0.280487, -0.5084618, 1.860045, 1, 0, 0, 1, 1,
0.2821258, 2.143881, 0.2771867, 1, 0, 0, 1, 1,
0.2834896, -0.7207544, 2.067503, 1, 0, 0, 1, 1,
0.28575, 0.2268586, 2.778679, 1, 0, 0, 1, 1,
0.2875822, -0.3583539, 3.140138, 0, 0, 0, 1, 1,
0.2876777, -1.335414, 3.286128, 0, 0, 0, 1, 1,
0.2903855, -0.5718522, 3.863313, 0, 0, 0, 1, 1,
0.2914782, -0.3068476, 1.786074, 0, 0, 0, 1, 1,
0.2924098, -0.1393214, 3.100377, 0, 0, 0, 1, 1,
0.2931455, 1.565554, -2.659826, 0, 0, 0, 1, 1,
0.2988487, -0.5137372, 1.561062, 0, 0, 0, 1, 1,
0.2989752, -1.277514, 3.036077, 1, 1, 1, 1, 1,
0.3019978, -0.3265083, 2.309549, 1, 1, 1, 1, 1,
0.3044167, 1.305159, 0.9796373, 1, 1, 1, 1, 1,
0.3078591, -2.060065, 2.124288, 1, 1, 1, 1, 1,
0.31312, -0.8743998, 2.045586, 1, 1, 1, 1, 1,
0.3158229, 0.3184167, 1.571578, 1, 1, 1, 1, 1,
0.315831, -0.5181312, 5.265753, 1, 1, 1, 1, 1,
0.3165784, 0.3401237, 0.5090209, 1, 1, 1, 1, 1,
0.3191032, -1.062498, 2.166623, 1, 1, 1, 1, 1,
0.31969, -1.084227, 5.378935, 1, 1, 1, 1, 1,
0.3229565, 0.202986, -1.741169, 1, 1, 1, 1, 1,
0.3274675, 1.606128, -1.716216, 1, 1, 1, 1, 1,
0.3282237, -1.433946, 0.9569795, 1, 1, 1, 1, 1,
0.3292119, -2.127101, 3.701682, 1, 1, 1, 1, 1,
0.334118, -1.110215, 2.665514, 1, 1, 1, 1, 1,
0.334819, -0.5506814, 2.241225, 0, 0, 1, 1, 1,
0.3377739, 0.2207088, 0.7506603, 1, 0, 0, 1, 1,
0.3427908, 0.2173627, -0.6211068, 1, 0, 0, 1, 1,
0.3451502, -0.009577382, 0.9105142, 1, 0, 0, 1, 1,
0.3456176, -0.6682932, 1.922748, 1, 0, 0, 1, 1,
0.3499576, 3.067593, 0.1337308, 1, 0, 0, 1, 1,
0.3515863, 0.03297252, -0.4163791, 0, 0, 0, 1, 1,
0.3602345, -0.2195813, 2.609329, 0, 0, 0, 1, 1,
0.3622859, 0.8552314, -0.3114562, 0, 0, 0, 1, 1,
0.3663161, 1.368416, -1.940711, 0, 0, 0, 1, 1,
0.3707217, 0.1364828, 2.304406, 0, 0, 0, 1, 1,
0.3764556, -1.15739, 2.089748, 0, 0, 0, 1, 1,
0.3812713, -1.292287, 1.159627, 0, 0, 0, 1, 1,
0.3863132, -1.124081, 3.509711, 1, 1, 1, 1, 1,
0.3869824, 0.0818148, 1.322046, 1, 1, 1, 1, 1,
0.3906135, -0.9383897, 4.236694, 1, 1, 1, 1, 1,
0.3909081, 0.1240603, 1.398977, 1, 1, 1, 1, 1,
0.3913104, 0.193434, 2.465698, 1, 1, 1, 1, 1,
0.3938261, -0.1353299, 1.77605, 1, 1, 1, 1, 1,
0.3941799, -1.320973, 4.807999, 1, 1, 1, 1, 1,
0.3973596, -0.7211148, 2.990445, 1, 1, 1, 1, 1,
0.3984118, 0.3982082, 0.6618444, 1, 1, 1, 1, 1,
0.3991638, -0.3521716, 3.435195, 1, 1, 1, 1, 1,
0.4007782, -0.2600424, 3.016622, 1, 1, 1, 1, 1,
0.4061519, 0.4812929, 0.5038867, 1, 1, 1, 1, 1,
0.408988, 0.7320957, -1.029692, 1, 1, 1, 1, 1,
0.414722, -0.1886348, 0.5859162, 1, 1, 1, 1, 1,
0.4147614, -0.04425968, 1.186178, 1, 1, 1, 1, 1,
0.4171164, -0.2258028, 1.454187, 0, 0, 1, 1, 1,
0.4173291, -0.4211168, 2.557112, 1, 0, 0, 1, 1,
0.4231555, -0.2795462, 1.648798, 1, 0, 0, 1, 1,
0.4243962, -0.1809203, 1.52572, 1, 0, 0, 1, 1,
0.4254335, 0.8074716, 0.7947295, 1, 0, 0, 1, 1,
0.4306566, -1.196337, 3.956278, 1, 0, 0, 1, 1,
0.4334534, 0.5693923, 0.5235138, 0, 0, 0, 1, 1,
0.4371484, 0.5026393, 1.32447, 0, 0, 0, 1, 1,
0.4443255, 0.210268, 1.722356, 0, 0, 0, 1, 1,
0.4513961, -2.300654, 2.724122, 0, 0, 0, 1, 1,
0.4600563, -0.3228627, 1.078561, 0, 0, 0, 1, 1,
0.4604872, 0.8875455, -0.6166715, 0, 0, 0, 1, 1,
0.4608155, -0.6547212, 0.8949975, 0, 0, 0, 1, 1,
0.4610396, -2.23382, 3.891217, 1, 1, 1, 1, 1,
0.4623993, 0.6990529, -0.6951547, 1, 1, 1, 1, 1,
0.4631673, 0.6051329, 1.148487, 1, 1, 1, 1, 1,
0.467125, -0.6937327, 5.951969, 1, 1, 1, 1, 1,
0.4696223, 0.8015071, -0.5381625, 1, 1, 1, 1, 1,
0.4722632, -0.1555327, 3.648821, 1, 1, 1, 1, 1,
0.4742697, 0.8114138, -0.07124774, 1, 1, 1, 1, 1,
0.4788924, -0.2501304, -0.04377932, 1, 1, 1, 1, 1,
0.4873226, -2.247453, 3.866431, 1, 1, 1, 1, 1,
0.4978635, 0.4642083, -0.1991839, 1, 1, 1, 1, 1,
0.501397, 1.379665, -0.2178461, 1, 1, 1, 1, 1,
0.5026838, 1.609549, 0.340433, 1, 1, 1, 1, 1,
0.5034687, 0.3260181, 1.774698, 1, 1, 1, 1, 1,
0.5034729, 0.4041014, 2.220942, 1, 1, 1, 1, 1,
0.5062677, 0.3220862, 1.659033, 1, 1, 1, 1, 1,
0.515566, 0.5533542, 0.9955051, 0, 0, 1, 1, 1,
0.5177835, 0.2427635, -0.5497984, 1, 0, 0, 1, 1,
0.5194095, 0.5007519, 0.05403266, 1, 0, 0, 1, 1,
0.5198319, 0.1795327, 2.247484, 1, 0, 0, 1, 1,
0.5200114, 0.0696861, 3.120951, 1, 0, 0, 1, 1,
0.5248522, 1.291461, -0.0505242, 1, 0, 0, 1, 1,
0.5250944, 0.3323663, 0.03986563, 0, 0, 0, 1, 1,
0.5256946, -0.7726662, 2.848212, 0, 0, 0, 1, 1,
0.5265232, 1.599609, 2.100424, 0, 0, 0, 1, 1,
0.5285012, 1.070325, -0.9810281, 0, 0, 0, 1, 1,
0.5296525, 1.717473, -0.4632812, 0, 0, 0, 1, 1,
0.5297756, 0.1279529, 1.089601, 0, 0, 0, 1, 1,
0.5364898, 1.041055, 0.1847554, 0, 0, 0, 1, 1,
0.5385267, -0.3052404, 2.576999, 1, 1, 1, 1, 1,
0.545897, 0.3061444, -0.4120554, 1, 1, 1, 1, 1,
0.5472936, 0.2614627, 0.08942242, 1, 1, 1, 1, 1,
0.5473017, 0.4913358, 0.06080149, 1, 1, 1, 1, 1,
0.5511709, 0.8829603, 0.4344487, 1, 1, 1, 1, 1,
0.5544106, -1.161173, 1.085467, 1, 1, 1, 1, 1,
0.558989, 0.8221536, -0.3952168, 1, 1, 1, 1, 1,
0.5655814, 0.4838455, 0.4262501, 1, 1, 1, 1, 1,
0.5735185, 0.3978741, 0.9875943, 1, 1, 1, 1, 1,
0.5744373, -0.6500918, 2.898201, 1, 1, 1, 1, 1,
0.5833974, 0.7286678, -0.3318717, 1, 1, 1, 1, 1,
0.5835759, 0.2854925, 1.115524, 1, 1, 1, 1, 1,
0.5851426, -1.301261, 1.802871, 1, 1, 1, 1, 1,
0.5926538, -0.7330366, 2.466955, 1, 1, 1, 1, 1,
0.5932908, -0.6935709, 0.7256159, 1, 1, 1, 1, 1,
0.5950097, 1.250079, 2.017535, 0, 0, 1, 1, 1,
0.6041246, 1.040137, -1.189326, 1, 0, 0, 1, 1,
0.6054542, -0.06773808, 1.150157, 1, 0, 0, 1, 1,
0.6081935, -0.9733287, 4.99337, 1, 0, 0, 1, 1,
0.6159102, 1.344626, 2.731818, 1, 0, 0, 1, 1,
0.6189148, 0.5358841, 1.073566, 1, 0, 0, 1, 1,
0.619274, -0.3164371, 1.335983, 0, 0, 0, 1, 1,
0.6199106, 2.606288, 0.07371514, 0, 0, 0, 1, 1,
0.6210911, 0.4364854, 1.223546, 0, 0, 0, 1, 1,
0.6220132, -0.4672021, 1.930935, 0, 0, 0, 1, 1,
0.6321974, 0.2502866, -0.08450478, 0, 0, 0, 1, 1,
0.6368495, -0.2900177, 1.600329, 0, 0, 0, 1, 1,
0.6399723, 1.242383, 1.714046, 0, 0, 0, 1, 1,
0.6447082, -0.442134, 1.645421, 1, 1, 1, 1, 1,
0.6500983, -0.4718398, 1.086284, 1, 1, 1, 1, 1,
0.6520388, 1.578499, 0.137703, 1, 1, 1, 1, 1,
0.6532254, 0.7656956, 0.2409736, 1, 1, 1, 1, 1,
0.6549554, -1.180503, 2.995016, 1, 1, 1, 1, 1,
0.6553517, -1.031503, 0.02720947, 1, 1, 1, 1, 1,
0.661521, -0.273512, 2.67903, 1, 1, 1, 1, 1,
0.664278, 0.03376905, 1.740524, 1, 1, 1, 1, 1,
0.6659417, -0.5405639, 2.389317, 1, 1, 1, 1, 1,
0.6716434, -1.32065, 2.502675, 1, 1, 1, 1, 1,
0.6757358, 0.1234338, 1.763063, 1, 1, 1, 1, 1,
0.6812244, 0.5632262, 0.5094582, 1, 1, 1, 1, 1,
0.68735, 1.117347, 1.817977, 1, 1, 1, 1, 1,
0.6901765, -0.1050944, 1.243938, 1, 1, 1, 1, 1,
0.6912563, 0.5000344, 1.304277, 1, 1, 1, 1, 1,
0.6946899, 2.053251, 1.714127, 0, 0, 1, 1, 1,
0.6957411, 0.4329722, 0.4019858, 1, 0, 0, 1, 1,
0.6998665, -2.115903, 4.123569, 1, 0, 0, 1, 1,
0.7016058, -0.5054463, 2.899304, 1, 0, 0, 1, 1,
0.7080457, -0.9352113, 2.743443, 1, 0, 0, 1, 1,
0.7089242, -1.384869, -0.237582, 1, 0, 0, 1, 1,
0.7094445, 0.7532279, 1.9557, 0, 0, 0, 1, 1,
0.7099422, -0.01020921, -0.3141615, 0, 0, 0, 1, 1,
0.7117331, 0.6632003, 0.2321779, 0, 0, 0, 1, 1,
0.7121967, -2.029341, 1.859779, 0, 0, 0, 1, 1,
0.7126823, 0.638945, 0.9271777, 0, 0, 0, 1, 1,
0.7136434, -0.8043807, 2.386583, 0, 0, 0, 1, 1,
0.7171547, -0.3690292, 2.328805, 0, 0, 0, 1, 1,
0.7201211, 0.8770453, 2.298514, 1, 1, 1, 1, 1,
0.7247381, -0.2807586, 0.9045192, 1, 1, 1, 1, 1,
0.7268131, 0.7009033, 1.725935, 1, 1, 1, 1, 1,
0.7284858, 0.8858814, -0.1839966, 1, 1, 1, 1, 1,
0.7289479, -1.250483, 2.022329, 1, 1, 1, 1, 1,
0.7305108, -0.5481133, 1.943722, 1, 1, 1, 1, 1,
0.7343681, -0.2503614, 1.387967, 1, 1, 1, 1, 1,
0.7407296, 1.279605, -0.687851, 1, 1, 1, 1, 1,
0.7417076, -0.01938569, 1.697748, 1, 1, 1, 1, 1,
0.7481519, -0.3625935, 3.394526, 1, 1, 1, 1, 1,
0.7556985, 1.163641, 0.2223628, 1, 1, 1, 1, 1,
0.7587702, -0.8367661, 0.5641962, 1, 1, 1, 1, 1,
0.7589039, 0.2320787, 2.719092, 1, 1, 1, 1, 1,
0.7613166, -1.005982, 3.705644, 1, 1, 1, 1, 1,
0.7626976, 1.065416, -0.8551531, 1, 1, 1, 1, 1,
0.7630886, 0.3802864, 1.573323, 0, 0, 1, 1, 1,
0.7659486, -0.6023313, 1.833622, 1, 0, 0, 1, 1,
0.76614, 0.2672944, 1.962518, 1, 0, 0, 1, 1,
0.7721407, -1.193241, 2.789684, 1, 0, 0, 1, 1,
0.7762536, -0.4144474, 2.361685, 1, 0, 0, 1, 1,
0.7771573, -0.5544985, 2.707644, 1, 0, 0, 1, 1,
0.7791402, -0.2150145, 1.59267, 0, 0, 0, 1, 1,
0.7804148, -0.7093537, 4.302925, 0, 0, 0, 1, 1,
0.7910119, -0.5556093, 2.634444, 0, 0, 0, 1, 1,
0.7939449, 0.5636158, 1.220989, 0, 0, 0, 1, 1,
0.7962294, -0.5091013, 1.494744, 0, 0, 0, 1, 1,
0.7976891, -1.428242, 1.222883, 0, 0, 0, 1, 1,
0.798673, -1.188177, 0.8938164, 0, 0, 0, 1, 1,
0.8095511, -0.5258518, 2.284884, 1, 1, 1, 1, 1,
0.814481, 1.194702, 1.767131, 1, 1, 1, 1, 1,
0.8175379, -0.04920982, 2.248496, 1, 1, 1, 1, 1,
0.8228885, -1.027545, 1.636773, 1, 1, 1, 1, 1,
0.8232621, 1.641266, -0.1008164, 1, 1, 1, 1, 1,
0.8261437, -0.3908136, 1.253624, 1, 1, 1, 1, 1,
0.8266248, 0.9587455, -0.5791763, 1, 1, 1, 1, 1,
0.8280983, 0.3072401, 1.54444, 1, 1, 1, 1, 1,
0.8300924, 0.4829612, 0.5012335, 1, 1, 1, 1, 1,
0.8325967, 1.99169, 0.3254998, 1, 1, 1, 1, 1,
0.8396579, -0.708366, 0.5583873, 1, 1, 1, 1, 1,
0.8402206, -0.04916218, 1.781847, 1, 1, 1, 1, 1,
0.8469343, -1.101968, 3.418884, 1, 1, 1, 1, 1,
0.8508424, -2.445743, 2.584177, 1, 1, 1, 1, 1,
0.8533528, -1.264144, 1.918133, 1, 1, 1, 1, 1,
0.8568394, 0.1357124, 1.599668, 0, 0, 1, 1, 1,
0.865978, 1.08239, -1.093263, 1, 0, 0, 1, 1,
0.8699567, -0.745887, 1.166574, 1, 0, 0, 1, 1,
0.876408, -0.1974648, 2.417482, 1, 0, 0, 1, 1,
0.8809636, -0.4227809, 2.287689, 1, 0, 0, 1, 1,
0.8829812, 0.4530797, 1.205066, 1, 0, 0, 1, 1,
0.8870823, 0.09369252, 1.741257, 0, 0, 0, 1, 1,
0.89303, -1.147131, 1.356682, 0, 0, 0, 1, 1,
0.8947057, -0.724462, 0.5136497, 0, 0, 0, 1, 1,
0.9046386, -1.073054, 1.367299, 0, 0, 0, 1, 1,
0.907903, -0.06464592, 1.803371, 0, 0, 0, 1, 1,
0.9083025, 0.4016784, 0.5910283, 0, 0, 0, 1, 1,
0.9152355, -0.06258038, 4.123626, 0, 0, 0, 1, 1,
0.915949, -1.523402, 0.8764785, 1, 1, 1, 1, 1,
0.9162246, -0.2794216, 2.955935, 1, 1, 1, 1, 1,
0.9191697, 0.3590721, 0.7090893, 1, 1, 1, 1, 1,
0.9232266, -0.05852022, 1.678784, 1, 1, 1, 1, 1,
0.9256142, 1.918652, -0.07844368, 1, 1, 1, 1, 1,
0.9282616, -0.8944184, 1.765762, 1, 1, 1, 1, 1,
0.928531, 0.7956024, 2.705152, 1, 1, 1, 1, 1,
0.9322763, -0.7564218, 3.51989, 1, 1, 1, 1, 1,
0.9326431, 0.000587745, 1.675767, 1, 1, 1, 1, 1,
0.9339685, -1.152507, 2.749035, 1, 1, 1, 1, 1,
0.9387012, -0.1709648, 1.762979, 1, 1, 1, 1, 1,
0.9485959, -0.2083966, 1.137694, 1, 1, 1, 1, 1,
0.949093, 0.2299297, 2.238762, 1, 1, 1, 1, 1,
0.9508042, 0.1006092, 0.5332806, 1, 1, 1, 1, 1,
0.9531593, -0.4050981, 3.422635, 1, 1, 1, 1, 1,
0.9531831, 1.187631, 1.068597, 0, 0, 1, 1, 1,
0.9548063, 1.707355, 1.276685, 1, 0, 0, 1, 1,
0.9593588, 2.008747, 0.2388899, 1, 0, 0, 1, 1,
0.9630961, -0.2624888, 0.8593742, 1, 0, 0, 1, 1,
0.9638615, 0.1366455, 2.576549, 1, 0, 0, 1, 1,
0.9643257, 0.4212577, 1.733984, 1, 0, 0, 1, 1,
0.9686916, -1.792835, 3.122879, 0, 0, 0, 1, 1,
0.9827092, -0.7197195, 2.719054, 0, 0, 0, 1, 1,
0.9897378, 0.5316256, 0.4467778, 0, 0, 0, 1, 1,
1.000529, 0.2896419, 0.7692272, 0, 0, 0, 1, 1,
1.001062, 2.072663, -0.7607771, 0, 0, 0, 1, 1,
1.005001, 0.4973011, 0.6253181, 0, 0, 0, 1, 1,
1.005944, -0.7863013, 1.698398, 0, 0, 0, 1, 1,
1.00599, -1.378249, 4.965178, 1, 1, 1, 1, 1,
1.012815, -0.1278939, 2.087055, 1, 1, 1, 1, 1,
1.015532, -0.0771994, 1.051141, 1, 1, 1, 1, 1,
1.018923, 1.123733, 0.9161783, 1, 1, 1, 1, 1,
1.018943, 0.7460198, 1.131136, 1, 1, 1, 1, 1,
1.026307, -1.460325, 0.7132434, 1, 1, 1, 1, 1,
1.035635, -1.460309, 1.98729, 1, 1, 1, 1, 1,
1.035942, -0.1732655, 2.487391, 1, 1, 1, 1, 1,
1.041601, 0.3972681, 0.06570016, 1, 1, 1, 1, 1,
1.042088, -0.1605968, 2.834553, 1, 1, 1, 1, 1,
1.045502, 1.18686, 0.853505, 1, 1, 1, 1, 1,
1.046684, 0.1977891, 1.60412, 1, 1, 1, 1, 1,
1.052451, 1.607458, 2.012522, 1, 1, 1, 1, 1,
1.053178, -0.2348673, 2.081882, 1, 1, 1, 1, 1,
1.064145, 1.658813, 1.056258, 1, 1, 1, 1, 1,
1.067196, -0.9839447, 1.451551, 0, 0, 1, 1, 1,
1.074074, -0.457356, 1.041771, 1, 0, 0, 1, 1,
1.078091, 0.6305223, 1.189454, 1, 0, 0, 1, 1,
1.082232, 0.2772212, 1.183414, 1, 0, 0, 1, 1,
1.084426, 0.06059159, 2.211339, 1, 0, 0, 1, 1,
1.089465, 0.1157821, 1.931815, 1, 0, 0, 1, 1,
1.090076, -1.41749, 4.438217, 0, 0, 0, 1, 1,
1.097968, 0.2635599, 0.5920651, 0, 0, 0, 1, 1,
1.107347, -1.068626, 3.729656, 0, 0, 0, 1, 1,
1.108352, 0.05182877, 0.5765724, 0, 0, 0, 1, 1,
1.110803, -0.4088712, 1.306331, 0, 0, 0, 1, 1,
1.123617, -0.8478379, 1.765545, 0, 0, 0, 1, 1,
1.124157, 0.1457624, 1.771729, 0, 0, 0, 1, 1,
1.124267, 0.07498768, 1.717685, 1, 1, 1, 1, 1,
1.125845, -0.1648591, 2.019311, 1, 1, 1, 1, 1,
1.125949, 0.722639, 1.927451, 1, 1, 1, 1, 1,
1.128803, -2.1305, 1.837005, 1, 1, 1, 1, 1,
1.134739, 1.718359, 0.5091743, 1, 1, 1, 1, 1,
1.143224, 1.363237, -1.226034, 1, 1, 1, 1, 1,
1.145559, 0.2861719, 2.825975, 1, 1, 1, 1, 1,
1.147668, 0.5487605, 2.246063, 1, 1, 1, 1, 1,
1.156553, -0.5050247, 3.160775, 1, 1, 1, 1, 1,
1.163609, 1.240205, 0.6853672, 1, 1, 1, 1, 1,
1.167001, -0.3653483, 1.514869, 1, 1, 1, 1, 1,
1.176855, -0.3990854, 1.91665, 1, 1, 1, 1, 1,
1.177729, -0.8104057, 1.271836, 1, 1, 1, 1, 1,
1.178935, -0.2712812, 3.076093, 1, 1, 1, 1, 1,
1.179489, -0.3098595, 2.885612, 1, 1, 1, 1, 1,
1.186916, 0.8343664, 1.099407, 0, 0, 1, 1, 1,
1.188806, 0.3394812, 1.315516, 1, 0, 0, 1, 1,
1.196377, -0.01331306, 0.9710243, 1, 0, 0, 1, 1,
1.197754, -0.3363057, 1.973302, 1, 0, 0, 1, 1,
1.202767, 0.6619355, -0.6840014, 1, 0, 0, 1, 1,
1.211696, 1.334506, 1.517751, 1, 0, 0, 1, 1,
1.229079, -0.8178955, 1.938207, 0, 0, 0, 1, 1,
1.239513, -1.205796, 2.716065, 0, 0, 0, 1, 1,
1.245829, 0.7746896, 0.4542097, 0, 0, 0, 1, 1,
1.253152, -1.554295, 2.062376, 0, 0, 0, 1, 1,
1.253479, 2.029344, 3.182359, 0, 0, 0, 1, 1,
1.260779, 0.777313, 0.9729169, 0, 0, 0, 1, 1,
1.263172, 0.7249907, 0.8486976, 0, 0, 0, 1, 1,
1.263744, 0.9034151, 0.7463126, 1, 1, 1, 1, 1,
1.263978, 0.592062, -0.2007105, 1, 1, 1, 1, 1,
1.268873, 0.03828371, 1.838176, 1, 1, 1, 1, 1,
1.269861, -1.115476, 2.689985, 1, 1, 1, 1, 1,
1.272005, -0.6798306, 2.664692, 1, 1, 1, 1, 1,
1.279868, 1.089, 2.283867, 1, 1, 1, 1, 1,
1.283746, -0.1374331, 2.434578, 1, 1, 1, 1, 1,
1.299762, 0.4229209, -0.5332986, 1, 1, 1, 1, 1,
1.301635, -1.31212, 2.501967, 1, 1, 1, 1, 1,
1.306233, -0.2295918, 1.648728, 1, 1, 1, 1, 1,
1.308011, 0.9773905, 1.608235, 1, 1, 1, 1, 1,
1.309647, 0.08049326, 2.266787, 1, 1, 1, 1, 1,
1.31397, 0.2954271, 2.166131, 1, 1, 1, 1, 1,
1.322142, -1.625283, 2.96966, 1, 1, 1, 1, 1,
1.345384, 1.992355, -0.7271555, 1, 1, 1, 1, 1,
1.349799, 0.4510811, 0.7686611, 0, 0, 1, 1, 1,
1.359322, 0.5973321, 1.436291, 1, 0, 0, 1, 1,
1.369491, 0.7371317, 1.142091, 1, 0, 0, 1, 1,
1.37116, -0.0314251, 1.882938, 1, 0, 0, 1, 1,
1.371982, 0.6113158, 1.219584, 1, 0, 0, 1, 1,
1.372706, 1.216349, 1.116372, 1, 0, 0, 1, 1,
1.374684, -0.1572791, 1.563388, 0, 0, 0, 1, 1,
1.380662, 1.331669, 0.2500302, 0, 0, 0, 1, 1,
1.382738, -0.2904668, 1.707303, 0, 0, 0, 1, 1,
1.393195, -0.6441395, 0.5330058, 0, 0, 0, 1, 1,
1.426116, -0.8573561, 1.319407, 0, 0, 0, 1, 1,
1.430583, 1.276046, 0.2458376, 0, 0, 0, 1, 1,
1.440018, -1.812752, 2.391768, 0, 0, 0, 1, 1,
1.440426, 1.817834, -1.804847, 1, 1, 1, 1, 1,
1.442115, 0.4588165, -0.07585335, 1, 1, 1, 1, 1,
1.442636, -0.5929292, 4.156738, 1, 1, 1, 1, 1,
1.444241, 1.198845, -0.3971657, 1, 1, 1, 1, 1,
1.444584, -0.5449639, 3.224093, 1, 1, 1, 1, 1,
1.445586, 0.9237959, 0.4216978, 1, 1, 1, 1, 1,
1.447009, -0.6781511, 1.380027, 1, 1, 1, 1, 1,
1.448284, 1.55412, 1.085753, 1, 1, 1, 1, 1,
1.492072, 0.3789006, 0.5404487, 1, 1, 1, 1, 1,
1.502428, 1.223155, 0.261244, 1, 1, 1, 1, 1,
1.510017, -0.6414596, 1.780784, 1, 1, 1, 1, 1,
1.51182, 0.1424651, 1.424176, 1, 1, 1, 1, 1,
1.514111, -0.005412965, 2.35092, 1, 1, 1, 1, 1,
1.536812, 0.6545759, 1.02489, 1, 1, 1, 1, 1,
1.546181, -0.06875943, 0.1724307, 1, 1, 1, 1, 1,
1.550467, 0.2527609, 2.293694, 0, 0, 1, 1, 1,
1.552753, -0.1874401, 2.491045, 1, 0, 0, 1, 1,
1.573195, 0.5102799, -0.5732311, 1, 0, 0, 1, 1,
1.578681, -0.755331, 2.376238, 1, 0, 0, 1, 1,
1.58122, -0.865558, 2.25281, 1, 0, 0, 1, 1,
1.587795, -0.6306266, 2.865056, 1, 0, 0, 1, 1,
1.592891, -0.2985537, 1.545681, 0, 0, 0, 1, 1,
1.594438, 0.4487332, 1.183555, 0, 0, 0, 1, 1,
1.60904, -1.877339, 1.918959, 0, 0, 0, 1, 1,
1.609373, -1.016904, 3.171673, 0, 0, 0, 1, 1,
1.65521, -0.2976028, 1.056553, 0, 0, 0, 1, 1,
1.673266, 0.4570432, 2.383558, 0, 0, 0, 1, 1,
1.68981, 2.412719, 2.851668, 0, 0, 0, 1, 1,
1.727812, 1.380323, 2.354857, 1, 1, 1, 1, 1,
1.765737, 1.465093, 2.531083, 1, 1, 1, 1, 1,
1.768714, -0.1781963, 0.7886987, 1, 1, 1, 1, 1,
1.798379, 0.9723076, 0.3108058, 1, 1, 1, 1, 1,
1.805353, 1.136777, 1.528029, 1, 1, 1, 1, 1,
1.834898, -0.5280838, 1.262433, 1, 1, 1, 1, 1,
1.837655, -1.050647, 2.493322, 1, 1, 1, 1, 1,
1.870225, -0.01941332, 2.240775, 1, 1, 1, 1, 1,
1.901801, -0.357177, 2.539245, 1, 1, 1, 1, 1,
1.924775, -1.952571, 2.17189, 1, 1, 1, 1, 1,
1.934827, 0.5856871, 2.773169, 1, 1, 1, 1, 1,
1.963324, 0.01435545, 0.4756941, 1, 1, 1, 1, 1,
1.98606, -1.903332, 2.524312, 1, 1, 1, 1, 1,
1.989723, -0.06073134, -0.8609499, 1, 1, 1, 1, 1,
2.013064, -0.7176545, 2.290583, 1, 1, 1, 1, 1,
2.015066, 0.6345105, 2.898994, 0, 0, 1, 1, 1,
2.027756, 1.024481, -0.2416668, 1, 0, 0, 1, 1,
2.062015, -1.310616, 2.260294, 1, 0, 0, 1, 1,
2.091883, 0.6578591, 2.511911, 1, 0, 0, 1, 1,
2.118942, 1.361315, 2.455561, 1, 0, 0, 1, 1,
2.129982, 0.5236388, 1.669408, 1, 0, 0, 1, 1,
2.241816, -1.491568, 3.362342, 0, 0, 0, 1, 1,
2.298755, 1.187903, 0.872006, 0, 0, 0, 1, 1,
2.445358, 0.7146676, 2.68204, 0, 0, 0, 1, 1,
2.469587, 1.401718, 1.684206, 0, 0, 0, 1, 1,
2.484415, 1.437197, 1.610301, 0, 0, 0, 1, 1,
2.516879, 1.447211, 0.0954558, 0, 0, 0, 1, 1,
2.55076, 0.6461924, 1.984771, 0, 0, 0, 1, 1,
2.566171, 2.188955, 0.06150949, 1, 1, 1, 1, 1,
2.58388, 0.3097376, 0.2871957, 1, 1, 1, 1, 1,
2.600476, 0.9556808, 1.558514, 1, 1, 1, 1, 1,
2.642489, -0.5260793, 3.506308, 1, 1, 1, 1, 1,
2.775071, -0.3778886, 2.149647, 1, 1, 1, 1, 1,
2.898085, 1.343549, 1.612099, 1, 1, 1, 1, 1,
3.09639, 0.6816766, 2.848592, 1, 1, 1, 1, 1
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
var radius = 10.00536;
var distance = 35.14339;
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
mvMatrix.translate( 0.1728868, -0.2642663, -0.04801488 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.14339);
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