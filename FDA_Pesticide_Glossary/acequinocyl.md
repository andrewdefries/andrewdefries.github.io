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
-3.18731, -1.597551, -0.6667317, 1, 0, 0, 1,
-2.81913, -0.5202665, -0.384021, 1, 0.007843138, 0, 1,
-2.543496, 0.3234813, -1.595954, 1, 0.01176471, 0, 1,
-2.517804, 0.4077673, -2.168011, 1, 0.01960784, 0, 1,
-2.471928, 0.837316, -1.0506, 1, 0.02352941, 0, 1,
-2.435521, -0.1507017, -2.377004, 1, 0.03137255, 0, 1,
-2.421838, -0.473711, -3.056584, 1, 0.03529412, 0, 1,
-2.405021, -1.101704, -0.3575886, 1, 0.04313726, 0, 1,
-2.366968, -0.1311991, -1.390479, 1, 0.04705882, 0, 1,
-2.363404, -1.206166, -0.8106216, 1, 0.05490196, 0, 1,
-2.321605, -0.10326, -3.671853, 1, 0.05882353, 0, 1,
-2.316374, -0.9754449, -1.765829, 1, 0.06666667, 0, 1,
-2.310194, -0.05199198, -2.626157, 1, 0.07058824, 0, 1,
-2.285366, -0.1553062, -2.75793, 1, 0.07843138, 0, 1,
-2.284674, -0.3731885, 0.01253829, 1, 0.08235294, 0, 1,
-2.267484, -1.007318, -2.325552, 1, 0.09019608, 0, 1,
-2.215055, -0.3212903, -2.251144, 1, 0.09411765, 0, 1,
-2.199569, 1.175155, 0.1489216, 1, 0.1019608, 0, 1,
-2.182666, 0.672951, -0.9366416, 1, 0.1098039, 0, 1,
-2.171319, 0.7221065, -2.299468, 1, 0.1137255, 0, 1,
-2.127422, 0.9840959, -1.602284, 1, 0.1215686, 0, 1,
-2.123713, -0.80258, -2.068847, 1, 0.1254902, 0, 1,
-2.098482, -0.3824071, -0.589394, 1, 0.1333333, 0, 1,
-2.085686, 0.4833706, -0.5029136, 1, 0.1372549, 0, 1,
-2.081247, -1.265379, -1.321761, 1, 0.145098, 0, 1,
-2.080997, -0.5486192, -2.02886, 1, 0.1490196, 0, 1,
-2.073003, -0.2812535, -1.806854, 1, 0.1568628, 0, 1,
-2.069534, 2.907538, -1.314961, 1, 0.1607843, 0, 1,
-2.052992, 1.282523, -1.243144, 1, 0.1686275, 0, 1,
-2.051985, 0.117095, -1.343764, 1, 0.172549, 0, 1,
-2.039793, -0.7673917, 0.5599325, 1, 0.1803922, 0, 1,
-2.032285, 0.843757, -2.152097, 1, 0.1843137, 0, 1,
-2.023612, 0.1378729, -0.05855417, 1, 0.1921569, 0, 1,
-1.974495, -0.7977532, -3.312589, 1, 0.1960784, 0, 1,
-1.926044, -2.155845, -4.174232, 1, 0.2039216, 0, 1,
-1.925441, 0.5796701, -2.448208, 1, 0.2117647, 0, 1,
-1.91318, 1.010311, -1.609054, 1, 0.2156863, 0, 1,
-1.905133, 1.276406, -0.1503193, 1, 0.2235294, 0, 1,
-1.891264, -1.040198, -3.595787, 1, 0.227451, 0, 1,
-1.882615, 0.7002772, -0.7932426, 1, 0.2352941, 0, 1,
-1.871699, -0.9259229, -3.234402, 1, 0.2392157, 0, 1,
-1.838333, -0.6335534, -0.8674778, 1, 0.2470588, 0, 1,
-1.829676, 0.4126987, -2.160629, 1, 0.2509804, 0, 1,
-1.826505, -0.802974, -1.913568, 1, 0.2588235, 0, 1,
-1.805777, -0.8678424, -1.841706, 1, 0.2627451, 0, 1,
-1.780823, 0.1788822, -1.177883, 1, 0.2705882, 0, 1,
-1.778125, 0.6769351, -1.113378, 1, 0.2745098, 0, 1,
-1.774492, -0.4578354, -2.308478, 1, 0.282353, 0, 1,
-1.771928, 0.3974784, -0.5868609, 1, 0.2862745, 0, 1,
-1.767717, 1.01195, -0.2073753, 1, 0.2941177, 0, 1,
-1.764787, -0.7569392, -0.992387, 1, 0.3019608, 0, 1,
-1.759858, 1.05531, -1.062865, 1, 0.3058824, 0, 1,
-1.759523, 0.01406582, -0.7265823, 1, 0.3137255, 0, 1,
-1.747618, -1.077075, -0.9708351, 1, 0.3176471, 0, 1,
-1.736905, 0.1849198, -1.753111, 1, 0.3254902, 0, 1,
-1.73596, 1.312364, -1.364583, 1, 0.3294118, 0, 1,
-1.732118, -0.06896664, -1.572142, 1, 0.3372549, 0, 1,
-1.725008, -1.700964, -2.172181, 1, 0.3411765, 0, 1,
-1.707115, -0.09898801, -2.238205, 1, 0.3490196, 0, 1,
-1.70037, -1.405195, -3.857502, 1, 0.3529412, 0, 1,
-1.691932, 0.3128837, -1.823894, 1, 0.3607843, 0, 1,
-1.685282, 0.4235275, -1.069607, 1, 0.3647059, 0, 1,
-1.684445, 0.685863, -1.329664, 1, 0.372549, 0, 1,
-1.672904, -0.09636324, -2.157526, 1, 0.3764706, 0, 1,
-1.670474, -0.4092586, -2.48368, 1, 0.3843137, 0, 1,
-1.655537, 0.3582746, -1.9688, 1, 0.3882353, 0, 1,
-1.642679, -1.019042, -1.393131, 1, 0.3960784, 0, 1,
-1.636108, 1.09299, 0.09339216, 1, 0.4039216, 0, 1,
-1.593161, -0.5613061, -1.388622, 1, 0.4078431, 0, 1,
-1.574044, 0.8262511, -0.1498397, 1, 0.4156863, 0, 1,
-1.572447, 1.073908, -2.071718, 1, 0.4196078, 0, 1,
-1.562021, -1.197275, -1.882842, 1, 0.427451, 0, 1,
-1.554964, 0.8946202, -2.156887, 1, 0.4313726, 0, 1,
-1.54379, 0.8183691, 0.3526192, 1, 0.4392157, 0, 1,
-1.541157, -0.5474896, -1.498189, 1, 0.4431373, 0, 1,
-1.535952, 0.8310192, -0.8062924, 1, 0.4509804, 0, 1,
-1.529602, 0.6613925, -2.914488, 1, 0.454902, 0, 1,
-1.520557, -0.4783314, -4.011366, 1, 0.4627451, 0, 1,
-1.508814, 0.09486838, -0.1820374, 1, 0.4666667, 0, 1,
-1.506948, 0.4386992, -1.560675, 1, 0.4745098, 0, 1,
-1.500491, 0.5236636, -0.279528, 1, 0.4784314, 0, 1,
-1.490007, 0.2690748, -1.149415, 1, 0.4862745, 0, 1,
-1.486279, 0.8833239, -1.358189, 1, 0.4901961, 0, 1,
-1.477043, 0.09731767, -0.07154989, 1, 0.4980392, 0, 1,
-1.469729, 0.615072, -0.552024, 1, 0.5058824, 0, 1,
-1.469065, -1.060238, -2.275679, 1, 0.509804, 0, 1,
-1.467396, 0.295, -2.990705, 1, 0.5176471, 0, 1,
-1.458837, 0.4292319, -1.652472, 1, 0.5215687, 0, 1,
-1.452497, -0.7693698, -3.873201, 1, 0.5294118, 0, 1,
-1.451765, 0.4536935, -0.534371, 1, 0.5333334, 0, 1,
-1.445679, -1.615057, -3.718011, 1, 0.5411765, 0, 1,
-1.440063, -0.001518034, -0.2711965, 1, 0.5450981, 0, 1,
-1.434069, -0.08830985, 0.4357106, 1, 0.5529412, 0, 1,
-1.428271, -0.4770458, -1.702213, 1, 0.5568628, 0, 1,
-1.426203, 1.278706, -0.6448185, 1, 0.5647059, 0, 1,
-1.423559, -0.3100391, -2.59543, 1, 0.5686275, 0, 1,
-1.414158, -0.5830044, -1.264592, 1, 0.5764706, 0, 1,
-1.374324, -1.46623, -2.729141, 1, 0.5803922, 0, 1,
-1.372457, -1.155543, -0.6245811, 1, 0.5882353, 0, 1,
-1.352646, 0.9336973, -1.645847, 1, 0.5921569, 0, 1,
-1.34981, 1.806371, -0.01980845, 1, 0.6, 0, 1,
-1.33839, -0.7460306, -1.12023, 1, 0.6078432, 0, 1,
-1.327297, 1.441645, -2.465388, 1, 0.6117647, 0, 1,
-1.305242, 0.4463658, -0.8281384, 1, 0.6196079, 0, 1,
-1.288532, -0.7173274, -1.141637, 1, 0.6235294, 0, 1,
-1.287101, -0.5086939, -0.7048373, 1, 0.6313726, 0, 1,
-1.281938, -0.5571958, -2.790588, 1, 0.6352941, 0, 1,
-1.280366, 0.4291611, 0.9563891, 1, 0.6431373, 0, 1,
-1.272134, 0.3795838, -0.1960994, 1, 0.6470588, 0, 1,
-1.271689, -0.8035365, -1.994807, 1, 0.654902, 0, 1,
-1.27028, 0.8388289, -3.104566, 1, 0.6588235, 0, 1,
-1.257765, 0.4865299, -1.749496, 1, 0.6666667, 0, 1,
-1.253963, 0.1110158, -1.134447, 1, 0.6705883, 0, 1,
-1.244485, 1.547059, 0.836106, 1, 0.6784314, 0, 1,
-1.240519, 0.05396572, -1.577107, 1, 0.682353, 0, 1,
-1.239112, -0.6430417, -1.360998, 1, 0.6901961, 0, 1,
-1.237125, 0.8713688, -0.5637494, 1, 0.6941177, 0, 1,
-1.233257, 0.5261896, -0.7083565, 1, 0.7019608, 0, 1,
-1.233228, -1.009608, -1.097826, 1, 0.7098039, 0, 1,
-1.232318, 0.3847515, -2.339989, 1, 0.7137255, 0, 1,
-1.2279, 0.673741, 0.4801711, 1, 0.7215686, 0, 1,
-1.227567, 1.886995, -0.3488897, 1, 0.7254902, 0, 1,
-1.216325, 0.03902541, -1.042839, 1, 0.7333333, 0, 1,
-1.210422, 0.1567826, -1.091846, 1, 0.7372549, 0, 1,
-1.20822, 1.942843, -1.522372, 1, 0.7450981, 0, 1,
-1.19862, 1.081785, 0.6730779, 1, 0.7490196, 0, 1,
-1.19065, 0.7681654, 1.037766, 1, 0.7568628, 0, 1,
-1.186729, 2.432667, -1.654553, 1, 0.7607843, 0, 1,
-1.184881, -0.4027765, -1.827907, 1, 0.7686275, 0, 1,
-1.183545, -0.7960401, -1.819503, 1, 0.772549, 0, 1,
-1.182509, -0.1603664, -2.099173, 1, 0.7803922, 0, 1,
-1.180956, -0.3216933, -0.2542853, 1, 0.7843137, 0, 1,
-1.174501, -0.6298277, -2.480594, 1, 0.7921569, 0, 1,
-1.173392, 0.2846405, -1.261841, 1, 0.7960784, 0, 1,
-1.165084, 1.662376, 0.1995803, 1, 0.8039216, 0, 1,
-1.163715, 0.7999038, -2.11887, 1, 0.8117647, 0, 1,
-1.156812, -0.3630029, -0.5135818, 1, 0.8156863, 0, 1,
-1.155744, -0.7179471, -3.346165, 1, 0.8235294, 0, 1,
-1.153267, -0.1298955, -1.611054, 1, 0.827451, 0, 1,
-1.15004, -0.05213745, -1.972409, 1, 0.8352941, 0, 1,
-1.14897, 0.7212487, -0.05736591, 1, 0.8392157, 0, 1,
-1.131516, 1.461331, -0.4304332, 1, 0.8470588, 0, 1,
-1.130616, -0.5977994, -1.892142, 1, 0.8509804, 0, 1,
-1.129272, -1.329006, -3.080575, 1, 0.8588235, 0, 1,
-1.125216, -0.5035668, -2.036845, 1, 0.8627451, 0, 1,
-1.122109, -0.01263177, -1.699614, 1, 0.8705882, 0, 1,
-1.118382, 0.08363979, -1.989938, 1, 0.8745098, 0, 1,
-1.107379, 0.6755318, -0.4551861, 1, 0.8823529, 0, 1,
-1.106323, 0.002331856, -3.218434, 1, 0.8862745, 0, 1,
-1.095272, -1.87818, -2.214299, 1, 0.8941177, 0, 1,
-1.088762, 1.206076, -0.6877883, 1, 0.8980392, 0, 1,
-1.088641, -0.1835977, -3.143463, 1, 0.9058824, 0, 1,
-1.087153, -0.4682093, -2.293387, 1, 0.9137255, 0, 1,
-1.081328, 0.007008771, -0.9870707, 1, 0.9176471, 0, 1,
-1.075561, 0.840139, -0.3047004, 1, 0.9254902, 0, 1,
-1.064505, -0.565623, -1.998913, 1, 0.9294118, 0, 1,
-1.052674, -0.3236297, -1.910075, 1, 0.9372549, 0, 1,
-1.043859, -0.2556603, -1.085367, 1, 0.9411765, 0, 1,
-1.043133, 1.042335, -0.16473, 1, 0.9490196, 0, 1,
-1.042846, -0.09378947, -1.996873, 1, 0.9529412, 0, 1,
-1.040422, 1.185353, -1.288242, 1, 0.9607843, 0, 1,
-1.037565, -0.1229209, -1.789669, 1, 0.9647059, 0, 1,
-1.035523, -0.1749826, -0.835605, 1, 0.972549, 0, 1,
-1.031337, 2.835244, 0.2712318, 1, 0.9764706, 0, 1,
-1.026124, 0.1342146, -1.098579, 1, 0.9843137, 0, 1,
-1.022637, -0.3088393, -0.7427863, 1, 0.9882353, 0, 1,
-1.019833, 0.09697019, -0.9944137, 1, 0.9960784, 0, 1,
-1.000538, -1.223448, -3.238443, 0.9960784, 1, 0, 1,
-0.9874957, 0.4195233, -2.095315, 0.9921569, 1, 0, 1,
-0.9811687, 0.693935, 0.1399093, 0.9843137, 1, 0, 1,
-0.9742471, -1.03806, -1.604473, 0.9803922, 1, 0, 1,
-0.9707502, 0.06421612, -1.994925, 0.972549, 1, 0, 1,
-0.9701569, 0.2970163, -1.7426, 0.9686275, 1, 0, 1,
-0.9701431, -1.910032, -1.22913, 0.9607843, 1, 0, 1,
-0.969977, -0.6611654, -0.7183321, 0.9568627, 1, 0, 1,
-0.9687763, 2.531533, -0.1564667, 0.9490196, 1, 0, 1,
-0.9653396, 1.081348, 0.2508605, 0.945098, 1, 0, 1,
-0.947898, -0.2059115, -2.011768, 0.9372549, 1, 0, 1,
-0.9464688, -0.6487417, -2.723866, 0.9333333, 1, 0, 1,
-0.9368038, -0.6487989, -2.845631, 0.9254902, 1, 0, 1,
-0.936615, 1.782593, -0.9790096, 0.9215686, 1, 0, 1,
-0.9365349, 0.04958066, -1.629705, 0.9137255, 1, 0, 1,
-0.9359559, 0.1729183, -0.9248475, 0.9098039, 1, 0, 1,
-0.9346107, -0.497613, -3.537427, 0.9019608, 1, 0, 1,
-0.9283176, -0.4112859, 0.767388, 0.8941177, 1, 0, 1,
-0.9278188, 0.6488285, -0.9088755, 0.8901961, 1, 0, 1,
-0.9268814, -0.7335202, -4.185722, 0.8823529, 1, 0, 1,
-0.9264677, -0.009885537, -1.903467, 0.8784314, 1, 0, 1,
-0.9263107, -0.1235486, 0.05575411, 0.8705882, 1, 0, 1,
-0.9226669, -1.389848, -1.161737, 0.8666667, 1, 0, 1,
-0.9111867, 0.2675735, -0.2666925, 0.8588235, 1, 0, 1,
-0.9097302, 0.1488484, -3.003258, 0.854902, 1, 0, 1,
-0.9094186, 1.434945, 1.428659, 0.8470588, 1, 0, 1,
-0.9049354, -0.572463, -0.3776698, 0.8431373, 1, 0, 1,
-0.9009768, 0.19284, -0.8197496, 0.8352941, 1, 0, 1,
-0.8984764, 0.6806251, 0.6180827, 0.8313726, 1, 0, 1,
-0.8957879, 0.5375843, -2.912174, 0.8235294, 1, 0, 1,
-0.8915768, -0.4590768, -1.17271, 0.8196079, 1, 0, 1,
-0.8837805, -0.5927887, -1.767477, 0.8117647, 1, 0, 1,
-0.8670024, -0.9525416, -2.560663, 0.8078431, 1, 0, 1,
-0.866636, 0.6568514, -2.36165, 0.8, 1, 0, 1,
-0.8565692, -0.7997352, -0.5914874, 0.7921569, 1, 0, 1,
-0.85609, -3.285902, -2.354451, 0.7882353, 1, 0, 1,
-0.8504828, 0.678125, -0.5244898, 0.7803922, 1, 0, 1,
-0.8472927, 0.0389586, -1.63682, 0.7764706, 1, 0, 1,
-0.8415322, -1.22871, -1.72316, 0.7686275, 1, 0, 1,
-0.8415127, -0.9936497, -3.308854, 0.7647059, 1, 0, 1,
-0.840588, 1.121885, 0.9127768, 0.7568628, 1, 0, 1,
-0.8394176, -0.0364141, -3.072304, 0.7529412, 1, 0, 1,
-0.8390799, 0.7804926, 0.4411004, 0.7450981, 1, 0, 1,
-0.8390362, 0.9347394, -0.5407861, 0.7411765, 1, 0, 1,
-0.8341772, 0.7854967, -1.249772, 0.7333333, 1, 0, 1,
-0.8282417, 0.2971469, -1.641012, 0.7294118, 1, 0, 1,
-0.8201904, 0.5478004, -2.166096, 0.7215686, 1, 0, 1,
-0.8176268, -1.751393, -2.679542, 0.7176471, 1, 0, 1,
-0.8162612, 0.04789983, 0.2425627, 0.7098039, 1, 0, 1,
-0.813992, -0.2572993, -2.372573, 0.7058824, 1, 0, 1,
-0.8087786, -0.02413387, -1.129533, 0.6980392, 1, 0, 1,
-0.7950187, -2.523565, -2.544901, 0.6901961, 1, 0, 1,
-0.7948914, -0.6295103, -2.139714, 0.6862745, 1, 0, 1,
-0.7947994, -1.096635, -0.5012938, 0.6784314, 1, 0, 1,
-0.7908159, 1.470883, -2.103084, 0.6745098, 1, 0, 1,
-0.7828751, 2.274861, -1.073757, 0.6666667, 1, 0, 1,
-0.7715689, -1.356486, -1.725868, 0.6627451, 1, 0, 1,
-0.7708024, 1.178296, -0.8987771, 0.654902, 1, 0, 1,
-0.7679263, 1.088574, -2.384327, 0.6509804, 1, 0, 1,
-0.7659605, -2.63487, -3.151231, 0.6431373, 1, 0, 1,
-0.7600453, -0.3245734, -0.4247344, 0.6392157, 1, 0, 1,
-0.7529585, 0.8051652, -0.1936394, 0.6313726, 1, 0, 1,
-0.7518621, -0.7369543, -2.519743, 0.627451, 1, 0, 1,
-0.7505829, 0.2559212, -0.5763034, 0.6196079, 1, 0, 1,
-0.7455708, -0.9045966, -1.853243, 0.6156863, 1, 0, 1,
-0.7455087, -0.9333487, -1.990523, 0.6078432, 1, 0, 1,
-0.7422977, 0.3635119, -1.735747, 0.6039216, 1, 0, 1,
-0.7408975, -0.3709694, -2.785023, 0.5960785, 1, 0, 1,
-0.7404717, 2.314802, -0.1021133, 0.5882353, 1, 0, 1,
-0.7403063, -0.09621405, -2.781137, 0.5843138, 1, 0, 1,
-0.7393507, -1.075772, -2.393118, 0.5764706, 1, 0, 1,
-0.7388535, 0.2973459, -0.5653958, 0.572549, 1, 0, 1,
-0.7346799, -1.483217, -0.7291802, 0.5647059, 1, 0, 1,
-0.7344013, -0.2441877, -1.457303, 0.5607843, 1, 0, 1,
-0.733626, 1.408672, -1.709342, 0.5529412, 1, 0, 1,
-0.7293742, 1.360265, -1.955061, 0.5490196, 1, 0, 1,
-0.7232242, -1.159341, -2.603541, 0.5411765, 1, 0, 1,
-0.7145618, -0.6822534, -1.527071, 0.5372549, 1, 0, 1,
-0.7032516, 0.4341868, -2.765099, 0.5294118, 1, 0, 1,
-0.6987578, 0.1710293, -1.121556, 0.5254902, 1, 0, 1,
-0.6986175, 0.1882807, -3.27277, 0.5176471, 1, 0, 1,
-0.6959267, 2.297145, 0.5411261, 0.5137255, 1, 0, 1,
-0.6945165, 0.15566, 0.2998261, 0.5058824, 1, 0, 1,
-0.6887982, -2.318227, -1.158092, 0.5019608, 1, 0, 1,
-0.6878411, 0.3968083, -2.143734, 0.4941176, 1, 0, 1,
-0.6857538, 1.951623, -0.4559059, 0.4862745, 1, 0, 1,
-0.6848952, 0.1765103, -0.4689161, 0.4823529, 1, 0, 1,
-0.6837341, -0.1780208, -1.728914, 0.4745098, 1, 0, 1,
-0.6808171, -0.1817706, -1.442993, 0.4705882, 1, 0, 1,
-0.6772215, -0.3727933, -2.050365, 0.4627451, 1, 0, 1,
-0.6692051, -0.9875947, -1.688619, 0.4588235, 1, 0, 1,
-0.6682079, 0.2992261, -1.375325, 0.4509804, 1, 0, 1,
-0.6660361, -1.589342, -2.124643, 0.4470588, 1, 0, 1,
-0.6652095, -0.7372559, -3.021013, 0.4392157, 1, 0, 1,
-0.6651143, -0.5185581, 0.1271172, 0.4352941, 1, 0, 1,
-0.6614715, 0.04317473, -1.928052, 0.427451, 1, 0, 1,
-0.6576086, 1.776491, 0.172609, 0.4235294, 1, 0, 1,
-0.6566441, -0.9027897, -3.540245, 0.4156863, 1, 0, 1,
-0.6555755, -0.9489381, -3.501211, 0.4117647, 1, 0, 1,
-0.6555055, 1.498619, 1.105603, 0.4039216, 1, 0, 1,
-0.6513036, -0.7281544, -2.151695, 0.3960784, 1, 0, 1,
-0.6477257, 0.353599, -1.587353, 0.3921569, 1, 0, 1,
-0.6466659, -0.6090018, -2.516112, 0.3843137, 1, 0, 1,
-0.646331, -0.07614345, -0.8527964, 0.3803922, 1, 0, 1,
-0.6399221, -0.3097687, -2.026435, 0.372549, 1, 0, 1,
-0.6391802, 1.391321, -0.6023145, 0.3686275, 1, 0, 1,
-0.6385528, -1.125486, -2.024757, 0.3607843, 1, 0, 1,
-0.6370195, -0.2068045, -1.507736, 0.3568628, 1, 0, 1,
-0.6351736, 0.8272715, 0.7836484, 0.3490196, 1, 0, 1,
-0.6350542, -0.7481605, -1.518643, 0.345098, 1, 0, 1,
-0.6311389, 0.3425784, -2.212917, 0.3372549, 1, 0, 1,
-0.6303984, -1.565181, -2.748501, 0.3333333, 1, 0, 1,
-0.6280803, -0.9088915, -0.8747702, 0.3254902, 1, 0, 1,
-0.6276519, 0.03096052, -1.368324, 0.3215686, 1, 0, 1,
-0.6267714, -0.4120363, -2.054502, 0.3137255, 1, 0, 1,
-0.6246675, -0.2801549, -3.633214, 0.3098039, 1, 0, 1,
-0.6183077, -0.1184004, -2.306031, 0.3019608, 1, 0, 1,
-0.6144766, -1.584098, -2.378072, 0.2941177, 1, 0, 1,
-0.6102087, -0.112515, -1.429718, 0.2901961, 1, 0, 1,
-0.6091748, -0.6898956, -0.9155024, 0.282353, 1, 0, 1,
-0.6082878, -0.6080174, -1.22087, 0.2784314, 1, 0, 1,
-0.6026847, -0.9262465, -4.317614, 0.2705882, 1, 0, 1,
-0.5995109, 0.2681396, -2.660016, 0.2666667, 1, 0, 1,
-0.5969627, 1.940555, 0.2851231, 0.2588235, 1, 0, 1,
-0.5968835, 0.5908849, -0.889148, 0.254902, 1, 0, 1,
-0.596045, -0.692564, -1.445769, 0.2470588, 1, 0, 1,
-0.5882168, -1.163321, -5.553262, 0.2431373, 1, 0, 1,
-0.5860216, -0.4115662, -1.908766, 0.2352941, 1, 0, 1,
-0.576081, -0.7045057, -1.915827, 0.2313726, 1, 0, 1,
-0.5697255, 0.391054, -2.876004, 0.2235294, 1, 0, 1,
-0.5689134, 0.6799203, -2.322814, 0.2196078, 1, 0, 1,
-0.568424, -0.4600239, -2.717805, 0.2117647, 1, 0, 1,
-0.5610715, 1.481546, 1.183861, 0.2078431, 1, 0, 1,
-0.5607132, -0.3785866, -2.927749, 0.2, 1, 0, 1,
-0.558483, -0.48617, -1.711954, 0.1921569, 1, 0, 1,
-0.5566645, 0.02144505, -0.9246213, 0.1882353, 1, 0, 1,
-0.5536125, 0.8293446, -0.453786, 0.1803922, 1, 0, 1,
-0.5535223, -0.8366408, -1.614771, 0.1764706, 1, 0, 1,
-0.5514824, -0.5583091, -3.557398, 0.1686275, 1, 0, 1,
-0.5502822, -0.7064113, -3.23769, 0.1647059, 1, 0, 1,
-0.5476243, 0.4982288, -1.764517, 0.1568628, 1, 0, 1,
-0.5465335, 0.07689551, -0.3623078, 0.1529412, 1, 0, 1,
-0.5457728, 3.240907, -1.316323, 0.145098, 1, 0, 1,
-0.5438889, -1.475365, -3.945387, 0.1411765, 1, 0, 1,
-0.5431076, 0.4744123, -3.386259, 0.1333333, 1, 0, 1,
-0.5404227, 0.7880957, -1.526201, 0.1294118, 1, 0, 1,
-0.5398012, 0.9955162, -1.792998, 0.1215686, 1, 0, 1,
-0.5388661, -1.272099, -1.710253, 0.1176471, 1, 0, 1,
-0.5372975, 0.9156005, -1.35644, 0.1098039, 1, 0, 1,
-0.5358161, -0.3442408, -1.771419, 0.1058824, 1, 0, 1,
-0.5342575, 0.9431664, -1.686847, 0.09803922, 1, 0, 1,
-0.5331498, -1.708373, -2.727136, 0.09019608, 1, 0, 1,
-0.5314257, -0.9226828, -4.465963, 0.08627451, 1, 0, 1,
-0.5259424, -2.094164, -3.805308, 0.07843138, 1, 0, 1,
-0.520873, -0.4138706, -0.6813719, 0.07450981, 1, 0, 1,
-0.5202926, -0.3517473, -3.281366, 0.06666667, 1, 0, 1,
-0.5182412, -0.5629295, -2.855854, 0.0627451, 1, 0, 1,
-0.5173142, -0.7085841, -3.679284, 0.05490196, 1, 0, 1,
-0.5173072, -0.3257836, -2.16132, 0.05098039, 1, 0, 1,
-0.515137, -1.769726, -3.566006, 0.04313726, 1, 0, 1,
-0.5151325, -0.3917131, -3.180554, 0.03921569, 1, 0, 1,
-0.5142419, -1.650487, -3.821148, 0.03137255, 1, 0, 1,
-0.5125252, 0.2149345, -1.94265, 0.02745098, 1, 0, 1,
-0.5124268, -0.1837588, -0.9451938, 0.01960784, 1, 0, 1,
-0.5065266, -0.8433487, -2.004205, 0.01568628, 1, 0, 1,
-0.505586, -0.4805926, -1.224022, 0.007843138, 1, 0, 1,
-0.5051489, -0.5401722, -3.200131, 0.003921569, 1, 0, 1,
-0.5011051, 0.7947723, 1.607114, 0, 1, 0.003921569, 1,
-0.5005227, -0.505605, -2.952272, 0, 1, 0.01176471, 1,
-0.4985248, 0.646789, -0.7058206, 0, 1, 0.01568628, 1,
-0.4968561, 1.87981, -0.9489903, 0, 1, 0.02352941, 1,
-0.4954366, 0.4288989, -0.8599822, 0, 1, 0.02745098, 1,
-0.4934553, 0.2809241, 0.3013789, 0, 1, 0.03529412, 1,
-0.4925259, 2.641351, 0.2368577, 0, 1, 0.03921569, 1,
-0.4924967, -0.6648717, -4.316822, 0, 1, 0.04705882, 1,
-0.4906899, -0.778482, -3.958108, 0, 1, 0.05098039, 1,
-0.4726819, -2.078012, -3.665845, 0, 1, 0.05882353, 1,
-0.4725851, 0.5057493, -1.618814, 0, 1, 0.0627451, 1,
-0.4657209, 0.1282773, -1.819355, 0, 1, 0.07058824, 1,
-0.4607317, -0.6615934, -3.076795, 0, 1, 0.07450981, 1,
-0.4540353, 0.1866346, -1.126544, 0, 1, 0.08235294, 1,
-0.4518515, 1.182404, -1.197159, 0, 1, 0.08627451, 1,
-0.4516722, -0.05070724, -0.4346372, 0, 1, 0.09411765, 1,
-0.4488624, -0.8158618, -2.159969, 0, 1, 0.1019608, 1,
-0.4446451, 0.5875372, 0.5139825, 0, 1, 0.1058824, 1,
-0.4386245, 0.4980013, 1.146816, 0, 1, 0.1137255, 1,
-0.4376218, 0.8835959, -0.5126711, 0, 1, 0.1176471, 1,
-0.4332374, 1.434464, -1.357461, 0, 1, 0.1254902, 1,
-0.4247161, 0.3296726, -0.7554307, 0, 1, 0.1294118, 1,
-0.4245164, 1.092821, 1.111688, 0, 1, 0.1372549, 1,
-0.4241352, -0.0485896, -0.1510227, 0, 1, 0.1411765, 1,
-0.4220845, -0.5156956, -0.07376302, 0, 1, 0.1490196, 1,
-0.42148, -0.8156655, -1.831051, 0, 1, 0.1529412, 1,
-0.4202723, -0.5603213, -2.686645, 0, 1, 0.1607843, 1,
-0.4166807, -0.1576771, -2.393694, 0, 1, 0.1647059, 1,
-0.4160478, 1.071498, 1.114092, 0, 1, 0.172549, 1,
-0.4033549, -0.5118834, -2.515707, 0, 1, 0.1764706, 1,
-0.3945903, 0.3449403, -1.23301, 0, 1, 0.1843137, 1,
-0.3890918, 0.804621, -0.5665926, 0, 1, 0.1882353, 1,
-0.3889802, -1.332044, -2.52992, 0, 1, 0.1960784, 1,
-0.3885361, 0.07490387, -2.454389, 0, 1, 0.2039216, 1,
-0.3779628, -1.488676, -2.969241, 0, 1, 0.2078431, 1,
-0.3752908, -0.5301481, -2.448997, 0, 1, 0.2156863, 1,
-0.3701849, 2.179952, 0.9688408, 0, 1, 0.2196078, 1,
-0.3696201, 0.06589138, 0.4298383, 0, 1, 0.227451, 1,
-0.3681746, 2.126686, -1.179156, 0, 1, 0.2313726, 1,
-0.3681356, 1.152824, -1.459799, 0, 1, 0.2392157, 1,
-0.3653701, -2.234321, -3.726921, 0, 1, 0.2431373, 1,
-0.3607563, -0.1323885, -1.702734, 0, 1, 0.2509804, 1,
-0.3565309, 0.4748706, -0.2280335, 0, 1, 0.254902, 1,
-0.3545211, 0.7377674, -0.3502043, 0, 1, 0.2627451, 1,
-0.3533005, -0.6593111, -2.202698, 0, 1, 0.2666667, 1,
-0.3469469, -0.4009331, -1.122768, 0, 1, 0.2745098, 1,
-0.3466162, -1.309314, -2.945765, 0, 1, 0.2784314, 1,
-0.3437424, -0.7701433, -1.4641, 0, 1, 0.2862745, 1,
-0.3420662, 0.7251266, -1.490055, 0, 1, 0.2901961, 1,
-0.3413197, -0.2522738, -1.779251, 0, 1, 0.2980392, 1,
-0.3325345, 0.5367143, 0.251404, 0, 1, 0.3058824, 1,
-0.3310021, -1.118237, -0.8412546, 0, 1, 0.3098039, 1,
-0.3288414, -2.264887, -3.16507, 0, 1, 0.3176471, 1,
-0.3281481, 0.1766449, -2.427973, 0, 1, 0.3215686, 1,
-0.3263785, 0.3070785, -2.707027, 0, 1, 0.3294118, 1,
-0.3230613, -0.2723665, -2.228046, 0, 1, 0.3333333, 1,
-0.321842, 0.04122316, 0.09504534, 0, 1, 0.3411765, 1,
-0.3212383, 0.4238184, 0.5051223, 0, 1, 0.345098, 1,
-0.3202198, 0.6857738, 0.2070719, 0, 1, 0.3529412, 1,
-0.3191009, 0.4154661, -1.427867, 0, 1, 0.3568628, 1,
-0.3178991, 1.699687, 1.51943, 0, 1, 0.3647059, 1,
-0.3083473, 0.9553257, -0.4114986, 0, 1, 0.3686275, 1,
-0.3079202, -0.2996008, 0.4132127, 0, 1, 0.3764706, 1,
-0.3004584, 0.3866262, -0.3720608, 0, 1, 0.3803922, 1,
-0.299237, -1.860847, -2.56811, 0, 1, 0.3882353, 1,
-0.2972726, -0.2466199, -2.174441, 0, 1, 0.3921569, 1,
-0.2967668, -0.7246926, -2.78578, 0, 1, 0.4, 1,
-0.2941878, -0.06659356, -2.198787, 0, 1, 0.4078431, 1,
-0.2837984, -0.9809833, -4.026217, 0, 1, 0.4117647, 1,
-0.2826166, -1.319762, -2.775675, 0, 1, 0.4196078, 1,
-0.2809793, 1.5565, -1.50776, 0, 1, 0.4235294, 1,
-0.280636, -0.1766954, -0.9687304, 0, 1, 0.4313726, 1,
-0.2785895, -0.6986156, -2.860998, 0, 1, 0.4352941, 1,
-0.2756965, -0.5464983, -2.77005, 0, 1, 0.4431373, 1,
-0.2755886, 0.5174737, -1.774121, 0, 1, 0.4470588, 1,
-0.2736841, -0.1365571, -2.087783, 0, 1, 0.454902, 1,
-0.2728328, -2.00464, -2.002491, 0, 1, 0.4588235, 1,
-0.272109, -2.037061, -2.95663, 0, 1, 0.4666667, 1,
-0.2689246, -0.5183703, -2.950845, 0, 1, 0.4705882, 1,
-0.2682399, 1.854898, -0.182, 0, 1, 0.4784314, 1,
-0.2675702, 1.254561, 1.176708, 0, 1, 0.4823529, 1,
-0.2664503, 1.786333, 0.7100497, 0, 1, 0.4901961, 1,
-0.2612559, 0.5423083, 0.4061467, 0, 1, 0.4941176, 1,
-0.2604474, -0.5281819, -3.038813, 0, 1, 0.5019608, 1,
-0.2578297, -0.1929386, -1.313192, 0, 1, 0.509804, 1,
-0.2571741, -0.727297, -0.7737594, 0, 1, 0.5137255, 1,
-0.2543595, 0.5134806, -0.3352312, 0, 1, 0.5215687, 1,
-0.2424998, 0.2843835, 1.319264, 0, 1, 0.5254902, 1,
-0.2402984, 0.2934496, -0.589038, 0, 1, 0.5333334, 1,
-0.240003, -0.3651997, -2.236247, 0, 1, 0.5372549, 1,
-0.2390596, -0.7325242, -3.23659, 0, 1, 0.5450981, 1,
-0.23841, 0.6546884, -2.008284, 0, 1, 0.5490196, 1,
-0.2377736, -0.7757925, -2.495014, 0, 1, 0.5568628, 1,
-0.2262185, 0.1579913, -1.884639, 0, 1, 0.5607843, 1,
-0.2237898, 0.6887068, 1.278582, 0, 1, 0.5686275, 1,
-0.2237661, -1.669872, -0.7846456, 0, 1, 0.572549, 1,
-0.2179943, 0.4131625, 0.4906543, 0, 1, 0.5803922, 1,
-0.2114759, -0.8569598, -4.550539, 0, 1, 0.5843138, 1,
-0.2098329, -0.4815677, -2.113277, 0, 1, 0.5921569, 1,
-0.1967028, 0.5196853, 1.113048, 0, 1, 0.5960785, 1,
-0.1948877, 1.232685, -0.2509991, 0, 1, 0.6039216, 1,
-0.1829674, -0.3463886, -3.482047, 0, 1, 0.6117647, 1,
-0.1821219, -0.4744143, -2.975131, 0, 1, 0.6156863, 1,
-0.1779608, 0.9186566, -0.6542336, 0, 1, 0.6235294, 1,
-0.1709081, 0.5003989, -0.06103899, 0, 1, 0.627451, 1,
-0.1693033, -0.6603981, -3.068254, 0, 1, 0.6352941, 1,
-0.1659202, 0.0252525, -2.998264, 0, 1, 0.6392157, 1,
-0.164227, 0.02343026, -3.291913, 0, 1, 0.6470588, 1,
-0.1625555, -2.265555, -4.004382, 0, 1, 0.6509804, 1,
-0.1563811, 0.6711829, 0.5227544, 0, 1, 0.6588235, 1,
-0.1481993, 0.3133602, 1.010582, 0, 1, 0.6627451, 1,
-0.1481011, 0.1239361, 1.570967, 0, 1, 0.6705883, 1,
-0.1452408, 1.083254, -1.171447, 0, 1, 0.6745098, 1,
-0.1311295, -0.7613458, -5.083735, 0, 1, 0.682353, 1,
-0.1300327, 0.5430254, 0.2798682, 0, 1, 0.6862745, 1,
-0.1261996, 1.851145, 1.697656, 0, 1, 0.6941177, 1,
-0.1237003, 2.224847, 0.2513328, 0, 1, 0.7019608, 1,
-0.1236368, -0.1719803, -1.631868, 0, 1, 0.7058824, 1,
-0.1163949, 1.385537, -1.039048, 0, 1, 0.7137255, 1,
-0.1141243, -0.6344689, -1.649413, 0, 1, 0.7176471, 1,
-0.1130088, 0.3572944, -0.0708781, 0, 1, 0.7254902, 1,
-0.1122232, 0.7777489, -0.06644887, 0, 1, 0.7294118, 1,
-0.1116092, -0.4594322, -4.358915, 0, 1, 0.7372549, 1,
-0.1058043, 0.6637024, 0.8325012, 0, 1, 0.7411765, 1,
-0.1030978, 0.2616921, 0.6949356, 0, 1, 0.7490196, 1,
-0.09929436, 1.375151, 1.229752, 0, 1, 0.7529412, 1,
-0.0975406, 0.7712164, 0.8320612, 0, 1, 0.7607843, 1,
-0.08365793, 0.5754876, 0.6395196, 0, 1, 0.7647059, 1,
-0.0789832, -0.4430989, -4.577516, 0, 1, 0.772549, 1,
-0.07834578, -0.8831754, -1.071962, 0, 1, 0.7764706, 1,
-0.07114083, -1.191067, -2.186711, 0, 1, 0.7843137, 1,
-0.06768695, 0.8435392, -1.175017, 0, 1, 0.7882353, 1,
-0.06709061, 2.274974, -0.5580383, 0, 1, 0.7960784, 1,
-0.06589341, 1.827382, -0.4919269, 0, 1, 0.8039216, 1,
-0.05826791, 0.7129705, -1.94805, 0, 1, 0.8078431, 1,
-0.05798404, -0.6268655, -2.44679, 0, 1, 0.8156863, 1,
-0.0550723, 0.8901801, -1.311507, 0, 1, 0.8196079, 1,
-0.05082809, -0.7288922, -1.154439, 0, 1, 0.827451, 1,
-0.0503445, -0.02001889, -0.6941307, 0, 1, 0.8313726, 1,
-0.05023046, -0.2489433, -3.771875, 0, 1, 0.8392157, 1,
-0.04809546, 2.361725, -0.9893349, 0, 1, 0.8431373, 1,
-0.04748357, -0.1006584, -1.762339, 0, 1, 0.8509804, 1,
-0.04719592, -0.707705, -2.255948, 0, 1, 0.854902, 1,
-0.04562577, 0.3522742, -0.2225378, 0, 1, 0.8627451, 1,
-0.04369187, 0.9233539, -0.827539, 0, 1, 0.8666667, 1,
-0.04253856, -0.1941371, -2.723937, 0, 1, 0.8745098, 1,
-0.0409234, -1.094836, -2.331927, 0, 1, 0.8784314, 1,
-0.03594903, 0.2469229, 0.1356362, 0, 1, 0.8862745, 1,
-0.03383488, 1.280344, -0.2516033, 0, 1, 0.8901961, 1,
-0.03313069, -0.2775985, -3.019055, 0, 1, 0.8980392, 1,
-0.02974609, -0.2261801, -2.066583, 0, 1, 0.9058824, 1,
-0.02828634, 0.1824535, 0.04216276, 0, 1, 0.9098039, 1,
-0.02737154, -1.362694, -3.894145, 0, 1, 0.9176471, 1,
-0.02415522, 1.420994, -0.8398845, 0, 1, 0.9215686, 1,
-0.02308973, 0.6505401, -0.3833119, 0, 1, 0.9294118, 1,
-0.02260046, 2.166917, -0.1626083, 0, 1, 0.9333333, 1,
-0.02013539, -0.1823229, -3.111586, 0, 1, 0.9411765, 1,
-0.0187441, -0.00180831, -0.7656941, 0, 1, 0.945098, 1,
-0.01839088, -0.5015246, -2.657989, 0, 1, 0.9529412, 1,
-0.01332659, 0.4986553, -0.7845599, 0, 1, 0.9568627, 1,
-0.0119645, -0.728173, -4.525375, 0, 1, 0.9647059, 1,
-0.00808027, 0.03797706, 0.7549884, 0, 1, 0.9686275, 1,
-0.007128946, -1.722427, -3.733552, 0, 1, 0.9764706, 1,
0.0008125203, -1.030759, 1.911725, 0, 1, 0.9803922, 1,
0.002409309, 0.8992171, 0.09938577, 0, 1, 0.9882353, 1,
0.003520672, 0.6068389, -0.6628453, 0, 1, 0.9921569, 1,
0.004732558, -0.07356241, 2.178157, 0, 1, 1, 1,
0.007286297, -0.5182997, 2.102284, 0, 0.9921569, 1, 1,
0.01245735, 0.6613184, 0.5090176, 0, 0.9882353, 1, 1,
0.01688036, -0.8480165, 3.395494, 0, 0.9803922, 1, 1,
0.01692678, -0.7175785, 2.370335, 0, 0.9764706, 1, 1,
0.01779135, -2.336422, 3.384045, 0, 0.9686275, 1, 1,
0.01946372, -1.231615, 2.781103, 0, 0.9647059, 1, 1,
0.02255701, -0.1604006, 2.462833, 0, 0.9568627, 1, 1,
0.02258782, -0.4707784, 1.300907, 0, 0.9529412, 1, 1,
0.02354571, -0.8846253, 3.432731, 0, 0.945098, 1, 1,
0.02702389, 0.9243948, 0.6544049, 0, 0.9411765, 1, 1,
0.03086205, -1.987219, 3.62104, 0, 0.9333333, 1, 1,
0.0466015, 0.5859821, -1.465194, 0, 0.9294118, 1, 1,
0.04829389, -1.315424, 3.373247, 0, 0.9215686, 1, 1,
0.04922672, 1.044801, -0.4047438, 0, 0.9176471, 1, 1,
0.04941723, -0.1980866, 2.141657, 0, 0.9098039, 1, 1,
0.04953001, -0.1073286, 3.105303, 0, 0.9058824, 1, 1,
0.05015369, 0.8182624, -1.136934, 0, 0.8980392, 1, 1,
0.05068558, 0.06927493, 1.029282, 0, 0.8901961, 1, 1,
0.05302573, -2.34302, 1.743634, 0, 0.8862745, 1, 1,
0.05408012, 0.2021077, 0.3558303, 0, 0.8784314, 1, 1,
0.05452216, -0.8297815, 2.08167, 0, 0.8745098, 1, 1,
0.06236695, 0.1636364, 1.07325, 0, 0.8666667, 1, 1,
0.06290543, 0.6147388, -0.6419388, 0, 0.8627451, 1, 1,
0.0633545, 0.1195392, 2.504506, 0, 0.854902, 1, 1,
0.06443451, 0.2663082, 1.216467, 0, 0.8509804, 1, 1,
0.06704578, -0.2858357, 4.664539, 0, 0.8431373, 1, 1,
0.06891477, 0.9486517, 1.209527, 0, 0.8392157, 1, 1,
0.07478102, 0.1338542, 1.723157, 0, 0.8313726, 1, 1,
0.07797109, -0.1691776, 4.451644, 0, 0.827451, 1, 1,
0.07797587, -0.6560253, 1.812989, 0, 0.8196079, 1, 1,
0.07882673, 1.204794, -0.2323262, 0, 0.8156863, 1, 1,
0.08211023, -0.8361416, 2.497375, 0, 0.8078431, 1, 1,
0.08265205, -0.6467329, 5.060461, 0, 0.8039216, 1, 1,
0.08314794, -0.9567264, 2.237151, 0, 0.7960784, 1, 1,
0.08596934, 0.4247868, 0.8268038, 0, 0.7882353, 1, 1,
0.08679728, -0.002312997, 0.8917393, 0, 0.7843137, 1, 1,
0.08696254, -0.2259916, 2.656874, 0, 0.7764706, 1, 1,
0.0907725, -0.7127774, 4.03783, 0, 0.772549, 1, 1,
0.09817629, -0.8261074, 2.596527, 0, 0.7647059, 1, 1,
0.09843612, 0.472743, -1.209836, 0, 0.7607843, 1, 1,
0.09931584, -1.086659, 3.543361, 0, 0.7529412, 1, 1,
0.1015191, 1.730862, -0.03789118, 0, 0.7490196, 1, 1,
0.1045357, -1.127775, 2.985122, 0, 0.7411765, 1, 1,
0.104696, 0.03184274, -0.8299322, 0, 0.7372549, 1, 1,
0.1058822, -0.1604403, 3.278223, 0, 0.7294118, 1, 1,
0.111566, 1.342014, 1.984968, 0, 0.7254902, 1, 1,
0.1158713, -0.5602664, 2.540045, 0, 0.7176471, 1, 1,
0.1161959, -0.01285915, 0.4712049, 0, 0.7137255, 1, 1,
0.1163833, -0.8675348, 4.376555, 0, 0.7058824, 1, 1,
0.116729, 0.5515182, -1.347899, 0, 0.6980392, 1, 1,
0.1171153, -0.1522142, 4.5729, 0, 0.6941177, 1, 1,
0.1194429, -0.2341362, 2.189558, 0, 0.6862745, 1, 1,
0.1220298, -0.1964013, 3.884915, 0, 0.682353, 1, 1,
0.1221371, 0.4378534, 0.7163795, 0, 0.6745098, 1, 1,
0.1236811, -0.510035, 2.413177, 0, 0.6705883, 1, 1,
0.1237296, 1.75053, 0.934058, 0, 0.6627451, 1, 1,
0.1266731, 0.5543358, 1.624311, 0, 0.6588235, 1, 1,
0.1287748, -0.1516228, 2.454065, 0, 0.6509804, 1, 1,
0.1289555, 0.5559802, 0.02258554, 0, 0.6470588, 1, 1,
0.1324307, -0.4533214, 2.726205, 0, 0.6392157, 1, 1,
0.1325732, 0.198633, 0.2333341, 0, 0.6352941, 1, 1,
0.1338081, 0.1339003, 2.206511, 0, 0.627451, 1, 1,
0.1343117, -2.294712, 3.167981, 0, 0.6235294, 1, 1,
0.1347717, 0.3907667, 0.4593075, 0, 0.6156863, 1, 1,
0.1382159, 0.4405861, 0.8517543, 0, 0.6117647, 1, 1,
0.1385741, 0.2354388, 0.8576649, 0, 0.6039216, 1, 1,
0.1389944, 0.5316645, 0.6363916, 0, 0.5960785, 1, 1,
0.1416425, -0.6853724, 3.071362, 0, 0.5921569, 1, 1,
0.1426635, -0.179336, 0.6364484, 0, 0.5843138, 1, 1,
0.148009, -0.6150067, 1.648402, 0, 0.5803922, 1, 1,
0.148599, -0.803335, 3.36045, 0, 0.572549, 1, 1,
0.1498595, 0.134882, -1.18472, 0, 0.5686275, 1, 1,
0.1543844, -0.4001262, 4.24143, 0, 0.5607843, 1, 1,
0.1558834, 0.1310275, 0.08992424, 0, 0.5568628, 1, 1,
0.1581319, 1.749616, -0.338471, 0, 0.5490196, 1, 1,
0.1637797, -0.4996511, 3.71953, 0, 0.5450981, 1, 1,
0.166088, 1.167017, 1.370144, 0, 0.5372549, 1, 1,
0.1662833, 0.9837362, -0.09334195, 0, 0.5333334, 1, 1,
0.1694691, 0.6461827, -1.749833, 0, 0.5254902, 1, 1,
0.1724559, 2.178435, -1.456593, 0, 0.5215687, 1, 1,
0.1763502, 0.8592625, 0.07167963, 0, 0.5137255, 1, 1,
0.1856502, -0.344889, 1.995886, 0, 0.509804, 1, 1,
0.186543, -0.1821605, 2.661327, 0, 0.5019608, 1, 1,
0.1870777, -0.8875791, 2.943636, 0, 0.4941176, 1, 1,
0.1872937, -0.821771, 4.361387, 0, 0.4901961, 1, 1,
0.1961175, -0.4734817, 3.349067, 0, 0.4823529, 1, 1,
0.1976006, 0.9210599, 0.6762352, 0, 0.4784314, 1, 1,
0.2024858, -0.9139597, 4.168211, 0, 0.4705882, 1, 1,
0.2075486, -0.7756314, 3.194623, 0, 0.4666667, 1, 1,
0.2101255, -1.486072, 4.165629, 0, 0.4588235, 1, 1,
0.2112292, -0.1399477, 0.7900503, 0, 0.454902, 1, 1,
0.2137529, -0.4827129, 2.299769, 0, 0.4470588, 1, 1,
0.2162585, 0.2468439, 1.253686, 0, 0.4431373, 1, 1,
0.2163453, 0.2846405, 0.7274693, 0, 0.4352941, 1, 1,
0.220714, 1.773339, 1.157227, 0, 0.4313726, 1, 1,
0.2276073, -1.657041, 3.733077, 0, 0.4235294, 1, 1,
0.2278126, 0.105976, 1.82388, 0, 0.4196078, 1, 1,
0.2316981, -0.4928965, 3.56825, 0, 0.4117647, 1, 1,
0.2326579, 0.5552114, 0.170296, 0, 0.4078431, 1, 1,
0.2368449, 0.1251561, -0.2114922, 0, 0.4, 1, 1,
0.2382904, -1.519854, 1.163673, 0, 0.3921569, 1, 1,
0.2392689, -1.11059, 2.229692, 0, 0.3882353, 1, 1,
0.2430779, -1.984955, 4.299794, 0, 0.3803922, 1, 1,
0.2453195, 1.925013, -0.3980009, 0, 0.3764706, 1, 1,
0.2495562, 0.04527946, 1.294345, 0, 0.3686275, 1, 1,
0.2567735, -0.6928189, 2.935373, 0, 0.3647059, 1, 1,
0.2623523, 0.8776733, 1.172523, 0, 0.3568628, 1, 1,
0.2625613, 0.7063437, 1.592171, 0, 0.3529412, 1, 1,
0.266757, -1.180806, 1.967207, 0, 0.345098, 1, 1,
0.2712435, -0.2860776, 2.049081, 0, 0.3411765, 1, 1,
0.2843593, -0.7108475, 5.156879, 0, 0.3333333, 1, 1,
0.2856409, 0.3566003, 1.944693, 0, 0.3294118, 1, 1,
0.2866536, 2.007797, 1.205482, 0, 0.3215686, 1, 1,
0.291151, 1.034487, 0.6119522, 0, 0.3176471, 1, 1,
0.2924253, -2.186585, 3.661438, 0, 0.3098039, 1, 1,
0.2925241, -0.1144171, 2.590956, 0, 0.3058824, 1, 1,
0.2928547, 0.4030021, 0.5635554, 0, 0.2980392, 1, 1,
0.2993049, 1.662241, 0.1882745, 0, 0.2901961, 1, 1,
0.3032236, -0.5594581, 2.680806, 0, 0.2862745, 1, 1,
0.3056858, -1.190329, 2.154115, 0, 0.2784314, 1, 1,
0.314047, -0.1605919, 2.908293, 0, 0.2745098, 1, 1,
0.3153296, -1.453837, 1.529984, 0, 0.2666667, 1, 1,
0.317513, 0.3097855, 1.109862, 0, 0.2627451, 1, 1,
0.3205385, 0.0001861711, -0.1357057, 0, 0.254902, 1, 1,
0.340584, 0.518208, 1.311686, 0, 0.2509804, 1, 1,
0.3468505, 0.1259793, 1.466337, 0, 0.2431373, 1, 1,
0.3472352, -0.7220752, 2.819903, 0, 0.2392157, 1, 1,
0.3474698, -0.4386826, 2.780814, 0, 0.2313726, 1, 1,
0.3504152, -0.475333, 2.704401, 0, 0.227451, 1, 1,
0.3541462, -1.473901, 3.74084, 0, 0.2196078, 1, 1,
0.3625712, -0.4062003, 1.749635, 0, 0.2156863, 1, 1,
0.3629939, -1.60347, 2.445431, 0, 0.2078431, 1, 1,
0.3654773, -0.3499187, 1.774887, 0, 0.2039216, 1, 1,
0.3666504, -0.8697293, 4.502406, 0, 0.1960784, 1, 1,
0.3676469, 0.3829261, 1.139472, 0, 0.1882353, 1, 1,
0.3684233, -1.798265, 3.400164, 0, 0.1843137, 1, 1,
0.3715647, -0.1152134, 1.335945, 0, 0.1764706, 1, 1,
0.3768685, -0.06178237, 2.897871, 0, 0.172549, 1, 1,
0.3796532, -0.9827535, 3.478842, 0, 0.1647059, 1, 1,
0.3808539, -0.176168, 0.9536523, 0, 0.1607843, 1, 1,
0.3823071, -1.280105, 1.893905, 0, 0.1529412, 1, 1,
0.3833747, 0.9278398, 0.354167, 0, 0.1490196, 1, 1,
0.38495, 1.212711, 1.020376, 0, 0.1411765, 1, 1,
0.3850022, -0.1782231, 4.272029, 0, 0.1372549, 1, 1,
0.3853586, 1.108856, 0.7060735, 0, 0.1294118, 1, 1,
0.3857493, 0.3629358, 0.1444345, 0, 0.1254902, 1, 1,
0.3875206, 0.1057243, 0.9569732, 0, 0.1176471, 1, 1,
0.3946629, -1.302615, 2.694328, 0, 0.1137255, 1, 1,
0.4041685, -0.9297789, 1.087219, 0, 0.1058824, 1, 1,
0.4130536, -0.980012, 2.297056, 0, 0.09803922, 1, 1,
0.4132926, 0.846365, 0.9126841, 0, 0.09411765, 1, 1,
0.4247973, -0.09370002, 1.346519, 0, 0.08627451, 1, 1,
0.4343034, -0.01641998, 2.076673, 0, 0.08235294, 1, 1,
0.4426989, -1.171144, 3.580933, 0, 0.07450981, 1, 1,
0.4454611, -1.368198, 2.046462, 0, 0.07058824, 1, 1,
0.4455481, 0.3459912, 0.9641162, 0, 0.0627451, 1, 1,
0.4457034, -0.1967933, 1.734532, 0, 0.05882353, 1, 1,
0.4462839, 1.584366, 0.5372041, 0, 0.05098039, 1, 1,
0.448256, 0.09668826, 2.505109, 0, 0.04705882, 1, 1,
0.4502034, -0.01287945, 1.50006, 0, 0.03921569, 1, 1,
0.4536758, -1.131937, 2.880046, 0, 0.03529412, 1, 1,
0.4554885, -0.3144155, 2.065231, 0, 0.02745098, 1, 1,
0.4556563, -0.8141349, 2.000978, 0, 0.02352941, 1, 1,
0.4565187, -0.1876741, -0.4027582, 0, 0.01568628, 1, 1,
0.4601152, 1.618429, -0.6956767, 0, 0.01176471, 1, 1,
0.4607685, 1.348722, 1.145132, 0, 0.003921569, 1, 1,
0.4637389, -0.2546719, 1.772136, 0.003921569, 0, 1, 1,
0.4665788, 0.7491556, 1.758288, 0.007843138, 0, 1, 1,
0.4667971, -0.6931823, 3.376714, 0.01568628, 0, 1, 1,
0.4684421, -0.3512923, 1.80666, 0.01960784, 0, 1, 1,
0.4705545, 1.915211, -0.2290637, 0.02745098, 0, 1, 1,
0.4721908, -1.139439, 1.353422, 0.03137255, 0, 1, 1,
0.4751867, 1.232107, 0.7152944, 0.03921569, 0, 1, 1,
0.4752516, -0.5231722, 4.069839, 0.04313726, 0, 1, 1,
0.4766852, -0.6476448, 2.535198, 0.05098039, 0, 1, 1,
0.4784798, 0.6089376, 0.06658591, 0.05490196, 0, 1, 1,
0.4852855, 0.1846289, 0.9682665, 0.0627451, 0, 1, 1,
0.4869428, -1.708931, 2.20043, 0.06666667, 0, 1, 1,
0.4895768, -1.525151, 1.587297, 0.07450981, 0, 1, 1,
0.489967, 0.25466, 2.248043, 0.07843138, 0, 1, 1,
0.4903073, 1.487599, 1.032937, 0.08627451, 0, 1, 1,
0.4972632, -0.6497886, 3.590726, 0.09019608, 0, 1, 1,
0.5019905, -1.73585, 2.77145, 0.09803922, 0, 1, 1,
0.5040516, 1.330849, 0.6939884, 0.1058824, 0, 1, 1,
0.5104927, -0.7177804, 4.951504, 0.1098039, 0, 1, 1,
0.5121779, 1.726559, 0.4648909, 0.1176471, 0, 1, 1,
0.5260761, -0.02155922, 1.103756, 0.1215686, 0, 1, 1,
0.5294939, 1.99695, -0.2868261, 0.1294118, 0, 1, 1,
0.5305896, 0.0291116, 2.339929, 0.1333333, 0, 1, 1,
0.5319167, -0.006575779, 3.025182, 0.1411765, 0, 1, 1,
0.5326722, 0.2002736, -0.1975516, 0.145098, 0, 1, 1,
0.532724, -0.5275987, 3.857903, 0.1529412, 0, 1, 1,
0.5361488, 0.3002459, 1.420978, 0.1568628, 0, 1, 1,
0.5386625, -1.146302, 2.834081, 0.1647059, 0, 1, 1,
0.5392588, 0.8448781, 0.4486029, 0.1686275, 0, 1, 1,
0.5402842, 0.006633384, 2.685115, 0.1764706, 0, 1, 1,
0.541908, -0.4741571, 3.343143, 0.1803922, 0, 1, 1,
0.5424734, 0.3366973, 0.8381314, 0.1882353, 0, 1, 1,
0.5432386, 0.9124203, 0.3327487, 0.1921569, 0, 1, 1,
0.5489674, -0.2969525, 2.547764, 0.2, 0, 1, 1,
0.5546276, 1.261525, -0.08811523, 0.2078431, 0, 1, 1,
0.5549262, 1.326286, 1.730916, 0.2117647, 0, 1, 1,
0.5559431, 0.05345461, 1.09037, 0.2196078, 0, 1, 1,
0.5564257, 0.1009913, 1.611736, 0.2235294, 0, 1, 1,
0.5608773, -0.7048864, 3.534388, 0.2313726, 0, 1, 1,
0.56618, 1.428519, 2.05576, 0.2352941, 0, 1, 1,
0.5665482, 0.1033528, -0.1823345, 0.2431373, 0, 1, 1,
0.5701528, 0.4715984, -0.1787794, 0.2470588, 0, 1, 1,
0.5702572, 0.2945851, 0.2910709, 0.254902, 0, 1, 1,
0.5810567, -0.2423255, 1.030311, 0.2588235, 0, 1, 1,
0.5820664, -0.2548649, 1.392227, 0.2666667, 0, 1, 1,
0.5826881, 0.2118692, 1.715369, 0.2705882, 0, 1, 1,
0.5855154, 0.8437515, -0.6985529, 0.2784314, 0, 1, 1,
0.5857159, -0.4522365, 1.546343, 0.282353, 0, 1, 1,
0.5879967, 0.1123959, 3.074202, 0.2901961, 0, 1, 1,
0.5891791, -1.376379, 1.957923, 0.2941177, 0, 1, 1,
0.591071, -0.2755597, 0.9224011, 0.3019608, 0, 1, 1,
0.5916211, 2.398711, -0.8326058, 0.3098039, 0, 1, 1,
0.5918812, -0.7891842, 3.770746, 0.3137255, 0, 1, 1,
0.5931323, 1.620168, 0.7990586, 0.3215686, 0, 1, 1,
0.5935787, 1.529173, -0.1824931, 0.3254902, 0, 1, 1,
0.5939352, -0.3292661, 2.257368, 0.3333333, 0, 1, 1,
0.6009552, 0.5563483, -0.6397492, 0.3372549, 0, 1, 1,
0.6045794, 0.6179669, 0.7913519, 0.345098, 0, 1, 1,
0.6069517, 0.6136668, -0.1866666, 0.3490196, 0, 1, 1,
0.6070387, -1.036925, 3.869068, 0.3568628, 0, 1, 1,
0.6148159, -1.515459, 1.68736, 0.3607843, 0, 1, 1,
0.6157703, -0.5462162, 3.410863, 0.3686275, 0, 1, 1,
0.6158183, -1.296833, 1.051798, 0.372549, 0, 1, 1,
0.61806, -0.8814539, 1.705783, 0.3803922, 0, 1, 1,
0.6183078, 1.506435, -1.051722, 0.3843137, 0, 1, 1,
0.6234277, 0.06408344, -1.05697, 0.3921569, 0, 1, 1,
0.6260349, -0.2934965, 1.70127, 0.3960784, 0, 1, 1,
0.6260715, 0.6970002, 0.3013631, 0.4039216, 0, 1, 1,
0.6267831, 0.7980459, 1.40413, 0.4117647, 0, 1, 1,
0.6273592, 0.2170071, 1.222912, 0.4156863, 0, 1, 1,
0.6416976, 1.152962, 0.03344551, 0.4235294, 0, 1, 1,
0.6439447, 0.9823986, -0.01335373, 0.427451, 0, 1, 1,
0.6464746, 0.3251175, -0.1178112, 0.4352941, 0, 1, 1,
0.6470016, 0.9144427, -0.7604916, 0.4392157, 0, 1, 1,
0.6522316, 1.655651, 0.7089937, 0.4470588, 0, 1, 1,
0.6595218, 1.320488, -0.4906686, 0.4509804, 0, 1, 1,
0.6651909, 0.4483611, -0.3248647, 0.4588235, 0, 1, 1,
0.6666176, -1.129463, 3.327768, 0.4627451, 0, 1, 1,
0.6672346, 0.2041253, 1.695873, 0.4705882, 0, 1, 1,
0.6674512, -0.8226891, 2.057219, 0.4745098, 0, 1, 1,
0.6763635, 0.7783229, -0.02487915, 0.4823529, 0, 1, 1,
0.6778647, -0.2000113, 0.4494492, 0.4862745, 0, 1, 1,
0.6839422, 0.4716699, 1.841742, 0.4941176, 0, 1, 1,
0.684626, 2.164241, -0.5734861, 0.5019608, 0, 1, 1,
0.6886746, 0.9197752, 1.199546, 0.5058824, 0, 1, 1,
0.6886804, -0.9229721, 2.609128, 0.5137255, 0, 1, 1,
0.6889592, -0.5265746, 2.42535, 0.5176471, 0, 1, 1,
0.6895577, -1.253609, 3.719774, 0.5254902, 0, 1, 1,
0.6898525, 1.137166, 0.9445681, 0.5294118, 0, 1, 1,
0.696047, -0.8696957, 4.306694, 0.5372549, 0, 1, 1,
0.7001494, -0.7238174, 4.255371, 0.5411765, 0, 1, 1,
0.7030305, 0.5223316, 1.298217, 0.5490196, 0, 1, 1,
0.7057872, -0.6733486, 1.956972, 0.5529412, 0, 1, 1,
0.7106308, -0.3479156, 3.556257, 0.5607843, 0, 1, 1,
0.7132422, 0.3271116, 0.9597853, 0.5647059, 0, 1, 1,
0.7134017, 1.076415, -0.7799214, 0.572549, 0, 1, 1,
0.7225274, -0.169111, 2.570988, 0.5764706, 0, 1, 1,
0.7261317, 1.94778, -1.406021, 0.5843138, 0, 1, 1,
0.7434123, 0.4546623, 0.4831949, 0.5882353, 0, 1, 1,
0.7447843, 1.065063, -0.5465927, 0.5960785, 0, 1, 1,
0.7462462, 0.9193562, 0.620517, 0.6039216, 0, 1, 1,
0.7506639, 0.7031929, 0.3623902, 0.6078432, 0, 1, 1,
0.7548529, -1.546128, 3.173068, 0.6156863, 0, 1, 1,
0.7548694, 0.6144908, 2.583036, 0.6196079, 0, 1, 1,
0.7665001, 0.6634546, 1.520981, 0.627451, 0, 1, 1,
0.7670093, -1.618262, 2.296355, 0.6313726, 0, 1, 1,
0.7691952, -0.2835391, 3.145344, 0.6392157, 0, 1, 1,
0.7720165, -0.08904683, 2.835397, 0.6431373, 0, 1, 1,
0.7762945, -1.646464, 2.239508, 0.6509804, 0, 1, 1,
0.7775086, 0.2400467, 1.575086, 0.654902, 0, 1, 1,
0.7801247, 0.2106624, 1.382224, 0.6627451, 0, 1, 1,
0.7846788, -0.9984736, 4.748586, 0.6666667, 0, 1, 1,
0.7855687, 0.7647776, -1.428588, 0.6745098, 0, 1, 1,
0.7889385, 0.07843988, 1.709842, 0.6784314, 0, 1, 1,
0.789052, 1.451928, -0.90865, 0.6862745, 0, 1, 1,
0.7963113, 1.679181, 0.1968695, 0.6901961, 0, 1, 1,
0.7995904, 0.405004, -0.03565845, 0.6980392, 0, 1, 1,
0.8029147, 0.1554715, 2.656598, 0.7058824, 0, 1, 1,
0.8061599, -0.2152191, 0.7897094, 0.7098039, 0, 1, 1,
0.8073428, 0.4553623, -0.2862448, 0.7176471, 0, 1, 1,
0.8085536, 0.810256, 1.759515, 0.7215686, 0, 1, 1,
0.8117392, -0.9329625, 1.504804, 0.7294118, 0, 1, 1,
0.8175365, 1.082568, -0.2330341, 0.7333333, 0, 1, 1,
0.8228677, 1.344468, 0.5465297, 0.7411765, 0, 1, 1,
0.8252649, -0.2751927, 3.269162, 0.7450981, 0, 1, 1,
0.8262981, 0.3551604, 0.1310973, 0.7529412, 0, 1, 1,
0.8284587, 0.6542213, 1.597634, 0.7568628, 0, 1, 1,
0.831558, -0.1119417, 2.670404, 0.7647059, 0, 1, 1,
0.8316249, 0.4887222, 2.088495, 0.7686275, 0, 1, 1,
0.8386087, -0.0251384, 1.993997, 0.7764706, 0, 1, 1,
0.8459622, -1.23022, 3.913164, 0.7803922, 0, 1, 1,
0.8553412, -3.202916, 2.582315, 0.7882353, 0, 1, 1,
0.8562791, -0.3816786, 2.779813, 0.7921569, 0, 1, 1,
0.8576146, 1.060255, -0.3426031, 0.8, 0, 1, 1,
0.8626923, 0.09026681, 2.760641, 0.8078431, 0, 1, 1,
0.8631999, 0.9852341, 0.9599336, 0.8117647, 0, 1, 1,
0.8676199, -0.7200465, 3.054572, 0.8196079, 0, 1, 1,
0.8694011, -3.154546, 2.574675, 0.8235294, 0, 1, 1,
0.8700272, -0.5826289, 2.641752, 0.8313726, 0, 1, 1,
0.8735364, -0.03126058, 0.2976221, 0.8352941, 0, 1, 1,
0.8794588, -0.06903565, 3.145834, 0.8431373, 0, 1, 1,
0.8795866, 0.7444, 0.236695, 0.8470588, 0, 1, 1,
0.8932148, -0.2843059, 1.537115, 0.854902, 0, 1, 1,
0.8945236, -1.317876, 1.822034, 0.8588235, 0, 1, 1,
0.8987271, -1.201109, 0.6161221, 0.8666667, 0, 1, 1,
0.9021946, 0.7846908, -0.7352546, 0.8705882, 0, 1, 1,
0.9038939, -0.5321761, 1.527073, 0.8784314, 0, 1, 1,
0.9056649, -0.4625109, 2.171816, 0.8823529, 0, 1, 1,
0.9141759, -2.068881, 3.128831, 0.8901961, 0, 1, 1,
0.9153082, -0.7175094, 3.844156, 0.8941177, 0, 1, 1,
0.9160531, 0.03161351, 3.44023, 0.9019608, 0, 1, 1,
0.9176366, 1.140524, 1.121735, 0.9098039, 0, 1, 1,
0.9178988, -0.3752373, 2.719858, 0.9137255, 0, 1, 1,
0.918677, 0.159808, 0.8597012, 0.9215686, 0, 1, 1,
0.9187703, -1.50339, 2.818483, 0.9254902, 0, 1, 1,
0.9192613, 1.756771, 1.629216, 0.9333333, 0, 1, 1,
0.9204153, -0.9712937, 2.788768, 0.9372549, 0, 1, 1,
0.9214071, 0.05552015, 0.06432881, 0.945098, 0, 1, 1,
0.9240272, -1.783185, 0.910477, 0.9490196, 0, 1, 1,
0.9241152, -0.91495, 2.105676, 0.9568627, 0, 1, 1,
0.9307422, -0.4248295, 3.684734, 0.9607843, 0, 1, 1,
0.9394343, -0.2028645, 1.510385, 0.9686275, 0, 1, 1,
0.9440444, -0.5050237, 1.105703, 0.972549, 0, 1, 1,
0.9549571, -0.1383796, 0.5322115, 0.9803922, 0, 1, 1,
0.9586373, -1.547865, 3.724423, 0.9843137, 0, 1, 1,
0.9613741, -0.06597115, 1.977656, 0.9921569, 0, 1, 1,
0.9619386, -0.8799822, 2.836328, 0.9960784, 0, 1, 1,
0.96314, 0.4072743, 0.1990696, 1, 0, 0.9960784, 1,
0.9670855, -1.627747, 1.38557, 1, 0, 0.9882353, 1,
0.9725376, -0.603866, 1.570387, 1, 0, 0.9843137, 1,
0.9806305, -0.55812, 1.668631, 1, 0, 0.9764706, 1,
0.9810255, 0.7150565, -0.7318106, 1, 0, 0.972549, 1,
0.9874601, -1.141051, 2.180871, 1, 0, 0.9647059, 1,
0.9903536, 0.6599735, 2.026419, 1, 0, 0.9607843, 1,
1.001006, -1.128893, 2.754075, 1, 0, 0.9529412, 1,
1.003002, 0.01253107, 1.286012, 1, 0, 0.9490196, 1,
1.006477, 0.3800551, 1.866784, 1, 0, 0.9411765, 1,
1.007535, -0.3063795, 1.114618, 1, 0, 0.9372549, 1,
1.014908, -0.1878657, 0.8491219, 1, 0, 0.9294118, 1,
1.024217, 1.123755, 1.969982, 1, 0, 0.9254902, 1,
1.027636, -1.032721, 0.590251, 1, 0, 0.9176471, 1,
1.028125, 1.104502, 1.468045, 1, 0, 0.9137255, 1,
1.028761, -1.164857, 3.796101, 1, 0, 0.9058824, 1,
1.030328, -1.607674, 2.390906, 1, 0, 0.9019608, 1,
1.037584, 1.741006, -0.6024278, 1, 0, 0.8941177, 1,
1.03774, 1.302435, 1.32134, 1, 0, 0.8862745, 1,
1.049434, -1.611977, 3.411775, 1, 0, 0.8823529, 1,
1.05111, 0.1538777, 2.246682, 1, 0, 0.8745098, 1,
1.053721, -0.5408002, 2.819653, 1, 0, 0.8705882, 1,
1.058455, 0.838319, 0.5556545, 1, 0, 0.8627451, 1,
1.061458, 1.802025, 2.359281, 1, 0, 0.8588235, 1,
1.067377, 0.7098075, 0.4723371, 1, 0, 0.8509804, 1,
1.067502, 0.4621113, 2.817041, 1, 0, 0.8470588, 1,
1.067983, -1.436058, 1.194387, 1, 0, 0.8392157, 1,
1.069349, -0.3955471, 2.510803, 1, 0, 0.8352941, 1,
1.080512, -0.2311339, 4.166646, 1, 0, 0.827451, 1,
1.085391, -0.2367267, 2.451925, 1, 0, 0.8235294, 1,
1.087284, 1.111494, 0.6704065, 1, 0, 0.8156863, 1,
1.088415, -1.660058, 3.584337, 1, 0, 0.8117647, 1,
1.103185, -1.149877, 3.222166, 1, 0, 0.8039216, 1,
1.103265, -0.3309401, 1.510415, 1, 0, 0.7960784, 1,
1.120187, 1.825354, 0.4629605, 1, 0, 0.7921569, 1,
1.123678, -1.098861, 2.268298, 1, 0, 0.7843137, 1,
1.123797, 0.5267505, 1.757503, 1, 0, 0.7803922, 1,
1.127321, -0.08803448, 2.357283, 1, 0, 0.772549, 1,
1.131816, -0.3074368, 1.24008, 1, 0, 0.7686275, 1,
1.137645, -0.5380722, 3.390854, 1, 0, 0.7607843, 1,
1.140014, -0.7553802, 2.16792, 1, 0, 0.7568628, 1,
1.150769, 0.5109961, -0.05606014, 1, 0, 0.7490196, 1,
1.158208, 0.8986738, 1.509812, 1, 0, 0.7450981, 1,
1.164149, 0.3465272, 0.9805405, 1, 0, 0.7372549, 1,
1.175573, 0.7230045, 0.2072024, 1, 0, 0.7333333, 1,
1.179155, 0.589976, -0.2695302, 1, 0, 0.7254902, 1,
1.213211, -1.803329, 1.941241, 1, 0, 0.7215686, 1,
1.2177, -0.9428366, 3.504914, 1, 0, 0.7137255, 1,
1.218794, 0.35379, 0.4585131, 1, 0, 0.7098039, 1,
1.227428, 0.695397, 2.333394, 1, 0, 0.7019608, 1,
1.232212, 0.5923665, 1.747928, 1, 0, 0.6941177, 1,
1.23583, -2.429492, 1.248292, 1, 0, 0.6901961, 1,
1.256329, 0.1766345, 2.227326, 1, 0, 0.682353, 1,
1.257137, 0.3103833, 1.192623, 1, 0, 0.6784314, 1,
1.257451, -1.267936, 1.515494, 1, 0, 0.6705883, 1,
1.258279, -2.028641, 2.932833, 1, 0, 0.6666667, 1,
1.261966, -0.5682448, 2.299136, 1, 0, 0.6588235, 1,
1.264132, 0.7835314, 0.1034126, 1, 0, 0.654902, 1,
1.265966, -0.4336072, 1.690511, 1, 0, 0.6470588, 1,
1.266339, 1.144888, 1.521444, 1, 0, 0.6431373, 1,
1.272508, -0.356097, 2.421652, 1, 0, 0.6352941, 1,
1.276247, 0.3470757, 1.708204, 1, 0, 0.6313726, 1,
1.277469, 1.364025, 1.74141, 1, 0, 0.6235294, 1,
1.284225, 0.9212874, 0.8209133, 1, 0, 0.6196079, 1,
1.288627, -0.8208128, 3.327328, 1, 0, 0.6117647, 1,
1.291458, 0.5506244, -0.9552538, 1, 0, 0.6078432, 1,
1.300312, -1.065673, 3.1036, 1, 0, 0.6, 1,
1.313938, -0.4780412, 1.234885, 1, 0, 0.5921569, 1,
1.316346, 0.3358354, 2.498912, 1, 0, 0.5882353, 1,
1.327783, 0.7950609, 2.175718, 1, 0, 0.5803922, 1,
1.332834, -0.5288311, 2.108243, 1, 0, 0.5764706, 1,
1.354654, -0.1402423, 2.666658, 1, 0, 0.5686275, 1,
1.360865, -0.06479014, -0.9954137, 1, 0, 0.5647059, 1,
1.363619, -1.950137, 0.942337, 1, 0, 0.5568628, 1,
1.364798, -1.134147, 4.116105, 1, 0, 0.5529412, 1,
1.373646, -1.170913, 2.296556, 1, 0, 0.5450981, 1,
1.375061, 0.08672312, 2.15513, 1, 0, 0.5411765, 1,
1.392312, -1.933288, 1.755434, 1, 0, 0.5333334, 1,
1.39371, -1.435604, 4.001826, 1, 0, 0.5294118, 1,
1.399107, 0.03232944, 1.895462, 1, 0, 0.5215687, 1,
1.4002, 0.6289241, 0.4283593, 1, 0, 0.5176471, 1,
1.404189, -0.5933309, 3.261978, 1, 0, 0.509804, 1,
1.432756, -1.17857, 0.6375887, 1, 0, 0.5058824, 1,
1.434006, -0.05763582, 2.880366, 1, 0, 0.4980392, 1,
1.440371, 0.7807511, -0.06150524, 1, 0, 0.4901961, 1,
1.441042, -0.8966441, 3.040404, 1, 0, 0.4862745, 1,
1.441777, 2.083705, -0.09720597, 1, 0, 0.4784314, 1,
1.444098, 0.6101698, 1.630157, 1, 0, 0.4745098, 1,
1.445764, -0.1481617, 1.489011, 1, 0, 0.4666667, 1,
1.464202, 1.072181, 2.449571, 1, 0, 0.4627451, 1,
1.473836, 0.3140937, 0.5072336, 1, 0, 0.454902, 1,
1.474582, 1.226018, -0.02059094, 1, 0, 0.4509804, 1,
1.475193, -0.8573721, 3.036116, 1, 0, 0.4431373, 1,
1.496867, 1.359317, 0.4438296, 1, 0, 0.4392157, 1,
1.502873, -0.009438191, 0.7162117, 1, 0, 0.4313726, 1,
1.507896, 0.2182468, 1.907624, 1, 0, 0.427451, 1,
1.519156, -0.4857421, 2.277343, 1, 0, 0.4196078, 1,
1.5215, 0.8289933, 2.143306, 1, 0, 0.4156863, 1,
1.523571, -0.07740983, 1.614869, 1, 0, 0.4078431, 1,
1.529986, -1.327259, 2.971347, 1, 0, 0.4039216, 1,
1.538758, 1.259759, 0.1340279, 1, 0, 0.3960784, 1,
1.540407, -0.7938726, 1.929292, 1, 0, 0.3882353, 1,
1.541458, 0.2437368, 1.050594, 1, 0, 0.3843137, 1,
1.551343, -0.1253729, 1.096447, 1, 0, 0.3764706, 1,
1.556198, -0.201739, 1.603038, 1, 0, 0.372549, 1,
1.566611, -0.6593556, 0.758386, 1, 0, 0.3647059, 1,
1.569103, 0.5490482, 0.6939132, 1, 0, 0.3607843, 1,
1.573652, -2.304561, 1.453528, 1, 0, 0.3529412, 1,
1.574003, 0.7270862, 1.144603, 1, 0, 0.3490196, 1,
1.5804, 1.156865, 0.7004142, 1, 0, 0.3411765, 1,
1.584648, -0.4559541, 1.583531, 1, 0, 0.3372549, 1,
1.586639, -0.4094508, 1.820082, 1, 0, 0.3294118, 1,
1.605317, -1.168079, 2.087853, 1, 0, 0.3254902, 1,
1.613518, 0.6720548, 4.009033, 1, 0, 0.3176471, 1,
1.615018, 2.697416, 2.090032, 1, 0, 0.3137255, 1,
1.629526, -0.07155793, 0.3844104, 1, 0, 0.3058824, 1,
1.641747, -2.001999, 1.558056, 1, 0, 0.2980392, 1,
1.643517, -0.1714794, 2.009403, 1, 0, 0.2941177, 1,
1.651988, -0.4437344, 1.24797, 1, 0, 0.2862745, 1,
1.675048, -0.7568809, 1.278175, 1, 0, 0.282353, 1,
1.693371, 0.4245501, 1.287108, 1, 0, 0.2745098, 1,
1.702095, -1.049034, 4.173692, 1, 0, 0.2705882, 1,
1.752039, 0.5151215, 1.208812, 1, 0, 0.2627451, 1,
1.758771, 0.1224262, 3.164736, 1, 0, 0.2588235, 1,
1.789857, -0.4301859, 3.141246, 1, 0, 0.2509804, 1,
1.809534, -1.334198, 3.078196, 1, 0, 0.2470588, 1,
1.819579, -1.103547, 2.676152, 1, 0, 0.2392157, 1,
1.821491, -0.7248836, 1.301375, 1, 0, 0.2352941, 1,
1.830936, 2.812027, -0.3494544, 1, 0, 0.227451, 1,
1.880278, -0.9278166, 2.351642, 1, 0, 0.2235294, 1,
1.886681, 1.136202, 0.8077976, 1, 0, 0.2156863, 1,
1.973183, -0.08123285, 1.656255, 1, 0, 0.2117647, 1,
1.973716, -1.027513, 1.492105, 1, 0, 0.2039216, 1,
1.995204, 0.1556324, 2.479661, 1, 0, 0.1960784, 1,
1.999101, -1.132552, 1.761527, 1, 0, 0.1921569, 1,
2.006711, 1.371967, 0.6426408, 1, 0, 0.1843137, 1,
2.021732, -1.389495, 1.480483, 1, 0, 0.1803922, 1,
2.047484, -0.7666479, 3.236471, 1, 0, 0.172549, 1,
2.06654, 0.3750225, 0.7109488, 1, 0, 0.1686275, 1,
2.072446, 0.4544704, 0.3244521, 1, 0, 0.1607843, 1,
2.085102, 1.293077, -0.06335137, 1, 0, 0.1568628, 1,
2.095768, -0.1682309, 2.892343, 1, 0, 0.1490196, 1,
2.115009, 0.1567368, 1.475669, 1, 0, 0.145098, 1,
2.115238, 0.1621885, 1.910346, 1, 0, 0.1372549, 1,
2.115993, 0.3685111, 0.08408642, 1, 0, 0.1333333, 1,
2.123519, -1.493863, 1.755937, 1, 0, 0.1254902, 1,
2.132383, -1.645148, 1.354131, 1, 0, 0.1215686, 1,
2.135256, 0.420033, 2.129722, 1, 0, 0.1137255, 1,
2.136997, -1.404494, 1.367358, 1, 0, 0.1098039, 1,
2.154023, 0.07700453, 1.70137, 1, 0, 0.1019608, 1,
2.154325, -0.207406, 1.794083, 1, 0, 0.09411765, 1,
2.170237, 0.216408, 2.169697, 1, 0, 0.09019608, 1,
2.20523, -0.780026, 3.564227, 1, 0, 0.08235294, 1,
2.20523, -0.3516015, 1.001247, 1, 0, 0.07843138, 1,
2.244505, 1.871366, 1.873626, 1, 0, 0.07058824, 1,
2.320397, -0.8016022, 0.7491695, 1, 0, 0.06666667, 1,
2.36066, 0.9597258, -0.499358, 1, 0, 0.05882353, 1,
2.391024, -1.789345, 1.399781, 1, 0, 0.05490196, 1,
2.399249, -1.213405, 1.559587, 1, 0, 0.04705882, 1,
2.479465, -0.1639586, 2.979885, 1, 0, 0.04313726, 1,
2.504286, -1.005354, 2.598806, 1, 0, 0.03529412, 1,
2.552041, -1.507395, 2.362231, 1, 0, 0.03137255, 1,
2.590379, 0.7029478, 2.067572, 1, 0, 0.02352941, 1,
2.626352, 0.3673941, 1.354493, 1, 0, 0.01960784, 1,
2.812008, -1.093346, 1.756897, 1, 0, 0.01176471, 1,
2.939315, -1.027631, 2.068328, 1, 0, 0.007843138, 1
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
-0.1239977, -4.392196, -7.368631, 0, -0.5, 0.5, 0.5,
-0.1239977, -4.392196, -7.368631, 1, -0.5, 0.5, 0.5,
-0.1239977, -4.392196, -7.368631, 1, 1.5, 0.5, 0.5,
-0.1239977, -4.392196, -7.368631, 0, 1.5, 0.5, 0.5
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
-4.225773, -0.02249753, -7.368631, 0, -0.5, 0.5, 0.5,
-4.225773, -0.02249753, -7.368631, 1, -0.5, 0.5, 0.5,
-4.225773, -0.02249753, -7.368631, 1, 1.5, 0.5, 0.5,
-4.225773, -0.02249753, -7.368631, 0, 1.5, 0.5, 0.5
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
-4.225773, -4.392196, -0.1981912, 0, -0.5, 0.5, 0.5,
-4.225773, -4.392196, -0.1981912, 1, -0.5, 0.5, 0.5,
-4.225773, -4.392196, -0.1981912, 1, 1.5, 0.5, 0.5,
-4.225773, -4.392196, -0.1981912, 0, 1.5, 0.5, 0.5
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
-3, -3.383804, -5.713914,
2, -3.383804, -5.713914,
-3, -3.383804, -5.713914,
-3, -3.551869, -5.9897,
-2, -3.383804, -5.713914,
-2, -3.551869, -5.9897,
-1, -3.383804, -5.713914,
-1, -3.551869, -5.9897,
0, -3.383804, -5.713914,
0, -3.551869, -5.9897,
1, -3.383804, -5.713914,
1, -3.551869, -5.9897,
2, -3.383804, -5.713914,
2, -3.551869, -5.9897
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
-3, -3.888, -6.541272, 0, -0.5, 0.5, 0.5,
-3, -3.888, -6.541272, 1, -0.5, 0.5, 0.5,
-3, -3.888, -6.541272, 1, 1.5, 0.5, 0.5,
-3, -3.888, -6.541272, 0, 1.5, 0.5, 0.5,
-2, -3.888, -6.541272, 0, -0.5, 0.5, 0.5,
-2, -3.888, -6.541272, 1, -0.5, 0.5, 0.5,
-2, -3.888, -6.541272, 1, 1.5, 0.5, 0.5,
-2, -3.888, -6.541272, 0, 1.5, 0.5, 0.5,
-1, -3.888, -6.541272, 0, -0.5, 0.5, 0.5,
-1, -3.888, -6.541272, 1, -0.5, 0.5, 0.5,
-1, -3.888, -6.541272, 1, 1.5, 0.5, 0.5,
-1, -3.888, -6.541272, 0, 1.5, 0.5, 0.5,
0, -3.888, -6.541272, 0, -0.5, 0.5, 0.5,
0, -3.888, -6.541272, 1, -0.5, 0.5, 0.5,
0, -3.888, -6.541272, 1, 1.5, 0.5, 0.5,
0, -3.888, -6.541272, 0, 1.5, 0.5, 0.5,
1, -3.888, -6.541272, 0, -0.5, 0.5, 0.5,
1, -3.888, -6.541272, 1, -0.5, 0.5, 0.5,
1, -3.888, -6.541272, 1, 1.5, 0.5, 0.5,
1, -3.888, -6.541272, 0, 1.5, 0.5, 0.5,
2, -3.888, -6.541272, 0, -0.5, 0.5, 0.5,
2, -3.888, -6.541272, 1, -0.5, 0.5, 0.5,
2, -3.888, -6.541272, 1, 1.5, 0.5, 0.5,
2, -3.888, -6.541272, 0, 1.5, 0.5, 0.5
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
-3.27921, -3, -5.713914,
-3.27921, 3, -5.713914,
-3.27921, -3, -5.713914,
-3.43697, -3, -5.9897,
-3.27921, -2, -5.713914,
-3.43697, -2, -5.9897,
-3.27921, -1, -5.713914,
-3.43697, -1, -5.9897,
-3.27921, 0, -5.713914,
-3.43697, 0, -5.9897,
-3.27921, 1, -5.713914,
-3.43697, 1, -5.9897,
-3.27921, 2, -5.713914,
-3.43697, 2, -5.9897,
-3.27921, 3, -5.713914,
-3.43697, 3, -5.9897
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
-3.752492, -3, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, -3, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, -3, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, -3, -6.541272, 0, 1.5, 0.5, 0.5,
-3.752492, -2, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, -2, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, -2, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, -2, -6.541272, 0, 1.5, 0.5, 0.5,
-3.752492, -1, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, -1, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, -1, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, -1, -6.541272, 0, 1.5, 0.5, 0.5,
-3.752492, 0, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, 0, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, 0, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, 0, -6.541272, 0, 1.5, 0.5, 0.5,
-3.752492, 1, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, 1, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, 1, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, 1, -6.541272, 0, 1.5, 0.5, 0.5,
-3.752492, 2, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, 2, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, 2, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, 2, -6.541272, 0, 1.5, 0.5, 0.5,
-3.752492, 3, -6.541272, 0, -0.5, 0.5, 0.5,
-3.752492, 3, -6.541272, 1, -0.5, 0.5, 0.5,
-3.752492, 3, -6.541272, 1, 1.5, 0.5, 0.5,
-3.752492, 3, -6.541272, 0, 1.5, 0.5, 0.5
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
-3.27921, -3.383804, -4,
-3.27921, -3.383804, 4,
-3.27921, -3.383804, -4,
-3.43697, -3.551869, -4,
-3.27921, -3.383804, -2,
-3.43697, -3.551869, -2,
-3.27921, -3.383804, 0,
-3.43697, -3.551869, 0,
-3.27921, -3.383804, 2,
-3.43697, -3.551869, 2,
-3.27921, -3.383804, 4,
-3.43697, -3.551869, 4
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
-3.752492, -3.888, -4, 0, -0.5, 0.5, 0.5,
-3.752492, -3.888, -4, 1, -0.5, 0.5, 0.5,
-3.752492, -3.888, -4, 1, 1.5, 0.5, 0.5,
-3.752492, -3.888, -4, 0, 1.5, 0.5, 0.5,
-3.752492, -3.888, -2, 0, -0.5, 0.5, 0.5,
-3.752492, -3.888, -2, 1, -0.5, 0.5, 0.5,
-3.752492, -3.888, -2, 1, 1.5, 0.5, 0.5,
-3.752492, -3.888, -2, 0, 1.5, 0.5, 0.5,
-3.752492, -3.888, 0, 0, -0.5, 0.5, 0.5,
-3.752492, -3.888, 0, 1, -0.5, 0.5, 0.5,
-3.752492, -3.888, 0, 1, 1.5, 0.5, 0.5,
-3.752492, -3.888, 0, 0, 1.5, 0.5, 0.5,
-3.752492, -3.888, 2, 0, -0.5, 0.5, 0.5,
-3.752492, -3.888, 2, 1, -0.5, 0.5, 0.5,
-3.752492, -3.888, 2, 1, 1.5, 0.5, 0.5,
-3.752492, -3.888, 2, 0, 1.5, 0.5, 0.5,
-3.752492, -3.888, 4, 0, -0.5, 0.5, 0.5,
-3.752492, -3.888, 4, 1, -0.5, 0.5, 0.5,
-3.752492, -3.888, 4, 1, 1.5, 0.5, 0.5,
-3.752492, -3.888, 4, 0, 1.5, 0.5, 0.5
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
-3.27921, -3.383804, -5.713914,
-3.27921, 3.338809, -5.713914,
-3.27921, -3.383804, 5.317532,
-3.27921, 3.338809, 5.317532,
-3.27921, -3.383804, -5.713914,
-3.27921, -3.383804, 5.317532,
-3.27921, 3.338809, -5.713914,
-3.27921, 3.338809, 5.317532,
-3.27921, -3.383804, -5.713914,
3.031214, -3.383804, -5.713914,
-3.27921, -3.383804, 5.317532,
3.031214, -3.383804, 5.317532,
-3.27921, 3.338809, -5.713914,
3.031214, 3.338809, -5.713914,
-3.27921, 3.338809, 5.317532,
3.031214, 3.338809, 5.317532,
3.031214, -3.383804, -5.713914,
3.031214, 3.338809, -5.713914,
3.031214, -3.383804, 5.317532,
3.031214, 3.338809, 5.317532,
3.031214, -3.383804, -5.713914,
3.031214, -3.383804, 5.317532,
3.031214, 3.338809, -5.713914,
3.031214, 3.338809, 5.317532
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
var radius = 7.677218;
var distance = 34.15681;
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
mvMatrix.translate( 0.1239977, 0.02249753, 0.1981912 );
mvMatrix.scale( 1.315404, 1.234752, 0.7524633 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15681);
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
acequinocyl<-read.table("acequinocyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acequinocyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
```

```r
y<-acequinocyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
```

```r
z<-acequinocyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'acequinocyl' not found
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
-3.18731, -1.597551, -0.6667317, 0, 0, 1, 1, 1,
-2.81913, -0.5202665, -0.384021, 1, 0, 0, 1, 1,
-2.543496, 0.3234813, -1.595954, 1, 0, 0, 1, 1,
-2.517804, 0.4077673, -2.168011, 1, 0, 0, 1, 1,
-2.471928, 0.837316, -1.0506, 1, 0, 0, 1, 1,
-2.435521, -0.1507017, -2.377004, 1, 0, 0, 1, 1,
-2.421838, -0.473711, -3.056584, 0, 0, 0, 1, 1,
-2.405021, -1.101704, -0.3575886, 0, 0, 0, 1, 1,
-2.366968, -0.1311991, -1.390479, 0, 0, 0, 1, 1,
-2.363404, -1.206166, -0.8106216, 0, 0, 0, 1, 1,
-2.321605, -0.10326, -3.671853, 0, 0, 0, 1, 1,
-2.316374, -0.9754449, -1.765829, 0, 0, 0, 1, 1,
-2.310194, -0.05199198, -2.626157, 0, 0, 0, 1, 1,
-2.285366, -0.1553062, -2.75793, 1, 1, 1, 1, 1,
-2.284674, -0.3731885, 0.01253829, 1, 1, 1, 1, 1,
-2.267484, -1.007318, -2.325552, 1, 1, 1, 1, 1,
-2.215055, -0.3212903, -2.251144, 1, 1, 1, 1, 1,
-2.199569, 1.175155, 0.1489216, 1, 1, 1, 1, 1,
-2.182666, 0.672951, -0.9366416, 1, 1, 1, 1, 1,
-2.171319, 0.7221065, -2.299468, 1, 1, 1, 1, 1,
-2.127422, 0.9840959, -1.602284, 1, 1, 1, 1, 1,
-2.123713, -0.80258, -2.068847, 1, 1, 1, 1, 1,
-2.098482, -0.3824071, -0.589394, 1, 1, 1, 1, 1,
-2.085686, 0.4833706, -0.5029136, 1, 1, 1, 1, 1,
-2.081247, -1.265379, -1.321761, 1, 1, 1, 1, 1,
-2.080997, -0.5486192, -2.02886, 1, 1, 1, 1, 1,
-2.073003, -0.2812535, -1.806854, 1, 1, 1, 1, 1,
-2.069534, 2.907538, -1.314961, 1, 1, 1, 1, 1,
-2.052992, 1.282523, -1.243144, 0, 0, 1, 1, 1,
-2.051985, 0.117095, -1.343764, 1, 0, 0, 1, 1,
-2.039793, -0.7673917, 0.5599325, 1, 0, 0, 1, 1,
-2.032285, 0.843757, -2.152097, 1, 0, 0, 1, 1,
-2.023612, 0.1378729, -0.05855417, 1, 0, 0, 1, 1,
-1.974495, -0.7977532, -3.312589, 1, 0, 0, 1, 1,
-1.926044, -2.155845, -4.174232, 0, 0, 0, 1, 1,
-1.925441, 0.5796701, -2.448208, 0, 0, 0, 1, 1,
-1.91318, 1.010311, -1.609054, 0, 0, 0, 1, 1,
-1.905133, 1.276406, -0.1503193, 0, 0, 0, 1, 1,
-1.891264, -1.040198, -3.595787, 0, 0, 0, 1, 1,
-1.882615, 0.7002772, -0.7932426, 0, 0, 0, 1, 1,
-1.871699, -0.9259229, -3.234402, 0, 0, 0, 1, 1,
-1.838333, -0.6335534, -0.8674778, 1, 1, 1, 1, 1,
-1.829676, 0.4126987, -2.160629, 1, 1, 1, 1, 1,
-1.826505, -0.802974, -1.913568, 1, 1, 1, 1, 1,
-1.805777, -0.8678424, -1.841706, 1, 1, 1, 1, 1,
-1.780823, 0.1788822, -1.177883, 1, 1, 1, 1, 1,
-1.778125, 0.6769351, -1.113378, 1, 1, 1, 1, 1,
-1.774492, -0.4578354, -2.308478, 1, 1, 1, 1, 1,
-1.771928, 0.3974784, -0.5868609, 1, 1, 1, 1, 1,
-1.767717, 1.01195, -0.2073753, 1, 1, 1, 1, 1,
-1.764787, -0.7569392, -0.992387, 1, 1, 1, 1, 1,
-1.759858, 1.05531, -1.062865, 1, 1, 1, 1, 1,
-1.759523, 0.01406582, -0.7265823, 1, 1, 1, 1, 1,
-1.747618, -1.077075, -0.9708351, 1, 1, 1, 1, 1,
-1.736905, 0.1849198, -1.753111, 1, 1, 1, 1, 1,
-1.73596, 1.312364, -1.364583, 1, 1, 1, 1, 1,
-1.732118, -0.06896664, -1.572142, 0, 0, 1, 1, 1,
-1.725008, -1.700964, -2.172181, 1, 0, 0, 1, 1,
-1.707115, -0.09898801, -2.238205, 1, 0, 0, 1, 1,
-1.70037, -1.405195, -3.857502, 1, 0, 0, 1, 1,
-1.691932, 0.3128837, -1.823894, 1, 0, 0, 1, 1,
-1.685282, 0.4235275, -1.069607, 1, 0, 0, 1, 1,
-1.684445, 0.685863, -1.329664, 0, 0, 0, 1, 1,
-1.672904, -0.09636324, -2.157526, 0, 0, 0, 1, 1,
-1.670474, -0.4092586, -2.48368, 0, 0, 0, 1, 1,
-1.655537, 0.3582746, -1.9688, 0, 0, 0, 1, 1,
-1.642679, -1.019042, -1.393131, 0, 0, 0, 1, 1,
-1.636108, 1.09299, 0.09339216, 0, 0, 0, 1, 1,
-1.593161, -0.5613061, -1.388622, 0, 0, 0, 1, 1,
-1.574044, 0.8262511, -0.1498397, 1, 1, 1, 1, 1,
-1.572447, 1.073908, -2.071718, 1, 1, 1, 1, 1,
-1.562021, -1.197275, -1.882842, 1, 1, 1, 1, 1,
-1.554964, 0.8946202, -2.156887, 1, 1, 1, 1, 1,
-1.54379, 0.8183691, 0.3526192, 1, 1, 1, 1, 1,
-1.541157, -0.5474896, -1.498189, 1, 1, 1, 1, 1,
-1.535952, 0.8310192, -0.8062924, 1, 1, 1, 1, 1,
-1.529602, 0.6613925, -2.914488, 1, 1, 1, 1, 1,
-1.520557, -0.4783314, -4.011366, 1, 1, 1, 1, 1,
-1.508814, 0.09486838, -0.1820374, 1, 1, 1, 1, 1,
-1.506948, 0.4386992, -1.560675, 1, 1, 1, 1, 1,
-1.500491, 0.5236636, -0.279528, 1, 1, 1, 1, 1,
-1.490007, 0.2690748, -1.149415, 1, 1, 1, 1, 1,
-1.486279, 0.8833239, -1.358189, 1, 1, 1, 1, 1,
-1.477043, 0.09731767, -0.07154989, 1, 1, 1, 1, 1,
-1.469729, 0.615072, -0.552024, 0, 0, 1, 1, 1,
-1.469065, -1.060238, -2.275679, 1, 0, 0, 1, 1,
-1.467396, 0.295, -2.990705, 1, 0, 0, 1, 1,
-1.458837, 0.4292319, -1.652472, 1, 0, 0, 1, 1,
-1.452497, -0.7693698, -3.873201, 1, 0, 0, 1, 1,
-1.451765, 0.4536935, -0.534371, 1, 0, 0, 1, 1,
-1.445679, -1.615057, -3.718011, 0, 0, 0, 1, 1,
-1.440063, -0.001518034, -0.2711965, 0, 0, 0, 1, 1,
-1.434069, -0.08830985, 0.4357106, 0, 0, 0, 1, 1,
-1.428271, -0.4770458, -1.702213, 0, 0, 0, 1, 1,
-1.426203, 1.278706, -0.6448185, 0, 0, 0, 1, 1,
-1.423559, -0.3100391, -2.59543, 0, 0, 0, 1, 1,
-1.414158, -0.5830044, -1.264592, 0, 0, 0, 1, 1,
-1.374324, -1.46623, -2.729141, 1, 1, 1, 1, 1,
-1.372457, -1.155543, -0.6245811, 1, 1, 1, 1, 1,
-1.352646, 0.9336973, -1.645847, 1, 1, 1, 1, 1,
-1.34981, 1.806371, -0.01980845, 1, 1, 1, 1, 1,
-1.33839, -0.7460306, -1.12023, 1, 1, 1, 1, 1,
-1.327297, 1.441645, -2.465388, 1, 1, 1, 1, 1,
-1.305242, 0.4463658, -0.8281384, 1, 1, 1, 1, 1,
-1.288532, -0.7173274, -1.141637, 1, 1, 1, 1, 1,
-1.287101, -0.5086939, -0.7048373, 1, 1, 1, 1, 1,
-1.281938, -0.5571958, -2.790588, 1, 1, 1, 1, 1,
-1.280366, 0.4291611, 0.9563891, 1, 1, 1, 1, 1,
-1.272134, 0.3795838, -0.1960994, 1, 1, 1, 1, 1,
-1.271689, -0.8035365, -1.994807, 1, 1, 1, 1, 1,
-1.27028, 0.8388289, -3.104566, 1, 1, 1, 1, 1,
-1.257765, 0.4865299, -1.749496, 1, 1, 1, 1, 1,
-1.253963, 0.1110158, -1.134447, 0, 0, 1, 1, 1,
-1.244485, 1.547059, 0.836106, 1, 0, 0, 1, 1,
-1.240519, 0.05396572, -1.577107, 1, 0, 0, 1, 1,
-1.239112, -0.6430417, -1.360998, 1, 0, 0, 1, 1,
-1.237125, 0.8713688, -0.5637494, 1, 0, 0, 1, 1,
-1.233257, 0.5261896, -0.7083565, 1, 0, 0, 1, 1,
-1.233228, -1.009608, -1.097826, 0, 0, 0, 1, 1,
-1.232318, 0.3847515, -2.339989, 0, 0, 0, 1, 1,
-1.2279, 0.673741, 0.4801711, 0, 0, 0, 1, 1,
-1.227567, 1.886995, -0.3488897, 0, 0, 0, 1, 1,
-1.216325, 0.03902541, -1.042839, 0, 0, 0, 1, 1,
-1.210422, 0.1567826, -1.091846, 0, 0, 0, 1, 1,
-1.20822, 1.942843, -1.522372, 0, 0, 0, 1, 1,
-1.19862, 1.081785, 0.6730779, 1, 1, 1, 1, 1,
-1.19065, 0.7681654, 1.037766, 1, 1, 1, 1, 1,
-1.186729, 2.432667, -1.654553, 1, 1, 1, 1, 1,
-1.184881, -0.4027765, -1.827907, 1, 1, 1, 1, 1,
-1.183545, -0.7960401, -1.819503, 1, 1, 1, 1, 1,
-1.182509, -0.1603664, -2.099173, 1, 1, 1, 1, 1,
-1.180956, -0.3216933, -0.2542853, 1, 1, 1, 1, 1,
-1.174501, -0.6298277, -2.480594, 1, 1, 1, 1, 1,
-1.173392, 0.2846405, -1.261841, 1, 1, 1, 1, 1,
-1.165084, 1.662376, 0.1995803, 1, 1, 1, 1, 1,
-1.163715, 0.7999038, -2.11887, 1, 1, 1, 1, 1,
-1.156812, -0.3630029, -0.5135818, 1, 1, 1, 1, 1,
-1.155744, -0.7179471, -3.346165, 1, 1, 1, 1, 1,
-1.153267, -0.1298955, -1.611054, 1, 1, 1, 1, 1,
-1.15004, -0.05213745, -1.972409, 1, 1, 1, 1, 1,
-1.14897, 0.7212487, -0.05736591, 0, 0, 1, 1, 1,
-1.131516, 1.461331, -0.4304332, 1, 0, 0, 1, 1,
-1.130616, -0.5977994, -1.892142, 1, 0, 0, 1, 1,
-1.129272, -1.329006, -3.080575, 1, 0, 0, 1, 1,
-1.125216, -0.5035668, -2.036845, 1, 0, 0, 1, 1,
-1.122109, -0.01263177, -1.699614, 1, 0, 0, 1, 1,
-1.118382, 0.08363979, -1.989938, 0, 0, 0, 1, 1,
-1.107379, 0.6755318, -0.4551861, 0, 0, 0, 1, 1,
-1.106323, 0.002331856, -3.218434, 0, 0, 0, 1, 1,
-1.095272, -1.87818, -2.214299, 0, 0, 0, 1, 1,
-1.088762, 1.206076, -0.6877883, 0, 0, 0, 1, 1,
-1.088641, -0.1835977, -3.143463, 0, 0, 0, 1, 1,
-1.087153, -0.4682093, -2.293387, 0, 0, 0, 1, 1,
-1.081328, 0.007008771, -0.9870707, 1, 1, 1, 1, 1,
-1.075561, 0.840139, -0.3047004, 1, 1, 1, 1, 1,
-1.064505, -0.565623, -1.998913, 1, 1, 1, 1, 1,
-1.052674, -0.3236297, -1.910075, 1, 1, 1, 1, 1,
-1.043859, -0.2556603, -1.085367, 1, 1, 1, 1, 1,
-1.043133, 1.042335, -0.16473, 1, 1, 1, 1, 1,
-1.042846, -0.09378947, -1.996873, 1, 1, 1, 1, 1,
-1.040422, 1.185353, -1.288242, 1, 1, 1, 1, 1,
-1.037565, -0.1229209, -1.789669, 1, 1, 1, 1, 1,
-1.035523, -0.1749826, -0.835605, 1, 1, 1, 1, 1,
-1.031337, 2.835244, 0.2712318, 1, 1, 1, 1, 1,
-1.026124, 0.1342146, -1.098579, 1, 1, 1, 1, 1,
-1.022637, -0.3088393, -0.7427863, 1, 1, 1, 1, 1,
-1.019833, 0.09697019, -0.9944137, 1, 1, 1, 1, 1,
-1.000538, -1.223448, -3.238443, 1, 1, 1, 1, 1,
-0.9874957, 0.4195233, -2.095315, 0, 0, 1, 1, 1,
-0.9811687, 0.693935, 0.1399093, 1, 0, 0, 1, 1,
-0.9742471, -1.03806, -1.604473, 1, 0, 0, 1, 1,
-0.9707502, 0.06421612, -1.994925, 1, 0, 0, 1, 1,
-0.9701569, 0.2970163, -1.7426, 1, 0, 0, 1, 1,
-0.9701431, -1.910032, -1.22913, 1, 0, 0, 1, 1,
-0.969977, -0.6611654, -0.7183321, 0, 0, 0, 1, 1,
-0.9687763, 2.531533, -0.1564667, 0, 0, 0, 1, 1,
-0.9653396, 1.081348, 0.2508605, 0, 0, 0, 1, 1,
-0.947898, -0.2059115, -2.011768, 0, 0, 0, 1, 1,
-0.9464688, -0.6487417, -2.723866, 0, 0, 0, 1, 1,
-0.9368038, -0.6487989, -2.845631, 0, 0, 0, 1, 1,
-0.936615, 1.782593, -0.9790096, 0, 0, 0, 1, 1,
-0.9365349, 0.04958066, -1.629705, 1, 1, 1, 1, 1,
-0.9359559, 0.1729183, -0.9248475, 1, 1, 1, 1, 1,
-0.9346107, -0.497613, -3.537427, 1, 1, 1, 1, 1,
-0.9283176, -0.4112859, 0.767388, 1, 1, 1, 1, 1,
-0.9278188, 0.6488285, -0.9088755, 1, 1, 1, 1, 1,
-0.9268814, -0.7335202, -4.185722, 1, 1, 1, 1, 1,
-0.9264677, -0.009885537, -1.903467, 1, 1, 1, 1, 1,
-0.9263107, -0.1235486, 0.05575411, 1, 1, 1, 1, 1,
-0.9226669, -1.389848, -1.161737, 1, 1, 1, 1, 1,
-0.9111867, 0.2675735, -0.2666925, 1, 1, 1, 1, 1,
-0.9097302, 0.1488484, -3.003258, 1, 1, 1, 1, 1,
-0.9094186, 1.434945, 1.428659, 1, 1, 1, 1, 1,
-0.9049354, -0.572463, -0.3776698, 1, 1, 1, 1, 1,
-0.9009768, 0.19284, -0.8197496, 1, 1, 1, 1, 1,
-0.8984764, 0.6806251, 0.6180827, 1, 1, 1, 1, 1,
-0.8957879, 0.5375843, -2.912174, 0, 0, 1, 1, 1,
-0.8915768, -0.4590768, -1.17271, 1, 0, 0, 1, 1,
-0.8837805, -0.5927887, -1.767477, 1, 0, 0, 1, 1,
-0.8670024, -0.9525416, -2.560663, 1, 0, 0, 1, 1,
-0.866636, 0.6568514, -2.36165, 1, 0, 0, 1, 1,
-0.8565692, -0.7997352, -0.5914874, 1, 0, 0, 1, 1,
-0.85609, -3.285902, -2.354451, 0, 0, 0, 1, 1,
-0.8504828, 0.678125, -0.5244898, 0, 0, 0, 1, 1,
-0.8472927, 0.0389586, -1.63682, 0, 0, 0, 1, 1,
-0.8415322, -1.22871, -1.72316, 0, 0, 0, 1, 1,
-0.8415127, -0.9936497, -3.308854, 0, 0, 0, 1, 1,
-0.840588, 1.121885, 0.9127768, 0, 0, 0, 1, 1,
-0.8394176, -0.0364141, -3.072304, 0, 0, 0, 1, 1,
-0.8390799, 0.7804926, 0.4411004, 1, 1, 1, 1, 1,
-0.8390362, 0.9347394, -0.5407861, 1, 1, 1, 1, 1,
-0.8341772, 0.7854967, -1.249772, 1, 1, 1, 1, 1,
-0.8282417, 0.2971469, -1.641012, 1, 1, 1, 1, 1,
-0.8201904, 0.5478004, -2.166096, 1, 1, 1, 1, 1,
-0.8176268, -1.751393, -2.679542, 1, 1, 1, 1, 1,
-0.8162612, 0.04789983, 0.2425627, 1, 1, 1, 1, 1,
-0.813992, -0.2572993, -2.372573, 1, 1, 1, 1, 1,
-0.8087786, -0.02413387, -1.129533, 1, 1, 1, 1, 1,
-0.7950187, -2.523565, -2.544901, 1, 1, 1, 1, 1,
-0.7948914, -0.6295103, -2.139714, 1, 1, 1, 1, 1,
-0.7947994, -1.096635, -0.5012938, 1, 1, 1, 1, 1,
-0.7908159, 1.470883, -2.103084, 1, 1, 1, 1, 1,
-0.7828751, 2.274861, -1.073757, 1, 1, 1, 1, 1,
-0.7715689, -1.356486, -1.725868, 1, 1, 1, 1, 1,
-0.7708024, 1.178296, -0.8987771, 0, 0, 1, 1, 1,
-0.7679263, 1.088574, -2.384327, 1, 0, 0, 1, 1,
-0.7659605, -2.63487, -3.151231, 1, 0, 0, 1, 1,
-0.7600453, -0.3245734, -0.4247344, 1, 0, 0, 1, 1,
-0.7529585, 0.8051652, -0.1936394, 1, 0, 0, 1, 1,
-0.7518621, -0.7369543, -2.519743, 1, 0, 0, 1, 1,
-0.7505829, 0.2559212, -0.5763034, 0, 0, 0, 1, 1,
-0.7455708, -0.9045966, -1.853243, 0, 0, 0, 1, 1,
-0.7455087, -0.9333487, -1.990523, 0, 0, 0, 1, 1,
-0.7422977, 0.3635119, -1.735747, 0, 0, 0, 1, 1,
-0.7408975, -0.3709694, -2.785023, 0, 0, 0, 1, 1,
-0.7404717, 2.314802, -0.1021133, 0, 0, 0, 1, 1,
-0.7403063, -0.09621405, -2.781137, 0, 0, 0, 1, 1,
-0.7393507, -1.075772, -2.393118, 1, 1, 1, 1, 1,
-0.7388535, 0.2973459, -0.5653958, 1, 1, 1, 1, 1,
-0.7346799, -1.483217, -0.7291802, 1, 1, 1, 1, 1,
-0.7344013, -0.2441877, -1.457303, 1, 1, 1, 1, 1,
-0.733626, 1.408672, -1.709342, 1, 1, 1, 1, 1,
-0.7293742, 1.360265, -1.955061, 1, 1, 1, 1, 1,
-0.7232242, -1.159341, -2.603541, 1, 1, 1, 1, 1,
-0.7145618, -0.6822534, -1.527071, 1, 1, 1, 1, 1,
-0.7032516, 0.4341868, -2.765099, 1, 1, 1, 1, 1,
-0.6987578, 0.1710293, -1.121556, 1, 1, 1, 1, 1,
-0.6986175, 0.1882807, -3.27277, 1, 1, 1, 1, 1,
-0.6959267, 2.297145, 0.5411261, 1, 1, 1, 1, 1,
-0.6945165, 0.15566, 0.2998261, 1, 1, 1, 1, 1,
-0.6887982, -2.318227, -1.158092, 1, 1, 1, 1, 1,
-0.6878411, 0.3968083, -2.143734, 1, 1, 1, 1, 1,
-0.6857538, 1.951623, -0.4559059, 0, 0, 1, 1, 1,
-0.6848952, 0.1765103, -0.4689161, 1, 0, 0, 1, 1,
-0.6837341, -0.1780208, -1.728914, 1, 0, 0, 1, 1,
-0.6808171, -0.1817706, -1.442993, 1, 0, 0, 1, 1,
-0.6772215, -0.3727933, -2.050365, 1, 0, 0, 1, 1,
-0.6692051, -0.9875947, -1.688619, 1, 0, 0, 1, 1,
-0.6682079, 0.2992261, -1.375325, 0, 0, 0, 1, 1,
-0.6660361, -1.589342, -2.124643, 0, 0, 0, 1, 1,
-0.6652095, -0.7372559, -3.021013, 0, 0, 0, 1, 1,
-0.6651143, -0.5185581, 0.1271172, 0, 0, 0, 1, 1,
-0.6614715, 0.04317473, -1.928052, 0, 0, 0, 1, 1,
-0.6576086, 1.776491, 0.172609, 0, 0, 0, 1, 1,
-0.6566441, -0.9027897, -3.540245, 0, 0, 0, 1, 1,
-0.6555755, -0.9489381, -3.501211, 1, 1, 1, 1, 1,
-0.6555055, 1.498619, 1.105603, 1, 1, 1, 1, 1,
-0.6513036, -0.7281544, -2.151695, 1, 1, 1, 1, 1,
-0.6477257, 0.353599, -1.587353, 1, 1, 1, 1, 1,
-0.6466659, -0.6090018, -2.516112, 1, 1, 1, 1, 1,
-0.646331, -0.07614345, -0.8527964, 1, 1, 1, 1, 1,
-0.6399221, -0.3097687, -2.026435, 1, 1, 1, 1, 1,
-0.6391802, 1.391321, -0.6023145, 1, 1, 1, 1, 1,
-0.6385528, -1.125486, -2.024757, 1, 1, 1, 1, 1,
-0.6370195, -0.2068045, -1.507736, 1, 1, 1, 1, 1,
-0.6351736, 0.8272715, 0.7836484, 1, 1, 1, 1, 1,
-0.6350542, -0.7481605, -1.518643, 1, 1, 1, 1, 1,
-0.6311389, 0.3425784, -2.212917, 1, 1, 1, 1, 1,
-0.6303984, -1.565181, -2.748501, 1, 1, 1, 1, 1,
-0.6280803, -0.9088915, -0.8747702, 1, 1, 1, 1, 1,
-0.6276519, 0.03096052, -1.368324, 0, 0, 1, 1, 1,
-0.6267714, -0.4120363, -2.054502, 1, 0, 0, 1, 1,
-0.6246675, -0.2801549, -3.633214, 1, 0, 0, 1, 1,
-0.6183077, -0.1184004, -2.306031, 1, 0, 0, 1, 1,
-0.6144766, -1.584098, -2.378072, 1, 0, 0, 1, 1,
-0.6102087, -0.112515, -1.429718, 1, 0, 0, 1, 1,
-0.6091748, -0.6898956, -0.9155024, 0, 0, 0, 1, 1,
-0.6082878, -0.6080174, -1.22087, 0, 0, 0, 1, 1,
-0.6026847, -0.9262465, -4.317614, 0, 0, 0, 1, 1,
-0.5995109, 0.2681396, -2.660016, 0, 0, 0, 1, 1,
-0.5969627, 1.940555, 0.2851231, 0, 0, 0, 1, 1,
-0.5968835, 0.5908849, -0.889148, 0, 0, 0, 1, 1,
-0.596045, -0.692564, -1.445769, 0, 0, 0, 1, 1,
-0.5882168, -1.163321, -5.553262, 1, 1, 1, 1, 1,
-0.5860216, -0.4115662, -1.908766, 1, 1, 1, 1, 1,
-0.576081, -0.7045057, -1.915827, 1, 1, 1, 1, 1,
-0.5697255, 0.391054, -2.876004, 1, 1, 1, 1, 1,
-0.5689134, 0.6799203, -2.322814, 1, 1, 1, 1, 1,
-0.568424, -0.4600239, -2.717805, 1, 1, 1, 1, 1,
-0.5610715, 1.481546, 1.183861, 1, 1, 1, 1, 1,
-0.5607132, -0.3785866, -2.927749, 1, 1, 1, 1, 1,
-0.558483, -0.48617, -1.711954, 1, 1, 1, 1, 1,
-0.5566645, 0.02144505, -0.9246213, 1, 1, 1, 1, 1,
-0.5536125, 0.8293446, -0.453786, 1, 1, 1, 1, 1,
-0.5535223, -0.8366408, -1.614771, 1, 1, 1, 1, 1,
-0.5514824, -0.5583091, -3.557398, 1, 1, 1, 1, 1,
-0.5502822, -0.7064113, -3.23769, 1, 1, 1, 1, 1,
-0.5476243, 0.4982288, -1.764517, 1, 1, 1, 1, 1,
-0.5465335, 0.07689551, -0.3623078, 0, 0, 1, 1, 1,
-0.5457728, 3.240907, -1.316323, 1, 0, 0, 1, 1,
-0.5438889, -1.475365, -3.945387, 1, 0, 0, 1, 1,
-0.5431076, 0.4744123, -3.386259, 1, 0, 0, 1, 1,
-0.5404227, 0.7880957, -1.526201, 1, 0, 0, 1, 1,
-0.5398012, 0.9955162, -1.792998, 1, 0, 0, 1, 1,
-0.5388661, -1.272099, -1.710253, 0, 0, 0, 1, 1,
-0.5372975, 0.9156005, -1.35644, 0, 0, 0, 1, 1,
-0.5358161, -0.3442408, -1.771419, 0, 0, 0, 1, 1,
-0.5342575, 0.9431664, -1.686847, 0, 0, 0, 1, 1,
-0.5331498, -1.708373, -2.727136, 0, 0, 0, 1, 1,
-0.5314257, -0.9226828, -4.465963, 0, 0, 0, 1, 1,
-0.5259424, -2.094164, -3.805308, 0, 0, 0, 1, 1,
-0.520873, -0.4138706, -0.6813719, 1, 1, 1, 1, 1,
-0.5202926, -0.3517473, -3.281366, 1, 1, 1, 1, 1,
-0.5182412, -0.5629295, -2.855854, 1, 1, 1, 1, 1,
-0.5173142, -0.7085841, -3.679284, 1, 1, 1, 1, 1,
-0.5173072, -0.3257836, -2.16132, 1, 1, 1, 1, 1,
-0.515137, -1.769726, -3.566006, 1, 1, 1, 1, 1,
-0.5151325, -0.3917131, -3.180554, 1, 1, 1, 1, 1,
-0.5142419, -1.650487, -3.821148, 1, 1, 1, 1, 1,
-0.5125252, 0.2149345, -1.94265, 1, 1, 1, 1, 1,
-0.5124268, -0.1837588, -0.9451938, 1, 1, 1, 1, 1,
-0.5065266, -0.8433487, -2.004205, 1, 1, 1, 1, 1,
-0.505586, -0.4805926, -1.224022, 1, 1, 1, 1, 1,
-0.5051489, -0.5401722, -3.200131, 1, 1, 1, 1, 1,
-0.5011051, 0.7947723, 1.607114, 1, 1, 1, 1, 1,
-0.5005227, -0.505605, -2.952272, 1, 1, 1, 1, 1,
-0.4985248, 0.646789, -0.7058206, 0, 0, 1, 1, 1,
-0.4968561, 1.87981, -0.9489903, 1, 0, 0, 1, 1,
-0.4954366, 0.4288989, -0.8599822, 1, 0, 0, 1, 1,
-0.4934553, 0.2809241, 0.3013789, 1, 0, 0, 1, 1,
-0.4925259, 2.641351, 0.2368577, 1, 0, 0, 1, 1,
-0.4924967, -0.6648717, -4.316822, 1, 0, 0, 1, 1,
-0.4906899, -0.778482, -3.958108, 0, 0, 0, 1, 1,
-0.4726819, -2.078012, -3.665845, 0, 0, 0, 1, 1,
-0.4725851, 0.5057493, -1.618814, 0, 0, 0, 1, 1,
-0.4657209, 0.1282773, -1.819355, 0, 0, 0, 1, 1,
-0.4607317, -0.6615934, -3.076795, 0, 0, 0, 1, 1,
-0.4540353, 0.1866346, -1.126544, 0, 0, 0, 1, 1,
-0.4518515, 1.182404, -1.197159, 0, 0, 0, 1, 1,
-0.4516722, -0.05070724, -0.4346372, 1, 1, 1, 1, 1,
-0.4488624, -0.8158618, -2.159969, 1, 1, 1, 1, 1,
-0.4446451, 0.5875372, 0.5139825, 1, 1, 1, 1, 1,
-0.4386245, 0.4980013, 1.146816, 1, 1, 1, 1, 1,
-0.4376218, 0.8835959, -0.5126711, 1, 1, 1, 1, 1,
-0.4332374, 1.434464, -1.357461, 1, 1, 1, 1, 1,
-0.4247161, 0.3296726, -0.7554307, 1, 1, 1, 1, 1,
-0.4245164, 1.092821, 1.111688, 1, 1, 1, 1, 1,
-0.4241352, -0.0485896, -0.1510227, 1, 1, 1, 1, 1,
-0.4220845, -0.5156956, -0.07376302, 1, 1, 1, 1, 1,
-0.42148, -0.8156655, -1.831051, 1, 1, 1, 1, 1,
-0.4202723, -0.5603213, -2.686645, 1, 1, 1, 1, 1,
-0.4166807, -0.1576771, -2.393694, 1, 1, 1, 1, 1,
-0.4160478, 1.071498, 1.114092, 1, 1, 1, 1, 1,
-0.4033549, -0.5118834, -2.515707, 1, 1, 1, 1, 1,
-0.3945903, 0.3449403, -1.23301, 0, 0, 1, 1, 1,
-0.3890918, 0.804621, -0.5665926, 1, 0, 0, 1, 1,
-0.3889802, -1.332044, -2.52992, 1, 0, 0, 1, 1,
-0.3885361, 0.07490387, -2.454389, 1, 0, 0, 1, 1,
-0.3779628, -1.488676, -2.969241, 1, 0, 0, 1, 1,
-0.3752908, -0.5301481, -2.448997, 1, 0, 0, 1, 1,
-0.3701849, 2.179952, 0.9688408, 0, 0, 0, 1, 1,
-0.3696201, 0.06589138, 0.4298383, 0, 0, 0, 1, 1,
-0.3681746, 2.126686, -1.179156, 0, 0, 0, 1, 1,
-0.3681356, 1.152824, -1.459799, 0, 0, 0, 1, 1,
-0.3653701, -2.234321, -3.726921, 0, 0, 0, 1, 1,
-0.3607563, -0.1323885, -1.702734, 0, 0, 0, 1, 1,
-0.3565309, 0.4748706, -0.2280335, 0, 0, 0, 1, 1,
-0.3545211, 0.7377674, -0.3502043, 1, 1, 1, 1, 1,
-0.3533005, -0.6593111, -2.202698, 1, 1, 1, 1, 1,
-0.3469469, -0.4009331, -1.122768, 1, 1, 1, 1, 1,
-0.3466162, -1.309314, -2.945765, 1, 1, 1, 1, 1,
-0.3437424, -0.7701433, -1.4641, 1, 1, 1, 1, 1,
-0.3420662, 0.7251266, -1.490055, 1, 1, 1, 1, 1,
-0.3413197, -0.2522738, -1.779251, 1, 1, 1, 1, 1,
-0.3325345, 0.5367143, 0.251404, 1, 1, 1, 1, 1,
-0.3310021, -1.118237, -0.8412546, 1, 1, 1, 1, 1,
-0.3288414, -2.264887, -3.16507, 1, 1, 1, 1, 1,
-0.3281481, 0.1766449, -2.427973, 1, 1, 1, 1, 1,
-0.3263785, 0.3070785, -2.707027, 1, 1, 1, 1, 1,
-0.3230613, -0.2723665, -2.228046, 1, 1, 1, 1, 1,
-0.321842, 0.04122316, 0.09504534, 1, 1, 1, 1, 1,
-0.3212383, 0.4238184, 0.5051223, 1, 1, 1, 1, 1,
-0.3202198, 0.6857738, 0.2070719, 0, 0, 1, 1, 1,
-0.3191009, 0.4154661, -1.427867, 1, 0, 0, 1, 1,
-0.3178991, 1.699687, 1.51943, 1, 0, 0, 1, 1,
-0.3083473, 0.9553257, -0.4114986, 1, 0, 0, 1, 1,
-0.3079202, -0.2996008, 0.4132127, 1, 0, 0, 1, 1,
-0.3004584, 0.3866262, -0.3720608, 1, 0, 0, 1, 1,
-0.299237, -1.860847, -2.56811, 0, 0, 0, 1, 1,
-0.2972726, -0.2466199, -2.174441, 0, 0, 0, 1, 1,
-0.2967668, -0.7246926, -2.78578, 0, 0, 0, 1, 1,
-0.2941878, -0.06659356, -2.198787, 0, 0, 0, 1, 1,
-0.2837984, -0.9809833, -4.026217, 0, 0, 0, 1, 1,
-0.2826166, -1.319762, -2.775675, 0, 0, 0, 1, 1,
-0.2809793, 1.5565, -1.50776, 0, 0, 0, 1, 1,
-0.280636, -0.1766954, -0.9687304, 1, 1, 1, 1, 1,
-0.2785895, -0.6986156, -2.860998, 1, 1, 1, 1, 1,
-0.2756965, -0.5464983, -2.77005, 1, 1, 1, 1, 1,
-0.2755886, 0.5174737, -1.774121, 1, 1, 1, 1, 1,
-0.2736841, -0.1365571, -2.087783, 1, 1, 1, 1, 1,
-0.2728328, -2.00464, -2.002491, 1, 1, 1, 1, 1,
-0.272109, -2.037061, -2.95663, 1, 1, 1, 1, 1,
-0.2689246, -0.5183703, -2.950845, 1, 1, 1, 1, 1,
-0.2682399, 1.854898, -0.182, 1, 1, 1, 1, 1,
-0.2675702, 1.254561, 1.176708, 1, 1, 1, 1, 1,
-0.2664503, 1.786333, 0.7100497, 1, 1, 1, 1, 1,
-0.2612559, 0.5423083, 0.4061467, 1, 1, 1, 1, 1,
-0.2604474, -0.5281819, -3.038813, 1, 1, 1, 1, 1,
-0.2578297, -0.1929386, -1.313192, 1, 1, 1, 1, 1,
-0.2571741, -0.727297, -0.7737594, 1, 1, 1, 1, 1,
-0.2543595, 0.5134806, -0.3352312, 0, 0, 1, 1, 1,
-0.2424998, 0.2843835, 1.319264, 1, 0, 0, 1, 1,
-0.2402984, 0.2934496, -0.589038, 1, 0, 0, 1, 1,
-0.240003, -0.3651997, -2.236247, 1, 0, 0, 1, 1,
-0.2390596, -0.7325242, -3.23659, 1, 0, 0, 1, 1,
-0.23841, 0.6546884, -2.008284, 1, 0, 0, 1, 1,
-0.2377736, -0.7757925, -2.495014, 0, 0, 0, 1, 1,
-0.2262185, 0.1579913, -1.884639, 0, 0, 0, 1, 1,
-0.2237898, 0.6887068, 1.278582, 0, 0, 0, 1, 1,
-0.2237661, -1.669872, -0.7846456, 0, 0, 0, 1, 1,
-0.2179943, 0.4131625, 0.4906543, 0, 0, 0, 1, 1,
-0.2114759, -0.8569598, -4.550539, 0, 0, 0, 1, 1,
-0.2098329, -0.4815677, -2.113277, 0, 0, 0, 1, 1,
-0.1967028, 0.5196853, 1.113048, 1, 1, 1, 1, 1,
-0.1948877, 1.232685, -0.2509991, 1, 1, 1, 1, 1,
-0.1829674, -0.3463886, -3.482047, 1, 1, 1, 1, 1,
-0.1821219, -0.4744143, -2.975131, 1, 1, 1, 1, 1,
-0.1779608, 0.9186566, -0.6542336, 1, 1, 1, 1, 1,
-0.1709081, 0.5003989, -0.06103899, 1, 1, 1, 1, 1,
-0.1693033, -0.6603981, -3.068254, 1, 1, 1, 1, 1,
-0.1659202, 0.0252525, -2.998264, 1, 1, 1, 1, 1,
-0.164227, 0.02343026, -3.291913, 1, 1, 1, 1, 1,
-0.1625555, -2.265555, -4.004382, 1, 1, 1, 1, 1,
-0.1563811, 0.6711829, 0.5227544, 1, 1, 1, 1, 1,
-0.1481993, 0.3133602, 1.010582, 1, 1, 1, 1, 1,
-0.1481011, 0.1239361, 1.570967, 1, 1, 1, 1, 1,
-0.1452408, 1.083254, -1.171447, 1, 1, 1, 1, 1,
-0.1311295, -0.7613458, -5.083735, 1, 1, 1, 1, 1,
-0.1300327, 0.5430254, 0.2798682, 0, 0, 1, 1, 1,
-0.1261996, 1.851145, 1.697656, 1, 0, 0, 1, 1,
-0.1237003, 2.224847, 0.2513328, 1, 0, 0, 1, 1,
-0.1236368, -0.1719803, -1.631868, 1, 0, 0, 1, 1,
-0.1163949, 1.385537, -1.039048, 1, 0, 0, 1, 1,
-0.1141243, -0.6344689, -1.649413, 1, 0, 0, 1, 1,
-0.1130088, 0.3572944, -0.0708781, 0, 0, 0, 1, 1,
-0.1122232, 0.7777489, -0.06644887, 0, 0, 0, 1, 1,
-0.1116092, -0.4594322, -4.358915, 0, 0, 0, 1, 1,
-0.1058043, 0.6637024, 0.8325012, 0, 0, 0, 1, 1,
-0.1030978, 0.2616921, 0.6949356, 0, 0, 0, 1, 1,
-0.09929436, 1.375151, 1.229752, 0, 0, 0, 1, 1,
-0.0975406, 0.7712164, 0.8320612, 0, 0, 0, 1, 1,
-0.08365793, 0.5754876, 0.6395196, 1, 1, 1, 1, 1,
-0.0789832, -0.4430989, -4.577516, 1, 1, 1, 1, 1,
-0.07834578, -0.8831754, -1.071962, 1, 1, 1, 1, 1,
-0.07114083, -1.191067, -2.186711, 1, 1, 1, 1, 1,
-0.06768695, 0.8435392, -1.175017, 1, 1, 1, 1, 1,
-0.06709061, 2.274974, -0.5580383, 1, 1, 1, 1, 1,
-0.06589341, 1.827382, -0.4919269, 1, 1, 1, 1, 1,
-0.05826791, 0.7129705, -1.94805, 1, 1, 1, 1, 1,
-0.05798404, -0.6268655, -2.44679, 1, 1, 1, 1, 1,
-0.0550723, 0.8901801, -1.311507, 1, 1, 1, 1, 1,
-0.05082809, -0.7288922, -1.154439, 1, 1, 1, 1, 1,
-0.0503445, -0.02001889, -0.6941307, 1, 1, 1, 1, 1,
-0.05023046, -0.2489433, -3.771875, 1, 1, 1, 1, 1,
-0.04809546, 2.361725, -0.9893349, 1, 1, 1, 1, 1,
-0.04748357, -0.1006584, -1.762339, 1, 1, 1, 1, 1,
-0.04719592, -0.707705, -2.255948, 0, 0, 1, 1, 1,
-0.04562577, 0.3522742, -0.2225378, 1, 0, 0, 1, 1,
-0.04369187, 0.9233539, -0.827539, 1, 0, 0, 1, 1,
-0.04253856, -0.1941371, -2.723937, 1, 0, 0, 1, 1,
-0.0409234, -1.094836, -2.331927, 1, 0, 0, 1, 1,
-0.03594903, 0.2469229, 0.1356362, 1, 0, 0, 1, 1,
-0.03383488, 1.280344, -0.2516033, 0, 0, 0, 1, 1,
-0.03313069, -0.2775985, -3.019055, 0, 0, 0, 1, 1,
-0.02974609, -0.2261801, -2.066583, 0, 0, 0, 1, 1,
-0.02828634, 0.1824535, 0.04216276, 0, 0, 0, 1, 1,
-0.02737154, -1.362694, -3.894145, 0, 0, 0, 1, 1,
-0.02415522, 1.420994, -0.8398845, 0, 0, 0, 1, 1,
-0.02308973, 0.6505401, -0.3833119, 0, 0, 0, 1, 1,
-0.02260046, 2.166917, -0.1626083, 1, 1, 1, 1, 1,
-0.02013539, -0.1823229, -3.111586, 1, 1, 1, 1, 1,
-0.0187441, -0.00180831, -0.7656941, 1, 1, 1, 1, 1,
-0.01839088, -0.5015246, -2.657989, 1, 1, 1, 1, 1,
-0.01332659, 0.4986553, -0.7845599, 1, 1, 1, 1, 1,
-0.0119645, -0.728173, -4.525375, 1, 1, 1, 1, 1,
-0.00808027, 0.03797706, 0.7549884, 1, 1, 1, 1, 1,
-0.007128946, -1.722427, -3.733552, 1, 1, 1, 1, 1,
0.0008125203, -1.030759, 1.911725, 1, 1, 1, 1, 1,
0.002409309, 0.8992171, 0.09938577, 1, 1, 1, 1, 1,
0.003520672, 0.6068389, -0.6628453, 1, 1, 1, 1, 1,
0.004732558, -0.07356241, 2.178157, 1, 1, 1, 1, 1,
0.007286297, -0.5182997, 2.102284, 1, 1, 1, 1, 1,
0.01245735, 0.6613184, 0.5090176, 1, 1, 1, 1, 1,
0.01688036, -0.8480165, 3.395494, 1, 1, 1, 1, 1,
0.01692678, -0.7175785, 2.370335, 0, 0, 1, 1, 1,
0.01779135, -2.336422, 3.384045, 1, 0, 0, 1, 1,
0.01946372, -1.231615, 2.781103, 1, 0, 0, 1, 1,
0.02255701, -0.1604006, 2.462833, 1, 0, 0, 1, 1,
0.02258782, -0.4707784, 1.300907, 1, 0, 0, 1, 1,
0.02354571, -0.8846253, 3.432731, 1, 0, 0, 1, 1,
0.02702389, 0.9243948, 0.6544049, 0, 0, 0, 1, 1,
0.03086205, -1.987219, 3.62104, 0, 0, 0, 1, 1,
0.0466015, 0.5859821, -1.465194, 0, 0, 0, 1, 1,
0.04829389, -1.315424, 3.373247, 0, 0, 0, 1, 1,
0.04922672, 1.044801, -0.4047438, 0, 0, 0, 1, 1,
0.04941723, -0.1980866, 2.141657, 0, 0, 0, 1, 1,
0.04953001, -0.1073286, 3.105303, 0, 0, 0, 1, 1,
0.05015369, 0.8182624, -1.136934, 1, 1, 1, 1, 1,
0.05068558, 0.06927493, 1.029282, 1, 1, 1, 1, 1,
0.05302573, -2.34302, 1.743634, 1, 1, 1, 1, 1,
0.05408012, 0.2021077, 0.3558303, 1, 1, 1, 1, 1,
0.05452216, -0.8297815, 2.08167, 1, 1, 1, 1, 1,
0.06236695, 0.1636364, 1.07325, 1, 1, 1, 1, 1,
0.06290543, 0.6147388, -0.6419388, 1, 1, 1, 1, 1,
0.0633545, 0.1195392, 2.504506, 1, 1, 1, 1, 1,
0.06443451, 0.2663082, 1.216467, 1, 1, 1, 1, 1,
0.06704578, -0.2858357, 4.664539, 1, 1, 1, 1, 1,
0.06891477, 0.9486517, 1.209527, 1, 1, 1, 1, 1,
0.07478102, 0.1338542, 1.723157, 1, 1, 1, 1, 1,
0.07797109, -0.1691776, 4.451644, 1, 1, 1, 1, 1,
0.07797587, -0.6560253, 1.812989, 1, 1, 1, 1, 1,
0.07882673, 1.204794, -0.2323262, 1, 1, 1, 1, 1,
0.08211023, -0.8361416, 2.497375, 0, 0, 1, 1, 1,
0.08265205, -0.6467329, 5.060461, 1, 0, 0, 1, 1,
0.08314794, -0.9567264, 2.237151, 1, 0, 0, 1, 1,
0.08596934, 0.4247868, 0.8268038, 1, 0, 0, 1, 1,
0.08679728, -0.002312997, 0.8917393, 1, 0, 0, 1, 1,
0.08696254, -0.2259916, 2.656874, 1, 0, 0, 1, 1,
0.0907725, -0.7127774, 4.03783, 0, 0, 0, 1, 1,
0.09817629, -0.8261074, 2.596527, 0, 0, 0, 1, 1,
0.09843612, 0.472743, -1.209836, 0, 0, 0, 1, 1,
0.09931584, -1.086659, 3.543361, 0, 0, 0, 1, 1,
0.1015191, 1.730862, -0.03789118, 0, 0, 0, 1, 1,
0.1045357, -1.127775, 2.985122, 0, 0, 0, 1, 1,
0.104696, 0.03184274, -0.8299322, 0, 0, 0, 1, 1,
0.1058822, -0.1604403, 3.278223, 1, 1, 1, 1, 1,
0.111566, 1.342014, 1.984968, 1, 1, 1, 1, 1,
0.1158713, -0.5602664, 2.540045, 1, 1, 1, 1, 1,
0.1161959, -0.01285915, 0.4712049, 1, 1, 1, 1, 1,
0.1163833, -0.8675348, 4.376555, 1, 1, 1, 1, 1,
0.116729, 0.5515182, -1.347899, 1, 1, 1, 1, 1,
0.1171153, -0.1522142, 4.5729, 1, 1, 1, 1, 1,
0.1194429, -0.2341362, 2.189558, 1, 1, 1, 1, 1,
0.1220298, -0.1964013, 3.884915, 1, 1, 1, 1, 1,
0.1221371, 0.4378534, 0.7163795, 1, 1, 1, 1, 1,
0.1236811, -0.510035, 2.413177, 1, 1, 1, 1, 1,
0.1237296, 1.75053, 0.934058, 1, 1, 1, 1, 1,
0.1266731, 0.5543358, 1.624311, 1, 1, 1, 1, 1,
0.1287748, -0.1516228, 2.454065, 1, 1, 1, 1, 1,
0.1289555, 0.5559802, 0.02258554, 1, 1, 1, 1, 1,
0.1324307, -0.4533214, 2.726205, 0, 0, 1, 1, 1,
0.1325732, 0.198633, 0.2333341, 1, 0, 0, 1, 1,
0.1338081, 0.1339003, 2.206511, 1, 0, 0, 1, 1,
0.1343117, -2.294712, 3.167981, 1, 0, 0, 1, 1,
0.1347717, 0.3907667, 0.4593075, 1, 0, 0, 1, 1,
0.1382159, 0.4405861, 0.8517543, 1, 0, 0, 1, 1,
0.1385741, 0.2354388, 0.8576649, 0, 0, 0, 1, 1,
0.1389944, 0.5316645, 0.6363916, 0, 0, 0, 1, 1,
0.1416425, -0.6853724, 3.071362, 0, 0, 0, 1, 1,
0.1426635, -0.179336, 0.6364484, 0, 0, 0, 1, 1,
0.148009, -0.6150067, 1.648402, 0, 0, 0, 1, 1,
0.148599, -0.803335, 3.36045, 0, 0, 0, 1, 1,
0.1498595, 0.134882, -1.18472, 0, 0, 0, 1, 1,
0.1543844, -0.4001262, 4.24143, 1, 1, 1, 1, 1,
0.1558834, 0.1310275, 0.08992424, 1, 1, 1, 1, 1,
0.1581319, 1.749616, -0.338471, 1, 1, 1, 1, 1,
0.1637797, -0.4996511, 3.71953, 1, 1, 1, 1, 1,
0.166088, 1.167017, 1.370144, 1, 1, 1, 1, 1,
0.1662833, 0.9837362, -0.09334195, 1, 1, 1, 1, 1,
0.1694691, 0.6461827, -1.749833, 1, 1, 1, 1, 1,
0.1724559, 2.178435, -1.456593, 1, 1, 1, 1, 1,
0.1763502, 0.8592625, 0.07167963, 1, 1, 1, 1, 1,
0.1856502, -0.344889, 1.995886, 1, 1, 1, 1, 1,
0.186543, -0.1821605, 2.661327, 1, 1, 1, 1, 1,
0.1870777, -0.8875791, 2.943636, 1, 1, 1, 1, 1,
0.1872937, -0.821771, 4.361387, 1, 1, 1, 1, 1,
0.1961175, -0.4734817, 3.349067, 1, 1, 1, 1, 1,
0.1976006, 0.9210599, 0.6762352, 1, 1, 1, 1, 1,
0.2024858, -0.9139597, 4.168211, 0, 0, 1, 1, 1,
0.2075486, -0.7756314, 3.194623, 1, 0, 0, 1, 1,
0.2101255, -1.486072, 4.165629, 1, 0, 0, 1, 1,
0.2112292, -0.1399477, 0.7900503, 1, 0, 0, 1, 1,
0.2137529, -0.4827129, 2.299769, 1, 0, 0, 1, 1,
0.2162585, 0.2468439, 1.253686, 1, 0, 0, 1, 1,
0.2163453, 0.2846405, 0.7274693, 0, 0, 0, 1, 1,
0.220714, 1.773339, 1.157227, 0, 0, 0, 1, 1,
0.2276073, -1.657041, 3.733077, 0, 0, 0, 1, 1,
0.2278126, 0.105976, 1.82388, 0, 0, 0, 1, 1,
0.2316981, -0.4928965, 3.56825, 0, 0, 0, 1, 1,
0.2326579, 0.5552114, 0.170296, 0, 0, 0, 1, 1,
0.2368449, 0.1251561, -0.2114922, 0, 0, 0, 1, 1,
0.2382904, -1.519854, 1.163673, 1, 1, 1, 1, 1,
0.2392689, -1.11059, 2.229692, 1, 1, 1, 1, 1,
0.2430779, -1.984955, 4.299794, 1, 1, 1, 1, 1,
0.2453195, 1.925013, -0.3980009, 1, 1, 1, 1, 1,
0.2495562, 0.04527946, 1.294345, 1, 1, 1, 1, 1,
0.2567735, -0.6928189, 2.935373, 1, 1, 1, 1, 1,
0.2623523, 0.8776733, 1.172523, 1, 1, 1, 1, 1,
0.2625613, 0.7063437, 1.592171, 1, 1, 1, 1, 1,
0.266757, -1.180806, 1.967207, 1, 1, 1, 1, 1,
0.2712435, -0.2860776, 2.049081, 1, 1, 1, 1, 1,
0.2843593, -0.7108475, 5.156879, 1, 1, 1, 1, 1,
0.2856409, 0.3566003, 1.944693, 1, 1, 1, 1, 1,
0.2866536, 2.007797, 1.205482, 1, 1, 1, 1, 1,
0.291151, 1.034487, 0.6119522, 1, 1, 1, 1, 1,
0.2924253, -2.186585, 3.661438, 1, 1, 1, 1, 1,
0.2925241, -0.1144171, 2.590956, 0, 0, 1, 1, 1,
0.2928547, 0.4030021, 0.5635554, 1, 0, 0, 1, 1,
0.2993049, 1.662241, 0.1882745, 1, 0, 0, 1, 1,
0.3032236, -0.5594581, 2.680806, 1, 0, 0, 1, 1,
0.3056858, -1.190329, 2.154115, 1, 0, 0, 1, 1,
0.314047, -0.1605919, 2.908293, 1, 0, 0, 1, 1,
0.3153296, -1.453837, 1.529984, 0, 0, 0, 1, 1,
0.317513, 0.3097855, 1.109862, 0, 0, 0, 1, 1,
0.3205385, 0.0001861711, -0.1357057, 0, 0, 0, 1, 1,
0.340584, 0.518208, 1.311686, 0, 0, 0, 1, 1,
0.3468505, 0.1259793, 1.466337, 0, 0, 0, 1, 1,
0.3472352, -0.7220752, 2.819903, 0, 0, 0, 1, 1,
0.3474698, -0.4386826, 2.780814, 0, 0, 0, 1, 1,
0.3504152, -0.475333, 2.704401, 1, 1, 1, 1, 1,
0.3541462, -1.473901, 3.74084, 1, 1, 1, 1, 1,
0.3625712, -0.4062003, 1.749635, 1, 1, 1, 1, 1,
0.3629939, -1.60347, 2.445431, 1, 1, 1, 1, 1,
0.3654773, -0.3499187, 1.774887, 1, 1, 1, 1, 1,
0.3666504, -0.8697293, 4.502406, 1, 1, 1, 1, 1,
0.3676469, 0.3829261, 1.139472, 1, 1, 1, 1, 1,
0.3684233, -1.798265, 3.400164, 1, 1, 1, 1, 1,
0.3715647, -0.1152134, 1.335945, 1, 1, 1, 1, 1,
0.3768685, -0.06178237, 2.897871, 1, 1, 1, 1, 1,
0.3796532, -0.9827535, 3.478842, 1, 1, 1, 1, 1,
0.3808539, -0.176168, 0.9536523, 1, 1, 1, 1, 1,
0.3823071, -1.280105, 1.893905, 1, 1, 1, 1, 1,
0.3833747, 0.9278398, 0.354167, 1, 1, 1, 1, 1,
0.38495, 1.212711, 1.020376, 1, 1, 1, 1, 1,
0.3850022, -0.1782231, 4.272029, 0, 0, 1, 1, 1,
0.3853586, 1.108856, 0.7060735, 1, 0, 0, 1, 1,
0.3857493, 0.3629358, 0.1444345, 1, 0, 0, 1, 1,
0.3875206, 0.1057243, 0.9569732, 1, 0, 0, 1, 1,
0.3946629, -1.302615, 2.694328, 1, 0, 0, 1, 1,
0.4041685, -0.9297789, 1.087219, 1, 0, 0, 1, 1,
0.4130536, -0.980012, 2.297056, 0, 0, 0, 1, 1,
0.4132926, 0.846365, 0.9126841, 0, 0, 0, 1, 1,
0.4247973, -0.09370002, 1.346519, 0, 0, 0, 1, 1,
0.4343034, -0.01641998, 2.076673, 0, 0, 0, 1, 1,
0.4426989, -1.171144, 3.580933, 0, 0, 0, 1, 1,
0.4454611, -1.368198, 2.046462, 0, 0, 0, 1, 1,
0.4455481, 0.3459912, 0.9641162, 0, 0, 0, 1, 1,
0.4457034, -0.1967933, 1.734532, 1, 1, 1, 1, 1,
0.4462839, 1.584366, 0.5372041, 1, 1, 1, 1, 1,
0.448256, 0.09668826, 2.505109, 1, 1, 1, 1, 1,
0.4502034, -0.01287945, 1.50006, 1, 1, 1, 1, 1,
0.4536758, -1.131937, 2.880046, 1, 1, 1, 1, 1,
0.4554885, -0.3144155, 2.065231, 1, 1, 1, 1, 1,
0.4556563, -0.8141349, 2.000978, 1, 1, 1, 1, 1,
0.4565187, -0.1876741, -0.4027582, 1, 1, 1, 1, 1,
0.4601152, 1.618429, -0.6956767, 1, 1, 1, 1, 1,
0.4607685, 1.348722, 1.145132, 1, 1, 1, 1, 1,
0.4637389, -0.2546719, 1.772136, 1, 1, 1, 1, 1,
0.4665788, 0.7491556, 1.758288, 1, 1, 1, 1, 1,
0.4667971, -0.6931823, 3.376714, 1, 1, 1, 1, 1,
0.4684421, -0.3512923, 1.80666, 1, 1, 1, 1, 1,
0.4705545, 1.915211, -0.2290637, 1, 1, 1, 1, 1,
0.4721908, -1.139439, 1.353422, 0, 0, 1, 1, 1,
0.4751867, 1.232107, 0.7152944, 1, 0, 0, 1, 1,
0.4752516, -0.5231722, 4.069839, 1, 0, 0, 1, 1,
0.4766852, -0.6476448, 2.535198, 1, 0, 0, 1, 1,
0.4784798, 0.6089376, 0.06658591, 1, 0, 0, 1, 1,
0.4852855, 0.1846289, 0.9682665, 1, 0, 0, 1, 1,
0.4869428, -1.708931, 2.20043, 0, 0, 0, 1, 1,
0.4895768, -1.525151, 1.587297, 0, 0, 0, 1, 1,
0.489967, 0.25466, 2.248043, 0, 0, 0, 1, 1,
0.4903073, 1.487599, 1.032937, 0, 0, 0, 1, 1,
0.4972632, -0.6497886, 3.590726, 0, 0, 0, 1, 1,
0.5019905, -1.73585, 2.77145, 0, 0, 0, 1, 1,
0.5040516, 1.330849, 0.6939884, 0, 0, 0, 1, 1,
0.5104927, -0.7177804, 4.951504, 1, 1, 1, 1, 1,
0.5121779, 1.726559, 0.4648909, 1, 1, 1, 1, 1,
0.5260761, -0.02155922, 1.103756, 1, 1, 1, 1, 1,
0.5294939, 1.99695, -0.2868261, 1, 1, 1, 1, 1,
0.5305896, 0.0291116, 2.339929, 1, 1, 1, 1, 1,
0.5319167, -0.006575779, 3.025182, 1, 1, 1, 1, 1,
0.5326722, 0.2002736, -0.1975516, 1, 1, 1, 1, 1,
0.532724, -0.5275987, 3.857903, 1, 1, 1, 1, 1,
0.5361488, 0.3002459, 1.420978, 1, 1, 1, 1, 1,
0.5386625, -1.146302, 2.834081, 1, 1, 1, 1, 1,
0.5392588, 0.8448781, 0.4486029, 1, 1, 1, 1, 1,
0.5402842, 0.006633384, 2.685115, 1, 1, 1, 1, 1,
0.541908, -0.4741571, 3.343143, 1, 1, 1, 1, 1,
0.5424734, 0.3366973, 0.8381314, 1, 1, 1, 1, 1,
0.5432386, 0.9124203, 0.3327487, 1, 1, 1, 1, 1,
0.5489674, -0.2969525, 2.547764, 0, 0, 1, 1, 1,
0.5546276, 1.261525, -0.08811523, 1, 0, 0, 1, 1,
0.5549262, 1.326286, 1.730916, 1, 0, 0, 1, 1,
0.5559431, 0.05345461, 1.09037, 1, 0, 0, 1, 1,
0.5564257, 0.1009913, 1.611736, 1, 0, 0, 1, 1,
0.5608773, -0.7048864, 3.534388, 1, 0, 0, 1, 1,
0.56618, 1.428519, 2.05576, 0, 0, 0, 1, 1,
0.5665482, 0.1033528, -0.1823345, 0, 0, 0, 1, 1,
0.5701528, 0.4715984, -0.1787794, 0, 0, 0, 1, 1,
0.5702572, 0.2945851, 0.2910709, 0, 0, 0, 1, 1,
0.5810567, -0.2423255, 1.030311, 0, 0, 0, 1, 1,
0.5820664, -0.2548649, 1.392227, 0, 0, 0, 1, 1,
0.5826881, 0.2118692, 1.715369, 0, 0, 0, 1, 1,
0.5855154, 0.8437515, -0.6985529, 1, 1, 1, 1, 1,
0.5857159, -0.4522365, 1.546343, 1, 1, 1, 1, 1,
0.5879967, 0.1123959, 3.074202, 1, 1, 1, 1, 1,
0.5891791, -1.376379, 1.957923, 1, 1, 1, 1, 1,
0.591071, -0.2755597, 0.9224011, 1, 1, 1, 1, 1,
0.5916211, 2.398711, -0.8326058, 1, 1, 1, 1, 1,
0.5918812, -0.7891842, 3.770746, 1, 1, 1, 1, 1,
0.5931323, 1.620168, 0.7990586, 1, 1, 1, 1, 1,
0.5935787, 1.529173, -0.1824931, 1, 1, 1, 1, 1,
0.5939352, -0.3292661, 2.257368, 1, 1, 1, 1, 1,
0.6009552, 0.5563483, -0.6397492, 1, 1, 1, 1, 1,
0.6045794, 0.6179669, 0.7913519, 1, 1, 1, 1, 1,
0.6069517, 0.6136668, -0.1866666, 1, 1, 1, 1, 1,
0.6070387, -1.036925, 3.869068, 1, 1, 1, 1, 1,
0.6148159, -1.515459, 1.68736, 1, 1, 1, 1, 1,
0.6157703, -0.5462162, 3.410863, 0, 0, 1, 1, 1,
0.6158183, -1.296833, 1.051798, 1, 0, 0, 1, 1,
0.61806, -0.8814539, 1.705783, 1, 0, 0, 1, 1,
0.6183078, 1.506435, -1.051722, 1, 0, 0, 1, 1,
0.6234277, 0.06408344, -1.05697, 1, 0, 0, 1, 1,
0.6260349, -0.2934965, 1.70127, 1, 0, 0, 1, 1,
0.6260715, 0.6970002, 0.3013631, 0, 0, 0, 1, 1,
0.6267831, 0.7980459, 1.40413, 0, 0, 0, 1, 1,
0.6273592, 0.2170071, 1.222912, 0, 0, 0, 1, 1,
0.6416976, 1.152962, 0.03344551, 0, 0, 0, 1, 1,
0.6439447, 0.9823986, -0.01335373, 0, 0, 0, 1, 1,
0.6464746, 0.3251175, -0.1178112, 0, 0, 0, 1, 1,
0.6470016, 0.9144427, -0.7604916, 0, 0, 0, 1, 1,
0.6522316, 1.655651, 0.7089937, 1, 1, 1, 1, 1,
0.6595218, 1.320488, -0.4906686, 1, 1, 1, 1, 1,
0.6651909, 0.4483611, -0.3248647, 1, 1, 1, 1, 1,
0.6666176, -1.129463, 3.327768, 1, 1, 1, 1, 1,
0.6672346, 0.2041253, 1.695873, 1, 1, 1, 1, 1,
0.6674512, -0.8226891, 2.057219, 1, 1, 1, 1, 1,
0.6763635, 0.7783229, -0.02487915, 1, 1, 1, 1, 1,
0.6778647, -0.2000113, 0.4494492, 1, 1, 1, 1, 1,
0.6839422, 0.4716699, 1.841742, 1, 1, 1, 1, 1,
0.684626, 2.164241, -0.5734861, 1, 1, 1, 1, 1,
0.6886746, 0.9197752, 1.199546, 1, 1, 1, 1, 1,
0.6886804, -0.9229721, 2.609128, 1, 1, 1, 1, 1,
0.6889592, -0.5265746, 2.42535, 1, 1, 1, 1, 1,
0.6895577, -1.253609, 3.719774, 1, 1, 1, 1, 1,
0.6898525, 1.137166, 0.9445681, 1, 1, 1, 1, 1,
0.696047, -0.8696957, 4.306694, 0, 0, 1, 1, 1,
0.7001494, -0.7238174, 4.255371, 1, 0, 0, 1, 1,
0.7030305, 0.5223316, 1.298217, 1, 0, 0, 1, 1,
0.7057872, -0.6733486, 1.956972, 1, 0, 0, 1, 1,
0.7106308, -0.3479156, 3.556257, 1, 0, 0, 1, 1,
0.7132422, 0.3271116, 0.9597853, 1, 0, 0, 1, 1,
0.7134017, 1.076415, -0.7799214, 0, 0, 0, 1, 1,
0.7225274, -0.169111, 2.570988, 0, 0, 0, 1, 1,
0.7261317, 1.94778, -1.406021, 0, 0, 0, 1, 1,
0.7434123, 0.4546623, 0.4831949, 0, 0, 0, 1, 1,
0.7447843, 1.065063, -0.5465927, 0, 0, 0, 1, 1,
0.7462462, 0.9193562, 0.620517, 0, 0, 0, 1, 1,
0.7506639, 0.7031929, 0.3623902, 0, 0, 0, 1, 1,
0.7548529, -1.546128, 3.173068, 1, 1, 1, 1, 1,
0.7548694, 0.6144908, 2.583036, 1, 1, 1, 1, 1,
0.7665001, 0.6634546, 1.520981, 1, 1, 1, 1, 1,
0.7670093, -1.618262, 2.296355, 1, 1, 1, 1, 1,
0.7691952, -0.2835391, 3.145344, 1, 1, 1, 1, 1,
0.7720165, -0.08904683, 2.835397, 1, 1, 1, 1, 1,
0.7762945, -1.646464, 2.239508, 1, 1, 1, 1, 1,
0.7775086, 0.2400467, 1.575086, 1, 1, 1, 1, 1,
0.7801247, 0.2106624, 1.382224, 1, 1, 1, 1, 1,
0.7846788, -0.9984736, 4.748586, 1, 1, 1, 1, 1,
0.7855687, 0.7647776, -1.428588, 1, 1, 1, 1, 1,
0.7889385, 0.07843988, 1.709842, 1, 1, 1, 1, 1,
0.789052, 1.451928, -0.90865, 1, 1, 1, 1, 1,
0.7963113, 1.679181, 0.1968695, 1, 1, 1, 1, 1,
0.7995904, 0.405004, -0.03565845, 1, 1, 1, 1, 1,
0.8029147, 0.1554715, 2.656598, 0, 0, 1, 1, 1,
0.8061599, -0.2152191, 0.7897094, 1, 0, 0, 1, 1,
0.8073428, 0.4553623, -0.2862448, 1, 0, 0, 1, 1,
0.8085536, 0.810256, 1.759515, 1, 0, 0, 1, 1,
0.8117392, -0.9329625, 1.504804, 1, 0, 0, 1, 1,
0.8175365, 1.082568, -0.2330341, 1, 0, 0, 1, 1,
0.8228677, 1.344468, 0.5465297, 0, 0, 0, 1, 1,
0.8252649, -0.2751927, 3.269162, 0, 0, 0, 1, 1,
0.8262981, 0.3551604, 0.1310973, 0, 0, 0, 1, 1,
0.8284587, 0.6542213, 1.597634, 0, 0, 0, 1, 1,
0.831558, -0.1119417, 2.670404, 0, 0, 0, 1, 1,
0.8316249, 0.4887222, 2.088495, 0, 0, 0, 1, 1,
0.8386087, -0.0251384, 1.993997, 0, 0, 0, 1, 1,
0.8459622, -1.23022, 3.913164, 1, 1, 1, 1, 1,
0.8553412, -3.202916, 2.582315, 1, 1, 1, 1, 1,
0.8562791, -0.3816786, 2.779813, 1, 1, 1, 1, 1,
0.8576146, 1.060255, -0.3426031, 1, 1, 1, 1, 1,
0.8626923, 0.09026681, 2.760641, 1, 1, 1, 1, 1,
0.8631999, 0.9852341, 0.9599336, 1, 1, 1, 1, 1,
0.8676199, -0.7200465, 3.054572, 1, 1, 1, 1, 1,
0.8694011, -3.154546, 2.574675, 1, 1, 1, 1, 1,
0.8700272, -0.5826289, 2.641752, 1, 1, 1, 1, 1,
0.8735364, -0.03126058, 0.2976221, 1, 1, 1, 1, 1,
0.8794588, -0.06903565, 3.145834, 1, 1, 1, 1, 1,
0.8795866, 0.7444, 0.236695, 1, 1, 1, 1, 1,
0.8932148, -0.2843059, 1.537115, 1, 1, 1, 1, 1,
0.8945236, -1.317876, 1.822034, 1, 1, 1, 1, 1,
0.8987271, -1.201109, 0.6161221, 1, 1, 1, 1, 1,
0.9021946, 0.7846908, -0.7352546, 0, 0, 1, 1, 1,
0.9038939, -0.5321761, 1.527073, 1, 0, 0, 1, 1,
0.9056649, -0.4625109, 2.171816, 1, 0, 0, 1, 1,
0.9141759, -2.068881, 3.128831, 1, 0, 0, 1, 1,
0.9153082, -0.7175094, 3.844156, 1, 0, 0, 1, 1,
0.9160531, 0.03161351, 3.44023, 1, 0, 0, 1, 1,
0.9176366, 1.140524, 1.121735, 0, 0, 0, 1, 1,
0.9178988, -0.3752373, 2.719858, 0, 0, 0, 1, 1,
0.918677, 0.159808, 0.8597012, 0, 0, 0, 1, 1,
0.9187703, -1.50339, 2.818483, 0, 0, 0, 1, 1,
0.9192613, 1.756771, 1.629216, 0, 0, 0, 1, 1,
0.9204153, -0.9712937, 2.788768, 0, 0, 0, 1, 1,
0.9214071, 0.05552015, 0.06432881, 0, 0, 0, 1, 1,
0.9240272, -1.783185, 0.910477, 1, 1, 1, 1, 1,
0.9241152, -0.91495, 2.105676, 1, 1, 1, 1, 1,
0.9307422, -0.4248295, 3.684734, 1, 1, 1, 1, 1,
0.9394343, -0.2028645, 1.510385, 1, 1, 1, 1, 1,
0.9440444, -0.5050237, 1.105703, 1, 1, 1, 1, 1,
0.9549571, -0.1383796, 0.5322115, 1, 1, 1, 1, 1,
0.9586373, -1.547865, 3.724423, 1, 1, 1, 1, 1,
0.9613741, -0.06597115, 1.977656, 1, 1, 1, 1, 1,
0.9619386, -0.8799822, 2.836328, 1, 1, 1, 1, 1,
0.96314, 0.4072743, 0.1990696, 1, 1, 1, 1, 1,
0.9670855, -1.627747, 1.38557, 1, 1, 1, 1, 1,
0.9725376, -0.603866, 1.570387, 1, 1, 1, 1, 1,
0.9806305, -0.55812, 1.668631, 1, 1, 1, 1, 1,
0.9810255, 0.7150565, -0.7318106, 1, 1, 1, 1, 1,
0.9874601, -1.141051, 2.180871, 1, 1, 1, 1, 1,
0.9903536, 0.6599735, 2.026419, 0, 0, 1, 1, 1,
1.001006, -1.128893, 2.754075, 1, 0, 0, 1, 1,
1.003002, 0.01253107, 1.286012, 1, 0, 0, 1, 1,
1.006477, 0.3800551, 1.866784, 1, 0, 0, 1, 1,
1.007535, -0.3063795, 1.114618, 1, 0, 0, 1, 1,
1.014908, -0.1878657, 0.8491219, 1, 0, 0, 1, 1,
1.024217, 1.123755, 1.969982, 0, 0, 0, 1, 1,
1.027636, -1.032721, 0.590251, 0, 0, 0, 1, 1,
1.028125, 1.104502, 1.468045, 0, 0, 0, 1, 1,
1.028761, -1.164857, 3.796101, 0, 0, 0, 1, 1,
1.030328, -1.607674, 2.390906, 0, 0, 0, 1, 1,
1.037584, 1.741006, -0.6024278, 0, 0, 0, 1, 1,
1.03774, 1.302435, 1.32134, 0, 0, 0, 1, 1,
1.049434, -1.611977, 3.411775, 1, 1, 1, 1, 1,
1.05111, 0.1538777, 2.246682, 1, 1, 1, 1, 1,
1.053721, -0.5408002, 2.819653, 1, 1, 1, 1, 1,
1.058455, 0.838319, 0.5556545, 1, 1, 1, 1, 1,
1.061458, 1.802025, 2.359281, 1, 1, 1, 1, 1,
1.067377, 0.7098075, 0.4723371, 1, 1, 1, 1, 1,
1.067502, 0.4621113, 2.817041, 1, 1, 1, 1, 1,
1.067983, -1.436058, 1.194387, 1, 1, 1, 1, 1,
1.069349, -0.3955471, 2.510803, 1, 1, 1, 1, 1,
1.080512, -0.2311339, 4.166646, 1, 1, 1, 1, 1,
1.085391, -0.2367267, 2.451925, 1, 1, 1, 1, 1,
1.087284, 1.111494, 0.6704065, 1, 1, 1, 1, 1,
1.088415, -1.660058, 3.584337, 1, 1, 1, 1, 1,
1.103185, -1.149877, 3.222166, 1, 1, 1, 1, 1,
1.103265, -0.3309401, 1.510415, 1, 1, 1, 1, 1,
1.120187, 1.825354, 0.4629605, 0, 0, 1, 1, 1,
1.123678, -1.098861, 2.268298, 1, 0, 0, 1, 1,
1.123797, 0.5267505, 1.757503, 1, 0, 0, 1, 1,
1.127321, -0.08803448, 2.357283, 1, 0, 0, 1, 1,
1.131816, -0.3074368, 1.24008, 1, 0, 0, 1, 1,
1.137645, -0.5380722, 3.390854, 1, 0, 0, 1, 1,
1.140014, -0.7553802, 2.16792, 0, 0, 0, 1, 1,
1.150769, 0.5109961, -0.05606014, 0, 0, 0, 1, 1,
1.158208, 0.8986738, 1.509812, 0, 0, 0, 1, 1,
1.164149, 0.3465272, 0.9805405, 0, 0, 0, 1, 1,
1.175573, 0.7230045, 0.2072024, 0, 0, 0, 1, 1,
1.179155, 0.589976, -0.2695302, 0, 0, 0, 1, 1,
1.213211, -1.803329, 1.941241, 0, 0, 0, 1, 1,
1.2177, -0.9428366, 3.504914, 1, 1, 1, 1, 1,
1.218794, 0.35379, 0.4585131, 1, 1, 1, 1, 1,
1.227428, 0.695397, 2.333394, 1, 1, 1, 1, 1,
1.232212, 0.5923665, 1.747928, 1, 1, 1, 1, 1,
1.23583, -2.429492, 1.248292, 1, 1, 1, 1, 1,
1.256329, 0.1766345, 2.227326, 1, 1, 1, 1, 1,
1.257137, 0.3103833, 1.192623, 1, 1, 1, 1, 1,
1.257451, -1.267936, 1.515494, 1, 1, 1, 1, 1,
1.258279, -2.028641, 2.932833, 1, 1, 1, 1, 1,
1.261966, -0.5682448, 2.299136, 1, 1, 1, 1, 1,
1.264132, 0.7835314, 0.1034126, 1, 1, 1, 1, 1,
1.265966, -0.4336072, 1.690511, 1, 1, 1, 1, 1,
1.266339, 1.144888, 1.521444, 1, 1, 1, 1, 1,
1.272508, -0.356097, 2.421652, 1, 1, 1, 1, 1,
1.276247, 0.3470757, 1.708204, 1, 1, 1, 1, 1,
1.277469, 1.364025, 1.74141, 0, 0, 1, 1, 1,
1.284225, 0.9212874, 0.8209133, 1, 0, 0, 1, 1,
1.288627, -0.8208128, 3.327328, 1, 0, 0, 1, 1,
1.291458, 0.5506244, -0.9552538, 1, 0, 0, 1, 1,
1.300312, -1.065673, 3.1036, 1, 0, 0, 1, 1,
1.313938, -0.4780412, 1.234885, 1, 0, 0, 1, 1,
1.316346, 0.3358354, 2.498912, 0, 0, 0, 1, 1,
1.327783, 0.7950609, 2.175718, 0, 0, 0, 1, 1,
1.332834, -0.5288311, 2.108243, 0, 0, 0, 1, 1,
1.354654, -0.1402423, 2.666658, 0, 0, 0, 1, 1,
1.360865, -0.06479014, -0.9954137, 0, 0, 0, 1, 1,
1.363619, -1.950137, 0.942337, 0, 0, 0, 1, 1,
1.364798, -1.134147, 4.116105, 0, 0, 0, 1, 1,
1.373646, -1.170913, 2.296556, 1, 1, 1, 1, 1,
1.375061, 0.08672312, 2.15513, 1, 1, 1, 1, 1,
1.392312, -1.933288, 1.755434, 1, 1, 1, 1, 1,
1.39371, -1.435604, 4.001826, 1, 1, 1, 1, 1,
1.399107, 0.03232944, 1.895462, 1, 1, 1, 1, 1,
1.4002, 0.6289241, 0.4283593, 1, 1, 1, 1, 1,
1.404189, -0.5933309, 3.261978, 1, 1, 1, 1, 1,
1.432756, -1.17857, 0.6375887, 1, 1, 1, 1, 1,
1.434006, -0.05763582, 2.880366, 1, 1, 1, 1, 1,
1.440371, 0.7807511, -0.06150524, 1, 1, 1, 1, 1,
1.441042, -0.8966441, 3.040404, 1, 1, 1, 1, 1,
1.441777, 2.083705, -0.09720597, 1, 1, 1, 1, 1,
1.444098, 0.6101698, 1.630157, 1, 1, 1, 1, 1,
1.445764, -0.1481617, 1.489011, 1, 1, 1, 1, 1,
1.464202, 1.072181, 2.449571, 1, 1, 1, 1, 1,
1.473836, 0.3140937, 0.5072336, 0, 0, 1, 1, 1,
1.474582, 1.226018, -0.02059094, 1, 0, 0, 1, 1,
1.475193, -0.8573721, 3.036116, 1, 0, 0, 1, 1,
1.496867, 1.359317, 0.4438296, 1, 0, 0, 1, 1,
1.502873, -0.009438191, 0.7162117, 1, 0, 0, 1, 1,
1.507896, 0.2182468, 1.907624, 1, 0, 0, 1, 1,
1.519156, -0.4857421, 2.277343, 0, 0, 0, 1, 1,
1.5215, 0.8289933, 2.143306, 0, 0, 0, 1, 1,
1.523571, -0.07740983, 1.614869, 0, 0, 0, 1, 1,
1.529986, -1.327259, 2.971347, 0, 0, 0, 1, 1,
1.538758, 1.259759, 0.1340279, 0, 0, 0, 1, 1,
1.540407, -0.7938726, 1.929292, 0, 0, 0, 1, 1,
1.541458, 0.2437368, 1.050594, 0, 0, 0, 1, 1,
1.551343, -0.1253729, 1.096447, 1, 1, 1, 1, 1,
1.556198, -0.201739, 1.603038, 1, 1, 1, 1, 1,
1.566611, -0.6593556, 0.758386, 1, 1, 1, 1, 1,
1.569103, 0.5490482, 0.6939132, 1, 1, 1, 1, 1,
1.573652, -2.304561, 1.453528, 1, 1, 1, 1, 1,
1.574003, 0.7270862, 1.144603, 1, 1, 1, 1, 1,
1.5804, 1.156865, 0.7004142, 1, 1, 1, 1, 1,
1.584648, -0.4559541, 1.583531, 1, 1, 1, 1, 1,
1.586639, -0.4094508, 1.820082, 1, 1, 1, 1, 1,
1.605317, -1.168079, 2.087853, 1, 1, 1, 1, 1,
1.613518, 0.6720548, 4.009033, 1, 1, 1, 1, 1,
1.615018, 2.697416, 2.090032, 1, 1, 1, 1, 1,
1.629526, -0.07155793, 0.3844104, 1, 1, 1, 1, 1,
1.641747, -2.001999, 1.558056, 1, 1, 1, 1, 1,
1.643517, -0.1714794, 2.009403, 1, 1, 1, 1, 1,
1.651988, -0.4437344, 1.24797, 0, 0, 1, 1, 1,
1.675048, -0.7568809, 1.278175, 1, 0, 0, 1, 1,
1.693371, 0.4245501, 1.287108, 1, 0, 0, 1, 1,
1.702095, -1.049034, 4.173692, 1, 0, 0, 1, 1,
1.752039, 0.5151215, 1.208812, 1, 0, 0, 1, 1,
1.758771, 0.1224262, 3.164736, 1, 0, 0, 1, 1,
1.789857, -0.4301859, 3.141246, 0, 0, 0, 1, 1,
1.809534, -1.334198, 3.078196, 0, 0, 0, 1, 1,
1.819579, -1.103547, 2.676152, 0, 0, 0, 1, 1,
1.821491, -0.7248836, 1.301375, 0, 0, 0, 1, 1,
1.830936, 2.812027, -0.3494544, 0, 0, 0, 1, 1,
1.880278, -0.9278166, 2.351642, 0, 0, 0, 1, 1,
1.886681, 1.136202, 0.8077976, 0, 0, 0, 1, 1,
1.973183, -0.08123285, 1.656255, 1, 1, 1, 1, 1,
1.973716, -1.027513, 1.492105, 1, 1, 1, 1, 1,
1.995204, 0.1556324, 2.479661, 1, 1, 1, 1, 1,
1.999101, -1.132552, 1.761527, 1, 1, 1, 1, 1,
2.006711, 1.371967, 0.6426408, 1, 1, 1, 1, 1,
2.021732, -1.389495, 1.480483, 1, 1, 1, 1, 1,
2.047484, -0.7666479, 3.236471, 1, 1, 1, 1, 1,
2.06654, 0.3750225, 0.7109488, 1, 1, 1, 1, 1,
2.072446, 0.4544704, 0.3244521, 1, 1, 1, 1, 1,
2.085102, 1.293077, -0.06335137, 1, 1, 1, 1, 1,
2.095768, -0.1682309, 2.892343, 1, 1, 1, 1, 1,
2.115009, 0.1567368, 1.475669, 1, 1, 1, 1, 1,
2.115238, 0.1621885, 1.910346, 1, 1, 1, 1, 1,
2.115993, 0.3685111, 0.08408642, 1, 1, 1, 1, 1,
2.123519, -1.493863, 1.755937, 1, 1, 1, 1, 1,
2.132383, -1.645148, 1.354131, 0, 0, 1, 1, 1,
2.135256, 0.420033, 2.129722, 1, 0, 0, 1, 1,
2.136997, -1.404494, 1.367358, 1, 0, 0, 1, 1,
2.154023, 0.07700453, 1.70137, 1, 0, 0, 1, 1,
2.154325, -0.207406, 1.794083, 1, 0, 0, 1, 1,
2.170237, 0.216408, 2.169697, 1, 0, 0, 1, 1,
2.20523, -0.780026, 3.564227, 0, 0, 0, 1, 1,
2.20523, -0.3516015, 1.001247, 0, 0, 0, 1, 1,
2.244505, 1.871366, 1.873626, 0, 0, 0, 1, 1,
2.320397, -0.8016022, 0.7491695, 0, 0, 0, 1, 1,
2.36066, 0.9597258, -0.499358, 0, 0, 0, 1, 1,
2.391024, -1.789345, 1.399781, 0, 0, 0, 1, 1,
2.399249, -1.213405, 1.559587, 0, 0, 0, 1, 1,
2.479465, -0.1639586, 2.979885, 1, 1, 1, 1, 1,
2.504286, -1.005354, 2.598806, 1, 1, 1, 1, 1,
2.552041, -1.507395, 2.362231, 1, 1, 1, 1, 1,
2.590379, 0.7029478, 2.067572, 1, 1, 1, 1, 1,
2.626352, 0.3673941, 1.354493, 1, 1, 1, 1, 1,
2.812008, -1.093346, 1.756897, 1, 1, 1, 1, 1,
2.939315, -1.027631, 2.068328, 1, 1, 1, 1, 1
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
var radius = 9.530981;
var distance = 33.47717;
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
mvMatrix.translate( 0.1239976, 0.02249765, 0.1981912 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47717);
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
