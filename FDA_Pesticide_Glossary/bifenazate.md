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
-3.104117, 0.2407434, -1.409842, 1, 0, 0, 1,
-2.769374, -0.8476924, -1.730221, 1, 0.007843138, 0, 1,
-2.73446, -0.9771001, -1.495228, 1, 0.01176471, 0, 1,
-2.733423, 0.1734215, -2.245206, 1, 0.01960784, 0, 1,
-2.52295, -0.1724051, -0.04181699, 1, 0.02352941, 0, 1,
-2.446268, 0.01351321, -1.95004, 1, 0.03137255, 0, 1,
-2.419703, 0.231237, -0.1926848, 1, 0.03529412, 0, 1,
-2.413043, 1.419272, -1.301682, 1, 0.04313726, 0, 1,
-2.407074, 0.4794317, -0.3593119, 1, 0.04705882, 0, 1,
-2.40701, 0.7335262, -1.030787, 1, 0.05490196, 0, 1,
-2.401946, -0.2858833, -1.366944, 1, 0.05882353, 0, 1,
-2.304432, 1.655858, -1.091394, 1, 0.06666667, 0, 1,
-2.282212, -0.8091401, -0.5411061, 1, 0.07058824, 0, 1,
-2.267805, -0.835961, -2.327911, 1, 0.07843138, 0, 1,
-2.201415, -0.1707216, -1.547111, 1, 0.08235294, 0, 1,
-2.196702, -0.5014869, -1.196698, 1, 0.09019608, 0, 1,
-2.164381, 0.8992803, -1.883559, 1, 0.09411765, 0, 1,
-2.108124, -0.6619161, -5.714354, 1, 0.1019608, 0, 1,
-2.098513, -1.049777, -0.3372576, 1, 0.1098039, 0, 1,
-2.084559, -1.423639, -3.783801, 1, 0.1137255, 0, 1,
-2.065969, -0.1098525, -2.229302, 1, 0.1215686, 0, 1,
-2.007233, -1.083709, -2.1258, 1, 0.1254902, 0, 1,
-1.991831, -0.4034718, -3.337044, 1, 0.1333333, 0, 1,
-1.978408, 0.3848667, -2.345935, 1, 0.1372549, 0, 1,
-1.97005, -0.3015749, -1.255969, 1, 0.145098, 0, 1,
-1.965946, 0.1447095, -1.501496, 1, 0.1490196, 0, 1,
-1.946844, 0.5347543, -2.342317, 1, 0.1568628, 0, 1,
-1.895305, 1.432622, 0.1759602, 1, 0.1607843, 0, 1,
-1.847858, 1.394609, -0.8442891, 1, 0.1686275, 0, 1,
-1.817229, 0.4742374, -1.646485, 1, 0.172549, 0, 1,
-1.804818, -0.9281909, -2.934762, 1, 0.1803922, 0, 1,
-1.803969, 1.704079, -0.1183975, 1, 0.1843137, 0, 1,
-1.799993, 0.7667159, -0.9542812, 1, 0.1921569, 0, 1,
-1.786346, -1.53735, -0.6271557, 1, 0.1960784, 0, 1,
-1.76638, -0.1333641, -1.846403, 1, 0.2039216, 0, 1,
-1.749942, 0.3412128, -1.592491, 1, 0.2117647, 0, 1,
-1.732229, -0.9203185, -1.413323, 1, 0.2156863, 0, 1,
-1.731139, -2.301156, -1.373817, 1, 0.2235294, 0, 1,
-1.730144, 0.518885, -1.004893, 1, 0.227451, 0, 1,
-1.710466, -0.9180094, -2.869377, 1, 0.2352941, 0, 1,
-1.693706, 0.1699608, -1.742972, 1, 0.2392157, 0, 1,
-1.693414, 0.1333447, -1.501232, 1, 0.2470588, 0, 1,
-1.692882, 1.468704, -1.411226, 1, 0.2509804, 0, 1,
-1.687157, 1.064629, 1.257202, 1, 0.2588235, 0, 1,
-1.684288, -0.4574697, -2.126599, 1, 0.2627451, 0, 1,
-1.682562, -1.104489, 0.427017, 1, 0.2705882, 0, 1,
-1.671702, -0.1272303, -0.8159966, 1, 0.2745098, 0, 1,
-1.67046, 1.804676, -3.249515, 1, 0.282353, 0, 1,
-1.661281, 1.174194, -0.4268352, 1, 0.2862745, 0, 1,
-1.660275, -1.879617, -1.09712, 1, 0.2941177, 0, 1,
-1.65005, 0.6738421, -0.4292201, 1, 0.3019608, 0, 1,
-1.630576, 0.1966631, -1.063486, 1, 0.3058824, 0, 1,
-1.630533, 0.1587504, -2.202334, 1, 0.3137255, 0, 1,
-1.628153, -0.1630769, -2.314407, 1, 0.3176471, 0, 1,
-1.614881, 1.031743, -1.281955, 1, 0.3254902, 0, 1,
-1.606962, 0.9720945, -0.4143671, 1, 0.3294118, 0, 1,
-1.592641, -0.9156641, -1.700683, 1, 0.3372549, 0, 1,
-1.547751, -0.3738038, -1.874355, 1, 0.3411765, 0, 1,
-1.538224, 1.009043, -0.4668258, 1, 0.3490196, 0, 1,
-1.526458, -1.355886, -2.599596, 1, 0.3529412, 0, 1,
-1.520921, 0.03861737, -1.79548, 1, 0.3607843, 0, 1,
-1.520784, 0.6706345, -0.9424689, 1, 0.3647059, 0, 1,
-1.509467, -0.05583728, -2.049914, 1, 0.372549, 0, 1,
-1.495523, -0.7306798, -0.00208829, 1, 0.3764706, 0, 1,
-1.481569, 0.0742426, -0.6684838, 1, 0.3843137, 0, 1,
-1.478104, 1.386455, -0.6968535, 1, 0.3882353, 0, 1,
-1.467831, -1.010918, -3.137126, 1, 0.3960784, 0, 1,
-1.462571, -1.150198, -4.114351, 1, 0.4039216, 0, 1,
-1.449553, 2.08462, 0.6481382, 1, 0.4078431, 0, 1,
-1.4453, -2.022941, -4.619147, 1, 0.4156863, 0, 1,
-1.441324, -0.8784649, -1.511545, 1, 0.4196078, 0, 1,
-1.433424, 0.4451459, -1.599993, 1, 0.427451, 0, 1,
-1.431678, -1.397016, -2.00583, 1, 0.4313726, 0, 1,
-1.426775, 0.5187663, 1.081517, 1, 0.4392157, 0, 1,
-1.425217, 0.6950923, -1.768122, 1, 0.4431373, 0, 1,
-1.42286, 0.04688885, -0.6470785, 1, 0.4509804, 0, 1,
-1.421835, -0.5486971, -1.304041, 1, 0.454902, 0, 1,
-1.417574, -0.156588, -0.5305222, 1, 0.4627451, 0, 1,
-1.411944, 2.839234, -0.7727892, 1, 0.4666667, 0, 1,
-1.411416, 0.2029751, -0.344732, 1, 0.4745098, 0, 1,
-1.404187, 0.7164894, -1.530124, 1, 0.4784314, 0, 1,
-1.39635, -0.5503617, -1.38026, 1, 0.4862745, 0, 1,
-1.391741, 2.478651, -1.52689, 1, 0.4901961, 0, 1,
-1.385859, 0.4931368, -1.880827, 1, 0.4980392, 0, 1,
-1.382164, -0.7679246, -2.520514, 1, 0.5058824, 0, 1,
-1.374995, -1.300973, -2.031848, 1, 0.509804, 0, 1,
-1.353807, 2.334255, 0.1610971, 1, 0.5176471, 0, 1,
-1.318262, -1.424577, -1.275124, 1, 0.5215687, 0, 1,
-1.312759, 1.035615, -2.075418, 1, 0.5294118, 0, 1,
-1.306241, -1.547289, -0.6247981, 1, 0.5333334, 0, 1,
-1.304068, -0.3474701, -2.756722, 1, 0.5411765, 0, 1,
-1.294506, 0.3694885, -0.1983474, 1, 0.5450981, 0, 1,
-1.291285, -0.5188944, -3.073411, 1, 0.5529412, 0, 1,
-1.288802, -1.079319, -2.91643, 1, 0.5568628, 0, 1,
-1.285723, -0.505101, -1.778589, 1, 0.5647059, 0, 1,
-1.284856, 2.553233, -1.771267, 1, 0.5686275, 0, 1,
-1.282538, 0.7138326, -3.229283, 1, 0.5764706, 0, 1,
-1.277022, 0.1754988, -2.568263, 1, 0.5803922, 0, 1,
-1.272348, -0.08255372, 0.4092579, 1, 0.5882353, 0, 1,
-1.267321, 0.5895124, -0.06425425, 1, 0.5921569, 0, 1,
-1.253954, -1.272739, -2.182904, 1, 0.6, 0, 1,
-1.253016, -1.300545, -4.287374, 1, 0.6078432, 0, 1,
-1.249501, -1.280032, -2.297399, 1, 0.6117647, 0, 1,
-1.240515, -0.5427917, -1.915363, 1, 0.6196079, 0, 1,
-1.234379, -1.046704, -1.814321, 1, 0.6235294, 0, 1,
-1.22688, -1.130663, -2.193902, 1, 0.6313726, 0, 1,
-1.226817, -0.7466692, -2.572914, 1, 0.6352941, 0, 1,
-1.226729, 0.972743, -0.08003531, 1, 0.6431373, 0, 1,
-1.226371, -0.3466721, -1.157819, 1, 0.6470588, 0, 1,
-1.225311, 0.9973017, -1.292997, 1, 0.654902, 0, 1,
-1.220209, 0.2366129, -1.489354, 1, 0.6588235, 0, 1,
-1.2126, 0.9332787, -1.670385, 1, 0.6666667, 0, 1,
-1.21018, -0.1856948, -0.3614267, 1, 0.6705883, 0, 1,
-1.207215, 1.119603, -0.2762738, 1, 0.6784314, 0, 1,
-1.206446, 0.5527502, -0.6566204, 1, 0.682353, 0, 1,
-1.203684, -1.128697, -1.453861, 1, 0.6901961, 0, 1,
-1.197678, 0.3434321, -0.5079273, 1, 0.6941177, 0, 1,
-1.188971, 0.6859484, -0.1804128, 1, 0.7019608, 0, 1,
-1.185318, 1.18014, -0.710894, 1, 0.7098039, 0, 1,
-1.183938, 0.3408936, -1.916781, 1, 0.7137255, 0, 1,
-1.160249, -0.8821092, -1.379183, 1, 0.7215686, 0, 1,
-1.15935, 0.4968559, -0.3919073, 1, 0.7254902, 0, 1,
-1.153264, 2.543271, -1.209651, 1, 0.7333333, 0, 1,
-1.15166, 2.155211, -1.30263, 1, 0.7372549, 0, 1,
-1.147344, -1.113232, -3.251071, 1, 0.7450981, 0, 1,
-1.142378, -0.9396347, -2.107376, 1, 0.7490196, 0, 1,
-1.141149, 0.5182614, -1.893777, 1, 0.7568628, 0, 1,
-1.138734, 1.086382, -0.3536899, 1, 0.7607843, 0, 1,
-1.138502, 0.8252249, -0.8262427, 1, 0.7686275, 0, 1,
-1.126638, 1.131702, -1.945645, 1, 0.772549, 0, 1,
-1.118524, 0.2696111, -0.4262297, 1, 0.7803922, 0, 1,
-1.106369, -0.4678743, -2.978524, 1, 0.7843137, 0, 1,
-1.105681, 0.1035343, -3.276731, 1, 0.7921569, 0, 1,
-1.09332, -0.3076957, -1.388328, 1, 0.7960784, 0, 1,
-1.090509, -0.2998967, -1.96794, 1, 0.8039216, 0, 1,
-1.077617, 1.206907, -1.103249, 1, 0.8117647, 0, 1,
-1.076952, -0.4899927, -1.874023, 1, 0.8156863, 0, 1,
-1.073766, 0.9876248, -0.5327806, 1, 0.8235294, 0, 1,
-1.047233, 0.1609074, -0.7139899, 1, 0.827451, 0, 1,
-1.046981, -0.707534, -1.476594, 1, 0.8352941, 0, 1,
-1.039473, -0.7005785, -4.7757, 1, 0.8392157, 0, 1,
-1.038881, -0.896084, -2.634211, 1, 0.8470588, 0, 1,
-1.030468, 1.742135, 2.366775, 1, 0.8509804, 0, 1,
-1.023047, 0.07992261, -1.760973, 1, 0.8588235, 0, 1,
-1.020624, 0.5535408, 0.2346435, 1, 0.8627451, 0, 1,
-1.020506, 0.5399561, 0.09275484, 1, 0.8705882, 0, 1,
-1.018991, 1.173873, -1.002979, 1, 0.8745098, 0, 1,
-1.015902, 0.8773178, -1.385998, 1, 0.8823529, 0, 1,
-1.009628, -0.663573, -2.451812, 1, 0.8862745, 0, 1,
-1.009309, 1.367468, -0.5219708, 1, 0.8941177, 0, 1,
-1.009275, -1.10404, -1.801319, 1, 0.8980392, 0, 1,
-1.008721, -0.7859022, -1.365176, 1, 0.9058824, 0, 1,
-0.993059, 1.71175, -0.5009593, 1, 0.9137255, 0, 1,
-0.9873183, -1.834586, -1.867386, 1, 0.9176471, 0, 1,
-0.9770855, -0.7123556, -2.124869, 1, 0.9254902, 0, 1,
-0.9709033, 0.9031243, -1.288071, 1, 0.9294118, 0, 1,
-0.9651862, 0.7684401, -1.994834, 1, 0.9372549, 0, 1,
-0.9594618, -0.3315684, -2.602789, 1, 0.9411765, 0, 1,
-0.9556837, -1.618736, -1.790649, 1, 0.9490196, 0, 1,
-0.9510996, 0.4066047, -2.218884, 1, 0.9529412, 0, 1,
-0.9429533, 0.931671, 0.6573681, 1, 0.9607843, 0, 1,
-0.9417145, 0.4944803, -0.4248517, 1, 0.9647059, 0, 1,
-0.9390802, 0.8917933, -0.3302417, 1, 0.972549, 0, 1,
-0.9380338, 1.430417, -1.344431, 1, 0.9764706, 0, 1,
-0.9357991, -0.6624228, -1.809658, 1, 0.9843137, 0, 1,
-0.9353091, 0.8995205, 0.7954255, 1, 0.9882353, 0, 1,
-0.9201283, -0.8728747, -2.623318, 1, 0.9960784, 0, 1,
-0.9192797, 0.0178251, -1.118768, 0.9960784, 1, 0, 1,
-0.9172946, 1.053439, -1.185946, 0.9921569, 1, 0, 1,
-0.9163719, 0.3312406, 0.2992114, 0.9843137, 1, 0, 1,
-0.9084104, 0.1434555, -1.521144, 0.9803922, 1, 0, 1,
-0.9052823, -2.257304, -1.758082, 0.972549, 1, 0, 1,
-0.8994888, 0.6984944, 0.8218983, 0.9686275, 1, 0, 1,
-0.89495, -0.553508, -0.4847763, 0.9607843, 1, 0, 1,
-0.890891, -0.8088511, -1.69561, 0.9568627, 1, 0, 1,
-0.8877358, -0.508761, -2.131577, 0.9490196, 1, 0, 1,
-0.8840672, -0.4407945, -2.777641, 0.945098, 1, 0, 1,
-0.8840457, -0.5691684, -1.852111, 0.9372549, 1, 0, 1,
-0.8833258, 0.82506, -0.08155143, 0.9333333, 1, 0, 1,
-0.8757414, 0.3216198, -0.8701066, 0.9254902, 1, 0, 1,
-0.8756245, -1.704629, -2.775207, 0.9215686, 1, 0, 1,
-0.8731689, 1.914136, 0.02769743, 0.9137255, 1, 0, 1,
-0.8576716, 0.5382399, -0.3167113, 0.9098039, 1, 0, 1,
-0.8454518, 1.72772, 0.2657595, 0.9019608, 1, 0, 1,
-0.8453619, -0.7958573, -1.758663, 0.8941177, 1, 0, 1,
-0.8402021, 0.9422346, -1.789391, 0.8901961, 1, 0, 1,
-0.8353598, 0.730139, -1.057261, 0.8823529, 1, 0, 1,
-0.8307606, 0.8868937, -0.9979412, 0.8784314, 1, 0, 1,
-0.8273239, 0.1432426, -1.976448, 0.8705882, 1, 0, 1,
-0.8227288, -0.8218986, -1.934296, 0.8666667, 1, 0, 1,
-0.8177562, -0.6961914, -1.607608, 0.8588235, 1, 0, 1,
-0.8118552, -0.2221484, -0.8351705, 0.854902, 1, 0, 1,
-0.8070212, 0.006675903, -2.106201, 0.8470588, 1, 0, 1,
-0.801823, 0.5481859, 0.0001512204, 0.8431373, 1, 0, 1,
-0.7959611, -1.075729, -1.623968, 0.8352941, 1, 0, 1,
-0.7959402, 0.1297766, -1.305634, 0.8313726, 1, 0, 1,
-0.7922335, 0.08490704, -1.124023, 0.8235294, 1, 0, 1,
-0.7908602, -0.3941904, 0.386085, 0.8196079, 1, 0, 1,
-0.7820758, -1.426529, -2.992675, 0.8117647, 1, 0, 1,
-0.7788672, -0.1872248, -1.192987, 0.8078431, 1, 0, 1,
-0.7785036, -2.380593, -4.09193, 0.8, 1, 0, 1,
-0.7780631, -2.996375, -1.828847, 0.7921569, 1, 0, 1,
-0.7705609, 0.8130523, 0.5834584, 0.7882353, 1, 0, 1,
-0.770545, -1.388545, -2.699327, 0.7803922, 1, 0, 1,
-0.7664036, -0.4990384, -2.585428, 0.7764706, 1, 0, 1,
-0.7637453, 1.298781, 0.21941, 0.7686275, 1, 0, 1,
-0.7556061, -0.6857958, -3.880856, 0.7647059, 1, 0, 1,
-0.7474875, 0.2544267, -0.7402828, 0.7568628, 1, 0, 1,
-0.7469232, 0.9847224, -0.4035341, 0.7529412, 1, 0, 1,
-0.7468511, 0.6429299, -1.550697, 0.7450981, 1, 0, 1,
-0.7437139, -1.183421, -3.709605, 0.7411765, 1, 0, 1,
-0.7381271, 0.3080112, -1.304577, 0.7333333, 1, 0, 1,
-0.7380503, 1.060611, -1.410597, 0.7294118, 1, 0, 1,
-0.729365, -0.3830175, -2.687643, 0.7215686, 1, 0, 1,
-0.7247356, 0.1061909, -1.42552, 0.7176471, 1, 0, 1,
-0.7220775, 1.346054, 1.382161, 0.7098039, 1, 0, 1,
-0.7177687, -0.1878676, -0.06147543, 0.7058824, 1, 0, 1,
-0.7163902, -1.116894, -1.639488, 0.6980392, 1, 0, 1,
-0.7131704, -1.026774, -2.050557, 0.6901961, 1, 0, 1,
-0.7111745, 0.332601, -0.957548, 0.6862745, 1, 0, 1,
-0.7061015, 0.4484004, 0.1490598, 0.6784314, 1, 0, 1,
-0.7043195, -0.4960807, -2.848969, 0.6745098, 1, 0, 1,
-0.6994848, -0.972325, -1.729621, 0.6666667, 1, 0, 1,
-0.6961427, 1.200767, 2.362166, 0.6627451, 1, 0, 1,
-0.6957851, 0.7498266, -0.4695619, 0.654902, 1, 0, 1,
-0.6933038, 0.4101671, -1.470781, 0.6509804, 1, 0, 1,
-0.69222, 0.1587999, -0.2038453, 0.6431373, 1, 0, 1,
-0.6871787, 0.0249058, -0.2695693, 0.6392157, 1, 0, 1,
-0.6857763, -0.6281547, -2.419892, 0.6313726, 1, 0, 1,
-0.6839697, -0.1714826, -1.3966, 0.627451, 1, 0, 1,
-0.6831118, -0.9199568, -2.199127, 0.6196079, 1, 0, 1,
-0.682356, 1.427233, -2.071035, 0.6156863, 1, 0, 1,
-0.6760519, -1.35121, -2.337913, 0.6078432, 1, 0, 1,
-0.6646549, -0.5951909, -2.660342, 0.6039216, 1, 0, 1,
-0.6643378, 1.557654, -0.732694, 0.5960785, 1, 0, 1,
-0.6621127, 0.2570275, -2.549043, 0.5882353, 1, 0, 1,
-0.6611656, -1.088341, -3.048189, 0.5843138, 1, 0, 1,
-0.6606609, -0.6142542, -3.031635, 0.5764706, 1, 0, 1,
-0.6606061, -0.9757547, -3.137007, 0.572549, 1, 0, 1,
-0.6563417, 0.3930668, -2.172593, 0.5647059, 1, 0, 1,
-0.6543199, -0.7880518, -2.867447, 0.5607843, 1, 0, 1,
-0.6424925, 1.688352, -1.782708, 0.5529412, 1, 0, 1,
-0.6397501, -0.2500458, -1.77022, 0.5490196, 1, 0, 1,
-0.6375183, -0.4856446, -0.578085, 0.5411765, 1, 0, 1,
-0.6361735, -0.1574848, -2.108939, 0.5372549, 1, 0, 1,
-0.6315396, -0.492791, -2.550672, 0.5294118, 1, 0, 1,
-0.6304247, -0.4770475, -1.922883, 0.5254902, 1, 0, 1,
-0.6292874, -0.05691608, -2.334856, 0.5176471, 1, 0, 1,
-0.6240262, 1.364544, 0.1656279, 0.5137255, 1, 0, 1,
-0.6223952, 0.9591166, -0.2012501, 0.5058824, 1, 0, 1,
-0.6223537, 1.40825, -0.3010762, 0.5019608, 1, 0, 1,
-0.6214924, -0.3444754, -2.692391, 0.4941176, 1, 0, 1,
-0.6202121, -1.5008, -1.457331, 0.4862745, 1, 0, 1,
-0.6201, -1.467614, -2.243389, 0.4823529, 1, 0, 1,
-0.6181849, 1.498774, -1.310956, 0.4745098, 1, 0, 1,
-0.6181383, 1.163449, -0.05534058, 0.4705882, 1, 0, 1,
-0.6159989, -0.08256084, -1.509922, 0.4627451, 1, 0, 1,
-0.6152623, -0.8931642, -1.232791, 0.4588235, 1, 0, 1,
-0.6141971, 0.08703623, -2.353245, 0.4509804, 1, 0, 1,
-0.6141322, -0.2582898, -0.9278081, 0.4470588, 1, 0, 1,
-0.6133097, -0.7217731, -3.392988, 0.4392157, 1, 0, 1,
-0.6109504, 0.862809, 1.34771, 0.4352941, 1, 0, 1,
-0.6105295, -0.1474736, -1.970411, 0.427451, 1, 0, 1,
-0.60691, -1.279635, -2.715848, 0.4235294, 1, 0, 1,
-0.5999827, -0.4997713, -1.826542, 0.4156863, 1, 0, 1,
-0.5933089, -1.43215, -3.912661, 0.4117647, 1, 0, 1,
-0.5914763, 0.5894896, -0.2980967, 0.4039216, 1, 0, 1,
-0.587215, 1.702913, 0.788099, 0.3960784, 1, 0, 1,
-0.5824669, -0.1779971, -0.5186678, 0.3921569, 1, 0, 1,
-0.5813364, 0.5872017, 0.3975493, 0.3843137, 1, 0, 1,
-0.5787581, 2.322597, -0.3422508, 0.3803922, 1, 0, 1,
-0.5749949, -0.07215814, -2.502555, 0.372549, 1, 0, 1,
-0.571786, 0.2545452, -2.127125, 0.3686275, 1, 0, 1,
-0.5710722, 0.8681549, -1.150402, 0.3607843, 1, 0, 1,
-0.5708688, -0.7215563, -2.104431, 0.3568628, 1, 0, 1,
-0.5696469, -0.3595022, -1.705102, 0.3490196, 1, 0, 1,
-0.5671397, 0.08552916, -1.394022, 0.345098, 1, 0, 1,
-0.5598766, -1.029775, -4.171605, 0.3372549, 1, 0, 1,
-0.5584366, 0.695551, 0.6889837, 0.3333333, 1, 0, 1,
-0.5513542, 0.5973224, -1.108592, 0.3254902, 1, 0, 1,
-0.5503132, -0.1987961, -3.9959, 0.3215686, 1, 0, 1,
-0.5501062, 1.198102, 0.1136516, 0.3137255, 1, 0, 1,
-0.5484151, 1.384142, -1.73941, 0.3098039, 1, 0, 1,
-0.5463954, 0.4768522, -1.316502, 0.3019608, 1, 0, 1,
-0.5451815, -0.7656599, -3.100729, 0.2941177, 1, 0, 1,
-0.5445951, 1.219431, -0.3801833, 0.2901961, 1, 0, 1,
-0.5417056, 1.296832, -0.6463791, 0.282353, 1, 0, 1,
-0.5407605, -0.3118496, -2.577566, 0.2784314, 1, 0, 1,
-0.5386762, 0.3147172, -0.8591912, 0.2705882, 1, 0, 1,
-0.5385205, 0.09951083, -2.672364, 0.2666667, 1, 0, 1,
-0.5322151, -0.2816221, -1.680312, 0.2588235, 1, 0, 1,
-0.529628, -0.571242, -4.689042, 0.254902, 1, 0, 1,
-0.5281065, 0.2628309, -3.177431, 0.2470588, 1, 0, 1,
-0.5222595, 1.254905, -0.07067302, 0.2431373, 1, 0, 1,
-0.5208711, 1.064123, -1.20267, 0.2352941, 1, 0, 1,
-0.5188035, 1.703903, -1.010062, 0.2313726, 1, 0, 1,
-0.5171559, -1.120456, -3.348608, 0.2235294, 1, 0, 1,
-0.5164076, 0.7068517, 0.2666032, 0.2196078, 1, 0, 1,
-0.5105429, -1.089594, -0.2170578, 0.2117647, 1, 0, 1,
-0.5068711, 1.622847, -0.4261562, 0.2078431, 1, 0, 1,
-0.5057131, -1.620899, -4.234492, 0.2, 1, 0, 1,
-0.5041384, -0.7829248, -3.592948, 0.1921569, 1, 0, 1,
-0.493123, 1.149418, -0.3186902, 0.1882353, 1, 0, 1,
-0.4891002, 0.3119578, -1.874517, 0.1803922, 1, 0, 1,
-0.4858732, 2.44629, 1.182866, 0.1764706, 1, 0, 1,
-0.4827645, 0.6827579, 1.399516, 0.1686275, 1, 0, 1,
-0.4820921, 1.530417, 0.1280846, 0.1647059, 1, 0, 1,
-0.4813021, -0.673129, -1.666359, 0.1568628, 1, 0, 1,
-0.4809954, -1.220633, -3.686338, 0.1529412, 1, 0, 1,
-0.4788023, 0.920488, -1.47774, 0.145098, 1, 0, 1,
-0.4777169, 0.504321, 1.356131, 0.1411765, 1, 0, 1,
-0.4753363, 0.7339007, 0.6843311, 0.1333333, 1, 0, 1,
-0.4743744, 0.4370369, 0.2576981, 0.1294118, 1, 0, 1,
-0.4691232, -0.6768064, -3.998777, 0.1215686, 1, 0, 1,
-0.4668741, -0.137883, -3.219358, 0.1176471, 1, 0, 1,
-0.4657014, -0.215216, -2.646642, 0.1098039, 1, 0, 1,
-0.4654982, -1.918382, -2.524287, 0.1058824, 1, 0, 1,
-0.4654576, 0.02178322, -0.0750791, 0.09803922, 1, 0, 1,
-0.4615191, 0.6820169, 0.9182997, 0.09019608, 1, 0, 1,
-0.4605452, -1.162846, -4.44178, 0.08627451, 1, 0, 1,
-0.4575096, -1.381374, -2.262547, 0.07843138, 1, 0, 1,
-0.45554, -0.1741042, -2.158499, 0.07450981, 1, 0, 1,
-0.4545047, 1.696671, -1.307993, 0.06666667, 1, 0, 1,
-0.447921, 0.3785333, -1.515302, 0.0627451, 1, 0, 1,
-0.4429953, -0.6251609, -2.412329, 0.05490196, 1, 0, 1,
-0.4327511, 0.4631182, -0.3197416, 0.05098039, 1, 0, 1,
-0.4294116, -0.05300665, -2.144884, 0.04313726, 1, 0, 1,
-0.4201147, 0.4072845, -0.4697817, 0.03921569, 1, 0, 1,
-0.4198114, 0.1053633, -2.246341, 0.03137255, 1, 0, 1,
-0.4187593, 1.535336, -1.232311, 0.02745098, 1, 0, 1,
-0.4180094, -0.3655562, -3.153701, 0.01960784, 1, 0, 1,
-0.4139504, 0.5418334, -0.7225884, 0.01568628, 1, 0, 1,
-0.4129416, 0.2144473, -1.790464, 0.007843138, 1, 0, 1,
-0.4107554, 0.403286, -0.5713292, 0.003921569, 1, 0, 1,
-0.4046209, -0.01978492, -2.290493, 0, 1, 0.003921569, 1,
-0.4035312, -0.07817387, -1.95647, 0, 1, 0.01176471, 1,
-0.40221, -0.1144973, -2.586332, 0, 1, 0.01568628, 1,
-0.3990194, -0.5833658, -1.565264, 0, 1, 0.02352941, 1,
-0.3931136, 0.05315603, -1.224323, 0, 1, 0.02745098, 1,
-0.3921733, 0.4155014, 1.293262, 0, 1, 0.03529412, 1,
-0.3909458, -0.6299087, -4.073394, 0, 1, 0.03921569, 1,
-0.3887045, 0.07713053, -3.047962, 0, 1, 0.04705882, 1,
-0.3863599, 1.644982, 2.103285, 0, 1, 0.05098039, 1,
-0.3844543, -0.5580795, -1.696062, 0, 1, 0.05882353, 1,
-0.382597, 0.02944325, -0.1120018, 0, 1, 0.0627451, 1,
-0.3818684, 0.347894, -2.716389, 0, 1, 0.07058824, 1,
-0.3817593, 0.5798751, -0.5500122, 0, 1, 0.07450981, 1,
-0.3816618, -0.2217787, -1.160657, 0, 1, 0.08235294, 1,
-0.3807792, -0.5935167, -4.459723, 0, 1, 0.08627451, 1,
-0.3797752, 1.26896, -1.289542, 0, 1, 0.09411765, 1,
-0.3793225, -0.02951217, -2.615531, 0, 1, 0.1019608, 1,
-0.3789143, 0.9287376, -1.634477, 0, 1, 0.1058824, 1,
-0.3781655, -0.130798, 0.9300409, 0, 1, 0.1137255, 1,
-0.3755617, -0.7057341, -4.06126, 0, 1, 0.1176471, 1,
-0.3635049, 1.632218, -0.4403675, 0, 1, 0.1254902, 1,
-0.3579834, -0.4012555, -0.6771818, 0, 1, 0.1294118, 1,
-0.3537299, -0.843172, -2.711231, 0, 1, 0.1372549, 1,
-0.350238, 0.6439613, -1.438879, 0, 1, 0.1411765, 1,
-0.3491755, -1.985687, -1.657023, 0, 1, 0.1490196, 1,
-0.3422183, 0.9093628, -1.002583, 0, 1, 0.1529412, 1,
-0.3420542, 1.421988, -0.348324, 0, 1, 0.1607843, 1,
-0.3414362, 0.04319803, -1.061764, 0, 1, 0.1647059, 1,
-0.3351698, -0.4660714, -4.040874, 0, 1, 0.172549, 1,
-0.329633, -1.038915, -3.814466, 0, 1, 0.1764706, 1,
-0.3292578, -0.08737597, -2.092995, 0, 1, 0.1843137, 1,
-0.3198344, -0.9114174, -0.8005504, 0, 1, 0.1882353, 1,
-0.3190922, -1.34591, -2.172645, 0, 1, 0.1960784, 1,
-0.3153076, 1.138709, 0.694442, 0, 1, 0.2039216, 1,
-0.3086383, 0.9409539, 0.4092091, 0, 1, 0.2078431, 1,
-0.3066041, -0.09764729, -3.106148, 0, 1, 0.2156863, 1,
-0.3013178, 1.214267, 0.8281796, 0, 1, 0.2196078, 1,
-0.2979404, 0.2278557, -0.705061, 0, 1, 0.227451, 1,
-0.2957364, -0.4499893, -2.031271, 0, 1, 0.2313726, 1,
-0.2945419, -1.234974, -3.299674, 0, 1, 0.2392157, 1,
-0.2931696, 0.4053733, 0.7639264, 0, 1, 0.2431373, 1,
-0.2915971, -0.0913062, -2.972358, 0, 1, 0.2509804, 1,
-0.2899187, 0.3663189, -2.484972, 0, 1, 0.254902, 1,
-0.2883434, -1.347264, -2.567083, 0, 1, 0.2627451, 1,
-0.2880382, -0.8874717, -3.664087, 0, 1, 0.2666667, 1,
-0.285585, -1.56795, -2.052203, 0, 1, 0.2745098, 1,
-0.2822387, 0.6532639, -0.880821, 0, 1, 0.2784314, 1,
-0.2819864, 0.5725635, -0.7497704, 0, 1, 0.2862745, 1,
-0.2784474, 1.109498, -0.8800343, 0, 1, 0.2901961, 1,
-0.2759109, -0.3058659, -2.004983, 0, 1, 0.2980392, 1,
-0.2753158, 0.2980481, 0.5814532, 0, 1, 0.3058824, 1,
-0.271218, 0.9784556, -1.454836, 0, 1, 0.3098039, 1,
-0.2709735, 1.281011, -0.481189, 0, 1, 0.3176471, 1,
-0.2688271, 1.255984, 0.7373368, 0, 1, 0.3215686, 1,
-0.2683296, 2.829037, -0.725697, 0, 1, 0.3294118, 1,
-0.2607429, -0.07059921, -2.685076, 0, 1, 0.3333333, 1,
-0.2583334, -0.5252843, -2.473004, 0, 1, 0.3411765, 1,
-0.2567074, 0.2311853, -1.294476, 0, 1, 0.345098, 1,
-0.2561853, -0.8523009, -0.7176431, 0, 1, 0.3529412, 1,
-0.2556118, 1.305927, 0.06943981, 0, 1, 0.3568628, 1,
-0.2537527, -0.2695565, -3.222164, 0, 1, 0.3647059, 1,
-0.2535428, 1.11262, -0.9026977, 0, 1, 0.3686275, 1,
-0.2469928, -0.4819948, -2.593154, 0, 1, 0.3764706, 1,
-0.2390675, 1.764332, -1.035004, 0, 1, 0.3803922, 1,
-0.2366836, -0.7220659, -2.999557, 0, 1, 0.3882353, 1,
-0.234065, 0.2224462, -1.393336, 0, 1, 0.3921569, 1,
-0.2282324, -1.070114, -3.534271, 0, 1, 0.4, 1,
-0.2261836, -0.7262781, -3.977936, 0, 1, 0.4078431, 1,
-0.2249568, 1.330097, -0.9983605, 0, 1, 0.4117647, 1,
-0.2234151, -0.7136316, -0.952081, 0, 1, 0.4196078, 1,
-0.2221865, -0.4376712, -1.770318, 0, 1, 0.4235294, 1,
-0.2208961, 1.142822, -1.47283, 0, 1, 0.4313726, 1,
-0.2204291, 0.9437681, 0.09302162, 0, 1, 0.4352941, 1,
-0.214207, 0.9557382, 0.4255713, 0, 1, 0.4431373, 1,
-0.213827, -0.4509098, -4.435237, 0, 1, 0.4470588, 1,
-0.2134418, 0.5385003, 1.340519, 0, 1, 0.454902, 1,
-0.2127305, 1.948617, -0.2984408, 0, 1, 0.4588235, 1,
-0.2125568, -0.7146204, -3.18972, 0, 1, 0.4666667, 1,
-0.2093845, -0.6695461, -3.725706, 0, 1, 0.4705882, 1,
-0.208964, 0.8063827, 0.2093719, 0, 1, 0.4784314, 1,
-0.20029, -1.391295, -2.957003, 0, 1, 0.4823529, 1,
-0.1995754, -0.7766994, -0.9312875, 0, 1, 0.4901961, 1,
-0.193974, -0.1587764, -1.509089, 0, 1, 0.4941176, 1,
-0.1938833, 1.942382, 0.4668112, 0, 1, 0.5019608, 1,
-0.1936104, -0.1666387, -2.518474, 0, 1, 0.509804, 1,
-0.1931765, -0.5045274, 0.4475757, 0, 1, 0.5137255, 1,
-0.1929992, -0.1869915, -2.677949, 0, 1, 0.5215687, 1,
-0.192435, -0.4063175, -2.058169, 0, 1, 0.5254902, 1,
-0.188322, 0.6460648, 2.385228, 0, 1, 0.5333334, 1,
-0.1838223, 1.490384, 0.1951648, 0, 1, 0.5372549, 1,
-0.1820917, -0.1926843, -3.381148, 0, 1, 0.5450981, 1,
-0.1806083, -1.767035, -4.865869, 0, 1, 0.5490196, 1,
-0.1801331, 0.1875006, 0.07532154, 0, 1, 0.5568628, 1,
-0.1750194, 0.8612427, 0.4122136, 0, 1, 0.5607843, 1,
-0.1749306, -0.02645857, -2.845465, 0, 1, 0.5686275, 1,
-0.1736121, -1.853155, -3.575133, 0, 1, 0.572549, 1,
-0.1707041, -3.023474, -2.5696, 0, 1, 0.5803922, 1,
-0.1698541, -0.1138172, -2.21036, 0, 1, 0.5843138, 1,
-0.1692129, 1.42094, 1.122661, 0, 1, 0.5921569, 1,
-0.1688095, 0.4237152, -0.5962553, 0, 1, 0.5960785, 1,
-0.1685407, 1.827326, -0.2281081, 0, 1, 0.6039216, 1,
-0.166435, 0.1946472, -1.597475, 0, 1, 0.6117647, 1,
-0.1545739, -0.216305, -2.362343, 0, 1, 0.6156863, 1,
-0.1531741, -0.0678442, -0.587535, 0, 1, 0.6235294, 1,
-0.1422565, -1.139527, -2.760029, 0, 1, 0.627451, 1,
-0.1408907, 1.201305, 0.2815641, 0, 1, 0.6352941, 1,
-0.1398791, -0.3221736, -3.0985, 0, 1, 0.6392157, 1,
-0.1396964, 0.9199724, -0.8690402, 0, 1, 0.6470588, 1,
-0.1394549, 0.153424, -0.7413437, 0, 1, 0.6509804, 1,
-0.1394106, 0.4910868, -0.8705901, 0, 1, 0.6588235, 1,
-0.1342689, -1.670188, -2.206227, 0, 1, 0.6627451, 1,
-0.134126, 0.6392346, 0.7955481, 0, 1, 0.6705883, 1,
-0.1338896, 0.7153258, -1.923297, 0, 1, 0.6745098, 1,
-0.1316312, 0.1114204, -0.7652627, 0, 1, 0.682353, 1,
-0.1307315, -0.9039484, -1.477354, 0, 1, 0.6862745, 1,
-0.1225547, -0.03503294, -1.688843, 0, 1, 0.6941177, 1,
-0.1210974, -1.114658, -1.44826, 0, 1, 0.7019608, 1,
-0.114926, 0.5022789, -1.23987, 0, 1, 0.7058824, 1,
-0.1123693, -0.1263761, -2.033597, 0, 1, 0.7137255, 1,
-0.1118775, -0.4022211, -2.991441, 0, 1, 0.7176471, 1,
-0.1115989, -0.1158562, -1.05388, 0, 1, 0.7254902, 1,
-0.1060592, -0.6583929, -1.408081, 0, 1, 0.7294118, 1,
-0.1042897, -0.4317645, -2.502056, 0, 1, 0.7372549, 1,
-0.1031113, 1.82096, 0.05234952, 0, 1, 0.7411765, 1,
-0.09956535, 0.6067981, -1.563637, 0, 1, 0.7490196, 1,
-0.09838254, 0.8872279, -1.074259, 0, 1, 0.7529412, 1,
-0.09162448, 0.3149316, 0.9903942, 0, 1, 0.7607843, 1,
-0.09108102, -0.8417178, -1.379384, 0, 1, 0.7647059, 1,
-0.08582316, -1.722568, -2.750993, 0, 1, 0.772549, 1,
-0.08443506, -1.493118, -3.385455, 0, 1, 0.7764706, 1,
-0.08170793, -0.8060957, -4.179518, 0, 1, 0.7843137, 1,
-0.07897837, -0.8379155, -2.952817, 0, 1, 0.7882353, 1,
-0.07714683, 0.2923224, -1.890207, 0, 1, 0.7960784, 1,
-0.07307957, -0.3647961, -3.232199, 0, 1, 0.8039216, 1,
-0.06584059, -0.2145361, -4.064445, 0, 1, 0.8078431, 1,
-0.06258135, -0.09323557, -2.26567, 0, 1, 0.8156863, 1,
-0.05989076, -0.517584, -4.496453, 0, 1, 0.8196079, 1,
-0.0588741, -0.2523387, -2.334317, 0, 1, 0.827451, 1,
-0.05720859, 0.200187, -0.1946924, 0, 1, 0.8313726, 1,
-0.05700444, -0.2572705, -2.473992, 0, 1, 0.8392157, 1,
-0.05594213, 0.6117627, -0.2037446, 0, 1, 0.8431373, 1,
-0.05333699, -0.233016, -2.121369, 0, 1, 0.8509804, 1,
-0.04864401, -1.162142, -2.560342, 0, 1, 0.854902, 1,
-0.04723487, -0.8893842, -3.17034, 0, 1, 0.8627451, 1,
-0.04604615, 0.79592, 0.7619207, 0, 1, 0.8666667, 1,
-0.04374935, 0.2935889, -0.591841, 0, 1, 0.8745098, 1,
-0.042842, -0.6345323, -3.108148, 0, 1, 0.8784314, 1,
-0.03444533, 0.2450362, 0.8342472, 0, 1, 0.8862745, 1,
-0.03288618, -0.8459377, -4.167878, 0, 1, 0.8901961, 1,
-0.02992185, -0.05505404, -4.421848, 0, 1, 0.8980392, 1,
-0.02768724, 1.75846, -1.155223, 0, 1, 0.9058824, 1,
-0.02693736, 1.166256, -0.7349037, 0, 1, 0.9098039, 1,
-0.02463506, 1.714644, 0.427507, 0, 1, 0.9176471, 1,
-0.01947726, -0.3871674, -2.989135, 0, 1, 0.9215686, 1,
-0.01832081, -0.5032093, -3.478132, 0, 1, 0.9294118, 1,
-0.01355238, -0.6673168, -3.139546, 0, 1, 0.9333333, 1,
-0.008573831, -0.1714996, -1.586058, 0, 1, 0.9411765, 1,
-0.007901233, 2.645759, -1.455758, 0, 1, 0.945098, 1,
-0.007846381, 1.111077, -1.143324, 0, 1, 0.9529412, 1,
-0.006063465, 0.648632, -0.6297621, 0, 1, 0.9568627, 1,
-0.005602942, 1.191296, 2.330543, 0, 1, 0.9647059, 1,
-0.0004190331, -0.4079103, -2.476328, 0, 1, 0.9686275, 1,
0.002132296, -0.3378089, 2.799378, 0, 1, 0.9764706, 1,
0.00217073, 2.058859, -0.2167494, 0, 1, 0.9803922, 1,
0.007404285, -0.8539444, 2.672821, 0, 1, 0.9882353, 1,
0.01147164, -1.516582, 2.733852, 0, 1, 0.9921569, 1,
0.01151689, 0.8785282, -2.406396, 0, 1, 1, 1,
0.0148283, -0.07003769, 2.250699, 0, 0.9921569, 1, 1,
0.01688658, -1.309123, 4.45072, 0, 0.9882353, 1, 1,
0.02846911, 0.8829603, -0.9036578, 0, 0.9803922, 1, 1,
0.03209946, -0.806064, 3.33588, 0, 0.9764706, 1, 1,
0.03926279, 0.2340633, 0.2623934, 0, 0.9686275, 1, 1,
0.03987789, -0.2438755, 0.9816911, 0, 0.9647059, 1, 1,
0.040326, 0.6713896, -1.946754, 0, 0.9568627, 1, 1,
0.04120042, 0.1223355, -1.09578, 0, 0.9529412, 1, 1,
0.04809095, 0.6951629, -0.1984302, 0, 0.945098, 1, 1,
0.05199599, 0.2053598, 0.403444, 0, 0.9411765, 1, 1,
0.05238878, -0.530791, 5.627048, 0, 0.9333333, 1, 1,
0.05269086, -0.8650918, 2.418322, 0, 0.9294118, 1, 1,
0.05354975, -0.649436, 0.4919238, 0, 0.9215686, 1, 1,
0.05646221, 0.4590196, 0.4497787, 0, 0.9176471, 1, 1,
0.06389033, 0.9773624, 1.371364, 0, 0.9098039, 1, 1,
0.064785, 1.206396, 0.7609266, 0, 0.9058824, 1, 1,
0.06481506, -1.577063, 2.877548, 0, 0.8980392, 1, 1,
0.06883053, -1.492529, 4.171392, 0, 0.8901961, 1, 1,
0.07123405, -0.05646582, 2.538428, 0, 0.8862745, 1, 1,
0.07192003, 0.1482232, 0.8725711, 0, 0.8784314, 1, 1,
0.07309504, 0.624402, -0.7967108, 0, 0.8745098, 1, 1,
0.075207, 0.1167787, -0.1326552, 0, 0.8666667, 1, 1,
0.07690948, 0.5699351, 0.6662823, 0, 0.8627451, 1, 1,
0.0783602, 2.843575, 1.673938, 0, 0.854902, 1, 1,
0.07842495, -2.206779, 1.42869, 0, 0.8509804, 1, 1,
0.0791643, 0.3161135, 1.792544, 0, 0.8431373, 1, 1,
0.07953809, 0.5146623, -0.48836, 0, 0.8392157, 1, 1,
0.08015848, -0.8907362, 4.080538, 0, 0.8313726, 1, 1,
0.08310132, 1.848885, -0.6589466, 0, 0.827451, 1, 1,
0.08340751, -0.8482614, 2.523405, 0, 0.8196079, 1, 1,
0.08411095, 1.471119, 0.7661082, 0, 0.8156863, 1, 1,
0.08903038, -1.225004, 3.113274, 0, 0.8078431, 1, 1,
0.09349135, 0.2302878, 0.8539122, 0, 0.8039216, 1, 1,
0.09461123, -1.185879, 2.026997, 0, 0.7960784, 1, 1,
0.0999048, -2.358488, 4.73941, 0, 0.7882353, 1, 1,
0.1026076, 1.023129, 0.2101406, 0, 0.7843137, 1, 1,
0.1060022, 0.8886979, 0.3696983, 0, 0.7764706, 1, 1,
0.1062553, -0.4167355, 3.327811, 0, 0.772549, 1, 1,
0.1146021, -0.2095872, 2.004971, 0, 0.7647059, 1, 1,
0.1167392, -2.23714, 3.732997, 0, 0.7607843, 1, 1,
0.1175138, -0.2109058, 3.575287, 0, 0.7529412, 1, 1,
0.1202714, -2.071697, 4.676305, 0, 0.7490196, 1, 1,
0.1226238, 0.9395183, 0.9443467, 0, 0.7411765, 1, 1,
0.1287053, -0.7939592, 2.930703, 0, 0.7372549, 1, 1,
0.1330915, -1.282303, 3.34885, 0, 0.7294118, 1, 1,
0.136245, -0.2507826, 1.635048, 0, 0.7254902, 1, 1,
0.1385888, 1.978862, -0.07362229, 0, 0.7176471, 1, 1,
0.1394896, 1.227774, 1.277337, 0, 0.7137255, 1, 1,
0.1421962, -0.727474, 2.017907, 0, 0.7058824, 1, 1,
0.1426329, -0.02382203, 1.214856, 0, 0.6980392, 1, 1,
0.1442298, 0.3467304, 0.5251555, 0, 0.6941177, 1, 1,
0.146081, -1.414271, 3.218379, 0, 0.6862745, 1, 1,
0.146254, 0.5177163, 0.585209, 0, 0.682353, 1, 1,
0.147406, -0.02932558, 1.501201, 0, 0.6745098, 1, 1,
0.1480206, -0.3581161, 3.529435, 0, 0.6705883, 1, 1,
0.1492497, -1.673412, 3.740384, 0, 0.6627451, 1, 1,
0.1532187, 1.232885, 0.7772087, 0, 0.6588235, 1, 1,
0.1546373, -0.1148658, 4.815078, 0, 0.6509804, 1, 1,
0.1560607, -0.8492461, 3.066047, 0, 0.6470588, 1, 1,
0.1622272, 0.9619021, 0.7796612, 0, 0.6392157, 1, 1,
0.1642672, -0.474973, 2.013527, 0, 0.6352941, 1, 1,
0.1666354, -0.5742058, 2.39875, 0, 0.627451, 1, 1,
0.1686238, 0.2158054, -0.2414895, 0, 0.6235294, 1, 1,
0.1694576, 0.3157167, -1.015272, 0, 0.6156863, 1, 1,
0.1711883, 0.3189323, 0.2126046, 0, 0.6117647, 1, 1,
0.1713941, -0.1085206, 1.833234, 0, 0.6039216, 1, 1,
0.1738284, 0.3949244, -0.02343888, 0, 0.5960785, 1, 1,
0.1758947, 0.7356759, 0.7950954, 0, 0.5921569, 1, 1,
0.1790881, 0.6963152, -0.08242053, 0, 0.5843138, 1, 1,
0.1843431, -1.299184, 4.184062, 0, 0.5803922, 1, 1,
0.1931381, 1.28314, -0.07481325, 0, 0.572549, 1, 1,
0.1936051, 0.1174492, -0.03895045, 0, 0.5686275, 1, 1,
0.1971069, 0.04204152, -0.1226062, 0, 0.5607843, 1, 1,
0.2023329, 0.3034093, 0.02295741, 0, 0.5568628, 1, 1,
0.2036417, 1.192528, 1.254989, 0, 0.5490196, 1, 1,
0.2039935, -0.08014704, 3.10377, 0, 0.5450981, 1, 1,
0.2113083, -0.06146488, 1.19503, 0, 0.5372549, 1, 1,
0.2168213, 0.873926, 0.3306769, 0, 0.5333334, 1, 1,
0.2216764, -0.7481971, 3.685681, 0, 0.5254902, 1, 1,
0.2239928, -2.663275, 2.781234, 0, 0.5215687, 1, 1,
0.2285369, 1.294665, 1.538974, 0, 0.5137255, 1, 1,
0.2297463, -0.7382376, 2.564862, 0, 0.509804, 1, 1,
0.2303349, -0.05703741, -0.601121, 0, 0.5019608, 1, 1,
0.2304534, 0.4239561, 2.550771, 0, 0.4941176, 1, 1,
0.2319854, 0.1063002, -0.006425591, 0, 0.4901961, 1, 1,
0.2328921, 0.4558624, 1.1804, 0, 0.4823529, 1, 1,
0.2331006, 1.157693, -0.5181722, 0, 0.4784314, 1, 1,
0.2378792, 1.468663, 0.05080733, 0, 0.4705882, 1, 1,
0.2385204, 0.0432386, -0.07870059, 0, 0.4666667, 1, 1,
0.2441554, 0.4043755, 1.052715, 0, 0.4588235, 1, 1,
0.2456102, 1.014262, 0.2937711, 0, 0.454902, 1, 1,
0.2467367, -0.4298653, 3.670931, 0, 0.4470588, 1, 1,
0.2473649, 0.394549, 0.06602596, 0, 0.4431373, 1, 1,
0.2475206, -0.6297576, 2.394313, 0, 0.4352941, 1, 1,
0.247881, -0.3215367, 0.6909063, 0, 0.4313726, 1, 1,
0.2535843, 0.6018144, 0.5805641, 0, 0.4235294, 1, 1,
0.2579181, -0.9494199, 2.774521, 0, 0.4196078, 1, 1,
0.2595294, 1.061024, 0.5756964, 0, 0.4117647, 1, 1,
0.2596256, 0.3119853, -0.1784086, 0, 0.4078431, 1, 1,
0.2617112, 1.108713, 0.3922722, 0, 0.4, 1, 1,
0.268387, 0.6335111, 1.931551, 0, 0.3921569, 1, 1,
0.2685145, 0.3424872, 2.501785, 0, 0.3882353, 1, 1,
0.268894, 1.56978, 0.1151087, 0, 0.3803922, 1, 1,
0.2697758, 1.366293, 1.453519, 0, 0.3764706, 1, 1,
0.2700826, -0.08341356, 1.200502, 0, 0.3686275, 1, 1,
0.2723178, -2.136364, 3.036005, 0, 0.3647059, 1, 1,
0.2728718, -1.077327, 3.667096, 0, 0.3568628, 1, 1,
0.2752404, 1.018675, -1.71432, 0, 0.3529412, 1, 1,
0.2793786, -0.6791957, 3.241781, 0, 0.345098, 1, 1,
0.282598, -0.186813, 1.755288, 0, 0.3411765, 1, 1,
0.2865672, 1.410531, 0.2656547, 0, 0.3333333, 1, 1,
0.2867884, 0.1877906, 1.621159, 0, 0.3294118, 1, 1,
0.287944, 0.6313212, 0.08814917, 0, 0.3215686, 1, 1,
0.2964454, 0.02435439, 0.7693411, 0, 0.3176471, 1, 1,
0.2967044, 0.7233728, -0.7510895, 0, 0.3098039, 1, 1,
0.2985478, 0.02814335, 1.144183, 0, 0.3058824, 1, 1,
0.3014585, 0.7448698, -0.5889122, 0, 0.2980392, 1, 1,
0.3072897, -0.4101295, 0.9814488, 0, 0.2901961, 1, 1,
0.314266, -1.283055, 2.22143, 0, 0.2862745, 1, 1,
0.3184254, -0.8503696, 3.907938, 0, 0.2784314, 1, 1,
0.3189667, 0.02808425, 0.8248022, 0, 0.2745098, 1, 1,
0.3250442, 0.120912, 1.918277, 0, 0.2666667, 1, 1,
0.3271279, -3.432003, 3.060557, 0, 0.2627451, 1, 1,
0.3275873, -1.596538, 2.224146, 0, 0.254902, 1, 1,
0.3311727, 0.4533046, 1.64119, 0, 0.2509804, 1, 1,
0.3357216, -1.66733, 2.883956, 0, 0.2431373, 1, 1,
0.336472, 1.660354, 1.061737, 0, 0.2392157, 1, 1,
0.3396041, -0.5803506, 2.89432, 0, 0.2313726, 1, 1,
0.3411138, -0.4051241, 1.504077, 0, 0.227451, 1, 1,
0.3431817, 1.018214, -0.5846547, 0, 0.2196078, 1, 1,
0.3504559, -0.8024003, 4.347932, 0, 0.2156863, 1, 1,
0.3529971, 0.05153004, 0.4416039, 0, 0.2078431, 1, 1,
0.3558323, 0.8377456, -0.9024994, 0, 0.2039216, 1, 1,
0.3584948, 0.9435995, -0.5562622, 0, 0.1960784, 1, 1,
0.3587398, -0.5520992, 2.348936, 0, 0.1882353, 1, 1,
0.3587931, 0.3855763, 0.9926469, 0, 0.1843137, 1, 1,
0.3594026, 0.2810893, 1.21617, 0, 0.1764706, 1, 1,
0.3630009, -0.4390168, 4.124702, 0, 0.172549, 1, 1,
0.3639793, 1.394428, 0.06360046, 0, 0.1647059, 1, 1,
0.3686092, 0.7120929, 0.8050237, 0, 0.1607843, 1, 1,
0.3689933, 0.0146384, 1.57898, 0, 0.1529412, 1, 1,
0.3732869, -0.9196029, 3.714614, 0, 0.1490196, 1, 1,
0.3753659, 0.9993718, 0.7159914, 0, 0.1411765, 1, 1,
0.3755786, -0.7496195, 1.912268, 0, 0.1372549, 1, 1,
0.3814476, 1.679549, -1.307704, 0, 0.1294118, 1, 1,
0.383812, 0.2154375, 0.4552409, 0, 0.1254902, 1, 1,
0.3916359, -2.393792, 3.992501, 0, 0.1176471, 1, 1,
0.3917812, -0.5770155, 3.633565, 0, 0.1137255, 1, 1,
0.39371, -0.314605, 2.358865, 0, 0.1058824, 1, 1,
0.3971302, -0.6279768, 3.335647, 0, 0.09803922, 1, 1,
0.3977882, 1.056309, -0.4680732, 0, 0.09411765, 1, 1,
0.402768, -0.8671435, 3.010532, 0, 0.08627451, 1, 1,
0.4074857, -0.7000988, 3.000647, 0, 0.08235294, 1, 1,
0.4078656, -0.2525739, 3.639579, 0, 0.07450981, 1, 1,
0.4092757, -0.168147, 2.56249, 0, 0.07058824, 1, 1,
0.4124213, 0.4838748, 1.726699, 0, 0.0627451, 1, 1,
0.4142214, -1.097176, 3.37141, 0, 0.05882353, 1, 1,
0.4156104, 1.76053, 0.7312385, 0, 0.05098039, 1, 1,
0.417471, 0.8745806, 0.09344713, 0, 0.04705882, 1, 1,
0.4182584, -0.2868904, 1.292542, 0, 0.03921569, 1, 1,
0.418265, 0.119953, 2.395034, 0, 0.03529412, 1, 1,
0.4194783, -0.5683689, 2.666121, 0, 0.02745098, 1, 1,
0.4216836, 0.5933536, 0.9762354, 0, 0.02352941, 1, 1,
0.4237888, 0.1896334, 1.291362, 0, 0.01568628, 1, 1,
0.4325137, 0.7706426, -0.1664627, 0, 0.01176471, 1, 1,
0.433702, -1.973544, 2.969254, 0, 0.003921569, 1, 1,
0.4367962, -2.018401, 3.717868, 0.003921569, 0, 1, 1,
0.4467328, 1.567028, 1.300725, 0.007843138, 0, 1, 1,
0.4474727, -1.435094, 2.663929, 0.01568628, 0, 1, 1,
0.4495588, -0.6288593, 2.77085, 0.01960784, 0, 1, 1,
0.4581082, -0.7438416, 1.447398, 0.02745098, 0, 1, 1,
0.4597953, -2.327214, 3.689729, 0.03137255, 0, 1, 1,
0.4626304, 2.036526, 1.864278, 0.03921569, 0, 1, 1,
0.462681, -0.9760583, 1.944856, 0.04313726, 0, 1, 1,
0.4650718, 1.103474, 1.187743, 0.05098039, 0, 1, 1,
0.4665874, -0.4096583, 3.615149, 0.05490196, 0, 1, 1,
0.4684934, 0.8227867, 1.246813, 0.0627451, 0, 1, 1,
0.4719711, 1.033526, -0.5716587, 0.06666667, 0, 1, 1,
0.4725263, -0.01706162, 1.332486, 0.07450981, 0, 1, 1,
0.4734952, 0.5600548, 1.594345, 0.07843138, 0, 1, 1,
0.4791594, -0.961729, 3.606203, 0.08627451, 0, 1, 1,
0.4841882, -1.492982, 2.931848, 0.09019608, 0, 1, 1,
0.4869007, 0.5317665, 1.024975, 0.09803922, 0, 1, 1,
0.488822, -2.291804, 4.034657, 0.1058824, 0, 1, 1,
0.4892782, -0.6044255, 2.350722, 0.1098039, 0, 1, 1,
0.4934652, 0.1341994, 0.562602, 0.1176471, 0, 1, 1,
0.4945235, -0.8589459, 3.957266, 0.1215686, 0, 1, 1,
0.4976435, 2.079728, 0.7803867, 0.1294118, 0, 1, 1,
0.4984187, 0.9322448, 1.600314, 0.1333333, 0, 1, 1,
0.501032, 0.1016877, -0.5873957, 0.1411765, 0, 1, 1,
0.5030146, 1.680058, 0.6306841, 0.145098, 0, 1, 1,
0.5074514, -0.1376893, 3.102389, 0.1529412, 0, 1, 1,
0.5100449, -0.6645938, 1.861388, 0.1568628, 0, 1, 1,
0.5115553, -0.4703465, 2.558069, 0.1647059, 0, 1, 1,
0.5142936, -0.6735486, 3.155514, 0.1686275, 0, 1, 1,
0.5149577, -0.8180052, 2.81535, 0.1764706, 0, 1, 1,
0.515071, -0.3465849, 1.806906, 0.1803922, 0, 1, 1,
0.5156704, 0.7565927, 1.492959, 0.1882353, 0, 1, 1,
0.5182869, -1.786602, 1.92306, 0.1921569, 0, 1, 1,
0.5202026, 1.475267, 0.7587476, 0.2, 0, 1, 1,
0.5307328, -0.8061194, 2.238284, 0.2078431, 0, 1, 1,
0.5360338, 0.7180358, 1.484422, 0.2117647, 0, 1, 1,
0.5377542, 0.6172647, 3.751229, 0.2196078, 0, 1, 1,
0.538314, -0.6589839, 3.163388, 0.2235294, 0, 1, 1,
0.5386551, 2.130052, -1.063724, 0.2313726, 0, 1, 1,
0.5400971, -1.630134, 3.47509, 0.2352941, 0, 1, 1,
0.5417566, -1.102313, 3.916826, 0.2431373, 0, 1, 1,
0.5432805, 0.24637, 2.959737, 0.2470588, 0, 1, 1,
0.543565, 0.3122799, 0.7519632, 0.254902, 0, 1, 1,
0.5443614, 0.4729622, 0.9908405, 0.2588235, 0, 1, 1,
0.5466366, 1.43308, -0.9714055, 0.2666667, 0, 1, 1,
0.5500365, -1.12733, 1.847047, 0.2705882, 0, 1, 1,
0.5542998, 0.7951275, 0.5368723, 0.2784314, 0, 1, 1,
0.5548291, 0.1588335, 0.486951, 0.282353, 0, 1, 1,
0.5558476, -1.11212, 1.742417, 0.2901961, 0, 1, 1,
0.56068, 1.062171, 0.2636445, 0.2941177, 0, 1, 1,
0.5675986, 0.9136792, 1.788855, 0.3019608, 0, 1, 1,
0.5700865, -1.720197, 2.760688, 0.3098039, 0, 1, 1,
0.5715429, 0.1392001, 2.741247, 0.3137255, 0, 1, 1,
0.5717339, 1.583032, 0.6352283, 0.3215686, 0, 1, 1,
0.5732309, -1.117372, 2.329016, 0.3254902, 0, 1, 1,
0.5786118, -0.3564256, 2.553388, 0.3333333, 0, 1, 1,
0.5873504, 1.581557, -0.3018339, 0.3372549, 0, 1, 1,
0.5925979, 0.1910115, 1.14975, 0.345098, 0, 1, 1,
0.5928579, -0.7514948, 1.334151, 0.3490196, 0, 1, 1,
0.59333, 0.7910483, 0.6966318, 0.3568628, 0, 1, 1,
0.5937694, 1.836543, -0.07517228, 0.3607843, 0, 1, 1,
0.5984113, -0.7225676, 2.597086, 0.3686275, 0, 1, 1,
0.6019251, -0.07032867, 1.609975, 0.372549, 0, 1, 1,
0.6061484, -0.2656464, 0.4157081, 0.3803922, 0, 1, 1,
0.6101621, 0.3696962, 0.3906701, 0.3843137, 0, 1, 1,
0.6136599, -1.395563, 2.923115, 0.3921569, 0, 1, 1,
0.6204468, 1.033161, 0.2937125, 0.3960784, 0, 1, 1,
0.6232648, 2.164839, 0.8511397, 0.4039216, 0, 1, 1,
0.6339396, 0.6187815, 0.2909341, 0.4117647, 0, 1, 1,
0.6347089, -0.9495519, 3.632587, 0.4156863, 0, 1, 1,
0.6355975, -2.432344, 2.78779, 0.4235294, 0, 1, 1,
0.6401475, -0.1794994, 2.658623, 0.427451, 0, 1, 1,
0.6416976, -0.5589204, 4.374848, 0.4352941, 0, 1, 1,
0.642574, 0.7071389, 0.582915, 0.4392157, 0, 1, 1,
0.6444933, -1.933667, 2.763957, 0.4470588, 0, 1, 1,
0.6461713, -1.44155, 2.837312, 0.4509804, 0, 1, 1,
0.6496797, 1.064011, 0.2400631, 0.4588235, 0, 1, 1,
0.6562042, 0.9910644, 1.89045, 0.4627451, 0, 1, 1,
0.6570774, -0.2657531, 2.37569, 0.4705882, 0, 1, 1,
0.6663265, 0.1931132, 2.053936, 0.4745098, 0, 1, 1,
0.6680609, 0.06102329, 1.120034, 0.4823529, 0, 1, 1,
0.669544, 0.04962479, 1.582196, 0.4862745, 0, 1, 1,
0.6734622, -0.7389373, 0.406708, 0.4941176, 0, 1, 1,
0.6737065, 1.500994, 0.74554, 0.5019608, 0, 1, 1,
0.6756515, -0.1705392, 0.805795, 0.5058824, 0, 1, 1,
0.6771512, 0.100975, 1.617897, 0.5137255, 0, 1, 1,
0.6779217, 0.5329617, 0.8057392, 0.5176471, 0, 1, 1,
0.6819006, 0.7388311, 0.8901764, 0.5254902, 0, 1, 1,
0.6840911, 0.003208652, 1.062708, 0.5294118, 0, 1, 1,
0.6841739, -0.4273496, 1.866007, 0.5372549, 0, 1, 1,
0.6865675, -0.9907244, 2.291021, 0.5411765, 0, 1, 1,
0.6887707, 0.8594885, 1.394353, 0.5490196, 0, 1, 1,
0.6888932, 0.5918359, 0.2545599, 0.5529412, 0, 1, 1,
0.6962482, -0.01098698, 1.735752, 0.5607843, 0, 1, 1,
0.6963204, 0.01426387, 1.40403, 0.5647059, 0, 1, 1,
0.6969025, -0.3801939, 4.202831, 0.572549, 0, 1, 1,
0.6973676, 0.8490653, 1.034759, 0.5764706, 0, 1, 1,
0.6975346, 0.1912706, 1.359618, 0.5843138, 0, 1, 1,
0.7075963, 0.6845577, 0.1538347, 0.5882353, 0, 1, 1,
0.7157836, 0.217773, -0.2127381, 0.5960785, 0, 1, 1,
0.7175012, -0.05780134, 0.2837975, 0.6039216, 0, 1, 1,
0.7188216, -0.8409424, 2.55409, 0.6078432, 0, 1, 1,
0.7198835, 0.07964659, 0.2256882, 0.6156863, 0, 1, 1,
0.7250152, -0.3843847, 2.437364, 0.6196079, 0, 1, 1,
0.7258115, -0.1163611, 2.114105, 0.627451, 0, 1, 1,
0.7275359, 1.398534, 0.1286634, 0.6313726, 0, 1, 1,
0.7290988, -0.01657735, 0.6162111, 0.6392157, 0, 1, 1,
0.7330148, -1.019671, 2.092107, 0.6431373, 0, 1, 1,
0.7368875, 0.08346548, 1.074481, 0.6509804, 0, 1, 1,
0.7524812, -0.6599581, 2.899627, 0.654902, 0, 1, 1,
0.7597613, -1.945184, 3.984449, 0.6627451, 0, 1, 1,
0.7639771, 0.9756709, 0.3437549, 0.6666667, 0, 1, 1,
0.7663127, -1.992749, 1.485776, 0.6745098, 0, 1, 1,
0.7666547, 0.5823465, 1.106058, 0.6784314, 0, 1, 1,
0.7686276, -0.6517156, 2.839033, 0.6862745, 0, 1, 1,
0.769522, -2.493125, 2.431205, 0.6901961, 0, 1, 1,
0.7837572, -0.1989338, 0.9577916, 0.6980392, 0, 1, 1,
0.7850517, -0.4589632, 2.727346, 0.7058824, 0, 1, 1,
0.792193, -1.135098, 1.991842, 0.7098039, 0, 1, 1,
0.7974391, -1.861597, 2.565215, 0.7176471, 0, 1, 1,
0.8020883, 1.453627, 0.4435863, 0.7215686, 0, 1, 1,
0.8047502, 2.137238, 1.149798, 0.7294118, 0, 1, 1,
0.8062497, 0.3475167, 1.56487, 0.7333333, 0, 1, 1,
0.8077095, -0.09242645, 0.5449055, 0.7411765, 0, 1, 1,
0.8185037, 1.143049, 1.350032, 0.7450981, 0, 1, 1,
0.8253126, -0.04507132, 2.477417, 0.7529412, 0, 1, 1,
0.8273668, 2.008987, -0.0394903, 0.7568628, 0, 1, 1,
0.8289126, -0.7263463, 3.488161, 0.7647059, 0, 1, 1,
0.8423659, 1.171178, 1.172588, 0.7686275, 0, 1, 1,
0.8455715, 0.7973654, 0.5402877, 0.7764706, 0, 1, 1,
0.8465132, -0.3925997, 1.630328, 0.7803922, 0, 1, 1,
0.8524697, -2.447662, 2.637837, 0.7882353, 0, 1, 1,
0.8605763, 0.1128339, 2.822805, 0.7921569, 0, 1, 1,
0.8656737, -0.4030228, 1.842513, 0.8, 0, 1, 1,
0.868694, 0.3338228, 1.112213, 0.8078431, 0, 1, 1,
0.8709192, 2.532856, 2.269555, 0.8117647, 0, 1, 1,
0.8749367, 0.8486952, 2.086509, 0.8196079, 0, 1, 1,
0.8749566, -0.006863425, 3.059433, 0.8235294, 0, 1, 1,
0.8758467, 1.183519, 0.1644842, 0.8313726, 0, 1, 1,
0.8761737, 0.400983, 1.999997, 0.8352941, 0, 1, 1,
0.8800858, 0.4062141, 0.6199015, 0.8431373, 0, 1, 1,
0.8807136, 0.4171123, 1.856653, 0.8470588, 0, 1, 1,
0.8878602, 0.1376002, 1.471665, 0.854902, 0, 1, 1,
0.8881698, 1.171173, 0.2469414, 0.8588235, 0, 1, 1,
0.8884267, -0.9658197, 1.492071, 0.8666667, 0, 1, 1,
0.8886087, 0.1453274, 2.302447, 0.8705882, 0, 1, 1,
0.891086, 0.1232623, 1.545816, 0.8784314, 0, 1, 1,
0.8989097, -2.36123, 2.305955, 0.8823529, 0, 1, 1,
0.9005085, -0.9419921, 1.750367, 0.8901961, 0, 1, 1,
0.9023052, -0.368692, 1.266348, 0.8941177, 0, 1, 1,
0.902792, 2.379656, -1.264052, 0.9019608, 0, 1, 1,
0.9039962, 0.1219816, 2.420373, 0.9098039, 0, 1, 1,
0.9061483, 0.5083231, 0.8360189, 0.9137255, 0, 1, 1,
0.9079341, 0.8619816, 0.2388245, 0.9215686, 0, 1, 1,
0.9110665, 2.133791, 1.052139, 0.9254902, 0, 1, 1,
0.913558, -0.3574771, -0.6117121, 0.9333333, 0, 1, 1,
0.9301114, 1.081173, 2.532317, 0.9372549, 0, 1, 1,
0.9325705, -1.22772, 2.51006, 0.945098, 0, 1, 1,
0.935567, 0.03649119, 2.278298, 0.9490196, 0, 1, 1,
0.942776, -0.0226394, -0.0465744, 0.9568627, 0, 1, 1,
0.9442837, 1.263806, 1.737114, 0.9607843, 0, 1, 1,
0.9611223, 1.286107, 1.155079, 0.9686275, 0, 1, 1,
0.9631442, 0.141511, 1.376938, 0.972549, 0, 1, 1,
0.9689443, 1.379834, -0.9051302, 0.9803922, 0, 1, 1,
0.9710942, 1.526863, -0.4273133, 0.9843137, 0, 1, 1,
0.9713123, 0.5877318, 2.306897, 0.9921569, 0, 1, 1,
0.9715152, 0.7250822, 1.653878, 0.9960784, 0, 1, 1,
0.9733841, -1.045049, 2.301654, 1, 0, 0.9960784, 1,
0.9745244, 0.04023056, 2.7007, 1, 0, 0.9882353, 1,
0.9763898, 0.6509534, 0.7076396, 1, 0, 0.9843137, 1,
0.9809416, 0.07973577, 1.737187, 1, 0, 0.9764706, 1,
0.982663, 1.348445, 0.8897622, 1, 0, 0.972549, 1,
0.9832166, 1.27113, 0.609547, 1, 0, 0.9647059, 1,
0.9879394, 0.6507467, 0.6226084, 1, 0, 0.9607843, 1,
0.9965129, 1.133592, 0.5538271, 1, 0, 0.9529412, 1,
0.9977091, 1.31756, 0.9026579, 1, 0, 0.9490196, 1,
1.003582, 0.04409354, 0.09238983, 1, 0, 0.9411765, 1,
1.005411, 0.09616742, 2.320482, 1, 0, 0.9372549, 1,
1.006616, -1.066696, 2.534729, 1, 0, 0.9294118, 1,
1.007768, -0.1470305, 1.33851, 1, 0, 0.9254902, 1,
1.008015, 0.4820175, -0.5835375, 1, 0, 0.9176471, 1,
1.013969, -0.6512516, 1.374267, 1, 0, 0.9137255, 1,
1.014642, 1.572502, 0.5206602, 1, 0, 0.9058824, 1,
1.015434, 0.8958315, 0.7748886, 1, 0, 0.9019608, 1,
1.015473, -1.330307, 2.630996, 1, 0, 0.8941177, 1,
1.017857, -0.1210645, 1.48398, 1, 0, 0.8862745, 1,
1.026121, -0.1368909, 1.546095, 1, 0, 0.8823529, 1,
1.029865, -1.559597, 3.443201, 1, 0, 0.8745098, 1,
1.034557, 1.088432, 1.755834, 1, 0, 0.8705882, 1,
1.035493, 1.317548, 2.368315, 1, 0, 0.8627451, 1,
1.036092, 0.1383859, 0.2148112, 1, 0, 0.8588235, 1,
1.038263, -0.3893102, 2.458614, 1, 0, 0.8509804, 1,
1.039075, -1.445401, 1.702325, 1, 0, 0.8470588, 1,
1.039818, 0.7870454, -0.08740029, 1, 0, 0.8392157, 1,
1.04238, 0.8470078, 0.5564363, 1, 0, 0.8352941, 1,
1.043363, -1.2745, 1.953377, 1, 0, 0.827451, 1,
1.046182, -0.8956698, 1.323889, 1, 0, 0.8235294, 1,
1.054619, 0.07694928, 1.396563, 1, 0, 0.8156863, 1,
1.055072, 0.6795575, -0.2738228, 1, 0, 0.8117647, 1,
1.059489, 0.3226975, 2.516503, 1, 0, 0.8039216, 1,
1.059635, 1.178524, 0.9457017, 1, 0, 0.7960784, 1,
1.061429, 0.2947497, -0.4957231, 1, 0, 0.7921569, 1,
1.062294, 0.2553375, 0.8694877, 1, 0, 0.7843137, 1,
1.062416, 0.4475946, 2.599113, 1, 0, 0.7803922, 1,
1.064996, -1.156008, 2.78252, 1, 0, 0.772549, 1,
1.065712, 0.882544, 1.053183, 1, 0, 0.7686275, 1,
1.084595, 1.077294, 0.8340335, 1, 0, 0.7607843, 1,
1.087074, -0.7325178, 2.238813, 1, 0, 0.7568628, 1,
1.089175, -0.3835591, 2.096286, 1, 0, 0.7490196, 1,
1.098068, -0.08805806, 1.787162, 1, 0, 0.7450981, 1,
1.102046, 0.7554741, 0.5987957, 1, 0, 0.7372549, 1,
1.105124, 1.365132, 0.2931842, 1, 0, 0.7333333, 1,
1.106515, -0.1424767, -0.108588, 1, 0, 0.7254902, 1,
1.108874, 1.034759, -0.3749998, 1, 0, 0.7215686, 1,
1.112009, 1.091056, -2.104792, 1, 0, 0.7137255, 1,
1.134785, -1.110203, 2.748177, 1, 0, 0.7098039, 1,
1.135733, -0.2251583, 2.356546, 1, 0, 0.7019608, 1,
1.145918, -0.3474789, 1.50588, 1, 0, 0.6941177, 1,
1.153597, 2.509417, 0.3659015, 1, 0, 0.6901961, 1,
1.166445, 0.888392, 0.2659998, 1, 0, 0.682353, 1,
1.171273, -1.01841, 4.248807, 1, 0, 0.6784314, 1,
1.183949, 0.1810057, 1.445143, 1, 0, 0.6705883, 1,
1.185375, -2.116341, 2.080691, 1, 0, 0.6666667, 1,
1.199888, -1.152491, 1.568016, 1, 0, 0.6588235, 1,
1.206165, 0.7847373, -0.09637453, 1, 0, 0.654902, 1,
1.207994, -0.5019572, 1.676434, 1, 0, 0.6470588, 1,
1.216901, 0.8148922, 3.600179, 1, 0, 0.6431373, 1,
1.225807, -0.897124, 0.7561372, 1, 0, 0.6352941, 1,
1.233329, -0.1308034, 1.646876, 1, 0, 0.6313726, 1,
1.237093, 0.2897718, 2.116325, 1, 0, 0.6235294, 1,
1.247284, 1.223885, 2.062923, 1, 0, 0.6196079, 1,
1.250944, 0.07382604, 2.351305, 1, 0, 0.6117647, 1,
1.252733, 0.8279967, 1.646326, 1, 0, 0.6078432, 1,
1.269897, -0.3919196, 1.598302, 1, 0, 0.6, 1,
1.273499, 1.000258, 0.5579185, 1, 0, 0.5921569, 1,
1.275248, 0.7821169, 0.6619821, 1, 0, 0.5882353, 1,
1.283107, -0.3571145, 3.155087, 1, 0, 0.5803922, 1,
1.28585, -0.5775065, 1.453295, 1, 0, 0.5764706, 1,
1.290734, -0.7739046, 2.033588, 1, 0, 0.5686275, 1,
1.306361, 1.423268, 0.1189372, 1, 0, 0.5647059, 1,
1.307388, -0.6500999, 2.352006, 1, 0, 0.5568628, 1,
1.308312, 0.4124881, 0.9856463, 1, 0, 0.5529412, 1,
1.310723, -1.11061, 3.482692, 1, 0, 0.5450981, 1,
1.317077, -0.5210317, 3.401371, 1, 0, 0.5411765, 1,
1.318496, -0.1518165, 2.411823, 1, 0, 0.5333334, 1,
1.322856, -0.5559407, 1.008093, 1, 0, 0.5294118, 1,
1.333338, 0.8721231, 1.95917, 1, 0, 0.5215687, 1,
1.335305, 0.06090499, 2.135761, 1, 0, 0.5176471, 1,
1.336997, -1.137624, 3.22749, 1, 0, 0.509804, 1,
1.338132, -3.349433, 2.693704, 1, 0, 0.5058824, 1,
1.340951, -0.9468656, 3.326867, 1, 0, 0.4980392, 1,
1.345528, -0.3527431, 3.132489, 1, 0, 0.4901961, 1,
1.349639, 0.5995057, 0.6338992, 1, 0, 0.4862745, 1,
1.357294, -0.1569256, 2.064885, 1, 0, 0.4784314, 1,
1.377833, 1.137392, 0.3965313, 1, 0, 0.4745098, 1,
1.38166, -2.001972, 3.437914, 1, 0, 0.4666667, 1,
1.38342, -0.4325923, 1.353438, 1, 0, 0.4627451, 1,
1.38372, 0.1185269, 1.663025, 1, 0, 0.454902, 1,
1.394133, 1.202974, 1.17915, 1, 0, 0.4509804, 1,
1.395597, -0.5143769, 0.7521453, 1, 0, 0.4431373, 1,
1.413888, 0.5862308, -0.2770523, 1, 0, 0.4392157, 1,
1.419163, 0.9155301, 0.0429147, 1, 0, 0.4313726, 1,
1.421871, -0.007352849, 0.9350313, 1, 0, 0.427451, 1,
1.435312, 1.329965, 0.2914472, 1, 0, 0.4196078, 1,
1.442942, -0.2444796, 2.034163, 1, 0, 0.4156863, 1,
1.458992, 1.052558, -0.5871316, 1, 0, 0.4078431, 1,
1.459024, -0.462739, -0.02469741, 1, 0, 0.4039216, 1,
1.461515, -1.285738, 2.620519, 1, 0, 0.3960784, 1,
1.461752, 0.03688565, -0.3537461, 1, 0, 0.3882353, 1,
1.466054, -1.00043, 1.140868, 1, 0, 0.3843137, 1,
1.478973, -0.2124371, 2.053843, 1, 0, 0.3764706, 1,
1.48745, 1.299321, 0.9870489, 1, 0, 0.372549, 1,
1.491332, -0.3950239, 1.180405, 1, 0, 0.3647059, 1,
1.529517, -1.527298, 3.024678, 1, 0, 0.3607843, 1,
1.5348, -0.2200458, 1.896835, 1, 0, 0.3529412, 1,
1.542, 2.580619, 1.741404, 1, 0, 0.3490196, 1,
1.547607, -0.7015574, 2.828062, 1, 0, 0.3411765, 1,
1.553836, 1.110952, 1.854711, 1, 0, 0.3372549, 1,
1.557143, 0.3827438, 2.142981, 1, 0, 0.3294118, 1,
1.560724, 0.06307074, 4.086626, 1, 0, 0.3254902, 1,
1.586984, -0.001958445, 0.2275528, 1, 0, 0.3176471, 1,
1.593766, 0.07094213, 0.9451644, 1, 0, 0.3137255, 1,
1.596696, 0.3900478, 1.016356, 1, 0, 0.3058824, 1,
1.613956, 0.1760247, 1.464367, 1, 0, 0.2980392, 1,
1.620782, -0.1774798, 1.825616, 1, 0, 0.2941177, 1,
1.644621, 0.1480922, 0.8979749, 1, 0, 0.2862745, 1,
1.654486, -1.712696, 2.413312, 1, 0, 0.282353, 1,
1.656718, 0.2253811, -0.02144693, 1, 0, 0.2745098, 1,
1.659069, 0.007156065, 1.633269, 1, 0, 0.2705882, 1,
1.661013, 1.276966, -0.4480937, 1, 0, 0.2627451, 1,
1.662875, -0.4263451, 3.782781, 1, 0, 0.2588235, 1,
1.695025, 0.3914938, 2.843042, 1, 0, 0.2509804, 1,
1.696203, -0.5083175, 2.497993, 1, 0, 0.2470588, 1,
1.712589, -0.4196229, 0.07061731, 1, 0, 0.2392157, 1,
1.716332, -0.198494, 0.5277941, 1, 0, 0.2352941, 1,
1.718228, -1.219858, 2.971049, 1, 0, 0.227451, 1,
1.734678, -0.4259695, 2.786851, 1, 0, 0.2235294, 1,
1.740696, 0.1197072, 0.2016099, 1, 0, 0.2156863, 1,
1.774462, 1.581236, 1.524413, 1, 0, 0.2117647, 1,
1.777803, -0.6471932, 2.253821, 1, 0, 0.2039216, 1,
1.779892, -0.8872317, 1.233279, 1, 0, 0.1960784, 1,
1.862284, -1.402552, 2.623974, 1, 0, 0.1921569, 1,
1.867591, -1.097858, 0.5649502, 1, 0, 0.1843137, 1,
1.900064, 0.5080951, 0.6571158, 1, 0, 0.1803922, 1,
1.907376, -0.9214476, 1.497527, 1, 0, 0.172549, 1,
1.909968, -0.4862409, 1.70938, 1, 0, 0.1686275, 1,
1.918478, 0.9037159, 1.853011, 1, 0, 0.1607843, 1,
1.935623, -0.5386843, 0.6882645, 1, 0, 0.1568628, 1,
1.99416, 0.5608512, 0.9756857, 1, 0, 0.1490196, 1,
2.007091, 0.6100935, 2.413888, 1, 0, 0.145098, 1,
2.035135, 1.646875, 0.2257293, 1, 0, 0.1372549, 1,
2.064963, 2.266872, -0.6685252, 1, 0, 0.1333333, 1,
2.100086, -0.7230801, 3.944598, 1, 0, 0.1254902, 1,
2.10912, 0.6873729, 1.924297, 1, 0, 0.1215686, 1,
2.121731, -1.181441, 2.873752, 1, 0, 0.1137255, 1,
2.172054, -0.8410282, 3.10211, 1, 0, 0.1098039, 1,
2.199178, -1.776988, 1.120615, 1, 0, 0.1019608, 1,
2.260172, 0.7554464, -0.9616076, 1, 0, 0.09411765, 1,
2.264328, 1.447479, 2.986877, 1, 0, 0.09019608, 1,
2.281564, -0.06478944, 1.693913, 1, 0, 0.08235294, 1,
2.301172, -0.6868404, 2.489609, 1, 0, 0.07843138, 1,
2.310538, -0.9919981, 1.904772, 1, 0, 0.07058824, 1,
2.321603, 0.1591467, 0.6575217, 1, 0, 0.06666667, 1,
2.325754, 0.6081574, 1.088984, 1, 0, 0.05882353, 1,
2.40006, 0.8115245, -0.02089347, 1, 0, 0.05490196, 1,
2.402723, -0.05814929, -0.3994295, 1, 0, 0.04705882, 1,
2.436917, 0.3108087, 2.607947, 1, 0, 0.04313726, 1,
2.464236, -0.3785665, 1.864768, 1, 0, 0.03529412, 1,
2.506874, -0.4389849, 2.305532, 1, 0, 0.03137255, 1,
2.559653, 0.2452304, 3.405697, 1, 0, 0.02352941, 1,
2.580585, 1.722418, 0.0806471, 1, 0, 0.01960784, 1,
3.249589, -0.4715938, 2.812901, 1, 0, 0.01176471, 1,
3.410047, 0.2051946, 0.70156, 1, 0, 0.007843138, 1
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
0.1529649, -4.495713, -7.636722, 0, -0.5, 0.5, 0.5,
0.1529649, -4.495713, -7.636722, 1, -0.5, 0.5, 0.5,
0.1529649, -4.495713, -7.636722, 1, 1.5, 0.5, 0.5,
0.1529649, -4.495713, -7.636722, 0, 1.5, 0.5, 0.5
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
-4.208268, -0.2942141, -7.636722, 0, -0.5, 0.5, 0.5,
-4.208268, -0.2942141, -7.636722, 1, -0.5, 0.5, 0.5,
-4.208268, -0.2942141, -7.636722, 1, 1.5, 0.5, 0.5,
-4.208268, -0.2942141, -7.636722, 0, 1.5, 0.5, 0.5
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
-4.208268, -4.495713, -0.04365277, 0, -0.5, 0.5, 0.5,
-4.208268, -4.495713, -0.04365277, 1, -0.5, 0.5, 0.5,
-4.208268, -4.495713, -0.04365277, 1, 1.5, 0.5, 0.5,
-4.208268, -4.495713, -0.04365277, 0, 1.5, 0.5, 0.5
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
-3, -3.526137, -5.884475,
3, -3.526137, -5.884475,
-3, -3.526137, -5.884475,
-3, -3.687733, -6.176516,
-2, -3.526137, -5.884475,
-2, -3.687733, -6.176516,
-1, -3.526137, -5.884475,
-1, -3.687733, -6.176516,
0, -3.526137, -5.884475,
0, -3.687733, -6.176516,
1, -3.526137, -5.884475,
1, -3.687733, -6.176516,
2, -3.526137, -5.884475,
2, -3.687733, -6.176516,
3, -3.526137, -5.884475,
3, -3.687733, -6.176516
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
-3, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
-3, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
-3, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
-3, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5,
-2, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
-2, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
-2, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
-2, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5,
-1, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
-1, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
-1, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
-1, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5,
0, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
0, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
0, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
0, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5,
1, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
1, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
1, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
1, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5,
2, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
2, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
2, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
2, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5,
3, -4.010925, -6.760599, 0, -0.5, 0.5, 0.5,
3, -4.010925, -6.760599, 1, -0.5, 0.5, 0.5,
3, -4.010925, -6.760599, 1, 1.5, 0.5, 0.5,
3, -4.010925, -6.760599, 0, 1.5, 0.5, 0.5
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
-3.20183, -3, -5.884475,
-3.20183, 2, -5.884475,
-3.20183, -3, -5.884475,
-3.36957, -3, -6.176516,
-3.20183, -2, -5.884475,
-3.36957, -2, -6.176516,
-3.20183, -1, -5.884475,
-3.36957, -1, -6.176516,
-3.20183, 0, -5.884475,
-3.36957, 0, -6.176516,
-3.20183, 1, -5.884475,
-3.36957, 1, -6.176516,
-3.20183, 2, -5.884475,
-3.36957, 2, -6.176516
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
-3.705049, -3, -6.760599, 0, -0.5, 0.5, 0.5,
-3.705049, -3, -6.760599, 1, -0.5, 0.5, 0.5,
-3.705049, -3, -6.760599, 1, 1.5, 0.5, 0.5,
-3.705049, -3, -6.760599, 0, 1.5, 0.5, 0.5,
-3.705049, -2, -6.760599, 0, -0.5, 0.5, 0.5,
-3.705049, -2, -6.760599, 1, -0.5, 0.5, 0.5,
-3.705049, -2, -6.760599, 1, 1.5, 0.5, 0.5,
-3.705049, -2, -6.760599, 0, 1.5, 0.5, 0.5,
-3.705049, -1, -6.760599, 0, -0.5, 0.5, 0.5,
-3.705049, -1, -6.760599, 1, -0.5, 0.5, 0.5,
-3.705049, -1, -6.760599, 1, 1.5, 0.5, 0.5,
-3.705049, -1, -6.760599, 0, 1.5, 0.5, 0.5,
-3.705049, 0, -6.760599, 0, -0.5, 0.5, 0.5,
-3.705049, 0, -6.760599, 1, -0.5, 0.5, 0.5,
-3.705049, 0, -6.760599, 1, 1.5, 0.5, 0.5,
-3.705049, 0, -6.760599, 0, 1.5, 0.5, 0.5,
-3.705049, 1, -6.760599, 0, -0.5, 0.5, 0.5,
-3.705049, 1, -6.760599, 1, -0.5, 0.5, 0.5,
-3.705049, 1, -6.760599, 1, 1.5, 0.5, 0.5,
-3.705049, 1, -6.760599, 0, 1.5, 0.5, 0.5,
-3.705049, 2, -6.760599, 0, -0.5, 0.5, 0.5,
-3.705049, 2, -6.760599, 1, -0.5, 0.5, 0.5,
-3.705049, 2, -6.760599, 1, 1.5, 0.5, 0.5,
-3.705049, 2, -6.760599, 0, 1.5, 0.5, 0.5
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
-3.20183, -3.526137, -4,
-3.20183, -3.526137, 4,
-3.20183, -3.526137, -4,
-3.36957, -3.687733, -4,
-3.20183, -3.526137, -2,
-3.36957, -3.687733, -2,
-3.20183, -3.526137, 0,
-3.36957, -3.687733, 0,
-3.20183, -3.526137, 2,
-3.36957, -3.687733, 2,
-3.20183, -3.526137, 4,
-3.36957, -3.687733, 4
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
-3.705049, -4.010925, -4, 0, -0.5, 0.5, 0.5,
-3.705049, -4.010925, -4, 1, -0.5, 0.5, 0.5,
-3.705049, -4.010925, -4, 1, 1.5, 0.5, 0.5,
-3.705049, -4.010925, -4, 0, 1.5, 0.5, 0.5,
-3.705049, -4.010925, -2, 0, -0.5, 0.5, 0.5,
-3.705049, -4.010925, -2, 1, -0.5, 0.5, 0.5,
-3.705049, -4.010925, -2, 1, 1.5, 0.5, 0.5,
-3.705049, -4.010925, -2, 0, 1.5, 0.5, 0.5,
-3.705049, -4.010925, 0, 0, -0.5, 0.5, 0.5,
-3.705049, -4.010925, 0, 1, -0.5, 0.5, 0.5,
-3.705049, -4.010925, 0, 1, 1.5, 0.5, 0.5,
-3.705049, -4.010925, 0, 0, 1.5, 0.5, 0.5,
-3.705049, -4.010925, 2, 0, -0.5, 0.5, 0.5,
-3.705049, -4.010925, 2, 1, -0.5, 0.5, 0.5,
-3.705049, -4.010925, 2, 1, 1.5, 0.5, 0.5,
-3.705049, -4.010925, 2, 0, 1.5, 0.5, 0.5,
-3.705049, -4.010925, 4, 0, -0.5, 0.5, 0.5,
-3.705049, -4.010925, 4, 1, -0.5, 0.5, 0.5,
-3.705049, -4.010925, 4, 1, 1.5, 0.5, 0.5,
-3.705049, -4.010925, 4, 0, 1.5, 0.5, 0.5
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
-3.20183, -3.526137, -5.884475,
-3.20183, 2.937708, -5.884475,
-3.20183, -3.526137, 5.79717,
-3.20183, 2.937708, 5.79717,
-3.20183, -3.526137, -5.884475,
-3.20183, -3.526137, 5.79717,
-3.20183, 2.937708, -5.884475,
-3.20183, 2.937708, 5.79717,
-3.20183, -3.526137, -5.884475,
3.50776, -3.526137, -5.884475,
-3.20183, -3.526137, 5.79717,
3.50776, -3.526137, 5.79717,
-3.20183, 2.937708, -5.884475,
3.50776, 2.937708, -5.884475,
-3.20183, 2.937708, 5.79717,
3.50776, 2.937708, 5.79717,
3.50776, -3.526137, -5.884475,
3.50776, 2.937708, -5.884475,
3.50776, -3.526137, 5.79717,
3.50776, 2.937708, 5.79717,
3.50776, -3.526137, -5.884475,
3.50776, -3.526137, 5.79717,
3.50776, 2.937708, -5.884475,
3.50776, 2.937708, 5.79717
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
var radius = 7.97869;
var distance = 35.4981;
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
mvMatrix.translate( -0.1529649, 0.2942141, 0.04365277 );
mvMatrix.scale( 1.285729, 1.334611, 0.7384847 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.4981);
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
bifenazate<-read.table("bifenazate.xyz")
```

```
## Error in read.table("bifenazate.xyz"): no lines available in input
```

```r
x<-bifenazate$V2
```

```
## Error in eval(expr, envir, enclos): object 'bifenazate' not found
```

```r
y<-bifenazate$V3
```

```
## Error in eval(expr, envir, enclos): object 'bifenazate' not found
```

```r
z<-bifenazate$V4
```

```
## Error in eval(expr, envir, enclos): object 'bifenazate' not found
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
-3.104117, 0.2407434, -1.409842, 0, 0, 1, 1, 1,
-2.769374, -0.8476924, -1.730221, 1, 0, 0, 1, 1,
-2.73446, -0.9771001, -1.495228, 1, 0, 0, 1, 1,
-2.733423, 0.1734215, -2.245206, 1, 0, 0, 1, 1,
-2.52295, -0.1724051, -0.04181699, 1, 0, 0, 1, 1,
-2.446268, 0.01351321, -1.95004, 1, 0, 0, 1, 1,
-2.419703, 0.231237, -0.1926848, 0, 0, 0, 1, 1,
-2.413043, 1.419272, -1.301682, 0, 0, 0, 1, 1,
-2.407074, 0.4794317, -0.3593119, 0, 0, 0, 1, 1,
-2.40701, 0.7335262, -1.030787, 0, 0, 0, 1, 1,
-2.401946, -0.2858833, -1.366944, 0, 0, 0, 1, 1,
-2.304432, 1.655858, -1.091394, 0, 0, 0, 1, 1,
-2.282212, -0.8091401, -0.5411061, 0, 0, 0, 1, 1,
-2.267805, -0.835961, -2.327911, 1, 1, 1, 1, 1,
-2.201415, -0.1707216, -1.547111, 1, 1, 1, 1, 1,
-2.196702, -0.5014869, -1.196698, 1, 1, 1, 1, 1,
-2.164381, 0.8992803, -1.883559, 1, 1, 1, 1, 1,
-2.108124, -0.6619161, -5.714354, 1, 1, 1, 1, 1,
-2.098513, -1.049777, -0.3372576, 1, 1, 1, 1, 1,
-2.084559, -1.423639, -3.783801, 1, 1, 1, 1, 1,
-2.065969, -0.1098525, -2.229302, 1, 1, 1, 1, 1,
-2.007233, -1.083709, -2.1258, 1, 1, 1, 1, 1,
-1.991831, -0.4034718, -3.337044, 1, 1, 1, 1, 1,
-1.978408, 0.3848667, -2.345935, 1, 1, 1, 1, 1,
-1.97005, -0.3015749, -1.255969, 1, 1, 1, 1, 1,
-1.965946, 0.1447095, -1.501496, 1, 1, 1, 1, 1,
-1.946844, 0.5347543, -2.342317, 1, 1, 1, 1, 1,
-1.895305, 1.432622, 0.1759602, 1, 1, 1, 1, 1,
-1.847858, 1.394609, -0.8442891, 0, 0, 1, 1, 1,
-1.817229, 0.4742374, -1.646485, 1, 0, 0, 1, 1,
-1.804818, -0.9281909, -2.934762, 1, 0, 0, 1, 1,
-1.803969, 1.704079, -0.1183975, 1, 0, 0, 1, 1,
-1.799993, 0.7667159, -0.9542812, 1, 0, 0, 1, 1,
-1.786346, -1.53735, -0.6271557, 1, 0, 0, 1, 1,
-1.76638, -0.1333641, -1.846403, 0, 0, 0, 1, 1,
-1.749942, 0.3412128, -1.592491, 0, 0, 0, 1, 1,
-1.732229, -0.9203185, -1.413323, 0, 0, 0, 1, 1,
-1.731139, -2.301156, -1.373817, 0, 0, 0, 1, 1,
-1.730144, 0.518885, -1.004893, 0, 0, 0, 1, 1,
-1.710466, -0.9180094, -2.869377, 0, 0, 0, 1, 1,
-1.693706, 0.1699608, -1.742972, 0, 0, 0, 1, 1,
-1.693414, 0.1333447, -1.501232, 1, 1, 1, 1, 1,
-1.692882, 1.468704, -1.411226, 1, 1, 1, 1, 1,
-1.687157, 1.064629, 1.257202, 1, 1, 1, 1, 1,
-1.684288, -0.4574697, -2.126599, 1, 1, 1, 1, 1,
-1.682562, -1.104489, 0.427017, 1, 1, 1, 1, 1,
-1.671702, -0.1272303, -0.8159966, 1, 1, 1, 1, 1,
-1.67046, 1.804676, -3.249515, 1, 1, 1, 1, 1,
-1.661281, 1.174194, -0.4268352, 1, 1, 1, 1, 1,
-1.660275, -1.879617, -1.09712, 1, 1, 1, 1, 1,
-1.65005, 0.6738421, -0.4292201, 1, 1, 1, 1, 1,
-1.630576, 0.1966631, -1.063486, 1, 1, 1, 1, 1,
-1.630533, 0.1587504, -2.202334, 1, 1, 1, 1, 1,
-1.628153, -0.1630769, -2.314407, 1, 1, 1, 1, 1,
-1.614881, 1.031743, -1.281955, 1, 1, 1, 1, 1,
-1.606962, 0.9720945, -0.4143671, 1, 1, 1, 1, 1,
-1.592641, -0.9156641, -1.700683, 0, 0, 1, 1, 1,
-1.547751, -0.3738038, -1.874355, 1, 0, 0, 1, 1,
-1.538224, 1.009043, -0.4668258, 1, 0, 0, 1, 1,
-1.526458, -1.355886, -2.599596, 1, 0, 0, 1, 1,
-1.520921, 0.03861737, -1.79548, 1, 0, 0, 1, 1,
-1.520784, 0.6706345, -0.9424689, 1, 0, 0, 1, 1,
-1.509467, -0.05583728, -2.049914, 0, 0, 0, 1, 1,
-1.495523, -0.7306798, -0.00208829, 0, 0, 0, 1, 1,
-1.481569, 0.0742426, -0.6684838, 0, 0, 0, 1, 1,
-1.478104, 1.386455, -0.6968535, 0, 0, 0, 1, 1,
-1.467831, -1.010918, -3.137126, 0, 0, 0, 1, 1,
-1.462571, -1.150198, -4.114351, 0, 0, 0, 1, 1,
-1.449553, 2.08462, 0.6481382, 0, 0, 0, 1, 1,
-1.4453, -2.022941, -4.619147, 1, 1, 1, 1, 1,
-1.441324, -0.8784649, -1.511545, 1, 1, 1, 1, 1,
-1.433424, 0.4451459, -1.599993, 1, 1, 1, 1, 1,
-1.431678, -1.397016, -2.00583, 1, 1, 1, 1, 1,
-1.426775, 0.5187663, 1.081517, 1, 1, 1, 1, 1,
-1.425217, 0.6950923, -1.768122, 1, 1, 1, 1, 1,
-1.42286, 0.04688885, -0.6470785, 1, 1, 1, 1, 1,
-1.421835, -0.5486971, -1.304041, 1, 1, 1, 1, 1,
-1.417574, -0.156588, -0.5305222, 1, 1, 1, 1, 1,
-1.411944, 2.839234, -0.7727892, 1, 1, 1, 1, 1,
-1.411416, 0.2029751, -0.344732, 1, 1, 1, 1, 1,
-1.404187, 0.7164894, -1.530124, 1, 1, 1, 1, 1,
-1.39635, -0.5503617, -1.38026, 1, 1, 1, 1, 1,
-1.391741, 2.478651, -1.52689, 1, 1, 1, 1, 1,
-1.385859, 0.4931368, -1.880827, 1, 1, 1, 1, 1,
-1.382164, -0.7679246, -2.520514, 0, 0, 1, 1, 1,
-1.374995, -1.300973, -2.031848, 1, 0, 0, 1, 1,
-1.353807, 2.334255, 0.1610971, 1, 0, 0, 1, 1,
-1.318262, -1.424577, -1.275124, 1, 0, 0, 1, 1,
-1.312759, 1.035615, -2.075418, 1, 0, 0, 1, 1,
-1.306241, -1.547289, -0.6247981, 1, 0, 0, 1, 1,
-1.304068, -0.3474701, -2.756722, 0, 0, 0, 1, 1,
-1.294506, 0.3694885, -0.1983474, 0, 0, 0, 1, 1,
-1.291285, -0.5188944, -3.073411, 0, 0, 0, 1, 1,
-1.288802, -1.079319, -2.91643, 0, 0, 0, 1, 1,
-1.285723, -0.505101, -1.778589, 0, 0, 0, 1, 1,
-1.284856, 2.553233, -1.771267, 0, 0, 0, 1, 1,
-1.282538, 0.7138326, -3.229283, 0, 0, 0, 1, 1,
-1.277022, 0.1754988, -2.568263, 1, 1, 1, 1, 1,
-1.272348, -0.08255372, 0.4092579, 1, 1, 1, 1, 1,
-1.267321, 0.5895124, -0.06425425, 1, 1, 1, 1, 1,
-1.253954, -1.272739, -2.182904, 1, 1, 1, 1, 1,
-1.253016, -1.300545, -4.287374, 1, 1, 1, 1, 1,
-1.249501, -1.280032, -2.297399, 1, 1, 1, 1, 1,
-1.240515, -0.5427917, -1.915363, 1, 1, 1, 1, 1,
-1.234379, -1.046704, -1.814321, 1, 1, 1, 1, 1,
-1.22688, -1.130663, -2.193902, 1, 1, 1, 1, 1,
-1.226817, -0.7466692, -2.572914, 1, 1, 1, 1, 1,
-1.226729, 0.972743, -0.08003531, 1, 1, 1, 1, 1,
-1.226371, -0.3466721, -1.157819, 1, 1, 1, 1, 1,
-1.225311, 0.9973017, -1.292997, 1, 1, 1, 1, 1,
-1.220209, 0.2366129, -1.489354, 1, 1, 1, 1, 1,
-1.2126, 0.9332787, -1.670385, 1, 1, 1, 1, 1,
-1.21018, -0.1856948, -0.3614267, 0, 0, 1, 1, 1,
-1.207215, 1.119603, -0.2762738, 1, 0, 0, 1, 1,
-1.206446, 0.5527502, -0.6566204, 1, 0, 0, 1, 1,
-1.203684, -1.128697, -1.453861, 1, 0, 0, 1, 1,
-1.197678, 0.3434321, -0.5079273, 1, 0, 0, 1, 1,
-1.188971, 0.6859484, -0.1804128, 1, 0, 0, 1, 1,
-1.185318, 1.18014, -0.710894, 0, 0, 0, 1, 1,
-1.183938, 0.3408936, -1.916781, 0, 0, 0, 1, 1,
-1.160249, -0.8821092, -1.379183, 0, 0, 0, 1, 1,
-1.15935, 0.4968559, -0.3919073, 0, 0, 0, 1, 1,
-1.153264, 2.543271, -1.209651, 0, 0, 0, 1, 1,
-1.15166, 2.155211, -1.30263, 0, 0, 0, 1, 1,
-1.147344, -1.113232, -3.251071, 0, 0, 0, 1, 1,
-1.142378, -0.9396347, -2.107376, 1, 1, 1, 1, 1,
-1.141149, 0.5182614, -1.893777, 1, 1, 1, 1, 1,
-1.138734, 1.086382, -0.3536899, 1, 1, 1, 1, 1,
-1.138502, 0.8252249, -0.8262427, 1, 1, 1, 1, 1,
-1.126638, 1.131702, -1.945645, 1, 1, 1, 1, 1,
-1.118524, 0.2696111, -0.4262297, 1, 1, 1, 1, 1,
-1.106369, -0.4678743, -2.978524, 1, 1, 1, 1, 1,
-1.105681, 0.1035343, -3.276731, 1, 1, 1, 1, 1,
-1.09332, -0.3076957, -1.388328, 1, 1, 1, 1, 1,
-1.090509, -0.2998967, -1.96794, 1, 1, 1, 1, 1,
-1.077617, 1.206907, -1.103249, 1, 1, 1, 1, 1,
-1.076952, -0.4899927, -1.874023, 1, 1, 1, 1, 1,
-1.073766, 0.9876248, -0.5327806, 1, 1, 1, 1, 1,
-1.047233, 0.1609074, -0.7139899, 1, 1, 1, 1, 1,
-1.046981, -0.707534, -1.476594, 1, 1, 1, 1, 1,
-1.039473, -0.7005785, -4.7757, 0, 0, 1, 1, 1,
-1.038881, -0.896084, -2.634211, 1, 0, 0, 1, 1,
-1.030468, 1.742135, 2.366775, 1, 0, 0, 1, 1,
-1.023047, 0.07992261, -1.760973, 1, 0, 0, 1, 1,
-1.020624, 0.5535408, 0.2346435, 1, 0, 0, 1, 1,
-1.020506, 0.5399561, 0.09275484, 1, 0, 0, 1, 1,
-1.018991, 1.173873, -1.002979, 0, 0, 0, 1, 1,
-1.015902, 0.8773178, -1.385998, 0, 0, 0, 1, 1,
-1.009628, -0.663573, -2.451812, 0, 0, 0, 1, 1,
-1.009309, 1.367468, -0.5219708, 0, 0, 0, 1, 1,
-1.009275, -1.10404, -1.801319, 0, 0, 0, 1, 1,
-1.008721, -0.7859022, -1.365176, 0, 0, 0, 1, 1,
-0.993059, 1.71175, -0.5009593, 0, 0, 0, 1, 1,
-0.9873183, -1.834586, -1.867386, 1, 1, 1, 1, 1,
-0.9770855, -0.7123556, -2.124869, 1, 1, 1, 1, 1,
-0.9709033, 0.9031243, -1.288071, 1, 1, 1, 1, 1,
-0.9651862, 0.7684401, -1.994834, 1, 1, 1, 1, 1,
-0.9594618, -0.3315684, -2.602789, 1, 1, 1, 1, 1,
-0.9556837, -1.618736, -1.790649, 1, 1, 1, 1, 1,
-0.9510996, 0.4066047, -2.218884, 1, 1, 1, 1, 1,
-0.9429533, 0.931671, 0.6573681, 1, 1, 1, 1, 1,
-0.9417145, 0.4944803, -0.4248517, 1, 1, 1, 1, 1,
-0.9390802, 0.8917933, -0.3302417, 1, 1, 1, 1, 1,
-0.9380338, 1.430417, -1.344431, 1, 1, 1, 1, 1,
-0.9357991, -0.6624228, -1.809658, 1, 1, 1, 1, 1,
-0.9353091, 0.8995205, 0.7954255, 1, 1, 1, 1, 1,
-0.9201283, -0.8728747, -2.623318, 1, 1, 1, 1, 1,
-0.9192797, 0.0178251, -1.118768, 1, 1, 1, 1, 1,
-0.9172946, 1.053439, -1.185946, 0, 0, 1, 1, 1,
-0.9163719, 0.3312406, 0.2992114, 1, 0, 0, 1, 1,
-0.9084104, 0.1434555, -1.521144, 1, 0, 0, 1, 1,
-0.9052823, -2.257304, -1.758082, 1, 0, 0, 1, 1,
-0.8994888, 0.6984944, 0.8218983, 1, 0, 0, 1, 1,
-0.89495, -0.553508, -0.4847763, 1, 0, 0, 1, 1,
-0.890891, -0.8088511, -1.69561, 0, 0, 0, 1, 1,
-0.8877358, -0.508761, -2.131577, 0, 0, 0, 1, 1,
-0.8840672, -0.4407945, -2.777641, 0, 0, 0, 1, 1,
-0.8840457, -0.5691684, -1.852111, 0, 0, 0, 1, 1,
-0.8833258, 0.82506, -0.08155143, 0, 0, 0, 1, 1,
-0.8757414, 0.3216198, -0.8701066, 0, 0, 0, 1, 1,
-0.8756245, -1.704629, -2.775207, 0, 0, 0, 1, 1,
-0.8731689, 1.914136, 0.02769743, 1, 1, 1, 1, 1,
-0.8576716, 0.5382399, -0.3167113, 1, 1, 1, 1, 1,
-0.8454518, 1.72772, 0.2657595, 1, 1, 1, 1, 1,
-0.8453619, -0.7958573, -1.758663, 1, 1, 1, 1, 1,
-0.8402021, 0.9422346, -1.789391, 1, 1, 1, 1, 1,
-0.8353598, 0.730139, -1.057261, 1, 1, 1, 1, 1,
-0.8307606, 0.8868937, -0.9979412, 1, 1, 1, 1, 1,
-0.8273239, 0.1432426, -1.976448, 1, 1, 1, 1, 1,
-0.8227288, -0.8218986, -1.934296, 1, 1, 1, 1, 1,
-0.8177562, -0.6961914, -1.607608, 1, 1, 1, 1, 1,
-0.8118552, -0.2221484, -0.8351705, 1, 1, 1, 1, 1,
-0.8070212, 0.006675903, -2.106201, 1, 1, 1, 1, 1,
-0.801823, 0.5481859, 0.0001512204, 1, 1, 1, 1, 1,
-0.7959611, -1.075729, -1.623968, 1, 1, 1, 1, 1,
-0.7959402, 0.1297766, -1.305634, 1, 1, 1, 1, 1,
-0.7922335, 0.08490704, -1.124023, 0, 0, 1, 1, 1,
-0.7908602, -0.3941904, 0.386085, 1, 0, 0, 1, 1,
-0.7820758, -1.426529, -2.992675, 1, 0, 0, 1, 1,
-0.7788672, -0.1872248, -1.192987, 1, 0, 0, 1, 1,
-0.7785036, -2.380593, -4.09193, 1, 0, 0, 1, 1,
-0.7780631, -2.996375, -1.828847, 1, 0, 0, 1, 1,
-0.7705609, 0.8130523, 0.5834584, 0, 0, 0, 1, 1,
-0.770545, -1.388545, -2.699327, 0, 0, 0, 1, 1,
-0.7664036, -0.4990384, -2.585428, 0, 0, 0, 1, 1,
-0.7637453, 1.298781, 0.21941, 0, 0, 0, 1, 1,
-0.7556061, -0.6857958, -3.880856, 0, 0, 0, 1, 1,
-0.7474875, 0.2544267, -0.7402828, 0, 0, 0, 1, 1,
-0.7469232, 0.9847224, -0.4035341, 0, 0, 0, 1, 1,
-0.7468511, 0.6429299, -1.550697, 1, 1, 1, 1, 1,
-0.7437139, -1.183421, -3.709605, 1, 1, 1, 1, 1,
-0.7381271, 0.3080112, -1.304577, 1, 1, 1, 1, 1,
-0.7380503, 1.060611, -1.410597, 1, 1, 1, 1, 1,
-0.729365, -0.3830175, -2.687643, 1, 1, 1, 1, 1,
-0.7247356, 0.1061909, -1.42552, 1, 1, 1, 1, 1,
-0.7220775, 1.346054, 1.382161, 1, 1, 1, 1, 1,
-0.7177687, -0.1878676, -0.06147543, 1, 1, 1, 1, 1,
-0.7163902, -1.116894, -1.639488, 1, 1, 1, 1, 1,
-0.7131704, -1.026774, -2.050557, 1, 1, 1, 1, 1,
-0.7111745, 0.332601, -0.957548, 1, 1, 1, 1, 1,
-0.7061015, 0.4484004, 0.1490598, 1, 1, 1, 1, 1,
-0.7043195, -0.4960807, -2.848969, 1, 1, 1, 1, 1,
-0.6994848, -0.972325, -1.729621, 1, 1, 1, 1, 1,
-0.6961427, 1.200767, 2.362166, 1, 1, 1, 1, 1,
-0.6957851, 0.7498266, -0.4695619, 0, 0, 1, 1, 1,
-0.6933038, 0.4101671, -1.470781, 1, 0, 0, 1, 1,
-0.69222, 0.1587999, -0.2038453, 1, 0, 0, 1, 1,
-0.6871787, 0.0249058, -0.2695693, 1, 0, 0, 1, 1,
-0.6857763, -0.6281547, -2.419892, 1, 0, 0, 1, 1,
-0.6839697, -0.1714826, -1.3966, 1, 0, 0, 1, 1,
-0.6831118, -0.9199568, -2.199127, 0, 0, 0, 1, 1,
-0.682356, 1.427233, -2.071035, 0, 0, 0, 1, 1,
-0.6760519, -1.35121, -2.337913, 0, 0, 0, 1, 1,
-0.6646549, -0.5951909, -2.660342, 0, 0, 0, 1, 1,
-0.6643378, 1.557654, -0.732694, 0, 0, 0, 1, 1,
-0.6621127, 0.2570275, -2.549043, 0, 0, 0, 1, 1,
-0.6611656, -1.088341, -3.048189, 0, 0, 0, 1, 1,
-0.6606609, -0.6142542, -3.031635, 1, 1, 1, 1, 1,
-0.6606061, -0.9757547, -3.137007, 1, 1, 1, 1, 1,
-0.6563417, 0.3930668, -2.172593, 1, 1, 1, 1, 1,
-0.6543199, -0.7880518, -2.867447, 1, 1, 1, 1, 1,
-0.6424925, 1.688352, -1.782708, 1, 1, 1, 1, 1,
-0.6397501, -0.2500458, -1.77022, 1, 1, 1, 1, 1,
-0.6375183, -0.4856446, -0.578085, 1, 1, 1, 1, 1,
-0.6361735, -0.1574848, -2.108939, 1, 1, 1, 1, 1,
-0.6315396, -0.492791, -2.550672, 1, 1, 1, 1, 1,
-0.6304247, -0.4770475, -1.922883, 1, 1, 1, 1, 1,
-0.6292874, -0.05691608, -2.334856, 1, 1, 1, 1, 1,
-0.6240262, 1.364544, 0.1656279, 1, 1, 1, 1, 1,
-0.6223952, 0.9591166, -0.2012501, 1, 1, 1, 1, 1,
-0.6223537, 1.40825, -0.3010762, 1, 1, 1, 1, 1,
-0.6214924, -0.3444754, -2.692391, 1, 1, 1, 1, 1,
-0.6202121, -1.5008, -1.457331, 0, 0, 1, 1, 1,
-0.6201, -1.467614, -2.243389, 1, 0, 0, 1, 1,
-0.6181849, 1.498774, -1.310956, 1, 0, 0, 1, 1,
-0.6181383, 1.163449, -0.05534058, 1, 0, 0, 1, 1,
-0.6159989, -0.08256084, -1.509922, 1, 0, 0, 1, 1,
-0.6152623, -0.8931642, -1.232791, 1, 0, 0, 1, 1,
-0.6141971, 0.08703623, -2.353245, 0, 0, 0, 1, 1,
-0.6141322, -0.2582898, -0.9278081, 0, 0, 0, 1, 1,
-0.6133097, -0.7217731, -3.392988, 0, 0, 0, 1, 1,
-0.6109504, 0.862809, 1.34771, 0, 0, 0, 1, 1,
-0.6105295, -0.1474736, -1.970411, 0, 0, 0, 1, 1,
-0.60691, -1.279635, -2.715848, 0, 0, 0, 1, 1,
-0.5999827, -0.4997713, -1.826542, 0, 0, 0, 1, 1,
-0.5933089, -1.43215, -3.912661, 1, 1, 1, 1, 1,
-0.5914763, 0.5894896, -0.2980967, 1, 1, 1, 1, 1,
-0.587215, 1.702913, 0.788099, 1, 1, 1, 1, 1,
-0.5824669, -0.1779971, -0.5186678, 1, 1, 1, 1, 1,
-0.5813364, 0.5872017, 0.3975493, 1, 1, 1, 1, 1,
-0.5787581, 2.322597, -0.3422508, 1, 1, 1, 1, 1,
-0.5749949, -0.07215814, -2.502555, 1, 1, 1, 1, 1,
-0.571786, 0.2545452, -2.127125, 1, 1, 1, 1, 1,
-0.5710722, 0.8681549, -1.150402, 1, 1, 1, 1, 1,
-0.5708688, -0.7215563, -2.104431, 1, 1, 1, 1, 1,
-0.5696469, -0.3595022, -1.705102, 1, 1, 1, 1, 1,
-0.5671397, 0.08552916, -1.394022, 1, 1, 1, 1, 1,
-0.5598766, -1.029775, -4.171605, 1, 1, 1, 1, 1,
-0.5584366, 0.695551, 0.6889837, 1, 1, 1, 1, 1,
-0.5513542, 0.5973224, -1.108592, 1, 1, 1, 1, 1,
-0.5503132, -0.1987961, -3.9959, 0, 0, 1, 1, 1,
-0.5501062, 1.198102, 0.1136516, 1, 0, 0, 1, 1,
-0.5484151, 1.384142, -1.73941, 1, 0, 0, 1, 1,
-0.5463954, 0.4768522, -1.316502, 1, 0, 0, 1, 1,
-0.5451815, -0.7656599, -3.100729, 1, 0, 0, 1, 1,
-0.5445951, 1.219431, -0.3801833, 1, 0, 0, 1, 1,
-0.5417056, 1.296832, -0.6463791, 0, 0, 0, 1, 1,
-0.5407605, -0.3118496, -2.577566, 0, 0, 0, 1, 1,
-0.5386762, 0.3147172, -0.8591912, 0, 0, 0, 1, 1,
-0.5385205, 0.09951083, -2.672364, 0, 0, 0, 1, 1,
-0.5322151, -0.2816221, -1.680312, 0, 0, 0, 1, 1,
-0.529628, -0.571242, -4.689042, 0, 0, 0, 1, 1,
-0.5281065, 0.2628309, -3.177431, 0, 0, 0, 1, 1,
-0.5222595, 1.254905, -0.07067302, 1, 1, 1, 1, 1,
-0.5208711, 1.064123, -1.20267, 1, 1, 1, 1, 1,
-0.5188035, 1.703903, -1.010062, 1, 1, 1, 1, 1,
-0.5171559, -1.120456, -3.348608, 1, 1, 1, 1, 1,
-0.5164076, 0.7068517, 0.2666032, 1, 1, 1, 1, 1,
-0.5105429, -1.089594, -0.2170578, 1, 1, 1, 1, 1,
-0.5068711, 1.622847, -0.4261562, 1, 1, 1, 1, 1,
-0.5057131, -1.620899, -4.234492, 1, 1, 1, 1, 1,
-0.5041384, -0.7829248, -3.592948, 1, 1, 1, 1, 1,
-0.493123, 1.149418, -0.3186902, 1, 1, 1, 1, 1,
-0.4891002, 0.3119578, -1.874517, 1, 1, 1, 1, 1,
-0.4858732, 2.44629, 1.182866, 1, 1, 1, 1, 1,
-0.4827645, 0.6827579, 1.399516, 1, 1, 1, 1, 1,
-0.4820921, 1.530417, 0.1280846, 1, 1, 1, 1, 1,
-0.4813021, -0.673129, -1.666359, 1, 1, 1, 1, 1,
-0.4809954, -1.220633, -3.686338, 0, 0, 1, 1, 1,
-0.4788023, 0.920488, -1.47774, 1, 0, 0, 1, 1,
-0.4777169, 0.504321, 1.356131, 1, 0, 0, 1, 1,
-0.4753363, 0.7339007, 0.6843311, 1, 0, 0, 1, 1,
-0.4743744, 0.4370369, 0.2576981, 1, 0, 0, 1, 1,
-0.4691232, -0.6768064, -3.998777, 1, 0, 0, 1, 1,
-0.4668741, -0.137883, -3.219358, 0, 0, 0, 1, 1,
-0.4657014, -0.215216, -2.646642, 0, 0, 0, 1, 1,
-0.4654982, -1.918382, -2.524287, 0, 0, 0, 1, 1,
-0.4654576, 0.02178322, -0.0750791, 0, 0, 0, 1, 1,
-0.4615191, 0.6820169, 0.9182997, 0, 0, 0, 1, 1,
-0.4605452, -1.162846, -4.44178, 0, 0, 0, 1, 1,
-0.4575096, -1.381374, -2.262547, 0, 0, 0, 1, 1,
-0.45554, -0.1741042, -2.158499, 1, 1, 1, 1, 1,
-0.4545047, 1.696671, -1.307993, 1, 1, 1, 1, 1,
-0.447921, 0.3785333, -1.515302, 1, 1, 1, 1, 1,
-0.4429953, -0.6251609, -2.412329, 1, 1, 1, 1, 1,
-0.4327511, 0.4631182, -0.3197416, 1, 1, 1, 1, 1,
-0.4294116, -0.05300665, -2.144884, 1, 1, 1, 1, 1,
-0.4201147, 0.4072845, -0.4697817, 1, 1, 1, 1, 1,
-0.4198114, 0.1053633, -2.246341, 1, 1, 1, 1, 1,
-0.4187593, 1.535336, -1.232311, 1, 1, 1, 1, 1,
-0.4180094, -0.3655562, -3.153701, 1, 1, 1, 1, 1,
-0.4139504, 0.5418334, -0.7225884, 1, 1, 1, 1, 1,
-0.4129416, 0.2144473, -1.790464, 1, 1, 1, 1, 1,
-0.4107554, 0.403286, -0.5713292, 1, 1, 1, 1, 1,
-0.4046209, -0.01978492, -2.290493, 1, 1, 1, 1, 1,
-0.4035312, -0.07817387, -1.95647, 1, 1, 1, 1, 1,
-0.40221, -0.1144973, -2.586332, 0, 0, 1, 1, 1,
-0.3990194, -0.5833658, -1.565264, 1, 0, 0, 1, 1,
-0.3931136, 0.05315603, -1.224323, 1, 0, 0, 1, 1,
-0.3921733, 0.4155014, 1.293262, 1, 0, 0, 1, 1,
-0.3909458, -0.6299087, -4.073394, 1, 0, 0, 1, 1,
-0.3887045, 0.07713053, -3.047962, 1, 0, 0, 1, 1,
-0.3863599, 1.644982, 2.103285, 0, 0, 0, 1, 1,
-0.3844543, -0.5580795, -1.696062, 0, 0, 0, 1, 1,
-0.382597, 0.02944325, -0.1120018, 0, 0, 0, 1, 1,
-0.3818684, 0.347894, -2.716389, 0, 0, 0, 1, 1,
-0.3817593, 0.5798751, -0.5500122, 0, 0, 0, 1, 1,
-0.3816618, -0.2217787, -1.160657, 0, 0, 0, 1, 1,
-0.3807792, -0.5935167, -4.459723, 0, 0, 0, 1, 1,
-0.3797752, 1.26896, -1.289542, 1, 1, 1, 1, 1,
-0.3793225, -0.02951217, -2.615531, 1, 1, 1, 1, 1,
-0.3789143, 0.9287376, -1.634477, 1, 1, 1, 1, 1,
-0.3781655, -0.130798, 0.9300409, 1, 1, 1, 1, 1,
-0.3755617, -0.7057341, -4.06126, 1, 1, 1, 1, 1,
-0.3635049, 1.632218, -0.4403675, 1, 1, 1, 1, 1,
-0.3579834, -0.4012555, -0.6771818, 1, 1, 1, 1, 1,
-0.3537299, -0.843172, -2.711231, 1, 1, 1, 1, 1,
-0.350238, 0.6439613, -1.438879, 1, 1, 1, 1, 1,
-0.3491755, -1.985687, -1.657023, 1, 1, 1, 1, 1,
-0.3422183, 0.9093628, -1.002583, 1, 1, 1, 1, 1,
-0.3420542, 1.421988, -0.348324, 1, 1, 1, 1, 1,
-0.3414362, 0.04319803, -1.061764, 1, 1, 1, 1, 1,
-0.3351698, -0.4660714, -4.040874, 1, 1, 1, 1, 1,
-0.329633, -1.038915, -3.814466, 1, 1, 1, 1, 1,
-0.3292578, -0.08737597, -2.092995, 0, 0, 1, 1, 1,
-0.3198344, -0.9114174, -0.8005504, 1, 0, 0, 1, 1,
-0.3190922, -1.34591, -2.172645, 1, 0, 0, 1, 1,
-0.3153076, 1.138709, 0.694442, 1, 0, 0, 1, 1,
-0.3086383, 0.9409539, 0.4092091, 1, 0, 0, 1, 1,
-0.3066041, -0.09764729, -3.106148, 1, 0, 0, 1, 1,
-0.3013178, 1.214267, 0.8281796, 0, 0, 0, 1, 1,
-0.2979404, 0.2278557, -0.705061, 0, 0, 0, 1, 1,
-0.2957364, -0.4499893, -2.031271, 0, 0, 0, 1, 1,
-0.2945419, -1.234974, -3.299674, 0, 0, 0, 1, 1,
-0.2931696, 0.4053733, 0.7639264, 0, 0, 0, 1, 1,
-0.2915971, -0.0913062, -2.972358, 0, 0, 0, 1, 1,
-0.2899187, 0.3663189, -2.484972, 0, 0, 0, 1, 1,
-0.2883434, -1.347264, -2.567083, 1, 1, 1, 1, 1,
-0.2880382, -0.8874717, -3.664087, 1, 1, 1, 1, 1,
-0.285585, -1.56795, -2.052203, 1, 1, 1, 1, 1,
-0.2822387, 0.6532639, -0.880821, 1, 1, 1, 1, 1,
-0.2819864, 0.5725635, -0.7497704, 1, 1, 1, 1, 1,
-0.2784474, 1.109498, -0.8800343, 1, 1, 1, 1, 1,
-0.2759109, -0.3058659, -2.004983, 1, 1, 1, 1, 1,
-0.2753158, 0.2980481, 0.5814532, 1, 1, 1, 1, 1,
-0.271218, 0.9784556, -1.454836, 1, 1, 1, 1, 1,
-0.2709735, 1.281011, -0.481189, 1, 1, 1, 1, 1,
-0.2688271, 1.255984, 0.7373368, 1, 1, 1, 1, 1,
-0.2683296, 2.829037, -0.725697, 1, 1, 1, 1, 1,
-0.2607429, -0.07059921, -2.685076, 1, 1, 1, 1, 1,
-0.2583334, -0.5252843, -2.473004, 1, 1, 1, 1, 1,
-0.2567074, 0.2311853, -1.294476, 1, 1, 1, 1, 1,
-0.2561853, -0.8523009, -0.7176431, 0, 0, 1, 1, 1,
-0.2556118, 1.305927, 0.06943981, 1, 0, 0, 1, 1,
-0.2537527, -0.2695565, -3.222164, 1, 0, 0, 1, 1,
-0.2535428, 1.11262, -0.9026977, 1, 0, 0, 1, 1,
-0.2469928, -0.4819948, -2.593154, 1, 0, 0, 1, 1,
-0.2390675, 1.764332, -1.035004, 1, 0, 0, 1, 1,
-0.2366836, -0.7220659, -2.999557, 0, 0, 0, 1, 1,
-0.234065, 0.2224462, -1.393336, 0, 0, 0, 1, 1,
-0.2282324, -1.070114, -3.534271, 0, 0, 0, 1, 1,
-0.2261836, -0.7262781, -3.977936, 0, 0, 0, 1, 1,
-0.2249568, 1.330097, -0.9983605, 0, 0, 0, 1, 1,
-0.2234151, -0.7136316, -0.952081, 0, 0, 0, 1, 1,
-0.2221865, -0.4376712, -1.770318, 0, 0, 0, 1, 1,
-0.2208961, 1.142822, -1.47283, 1, 1, 1, 1, 1,
-0.2204291, 0.9437681, 0.09302162, 1, 1, 1, 1, 1,
-0.214207, 0.9557382, 0.4255713, 1, 1, 1, 1, 1,
-0.213827, -0.4509098, -4.435237, 1, 1, 1, 1, 1,
-0.2134418, 0.5385003, 1.340519, 1, 1, 1, 1, 1,
-0.2127305, 1.948617, -0.2984408, 1, 1, 1, 1, 1,
-0.2125568, -0.7146204, -3.18972, 1, 1, 1, 1, 1,
-0.2093845, -0.6695461, -3.725706, 1, 1, 1, 1, 1,
-0.208964, 0.8063827, 0.2093719, 1, 1, 1, 1, 1,
-0.20029, -1.391295, -2.957003, 1, 1, 1, 1, 1,
-0.1995754, -0.7766994, -0.9312875, 1, 1, 1, 1, 1,
-0.193974, -0.1587764, -1.509089, 1, 1, 1, 1, 1,
-0.1938833, 1.942382, 0.4668112, 1, 1, 1, 1, 1,
-0.1936104, -0.1666387, -2.518474, 1, 1, 1, 1, 1,
-0.1931765, -0.5045274, 0.4475757, 1, 1, 1, 1, 1,
-0.1929992, -0.1869915, -2.677949, 0, 0, 1, 1, 1,
-0.192435, -0.4063175, -2.058169, 1, 0, 0, 1, 1,
-0.188322, 0.6460648, 2.385228, 1, 0, 0, 1, 1,
-0.1838223, 1.490384, 0.1951648, 1, 0, 0, 1, 1,
-0.1820917, -0.1926843, -3.381148, 1, 0, 0, 1, 1,
-0.1806083, -1.767035, -4.865869, 1, 0, 0, 1, 1,
-0.1801331, 0.1875006, 0.07532154, 0, 0, 0, 1, 1,
-0.1750194, 0.8612427, 0.4122136, 0, 0, 0, 1, 1,
-0.1749306, -0.02645857, -2.845465, 0, 0, 0, 1, 1,
-0.1736121, -1.853155, -3.575133, 0, 0, 0, 1, 1,
-0.1707041, -3.023474, -2.5696, 0, 0, 0, 1, 1,
-0.1698541, -0.1138172, -2.21036, 0, 0, 0, 1, 1,
-0.1692129, 1.42094, 1.122661, 0, 0, 0, 1, 1,
-0.1688095, 0.4237152, -0.5962553, 1, 1, 1, 1, 1,
-0.1685407, 1.827326, -0.2281081, 1, 1, 1, 1, 1,
-0.166435, 0.1946472, -1.597475, 1, 1, 1, 1, 1,
-0.1545739, -0.216305, -2.362343, 1, 1, 1, 1, 1,
-0.1531741, -0.0678442, -0.587535, 1, 1, 1, 1, 1,
-0.1422565, -1.139527, -2.760029, 1, 1, 1, 1, 1,
-0.1408907, 1.201305, 0.2815641, 1, 1, 1, 1, 1,
-0.1398791, -0.3221736, -3.0985, 1, 1, 1, 1, 1,
-0.1396964, 0.9199724, -0.8690402, 1, 1, 1, 1, 1,
-0.1394549, 0.153424, -0.7413437, 1, 1, 1, 1, 1,
-0.1394106, 0.4910868, -0.8705901, 1, 1, 1, 1, 1,
-0.1342689, -1.670188, -2.206227, 1, 1, 1, 1, 1,
-0.134126, 0.6392346, 0.7955481, 1, 1, 1, 1, 1,
-0.1338896, 0.7153258, -1.923297, 1, 1, 1, 1, 1,
-0.1316312, 0.1114204, -0.7652627, 1, 1, 1, 1, 1,
-0.1307315, -0.9039484, -1.477354, 0, 0, 1, 1, 1,
-0.1225547, -0.03503294, -1.688843, 1, 0, 0, 1, 1,
-0.1210974, -1.114658, -1.44826, 1, 0, 0, 1, 1,
-0.114926, 0.5022789, -1.23987, 1, 0, 0, 1, 1,
-0.1123693, -0.1263761, -2.033597, 1, 0, 0, 1, 1,
-0.1118775, -0.4022211, -2.991441, 1, 0, 0, 1, 1,
-0.1115989, -0.1158562, -1.05388, 0, 0, 0, 1, 1,
-0.1060592, -0.6583929, -1.408081, 0, 0, 0, 1, 1,
-0.1042897, -0.4317645, -2.502056, 0, 0, 0, 1, 1,
-0.1031113, 1.82096, 0.05234952, 0, 0, 0, 1, 1,
-0.09956535, 0.6067981, -1.563637, 0, 0, 0, 1, 1,
-0.09838254, 0.8872279, -1.074259, 0, 0, 0, 1, 1,
-0.09162448, 0.3149316, 0.9903942, 0, 0, 0, 1, 1,
-0.09108102, -0.8417178, -1.379384, 1, 1, 1, 1, 1,
-0.08582316, -1.722568, -2.750993, 1, 1, 1, 1, 1,
-0.08443506, -1.493118, -3.385455, 1, 1, 1, 1, 1,
-0.08170793, -0.8060957, -4.179518, 1, 1, 1, 1, 1,
-0.07897837, -0.8379155, -2.952817, 1, 1, 1, 1, 1,
-0.07714683, 0.2923224, -1.890207, 1, 1, 1, 1, 1,
-0.07307957, -0.3647961, -3.232199, 1, 1, 1, 1, 1,
-0.06584059, -0.2145361, -4.064445, 1, 1, 1, 1, 1,
-0.06258135, -0.09323557, -2.26567, 1, 1, 1, 1, 1,
-0.05989076, -0.517584, -4.496453, 1, 1, 1, 1, 1,
-0.0588741, -0.2523387, -2.334317, 1, 1, 1, 1, 1,
-0.05720859, 0.200187, -0.1946924, 1, 1, 1, 1, 1,
-0.05700444, -0.2572705, -2.473992, 1, 1, 1, 1, 1,
-0.05594213, 0.6117627, -0.2037446, 1, 1, 1, 1, 1,
-0.05333699, -0.233016, -2.121369, 1, 1, 1, 1, 1,
-0.04864401, -1.162142, -2.560342, 0, 0, 1, 1, 1,
-0.04723487, -0.8893842, -3.17034, 1, 0, 0, 1, 1,
-0.04604615, 0.79592, 0.7619207, 1, 0, 0, 1, 1,
-0.04374935, 0.2935889, -0.591841, 1, 0, 0, 1, 1,
-0.042842, -0.6345323, -3.108148, 1, 0, 0, 1, 1,
-0.03444533, 0.2450362, 0.8342472, 1, 0, 0, 1, 1,
-0.03288618, -0.8459377, -4.167878, 0, 0, 0, 1, 1,
-0.02992185, -0.05505404, -4.421848, 0, 0, 0, 1, 1,
-0.02768724, 1.75846, -1.155223, 0, 0, 0, 1, 1,
-0.02693736, 1.166256, -0.7349037, 0, 0, 0, 1, 1,
-0.02463506, 1.714644, 0.427507, 0, 0, 0, 1, 1,
-0.01947726, -0.3871674, -2.989135, 0, 0, 0, 1, 1,
-0.01832081, -0.5032093, -3.478132, 0, 0, 0, 1, 1,
-0.01355238, -0.6673168, -3.139546, 1, 1, 1, 1, 1,
-0.008573831, -0.1714996, -1.586058, 1, 1, 1, 1, 1,
-0.007901233, 2.645759, -1.455758, 1, 1, 1, 1, 1,
-0.007846381, 1.111077, -1.143324, 1, 1, 1, 1, 1,
-0.006063465, 0.648632, -0.6297621, 1, 1, 1, 1, 1,
-0.005602942, 1.191296, 2.330543, 1, 1, 1, 1, 1,
-0.0004190331, -0.4079103, -2.476328, 1, 1, 1, 1, 1,
0.002132296, -0.3378089, 2.799378, 1, 1, 1, 1, 1,
0.00217073, 2.058859, -0.2167494, 1, 1, 1, 1, 1,
0.007404285, -0.8539444, 2.672821, 1, 1, 1, 1, 1,
0.01147164, -1.516582, 2.733852, 1, 1, 1, 1, 1,
0.01151689, 0.8785282, -2.406396, 1, 1, 1, 1, 1,
0.0148283, -0.07003769, 2.250699, 1, 1, 1, 1, 1,
0.01688658, -1.309123, 4.45072, 1, 1, 1, 1, 1,
0.02846911, 0.8829603, -0.9036578, 1, 1, 1, 1, 1,
0.03209946, -0.806064, 3.33588, 0, 0, 1, 1, 1,
0.03926279, 0.2340633, 0.2623934, 1, 0, 0, 1, 1,
0.03987789, -0.2438755, 0.9816911, 1, 0, 0, 1, 1,
0.040326, 0.6713896, -1.946754, 1, 0, 0, 1, 1,
0.04120042, 0.1223355, -1.09578, 1, 0, 0, 1, 1,
0.04809095, 0.6951629, -0.1984302, 1, 0, 0, 1, 1,
0.05199599, 0.2053598, 0.403444, 0, 0, 0, 1, 1,
0.05238878, -0.530791, 5.627048, 0, 0, 0, 1, 1,
0.05269086, -0.8650918, 2.418322, 0, 0, 0, 1, 1,
0.05354975, -0.649436, 0.4919238, 0, 0, 0, 1, 1,
0.05646221, 0.4590196, 0.4497787, 0, 0, 0, 1, 1,
0.06389033, 0.9773624, 1.371364, 0, 0, 0, 1, 1,
0.064785, 1.206396, 0.7609266, 0, 0, 0, 1, 1,
0.06481506, -1.577063, 2.877548, 1, 1, 1, 1, 1,
0.06883053, -1.492529, 4.171392, 1, 1, 1, 1, 1,
0.07123405, -0.05646582, 2.538428, 1, 1, 1, 1, 1,
0.07192003, 0.1482232, 0.8725711, 1, 1, 1, 1, 1,
0.07309504, 0.624402, -0.7967108, 1, 1, 1, 1, 1,
0.075207, 0.1167787, -0.1326552, 1, 1, 1, 1, 1,
0.07690948, 0.5699351, 0.6662823, 1, 1, 1, 1, 1,
0.0783602, 2.843575, 1.673938, 1, 1, 1, 1, 1,
0.07842495, -2.206779, 1.42869, 1, 1, 1, 1, 1,
0.0791643, 0.3161135, 1.792544, 1, 1, 1, 1, 1,
0.07953809, 0.5146623, -0.48836, 1, 1, 1, 1, 1,
0.08015848, -0.8907362, 4.080538, 1, 1, 1, 1, 1,
0.08310132, 1.848885, -0.6589466, 1, 1, 1, 1, 1,
0.08340751, -0.8482614, 2.523405, 1, 1, 1, 1, 1,
0.08411095, 1.471119, 0.7661082, 1, 1, 1, 1, 1,
0.08903038, -1.225004, 3.113274, 0, 0, 1, 1, 1,
0.09349135, 0.2302878, 0.8539122, 1, 0, 0, 1, 1,
0.09461123, -1.185879, 2.026997, 1, 0, 0, 1, 1,
0.0999048, -2.358488, 4.73941, 1, 0, 0, 1, 1,
0.1026076, 1.023129, 0.2101406, 1, 0, 0, 1, 1,
0.1060022, 0.8886979, 0.3696983, 1, 0, 0, 1, 1,
0.1062553, -0.4167355, 3.327811, 0, 0, 0, 1, 1,
0.1146021, -0.2095872, 2.004971, 0, 0, 0, 1, 1,
0.1167392, -2.23714, 3.732997, 0, 0, 0, 1, 1,
0.1175138, -0.2109058, 3.575287, 0, 0, 0, 1, 1,
0.1202714, -2.071697, 4.676305, 0, 0, 0, 1, 1,
0.1226238, 0.9395183, 0.9443467, 0, 0, 0, 1, 1,
0.1287053, -0.7939592, 2.930703, 0, 0, 0, 1, 1,
0.1330915, -1.282303, 3.34885, 1, 1, 1, 1, 1,
0.136245, -0.2507826, 1.635048, 1, 1, 1, 1, 1,
0.1385888, 1.978862, -0.07362229, 1, 1, 1, 1, 1,
0.1394896, 1.227774, 1.277337, 1, 1, 1, 1, 1,
0.1421962, -0.727474, 2.017907, 1, 1, 1, 1, 1,
0.1426329, -0.02382203, 1.214856, 1, 1, 1, 1, 1,
0.1442298, 0.3467304, 0.5251555, 1, 1, 1, 1, 1,
0.146081, -1.414271, 3.218379, 1, 1, 1, 1, 1,
0.146254, 0.5177163, 0.585209, 1, 1, 1, 1, 1,
0.147406, -0.02932558, 1.501201, 1, 1, 1, 1, 1,
0.1480206, -0.3581161, 3.529435, 1, 1, 1, 1, 1,
0.1492497, -1.673412, 3.740384, 1, 1, 1, 1, 1,
0.1532187, 1.232885, 0.7772087, 1, 1, 1, 1, 1,
0.1546373, -0.1148658, 4.815078, 1, 1, 1, 1, 1,
0.1560607, -0.8492461, 3.066047, 1, 1, 1, 1, 1,
0.1622272, 0.9619021, 0.7796612, 0, 0, 1, 1, 1,
0.1642672, -0.474973, 2.013527, 1, 0, 0, 1, 1,
0.1666354, -0.5742058, 2.39875, 1, 0, 0, 1, 1,
0.1686238, 0.2158054, -0.2414895, 1, 0, 0, 1, 1,
0.1694576, 0.3157167, -1.015272, 1, 0, 0, 1, 1,
0.1711883, 0.3189323, 0.2126046, 1, 0, 0, 1, 1,
0.1713941, -0.1085206, 1.833234, 0, 0, 0, 1, 1,
0.1738284, 0.3949244, -0.02343888, 0, 0, 0, 1, 1,
0.1758947, 0.7356759, 0.7950954, 0, 0, 0, 1, 1,
0.1790881, 0.6963152, -0.08242053, 0, 0, 0, 1, 1,
0.1843431, -1.299184, 4.184062, 0, 0, 0, 1, 1,
0.1931381, 1.28314, -0.07481325, 0, 0, 0, 1, 1,
0.1936051, 0.1174492, -0.03895045, 0, 0, 0, 1, 1,
0.1971069, 0.04204152, -0.1226062, 1, 1, 1, 1, 1,
0.2023329, 0.3034093, 0.02295741, 1, 1, 1, 1, 1,
0.2036417, 1.192528, 1.254989, 1, 1, 1, 1, 1,
0.2039935, -0.08014704, 3.10377, 1, 1, 1, 1, 1,
0.2113083, -0.06146488, 1.19503, 1, 1, 1, 1, 1,
0.2168213, 0.873926, 0.3306769, 1, 1, 1, 1, 1,
0.2216764, -0.7481971, 3.685681, 1, 1, 1, 1, 1,
0.2239928, -2.663275, 2.781234, 1, 1, 1, 1, 1,
0.2285369, 1.294665, 1.538974, 1, 1, 1, 1, 1,
0.2297463, -0.7382376, 2.564862, 1, 1, 1, 1, 1,
0.2303349, -0.05703741, -0.601121, 1, 1, 1, 1, 1,
0.2304534, 0.4239561, 2.550771, 1, 1, 1, 1, 1,
0.2319854, 0.1063002, -0.006425591, 1, 1, 1, 1, 1,
0.2328921, 0.4558624, 1.1804, 1, 1, 1, 1, 1,
0.2331006, 1.157693, -0.5181722, 1, 1, 1, 1, 1,
0.2378792, 1.468663, 0.05080733, 0, 0, 1, 1, 1,
0.2385204, 0.0432386, -0.07870059, 1, 0, 0, 1, 1,
0.2441554, 0.4043755, 1.052715, 1, 0, 0, 1, 1,
0.2456102, 1.014262, 0.2937711, 1, 0, 0, 1, 1,
0.2467367, -0.4298653, 3.670931, 1, 0, 0, 1, 1,
0.2473649, 0.394549, 0.06602596, 1, 0, 0, 1, 1,
0.2475206, -0.6297576, 2.394313, 0, 0, 0, 1, 1,
0.247881, -0.3215367, 0.6909063, 0, 0, 0, 1, 1,
0.2535843, 0.6018144, 0.5805641, 0, 0, 0, 1, 1,
0.2579181, -0.9494199, 2.774521, 0, 0, 0, 1, 1,
0.2595294, 1.061024, 0.5756964, 0, 0, 0, 1, 1,
0.2596256, 0.3119853, -0.1784086, 0, 0, 0, 1, 1,
0.2617112, 1.108713, 0.3922722, 0, 0, 0, 1, 1,
0.268387, 0.6335111, 1.931551, 1, 1, 1, 1, 1,
0.2685145, 0.3424872, 2.501785, 1, 1, 1, 1, 1,
0.268894, 1.56978, 0.1151087, 1, 1, 1, 1, 1,
0.2697758, 1.366293, 1.453519, 1, 1, 1, 1, 1,
0.2700826, -0.08341356, 1.200502, 1, 1, 1, 1, 1,
0.2723178, -2.136364, 3.036005, 1, 1, 1, 1, 1,
0.2728718, -1.077327, 3.667096, 1, 1, 1, 1, 1,
0.2752404, 1.018675, -1.71432, 1, 1, 1, 1, 1,
0.2793786, -0.6791957, 3.241781, 1, 1, 1, 1, 1,
0.282598, -0.186813, 1.755288, 1, 1, 1, 1, 1,
0.2865672, 1.410531, 0.2656547, 1, 1, 1, 1, 1,
0.2867884, 0.1877906, 1.621159, 1, 1, 1, 1, 1,
0.287944, 0.6313212, 0.08814917, 1, 1, 1, 1, 1,
0.2964454, 0.02435439, 0.7693411, 1, 1, 1, 1, 1,
0.2967044, 0.7233728, -0.7510895, 1, 1, 1, 1, 1,
0.2985478, 0.02814335, 1.144183, 0, 0, 1, 1, 1,
0.3014585, 0.7448698, -0.5889122, 1, 0, 0, 1, 1,
0.3072897, -0.4101295, 0.9814488, 1, 0, 0, 1, 1,
0.314266, -1.283055, 2.22143, 1, 0, 0, 1, 1,
0.3184254, -0.8503696, 3.907938, 1, 0, 0, 1, 1,
0.3189667, 0.02808425, 0.8248022, 1, 0, 0, 1, 1,
0.3250442, 0.120912, 1.918277, 0, 0, 0, 1, 1,
0.3271279, -3.432003, 3.060557, 0, 0, 0, 1, 1,
0.3275873, -1.596538, 2.224146, 0, 0, 0, 1, 1,
0.3311727, 0.4533046, 1.64119, 0, 0, 0, 1, 1,
0.3357216, -1.66733, 2.883956, 0, 0, 0, 1, 1,
0.336472, 1.660354, 1.061737, 0, 0, 0, 1, 1,
0.3396041, -0.5803506, 2.89432, 0, 0, 0, 1, 1,
0.3411138, -0.4051241, 1.504077, 1, 1, 1, 1, 1,
0.3431817, 1.018214, -0.5846547, 1, 1, 1, 1, 1,
0.3504559, -0.8024003, 4.347932, 1, 1, 1, 1, 1,
0.3529971, 0.05153004, 0.4416039, 1, 1, 1, 1, 1,
0.3558323, 0.8377456, -0.9024994, 1, 1, 1, 1, 1,
0.3584948, 0.9435995, -0.5562622, 1, 1, 1, 1, 1,
0.3587398, -0.5520992, 2.348936, 1, 1, 1, 1, 1,
0.3587931, 0.3855763, 0.9926469, 1, 1, 1, 1, 1,
0.3594026, 0.2810893, 1.21617, 1, 1, 1, 1, 1,
0.3630009, -0.4390168, 4.124702, 1, 1, 1, 1, 1,
0.3639793, 1.394428, 0.06360046, 1, 1, 1, 1, 1,
0.3686092, 0.7120929, 0.8050237, 1, 1, 1, 1, 1,
0.3689933, 0.0146384, 1.57898, 1, 1, 1, 1, 1,
0.3732869, -0.9196029, 3.714614, 1, 1, 1, 1, 1,
0.3753659, 0.9993718, 0.7159914, 1, 1, 1, 1, 1,
0.3755786, -0.7496195, 1.912268, 0, 0, 1, 1, 1,
0.3814476, 1.679549, -1.307704, 1, 0, 0, 1, 1,
0.383812, 0.2154375, 0.4552409, 1, 0, 0, 1, 1,
0.3916359, -2.393792, 3.992501, 1, 0, 0, 1, 1,
0.3917812, -0.5770155, 3.633565, 1, 0, 0, 1, 1,
0.39371, -0.314605, 2.358865, 1, 0, 0, 1, 1,
0.3971302, -0.6279768, 3.335647, 0, 0, 0, 1, 1,
0.3977882, 1.056309, -0.4680732, 0, 0, 0, 1, 1,
0.402768, -0.8671435, 3.010532, 0, 0, 0, 1, 1,
0.4074857, -0.7000988, 3.000647, 0, 0, 0, 1, 1,
0.4078656, -0.2525739, 3.639579, 0, 0, 0, 1, 1,
0.4092757, -0.168147, 2.56249, 0, 0, 0, 1, 1,
0.4124213, 0.4838748, 1.726699, 0, 0, 0, 1, 1,
0.4142214, -1.097176, 3.37141, 1, 1, 1, 1, 1,
0.4156104, 1.76053, 0.7312385, 1, 1, 1, 1, 1,
0.417471, 0.8745806, 0.09344713, 1, 1, 1, 1, 1,
0.4182584, -0.2868904, 1.292542, 1, 1, 1, 1, 1,
0.418265, 0.119953, 2.395034, 1, 1, 1, 1, 1,
0.4194783, -0.5683689, 2.666121, 1, 1, 1, 1, 1,
0.4216836, 0.5933536, 0.9762354, 1, 1, 1, 1, 1,
0.4237888, 0.1896334, 1.291362, 1, 1, 1, 1, 1,
0.4325137, 0.7706426, -0.1664627, 1, 1, 1, 1, 1,
0.433702, -1.973544, 2.969254, 1, 1, 1, 1, 1,
0.4367962, -2.018401, 3.717868, 1, 1, 1, 1, 1,
0.4467328, 1.567028, 1.300725, 1, 1, 1, 1, 1,
0.4474727, -1.435094, 2.663929, 1, 1, 1, 1, 1,
0.4495588, -0.6288593, 2.77085, 1, 1, 1, 1, 1,
0.4581082, -0.7438416, 1.447398, 1, 1, 1, 1, 1,
0.4597953, -2.327214, 3.689729, 0, 0, 1, 1, 1,
0.4626304, 2.036526, 1.864278, 1, 0, 0, 1, 1,
0.462681, -0.9760583, 1.944856, 1, 0, 0, 1, 1,
0.4650718, 1.103474, 1.187743, 1, 0, 0, 1, 1,
0.4665874, -0.4096583, 3.615149, 1, 0, 0, 1, 1,
0.4684934, 0.8227867, 1.246813, 1, 0, 0, 1, 1,
0.4719711, 1.033526, -0.5716587, 0, 0, 0, 1, 1,
0.4725263, -0.01706162, 1.332486, 0, 0, 0, 1, 1,
0.4734952, 0.5600548, 1.594345, 0, 0, 0, 1, 1,
0.4791594, -0.961729, 3.606203, 0, 0, 0, 1, 1,
0.4841882, -1.492982, 2.931848, 0, 0, 0, 1, 1,
0.4869007, 0.5317665, 1.024975, 0, 0, 0, 1, 1,
0.488822, -2.291804, 4.034657, 0, 0, 0, 1, 1,
0.4892782, -0.6044255, 2.350722, 1, 1, 1, 1, 1,
0.4934652, 0.1341994, 0.562602, 1, 1, 1, 1, 1,
0.4945235, -0.8589459, 3.957266, 1, 1, 1, 1, 1,
0.4976435, 2.079728, 0.7803867, 1, 1, 1, 1, 1,
0.4984187, 0.9322448, 1.600314, 1, 1, 1, 1, 1,
0.501032, 0.1016877, -0.5873957, 1, 1, 1, 1, 1,
0.5030146, 1.680058, 0.6306841, 1, 1, 1, 1, 1,
0.5074514, -0.1376893, 3.102389, 1, 1, 1, 1, 1,
0.5100449, -0.6645938, 1.861388, 1, 1, 1, 1, 1,
0.5115553, -0.4703465, 2.558069, 1, 1, 1, 1, 1,
0.5142936, -0.6735486, 3.155514, 1, 1, 1, 1, 1,
0.5149577, -0.8180052, 2.81535, 1, 1, 1, 1, 1,
0.515071, -0.3465849, 1.806906, 1, 1, 1, 1, 1,
0.5156704, 0.7565927, 1.492959, 1, 1, 1, 1, 1,
0.5182869, -1.786602, 1.92306, 1, 1, 1, 1, 1,
0.5202026, 1.475267, 0.7587476, 0, 0, 1, 1, 1,
0.5307328, -0.8061194, 2.238284, 1, 0, 0, 1, 1,
0.5360338, 0.7180358, 1.484422, 1, 0, 0, 1, 1,
0.5377542, 0.6172647, 3.751229, 1, 0, 0, 1, 1,
0.538314, -0.6589839, 3.163388, 1, 0, 0, 1, 1,
0.5386551, 2.130052, -1.063724, 1, 0, 0, 1, 1,
0.5400971, -1.630134, 3.47509, 0, 0, 0, 1, 1,
0.5417566, -1.102313, 3.916826, 0, 0, 0, 1, 1,
0.5432805, 0.24637, 2.959737, 0, 0, 0, 1, 1,
0.543565, 0.3122799, 0.7519632, 0, 0, 0, 1, 1,
0.5443614, 0.4729622, 0.9908405, 0, 0, 0, 1, 1,
0.5466366, 1.43308, -0.9714055, 0, 0, 0, 1, 1,
0.5500365, -1.12733, 1.847047, 0, 0, 0, 1, 1,
0.5542998, 0.7951275, 0.5368723, 1, 1, 1, 1, 1,
0.5548291, 0.1588335, 0.486951, 1, 1, 1, 1, 1,
0.5558476, -1.11212, 1.742417, 1, 1, 1, 1, 1,
0.56068, 1.062171, 0.2636445, 1, 1, 1, 1, 1,
0.5675986, 0.9136792, 1.788855, 1, 1, 1, 1, 1,
0.5700865, -1.720197, 2.760688, 1, 1, 1, 1, 1,
0.5715429, 0.1392001, 2.741247, 1, 1, 1, 1, 1,
0.5717339, 1.583032, 0.6352283, 1, 1, 1, 1, 1,
0.5732309, -1.117372, 2.329016, 1, 1, 1, 1, 1,
0.5786118, -0.3564256, 2.553388, 1, 1, 1, 1, 1,
0.5873504, 1.581557, -0.3018339, 1, 1, 1, 1, 1,
0.5925979, 0.1910115, 1.14975, 1, 1, 1, 1, 1,
0.5928579, -0.7514948, 1.334151, 1, 1, 1, 1, 1,
0.59333, 0.7910483, 0.6966318, 1, 1, 1, 1, 1,
0.5937694, 1.836543, -0.07517228, 1, 1, 1, 1, 1,
0.5984113, -0.7225676, 2.597086, 0, 0, 1, 1, 1,
0.6019251, -0.07032867, 1.609975, 1, 0, 0, 1, 1,
0.6061484, -0.2656464, 0.4157081, 1, 0, 0, 1, 1,
0.6101621, 0.3696962, 0.3906701, 1, 0, 0, 1, 1,
0.6136599, -1.395563, 2.923115, 1, 0, 0, 1, 1,
0.6204468, 1.033161, 0.2937125, 1, 0, 0, 1, 1,
0.6232648, 2.164839, 0.8511397, 0, 0, 0, 1, 1,
0.6339396, 0.6187815, 0.2909341, 0, 0, 0, 1, 1,
0.6347089, -0.9495519, 3.632587, 0, 0, 0, 1, 1,
0.6355975, -2.432344, 2.78779, 0, 0, 0, 1, 1,
0.6401475, -0.1794994, 2.658623, 0, 0, 0, 1, 1,
0.6416976, -0.5589204, 4.374848, 0, 0, 0, 1, 1,
0.642574, 0.7071389, 0.582915, 0, 0, 0, 1, 1,
0.6444933, -1.933667, 2.763957, 1, 1, 1, 1, 1,
0.6461713, -1.44155, 2.837312, 1, 1, 1, 1, 1,
0.6496797, 1.064011, 0.2400631, 1, 1, 1, 1, 1,
0.6562042, 0.9910644, 1.89045, 1, 1, 1, 1, 1,
0.6570774, -0.2657531, 2.37569, 1, 1, 1, 1, 1,
0.6663265, 0.1931132, 2.053936, 1, 1, 1, 1, 1,
0.6680609, 0.06102329, 1.120034, 1, 1, 1, 1, 1,
0.669544, 0.04962479, 1.582196, 1, 1, 1, 1, 1,
0.6734622, -0.7389373, 0.406708, 1, 1, 1, 1, 1,
0.6737065, 1.500994, 0.74554, 1, 1, 1, 1, 1,
0.6756515, -0.1705392, 0.805795, 1, 1, 1, 1, 1,
0.6771512, 0.100975, 1.617897, 1, 1, 1, 1, 1,
0.6779217, 0.5329617, 0.8057392, 1, 1, 1, 1, 1,
0.6819006, 0.7388311, 0.8901764, 1, 1, 1, 1, 1,
0.6840911, 0.003208652, 1.062708, 1, 1, 1, 1, 1,
0.6841739, -0.4273496, 1.866007, 0, 0, 1, 1, 1,
0.6865675, -0.9907244, 2.291021, 1, 0, 0, 1, 1,
0.6887707, 0.8594885, 1.394353, 1, 0, 0, 1, 1,
0.6888932, 0.5918359, 0.2545599, 1, 0, 0, 1, 1,
0.6962482, -0.01098698, 1.735752, 1, 0, 0, 1, 1,
0.6963204, 0.01426387, 1.40403, 1, 0, 0, 1, 1,
0.6969025, -0.3801939, 4.202831, 0, 0, 0, 1, 1,
0.6973676, 0.8490653, 1.034759, 0, 0, 0, 1, 1,
0.6975346, 0.1912706, 1.359618, 0, 0, 0, 1, 1,
0.7075963, 0.6845577, 0.1538347, 0, 0, 0, 1, 1,
0.7157836, 0.217773, -0.2127381, 0, 0, 0, 1, 1,
0.7175012, -0.05780134, 0.2837975, 0, 0, 0, 1, 1,
0.7188216, -0.8409424, 2.55409, 0, 0, 0, 1, 1,
0.7198835, 0.07964659, 0.2256882, 1, 1, 1, 1, 1,
0.7250152, -0.3843847, 2.437364, 1, 1, 1, 1, 1,
0.7258115, -0.1163611, 2.114105, 1, 1, 1, 1, 1,
0.7275359, 1.398534, 0.1286634, 1, 1, 1, 1, 1,
0.7290988, -0.01657735, 0.6162111, 1, 1, 1, 1, 1,
0.7330148, -1.019671, 2.092107, 1, 1, 1, 1, 1,
0.7368875, 0.08346548, 1.074481, 1, 1, 1, 1, 1,
0.7524812, -0.6599581, 2.899627, 1, 1, 1, 1, 1,
0.7597613, -1.945184, 3.984449, 1, 1, 1, 1, 1,
0.7639771, 0.9756709, 0.3437549, 1, 1, 1, 1, 1,
0.7663127, -1.992749, 1.485776, 1, 1, 1, 1, 1,
0.7666547, 0.5823465, 1.106058, 1, 1, 1, 1, 1,
0.7686276, -0.6517156, 2.839033, 1, 1, 1, 1, 1,
0.769522, -2.493125, 2.431205, 1, 1, 1, 1, 1,
0.7837572, -0.1989338, 0.9577916, 1, 1, 1, 1, 1,
0.7850517, -0.4589632, 2.727346, 0, 0, 1, 1, 1,
0.792193, -1.135098, 1.991842, 1, 0, 0, 1, 1,
0.7974391, -1.861597, 2.565215, 1, 0, 0, 1, 1,
0.8020883, 1.453627, 0.4435863, 1, 0, 0, 1, 1,
0.8047502, 2.137238, 1.149798, 1, 0, 0, 1, 1,
0.8062497, 0.3475167, 1.56487, 1, 0, 0, 1, 1,
0.8077095, -0.09242645, 0.5449055, 0, 0, 0, 1, 1,
0.8185037, 1.143049, 1.350032, 0, 0, 0, 1, 1,
0.8253126, -0.04507132, 2.477417, 0, 0, 0, 1, 1,
0.8273668, 2.008987, -0.0394903, 0, 0, 0, 1, 1,
0.8289126, -0.7263463, 3.488161, 0, 0, 0, 1, 1,
0.8423659, 1.171178, 1.172588, 0, 0, 0, 1, 1,
0.8455715, 0.7973654, 0.5402877, 0, 0, 0, 1, 1,
0.8465132, -0.3925997, 1.630328, 1, 1, 1, 1, 1,
0.8524697, -2.447662, 2.637837, 1, 1, 1, 1, 1,
0.8605763, 0.1128339, 2.822805, 1, 1, 1, 1, 1,
0.8656737, -0.4030228, 1.842513, 1, 1, 1, 1, 1,
0.868694, 0.3338228, 1.112213, 1, 1, 1, 1, 1,
0.8709192, 2.532856, 2.269555, 1, 1, 1, 1, 1,
0.8749367, 0.8486952, 2.086509, 1, 1, 1, 1, 1,
0.8749566, -0.006863425, 3.059433, 1, 1, 1, 1, 1,
0.8758467, 1.183519, 0.1644842, 1, 1, 1, 1, 1,
0.8761737, 0.400983, 1.999997, 1, 1, 1, 1, 1,
0.8800858, 0.4062141, 0.6199015, 1, 1, 1, 1, 1,
0.8807136, 0.4171123, 1.856653, 1, 1, 1, 1, 1,
0.8878602, 0.1376002, 1.471665, 1, 1, 1, 1, 1,
0.8881698, 1.171173, 0.2469414, 1, 1, 1, 1, 1,
0.8884267, -0.9658197, 1.492071, 1, 1, 1, 1, 1,
0.8886087, 0.1453274, 2.302447, 0, 0, 1, 1, 1,
0.891086, 0.1232623, 1.545816, 1, 0, 0, 1, 1,
0.8989097, -2.36123, 2.305955, 1, 0, 0, 1, 1,
0.9005085, -0.9419921, 1.750367, 1, 0, 0, 1, 1,
0.9023052, -0.368692, 1.266348, 1, 0, 0, 1, 1,
0.902792, 2.379656, -1.264052, 1, 0, 0, 1, 1,
0.9039962, 0.1219816, 2.420373, 0, 0, 0, 1, 1,
0.9061483, 0.5083231, 0.8360189, 0, 0, 0, 1, 1,
0.9079341, 0.8619816, 0.2388245, 0, 0, 0, 1, 1,
0.9110665, 2.133791, 1.052139, 0, 0, 0, 1, 1,
0.913558, -0.3574771, -0.6117121, 0, 0, 0, 1, 1,
0.9301114, 1.081173, 2.532317, 0, 0, 0, 1, 1,
0.9325705, -1.22772, 2.51006, 0, 0, 0, 1, 1,
0.935567, 0.03649119, 2.278298, 1, 1, 1, 1, 1,
0.942776, -0.0226394, -0.0465744, 1, 1, 1, 1, 1,
0.9442837, 1.263806, 1.737114, 1, 1, 1, 1, 1,
0.9611223, 1.286107, 1.155079, 1, 1, 1, 1, 1,
0.9631442, 0.141511, 1.376938, 1, 1, 1, 1, 1,
0.9689443, 1.379834, -0.9051302, 1, 1, 1, 1, 1,
0.9710942, 1.526863, -0.4273133, 1, 1, 1, 1, 1,
0.9713123, 0.5877318, 2.306897, 1, 1, 1, 1, 1,
0.9715152, 0.7250822, 1.653878, 1, 1, 1, 1, 1,
0.9733841, -1.045049, 2.301654, 1, 1, 1, 1, 1,
0.9745244, 0.04023056, 2.7007, 1, 1, 1, 1, 1,
0.9763898, 0.6509534, 0.7076396, 1, 1, 1, 1, 1,
0.9809416, 0.07973577, 1.737187, 1, 1, 1, 1, 1,
0.982663, 1.348445, 0.8897622, 1, 1, 1, 1, 1,
0.9832166, 1.27113, 0.609547, 1, 1, 1, 1, 1,
0.9879394, 0.6507467, 0.6226084, 0, 0, 1, 1, 1,
0.9965129, 1.133592, 0.5538271, 1, 0, 0, 1, 1,
0.9977091, 1.31756, 0.9026579, 1, 0, 0, 1, 1,
1.003582, 0.04409354, 0.09238983, 1, 0, 0, 1, 1,
1.005411, 0.09616742, 2.320482, 1, 0, 0, 1, 1,
1.006616, -1.066696, 2.534729, 1, 0, 0, 1, 1,
1.007768, -0.1470305, 1.33851, 0, 0, 0, 1, 1,
1.008015, 0.4820175, -0.5835375, 0, 0, 0, 1, 1,
1.013969, -0.6512516, 1.374267, 0, 0, 0, 1, 1,
1.014642, 1.572502, 0.5206602, 0, 0, 0, 1, 1,
1.015434, 0.8958315, 0.7748886, 0, 0, 0, 1, 1,
1.015473, -1.330307, 2.630996, 0, 0, 0, 1, 1,
1.017857, -0.1210645, 1.48398, 0, 0, 0, 1, 1,
1.026121, -0.1368909, 1.546095, 1, 1, 1, 1, 1,
1.029865, -1.559597, 3.443201, 1, 1, 1, 1, 1,
1.034557, 1.088432, 1.755834, 1, 1, 1, 1, 1,
1.035493, 1.317548, 2.368315, 1, 1, 1, 1, 1,
1.036092, 0.1383859, 0.2148112, 1, 1, 1, 1, 1,
1.038263, -0.3893102, 2.458614, 1, 1, 1, 1, 1,
1.039075, -1.445401, 1.702325, 1, 1, 1, 1, 1,
1.039818, 0.7870454, -0.08740029, 1, 1, 1, 1, 1,
1.04238, 0.8470078, 0.5564363, 1, 1, 1, 1, 1,
1.043363, -1.2745, 1.953377, 1, 1, 1, 1, 1,
1.046182, -0.8956698, 1.323889, 1, 1, 1, 1, 1,
1.054619, 0.07694928, 1.396563, 1, 1, 1, 1, 1,
1.055072, 0.6795575, -0.2738228, 1, 1, 1, 1, 1,
1.059489, 0.3226975, 2.516503, 1, 1, 1, 1, 1,
1.059635, 1.178524, 0.9457017, 1, 1, 1, 1, 1,
1.061429, 0.2947497, -0.4957231, 0, 0, 1, 1, 1,
1.062294, 0.2553375, 0.8694877, 1, 0, 0, 1, 1,
1.062416, 0.4475946, 2.599113, 1, 0, 0, 1, 1,
1.064996, -1.156008, 2.78252, 1, 0, 0, 1, 1,
1.065712, 0.882544, 1.053183, 1, 0, 0, 1, 1,
1.084595, 1.077294, 0.8340335, 1, 0, 0, 1, 1,
1.087074, -0.7325178, 2.238813, 0, 0, 0, 1, 1,
1.089175, -0.3835591, 2.096286, 0, 0, 0, 1, 1,
1.098068, -0.08805806, 1.787162, 0, 0, 0, 1, 1,
1.102046, 0.7554741, 0.5987957, 0, 0, 0, 1, 1,
1.105124, 1.365132, 0.2931842, 0, 0, 0, 1, 1,
1.106515, -0.1424767, -0.108588, 0, 0, 0, 1, 1,
1.108874, 1.034759, -0.3749998, 0, 0, 0, 1, 1,
1.112009, 1.091056, -2.104792, 1, 1, 1, 1, 1,
1.134785, -1.110203, 2.748177, 1, 1, 1, 1, 1,
1.135733, -0.2251583, 2.356546, 1, 1, 1, 1, 1,
1.145918, -0.3474789, 1.50588, 1, 1, 1, 1, 1,
1.153597, 2.509417, 0.3659015, 1, 1, 1, 1, 1,
1.166445, 0.888392, 0.2659998, 1, 1, 1, 1, 1,
1.171273, -1.01841, 4.248807, 1, 1, 1, 1, 1,
1.183949, 0.1810057, 1.445143, 1, 1, 1, 1, 1,
1.185375, -2.116341, 2.080691, 1, 1, 1, 1, 1,
1.199888, -1.152491, 1.568016, 1, 1, 1, 1, 1,
1.206165, 0.7847373, -0.09637453, 1, 1, 1, 1, 1,
1.207994, -0.5019572, 1.676434, 1, 1, 1, 1, 1,
1.216901, 0.8148922, 3.600179, 1, 1, 1, 1, 1,
1.225807, -0.897124, 0.7561372, 1, 1, 1, 1, 1,
1.233329, -0.1308034, 1.646876, 1, 1, 1, 1, 1,
1.237093, 0.2897718, 2.116325, 0, 0, 1, 1, 1,
1.247284, 1.223885, 2.062923, 1, 0, 0, 1, 1,
1.250944, 0.07382604, 2.351305, 1, 0, 0, 1, 1,
1.252733, 0.8279967, 1.646326, 1, 0, 0, 1, 1,
1.269897, -0.3919196, 1.598302, 1, 0, 0, 1, 1,
1.273499, 1.000258, 0.5579185, 1, 0, 0, 1, 1,
1.275248, 0.7821169, 0.6619821, 0, 0, 0, 1, 1,
1.283107, -0.3571145, 3.155087, 0, 0, 0, 1, 1,
1.28585, -0.5775065, 1.453295, 0, 0, 0, 1, 1,
1.290734, -0.7739046, 2.033588, 0, 0, 0, 1, 1,
1.306361, 1.423268, 0.1189372, 0, 0, 0, 1, 1,
1.307388, -0.6500999, 2.352006, 0, 0, 0, 1, 1,
1.308312, 0.4124881, 0.9856463, 0, 0, 0, 1, 1,
1.310723, -1.11061, 3.482692, 1, 1, 1, 1, 1,
1.317077, -0.5210317, 3.401371, 1, 1, 1, 1, 1,
1.318496, -0.1518165, 2.411823, 1, 1, 1, 1, 1,
1.322856, -0.5559407, 1.008093, 1, 1, 1, 1, 1,
1.333338, 0.8721231, 1.95917, 1, 1, 1, 1, 1,
1.335305, 0.06090499, 2.135761, 1, 1, 1, 1, 1,
1.336997, -1.137624, 3.22749, 1, 1, 1, 1, 1,
1.338132, -3.349433, 2.693704, 1, 1, 1, 1, 1,
1.340951, -0.9468656, 3.326867, 1, 1, 1, 1, 1,
1.345528, -0.3527431, 3.132489, 1, 1, 1, 1, 1,
1.349639, 0.5995057, 0.6338992, 1, 1, 1, 1, 1,
1.357294, -0.1569256, 2.064885, 1, 1, 1, 1, 1,
1.377833, 1.137392, 0.3965313, 1, 1, 1, 1, 1,
1.38166, -2.001972, 3.437914, 1, 1, 1, 1, 1,
1.38342, -0.4325923, 1.353438, 1, 1, 1, 1, 1,
1.38372, 0.1185269, 1.663025, 0, 0, 1, 1, 1,
1.394133, 1.202974, 1.17915, 1, 0, 0, 1, 1,
1.395597, -0.5143769, 0.7521453, 1, 0, 0, 1, 1,
1.413888, 0.5862308, -0.2770523, 1, 0, 0, 1, 1,
1.419163, 0.9155301, 0.0429147, 1, 0, 0, 1, 1,
1.421871, -0.007352849, 0.9350313, 1, 0, 0, 1, 1,
1.435312, 1.329965, 0.2914472, 0, 0, 0, 1, 1,
1.442942, -0.2444796, 2.034163, 0, 0, 0, 1, 1,
1.458992, 1.052558, -0.5871316, 0, 0, 0, 1, 1,
1.459024, -0.462739, -0.02469741, 0, 0, 0, 1, 1,
1.461515, -1.285738, 2.620519, 0, 0, 0, 1, 1,
1.461752, 0.03688565, -0.3537461, 0, 0, 0, 1, 1,
1.466054, -1.00043, 1.140868, 0, 0, 0, 1, 1,
1.478973, -0.2124371, 2.053843, 1, 1, 1, 1, 1,
1.48745, 1.299321, 0.9870489, 1, 1, 1, 1, 1,
1.491332, -0.3950239, 1.180405, 1, 1, 1, 1, 1,
1.529517, -1.527298, 3.024678, 1, 1, 1, 1, 1,
1.5348, -0.2200458, 1.896835, 1, 1, 1, 1, 1,
1.542, 2.580619, 1.741404, 1, 1, 1, 1, 1,
1.547607, -0.7015574, 2.828062, 1, 1, 1, 1, 1,
1.553836, 1.110952, 1.854711, 1, 1, 1, 1, 1,
1.557143, 0.3827438, 2.142981, 1, 1, 1, 1, 1,
1.560724, 0.06307074, 4.086626, 1, 1, 1, 1, 1,
1.586984, -0.001958445, 0.2275528, 1, 1, 1, 1, 1,
1.593766, 0.07094213, 0.9451644, 1, 1, 1, 1, 1,
1.596696, 0.3900478, 1.016356, 1, 1, 1, 1, 1,
1.613956, 0.1760247, 1.464367, 1, 1, 1, 1, 1,
1.620782, -0.1774798, 1.825616, 1, 1, 1, 1, 1,
1.644621, 0.1480922, 0.8979749, 0, 0, 1, 1, 1,
1.654486, -1.712696, 2.413312, 1, 0, 0, 1, 1,
1.656718, 0.2253811, -0.02144693, 1, 0, 0, 1, 1,
1.659069, 0.007156065, 1.633269, 1, 0, 0, 1, 1,
1.661013, 1.276966, -0.4480937, 1, 0, 0, 1, 1,
1.662875, -0.4263451, 3.782781, 1, 0, 0, 1, 1,
1.695025, 0.3914938, 2.843042, 0, 0, 0, 1, 1,
1.696203, -0.5083175, 2.497993, 0, 0, 0, 1, 1,
1.712589, -0.4196229, 0.07061731, 0, 0, 0, 1, 1,
1.716332, -0.198494, 0.5277941, 0, 0, 0, 1, 1,
1.718228, -1.219858, 2.971049, 0, 0, 0, 1, 1,
1.734678, -0.4259695, 2.786851, 0, 0, 0, 1, 1,
1.740696, 0.1197072, 0.2016099, 0, 0, 0, 1, 1,
1.774462, 1.581236, 1.524413, 1, 1, 1, 1, 1,
1.777803, -0.6471932, 2.253821, 1, 1, 1, 1, 1,
1.779892, -0.8872317, 1.233279, 1, 1, 1, 1, 1,
1.862284, -1.402552, 2.623974, 1, 1, 1, 1, 1,
1.867591, -1.097858, 0.5649502, 1, 1, 1, 1, 1,
1.900064, 0.5080951, 0.6571158, 1, 1, 1, 1, 1,
1.907376, -0.9214476, 1.497527, 1, 1, 1, 1, 1,
1.909968, -0.4862409, 1.70938, 1, 1, 1, 1, 1,
1.918478, 0.9037159, 1.853011, 1, 1, 1, 1, 1,
1.935623, -0.5386843, 0.6882645, 1, 1, 1, 1, 1,
1.99416, 0.5608512, 0.9756857, 1, 1, 1, 1, 1,
2.007091, 0.6100935, 2.413888, 1, 1, 1, 1, 1,
2.035135, 1.646875, 0.2257293, 1, 1, 1, 1, 1,
2.064963, 2.266872, -0.6685252, 1, 1, 1, 1, 1,
2.100086, -0.7230801, 3.944598, 1, 1, 1, 1, 1,
2.10912, 0.6873729, 1.924297, 0, 0, 1, 1, 1,
2.121731, -1.181441, 2.873752, 1, 0, 0, 1, 1,
2.172054, -0.8410282, 3.10211, 1, 0, 0, 1, 1,
2.199178, -1.776988, 1.120615, 1, 0, 0, 1, 1,
2.260172, 0.7554464, -0.9616076, 1, 0, 0, 1, 1,
2.264328, 1.447479, 2.986877, 1, 0, 0, 1, 1,
2.281564, -0.06478944, 1.693913, 0, 0, 0, 1, 1,
2.301172, -0.6868404, 2.489609, 0, 0, 0, 1, 1,
2.310538, -0.9919981, 1.904772, 0, 0, 0, 1, 1,
2.321603, 0.1591467, 0.6575217, 0, 0, 0, 1, 1,
2.325754, 0.6081574, 1.088984, 0, 0, 0, 1, 1,
2.40006, 0.8115245, -0.02089347, 0, 0, 0, 1, 1,
2.402723, -0.05814929, -0.3994295, 0, 0, 0, 1, 1,
2.436917, 0.3108087, 2.607947, 1, 1, 1, 1, 1,
2.464236, -0.3785665, 1.864768, 1, 1, 1, 1, 1,
2.506874, -0.4389849, 2.305532, 1, 1, 1, 1, 1,
2.559653, 0.2452304, 3.405697, 1, 1, 1, 1, 1,
2.580585, 1.722418, 0.0806471, 1, 1, 1, 1, 1,
3.249589, -0.4715938, 2.812901, 1, 1, 1, 1, 1,
3.410047, 0.2051946, 0.70156, 1, 1, 1, 1, 1
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
var radius = 9.82284;
var distance = 34.50231;
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
mvMatrix.translate( -0.1529651, 0.2942141, 0.04365277 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50231);
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
