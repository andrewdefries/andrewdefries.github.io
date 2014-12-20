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
-3.088852, 0.9973392, -1.190651, 1, 0, 0, 1,
-2.69682, 0.7013438, -0.6874434, 1, 0.007843138, 0, 1,
-2.595973, 0.3592468, -2.353468, 1, 0.01176471, 0, 1,
-2.564422, -0.847753, -1.19764, 1, 0.01960784, 0, 1,
-2.527809, 1.480224, -0.5013322, 1, 0.02352941, 0, 1,
-2.418841, -0.1634368, -2.596316, 1, 0.03137255, 0, 1,
-2.362133, 1.295385, -0.3998918, 1, 0.03529412, 0, 1,
-2.350355, -0.5091738, 0.1294688, 1, 0.04313726, 0, 1,
-2.307726, -1.819305, -1.768698, 1, 0.04705882, 0, 1,
-2.258116, -0.0394129, -0.1941155, 1, 0.05490196, 0, 1,
-2.243965, 0.4086906, -1.771374, 1, 0.05882353, 0, 1,
-2.191934, -0.170766, -1.76658, 1, 0.06666667, 0, 1,
-2.183056, -0.7994649, -0.1507845, 1, 0.07058824, 0, 1,
-2.117706, 0.3131352, -1.403713, 1, 0.07843138, 0, 1,
-2.109077, 1.156297, -0.9016764, 1, 0.08235294, 0, 1,
-2.107964, -0.0996737, -0.9790689, 1, 0.09019608, 0, 1,
-2.095419, -0.1144182, -2.137833, 1, 0.09411765, 0, 1,
-2.079693, -1.015717, -1.943131, 1, 0.1019608, 0, 1,
-2.053679, 1.373157, -0.9849908, 1, 0.1098039, 0, 1,
-2.019424, 0.7294964, -0.6431941, 1, 0.1137255, 0, 1,
-1.997169, 0.1640947, -1.486044, 1, 0.1215686, 0, 1,
-1.955048, 0.3200598, -1.112503, 1, 0.1254902, 0, 1,
-1.933355, -0.4439056, -0.7206483, 1, 0.1333333, 0, 1,
-1.912727, 1.136428, -2.220937, 1, 0.1372549, 0, 1,
-1.89718, 1.668658, -1.408069, 1, 0.145098, 0, 1,
-1.88285, 1.709861, -1.359618, 1, 0.1490196, 0, 1,
-1.881936, -1.343881, -2.61596, 1, 0.1568628, 0, 1,
-1.869624, -0.6618354, -1.335931, 1, 0.1607843, 0, 1,
-1.861687, 0.09786241, -2.03847, 1, 0.1686275, 0, 1,
-1.83286, 0.161031, -0.06128273, 1, 0.172549, 0, 1,
-1.816984, 0.3397479, -0.618457, 1, 0.1803922, 0, 1,
-1.774838, 0.680086, -1.554876, 1, 0.1843137, 0, 1,
-1.748275, 1.571981, -2.303497, 1, 0.1921569, 0, 1,
-1.743656, -0.023743, -1.976264, 1, 0.1960784, 0, 1,
-1.732059, 0.3082203, -0.3229629, 1, 0.2039216, 0, 1,
-1.707099, 1.778845, -1.693514, 1, 0.2117647, 0, 1,
-1.688455, 1.034937, -1.799973, 1, 0.2156863, 0, 1,
-1.664945, -2.119671, -1.619866, 1, 0.2235294, 0, 1,
-1.659645, -0.4275998, -2.93085, 1, 0.227451, 0, 1,
-1.649444, 0.5189025, -0.1904069, 1, 0.2352941, 0, 1,
-1.641366, -1.644864, -1.827015, 1, 0.2392157, 0, 1,
-1.62527, -0.3179493, -2.141371, 1, 0.2470588, 0, 1,
-1.618793, -0.2094794, -2.447341, 1, 0.2509804, 0, 1,
-1.615381, -0.5605916, -3.111921, 1, 0.2588235, 0, 1,
-1.613303, -0.4229613, -3.113474, 1, 0.2627451, 0, 1,
-1.604512, 0.5609174, -2.329314, 1, 0.2705882, 0, 1,
-1.586701, -1.241732, -2.053709, 1, 0.2745098, 0, 1,
-1.581571, 0.3526384, -0.4595577, 1, 0.282353, 0, 1,
-1.581066, 1.706086, -0.1141053, 1, 0.2862745, 0, 1,
-1.551117, -1.336043, -0.9170331, 1, 0.2941177, 0, 1,
-1.550246, 1.517962, 1.401697, 1, 0.3019608, 0, 1,
-1.542499, 0.6320813, -2.299633, 1, 0.3058824, 0, 1,
-1.539708, 0.05307126, -1.685794, 1, 0.3137255, 0, 1,
-1.534207, 1.725485, 0.2026719, 1, 0.3176471, 0, 1,
-1.517397, -0.2018222, -1.07506, 1, 0.3254902, 0, 1,
-1.51265, -0.6083971, -1.121015, 1, 0.3294118, 0, 1,
-1.494216, -0.2599513, -1.931041, 1, 0.3372549, 0, 1,
-1.485651, 0.5472432, 1.369969, 1, 0.3411765, 0, 1,
-1.476842, 0.9764969, -0.7231888, 1, 0.3490196, 0, 1,
-1.463457, 1.373514, -0.07529297, 1, 0.3529412, 0, 1,
-1.459822, -0.6329682, -1.024658, 1, 0.3607843, 0, 1,
-1.457708, -1.490576, -4.370849, 1, 0.3647059, 0, 1,
-1.455611, 0.5376863, -2.285842, 1, 0.372549, 0, 1,
-1.449561, -0.4705014, -3.070015, 1, 0.3764706, 0, 1,
-1.427968, 1.224436, 1.222656, 1, 0.3843137, 0, 1,
-1.425481, -1.399245, -2.486856, 1, 0.3882353, 0, 1,
-1.424394, -0.5849659, -3.212338, 1, 0.3960784, 0, 1,
-1.418531, -0.00704479, -1.294676, 1, 0.4039216, 0, 1,
-1.415885, 0.456548, -2.8874, 1, 0.4078431, 0, 1,
-1.415517, 1.152068, 0.09544994, 1, 0.4156863, 0, 1,
-1.414482, 0.5752379, 1.320562, 1, 0.4196078, 0, 1,
-1.409899, -0.042, -2.660617, 1, 0.427451, 0, 1,
-1.406637, -0.3461678, -1.865734, 1, 0.4313726, 0, 1,
-1.403572, -1.311181, -2.793222, 1, 0.4392157, 0, 1,
-1.386719, 0.2122893, -2.09896, 1, 0.4431373, 0, 1,
-1.386242, 1.57848, 0.4625794, 1, 0.4509804, 0, 1,
-1.341694, -1.216481, -1.836143, 1, 0.454902, 0, 1,
-1.33137, 0.371166, -2.78313, 1, 0.4627451, 0, 1,
-1.327953, 0.1245544, -1.584344, 1, 0.4666667, 0, 1,
-1.318019, 1.320703, 0.254546, 1, 0.4745098, 0, 1,
-1.316945, -0.125147, -0.1008085, 1, 0.4784314, 0, 1,
-1.312965, -0.4141266, -2.069381, 1, 0.4862745, 0, 1,
-1.310065, -0.1051193, -3.317927, 1, 0.4901961, 0, 1,
-1.299981, -1.500705, -3.800101, 1, 0.4980392, 0, 1,
-1.286258, -0.9000539, -1.301737, 1, 0.5058824, 0, 1,
-1.278813, -0.06208578, 0.1519527, 1, 0.509804, 0, 1,
-1.270586, 0.1298428, -3.060608, 1, 0.5176471, 0, 1,
-1.262841, -0.4225411, -3.791179, 1, 0.5215687, 0, 1,
-1.24184, 0.1599885, -1.317813, 1, 0.5294118, 0, 1,
-1.241349, 0.1365662, -0.3770474, 1, 0.5333334, 0, 1,
-1.229852, -0.6277727, -4.424303, 1, 0.5411765, 0, 1,
-1.223979, 1.289845, 0.016291, 1, 0.5450981, 0, 1,
-1.210501, -0.1318785, -1.663672, 1, 0.5529412, 0, 1,
-1.201423, 1.096854, -2.268862, 1, 0.5568628, 0, 1,
-1.199888, -0.9023781, -2.466707, 1, 0.5647059, 0, 1,
-1.199871, -0.02311471, -1.789953, 1, 0.5686275, 0, 1,
-1.195271, 0.003427577, -1.743155, 1, 0.5764706, 0, 1,
-1.192688, -0.01773006, -2.420265, 1, 0.5803922, 0, 1,
-1.186984, -2.081471, -1.124221, 1, 0.5882353, 0, 1,
-1.18112, -0.7758024, -0.5247092, 1, 0.5921569, 0, 1,
-1.174557, 0.04322667, -0.4598834, 1, 0.6, 0, 1,
-1.172228, 0.2437311, -1.573285, 1, 0.6078432, 0, 1,
-1.166976, 0.7624217, -2.375783, 1, 0.6117647, 0, 1,
-1.158994, 1.139551, -2.557178, 1, 0.6196079, 0, 1,
-1.158736, 1.43888, -0.2950323, 1, 0.6235294, 0, 1,
-1.154629, 0.5174248, -0.1821329, 1, 0.6313726, 0, 1,
-1.150599, -1.097192, -2.681643, 1, 0.6352941, 0, 1,
-1.147831, 1.122674, -2.897544, 1, 0.6431373, 0, 1,
-1.147272, -0.09404086, -1.524467, 1, 0.6470588, 0, 1,
-1.146488, 0.752767, -0.06171542, 1, 0.654902, 0, 1,
-1.143926, -0.9067532, -4.325424, 1, 0.6588235, 0, 1,
-1.130577, 0.0854144, -2.924076, 1, 0.6666667, 0, 1,
-1.128861, -0.2071552, -0.3373134, 1, 0.6705883, 0, 1,
-1.124837, 0.5123222, -1.742653, 1, 0.6784314, 0, 1,
-1.123872, -0.8767213, -1.395933, 1, 0.682353, 0, 1,
-1.121546, 0.8354399, -0.1176302, 1, 0.6901961, 0, 1,
-1.118328, -0.5006548, -2.537123, 1, 0.6941177, 0, 1,
-1.111555, -0.9148746, -1.447309, 1, 0.7019608, 0, 1,
-1.101555, 0.7290992, 0.3412687, 1, 0.7098039, 0, 1,
-1.099921, 0.269439, -0.6083721, 1, 0.7137255, 0, 1,
-1.098716, 1.400555, -1.962587, 1, 0.7215686, 0, 1,
-1.09233, 1.348471, 1.680466, 1, 0.7254902, 0, 1,
-1.089774, 0.4590001, -1.509532, 1, 0.7333333, 0, 1,
-1.089132, 0.242292, -0.4252028, 1, 0.7372549, 0, 1,
-1.083653, 0.192036, -2.39567, 1, 0.7450981, 0, 1,
-1.082654, 0.02465876, -2.515304, 1, 0.7490196, 0, 1,
-1.080191, 1.51953, -1.150491, 1, 0.7568628, 0, 1,
-1.075633, 1.888743, -1.367588, 1, 0.7607843, 0, 1,
-1.072672, 0.4882515, -0.8479981, 1, 0.7686275, 0, 1,
-1.070402, 1.386427, 0.06319303, 1, 0.772549, 0, 1,
-1.069776, -1.372227, -1.291342, 1, 0.7803922, 0, 1,
-1.063609, 1.337426, -0.561668, 1, 0.7843137, 0, 1,
-1.060951, 0.2074876, -0.6751653, 1, 0.7921569, 0, 1,
-1.057999, -2.055307, -3.372462, 1, 0.7960784, 0, 1,
-1.05353, 0.9822232, -0.3377968, 1, 0.8039216, 0, 1,
-1.04215, -0.1651155, -1.209794, 1, 0.8117647, 0, 1,
-1.031375, -0.5409847, -0.4579706, 1, 0.8156863, 0, 1,
-1.023313, 0.6656136, 0.07305314, 1, 0.8235294, 0, 1,
-1.020981, -0.08278921, -2.94047, 1, 0.827451, 0, 1,
-1.018715, -0.2077517, -2.146538, 1, 0.8352941, 0, 1,
-0.9951335, -0.9378509, -2.622633, 1, 0.8392157, 0, 1,
-0.9907418, -1.070727, -2.908218, 1, 0.8470588, 0, 1,
-0.9773425, 0.6133732, -2.077051, 1, 0.8509804, 0, 1,
-0.9758864, 0.4772062, -1.251206, 1, 0.8588235, 0, 1,
-0.9749814, -0.07739455, -2.391883, 1, 0.8627451, 0, 1,
-0.9722559, 1.632738, -1.232494, 1, 0.8705882, 0, 1,
-0.967496, 0.9660932, -0.4850211, 1, 0.8745098, 0, 1,
-0.9669592, 0.2678962, -1.641118, 1, 0.8823529, 0, 1,
-0.9630142, 1.358144, -3.029301, 1, 0.8862745, 0, 1,
-0.9604084, 0.5962444, 0.2945854, 1, 0.8941177, 0, 1,
-0.9500633, 0.1948198, -0.06377532, 1, 0.8980392, 0, 1,
-0.9423489, -1.122835, -2.113981, 1, 0.9058824, 0, 1,
-0.9406897, 1.412597, -1.739165, 1, 0.9137255, 0, 1,
-0.9373325, -0.7300768, -2.915687, 1, 0.9176471, 0, 1,
-0.9340916, 1.88793, 0.1313398, 1, 0.9254902, 0, 1,
-0.9313625, 1.314281, 0.7804223, 1, 0.9294118, 0, 1,
-0.9243467, 0.293431, -1.818931, 1, 0.9372549, 0, 1,
-0.920311, 0.3954466, -0.1607706, 1, 0.9411765, 0, 1,
-0.9152456, -0.1666514, -2.033503, 1, 0.9490196, 0, 1,
-0.9134418, 0.3100134, -1.964995, 1, 0.9529412, 0, 1,
-0.9095321, -0.07864408, -2.073773, 1, 0.9607843, 0, 1,
-0.9055373, 1.12949, -4.406322, 1, 0.9647059, 0, 1,
-0.9054241, -0.3915451, 0.1096651, 1, 0.972549, 0, 1,
-0.8973835, -0.2583645, -1.657945, 1, 0.9764706, 0, 1,
-0.8880934, -0.2646182, -1.036577, 1, 0.9843137, 0, 1,
-0.8859817, -0.458914, -1.221882, 1, 0.9882353, 0, 1,
-0.885181, 0.9052289, -1.00871, 1, 0.9960784, 0, 1,
-0.8802447, 0.1281151, -3.007216, 0.9960784, 1, 0, 1,
-0.872625, 0.2183565, -0.3087748, 0.9921569, 1, 0, 1,
-0.8725233, -0.4832256, -2.179693, 0.9843137, 1, 0, 1,
-0.8718745, 0.1102707, -1.411168, 0.9803922, 1, 0, 1,
-0.8698915, 1.016561, -0.1607175, 0.972549, 1, 0, 1,
-0.8698134, 0.09041959, -0.6784195, 0.9686275, 1, 0, 1,
-0.8683203, 0.06726437, -1.46014, 0.9607843, 1, 0, 1,
-0.8633352, 1.377783, -0.2360529, 0.9568627, 1, 0, 1,
-0.8580925, -1.274041, -3.294551, 0.9490196, 1, 0, 1,
-0.8579923, -1.284528, -1.898259, 0.945098, 1, 0, 1,
-0.8575099, 0.02951301, -1.507, 0.9372549, 1, 0, 1,
-0.8476691, -0.2838902, 0.1507367, 0.9333333, 1, 0, 1,
-0.8469095, 0.4413401, -2.252915, 0.9254902, 1, 0, 1,
-0.838151, 0.5908428, -0.5043476, 0.9215686, 1, 0, 1,
-0.8353379, -0.5093353, -1.707308, 0.9137255, 1, 0, 1,
-0.833368, -1.166469, -1.549625, 0.9098039, 1, 0, 1,
-0.8307061, -1.388388, -4.780288, 0.9019608, 1, 0, 1,
-0.8266192, 0.06374442, -1.824299, 0.8941177, 1, 0, 1,
-0.8231069, -0.412027, -2.889647, 0.8901961, 1, 0, 1,
-0.8188718, -0.3629473, -2.301597, 0.8823529, 1, 0, 1,
-0.8176422, 0.5541754, -1.251324, 0.8784314, 1, 0, 1,
-0.8164232, -0.1557643, -1.375482, 0.8705882, 1, 0, 1,
-0.8144648, 0.6798477, 0.3208005, 0.8666667, 1, 0, 1,
-0.8117779, 0.09797362, 0.2645666, 0.8588235, 1, 0, 1,
-0.8100765, 1.719181, 1.064614, 0.854902, 1, 0, 1,
-0.8087102, 0.455258, -1.235701, 0.8470588, 1, 0, 1,
-0.8062088, -0.3118035, -2.06833, 0.8431373, 1, 0, 1,
-0.8051357, 1.416258, 0.09652375, 0.8352941, 1, 0, 1,
-0.8027089, -0.315661, -0.3874536, 0.8313726, 1, 0, 1,
-0.7989493, -0.4398447, -1.170053, 0.8235294, 1, 0, 1,
-0.793568, -1.006576, -0.4817515, 0.8196079, 1, 0, 1,
-0.7895486, 0.2681476, -1.45124, 0.8117647, 1, 0, 1,
-0.7852471, 0.03506184, -1.388618, 0.8078431, 1, 0, 1,
-0.7842453, -2.321779, -3.835734, 0.8, 1, 0, 1,
-0.777533, -1.266066, -3.231157, 0.7921569, 1, 0, 1,
-0.7754791, 0.1730931, -2.220788, 0.7882353, 1, 0, 1,
-0.7736299, 0.1343017, -0.6947379, 0.7803922, 1, 0, 1,
-0.7714209, -0.05435275, -0.4993117, 0.7764706, 1, 0, 1,
-0.7713472, -1.139359, -3.510681, 0.7686275, 1, 0, 1,
-0.7712977, 0.3428777, -0.2738821, 0.7647059, 1, 0, 1,
-0.7698562, -0.259065, -3.699024, 0.7568628, 1, 0, 1,
-0.7684069, -0.6770884, -2.518552, 0.7529412, 1, 0, 1,
-0.7641819, -0.4194691, -1.103925, 0.7450981, 1, 0, 1,
-0.7620703, 0.2126825, -0.9833925, 0.7411765, 1, 0, 1,
-0.7597476, -0.4162979, -3.188407, 0.7333333, 1, 0, 1,
-0.759233, -0.3039238, -1.401532, 0.7294118, 1, 0, 1,
-0.7534753, 0.6663277, 1.250074, 0.7215686, 1, 0, 1,
-0.7524663, -0.005794652, -2.222848, 0.7176471, 1, 0, 1,
-0.7468318, -0.1388115, -2.037485, 0.7098039, 1, 0, 1,
-0.7459969, 0.2145628, -2.393854, 0.7058824, 1, 0, 1,
-0.7405796, 0.02240401, -1.978464, 0.6980392, 1, 0, 1,
-0.7280936, 1.037597, -1.181149, 0.6901961, 1, 0, 1,
-0.7265571, 1.32329, -0.7851235, 0.6862745, 1, 0, 1,
-0.7196203, 0.4811907, -1.467738, 0.6784314, 1, 0, 1,
-0.7193256, -0.86718, -1.373629, 0.6745098, 1, 0, 1,
-0.7172023, 1.309718, 0.9439129, 0.6666667, 1, 0, 1,
-0.71417, 1.613625, -0.3594685, 0.6627451, 1, 0, 1,
-0.7141114, -0.8319299, -3.299273, 0.654902, 1, 0, 1,
-0.708397, -0.7249151, -3.071498, 0.6509804, 1, 0, 1,
-0.7054802, -1.211682, -3.324898, 0.6431373, 1, 0, 1,
-0.7052101, -0.1062375, -1.112198, 0.6392157, 1, 0, 1,
-0.6995336, -0.800887, -2.946791, 0.6313726, 1, 0, 1,
-0.6994708, 0.4201303, -0.3081042, 0.627451, 1, 0, 1,
-0.699456, -1.506081, -1.583657, 0.6196079, 1, 0, 1,
-0.6992533, 1.214473, -1.171978, 0.6156863, 1, 0, 1,
-0.6979815, 2.003329, 0.01284886, 0.6078432, 1, 0, 1,
-0.6975859, 0.7129307, -1.027426, 0.6039216, 1, 0, 1,
-0.6963446, -1.33216, -3.038335, 0.5960785, 1, 0, 1,
-0.690244, -1.389096, -2.387135, 0.5882353, 1, 0, 1,
-0.6893955, -0.8052841, -1.181176, 0.5843138, 1, 0, 1,
-0.6866944, -1.051238, -1.717789, 0.5764706, 1, 0, 1,
-0.6861866, -0.7059711, -0.06762222, 0.572549, 1, 0, 1,
-0.6833838, 0.5801342, -1.056994, 0.5647059, 1, 0, 1,
-0.680803, -0.4562634, -2.48922, 0.5607843, 1, 0, 1,
-0.6805434, 0.05874097, -2.847986, 0.5529412, 1, 0, 1,
-0.6753192, 0.7568865, 0.6080118, 0.5490196, 1, 0, 1,
-0.673548, -0.8297017, -3.747542, 0.5411765, 1, 0, 1,
-0.6729414, -0.4324031, -3.241846, 0.5372549, 1, 0, 1,
-0.6695107, 0.28688, -1.08315, 0.5294118, 1, 0, 1,
-0.6690627, 1.278958, -0.5920085, 0.5254902, 1, 0, 1,
-0.6590491, -0.7339219, -2.028431, 0.5176471, 1, 0, 1,
-0.6483845, -3.407747, -3.753669, 0.5137255, 1, 0, 1,
-0.637499, 0.4849287, -0.7244365, 0.5058824, 1, 0, 1,
-0.6351859, -0.3720054, -1.207012, 0.5019608, 1, 0, 1,
-0.6314081, 1.512952, -1.377021, 0.4941176, 1, 0, 1,
-0.6283988, -0.6623819, -4.054985, 0.4862745, 1, 0, 1,
-0.6260194, -1.415298, -2.3882, 0.4823529, 1, 0, 1,
-0.6252332, 0.3027275, -2.913974, 0.4745098, 1, 0, 1,
-0.6249959, 1.043941, -0.1786007, 0.4705882, 1, 0, 1,
-0.6181754, -1.680439, -1.396377, 0.4627451, 1, 0, 1,
-0.6181312, -0.8451034, -1.970855, 0.4588235, 1, 0, 1,
-0.6179791, 2.554739, -2.088823, 0.4509804, 1, 0, 1,
-0.6160393, 1.303165, -1.599358, 0.4470588, 1, 0, 1,
-0.6136454, -0.2947156, -3.872027, 0.4392157, 1, 0, 1,
-0.6067859, 1.49168, -0.09830156, 0.4352941, 1, 0, 1,
-0.6041756, 0.4830214, -0.9060606, 0.427451, 1, 0, 1,
-0.5991207, 1.467829, -0.7614375, 0.4235294, 1, 0, 1,
-0.5831095, 2.205103, -0.6501074, 0.4156863, 1, 0, 1,
-0.5828383, 0.7956249, -1.209124, 0.4117647, 1, 0, 1,
-0.5824495, 1.210457, -0.9676201, 0.4039216, 1, 0, 1,
-0.5761979, 1.261767, 1.176346, 0.3960784, 1, 0, 1,
-0.5717531, 0.7648993, -0.5842503, 0.3921569, 1, 0, 1,
-0.568676, 1.402392, -1.379748, 0.3843137, 1, 0, 1,
-0.5680354, -0.5254745, -2.243587, 0.3803922, 1, 0, 1,
-0.5658575, 1.401402, -0.6292466, 0.372549, 1, 0, 1,
-0.5631641, -0.8285006, -3.989182, 0.3686275, 1, 0, 1,
-0.5623169, -1.221398, -2.447543, 0.3607843, 1, 0, 1,
-0.5596555, -0.4195436, -2.225426, 0.3568628, 1, 0, 1,
-0.554508, -1.078547, -1.806676, 0.3490196, 1, 0, 1,
-0.5472001, 1.155525, 0.08054492, 0.345098, 1, 0, 1,
-0.5427437, 0.4605486, -0.8426607, 0.3372549, 1, 0, 1,
-0.5426438, -0.5791988, -1.947755, 0.3333333, 1, 0, 1,
-0.5421331, 1.710913, 0.4255801, 0.3254902, 1, 0, 1,
-0.5420666, -1.317273, -3.552479, 0.3215686, 1, 0, 1,
-0.5390495, 0.6476021, 0.3694797, 0.3137255, 1, 0, 1,
-0.5368867, 0.5728518, -0.06278267, 0.3098039, 1, 0, 1,
-0.53598, -0.3553922, -1.21964, 0.3019608, 1, 0, 1,
-0.5319499, 0.9512928, -0.3723382, 0.2941177, 1, 0, 1,
-0.5314535, 1.433461, -0.1191464, 0.2901961, 1, 0, 1,
-0.5266841, 0.4064248, -1.148187, 0.282353, 1, 0, 1,
-0.5252848, 0.7226179, 0.4693193, 0.2784314, 1, 0, 1,
-0.5241784, -0.4657051, -2.264811, 0.2705882, 1, 0, 1,
-0.5228022, 0.6129425, -2.473385, 0.2666667, 1, 0, 1,
-0.5216089, 0.2090789, 1.142486, 0.2588235, 1, 0, 1,
-0.5200728, -0.002613918, 0.1608918, 0.254902, 1, 0, 1,
-0.5195726, 1.177405, -2.407785, 0.2470588, 1, 0, 1,
-0.5110964, 0.7457379, 0.4918601, 0.2431373, 1, 0, 1,
-0.5050487, -0.7954437, -1.652576, 0.2352941, 1, 0, 1,
-0.504685, 1.270344, 0.6310642, 0.2313726, 1, 0, 1,
-0.5044839, -0.6664824, -3.701831, 0.2235294, 1, 0, 1,
-0.5038704, 0.7265959, -0.1184734, 0.2196078, 1, 0, 1,
-0.5033075, -0.5578545, -4.591329, 0.2117647, 1, 0, 1,
-0.496318, 0.4496888, 1.535587, 0.2078431, 1, 0, 1,
-0.4953445, -0.4641483, -0.7481751, 0.2, 1, 0, 1,
-0.4928339, -1.056099, -3.326133, 0.1921569, 1, 0, 1,
-0.4899862, -0.01215171, -1.338545, 0.1882353, 1, 0, 1,
-0.4868903, 1.248914, 1.771577, 0.1803922, 1, 0, 1,
-0.4868896, -0.3735185, -2.809953, 0.1764706, 1, 0, 1,
-0.4859744, 0.4701397, -1.110949, 0.1686275, 1, 0, 1,
-0.4850837, -1.311829, -2.553185, 0.1647059, 1, 0, 1,
-0.4816367, -0.4363808, -2.650859, 0.1568628, 1, 0, 1,
-0.4778576, -0.3502334, -1.125119, 0.1529412, 1, 0, 1,
-0.4736623, 0.9737437, -0.4574378, 0.145098, 1, 0, 1,
-0.4728138, 1.376802, -1.609657, 0.1411765, 1, 0, 1,
-0.470768, 0.4201361, -2.218946, 0.1333333, 1, 0, 1,
-0.469404, 0.5345833, -1.503801, 0.1294118, 1, 0, 1,
-0.4671578, -1.40739, -2.201615, 0.1215686, 1, 0, 1,
-0.4589001, 1.098839, -0.1422029, 0.1176471, 1, 0, 1,
-0.4580388, 0.3858928, -0.9211725, 0.1098039, 1, 0, 1,
-0.4573805, -0.5442919, -2.198526, 0.1058824, 1, 0, 1,
-0.4567563, -0.08749858, -2.718042, 0.09803922, 1, 0, 1,
-0.4558324, -1.055614, -1.907771, 0.09019608, 1, 0, 1,
-0.4512528, -0.110667, -2.721438, 0.08627451, 1, 0, 1,
-0.4501563, -1.172908, -1.88755, 0.07843138, 1, 0, 1,
-0.4500004, 0.3094723, -1.671486, 0.07450981, 1, 0, 1,
-0.4490762, 0.7717748, -1.778544, 0.06666667, 1, 0, 1,
-0.4420059, 0.7355824, -1.114952, 0.0627451, 1, 0, 1,
-0.4399456, 0.2383815, -1.426047, 0.05490196, 1, 0, 1,
-0.4362385, -0.08967516, -0.4223803, 0.05098039, 1, 0, 1,
-0.4317302, 0.7256904, -1.504391, 0.04313726, 1, 0, 1,
-0.4300515, 1.122928, 0.3922043, 0.03921569, 1, 0, 1,
-0.4295299, -0.1829008, -2.239687, 0.03137255, 1, 0, 1,
-0.4290302, -1.146796, -1.96694, 0.02745098, 1, 0, 1,
-0.4280693, -2.358414, -3.862345, 0.01960784, 1, 0, 1,
-0.4275967, -0.3499549, -0.8474199, 0.01568628, 1, 0, 1,
-0.4222677, -1.024405, -2.110229, 0.007843138, 1, 0, 1,
-0.4177415, -1.222173, -3.073078, 0.003921569, 1, 0, 1,
-0.4161652, -1.406336, -3.790274, 0, 1, 0.003921569, 1,
-0.4146971, 0.5148986, 0.2890058, 0, 1, 0.01176471, 1,
-0.413601, 1.264265, -1.192303, 0, 1, 0.01568628, 1,
-0.410911, 0.6028391, -1.259063, 0, 1, 0.02352941, 1,
-0.4106146, -0.1086269, -1.913624, 0, 1, 0.02745098, 1,
-0.4084025, 1.251326, 0.2843525, 0, 1, 0.03529412, 1,
-0.4045528, 0.9166775, 0.6525567, 0, 1, 0.03921569, 1,
-0.4001542, 2.371777, 0.6751981, 0, 1, 0.04705882, 1,
-0.3968867, 0.3290814, -1.184065, 0, 1, 0.05098039, 1,
-0.3958011, -0.8421795, -1.74108, 0, 1, 0.05882353, 1,
-0.3878415, -1.634676, -4.108469, 0, 1, 0.0627451, 1,
-0.3870812, -0.8391696, -3.035545, 0, 1, 0.07058824, 1,
-0.3867112, 0.4373737, -0.6575869, 0, 1, 0.07450981, 1,
-0.3850955, 0.8092762, 0.4517991, 0, 1, 0.08235294, 1,
-0.3791716, 0.4678189, -1.220701, 0, 1, 0.08627451, 1,
-0.3755146, -0.01766148, -2.238457, 0, 1, 0.09411765, 1,
-0.3695188, -2.03035, -0.7000067, 0, 1, 0.1019608, 1,
-0.3662562, -0.2795714, -1.363036, 0, 1, 0.1058824, 1,
-0.3653664, -0.035053, -2.115516, 0, 1, 0.1137255, 1,
-0.3592249, -0.5958339, -3.518075, 0, 1, 0.1176471, 1,
-0.3547682, 1.242274, 0.1648273, 0, 1, 0.1254902, 1,
-0.3481089, -1.000628, -2.230307, 0, 1, 0.1294118, 1,
-0.347212, -0.1065759, -1.201222, 0, 1, 0.1372549, 1,
-0.3462799, -0.664714, -2.435918, 0, 1, 0.1411765, 1,
-0.3459426, -0.2621958, -2.855131, 0, 1, 0.1490196, 1,
-0.3446751, 0.4839996, 0.219173, 0, 1, 0.1529412, 1,
-0.3441176, 0.97989, -0.02891054, 0, 1, 0.1607843, 1,
-0.3438657, 0.5742499, 0.8696916, 0, 1, 0.1647059, 1,
-0.3399151, -0.2497193, -2.615081, 0, 1, 0.172549, 1,
-0.3305756, -0.8542241, -2.808788, 0, 1, 0.1764706, 1,
-0.3277554, -0.5159677, -1.58077, 0, 1, 0.1843137, 1,
-0.3252202, -0.7280557, -2.800468, 0, 1, 0.1882353, 1,
-0.3225946, -0.2112503, -2.091156, 0, 1, 0.1960784, 1,
-0.3222317, -0.7218705, -4.22074, 0, 1, 0.2039216, 1,
-0.3168073, 1.066807, 0.01750445, 0, 1, 0.2078431, 1,
-0.316494, -2.096285, -3.484711, 0, 1, 0.2156863, 1,
-0.3120494, -1.854776, -3.111269, 0, 1, 0.2196078, 1,
-0.3082853, 0.1814685, -2.037873, 0, 1, 0.227451, 1,
-0.3081184, 0.7751432, -0.8561264, 0, 1, 0.2313726, 1,
-0.3053331, 1.735278, 1.824167, 0, 1, 0.2392157, 1,
-0.3044441, 0.003596285, -2.115697, 0, 1, 0.2431373, 1,
-0.3040173, 1.513058, 1.178482, 0, 1, 0.2509804, 1,
-0.3020608, 0.09051239, -0.9373379, 0, 1, 0.254902, 1,
-0.2988224, -0.883404, -3.884987, 0, 1, 0.2627451, 1,
-0.293575, 1.226305, 0.7091932, 0, 1, 0.2666667, 1,
-0.2930719, 1.336293, -1.528951, 0, 1, 0.2745098, 1,
-0.289891, 0.4417524, -1.054093, 0, 1, 0.2784314, 1,
-0.288473, -1.383222, -3.800697, 0, 1, 0.2862745, 1,
-0.2818578, -0.684056, -3.800497, 0, 1, 0.2901961, 1,
-0.2809809, 0.1312381, -1.458103, 0, 1, 0.2980392, 1,
-0.2803652, -0.4388261, -2.551858, 0, 1, 0.3058824, 1,
-0.2793601, 1.694613, -1.433629, 0, 1, 0.3098039, 1,
-0.2789111, 0.748385, -0.4482908, 0, 1, 0.3176471, 1,
-0.2788981, -0.7563855, -3.797756, 0, 1, 0.3215686, 1,
-0.2680961, 0.489038, -0.543785, 0, 1, 0.3294118, 1,
-0.2668439, 0.9202706, -2.729626, 0, 1, 0.3333333, 1,
-0.2652331, -0.1069644, -1.539599, 0, 1, 0.3411765, 1,
-0.2651135, -0.05011358, -0.5819281, 0, 1, 0.345098, 1,
-0.2646686, 0.5901659, -0.2223097, 0, 1, 0.3529412, 1,
-0.2633848, -0.03802416, -2.537534, 0, 1, 0.3568628, 1,
-0.2609708, 0.00398106, -3.24808, 0, 1, 0.3647059, 1,
-0.2598373, -0.8943724, -2.420451, 0, 1, 0.3686275, 1,
-0.2583944, 0.0898988, 0.6099489, 0, 1, 0.3764706, 1,
-0.2534045, -1.02176, -3.752456, 0, 1, 0.3803922, 1,
-0.252139, -0.3955591, -2.972484, 0, 1, 0.3882353, 1,
-0.24842, 1.111015, -0.3306725, 0, 1, 0.3921569, 1,
-0.2460963, -1.253487, -2.325334, 0, 1, 0.4, 1,
-0.2431075, -1.283835, -1.433563, 0, 1, 0.4078431, 1,
-0.240737, 0.3013822, -1.276582, 0, 1, 0.4117647, 1,
-0.2393095, 1.023221, 0.6564731, 0, 1, 0.4196078, 1,
-0.2327635, 0.02656434, -1.376143, 0, 1, 0.4235294, 1,
-0.2324449, -0.7458042, -3.544838, 0, 1, 0.4313726, 1,
-0.2318096, -0.3445955, -3.514434, 0, 1, 0.4352941, 1,
-0.2314806, -0.1911168, -2.60774, 0, 1, 0.4431373, 1,
-0.2264876, -0.180084, -3.927043, 0, 1, 0.4470588, 1,
-0.2258955, 0.9676362, 0.8134952, 0, 1, 0.454902, 1,
-0.2253175, -0.4451005, -3.143291, 0, 1, 0.4588235, 1,
-0.2199318, 1.291539, -0.2113829, 0, 1, 0.4666667, 1,
-0.2199052, -0.4636896, -1.489108, 0, 1, 0.4705882, 1,
-0.2198956, 1.948105, 0.841334, 0, 1, 0.4784314, 1,
-0.2166734, -0.6292548, -2.067975, 0, 1, 0.4823529, 1,
-0.2165841, 1.957065, 0.5673529, 0, 1, 0.4901961, 1,
-0.2128216, -0.01917288, -1.957104, 0, 1, 0.4941176, 1,
-0.2124648, 0.2193881, 0.9506666, 0, 1, 0.5019608, 1,
-0.2115187, -0.003705451, -0.05072608, 0, 1, 0.509804, 1,
-0.2072062, -0.1826975, -2.014048, 0, 1, 0.5137255, 1,
-0.2036708, -0.366431, -2.900795, 0, 1, 0.5215687, 1,
-0.1996045, -0.2427682, -1.300543, 0, 1, 0.5254902, 1,
-0.1991168, -0.5877236, -4.116752, 0, 1, 0.5333334, 1,
-0.1942412, 0.7223264, 1.479362, 0, 1, 0.5372549, 1,
-0.1897752, 0.5335715, -0.2393065, 0, 1, 0.5450981, 1,
-0.1862341, -1.487901, -2.355708, 0, 1, 0.5490196, 1,
-0.1848799, -0.5111238, -2.577681, 0, 1, 0.5568628, 1,
-0.1836194, 1.400572, 0.5586342, 0, 1, 0.5607843, 1,
-0.1814977, -0.4675191, -4.63973, 0, 1, 0.5686275, 1,
-0.1794718, -1.00827, -4.526617, 0, 1, 0.572549, 1,
-0.1777235, -0.2049174, -2.363057, 0, 1, 0.5803922, 1,
-0.1760466, 0.1655318, -2.707059, 0, 1, 0.5843138, 1,
-0.1743435, 1.970811, 0.2299569, 0, 1, 0.5921569, 1,
-0.1725499, 0.6248544, 0.4780287, 0, 1, 0.5960785, 1,
-0.1713392, -1.642219, -3.455457, 0, 1, 0.6039216, 1,
-0.1669045, -0.9432039, -3.213474, 0, 1, 0.6117647, 1,
-0.1652826, -0.6979423, -0.9414783, 0, 1, 0.6156863, 1,
-0.163347, 0.1145138, -1.023563, 0, 1, 0.6235294, 1,
-0.1611349, 1.080037, -0.3498, 0, 1, 0.627451, 1,
-0.1591551, -0.8678043, -2.873412, 0, 1, 0.6352941, 1,
-0.1522924, -0.7474619, -2.395519, 0, 1, 0.6392157, 1,
-0.1419099, 0.3458426, -1.546003, 0, 1, 0.6470588, 1,
-0.1402597, -0.3016523, -2.397471, 0, 1, 0.6509804, 1,
-0.135959, -0.4290178, -1.100751, 0, 1, 0.6588235, 1,
-0.1343516, 0.3467532, -0.2452647, 0, 1, 0.6627451, 1,
-0.1323787, 1.544377, -0.7138705, 0, 1, 0.6705883, 1,
-0.1320256, -1.082019, -3.956164, 0, 1, 0.6745098, 1,
-0.1298744, -0.3611983, -2.775838, 0, 1, 0.682353, 1,
-0.1286392, 0.7428281, 0.358447, 0, 1, 0.6862745, 1,
-0.127579, 0.7427753, -0.09375657, 0, 1, 0.6941177, 1,
-0.1250521, 0.2993054, -1.06283, 0, 1, 0.7019608, 1,
-0.1246799, 2.23167, 0.5477942, 0, 1, 0.7058824, 1,
-0.1239723, 0.7725117, 1.404538, 0, 1, 0.7137255, 1,
-0.1230529, 1.38657, 0.0117285, 0, 1, 0.7176471, 1,
-0.1224197, -1.222342, -3.243599, 0, 1, 0.7254902, 1,
-0.1196037, -0.4011573, -3.164125, 0, 1, 0.7294118, 1,
-0.1185156, -0.1282143, -3.294186, 0, 1, 0.7372549, 1,
-0.1169722, -0.7829562, -2.864643, 0, 1, 0.7411765, 1,
-0.1132426, 0.006975751, -2.235904, 0, 1, 0.7490196, 1,
-0.1117459, 0.2854319, -0.1438269, 0, 1, 0.7529412, 1,
-0.1116752, -0.1740398, -2.471119, 0, 1, 0.7607843, 1,
-0.1106196, -0.8592755, -3.146958, 0, 1, 0.7647059, 1,
-0.1104978, -2.360632, -4.363379, 0, 1, 0.772549, 1,
-0.1032118, 0.3983132, -0.3081995, 0, 1, 0.7764706, 1,
-0.100104, -1.20876, -2.962381, 0, 1, 0.7843137, 1,
-0.09828182, -1.512124, -2.010553, 0, 1, 0.7882353, 1,
-0.09813949, 0.6156456, -0.6538838, 0, 1, 0.7960784, 1,
-0.09799522, 0.6812373, 0.2960488, 0, 1, 0.8039216, 1,
-0.09785397, 0.6820704, -1.283208, 0, 1, 0.8078431, 1,
-0.097231, 1.29989, 0.05136937, 0, 1, 0.8156863, 1,
-0.09218359, -0.4537577, -2.317391, 0, 1, 0.8196079, 1,
-0.08174742, 0.3382702, -1.353939, 0, 1, 0.827451, 1,
-0.07773453, 0.9651642, 0.06532744, 0, 1, 0.8313726, 1,
-0.07202023, 0.1534762, -0.4627452, 0, 1, 0.8392157, 1,
-0.07093773, 1.438916, 0.7101141, 0, 1, 0.8431373, 1,
-0.06820928, 0.04430513, -0.2042868, 0, 1, 0.8509804, 1,
-0.0670902, -1.158987, -3.333008, 0, 1, 0.854902, 1,
-0.06700093, 1.852551, 0.8045189, 0, 1, 0.8627451, 1,
-0.06472833, -1.090559, -3.064851, 0, 1, 0.8666667, 1,
-0.06231346, 0.298911, -0.1429842, 0, 1, 0.8745098, 1,
-0.06091269, 0.7878913, 0.7483181, 0, 1, 0.8784314, 1,
-0.06058668, 0.3250044, 1.066303, 0, 1, 0.8862745, 1,
-0.05408074, 0.504876, -0.4939599, 0, 1, 0.8901961, 1,
-0.05126316, -0.7225074, -2.377652, 0, 1, 0.8980392, 1,
-0.05113469, -0.6203867, -1.448685, 0, 1, 0.9058824, 1,
-0.04851059, 0.2469241, 0.7796973, 0, 1, 0.9098039, 1,
-0.04809709, -1.46682, -2.050416, 0, 1, 0.9176471, 1,
-0.04799105, -2.254527, -3.318483, 0, 1, 0.9215686, 1,
-0.043986, -1.302068, -3.826366, 0, 1, 0.9294118, 1,
-0.03577624, 0.9460025, 0.03490822, 0, 1, 0.9333333, 1,
-0.0333482, -0.5789326, -2.179544, 0, 1, 0.9411765, 1,
-0.03101932, 1.117538, -0.1313479, 0, 1, 0.945098, 1,
-0.0306019, -1.906349, -2.001911, 0, 1, 0.9529412, 1,
-0.02946682, 0.08997699, -1.123232, 0, 1, 0.9568627, 1,
-0.02904591, -0.3597937, -1.809962, 0, 1, 0.9647059, 1,
-0.0288197, 0.6106796, -0.2721576, 0, 1, 0.9686275, 1,
-0.02827865, 0.8239073, 1.397807, 0, 1, 0.9764706, 1,
-0.02788507, 1.032249, 0.738575, 0, 1, 0.9803922, 1,
-0.0276728, 0.9042103, -0.7226396, 0, 1, 0.9882353, 1,
-0.02626633, -0.1351246, -3.204073, 0, 1, 0.9921569, 1,
-0.02454217, -0.6266785, -2.380892, 0, 1, 1, 1,
-0.0181335, 0.1850163, -1.573723, 0, 0.9921569, 1, 1,
-0.0138621, -1.998711, -3.232357, 0, 0.9882353, 1, 1,
-0.01322639, -0.6259301, -1.889287, 0, 0.9803922, 1, 1,
-0.01289142, -0.3637717, -3.768934, 0, 0.9764706, 1, 1,
-0.0111778, -0.2015522, -2.695765, 0, 0.9686275, 1, 1,
-0.01112814, -0.491668, -3.768279, 0, 0.9647059, 1, 1,
-0.008353846, -0.5608255, -2.518356, 0, 0.9568627, 1, 1,
-0.006983417, -1.75494, -2.027872, 0, 0.9529412, 1, 1,
-0.006856711, -0.01867378, -1.759935, 0, 0.945098, 1, 1,
-0.004647735, 0.2424625, -1.128041, 0, 0.9411765, 1, 1,
0.002096753, -1.257131, 2.974569, 0, 0.9333333, 1, 1,
0.003619478, -0.7907419, 2.376461, 0, 0.9294118, 1, 1,
0.007475327, 0.5595173, -0.4605529, 0, 0.9215686, 1, 1,
0.007700094, -0.3534277, 4.328437, 0, 0.9176471, 1, 1,
0.01092781, 1.185324, 0.9995281, 0, 0.9098039, 1, 1,
0.01587915, 1.279179, 0.05323892, 0, 0.9058824, 1, 1,
0.01610093, -1.566355, 3.927158, 0, 0.8980392, 1, 1,
0.01628665, 0.6461874, 0.28896, 0, 0.8901961, 1, 1,
0.02095364, 1.596744, -1.254838, 0, 0.8862745, 1, 1,
0.02241321, 1.034187, -1.246083, 0, 0.8784314, 1, 1,
0.03426388, 0.6320114, 1.201868, 0, 0.8745098, 1, 1,
0.03747727, -1.930144, 5.028471, 0, 0.8666667, 1, 1,
0.03804605, -1.056213, 1.89702, 0, 0.8627451, 1, 1,
0.04403447, -0.4951211, 3.695304, 0, 0.854902, 1, 1,
0.04444764, -0.0003582837, 1.963519, 0, 0.8509804, 1, 1,
0.04757451, -1.345496, 3.699818, 0, 0.8431373, 1, 1,
0.04888196, -0.818193, 2.92763, 0, 0.8392157, 1, 1,
0.04996954, -2.059337, 3.921318, 0, 0.8313726, 1, 1,
0.053172, 0.360088, 0.08779892, 0, 0.827451, 1, 1,
0.05339029, -1.021716, 3.547727, 0, 0.8196079, 1, 1,
0.05379475, 0.8671695, 0.7223243, 0, 0.8156863, 1, 1,
0.05418573, -0.358436, 3.969714, 0, 0.8078431, 1, 1,
0.06716147, 0.225161, 0.8769742, 0, 0.8039216, 1, 1,
0.06738991, -1.777758, 3.698311, 0, 0.7960784, 1, 1,
0.06780466, 0.3688692, 1.21348, 0, 0.7882353, 1, 1,
0.07041311, 0.4530137, -1.545251, 0, 0.7843137, 1, 1,
0.07059079, -0.109123, 1.306726, 0, 0.7764706, 1, 1,
0.07437309, 0.2683091, 0.7007737, 0, 0.772549, 1, 1,
0.07476437, -1.555662, 2.839456, 0, 0.7647059, 1, 1,
0.07589562, -0.606455, 3.409776, 0, 0.7607843, 1, 1,
0.07590478, -0.4916039, 1.814865, 0, 0.7529412, 1, 1,
0.09147918, 0.9376694, 1.869603, 0, 0.7490196, 1, 1,
0.09368764, 1.168546, 1.506616, 0, 0.7411765, 1, 1,
0.09396515, 0.7661264, -0.7048566, 0, 0.7372549, 1, 1,
0.09417024, 0.8655864, 1.267621, 0, 0.7294118, 1, 1,
0.09598329, 0.5356045, -0.9145507, 0, 0.7254902, 1, 1,
0.1019069, -0.3386116, 3.472098, 0, 0.7176471, 1, 1,
0.1021351, 1.386493, -1.02345, 0, 0.7137255, 1, 1,
0.1030307, -0.3817899, 2.776292, 0, 0.7058824, 1, 1,
0.1056868, 1.996664, -0.3680348, 0, 0.6980392, 1, 1,
0.1150432, 0.5093407, -0.897121, 0, 0.6941177, 1, 1,
0.1161174, -1.374815, 1.064323, 0, 0.6862745, 1, 1,
0.1198623, 0.4837077, -1.631452, 0, 0.682353, 1, 1,
0.1209163, -0.9467406, 3.925615, 0, 0.6745098, 1, 1,
0.122619, -1.281934, 2.31658, 0, 0.6705883, 1, 1,
0.125095, -1.06036, 3.625322, 0, 0.6627451, 1, 1,
0.1263586, -1.33745, 2.069158, 0, 0.6588235, 1, 1,
0.1277651, -0.5940693, 3.114989, 0, 0.6509804, 1, 1,
0.1280806, 1.163724, -1.636815, 0, 0.6470588, 1, 1,
0.1283924, -0.4544635, 4.042617, 0, 0.6392157, 1, 1,
0.1307298, -2.096666, 1.542726, 0, 0.6352941, 1, 1,
0.1334558, 1.216656, 0.07418126, 0, 0.627451, 1, 1,
0.1335444, 0.6019546, -0.1631348, 0, 0.6235294, 1, 1,
0.1383655, -0.621137, 4.635801, 0, 0.6156863, 1, 1,
0.1385348, -0.8818461, 3.289434, 0, 0.6117647, 1, 1,
0.1399577, -1.821961, 4.547461, 0, 0.6039216, 1, 1,
0.1428374, -0.5794364, 1.769236, 0, 0.5960785, 1, 1,
0.1429839, 0.3038278, -0.457463, 0, 0.5921569, 1, 1,
0.1467654, 1.670385, -2.259679, 0, 0.5843138, 1, 1,
0.1479968, -0.7437469, 2.500039, 0, 0.5803922, 1, 1,
0.148576, -1.380066, 2.767663, 0, 0.572549, 1, 1,
0.1572134, 1.296569, -0.01510158, 0, 0.5686275, 1, 1,
0.1649274, 1.471876, -0.4348696, 0, 0.5607843, 1, 1,
0.1662651, -0.8120447, 2.88277, 0, 0.5568628, 1, 1,
0.170785, 0.7444608, -0.7543921, 0, 0.5490196, 1, 1,
0.1708231, -0.3686584, 3.504257, 0, 0.5450981, 1, 1,
0.1732628, 0.03398599, 0.4819959, 0, 0.5372549, 1, 1,
0.1762775, -0.7408186, 3.224199, 0, 0.5333334, 1, 1,
0.1764639, 0.08198586, 2.336817, 0, 0.5254902, 1, 1,
0.1795786, 0.7519384, 1.317211, 0, 0.5215687, 1, 1,
0.1828086, -0.6439524, 4.211722, 0, 0.5137255, 1, 1,
0.1905047, -0.3174229, 2.95398, 0, 0.509804, 1, 1,
0.1908798, -0.02912324, 3.358095, 0, 0.5019608, 1, 1,
0.19098, -0.4867665, 4.09266, 0, 0.4941176, 1, 1,
0.1920295, -0.07279356, 1.880643, 0, 0.4901961, 1, 1,
0.1939051, -0.01831829, 0.07431874, 0, 0.4823529, 1, 1,
0.1941158, -0.5140611, 3.25367, 0, 0.4784314, 1, 1,
0.1981377, 0.07706261, 1.747013, 0, 0.4705882, 1, 1,
0.1983398, -1.073459, 3.098722, 0, 0.4666667, 1, 1,
0.2086592, 1.548786, -1.143596, 0, 0.4588235, 1, 1,
0.2118899, -1.675449, 3.384119, 0, 0.454902, 1, 1,
0.2142276, 1.072114, -0.8093217, 0, 0.4470588, 1, 1,
0.2145131, 0.4028091, -1.805964, 0, 0.4431373, 1, 1,
0.2162315, 1.119649, -0.1129907, 0, 0.4352941, 1, 1,
0.2164155, -0.2887267, 2.32847, 0, 0.4313726, 1, 1,
0.2193831, 0.03962826, 0.8331717, 0, 0.4235294, 1, 1,
0.2214995, 1.126039, -1.037647, 0, 0.4196078, 1, 1,
0.2224625, -0.4186114, 2.517877, 0, 0.4117647, 1, 1,
0.2258929, 2.580027, 1.228812, 0, 0.4078431, 1, 1,
0.2261519, -1.202762, 3.132655, 0, 0.4, 1, 1,
0.2276, -0.7457337, 2.405877, 0, 0.3921569, 1, 1,
0.2302007, -0.429047, 1.65877, 0, 0.3882353, 1, 1,
0.2370684, -1.779292, 3.431958, 0, 0.3803922, 1, 1,
0.2383576, -0.3515497, 2.088994, 0, 0.3764706, 1, 1,
0.2465601, 0.4059923, -1.179272, 0, 0.3686275, 1, 1,
0.2487636, -0.9942521, 3.097903, 0, 0.3647059, 1, 1,
0.2492418, 0.2826762, -0.6441193, 0, 0.3568628, 1, 1,
0.2519563, -2.224548, 2.404747, 0, 0.3529412, 1, 1,
0.2564146, 0.929754, 1.975448, 0, 0.345098, 1, 1,
0.2565294, 0.454777, 1.107043, 0, 0.3411765, 1, 1,
0.2684359, -1.129121, 3.73798, 0, 0.3333333, 1, 1,
0.2690222, 0.7958221, -0.07223938, 0, 0.3294118, 1, 1,
0.2709394, -0.2549542, 3.21641, 0, 0.3215686, 1, 1,
0.2714541, 0.9047025, 1.223046, 0, 0.3176471, 1, 1,
0.2741326, 0.1647277, 2.028026, 0, 0.3098039, 1, 1,
0.2745067, -0.2674889, 2.150764, 0, 0.3058824, 1, 1,
0.2758503, 1.710558, -1.866387, 0, 0.2980392, 1, 1,
0.2813708, -0.2443843, 3.033491, 0, 0.2901961, 1, 1,
0.2851986, -0.02364109, 1.754557, 0, 0.2862745, 1, 1,
0.2880436, -0.4346381, 1.385412, 0, 0.2784314, 1, 1,
0.2884725, -0.9410826, 2.98623, 0, 0.2745098, 1, 1,
0.2892905, -0.2038001, 2.966144, 0, 0.2666667, 1, 1,
0.2895837, -0.7225723, 2.395534, 0, 0.2627451, 1, 1,
0.2908987, 1.099615, -1.989492, 0, 0.254902, 1, 1,
0.2916547, 0.7685552, -0.8356567, 0, 0.2509804, 1, 1,
0.2931272, -0.7699584, 3.114143, 0, 0.2431373, 1, 1,
0.2945689, 0.3121304, 1.082784, 0, 0.2392157, 1, 1,
0.2947287, -1.654113, 2.513398, 0, 0.2313726, 1, 1,
0.3018678, -0.8574062, 2.380878, 0, 0.227451, 1, 1,
0.3020472, 1.527124, 0.3556415, 0, 0.2196078, 1, 1,
0.3083882, -1.221631, 3.045086, 0, 0.2156863, 1, 1,
0.3097978, -1.914836, 3.492401, 0, 0.2078431, 1, 1,
0.3130618, 0.06350692, 1.516536, 0, 0.2039216, 1, 1,
0.314898, 1.591697, 0.2015817, 0, 0.1960784, 1, 1,
0.3176603, 0.01907446, 0.3232757, 0, 0.1882353, 1, 1,
0.3294037, 0.8020138, 0.3393994, 0, 0.1843137, 1, 1,
0.3309944, 1.272904, 1.049097, 0, 0.1764706, 1, 1,
0.3316597, -1.225653, 2.452752, 0, 0.172549, 1, 1,
0.3336655, 1.695683, -1.564069, 0, 0.1647059, 1, 1,
0.3342, 0.562038, 0.8131316, 0, 0.1607843, 1, 1,
0.3349075, 0.6077808, 2.279511, 0, 0.1529412, 1, 1,
0.3371872, 0.2306166, 1.491086, 0, 0.1490196, 1, 1,
0.3412608, 0.2203654, 1.923873, 0, 0.1411765, 1, 1,
0.3414237, 0.7946678, 3.078187, 0, 0.1372549, 1, 1,
0.3421705, -0.4072818, 2.180137, 0, 0.1294118, 1, 1,
0.3425249, 1.568651, -1.269502, 0, 0.1254902, 1, 1,
0.3493729, -0.5143827, 1.333825, 0, 0.1176471, 1, 1,
0.3514657, -0.1014362, 2.142908, 0, 0.1137255, 1, 1,
0.3551407, -0.6196156, 3.625303, 0, 0.1058824, 1, 1,
0.3592451, 1.979933, 0.05730662, 0, 0.09803922, 1, 1,
0.3602294, -0.1674983, 3.566159, 0, 0.09411765, 1, 1,
0.3646208, 0.1885008, -0.6358603, 0, 0.08627451, 1, 1,
0.3715374, 0.9634176, 1.153563, 0, 0.08235294, 1, 1,
0.3726195, 0.67511, 0.8235616, 0, 0.07450981, 1, 1,
0.3728184, 0.9385269, 1.784315, 0, 0.07058824, 1, 1,
0.3740835, -0.8409598, 2.168773, 0, 0.0627451, 1, 1,
0.3752937, -0.9191897, 4.347625, 0, 0.05882353, 1, 1,
0.3757566, 1.546726, 0.6267048, 0, 0.05098039, 1, 1,
0.3762938, -0.6069414, 2.496578, 0, 0.04705882, 1, 1,
0.380219, 0.6973532, 1.618825, 0, 0.03921569, 1, 1,
0.3827235, -0.6438412, 2.101779, 0, 0.03529412, 1, 1,
0.3869333, -0.6938654, 3.160842, 0, 0.02745098, 1, 1,
0.3882855, -1.538342, 2.767378, 0, 0.02352941, 1, 1,
0.3914082, 2.315605, -0.4975758, 0, 0.01568628, 1, 1,
0.3915836, -0.3357049, 0.7404683, 0, 0.01176471, 1, 1,
0.3929349, 0.07826454, 1.055632, 0, 0.003921569, 1, 1,
0.3937348, -1.289837, 2.62187, 0.003921569, 0, 1, 1,
0.3940797, 0.2294224, 1.063176, 0.007843138, 0, 1, 1,
0.3986984, -0.5496702, 3.580815, 0.01568628, 0, 1, 1,
0.4014364, 0.08030114, 1.654334, 0.01960784, 0, 1, 1,
0.4018337, 0.5199697, 0.3904688, 0.02745098, 0, 1, 1,
0.4024792, 0.5066403, -0.2340255, 0.03137255, 0, 1, 1,
0.4080748, -0.3448847, 3.758455, 0.03921569, 0, 1, 1,
0.4153475, 0.9569156, 0.1193322, 0.04313726, 0, 1, 1,
0.4170449, 0.6106539, 3.394982, 0.05098039, 0, 1, 1,
0.4175662, 0.3910098, -0.8386713, 0.05490196, 0, 1, 1,
0.4255272, -0.1305567, 1.58216, 0.0627451, 0, 1, 1,
0.4261363, 1.344617, 0.08219066, 0.06666667, 0, 1, 1,
0.4287046, 1.270819, -1.260724, 0.07450981, 0, 1, 1,
0.4298306, -1.207231, 2.51123, 0.07843138, 0, 1, 1,
0.4371015, -0.6039106, 3.975877, 0.08627451, 0, 1, 1,
0.4437593, -0.3599699, 4.672794, 0.09019608, 0, 1, 1,
0.4438153, 0.5557653, 1.028039, 0.09803922, 0, 1, 1,
0.4504093, 0.002609313, 1.091473, 0.1058824, 0, 1, 1,
0.4557711, 0.7573557, 0.06094319, 0.1098039, 0, 1, 1,
0.4642512, -0.151714, 1.883037, 0.1176471, 0, 1, 1,
0.4670207, 0.808725, 1.22711, 0.1215686, 0, 1, 1,
0.4722904, 1.250943, -0.8060727, 0.1294118, 0, 1, 1,
0.4835083, -0.6218107, 1.089734, 0.1333333, 0, 1, 1,
0.4841476, -0.2103891, 3.230654, 0.1411765, 0, 1, 1,
0.4853483, 0.7046379, -0.6274226, 0.145098, 0, 1, 1,
0.4919221, -1.867612, 2.348809, 0.1529412, 0, 1, 1,
0.4931177, 0.5357795, -0.04942461, 0.1568628, 0, 1, 1,
0.4982638, -0.520069, 2.077186, 0.1647059, 0, 1, 1,
0.5031889, 1.31178, -0.7114805, 0.1686275, 0, 1, 1,
0.5048446, -1.459485, 3.591282, 0.1764706, 0, 1, 1,
0.5055839, 0.2228496, 2.44038, 0.1803922, 0, 1, 1,
0.5070757, 0.5660633, 1.81706, 0.1882353, 0, 1, 1,
0.5088539, 0.02936846, 0.7566016, 0.1921569, 0, 1, 1,
0.5096654, 0.8448452, -0.08197118, 0.2, 0, 1, 1,
0.510996, 0.1733585, -0.289529, 0.2078431, 0, 1, 1,
0.5111422, 1.5124, 0.5593272, 0.2117647, 0, 1, 1,
0.5148698, 0.6745994, 0.3418728, 0.2196078, 0, 1, 1,
0.5179355, 0.2057759, 1.77671, 0.2235294, 0, 1, 1,
0.5234573, 0.4289466, 0.5564016, 0.2313726, 0, 1, 1,
0.5259953, 0.2336432, 0.6049571, 0.2352941, 0, 1, 1,
0.5281052, 0.1007585, 1.06685, 0.2431373, 0, 1, 1,
0.5297506, 0.5974343, 1.318921, 0.2470588, 0, 1, 1,
0.5344046, -0.6940551, 2.629635, 0.254902, 0, 1, 1,
0.5387771, -1.039059, 2.435821, 0.2588235, 0, 1, 1,
0.5395417, 2.448257, 0.7051676, 0.2666667, 0, 1, 1,
0.5396646, -0.1123233, 1.547835, 0.2705882, 0, 1, 1,
0.5397539, 0.06121889, 1.824437, 0.2784314, 0, 1, 1,
0.5419256, 1.455576, -0.002302348, 0.282353, 0, 1, 1,
0.5423661, -0.284453, 0.8484248, 0.2901961, 0, 1, 1,
0.5444642, -0.4592122, 2.61992, 0.2941177, 0, 1, 1,
0.5523393, -0.5520583, 2.700166, 0.3019608, 0, 1, 1,
0.5538418, -1.460763, 0.8107915, 0.3098039, 0, 1, 1,
0.5548691, -1.425528, 3.240516, 0.3137255, 0, 1, 1,
0.5586333, -0.4114462, 3.795332, 0.3215686, 0, 1, 1,
0.5621382, -0.8090907, 1.92585, 0.3254902, 0, 1, 1,
0.5681424, -0.582672, 2.784578, 0.3333333, 0, 1, 1,
0.5713041, -0.7068095, 0.2396416, 0.3372549, 0, 1, 1,
0.5755721, 0.02598973, 2.928335, 0.345098, 0, 1, 1,
0.5850533, 1.563967, -0.7119716, 0.3490196, 0, 1, 1,
0.588452, 0.7837383, 0.2558357, 0.3568628, 0, 1, 1,
0.5904369, 0.6872348, 1.290657, 0.3607843, 0, 1, 1,
0.5935001, 1.0672, 0.901136, 0.3686275, 0, 1, 1,
0.5980265, -0.09517583, 2.196295, 0.372549, 0, 1, 1,
0.6012122, 1.150137, 0.4745214, 0.3803922, 0, 1, 1,
0.6020196, 0.04070912, 1.595781, 0.3843137, 0, 1, 1,
0.6093246, 0.4082256, 0.3608279, 0.3921569, 0, 1, 1,
0.6101541, 0.2718329, 0.6694435, 0.3960784, 0, 1, 1,
0.6111277, 0.2952243, 0.364597, 0.4039216, 0, 1, 1,
0.6111494, 1.316508, 0.322141, 0.4117647, 0, 1, 1,
0.6123137, -0.9775678, 2.463174, 0.4156863, 0, 1, 1,
0.6154878, 0.5001037, 0.7689333, 0.4235294, 0, 1, 1,
0.61637, -0.1472058, 1.587941, 0.427451, 0, 1, 1,
0.616969, 1.162777, 0.5708075, 0.4352941, 0, 1, 1,
0.6199911, 0.2718845, -0.1311978, 0.4392157, 0, 1, 1,
0.6240837, 0.8256624, 0.3414567, 0.4470588, 0, 1, 1,
0.6311323, -0.405839, 2.953815, 0.4509804, 0, 1, 1,
0.6341359, -0.2499145, 2.982439, 0.4588235, 0, 1, 1,
0.6363244, -0.6947833, 2.332772, 0.4627451, 0, 1, 1,
0.6409639, 0.6918877, 0.8493121, 0.4705882, 0, 1, 1,
0.6455664, -0.2403778, 1.963058, 0.4745098, 0, 1, 1,
0.6475716, -1.491104, 3.224485, 0.4823529, 0, 1, 1,
0.647736, -0.5323489, 1.588231, 0.4862745, 0, 1, 1,
0.6563677, -1.663369, 3.320161, 0.4941176, 0, 1, 1,
0.6613435, -0.4814924, 2.092508, 0.5019608, 0, 1, 1,
0.6615004, -0.1406557, 1.438171, 0.5058824, 0, 1, 1,
0.6645405, -0.2828531, 1.621289, 0.5137255, 0, 1, 1,
0.664647, 0.005931871, 0.4963628, 0.5176471, 0, 1, 1,
0.670345, -0.9831081, 2.912617, 0.5254902, 0, 1, 1,
0.6714643, -0.6751814, 0.8442582, 0.5294118, 0, 1, 1,
0.6792504, 0.6599517, 1.675053, 0.5372549, 0, 1, 1,
0.6793457, -1.126664, 2.844054, 0.5411765, 0, 1, 1,
0.6804064, -1.014731, 3.115476, 0.5490196, 0, 1, 1,
0.680873, -0.01202947, 0.4832602, 0.5529412, 0, 1, 1,
0.6816348, -1.079761, 0.02297668, 0.5607843, 0, 1, 1,
0.6818952, -0.4030898, 3.385672, 0.5647059, 0, 1, 1,
0.6861025, 0.02263687, 0.9873205, 0.572549, 0, 1, 1,
0.6881967, -0.5912798, 1.955047, 0.5764706, 0, 1, 1,
0.696355, -0.1121808, 2.114216, 0.5843138, 0, 1, 1,
0.6965384, -0.2206122, 0.8113849, 0.5882353, 0, 1, 1,
0.6997715, 1.018658, 0.02956344, 0.5960785, 0, 1, 1,
0.6999462, -1.348509, 0.601818, 0.6039216, 0, 1, 1,
0.7060845, -2.899711, 2.912757, 0.6078432, 0, 1, 1,
0.7063164, -0.2392784, 2.502942, 0.6156863, 0, 1, 1,
0.7097549, 1.405261, 1.044584, 0.6196079, 0, 1, 1,
0.7138985, 0.9509342, 2.474295, 0.627451, 0, 1, 1,
0.7145422, 0.1419192, 2.432675, 0.6313726, 0, 1, 1,
0.7206447, -1.962632, 3.178398, 0.6392157, 0, 1, 1,
0.7223417, 0.7084681, 0.635569, 0.6431373, 0, 1, 1,
0.729903, -0.1111554, 1.278193, 0.6509804, 0, 1, 1,
0.7303146, 0.1456439, 1.349748, 0.654902, 0, 1, 1,
0.7317194, 0.02373591, -0.2353026, 0.6627451, 0, 1, 1,
0.7388584, 1.597268, 1.233579, 0.6666667, 0, 1, 1,
0.7415832, -0.2837016, 3.29921, 0.6745098, 0, 1, 1,
0.7419655, -0.8851917, 2.373972, 0.6784314, 0, 1, 1,
0.7452278, -1.057726, 2.965009, 0.6862745, 0, 1, 1,
0.7492654, -0.3408545, 0.3929258, 0.6901961, 0, 1, 1,
0.7497196, 0.9747714, 0.550815, 0.6980392, 0, 1, 1,
0.7565109, 0.07235416, 0.4178552, 0.7058824, 0, 1, 1,
0.7713335, 0.5095015, 1.933056, 0.7098039, 0, 1, 1,
0.7719136, -0.7946891, 3.767645, 0.7176471, 0, 1, 1,
0.7805988, 0.1993141, 2.51196, 0.7215686, 0, 1, 1,
0.7851645, 0.4715519, 0.06019142, 0.7294118, 0, 1, 1,
0.7981595, -0.6178914, 2.174168, 0.7333333, 0, 1, 1,
0.8069147, -0.397151, 0.6372566, 0.7411765, 0, 1, 1,
0.8079033, -0.00794967, 0.4500738, 0.7450981, 0, 1, 1,
0.8113137, 0.02391425, 1.705304, 0.7529412, 0, 1, 1,
0.8192248, 0.6086954, -0.2946659, 0.7568628, 0, 1, 1,
0.819337, -1.386124, 2.897216, 0.7647059, 0, 1, 1,
0.8226488, 1.051813, 2.294485, 0.7686275, 0, 1, 1,
0.8248896, 0.3870938, 0.2148957, 0.7764706, 0, 1, 1,
0.8382426, -0.1670297, 1.574759, 0.7803922, 0, 1, 1,
0.8418993, 1.293952, 1.51254, 0.7882353, 0, 1, 1,
0.846676, 2.034487, 1.567889, 0.7921569, 0, 1, 1,
0.8490023, 1.735061, 0.2736909, 0.8, 0, 1, 1,
0.8512175, 0.09924375, 0.9889532, 0.8078431, 0, 1, 1,
0.8552964, 0.2780522, 0.8276566, 0.8117647, 0, 1, 1,
0.8628928, 0.206043, 0.1894, 0.8196079, 0, 1, 1,
0.8636875, -1.392543, 3.15364, 0.8235294, 0, 1, 1,
0.8685471, -1.172064, 3.182525, 0.8313726, 0, 1, 1,
0.8714042, 0.2175159, 1.930237, 0.8352941, 0, 1, 1,
0.87198, 0.2210043, 1.455549, 0.8431373, 0, 1, 1,
0.8743839, 0.4891095, 0.5330723, 0.8470588, 0, 1, 1,
0.875896, 0.3008496, 0.9441662, 0.854902, 0, 1, 1,
0.8767745, -0.2059433, 2.506224, 0.8588235, 0, 1, 1,
0.8776302, 1.929389, -0.8658755, 0.8666667, 0, 1, 1,
0.8876522, 0.3471532, 1.360781, 0.8705882, 0, 1, 1,
0.8879693, 1.068854, 1.428007, 0.8784314, 0, 1, 1,
0.8932031, 2.337492, -0.6199337, 0.8823529, 0, 1, 1,
0.8937578, 0.7752633, 1.078991, 0.8901961, 0, 1, 1,
0.8983473, 0.4748816, 2.06633, 0.8941177, 0, 1, 1,
0.898513, -0.1333995, 2.994227, 0.9019608, 0, 1, 1,
0.8992965, 1.000435, -0.5824446, 0.9098039, 0, 1, 1,
0.902123, -0.5464215, 1.480928, 0.9137255, 0, 1, 1,
0.9159489, 0.7843589, 1.2608, 0.9215686, 0, 1, 1,
0.9220964, 2.281116, 0.1818324, 0.9254902, 0, 1, 1,
0.9234593, 0.1635425, 2.7965, 0.9333333, 0, 1, 1,
0.9301956, 1.284176, 1.377309, 0.9372549, 0, 1, 1,
0.9347098, 0.2200522, 0.364319, 0.945098, 0, 1, 1,
0.9348843, 0.9068279, -1.399449, 0.9490196, 0, 1, 1,
0.9350967, -1.222475, 2.122124, 0.9568627, 0, 1, 1,
0.9427606, 0.09846059, 2.948439, 0.9607843, 0, 1, 1,
0.9505475, 0.8745573, 0.009607817, 0.9686275, 0, 1, 1,
0.9509015, -0.8458878, 0.8703259, 0.972549, 0, 1, 1,
0.9549235, -1.261596, 3.238545, 0.9803922, 0, 1, 1,
0.9670424, 1.255693, 0.2132898, 0.9843137, 0, 1, 1,
0.9674313, 0.102941, 2.919021, 0.9921569, 0, 1, 1,
0.9741855, 1.101445, 0.8432419, 0.9960784, 0, 1, 1,
0.9754009, 0.6164619, 0.05625407, 1, 0, 0.9960784, 1,
0.9830374, -1.371124, 0.3632952, 1, 0, 0.9882353, 1,
0.9849751, -1.743755, 4.171119, 1, 0, 0.9843137, 1,
0.998419, -1.049152, 1.628421, 1, 0, 0.9764706, 1,
0.9991612, -0.9559451, 2.5587, 1, 0, 0.972549, 1,
1.005099, -0.8456818, 1.926807, 1, 0, 0.9647059, 1,
1.01798, -0.3273222, 2.93648, 1, 0, 0.9607843, 1,
1.018671, -0.7881761, 2.154638, 1, 0, 0.9529412, 1,
1.024608, -0.8042831, 3.007219, 1, 0, 0.9490196, 1,
1.026223, 1.018283, 2.757826, 1, 0, 0.9411765, 1,
1.027097, -0.247956, 2.626599, 1, 0, 0.9372549, 1,
1.031296, 0.6001973, 2.001715, 1, 0, 0.9294118, 1,
1.033333, -1.074238, 1.13375, 1, 0, 0.9254902, 1,
1.033536, -0.02733686, 3.114276, 1, 0, 0.9176471, 1,
1.034767, -0.2215298, 2.681384, 1, 0, 0.9137255, 1,
1.034924, -0.4046686, 3.002657, 1, 0, 0.9058824, 1,
1.03712, -0.9392497, 2.686887, 1, 0, 0.9019608, 1,
1.051927, 0.5585334, 1.312712, 1, 0, 0.8941177, 1,
1.0546, 0.7904106, 0.09338769, 1, 0, 0.8862745, 1,
1.055473, 0.2026985, 0.5025707, 1, 0, 0.8823529, 1,
1.05774, 1.558334, 0.3346949, 1, 0, 0.8745098, 1,
1.059463, 0.3882387, 2.347662, 1, 0, 0.8705882, 1,
1.062053, -2.25659, 2.094651, 1, 0, 0.8627451, 1,
1.065163, -0.6956769, 2.673211, 1, 0, 0.8588235, 1,
1.068174, 1.252907, 1.473053, 1, 0, 0.8509804, 1,
1.074041, -2.456231, 3.159682, 1, 0, 0.8470588, 1,
1.074298, -0.2135594, -0.5790945, 1, 0, 0.8392157, 1,
1.075066, 0.9573205, 0.8978184, 1, 0, 0.8352941, 1,
1.078326, -0.02256705, 1.196688, 1, 0, 0.827451, 1,
1.083367, 0.3847724, 2.500691, 1, 0, 0.8235294, 1,
1.086143, -2.439143, 3.021941, 1, 0, 0.8156863, 1,
1.097598, 0.4544091, 0.6092712, 1, 0, 0.8117647, 1,
1.10803, -0.0564867, 3.146568, 1, 0, 0.8039216, 1,
1.116841, -1.062161, 1.249454, 1, 0, 0.7960784, 1,
1.117308, -0.6181684, -0.08453664, 1, 0, 0.7921569, 1,
1.118847, -0.3907414, 0.388634, 1, 0, 0.7843137, 1,
1.137985, 0.06525461, -0.3959836, 1, 0, 0.7803922, 1,
1.141581, -0.7714783, -0.1266474, 1, 0, 0.772549, 1,
1.141644, 0.2082753, 1.858817, 1, 0, 0.7686275, 1,
1.144712, -0.09014462, 2.143118, 1, 0, 0.7607843, 1,
1.156699, -1.626637, 2.851612, 1, 0, 0.7568628, 1,
1.159635, 0.7778617, 2.460091, 1, 0, 0.7490196, 1,
1.174233, 0.006588955, 0.648719, 1, 0, 0.7450981, 1,
1.175995, 2.268314, 1.190167, 1, 0, 0.7372549, 1,
1.18107, 0.3120364, 0.7056158, 1, 0, 0.7333333, 1,
1.182114, -1.172805, 1.933411, 1, 0, 0.7254902, 1,
1.193589, 0.4047899, 0.558322, 1, 0, 0.7215686, 1,
1.197481, -0.3403391, 2.506773, 1, 0, 0.7137255, 1,
1.201199, -1.427787, 1.367689, 1, 0, 0.7098039, 1,
1.205333, 1.06447, 0.9255276, 1, 0, 0.7019608, 1,
1.205912, -0.1437816, 3.984426, 1, 0, 0.6941177, 1,
1.211366, -0.8786222, 1.612266, 1, 0, 0.6901961, 1,
1.218444, -0.6635497, 0.7915366, 1, 0, 0.682353, 1,
1.236173, -1.301448, 2.822852, 1, 0, 0.6784314, 1,
1.240118, 1.157722, 1.209475, 1, 0, 0.6705883, 1,
1.249411, -0.7121311, 2.344373, 1, 0, 0.6666667, 1,
1.254529, -0.401703, 2.155391, 1, 0, 0.6588235, 1,
1.261104, 1.065882, 0.1056962, 1, 0, 0.654902, 1,
1.264955, -0.4427654, 2.754153, 1, 0, 0.6470588, 1,
1.267223, 0.554594, 0.9858251, 1, 0, 0.6431373, 1,
1.272934, 0.1316518, 2.39874, 1, 0, 0.6352941, 1,
1.275434, 0.1050349, 2.375379, 1, 0, 0.6313726, 1,
1.276883, -0.3282267, 0.2906713, 1, 0, 0.6235294, 1,
1.285231, 0.770335, 1.005686, 1, 0, 0.6196079, 1,
1.295748, 2.180672, 1.952354, 1, 0, 0.6117647, 1,
1.302243, 0.2272251, 1.045192, 1, 0, 0.6078432, 1,
1.305154, -0.5583644, 3.320771, 1, 0, 0.6, 1,
1.306314, -0.3081473, 2.594417, 1, 0, 0.5921569, 1,
1.3128, -2.046651, 1.428979, 1, 0, 0.5882353, 1,
1.315385, -1.265958, 1.528419, 1, 0, 0.5803922, 1,
1.323713, -2.387176, 3.082541, 1, 0, 0.5764706, 1,
1.32809, -0.7532577, 1.817124, 1, 0, 0.5686275, 1,
1.32929, 0.1236082, 3.904279, 1, 0, 0.5647059, 1,
1.332905, -0.7922454, 2.307731, 1, 0, 0.5568628, 1,
1.339248, -1.219342, 2.315158, 1, 0, 0.5529412, 1,
1.341484, -1.034589, 2.875861, 1, 0, 0.5450981, 1,
1.34195, 0.2678304, 0.9588622, 1, 0, 0.5411765, 1,
1.352505, -0.09677377, -0.7973673, 1, 0, 0.5333334, 1,
1.355984, 1.176235, -0.005881737, 1, 0, 0.5294118, 1,
1.356428, 0.02563218, 0.6084014, 1, 0, 0.5215687, 1,
1.35665, -0.2825958, 1.81827, 1, 0, 0.5176471, 1,
1.35755, -1.615356, 1.181134, 1, 0, 0.509804, 1,
1.360317, -1.33984, 1.536011, 1, 0, 0.5058824, 1,
1.361972, -0.1184791, 0.3971272, 1, 0, 0.4980392, 1,
1.374874, 0.5137243, 2.122516, 1, 0, 0.4901961, 1,
1.375161, -0.1925367, -0.892962, 1, 0, 0.4862745, 1,
1.383034, -0.3443919, 1.411516, 1, 0, 0.4784314, 1,
1.383709, -0.09490989, 1.949842, 1, 0, 0.4745098, 1,
1.385887, -0.3579239, 2.171157, 1, 0, 0.4666667, 1,
1.39029, -0.8105993, 0.7069094, 1, 0, 0.4627451, 1,
1.405856, 0.7183949, 0.8794145, 1, 0, 0.454902, 1,
1.412869, 0.6751233, 1.444739, 1, 0, 0.4509804, 1,
1.427342, 1.092061, 1.653848, 1, 0, 0.4431373, 1,
1.439276, 0.4077691, 0.4880971, 1, 0, 0.4392157, 1,
1.440757, -0.1124553, -1.01317, 1, 0, 0.4313726, 1,
1.446523, 2.130791, 1.03768, 1, 0, 0.427451, 1,
1.46197, 0.501721, 1.04118, 1, 0, 0.4196078, 1,
1.463605, -0.687824, 3.27354, 1, 0, 0.4156863, 1,
1.466056, 0.4372375, 2.120187, 1, 0, 0.4078431, 1,
1.466148, -0.2004626, 1.182847, 1, 0, 0.4039216, 1,
1.467441, -1.222944, 0.813096, 1, 0, 0.3960784, 1,
1.469826, 1.5042, 2.650795, 1, 0, 0.3882353, 1,
1.472791, -0.412913, 1.28343, 1, 0, 0.3843137, 1,
1.480062, -0.2119476, 1.234087, 1, 0, 0.3764706, 1,
1.482479, 0.8355453, -0.1664452, 1, 0, 0.372549, 1,
1.488251, -0.8042507, 2.518711, 1, 0, 0.3647059, 1,
1.488298, 0.2758747, 1.496088, 1, 0, 0.3607843, 1,
1.493833, -0.9660209, 2.414079, 1, 0, 0.3529412, 1,
1.498251, 1.326276, -1.632362, 1, 0, 0.3490196, 1,
1.502314, -0.4574431, 2.963637, 1, 0, 0.3411765, 1,
1.511186, -2.293696, 3.046119, 1, 0, 0.3372549, 1,
1.512951, -1.093294, 1.110344, 1, 0, 0.3294118, 1,
1.513352, -1.894665, 2.330744, 1, 0, 0.3254902, 1,
1.523304, 0.5848711, 1.342422, 1, 0, 0.3176471, 1,
1.524538, -0.1015765, 2.483444, 1, 0, 0.3137255, 1,
1.539335, -0.1870575, 0.9714835, 1, 0, 0.3058824, 1,
1.5399, -0.4091736, -0.1938532, 1, 0, 0.2980392, 1,
1.550204, -0.2384756, 1.675348, 1, 0, 0.2941177, 1,
1.557896, -1.425401, 1.845341, 1, 0, 0.2862745, 1,
1.558234, 0.8535631, 1.111916, 1, 0, 0.282353, 1,
1.585439, -1.260286, 1.521084, 1, 0, 0.2745098, 1,
1.59369, 1.756589, 0.9884339, 1, 0, 0.2705882, 1,
1.600997, 0.6365345, 2.729213, 1, 0, 0.2627451, 1,
1.604066, -0.2519137, 0.9439024, 1, 0, 0.2588235, 1,
1.637667, -0.1669826, 2.744335, 1, 0, 0.2509804, 1,
1.64081, -1.902359, 1.707166, 1, 0, 0.2470588, 1,
1.642521, -0.4920247, 1.758261, 1, 0, 0.2392157, 1,
1.650931, -1.261477, 4.135413, 1, 0, 0.2352941, 1,
1.655853, 0.0350074, 2.096855, 1, 0, 0.227451, 1,
1.657877, 0.7516451, 0.6087705, 1, 0, 0.2235294, 1,
1.660212, -1.029316, 1.620949, 1, 0, 0.2156863, 1,
1.709527, 0.1118225, 0.3196067, 1, 0, 0.2117647, 1,
1.712001, 0.5284901, 0.9138403, 1, 0, 0.2039216, 1,
1.757835, -0.3509265, 4.123221, 1, 0, 0.1960784, 1,
1.771693, -0.8953141, 3.045454, 1, 0, 0.1921569, 1,
1.778342, 2.142735, 0.7040794, 1, 0, 0.1843137, 1,
1.790741, 0.3428255, 2.160969, 1, 0, 0.1803922, 1,
1.795363, 2.110782, 1.151686, 1, 0, 0.172549, 1,
1.820988, -0.8675874, 1.68921, 1, 0, 0.1686275, 1,
1.830022, -0.8816665, 0.5234552, 1, 0, 0.1607843, 1,
1.882237, -1.699335, 2.124868, 1, 0, 0.1568628, 1,
1.959112, -1.587828, 1.982574, 1, 0, 0.1490196, 1,
1.970853, -1.267628, 3.189584, 1, 0, 0.145098, 1,
1.974218, 0.1070555, 1.708243, 1, 0, 0.1372549, 1,
1.976269, -0.5109203, 1.738877, 1, 0, 0.1333333, 1,
1.981979, -0.1234784, 0.252373, 1, 0, 0.1254902, 1,
1.983322, 1.523364, 2.654765, 1, 0, 0.1215686, 1,
2.016049, -0.7441757, 3.041346, 1, 0, 0.1137255, 1,
2.048187, -0.8258964, 1.458898, 1, 0, 0.1098039, 1,
2.069334, -1.018955, 2.149855, 1, 0, 0.1019608, 1,
2.085358, 0.617857, 0.5002934, 1, 0, 0.09411765, 1,
2.111286, -1.296181, 3.114696, 1, 0, 0.09019608, 1,
2.127878, -1.646977, 2.36517, 1, 0, 0.08235294, 1,
2.142635, 0.1703981, 1.518149, 1, 0, 0.07843138, 1,
2.175373, -1.987459, 3.316294, 1, 0, 0.07058824, 1,
2.216202, -1.146005, 3.636873, 1, 0, 0.06666667, 1,
2.23399, -0.7044628, 1.7663, 1, 0, 0.05882353, 1,
2.402471, -0.5826675, -0.02432412, 1, 0, 0.05490196, 1,
2.456015, -0.7228048, 1.912532, 1, 0, 0.04705882, 1,
2.473023, 0.4356676, 1.514224, 1, 0, 0.04313726, 1,
2.545133, 0.1195756, 1.590621, 1, 0, 0.03529412, 1,
2.563164, 1.591894, -0.4472971, 1, 0, 0.03137255, 1,
2.610648, 0.8292988, 1.064835, 1, 0, 0.02352941, 1,
2.727687, -1.043993, 1.930962, 1, 0, 0.01960784, 1,
3.094964, 1.041824, -1.513797, 1, 0, 0.01176471, 1,
3.167381, 0.9042589, 1.539171, 1, 0, 0.007843138, 1
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
0.03926432, -4.422675, -6.442873, 0, -0.5, 0.5, 0.5,
0.03926432, -4.422675, -6.442873, 1, -0.5, 0.5, 0.5,
0.03926432, -4.422675, -6.442873, 1, 1.5, 0.5, 0.5,
0.03926432, -4.422675, -6.442873, 0, 1.5, 0.5, 0.5
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
-4.149283, -0.4138598, -6.442873, 0, -0.5, 0.5, 0.5,
-4.149283, -0.4138598, -6.442873, 1, -0.5, 0.5, 0.5,
-4.149283, -0.4138598, -6.442873, 1, 1.5, 0.5, 0.5,
-4.149283, -0.4138598, -6.442873, 0, 1.5, 0.5, 0.5
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
-4.149283, -4.422675, 0.1240919, 0, -0.5, 0.5, 0.5,
-4.149283, -4.422675, 0.1240919, 1, -0.5, 0.5, 0.5,
-4.149283, -4.422675, 0.1240919, 1, 1.5, 0.5, 0.5,
-4.149283, -4.422675, 0.1240919, 0, 1.5, 0.5, 0.5
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
-3, -3.497563, -4.927419,
3, -3.497563, -4.927419,
-3, -3.497563, -4.927419,
-3, -3.651749, -5.179995,
-2, -3.497563, -4.927419,
-2, -3.651749, -5.179995,
-1, -3.497563, -4.927419,
-1, -3.651749, -5.179995,
0, -3.497563, -4.927419,
0, -3.651749, -5.179995,
1, -3.497563, -4.927419,
1, -3.651749, -5.179995,
2, -3.497563, -4.927419,
2, -3.651749, -5.179995,
3, -3.497563, -4.927419,
3, -3.651749, -5.179995
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
-3, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
-3, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
-3, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
-3, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5,
-2, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
-2, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
-2, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
-2, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5,
-1, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
-1, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
-1, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
-1, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5,
0, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
0, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
0, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
0, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5,
1, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
1, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
1, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
1, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5,
2, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
2, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
2, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
2, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5,
3, -3.960119, -5.685146, 0, -0.5, 0.5, 0.5,
3, -3.960119, -5.685146, 1, -0.5, 0.5, 0.5,
3, -3.960119, -5.685146, 1, 1.5, 0.5, 0.5,
3, -3.960119, -5.685146, 0, 1.5, 0.5, 0.5
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
-3.182695, -3, -4.927419,
-3.182695, 2, -4.927419,
-3.182695, -3, -4.927419,
-3.343793, -3, -5.179995,
-3.182695, -2, -4.927419,
-3.343793, -2, -5.179995,
-3.182695, -1, -4.927419,
-3.343793, -1, -5.179995,
-3.182695, 0, -4.927419,
-3.343793, 0, -5.179995,
-3.182695, 1, -4.927419,
-3.343793, 1, -5.179995,
-3.182695, 2, -4.927419,
-3.343793, 2, -5.179995
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
-3.665989, -3, -5.685146, 0, -0.5, 0.5, 0.5,
-3.665989, -3, -5.685146, 1, -0.5, 0.5, 0.5,
-3.665989, -3, -5.685146, 1, 1.5, 0.5, 0.5,
-3.665989, -3, -5.685146, 0, 1.5, 0.5, 0.5,
-3.665989, -2, -5.685146, 0, -0.5, 0.5, 0.5,
-3.665989, -2, -5.685146, 1, -0.5, 0.5, 0.5,
-3.665989, -2, -5.685146, 1, 1.5, 0.5, 0.5,
-3.665989, -2, -5.685146, 0, 1.5, 0.5, 0.5,
-3.665989, -1, -5.685146, 0, -0.5, 0.5, 0.5,
-3.665989, -1, -5.685146, 1, -0.5, 0.5, 0.5,
-3.665989, -1, -5.685146, 1, 1.5, 0.5, 0.5,
-3.665989, -1, -5.685146, 0, 1.5, 0.5, 0.5,
-3.665989, 0, -5.685146, 0, -0.5, 0.5, 0.5,
-3.665989, 0, -5.685146, 1, -0.5, 0.5, 0.5,
-3.665989, 0, -5.685146, 1, 1.5, 0.5, 0.5,
-3.665989, 0, -5.685146, 0, 1.5, 0.5, 0.5,
-3.665989, 1, -5.685146, 0, -0.5, 0.5, 0.5,
-3.665989, 1, -5.685146, 1, -0.5, 0.5, 0.5,
-3.665989, 1, -5.685146, 1, 1.5, 0.5, 0.5,
-3.665989, 1, -5.685146, 0, 1.5, 0.5, 0.5,
-3.665989, 2, -5.685146, 0, -0.5, 0.5, 0.5,
-3.665989, 2, -5.685146, 1, -0.5, 0.5, 0.5,
-3.665989, 2, -5.685146, 1, 1.5, 0.5, 0.5,
-3.665989, 2, -5.685146, 0, 1.5, 0.5, 0.5
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
-3.182695, -3.497563, -4,
-3.182695, -3.497563, 4,
-3.182695, -3.497563, -4,
-3.343793, -3.651749, -4,
-3.182695, -3.497563, -2,
-3.343793, -3.651749, -2,
-3.182695, -3.497563, 0,
-3.343793, -3.651749, 0,
-3.182695, -3.497563, 2,
-3.343793, -3.651749, 2,
-3.182695, -3.497563, 4,
-3.343793, -3.651749, 4
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
-3.665989, -3.960119, -4, 0, -0.5, 0.5, 0.5,
-3.665989, -3.960119, -4, 1, -0.5, 0.5, 0.5,
-3.665989, -3.960119, -4, 1, 1.5, 0.5, 0.5,
-3.665989, -3.960119, -4, 0, 1.5, 0.5, 0.5,
-3.665989, -3.960119, -2, 0, -0.5, 0.5, 0.5,
-3.665989, -3.960119, -2, 1, -0.5, 0.5, 0.5,
-3.665989, -3.960119, -2, 1, 1.5, 0.5, 0.5,
-3.665989, -3.960119, -2, 0, 1.5, 0.5, 0.5,
-3.665989, -3.960119, 0, 0, -0.5, 0.5, 0.5,
-3.665989, -3.960119, 0, 1, -0.5, 0.5, 0.5,
-3.665989, -3.960119, 0, 1, 1.5, 0.5, 0.5,
-3.665989, -3.960119, 0, 0, 1.5, 0.5, 0.5,
-3.665989, -3.960119, 2, 0, -0.5, 0.5, 0.5,
-3.665989, -3.960119, 2, 1, -0.5, 0.5, 0.5,
-3.665989, -3.960119, 2, 1, 1.5, 0.5, 0.5,
-3.665989, -3.960119, 2, 0, 1.5, 0.5, 0.5,
-3.665989, -3.960119, 4, 0, -0.5, 0.5, 0.5,
-3.665989, -3.960119, 4, 1, -0.5, 0.5, 0.5,
-3.665989, -3.960119, 4, 1, 1.5, 0.5, 0.5,
-3.665989, -3.960119, 4, 0, 1.5, 0.5, 0.5
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
-3.182695, -3.497563, -4.927419,
-3.182695, 2.669844, -4.927419,
-3.182695, -3.497563, 5.175603,
-3.182695, 2.669844, 5.175603,
-3.182695, -3.497563, -4.927419,
-3.182695, -3.497563, 5.175603,
-3.182695, 2.669844, -4.927419,
-3.182695, 2.669844, 5.175603,
-3.182695, -3.497563, -4.927419,
3.261224, -3.497563, -4.927419,
-3.182695, -3.497563, 5.175603,
3.261224, -3.497563, 5.175603,
-3.182695, 2.669844, -4.927419,
3.261224, 2.669844, -4.927419,
-3.182695, 2.669844, 5.175603,
3.261224, 2.669844, 5.175603,
3.261224, -3.497563, -4.927419,
3.261224, 2.669844, -4.927419,
3.261224, -3.497563, 5.175603,
3.261224, 2.669844, 5.175603,
3.261224, -3.497563, -4.927419,
3.261224, -3.497563, 5.175603,
3.261224, 2.669844, -4.927419,
3.261224, 2.669844, 5.175603
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
var radius = 7.196506;
var distance = 32.01807;
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
mvMatrix.translate( -0.03926432, 0.4138598, -0.1240919 );
mvMatrix.scale( 1.207495, 1.261633, 0.770166 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.01807);
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
Terbacil<-read.table("Terbacil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Terbacil$V2
```

```
## Error in eval(expr, envir, enclos): object 'Terbacil' not found
```

```r
y<-Terbacil$V3
```

```
## Error in eval(expr, envir, enclos): object 'Terbacil' not found
```

```r
z<-Terbacil$V4
```

```
## Error in eval(expr, envir, enclos): object 'Terbacil' not found
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
-3.088852, 0.9973392, -1.190651, 0, 0, 1, 1, 1,
-2.69682, 0.7013438, -0.6874434, 1, 0, 0, 1, 1,
-2.595973, 0.3592468, -2.353468, 1, 0, 0, 1, 1,
-2.564422, -0.847753, -1.19764, 1, 0, 0, 1, 1,
-2.527809, 1.480224, -0.5013322, 1, 0, 0, 1, 1,
-2.418841, -0.1634368, -2.596316, 1, 0, 0, 1, 1,
-2.362133, 1.295385, -0.3998918, 0, 0, 0, 1, 1,
-2.350355, -0.5091738, 0.1294688, 0, 0, 0, 1, 1,
-2.307726, -1.819305, -1.768698, 0, 0, 0, 1, 1,
-2.258116, -0.0394129, -0.1941155, 0, 0, 0, 1, 1,
-2.243965, 0.4086906, -1.771374, 0, 0, 0, 1, 1,
-2.191934, -0.170766, -1.76658, 0, 0, 0, 1, 1,
-2.183056, -0.7994649, -0.1507845, 0, 0, 0, 1, 1,
-2.117706, 0.3131352, -1.403713, 1, 1, 1, 1, 1,
-2.109077, 1.156297, -0.9016764, 1, 1, 1, 1, 1,
-2.107964, -0.0996737, -0.9790689, 1, 1, 1, 1, 1,
-2.095419, -0.1144182, -2.137833, 1, 1, 1, 1, 1,
-2.079693, -1.015717, -1.943131, 1, 1, 1, 1, 1,
-2.053679, 1.373157, -0.9849908, 1, 1, 1, 1, 1,
-2.019424, 0.7294964, -0.6431941, 1, 1, 1, 1, 1,
-1.997169, 0.1640947, -1.486044, 1, 1, 1, 1, 1,
-1.955048, 0.3200598, -1.112503, 1, 1, 1, 1, 1,
-1.933355, -0.4439056, -0.7206483, 1, 1, 1, 1, 1,
-1.912727, 1.136428, -2.220937, 1, 1, 1, 1, 1,
-1.89718, 1.668658, -1.408069, 1, 1, 1, 1, 1,
-1.88285, 1.709861, -1.359618, 1, 1, 1, 1, 1,
-1.881936, -1.343881, -2.61596, 1, 1, 1, 1, 1,
-1.869624, -0.6618354, -1.335931, 1, 1, 1, 1, 1,
-1.861687, 0.09786241, -2.03847, 0, 0, 1, 1, 1,
-1.83286, 0.161031, -0.06128273, 1, 0, 0, 1, 1,
-1.816984, 0.3397479, -0.618457, 1, 0, 0, 1, 1,
-1.774838, 0.680086, -1.554876, 1, 0, 0, 1, 1,
-1.748275, 1.571981, -2.303497, 1, 0, 0, 1, 1,
-1.743656, -0.023743, -1.976264, 1, 0, 0, 1, 1,
-1.732059, 0.3082203, -0.3229629, 0, 0, 0, 1, 1,
-1.707099, 1.778845, -1.693514, 0, 0, 0, 1, 1,
-1.688455, 1.034937, -1.799973, 0, 0, 0, 1, 1,
-1.664945, -2.119671, -1.619866, 0, 0, 0, 1, 1,
-1.659645, -0.4275998, -2.93085, 0, 0, 0, 1, 1,
-1.649444, 0.5189025, -0.1904069, 0, 0, 0, 1, 1,
-1.641366, -1.644864, -1.827015, 0, 0, 0, 1, 1,
-1.62527, -0.3179493, -2.141371, 1, 1, 1, 1, 1,
-1.618793, -0.2094794, -2.447341, 1, 1, 1, 1, 1,
-1.615381, -0.5605916, -3.111921, 1, 1, 1, 1, 1,
-1.613303, -0.4229613, -3.113474, 1, 1, 1, 1, 1,
-1.604512, 0.5609174, -2.329314, 1, 1, 1, 1, 1,
-1.586701, -1.241732, -2.053709, 1, 1, 1, 1, 1,
-1.581571, 0.3526384, -0.4595577, 1, 1, 1, 1, 1,
-1.581066, 1.706086, -0.1141053, 1, 1, 1, 1, 1,
-1.551117, -1.336043, -0.9170331, 1, 1, 1, 1, 1,
-1.550246, 1.517962, 1.401697, 1, 1, 1, 1, 1,
-1.542499, 0.6320813, -2.299633, 1, 1, 1, 1, 1,
-1.539708, 0.05307126, -1.685794, 1, 1, 1, 1, 1,
-1.534207, 1.725485, 0.2026719, 1, 1, 1, 1, 1,
-1.517397, -0.2018222, -1.07506, 1, 1, 1, 1, 1,
-1.51265, -0.6083971, -1.121015, 1, 1, 1, 1, 1,
-1.494216, -0.2599513, -1.931041, 0, 0, 1, 1, 1,
-1.485651, 0.5472432, 1.369969, 1, 0, 0, 1, 1,
-1.476842, 0.9764969, -0.7231888, 1, 0, 0, 1, 1,
-1.463457, 1.373514, -0.07529297, 1, 0, 0, 1, 1,
-1.459822, -0.6329682, -1.024658, 1, 0, 0, 1, 1,
-1.457708, -1.490576, -4.370849, 1, 0, 0, 1, 1,
-1.455611, 0.5376863, -2.285842, 0, 0, 0, 1, 1,
-1.449561, -0.4705014, -3.070015, 0, 0, 0, 1, 1,
-1.427968, 1.224436, 1.222656, 0, 0, 0, 1, 1,
-1.425481, -1.399245, -2.486856, 0, 0, 0, 1, 1,
-1.424394, -0.5849659, -3.212338, 0, 0, 0, 1, 1,
-1.418531, -0.00704479, -1.294676, 0, 0, 0, 1, 1,
-1.415885, 0.456548, -2.8874, 0, 0, 0, 1, 1,
-1.415517, 1.152068, 0.09544994, 1, 1, 1, 1, 1,
-1.414482, 0.5752379, 1.320562, 1, 1, 1, 1, 1,
-1.409899, -0.042, -2.660617, 1, 1, 1, 1, 1,
-1.406637, -0.3461678, -1.865734, 1, 1, 1, 1, 1,
-1.403572, -1.311181, -2.793222, 1, 1, 1, 1, 1,
-1.386719, 0.2122893, -2.09896, 1, 1, 1, 1, 1,
-1.386242, 1.57848, 0.4625794, 1, 1, 1, 1, 1,
-1.341694, -1.216481, -1.836143, 1, 1, 1, 1, 1,
-1.33137, 0.371166, -2.78313, 1, 1, 1, 1, 1,
-1.327953, 0.1245544, -1.584344, 1, 1, 1, 1, 1,
-1.318019, 1.320703, 0.254546, 1, 1, 1, 1, 1,
-1.316945, -0.125147, -0.1008085, 1, 1, 1, 1, 1,
-1.312965, -0.4141266, -2.069381, 1, 1, 1, 1, 1,
-1.310065, -0.1051193, -3.317927, 1, 1, 1, 1, 1,
-1.299981, -1.500705, -3.800101, 1, 1, 1, 1, 1,
-1.286258, -0.9000539, -1.301737, 0, 0, 1, 1, 1,
-1.278813, -0.06208578, 0.1519527, 1, 0, 0, 1, 1,
-1.270586, 0.1298428, -3.060608, 1, 0, 0, 1, 1,
-1.262841, -0.4225411, -3.791179, 1, 0, 0, 1, 1,
-1.24184, 0.1599885, -1.317813, 1, 0, 0, 1, 1,
-1.241349, 0.1365662, -0.3770474, 1, 0, 0, 1, 1,
-1.229852, -0.6277727, -4.424303, 0, 0, 0, 1, 1,
-1.223979, 1.289845, 0.016291, 0, 0, 0, 1, 1,
-1.210501, -0.1318785, -1.663672, 0, 0, 0, 1, 1,
-1.201423, 1.096854, -2.268862, 0, 0, 0, 1, 1,
-1.199888, -0.9023781, -2.466707, 0, 0, 0, 1, 1,
-1.199871, -0.02311471, -1.789953, 0, 0, 0, 1, 1,
-1.195271, 0.003427577, -1.743155, 0, 0, 0, 1, 1,
-1.192688, -0.01773006, -2.420265, 1, 1, 1, 1, 1,
-1.186984, -2.081471, -1.124221, 1, 1, 1, 1, 1,
-1.18112, -0.7758024, -0.5247092, 1, 1, 1, 1, 1,
-1.174557, 0.04322667, -0.4598834, 1, 1, 1, 1, 1,
-1.172228, 0.2437311, -1.573285, 1, 1, 1, 1, 1,
-1.166976, 0.7624217, -2.375783, 1, 1, 1, 1, 1,
-1.158994, 1.139551, -2.557178, 1, 1, 1, 1, 1,
-1.158736, 1.43888, -0.2950323, 1, 1, 1, 1, 1,
-1.154629, 0.5174248, -0.1821329, 1, 1, 1, 1, 1,
-1.150599, -1.097192, -2.681643, 1, 1, 1, 1, 1,
-1.147831, 1.122674, -2.897544, 1, 1, 1, 1, 1,
-1.147272, -0.09404086, -1.524467, 1, 1, 1, 1, 1,
-1.146488, 0.752767, -0.06171542, 1, 1, 1, 1, 1,
-1.143926, -0.9067532, -4.325424, 1, 1, 1, 1, 1,
-1.130577, 0.0854144, -2.924076, 1, 1, 1, 1, 1,
-1.128861, -0.2071552, -0.3373134, 0, 0, 1, 1, 1,
-1.124837, 0.5123222, -1.742653, 1, 0, 0, 1, 1,
-1.123872, -0.8767213, -1.395933, 1, 0, 0, 1, 1,
-1.121546, 0.8354399, -0.1176302, 1, 0, 0, 1, 1,
-1.118328, -0.5006548, -2.537123, 1, 0, 0, 1, 1,
-1.111555, -0.9148746, -1.447309, 1, 0, 0, 1, 1,
-1.101555, 0.7290992, 0.3412687, 0, 0, 0, 1, 1,
-1.099921, 0.269439, -0.6083721, 0, 0, 0, 1, 1,
-1.098716, 1.400555, -1.962587, 0, 0, 0, 1, 1,
-1.09233, 1.348471, 1.680466, 0, 0, 0, 1, 1,
-1.089774, 0.4590001, -1.509532, 0, 0, 0, 1, 1,
-1.089132, 0.242292, -0.4252028, 0, 0, 0, 1, 1,
-1.083653, 0.192036, -2.39567, 0, 0, 0, 1, 1,
-1.082654, 0.02465876, -2.515304, 1, 1, 1, 1, 1,
-1.080191, 1.51953, -1.150491, 1, 1, 1, 1, 1,
-1.075633, 1.888743, -1.367588, 1, 1, 1, 1, 1,
-1.072672, 0.4882515, -0.8479981, 1, 1, 1, 1, 1,
-1.070402, 1.386427, 0.06319303, 1, 1, 1, 1, 1,
-1.069776, -1.372227, -1.291342, 1, 1, 1, 1, 1,
-1.063609, 1.337426, -0.561668, 1, 1, 1, 1, 1,
-1.060951, 0.2074876, -0.6751653, 1, 1, 1, 1, 1,
-1.057999, -2.055307, -3.372462, 1, 1, 1, 1, 1,
-1.05353, 0.9822232, -0.3377968, 1, 1, 1, 1, 1,
-1.04215, -0.1651155, -1.209794, 1, 1, 1, 1, 1,
-1.031375, -0.5409847, -0.4579706, 1, 1, 1, 1, 1,
-1.023313, 0.6656136, 0.07305314, 1, 1, 1, 1, 1,
-1.020981, -0.08278921, -2.94047, 1, 1, 1, 1, 1,
-1.018715, -0.2077517, -2.146538, 1, 1, 1, 1, 1,
-0.9951335, -0.9378509, -2.622633, 0, 0, 1, 1, 1,
-0.9907418, -1.070727, -2.908218, 1, 0, 0, 1, 1,
-0.9773425, 0.6133732, -2.077051, 1, 0, 0, 1, 1,
-0.9758864, 0.4772062, -1.251206, 1, 0, 0, 1, 1,
-0.9749814, -0.07739455, -2.391883, 1, 0, 0, 1, 1,
-0.9722559, 1.632738, -1.232494, 1, 0, 0, 1, 1,
-0.967496, 0.9660932, -0.4850211, 0, 0, 0, 1, 1,
-0.9669592, 0.2678962, -1.641118, 0, 0, 0, 1, 1,
-0.9630142, 1.358144, -3.029301, 0, 0, 0, 1, 1,
-0.9604084, 0.5962444, 0.2945854, 0, 0, 0, 1, 1,
-0.9500633, 0.1948198, -0.06377532, 0, 0, 0, 1, 1,
-0.9423489, -1.122835, -2.113981, 0, 0, 0, 1, 1,
-0.9406897, 1.412597, -1.739165, 0, 0, 0, 1, 1,
-0.9373325, -0.7300768, -2.915687, 1, 1, 1, 1, 1,
-0.9340916, 1.88793, 0.1313398, 1, 1, 1, 1, 1,
-0.9313625, 1.314281, 0.7804223, 1, 1, 1, 1, 1,
-0.9243467, 0.293431, -1.818931, 1, 1, 1, 1, 1,
-0.920311, 0.3954466, -0.1607706, 1, 1, 1, 1, 1,
-0.9152456, -0.1666514, -2.033503, 1, 1, 1, 1, 1,
-0.9134418, 0.3100134, -1.964995, 1, 1, 1, 1, 1,
-0.9095321, -0.07864408, -2.073773, 1, 1, 1, 1, 1,
-0.9055373, 1.12949, -4.406322, 1, 1, 1, 1, 1,
-0.9054241, -0.3915451, 0.1096651, 1, 1, 1, 1, 1,
-0.8973835, -0.2583645, -1.657945, 1, 1, 1, 1, 1,
-0.8880934, -0.2646182, -1.036577, 1, 1, 1, 1, 1,
-0.8859817, -0.458914, -1.221882, 1, 1, 1, 1, 1,
-0.885181, 0.9052289, -1.00871, 1, 1, 1, 1, 1,
-0.8802447, 0.1281151, -3.007216, 1, 1, 1, 1, 1,
-0.872625, 0.2183565, -0.3087748, 0, 0, 1, 1, 1,
-0.8725233, -0.4832256, -2.179693, 1, 0, 0, 1, 1,
-0.8718745, 0.1102707, -1.411168, 1, 0, 0, 1, 1,
-0.8698915, 1.016561, -0.1607175, 1, 0, 0, 1, 1,
-0.8698134, 0.09041959, -0.6784195, 1, 0, 0, 1, 1,
-0.8683203, 0.06726437, -1.46014, 1, 0, 0, 1, 1,
-0.8633352, 1.377783, -0.2360529, 0, 0, 0, 1, 1,
-0.8580925, -1.274041, -3.294551, 0, 0, 0, 1, 1,
-0.8579923, -1.284528, -1.898259, 0, 0, 0, 1, 1,
-0.8575099, 0.02951301, -1.507, 0, 0, 0, 1, 1,
-0.8476691, -0.2838902, 0.1507367, 0, 0, 0, 1, 1,
-0.8469095, 0.4413401, -2.252915, 0, 0, 0, 1, 1,
-0.838151, 0.5908428, -0.5043476, 0, 0, 0, 1, 1,
-0.8353379, -0.5093353, -1.707308, 1, 1, 1, 1, 1,
-0.833368, -1.166469, -1.549625, 1, 1, 1, 1, 1,
-0.8307061, -1.388388, -4.780288, 1, 1, 1, 1, 1,
-0.8266192, 0.06374442, -1.824299, 1, 1, 1, 1, 1,
-0.8231069, -0.412027, -2.889647, 1, 1, 1, 1, 1,
-0.8188718, -0.3629473, -2.301597, 1, 1, 1, 1, 1,
-0.8176422, 0.5541754, -1.251324, 1, 1, 1, 1, 1,
-0.8164232, -0.1557643, -1.375482, 1, 1, 1, 1, 1,
-0.8144648, 0.6798477, 0.3208005, 1, 1, 1, 1, 1,
-0.8117779, 0.09797362, 0.2645666, 1, 1, 1, 1, 1,
-0.8100765, 1.719181, 1.064614, 1, 1, 1, 1, 1,
-0.8087102, 0.455258, -1.235701, 1, 1, 1, 1, 1,
-0.8062088, -0.3118035, -2.06833, 1, 1, 1, 1, 1,
-0.8051357, 1.416258, 0.09652375, 1, 1, 1, 1, 1,
-0.8027089, -0.315661, -0.3874536, 1, 1, 1, 1, 1,
-0.7989493, -0.4398447, -1.170053, 0, 0, 1, 1, 1,
-0.793568, -1.006576, -0.4817515, 1, 0, 0, 1, 1,
-0.7895486, 0.2681476, -1.45124, 1, 0, 0, 1, 1,
-0.7852471, 0.03506184, -1.388618, 1, 0, 0, 1, 1,
-0.7842453, -2.321779, -3.835734, 1, 0, 0, 1, 1,
-0.777533, -1.266066, -3.231157, 1, 0, 0, 1, 1,
-0.7754791, 0.1730931, -2.220788, 0, 0, 0, 1, 1,
-0.7736299, 0.1343017, -0.6947379, 0, 0, 0, 1, 1,
-0.7714209, -0.05435275, -0.4993117, 0, 0, 0, 1, 1,
-0.7713472, -1.139359, -3.510681, 0, 0, 0, 1, 1,
-0.7712977, 0.3428777, -0.2738821, 0, 0, 0, 1, 1,
-0.7698562, -0.259065, -3.699024, 0, 0, 0, 1, 1,
-0.7684069, -0.6770884, -2.518552, 0, 0, 0, 1, 1,
-0.7641819, -0.4194691, -1.103925, 1, 1, 1, 1, 1,
-0.7620703, 0.2126825, -0.9833925, 1, 1, 1, 1, 1,
-0.7597476, -0.4162979, -3.188407, 1, 1, 1, 1, 1,
-0.759233, -0.3039238, -1.401532, 1, 1, 1, 1, 1,
-0.7534753, 0.6663277, 1.250074, 1, 1, 1, 1, 1,
-0.7524663, -0.005794652, -2.222848, 1, 1, 1, 1, 1,
-0.7468318, -0.1388115, -2.037485, 1, 1, 1, 1, 1,
-0.7459969, 0.2145628, -2.393854, 1, 1, 1, 1, 1,
-0.7405796, 0.02240401, -1.978464, 1, 1, 1, 1, 1,
-0.7280936, 1.037597, -1.181149, 1, 1, 1, 1, 1,
-0.7265571, 1.32329, -0.7851235, 1, 1, 1, 1, 1,
-0.7196203, 0.4811907, -1.467738, 1, 1, 1, 1, 1,
-0.7193256, -0.86718, -1.373629, 1, 1, 1, 1, 1,
-0.7172023, 1.309718, 0.9439129, 1, 1, 1, 1, 1,
-0.71417, 1.613625, -0.3594685, 1, 1, 1, 1, 1,
-0.7141114, -0.8319299, -3.299273, 0, 0, 1, 1, 1,
-0.708397, -0.7249151, -3.071498, 1, 0, 0, 1, 1,
-0.7054802, -1.211682, -3.324898, 1, 0, 0, 1, 1,
-0.7052101, -0.1062375, -1.112198, 1, 0, 0, 1, 1,
-0.6995336, -0.800887, -2.946791, 1, 0, 0, 1, 1,
-0.6994708, 0.4201303, -0.3081042, 1, 0, 0, 1, 1,
-0.699456, -1.506081, -1.583657, 0, 0, 0, 1, 1,
-0.6992533, 1.214473, -1.171978, 0, 0, 0, 1, 1,
-0.6979815, 2.003329, 0.01284886, 0, 0, 0, 1, 1,
-0.6975859, 0.7129307, -1.027426, 0, 0, 0, 1, 1,
-0.6963446, -1.33216, -3.038335, 0, 0, 0, 1, 1,
-0.690244, -1.389096, -2.387135, 0, 0, 0, 1, 1,
-0.6893955, -0.8052841, -1.181176, 0, 0, 0, 1, 1,
-0.6866944, -1.051238, -1.717789, 1, 1, 1, 1, 1,
-0.6861866, -0.7059711, -0.06762222, 1, 1, 1, 1, 1,
-0.6833838, 0.5801342, -1.056994, 1, 1, 1, 1, 1,
-0.680803, -0.4562634, -2.48922, 1, 1, 1, 1, 1,
-0.6805434, 0.05874097, -2.847986, 1, 1, 1, 1, 1,
-0.6753192, 0.7568865, 0.6080118, 1, 1, 1, 1, 1,
-0.673548, -0.8297017, -3.747542, 1, 1, 1, 1, 1,
-0.6729414, -0.4324031, -3.241846, 1, 1, 1, 1, 1,
-0.6695107, 0.28688, -1.08315, 1, 1, 1, 1, 1,
-0.6690627, 1.278958, -0.5920085, 1, 1, 1, 1, 1,
-0.6590491, -0.7339219, -2.028431, 1, 1, 1, 1, 1,
-0.6483845, -3.407747, -3.753669, 1, 1, 1, 1, 1,
-0.637499, 0.4849287, -0.7244365, 1, 1, 1, 1, 1,
-0.6351859, -0.3720054, -1.207012, 1, 1, 1, 1, 1,
-0.6314081, 1.512952, -1.377021, 1, 1, 1, 1, 1,
-0.6283988, -0.6623819, -4.054985, 0, 0, 1, 1, 1,
-0.6260194, -1.415298, -2.3882, 1, 0, 0, 1, 1,
-0.6252332, 0.3027275, -2.913974, 1, 0, 0, 1, 1,
-0.6249959, 1.043941, -0.1786007, 1, 0, 0, 1, 1,
-0.6181754, -1.680439, -1.396377, 1, 0, 0, 1, 1,
-0.6181312, -0.8451034, -1.970855, 1, 0, 0, 1, 1,
-0.6179791, 2.554739, -2.088823, 0, 0, 0, 1, 1,
-0.6160393, 1.303165, -1.599358, 0, 0, 0, 1, 1,
-0.6136454, -0.2947156, -3.872027, 0, 0, 0, 1, 1,
-0.6067859, 1.49168, -0.09830156, 0, 0, 0, 1, 1,
-0.6041756, 0.4830214, -0.9060606, 0, 0, 0, 1, 1,
-0.5991207, 1.467829, -0.7614375, 0, 0, 0, 1, 1,
-0.5831095, 2.205103, -0.6501074, 0, 0, 0, 1, 1,
-0.5828383, 0.7956249, -1.209124, 1, 1, 1, 1, 1,
-0.5824495, 1.210457, -0.9676201, 1, 1, 1, 1, 1,
-0.5761979, 1.261767, 1.176346, 1, 1, 1, 1, 1,
-0.5717531, 0.7648993, -0.5842503, 1, 1, 1, 1, 1,
-0.568676, 1.402392, -1.379748, 1, 1, 1, 1, 1,
-0.5680354, -0.5254745, -2.243587, 1, 1, 1, 1, 1,
-0.5658575, 1.401402, -0.6292466, 1, 1, 1, 1, 1,
-0.5631641, -0.8285006, -3.989182, 1, 1, 1, 1, 1,
-0.5623169, -1.221398, -2.447543, 1, 1, 1, 1, 1,
-0.5596555, -0.4195436, -2.225426, 1, 1, 1, 1, 1,
-0.554508, -1.078547, -1.806676, 1, 1, 1, 1, 1,
-0.5472001, 1.155525, 0.08054492, 1, 1, 1, 1, 1,
-0.5427437, 0.4605486, -0.8426607, 1, 1, 1, 1, 1,
-0.5426438, -0.5791988, -1.947755, 1, 1, 1, 1, 1,
-0.5421331, 1.710913, 0.4255801, 1, 1, 1, 1, 1,
-0.5420666, -1.317273, -3.552479, 0, 0, 1, 1, 1,
-0.5390495, 0.6476021, 0.3694797, 1, 0, 0, 1, 1,
-0.5368867, 0.5728518, -0.06278267, 1, 0, 0, 1, 1,
-0.53598, -0.3553922, -1.21964, 1, 0, 0, 1, 1,
-0.5319499, 0.9512928, -0.3723382, 1, 0, 0, 1, 1,
-0.5314535, 1.433461, -0.1191464, 1, 0, 0, 1, 1,
-0.5266841, 0.4064248, -1.148187, 0, 0, 0, 1, 1,
-0.5252848, 0.7226179, 0.4693193, 0, 0, 0, 1, 1,
-0.5241784, -0.4657051, -2.264811, 0, 0, 0, 1, 1,
-0.5228022, 0.6129425, -2.473385, 0, 0, 0, 1, 1,
-0.5216089, 0.2090789, 1.142486, 0, 0, 0, 1, 1,
-0.5200728, -0.002613918, 0.1608918, 0, 0, 0, 1, 1,
-0.5195726, 1.177405, -2.407785, 0, 0, 0, 1, 1,
-0.5110964, 0.7457379, 0.4918601, 1, 1, 1, 1, 1,
-0.5050487, -0.7954437, -1.652576, 1, 1, 1, 1, 1,
-0.504685, 1.270344, 0.6310642, 1, 1, 1, 1, 1,
-0.5044839, -0.6664824, -3.701831, 1, 1, 1, 1, 1,
-0.5038704, 0.7265959, -0.1184734, 1, 1, 1, 1, 1,
-0.5033075, -0.5578545, -4.591329, 1, 1, 1, 1, 1,
-0.496318, 0.4496888, 1.535587, 1, 1, 1, 1, 1,
-0.4953445, -0.4641483, -0.7481751, 1, 1, 1, 1, 1,
-0.4928339, -1.056099, -3.326133, 1, 1, 1, 1, 1,
-0.4899862, -0.01215171, -1.338545, 1, 1, 1, 1, 1,
-0.4868903, 1.248914, 1.771577, 1, 1, 1, 1, 1,
-0.4868896, -0.3735185, -2.809953, 1, 1, 1, 1, 1,
-0.4859744, 0.4701397, -1.110949, 1, 1, 1, 1, 1,
-0.4850837, -1.311829, -2.553185, 1, 1, 1, 1, 1,
-0.4816367, -0.4363808, -2.650859, 1, 1, 1, 1, 1,
-0.4778576, -0.3502334, -1.125119, 0, 0, 1, 1, 1,
-0.4736623, 0.9737437, -0.4574378, 1, 0, 0, 1, 1,
-0.4728138, 1.376802, -1.609657, 1, 0, 0, 1, 1,
-0.470768, 0.4201361, -2.218946, 1, 0, 0, 1, 1,
-0.469404, 0.5345833, -1.503801, 1, 0, 0, 1, 1,
-0.4671578, -1.40739, -2.201615, 1, 0, 0, 1, 1,
-0.4589001, 1.098839, -0.1422029, 0, 0, 0, 1, 1,
-0.4580388, 0.3858928, -0.9211725, 0, 0, 0, 1, 1,
-0.4573805, -0.5442919, -2.198526, 0, 0, 0, 1, 1,
-0.4567563, -0.08749858, -2.718042, 0, 0, 0, 1, 1,
-0.4558324, -1.055614, -1.907771, 0, 0, 0, 1, 1,
-0.4512528, -0.110667, -2.721438, 0, 0, 0, 1, 1,
-0.4501563, -1.172908, -1.88755, 0, 0, 0, 1, 1,
-0.4500004, 0.3094723, -1.671486, 1, 1, 1, 1, 1,
-0.4490762, 0.7717748, -1.778544, 1, 1, 1, 1, 1,
-0.4420059, 0.7355824, -1.114952, 1, 1, 1, 1, 1,
-0.4399456, 0.2383815, -1.426047, 1, 1, 1, 1, 1,
-0.4362385, -0.08967516, -0.4223803, 1, 1, 1, 1, 1,
-0.4317302, 0.7256904, -1.504391, 1, 1, 1, 1, 1,
-0.4300515, 1.122928, 0.3922043, 1, 1, 1, 1, 1,
-0.4295299, -0.1829008, -2.239687, 1, 1, 1, 1, 1,
-0.4290302, -1.146796, -1.96694, 1, 1, 1, 1, 1,
-0.4280693, -2.358414, -3.862345, 1, 1, 1, 1, 1,
-0.4275967, -0.3499549, -0.8474199, 1, 1, 1, 1, 1,
-0.4222677, -1.024405, -2.110229, 1, 1, 1, 1, 1,
-0.4177415, -1.222173, -3.073078, 1, 1, 1, 1, 1,
-0.4161652, -1.406336, -3.790274, 1, 1, 1, 1, 1,
-0.4146971, 0.5148986, 0.2890058, 1, 1, 1, 1, 1,
-0.413601, 1.264265, -1.192303, 0, 0, 1, 1, 1,
-0.410911, 0.6028391, -1.259063, 1, 0, 0, 1, 1,
-0.4106146, -0.1086269, -1.913624, 1, 0, 0, 1, 1,
-0.4084025, 1.251326, 0.2843525, 1, 0, 0, 1, 1,
-0.4045528, 0.9166775, 0.6525567, 1, 0, 0, 1, 1,
-0.4001542, 2.371777, 0.6751981, 1, 0, 0, 1, 1,
-0.3968867, 0.3290814, -1.184065, 0, 0, 0, 1, 1,
-0.3958011, -0.8421795, -1.74108, 0, 0, 0, 1, 1,
-0.3878415, -1.634676, -4.108469, 0, 0, 0, 1, 1,
-0.3870812, -0.8391696, -3.035545, 0, 0, 0, 1, 1,
-0.3867112, 0.4373737, -0.6575869, 0, 0, 0, 1, 1,
-0.3850955, 0.8092762, 0.4517991, 0, 0, 0, 1, 1,
-0.3791716, 0.4678189, -1.220701, 0, 0, 0, 1, 1,
-0.3755146, -0.01766148, -2.238457, 1, 1, 1, 1, 1,
-0.3695188, -2.03035, -0.7000067, 1, 1, 1, 1, 1,
-0.3662562, -0.2795714, -1.363036, 1, 1, 1, 1, 1,
-0.3653664, -0.035053, -2.115516, 1, 1, 1, 1, 1,
-0.3592249, -0.5958339, -3.518075, 1, 1, 1, 1, 1,
-0.3547682, 1.242274, 0.1648273, 1, 1, 1, 1, 1,
-0.3481089, -1.000628, -2.230307, 1, 1, 1, 1, 1,
-0.347212, -0.1065759, -1.201222, 1, 1, 1, 1, 1,
-0.3462799, -0.664714, -2.435918, 1, 1, 1, 1, 1,
-0.3459426, -0.2621958, -2.855131, 1, 1, 1, 1, 1,
-0.3446751, 0.4839996, 0.219173, 1, 1, 1, 1, 1,
-0.3441176, 0.97989, -0.02891054, 1, 1, 1, 1, 1,
-0.3438657, 0.5742499, 0.8696916, 1, 1, 1, 1, 1,
-0.3399151, -0.2497193, -2.615081, 1, 1, 1, 1, 1,
-0.3305756, -0.8542241, -2.808788, 1, 1, 1, 1, 1,
-0.3277554, -0.5159677, -1.58077, 0, 0, 1, 1, 1,
-0.3252202, -0.7280557, -2.800468, 1, 0, 0, 1, 1,
-0.3225946, -0.2112503, -2.091156, 1, 0, 0, 1, 1,
-0.3222317, -0.7218705, -4.22074, 1, 0, 0, 1, 1,
-0.3168073, 1.066807, 0.01750445, 1, 0, 0, 1, 1,
-0.316494, -2.096285, -3.484711, 1, 0, 0, 1, 1,
-0.3120494, -1.854776, -3.111269, 0, 0, 0, 1, 1,
-0.3082853, 0.1814685, -2.037873, 0, 0, 0, 1, 1,
-0.3081184, 0.7751432, -0.8561264, 0, 0, 0, 1, 1,
-0.3053331, 1.735278, 1.824167, 0, 0, 0, 1, 1,
-0.3044441, 0.003596285, -2.115697, 0, 0, 0, 1, 1,
-0.3040173, 1.513058, 1.178482, 0, 0, 0, 1, 1,
-0.3020608, 0.09051239, -0.9373379, 0, 0, 0, 1, 1,
-0.2988224, -0.883404, -3.884987, 1, 1, 1, 1, 1,
-0.293575, 1.226305, 0.7091932, 1, 1, 1, 1, 1,
-0.2930719, 1.336293, -1.528951, 1, 1, 1, 1, 1,
-0.289891, 0.4417524, -1.054093, 1, 1, 1, 1, 1,
-0.288473, -1.383222, -3.800697, 1, 1, 1, 1, 1,
-0.2818578, -0.684056, -3.800497, 1, 1, 1, 1, 1,
-0.2809809, 0.1312381, -1.458103, 1, 1, 1, 1, 1,
-0.2803652, -0.4388261, -2.551858, 1, 1, 1, 1, 1,
-0.2793601, 1.694613, -1.433629, 1, 1, 1, 1, 1,
-0.2789111, 0.748385, -0.4482908, 1, 1, 1, 1, 1,
-0.2788981, -0.7563855, -3.797756, 1, 1, 1, 1, 1,
-0.2680961, 0.489038, -0.543785, 1, 1, 1, 1, 1,
-0.2668439, 0.9202706, -2.729626, 1, 1, 1, 1, 1,
-0.2652331, -0.1069644, -1.539599, 1, 1, 1, 1, 1,
-0.2651135, -0.05011358, -0.5819281, 1, 1, 1, 1, 1,
-0.2646686, 0.5901659, -0.2223097, 0, 0, 1, 1, 1,
-0.2633848, -0.03802416, -2.537534, 1, 0, 0, 1, 1,
-0.2609708, 0.00398106, -3.24808, 1, 0, 0, 1, 1,
-0.2598373, -0.8943724, -2.420451, 1, 0, 0, 1, 1,
-0.2583944, 0.0898988, 0.6099489, 1, 0, 0, 1, 1,
-0.2534045, -1.02176, -3.752456, 1, 0, 0, 1, 1,
-0.252139, -0.3955591, -2.972484, 0, 0, 0, 1, 1,
-0.24842, 1.111015, -0.3306725, 0, 0, 0, 1, 1,
-0.2460963, -1.253487, -2.325334, 0, 0, 0, 1, 1,
-0.2431075, -1.283835, -1.433563, 0, 0, 0, 1, 1,
-0.240737, 0.3013822, -1.276582, 0, 0, 0, 1, 1,
-0.2393095, 1.023221, 0.6564731, 0, 0, 0, 1, 1,
-0.2327635, 0.02656434, -1.376143, 0, 0, 0, 1, 1,
-0.2324449, -0.7458042, -3.544838, 1, 1, 1, 1, 1,
-0.2318096, -0.3445955, -3.514434, 1, 1, 1, 1, 1,
-0.2314806, -0.1911168, -2.60774, 1, 1, 1, 1, 1,
-0.2264876, -0.180084, -3.927043, 1, 1, 1, 1, 1,
-0.2258955, 0.9676362, 0.8134952, 1, 1, 1, 1, 1,
-0.2253175, -0.4451005, -3.143291, 1, 1, 1, 1, 1,
-0.2199318, 1.291539, -0.2113829, 1, 1, 1, 1, 1,
-0.2199052, -0.4636896, -1.489108, 1, 1, 1, 1, 1,
-0.2198956, 1.948105, 0.841334, 1, 1, 1, 1, 1,
-0.2166734, -0.6292548, -2.067975, 1, 1, 1, 1, 1,
-0.2165841, 1.957065, 0.5673529, 1, 1, 1, 1, 1,
-0.2128216, -0.01917288, -1.957104, 1, 1, 1, 1, 1,
-0.2124648, 0.2193881, 0.9506666, 1, 1, 1, 1, 1,
-0.2115187, -0.003705451, -0.05072608, 1, 1, 1, 1, 1,
-0.2072062, -0.1826975, -2.014048, 1, 1, 1, 1, 1,
-0.2036708, -0.366431, -2.900795, 0, 0, 1, 1, 1,
-0.1996045, -0.2427682, -1.300543, 1, 0, 0, 1, 1,
-0.1991168, -0.5877236, -4.116752, 1, 0, 0, 1, 1,
-0.1942412, 0.7223264, 1.479362, 1, 0, 0, 1, 1,
-0.1897752, 0.5335715, -0.2393065, 1, 0, 0, 1, 1,
-0.1862341, -1.487901, -2.355708, 1, 0, 0, 1, 1,
-0.1848799, -0.5111238, -2.577681, 0, 0, 0, 1, 1,
-0.1836194, 1.400572, 0.5586342, 0, 0, 0, 1, 1,
-0.1814977, -0.4675191, -4.63973, 0, 0, 0, 1, 1,
-0.1794718, -1.00827, -4.526617, 0, 0, 0, 1, 1,
-0.1777235, -0.2049174, -2.363057, 0, 0, 0, 1, 1,
-0.1760466, 0.1655318, -2.707059, 0, 0, 0, 1, 1,
-0.1743435, 1.970811, 0.2299569, 0, 0, 0, 1, 1,
-0.1725499, 0.6248544, 0.4780287, 1, 1, 1, 1, 1,
-0.1713392, -1.642219, -3.455457, 1, 1, 1, 1, 1,
-0.1669045, -0.9432039, -3.213474, 1, 1, 1, 1, 1,
-0.1652826, -0.6979423, -0.9414783, 1, 1, 1, 1, 1,
-0.163347, 0.1145138, -1.023563, 1, 1, 1, 1, 1,
-0.1611349, 1.080037, -0.3498, 1, 1, 1, 1, 1,
-0.1591551, -0.8678043, -2.873412, 1, 1, 1, 1, 1,
-0.1522924, -0.7474619, -2.395519, 1, 1, 1, 1, 1,
-0.1419099, 0.3458426, -1.546003, 1, 1, 1, 1, 1,
-0.1402597, -0.3016523, -2.397471, 1, 1, 1, 1, 1,
-0.135959, -0.4290178, -1.100751, 1, 1, 1, 1, 1,
-0.1343516, 0.3467532, -0.2452647, 1, 1, 1, 1, 1,
-0.1323787, 1.544377, -0.7138705, 1, 1, 1, 1, 1,
-0.1320256, -1.082019, -3.956164, 1, 1, 1, 1, 1,
-0.1298744, -0.3611983, -2.775838, 1, 1, 1, 1, 1,
-0.1286392, 0.7428281, 0.358447, 0, 0, 1, 1, 1,
-0.127579, 0.7427753, -0.09375657, 1, 0, 0, 1, 1,
-0.1250521, 0.2993054, -1.06283, 1, 0, 0, 1, 1,
-0.1246799, 2.23167, 0.5477942, 1, 0, 0, 1, 1,
-0.1239723, 0.7725117, 1.404538, 1, 0, 0, 1, 1,
-0.1230529, 1.38657, 0.0117285, 1, 0, 0, 1, 1,
-0.1224197, -1.222342, -3.243599, 0, 0, 0, 1, 1,
-0.1196037, -0.4011573, -3.164125, 0, 0, 0, 1, 1,
-0.1185156, -0.1282143, -3.294186, 0, 0, 0, 1, 1,
-0.1169722, -0.7829562, -2.864643, 0, 0, 0, 1, 1,
-0.1132426, 0.006975751, -2.235904, 0, 0, 0, 1, 1,
-0.1117459, 0.2854319, -0.1438269, 0, 0, 0, 1, 1,
-0.1116752, -0.1740398, -2.471119, 0, 0, 0, 1, 1,
-0.1106196, -0.8592755, -3.146958, 1, 1, 1, 1, 1,
-0.1104978, -2.360632, -4.363379, 1, 1, 1, 1, 1,
-0.1032118, 0.3983132, -0.3081995, 1, 1, 1, 1, 1,
-0.100104, -1.20876, -2.962381, 1, 1, 1, 1, 1,
-0.09828182, -1.512124, -2.010553, 1, 1, 1, 1, 1,
-0.09813949, 0.6156456, -0.6538838, 1, 1, 1, 1, 1,
-0.09799522, 0.6812373, 0.2960488, 1, 1, 1, 1, 1,
-0.09785397, 0.6820704, -1.283208, 1, 1, 1, 1, 1,
-0.097231, 1.29989, 0.05136937, 1, 1, 1, 1, 1,
-0.09218359, -0.4537577, -2.317391, 1, 1, 1, 1, 1,
-0.08174742, 0.3382702, -1.353939, 1, 1, 1, 1, 1,
-0.07773453, 0.9651642, 0.06532744, 1, 1, 1, 1, 1,
-0.07202023, 0.1534762, -0.4627452, 1, 1, 1, 1, 1,
-0.07093773, 1.438916, 0.7101141, 1, 1, 1, 1, 1,
-0.06820928, 0.04430513, -0.2042868, 1, 1, 1, 1, 1,
-0.0670902, -1.158987, -3.333008, 0, 0, 1, 1, 1,
-0.06700093, 1.852551, 0.8045189, 1, 0, 0, 1, 1,
-0.06472833, -1.090559, -3.064851, 1, 0, 0, 1, 1,
-0.06231346, 0.298911, -0.1429842, 1, 0, 0, 1, 1,
-0.06091269, 0.7878913, 0.7483181, 1, 0, 0, 1, 1,
-0.06058668, 0.3250044, 1.066303, 1, 0, 0, 1, 1,
-0.05408074, 0.504876, -0.4939599, 0, 0, 0, 1, 1,
-0.05126316, -0.7225074, -2.377652, 0, 0, 0, 1, 1,
-0.05113469, -0.6203867, -1.448685, 0, 0, 0, 1, 1,
-0.04851059, 0.2469241, 0.7796973, 0, 0, 0, 1, 1,
-0.04809709, -1.46682, -2.050416, 0, 0, 0, 1, 1,
-0.04799105, -2.254527, -3.318483, 0, 0, 0, 1, 1,
-0.043986, -1.302068, -3.826366, 0, 0, 0, 1, 1,
-0.03577624, 0.9460025, 0.03490822, 1, 1, 1, 1, 1,
-0.0333482, -0.5789326, -2.179544, 1, 1, 1, 1, 1,
-0.03101932, 1.117538, -0.1313479, 1, 1, 1, 1, 1,
-0.0306019, -1.906349, -2.001911, 1, 1, 1, 1, 1,
-0.02946682, 0.08997699, -1.123232, 1, 1, 1, 1, 1,
-0.02904591, -0.3597937, -1.809962, 1, 1, 1, 1, 1,
-0.0288197, 0.6106796, -0.2721576, 1, 1, 1, 1, 1,
-0.02827865, 0.8239073, 1.397807, 1, 1, 1, 1, 1,
-0.02788507, 1.032249, 0.738575, 1, 1, 1, 1, 1,
-0.0276728, 0.9042103, -0.7226396, 1, 1, 1, 1, 1,
-0.02626633, -0.1351246, -3.204073, 1, 1, 1, 1, 1,
-0.02454217, -0.6266785, -2.380892, 1, 1, 1, 1, 1,
-0.0181335, 0.1850163, -1.573723, 1, 1, 1, 1, 1,
-0.0138621, -1.998711, -3.232357, 1, 1, 1, 1, 1,
-0.01322639, -0.6259301, -1.889287, 1, 1, 1, 1, 1,
-0.01289142, -0.3637717, -3.768934, 0, 0, 1, 1, 1,
-0.0111778, -0.2015522, -2.695765, 1, 0, 0, 1, 1,
-0.01112814, -0.491668, -3.768279, 1, 0, 0, 1, 1,
-0.008353846, -0.5608255, -2.518356, 1, 0, 0, 1, 1,
-0.006983417, -1.75494, -2.027872, 1, 0, 0, 1, 1,
-0.006856711, -0.01867378, -1.759935, 1, 0, 0, 1, 1,
-0.004647735, 0.2424625, -1.128041, 0, 0, 0, 1, 1,
0.002096753, -1.257131, 2.974569, 0, 0, 0, 1, 1,
0.003619478, -0.7907419, 2.376461, 0, 0, 0, 1, 1,
0.007475327, 0.5595173, -0.4605529, 0, 0, 0, 1, 1,
0.007700094, -0.3534277, 4.328437, 0, 0, 0, 1, 1,
0.01092781, 1.185324, 0.9995281, 0, 0, 0, 1, 1,
0.01587915, 1.279179, 0.05323892, 0, 0, 0, 1, 1,
0.01610093, -1.566355, 3.927158, 1, 1, 1, 1, 1,
0.01628665, 0.6461874, 0.28896, 1, 1, 1, 1, 1,
0.02095364, 1.596744, -1.254838, 1, 1, 1, 1, 1,
0.02241321, 1.034187, -1.246083, 1, 1, 1, 1, 1,
0.03426388, 0.6320114, 1.201868, 1, 1, 1, 1, 1,
0.03747727, -1.930144, 5.028471, 1, 1, 1, 1, 1,
0.03804605, -1.056213, 1.89702, 1, 1, 1, 1, 1,
0.04403447, -0.4951211, 3.695304, 1, 1, 1, 1, 1,
0.04444764, -0.0003582837, 1.963519, 1, 1, 1, 1, 1,
0.04757451, -1.345496, 3.699818, 1, 1, 1, 1, 1,
0.04888196, -0.818193, 2.92763, 1, 1, 1, 1, 1,
0.04996954, -2.059337, 3.921318, 1, 1, 1, 1, 1,
0.053172, 0.360088, 0.08779892, 1, 1, 1, 1, 1,
0.05339029, -1.021716, 3.547727, 1, 1, 1, 1, 1,
0.05379475, 0.8671695, 0.7223243, 1, 1, 1, 1, 1,
0.05418573, -0.358436, 3.969714, 0, 0, 1, 1, 1,
0.06716147, 0.225161, 0.8769742, 1, 0, 0, 1, 1,
0.06738991, -1.777758, 3.698311, 1, 0, 0, 1, 1,
0.06780466, 0.3688692, 1.21348, 1, 0, 0, 1, 1,
0.07041311, 0.4530137, -1.545251, 1, 0, 0, 1, 1,
0.07059079, -0.109123, 1.306726, 1, 0, 0, 1, 1,
0.07437309, 0.2683091, 0.7007737, 0, 0, 0, 1, 1,
0.07476437, -1.555662, 2.839456, 0, 0, 0, 1, 1,
0.07589562, -0.606455, 3.409776, 0, 0, 0, 1, 1,
0.07590478, -0.4916039, 1.814865, 0, 0, 0, 1, 1,
0.09147918, 0.9376694, 1.869603, 0, 0, 0, 1, 1,
0.09368764, 1.168546, 1.506616, 0, 0, 0, 1, 1,
0.09396515, 0.7661264, -0.7048566, 0, 0, 0, 1, 1,
0.09417024, 0.8655864, 1.267621, 1, 1, 1, 1, 1,
0.09598329, 0.5356045, -0.9145507, 1, 1, 1, 1, 1,
0.1019069, -0.3386116, 3.472098, 1, 1, 1, 1, 1,
0.1021351, 1.386493, -1.02345, 1, 1, 1, 1, 1,
0.1030307, -0.3817899, 2.776292, 1, 1, 1, 1, 1,
0.1056868, 1.996664, -0.3680348, 1, 1, 1, 1, 1,
0.1150432, 0.5093407, -0.897121, 1, 1, 1, 1, 1,
0.1161174, -1.374815, 1.064323, 1, 1, 1, 1, 1,
0.1198623, 0.4837077, -1.631452, 1, 1, 1, 1, 1,
0.1209163, -0.9467406, 3.925615, 1, 1, 1, 1, 1,
0.122619, -1.281934, 2.31658, 1, 1, 1, 1, 1,
0.125095, -1.06036, 3.625322, 1, 1, 1, 1, 1,
0.1263586, -1.33745, 2.069158, 1, 1, 1, 1, 1,
0.1277651, -0.5940693, 3.114989, 1, 1, 1, 1, 1,
0.1280806, 1.163724, -1.636815, 1, 1, 1, 1, 1,
0.1283924, -0.4544635, 4.042617, 0, 0, 1, 1, 1,
0.1307298, -2.096666, 1.542726, 1, 0, 0, 1, 1,
0.1334558, 1.216656, 0.07418126, 1, 0, 0, 1, 1,
0.1335444, 0.6019546, -0.1631348, 1, 0, 0, 1, 1,
0.1383655, -0.621137, 4.635801, 1, 0, 0, 1, 1,
0.1385348, -0.8818461, 3.289434, 1, 0, 0, 1, 1,
0.1399577, -1.821961, 4.547461, 0, 0, 0, 1, 1,
0.1428374, -0.5794364, 1.769236, 0, 0, 0, 1, 1,
0.1429839, 0.3038278, -0.457463, 0, 0, 0, 1, 1,
0.1467654, 1.670385, -2.259679, 0, 0, 0, 1, 1,
0.1479968, -0.7437469, 2.500039, 0, 0, 0, 1, 1,
0.148576, -1.380066, 2.767663, 0, 0, 0, 1, 1,
0.1572134, 1.296569, -0.01510158, 0, 0, 0, 1, 1,
0.1649274, 1.471876, -0.4348696, 1, 1, 1, 1, 1,
0.1662651, -0.8120447, 2.88277, 1, 1, 1, 1, 1,
0.170785, 0.7444608, -0.7543921, 1, 1, 1, 1, 1,
0.1708231, -0.3686584, 3.504257, 1, 1, 1, 1, 1,
0.1732628, 0.03398599, 0.4819959, 1, 1, 1, 1, 1,
0.1762775, -0.7408186, 3.224199, 1, 1, 1, 1, 1,
0.1764639, 0.08198586, 2.336817, 1, 1, 1, 1, 1,
0.1795786, 0.7519384, 1.317211, 1, 1, 1, 1, 1,
0.1828086, -0.6439524, 4.211722, 1, 1, 1, 1, 1,
0.1905047, -0.3174229, 2.95398, 1, 1, 1, 1, 1,
0.1908798, -0.02912324, 3.358095, 1, 1, 1, 1, 1,
0.19098, -0.4867665, 4.09266, 1, 1, 1, 1, 1,
0.1920295, -0.07279356, 1.880643, 1, 1, 1, 1, 1,
0.1939051, -0.01831829, 0.07431874, 1, 1, 1, 1, 1,
0.1941158, -0.5140611, 3.25367, 1, 1, 1, 1, 1,
0.1981377, 0.07706261, 1.747013, 0, 0, 1, 1, 1,
0.1983398, -1.073459, 3.098722, 1, 0, 0, 1, 1,
0.2086592, 1.548786, -1.143596, 1, 0, 0, 1, 1,
0.2118899, -1.675449, 3.384119, 1, 0, 0, 1, 1,
0.2142276, 1.072114, -0.8093217, 1, 0, 0, 1, 1,
0.2145131, 0.4028091, -1.805964, 1, 0, 0, 1, 1,
0.2162315, 1.119649, -0.1129907, 0, 0, 0, 1, 1,
0.2164155, -0.2887267, 2.32847, 0, 0, 0, 1, 1,
0.2193831, 0.03962826, 0.8331717, 0, 0, 0, 1, 1,
0.2214995, 1.126039, -1.037647, 0, 0, 0, 1, 1,
0.2224625, -0.4186114, 2.517877, 0, 0, 0, 1, 1,
0.2258929, 2.580027, 1.228812, 0, 0, 0, 1, 1,
0.2261519, -1.202762, 3.132655, 0, 0, 0, 1, 1,
0.2276, -0.7457337, 2.405877, 1, 1, 1, 1, 1,
0.2302007, -0.429047, 1.65877, 1, 1, 1, 1, 1,
0.2370684, -1.779292, 3.431958, 1, 1, 1, 1, 1,
0.2383576, -0.3515497, 2.088994, 1, 1, 1, 1, 1,
0.2465601, 0.4059923, -1.179272, 1, 1, 1, 1, 1,
0.2487636, -0.9942521, 3.097903, 1, 1, 1, 1, 1,
0.2492418, 0.2826762, -0.6441193, 1, 1, 1, 1, 1,
0.2519563, -2.224548, 2.404747, 1, 1, 1, 1, 1,
0.2564146, 0.929754, 1.975448, 1, 1, 1, 1, 1,
0.2565294, 0.454777, 1.107043, 1, 1, 1, 1, 1,
0.2684359, -1.129121, 3.73798, 1, 1, 1, 1, 1,
0.2690222, 0.7958221, -0.07223938, 1, 1, 1, 1, 1,
0.2709394, -0.2549542, 3.21641, 1, 1, 1, 1, 1,
0.2714541, 0.9047025, 1.223046, 1, 1, 1, 1, 1,
0.2741326, 0.1647277, 2.028026, 1, 1, 1, 1, 1,
0.2745067, -0.2674889, 2.150764, 0, 0, 1, 1, 1,
0.2758503, 1.710558, -1.866387, 1, 0, 0, 1, 1,
0.2813708, -0.2443843, 3.033491, 1, 0, 0, 1, 1,
0.2851986, -0.02364109, 1.754557, 1, 0, 0, 1, 1,
0.2880436, -0.4346381, 1.385412, 1, 0, 0, 1, 1,
0.2884725, -0.9410826, 2.98623, 1, 0, 0, 1, 1,
0.2892905, -0.2038001, 2.966144, 0, 0, 0, 1, 1,
0.2895837, -0.7225723, 2.395534, 0, 0, 0, 1, 1,
0.2908987, 1.099615, -1.989492, 0, 0, 0, 1, 1,
0.2916547, 0.7685552, -0.8356567, 0, 0, 0, 1, 1,
0.2931272, -0.7699584, 3.114143, 0, 0, 0, 1, 1,
0.2945689, 0.3121304, 1.082784, 0, 0, 0, 1, 1,
0.2947287, -1.654113, 2.513398, 0, 0, 0, 1, 1,
0.3018678, -0.8574062, 2.380878, 1, 1, 1, 1, 1,
0.3020472, 1.527124, 0.3556415, 1, 1, 1, 1, 1,
0.3083882, -1.221631, 3.045086, 1, 1, 1, 1, 1,
0.3097978, -1.914836, 3.492401, 1, 1, 1, 1, 1,
0.3130618, 0.06350692, 1.516536, 1, 1, 1, 1, 1,
0.314898, 1.591697, 0.2015817, 1, 1, 1, 1, 1,
0.3176603, 0.01907446, 0.3232757, 1, 1, 1, 1, 1,
0.3294037, 0.8020138, 0.3393994, 1, 1, 1, 1, 1,
0.3309944, 1.272904, 1.049097, 1, 1, 1, 1, 1,
0.3316597, -1.225653, 2.452752, 1, 1, 1, 1, 1,
0.3336655, 1.695683, -1.564069, 1, 1, 1, 1, 1,
0.3342, 0.562038, 0.8131316, 1, 1, 1, 1, 1,
0.3349075, 0.6077808, 2.279511, 1, 1, 1, 1, 1,
0.3371872, 0.2306166, 1.491086, 1, 1, 1, 1, 1,
0.3412608, 0.2203654, 1.923873, 1, 1, 1, 1, 1,
0.3414237, 0.7946678, 3.078187, 0, 0, 1, 1, 1,
0.3421705, -0.4072818, 2.180137, 1, 0, 0, 1, 1,
0.3425249, 1.568651, -1.269502, 1, 0, 0, 1, 1,
0.3493729, -0.5143827, 1.333825, 1, 0, 0, 1, 1,
0.3514657, -0.1014362, 2.142908, 1, 0, 0, 1, 1,
0.3551407, -0.6196156, 3.625303, 1, 0, 0, 1, 1,
0.3592451, 1.979933, 0.05730662, 0, 0, 0, 1, 1,
0.3602294, -0.1674983, 3.566159, 0, 0, 0, 1, 1,
0.3646208, 0.1885008, -0.6358603, 0, 0, 0, 1, 1,
0.3715374, 0.9634176, 1.153563, 0, 0, 0, 1, 1,
0.3726195, 0.67511, 0.8235616, 0, 0, 0, 1, 1,
0.3728184, 0.9385269, 1.784315, 0, 0, 0, 1, 1,
0.3740835, -0.8409598, 2.168773, 0, 0, 0, 1, 1,
0.3752937, -0.9191897, 4.347625, 1, 1, 1, 1, 1,
0.3757566, 1.546726, 0.6267048, 1, 1, 1, 1, 1,
0.3762938, -0.6069414, 2.496578, 1, 1, 1, 1, 1,
0.380219, 0.6973532, 1.618825, 1, 1, 1, 1, 1,
0.3827235, -0.6438412, 2.101779, 1, 1, 1, 1, 1,
0.3869333, -0.6938654, 3.160842, 1, 1, 1, 1, 1,
0.3882855, -1.538342, 2.767378, 1, 1, 1, 1, 1,
0.3914082, 2.315605, -0.4975758, 1, 1, 1, 1, 1,
0.3915836, -0.3357049, 0.7404683, 1, 1, 1, 1, 1,
0.3929349, 0.07826454, 1.055632, 1, 1, 1, 1, 1,
0.3937348, -1.289837, 2.62187, 1, 1, 1, 1, 1,
0.3940797, 0.2294224, 1.063176, 1, 1, 1, 1, 1,
0.3986984, -0.5496702, 3.580815, 1, 1, 1, 1, 1,
0.4014364, 0.08030114, 1.654334, 1, 1, 1, 1, 1,
0.4018337, 0.5199697, 0.3904688, 1, 1, 1, 1, 1,
0.4024792, 0.5066403, -0.2340255, 0, 0, 1, 1, 1,
0.4080748, -0.3448847, 3.758455, 1, 0, 0, 1, 1,
0.4153475, 0.9569156, 0.1193322, 1, 0, 0, 1, 1,
0.4170449, 0.6106539, 3.394982, 1, 0, 0, 1, 1,
0.4175662, 0.3910098, -0.8386713, 1, 0, 0, 1, 1,
0.4255272, -0.1305567, 1.58216, 1, 0, 0, 1, 1,
0.4261363, 1.344617, 0.08219066, 0, 0, 0, 1, 1,
0.4287046, 1.270819, -1.260724, 0, 0, 0, 1, 1,
0.4298306, -1.207231, 2.51123, 0, 0, 0, 1, 1,
0.4371015, -0.6039106, 3.975877, 0, 0, 0, 1, 1,
0.4437593, -0.3599699, 4.672794, 0, 0, 0, 1, 1,
0.4438153, 0.5557653, 1.028039, 0, 0, 0, 1, 1,
0.4504093, 0.002609313, 1.091473, 0, 0, 0, 1, 1,
0.4557711, 0.7573557, 0.06094319, 1, 1, 1, 1, 1,
0.4642512, -0.151714, 1.883037, 1, 1, 1, 1, 1,
0.4670207, 0.808725, 1.22711, 1, 1, 1, 1, 1,
0.4722904, 1.250943, -0.8060727, 1, 1, 1, 1, 1,
0.4835083, -0.6218107, 1.089734, 1, 1, 1, 1, 1,
0.4841476, -0.2103891, 3.230654, 1, 1, 1, 1, 1,
0.4853483, 0.7046379, -0.6274226, 1, 1, 1, 1, 1,
0.4919221, -1.867612, 2.348809, 1, 1, 1, 1, 1,
0.4931177, 0.5357795, -0.04942461, 1, 1, 1, 1, 1,
0.4982638, -0.520069, 2.077186, 1, 1, 1, 1, 1,
0.5031889, 1.31178, -0.7114805, 1, 1, 1, 1, 1,
0.5048446, -1.459485, 3.591282, 1, 1, 1, 1, 1,
0.5055839, 0.2228496, 2.44038, 1, 1, 1, 1, 1,
0.5070757, 0.5660633, 1.81706, 1, 1, 1, 1, 1,
0.5088539, 0.02936846, 0.7566016, 1, 1, 1, 1, 1,
0.5096654, 0.8448452, -0.08197118, 0, 0, 1, 1, 1,
0.510996, 0.1733585, -0.289529, 1, 0, 0, 1, 1,
0.5111422, 1.5124, 0.5593272, 1, 0, 0, 1, 1,
0.5148698, 0.6745994, 0.3418728, 1, 0, 0, 1, 1,
0.5179355, 0.2057759, 1.77671, 1, 0, 0, 1, 1,
0.5234573, 0.4289466, 0.5564016, 1, 0, 0, 1, 1,
0.5259953, 0.2336432, 0.6049571, 0, 0, 0, 1, 1,
0.5281052, 0.1007585, 1.06685, 0, 0, 0, 1, 1,
0.5297506, 0.5974343, 1.318921, 0, 0, 0, 1, 1,
0.5344046, -0.6940551, 2.629635, 0, 0, 0, 1, 1,
0.5387771, -1.039059, 2.435821, 0, 0, 0, 1, 1,
0.5395417, 2.448257, 0.7051676, 0, 0, 0, 1, 1,
0.5396646, -0.1123233, 1.547835, 0, 0, 0, 1, 1,
0.5397539, 0.06121889, 1.824437, 1, 1, 1, 1, 1,
0.5419256, 1.455576, -0.002302348, 1, 1, 1, 1, 1,
0.5423661, -0.284453, 0.8484248, 1, 1, 1, 1, 1,
0.5444642, -0.4592122, 2.61992, 1, 1, 1, 1, 1,
0.5523393, -0.5520583, 2.700166, 1, 1, 1, 1, 1,
0.5538418, -1.460763, 0.8107915, 1, 1, 1, 1, 1,
0.5548691, -1.425528, 3.240516, 1, 1, 1, 1, 1,
0.5586333, -0.4114462, 3.795332, 1, 1, 1, 1, 1,
0.5621382, -0.8090907, 1.92585, 1, 1, 1, 1, 1,
0.5681424, -0.582672, 2.784578, 1, 1, 1, 1, 1,
0.5713041, -0.7068095, 0.2396416, 1, 1, 1, 1, 1,
0.5755721, 0.02598973, 2.928335, 1, 1, 1, 1, 1,
0.5850533, 1.563967, -0.7119716, 1, 1, 1, 1, 1,
0.588452, 0.7837383, 0.2558357, 1, 1, 1, 1, 1,
0.5904369, 0.6872348, 1.290657, 1, 1, 1, 1, 1,
0.5935001, 1.0672, 0.901136, 0, 0, 1, 1, 1,
0.5980265, -0.09517583, 2.196295, 1, 0, 0, 1, 1,
0.6012122, 1.150137, 0.4745214, 1, 0, 0, 1, 1,
0.6020196, 0.04070912, 1.595781, 1, 0, 0, 1, 1,
0.6093246, 0.4082256, 0.3608279, 1, 0, 0, 1, 1,
0.6101541, 0.2718329, 0.6694435, 1, 0, 0, 1, 1,
0.6111277, 0.2952243, 0.364597, 0, 0, 0, 1, 1,
0.6111494, 1.316508, 0.322141, 0, 0, 0, 1, 1,
0.6123137, -0.9775678, 2.463174, 0, 0, 0, 1, 1,
0.6154878, 0.5001037, 0.7689333, 0, 0, 0, 1, 1,
0.61637, -0.1472058, 1.587941, 0, 0, 0, 1, 1,
0.616969, 1.162777, 0.5708075, 0, 0, 0, 1, 1,
0.6199911, 0.2718845, -0.1311978, 0, 0, 0, 1, 1,
0.6240837, 0.8256624, 0.3414567, 1, 1, 1, 1, 1,
0.6311323, -0.405839, 2.953815, 1, 1, 1, 1, 1,
0.6341359, -0.2499145, 2.982439, 1, 1, 1, 1, 1,
0.6363244, -0.6947833, 2.332772, 1, 1, 1, 1, 1,
0.6409639, 0.6918877, 0.8493121, 1, 1, 1, 1, 1,
0.6455664, -0.2403778, 1.963058, 1, 1, 1, 1, 1,
0.6475716, -1.491104, 3.224485, 1, 1, 1, 1, 1,
0.647736, -0.5323489, 1.588231, 1, 1, 1, 1, 1,
0.6563677, -1.663369, 3.320161, 1, 1, 1, 1, 1,
0.6613435, -0.4814924, 2.092508, 1, 1, 1, 1, 1,
0.6615004, -0.1406557, 1.438171, 1, 1, 1, 1, 1,
0.6645405, -0.2828531, 1.621289, 1, 1, 1, 1, 1,
0.664647, 0.005931871, 0.4963628, 1, 1, 1, 1, 1,
0.670345, -0.9831081, 2.912617, 1, 1, 1, 1, 1,
0.6714643, -0.6751814, 0.8442582, 1, 1, 1, 1, 1,
0.6792504, 0.6599517, 1.675053, 0, 0, 1, 1, 1,
0.6793457, -1.126664, 2.844054, 1, 0, 0, 1, 1,
0.6804064, -1.014731, 3.115476, 1, 0, 0, 1, 1,
0.680873, -0.01202947, 0.4832602, 1, 0, 0, 1, 1,
0.6816348, -1.079761, 0.02297668, 1, 0, 0, 1, 1,
0.6818952, -0.4030898, 3.385672, 1, 0, 0, 1, 1,
0.6861025, 0.02263687, 0.9873205, 0, 0, 0, 1, 1,
0.6881967, -0.5912798, 1.955047, 0, 0, 0, 1, 1,
0.696355, -0.1121808, 2.114216, 0, 0, 0, 1, 1,
0.6965384, -0.2206122, 0.8113849, 0, 0, 0, 1, 1,
0.6997715, 1.018658, 0.02956344, 0, 0, 0, 1, 1,
0.6999462, -1.348509, 0.601818, 0, 0, 0, 1, 1,
0.7060845, -2.899711, 2.912757, 0, 0, 0, 1, 1,
0.7063164, -0.2392784, 2.502942, 1, 1, 1, 1, 1,
0.7097549, 1.405261, 1.044584, 1, 1, 1, 1, 1,
0.7138985, 0.9509342, 2.474295, 1, 1, 1, 1, 1,
0.7145422, 0.1419192, 2.432675, 1, 1, 1, 1, 1,
0.7206447, -1.962632, 3.178398, 1, 1, 1, 1, 1,
0.7223417, 0.7084681, 0.635569, 1, 1, 1, 1, 1,
0.729903, -0.1111554, 1.278193, 1, 1, 1, 1, 1,
0.7303146, 0.1456439, 1.349748, 1, 1, 1, 1, 1,
0.7317194, 0.02373591, -0.2353026, 1, 1, 1, 1, 1,
0.7388584, 1.597268, 1.233579, 1, 1, 1, 1, 1,
0.7415832, -0.2837016, 3.29921, 1, 1, 1, 1, 1,
0.7419655, -0.8851917, 2.373972, 1, 1, 1, 1, 1,
0.7452278, -1.057726, 2.965009, 1, 1, 1, 1, 1,
0.7492654, -0.3408545, 0.3929258, 1, 1, 1, 1, 1,
0.7497196, 0.9747714, 0.550815, 1, 1, 1, 1, 1,
0.7565109, 0.07235416, 0.4178552, 0, 0, 1, 1, 1,
0.7713335, 0.5095015, 1.933056, 1, 0, 0, 1, 1,
0.7719136, -0.7946891, 3.767645, 1, 0, 0, 1, 1,
0.7805988, 0.1993141, 2.51196, 1, 0, 0, 1, 1,
0.7851645, 0.4715519, 0.06019142, 1, 0, 0, 1, 1,
0.7981595, -0.6178914, 2.174168, 1, 0, 0, 1, 1,
0.8069147, -0.397151, 0.6372566, 0, 0, 0, 1, 1,
0.8079033, -0.00794967, 0.4500738, 0, 0, 0, 1, 1,
0.8113137, 0.02391425, 1.705304, 0, 0, 0, 1, 1,
0.8192248, 0.6086954, -0.2946659, 0, 0, 0, 1, 1,
0.819337, -1.386124, 2.897216, 0, 0, 0, 1, 1,
0.8226488, 1.051813, 2.294485, 0, 0, 0, 1, 1,
0.8248896, 0.3870938, 0.2148957, 0, 0, 0, 1, 1,
0.8382426, -0.1670297, 1.574759, 1, 1, 1, 1, 1,
0.8418993, 1.293952, 1.51254, 1, 1, 1, 1, 1,
0.846676, 2.034487, 1.567889, 1, 1, 1, 1, 1,
0.8490023, 1.735061, 0.2736909, 1, 1, 1, 1, 1,
0.8512175, 0.09924375, 0.9889532, 1, 1, 1, 1, 1,
0.8552964, 0.2780522, 0.8276566, 1, 1, 1, 1, 1,
0.8628928, 0.206043, 0.1894, 1, 1, 1, 1, 1,
0.8636875, -1.392543, 3.15364, 1, 1, 1, 1, 1,
0.8685471, -1.172064, 3.182525, 1, 1, 1, 1, 1,
0.8714042, 0.2175159, 1.930237, 1, 1, 1, 1, 1,
0.87198, 0.2210043, 1.455549, 1, 1, 1, 1, 1,
0.8743839, 0.4891095, 0.5330723, 1, 1, 1, 1, 1,
0.875896, 0.3008496, 0.9441662, 1, 1, 1, 1, 1,
0.8767745, -0.2059433, 2.506224, 1, 1, 1, 1, 1,
0.8776302, 1.929389, -0.8658755, 1, 1, 1, 1, 1,
0.8876522, 0.3471532, 1.360781, 0, 0, 1, 1, 1,
0.8879693, 1.068854, 1.428007, 1, 0, 0, 1, 1,
0.8932031, 2.337492, -0.6199337, 1, 0, 0, 1, 1,
0.8937578, 0.7752633, 1.078991, 1, 0, 0, 1, 1,
0.8983473, 0.4748816, 2.06633, 1, 0, 0, 1, 1,
0.898513, -0.1333995, 2.994227, 1, 0, 0, 1, 1,
0.8992965, 1.000435, -0.5824446, 0, 0, 0, 1, 1,
0.902123, -0.5464215, 1.480928, 0, 0, 0, 1, 1,
0.9159489, 0.7843589, 1.2608, 0, 0, 0, 1, 1,
0.9220964, 2.281116, 0.1818324, 0, 0, 0, 1, 1,
0.9234593, 0.1635425, 2.7965, 0, 0, 0, 1, 1,
0.9301956, 1.284176, 1.377309, 0, 0, 0, 1, 1,
0.9347098, 0.2200522, 0.364319, 0, 0, 0, 1, 1,
0.9348843, 0.9068279, -1.399449, 1, 1, 1, 1, 1,
0.9350967, -1.222475, 2.122124, 1, 1, 1, 1, 1,
0.9427606, 0.09846059, 2.948439, 1, 1, 1, 1, 1,
0.9505475, 0.8745573, 0.009607817, 1, 1, 1, 1, 1,
0.9509015, -0.8458878, 0.8703259, 1, 1, 1, 1, 1,
0.9549235, -1.261596, 3.238545, 1, 1, 1, 1, 1,
0.9670424, 1.255693, 0.2132898, 1, 1, 1, 1, 1,
0.9674313, 0.102941, 2.919021, 1, 1, 1, 1, 1,
0.9741855, 1.101445, 0.8432419, 1, 1, 1, 1, 1,
0.9754009, 0.6164619, 0.05625407, 1, 1, 1, 1, 1,
0.9830374, -1.371124, 0.3632952, 1, 1, 1, 1, 1,
0.9849751, -1.743755, 4.171119, 1, 1, 1, 1, 1,
0.998419, -1.049152, 1.628421, 1, 1, 1, 1, 1,
0.9991612, -0.9559451, 2.5587, 1, 1, 1, 1, 1,
1.005099, -0.8456818, 1.926807, 1, 1, 1, 1, 1,
1.01798, -0.3273222, 2.93648, 0, 0, 1, 1, 1,
1.018671, -0.7881761, 2.154638, 1, 0, 0, 1, 1,
1.024608, -0.8042831, 3.007219, 1, 0, 0, 1, 1,
1.026223, 1.018283, 2.757826, 1, 0, 0, 1, 1,
1.027097, -0.247956, 2.626599, 1, 0, 0, 1, 1,
1.031296, 0.6001973, 2.001715, 1, 0, 0, 1, 1,
1.033333, -1.074238, 1.13375, 0, 0, 0, 1, 1,
1.033536, -0.02733686, 3.114276, 0, 0, 0, 1, 1,
1.034767, -0.2215298, 2.681384, 0, 0, 0, 1, 1,
1.034924, -0.4046686, 3.002657, 0, 0, 0, 1, 1,
1.03712, -0.9392497, 2.686887, 0, 0, 0, 1, 1,
1.051927, 0.5585334, 1.312712, 0, 0, 0, 1, 1,
1.0546, 0.7904106, 0.09338769, 0, 0, 0, 1, 1,
1.055473, 0.2026985, 0.5025707, 1, 1, 1, 1, 1,
1.05774, 1.558334, 0.3346949, 1, 1, 1, 1, 1,
1.059463, 0.3882387, 2.347662, 1, 1, 1, 1, 1,
1.062053, -2.25659, 2.094651, 1, 1, 1, 1, 1,
1.065163, -0.6956769, 2.673211, 1, 1, 1, 1, 1,
1.068174, 1.252907, 1.473053, 1, 1, 1, 1, 1,
1.074041, -2.456231, 3.159682, 1, 1, 1, 1, 1,
1.074298, -0.2135594, -0.5790945, 1, 1, 1, 1, 1,
1.075066, 0.9573205, 0.8978184, 1, 1, 1, 1, 1,
1.078326, -0.02256705, 1.196688, 1, 1, 1, 1, 1,
1.083367, 0.3847724, 2.500691, 1, 1, 1, 1, 1,
1.086143, -2.439143, 3.021941, 1, 1, 1, 1, 1,
1.097598, 0.4544091, 0.6092712, 1, 1, 1, 1, 1,
1.10803, -0.0564867, 3.146568, 1, 1, 1, 1, 1,
1.116841, -1.062161, 1.249454, 1, 1, 1, 1, 1,
1.117308, -0.6181684, -0.08453664, 0, 0, 1, 1, 1,
1.118847, -0.3907414, 0.388634, 1, 0, 0, 1, 1,
1.137985, 0.06525461, -0.3959836, 1, 0, 0, 1, 1,
1.141581, -0.7714783, -0.1266474, 1, 0, 0, 1, 1,
1.141644, 0.2082753, 1.858817, 1, 0, 0, 1, 1,
1.144712, -0.09014462, 2.143118, 1, 0, 0, 1, 1,
1.156699, -1.626637, 2.851612, 0, 0, 0, 1, 1,
1.159635, 0.7778617, 2.460091, 0, 0, 0, 1, 1,
1.174233, 0.006588955, 0.648719, 0, 0, 0, 1, 1,
1.175995, 2.268314, 1.190167, 0, 0, 0, 1, 1,
1.18107, 0.3120364, 0.7056158, 0, 0, 0, 1, 1,
1.182114, -1.172805, 1.933411, 0, 0, 0, 1, 1,
1.193589, 0.4047899, 0.558322, 0, 0, 0, 1, 1,
1.197481, -0.3403391, 2.506773, 1, 1, 1, 1, 1,
1.201199, -1.427787, 1.367689, 1, 1, 1, 1, 1,
1.205333, 1.06447, 0.9255276, 1, 1, 1, 1, 1,
1.205912, -0.1437816, 3.984426, 1, 1, 1, 1, 1,
1.211366, -0.8786222, 1.612266, 1, 1, 1, 1, 1,
1.218444, -0.6635497, 0.7915366, 1, 1, 1, 1, 1,
1.236173, -1.301448, 2.822852, 1, 1, 1, 1, 1,
1.240118, 1.157722, 1.209475, 1, 1, 1, 1, 1,
1.249411, -0.7121311, 2.344373, 1, 1, 1, 1, 1,
1.254529, -0.401703, 2.155391, 1, 1, 1, 1, 1,
1.261104, 1.065882, 0.1056962, 1, 1, 1, 1, 1,
1.264955, -0.4427654, 2.754153, 1, 1, 1, 1, 1,
1.267223, 0.554594, 0.9858251, 1, 1, 1, 1, 1,
1.272934, 0.1316518, 2.39874, 1, 1, 1, 1, 1,
1.275434, 0.1050349, 2.375379, 1, 1, 1, 1, 1,
1.276883, -0.3282267, 0.2906713, 0, 0, 1, 1, 1,
1.285231, 0.770335, 1.005686, 1, 0, 0, 1, 1,
1.295748, 2.180672, 1.952354, 1, 0, 0, 1, 1,
1.302243, 0.2272251, 1.045192, 1, 0, 0, 1, 1,
1.305154, -0.5583644, 3.320771, 1, 0, 0, 1, 1,
1.306314, -0.3081473, 2.594417, 1, 0, 0, 1, 1,
1.3128, -2.046651, 1.428979, 0, 0, 0, 1, 1,
1.315385, -1.265958, 1.528419, 0, 0, 0, 1, 1,
1.323713, -2.387176, 3.082541, 0, 0, 0, 1, 1,
1.32809, -0.7532577, 1.817124, 0, 0, 0, 1, 1,
1.32929, 0.1236082, 3.904279, 0, 0, 0, 1, 1,
1.332905, -0.7922454, 2.307731, 0, 0, 0, 1, 1,
1.339248, -1.219342, 2.315158, 0, 0, 0, 1, 1,
1.341484, -1.034589, 2.875861, 1, 1, 1, 1, 1,
1.34195, 0.2678304, 0.9588622, 1, 1, 1, 1, 1,
1.352505, -0.09677377, -0.7973673, 1, 1, 1, 1, 1,
1.355984, 1.176235, -0.005881737, 1, 1, 1, 1, 1,
1.356428, 0.02563218, 0.6084014, 1, 1, 1, 1, 1,
1.35665, -0.2825958, 1.81827, 1, 1, 1, 1, 1,
1.35755, -1.615356, 1.181134, 1, 1, 1, 1, 1,
1.360317, -1.33984, 1.536011, 1, 1, 1, 1, 1,
1.361972, -0.1184791, 0.3971272, 1, 1, 1, 1, 1,
1.374874, 0.5137243, 2.122516, 1, 1, 1, 1, 1,
1.375161, -0.1925367, -0.892962, 1, 1, 1, 1, 1,
1.383034, -0.3443919, 1.411516, 1, 1, 1, 1, 1,
1.383709, -0.09490989, 1.949842, 1, 1, 1, 1, 1,
1.385887, -0.3579239, 2.171157, 1, 1, 1, 1, 1,
1.39029, -0.8105993, 0.7069094, 1, 1, 1, 1, 1,
1.405856, 0.7183949, 0.8794145, 0, 0, 1, 1, 1,
1.412869, 0.6751233, 1.444739, 1, 0, 0, 1, 1,
1.427342, 1.092061, 1.653848, 1, 0, 0, 1, 1,
1.439276, 0.4077691, 0.4880971, 1, 0, 0, 1, 1,
1.440757, -0.1124553, -1.01317, 1, 0, 0, 1, 1,
1.446523, 2.130791, 1.03768, 1, 0, 0, 1, 1,
1.46197, 0.501721, 1.04118, 0, 0, 0, 1, 1,
1.463605, -0.687824, 3.27354, 0, 0, 0, 1, 1,
1.466056, 0.4372375, 2.120187, 0, 0, 0, 1, 1,
1.466148, -0.2004626, 1.182847, 0, 0, 0, 1, 1,
1.467441, -1.222944, 0.813096, 0, 0, 0, 1, 1,
1.469826, 1.5042, 2.650795, 0, 0, 0, 1, 1,
1.472791, -0.412913, 1.28343, 0, 0, 0, 1, 1,
1.480062, -0.2119476, 1.234087, 1, 1, 1, 1, 1,
1.482479, 0.8355453, -0.1664452, 1, 1, 1, 1, 1,
1.488251, -0.8042507, 2.518711, 1, 1, 1, 1, 1,
1.488298, 0.2758747, 1.496088, 1, 1, 1, 1, 1,
1.493833, -0.9660209, 2.414079, 1, 1, 1, 1, 1,
1.498251, 1.326276, -1.632362, 1, 1, 1, 1, 1,
1.502314, -0.4574431, 2.963637, 1, 1, 1, 1, 1,
1.511186, -2.293696, 3.046119, 1, 1, 1, 1, 1,
1.512951, -1.093294, 1.110344, 1, 1, 1, 1, 1,
1.513352, -1.894665, 2.330744, 1, 1, 1, 1, 1,
1.523304, 0.5848711, 1.342422, 1, 1, 1, 1, 1,
1.524538, -0.1015765, 2.483444, 1, 1, 1, 1, 1,
1.539335, -0.1870575, 0.9714835, 1, 1, 1, 1, 1,
1.5399, -0.4091736, -0.1938532, 1, 1, 1, 1, 1,
1.550204, -0.2384756, 1.675348, 1, 1, 1, 1, 1,
1.557896, -1.425401, 1.845341, 0, 0, 1, 1, 1,
1.558234, 0.8535631, 1.111916, 1, 0, 0, 1, 1,
1.585439, -1.260286, 1.521084, 1, 0, 0, 1, 1,
1.59369, 1.756589, 0.9884339, 1, 0, 0, 1, 1,
1.600997, 0.6365345, 2.729213, 1, 0, 0, 1, 1,
1.604066, -0.2519137, 0.9439024, 1, 0, 0, 1, 1,
1.637667, -0.1669826, 2.744335, 0, 0, 0, 1, 1,
1.64081, -1.902359, 1.707166, 0, 0, 0, 1, 1,
1.642521, -0.4920247, 1.758261, 0, 0, 0, 1, 1,
1.650931, -1.261477, 4.135413, 0, 0, 0, 1, 1,
1.655853, 0.0350074, 2.096855, 0, 0, 0, 1, 1,
1.657877, 0.7516451, 0.6087705, 0, 0, 0, 1, 1,
1.660212, -1.029316, 1.620949, 0, 0, 0, 1, 1,
1.709527, 0.1118225, 0.3196067, 1, 1, 1, 1, 1,
1.712001, 0.5284901, 0.9138403, 1, 1, 1, 1, 1,
1.757835, -0.3509265, 4.123221, 1, 1, 1, 1, 1,
1.771693, -0.8953141, 3.045454, 1, 1, 1, 1, 1,
1.778342, 2.142735, 0.7040794, 1, 1, 1, 1, 1,
1.790741, 0.3428255, 2.160969, 1, 1, 1, 1, 1,
1.795363, 2.110782, 1.151686, 1, 1, 1, 1, 1,
1.820988, -0.8675874, 1.68921, 1, 1, 1, 1, 1,
1.830022, -0.8816665, 0.5234552, 1, 1, 1, 1, 1,
1.882237, -1.699335, 2.124868, 1, 1, 1, 1, 1,
1.959112, -1.587828, 1.982574, 1, 1, 1, 1, 1,
1.970853, -1.267628, 3.189584, 1, 1, 1, 1, 1,
1.974218, 0.1070555, 1.708243, 1, 1, 1, 1, 1,
1.976269, -0.5109203, 1.738877, 1, 1, 1, 1, 1,
1.981979, -0.1234784, 0.252373, 1, 1, 1, 1, 1,
1.983322, 1.523364, 2.654765, 0, 0, 1, 1, 1,
2.016049, -0.7441757, 3.041346, 1, 0, 0, 1, 1,
2.048187, -0.8258964, 1.458898, 1, 0, 0, 1, 1,
2.069334, -1.018955, 2.149855, 1, 0, 0, 1, 1,
2.085358, 0.617857, 0.5002934, 1, 0, 0, 1, 1,
2.111286, -1.296181, 3.114696, 1, 0, 0, 1, 1,
2.127878, -1.646977, 2.36517, 0, 0, 0, 1, 1,
2.142635, 0.1703981, 1.518149, 0, 0, 0, 1, 1,
2.175373, -1.987459, 3.316294, 0, 0, 0, 1, 1,
2.216202, -1.146005, 3.636873, 0, 0, 0, 1, 1,
2.23399, -0.7044628, 1.7663, 0, 0, 0, 1, 1,
2.402471, -0.5826675, -0.02432412, 0, 0, 0, 1, 1,
2.456015, -0.7228048, 1.912532, 0, 0, 0, 1, 1,
2.473023, 0.4356676, 1.514224, 1, 1, 1, 1, 1,
2.545133, 0.1195756, 1.590621, 1, 1, 1, 1, 1,
2.563164, 1.591894, -0.4472971, 1, 1, 1, 1, 1,
2.610648, 0.8292988, 1.064835, 1, 1, 1, 1, 1,
2.727687, -1.043993, 1.930962, 1, 1, 1, 1, 1,
3.094964, 1.041824, -1.513797, 1, 1, 1, 1, 1,
3.167381, 0.9042589, 1.539171, 1, 1, 1, 1, 1
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
var radius = 9.061101;
var distance = 31.82673;
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
mvMatrix.translate( -0.0392642, 0.4138598, -0.1240919 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.82673);
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
