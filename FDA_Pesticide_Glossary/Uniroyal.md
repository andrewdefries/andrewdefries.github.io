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
-3.181959, -1.27245, -2.711901, 1, 0, 0, 1,
-3.104068, 1.916435, -0.7670868, 1, 0.007843138, 0, 1,
-3.063643, -1.239329, -1.794049, 1, 0.01176471, 0, 1,
-2.896095, -1.146662, -2.082104, 1, 0.01960784, 0, 1,
-2.844793, 0.6576591, -1.308702, 1, 0.02352941, 0, 1,
-2.722682, 1.949263, -0.3026976, 1, 0.03137255, 0, 1,
-2.607954, -0.2823211, -1.562233, 1, 0.03529412, 0, 1,
-2.577323, -0.4282206, -0.2658644, 1, 0.04313726, 0, 1,
-2.487728, -1.146039, -1.255344, 1, 0.04705882, 0, 1,
-2.474031, -0.2855839, -0.7417544, 1, 0.05490196, 0, 1,
-2.447678, -1.548782, -1.35251, 1, 0.05882353, 0, 1,
-2.441567, -2.134421, -3.603621, 1, 0.06666667, 0, 1,
-2.373281, -1.794366, -3.326112, 1, 0.07058824, 0, 1,
-2.234483, -1.077071, -1.872751, 1, 0.07843138, 0, 1,
-2.205891, 1.276746, -1.585069, 1, 0.08235294, 0, 1,
-2.2049, 0.3178579, -1.215468, 1, 0.09019608, 0, 1,
-2.191191, 1.038934, 0.2900893, 1, 0.09411765, 0, 1,
-2.116784, 1.227048, -0.5674681, 1, 0.1019608, 0, 1,
-2.10874, -0.3289268, -0.8841976, 1, 0.1098039, 0, 1,
-2.09336, 0.4970285, -1.043234, 1, 0.1137255, 0, 1,
-2.04202, 0.3099228, -2.336118, 1, 0.1215686, 0, 1,
-2.015724, -0.2107117, -1.992391, 1, 0.1254902, 0, 1,
-1.971957, 0.008818814, -1.186148, 1, 0.1333333, 0, 1,
-1.958461, -0.23429, 0.1818382, 1, 0.1372549, 0, 1,
-1.949396, -0.6926903, 0.1091814, 1, 0.145098, 0, 1,
-1.948079, -0.7828487, -3.203802, 1, 0.1490196, 0, 1,
-1.947787, 0.712827, -0.3687026, 1, 0.1568628, 0, 1,
-1.929493, 0.4977509, -1.601955, 1, 0.1607843, 0, 1,
-1.924277, 0.299946, -0.8356155, 1, 0.1686275, 0, 1,
-1.921631, -0.134474, -1.420378, 1, 0.172549, 0, 1,
-1.895386, -0.7208725, 0.0381625, 1, 0.1803922, 0, 1,
-1.861438, -1.997727, -2.400584, 1, 0.1843137, 0, 1,
-1.835215, 1.18269, -0.5666153, 1, 0.1921569, 0, 1,
-1.824652, -2.513449, -2.279544, 1, 0.1960784, 0, 1,
-1.798057, -0.5770252, -2.958997, 1, 0.2039216, 0, 1,
-1.777014, 0.6123122, -2.905759, 1, 0.2117647, 0, 1,
-1.76362, -1.296795, -1.269683, 1, 0.2156863, 0, 1,
-1.757008, -0.3879518, -1.715023, 1, 0.2235294, 0, 1,
-1.755559, -0.6059263, -1.238081, 1, 0.227451, 0, 1,
-1.751089, -0.1476432, -2.587725, 1, 0.2352941, 0, 1,
-1.748069, -0.4632831, -0.5716106, 1, 0.2392157, 0, 1,
-1.741711, 1.665207, -1.819074, 1, 0.2470588, 0, 1,
-1.737337, 0.9640414, 0.1891496, 1, 0.2509804, 0, 1,
-1.731797, 0.3537802, -1.789214, 1, 0.2588235, 0, 1,
-1.70341, -0.2216844, -1.746852, 1, 0.2627451, 0, 1,
-1.699231, -2.820825, -1.430793, 1, 0.2705882, 0, 1,
-1.675445, -0.8250988, -3.479081, 1, 0.2745098, 0, 1,
-1.668747, 1.474988, -2.733238, 1, 0.282353, 0, 1,
-1.658374, -0.8354463, -3.555483, 1, 0.2862745, 0, 1,
-1.658082, -0.393544, -1.674898, 1, 0.2941177, 0, 1,
-1.645944, -0.6971653, -2.867933, 1, 0.3019608, 0, 1,
-1.64219, -0.6254541, -1.651503, 1, 0.3058824, 0, 1,
-1.635947, -2.041804, -1.483013, 1, 0.3137255, 0, 1,
-1.627867, -1.599176, -2.142322, 1, 0.3176471, 0, 1,
-1.617315, 0.3925408, -1.083606, 1, 0.3254902, 0, 1,
-1.61445, -0.026703, -0.6245269, 1, 0.3294118, 0, 1,
-1.606342, -1.260638, -3.005856, 1, 0.3372549, 0, 1,
-1.589318, -0.6858089, -2.724265, 1, 0.3411765, 0, 1,
-1.585925, 0.263077, -2.572299, 1, 0.3490196, 0, 1,
-1.577475, -0.8762171, -2.410417, 1, 0.3529412, 0, 1,
-1.575561, 0.37784, -2.338962, 1, 0.3607843, 0, 1,
-1.575435, -2.41394, -1.735706, 1, 0.3647059, 0, 1,
-1.564225, 1.205789, -2.138808, 1, 0.372549, 0, 1,
-1.548076, 1.475309, -0.9614096, 1, 0.3764706, 0, 1,
-1.538301, -1.898902, -4.631955, 1, 0.3843137, 0, 1,
-1.53028, -0.428183, -2.764524, 1, 0.3882353, 0, 1,
-1.524222, 0.5909998, -0.8342513, 1, 0.3960784, 0, 1,
-1.509362, -0.06445985, -2.443054, 1, 0.4039216, 0, 1,
-1.509314, 0.267608, -1.225676, 1, 0.4078431, 0, 1,
-1.508724, 0.2225441, -1.492641, 1, 0.4156863, 0, 1,
-1.508487, -0.5274115, -2.483349, 1, 0.4196078, 0, 1,
-1.486719, -1.546536, -2.539952, 1, 0.427451, 0, 1,
-1.472213, 0.5245846, -0.785279, 1, 0.4313726, 0, 1,
-1.469612, -0.1516425, -1.474687, 1, 0.4392157, 0, 1,
-1.467236, -0.1430927, -0.624583, 1, 0.4431373, 0, 1,
-1.459034, -1.997648, -2.917548, 1, 0.4509804, 0, 1,
-1.452165, -1.178001, -0.7498286, 1, 0.454902, 0, 1,
-1.426143, 0.09909514, -1.390812, 1, 0.4627451, 0, 1,
-1.420288, -0.01012231, -1.197606, 1, 0.4666667, 0, 1,
-1.411672, 0.1345337, -0.3620366, 1, 0.4745098, 0, 1,
-1.409722, -1.287735, -3.811018, 1, 0.4784314, 0, 1,
-1.408681, 0.8525952, -2.665416, 1, 0.4862745, 0, 1,
-1.404771, 0.148698, -1.636362, 1, 0.4901961, 0, 1,
-1.39295, -0.09488418, -2.096911, 1, 0.4980392, 0, 1,
-1.389876, -0.2825673, -0.8031148, 1, 0.5058824, 0, 1,
-1.387779, -0.2989828, -1.543799, 1, 0.509804, 0, 1,
-1.382285, -0.9353292, -1.454621, 1, 0.5176471, 0, 1,
-1.379854, -0.06073679, -2.039294, 1, 0.5215687, 0, 1,
-1.378235, 0.407039, -0.8124387, 1, 0.5294118, 0, 1,
-1.364864, -0.8229774, -1.2017, 1, 0.5333334, 0, 1,
-1.364416, 1.374402, -0.1450412, 1, 0.5411765, 0, 1,
-1.363265, 0.3447297, -3.170275, 1, 0.5450981, 0, 1,
-1.362968, 0.8979836, -0.5255422, 1, 0.5529412, 0, 1,
-1.357821, 1.655049, -1.075359, 1, 0.5568628, 0, 1,
-1.356615, 0.003646811, -1.312783, 1, 0.5647059, 0, 1,
-1.350793, 0.3570666, -3.149825, 1, 0.5686275, 0, 1,
-1.349643, 1.116325, 0.07534909, 1, 0.5764706, 0, 1,
-1.344851, 1.421956, -1.31032, 1, 0.5803922, 0, 1,
-1.330488, -1.302103, -3.632632, 1, 0.5882353, 0, 1,
-1.327855, 0.4735959, -0.3375347, 1, 0.5921569, 0, 1,
-1.317273, 0.004829771, -2.060185, 1, 0.6, 0, 1,
-1.314453, -0.5713224, -1.193652, 1, 0.6078432, 0, 1,
-1.305278, -1.380591, -4.050041, 1, 0.6117647, 0, 1,
-1.299373, -0.8518375, -2.249888, 1, 0.6196079, 0, 1,
-1.289697, 0.9395817, -2.102297, 1, 0.6235294, 0, 1,
-1.275818, 1.215834, -1.486892, 1, 0.6313726, 0, 1,
-1.268996, -1.751436, -1.48848, 1, 0.6352941, 0, 1,
-1.266825, -0.5994352, -2.34441, 1, 0.6431373, 0, 1,
-1.263205, -0.9914685, -3.210162, 1, 0.6470588, 0, 1,
-1.256447, 1.236168, -1.324, 1, 0.654902, 0, 1,
-1.254665, 1.577361, -0.7940644, 1, 0.6588235, 0, 1,
-1.24229, -0.2820541, -0.7739491, 1, 0.6666667, 0, 1,
-1.242053, 1.1583, -0.2336693, 1, 0.6705883, 0, 1,
-1.216513, -0.63609, -2.429294, 1, 0.6784314, 0, 1,
-1.215775, 0.896853, 0.02267486, 1, 0.682353, 0, 1,
-1.208474, -0.2495515, -2.670628, 1, 0.6901961, 0, 1,
-1.204839, -1.978245, -3.489024, 1, 0.6941177, 0, 1,
-1.203893, -0.8500758, -1.856137, 1, 0.7019608, 0, 1,
-1.19551, 0.186985, -0.9267507, 1, 0.7098039, 0, 1,
-1.178976, -0.7775216, -2.924354, 1, 0.7137255, 0, 1,
-1.178398, -0.780414, -1.708109, 1, 0.7215686, 0, 1,
-1.167512, -0.9410026, -2.344783, 1, 0.7254902, 0, 1,
-1.164547, 0.587136, 0.6199702, 1, 0.7333333, 0, 1,
-1.159551, -0.7803943, -1.787265, 1, 0.7372549, 0, 1,
-1.158391, -0.01568498, -2.89204, 1, 0.7450981, 0, 1,
-1.157815, -0.3905833, -1.908774, 1, 0.7490196, 0, 1,
-1.157545, 0.2167023, -2.468359, 1, 0.7568628, 0, 1,
-1.155897, -0.2383258, -3.137592, 1, 0.7607843, 0, 1,
-1.147975, 0.2294497, -1.922856, 1, 0.7686275, 0, 1,
-1.131474, -0.6260326, -3.402148, 1, 0.772549, 0, 1,
-1.116241, -0.5408299, -1.711311, 1, 0.7803922, 0, 1,
-1.115592, 0.525617, -0.9527501, 1, 0.7843137, 0, 1,
-1.107171, 0.7119247, -0.6594034, 1, 0.7921569, 0, 1,
-1.102896, 1.163715, -0.03700252, 1, 0.7960784, 0, 1,
-1.090821, -0.3029231, -0.9021186, 1, 0.8039216, 0, 1,
-1.089632, 0.1088849, -1.22631, 1, 0.8117647, 0, 1,
-1.089319, -1.117681, -2.862989, 1, 0.8156863, 0, 1,
-1.088679, 0.8851296, -2.930893, 1, 0.8235294, 0, 1,
-1.075049, 1.149249, -0.6998972, 1, 0.827451, 0, 1,
-1.064159, -1.123423, -3.415253, 1, 0.8352941, 0, 1,
-1.036954, 2.290799, -0.3744463, 1, 0.8392157, 0, 1,
-1.036041, -0.4265422, -2.311846, 1, 0.8470588, 0, 1,
-1.035203, -1.781897, -2.079486, 1, 0.8509804, 0, 1,
-1.032983, -0.5327137, -0.005213541, 1, 0.8588235, 0, 1,
-1.032622, -0.2898457, -3.34529, 1, 0.8627451, 0, 1,
-1.025593, 0.2517532, -3.368099, 1, 0.8705882, 0, 1,
-1.022918, 0.4143738, -0.7972845, 1, 0.8745098, 0, 1,
-1.020617, 1.276292, 0.5120135, 1, 0.8823529, 0, 1,
-1.020267, 0.4744469, -0.6393886, 1, 0.8862745, 0, 1,
-1.007448, 1.142756, 0.02073343, 1, 0.8941177, 0, 1,
-1.003411, 0.273923, -1.106251, 1, 0.8980392, 0, 1,
-1.00284, -0.2624166, -1.778293, 1, 0.9058824, 0, 1,
-1.00239, 0.1297934, -0.9315475, 1, 0.9137255, 0, 1,
-1.001548, 0.7928725, -1.198695, 1, 0.9176471, 0, 1,
-0.996116, 2.592829, -1.672287, 1, 0.9254902, 0, 1,
-0.9953002, -0.4978712, -2.753837, 1, 0.9294118, 0, 1,
-0.9949771, 1.22551, -1.642647, 1, 0.9372549, 0, 1,
-0.9941086, 0.4763858, -1.619841, 1, 0.9411765, 0, 1,
-0.9887824, -1.11899, -2.746147, 1, 0.9490196, 0, 1,
-0.9818209, -0.2814051, -0.6129346, 1, 0.9529412, 0, 1,
-0.9686434, 0.8415068, 0.01817607, 1, 0.9607843, 0, 1,
-0.9663575, -0.02160428, -0.8817788, 1, 0.9647059, 0, 1,
-0.9636427, -2.62772, -2.366772, 1, 0.972549, 0, 1,
-0.9491608, 0.575637, -3.313237, 1, 0.9764706, 0, 1,
-0.9447986, 0.622484, -0.6829777, 1, 0.9843137, 0, 1,
-0.9440759, 1.600927, -0.4875647, 1, 0.9882353, 0, 1,
-0.9417239, 1.149367, -2.053067, 1, 0.9960784, 0, 1,
-0.9392624, 0.8671936, -1.537665, 0.9960784, 1, 0, 1,
-0.9378632, 0.7812411, -1.288105, 0.9921569, 1, 0, 1,
-0.9375394, -0.1882344, -0.9322433, 0.9843137, 1, 0, 1,
-0.9339962, 0.3629214, 0.1235255, 0.9803922, 1, 0, 1,
-0.9337193, 0.05391672, -0.6391869, 0.972549, 1, 0, 1,
-0.9218777, -1.590309, -3.835731, 0.9686275, 1, 0, 1,
-0.919478, 1.524234, -0.4981925, 0.9607843, 1, 0, 1,
-0.918298, -0.6997129, -3.081452, 0.9568627, 1, 0, 1,
-0.8965377, -0.2392903, -1.647202, 0.9490196, 1, 0, 1,
-0.8935317, -0.4719626, -2.89393, 0.945098, 1, 0, 1,
-0.8860041, 0.8377692, 0.06708729, 0.9372549, 1, 0, 1,
-0.8852438, -0.3730973, -2.472824, 0.9333333, 1, 0, 1,
-0.8850164, 0.8661209, -0.9582513, 0.9254902, 1, 0, 1,
-0.8780601, 0.680218, -1.08833, 0.9215686, 1, 0, 1,
-0.8745217, -1.62682, -1.201375, 0.9137255, 1, 0, 1,
-0.873314, 0.5350429, 0.1380244, 0.9098039, 1, 0, 1,
-0.8698182, 1.258312, -0.4705491, 0.9019608, 1, 0, 1,
-0.8697147, -0.006124113, -0.3406025, 0.8941177, 1, 0, 1,
-0.8687836, -1.671346, -3.346658, 0.8901961, 1, 0, 1,
-0.8665599, -0.5178991, -2.822353, 0.8823529, 1, 0, 1,
-0.8652822, -0.8093478, -0.897444, 0.8784314, 1, 0, 1,
-0.8595079, 0.4554667, -1.940826, 0.8705882, 1, 0, 1,
-0.8500636, -1.223172, -2.110149, 0.8666667, 1, 0, 1,
-0.8470088, -1.208579, -2.624606, 0.8588235, 1, 0, 1,
-0.8468366, -0.7454993, -2.447117, 0.854902, 1, 0, 1,
-0.8444126, -0.8551894, -4.619356, 0.8470588, 1, 0, 1,
-0.8398027, 0.07589208, -0.4731101, 0.8431373, 1, 0, 1,
-0.8397073, -0.2695352, -1.470114, 0.8352941, 1, 0, 1,
-0.8326438, 0.3301781, -2.14747, 0.8313726, 1, 0, 1,
-0.8227652, 0.1643426, -1.686082, 0.8235294, 1, 0, 1,
-0.821053, 0.8810276, 0.537843, 0.8196079, 1, 0, 1,
-0.8206964, -0.4319359, -2.30795, 0.8117647, 1, 0, 1,
-0.8205967, -0.4601002, -3.889642, 0.8078431, 1, 0, 1,
-0.8167645, -0.2259207, -2.357006, 0.8, 1, 0, 1,
-0.8116331, -0.3957458, -0.1876281, 0.7921569, 1, 0, 1,
-0.8100387, -0.4676827, -0.8377435, 0.7882353, 1, 0, 1,
-0.8088494, -0.1667755, -0.6161909, 0.7803922, 1, 0, 1,
-0.808486, -0.9548896, -3.009588, 0.7764706, 1, 0, 1,
-0.8084688, -1.934219, -0.7587158, 0.7686275, 1, 0, 1,
-0.8037274, 0.3049296, -3.446975, 0.7647059, 1, 0, 1,
-0.8010271, 1.871548, -0.7183825, 0.7568628, 1, 0, 1,
-0.7990909, 1.575831, -1.017585, 0.7529412, 1, 0, 1,
-0.7988073, -0.11394, -0.9177349, 0.7450981, 1, 0, 1,
-0.7929632, -1.060226, -1.844701, 0.7411765, 1, 0, 1,
-0.7919625, -0.7638509, -3.338859, 0.7333333, 1, 0, 1,
-0.7915927, -0.1205341, -1.371556, 0.7294118, 1, 0, 1,
-0.7901036, 2.624406, -0.8415632, 0.7215686, 1, 0, 1,
-0.7898959, 0.4293492, 2.295107, 0.7176471, 1, 0, 1,
-0.7884137, -0.2832496, -1.99253, 0.7098039, 1, 0, 1,
-0.7829475, -1.265499, -2.310916, 0.7058824, 1, 0, 1,
-0.7652705, -0.6449075, -2.119212, 0.6980392, 1, 0, 1,
-0.7638249, 1.18783, -0.2839172, 0.6901961, 1, 0, 1,
-0.7571695, 1.341073, -0.7449108, 0.6862745, 1, 0, 1,
-0.7558617, 0.8467215, -0.2801979, 0.6784314, 1, 0, 1,
-0.7548984, -0.1134713, -0.4311098, 0.6745098, 1, 0, 1,
-0.7519348, -1.118487, -1.628674, 0.6666667, 1, 0, 1,
-0.7515304, 0.6082338, -1.130458, 0.6627451, 1, 0, 1,
-0.7451829, 1.956181, 0.1858581, 0.654902, 1, 0, 1,
-0.7433847, 0.01660078, -1.424029, 0.6509804, 1, 0, 1,
-0.7429758, 1.671839, 0.3894029, 0.6431373, 1, 0, 1,
-0.7372246, 2.755708, 2.558867, 0.6392157, 1, 0, 1,
-0.7309366, 0.4542633, -0.06424195, 0.6313726, 1, 0, 1,
-0.7301305, 0.629442, -1.501339, 0.627451, 1, 0, 1,
-0.7291698, 0.8620456, -2.896314, 0.6196079, 1, 0, 1,
-0.7258469, 0.9178338, 0.5867352, 0.6156863, 1, 0, 1,
-0.7213162, -0.2250947, -1.465444, 0.6078432, 1, 0, 1,
-0.7160205, 0.5110109, -2.552215, 0.6039216, 1, 0, 1,
-0.713766, 1.534004, 0.1173576, 0.5960785, 1, 0, 1,
-0.7092577, -1.09349, -3.357416, 0.5882353, 1, 0, 1,
-0.7085406, -0.09864277, -2.765025, 0.5843138, 1, 0, 1,
-0.7065398, 0.218916, -0.7303379, 0.5764706, 1, 0, 1,
-0.7018306, 1.196118, 0.29379, 0.572549, 1, 0, 1,
-0.7017617, 0.9065464, -0.5249982, 0.5647059, 1, 0, 1,
-0.701347, 0.007876759, -3.570641, 0.5607843, 1, 0, 1,
-0.6992408, -0.5371946, -2.457092, 0.5529412, 1, 0, 1,
-0.6923409, -0.1100482, -1.777855, 0.5490196, 1, 0, 1,
-0.6884112, 0.8846816, 0.2847557, 0.5411765, 1, 0, 1,
-0.6880726, -0.1296858, -1.712967, 0.5372549, 1, 0, 1,
-0.6792265, 1.398458, 1.047111, 0.5294118, 1, 0, 1,
-0.6741413, 0.9065272, -1.413753, 0.5254902, 1, 0, 1,
-0.6740729, -1.145513, -2.201295, 0.5176471, 1, 0, 1,
-0.6729747, 0.783379, -2.524639, 0.5137255, 1, 0, 1,
-0.6718717, -0.04513671, -1.669335, 0.5058824, 1, 0, 1,
-0.6693658, 0.1657763, -1.019821, 0.5019608, 1, 0, 1,
-0.6606982, -0.8359692, -1.732071, 0.4941176, 1, 0, 1,
-0.6564265, -0.119418, -2.854211, 0.4862745, 1, 0, 1,
-0.6560166, 1.071187, -1.520819, 0.4823529, 1, 0, 1,
-0.6557881, -0.1258203, -2.791878, 0.4745098, 1, 0, 1,
-0.6539241, 0.4715012, 0.4775665, 0.4705882, 1, 0, 1,
-0.6519323, -0.06386595, -1.743379, 0.4627451, 1, 0, 1,
-0.6516687, 1.634599, -1.420516, 0.4588235, 1, 0, 1,
-0.6492251, 2.009554, -0.09818669, 0.4509804, 1, 0, 1,
-0.6482072, -0.4099751, -1.719694, 0.4470588, 1, 0, 1,
-0.646656, 0.1629817, -0.7822376, 0.4392157, 1, 0, 1,
-0.6409367, 0.5458534, -0.5965738, 0.4352941, 1, 0, 1,
-0.6397194, 0.4287843, -2.11489, 0.427451, 1, 0, 1,
-0.6389681, 1.085503, 0.4723151, 0.4235294, 1, 0, 1,
-0.6358156, 0.3963482, -2.177043, 0.4156863, 1, 0, 1,
-0.6314917, 1.4199, -0.1571648, 0.4117647, 1, 0, 1,
-0.6293567, 0.9372504, -0.9042645, 0.4039216, 1, 0, 1,
-0.6290103, 0.2266855, -0.4183525, 0.3960784, 1, 0, 1,
-0.6265247, 0.4130391, -1.107497, 0.3921569, 1, 0, 1,
-0.6236576, 0.7596809, -0.3042929, 0.3843137, 1, 0, 1,
-0.6220472, -0.4662181, -2.322995, 0.3803922, 1, 0, 1,
-0.6159988, -0.3912056, -1.161056, 0.372549, 1, 0, 1,
-0.6112032, -1.346136, -1.159788, 0.3686275, 1, 0, 1,
-0.6063964, -0.4156556, -2.169342, 0.3607843, 1, 0, 1,
-0.6049948, -1.006229, -2.648165, 0.3568628, 1, 0, 1,
-0.6028098, -1.645526, -1.197945, 0.3490196, 1, 0, 1,
-0.6002496, 0.1322533, -0.5108149, 0.345098, 1, 0, 1,
-0.5979449, 0.8226458, -0.5395951, 0.3372549, 1, 0, 1,
-0.5940408, 0.1869606, -2.158226, 0.3333333, 1, 0, 1,
-0.5906448, 0.3098412, -0.9448193, 0.3254902, 1, 0, 1,
-0.586329, 0.2626671, -2.087699, 0.3215686, 1, 0, 1,
-0.5854304, -0.7007905, -1.658526, 0.3137255, 1, 0, 1,
-0.574235, 0.2017201, -2.050541, 0.3098039, 1, 0, 1,
-0.5733318, 0.5576039, -1.758157, 0.3019608, 1, 0, 1,
-0.5721252, 1.382864, 1.285232, 0.2941177, 1, 0, 1,
-0.5710223, 1.056545, 0.1315036, 0.2901961, 1, 0, 1,
-0.5670657, -1.059257, -1.806985, 0.282353, 1, 0, 1,
-0.5592544, 0.4906632, -1.380777, 0.2784314, 1, 0, 1,
-0.5447052, -0.8261666, -3.609288, 0.2705882, 1, 0, 1,
-0.5442352, -0.988469, -3.229542, 0.2666667, 1, 0, 1,
-0.5415936, 0.027476, -1.329786, 0.2588235, 1, 0, 1,
-0.5393503, -2.236519, -1.121717, 0.254902, 1, 0, 1,
-0.5389335, -0.1501066, -2.558764, 0.2470588, 1, 0, 1,
-0.537644, -0.6089443, -1.837304, 0.2431373, 1, 0, 1,
-0.5374546, 2.047076, -0.712289, 0.2352941, 1, 0, 1,
-0.5329687, 0.9597903, 0.2215066, 0.2313726, 1, 0, 1,
-0.5279878, -0.08247509, -0.6748602, 0.2235294, 1, 0, 1,
-0.5271562, -1.182667, -4.863956, 0.2196078, 1, 0, 1,
-0.5247216, 0.4564174, -3.281117, 0.2117647, 1, 0, 1,
-0.5234271, 0.9052572, -0.5276488, 0.2078431, 1, 0, 1,
-0.5206445, 1.2217, -2.209565, 0.2, 1, 0, 1,
-0.5145401, 0.9083377, -0.08747646, 0.1921569, 1, 0, 1,
-0.5134909, 1.559287, 0.03488318, 0.1882353, 1, 0, 1,
-0.5134659, 1.628747, 0.5017664, 0.1803922, 1, 0, 1,
-0.51345, 0.4625351, -0.6043503, 0.1764706, 1, 0, 1,
-0.5124382, -1.158866, -2.476496, 0.1686275, 1, 0, 1,
-0.5122979, -0.440153, -2.524948, 0.1647059, 1, 0, 1,
-0.5069687, 1.263409, 1.356326, 0.1568628, 1, 0, 1,
-0.5021265, 0.7115086, -0.6783282, 0.1529412, 1, 0, 1,
-0.4975264, -0.2792235, -1.561156, 0.145098, 1, 0, 1,
-0.4954369, -2.61054, -4.220149, 0.1411765, 1, 0, 1,
-0.4892077, 0.541451, -2.275081, 0.1333333, 1, 0, 1,
-0.4890062, 0.428307, -0.02004579, 0.1294118, 1, 0, 1,
-0.4885842, -1.347415, -0.5967276, 0.1215686, 1, 0, 1,
-0.4879898, -0.2320439, -1.582236, 0.1176471, 1, 0, 1,
-0.485608, -0.8331486, -0.8813073, 0.1098039, 1, 0, 1,
-0.4849703, 0.7468079, -1.667028, 0.1058824, 1, 0, 1,
-0.4829009, 0.4288968, -2.191799, 0.09803922, 1, 0, 1,
-0.4816201, -0.7430986, -2.656645, 0.09019608, 1, 0, 1,
-0.4795431, 0.24174, -3.361552, 0.08627451, 1, 0, 1,
-0.4786802, 2.6538, -0.1305169, 0.07843138, 1, 0, 1,
-0.4769181, 1.147343, -0.178908, 0.07450981, 1, 0, 1,
-0.4764245, 0.3045426, 0.02706984, 0.06666667, 1, 0, 1,
-0.4761307, -1.061195, -3.363385, 0.0627451, 1, 0, 1,
-0.4732771, 0.4681641, -1.112297, 0.05490196, 1, 0, 1,
-0.4639426, -0.06960175, 0.5415986, 0.05098039, 1, 0, 1,
-0.4626389, 0.09602367, -2.336279, 0.04313726, 1, 0, 1,
-0.4605619, 0.1394827, -1.392567, 0.03921569, 1, 0, 1,
-0.4601312, 0.4768181, -1.091668, 0.03137255, 1, 0, 1,
-0.4512099, -0.8973552, -3.901806, 0.02745098, 1, 0, 1,
-0.4440399, -0.8476442, -1.754087, 0.01960784, 1, 0, 1,
-0.4424447, 0.964554, 0.5163888, 0.01568628, 1, 0, 1,
-0.4389625, -1.303746, -3.957589, 0.007843138, 1, 0, 1,
-0.4354084, -1.001147, -3.246659, 0.003921569, 1, 0, 1,
-0.4351401, -0.504319, -1.702367, 0, 1, 0.003921569, 1,
-0.4297001, -0.7362423, -4.262012, 0, 1, 0.01176471, 1,
-0.4294511, 0.2164103, -1.687863, 0, 1, 0.01568628, 1,
-0.4294035, 1.322912, -0.5790911, 0, 1, 0.02352941, 1,
-0.4223084, -1.081428, -4.032167, 0, 1, 0.02745098, 1,
-0.4221698, -1.22003, -1.845383, 0, 1, 0.03529412, 1,
-0.4126566, -0.7956809, -2.329414, 0, 1, 0.03921569, 1,
-0.4102847, -0.1413424, -2.190743, 0, 1, 0.04705882, 1,
-0.4096448, 0.8560743, -0.8060396, 0, 1, 0.05098039, 1,
-0.4058982, -0.310039, -1.919244, 0, 1, 0.05882353, 1,
-0.4045594, 0.8171408, -0.7116762, 0, 1, 0.0627451, 1,
-0.4036207, -1.202957, -3.36292, 0, 1, 0.07058824, 1,
-0.4023235, -0.07042949, -2.919392, 0, 1, 0.07450981, 1,
-0.3956739, -0.008938444, -1.663383, 0, 1, 0.08235294, 1,
-0.3940464, -1.369158, -2.097413, 0, 1, 0.08627451, 1,
-0.3926891, -1.36218, -3.340249, 0, 1, 0.09411765, 1,
-0.3887914, 0.8614752, -0.07703441, 0, 1, 0.1019608, 1,
-0.3846633, 0.7737317, 1.132236, 0, 1, 0.1058824, 1,
-0.3845218, 2.498602, -0.6589458, 0, 1, 0.1137255, 1,
-0.3829343, 1.289083, -0.3860782, 0, 1, 0.1176471, 1,
-0.3807644, 1.976428, -0.6722286, 0, 1, 0.1254902, 1,
-0.3805665, 2.138218, -0.6232513, 0, 1, 0.1294118, 1,
-0.3786045, 1.064577, 0.07162931, 0, 1, 0.1372549, 1,
-0.3783374, 1.213951, -0.7811764, 0, 1, 0.1411765, 1,
-0.3763635, 1.208746, -0.7810699, 0, 1, 0.1490196, 1,
-0.3732691, -1.396974, -2.306478, 0, 1, 0.1529412, 1,
-0.3725667, -0.2956197, -1.870893, 0, 1, 0.1607843, 1,
-0.3695713, -0.2596795, -2.337231, 0, 1, 0.1647059, 1,
-0.3670335, -0.3212599, -2.80208, 0, 1, 0.172549, 1,
-0.3669019, -0.4377886, -2.841563, 0, 1, 0.1764706, 1,
-0.3652955, 0.05080126, -3.521023, 0, 1, 0.1843137, 1,
-0.3632575, -0.7311161, -3.010907, 0, 1, 0.1882353, 1,
-0.3631064, 0.6735382, -2.492489, 0, 1, 0.1960784, 1,
-0.3592688, 0.9526345, -0.5749919, 0, 1, 0.2039216, 1,
-0.3583467, -0.9156197, -3.834943, 0, 1, 0.2078431, 1,
-0.3497007, -0.8173057, -3.64866, 0, 1, 0.2156863, 1,
-0.3431868, -1.002595, -0.8338964, 0, 1, 0.2196078, 1,
-0.3422506, 1.192392, -1.359643, 0, 1, 0.227451, 1,
-0.3388574, 1.378102, 0.5214134, 0, 1, 0.2313726, 1,
-0.3359334, 1.63905, -3.429731, 0, 1, 0.2392157, 1,
-0.3326564, 0.9166122, 1.435437, 0, 1, 0.2431373, 1,
-0.3220398, -0.1012547, -1.262433, 0, 1, 0.2509804, 1,
-0.3182364, -0.5672635, -3.077652, 0, 1, 0.254902, 1,
-0.3156055, -0.5623263, -2.8057, 0, 1, 0.2627451, 1,
-0.3111548, 0.3650821, -0.9928899, 0, 1, 0.2666667, 1,
-0.3098324, 0.5706498, -1.091168, 0, 1, 0.2745098, 1,
-0.3084619, 0.5806133, -0.6976292, 0, 1, 0.2784314, 1,
-0.2989286, 0.7696505, -0.8344299, 0, 1, 0.2862745, 1,
-0.2969021, -1.077693, -3.128637, 0, 1, 0.2901961, 1,
-0.2962392, -0.10465, -1.165867, 0, 1, 0.2980392, 1,
-0.2922168, 1.494461, -0.1702879, 0, 1, 0.3058824, 1,
-0.2896132, 0.05298993, 0.8169372, 0, 1, 0.3098039, 1,
-0.2842136, 0.4533421, -1.725253, 0, 1, 0.3176471, 1,
-0.2826681, -0.7127771, -2.643432, 0, 1, 0.3215686, 1,
-0.2823437, 1.062694, 0.06474353, 0, 1, 0.3294118, 1,
-0.2741555, -0.8858179, -2.834858, 0, 1, 0.3333333, 1,
-0.2733931, -1.081519, -2.403809, 0, 1, 0.3411765, 1,
-0.2729352, -2.029338, -2.137736, 0, 1, 0.345098, 1,
-0.2707272, 1.178443, -0.6971865, 0, 1, 0.3529412, 1,
-0.2681476, 0.7488273, -0.4504139, 0, 1, 0.3568628, 1,
-0.2673627, 1.473692, -0.6224359, 0, 1, 0.3647059, 1,
-0.2672534, -1.91893, -3.574449, 0, 1, 0.3686275, 1,
-0.2668345, 1.054057, -0.7203946, 0, 1, 0.3764706, 1,
-0.2632381, -0.5201973, -2.783087, 0, 1, 0.3803922, 1,
-0.263031, 0.9585137, -1.79044, 0, 1, 0.3882353, 1,
-0.2630118, 0.4708531, 0.3879922, 0, 1, 0.3921569, 1,
-0.2601486, 1.204875, 0.4569038, 0, 1, 0.4, 1,
-0.2563713, -1.391409, -5.036103, 0, 1, 0.4078431, 1,
-0.2530372, -0.1716443, -3.100508, 0, 1, 0.4117647, 1,
-0.2474683, 0.3493687, -0.3853291, 0, 1, 0.4196078, 1,
-0.2461317, 0.1245724, -0.3768368, 0, 1, 0.4235294, 1,
-0.2370045, 0.4732265, -0.1337982, 0, 1, 0.4313726, 1,
-0.2363009, 0.01199395, -0.5918731, 0, 1, 0.4352941, 1,
-0.2350936, 0.7873401, 1.645289, 0, 1, 0.4431373, 1,
-0.2349438, 0.5250956, 0.4904149, 0, 1, 0.4470588, 1,
-0.233982, -2.3607, -3.611835, 0, 1, 0.454902, 1,
-0.2334339, -0.8537638, -2.190531, 0, 1, 0.4588235, 1,
-0.2317776, -1.597993, -2.791998, 0, 1, 0.4666667, 1,
-0.2293078, 1.149154, -0.6533129, 0, 1, 0.4705882, 1,
-0.2267873, -0.6605595, -2.921619, 0, 1, 0.4784314, 1,
-0.2178151, -0.09871621, -1.184056, 0, 1, 0.4823529, 1,
-0.2101393, 1.549353, -0.3560124, 0, 1, 0.4901961, 1,
-0.2087833, 1.765797, 0.7315308, 0, 1, 0.4941176, 1,
-0.1998452, 0.5849448, 0.1134753, 0, 1, 0.5019608, 1,
-0.1989969, 0.1090214, -0.5582026, 0, 1, 0.509804, 1,
-0.1802624, -1.372306, -2.438182, 0, 1, 0.5137255, 1,
-0.1773029, 1.018989, 0.04621445, 0, 1, 0.5215687, 1,
-0.1760053, -0.7615736, -3.061485, 0, 1, 0.5254902, 1,
-0.1717427, 0.2224658, -0.3852201, 0, 1, 0.5333334, 1,
-0.1680836, -0.4856548, -3.779919, 0, 1, 0.5372549, 1,
-0.1660006, 0.6143067, -0.5344058, 0, 1, 0.5450981, 1,
-0.1650258, -1.424271, -3.777187, 0, 1, 0.5490196, 1,
-0.1594307, 1.492669, -1.759858, 0, 1, 0.5568628, 1,
-0.1573308, 1.185877, -0.5361571, 0, 1, 0.5607843, 1,
-0.1552423, 0.4830031, -2.023601, 0, 1, 0.5686275, 1,
-0.1540372, -0.4850826, -3.901693, 0, 1, 0.572549, 1,
-0.1523563, -1.230333, -3.711725, 0, 1, 0.5803922, 1,
-0.1483679, -0.4514647, -3.362277, 0, 1, 0.5843138, 1,
-0.1477455, -0.2296284, -0.6415426, 0, 1, 0.5921569, 1,
-0.1471572, 1.480244, -1.441783, 0, 1, 0.5960785, 1,
-0.1463163, 0.07062535, -3.043172, 0, 1, 0.6039216, 1,
-0.1456455, -1.104176, -3.130821, 0, 1, 0.6117647, 1,
-0.1449342, -0.25344, -2.564706, 0, 1, 0.6156863, 1,
-0.1423135, -1.388062, -2.848481, 0, 1, 0.6235294, 1,
-0.1305091, 2.264926, 1.421187, 0, 1, 0.627451, 1,
-0.1241646, -1.014108, -4.923036, 0, 1, 0.6352941, 1,
-0.120921, 0.9542224, -1.011787, 0, 1, 0.6392157, 1,
-0.1202956, -0.05017776, -1.075927, 0, 1, 0.6470588, 1,
-0.1202055, 1.873517, 0.920114, 0, 1, 0.6509804, 1,
-0.1194796, -0.08127773, 0.03724075, 0, 1, 0.6588235, 1,
-0.1162398, -0.5162672, -3.301383, 0, 1, 0.6627451, 1,
-0.1150715, -0.4744097, -3.94839, 0, 1, 0.6705883, 1,
-0.1113613, 0.1244821, 0.7501905, 0, 1, 0.6745098, 1,
-0.1080726, 0.7748685, 0.4196172, 0, 1, 0.682353, 1,
-0.105116, -0.7470046, -2.975, 0, 1, 0.6862745, 1,
-0.101363, -2.442173, -3.475422, 0, 1, 0.6941177, 1,
-0.09930795, -0.3703959, -3.376075, 0, 1, 0.7019608, 1,
-0.09830159, -0.001081628, -1.048976, 0, 1, 0.7058824, 1,
-0.09815919, 0.4702225, 0.2896904, 0, 1, 0.7137255, 1,
-0.09764141, -2.581774, -3.555267, 0, 1, 0.7176471, 1,
-0.09448548, 1.820444, 0.1087503, 0, 1, 0.7254902, 1,
-0.08665313, 2.031307, -1.178916, 0, 1, 0.7294118, 1,
-0.08652267, 1.074444, 0.941405, 0, 1, 0.7372549, 1,
-0.08561371, 0.7694986, -0.01324835, 0, 1, 0.7411765, 1,
-0.08346711, -1.100464, -1.756494, 0, 1, 0.7490196, 1,
-0.07935426, -1.494878, -3.86691, 0, 1, 0.7529412, 1,
-0.07723398, 0.5694035, -1.067006, 0, 1, 0.7607843, 1,
-0.07621277, 0.258562, 0.2261444, 0, 1, 0.7647059, 1,
-0.07022862, -1.560424, -2.648485, 0, 1, 0.772549, 1,
-0.06988688, 2.067563, -0.04078954, 0, 1, 0.7764706, 1,
-0.06623405, -0.1890668, -2.897698, 0, 1, 0.7843137, 1,
-0.06487021, 0.3090297, -0.8767971, 0, 1, 0.7882353, 1,
-0.06011945, 0.009890382, -0.1431071, 0, 1, 0.7960784, 1,
-0.05542037, 0.5846776, 0.9788266, 0, 1, 0.8039216, 1,
-0.04941613, 1.936163, 1.501939, 0, 1, 0.8078431, 1,
-0.04470512, -0.1890117, -1.273775, 0, 1, 0.8156863, 1,
-0.04180938, -0.1337359, -2.687523, 0, 1, 0.8196079, 1,
-0.04014365, -0.8775783, -4.140237, 0, 1, 0.827451, 1,
-0.03910646, -0.8302355, -2.51352, 0, 1, 0.8313726, 1,
-0.03909801, 0.9695976, 1.184981, 0, 1, 0.8392157, 1,
-0.03462997, -0.2261425, -3.800235, 0, 1, 0.8431373, 1,
-0.03282178, -0.5250906, -3.322151, 0, 1, 0.8509804, 1,
-0.02960369, 0.8582544, 1.26098, 0, 1, 0.854902, 1,
-0.02836066, -0.8940684, -2.010736, 0, 1, 0.8627451, 1,
-0.02789806, 0.8596912, -2.601474, 0, 1, 0.8666667, 1,
-0.0267565, -1.706127, -4.27803, 0, 1, 0.8745098, 1,
-0.02562541, -0.4151101, -3.07248, 0, 1, 0.8784314, 1,
-0.02557417, -0.02254796, -1.183734, 0, 1, 0.8862745, 1,
-0.01718329, 0.3612021, 1.199076, 0, 1, 0.8901961, 1,
-0.01437062, 0.7318817, -0.2748191, 0, 1, 0.8980392, 1,
-0.009192027, 1.9591, -0.6678594, 0, 1, 0.9058824, 1,
-0.005089511, 1.713366, -1.02044, 0, 1, 0.9098039, 1,
-0.002154857, -1.246776, -2.004549, 0, 1, 0.9176471, 1,
-0.001857005, -0.8821919, -1.618469, 0, 1, 0.9215686, 1,
0.003003545, -0.09489991, 3.112526, 0, 1, 0.9294118, 1,
0.004572468, -0.04817893, 3.172641, 0, 1, 0.9333333, 1,
0.005674398, 0.8966718, 0.8345099, 0, 1, 0.9411765, 1,
0.006388424, 0.6923902, 0.4709584, 0, 1, 0.945098, 1,
0.009227874, -0.9451581, 1.833181, 0, 1, 0.9529412, 1,
0.01388254, -0.5110494, 3.364401, 0, 1, 0.9568627, 1,
0.0144767, -0.3697675, 1.969818, 0, 1, 0.9647059, 1,
0.01505765, -0.5534833, 3.475176, 0, 1, 0.9686275, 1,
0.01536031, 0.0980314, -0.8085005, 0, 1, 0.9764706, 1,
0.01753732, 0.1787904, -1.050825, 0, 1, 0.9803922, 1,
0.01799273, -2.566332, 1.712765, 0, 1, 0.9882353, 1,
0.02436439, -0.2905284, 4.844237, 0, 1, 0.9921569, 1,
0.02648383, 1.226854, 3.230187, 0, 1, 1, 1,
0.02994468, 1.197595, -0.4028479, 0, 0.9921569, 1, 1,
0.03026045, -2.150826, 2.342344, 0, 0.9882353, 1, 1,
0.03043207, 1.212912, 1.371516, 0, 0.9803922, 1, 1,
0.03429244, -1.099649, 0.6605774, 0, 0.9764706, 1, 1,
0.03640857, 0.843154, -0.006601614, 0, 0.9686275, 1, 1,
0.03770552, -1.662919, 3.941213, 0, 0.9647059, 1, 1,
0.03915073, 1.572252, 0.600344, 0, 0.9568627, 1, 1,
0.04154094, -0.7122969, 2.353099, 0, 0.9529412, 1, 1,
0.04225807, -0.5055926, 3.044483, 0, 0.945098, 1, 1,
0.04315306, 0.0682485, -0.1621502, 0, 0.9411765, 1, 1,
0.04458736, 0.02161965, -0.193441, 0, 0.9333333, 1, 1,
0.04622126, -0.6325551, 2.497217, 0, 0.9294118, 1, 1,
0.04704018, -0.03147723, 3.456812, 0, 0.9215686, 1, 1,
0.04841791, -1.856854, 3.720082, 0, 0.9176471, 1, 1,
0.04992202, 1.386989, -1.204012, 0, 0.9098039, 1, 1,
0.05139535, -0.7730269, 3.549308, 0, 0.9058824, 1, 1,
0.05145893, 1.347593, -0.7414199, 0, 0.8980392, 1, 1,
0.05214622, 0.5960203, -1.223687, 0, 0.8901961, 1, 1,
0.05279071, 1.045507, 1.375473, 0, 0.8862745, 1, 1,
0.05792042, 0.6634721, 0.3849591, 0, 0.8784314, 1, 1,
0.05890751, 0.8575602, 0.3471772, 0, 0.8745098, 1, 1,
0.05935005, -0.5608975, 1.398579, 0, 0.8666667, 1, 1,
0.06040862, -1.309492, 5.029817, 0, 0.8627451, 1, 1,
0.06255066, -1.100543, 2.29502, 0, 0.854902, 1, 1,
0.06569712, -0.8714759, 2.261145, 0, 0.8509804, 1, 1,
0.06860007, -1.346613, 4.503178, 0, 0.8431373, 1, 1,
0.07041869, -0.466071, 2.377144, 0, 0.8392157, 1, 1,
0.07371715, 0.9806084, -1.030832, 0, 0.8313726, 1, 1,
0.07444059, -0.3831457, 6.262738, 0, 0.827451, 1, 1,
0.0745826, 2.472106, -0.6715934, 0, 0.8196079, 1, 1,
0.07600623, 0.4103704, -0.6176462, 0, 0.8156863, 1, 1,
0.07618634, -0.4107183, 1.432871, 0, 0.8078431, 1, 1,
0.0794621, 0.8297457, -0.3084199, 0, 0.8039216, 1, 1,
0.08072794, -1.045459, 4.321163, 0, 0.7960784, 1, 1,
0.08223318, -1.029886, 2.80588, 0, 0.7882353, 1, 1,
0.08357317, 0.7907521, -0.05718815, 0, 0.7843137, 1, 1,
0.08760303, 0.9793874, -0.4061163, 0, 0.7764706, 1, 1,
0.09194404, 2.409204, 1.477759, 0, 0.772549, 1, 1,
0.09300534, 0.8048921, -0.5823265, 0, 0.7647059, 1, 1,
0.09343913, -1.007715, 4.717453, 0, 0.7607843, 1, 1,
0.09604989, -0.723784, 4.055625, 0, 0.7529412, 1, 1,
0.1004853, 2.08884, -0.2025874, 0, 0.7490196, 1, 1,
0.1010053, 0.6886433, -0.5141649, 0, 0.7411765, 1, 1,
0.1017111, 0.8339005, -0.43061, 0, 0.7372549, 1, 1,
0.1037615, 0.09387066, 0.9852394, 0, 0.7294118, 1, 1,
0.1090553, 1.757545, -0.03479282, 0, 0.7254902, 1, 1,
0.1192877, -0.5266197, 3.742088, 0, 0.7176471, 1, 1,
0.1216667, -1.655575, 3.044327, 0, 0.7137255, 1, 1,
0.1225951, 1.447459, -0.09332933, 0, 0.7058824, 1, 1,
0.1248366, 1.532893, -0.4221464, 0, 0.6980392, 1, 1,
0.1259865, -2.007044, 2.436545, 0, 0.6941177, 1, 1,
0.1265681, 0.293705, -1.03353, 0, 0.6862745, 1, 1,
0.1288606, -0.2658944, 3.271198, 0, 0.682353, 1, 1,
0.1365989, -0.2355191, 2.981956, 0, 0.6745098, 1, 1,
0.1385239, -0.8090695, 3.054557, 0, 0.6705883, 1, 1,
0.1399068, 2.324482, 0.7510261, 0, 0.6627451, 1, 1,
0.1411828, -0.3308072, 1.77412, 0, 0.6588235, 1, 1,
0.1421593, -0.002122303, 2.209261, 0, 0.6509804, 1, 1,
0.1484616, -0.5651211, 4.76438, 0, 0.6470588, 1, 1,
0.1494755, -0.5707357, 3.8958, 0, 0.6392157, 1, 1,
0.1505271, 1.265532, -1.71844, 0, 0.6352941, 1, 1,
0.1529125, -1.859823, 2.841145, 0, 0.627451, 1, 1,
0.1532892, -1.031715, 2.795112, 0, 0.6235294, 1, 1,
0.154761, -0.1404906, 3.025801, 0, 0.6156863, 1, 1,
0.1570089, 0.6601887, 0.4090929, 0, 0.6117647, 1, 1,
0.162023, -1.312608, 2.755908, 0, 0.6039216, 1, 1,
0.1709894, -0.7981631, 3.141994, 0, 0.5960785, 1, 1,
0.1766931, 0.115661, 1.723391, 0, 0.5921569, 1, 1,
0.1767289, 1.790089, -0.1582836, 0, 0.5843138, 1, 1,
0.1860136, 0.6262596, -0.2737607, 0, 0.5803922, 1, 1,
0.1860657, 1.049543, -0.3713084, 0, 0.572549, 1, 1,
0.1940641, -0.8729974, 2.664227, 0, 0.5686275, 1, 1,
0.1985108, 1.888612, -0.3142055, 0, 0.5607843, 1, 1,
0.1996621, 1.005249, 1.382959, 0, 0.5568628, 1, 1,
0.2004457, -1.28041, 3.25542, 0, 0.5490196, 1, 1,
0.2049222, 0.09367838, 0.04431107, 0, 0.5450981, 1, 1,
0.2061215, 1.166734, 0.9808319, 0, 0.5372549, 1, 1,
0.2073657, 0.54385, 0.7393057, 0, 0.5333334, 1, 1,
0.2105971, -1.784045, 2.867401, 0, 0.5254902, 1, 1,
0.2168114, -1.042598, 3.889829, 0, 0.5215687, 1, 1,
0.2171237, -0.4379652, 3.174524, 0, 0.5137255, 1, 1,
0.2195755, 1.093048, 1.205463, 0, 0.509804, 1, 1,
0.2201808, -1.886781, 2.461175, 0, 0.5019608, 1, 1,
0.2228506, 0.008724985, 1.221163, 0, 0.4941176, 1, 1,
0.2246561, 2.348149, -1.17827, 0, 0.4901961, 1, 1,
0.2248972, 1.036132, 1.044566, 0, 0.4823529, 1, 1,
0.230766, 0.9124388, -0.3384258, 0, 0.4784314, 1, 1,
0.2341893, -0.8718863, 1.558515, 0, 0.4705882, 1, 1,
0.2372106, -0.8486831, 1.878487, 0, 0.4666667, 1, 1,
0.2377711, -1.313164, 3.069821, 0, 0.4588235, 1, 1,
0.2400251, -0.1469617, 2.130639, 0, 0.454902, 1, 1,
0.2426836, -0.2611413, 1.829291, 0, 0.4470588, 1, 1,
0.2454636, 1.656336, -1.617705, 0, 0.4431373, 1, 1,
0.2499072, 0.5604547, 1.020066, 0, 0.4352941, 1, 1,
0.2538472, -1.287346, 3.067982, 0, 0.4313726, 1, 1,
0.2556564, 2.56717, -1.782305, 0, 0.4235294, 1, 1,
0.2578006, 0.1222423, 1.140852, 0, 0.4196078, 1, 1,
0.2625576, 0.1902667, 0.464268, 0, 0.4117647, 1, 1,
0.2736056, 0.1843636, 0.4801169, 0, 0.4078431, 1, 1,
0.2764186, 0.9079763, 0.8890017, 0, 0.4, 1, 1,
0.2782882, -0.4898782, 1.757648, 0, 0.3921569, 1, 1,
0.2805448, 1.160166, 2.267701, 0, 0.3882353, 1, 1,
0.2865717, -0.5460254, 2.78748, 0, 0.3803922, 1, 1,
0.2905732, 0.642203, 1.653225, 0, 0.3764706, 1, 1,
0.2907934, 0.4484603, 1.371732, 0, 0.3686275, 1, 1,
0.2908467, 1.149176, 0.3225791, 0, 0.3647059, 1, 1,
0.2922356, -0.3779745, 1.847853, 0, 0.3568628, 1, 1,
0.2948759, 0.1589479, 2.375533, 0, 0.3529412, 1, 1,
0.2966889, -0.8747407, 2.842223, 0, 0.345098, 1, 1,
0.2983971, 0.09837116, 0.9682974, 0, 0.3411765, 1, 1,
0.3007709, 0.648459, 1.992498, 0, 0.3333333, 1, 1,
0.3038172, -1.542825, 3.200653, 0, 0.3294118, 1, 1,
0.3059067, -0.3413919, 2.067324, 0, 0.3215686, 1, 1,
0.3063607, -0.9859642, 3.675131, 0, 0.3176471, 1, 1,
0.3074366, -0.4870091, 2.363672, 0, 0.3098039, 1, 1,
0.3075179, -2.066425, 2.388736, 0, 0.3058824, 1, 1,
0.3130758, -0.3395696, 1.07222, 0, 0.2980392, 1, 1,
0.3148321, -0.09948022, 1.54273, 0, 0.2901961, 1, 1,
0.3169912, -2.526919, 4.826367, 0, 0.2862745, 1, 1,
0.3225743, 0.6877926, 0.6366898, 0, 0.2784314, 1, 1,
0.3364144, 0.5250931, 0.417359, 0, 0.2745098, 1, 1,
0.3376923, -1.125611, 5.149152, 0, 0.2666667, 1, 1,
0.340464, -1.489862, 3.050595, 0, 0.2627451, 1, 1,
0.3432561, -0.2406719, 3.820521, 0, 0.254902, 1, 1,
0.3466589, 0.6962993, 1.537551, 0, 0.2509804, 1, 1,
0.3516939, 0.5797969, 2.279623, 0, 0.2431373, 1, 1,
0.3564751, 1.582313, 1.134834, 0, 0.2392157, 1, 1,
0.3688133, 0.1291777, 1.429032, 0, 0.2313726, 1, 1,
0.3752291, 1.209883, 1.247541, 0, 0.227451, 1, 1,
0.3840763, 0.6278595, 0.9046037, 0, 0.2196078, 1, 1,
0.3880779, -1.098082, 1.857352, 0, 0.2156863, 1, 1,
0.3944151, -2.088235, 3.6768, 0, 0.2078431, 1, 1,
0.3974457, 0.3365383, 1.231333, 0, 0.2039216, 1, 1,
0.3982988, 1.142125, 1.741785, 0, 0.1960784, 1, 1,
0.4013031, -0.8651024, 3.004093, 0, 0.1882353, 1, 1,
0.4055227, -0.07248528, 1.931445, 0, 0.1843137, 1, 1,
0.4057656, -0.3360357, 2.255946, 0, 0.1764706, 1, 1,
0.4086154, -0.7471859, 3.0769, 0, 0.172549, 1, 1,
0.4097399, -0.835768, 4.309714, 0, 0.1647059, 1, 1,
0.4099967, -0.9047796, 3.023106, 0, 0.1607843, 1, 1,
0.4122576, 0.2710944, 1.147285, 0, 0.1529412, 1, 1,
0.4130275, -0.202593, 1.036094, 0, 0.1490196, 1, 1,
0.4138591, 1.569314, 0.1326564, 0, 0.1411765, 1, 1,
0.4161339, 0.3760012, 2.167554, 0, 0.1372549, 1, 1,
0.4169946, 0.5394304, 0.2722711, 0, 0.1294118, 1, 1,
0.4170475, 0.1831266, 0.2527075, 0, 0.1254902, 1, 1,
0.4190042, -0.6762037, 2.867452, 0, 0.1176471, 1, 1,
0.4211354, -0.9341151, 2.323716, 0, 0.1137255, 1, 1,
0.4243824, -0.7754391, 3.580108, 0, 0.1058824, 1, 1,
0.4297517, 2.451817, -0.9365022, 0, 0.09803922, 1, 1,
0.4332521, 0.597272, -0.1023885, 0, 0.09411765, 1, 1,
0.4351388, -1.884214, 0.5619923, 0, 0.08627451, 1, 1,
0.4389564, 0.7789778, -0.2254466, 0, 0.08235294, 1, 1,
0.4409612, 0.9833429, 0.3763317, 0, 0.07450981, 1, 1,
0.4432128, 0.1281407, 1.251545, 0, 0.07058824, 1, 1,
0.4478775, 0.8572315, 0.05775713, 0, 0.0627451, 1, 1,
0.4484403, -0.5863023, 0.0692166, 0, 0.05882353, 1, 1,
0.4486748, 0.6880485, 0.2775612, 0, 0.05098039, 1, 1,
0.4493609, -0.1007809, 1.415156, 0, 0.04705882, 1, 1,
0.4575732, 0.3698796, 1.727128, 0, 0.03921569, 1, 1,
0.459298, -0.6071165, 0.7851308, 0, 0.03529412, 1, 1,
0.4647796, 0.1357321, 2.557519, 0, 0.02745098, 1, 1,
0.4649051, 0.2197214, 0.5121202, 0, 0.02352941, 1, 1,
0.4680792, -0.5287691, 1.659229, 0, 0.01568628, 1, 1,
0.4692769, 2.391626, 0.5361353, 0, 0.01176471, 1, 1,
0.4718621, 0.5589896, 0.4004962, 0, 0.003921569, 1, 1,
0.4721127, -0.9787019, 2.251631, 0.003921569, 0, 1, 1,
0.4756482, 1.07136, 1.463055, 0.007843138, 0, 1, 1,
0.4809385, -0.8730096, 3.80612, 0.01568628, 0, 1, 1,
0.4815218, -0.5395769, 2.547874, 0.01960784, 0, 1, 1,
0.4824482, 0.4817778, 0.3210772, 0.02745098, 0, 1, 1,
0.4920823, -0.06646173, 2.351525, 0.03137255, 0, 1, 1,
0.4987809, -0.7169477, 3.626789, 0.03921569, 0, 1, 1,
0.5010542, 0.2941667, 0.6673617, 0.04313726, 0, 1, 1,
0.5018765, -0.1370219, 1.929543, 0.05098039, 0, 1, 1,
0.5021253, -0.2358892, 1.801712, 0.05490196, 0, 1, 1,
0.5073676, -1.238234, 3.235198, 0.0627451, 0, 1, 1,
0.5120711, -1.662804, 2.98338, 0.06666667, 0, 1, 1,
0.5128373, 0.2473346, 1.100037, 0.07450981, 0, 1, 1,
0.5144429, -0.8170035, 1.580134, 0.07843138, 0, 1, 1,
0.5162792, -0.6142874, 1.88569, 0.08627451, 0, 1, 1,
0.5236127, 1.392884, -1.171244, 0.09019608, 0, 1, 1,
0.530665, 0.5769896, 1.233413, 0.09803922, 0, 1, 1,
0.5338187, 0.04984477, 4.265985, 0.1058824, 0, 1, 1,
0.5345712, 0.07745799, 2.005281, 0.1098039, 0, 1, 1,
0.5364441, 0.776544, 2.106054, 0.1176471, 0, 1, 1,
0.5365667, 0.493533, 2.876692, 0.1215686, 0, 1, 1,
0.5442442, 0.4991359, 0.251625, 0.1294118, 0, 1, 1,
0.5482443, 0.05612296, 1.535183, 0.1333333, 0, 1, 1,
0.5494322, 0.0441364, 1.679031, 0.1411765, 0, 1, 1,
0.5504711, -1.248296, 0.7734677, 0.145098, 0, 1, 1,
0.5521521, -0.4352119, 2.697513, 0.1529412, 0, 1, 1,
0.5620404, -1.13604, 0.3291332, 0.1568628, 0, 1, 1,
0.569245, -0.1085423, 2.521553, 0.1647059, 0, 1, 1,
0.5729886, -0.1842586, 2.618289, 0.1686275, 0, 1, 1,
0.5739183, -0.03120237, 3.156601, 0.1764706, 0, 1, 1,
0.5746335, -0.3335764, 2.58868, 0.1803922, 0, 1, 1,
0.5795224, 2.413873, 0.09471537, 0.1882353, 0, 1, 1,
0.582055, 1.400591, -0.7280937, 0.1921569, 0, 1, 1,
0.5838717, 0.8134103, 0.8910347, 0.2, 0, 1, 1,
0.5843984, -0.6955062, 2.98496, 0.2078431, 0, 1, 1,
0.5851527, -0.589011, 3.998756, 0.2117647, 0, 1, 1,
0.5889915, -0.1276214, 1.708079, 0.2196078, 0, 1, 1,
0.5901631, -0.1192607, 1.362979, 0.2235294, 0, 1, 1,
0.5903591, -0.7041161, 1.880675, 0.2313726, 0, 1, 1,
0.603008, -0.549243, 2.367801, 0.2352941, 0, 1, 1,
0.6060743, -0.1351594, 1.213572, 0.2431373, 0, 1, 1,
0.607437, 0.09484616, 2.104134, 0.2470588, 0, 1, 1,
0.6082982, 2.029185, 1.258042, 0.254902, 0, 1, 1,
0.6083587, -2.506339, 3.107459, 0.2588235, 0, 1, 1,
0.6091067, -1.051915, 2.705329, 0.2666667, 0, 1, 1,
0.6113943, 3.123333, 0.26737, 0.2705882, 0, 1, 1,
0.614132, -1.478732, 2.231845, 0.2784314, 0, 1, 1,
0.623552, 1.329544, 0.09243387, 0.282353, 0, 1, 1,
0.6243185, -0.4062421, 1.11221, 0.2901961, 0, 1, 1,
0.6265189, -0.1869619, 2.318653, 0.2941177, 0, 1, 1,
0.6281781, -0.5680753, 2.484491, 0.3019608, 0, 1, 1,
0.6319606, -1.155814, 2.320435, 0.3098039, 0, 1, 1,
0.6323135, -0.4462543, 4.227243, 0.3137255, 0, 1, 1,
0.6333451, -0.813759, 4.024867, 0.3215686, 0, 1, 1,
0.6368223, 0.8315319, 1.103092, 0.3254902, 0, 1, 1,
0.6509048, -1.917215, 3.757557, 0.3333333, 0, 1, 1,
0.6524667, -2.329824, 2.917068, 0.3372549, 0, 1, 1,
0.6530361, 0.6917442, 1.978662, 0.345098, 0, 1, 1,
0.6549681, -1.3759, 2.630523, 0.3490196, 0, 1, 1,
0.655996, 0.3895086, 0.9619212, 0.3568628, 0, 1, 1,
0.6576809, 1.641437, -0.2579883, 0.3607843, 0, 1, 1,
0.6617595, 0.1276515, 0.6947482, 0.3686275, 0, 1, 1,
0.6646435, -0.2455395, 1.839635, 0.372549, 0, 1, 1,
0.6669804, 0.2321952, 0.9847572, 0.3803922, 0, 1, 1,
0.6706765, 0.2131713, 0.365891, 0.3843137, 0, 1, 1,
0.6712546, -0.8987809, 3.566989, 0.3921569, 0, 1, 1,
0.674067, 2.12203, 0.8021277, 0.3960784, 0, 1, 1,
0.6756032, -1.873238, 1.857706, 0.4039216, 0, 1, 1,
0.6764644, -0.8225917, 2.536408, 0.4117647, 0, 1, 1,
0.6766873, -0.4610716, 3.359079, 0.4156863, 0, 1, 1,
0.6774029, 0.198307, 1.175367, 0.4235294, 0, 1, 1,
0.681348, 1.598033, -0.02103613, 0.427451, 0, 1, 1,
0.6848153, 1.113711, -0.3395498, 0.4352941, 0, 1, 1,
0.6886992, 1.927738, 0.6770813, 0.4392157, 0, 1, 1,
0.6896688, 2.04158, -0.9308408, 0.4470588, 0, 1, 1,
0.6929381, 0.6190571, 2.499074, 0.4509804, 0, 1, 1,
0.6937937, 1.785814, 1.406397, 0.4588235, 0, 1, 1,
0.695265, 1.501193, -0.6041169, 0.4627451, 0, 1, 1,
0.6966232, 0.3824091, -0.302316, 0.4705882, 0, 1, 1,
0.71518, 0.4125395, -0.05158978, 0.4745098, 0, 1, 1,
0.7153869, 0.8358846, -0.7258072, 0.4823529, 0, 1, 1,
0.7179564, -1.35778, 3.084391, 0.4862745, 0, 1, 1,
0.7180334, -0.6678217, 3.426785, 0.4941176, 0, 1, 1,
0.7206656, 1.250166, 0.6302353, 0.5019608, 0, 1, 1,
0.7227404, 0.1393294, 2.443701, 0.5058824, 0, 1, 1,
0.7229706, 1.260923, 1.36171, 0.5137255, 0, 1, 1,
0.7257845, -0.8594586, 0.9626147, 0.5176471, 0, 1, 1,
0.7283123, 1.019393, 0.6518219, 0.5254902, 0, 1, 1,
0.7302809, -0.3697208, 2.658426, 0.5294118, 0, 1, 1,
0.7306997, -1.7984, 2.761379, 0.5372549, 0, 1, 1,
0.7321896, 0.4652426, -0.09563915, 0.5411765, 0, 1, 1,
0.734352, 0.6205691, -0.3800787, 0.5490196, 0, 1, 1,
0.7378013, -0.263105, 2.813913, 0.5529412, 0, 1, 1,
0.7389241, 0.07037953, 2.248875, 0.5607843, 0, 1, 1,
0.7395248, 2.446728, 1.089389, 0.5647059, 0, 1, 1,
0.7426024, -0.8785647, 2.491098, 0.572549, 0, 1, 1,
0.7438704, -0.1462916, 2.540363, 0.5764706, 0, 1, 1,
0.7463714, -1.131789, 1.224549, 0.5843138, 0, 1, 1,
0.7470824, -0.2048005, 1.171671, 0.5882353, 0, 1, 1,
0.7545599, 0.925628, 1.162736, 0.5960785, 0, 1, 1,
0.7577013, 0.546311, -0.4801555, 0.6039216, 0, 1, 1,
0.7658976, 0.2794946, 3.210756, 0.6078432, 0, 1, 1,
0.7695563, 0.1998402, -0.0559507, 0.6156863, 0, 1, 1,
0.7713632, -1.067707, 4.017448, 0.6196079, 0, 1, 1,
0.7721835, -0.9759225, 4.527303, 0.627451, 0, 1, 1,
0.7811012, -0.496058, 0.4006792, 0.6313726, 0, 1, 1,
0.7819881, 1.281937, -1.355686, 0.6392157, 0, 1, 1,
0.7837735, -1.275103, 1.344172, 0.6431373, 0, 1, 1,
0.7879294, 1.618366, 1.035013, 0.6509804, 0, 1, 1,
0.7888772, -0.642008, 1.081617, 0.654902, 0, 1, 1,
0.7897003, 0.07079391, 1.36337, 0.6627451, 0, 1, 1,
0.7915359, -0.7867141, 0.4801655, 0.6666667, 0, 1, 1,
0.792866, 0.5718754, 0.7956942, 0.6745098, 0, 1, 1,
0.8011069, -1.190495, 2.922292, 0.6784314, 0, 1, 1,
0.8085915, 0.2407738, -0.6795031, 0.6862745, 0, 1, 1,
0.8108284, 0.2378342, 2.37794, 0.6901961, 0, 1, 1,
0.8154306, -0.292076, 2.808746, 0.6980392, 0, 1, 1,
0.8157123, 0.3635028, 2.103481, 0.7058824, 0, 1, 1,
0.8166617, -0.5063117, 1.747282, 0.7098039, 0, 1, 1,
0.818628, -0.05864087, 1.61056, 0.7176471, 0, 1, 1,
0.8219125, -0.2819443, 2.505785, 0.7215686, 0, 1, 1,
0.8253795, 0.7515727, 1.751286, 0.7294118, 0, 1, 1,
0.8255507, -0.2242679, 2.525037, 0.7333333, 0, 1, 1,
0.8274025, 0.08807427, 2.117425, 0.7411765, 0, 1, 1,
0.8278805, -0.5359405, 2.16803, 0.7450981, 0, 1, 1,
0.8279296, 1.492284, 0.8392389, 0.7529412, 0, 1, 1,
0.8302032, -0.8153669, 0.6335852, 0.7568628, 0, 1, 1,
0.8307568, -0.1366469, 1.067248, 0.7647059, 0, 1, 1,
0.8316305, -2.098949, 2.880064, 0.7686275, 0, 1, 1,
0.8371023, -0.6484219, 4.425468, 0.7764706, 0, 1, 1,
0.8374359, -0.9743834, 3.516171, 0.7803922, 0, 1, 1,
0.8454565, -1.320544, 3.327345, 0.7882353, 0, 1, 1,
0.8455395, 1.415134, 0.753125, 0.7921569, 0, 1, 1,
0.8486029, 0.038519, 1.329442, 0.8, 0, 1, 1,
0.858458, -2.718612, 3.479227, 0.8078431, 0, 1, 1,
0.860863, -0.1387951, 0.9483402, 0.8117647, 0, 1, 1,
0.8703338, 1.272409, 0.8926066, 0.8196079, 0, 1, 1,
0.872992, -0.04244267, 1.352779, 0.8235294, 0, 1, 1,
0.8731294, 0.7160664, 1.064354, 0.8313726, 0, 1, 1,
0.8755318, -0.9586515, 3.610599, 0.8352941, 0, 1, 1,
0.8897166, -1.623281, 3.244838, 0.8431373, 0, 1, 1,
0.8964694, -1.235123, 2.86335, 0.8470588, 0, 1, 1,
0.8992064, -1.325235, 3.664802, 0.854902, 0, 1, 1,
0.9017248, -0.448855, 0.7341224, 0.8588235, 0, 1, 1,
0.9028206, 0.2765729, 1.911867, 0.8666667, 0, 1, 1,
0.9094034, 0.5436278, -0.3343801, 0.8705882, 0, 1, 1,
0.9127563, 0.5083378, 0.7163288, 0.8784314, 0, 1, 1,
0.912945, -0.1776454, 0.3901686, 0.8823529, 0, 1, 1,
0.9159032, 1.908214, -0.3159909, 0.8901961, 0, 1, 1,
0.9252657, 0.1206376, 3.435177, 0.8941177, 0, 1, 1,
0.9347183, 2.501917, 1.790033, 0.9019608, 0, 1, 1,
0.9357454, 0.7999311, -0.2995306, 0.9098039, 0, 1, 1,
0.9396202, 3.217741, -1.750244, 0.9137255, 0, 1, 1,
0.9425159, 1.567536, 1.702438, 0.9215686, 0, 1, 1,
0.951192, -2.073918, 3.435698, 0.9254902, 0, 1, 1,
0.9527067, -0.5241913, 0.7538846, 0.9333333, 0, 1, 1,
0.9640638, -0.6011707, 1.233262, 0.9372549, 0, 1, 1,
0.9677987, -1.978075, 2.863143, 0.945098, 0, 1, 1,
0.9799039, -0.563252, 1.642059, 0.9490196, 0, 1, 1,
0.9816084, 1.539226, 1.759236, 0.9568627, 0, 1, 1,
0.9838204, -0.3414645, 2.805096, 0.9607843, 0, 1, 1,
0.9937195, -1.364574, 2.34158, 0.9686275, 0, 1, 1,
0.9960723, -2.747668, 2.115553, 0.972549, 0, 1, 1,
0.9964656, 1.096591, -0.8907237, 0.9803922, 0, 1, 1,
0.997097, -0.4092539, 2.31551, 0.9843137, 0, 1, 1,
1.002114, -1.606837, 3.202924, 0.9921569, 0, 1, 1,
1.007302, 0.8122076, 0.005414115, 0.9960784, 0, 1, 1,
1.009965, 1.281002, -0.9291696, 1, 0, 0.9960784, 1,
1.010267, -0.8276284, 0.5473809, 1, 0, 0.9882353, 1,
1.01465, -1.462552, 0.7812409, 1, 0, 0.9843137, 1,
1.015432, 0.7622806, 0.5055124, 1, 0, 0.9764706, 1,
1.016226, -0.82025, 1.882908, 1, 0, 0.972549, 1,
1.022821, 1.293166, 0.376434, 1, 0, 0.9647059, 1,
1.023217, 0.8292876, 1.163225, 1, 0, 0.9607843, 1,
1.023479, 0.3440489, 1.430876, 1, 0, 0.9529412, 1,
1.023723, -0.766353, 3.265846, 1, 0, 0.9490196, 1,
1.03022, -1.637099, 2.960968, 1, 0, 0.9411765, 1,
1.036279, -0.03540145, 3.282405, 1, 0, 0.9372549, 1,
1.04113, 1.897409, -0.5913491, 1, 0, 0.9294118, 1,
1.042059, -1.05368, 1.182175, 1, 0, 0.9254902, 1,
1.044456, 1.310061, -0.07410259, 1, 0, 0.9176471, 1,
1.047012, -0.3799425, 2.047061, 1, 0, 0.9137255, 1,
1.047799, -0.884596, 2.480485, 1, 0, 0.9058824, 1,
1.051506, -0.768307, 1.543455, 1, 0, 0.9019608, 1,
1.054574, -0.8017632, 1.54167, 1, 0, 0.8941177, 1,
1.062338, 2.141828, 0.6725193, 1, 0, 0.8862745, 1,
1.068736, 0.4796142, 0.7493269, 1, 0, 0.8823529, 1,
1.069908, 0.1230182, 0.458549, 1, 0, 0.8745098, 1,
1.073083, -0.4704001, 1.723736, 1, 0, 0.8705882, 1,
1.082527, 0.4573783, 1.331075, 1, 0, 0.8627451, 1,
1.087817, 1.222305, 0.1622882, 1, 0, 0.8588235, 1,
1.09747, -0.6063411, -0.04017236, 1, 0, 0.8509804, 1,
1.098372, -1.867503, 2.339243, 1, 0, 0.8470588, 1,
1.100835, -0.262954, 1.882296, 1, 0, 0.8392157, 1,
1.101053, 0.387295, 1.283054, 1, 0, 0.8352941, 1,
1.103325, -0.1834879, 2.185369, 1, 0, 0.827451, 1,
1.106081, 0.7928444, 0.7311632, 1, 0, 0.8235294, 1,
1.112278, 0.34613, 1.252217, 1, 0, 0.8156863, 1,
1.117373, 0.2567559, 0.2453389, 1, 0, 0.8117647, 1,
1.12019, 0.895662, 0.5069196, 1, 0, 0.8039216, 1,
1.127335, 0.1027007, 1.393362, 1, 0, 0.7960784, 1,
1.129477, -1.341947, 1.975245, 1, 0, 0.7921569, 1,
1.137205, -1.147069, 5.758828, 1, 0, 0.7843137, 1,
1.141246, -0.0495361, 3.359961, 1, 0, 0.7803922, 1,
1.142441, -0.8986772, 3.31175, 1, 0, 0.772549, 1,
1.151783, -0.8677021, 1.382929, 1, 0, 0.7686275, 1,
1.154666, -2.142985, 3.875124, 1, 0, 0.7607843, 1,
1.159427, 0.4780267, 1.698593, 1, 0, 0.7568628, 1,
1.164576, 0.7084818, 1.428044, 1, 0, 0.7490196, 1,
1.178146, 1.092658, 0.224844, 1, 0, 0.7450981, 1,
1.18451, 0.5111387, 1.532637, 1, 0, 0.7372549, 1,
1.18597, -0.2302252, 2.123328, 1, 0, 0.7333333, 1,
1.188988, -0.05788425, 3.496753, 1, 0, 0.7254902, 1,
1.189452, 1.570773, 0.4986326, 1, 0, 0.7215686, 1,
1.191627, -0.7640062, 3.008651, 1, 0, 0.7137255, 1,
1.196996, 0.1180694, 2.156836, 1, 0, 0.7098039, 1,
1.201823, 0.139996, 1.029217, 1, 0, 0.7019608, 1,
1.204299, -1.163902, 2.943314, 1, 0, 0.6941177, 1,
1.204917, -0.3972096, 1.433187, 1, 0, 0.6901961, 1,
1.209053, 1.742107, 1.636469, 1, 0, 0.682353, 1,
1.209107, -0.2562282, 2.874851, 1, 0, 0.6784314, 1,
1.217975, 1.061708, 2.251069, 1, 0, 0.6705883, 1,
1.245054, -0.2582962, 1.748756, 1, 0, 0.6666667, 1,
1.250354, -0.3055269, 2.626392, 1, 0, 0.6588235, 1,
1.254416, -1.232989, 1.534983, 1, 0, 0.654902, 1,
1.256204, 0.3895929, 1.675179, 1, 0, 0.6470588, 1,
1.257619, -0.5405918, 3.767095, 1, 0, 0.6431373, 1,
1.266485, 0.4662666, 0.1939299, 1, 0, 0.6352941, 1,
1.292543, 0.9350056, 2.120734, 1, 0, 0.6313726, 1,
1.292816, -0.5376318, -0.8870934, 1, 0, 0.6235294, 1,
1.302735, 1.280669, -0.6254834, 1, 0, 0.6196079, 1,
1.308547, 0.9881976, 1.495271, 1, 0, 0.6117647, 1,
1.324991, -1.39468, 0.6142165, 1, 0, 0.6078432, 1,
1.328067, -2.29621, 3.344489, 1, 0, 0.6, 1,
1.332558, -1.299207, 1.356502, 1, 0, 0.5921569, 1,
1.339981, -2.387584, 1.035223, 1, 0, 0.5882353, 1,
1.345266, 1.02124, 0.07431635, 1, 0, 0.5803922, 1,
1.352468, -1.041646, 2.639133, 1, 0, 0.5764706, 1,
1.352886, -0.3132016, 1.740671, 1, 0, 0.5686275, 1,
1.367881, -1.554999, 1.95856, 1, 0, 0.5647059, 1,
1.368247, 0.2522359, -0.1674385, 1, 0, 0.5568628, 1,
1.368851, -1.084155, 2.56705, 1, 0, 0.5529412, 1,
1.372328, 1.448274, 0.3374481, 1, 0, 0.5450981, 1,
1.38123, -0.3157333, 2.913976, 1, 0, 0.5411765, 1,
1.398152, 1.412904, 1.961739, 1, 0, 0.5333334, 1,
1.408172, -0.6736448, 0.9927096, 1, 0, 0.5294118, 1,
1.408924, -0.607541, 0.8274558, 1, 0, 0.5215687, 1,
1.411302, -0.6139573, 2.099366, 1, 0, 0.5176471, 1,
1.413352, -0.6312214, 1.89163, 1, 0, 0.509804, 1,
1.429366, -0.179567, 0.6304814, 1, 0, 0.5058824, 1,
1.430033, -0.03901068, 3.832468, 1, 0, 0.4980392, 1,
1.436449, -0.2423812, 1.555622, 1, 0, 0.4901961, 1,
1.449482, 1.259034, 0.6586843, 1, 0, 0.4862745, 1,
1.452699, 0.006591363, 1.445372, 1, 0, 0.4784314, 1,
1.454818, -2.197661, 2.274401, 1, 0, 0.4745098, 1,
1.455534, 0.2502328, 2.457094, 1, 0, 0.4666667, 1,
1.495684, 1.664135, 0.7162339, 1, 0, 0.4627451, 1,
1.507587, 0.1338177, 1.809609, 1, 0, 0.454902, 1,
1.510099, 2.267916, 0.8588678, 1, 0, 0.4509804, 1,
1.515299, 0.700403, 1.795042, 1, 0, 0.4431373, 1,
1.515447, -0.1061572, 1.44311, 1, 0, 0.4392157, 1,
1.521448, -0.4413467, 3.209459, 1, 0, 0.4313726, 1,
1.545776, 0.9725612, 2.006191, 1, 0, 0.427451, 1,
1.553105, -0.8818263, 2.06064, 1, 0, 0.4196078, 1,
1.557874, 1.296481, 0.484343, 1, 0, 0.4156863, 1,
1.564172, -1.016894, 1.774727, 1, 0, 0.4078431, 1,
1.572319, 0.1749015, -0.1311581, 1, 0, 0.4039216, 1,
1.575344, -1.431274, 3.781209, 1, 0, 0.3960784, 1,
1.580069, -1.219667, 2.314458, 1, 0, 0.3882353, 1,
1.581197, 1.960589, 2.433875, 1, 0, 0.3843137, 1,
1.584609, 2.119592, 1.676089, 1, 0, 0.3764706, 1,
1.602449, -0.9152635, 4.171751, 1, 0, 0.372549, 1,
1.608575, -1.835024, 2.1401, 1, 0, 0.3647059, 1,
1.619692, -2.616447, 2.478782, 1, 0, 0.3607843, 1,
1.622547, -0.4036384, 1.202834, 1, 0, 0.3529412, 1,
1.62285, 0.5983382, 2.532144, 1, 0, 0.3490196, 1,
1.623986, 1.589959, 1.58814, 1, 0, 0.3411765, 1,
1.664442, 0.4341573, 1.126716, 1, 0, 0.3372549, 1,
1.66651, 0.7232118, 2.255415, 1, 0, 0.3294118, 1,
1.670816, -0.4344916, 2.733381, 1, 0, 0.3254902, 1,
1.674212, 1.441481, 0.838145, 1, 0, 0.3176471, 1,
1.683726, -0.3535165, 2.128867, 1, 0, 0.3137255, 1,
1.717106, -0.4427513, 2.771565, 1, 0, 0.3058824, 1,
1.740758, -2.5097, 1.813594, 1, 0, 0.2980392, 1,
1.758737, -0.4439064, 1.490691, 1, 0, 0.2941177, 1,
1.783841, -0.1473433, 2.90635, 1, 0, 0.2862745, 1,
1.791578, 0.6803751, -0.1171867, 1, 0, 0.282353, 1,
1.807446, -0.1906147, 2.209635, 1, 0, 0.2745098, 1,
1.807879, 0.2183416, 1.538969, 1, 0, 0.2705882, 1,
1.809242, -0.3899493, 1.210392, 1, 0, 0.2627451, 1,
1.810339, -0.2482641, 0.1600146, 1, 0, 0.2588235, 1,
1.835187, 1.167207, 1.496021, 1, 0, 0.2509804, 1,
1.837355, 0.304005, 1.846639, 1, 0, 0.2470588, 1,
1.839532, 0.005122053, 2.254802, 1, 0, 0.2392157, 1,
1.850769, 0.7412791, 2.783789, 1, 0, 0.2352941, 1,
1.861484, -0.1706188, 0.8340885, 1, 0, 0.227451, 1,
1.89015, 1.680418, 0.4372878, 1, 0, 0.2235294, 1,
1.898744, -0.4140194, 0.9895859, 1, 0, 0.2156863, 1,
1.912163, 0.5800853, 2.305241, 1, 0, 0.2117647, 1,
1.919092, 1.194398, 0.5028687, 1, 0, 0.2039216, 1,
1.92232, -0.3355027, 3.462384, 1, 0, 0.1960784, 1,
1.939328, -1.289491, 2.073124, 1, 0, 0.1921569, 1,
1.949853, -1.837325, 4.066306, 1, 0, 0.1843137, 1,
1.962865, 0.0570268, 0.2478482, 1, 0, 0.1803922, 1,
1.970245, 1.613987, 1.187758, 1, 0, 0.172549, 1,
1.986137, -1.312035, 1.273191, 1, 0, 0.1686275, 1,
1.998378, 0.02607024, 0.09730653, 1, 0, 0.1607843, 1,
2.011974, -1.990027, 1.981499, 1, 0, 0.1568628, 1,
2.017445, 0.1848156, 1.06767, 1, 0, 0.1490196, 1,
2.026301, 0.5373131, -0.02900961, 1, 0, 0.145098, 1,
2.03889, -0.6165045, 3.121643, 1, 0, 0.1372549, 1,
2.043768, 0.6545637, 2.579118, 1, 0, 0.1333333, 1,
2.071304, -0.021822, 0.3531745, 1, 0, 0.1254902, 1,
2.094556, 1.395624, 0.08351453, 1, 0, 0.1215686, 1,
2.101269, 1.229071, 1.526595, 1, 0, 0.1137255, 1,
2.105109, 0.9261065, -0.2091929, 1, 0, 0.1098039, 1,
2.134921, 0.09487104, 0.5180267, 1, 0, 0.1019608, 1,
2.168501, 0.1129264, 4.330734, 1, 0, 0.09411765, 1,
2.169982, -1.296576, 2.062392, 1, 0, 0.09019608, 1,
2.258611, -0.8349626, 3.11423, 1, 0, 0.08235294, 1,
2.33012, 0.7330418, 0.8775243, 1, 0, 0.07843138, 1,
2.334965, 0.1937231, 2.164666, 1, 0, 0.07058824, 1,
2.406898, -0.8791263, 3.399157, 1, 0, 0.06666667, 1,
2.414215, 0.3061467, 0.9491923, 1, 0, 0.05882353, 1,
2.512373, 0.8177924, 1.788488, 1, 0, 0.05490196, 1,
2.519321, 0.0499993, -0.2909044, 1, 0, 0.04705882, 1,
2.554208, 0.08801962, 1.905167, 1, 0, 0.04313726, 1,
2.594128, -0.09579166, 0.2444226, 1, 0, 0.03529412, 1,
2.742443, 0.6663656, 1.489045, 1, 0, 0.03137255, 1,
2.794957, 0.8033778, 1.705196, 1, 0, 0.02352941, 1,
2.814318, -0.2332316, 3.60721, 1, 0, 0.01960784, 1,
2.887637, -0.4542041, 2.384058, 1, 0, 0.01176471, 1,
3.211654, -0.2839337, 1.47282, 1, 0, 0.007843138, 1
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
0.01484764, -3.844362, -6.951257, 0, -0.5, 0.5, 0.5,
0.01484764, -3.844362, -6.951257, 1, -0.5, 0.5, 0.5,
0.01484764, -3.844362, -6.951257, 1, 1.5, 0.5, 0.5,
0.01484764, -3.844362, -6.951257, 0, 1.5, 0.5, 0.5
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
-4.265676, 0.1984583, -6.951257, 0, -0.5, 0.5, 0.5,
-4.265676, 0.1984583, -6.951257, 1, -0.5, 0.5, 0.5,
-4.265676, 0.1984583, -6.951257, 1, 1.5, 0.5, 0.5,
-4.265676, 0.1984583, -6.951257, 0, 1.5, 0.5, 0.5
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
-4.265676, -3.844362, 0.6133173, 0, -0.5, 0.5, 0.5,
-4.265676, -3.844362, 0.6133173, 1, -0.5, 0.5, 0.5,
-4.265676, -3.844362, 0.6133173, 1, 1.5, 0.5, 0.5,
-4.265676, -3.844362, 0.6133173, 0, 1.5, 0.5, 0.5
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
-3, -2.911403, -5.205586,
3, -2.911403, -5.205586,
-3, -2.911403, -5.205586,
-3, -3.066896, -5.496531,
-2, -2.911403, -5.205586,
-2, -3.066896, -5.496531,
-1, -2.911403, -5.205586,
-1, -3.066896, -5.496531,
0, -2.911403, -5.205586,
0, -3.066896, -5.496531,
1, -2.911403, -5.205586,
1, -3.066896, -5.496531,
2, -2.911403, -5.205586,
2, -3.066896, -5.496531,
3, -2.911403, -5.205586,
3, -3.066896, -5.496531
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
-3, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
-3, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
-3, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
-3, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5,
-2, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
-2, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
-2, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
-2, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5,
-1, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
-1, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
-1, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
-1, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5,
0, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
0, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
0, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
0, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5,
1, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
1, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
1, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
1, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5,
2, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
2, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
2, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
2, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5,
3, -3.377882, -6.078421, 0, -0.5, 0.5, 0.5,
3, -3.377882, -6.078421, 1, -0.5, 0.5, 0.5,
3, -3.377882, -6.078421, 1, 1.5, 0.5, 0.5,
3, -3.377882, -6.078421, 0, 1.5, 0.5, 0.5
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
-3.277863, -2, -5.205586,
-3.277863, 3, -5.205586,
-3.277863, -2, -5.205586,
-3.442498, -2, -5.496531,
-3.277863, -1, -5.205586,
-3.442498, -1, -5.496531,
-3.277863, 0, -5.205586,
-3.442498, 0, -5.496531,
-3.277863, 1, -5.205586,
-3.442498, 1, -5.496531,
-3.277863, 2, -5.205586,
-3.442498, 2, -5.496531,
-3.277863, 3, -5.205586,
-3.442498, 3, -5.496531
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
-3.77177, -2, -6.078421, 0, -0.5, 0.5, 0.5,
-3.77177, -2, -6.078421, 1, -0.5, 0.5, 0.5,
-3.77177, -2, -6.078421, 1, 1.5, 0.5, 0.5,
-3.77177, -2, -6.078421, 0, 1.5, 0.5, 0.5,
-3.77177, -1, -6.078421, 0, -0.5, 0.5, 0.5,
-3.77177, -1, -6.078421, 1, -0.5, 0.5, 0.5,
-3.77177, -1, -6.078421, 1, 1.5, 0.5, 0.5,
-3.77177, -1, -6.078421, 0, 1.5, 0.5, 0.5,
-3.77177, 0, -6.078421, 0, -0.5, 0.5, 0.5,
-3.77177, 0, -6.078421, 1, -0.5, 0.5, 0.5,
-3.77177, 0, -6.078421, 1, 1.5, 0.5, 0.5,
-3.77177, 0, -6.078421, 0, 1.5, 0.5, 0.5,
-3.77177, 1, -6.078421, 0, -0.5, 0.5, 0.5,
-3.77177, 1, -6.078421, 1, -0.5, 0.5, 0.5,
-3.77177, 1, -6.078421, 1, 1.5, 0.5, 0.5,
-3.77177, 1, -6.078421, 0, 1.5, 0.5, 0.5,
-3.77177, 2, -6.078421, 0, -0.5, 0.5, 0.5,
-3.77177, 2, -6.078421, 1, -0.5, 0.5, 0.5,
-3.77177, 2, -6.078421, 1, 1.5, 0.5, 0.5,
-3.77177, 2, -6.078421, 0, 1.5, 0.5, 0.5,
-3.77177, 3, -6.078421, 0, -0.5, 0.5, 0.5,
-3.77177, 3, -6.078421, 1, -0.5, 0.5, 0.5,
-3.77177, 3, -6.078421, 1, 1.5, 0.5, 0.5,
-3.77177, 3, -6.078421, 0, 1.5, 0.5, 0.5
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
-3.277863, -2.911403, -4,
-3.277863, -2.911403, 6,
-3.277863, -2.911403, -4,
-3.442498, -3.066896, -4,
-3.277863, -2.911403, -2,
-3.442498, -3.066896, -2,
-3.277863, -2.911403, 0,
-3.442498, -3.066896, 0,
-3.277863, -2.911403, 2,
-3.442498, -3.066896, 2,
-3.277863, -2.911403, 4,
-3.442498, -3.066896, 4,
-3.277863, -2.911403, 6,
-3.442498, -3.066896, 6
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
-3.77177, -3.377882, -4, 0, -0.5, 0.5, 0.5,
-3.77177, -3.377882, -4, 1, -0.5, 0.5, 0.5,
-3.77177, -3.377882, -4, 1, 1.5, 0.5, 0.5,
-3.77177, -3.377882, -4, 0, 1.5, 0.5, 0.5,
-3.77177, -3.377882, -2, 0, -0.5, 0.5, 0.5,
-3.77177, -3.377882, -2, 1, -0.5, 0.5, 0.5,
-3.77177, -3.377882, -2, 1, 1.5, 0.5, 0.5,
-3.77177, -3.377882, -2, 0, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 0, 0, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 0, 1, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 0, 1, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 0, 0, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 2, 0, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 2, 1, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 2, 1, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 2, 0, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 4, 0, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 4, 1, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 4, 1, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 4, 0, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 6, 0, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 6, 1, -0.5, 0.5, 0.5,
-3.77177, -3.377882, 6, 1, 1.5, 0.5, 0.5,
-3.77177, -3.377882, 6, 0, 1.5, 0.5, 0.5
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
-3.277863, -2.911403, -5.205586,
-3.277863, 3.30832, -5.205586,
-3.277863, -2.911403, 6.43222,
-3.277863, 3.30832, 6.43222,
-3.277863, -2.911403, -5.205586,
-3.277863, -2.911403, 6.43222,
-3.277863, 3.30832, -5.205586,
-3.277863, 3.30832, 6.43222,
-3.277863, -2.911403, -5.205586,
3.307558, -2.911403, -5.205586,
-3.277863, -2.911403, 6.43222,
3.307558, -2.911403, 6.43222,
-3.277863, 3.30832, -5.205586,
3.307558, 3.30832, -5.205586,
-3.277863, 3.30832, 6.43222,
3.307558, 3.30832, 6.43222,
3.307558, -2.911403, -5.205586,
3.307558, 3.30832, -5.205586,
3.307558, -2.911403, 6.43222,
3.307558, 3.30832, 6.43222,
3.307558, -2.911403, -5.205586,
3.307558, -2.911403, 6.43222,
3.307558, 3.30832, -5.205586,
3.307558, 3.30832, 6.43222
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
var radius = 7.874924;
var distance = 35.03643;
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
mvMatrix.translate( -0.01484764, -0.1984583, -0.6133173 );
mvMatrix.scale( 1.292935, 1.368955, 0.731626 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03643);
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
Uniroyal<-read.table("Uniroyal.xyz")
```

```
## Error in read.table("Uniroyal.xyz"): no lines available in input
```

```r
x<-Uniroyal$V2
```

```
## Error in eval(expr, envir, enclos): object 'Uniroyal' not found
```

```r
y<-Uniroyal$V3
```

```
## Error in eval(expr, envir, enclos): object 'Uniroyal' not found
```

```r
z<-Uniroyal$V4
```

```
## Error in eval(expr, envir, enclos): object 'Uniroyal' not found
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
-3.181959, -1.27245, -2.711901, 0, 0, 1, 1, 1,
-3.104068, 1.916435, -0.7670868, 1, 0, 0, 1, 1,
-3.063643, -1.239329, -1.794049, 1, 0, 0, 1, 1,
-2.896095, -1.146662, -2.082104, 1, 0, 0, 1, 1,
-2.844793, 0.6576591, -1.308702, 1, 0, 0, 1, 1,
-2.722682, 1.949263, -0.3026976, 1, 0, 0, 1, 1,
-2.607954, -0.2823211, -1.562233, 0, 0, 0, 1, 1,
-2.577323, -0.4282206, -0.2658644, 0, 0, 0, 1, 1,
-2.487728, -1.146039, -1.255344, 0, 0, 0, 1, 1,
-2.474031, -0.2855839, -0.7417544, 0, 0, 0, 1, 1,
-2.447678, -1.548782, -1.35251, 0, 0, 0, 1, 1,
-2.441567, -2.134421, -3.603621, 0, 0, 0, 1, 1,
-2.373281, -1.794366, -3.326112, 0, 0, 0, 1, 1,
-2.234483, -1.077071, -1.872751, 1, 1, 1, 1, 1,
-2.205891, 1.276746, -1.585069, 1, 1, 1, 1, 1,
-2.2049, 0.3178579, -1.215468, 1, 1, 1, 1, 1,
-2.191191, 1.038934, 0.2900893, 1, 1, 1, 1, 1,
-2.116784, 1.227048, -0.5674681, 1, 1, 1, 1, 1,
-2.10874, -0.3289268, -0.8841976, 1, 1, 1, 1, 1,
-2.09336, 0.4970285, -1.043234, 1, 1, 1, 1, 1,
-2.04202, 0.3099228, -2.336118, 1, 1, 1, 1, 1,
-2.015724, -0.2107117, -1.992391, 1, 1, 1, 1, 1,
-1.971957, 0.008818814, -1.186148, 1, 1, 1, 1, 1,
-1.958461, -0.23429, 0.1818382, 1, 1, 1, 1, 1,
-1.949396, -0.6926903, 0.1091814, 1, 1, 1, 1, 1,
-1.948079, -0.7828487, -3.203802, 1, 1, 1, 1, 1,
-1.947787, 0.712827, -0.3687026, 1, 1, 1, 1, 1,
-1.929493, 0.4977509, -1.601955, 1, 1, 1, 1, 1,
-1.924277, 0.299946, -0.8356155, 0, 0, 1, 1, 1,
-1.921631, -0.134474, -1.420378, 1, 0, 0, 1, 1,
-1.895386, -0.7208725, 0.0381625, 1, 0, 0, 1, 1,
-1.861438, -1.997727, -2.400584, 1, 0, 0, 1, 1,
-1.835215, 1.18269, -0.5666153, 1, 0, 0, 1, 1,
-1.824652, -2.513449, -2.279544, 1, 0, 0, 1, 1,
-1.798057, -0.5770252, -2.958997, 0, 0, 0, 1, 1,
-1.777014, 0.6123122, -2.905759, 0, 0, 0, 1, 1,
-1.76362, -1.296795, -1.269683, 0, 0, 0, 1, 1,
-1.757008, -0.3879518, -1.715023, 0, 0, 0, 1, 1,
-1.755559, -0.6059263, -1.238081, 0, 0, 0, 1, 1,
-1.751089, -0.1476432, -2.587725, 0, 0, 0, 1, 1,
-1.748069, -0.4632831, -0.5716106, 0, 0, 0, 1, 1,
-1.741711, 1.665207, -1.819074, 1, 1, 1, 1, 1,
-1.737337, 0.9640414, 0.1891496, 1, 1, 1, 1, 1,
-1.731797, 0.3537802, -1.789214, 1, 1, 1, 1, 1,
-1.70341, -0.2216844, -1.746852, 1, 1, 1, 1, 1,
-1.699231, -2.820825, -1.430793, 1, 1, 1, 1, 1,
-1.675445, -0.8250988, -3.479081, 1, 1, 1, 1, 1,
-1.668747, 1.474988, -2.733238, 1, 1, 1, 1, 1,
-1.658374, -0.8354463, -3.555483, 1, 1, 1, 1, 1,
-1.658082, -0.393544, -1.674898, 1, 1, 1, 1, 1,
-1.645944, -0.6971653, -2.867933, 1, 1, 1, 1, 1,
-1.64219, -0.6254541, -1.651503, 1, 1, 1, 1, 1,
-1.635947, -2.041804, -1.483013, 1, 1, 1, 1, 1,
-1.627867, -1.599176, -2.142322, 1, 1, 1, 1, 1,
-1.617315, 0.3925408, -1.083606, 1, 1, 1, 1, 1,
-1.61445, -0.026703, -0.6245269, 1, 1, 1, 1, 1,
-1.606342, -1.260638, -3.005856, 0, 0, 1, 1, 1,
-1.589318, -0.6858089, -2.724265, 1, 0, 0, 1, 1,
-1.585925, 0.263077, -2.572299, 1, 0, 0, 1, 1,
-1.577475, -0.8762171, -2.410417, 1, 0, 0, 1, 1,
-1.575561, 0.37784, -2.338962, 1, 0, 0, 1, 1,
-1.575435, -2.41394, -1.735706, 1, 0, 0, 1, 1,
-1.564225, 1.205789, -2.138808, 0, 0, 0, 1, 1,
-1.548076, 1.475309, -0.9614096, 0, 0, 0, 1, 1,
-1.538301, -1.898902, -4.631955, 0, 0, 0, 1, 1,
-1.53028, -0.428183, -2.764524, 0, 0, 0, 1, 1,
-1.524222, 0.5909998, -0.8342513, 0, 0, 0, 1, 1,
-1.509362, -0.06445985, -2.443054, 0, 0, 0, 1, 1,
-1.509314, 0.267608, -1.225676, 0, 0, 0, 1, 1,
-1.508724, 0.2225441, -1.492641, 1, 1, 1, 1, 1,
-1.508487, -0.5274115, -2.483349, 1, 1, 1, 1, 1,
-1.486719, -1.546536, -2.539952, 1, 1, 1, 1, 1,
-1.472213, 0.5245846, -0.785279, 1, 1, 1, 1, 1,
-1.469612, -0.1516425, -1.474687, 1, 1, 1, 1, 1,
-1.467236, -0.1430927, -0.624583, 1, 1, 1, 1, 1,
-1.459034, -1.997648, -2.917548, 1, 1, 1, 1, 1,
-1.452165, -1.178001, -0.7498286, 1, 1, 1, 1, 1,
-1.426143, 0.09909514, -1.390812, 1, 1, 1, 1, 1,
-1.420288, -0.01012231, -1.197606, 1, 1, 1, 1, 1,
-1.411672, 0.1345337, -0.3620366, 1, 1, 1, 1, 1,
-1.409722, -1.287735, -3.811018, 1, 1, 1, 1, 1,
-1.408681, 0.8525952, -2.665416, 1, 1, 1, 1, 1,
-1.404771, 0.148698, -1.636362, 1, 1, 1, 1, 1,
-1.39295, -0.09488418, -2.096911, 1, 1, 1, 1, 1,
-1.389876, -0.2825673, -0.8031148, 0, 0, 1, 1, 1,
-1.387779, -0.2989828, -1.543799, 1, 0, 0, 1, 1,
-1.382285, -0.9353292, -1.454621, 1, 0, 0, 1, 1,
-1.379854, -0.06073679, -2.039294, 1, 0, 0, 1, 1,
-1.378235, 0.407039, -0.8124387, 1, 0, 0, 1, 1,
-1.364864, -0.8229774, -1.2017, 1, 0, 0, 1, 1,
-1.364416, 1.374402, -0.1450412, 0, 0, 0, 1, 1,
-1.363265, 0.3447297, -3.170275, 0, 0, 0, 1, 1,
-1.362968, 0.8979836, -0.5255422, 0, 0, 0, 1, 1,
-1.357821, 1.655049, -1.075359, 0, 0, 0, 1, 1,
-1.356615, 0.003646811, -1.312783, 0, 0, 0, 1, 1,
-1.350793, 0.3570666, -3.149825, 0, 0, 0, 1, 1,
-1.349643, 1.116325, 0.07534909, 0, 0, 0, 1, 1,
-1.344851, 1.421956, -1.31032, 1, 1, 1, 1, 1,
-1.330488, -1.302103, -3.632632, 1, 1, 1, 1, 1,
-1.327855, 0.4735959, -0.3375347, 1, 1, 1, 1, 1,
-1.317273, 0.004829771, -2.060185, 1, 1, 1, 1, 1,
-1.314453, -0.5713224, -1.193652, 1, 1, 1, 1, 1,
-1.305278, -1.380591, -4.050041, 1, 1, 1, 1, 1,
-1.299373, -0.8518375, -2.249888, 1, 1, 1, 1, 1,
-1.289697, 0.9395817, -2.102297, 1, 1, 1, 1, 1,
-1.275818, 1.215834, -1.486892, 1, 1, 1, 1, 1,
-1.268996, -1.751436, -1.48848, 1, 1, 1, 1, 1,
-1.266825, -0.5994352, -2.34441, 1, 1, 1, 1, 1,
-1.263205, -0.9914685, -3.210162, 1, 1, 1, 1, 1,
-1.256447, 1.236168, -1.324, 1, 1, 1, 1, 1,
-1.254665, 1.577361, -0.7940644, 1, 1, 1, 1, 1,
-1.24229, -0.2820541, -0.7739491, 1, 1, 1, 1, 1,
-1.242053, 1.1583, -0.2336693, 0, 0, 1, 1, 1,
-1.216513, -0.63609, -2.429294, 1, 0, 0, 1, 1,
-1.215775, 0.896853, 0.02267486, 1, 0, 0, 1, 1,
-1.208474, -0.2495515, -2.670628, 1, 0, 0, 1, 1,
-1.204839, -1.978245, -3.489024, 1, 0, 0, 1, 1,
-1.203893, -0.8500758, -1.856137, 1, 0, 0, 1, 1,
-1.19551, 0.186985, -0.9267507, 0, 0, 0, 1, 1,
-1.178976, -0.7775216, -2.924354, 0, 0, 0, 1, 1,
-1.178398, -0.780414, -1.708109, 0, 0, 0, 1, 1,
-1.167512, -0.9410026, -2.344783, 0, 0, 0, 1, 1,
-1.164547, 0.587136, 0.6199702, 0, 0, 0, 1, 1,
-1.159551, -0.7803943, -1.787265, 0, 0, 0, 1, 1,
-1.158391, -0.01568498, -2.89204, 0, 0, 0, 1, 1,
-1.157815, -0.3905833, -1.908774, 1, 1, 1, 1, 1,
-1.157545, 0.2167023, -2.468359, 1, 1, 1, 1, 1,
-1.155897, -0.2383258, -3.137592, 1, 1, 1, 1, 1,
-1.147975, 0.2294497, -1.922856, 1, 1, 1, 1, 1,
-1.131474, -0.6260326, -3.402148, 1, 1, 1, 1, 1,
-1.116241, -0.5408299, -1.711311, 1, 1, 1, 1, 1,
-1.115592, 0.525617, -0.9527501, 1, 1, 1, 1, 1,
-1.107171, 0.7119247, -0.6594034, 1, 1, 1, 1, 1,
-1.102896, 1.163715, -0.03700252, 1, 1, 1, 1, 1,
-1.090821, -0.3029231, -0.9021186, 1, 1, 1, 1, 1,
-1.089632, 0.1088849, -1.22631, 1, 1, 1, 1, 1,
-1.089319, -1.117681, -2.862989, 1, 1, 1, 1, 1,
-1.088679, 0.8851296, -2.930893, 1, 1, 1, 1, 1,
-1.075049, 1.149249, -0.6998972, 1, 1, 1, 1, 1,
-1.064159, -1.123423, -3.415253, 1, 1, 1, 1, 1,
-1.036954, 2.290799, -0.3744463, 0, 0, 1, 1, 1,
-1.036041, -0.4265422, -2.311846, 1, 0, 0, 1, 1,
-1.035203, -1.781897, -2.079486, 1, 0, 0, 1, 1,
-1.032983, -0.5327137, -0.005213541, 1, 0, 0, 1, 1,
-1.032622, -0.2898457, -3.34529, 1, 0, 0, 1, 1,
-1.025593, 0.2517532, -3.368099, 1, 0, 0, 1, 1,
-1.022918, 0.4143738, -0.7972845, 0, 0, 0, 1, 1,
-1.020617, 1.276292, 0.5120135, 0, 0, 0, 1, 1,
-1.020267, 0.4744469, -0.6393886, 0, 0, 0, 1, 1,
-1.007448, 1.142756, 0.02073343, 0, 0, 0, 1, 1,
-1.003411, 0.273923, -1.106251, 0, 0, 0, 1, 1,
-1.00284, -0.2624166, -1.778293, 0, 0, 0, 1, 1,
-1.00239, 0.1297934, -0.9315475, 0, 0, 0, 1, 1,
-1.001548, 0.7928725, -1.198695, 1, 1, 1, 1, 1,
-0.996116, 2.592829, -1.672287, 1, 1, 1, 1, 1,
-0.9953002, -0.4978712, -2.753837, 1, 1, 1, 1, 1,
-0.9949771, 1.22551, -1.642647, 1, 1, 1, 1, 1,
-0.9941086, 0.4763858, -1.619841, 1, 1, 1, 1, 1,
-0.9887824, -1.11899, -2.746147, 1, 1, 1, 1, 1,
-0.9818209, -0.2814051, -0.6129346, 1, 1, 1, 1, 1,
-0.9686434, 0.8415068, 0.01817607, 1, 1, 1, 1, 1,
-0.9663575, -0.02160428, -0.8817788, 1, 1, 1, 1, 1,
-0.9636427, -2.62772, -2.366772, 1, 1, 1, 1, 1,
-0.9491608, 0.575637, -3.313237, 1, 1, 1, 1, 1,
-0.9447986, 0.622484, -0.6829777, 1, 1, 1, 1, 1,
-0.9440759, 1.600927, -0.4875647, 1, 1, 1, 1, 1,
-0.9417239, 1.149367, -2.053067, 1, 1, 1, 1, 1,
-0.9392624, 0.8671936, -1.537665, 1, 1, 1, 1, 1,
-0.9378632, 0.7812411, -1.288105, 0, 0, 1, 1, 1,
-0.9375394, -0.1882344, -0.9322433, 1, 0, 0, 1, 1,
-0.9339962, 0.3629214, 0.1235255, 1, 0, 0, 1, 1,
-0.9337193, 0.05391672, -0.6391869, 1, 0, 0, 1, 1,
-0.9218777, -1.590309, -3.835731, 1, 0, 0, 1, 1,
-0.919478, 1.524234, -0.4981925, 1, 0, 0, 1, 1,
-0.918298, -0.6997129, -3.081452, 0, 0, 0, 1, 1,
-0.8965377, -0.2392903, -1.647202, 0, 0, 0, 1, 1,
-0.8935317, -0.4719626, -2.89393, 0, 0, 0, 1, 1,
-0.8860041, 0.8377692, 0.06708729, 0, 0, 0, 1, 1,
-0.8852438, -0.3730973, -2.472824, 0, 0, 0, 1, 1,
-0.8850164, 0.8661209, -0.9582513, 0, 0, 0, 1, 1,
-0.8780601, 0.680218, -1.08833, 0, 0, 0, 1, 1,
-0.8745217, -1.62682, -1.201375, 1, 1, 1, 1, 1,
-0.873314, 0.5350429, 0.1380244, 1, 1, 1, 1, 1,
-0.8698182, 1.258312, -0.4705491, 1, 1, 1, 1, 1,
-0.8697147, -0.006124113, -0.3406025, 1, 1, 1, 1, 1,
-0.8687836, -1.671346, -3.346658, 1, 1, 1, 1, 1,
-0.8665599, -0.5178991, -2.822353, 1, 1, 1, 1, 1,
-0.8652822, -0.8093478, -0.897444, 1, 1, 1, 1, 1,
-0.8595079, 0.4554667, -1.940826, 1, 1, 1, 1, 1,
-0.8500636, -1.223172, -2.110149, 1, 1, 1, 1, 1,
-0.8470088, -1.208579, -2.624606, 1, 1, 1, 1, 1,
-0.8468366, -0.7454993, -2.447117, 1, 1, 1, 1, 1,
-0.8444126, -0.8551894, -4.619356, 1, 1, 1, 1, 1,
-0.8398027, 0.07589208, -0.4731101, 1, 1, 1, 1, 1,
-0.8397073, -0.2695352, -1.470114, 1, 1, 1, 1, 1,
-0.8326438, 0.3301781, -2.14747, 1, 1, 1, 1, 1,
-0.8227652, 0.1643426, -1.686082, 0, 0, 1, 1, 1,
-0.821053, 0.8810276, 0.537843, 1, 0, 0, 1, 1,
-0.8206964, -0.4319359, -2.30795, 1, 0, 0, 1, 1,
-0.8205967, -0.4601002, -3.889642, 1, 0, 0, 1, 1,
-0.8167645, -0.2259207, -2.357006, 1, 0, 0, 1, 1,
-0.8116331, -0.3957458, -0.1876281, 1, 0, 0, 1, 1,
-0.8100387, -0.4676827, -0.8377435, 0, 0, 0, 1, 1,
-0.8088494, -0.1667755, -0.6161909, 0, 0, 0, 1, 1,
-0.808486, -0.9548896, -3.009588, 0, 0, 0, 1, 1,
-0.8084688, -1.934219, -0.7587158, 0, 0, 0, 1, 1,
-0.8037274, 0.3049296, -3.446975, 0, 0, 0, 1, 1,
-0.8010271, 1.871548, -0.7183825, 0, 0, 0, 1, 1,
-0.7990909, 1.575831, -1.017585, 0, 0, 0, 1, 1,
-0.7988073, -0.11394, -0.9177349, 1, 1, 1, 1, 1,
-0.7929632, -1.060226, -1.844701, 1, 1, 1, 1, 1,
-0.7919625, -0.7638509, -3.338859, 1, 1, 1, 1, 1,
-0.7915927, -0.1205341, -1.371556, 1, 1, 1, 1, 1,
-0.7901036, 2.624406, -0.8415632, 1, 1, 1, 1, 1,
-0.7898959, 0.4293492, 2.295107, 1, 1, 1, 1, 1,
-0.7884137, -0.2832496, -1.99253, 1, 1, 1, 1, 1,
-0.7829475, -1.265499, -2.310916, 1, 1, 1, 1, 1,
-0.7652705, -0.6449075, -2.119212, 1, 1, 1, 1, 1,
-0.7638249, 1.18783, -0.2839172, 1, 1, 1, 1, 1,
-0.7571695, 1.341073, -0.7449108, 1, 1, 1, 1, 1,
-0.7558617, 0.8467215, -0.2801979, 1, 1, 1, 1, 1,
-0.7548984, -0.1134713, -0.4311098, 1, 1, 1, 1, 1,
-0.7519348, -1.118487, -1.628674, 1, 1, 1, 1, 1,
-0.7515304, 0.6082338, -1.130458, 1, 1, 1, 1, 1,
-0.7451829, 1.956181, 0.1858581, 0, 0, 1, 1, 1,
-0.7433847, 0.01660078, -1.424029, 1, 0, 0, 1, 1,
-0.7429758, 1.671839, 0.3894029, 1, 0, 0, 1, 1,
-0.7372246, 2.755708, 2.558867, 1, 0, 0, 1, 1,
-0.7309366, 0.4542633, -0.06424195, 1, 0, 0, 1, 1,
-0.7301305, 0.629442, -1.501339, 1, 0, 0, 1, 1,
-0.7291698, 0.8620456, -2.896314, 0, 0, 0, 1, 1,
-0.7258469, 0.9178338, 0.5867352, 0, 0, 0, 1, 1,
-0.7213162, -0.2250947, -1.465444, 0, 0, 0, 1, 1,
-0.7160205, 0.5110109, -2.552215, 0, 0, 0, 1, 1,
-0.713766, 1.534004, 0.1173576, 0, 0, 0, 1, 1,
-0.7092577, -1.09349, -3.357416, 0, 0, 0, 1, 1,
-0.7085406, -0.09864277, -2.765025, 0, 0, 0, 1, 1,
-0.7065398, 0.218916, -0.7303379, 1, 1, 1, 1, 1,
-0.7018306, 1.196118, 0.29379, 1, 1, 1, 1, 1,
-0.7017617, 0.9065464, -0.5249982, 1, 1, 1, 1, 1,
-0.701347, 0.007876759, -3.570641, 1, 1, 1, 1, 1,
-0.6992408, -0.5371946, -2.457092, 1, 1, 1, 1, 1,
-0.6923409, -0.1100482, -1.777855, 1, 1, 1, 1, 1,
-0.6884112, 0.8846816, 0.2847557, 1, 1, 1, 1, 1,
-0.6880726, -0.1296858, -1.712967, 1, 1, 1, 1, 1,
-0.6792265, 1.398458, 1.047111, 1, 1, 1, 1, 1,
-0.6741413, 0.9065272, -1.413753, 1, 1, 1, 1, 1,
-0.6740729, -1.145513, -2.201295, 1, 1, 1, 1, 1,
-0.6729747, 0.783379, -2.524639, 1, 1, 1, 1, 1,
-0.6718717, -0.04513671, -1.669335, 1, 1, 1, 1, 1,
-0.6693658, 0.1657763, -1.019821, 1, 1, 1, 1, 1,
-0.6606982, -0.8359692, -1.732071, 1, 1, 1, 1, 1,
-0.6564265, -0.119418, -2.854211, 0, 0, 1, 1, 1,
-0.6560166, 1.071187, -1.520819, 1, 0, 0, 1, 1,
-0.6557881, -0.1258203, -2.791878, 1, 0, 0, 1, 1,
-0.6539241, 0.4715012, 0.4775665, 1, 0, 0, 1, 1,
-0.6519323, -0.06386595, -1.743379, 1, 0, 0, 1, 1,
-0.6516687, 1.634599, -1.420516, 1, 0, 0, 1, 1,
-0.6492251, 2.009554, -0.09818669, 0, 0, 0, 1, 1,
-0.6482072, -0.4099751, -1.719694, 0, 0, 0, 1, 1,
-0.646656, 0.1629817, -0.7822376, 0, 0, 0, 1, 1,
-0.6409367, 0.5458534, -0.5965738, 0, 0, 0, 1, 1,
-0.6397194, 0.4287843, -2.11489, 0, 0, 0, 1, 1,
-0.6389681, 1.085503, 0.4723151, 0, 0, 0, 1, 1,
-0.6358156, 0.3963482, -2.177043, 0, 0, 0, 1, 1,
-0.6314917, 1.4199, -0.1571648, 1, 1, 1, 1, 1,
-0.6293567, 0.9372504, -0.9042645, 1, 1, 1, 1, 1,
-0.6290103, 0.2266855, -0.4183525, 1, 1, 1, 1, 1,
-0.6265247, 0.4130391, -1.107497, 1, 1, 1, 1, 1,
-0.6236576, 0.7596809, -0.3042929, 1, 1, 1, 1, 1,
-0.6220472, -0.4662181, -2.322995, 1, 1, 1, 1, 1,
-0.6159988, -0.3912056, -1.161056, 1, 1, 1, 1, 1,
-0.6112032, -1.346136, -1.159788, 1, 1, 1, 1, 1,
-0.6063964, -0.4156556, -2.169342, 1, 1, 1, 1, 1,
-0.6049948, -1.006229, -2.648165, 1, 1, 1, 1, 1,
-0.6028098, -1.645526, -1.197945, 1, 1, 1, 1, 1,
-0.6002496, 0.1322533, -0.5108149, 1, 1, 1, 1, 1,
-0.5979449, 0.8226458, -0.5395951, 1, 1, 1, 1, 1,
-0.5940408, 0.1869606, -2.158226, 1, 1, 1, 1, 1,
-0.5906448, 0.3098412, -0.9448193, 1, 1, 1, 1, 1,
-0.586329, 0.2626671, -2.087699, 0, 0, 1, 1, 1,
-0.5854304, -0.7007905, -1.658526, 1, 0, 0, 1, 1,
-0.574235, 0.2017201, -2.050541, 1, 0, 0, 1, 1,
-0.5733318, 0.5576039, -1.758157, 1, 0, 0, 1, 1,
-0.5721252, 1.382864, 1.285232, 1, 0, 0, 1, 1,
-0.5710223, 1.056545, 0.1315036, 1, 0, 0, 1, 1,
-0.5670657, -1.059257, -1.806985, 0, 0, 0, 1, 1,
-0.5592544, 0.4906632, -1.380777, 0, 0, 0, 1, 1,
-0.5447052, -0.8261666, -3.609288, 0, 0, 0, 1, 1,
-0.5442352, -0.988469, -3.229542, 0, 0, 0, 1, 1,
-0.5415936, 0.027476, -1.329786, 0, 0, 0, 1, 1,
-0.5393503, -2.236519, -1.121717, 0, 0, 0, 1, 1,
-0.5389335, -0.1501066, -2.558764, 0, 0, 0, 1, 1,
-0.537644, -0.6089443, -1.837304, 1, 1, 1, 1, 1,
-0.5374546, 2.047076, -0.712289, 1, 1, 1, 1, 1,
-0.5329687, 0.9597903, 0.2215066, 1, 1, 1, 1, 1,
-0.5279878, -0.08247509, -0.6748602, 1, 1, 1, 1, 1,
-0.5271562, -1.182667, -4.863956, 1, 1, 1, 1, 1,
-0.5247216, 0.4564174, -3.281117, 1, 1, 1, 1, 1,
-0.5234271, 0.9052572, -0.5276488, 1, 1, 1, 1, 1,
-0.5206445, 1.2217, -2.209565, 1, 1, 1, 1, 1,
-0.5145401, 0.9083377, -0.08747646, 1, 1, 1, 1, 1,
-0.5134909, 1.559287, 0.03488318, 1, 1, 1, 1, 1,
-0.5134659, 1.628747, 0.5017664, 1, 1, 1, 1, 1,
-0.51345, 0.4625351, -0.6043503, 1, 1, 1, 1, 1,
-0.5124382, -1.158866, -2.476496, 1, 1, 1, 1, 1,
-0.5122979, -0.440153, -2.524948, 1, 1, 1, 1, 1,
-0.5069687, 1.263409, 1.356326, 1, 1, 1, 1, 1,
-0.5021265, 0.7115086, -0.6783282, 0, 0, 1, 1, 1,
-0.4975264, -0.2792235, -1.561156, 1, 0, 0, 1, 1,
-0.4954369, -2.61054, -4.220149, 1, 0, 0, 1, 1,
-0.4892077, 0.541451, -2.275081, 1, 0, 0, 1, 1,
-0.4890062, 0.428307, -0.02004579, 1, 0, 0, 1, 1,
-0.4885842, -1.347415, -0.5967276, 1, 0, 0, 1, 1,
-0.4879898, -0.2320439, -1.582236, 0, 0, 0, 1, 1,
-0.485608, -0.8331486, -0.8813073, 0, 0, 0, 1, 1,
-0.4849703, 0.7468079, -1.667028, 0, 0, 0, 1, 1,
-0.4829009, 0.4288968, -2.191799, 0, 0, 0, 1, 1,
-0.4816201, -0.7430986, -2.656645, 0, 0, 0, 1, 1,
-0.4795431, 0.24174, -3.361552, 0, 0, 0, 1, 1,
-0.4786802, 2.6538, -0.1305169, 0, 0, 0, 1, 1,
-0.4769181, 1.147343, -0.178908, 1, 1, 1, 1, 1,
-0.4764245, 0.3045426, 0.02706984, 1, 1, 1, 1, 1,
-0.4761307, -1.061195, -3.363385, 1, 1, 1, 1, 1,
-0.4732771, 0.4681641, -1.112297, 1, 1, 1, 1, 1,
-0.4639426, -0.06960175, 0.5415986, 1, 1, 1, 1, 1,
-0.4626389, 0.09602367, -2.336279, 1, 1, 1, 1, 1,
-0.4605619, 0.1394827, -1.392567, 1, 1, 1, 1, 1,
-0.4601312, 0.4768181, -1.091668, 1, 1, 1, 1, 1,
-0.4512099, -0.8973552, -3.901806, 1, 1, 1, 1, 1,
-0.4440399, -0.8476442, -1.754087, 1, 1, 1, 1, 1,
-0.4424447, 0.964554, 0.5163888, 1, 1, 1, 1, 1,
-0.4389625, -1.303746, -3.957589, 1, 1, 1, 1, 1,
-0.4354084, -1.001147, -3.246659, 1, 1, 1, 1, 1,
-0.4351401, -0.504319, -1.702367, 1, 1, 1, 1, 1,
-0.4297001, -0.7362423, -4.262012, 1, 1, 1, 1, 1,
-0.4294511, 0.2164103, -1.687863, 0, 0, 1, 1, 1,
-0.4294035, 1.322912, -0.5790911, 1, 0, 0, 1, 1,
-0.4223084, -1.081428, -4.032167, 1, 0, 0, 1, 1,
-0.4221698, -1.22003, -1.845383, 1, 0, 0, 1, 1,
-0.4126566, -0.7956809, -2.329414, 1, 0, 0, 1, 1,
-0.4102847, -0.1413424, -2.190743, 1, 0, 0, 1, 1,
-0.4096448, 0.8560743, -0.8060396, 0, 0, 0, 1, 1,
-0.4058982, -0.310039, -1.919244, 0, 0, 0, 1, 1,
-0.4045594, 0.8171408, -0.7116762, 0, 0, 0, 1, 1,
-0.4036207, -1.202957, -3.36292, 0, 0, 0, 1, 1,
-0.4023235, -0.07042949, -2.919392, 0, 0, 0, 1, 1,
-0.3956739, -0.008938444, -1.663383, 0, 0, 0, 1, 1,
-0.3940464, -1.369158, -2.097413, 0, 0, 0, 1, 1,
-0.3926891, -1.36218, -3.340249, 1, 1, 1, 1, 1,
-0.3887914, 0.8614752, -0.07703441, 1, 1, 1, 1, 1,
-0.3846633, 0.7737317, 1.132236, 1, 1, 1, 1, 1,
-0.3845218, 2.498602, -0.6589458, 1, 1, 1, 1, 1,
-0.3829343, 1.289083, -0.3860782, 1, 1, 1, 1, 1,
-0.3807644, 1.976428, -0.6722286, 1, 1, 1, 1, 1,
-0.3805665, 2.138218, -0.6232513, 1, 1, 1, 1, 1,
-0.3786045, 1.064577, 0.07162931, 1, 1, 1, 1, 1,
-0.3783374, 1.213951, -0.7811764, 1, 1, 1, 1, 1,
-0.3763635, 1.208746, -0.7810699, 1, 1, 1, 1, 1,
-0.3732691, -1.396974, -2.306478, 1, 1, 1, 1, 1,
-0.3725667, -0.2956197, -1.870893, 1, 1, 1, 1, 1,
-0.3695713, -0.2596795, -2.337231, 1, 1, 1, 1, 1,
-0.3670335, -0.3212599, -2.80208, 1, 1, 1, 1, 1,
-0.3669019, -0.4377886, -2.841563, 1, 1, 1, 1, 1,
-0.3652955, 0.05080126, -3.521023, 0, 0, 1, 1, 1,
-0.3632575, -0.7311161, -3.010907, 1, 0, 0, 1, 1,
-0.3631064, 0.6735382, -2.492489, 1, 0, 0, 1, 1,
-0.3592688, 0.9526345, -0.5749919, 1, 0, 0, 1, 1,
-0.3583467, -0.9156197, -3.834943, 1, 0, 0, 1, 1,
-0.3497007, -0.8173057, -3.64866, 1, 0, 0, 1, 1,
-0.3431868, -1.002595, -0.8338964, 0, 0, 0, 1, 1,
-0.3422506, 1.192392, -1.359643, 0, 0, 0, 1, 1,
-0.3388574, 1.378102, 0.5214134, 0, 0, 0, 1, 1,
-0.3359334, 1.63905, -3.429731, 0, 0, 0, 1, 1,
-0.3326564, 0.9166122, 1.435437, 0, 0, 0, 1, 1,
-0.3220398, -0.1012547, -1.262433, 0, 0, 0, 1, 1,
-0.3182364, -0.5672635, -3.077652, 0, 0, 0, 1, 1,
-0.3156055, -0.5623263, -2.8057, 1, 1, 1, 1, 1,
-0.3111548, 0.3650821, -0.9928899, 1, 1, 1, 1, 1,
-0.3098324, 0.5706498, -1.091168, 1, 1, 1, 1, 1,
-0.3084619, 0.5806133, -0.6976292, 1, 1, 1, 1, 1,
-0.2989286, 0.7696505, -0.8344299, 1, 1, 1, 1, 1,
-0.2969021, -1.077693, -3.128637, 1, 1, 1, 1, 1,
-0.2962392, -0.10465, -1.165867, 1, 1, 1, 1, 1,
-0.2922168, 1.494461, -0.1702879, 1, 1, 1, 1, 1,
-0.2896132, 0.05298993, 0.8169372, 1, 1, 1, 1, 1,
-0.2842136, 0.4533421, -1.725253, 1, 1, 1, 1, 1,
-0.2826681, -0.7127771, -2.643432, 1, 1, 1, 1, 1,
-0.2823437, 1.062694, 0.06474353, 1, 1, 1, 1, 1,
-0.2741555, -0.8858179, -2.834858, 1, 1, 1, 1, 1,
-0.2733931, -1.081519, -2.403809, 1, 1, 1, 1, 1,
-0.2729352, -2.029338, -2.137736, 1, 1, 1, 1, 1,
-0.2707272, 1.178443, -0.6971865, 0, 0, 1, 1, 1,
-0.2681476, 0.7488273, -0.4504139, 1, 0, 0, 1, 1,
-0.2673627, 1.473692, -0.6224359, 1, 0, 0, 1, 1,
-0.2672534, -1.91893, -3.574449, 1, 0, 0, 1, 1,
-0.2668345, 1.054057, -0.7203946, 1, 0, 0, 1, 1,
-0.2632381, -0.5201973, -2.783087, 1, 0, 0, 1, 1,
-0.263031, 0.9585137, -1.79044, 0, 0, 0, 1, 1,
-0.2630118, 0.4708531, 0.3879922, 0, 0, 0, 1, 1,
-0.2601486, 1.204875, 0.4569038, 0, 0, 0, 1, 1,
-0.2563713, -1.391409, -5.036103, 0, 0, 0, 1, 1,
-0.2530372, -0.1716443, -3.100508, 0, 0, 0, 1, 1,
-0.2474683, 0.3493687, -0.3853291, 0, 0, 0, 1, 1,
-0.2461317, 0.1245724, -0.3768368, 0, 0, 0, 1, 1,
-0.2370045, 0.4732265, -0.1337982, 1, 1, 1, 1, 1,
-0.2363009, 0.01199395, -0.5918731, 1, 1, 1, 1, 1,
-0.2350936, 0.7873401, 1.645289, 1, 1, 1, 1, 1,
-0.2349438, 0.5250956, 0.4904149, 1, 1, 1, 1, 1,
-0.233982, -2.3607, -3.611835, 1, 1, 1, 1, 1,
-0.2334339, -0.8537638, -2.190531, 1, 1, 1, 1, 1,
-0.2317776, -1.597993, -2.791998, 1, 1, 1, 1, 1,
-0.2293078, 1.149154, -0.6533129, 1, 1, 1, 1, 1,
-0.2267873, -0.6605595, -2.921619, 1, 1, 1, 1, 1,
-0.2178151, -0.09871621, -1.184056, 1, 1, 1, 1, 1,
-0.2101393, 1.549353, -0.3560124, 1, 1, 1, 1, 1,
-0.2087833, 1.765797, 0.7315308, 1, 1, 1, 1, 1,
-0.1998452, 0.5849448, 0.1134753, 1, 1, 1, 1, 1,
-0.1989969, 0.1090214, -0.5582026, 1, 1, 1, 1, 1,
-0.1802624, -1.372306, -2.438182, 1, 1, 1, 1, 1,
-0.1773029, 1.018989, 0.04621445, 0, 0, 1, 1, 1,
-0.1760053, -0.7615736, -3.061485, 1, 0, 0, 1, 1,
-0.1717427, 0.2224658, -0.3852201, 1, 0, 0, 1, 1,
-0.1680836, -0.4856548, -3.779919, 1, 0, 0, 1, 1,
-0.1660006, 0.6143067, -0.5344058, 1, 0, 0, 1, 1,
-0.1650258, -1.424271, -3.777187, 1, 0, 0, 1, 1,
-0.1594307, 1.492669, -1.759858, 0, 0, 0, 1, 1,
-0.1573308, 1.185877, -0.5361571, 0, 0, 0, 1, 1,
-0.1552423, 0.4830031, -2.023601, 0, 0, 0, 1, 1,
-0.1540372, -0.4850826, -3.901693, 0, 0, 0, 1, 1,
-0.1523563, -1.230333, -3.711725, 0, 0, 0, 1, 1,
-0.1483679, -0.4514647, -3.362277, 0, 0, 0, 1, 1,
-0.1477455, -0.2296284, -0.6415426, 0, 0, 0, 1, 1,
-0.1471572, 1.480244, -1.441783, 1, 1, 1, 1, 1,
-0.1463163, 0.07062535, -3.043172, 1, 1, 1, 1, 1,
-0.1456455, -1.104176, -3.130821, 1, 1, 1, 1, 1,
-0.1449342, -0.25344, -2.564706, 1, 1, 1, 1, 1,
-0.1423135, -1.388062, -2.848481, 1, 1, 1, 1, 1,
-0.1305091, 2.264926, 1.421187, 1, 1, 1, 1, 1,
-0.1241646, -1.014108, -4.923036, 1, 1, 1, 1, 1,
-0.120921, 0.9542224, -1.011787, 1, 1, 1, 1, 1,
-0.1202956, -0.05017776, -1.075927, 1, 1, 1, 1, 1,
-0.1202055, 1.873517, 0.920114, 1, 1, 1, 1, 1,
-0.1194796, -0.08127773, 0.03724075, 1, 1, 1, 1, 1,
-0.1162398, -0.5162672, -3.301383, 1, 1, 1, 1, 1,
-0.1150715, -0.4744097, -3.94839, 1, 1, 1, 1, 1,
-0.1113613, 0.1244821, 0.7501905, 1, 1, 1, 1, 1,
-0.1080726, 0.7748685, 0.4196172, 1, 1, 1, 1, 1,
-0.105116, -0.7470046, -2.975, 0, 0, 1, 1, 1,
-0.101363, -2.442173, -3.475422, 1, 0, 0, 1, 1,
-0.09930795, -0.3703959, -3.376075, 1, 0, 0, 1, 1,
-0.09830159, -0.001081628, -1.048976, 1, 0, 0, 1, 1,
-0.09815919, 0.4702225, 0.2896904, 1, 0, 0, 1, 1,
-0.09764141, -2.581774, -3.555267, 1, 0, 0, 1, 1,
-0.09448548, 1.820444, 0.1087503, 0, 0, 0, 1, 1,
-0.08665313, 2.031307, -1.178916, 0, 0, 0, 1, 1,
-0.08652267, 1.074444, 0.941405, 0, 0, 0, 1, 1,
-0.08561371, 0.7694986, -0.01324835, 0, 0, 0, 1, 1,
-0.08346711, -1.100464, -1.756494, 0, 0, 0, 1, 1,
-0.07935426, -1.494878, -3.86691, 0, 0, 0, 1, 1,
-0.07723398, 0.5694035, -1.067006, 0, 0, 0, 1, 1,
-0.07621277, 0.258562, 0.2261444, 1, 1, 1, 1, 1,
-0.07022862, -1.560424, -2.648485, 1, 1, 1, 1, 1,
-0.06988688, 2.067563, -0.04078954, 1, 1, 1, 1, 1,
-0.06623405, -0.1890668, -2.897698, 1, 1, 1, 1, 1,
-0.06487021, 0.3090297, -0.8767971, 1, 1, 1, 1, 1,
-0.06011945, 0.009890382, -0.1431071, 1, 1, 1, 1, 1,
-0.05542037, 0.5846776, 0.9788266, 1, 1, 1, 1, 1,
-0.04941613, 1.936163, 1.501939, 1, 1, 1, 1, 1,
-0.04470512, -0.1890117, -1.273775, 1, 1, 1, 1, 1,
-0.04180938, -0.1337359, -2.687523, 1, 1, 1, 1, 1,
-0.04014365, -0.8775783, -4.140237, 1, 1, 1, 1, 1,
-0.03910646, -0.8302355, -2.51352, 1, 1, 1, 1, 1,
-0.03909801, 0.9695976, 1.184981, 1, 1, 1, 1, 1,
-0.03462997, -0.2261425, -3.800235, 1, 1, 1, 1, 1,
-0.03282178, -0.5250906, -3.322151, 1, 1, 1, 1, 1,
-0.02960369, 0.8582544, 1.26098, 0, 0, 1, 1, 1,
-0.02836066, -0.8940684, -2.010736, 1, 0, 0, 1, 1,
-0.02789806, 0.8596912, -2.601474, 1, 0, 0, 1, 1,
-0.0267565, -1.706127, -4.27803, 1, 0, 0, 1, 1,
-0.02562541, -0.4151101, -3.07248, 1, 0, 0, 1, 1,
-0.02557417, -0.02254796, -1.183734, 1, 0, 0, 1, 1,
-0.01718329, 0.3612021, 1.199076, 0, 0, 0, 1, 1,
-0.01437062, 0.7318817, -0.2748191, 0, 0, 0, 1, 1,
-0.009192027, 1.9591, -0.6678594, 0, 0, 0, 1, 1,
-0.005089511, 1.713366, -1.02044, 0, 0, 0, 1, 1,
-0.002154857, -1.246776, -2.004549, 0, 0, 0, 1, 1,
-0.001857005, -0.8821919, -1.618469, 0, 0, 0, 1, 1,
0.003003545, -0.09489991, 3.112526, 0, 0, 0, 1, 1,
0.004572468, -0.04817893, 3.172641, 1, 1, 1, 1, 1,
0.005674398, 0.8966718, 0.8345099, 1, 1, 1, 1, 1,
0.006388424, 0.6923902, 0.4709584, 1, 1, 1, 1, 1,
0.009227874, -0.9451581, 1.833181, 1, 1, 1, 1, 1,
0.01388254, -0.5110494, 3.364401, 1, 1, 1, 1, 1,
0.0144767, -0.3697675, 1.969818, 1, 1, 1, 1, 1,
0.01505765, -0.5534833, 3.475176, 1, 1, 1, 1, 1,
0.01536031, 0.0980314, -0.8085005, 1, 1, 1, 1, 1,
0.01753732, 0.1787904, -1.050825, 1, 1, 1, 1, 1,
0.01799273, -2.566332, 1.712765, 1, 1, 1, 1, 1,
0.02436439, -0.2905284, 4.844237, 1, 1, 1, 1, 1,
0.02648383, 1.226854, 3.230187, 1, 1, 1, 1, 1,
0.02994468, 1.197595, -0.4028479, 1, 1, 1, 1, 1,
0.03026045, -2.150826, 2.342344, 1, 1, 1, 1, 1,
0.03043207, 1.212912, 1.371516, 1, 1, 1, 1, 1,
0.03429244, -1.099649, 0.6605774, 0, 0, 1, 1, 1,
0.03640857, 0.843154, -0.006601614, 1, 0, 0, 1, 1,
0.03770552, -1.662919, 3.941213, 1, 0, 0, 1, 1,
0.03915073, 1.572252, 0.600344, 1, 0, 0, 1, 1,
0.04154094, -0.7122969, 2.353099, 1, 0, 0, 1, 1,
0.04225807, -0.5055926, 3.044483, 1, 0, 0, 1, 1,
0.04315306, 0.0682485, -0.1621502, 0, 0, 0, 1, 1,
0.04458736, 0.02161965, -0.193441, 0, 0, 0, 1, 1,
0.04622126, -0.6325551, 2.497217, 0, 0, 0, 1, 1,
0.04704018, -0.03147723, 3.456812, 0, 0, 0, 1, 1,
0.04841791, -1.856854, 3.720082, 0, 0, 0, 1, 1,
0.04992202, 1.386989, -1.204012, 0, 0, 0, 1, 1,
0.05139535, -0.7730269, 3.549308, 0, 0, 0, 1, 1,
0.05145893, 1.347593, -0.7414199, 1, 1, 1, 1, 1,
0.05214622, 0.5960203, -1.223687, 1, 1, 1, 1, 1,
0.05279071, 1.045507, 1.375473, 1, 1, 1, 1, 1,
0.05792042, 0.6634721, 0.3849591, 1, 1, 1, 1, 1,
0.05890751, 0.8575602, 0.3471772, 1, 1, 1, 1, 1,
0.05935005, -0.5608975, 1.398579, 1, 1, 1, 1, 1,
0.06040862, -1.309492, 5.029817, 1, 1, 1, 1, 1,
0.06255066, -1.100543, 2.29502, 1, 1, 1, 1, 1,
0.06569712, -0.8714759, 2.261145, 1, 1, 1, 1, 1,
0.06860007, -1.346613, 4.503178, 1, 1, 1, 1, 1,
0.07041869, -0.466071, 2.377144, 1, 1, 1, 1, 1,
0.07371715, 0.9806084, -1.030832, 1, 1, 1, 1, 1,
0.07444059, -0.3831457, 6.262738, 1, 1, 1, 1, 1,
0.0745826, 2.472106, -0.6715934, 1, 1, 1, 1, 1,
0.07600623, 0.4103704, -0.6176462, 1, 1, 1, 1, 1,
0.07618634, -0.4107183, 1.432871, 0, 0, 1, 1, 1,
0.0794621, 0.8297457, -0.3084199, 1, 0, 0, 1, 1,
0.08072794, -1.045459, 4.321163, 1, 0, 0, 1, 1,
0.08223318, -1.029886, 2.80588, 1, 0, 0, 1, 1,
0.08357317, 0.7907521, -0.05718815, 1, 0, 0, 1, 1,
0.08760303, 0.9793874, -0.4061163, 1, 0, 0, 1, 1,
0.09194404, 2.409204, 1.477759, 0, 0, 0, 1, 1,
0.09300534, 0.8048921, -0.5823265, 0, 0, 0, 1, 1,
0.09343913, -1.007715, 4.717453, 0, 0, 0, 1, 1,
0.09604989, -0.723784, 4.055625, 0, 0, 0, 1, 1,
0.1004853, 2.08884, -0.2025874, 0, 0, 0, 1, 1,
0.1010053, 0.6886433, -0.5141649, 0, 0, 0, 1, 1,
0.1017111, 0.8339005, -0.43061, 0, 0, 0, 1, 1,
0.1037615, 0.09387066, 0.9852394, 1, 1, 1, 1, 1,
0.1090553, 1.757545, -0.03479282, 1, 1, 1, 1, 1,
0.1192877, -0.5266197, 3.742088, 1, 1, 1, 1, 1,
0.1216667, -1.655575, 3.044327, 1, 1, 1, 1, 1,
0.1225951, 1.447459, -0.09332933, 1, 1, 1, 1, 1,
0.1248366, 1.532893, -0.4221464, 1, 1, 1, 1, 1,
0.1259865, -2.007044, 2.436545, 1, 1, 1, 1, 1,
0.1265681, 0.293705, -1.03353, 1, 1, 1, 1, 1,
0.1288606, -0.2658944, 3.271198, 1, 1, 1, 1, 1,
0.1365989, -0.2355191, 2.981956, 1, 1, 1, 1, 1,
0.1385239, -0.8090695, 3.054557, 1, 1, 1, 1, 1,
0.1399068, 2.324482, 0.7510261, 1, 1, 1, 1, 1,
0.1411828, -0.3308072, 1.77412, 1, 1, 1, 1, 1,
0.1421593, -0.002122303, 2.209261, 1, 1, 1, 1, 1,
0.1484616, -0.5651211, 4.76438, 1, 1, 1, 1, 1,
0.1494755, -0.5707357, 3.8958, 0, 0, 1, 1, 1,
0.1505271, 1.265532, -1.71844, 1, 0, 0, 1, 1,
0.1529125, -1.859823, 2.841145, 1, 0, 0, 1, 1,
0.1532892, -1.031715, 2.795112, 1, 0, 0, 1, 1,
0.154761, -0.1404906, 3.025801, 1, 0, 0, 1, 1,
0.1570089, 0.6601887, 0.4090929, 1, 0, 0, 1, 1,
0.162023, -1.312608, 2.755908, 0, 0, 0, 1, 1,
0.1709894, -0.7981631, 3.141994, 0, 0, 0, 1, 1,
0.1766931, 0.115661, 1.723391, 0, 0, 0, 1, 1,
0.1767289, 1.790089, -0.1582836, 0, 0, 0, 1, 1,
0.1860136, 0.6262596, -0.2737607, 0, 0, 0, 1, 1,
0.1860657, 1.049543, -0.3713084, 0, 0, 0, 1, 1,
0.1940641, -0.8729974, 2.664227, 0, 0, 0, 1, 1,
0.1985108, 1.888612, -0.3142055, 1, 1, 1, 1, 1,
0.1996621, 1.005249, 1.382959, 1, 1, 1, 1, 1,
0.2004457, -1.28041, 3.25542, 1, 1, 1, 1, 1,
0.2049222, 0.09367838, 0.04431107, 1, 1, 1, 1, 1,
0.2061215, 1.166734, 0.9808319, 1, 1, 1, 1, 1,
0.2073657, 0.54385, 0.7393057, 1, 1, 1, 1, 1,
0.2105971, -1.784045, 2.867401, 1, 1, 1, 1, 1,
0.2168114, -1.042598, 3.889829, 1, 1, 1, 1, 1,
0.2171237, -0.4379652, 3.174524, 1, 1, 1, 1, 1,
0.2195755, 1.093048, 1.205463, 1, 1, 1, 1, 1,
0.2201808, -1.886781, 2.461175, 1, 1, 1, 1, 1,
0.2228506, 0.008724985, 1.221163, 1, 1, 1, 1, 1,
0.2246561, 2.348149, -1.17827, 1, 1, 1, 1, 1,
0.2248972, 1.036132, 1.044566, 1, 1, 1, 1, 1,
0.230766, 0.9124388, -0.3384258, 1, 1, 1, 1, 1,
0.2341893, -0.8718863, 1.558515, 0, 0, 1, 1, 1,
0.2372106, -0.8486831, 1.878487, 1, 0, 0, 1, 1,
0.2377711, -1.313164, 3.069821, 1, 0, 0, 1, 1,
0.2400251, -0.1469617, 2.130639, 1, 0, 0, 1, 1,
0.2426836, -0.2611413, 1.829291, 1, 0, 0, 1, 1,
0.2454636, 1.656336, -1.617705, 1, 0, 0, 1, 1,
0.2499072, 0.5604547, 1.020066, 0, 0, 0, 1, 1,
0.2538472, -1.287346, 3.067982, 0, 0, 0, 1, 1,
0.2556564, 2.56717, -1.782305, 0, 0, 0, 1, 1,
0.2578006, 0.1222423, 1.140852, 0, 0, 0, 1, 1,
0.2625576, 0.1902667, 0.464268, 0, 0, 0, 1, 1,
0.2736056, 0.1843636, 0.4801169, 0, 0, 0, 1, 1,
0.2764186, 0.9079763, 0.8890017, 0, 0, 0, 1, 1,
0.2782882, -0.4898782, 1.757648, 1, 1, 1, 1, 1,
0.2805448, 1.160166, 2.267701, 1, 1, 1, 1, 1,
0.2865717, -0.5460254, 2.78748, 1, 1, 1, 1, 1,
0.2905732, 0.642203, 1.653225, 1, 1, 1, 1, 1,
0.2907934, 0.4484603, 1.371732, 1, 1, 1, 1, 1,
0.2908467, 1.149176, 0.3225791, 1, 1, 1, 1, 1,
0.2922356, -0.3779745, 1.847853, 1, 1, 1, 1, 1,
0.2948759, 0.1589479, 2.375533, 1, 1, 1, 1, 1,
0.2966889, -0.8747407, 2.842223, 1, 1, 1, 1, 1,
0.2983971, 0.09837116, 0.9682974, 1, 1, 1, 1, 1,
0.3007709, 0.648459, 1.992498, 1, 1, 1, 1, 1,
0.3038172, -1.542825, 3.200653, 1, 1, 1, 1, 1,
0.3059067, -0.3413919, 2.067324, 1, 1, 1, 1, 1,
0.3063607, -0.9859642, 3.675131, 1, 1, 1, 1, 1,
0.3074366, -0.4870091, 2.363672, 1, 1, 1, 1, 1,
0.3075179, -2.066425, 2.388736, 0, 0, 1, 1, 1,
0.3130758, -0.3395696, 1.07222, 1, 0, 0, 1, 1,
0.3148321, -0.09948022, 1.54273, 1, 0, 0, 1, 1,
0.3169912, -2.526919, 4.826367, 1, 0, 0, 1, 1,
0.3225743, 0.6877926, 0.6366898, 1, 0, 0, 1, 1,
0.3364144, 0.5250931, 0.417359, 1, 0, 0, 1, 1,
0.3376923, -1.125611, 5.149152, 0, 0, 0, 1, 1,
0.340464, -1.489862, 3.050595, 0, 0, 0, 1, 1,
0.3432561, -0.2406719, 3.820521, 0, 0, 0, 1, 1,
0.3466589, 0.6962993, 1.537551, 0, 0, 0, 1, 1,
0.3516939, 0.5797969, 2.279623, 0, 0, 0, 1, 1,
0.3564751, 1.582313, 1.134834, 0, 0, 0, 1, 1,
0.3688133, 0.1291777, 1.429032, 0, 0, 0, 1, 1,
0.3752291, 1.209883, 1.247541, 1, 1, 1, 1, 1,
0.3840763, 0.6278595, 0.9046037, 1, 1, 1, 1, 1,
0.3880779, -1.098082, 1.857352, 1, 1, 1, 1, 1,
0.3944151, -2.088235, 3.6768, 1, 1, 1, 1, 1,
0.3974457, 0.3365383, 1.231333, 1, 1, 1, 1, 1,
0.3982988, 1.142125, 1.741785, 1, 1, 1, 1, 1,
0.4013031, -0.8651024, 3.004093, 1, 1, 1, 1, 1,
0.4055227, -0.07248528, 1.931445, 1, 1, 1, 1, 1,
0.4057656, -0.3360357, 2.255946, 1, 1, 1, 1, 1,
0.4086154, -0.7471859, 3.0769, 1, 1, 1, 1, 1,
0.4097399, -0.835768, 4.309714, 1, 1, 1, 1, 1,
0.4099967, -0.9047796, 3.023106, 1, 1, 1, 1, 1,
0.4122576, 0.2710944, 1.147285, 1, 1, 1, 1, 1,
0.4130275, -0.202593, 1.036094, 1, 1, 1, 1, 1,
0.4138591, 1.569314, 0.1326564, 1, 1, 1, 1, 1,
0.4161339, 0.3760012, 2.167554, 0, 0, 1, 1, 1,
0.4169946, 0.5394304, 0.2722711, 1, 0, 0, 1, 1,
0.4170475, 0.1831266, 0.2527075, 1, 0, 0, 1, 1,
0.4190042, -0.6762037, 2.867452, 1, 0, 0, 1, 1,
0.4211354, -0.9341151, 2.323716, 1, 0, 0, 1, 1,
0.4243824, -0.7754391, 3.580108, 1, 0, 0, 1, 1,
0.4297517, 2.451817, -0.9365022, 0, 0, 0, 1, 1,
0.4332521, 0.597272, -0.1023885, 0, 0, 0, 1, 1,
0.4351388, -1.884214, 0.5619923, 0, 0, 0, 1, 1,
0.4389564, 0.7789778, -0.2254466, 0, 0, 0, 1, 1,
0.4409612, 0.9833429, 0.3763317, 0, 0, 0, 1, 1,
0.4432128, 0.1281407, 1.251545, 0, 0, 0, 1, 1,
0.4478775, 0.8572315, 0.05775713, 0, 0, 0, 1, 1,
0.4484403, -0.5863023, 0.0692166, 1, 1, 1, 1, 1,
0.4486748, 0.6880485, 0.2775612, 1, 1, 1, 1, 1,
0.4493609, -0.1007809, 1.415156, 1, 1, 1, 1, 1,
0.4575732, 0.3698796, 1.727128, 1, 1, 1, 1, 1,
0.459298, -0.6071165, 0.7851308, 1, 1, 1, 1, 1,
0.4647796, 0.1357321, 2.557519, 1, 1, 1, 1, 1,
0.4649051, 0.2197214, 0.5121202, 1, 1, 1, 1, 1,
0.4680792, -0.5287691, 1.659229, 1, 1, 1, 1, 1,
0.4692769, 2.391626, 0.5361353, 1, 1, 1, 1, 1,
0.4718621, 0.5589896, 0.4004962, 1, 1, 1, 1, 1,
0.4721127, -0.9787019, 2.251631, 1, 1, 1, 1, 1,
0.4756482, 1.07136, 1.463055, 1, 1, 1, 1, 1,
0.4809385, -0.8730096, 3.80612, 1, 1, 1, 1, 1,
0.4815218, -0.5395769, 2.547874, 1, 1, 1, 1, 1,
0.4824482, 0.4817778, 0.3210772, 1, 1, 1, 1, 1,
0.4920823, -0.06646173, 2.351525, 0, 0, 1, 1, 1,
0.4987809, -0.7169477, 3.626789, 1, 0, 0, 1, 1,
0.5010542, 0.2941667, 0.6673617, 1, 0, 0, 1, 1,
0.5018765, -0.1370219, 1.929543, 1, 0, 0, 1, 1,
0.5021253, -0.2358892, 1.801712, 1, 0, 0, 1, 1,
0.5073676, -1.238234, 3.235198, 1, 0, 0, 1, 1,
0.5120711, -1.662804, 2.98338, 0, 0, 0, 1, 1,
0.5128373, 0.2473346, 1.100037, 0, 0, 0, 1, 1,
0.5144429, -0.8170035, 1.580134, 0, 0, 0, 1, 1,
0.5162792, -0.6142874, 1.88569, 0, 0, 0, 1, 1,
0.5236127, 1.392884, -1.171244, 0, 0, 0, 1, 1,
0.530665, 0.5769896, 1.233413, 0, 0, 0, 1, 1,
0.5338187, 0.04984477, 4.265985, 0, 0, 0, 1, 1,
0.5345712, 0.07745799, 2.005281, 1, 1, 1, 1, 1,
0.5364441, 0.776544, 2.106054, 1, 1, 1, 1, 1,
0.5365667, 0.493533, 2.876692, 1, 1, 1, 1, 1,
0.5442442, 0.4991359, 0.251625, 1, 1, 1, 1, 1,
0.5482443, 0.05612296, 1.535183, 1, 1, 1, 1, 1,
0.5494322, 0.0441364, 1.679031, 1, 1, 1, 1, 1,
0.5504711, -1.248296, 0.7734677, 1, 1, 1, 1, 1,
0.5521521, -0.4352119, 2.697513, 1, 1, 1, 1, 1,
0.5620404, -1.13604, 0.3291332, 1, 1, 1, 1, 1,
0.569245, -0.1085423, 2.521553, 1, 1, 1, 1, 1,
0.5729886, -0.1842586, 2.618289, 1, 1, 1, 1, 1,
0.5739183, -0.03120237, 3.156601, 1, 1, 1, 1, 1,
0.5746335, -0.3335764, 2.58868, 1, 1, 1, 1, 1,
0.5795224, 2.413873, 0.09471537, 1, 1, 1, 1, 1,
0.582055, 1.400591, -0.7280937, 1, 1, 1, 1, 1,
0.5838717, 0.8134103, 0.8910347, 0, 0, 1, 1, 1,
0.5843984, -0.6955062, 2.98496, 1, 0, 0, 1, 1,
0.5851527, -0.589011, 3.998756, 1, 0, 0, 1, 1,
0.5889915, -0.1276214, 1.708079, 1, 0, 0, 1, 1,
0.5901631, -0.1192607, 1.362979, 1, 0, 0, 1, 1,
0.5903591, -0.7041161, 1.880675, 1, 0, 0, 1, 1,
0.603008, -0.549243, 2.367801, 0, 0, 0, 1, 1,
0.6060743, -0.1351594, 1.213572, 0, 0, 0, 1, 1,
0.607437, 0.09484616, 2.104134, 0, 0, 0, 1, 1,
0.6082982, 2.029185, 1.258042, 0, 0, 0, 1, 1,
0.6083587, -2.506339, 3.107459, 0, 0, 0, 1, 1,
0.6091067, -1.051915, 2.705329, 0, 0, 0, 1, 1,
0.6113943, 3.123333, 0.26737, 0, 0, 0, 1, 1,
0.614132, -1.478732, 2.231845, 1, 1, 1, 1, 1,
0.623552, 1.329544, 0.09243387, 1, 1, 1, 1, 1,
0.6243185, -0.4062421, 1.11221, 1, 1, 1, 1, 1,
0.6265189, -0.1869619, 2.318653, 1, 1, 1, 1, 1,
0.6281781, -0.5680753, 2.484491, 1, 1, 1, 1, 1,
0.6319606, -1.155814, 2.320435, 1, 1, 1, 1, 1,
0.6323135, -0.4462543, 4.227243, 1, 1, 1, 1, 1,
0.6333451, -0.813759, 4.024867, 1, 1, 1, 1, 1,
0.6368223, 0.8315319, 1.103092, 1, 1, 1, 1, 1,
0.6509048, -1.917215, 3.757557, 1, 1, 1, 1, 1,
0.6524667, -2.329824, 2.917068, 1, 1, 1, 1, 1,
0.6530361, 0.6917442, 1.978662, 1, 1, 1, 1, 1,
0.6549681, -1.3759, 2.630523, 1, 1, 1, 1, 1,
0.655996, 0.3895086, 0.9619212, 1, 1, 1, 1, 1,
0.6576809, 1.641437, -0.2579883, 1, 1, 1, 1, 1,
0.6617595, 0.1276515, 0.6947482, 0, 0, 1, 1, 1,
0.6646435, -0.2455395, 1.839635, 1, 0, 0, 1, 1,
0.6669804, 0.2321952, 0.9847572, 1, 0, 0, 1, 1,
0.6706765, 0.2131713, 0.365891, 1, 0, 0, 1, 1,
0.6712546, -0.8987809, 3.566989, 1, 0, 0, 1, 1,
0.674067, 2.12203, 0.8021277, 1, 0, 0, 1, 1,
0.6756032, -1.873238, 1.857706, 0, 0, 0, 1, 1,
0.6764644, -0.8225917, 2.536408, 0, 0, 0, 1, 1,
0.6766873, -0.4610716, 3.359079, 0, 0, 0, 1, 1,
0.6774029, 0.198307, 1.175367, 0, 0, 0, 1, 1,
0.681348, 1.598033, -0.02103613, 0, 0, 0, 1, 1,
0.6848153, 1.113711, -0.3395498, 0, 0, 0, 1, 1,
0.6886992, 1.927738, 0.6770813, 0, 0, 0, 1, 1,
0.6896688, 2.04158, -0.9308408, 1, 1, 1, 1, 1,
0.6929381, 0.6190571, 2.499074, 1, 1, 1, 1, 1,
0.6937937, 1.785814, 1.406397, 1, 1, 1, 1, 1,
0.695265, 1.501193, -0.6041169, 1, 1, 1, 1, 1,
0.6966232, 0.3824091, -0.302316, 1, 1, 1, 1, 1,
0.71518, 0.4125395, -0.05158978, 1, 1, 1, 1, 1,
0.7153869, 0.8358846, -0.7258072, 1, 1, 1, 1, 1,
0.7179564, -1.35778, 3.084391, 1, 1, 1, 1, 1,
0.7180334, -0.6678217, 3.426785, 1, 1, 1, 1, 1,
0.7206656, 1.250166, 0.6302353, 1, 1, 1, 1, 1,
0.7227404, 0.1393294, 2.443701, 1, 1, 1, 1, 1,
0.7229706, 1.260923, 1.36171, 1, 1, 1, 1, 1,
0.7257845, -0.8594586, 0.9626147, 1, 1, 1, 1, 1,
0.7283123, 1.019393, 0.6518219, 1, 1, 1, 1, 1,
0.7302809, -0.3697208, 2.658426, 1, 1, 1, 1, 1,
0.7306997, -1.7984, 2.761379, 0, 0, 1, 1, 1,
0.7321896, 0.4652426, -0.09563915, 1, 0, 0, 1, 1,
0.734352, 0.6205691, -0.3800787, 1, 0, 0, 1, 1,
0.7378013, -0.263105, 2.813913, 1, 0, 0, 1, 1,
0.7389241, 0.07037953, 2.248875, 1, 0, 0, 1, 1,
0.7395248, 2.446728, 1.089389, 1, 0, 0, 1, 1,
0.7426024, -0.8785647, 2.491098, 0, 0, 0, 1, 1,
0.7438704, -0.1462916, 2.540363, 0, 0, 0, 1, 1,
0.7463714, -1.131789, 1.224549, 0, 0, 0, 1, 1,
0.7470824, -0.2048005, 1.171671, 0, 0, 0, 1, 1,
0.7545599, 0.925628, 1.162736, 0, 0, 0, 1, 1,
0.7577013, 0.546311, -0.4801555, 0, 0, 0, 1, 1,
0.7658976, 0.2794946, 3.210756, 0, 0, 0, 1, 1,
0.7695563, 0.1998402, -0.0559507, 1, 1, 1, 1, 1,
0.7713632, -1.067707, 4.017448, 1, 1, 1, 1, 1,
0.7721835, -0.9759225, 4.527303, 1, 1, 1, 1, 1,
0.7811012, -0.496058, 0.4006792, 1, 1, 1, 1, 1,
0.7819881, 1.281937, -1.355686, 1, 1, 1, 1, 1,
0.7837735, -1.275103, 1.344172, 1, 1, 1, 1, 1,
0.7879294, 1.618366, 1.035013, 1, 1, 1, 1, 1,
0.7888772, -0.642008, 1.081617, 1, 1, 1, 1, 1,
0.7897003, 0.07079391, 1.36337, 1, 1, 1, 1, 1,
0.7915359, -0.7867141, 0.4801655, 1, 1, 1, 1, 1,
0.792866, 0.5718754, 0.7956942, 1, 1, 1, 1, 1,
0.8011069, -1.190495, 2.922292, 1, 1, 1, 1, 1,
0.8085915, 0.2407738, -0.6795031, 1, 1, 1, 1, 1,
0.8108284, 0.2378342, 2.37794, 1, 1, 1, 1, 1,
0.8154306, -0.292076, 2.808746, 1, 1, 1, 1, 1,
0.8157123, 0.3635028, 2.103481, 0, 0, 1, 1, 1,
0.8166617, -0.5063117, 1.747282, 1, 0, 0, 1, 1,
0.818628, -0.05864087, 1.61056, 1, 0, 0, 1, 1,
0.8219125, -0.2819443, 2.505785, 1, 0, 0, 1, 1,
0.8253795, 0.7515727, 1.751286, 1, 0, 0, 1, 1,
0.8255507, -0.2242679, 2.525037, 1, 0, 0, 1, 1,
0.8274025, 0.08807427, 2.117425, 0, 0, 0, 1, 1,
0.8278805, -0.5359405, 2.16803, 0, 0, 0, 1, 1,
0.8279296, 1.492284, 0.8392389, 0, 0, 0, 1, 1,
0.8302032, -0.8153669, 0.6335852, 0, 0, 0, 1, 1,
0.8307568, -0.1366469, 1.067248, 0, 0, 0, 1, 1,
0.8316305, -2.098949, 2.880064, 0, 0, 0, 1, 1,
0.8371023, -0.6484219, 4.425468, 0, 0, 0, 1, 1,
0.8374359, -0.9743834, 3.516171, 1, 1, 1, 1, 1,
0.8454565, -1.320544, 3.327345, 1, 1, 1, 1, 1,
0.8455395, 1.415134, 0.753125, 1, 1, 1, 1, 1,
0.8486029, 0.038519, 1.329442, 1, 1, 1, 1, 1,
0.858458, -2.718612, 3.479227, 1, 1, 1, 1, 1,
0.860863, -0.1387951, 0.9483402, 1, 1, 1, 1, 1,
0.8703338, 1.272409, 0.8926066, 1, 1, 1, 1, 1,
0.872992, -0.04244267, 1.352779, 1, 1, 1, 1, 1,
0.8731294, 0.7160664, 1.064354, 1, 1, 1, 1, 1,
0.8755318, -0.9586515, 3.610599, 1, 1, 1, 1, 1,
0.8897166, -1.623281, 3.244838, 1, 1, 1, 1, 1,
0.8964694, -1.235123, 2.86335, 1, 1, 1, 1, 1,
0.8992064, -1.325235, 3.664802, 1, 1, 1, 1, 1,
0.9017248, -0.448855, 0.7341224, 1, 1, 1, 1, 1,
0.9028206, 0.2765729, 1.911867, 1, 1, 1, 1, 1,
0.9094034, 0.5436278, -0.3343801, 0, 0, 1, 1, 1,
0.9127563, 0.5083378, 0.7163288, 1, 0, 0, 1, 1,
0.912945, -0.1776454, 0.3901686, 1, 0, 0, 1, 1,
0.9159032, 1.908214, -0.3159909, 1, 0, 0, 1, 1,
0.9252657, 0.1206376, 3.435177, 1, 0, 0, 1, 1,
0.9347183, 2.501917, 1.790033, 1, 0, 0, 1, 1,
0.9357454, 0.7999311, -0.2995306, 0, 0, 0, 1, 1,
0.9396202, 3.217741, -1.750244, 0, 0, 0, 1, 1,
0.9425159, 1.567536, 1.702438, 0, 0, 0, 1, 1,
0.951192, -2.073918, 3.435698, 0, 0, 0, 1, 1,
0.9527067, -0.5241913, 0.7538846, 0, 0, 0, 1, 1,
0.9640638, -0.6011707, 1.233262, 0, 0, 0, 1, 1,
0.9677987, -1.978075, 2.863143, 0, 0, 0, 1, 1,
0.9799039, -0.563252, 1.642059, 1, 1, 1, 1, 1,
0.9816084, 1.539226, 1.759236, 1, 1, 1, 1, 1,
0.9838204, -0.3414645, 2.805096, 1, 1, 1, 1, 1,
0.9937195, -1.364574, 2.34158, 1, 1, 1, 1, 1,
0.9960723, -2.747668, 2.115553, 1, 1, 1, 1, 1,
0.9964656, 1.096591, -0.8907237, 1, 1, 1, 1, 1,
0.997097, -0.4092539, 2.31551, 1, 1, 1, 1, 1,
1.002114, -1.606837, 3.202924, 1, 1, 1, 1, 1,
1.007302, 0.8122076, 0.005414115, 1, 1, 1, 1, 1,
1.009965, 1.281002, -0.9291696, 1, 1, 1, 1, 1,
1.010267, -0.8276284, 0.5473809, 1, 1, 1, 1, 1,
1.01465, -1.462552, 0.7812409, 1, 1, 1, 1, 1,
1.015432, 0.7622806, 0.5055124, 1, 1, 1, 1, 1,
1.016226, -0.82025, 1.882908, 1, 1, 1, 1, 1,
1.022821, 1.293166, 0.376434, 1, 1, 1, 1, 1,
1.023217, 0.8292876, 1.163225, 0, 0, 1, 1, 1,
1.023479, 0.3440489, 1.430876, 1, 0, 0, 1, 1,
1.023723, -0.766353, 3.265846, 1, 0, 0, 1, 1,
1.03022, -1.637099, 2.960968, 1, 0, 0, 1, 1,
1.036279, -0.03540145, 3.282405, 1, 0, 0, 1, 1,
1.04113, 1.897409, -0.5913491, 1, 0, 0, 1, 1,
1.042059, -1.05368, 1.182175, 0, 0, 0, 1, 1,
1.044456, 1.310061, -0.07410259, 0, 0, 0, 1, 1,
1.047012, -0.3799425, 2.047061, 0, 0, 0, 1, 1,
1.047799, -0.884596, 2.480485, 0, 0, 0, 1, 1,
1.051506, -0.768307, 1.543455, 0, 0, 0, 1, 1,
1.054574, -0.8017632, 1.54167, 0, 0, 0, 1, 1,
1.062338, 2.141828, 0.6725193, 0, 0, 0, 1, 1,
1.068736, 0.4796142, 0.7493269, 1, 1, 1, 1, 1,
1.069908, 0.1230182, 0.458549, 1, 1, 1, 1, 1,
1.073083, -0.4704001, 1.723736, 1, 1, 1, 1, 1,
1.082527, 0.4573783, 1.331075, 1, 1, 1, 1, 1,
1.087817, 1.222305, 0.1622882, 1, 1, 1, 1, 1,
1.09747, -0.6063411, -0.04017236, 1, 1, 1, 1, 1,
1.098372, -1.867503, 2.339243, 1, 1, 1, 1, 1,
1.100835, -0.262954, 1.882296, 1, 1, 1, 1, 1,
1.101053, 0.387295, 1.283054, 1, 1, 1, 1, 1,
1.103325, -0.1834879, 2.185369, 1, 1, 1, 1, 1,
1.106081, 0.7928444, 0.7311632, 1, 1, 1, 1, 1,
1.112278, 0.34613, 1.252217, 1, 1, 1, 1, 1,
1.117373, 0.2567559, 0.2453389, 1, 1, 1, 1, 1,
1.12019, 0.895662, 0.5069196, 1, 1, 1, 1, 1,
1.127335, 0.1027007, 1.393362, 1, 1, 1, 1, 1,
1.129477, -1.341947, 1.975245, 0, 0, 1, 1, 1,
1.137205, -1.147069, 5.758828, 1, 0, 0, 1, 1,
1.141246, -0.0495361, 3.359961, 1, 0, 0, 1, 1,
1.142441, -0.8986772, 3.31175, 1, 0, 0, 1, 1,
1.151783, -0.8677021, 1.382929, 1, 0, 0, 1, 1,
1.154666, -2.142985, 3.875124, 1, 0, 0, 1, 1,
1.159427, 0.4780267, 1.698593, 0, 0, 0, 1, 1,
1.164576, 0.7084818, 1.428044, 0, 0, 0, 1, 1,
1.178146, 1.092658, 0.224844, 0, 0, 0, 1, 1,
1.18451, 0.5111387, 1.532637, 0, 0, 0, 1, 1,
1.18597, -0.2302252, 2.123328, 0, 0, 0, 1, 1,
1.188988, -0.05788425, 3.496753, 0, 0, 0, 1, 1,
1.189452, 1.570773, 0.4986326, 0, 0, 0, 1, 1,
1.191627, -0.7640062, 3.008651, 1, 1, 1, 1, 1,
1.196996, 0.1180694, 2.156836, 1, 1, 1, 1, 1,
1.201823, 0.139996, 1.029217, 1, 1, 1, 1, 1,
1.204299, -1.163902, 2.943314, 1, 1, 1, 1, 1,
1.204917, -0.3972096, 1.433187, 1, 1, 1, 1, 1,
1.209053, 1.742107, 1.636469, 1, 1, 1, 1, 1,
1.209107, -0.2562282, 2.874851, 1, 1, 1, 1, 1,
1.217975, 1.061708, 2.251069, 1, 1, 1, 1, 1,
1.245054, -0.2582962, 1.748756, 1, 1, 1, 1, 1,
1.250354, -0.3055269, 2.626392, 1, 1, 1, 1, 1,
1.254416, -1.232989, 1.534983, 1, 1, 1, 1, 1,
1.256204, 0.3895929, 1.675179, 1, 1, 1, 1, 1,
1.257619, -0.5405918, 3.767095, 1, 1, 1, 1, 1,
1.266485, 0.4662666, 0.1939299, 1, 1, 1, 1, 1,
1.292543, 0.9350056, 2.120734, 1, 1, 1, 1, 1,
1.292816, -0.5376318, -0.8870934, 0, 0, 1, 1, 1,
1.302735, 1.280669, -0.6254834, 1, 0, 0, 1, 1,
1.308547, 0.9881976, 1.495271, 1, 0, 0, 1, 1,
1.324991, -1.39468, 0.6142165, 1, 0, 0, 1, 1,
1.328067, -2.29621, 3.344489, 1, 0, 0, 1, 1,
1.332558, -1.299207, 1.356502, 1, 0, 0, 1, 1,
1.339981, -2.387584, 1.035223, 0, 0, 0, 1, 1,
1.345266, 1.02124, 0.07431635, 0, 0, 0, 1, 1,
1.352468, -1.041646, 2.639133, 0, 0, 0, 1, 1,
1.352886, -0.3132016, 1.740671, 0, 0, 0, 1, 1,
1.367881, -1.554999, 1.95856, 0, 0, 0, 1, 1,
1.368247, 0.2522359, -0.1674385, 0, 0, 0, 1, 1,
1.368851, -1.084155, 2.56705, 0, 0, 0, 1, 1,
1.372328, 1.448274, 0.3374481, 1, 1, 1, 1, 1,
1.38123, -0.3157333, 2.913976, 1, 1, 1, 1, 1,
1.398152, 1.412904, 1.961739, 1, 1, 1, 1, 1,
1.408172, -0.6736448, 0.9927096, 1, 1, 1, 1, 1,
1.408924, -0.607541, 0.8274558, 1, 1, 1, 1, 1,
1.411302, -0.6139573, 2.099366, 1, 1, 1, 1, 1,
1.413352, -0.6312214, 1.89163, 1, 1, 1, 1, 1,
1.429366, -0.179567, 0.6304814, 1, 1, 1, 1, 1,
1.430033, -0.03901068, 3.832468, 1, 1, 1, 1, 1,
1.436449, -0.2423812, 1.555622, 1, 1, 1, 1, 1,
1.449482, 1.259034, 0.6586843, 1, 1, 1, 1, 1,
1.452699, 0.006591363, 1.445372, 1, 1, 1, 1, 1,
1.454818, -2.197661, 2.274401, 1, 1, 1, 1, 1,
1.455534, 0.2502328, 2.457094, 1, 1, 1, 1, 1,
1.495684, 1.664135, 0.7162339, 1, 1, 1, 1, 1,
1.507587, 0.1338177, 1.809609, 0, 0, 1, 1, 1,
1.510099, 2.267916, 0.8588678, 1, 0, 0, 1, 1,
1.515299, 0.700403, 1.795042, 1, 0, 0, 1, 1,
1.515447, -0.1061572, 1.44311, 1, 0, 0, 1, 1,
1.521448, -0.4413467, 3.209459, 1, 0, 0, 1, 1,
1.545776, 0.9725612, 2.006191, 1, 0, 0, 1, 1,
1.553105, -0.8818263, 2.06064, 0, 0, 0, 1, 1,
1.557874, 1.296481, 0.484343, 0, 0, 0, 1, 1,
1.564172, -1.016894, 1.774727, 0, 0, 0, 1, 1,
1.572319, 0.1749015, -0.1311581, 0, 0, 0, 1, 1,
1.575344, -1.431274, 3.781209, 0, 0, 0, 1, 1,
1.580069, -1.219667, 2.314458, 0, 0, 0, 1, 1,
1.581197, 1.960589, 2.433875, 0, 0, 0, 1, 1,
1.584609, 2.119592, 1.676089, 1, 1, 1, 1, 1,
1.602449, -0.9152635, 4.171751, 1, 1, 1, 1, 1,
1.608575, -1.835024, 2.1401, 1, 1, 1, 1, 1,
1.619692, -2.616447, 2.478782, 1, 1, 1, 1, 1,
1.622547, -0.4036384, 1.202834, 1, 1, 1, 1, 1,
1.62285, 0.5983382, 2.532144, 1, 1, 1, 1, 1,
1.623986, 1.589959, 1.58814, 1, 1, 1, 1, 1,
1.664442, 0.4341573, 1.126716, 1, 1, 1, 1, 1,
1.66651, 0.7232118, 2.255415, 1, 1, 1, 1, 1,
1.670816, -0.4344916, 2.733381, 1, 1, 1, 1, 1,
1.674212, 1.441481, 0.838145, 1, 1, 1, 1, 1,
1.683726, -0.3535165, 2.128867, 1, 1, 1, 1, 1,
1.717106, -0.4427513, 2.771565, 1, 1, 1, 1, 1,
1.740758, -2.5097, 1.813594, 1, 1, 1, 1, 1,
1.758737, -0.4439064, 1.490691, 1, 1, 1, 1, 1,
1.783841, -0.1473433, 2.90635, 0, 0, 1, 1, 1,
1.791578, 0.6803751, -0.1171867, 1, 0, 0, 1, 1,
1.807446, -0.1906147, 2.209635, 1, 0, 0, 1, 1,
1.807879, 0.2183416, 1.538969, 1, 0, 0, 1, 1,
1.809242, -0.3899493, 1.210392, 1, 0, 0, 1, 1,
1.810339, -0.2482641, 0.1600146, 1, 0, 0, 1, 1,
1.835187, 1.167207, 1.496021, 0, 0, 0, 1, 1,
1.837355, 0.304005, 1.846639, 0, 0, 0, 1, 1,
1.839532, 0.005122053, 2.254802, 0, 0, 0, 1, 1,
1.850769, 0.7412791, 2.783789, 0, 0, 0, 1, 1,
1.861484, -0.1706188, 0.8340885, 0, 0, 0, 1, 1,
1.89015, 1.680418, 0.4372878, 0, 0, 0, 1, 1,
1.898744, -0.4140194, 0.9895859, 0, 0, 0, 1, 1,
1.912163, 0.5800853, 2.305241, 1, 1, 1, 1, 1,
1.919092, 1.194398, 0.5028687, 1, 1, 1, 1, 1,
1.92232, -0.3355027, 3.462384, 1, 1, 1, 1, 1,
1.939328, -1.289491, 2.073124, 1, 1, 1, 1, 1,
1.949853, -1.837325, 4.066306, 1, 1, 1, 1, 1,
1.962865, 0.0570268, 0.2478482, 1, 1, 1, 1, 1,
1.970245, 1.613987, 1.187758, 1, 1, 1, 1, 1,
1.986137, -1.312035, 1.273191, 1, 1, 1, 1, 1,
1.998378, 0.02607024, 0.09730653, 1, 1, 1, 1, 1,
2.011974, -1.990027, 1.981499, 1, 1, 1, 1, 1,
2.017445, 0.1848156, 1.06767, 1, 1, 1, 1, 1,
2.026301, 0.5373131, -0.02900961, 1, 1, 1, 1, 1,
2.03889, -0.6165045, 3.121643, 1, 1, 1, 1, 1,
2.043768, 0.6545637, 2.579118, 1, 1, 1, 1, 1,
2.071304, -0.021822, 0.3531745, 1, 1, 1, 1, 1,
2.094556, 1.395624, 0.08351453, 0, 0, 1, 1, 1,
2.101269, 1.229071, 1.526595, 1, 0, 0, 1, 1,
2.105109, 0.9261065, -0.2091929, 1, 0, 0, 1, 1,
2.134921, 0.09487104, 0.5180267, 1, 0, 0, 1, 1,
2.168501, 0.1129264, 4.330734, 1, 0, 0, 1, 1,
2.169982, -1.296576, 2.062392, 1, 0, 0, 1, 1,
2.258611, -0.8349626, 3.11423, 0, 0, 0, 1, 1,
2.33012, 0.7330418, 0.8775243, 0, 0, 0, 1, 1,
2.334965, 0.1937231, 2.164666, 0, 0, 0, 1, 1,
2.406898, -0.8791263, 3.399157, 0, 0, 0, 1, 1,
2.414215, 0.3061467, 0.9491923, 0, 0, 0, 1, 1,
2.512373, 0.8177924, 1.788488, 0, 0, 0, 1, 1,
2.519321, 0.0499993, -0.2909044, 0, 0, 0, 1, 1,
2.554208, 0.08801962, 1.905167, 1, 1, 1, 1, 1,
2.594128, -0.09579166, 0.2444226, 1, 1, 1, 1, 1,
2.742443, 0.6663656, 1.489045, 1, 1, 1, 1, 1,
2.794957, 0.8033778, 1.705196, 1, 1, 1, 1, 1,
2.814318, -0.2332316, 3.60721, 1, 1, 1, 1, 1,
2.887637, -0.4542041, 2.384058, 1, 1, 1, 1, 1,
3.211654, -0.2839337, 1.47282, 1, 1, 1, 1, 1
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
var radius = 9.713854;
var distance = 34.1195;
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
mvMatrix.translate( -0.01484752, -0.1984582, -0.6133173 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.1195);
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
