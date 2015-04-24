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
-3.220388, -0.5459492, -2.572989, 1, 0, 0, 1,
-3.216825, 0.3803781, -0.6523763, 1, 0.007843138, 0, 1,
-3.137269, -0.4612072, -1.741419, 1, 0.01176471, 0, 1,
-3.034328, -0.1162787, -1.391304, 1, 0.01960784, 0, 1,
-3.030957, 0.5705512, -0.42118, 1, 0.02352941, 0, 1,
-2.972923, 0.09399715, -1.049728, 1, 0.03137255, 0, 1,
-2.798593, -1.425008, -2.389293, 1, 0.03529412, 0, 1,
-2.786227, 0.04421492, 0.9344983, 1, 0.04313726, 0, 1,
-2.64858, -1.037838, -2.170073, 1, 0.04705882, 0, 1,
-2.627316, 0.01953101, -1.795322, 1, 0.05490196, 0, 1,
-2.624262, 1.416131, -0.925166, 1, 0.05882353, 0, 1,
-2.437106, -2.420016, -1.358488, 1, 0.06666667, 0, 1,
-2.349827, -1.288634, -1.978375, 1, 0.07058824, 0, 1,
-2.30442, 0.8658653, -2.086085, 1, 0.07843138, 0, 1,
-2.253657, -1.136608, -2.288281, 1, 0.08235294, 0, 1,
-2.196406, -0.6624084, -1.66773, 1, 0.09019608, 0, 1,
-2.185671, 1.13192, -1.788536, 1, 0.09411765, 0, 1,
-2.159277, -1.836293, -1.946206, 1, 0.1019608, 0, 1,
-2.152428, -0.03489147, -1.226017, 1, 0.1098039, 0, 1,
-2.152352, -0.2437061, -1.806204, 1, 0.1137255, 0, 1,
-2.131818, -0.5533113, -0.1579518, 1, 0.1215686, 0, 1,
-2.051022, 0.6080303, -1.384739, 1, 0.1254902, 0, 1,
-2.044936, 0.1833525, 0.01498067, 1, 0.1333333, 0, 1,
-2.009418, 1.398353, 0.3664183, 1, 0.1372549, 0, 1,
-1.968758, 0.4065307, -2.439, 1, 0.145098, 0, 1,
-1.964523, 1.06549, -1.92487, 1, 0.1490196, 0, 1,
-1.960501, -0.2650691, -2.474653, 1, 0.1568628, 0, 1,
-1.959163, 0.3693936, -1.888619, 1, 0.1607843, 0, 1,
-1.950639, 0.6751165, -0.9069989, 1, 0.1686275, 0, 1,
-1.937947, 0.2514339, -0.6754094, 1, 0.172549, 0, 1,
-1.936449, -1.392104, -2.887047, 1, 0.1803922, 0, 1,
-1.917712, 0.2823377, -1.759533, 1, 0.1843137, 0, 1,
-1.856663, -0.007395655, -1.956746, 1, 0.1921569, 0, 1,
-1.856034, -0.01991582, -1.642375, 1, 0.1960784, 0, 1,
-1.781587, -1.033723, -1.512084, 1, 0.2039216, 0, 1,
-1.781164, 1.511526, -1.019048, 1, 0.2117647, 0, 1,
-1.77986, -1.64506, -3.273936, 1, 0.2156863, 0, 1,
-1.778094, 0.07377493, -2.211545, 1, 0.2235294, 0, 1,
-1.772964, 0.6348435, -1.042509, 1, 0.227451, 0, 1,
-1.756187, 0.6928231, -4.066609, 1, 0.2352941, 0, 1,
-1.74539, -0.5761382, -2.957056, 1, 0.2392157, 0, 1,
-1.745129, 2.43435, -0.4653116, 1, 0.2470588, 0, 1,
-1.716924, 0.9631128, -1.985038, 1, 0.2509804, 0, 1,
-1.696017, 0.9248744, -1.20822, 1, 0.2588235, 0, 1,
-1.690981, 1.678585, -2.80239, 1, 0.2627451, 0, 1,
-1.675271, 0.3632728, -0.9798513, 1, 0.2705882, 0, 1,
-1.664973, -0.2399232, -1.497407, 1, 0.2745098, 0, 1,
-1.626673, -0.6130208, -2.350836, 1, 0.282353, 0, 1,
-1.626614, -0.2770251, -0.8618084, 1, 0.2862745, 0, 1,
-1.623618, 0.575507, -0.5523846, 1, 0.2941177, 0, 1,
-1.617582, -0.1239161, -3.046318, 1, 0.3019608, 0, 1,
-1.608896, -0.01943398, -1.380029, 1, 0.3058824, 0, 1,
-1.605349, -0.2428143, -2.268981, 1, 0.3137255, 0, 1,
-1.591553, -0.2296309, -0.9944412, 1, 0.3176471, 0, 1,
-1.590957, 0.08887008, 0.6830361, 1, 0.3254902, 0, 1,
-1.579297, -0.4877202, -0.9785619, 1, 0.3294118, 0, 1,
-1.560878, -0.7793783, -1.090636, 1, 0.3372549, 0, 1,
-1.55888, -0.0638276, -0.9097475, 1, 0.3411765, 0, 1,
-1.557204, -0.2706233, -0.7085502, 1, 0.3490196, 0, 1,
-1.551191, -0.3032885, -0.6774555, 1, 0.3529412, 0, 1,
-1.550799, 0.7354082, -1.333518, 1, 0.3607843, 0, 1,
-1.549403, 0.4731793, -1.253382, 1, 0.3647059, 0, 1,
-1.536659, -1.113716, -3.587205, 1, 0.372549, 0, 1,
-1.533694, -0.1956023, -0.4668682, 1, 0.3764706, 0, 1,
-1.510747, 0.6271249, -1.941643, 1, 0.3843137, 0, 1,
-1.508247, 1.910381, 0.05859584, 1, 0.3882353, 0, 1,
-1.495199, -0.6411943, 0.444391, 1, 0.3960784, 0, 1,
-1.493672, 0.3592987, -0.9490703, 1, 0.4039216, 0, 1,
-1.487459, -0.3078995, -2.568117, 1, 0.4078431, 0, 1,
-1.487343, 0.4824632, -1.432193, 1, 0.4156863, 0, 1,
-1.471849, 0.2599707, -2.821515, 1, 0.4196078, 0, 1,
-1.467383, 0.4639334, -1.806911, 1, 0.427451, 0, 1,
-1.458212, -1.838372, -2.303951, 1, 0.4313726, 0, 1,
-1.449255, 0.2259458, -4.169694, 1, 0.4392157, 0, 1,
-1.444584, 1.431674, 0.4019516, 1, 0.4431373, 0, 1,
-1.441225, 0.346358, -1.57786, 1, 0.4509804, 0, 1,
-1.432472, 0.3516157, -2.020406, 1, 0.454902, 0, 1,
-1.421271, -0.2044076, -3.188354, 1, 0.4627451, 0, 1,
-1.41832, -0.04323153, -3.226069, 1, 0.4666667, 0, 1,
-1.417538, 1.957136, -1.921373, 1, 0.4745098, 0, 1,
-1.416958, -0.7453859, -2.895408, 1, 0.4784314, 0, 1,
-1.410226, -0.3488928, -0.415993, 1, 0.4862745, 0, 1,
-1.408409, 1.468404, -0.7918584, 1, 0.4901961, 0, 1,
-1.403934, -0.9089094, -2.76354, 1, 0.4980392, 0, 1,
-1.394068, -1.365534, -2.020307, 1, 0.5058824, 0, 1,
-1.38285, -0.4758581, -2.920446, 1, 0.509804, 0, 1,
-1.372725, 1.061573, -2.17682, 1, 0.5176471, 0, 1,
-1.370358, -0.7770678, -1.619856, 1, 0.5215687, 0, 1,
-1.36281, 0.5655506, -3.274475, 1, 0.5294118, 0, 1,
-1.36054, -0.1602593, -1.334054, 1, 0.5333334, 0, 1,
-1.353629, -0.7379629, -2.150623, 1, 0.5411765, 0, 1,
-1.346972, -1.434562, -0.9278338, 1, 0.5450981, 0, 1,
-1.343119, 1.587197, -0.1335226, 1, 0.5529412, 0, 1,
-1.342338, 0.2704788, -0.8647671, 1, 0.5568628, 0, 1,
-1.341694, -0.3534413, -3.387631, 1, 0.5647059, 0, 1,
-1.325739, -0.6658365, -1.553165, 1, 0.5686275, 0, 1,
-1.317459, 1.629526, -1.213549, 1, 0.5764706, 0, 1,
-1.312393, -0.7026611, 0.03265318, 1, 0.5803922, 0, 1,
-1.311454, 0.6652008, 0.5346025, 1, 0.5882353, 0, 1,
-1.310381, 1.193448, -1.092441, 1, 0.5921569, 0, 1,
-1.289554, 0.8630041, -1.089414, 1, 0.6, 0, 1,
-1.281399, -0.3809068, -1.716628, 1, 0.6078432, 0, 1,
-1.281376, -1.020999, -1.928427, 1, 0.6117647, 0, 1,
-1.279699, 1.275465, -0.7151159, 1, 0.6196079, 0, 1,
-1.27941, 0.1722497, -1.888236, 1, 0.6235294, 0, 1,
-1.270455, -0.8875093, -2.556191, 1, 0.6313726, 0, 1,
-1.265996, -0.1094553, -1.675085, 1, 0.6352941, 0, 1,
-1.262602, 0.1920767, -0.6941413, 1, 0.6431373, 0, 1,
-1.24856, 1.050538, -2.69639, 1, 0.6470588, 0, 1,
-1.234687, 1.129003, 2.054014, 1, 0.654902, 0, 1,
-1.23441, -0.3618349, -2.708227, 1, 0.6588235, 0, 1,
-1.229658, 3.119246, 0.782086, 1, 0.6666667, 0, 1,
-1.22852, 0.5574768, -0.3371465, 1, 0.6705883, 0, 1,
-1.223347, 0.4581997, -3.844023, 1, 0.6784314, 0, 1,
-1.222177, -0.3884322, -1.961683, 1, 0.682353, 0, 1,
-1.216902, -0.6868361, -1.836856, 1, 0.6901961, 0, 1,
-1.212555, 1.031796, -0.3960896, 1, 0.6941177, 0, 1,
-1.209107, 0.7540784, -1.780256, 1, 0.7019608, 0, 1,
-1.201255, 0.0681604, -2.701947, 1, 0.7098039, 0, 1,
-1.196581, -1.813431, -3.994102, 1, 0.7137255, 0, 1,
-1.194691, -0.3457088, -0.6810175, 1, 0.7215686, 0, 1,
-1.191069, -0.2885393, -2.926266, 1, 0.7254902, 0, 1,
-1.185348, 0.1835468, -3.499868, 1, 0.7333333, 0, 1,
-1.173746, 0.85644, -2.163123, 1, 0.7372549, 0, 1,
-1.164813, 1.388647, -0.9331804, 1, 0.7450981, 0, 1,
-1.148504, -0.8272845, 0.6328309, 1, 0.7490196, 0, 1,
-1.145948, 1.282362, -1.597234, 1, 0.7568628, 0, 1,
-1.141899, -1.069186, -3.831173, 1, 0.7607843, 0, 1,
-1.139137, 0.3643041, -0.8981363, 1, 0.7686275, 0, 1,
-1.135192, 0.3150763, -2.373879, 1, 0.772549, 0, 1,
-1.130952, 0.929867, 0.9222299, 1, 0.7803922, 0, 1,
-1.13064, 0.2211252, -4.784264, 1, 0.7843137, 0, 1,
-1.112556, -1.364303, -2.381783, 1, 0.7921569, 0, 1,
-1.106266, 0.04459804, -2.387041, 1, 0.7960784, 0, 1,
-1.102885, -0.9642465, -0.8158856, 1, 0.8039216, 0, 1,
-1.101273, -0.4457229, -0.6266721, 1, 0.8117647, 0, 1,
-1.094911, -0.09432333, -3.017999, 1, 0.8156863, 0, 1,
-1.093398, 0.2286941, -3.002945, 1, 0.8235294, 0, 1,
-1.093217, 0.7935195, -0.4145914, 1, 0.827451, 0, 1,
-1.088526, 0.1187776, 0.8261907, 1, 0.8352941, 0, 1,
-1.078434, -1.368997, -3.171037, 1, 0.8392157, 0, 1,
-1.069314, 0.8936163, -1.929619, 1, 0.8470588, 0, 1,
-1.067021, 0.8544974, -1.983889, 1, 0.8509804, 0, 1,
-1.066507, -0.5612223, -0.8433878, 1, 0.8588235, 0, 1,
-1.063769, 0.2321932, -2.550997, 1, 0.8627451, 0, 1,
-1.058124, 0.2719847, -1.349192, 1, 0.8705882, 0, 1,
-1.057824, 1.414285, -0.7752592, 1, 0.8745098, 0, 1,
-1.054314, 0.397583, -2.456487, 1, 0.8823529, 0, 1,
-1.053733, 0.3956293, -2.810477, 1, 0.8862745, 0, 1,
-1.051528, -0.8307815, -1.612146, 1, 0.8941177, 0, 1,
-1.048807, -0.7101671, -2.205746, 1, 0.8980392, 0, 1,
-1.046255, -0.6079543, -3.775003, 1, 0.9058824, 0, 1,
-1.040995, 0.01977691, -0.2036381, 1, 0.9137255, 0, 1,
-1.038169, 0.1697504, -2.443056, 1, 0.9176471, 0, 1,
-1.035332, -2.062973, -4.147872, 1, 0.9254902, 0, 1,
-1.031796, -0.1118249, -0.9248727, 1, 0.9294118, 0, 1,
-1.03032, -0.7507349, -1.109905, 1, 0.9372549, 0, 1,
-1.028558, 1.310176, -1.976545, 1, 0.9411765, 0, 1,
-1.013454, 0.7023343, -0.008878856, 1, 0.9490196, 0, 1,
-1.012016, -0.5231938, -0.2707847, 1, 0.9529412, 0, 1,
-1.000302, 0.455722, -0.04277544, 1, 0.9607843, 0, 1,
-0.9944845, 0.6249008, -0.7962742, 1, 0.9647059, 0, 1,
-0.9934995, -0.2059127, -2.042401, 1, 0.972549, 0, 1,
-0.9924756, -0.07240722, -1.361465, 1, 0.9764706, 0, 1,
-0.9910662, 2.252941, -1.400641, 1, 0.9843137, 0, 1,
-0.9864476, -0.3757573, -1.315294, 1, 0.9882353, 0, 1,
-0.9858528, 1.084777, -2.200591, 1, 0.9960784, 0, 1,
-0.9854692, -1.053477, -2.299764, 0.9960784, 1, 0, 1,
-0.9812397, 0.320998, -0.6079827, 0.9921569, 1, 0, 1,
-0.9744231, 0.02782165, -1.142904, 0.9843137, 1, 0, 1,
-0.9724746, -2.221508, -2.08286, 0.9803922, 1, 0, 1,
-0.9662703, -0.06566195, -2.155334, 0.972549, 1, 0, 1,
-0.9652787, 1.195569, -1.984822, 0.9686275, 1, 0, 1,
-0.9573641, -1.403826, -2.00114, 0.9607843, 1, 0, 1,
-0.9553877, -0.7971875, -2.507928, 0.9568627, 1, 0, 1,
-0.9539188, 0.4141527, -1.81759, 0.9490196, 1, 0, 1,
-0.9472778, -0.4447069, -2.782252, 0.945098, 1, 0, 1,
-0.946505, 0.7916523, -2.534897, 0.9372549, 1, 0, 1,
-0.9450717, 1.393495, -2.364917, 0.9333333, 1, 0, 1,
-0.9439555, 0.4379211, -1.885756, 0.9254902, 1, 0, 1,
-0.9430583, -1.535255, -3.313304, 0.9215686, 1, 0, 1,
-0.9339098, 1.121967, 0.3577645, 0.9137255, 1, 0, 1,
-0.9327475, 1.486358, -0.6023867, 0.9098039, 1, 0, 1,
-0.9263596, 1.385912, -0.9104104, 0.9019608, 1, 0, 1,
-0.9236832, 0.7946467, -0.8905234, 0.8941177, 1, 0, 1,
-0.9218938, 1.102703, -0.6218341, 0.8901961, 1, 0, 1,
-0.9181732, 0.9216892, 0.3372744, 0.8823529, 1, 0, 1,
-0.9147758, -0.2869169, -2.345937, 0.8784314, 1, 0, 1,
-0.9120048, 0.2343498, -0.4283662, 0.8705882, 1, 0, 1,
-0.9113855, 0.5411941, 1.21495, 0.8666667, 1, 0, 1,
-0.9095855, 1.071844, 0.1013856, 0.8588235, 1, 0, 1,
-0.8922418, -0.3330418, -2.527821, 0.854902, 1, 0, 1,
-0.8914972, 0.6500507, -1.832586, 0.8470588, 1, 0, 1,
-0.8858346, 0.08850183, -2.72717, 0.8431373, 1, 0, 1,
-0.8802904, 1.771196, 1.124441, 0.8352941, 1, 0, 1,
-0.8798457, 1.158288, -1.417393, 0.8313726, 1, 0, 1,
-0.8779386, 2.286915, -0.9380963, 0.8235294, 1, 0, 1,
-0.8744261, -0.3932817, -0.1779305, 0.8196079, 1, 0, 1,
-0.8739859, -0.845153, -3.854415, 0.8117647, 1, 0, 1,
-0.8713155, 0.151701, -1.22663, 0.8078431, 1, 0, 1,
-0.8668518, 0.3402398, 0.08697311, 0.8, 1, 0, 1,
-0.8655251, -1.385225, -1.14538, 0.7921569, 1, 0, 1,
-0.8637993, -0.8286583, -2.445969, 0.7882353, 1, 0, 1,
-0.8608728, -1.446918, -2.178094, 0.7803922, 1, 0, 1,
-0.8527074, 0.04905736, -1.125218, 0.7764706, 1, 0, 1,
-0.8507832, -0.3097334, -2.373952, 0.7686275, 1, 0, 1,
-0.846684, -1.027037, -0.8926604, 0.7647059, 1, 0, 1,
-0.8444715, 0.5494961, -1.039567, 0.7568628, 1, 0, 1,
-0.8434409, -0.6200309, -3.289371, 0.7529412, 1, 0, 1,
-0.8428446, 0.6389849, -1.831056, 0.7450981, 1, 0, 1,
-0.8385305, 0.5049662, 0.8300181, 0.7411765, 1, 0, 1,
-0.8365489, -1.281908, -0.5317233, 0.7333333, 1, 0, 1,
-0.8307838, -0.4147294, -1.610873, 0.7294118, 1, 0, 1,
-0.8279343, 2.220853, 0.6720707, 0.7215686, 1, 0, 1,
-0.8272407, -0.7451904, -1.905529, 0.7176471, 1, 0, 1,
-0.8259382, -0.2749372, -0.223085, 0.7098039, 1, 0, 1,
-0.8247951, 0.414037, -2.247835, 0.7058824, 1, 0, 1,
-0.8216615, 0.7399866, -1.743968, 0.6980392, 1, 0, 1,
-0.8196421, -1.824476, -1.276937, 0.6901961, 1, 0, 1,
-0.8172199, 0.2556975, -2.037457, 0.6862745, 1, 0, 1,
-0.8159246, -1.244613, -1.173327, 0.6784314, 1, 0, 1,
-0.8125113, -1.751048, -1.319349, 0.6745098, 1, 0, 1,
-0.8103234, 1.674314, -1.02601, 0.6666667, 1, 0, 1,
-0.8084676, 1.731335, -0.545166, 0.6627451, 1, 0, 1,
-0.804072, 0.1356974, -0.5525809, 0.654902, 1, 0, 1,
-0.7978895, 1.034271, 0.06768054, 0.6509804, 1, 0, 1,
-0.7923976, -1.310919, -4.432207, 0.6431373, 1, 0, 1,
-0.7898675, -1.755295, -2.002241, 0.6392157, 1, 0, 1,
-0.7895347, 0.2185127, -0.842631, 0.6313726, 1, 0, 1,
-0.7828295, 0.06600262, 0.03917282, 0.627451, 1, 0, 1,
-0.7808782, -0.4982147, -1.784191, 0.6196079, 1, 0, 1,
-0.7742913, 0.9423147, -0.5303616, 0.6156863, 1, 0, 1,
-0.7705343, 0.6839523, -0.545735, 0.6078432, 1, 0, 1,
-0.7702242, -0.8764607, -2.993164, 0.6039216, 1, 0, 1,
-0.7656825, -0.1036374, -3.552075, 0.5960785, 1, 0, 1,
-0.7655897, -1.258611, -3.852302, 0.5882353, 1, 0, 1,
-0.7631888, 0.02289943, -2.278065, 0.5843138, 1, 0, 1,
-0.7620084, 0.7210861, -0.6737317, 0.5764706, 1, 0, 1,
-0.7608849, -0.5077764, -0.4798149, 0.572549, 1, 0, 1,
-0.7582886, 0.1976129, -2.812871, 0.5647059, 1, 0, 1,
-0.7569472, -0.8289196, -2.784088, 0.5607843, 1, 0, 1,
-0.752373, -1.857056, -3.827546, 0.5529412, 1, 0, 1,
-0.7498036, -0.6333162, -2.510738, 0.5490196, 1, 0, 1,
-0.7497349, -0.6570832, -3.700088, 0.5411765, 1, 0, 1,
-0.7478153, 1.116259, -2.601685, 0.5372549, 1, 0, 1,
-0.7474477, 0.2163305, -3.170408, 0.5294118, 1, 0, 1,
-0.7470986, -0.3772106, -2.259392, 0.5254902, 1, 0, 1,
-0.7464449, 0.3771839, 0.09585878, 0.5176471, 1, 0, 1,
-0.7444742, 1.623678, -0.9243932, 0.5137255, 1, 0, 1,
-0.7428796, -1.418665, -3.757032, 0.5058824, 1, 0, 1,
-0.7406217, -0.9849336, -2.145983, 0.5019608, 1, 0, 1,
-0.7358276, -0.8560486, -1.367904, 0.4941176, 1, 0, 1,
-0.7309349, -0.546358, -2.820516, 0.4862745, 1, 0, 1,
-0.7285476, -0.8863055, -0.3654639, 0.4823529, 1, 0, 1,
-0.7239088, -0.8175273, -2.694917, 0.4745098, 1, 0, 1,
-0.7198319, -0.2586115, -2.104241, 0.4705882, 1, 0, 1,
-0.7171464, 0.7050613, 0.3093279, 0.4627451, 1, 0, 1,
-0.7169544, 1.937459, -1.629425, 0.4588235, 1, 0, 1,
-0.7119703, 1.123865, -0.5002869, 0.4509804, 1, 0, 1,
-0.711627, -0.008731501, -1.1473, 0.4470588, 1, 0, 1,
-0.7053162, 0.2130544, -0.1802746, 0.4392157, 1, 0, 1,
-0.7030038, -0.02781705, -0.6019173, 0.4352941, 1, 0, 1,
-0.6996551, 0.6396257, -1.696868, 0.427451, 1, 0, 1,
-0.699209, -1.054961, -2.219889, 0.4235294, 1, 0, 1,
-0.6971361, -2.380246, -4.437225, 0.4156863, 1, 0, 1,
-0.6921325, -0.4361784, -4.657503, 0.4117647, 1, 0, 1,
-0.6743883, 0.191086, -1.253909, 0.4039216, 1, 0, 1,
-0.6735839, 0.1853303, -3.392719, 0.3960784, 1, 0, 1,
-0.6668524, -0.4827464, -2.334985, 0.3921569, 1, 0, 1,
-0.6642708, 0.3199294, -1.616796, 0.3843137, 1, 0, 1,
-0.661565, -0.03487322, -0.6991063, 0.3803922, 1, 0, 1,
-0.6584121, 0.6508711, -2.243579, 0.372549, 1, 0, 1,
-0.6560561, -0.7014884, -2.484692, 0.3686275, 1, 0, 1,
-0.6540369, -0.1406787, -1.247894, 0.3607843, 1, 0, 1,
-0.6517449, 0.02724346, -3.398987, 0.3568628, 1, 0, 1,
-0.6458052, -0.2660808, -2.688909, 0.3490196, 1, 0, 1,
-0.6434085, 0.2332192, -2.011621, 0.345098, 1, 0, 1,
-0.6397004, 0.9730435, -1.518627, 0.3372549, 1, 0, 1,
-0.6365111, -2.500455, -2.850445, 0.3333333, 1, 0, 1,
-0.6336281, 0.513843, -0.3898846, 0.3254902, 1, 0, 1,
-0.6262249, -1.254925, -1.176265, 0.3215686, 1, 0, 1,
-0.6247786, -0.430267, -2.167684, 0.3137255, 1, 0, 1,
-0.6200492, -0.7988955, -3.024161, 0.3098039, 1, 0, 1,
-0.6199196, -0.3185664, -2.10944, 0.3019608, 1, 0, 1,
-0.6197905, 0.8846343, -1.242488, 0.2941177, 1, 0, 1,
-0.6153567, -1.01746, -3.678329, 0.2901961, 1, 0, 1,
-0.6120855, -0.005510657, -1.387418, 0.282353, 1, 0, 1,
-0.609614, 1.918007, 1.068969, 0.2784314, 1, 0, 1,
-0.6087247, 0.6006505, 0.7261295, 0.2705882, 1, 0, 1,
-0.5988548, -0.3030074, -1.132418, 0.2666667, 1, 0, 1,
-0.5956986, -0.03058099, -2.027501, 0.2588235, 1, 0, 1,
-0.5956892, 0.3549104, -2.458122, 0.254902, 1, 0, 1,
-0.5952921, -1.022341, -3.585389, 0.2470588, 1, 0, 1,
-0.5926704, -1.397993, -3.232286, 0.2431373, 1, 0, 1,
-0.5922654, 0.2099866, -1.741188, 0.2352941, 1, 0, 1,
-0.5882236, -0.4146872, -2.834811, 0.2313726, 1, 0, 1,
-0.5876352, 0.4575732, -0.5732864, 0.2235294, 1, 0, 1,
-0.5787539, -1.150506, -2.097978, 0.2196078, 1, 0, 1,
-0.5763587, -1.051242, -5.223927, 0.2117647, 1, 0, 1,
-0.570092, 2.136123, 0.9033799, 0.2078431, 1, 0, 1,
-0.5669913, 1.058182, 1.148934, 0.2, 1, 0, 1,
-0.5615475, 0.1883328, -2.977684, 0.1921569, 1, 0, 1,
-0.5589653, 0.08148094, -2.001615, 0.1882353, 1, 0, 1,
-0.5565386, 0.6798366, -1.050676, 0.1803922, 1, 0, 1,
-0.5549738, 0.02581978, -2.22631, 0.1764706, 1, 0, 1,
-0.553193, 0.06024706, -1.492487, 0.1686275, 1, 0, 1,
-0.5497984, -1.396611, -2.856576, 0.1647059, 1, 0, 1,
-0.5476173, -0.2820861, -1.97369, 0.1568628, 1, 0, 1,
-0.5415515, 0.5868282, -0.2289174, 0.1529412, 1, 0, 1,
-0.5366719, 0.2625478, -0.5806885, 0.145098, 1, 0, 1,
-0.5363359, 0.7259731, 0.3203289, 0.1411765, 1, 0, 1,
-0.5363121, 0.268233, -0.1826888, 0.1333333, 1, 0, 1,
-0.5319044, 0.4907731, 0.7056965, 0.1294118, 1, 0, 1,
-0.5318457, 0.09012483, -1.215474, 0.1215686, 1, 0, 1,
-0.5317686, -2.480239, -2.117168, 0.1176471, 1, 0, 1,
-0.5316014, -0.3667243, -1.195296, 0.1098039, 1, 0, 1,
-0.5308858, 0.7893168, 1.401887, 0.1058824, 1, 0, 1,
-0.5293723, -1.408542, -4.298365, 0.09803922, 1, 0, 1,
-0.5180249, 1.71807, -0.9658858, 0.09019608, 1, 0, 1,
-0.5147107, -0.08759609, -2.370486, 0.08627451, 1, 0, 1,
-0.5102978, 0.3014819, -2.119746, 0.07843138, 1, 0, 1,
-0.5092032, 0.3761173, -1.17757, 0.07450981, 1, 0, 1,
-0.5077057, 0.3090064, -0.3316203, 0.06666667, 1, 0, 1,
-0.5045657, 1.435759, 0.29739, 0.0627451, 1, 0, 1,
-0.5035294, -0.443757, -3.331686, 0.05490196, 1, 0, 1,
-0.5013744, -1.131551, -4.1918, 0.05098039, 1, 0, 1,
-0.4972117, 0.4370037, -1.31686, 0.04313726, 1, 0, 1,
-0.4936647, 1.644976, -2.100374, 0.03921569, 1, 0, 1,
-0.4932055, 1.730401, -0.6718095, 0.03137255, 1, 0, 1,
-0.4867581, -0.2357281, -2.035493, 0.02745098, 1, 0, 1,
-0.4856493, -1.269872, -1.276529, 0.01960784, 1, 0, 1,
-0.4781446, -0.3805221, -0.77735, 0.01568628, 1, 0, 1,
-0.4737848, -0.1199108, -1.720601, 0.007843138, 1, 0, 1,
-0.4723362, -0.4743375, -2.678142, 0.003921569, 1, 0, 1,
-0.4695517, -0.1621636, -1.396197, 0, 1, 0.003921569, 1,
-0.4661129, -0.2558483, -2.530744, 0, 1, 0.01176471, 1,
-0.4645424, -0.5957334, -1.160075, 0, 1, 0.01568628, 1,
-0.4637774, 1.143839, -1.686262, 0, 1, 0.02352941, 1,
-0.459546, 0.2327585, -0.2490827, 0, 1, 0.02745098, 1,
-0.4587094, 0.8313995, 0.3167818, 0, 1, 0.03529412, 1,
-0.4581299, -0.4022205, -2.589187, 0, 1, 0.03921569, 1,
-0.4580046, -0.3501275, -0.7642278, 0, 1, 0.04705882, 1,
-0.4574907, 1.056753, -0.7361765, 0, 1, 0.05098039, 1,
-0.4573224, 1.734693, -0.7450706, 0, 1, 0.05882353, 1,
-0.4496597, -0.6243826, -2.086089, 0, 1, 0.0627451, 1,
-0.4476298, 1.085394, -0.503972, 0, 1, 0.07058824, 1,
-0.4384726, 0.4339222, -0.744313, 0, 1, 0.07450981, 1,
-0.4356784, -0.8403315, -1.326071, 0, 1, 0.08235294, 1,
-0.4241526, 0.5678037, -0.6574451, 0, 1, 0.08627451, 1,
-0.4223048, -1.627223, -3.430912, 0, 1, 0.09411765, 1,
-0.4173615, -0.8882829, -1.741546, 0, 1, 0.1019608, 1,
-0.4140502, -0.3240317, -2.418031, 0, 1, 0.1058824, 1,
-0.4112297, 1.086221, -0.8710256, 0, 1, 0.1137255, 1,
-0.4110026, -0.07766172, -1.50048, 0, 1, 0.1176471, 1,
-0.4067296, -0.2042597, -2.063098, 0, 1, 0.1254902, 1,
-0.4040349, -0.8358179, -1.456656, 0, 1, 0.1294118, 1,
-0.404015, 1.077512, -0.4549996, 0, 1, 0.1372549, 1,
-0.4030589, -1.656166, -0.5104046, 0, 1, 0.1411765, 1,
-0.4023086, -0.8303636, -3.333345, 0, 1, 0.1490196, 1,
-0.3998937, 0.2067717, -1.871791, 0, 1, 0.1529412, 1,
-0.3991296, 1.386643, 0.792882, 0, 1, 0.1607843, 1,
-0.394625, -0.2502789, -2.645379, 0, 1, 0.1647059, 1,
-0.3941794, 1.530257, -0.2336386, 0, 1, 0.172549, 1,
-0.3938819, -0.8459886, -0.7272978, 0, 1, 0.1764706, 1,
-0.3775816, -0.404109, -2.802898, 0, 1, 0.1843137, 1,
-0.3774382, -1.406069, -3.285244, 0, 1, 0.1882353, 1,
-0.3768124, 0.2539261, -1.789352, 0, 1, 0.1960784, 1,
-0.3715248, -0.9082039, -2.340616, 0, 1, 0.2039216, 1,
-0.3703346, 1.108355, -0.7626666, 0, 1, 0.2078431, 1,
-0.3701958, 1.130263, -0.1715392, 0, 1, 0.2156863, 1,
-0.3696843, -0.6856839, -2.825973, 0, 1, 0.2196078, 1,
-0.3680203, -0.13658, -2.04417, 0, 1, 0.227451, 1,
-0.3679284, -1.171885, -3.743365, 0, 1, 0.2313726, 1,
-0.360463, 0.5299996, -0.06734303, 0, 1, 0.2392157, 1,
-0.3476923, 0.48356, -0.7972917, 0, 1, 0.2431373, 1,
-0.3443822, -0.1050297, -1.468779, 0, 1, 0.2509804, 1,
-0.3421989, -1.627397, -3.526326, 0, 1, 0.254902, 1,
-0.335943, -0.4153838, -0.7637215, 0, 1, 0.2627451, 1,
-0.33175, -1.83556, -4.181844, 0, 1, 0.2666667, 1,
-0.3295962, 0.3314037, -1.414165, 0, 1, 0.2745098, 1,
-0.3292511, -0.03696133, -0.3820168, 0, 1, 0.2784314, 1,
-0.3280374, -0.8160765, -4.313898, 0, 1, 0.2862745, 1,
-0.326818, 2.088723, 0.2110711, 0, 1, 0.2901961, 1,
-0.3261338, 0.2920465, -0.9562749, 0, 1, 0.2980392, 1,
-0.3246351, -0.1613163, -1.436058, 0, 1, 0.3058824, 1,
-0.3210444, 0.2666833, -1.234785, 0, 1, 0.3098039, 1,
-0.3155154, 0.3173561, -0.8632221, 0, 1, 0.3176471, 1,
-0.3081377, 2.498989, -0.632936, 0, 1, 0.3215686, 1,
-0.3081211, -0.00975446, -3.526556, 0, 1, 0.3294118, 1,
-0.3030585, -0.6044633, -2.453103, 0, 1, 0.3333333, 1,
-0.2980796, -1.060089, -2.643946, 0, 1, 0.3411765, 1,
-0.2979353, -1.08896, -1.259894, 0, 1, 0.345098, 1,
-0.2962186, -1.416216, -4.619576, 0, 1, 0.3529412, 1,
-0.2954153, -1.166067, -1.444055, 0, 1, 0.3568628, 1,
-0.2949854, -1.205732, -1.950334, 0, 1, 0.3647059, 1,
-0.290975, 0.1051762, -1.265613, 0, 1, 0.3686275, 1,
-0.2893935, -0.3806333, -3.673871, 0, 1, 0.3764706, 1,
-0.2891456, 0.577326, 0.9578031, 0, 1, 0.3803922, 1,
-0.2877432, 0.3959571, 0.06076652, 0, 1, 0.3882353, 1,
-0.2815788, 0.8760794, -0.5839192, 0, 1, 0.3921569, 1,
-0.2778488, -1.414034, -3.236145, 0, 1, 0.4, 1,
-0.2730254, -0.04668236, -0.7809845, 0, 1, 0.4078431, 1,
-0.2717389, -0.008835894, -1.205983, 0, 1, 0.4117647, 1,
-0.2705521, -0.6294402, -3.200612, 0, 1, 0.4196078, 1,
-0.2680679, 0.3684325, -0.4255826, 0, 1, 0.4235294, 1,
-0.2679795, -0.1811086, -0.8928415, 0, 1, 0.4313726, 1,
-0.2668521, -1.011454, -2.4407, 0, 1, 0.4352941, 1,
-0.2588187, 1.904119, -0.453663, 0, 1, 0.4431373, 1,
-0.257339, -0.6406373, -3.157893, 0, 1, 0.4470588, 1,
-0.2535077, -0.01127102, -0.3994015, 0, 1, 0.454902, 1,
-0.248396, 0.7889588, -1.594373, 0, 1, 0.4588235, 1,
-0.2481705, -0.8031588, -1.296134, 0, 1, 0.4666667, 1,
-0.2473275, 0.6910016, -0.05488439, 0, 1, 0.4705882, 1,
-0.2426828, 0.9506295, -0.3663754, 0, 1, 0.4784314, 1,
-0.2370487, -1.547395, -2.989033, 0, 1, 0.4823529, 1,
-0.2337935, 0.4026065, -1.36329, 0, 1, 0.4901961, 1,
-0.2324837, 1.481442, 0.7043939, 0, 1, 0.4941176, 1,
-0.231542, -1.368323, -4.863244, 0, 1, 0.5019608, 1,
-0.2292614, 0.6356252, -1.017447, 0, 1, 0.509804, 1,
-0.2278069, -1.158236, -2.708395, 0, 1, 0.5137255, 1,
-0.2256494, 1.408773, -0.5443747, 0, 1, 0.5215687, 1,
-0.2219993, 0.4495943, -1.087788, 0, 1, 0.5254902, 1,
-0.2199086, -0.6852868, -1.80792, 0, 1, 0.5333334, 1,
-0.2191977, 1.431334, -0.8368697, 0, 1, 0.5372549, 1,
-0.2113654, -0.4767497, -3.467166, 0, 1, 0.5450981, 1,
-0.2112817, -0.7429776, -3.178535, 0, 1, 0.5490196, 1,
-0.2087507, 1.466691, 0.5954561, 0, 1, 0.5568628, 1,
-0.20816, 1.298736, -1.178295, 0, 1, 0.5607843, 1,
-0.2069123, -0.2289973, -1.305076, 0, 1, 0.5686275, 1,
-0.2068813, -1.05092, -2.686453, 0, 1, 0.572549, 1,
-0.2035126, 2.015424, 1.102777, 0, 1, 0.5803922, 1,
-0.2028244, -0.01434526, -1.841714, 0, 1, 0.5843138, 1,
-0.2024962, 0.6149004, -0.9322873, 0, 1, 0.5921569, 1,
-0.2003313, -0.1493524, -2.046716, 0, 1, 0.5960785, 1,
-0.1998646, -1.354272, -3.937145, 0, 1, 0.6039216, 1,
-0.1998537, 0.2069851, -0.4828273, 0, 1, 0.6117647, 1,
-0.1911757, -0.1383419, -2.556885, 0, 1, 0.6156863, 1,
-0.1825358, -0.5571321, -3.009538, 0, 1, 0.6235294, 1,
-0.1810352, 0.3849317, -0.05926283, 0, 1, 0.627451, 1,
-0.1762689, 1.191453, -1.918441, 0, 1, 0.6352941, 1,
-0.1757046, -1.183163, -2.788291, 0, 1, 0.6392157, 1,
-0.1755252, 0.5857353, 0.5308115, 0, 1, 0.6470588, 1,
-0.1746339, 0.2064198, -0.2044399, 0, 1, 0.6509804, 1,
-0.1707084, -0.9356565, -3.466234, 0, 1, 0.6588235, 1,
-0.1689038, 0.7744373, 1.359841, 0, 1, 0.6627451, 1,
-0.1670299, -1.365515, -2.837388, 0, 1, 0.6705883, 1,
-0.1668551, 0.1862024, -1.253447, 0, 1, 0.6745098, 1,
-0.1662976, 0.7719743, 1.273184, 0, 1, 0.682353, 1,
-0.1659395, 0.8408478, -0.2425722, 0, 1, 0.6862745, 1,
-0.1640977, 0.4424553, -0.1302018, 0, 1, 0.6941177, 1,
-0.1611789, -0.6401725, -3.037393, 0, 1, 0.7019608, 1,
-0.1611221, -0.8705457, -3.962419, 0, 1, 0.7058824, 1,
-0.15976, -1.244607, -4.461645, 0, 1, 0.7137255, 1,
-0.1590568, 0.1446822, 0.1400086, 0, 1, 0.7176471, 1,
-0.1579277, 0.7562332, 0.5295473, 0, 1, 0.7254902, 1,
-0.1530894, -1.173636, -3.326774, 0, 1, 0.7294118, 1,
-0.1434536, 0.5814121, -1.49847, 0, 1, 0.7372549, 1,
-0.143188, -0.06976414, -2.879255, 0, 1, 0.7411765, 1,
-0.1427872, -0.7317723, -2.025001, 0, 1, 0.7490196, 1,
-0.1396024, 0.3008633, -0.7852365, 0, 1, 0.7529412, 1,
-0.132334, 1.808391, 0.3012035, 0, 1, 0.7607843, 1,
-0.128988, -1.332855, -1.848607, 0, 1, 0.7647059, 1,
-0.1276583, 0.3107379, 0.1891769, 0, 1, 0.772549, 1,
-0.1266532, -0.02399422, -1.711179, 0, 1, 0.7764706, 1,
-0.126328, 0.4135346, 1.3516, 0, 1, 0.7843137, 1,
-0.1259847, -0.05036737, -1.893217, 0, 1, 0.7882353, 1,
-0.1256243, -1.218675, -3.235044, 0, 1, 0.7960784, 1,
-0.1245512, 1.573852, 0.4176556, 0, 1, 0.8039216, 1,
-0.1203786, 0.9697546, 0.6621259, 0, 1, 0.8078431, 1,
-0.1185461, 1.317872, 0.02137177, 0, 1, 0.8156863, 1,
-0.1125666, 0.5085166, 0.8716832, 0, 1, 0.8196079, 1,
-0.1115879, 0.8529509, -0.1712634, 0, 1, 0.827451, 1,
-0.1103826, -0.9780014, -2.70773, 0, 1, 0.8313726, 1,
-0.1099374, 0.8573557, 0.315427, 0, 1, 0.8392157, 1,
-0.1095384, -2.085485, -2.363411, 0, 1, 0.8431373, 1,
-0.1078459, 0.6319569, -1.468658, 0, 1, 0.8509804, 1,
-0.1035255, -0.4632637, -2.62111, 0, 1, 0.854902, 1,
-0.1030423, -0.04572642, -1.453818, 0, 1, 0.8627451, 1,
-0.09493198, 0.6426724, 0.8513786, 0, 1, 0.8666667, 1,
-0.0886295, -0.5297277, -0.938509, 0, 1, 0.8745098, 1,
-0.08383942, 1.328499, 1.196413, 0, 1, 0.8784314, 1,
-0.08200055, -0.2636545, -2.206421, 0, 1, 0.8862745, 1,
-0.07949283, -0.004144772, -1.091528, 0, 1, 0.8901961, 1,
-0.07315183, -1.211323, -3.854695, 0, 1, 0.8980392, 1,
-0.07232204, 1.488044, 0.04014719, 0, 1, 0.9058824, 1,
-0.06898656, 1.033848, 0.1444416, 0, 1, 0.9098039, 1,
-0.06665895, 1.017406, -1.246757, 0, 1, 0.9176471, 1,
-0.05723295, 0.05594068, 0.04270829, 0, 1, 0.9215686, 1,
-0.05663735, 0.5425195, 0.729849, 0, 1, 0.9294118, 1,
-0.05419181, -0.2894483, -4.347487, 0, 1, 0.9333333, 1,
-0.04699195, 0.4665097, -0.342101, 0, 1, 0.9411765, 1,
-0.04695087, 0.805633, -0.1160019, 0, 1, 0.945098, 1,
-0.04655655, 0.3651082, 0.3839091, 0, 1, 0.9529412, 1,
-0.04636468, -1.607377, -4.499358, 0, 1, 0.9568627, 1,
-0.04613068, -0.6461284, -3.460107, 0, 1, 0.9647059, 1,
-0.04396063, 0.2081913, 0.5765107, 0, 1, 0.9686275, 1,
-0.04174782, -0.8416811, -3.175433, 0, 1, 0.9764706, 1,
-0.03889103, -0.03922264, -2.046293, 0, 1, 0.9803922, 1,
-0.03663684, -0.3759419, -4.769663, 0, 1, 0.9882353, 1,
-0.03190968, 0.228167, -2.143108, 0, 1, 0.9921569, 1,
-0.02004009, 0.239166, -1.216578, 0, 1, 1, 1,
-0.01953935, -0.5089266, -2.68303, 0, 0.9921569, 1, 1,
-0.01825582, -0.3585823, -2.729226, 0, 0.9882353, 1, 1,
-0.01160506, -1.619355, -3.242793, 0, 0.9803922, 1, 1,
-0.01009272, 0.2864431, 1.618216, 0, 0.9764706, 1, 1,
-0.00956825, -0.8445385, -2.896931, 0, 0.9686275, 1, 1,
-0.007455362, -0.9265131, -3.213283, 0, 0.9647059, 1, 1,
-0.004451037, 0.7049112, -0.764309, 0, 0.9568627, 1, 1,
-0.004145002, -1.203483, -4.316772, 0, 0.9529412, 1, 1,
-0.003400649, -1.643747, -5.340862, 0, 0.945098, 1, 1,
0.003470671, -0.9261523, 3.201568, 0, 0.9411765, 1, 1,
0.006655115, -0.7117208, 3.731597, 0, 0.9333333, 1, 1,
0.006804396, -0.8835977, 0.9360419, 0, 0.9294118, 1, 1,
0.009910706, -0.6018052, 1.594174, 0, 0.9215686, 1, 1,
0.01728678, 0.4030694, 0.1234805, 0, 0.9176471, 1, 1,
0.01802206, 0.4990732, -1.137559, 0, 0.9098039, 1, 1,
0.01853153, -1.414634, 2.066593, 0, 0.9058824, 1, 1,
0.02009416, -1.051581, 3.014243, 0, 0.8980392, 1, 1,
0.02202312, 0.4813663, -0.4523206, 0, 0.8901961, 1, 1,
0.02464435, 0.3396406, 0.8549551, 0, 0.8862745, 1, 1,
0.02844511, -1.440979, 3.866337, 0, 0.8784314, 1, 1,
0.03115452, -1.220501, 4.187906, 0, 0.8745098, 1, 1,
0.03165182, 0.3586286, -0.9175797, 0, 0.8666667, 1, 1,
0.04312147, 0.3709479, -0.1077872, 0, 0.8627451, 1, 1,
0.04679162, -0.07697142, 2.323652, 0, 0.854902, 1, 1,
0.04683984, -1.688389, 4.951372, 0, 0.8509804, 1, 1,
0.04747514, -1.341923, 3.670874, 0, 0.8431373, 1, 1,
0.04764255, -0.678265, 1.950744, 0, 0.8392157, 1, 1,
0.05073078, -0.9037567, 4.082798, 0, 0.8313726, 1, 1,
0.05086616, 0.8197107, 1.607237, 0, 0.827451, 1, 1,
0.05197391, 1.817003, -1.299593, 0, 0.8196079, 1, 1,
0.05230869, -0.01460143, 3.184867, 0, 0.8156863, 1, 1,
0.05392822, 0.6874561, 2.423978, 0, 0.8078431, 1, 1,
0.06143717, -0.1063387, 3.138927, 0, 0.8039216, 1, 1,
0.06165259, 0.003692051, 1.151763, 0, 0.7960784, 1, 1,
0.06281693, -0.3785133, 2.643935, 0, 0.7882353, 1, 1,
0.06438639, 1.273578, 0.8792815, 0, 0.7843137, 1, 1,
0.06788901, -1.385875, 3.272547, 0, 0.7764706, 1, 1,
0.076752, -2.468051, 3.1095, 0, 0.772549, 1, 1,
0.07755363, 1.366093, -1.057004, 0, 0.7647059, 1, 1,
0.07831894, -1.452406, 3.636847, 0, 0.7607843, 1, 1,
0.08300222, -2.195321, 3.385281, 0, 0.7529412, 1, 1,
0.08531718, 2.153172, 0.1603396, 0, 0.7490196, 1, 1,
0.08549499, -0.3633926, 2.671598, 0, 0.7411765, 1, 1,
0.08792802, -1.270981, 1.906574, 0, 0.7372549, 1, 1,
0.09058747, -0.5088608, 2.974567, 0, 0.7294118, 1, 1,
0.09283926, 0.3565221, 0.286504, 0, 0.7254902, 1, 1,
0.09772048, -0.3434729, 2.903363, 0, 0.7176471, 1, 1,
0.09932181, -0.9935883, 3.085932, 0, 0.7137255, 1, 1,
0.1029279, 0.9885246, 1.367348, 0, 0.7058824, 1, 1,
0.105234, 0.3318395, 0.8058358, 0, 0.6980392, 1, 1,
0.106417, 1.904471, 0.04336709, 0, 0.6941177, 1, 1,
0.1070237, 0.04758222, 2.067863, 0, 0.6862745, 1, 1,
0.1079233, 0.287249, 1.886156, 0, 0.682353, 1, 1,
0.1118888, -0.2399479, 3.069642, 0, 0.6745098, 1, 1,
0.1121239, 0.3457361, -0.682835, 0, 0.6705883, 1, 1,
0.1121797, -0.498666, 2.451781, 0, 0.6627451, 1, 1,
0.1121807, -1.040612, 2.984556, 0, 0.6588235, 1, 1,
0.1182937, 0.628058, 0.9378219, 0, 0.6509804, 1, 1,
0.1192137, 0.3285271, 1.273296, 0, 0.6470588, 1, 1,
0.1200852, -0.1428437, 1.036789, 0, 0.6392157, 1, 1,
0.1204613, 1.149524, -0.3906804, 0, 0.6352941, 1, 1,
0.1234221, -0.5328733, 3.036959, 0, 0.627451, 1, 1,
0.12511, -1.705496, 1.994182, 0, 0.6235294, 1, 1,
0.1259392, 2.117358, 0.8462397, 0, 0.6156863, 1, 1,
0.1267571, 0.1520451, 0.4466422, 0, 0.6117647, 1, 1,
0.1269851, 0.02165255, 0.23232, 0, 0.6039216, 1, 1,
0.1287747, 1.061139, 0.1819836, 0, 0.5960785, 1, 1,
0.1347665, -0.1435319, 2.301998, 0, 0.5921569, 1, 1,
0.1389498, 0.3567168, 0.02592633, 0, 0.5843138, 1, 1,
0.1390451, 0.4643652, 0.4263842, 0, 0.5803922, 1, 1,
0.1412965, 0.05559886, 0.1297827, 0, 0.572549, 1, 1,
0.1438863, 0.5570754, -0.5653243, 0, 0.5686275, 1, 1,
0.1469724, -1.496944, 3.427825, 0, 0.5607843, 1, 1,
0.147237, 1.774738, -0.447358, 0, 0.5568628, 1, 1,
0.1472701, -0.7577527, 2.928437, 0, 0.5490196, 1, 1,
0.1512169, -0.8758066, 1.87202, 0, 0.5450981, 1, 1,
0.1516421, 1.016702, 0.1493439, 0, 0.5372549, 1, 1,
0.1524479, -0.2630334, 4.956476, 0, 0.5333334, 1, 1,
0.1530827, -0.6436115, 2.873287, 0, 0.5254902, 1, 1,
0.1542308, -2.990925, 2.279868, 0, 0.5215687, 1, 1,
0.1581436, -0.6620142, 3.794899, 0, 0.5137255, 1, 1,
0.1629121, 0.3879355, 0.4490485, 0, 0.509804, 1, 1,
0.1652951, 0.7063827, -0.476392, 0, 0.5019608, 1, 1,
0.1686324, -0.05320552, 2.642392, 0, 0.4941176, 1, 1,
0.1742498, -0.4048333, 0.6837268, 0, 0.4901961, 1, 1,
0.1756705, -0.05823216, 0.1932364, 0, 0.4823529, 1, 1,
0.1779527, -0.2620945, 3.585493, 0, 0.4784314, 1, 1,
0.1783224, 0.06907743, 3.939678, 0, 0.4705882, 1, 1,
0.1850406, -0.4099237, 3.923954, 0, 0.4666667, 1, 1,
0.1869841, 0.5251065, 0.1341837, 0, 0.4588235, 1, 1,
0.1919543, -0.3252097, 1.068634, 0, 0.454902, 1, 1,
0.1930923, -0.1438352, 1.792034, 0, 0.4470588, 1, 1,
0.1936363, -0.6045697, 2.698839, 0, 0.4431373, 1, 1,
0.1961652, 0.4056891, 1.322416, 0, 0.4352941, 1, 1,
0.1978321, 0.1363177, 1.722752, 0, 0.4313726, 1, 1,
0.1985754, -1.010199, 2.130227, 0, 0.4235294, 1, 1,
0.2028841, -0.1962236, 3.19623, 0, 0.4196078, 1, 1,
0.20617, 1.135286, -1.530635, 0, 0.4117647, 1, 1,
0.2062505, -0.1602769, 0.3237997, 0, 0.4078431, 1, 1,
0.2070047, 0.5340188, 0.4978433, 0, 0.4, 1, 1,
0.2085672, 0.25513, 0.9161423, 0, 0.3921569, 1, 1,
0.2088318, -0.4817372, 1.51399, 0, 0.3882353, 1, 1,
0.2103385, -1.74176, 1.807652, 0, 0.3803922, 1, 1,
0.2184666, -0.42296, 2.412508, 0, 0.3764706, 1, 1,
0.2185808, 0.7746106, -1.450132, 0, 0.3686275, 1, 1,
0.2250209, 0.07500616, 0.2662256, 0, 0.3647059, 1, 1,
0.2272462, -0.4511218, 2.563723, 0, 0.3568628, 1, 1,
0.230699, -0.004270483, 0.7448026, 0, 0.3529412, 1, 1,
0.2318627, 0.0563018, 1.935143, 0, 0.345098, 1, 1,
0.238388, 0.3138346, 1.313855, 0, 0.3411765, 1, 1,
0.238749, -0.8244025, 3.655009, 0, 0.3333333, 1, 1,
0.2398512, 1.595157, 1.522567, 0, 0.3294118, 1, 1,
0.2416908, 0.1434252, 2.328206, 0, 0.3215686, 1, 1,
0.2431367, 0.636903, 0.6831493, 0, 0.3176471, 1, 1,
0.2442265, 1.468797, -0.8204632, 0, 0.3098039, 1, 1,
0.2451457, -0.1245379, 0.9069388, 0, 0.3058824, 1, 1,
0.2476276, -0.04823139, 2.539456, 0, 0.2980392, 1, 1,
0.2547958, -0.03622255, 3.401749, 0, 0.2901961, 1, 1,
0.2549999, -0.1440126, 1.862683, 0, 0.2862745, 1, 1,
0.2559363, -0.8069401, 3.737522, 0, 0.2784314, 1, 1,
0.2579923, -0.4489888, 3.681058, 0, 0.2745098, 1, 1,
0.2584726, 0.4889642, -0.2103359, 0, 0.2666667, 1, 1,
0.2601398, -0.4249631, 2.262618, 0, 0.2627451, 1, 1,
0.2620887, -0.9839222, 4.004488, 0, 0.254902, 1, 1,
0.2627801, -1.094794, 3.410061, 0, 0.2509804, 1, 1,
0.2675342, -1.828903, 2.167484, 0, 0.2431373, 1, 1,
0.2687737, -0.01409821, 1.116312, 0, 0.2392157, 1, 1,
0.2724069, -0.1859257, 2.579089, 0, 0.2313726, 1, 1,
0.2739112, -0.4219582, 2.29704, 0, 0.227451, 1, 1,
0.2762392, 0.8487562, -0.6396978, 0, 0.2196078, 1, 1,
0.2795767, -0.7447466, 1.830158, 0, 0.2156863, 1, 1,
0.2837515, -1.79863, 2.509213, 0, 0.2078431, 1, 1,
0.2841229, 0.4358014, 0.0006177949, 0, 0.2039216, 1, 1,
0.2858444, 0.1519136, 1.794285, 0, 0.1960784, 1, 1,
0.2891637, 1.066218, -0.6251873, 0, 0.1882353, 1, 1,
0.2987672, -1.289657, 3.763039, 0, 0.1843137, 1, 1,
0.3009095, -0.2944129, 3.398618, 0, 0.1764706, 1, 1,
0.3022525, -0.4583869, 3.534319, 0, 0.172549, 1, 1,
0.3041705, 0.7932246, 1.795114, 0, 0.1647059, 1, 1,
0.3092509, 0.4299035, 1.486421, 0, 0.1607843, 1, 1,
0.3196102, 0.7371343, -0.05152369, 0, 0.1529412, 1, 1,
0.3205279, 0.05066166, 1.143923, 0, 0.1490196, 1, 1,
0.3235122, 0.1290987, 0.04739743, 0, 0.1411765, 1, 1,
0.3302368, -0.01687831, 0.4288687, 0, 0.1372549, 1, 1,
0.3323993, -0.5361712, 2.35879, 0, 0.1294118, 1, 1,
0.333102, -0.8807942, 3.591105, 0, 0.1254902, 1, 1,
0.3346619, 1.223165, 0.8699956, 0, 0.1176471, 1, 1,
0.3351215, 0.5289318, 1.920836, 0, 0.1137255, 1, 1,
0.3402168, 0.1791451, 2.701662, 0, 0.1058824, 1, 1,
0.3425445, -2.220162, 1.227364, 0, 0.09803922, 1, 1,
0.3456526, -0.4793015, -0.20618, 0, 0.09411765, 1, 1,
0.3491161, -0.9255342, 2.450879, 0, 0.08627451, 1, 1,
0.3506715, 0.5270956, 1.961421, 0, 0.08235294, 1, 1,
0.3510453, 0.7233741, 0.2231481, 0, 0.07450981, 1, 1,
0.3574051, -0.7102185, 1.587085, 0, 0.07058824, 1, 1,
0.3581405, 0.3324227, 3.299755, 0, 0.0627451, 1, 1,
0.3610823, -0.736196, 1.202858, 0, 0.05882353, 1, 1,
0.361901, 1.779716, -0.0389102, 0, 0.05098039, 1, 1,
0.3624797, -0.2271302, 3.241811, 0, 0.04705882, 1, 1,
0.3631795, -0.6271717, 2.651377, 0, 0.03921569, 1, 1,
0.3640017, 0.4568473, 1.397069, 0, 0.03529412, 1, 1,
0.3659417, -0.2627242, 1.854111, 0, 0.02745098, 1, 1,
0.3666756, -0.121339, 4.166102, 0, 0.02352941, 1, 1,
0.3681471, -1.48028, 2.274157, 0, 0.01568628, 1, 1,
0.3699604, -1.834752, 4.179734, 0, 0.01176471, 1, 1,
0.3706416, -0.4641247, 4.092918, 0, 0.003921569, 1, 1,
0.3734, -0.1888453, 3.429035, 0.003921569, 0, 1, 1,
0.3754044, -2.773512, 2.625626, 0.007843138, 0, 1, 1,
0.3763147, 0.4578944, 1.795644, 0.01568628, 0, 1, 1,
0.3816679, 1.238474, 1.116522, 0.01960784, 0, 1, 1,
0.3827207, -1.620484, 3.000488, 0.02745098, 0, 1, 1,
0.3879168, 1.411273, -0.5006294, 0.03137255, 0, 1, 1,
0.3880048, 0.2003125, 0.7691091, 0.03921569, 0, 1, 1,
0.3885499, 0.1881925, 1.513597, 0.04313726, 0, 1, 1,
0.3901551, 0.01705359, 1.385294, 0.05098039, 0, 1, 1,
0.3968061, -0.4918752, 2.34923, 0.05490196, 0, 1, 1,
0.396942, 0.6057122, 1.091781, 0.0627451, 0, 1, 1,
0.3998978, -2.059653, 3.670673, 0.06666667, 0, 1, 1,
0.4058642, -1.055122, 2.180867, 0.07450981, 0, 1, 1,
0.4061179, 0.985675, 0.5365911, 0.07843138, 0, 1, 1,
0.4141448, -1.334426, 4.023998, 0.08627451, 0, 1, 1,
0.4157721, -0.2834546, 1.329448, 0.09019608, 0, 1, 1,
0.4163359, 0.06287637, 2.217725, 0.09803922, 0, 1, 1,
0.4235336, 0.1799658, 0.7920064, 0.1058824, 0, 1, 1,
0.4264708, 0.3216879, 2.316711, 0.1098039, 0, 1, 1,
0.4280188, 0.2507968, 0.2671825, 0.1176471, 0, 1, 1,
0.428201, -0.4408477, 2.2946, 0.1215686, 0, 1, 1,
0.4333448, 0.8774775, 1.157805, 0.1294118, 0, 1, 1,
0.4340827, -0.4407682, 2.888051, 0.1333333, 0, 1, 1,
0.4387035, -0.05315768, 1.078247, 0.1411765, 0, 1, 1,
0.4455332, 0.2669302, 1.120494, 0.145098, 0, 1, 1,
0.4472002, 0.08508225, 2.334931, 0.1529412, 0, 1, 1,
0.4485965, 0.7179466, 1.012723, 0.1568628, 0, 1, 1,
0.4486766, 0.6152743, 0.3569093, 0.1647059, 0, 1, 1,
0.4492117, 0.2536612, 0.6171201, 0.1686275, 0, 1, 1,
0.4509741, -0.3232061, 1.186037, 0.1764706, 0, 1, 1,
0.4519867, 2.252031, 0.5623856, 0.1803922, 0, 1, 1,
0.4540246, -0.5218189, 2.249264, 0.1882353, 0, 1, 1,
0.4563813, 1.42472, 1.985268, 0.1921569, 0, 1, 1,
0.4571304, -0.08553791, 0.671665, 0.2, 0, 1, 1,
0.4617085, -1.417494, 3.466374, 0.2078431, 0, 1, 1,
0.4622895, 0.931169, -0.08222372, 0.2117647, 0, 1, 1,
0.464936, -0.601794, 2.301817, 0.2196078, 0, 1, 1,
0.4710191, 0.1973414, 1.820953, 0.2235294, 0, 1, 1,
0.4716943, 0.3669249, 1.97263, 0.2313726, 0, 1, 1,
0.4737079, -0.1940134, 0.9679915, 0.2352941, 0, 1, 1,
0.4754576, -1.712519, 3.98051, 0.2431373, 0, 1, 1,
0.4799403, 0.2814725, 0.6852699, 0.2470588, 0, 1, 1,
0.4840206, -1.355415, 2.191585, 0.254902, 0, 1, 1,
0.4841528, 1.068522, -1.815392, 0.2588235, 0, 1, 1,
0.4866036, -0.8065805, 3.804966, 0.2666667, 0, 1, 1,
0.4882428, -1.076056, 3.142555, 0.2705882, 0, 1, 1,
0.4908892, -0.8900886, 2.211934, 0.2784314, 0, 1, 1,
0.4926643, -0.8626804, 3.149469, 0.282353, 0, 1, 1,
0.4935803, 0.8397199, 0.3370143, 0.2901961, 0, 1, 1,
0.4954748, 1.788866, 0.4104646, 0.2941177, 0, 1, 1,
0.4959269, -0.1263078, 2.206827, 0.3019608, 0, 1, 1,
0.4984697, -0.25643, 1.257254, 0.3098039, 0, 1, 1,
0.4988661, 0.8405559, 0.2305205, 0.3137255, 0, 1, 1,
0.5009397, -0.2541845, 3.418325, 0.3215686, 0, 1, 1,
0.5012309, -0.6332021, 2.153196, 0.3254902, 0, 1, 1,
0.5020216, -0.5325297, 2.301769, 0.3333333, 0, 1, 1,
0.5023605, -2.425858, 3.564556, 0.3372549, 0, 1, 1,
0.5055662, 0.7014095, -1.300761, 0.345098, 0, 1, 1,
0.5079845, 0.311034, -0.559383, 0.3490196, 0, 1, 1,
0.5086767, 1.494646, 0.4456488, 0.3568628, 0, 1, 1,
0.512378, 0.8494509, 1.654842, 0.3607843, 0, 1, 1,
0.5143579, -0.8815348, 2.676759, 0.3686275, 0, 1, 1,
0.5179917, 0.3014686, 1.997506, 0.372549, 0, 1, 1,
0.5185322, -0.02730861, 0.8864588, 0.3803922, 0, 1, 1,
0.5194314, 0.8303379, -0.02131336, 0.3843137, 0, 1, 1,
0.520857, -0.6877684, 1.680827, 0.3921569, 0, 1, 1,
0.5293555, -0.9435109, 2.217685, 0.3960784, 0, 1, 1,
0.5327748, -0.4205764, 2.493406, 0.4039216, 0, 1, 1,
0.5397205, 0.704254, 0.2760007, 0.4117647, 0, 1, 1,
0.5424777, 0.01195146, -0.3199357, 0.4156863, 0, 1, 1,
0.548494, -1.320711, 4.194661, 0.4235294, 0, 1, 1,
0.5510766, 1.220192, 1.497011, 0.427451, 0, 1, 1,
0.5519834, 0.8885351, 1.296604, 0.4352941, 0, 1, 1,
0.5619134, 1.995531, -1.411958, 0.4392157, 0, 1, 1,
0.5627266, -0.3654392, 2.42004, 0.4470588, 0, 1, 1,
0.5633728, 0.9827248, 0.2092076, 0.4509804, 0, 1, 1,
0.5652604, 1.247128, 0.5770414, 0.4588235, 0, 1, 1,
0.5683593, 0.2833312, 2.100584, 0.4627451, 0, 1, 1,
0.5756733, -0.9110448, 3.703315, 0.4705882, 0, 1, 1,
0.575983, -0.9788324, 3.700134, 0.4745098, 0, 1, 1,
0.5842648, -1.732618, 2.352001, 0.4823529, 0, 1, 1,
0.5844182, -0.08512956, -0.03122866, 0.4862745, 0, 1, 1,
0.6010051, -0.3013757, 2.338511, 0.4941176, 0, 1, 1,
0.6010076, 0.7645228, -0.7852678, 0.5019608, 0, 1, 1,
0.6023494, -1.361805, 2.541553, 0.5058824, 0, 1, 1,
0.6096746, -1.535838, 3.268412, 0.5137255, 0, 1, 1,
0.6116467, -0.4254458, 2.542893, 0.5176471, 0, 1, 1,
0.6149043, -1.42432, 2.572278, 0.5254902, 0, 1, 1,
0.6180197, -0.1213782, 2.87644, 0.5294118, 0, 1, 1,
0.6203698, 2.001522, -2.239195, 0.5372549, 0, 1, 1,
0.6297104, -0.6799274, 2.91696, 0.5411765, 0, 1, 1,
0.6321572, -1.141841, 3.205551, 0.5490196, 0, 1, 1,
0.6362353, -0.2756305, 2.984256, 0.5529412, 0, 1, 1,
0.6373407, -0.1469388, 2.951203, 0.5607843, 0, 1, 1,
0.6429238, 0.6621693, 0.9835567, 0.5647059, 0, 1, 1,
0.6455495, -1.76365, 2.413666, 0.572549, 0, 1, 1,
0.6525496, -1.064363, 2.382317, 0.5764706, 0, 1, 1,
0.6683049, 2.184108, 0.01150783, 0.5843138, 0, 1, 1,
0.6686718, 0.6306295, 0.3346076, 0.5882353, 0, 1, 1,
0.6716514, 0.2126871, 0.06674974, 0.5960785, 0, 1, 1,
0.6807625, -1.244664, 1.495935, 0.6039216, 0, 1, 1,
0.6818697, 0.2777381, 0.2953779, 0.6078432, 0, 1, 1,
0.6868615, 0.5984488, -1.456204, 0.6156863, 0, 1, 1,
0.6909156, 0.07422762, 0.9375249, 0.6196079, 0, 1, 1,
0.6972358, -0.2540057, 3.604116, 0.627451, 0, 1, 1,
0.6982858, -0.4602567, 3.312333, 0.6313726, 0, 1, 1,
0.7003064, -0.003407601, 1.975358, 0.6392157, 0, 1, 1,
0.7012841, 0.2397062, 3.438563, 0.6431373, 0, 1, 1,
0.702536, 1.608221, -1.33452, 0.6509804, 0, 1, 1,
0.7049723, -0.3577999, 4.24369, 0.654902, 0, 1, 1,
0.7054239, -0.3904847, 2.634371, 0.6627451, 0, 1, 1,
0.7106069, 0.8484874, -1.176335, 0.6666667, 0, 1, 1,
0.7136216, 0.3789438, 1.385263, 0.6745098, 0, 1, 1,
0.713954, 1.229154, 0.7714676, 0.6784314, 0, 1, 1,
0.7165718, -1.037281, 1.364946, 0.6862745, 0, 1, 1,
0.7179945, 0.3418645, -0.3619781, 0.6901961, 0, 1, 1,
0.7184504, 1.342723, 0.6731191, 0.6980392, 0, 1, 1,
0.7205271, -0.8748729, 2.146797, 0.7058824, 0, 1, 1,
0.7239618, -0.3188519, 1.87184, 0.7098039, 0, 1, 1,
0.7263778, 1.35035, 2.423761, 0.7176471, 0, 1, 1,
0.7267524, 0.6887857, -0.5854195, 0.7215686, 0, 1, 1,
0.72715, 0.1385005, -1.004327, 0.7294118, 0, 1, 1,
0.7296109, 0.4090459, 0.7943336, 0.7333333, 0, 1, 1,
0.7304157, -0.008989619, 1.899522, 0.7411765, 0, 1, 1,
0.7317876, -0.2398973, 2.339444, 0.7450981, 0, 1, 1,
0.7337662, 1.101815, 0.5013821, 0.7529412, 0, 1, 1,
0.7338625, -0.597014, 0.5311754, 0.7568628, 0, 1, 1,
0.7345167, 0.3360254, 1.286022, 0.7647059, 0, 1, 1,
0.7380793, -0.853382, 3.094748, 0.7686275, 0, 1, 1,
0.7455869, -1.275872, 0.3941821, 0.7764706, 0, 1, 1,
0.7456856, 2.31298, -0.6256754, 0.7803922, 0, 1, 1,
0.7459632, -0.858676, 3.755737, 0.7882353, 0, 1, 1,
0.7522233, 0.09208038, -0.1725073, 0.7921569, 0, 1, 1,
0.7577382, -0.6117741, 1.042694, 0.8, 0, 1, 1,
0.7586297, -0.2664912, 3.040454, 0.8078431, 0, 1, 1,
0.7622927, -1.232485, 2.387017, 0.8117647, 0, 1, 1,
0.7644862, -1.876679, 1.512959, 0.8196079, 0, 1, 1,
0.764842, -0.8187363, 2.761198, 0.8235294, 0, 1, 1,
0.7660412, -1.400092, 3.237317, 0.8313726, 0, 1, 1,
0.7661274, -0.05253485, 1.782685, 0.8352941, 0, 1, 1,
0.7666534, -0.3613415, 1.659665, 0.8431373, 0, 1, 1,
0.7714546, -0.8125892, 2.805503, 0.8470588, 0, 1, 1,
0.7734795, 0.8983948, 1.673403, 0.854902, 0, 1, 1,
0.7734806, -1.108562, 2.814683, 0.8588235, 0, 1, 1,
0.7739933, -0.2146963, 2.807429, 0.8666667, 0, 1, 1,
0.7757654, 1.478084, -0.6215898, 0.8705882, 0, 1, 1,
0.7782134, 0.8994285, 1.788107, 0.8784314, 0, 1, 1,
0.7797595, -0.007846163, 0.3712963, 0.8823529, 0, 1, 1,
0.7808379, 0.7469119, 1.506824, 0.8901961, 0, 1, 1,
0.7815504, 1.8037, -0.1271115, 0.8941177, 0, 1, 1,
0.7856877, -0.08459252, 1.804028, 0.9019608, 0, 1, 1,
0.7907507, 0.4914775, 2.053837, 0.9098039, 0, 1, 1,
0.7966809, -0.1722088, 3.019399, 0.9137255, 0, 1, 1,
0.8003433, 1.485852, -0.6468127, 0.9215686, 0, 1, 1,
0.8060484, 1.224037, -0.9077469, 0.9254902, 0, 1, 1,
0.8085381, -0.8430774, 4.370542, 0.9333333, 0, 1, 1,
0.8104243, -0.4059091, 1.983681, 0.9372549, 0, 1, 1,
0.8119149, 1.211961, 0.4579916, 0.945098, 0, 1, 1,
0.813649, 1.333255, -0.48854, 0.9490196, 0, 1, 1,
0.8160698, 0.1613043, 2.174633, 0.9568627, 0, 1, 1,
0.8209968, 0.337119, 1.693933, 0.9607843, 0, 1, 1,
0.8254339, -0.1124288, 1.991773, 0.9686275, 0, 1, 1,
0.8317716, 0.1254596, -0.6000817, 0.972549, 0, 1, 1,
0.8336334, -0.8275457, 1.184829, 0.9803922, 0, 1, 1,
0.8356254, 1.094963, 1.721124, 0.9843137, 0, 1, 1,
0.83597, 1.943267, 1.792097, 0.9921569, 0, 1, 1,
0.8441457, 1.071212, 1.745725, 0.9960784, 0, 1, 1,
0.8503569, 0.3163489, 1.714196, 1, 0, 0.9960784, 1,
0.8503621, 0.4394146, 0.1489719, 1, 0, 0.9882353, 1,
0.8528069, -1.064207, 1.226668, 1, 0, 0.9843137, 1,
0.8578991, 1.207564, 0.9498507, 1, 0, 0.9764706, 1,
0.8705534, 0.7310822, 0.8948818, 1, 0, 0.972549, 1,
0.871152, -1.072688, 2.928478, 1, 0, 0.9647059, 1,
0.8754771, 0.4140382, 0.8293923, 1, 0, 0.9607843, 1,
0.8766268, 0.5907883, 1.494293, 1, 0, 0.9529412, 1,
0.8874648, 0.5124511, 1.826693, 1, 0, 0.9490196, 1,
0.8878731, 1.351811, -0.1705829, 1, 0, 0.9411765, 1,
0.8908905, 2.173975, -0.8927833, 1, 0, 0.9372549, 1,
0.8967518, 0.05309166, 0.9013403, 1, 0, 0.9294118, 1,
0.8975208, 0.368589, 3.364026, 1, 0, 0.9254902, 1,
0.8991496, 0.4131102, 0.5447848, 1, 0, 0.9176471, 1,
0.9002908, -0.747261, 0.8040012, 1, 0, 0.9137255, 1,
0.9072105, -0.5408785, 1.624008, 1, 0, 0.9058824, 1,
0.9082481, -0.8753499, 2.574527, 1, 0, 0.9019608, 1,
0.9114882, -1.157847, 2.833881, 1, 0, 0.8941177, 1,
0.9127498, 1.326209, 0.2806902, 1, 0, 0.8862745, 1,
0.9170043, -0.05350035, 1.291792, 1, 0, 0.8823529, 1,
0.9189028, 0.04745711, 1.08767, 1, 0, 0.8745098, 1,
0.9205368, 0.105346, 0.7909172, 1, 0, 0.8705882, 1,
0.9241121, 1.946163, 0.5842244, 1, 0, 0.8627451, 1,
0.9337551, -0.9764994, 4.26361, 1, 0, 0.8588235, 1,
0.93875, -0.4320025, 2.066955, 1, 0, 0.8509804, 1,
0.9403189, -0.2796723, 1.719635, 1, 0, 0.8470588, 1,
0.9447699, -1.242838, 1.398266, 1, 0, 0.8392157, 1,
0.9537636, -1.387505, 3.092644, 1, 0, 0.8352941, 1,
0.960326, 0.6328596, 1.276208, 1, 0, 0.827451, 1,
0.9721056, -1.330593, 3.246869, 1, 0, 0.8235294, 1,
0.9757415, 3.000355, 1.088946, 1, 0, 0.8156863, 1,
0.9801403, -2.78777, 2.488031, 1, 0, 0.8117647, 1,
0.9828577, -1.477436, 3.151672, 1, 0, 0.8039216, 1,
0.9828715, -0.1813107, 2.311982, 1, 0, 0.7960784, 1,
0.9857897, 0.824158, 0.9392584, 1, 0, 0.7921569, 1,
0.9858702, -0.4638544, 4.285494, 1, 0, 0.7843137, 1,
0.9882789, 1.30198, 3.462971, 1, 0, 0.7803922, 1,
0.9960839, -0.8611928, 3.140816, 1, 0, 0.772549, 1,
1.012312, 0.3338329, 1.757925, 1, 0, 0.7686275, 1,
1.015904, -0.8441381, 1.558601, 1, 0, 0.7607843, 1,
1.019452, 0.03178453, 1.648152, 1, 0, 0.7568628, 1,
1.020213, 0.4467231, 1.940412, 1, 0, 0.7490196, 1,
1.022162, 0.9922767, 1.357682, 1, 0, 0.7450981, 1,
1.03551, -0.8749553, 2.816149, 1, 0, 0.7372549, 1,
1.057059, 0.8313822, 0.5991745, 1, 0, 0.7333333, 1,
1.064255, 1.863877, -0.004093286, 1, 0, 0.7254902, 1,
1.072867, -0.3998987, 2.360079, 1, 0, 0.7215686, 1,
1.074969, -0.06138058, -0.630515, 1, 0, 0.7137255, 1,
1.089101, 0.5377652, 1.32031, 1, 0, 0.7098039, 1,
1.095538, -0.5868316, 3.216959, 1, 0, 0.7019608, 1,
1.097282, -0.7987492, 2.596032, 1, 0, 0.6941177, 1,
1.099598, -0.7708051, 1.484576, 1, 0, 0.6901961, 1,
1.103658, 0.1575699, 3.147254, 1, 0, 0.682353, 1,
1.109258, -2.540686, 1.927268, 1, 0, 0.6784314, 1,
1.110496, -0.6509279, 4.692362, 1, 0, 0.6705883, 1,
1.117248, -0.339972, 1.361628, 1, 0, 0.6666667, 1,
1.117758, 0.3307863, 0.233954, 1, 0, 0.6588235, 1,
1.123859, -0.1814172, 1.634104, 1, 0, 0.654902, 1,
1.124356, 0.5452224, 2.551212, 1, 0, 0.6470588, 1,
1.132455, 1.728897, 0.7007532, 1, 0, 0.6431373, 1,
1.149335, 0.9012359, 0.08051156, 1, 0, 0.6352941, 1,
1.161514, 0.7297781, 1.827341, 1, 0, 0.6313726, 1,
1.165032, 0.3369695, 0.3930526, 1, 0, 0.6235294, 1,
1.168927, 0.1949835, 0.7538622, 1, 0, 0.6196079, 1,
1.16944, 1.258751, 2.329486, 1, 0, 0.6117647, 1,
1.178518, 0.3900939, 0.006101458, 1, 0, 0.6078432, 1,
1.189629, -0.4215606, 1.921823, 1, 0, 0.6, 1,
1.190949, 0.8156398, 1.834418, 1, 0, 0.5921569, 1,
1.19277, -0.5863019, 2.768902, 1, 0, 0.5882353, 1,
1.197655, 0.7991056, 0.1682604, 1, 0, 0.5803922, 1,
1.198768, 0.102015, 2.178384, 1, 0, 0.5764706, 1,
1.199034, -1.134115, 2.251662, 1, 0, 0.5686275, 1,
1.199412, -0.4161457, 1.632823, 1, 0, 0.5647059, 1,
1.20033, 0.4480006, 0.9232827, 1, 0, 0.5568628, 1,
1.211669, -0.3224351, -0.3734006, 1, 0, 0.5529412, 1,
1.215818, -0.1418297, 0.871689, 1, 0, 0.5450981, 1,
1.226434, 0.3582786, 1.102992, 1, 0, 0.5411765, 1,
1.242569, -1.171098, 3.146645, 1, 0, 0.5333334, 1,
1.244375, 1.471367, 1.009384, 1, 0, 0.5294118, 1,
1.244428, -0.5217927, 3.544398, 1, 0, 0.5215687, 1,
1.245948, -0.4924924, 2.16715, 1, 0, 0.5176471, 1,
1.247024, -0.869608, 2.302018, 1, 0, 0.509804, 1,
1.248957, -2.740863, 4.223074, 1, 0, 0.5058824, 1,
1.250004, 0.8094567, 0.07051831, 1, 0, 0.4980392, 1,
1.256371, 0.04311037, 0.075716, 1, 0, 0.4901961, 1,
1.258294, 0.7825972, -0.011736, 1, 0, 0.4862745, 1,
1.266542, -0.0786301, 1.53536, 1, 0, 0.4784314, 1,
1.273014, 0.1104531, 2.020416, 1, 0, 0.4745098, 1,
1.273685, 1.177598, 1.984441, 1, 0, 0.4666667, 1,
1.282554, 0.01784017, 2.900031, 1, 0, 0.4627451, 1,
1.285106, 0.7118338, 0.857663, 1, 0, 0.454902, 1,
1.293601, -0.299998, 0.4293729, 1, 0, 0.4509804, 1,
1.29919, 1.112032, 1.476128, 1, 0, 0.4431373, 1,
1.306505, -1.07721, 2.616959, 1, 0, 0.4392157, 1,
1.307871, -1.461683, 2.918799, 1, 0, 0.4313726, 1,
1.314983, -0.9065016, 1.638016, 1, 0, 0.427451, 1,
1.315413, -0.4833921, 1.665306, 1, 0, 0.4196078, 1,
1.322239, 1.625788, 1.079447, 1, 0, 0.4156863, 1,
1.329974, -0.04777537, 0.8789128, 1, 0, 0.4078431, 1,
1.330525, 1.178263, 0.8704961, 1, 0, 0.4039216, 1,
1.342314, 1.101882, 1.409631, 1, 0, 0.3960784, 1,
1.345967, 2.528939, 0.4959304, 1, 0, 0.3882353, 1,
1.356294, -0.6620924, 0.8556212, 1, 0, 0.3843137, 1,
1.356851, 0.9457221, 1.660701, 1, 0, 0.3764706, 1,
1.370009, -0.04882731, 3.760805, 1, 0, 0.372549, 1,
1.388993, -1.524076, 1.361565, 1, 0, 0.3647059, 1,
1.416654, -0.3765063, 1.437246, 1, 0, 0.3607843, 1,
1.428271, 1.797748, -0.7225686, 1, 0, 0.3529412, 1,
1.4303, -2.281591, 1.472537, 1, 0, 0.3490196, 1,
1.437372, 0.4628558, 1.31571, 1, 0, 0.3411765, 1,
1.44314, 1.484589, 0.4247357, 1, 0, 0.3372549, 1,
1.454515, -0.7126431, 0.7090831, 1, 0, 0.3294118, 1,
1.462659, -1.500504, 2.311178, 1, 0, 0.3254902, 1,
1.468059, -1.01433, 1.647711, 1, 0, 0.3176471, 1,
1.478536, 0.6772334, 0.1156112, 1, 0, 0.3137255, 1,
1.480689, -0.6281016, 2.346496, 1, 0, 0.3058824, 1,
1.520653, -0.6993082, 3.250172, 1, 0, 0.2980392, 1,
1.522588, 0.2792777, 0.8502129, 1, 0, 0.2941177, 1,
1.530884, 0.6286744, 0.9361411, 1, 0, 0.2862745, 1,
1.570979, -0.9980682, 4.059855, 1, 0, 0.282353, 1,
1.576203, -1.682855, 2.409708, 1, 0, 0.2745098, 1,
1.591056, -0.4521934, 0.6866039, 1, 0, 0.2705882, 1,
1.604198, 0.4221078, 2.770356, 1, 0, 0.2627451, 1,
1.6144, -1.000976, 1.713438, 1, 0, 0.2588235, 1,
1.637663, 0.3352436, 1.405887, 1, 0, 0.2509804, 1,
1.644348, -1.098525, 1.701025, 1, 0, 0.2470588, 1,
1.648566, 0.8598377, 0.6898661, 1, 0, 0.2392157, 1,
1.663623, -0.9227974, 3.198555, 1, 0, 0.2352941, 1,
1.667925, -0.223568, 2.023544, 1, 0, 0.227451, 1,
1.706114, -0.9052093, 1.002018, 1, 0, 0.2235294, 1,
1.736781, 0.2416452, 1.955209, 1, 0, 0.2156863, 1,
1.798385, 1.533938, 0.7667361, 1, 0, 0.2117647, 1,
1.812953, 1.728065, 0.05868546, 1, 0, 0.2039216, 1,
1.817522, 0.5382254, 1.602809, 1, 0, 0.1960784, 1,
1.860628, 0.7653796, 1.393689, 1, 0, 0.1921569, 1,
1.874764, 0.9202111, 0.5446879, 1, 0, 0.1843137, 1,
1.882144, 0.3551986, -0.1557037, 1, 0, 0.1803922, 1,
1.88696, -2.139954, 3.239502, 1, 0, 0.172549, 1,
1.888854, -0.06510425, 3.342129, 1, 0, 0.1686275, 1,
1.89879, -0.6355264, 1.658753, 1, 0, 0.1607843, 1,
1.91336, 1.388872, -0.2645254, 1, 0, 0.1568628, 1,
1.917227, -0.5235455, 2.282076, 1, 0, 0.1490196, 1,
1.928895, 2.360155, 0.08717154, 1, 0, 0.145098, 1,
1.954726, 0.8583707, 0.6787593, 1, 0, 0.1372549, 1,
1.966199, 0.5235296, 2.484043, 1, 0, 0.1333333, 1,
1.975746, -0.5087405, 0.8092477, 1, 0, 0.1254902, 1,
1.985413, 0.5162653, 0.2853486, 1, 0, 0.1215686, 1,
1.995144, 0.2997849, 1.843109, 1, 0, 0.1137255, 1,
2.028339, 1.212096, -0.162377, 1, 0, 0.1098039, 1,
2.033208, -1.266021, 1.879498, 1, 0, 0.1019608, 1,
2.114391, 1.539824, 2.584595, 1, 0, 0.09411765, 1,
2.137392, 1.440092, 0.2657519, 1, 0, 0.09019608, 1,
2.14794, 1.060112, -0.3946904, 1, 0, 0.08235294, 1,
2.159093, 0.9230643, 0.2834347, 1, 0, 0.07843138, 1,
2.166672, 1.952833, 0.5542812, 1, 0, 0.07058824, 1,
2.20116, 0.6962191, 1.682045, 1, 0, 0.06666667, 1,
2.201631, -0.3664586, 2.100121, 1, 0, 0.05882353, 1,
2.238174, 0.7435829, 0.9896975, 1, 0, 0.05490196, 1,
2.340472, -1.562282, 2.908331, 1, 0, 0.04705882, 1,
2.404314, -0.363958, -0.1010252, 1, 0, 0.04313726, 1,
2.433733, -0.05691832, 1.904306, 1, 0, 0.03529412, 1,
2.437137, -0.7431759, 1.463328, 1, 0, 0.03137255, 1,
2.48999, -0.7252237, 1.926237, 1, 0, 0.02352941, 1,
2.61364, 0.7839596, 2.660641, 1, 0, 0.01960784, 1,
2.718539, 1.173033, 2.538002, 1, 0, 0.01176471, 1,
3.452954, 0.03775085, 1.99435, 1, 0, 0.007843138, 1
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
0.1162829, -4.026599, -7.086261, 0, -0.5, 0.5, 0.5,
0.1162829, -4.026599, -7.086261, 1, -0.5, 0.5, 0.5,
0.1162829, -4.026599, -7.086261, 1, 1.5, 0.5, 0.5,
0.1162829, -4.026599, -7.086261, 0, 1.5, 0.5, 0.5
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
-4.35152, 0.06416023, -7.086261, 0, -0.5, 0.5, 0.5,
-4.35152, 0.06416023, -7.086261, 1, -0.5, 0.5, 0.5,
-4.35152, 0.06416023, -7.086261, 1, 1.5, 0.5, 0.5,
-4.35152, 0.06416023, -7.086261, 0, 1.5, 0.5, 0.5
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
-4.35152, -4.026599, -0.1921928, 0, -0.5, 0.5, 0.5,
-4.35152, -4.026599, -0.1921928, 1, -0.5, 0.5, 0.5,
-4.35152, -4.026599, -0.1921928, 1, 1.5, 0.5, 0.5,
-4.35152, -4.026599, -0.1921928, 0, 1.5, 0.5, 0.5
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
-3, -3.082578, -5.495322,
3, -3.082578, -5.495322,
-3, -3.082578, -5.495322,
-3, -3.239915, -5.760478,
-2, -3.082578, -5.495322,
-2, -3.239915, -5.760478,
-1, -3.082578, -5.495322,
-1, -3.239915, -5.760478,
0, -3.082578, -5.495322,
0, -3.239915, -5.760478,
1, -3.082578, -5.495322,
1, -3.239915, -5.760478,
2, -3.082578, -5.495322,
2, -3.239915, -5.760478,
3, -3.082578, -5.495322,
3, -3.239915, -5.760478
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
-3, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
-3, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
-3, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
-3, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5,
-2, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
-2, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
-2, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
-2, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5,
-1, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
-1, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
-1, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
-1, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5,
0, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
0, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
0, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
0, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5,
1, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
1, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
1, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
1, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5,
2, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
2, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
2, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
2, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5,
3, -3.554589, -6.290791, 0, -0.5, 0.5, 0.5,
3, -3.554589, -6.290791, 1, -0.5, 0.5, 0.5,
3, -3.554589, -6.290791, 1, 1.5, 0.5, 0.5,
3, -3.554589, -6.290791, 0, 1.5, 0.5, 0.5
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
-3.320488, -2, -5.495322,
-3.320488, 3, -5.495322,
-3.320488, -2, -5.495322,
-3.492327, -2, -5.760478,
-3.320488, -1, -5.495322,
-3.492327, -1, -5.760478,
-3.320488, 0, -5.495322,
-3.492327, 0, -5.760478,
-3.320488, 1, -5.495322,
-3.492327, 1, -5.760478,
-3.320488, 2, -5.495322,
-3.492327, 2, -5.760478,
-3.320488, 3, -5.495322,
-3.492327, 3, -5.760478
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
-3.836004, -2, -6.290791, 0, -0.5, 0.5, 0.5,
-3.836004, -2, -6.290791, 1, -0.5, 0.5, 0.5,
-3.836004, -2, -6.290791, 1, 1.5, 0.5, 0.5,
-3.836004, -2, -6.290791, 0, 1.5, 0.5, 0.5,
-3.836004, -1, -6.290791, 0, -0.5, 0.5, 0.5,
-3.836004, -1, -6.290791, 1, -0.5, 0.5, 0.5,
-3.836004, -1, -6.290791, 1, 1.5, 0.5, 0.5,
-3.836004, -1, -6.290791, 0, 1.5, 0.5, 0.5,
-3.836004, 0, -6.290791, 0, -0.5, 0.5, 0.5,
-3.836004, 0, -6.290791, 1, -0.5, 0.5, 0.5,
-3.836004, 0, -6.290791, 1, 1.5, 0.5, 0.5,
-3.836004, 0, -6.290791, 0, 1.5, 0.5, 0.5,
-3.836004, 1, -6.290791, 0, -0.5, 0.5, 0.5,
-3.836004, 1, -6.290791, 1, -0.5, 0.5, 0.5,
-3.836004, 1, -6.290791, 1, 1.5, 0.5, 0.5,
-3.836004, 1, -6.290791, 0, 1.5, 0.5, 0.5,
-3.836004, 2, -6.290791, 0, -0.5, 0.5, 0.5,
-3.836004, 2, -6.290791, 1, -0.5, 0.5, 0.5,
-3.836004, 2, -6.290791, 1, 1.5, 0.5, 0.5,
-3.836004, 2, -6.290791, 0, 1.5, 0.5, 0.5,
-3.836004, 3, -6.290791, 0, -0.5, 0.5, 0.5,
-3.836004, 3, -6.290791, 1, -0.5, 0.5, 0.5,
-3.836004, 3, -6.290791, 1, 1.5, 0.5, 0.5,
-3.836004, 3, -6.290791, 0, 1.5, 0.5, 0.5
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
-3.320488, -3.082578, -4,
-3.320488, -3.082578, 4,
-3.320488, -3.082578, -4,
-3.492327, -3.239915, -4,
-3.320488, -3.082578, -2,
-3.492327, -3.239915, -2,
-3.320488, -3.082578, 0,
-3.492327, -3.239915, 0,
-3.320488, -3.082578, 2,
-3.492327, -3.239915, 2,
-3.320488, -3.082578, 4,
-3.492327, -3.239915, 4
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
-3.836004, -3.554589, -4, 0, -0.5, 0.5, 0.5,
-3.836004, -3.554589, -4, 1, -0.5, 0.5, 0.5,
-3.836004, -3.554589, -4, 1, 1.5, 0.5, 0.5,
-3.836004, -3.554589, -4, 0, 1.5, 0.5, 0.5,
-3.836004, -3.554589, -2, 0, -0.5, 0.5, 0.5,
-3.836004, -3.554589, -2, 1, -0.5, 0.5, 0.5,
-3.836004, -3.554589, -2, 1, 1.5, 0.5, 0.5,
-3.836004, -3.554589, -2, 0, 1.5, 0.5, 0.5,
-3.836004, -3.554589, 0, 0, -0.5, 0.5, 0.5,
-3.836004, -3.554589, 0, 1, -0.5, 0.5, 0.5,
-3.836004, -3.554589, 0, 1, 1.5, 0.5, 0.5,
-3.836004, -3.554589, 0, 0, 1.5, 0.5, 0.5,
-3.836004, -3.554589, 2, 0, -0.5, 0.5, 0.5,
-3.836004, -3.554589, 2, 1, -0.5, 0.5, 0.5,
-3.836004, -3.554589, 2, 1, 1.5, 0.5, 0.5,
-3.836004, -3.554589, 2, 0, 1.5, 0.5, 0.5,
-3.836004, -3.554589, 4, 0, -0.5, 0.5, 0.5,
-3.836004, -3.554589, 4, 1, -0.5, 0.5, 0.5,
-3.836004, -3.554589, 4, 1, 1.5, 0.5, 0.5,
-3.836004, -3.554589, 4, 0, 1.5, 0.5, 0.5
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
-3.320488, -3.082578, -5.495322,
-3.320488, 3.210898, -5.495322,
-3.320488, -3.082578, 5.110936,
-3.320488, 3.210898, 5.110936,
-3.320488, -3.082578, -5.495322,
-3.320488, -3.082578, 5.110936,
-3.320488, 3.210898, -5.495322,
-3.320488, 3.210898, 5.110936,
-3.320488, -3.082578, -5.495322,
3.553054, -3.082578, -5.495322,
-3.320488, -3.082578, 5.110936,
3.553054, -3.082578, 5.110936,
-3.320488, 3.210898, -5.495322,
3.553054, 3.210898, -5.495322,
-3.320488, 3.210898, 5.110936,
3.553054, 3.210898, 5.110936,
3.553054, -3.082578, -5.495322,
3.553054, 3.210898, -5.495322,
3.553054, -3.082578, 5.110936,
3.553054, 3.210898, 5.110936,
3.553054, -3.082578, -5.495322,
3.553054, -3.082578, 5.110936,
3.553054, 3.210898, -5.495322,
3.553054, 3.210898, 5.110936
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
var radius = 7.539272;
var distance = 33.54308;
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
mvMatrix.translate( -0.1162829, -0.06416023, 0.1921928 );
mvMatrix.scale( 1.18594, 1.295247, 0.7685659 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54308);
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
benoxacor<-read.table("benoxacor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benoxacor$V2
```

```
## Error in eval(expr, envir, enclos): object 'benoxacor' not found
```

```r
y<-benoxacor$V3
```

```
## Error in eval(expr, envir, enclos): object 'benoxacor' not found
```

```r
z<-benoxacor$V4
```

```
## Error in eval(expr, envir, enclos): object 'benoxacor' not found
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
-3.220388, -0.5459492, -2.572989, 0, 0, 1, 1, 1,
-3.216825, 0.3803781, -0.6523763, 1, 0, 0, 1, 1,
-3.137269, -0.4612072, -1.741419, 1, 0, 0, 1, 1,
-3.034328, -0.1162787, -1.391304, 1, 0, 0, 1, 1,
-3.030957, 0.5705512, -0.42118, 1, 0, 0, 1, 1,
-2.972923, 0.09399715, -1.049728, 1, 0, 0, 1, 1,
-2.798593, -1.425008, -2.389293, 0, 0, 0, 1, 1,
-2.786227, 0.04421492, 0.9344983, 0, 0, 0, 1, 1,
-2.64858, -1.037838, -2.170073, 0, 0, 0, 1, 1,
-2.627316, 0.01953101, -1.795322, 0, 0, 0, 1, 1,
-2.624262, 1.416131, -0.925166, 0, 0, 0, 1, 1,
-2.437106, -2.420016, -1.358488, 0, 0, 0, 1, 1,
-2.349827, -1.288634, -1.978375, 0, 0, 0, 1, 1,
-2.30442, 0.8658653, -2.086085, 1, 1, 1, 1, 1,
-2.253657, -1.136608, -2.288281, 1, 1, 1, 1, 1,
-2.196406, -0.6624084, -1.66773, 1, 1, 1, 1, 1,
-2.185671, 1.13192, -1.788536, 1, 1, 1, 1, 1,
-2.159277, -1.836293, -1.946206, 1, 1, 1, 1, 1,
-2.152428, -0.03489147, -1.226017, 1, 1, 1, 1, 1,
-2.152352, -0.2437061, -1.806204, 1, 1, 1, 1, 1,
-2.131818, -0.5533113, -0.1579518, 1, 1, 1, 1, 1,
-2.051022, 0.6080303, -1.384739, 1, 1, 1, 1, 1,
-2.044936, 0.1833525, 0.01498067, 1, 1, 1, 1, 1,
-2.009418, 1.398353, 0.3664183, 1, 1, 1, 1, 1,
-1.968758, 0.4065307, -2.439, 1, 1, 1, 1, 1,
-1.964523, 1.06549, -1.92487, 1, 1, 1, 1, 1,
-1.960501, -0.2650691, -2.474653, 1, 1, 1, 1, 1,
-1.959163, 0.3693936, -1.888619, 1, 1, 1, 1, 1,
-1.950639, 0.6751165, -0.9069989, 0, 0, 1, 1, 1,
-1.937947, 0.2514339, -0.6754094, 1, 0, 0, 1, 1,
-1.936449, -1.392104, -2.887047, 1, 0, 0, 1, 1,
-1.917712, 0.2823377, -1.759533, 1, 0, 0, 1, 1,
-1.856663, -0.007395655, -1.956746, 1, 0, 0, 1, 1,
-1.856034, -0.01991582, -1.642375, 1, 0, 0, 1, 1,
-1.781587, -1.033723, -1.512084, 0, 0, 0, 1, 1,
-1.781164, 1.511526, -1.019048, 0, 0, 0, 1, 1,
-1.77986, -1.64506, -3.273936, 0, 0, 0, 1, 1,
-1.778094, 0.07377493, -2.211545, 0, 0, 0, 1, 1,
-1.772964, 0.6348435, -1.042509, 0, 0, 0, 1, 1,
-1.756187, 0.6928231, -4.066609, 0, 0, 0, 1, 1,
-1.74539, -0.5761382, -2.957056, 0, 0, 0, 1, 1,
-1.745129, 2.43435, -0.4653116, 1, 1, 1, 1, 1,
-1.716924, 0.9631128, -1.985038, 1, 1, 1, 1, 1,
-1.696017, 0.9248744, -1.20822, 1, 1, 1, 1, 1,
-1.690981, 1.678585, -2.80239, 1, 1, 1, 1, 1,
-1.675271, 0.3632728, -0.9798513, 1, 1, 1, 1, 1,
-1.664973, -0.2399232, -1.497407, 1, 1, 1, 1, 1,
-1.626673, -0.6130208, -2.350836, 1, 1, 1, 1, 1,
-1.626614, -0.2770251, -0.8618084, 1, 1, 1, 1, 1,
-1.623618, 0.575507, -0.5523846, 1, 1, 1, 1, 1,
-1.617582, -0.1239161, -3.046318, 1, 1, 1, 1, 1,
-1.608896, -0.01943398, -1.380029, 1, 1, 1, 1, 1,
-1.605349, -0.2428143, -2.268981, 1, 1, 1, 1, 1,
-1.591553, -0.2296309, -0.9944412, 1, 1, 1, 1, 1,
-1.590957, 0.08887008, 0.6830361, 1, 1, 1, 1, 1,
-1.579297, -0.4877202, -0.9785619, 1, 1, 1, 1, 1,
-1.560878, -0.7793783, -1.090636, 0, 0, 1, 1, 1,
-1.55888, -0.0638276, -0.9097475, 1, 0, 0, 1, 1,
-1.557204, -0.2706233, -0.7085502, 1, 0, 0, 1, 1,
-1.551191, -0.3032885, -0.6774555, 1, 0, 0, 1, 1,
-1.550799, 0.7354082, -1.333518, 1, 0, 0, 1, 1,
-1.549403, 0.4731793, -1.253382, 1, 0, 0, 1, 1,
-1.536659, -1.113716, -3.587205, 0, 0, 0, 1, 1,
-1.533694, -0.1956023, -0.4668682, 0, 0, 0, 1, 1,
-1.510747, 0.6271249, -1.941643, 0, 0, 0, 1, 1,
-1.508247, 1.910381, 0.05859584, 0, 0, 0, 1, 1,
-1.495199, -0.6411943, 0.444391, 0, 0, 0, 1, 1,
-1.493672, 0.3592987, -0.9490703, 0, 0, 0, 1, 1,
-1.487459, -0.3078995, -2.568117, 0, 0, 0, 1, 1,
-1.487343, 0.4824632, -1.432193, 1, 1, 1, 1, 1,
-1.471849, 0.2599707, -2.821515, 1, 1, 1, 1, 1,
-1.467383, 0.4639334, -1.806911, 1, 1, 1, 1, 1,
-1.458212, -1.838372, -2.303951, 1, 1, 1, 1, 1,
-1.449255, 0.2259458, -4.169694, 1, 1, 1, 1, 1,
-1.444584, 1.431674, 0.4019516, 1, 1, 1, 1, 1,
-1.441225, 0.346358, -1.57786, 1, 1, 1, 1, 1,
-1.432472, 0.3516157, -2.020406, 1, 1, 1, 1, 1,
-1.421271, -0.2044076, -3.188354, 1, 1, 1, 1, 1,
-1.41832, -0.04323153, -3.226069, 1, 1, 1, 1, 1,
-1.417538, 1.957136, -1.921373, 1, 1, 1, 1, 1,
-1.416958, -0.7453859, -2.895408, 1, 1, 1, 1, 1,
-1.410226, -0.3488928, -0.415993, 1, 1, 1, 1, 1,
-1.408409, 1.468404, -0.7918584, 1, 1, 1, 1, 1,
-1.403934, -0.9089094, -2.76354, 1, 1, 1, 1, 1,
-1.394068, -1.365534, -2.020307, 0, 0, 1, 1, 1,
-1.38285, -0.4758581, -2.920446, 1, 0, 0, 1, 1,
-1.372725, 1.061573, -2.17682, 1, 0, 0, 1, 1,
-1.370358, -0.7770678, -1.619856, 1, 0, 0, 1, 1,
-1.36281, 0.5655506, -3.274475, 1, 0, 0, 1, 1,
-1.36054, -0.1602593, -1.334054, 1, 0, 0, 1, 1,
-1.353629, -0.7379629, -2.150623, 0, 0, 0, 1, 1,
-1.346972, -1.434562, -0.9278338, 0, 0, 0, 1, 1,
-1.343119, 1.587197, -0.1335226, 0, 0, 0, 1, 1,
-1.342338, 0.2704788, -0.8647671, 0, 0, 0, 1, 1,
-1.341694, -0.3534413, -3.387631, 0, 0, 0, 1, 1,
-1.325739, -0.6658365, -1.553165, 0, 0, 0, 1, 1,
-1.317459, 1.629526, -1.213549, 0, 0, 0, 1, 1,
-1.312393, -0.7026611, 0.03265318, 1, 1, 1, 1, 1,
-1.311454, 0.6652008, 0.5346025, 1, 1, 1, 1, 1,
-1.310381, 1.193448, -1.092441, 1, 1, 1, 1, 1,
-1.289554, 0.8630041, -1.089414, 1, 1, 1, 1, 1,
-1.281399, -0.3809068, -1.716628, 1, 1, 1, 1, 1,
-1.281376, -1.020999, -1.928427, 1, 1, 1, 1, 1,
-1.279699, 1.275465, -0.7151159, 1, 1, 1, 1, 1,
-1.27941, 0.1722497, -1.888236, 1, 1, 1, 1, 1,
-1.270455, -0.8875093, -2.556191, 1, 1, 1, 1, 1,
-1.265996, -0.1094553, -1.675085, 1, 1, 1, 1, 1,
-1.262602, 0.1920767, -0.6941413, 1, 1, 1, 1, 1,
-1.24856, 1.050538, -2.69639, 1, 1, 1, 1, 1,
-1.234687, 1.129003, 2.054014, 1, 1, 1, 1, 1,
-1.23441, -0.3618349, -2.708227, 1, 1, 1, 1, 1,
-1.229658, 3.119246, 0.782086, 1, 1, 1, 1, 1,
-1.22852, 0.5574768, -0.3371465, 0, 0, 1, 1, 1,
-1.223347, 0.4581997, -3.844023, 1, 0, 0, 1, 1,
-1.222177, -0.3884322, -1.961683, 1, 0, 0, 1, 1,
-1.216902, -0.6868361, -1.836856, 1, 0, 0, 1, 1,
-1.212555, 1.031796, -0.3960896, 1, 0, 0, 1, 1,
-1.209107, 0.7540784, -1.780256, 1, 0, 0, 1, 1,
-1.201255, 0.0681604, -2.701947, 0, 0, 0, 1, 1,
-1.196581, -1.813431, -3.994102, 0, 0, 0, 1, 1,
-1.194691, -0.3457088, -0.6810175, 0, 0, 0, 1, 1,
-1.191069, -0.2885393, -2.926266, 0, 0, 0, 1, 1,
-1.185348, 0.1835468, -3.499868, 0, 0, 0, 1, 1,
-1.173746, 0.85644, -2.163123, 0, 0, 0, 1, 1,
-1.164813, 1.388647, -0.9331804, 0, 0, 0, 1, 1,
-1.148504, -0.8272845, 0.6328309, 1, 1, 1, 1, 1,
-1.145948, 1.282362, -1.597234, 1, 1, 1, 1, 1,
-1.141899, -1.069186, -3.831173, 1, 1, 1, 1, 1,
-1.139137, 0.3643041, -0.8981363, 1, 1, 1, 1, 1,
-1.135192, 0.3150763, -2.373879, 1, 1, 1, 1, 1,
-1.130952, 0.929867, 0.9222299, 1, 1, 1, 1, 1,
-1.13064, 0.2211252, -4.784264, 1, 1, 1, 1, 1,
-1.112556, -1.364303, -2.381783, 1, 1, 1, 1, 1,
-1.106266, 0.04459804, -2.387041, 1, 1, 1, 1, 1,
-1.102885, -0.9642465, -0.8158856, 1, 1, 1, 1, 1,
-1.101273, -0.4457229, -0.6266721, 1, 1, 1, 1, 1,
-1.094911, -0.09432333, -3.017999, 1, 1, 1, 1, 1,
-1.093398, 0.2286941, -3.002945, 1, 1, 1, 1, 1,
-1.093217, 0.7935195, -0.4145914, 1, 1, 1, 1, 1,
-1.088526, 0.1187776, 0.8261907, 1, 1, 1, 1, 1,
-1.078434, -1.368997, -3.171037, 0, 0, 1, 1, 1,
-1.069314, 0.8936163, -1.929619, 1, 0, 0, 1, 1,
-1.067021, 0.8544974, -1.983889, 1, 0, 0, 1, 1,
-1.066507, -0.5612223, -0.8433878, 1, 0, 0, 1, 1,
-1.063769, 0.2321932, -2.550997, 1, 0, 0, 1, 1,
-1.058124, 0.2719847, -1.349192, 1, 0, 0, 1, 1,
-1.057824, 1.414285, -0.7752592, 0, 0, 0, 1, 1,
-1.054314, 0.397583, -2.456487, 0, 0, 0, 1, 1,
-1.053733, 0.3956293, -2.810477, 0, 0, 0, 1, 1,
-1.051528, -0.8307815, -1.612146, 0, 0, 0, 1, 1,
-1.048807, -0.7101671, -2.205746, 0, 0, 0, 1, 1,
-1.046255, -0.6079543, -3.775003, 0, 0, 0, 1, 1,
-1.040995, 0.01977691, -0.2036381, 0, 0, 0, 1, 1,
-1.038169, 0.1697504, -2.443056, 1, 1, 1, 1, 1,
-1.035332, -2.062973, -4.147872, 1, 1, 1, 1, 1,
-1.031796, -0.1118249, -0.9248727, 1, 1, 1, 1, 1,
-1.03032, -0.7507349, -1.109905, 1, 1, 1, 1, 1,
-1.028558, 1.310176, -1.976545, 1, 1, 1, 1, 1,
-1.013454, 0.7023343, -0.008878856, 1, 1, 1, 1, 1,
-1.012016, -0.5231938, -0.2707847, 1, 1, 1, 1, 1,
-1.000302, 0.455722, -0.04277544, 1, 1, 1, 1, 1,
-0.9944845, 0.6249008, -0.7962742, 1, 1, 1, 1, 1,
-0.9934995, -0.2059127, -2.042401, 1, 1, 1, 1, 1,
-0.9924756, -0.07240722, -1.361465, 1, 1, 1, 1, 1,
-0.9910662, 2.252941, -1.400641, 1, 1, 1, 1, 1,
-0.9864476, -0.3757573, -1.315294, 1, 1, 1, 1, 1,
-0.9858528, 1.084777, -2.200591, 1, 1, 1, 1, 1,
-0.9854692, -1.053477, -2.299764, 1, 1, 1, 1, 1,
-0.9812397, 0.320998, -0.6079827, 0, 0, 1, 1, 1,
-0.9744231, 0.02782165, -1.142904, 1, 0, 0, 1, 1,
-0.9724746, -2.221508, -2.08286, 1, 0, 0, 1, 1,
-0.9662703, -0.06566195, -2.155334, 1, 0, 0, 1, 1,
-0.9652787, 1.195569, -1.984822, 1, 0, 0, 1, 1,
-0.9573641, -1.403826, -2.00114, 1, 0, 0, 1, 1,
-0.9553877, -0.7971875, -2.507928, 0, 0, 0, 1, 1,
-0.9539188, 0.4141527, -1.81759, 0, 0, 0, 1, 1,
-0.9472778, -0.4447069, -2.782252, 0, 0, 0, 1, 1,
-0.946505, 0.7916523, -2.534897, 0, 0, 0, 1, 1,
-0.9450717, 1.393495, -2.364917, 0, 0, 0, 1, 1,
-0.9439555, 0.4379211, -1.885756, 0, 0, 0, 1, 1,
-0.9430583, -1.535255, -3.313304, 0, 0, 0, 1, 1,
-0.9339098, 1.121967, 0.3577645, 1, 1, 1, 1, 1,
-0.9327475, 1.486358, -0.6023867, 1, 1, 1, 1, 1,
-0.9263596, 1.385912, -0.9104104, 1, 1, 1, 1, 1,
-0.9236832, 0.7946467, -0.8905234, 1, 1, 1, 1, 1,
-0.9218938, 1.102703, -0.6218341, 1, 1, 1, 1, 1,
-0.9181732, 0.9216892, 0.3372744, 1, 1, 1, 1, 1,
-0.9147758, -0.2869169, -2.345937, 1, 1, 1, 1, 1,
-0.9120048, 0.2343498, -0.4283662, 1, 1, 1, 1, 1,
-0.9113855, 0.5411941, 1.21495, 1, 1, 1, 1, 1,
-0.9095855, 1.071844, 0.1013856, 1, 1, 1, 1, 1,
-0.8922418, -0.3330418, -2.527821, 1, 1, 1, 1, 1,
-0.8914972, 0.6500507, -1.832586, 1, 1, 1, 1, 1,
-0.8858346, 0.08850183, -2.72717, 1, 1, 1, 1, 1,
-0.8802904, 1.771196, 1.124441, 1, 1, 1, 1, 1,
-0.8798457, 1.158288, -1.417393, 1, 1, 1, 1, 1,
-0.8779386, 2.286915, -0.9380963, 0, 0, 1, 1, 1,
-0.8744261, -0.3932817, -0.1779305, 1, 0, 0, 1, 1,
-0.8739859, -0.845153, -3.854415, 1, 0, 0, 1, 1,
-0.8713155, 0.151701, -1.22663, 1, 0, 0, 1, 1,
-0.8668518, 0.3402398, 0.08697311, 1, 0, 0, 1, 1,
-0.8655251, -1.385225, -1.14538, 1, 0, 0, 1, 1,
-0.8637993, -0.8286583, -2.445969, 0, 0, 0, 1, 1,
-0.8608728, -1.446918, -2.178094, 0, 0, 0, 1, 1,
-0.8527074, 0.04905736, -1.125218, 0, 0, 0, 1, 1,
-0.8507832, -0.3097334, -2.373952, 0, 0, 0, 1, 1,
-0.846684, -1.027037, -0.8926604, 0, 0, 0, 1, 1,
-0.8444715, 0.5494961, -1.039567, 0, 0, 0, 1, 1,
-0.8434409, -0.6200309, -3.289371, 0, 0, 0, 1, 1,
-0.8428446, 0.6389849, -1.831056, 1, 1, 1, 1, 1,
-0.8385305, 0.5049662, 0.8300181, 1, 1, 1, 1, 1,
-0.8365489, -1.281908, -0.5317233, 1, 1, 1, 1, 1,
-0.8307838, -0.4147294, -1.610873, 1, 1, 1, 1, 1,
-0.8279343, 2.220853, 0.6720707, 1, 1, 1, 1, 1,
-0.8272407, -0.7451904, -1.905529, 1, 1, 1, 1, 1,
-0.8259382, -0.2749372, -0.223085, 1, 1, 1, 1, 1,
-0.8247951, 0.414037, -2.247835, 1, 1, 1, 1, 1,
-0.8216615, 0.7399866, -1.743968, 1, 1, 1, 1, 1,
-0.8196421, -1.824476, -1.276937, 1, 1, 1, 1, 1,
-0.8172199, 0.2556975, -2.037457, 1, 1, 1, 1, 1,
-0.8159246, -1.244613, -1.173327, 1, 1, 1, 1, 1,
-0.8125113, -1.751048, -1.319349, 1, 1, 1, 1, 1,
-0.8103234, 1.674314, -1.02601, 1, 1, 1, 1, 1,
-0.8084676, 1.731335, -0.545166, 1, 1, 1, 1, 1,
-0.804072, 0.1356974, -0.5525809, 0, 0, 1, 1, 1,
-0.7978895, 1.034271, 0.06768054, 1, 0, 0, 1, 1,
-0.7923976, -1.310919, -4.432207, 1, 0, 0, 1, 1,
-0.7898675, -1.755295, -2.002241, 1, 0, 0, 1, 1,
-0.7895347, 0.2185127, -0.842631, 1, 0, 0, 1, 1,
-0.7828295, 0.06600262, 0.03917282, 1, 0, 0, 1, 1,
-0.7808782, -0.4982147, -1.784191, 0, 0, 0, 1, 1,
-0.7742913, 0.9423147, -0.5303616, 0, 0, 0, 1, 1,
-0.7705343, 0.6839523, -0.545735, 0, 0, 0, 1, 1,
-0.7702242, -0.8764607, -2.993164, 0, 0, 0, 1, 1,
-0.7656825, -0.1036374, -3.552075, 0, 0, 0, 1, 1,
-0.7655897, -1.258611, -3.852302, 0, 0, 0, 1, 1,
-0.7631888, 0.02289943, -2.278065, 0, 0, 0, 1, 1,
-0.7620084, 0.7210861, -0.6737317, 1, 1, 1, 1, 1,
-0.7608849, -0.5077764, -0.4798149, 1, 1, 1, 1, 1,
-0.7582886, 0.1976129, -2.812871, 1, 1, 1, 1, 1,
-0.7569472, -0.8289196, -2.784088, 1, 1, 1, 1, 1,
-0.752373, -1.857056, -3.827546, 1, 1, 1, 1, 1,
-0.7498036, -0.6333162, -2.510738, 1, 1, 1, 1, 1,
-0.7497349, -0.6570832, -3.700088, 1, 1, 1, 1, 1,
-0.7478153, 1.116259, -2.601685, 1, 1, 1, 1, 1,
-0.7474477, 0.2163305, -3.170408, 1, 1, 1, 1, 1,
-0.7470986, -0.3772106, -2.259392, 1, 1, 1, 1, 1,
-0.7464449, 0.3771839, 0.09585878, 1, 1, 1, 1, 1,
-0.7444742, 1.623678, -0.9243932, 1, 1, 1, 1, 1,
-0.7428796, -1.418665, -3.757032, 1, 1, 1, 1, 1,
-0.7406217, -0.9849336, -2.145983, 1, 1, 1, 1, 1,
-0.7358276, -0.8560486, -1.367904, 1, 1, 1, 1, 1,
-0.7309349, -0.546358, -2.820516, 0, 0, 1, 1, 1,
-0.7285476, -0.8863055, -0.3654639, 1, 0, 0, 1, 1,
-0.7239088, -0.8175273, -2.694917, 1, 0, 0, 1, 1,
-0.7198319, -0.2586115, -2.104241, 1, 0, 0, 1, 1,
-0.7171464, 0.7050613, 0.3093279, 1, 0, 0, 1, 1,
-0.7169544, 1.937459, -1.629425, 1, 0, 0, 1, 1,
-0.7119703, 1.123865, -0.5002869, 0, 0, 0, 1, 1,
-0.711627, -0.008731501, -1.1473, 0, 0, 0, 1, 1,
-0.7053162, 0.2130544, -0.1802746, 0, 0, 0, 1, 1,
-0.7030038, -0.02781705, -0.6019173, 0, 0, 0, 1, 1,
-0.6996551, 0.6396257, -1.696868, 0, 0, 0, 1, 1,
-0.699209, -1.054961, -2.219889, 0, 0, 0, 1, 1,
-0.6971361, -2.380246, -4.437225, 0, 0, 0, 1, 1,
-0.6921325, -0.4361784, -4.657503, 1, 1, 1, 1, 1,
-0.6743883, 0.191086, -1.253909, 1, 1, 1, 1, 1,
-0.6735839, 0.1853303, -3.392719, 1, 1, 1, 1, 1,
-0.6668524, -0.4827464, -2.334985, 1, 1, 1, 1, 1,
-0.6642708, 0.3199294, -1.616796, 1, 1, 1, 1, 1,
-0.661565, -0.03487322, -0.6991063, 1, 1, 1, 1, 1,
-0.6584121, 0.6508711, -2.243579, 1, 1, 1, 1, 1,
-0.6560561, -0.7014884, -2.484692, 1, 1, 1, 1, 1,
-0.6540369, -0.1406787, -1.247894, 1, 1, 1, 1, 1,
-0.6517449, 0.02724346, -3.398987, 1, 1, 1, 1, 1,
-0.6458052, -0.2660808, -2.688909, 1, 1, 1, 1, 1,
-0.6434085, 0.2332192, -2.011621, 1, 1, 1, 1, 1,
-0.6397004, 0.9730435, -1.518627, 1, 1, 1, 1, 1,
-0.6365111, -2.500455, -2.850445, 1, 1, 1, 1, 1,
-0.6336281, 0.513843, -0.3898846, 1, 1, 1, 1, 1,
-0.6262249, -1.254925, -1.176265, 0, 0, 1, 1, 1,
-0.6247786, -0.430267, -2.167684, 1, 0, 0, 1, 1,
-0.6200492, -0.7988955, -3.024161, 1, 0, 0, 1, 1,
-0.6199196, -0.3185664, -2.10944, 1, 0, 0, 1, 1,
-0.6197905, 0.8846343, -1.242488, 1, 0, 0, 1, 1,
-0.6153567, -1.01746, -3.678329, 1, 0, 0, 1, 1,
-0.6120855, -0.005510657, -1.387418, 0, 0, 0, 1, 1,
-0.609614, 1.918007, 1.068969, 0, 0, 0, 1, 1,
-0.6087247, 0.6006505, 0.7261295, 0, 0, 0, 1, 1,
-0.5988548, -0.3030074, -1.132418, 0, 0, 0, 1, 1,
-0.5956986, -0.03058099, -2.027501, 0, 0, 0, 1, 1,
-0.5956892, 0.3549104, -2.458122, 0, 0, 0, 1, 1,
-0.5952921, -1.022341, -3.585389, 0, 0, 0, 1, 1,
-0.5926704, -1.397993, -3.232286, 1, 1, 1, 1, 1,
-0.5922654, 0.2099866, -1.741188, 1, 1, 1, 1, 1,
-0.5882236, -0.4146872, -2.834811, 1, 1, 1, 1, 1,
-0.5876352, 0.4575732, -0.5732864, 1, 1, 1, 1, 1,
-0.5787539, -1.150506, -2.097978, 1, 1, 1, 1, 1,
-0.5763587, -1.051242, -5.223927, 1, 1, 1, 1, 1,
-0.570092, 2.136123, 0.9033799, 1, 1, 1, 1, 1,
-0.5669913, 1.058182, 1.148934, 1, 1, 1, 1, 1,
-0.5615475, 0.1883328, -2.977684, 1, 1, 1, 1, 1,
-0.5589653, 0.08148094, -2.001615, 1, 1, 1, 1, 1,
-0.5565386, 0.6798366, -1.050676, 1, 1, 1, 1, 1,
-0.5549738, 0.02581978, -2.22631, 1, 1, 1, 1, 1,
-0.553193, 0.06024706, -1.492487, 1, 1, 1, 1, 1,
-0.5497984, -1.396611, -2.856576, 1, 1, 1, 1, 1,
-0.5476173, -0.2820861, -1.97369, 1, 1, 1, 1, 1,
-0.5415515, 0.5868282, -0.2289174, 0, 0, 1, 1, 1,
-0.5366719, 0.2625478, -0.5806885, 1, 0, 0, 1, 1,
-0.5363359, 0.7259731, 0.3203289, 1, 0, 0, 1, 1,
-0.5363121, 0.268233, -0.1826888, 1, 0, 0, 1, 1,
-0.5319044, 0.4907731, 0.7056965, 1, 0, 0, 1, 1,
-0.5318457, 0.09012483, -1.215474, 1, 0, 0, 1, 1,
-0.5317686, -2.480239, -2.117168, 0, 0, 0, 1, 1,
-0.5316014, -0.3667243, -1.195296, 0, 0, 0, 1, 1,
-0.5308858, 0.7893168, 1.401887, 0, 0, 0, 1, 1,
-0.5293723, -1.408542, -4.298365, 0, 0, 0, 1, 1,
-0.5180249, 1.71807, -0.9658858, 0, 0, 0, 1, 1,
-0.5147107, -0.08759609, -2.370486, 0, 0, 0, 1, 1,
-0.5102978, 0.3014819, -2.119746, 0, 0, 0, 1, 1,
-0.5092032, 0.3761173, -1.17757, 1, 1, 1, 1, 1,
-0.5077057, 0.3090064, -0.3316203, 1, 1, 1, 1, 1,
-0.5045657, 1.435759, 0.29739, 1, 1, 1, 1, 1,
-0.5035294, -0.443757, -3.331686, 1, 1, 1, 1, 1,
-0.5013744, -1.131551, -4.1918, 1, 1, 1, 1, 1,
-0.4972117, 0.4370037, -1.31686, 1, 1, 1, 1, 1,
-0.4936647, 1.644976, -2.100374, 1, 1, 1, 1, 1,
-0.4932055, 1.730401, -0.6718095, 1, 1, 1, 1, 1,
-0.4867581, -0.2357281, -2.035493, 1, 1, 1, 1, 1,
-0.4856493, -1.269872, -1.276529, 1, 1, 1, 1, 1,
-0.4781446, -0.3805221, -0.77735, 1, 1, 1, 1, 1,
-0.4737848, -0.1199108, -1.720601, 1, 1, 1, 1, 1,
-0.4723362, -0.4743375, -2.678142, 1, 1, 1, 1, 1,
-0.4695517, -0.1621636, -1.396197, 1, 1, 1, 1, 1,
-0.4661129, -0.2558483, -2.530744, 1, 1, 1, 1, 1,
-0.4645424, -0.5957334, -1.160075, 0, 0, 1, 1, 1,
-0.4637774, 1.143839, -1.686262, 1, 0, 0, 1, 1,
-0.459546, 0.2327585, -0.2490827, 1, 0, 0, 1, 1,
-0.4587094, 0.8313995, 0.3167818, 1, 0, 0, 1, 1,
-0.4581299, -0.4022205, -2.589187, 1, 0, 0, 1, 1,
-0.4580046, -0.3501275, -0.7642278, 1, 0, 0, 1, 1,
-0.4574907, 1.056753, -0.7361765, 0, 0, 0, 1, 1,
-0.4573224, 1.734693, -0.7450706, 0, 0, 0, 1, 1,
-0.4496597, -0.6243826, -2.086089, 0, 0, 0, 1, 1,
-0.4476298, 1.085394, -0.503972, 0, 0, 0, 1, 1,
-0.4384726, 0.4339222, -0.744313, 0, 0, 0, 1, 1,
-0.4356784, -0.8403315, -1.326071, 0, 0, 0, 1, 1,
-0.4241526, 0.5678037, -0.6574451, 0, 0, 0, 1, 1,
-0.4223048, -1.627223, -3.430912, 1, 1, 1, 1, 1,
-0.4173615, -0.8882829, -1.741546, 1, 1, 1, 1, 1,
-0.4140502, -0.3240317, -2.418031, 1, 1, 1, 1, 1,
-0.4112297, 1.086221, -0.8710256, 1, 1, 1, 1, 1,
-0.4110026, -0.07766172, -1.50048, 1, 1, 1, 1, 1,
-0.4067296, -0.2042597, -2.063098, 1, 1, 1, 1, 1,
-0.4040349, -0.8358179, -1.456656, 1, 1, 1, 1, 1,
-0.404015, 1.077512, -0.4549996, 1, 1, 1, 1, 1,
-0.4030589, -1.656166, -0.5104046, 1, 1, 1, 1, 1,
-0.4023086, -0.8303636, -3.333345, 1, 1, 1, 1, 1,
-0.3998937, 0.2067717, -1.871791, 1, 1, 1, 1, 1,
-0.3991296, 1.386643, 0.792882, 1, 1, 1, 1, 1,
-0.394625, -0.2502789, -2.645379, 1, 1, 1, 1, 1,
-0.3941794, 1.530257, -0.2336386, 1, 1, 1, 1, 1,
-0.3938819, -0.8459886, -0.7272978, 1, 1, 1, 1, 1,
-0.3775816, -0.404109, -2.802898, 0, 0, 1, 1, 1,
-0.3774382, -1.406069, -3.285244, 1, 0, 0, 1, 1,
-0.3768124, 0.2539261, -1.789352, 1, 0, 0, 1, 1,
-0.3715248, -0.9082039, -2.340616, 1, 0, 0, 1, 1,
-0.3703346, 1.108355, -0.7626666, 1, 0, 0, 1, 1,
-0.3701958, 1.130263, -0.1715392, 1, 0, 0, 1, 1,
-0.3696843, -0.6856839, -2.825973, 0, 0, 0, 1, 1,
-0.3680203, -0.13658, -2.04417, 0, 0, 0, 1, 1,
-0.3679284, -1.171885, -3.743365, 0, 0, 0, 1, 1,
-0.360463, 0.5299996, -0.06734303, 0, 0, 0, 1, 1,
-0.3476923, 0.48356, -0.7972917, 0, 0, 0, 1, 1,
-0.3443822, -0.1050297, -1.468779, 0, 0, 0, 1, 1,
-0.3421989, -1.627397, -3.526326, 0, 0, 0, 1, 1,
-0.335943, -0.4153838, -0.7637215, 1, 1, 1, 1, 1,
-0.33175, -1.83556, -4.181844, 1, 1, 1, 1, 1,
-0.3295962, 0.3314037, -1.414165, 1, 1, 1, 1, 1,
-0.3292511, -0.03696133, -0.3820168, 1, 1, 1, 1, 1,
-0.3280374, -0.8160765, -4.313898, 1, 1, 1, 1, 1,
-0.326818, 2.088723, 0.2110711, 1, 1, 1, 1, 1,
-0.3261338, 0.2920465, -0.9562749, 1, 1, 1, 1, 1,
-0.3246351, -0.1613163, -1.436058, 1, 1, 1, 1, 1,
-0.3210444, 0.2666833, -1.234785, 1, 1, 1, 1, 1,
-0.3155154, 0.3173561, -0.8632221, 1, 1, 1, 1, 1,
-0.3081377, 2.498989, -0.632936, 1, 1, 1, 1, 1,
-0.3081211, -0.00975446, -3.526556, 1, 1, 1, 1, 1,
-0.3030585, -0.6044633, -2.453103, 1, 1, 1, 1, 1,
-0.2980796, -1.060089, -2.643946, 1, 1, 1, 1, 1,
-0.2979353, -1.08896, -1.259894, 1, 1, 1, 1, 1,
-0.2962186, -1.416216, -4.619576, 0, 0, 1, 1, 1,
-0.2954153, -1.166067, -1.444055, 1, 0, 0, 1, 1,
-0.2949854, -1.205732, -1.950334, 1, 0, 0, 1, 1,
-0.290975, 0.1051762, -1.265613, 1, 0, 0, 1, 1,
-0.2893935, -0.3806333, -3.673871, 1, 0, 0, 1, 1,
-0.2891456, 0.577326, 0.9578031, 1, 0, 0, 1, 1,
-0.2877432, 0.3959571, 0.06076652, 0, 0, 0, 1, 1,
-0.2815788, 0.8760794, -0.5839192, 0, 0, 0, 1, 1,
-0.2778488, -1.414034, -3.236145, 0, 0, 0, 1, 1,
-0.2730254, -0.04668236, -0.7809845, 0, 0, 0, 1, 1,
-0.2717389, -0.008835894, -1.205983, 0, 0, 0, 1, 1,
-0.2705521, -0.6294402, -3.200612, 0, 0, 0, 1, 1,
-0.2680679, 0.3684325, -0.4255826, 0, 0, 0, 1, 1,
-0.2679795, -0.1811086, -0.8928415, 1, 1, 1, 1, 1,
-0.2668521, -1.011454, -2.4407, 1, 1, 1, 1, 1,
-0.2588187, 1.904119, -0.453663, 1, 1, 1, 1, 1,
-0.257339, -0.6406373, -3.157893, 1, 1, 1, 1, 1,
-0.2535077, -0.01127102, -0.3994015, 1, 1, 1, 1, 1,
-0.248396, 0.7889588, -1.594373, 1, 1, 1, 1, 1,
-0.2481705, -0.8031588, -1.296134, 1, 1, 1, 1, 1,
-0.2473275, 0.6910016, -0.05488439, 1, 1, 1, 1, 1,
-0.2426828, 0.9506295, -0.3663754, 1, 1, 1, 1, 1,
-0.2370487, -1.547395, -2.989033, 1, 1, 1, 1, 1,
-0.2337935, 0.4026065, -1.36329, 1, 1, 1, 1, 1,
-0.2324837, 1.481442, 0.7043939, 1, 1, 1, 1, 1,
-0.231542, -1.368323, -4.863244, 1, 1, 1, 1, 1,
-0.2292614, 0.6356252, -1.017447, 1, 1, 1, 1, 1,
-0.2278069, -1.158236, -2.708395, 1, 1, 1, 1, 1,
-0.2256494, 1.408773, -0.5443747, 0, 0, 1, 1, 1,
-0.2219993, 0.4495943, -1.087788, 1, 0, 0, 1, 1,
-0.2199086, -0.6852868, -1.80792, 1, 0, 0, 1, 1,
-0.2191977, 1.431334, -0.8368697, 1, 0, 0, 1, 1,
-0.2113654, -0.4767497, -3.467166, 1, 0, 0, 1, 1,
-0.2112817, -0.7429776, -3.178535, 1, 0, 0, 1, 1,
-0.2087507, 1.466691, 0.5954561, 0, 0, 0, 1, 1,
-0.20816, 1.298736, -1.178295, 0, 0, 0, 1, 1,
-0.2069123, -0.2289973, -1.305076, 0, 0, 0, 1, 1,
-0.2068813, -1.05092, -2.686453, 0, 0, 0, 1, 1,
-0.2035126, 2.015424, 1.102777, 0, 0, 0, 1, 1,
-0.2028244, -0.01434526, -1.841714, 0, 0, 0, 1, 1,
-0.2024962, 0.6149004, -0.9322873, 0, 0, 0, 1, 1,
-0.2003313, -0.1493524, -2.046716, 1, 1, 1, 1, 1,
-0.1998646, -1.354272, -3.937145, 1, 1, 1, 1, 1,
-0.1998537, 0.2069851, -0.4828273, 1, 1, 1, 1, 1,
-0.1911757, -0.1383419, -2.556885, 1, 1, 1, 1, 1,
-0.1825358, -0.5571321, -3.009538, 1, 1, 1, 1, 1,
-0.1810352, 0.3849317, -0.05926283, 1, 1, 1, 1, 1,
-0.1762689, 1.191453, -1.918441, 1, 1, 1, 1, 1,
-0.1757046, -1.183163, -2.788291, 1, 1, 1, 1, 1,
-0.1755252, 0.5857353, 0.5308115, 1, 1, 1, 1, 1,
-0.1746339, 0.2064198, -0.2044399, 1, 1, 1, 1, 1,
-0.1707084, -0.9356565, -3.466234, 1, 1, 1, 1, 1,
-0.1689038, 0.7744373, 1.359841, 1, 1, 1, 1, 1,
-0.1670299, -1.365515, -2.837388, 1, 1, 1, 1, 1,
-0.1668551, 0.1862024, -1.253447, 1, 1, 1, 1, 1,
-0.1662976, 0.7719743, 1.273184, 1, 1, 1, 1, 1,
-0.1659395, 0.8408478, -0.2425722, 0, 0, 1, 1, 1,
-0.1640977, 0.4424553, -0.1302018, 1, 0, 0, 1, 1,
-0.1611789, -0.6401725, -3.037393, 1, 0, 0, 1, 1,
-0.1611221, -0.8705457, -3.962419, 1, 0, 0, 1, 1,
-0.15976, -1.244607, -4.461645, 1, 0, 0, 1, 1,
-0.1590568, 0.1446822, 0.1400086, 1, 0, 0, 1, 1,
-0.1579277, 0.7562332, 0.5295473, 0, 0, 0, 1, 1,
-0.1530894, -1.173636, -3.326774, 0, 0, 0, 1, 1,
-0.1434536, 0.5814121, -1.49847, 0, 0, 0, 1, 1,
-0.143188, -0.06976414, -2.879255, 0, 0, 0, 1, 1,
-0.1427872, -0.7317723, -2.025001, 0, 0, 0, 1, 1,
-0.1396024, 0.3008633, -0.7852365, 0, 0, 0, 1, 1,
-0.132334, 1.808391, 0.3012035, 0, 0, 0, 1, 1,
-0.128988, -1.332855, -1.848607, 1, 1, 1, 1, 1,
-0.1276583, 0.3107379, 0.1891769, 1, 1, 1, 1, 1,
-0.1266532, -0.02399422, -1.711179, 1, 1, 1, 1, 1,
-0.126328, 0.4135346, 1.3516, 1, 1, 1, 1, 1,
-0.1259847, -0.05036737, -1.893217, 1, 1, 1, 1, 1,
-0.1256243, -1.218675, -3.235044, 1, 1, 1, 1, 1,
-0.1245512, 1.573852, 0.4176556, 1, 1, 1, 1, 1,
-0.1203786, 0.9697546, 0.6621259, 1, 1, 1, 1, 1,
-0.1185461, 1.317872, 0.02137177, 1, 1, 1, 1, 1,
-0.1125666, 0.5085166, 0.8716832, 1, 1, 1, 1, 1,
-0.1115879, 0.8529509, -0.1712634, 1, 1, 1, 1, 1,
-0.1103826, -0.9780014, -2.70773, 1, 1, 1, 1, 1,
-0.1099374, 0.8573557, 0.315427, 1, 1, 1, 1, 1,
-0.1095384, -2.085485, -2.363411, 1, 1, 1, 1, 1,
-0.1078459, 0.6319569, -1.468658, 1, 1, 1, 1, 1,
-0.1035255, -0.4632637, -2.62111, 0, 0, 1, 1, 1,
-0.1030423, -0.04572642, -1.453818, 1, 0, 0, 1, 1,
-0.09493198, 0.6426724, 0.8513786, 1, 0, 0, 1, 1,
-0.0886295, -0.5297277, -0.938509, 1, 0, 0, 1, 1,
-0.08383942, 1.328499, 1.196413, 1, 0, 0, 1, 1,
-0.08200055, -0.2636545, -2.206421, 1, 0, 0, 1, 1,
-0.07949283, -0.004144772, -1.091528, 0, 0, 0, 1, 1,
-0.07315183, -1.211323, -3.854695, 0, 0, 0, 1, 1,
-0.07232204, 1.488044, 0.04014719, 0, 0, 0, 1, 1,
-0.06898656, 1.033848, 0.1444416, 0, 0, 0, 1, 1,
-0.06665895, 1.017406, -1.246757, 0, 0, 0, 1, 1,
-0.05723295, 0.05594068, 0.04270829, 0, 0, 0, 1, 1,
-0.05663735, 0.5425195, 0.729849, 0, 0, 0, 1, 1,
-0.05419181, -0.2894483, -4.347487, 1, 1, 1, 1, 1,
-0.04699195, 0.4665097, -0.342101, 1, 1, 1, 1, 1,
-0.04695087, 0.805633, -0.1160019, 1, 1, 1, 1, 1,
-0.04655655, 0.3651082, 0.3839091, 1, 1, 1, 1, 1,
-0.04636468, -1.607377, -4.499358, 1, 1, 1, 1, 1,
-0.04613068, -0.6461284, -3.460107, 1, 1, 1, 1, 1,
-0.04396063, 0.2081913, 0.5765107, 1, 1, 1, 1, 1,
-0.04174782, -0.8416811, -3.175433, 1, 1, 1, 1, 1,
-0.03889103, -0.03922264, -2.046293, 1, 1, 1, 1, 1,
-0.03663684, -0.3759419, -4.769663, 1, 1, 1, 1, 1,
-0.03190968, 0.228167, -2.143108, 1, 1, 1, 1, 1,
-0.02004009, 0.239166, -1.216578, 1, 1, 1, 1, 1,
-0.01953935, -0.5089266, -2.68303, 1, 1, 1, 1, 1,
-0.01825582, -0.3585823, -2.729226, 1, 1, 1, 1, 1,
-0.01160506, -1.619355, -3.242793, 1, 1, 1, 1, 1,
-0.01009272, 0.2864431, 1.618216, 0, 0, 1, 1, 1,
-0.00956825, -0.8445385, -2.896931, 1, 0, 0, 1, 1,
-0.007455362, -0.9265131, -3.213283, 1, 0, 0, 1, 1,
-0.004451037, 0.7049112, -0.764309, 1, 0, 0, 1, 1,
-0.004145002, -1.203483, -4.316772, 1, 0, 0, 1, 1,
-0.003400649, -1.643747, -5.340862, 1, 0, 0, 1, 1,
0.003470671, -0.9261523, 3.201568, 0, 0, 0, 1, 1,
0.006655115, -0.7117208, 3.731597, 0, 0, 0, 1, 1,
0.006804396, -0.8835977, 0.9360419, 0, 0, 0, 1, 1,
0.009910706, -0.6018052, 1.594174, 0, 0, 0, 1, 1,
0.01728678, 0.4030694, 0.1234805, 0, 0, 0, 1, 1,
0.01802206, 0.4990732, -1.137559, 0, 0, 0, 1, 1,
0.01853153, -1.414634, 2.066593, 0, 0, 0, 1, 1,
0.02009416, -1.051581, 3.014243, 1, 1, 1, 1, 1,
0.02202312, 0.4813663, -0.4523206, 1, 1, 1, 1, 1,
0.02464435, 0.3396406, 0.8549551, 1, 1, 1, 1, 1,
0.02844511, -1.440979, 3.866337, 1, 1, 1, 1, 1,
0.03115452, -1.220501, 4.187906, 1, 1, 1, 1, 1,
0.03165182, 0.3586286, -0.9175797, 1, 1, 1, 1, 1,
0.04312147, 0.3709479, -0.1077872, 1, 1, 1, 1, 1,
0.04679162, -0.07697142, 2.323652, 1, 1, 1, 1, 1,
0.04683984, -1.688389, 4.951372, 1, 1, 1, 1, 1,
0.04747514, -1.341923, 3.670874, 1, 1, 1, 1, 1,
0.04764255, -0.678265, 1.950744, 1, 1, 1, 1, 1,
0.05073078, -0.9037567, 4.082798, 1, 1, 1, 1, 1,
0.05086616, 0.8197107, 1.607237, 1, 1, 1, 1, 1,
0.05197391, 1.817003, -1.299593, 1, 1, 1, 1, 1,
0.05230869, -0.01460143, 3.184867, 1, 1, 1, 1, 1,
0.05392822, 0.6874561, 2.423978, 0, 0, 1, 1, 1,
0.06143717, -0.1063387, 3.138927, 1, 0, 0, 1, 1,
0.06165259, 0.003692051, 1.151763, 1, 0, 0, 1, 1,
0.06281693, -0.3785133, 2.643935, 1, 0, 0, 1, 1,
0.06438639, 1.273578, 0.8792815, 1, 0, 0, 1, 1,
0.06788901, -1.385875, 3.272547, 1, 0, 0, 1, 1,
0.076752, -2.468051, 3.1095, 0, 0, 0, 1, 1,
0.07755363, 1.366093, -1.057004, 0, 0, 0, 1, 1,
0.07831894, -1.452406, 3.636847, 0, 0, 0, 1, 1,
0.08300222, -2.195321, 3.385281, 0, 0, 0, 1, 1,
0.08531718, 2.153172, 0.1603396, 0, 0, 0, 1, 1,
0.08549499, -0.3633926, 2.671598, 0, 0, 0, 1, 1,
0.08792802, -1.270981, 1.906574, 0, 0, 0, 1, 1,
0.09058747, -0.5088608, 2.974567, 1, 1, 1, 1, 1,
0.09283926, 0.3565221, 0.286504, 1, 1, 1, 1, 1,
0.09772048, -0.3434729, 2.903363, 1, 1, 1, 1, 1,
0.09932181, -0.9935883, 3.085932, 1, 1, 1, 1, 1,
0.1029279, 0.9885246, 1.367348, 1, 1, 1, 1, 1,
0.105234, 0.3318395, 0.8058358, 1, 1, 1, 1, 1,
0.106417, 1.904471, 0.04336709, 1, 1, 1, 1, 1,
0.1070237, 0.04758222, 2.067863, 1, 1, 1, 1, 1,
0.1079233, 0.287249, 1.886156, 1, 1, 1, 1, 1,
0.1118888, -0.2399479, 3.069642, 1, 1, 1, 1, 1,
0.1121239, 0.3457361, -0.682835, 1, 1, 1, 1, 1,
0.1121797, -0.498666, 2.451781, 1, 1, 1, 1, 1,
0.1121807, -1.040612, 2.984556, 1, 1, 1, 1, 1,
0.1182937, 0.628058, 0.9378219, 1, 1, 1, 1, 1,
0.1192137, 0.3285271, 1.273296, 1, 1, 1, 1, 1,
0.1200852, -0.1428437, 1.036789, 0, 0, 1, 1, 1,
0.1204613, 1.149524, -0.3906804, 1, 0, 0, 1, 1,
0.1234221, -0.5328733, 3.036959, 1, 0, 0, 1, 1,
0.12511, -1.705496, 1.994182, 1, 0, 0, 1, 1,
0.1259392, 2.117358, 0.8462397, 1, 0, 0, 1, 1,
0.1267571, 0.1520451, 0.4466422, 1, 0, 0, 1, 1,
0.1269851, 0.02165255, 0.23232, 0, 0, 0, 1, 1,
0.1287747, 1.061139, 0.1819836, 0, 0, 0, 1, 1,
0.1347665, -0.1435319, 2.301998, 0, 0, 0, 1, 1,
0.1389498, 0.3567168, 0.02592633, 0, 0, 0, 1, 1,
0.1390451, 0.4643652, 0.4263842, 0, 0, 0, 1, 1,
0.1412965, 0.05559886, 0.1297827, 0, 0, 0, 1, 1,
0.1438863, 0.5570754, -0.5653243, 0, 0, 0, 1, 1,
0.1469724, -1.496944, 3.427825, 1, 1, 1, 1, 1,
0.147237, 1.774738, -0.447358, 1, 1, 1, 1, 1,
0.1472701, -0.7577527, 2.928437, 1, 1, 1, 1, 1,
0.1512169, -0.8758066, 1.87202, 1, 1, 1, 1, 1,
0.1516421, 1.016702, 0.1493439, 1, 1, 1, 1, 1,
0.1524479, -0.2630334, 4.956476, 1, 1, 1, 1, 1,
0.1530827, -0.6436115, 2.873287, 1, 1, 1, 1, 1,
0.1542308, -2.990925, 2.279868, 1, 1, 1, 1, 1,
0.1581436, -0.6620142, 3.794899, 1, 1, 1, 1, 1,
0.1629121, 0.3879355, 0.4490485, 1, 1, 1, 1, 1,
0.1652951, 0.7063827, -0.476392, 1, 1, 1, 1, 1,
0.1686324, -0.05320552, 2.642392, 1, 1, 1, 1, 1,
0.1742498, -0.4048333, 0.6837268, 1, 1, 1, 1, 1,
0.1756705, -0.05823216, 0.1932364, 1, 1, 1, 1, 1,
0.1779527, -0.2620945, 3.585493, 1, 1, 1, 1, 1,
0.1783224, 0.06907743, 3.939678, 0, 0, 1, 1, 1,
0.1850406, -0.4099237, 3.923954, 1, 0, 0, 1, 1,
0.1869841, 0.5251065, 0.1341837, 1, 0, 0, 1, 1,
0.1919543, -0.3252097, 1.068634, 1, 0, 0, 1, 1,
0.1930923, -0.1438352, 1.792034, 1, 0, 0, 1, 1,
0.1936363, -0.6045697, 2.698839, 1, 0, 0, 1, 1,
0.1961652, 0.4056891, 1.322416, 0, 0, 0, 1, 1,
0.1978321, 0.1363177, 1.722752, 0, 0, 0, 1, 1,
0.1985754, -1.010199, 2.130227, 0, 0, 0, 1, 1,
0.2028841, -0.1962236, 3.19623, 0, 0, 0, 1, 1,
0.20617, 1.135286, -1.530635, 0, 0, 0, 1, 1,
0.2062505, -0.1602769, 0.3237997, 0, 0, 0, 1, 1,
0.2070047, 0.5340188, 0.4978433, 0, 0, 0, 1, 1,
0.2085672, 0.25513, 0.9161423, 1, 1, 1, 1, 1,
0.2088318, -0.4817372, 1.51399, 1, 1, 1, 1, 1,
0.2103385, -1.74176, 1.807652, 1, 1, 1, 1, 1,
0.2184666, -0.42296, 2.412508, 1, 1, 1, 1, 1,
0.2185808, 0.7746106, -1.450132, 1, 1, 1, 1, 1,
0.2250209, 0.07500616, 0.2662256, 1, 1, 1, 1, 1,
0.2272462, -0.4511218, 2.563723, 1, 1, 1, 1, 1,
0.230699, -0.004270483, 0.7448026, 1, 1, 1, 1, 1,
0.2318627, 0.0563018, 1.935143, 1, 1, 1, 1, 1,
0.238388, 0.3138346, 1.313855, 1, 1, 1, 1, 1,
0.238749, -0.8244025, 3.655009, 1, 1, 1, 1, 1,
0.2398512, 1.595157, 1.522567, 1, 1, 1, 1, 1,
0.2416908, 0.1434252, 2.328206, 1, 1, 1, 1, 1,
0.2431367, 0.636903, 0.6831493, 1, 1, 1, 1, 1,
0.2442265, 1.468797, -0.8204632, 1, 1, 1, 1, 1,
0.2451457, -0.1245379, 0.9069388, 0, 0, 1, 1, 1,
0.2476276, -0.04823139, 2.539456, 1, 0, 0, 1, 1,
0.2547958, -0.03622255, 3.401749, 1, 0, 0, 1, 1,
0.2549999, -0.1440126, 1.862683, 1, 0, 0, 1, 1,
0.2559363, -0.8069401, 3.737522, 1, 0, 0, 1, 1,
0.2579923, -0.4489888, 3.681058, 1, 0, 0, 1, 1,
0.2584726, 0.4889642, -0.2103359, 0, 0, 0, 1, 1,
0.2601398, -0.4249631, 2.262618, 0, 0, 0, 1, 1,
0.2620887, -0.9839222, 4.004488, 0, 0, 0, 1, 1,
0.2627801, -1.094794, 3.410061, 0, 0, 0, 1, 1,
0.2675342, -1.828903, 2.167484, 0, 0, 0, 1, 1,
0.2687737, -0.01409821, 1.116312, 0, 0, 0, 1, 1,
0.2724069, -0.1859257, 2.579089, 0, 0, 0, 1, 1,
0.2739112, -0.4219582, 2.29704, 1, 1, 1, 1, 1,
0.2762392, 0.8487562, -0.6396978, 1, 1, 1, 1, 1,
0.2795767, -0.7447466, 1.830158, 1, 1, 1, 1, 1,
0.2837515, -1.79863, 2.509213, 1, 1, 1, 1, 1,
0.2841229, 0.4358014, 0.0006177949, 1, 1, 1, 1, 1,
0.2858444, 0.1519136, 1.794285, 1, 1, 1, 1, 1,
0.2891637, 1.066218, -0.6251873, 1, 1, 1, 1, 1,
0.2987672, -1.289657, 3.763039, 1, 1, 1, 1, 1,
0.3009095, -0.2944129, 3.398618, 1, 1, 1, 1, 1,
0.3022525, -0.4583869, 3.534319, 1, 1, 1, 1, 1,
0.3041705, 0.7932246, 1.795114, 1, 1, 1, 1, 1,
0.3092509, 0.4299035, 1.486421, 1, 1, 1, 1, 1,
0.3196102, 0.7371343, -0.05152369, 1, 1, 1, 1, 1,
0.3205279, 0.05066166, 1.143923, 1, 1, 1, 1, 1,
0.3235122, 0.1290987, 0.04739743, 1, 1, 1, 1, 1,
0.3302368, -0.01687831, 0.4288687, 0, 0, 1, 1, 1,
0.3323993, -0.5361712, 2.35879, 1, 0, 0, 1, 1,
0.333102, -0.8807942, 3.591105, 1, 0, 0, 1, 1,
0.3346619, 1.223165, 0.8699956, 1, 0, 0, 1, 1,
0.3351215, 0.5289318, 1.920836, 1, 0, 0, 1, 1,
0.3402168, 0.1791451, 2.701662, 1, 0, 0, 1, 1,
0.3425445, -2.220162, 1.227364, 0, 0, 0, 1, 1,
0.3456526, -0.4793015, -0.20618, 0, 0, 0, 1, 1,
0.3491161, -0.9255342, 2.450879, 0, 0, 0, 1, 1,
0.3506715, 0.5270956, 1.961421, 0, 0, 0, 1, 1,
0.3510453, 0.7233741, 0.2231481, 0, 0, 0, 1, 1,
0.3574051, -0.7102185, 1.587085, 0, 0, 0, 1, 1,
0.3581405, 0.3324227, 3.299755, 0, 0, 0, 1, 1,
0.3610823, -0.736196, 1.202858, 1, 1, 1, 1, 1,
0.361901, 1.779716, -0.0389102, 1, 1, 1, 1, 1,
0.3624797, -0.2271302, 3.241811, 1, 1, 1, 1, 1,
0.3631795, -0.6271717, 2.651377, 1, 1, 1, 1, 1,
0.3640017, 0.4568473, 1.397069, 1, 1, 1, 1, 1,
0.3659417, -0.2627242, 1.854111, 1, 1, 1, 1, 1,
0.3666756, -0.121339, 4.166102, 1, 1, 1, 1, 1,
0.3681471, -1.48028, 2.274157, 1, 1, 1, 1, 1,
0.3699604, -1.834752, 4.179734, 1, 1, 1, 1, 1,
0.3706416, -0.4641247, 4.092918, 1, 1, 1, 1, 1,
0.3734, -0.1888453, 3.429035, 1, 1, 1, 1, 1,
0.3754044, -2.773512, 2.625626, 1, 1, 1, 1, 1,
0.3763147, 0.4578944, 1.795644, 1, 1, 1, 1, 1,
0.3816679, 1.238474, 1.116522, 1, 1, 1, 1, 1,
0.3827207, -1.620484, 3.000488, 1, 1, 1, 1, 1,
0.3879168, 1.411273, -0.5006294, 0, 0, 1, 1, 1,
0.3880048, 0.2003125, 0.7691091, 1, 0, 0, 1, 1,
0.3885499, 0.1881925, 1.513597, 1, 0, 0, 1, 1,
0.3901551, 0.01705359, 1.385294, 1, 0, 0, 1, 1,
0.3968061, -0.4918752, 2.34923, 1, 0, 0, 1, 1,
0.396942, 0.6057122, 1.091781, 1, 0, 0, 1, 1,
0.3998978, -2.059653, 3.670673, 0, 0, 0, 1, 1,
0.4058642, -1.055122, 2.180867, 0, 0, 0, 1, 1,
0.4061179, 0.985675, 0.5365911, 0, 0, 0, 1, 1,
0.4141448, -1.334426, 4.023998, 0, 0, 0, 1, 1,
0.4157721, -0.2834546, 1.329448, 0, 0, 0, 1, 1,
0.4163359, 0.06287637, 2.217725, 0, 0, 0, 1, 1,
0.4235336, 0.1799658, 0.7920064, 0, 0, 0, 1, 1,
0.4264708, 0.3216879, 2.316711, 1, 1, 1, 1, 1,
0.4280188, 0.2507968, 0.2671825, 1, 1, 1, 1, 1,
0.428201, -0.4408477, 2.2946, 1, 1, 1, 1, 1,
0.4333448, 0.8774775, 1.157805, 1, 1, 1, 1, 1,
0.4340827, -0.4407682, 2.888051, 1, 1, 1, 1, 1,
0.4387035, -0.05315768, 1.078247, 1, 1, 1, 1, 1,
0.4455332, 0.2669302, 1.120494, 1, 1, 1, 1, 1,
0.4472002, 0.08508225, 2.334931, 1, 1, 1, 1, 1,
0.4485965, 0.7179466, 1.012723, 1, 1, 1, 1, 1,
0.4486766, 0.6152743, 0.3569093, 1, 1, 1, 1, 1,
0.4492117, 0.2536612, 0.6171201, 1, 1, 1, 1, 1,
0.4509741, -0.3232061, 1.186037, 1, 1, 1, 1, 1,
0.4519867, 2.252031, 0.5623856, 1, 1, 1, 1, 1,
0.4540246, -0.5218189, 2.249264, 1, 1, 1, 1, 1,
0.4563813, 1.42472, 1.985268, 1, 1, 1, 1, 1,
0.4571304, -0.08553791, 0.671665, 0, 0, 1, 1, 1,
0.4617085, -1.417494, 3.466374, 1, 0, 0, 1, 1,
0.4622895, 0.931169, -0.08222372, 1, 0, 0, 1, 1,
0.464936, -0.601794, 2.301817, 1, 0, 0, 1, 1,
0.4710191, 0.1973414, 1.820953, 1, 0, 0, 1, 1,
0.4716943, 0.3669249, 1.97263, 1, 0, 0, 1, 1,
0.4737079, -0.1940134, 0.9679915, 0, 0, 0, 1, 1,
0.4754576, -1.712519, 3.98051, 0, 0, 0, 1, 1,
0.4799403, 0.2814725, 0.6852699, 0, 0, 0, 1, 1,
0.4840206, -1.355415, 2.191585, 0, 0, 0, 1, 1,
0.4841528, 1.068522, -1.815392, 0, 0, 0, 1, 1,
0.4866036, -0.8065805, 3.804966, 0, 0, 0, 1, 1,
0.4882428, -1.076056, 3.142555, 0, 0, 0, 1, 1,
0.4908892, -0.8900886, 2.211934, 1, 1, 1, 1, 1,
0.4926643, -0.8626804, 3.149469, 1, 1, 1, 1, 1,
0.4935803, 0.8397199, 0.3370143, 1, 1, 1, 1, 1,
0.4954748, 1.788866, 0.4104646, 1, 1, 1, 1, 1,
0.4959269, -0.1263078, 2.206827, 1, 1, 1, 1, 1,
0.4984697, -0.25643, 1.257254, 1, 1, 1, 1, 1,
0.4988661, 0.8405559, 0.2305205, 1, 1, 1, 1, 1,
0.5009397, -0.2541845, 3.418325, 1, 1, 1, 1, 1,
0.5012309, -0.6332021, 2.153196, 1, 1, 1, 1, 1,
0.5020216, -0.5325297, 2.301769, 1, 1, 1, 1, 1,
0.5023605, -2.425858, 3.564556, 1, 1, 1, 1, 1,
0.5055662, 0.7014095, -1.300761, 1, 1, 1, 1, 1,
0.5079845, 0.311034, -0.559383, 1, 1, 1, 1, 1,
0.5086767, 1.494646, 0.4456488, 1, 1, 1, 1, 1,
0.512378, 0.8494509, 1.654842, 1, 1, 1, 1, 1,
0.5143579, -0.8815348, 2.676759, 0, 0, 1, 1, 1,
0.5179917, 0.3014686, 1.997506, 1, 0, 0, 1, 1,
0.5185322, -0.02730861, 0.8864588, 1, 0, 0, 1, 1,
0.5194314, 0.8303379, -0.02131336, 1, 0, 0, 1, 1,
0.520857, -0.6877684, 1.680827, 1, 0, 0, 1, 1,
0.5293555, -0.9435109, 2.217685, 1, 0, 0, 1, 1,
0.5327748, -0.4205764, 2.493406, 0, 0, 0, 1, 1,
0.5397205, 0.704254, 0.2760007, 0, 0, 0, 1, 1,
0.5424777, 0.01195146, -0.3199357, 0, 0, 0, 1, 1,
0.548494, -1.320711, 4.194661, 0, 0, 0, 1, 1,
0.5510766, 1.220192, 1.497011, 0, 0, 0, 1, 1,
0.5519834, 0.8885351, 1.296604, 0, 0, 0, 1, 1,
0.5619134, 1.995531, -1.411958, 0, 0, 0, 1, 1,
0.5627266, -0.3654392, 2.42004, 1, 1, 1, 1, 1,
0.5633728, 0.9827248, 0.2092076, 1, 1, 1, 1, 1,
0.5652604, 1.247128, 0.5770414, 1, 1, 1, 1, 1,
0.5683593, 0.2833312, 2.100584, 1, 1, 1, 1, 1,
0.5756733, -0.9110448, 3.703315, 1, 1, 1, 1, 1,
0.575983, -0.9788324, 3.700134, 1, 1, 1, 1, 1,
0.5842648, -1.732618, 2.352001, 1, 1, 1, 1, 1,
0.5844182, -0.08512956, -0.03122866, 1, 1, 1, 1, 1,
0.6010051, -0.3013757, 2.338511, 1, 1, 1, 1, 1,
0.6010076, 0.7645228, -0.7852678, 1, 1, 1, 1, 1,
0.6023494, -1.361805, 2.541553, 1, 1, 1, 1, 1,
0.6096746, -1.535838, 3.268412, 1, 1, 1, 1, 1,
0.6116467, -0.4254458, 2.542893, 1, 1, 1, 1, 1,
0.6149043, -1.42432, 2.572278, 1, 1, 1, 1, 1,
0.6180197, -0.1213782, 2.87644, 1, 1, 1, 1, 1,
0.6203698, 2.001522, -2.239195, 0, 0, 1, 1, 1,
0.6297104, -0.6799274, 2.91696, 1, 0, 0, 1, 1,
0.6321572, -1.141841, 3.205551, 1, 0, 0, 1, 1,
0.6362353, -0.2756305, 2.984256, 1, 0, 0, 1, 1,
0.6373407, -0.1469388, 2.951203, 1, 0, 0, 1, 1,
0.6429238, 0.6621693, 0.9835567, 1, 0, 0, 1, 1,
0.6455495, -1.76365, 2.413666, 0, 0, 0, 1, 1,
0.6525496, -1.064363, 2.382317, 0, 0, 0, 1, 1,
0.6683049, 2.184108, 0.01150783, 0, 0, 0, 1, 1,
0.6686718, 0.6306295, 0.3346076, 0, 0, 0, 1, 1,
0.6716514, 0.2126871, 0.06674974, 0, 0, 0, 1, 1,
0.6807625, -1.244664, 1.495935, 0, 0, 0, 1, 1,
0.6818697, 0.2777381, 0.2953779, 0, 0, 0, 1, 1,
0.6868615, 0.5984488, -1.456204, 1, 1, 1, 1, 1,
0.6909156, 0.07422762, 0.9375249, 1, 1, 1, 1, 1,
0.6972358, -0.2540057, 3.604116, 1, 1, 1, 1, 1,
0.6982858, -0.4602567, 3.312333, 1, 1, 1, 1, 1,
0.7003064, -0.003407601, 1.975358, 1, 1, 1, 1, 1,
0.7012841, 0.2397062, 3.438563, 1, 1, 1, 1, 1,
0.702536, 1.608221, -1.33452, 1, 1, 1, 1, 1,
0.7049723, -0.3577999, 4.24369, 1, 1, 1, 1, 1,
0.7054239, -0.3904847, 2.634371, 1, 1, 1, 1, 1,
0.7106069, 0.8484874, -1.176335, 1, 1, 1, 1, 1,
0.7136216, 0.3789438, 1.385263, 1, 1, 1, 1, 1,
0.713954, 1.229154, 0.7714676, 1, 1, 1, 1, 1,
0.7165718, -1.037281, 1.364946, 1, 1, 1, 1, 1,
0.7179945, 0.3418645, -0.3619781, 1, 1, 1, 1, 1,
0.7184504, 1.342723, 0.6731191, 1, 1, 1, 1, 1,
0.7205271, -0.8748729, 2.146797, 0, 0, 1, 1, 1,
0.7239618, -0.3188519, 1.87184, 1, 0, 0, 1, 1,
0.7263778, 1.35035, 2.423761, 1, 0, 0, 1, 1,
0.7267524, 0.6887857, -0.5854195, 1, 0, 0, 1, 1,
0.72715, 0.1385005, -1.004327, 1, 0, 0, 1, 1,
0.7296109, 0.4090459, 0.7943336, 1, 0, 0, 1, 1,
0.7304157, -0.008989619, 1.899522, 0, 0, 0, 1, 1,
0.7317876, -0.2398973, 2.339444, 0, 0, 0, 1, 1,
0.7337662, 1.101815, 0.5013821, 0, 0, 0, 1, 1,
0.7338625, -0.597014, 0.5311754, 0, 0, 0, 1, 1,
0.7345167, 0.3360254, 1.286022, 0, 0, 0, 1, 1,
0.7380793, -0.853382, 3.094748, 0, 0, 0, 1, 1,
0.7455869, -1.275872, 0.3941821, 0, 0, 0, 1, 1,
0.7456856, 2.31298, -0.6256754, 1, 1, 1, 1, 1,
0.7459632, -0.858676, 3.755737, 1, 1, 1, 1, 1,
0.7522233, 0.09208038, -0.1725073, 1, 1, 1, 1, 1,
0.7577382, -0.6117741, 1.042694, 1, 1, 1, 1, 1,
0.7586297, -0.2664912, 3.040454, 1, 1, 1, 1, 1,
0.7622927, -1.232485, 2.387017, 1, 1, 1, 1, 1,
0.7644862, -1.876679, 1.512959, 1, 1, 1, 1, 1,
0.764842, -0.8187363, 2.761198, 1, 1, 1, 1, 1,
0.7660412, -1.400092, 3.237317, 1, 1, 1, 1, 1,
0.7661274, -0.05253485, 1.782685, 1, 1, 1, 1, 1,
0.7666534, -0.3613415, 1.659665, 1, 1, 1, 1, 1,
0.7714546, -0.8125892, 2.805503, 1, 1, 1, 1, 1,
0.7734795, 0.8983948, 1.673403, 1, 1, 1, 1, 1,
0.7734806, -1.108562, 2.814683, 1, 1, 1, 1, 1,
0.7739933, -0.2146963, 2.807429, 1, 1, 1, 1, 1,
0.7757654, 1.478084, -0.6215898, 0, 0, 1, 1, 1,
0.7782134, 0.8994285, 1.788107, 1, 0, 0, 1, 1,
0.7797595, -0.007846163, 0.3712963, 1, 0, 0, 1, 1,
0.7808379, 0.7469119, 1.506824, 1, 0, 0, 1, 1,
0.7815504, 1.8037, -0.1271115, 1, 0, 0, 1, 1,
0.7856877, -0.08459252, 1.804028, 1, 0, 0, 1, 1,
0.7907507, 0.4914775, 2.053837, 0, 0, 0, 1, 1,
0.7966809, -0.1722088, 3.019399, 0, 0, 0, 1, 1,
0.8003433, 1.485852, -0.6468127, 0, 0, 0, 1, 1,
0.8060484, 1.224037, -0.9077469, 0, 0, 0, 1, 1,
0.8085381, -0.8430774, 4.370542, 0, 0, 0, 1, 1,
0.8104243, -0.4059091, 1.983681, 0, 0, 0, 1, 1,
0.8119149, 1.211961, 0.4579916, 0, 0, 0, 1, 1,
0.813649, 1.333255, -0.48854, 1, 1, 1, 1, 1,
0.8160698, 0.1613043, 2.174633, 1, 1, 1, 1, 1,
0.8209968, 0.337119, 1.693933, 1, 1, 1, 1, 1,
0.8254339, -0.1124288, 1.991773, 1, 1, 1, 1, 1,
0.8317716, 0.1254596, -0.6000817, 1, 1, 1, 1, 1,
0.8336334, -0.8275457, 1.184829, 1, 1, 1, 1, 1,
0.8356254, 1.094963, 1.721124, 1, 1, 1, 1, 1,
0.83597, 1.943267, 1.792097, 1, 1, 1, 1, 1,
0.8441457, 1.071212, 1.745725, 1, 1, 1, 1, 1,
0.8503569, 0.3163489, 1.714196, 1, 1, 1, 1, 1,
0.8503621, 0.4394146, 0.1489719, 1, 1, 1, 1, 1,
0.8528069, -1.064207, 1.226668, 1, 1, 1, 1, 1,
0.8578991, 1.207564, 0.9498507, 1, 1, 1, 1, 1,
0.8705534, 0.7310822, 0.8948818, 1, 1, 1, 1, 1,
0.871152, -1.072688, 2.928478, 1, 1, 1, 1, 1,
0.8754771, 0.4140382, 0.8293923, 0, 0, 1, 1, 1,
0.8766268, 0.5907883, 1.494293, 1, 0, 0, 1, 1,
0.8874648, 0.5124511, 1.826693, 1, 0, 0, 1, 1,
0.8878731, 1.351811, -0.1705829, 1, 0, 0, 1, 1,
0.8908905, 2.173975, -0.8927833, 1, 0, 0, 1, 1,
0.8967518, 0.05309166, 0.9013403, 1, 0, 0, 1, 1,
0.8975208, 0.368589, 3.364026, 0, 0, 0, 1, 1,
0.8991496, 0.4131102, 0.5447848, 0, 0, 0, 1, 1,
0.9002908, -0.747261, 0.8040012, 0, 0, 0, 1, 1,
0.9072105, -0.5408785, 1.624008, 0, 0, 0, 1, 1,
0.9082481, -0.8753499, 2.574527, 0, 0, 0, 1, 1,
0.9114882, -1.157847, 2.833881, 0, 0, 0, 1, 1,
0.9127498, 1.326209, 0.2806902, 0, 0, 0, 1, 1,
0.9170043, -0.05350035, 1.291792, 1, 1, 1, 1, 1,
0.9189028, 0.04745711, 1.08767, 1, 1, 1, 1, 1,
0.9205368, 0.105346, 0.7909172, 1, 1, 1, 1, 1,
0.9241121, 1.946163, 0.5842244, 1, 1, 1, 1, 1,
0.9337551, -0.9764994, 4.26361, 1, 1, 1, 1, 1,
0.93875, -0.4320025, 2.066955, 1, 1, 1, 1, 1,
0.9403189, -0.2796723, 1.719635, 1, 1, 1, 1, 1,
0.9447699, -1.242838, 1.398266, 1, 1, 1, 1, 1,
0.9537636, -1.387505, 3.092644, 1, 1, 1, 1, 1,
0.960326, 0.6328596, 1.276208, 1, 1, 1, 1, 1,
0.9721056, -1.330593, 3.246869, 1, 1, 1, 1, 1,
0.9757415, 3.000355, 1.088946, 1, 1, 1, 1, 1,
0.9801403, -2.78777, 2.488031, 1, 1, 1, 1, 1,
0.9828577, -1.477436, 3.151672, 1, 1, 1, 1, 1,
0.9828715, -0.1813107, 2.311982, 1, 1, 1, 1, 1,
0.9857897, 0.824158, 0.9392584, 0, 0, 1, 1, 1,
0.9858702, -0.4638544, 4.285494, 1, 0, 0, 1, 1,
0.9882789, 1.30198, 3.462971, 1, 0, 0, 1, 1,
0.9960839, -0.8611928, 3.140816, 1, 0, 0, 1, 1,
1.012312, 0.3338329, 1.757925, 1, 0, 0, 1, 1,
1.015904, -0.8441381, 1.558601, 1, 0, 0, 1, 1,
1.019452, 0.03178453, 1.648152, 0, 0, 0, 1, 1,
1.020213, 0.4467231, 1.940412, 0, 0, 0, 1, 1,
1.022162, 0.9922767, 1.357682, 0, 0, 0, 1, 1,
1.03551, -0.8749553, 2.816149, 0, 0, 0, 1, 1,
1.057059, 0.8313822, 0.5991745, 0, 0, 0, 1, 1,
1.064255, 1.863877, -0.004093286, 0, 0, 0, 1, 1,
1.072867, -0.3998987, 2.360079, 0, 0, 0, 1, 1,
1.074969, -0.06138058, -0.630515, 1, 1, 1, 1, 1,
1.089101, 0.5377652, 1.32031, 1, 1, 1, 1, 1,
1.095538, -0.5868316, 3.216959, 1, 1, 1, 1, 1,
1.097282, -0.7987492, 2.596032, 1, 1, 1, 1, 1,
1.099598, -0.7708051, 1.484576, 1, 1, 1, 1, 1,
1.103658, 0.1575699, 3.147254, 1, 1, 1, 1, 1,
1.109258, -2.540686, 1.927268, 1, 1, 1, 1, 1,
1.110496, -0.6509279, 4.692362, 1, 1, 1, 1, 1,
1.117248, -0.339972, 1.361628, 1, 1, 1, 1, 1,
1.117758, 0.3307863, 0.233954, 1, 1, 1, 1, 1,
1.123859, -0.1814172, 1.634104, 1, 1, 1, 1, 1,
1.124356, 0.5452224, 2.551212, 1, 1, 1, 1, 1,
1.132455, 1.728897, 0.7007532, 1, 1, 1, 1, 1,
1.149335, 0.9012359, 0.08051156, 1, 1, 1, 1, 1,
1.161514, 0.7297781, 1.827341, 1, 1, 1, 1, 1,
1.165032, 0.3369695, 0.3930526, 0, 0, 1, 1, 1,
1.168927, 0.1949835, 0.7538622, 1, 0, 0, 1, 1,
1.16944, 1.258751, 2.329486, 1, 0, 0, 1, 1,
1.178518, 0.3900939, 0.006101458, 1, 0, 0, 1, 1,
1.189629, -0.4215606, 1.921823, 1, 0, 0, 1, 1,
1.190949, 0.8156398, 1.834418, 1, 0, 0, 1, 1,
1.19277, -0.5863019, 2.768902, 0, 0, 0, 1, 1,
1.197655, 0.7991056, 0.1682604, 0, 0, 0, 1, 1,
1.198768, 0.102015, 2.178384, 0, 0, 0, 1, 1,
1.199034, -1.134115, 2.251662, 0, 0, 0, 1, 1,
1.199412, -0.4161457, 1.632823, 0, 0, 0, 1, 1,
1.20033, 0.4480006, 0.9232827, 0, 0, 0, 1, 1,
1.211669, -0.3224351, -0.3734006, 0, 0, 0, 1, 1,
1.215818, -0.1418297, 0.871689, 1, 1, 1, 1, 1,
1.226434, 0.3582786, 1.102992, 1, 1, 1, 1, 1,
1.242569, -1.171098, 3.146645, 1, 1, 1, 1, 1,
1.244375, 1.471367, 1.009384, 1, 1, 1, 1, 1,
1.244428, -0.5217927, 3.544398, 1, 1, 1, 1, 1,
1.245948, -0.4924924, 2.16715, 1, 1, 1, 1, 1,
1.247024, -0.869608, 2.302018, 1, 1, 1, 1, 1,
1.248957, -2.740863, 4.223074, 1, 1, 1, 1, 1,
1.250004, 0.8094567, 0.07051831, 1, 1, 1, 1, 1,
1.256371, 0.04311037, 0.075716, 1, 1, 1, 1, 1,
1.258294, 0.7825972, -0.011736, 1, 1, 1, 1, 1,
1.266542, -0.0786301, 1.53536, 1, 1, 1, 1, 1,
1.273014, 0.1104531, 2.020416, 1, 1, 1, 1, 1,
1.273685, 1.177598, 1.984441, 1, 1, 1, 1, 1,
1.282554, 0.01784017, 2.900031, 1, 1, 1, 1, 1,
1.285106, 0.7118338, 0.857663, 0, 0, 1, 1, 1,
1.293601, -0.299998, 0.4293729, 1, 0, 0, 1, 1,
1.29919, 1.112032, 1.476128, 1, 0, 0, 1, 1,
1.306505, -1.07721, 2.616959, 1, 0, 0, 1, 1,
1.307871, -1.461683, 2.918799, 1, 0, 0, 1, 1,
1.314983, -0.9065016, 1.638016, 1, 0, 0, 1, 1,
1.315413, -0.4833921, 1.665306, 0, 0, 0, 1, 1,
1.322239, 1.625788, 1.079447, 0, 0, 0, 1, 1,
1.329974, -0.04777537, 0.8789128, 0, 0, 0, 1, 1,
1.330525, 1.178263, 0.8704961, 0, 0, 0, 1, 1,
1.342314, 1.101882, 1.409631, 0, 0, 0, 1, 1,
1.345967, 2.528939, 0.4959304, 0, 0, 0, 1, 1,
1.356294, -0.6620924, 0.8556212, 0, 0, 0, 1, 1,
1.356851, 0.9457221, 1.660701, 1, 1, 1, 1, 1,
1.370009, -0.04882731, 3.760805, 1, 1, 1, 1, 1,
1.388993, -1.524076, 1.361565, 1, 1, 1, 1, 1,
1.416654, -0.3765063, 1.437246, 1, 1, 1, 1, 1,
1.428271, 1.797748, -0.7225686, 1, 1, 1, 1, 1,
1.4303, -2.281591, 1.472537, 1, 1, 1, 1, 1,
1.437372, 0.4628558, 1.31571, 1, 1, 1, 1, 1,
1.44314, 1.484589, 0.4247357, 1, 1, 1, 1, 1,
1.454515, -0.7126431, 0.7090831, 1, 1, 1, 1, 1,
1.462659, -1.500504, 2.311178, 1, 1, 1, 1, 1,
1.468059, -1.01433, 1.647711, 1, 1, 1, 1, 1,
1.478536, 0.6772334, 0.1156112, 1, 1, 1, 1, 1,
1.480689, -0.6281016, 2.346496, 1, 1, 1, 1, 1,
1.520653, -0.6993082, 3.250172, 1, 1, 1, 1, 1,
1.522588, 0.2792777, 0.8502129, 1, 1, 1, 1, 1,
1.530884, 0.6286744, 0.9361411, 0, 0, 1, 1, 1,
1.570979, -0.9980682, 4.059855, 1, 0, 0, 1, 1,
1.576203, -1.682855, 2.409708, 1, 0, 0, 1, 1,
1.591056, -0.4521934, 0.6866039, 1, 0, 0, 1, 1,
1.604198, 0.4221078, 2.770356, 1, 0, 0, 1, 1,
1.6144, -1.000976, 1.713438, 1, 0, 0, 1, 1,
1.637663, 0.3352436, 1.405887, 0, 0, 0, 1, 1,
1.644348, -1.098525, 1.701025, 0, 0, 0, 1, 1,
1.648566, 0.8598377, 0.6898661, 0, 0, 0, 1, 1,
1.663623, -0.9227974, 3.198555, 0, 0, 0, 1, 1,
1.667925, -0.223568, 2.023544, 0, 0, 0, 1, 1,
1.706114, -0.9052093, 1.002018, 0, 0, 0, 1, 1,
1.736781, 0.2416452, 1.955209, 0, 0, 0, 1, 1,
1.798385, 1.533938, 0.7667361, 1, 1, 1, 1, 1,
1.812953, 1.728065, 0.05868546, 1, 1, 1, 1, 1,
1.817522, 0.5382254, 1.602809, 1, 1, 1, 1, 1,
1.860628, 0.7653796, 1.393689, 1, 1, 1, 1, 1,
1.874764, 0.9202111, 0.5446879, 1, 1, 1, 1, 1,
1.882144, 0.3551986, -0.1557037, 1, 1, 1, 1, 1,
1.88696, -2.139954, 3.239502, 1, 1, 1, 1, 1,
1.888854, -0.06510425, 3.342129, 1, 1, 1, 1, 1,
1.89879, -0.6355264, 1.658753, 1, 1, 1, 1, 1,
1.91336, 1.388872, -0.2645254, 1, 1, 1, 1, 1,
1.917227, -0.5235455, 2.282076, 1, 1, 1, 1, 1,
1.928895, 2.360155, 0.08717154, 1, 1, 1, 1, 1,
1.954726, 0.8583707, 0.6787593, 1, 1, 1, 1, 1,
1.966199, 0.5235296, 2.484043, 1, 1, 1, 1, 1,
1.975746, -0.5087405, 0.8092477, 1, 1, 1, 1, 1,
1.985413, 0.5162653, 0.2853486, 0, 0, 1, 1, 1,
1.995144, 0.2997849, 1.843109, 1, 0, 0, 1, 1,
2.028339, 1.212096, -0.162377, 1, 0, 0, 1, 1,
2.033208, -1.266021, 1.879498, 1, 0, 0, 1, 1,
2.114391, 1.539824, 2.584595, 1, 0, 0, 1, 1,
2.137392, 1.440092, 0.2657519, 1, 0, 0, 1, 1,
2.14794, 1.060112, -0.3946904, 0, 0, 0, 1, 1,
2.159093, 0.9230643, 0.2834347, 0, 0, 0, 1, 1,
2.166672, 1.952833, 0.5542812, 0, 0, 0, 1, 1,
2.20116, 0.6962191, 1.682045, 0, 0, 0, 1, 1,
2.201631, -0.3664586, 2.100121, 0, 0, 0, 1, 1,
2.238174, 0.7435829, 0.9896975, 0, 0, 0, 1, 1,
2.340472, -1.562282, 2.908331, 0, 0, 0, 1, 1,
2.404314, -0.363958, -0.1010252, 1, 1, 1, 1, 1,
2.433733, -0.05691832, 1.904306, 1, 1, 1, 1, 1,
2.437137, -0.7431759, 1.463328, 1, 1, 1, 1, 1,
2.48999, -0.7252237, 1.926237, 1, 1, 1, 1, 1,
2.61364, 0.7839596, 2.660641, 1, 1, 1, 1, 1,
2.718539, 1.173033, 2.538002, 1, 1, 1, 1, 1,
3.452954, 0.03775085, 1.99435, 1, 1, 1, 1, 1
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
var radius = 9.402045;
var distance = 33.02428;
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
mvMatrix.translate( -0.1162829, -0.06416011, 0.1921928 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.02428);
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