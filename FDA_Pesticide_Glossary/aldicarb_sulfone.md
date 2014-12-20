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
-3.975974, -1.879194, -1.92653, 1, 0, 0, 1,
-3.298466, 0.1391368, -2.4292, 1, 0.007843138, 0, 1,
-3.099691, 0.3844899, -1.0057, 1, 0.01176471, 0, 1,
-2.855142, -2.666994, -2.334052, 1, 0.01960784, 0, 1,
-2.794278, -1.030946, -1.83509, 1, 0.02352941, 0, 1,
-2.637902, 0.2840048, -1.066265, 1, 0.03137255, 0, 1,
-2.517748, 0.2885605, -0.8685436, 1, 0.03529412, 0, 1,
-2.512501, -0.08695986, -0.8602185, 1, 0.04313726, 0, 1,
-2.446323, -1.247062, -0.3874321, 1, 0.04705882, 0, 1,
-2.43398, 0.8555586, -0.944747, 1, 0.05490196, 0, 1,
-2.42143, -0.9715855, -2.472382, 1, 0.05882353, 0, 1,
-2.400143, -0.7534971, 0.4459657, 1, 0.06666667, 0, 1,
-2.392997, 0.02753113, -0.6301897, 1, 0.07058824, 0, 1,
-2.346161, 0.1756969, -1.768738, 1, 0.07843138, 0, 1,
-2.255879, 0.5450603, -0.3936343, 1, 0.08235294, 0, 1,
-2.238899, 0.6500083, 1.773335, 1, 0.09019608, 0, 1,
-2.197556, 1.407251, -1.646363, 1, 0.09411765, 0, 1,
-2.174644, -0.4182586, -1.313066, 1, 0.1019608, 0, 1,
-2.145834, -0.5989919, -2.131492, 1, 0.1098039, 0, 1,
-2.116245, 0.7500931, -1.199082, 1, 0.1137255, 0, 1,
-2.079684, 1.610701, -0.4006284, 1, 0.1215686, 0, 1,
-2.064832, 1.529603, -2.561667, 1, 0.1254902, 0, 1,
-2.029067, -0.04451396, -0.8083803, 1, 0.1333333, 0, 1,
-2.01824, -0.3835948, -1.797093, 1, 0.1372549, 0, 1,
-2.006233, -0.2724886, -1.908658, 1, 0.145098, 0, 1,
-1.974869, -1.587697, -2.918973, 1, 0.1490196, 0, 1,
-1.904062, -0.07275653, -2.355257, 1, 0.1568628, 0, 1,
-1.90147, 1.665293, 0.9536613, 1, 0.1607843, 0, 1,
-1.883552, -1.121135, -1.896732, 1, 0.1686275, 0, 1,
-1.876819, 0.3215752, -1.856387, 1, 0.172549, 0, 1,
-1.871, 0.08918341, -1.095623, 1, 0.1803922, 0, 1,
-1.857408, 0.3454584, -1.84756, 1, 0.1843137, 0, 1,
-1.85178, 0.7995042, -1.940822, 1, 0.1921569, 0, 1,
-1.84085, 1.011527, 0.1603626, 1, 0.1960784, 0, 1,
-1.818632, -1.761923, -2.208814, 1, 0.2039216, 0, 1,
-1.815452, -0.4049638, -2.441871, 1, 0.2117647, 0, 1,
-1.810328, 1.686416, -0.5313095, 1, 0.2156863, 0, 1,
-1.808525, -0.802968, -1.810932, 1, 0.2235294, 0, 1,
-1.806736, 1.047707, 0.6568083, 1, 0.227451, 0, 1,
-1.804356, -0.1238878, -2.457249, 1, 0.2352941, 0, 1,
-1.790956, -1.151086, -1.237897, 1, 0.2392157, 0, 1,
-1.78408, 0.7574816, -2.220393, 1, 0.2470588, 0, 1,
-1.767333, -0.4198584, -1.63157, 1, 0.2509804, 0, 1,
-1.765558, 0.3906685, -2.788096, 1, 0.2588235, 0, 1,
-1.726731, 0.3260244, -0.2239801, 1, 0.2627451, 0, 1,
-1.72453, -0.7940248, 0.07117305, 1, 0.2705882, 0, 1,
-1.70863, 0.3979414, -3.816517, 1, 0.2745098, 0, 1,
-1.708346, -1.111525, -3.177486, 1, 0.282353, 0, 1,
-1.696217, 1.644399, -1.479802, 1, 0.2862745, 0, 1,
-1.691169, -0.2572117, 0.009856614, 1, 0.2941177, 0, 1,
-1.684079, -0.7246317, -1.809653, 1, 0.3019608, 0, 1,
-1.681636, -0.5887937, -1.785672, 1, 0.3058824, 0, 1,
-1.670058, -0.3076838, -3.383292, 1, 0.3137255, 0, 1,
-1.663787, 0.7094367, -1.295494, 1, 0.3176471, 0, 1,
-1.658374, -0.2761717, -1.143361, 1, 0.3254902, 0, 1,
-1.658294, -0.01044972, -2.165228, 1, 0.3294118, 0, 1,
-1.657506, -0.007074863, -1.101486, 1, 0.3372549, 0, 1,
-1.634038, 0.2642608, -0.02966896, 1, 0.3411765, 0, 1,
-1.61265, -0.8115386, -1.681251, 1, 0.3490196, 0, 1,
-1.589062, 1.220688, -2.493341, 1, 0.3529412, 0, 1,
-1.579452, -1.118688, -3.599129, 1, 0.3607843, 0, 1,
-1.57442, 1.399181, -1.673802, 1, 0.3647059, 0, 1,
-1.57396, -0.7326137, -0.8400975, 1, 0.372549, 0, 1,
-1.564426, 1.18747, -1.45988, 1, 0.3764706, 0, 1,
-1.548463, 1.076714, -2.396426, 1, 0.3843137, 0, 1,
-1.543883, -0.2984709, -1.525304, 1, 0.3882353, 0, 1,
-1.514803, -1.913963, -0.2512333, 1, 0.3960784, 0, 1,
-1.512296, -0.724254, -2.359921, 1, 0.4039216, 0, 1,
-1.504875, -1.493725, -1.766509, 1, 0.4078431, 0, 1,
-1.503703, 2.53518, 0.1674505, 1, 0.4156863, 0, 1,
-1.503024, 0.5257146, -1.401012, 1, 0.4196078, 0, 1,
-1.495917, -0.637297, -1.472204, 1, 0.427451, 0, 1,
-1.487944, 1.109808, -2.535938, 1, 0.4313726, 0, 1,
-1.482896, -0.6291806, -1.907945, 1, 0.4392157, 0, 1,
-1.47903, -1.03224, -4.235343, 1, 0.4431373, 0, 1,
-1.461184, 0.541993, -1.926171, 1, 0.4509804, 0, 1,
-1.46073, -0.2002114, 0.4863071, 1, 0.454902, 0, 1,
-1.451795, 1.192228, -1.15384, 1, 0.4627451, 0, 1,
-1.449661, -0.510117, -2.113517, 1, 0.4666667, 0, 1,
-1.439975, -1.03477, -3.09848, 1, 0.4745098, 0, 1,
-1.437637, -0.67255, -1.830305, 1, 0.4784314, 0, 1,
-1.433308, -0.6495596, -1.791491, 1, 0.4862745, 0, 1,
-1.432264, -1.406858, -2.422626, 1, 0.4901961, 0, 1,
-1.425761, 0.7475601, -2.184355, 1, 0.4980392, 0, 1,
-1.411143, -0.5740053, -2.567771, 1, 0.5058824, 0, 1,
-1.407572, -1.067595, -3.159356, 1, 0.509804, 0, 1,
-1.404477, -0.4457758, -0.1230246, 1, 0.5176471, 0, 1,
-1.395914, 1.36771, -0.1850527, 1, 0.5215687, 0, 1,
-1.39338, -2.078358, -4.07808, 1, 0.5294118, 0, 1,
-1.382153, -1.500649, -2.204513, 1, 0.5333334, 0, 1,
-1.376837, 0.4433723, 0.1362087, 1, 0.5411765, 0, 1,
-1.364313, -1.328253, -3.142346, 1, 0.5450981, 0, 1,
-1.351963, -0.1121777, -0.7371463, 1, 0.5529412, 0, 1,
-1.350759, -0.2441225, -1.806381, 1, 0.5568628, 0, 1,
-1.335788, 0.1506917, -1.153006, 1, 0.5647059, 0, 1,
-1.323927, -0.5909357, -1.212312, 1, 0.5686275, 0, 1,
-1.322648, 0.5402188, -1.779679, 1, 0.5764706, 0, 1,
-1.319072, 1.111717, -2.69927, 1, 0.5803922, 0, 1,
-1.314813, 0.3812131, -0.8809481, 1, 0.5882353, 0, 1,
-1.313454, -0.02512964, -0.858317, 1, 0.5921569, 0, 1,
-1.310951, -0.1973492, -3.639368, 1, 0.6, 0, 1,
-1.309559, -0.8424419, -1.285098, 1, 0.6078432, 0, 1,
-1.307053, 1.764285, -0.6756169, 1, 0.6117647, 0, 1,
-1.302409, -0.913189, -1.731891, 1, 0.6196079, 0, 1,
-1.301026, -1.1049, -2.871401, 1, 0.6235294, 0, 1,
-1.299601, 1.049916, -1.570166, 1, 0.6313726, 0, 1,
-1.299463, 1.338446, -3.361214, 1, 0.6352941, 0, 1,
-1.294917, -0.7580625, -3.52663, 1, 0.6431373, 0, 1,
-1.292174, 0.8394176, -0.1770159, 1, 0.6470588, 0, 1,
-1.280227, 0.6388348, -2.758295, 1, 0.654902, 0, 1,
-1.265083, 0.1763753, -1.730415, 1, 0.6588235, 0, 1,
-1.263119, 0.629883, -0.09965035, 1, 0.6666667, 0, 1,
-1.255344, 1.127723, -1.302075, 1, 0.6705883, 0, 1,
-1.255013, 0.038208, -1.941877, 1, 0.6784314, 0, 1,
-1.254109, -0.7749752, -2.00509, 1, 0.682353, 0, 1,
-1.24645, -0.7080615, -2.625563, 1, 0.6901961, 0, 1,
-1.237794, 0.7781151, -2.903235, 1, 0.6941177, 0, 1,
-1.237687, -1.077488, -1.051691, 1, 0.7019608, 0, 1,
-1.226635, 0.6170721, 0.9786084, 1, 0.7098039, 0, 1,
-1.221623, 0.6516569, -2.143699, 1, 0.7137255, 0, 1,
-1.21804, -0.389555, -0.9191327, 1, 0.7215686, 0, 1,
-1.213334, -0.111248, -2.513623, 1, 0.7254902, 0, 1,
-1.211832, 1.454545, -0.9238498, 1, 0.7333333, 0, 1,
-1.210749, 1.20046, -0.3234224, 1, 0.7372549, 0, 1,
-1.196015, 0.3888879, 0.1299814, 1, 0.7450981, 0, 1,
-1.192602, -1.444802, -2.215632, 1, 0.7490196, 0, 1,
-1.186029, -0.8656701, -3.295433, 1, 0.7568628, 0, 1,
-1.185817, 1.005405, -2.864019, 1, 0.7607843, 0, 1,
-1.184692, 0.6337726, -1.330733, 1, 0.7686275, 0, 1,
-1.182238, 1.591381, -0.7474237, 1, 0.772549, 0, 1,
-1.173712, -0.4896229, -3.425806, 1, 0.7803922, 0, 1,
-1.171582, 0.3759877, 0.8164765, 1, 0.7843137, 0, 1,
-1.171308, 0.8927386, -1.166581, 1, 0.7921569, 0, 1,
-1.170763, 1.162883, -1.443127, 1, 0.7960784, 0, 1,
-1.170657, -0.5004815, -2.054621, 1, 0.8039216, 0, 1,
-1.167497, 0.247372, -1.371737, 1, 0.8117647, 0, 1,
-1.165362, 0.4400744, -0.09713938, 1, 0.8156863, 0, 1,
-1.165265, -0.7114385, -2.613686, 1, 0.8235294, 0, 1,
-1.14955, 0.2391164, -3.234631, 1, 0.827451, 0, 1,
-1.146812, -0.07187654, -1.753905, 1, 0.8352941, 0, 1,
-1.137402, -0.3470857, -2.108524, 1, 0.8392157, 0, 1,
-1.136943, -0.383859, -1.872222, 1, 0.8470588, 0, 1,
-1.136939, -1.951493, -2.090784, 1, 0.8509804, 0, 1,
-1.13168, 0.2308139, -0.9020613, 1, 0.8588235, 0, 1,
-1.129354, -1.717467, -3.783368, 1, 0.8627451, 0, 1,
-1.120522, 0.3093218, -0.3892065, 1, 0.8705882, 0, 1,
-1.115748, -1.207815, -3.110855, 1, 0.8745098, 0, 1,
-1.113505, 1.075273, 0.1813958, 1, 0.8823529, 0, 1,
-1.112461, 0.3779868, -2.146884, 1, 0.8862745, 0, 1,
-1.105499, 1.215129, -1.272307, 1, 0.8941177, 0, 1,
-1.092923, -0.9154219, -1.720394, 1, 0.8980392, 0, 1,
-1.089766, -1.056838, -2.510332, 1, 0.9058824, 0, 1,
-1.071287, -0.6770435, -4.796524, 1, 0.9137255, 0, 1,
-1.066489, -0.09671784, -3.405472, 1, 0.9176471, 0, 1,
-1.056867, -0.2888197, -1.789947, 1, 0.9254902, 0, 1,
-1.056817, 2.489222, -0.6291478, 1, 0.9294118, 0, 1,
-1.05565, -1.331693, -3.938743, 1, 0.9372549, 0, 1,
-1.054902, -1.133098, -2.264529, 1, 0.9411765, 0, 1,
-1.050746, -0.1632664, -1.94429, 1, 0.9490196, 0, 1,
-1.049571, -2.333618, -1.163362, 1, 0.9529412, 0, 1,
-1.046338, 1.264937, -0.2903163, 1, 0.9607843, 0, 1,
-1.031439, -0.4916788, -2.227443, 1, 0.9647059, 0, 1,
-1.027717, -0.3989138, -1.595007, 1, 0.972549, 0, 1,
-1.021785, 2.887945, -0.9336823, 1, 0.9764706, 0, 1,
-1.012388, 0.6907085, -1.526708, 1, 0.9843137, 0, 1,
-1.004149, 2.08882, -1.268955, 1, 0.9882353, 0, 1,
-0.9998433, -0.1339784, -0.8647846, 1, 0.9960784, 0, 1,
-0.9993284, -0.0862441, -2.191914, 0.9960784, 1, 0, 1,
-0.9988405, 0.2302447, -1.007049, 0.9921569, 1, 0, 1,
-0.9985432, -0.2006224, -1.577654, 0.9843137, 1, 0, 1,
-0.9928998, 1.045452, 1.228764, 0.9803922, 1, 0, 1,
-0.9837674, 0.06936693, -1.273834, 0.972549, 1, 0, 1,
-0.9821709, 1.639715, -0.1649176, 0.9686275, 1, 0, 1,
-0.9593796, 0.03318014, -1.183068, 0.9607843, 1, 0, 1,
-0.9529417, 0.4891989, -2.85245, 0.9568627, 1, 0, 1,
-0.9443812, 0.04839465, -1.83561, 0.9490196, 1, 0, 1,
-0.9435712, -2.084446, -2.713602, 0.945098, 1, 0, 1,
-0.9350495, 1.02018, -2.292243, 0.9372549, 1, 0, 1,
-0.9143334, 0.3792166, -1.608135, 0.9333333, 1, 0, 1,
-0.904395, 0.03127421, -2.362843, 0.9254902, 1, 0, 1,
-0.9035234, 0.3248044, -0.6911246, 0.9215686, 1, 0, 1,
-0.9007284, 0.4327097, -0.1920488, 0.9137255, 1, 0, 1,
-0.8981884, 0.8132765, 0.9174368, 0.9098039, 1, 0, 1,
-0.8909343, -0.4321092, -2.384562, 0.9019608, 1, 0, 1,
-0.8890948, 2.324279, 0.3535683, 0.8941177, 1, 0, 1,
-0.8858478, 1.37867, -1.519997, 0.8901961, 1, 0, 1,
-0.8855186, 1.519386, 1.293992, 0.8823529, 1, 0, 1,
-0.8803377, -0.5750437, -1.934573, 0.8784314, 1, 0, 1,
-0.875322, 0.1729811, -2.739565, 0.8705882, 1, 0, 1,
-0.8750787, -0.9837588, -3.368777, 0.8666667, 1, 0, 1,
-0.8734641, -0.2806734, -3.141854, 0.8588235, 1, 0, 1,
-0.8690327, 0.615533, 0.008227471, 0.854902, 1, 0, 1,
-0.8664619, 0.7141089, -1.856946, 0.8470588, 1, 0, 1,
-0.8653647, 0.5092441, -0.3650463, 0.8431373, 1, 0, 1,
-0.8648041, 0.8830271, -0.8725027, 0.8352941, 1, 0, 1,
-0.8583207, -1.395164, -2.998275, 0.8313726, 1, 0, 1,
-0.8558275, -0.8975183, -2.744387, 0.8235294, 1, 0, 1,
-0.8542493, 1.340317, -1.479344, 0.8196079, 1, 0, 1,
-0.8540714, -0.5861583, -0.8268266, 0.8117647, 1, 0, 1,
-0.8452683, -0.6390725, -1.650331, 0.8078431, 1, 0, 1,
-0.8440574, 2.294556, 0.1062953, 0.8, 1, 0, 1,
-0.8424571, -1.0882, -2.66304, 0.7921569, 1, 0, 1,
-0.8415093, -0.1248026, -2.401297, 0.7882353, 1, 0, 1,
-0.837736, -0.9510823, -1.686871, 0.7803922, 1, 0, 1,
-0.8371044, -1.096737, -1.49168, 0.7764706, 1, 0, 1,
-0.8369637, -0.9145029, -0.0154749, 0.7686275, 1, 0, 1,
-0.8362507, -0.7457344, -1.538641, 0.7647059, 1, 0, 1,
-0.83438, -0.8903884, -3.095204, 0.7568628, 1, 0, 1,
-0.8314161, 0.3278462, -1.06407, 0.7529412, 1, 0, 1,
-0.827051, 0.6304175, 0.7642153, 0.7450981, 1, 0, 1,
-0.8250852, 0.1864702, -2.789608, 0.7411765, 1, 0, 1,
-0.8238095, -2.094402, -1.278699, 0.7333333, 1, 0, 1,
-0.8224643, -1.315312, -3.927964, 0.7294118, 1, 0, 1,
-0.8204067, -1.121423, -2.037366, 0.7215686, 1, 0, 1,
-0.8201758, 0.246832, -1.892546, 0.7176471, 1, 0, 1,
-0.8077066, -2.594705, -2.72549, 0.7098039, 1, 0, 1,
-0.8061353, 1.082321, -3.382679, 0.7058824, 1, 0, 1,
-0.8039769, 0.3444165, -0.1939605, 0.6980392, 1, 0, 1,
-0.8020074, 1.254098, -0.4536884, 0.6901961, 1, 0, 1,
-0.8009771, -0.50511, -1.164267, 0.6862745, 1, 0, 1,
-0.7982838, -0.7417684, -2.859167, 0.6784314, 1, 0, 1,
-0.7964706, 0.5931095, -0.9215679, 0.6745098, 1, 0, 1,
-0.7958743, 0.7350973, -0.9222778, 0.6666667, 1, 0, 1,
-0.7931766, 0.2869443, 0.1538495, 0.6627451, 1, 0, 1,
-0.7923264, -0.133879, -2.422036, 0.654902, 1, 0, 1,
-0.7914099, -1.567248, -3.959813, 0.6509804, 1, 0, 1,
-0.7872583, 1.080867, -1.293504, 0.6431373, 1, 0, 1,
-0.7829276, 1.504261, -1.095574, 0.6392157, 1, 0, 1,
-0.774806, -2.108687, -1.484974, 0.6313726, 1, 0, 1,
-0.7703285, -2.570979, -2.67568, 0.627451, 1, 0, 1,
-0.7674038, 0.9930477, -1.106502, 0.6196079, 1, 0, 1,
-0.7663172, -1.770202, -3.629994, 0.6156863, 1, 0, 1,
-0.7633643, 0.6716912, -0.2684919, 0.6078432, 1, 0, 1,
-0.7624714, -0.4970068, -2.922135, 0.6039216, 1, 0, 1,
-0.7622379, 0.6106523, 1.23728, 0.5960785, 1, 0, 1,
-0.7606007, -0.4425884, -2.02816, 0.5882353, 1, 0, 1,
-0.7535877, -1.086898, -2.70326, 0.5843138, 1, 0, 1,
-0.7526855, -0.4133072, -3.457933, 0.5764706, 1, 0, 1,
-0.7477434, -0.9328446, -6.335905, 0.572549, 1, 0, 1,
-0.7466339, 0.05245053, -2.629415, 0.5647059, 1, 0, 1,
-0.7463586, 0.6522113, -1.393465, 0.5607843, 1, 0, 1,
-0.7462147, 0.6703128, -0.7011388, 0.5529412, 1, 0, 1,
-0.7451316, -0.4033976, -1.006667, 0.5490196, 1, 0, 1,
-0.7303501, -0.3091241, -1.615231, 0.5411765, 1, 0, 1,
-0.7256048, -0.6510758, -2.011466, 0.5372549, 1, 0, 1,
-0.7227439, 0.2924477, 0.1599599, 0.5294118, 1, 0, 1,
-0.719692, -1.728036, -3.575589, 0.5254902, 1, 0, 1,
-0.7152995, -0.1900145, -1.570269, 0.5176471, 1, 0, 1,
-0.7134026, -1.27804, -2.27352, 0.5137255, 1, 0, 1,
-0.7107862, -1.056764, -2.480314, 0.5058824, 1, 0, 1,
-0.7064362, 0.5408448, -1.13799, 0.5019608, 1, 0, 1,
-0.70632, -0.2856758, -4.014843, 0.4941176, 1, 0, 1,
-0.7019773, -1.168109, -2.19515, 0.4862745, 1, 0, 1,
-0.7001402, -0.08578834, -0.08235162, 0.4823529, 1, 0, 1,
-0.6949361, -0.1228359, -1.500827, 0.4745098, 1, 0, 1,
-0.6795547, 1.703404, 1.195903, 0.4705882, 1, 0, 1,
-0.6765552, 1.004484, 0.1329079, 0.4627451, 1, 0, 1,
-0.6733329, -0.3058261, -2.249645, 0.4588235, 1, 0, 1,
-0.6705604, 0.2465299, -1.903386, 0.4509804, 1, 0, 1,
-0.6675769, -1.347998, -4.958257, 0.4470588, 1, 0, 1,
-0.6668203, -0.3018144, -2.70091, 0.4392157, 1, 0, 1,
-0.6666496, -0.4864254, -2.496676, 0.4352941, 1, 0, 1,
-0.6659966, -1.306086, -1.887018, 0.427451, 1, 0, 1,
-0.6535386, 0.6184322, -0.7554628, 0.4235294, 1, 0, 1,
-0.6526824, -1.647566, -3.032092, 0.4156863, 1, 0, 1,
-0.65005, -1.517433, -4.385162, 0.4117647, 1, 0, 1,
-0.6500261, -0.1086432, -1.883098, 0.4039216, 1, 0, 1,
-0.6464368, 1.125492, -1.308257, 0.3960784, 1, 0, 1,
-0.6412739, -0.3582469, -2.722637, 0.3921569, 1, 0, 1,
-0.6360753, 0.2564145, -1.870464, 0.3843137, 1, 0, 1,
-0.6336225, 0.01226543, -2.638052, 0.3803922, 1, 0, 1,
-0.6332369, -1.679145, -2.321362, 0.372549, 1, 0, 1,
-0.6321925, 1.735899, -3.032236, 0.3686275, 1, 0, 1,
-0.6300806, 0.1478001, -0.9963168, 0.3607843, 1, 0, 1,
-0.6275492, -0.3990856, -0.4605647, 0.3568628, 1, 0, 1,
-0.6251376, 0.4577466, -1.341638, 0.3490196, 1, 0, 1,
-0.624698, 0.1568178, 0.4609061, 0.345098, 1, 0, 1,
-0.6241274, 0.3925075, -2.54251, 0.3372549, 1, 0, 1,
-0.6236204, 0.3973569, -1.715328, 0.3333333, 1, 0, 1,
-0.623403, 1.386121, -1.40154, 0.3254902, 1, 0, 1,
-0.6201542, 0.7453106, -0.1355605, 0.3215686, 1, 0, 1,
-0.61844, -2.758132, -2.262167, 0.3137255, 1, 0, 1,
-0.617252, 0.1956074, -2.046318, 0.3098039, 1, 0, 1,
-0.6168991, -0.5393409, -4.309508, 0.3019608, 1, 0, 1,
-0.6124897, 0.5133757, -2.520655, 0.2941177, 1, 0, 1,
-0.6086695, 0.1975629, -1.349162, 0.2901961, 1, 0, 1,
-0.6050434, 0.3563359, -0.6264033, 0.282353, 1, 0, 1,
-0.6016687, -1.37333, -2.235661, 0.2784314, 1, 0, 1,
-0.6008886, 0.2908825, 0.1504958, 0.2705882, 1, 0, 1,
-0.5973055, 1.173764, 1.443583, 0.2666667, 1, 0, 1,
-0.583997, 0.4267926, -2.299036, 0.2588235, 1, 0, 1,
-0.5821416, 1.451017, -0.798117, 0.254902, 1, 0, 1,
-0.5804393, -0.2898632, -1.95028, 0.2470588, 1, 0, 1,
-0.5774001, -0.5500181, -1.632612, 0.2431373, 1, 0, 1,
-0.5744765, -1.17086, -0.1176343, 0.2352941, 1, 0, 1,
-0.572139, -1.684107, -2.65343, 0.2313726, 1, 0, 1,
-0.5717987, -0.5230597, -1.420474, 0.2235294, 1, 0, 1,
-0.5654211, 0.02298556, -1.612865, 0.2196078, 1, 0, 1,
-0.5652903, -0.03112821, -0.7106384, 0.2117647, 1, 0, 1,
-0.5638987, -0.1907975, -2.553066, 0.2078431, 1, 0, 1,
-0.5622592, -0.1891854, -2.210042, 0.2, 1, 0, 1,
-0.5581955, 0.2555607, -3.2799, 0.1921569, 1, 0, 1,
-0.5537054, -1.112644, -2.705318, 0.1882353, 1, 0, 1,
-0.5522531, 0.6569473, -1.226676, 0.1803922, 1, 0, 1,
-0.5520793, -0.6635192, -2.167265, 0.1764706, 1, 0, 1,
-0.5517895, 0.6854339, -0.7945153, 0.1686275, 1, 0, 1,
-0.5447333, 0.7051696, -1.1334, 0.1647059, 1, 0, 1,
-0.5374815, -0.4324019, -2.425588, 0.1568628, 1, 0, 1,
-0.5326049, 0.9424233, 0.890263, 0.1529412, 1, 0, 1,
-0.5321978, -0.4099674, -0.8357823, 0.145098, 1, 0, 1,
-0.5226759, 0.8035387, 0.2739702, 0.1411765, 1, 0, 1,
-0.5219494, 0.03989611, -2.22526, 0.1333333, 1, 0, 1,
-0.5207295, 0.5547847, -0.3907064, 0.1294118, 1, 0, 1,
-0.5188391, -0.7929585, -2.790513, 0.1215686, 1, 0, 1,
-0.5185784, 0.2079836, -2.419864, 0.1176471, 1, 0, 1,
-0.5134978, 2.04457, -0.03082892, 0.1098039, 1, 0, 1,
-0.5131717, -1.172935, -3.145514, 0.1058824, 1, 0, 1,
-0.5066604, 0.1090655, -1.690378, 0.09803922, 1, 0, 1,
-0.5023129, 0.6323726, -0.3694564, 0.09019608, 1, 0, 1,
-0.4995758, 1.123563, 0.1444069, 0.08627451, 1, 0, 1,
-0.4953582, 0.09089429, -0.5567302, 0.07843138, 1, 0, 1,
-0.4950807, 0.3931554, -0.1177792, 0.07450981, 1, 0, 1,
-0.4948177, 1.054671, -0.8945532, 0.06666667, 1, 0, 1,
-0.4942147, -0.6536041, -3.069244, 0.0627451, 1, 0, 1,
-0.4852617, 0.6645055, 0.1118739, 0.05490196, 1, 0, 1,
-0.4792731, -0.8559324, -2.158271, 0.05098039, 1, 0, 1,
-0.4772192, 0.5096784, -1.458018, 0.04313726, 1, 0, 1,
-0.4706999, 1.123865, -1.032431, 0.03921569, 1, 0, 1,
-0.4695903, -0.7045171, -3.552345, 0.03137255, 1, 0, 1,
-0.4680659, -0.997443, -2.896008, 0.02745098, 1, 0, 1,
-0.4670375, -0.7881173, -1.789922, 0.01960784, 1, 0, 1,
-0.4669072, -0.3722423, -1.740121, 0.01568628, 1, 0, 1,
-0.4610503, -1.594442, -2.171014, 0.007843138, 1, 0, 1,
-0.4584799, 0.4439501, -1.349183, 0.003921569, 1, 0, 1,
-0.4523544, -0.1489414, -2.38374, 0, 1, 0.003921569, 1,
-0.4494725, 1.0131, 1.251017, 0, 1, 0.01176471, 1,
-0.4491433, 0.8991255, -1.381904, 0, 1, 0.01568628, 1,
-0.4391471, 0.2904172, 0.04849971, 0, 1, 0.02352941, 1,
-0.4385104, 1.114038, -2.078983, 0, 1, 0.02745098, 1,
-0.436163, -0.1382224, -1.908502, 0, 1, 0.03529412, 1,
-0.4343492, -0.8828564, -3.993859, 0, 1, 0.03921569, 1,
-0.434169, 1.760231, -0.1051952, 0, 1, 0.04705882, 1,
-0.4253702, -0.3010026, -0.230964, 0, 1, 0.05098039, 1,
-0.4248948, -0.2943319, -2.458776, 0, 1, 0.05882353, 1,
-0.4193789, -1.582035, -0.8896149, 0, 1, 0.0627451, 1,
-0.4100498, 0.5494335, -0.9481733, 0, 1, 0.07058824, 1,
-0.4066076, -0.986476, -4.382018, 0, 1, 0.07450981, 1,
-0.4051808, -0.7132926, -0.9132946, 0, 1, 0.08235294, 1,
-0.4045197, -0.5845401, -2.466463, 0, 1, 0.08627451, 1,
-0.4029837, 1.066455, -0.3065354, 0, 1, 0.09411765, 1,
-0.4010804, 1.432655, -1.940736, 0, 1, 0.1019608, 1,
-0.4010779, -0.4237514, -1.011603, 0, 1, 0.1058824, 1,
-0.3955246, 0.5424808, -1.05702, 0, 1, 0.1137255, 1,
-0.3921836, -0.3310408, -1.470939, 0, 1, 0.1176471, 1,
-0.389434, 1.453108, -0.2341305, 0, 1, 0.1254902, 1,
-0.386324, 1.020487, -0.701732, 0, 1, 0.1294118, 1,
-0.3816297, 0.7530803, -0.7541769, 0, 1, 0.1372549, 1,
-0.3683696, 0.01976222, -1.115551, 0, 1, 0.1411765, 1,
-0.3674297, -0.2066997, -2.57928, 0, 1, 0.1490196, 1,
-0.3632635, -0.1151376, -0.7092741, 0, 1, 0.1529412, 1,
-0.360808, 1.176114, -1.008082, 0, 1, 0.1607843, 1,
-0.3601147, -0.7428782, -4.881567, 0, 1, 0.1647059, 1,
-0.359248, 0.05252317, -0.9977859, 0, 1, 0.172549, 1,
-0.35588, -1.037972, -2.483858, 0, 1, 0.1764706, 1,
-0.3491573, 0.4659469, -1.534839, 0, 1, 0.1843137, 1,
-0.3457039, 0.2505826, -1.423513, 0, 1, 0.1882353, 1,
-0.3412134, 0.9939575, 0.5518085, 0, 1, 0.1960784, 1,
-0.3379616, -1.528815, -3.403701, 0, 1, 0.2039216, 1,
-0.332662, -0.4952835, -1.869447, 0, 1, 0.2078431, 1,
-0.3281733, -0.4638455, -2.34818, 0, 1, 0.2156863, 1,
-0.325745, -0.6801528, -2.457951, 0, 1, 0.2196078, 1,
-0.3255599, 0.4810536, 1.278295, 0, 1, 0.227451, 1,
-0.3219301, 0.4055836, -1.802337, 0, 1, 0.2313726, 1,
-0.3208811, -0.1181529, -1.217963, 0, 1, 0.2392157, 1,
-0.3205617, -0.8594804, -1.875021, 0, 1, 0.2431373, 1,
-0.3169923, 0.9053924, 0.6081976, 0, 1, 0.2509804, 1,
-0.3134445, -0.1726433, -1.414294, 0, 1, 0.254902, 1,
-0.3118216, 0.7890413, -0.2573363, 0, 1, 0.2627451, 1,
-0.3113099, -0.8831421, -4.280123, 0, 1, 0.2666667, 1,
-0.3109025, 0.8762426, 1.041364, 0, 1, 0.2745098, 1,
-0.309639, 0.6213143, -0.5967839, 0, 1, 0.2784314, 1,
-0.3092783, 0.3694578, -1.890443, 0, 1, 0.2862745, 1,
-0.3089206, 0.7570993, -1.234381, 0, 1, 0.2901961, 1,
-0.3088985, 0.04066537, -1.556906, 0, 1, 0.2980392, 1,
-0.307171, 0.04939143, -3.364594, 0, 1, 0.3058824, 1,
-0.3000228, 1.599833, 0.02261609, 0, 1, 0.3098039, 1,
-0.2998815, 1.111341, -0.8626943, 0, 1, 0.3176471, 1,
-0.2957672, 0.5006073, -2.194466, 0, 1, 0.3215686, 1,
-0.2932585, -0.8076571, -3.945363, 0, 1, 0.3294118, 1,
-0.2910381, -0.9109441, -2.177183, 0, 1, 0.3333333, 1,
-0.2878367, 0.7889352, -2.77958, 0, 1, 0.3411765, 1,
-0.2828098, 0.8103889, 0.4493972, 0, 1, 0.345098, 1,
-0.2746468, 0.3104644, -0.1084429, 0, 1, 0.3529412, 1,
-0.2730539, 0.1462709, -0.4606652, 0, 1, 0.3568628, 1,
-0.2711335, 0.9114071, -2.691227, 0, 1, 0.3647059, 1,
-0.2662739, -2.81838, -2.800819, 0, 1, 0.3686275, 1,
-0.2543164, 0.8055386, -1.080381, 0, 1, 0.3764706, 1,
-0.2520547, -1.370172, -3.751191, 0, 1, 0.3803922, 1,
-0.2495754, -0.4512363, -0.4237933, 0, 1, 0.3882353, 1,
-0.248536, 1.183314, -0.1055791, 0, 1, 0.3921569, 1,
-0.24843, 0.3886651, -1.357052, 0, 1, 0.4, 1,
-0.2470609, -0.3158755, -3.224878, 0, 1, 0.4078431, 1,
-0.2464504, 0.0809183, 0.616963, 0, 1, 0.4117647, 1,
-0.2464118, 0.6790717, -0.1788048, 0, 1, 0.4196078, 1,
-0.2435283, -0.7430587, -3.340138, 0, 1, 0.4235294, 1,
-0.2427066, 0.4551084, -0.9447461, 0, 1, 0.4313726, 1,
-0.2422547, 0.886739, 0.7111848, 0, 1, 0.4352941, 1,
-0.2418154, -1.300193, -1.519092, 0, 1, 0.4431373, 1,
-0.2365517, -0.3956309, -2.704404, 0, 1, 0.4470588, 1,
-0.2344014, 0.09879604, -2.315838, 0, 1, 0.454902, 1,
-0.2338755, 0.1199247, -1.053684, 0, 1, 0.4588235, 1,
-0.2333602, 0.412441, 0.4310473, 0, 1, 0.4666667, 1,
-0.2272729, 0.02117261, -1.818807, 0, 1, 0.4705882, 1,
-0.2269278, -0.3036566, -2.132054, 0, 1, 0.4784314, 1,
-0.2242484, 0.3043449, -0.7225789, 0, 1, 0.4823529, 1,
-0.2226801, -2.772747, -1.601694, 0, 1, 0.4901961, 1,
-0.2171354, -0.6753275, -1.549415, 0, 1, 0.4941176, 1,
-0.2157344, 0.4783321, -0.1021676, 0, 1, 0.5019608, 1,
-0.2129476, -0.413014, -2.413601, 0, 1, 0.509804, 1,
-0.2099603, 0.6775348, -1.084425, 0, 1, 0.5137255, 1,
-0.2096115, 1.510493, -0.4113176, 0, 1, 0.5215687, 1,
-0.2061147, 0.6287984, -0.09286626, 0, 1, 0.5254902, 1,
-0.2054171, -0.5161147, -2.292303, 0, 1, 0.5333334, 1,
-0.2029054, 0.4305126, 0.4636437, 0, 1, 0.5372549, 1,
-0.2028251, 0.170382, 0.7684066, 0, 1, 0.5450981, 1,
-0.2005488, 1.407214, 1.574643, 0, 1, 0.5490196, 1,
-0.1963645, -0.6511499, -2.712946, 0, 1, 0.5568628, 1,
-0.196022, 1.292465, 0.1789898, 0, 1, 0.5607843, 1,
-0.1883666, 1.140739, -1.485768, 0, 1, 0.5686275, 1,
-0.1870271, 2.680406, -1.01505, 0, 1, 0.572549, 1,
-0.1828342, 0.2239828, 0.8207811, 0, 1, 0.5803922, 1,
-0.1821332, -1.7064, -3.678972, 0, 1, 0.5843138, 1,
-0.1813844, -1.436445, -3.290415, 0, 1, 0.5921569, 1,
-0.1807517, 1.891143, -1.435404, 0, 1, 0.5960785, 1,
-0.1782984, 0.3198482, -0.3526217, 0, 1, 0.6039216, 1,
-0.172746, 0.7580475, 0.915512, 0, 1, 0.6117647, 1,
-0.1697516, -0.1801597, -3.114601, 0, 1, 0.6156863, 1,
-0.1631224, -0.7685323, -4.912368, 0, 1, 0.6235294, 1,
-0.1621555, -0.5009013, -3.344385, 0, 1, 0.627451, 1,
-0.1609842, -0.7563425, -3.723458, 0, 1, 0.6352941, 1,
-0.1601814, -0.6339302, -3.479929, 0, 1, 0.6392157, 1,
-0.1598303, -1.43198, -2.501416, 0, 1, 0.6470588, 1,
-0.1593633, -1.559373, -3.15599, 0, 1, 0.6509804, 1,
-0.1583584, 0.4852421, 0.9791827, 0, 1, 0.6588235, 1,
-0.1579846, -0.2578915, -2.529406, 0, 1, 0.6627451, 1,
-0.1575163, 0.3805763, -0.7045251, 0, 1, 0.6705883, 1,
-0.1538549, -0.1119721, -0.7296311, 0, 1, 0.6745098, 1,
-0.1510098, 0.05823188, -0.8990693, 0, 1, 0.682353, 1,
-0.1501628, 1.551853, -0.484761, 0, 1, 0.6862745, 1,
-0.1484115, 0.2690344, -1.1531, 0, 1, 0.6941177, 1,
-0.145829, -0.6219513, -2.327633, 0, 1, 0.7019608, 1,
-0.1446028, 1.145604, -0.7560549, 0, 1, 0.7058824, 1,
-0.1424534, 1.378187, 0.6619587, 0, 1, 0.7137255, 1,
-0.1297889, -0.4999344, -1.931771, 0, 1, 0.7176471, 1,
-0.129145, -0.7664924, -3.511709, 0, 1, 0.7254902, 1,
-0.1284869, 1.049496, 3.424536, 0, 1, 0.7294118, 1,
-0.1283708, -0.4106671, -2.549964, 0, 1, 0.7372549, 1,
-0.126162, -1.428796, -3.216359, 0, 1, 0.7411765, 1,
-0.1253402, -1.788803, -3.77021, 0, 1, 0.7490196, 1,
-0.1239507, -0.477183, -3.735166, 0, 1, 0.7529412, 1,
-0.1235341, -0.008099673, -2.648293, 0, 1, 0.7607843, 1,
-0.1223932, -0.7353292, -2.551968, 0, 1, 0.7647059, 1,
-0.122267, -0.16428, -3.179489, 0, 1, 0.772549, 1,
-0.1191889, 1.64406, -1.449502, 0, 1, 0.7764706, 1,
-0.1184335, -0.7473362, -1.735492, 0, 1, 0.7843137, 1,
-0.1162509, 0.8086146, -0.6961172, 0, 1, 0.7882353, 1,
-0.1159538, 1.462332, -1.058964, 0, 1, 0.7960784, 1,
-0.1140307, 0.1858057, -1.584826, 0, 1, 0.8039216, 1,
-0.112564, 0.0242806, -2.948441, 0, 1, 0.8078431, 1,
-0.1118262, 0.6867655, -1.493974, 0, 1, 0.8156863, 1,
-0.1106139, -1.784915, -1.14713, 0, 1, 0.8196079, 1,
-0.109535, 1.262617, 1.01065, 0, 1, 0.827451, 1,
-0.1050932, -0.1220874, -3.223738, 0, 1, 0.8313726, 1,
-0.1018257, 0.1195779, -0.490615, 0, 1, 0.8392157, 1,
-0.1015627, -2.105212, -2.536757, 0, 1, 0.8431373, 1,
-0.09643306, 2.464262, -0.5576752, 0, 1, 0.8509804, 1,
-0.09634188, 1.863681, 0.164297, 0, 1, 0.854902, 1,
-0.09266728, 0.8459643, 0.4941098, 0, 1, 0.8627451, 1,
-0.08964755, -0.1900391, -1.771551, 0, 1, 0.8666667, 1,
-0.08773848, 0.7879767, -0.3021004, 0, 1, 0.8745098, 1,
-0.08279841, -0.1361527, -4.052828, 0, 1, 0.8784314, 1,
-0.07665797, -0.7612722, -3.904563, 0, 1, 0.8862745, 1,
-0.06790626, -0.5088221, -2.470001, 0, 1, 0.8901961, 1,
-0.06740909, 0.8167697, -0.4202685, 0, 1, 0.8980392, 1,
-0.06295985, 0.5600802, -0.8294078, 0, 1, 0.9058824, 1,
-0.06146191, 0.5669276, -1.469567, 0, 1, 0.9098039, 1,
-0.05743083, 2.248401, -0.2679293, 0, 1, 0.9176471, 1,
-0.05542017, -0.1175691, -4.472502, 0, 1, 0.9215686, 1,
-0.04820644, 0.2308333, -0.3661735, 0, 1, 0.9294118, 1,
-0.042565, 0.9653527, -1.449404, 0, 1, 0.9333333, 1,
-0.0409499, 0.7152129, 1.004397, 0, 1, 0.9411765, 1,
-0.04077743, -1.841369, -3.516962, 0, 1, 0.945098, 1,
-0.02968709, 1.658747, 1.77067, 0, 1, 0.9529412, 1,
-0.02906154, 0.3084146, 0.9368428, 0, 1, 0.9568627, 1,
-0.02466002, -0.6638123, -2.6829, 0, 1, 0.9647059, 1,
-0.02298091, 0.01546199, -1.206498, 0, 1, 0.9686275, 1,
-0.02200923, 0.9784046, -1.353824, 0, 1, 0.9764706, 1,
-0.01893129, -0.4432273, -2.131207, 0, 1, 0.9803922, 1,
-0.008800544, 1.038573, -0.2356941, 0, 1, 0.9882353, 1,
-0.007779439, -0.6086564, -3.977577, 0, 1, 0.9921569, 1,
-0.005719804, 0.4661026, 1.782621, 0, 1, 1, 1,
-0.00215871, 0.494247, 0.6002011, 0, 0.9921569, 1, 1,
0.005114723, 0.1000193, -0.09398843, 0, 0.9882353, 1, 1,
0.007017433, 1.028031, 1.378891, 0, 0.9803922, 1, 1,
0.01070568, -0.6428608, 3.458082, 0, 0.9764706, 1, 1,
0.01423009, 0.3850682, 1.420552, 0, 0.9686275, 1, 1,
0.01657183, -0.09732095, 3.199958, 0, 0.9647059, 1, 1,
0.02404871, -0.3842786, 4.04459, 0, 0.9568627, 1, 1,
0.02500105, -0.05948076, 1.681134, 0, 0.9529412, 1, 1,
0.02720632, -0.2205428, 2.758339, 0, 0.945098, 1, 1,
0.02919866, 0.3429752, 1.649774, 0, 0.9411765, 1, 1,
0.03066523, -0.4975489, 2.673535, 0, 0.9333333, 1, 1,
0.03108459, 1.779509, 0.4994882, 0, 0.9294118, 1, 1,
0.03113078, -1.728601, 3.695173, 0, 0.9215686, 1, 1,
0.03321289, -0.63161, 3.036963, 0, 0.9176471, 1, 1,
0.03865083, 1.137463, 0.1299917, 0, 0.9098039, 1, 1,
0.03966575, 1.107429, -1.00282, 0, 0.9058824, 1, 1,
0.0423058, -0.078066, 4.456724, 0, 0.8980392, 1, 1,
0.04238265, -0.1753161, 4.688781, 0, 0.8901961, 1, 1,
0.04406564, -1.484324, 2.233236, 0, 0.8862745, 1, 1,
0.0491217, 1.831452, -0.8565364, 0, 0.8784314, 1, 1,
0.05147824, -2.167805, 2.245193, 0, 0.8745098, 1, 1,
0.05422073, -0.06573229, 0.9575339, 0, 0.8666667, 1, 1,
0.05451005, -1.329833, 3.162935, 0, 0.8627451, 1, 1,
0.0545858, -0.1823581, 1.86443, 0, 0.854902, 1, 1,
0.05829718, 0.9064292, 0.1122895, 0, 0.8509804, 1, 1,
0.05849726, 0.6270266, 1.280435, 0, 0.8431373, 1, 1,
0.05903609, -0.5516115, 2.900289, 0, 0.8392157, 1, 1,
0.06136598, 0.3573819, 0.4278719, 0, 0.8313726, 1, 1,
0.06144655, -0.8611289, 2.788176, 0, 0.827451, 1, 1,
0.06179267, -0.8129211, 2.159948, 0, 0.8196079, 1, 1,
0.06485503, -0.1376972, 2.766922, 0, 0.8156863, 1, 1,
0.06572746, 0.05117539, 1.05279, 0, 0.8078431, 1, 1,
0.07245633, -1.216254, 3.387635, 0, 0.8039216, 1, 1,
0.07816743, 1.443021, -1.125612, 0, 0.7960784, 1, 1,
0.08304296, 1.874609, -1.370956, 0, 0.7882353, 1, 1,
0.08443271, -0.4875054, 3.242527, 0, 0.7843137, 1, 1,
0.09053976, -0.6774811, 4.731744, 0, 0.7764706, 1, 1,
0.09195389, 0.4180364, -0.3343633, 0, 0.772549, 1, 1,
0.09954015, -0.1956279, 4.1924, 0, 0.7647059, 1, 1,
0.1012557, -0.03728229, 1.30187, 0, 0.7607843, 1, 1,
0.1049325, -0.8073405, 3.590439, 0, 0.7529412, 1, 1,
0.1080993, -0.7499628, 3.687687, 0, 0.7490196, 1, 1,
0.109296, 0.7005308, 1.488357, 0, 0.7411765, 1, 1,
0.1096086, -0.9595376, 1.615136, 0, 0.7372549, 1, 1,
0.1096996, -0.8047542, 3.178951, 0, 0.7294118, 1, 1,
0.1100852, 0.004172141, 2.450048, 0, 0.7254902, 1, 1,
0.1102314, -0.6827705, 3.512805, 0, 0.7176471, 1, 1,
0.1103466, -1.352375, 1.489892, 0, 0.7137255, 1, 1,
0.1152617, -0.1756782, 2.92493, 0, 0.7058824, 1, 1,
0.1164375, 0.39325, -1.059028, 0, 0.6980392, 1, 1,
0.1168834, -0.3597675, 2.130223, 0, 0.6941177, 1, 1,
0.1212384, 0.5092673, -0.4372065, 0, 0.6862745, 1, 1,
0.1216551, 1.79211, 1.207019, 0, 0.682353, 1, 1,
0.1251148, 1.557046, 0.4541265, 0, 0.6745098, 1, 1,
0.1288867, 0.4563395, -0.7860775, 0, 0.6705883, 1, 1,
0.1290225, -0.545088, 2.711639, 0, 0.6627451, 1, 1,
0.1292035, 0.04335154, 1.895446, 0, 0.6588235, 1, 1,
0.1302162, 1.225129, 0.9484701, 0, 0.6509804, 1, 1,
0.1303149, 1.36219, 0.9015376, 0, 0.6470588, 1, 1,
0.1308524, -0.7310382, 3.428027, 0, 0.6392157, 1, 1,
0.1315148, 0.7064341, 1.291467, 0, 0.6352941, 1, 1,
0.1323886, 0.4849255, 0.3493035, 0, 0.627451, 1, 1,
0.1341822, 0.2400685, -1.888343, 0, 0.6235294, 1, 1,
0.1355161, -0.1293042, 3.905136, 0, 0.6156863, 1, 1,
0.1379935, 1.009471, 0.3698803, 0, 0.6117647, 1, 1,
0.1389881, -0.07376711, 2.241515, 0, 0.6039216, 1, 1,
0.1394312, 0.2446699, -0.7474245, 0, 0.5960785, 1, 1,
0.1404277, -0.734643, 2.816679, 0, 0.5921569, 1, 1,
0.1413476, 1.354289, -0.8090983, 0, 0.5843138, 1, 1,
0.1418839, -0.9637313, 5.318562, 0, 0.5803922, 1, 1,
0.1435468, 0.3893363, 2.084582, 0, 0.572549, 1, 1,
0.1501373, 1.297096, -0.5087989, 0, 0.5686275, 1, 1,
0.1505824, -1.749635, 2.178655, 0, 0.5607843, 1, 1,
0.1518179, 1.281037, -0.5847726, 0, 0.5568628, 1, 1,
0.1529569, -0.2298893, 2.106183, 0, 0.5490196, 1, 1,
0.1616854, -0.4187437, 3.098531, 0, 0.5450981, 1, 1,
0.1687763, 0.6320088, 1.029778, 0, 0.5372549, 1, 1,
0.1706918, -0.3107747, 3.21042, 0, 0.5333334, 1, 1,
0.1711067, -0.8290213, 3.277576, 0, 0.5254902, 1, 1,
0.1742078, 0.124543, 1.306785, 0, 0.5215687, 1, 1,
0.1742257, 0.8014866, -0.4183573, 0, 0.5137255, 1, 1,
0.1749306, 0.5852328, 0.5935616, 0, 0.509804, 1, 1,
0.1789374, 0.1839269, 1.390709, 0, 0.5019608, 1, 1,
0.1789513, 1.210141, -0.05527066, 0, 0.4941176, 1, 1,
0.1789964, -0.6916043, 2.083968, 0, 0.4901961, 1, 1,
0.181608, -0.1460312, 0.1877881, 0, 0.4823529, 1, 1,
0.1911415, -0.01417664, 2.556596, 0, 0.4784314, 1, 1,
0.1931462, 0.1273283, 0.1342184, 0, 0.4705882, 1, 1,
0.1947467, -2.680979, 1.988659, 0, 0.4666667, 1, 1,
0.1983074, 0.7415432, -0.2631709, 0, 0.4588235, 1, 1,
0.1987906, -0.9940373, 1.937665, 0, 0.454902, 1, 1,
0.2065359, 0.10691, 1.586603, 0, 0.4470588, 1, 1,
0.2066045, 1.932436, 0.1515622, 0, 0.4431373, 1, 1,
0.2094066, -0.1436116, 1.115995, 0, 0.4352941, 1, 1,
0.2098363, -1.001243, 2.715924, 0, 0.4313726, 1, 1,
0.2135313, 1.651803, 0.2921718, 0, 0.4235294, 1, 1,
0.2158768, 0.1184721, 1.291684, 0, 0.4196078, 1, 1,
0.2163498, -0.07946672, 1.35736, 0, 0.4117647, 1, 1,
0.2195205, -0.7857926, 2.452718, 0, 0.4078431, 1, 1,
0.2277882, -1.254093, 0.5317622, 0, 0.4, 1, 1,
0.2326912, -0.5296785, 4.101301, 0, 0.3921569, 1, 1,
0.2460701, -0.05073996, 2.272474, 0, 0.3882353, 1, 1,
0.2483559, -0.1384395, 1.753328, 0, 0.3803922, 1, 1,
0.2514495, -0.02578872, 1.900373, 0, 0.3764706, 1, 1,
0.251876, -1.41933, 4.659316, 0, 0.3686275, 1, 1,
0.2548776, 0.5083661, 1.499256, 0, 0.3647059, 1, 1,
0.2557545, -1.091364, 2.334415, 0, 0.3568628, 1, 1,
0.2569959, -2.022101, 3.489007, 0, 0.3529412, 1, 1,
0.2577141, -0.2411561, 2.801592, 0, 0.345098, 1, 1,
0.2578551, -1.00594, 2.406506, 0, 0.3411765, 1, 1,
0.2646776, -0.5320082, 3.225077, 0, 0.3333333, 1, 1,
0.2672703, 0.08074762, 2.182356, 0, 0.3294118, 1, 1,
0.2717653, -0.4179888, 0.9090431, 0, 0.3215686, 1, 1,
0.2719567, 0.7204807, -1.842063, 0, 0.3176471, 1, 1,
0.2754985, -0.06310482, 3.937582, 0, 0.3098039, 1, 1,
0.2759009, 1.461903, 0.1759033, 0, 0.3058824, 1, 1,
0.2878177, 0.5991319, -0.2178429, 0, 0.2980392, 1, 1,
0.2878614, 1.935257, -0.01203453, 0, 0.2901961, 1, 1,
0.2902623, -0.7599844, 2.495264, 0, 0.2862745, 1, 1,
0.2910577, -0.8579915, 1.349318, 0, 0.2784314, 1, 1,
0.2945916, -0.7849848, 2.776534, 0, 0.2745098, 1, 1,
0.2952731, 2.018108, 1.073282, 0, 0.2666667, 1, 1,
0.296755, -0.5007733, 2.522867, 0, 0.2627451, 1, 1,
0.2971109, -0.955558, 4.573964, 0, 0.254902, 1, 1,
0.2987174, -0.405206, 0.3320063, 0, 0.2509804, 1, 1,
0.3003174, 0.255147, -0.3624644, 0, 0.2431373, 1, 1,
0.3028045, -0.03953157, 0.5656838, 0, 0.2392157, 1, 1,
0.3034058, -0.2392374, 1.884953, 0, 0.2313726, 1, 1,
0.3076854, -0.06472729, 2.975825, 0, 0.227451, 1, 1,
0.3084416, -1.149282, 3.528526, 0, 0.2196078, 1, 1,
0.3110682, -0.7371139, 1.234063, 0, 0.2156863, 1, 1,
0.3145601, 0.1511683, 1.190021, 0, 0.2078431, 1, 1,
0.315294, -1.115859, 4.497076, 0, 0.2039216, 1, 1,
0.3263963, 1.486388, -1.464838, 0, 0.1960784, 1, 1,
0.3291964, 0.2421665, 1.15751, 0, 0.1882353, 1, 1,
0.3301816, -0.4032818, 2.955836, 0, 0.1843137, 1, 1,
0.3313976, -0.3301655, 0.7939072, 0, 0.1764706, 1, 1,
0.3315543, 1.556623, -0.3569143, 0, 0.172549, 1, 1,
0.3412483, 0.05354557, 1.572096, 0, 0.1647059, 1, 1,
0.3417595, 0.2316336, 1.53324, 0, 0.1607843, 1, 1,
0.3430136, 0.4868577, -1.525962, 0, 0.1529412, 1, 1,
0.3465486, -0.479324, 1.503392, 0, 0.1490196, 1, 1,
0.3512057, 0.431217, -0.8617977, 0, 0.1411765, 1, 1,
0.3526912, -0.8496174, 2.907961, 0, 0.1372549, 1, 1,
0.3559369, -2.539858, 1.335488, 0, 0.1294118, 1, 1,
0.3632383, -0.5235234, 4.027985, 0, 0.1254902, 1, 1,
0.3642574, 1.109378, 0.04922295, 0, 0.1176471, 1, 1,
0.3697643, 0.9372458, 0.7626601, 0, 0.1137255, 1, 1,
0.3732731, -1.202252, 1.823788, 0, 0.1058824, 1, 1,
0.3769228, 0.8044301, 0.9039183, 0, 0.09803922, 1, 1,
0.3772751, 0.09049672, 2.040855, 0, 0.09411765, 1, 1,
0.3791077, -1.63526, 2.640709, 0, 0.08627451, 1, 1,
0.3829063, -1.030285, 2.627517, 0, 0.08235294, 1, 1,
0.387312, 0.1692064, 0.1389586, 0, 0.07450981, 1, 1,
0.387895, 1.057582, -1.082337, 0, 0.07058824, 1, 1,
0.3899658, -1.094036, 3.661344, 0, 0.0627451, 1, 1,
0.3903471, 0.9131736, 0.9647722, 0, 0.05882353, 1, 1,
0.3950632, 1.302534, 0.3058055, 0, 0.05098039, 1, 1,
0.3972962, 1.613214, 0.9407215, 0, 0.04705882, 1, 1,
0.3973731, -1.157373, 3.641785, 0, 0.03921569, 1, 1,
0.3989506, -0.4505171, 4.630144, 0, 0.03529412, 1, 1,
0.4002464, 0.278699, 0.06600483, 0, 0.02745098, 1, 1,
0.4006571, -0.670736, 0.1844164, 0, 0.02352941, 1, 1,
0.4018286, -0.03706269, 2.546222, 0, 0.01568628, 1, 1,
0.4034833, 2.636188, -0.1565301, 0, 0.01176471, 1, 1,
0.405167, 0.2026017, 1.7377, 0, 0.003921569, 1, 1,
0.4067996, 0.202277, 2.01475, 0.003921569, 0, 1, 1,
0.4097155, 0.2596559, -1.736746, 0.007843138, 0, 1, 1,
0.4137271, 0.4424727, 1.959639, 0.01568628, 0, 1, 1,
0.4146328, 0.6245539, 0.07230356, 0.01960784, 0, 1, 1,
0.4227406, 0.8565523, 1.985331, 0.02745098, 0, 1, 1,
0.4228995, 2.090848, 1.134879, 0.03137255, 0, 1, 1,
0.4233413, 0.3041676, 1.162288, 0.03921569, 0, 1, 1,
0.428128, -0.4105471, 1.609202, 0.04313726, 0, 1, 1,
0.4289891, -1.229236, 3.379837, 0.05098039, 0, 1, 1,
0.4313131, 0.6930443, 0.923607, 0.05490196, 0, 1, 1,
0.4319775, -1.601236, 3.009145, 0.0627451, 0, 1, 1,
0.4379551, 1.660165, 2.179252, 0.06666667, 0, 1, 1,
0.4407082, -0.1721688, 0.6901948, 0.07450981, 0, 1, 1,
0.4476326, 0.009124377, 2.237368, 0.07843138, 0, 1, 1,
0.4491126, -0.3447739, 2.329274, 0.08627451, 0, 1, 1,
0.4511115, -1.833765, 3.027557, 0.09019608, 0, 1, 1,
0.4521455, -1.550231, 1.743365, 0.09803922, 0, 1, 1,
0.4541397, 0.372459, -0.2412208, 0.1058824, 0, 1, 1,
0.4578251, -0.8162759, 3.658271, 0.1098039, 0, 1, 1,
0.4610189, -0.1804665, 1.838918, 0.1176471, 0, 1, 1,
0.4669851, 1.01012, -0.4972859, 0.1215686, 0, 1, 1,
0.4678845, 1.290222, 1.009602, 0.1294118, 0, 1, 1,
0.474353, 0.287969, 0.812267, 0.1333333, 0, 1, 1,
0.4752409, 1.062331, 0.7493456, 0.1411765, 0, 1, 1,
0.4861948, -0.4516644, 2.511024, 0.145098, 0, 1, 1,
0.4915623, 0.7280351, 0.2229301, 0.1529412, 0, 1, 1,
0.5012546, -0.7189938, 2.632949, 0.1568628, 0, 1, 1,
0.5020226, -0.2539495, 1.469342, 0.1647059, 0, 1, 1,
0.5040532, -0.4981633, 1.149501, 0.1686275, 0, 1, 1,
0.5051778, 0.2416003, 1.434032, 0.1764706, 0, 1, 1,
0.5056835, 0.4554706, -0.214291, 0.1803922, 0, 1, 1,
0.5082819, -0.7931778, 2.67618, 0.1882353, 0, 1, 1,
0.5136853, 1.711089, 0.1186103, 0.1921569, 0, 1, 1,
0.5255362, 0.3759983, 1.466161, 0.2, 0, 1, 1,
0.528412, 1.215061, 0.7519738, 0.2078431, 0, 1, 1,
0.5292836, -0.6517816, 1.228175, 0.2117647, 0, 1, 1,
0.5432583, -0.08732776, 2.648991, 0.2196078, 0, 1, 1,
0.5438067, -1.00084, 3.982452, 0.2235294, 0, 1, 1,
0.5478006, -0.2508011, 1.19726, 0.2313726, 0, 1, 1,
0.5508931, 0.6500008, -0.5965959, 0.2352941, 0, 1, 1,
0.5516948, -1.230298, 1.7281, 0.2431373, 0, 1, 1,
0.5519826, 2.484103, -0.549431, 0.2470588, 0, 1, 1,
0.5532177, -0.1926325, 2.509682, 0.254902, 0, 1, 1,
0.5535607, -0.02453257, 1.366639, 0.2588235, 0, 1, 1,
0.5561691, 0.7865442, -0.2239767, 0.2666667, 0, 1, 1,
0.5567086, 0.6732596, 0.7158595, 0.2705882, 0, 1, 1,
0.5584058, 2.274212, 1.093162, 0.2784314, 0, 1, 1,
0.5687667, -0.3445043, 1.140997, 0.282353, 0, 1, 1,
0.5703422, -1.332274, 2.910976, 0.2901961, 0, 1, 1,
0.5712334, -0.2222586, 1.636482, 0.2941177, 0, 1, 1,
0.5753484, -0.5917179, 3.54542, 0.3019608, 0, 1, 1,
0.5758601, -0.4118714, 2.366732, 0.3098039, 0, 1, 1,
0.5798913, -0.1648029, 2.484659, 0.3137255, 0, 1, 1,
0.5826892, -0.8920116, 2.422704, 0.3215686, 0, 1, 1,
0.5846707, 0.2567675, 1.735199, 0.3254902, 0, 1, 1,
0.5874564, 0.8313833, 1.204711, 0.3333333, 0, 1, 1,
0.5898474, -0.5541213, 1.863834, 0.3372549, 0, 1, 1,
0.5928476, -0.9368416, 1.428699, 0.345098, 0, 1, 1,
0.5963851, 0.572738, -1.417548, 0.3490196, 0, 1, 1,
0.5973179, -0.6590834, 3.672601, 0.3568628, 0, 1, 1,
0.6010732, 0.7293245, 1.458965, 0.3607843, 0, 1, 1,
0.6030374, 0.5923713, 2.075486, 0.3686275, 0, 1, 1,
0.612691, -0.7007575, 1.297551, 0.372549, 0, 1, 1,
0.6225956, -1.772535, 2.075439, 0.3803922, 0, 1, 1,
0.6275497, -0.3883865, 1.234178, 0.3843137, 0, 1, 1,
0.630825, 1.53644, -0.5903164, 0.3921569, 0, 1, 1,
0.6428764, 0.5761063, -0.5280483, 0.3960784, 0, 1, 1,
0.6437101, 0.8306116, 0.5970805, 0.4039216, 0, 1, 1,
0.6465815, -0.115383, 2.297097, 0.4117647, 0, 1, 1,
0.647231, -0.7129159, 3.352638, 0.4156863, 0, 1, 1,
0.6493837, -0.3241824, 4.304893, 0.4235294, 0, 1, 1,
0.6496292, -0.1540383, 1.230648, 0.427451, 0, 1, 1,
0.6525965, 1.011071, 1.528994, 0.4352941, 0, 1, 1,
0.6564296, -0.705487, 2.390658, 0.4392157, 0, 1, 1,
0.6637027, -0.04254387, 3.038316, 0.4470588, 0, 1, 1,
0.6652603, -3.017231, 2.771493, 0.4509804, 0, 1, 1,
0.6660627, 0.06982017, 2.185161, 0.4588235, 0, 1, 1,
0.669053, 0.7347803, 0.5382154, 0.4627451, 0, 1, 1,
0.6702139, -0.08194219, 1.933098, 0.4705882, 0, 1, 1,
0.6731222, -0.06569985, 1.758453, 0.4745098, 0, 1, 1,
0.6756364, 1.249928, 0.2225087, 0.4823529, 0, 1, 1,
0.6764041, -0.02279002, 3.290931, 0.4862745, 0, 1, 1,
0.6787933, 2.802992, 0.2131344, 0.4941176, 0, 1, 1,
0.6795585, -0.3964825, 2.879457, 0.5019608, 0, 1, 1,
0.6803832, -0.6367365, 2.319815, 0.5058824, 0, 1, 1,
0.6827739, -0.5421424, 2.168853, 0.5137255, 0, 1, 1,
0.6884564, 0.04286608, 0.4637792, 0.5176471, 0, 1, 1,
0.6904876, 0.4693018, 0.7349328, 0.5254902, 0, 1, 1,
0.6984574, -1.599926, 2.000098, 0.5294118, 0, 1, 1,
0.6989625, -0.4326056, 2.838865, 0.5372549, 0, 1, 1,
0.6991603, 0.5394586, -0.1626023, 0.5411765, 0, 1, 1,
0.6998982, -1.211236, 1.954719, 0.5490196, 0, 1, 1,
0.7002605, -0.6807814, 3.427755, 0.5529412, 0, 1, 1,
0.7030094, 0.1886413, 2.188207, 0.5607843, 0, 1, 1,
0.7032051, -0.3542793, 2.188354, 0.5647059, 0, 1, 1,
0.7069933, -0.5187702, 2.165642, 0.572549, 0, 1, 1,
0.7109147, -1.794953, 0.9377066, 0.5764706, 0, 1, 1,
0.7136351, 1.065529, 0.4288338, 0.5843138, 0, 1, 1,
0.7179198, 0.2671184, 1.556143, 0.5882353, 0, 1, 1,
0.7212185, 0.3953286, 0.2328709, 0.5960785, 0, 1, 1,
0.7214929, -1.153763, 3.804157, 0.6039216, 0, 1, 1,
0.7236537, 0.9576006, 1.422601, 0.6078432, 0, 1, 1,
0.7250188, -0.4239329, 2.17612, 0.6156863, 0, 1, 1,
0.7289858, -0.7814911, 2.027486, 0.6196079, 0, 1, 1,
0.7296728, 0.5256174, -0.123528, 0.627451, 0, 1, 1,
0.7304015, -0.1529097, 1.47881, 0.6313726, 0, 1, 1,
0.7375703, -0.09439211, 1.566172, 0.6392157, 0, 1, 1,
0.7447332, 0.9161998, 2.816662, 0.6431373, 0, 1, 1,
0.7515152, 0.3000148, 1.306328, 0.6509804, 0, 1, 1,
0.753165, -1.823239, 2.99336, 0.654902, 0, 1, 1,
0.7535233, 0.1549206, 1.144267, 0.6627451, 0, 1, 1,
0.7550195, 1.091932, 0.3786197, 0.6666667, 0, 1, 1,
0.7633094, 0.645861, 0.4950355, 0.6745098, 0, 1, 1,
0.7674257, -0.9617954, 3.853377, 0.6784314, 0, 1, 1,
0.7715399, -1.267773, 2.872473, 0.6862745, 0, 1, 1,
0.7718428, -1.669305, 2.910064, 0.6901961, 0, 1, 1,
0.7789608, -0.9699153, 3.156304, 0.6980392, 0, 1, 1,
0.7802696, -0.3434348, 3.414359, 0.7058824, 0, 1, 1,
0.7836424, 1.482666, 0.04993451, 0.7098039, 0, 1, 1,
0.7843373, -0.9993898, 2.522067, 0.7176471, 0, 1, 1,
0.7860022, 1.217717, -0.6817526, 0.7215686, 0, 1, 1,
0.7932479, -0.01118425, 1.496899, 0.7294118, 0, 1, 1,
0.7936885, -1.483639, 4.108899, 0.7333333, 0, 1, 1,
0.7950864, 0.2811002, 2.348728, 0.7411765, 0, 1, 1,
0.7972893, 0.5827359, -0.2844757, 0.7450981, 0, 1, 1,
0.7983319, 0.775282, 0.1205827, 0.7529412, 0, 1, 1,
0.8048639, -0.2519458, 0.9248127, 0.7568628, 0, 1, 1,
0.8056641, 0.8197803, 1.042563, 0.7647059, 0, 1, 1,
0.812256, -0.5119973, 0.9518951, 0.7686275, 0, 1, 1,
0.8145922, 0.6237613, 1.128141, 0.7764706, 0, 1, 1,
0.8185394, -0.399835, 1.881226, 0.7803922, 0, 1, 1,
0.8292004, 1.054894, -0.4000701, 0.7882353, 0, 1, 1,
0.8324503, -0.1854308, 0.6517842, 0.7921569, 0, 1, 1,
0.8347666, -0.499723, 1.59787, 0.8, 0, 1, 1,
0.8353283, -0.4145951, 1.608503, 0.8078431, 0, 1, 1,
0.8423225, 0.05564439, 1.313946, 0.8117647, 0, 1, 1,
0.8440688, 0.182492, 1.509168, 0.8196079, 0, 1, 1,
0.8444932, -0.06610754, 0.7339084, 0.8235294, 0, 1, 1,
0.8466899, 1.65828, -1.031183, 0.8313726, 0, 1, 1,
0.8479776, 1.765915, -0.00629975, 0.8352941, 0, 1, 1,
0.8511853, -2.261022, 2.896479, 0.8431373, 0, 1, 1,
0.8512556, -1.521535, 2.768514, 0.8470588, 0, 1, 1,
0.8538421, -0.1569644, 0.5358495, 0.854902, 0, 1, 1,
0.857994, -0.2443207, 2.378503, 0.8588235, 0, 1, 1,
0.8588963, -0.02955403, 3.101121, 0.8666667, 0, 1, 1,
0.8631926, 2.337643, 1.216618, 0.8705882, 0, 1, 1,
0.8636448, -0.3363176, 2.175829, 0.8784314, 0, 1, 1,
0.8648853, 1.295631, 0.5110901, 0.8823529, 0, 1, 1,
0.8663055, -2.105813, 2.062165, 0.8901961, 0, 1, 1,
0.8664003, 0.2334521, 0.01221685, 0.8941177, 0, 1, 1,
0.8756658, -0.2600383, 0.9730759, 0.9019608, 0, 1, 1,
0.8762758, 1.225255, 0.2261025, 0.9098039, 0, 1, 1,
0.8807546, 1.499053, 0.1202904, 0.9137255, 0, 1, 1,
0.8850194, 1.175072, 0.8468711, 0.9215686, 0, 1, 1,
0.8866562, 0.9362597, 3.170097, 0.9254902, 0, 1, 1,
0.8907452, 1.098102, 1.854139, 0.9333333, 0, 1, 1,
0.8936334, -1.19821, -0.02502226, 0.9372549, 0, 1, 1,
0.9090781, 2.361046, 2.557728, 0.945098, 0, 1, 1,
0.9156247, 0.1083251, 0.7010034, 0.9490196, 0, 1, 1,
0.9167148, -1.596144, 1.771421, 0.9568627, 0, 1, 1,
0.9178078, 0.3651866, 0.2548524, 0.9607843, 0, 1, 1,
0.9191132, 0.712981, 2.619198, 0.9686275, 0, 1, 1,
0.924111, 1.354431, -0.8935356, 0.972549, 0, 1, 1,
0.928839, -0.4562867, 1.824789, 0.9803922, 0, 1, 1,
0.9367576, 0.5471047, 1.229804, 0.9843137, 0, 1, 1,
0.9434994, 0.2393783, 1.650784, 0.9921569, 0, 1, 1,
0.9448501, 0.07106931, 0.8069494, 0.9960784, 0, 1, 1,
0.9529441, 0.1904512, 0.7628262, 1, 0, 0.9960784, 1,
0.9535077, 0.3386503, 1.523904, 1, 0, 0.9882353, 1,
0.9588509, -1.140554, 3.338491, 1, 0, 0.9843137, 1,
0.9667646, -1.969399, 2.528374, 1, 0, 0.9764706, 1,
0.970898, 0.389375, 2.26862, 1, 0, 0.972549, 1,
0.9716774, -0.177521, 2.942608, 1, 0, 0.9647059, 1,
0.9765825, 0.07971467, 1.143585, 1, 0, 0.9607843, 1,
0.9770762, 1.063025, 0.4481146, 1, 0, 0.9529412, 1,
0.9997047, -0.4199445, 2.61175, 1, 0, 0.9490196, 1,
1.003107, -1.009629, 2.904904, 1, 0, 0.9411765, 1,
1.005988, -1.360025, 2.846404, 1, 0, 0.9372549, 1,
1.00689, -0.3930271, 3.566558, 1, 0, 0.9294118, 1,
1.007752, -0.9153561, 1.171658, 1, 0, 0.9254902, 1,
1.016732, -0.6176236, 3.312679, 1, 0, 0.9176471, 1,
1.018303, 1.644884, 1.831657, 1, 0, 0.9137255, 1,
1.024575, -1.981617, 2.913825, 1, 0, 0.9058824, 1,
1.029376, -1.349415, 2.014858, 1, 0, 0.9019608, 1,
1.037221, 1.549989, 0.1579727, 1, 0, 0.8941177, 1,
1.045078, -0.6208375, 2.106582, 1, 0, 0.8862745, 1,
1.061579, -0.4105175, 1.887712, 1, 0, 0.8823529, 1,
1.063183, -0.07924072, 3.14403, 1, 0, 0.8745098, 1,
1.064674, 1.152374, 0.0002141254, 1, 0, 0.8705882, 1,
1.071948, -1.062472, 1.475241, 1, 0, 0.8627451, 1,
1.075364, -1.789057, 2.685573, 1, 0, 0.8588235, 1,
1.094618, -0.28466, 2.806779, 1, 0, 0.8509804, 1,
1.09756, 0.3798933, -0.4248297, 1, 0, 0.8470588, 1,
1.099171, 0.7989351, -0.3846319, 1, 0, 0.8392157, 1,
1.105308, 0.6817823, -0.6334552, 1, 0, 0.8352941, 1,
1.108252, 0.4313482, 1.288081, 1, 0, 0.827451, 1,
1.120208, -1.005729, 2.054451, 1, 0, 0.8235294, 1,
1.120766, -0.4354588, 2.499422, 1, 0, 0.8156863, 1,
1.126137, 0.7434983, 1.779788, 1, 0, 0.8117647, 1,
1.135108, 0.4503159, 1.008672, 1, 0, 0.8039216, 1,
1.138005, 0.5234737, 2.052678, 1, 0, 0.7960784, 1,
1.145176, 0.5607252, 1.04947, 1, 0, 0.7921569, 1,
1.146508, -0.006992097, 1.07387, 1, 0, 0.7843137, 1,
1.146884, -0.3995127, 1.731656, 1, 0, 0.7803922, 1,
1.147172, 0.1085938, 1.589278, 1, 0, 0.772549, 1,
1.148641, 0.3902433, 2.538829, 1, 0, 0.7686275, 1,
1.156411, -0.5059116, 0.5694752, 1, 0, 0.7607843, 1,
1.156904, 0.2163324, 1.203119, 1, 0, 0.7568628, 1,
1.160863, 0.7874887, 1.063297, 1, 0, 0.7490196, 1,
1.170254, -0.2095457, 1.464025, 1, 0, 0.7450981, 1,
1.182095, 0.789944, 0.5142451, 1, 0, 0.7372549, 1,
1.185507, -0.2453776, 1.86758, 1, 0, 0.7333333, 1,
1.201544, 1.056019, -0.17924, 1, 0, 0.7254902, 1,
1.207808, 0.7068281, 2.145316, 1, 0, 0.7215686, 1,
1.221174, 1.065313, 0.7962423, 1, 0, 0.7137255, 1,
1.2281, -0.05310576, 1.391674, 1, 0, 0.7098039, 1,
1.231145, 0.7893527, 0.490919, 1, 0, 0.7019608, 1,
1.231984, 0.8868591, -0.8950184, 1, 0, 0.6941177, 1,
1.235249, -0.8643793, 2.521977, 1, 0, 0.6901961, 1,
1.236748, 0.6238699, 2.440072, 1, 0, 0.682353, 1,
1.243118, 1.378919, -0.7994584, 1, 0, 0.6784314, 1,
1.243438, -0.9613506, 0.8835471, 1, 0, 0.6705883, 1,
1.243787, 0.2008292, 2.483906, 1, 0, 0.6666667, 1,
1.249995, -1.584128, 2.856138, 1, 0, 0.6588235, 1,
1.253012, -1.084002, 2.452518, 1, 0, 0.654902, 1,
1.256484, -1.016788, 2.846193, 1, 0, 0.6470588, 1,
1.257924, -0.7777405, 0.02003217, 1, 0, 0.6431373, 1,
1.266812, -1.94512, 3.135269, 1, 0, 0.6352941, 1,
1.268849, 1.198768, 1.184481, 1, 0, 0.6313726, 1,
1.275446, -1.22398, 4.698796, 1, 0, 0.6235294, 1,
1.291624, -1.468762, 1.363753, 1, 0, 0.6196079, 1,
1.297933, -1.294327, 3.333787, 1, 0, 0.6117647, 1,
1.300523, -0.1164056, 2.770786, 1, 0, 0.6078432, 1,
1.305601, 2.325406, -1.335886, 1, 0, 0.6, 1,
1.305801, 0.4513245, 1.985187, 1, 0, 0.5921569, 1,
1.306545, -1.257486, 2.368463, 1, 0, 0.5882353, 1,
1.307242, -1.453507, 4.508972, 1, 0, 0.5803922, 1,
1.308173, 0.1387389, 0.7820964, 1, 0, 0.5764706, 1,
1.308553, -0.7097292, 1.279457, 1, 0, 0.5686275, 1,
1.315734, -0.776282, 2.255349, 1, 0, 0.5647059, 1,
1.3244, -0.07841589, 2.628348, 1, 0, 0.5568628, 1,
1.330639, -0.755344, 3.251615, 1, 0, 0.5529412, 1,
1.346038, -0.6842611, 2.073982, 1, 0, 0.5450981, 1,
1.347883, 0.4097245, 1.171225, 1, 0, 0.5411765, 1,
1.349163, -0.4947312, 1.069423, 1, 0, 0.5333334, 1,
1.356834, -1.496855, 2.376036, 1, 0, 0.5294118, 1,
1.360034, -1.793792, 3.183483, 1, 0, 0.5215687, 1,
1.364912, 0.9433596, 1.120522, 1, 0, 0.5176471, 1,
1.367019, 0.5216964, -0.2134352, 1, 0, 0.509804, 1,
1.368156, 0.3136216, 0.2950702, 1, 0, 0.5058824, 1,
1.379225, -0.5824571, 1.436532, 1, 0, 0.4980392, 1,
1.379349, -0.3930155, 1.868633, 1, 0, 0.4901961, 1,
1.384409, 0.1797991, 1.173436, 1, 0, 0.4862745, 1,
1.38679, 0.495614, 0.6143002, 1, 0, 0.4784314, 1,
1.394634, -1.006085, 1.066372, 1, 0, 0.4745098, 1,
1.405073, -0.06742306, 0.1259032, 1, 0, 0.4666667, 1,
1.419684, 0.5468065, 1.470854, 1, 0, 0.4627451, 1,
1.4251, -0.713429, 0.4440079, 1, 0, 0.454902, 1,
1.443631, 0.892908, 1.975263, 1, 0, 0.4509804, 1,
1.444586, -0.7167996, 1.816989, 1, 0, 0.4431373, 1,
1.454552, 0.08647875, 2.854231, 1, 0, 0.4392157, 1,
1.454886, 0.4070732, 1.472686, 1, 0, 0.4313726, 1,
1.45504, -0.01217958, 3.418272, 1, 0, 0.427451, 1,
1.466219, 0.15287, 1.08338, 1, 0, 0.4196078, 1,
1.469254, -0.56677, 1.35089, 1, 0, 0.4156863, 1,
1.482382, 0.09265519, 0.3095213, 1, 0, 0.4078431, 1,
1.490976, -1.047117, 2.417482, 1, 0, 0.4039216, 1,
1.511265, 0.2198514, -1.333112, 1, 0, 0.3960784, 1,
1.517758, 1.777712, 0.08270098, 1, 0, 0.3882353, 1,
1.518791, -1.581798, 1.451148, 1, 0, 0.3843137, 1,
1.542967, 0.7262283, 0.6967064, 1, 0, 0.3764706, 1,
1.546438, -0.3081827, -0.05448575, 1, 0, 0.372549, 1,
1.551081, -0.002018124, 0.3228205, 1, 0, 0.3647059, 1,
1.573716, 2.764405, 0.0472093, 1, 0, 0.3607843, 1,
1.576909, 0.5526885, 0.5872326, 1, 0, 0.3529412, 1,
1.584486, -1.426968, 3.35448, 1, 0, 0.3490196, 1,
1.590189, 1.260326, 0.3948291, 1, 0, 0.3411765, 1,
1.59818, -0.6714522, 0.5741562, 1, 0, 0.3372549, 1,
1.614454, 1.467376, 1.805236, 1, 0, 0.3294118, 1,
1.616618, 0.4921214, 0.04307143, 1, 0, 0.3254902, 1,
1.641885, -0.08658339, 1.980843, 1, 0, 0.3176471, 1,
1.650364, 1.164691, 1.065964, 1, 0, 0.3137255, 1,
1.669033, -0.4223625, 0.7442527, 1, 0, 0.3058824, 1,
1.680929, -3.340305, 2.817703, 1, 0, 0.2980392, 1,
1.685896, 1.150682, 0.5476305, 1, 0, 0.2941177, 1,
1.687391, -0.4887035, 1.581409, 1, 0, 0.2862745, 1,
1.723172, -0.2515901, 3.303884, 1, 0, 0.282353, 1,
1.728595, -1.661235, 4.615403, 1, 0, 0.2745098, 1,
1.73391, -2.057683, 1.995107, 1, 0, 0.2705882, 1,
1.739262, -0.3706314, -0.3765895, 1, 0, 0.2627451, 1,
1.767255, 0.8476037, 2.489505, 1, 0, 0.2588235, 1,
1.779244, 0.7413466, 3.401141, 1, 0, 0.2509804, 1,
1.781043, 1.113762, 1.287588, 1, 0, 0.2470588, 1,
1.792343, 0.5864826, 0.0167578, 1, 0, 0.2392157, 1,
1.800578, 0.9313404, 1.039772, 1, 0, 0.2352941, 1,
1.810436, -1.225362, 3.069454, 1, 0, 0.227451, 1,
1.821365, -0.114069, 2.469591, 1, 0, 0.2235294, 1,
1.830433, -0.342705, 2.810251, 1, 0, 0.2156863, 1,
1.885103, -0.9703865, 1.593381, 1, 0, 0.2117647, 1,
1.889335, 0.1904808, 1.421142, 1, 0, 0.2039216, 1,
1.899802, -0.4022129, 0.9485826, 1, 0, 0.1960784, 1,
1.90152, 0.4706696, 0.695433, 1, 0, 0.1921569, 1,
1.907104, 0.7106515, 1.284427, 1, 0, 0.1843137, 1,
1.94637, 0.2492776, 1.432874, 1, 0, 0.1803922, 1,
1.951061, 0.7293518, 0.561174, 1, 0, 0.172549, 1,
1.957421, -0.9902343, 1.489852, 1, 0, 0.1686275, 1,
1.96717, 0.01616346, 3.931343, 1, 0, 0.1607843, 1,
1.979622, -0.6098339, 0.7989722, 1, 0, 0.1568628, 1,
1.987818, 1.468565, 1.267806, 1, 0, 0.1490196, 1,
1.993243, -0.5124415, 3.848227, 1, 0, 0.145098, 1,
2.011806, -0.5722537, 1.768049, 1, 0, 0.1372549, 1,
2.012862, -0.6894382, 0.3311814, 1, 0, 0.1333333, 1,
2.042619, 1.162521, 0.2932741, 1, 0, 0.1254902, 1,
2.049563, -1.385072, 1.125668, 1, 0, 0.1215686, 1,
2.055131, -1.091046, 1.977376, 1, 0, 0.1137255, 1,
2.057128, 0.3255346, 0.3575537, 1, 0, 0.1098039, 1,
2.067079, -0.09466173, 1.679702, 1, 0, 0.1019608, 1,
2.093792, -0.9816621, 1.014126, 1, 0, 0.09411765, 1,
2.118363, 0.03612946, 0.0695703, 1, 0, 0.09019608, 1,
2.127617, 0.5105604, 1.009181, 1, 0, 0.08235294, 1,
2.143234, 0.5745541, 1.607143, 1, 0, 0.07843138, 1,
2.166831, 0.3046583, 3.033839, 1, 0, 0.07058824, 1,
2.170085, 0.8312767, 1.074197, 1, 0, 0.06666667, 1,
2.229185, 0.4524632, 1.943254, 1, 0, 0.05882353, 1,
2.232945, -0.8067127, 2.393607, 1, 0, 0.05490196, 1,
2.249928, 0.05528225, -0.4089081, 1, 0, 0.04705882, 1,
2.297299, 0.1472818, 3.182048, 1, 0, 0.04313726, 1,
2.312581, 2.319028, 0.907872, 1, 0, 0.03529412, 1,
2.388224, -1.681433, 0.660096, 1, 0, 0.03137255, 1,
2.569407, -0.3171509, 2.496112, 1, 0, 0.02352941, 1,
2.769428, 1.135411, 1.914003, 1, 0, 0.01960784, 1,
2.79463, 0.03315413, 1.422731, 1, 0, 0.01176471, 1,
2.949807, 0.6558512, 2.569723, 1, 0, 0.007843138, 1
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
-0.5130836, -4.395993, -8.311337, 0, -0.5, 0.5, 0.5,
-0.5130836, -4.395993, -8.311337, 1, -0.5, 0.5, 0.5,
-0.5130836, -4.395993, -8.311337, 1, 1.5, 0.5, 0.5,
-0.5130836, -4.395993, -8.311337, 0, 1.5, 0.5, 0.5
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
-5.149894, -0.2261801, -8.311337, 0, -0.5, 0.5, 0.5,
-5.149894, -0.2261801, -8.311337, 1, -0.5, 0.5, 0.5,
-5.149894, -0.2261801, -8.311337, 1, 1.5, 0.5, 0.5,
-5.149894, -0.2261801, -8.311337, 0, 1.5, 0.5, 0.5
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
-5.149894, -4.395993, -0.5086715, 0, -0.5, 0.5, 0.5,
-5.149894, -4.395993, -0.5086715, 1, -0.5, 0.5, 0.5,
-5.149894, -4.395993, -0.5086715, 1, 1.5, 0.5, 0.5,
-5.149894, -4.395993, -0.5086715, 0, 1.5, 0.5, 0.5
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
-3, -3.433729, -6.510722,
2, -3.433729, -6.510722,
-3, -3.433729, -6.510722,
-3, -3.594106, -6.810824,
-2, -3.433729, -6.510722,
-2, -3.594106, -6.810824,
-1, -3.433729, -6.510722,
-1, -3.594106, -6.810824,
0, -3.433729, -6.510722,
0, -3.594106, -6.810824,
1, -3.433729, -6.510722,
1, -3.594106, -6.810824,
2, -3.433729, -6.510722,
2, -3.594106, -6.810824
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
-3, -3.914861, -7.411029, 0, -0.5, 0.5, 0.5,
-3, -3.914861, -7.411029, 1, -0.5, 0.5, 0.5,
-3, -3.914861, -7.411029, 1, 1.5, 0.5, 0.5,
-3, -3.914861, -7.411029, 0, 1.5, 0.5, 0.5,
-2, -3.914861, -7.411029, 0, -0.5, 0.5, 0.5,
-2, -3.914861, -7.411029, 1, -0.5, 0.5, 0.5,
-2, -3.914861, -7.411029, 1, 1.5, 0.5, 0.5,
-2, -3.914861, -7.411029, 0, 1.5, 0.5, 0.5,
-1, -3.914861, -7.411029, 0, -0.5, 0.5, 0.5,
-1, -3.914861, -7.411029, 1, -0.5, 0.5, 0.5,
-1, -3.914861, -7.411029, 1, 1.5, 0.5, 0.5,
-1, -3.914861, -7.411029, 0, 1.5, 0.5, 0.5,
0, -3.914861, -7.411029, 0, -0.5, 0.5, 0.5,
0, -3.914861, -7.411029, 1, -0.5, 0.5, 0.5,
0, -3.914861, -7.411029, 1, 1.5, 0.5, 0.5,
0, -3.914861, -7.411029, 0, 1.5, 0.5, 0.5,
1, -3.914861, -7.411029, 0, -0.5, 0.5, 0.5,
1, -3.914861, -7.411029, 1, -0.5, 0.5, 0.5,
1, -3.914861, -7.411029, 1, 1.5, 0.5, 0.5,
1, -3.914861, -7.411029, 0, 1.5, 0.5, 0.5,
2, -3.914861, -7.411029, 0, -0.5, 0.5, 0.5,
2, -3.914861, -7.411029, 1, -0.5, 0.5, 0.5,
2, -3.914861, -7.411029, 1, 1.5, 0.5, 0.5,
2, -3.914861, -7.411029, 0, 1.5, 0.5, 0.5
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
-4.079861, -3, -6.510722,
-4.079861, 2, -6.510722,
-4.079861, -3, -6.510722,
-4.2582, -3, -6.810824,
-4.079861, -2, -6.510722,
-4.2582, -2, -6.810824,
-4.079861, -1, -6.510722,
-4.2582, -1, -6.810824,
-4.079861, 0, -6.510722,
-4.2582, 0, -6.810824,
-4.079861, 1, -6.510722,
-4.2582, 1, -6.810824,
-4.079861, 2, -6.510722,
-4.2582, 2, -6.810824
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
-4.614878, -3, -7.411029, 0, -0.5, 0.5, 0.5,
-4.614878, -3, -7.411029, 1, -0.5, 0.5, 0.5,
-4.614878, -3, -7.411029, 1, 1.5, 0.5, 0.5,
-4.614878, -3, -7.411029, 0, 1.5, 0.5, 0.5,
-4.614878, -2, -7.411029, 0, -0.5, 0.5, 0.5,
-4.614878, -2, -7.411029, 1, -0.5, 0.5, 0.5,
-4.614878, -2, -7.411029, 1, 1.5, 0.5, 0.5,
-4.614878, -2, -7.411029, 0, 1.5, 0.5, 0.5,
-4.614878, -1, -7.411029, 0, -0.5, 0.5, 0.5,
-4.614878, -1, -7.411029, 1, -0.5, 0.5, 0.5,
-4.614878, -1, -7.411029, 1, 1.5, 0.5, 0.5,
-4.614878, -1, -7.411029, 0, 1.5, 0.5, 0.5,
-4.614878, 0, -7.411029, 0, -0.5, 0.5, 0.5,
-4.614878, 0, -7.411029, 1, -0.5, 0.5, 0.5,
-4.614878, 0, -7.411029, 1, 1.5, 0.5, 0.5,
-4.614878, 0, -7.411029, 0, 1.5, 0.5, 0.5,
-4.614878, 1, -7.411029, 0, -0.5, 0.5, 0.5,
-4.614878, 1, -7.411029, 1, -0.5, 0.5, 0.5,
-4.614878, 1, -7.411029, 1, 1.5, 0.5, 0.5,
-4.614878, 1, -7.411029, 0, 1.5, 0.5, 0.5,
-4.614878, 2, -7.411029, 0, -0.5, 0.5, 0.5,
-4.614878, 2, -7.411029, 1, -0.5, 0.5, 0.5,
-4.614878, 2, -7.411029, 1, 1.5, 0.5, 0.5,
-4.614878, 2, -7.411029, 0, 1.5, 0.5, 0.5
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
-4.079861, -3.433729, -6,
-4.079861, -3.433729, 4,
-4.079861, -3.433729, -6,
-4.2582, -3.594106, -6,
-4.079861, -3.433729, -4,
-4.2582, -3.594106, -4,
-4.079861, -3.433729, -2,
-4.2582, -3.594106, -2,
-4.079861, -3.433729, 0,
-4.2582, -3.594106, 0,
-4.079861, -3.433729, 2,
-4.2582, -3.594106, 2,
-4.079861, -3.433729, 4,
-4.2582, -3.594106, 4
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
-4.614878, -3.914861, -6, 0, -0.5, 0.5, 0.5,
-4.614878, -3.914861, -6, 1, -0.5, 0.5, 0.5,
-4.614878, -3.914861, -6, 1, 1.5, 0.5, 0.5,
-4.614878, -3.914861, -6, 0, 1.5, 0.5, 0.5,
-4.614878, -3.914861, -4, 0, -0.5, 0.5, 0.5,
-4.614878, -3.914861, -4, 1, -0.5, 0.5, 0.5,
-4.614878, -3.914861, -4, 1, 1.5, 0.5, 0.5,
-4.614878, -3.914861, -4, 0, 1.5, 0.5, 0.5,
-4.614878, -3.914861, -2, 0, -0.5, 0.5, 0.5,
-4.614878, -3.914861, -2, 1, -0.5, 0.5, 0.5,
-4.614878, -3.914861, -2, 1, 1.5, 0.5, 0.5,
-4.614878, -3.914861, -2, 0, 1.5, 0.5, 0.5,
-4.614878, -3.914861, 0, 0, -0.5, 0.5, 0.5,
-4.614878, -3.914861, 0, 1, -0.5, 0.5, 0.5,
-4.614878, -3.914861, 0, 1, 1.5, 0.5, 0.5,
-4.614878, -3.914861, 0, 0, 1.5, 0.5, 0.5,
-4.614878, -3.914861, 2, 0, -0.5, 0.5, 0.5,
-4.614878, -3.914861, 2, 1, -0.5, 0.5, 0.5,
-4.614878, -3.914861, 2, 1, 1.5, 0.5, 0.5,
-4.614878, -3.914861, 2, 0, 1.5, 0.5, 0.5,
-4.614878, -3.914861, 4, 0, -0.5, 0.5, 0.5,
-4.614878, -3.914861, 4, 1, -0.5, 0.5, 0.5,
-4.614878, -3.914861, 4, 1, 1.5, 0.5, 0.5,
-4.614878, -3.914861, 4, 0, 1.5, 0.5, 0.5
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
-4.079861, -3.433729, -6.510722,
-4.079861, 2.981369, -6.510722,
-4.079861, -3.433729, 5.493379,
-4.079861, 2.981369, 5.493379,
-4.079861, -3.433729, -6.510722,
-4.079861, -3.433729, 5.493379,
-4.079861, 2.981369, -6.510722,
-4.079861, 2.981369, 5.493379,
-4.079861, -3.433729, -6.510722,
3.053694, -3.433729, -6.510722,
-4.079861, -3.433729, 5.493379,
3.053694, -3.433729, 5.493379,
-4.079861, 2.981369, -6.510722,
3.053694, 2.981369, -6.510722,
-4.079861, 2.981369, 5.493379,
3.053694, 2.981369, 5.493379,
3.053694, -3.433729, -6.510722,
3.053694, 2.981369, -6.510722,
3.053694, -3.433729, 5.493379,
3.053694, 2.981369, 5.493379,
3.053694, -3.433729, -6.510722,
3.053694, -3.433729, 5.493379,
3.053694, 2.981369, -6.510722,
3.053694, 2.981369, 5.493379
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
var radius = 8.205589;
var distance = 36.50759;
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
mvMatrix.translate( 0.5130836, 0.2261801, 0.5086715 );
mvMatrix.scale( 1.243706, 1.382994, 0.7390845 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.50759);
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
aldicarb_sulfone<-read.table("aldicarb_sulfone.xyz")
```

```
## Error in read.table("aldicarb_sulfone.xyz"): no lines available in input
```

```r
x<-aldicarb_sulfone$V2
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
```

```r
y<-aldicarb_sulfone$V3
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
```

```r
z<-aldicarb_sulfone$V4
```

```
## Error in eval(expr, envir, enclos): object 'aldicarb_sulfone' not found
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
-3.975974, -1.879194, -1.92653, 0, 0, 1, 1, 1,
-3.298466, 0.1391368, -2.4292, 1, 0, 0, 1, 1,
-3.099691, 0.3844899, -1.0057, 1, 0, 0, 1, 1,
-2.855142, -2.666994, -2.334052, 1, 0, 0, 1, 1,
-2.794278, -1.030946, -1.83509, 1, 0, 0, 1, 1,
-2.637902, 0.2840048, -1.066265, 1, 0, 0, 1, 1,
-2.517748, 0.2885605, -0.8685436, 0, 0, 0, 1, 1,
-2.512501, -0.08695986, -0.8602185, 0, 0, 0, 1, 1,
-2.446323, -1.247062, -0.3874321, 0, 0, 0, 1, 1,
-2.43398, 0.8555586, -0.944747, 0, 0, 0, 1, 1,
-2.42143, -0.9715855, -2.472382, 0, 0, 0, 1, 1,
-2.400143, -0.7534971, 0.4459657, 0, 0, 0, 1, 1,
-2.392997, 0.02753113, -0.6301897, 0, 0, 0, 1, 1,
-2.346161, 0.1756969, -1.768738, 1, 1, 1, 1, 1,
-2.255879, 0.5450603, -0.3936343, 1, 1, 1, 1, 1,
-2.238899, 0.6500083, 1.773335, 1, 1, 1, 1, 1,
-2.197556, 1.407251, -1.646363, 1, 1, 1, 1, 1,
-2.174644, -0.4182586, -1.313066, 1, 1, 1, 1, 1,
-2.145834, -0.5989919, -2.131492, 1, 1, 1, 1, 1,
-2.116245, 0.7500931, -1.199082, 1, 1, 1, 1, 1,
-2.079684, 1.610701, -0.4006284, 1, 1, 1, 1, 1,
-2.064832, 1.529603, -2.561667, 1, 1, 1, 1, 1,
-2.029067, -0.04451396, -0.8083803, 1, 1, 1, 1, 1,
-2.01824, -0.3835948, -1.797093, 1, 1, 1, 1, 1,
-2.006233, -0.2724886, -1.908658, 1, 1, 1, 1, 1,
-1.974869, -1.587697, -2.918973, 1, 1, 1, 1, 1,
-1.904062, -0.07275653, -2.355257, 1, 1, 1, 1, 1,
-1.90147, 1.665293, 0.9536613, 1, 1, 1, 1, 1,
-1.883552, -1.121135, -1.896732, 0, 0, 1, 1, 1,
-1.876819, 0.3215752, -1.856387, 1, 0, 0, 1, 1,
-1.871, 0.08918341, -1.095623, 1, 0, 0, 1, 1,
-1.857408, 0.3454584, -1.84756, 1, 0, 0, 1, 1,
-1.85178, 0.7995042, -1.940822, 1, 0, 0, 1, 1,
-1.84085, 1.011527, 0.1603626, 1, 0, 0, 1, 1,
-1.818632, -1.761923, -2.208814, 0, 0, 0, 1, 1,
-1.815452, -0.4049638, -2.441871, 0, 0, 0, 1, 1,
-1.810328, 1.686416, -0.5313095, 0, 0, 0, 1, 1,
-1.808525, -0.802968, -1.810932, 0, 0, 0, 1, 1,
-1.806736, 1.047707, 0.6568083, 0, 0, 0, 1, 1,
-1.804356, -0.1238878, -2.457249, 0, 0, 0, 1, 1,
-1.790956, -1.151086, -1.237897, 0, 0, 0, 1, 1,
-1.78408, 0.7574816, -2.220393, 1, 1, 1, 1, 1,
-1.767333, -0.4198584, -1.63157, 1, 1, 1, 1, 1,
-1.765558, 0.3906685, -2.788096, 1, 1, 1, 1, 1,
-1.726731, 0.3260244, -0.2239801, 1, 1, 1, 1, 1,
-1.72453, -0.7940248, 0.07117305, 1, 1, 1, 1, 1,
-1.70863, 0.3979414, -3.816517, 1, 1, 1, 1, 1,
-1.708346, -1.111525, -3.177486, 1, 1, 1, 1, 1,
-1.696217, 1.644399, -1.479802, 1, 1, 1, 1, 1,
-1.691169, -0.2572117, 0.009856614, 1, 1, 1, 1, 1,
-1.684079, -0.7246317, -1.809653, 1, 1, 1, 1, 1,
-1.681636, -0.5887937, -1.785672, 1, 1, 1, 1, 1,
-1.670058, -0.3076838, -3.383292, 1, 1, 1, 1, 1,
-1.663787, 0.7094367, -1.295494, 1, 1, 1, 1, 1,
-1.658374, -0.2761717, -1.143361, 1, 1, 1, 1, 1,
-1.658294, -0.01044972, -2.165228, 1, 1, 1, 1, 1,
-1.657506, -0.007074863, -1.101486, 0, 0, 1, 1, 1,
-1.634038, 0.2642608, -0.02966896, 1, 0, 0, 1, 1,
-1.61265, -0.8115386, -1.681251, 1, 0, 0, 1, 1,
-1.589062, 1.220688, -2.493341, 1, 0, 0, 1, 1,
-1.579452, -1.118688, -3.599129, 1, 0, 0, 1, 1,
-1.57442, 1.399181, -1.673802, 1, 0, 0, 1, 1,
-1.57396, -0.7326137, -0.8400975, 0, 0, 0, 1, 1,
-1.564426, 1.18747, -1.45988, 0, 0, 0, 1, 1,
-1.548463, 1.076714, -2.396426, 0, 0, 0, 1, 1,
-1.543883, -0.2984709, -1.525304, 0, 0, 0, 1, 1,
-1.514803, -1.913963, -0.2512333, 0, 0, 0, 1, 1,
-1.512296, -0.724254, -2.359921, 0, 0, 0, 1, 1,
-1.504875, -1.493725, -1.766509, 0, 0, 0, 1, 1,
-1.503703, 2.53518, 0.1674505, 1, 1, 1, 1, 1,
-1.503024, 0.5257146, -1.401012, 1, 1, 1, 1, 1,
-1.495917, -0.637297, -1.472204, 1, 1, 1, 1, 1,
-1.487944, 1.109808, -2.535938, 1, 1, 1, 1, 1,
-1.482896, -0.6291806, -1.907945, 1, 1, 1, 1, 1,
-1.47903, -1.03224, -4.235343, 1, 1, 1, 1, 1,
-1.461184, 0.541993, -1.926171, 1, 1, 1, 1, 1,
-1.46073, -0.2002114, 0.4863071, 1, 1, 1, 1, 1,
-1.451795, 1.192228, -1.15384, 1, 1, 1, 1, 1,
-1.449661, -0.510117, -2.113517, 1, 1, 1, 1, 1,
-1.439975, -1.03477, -3.09848, 1, 1, 1, 1, 1,
-1.437637, -0.67255, -1.830305, 1, 1, 1, 1, 1,
-1.433308, -0.6495596, -1.791491, 1, 1, 1, 1, 1,
-1.432264, -1.406858, -2.422626, 1, 1, 1, 1, 1,
-1.425761, 0.7475601, -2.184355, 1, 1, 1, 1, 1,
-1.411143, -0.5740053, -2.567771, 0, 0, 1, 1, 1,
-1.407572, -1.067595, -3.159356, 1, 0, 0, 1, 1,
-1.404477, -0.4457758, -0.1230246, 1, 0, 0, 1, 1,
-1.395914, 1.36771, -0.1850527, 1, 0, 0, 1, 1,
-1.39338, -2.078358, -4.07808, 1, 0, 0, 1, 1,
-1.382153, -1.500649, -2.204513, 1, 0, 0, 1, 1,
-1.376837, 0.4433723, 0.1362087, 0, 0, 0, 1, 1,
-1.364313, -1.328253, -3.142346, 0, 0, 0, 1, 1,
-1.351963, -0.1121777, -0.7371463, 0, 0, 0, 1, 1,
-1.350759, -0.2441225, -1.806381, 0, 0, 0, 1, 1,
-1.335788, 0.1506917, -1.153006, 0, 0, 0, 1, 1,
-1.323927, -0.5909357, -1.212312, 0, 0, 0, 1, 1,
-1.322648, 0.5402188, -1.779679, 0, 0, 0, 1, 1,
-1.319072, 1.111717, -2.69927, 1, 1, 1, 1, 1,
-1.314813, 0.3812131, -0.8809481, 1, 1, 1, 1, 1,
-1.313454, -0.02512964, -0.858317, 1, 1, 1, 1, 1,
-1.310951, -0.1973492, -3.639368, 1, 1, 1, 1, 1,
-1.309559, -0.8424419, -1.285098, 1, 1, 1, 1, 1,
-1.307053, 1.764285, -0.6756169, 1, 1, 1, 1, 1,
-1.302409, -0.913189, -1.731891, 1, 1, 1, 1, 1,
-1.301026, -1.1049, -2.871401, 1, 1, 1, 1, 1,
-1.299601, 1.049916, -1.570166, 1, 1, 1, 1, 1,
-1.299463, 1.338446, -3.361214, 1, 1, 1, 1, 1,
-1.294917, -0.7580625, -3.52663, 1, 1, 1, 1, 1,
-1.292174, 0.8394176, -0.1770159, 1, 1, 1, 1, 1,
-1.280227, 0.6388348, -2.758295, 1, 1, 1, 1, 1,
-1.265083, 0.1763753, -1.730415, 1, 1, 1, 1, 1,
-1.263119, 0.629883, -0.09965035, 1, 1, 1, 1, 1,
-1.255344, 1.127723, -1.302075, 0, 0, 1, 1, 1,
-1.255013, 0.038208, -1.941877, 1, 0, 0, 1, 1,
-1.254109, -0.7749752, -2.00509, 1, 0, 0, 1, 1,
-1.24645, -0.7080615, -2.625563, 1, 0, 0, 1, 1,
-1.237794, 0.7781151, -2.903235, 1, 0, 0, 1, 1,
-1.237687, -1.077488, -1.051691, 1, 0, 0, 1, 1,
-1.226635, 0.6170721, 0.9786084, 0, 0, 0, 1, 1,
-1.221623, 0.6516569, -2.143699, 0, 0, 0, 1, 1,
-1.21804, -0.389555, -0.9191327, 0, 0, 0, 1, 1,
-1.213334, -0.111248, -2.513623, 0, 0, 0, 1, 1,
-1.211832, 1.454545, -0.9238498, 0, 0, 0, 1, 1,
-1.210749, 1.20046, -0.3234224, 0, 0, 0, 1, 1,
-1.196015, 0.3888879, 0.1299814, 0, 0, 0, 1, 1,
-1.192602, -1.444802, -2.215632, 1, 1, 1, 1, 1,
-1.186029, -0.8656701, -3.295433, 1, 1, 1, 1, 1,
-1.185817, 1.005405, -2.864019, 1, 1, 1, 1, 1,
-1.184692, 0.6337726, -1.330733, 1, 1, 1, 1, 1,
-1.182238, 1.591381, -0.7474237, 1, 1, 1, 1, 1,
-1.173712, -0.4896229, -3.425806, 1, 1, 1, 1, 1,
-1.171582, 0.3759877, 0.8164765, 1, 1, 1, 1, 1,
-1.171308, 0.8927386, -1.166581, 1, 1, 1, 1, 1,
-1.170763, 1.162883, -1.443127, 1, 1, 1, 1, 1,
-1.170657, -0.5004815, -2.054621, 1, 1, 1, 1, 1,
-1.167497, 0.247372, -1.371737, 1, 1, 1, 1, 1,
-1.165362, 0.4400744, -0.09713938, 1, 1, 1, 1, 1,
-1.165265, -0.7114385, -2.613686, 1, 1, 1, 1, 1,
-1.14955, 0.2391164, -3.234631, 1, 1, 1, 1, 1,
-1.146812, -0.07187654, -1.753905, 1, 1, 1, 1, 1,
-1.137402, -0.3470857, -2.108524, 0, 0, 1, 1, 1,
-1.136943, -0.383859, -1.872222, 1, 0, 0, 1, 1,
-1.136939, -1.951493, -2.090784, 1, 0, 0, 1, 1,
-1.13168, 0.2308139, -0.9020613, 1, 0, 0, 1, 1,
-1.129354, -1.717467, -3.783368, 1, 0, 0, 1, 1,
-1.120522, 0.3093218, -0.3892065, 1, 0, 0, 1, 1,
-1.115748, -1.207815, -3.110855, 0, 0, 0, 1, 1,
-1.113505, 1.075273, 0.1813958, 0, 0, 0, 1, 1,
-1.112461, 0.3779868, -2.146884, 0, 0, 0, 1, 1,
-1.105499, 1.215129, -1.272307, 0, 0, 0, 1, 1,
-1.092923, -0.9154219, -1.720394, 0, 0, 0, 1, 1,
-1.089766, -1.056838, -2.510332, 0, 0, 0, 1, 1,
-1.071287, -0.6770435, -4.796524, 0, 0, 0, 1, 1,
-1.066489, -0.09671784, -3.405472, 1, 1, 1, 1, 1,
-1.056867, -0.2888197, -1.789947, 1, 1, 1, 1, 1,
-1.056817, 2.489222, -0.6291478, 1, 1, 1, 1, 1,
-1.05565, -1.331693, -3.938743, 1, 1, 1, 1, 1,
-1.054902, -1.133098, -2.264529, 1, 1, 1, 1, 1,
-1.050746, -0.1632664, -1.94429, 1, 1, 1, 1, 1,
-1.049571, -2.333618, -1.163362, 1, 1, 1, 1, 1,
-1.046338, 1.264937, -0.2903163, 1, 1, 1, 1, 1,
-1.031439, -0.4916788, -2.227443, 1, 1, 1, 1, 1,
-1.027717, -0.3989138, -1.595007, 1, 1, 1, 1, 1,
-1.021785, 2.887945, -0.9336823, 1, 1, 1, 1, 1,
-1.012388, 0.6907085, -1.526708, 1, 1, 1, 1, 1,
-1.004149, 2.08882, -1.268955, 1, 1, 1, 1, 1,
-0.9998433, -0.1339784, -0.8647846, 1, 1, 1, 1, 1,
-0.9993284, -0.0862441, -2.191914, 1, 1, 1, 1, 1,
-0.9988405, 0.2302447, -1.007049, 0, 0, 1, 1, 1,
-0.9985432, -0.2006224, -1.577654, 1, 0, 0, 1, 1,
-0.9928998, 1.045452, 1.228764, 1, 0, 0, 1, 1,
-0.9837674, 0.06936693, -1.273834, 1, 0, 0, 1, 1,
-0.9821709, 1.639715, -0.1649176, 1, 0, 0, 1, 1,
-0.9593796, 0.03318014, -1.183068, 1, 0, 0, 1, 1,
-0.9529417, 0.4891989, -2.85245, 0, 0, 0, 1, 1,
-0.9443812, 0.04839465, -1.83561, 0, 0, 0, 1, 1,
-0.9435712, -2.084446, -2.713602, 0, 0, 0, 1, 1,
-0.9350495, 1.02018, -2.292243, 0, 0, 0, 1, 1,
-0.9143334, 0.3792166, -1.608135, 0, 0, 0, 1, 1,
-0.904395, 0.03127421, -2.362843, 0, 0, 0, 1, 1,
-0.9035234, 0.3248044, -0.6911246, 0, 0, 0, 1, 1,
-0.9007284, 0.4327097, -0.1920488, 1, 1, 1, 1, 1,
-0.8981884, 0.8132765, 0.9174368, 1, 1, 1, 1, 1,
-0.8909343, -0.4321092, -2.384562, 1, 1, 1, 1, 1,
-0.8890948, 2.324279, 0.3535683, 1, 1, 1, 1, 1,
-0.8858478, 1.37867, -1.519997, 1, 1, 1, 1, 1,
-0.8855186, 1.519386, 1.293992, 1, 1, 1, 1, 1,
-0.8803377, -0.5750437, -1.934573, 1, 1, 1, 1, 1,
-0.875322, 0.1729811, -2.739565, 1, 1, 1, 1, 1,
-0.8750787, -0.9837588, -3.368777, 1, 1, 1, 1, 1,
-0.8734641, -0.2806734, -3.141854, 1, 1, 1, 1, 1,
-0.8690327, 0.615533, 0.008227471, 1, 1, 1, 1, 1,
-0.8664619, 0.7141089, -1.856946, 1, 1, 1, 1, 1,
-0.8653647, 0.5092441, -0.3650463, 1, 1, 1, 1, 1,
-0.8648041, 0.8830271, -0.8725027, 1, 1, 1, 1, 1,
-0.8583207, -1.395164, -2.998275, 1, 1, 1, 1, 1,
-0.8558275, -0.8975183, -2.744387, 0, 0, 1, 1, 1,
-0.8542493, 1.340317, -1.479344, 1, 0, 0, 1, 1,
-0.8540714, -0.5861583, -0.8268266, 1, 0, 0, 1, 1,
-0.8452683, -0.6390725, -1.650331, 1, 0, 0, 1, 1,
-0.8440574, 2.294556, 0.1062953, 1, 0, 0, 1, 1,
-0.8424571, -1.0882, -2.66304, 1, 0, 0, 1, 1,
-0.8415093, -0.1248026, -2.401297, 0, 0, 0, 1, 1,
-0.837736, -0.9510823, -1.686871, 0, 0, 0, 1, 1,
-0.8371044, -1.096737, -1.49168, 0, 0, 0, 1, 1,
-0.8369637, -0.9145029, -0.0154749, 0, 0, 0, 1, 1,
-0.8362507, -0.7457344, -1.538641, 0, 0, 0, 1, 1,
-0.83438, -0.8903884, -3.095204, 0, 0, 0, 1, 1,
-0.8314161, 0.3278462, -1.06407, 0, 0, 0, 1, 1,
-0.827051, 0.6304175, 0.7642153, 1, 1, 1, 1, 1,
-0.8250852, 0.1864702, -2.789608, 1, 1, 1, 1, 1,
-0.8238095, -2.094402, -1.278699, 1, 1, 1, 1, 1,
-0.8224643, -1.315312, -3.927964, 1, 1, 1, 1, 1,
-0.8204067, -1.121423, -2.037366, 1, 1, 1, 1, 1,
-0.8201758, 0.246832, -1.892546, 1, 1, 1, 1, 1,
-0.8077066, -2.594705, -2.72549, 1, 1, 1, 1, 1,
-0.8061353, 1.082321, -3.382679, 1, 1, 1, 1, 1,
-0.8039769, 0.3444165, -0.1939605, 1, 1, 1, 1, 1,
-0.8020074, 1.254098, -0.4536884, 1, 1, 1, 1, 1,
-0.8009771, -0.50511, -1.164267, 1, 1, 1, 1, 1,
-0.7982838, -0.7417684, -2.859167, 1, 1, 1, 1, 1,
-0.7964706, 0.5931095, -0.9215679, 1, 1, 1, 1, 1,
-0.7958743, 0.7350973, -0.9222778, 1, 1, 1, 1, 1,
-0.7931766, 0.2869443, 0.1538495, 1, 1, 1, 1, 1,
-0.7923264, -0.133879, -2.422036, 0, 0, 1, 1, 1,
-0.7914099, -1.567248, -3.959813, 1, 0, 0, 1, 1,
-0.7872583, 1.080867, -1.293504, 1, 0, 0, 1, 1,
-0.7829276, 1.504261, -1.095574, 1, 0, 0, 1, 1,
-0.774806, -2.108687, -1.484974, 1, 0, 0, 1, 1,
-0.7703285, -2.570979, -2.67568, 1, 0, 0, 1, 1,
-0.7674038, 0.9930477, -1.106502, 0, 0, 0, 1, 1,
-0.7663172, -1.770202, -3.629994, 0, 0, 0, 1, 1,
-0.7633643, 0.6716912, -0.2684919, 0, 0, 0, 1, 1,
-0.7624714, -0.4970068, -2.922135, 0, 0, 0, 1, 1,
-0.7622379, 0.6106523, 1.23728, 0, 0, 0, 1, 1,
-0.7606007, -0.4425884, -2.02816, 0, 0, 0, 1, 1,
-0.7535877, -1.086898, -2.70326, 0, 0, 0, 1, 1,
-0.7526855, -0.4133072, -3.457933, 1, 1, 1, 1, 1,
-0.7477434, -0.9328446, -6.335905, 1, 1, 1, 1, 1,
-0.7466339, 0.05245053, -2.629415, 1, 1, 1, 1, 1,
-0.7463586, 0.6522113, -1.393465, 1, 1, 1, 1, 1,
-0.7462147, 0.6703128, -0.7011388, 1, 1, 1, 1, 1,
-0.7451316, -0.4033976, -1.006667, 1, 1, 1, 1, 1,
-0.7303501, -0.3091241, -1.615231, 1, 1, 1, 1, 1,
-0.7256048, -0.6510758, -2.011466, 1, 1, 1, 1, 1,
-0.7227439, 0.2924477, 0.1599599, 1, 1, 1, 1, 1,
-0.719692, -1.728036, -3.575589, 1, 1, 1, 1, 1,
-0.7152995, -0.1900145, -1.570269, 1, 1, 1, 1, 1,
-0.7134026, -1.27804, -2.27352, 1, 1, 1, 1, 1,
-0.7107862, -1.056764, -2.480314, 1, 1, 1, 1, 1,
-0.7064362, 0.5408448, -1.13799, 1, 1, 1, 1, 1,
-0.70632, -0.2856758, -4.014843, 1, 1, 1, 1, 1,
-0.7019773, -1.168109, -2.19515, 0, 0, 1, 1, 1,
-0.7001402, -0.08578834, -0.08235162, 1, 0, 0, 1, 1,
-0.6949361, -0.1228359, -1.500827, 1, 0, 0, 1, 1,
-0.6795547, 1.703404, 1.195903, 1, 0, 0, 1, 1,
-0.6765552, 1.004484, 0.1329079, 1, 0, 0, 1, 1,
-0.6733329, -0.3058261, -2.249645, 1, 0, 0, 1, 1,
-0.6705604, 0.2465299, -1.903386, 0, 0, 0, 1, 1,
-0.6675769, -1.347998, -4.958257, 0, 0, 0, 1, 1,
-0.6668203, -0.3018144, -2.70091, 0, 0, 0, 1, 1,
-0.6666496, -0.4864254, -2.496676, 0, 0, 0, 1, 1,
-0.6659966, -1.306086, -1.887018, 0, 0, 0, 1, 1,
-0.6535386, 0.6184322, -0.7554628, 0, 0, 0, 1, 1,
-0.6526824, -1.647566, -3.032092, 0, 0, 0, 1, 1,
-0.65005, -1.517433, -4.385162, 1, 1, 1, 1, 1,
-0.6500261, -0.1086432, -1.883098, 1, 1, 1, 1, 1,
-0.6464368, 1.125492, -1.308257, 1, 1, 1, 1, 1,
-0.6412739, -0.3582469, -2.722637, 1, 1, 1, 1, 1,
-0.6360753, 0.2564145, -1.870464, 1, 1, 1, 1, 1,
-0.6336225, 0.01226543, -2.638052, 1, 1, 1, 1, 1,
-0.6332369, -1.679145, -2.321362, 1, 1, 1, 1, 1,
-0.6321925, 1.735899, -3.032236, 1, 1, 1, 1, 1,
-0.6300806, 0.1478001, -0.9963168, 1, 1, 1, 1, 1,
-0.6275492, -0.3990856, -0.4605647, 1, 1, 1, 1, 1,
-0.6251376, 0.4577466, -1.341638, 1, 1, 1, 1, 1,
-0.624698, 0.1568178, 0.4609061, 1, 1, 1, 1, 1,
-0.6241274, 0.3925075, -2.54251, 1, 1, 1, 1, 1,
-0.6236204, 0.3973569, -1.715328, 1, 1, 1, 1, 1,
-0.623403, 1.386121, -1.40154, 1, 1, 1, 1, 1,
-0.6201542, 0.7453106, -0.1355605, 0, 0, 1, 1, 1,
-0.61844, -2.758132, -2.262167, 1, 0, 0, 1, 1,
-0.617252, 0.1956074, -2.046318, 1, 0, 0, 1, 1,
-0.6168991, -0.5393409, -4.309508, 1, 0, 0, 1, 1,
-0.6124897, 0.5133757, -2.520655, 1, 0, 0, 1, 1,
-0.6086695, 0.1975629, -1.349162, 1, 0, 0, 1, 1,
-0.6050434, 0.3563359, -0.6264033, 0, 0, 0, 1, 1,
-0.6016687, -1.37333, -2.235661, 0, 0, 0, 1, 1,
-0.6008886, 0.2908825, 0.1504958, 0, 0, 0, 1, 1,
-0.5973055, 1.173764, 1.443583, 0, 0, 0, 1, 1,
-0.583997, 0.4267926, -2.299036, 0, 0, 0, 1, 1,
-0.5821416, 1.451017, -0.798117, 0, 0, 0, 1, 1,
-0.5804393, -0.2898632, -1.95028, 0, 0, 0, 1, 1,
-0.5774001, -0.5500181, -1.632612, 1, 1, 1, 1, 1,
-0.5744765, -1.17086, -0.1176343, 1, 1, 1, 1, 1,
-0.572139, -1.684107, -2.65343, 1, 1, 1, 1, 1,
-0.5717987, -0.5230597, -1.420474, 1, 1, 1, 1, 1,
-0.5654211, 0.02298556, -1.612865, 1, 1, 1, 1, 1,
-0.5652903, -0.03112821, -0.7106384, 1, 1, 1, 1, 1,
-0.5638987, -0.1907975, -2.553066, 1, 1, 1, 1, 1,
-0.5622592, -0.1891854, -2.210042, 1, 1, 1, 1, 1,
-0.5581955, 0.2555607, -3.2799, 1, 1, 1, 1, 1,
-0.5537054, -1.112644, -2.705318, 1, 1, 1, 1, 1,
-0.5522531, 0.6569473, -1.226676, 1, 1, 1, 1, 1,
-0.5520793, -0.6635192, -2.167265, 1, 1, 1, 1, 1,
-0.5517895, 0.6854339, -0.7945153, 1, 1, 1, 1, 1,
-0.5447333, 0.7051696, -1.1334, 1, 1, 1, 1, 1,
-0.5374815, -0.4324019, -2.425588, 1, 1, 1, 1, 1,
-0.5326049, 0.9424233, 0.890263, 0, 0, 1, 1, 1,
-0.5321978, -0.4099674, -0.8357823, 1, 0, 0, 1, 1,
-0.5226759, 0.8035387, 0.2739702, 1, 0, 0, 1, 1,
-0.5219494, 0.03989611, -2.22526, 1, 0, 0, 1, 1,
-0.5207295, 0.5547847, -0.3907064, 1, 0, 0, 1, 1,
-0.5188391, -0.7929585, -2.790513, 1, 0, 0, 1, 1,
-0.5185784, 0.2079836, -2.419864, 0, 0, 0, 1, 1,
-0.5134978, 2.04457, -0.03082892, 0, 0, 0, 1, 1,
-0.5131717, -1.172935, -3.145514, 0, 0, 0, 1, 1,
-0.5066604, 0.1090655, -1.690378, 0, 0, 0, 1, 1,
-0.5023129, 0.6323726, -0.3694564, 0, 0, 0, 1, 1,
-0.4995758, 1.123563, 0.1444069, 0, 0, 0, 1, 1,
-0.4953582, 0.09089429, -0.5567302, 0, 0, 0, 1, 1,
-0.4950807, 0.3931554, -0.1177792, 1, 1, 1, 1, 1,
-0.4948177, 1.054671, -0.8945532, 1, 1, 1, 1, 1,
-0.4942147, -0.6536041, -3.069244, 1, 1, 1, 1, 1,
-0.4852617, 0.6645055, 0.1118739, 1, 1, 1, 1, 1,
-0.4792731, -0.8559324, -2.158271, 1, 1, 1, 1, 1,
-0.4772192, 0.5096784, -1.458018, 1, 1, 1, 1, 1,
-0.4706999, 1.123865, -1.032431, 1, 1, 1, 1, 1,
-0.4695903, -0.7045171, -3.552345, 1, 1, 1, 1, 1,
-0.4680659, -0.997443, -2.896008, 1, 1, 1, 1, 1,
-0.4670375, -0.7881173, -1.789922, 1, 1, 1, 1, 1,
-0.4669072, -0.3722423, -1.740121, 1, 1, 1, 1, 1,
-0.4610503, -1.594442, -2.171014, 1, 1, 1, 1, 1,
-0.4584799, 0.4439501, -1.349183, 1, 1, 1, 1, 1,
-0.4523544, -0.1489414, -2.38374, 1, 1, 1, 1, 1,
-0.4494725, 1.0131, 1.251017, 1, 1, 1, 1, 1,
-0.4491433, 0.8991255, -1.381904, 0, 0, 1, 1, 1,
-0.4391471, 0.2904172, 0.04849971, 1, 0, 0, 1, 1,
-0.4385104, 1.114038, -2.078983, 1, 0, 0, 1, 1,
-0.436163, -0.1382224, -1.908502, 1, 0, 0, 1, 1,
-0.4343492, -0.8828564, -3.993859, 1, 0, 0, 1, 1,
-0.434169, 1.760231, -0.1051952, 1, 0, 0, 1, 1,
-0.4253702, -0.3010026, -0.230964, 0, 0, 0, 1, 1,
-0.4248948, -0.2943319, -2.458776, 0, 0, 0, 1, 1,
-0.4193789, -1.582035, -0.8896149, 0, 0, 0, 1, 1,
-0.4100498, 0.5494335, -0.9481733, 0, 0, 0, 1, 1,
-0.4066076, -0.986476, -4.382018, 0, 0, 0, 1, 1,
-0.4051808, -0.7132926, -0.9132946, 0, 0, 0, 1, 1,
-0.4045197, -0.5845401, -2.466463, 0, 0, 0, 1, 1,
-0.4029837, 1.066455, -0.3065354, 1, 1, 1, 1, 1,
-0.4010804, 1.432655, -1.940736, 1, 1, 1, 1, 1,
-0.4010779, -0.4237514, -1.011603, 1, 1, 1, 1, 1,
-0.3955246, 0.5424808, -1.05702, 1, 1, 1, 1, 1,
-0.3921836, -0.3310408, -1.470939, 1, 1, 1, 1, 1,
-0.389434, 1.453108, -0.2341305, 1, 1, 1, 1, 1,
-0.386324, 1.020487, -0.701732, 1, 1, 1, 1, 1,
-0.3816297, 0.7530803, -0.7541769, 1, 1, 1, 1, 1,
-0.3683696, 0.01976222, -1.115551, 1, 1, 1, 1, 1,
-0.3674297, -0.2066997, -2.57928, 1, 1, 1, 1, 1,
-0.3632635, -0.1151376, -0.7092741, 1, 1, 1, 1, 1,
-0.360808, 1.176114, -1.008082, 1, 1, 1, 1, 1,
-0.3601147, -0.7428782, -4.881567, 1, 1, 1, 1, 1,
-0.359248, 0.05252317, -0.9977859, 1, 1, 1, 1, 1,
-0.35588, -1.037972, -2.483858, 1, 1, 1, 1, 1,
-0.3491573, 0.4659469, -1.534839, 0, 0, 1, 1, 1,
-0.3457039, 0.2505826, -1.423513, 1, 0, 0, 1, 1,
-0.3412134, 0.9939575, 0.5518085, 1, 0, 0, 1, 1,
-0.3379616, -1.528815, -3.403701, 1, 0, 0, 1, 1,
-0.332662, -0.4952835, -1.869447, 1, 0, 0, 1, 1,
-0.3281733, -0.4638455, -2.34818, 1, 0, 0, 1, 1,
-0.325745, -0.6801528, -2.457951, 0, 0, 0, 1, 1,
-0.3255599, 0.4810536, 1.278295, 0, 0, 0, 1, 1,
-0.3219301, 0.4055836, -1.802337, 0, 0, 0, 1, 1,
-0.3208811, -0.1181529, -1.217963, 0, 0, 0, 1, 1,
-0.3205617, -0.8594804, -1.875021, 0, 0, 0, 1, 1,
-0.3169923, 0.9053924, 0.6081976, 0, 0, 0, 1, 1,
-0.3134445, -0.1726433, -1.414294, 0, 0, 0, 1, 1,
-0.3118216, 0.7890413, -0.2573363, 1, 1, 1, 1, 1,
-0.3113099, -0.8831421, -4.280123, 1, 1, 1, 1, 1,
-0.3109025, 0.8762426, 1.041364, 1, 1, 1, 1, 1,
-0.309639, 0.6213143, -0.5967839, 1, 1, 1, 1, 1,
-0.3092783, 0.3694578, -1.890443, 1, 1, 1, 1, 1,
-0.3089206, 0.7570993, -1.234381, 1, 1, 1, 1, 1,
-0.3088985, 0.04066537, -1.556906, 1, 1, 1, 1, 1,
-0.307171, 0.04939143, -3.364594, 1, 1, 1, 1, 1,
-0.3000228, 1.599833, 0.02261609, 1, 1, 1, 1, 1,
-0.2998815, 1.111341, -0.8626943, 1, 1, 1, 1, 1,
-0.2957672, 0.5006073, -2.194466, 1, 1, 1, 1, 1,
-0.2932585, -0.8076571, -3.945363, 1, 1, 1, 1, 1,
-0.2910381, -0.9109441, -2.177183, 1, 1, 1, 1, 1,
-0.2878367, 0.7889352, -2.77958, 1, 1, 1, 1, 1,
-0.2828098, 0.8103889, 0.4493972, 1, 1, 1, 1, 1,
-0.2746468, 0.3104644, -0.1084429, 0, 0, 1, 1, 1,
-0.2730539, 0.1462709, -0.4606652, 1, 0, 0, 1, 1,
-0.2711335, 0.9114071, -2.691227, 1, 0, 0, 1, 1,
-0.2662739, -2.81838, -2.800819, 1, 0, 0, 1, 1,
-0.2543164, 0.8055386, -1.080381, 1, 0, 0, 1, 1,
-0.2520547, -1.370172, -3.751191, 1, 0, 0, 1, 1,
-0.2495754, -0.4512363, -0.4237933, 0, 0, 0, 1, 1,
-0.248536, 1.183314, -0.1055791, 0, 0, 0, 1, 1,
-0.24843, 0.3886651, -1.357052, 0, 0, 0, 1, 1,
-0.2470609, -0.3158755, -3.224878, 0, 0, 0, 1, 1,
-0.2464504, 0.0809183, 0.616963, 0, 0, 0, 1, 1,
-0.2464118, 0.6790717, -0.1788048, 0, 0, 0, 1, 1,
-0.2435283, -0.7430587, -3.340138, 0, 0, 0, 1, 1,
-0.2427066, 0.4551084, -0.9447461, 1, 1, 1, 1, 1,
-0.2422547, 0.886739, 0.7111848, 1, 1, 1, 1, 1,
-0.2418154, -1.300193, -1.519092, 1, 1, 1, 1, 1,
-0.2365517, -0.3956309, -2.704404, 1, 1, 1, 1, 1,
-0.2344014, 0.09879604, -2.315838, 1, 1, 1, 1, 1,
-0.2338755, 0.1199247, -1.053684, 1, 1, 1, 1, 1,
-0.2333602, 0.412441, 0.4310473, 1, 1, 1, 1, 1,
-0.2272729, 0.02117261, -1.818807, 1, 1, 1, 1, 1,
-0.2269278, -0.3036566, -2.132054, 1, 1, 1, 1, 1,
-0.2242484, 0.3043449, -0.7225789, 1, 1, 1, 1, 1,
-0.2226801, -2.772747, -1.601694, 1, 1, 1, 1, 1,
-0.2171354, -0.6753275, -1.549415, 1, 1, 1, 1, 1,
-0.2157344, 0.4783321, -0.1021676, 1, 1, 1, 1, 1,
-0.2129476, -0.413014, -2.413601, 1, 1, 1, 1, 1,
-0.2099603, 0.6775348, -1.084425, 1, 1, 1, 1, 1,
-0.2096115, 1.510493, -0.4113176, 0, 0, 1, 1, 1,
-0.2061147, 0.6287984, -0.09286626, 1, 0, 0, 1, 1,
-0.2054171, -0.5161147, -2.292303, 1, 0, 0, 1, 1,
-0.2029054, 0.4305126, 0.4636437, 1, 0, 0, 1, 1,
-0.2028251, 0.170382, 0.7684066, 1, 0, 0, 1, 1,
-0.2005488, 1.407214, 1.574643, 1, 0, 0, 1, 1,
-0.1963645, -0.6511499, -2.712946, 0, 0, 0, 1, 1,
-0.196022, 1.292465, 0.1789898, 0, 0, 0, 1, 1,
-0.1883666, 1.140739, -1.485768, 0, 0, 0, 1, 1,
-0.1870271, 2.680406, -1.01505, 0, 0, 0, 1, 1,
-0.1828342, 0.2239828, 0.8207811, 0, 0, 0, 1, 1,
-0.1821332, -1.7064, -3.678972, 0, 0, 0, 1, 1,
-0.1813844, -1.436445, -3.290415, 0, 0, 0, 1, 1,
-0.1807517, 1.891143, -1.435404, 1, 1, 1, 1, 1,
-0.1782984, 0.3198482, -0.3526217, 1, 1, 1, 1, 1,
-0.172746, 0.7580475, 0.915512, 1, 1, 1, 1, 1,
-0.1697516, -0.1801597, -3.114601, 1, 1, 1, 1, 1,
-0.1631224, -0.7685323, -4.912368, 1, 1, 1, 1, 1,
-0.1621555, -0.5009013, -3.344385, 1, 1, 1, 1, 1,
-0.1609842, -0.7563425, -3.723458, 1, 1, 1, 1, 1,
-0.1601814, -0.6339302, -3.479929, 1, 1, 1, 1, 1,
-0.1598303, -1.43198, -2.501416, 1, 1, 1, 1, 1,
-0.1593633, -1.559373, -3.15599, 1, 1, 1, 1, 1,
-0.1583584, 0.4852421, 0.9791827, 1, 1, 1, 1, 1,
-0.1579846, -0.2578915, -2.529406, 1, 1, 1, 1, 1,
-0.1575163, 0.3805763, -0.7045251, 1, 1, 1, 1, 1,
-0.1538549, -0.1119721, -0.7296311, 1, 1, 1, 1, 1,
-0.1510098, 0.05823188, -0.8990693, 1, 1, 1, 1, 1,
-0.1501628, 1.551853, -0.484761, 0, 0, 1, 1, 1,
-0.1484115, 0.2690344, -1.1531, 1, 0, 0, 1, 1,
-0.145829, -0.6219513, -2.327633, 1, 0, 0, 1, 1,
-0.1446028, 1.145604, -0.7560549, 1, 0, 0, 1, 1,
-0.1424534, 1.378187, 0.6619587, 1, 0, 0, 1, 1,
-0.1297889, -0.4999344, -1.931771, 1, 0, 0, 1, 1,
-0.129145, -0.7664924, -3.511709, 0, 0, 0, 1, 1,
-0.1284869, 1.049496, 3.424536, 0, 0, 0, 1, 1,
-0.1283708, -0.4106671, -2.549964, 0, 0, 0, 1, 1,
-0.126162, -1.428796, -3.216359, 0, 0, 0, 1, 1,
-0.1253402, -1.788803, -3.77021, 0, 0, 0, 1, 1,
-0.1239507, -0.477183, -3.735166, 0, 0, 0, 1, 1,
-0.1235341, -0.008099673, -2.648293, 0, 0, 0, 1, 1,
-0.1223932, -0.7353292, -2.551968, 1, 1, 1, 1, 1,
-0.122267, -0.16428, -3.179489, 1, 1, 1, 1, 1,
-0.1191889, 1.64406, -1.449502, 1, 1, 1, 1, 1,
-0.1184335, -0.7473362, -1.735492, 1, 1, 1, 1, 1,
-0.1162509, 0.8086146, -0.6961172, 1, 1, 1, 1, 1,
-0.1159538, 1.462332, -1.058964, 1, 1, 1, 1, 1,
-0.1140307, 0.1858057, -1.584826, 1, 1, 1, 1, 1,
-0.112564, 0.0242806, -2.948441, 1, 1, 1, 1, 1,
-0.1118262, 0.6867655, -1.493974, 1, 1, 1, 1, 1,
-0.1106139, -1.784915, -1.14713, 1, 1, 1, 1, 1,
-0.109535, 1.262617, 1.01065, 1, 1, 1, 1, 1,
-0.1050932, -0.1220874, -3.223738, 1, 1, 1, 1, 1,
-0.1018257, 0.1195779, -0.490615, 1, 1, 1, 1, 1,
-0.1015627, -2.105212, -2.536757, 1, 1, 1, 1, 1,
-0.09643306, 2.464262, -0.5576752, 1, 1, 1, 1, 1,
-0.09634188, 1.863681, 0.164297, 0, 0, 1, 1, 1,
-0.09266728, 0.8459643, 0.4941098, 1, 0, 0, 1, 1,
-0.08964755, -0.1900391, -1.771551, 1, 0, 0, 1, 1,
-0.08773848, 0.7879767, -0.3021004, 1, 0, 0, 1, 1,
-0.08279841, -0.1361527, -4.052828, 1, 0, 0, 1, 1,
-0.07665797, -0.7612722, -3.904563, 1, 0, 0, 1, 1,
-0.06790626, -0.5088221, -2.470001, 0, 0, 0, 1, 1,
-0.06740909, 0.8167697, -0.4202685, 0, 0, 0, 1, 1,
-0.06295985, 0.5600802, -0.8294078, 0, 0, 0, 1, 1,
-0.06146191, 0.5669276, -1.469567, 0, 0, 0, 1, 1,
-0.05743083, 2.248401, -0.2679293, 0, 0, 0, 1, 1,
-0.05542017, -0.1175691, -4.472502, 0, 0, 0, 1, 1,
-0.04820644, 0.2308333, -0.3661735, 0, 0, 0, 1, 1,
-0.042565, 0.9653527, -1.449404, 1, 1, 1, 1, 1,
-0.0409499, 0.7152129, 1.004397, 1, 1, 1, 1, 1,
-0.04077743, -1.841369, -3.516962, 1, 1, 1, 1, 1,
-0.02968709, 1.658747, 1.77067, 1, 1, 1, 1, 1,
-0.02906154, 0.3084146, 0.9368428, 1, 1, 1, 1, 1,
-0.02466002, -0.6638123, -2.6829, 1, 1, 1, 1, 1,
-0.02298091, 0.01546199, -1.206498, 1, 1, 1, 1, 1,
-0.02200923, 0.9784046, -1.353824, 1, 1, 1, 1, 1,
-0.01893129, -0.4432273, -2.131207, 1, 1, 1, 1, 1,
-0.008800544, 1.038573, -0.2356941, 1, 1, 1, 1, 1,
-0.007779439, -0.6086564, -3.977577, 1, 1, 1, 1, 1,
-0.005719804, 0.4661026, 1.782621, 1, 1, 1, 1, 1,
-0.00215871, 0.494247, 0.6002011, 1, 1, 1, 1, 1,
0.005114723, 0.1000193, -0.09398843, 1, 1, 1, 1, 1,
0.007017433, 1.028031, 1.378891, 1, 1, 1, 1, 1,
0.01070568, -0.6428608, 3.458082, 0, 0, 1, 1, 1,
0.01423009, 0.3850682, 1.420552, 1, 0, 0, 1, 1,
0.01657183, -0.09732095, 3.199958, 1, 0, 0, 1, 1,
0.02404871, -0.3842786, 4.04459, 1, 0, 0, 1, 1,
0.02500105, -0.05948076, 1.681134, 1, 0, 0, 1, 1,
0.02720632, -0.2205428, 2.758339, 1, 0, 0, 1, 1,
0.02919866, 0.3429752, 1.649774, 0, 0, 0, 1, 1,
0.03066523, -0.4975489, 2.673535, 0, 0, 0, 1, 1,
0.03108459, 1.779509, 0.4994882, 0, 0, 0, 1, 1,
0.03113078, -1.728601, 3.695173, 0, 0, 0, 1, 1,
0.03321289, -0.63161, 3.036963, 0, 0, 0, 1, 1,
0.03865083, 1.137463, 0.1299917, 0, 0, 0, 1, 1,
0.03966575, 1.107429, -1.00282, 0, 0, 0, 1, 1,
0.0423058, -0.078066, 4.456724, 1, 1, 1, 1, 1,
0.04238265, -0.1753161, 4.688781, 1, 1, 1, 1, 1,
0.04406564, -1.484324, 2.233236, 1, 1, 1, 1, 1,
0.0491217, 1.831452, -0.8565364, 1, 1, 1, 1, 1,
0.05147824, -2.167805, 2.245193, 1, 1, 1, 1, 1,
0.05422073, -0.06573229, 0.9575339, 1, 1, 1, 1, 1,
0.05451005, -1.329833, 3.162935, 1, 1, 1, 1, 1,
0.0545858, -0.1823581, 1.86443, 1, 1, 1, 1, 1,
0.05829718, 0.9064292, 0.1122895, 1, 1, 1, 1, 1,
0.05849726, 0.6270266, 1.280435, 1, 1, 1, 1, 1,
0.05903609, -0.5516115, 2.900289, 1, 1, 1, 1, 1,
0.06136598, 0.3573819, 0.4278719, 1, 1, 1, 1, 1,
0.06144655, -0.8611289, 2.788176, 1, 1, 1, 1, 1,
0.06179267, -0.8129211, 2.159948, 1, 1, 1, 1, 1,
0.06485503, -0.1376972, 2.766922, 1, 1, 1, 1, 1,
0.06572746, 0.05117539, 1.05279, 0, 0, 1, 1, 1,
0.07245633, -1.216254, 3.387635, 1, 0, 0, 1, 1,
0.07816743, 1.443021, -1.125612, 1, 0, 0, 1, 1,
0.08304296, 1.874609, -1.370956, 1, 0, 0, 1, 1,
0.08443271, -0.4875054, 3.242527, 1, 0, 0, 1, 1,
0.09053976, -0.6774811, 4.731744, 1, 0, 0, 1, 1,
0.09195389, 0.4180364, -0.3343633, 0, 0, 0, 1, 1,
0.09954015, -0.1956279, 4.1924, 0, 0, 0, 1, 1,
0.1012557, -0.03728229, 1.30187, 0, 0, 0, 1, 1,
0.1049325, -0.8073405, 3.590439, 0, 0, 0, 1, 1,
0.1080993, -0.7499628, 3.687687, 0, 0, 0, 1, 1,
0.109296, 0.7005308, 1.488357, 0, 0, 0, 1, 1,
0.1096086, -0.9595376, 1.615136, 0, 0, 0, 1, 1,
0.1096996, -0.8047542, 3.178951, 1, 1, 1, 1, 1,
0.1100852, 0.004172141, 2.450048, 1, 1, 1, 1, 1,
0.1102314, -0.6827705, 3.512805, 1, 1, 1, 1, 1,
0.1103466, -1.352375, 1.489892, 1, 1, 1, 1, 1,
0.1152617, -0.1756782, 2.92493, 1, 1, 1, 1, 1,
0.1164375, 0.39325, -1.059028, 1, 1, 1, 1, 1,
0.1168834, -0.3597675, 2.130223, 1, 1, 1, 1, 1,
0.1212384, 0.5092673, -0.4372065, 1, 1, 1, 1, 1,
0.1216551, 1.79211, 1.207019, 1, 1, 1, 1, 1,
0.1251148, 1.557046, 0.4541265, 1, 1, 1, 1, 1,
0.1288867, 0.4563395, -0.7860775, 1, 1, 1, 1, 1,
0.1290225, -0.545088, 2.711639, 1, 1, 1, 1, 1,
0.1292035, 0.04335154, 1.895446, 1, 1, 1, 1, 1,
0.1302162, 1.225129, 0.9484701, 1, 1, 1, 1, 1,
0.1303149, 1.36219, 0.9015376, 1, 1, 1, 1, 1,
0.1308524, -0.7310382, 3.428027, 0, 0, 1, 1, 1,
0.1315148, 0.7064341, 1.291467, 1, 0, 0, 1, 1,
0.1323886, 0.4849255, 0.3493035, 1, 0, 0, 1, 1,
0.1341822, 0.2400685, -1.888343, 1, 0, 0, 1, 1,
0.1355161, -0.1293042, 3.905136, 1, 0, 0, 1, 1,
0.1379935, 1.009471, 0.3698803, 1, 0, 0, 1, 1,
0.1389881, -0.07376711, 2.241515, 0, 0, 0, 1, 1,
0.1394312, 0.2446699, -0.7474245, 0, 0, 0, 1, 1,
0.1404277, -0.734643, 2.816679, 0, 0, 0, 1, 1,
0.1413476, 1.354289, -0.8090983, 0, 0, 0, 1, 1,
0.1418839, -0.9637313, 5.318562, 0, 0, 0, 1, 1,
0.1435468, 0.3893363, 2.084582, 0, 0, 0, 1, 1,
0.1501373, 1.297096, -0.5087989, 0, 0, 0, 1, 1,
0.1505824, -1.749635, 2.178655, 1, 1, 1, 1, 1,
0.1518179, 1.281037, -0.5847726, 1, 1, 1, 1, 1,
0.1529569, -0.2298893, 2.106183, 1, 1, 1, 1, 1,
0.1616854, -0.4187437, 3.098531, 1, 1, 1, 1, 1,
0.1687763, 0.6320088, 1.029778, 1, 1, 1, 1, 1,
0.1706918, -0.3107747, 3.21042, 1, 1, 1, 1, 1,
0.1711067, -0.8290213, 3.277576, 1, 1, 1, 1, 1,
0.1742078, 0.124543, 1.306785, 1, 1, 1, 1, 1,
0.1742257, 0.8014866, -0.4183573, 1, 1, 1, 1, 1,
0.1749306, 0.5852328, 0.5935616, 1, 1, 1, 1, 1,
0.1789374, 0.1839269, 1.390709, 1, 1, 1, 1, 1,
0.1789513, 1.210141, -0.05527066, 1, 1, 1, 1, 1,
0.1789964, -0.6916043, 2.083968, 1, 1, 1, 1, 1,
0.181608, -0.1460312, 0.1877881, 1, 1, 1, 1, 1,
0.1911415, -0.01417664, 2.556596, 1, 1, 1, 1, 1,
0.1931462, 0.1273283, 0.1342184, 0, 0, 1, 1, 1,
0.1947467, -2.680979, 1.988659, 1, 0, 0, 1, 1,
0.1983074, 0.7415432, -0.2631709, 1, 0, 0, 1, 1,
0.1987906, -0.9940373, 1.937665, 1, 0, 0, 1, 1,
0.2065359, 0.10691, 1.586603, 1, 0, 0, 1, 1,
0.2066045, 1.932436, 0.1515622, 1, 0, 0, 1, 1,
0.2094066, -0.1436116, 1.115995, 0, 0, 0, 1, 1,
0.2098363, -1.001243, 2.715924, 0, 0, 0, 1, 1,
0.2135313, 1.651803, 0.2921718, 0, 0, 0, 1, 1,
0.2158768, 0.1184721, 1.291684, 0, 0, 0, 1, 1,
0.2163498, -0.07946672, 1.35736, 0, 0, 0, 1, 1,
0.2195205, -0.7857926, 2.452718, 0, 0, 0, 1, 1,
0.2277882, -1.254093, 0.5317622, 0, 0, 0, 1, 1,
0.2326912, -0.5296785, 4.101301, 1, 1, 1, 1, 1,
0.2460701, -0.05073996, 2.272474, 1, 1, 1, 1, 1,
0.2483559, -0.1384395, 1.753328, 1, 1, 1, 1, 1,
0.2514495, -0.02578872, 1.900373, 1, 1, 1, 1, 1,
0.251876, -1.41933, 4.659316, 1, 1, 1, 1, 1,
0.2548776, 0.5083661, 1.499256, 1, 1, 1, 1, 1,
0.2557545, -1.091364, 2.334415, 1, 1, 1, 1, 1,
0.2569959, -2.022101, 3.489007, 1, 1, 1, 1, 1,
0.2577141, -0.2411561, 2.801592, 1, 1, 1, 1, 1,
0.2578551, -1.00594, 2.406506, 1, 1, 1, 1, 1,
0.2646776, -0.5320082, 3.225077, 1, 1, 1, 1, 1,
0.2672703, 0.08074762, 2.182356, 1, 1, 1, 1, 1,
0.2717653, -0.4179888, 0.9090431, 1, 1, 1, 1, 1,
0.2719567, 0.7204807, -1.842063, 1, 1, 1, 1, 1,
0.2754985, -0.06310482, 3.937582, 1, 1, 1, 1, 1,
0.2759009, 1.461903, 0.1759033, 0, 0, 1, 1, 1,
0.2878177, 0.5991319, -0.2178429, 1, 0, 0, 1, 1,
0.2878614, 1.935257, -0.01203453, 1, 0, 0, 1, 1,
0.2902623, -0.7599844, 2.495264, 1, 0, 0, 1, 1,
0.2910577, -0.8579915, 1.349318, 1, 0, 0, 1, 1,
0.2945916, -0.7849848, 2.776534, 1, 0, 0, 1, 1,
0.2952731, 2.018108, 1.073282, 0, 0, 0, 1, 1,
0.296755, -0.5007733, 2.522867, 0, 0, 0, 1, 1,
0.2971109, -0.955558, 4.573964, 0, 0, 0, 1, 1,
0.2987174, -0.405206, 0.3320063, 0, 0, 0, 1, 1,
0.3003174, 0.255147, -0.3624644, 0, 0, 0, 1, 1,
0.3028045, -0.03953157, 0.5656838, 0, 0, 0, 1, 1,
0.3034058, -0.2392374, 1.884953, 0, 0, 0, 1, 1,
0.3076854, -0.06472729, 2.975825, 1, 1, 1, 1, 1,
0.3084416, -1.149282, 3.528526, 1, 1, 1, 1, 1,
0.3110682, -0.7371139, 1.234063, 1, 1, 1, 1, 1,
0.3145601, 0.1511683, 1.190021, 1, 1, 1, 1, 1,
0.315294, -1.115859, 4.497076, 1, 1, 1, 1, 1,
0.3263963, 1.486388, -1.464838, 1, 1, 1, 1, 1,
0.3291964, 0.2421665, 1.15751, 1, 1, 1, 1, 1,
0.3301816, -0.4032818, 2.955836, 1, 1, 1, 1, 1,
0.3313976, -0.3301655, 0.7939072, 1, 1, 1, 1, 1,
0.3315543, 1.556623, -0.3569143, 1, 1, 1, 1, 1,
0.3412483, 0.05354557, 1.572096, 1, 1, 1, 1, 1,
0.3417595, 0.2316336, 1.53324, 1, 1, 1, 1, 1,
0.3430136, 0.4868577, -1.525962, 1, 1, 1, 1, 1,
0.3465486, -0.479324, 1.503392, 1, 1, 1, 1, 1,
0.3512057, 0.431217, -0.8617977, 1, 1, 1, 1, 1,
0.3526912, -0.8496174, 2.907961, 0, 0, 1, 1, 1,
0.3559369, -2.539858, 1.335488, 1, 0, 0, 1, 1,
0.3632383, -0.5235234, 4.027985, 1, 0, 0, 1, 1,
0.3642574, 1.109378, 0.04922295, 1, 0, 0, 1, 1,
0.3697643, 0.9372458, 0.7626601, 1, 0, 0, 1, 1,
0.3732731, -1.202252, 1.823788, 1, 0, 0, 1, 1,
0.3769228, 0.8044301, 0.9039183, 0, 0, 0, 1, 1,
0.3772751, 0.09049672, 2.040855, 0, 0, 0, 1, 1,
0.3791077, -1.63526, 2.640709, 0, 0, 0, 1, 1,
0.3829063, -1.030285, 2.627517, 0, 0, 0, 1, 1,
0.387312, 0.1692064, 0.1389586, 0, 0, 0, 1, 1,
0.387895, 1.057582, -1.082337, 0, 0, 0, 1, 1,
0.3899658, -1.094036, 3.661344, 0, 0, 0, 1, 1,
0.3903471, 0.9131736, 0.9647722, 1, 1, 1, 1, 1,
0.3950632, 1.302534, 0.3058055, 1, 1, 1, 1, 1,
0.3972962, 1.613214, 0.9407215, 1, 1, 1, 1, 1,
0.3973731, -1.157373, 3.641785, 1, 1, 1, 1, 1,
0.3989506, -0.4505171, 4.630144, 1, 1, 1, 1, 1,
0.4002464, 0.278699, 0.06600483, 1, 1, 1, 1, 1,
0.4006571, -0.670736, 0.1844164, 1, 1, 1, 1, 1,
0.4018286, -0.03706269, 2.546222, 1, 1, 1, 1, 1,
0.4034833, 2.636188, -0.1565301, 1, 1, 1, 1, 1,
0.405167, 0.2026017, 1.7377, 1, 1, 1, 1, 1,
0.4067996, 0.202277, 2.01475, 1, 1, 1, 1, 1,
0.4097155, 0.2596559, -1.736746, 1, 1, 1, 1, 1,
0.4137271, 0.4424727, 1.959639, 1, 1, 1, 1, 1,
0.4146328, 0.6245539, 0.07230356, 1, 1, 1, 1, 1,
0.4227406, 0.8565523, 1.985331, 1, 1, 1, 1, 1,
0.4228995, 2.090848, 1.134879, 0, 0, 1, 1, 1,
0.4233413, 0.3041676, 1.162288, 1, 0, 0, 1, 1,
0.428128, -0.4105471, 1.609202, 1, 0, 0, 1, 1,
0.4289891, -1.229236, 3.379837, 1, 0, 0, 1, 1,
0.4313131, 0.6930443, 0.923607, 1, 0, 0, 1, 1,
0.4319775, -1.601236, 3.009145, 1, 0, 0, 1, 1,
0.4379551, 1.660165, 2.179252, 0, 0, 0, 1, 1,
0.4407082, -0.1721688, 0.6901948, 0, 0, 0, 1, 1,
0.4476326, 0.009124377, 2.237368, 0, 0, 0, 1, 1,
0.4491126, -0.3447739, 2.329274, 0, 0, 0, 1, 1,
0.4511115, -1.833765, 3.027557, 0, 0, 0, 1, 1,
0.4521455, -1.550231, 1.743365, 0, 0, 0, 1, 1,
0.4541397, 0.372459, -0.2412208, 0, 0, 0, 1, 1,
0.4578251, -0.8162759, 3.658271, 1, 1, 1, 1, 1,
0.4610189, -0.1804665, 1.838918, 1, 1, 1, 1, 1,
0.4669851, 1.01012, -0.4972859, 1, 1, 1, 1, 1,
0.4678845, 1.290222, 1.009602, 1, 1, 1, 1, 1,
0.474353, 0.287969, 0.812267, 1, 1, 1, 1, 1,
0.4752409, 1.062331, 0.7493456, 1, 1, 1, 1, 1,
0.4861948, -0.4516644, 2.511024, 1, 1, 1, 1, 1,
0.4915623, 0.7280351, 0.2229301, 1, 1, 1, 1, 1,
0.5012546, -0.7189938, 2.632949, 1, 1, 1, 1, 1,
0.5020226, -0.2539495, 1.469342, 1, 1, 1, 1, 1,
0.5040532, -0.4981633, 1.149501, 1, 1, 1, 1, 1,
0.5051778, 0.2416003, 1.434032, 1, 1, 1, 1, 1,
0.5056835, 0.4554706, -0.214291, 1, 1, 1, 1, 1,
0.5082819, -0.7931778, 2.67618, 1, 1, 1, 1, 1,
0.5136853, 1.711089, 0.1186103, 1, 1, 1, 1, 1,
0.5255362, 0.3759983, 1.466161, 0, 0, 1, 1, 1,
0.528412, 1.215061, 0.7519738, 1, 0, 0, 1, 1,
0.5292836, -0.6517816, 1.228175, 1, 0, 0, 1, 1,
0.5432583, -0.08732776, 2.648991, 1, 0, 0, 1, 1,
0.5438067, -1.00084, 3.982452, 1, 0, 0, 1, 1,
0.5478006, -0.2508011, 1.19726, 1, 0, 0, 1, 1,
0.5508931, 0.6500008, -0.5965959, 0, 0, 0, 1, 1,
0.5516948, -1.230298, 1.7281, 0, 0, 0, 1, 1,
0.5519826, 2.484103, -0.549431, 0, 0, 0, 1, 1,
0.5532177, -0.1926325, 2.509682, 0, 0, 0, 1, 1,
0.5535607, -0.02453257, 1.366639, 0, 0, 0, 1, 1,
0.5561691, 0.7865442, -0.2239767, 0, 0, 0, 1, 1,
0.5567086, 0.6732596, 0.7158595, 0, 0, 0, 1, 1,
0.5584058, 2.274212, 1.093162, 1, 1, 1, 1, 1,
0.5687667, -0.3445043, 1.140997, 1, 1, 1, 1, 1,
0.5703422, -1.332274, 2.910976, 1, 1, 1, 1, 1,
0.5712334, -0.2222586, 1.636482, 1, 1, 1, 1, 1,
0.5753484, -0.5917179, 3.54542, 1, 1, 1, 1, 1,
0.5758601, -0.4118714, 2.366732, 1, 1, 1, 1, 1,
0.5798913, -0.1648029, 2.484659, 1, 1, 1, 1, 1,
0.5826892, -0.8920116, 2.422704, 1, 1, 1, 1, 1,
0.5846707, 0.2567675, 1.735199, 1, 1, 1, 1, 1,
0.5874564, 0.8313833, 1.204711, 1, 1, 1, 1, 1,
0.5898474, -0.5541213, 1.863834, 1, 1, 1, 1, 1,
0.5928476, -0.9368416, 1.428699, 1, 1, 1, 1, 1,
0.5963851, 0.572738, -1.417548, 1, 1, 1, 1, 1,
0.5973179, -0.6590834, 3.672601, 1, 1, 1, 1, 1,
0.6010732, 0.7293245, 1.458965, 1, 1, 1, 1, 1,
0.6030374, 0.5923713, 2.075486, 0, 0, 1, 1, 1,
0.612691, -0.7007575, 1.297551, 1, 0, 0, 1, 1,
0.6225956, -1.772535, 2.075439, 1, 0, 0, 1, 1,
0.6275497, -0.3883865, 1.234178, 1, 0, 0, 1, 1,
0.630825, 1.53644, -0.5903164, 1, 0, 0, 1, 1,
0.6428764, 0.5761063, -0.5280483, 1, 0, 0, 1, 1,
0.6437101, 0.8306116, 0.5970805, 0, 0, 0, 1, 1,
0.6465815, -0.115383, 2.297097, 0, 0, 0, 1, 1,
0.647231, -0.7129159, 3.352638, 0, 0, 0, 1, 1,
0.6493837, -0.3241824, 4.304893, 0, 0, 0, 1, 1,
0.6496292, -0.1540383, 1.230648, 0, 0, 0, 1, 1,
0.6525965, 1.011071, 1.528994, 0, 0, 0, 1, 1,
0.6564296, -0.705487, 2.390658, 0, 0, 0, 1, 1,
0.6637027, -0.04254387, 3.038316, 1, 1, 1, 1, 1,
0.6652603, -3.017231, 2.771493, 1, 1, 1, 1, 1,
0.6660627, 0.06982017, 2.185161, 1, 1, 1, 1, 1,
0.669053, 0.7347803, 0.5382154, 1, 1, 1, 1, 1,
0.6702139, -0.08194219, 1.933098, 1, 1, 1, 1, 1,
0.6731222, -0.06569985, 1.758453, 1, 1, 1, 1, 1,
0.6756364, 1.249928, 0.2225087, 1, 1, 1, 1, 1,
0.6764041, -0.02279002, 3.290931, 1, 1, 1, 1, 1,
0.6787933, 2.802992, 0.2131344, 1, 1, 1, 1, 1,
0.6795585, -0.3964825, 2.879457, 1, 1, 1, 1, 1,
0.6803832, -0.6367365, 2.319815, 1, 1, 1, 1, 1,
0.6827739, -0.5421424, 2.168853, 1, 1, 1, 1, 1,
0.6884564, 0.04286608, 0.4637792, 1, 1, 1, 1, 1,
0.6904876, 0.4693018, 0.7349328, 1, 1, 1, 1, 1,
0.6984574, -1.599926, 2.000098, 1, 1, 1, 1, 1,
0.6989625, -0.4326056, 2.838865, 0, 0, 1, 1, 1,
0.6991603, 0.5394586, -0.1626023, 1, 0, 0, 1, 1,
0.6998982, -1.211236, 1.954719, 1, 0, 0, 1, 1,
0.7002605, -0.6807814, 3.427755, 1, 0, 0, 1, 1,
0.7030094, 0.1886413, 2.188207, 1, 0, 0, 1, 1,
0.7032051, -0.3542793, 2.188354, 1, 0, 0, 1, 1,
0.7069933, -0.5187702, 2.165642, 0, 0, 0, 1, 1,
0.7109147, -1.794953, 0.9377066, 0, 0, 0, 1, 1,
0.7136351, 1.065529, 0.4288338, 0, 0, 0, 1, 1,
0.7179198, 0.2671184, 1.556143, 0, 0, 0, 1, 1,
0.7212185, 0.3953286, 0.2328709, 0, 0, 0, 1, 1,
0.7214929, -1.153763, 3.804157, 0, 0, 0, 1, 1,
0.7236537, 0.9576006, 1.422601, 0, 0, 0, 1, 1,
0.7250188, -0.4239329, 2.17612, 1, 1, 1, 1, 1,
0.7289858, -0.7814911, 2.027486, 1, 1, 1, 1, 1,
0.7296728, 0.5256174, -0.123528, 1, 1, 1, 1, 1,
0.7304015, -0.1529097, 1.47881, 1, 1, 1, 1, 1,
0.7375703, -0.09439211, 1.566172, 1, 1, 1, 1, 1,
0.7447332, 0.9161998, 2.816662, 1, 1, 1, 1, 1,
0.7515152, 0.3000148, 1.306328, 1, 1, 1, 1, 1,
0.753165, -1.823239, 2.99336, 1, 1, 1, 1, 1,
0.7535233, 0.1549206, 1.144267, 1, 1, 1, 1, 1,
0.7550195, 1.091932, 0.3786197, 1, 1, 1, 1, 1,
0.7633094, 0.645861, 0.4950355, 1, 1, 1, 1, 1,
0.7674257, -0.9617954, 3.853377, 1, 1, 1, 1, 1,
0.7715399, -1.267773, 2.872473, 1, 1, 1, 1, 1,
0.7718428, -1.669305, 2.910064, 1, 1, 1, 1, 1,
0.7789608, -0.9699153, 3.156304, 1, 1, 1, 1, 1,
0.7802696, -0.3434348, 3.414359, 0, 0, 1, 1, 1,
0.7836424, 1.482666, 0.04993451, 1, 0, 0, 1, 1,
0.7843373, -0.9993898, 2.522067, 1, 0, 0, 1, 1,
0.7860022, 1.217717, -0.6817526, 1, 0, 0, 1, 1,
0.7932479, -0.01118425, 1.496899, 1, 0, 0, 1, 1,
0.7936885, -1.483639, 4.108899, 1, 0, 0, 1, 1,
0.7950864, 0.2811002, 2.348728, 0, 0, 0, 1, 1,
0.7972893, 0.5827359, -0.2844757, 0, 0, 0, 1, 1,
0.7983319, 0.775282, 0.1205827, 0, 0, 0, 1, 1,
0.8048639, -0.2519458, 0.9248127, 0, 0, 0, 1, 1,
0.8056641, 0.8197803, 1.042563, 0, 0, 0, 1, 1,
0.812256, -0.5119973, 0.9518951, 0, 0, 0, 1, 1,
0.8145922, 0.6237613, 1.128141, 0, 0, 0, 1, 1,
0.8185394, -0.399835, 1.881226, 1, 1, 1, 1, 1,
0.8292004, 1.054894, -0.4000701, 1, 1, 1, 1, 1,
0.8324503, -0.1854308, 0.6517842, 1, 1, 1, 1, 1,
0.8347666, -0.499723, 1.59787, 1, 1, 1, 1, 1,
0.8353283, -0.4145951, 1.608503, 1, 1, 1, 1, 1,
0.8423225, 0.05564439, 1.313946, 1, 1, 1, 1, 1,
0.8440688, 0.182492, 1.509168, 1, 1, 1, 1, 1,
0.8444932, -0.06610754, 0.7339084, 1, 1, 1, 1, 1,
0.8466899, 1.65828, -1.031183, 1, 1, 1, 1, 1,
0.8479776, 1.765915, -0.00629975, 1, 1, 1, 1, 1,
0.8511853, -2.261022, 2.896479, 1, 1, 1, 1, 1,
0.8512556, -1.521535, 2.768514, 1, 1, 1, 1, 1,
0.8538421, -0.1569644, 0.5358495, 1, 1, 1, 1, 1,
0.857994, -0.2443207, 2.378503, 1, 1, 1, 1, 1,
0.8588963, -0.02955403, 3.101121, 1, 1, 1, 1, 1,
0.8631926, 2.337643, 1.216618, 0, 0, 1, 1, 1,
0.8636448, -0.3363176, 2.175829, 1, 0, 0, 1, 1,
0.8648853, 1.295631, 0.5110901, 1, 0, 0, 1, 1,
0.8663055, -2.105813, 2.062165, 1, 0, 0, 1, 1,
0.8664003, 0.2334521, 0.01221685, 1, 0, 0, 1, 1,
0.8756658, -0.2600383, 0.9730759, 1, 0, 0, 1, 1,
0.8762758, 1.225255, 0.2261025, 0, 0, 0, 1, 1,
0.8807546, 1.499053, 0.1202904, 0, 0, 0, 1, 1,
0.8850194, 1.175072, 0.8468711, 0, 0, 0, 1, 1,
0.8866562, 0.9362597, 3.170097, 0, 0, 0, 1, 1,
0.8907452, 1.098102, 1.854139, 0, 0, 0, 1, 1,
0.8936334, -1.19821, -0.02502226, 0, 0, 0, 1, 1,
0.9090781, 2.361046, 2.557728, 0, 0, 0, 1, 1,
0.9156247, 0.1083251, 0.7010034, 1, 1, 1, 1, 1,
0.9167148, -1.596144, 1.771421, 1, 1, 1, 1, 1,
0.9178078, 0.3651866, 0.2548524, 1, 1, 1, 1, 1,
0.9191132, 0.712981, 2.619198, 1, 1, 1, 1, 1,
0.924111, 1.354431, -0.8935356, 1, 1, 1, 1, 1,
0.928839, -0.4562867, 1.824789, 1, 1, 1, 1, 1,
0.9367576, 0.5471047, 1.229804, 1, 1, 1, 1, 1,
0.9434994, 0.2393783, 1.650784, 1, 1, 1, 1, 1,
0.9448501, 0.07106931, 0.8069494, 1, 1, 1, 1, 1,
0.9529441, 0.1904512, 0.7628262, 1, 1, 1, 1, 1,
0.9535077, 0.3386503, 1.523904, 1, 1, 1, 1, 1,
0.9588509, -1.140554, 3.338491, 1, 1, 1, 1, 1,
0.9667646, -1.969399, 2.528374, 1, 1, 1, 1, 1,
0.970898, 0.389375, 2.26862, 1, 1, 1, 1, 1,
0.9716774, -0.177521, 2.942608, 1, 1, 1, 1, 1,
0.9765825, 0.07971467, 1.143585, 0, 0, 1, 1, 1,
0.9770762, 1.063025, 0.4481146, 1, 0, 0, 1, 1,
0.9997047, -0.4199445, 2.61175, 1, 0, 0, 1, 1,
1.003107, -1.009629, 2.904904, 1, 0, 0, 1, 1,
1.005988, -1.360025, 2.846404, 1, 0, 0, 1, 1,
1.00689, -0.3930271, 3.566558, 1, 0, 0, 1, 1,
1.007752, -0.9153561, 1.171658, 0, 0, 0, 1, 1,
1.016732, -0.6176236, 3.312679, 0, 0, 0, 1, 1,
1.018303, 1.644884, 1.831657, 0, 0, 0, 1, 1,
1.024575, -1.981617, 2.913825, 0, 0, 0, 1, 1,
1.029376, -1.349415, 2.014858, 0, 0, 0, 1, 1,
1.037221, 1.549989, 0.1579727, 0, 0, 0, 1, 1,
1.045078, -0.6208375, 2.106582, 0, 0, 0, 1, 1,
1.061579, -0.4105175, 1.887712, 1, 1, 1, 1, 1,
1.063183, -0.07924072, 3.14403, 1, 1, 1, 1, 1,
1.064674, 1.152374, 0.0002141254, 1, 1, 1, 1, 1,
1.071948, -1.062472, 1.475241, 1, 1, 1, 1, 1,
1.075364, -1.789057, 2.685573, 1, 1, 1, 1, 1,
1.094618, -0.28466, 2.806779, 1, 1, 1, 1, 1,
1.09756, 0.3798933, -0.4248297, 1, 1, 1, 1, 1,
1.099171, 0.7989351, -0.3846319, 1, 1, 1, 1, 1,
1.105308, 0.6817823, -0.6334552, 1, 1, 1, 1, 1,
1.108252, 0.4313482, 1.288081, 1, 1, 1, 1, 1,
1.120208, -1.005729, 2.054451, 1, 1, 1, 1, 1,
1.120766, -0.4354588, 2.499422, 1, 1, 1, 1, 1,
1.126137, 0.7434983, 1.779788, 1, 1, 1, 1, 1,
1.135108, 0.4503159, 1.008672, 1, 1, 1, 1, 1,
1.138005, 0.5234737, 2.052678, 1, 1, 1, 1, 1,
1.145176, 0.5607252, 1.04947, 0, 0, 1, 1, 1,
1.146508, -0.006992097, 1.07387, 1, 0, 0, 1, 1,
1.146884, -0.3995127, 1.731656, 1, 0, 0, 1, 1,
1.147172, 0.1085938, 1.589278, 1, 0, 0, 1, 1,
1.148641, 0.3902433, 2.538829, 1, 0, 0, 1, 1,
1.156411, -0.5059116, 0.5694752, 1, 0, 0, 1, 1,
1.156904, 0.2163324, 1.203119, 0, 0, 0, 1, 1,
1.160863, 0.7874887, 1.063297, 0, 0, 0, 1, 1,
1.170254, -0.2095457, 1.464025, 0, 0, 0, 1, 1,
1.182095, 0.789944, 0.5142451, 0, 0, 0, 1, 1,
1.185507, -0.2453776, 1.86758, 0, 0, 0, 1, 1,
1.201544, 1.056019, -0.17924, 0, 0, 0, 1, 1,
1.207808, 0.7068281, 2.145316, 0, 0, 0, 1, 1,
1.221174, 1.065313, 0.7962423, 1, 1, 1, 1, 1,
1.2281, -0.05310576, 1.391674, 1, 1, 1, 1, 1,
1.231145, 0.7893527, 0.490919, 1, 1, 1, 1, 1,
1.231984, 0.8868591, -0.8950184, 1, 1, 1, 1, 1,
1.235249, -0.8643793, 2.521977, 1, 1, 1, 1, 1,
1.236748, 0.6238699, 2.440072, 1, 1, 1, 1, 1,
1.243118, 1.378919, -0.7994584, 1, 1, 1, 1, 1,
1.243438, -0.9613506, 0.8835471, 1, 1, 1, 1, 1,
1.243787, 0.2008292, 2.483906, 1, 1, 1, 1, 1,
1.249995, -1.584128, 2.856138, 1, 1, 1, 1, 1,
1.253012, -1.084002, 2.452518, 1, 1, 1, 1, 1,
1.256484, -1.016788, 2.846193, 1, 1, 1, 1, 1,
1.257924, -0.7777405, 0.02003217, 1, 1, 1, 1, 1,
1.266812, -1.94512, 3.135269, 1, 1, 1, 1, 1,
1.268849, 1.198768, 1.184481, 1, 1, 1, 1, 1,
1.275446, -1.22398, 4.698796, 0, 0, 1, 1, 1,
1.291624, -1.468762, 1.363753, 1, 0, 0, 1, 1,
1.297933, -1.294327, 3.333787, 1, 0, 0, 1, 1,
1.300523, -0.1164056, 2.770786, 1, 0, 0, 1, 1,
1.305601, 2.325406, -1.335886, 1, 0, 0, 1, 1,
1.305801, 0.4513245, 1.985187, 1, 0, 0, 1, 1,
1.306545, -1.257486, 2.368463, 0, 0, 0, 1, 1,
1.307242, -1.453507, 4.508972, 0, 0, 0, 1, 1,
1.308173, 0.1387389, 0.7820964, 0, 0, 0, 1, 1,
1.308553, -0.7097292, 1.279457, 0, 0, 0, 1, 1,
1.315734, -0.776282, 2.255349, 0, 0, 0, 1, 1,
1.3244, -0.07841589, 2.628348, 0, 0, 0, 1, 1,
1.330639, -0.755344, 3.251615, 0, 0, 0, 1, 1,
1.346038, -0.6842611, 2.073982, 1, 1, 1, 1, 1,
1.347883, 0.4097245, 1.171225, 1, 1, 1, 1, 1,
1.349163, -0.4947312, 1.069423, 1, 1, 1, 1, 1,
1.356834, -1.496855, 2.376036, 1, 1, 1, 1, 1,
1.360034, -1.793792, 3.183483, 1, 1, 1, 1, 1,
1.364912, 0.9433596, 1.120522, 1, 1, 1, 1, 1,
1.367019, 0.5216964, -0.2134352, 1, 1, 1, 1, 1,
1.368156, 0.3136216, 0.2950702, 1, 1, 1, 1, 1,
1.379225, -0.5824571, 1.436532, 1, 1, 1, 1, 1,
1.379349, -0.3930155, 1.868633, 1, 1, 1, 1, 1,
1.384409, 0.1797991, 1.173436, 1, 1, 1, 1, 1,
1.38679, 0.495614, 0.6143002, 1, 1, 1, 1, 1,
1.394634, -1.006085, 1.066372, 1, 1, 1, 1, 1,
1.405073, -0.06742306, 0.1259032, 1, 1, 1, 1, 1,
1.419684, 0.5468065, 1.470854, 1, 1, 1, 1, 1,
1.4251, -0.713429, 0.4440079, 0, 0, 1, 1, 1,
1.443631, 0.892908, 1.975263, 1, 0, 0, 1, 1,
1.444586, -0.7167996, 1.816989, 1, 0, 0, 1, 1,
1.454552, 0.08647875, 2.854231, 1, 0, 0, 1, 1,
1.454886, 0.4070732, 1.472686, 1, 0, 0, 1, 1,
1.45504, -0.01217958, 3.418272, 1, 0, 0, 1, 1,
1.466219, 0.15287, 1.08338, 0, 0, 0, 1, 1,
1.469254, -0.56677, 1.35089, 0, 0, 0, 1, 1,
1.482382, 0.09265519, 0.3095213, 0, 0, 0, 1, 1,
1.490976, -1.047117, 2.417482, 0, 0, 0, 1, 1,
1.511265, 0.2198514, -1.333112, 0, 0, 0, 1, 1,
1.517758, 1.777712, 0.08270098, 0, 0, 0, 1, 1,
1.518791, -1.581798, 1.451148, 0, 0, 0, 1, 1,
1.542967, 0.7262283, 0.6967064, 1, 1, 1, 1, 1,
1.546438, -0.3081827, -0.05448575, 1, 1, 1, 1, 1,
1.551081, -0.002018124, 0.3228205, 1, 1, 1, 1, 1,
1.573716, 2.764405, 0.0472093, 1, 1, 1, 1, 1,
1.576909, 0.5526885, 0.5872326, 1, 1, 1, 1, 1,
1.584486, -1.426968, 3.35448, 1, 1, 1, 1, 1,
1.590189, 1.260326, 0.3948291, 1, 1, 1, 1, 1,
1.59818, -0.6714522, 0.5741562, 1, 1, 1, 1, 1,
1.614454, 1.467376, 1.805236, 1, 1, 1, 1, 1,
1.616618, 0.4921214, 0.04307143, 1, 1, 1, 1, 1,
1.641885, -0.08658339, 1.980843, 1, 1, 1, 1, 1,
1.650364, 1.164691, 1.065964, 1, 1, 1, 1, 1,
1.669033, -0.4223625, 0.7442527, 1, 1, 1, 1, 1,
1.680929, -3.340305, 2.817703, 1, 1, 1, 1, 1,
1.685896, 1.150682, 0.5476305, 1, 1, 1, 1, 1,
1.687391, -0.4887035, 1.581409, 0, 0, 1, 1, 1,
1.723172, -0.2515901, 3.303884, 1, 0, 0, 1, 1,
1.728595, -1.661235, 4.615403, 1, 0, 0, 1, 1,
1.73391, -2.057683, 1.995107, 1, 0, 0, 1, 1,
1.739262, -0.3706314, -0.3765895, 1, 0, 0, 1, 1,
1.767255, 0.8476037, 2.489505, 1, 0, 0, 1, 1,
1.779244, 0.7413466, 3.401141, 0, 0, 0, 1, 1,
1.781043, 1.113762, 1.287588, 0, 0, 0, 1, 1,
1.792343, 0.5864826, 0.0167578, 0, 0, 0, 1, 1,
1.800578, 0.9313404, 1.039772, 0, 0, 0, 1, 1,
1.810436, -1.225362, 3.069454, 0, 0, 0, 1, 1,
1.821365, -0.114069, 2.469591, 0, 0, 0, 1, 1,
1.830433, -0.342705, 2.810251, 0, 0, 0, 1, 1,
1.885103, -0.9703865, 1.593381, 1, 1, 1, 1, 1,
1.889335, 0.1904808, 1.421142, 1, 1, 1, 1, 1,
1.899802, -0.4022129, 0.9485826, 1, 1, 1, 1, 1,
1.90152, 0.4706696, 0.695433, 1, 1, 1, 1, 1,
1.907104, 0.7106515, 1.284427, 1, 1, 1, 1, 1,
1.94637, 0.2492776, 1.432874, 1, 1, 1, 1, 1,
1.951061, 0.7293518, 0.561174, 1, 1, 1, 1, 1,
1.957421, -0.9902343, 1.489852, 1, 1, 1, 1, 1,
1.96717, 0.01616346, 3.931343, 1, 1, 1, 1, 1,
1.979622, -0.6098339, 0.7989722, 1, 1, 1, 1, 1,
1.987818, 1.468565, 1.267806, 1, 1, 1, 1, 1,
1.993243, -0.5124415, 3.848227, 1, 1, 1, 1, 1,
2.011806, -0.5722537, 1.768049, 1, 1, 1, 1, 1,
2.012862, -0.6894382, 0.3311814, 1, 1, 1, 1, 1,
2.042619, 1.162521, 0.2932741, 1, 1, 1, 1, 1,
2.049563, -1.385072, 1.125668, 0, 0, 1, 1, 1,
2.055131, -1.091046, 1.977376, 1, 0, 0, 1, 1,
2.057128, 0.3255346, 0.3575537, 1, 0, 0, 1, 1,
2.067079, -0.09466173, 1.679702, 1, 0, 0, 1, 1,
2.093792, -0.9816621, 1.014126, 1, 0, 0, 1, 1,
2.118363, 0.03612946, 0.0695703, 1, 0, 0, 1, 1,
2.127617, 0.5105604, 1.009181, 0, 0, 0, 1, 1,
2.143234, 0.5745541, 1.607143, 0, 0, 0, 1, 1,
2.166831, 0.3046583, 3.033839, 0, 0, 0, 1, 1,
2.170085, 0.8312767, 1.074197, 0, 0, 0, 1, 1,
2.229185, 0.4524632, 1.943254, 0, 0, 0, 1, 1,
2.232945, -0.8067127, 2.393607, 0, 0, 0, 1, 1,
2.249928, 0.05528225, -0.4089081, 0, 0, 0, 1, 1,
2.297299, 0.1472818, 3.182048, 1, 1, 1, 1, 1,
2.312581, 2.319028, 0.907872, 1, 1, 1, 1, 1,
2.388224, -1.681433, 0.660096, 1, 1, 1, 1, 1,
2.569407, -0.3171509, 2.496112, 1, 1, 1, 1, 1,
2.769428, 1.135411, 1.914003, 1, 1, 1, 1, 1,
2.79463, 0.03315413, 1.422731, 1, 1, 1, 1, 1,
2.949807, 0.6558512, 2.569723, 1, 1, 1, 1, 1
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
var radius = 10.04888;
var distance = 35.29626;
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
mvMatrix.translate( 0.5130835, 0.2261802, 0.5086715 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.29626);
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
