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
-3.327476, 0.1582144, -1.260591, 1, 0, 0, 1,
-3.141145, -0.4913529, -0.2763693, 1, 0.007843138, 0, 1,
-2.954198, 0.8504388, -1.275029, 1, 0.01176471, 0, 1,
-2.805245, 2.77925, -0.09770408, 1, 0.01960784, 0, 1,
-2.593776, -1.139821, -2.162979, 1, 0.02352941, 0, 1,
-2.586665, -0.810471, 0.772195, 1, 0.03137255, 0, 1,
-2.296555, 1.000703, -0.1999524, 1, 0.03529412, 0, 1,
-2.285828, 0.6602957, -1.075992, 1, 0.04313726, 0, 1,
-2.272419, 0.4180478, -0.9186544, 1, 0.04705882, 0, 1,
-2.254797, 0.6337963, -1.401934, 1, 0.05490196, 0, 1,
-2.207654, -0.6997501, -1.65345, 1, 0.05882353, 0, 1,
-2.206794, 0.1467841, -0.8907834, 1, 0.06666667, 0, 1,
-2.134665, -0.192369, -1.774966, 1, 0.07058824, 0, 1,
-2.131636, 0.7339319, -0.8364323, 1, 0.07843138, 0, 1,
-2.044292, 0.620054, -1.394247, 1, 0.08235294, 0, 1,
-2.040333, -0.05341177, -3.14457, 1, 0.09019608, 0, 1,
-2.037767, -1.594033, -1.196388, 1, 0.09411765, 0, 1,
-2.024062, -1.346288, -2.827829, 1, 0.1019608, 0, 1,
-2.010547, -1.112957, -1.642658, 1, 0.1098039, 0, 1,
-1.962043, -0.6797838, -1.404936, 1, 0.1137255, 0, 1,
-1.924133, 0.7115705, -1.121181, 1, 0.1215686, 0, 1,
-1.901586, 0.9407357, -0.4509801, 1, 0.1254902, 0, 1,
-1.88695, -0.2766936, -3.643041, 1, 0.1333333, 0, 1,
-1.875988, 1.897686, -1.07363, 1, 0.1372549, 0, 1,
-1.851739, 0.7093324, 0.3829614, 1, 0.145098, 0, 1,
-1.790008, -2.017977, -1.684866, 1, 0.1490196, 0, 1,
-1.784018, -0.6415592, -1.590089, 1, 0.1568628, 0, 1,
-1.76671, -1.571394, -1.726562, 1, 0.1607843, 0, 1,
-1.762876, -0.2846264, -2.567542, 1, 0.1686275, 0, 1,
-1.722662, -0.08379838, -0.8864636, 1, 0.172549, 0, 1,
-1.718638, 0.3710578, -2.261504, 1, 0.1803922, 0, 1,
-1.715969, -0.9587378, -3.080452, 1, 0.1843137, 0, 1,
-1.713333, 0.08495093, -2.312916, 1, 0.1921569, 0, 1,
-1.698718, 0.365294, -1.624712, 1, 0.1960784, 0, 1,
-1.68757, 0.6148068, -1.690283, 1, 0.2039216, 0, 1,
-1.67436, -0.6072335, -2.095597, 1, 0.2117647, 0, 1,
-1.669663, 0.1236899, -0.8958945, 1, 0.2156863, 0, 1,
-1.668728, -0.6995988, -1.742542, 1, 0.2235294, 0, 1,
-1.668678, 0.779289, -0.7216332, 1, 0.227451, 0, 1,
-1.649504, -0.08032594, 0.1804346, 1, 0.2352941, 0, 1,
-1.640603, -0.6019253, -0.9264238, 1, 0.2392157, 0, 1,
-1.638539, 1.112238, 2.036686, 1, 0.2470588, 0, 1,
-1.62346, -1.298185, -2.139639, 1, 0.2509804, 0, 1,
-1.609524, -0.6719656, -1.353817, 1, 0.2588235, 0, 1,
-1.607736, -1.556155, -1.706143, 1, 0.2627451, 0, 1,
-1.605135, -0.465473, -2.453249, 1, 0.2705882, 0, 1,
-1.590968, -0.1896634, -1.806813, 1, 0.2745098, 0, 1,
-1.589619, 0.1656447, -0.690342, 1, 0.282353, 0, 1,
-1.583652, 0.9042234, -2.238013, 1, 0.2862745, 0, 1,
-1.581921, 1.483124, -0.858985, 1, 0.2941177, 0, 1,
-1.578237, 0.9776304, -0.92678, 1, 0.3019608, 0, 1,
-1.576756, -0.2896526, -1.598443, 1, 0.3058824, 0, 1,
-1.561013, -0.4915491, -2.6865, 1, 0.3137255, 0, 1,
-1.552222, 1.73412, -3.433832, 1, 0.3176471, 0, 1,
-1.550699, -0.7394226, -1.610207, 1, 0.3254902, 0, 1,
-1.53781, -0.9756693, -4.612857, 1, 0.3294118, 0, 1,
-1.534962, -0.40388, -1.570915, 1, 0.3372549, 0, 1,
-1.530501, 0.02310016, -2.885951, 1, 0.3411765, 0, 1,
-1.524867, -0.3434601, -3.279836, 1, 0.3490196, 0, 1,
-1.524675, 1.391, -0.2628348, 1, 0.3529412, 0, 1,
-1.521682, 1.307488, -1.462815, 1, 0.3607843, 0, 1,
-1.518445, -1.028826, -3.40707, 1, 0.3647059, 0, 1,
-1.504123, 0.8682345, 0.2791258, 1, 0.372549, 0, 1,
-1.494336, 0.4516145, -0.8002633, 1, 0.3764706, 0, 1,
-1.490015, -0.6028488, -1.311217, 1, 0.3843137, 0, 1,
-1.455932, 0.5814982, -1.091101, 1, 0.3882353, 0, 1,
-1.446335, 1.915313, -1.519155, 1, 0.3960784, 0, 1,
-1.439843, 0.2877441, -2.146646, 1, 0.4039216, 0, 1,
-1.438286, -2.02882, -4.110282, 1, 0.4078431, 0, 1,
-1.411529, -0.5063506, -3.195923, 1, 0.4156863, 0, 1,
-1.407458, -0.4137974, -0.6016201, 1, 0.4196078, 0, 1,
-1.402937, 0.8586715, -1.660928, 1, 0.427451, 0, 1,
-1.402873, 0.7411661, -2.128394, 1, 0.4313726, 0, 1,
-1.400652, 1.619175, -1.087297, 1, 0.4392157, 0, 1,
-1.395962, 0.392512, -1.79577, 1, 0.4431373, 0, 1,
-1.395265, -0.534965, -0.9468304, 1, 0.4509804, 0, 1,
-1.38596, 0.9354643, -1.865461, 1, 0.454902, 0, 1,
-1.373287, 0.9382222, -0.3530824, 1, 0.4627451, 0, 1,
-1.34151, 0.630605, -1.749667, 1, 0.4666667, 0, 1,
-1.338396, 0.714464, -0.6625026, 1, 0.4745098, 0, 1,
-1.335855, 0.4961773, -1.586546, 1, 0.4784314, 0, 1,
-1.334745, -2.292386, -3.363244, 1, 0.4862745, 0, 1,
-1.320012, -0.6342674, -2.232507, 1, 0.4901961, 0, 1,
-1.318625, -1.387581, -3.647616, 1, 0.4980392, 0, 1,
-1.312172, -1.187951, -2.598266, 1, 0.5058824, 0, 1,
-1.308812, 0.2703514, -1.898343, 1, 0.509804, 0, 1,
-1.305831, 0.3319771, 0.5029183, 1, 0.5176471, 0, 1,
-1.297565, -1.218484, -1.891854, 1, 0.5215687, 0, 1,
-1.292306, 0.2755056, -1.769733, 1, 0.5294118, 0, 1,
-1.266568, -1.1601, -0.991501, 1, 0.5333334, 0, 1,
-1.265237, 0.5759327, -1.387604, 1, 0.5411765, 0, 1,
-1.26521, -1.630807, -2.571892, 1, 0.5450981, 0, 1,
-1.264053, 0.1500472, -0.1338586, 1, 0.5529412, 0, 1,
-1.26344, 1.038321, -1.576683, 1, 0.5568628, 0, 1,
-1.25718, -1.755659, -2.815948, 1, 0.5647059, 0, 1,
-1.255145, -0.6057637, -2.271797, 1, 0.5686275, 0, 1,
-1.248116, -0.5320415, -0.1802067, 1, 0.5764706, 0, 1,
-1.248007, 0.9745044, 0.1149212, 1, 0.5803922, 0, 1,
-1.236192, 0.1647683, -0.008646538, 1, 0.5882353, 0, 1,
-1.236069, -1.749106, -2.270573, 1, 0.5921569, 0, 1,
-1.234164, -1.011255, -4.239803, 1, 0.6, 0, 1,
-1.225411, 0.8883333, -0.6512852, 1, 0.6078432, 0, 1,
-1.224836, -1.285081, -1.349056, 1, 0.6117647, 0, 1,
-1.219083, -0.5260858, -2.812118, 1, 0.6196079, 0, 1,
-1.216521, 0.2036834, -1.778172, 1, 0.6235294, 0, 1,
-1.216458, -0.06624759, -1.673543, 1, 0.6313726, 0, 1,
-1.215122, 1.079076, -1.568555, 1, 0.6352941, 0, 1,
-1.207186, 0.9225083, -0.7121699, 1, 0.6431373, 0, 1,
-1.201626, -0.3110388, -0.6434605, 1, 0.6470588, 0, 1,
-1.193682, -1.501403, -1.951874, 1, 0.654902, 0, 1,
-1.193354, 0.9881259, -0.9123235, 1, 0.6588235, 0, 1,
-1.183729, -0.831742, -3.012486, 1, 0.6666667, 0, 1,
-1.162148, 0.6639196, -1.185556, 1, 0.6705883, 0, 1,
-1.161, 2.083139, 0.710273, 1, 0.6784314, 0, 1,
-1.156789, -0.9912833, -3.268038, 1, 0.682353, 0, 1,
-1.147372, 0.1246323, -0.544413, 1, 0.6901961, 0, 1,
-1.147035, 0.4711854, -1.030478, 1, 0.6941177, 0, 1,
-1.138163, 1.123687, -0.3835177, 1, 0.7019608, 0, 1,
-1.131905, 1.572352, 0.09586053, 1, 0.7098039, 0, 1,
-1.129851, -1.193535, -2.640597, 1, 0.7137255, 0, 1,
-1.125098, -1.257965, -0.5972408, 1, 0.7215686, 0, 1,
-1.118949, 1.717416, -0.7213483, 1, 0.7254902, 0, 1,
-1.107049, 2.2531, 0.982587, 1, 0.7333333, 0, 1,
-1.105003, -0.1159857, -2.533558, 1, 0.7372549, 0, 1,
-1.102654, 1.882938, -1.084903, 1, 0.7450981, 0, 1,
-1.098637, 0.8970044, -2.544702, 1, 0.7490196, 0, 1,
-1.09675, 0.9600316, -2.052586, 1, 0.7568628, 0, 1,
-1.095635, 0.2241891, -3.376441, 1, 0.7607843, 0, 1,
-1.093286, -1.34293, -2.571317, 1, 0.7686275, 0, 1,
-1.079256, -0.3506591, -0.9730334, 1, 0.772549, 0, 1,
-1.078181, 0.6750275, -0.2711305, 1, 0.7803922, 0, 1,
-1.077882, -0.4898042, -0.393857, 1, 0.7843137, 0, 1,
-1.077495, -0.1574447, -0.4867581, 1, 0.7921569, 0, 1,
-1.072546, -0.5160572, -3.333085, 1, 0.7960784, 0, 1,
-1.070259, 0.04980263, 0.1664882, 1, 0.8039216, 0, 1,
-1.064867, 2.053347, -2.209028, 1, 0.8117647, 0, 1,
-1.058341, 0.1307345, -3.673954, 1, 0.8156863, 0, 1,
-1.058294, 1.332743, -2.184458, 1, 0.8235294, 0, 1,
-1.043088, 0.3248785, 0.6446469, 1, 0.827451, 0, 1,
-1.040558, -0.3152706, -2.772246, 1, 0.8352941, 0, 1,
-1.02652, -0.3795627, -0.975633, 1, 0.8392157, 0, 1,
-1.02642, 0.5441992, -0.8448187, 1, 0.8470588, 0, 1,
-1.026182, 0.4110468, 0.228694, 1, 0.8509804, 0, 1,
-1.024793, 0.7520882, -1.346764, 1, 0.8588235, 0, 1,
-1.022168, 0.3218436, -0.5660021, 1, 0.8627451, 0, 1,
-1.018782, 0.1824673, -0.5718023, 1, 0.8705882, 0, 1,
-1.017311, 1.176581, -1.076283, 1, 0.8745098, 0, 1,
-1.009356, -0.324408, -0.8885673, 1, 0.8823529, 0, 1,
-1.000444, -0.1494854, 0.8527864, 1, 0.8862745, 0, 1,
-0.9988112, 0.303524, -1.458296, 1, 0.8941177, 0, 1,
-0.9904606, -2.21318, -2.442649, 1, 0.8980392, 0, 1,
-0.9861454, -0.1161461, -2.026979, 1, 0.9058824, 0, 1,
-0.9829072, -0.9287387, -2.410877, 1, 0.9137255, 0, 1,
-0.9825078, 0.02942758, -0.1444271, 1, 0.9176471, 0, 1,
-0.9786159, -1.313573, -4.664695, 1, 0.9254902, 0, 1,
-0.977564, -2.289475, -3.028019, 1, 0.9294118, 0, 1,
-0.9748768, 0.06004957, -3.293807, 1, 0.9372549, 0, 1,
-0.9666355, 0.2736643, -2.36846, 1, 0.9411765, 0, 1,
-0.9620632, 1.063923, -0.363209, 1, 0.9490196, 0, 1,
-0.9556111, 0.2374014, -2.51533, 1, 0.9529412, 0, 1,
-0.9535003, -0.3542977, -2.972131, 1, 0.9607843, 0, 1,
-0.9516635, 0.6118432, -2.024057, 1, 0.9647059, 0, 1,
-0.9482956, 0.8502211, -1.161132, 1, 0.972549, 0, 1,
-0.9462323, 1.092373, -0.9888406, 1, 0.9764706, 0, 1,
-0.9455116, -0.4122779, -1.68265, 1, 0.9843137, 0, 1,
-0.9438959, 0.975722, -0.5685039, 1, 0.9882353, 0, 1,
-0.9399099, -1.170587, -0.8231723, 1, 0.9960784, 0, 1,
-0.9399045, -0.7485235, -1.251593, 0.9960784, 1, 0, 1,
-0.9383808, -1.349228, -1.928694, 0.9921569, 1, 0, 1,
-0.9380434, 0.2089554, -1.020703, 0.9843137, 1, 0, 1,
-0.9300998, 1.460441, -2.203656, 0.9803922, 1, 0, 1,
-0.9297066, -1.448334, -3.811968, 0.972549, 1, 0, 1,
-0.923661, 1.028706, -2.934963, 0.9686275, 1, 0, 1,
-0.9146216, -1.409207, -4.623754, 0.9607843, 1, 0, 1,
-0.9071454, -1.691788, -3.441696, 0.9568627, 1, 0, 1,
-0.9071305, -0.2978474, -1.086098, 0.9490196, 1, 0, 1,
-0.9055685, -0.629699, -2.025289, 0.945098, 1, 0, 1,
-0.8990929, -0.99928, -3.463509, 0.9372549, 1, 0, 1,
-0.8979811, 0.8287997, -0.07443619, 0.9333333, 1, 0, 1,
-0.8957922, 2.693024, -1.311053, 0.9254902, 1, 0, 1,
-0.8939533, -0.1013847, -2.205003, 0.9215686, 1, 0, 1,
-0.893011, -1.14265, -1.497718, 0.9137255, 1, 0, 1,
-0.8895058, -0.9265484, -3.647286, 0.9098039, 1, 0, 1,
-0.8845244, -0.8075745, -3.314483, 0.9019608, 1, 0, 1,
-0.8832633, 1.714456, -0.009141038, 0.8941177, 1, 0, 1,
-0.8832461, -0.414992, -2.421094, 0.8901961, 1, 0, 1,
-0.8774664, -2.2471, -2.759251, 0.8823529, 1, 0, 1,
-0.8766171, 1.250728, 0.9430282, 0.8784314, 1, 0, 1,
-0.8752226, 0.121843, -0.5292584, 0.8705882, 1, 0, 1,
-0.874344, 0.01565514, -4.226374, 0.8666667, 1, 0, 1,
-0.8683057, -0.182073, 0.9520768, 0.8588235, 1, 0, 1,
-0.8674963, -0.1238505, -1.693661, 0.854902, 1, 0, 1,
-0.8612655, -1.211135, -2.643915, 0.8470588, 1, 0, 1,
-0.8606871, 1.716442, -1.768922, 0.8431373, 1, 0, 1,
-0.8473885, -0.462536, -1.750241, 0.8352941, 1, 0, 1,
-0.8435957, -1.517402, -1.52648, 0.8313726, 1, 0, 1,
-0.8332452, -1.100335, -2.033622, 0.8235294, 1, 0, 1,
-0.82773, -0.7511128, -3.642289, 0.8196079, 1, 0, 1,
-0.8276436, 1.661895, -1.164298, 0.8117647, 1, 0, 1,
-0.8217404, -0.9253832, -4.38546, 0.8078431, 1, 0, 1,
-0.8215337, 0.3951806, -2.623379, 0.8, 1, 0, 1,
-0.8170117, 1.024644, -0.377426, 0.7921569, 1, 0, 1,
-0.8095499, 1.326269, -0.838914, 0.7882353, 1, 0, 1,
-0.8061618, -1.391802, -2.259579, 0.7803922, 1, 0, 1,
-0.8036628, 0.3773707, -1.597409, 0.7764706, 1, 0, 1,
-0.8011163, -0.5540537, -3.284804, 0.7686275, 1, 0, 1,
-0.7942082, 3.80395, -0.4184111, 0.7647059, 1, 0, 1,
-0.7903519, -0.3001536, -0.7688185, 0.7568628, 1, 0, 1,
-0.7884527, -0.5003419, -3.42741, 0.7529412, 1, 0, 1,
-0.7881513, -0.3016509, -3.790675, 0.7450981, 1, 0, 1,
-0.7881248, -0.1080077, -1.654126, 0.7411765, 1, 0, 1,
-0.7870889, -1.481591, -2.961568, 0.7333333, 1, 0, 1,
-0.7842963, 1.463758, 0.4646482, 0.7294118, 1, 0, 1,
-0.781054, -0.8771367, -2.424792, 0.7215686, 1, 0, 1,
-0.7772319, 0.9077816, -2.804845, 0.7176471, 1, 0, 1,
-0.7756767, 1.871264, 0.5646514, 0.7098039, 1, 0, 1,
-0.7667416, -0.7739123, -2.980768, 0.7058824, 1, 0, 1,
-0.7632625, -2.222405, -3.090231, 0.6980392, 1, 0, 1,
-0.7531366, -1.186713, -3.025714, 0.6901961, 1, 0, 1,
-0.75069, -0.3878956, -1.046226, 0.6862745, 1, 0, 1,
-0.7445071, 0.9328913, 0.04682592, 0.6784314, 1, 0, 1,
-0.7376837, 0.6603098, 1.814366, 0.6745098, 1, 0, 1,
-0.7354436, -0.9456653, -1.623641, 0.6666667, 1, 0, 1,
-0.7345136, -1.06092, -2.168481, 0.6627451, 1, 0, 1,
-0.7326535, -1.418604, -1.572525, 0.654902, 1, 0, 1,
-0.7292142, 1.439859, 0.7484141, 0.6509804, 1, 0, 1,
-0.7178008, 0.1176063, -3.189034, 0.6431373, 1, 0, 1,
-0.7127149, -0.2855076, -0.8581622, 0.6392157, 1, 0, 1,
-0.7124081, 1.101325, -0.8553585, 0.6313726, 1, 0, 1,
-0.7117587, 0.9861549, -0.7839547, 0.627451, 1, 0, 1,
-0.7092186, 0.00491289, -1.180634, 0.6196079, 1, 0, 1,
-0.6911622, 0.4692601, -2.203873, 0.6156863, 1, 0, 1,
-0.6874296, -1.317446, -1.832174, 0.6078432, 1, 0, 1,
-0.6850623, 0.01945511, -0.9513249, 0.6039216, 1, 0, 1,
-0.6818277, 0.3667661, -1.319509, 0.5960785, 1, 0, 1,
-0.6737385, -0.4467275, -1.454032, 0.5882353, 1, 0, 1,
-0.6692281, 0.09822608, -1.46226, 0.5843138, 1, 0, 1,
-0.6668782, 0.3454263, -3.052006, 0.5764706, 1, 0, 1,
-0.6608343, -1.967912, -2.533106, 0.572549, 1, 0, 1,
-0.6593312, -0.02991125, -4.228262, 0.5647059, 1, 0, 1,
-0.658034, 0.5146384, -0.3793169, 0.5607843, 1, 0, 1,
-0.6546416, -0.5785531, -2.948446, 0.5529412, 1, 0, 1,
-0.6537406, -0.6386842, -3.299616, 0.5490196, 1, 0, 1,
-0.6524087, -0.6131477, -3.489427, 0.5411765, 1, 0, 1,
-0.652056, 2.438102, 1.027043, 0.5372549, 1, 0, 1,
-0.6482286, 1.079478, 0.1309888, 0.5294118, 1, 0, 1,
-0.6474781, 0.6790925, -1.093005, 0.5254902, 1, 0, 1,
-0.6466833, -1.735074, -1.645328, 0.5176471, 1, 0, 1,
-0.6464238, 1.246617, -1.174992, 0.5137255, 1, 0, 1,
-0.6453918, -0.7301557, -1.140378, 0.5058824, 1, 0, 1,
-0.6377385, -0.4084017, -1.192062, 0.5019608, 1, 0, 1,
-0.6361688, 0.2117971, -1.591262, 0.4941176, 1, 0, 1,
-0.6359993, -0.1784362, -1.932645, 0.4862745, 1, 0, 1,
-0.632182, 0.6302998, -0.004043024, 0.4823529, 1, 0, 1,
-0.6304293, 1.206519, 0.4589713, 0.4745098, 1, 0, 1,
-0.6302695, -1.477107, -1.722584, 0.4705882, 1, 0, 1,
-0.6238575, 1.301585, 0.7782415, 0.4627451, 1, 0, 1,
-0.6228099, -0.427764, -2.090394, 0.4588235, 1, 0, 1,
-0.6191352, -1.452733, -3.539129, 0.4509804, 1, 0, 1,
-0.6187259, -1.132512, -3.992363, 0.4470588, 1, 0, 1,
-0.6151391, -0.3176817, -0.4094132, 0.4392157, 1, 0, 1,
-0.6137635, -0.9873089, -2.263538, 0.4352941, 1, 0, 1,
-0.611642, -0.6331804, -1.517451, 0.427451, 1, 0, 1,
-0.6094937, 0.8197985, -0.5295801, 0.4235294, 1, 0, 1,
-0.607385, 1.064541, -0.497971, 0.4156863, 1, 0, 1,
-0.6064709, 0.7523844, 0.1262988, 0.4117647, 1, 0, 1,
-0.6033837, -1.620664, -2.64451, 0.4039216, 1, 0, 1,
-0.6015692, -0.6231143, -1.243353, 0.3960784, 1, 0, 1,
-0.5984373, 0.02844256, -1.694963, 0.3921569, 1, 0, 1,
-0.5979005, -1.58276, -2.288002, 0.3843137, 1, 0, 1,
-0.5946868, 0.5343947, -2.061642, 0.3803922, 1, 0, 1,
-0.5907875, 0.8246543, 1.696281, 0.372549, 1, 0, 1,
-0.585943, -0.7851247, -1.740465, 0.3686275, 1, 0, 1,
-0.5855908, -1.107543, -4.214527, 0.3607843, 1, 0, 1,
-0.5837211, -0.1799141, -1.051527, 0.3568628, 1, 0, 1,
-0.5816544, -1.585419, -3.569078, 0.3490196, 1, 0, 1,
-0.5771898, 0.6732034, 0.137649, 0.345098, 1, 0, 1,
-0.5761522, 0.7512444, -0.7726503, 0.3372549, 1, 0, 1,
-0.572817, -1.029541, -3.442469, 0.3333333, 1, 0, 1,
-0.5687277, -0.3952291, -1.159381, 0.3254902, 1, 0, 1,
-0.56594, -0.3252965, -3.33982, 0.3215686, 1, 0, 1,
-0.5642847, -0.4976784, -3.941777, 0.3137255, 1, 0, 1,
-0.5522134, 0.577104, -1.614561, 0.3098039, 1, 0, 1,
-0.5468877, -2.065761, -0.7929829, 0.3019608, 1, 0, 1,
-0.5449114, -0.4193531, -1.33743, 0.2941177, 1, 0, 1,
-0.5442669, -0.1036465, -4.546867, 0.2901961, 1, 0, 1,
-0.5425556, -1.37636, -2.513319, 0.282353, 1, 0, 1,
-0.5380914, 1.629804, -0.6800932, 0.2784314, 1, 0, 1,
-0.5366026, 0.4059817, -1.41288, 0.2705882, 1, 0, 1,
-0.5281787, -1.312663, -3.105563, 0.2666667, 1, 0, 1,
-0.5256561, -2.006604, -2.921641, 0.2588235, 1, 0, 1,
-0.5248485, -0.3750178, -2.882867, 0.254902, 1, 0, 1,
-0.5237615, 1.286486, 0.05446129, 0.2470588, 1, 0, 1,
-0.5208427, -1.04033, -1.827982, 0.2431373, 1, 0, 1,
-0.5194373, -0.8105241, -3.308146, 0.2352941, 1, 0, 1,
-0.5188894, -0.5524066, -1.98563, 0.2313726, 1, 0, 1,
-0.5178995, 0.2853247, -1.332932, 0.2235294, 1, 0, 1,
-0.5133641, 0.03889745, -1.27762, 0.2196078, 1, 0, 1,
-0.5132495, -0.1763069, -2.043379, 0.2117647, 1, 0, 1,
-0.5103065, -1.553609, -2.613774, 0.2078431, 1, 0, 1,
-0.5083985, -0.445803, -2.738499, 0.2, 1, 0, 1,
-0.4993415, 0.8437726, 0.933053, 0.1921569, 1, 0, 1,
-0.4984752, -0.2934275, -2.109581, 0.1882353, 1, 0, 1,
-0.4983817, -1.271871, -3.91188, 0.1803922, 1, 0, 1,
-0.4975712, 1.4777, -1.023617, 0.1764706, 1, 0, 1,
-0.4971848, 0.7863777, 1.517684, 0.1686275, 1, 0, 1,
-0.4945602, -0.8030187, -3.625746, 0.1647059, 1, 0, 1,
-0.4911048, -0.1865069, -2.526605, 0.1568628, 1, 0, 1,
-0.4899567, 0.8024733, 1.239604, 0.1529412, 1, 0, 1,
-0.4899235, 0.9535421, 0.01275108, 0.145098, 1, 0, 1,
-0.4875974, 0.803763, -0.4970049, 0.1411765, 1, 0, 1,
-0.4875441, 0.7626595, 1.096207, 0.1333333, 1, 0, 1,
-0.4738303, 0.4268253, -1.001598, 0.1294118, 1, 0, 1,
-0.4557142, 0.2833205, -0.6436559, 0.1215686, 1, 0, 1,
-0.4495811, -1.375144, -1.928907, 0.1176471, 1, 0, 1,
-0.4476281, -1.328314, -3.804047, 0.1098039, 1, 0, 1,
-0.4471577, -0.8486488, -2.075399, 0.1058824, 1, 0, 1,
-0.4390723, -0.08210703, -0.7628111, 0.09803922, 1, 0, 1,
-0.4342501, 0.8020022, 0.7148299, 0.09019608, 1, 0, 1,
-0.4339745, 0.9184836, 1.188973, 0.08627451, 1, 0, 1,
-0.433864, 0.3752601, -0.1573422, 0.07843138, 1, 0, 1,
-0.4313394, 0.5228328, -2.018956, 0.07450981, 1, 0, 1,
-0.4277495, -0.6529303, -1.574866, 0.06666667, 1, 0, 1,
-0.420101, -0.9751608, -3.462921, 0.0627451, 1, 0, 1,
-0.4198098, -0.6717567, -2.119679, 0.05490196, 1, 0, 1,
-0.4197722, -1.085415, -3.36494, 0.05098039, 1, 0, 1,
-0.4174727, -0.8240981, -3.678379, 0.04313726, 1, 0, 1,
-0.409599, -2.292079, -2.51195, 0.03921569, 1, 0, 1,
-0.4042878, 0.5869524, -0.6000605, 0.03137255, 1, 0, 1,
-0.4032083, 0.4738611, -1.155632, 0.02745098, 1, 0, 1,
-0.4006197, -0.3709513, -2.792305, 0.01960784, 1, 0, 1,
-0.3946879, 0.3981726, -1.04289, 0.01568628, 1, 0, 1,
-0.3861196, -0.002329565, 0.2973194, 0.007843138, 1, 0, 1,
-0.3842495, -0.8484393, -1.499014, 0.003921569, 1, 0, 1,
-0.37705, 0.6806936, -1.553756, 0, 1, 0.003921569, 1,
-0.3744589, 0.3124819, -3.002554, 0, 1, 0.01176471, 1,
-0.3642424, -0.06911068, 0.1124555, 0, 1, 0.01568628, 1,
-0.3634986, 0.4139523, -2.043031, 0, 1, 0.02352941, 1,
-0.360084, 0.5561988, -0.6958566, 0, 1, 0.02745098, 1,
-0.3600221, -1.230673, -4.223546, 0, 1, 0.03529412, 1,
-0.358658, -1.669952, -3.704168, 0, 1, 0.03921569, 1,
-0.3583524, 0.2885737, -0.4141412, 0, 1, 0.04705882, 1,
-0.3506997, -0.8785587, -3.119644, 0, 1, 0.05098039, 1,
-0.3458809, -1.50703, -3.261959, 0, 1, 0.05882353, 1,
-0.3431408, 1.368246, -1.184317, 0, 1, 0.0627451, 1,
-0.3400742, -0.5885354, -4.400046, 0, 1, 0.07058824, 1,
-0.3357463, -0.7415564, -2.028859, 0, 1, 0.07450981, 1,
-0.3335081, 0.2814611, -1.287943, 0, 1, 0.08235294, 1,
-0.3331057, -0.3117829, -3.479411, 0, 1, 0.08627451, 1,
-0.3272901, 0.4726241, -1.526898, 0, 1, 0.09411765, 1,
-0.3202297, 0.4166189, -1.335639, 0, 1, 0.1019608, 1,
-0.3200552, 0.9637592, 0.5235907, 0, 1, 0.1058824, 1,
-0.3199128, 1.465113, -2.081738, 0, 1, 0.1137255, 1,
-0.3151922, -0.375737, -1.388643, 0, 1, 0.1176471, 1,
-0.3112008, 0.4733568, 0.7121611, 0, 1, 0.1254902, 1,
-0.3079094, 1.795238, -1.012444, 0, 1, 0.1294118, 1,
-0.3049808, 0.8466518, -0.01349627, 0, 1, 0.1372549, 1,
-0.3021784, 1.405405, -0.9900265, 0, 1, 0.1411765, 1,
-0.3016238, -0.6010301, -1.593515, 0, 1, 0.1490196, 1,
-0.2951128, 1.401883, 0.9509958, 0, 1, 0.1529412, 1,
-0.2921939, -0.4899926, -1.647023, 0, 1, 0.1607843, 1,
-0.2858956, 1.489006, -0.5463004, 0, 1, 0.1647059, 1,
-0.2710748, 0.2423637, -0.2897431, 0, 1, 0.172549, 1,
-0.2623442, -0.06221841, -2.19769, 0, 1, 0.1764706, 1,
-0.2573804, -0.1925551, -1.983548, 0, 1, 0.1843137, 1,
-0.256325, 0.7840126, -0.3930368, 0, 1, 0.1882353, 1,
-0.253136, 0.3455484, -3.227499, 0, 1, 0.1960784, 1,
-0.2461072, 0.9174091, -1.053803, 0, 1, 0.2039216, 1,
-0.2457087, -0.885996, -2.161158, 0, 1, 0.2078431, 1,
-0.2432991, -0.286394, -4.558551, 0, 1, 0.2156863, 1,
-0.2365566, -0.6783885, -0.5095445, 0, 1, 0.2196078, 1,
-0.2357009, -1.097631, -2.980607, 0, 1, 0.227451, 1,
-0.2328002, 1.186486, -1.283288, 0, 1, 0.2313726, 1,
-0.2314182, 0.1505069, -0.505256, 0, 1, 0.2392157, 1,
-0.229582, -0.9722206, -2.880085, 0, 1, 0.2431373, 1,
-0.226194, -0.8783813, -4.041635, 0, 1, 0.2509804, 1,
-0.2256329, 1.693325, 1.339613, 0, 1, 0.254902, 1,
-0.2256124, 1.311984, -0.9107892, 0, 1, 0.2627451, 1,
-0.2243213, -1.032493, -2.567358, 0, 1, 0.2666667, 1,
-0.2207704, -0.02879587, -2.336114, 0, 1, 0.2745098, 1,
-0.2200191, 0.42242, -0.9189399, 0, 1, 0.2784314, 1,
-0.2146267, 1.430203, -1.950659, 0, 1, 0.2862745, 1,
-0.2106367, -0.6284236, -3.693798, 0, 1, 0.2901961, 1,
-0.203784, -0.3131387, -3.176564, 0, 1, 0.2980392, 1,
-0.1992085, -0.7152196, -1.982731, 0, 1, 0.3058824, 1,
-0.1989894, -1.483374, -2.918732, 0, 1, 0.3098039, 1,
-0.1967377, -0.2623273, -2.392529, 0, 1, 0.3176471, 1,
-0.193467, -0.70669, -1.400419, 0, 1, 0.3215686, 1,
-0.192455, 0.833847, -0.3519692, 0, 1, 0.3294118, 1,
-0.1916849, -0.4335613, -4.314581, 0, 1, 0.3333333, 1,
-0.1895148, -0.2666988, -1.308122, 0, 1, 0.3411765, 1,
-0.1851101, 0.3418076, -1.133408, 0, 1, 0.345098, 1,
-0.1741471, -0.06714877, -1.789523, 0, 1, 0.3529412, 1,
-0.1740095, -3.225106, -4.718404, 0, 1, 0.3568628, 1,
-0.1720241, -0.4052723, -3.254503, 0, 1, 0.3647059, 1,
-0.1703621, 1.291632, -0.3413094, 0, 1, 0.3686275, 1,
-0.1696127, 1.141831, -0.4956199, 0, 1, 0.3764706, 1,
-0.1667703, 2.58714, -0.2083183, 0, 1, 0.3803922, 1,
-0.166666, -0.5643449, -2.337485, 0, 1, 0.3882353, 1,
-0.1663001, 1.403775, 0.2160906, 0, 1, 0.3921569, 1,
-0.1661171, 0.3994189, 0.3781351, 0, 1, 0.4, 1,
-0.1645089, 0.6416991, 0.1060365, 0, 1, 0.4078431, 1,
-0.1606257, 1.190021, -1.436946, 0, 1, 0.4117647, 1,
-0.1588915, 0.237336, -1.595989, 0, 1, 0.4196078, 1,
-0.1585163, -1.007082, -4.31705, 0, 1, 0.4235294, 1,
-0.1520754, 1.046243, 0.4454282, 0, 1, 0.4313726, 1,
-0.1487599, -1.124539, -3.977353, 0, 1, 0.4352941, 1,
-0.147613, 3.089402, 0.8458167, 0, 1, 0.4431373, 1,
-0.146172, -1.008342, -1.071165, 0, 1, 0.4470588, 1,
-0.1454501, -0.02412735, -1.570615, 0, 1, 0.454902, 1,
-0.1386415, 0.7526497, -0.3151334, 0, 1, 0.4588235, 1,
-0.1361551, -1.683589, -3.998748, 0, 1, 0.4666667, 1,
-0.1345759, -1.07233, -3.459088, 0, 1, 0.4705882, 1,
-0.1308546, 1.698983, -0.3946168, 0, 1, 0.4784314, 1,
-0.1308039, -0.08975299, -2.156581, 0, 1, 0.4823529, 1,
-0.1305718, -0.2575011, -3.05249, 0, 1, 0.4901961, 1,
-0.1289146, 1.135252, -0.2029958, 0, 1, 0.4941176, 1,
-0.1282333, 0.7046598, 0.9673882, 0, 1, 0.5019608, 1,
-0.124627, 1.759285, -1.716266, 0, 1, 0.509804, 1,
-0.1185635, 1.552358, -1.485386, 0, 1, 0.5137255, 1,
-0.1138986, 0.8858846, 0.931948, 0, 1, 0.5215687, 1,
-0.1117623, -1.447145, -2.665021, 0, 1, 0.5254902, 1,
-0.1104783, -1.164667, -3.216717, 0, 1, 0.5333334, 1,
-0.1079717, 0.246062, 0.6682876, 0, 1, 0.5372549, 1,
-0.1077371, 0.05188225, -0.573505, 0, 1, 0.5450981, 1,
-0.1073725, 0.02580835, -2.542058, 0, 1, 0.5490196, 1,
-0.107155, -0.4384342, -3.492764, 0, 1, 0.5568628, 1,
-0.09685817, 1.859598, 0.6817567, 0, 1, 0.5607843, 1,
-0.09058159, 0.8272802, 0.4228942, 0, 1, 0.5686275, 1,
-0.08673038, -0.2928165, -3.713226, 0, 1, 0.572549, 1,
-0.08401732, -0.2399258, -4.19689, 0, 1, 0.5803922, 1,
-0.08182732, 0.3134724, 0.726358, 0, 1, 0.5843138, 1,
-0.08090909, 0.9303606, 0.1508163, 0, 1, 0.5921569, 1,
-0.07467201, -0.506968, -3.55724, 0, 1, 0.5960785, 1,
-0.06729243, -0.2174671, -4.078748, 0, 1, 0.6039216, 1,
-0.06521211, -0.2780553, -3.833884, 0, 1, 0.6117647, 1,
-0.06493273, -0.03961734, -2.235227, 0, 1, 0.6156863, 1,
-0.06247281, -0.3339106, -3.895508, 0, 1, 0.6235294, 1,
-0.06017891, -0.7155271, -3.037764, 0, 1, 0.627451, 1,
-0.05550222, -1.068838, -2.344789, 0, 1, 0.6352941, 1,
-0.05265313, -1.337984, -2.366254, 0, 1, 0.6392157, 1,
-0.04995241, -0.09616935, -3.109533, 0, 1, 0.6470588, 1,
-0.04735102, 0.01943189, 0.05204917, 0, 1, 0.6509804, 1,
-0.04311888, -0.07969697, -3.025971, 0, 1, 0.6588235, 1,
-0.0401508, -0.8794264, -3.608973, 0, 1, 0.6627451, 1,
-0.03972777, 0.1572533, 0.4466168, 0, 1, 0.6705883, 1,
-0.0354174, 0.4020226, -2.228549, 0, 1, 0.6745098, 1,
-0.03461167, 0.1436301, 0.09039397, 0, 1, 0.682353, 1,
-0.03348644, 0.2183751, 0.009256629, 0, 1, 0.6862745, 1,
-0.02952649, -0.3483045, -2.125413, 0, 1, 0.6941177, 1,
-0.02929446, -0.8031071, -3.874646, 0, 1, 0.7019608, 1,
-0.02452594, 0.03267939, 0.04436088, 0, 1, 0.7058824, 1,
-0.02249924, 0.1535019, 0.1115645, 0, 1, 0.7137255, 1,
-0.0221615, 0.5532495, -0.634649, 0, 1, 0.7176471, 1,
-0.02208747, -1.66958, -4.103786, 0, 1, 0.7254902, 1,
-0.02073069, -1.093205, -2.876615, 0, 1, 0.7294118, 1,
-0.01994632, -0.278599, -4.031364, 0, 1, 0.7372549, 1,
-0.01778885, -1.596257, -3.436846, 0, 1, 0.7411765, 1,
-0.01700508, -1.110362, -4.065037, 0, 1, 0.7490196, 1,
-0.01667459, -1.850794, -4.294458, 0, 1, 0.7529412, 1,
-0.01589793, -0.2292185, -1.231304, 0, 1, 0.7607843, 1,
-0.01359517, 0.9553537, 0.4563087, 0, 1, 0.7647059, 1,
-0.01129137, 1.073405, 0.5139171, 0, 1, 0.772549, 1,
-0.01038994, -1.290532, -3.083294, 0, 1, 0.7764706, 1,
-0.008763295, -0.3501714, -3.83307, 0, 1, 0.7843137, 1,
-0.007902251, 1.667889, 0.9727504, 0, 1, 0.7882353, 1,
-0.007073083, -0.4934266, -2.961807, 0, 1, 0.7960784, 1,
-0.004623348, -1.007587, -2.798992, 0, 1, 0.8039216, 1,
-0.004172582, -0.1132009, -3.49912, 0, 1, 0.8078431, 1,
-0.00329292, -1.129066, -1.8118, 0, 1, 0.8156863, 1,
0.000970931, 0.3151509, 0.8200766, 0, 1, 0.8196079, 1,
0.001779324, 1.628606, -0.3402927, 0, 1, 0.827451, 1,
0.004452028, -0.1249257, 1.106703, 0, 1, 0.8313726, 1,
0.008450272, -0.4917333, 2.818896, 0, 1, 0.8392157, 1,
0.01192338, -0.03339095, 2.077405, 0, 1, 0.8431373, 1,
0.01336749, 0.5315458, 1.430378, 0, 1, 0.8509804, 1,
0.01398499, -0.2006827, 1.588005, 0, 1, 0.854902, 1,
0.01838547, -1.129719, 4.034167, 0, 1, 0.8627451, 1,
0.0221401, -1.493969, 3.510159, 0, 1, 0.8666667, 1,
0.02310065, -1.271446, 2.040734, 0, 1, 0.8745098, 1,
0.0252717, 0.7778424, -0.83717, 0, 1, 0.8784314, 1,
0.02867047, 0.08355952, 0.1850492, 0, 1, 0.8862745, 1,
0.02967289, 1.77515, 1.632663, 0, 1, 0.8901961, 1,
0.03080802, 0.4680261, 0.4231275, 0, 1, 0.8980392, 1,
0.03108424, -1.283671, 3.23917, 0, 1, 0.9058824, 1,
0.03396833, -0.73412, 5.659128, 0, 1, 0.9098039, 1,
0.0345143, 0.7019444, 1.132054, 0, 1, 0.9176471, 1,
0.03500539, -0.5053437, 3.290041, 0, 1, 0.9215686, 1,
0.03622179, 0.2185426, -0.6494626, 0, 1, 0.9294118, 1,
0.04090692, 0.1819168, 0.1775235, 0, 1, 0.9333333, 1,
0.04406751, -0.01769043, 0.2347012, 0, 1, 0.9411765, 1,
0.04489852, -0.2014458, 2.987339, 0, 1, 0.945098, 1,
0.0546101, 2.121793, 0.4036956, 0, 1, 0.9529412, 1,
0.05552846, 0.8357687, 0.158486, 0, 1, 0.9568627, 1,
0.05626763, 0.03618371, 0.8852111, 0, 1, 0.9647059, 1,
0.05637753, 1.220616, 0.3714396, 0, 1, 0.9686275, 1,
0.05666525, -0.4271052, 2.940982, 0, 1, 0.9764706, 1,
0.05667112, 1.217989, 0.867283, 0, 1, 0.9803922, 1,
0.05731254, -0.1151274, 1.78251, 0, 1, 0.9882353, 1,
0.05769572, 1.951132, -0.1940405, 0, 1, 0.9921569, 1,
0.0659446, 0.3373844, 0.3842325, 0, 1, 1, 1,
0.07611493, 0.03621082, 0.5882929, 0, 0.9921569, 1, 1,
0.08156873, -1.406819, 4.528036, 0, 0.9882353, 1, 1,
0.08387055, 0.4607928, -0.3473075, 0, 0.9803922, 1, 1,
0.08416303, -0.3240019, 3.682797, 0, 0.9764706, 1, 1,
0.08586954, 0.3873642, -0.1452366, 0, 0.9686275, 1, 1,
0.08968613, 1.228468, 0.3374996, 0, 0.9647059, 1, 1,
0.09609274, -0.9148709, 3.962812, 0, 0.9568627, 1, 1,
0.100629, -1.156619, 3.112975, 0, 0.9529412, 1, 1,
0.1030688, 0.7184759, 0.1794161, 0, 0.945098, 1, 1,
0.1091681, 1.583035, 0.9594316, 0, 0.9411765, 1, 1,
0.1138882, 0.04158101, -0.8891273, 0, 0.9333333, 1, 1,
0.118186, 0.2443353, 1.745798, 0, 0.9294118, 1, 1,
0.1183599, 2.793924, -2.054667, 0, 0.9215686, 1, 1,
0.127286, 0.9809201, 0.06743331, 0, 0.9176471, 1, 1,
0.1303447, -0.2484425, 4.194392, 0, 0.9098039, 1, 1,
0.1305759, -0.1804613, 2.919001, 0, 0.9058824, 1, 1,
0.1330901, 1.506841, 0.2103, 0, 0.8980392, 1, 1,
0.1354242, 0.7528845, -1.471445, 0, 0.8901961, 1, 1,
0.1385708, 1.356089, -0.3141111, 0, 0.8862745, 1, 1,
0.1387904, -0.5092594, 3.329167, 0, 0.8784314, 1, 1,
0.140665, 1.55339, 0.1256453, 0, 0.8745098, 1, 1,
0.1408056, 0.893907, 0.5360892, 0, 0.8666667, 1, 1,
0.144148, -1.409124, 2.837775, 0, 0.8627451, 1, 1,
0.1507073, 0.3525504, 0.0368489, 0, 0.854902, 1, 1,
0.1529679, 0.1989198, 0.8799786, 0, 0.8509804, 1, 1,
0.1554419, 0.5941019, -0.6265457, 0, 0.8431373, 1, 1,
0.1598567, -1.413823, 3.551567, 0, 0.8392157, 1, 1,
0.1696122, 1.426893, 1.464519, 0, 0.8313726, 1, 1,
0.1759812, -0.2858287, 2.545152, 0, 0.827451, 1, 1,
0.177186, -0.390811, 2.886663, 0, 0.8196079, 1, 1,
0.1801582, 0.3206014, 0.216666, 0, 0.8156863, 1, 1,
0.181555, -0.9411976, 2.108543, 0, 0.8078431, 1, 1,
0.1825272, 0.4654657, -0.6078978, 0, 0.8039216, 1, 1,
0.1826458, -1.230005, 1.309191, 0, 0.7960784, 1, 1,
0.1838676, -0.9058745, 3.937807, 0, 0.7882353, 1, 1,
0.1841517, 1.716705, 1.097765, 0, 0.7843137, 1, 1,
0.1924583, 1.1226, -0.2206003, 0, 0.7764706, 1, 1,
0.1983424, -0.1312919, 1.570333, 0, 0.772549, 1, 1,
0.1999483, 0.2642939, -1.753333, 0, 0.7647059, 1, 1,
0.2001762, 2.415152, -0.5117072, 0, 0.7607843, 1, 1,
0.2010088, -0.4441924, 2.044232, 0, 0.7529412, 1, 1,
0.2018921, 0.1305916, 0.9042005, 0, 0.7490196, 1, 1,
0.2024377, 1.031901, 2.993734, 0, 0.7411765, 1, 1,
0.2033227, 0.01956227, 1.986689, 0, 0.7372549, 1, 1,
0.2051496, 1.294539, 1.419472, 0, 0.7294118, 1, 1,
0.2052722, -0.1127129, 1.451741, 0, 0.7254902, 1, 1,
0.2161815, 0.343935, -0.8212674, 0, 0.7176471, 1, 1,
0.2208469, 2.185072, 0.7618164, 0, 0.7137255, 1, 1,
0.2214838, 0.1274112, 0.2842735, 0, 0.7058824, 1, 1,
0.2234233, 1.682784, 0.7885552, 0, 0.6980392, 1, 1,
0.2310523, -0.9113434, 2.845948, 0, 0.6941177, 1, 1,
0.2312206, -0.8057763, 4.306208, 0, 0.6862745, 1, 1,
0.2361152, 2.145601, 2.135552, 0, 0.682353, 1, 1,
0.2361954, 0.1293033, 0.9890843, 0, 0.6745098, 1, 1,
0.2444013, 0.335076, 2.110926, 0, 0.6705883, 1, 1,
0.2487655, 1.202423, 0.5640537, 0, 0.6627451, 1, 1,
0.2492874, -0.5389552, 3.97583, 0, 0.6588235, 1, 1,
0.2514947, -0.4536293, 3.861194, 0, 0.6509804, 1, 1,
0.2579604, 1.331397, 0.3512511, 0, 0.6470588, 1, 1,
0.260309, 0.7947203, 1.985177, 0, 0.6392157, 1, 1,
0.2611776, 0.9064893, 2.482798, 0, 0.6352941, 1, 1,
0.2617417, -0.1521159, 1.440117, 0, 0.627451, 1, 1,
0.2659521, -0.5185488, 3.221996, 0, 0.6235294, 1, 1,
0.2732359, -0.9652191, 1.856087, 0, 0.6156863, 1, 1,
0.2737217, -1.136578, 4.123104, 0, 0.6117647, 1, 1,
0.2763819, -0.2864838, 3.69916, 0, 0.6039216, 1, 1,
0.27669, 0.4300082, 0.5557025, 0, 0.5960785, 1, 1,
0.2766951, -0.5344288, 0.4151349, 0, 0.5921569, 1, 1,
0.2819973, 1.923208, 2.360831, 0, 0.5843138, 1, 1,
0.2830612, 0.3416387, 1.205441, 0, 0.5803922, 1, 1,
0.2831543, 0.5769101, 2.451681, 0, 0.572549, 1, 1,
0.2861877, 0.175836, 1.417786, 0, 0.5686275, 1, 1,
0.2865899, 0.3617945, 0.2019456, 0, 0.5607843, 1, 1,
0.2928711, -1.050634, 2.295768, 0, 0.5568628, 1, 1,
0.2941828, -0.8426605, 3.039657, 0, 0.5490196, 1, 1,
0.2943741, 1.965322, -0.02312419, 0, 0.5450981, 1, 1,
0.295027, 0.669591, 0.2780063, 0, 0.5372549, 1, 1,
0.2978803, -0.6923203, -0.167642, 0, 0.5333334, 1, 1,
0.3003619, 0.5601432, -1.218968, 0, 0.5254902, 1, 1,
0.3040693, -0.62457, 3.651702, 0, 0.5215687, 1, 1,
0.3079324, 2.244484, 0.03621757, 0, 0.5137255, 1, 1,
0.3089068, -2.055305, 3.234543, 0, 0.509804, 1, 1,
0.3119528, -1.383962, 3.48144, 0, 0.5019608, 1, 1,
0.3122604, -0.568975, 1.464511, 0, 0.4941176, 1, 1,
0.3149025, 0.5438269, 1.751055, 0, 0.4901961, 1, 1,
0.3213261, -0.2767879, 3.267967, 0, 0.4823529, 1, 1,
0.3249352, -0.8049585, 3.346102, 0, 0.4784314, 1, 1,
0.3265107, 0.5278686, 0.7096382, 0, 0.4705882, 1, 1,
0.3335648, -0.5092815, 3.04505, 0, 0.4666667, 1, 1,
0.3337727, -1.242658, 2.253932, 0, 0.4588235, 1, 1,
0.3402499, -0.4897919, 3.295022, 0, 0.454902, 1, 1,
0.3406208, -0.4727417, 4.552773, 0, 0.4470588, 1, 1,
0.3559509, 0.06888487, 2.40475, 0, 0.4431373, 1, 1,
0.3604232, -0.458617, 3.538418, 0, 0.4352941, 1, 1,
0.3629554, 1.059403, -0.4331235, 0, 0.4313726, 1, 1,
0.3650775, -0.7651441, 3.563627, 0, 0.4235294, 1, 1,
0.3671488, 0.7349931, 0.7409134, 0, 0.4196078, 1, 1,
0.3689925, -0.3741351, 2.754212, 0, 0.4117647, 1, 1,
0.3691475, -0.9773406, 2.45451, 0, 0.4078431, 1, 1,
0.370795, -0.1533546, 1.774312, 0, 0.4, 1, 1,
0.3712539, -1.003453, 2.421311, 0, 0.3921569, 1, 1,
0.3746963, -0.8240199, 1.476565, 0, 0.3882353, 1, 1,
0.3771412, -1.449997, 3.139416, 0, 0.3803922, 1, 1,
0.3772249, 1.024862, 0.001245739, 0, 0.3764706, 1, 1,
0.3780289, 0.5938894, 0.5300831, 0, 0.3686275, 1, 1,
0.3787878, 2.108, 0.08965765, 0, 0.3647059, 1, 1,
0.381829, -1.612717, 3.641572, 0, 0.3568628, 1, 1,
0.3880845, -1.911176, 3.109554, 0, 0.3529412, 1, 1,
0.3900859, -1.812769, 3.20449, 0, 0.345098, 1, 1,
0.3904671, -1.166044, 4.1412, 0, 0.3411765, 1, 1,
0.3917163, -0.342243, 3.506196, 0, 0.3333333, 1, 1,
0.3917232, 0.2405333, -0.6000671, 0, 0.3294118, 1, 1,
0.3918042, 0.8210933, 1.78265, 0, 0.3215686, 1, 1,
0.3919831, -0.1172936, 1.633836, 0, 0.3176471, 1, 1,
0.3930601, 1.328775, -0.1004139, 0, 0.3098039, 1, 1,
0.396041, -0.04235663, 1.881237, 0, 0.3058824, 1, 1,
0.3960845, 0.09599598, 2.343612, 0, 0.2980392, 1, 1,
0.3966471, 0.8454114, 1.486769, 0, 0.2901961, 1, 1,
0.3977775, -0.6462891, 2.70583, 0, 0.2862745, 1, 1,
0.3981383, 0.3409163, 2.10123, 0, 0.2784314, 1, 1,
0.4151367, -0.6191667, 3.385914, 0, 0.2745098, 1, 1,
0.4155796, 0.6021417, 0.8474908, 0, 0.2666667, 1, 1,
0.4190432, -2.504638, 2.65004, 0, 0.2627451, 1, 1,
0.4204954, 0.6085226, -0.1911226, 0, 0.254902, 1, 1,
0.4252623, 1.146782, 1.234866, 0, 0.2509804, 1, 1,
0.4319344, -0.2092767, 1.517054, 0, 0.2431373, 1, 1,
0.4326034, 1.448158, 0.350252, 0, 0.2392157, 1, 1,
0.4355503, -0.1222821, 2.305794, 0, 0.2313726, 1, 1,
0.4356394, 1.547401, 0.1611992, 0, 0.227451, 1, 1,
0.4440149, -0.1790086, 3.018469, 0, 0.2196078, 1, 1,
0.4479293, -0.7703989, 0.4023595, 0, 0.2156863, 1, 1,
0.4481698, -2.34917, 4.173604, 0, 0.2078431, 1, 1,
0.4493131, -2.589215, 5.563091, 0, 0.2039216, 1, 1,
0.4494506, 0.9887496, 1.02866, 0, 0.1960784, 1, 1,
0.4502954, 0.3651667, 0.7673865, 0, 0.1882353, 1, 1,
0.4532684, 1.185695, -1.54513, 0, 0.1843137, 1, 1,
0.4566999, -1.64943, 3.726092, 0, 0.1764706, 1, 1,
0.4585151, -0.5976012, 3.181811, 0, 0.172549, 1, 1,
0.459446, -0.06672977, 2.465583, 0, 0.1647059, 1, 1,
0.4597005, -1.116194, 2.264808, 0, 0.1607843, 1, 1,
0.4597007, -0.02627718, 1.021209, 0, 0.1529412, 1, 1,
0.4635435, 0.0901679, 1.724272, 0, 0.1490196, 1, 1,
0.4639332, -0.6023496, 2.409684, 0, 0.1411765, 1, 1,
0.4703153, -1.556128, 2.57888, 0, 0.1372549, 1, 1,
0.474698, 0.1850141, 2.308822, 0, 0.1294118, 1, 1,
0.4771178, 0.1445137, 0.23787, 0, 0.1254902, 1, 1,
0.4785074, 0.9811366, 0.4440106, 0, 0.1176471, 1, 1,
0.4798834, -1.526082, 1.951101, 0, 0.1137255, 1, 1,
0.4863532, 1.582427, 1.714826, 0, 0.1058824, 1, 1,
0.4975188, -0.4588, 4.412165, 0, 0.09803922, 1, 1,
0.498251, 0.4552423, -0.1735981, 0, 0.09411765, 1, 1,
0.4989311, -0.1945368, 2.011708, 0, 0.08627451, 1, 1,
0.5003805, -0.4892435, 2.671778, 0, 0.08235294, 1, 1,
0.5021516, -1.350425, 3.14244, 0, 0.07450981, 1, 1,
0.5023721, 0.9798176, 1.008783, 0, 0.07058824, 1, 1,
0.5027565, -0.4606272, 1.064955, 0, 0.0627451, 1, 1,
0.5034531, -0.7974632, 0.02460344, 0, 0.05882353, 1, 1,
0.5125817, 1.212993, 0.0512566, 0, 0.05098039, 1, 1,
0.5126309, 1.437927, -1.482641, 0, 0.04705882, 1, 1,
0.5172124, 0.5258002, 1.22356, 0, 0.03921569, 1, 1,
0.5222666, 1.62908, 1.314636, 0, 0.03529412, 1, 1,
0.5234973, -1.328674, 4.416777, 0, 0.02745098, 1, 1,
0.5272543, 0.6808547, 2.083797, 0, 0.02352941, 1, 1,
0.5313004, 0.5744787, -0.9930553, 0, 0.01568628, 1, 1,
0.5315475, 1.197694, 2.499986, 0, 0.01176471, 1, 1,
0.5337807, 0.4710755, 0.1995329, 0, 0.003921569, 1, 1,
0.5354097, 0.2457573, 0.9623569, 0.003921569, 0, 1, 1,
0.5375699, -0.3834041, 0.64454, 0.007843138, 0, 1, 1,
0.537601, 0.1900445, 1.694027, 0.01568628, 0, 1, 1,
0.5398535, -1.767193, 2.121898, 0.01960784, 0, 1, 1,
0.5416307, 1.628679, 0.1314023, 0.02745098, 0, 1, 1,
0.5422147, -0.232982, 3.474348, 0.03137255, 0, 1, 1,
0.5438162, 1.937192, -0.9671826, 0.03921569, 0, 1, 1,
0.5469904, -0.01686648, 1.067623, 0.04313726, 0, 1, 1,
0.5521165, 0.5324001, -0.2811621, 0.05098039, 0, 1, 1,
0.5582993, -0.3877349, 3.402977, 0.05490196, 0, 1, 1,
0.5595735, 0.9713778, -0.3995579, 0.0627451, 0, 1, 1,
0.5606461, 0.6482208, 0.1295218, 0.06666667, 0, 1, 1,
0.5618119, 0.4261574, 1.29029, 0.07450981, 0, 1, 1,
0.5628027, -1.415602, 2.835642, 0.07843138, 0, 1, 1,
0.5659503, -0.03869252, 0.2272137, 0.08627451, 0, 1, 1,
0.5689356, 1.12409, 0.08495518, 0.09019608, 0, 1, 1,
0.5730999, 1.077969, 0.5049637, 0.09803922, 0, 1, 1,
0.5763039, 0.1663201, 1.090331, 0.1058824, 0, 1, 1,
0.5782142, -0.3693671, 2.620623, 0.1098039, 0, 1, 1,
0.5823437, -0.3950886, 0.7602724, 0.1176471, 0, 1, 1,
0.592522, 1.280351, 0.7915474, 0.1215686, 0, 1, 1,
0.5939974, 0.2816285, -0.2861481, 0.1294118, 0, 1, 1,
0.5958585, 0.1759569, 0.7268617, 0.1333333, 0, 1, 1,
0.6018981, -2.853765, 4.095321, 0.1411765, 0, 1, 1,
0.602843, 0.07930236, 1.037989, 0.145098, 0, 1, 1,
0.6052207, -0.525125, 3.025599, 0.1529412, 0, 1, 1,
0.6057308, -0.1078024, 0.5210258, 0.1568628, 0, 1, 1,
0.6090334, 1.064649, 0.715327, 0.1647059, 0, 1, 1,
0.6094005, -0.7534572, 3.720472, 0.1686275, 0, 1, 1,
0.6113441, 0.8962366, -0.09111785, 0.1764706, 0, 1, 1,
0.6164948, 0.6363305, 0.4280085, 0.1803922, 0, 1, 1,
0.6167064, -0.7686665, 1.680533, 0.1882353, 0, 1, 1,
0.620238, 0.4943815, 1.217853, 0.1921569, 0, 1, 1,
0.6215482, -1.182375, 3.459584, 0.2, 0, 1, 1,
0.6310217, 0.05605027, -0.2238324, 0.2078431, 0, 1, 1,
0.6339892, -0.9992936, 1.358184, 0.2117647, 0, 1, 1,
0.6373215, -0.9840909, 3.079801, 0.2196078, 0, 1, 1,
0.6376235, -1.117851, 3.434844, 0.2235294, 0, 1, 1,
0.640891, 0.09188579, 1.541941, 0.2313726, 0, 1, 1,
0.6426423, 0.04000456, 2.063267, 0.2352941, 0, 1, 1,
0.6435793, -0.672574, 1.218325, 0.2431373, 0, 1, 1,
0.6471773, 0.6988423, 0.8354211, 0.2470588, 0, 1, 1,
0.6499687, -0.3271202, -0.1847299, 0.254902, 0, 1, 1,
0.6554772, 0.470799, 3.401564, 0.2588235, 0, 1, 1,
0.6566367, 1.342586, -0.9606494, 0.2666667, 0, 1, 1,
0.6570342, 0.6575012, 0.7985429, 0.2705882, 0, 1, 1,
0.6598107, 0.4972063, 0.9659625, 0.2784314, 0, 1, 1,
0.6614506, -0.5730022, 0.7234127, 0.282353, 0, 1, 1,
0.669292, 0.502916, 1.13755, 0.2901961, 0, 1, 1,
0.6748788, -0.9088269, 2.576763, 0.2941177, 0, 1, 1,
0.6798472, 0.6996325, 1.326603, 0.3019608, 0, 1, 1,
0.6867117, 0.7655976, -0.1532708, 0.3098039, 0, 1, 1,
0.6924389, -0.6975465, 3.24335, 0.3137255, 0, 1, 1,
0.693688, 0.977497, -0.3154431, 0.3215686, 0, 1, 1,
0.7032991, -0.7517493, 2.049778, 0.3254902, 0, 1, 1,
0.7092906, -1.081847, 2.304345, 0.3333333, 0, 1, 1,
0.7181042, -0.5327718, 2.720572, 0.3372549, 0, 1, 1,
0.7182208, 0.6002556, -0.2298462, 0.345098, 0, 1, 1,
0.722205, 1.222088, -0.3149928, 0.3490196, 0, 1, 1,
0.7222368, -1.388218, 2.265436, 0.3568628, 0, 1, 1,
0.7232606, 1.339029, 1.349842, 0.3607843, 0, 1, 1,
0.7254175, -1.214763, 3.870671, 0.3686275, 0, 1, 1,
0.7332092, 0.1213522, 2.62346, 0.372549, 0, 1, 1,
0.7384531, -0.7650295, 3.149709, 0.3803922, 0, 1, 1,
0.7411305, -1.43567, 2.138107, 0.3843137, 0, 1, 1,
0.7460337, 0.4182648, -0.05679331, 0.3921569, 0, 1, 1,
0.7477668, -0.4364779, 1.016188, 0.3960784, 0, 1, 1,
0.7481765, 0.1781066, 1.102377, 0.4039216, 0, 1, 1,
0.751287, 0.8012645, -0.3765244, 0.4117647, 0, 1, 1,
0.7539242, -0.9751991, 1.65748, 0.4156863, 0, 1, 1,
0.7577302, -0.7056208, 1.261333, 0.4235294, 0, 1, 1,
0.7662752, -0.9594783, 2.675504, 0.427451, 0, 1, 1,
0.7689005, 0.4909185, 0.2679822, 0.4352941, 0, 1, 1,
0.772845, -0.5362537, 2.265079, 0.4392157, 0, 1, 1,
0.7810845, 0.3996372, 1.747378, 0.4470588, 0, 1, 1,
0.7857715, -1.087443, 3.611853, 0.4509804, 0, 1, 1,
0.786292, 0.09224676, 0.225698, 0.4588235, 0, 1, 1,
0.7980267, -0.8310367, 1.611579, 0.4627451, 0, 1, 1,
0.8056438, -1.707083, 3.360871, 0.4705882, 0, 1, 1,
0.8073857, -0.6131038, 1.315889, 0.4745098, 0, 1, 1,
0.8104331, 1.245741, -0.7477265, 0.4823529, 0, 1, 1,
0.811215, -1.37062, 2.244456, 0.4862745, 0, 1, 1,
0.8147901, 1.383238, 1.091364, 0.4941176, 0, 1, 1,
0.8158889, -0.5010256, -0.4102623, 0.5019608, 0, 1, 1,
0.8178932, 0.5044098, 1.186425, 0.5058824, 0, 1, 1,
0.826888, -0.8332617, 4.332723, 0.5137255, 0, 1, 1,
0.826986, 0.2193729, 1.255736, 0.5176471, 0, 1, 1,
0.8289913, 0.1165018, 1.409741, 0.5254902, 0, 1, 1,
0.8331722, -1.071204, 2.380362, 0.5294118, 0, 1, 1,
0.8361824, 0.465914, 0.122472, 0.5372549, 0, 1, 1,
0.836476, -0.744142, 2.634767, 0.5411765, 0, 1, 1,
0.8389326, -0.07386513, 1.668529, 0.5490196, 0, 1, 1,
0.8394215, -0.4856709, 2.830079, 0.5529412, 0, 1, 1,
0.8408297, 1.130638, 0.1788655, 0.5607843, 0, 1, 1,
0.8446099, 0.6443346, 1.07464, 0.5647059, 0, 1, 1,
0.8466429, -0.302303, 2.39726, 0.572549, 0, 1, 1,
0.8493572, 0.1733124, 0.9078496, 0.5764706, 0, 1, 1,
0.8515493, -0.4612238, 1.194492, 0.5843138, 0, 1, 1,
0.8527669, -0.8225681, 1.483991, 0.5882353, 0, 1, 1,
0.8530688, -2.46766, 3.653404, 0.5960785, 0, 1, 1,
0.8565483, -0.2227679, 1.332082, 0.6039216, 0, 1, 1,
0.8575025, -0.8838384, 3.481757, 0.6078432, 0, 1, 1,
0.8587267, -0.08693419, 2.914389, 0.6156863, 0, 1, 1,
0.8592823, 0.7459713, 1.972805, 0.6196079, 0, 1, 1,
0.8650023, 1.605601, 0.5101286, 0.627451, 0, 1, 1,
0.865374, 0.8322432, 0.6055465, 0.6313726, 0, 1, 1,
0.8662078, -0.3759124, 3.428586, 0.6392157, 0, 1, 1,
0.8667696, -1.377653, 2.503015, 0.6431373, 0, 1, 1,
0.8710425, -1.762482, 4.872847, 0.6509804, 0, 1, 1,
0.8716825, 1.350132, 0.9127049, 0.654902, 0, 1, 1,
0.8719802, 0.6693144, 1.455099, 0.6627451, 0, 1, 1,
0.8781875, 1.910759, 1.171759, 0.6666667, 0, 1, 1,
0.8783255, 0.7426262, 1.497584, 0.6745098, 0, 1, 1,
0.8807714, -0.5837125, 1.891084, 0.6784314, 0, 1, 1,
0.8884218, 1.999151, -1.172401, 0.6862745, 0, 1, 1,
0.891232, -0.8854599, 4.477154, 0.6901961, 0, 1, 1,
0.8941661, 0.661751, 0.1813331, 0.6980392, 0, 1, 1,
0.8950753, 0.4929417, 3.467964, 0.7058824, 0, 1, 1,
0.8953878, -1.25251, 2.644376, 0.7098039, 0, 1, 1,
0.895602, 0.6224937, 2.317986, 0.7176471, 0, 1, 1,
0.8965361, -1.475853, 3.597045, 0.7215686, 0, 1, 1,
0.8966369, 0.1550906, 2.371516, 0.7294118, 0, 1, 1,
0.9014197, -1.340713, 3.621346, 0.7333333, 0, 1, 1,
0.9017166, 0.4228953, 1.870893, 0.7411765, 0, 1, 1,
0.9060201, -0.7004687, 1.824238, 0.7450981, 0, 1, 1,
0.9148292, -0.152427, 2.068197, 0.7529412, 0, 1, 1,
0.9201643, 0.03751571, 0.7264364, 0.7568628, 0, 1, 1,
0.9248317, -0.4296521, 2.72921, 0.7647059, 0, 1, 1,
0.9279713, -0.09955604, 2.929574, 0.7686275, 0, 1, 1,
0.9303093, 0.7304856, 0.5784917, 0.7764706, 0, 1, 1,
0.9317034, 0.1341176, 2.242515, 0.7803922, 0, 1, 1,
0.9352898, -1.104638, 3.659066, 0.7882353, 0, 1, 1,
0.9366221, 0.4118387, 0.5894377, 0.7921569, 0, 1, 1,
0.9391371, 0.1158082, 1.6189, 0.8, 0, 1, 1,
0.9460178, 1.150977, -0.8365198, 0.8078431, 0, 1, 1,
0.9480655, -0.1670538, 2.289766, 0.8117647, 0, 1, 1,
0.9482551, -0.03094511, 0.6065866, 0.8196079, 0, 1, 1,
0.9576457, -1.916125, 3.727408, 0.8235294, 0, 1, 1,
0.9666229, 0.9688731, 2.095022, 0.8313726, 0, 1, 1,
0.9683784, -0.7924772, 2.680986, 0.8352941, 0, 1, 1,
0.9708286, -0.359651, 0.3722039, 0.8431373, 0, 1, 1,
0.9761518, -0.3386092, 1.51148, 0.8470588, 0, 1, 1,
0.9795916, -1.324917, 2.073976, 0.854902, 0, 1, 1,
0.9832112, 0.03736159, -0.7786181, 0.8588235, 0, 1, 1,
0.9836907, 0.4751242, 0.876144, 0.8666667, 0, 1, 1,
0.9887773, 0.6662086, 0.04136645, 0.8705882, 0, 1, 1,
1.005372, 0.3105367, 1.868087, 0.8784314, 0, 1, 1,
1.007296, 2.38994, -1.183976, 0.8823529, 0, 1, 1,
1.013165, -1.170123, 1.976877, 0.8901961, 0, 1, 1,
1.019078, 1.911536, 0.1261966, 0.8941177, 0, 1, 1,
1.020027, -0.7033772, 1.852742, 0.9019608, 0, 1, 1,
1.021905, -2.134748, 3.669261, 0.9098039, 0, 1, 1,
1.026723, -0.7443783, 2.415432, 0.9137255, 0, 1, 1,
1.031756, 0.1006883, -0.5733365, 0.9215686, 0, 1, 1,
1.036436, 0.5474077, 0.3565716, 0.9254902, 0, 1, 1,
1.036564, -2.238265, 3.018946, 0.9333333, 0, 1, 1,
1.036633, 0.5512205, 0.9906555, 0.9372549, 0, 1, 1,
1.03686, 0.8031948, 2.428557, 0.945098, 0, 1, 1,
1.040032, 0.9545392, 0.6610001, 0.9490196, 0, 1, 1,
1.044099, 1.436372, 0.39032, 0.9568627, 0, 1, 1,
1.044118, -1.234505, 1.788181, 0.9607843, 0, 1, 1,
1.046904, 0.3954387, 1.576256, 0.9686275, 0, 1, 1,
1.047447, 0.0689199, 0.9367527, 0.972549, 0, 1, 1,
1.048088, 0.298805, -0.6306279, 0.9803922, 0, 1, 1,
1.062263, 0.1119732, 1.602797, 0.9843137, 0, 1, 1,
1.067536, 0.9785982, 1.522343, 0.9921569, 0, 1, 1,
1.071155, -1.875225, 3.689162, 0.9960784, 0, 1, 1,
1.071242, 0.2387304, 1.042375, 1, 0, 0.9960784, 1,
1.073102, 0.1266022, 2.638882, 1, 0, 0.9882353, 1,
1.074979, -0.927617, 3.519486, 1, 0, 0.9843137, 1,
1.076645, 0.1967158, 2.12601, 1, 0, 0.9764706, 1,
1.080512, 0.1502411, 1.093077, 1, 0, 0.972549, 1,
1.081886, 0.09991033, -0.4479396, 1, 0, 0.9647059, 1,
1.092346, 0.6933732, -0.1631816, 1, 0, 0.9607843, 1,
1.101641, -0.9395686, 0.8146396, 1, 0, 0.9529412, 1,
1.10359, -0.3264246, 0.5233983, 1, 0, 0.9490196, 1,
1.111923, 2.403417, 0.6372293, 1, 0, 0.9411765, 1,
1.113065, 1.006888, -0.4545513, 1, 0, 0.9372549, 1,
1.121328, 1.316743, 2.615032, 1, 0, 0.9294118, 1,
1.126061, -0.3185098, 3.731819, 1, 0, 0.9254902, 1,
1.127155, 0.2750907, 1.16539, 1, 0, 0.9176471, 1,
1.129482, -0.3409631, 1.346235, 1, 0, 0.9137255, 1,
1.130259, 0.1073834, 0.4672141, 1, 0, 0.9058824, 1,
1.13296, -1.081087, 0.9334754, 1, 0, 0.9019608, 1,
1.134381, 0.1894051, 1.507327, 1, 0, 0.8941177, 1,
1.135798, 0.3941878, 0.9955321, 1, 0, 0.8862745, 1,
1.141176, 1.813834, 0.8455952, 1, 0, 0.8823529, 1,
1.142569, -1.546058, 2.062249, 1, 0, 0.8745098, 1,
1.154325, -0.5975581, 1.929558, 1, 0, 0.8705882, 1,
1.154809, -0.595004, 2.549721, 1, 0, 0.8627451, 1,
1.158207, -0.3011367, 2.255977, 1, 0, 0.8588235, 1,
1.158592, -1.65851, 2.526045, 1, 0, 0.8509804, 1,
1.160241, -1.293429, 1.646275, 1, 0, 0.8470588, 1,
1.161764, -0.8684613, 1.737298, 1, 0, 0.8392157, 1,
1.162031, -0.5608051, 2.198926, 1, 0, 0.8352941, 1,
1.166256, 0.2336256, 1.523214, 1, 0, 0.827451, 1,
1.17057, -0.09889799, 1.770732, 1, 0, 0.8235294, 1,
1.186031, 0.1068836, 0.2506152, 1, 0, 0.8156863, 1,
1.195955, -1.375399, 2.789284, 1, 0, 0.8117647, 1,
1.198802, 0.6348019, 1.386436, 1, 0, 0.8039216, 1,
1.199701, -0.2416658, 0.8783945, 1, 0, 0.7960784, 1,
1.201009, 0.3696191, 2.506334, 1, 0, 0.7921569, 1,
1.2016, 1.390419, 1.662492, 1, 0, 0.7843137, 1,
1.203536, -0.1613767, 0.7123348, 1, 0, 0.7803922, 1,
1.208649, -0.05263685, 1.691943, 1, 0, 0.772549, 1,
1.208949, 1.15205, -0.4264404, 1, 0, 0.7686275, 1,
1.209229, -0.2158933, 1.479291, 1, 0, 0.7607843, 1,
1.218175, 1.665316, 0.8716236, 1, 0, 0.7568628, 1,
1.223512, -0.530463, 1.358495, 1, 0, 0.7490196, 1,
1.224964, 1.030577, 1.447824, 1, 0, 0.7450981, 1,
1.226542, -1.286895, 2.797225, 1, 0, 0.7372549, 1,
1.229188, -0.2019121, 3.017651, 1, 0, 0.7333333, 1,
1.232777, -0.3358896, 1.781978, 1, 0, 0.7254902, 1,
1.233308, -0.3825637, 2.0604, 1, 0, 0.7215686, 1,
1.240515, -0.1727593, 2.347486, 1, 0, 0.7137255, 1,
1.240892, 0.329485, 1.142178, 1, 0, 0.7098039, 1,
1.256221, -0.1221451, 0.326089, 1, 0, 0.7019608, 1,
1.259472, 1.056914, 1.468697, 1, 0, 0.6941177, 1,
1.263481, 0.1384029, 1.547262, 1, 0, 0.6901961, 1,
1.266915, 0.1701261, 1.282876, 1, 0, 0.682353, 1,
1.277874, 0.2068187, 0.2680816, 1, 0, 0.6784314, 1,
1.277973, 0.569638, -0.4677588, 1, 0, 0.6705883, 1,
1.294242, 0.7379372, -0.5016569, 1, 0, 0.6666667, 1,
1.300843, -0.6200516, 2.624157, 1, 0, 0.6588235, 1,
1.304936, 0.4548138, 1.65376, 1, 0, 0.654902, 1,
1.308603, -1.098892, 1.912063, 1, 0, 0.6470588, 1,
1.308918, 0.6860004, 0.06009802, 1, 0, 0.6431373, 1,
1.310674, 1.603177, 0.3850868, 1, 0, 0.6352941, 1,
1.31758, -1.089837, 1.003457, 1, 0, 0.6313726, 1,
1.318468, -1.188589, 1.488528, 1, 0, 0.6235294, 1,
1.321513, -0.2009177, 2.109845, 1, 0, 0.6196079, 1,
1.325175, 0.3737468, 1.313706, 1, 0, 0.6117647, 1,
1.338593, 0.4096412, 1.420844, 1, 0, 0.6078432, 1,
1.347435, -0.1842508, 1.354833, 1, 0, 0.6, 1,
1.348682, 0.3055635, 0.3781096, 1, 0, 0.5921569, 1,
1.350316, -1.384613, 1.628392, 1, 0, 0.5882353, 1,
1.350652, -1.579483, 3.877752, 1, 0, 0.5803922, 1,
1.358018, -0.1716697, 2.396047, 1, 0, 0.5764706, 1,
1.361944, 0.1317728, 2.861325, 1, 0, 0.5686275, 1,
1.362285, 1.918025, -0.03148911, 1, 0, 0.5647059, 1,
1.367107, -1.19408, 4.362411, 1, 0, 0.5568628, 1,
1.40327, 0.4377384, -0.08278173, 1, 0, 0.5529412, 1,
1.406345, -1.714549, 1.905879, 1, 0, 0.5450981, 1,
1.409988, -1.056997, 4.182463, 1, 0, 0.5411765, 1,
1.417169, 0.2829748, 0.7460328, 1, 0, 0.5333334, 1,
1.417385, -0.3986276, 0.8601682, 1, 0, 0.5294118, 1,
1.425777, -0.2587671, 2.374009, 1, 0, 0.5215687, 1,
1.426038, -2.133352, 3.512605, 1, 0, 0.5176471, 1,
1.432404, 0.9435667, -0.1236108, 1, 0, 0.509804, 1,
1.441161, -0.6883224, 1.984044, 1, 0, 0.5058824, 1,
1.444026, 0.1979069, 1.575358, 1, 0, 0.4980392, 1,
1.44432, -0.4556448, 0.7752919, 1, 0, 0.4901961, 1,
1.449284, -0.6245893, 1.158054, 1, 0, 0.4862745, 1,
1.449521, -0.7444118, 2.949445, 1, 0, 0.4784314, 1,
1.453002, -1.299058, 1.311868, 1, 0, 0.4745098, 1,
1.457834, 0.6029745, 1.081642, 1, 0, 0.4666667, 1,
1.459908, 0.5589256, 0.9773248, 1, 0, 0.4627451, 1,
1.501222, -0.4585876, 0.02985115, 1, 0, 0.454902, 1,
1.502267, 2.593826, 1.41155, 1, 0, 0.4509804, 1,
1.526213, 2.050256, -1.064138, 1, 0, 0.4431373, 1,
1.549363, 1.280829, 0.9574558, 1, 0, 0.4392157, 1,
1.556996, -1.17153, 2.324911, 1, 0, 0.4313726, 1,
1.568471, -0.8864127, 3.439403, 1, 0, 0.427451, 1,
1.56955, -1.439202, 3.707205, 1, 0, 0.4196078, 1,
1.584625, 0.1254341, 2.183172, 1, 0, 0.4156863, 1,
1.586043, 0.6652684, 1.849522, 1, 0, 0.4078431, 1,
1.590054, -1.311492, 2.220088, 1, 0, 0.4039216, 1,
1.60427, 1.006176, -0.5598615, 1, 0, 0.3960784, 1,
1.606005, -1.187527, 1.333421, 1, 0, 0.3882353, 1,
1.61879, 0.2591365, 0.3818892, 1, 0, 0.3843137, 1,
1.632433, 1.1507, 0.5068543, 1, 0, 0.3764706, 1,
1.638931, -0.7400721, 2.255896, 1, 0, 0.372549, 1,
1.645568, 0.2040578, 2.120846, 1, 0, 0.3647059, 1,
1.676774, -1.250555, 2.211288, 1, 0, 0.3607843, 1,
1.681977, -0.07783766, -0.2710439, 1, 0, 0.3529412, 1,
1.693609, 0.7929297, 0.6561098, 1, 0, 0.3490196, 1,
1.697181, 0.8809317, 1.818317, 1, 0, 0.3411765, 1,
1.701334, 1.2141, 0.2794417, 1, 0, 0.3372549, 1,
1.732246, -0.6651855, 1.501226, 1, 0, 0.3294118, 1,
1.747711, 0.1460488, 2.51399, 1, 0, 0.3254902, 1,
1.752154, 1.188729, 1.027381, 1, 0, 0.3176471, 1,
1.765472, 0.4324501, 0.4283704, 1, 0, 0.3137255, 1,
1.770341, 0.03036401, 0.8023379, 1, 0, 0.3058824, 1,
1.776724, -0.4808036, 2.366904, 1, 0, 0.2980392, 1,
1.802066, -0.458877, -0.7336032, 1, 0, 0.2941177, 1,
1.809901, 0.09721912, 3.696785, 1, 0, 0.2862745, 1,
1.810863, -0.4583492, 2.037766, 1, 0, 0.282353, 1,
1.829627, 0.5071316, 1.84447, 1, 0, 0.2745098, 1,
1.840533, 1.173627, 1.21128, 1, 0, 0.2705882, 1,
1.85257, 0.4496301, 3.335647, 1, 0, 0.2627451, 1,
1.865279, -0.4542724, 1.290066, 1, 0, 0.2588235, 1,
1.896534, 1.887548, 0.1843762, 1, 0, 0.2509804, 1,
1.898584, 0.2507314, 2.304481, 1, 0, 0.2470588, 1,
1.904003, -1.636687, 2.31241, 1, 0, 0.2392157, 1,
1.911794, 1.535198, -1.628584, 1, 0, 0.2352941, 1,
1.933648, 0.01958591, 2.225094, 1, 0, 0.227451, 1,
1.93501, 0.1490337, 1.53363, 1, 0, 0.2235294, 1,
1.949455, -0.2432723, 1.272276, 1, 0, 0.2156863, 1,
1.960458, 0.1710555, 1.728527, 1, 0, 0.2117647, 1,
1.969492, 0.0521865, 1.728235, 1, 0, 0.2039216, 1,
1.980371, 0.9182814, 0.4016387, 1, 0, 0.1960784, 1,
1.9829, 1.787166, 2.012316, 1, 0, 0.1921569, 1,
1.993405, 0.08593299, 2.05228, 1, 0, 0.1843137, 1,
1.999902, -1.219021, 1.95456, 1, 0, 0.1803922, 1,
2.004282, -0.6494076, 3.407511, 1, 0, 0.172549, 1,
2.01302, -0.548481, 1.503135, 1, 0, 0.1686275, 1,
2.068604, 0.5886571, 0.4538002, 1, 0, 0.1607843, 1,
2.088857, 0.06271446, 2.3583, 1, 0, 0.1568628, 1,
2.089055, 0.4720348, 0.529317, 1, 0, 0.1490196, 1,
2.090895, -2.134805, 1.151933, 1, 0, 0.145098, 1,
2.114352, -1.175388, 2.823722, 1, 0, 0.1372549, 1,
2.141468, -0.6148855, 0.2792209, 1, 0, 0.1333333, 1,
2.168779, 0.490256, 2.021256, 1, 0, 0.1254902, 1,
2.193812, 0.265747, 0.3494388, 1, 0, 0.1215686, 1,
2.211342, -0.2522824, -0.1046346, 1, 0, 0.1137255, 1,
2.231571, -0.5803421, -0.2228153, 1, 0, 0.1098039, 1,
2.258737, -1.03948, 3.114672, 1, 0, 0.1019608, 1,
2.280161, -0.3360751, 1.924751, 1, 0, 0.09411765, 1,
2.308187, 0.2138148, 2.326646, 1, 0, 0.09019608, 1,
2.37873, 1.080453, 1.943925, 1, 0, 0.08235294, 1,
2.38439, 0.4161817, 2.104907, 1, 0, 0.07843138, 1,
2.457266, 1.012854, 1.99547, 1, 0, 0.07058824, 1,
2.470804, 0.4901783, 0.4031085, 1, 0, 0.06666667, 1,
2.486781, 1.442723, 1.216137, 1, 0, 0.05882353, 1,
2.520942, -0.7195668, 1.037203, 1, 0, 0.05490196, 1,
2.570623, -2.330091, 1.399581, 1, 0, 0.04705882, 1,
2.608944, -1.520603, 2.071259, 1, 0, 0.04313726, 1,
2.637453, 0.1196423, 1.344578, 1, 0, 0.03529412, 1,
2.669971, -1.844057, 2.843754, 1, 0, 0.03137255, 1,
2.701843, -1.175361, 2.192316, 1, 0, 0.02352941, 1,
2.715022, -0.01316887, 1.809274, 1, 0, 0.01960784, 1,
2.992961, 0.1539006, 0.9585947, 1, 0, 0.01176471, 1,
3.321544, 0.1534641, 0.9652504, 1, 0, 0.007843138, 1
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
-0.002966046, -4.416531, -6.477396, 0, -0.5, 0.5, 0.5,
-0.002966046, -4.416531, -6.477396, 1, -0.5, 0.5, 0.5,
-0.002966046, -4.416531, -6.477396, 1, 1.5, 0.5, 0.5,
-0.002966046, -4.416531, -6.477396, 0, 1.5, 0.5, 0.5
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
-4.454484, 0.2894222, -6.477396, 0, -0.5, 0.5, 0.5,
-4.454484, 0.2894222, -6.477396, 1, -0.5, 0.5, 0.5,
-4.454484, 0.2894222, -6.477396, 1, 1.5, 0.5, 0.5,
-4.454484, 0.2894222, -6.477396, 0, 1.5, 0.5, 0.5
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
-4.454484, -4.416531, 0.4703617, 0, -0.5, 0.5, 0.5,
-4.454484, -4.416531, 0.4703617, 1, -0.5, 0.5, 0.5,
-4.454484, -4.416531, 0.4703617, 1, 1.5, 0.5, 0.5,
-4.454484, -4.416531, 0.4703617, 0, 1.5, 0.5, 0.5
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
-3, -3.330541, -4.874067,
3, -3.330541, -4.874067,
-3, -3.330541, -4.874067,
-3, -3.511539, -5.141289,
-2, -3.330541, -4.874067,
-2, -3.511539, -5.141289,
-1, -3.330541, -4.874067,
-1, -3.511539, -5.141289,
0, -3.330541, -4.874067,
0, -3.511539, -5.141289,
1, -3.330541, -4.874067,
1, -3.511539, -5.141289,
2, -3.330541, -4.874067,
2, -3.511539, -5.141289,
3, -3.330541, -4.874067,
3, -3.511539, -5.141289
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
-3, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
-3, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
-3, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
-3, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5,
-2, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
-2, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
-2, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
-2, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5,
-1, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
-1, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
-1, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
-1, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5,
0, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
0, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
0, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
0, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5,
1, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
1, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
1, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
1, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5,
2, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
2, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
2, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
2, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5,
3, -3.873536, -5.675732, 0, -0.5, 0.5, 0.5,
3, -3.873536, -5.675732, 1, -0.5, 0.5, 0.5,
3, -3.873536, -5.675732, 1, 1.5, 0.5, 0.5,
3, -3.873536, -5.675732, 0, 1.5, 0.5, 0.5
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
-3.427211, -2, -4.874067,
-3.427211, 2, -4.874067,
-3.427211, -2, -4.874067,
-3.598423, -2, -5.141289,
-3.427211, 0, -4.874067,
-3.598423, 0, -5.141289,
-3.427211, 2, -4.874067,
-3.598423, 2, -5.141289
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
"0",
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
-3.940848, -2, -5.675732, 0, -0.5, 0.5, 0.5,
-3.940848, -2, -5.675732, 1, -0.5, 0.5, 0.5,
-3.940848, -2, -5.675732, 1, 1.5, 0.5, 0.5,
-3.940848, -2, -5.675732, 0, 1.5, 0.5, 0.5,
-3.940848, 0, -5.675732, 0, -0.5, 0.5, 0.5,
-3.940848, 0, -5.675732, 1, -0.5, 0.5, 0.5,
-3.940848, 0, -5.675732, 1, 1.5, 0.5, 0.5,
-3.940848, 0, -5.675732, 0, 1.5, 0.5, 0.5,
-3.940848, 2, -5.675732, 0, -0.5, 0.5, 0.5,
-3.940848, 2, -5.675732, 1, -0.5, 0.5, 0.5,
-3.940848, 2, -5.675732, 1, 1.5, 0.5, 0.5,
-3.940848, 2, -5.675732, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.427211, -3.330541, -4,
-3.427211, -3.330541, 4,
-3.427211, -3.330541, -4,
-3.598423, -3.511539, -4,
-3.427211, -3.330541, -2,
-3.598423, -3.511539, -2,
-3.427211, -3.330541, 0,
-3.598423, -3.511539, 0,
-3.427211, -3.330541, 2,
-3.598423, -3.511539, 2,
-3.427211, -3.330541, 4,
-3.598423, -3.511539, 4
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
-3.940848, -3.873536, -4, 0, -0.5, 0.5, 0.5,
-3.940848, -3.873536, -4, 1, -0.5, 0.5, 0.5,
-3.940848, -3.873536, -4, 1, 1.5, 0.5, 0.5,
-3.940848, -3.873536, -4, 0, 1.5, 0.5, 0.5,
-3.940848, -3.873536, -2, 0, -0.5, 0.5, 0.5,
-3.940848, -3.873536, -2, 1, -0.5, 0.5, 0.5,
-3.940848, -3.873536, -2, 1, 1.5, 0.5, 0.5,
-3.940848, -3.873536, -2, 0, 1.5, 0.5, 0.5,
-3.940848, -3.873536, 0, 0, -0.5, 0.5, 0.5,
-3.940848, -3.873536, 0, 1, -0.5, 0.5, 0.5,
-3.940848, -3.873536, 0, 1, 1.5, 0.5, 0.5,
-3.940848, -3.873536, 0, 0, 1.5, 0.5, 0.5,
-3.940848, -3.873536, 2, 0, -0.5, 0.5, 0.5,
-3.940848, -3.873536, 2, 1, -0.5, 0.5, 0.5,
-3.940848, -3.873536, 2, 1, 1.5, 0.5, 0.5,
-3.940848, -3.873536, 2, 0, 1.5, 0.5, 0.5,
-3.940848, -3.873536, 4, 0, -0.5, 0.5, 0.5,
-3.940848, -3.873536, 4, 1, -0.5, 0.5, 0.5,
-3.940848, -3.873536, 4, 1, 1.5, 0.5, 0.5,
-3.940848, -3.873536, 4, 0, 1.5, 0.5, 0.5
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
-3.427211, -3.330541, -4.874067,
-3.427211, 3.909386, -4.874067,
-3.427211, -3.330541, 5.814791,
-3.427211, 3.909386, 5.814791,
-3.427211, -3.330541, -4.874067,
-3.427211, -3.330541, 5.814791,
-3.427211, 3.909386, -4.874067,
-3.427211, 3.909386, 5.814791,
-3.427211, -3.330541, -4.874067,
3.421279, -3.330541, -4.874067,
-3.427211, -3.330541, 5.814791,
3.421279, -3.330541, 5.814791,
-3.427211, 3.909386, -4.874067,
3.421279, 3.909386, -4.874067,
-3.427211, 3.909386, 5.814791,
3.421279, 3.909386, 5.814791,
3.421279, -3.330541, -4.874067,
3.421279, 3.909386, -4.874067,
3.421279, -3.330541, 5.814791,
3.421279, 3.909386, 5.814791,
3.421279, -3.330541, -4.874067,
3.421279, -3.330541, 5.814791,
3.421279, 3.909386, -4.874067,
3.421279, 3.909386, 5.814791
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
var radius = 7.803611;
var distance = 34.71915;
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
mvMatrix.translate( 0.002966046, -0.2894222, -0.4703617 );
mvMatrix.scale( 1.232011, 1.165401, 0.7893656 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71915);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
aramite<-read.table("aramite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aramite$V2
```

```
## Error in eval(expr, envir, enclos): object 'aramite' not found
```

```r
y<-aramite$V3
```

```
## Error in eval(expr, envir, enclos): object 'aramite' not found
```

```r
z<-aramite$V4
```

```
## Error in eval(expr, envir, enclos): object 'aramite' not found
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
-3.327476, 0.1582144, -1.260591, 0, 0, 1, 1, 1,
-3.141145, -0.4913529, -0.2763693, 1, 0, 0, 1, 1,
-2.954198, 0.8504388, -1.275029, 1, 0, 0, 1, 1,
-2.805245, 2.77925, -0.09770408, 1, 0, 0, 1, 1,
-2.593776, -1.139821, -2.162979, 1, 0, 0, 1, 1,
-2.586665, -0.810471, 0.772195, 1, 0, 0, 1, 1,
-2.296555, 1.000703, -0.1999524, 0, 0, 0, 1, 1,
-2.285828, 0.6602957, -1.075992, 0, 0, 0, 1, 1,
-2.272419, 0.4180478, -0.9186544, 0, 0, 0, 1, 1,
-2.254797, 0.6337963, -1.401934, 0, 0, 0, 1, 1,
-2.207654, -0.6997501, -1.65345, 0, 0, 0, 1, 1,
-2.206794, 0.1467841, -0.8907834, 0, 0, 0, 1, 1,
-2.134665, -0.192369, -1.774966, 0, 0, 0, 1, 1,
-2.131636, 0.7339319, -0.8364323, 1, 1, 1, 1, 1,
-2.044292, 0.620054, -1.394247, 1, 1, 1, 1, 1,
-2.040333, -0.05341177, -3.14457, 1, 1, 1, 1, 1,
-2.037767, -1.594033, -1.196388, 1, 1, 1, 1, 1,
-2.024062, -1.346288, -2.827829, 1, 1, 1, 1, 1,
-2.010547, -1.112957, -1.642658, 1, 1, 1, 1, 1,
-1.962043, -0.6797838, -1.404936, 1, 1, 1, 1, 1,
-1.924133, 0.7115705, -1.121181, 1, 1, 1, 1, 1,
-1.901586, 0.9407357, -0.4509801, 1, 1, 1, 1, 1,
-1.88695, -0.2766936, -3.643041, 1, 1, 1, 1, 1,
-1.875988, 1.897686, -1.07363, 1, 1, 1, 1, 1,
-1.851739, 0.7093324, 0.3829614, 1, 1, 1, 1, 1,
-1.790008, -2.017977, -1.684866, 1, 1, 1, 1, 1,
-1.784018, -0.6415592, -1.590089, 1, 1, 1, 1, 1,
-1.76671, -1.571394, -1.726562, 1, 1, 1, 1, 1,
-1.762876, -0.2846264, -2.567542, 0, 0, 1, 1, 1,
-1.722662, -0.08379838, -0.8864636, 1, 0, 0, 1, 1,
-1.718638, 0.3710578, -2.261504, 1, 0, 0, 1, 1,
-1.715969, -0.9587378, -3.080452, 1, 0, 0, 1, 1,
-1.713333, 0.08495093, -2.312916, 1, 0, 0, 1, 1,
-1.698718, 0.365294, -1.624712, 1, 0, 0, 1, 1,
-1.68757, 0.6148068, -1.690283, 0, 0, 0, 1, 1,
-1.67436, -0.6072335, -2.095597, 0, 0, 0, 1, 1,
-1.669663, 0.1236899, -0.8958945, 0, 0, 0, 1, 1,
-1.668728, -0.6995988, -1.742542, 0, 0, 0, 1, 1,
-1.668678, 0.779289, -0.7216332, 0, 0, 0, 1, 1,
-1.649504, -0.08032594, 0.1804346, 0, 0, 0, 1, 1,
-1.640603, -0.6019253, -0.9264238, 0, 0, 0, 1, 1,
-1.638539, 1.112238, 2.036686, 1, 1, 1, 1, 1,
-1.62346, -1.298185, -2.139639, 1, 1, 1, 1, 1,
-1.609524, -0.6719656, -1.353817, 1, 1, 1, 1, 1,
-1.607736, -1.556155, -1.706143, 1, 1, 1, 1, 1,
-1.605135, -0.465473, -2.453249, 1, 1, 1, 1, 1,
-1.590968, -0.1896634, -1.806813, 1, 1, 1, 1, 1,
-1.589619, 0.1656447, -0.690342, 1, 1, 1, 1, 1,
-1.583652, 0.9042234, -2.238013, 1, 1, 1, 1, 1,
-1.581921, 1.483124, -0.858985, 1, 1, 1, 1, 1,
-1.578237, 0.9776304, -0.92678, 1, 1, 1, 1, 1,
-1.576756, -0.2896526, -1.598443, 1, 1, 1, 1, 1,
-1.561013, -0.4915491, -2.6865, 1, 1, 1, 1, 1,
-1.552222, 1.73412, -3.433832, 1, 1, 1, 1, 1,
-1.550699, -0.7394226, -1.610207, 1, 1, 1, 1, 1,
-1.53781, -0.9756693, -4.612857, 1, 1, 1, 1, 1,
-1.534962, -0.40388, -1.570915, 0, 0, 1, 1, 1,
-1.530501, 0.02310016, -2.885951, 1, 0, 0, 1, 1,
-1.524867, -0.3434601, -3.279836, 1, 0, 0, 1, 1,
-1.524675, 1.391, -0.2628348, 1, 0, 0, 1, 1,
-1.521682, 1.307488, -1.462815, 1, 0, 0, 1, 1,
-1.518445, -1.028826, -3.40707, 1, 0, 0, 1, 1,
-1.504123, 0.8682345, 0.2791258, 0, 0, 0, 1, 1,
-1.494336, 0.4516145, -0.8002633, 0, 0, 0, 1, 1,
-1.490015, -0.6028488, -1.311217, 0, 0, 0, 1, 1,
-1.455932, 0.5814982, -1.091101, 0, 0, 0, 1, 1,
-1.446335, 1.915313, -1.519155, 0, 0, 0, 1, 1,
-1.439843, 0.2877441, -2.146646, 0, 0, 0, 1, 1,
-1.438286, -2.02882, -4.110282, 0, 0, 0, 1, 1,
-1.411529, -0.5063506, -3.195923, 1, 1, 1, 1, 1,
-1.407458, -0.4137974, -0.6016201, 1, 1, 1, 1, 1,
-1.402937, 0.8586715, -1.660928, 1, 1, 1, 1, 1,
-1.402873, 0.7411661, -2.128394, 1, 1, 1, 1, 1,
-1.400652, 1.619175, -1.087297, 1, 1, 1, 1, 1,
-1.395962, 0.392512, -1.79577, 1, 1, 1, 1, 1,
-1.395265, -0.534965, -0.9468304, 1, 1, 1, 1, 1,
-1.38596, 0.9354643, -1.865461, 1, 1, 1, 1, 1,
-1.373287, 0.9382222, -0.3530824, 1, 1, 1, 1, 1,
-1.34151, 0.630605, -1.749667, 1, 1, 1, 1, 1,
-1.338396, 0.714464, -0.6625026, 1, 1, 1, 1, 1,
-1.335855, 0.4961773, -1.586546, 1, 1, 1, 1, 1,
-1.334745, -2.292386, -3.363244, 1, 1, 1, 1, 1,
-1.320012, -0.6342674, -2.232507, 1, 1, 1, 1, 1,
-1.318625, -1.387581, -3.647616, 1, 1, 1, 1, 1,
-1.312172, -1.187951, -2.598266, 0, 0, 1, 1, 1,
-1.308812, 0.2703514, -1.898343, 1, 0, 0, 1, 1,
-1.305831, 0.3319771, 0.5029183, 1, 0, 0, 1, 1,
-1.297565, -1.218484, -1.891854, 1, 0, 0, 1, 1,
-1.292306, 0.2755056, -1.769733, 1, 0, 0, 1, 1,
-1.266568, -1.1601, -0.991501, 1, 0, 0, 1, 1,
-1.265237, 0.5759327, -1.387604, 0, 0, 0, 1, 1,
-1.26521, -1.630807, -2.571892, 0, 0, 0, 1, 1,
-1.264053, 0.1500472, -0.1338586, 0, 0, 0, 1, 1,
-1.26344, 1.038321, -1.576683, 0, 0, 0, 1, 1,
-1.25718, -1.755659, -2.815948, 0, 0, 0, 1, 1,
-1.255145, -0.6057637, -2.271797, 0, 0, 0, 1, 1,
-1.248116, -0.5320415, -0.1802067, 0, 0, 0, 1, 1,
-1.248007, 0.9745044, 0.1149212, 1, 1, 1, 1, 1,
-1.236192, 0.1647683, -0.008646538, 1, 1, 1, 1, 1,
-1.236069, -1.749106, -2.270573, 1, 1, 1, 1, 1,
-1.234164, -1.011255, -4.239803, 1, 1, 1, 1, 1,
-1.225411, 0.8883333, -0.6512852, 1, 1, 1, 1, 1,
-1.224836, -1.285081, -1.349056, 1, 1, 1, 1, 1,
-1.219083, -0.5260858, -2.812118, 1, 1, 1, 1, 1,
-1.216521, 0.2036834, -1.778172, 1, 1, 1, 1, 1,
-1.216458, -0.06624759, -1.673543, 1, 1, 1, 1, 1,
-1.215122, 1.079076, -1.568555, 1, 1, 1, 1, 1,
-1.207186, 0.9225083, -0.7121699, 1, 1, 1, 1, 1,
-1.201626, -0.3110388, -0.6434605, 1, 1, 1, 1, 1,
-1.193682, -1.501403, -1.951874, 1, 1, 1, 1, 1,
-1.193354, 0.9881259, -0.9123235, 1, 1, 1, 1, 1,
-1.183729, -0.831742, -3.012486, 1, 1, 1, 1, 1,
-1.162148, 0.6639196, -1.185556, 0, 0, 1, 1, 1,
-1.161, 2.083139, 0.710273, 1, 0, 0, 1, 1,
-1.156789, -0.9912833, -3.268038, 1, 0, 0, 1, 1,
-1.147372, 0.1246323, -0.544413, 1, 0, 0, 1, 1,
-1.147035, 0.4711854, -1.030478, 1, 0, 0, 1, 1,
-1.138163, 1.123687, -0.3835177, 1, 0, 0, 1, 1,
-1.131905, 1.572352, 0.09586053, 0, 0, 0, 1, 1,
-1.129851, -1.193535, -2.640597, 0, 0, 0, 1, 1,
-1.125098, -1.257965, -0.5972408, 0, 0, 0, 1, 1,
-1.118949, 1.717416, -0.7213483, 0, 0, 0, 1, 1,
-1.107049, 2.2531, 0.982587, 0, 0, 0, 1, 1,
-1.105003, -0.1159857, -2.533558, 0, 0, 0, 1, 1,
-1.102654, 1.882938, -1.084903, 0, 0, 0, 1, 1,
-1.098637, 0.8970044, -2.544702, 1, 1, 1, 1, 1,
-1.09675, 0.9600316, -2.052586, 1, 1, 1, 1, 1,
-1.095635, 0.2241891, -3.376441, 1, 1, 1, 1, 1,
-1.093286, -1.34293, -2.571317, 1, 1, 1, 1, 1,
-1.079256, -0.3506591, -0.9730334, 1, 1, 1, 1, 1,
-1.078181, 0.6750275, -0.2711305, 1, 1, 1, 1, 1,
-1.077882, -0.4898042, -0.393857, 1, 1, 1, 1, 1,
-1.077495, -0.1574447, -0.4867581, 1, 1, 1, 1, 1,
-1.072546, -0.5160572, -3.333085, 1, 1, 1, 1, 1,
-1.070259, 0.04980263, 0.1664882, 1, 1, 1, 1, 1,
-1.064867, 2.053347, -2.209028, 1, 1, 1, 1, 1,
-1.058341, 0.1307345, -3.673954, 1, 1, 1, 1, 1,
-1.058294, 1.332743, -2.184458, 1, 1, 1, 1, 1,
-1.043088, 0.3248785, 0.6446469, 1, 1, 1, 1, 1,
-1.040558, -0.3152706, -2.772246, 1, 1, 1, 1, 1,
-1.02652, -0.3795627, -0.975633, 0, 0, 1, 1, 1,
-1.02642, 0.5441992, -0.8448187, 1, 0, 0, 1, 1,
-1.026182, 0.4110468, 0.228694, 1, 0, 0, 1, 1,
-1.024793, 0.7520882, -1.346764, 1, 0, 0, 1, 1,
-1.022168, 0.3218436, -0.5660021, 1, 0, 0, 1, 1,
-1.018782, 0.1824673, -0.5718023, 1, 0, 0, 1, 1,
-1.017311, 1.176581, -1.076283, 0, 0, 0, 1, 1,
-1.009356, -0.324408, -0.8885673, 0, 0, 0, 1, 1,
-1.000444, -0.1494854, 0.8527864, 0, 0, 0, 1, 1,
-0.9988112, 0.303524, -1.458296, 0, 0, 0, 1, 1,
-0.9904606, -2.21318, -2.442649, 0, 0, 0, 1, 1,
-0.9861454, -0.1161461, -2.026979, 0, 0, 0, 1, 1,
-0.9829072, -0.9287387, -2.410877, 0, 0, 0, 1, 1,
-0.9825078, 0.02942758, -0.1444271, 1, 1, 1, 1, 1,
-0.9786159, -1.313573, -4.664695, 1, 1, 1, 1, 1,
-0.977564, -2.289475, -3.028019, 1, 1, 1, 1, 1,
-0.9748768, 0.06004957, -3.293807, 1, 1, 1, 1, 1,
-0.9666355, 0.2736643, -2.36846, 1, 1, 1, 1, 1,
-0.9620632, 1.063923, -0.363209, 1, 1, 1, 1, 1,
-0.9556111, 0.2374014, -2.51533, 1, 1, 1, 1, 1,
-0.9535003, -0.3542977, -2.972131, 1, 1, 1, 1, 1,
-0.9516635, 0.6118432, -2.024057, 1, 1, 1, 1, 1,
-0.9482956, 0.8502211, -1.161132, 1, 1, 1, 1, 1,
-0.9462323, 1.092373, -0.9888406, 1, 1, 1, 1, 1,
-0.9455116, -0.4122779, -1.68265, 1, 1, 1, 1, 1,
-0.9438959, 0.975722, -0.5685039, 1, 1, 1, 1, 1,
-0.9399099, -1.170587, -0.8231723, 1, 1, 1, 1, 1,
-0.9399045, -0.7485235, -1.251593, 1, 1, 1, 1, 1,
-0.9383808, -1.349228, -1.928694, 0, 0, 1, 1, 1,
-0.9380434, 0.2089554, -1.020703, 1, 0, 0, 1, 1,
-0.9300998, 1.460441, -2.203656, 1, 0, 0, 1, 1,
-0.9297066, -1.448334, -3.811968, 1, 0, 0, 1, 1,
-0.923661, 1.028706, -2.934963, 1, 0, 0, 1, 1,
-0.9146216, -1.409207, -4.623754, 1, 0, 0, 1, 1,
-0.9071454, -1.691788, -3.441696, 0, 0, 0, 1, 1,
-0.9071305, -0.2978474, -1.086098, 0, 0, 0, 1, 1,
-0.9055685, -0.629699, -2.025289, 0, 0, 0, 1, 1,
-0.8990929, -0.99928, -3.463509, 0, 0, 0, 1, 1,
-0.8979811, 0.8287997, -0.07443619, 0, 0, 0, 1, 1,
-0.8957922, 2.693024, -1.311053, 0, 0, 0, 1, 1,
-0.8939533, -0.1013847, -2.205003, 0, 0, 0, 1, 1,
-0.893011, -1.14265, -1.497718, 1, 1, 1, 1, 1,
-0.8895058, -0.9265484, -3.647286, 1, 1, 1, 1, 1,
-0.8845244, -0.8075745, -3.314483, 1, 1, 1, 1, 1,
-0.8832633, 1.714456, -0.009141038, 1, 1, 1, 1, 1,
-0.8832461, -0.414992, -2.421094, 1, 1, 1, 1, 1,
-0.8774664, -2.2471, -2.759251, 1, 1, 1, 1, 1,
-0.8766171, 1.250728, 0.9430282, 1, 1, 1, 1, 1,
-0.8752226, 0.121843, -0.5292584, 1, 1, 1, 1, 1,
-0.874344, 0.01565514, -4.226374, 1, 1, 1, 1, 1,
-0.8683057, -0.182073, 0.9520768, 1, 1, 1, 1, 1,
-0.8674963, -0.1238505, -1.693661, 1, 1, 1, 1, 1,
-0.8612655, -1.211135, -2.643915, 1, 1, 1, 1, 1,
-0.8606871, 1.716442, -1.768922, 1, 1, 1, 1, 1,
-0.8473885, -0.462536, -1.750241, 1, 1, 1, 1, 1,
-0.8435957, -1.517402, -1.52648, 1, 1, 1, 1, 1,
-0.8332452, -1.100335, -2.033622, 0, 0, 1, 1, 1,
-0.82773, -0.7511128, -3.642289, 1, 0, 0, 1, 1,
-0.8276436, 1.661895, -1.164298, 1, 0, 0, 1, 1,
-0.8217404, -0.9253832, -4.38546, 1, 0, 0, 1, 1,
-0.8215337, 0.3951806, -2.623379, 1, 0, 0, 1, 1,
-0.8170117, 1.024644, -0.377426, 1, 0, 0, 1, 1,
-0.8095499, 1.326269, -0.838914, 0, 0, 0, 1, 1,
-0.8061618, -1.391802, -2.259579, 0, 0, 0, 1, 1,
-0.8036628, 0.3773707, -1.597409, 0, 0, 0, 1, 1,
-0.8011163, -0.5540537, -3.284804, 0, 0, 0, 1, 1,
-0.7942082, 3.80395, -0.4184111, 0, 0, 0, 1, 1,
-0.7903519, -0.3001536, -0.7688185, 0, 0, 0, 1, 1,
-0.7884527, -0.5003419, -3.42741, 0, 0, 0, 1, 1,
-0.7881513, -0.3016509, -3.790675, 1, 1, 1, 1, 1,
-0.7881248, -0.1080077, -1.654126, 1, 1, 1, 1, 1,
-0.7870889, -1.481591, -2.961568, 1, 1, 1, 1, 1,
-0.7842963, 1.463758, 0.4646482, 1, 1, 1, 1, 1,
-0.781054, -0.8771367, -2.424792, 1, 1, 1, 1, 1,
-0.7772319, 0.9077816, -2.804845, 1, 1, 1, 1, 1,
-0.7756767, 1.871264, 0.5646514, 1, 1, 1, 1, 1,
-0.7667416, -0.7739123, -2.980768, 1, 1, 1, 1, 1,
-0.7632625, -2.222405, -3.090231, 1, 1, 1, 1, 1,
-0.7531366, -1.186713, -3.025714, 1, 1, 1, 1, 1,
-0.75069, -0.3878956, -1.046226, 1, 1, 1, 1, 1,
-0.7445071, 0.9328913, 0.04682592, 1, 1, 1, 1, 1,
-0.7376837, 0.6603098, 1.814366, 1, 1, 1, 1, 1,
-0.7354436, -0.9456653, -1.623641, 1, 1, 1, 1, 1,
-0.7345136, -1.06092, -2.168481, 1, 1, 1, 1, 1,
-0.7326535, -1.418604, -1.572525, 0, 0, 1, 1, 1,
-0.7292142, 1.439859, 0.7484141, 1, 0, 0, 1, 1,
-0.7178008, 0.1176063, -3.189034, 1, 0, 0, 1, 1,
-0.7127149, -0.2855076, -0.8581622, 1, 0, 0, 1, 1,
-0.7124081, 1.101325, -0.8553585, 1, 0, 0, 1, 1,
-0.7117587, 0.9861549, -0.7839547, 1, 0, 0, 1, 1,
-0.7092186, 0.00491289, -1.180634, 0, 0, 0, 1, 1,
-0.6911622, 0.4692601, -2.203873, 0, 0, 0, 1, 1,
-0.6874296, -1.317446, -1.832174, 0, 0, 0, 1, 1,
-0.6850623, 0.01945511, -0.9513249, 0, 0, 0, 1, 1,
-0.6818277, 0.3667661, -1.319509, 0, 0, 0, 1, 1,
-0.6737385, -0.4467275, -1.454032, 0, 0, 0, 1, 1,
-0.6692281, 0.09822608, -1.46226, 0, 0, 0, 1, 1,
-0.6668782, 0.3454263, -3.052006, 1, 1, 1, 1, 1,
-0.6608343, -1.967912, -2.533106, 1, 1, 1, 1, 1,
-0.6593312, -0.02991125, -4.228262, 1, 1, 1, 1, 1,
-0.658034, 0.5146384, -0.3793169, 1, 1, 1, 1, 1,
-0.6546416, -0.5785531, -2.948446, 1, 1, 1, 1, 1,
-0.6537406, -0.6386842, -3.299616, 1, 1, 1, 1, 1,
-0.6524087, -0.6131477, -3.489427, 1, 1, 1, 1, 1,
-0.652056, 2.438102, 1.027043, 1, 1, 1, 1, 1,
-0.6482286, 1.079478, 0.1309888, 1, 1, 1, 1, 1,
-0.6474781, 0.6790925, -1.093005, 1, 1, 1, 1, 1,
-0.6466833, -1.735074, -1.645328, 1, 1, 1, 1, 1,
-0.6464238, 1.246617, -1.174992, 1, 1, 1, 1, 1,
-0.6453918, -0.7301557, -1.140378, 1, 1, 1, 1, 1,
-0.6377385, -0.4084017, -1.192062, 1, 1, 1, 1, 1,
-0.6361688, 0.2117971, -1.591262, 1, 1, 1, 1, 1,
-0.6359993, -0.1784362, -1.932645, 0, 0, 1, 1, 1,
-0.632182, 0.6302998, -0.004043024, 1, 0, 0, 1, 1,
-0.6304293, 1.206519, 0.4589713, 1, 0, 0, 1, 1,
-0.6302695, -1.477107, -1.722584, 1, 0, 0, 1, 1,
-0.6238575, 1.301585, 0.7782415, 1, 0, 0, 1, 1,
-0.6228099, -0.427764, -2.090394, 1, 0, 0, 1, 1,
-0.6191352, -1.452733, -3.539129, 0, 0, 0, 1, 1,
-0.6187259, -1.132512, -3.992363, 0, 0, 0, 1, 1,
-0.6151391, -0.3176817, -0.4094132, 0, 0, 0, 1, 1,
-0.6137635, -0.9873089, -2.263538, 0, 0, 0, 1, 1,
-0.611642, -0.6331804, -1.517451, 0, 0, 0, 1, 1,
-0.6094937, 0.8197985, -0.5295801, 0, 0, 0, 1, 1,
-0.607385, 1.064541, -0.497971, 0, 0, 0, 1, 1,
-0.6064709, 0.7523844, 0.1262988, 1, 1, 1, 1, 1,
-0.6033837, -1.620664, -2.64451, 1, 1, 1, 1, 1,
-0.6015692, -0.6231143, -1.243353, 1, 1, 1, 1, 1,
-0.5984373, 0.02844256, -1.694963, 1, 1, 1, 1, 1,
-0.5979005, -1.58276, -2.288002, 1, 1, 1, 1, 1,
-0.5946868, 0.5343947, -2.061642, 1, 1, 1, 1, 1,
-0.5907875, 0.8246543, 1.696281, 1, 1, 1, 1, 1,
-0.585943, -0.7851247, -1.740465, 1, 1, 1, 1, 1,
-0.5855908, -1.107543, -4.214527, 1, 1, 1, 1, 1,
-0.5837211, -0.1799141, -1.051527, 1, 1, 1, 1, 1,
-0.5816544, -1.585419, -3.569078, 1, 1, 1, 1, 1,
-0.5771898, 0.6732034, 0.137649, 1, 1, 1, 1, 1,
-0.5761522, 0.7512444, -0.7726503, 1, 1, 1, 1, 1,
-0.572817, -1.029541, -3.442469, 1, 1, 1, 1, 1,
-0.5687277, -0.3952291, -1.159381, 1, 1, 1, 1, 1,
-0.56594, -0.3252965, -3.33982, 0, 0, 1, 1, 1,
-0.5642847, -0.4976784, -3.941777, 1, 0, 0, 1, 1,
-0.5522134, 0.577104, -1.614561, 1, 0, 0, 1, 1,
-0.5468877, -2.065761, -0.7929829, 1, 0, 0, 1, 1,
-0.5449114, -0.4193531, -1.33743, 1, 0, 0, 1, 1,
-0.5442669, -0.1036465, -4.546867, 1, 0, 0, 1, 1,
-0.5425556, -1.37636, -2.513319, 0, 0, 0, 1, 1,
-0.5380914, 1.629804, -0.6800932, 0, 0, 0, 1, 1,
-0.5366026, 0.4059817, -1.41288, 0, 0, 0, 1, 1,
-0.5281787, -1.312663, -3.105563, 0, 0, 0, 1, 1,
-0.5256561, -2.006604, -2.921641, 0, 0, 0, 1, 1,
-0.5248485, -0.3750178, -2.882867, 0, 0, 0, 1, 1,
-0.5237615, 1.286486, 0.05446129, 0, 0, 0, 1, 1,
-0.5208427, -1.04033, -1.827982, 1, 1, 1, 1, 1,
-0.5194373, -0.8105241, -3.308146, 1, 1, 1, 1, 1,
-0.5188894, -0.5524066, -1.98563, 1, 1, 1, 1, 1,
-0.5178995, 0.2853247, -1.332932, 1, 1, 1, 1, 1,
-0.5133641, 0.03889745, -1.27762, 1, 1, 1, 1, 1,
-0.5132495, -0.1763069, -2.043379, 1, 1, 1, 1, 1,
-0.5103065, -1.553609, -2.613774, 1, 1, 1, 1, 1,
-0.5083985, -0.445803, -2.738499, 1, 1, 1, 1, 1,
-0.4993415, 0.8437726, 0.933053, 1, 1, 1, 1, 1,
-0.4984752, -0.2934275, -2.109581, 1, 1, 1, 1, 1,
-0.4983817, -1.271871, -3.91188, 1, 1, 1, 1, 1,
-0.4975712, 1.4777, -1.023617, 1, 1, 1, 1, 1,
-0.4971848, 0.7863777, 1.517684, 1, 1, 1, 1, 1,
-0.4945602, -0.8030187, -3.625746, 1, 1, 1, 1, 1,
-0.4911048, -0.1865069, -2.526605, 1, 1, 1, 1, 1,
-0.4899567, 0.8024733, 1.239604, 0, 0, 1, 1, 1,
-0.4899235, 0.9535421, 0.01275108, 1, 0, 0, 1, 1,
-0.4875974, 0.803763, -0.4970049, 1, 0, 0, 1, 1,
-0.4875441, 0.7626595, 1.096207, 1, 0, 0, 1, 1,
-0.4738303, 0.4268253, -1.001598, 1, 0, 0, 1, 1,
-0.4557142, 0.2833205, -0.6436559, 1, 0, 0, 1, 1,
-0.4495811, -1.375144, -1.928907, 0, 0, 0, 1, 1,
-0.4476281, -1.328314, -3.804047, 0, 0, 0, 1, 1,
-0.4471577, -0.8486488, -2.075399, 0, 0, 0, 1, 1,
-0.4390723, -0.08210703, -0.7628111, 0, 0, 0, 1, 1,
-0.4342501, 0.8020022, 0.7148299, 0, 0, 0, 1, 1,
-0.4339745, 0.9184836, 1.188973, 0, 0, 0, 1, 1,
-0.433864, 0.3752601, -0.1573422, 0, 0, 0, 1, 1,
-0.4313394, 0.5228328, -2.018956, 1, 1, 1, 1, 1,
-0.4277495, -0.6529303, -1.574866, 1, 1, 1, 1, 1,
-0.420101, -0.9751608, -3.462921, 1, 1, 1, 1, 1,
-0.4198098, -0.6717567, -2.119679, 1, 1, 1, 1, 1,
-0.4197722, -1.085415, -3.36494, 1, 1, 1, 1, 1,
-0.4174727, -0.8240981, -3.678379, 1, 1, 1, 1, 1,
-0.409599, -2.292079, -2.51195, 1, 1, 1, 1, 1,
-0.4042878, 0.5869524, -0.6000605, 1, 1, 1, 1, 1,
-0.4032083, 0.4738611, -1.155632, 1, 1, 1, 1, 1,
-0.4006197, -0.3709513, -2.792305, 1, 1, 1, 1, 1,
-0.3946879, 0.3981726, -1.04289, 1, 1, 1, 1, 1,
-0.3861196, -0.002329565, 0.2973194, 1, 1, 1, 1, 1,
-0.3842495, -0.8484393, -1.499014, 1, 1, 1, 1, 1,
-0.37705, 0.6806936, -1.553756, 1, 1, 1, 1, 1,
-0.3744589, 0.3124819, -3.002554, 1, 1, 1, 1, 1,
-0.3642424, -0.06911068, 0.1124555, 0, 0, 1, 1, 1,
-0.3634986, 0.4139523, -2.043031, 1, 0, 0, 1, 1,
-0.360084, 0.5561988, -0.6958566, 1, 0, 0, 1, 1,
-0.3600221, -1.230673, -4.223546, 1, 0, 0, 1, 1,
-0.358658, -1.669952, -3.704168, 1, 0, 0, 1, 1,
-0.3583524, 0.2885737, -0.4141412, 1, 0, 0, 1, 1,
-0.3506997, -0.8785587, -3.119644, 0, 0, 0, 1, 1,
-0.3458809, -1.50703, -3.261959, 0, 0, 0, 1, 1,
-0.3431408, 1.368246, -1.184317, 0, 0, 0, 1, 1,
-0.3400742, -0.5885354, -4.400046, 0, 0, 0, 1, 1,
-0.3357463, -0.7415564, -2.028859, 0, 0, 0, 1, 1,
-0.3335081, 0.2814611, -1.287943, 0, 0, 0, 1, 1,
-0.3331057, -0.3117829, -3.479411, 0, 0, 0, 1, 1,
-0.3272901, 0.4726241, -1.526898, 1, 1, 1, 1, 1,
-0.3202297, 0.4166189, -1.335639, 1, 1, 1, 1, 1,
-0.3200552, 0.9637592, 0.5235907, 1, 1, 1, 1, 1,
-0.3199128, 1.465113, -2.081738, 1, 1, 1, 1, 1,
-0.3151922, -0.375737, -1.388643, 1, 1, 1, 1, 1,
-0.3112008, 0.4733568, 0.7121611, 1, 1, 1, 1, 1,
-0.3079094, 1.795238, -1.012444, 1, 1, 1, 1, 1,
-0.3049808, 0.8466518, -0.01349627, 1, 1, 1, 1, 1,
-0.3021784, 1.405405, -0.9900265, 1, 1, 1, 1, 1,
-0.3016238, -0.6010301, -1.593515, 1, 1, 1, 1, 1,
-0.2951128, 1.401883, 0.9509958, 1, 1, 1, 1, 1,
-0.2921939, -0.4899926, -1.647023, 1, 1, 1, 1, 1,
-0.2858956, 1.489006, -0.5463004, 1, 1, 1, 1, 1,
-0.2710748, 0.2423637, -0.2897431, 1, 1, 1, 1, 1,
-0.2623442, -0.06221841, -2.19769, 1, 1, 1, 1, 1,
-0.2573804, -0.1925551, -1.983548, 0, 0, 1, 1, 1,
-0.256325, 0.7840126, -0.3930368, 1, 0, 0, 1, 1,
-0.253136, 0.3455484, -3.227499, 1, 0, 0, 1, 1,
-0.2461072, 0.9174091, -1.053803, 1, 0, 0, 1, 1,
-0.2457087, -0.885996, -2.161158, 1, 0, 0, 1, 1,
-0.2432991, -0.286394, -4.558551, 1, 0, 0, 1, 1,
-0.2365566, -0.6783885, -0.5095445, 0, 0, 0, 1, 1,
-0.2357009, -1.097631, -2.980607, 0, 0, 0, 1, 1,
-0.2328002, 1.186486, -1.283288, 0, 0, 0, 1, 1,
-0.2314182, 0.1505069, -0.505256, 0, 0, 0, 1, 1,
-0.229582, -0.9722206, -2.880085, 0, 0, 0, 1, 1,
-0.226194, -0.8783813, -4.041635, 0, 0, 0, 1, 1,
-0.2256329, 1.693325, 1.339613, 0, 0, 0, 1, 1,
-0.2256124, 1.311984, -0.9107892, 1, 1, 1, 1, 1,
-0.2243213, -1.032493, -2.567358, 1, 1, 1, 1, 1,
-0.2207704, -0.02879587, -2.336114, 1, 1, 1, 1, 1,
-0.2200191, 0.42242, -0.9189399, 1, 1, 1, 1, 1,
-0.2146267, 1.430203, -1.950659, 1, 1, 1, 1, 1,
-0.2106367, -0.6284236, -3.693798, 1, 1, 1, 1, 1,
-0.203784, -0.3131387, -3.176564, 1, 1, 1, 1, 1,
-0.1992085, -0.7152196, -1.982731, 1, 1, 1, 1, 1,
-0.1989894, -1.483374, -2.918732, 1, 1, 1, 1, 1,
-0.1967377, -0.2623273, -2.392529, 1, 1, 1, 1, 1,
-0.193467, -0.70669, -1.400419, 1, 1, 1, 1, 1,
-0.192455, 0.833847, -0.3519692, 1, 1, 1, 1, 1,
-0.1916849, -0.4335613, -4.314581, 1, 1, 1, 1, 1,
-0.1895148, -0.2666988, -1.308122, 1, 1, 1, 1, 1,
-0.1851101, 0.3418076, -1.133408, 1, 1, 1, 1, 1,
-0.1741471, -0.06714877, -1.789523, 0, 0, 1, 1, 1,
-0.1740095, -3.225106, -4.718404, 1, 0, 0, 1, 1,
-0.1720241, -0.4052723, -3.254503, 1, 0, 0, 1, 1,
-0.1703621, 1.291632, -0.3413094, 1, 0, 0, 1, 1,
-0.1696127, 1.141831, -0.4956199, 1, 0, 0, 1, 1,
-0.1667703, 2.58714, -0.2083183, 1, 0, 0, 1, 1,
-0.166666, -0.5643449, -2.337485, 0, 0, 0, 1, 1,
-0.1663001, 1.403775, 0.2160906, 0, 0, 0, 1, 1,
-0.1661171, 0.3994189, 0.3781351, 0, 0, 0, 1, 1,
-0.1645089, 0.6416991, 0.1060365, 0, 0, 0, 1, 1,
-0.1606257, 1.190021, -1.436946, 0, 0, 0, 1, 1,
-0.1588915, 0.237336, -1.595989, 0, 0, 0, 1, 1,
-0.1585163, -1.007082, -4.31705, 0, 0, 0, 1, 1,
-0.1520754, 1.046243, 0.4454282, 1, 1, 1, 1, 1,
-0.1487599, -1.124539, -3.977353, 1, 1, 1, 1, 1,
-0.147613, 3.089402, 0.8458167, 1, 1, 1, 1, 1,
-0.146172, -1.008342, -1.071165, 1, 1, 1, 1, 1,
-0.1454501, -0.02412735, -1.570615, 1, 1, 1, 1, 1,
-0.1386415, 0.7526497, -0.3151334, 1, 1, 1, 1, 1,
-0.1361551, -1.683589, -3.998748, 1, 1, 1, 1, 1,
-0.1345759, -1.07233, -3.459088, 1, 1, 1, 1, 1,
-0.1308546, 1.698983, -0.3946168, 1, 1, 1, 1, 1,
-0.1308039, -0.08975299, -2.156581, 1, 1, 1, 1, 1,
-0.1305718, -0.2575011, -3.05249, 1, 1, 1, 1, 1,
-0.1289146, 1.135252, -0.2029958, 1, 1, 1, 1, 1,
-0.1282333, 0.7046598, 0.9673882, 1, 1, 1, 1, 1,
-0.124627, 1.759285, -1.716266, 1, 1, 1, 1, 1,
-0.1185635, 1.552358, -1.485386, 1, 1, 1, 1, 1,
-0.1138986, 0.8858846, 0.931948, 0, 0, 1, 1, 1,
-0.1117623, -1.447145, -2.665021, 1, 0, 0, 1, 1,
-0.1104783, -1.164667, -3.216717, 1, 0, 0, 1, 1,
-0.1079717, 0.246062, 0.6682876, 1, 0, 0, 1, 1,
-0.1077371, 0.05188225, -0.573505, 1, 0, 0, 1, 1,
-0.1073725, 0.02580835, -2.542058, 1, 0, 0, 1, 1,
-0.107155, -0.4384342, -3.492764, 0, 0, 0, 1, 1,
-0.09685817, 1.859598, 0.6817567, 0, 0, 0, 1, 1,
-0.09058159, 0.8272802, 0.4228942, 0, 0, 0, 1, 1,
-0.08673038, -0.2928165, -3.713226, 0, 0, 0, 1, 1,
-0.08401732, -0.2399258, -4.19689, 0, 0, 0, 1, 1,
-0.08182732, 0.3134724, 0.726358, 0, 0, 0, 1, 1,
-0.08090909, 0.9303606, 0.1508163, 0, 0, 0, 1, 1,
-0.07467201, -0.506968, -3.55724, 1, 1, 1, 1, 1,
-0.06729243, -0.2174671, -4.078748, 1, 1, 1, 1, 1,
-0.06521211, -0.2780553, -3.833884, 1, 1, 1, 1, 1,
-0.06493273, -0.03961734, -2.235227, 1, 1, 1, 1, 1,
-0.06247281, -0.3339106, -3.895508, 1, 1, 1, 1, 1,
-0.06017891, -0.7155271, -3.037764, 1, 1, 1, 1, 1,
-0.05550222, -1.068838, -2.344789, 1, 1, 1, 1, 1,
-0.05265313, -1.337984, -2.366254, 1, 1, 1, 1, 1,
-0.04995241, -0.09616935, -3.109533, 1, 1, 1, 1, 1,
-0.04735102, 0.01943189, 0.05204917, 1, 1, 1, 1, 1,
-0.04311888, -0.07969697, -3.025971, 1, 1, 1, 1, 1,
-0.0401508, -0.8794264, -3.608973, 1, 1, 1, 1, 1,
-0.03972777, 0.1572533, 0.4466168, 1, 1, 1, 1, 1,
-0.0354174, 0.4020226, -2.228549, 1, 1, 1, 1, 1,
-0.03461167, 0.1436301, 0.09039397, 1, 1, 1, 1, 1,
-0.03348644, 0.2183751, 0.009256629, 0, 0, 1, 1, 1,
-0.02952649, -0.3483045, -2.125413, 1, 0, 0, 1, 1,
-0.02929446, -0.8031071, -3.874646, 1, 0, 0, 1, 1,
-0.02452594, 0.03267939, 0.04436088, 1, 0, 0, 1, 1,
-0.02249924, 0.1535019, 0.1115645, 1, 0, 0, 1, 1,
-0.0221615, 0.5532495, -0.634649, 1, 0, 0, 1, 1,
-0.02208747, -1.66958, -4.103786, 0, 0, 0, 1, 1,
-0.02073069, -1.093205, -2.876615, 0, 0, 0, 1, 1,
-0.01994632, -0.278599, -4.031364, 0, 0, 0, 1, 1,
-0.01778885, -1.596257, -3.436846, 0, 0, 0, 1, 1,
-0.01700508, -1.110362, -4.065037, 0, 0, 0, 1, 1,
-0.01667459, -1.850794, -4.294458, 0, 0, 0, 1, 1,
-0.01589793, -0.2292185, -1.231304, 0, 0, 0, 1, 1,
-0.01359517, 0.9553537, 0.4563087, 1, 1, 1, 1, 1,
-0.01129137, 1.073405, 0.5139171, 1, 1, 1, 1, 1,
-0.01038994, -1.290532, -3.083294, 1, 1, 1, 1, 1,
-0.008763295, -0.3501714, -3.83307, 1, 1, 1, 1, 1,
-0.007902251, 1.667889, 0.9727504, 1, 1, 1, 1, 1,
-0.007073083, -0.4934266, -2.961807, 1, 1, 1, 1, 1,
-0.004623348, -1.007587, -2.798992, 1, 1, 1, 1, 1,
-0.004172582, -0.1132009, -3.49912, 1, 1, 1, 1, 1,
-0.00329292, -1.129066, -1.8118, 1, 1, 1, 1, 1,
0.000970931, 0.3151509, 0.8200766, 1, 1, 1, 1, 1,
0.001779324, 1.628606, -0.3402927, 1, 1, 1, 1, 1,
0.004452028, -0.1249257, 1.106703, 1, 1, 1, 1, 1,
0.008450272, -0.4917333, 2.818896, 1, 1, 1, 1, 1,
0.01192338, -0.03339095, 2.077405, 1, 1, 1, 1, 1,
0.01336749, 0.5315458, 1.430378, 1, 1, 1, 1, 1,
0.01398499, -0.2006827, 1.588005, 0, 0, 1, 1, 1,
0.01838547, -1.129719, 4.034167, 1, 0, 0, 1, 1,
0.0221401, -1.493969, 3.510159, 1, 0, 0, 1, 1,
0.02310065, -1.271446, 2.040734, 1, 0, 0, 1, 1,
0.0252717, 0.7778424, -0.83717, 1, 0, 0, 1, 1,
0.02867047, 0.08355952, 0.1850492, 1, 0, 0, 1, 1,
0.02967289, 1.77515, 1.632663, 0, 0, 0, 1, 1,
0.03080802, 0.4680261, 0.4231275, 0, 0, 0, 1, 1,
0.03108424, -1.283671, 3.23917, 0, 0, 0, 1, 1,
0.03396833, -0.73412, 5.659128, 0, 0, 0, 1, 1,
0.0345143, 0.7019444, 1.132054, 0, 0, 0, 1, 1,
0.03500539, -0.5053437, 3.290041, 0, 0, 0, 1, 1,
0.03622179, 0.2185426, -0.6494626, 0, 0, 0, 1, 1,
0.04090692, 0.1819168, 0.1775235, 1, 1, 1, 1, 1,
0.04406751, -0.01769043, 0.2347012, 1, 1, 1, 1, 1,
0.04489852, -0.2014458, 2.987339, 1, 1, 1, 1, 1,
0.0546101, 2.121793, 0.4036956, 1, 1, 1, 1, 1,
0.05552846, 0.8357687, 0.158486, 1, 1, 1, 1, 1,
0.05626763, 0.03618371, 0.8852111, 1, 1, 1, 1, 1,
0.05637753, 1.220616, 0.3714396, 1, 1, 1, 1, 1,
0.05666525, -0.4271052, 2.940982, 1, 1, 1, 1, 1,
0.05667112, 1.217989, 0.867283, 1, 1, 1, 1, 1,
0.05731254, -0.1151274, 1.78251, 1, 1, 1, 1, 1,
0.05769572, 1.951132, -0.1940405, 1, 1, 1, 1, 1,
0.0659446, 0.3373844, 0.3842325, 1, 1, 1, 1, 1,
0.07611493, 0.03621082, 0.5882929, 1, 1, 1, 1, 1,
0.08156873, -1.406819, 4.528036, 1, 1, 1, 1, 1,
0.08387055, 0.4607928, -0.3473075, 1, 1, 1, 1, 1,
0.08416303, -0.3240019, 3.682797, 0, 0, 1, 1, 1,
0.08586954, 0.3873642, -0.1452366, 1, 0, 0, 1, 1,
0.08968613, 1.228468, 0.3374996, 1, 0, 0, 1, 1,
0.09609274, -0.9148709, 3.962812, 1, 0, 0, 1, 1,
0.100629, -1.156619, 3.112975, 1, 0, 0, 1, 1,
0.1030688, 0.7184759, 0.1794161, 1, 0, 0, 1, 1,
0.1091681, 1.583035, 0.9594316, 0, 0, 0, 1, 1,
0.1138882, 0.04158101, -0.8891273, 0, 0, 0, 1, 1,
0.118186, 0.2443353, 1.745798, 0, 0, 0, 1, 1,
0.1183599, 2.793924, -2.054667, 0, 0, 0, 1, 1,
0.127286, 0.9809201, 0.06743331, 0, 0, 0, 1, 1,
0.1303447, -0.2484425, 4.194392, 0, 0, 0, 1, 1,
0.1305759, -0.1804613, 2.919001, 0, 0, 0, 1, 1,
0.1330901, 1.506841, 0.2103, 1, 1, 1, 1, 1,
0.1354242, 0.7528845, -1.471445, 1, 1, 1, 1, 1,
0.1385708, 1.356089, -0.3141111, 1, 1, 1, 1, 1,
0.1387904, -0.5092594, 3.329167, 1, 1, 1, 1, 1,
0.140665, 1.55339, 0.1256453, 1, 1, 1, 1, 1,
0.1408056, 0.893907, 0.5360892, 1, 1, 1, 1, 1,
0.144148, -1.409124, 2.837775, 1, 1, 1, 1, 1,
0.1507073, 0.3525504, 0.0368489, 1, 1, 1, 1, 1,
0.1529679, 0.1989198, 0.8799786, 1, 1, 1, 1, 1,
0.1554419, 0.5941019, -0.6265457, 1, 1, 1, 1, 1,
0.1598567, -1.413823, 3.551567, 1, 1, 1, 1, 1,
0.1696122, 1.426893, 1.464519, 1, 1, 1, 1, 1,
0.1759812, -0.2858287, 2.545152, 1, 1, 1, 1, 1,
0.177186, -0.390811, 2.886663, 1, 1, 1, 1, 1,
0.1801582, 0.3206014, 0.216666, 1, 1, 1, 1, 1,
0.181555, -0.9411976, 2.108543, 0, 0, 1, 1, 1,
0.1825272, 0.4654657, -0.6078978, 1, 0, 0, 1, 1,
0.1826458, -1.230005, 1.309191, 1, 0, 0, 1, 1,
0.1838676, -0.9058745, 3.937807, 1, 0, 0, 1, 1,
0.1841517, 1.716705, 1.097765, 1, 0, 0, 1, 1,
0.1924583, 1.1226, -0.2206003, 1, 0, 0, 1, 1,
0.1983424, -0.1312919, 1.570333, 0, 0, 0, 1, 1,
0.1999483, 0.2642939, -1.753333, 0, 0, 0, 1, 1,
0.2001762, 2.415152, -0.5117072, 0, 0, 0, 1, 1,
0.2010088, -0.4441924, 2.044232, 0, 0, 0, 1, 1,
0.2018921, 0.1305916, 0.9042005, 0, 0, 0, 1, 1,
0.2024377, 1.031901, 2.993734, 0, 0, 0, 1, 1,
0.2033227, 0.01956227, 1.986689, 0, 0, 0, 1, 1,
0.2051496, 1.294539, 1.419472, 1, 1, 1, 1, 1,
0.2052722, -0.1127129, 1.451741, 1, 1, 1, 1, 1,
0.2161815, 0.343935, -0.8212674, 1, 1, 1, 1, 1,
0.2208469, 2.185072, 0.7618164, 1, 1, 1, 1, 1,
0.2214838, 0.1274112, 0.2842735, 1, 1, 1, 1, 1,
0.2234233, 1.682784, 0.7885552, 1, 1, 1, 1, 1,
0.2310523, -0.9113434, 2.845948, 1, 1, 1, 1, 1,
0.2312206, -0.8057763, 4.306208, 1, 1, 1, 1, 1,
0.2361152, 2.145601, 2.135552, 1, 1, 1, 1, 1,
0.2361954, 0.1293033, 0.9890843, 1, 1, 1, 1, 1,
0.2444013, 0.335076, 2.110926, 1, 1, 1, 1, 1,
0.2487655, 1.202423, 0.5640537, 1, 1, 1, 1, 1,
0.2492874, -0.5389552, 3.97583, 1, 1, 1, 1, 1,
0.2514947, -0.4536293, 3.861194, 1, 1, 1, 1, 1,
0.2579604, 1.331397, 0.3512511, 1, 1, 1, 1, 1,
0.260309, 0.7947203, 1.985177, 0, 0, 1, 1, 1,
0.2611776, 0.9064893, 2.482798, 1, 0, 0, 1, 1,
0.2617417, -0.1521159, 1.440117, 1, 0, 0, 1, 1,
0.2659521, -0.5185488, 3.221996, 1, 0, 0, 1, 1,
0.2732359, -0.9652191, 1.856087, 1, 0, 0, 1, 1,
0.2737217, -1.136578, 4.123104, 1, 0, 0, 1, 1,
0.2763819, -0.2864838, 3.69916, 0, 0, 0, 1, 1,
0.27669, 0.4300082, 0.5557025, 0, 0, 0, 1, 1,
0.2766951, -0.5344288, 0.4151349, 0, 0, 0, 1, 1,
0.2819973, 1.923208, 2.360831, 0, 0, 0, 1, 1,
0.2830612, 0.3416387, 1.205441, 0, 0, 0, 1, 1,
0.2831543, 0.5769101, 2.451681, 0, 0, 0, 1, 1,
0.2861877, 0.175836, 1.417786, 0, 0, 0, 1, 1,
0.2865899, 0.3617945, 0.2019456, 1, 1, 1, 1, 1,
0.2928711, -1.050634, 2.295768, 1, 1, 1, 1, 1,
0.2941828, -0.8426605, 3.039657, 1, 1, 1, 1, 1,
0.2943741, 1.965322, -0.02312419, 1, 1, 1, 1, 1,
0.295027, 0.669591, 0.2780063, 1, 1, 1, 1, 1,
0.2978803, -0.6923203, -0.167642, 1, 1, 1, 1, 1,
0.3003619, 0.5601432, -1.218968, 1, 1, 1, 1, 1,
0.3040693, -0.62457, 3.651702, 1, 1, 1, 1, 1,
0.3079324, 2.244484, 0.03621757, 1, 1, 1, 1, 1,
0.3089068, -2.055305, 3.234543, 1, 1, 1, 1, 1,
0.3119528, -1.383962, 3.48144, 1, 1, 1, 1, 1,
0.3122604, -0.568975, 1.464511, 1, 1, 1, 1, 1,
0.3149025, 0.5438269, 1.751055, 1, 1, 1, 1, 1,
0.3213261, -0.2767879, 3.267967, 1, 1, 1, 1, 1,
0.3249352, -0.8049585, 3.346102, 1, 1, 1, 1, 1,
0.3265107, 0.5278686, 0.7096382, 0, 0, 1, 1, 1,
0.3335648, -0.5092815, 3.04505, 1, 0, 0, 1, 1,
0.3337727, -1.242658, 2.253932, 1, 0, 0, 1, 1,
0.3402499, -0.4897919, 3.295022, 1, 0, 0, 1, 1,
0.3406208, -0.4727417, 4.552773, 1, 0, 0, 1, 1,
0.3559509, 0.06888487, 2.40475, 1, 0, 0, 1, 1,
0.3604232, -0.458617, 3.538418, 0, 0, 0, 1, 1,
0.3629554, 1.059403, -0.4331235, 0, 0, 0, 1, 1,
0.3650775, -0.7651441, 3.563627, 0, 0, 0, 1, 1,
0.3671488, 0.7349931, 0.7409134, 0, 0, 0, 1, 1,
0.3689925, -0.3741351, 2.754212, 0, 0, 0, 1, 1,
0.3691475, -0.9773406, 2.45451, 0, 0, 0, 1, 1,
0.370795, -0.1533546, 1.774312, 0, 0, 0, 1, 1,
0.3712539, -1.003453, 2.421311, 1, 1, 1, 1, 1,
0.3746963, -0.8240199, 1.476565, 1, 1, 1, 1, 1,
0.3771412, -1.449997, 3.139416, 1, 1, 1, 1, 1,
0.3772249, 1.024862, 0.001245739, 1, 1, 1, 1, 1,
0.3780289, 0.5938894, 0.5300831, 1, 1, 1, 1, 1,
0.3787878, 2.108, 0.08965765, 1, 1, 1, 1, 1,
0.381829, -1.612717, 3.641572, 1, 1, 1, 1, 1,
0.3880845, -1.911176, 3.109554, 1, 1, 1, 1, 1,
0.3900859, -1.812769, 3.20449, 1, 1, 1, 1, 1,
0.3904671, -1.166044, 4.1412, 1, 1, 1, 1, 1,
0.3917163, -0.342243, 3.506196, 1, 1, 1, 1, 1,
0.3917232, 0.2405333, -0.6000671, 1, 1, 1, 1, 1,
0.3918042, 0.8210933, 1.78265, 1, 1, 1, 1, 1,
0.3919831, -0.1172936, 1.633836, 1, 1, 1, 1, 1,
0.3930601, 1.328775, -0.1004139, 1, 1, 1, 1, 1,
0.396041, -0.04235663, 1.881237, 0, 0, 1, 1, 1,
0.3960845, 0.09599598, 2.343612, 1, 0, 0, 1, 1,
0.3966471, 0.8454114, 1.486769, 1, 0, 0, 1, 1,
0.3977775, -0.6462891, 2.70583, 1, 0, 0, 1, 1,
0.3981383, 0.3409163, 2.10123, 1, 0, 0, 1, 1,
0.4151367, -0.6191667, 3.385914, 1, 0, 0, 1, 1,
0.4155796, 0.6021417, 0.8474908, 0, 0, 0, 1, 1,
0.4190432, -2.504638, 2.65004, 0, 0, 0, 1, 1,
0.4204954, 0.6085226, -0.1911226, 0, 0, 0, 1, 1,
0.4252623, 1.146782, 1.234866, 0, 0, 0, 1, 1,
0.4319344, -0.2092767, 1.517054, 0, 0, 0, 1, 1,
0.4326034, 1.448158, 0.350252, 0, 0, 0, 1, 1,
0.4355503, -0.1222821, 2.305794, 0, 0, 0, 1, 1,
0.4356394, 1.547401, 0.1611992, 1, 1, 1, 1, 1,
0.4440149, -0.1790086, 3.018469, 1, 1, 1, 1, 1,
0.4479293, -0.7703989, 0.4023595, 1, 1, 1, 1, 1,
0.4481698, -2.34917, 4.173604, 1, 1, 1, 1, 1,
0.4493131, -2.589215, 5.563091, 1, 1, 1, 1, 1,
0.4494506, 0.9887496, 1.02866, 1, 1, 1, 1, 1,
0.4502954, 0.3651667, 0.7673865, 1, 1, 1, 1, 1,
0.4532684, 1.185695, -1.54513, 1, 1, 1, 1, 1,
0.4566999, -1.64943, 3.726092, 1, 1, 1, 1, 1,
0.4585151, -0.5976012, 3.181811, 1, 1, 1, 1, 1,
0.459446, -0.06672977, 2.465583, 1, 1, 1, 1, 1,
0.4597005, -1.116194, 2.264808, 1, 1, 1, 1, 1,
0.4597007, -0.02627718, 1.021209, 1, 1, 1, 1, 1,
0.4635435, 0.0901679, 1.724272, 1, 1, 1, 1, 1,
0.4639332, -0.6023496, 2.409684, 1, 1, 1, 1, 1,
0.4703153, -1.556128, 2.57888, 0, 0, 1, 1, 1,
0.474698, 0.1850141, 2.308822, 1, 0, 0, 1, 1,
0.4771178, 0.1445137, 0.23787, 1, 0, 0, 1, 1,
0.4785074, 0.9811366, 0.4440106, 1, 0, 0, 1, 1,
0.4798834, -1.526082, 1.951101, 1, 0, 0, 1, 1,
0.4863532, 1.582427, 1.714826, 1, 0, 0, 1, 1,
0.4975188, -0.4588, 4.412165, 0, 0, 0, 1, 1,
0.498251, 0.4552423, -0.1735981, 0, 0, 0, 1, 1,
0.4989311, -0.1945368, 2.011708, 0, 0, 0, 1, 1,
0.5003805, -0.4892435, 2.671778, 0, 0, 0, 1, 1,
0.5021516, -1.350425, 3.14244, 0, 0, 0, 1, 1,
0.5023721, 0.9798176, 1.008783, 0, 0, 0, 1, 1,
0.5027565, -0.4606272, 1.064955, 0, 0, 0, 1, 1,
0.5034531, -0.7974632, 0.02460344, 1, 1, 1, 1, 1,
0.5125817, 1.212993, 0.0512566, 1, 1, 1, 1, 1,
0.5126309, 1.437927, -1.482641, 1, 1, 1, 1, 1,
0.5172124, 0.5258002, 1.22356, 1, 1, 1, 1, 1,
0.5222666, 1.62908, 1.314636, 1, 1, 1, 1, 1,
0.5234973, -1.328674, 4.416777, 1, 1, 1, 1, 1,
0.5272543, 0.6808547, 2.083797, 1, 1, 1, 1, 1,
0.5313004, 0.5744787, -0.9930553, 1, 1, 1, 1, 1,
0.5315475, 1.197694, 2.499986, 1, 1, 1, 1, 1,
0.5337807, 0.4710755, 0.1995329, 1, 1, 1, 1, 1,
0.5354097, 0.2457573, 0.9623569, 1, 1, 1, 1, 1,
0.5375699, -0.3834041, 0.64454, 1, 1, 1, 1, 1,
0.537601, 0.1900445, 1.694027, 1, 1, 1, 1, 1,
0.5398535, -1.767193, 2.121898, 1, 1, 1, 1, 1,
0.5416307, 1.628679, 0.1314023, 1, 1, 1, 1, 1,
0.5422147, -0.232982, 3.474348, 0, 0, 1, 1, 1,
0.5438162, 1.937192, -0.9671826, 1, 0, 0, 1, 1,
0.5469904, -0.01686648, 1.067623, 1, 0, 0, 1, 1,
0.5521165, 0.5324001, -0.2811621, 1, 0, 0, 1, 1,
0.5582993, -0.3877349, 3.402977, 1, 0, 0, 1, 1,
0.5595735, 0.9713778, -0.3995579, 1, 0, 0, 1, 1,
0.5606461, 0.6482208, 0.1295218, 0, 0, 0, 1, 1,
0.5618119, 0.4261574, 1.29029, 0, 0, 0, 1, 1,
0.5628027, -1.415602, 2.835642, 0, 0, 0, 1, 1,
0.5659503, -0.03869252, 0.2272137, 0, 0, 0, 1, 1,
0.5689356, 1.12409, 0.08495518, 0, 0, 0, 1, 1,
0.5730999, 1.077969, 0.5049637, 0, 0, 0, 1, 1,
0.5763039, 0.1663201, 1.090331, 0, 0, 0, 1, 1,
0.5782142, -0.3693671, 2.620623, 1, 1, 1, 1, 1,
0.5823437, -0.3950886, 0.7602724, 1, 1, 1, 1, 1,
0.592522, 1.280351, 0.7915474, 1, 1, 1, 1, 1,
0.5939974, 0.2816285, -0.2861481, 1, 1, 1, 1, 1,
0.5958585, 0.1759569, 0.7268617, 1, 1, 1, 1, 1,
0.6018981, -2.853765, 4.095321, 1, 1, 1, 1, 1,
0.602843, 0.07930236, 1.037989, 1, 1, 1, 1, 1,
0.6052207, -0.525125, 3.025599, 1, 1, 1, 1, 1,
0.6057308, -0.1078024, 0.5210258, 1, 1, 1, 1, 1,
0.6090334, 1.064649, 0.715327, 1, 1, 1, 1, 1,
0.6094005, -0.7534572, 3.720472, 1, 1, 1, 1, 1,
0.6113441, 0.8962366, -0.09111785, 1, 1, 1, 1, 1,
0.6164948, 0.6363305, 0.4280085, 1, 1, 1, 1, 1,
0.6167064, -0.7686665, 1.680533, 1, 1, 1, 1, 1,
0.620238, 0.4943815, 1.217853, 1, 1, 1, 1, 1,
0.6215482, -1.182375, 3.459584, 0, 0, 1, 1, 1,
0.6310217, 0.05605027, -0.2238324, 1, 0, 0, 1, 1,
0.6339892, -0.9992936, 1.358184, 1, 0, 0, 1, 1,
0.6373215, -0.9840909, 3.079801, 1, 0, 0, 1, 1,
0.6376235, -1.117851, 3.434844, 1, 0, 0, 1, 1,
0.640891, 0.09188579, 1.541941, 1, 0, 0, 1, 1,
0.6426423, 0.04000456, 2.063267, 0, 0, 0, 1, 1,
0.6435793, -0.672574, 1.218325, 0, 0, 0, 1, 1,
0.6471773, 0.6988423, 0.8354211, 0, 0, 0, 1, 1,
0.6499687, -0.3271202, -0.1847299, 0, 0, 0, 1, 1,
0.6554772, 0.470799, 3.401564, 0, 0, 0, 1, 1,
0.6566367, 1.342586, -0.9606494, 0, 0, 0, 1, 1,
0.6570342, 0.6575012, 0.7985429, 0, 0, 0, 1, 1,
0.6598107, 0.4972063, 0.9659625, 1, 1, 1, 1, 1,
0.6614506, -0.5730022, 0.7234127, 1, 1, 1, 1, 1,
0.669292, 0.502916, 1.13755, 1, 1, 1, 1, 1,
0.6748788, -0.9088269, 2.576763, 1, 1, 1, 1, 1,
0.6798472, 0.6996325, 1.326603, 1, 1, 1, 1, 1,
0.6867117, 0.7655976, -0.1532708, 1, 1, 1, 1, 1,
0.6924389, -0.6975465, 3.24335, 1, 1, 1, 1, 1,
0.693688, 0.977497, -0.3154431, 1, 1, 1, 1, 1,
0.7032991, -0.7517493, 2.049778, 1, 1, 1, 1, 1,
0.7092906, -1.081847, 2.304345, 1, 1, 1, 1, 1,
0.7181042, -0.5327718, 2.720572, 1, 1, 1, 1, 1,
0.7182208, 0.6002556, -0.2298462, 1, 1, 1, 1, 1,
0.722205, 1.222088, -0.3149928, 1, 1, 1, 1, 1,
0.7222368, -1.388218, 2.265436, 1, 1, 1, 1, 1,
0.7232606, 1.339029, 1.349842, 1, 1, 1, 1, 1,
0.7254175, -1.214763, 3.870671, 0, 0, 1, 1, 1,
0.7332092, 0.1213522, 2.62346, 1, 0, 0, 1, 1,
0.7384531, -0.7650295, 3.149709, 1, 0, 0, 1, 1,
0.7411305, -1.43567, 2.138107, 1, 0, 0, 1, 1,
0.7460337, 0.4182648, -0.05679331, 1, 0, 0, 1, 1,
0.7477668, -0.4364779, 1.016188, 1, 0, 0, 1, 1,
0.7481765, 0.1781066, 1.102377, 0, 0, 0, 1, 1,
0.751287, 0.8012645, -0.3765244, 0, 0, 0, 1, 1,
0.7539242, -0.9751991, 1.65748, 0, 0, 0, 1, 1,
0.7577302, -0.7056208, 1.261333, 0, 0, 0, 1, 1,
0.7662752, -0.9594783, 2.675504, 0, 0, 0, 1, 1,
0.7689005, 0.4909185, 0.2679822, 0, 0, 0, 1, 1,
0.772845, -0.5362537, 2.265079, 0, 0, 0, 1, 1,
0.7810845, 0.3996372, 1.747378, 1, 1, 1, 1, 1,
0.7857715, -1.087443, 3.611853, 1, 1, 1, 1, 1,
0.786292, 0.09224676, 0.225698, 1, 1, 1, 1, 1,
0.7980267, -0.8310367, 1.611579, 1, 1, 1, 1, 1,
0.8056438, -1.707083, 3.360871, 1, 1, 1, 1, 1,
0.8073857, -0.6131038, 1.315889, 1, 1, 1, 1, 1,
0.8104331, 1.245741, -0.7477265, 1, 1, 1, 1, 1,
0.811215, -1.37062, 2.244456, 1, 1, 1, 1, 1,
0.8147901, 1.383238, 1.091364, 1, 1, 1, 1, 1,
0.8158889, -0.5010256, -0.4102623, 1, 1, 1, 1, 1,
0.8178932, 0.5044098, 1.186425, 1, 1, 1, 1, 1,
0.826888, -0.8332617, 4.332723, 1, 1, 1, 1, 1,
0.826986, 0.2193729, 1.255736, 1, 1, 1, 1, 1,
0.8289913, 0.1165018, 1.409741, 1, 1, 1, 1, 1,
0.8331722, -1.071204, 2.380362, 1, 1, 1, 1, 1,
0.8361824, 0.465914, 0.122472, 0, 0, 1, 1, 1,
0.836476, -0.744142, 2.634767, 1, 0, 0, 1, 1,
0.8389326, -0.07386513, 1.668529, 1, 0, 0, 1, 1,
0.8394215, -0.4856709, 2.830079, 1, 0, 0, 1, 1,
0.8408297, 1.130638, 0.1788655, 1, 0, 0, 1, 1,
0.8446099, 0.6443346, 1.07464, 1, 0, 0, 1, 1,
0.8466429, -0.302303, 2.39726, 0, 0, 0, 1, 1,
0.8493572, 0.1733124, 0.9078496, 0, 0, 0, 1, 1,
0.8515493, -0.4612238, 1.194492, 0, 0, 0, 1, 1,
0.8527669, -0.8225681, 1.483991, 0, 0, 0, 1, 1,
0.8530688, -2.46766, 3.653404, 0, 0, 0, 1, 1,
0.8565483, -0.2227679, 1.332082, 0, 0, 0, 1, 1,
0.8575025, -0.8838384, 3.481757, 0, 0, 0, 1, 1,
0.8587267, -0.08693419, 2.914389, 1, 1, 1, 1, 1,
0.8592823, 0.7459713, 1.972805, 1, 1, 1, 1, 1,
0.8650023, 1.605601, 0.5101286, 1, 1, 1, 1, 1,
0.865374, 0.8322432, 0.6055465, 1, 1, 1, 1, 1,
0.8662078, -0.3759124, 3.428586, 1, 1, 1, 1, 1,
0.8667696, -1.377653, 2.503015, 1, 1, 1, 1, 1,
0.8710425, -1.762482, 4.872847, 1, 1, 1, 1, 1,
0.8716825, 1.350132, 0.9127049, 1, 1, 1, 1, 1,
0.8719802, 0.6693144, 1.455099, 1, 1, 1, 1, 1,
0.8781875, 1.910759, 1.171759, 1, 1, 1, 1, 1,
0.8783255, 0.7426262, 1.497584, 1, 1, 1, 1, 1,
0.8807714, -0.5837125, 1.891084, 1, 1, 1, 1, 1,
0.8884218, 1.999151, -1.172401, 1, 1, 1, 1, 1,
0.891232, -0.8854599, 4.477154, 1, 1, 1, 1, 1,
0.8941661, 0.661751, 0.1813331, 1, 1, 1, 1, 1,
0.8950753, 0.4929417, 3.467964, 0, 0, 1, 1, 1,
0.8953878, -1.25251, 2.644376, 1, 0, 0, 1, 1,
0.895602, 0.6224937, 2.317986, 1, 0, 0, 1, 1,
0.8965361, -1.475853, 3.597045, 1, 0, 0, 1, 1,
0.8966369, 0.1550906, 2.371516, 1, 0, 0, 1, 1,
0.9014197, -1.340713, 3.621346, 1, 0, 0, 1, 1,
0.9017166, 0.4228953, 1.870893, 0, 0, 0, 1, 1,
0.9060201, -0.7004687, 1.824238, 0, 0, 0, 1, 1,
0.9148292, -0.152427, 2.068197, 0, 0, 0, 1, 1,
0.9201643, 0.03751571, 0.7264364, 0, 0, 0, 1, 1,
0.9248317, -0.4296521, 2.72921, 0, 0, 0, 1, 1,
0.9279713, -0.09955604, 2.929574, 0, 0, 0, 1, 1,
0.9303093, 0.7304856, 0.5784917, 0, 0, 0, 1, 1,
0.9317034, 0.1341176, 2.242515, 1, 1, 1, 1, 1,
0.9352898, -1.104638, 3.659066, 1, 1, 1, 1, 1,
0.9366221, 0.4118387, 0.5894377, 1, 1, 1, 1, 1,
0.9391371, 0.1158082, 1.6189, 1, 1, 1, 1, 1,
0.9460178, 1.150977, -0.8365198, 1, 1, 1, 1, 1,
0.9480655, -0.1670538, 2.289766, 1, 1, 1, 1, 1,
0.9482551, -0.03094511, 0.6065866, 1, 1, 1, 1, 1,
0.9576457, -1.916125, 3.727408, 1, 1, 1, 1, 1,
0.9666229, 0.9688731, 2.095022, 1, 1, 1, 1, 1,
0.9683784, -0.7924772, 2.680986, 1, 1, 1, 1, 1,
0.9708286, -0.359651, 0.3722039, 1, 1, 1, 1, 1,
0.9761518, -0.3386092, 1.51148, 1, 1, 1, 1, 1,
0.9795916, -1.324917, 2.073976, 1, 1, 1, 1, 1,
0.9832112, 0.03736159, -0.7786181, 1, 1, 1, 1, 1,
0.9836907, 0.4751242, 0.876144, 1, 1, 1, 1, 1,
0.9887773, 0.6662086, 0.04136645, 0, 0, 1, 1, 1,
1.005372, 0.3105367, 1.868087, 1, 0, 0, 1, 1,
1.007296, 2.38994, -1.183976, 1, 0, 0, 1, 1,
1.013165, -1.170123, 1.976877, 1, 0, 0, 1, 1,
1.019078, 1.911536, 0.1261966, 1, 0, 0, 1, 1,
1.020027, -0.7033772, 1.852742, 1, 0, 0, 1, 1,
1.021905, -2.134748, 3.669261, 0, 0, 0, 1, 1,
1.026723, -0.7443783, 2.415432, 0, 0, 0, 1, 1,
1.031756, 0.1006883, -0.5733365, 0, 0, 0, 1, 1,
1.036436, 0.5474077, 0.3565716, 0, 0, 0, 1, 1,
1.036564, -2.238265, 3.018946, 0, 0, 0, 1, 1,
1.036633, 0.5512205, 0.9906555, 0, 0, 0, 1, 1,
1.03686, 0.8031948, 2.428557, 0, 0, 0, 1, 1,
1.040032, 0.9545392, 0.6610001, 1, 1, 1, 1, 1,
1.044099, 1.436372, 0.39032, 1, 1, 1, 1, 1,
1.044118, -1.234505, 1.788181, 1, 1, 1, 1, 1,
1.046904, 0.3954387, 1.576256, 1, 1, 1, 1, 1,
1.047447, 0.0689199, 0.9367527, 1, 1, 1, 1, 1,
1.048088, 0.298805, -0.6306279, 1, 1, 1, 1, 1,
1.062263, 0.1119732, 1.602797, 1, 1, 1, 1, 1,
1.067536, 0.9785982, 1.522343, 1, 1, 1, 1, 1,
1.071155, -1.875225, 3.689162, 1, 1, 1, 1, 1,
1.071242, 0.2387304, 1.042375, 1, 1, 1, 1, 1,
1.073102, 0.1266022, 2.638882, 1, 1, 1, 1, 1,
1.074979, -0.927617, 3.519486, 1, 1, 1, 1, 1,
1.076645, 0.1967158, 2.12601, 1, 1, 1, 1, 1,
1.080512, 0.1502411, 1.093077, 1, 1, 1, 1, 1,
1.081886, 0.09991033, -0.4479396, 1, 1, 1, 1, 1,
1.092346, 0.6933732, -0.1631816, 0, 0, 1, 1, 1,
1.101641, -0.9395686, 0.8146396, 1, 0, 0, 1, 1,
1.10359, -0.3264246, 0.5233983, 1, 0, 0, 1, 1,
1.111923, 2.403417, 0.6372293, 1, 0, 0, 1, 1,
1.113065, 1.006888, -0.4545513, 1, 0, 0, 1, 1,
1.121328, 1.316743, 2.615032, 1, 0, 0, 1, 1,
1.126061, -0.3185098, 3.731819, 0, 0, 0, 1, 1,
1.127155, 0.2750907, 1.16539, 0, 0, 0, 1, 1,
1.129482, -0.3409631, 1.346235, 0, 0, 0, 1, 1,
1.130259, 0.1073834, 0.4672141, 0, 0, 0, 1, 1,
1.13296, -1.081087, 0.9334754, 0, 0, 0, 1, 1,
1.134381, 0.1894051, 1.507327, 0, 0, 0, 1, 1,
1.135798, 0.3941878, 0.9955321, 0, 0, 0, 1, 1,
1.141176, 1.813834, 0.8455952, 1, 1, 1, 1, 1,
1.142569, -1.546058, 2.062249, 1, 1, 1, 1, 1,
1.154325, -0.5975581, 1.929558, 1, 1, 1, 1, 1,
1.154809, -0.595004, 2.549721, 1, 1, 1, 1, 1,
1.158207, -0.3011367, 2.255977, 1, 1, 1, 1, 1,
1.158592, -1.65851, 2.526045, 1, 1, 1, 1, 1,
1.160241, -1.293429, 1.646275, 1, 1, 1, 1, 1,
1.161764, -0.8684613, 1.737298, 1, 1, 1, 1, 1,
1.162031, -0.5608051, 2.198926, 1, 1, 1, 1, 1,
1.166256, 0.2336256, 1.523214, 1, 1, 1, 1, 1,
1.17057, -0.09889799, 1.770732, 1, 1, 1, 1, 1,
1.186031, 0.1068836, 0.2506152, 1, 1, 1, 1, 1,
1.195955, -1.375399, 2.789284, 1, 1, 1, 1, 1,
1.198802, 0.6348019, 1.386436, 1, 1, 1, 1, 1,
1.199701, -0.2416658, 0.8783945, 1, 1, 1, 1, 1,
1.201009, 0.3696191, 2.506334, 0, 0, 1, 1, 1,
1.2016, 1.390419, 1.662492, 1, 0, 0, 1, 1,
1.203536, -0.1613767, 0.7123348, 1, 0, 0, 1, 1,
1.208649, -0.05263685, 1.691943, 1, 0, 0, 1, 1,
1.208949, 1.15205, -0.4264404, 1, 0, 0, 1, 1,
1.209229, -0.2158933, 1.479291, 1, 0, 0, 1, 1,
1.218175, 1.665316, 0.8716236, 0, 0, 0, 1, 1,
1.223512, -0.530463, 1.358495, 0, 0, 0, 1, 1,
1.224964, 1.030577, 1.447824, 0, 0, 0, 1, 1,
1.226542, -1.286895, 2.797225, 0, 0, 0, 1, 1,
1.229188, -0.2019121, 3.017651, 0, 0, 0, 1, 1,
1.232777, -0.3358896, 1.781978, 0, 0, 0, 1, 1,
1.233308, -0.3825637, 2.0604, 0, 0, 0, 1, 1,
1.240515, -0.1727593, 2.347486, 1, 1, 1, 1, 1,
1.240892, 0.329485, 1.142178, 1, 1, 1, 1, 1,
1.256221, -0.1221451, 0.326089, 1, 1, 1, 1, 1,
1.259472, 1.056914, 1.468697, 1, 1, 1, 1, 1,
1.263481, 0.1384029, 1.547262, 1, 1, 1, 1, 1,
1.266915, 0.1701261, 1.282876, 1, 1, 1, 1, 1,
1.277874, 0.2068187, 0.2680816, 1, 1, 1, 1, 1,
1.277973, 0.569638, -0.4677588, 1, 1, 1, 1, 1,
1.294242, 0.7379372, -0.5016569, 1, 1, 1, 1, 1,
1.300843, -0.6200516, 2.624157, 1, 1, 1, 1, 1,
1.304936, 0.4548138, 1.65376, 1, 1, 1, 1, 1,
1.308603, -1.098892, 1.912063, 1, 1, 1, 1, 1,
1.308918, 0.6860004, 0.06009802, 1, 1, 1, 1, 1,
1.310674, 1.603177, 0.3850868, 1, 1, 1, 1, 1,
1.31758, -1.089837, 1.003457, 1, 1, 1, 1, 1,
1.318468, -1.188589, 1.488528, 0, 0, 1, 1, 1,
1.321513, -0.2009177, 2.109845, 1, 0, 0, 1, 1,
1.325175, 0.3737468, 1.313706, 1, 0, 0, 1, 1,
1.338593, 0.4096412, 1.420844, 1, 0, 0, 1, 1,
1.347435, -0.1842508, 1.354833, 1, 0, 0, 1, 1,
1.348682, 0.3055635, 0.3781096, 1, 0, 0, 1, 1,
1.350316, -1.384613, 1.628392, 0, 0, 0, 1, 1,
1.350652, -1.579483, 3.877752, 0, 0, 0, 1, 1,
1.358018, -0.1716697, 2.396047, 0, 0, 0, 1, 1,
1.361944, 0.1317728, 2.861325, 0, 0, 0, 1, 1,
1.362285, 1.918025, -0.03148911, 0, 0, 0, 1, 1,
1.367107, -1.19408, 4.362411, 0, 0, 0, 1, 1,
1.40327, 0.4377384, -0.08278173, 0, 0, 0, 1, 1,
1.406345, -1.714549, 1.905879, 1, 1, 1, 1, 1,
1.409988, -1.056997, 4.182463, 1, 1, 1, 1, 1,
1.417169, 0.2829748, 0.7460328, 1, 1, 1, 1, 1,
1.417385, -0.3986276, 0.8601682, 1, 1, 1, 1, 1,
1.425777, -0.2587671, 2.374009, 1, 1, 1, 1, 1,
1.426038, -2.133352, 3.512605, 1, 1, 1, 1, 1,
1.432404, 0.9435667, -0.1236108, 1, 1, 1, 1, 1,
1.441161, -0.6883224, 1.984044, 1, 1, 1, 1, 1,
1.444026, 0.1979069, 1.575358, 1, 1, 1, 1, 1,
1.44432, -0.4556448, 0.7752919, 1, 1, 1, 1, 1,
1.449284, -0.6245893, 1.158054, 1, 1, 1, 1, 1,
1.449521, -0.7444118, 2.949445, 1, 1, 1, 1, 1,
1.453002, -1.299058, 1.311868, 1, 1, 1, 1, 1,
1.457834, 0.6029745, 1.081642, 1, 1, 1, 1, 1,
1.459908, 0.5589256, 0.9773248, 1, 1, 1, 1, 1,
1.501222, -0.4585876, 0.02985115, 0, 0, 1, 1, 1,
1.502267, 2.593826, 1.41155, 1, 0, 0, 1, 1,
1.526213, 2.050256, -1.064138, 1, 0, 0, 1, 1,
1.549363, 1.280829, 0.9574558, 1, 0, 0, 1, 1,
1.556996, -1.17153, 2.324911, 1, 0, 0, 1, 1,
1.568471, -0.8864127, 3.439403, 1, 0, 0, 1, 1,
1.56955, -1.439202, 3.707205, 0, 0, 0, 1, 1,
1.584625, 0.1254341, 2.183172, 0, 0, 0, 1, 1,
1.586043, 0.6652684, 1.849522, 0, 0, 0, 1, 1,
1.590054, -1.311492, 2.220088, 0, 0, 0, 1, 1,
1.60427, 1.006176, -0.5598615, 0, 0, 0, 1, 1,
1.606005, -1.187527, 1.333421, 0, 0, 0, 1, 1,
1.61879, 0.2591365, 0.3818892, 0, 0, 0, 1, 1,
1.632433, 1.1507, 0.5068543, 1, 1, 1, 1, 1,
1.638931, -0.7400721, 2.255896, 1, 1, 1, 1, 1,
1.645568, 0.2040578, 2.120846, 1, 1, 1, 1, 1,
1.676774, -1.250555, 2.211288, 1, 1, 1, 1, 1,
1.681977, -0.07783766, -0.2710439, 1, 1, 1, 1, 1,
1.693609, 0.7929297, 0.6561098, 1, 1, 1, 1, 1,
1.697181, 0.8809317, 1.818317, 1, 1, 1, 1, 1,
1.701334, 1.2141, 0.2794417, 1, 1, 1, 1, 1,
1.732246, -0.6651855, 1.501226, 1, 1, 1, 1, 1,
1.747711, 0.1460488, 2.51399, 1, 1, 1, 1, 1,
1.752154, 1.188729, 1.027381, 1, 1, 1, 1, 1,
1.765472, 0.4324501, 0.4283704, 1, 1, 1, 1, 1,
1.770341, 0.03036401, 0.8023379, 1, 1, 1, 1, 1,
1.776724, -0.4808036, 2.366904, 1, 1, 1, 1, 1,
1.802066, -0.458877, -0.7336032, 1, 1, 1, 1, 1,
1.809901, 0.09721912, 3.696785, 0, 0, 1, 1, 1,
1.810863, -0.4583492, 2.037766, 1, 0, 0, 1, 1,
1.829627, 0.5071316, 1.84447, 1, 0, 0, 1, 1,
1.840533, 1.173627, 1.21128, 1, 0, 0, 1, 1,
1.85257, 0.4496301, 3.335647, 1, 0, 0, 1, 1,
1.865279, -0.4542724, 1.290066, 1, 0, 0, 1, 1,
1.896534, 1.887548, 0.1843762, 0, 0, 0, 1, 1,
1.898584, 0.2507314, 2.304481, 0, 0, 0, 1, 1,
1.904003, -1.636687, 2.31241, 0, 0, 0, 1, 1,
1.911794, 1.535198, -1.628584, 0, 0, 0, 1, 1,
1.933648, 0.01958591, 2.225094, 0, 0, 0, 1, 1,
1.93501, 0.1490337, 1.53363, 0, 0, 0, 1, 1,
1.949455, -0.2432723, 1.272276, 0, 0, 0, 1, 1,
1.960458, 0.1710555, 1.728527, 1, 1, 1, 1, 1,
1.969492, 0.0521865, 1.728235, 1, 1, 1, 1, 1,
1.980371, 0.9182814, 0.4016387, 1, 1, 1, 1, 1,
1.9829, 1.787166, 2.012316, 1, 1, 1, 1, 1,
1.993405, 0.08593299, 2.05228, 1, 1, 1, 1, 1,
1.999902, -1.219021, 1.95456, 1, 1, 1, 1, 1,
2.004282, -0.6494076, 3.407511, 1, 1, 1, 1, 1,
2.01302, -0.548481, 1.503135, 1, 1, 1, 1, 1,
2.068604, 0.5886571, 0.4538002, 1, 1, 1, 1, 1,
2.088857, 0.06271446, 2.3583, 1, 1, 1, 1, 1,
2.089055, 0.4720348, 0.529317, 1, 1, 1, 1, 1,
2.090895, -2.134805, 1.151933, 1, 1, 1, 1, 1,
2.114352, -1.175388, 2.823722, 1, 1, 1, 1, 1,
2.141468, -0.6148855, 0.2792209, 1, 1, 1, 1, 1,
2.168779, 0.490256, 2.021256, 1, 1, 1, 1, 1,
2.193812, 0.265747, 0.3494388, 0, 0, 1, 1, 1,
2.211342, -0.2522824, -0.1046346, 1, 0, 0, 1, 1,
2.231571, -0.5803421, -0.2228153, 1, 0, 0, 1, 1,
2.258737, -1.03948, 3.114672, 1, 0, 0, 1, 1,
2.280161, -0.3360751, 1.924751, 1, 0, 0, 1, 1,
2.308187, 0.2138148, 2.326646, 1, 0, 0, 1, 1,
2.37873, 1.080453, 1.943925, 0, 0, 0, 1, 1,
2.38439, 0.4161817, 2.104907, 0, 0, 0, 1, 1,
2.457266, 1.012854, 1.99547, 0, 0, 0, 1, 1,
2.470804, 0.4901783, 0.4031085, 0, 0, 0, 1, 1,
2.486781, 1.442723, 1.216137, 0, 0, 0, 1, 1,
2.520942, -0.7195668, 1.037203, 0, 0, 0, 1, 1,
2.570623, -2.330091, 1.399581, 0, 0, 0, 1, 1,
2.608944, -1.520603, 2.071259, 1, 1, 1, 1, 1,
2.637453, 0.1196423, 1.344578, 1, 1, 1, 1, 1,
2.669971, -1.844057, 2.843754, 1, 1, 1, 1, 1,
2.701843, -1.175361, 2.192316, 1, 1, 1, 1, 1,
2.715022, -0.01316887, 1.809274, 1, 1, 1, 1, 1,
2.992961, 0.1539006, 0.9585947, 1, 1, 1, 1, 1,
3.321544, 0.1534641, 0.9652504, 1, 1, 1, 1, 1
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
var radius = 9.676447;
var distance = 33.98811;
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
mvMatrix.translate( 0.002965927, -0.2894223, -0.4703617 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98811);
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
