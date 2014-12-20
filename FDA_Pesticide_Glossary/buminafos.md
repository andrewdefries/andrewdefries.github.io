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
-3.749624, -1.100585, -0.9718793, 1, 0, 0, 1,
-3.423319, 0.9167292, -1.719861, 1, 0.007843138, 0, 1,
-3.119645, 0.818338, -0.5382957, 1, 0.01176471, 0, 1,
-3.05796, 0.9620074, -2.311841, 1, 0.01960784, 0, 1,
-3.053008, 0.3426788, -0.05443693, 1, 0.02352941, 0, 1,
-2.987509, 1.448849, -2.424413, 1, 0.03137255, 0, 1,
-2.569731, -0.7948879, -1.289358, 1, 0.03529412, 0, 1,
-2.486625, -1.589489, -1.564795, 1, 0.04313726, 0, 1,
-2.429195, 1.107678, -2.008884, 1, 0.04705882, 0, 1,
-2.420039, -0.3003595, -0.1591701, 1, 0.05490196, 0, 1,
-2.417763, -0.1437615, -0.2842565, 1, 0.05882353, 0, 1,
-2.396782, 0.5796666, -0.4054296, 1, 0.06666667, 0, 1,
-2.393683, 0.9973809, -1.763062, 1, 0.07058824, 0, 1,
-2.383879, 1.392185, -1.982665, 1, 0.07843138, 0, 1,
-2.301947, 1.35511, 0.1368774, 1, 0.08235294, 0, 1,
-2.269691, -0.2778113, -1.705055, 1, 0.09019608, 0, 1,
-2.243854, 0.02923954, -3.235137, 1, 0.09411765, 0, 1,
-2.175412, -0.1300142, -2.243774, 1, 0.1019608, 0, 1,
-2.156886, -0.9631884, -2.172296, 1, 0.1098039, 0, 1,
-2.149606, -0.6248256, -1.271034, 1, 0.1137255, 0, 1,
-2.122928, -0.3972471, -3.020618, 1, 0.1215686, 0, 1,
-2.113456, 0.7759703, 0.110717, 1, 0.1254902, 0, 1,
-2.110456, 0.4583144, -2.319443, 1, 0.1333333, 0, 1,
-2.08142, 0.3382035, -1.512978, 1, 0.1372549, 0, 1,
-2.07593, 1.625116, 0.04180193, 1, 0.145098, 0, 1,
-2.068966, 0.2096381, -3.033096, 1, 0.1490196, 0, 1,
-2.056496, 0.1350994, -1.2136, 1, 0.1568628, 0, 1,
-2.039937, 0.2571818, -2.24102, 1, 0.1607843, 0, 1,
-2.031536, 0.6902048, -2.640652, 1, 0.1686275, 0, 1,
-2.008083, 1.010854, -2.622186, 1, 0.172549, 0, 1,
-1.965411, -0.4693946, -0.5997624, 1, 0.1803922, 0, 1,
-1.9429, 0.2655425, -1.068393, 1, 0.1843137, 0, 1,
-1.911532, 0.07635881, -0.9666314, 1, 0.1921569, 0, 1,
-1.907134, 0.6609169, -0.9637026, 1, 0.1960784, 0, 1,
-1.871599, 0.4044034, -0.7157921, 1, 0.2039216, 0, 1,
-1.868922, 1.108943, -1.313073, 1, 0.2117647, 0, 1,
-1.865781, 0.6154927, -3.123286, 1, 0.2156863, 0, 1,
-1.832685, -0.3122807, -1.716273, 1, 0.2235294, 0, 1,
-1.812886, -1.435712, -1.874532, 1, 0.227451, 0, 1,
-1.795212, 0.4119907, -1.424935, 1, 0.2352941, 0, 1,
-1.783598, -0.1942045, 0.8146677, 1, 0.2392157, 0, 1,
-1.781615, -1.112293, -3.59944, 1, 0.2470588, 0, 1,
-1.758096, -0.5231182, -2.693605, 1, 0.2509804, 0, 1,
-1.757981, 0.8740792, -0.8278039, 1, 0.2588235, 0, 1,
-1.71643, 0.8900926, -0.4843664, 1, 0.2627451, 0, 1,
-1.713385, 1.732613, -1.493999, 1, 0.2705882, 0, 1,
-1.708434, -0.04285802, -1.731784, 1, 0.2745098, 0, 1,
-1.706638, 0.7029314, -1.904126, 1, 0.282353, 0, 1,
-1.705313, -1.444677, -3.756541, 1, 0.2862745, 0, 1,
-1.704625, -0.2024926, -1.142929, 1, 0.2941177, 0, 1,
-1.70167, -0.2651902, -2.219089, 1, 0.3019608, 0, 1,
-1.700499, 0.6044051, -2.080321, 1, 0.3058824, 0, 1,
-1.658409, 1.81657, -1.789969, 1, 0.3137255, 0, 1,
-1.638537, 0.247941, -2.71155, 1, 0.3176471, 0, 1,
-1.637935, 0.7126452, -2.098076, 1, 0.3254902, 0, 1,
-1.634454, 0.2315275, -1.662486, 1, 0.3294118, 0, 1,
-1.622688, -1.500049, -2.492145, 1, 0.3372549, 0, 1,
-1.622202, 1.963539, -0.3201903, 1, 0.3411765, 0, 1,
-1.604089, -2.074648, -1.604894, 1, 0.3490196, 0, 1,
-1.599632, -0.9777713, -1.779309, 1, 0.3529412, 0, 1,
-1.593427, -0.7155094, -0.2535159, 1, 0.3607843, 0, 1,
-1.593327, 1.297538, 0.1072773, 1, 0.3647059, 0, 1,
-1.590129, 0.7500287, -0.1264181, 1, 0.372549, 0, 1,
-1.567463, 0.89752, -0.8225363, 1, 0.3764706, 0, 1,
-1.560624, 0.2643239, -2.145294, 1, 0.3843137, 0, 1,
-1.555915, 0.1853602, -3.426101, 1, 0.3882353, 0, 1,
-1.551962, 0.7320378, -1.267984, 1, 0.3960784, 0, 1,
-1.54401, -1.978077, -3.560516, 1, 0.4039216, 0, 1,
-1.534596, -1.126922, -2.835962, 1, 0.4078431, 0, 1,
-1.518978, 0.6009341, -0.3789477, 1, 0.4156863, 0, 1,
-1.51353, -0.4569036, -2.117889, 1, 0.4196078, 0, 1,
-1.504747, -1.436181, -1.22245, 1, 0.427451, 0, 1,
-1.494198, -0.8965093, -0.6858831, 1, 0.4313726, 0, 1,
-1.461263, -0.05302088, -3.812356, 1, 0.4392157, 0, 1,
-1.456354, -0.8226811, -2.436989, 1, 0.4431373, 0, 1,
-1.456284, 1.040032, -0.8419672, 1, 0.4509804, 0, 1,
-1.4454, -1.452731, -2.289842, 1, 0.454902, 0, 1,
-1.438818, 0.4293998, 0.1913469, 1, 0.4627451, 0, 1,
-1.433821, -0.7842345, -2.619138, 1, 0.4666667, 0, 1,
-1.431336, 0.2944315, -0.2744247, 1, 0.4745098, 0, 1,
-1.42208, -0.2504686, -1.26066, 1, 0.4784314, 0, 1,
-1.420531, -1.538965, -0.5580214, 1, 0.4862745, 0, 1,
-1.419223, -0.4457796, -1.08064, 1, 0.4901961, 0, 1,
-1.418295, -2.532071, -1.598984, 1, 0.4980392, 0, 1,
-1.413214, 1.034652, -1.655658, 1, 0.5058824, 0, 1,
-1.412928, -1.492608, -1.968154, 1, 0.509804, 0, 1,
-1.398884, 2.203108, -0.6894644, 1, 0.5176471, 0, 1,
-1.397431, 0.03507314, -2.093645, 1, 0.5215687, 0, 1,
-1.396303, -1.250113, -3.188131, 1, 0.5294118, 0, 1,
-1.390733, -0.8611643, -1.261361, 1, 0.5333334, 0, 1,
-1.386493, -0.0414429, -1.818466, 1, 0.5411765, 0, 1,
-1.380888, -0.8568407, -2.234865, 1, 0.5450981, 0, 1,
-1.377549, -0.2387475, -1.622923, 1, 0.5529412, 0, 1,
-1.358004, -0.4082481, -3.151244, 1, 0.5568628, 0, 1,
-1.354398, -0.663297, -1.164344, 1, 0.5647059, 0, 1,
-1.351246, -0.0477896, -2.004199, 1, 0.5686275, 0, 1,
-1.342162, -1.153914, -3.104911, 1, 0.5764706, 0, 1,
-1.335266, 1.744425, -1.533742, 1, 0.5803922, 0, 1,
-1.335021, 0.4450814, -1.007376, 1, 0.5882353, 0, 1,
-1.329764, -1.375326, -3.103763, 1, 0.5921569, 0, 1,
-1.327399, 0.5341505, -2.01998, 1, 0.6, 0, 1,
-1.326129, 0.124404, -1.443193, 1, 0.6078432, 0, 1,
-1.325598, -1.875074, -2.056132, 1, 0.6117647, 0, 1,
-1.324776, -0.7312896, -1.861774, 1, 0.6196079, 0, 1,
-1.323684, -0.6472248, -1.837477, 1, 0.6235294, 0, 1,
-1.319207, 0.6565533, -1.652406, 1, 0.6313726, 0, 1,
-1.316106, -0.8486512, -1.690336, 1, 0.6352941, 0, 1,
-1.306555, -1.381944, -1.489307, 1, 0.6431373, 0, 1,
-1.302866, 0.1295769, 0.3975145, 1, 0.6470588, 0, 1,
-1.300387, -0.8390385, -0.8764344, 1, 0.654902, 0, 1,
-1.295754, 1.172314, -0.7897081, 1, 0.6588235, 0, 1,
-1.289796, -0.9135107, -3.322819, 1, 0.6666667, 0, 1,
-1.283319, 1.770821, -1.522267, 1, 0.6705883, 0, 1,
-1.278057, -0.8158365, -0.1129097, 1, 0.6784314, 0, 1,
-1.275452, -0.6530737, -2.996079, 1, 0.682353, 0, 1,
-1.267768, -1.043637, -0.8508096, 1, 0.6901961, 0, 1,
-1.258744, -0.3740364, -0.6227705, 1, 0.6941177, 0, 1,
-1.255295, -1.359188, -2.507831, 1, 0.7019608, 0, 1,
-1.252931, 1.625519, -0.7940395, 1, 0.7098039, 0, 1,
-1.252022, -0.08581533, 0.3368347, 1, 0.7137255, 0, 1,
-1.247707, -0.9382759, -3.322441, 1, 0.7215686, 0, 1,
-1.246847, 0.5991019, -0.7081294, 1, 0.7254902, 0, 1,
-1.242296, 0.3087663, -1.899544, 1, 0.7333333, 0, 1,
-1.235719, 0.7958993, -1.074098, 1, 0.7372549, 0, 1,
-1.226126, 0.08093508, -0.9144017, 1, 0.7450981, 0, 1,
-1.225818, -0.3309797, -3.130277, 1, 0.7490196, 0, 1,
-1.218064, -0.7414597, -3.931181, 1, 0.7568628, 0, 1,
-1.217327, -1.67166, -1.224349, 1, 0.7607843, 0, 1,
-1.214321, 1.569311, -0.4866205, 1, 0.7686275, 0, 1,
-1.208462, -0.6094366, -0.1832674, 1, 0.772549, 0, 1,
-1.19628, 1.285955, -1.812463, 1, 0.7803922, 0, 1,
-1.19416, -0.2538029, -2.408239, 1, 0.7843137, 0, 1,
-1.190198, -0.2279322, -1.818867, 1, 0.7921569, 0, 1,
-1.18919, 0.6407338, -2.065093, 1, 0.7960784, 0, 1,
-1.186436, -0.6680646, 0.2422291, 1, 0.8039216, 0, 1,
-1.184721, 0.8308697, -0.02391802, 1, 0.8117647, 0, 1,
-1.183341, 0.7281923, -1.625952, 1, 0.8156863, 0, 1,
-1.183099, 2.235739, -0.5296543, 1, 0.8235294, 0, 1,
-1.174591, 0.3966018, -1.842204, 1, 0.827451, 0, 1,
-1.166406, 0.9691303, -0.7666333, 1, 0.8352941, 0, 1,
-1.154427, 0.09430324, -1.323737, 1, 0.8392157, 0, 1,
-1.148299, 1.034929, -1.803114, 1, 0.8470588, 0, 1,
-1.147036, 0.7441366, 0.3134729, 1, 0.8509804, 0, 1,
-1.143509, -0.2342231, -1.400947, 1, 0.8588235, 0, 1,
-1.142249, -0.6804788, -1.994277, 1, 0.8627451, 0, 1,
-1.137938, 1.153958, 0.3813221, 1, 0.8705882, 0, 1,
-1.136161, 0.161064, -1.648013, 1, 0.8745098, 0, 1,
-1.134681, -2.29133, -2.377725, 1, 0.8823529, 0, 1,
-1.132024, 0.5350007, -0.9756948, 1, 0.8862745, 0, 1,
-1.131221, -0.6542349, -0.4094139, 1, 0.8941177, 0, 1,
-1.129224, -0.7107514, -1.578124, 1, 0.8980392, 0, 1,
-1.127225, -0.07503133, -3.356061, 1, 0.9058824, 0, 1,
-1.115488, 0.4311199, -1.497245, 1, 0.9137255, 0, 1,
-1.111814, 0.9382923, -0.8028613, 1, 0.9176471, 0, 1,
-1.109996, -1.446375, -1.60754, 1, 0.9254902, 0, 1,
-1.104755, 1.149151, 0.288489, 1, 0.9294118, 0, 1,
-1.10214, -0.5384365, -2.914751, 1, 0.9372549, 0, 1,
-1.094582, -1.322032, -2.163425, 1, 0.9411765, 0, 1,
-1.088368, 0.07827391, -2.309687, 1, 0.9490196, 0, 1,
-1.07843, -1.137173, -1.619298, 1, 0.9529412, 0, 1,
-1.077609, 0.05746164, -1.630464, 1, 0.9607843, 0, 1,
-1.068781, -0.07841717, -2.929712, 1, 0.9647059, 0, 1,
-1.060056, -0.210613, -2.628629, 1, 0.972549, 0, 1,
-1.057948, 0.2105947, -3.829479, 1, 0.9764706, 0, 1,
-1.056981, -0.1091942, -3.221638, 1, 0.9843137, 0, 1,
-1.054728, -1.7765, -1.836306, 1, 0.9882353, 0, 1,
-1.044509, 1.473219, -0.9209202, 1, 0.9960784, 0, 1,
-1.039593, -1.800654, -3.664059, 0.9960784, 1, 0, 1,
-1.036981, 0.1113155, -1.010318, 0.9921569, 1, 0, 1,
-1.036975, -0.4192463, -2.679461, 0.9843137, 1, 0, 1,
-1.03669, -0.9979121, -2.555661, 0.9803922, 1, 0, 1,
-1.033747, 0.005865841, -3.031847, 0.972549, 1, 0, 1,
-1.030979, 1.756008, -1.4381, 0.9686275, 1, 0, 1,
-1.018857, -1.125292, -2.461206, 0.9607843, 1, 0, 1,
-1.010074, 1.970365, -0.5863165, 0.9568627, 1, 0, 1,
-0.9988476, 0.7758025, -0.5645753, 0.9490196, 1, 0, 1,
-0.9986176, -1.744142, -2.339564, 0.945098, 1, 0, 1,
-0.9913157, -0.6867518, -2.035704, 0.9372549, 1, 0, 1,
-0.9896588, -1.046283, -2.846943, 0.9333333, 1, 0, 1,
-0.9889215, -0.2995909, -2.046634, 0.9254902, 1, 0, 1,
-0.9887065, 0.3332493, -0.8486443, 0.9215686, 1, 0, 1,
-0.9754301, -0.4114435, -2.939959, 0.9137255, 1, 0, 1,
-0.9668849, -0.1317641, -2.263847, 0.9098039, 1, 0, 1,
-0.9666906, 0.6104157, -0.6433924, 0.9019608, 1, 0, 1,
-0.962694, 0.01585066, -2.00912, 0.8941177, 1, 0, 1,
-0.9626793, 0.1888983, -3.584915, 0.8901961, 1, 0, 1,
-0.9529043, -1.006911, -1.743088, 0.8823529, 1, 0, 1,
-0.9504182, -0.3089581, -2.473979, 0.8784314, 1, 0, 1,
-0.9438142, 0.2354267, -0.7497215, 0.8705882, 1, 0, 1,
-0.9326109, 0.1405543, -2.098409, 0.8666667, 1, 0, 1,
-0.9271867, -0.136326, -1.280366, 0.8588235, 1, 0, 1,
-0.9239772, 0.1543914, -2.389604, 0.854902, 1, 0, 1,
-0.9180898, 0.2356775, -1.571544, 0.8470588, 1, 0, 1,
-0.9175726, -0.9110289, -1.92776, 0.8431373, 1, 0, 1,
-0.9166093, 1.318756, 1.789883, 0.8352941, 1, 0, 1,
-0.9149802, 0.299958, -1.418329, 0.8313726, 1, 0, 1,
-0.9144994, 0.9986269, -0.7677692, 0.8235294, 1, 0, 1,
-0.9134541, 1.014076, 1.199338, 0.8196079, 1, 0, 1,
-0.9133469, 0.9907097, -2.035603, 0.8117647, 1, 0, 1,
-0.9132406, 0.9411626, -1.511139, 0.8078431, 1, 0, 1,
-0.9074121, 2.343954, -0.2350617, 0.8, 1, 0, 1,
-0.9007141, 0.02364027, -2.037895, 0.7921569, 1, 0, 1,
-0.8997591, 0.6069639, 0.5921246, 0.7882353, 1, 0, 1,
-0.8936275, 0.9791887, -0.2387219, 0.7803922, 1, 0, 1,
-0.8926156, -0.1734378, -2.417453, 0.7764706, 1, 0, 1,
-0.8902043, 1.760678, 0.6473733, 0.7686275, 1, 0, 1,
-0.8833981, -0.2267461, -0.7724661, 0.7647059, 1, 0, 1,
-0.8789811, -1.404188, -3.424244, 0.7568628, 1, 0, 1,
-0.873306, -1.996477, -1.297945, 0.7529412, 1, 0, 1,
-0.8698394, 0.01162192, -2.537204, 0.7450981, 1, 0, 1,
-0.8668409, 1.107332, 0.6197213, 0.7411765, 1, 0, 1,
-0.8665646, 2.225112, 0.9560926, 0.7333333, 1, 0, 1,
-0.8662286, 1.534692, -0.2984817, 0.7294118, 1, 0, 1,
-0.8659657, -0.7060273, -2.046665, 0.7215686, 1, 0, 1,
-0.858432, -1.205816, -2.275343, 0.7176471, 1, 0, 1,
-0.8445281, 0.1651234, -2.352985, 0.7098039, 1, 0, 1,
-0.8430368, 0.1729695, -1.310203, 0.7058824, 1, 0, 1,
-0.8388274, 1.338636, 0.5703111, 0.6980392, 1, 0, 1,
-0.8383234, -0.5308275, -2.385737, 0.6901961, 1, 0, 1,
-0.8274994, 0.4371962, 0.6948791, 0.6862745, 1, 0, 1,
-0.8273653, -0.6078746, -3.200601, 0.6784314, 1, 0, 1,
-0.8260663, 0.152084, -1.105574, 0.6745098, 1, 0, 1,
-0.819441, 0.8231283, -2.080575, 0.6666667, 1, 0, 1,
-0.8174684, -1.686305, -1.716437, 0.6627451, 1, 0, 1,
-0.8121741, 0.4981881, -0.5142164, 0.654902, 1, 0, 1,
-0.8085932, -0.9566815, -3.521375, 0.6509804, 1, 0, 1,
-0.8035365, 0.5694157, -1.030246, 0.6431373, 1, 0, 1,
-0.7991569, 0.4067071, -0.5705877, 0.6392157, 1, 0, 1,
-0.7955431, 0.9256618, -0.9541008, 0.6313726, 1, 0, 1,
-0.7941285, 1.119867, -0.3383542, 0.627451, 1, 0, 1,
-0.7940094, -1.430017, -1.692073, 0.6196079, 1, 0, 1,
-0.7929345, 2.039956, -0.8197573, 0.6156863, 1, 0, 1,
-0.7927315, -0.1178975, -4.0346, 0.6078432, 1, 0, 1,
-0.7925678, 0.5136724, -1.02093, 0.6039216, 1, 0, 1,
-0.7885705, -0.6937996, -2.713587, 0.5960785, 1, 0, 1,
-0.7875975, 0.1213907, -1.74146, 0.5882353, 1, 0, 1,
-0.7821828, 0.09970015, -2.200091, 0.5843138, 1, 0, 1,
-0.7731446, -1.256181, -2.550124, 0.5764706, 1, 0, 1,
-0.7701929, 0.6181896, -1.804124, 0.572549, 1, 0, 1,
-0.7686834, 0.5411584, -0.4940073, 0.5647059, 1, 0, 1,
-0.7668848, -0.06114245, -3.863716, 0.5607843, 1, 0, 1,
-0.7604069, 1.073469, -1.128598, 0.5529412, 1, 0, 1,
-0.7587909, -0.0771253, -1.099738, 0.5490196, 1, 0, 1,
-0.7493862, 1.345886, 0.02172365, 0.5411765, 1, 0, 1,
-0.7446781, -0.900692, -3.879718, 0.5372549, 1, 0, 1,
-0.7437774, -1.506185, -1.091289, 0.5294118, 1, 0, 1,
-0.7359499, -1.953808, -2.629098, 0.5254902, 1, 0, 1,
-0.7352984, 0.3693667, -1.209294, 0.5176471, 1, 0, 1,
-0.731562, -1.570457, -3.104554, 0.5137255, 1, 0, 1,
-0.7282423, -1.090575, -3.04668, 0.5058824, 1, 0, 1,
-0.7248665, -0.0883439, -3.982864, 0.5019608, 1, 0, 1,
-0.7213433, 0.3664291, -2.660022, 0.4941176, 1, 0, 1,
-0.7203726, -0.5556, -0.7586359, 0.4862745, 1, 0, 1,
-0.7120322, 0.7912847, -0.8255121, 0.4823529, 1, 0, 1,
-0.7086985, 1.641347, -1.672364, 0.4745098, 1, 0, 1,
-0.707467, -0.121574, -0.5559267, 0.4705882, 1, 0, 1,
-0.6928332, 1.444035, 0.03548908, 0.4627451, 1, 0, 1,
-0.6899779, -2.073074, -2.863242, 0.4588235, 1, 0, 1,
-0.6838371, -2.033364, -1.609246, 0.4509804, 1, 0, 1,
-0.679658, -0.1120657, -0.6154314, 0.4470588, 1, 0, 1,
-0.6680056, -0.9451758, -1.918106, 0.4392157, 1, 0, 1,
-0.6659321, 0.2886858, -2.048881, 0.4352941, 1, 0, 1,
-0.6566159, 1.73102, -0.8721348, 0.427451, 1, 0, 1,
-0.6556143, 0.2471618, -1.009371, 0.4235294, 1, 0, 1,
-0.6506236, -0.8730501, -3.202026, 0.4156863, 1, 0, 1,
-0.6504765, 0.1105562, -1.029215, 0.4117647, 1, 0, 1,
-0.6474363, -1.305857, -3.39232, 0.4039216, 1, 0, 1,
-0.6343988, 1.577315, 0.9031154, 0.3960784, 1, 0, 1,
-0.6293445, -0.4255623, -3.451162, 0.3921569, 1, 0, 1,
-0.6197501, -0.2929627, -2.03731, 0.3843137, 1, 0, 1,
-0.6151826, -0.311388, -1.408287, 0.3803922, 1, 0, 1,
-0.6052513, 0.3490526, -1.44528, 0.372549, 1, 0, 1,
-0.6049298, -1.32233, -2.699642, 0.3686275, 1, 0, 1,
-0.595322, 1.079538, -2.078849, 0.3607843, 1, 0, 1,
-0.5928239, 0.236982, -0.8584127, 0.3568628, 1, 0, 1,
-0.5910065, 0.2959198, -2.54853, 0.3490196, 1, 0, 1,
-0.5905405, -0.9438968, -4.108337, 0.345098, 1, 0, 1,
-0.5890276, 0.3352093, -0.1883922, 0.3372549, 1, 0, 1,
-0.5885198, 1.344661, -1.039225, 0.3333333, 1, 0, 1,
-0.5884535, 0.03049721, -2.212326, 0.3254902, 1, 0, 1,
-0.5876312, -0.384026, -2.077433, 0.3215686, 1, 0, 1,
-0.5836833, -0.6215522, -1.31521, 0.3137255, 1, 0, 1,
-0.5831056, 2.205146, -3.327191, 0.3098039, 1, 0, 1,
-0.5822514, 1.049998, 0.8502695, 0.3019608, 1, 0, 1,
-0.5817684, 0.2065228, -2.047287, 0.2941177, 1, 0, 1,
-0.5816245, -0.2944216, -3.600604, 0.2901961, 1, 0, 1,
-0.5808334, -2.596107, -3.935573, 0.282353, 1, 0, 1,
-0.5799906, -0.1078381, -3.312383, 0.2784314, 1, 0, 1,
-0.5789657, -2.11677, -1.759182, 0.2705882, 1, 0, 1,
-0.5788259, 0.4715268, -0.1151519, 0.2666667, 1, 0, 1,
-0.5783237, -0.2198358, -0.8844987, 0.2588235, 1, 0, 1,
-0.576496, 3.286954, 0.1186415, 0.254902, 1, 0, 1,
-0.5729683, 0.4086966, -1.16251, 0.2470588, 1, 0, 1,
-0.5723301, 1.193656, 0.1103475, 0.2431373, 1, 0, 1,
-0.5701842, -0.9624048, -2.684397, 0.2352941, 1, 0, 1,
-0.5693879, -0.5930507, -1.07248, 0.2313726, 1, 0, 1,
-0.5689531, -0.7796613, -1.968575, 0.2235294, 1, 0, 1,
-0.5676843, 0.8128942, 1.428995, 0.2196078, 1, 0, 1,
-0.5662909, -0.06216388, -1.212534, 0.2117647, 1, 0, 1,
-0.5661946, -0.06367044, -1.323904, 0.2078431, 1, 0, 1,
-0.5661761, 1.016163, -0.294379, 0.2, 1, 0, 1,
-0.5621219, -0.6756496, -2.270647, 0.1921569, 1, 0, 1,
-0.5588735, 1.565762, -0.6523882, 0.1882353, 1, 0, 1,
-0.5536159, 0.134952, -0.7972461, 0.1803922, 1, 0, 1,
-0.552089, 0.9716904, -0.951428, 0.1764706, 1, 0, 1,
-0.5512245, 0.2072735, -1.279013, 0.1686275, 1, 0, 1,
-0.5508919, 0.2211677, -2.175518, 0.1647059, 1, 0, 1,
-0.543848, -0.657736, -4.888667, 0.1568628, 1, 0, 1,
-0.5397148, -0.5722994, -1.556232, 0.1529412, 1, 0, 1,
-0.5387287, -1.866119, -3.708579, 0.145098, 1, 0, 1,
-0.535723, 0.05094662, -1.353933, 0.1411765, 1, 0, 1,
-0.5350675, -0.1877413, -2.141816, 0.1333333, 1, 0, 1,
-0.5291111, -0.7466583, -3.842817, 0.1294118, 1, 0, 1,
-0.5260233, 0.3009528, 0.7408034, 0.1215686, 1, 0, 1,
-0.5244199, -1.987503, -4.360222, 0.1176471, 1, 0, 1,
-0.5199847, -0.542017, -3.086161, 0.1098039, 1, 0, 1,
-0.5095394, -0.1998387, -1.278922, 0.1058824, 1, 0, 1,
-0.5062427, 0.6952257, -1.172688, 0.09803922, 1, 0, 1,
-0.5039981, 1.12484, 0.9209378, 0.09019608, 1, 0, 1,
-0.5034302, 0.7101609, -3.111713, 0.08627451, 1, 0, 1,
-0.5030714, 0.9108049, 0.8399487, 0.07843138, 1, 0, 1,
-0.5030019, -0.008376362, -0.8014156, 0.07450981, 1, 0, 1,
-0.5008491, -0.2992083, -2.222902, 0.06666667, 1, 0, 1,
-0.5003805, 0.04156504, -2.129444, 0.0627451, 1, 0, 1,
-0.4971519, -1.205018, -3.117648, 0.05490196, 1, 0, 1,
-0.4949394, 0.1092135, -2.466691, 0.05098039, 1, 0, 1,
-0.4926928, 0.3420656, 0.0984132, 0.04313726, 1, 0, 1,
-0.4846756, -1.15008, -1.895599, 0.03921569, 1, 0, 1,
-0.4845759, -0.5425613, -2.828093, 0.03137255, 1, 0, 1,
-0.4802893, 1.995904, 0.5272707, 0.02745098, 1, 0, 1,
-0.4754748, 0.1771714, -0.3943869, 0.01960784, 1, 0, 1,
-0.4670485, -0.04977355, -0.8878576, 0.01568628, 1, 0, 1,
-0.4665689, 1.377708, -0.8747211, 0.007843138, 1, 0, 1,
-0.4664221, -0.891119, -2.955305, 0.003921569, 1, 0, 1,
-0.4637419, 1.121202, 0.4663863, 0, 1, 0.003921569, 1,
-0.4595271, -0.6813737, -3.182616, 0, 1, 0.01176471, 1,
-0.4587958, -1.13579, -1.785996, 0, 1, 0.01568628, 1,
-0.4523334, -0.5049888, -4.23928, 0, 1, 0.02352941, 1,
-0.4452039, -0.75151, -1.628789, 0, 1, 0.02745098, 1,
-0.4448949, -0.2482991, -0.5399054, 0, 1, 0.03529412, 1,
-0.4409257, 0.2691025, -1.844295, 0, 1, 0.03921569, 1,
-0.4344704, -0.1249525, -0.6668577, 0, 1, 0.04705882, 1,
-0.4342826, 0.1525831, -2.836246, 0, 1, 0.05098039, 1,
-0.4294079, 1.385337, 0.4959572, 0, 1, 0.05882353, 1,
-0.4165401, 1.170718, 0.1783473, 0, 1, 0.0627451, 1,
-0.4149644, -0.4290312, -1.558931, 0, 1, 0.07058824, 1,
-0.4076852, 2.796149, 0.03211656, 0, 1, 0.07450981, 1,
-0.407173, -0.08405667, 0.5300507, 0, 1, 0.08235294, 1,
-0.4044522, 0.5553093, -0.4435189, 0, 1, 0.08627451, 1,
-0.3993854, 1.168136, -2.005535, 0, 1, 0.09411765, 1,
-0.3984361, 2.15323, -0.2820276, 0, 1, 0.1019608, 1,
-0.3978112, 0.4155235, -0.4014181, 0, 1, 0.1058824, 1,
-0.3973781, 0.01008278, -1.320137, 0, 1, 0.1137255, 1,
-0.3967993, -0.1719617, -1.278695, 0, 1, 0.1176471, 1,
-0.3923553, 1.438887, 0.7331272, 0, 1, 0.1254902, 1,
-0.3893909, 2.104789, 1.025868, 0, 1, 0.1294118, 1,
-0.3874254, -0.5372989, -4.496928, 0, 1, 0.1372549, 1,
-0.3848059, -0.222256, -3.860495, 0, 1, 0.1411765, 1,
-0.3677331, 0.5616588, -0.01003455, 0, 1, 0.1490196, 1,
-0.3670552, 0.1847359, 0.09103759, 0, 1, 0.1529412, 1,
-0.3574476, -0.9790818, -3.216837, 0, 1, 0.1607843, 1,
-0.3534003, 0.4383374, 0.05841082, 0, 1, 0.1647059, 1,
-0.3533349, -0.8092553, -2.253857, 0, 1, 0.172549, 1,
-0.3497277, 0.1093058, -1.77307, 0, 1, 0.1764706, 1,
-0.3446248, -1.117596, -3.518384, 0, 1, 0.1843137, 1,
-0.3427346, 1.237, 0.6768571, 0, 1, 0.1882353, 1,
-0.3425494, 0.04758077, -0.2152222, 0, 1, 0.1960784, 1,
-0.3344063, -2.135162, -2.68657, 0, 1, 0.2039216, 1,
-0.3312213, 0.6509151, -0.2959876, 0, 1, 0.2078431, 1,
-0.3249291, -1.589173, -1.334193, 0, 1, 0.2156863, 1,
-0.3244511, -1.522798, -4.248695, 0, 1, 0.2196078, 1,
-0.3236428, 0.6423436, -0.8607531, 0, 1, 0.227451, 1,
-0.3231265, -1.275665, -1.993184, 0, 1, 0.2313726, 1,
-0.3231216, -1.171237, -2.303973, 0, 1, 0.2392157, 1,
-0.3212485, 1.165372, 0.7318199, 0, 1, 0.2431373, 1,
-0.3146566, 1.192477, 0.2131228, 0, 1, 0.2509804, 1,
-0.3142856, 3.543595, 0.6555061, 0, 1, 0.254902, 1,
-0.3111825, 2.754097, -0.7564173, 0, 1, 0.2627451, 1,
-0.3108901, 0.8514413, 0.2639748, 0, 1, 0.2666667, 1,
-0.3085387, -1.273883, -2.992539, 0, 1, 0.2745098, 1,
-0.3058982, 0.4429, -0.9804304, 0, 1, 0.2784314, 1,
-0.3025056, 0.05170919, -0.5617974, 0, 1, 0.2862745, 1,
-0.2982387, -0.9690395, -4.482552, 0, 1, 0.2901961, 1,
-0.2977433, 0.9304104, -0.6935958, 0, 1, 0.2980392, 1,
-0.2951797, -0.1468994, -2.312956, 0, 1, 0.3058824, 1,
-0.2823492, 1.551042, 1.733078, 0, 1, 0.3098039, 1,
-0.2806986, -0.1938213, -1.245616, 0, 1, 0.3176471, 1,
-0.2762806, 0.295514, -0.475639, 0, 1, 0.3215686, 1,
-0.275332, -0.338169, -1.742573, 0, 1, 0.3294118, 1,
-0.2720881, 0.1805665, 0.2362587, 0, 1, 0.3333333, 1,
-0.2620239, 1.112992, 0.2845621, 0, 1, 0.3411765, 1,
-0.2614176, 0.8325731, 0.6271082, 0, 1, 0.345098, 1,
-0.2581992, -1.776977, -3.131462, 0, 1, 0.3529412, 1,
-0.2554446, -0.1312354, -1.806377, 0, 1, 0.3568628, 1,
-0.254211, -0.7724687, -3.605939, 0, 1, 0.3647059, 1,
-0.2535916, 1.179227, -0.7358841, 0, 1, 0.3686275, 1,
-0.2362944, 0.488441, 0.1103462, 0, 1, 0.3764706, 1,
-0.2348903, 0.6832077, -0.03656836, 0, 1, 0.3803922, 1,
-0.231696, -0.7831435, -2.020066, 0, 1, 0.3882353, 1,
-0.2296228, -1.853051, -2.406049, 0, 1, 0.3921569, 1,
-0.2285876, -0.3601796, -1.556254, 0, 1, 0.4, 1,
-0.2254444, -1.157005, -4.701301, 0, 1, 0.4078431, 1,
-0.2241477, 0.647657, 0.03318894, 0, 1, 0.4117647, 1,
-0.2177151, -0.1969251, -2.562954, 0, 1, 0.4196078, 1,
-0.2137132, -0.339257, -2.602427, 0, 1, 0.4235294, 1,
-0.2132351, -0.5011299, -2.223399, 0, 1, 0.4313726, 1,
-0.2128375, 1.081428, -0.5803221, 0, 1, 0.4352941, 1,
-0.2116549, -0.8771828, -3.553149, 0, 1, 0.4431373, 1,
-0.2112411, -0.4863419, -3.22676, 0, 1, 0.4470588, 1,
-0.2058659, 1.019065, -1.672523, 0, 1, 0.454902, 1,
-0.2052119, 0.5640855, 0.4268852, 0, 1, 0.4588235, 1,
-0.2044801, 0.1664443, -1.373483, 0, 1, 0.4666667, 1,
-0.2031005, 1.226859, 1.118736, 0, 1, 0.4705882, 1,
-0.2003543, 0.8778206, -0.7312946, 0, 1, 0.4784314, 1,
-0.2001189, 1.662596, -0.5380338, 0, 1, 0.4823529, 1,
-0.197728, -0.06907403, -2.11159, 0, 1, 0.4901961, 1,
-0.197475, 1.00212, 0.4348336, 0, 1, 0.4941176, 1,
-0.1898531, -0.7992885, -2.847805, 0, 1, 0.5019608, 1,
-0.1894394, 0.5781096, -0.9957319, 0, 1, 0.509804, 1,
-0.1877081, 0.07454488, -3.608459, 0, 1, 0.5137255, 1,
-0.1826042, 0.2802612, -0.4689503, 0, 1, 0.5215687, 1,
-0.1783429, 1.666481, -2.939659, 0, 1, 0.5254902, 1,
-0.1774195, -0.7385439, -2.982753, 0, 1, 0.5333334, 1,
-0.1728049, 0.4036337, 0.5516976, 0, 1, 0.5372549, 1,
-0.1718769, -0.9232575, -3.683848, 0, 1, 0.5450981, 1,
-0.1717639, 1.75189, 0.5928291, 0, 1, 0.5490196, 1,
-0.1686471, -0.7316576, -3.225895, 0, 1, 0.5568628, 1,
-0.1621446, -2.149113, -4.531, 0, 1, 0.5607843, 1,
-0.1615319, -1.114194, -2.0927, 0, 1, 0.5686275, 1,
-0.1569573, 0.3269887, -0.9939575, 0, 1, 0.572549, 1,
-0.1567445, -1.275874, -3.566339, 0, 1, 0.5803922, 1,
-0.1561639, 0.2838722, -1.107652, 0, 1, 0.5843138, 1,
-0.1560017, -0.05025071, -3.048748, 0, 1, 0.5921569, 1,
-0.1552836, 0.9905719, 0.5484652, 0, 1, 0.5960785, 1,
-0.1552417, 0.5003785, -1.543232, 0, 1, 0.6039216, 1,
-0.1485975, -0.2844559, -2.886502, 0, 1, 0.6117647, 1,
-0.147455, -0.8274263, -1.881701, 0, 1, 0.6156863, 1,
-0.1462822, -2.024553, -2.849262, 0, 1, 0.6235294, 1,
-0.1410533, -0.1340496, -0.3174222, 0, 1, 0.627451, 1,
-0.1400245, -0.9456604, -2.180173, 0, 1, 0.6352941, 1,
-0.1338775, -0.4854413, -3.347363, 0, 1, 0.6392157, 1,
-0.1318006, 0.64851, -0.9937422, 0, 1, 0.6470588, 1,
-0.1311646, 0.2324762, -0.2079282, 0, 1, 0.6509804, 1,
-0.129884, 0.5734496, -0.8646264, 0, 1, 0.6588235, 1,
-0.1269069, -0.7207865, -2.24007, 0, 1, 0.6627451, 1,
-0.1233773, 0.8797258, 0.2393145, 0, 1, 0.6705883, 1,
-0.1229421, 0.8166223, -0.3056937, 0, 1, 0.6745098, 1,
-0.1161266, 0.9253419, 1.402181, 0, 1, 0.682353, 1,
-0.1159359, -0.8468766, -2.812842, 0, 1, 0.6862745, 1,
-0.1100679, 0.1748487, -0.7424525, 0, 1, 0.6941177, 1,
-0.1085223, -0.7704895, -0.934652, 0, 1, 0.7019608, 1,
-0.1070898, 0.6848642, 1.022195, 0, 1, 0.7058824, 1,
-0.106055, -0.2497833, -2.947557, 0, 1, 0.7137255, 1,
-0.1054387, -1.370105, -4.883133, 0, 1, 0.7176471, 1,
-0.09662089, -0.532776, -2.473005, 0, 1, 0.7254902, 1,
-0.09062912, -0.2762745, -2.20248, 0, 1, 0.7294118, 1,
-0.08193892, -0.6064804, -4.55862, 0, 1, 0.7372549, 1,
-0.08031646, 2.054383, -0.1613245, 0, 1, 0.7411765, 1,
-0.07802942, 1.101419, 0.146425, 0, 1, 0.7490196, 1,
-0.07739754, 0.6133646, 0.4241141, 0, 1, 0.7529412, 1,
-0.07733208, -0.2166231, -1.202731, 0, 1, 0.7607843, 1,
-0.07382894, -0.405254, -0.8115553, 0, 1, 0.7647059, 1,
-0.07360373, -0.2623222, -2.694826, 0, 1, 0.772549, 1,
-0.06670579, -0.6354271, -4.966872, 0, 1, 0.7764706, 1,
-0.06482767, 0.5536976, 2.02357, 0, 1, 0.7843137, 1,
-0.06411231, -0.25535, -2.151061, 0, 1, 0.7882353, 1,
-0.06392762, 1.623201, 0.2908774, 0, 1, 0.7960784, 1,
-0.06223947, 0.8009546, -0.01350732, 0, 1, 0.8039216, 1,
-0.06222959, 0.2288992, 0.2444579, 0, 1, 0.8078431, 1,
-0.06142028, -0.9636119, -2.389301, 0, 1, 0.8156863, 1,
-0.06067457, -0.1789915, -3.170506, 0, 1, 0.8196079, 1,
-0.05824764, -0.5896212, -3.151969, 0, 1, 0.827451, 1,
-0.05504335, -0.4841491, -3.771352, 0, 1, 0.8313726, 1,
-0.05311847, -0.03452386, -2.557353, 0, 1, 0.8392157, 1,
-0.04939575, 0.9388155, -0.5706443, 0, 1, 0.8431373, 1,
-0.04825006, -1.820856, -4.82756, 0, 1, 0.8509804, 1,
-0.04216071, -0.7919086, -4.92639, 0, 1, 0.854902, 1,
-0.03972156, 0.3757218, -1.227265, 0, 1, 0.8627451, 1,
-0.03453356, -1.403283, -1.070493, 0, 1, 0.8666667, 1,
-0.03439285, -0.9513507, -4.247943, 0, 1, 0.8745098, 1,
-0.03300078, -0.6858337, -2.618076, 0, 1, 0.8784314, 1,
-0.02996684, 0.4067489, -0.7177576, 0, 1, 0.8862745, 1,
-0.027242, 0.06880848, -2.016735, 0, 1, 0.8901961, 1,
-0.02585341, -0.1617491, -2.050127, 0, 1, 0.8980392, 1,
-0.02128505, -1.440007, -5.250705, 0, 1, 0.9058824, 1,
-0.02005754, -2.187048, -4.115053, 0, 1, 0.9098039, 1,
-0.01144412, -1.988178, -2.463524, 0, 1, 0.9176471, 1,
-0.01002849, -1.268077, -2.11632, 0, 1, 0.9215686, 1,
-0.005359792, 0.4352067, 0.4379474, 0, 1, 0.9294118, 1,
-0.004109043, 1.675644, -0.1623814, 0, 1, 0.9333333, 1,
-0.002072472, -1.796914, -3.019845, 0, 1, 0.9411765, 1,
-0.001982884, 1.184813, 0.2293181, 0, 1, 0.945098, 1,
0.004925655, 1.721238, -0.2426479, 0, 1, 0.9529412, 1,
0.009705575, -0.1062343, 3.279314, 0, 1, 0.9568627, 1,
0.011333, 0.194082, 0.04722143, 0, 1, 0.9647059, 1,
0.01331264, 1.11312, -0.568225, 0, 1, 0.9686275, 1,
0.01433412, 1.025006, -0.1381517, 0, 1, 0.9764706, 1,
0.01578844, 1.008191, -1.681407, 0, 1, 0.9803922, 1,
0.01674169, 0.6969709, 0.7920982, 0, 1, 0.9882353, 1,
0.01694944, -0.7915858, 1.444998, 0, 1, 0.9921569, 1,
0.02050881, -1.224518, 5.225848, 0, 1, 1, 1,
0.02075847, 1.07903, 0.1966793, 0, 0.9921569, 1, 1,
0.02393849, -0.264342, 4.555616, 0, 0.9882353, 1, 1,
0.02571675, -1.097771, 3.659882, 0, 0.9803922, 1, 1,
0.02997734, -1.466699, 2.078884, 0, 0.9764706, 1, 1,
0.0301071, -0.5681118, 3.024238, 0, 0.9686275, 1, 1,
0.03223494, 1.342348, 1.510053, 0, 0.9647059, 1, 1,
0.03266272, 0.4124022, 0.814391, 0, 0.9568627, 1, 1,
0.04377936, -0.7579303, 3.666288, 0, 0.9529412, 1, 1,
0.04554668, -2.068619, 2.755648, 0, 0.945098, 1, 1,
0.04763445, -0.4273685, 2.319781, 0, 0.9411765, 1, 1,
0.048138, 1.765305, 0.2853269, 0, 0.9333333, 1, 1,
0.04878569, -0.01753644, 1.163631, 0, 0.9294118, 1, 1,
0.04986756, 1.686795, -0.7477026, 0, 0.9215686, 1, 1,
0.05012652, 0.9668286, 1.13756, 0, 0.9176471, 1, 1,
0.05036442, 0.5022862, -1.198997, 0, 0.9098039, 1, 1,
0.05316626, 0.1890167, 1.698946, 0, 0.9058824, 1, 1,
0.05359806, 1.953878, -0.7152221, 0, 0.8980392, 1, 1,
0.0553006, 0.6443571, 0.3019793, 0, 0.8901961, 1, 1,
0.0573527, -0.9276686, 2.343237, 0, 0.8862745, 1, 1,
0.06153482, 0.05873122, 0.634247, 0, 0.8784314, 1, 1,
0.06210592, 0.7832065, 0.6975567, 0, 0.8745098, 1, 1,
0.06424433, -0.4588626, 2.765351, 0, 0.8666667, 1, 1,
0.06781477, 0.8135445, -0.2671536, 0, 0.8627451, 1, 1,
0.06904126, -0.07659266, 1.366724, 0, 0.854902, 1, 1,
0.07047747, 0.9411687, 0.955377, 0, 0.8509804, 1, 1,
0.07407453, -0.9003016, 4.567824, 0, 0.8431373, 1, 1,
0.07476287, -0.9177874, 2.949196, 0, 0.8392157, 1, 1,
0.0777548, 1.016352, -0.7772629, 0, 0.8313726, 1, 1,
0.07967321, -1.418661, 1.342124, 0, 0.827451, 1, 1,
0.08555741, -0.970858, 1.673298, 0, 0.8196079, 1, 1,
0.08674055, 1.370445, 0.1317996, 0, 0.8156863, 1, 1,
0.08872101, 0.6506088, 0.2932748, 0, 0.8078431, 1, 1,
0.09041061, 0.4242632, 0.0352246, 0, 0.8039216, 1, 1,
0.09123863, 1.168542, 1.880342, 0, 0.7960784, 1, 1,
0.09127554, 0.08430571, -0.708106, 0, 0.7882353, 1, 1,
0.09238005, -2.245017, 2.591463, 0, 0.7843137, 1, 1,
0.09620025, 0.444723, 0.1220377, 0, 0.7764706, 1, 1,
0.09720963, -2.15124, 2.927568, 0, 0.772549, 1, 1,
0.1003086, -0.4251488, 1.080701, 0, 0.7647059, 1, 1,
0.100666, 1.590786, 1.124676, 0, 0.7607843, 1, 1,
0.1021195, 0.5579001, -1.043579, 0, 0.7529412, 1, 1,
0.1049309, 0.3977058, -1.341952, 0, 0.7490196, 1, 1,
0.1053845, -0.5484772, 1.785163, 0, 0.7411765, 1, 1,
0.1075061, -0.0362126, 1.288127, 0, 0.7372549, 1, 1,
0.1081972, 0.1142442, 0.06579088, 0, 0.7294118, 1, 1,
0.1137418, 0.8447315, -0.1883551, 0, 0.7254902, 1, 1,
0.1146205, 0.3707119, 0.8090485, 0, 0.7176471, 1, 1,
0.1225337, 2.038785, -1.446793, 0, 0.7137255, 1, 1,
0.1239046, -0.9284011, 6.571666, 0, 0.7058824, 1, 1,
0.1240213, 0.4878117, -0.4787163, 0, 0.6980392, 1, 1,
0.1249194, -0.008954561, 0.4117783, 0, 0.6941177, 1, 1,
0.1264738, -0.3345802, 3.953939, 0, 0.6862745, 1, 1,
0.13153, 0.9842356, 0.3026063, 0, 0.682353, 1, 1,
0.1337072, -0.7946937, 2.512448, 0, 0.6745098, 1, 1,
0.1361127, -1.017736, 2.90433, 0, 0.6705883, 1, 1,
0.1378833, -0.02548025, -0.1239825, 0, 0.6627451, 1, 1,
0.1393023, 0.2998799, -0.9659744, 0, 0.6588235, 1, 1,
0.1416692, 1.189211, 0.06486032, 0, 0.6509804, 1, 1,
0.1418585, 0.1068954, 1.074124, 0, 0.6470588, 1, 1,
0.1418638, 1.834046, -0.9796801, 0, 0.6392157, 1, 1,
0.1455934, 0.1028366, 2.071625, 0, 0.6352941, 1, 1,
0.1497351, -0.752607, 1.866304, 0, 0.627451, 1, 1,
0.1503618, -0.4639205, 3.702734, 0, 0.6235294, 1, 1,
0.1512354, 0.2095845, 1.350074, 0, 0.6156863, 1, 1,
0.1528901, -0.3627844, 2.141749, 0, 0.6117647, 1, 1,
0.1536945, -1.358076, 3.041587, 0, 0.6039216, 1, 1,
0.154687, -1.231167, 3.93406, 0, 0.5960785, 1, 1,
0.1559541, 1.590339, 1.550508, 0, 0.5921569, 1, 1,
0.1608736, -1.158649, 3.206412, 0, 0.5843138, 1, 1,
0.165413, 1.19232, 1.052567, 0, 0.5803922, 1, 1,
0.1680174, 0.6892331, 1.719515, 0, 0.572549, 1, 1,
0.1696883, 1.102812, -1.110556, 0, 0.5686275, 1, 1,
0.1699409, 2.404917, -0.2283212, 0, 0.5607843, 1, 1,
0.1699895, 0.7050631, -0.1890323, 0, 0.5568628, 1, 1,
0.1754588, -1.302153, 3.668603, 0, 0.5490196, 1, 1,
0.1765468, -1.237399, 2.616482, 0, 0.5450981, 1, 1,
0.178412, 0.5684096, 0.4218503, 0, 0.5372549, 1, 1,
0.1817965, 0.1901861, 0.5486721, 0, 0.5333334, 1, 1,
0.1865145, -0.5421863, 1.664801, 0, 0.5254902, 1, 1,
0.1924131, -1.501713, 1.580451, 0, 0.5215687, 1, 1,
0.1940278, -0.2863502, 1.456571, 0, 0.5137255, 1, 1,
0.1943908, -0.3565139, 2.674205, 0, 0.509804, 1, 1,
0.201811, -0.7199074, 4.81047, 0, 0.5019608, 1, 1,
0.2057358, -2.784713, 3.7997, 0, 0.4941176, 1, 1,
0.2116282, -0.6800083, 2.18911, 0, 0.4901961, 1, 1,
0.2135962, -0.720631, 3.521786, 0, 0.4823529, 1, 1,
0.2139537, -1.094565, 2.892945, 0, 0.4784314, 1, 1,
0.2139548, -0.5450636, 1.445527, 0, 0.4705882, 1, 1,
0.2147529, 0.4203849, 0.02314949, 0, 0.4666667, 1, 1,
0.2177814, -0.4326828, -0.515968, 0, 0.4588235, 1, 1,
0.2180829, 2.043511, 0.8272593, 0, 0.454902, 1, 1,
0.2247855, 1.02103, 0.3998504, 0, 0.4470588, 1, 1,
0.2258703, 1.589704, 1.706951, 0, 0.4431373, 1, 1,
0.2273162, -0.6846399, 3.377984, 0, 0.4352941, 1, 1,
0.2281746, -0.3002491, 3.085795, 0, 0.4313726, 1, 1,
0.2383612, -0.4085766, 2.892634, 0, 0.4235294, 1, 1,
0.2409536, -0.5081483, 3.41035, 0, 0.4196078, 1, 1,
0.2417018, 0.1227054, 0.3663746, 0, 0.4117647, 1, 1,
0.2430891, 0.2117772, -1.082887, 0, 0.4078431, 1, 1,
0.2447838, 0.06073222, 1.670245, 0, 0.4, 1, 1,
0.2457479, 2.56785, 0.6299853, 0, 0.3921569, 1, 1,
0.249695, -0.1965338, 0.1159794, 0, 0.3882353, 1, 1,
0.251446, 1.287281, -1.291887, 0, 0.3803922, 1, 1,
0.2538495, -0.8281764, 1.958311, 0, 0.3764706, 1, 1,
0.2571388, -1.119128, 3.133513, 0, 0.3686275, 1, 1,
0.2573654, 0.4435284, -0.3959421, 0, 0.3647059, 1, 1,
0.2581761, -0.3332809, 2.310008, 0, 0.3568628, 1, 1,
0.2586718, 0.5640592, 0.1678739, 0, 0.3529412, 1, 1,
0.2660246, 1.364875, 0.387143, 0, 0.345098, 1, 1,
0.2678157, -0.8468178, 3.959532, 0, 0.3411765, 1, 1,
0.2694202, -1.399477, 3.323465, 0, 0.3333333, 1, 1,
0.2740873, 0.8356443, 1.524088, 0, 0.3294118, 1, 1,
0.2749052, -0.1759297, 2.413721, 0, 0.3215686, 1, 1,
0.2762769, -1.110424, 2.99809, 0, 0.3176471, 1, 1,
0.2843571, -0.6484622, 5.330281, 0, 0.3098039, 1, 1,
0.2883016, 0.7679355, 0.9912726, 0, 0.3058824, 1, 1,
0.289295, 1.065551, 0.8300275, 0, 0.2980392, 1, 1,
0.2924662, -0.8068134, 3.875593, 0, 0.2901961, 1, 1,
0.2944162, 0.8728994, -0.4182125, 0, 0.2862745, 1, 1,
0.2954301, 0.72493, 0.3841836, 0, 0.2784314, 1, 1,
0.2958182, -1.388119, 3.730002, 0, 0.2745098, 1, 1,
0.2964029, -0.9482025, 4.51694, 0, 0.2666667, 1, 1,
0.2994913, -0.9164292, 2.262401, 0, 0.2627451, 1, 1,
0.3012585, -0.3612721, 2.04131, 0, 0.254902, 1, 1,
0.3124538, 0.2714116, 1.812109, 0, 0.2509804, 1, 1,
0.3168294, -0.6974131, 3.073485, 0, 0.2431373, 1, 1,
0.3179436, 0.8623173, 0.8149117, 0, 0.2392157, 1, 1,
0.3189503, 0.6170883, 1.571642, 0, 0.2313726, 1, 1,
0.3195013, 0.23025, 1.062486, 0, 0.227451, 1, 1,
0.3237171, 1.04374, 1.867128, 0, 0.2196078, 1, 1,
0.3245183, 0.2366685, 0.6289217, 0, 0.2156863, 1, 1,
0.3285142, -0.612202, 0.5676001, 0, 0.2078431, 1, 1,
0.3307801, 0.7116669, 1.848426, 0, 0.2039216, 1, 1,
0.3336662, 1.374419, 1.360447, 0, 0.1960784, 1, 1,
0.3352709, -0.2095271, 4.042197, 0, 0.1882353, 1, 1,
0.3494572, -1.712204, 2.266848, 0, 0.1843137, 1, 1,
0.3516769, 0.09752341, 1.936504, 0, 0.1764706, 1, 1,
0.3563288, 0.2666674, 1.298346, 0, 0.172549, 1, 1,
0.3578866, -0.2056387, 2.069276, 0, 0.1647059, 1, 1,
0.3657959, -0.7481781, 1.999402, 0, 0.1607843, 1, 1,
0.3684217, 0.2195937, -0.2958647, 0, 0.1529412, 1, 1,
0.3688221, -0.9134796, 4.463377, 0, 0.1490196, 1, 1,
0.3690317, 1.181847, 1.250723, 0, 0.1411765, 1, 1,
0.3690803, 0.001514529, 1.267179, 0, 0.1372549, 1, 1,
0.3695852, -1.717061, 2.830504, 0, 0.1294118, 1, 1,
0.3705518, 0.8984039, -0.3374678, 0, 0.1254902, 1, 1,
0.3761521, 0.9879931, 1.512044, 0, 0.1176471, 1, 1,
0.3772922, 0.04541791, 2.251222, 0, 0.1137255, 1, 1,
0.3825141, 0.5136233, 1.050878, 0, 0.1058824, 1, 1,
0.3842917, -0.8256059, 3.181778, 0, 0.09803922, 1, 1,
0.3850497, 0.3426619, -0.9298007, 0, 0.09411765, 1, 1,
0.3855236, 1.502767, -0.1069048, 0, 0.08627451, 1, 1,
0.3862173, 0.4732621, 1.196266, 0, 0.08235294, 1, 1,
0.3872932, 0.3684308, 0.2924876, 0, 0.07450981, 1, 1,
0.3884251, -1.130345, 4.842711, 0, 0.07058824, 1, 1,
0.396953, -1.122713, 2.033473, 0, 0.0627451, 1, 1,
0.3981673, 0.9407178, -0.1762964, 0, 0.05882353, 1, 1,
0.400478, -0.5155292, 2.374382, 0, 0.05098039, 1, 1,
0.4011305, 0.7847793, 1.783556, 0, 0.04705882, 1, 1,
0.4012339, -0.6074305, 2.020656, 0, 0.03921569, 1, 1,
0.4040183, 0.1530734, 2.67341, 0, 0.03529412, 1, 1,
0.4052553, 0.1508496, 1.130518, 0, 0.02745098, 1, 1,
0.4071302, -1.162915, 1.098526, 0, 0.02352941, 1, 1,
0.4116724, -0.1925285, 0.4021602, 0, 0.01568628, 1, 1,
0.4120422, 0.8729281, -0.4769468, 0, 0.01176471, 1, 1,
0.4127017, -0.7749625, 3.002015, 0, 0.003921569, 1, 1,
0.4268352, -0.5125987, 0.6857421, 0.003921569, 0, 1, 1,
0.4303114, -0.05751153, 1.16426, 0.007843138, 0, 1, 1,
0.432184, -0.9465498, 1.43045, 0.01568628, 0, 1, 1,
0.4326533, 0.04653983, 1.675485, 0.01960784, 0, 1, 1,
0.433337, 0.7433794, -0.04082413, 0.02745098, 0, 1, 1,
0.4342609, -1.183814, 3.583677, 0.03137255, 0, 1, 1,
0.4382394, 0.002236587, 2.250256, 0.03921569, 0, 1, 1,
0.4385047, 1.832055, -0.4535445, 0.04313726, 0, 1, 1,
0.4412895, 0.7540922, 0.6613946, 0.05098039, 0, 1, 1,
0.442439, 1.619548, 0.6136928, 0.05490196, 0, 1, 1,
0.4469673, -0.3962524, 2.868726, 0.0627451, 0, 1, 1,
0.4478261, -1.164451, 3.584848, 0.06666667, 0, 1, 1,
0.449112, 0.8064585, 1.131428, 0.07450981, 0, 1, 1,
0.4524617, 1.792197, 0.3006294, 0.07843138, 0, 1, 1,
0.4560772, 1.684223, -1.696593, 0.08627451, 0, 1, 1,
0.4565622, -0.6070765, 1.702233, 0.09019608, 0, 1, 1,
0.4698134, -1.001026, 3.71194, 0.09803922, 0, 1, 1,
0.4727958, -1.891009, 2.83973, 0.1058824, 0, 1, 1,
0.4748099, 1.429837, 0.4159861, 0.1098039, 0, 1, 1,
0.4752371, 1.166695, 0.4373153, 0.1176471, 0, 1, 1,
0.4787682, -0.1755055, 1.39857, 0.1215686, 0, 1, 1,
0.481785, 0.1196104, 1.646551, 0.1294118, 0, 1, 1,
0.4867177, 1.810164, 0.3048954, 0.1333333, 0, 1, 1,
0.4874301, 0.005812509, 0.9949232, 0.1411765, 0, 1, 1,
0.4899247, -1.401996, 1.678634, 0.145098, 0, 1, 1,
0.4901067, -1.473354, 2.857351, 0.1529412, 0, 1, 1,
0.4914646, 0.8255112, -1.492503, 0.1568628, 0, 1, 1,
0.4935232, -0.590625, 4.23315, 0.1647059, 0, 1, 1,
0.4947848, 1.297348, -0.1267108, 0.1686275, 0, 1, 1,
0.500325, -1.476424, 2.395828, 0.1764706, 0, 1, 1,
0.511269, -0.7532673, 1.575925, 0.1803922, 0, 1, 1,
0.5133496, 0.07303932, 1.802028, 0.1882353, 0, 1, 1,
0.5140973, -0.03240104, -1.088257, 0.1921569, 0, 1, 1,
0.5152967, -0.4940387, 4.5778, 0.2, 0, 1, 1,
0.5165495, 0.1790123, 0.2992294, 0.2078431, 0, 1, 1,
0.5231966, -0.3740609, 0.8982182, 0.2117647, 0, 1, 1,
0.5249258, -0.4839603, 2.1338, 0.2196078, 0, 1, 1,
0.5251037, 0.2045903, 0.4396899, 0.2235294, 0, 1, 1,
0.5290038, -1.015852, 1.636102, 0.2313726, 0, 1, 1,
0.5322599, 0.3370747, 1.959421, 0.2352941, 0, 1, 1,
0.5323655, 0.03061355, 1.145331, 0.2431373, 0, 1, 1,
0.5396553, -1.141426, 1.451097, 0.2470588, 0, 1, 1,
0.5405639, -1.22968, 1.592357, 0.254902, 0, 1, 1,
0.5417842, 1.600204, 0.5794059, 0.2588235, 0, 1, 1,
0.5450771, -0.8111334, 3.372249, 0.2666667, 0, 1, 1,
0.5522646, -0.5836913, 1.805973, 0.2705882, 0, 1, 1,
0.5522975, -1.149839, 3.694727, 0.2784314, 0, 1, 1,
0.5565742, -0.05367511, 3.363006, 0.282353, 0, 1, 1,
0.5598905, 0.1514556, 2.321959, 0.2901961, 0, 1, 1,
0.5676468, 0.9891371, -1.489893, 0.2941177, 0, 1, 1,
0.5699061, -0.8410401, 2.477635, 0.3019608, 0, 1, 1,
0.5710629, -0.3626208, 1.03064, 0.3098039, 0, 1, 1,
0.5765015, 0.9296421, 0.6158629, 0.3137255, 0, 1, 1,
0.5767379, 0.9520053, 0.34172, 0.3215686, 0, 1, 1,
0.5833635, 0.2674489, 0.5846443, 0.3254902, 0, 1, 1,
0.586353, 0.6259854, 1.100546, 0.3333333, 0, 1, 1,
0.5899242, 0.4246662, 3.34969, 0.3372549, 0, 1, 1,
0.5909647, -1.476244, 3.372856, 0.345098, 0, 1, 1,
0.5915033, 2.043884, 0.4507853, 0.3490196, 0, 1, 1,
0.5927175, -1.259867, 2.555508, 0.3568628, 0, 1, 1,
0.5939943, 1.151876, 0.0530997, 0.3607843, 0, 1, 1,
0.6024245, 0.6000295, 0.803499, 0.3686275, 0, 1, 1,
0.6024347, -0.9844559, 3.737058, 0.372549, 0, 1, 1,
0.6038786, 2.560369, 1.906105, 0.3803922, 0, 1, 1,
0.605902, 1.460581, 0.8716668, 0.3843137, 0, 1, 1,
0.6114889, -0.4184338, 1.798952, 0.3921569, 0, 1, 1,
0.6149698, -0.3308409, 1.623261, 0.3960784, 0, 1, 1,
0.6182009, -3.418276, 2.747929, 0.4039216, 0, 1, 1,
0.6206268, 0.5087344, 1.314258, 0.4117647, 0, 1, 1,
0.6232855, 0.480103, -0.01377009, 0.4156863, 0, 1, 1,
0.6268471, -0.9847081, 3.150554, 0.4235294, 0, 1, 1,
0.6318427, -0.5466917, 1.850855, 0.427451, 0, 1, 1,
0.6375933, -0.7649249, 2.898952, 0.4352941, 0, 1, 1,
0.637999, -0.8006827, 3.644857, 0.4392157, 0, 1, 1,
0.6458507, -0.9422577, 1.564932, 0.4470588, 0, 1, 1,
0.646884, -0.1295134, 1.301161, 0.4509804, 0, 1, 1,
0.6498246, -0.9860546, 3.448277, 0.4588235, 0, 1, 1,
0.6512505, -0.4948765, 1.842588, 0.4627451, 0, 1, 1,
0.6591505, 1.335882, 0.2112516, 0.4705882, 0, 1, 1,
0.6595622, 1.748343, -1.02661, 0.4745098, 0, 1, 1,
0.6669518, -0.5035189, 1.657035, 0.4823529, 0, 1, 1,
0.6733353, 1.873022, 1.383582, 0.4862745, 0, 1, 1,
0.6756757, -0.0650738, 0.03560746, 0.4941176, 0, 1, 1,
0.685441, 1.116057, 0.6960541, 0.5019608, 0, 1, 1,
0.688297, 0.201334, 1.378187, 0.5058824, 0, 1, 1,
0.6886984, 0.8488442, 0.7089786, 0.5137255, 0, 1, 1,
0.6888547, 1.471045, 0.2541317, 0.5176471, 0, 1, 1,
0.6894776, 0.4486619, 1.516726, 0.5254902, 0, 1, 1,
0.6898648, -0.4556762, 2.539956, 0.5294118, 0, 1, 1,
0.6901066, 0.4032057, -0.4314038, 0.5372549, 0, 1, 1,
0.691803, 0.3772029, 1.522541, 0.5411765, 0, 1, 1,
0.6924161, -1.003219, 0.6646162, 0.5490196, 0, 1, 1,
0.6935545, -0.2296289, 2.695251, 0.5529412, 0, 1, 1,
0.6974017, 0.08262782, 1.956585, 0.5607843, 0, 1, 1,
0.6998125, 0.9515226, -0.1511368, 0.5647059, 0, 1, 1,
0.7036691, 1.222563, 0.8959947, 0.572549, 0, 1, 1,
0.7057809, 1.53506, 0.02185937, 0.5764706, 0, 1, 1,
0.7091812, -0.1123996, 2.917761, 0.5843138, 0, 1, 1,
0.7102556, 0.3422822, 1.01254, 0.5882353, 0, 1, 1,
0.7111477, -0.2686481, 1.931055, 0.5960785, 0, 1, 1,
0.7204619, -0.6375403, 1.707509, 0.6039216, 0, 1, 1,
0.7270781, 0.4757091, 1.594802, 0.6078432, 0, 1, 1,
0.728609, 0.8226376, 0.4435345, 0.6156863, 0, 1, 1,
0.7288836, 1.354366, 0.3706873, 0.6196079, 0, 1, 1,
0.7294353, -1.14242, 1.966129, 0.627451, 0, 1, 1,
0.7409692, -0.7291503, 1.449636, 0.6313726, 0, 1, 1,
0.7427828, 1.163369, 0.1586336, 0.6392157, 0, 1, 1,
0.7447526, -0.2318287, 4.269673, 0.6431373, 0, 1, 1,
0.7452189, 1.459657, 0.3689345, 0.6509804, 0, 1, 1,
0.7461938, -0.0999456, 1.538639, 0.654902, 0, 1, 1,
0.746596, 0.3149203, 0.1177524, 0.6627451, 0, 1, 1,
0.7523286, 0.1017398, 1.815389, 0.6666667, 0, 1, 1,
0.7580862, 1.44129, 1.388708, 0.6745098, 0, 1, 1,
0.7702803, 1.958369, 0.2919124, 0.6784314, 0, 1, 1,
0.7773113, -0.1235177, 1.711767, 0.6862745, 0, 1, 1,
0.7776346, 0.2240193, 3.461615, 0.6901961, 0, 1, 1,
0.7788243, 0.1867046, 0.6678154, 0.6980392, 0, 1, 1,
0.7814471, 0.1589311, -0.09095582, 0.7058824, 0, 1, 1,
0.78764, 1.226846, -0.06676894, 0.7098039, 0, 1, 1,
0.7967181, 1.024466, 0.1656386, 0.7176471, 0, 1, 1,
0.7995574, 0.6032944, 2.202375, 0.7215686, 0, 1, 1,
0.8025746, 2.114448, 0.9556057, 0.7294118, 0, 1, 1,
0.8042014, 1.054383, 0.4749916, 0.7333333, 0, 1, 1,
0.8088076, -1.176866, 2.303345, 0.7411765, 0, 1, 1,
0.8133194, -0.7037739, 3.058437, 0.7450981, 0, 1, 1,
0.814694, -1.799893, 2.696598, 0.7529412, 0, 1, 1,
0.8167437, -2.512167, 2.612693, 0.7568628, 0, 1, 1,
0.8179449, 0.04261437, 1.374159, 0.7647059, 0, 1, 1,
0.8230506, -0.7439301, 3.005154, 0.7686275, 0, 1, 1,
0.8388318, 0.01903308, 1.217606, 0.7764706, 0, 1, 1,
0.8403131, 1.411892, -1.199903, 0.7803922, 0, 1, 1,
0.8408492, -1.235018, 2.549432, 0.7882353, 0, 1, 1,
0.8435, 0.1231816, 1.615077, 0.7921569, 0, 1, 1,
0.8536569, 1.491121, 0.354994, 0.8, 0, 1, 1,
0.8549533, 1.329274, -0.06878853, 0.8078431, 0, 1, 1,
0.8568122, 0.4395616, 1.585887, 0.8117647, 0, 1, 1,
0.8588591, 0.9821978, 1.946992, 0.8196079, 0, 1, 1,
0.8628469, 0.3557057, 1.049143, 0.8235294, 0, 1, 1,
0.8647994, -0.1097386, 2.153549, 0.8313726, 0, 1, 1,
0.8667743, -0.9975249, -0.1014519, 0.8352941, 0, 1, 1,
0.8824543, -0.6481195, 0.5894999, 0.8431373, 0, 1, 1,
0.8857511, -0.707225, 1.68028, 0.8470588, 0, 1, 1,
0.8959424, 0.1729365, 3.032858, 0.854902, 0, 1, 1,
0.8967147, 0.2828848, 0.1505684, 0.8588235, 0, 1, 1,
0.8976986, -0.1459018, -1.560515, 0.8666667, 0, 1, 1,
0.9016759, -0.51884, 1.155065, 0.8705882, 0, 1, 1,
0.9030904, -1.10532, 2.168314, 0.8784314, 0, 1, 1,
0.9070551, -1.606486, 2.014487, 0.8823529, 0, 1, 1,
0.9100624, 1.165012, 1.762761, 0.8901961, 0, 1, 1,
0.9112561, 1.382172, 0.4069621, 0.8941177, 0, 1, 1,
0.9119346, 1.679712, 1.718246, 0.9019608, 0, 1, 1,
0.9147188, -1.773338, 2.162635, 0.9098039, 0, 1, 1,
0.9160624, -0.09099974, 1.2071, 0.9137255, 0, 1, 1,
0.9162717, 0.5886182, 0.4699498, 0.9215686, 0, 1, 1,
0.917602, -0.3573419, 1.271694, 0.9254902, 0, 1, 1,
0.9187037, 0.2431907, 1.692029, 0.9333333, 0, 1, 1,
0.9256935, -0.1427156, 1.020336, 0.9372549, 0, 1, 1,
0.9262738, -0.2777433, 1.922847, 0.945098, 0, 1, 1,
0.934388, -0.1225805, 2.037734, 0.9490196, 0, 1, 1,
0.9427322, 0.823696, 0.7746571, 0.9568627, 0, 1, 1,
0.9441853, -0.4775601, 0.7149876, 0.9607843, 0, 1, 1,
0.954078, 1.376114, 0.2851632, 0.9686275, 0, 1, 1,
0.9571952, -0.3411765, 0.9825004, 0.972549, 0, 1, 1,
0.9578691, 1.23284, 1.96143, 0.9803922, 0, 1, 1,
0.9725364, 0.2518087, 1.40171, 0.9843137, 0, 1, 1,
0.9829202, 0.3190137, 0.5064963, 0.9921569, 0, 1, 1,
0.985863, 1.09957, -0.1344204, 0.9960784, 0, 1, 1,
0.992338, -0.1327108, 1.947511, 1, 0, 0.9960784, 1,
0.9924334, -1.390353, 1.93255, 1, 0, 0.9882353, 1,
0.9925659, -2.048287, 5.020132, 1, 0, 0.9843137, 1,
0.9928772, 1.058319, 2.164391, 1, 0, 0.9764706, 1,
0.9934871, -0.149049, 2.598574, 1, 0, 0.972549, 1,
0.997641, 1.096815, 0.6606403, 1, 0, 0.9647059, 1,
1.006782, -0.3376658, 1.174464, 1, 0, 0.9607843, 1,
1.029618, 0.1723359, 0.7074328, 1, 0, 0.9529412, 1,
1.034302, 0.8482749, 2.42581, 1, 0, 0.9490196, 1,
1.035765, -1.411782, 2.416883, 1, 0, 0.9411765, 1,
1.037327, 1.7532, -1.59352, 1, 0, 0.9372549, 1,
1.038614, -0.6851242, 2.655196, 1, 0, 0.9294118, 1,
1.041525, 0.1442955, 1.697283, 1, 0, 0.9254902, 1,
1.049569, 2.045829, -0.05065166, 1, 0, 0.9176471, 1,
1.050874, -0.8923119, 1.886621, 1, 0, 0.9137255, 1,
1.064177, 0.2695619, 1.240346, 1, 0, 0.9058824, 1,
1.071941, -0.5724446, 2.388526, 1, 0, 0.9019608, 1,
1.076124, -1.802674, 2.0232, 1, 0, 0.8941177, 1,
1.089488, -2.172133, 3.460691, 1, 0, 0.8862745, 1,
1.092477, 0.3714266, 0.171264, 1, 0, 0.8823529, 1,
1.100177, 0.5989364, -0.2337862, 1, 0, 0.8745098, 1,
1.101983, -0.7222654, 1.303796, 1, 0, 0.8705882, 1,
1.106992, 0.3126087, 1.357952, 1, 0, 0.8627451, 1,
1.112532, 1.601492, 1.389016, 1, 0, 0.8588235, 1,
1.113194, -0.00356182, 2.393635, 1, 0, 0.8509804, 1,
1.11824, -1.051605, 2.099944, 1, 0, 0.8470588, 1,
1.124633, -0.304625, 2.894494, 1, 0, 0.8392157, 1,
1.129195, 0.849902, 1.581805, 1, 0, 0.8352941, 1,
1.129492, -1.409566, 2.148593, 1, 0, 0.827451, 1,
1.12989, -0.215767, 0.4046091, 1, 0, 0.8235294, 1,
1.133634, -0.3906896, 3.215105, 1, 0, 0.8156863, 1,
1.135168, -1.278667, 3.719182, 1, 0, 0.8117647, 1,
1.136193, 0.07269178, 1.813759, 1, 0, 0.8039216, 1,
1.143768, -0.6858245, 1.749467, 1, 0, 0.7960784, 1,
1.144012, -1.732634, 4.077389, 1, 0, 0.7921569, 1,
1.147324, 0.9248751, 0.4973288, 1, 0, 0.7843137, 1,
1.152714, -0.3912797, 2.839634, 1, 0, 0.7803922, 1,
1.153949, -0.7805661, 1.040229, 1, 0, 0.772549, 1,
1.15638, 1.968065, -2.2791, 1, 0, 0.7686275, 1,
1.157413, 0.8745387, 0.5119746, 1, 0, 0.7607843, 1,
1.167106, 0.4533175, 1.915259, 1, 0, 0.7568628, 1,
1.17453, -0.162594, 1.621643, 1, 0, 0.7490196, 1,
1.191759, 0.7400553, 0.359429, 1, 0, 0.7450981, 1,
1.209343, 1.648071, -1.405938, 1, 0, 0.7372549, 1,
1.219224, 0.7407798, 2.53229, 1, 0, 0.7333333, 1,
1.22501, -0.5789457, 1.72787, 1, 0, 0.7254902, 1,
1.227966, -0.01111585, 1.299983, 1, 0, 0.7215686, 1,
1.232604, 0.8058546, 1.279115, 1, 0, 0.7137255, 1,
1.238176, 0.1577781, 0.4477884, 1, 0, 0.7098039, 1,
1.244332, -0.7583548, 1.846724, 1, 0, 0.7019608, 1,
1.24531, 0.2041298, 0.04390932, 1, 0, 0.6941177, 1,
1.250225, 1.163505, 0.3704796, 1, 0, 0.6901961, 1,
1.25731, 0.4318518, -1.116452, 1, 0, 0.682353, 1,
1.261069, -0.4731663, 1.283066, 1, 0, 0.6784314, 1,
1.268507, 2.853767, 0.3415953, 1, 0, 0.6705883, 1,
1.273831, 2.220673, 1.173622, 1, 0, 0.6666667, 1,
1.277091, 0.4983413, 2.470074, 1, 0, 0.6588235, 1,
1.277545, -0.291575, -0.4342678, 1, 0, 0.654902, 1,
1.2814, 0.7930301, 1.053862, 1, 0, 0.6470588, 1,
1.290713, -0.06243291, 2.529359, 1, 0, 0.6431373, 1,
1.298391, 0.4302962, 1.68159, 1, 0, 0.6352941, 1,
1.303006, 0.3441227, 2.108538, 1, 0, 0.6313726, 1,
1.308191, 1.333927, 1.007361, 1, 0, 0.6235294, 1,
1.310042, -0.4168292, 3.256813, 1, 0, 0.6196079, 1,
1.319967, -1.617285, 1.163407, 1, 0, 0.6117647, 1,
1.324023, -0.09556837, 2.090702, 1, 0, 0.6078432, 1,
1.325476, -0.02582246, 2.458207, 1, 0, 0.6, 1,
1.325999, -0.1755634, 1.450201, 1, 0, 0.5921569, 1,
1.327074, 0.3305529, 0.06454798, 1, 0, 0.5882353, 1,
1.331179, 0.4338387, 2.310014, 1, 0, 0.5803922, 1,
1.332809, 1.10121, 0.702996, 1, 0, 0.5764706, 1,
1.335824, -1.521711, 1.141338, 1, 0, 0.5686275, 1,
1.358096, 0.4662668, 1.444908, 1, 0, 0.5647059, 1,
1.361069, 1.189503, 0.6640446, 1, 0, 0.5568628, 1,
1.366289, 0.2532484, -0.21493, 1, 0, 0.5529412, 1,
1.368093, -1.302489, 2.850822, 1, 0, 0.5450981, 1,
1.369669, -0.5623419, 3.547025, 1, 0, 0.5411765, 1,
1.37434, -0.3079872, 3.029552, 1, 0, 0.5333334, 1,
1.375257, 1.937776, 2.537814, 1, 0, 0.5294118, 1,
1.382035, -0.4048536, 1.98197, 1, 0, 0.5215687, 1,
1.416003, 0.2469709, 2.912669, 1, 0, 0.5176471, 1,
1.422533, 0.8704091, 0.3364831, 1, 0, 0.509804, 1,
1.424725, -0.01940413, 1.395277, 1, 0, 0.5058824, 1,
1.433471, 0.9280817, -0.4260932, 1, 0, 0.4980392, 1,
1.449751, 0.6517779, 0.7896816, 1, 0, 0.4901961, 1,
1.452124, -0.7039126, 1.423645, 1, 0, 0.4862745, 1,
1.454755, 0.1121, 1.664413, 1, 0, 0.4784314, 1,
1.456172, 0.7095409, 1.959069, 1, 0, 0.4745098, 1,
1.473152, 0.6930716, -0.4807681, 1, 0, 0.4666667, 1,
1.478158, 0.9091873, 1.646487, 1, 0, 0.4627451, 1,
1.479763, -1.017427, 0.816168, 1, 0, 0.454902, 1,
1.489893, 0.1665928, 0.9081694, 1, 0, 0.4509804, 1,
1.491553, 0.9246406, 1.520317, 1, 0, 0.4431373, 1,
1.499883, -0.5909986, 1.850289, 1, 0, 0.4392157, 1,
1.501128, -1.104002, 1.424495, 1, 0, 0.4313726, 1,
1.50404, 0.5232294, 0.2937437, 1, 0, 0.427451, 1,
1.510251, 1.903796, -0.3310395, 1, 0, 0.4196078, 1,
1.521385, -0.5009885, 3.404695, 1, 0, 0.4156863, 1,
1.531422, -0.1324766, 1.320068, 1, 0, 0.4078431, 1,
1.532291, 0.5994727, 0.5733191, 1, 0, 0.4039216, 1,
1.535289, 0.8903723, 0.3948494, 1, 0, 0.3960784, 1,
1.540798, -0.1495496, 2.772858, 1, 0, 0.3882353, 1,
1.560087, -0.03017293, -0.9977535, 1, 0, 0.3843137, 1,
1.585957, 0.8801554, -0.4886316, 1, 0, 0.3764706, 1,
1.587097, 0.7928538, 0.3630772, 1, 0, 0.372549, 1,
1.58932, -2.695947, 0.9145336, 1, 0, 0.3647059, 1,
1.597217, -1.589797, 0.7931548, 1, 0, 0.3607843, 1,
1.603776, 1.452566, 1.295747, 1, 0, 0.3529412, 1,
1.605028, 1.866054, 0.9802009, 1, 0, 0.3490196, 1,
1.611301, 0.2818384, 0.4439764, 1, 0, 0.3411765, 1,
1.616372, -1.483156, 1.282268, 1, 0, 0.3372549, 1,
1.632249, -0.4365832, 3.4322, 1, 0, 0.3294118, 1,
1.636109, -0.5161367, 1.379565, 1, 0, 0.3254902, 1,
1.63712, -0.9869547, 1.411452, 1, 0, 0.3176471, 1,
1.651123, -0.7294261, 3.763625, 1, 0, 0.3137255, 1,
1.657194, -1.6122, 3.330003, 1, 0, 0.3058824, 1,
1.659966, -0.1513975, 1.488571, 1, 0, 0.2980392, 1,
1.687752, -0.7392794, 1.299785, 1, 0, 0.2941177, 1,
1.688195, 1.222994, 1.538879, 1, 0, 0.2862745, 1,
1.692766, -0.1187437, 1.608191, 1, 0, 0.282353, 1,
1.695071, 0.8253284, 0.7115562, 1, 0, 0.2745098, 1,
1.696416, -0.4450727, 0.6400595, 1, 0, 0.2705882, 1,
1.714222, 1.317458, 1.972455, 1, 0, 0.2627451, 1,
1.72606, -1.679746, 3.312068, 1, 0, 0.2588235, 1,
1.770631, -0.3290933, 2.531152, 1, 0, 0.2509804, 1,
1.771382, 0.9042346, 1.028667, 1, 0, 0.2470588, 1,
1.808093, 2.125593, 1.741824, 1, 0, 0.2392157, 1,
1.826613, 0.7076753, 0.1523041, 1, 0, 0.2352941, 1,
1.835599, 2.067997, 0.7491704, 1, 0, 0.227451, 1,
1.835867, 1.734611, 0.3465548, 1, 0, 0.2235294, 1,
1.866926, 1.767045, 1.07278, 1, 0, 0.2156863, 1,
1.874393, -0.6183482, 1.819001, 1, 0, 0.2117647, 1,
1.909854, 0.1806356, 4.506952, 1, 0, 0.2039216, 1,
1.910356, -0.6849222, 2.681784, 1, 0, 0.1960784, 1,
1.950166, -1.69084, 1.820605, 1, 0, 0.1921569, 1,
1.955821, -0.2207145, 3.34313, 1, 0, 0.1843137, 1,
1.968619, 1.226853, 1.43207, 1, 0, 0.1803922, 1,
1.98382, -2.670955, 3.179569, 1, 0, 0.172549, 1,
2.017005, -1.059343, 2.558784, 1, 0, 0.1686275, 1,
2.062085, -0.1773956, 0.9795378, 1, 0, 0.1607843, 1,
2.210979, 0.3002127, 2.393759, 1, 0, 0.1568628, 1,
2.213492, -0.9383815, 1.994343, 1, 0, 0.1490196, 1,
2.21416, 0.07970704, -0.3110744, 1, 0, 0.145098, 1,
2.248296, -1.295045, 2.466288, 1, 0, 0.1372549, 1,
2.292923, -0.1179703, 3.155048, 1, 0, 0.1333333, 1,
2.31813, 0.1863897, 0.7611826, 1, 0, 0.1254902, 1,
2.333608, 0.5292889, 2.995035, 1, 0, 0.1215686, 1,
2.365745, 1.180858, 1.375831, 1, 0, 0.1137255, 1,
2.38361, 1.991942, -0.8968511, 1, 0, 0.1098039, 1,
2.388273, -1.157287, 1.681355, 1, 0, 0.1019608, 1,
2.390304, -1.627307, 3.54822, 1, 0, 0.09411765, 1,
2.391212, -1.087636, 2.186438, 1, 0, 0.09019608, 1,
2.408204, -0.4291185, 0.9463747, 1, 0, 0.08235294, 1,
2.42176, 0.2124325, 1.490837, 1, 0, 0.07843138, 1,
2.44727, -0.6821679, 0.813559, 1, 0, 0.07058824, 1,
2.494534, 0.1037586, 0.6648179, 1, 0, 0.06666667, 1,
2.496953, -0.03550626, 2.517701, 1, 0, 0.05882353, 1,
2.500374, 0.9769461, 0.1741747, 1, 0, 0.05490196, 1,
2.542871, 0.7704713, 2.089161, 1, 0, 0.04705882, 1,
2.688715, 0.04170966, -0.1090874, 1, 0, 0.04313726, 1,
2.746936, -2.837698, 2.296315, 1, 0, 0.03529412, 1,
2.764736, 0.5772851, 0.7744908, 1, 0, 0.03137255, 1,
3.155475, 0.2791644, 0.8809242, 1, 0, 0.02352941, 1,
3.171235, 0.5029072, 1.000256, 1, 0, 0.01960784, 1,
3.268151, -0.7007974, 2.898807, 1, 0, 0.01176471, 1,
3.916062, -0.549242, 3.338778, 1, 0, 0.007843138, 1
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
0.08321905, -4.598313, -7.254597, 0, -0.5, 0.5, 0.5,
0.08321905, -4.598313, -7.254597, 1, -0.5, 0.5, 0.5,
0.08321905, -4.598313, -7.254597, 1, 1.5, 0.5, 0.5,
0.08321905, -4.598313, -7.254597, 0, 1.5, 0.5, 0.5
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
-5.048958, 0.06265974, -7.254597, 0, -0.5, 0.5, 0.5,
-5.048958, 0.06265974, -7.254597, 1, -0.5, 0.5, 0.5,
-5.048958, 0.06265974, -7.254597, 1, 1.5, 0.5, 0.5,
-5.048958, 0.06265974, -7.254597, 0, 1.5, 0.5, 0.5
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
-5.048958, -4.598313, 0.6604805, 0, -0.5, 0.5, 0.5,
-5.048958, -4.598313, 0.6604805, 1, -0.5, 0.5, 0.5,
-5.048958, -4.598313, 0.6604805, 1, 1.5, 0.5, 0.5,
-5.048958, -4.598313, 0.6604805, 0, 1.5, 0.5, 0.5
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
-2, -3.522704, -5.428041,
2, -3.522704, -5.428041,
-2, -3.522704, -5.428041,
-2, -3.701972, -5.732467,
0, -3.522704, -5.428041,
0, -3.701972, -5.732467,
2, -3.522704, -5.428041,
2, -3.701972, -5.732467
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
"0",
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
-2, -4.060508, -6.341319, 0, -0.5, 0.5, 0.5,
-2, -4.060508, -6.341319, 1, -0.5, 0.5, 0.5,
-2, -4.060508, -6.341319, 1, 1.5, 0.5, 0.5,
-2, -4.060508, -6.341319, 0, 1.5, 0.5, 0.5,
0, -4.060508, -6.341319, 0, -0.5, 0.5, 0.5,
0, -4.060508, -6.341319, 1, -0.5, 0.5, 0.5,
0, -4.060508, -6.341319, 1, 1.5, 0.5, 0.5,
0, -4.060508, -6.341319, 0, 1.5, 0.5, 0.5,
2, -4.060508, -6.341319, 0, -0.5, 0.5, 0.5,
2, -4.060508, -6.341319, 1, -0.5, 0.5, 0.5,
2, -4.060508, -6.341319, 1, 1.5, 0.5, 0.5,
2, -4.060508, -6.341319, 0, 1.5, 0.5, 0.5
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
-3.864609, -3, -5.428041,
-3.864609, 3, -5.428041,
-3.864609, -3, -5.428041,
-4.062001, -3, -5.732467,
-3.864609, -2, -5.428041,
-4.062001, -2, -5.732467,
-3.864609, -1, -5.428041,
-4.062001, -1, -5.732467,
-3.864609, 0, -5.428041,
-4.062001, 0, -5.732467,
-3.864609, 1, -5.428041,
-4.062001, 1, -5.732467,
-3.864609, 2, -5.428041,
-4.062001, 2, -5.732467,
-3.864609, 3, -5.428041,
-4.062001, 3, -5.732467
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
-4.456784, -3, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, -3, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, -3, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, -3, -6.341319, 0, 1.5, 0.5, 0.5,
-4.456784, -2, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, -2, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, -2, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, -2, -6.341319, 0, 1.5, 0.5, 0.5,
-4.456784, -1, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, -1, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, -1, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, -1, -6.341319, 0, 1.5, 0.5, 0.5,
-4.456784, 0, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, 0, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, 0, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, 0, -6.341319, 0, 1.5, 0.5, 0.5,
-4.456784, 1, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, 1, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, 1, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, 1, -6.341319, 0, 1.5, 0.5, 0.5,
-4.456784, 2, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, 2, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, 2, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, 2, -6.341319, 0, 1.5, 0.5, 0.5,
-4.456784, 3, -6.341319, 0, -0.5, 0.5, 0.5,
-4.456784, 3, -6.341319, 1, -0.5, 0.5, 0.5,
-4.456784, 3, -6.341319, 1, 1.5, 0.5, 0.5,
-4.456784, 3, -6.341319, 0, 1.5, 0.5, 0.5
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
-3.864609, -3.522704, -4,
-3.864609, -3.522704, 6,
-3.864609, -3.522704, -4,
-4.062001, -3.701972, -4,
-3.864609, -3.522704, -2,
-4.062001, -3.701972, -2,
-3.864609, -3.522704, 0,
-4.062001, -3.701972, 0,
-3.864609, -3.522704, 2,
-4.062001, -3.701972, 2,
-3.864609, -3.522704, 4,
-4.062001, -3.701972, 4,
-3.864609, -3.522704, 6,
-4.062001, -3.701972, 6
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
-4.456784, -4.060508, -4, 0, -0.5, 0.5, 0.5,
-4.456784, -4.060508, -4, 1, -0.5, 0.5, 0.5,
-4.456784, -4.060508, -4, 1, 1.5, 0.5, 0.5,
-4.456784, -4.060508, -4, 0, 1.5, 0.5, 0.5,
-4.456784, -4.060508, -2, 0, -0.5, 0.5, 0.5,
-4.456784, -4.060508, -2, 1, -0.5, 0.5, 0.5,
-4.456784, -4.060508, -2, 1, 1.5, 0.5, 0.5,
-4.456784, -4.060508, -2, 0, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 0, 0, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 0, 1, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 0, 1, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 0, 0, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 2, 0, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 2, 1, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 2, 1, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 2, 0, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 4, 0, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 4, 1, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 4, 1, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 4, 0, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 6, 0, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 6, 1, -0.5, 0.5, 0.5,
-4.456784, -4.060508, 6, 1, 1.5, 0.5, 0.5,
-4.456784, -4.060508, 6, 0, 1.5, 0.5, 0.5
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
-3.864609, -3.522704, -5.428041,
-3.864609, 3.648023, -5.428041,
-3.864609, -3.522704, 6.749002,
-3.864609, 3.648023, 6.749002,
-3.864609, -3.522704, -5.428041,
-3.864609, -3.522704, 6.749002,
-3.864609, 3.648023, -5.428041,
-3.864609, 3.648023, 6.749002,
-3.864609, -3.522704, -5.428041,
4.031047, -3.522704, -5.428041,
-3.864609, -3.522704, 6.749002,
4.031047, -3.522704, 6.749002,
-3.864609, 3.648023, -5.428041,
4.031047, 3.648023, -5.428041,
-3.864609, 3.648023, 6.749002,
4.031047, 3.648023, 6.749002,
4.031047, -3.522704, -5.428041,
4.031047, 3.648023, -5.428041,
4.031047, -3.522704, 6.749002,
4.031047, 3.648023, 6.749002,
4.031047, -3.522704, -5.428041,
4.031047, -3.522704, 6.749002,
4.031047, 3.648023, -5.428041,
4.031047, 3.648023, 6.749002
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
var radius = 8.643909;
var distance = 38.45773;
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
mvMatrix.translate( -0.08321905, -0.06265974, -0.6604805 );
mvMatrix.scale( 1.183684, 1.303349, 0.7675068 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.45773);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
buminafos<-read.table("buminafos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-buminafos$V2
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
```

```r
y<-buminafos$V3
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
```

```r
z<-buminafos$V4
```

```
## Error in eval(expr, envir, enclos): object 'buminafos' not found
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
-3.749624, -1.100585, -0.9718793, 0, 0, 1, 1, 1,
-3.423319, 0.9167292, -1.719861, 1, 0, 0, 1, 1,
-3.119645, 0.818338, -0.5382957, 1, 0, 0, 1, 1,
-3.05796, 0.9620074, -2.311841, 1, 0, 0, 1, 1,
-3.053008, 0.3426788, -0.05443693, 1, 0, 0, 1, 1,
-2.987509, 1.448849, -2.424413, 1, 0, 0, 1, 1,
-2.569731, -0.7948879, -1.289358, 0, 0, 0, 1, 1,
-2.486625, -1.589489, -1.564795, 0, 0, 0, 1, 1,
-2.429195, 1.107678, -2.008884, 0, 0, 0, 1, 1,
-2.420039, -0.3003595, -0.1591701, 0, 0, 0, 1, 1,
-2.417763, -0.1437615, -0.2842565, 0, 0, 0, 1, 1,
-2.396782, 0.5796666, -0.4054296, 0, 0, 0, 1, 1,
-2.393683, 0.9973809, -1.763062, 0, 0, 0, 1, 1,
-2.383879, 1.392185, -1.982665, 1, 1, 1, 1, 1,
-2.301947, 1.35511, 0.1368774, 1, 1, 1, 1, 1,
-2.269691, -0.2778113, -1.705055, 1, 1, 1, 1, 1,
-2.243854, 0.02923954, -3.235137, 1, 1, 1, 1, 1,
-2.175412, -0.1300142, -2.243774, 1, 1, 1, 1, 1,
-2.156886, -0.9631884, -2.172296, 1, 1, 1, 1, 1,
-2.149606, -0.6248256, -1.271034, 1, 1, 1, 1, 1,
-2.122928, -0.3972471, -3.020618, 1, 1, 1, 1, 1,
-2.113456, 0.7759703, 0.110717, 1, 1, 1, 1, 1,
-2.110456, 0.4583144, -2.319443, 1, 1, 1, 1, 1,
-2.08142, 0.3382035, -1.512978, 1, 1, 1, 1, 1,
-2.07593, 1.625116, 0.04180193, 1, 1, 1, 1, 1,
-2.068966, 0.2096381, -3.033096, 1, 1, 1, 1, 1,
-2.056496, 0.1350994, -1.2136, 1, 1, 1, 1, 1,
-2.039937, 0.2571818, -2.24102, 1, 1, 1, 1, 1,
-2.031536, 0.6902048, -2.640652, 0, 0, 1, 1, 1,
-2.008083, 1.010854, -2.622186, 1, 0, 0, 1, 1,
-1.965411, -0.4693946, -0.5997624, 1, 0, 0, 1, 1,
-1.9429, 0.2655425, -1.068393, 1, 0, 0, 1, 1,
-1.911532, 0.07635881, -0.9666314, 1, 0, 0, 1, 1,
-1.907134, 0.6609169, -0.9637026, 1, 0, 0, 1, 1,
-1.871599, 0.4044034, -0.7157921, 0, 0, 0, 1, 1,
-1.868922, 1.108943, -1.313073, 0, 0, 0, 1, 1,
-1.865781, 0.6154927, -3.123286, 0, 0, 0, 1, 1,
-1.832685, -0.3122807, -1.716273, 0, 0, 0, 1, 1,
-1.812886, -1.435712, -1.874532, 0, 0, 0, 1, 1,
-1.795212, 0.4119907, -1.424935, 0, 0, 0, 1, 1,
-1.783598, -0.1942045, 0.8146677, 0, 0, 0, 1, 1,
-1.781615, -1.112293, -3.59944, 1, 1, 1, 1, 1,
-1.758096, -0.5231182, -2.693605, 1, 1, 1, 1, 1,
-1.757981, 0.8740792, -0.8278039, 1, 1, 1, 1, 1,
-1.71643, 0.8900926, -0.4843664, 1, 1, 1, 1, 1,
-1.713385, 1.732613, -1.493999, 1, 1, 1, 1, 1,
-1.708434, -0.04285802, -1.731784, 1, 1, 1, 1, 1,
-1.706638, 0.7029314, -1.904126, 1, 1, 1, 1, 1,
-1.705313, -1.444677, -3.756541, 1, 1, 1, 1, 1,
-1.704625, -0.2024926, -1.142929, 1, 1, 1, 1, 1,
-1.70167, -0.2651902, -2.219089, 1, 1, 1, 1, 1,
-1.700499, 0.6044051, -2.080321, 1, 1, 1, 1, 1,
-1.658409, 1.81657, -1.789969, 1, 1, 1, 1, 1,
-1.638537, 0.247941, -2.71155, 1, 1, 1, 1, 1,
-1.637935, 0.7126452, -2.098076, 1, 1, 1, 1, 1,
-1.634454, 0.2315275, -1.662486, 1, 1, 1, 1, 1,
-1.622688, -1.500049, -2.492145, 0, 0, 1, 1, 1,
-1.622202, 1.963539, -0.3201903, 1, 0, 0, 1, 1,
-1.604089, -2.074648, -1.604894, 1, 0, 0, 1, 1,
-1.599632, -0.9777713, -1.779309, 1, 0, 0, 1, 1,
-1.593427, -0.7155094, -0.2535159, 1, 0, 0, 1, 1,
-1.593327, 1.297538, 0.1072773, 1, 0, 0, 1, 1,
-1.590129, 0.7500287, -0.1264181, 0, 0, 0, 1, 1,
-1.567463, 0.89752, -0.8225363, 0, 0, 0, 1, 1,
-1.560624, 0.2643239, -2.145294, 0, 0, 0, 1, 1,
-1.555915, 0.1853602, -3.426101, 0, 0, 0, 1, 1,
-1.551962, 0.7320378, -1.267984, 0, 0, 0, 1, 1,
-1.54401, -1.978077, -3.560516, 0, 0, 0, 1, 1,
-1.534596, -1.126922, -2.835962, 0, 0, 0, 1, 1,
-1.518978, 0.6009341, -0.3789477, 1, 1, 1, 1, 1,
-1.51353, -0.4569036, -2.117889, 1, 1, 1, 1, 1,
-1.504747, -1.436181, -1.22245, 1, 1, 1, 1, 1,
-1.494198, -0.8965093, -0.6858831, 1, 1, 1, 1, 1,
-1.461263, -0.05302088, -3.812356, 1, 1, 1, 1, 1,
-1.456354, -0.8226811, -2.436989, 1, 1, 1, 1, 1,
-1.456284, 1.040032, -0.8419672, 1, 1, 1, 1, 1,
-1.4454, -1.452731, -2.289842, 1, 1, 1, 1, 1,
-1.438818, 0.4293998, 0.1913469, 1, 1, 1, 1, 1,
-1.433821, -0.7842345, -2.619138, 1, 1, 1, 1, 1,
-1.431336, 0.2944315, -0.2744247, 1, 1, 1, 1, 1,
-1.42208, -0.2504686, -1.26066, 1, 1, 1, 1, 1,
-1.420531, -1.538965, -0.5580214, 1, 1, 1, 1, 1,
-1.419223, -0.4457796, -1.08064, 1, 1, 1, 1, 1,
-1.418295, -2.532071, -1.598984, 1, 1, 1, 1, 1,
-1.413214, 1.034652, -1.655658, 0, 0, 1, 1, 1,
-1.412928, -1.492608, -1.968154, 1, 0, 0, 1, 1,
-1.398884, 2.203108, -0.6894644, 1, 0, 0, 1, 1,
-1.397431, 0.03507314, -2.093645, 1, 0, 0, 1, 1,
-1.396303, -1.250113, -3.188131, 1, 0, 0, 1, 1,
-1.390733, -0.8611643, -1.261361, 1, 0, 0, 1, 1,
-1.386493, -0.0414429, -1.818466, 0, 0, 0, 1, 1,
-1.380888, -0.8568407, -2.234865, 0, 0, 0, 1, 1,
-1.377549, -0.2387475, -1.622923, 0, 0, 0, 1, 1,
-1.358004, -0.4082481, -3.151244, 0, 0, 0, 1, 1,
-1.354398, -0.663297, -1.164344, 0, 0, 0, 1, 1,
-1.351246, -0.0477896, -2.004199, 0, 0, 0, 1, 1,
-1.342162, -1.153914, -3.104911, 0, 0, 0, 1, 1,
-1.335266, 1.744425, -1.533742, 1, 1, 1, 1, 1,
-1.335021, 0.4450814, -1.007376, 1, 1, 1, 1, 1,
-1.329764, -1.375326, -3.103763, 1, 1, 1, 1, 1,
-1.327399, 0.5341505, -2.01998, 1, 1, 1, 1, 1,
-1.326129, 0.124404, -1.443193, 1, 1, 1, 1, 1,
-1.325598, -1.875074, -2.056132, 1, 1, 1, 1, 1,
-1.324776, -0.7312896, -1.861774, 1, 1, 1, 1, 1,
-1.323684, -0.6472248, -1.837477, 1, 1, 1, 1, 1,
-1.319207, 0.6565533, -1.652406, 1, 1, 1, 1, 1,
-1.316106, -0.8486512, -1.690336, 1, 1, 1, 1, 1,
-1.306555, -1.381944, -1.489307, 1, 1, 1, 1, 1,
-1.302866, 0.1295769, 0.3975145, 1, 1, 1, 1, 1,
-1.300387, -0.8390385, -0.8764344, 1, 1, 1, 1, 1,
-1.295754, 1.172314, -0.7897081, 1, 1, 1, 1, 1,
-1.289796, -0.9135107, -3.322819, 1, 1, 1, 1, 1,
-1.283319, 1.770821, -1.522267, 0, 0, 1, 1, 1,
-1.278057, -0.8158365, -0.1129097, 1, 0, 0, 1, 1,
-1.275452, -0.6530737, -2.996079, 1, 0, 0, 1, 1,
-1.267768, -1.043637, -0.8508096, 1, 0, 0, 1, 1,
-1.258744, -0.3740364, -0.6227705, 1, 0, 0, 1, 1,
-1.255295, -1.359188, -2.507831, 1, 0, 0, 1, 1,
-1.252931, 1.625519, -0.7940395, 0, 0, 0, 1, 1,
-1.252022, -0.08581533, 0.3368347, 0, 0, 0, 1, 1,
-1.247707, -0.9382759, -3.322441, 0, 0, 0, 1, 1,
-1.246847, 0.5991019, -0.7081294, 0, 0, 0, 1, 1,
-1.242296, 0.3087663, -1.899544, 0, 0, 0, 1, 1,
-1.235719, 0.7958993, -1.074098, 0, 0, 0, 1, 1,
-1.226126, 0.08093508, -0.9144017, 0, 0, 0, 1, 1,
-1.225818, -0.3309797, -3.130277, 1, 1, 1, 1, 1,
-1.218064, -0.7414597, -3.931181, 1, 1, 1, 1, 1,
-1.217327, -1.67166, -1.224349, 1, 1, 1, 1, 1,
-1.214321, 1.569311, -0.4866205, 1, 1, 1, 1, 1,
-1.208462, -0.6094366, -0.1832674, 1, 1, 1, 1, 1,
-1.19628, 1.285955, -1.812463, 1, 1, 1, 1, 1,
-1.19416, -0.2538029, -2.408239, 1, 1, 1, 1, 1,
-1.190198, -0.2279322, -1.818867, 1, 1, 1, 1, 1,
-1.18919, 0.6407338, -2.065093, 1, 1, 1, 1, 1,
-1.186436, -0.6680646, 0.2422291, 1, 1, 1, 1, 1,
-1.184721, 0.8308697, -0.02391802, 1, 1, 1, 1, 1,
-1.183341, 0.7281923, -1.625952, 1, 1, 1, 1, 1,
-1.183099, 2.235739, -0.5296543, 1, 1, 1, 1, 1,
-1.174591, 0.3966018, -1.842204, 1, 1, 1, 1, 1,
-1.166406, 0.9691303, -0.7666333, 1, 1, 1, 1, 1,
-1.154427, 0.09430324, -1.323737, 0, 0, 1, 1, 1,
-1.148299, 1.034929, -1.803114, 1, 0, 0, 1, 1,
-1.147036, 0.7441366, 0.3134729, 1, 0, 0, 1, 1,
-1.143509, -0.2342231, -1.400947, 1, 0, 0, 1, 1,
-1.142249, -0.6804788, -1.994277, 1, 0, 0, 1, 1,
-1.137938, 1.153958, 0.3813221, 1, 0, 0, 1, 1,
-1.136161, 0.161064, -1.648013, 0, 0, 0, 1, 1,
-1.134681, -2.29133, -2.377725, 0, 0, 0, 1, 1,
-1.132024, 0.5350007, -0.9756948, 0, 0, 0, 1, 1,
-1.131221, -0.6542349, -0.4094139, 0, 0, 0, 1, 1,
-1.129224, -0.7107514, -1.578124, 0, 0, 0, 1, 1,
-1.127225, -0.07503133, -3.356061, 0, 0, 0, 1, 1,
-1.115488, 0.4311199, -1.497245, 0, 0, 0, 1, 1,
-1.111814, 0.9382923, -0.8028613, 1, 1, 1, 1, 1,
-1.109996, -1.446375, -1.60754, 1, 1, 1, 1, 1,
-1.104755, 1.149151, 0.288489, 1, 1, 1, 1, 1,
-1.10214, -0.5384365, -2.914751, 1, 1, 1, 1, 1,
-1.094582, -1.322032, -2.163425, 1, 1, 1, 1, 1,
-1.088368, 0.07827391, -2.309687, 1, 1, 1, 1, 1,
-1.07843, -1.137173, -1.619298, 1, 1, 1, 1, 1,
-1.077609, 0.05746164, -1.630464, 1, 1, 1, 1, 1,
-1.068781, -0.07841717, -2.929712, 1, 1, 1, 1, 1,
-1.060056, -0.210613, -2.628629, 1, 1, 1, 1, 1,
-1.057948, 0.2105947, -3.829479, 1, 1, 1, 1, 1,
-1.056981, -0.1091942, -3.221638, 1, 1, 1, 1, 1,
-1.054728, -1.7765, -1.836306, 1, 1, 1, 1, 1,
-1.044509, 1.473219, -0.9209202, 1, 1, 1, 1, 1,
-1.039593, -1.800654, -3.664059, 1, 1, 1, 1, 1,
-1.036981, 0.1113155, -1.010318, 0, 0, 1, 1, 1,
-1.036975, -0.4192463, -2.679461, 1, 0, 0, 1, 1,
-1.03669, -0.9979121, -2.555661, 1, 0, 0, 1, 1,
-1.033747, 0.005865841, -3.031847, 1, 0, 0, 1, 1,
-1.030979, 1.756008, -1.4381, 1, 0, 0, 1, 1,
-1.018857, -1.125292, -2.461206, 1, 0, 0, 1, 1,
-1.010074, 1.970365, -0.5863165, 0, 0, 0, 1, 1,
-0.9988476, 0.7758025, -0.5645753, 0, 0, 0, 1, 1,
-0.9986176, -1.744142, -2.339564, 0, 0, 0, 1, 1,
-0.9913157, -0.6867518, -2.035704, 0, 0, 0, 1, 1,
-0.9896588, -1.046283, -2.846943, 0, 0, 0, 1, 1,
-0.9889215, -0.2995909, -2.046634, 0, 0, 0, 1, 1,
-0.9887065, 0.3332493, -0.8486443, 0, 0, 0, 1, 1,
-0.9754301, -0.4114435, -2.939959, 1, 1, 1, 1, 1,
-0.9668849, -0.1317641, -2.263847, 1, 1, 1, 1, 1,
-0.9666906, 0.6104157, -0.6433924, 1, 1, 1, 1, 1,
-0.962694, 0.01585066, -2.00912, 1, 1, 1, 1, 1,
-0.9626793, 0.1888983, -3.584915, 1, 1, 1, 1, 1,
-0.9529043, -1.006911, -1.743088, 1, 1, 1, 1, 1,
-0.9504182, -0.3089581, -2.473979, 1, 1, 1, 1, 1,
-0.9438142, 0.2354267, -0.7497215, 1, 1, 1, 1, 1,
-0.9326109, 0.1405543, -2.098409, 1, 1, 1, 1, 1,
-0.9271867, -0.136326, -1.280366, 1, 1, 1, 1, 1,
-0.9239772, 0.1543914, -2.389604, 1, 1, 1, 1, 1,
-0.9180898, 0.2356775, -1.571544, 1, 1, 1, 1, 1,
-0.9175726, -0.9110289, -1.92776, 1, 1, 1, 1, 1,
-0.9166093, 1.318756, 1.789883, 1, 1, 1, 1, 1,
-0.9149802, 0.299958, -1.418329, 1, 1, 1, 1, 1,
-0.9144994, 0.9986269, -0.7677692, 0, 0, 1, 1, 1,
-0.9134541, 1.014076, 1.199338, 1, 0, 0, 1, 1,
-0.9133469, 0.9907097, -2.035603, 1, 0, 0, 1, 1,
-0.9132406, 0.9411626, -1.511139, 1, 0, 0, 1, 1,
-0.9074121, 2.343954, -0.2350617, 1, 0, 0, 1, 1,
-0.9007141, 0.02364027, -2.037895, 1, 0, 0, 1, 1,
-0.8997591, 0.6069639, 0.5921246, 0, 0, 0, 1, 1,
-0.8936275, 0.9791887, -0.2387219, 0, 0, 0, 1, 1,
-0.8926156, -0.1734378, -2.417453, 0, 0, 0, 1, 1,
-0.8902043, 1.760678, 0.6473733, 0, 0, 0, 1, 1,
-0.8833981, -0.2267461, -0.7724661, 0, 0, 0, 1, 1,
-0.8789811, -1.404188, -3.424244, 0, 0, 0, 1, 1,
-0.873306, -1.996477, -1.297945, 0, 0, 0, 1, 1,
-0.8698394, 0.01162192, -2.537204, 1, 1, 1, 1, 1,
-0.8668409, 1.107332, 0.6197213, 1, 1, 1, 1, 1,
-0.8665646, 2.225112, 0.9560926, 1, 1, 1, 1, 1,
-0.8662286, 1.534692, -0.2984817, 1, 1, 1, 1, 1,
-0.8659657, -0.7060273, -2.046665, 1, 1, 1, 1, 1,
-0.858432, -1.205816, -2.275343, 1, 1, 1, 1, 1,
-0.8445281, 0.1651234, -2.352985, 1, 1, 1, 1, 1,
-0.8430368, 0.1729695, -1.310203, 1, 1, 1, 1, 1,
-0.8388274, 1.338636, 0.5703111, 1, 1, 1, 1, 1,
-0.8383234, -0.5308275, -2.385737, 1, 1, 1, 1, 1,
-0.8274994, 0.4371962, 0.6948791, 1, 1, 1, 1, 1,
-0.8273653, -0.6078746, -3.200601, 1, 1, 1, 1, 1,
-0.8260663, 0.152084, -1.105574, 1, 1, 1, 1, 1,
-0.819441, 0.8231283, -2.080575, 1, 1, 1, 1, 1,
-0.8174684, -1.686305, -1.716437, 1, 1, 1, 1, 1,
-0.8121741, 0.4981881, -0.5142164, 0, 0, 1, 1, 1,
-0.8085932, -0.9566815, -3.521375, 1, 0, 0, 1, 1,
-0.8035365, 0.5694157, -1.030246, 1, 0, 0, 1, 1,
-0.7991569, 0.4067071, -0.5705877, 1, 0, 0, 1, 1,
-0.7955431, 0.9256618, -0.9541008, 1, 0, 0, 1, 1,
-0.7941285, 1.119867, -0.3383542, 1, 0, 0, 1, 1,
-0.7940094, -1.430017, -1.692073, 0, 0, 0, 1, 1,
-0.7929345, 2.039956, -0.8197573, 0, 0, 0, 1, 1,
-0.7927315, -0.1178975, -4.0346, 0, 0, 0, 1, 1,
-0.7925678, 0.5136724, -1.02093, 0, 0, 0, 1, 1,
-0.7885705, -0.6937996, -2.713587, 0, 0, 0, 1, 1,
-0.7875975, 0.1213907, -1.74146, 0, 0, 0, 1, 1,
-0.7821828, 0.09970015, -2.200091, 0, 0, 0, 1, 1,
-0.7731446, -1.256181, -2.550124, 1, 1, 1, 1, 1,
-0.7701929, 0.6181896, -1.804124, 1, 1, 1, 1, 1,
-0.7686834, 0.5411584, -0.4940073, 1, 1, 1, 1, 1,
-0.7668848, -0.06114245, -3.863716, 1, 1, 1, 1, 1,
-0.7604069, 1.073469, -1.128598, 1, 1, 1, 1, 1,
-0.7587909, -0.0771253, -1.099738, 1, 1, 1, 1, 1,
-0.7493862, 1.345886, 0.02172365, 1, 1, 1, 1, 1,
-0.7446781, -0.900692, -3.879718, 1, 1, 1, 1, 1,
-0.7437774, -1.506185, -1.091289, 1, 1, 1, 1, 1,
-0.7359499, -1.953808, -2.629098, 1, 1, 1, 1, 1,
-0.7352984, 0.3693667, -1.209294, 1, 1, 1, 1, 1,
-0.731562, -1.570457, -3.104554, 1, 1, 1, 1, 1,
-0.7282423, -1.090575, -3.04668, 1, 1, 1, 1, 1,
-0.7248665, -0.0883439, -3.982864, 1, 1, 1, 1, 1,
-0.7213433, 0.3664291, -2.660022, 1, 1, 1, 1, 1,
-0.7203726, -0.5556, -0.7586359, 0, 0, 1, 1, 1,
-0.7120322, 0.7912847, -0.8255121, 1, 0, 0, 1, 1,
-0.7086985, 1.641347, -1.672364, 1, 0, 0, 1, 1,
-0.707467, -0.121574, -0.5559267, 1, 0, 0, 1, 1,
-0.6928332, 1.444035, 0.03548908, 1, 0, 0, 1, 1,
-0.6899779, -2.073074, -2.863242, 1, 0, 0, 1, 1,
-0.6838371, -2.033364, -1.609246, 0, 0, 0, 1, 1,
-0.679658, -0.1120657, -0.6154314, 0, 0, 0, 1, 1,
-0.6680056, -0.9451758, -1.918106, 0, 0, 0, 1, 1,
-0.6659321, 0.2886858, -2.048881, 0, 0, 0, 1, 1,
-0.6566159, 1.73102, -0.8721348, 0, 0, 0, 1, 1,
-0.6556143, 0.2471618, -1.009371, 0, 0, 0, 1, 1,
-0.6506236, -0.8730501, -3.202026, 0, 0, 0, 1, 1,
-0.6504765, 0.1105562, -1.029215, 1, 1, 1, 1, 1,
-0.6474363, -1.305857, -3.39232, 1, 1, 1, 1, 1,
-0.6343988, 1.577315, 0.9031154, 1, 1, 1, 1, 1,
-0.6293445, -0.4255623, -3.451162, 1, 1, 1, 1, 1,
-0.6197501, -0.2929627, -2.03731, 1, 1, 1, 1, 1,
-0.6151826, -0.311388, -1.408287, 1, 1, 1, 1, 1,
-0.6052513, 0.3490526, -1.44528, 1, 1, 1, 1, 1,
-0.6049298, -1.32233, -2.699642, 1, 1, 1, 1, 1,
-0.595322, 1.079538, -2.078849, 1, 1, 1, 1, 1,
-0.5928239, 0.236982, -0.8584127, 1, 1, 1, 1, 1,
-0.5910065, 0.2959198, -2.54853, 1, 1, 1, 1, 1,
-0.5905405, -0.9438968, -4.108337, 1, 1, 1, 1, 1,
-0.5890276, 0.3352093, -0.1883922, 1, 1, 1, 1, 1,
-0.5885198, 1.344661, -1.039225, 1, 1, 1, 1, 1,
-0.5884535, 0.03049721, -2.212326, 1, 1, 1, 1, 1,
-0.5876312, -0.384026, -2.077433, 0, 0, 1, 1, 1,
-0.5836833, -0.6215522, -1.31521, 1, 0, 0, 1, 1,
-0.5831056, 2.205146, -3.327191, 1, 0, 0, 1, 1,
-0.5822514, 1.049998, 0.8502695, 1, 0, 0, 1, 1,
-0.5817684, 0.2065228, -2.047287, 1, 0, 0, 1, 1,
-0.5816245, -0.2944216, -3.600604, 1, 0, 0, 1, 1,
-0.5808334, -2.596107, -3.935573, 0, 0, 0, 1, 1,
-0.5799906, -0.1078381, -3.312383, 0, 0, 0, 1, 1,
-0.5789657, -2.11677, -1.759182, 0, 0, 0, 1, 1,
-0.5788259, 0.4715268, -0.1151519, 0, 0, 0, 1, 1,
-0.5783237, -0.2198358, -0.8844987, 0, 0, 0, 1, 1,
-0.576496, 3.286954, 0.1186415, 0, 0, 0, 1, 1,
-0.5729683, 0.4086966, -1.16251, 0, 0, 0, 1, 1,
-0.5723301, 1.193656, 0.1103475, 1, 1, 1, 1, 1,
-0.5701842, -0.9624048, -2.684397, 1, 1, 1, 1, 1,
-0.5693879, -0.5930507, -1.07248, 1, 1, 1, 1, 1,
-0.5689531, -0.7796613, -1.968575, 1, 1, 1, 1, 1,
-0.5676843, 0.8128942, 1.428995, 1, 1, 1, 1, 1,
-0.5662909, -0.06216388, -1.212534, 1, 1, 1, 1, 1,
-0.5661946, -0.06367044, -1.323904, 1, 1, 1, 1, 1,
-0.5661761, 1.016163, -0.294379, 1, 1, 1, 1, 1,
-0.5621219, -0.6756496, -2.270647, 1, 1, 1, 1, 1,
-0.5588735, 1.565762, -0.6523882, 1, 1, 1, 1, 1,
-0.5536159, 0.134952, -0.7972461, 1, 1, 1, 1, 1,
-0.552089, 0.9716904, -0.951428, 1, 1, 1, 1, 1,
-0.5512245, 0.2072735, -1.279013, 1, 1, 1, 1, 1,
-0.5508919, 0.2211677, -2.175518, 1, 1, 1, 1, 1,
-0.543848, -0.657736, -4.888667, 1, 1, 1, 1, 1,
-0.5397148, -0.5722994, -1.556232, 0, 0, 1, 1, 1,
-0.5387287, -1.866119, -3.708579, 1, 0, 0, 1, 1,
-0.535723, 0.05094662, -1.353933, 1, 0, 0, 1, 1,
-0.5350675, -0.1877413, -2.141816, 1, 0, 0, 1, 1,
-0.5291111, -0.7466583, -3.842817, 1, 0, 0, 1, 1,
-0.5260233, 0.3009528, 0.7408034, 1, 0, 0, 1, 1,
-0.5244199, -1.987503, -4.360222, 0, 0, 0, 1, 1,
-0.5199847, -0.542017, -3.086161, 0, 0, 0, 1, 1,
-0.5095394, -0.1998387, -1.278922, 0, 0, 0, 1, 1,
-0.5062427, 0.6952257, -1.172688, 0, 0, 0, 1, 1,
-0.5039981, 1.12484, 0.9209378, 0, 0, 0, 1, 1,
-0.5034302, 0.7101609, -3.111713, 0, 0, 0, 1, 1,
-0.5030714, 0.9108049, 0.8399487, 0, 0, 0, 1, 1,
-0.5030019, -0.008376362, -0.8014156, 1, 1, 1, 1, 1,
-0.5008491, -0.2992083, -2.222902, 1, 1, 1, 1, 1,
-0.5003805, 0.04156504, -2.129444, 1, 1, 1, 1, 1,
-0.4971519, -1.205018, -3.117648, 1, 1, 1, 1, 1,
-0.4949394, 0.1092135, -2.466691, 1, 1, 1, 1, 1,
-0.4926928, 0.3420656, 0.0984132, 1, 1, 1, 1, 1,
-0.4846756, -1.15008, -1.895599, 1, 1, 1, 1, 1,
-0.4845759, -0.5425613, -2.828093, 1, 1, 1, 1, 1,
-0.4802893, 1.995904, 0.5272707, 1, 1, 1, 1, 1,
-0.4754748, 0.1771714, -0.3943869, 1, 1, 1, 1, 1,
-0.4670485, -0.04977355, -0.8878576, 1, 1, 1, 1, 1,
-0.4665689, 1.377708, -0.8747211, 1, 1, 1, 1, 1,
-0.4664221, -0.891119, -2.955305, 1, 1, 1, 1, 1,
-0.4637419, 1.121202, 0.4663863, 1, 1, 1, 1, 1,
-0.4595271, -0.6813737, -3.182616, 1, 1, 1, 1, 1,
-0.4587958, -1.13579, -1.785996, 0, 0, 1, 1, 1,
-0.4523334, -0.5049888, -4.23928, 1, 0, 0, 1, 1,
-0.4452039, -0.75151, -1.628789, 1, 0, 0, 1, 1,
-0.4448949, -0.2482991, -0.5399054, 1, 0, 0, 1, 1,
-0.4409257, 0.2691025, -1.844295, 1, 0, 0, 1, 1,
-0.4344704, -0.1249525, -0.6668577, 1, 0, 0, 1, 1,
-0.4342826, 0.1525831, -2.836246, 0, 0, 0, 1, 1,
-0.4294079, 1.385337, 0.4959572, 0, 0, 0, 1, 1,
-0.4165401, 1.170718, 0.1783473, 0, 0, 0, 1, 1,
-0.4149644, -0.4290312, -1.558931, 0, 0, 0, 1, 1,
-0.4076852, 2.796149, 0.03211656, 0, 0, 0, 1, 1,
-0.407173, -0.08405667, 0.5300507, 0, 0, 0, 1, 1,
-0.4044522, 0.5553093, -0.4435189, 0, 0, 0, 1, 1,
-0.3993854, 1.168136, -2.005535, 1, 1, 1, 1, 1,
-0.3984361, 2.15323, -0.2820276, 1, 1, 1, 1, 1,
-0.3978112, 0.4155235, -0.4014181, 1, 1, 1, 1, 1,
-0.3973781, 0.01008278, -1.320137, 1, 1, 1, 1, 1,
-0.3967993, -0.1719617, -1.278695, 1, 1, 1, 1, 1,
-0.3923553, 1.438887, 0.7331272, 1, 1, 1, 1, 1,
-0.3893909, 2.104789, 1.025868, 1, 1, 1, 1, 1,
-0.3874254, -0.5372989, -4.496928, 1, 1, 1, 1, 1,
-0.3848059, -0.222256, -3.860495, 1, 1, 1, 1, 1,
-0.3677331, 0.5616588, -0.01003455, 1, 1, 1, 1, 1,
-0.3670552, 0.1847359, 0.09103759, 1, 1, 1, 1, 1,
-0.3574476, -0.9790818, -3.216837, 1, 1, 1, 1, 1,
-0.3534003, 0.4383374, 0.05841082, 1, 1, 1, 1, 1,
-0.3533349, -0.8092553, -2.253857, 1, 1, 1, 1, 1,
-0.3497277, 0.1093058, -1.77307, 1, 1, 1, 1, 1,
-0.3446248, -1.117596, -3.518384, 0, 0, 1, 1, 1,
-0.3427346, 1.237, 0.6768571, 1, 0, 0, 1, 1,
-0.3425494, 0.04758077, -0.2152222, 1, 0, 0, 1, 1,
-0.3344063, -2.135162, -2.68657, 1, 0, 0, 1, 1,
-0.3312213, 0.6509151, -0.2959876, 1, 0, 0, 1, 1,
-0.3249291, -1.589173, -1.334193, 1, 0, 0, 1, 1,
-0.3244511, -1.522798, -4.248695, 0, 0, 0, 1, 1,
-0.3236428, 0.6423436, -0.8607531, 0, 0, 0, 1, 1,
-0.3231265, -1.275665, -1.993184, 0, 0, 0, 1, 1,
-0.3231216, -1.171237, -2.303973, 0, 0, 0, 1, 1,
-0.3212485, 1.165372, 0.7318199, 0, 0, 0, 1, 1,
-0.3146566, 1.192477, 0.2131228, 0, 0, 0, 1, 1,
-0.3142856, 3.543595, 0.6555061, 0, 0, 0, 1, 1,
-0.3111825, 2.754097, -0.7564173, 1, 1, 1, 1, 1,
-0.3108901, 0.8514413, 0.2639748, 1, 1, 1, 1, 1,
-0.3085387, -1.273883, -2.992539, 1, 1, 1, 1, 1,
-0.3058982, 0.4429, -0.9804304, 1, 1, 1, 1, 1,
-0.3025056, 0.05170919, -0.5617974, 1, 1, 1, 1, 1,
-0.2982387, -0.9690395, -4.482552, 1, 1, 1, 1, 1,
-0.2977433, 0.9304104, -0.6935958, 1, 1, 1, 1, 1,
-0.2951797, -0.1468994, -2.312956, 1, 1, 1, 1, 1,
-0.2823492, 1.551042, 1.733078, 1, 1, 1, 1, 1,
-0.2806986, -0.1938213, -1.245616, 1, 1, 1, 1, 1,
-0.2762806, 0.295514, -0.475639, 1, 1, 1, 1, 1,
-0.275332, -0.338169, -1.742573, 1, 1, 1, 1, 1,
-0.2720881, 0.1805665, 0.2362587, 1, 1, 1, 1, 1,
-0.2620239, 1.112992, 0.2845621, 1, 1, 1, 1, 1,
-0.2614176, 0.8325731, 0.6271082, 1, 1, 1, 1, 1,
-0.2581992, -1.776977, -3.131462, 0, 0, 1, 1, 1,
-0.2554446, -0.1312354, -1.806377, 1, 0, 0, 1, 1,
-0.254211, -0.7724687, -3.605939, 1, 0, 0, 1, 1,
-0.2535916, 1.179227, -0.7358841, 1, 0, 0, 1, 1,
-0.2362944, 0.488441, 0.1103462, 1, 0, 0, 1, 1,
-0.2348903, 0.6832077, -0.03656836, 1, 0, 0, 1, 1,
-0.231696, -0.7831435, -2.020066, 0, 0, 0, 1, 1,
-0.2296228, -1.853051, -2.406049, 0, 0, 0, 1, 1,
-0.2285876, -0.3601796, -1.556254, 0, 0, 0, 1, 1,
-0.2254444, -1.157005, -4.701301, 0, 0, 0, 1, 1,
-0.2241477, 0.647657, 0.03318894, 0, 0, 0, 1, 1,
-0.2177151, -0.1969251, -2.562954, 0, 0, 0, 1, 1,
-0.2137132, -0.339257, -2.602427, 0, 0, 0, 1, 1,
-0.2132351, -0.5011299, -2.223399, 1, 1, 1, 1, 1,
-0.2128375, 1.081428, -0.5803221, 1, 1, 1, 1, 1,
-0.2116549, -0.8771828, -3.553149, 1, 1, 1, 1, 1,
-0.2112411, -0.4863419, -3.22676, 1, 1, 1, 1, 1,
-0.2058659, 1.019065, -1.672523, 1, 1, 1, 1, 1,
-0.2052119, 0.5640855, 0.4268852, 1, 1, 1, 1, 1,
-0.2044801, 0.1664443, -1.373483, 1, 1, 1, 1, 1,
-0.2031005, 1.226859, 1.118736, 1, 1, 1, 1, 1,
-0.2003543, 0.8778206, -0.7312946, 1, 1, 1, 1, 1,
-0.2001189, 1.662596, -0.5380338, 1, 1, 1, 1, 1,
-0.197728, -0.06907403, -2.11159, 1, 1, 1, 1, 1,
-0.197475, 1.00212, 0.4348336, 1, 1, 1, 1, 1,
-0.1898531, -0.7992885, -2.847805, 1, 1, 1, 1, 1,
-0.1894394, 0.5781096, -0.9957319, 1, 1, 1, 1, 1,
-0.1877081, 0.07454488, -3.608459, 1, 1, 1, 1, 1,
-0.1826042, 0.2802612, -0.4689503, 0, 0, 1, 1, 1,
-0.1783429, 1.666481, -2.939659, 1, 0, 0, 1, 1,
-0.1774195, -0.7385439, -2.982753, 1, 0, 0, 1, 1,
-0.1728049, 0.4036337, 0.5516976, 1, 0, 0, 1, 1,
-0.1718769, -0.9232575, -3.683848, 1, 0, 0, 1, 1,
-0.1717639, 1.75189, 0.5928291, 1, 0, 0, 1, 1,
-0.1686471, -0.7316576, -3.225895, 0, 0, 0, 1, 1,
-0.1621446, -2.149113, -4.531, 0, 0, 0, 1, 1,
-0.1615319, -1.114194, -2.0927, 0, 0, 0, 1, 1,
-0.1569573, 0.3269887, -0.9939575, 0, 0, 0, 1, 1,
-0.1567445, -1.275874, -3.566339, 0, 0, 0, 1, 1,
-0.1561639, 0.2838722, -1.107652, 0, 0, 0, 1, 1,
-0.1560017, -0.05025071, -3.048748, 0, 0, 0, 1, 1,
-0.1552836, 0.9905719, 0.5484652, 1, 1, 1, 1, 1,
-0.1552417, 0.5003785, -1.543232, 1, 1, 1, 1, 1,
-0.1485975, -0.2844559, -2.886502, 1, 1, 1, 1, 1,
-0.147455, -0.8274263, -1.881701, 1, 1, 1, 1, 1,
-0.1462822, -2.024553, -2.849262, 1, 1, 1, 1, 1,
-0.1410533, -0.1340496, -0.3174222, 1, 1, 1, 1, 1,
-0.1400245, -0.9456604, -2.180173, 1, 1, 1, 1, 1,
-0.1338775, -0.4854413, -3.347363, 1, 1, 1, 1, 1,
-0.1318006, 0.64851, -0.9937422, 1, 1, 1, 1, 1,
-0.1311646, 0.2324762, -0.2079282, 1, 1, 1, 1, 1,
-0.129884, 0.5734496, -0.8646264, 1, 1, 1, 1, 1,
-0.1269069, -0.7207865, -2.24007, 1, 1, 1, 1, 1,
-0.1233773, 0.8797258, 0.2393145, 1, 1, 1, 1, 1,
-0.1229421, 0.8166223, -0.3056937, 1, 1, 1, 1, 1,
-0.1161266, 0.9253419, 1.402181, 1, 1, 1, 1, 1,
-0.1159359, -0.8468766, -2.812842, 0, 0, 1, 1, 1,
-0.1100679, 0.1748487, -0.7424525, 1, 0, 0, 1, 1,
-0.1085223, -0.7704895, -0.934652, 1, 0, 0, 1, 1,
-0.1070898, 0.6848642, 1.022195, 1, 0, 0, 1, 1,
-0.106055, -0.2497833, -2.947557, 1, 0, 0, 1, 1,
-0.1054387, -1.370105, -4.883133, 1, 0, 0, 1, 1,
-0.09662089, -0.532776, -2.473005, 0, 0, 0, 1, 1,
-0.09062912, -0.2762745, -2.20248, 0, 0, 0, 1, 1,
-0.08193892, -0.6064804, -4.55862, 0, 0, 0, 1, 1,
-0.08031646, 2.054383, -0.1613245, 0, 0, 0, 1, 1,
-0.07802942, 1.101419, 0.146425, 0, 0, 0, 1, 1,
-0.07739754, 0.6133646, 0.4241141, 0, 0, 0, 1, 1,
-0.07733208, -0.2166231, -1.202731, 0, 0, 0, 1, 1,
-0.07382894, -0.405254, -0.8115553, 1, 1, 1, 1, 1,
-0.07360373, -0.2623222, -2.694826, 1, 1, 1, 1, 1,
-0.06670579, -0.6354271, -4.966872, 1, 1, 1, 1, 1,
-0.06482767, 0.5536976, 2.02357, 1, 1, 1, 1, 1,
-0.06411231, -0.25535, -2.151061, 1, 1, 1, 1, 1,
-0.06392762, 1.623201, 0.2908774, 1, 1, 1, 1, 1,
-0.06223947, 0.8009546, -0.01350732, 1, 1, 1, 1, 1,
-0.06222959, 0.2288992, 0.2444579, 1, 1, 1, 1, 1,
-0.06142028, -0.9636119, -2.389301, 1, 1, 1, 1, 1,
-0.06067457, -0.1789915, -3.170506, 1, 1, 1, 1, 1,
-0.05824764, -0.5896212, -3.151969, 1, 1, 1, 1, 1,
-0.05504335, -0.4841491, -3.771352, 1, 1, 1, 1, 1,
-0.05311847, -0.03452386, -2.557353, 1, 1, 1, 1, 1,
-0.04939575, 0.9388155, -0.5706443, 1, 1, 1, 1, 1,
-0.04825006, -1.820856, -4.82756, 1, 1, 1, 1, 1,
-0.04216071, -0.7919086, -4.92639, 0, 0, 1, 1, 1,
-0.03972156, 0.3757218, -1.227265, 1, 0, 0, 1, 1,
-0.03453356, -1.403283, -1.070493, 1, 0, 0, 1, 1,
-0.03439285, -0.9513507, -4.247943, 1, 0, 0, 1, 1,
-0.03300078, -0.6858337, -2.618076, 1, 0, 0, 1, 1,
-0.02996684, 0.4067489, -0.7177576, 1, 0, 0, 1, 1,
-0.027242, 0.06880848, -2.016735, 0, 0, 0, 1, 1,
-0.02585341, -0.1617491, -2.050127, 0, 0, 0, 1, 1,
-0.02128505, -1.440007, -5.250705, 0, 0, 0, 1, 1,
-0.02005754, -2.187048, -4.115053, 0, 0, 0, 1, 1,
-0.01144412, -1.988178, -2.463524, 0, 0, 0, 1, 1,
-0.01002849, -1.268077, -2.11632, 0, 0, 0, 1, 1,
-0.005359792, 0.4352067, 0.4379474, 0, 0, 0, 1, 1,
-0.004109043, 1.675644, -0.1623814, 1, 1, 1, 1, 1,
-0.002072472, -1.796914, -3.019845, 1, 1, 1, 1, 1,
-0.001982884, 1.184813, 0.2293181, 1, 1, 1, 1, 1,
0.004925655, 1.721238, -0.2426479, 1, 1, 1, 1, 1,
0.009705575, -0.1062343, 3.279314, 1, 1, 1, 1, 1,
0.011333, 0.194082, 0.04722143, 1, 1, 1, 1, 1,
0.01331264, 1.11312, -0.568225, 1, 1, 1, 1, 1,
0.01433412, 1.025006, -0.1381517, 1, 1, 1, 1, 1,
0.01578844, 1.008191, -1.681407, 1, 1, 1, 1, 1,
0.01674169, 0.6969709, 0.7920982, 1, 1, 1, 1, 1,
0.01694944, -0.7915858, 1.444998, 1, 1, 1, 1, 1,
0.02050881, -1.224518, 5.225848, 1, 1, 1, 1, 1,
0.02075847, 1.07903, 0.1966793, 1, 1, 1, 1, 1,
0.02393849, -0.264342, 4.555616, 1, 1, 1, 1, 1,
0.02571675, -1.097771, 3.659882, 1, 1, 1, 1, 1,
0.02997734, -1.466699, 2.078884, 0, 0, 1, 1, 1,
0.0301071, -0.5681118, 3.024238, 1, 0, 0, 1, 1,
0.03223494, 1.342348, 1.510053, 1, 0, 0, 1, 1,
0.03266272, 0.4124022, 0.814391, 1, 0, 0, 1, 1,
0.04377936, -0.7579303, 3.666288, 1, 0, 0, 1, 1,
0.04554668, -2.068619, 2.755648, 1, 0, 0, 1, 1,
0.04763445, -0.4273685, 2.319781, 0, 0, 0, 1, 1,
0.048138, 1.765305, 0.2853269, 0, 0, 0, 1, 1,
0.04878569, -0.01753644, 1.163631, 0, 0, 0, 1, 1,
0.04986756, 1.686795, -0.7477026, 0, 0, 0, 1, 1,
0.05012652, 0.9668286, 1.13756, 0, 0, 0, 1, 1,
0.05036442, 0.5022862, -1.198997, 0, 0, 0, 1, 1,
0.05316626, 0.1890167, 1.698946, 0, 0, 0, 1, 1,
0.05359806, 1.953878, -0.7152221, 1, 1, 1, 1, 1,
0.0553006, 0.6443571, 0.3019793, 1, 1, 1, 1, 1,
0.0573527, -0.9276686, 2.343237, 1, 1, 1, 1, 1,
0.06153482, 0.05873122, 0.634247, 1, 1, 1, 1, 1,
0.06210592, 0.7832065, 0.6975567, 1, 1, 1, 1, 1,
0.06424433, -0.4588626, 2.765351, 1, 1, 1, 1, 1,
0.06781477, 0.8135445, -0.2671536, 1, 1, 1, 1, 1,
0.06904126, -0.07659266, 1.366724, 1, 1, 1, 1, 1,
0.07047747, 0.9411687, 0.955377, 1, 1, 1, 1, 1,
0.07407453, -0.9003016, 4.567824, 1, 1, 1, 1, 1,
0.07476287, -0.9177874, 2.949196, 1, 1, 1, 1, 1,
0.0777548, 1.016352, -0.7772629, 1, 1, 1, 1, 1,
0.07967321, -1.418661, 1.342124, 1, 1, 1, 1, 1,
0.08555741, -0.970858, 1.673298, 1, 1, 1, 1, 1,
0.08674055, 1.370445, 0.1317996, 1, 1, 1, 1, 1,
0.08872101, 0.6506088, 0.2932748, 0, 0, 1, 1, 1,
0.09041061, 0.4242632, 0.0352246, 1, 0, 0, 1, 1,
0.09123863, 1.168542, 1.880342, 1, 0, 0, 1, 1,
0.09127554, 0.08430571, -0.708106, 1, 0, 0, 1, 1,
0.09238005, -2.245017, 2.591463, 1, 0, 0, 1, 1,
0.09620025, 0.444723, 0.1220377, 1, 0, 0, 1, 1,
0.09720963, -2.15124, 2.927568, 0, 0, 0, 1, 1,
0.1003086, -0.4251488, 1.080701, 0, 0, 0, 1, 1,
0.100666, 1.590786, 1.124676, 0, 0, 0, 1, 1,
0.1021195, 0.5579001, -1.043579, 0, 0, 0, 1, 1,
0.1049309, 0.3977058, -1.341952, 0, 0, 0, 1, 1,
0.1053845, -0.5484772, 1.785163, 0, 0, 0, 1, 1,
0.1075061, -0.0362126, 1.288127, 0, 0, 0, 1, 1,
0.1081972, 0.1142442, 0.06579088, 1, 1, 1, 1, 1,
0.1137418, 0.8447315, -0.1883551, 1, 1, 1, 1, 1,
0.1146205, 0.3707119, 0.8090485, 1, 1, 1, 1, 1,
0.1225337, 2.038785, -1.446793, 1, 1, 1, 1, 1,
0.1239046, -0.9284011, 6.571666, 1, 1, 1, 1, 1,
0.1240213, 0.4878117, -0.4787163, 1, 1, 1, 1, 1,
0.1249194, -0.008954561, 0.4117783, 1, 1, 1, 1, 1,
0.1264738, -0.3345802, 3.953939, 1, 1, 1, 1, 1,
0.13153, 0.9842356, 0.3026063, 1, 1, 1, 1, 1,
0.1337072, -0.7946937, 2.512448, 1, 1, 1, 1, 1,
0.1361127, -1.017736, 2.90433, 1, 1, 1, 1, 1,
0.1378833, -0.02548025, -0.1239825, 1, 1, 1, 1, 1,
0.1393023, 0.2998799, -0.9659744, 1, 1, 1, 1, 1,
0.1416692, 1.189211, 0.06486032, 1, 1, 1, 1, 1,
0.1418585, 0.1068954, 1.074124, 1, 1, 1, 1, 1,
0.1418638, 1.834046, -0.9796801, 0, 0, 1, 1, 1,
0.1455934, 0.1028366, 2.071625, 1, 0, 0, 1, 1,
0.1497351, -0.752607, 1.866304, 1, 0, 0, 1, 1,
0.1503618, -0.4639205, 3.702734, 1, 0, 0, 1, 1,
0.1512354, 0.2095845, 1.350074, 1, 0, 0, 1, 1,
0.1528901, -0.3627844, 2.141749, 1, 0, 0, 1, 1,
0.1536945, -1.358076, 3.041587, 0, 0, 0, 1, 1,
0.154687, -1.231167, 3.93406, 0, 0, 0, 1, 1,
0.1559541, 1.590339, 1.550508, 0, 0, 0, 1, 1,
0.1608736, -1.158649, 3.206412, 0, 0, 0, 1, 1,
0.165413, 1.19232, 1.052567, 0, 0, 0, 1, 1,
0.1680174, 0.6892331, 1.719515, 0, 0, 0, 1, 1,
0.1696883, 1.102812, -1.110556, 0, 0, 0, 1, 1,
0.1699409, 2.404917, -0.2283212, 1, 1, 1, 1, 1,
0.1699895, 0.7050631, -0.1890323, 1, 1, 1, 1, 1,
0.1754588, -1.302153, 3.668603, 1, 1, 1, 1, 1,
0.1765468, -1.237399, 2.616482, 1, 1, 1, 1, 1,
0.178412, 0.5684096, 0.4218503, 1, 1, 1, 1, 1,
0.1817965, 0.1901861, 0.5486721, 1, 1, 1, 1, 1,
0.1865145, -0.5421863, 1.664801, 1, 1, 1, 1, 1,
0.1924131, -1.501713, 1.580451, 1, 1, 1, 1, 1,
0.1940278, -0.2863502, 1.456571, 1, 1, 1, 1, 1,
0.1943908, -0.3565139, 2.674205, 1, 1, 1, 1, 1,
0.201811, -0.7199074, 4.81047, 1, 1, 1, 1, 1,
0.2057358, -2.784713, 3.7997, 1, 1, 1, 1, 1,
0.2116282, -0.6800083, 2.18911, 1, 1, 1, 1, 1,
0.2135962, -0.720631, 3.521786, 1, 1, 1, 1, 1,
0.2139537, -1.094565, 2.892945, 1, 1, 1, 1, 1,
0.2139548, -0.5450636, 1.445527, 0, 0, 1, 1, 1,
0.2147529, 0.4203849, 0.02314949, 1, 0, 0, 1, 1,
0.2177814, -0.4326828, -0.515968, 1, 0, 0, 1, 1,
0.2180829, 2.043511, 0.8272593, 1, 0, 0, 1, 1,
0.2247855, 1.02103, 0.3998504, 1, 0, 0, 1, 1,
0.2258703, 1.589704, 1.706951, 1, 0, 0, 1, 1,
0.2273162, -0.6846399, 3.377984, 0, 0, 0, 1, 1,
0.2281746, -0.3002491, 3.085795, 0, 0, 0, 1, 1,
0.2383612, -0.4085766, 2.892634, 0, 0, 0, 1, 1,
0.2409536, -0.5081483, 3.41035, 0, 0, 0, 1, 1,
0.2417018, 0.1227054, 0.3663746, 0, 0, 0, 1, 1,
0.2430891, 0.2117772, -1.082887, 0, 0, 0, 1, 1,
0.2447838, 0.06073222, 1.670245, 0, 0, 0, 1, 1,
0.2457479, 2.56785, 0.6299853, 1, 1, 1, 1, 1,
0.249695, -0.1965338, 0.1159794, 1, 1, 1, 1, 1,
0.251446, 1.287281, -1.291887, 1, 1, 1, 1, 1,
0.2538495, -0.8281764, 1.958311, 1, 1, 1, 1, 1,
0.2571388, -1.119128, 3.133513, 1, 1, 1, 1, 1,
0.2573654, 0.4435284, -0.3959421, 1, 1, 1, 1, 1,
0.2581761, -0.3332809, 2.310008, 1, 1, 1, 1, 1,
0.2586718, 0.5640592, 0.1678739, 1, 1, 1, 1, 1,
0.2660246, 1.364875, 0.387143, 1, 1, 1, 1, 1,
0.2678157, -0.8468178, 3.959532, 1, 1, 1, 1, 1,
0.2694202, -1.399477, 3.323465, 1, 1, 1, 1, 1,
0.2740873, 0.8356443, 1.524088, 1, 1, 1, 1, 1,
0.2749052, -0.1759297, 2.413721, 1, 1, 1, 1, 1,
0.2762769, -1.110424, 2.99809, 1, 1, 1, 1, 1,
0.2843571, -0.6484622, 5.330281, 1, 1, 1, 1, 1,
0.2883016, 0.7679355, 0.9912726, 0, 0, 1, 1, 1,
0.289295, 1.065551, 0.8300275, 1, 0, 0, 1, 1,
0.2924662, -0.8068134, 3.875593, 1, 0, 0, 1, 1,
0.2944162, 0.8728994, -0.4182125, 1, 0, 0, 1, 1,
0.2954301, 0.72493, 0.3841836, 1, 0, 0, 1, 1,
0.2958182, -1.388119, 3.730002, 1, 0, 0, 1, 1,
0.2964029, -0.9482025, 4.51694, 0, 0, 0, 1, 1,
0.2994913, -0.9164292, 2.262401, 0, 0, 0, 1, 1,
0.3012585, -0.3612721, 2.04131, 0, 0, 0, 1, 1,
0.3124538, 0.2714116, 1.812109, 0, 0, 0, 1, 1,
0.3168294, -0.6974131, 3.073485, 0, 0, 0, 1, 1,
0.3179436, 0.8623173, 0.8149117, 0, 0, 0, 1, 1,
0.3189503, 0.6170883, 1.571642, 0, 0, 0, 1, 1,
0.3195013, 0.23025, 1.062486, 1, 1, 1, 1, 1,
0.3237171, 1.04374, 1.867128, 1, 1, 1, 1, 1,
0.3245183, 0.2366685, 0.6289217, 1, 1, 1, 1, 1,
0.3285142, -0.612202, 0.5676001, 1, 1, 1, 1, 1,
0.3307801, 0.7116669, 1.848426, 1, 1, 1, 1, 1,
0.3336662, 1.374419, 1.360447, 1, 1, 1, 1, 1,
0.3352709, -0.2095271, 4.042197, 1, 1, 1, 1, 1,
0.3494572, -1.712204, 2.266848, 1, 1, 1, 1, 1,
0.3516769, 0.09752341, 1.936504, 1, 1, 1, 1, 1,
0.3563288, 0.2666674, 1.298346, 1, 1, 1, 1, 1,
0.3578866, -0.2056387, 2.069276, 1, 1, 1, 1, 1,
0.3657959, -0.7481781, 1.999402, 1, 1, 1, 1, 1,
0.3684217, 0.2195937, -0.2958647, 1, 1, 1, 1, 1,
0.3688221, -0.9134796, 4.463377, 1, 1, 1, 1, 1,
0.3690317, 1.181847, 1.250723, 1, 1, 1, 1, 1,
0.3690803, 0.001514529, 1.267179, 0, 0, 1, 1, 1,
0.3695852, -1.717061, 2.830504, 1, 0, 0, 1, 1,
0.3705518, 0.8984039, -0.3374678, 1, 0, 0, 1, 1,
0.3761521, 0.9879931, 1.512044, 1, 0, 0, 1, 1,
0.3772922, 0.04541791, 2.251222, 1, 0, 0, 1, 1,
0.3825141, 0.5136233, 1.050878, 1, 0, 0, 1, 1,
0.3842917, -0.8256059, 3.181778, 0, 0, 0, 1, 1,
0.3850497, 0.3426619, -0.9298007, 0, 0, 0, 1, 1,
0.3855236, 1.502767, -0.1069048, 0, 0, 0, 1, 1,
0.3862173, 0.4732621, 1.196266, 0, 0, 0, 1, 1,
0.3872932, 0.3684308, 0.2924876, 0, 0, 0, 1, 1,
0.3884251, -1.130345, 4.842711, 0, 0, 0, 1, 1,
0.396953, -1.122713, 2.033473, 0, 0, 0, 1, 1,
0.3981673, 0.9407178, -0.1762964, 1, 1, 1, 1, 1,
0.400478, -0.5155292, 2.374382, 1, 1, 1, 1, 1,
0.4011305, 0.7847793, 1.783556, 1, 1, 1, 1, 1,
0.4012339, -0.6074305, 2.020656, 1, 1, 1, 1, 1,
0.4040183, 0.1530734, 2.67341, 1, 1, 1, 1, 1,
0.4052553, 0.1508496, 1.130518, 1, 1, 1, 1, 1,
0.4071302, -1.162915, 1.098526, 1, 1, 1, 1, 1,
0.4116724, -0.1925285, 0.4021602, 1, 1, 1, 1, 1,
0.4120422, 0.8729281, -0.4769468, 1, 1, 1, 1, 1,
0.4127017, -0.7749625, 3.002015, 1, 1, 1, 1, 1,
0.4268352, -0.5125987, 0.6857421, 1, 1, 1, 1, 1,
0.4303114, -0.05751153, 1.16426, 1, 1, 1, 1, 1,
0.432184, -0.9465498, 1.43045, 1, 1, 1, 1, 1,
0.4326533, 0.04653983, 1.675485, 1, 1, 1, 1, 1,
0.433337, 0.7433794, -0.04082413, 1, 1, 1, 1, 1,
0.4342609, -1.183814, 3.583677, 0, 0, 1, 1, 1,
0.4382394, 0.002236587, 2.250256, 1, 0, 0, 1, 1,
0.4385047, 1.832055, -0.4535445, 1, 0, 0, 1, 1,
0.4412895, 0.7540922, 0.6613946, 1, 0, 0, 1, 1,
0.442439, 1.619548, 0.6136928, 1, 0, 0, 1, 1,
0.4469673, -0.3962524, 2.868726, 1, 0, 0, 1, 1,
0.4478261, -1.164451, 3.584848, 0, 0, 0, 1, 1,
0.449112, 0.8064585, 1.131428, 0, 0, 0, 1, 1,
0.4524617, 1.792197, 0.3006294, 0, 0, 0, 1, 1,
0.4560772, 1.684223, -1.696593, 0, 0, 0, 1, 1,
0.4565622, -0.6070765, 1.702233, 0, 0, 0, 1, 1,
0.4698134, -1.001026, 3.71194, 0, 0, 0, 1, 1,
0.4727958, -1.891009, 2.83973, 0, 0, 0, 1, 1,
0.4748099, 1.429837, 0.4159861, 1, 1, 1, 1, 1,
0.4752371, 1.166695, 0.4373153, 1, 1, 1, 1, 1,
0.4787682, -0.1755055, 1.39857, 1, 1, 1, 1, 1,
0.481785, 0.1196104, 1.646551, 1, 1, 1, 1, 1,
0.4867177, 1.810164, 0.3048954, 1, 1, 1, 1, 1,
0.4874301, 0.005812509, 0.9949232, 1, 1, 1, 1, 1,
0.4899247, -1.401996, 1.678634, 1, 1, 1, 1, 1,
0.4901067, -1.473354, 2.857351, 1, 1, 1, 1, 1,
0.4914646, 0.8255112, -1.492503, 1, 1, 1, 1, 1,
0.4935232, -0.590625, 4.23315, 1, 1, 1, 1, 1,
0.4947848, 1.297348, -0.1267108, 1, 1, 1, 1, 1,
0.500325, -1.476424, 2.395828, 1, 1, 1, 1, 1,
0.511269, -0.7532673, 1.575925, 1, 1, 1, 1, 1,
0.5133496, 0.07303932, 1.802028, 1, 1, 1, 1, 1,
0.5140973, -0.03240104, -1.088257, 1, 1, 1, 1, 1,
0.5152967, -0.4940387, 4.5778, 0, 0, 1, 1, 1,
0.5165495, 0.1790123, 0.2992294, 1, 0, 0, 1, 1,
0.5231966, -0.3740609, 0.8982182, 1, 0, 0, 1, 1,
0.5249258, -0.4839603, 2.1338, 1, 0, 0, 1, 1,
0.5251037, 0.2045903, 0.4396899, 1, 0, 0, 1, 1,
0.5290038, -1.015852, 1.636102, 1, 0, 0, 1, 1,
0.5322599, 0.3370747, 1.959421, 0, 0, 0, 1, 1,
0.5323655, 0.03061355, 1.145331, 0, 0, 0, 1, 1,
0.5396553, -1.141426, 1.451097, 0, 0, 0, 1, 1,
0.5405639, -1.22968, 1.592357, 0, 0, 0, 1, 1,
0.5417842, 1.600204, 0.5794059, 0, 0, 0, 1, 1,
0.5450771, -0.8111334, 3.372249, 0, 0, 0, 1, 1,
0.5522646, -0.5836913, 1.805973, 0, 0, 0, 1, 1,
0.5522975, -1.149839, 3.694727, 1, 1, 1, 1, 1,
0.5565742, -0.05367511, 3.363006, 1, 1, 1, 1, 1,
0.5598905, 0.1514556, 2.321959, 1, 1, 1, 1, 1,
0.5676468, 0.9891371, -1.489893, 1, 1, 1, 1, 1,
0.5699061, -0.8410401, 2.477635, 1, 1, 1, 1, 1,
0.5710629, -0.3626208, 1.03064, 1, 1, 1, 1, 1,
0.5765015, 0.9296421, 0.6158629, 1, 1, 1, 1, 1,
0.5767379, 0.9520053, 0.34172, 1, 1, 1, 1, 1,
0.5833635, 0.2674489, 0.5846443, 1, 1, 1, 1, 1,
0.586353, 0.6259854, 1.100546, 1, 1, 1, 1, 1,
0.5899242, 0.4246662, 3.34969, 1, 1, 1, 1, 1,
0.5909647, -1.476244, 3.372856, 1, 1, 1, 1, 1,
0.5915033, 2.043884, 0.4507853, 1, 1, 1, 1, 1,
0.5927175, -1.259867, 2.555508, 1, 1, 1, 1, 1,
0.5939943, 1.151876, 0.0530997, 1, 1, 1, 1, 1,
0.6024245, 0.6000295, 0.803499, 0, 0, 1, 1, 1,
0.6024347, -0.9844559, 3.737058, 1, 0, 0, 1, 1,
0.6038786, 2.560369, 1.906105, 1, 0, 0, 1, 1,
0.605902, 1.460581, 0.8716668, 1, 0, 0, 1, 1,
0.6114889, -0.4184338, 1.798952, 1, 0, 0, 1, 1,
0.6149698, -0.3308409, 1.623261, 1, 0, 0, 1, 1,
0.6182009, -3.418276, 2.747929, 0, 0, 0, 1, 1,
0.6206268, 0.5087344, 1.314258, 0, 0, 0, 1, 1,
0.6232855, 0.480103, -0.01377009, 0, 0, 0, 1, 1,
0.6268471, -0.9847081, 3.150554, 0, 0, 0, 1, 1,
0.6318427, -0.5466917, 1.850855, 0, 0, 0, 1, 1,
0.6375933, -0.7649249, 2.898952, 0, 0, 0, 1, 1,
0.637999, -0.8006827, 3.644857, 0, 0, 0, 1, 1,
0.6458507, -0.9422577, 1.564932, 1, 1, 1, 1, 1,
0.646884, -0.1295134, 1.301161, 1, 1, 1, 1, 1,
0.6498246, -0.9860546, 3.448277, 1, 1, 1, 1, 1,
0.6512505, -0.4948765, 1.842588, 1, 1, 1, 1, 1,
0.6591505, 1.335882, 0.2112516, 1, 1, 1, 1, 1,
0.6595622, 1.748343, -1.02661, 1, 1, 1, 1, 1,
0.6669518, -0.5035189, 1.657035, 1, 1, 1, 1, 1,
0.6733353, 1.873022, 1.383582, 1, 1, 1, 1, 1,
0.6756757, -0.0650738, 0.03560746, 1, 1, 1, 1, 1,
0.685441, 1.116057, 0.6960541, 1, 1, 1, 1, 1,
0.688297, 0.201334, 1.378187, 1, 1, 1, 1, 1,
0.6886984, 0.8488442, 0.7089786, 1, 1, 1, 1, 1,
0.6888547, 1.471045, 0.2541317, 1, 1, 1, 1, 1,
0.6894776, 0.4486619, 1.516726, 1, 1, 1, 1, 1,
0.6898648, -0.4556762, 2.539956, 1, 1, 1, 1, 1,
0.6901066, 0.4032057, -0.4314038, 0, 0, 1, 1, 1,
0.691803, 0.3772029, 1.522541, 1, 0, 0, 1, 1,
0.6924161, -1.003219, 0.6646162, 1, 0, 0, 1, 1,
0.6935545, -0.2296289, 2.695251, 1, 0, 0, 1, 1,
0.6974017, 0.08262782, 1.956585, 1, 0, 0, 1, 1,
0.6998125, 0.9515226, -0.1511368, 1, 0, 0, 1, 1,
0.7036691, 1.222563, 0.8959947, 0, 0, 0, 1, 1,
0.7057809, 1.53506, 0.02185937, 0, 0, 0, 1, 1,
0.7091812, -0.1123996, 2.917761, 0, 0, 0, 1, 1,
0.7102556, 0.3422822, 1.01254, 0, 0, 0, 1, 1,
0.7111477, -0.2686481, 1.931055, 0, 0, 0, 1, 1,
0.7204619, -0.6375403, 1.707509, 0, 0, 0, 1, 1,
0.7270781, 0.4757091, 1.594802, 0, 0, 0, 1, 1,
0.728609, 0.8226376, 0.4435345, 1, 1, 1, 1, 1,
0.7288836, 1.354366, 0.3706873, 1, 1, 1, 1, 1,
0.7294353, -1.14242, 1.966129, 1, 1, 1, 1, 1,
0.7409692, -0.7291503, 1.449636, 1, 1, 1, 1, 1,
0.7427828, 1.163369, 0.1586336, 1, 1, 1, 1, 1,
0.7447526, -0.2318287, 4.269673, 1, 1, 1, 1, 1,
0.7452189, 1.459657, 0.3689345, 1, 1, 1, 1, 1,
0.7461938, -0.0999456, 1.538639, 1, 1, 1, 1, 1,
0.746596, 0.3149203, 0.1177524, 1, 1, 1, 1, 1,
0.7523286, 0.1017398, 1.815389, 1, 1, 1, 1, 1,
0.7580862, 1.44129, 1.388708, 1, 1, 1, 1, 1,
0.7702803, 1.958369, 0.2919124, 1, 1, 1, 1, 1,
0.7773113, -0.1235177, 1.711767, 1, 1, 1, 1, 1,
0.7776346, 0.2240193, 3.461615, 1, 1, 1, 1, 1,
0.7788243, 0.1867046, 0.6678154, 1, 1, 1, 1, 1,
0.7814471, 0.1589311, -0.09095582, 0, 0, 1, 1, 1,
0.78764, 1.226846, -0.06676894, 1, 0, 0, 1, 1,
0.7967181, 1.024466, 0.1656386, 1, 0, 0, 1, 1,
0.7995574, 0.6032944, 2.202375, 1, 0, 0, 1, 1,
0.8025746, 2.114448, 0.9556057, 1, 0, 0, 1, 1,
0.8042014, 1.054383, 0.4749916, 1, 0, 0, 1, 1,
0.8088076, -1.176866, 2.303345, 0, 0, 0, 1, 1,
0.8133194, -0.7037739, 3.058437, 0, 0, 0, 1, 1,
0.814694, -1.799893, 2.696598, 0, 0, 0, 1, 1,
0.8167437, -2.512167, 2.612693, 0, 0, 0, 1, 1,
0.8179449, 0.04261437, 1.374159, 0, 0, 0, 1, 1,
0.8230506, -0.7439301, 3.005154, 0, 0, 0, 1, 1,
0.8388318, 0.01903308, 1.217606, 0, 0, 0, 1, 1,
0.8403131, 1.411892, -1.199903, 1, 1, 1, 1, 1,
0.8408492, -1.235018, 2.549432, 1, 1, 1, 1, 1,
0.8435, 0.1231816, 1.615077, 1, 1, 1, 1, 1,
0.8536569, 1.491121, 0.354994, 1, 1, 1, 1, 1,
0.8549533, 1.329274, -0.06878853, 1, 1, 1, 1, 1,
0.8568122, 0.4395616, 1.585887, 1, 1, 1, 1, 1,
0.8588591, 0.9821978, 1.946992, 1, 1, 1, 1, 1,
0.8628469, 0.3557057, 1.049143, 1, 1, 1, 1, 1,
0.8647994, -0.1097386, 2.153549, 1, 1, 1, 1, 1,
0.8667743, -0.9975249, -0.1014519, 1, 1, 1, 1, 1,
0.8824543, -0.6481195, 0.5894999, 1, 1, 1, 1, 1,
0.8857511, -0.707225, 1.68028, 1, 1, 1, 1, 1,
0.8959424, 0.1729365, 3.032858, 1, 1, 1, 1, 1,
0.8967147, 0.2828848, 0.1505684, 1, 1, 1, 1, 1,
0.8976986, -0.1459018, -1.560515, 1, 1, 1, 1, 1,
0.9016759, -0.51884, 1.155065, 0, 0, 1, 1, 1,
0.9030904, -1.10532, 2.168314, 1, 0, 0, 1, 1,
0.9070551, -1.606486, 2.014487, 1, 0, 0, 1, 1,
0.9100624, 1.165012, 1.762761, 1, 0, 0, 1, 1,
0.9112561, 1.382172, 0.4069621, 1, 0, 0, 1, 1,
0.9119346, 1.679712, 1.718246, 1, 0, 0, 1, 1,
0.9147188, -1.773338, 2.162635, 0, 0, 0, 1, 1,
0.9160624, -0.09099974, 1.2071, 0, 0, 0, 1, 1,
0.9162717, 0.5886182, 0.4699498, 0, 0, 0, 1, 1,
0.917602, -0.3573419, 1.271694, 0, 0, 0, 1, 1,
0.9187037, 0.2431907, 1.692029, 0, 0, 0, 1, 1,
0.9256935, -0.1427156, 1.020336, 0, 0, 0, 1, 1,
0.9262738, -0.2777433, 1.922847, 0, 0, 0, 1, 1,
0.934388, -0.1225805, 2.037734, 1, 1, 1, 1, 1,
0.9427322, 0.823696, 0.7746571, 1, 1, 1, 1, 1,
0.9441853, -0.4775601, 0.7149876, 1, 1, 1, 1, 1,
0.954078, 1.376114, 0.2851632, 1, 1, 1, 1, 1,
0.9571952, -0.3411765, 0.9825004, 1, 1, 1, 1, 1,
0.9578691, 1.23284, 1.96143, 1, 1, 1, 1, 1,
0.9725364, 0.2518087, 1.40171, 1, 1, 1, 1, 1,
0.9829202, 0.3190137, 0.5064963, 1, 1, 1, 1, 1,
0.985863, 1.09957, -0.1344204, 1, 1, 1, 1, 1,
0.992338, -0.1327108, 1.947511, 1, 1, 1, 1, 1,
0.9924334, -1.390353, 1.93255, 1, 1, 1, 1, 1,
0.9925659, -2.048287, 5.020132, 1, 1, 1, 1, 1,
0.9928772, 1.058319, 2.164391, 1, 1, 1, 1, 1,
0.9934871, -0.149049, 2.598574, 1, 1, 1, 1, 1,
0.997641, 1.096815, 0.6606403, 1, 1, 1, 1, 1,
1.006782, -0.3376658, 1.174464, 0, 0, 1, 1, 1,
1.029618, 0.1723359, 0.7074328, 1, 0, 0, 1, 1,
1.034302, 0.8482749, 2.42581, 1, 0, 0, 1, 1,
1.035765, -1.411782, 2.416883, 1, 0, 0, 1, 1,
1.037327, 1.7532, -1.59352, 1, 0, 0, 1, 1,
1.038614, -0.6851242, 2.655196, 1, 0, 0, 1, 1,
1.041525, 0.1442955, 1.697283, 0, 0, 0, 1, 1,
1.049569, 2.045829, -0.05065166, 0, 0, 0, 1, 1,
1.050874, -0.8923119, 1.886621, 0, 0, 0, 1, 1,
1.064177, 0.2695619, 1.240346, 0, 0, 0, 1, 1,
1.071941, -0.5724446, 2.388526, 0, 0, 0, 1, 1,
1.076124, -1.802674, 2.0232, 0, 0, 0, 1, 1,
1.089488, -2.172133, 3.460691, 0, 0, 0, 1, 1,
1.092477, 0.3714266, 0.171264, 1, 1, 1, 1, 1,
1.100177, 0.5989364, -0.2337862, 1, 1, 1, 1, 1,
1.101983, -0.7222654, 1.303796, 1, 1, 1, 1, 1,
1.106992, 0.3126087, 1.357952, 1, 1, 1, 1, 1,
1.112532, 1.601492, 1.389016, 1, 1, 1, 1, 1,
1.113194, -0.00356182, 2.393635, 1, 1, 1, 1, 1,
1.11824, -1.051605, 2.099944, 1, 1, 1, 1, 1,
1.124633, -0.304625, 2.894494, 1, 1, 1, 1, 1,
1.129195, 0.849902, 1.581805, 1, 1, 1, 1, 1,
1.129492, -1.409566, 2.148593, 1, 1, 1, 1, 1,
1.12989, -0.215767, 0.4046091, 1, 1, 1, 1, 1,
1.133634, -0.3906896, 3.215105, 1, 1, 1, 1, 1,
1.135168, -1.278667, 3.719182, 1, 1, 1, 1, 1,
1.136193, 0.07269178, 1.813759, 1, 1, 1, 1, 1,
1.143768, -0.6858245, 1.749467, 1, 1, 1, 1, 1,
1.144012, -1.732634, 4.077389, 0, 0, 1, 1, 1,
1.147324, 0.9248751, 0.4973288, 1, 0, 0, 1, 1,
1.152714, -0.3912797, 2.839634, 1, 0, 0, 1, 1,
1.153949, -0.7805661, 1.040229, 1, 0, 0, 1, 1,
1.15638, 1.968065, -2.2791, 1, 0, 0, 1, 1,
1.157413, 0.8745387, 0.5119746, 1, 0, 0, 1, 1,
1.167106, 0.4533175, 1.915259, 0, 0, 0, 1, 1,
1.17453, -0.162594, 1.621643, 0, 0, 0, 1, 1,
1.191759, 0.7400553, 0.359429, 0, 0, 0, 1, 1,
1.209343, 1.648071, -1.405938, 0, 0, 0, 1, 1,
1.219224, 0.7407798, 2.53229, 0, 0, 0, 1, 1,
1.22501, -0.5789457, 1.72787, 0, 0, 0, 1, 1,
1.227966, -0.01111585, 1.299983, 0, 0, 0, 1, 1,
1.232604, 0.8058546, 1.279115, 1, 1, 1, 1, 1,
1.238176, 0.1577781, 0.4477884, 1, 1, 1, 1, 1,
1.244332, -0.7583548, 1.846724, 1, 1, 1, 1, 1,
1.24531, 0.2041298, 0.04390932, 1, 1, 1, 1, 1,
1.250225, 1.163505, 0.3704796, 1, 1, 1, 1, 1,
1.25731, 0.4318518, -1.116452, 1, 1, 1, 1, 1,
1.261069, -0.4731663, 1.283066, 1, 1, 1, 1, 1,
1.268507, 2.853767, 0.3415953, 1, 1, 1, 1, 1,
1.273831, 2.220673, 1.173622, 1, 1, 1, 1, 1,
1.277091, 0.4983413, 2.470074, 1, 1, 1, 1, 1,
1.277545, -0.291575, -0.4342678, 1, 1, 1, 1, 1,
1.2814, 0.7930301, 1.053862, 1, 1, 1, 1, 1,
1.290713, -0.06243291, 2.529359, 1, 1, 1, 1, 1,
1.298391, 0.4302962, 1.68159, 1, 1, 1, 1, 1,
1.303006, 0.3441227, 2.108538, 1, 1, 1, 1, 1,
1.308191, 1.333927, 1.007361, 0, 0, 1, 1, 1,
1.310042, -0.4168292, 3.256813, 1, 0, 0, 1, 1,
1.319967, -1.617285, 1.163407, 1, 0, 0, 1, 1,
1.324023, -0.09556837, 2.090702, 1, 0, 0, 1, 1,
1.325476, -0.02582246, 2.458207, 1, 0, 0, 1, 1,
1.325999, -0.1755634, 1.450201, 1, 0, 0, 1, 1,
1.327074, 0.3305529, 0.06454798, 0, 0, 0, 1, 1,
1.331179, 0.4338387, 2.310014, 0, 0, 0, 1, 1,
1.332809, 1.10121, 0.702996, 0, 0, 0, 1, 1,
1.335824, -1.521711, 1.141338, 0, 0, 0, 1, 1,
1.358096, 0.4662668, 1.444908, 0, 0, 0, 1, 1,
1.361069, 1.189503, 0.6640446, 0, 0, 0, 1, 1,
1.366289, 0.2532484, -0.21493, 0, 0, 0, 1, 1,
1.368093, -1.302489, 2.850822, 1, 1, 1, 1, 1,
1.369669, -0.5623419, 3.547025, 1, 1, 1, 1, 1,
1.37434, -0.3079872, 3.029552, 1, 1, 1, 1, 1,
1.375257, 1.937776, 2.537814, 1, 1, 1, 1, 1,
1.382035, -0.4048536, 1.98197, 1, 1, 1, 1, 1,
1.416003, 0.2469709, 2.912669, 1, 1, 1, 1, 1,
1.422533, 0.8704091, 0.3364831, 1, 1, 1, 1, 1,
1.424725, -0.01940413, 1.395277, 1, 1, 1, 1, 1,
1.433471, 0.9280817, -0.4260932, 1, 1, 1, 1, 1,
1.449751, 0.6517779, 0.7896816, 1, 1, 1, 1, 1,
1.452124, -0.7039126, 1.423645, 1, 1, 1, 1, 1,
1.454755, 0.1121, 1.664413, 1, 1, 1, 1, 1,
1.456172, 0.7095409, 1.959069, 1, 1, 1, 1, 1,
1.473152, 0.6930716, -0.4807681, 1, 1, 1, 1, 1,
1.478158, 0.9091873, 1.646487, 1, 1, 1, 1, 1,
1.479763, -1.017427, 0.816168, 0, 0, 1, 1, 1,
1.489893, 0.1665928, 0.9081694, 1, 0, 0, 1, 1,
1.491553, 0.9246406, 1.520317, 1, 0, 0, 1, 1,
1.499883, -0.5909986, 1.850289, 1, 0, 0, 1, 1,
1.501128, -1.104002, 1.424495, 1, 0, 0, 1, 1,
1.50404, 0.5232294, 0.2937437, 1, 0, 0, 1, 1,
1.510251, 1.903796, -0.3310395, 0, 0, 0, 1, 1,
1.521385, -0.5009885, 3.404695, 0, 0, 0, 1, 1,
1.531422, -0.1324766, 1.320068, 0, 0, 0, 1, 1,
1.532291, 0.5994727, 0.5733191, 0, 0, 0, 1, 1,
1.535289, 0.8903723, 0.3948494, 0, 0, 0, 1, 1,
1.540798, -0.1495496, 2.772858, 0, 0, 0, 1, 1,
1.560087, -0.03017293, -0.9977535, 0, 0, 0, 1, 1,
1.585957, 0.8801554, -0.4886316, 1, 1, 1, 1, 1,
1.587097, 0.7928538, 0.3630772, 1, 1, 1, 1, 1,
1.58932, -2.695947, 0.9145336, 1, 1, 1, 1, 1,
1.597217, -1.589797, 0.7931548, 1, 1, 1, 1, 1,
1.603776, 1.452566, 1.295747, 1, 1, 1, 1, 1,
1.605028, 1.866054, 0.9802009, 1, 1, 1, 1, 1,
1.611301, 0.2818384, 0.4439764, 1, 1, 1, 1, 1,
1.616372, -1.483156, 1.282268, 1, 1, 1, 1, 1,
1.632249, -0.4365832, 3.4322, 1, 1, 1, 1, 1,
1.636109, -0.5161367, 1.379565, 1, 1, 1, 1, 1,
1.63712, -0.9869547, 1.411452, 1, 1, 1, 1, 1,
1.651123, -0.7294261, 3.763625, 1, 1, 1, 1, 1,
1.657194, -1.6122, 3.330003, 1, 1, 1, 1, 1,
1.659966, -0.1513975, 1.488571, 1, 1, 1, 1, 1,
1.687752, -0.7392794, 1.299785, 1, 1, 1, 1, 1,
1.688195, 1.222994, 1.538879, 0, 0, 1, 1, 1,
1.692766, -0.1187437, 1.608191, 1, 0, 0, 1, 1,
1.695071, 0.8253284, 0.7115562, 1, 0, 0, 1, 1,
1.696416, -0.4450727, 0.6400595, 1, 0, 0, 1, 1,
1.714222, 1.317458, 1.972455, 1, 0, 0, 1, 1,
1.72606, -1.679746, 3.312068, 1, 0, 0, 1, 1,
1.770631, -0.3290933, 2.531152, 0, 0, 0, 1, 1,
1.771382, 0.9042346, 1.028667, 0, 0, 0, 1, 1,
1.808093, 2.125593, 1.741824, 0, 0, 0, 1, 1,
1.826613, 0.7076753, 0.1523041, 0, 0, 0, 1, 1,
1.835599, 2.067997, 0.7491704, 0, 0, 0, 1, 1,
1.835867, 1.734611, 0.3465548, 0, 0, 0, 1, 1,
1.866926, 1.767045, 1.07278, 0, 0, 0, 1, 1,
1.874393, -0.6183482, 1.819001, 1, 1, 1, 1, 1,
1.909854, 0.1806356, 4.506952, 1, 1, 1, 1, 1,
1.910356, -0.6849222, 2.681784, 1, 1, 1, 1, 1,
1.950166, -1.69084, 1.820605, 1, 1, 1, 1, 1,
1.955821, -0.2207145, 3.34313, 1, 1, 1, 1, 1,
1.968619, 1.226853, 1.43207, 1, 1, 1, 1, 1,
1.98382, -2.670955, 3.179569, 1, 1, 1, 1, 1,
2.017005, -1.059343, 2.558784, 1, 1, 1, 1, 1,
2.062085, -0.1773956, 0.9795378, 1, 1, 1, 1, 1,
2.210979, 0.3002127, 2.393759, 1, 1, 1, 1, 1,
2.213492, -0.9383815, 1.994343, 1, 1, 1, 1, 1,
2.21416, 0.07970704, -0.3110744, 1, 1, 1, 1, 1,
2.248296, -1.295045, 2.466288, 1, 1, 1, 1, 1,
2.292923, -0.1179703, 3.155048, 1, 1, 1, 1, 1,
2.31813, 0.1863897, 0.7611826, 1, 1, 1, 1, 1,
2.333608, 0.5292889, 2.995035, 0, 0, 1, 1, 1,
2.365745, 1.180858, 1.375831, 1, 0, 0, 1, 1,
2.38361, 1.991942, -0.8968511, 1, 0, 0, 1, 1,
2.388273, -1.157287, 1.681355, 1, 0, 0, 1, 1,
2.390304, -1.627307, 3.54822, 1, 0, 0, 1, 1,
2.391212, -1.087636, 2.186438, 1, 0, 0, 1, 1,
2.408204, -0.4291185, 0.9463747, 0, 0, 0, 1, 1,
2.42176, 0.2124325, 1.490837, 0, 0, 0, 1, 1,
2.44727, -0.6821679, 0.813559, 0, 0, 0, 1, 1,
2.494534, 0.1037586, 0.6648179, 0, 0, 0, 1, 1,
2.496953, -0.03550626, 2.517701, 0, 0, 0, 1, 1,
2.500374, 0.9769461, 0.1741747, 0, 0, 0, 1, 1,
2.542871, 0.7704713, 2.089161, 0, 0, 0, 1, 1,
2.688715, 0.04170966, -0.1090874, 1, 1, 1, 1, 1,
2.746936, -2.837698, 2.296315, 1, 1, 1, 1, 1,
2.764736, 0.5772851, 0.7744908, 1, 1, 1, 1, 1,
3.155475, 0.2791644, 0.8809242, 1, 1, 1, 1, 1,
3.171235, 0.5029072, 1.000256, 1, 1, 1, 1, 1,
3.268151, -0.7007974, 2.898807, 1, 1, 1, 1, 1,
3.916062, -0.549242, 3.338778, 1, 1, 1, 1, 1
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
var radius = 10.50484;
var distance = 36.89779;
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
mvMatrix.translate( -0.08321905, -0.06265974, -0.6604805 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.89779);
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
