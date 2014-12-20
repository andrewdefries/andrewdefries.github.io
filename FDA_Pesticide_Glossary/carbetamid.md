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
-3.715572, -0.7160828, -1.158358, 1, 0, 0, 1,
-3.074494, 0.8359449, -2.669799, 1, 0.007843138, 0, 1,
-2.837688, -1.102119, -2.836824, 1, 0.01176471, 0, 1,
-2.73981, -0.2500319, -1.305155, 1, 0.01960784, 0, 1,
-2.386893, 2.874965, 0.01014744, 1, 0.02352941, 0, 1,
-2.32163, 1.197736, -0.3294041, 1, 0.03137255, 0, 1,
-2.282234, 0.8693303, -0.6171982, 1, 0.03529412, 0, 1,
-2.277231, -0.1837882, -1.503959, 1, 0.04313726, 0, 1,
-2.271938, -0.158751, -1.270536, 1, 0.04705882, 0, 1,
-2.26722, 0.01379888, -0.3648815, 1, 0.05490196, 0, 1,
-2.209641, -0.5406557, -0.9289895, 1, 0.05882353, 0, 1,
-2.186642, -0.09866819, -1.479957, 1, 0.06666667, 0, 1,
-2.177801, 1.227829, -0.7323356, 1, 0.07058824, 0, 1,
-2.176454, -1.843853, -1.14453, 1, 0.07843138, 0, 1,
-2.143801, -1.242041, -2.533562, 1, 0.08235294, 0, 1,
-2.093461, 0.2743744, -0.1594767, 1, 0.09019608, 0, 1,
-2.039213, 1.877613, 0.4981858, 1, 0.09411765, 0, 1,
-2.034249, -1.601931, -2.590942, 1, 0.1019608, 0, 1,
-2.018717, -1.345059, -3.742768, 1, 0.1098039, 0, 1,
-1.964593, -0.1335518, -0.840318, 1, 0.1137255, 0, 1,
-1.94522, 0.6198716, -0.3016666, 1, 0.1215686, 0, 1,
-1.915024, -0.5631654, -2.630818, 1, 0.1254902, 0, 1,
-1.904122, -1.363941, -1.021618, 1, 0.1333333, 0, 1,
-1.903185, 0.9385357, -1.71355, 1, 0.1372549, 0, 1,
-1.902029, -1.183599, -4.030457, 1, 0.145098, 0, 1,
-1.895013, -0.7278212, -1.437064, 1, 0.1490196, 0, 1,
-1.871709, -0.7166883, -2.503374, 1, 0.1568628, 0, 1,
-1.86782, -1.783934, -2.679844, 1, 0.1607843, 0, 1,
-1.853539, 0.9101257, -1.991591, 1, 0.1686275, 0, 1,
-1.836928, 0.9048116, -0.3561034, 1, 0.172549, 0, 1,
-1.833544, -0.1640582, -3.210916, 1, 0.1803922, 0, 1,
-1.832632, 0.6410702, -0.1663535, 1, 0.1843137, 0, 1,
-1.831172, 1.111163, -0.05744188, 1, 0.1921569, 0, 1,
-1.818724, -0.3914247, -0.3664938, 1, 0.1960784, 0, 1,
-1.786517, 0.4489429, -1.758952, 1, 0.2039216, 0, 1,
-1.775504, -0.02984103, -2.375828, 1, 0.2117647, 0, 1,
-1.764013, -0.5283995, -3.137009, 1, 0.2156863, 0, 1,
-1.762472, -1.167504, -1.781237, 1, 0.2235294, 0, 1,
-1.755375, -1.880395, -2.665792, 1, 0.227451, 0, 1,
-1.750415, 0.8546525, -0.4155538, 1, 0.2352941, 0, 1,
-1.740289, -2.009608, -3.003508, 1, 0.2392157, 0, 1,
-1.727602, 0.8373551, -1.488917, 1, 0.2470588, 0, 1,
-1.722903, 0.2501245, -3.712218, 1, 0.2509804, 0, 1,
-1.717476, 2.366076, 0.1536977, 1, 0.2588235, 0, 1,
-1.698888, 0.7210604, 0.6875727, 1, 0.2627451, 0, 1,
-1.692575, 1.327901, 0.3847731, 1, 0.2705882, 0, 1,
-1.689034, 0.6830128, -1.922648, 1, 0.2745098, 0, 1,
-1.677478, 0.1317376, -1.911306, 1, 0.282353, 0, 1,
-1.662889, -0.162692, -0.933915, 1, 0.2862745, 0, 1,
-1.657343, 0.3460718, -0.06376433, 1, 0.2941177, 0, 1,
-1.648128, 0.02971588, -2.399166, 1, 0.3019608, 0, 1,
-1.641896, 0.4719979, -1.74877, 1, 0.3058824, 0, 1,
-1.629375, 1.033378, -0.2051421, 1, 0.3137255, 0, 1,
-1.606493, 0.2354032, -1.655903, 1, 0.3176471, 0, 1,
-1.593982, -1.704414, -3.644856, 1, 0.3254902, 0, 1,
-1.593313, -0.2611015, -0.8668308, 1, 0.3294118, 0, 1,
-1.559505, -0.09250432, -1.994169, 1, 0.3372549, 0, 1,
-1.547446, -0.4729479, -1.688954, 1, 0.3411765, 0, 1,
-1.532413, 1.36828, -0.4257255, 1, 0.3490196, 0, 1,
-1.527861, 0.01585747, -1.737243, 1, 0.3529412, 0, 1,
-1.527516, -0.9526674, 0.2441065, 1, 0.3607843, 0, 1,
-1.520956, -1.077567, -4.415801, 1, 0.3647059, 0, 1,
-1.518548, -0.250919, -1.380424, 1, 0.372549, 0, 1,
-1.513494, 1.313181, -1.791154, 1, 0.3764706, 0, 1,
-1.507182, 0.3511925, -2.609106, 1, 0.3843137, 0, 1,
-1.494119, -0.7749527, -4.322406, 1, 0.3882353, 0, 1,
-1.481308, 1.159536, -1.749757, 1, 0.3960784, 0, 1,
-1.471527, -0.3532912, -3.166235, 1, 0.4039216, 0, 1,
-1.450616, 0.6394188, -0.192777, 1, 0.4078431, 0, 1,
-1.446318, 0.6170549, -1.3028, 1, 0.4156863, 0, 1,
-1.437529, -0.5610403, -1.407268, 1, 0.4196078, 0, 1,
-1.420548, -0.7911336, -3.383174, 1, 0.427451, 0, 1,
-1.405738, 0.1801827, -0.142685, 1, 0.4313726, 0, 1,
-1.399459, 2.606274, 0.07396229, 1, 0.4392157, 0, 1,
-1.395422, -0.05306696, -1.452523, 1, 0.4431373, 0, 1,
-1.39495, -0.3602404, -1.843525, 1, 0.4509804, 0, 1,
-1.38947, 1.618702, -1.758969, 1, 0.454902, 0, 1,
-1.38757, 0.2555684, -2.190308, 1, 0.4627451, 0, 1,
-1.381222, 1.658687, 0.6357256, 1, 0.4666667, 0, 1,
-1.380426, 0.6629768, 0.1467788, 1, 0.4745098, 0, 1,
-1.371545, -0.3929613, -0.9189821, 1, 0.4784314, 0, 1,
-1.367409, 2.024077, 0.3116566, 1, 0.4862745, 0, 1,
-1.348346, -0.5737407, -1.315187, 1, 0.4901961, 0, 1,
-1.347433, -0.5238442, -3.29427, 1, 0.4980392, 0, 1,
-1.346791, -2.683082, -4.664056, 1, 0.5058824, 0, 1,
-1.345113, 0.1338027, -1.159275, 1, 0.509804, 0, 1,
-1.317892, 0.2371249, -1.854727, 1, 0.5176471, 0, 1,
-1.316009, 1.321096, -0.750892, 1, 0.5215687, 0, 1,
-1.314639, -0.3288841, 0.3768705, 1, 0.5294118, 0, 1,
-1.314197, 1.438989, -1.174722, 1, 0.5333334, 0, 1,
-1.305492, -0.7786176, -1.22097, 1, 0.5411765, 0, 1,
-1.30431, 0.2383023, -3.42474, 1, 0.5450981, 0, 1,
-1.299437, 1.685122, -1.722739, 1, 0.5529412, 0, 1,
-1.297119, -0.5475646, -3.413591, 1, 0.5568628, 0, 1,
-1.296893, -0.9614396, -1.861679, 1, 0.5647059, 0, 1,
-1.286158, 0.461127, -1.205743, 1, 0.5686275, 0, 1,
-1.277408, 1.342663, 0.3262844, 1, 0.5764706, 0, 1,
-1.262886, -0.3364608, -1.977997, 1, 0.5803922, 0, 1,
-1.256204, -0.7148449, -2.519124, 1, 0.5882353, 0, 1,
-1.251534, -2.580788, -1.97012, 1, 0.5921569, 0, 1,
-1.245847, 0.2264909, -0.6216943, 1, 0.6, 0, 1,
-1.239693, -1.853616, -2.232175, 1, 0.6078432, 0, 1,
-1.234658, -2.139819, -1.604602, 1, 0.6117647, 0, 1,
-1.231364, 0.3726403, -1.960313, 1, 0.6196079, 0, 1,
-1.222874, -0.2527425, -1.767483, 1, 0.6235294, 0, 1,
-1.209215, 0.006603294, -1.356093, 1, 0.6313726, 0, 1,
-1.206409, 0.8933344, -0.4415088, 1, 0.6352941, 0, 1,
-1.202373, -1.013257, -2.800992, 1, 0.6431373, 0, 1,
-1.187574, -0.6744277, -1.578211, 1, 0.6470588, 0, 1,
-1.184411, 1.284837, 0.4565645, 1, 0.654902, 0, 1,
-1.18428, -0.6597571, -0.9502572, 1, 0.6588235, 0, 1,
-1.170748, 1.175513, -1.175979, 1, 0.6666667, 0, 1,
-1.168988, 0.4517425, 0.323555, 1, 0.6705883, 0, 1,
-1.155583, 0.04315897, -2.167096, 1, 0.6784314, 0, 1,
-1.152906, -1.013716, -0.8397211, 1, 0.682353, 0, 1,
-1.133387, 0.4652215, -0.3670317, 1, 0.6901961, 0, 1,
-1.131449, -1.036048, -1.407739, 1, 0.6941177, 0, 1,
-1.130061, 1.5006, -0.8406324, 1, 0.7019608, 0, 1,
-1.129661, 0.2137599, -0.6258599, 1, 0.7098039, 0, 1,
-1.124279, -0.2530878, -2.850828, 1, 0.7137255, 0, 1,
-1.121572, 0.5226884, -2.446462, 1, 0.7215686, 0, 1,
-1.12121, 0.006015376, -1.726133, 1, 0.7254902, 0, 1,
-1.120906, 0.380801, -0.5731697, 1, 0.7333333, 0, 1,
-1.119506, -1.118854, -2.708242, 1, 0.7372549, 0, 1,
-1.106243, -1.463946, -3.342366, 1, 0.7450981, 0, 1,
-1.091685, 1.021197, 1.005964, 1, 0.7490196, 0, 1,
-1.091122, 1.462012, -0.5229625, 1, 0.7568628, 0, 1,
-1.086379, 0.01355383, -1.376565, 1, 0.7607843, 0, 1,
-1.080251, -0.9428898, -2.671053, 1, 0.7686275, 0, 1,
-1.078848, -0.1679593, -1.097949, 1, 0.772549, 0, 1,
-1.076657, 0.557735, -0.2341931, 1, 0.7803922, 0, 1,
-1.064503, -0.360748, -2.738521, 1, 0.7843137, 0, 1,
-1.063456, -0.7239832, -1.433647, 1, 0.7921569, 0, 1,
-1.053068, 0.6167791, -1.082819, 1, 0.7960784, 0, 1,
-1.048436, -1.460774, -4.008614, 1, 0.8039216, 0, 1,
-1.045945, 0.9365203, -1.451884, 1, 0.8117647, 0, 1,
-1.041753, 2.433211, 0.09768538, 1, 0.8156863, 0, 1,
-1.039716, 0.2387223, -1.291075, 1, 0.8235294, 0, 1,
-1.037416, -0.07726529, -1.457554, 1, 0.827451, 0, 1,
-1.030827, -0.1624347, -0.7691398, 1, 0.8352941, 0, 1,
-1.029625, 0.655307, 0.1689055, 1, 0.8392157, 0, 1,
-1.025179, 1.280728, 0.6393144, 1, 0.8470588, 0, 1,
-1.023966, -1.258733, -0.887186, 1, 0.8509804, 0, 1,
-1.021374, -0.3145533, -3.19641, 1, 0.8588235, 0, 1,
-1.020636, 1.339463, -1.714441, 1, 0.8627451, 0, 1,
-1.007472, -1.470737, -2.909466, 1, 0.8705882, 0, 1,
-1.002251, 0.4370551, -2.09573, 1, 0.8745098, 0, 1,
-1.002206, -1.172604, -4.211128, 1, 0.8823529, 0, 1,
-0.9933689, -0.005909473, -2.411444, 1, 0.8862745, 0, 1,
-0.9897587, -0.5270584, -3.260496, 1, 0.8941177, 0, 1,
-0.9861423, -0.5592333, -1.508604, 1, 0.8980392, 0, 1,
-0.9737508, -2.385167, -1.706698, 1, 0.9058824, 0, 1,
-0.9733703, -1.471617, -2.197576, 1, 0.9137255, 0, 1,
-0.9699823, -0.967914, -4.577124, 1, 0.9176471, 0, 1,
-0.9695724, 1.215446, 0.2364198, 1, 0.9254902, 0, 1,
-0.96797, -0.671675, -1.46942, 1, 0.9294118, 0, 1,
-0.9620348, 0.47489, -1.414286, 1, 0.9372549, 0, 1,
-0.9608088, 0.2092404, -2.381915, 1, 0.9411765, 0, 1,
-0.9581941, -0.3694282, -1.047513, 1, 0.9490196, 0, 1,
-0.9575669, -1.541504, -2.406913, 1, 0.9529412, 0, 1,
-0.9508106, 0.1416189, -1.987449, 1, 0.9607843, 0, 1,
-0.9493859, -1.416869, -4.464106, 1, 0.9647059, 0, 1,
-0.9286994, -0.6734936, -2.19741, 1, 0.972549, 0, 1,
-0.9241238, 0.06366269, -1.578126, 1, 0.9764706, 0, 1,
-0.9191242, -0.00692253, -2.162871, 1, 0.9843137, 0, 1,
-0.9161264, -1.762341, -3.572006, 1, 0.9882353, 0, 1,
-0.9135378, -2.280163, -1.565331, 1, 0.9960784, 0, 1,
-0.9019489, 1.26554, 0.1789082, 0.9960784, 1, 0, 1,
-0.9011372, -1.265103, -1.834221, 0.9921569, 1, 0, 1,
-0.8966539, -0.4582025, -1.476107, 0.9843137, 1, 0, 1,
-0.8936725, 1.288262, -2.112579, 0.9803922, 1, 0, 1,
-0.8936035, -1.36265, -1.463061, 0.972549, 1, 0, 1,
-0.8929477, 1.711063, -0.4860771, 0.9686275, 1, 0, 1,
-0.8911122, 0.4151826, -0.6163642, 0.9607843, 1, 0, 1,
-0.8904008, -2.408505, -3.235523, 0.9568627, 1, 0, 1,
-0.8897197, 0.8829596, -0.839095, 0.9490196, 1, 0, 1,
-0.8890981, 0.3545024, -1.290743, 0.945098, 1, 0, 1,
-0.8868124, -0.4615639, -1.253916, 0.9372549, 1, 0, 1,
-0.8825251, -0.7408531, -4.618968, 0.9333333, 1, 0, 1,
-0.8794935, 0.4655882, -1.250949, 0.9254902, 1, 0, 1,
-0.8770667, -0.7746199, -0.328764, 0.9215686, 1, 0, 1,
-0.8742919, -0.5860114, -2.288309, 0.9137255, 1, 0, 1,
-0.8697441, -1.139137, -2.499445, 0.9098039, 1, 0, 1,
-0.8651522, -0.7608334, -1.994971, 0.9019608, 1, 0, 1,
-0.8630379, -0.1212893, -1.64365, 0.8941177, 1, 0, 1,
-0.8614671, -0.2201402, -3.079807, 0.8901961, 1, 0, 1,
-0.8578635, -1.543619, -3.062919, 0.8823529, 1, 0, 1,
-0.8564585, 0.2864684, -1.85802, 0.8784314, 1, 0, 1,
-0.8555366, -0.4857352, -1.488426, 0.8705882, 1, 0, 1,
-0.8529431, 2.639559, -2.058511, 0.8666667, 1, 0, 1,
-0.8526874, -0.3608914, -1.944156, 0.8588235, 1, 0, 1,
-0.8509744, -0.7384736, -2.408173, 0.854902, 1, 0, 1,
-0.8491052, 0.1508874, -2.08473, 0.8470588, 1, 0, 1,
-0.840723, -0.3591624, -2.503983, 0.8431373, 1, 0, 1,
-0.839556, -0.8643594, -1.049935, 0.8352941, 1, 0, 1,
-0.8272722, -0.7898806, -2.334431, 0.8313726, 1, 0, 1,
-0.8209913, -0.633144, -3.959339, 0.8235294, 1, 0, 1,
-0.8188718, -0.711484, -2.479761, 0.8196079, 1, 0, 1,
-0.8164067, 2.582674, -0.1824723, 0.8117647, 1, 0, 1,
-0.8161399, -0.3332905, -2.618927, 0.8078431, 1, 0, 1,
-0.8123535, -0.3078128, -0.8730547, 0.8, 1, 0, 1,
-0.8089187, 0.1910967, -1.267604, 0.7921569, 1, 0, 1,
-0.8088835, 1.578212, -1.086482, 0.7882353, 1, 0, 1,
-0.8057452, 0.2538679, -2.381121, 0.7803922, 1, 0, 1,
-0.8048053, 0.4559536, -1.869311, 0.7764706, 1, 0, 1,
-0.8031887, -0.3448443, -2.116718, 0.7686275, 1, 0, 1,
-0.8020947, 3.197023, 0.3106919, 0.7647059, 1, 0, 1,
-0.8005009, 1.28763, -0.4781734, 0.7568628, 1, 0, 1,
-0.8002549, -0.8541361, -0.7803018, 0.7529412, 1, 0, 1,
-0.7942085, 1.405044, -1.28977, 0.7450981, 1, 0, 1,
-0.7770476, -0.1595101, -2.816016, 0.7411765, 1, 0, 1,
-0.7738701, -0.1229091, -0.3361934, 0.7333333, 1, 0, 1,
-0.7708849, 0.9563745, -1.625114, 0.7294118, 1, 0, 1,
-0.7672382, -1.153432, -2.324447, 0.7215686, 1, 0, 1,
-0.7635294, 2.825086, 0.1245226, 0.7176471, 1, 0, 1,
-0.7632096, 0.6099774, -1.360944, 0.7098039, 1, 0, 1,
-0.7613694, 0.8338774, -0.7021677, 0.7058824, 1, 0, 1,
-0.759612, 0.7670927, -2.243161, 0.6980392, 1, 0, 1,
-0.7567751, -0.4102032, -0.9827484, 0.6901961, 1, 0, 1,
-0.7567017, -0.01788537, -0.3523412, 0.6862745, 1, 0, 1,
-0.751518, 0.2368683, -1.345699, 0.6784314, 1, 0, 1,
-0.7502396, -2.02725, -3.745767, 0.6745098, 1, 0, 1,
-0.7492525, -0.07024872, -1.193362, 0.6666667, 1, 0, 1,
-0.746619, -0.7474675, -1.945983, 0.6627451, 1, 0, 1,
-0.7417114, -0.8661839, -2.011897, 0.654902, 1, 0, 1,
-0.7412721, 0.08167423, -2.756015, 0.6509804, 1, 0, 1,
-0.7263427, -0.03000318, -1.284765, 0.6431373, 1, 0, 1,
-0.7251345, -0.4395767, -2.20046, 0.6392157, 1, 0, 1,
-0.7162835, -1.670853, -2.164063, 0.6313726, 1, 0, 1,
-0.7106791, -0.5449681, -1.069709, 0.627451, 1, 0, 1,
-0.7085672, -0.8550202, -1.39686, 0.6196079, 1, 0, 1,
-0.7076057, 1.576019, -0.07958392, 0.6156863, 1, 0, 1,
-0.7064596, 0.9251838, -0.6206253, 0.6078432, 1, 0, 1,
-0.7016042, -1.423128, -3.037476, 0.6039216, 1, 0, 1,
-0.7002503, -0.5387926, -3.85944, 0.5960785, 1, 0, 1,
-0.6971776, -1.332253, -3.365268, 0.5882353, 1, 0, 1,
-0.6959948, 0.3161376, -1.563479, 0.5843138, 1, 0, 1,
-0.6952109, 1.616881, 0.394877, 0.5764706, 1, 0, 1,
-0.6945025, -0.6538347, -3.472991, 0.572549, 1, 0, 1,
-0.6940354, 1.467413, -0.05468127, 0.5647059, 1, 0, 1,
-0.6934533, 0.1793288, -2.275703, 0.5607843, 1, 0, 1,
-0.6930382, 0.7351068, -1.588687, 0.5529412, 1, 0, 1,
-0.6906425, -0.01867709, -2.224522, 0.5490196, 1, 0, 1,
-0.6899117, -1.379294, -3.177722, 0.5411765, 1, 0, 1,
-0.6871509, 2.127558, -1.241, 0.5372549, 1, 0, 1,
-0.6836017, 0.7723531, -1.326186, 0.5294118, 1, 0, 1,
-0.6824487, 1.532624, -0.08541477, 0.5254902, 1, 0, 1,
-0.6807938, -0.02531576, -1.577249, 0.5176471, 1, 0, 1,
-0.6684074, -0.2508467, -2.063968, 0.5137255, 1, 0, 1,
-0.6641023, -0.1673947, -2.363569, 0.5058824, 1, 0, 1,
-0.660489, -0.1524351, -1.943079, 0.5019608, 1, 0, 1,
-0.6550139, 0.2450785, -1.251239, 0.4941176, 1, 0, 1,
-0.6549227, -1.467488, -3.014815, 0.4862745, 1, 0, 1,
-0.6517687, 0.8243611, -1.034326, 0.4823529, 1, 0, 1,
-0.6488232, -0.3274117, -1.838776, 0.4745098, 1, 0, 1,
-0.6475254, -0.9570378, -0.4275989, 0.4705882, 1, 0, 1,
-0.644361, -1.55364, -2.2492, 0.4627451, 1, 0, 1,
-0.6364802, 1.331922, -2.455454, 0.4588235, 1, 0, 1,
-0.6337873, -2.785211, -1.343236, 0.4509804, 1, 0, 1,
-0.633407, 0.02841018, -2.338554, 0.4470588, 1, 0, 1,
-0.6248932, -1.393223, -2.586951, 0.4392157, 1, 0, 1,
-0.6240958, -0.4452989, -3.034916, 0.4352941, 1, 0, 1,
-0.6192166, -2.11468, -2.041138, 0.427451, 1, 0, 1,
-0.6093232, 1.460753, -1.086432, 0.4235294, 1, 0, 1,
-0.6067763, -0.107844, -2.298952, 0.4156863, 1, 0, 1,
-0.5940406, -1.543861, -1.509434, 0.4117647, 1, 0, 1,
-0.5935862, 0.1661682, -1.461365, 0.4039216, 1, 0, 1,
-0.5935745, 1.547849, -0.9515697, 0.3960784, 1, 0, 1,
-0.5892486, 0.05181108, 0.6219814, 0.3921569, 1, 0, 1,
-0.5890647, 1.316173, -0.5545508, 0.3843137, 1, 0, 1,
-0.5868776, 0.2884829, 0.08959143, 0.3803922, 1, 0, 1,
-0.578585, 0.05966523, -1.35252, 0.372549, 1, 0, 1,
-0.5784103, 0.4997838, -0.429718, 0.3686275, 1, 0, 1,
-0.5751606, 0.3471592, -0.7749821, 0.3607843, 1, 0, 1,
-0.57379, -1.482055, -3.908202, 0.3568628, 1, 0, 1,
-0.5645547, 1.160788, -1.378699, 0.3490196, 1, 0, 1,
-0.5626615, -0.6960593, -2.30197, 0.345098, 1, 0, 1,
-0.5595043, -0.8622218, -3.735031, 0.3372549, 1, 0, 1,
-0.5581958, -1.089129, -3.865376, 0.3333333, 1, 0, 1,
-0.557222, 1.138187, 0.1532554, 0.3254902, 1, 0, 1,
-0.5529067, -1.848057, -2.145889, 0.3215686, 1, 0, 1,
-0.5524076, -1.515713, -2.060808, 0.3137255, 1, 0, 1,
-0.5495727, -0.302878, -2.707514, 0.3098039, 1, 0, 1,
-0.5431919, -0.5247461, -3.852777, 0.3019608, 1, 0, 1,
-0.5418715, -0.2814017, -2.537819, 0.2941177, 1, 0, 1,
-0.5295343, 1.038973, 0.4744345, 0.2901961, 1, 0, 1,
-0.5294294, 0.8199317, -2.679417, 0.282353, 1, 0, 1,
-0.5274016, 0.6386057, -2.643416, 0.2784314, 1, 0, 1,
-0.5254325, 1.683135, 1.342043, 0.2705882, 1, 0, 1,
-0.5250146, 0.5569723, -1.88061, 0.2666667, 1, 0, 1,
-0.5242057, -2.730679, -1.982975, 0.2588235, 1, 0, 1,
-0.5235041, -1.455164, -3.702981, 0.254902, 1, 0, 1,
-0.5223379, -0.2738278, -1.205197, 0.2470588, 1, 0, 1,
-0.5197221, 0.4321484, -0.2126585, 0.2431373, 1, 0, 1,
-0.517474, -0.1185671, -0.415629, 0.2352941, 1, 0, 1,
-0.514612, -0.8619262, -3.991866, 0.2313726, 1, 0, 1,
-0.5141627, -0.001907172, -1.226284, 0.2235294, 1, 0, 1,
-0.5140864, 1.08445, -1.755872, 0.2196078, 1, 0, 1,
-0.504245, -1.300687, -3.345822, 0.2117647, 1, 0, 1,
-0.5015367, 0.1506826, -2.623436, 0.2078431, 1, 0, 1,
-0.4970911, 0.512135, 0.08495329, 0.2, 1, 0, 1,
-0.4916589, -0.2540731, -0.5625932, 0.1921569, 1, 0, 1,
-0.4906598, -0.08612653, -0.09677072, 0.1882353, 1, 0, 1,
-0.4850937, 1.40752, -0.8907291, 0.1803922, 1, 0, 1,
-0.4806791, -0.3384195, -1.344932, 0.1764706, 1, 0, 1,
-0.4781854, -0.0745571, -1.763963, 0.1686275, 1, 0, 1,
-0.4745908, 1.788376, -0.7664086, 0.1647059, 1, 0, 1,
-0.4744197, -0.5193936, -1.979565, 0.1568628, 1, 0, 1,
-0.4719173, 0.9182695, -0.7101331, 0.1529412, 1, 0, 1,
-0.4666269, -0.5777683, -1.626495, 0.145098, 1, 0, 1,
-0.4646485, -1.402849, -3.240079, 0.1411765, 1, 0, 1,
-0.4623194, 0.7026927, 0.542581, 0.1333333, 1, 0, 1,
-0.4556503, 0.4386846, -0.4535363, 0.1294118, 1, 0, 1,
-0.4532933, -0.5984932, -3.145142, 0.1215686, 1, 0, 1,
-0.4393692, -1.703015, -3.023796, 0.1176471, 1, 0, 1,
-0.4388368, -0.8286178, -3.523235, 0.1098039, 1, 0, 1,
-0.4384354, -0.3585685, -3.626982, 0.1058824, 1, 0, 1,
-0.4355932, 0.3967268, -0.190902, 0.09803922, 1, 0, 1,
-0.4354753, -0.8362445, -2.204062, 0.09019608, 1, 0, 1,
-0.4329076, 2.224521, 0.2015382, 0.08627451, 1, 0, 1,
-0.4232593, -0.4525463, -1.358754, 0.07843138, 1, 0, 1,
-0.4210716, -1.185446, -3.322007, 0.07450981, 1, 0, 1,
-0.4201887, -0.8316365, -2.142574, 0.06666667, 1, 0, 1,
-0.4186508, -0.6323267, -3.277129, 0.0627451, 1, 0, 1,
-0.4180605, 0.6941, 0.178012, 0.05490196, 1, 0, 1,
-0.4145035, -0.8147806, -0.9480842, 0.05098039, 1, 0, 1,
-0.407851, 1.072039, 0.5769029, 0.04313726, 1, 0, 1,
-0.4073783, -2.147583, -3.808614, 0.03921569, 1, 0, 1,
-0.4047028, -0.6450059, -3.823891, 0.03137255, 1, 0, 1,
-0.4008237, -0.8753821, -3.592096, 0.02745098, 1, 0, 1,
-0.3981091, -0.5586064, -1.797976, 0.01960784, 1, 0, 1,
-0.3948362, 0.7734511, -0.3432032, 0.01568628, 1, 0, 1,
-0.3876282, -0.02452712, -1.553441, 0.007843138, 1, 0, 1,
-0.3862844, 0.4313435, -0.2112045, 0.003921569, 1, 0, 1,
-0.384978, -1.087163, -2.531458, 0, 1, 0.003921569, 1,
-0.3841387, 0.685981, -1.267498, 0, 1, 0.01176471, 1,
-0.382867, -1.788315, -3.463304, 0, 1, 0.01568628, 1,
-0.3803653, 0.7668797, -0.8687084, 0, 1, 0.02352941, 1,
-0.3763992, 1.856324, -0.5920727, 0, 1, 0.02745098, 1,
-0.3745347, -1.348, -4.077813, 0, 1, 0.03529412, 1,
-0.3700118, 0.1097429, -1.148938, 0, 1, 0.03921569, 1,
-0.3672883, 1.670871, -0.2942979, 0, 1, 0.04705882, 1,
-0.3660722, 0.5301413, 0.07222754, 0, 1, 0.05098039, 1,
-0.3647791, -1.373476, -3.172156, 0, 1, 0.05882353, 1,
-0.3645464, -1.532841, -1.201634, 0, 1, 0.0627451, 1,
-0.3613893, -0.2693024, -2.705262, 0, 1, 0.07058824, 1,
-0.3597825, -0.1753371, -0.7562982, 0, 1, 0.07450981, 1,
-0.3553874, -0.4997935, -1.943993, 0, 1, 0.08235294, 1,
-0.3516334, 0.5406876, 0.8127322, 0, 1, 0.08627451, 1,
-0.349484, 1.937638, -1.257178, 0, 1, 0.09411765, 1,
-0.3438947, 1.183221, -1.030504, 0, 1, 0.1019608, 1,
-0.3436253, -0.5710796, -2.412598, 0, 1, 0.1058824, 1,
-0.3393084, -2.244901, -2.655442, 0, 1, 0.1137255, 1,
-0.3321559, 1.046845, 0.5476302, 0, 1, 0.1176471, 1,
-0.3320822, 1.1318, 0.7592217, 0, 1, 0.1254902, 1,
-0.3286511, 1.661998, -0.2461509, 0, 1, 0.1294118, 1,
-0.3272641, -0.5202416, -1.36074, 0, 1, 0.1372549, 1,
-0.324893, 1.491684, 0.1315296, 0, 1, 0.1411765, 1,
-0.3138283, -0.4492899, -1.630386, 0, 1, 0.1490196, 1,
-0.3137559, 0.1535347, -1.214537, 0, 1, 0.1529412, 1,
-0.3123603, -0.1946041, -2.317832, 0, 1, 0.1607843, 1,
-0.3082077, 1.087487, 1.472376, 0, 1, 0.1647059, 1,
-0.3030182, -0.3753602, -2.075503, 0, 1, 0.172549, 1,
-0.2993032, 1.734884, -0.06274007, 0, 1, 0.1764706, 1,
-0.29456, -1.17046, -2.647561, 0, 1, 0.1843137, 1,
-0.2913342, 1.617665, 0.566063, 0, 1, 0.1882353, 1,
-0.2907353, -0.986467, -3.475203, 0, 1, 0.1960784, 1,
-0.2885755, -0.5579829, -3.956951, 0, 1, 0.2039216, 1,
-0.2843789, -0.0162813, -2.446861, 0, 1, 0.2078431, 1,
-0.2796104, 0.5954192, -1.245278, 0, 1, 0.2156863, 1,
-0.2793034, 0.1252034, -1.733287, 0, 1, 0.2196078, 1,
-0.2787162, -0.3511782, -2.340619, 0, 1, 0.227451, 1,
-0.2705146, 1.242943, 0.4756831, 0, 1, 0.2313726, 1,
-0.2691315, -0.498018, -3.25931, 0, 1, 0.2392157, 1,
-0.2678748, 0.3208622, 0.4415559, 0, 1, 0.2431373, 1,
-0.2675257, -1.137958, -1.847077, 0, 1, 0.2509804, 1,
-0.2653628, 1.445205, 1.381508, 0, 1, 0.254902, 1,
-0.2645286, -1.187721, -2.000158, 0, 1, 0.2627451, 1,
-0.2606713, 0.5385987, -0.3299723, 0, 1, 0.2666667, 1,
-0.2566428, -0.0172519, 0.1206702, 0, 1, 0.2745098, 1,
-0.2503284, 0.3654729, -0.4741651, 0, 1, 0.2784314, 1,
-0.2462624, 0.6609266, -1.397415, 0, 1, 0.2862745, 1,
-0.2429115, 0.02019486, -0.8626539, 0, 1, 0.2901961, 1,
-0.2390915, 0.08672505, -1.508887, 0, 1, 0.2980392, 1,
-0.2371522, 1.148599, 1.382556, 0, 1, 0.3058824, 1,
-0.2366736, -2.01969, -2.805113, 0, 1, 0.3098039, 1,
-0.2347293, 0.1472587, -2.478306, 0, 1, 0.3176471, 1,
-0.2346523, 0.614122, -1.644837, 0, 1, 0.3215686, 1,
-0.2296219, -1.392189, -4.023297, 0, 1, 0.3294118, 1,
-0.2289972, -0.8439621, -3.068881, 0, 1, 0.3333333, 1,
-0.2284528, 0.1879113, -1.357892, 0, 1, 0.3411765, 1,
-0.2266883, 1.263103, -0.8313645, 0, 1, 0.345098, 1,
-0.2264198, -1.200533, -3.933369, 0, 1, 0.3529412, 1,
-0.2239534, 2.241429, 0.9456773, 0, 1, 0.3568628, 1,
-0.2238622, -1.794598, -2.888894, 0, 1, 0.3647059, 1,
-0.2168481, 0.4409858, 0.4452654, 0, 1, 0.3686275, 1,
-0.2077922, -0.1190045, -1.722661, 0, 1, 0.3764706, 1,
-0.2056894, 0.9233376, -0.04279181, 0, 1, 0.3803922, 1,
-0.2036012, -0.01782923, -1.499933, 0, 1, 0.3882353, 1,
-0.2033508, -0.181257, -2.234315, 0, 1, 0.3921569, 1,
-0.1965016, -1.654538, -2.798664, 0, 1, 0.4, 1,
-0.1958722, 0.09380813, -1.210006, 0, 1, 0.4078431, 1,
-0.1951745, 0.8988781, 0.510592, 0, 1, 0.4117647, 1,
-0.1948267, -0.2933323, -3.291551, 0, 1, 0.4196078, 1,
-0.1927695, 0.643303, 0.319599, 0, 1, 0.4235294, 1,
-0.1895088, 0.2895136, 0.2052645, 0, 1, 0.4313726, 1,
-0.1818331, -0.4070396, -1.941819, 0, 1, 0.4352941, 1,
-0.1805259, -0.132327, -2.775834, 0, 1, 0.4431373, 1,
-0.1792285, 0.1805809, -0.7357818, 0, 1, 0.4470588, 1,
-0.1783294, -1.404164, -2.920982, 0, 1, 0.454902, 1,
-0.1695279, 1.272777, 0.5846664, 0, 1, 0.4588235, 1,
-0.1689191, -0.8883656, -2.286536, 0, 1, 0.4666667, 1,
-0.161414, -1.157005, -4.008271, 0, 1, 0.4705882, 1,
-0.1601032, -1.451878, -3.052303, 0, 1, 0.4784314, 1,
-0.1553176, -0.9373764, -2.655564, 0, 1, 0.4823529, 1,
-0.1537725, 0.6118144, -0.2760236, 0, 1, 0.4901961, 1,
-0.1472595, 2.515642, -1.306833, 0, 1, 0.4941176, 1,
-0.1407414, 1.081858, 0.9745631, 0, 1, 0.5019608, 1,
-0.1374847, 2.232686, 0.2341453, 0, 1, 0.509804, 1,
-0.1349743, -0.7845628, -1.955472, 0, 1, 0.5137255, 1,
-0.1337577, -0.9305933, -4.759367, 0, 1, 0.5215687, 1,
-0.1322845, -0.4239574, -1.683619, 0, 1, 0.5254902, 1,
-0.1320824, 0.8690857, 0.8684564, 0, 1, 0.5333334, 1,
-0.1296894, 0.4395624, 0.5207111, 0, 1, 0.5372549, 1,
-0.1295857, 0.09461711, -1.099202, 0, 1, 0.5450981, 1,
-0.1247349, 1.21725, 0.9186316, 0, 1, 0.5490196, 1,
-0.1237413, -0.3168424, -2.461364, 0, 1, 0.5568628, 1,
-0.1169297, -1.177936, -3.455775, 0, 1, 0.5607843, 1,
-0.1147513, -0.6659131, -1.757033, 0, 1, 0.5686275, 1,
-0.11296, 0.1580608, -1.576298, 0, 1, 0.572549, 1,
-0.111767, 1.174947, -0.611756, 0, 1, 0.5803922, 1,
-0.1087483, 0.06633929, -0.001850259, 0, 1, 0.5843138, 1,
-0.1059747, 1.508604, -1.117612, 0, 1, 0.5921569, 1,
-0.1052099, -0.2091723, -4.008342, 0, 1, 0.5960785, 1,
-0.1031289, 0.8849284, -0.3089228, 0, 1, 0.6039216, 1,
-0.1029283, -0.2761042, -2.5297, 0, 1, 0.6117647, 1,
-0.1005511, -1.660171, -0.8932578, 0, 1, 0.6156863, 1,
-0.09446806, -1.253353, -5.558343, 0, 1, 0.6235294, 1,
-0.09394699, 0.7456318, 1.44285, 0, 1, 0.627451, 1,
-0.09368686, 0.02427015, -1.667829, 0, 1, 0.6352941, 1,
-0.09255535, -0.3448196, -2.481071, 0, 1, 0.6392157, 1,
-0.09124888, 0.9068673, 1.982771, 0, 1, 0.6470588, 1,
-0.08959199, -1.115908, -2.978724, 0, 1, 0.6509804, 1,
-0.08447903, -0.5629086, -3.113205, 0, 1, 0.6588235, 1,
-0.08314111, -1.000974, -4.042526, 0, 1, 0.6627451, 1,
-0.08149858, -0.7590674, -3.463709, 0, 1, 0.6705883, 1,
-0.08112095, 1.592317, -0.2716055, 0, 1, 0.6745098, 1,
-0.07965429, 0.4501393, -0.1856332, 0, 1, 0.682353, 1,
-0.0795142, -0.4590896, -2.492171, 0, 1, 0.6862745, 1,
-0.07729264, 0.1925162, -0.6242955, 0, 1, 0.6941177, 1,
-0.07571702, -0.5951684, -3.013006, 0, 1, 0.7019608, 1,
-0.07562117, 0.250595, -0.8882307, 0, 1, 0.7058824, 1,
-0.07553491, -0.5947288, -3.493794, 0, 1, 0.7137255, 1,
-0.07281584, -0.6803898, -1.626264, 0, 1, 0.7176471, 1,
-0.07053161, -0.0415445, -1.808522, 0, 1, 0.7254902, 1,
-0.0697499, 0.7308843, 0.9276091, 0, 1, 0.7294118, 1,
-0.06925775, -0.1822255, -3.418454, 0, 1, 0.7372549, 1,
-0.06825887, -0.9274511, -4.721954, 0, 1, 0.7411765, 1,
-0.06805911, -1.072298, -1.457541, 0, 1, 0.7490196, 1,
-0.06765295, -0.4929365, -3.445745, 0, 1, 0.7529412, 1,
-0.06709927, -1.873982, -3.17389, 0, 1, 0.7607843, 1,
-0.06630417, 0.4865497, -0.2317968, 0, 1, 0.7647059, 1,
-0.06142065, -0.2148534, -3.112634, 0, 1, 0.772549, 1,
-0.06110101, 0.6940201, 1.442042, 0, 1, 0.7764706, 1,
-0.05925986, -1.150512, -2.993016, 0, 1, 0.7843137, 1,
-0.05917258, -1.001777, -4.555168, 0, 1, 0.7882353, 1,
-0.05507513, -0.6723163, -3.482589, 0, 1, 0.7960784, 1,
-0.0550123, 0.013382, -2.789957, 0, 1, 0.8039216, 1,
-0.05259468, -0.1277647, -3.091317, 0, 1, 0.8078431, 1,
-0.05180928, 0.8192156, -1.769207, 0, 1, 0.8156863, 1,
-0.04639928, -0.4128543, -2.290759, 0, 1, 0.8196079, 1,
-0.04515991, -2.536924, -2.253304, 0, 1, 0.827451, 1,
-0.04334889, 0.441569, -0.6334505, 0, 1, 0.8313726, 1,
-0.04230156, -1.624147, -3.16574, 0, 1, 0.8392157, 1,
-0.04152481, 0.2629892, -2.728934, 0, 1, 0.8431373, 1,
-0.04101504, -0.8372941, -3.681015, 0, 1, 0.8509804, 1,
-0.04014235, 0.5293849, 0.3160113, 0, 1, 0.854902, 1,
-0.03816457, -1.348087, -2.283911, 0, 1, 0.8627451, 1,
-0.03726243, -1.359374, -2.22019, 0, 1, 0.8666667, 1,
-0.02928606, 0.7370468, -0.4847487, 0, 1, 0.8745098, 1,
-0.02874042, -0.5661531, -2.289014, 0, 1, 0.8784314, 1,
-0.02083342, 1.520589, -1.537825, 0, 1, 0.8862745, 1,
-0.01727635, -0.9942545, -4.350842, 0, 1, 0.8901961, 1,
-0.01160112, 0.1947464, 0.4934555, 0, 1, 0.8980392, 1,
-0.01088344, -0.8940827, -2.932162, 0, 1, 0.9058824, 1,
-0.01007935, 0.1629514, 0.6815253, 0, 1, 0.9098039, 1,
-0.009362908, 1.026626, -0.8332005, 0, 1, 0.9176471, 1,
-0.009210618, 1.356334, -0.4284646, 0, 1, 0.9215686, 1,
-0.008789043, -1.245716, -3.054324, 0, 1, 0.9294118, 1,
-0.00711804, 0.549992, 0.7455751, 0, 1, 0.9333333, 1,
-0.005136325, 2.051989, 0.4680675, 0, 1, 0.9411765, 1,
-0.004232428, -0.164224, -2.049403, 0, 1, 0.945098, 1,
-0.003927859, 0.7609791, 1.526779, 0, 1, 0.9529412, 1,
-0.002727981, -1.203502, -4.094023, 0, 1, 0.9568627, 1,
0.0005714085, -2.162038, 0.9967887, 0, 1, 0.9647059, 1,
0.00193864, 1.060447, 1.380238, 0, 1, 0.9686275, 1,
0.01005406, -1.664112, 3.037006, 0, 1, 0.9764706, 1,
0.01268146, -0.1628765, 2.789316, 0, 1, 0.9803922, 1,
0.01386525, 0.4829742, -2.256705, 0, 1, 0.9882353, 1,
0.01439964, 0.8977368, -0.6345367, 0, 1, 0.9921569, 1,
0.01707966, 1.120645, 1.646888, 0, 1, 1, 1,
0.01874515, -0.7037582, 1.746133, 0, 0.9921569, 1, 1,
0.02077399, 1.461957, -0.3597603, 0, 0.9882353, 1, 1,
0.02124417, -0.8193549, 1.763483, 0, 0.9803922, 1, 1,
0.02157375, -1.799935, 3.761375, 0, 0.9764706, 1, 1,
0.02568103, -2.136287, 1.364049, 0, 0.9686275, 1, 1,
0.02621036, -1.077552, 2.894076, 0, 0.9647059, 1, 1,
0.02871357, -0.298499, 3.453571, 0, 0.9568627, 1, 1,
0.03304369, -0.6681566, 3.994489, 0, 0.9529412, 1, 1,
0.03844534, -0.3490317, 2.72007, 0, 0.945098, 1, 1,
0.04200248, -0.1072885, 4.064139, 0, 0.9411765, 1, 1,
0.0472968, 0.482578, 0.1186615, 0, 0.9333333, 1, 1,
0.05185032, 1.945063, 0.8323808, 0, 0.9294118, 1, 1,
0.05446936, -2.585938, 3.648802, 0, 0.9215686, 1, 1,
0.06142778, -0.538578, 1.096873, 0, 0.9176471, 1, 1,
0.06288453, 0.4168974, 0.5917177, 0, 0.9098039, 1, 1,
0.06946281, -1.145042, 2.334869, 0, 0.9058824, 1, 1,
0.07002571, -0.9758231, 5.24629, 0, 0.8980392, 1, 1,
0.07775056, -0.3880375, 0.6128425, 0, 0.8901961, 1, 1,
0.07965817, 1.475023, -0.5332876, 0, 0.8862745, 1, 1,
0.08081184, -0.770943, 1.648519, 0, 0.8784314, 1, 1,
0.08105177, 1.597607, -0.2720332, 0, 0.8745098, 1, 1,
0.08510654, -1.229033, 4.64322, 0, 0.8666667, 1, 1,
0.08587169, 0.6235348, -0.5831914, 0, 0.8627451, 1, 1,
0.08806263, 1.228342, 2.194041, 0, 0.854902, 1, 1,
0.08978918, 1.837515, 0.1403883, 0, 0.8509804, 1, 1,
0.09121943, -0.06948199, 1.747661, 0, 0.8431373, 1, 1,
0.09743323, 1.152246, -1.145085, 0, 0.8392157, 1, 1,
0.09807333, -1.25815, 2.159735, 0, 0.8313726, 1, 1,
0.100618, 0.8572897, 0.864398, 0, 0.827451, 1, 1,
0.1050046, -0.6234807, 3.829293, 0, 0.8196079, 1, 1,
0.106141, 0.1087392, 1.555811, 0, 0.8156863, 1, 1,
0.1131703, -0.5108132, 1.608155, 0, 0.8078431, 1, 1,
0.1156002, 1.290305, -1.005347, 0, 0.8039216, 1, 1,
0.1272328, -1.631701, 2.25239, 0, 0.7960784, 1, 1,
0.1273179, 0.8895711, 0.1502482, 0, 0.7882353, 1, 1,
0.1281087, 0.1632334, 1.737782, 0, 0.7843137, 1, 1,
0.1294107, -0.4614566, 3.572708, 0, 0.7764706, 1, 1,
0.1313452, 0.3764857, -0.7384526, 0, 0.772549, 1, 1,
0.1360018, -1.421554, 2.205482, 0, 0.7647059, 1, 1,
0.1432213, -1.559705, 2.121222, 0, 0.7607843, 1, 1,
0.1442703, -0.04185823, 1.355879, 0, 0.7529412, 1, 1,
0.1444005, -1.815566, 2.956066, 0, 0.7490196, 1, 1,
0.1452556, 0.1117081, 0.6524189, 0, 0.7411765, 1, 1,
0.1460496, 1.467148, 0.9325767, 0, 0.7372549, 1, 1,
0.1468439, -0.3027499, 0.5016789, 0, 0.7294118, 1, 1,
0.1517579, -0.05250726, 2.276271, 0, 0.7254902, 1, 1,
0.1522243, -1.011994, 3.575079, 0, 0.7176471, 1, 1,
0.1610258, -0.4872681, 1.909623, 0, 0.7137255, 1, 1,
0.1621103, -0.1735633, 2.963414, 0, 0.7058824, 1, 1,
0.1662326, -1.773468, 3.196221, 0, 0.6980392, 1, 1,
0.1663854, 0.2227052, 0.6612998, 0, 0.6941177, 1, 1,
0.1685136, 0.4301504, -0.2208404, 0, 0.6862745, 1, 1,
0.1707764, -0.5817434, 1.019149, 0, 0.682353, 1, 1,
0.1731487, 0.1694895, 1.359687, 0, 0.6745098, 1, 1,
0.1755756, -1.686652, 2.327129, 0, 0.6705883, 1, 1,
0.1784251, -1.52857, 0.7688525, 0, 0.6627451, 1, 1,
0.1784391, 0.6527424, 1.741299, 0, 0.6588235, 1, 1,
0.1801065, -0.6279544, 3.9738, 0, 0.6509804, 1, 1,
0.1833477, -1.905677, 2.403303, 0, 0.6470588, 1, 1,
0.1867401, 0.1328394, 0.6344105, 0, 0.6392157, 1, 1,
0.1894924, -0.8911655, 3.001318, 0, 0.6352941, 1, 1,
0.1926613, -0.2365582, 0.9243538, 0, 0.627451, 1, 1,
0.194755, 0.6253676, -0.3478806, 0, 0.6235294, 1, 1,
0.1978952, 0.707973, 1.469147, 0, 0.6156863, 1, 1,
0.199947, 0.3103309, 0.4345542, 0, 0.6117647, 1, 1,
0.2025263, -0.135627, 1.079698, 0, 0.6039216, 1, 1,
0.2059927, 0.1420468, 1.755696, 0, 0.5960785, 1, 1,
0.2063555, 0.4991862, -0.221467, 0, 0.5921569, 1, 1,
0.2083432, 0.2804258, 1.413001, 0, 0.5843138, 1, 1,
0.2093507, -0.9959368, 4.742908, 0, 0.5803922, 1, 1,
0.2093895, 0.006505575, 2.819969, 0, 0.572549, 1, 1,
0.209711, -0.439796, 1.700614, 0, 0.5686275, 1, 1,
0.2117946, -2.328167, 4.718254, 0, 0.5607843, 1, 1,
0.21245, -0.1980932, 3.122373, 0, 0.5568628, 1, 1,
0.2148619, -0.5808142, 4.432473, 0, 0.5490196, 1, 1,
0.2151637, 0.2382301, -0.2211323, 0, 0.5450981, 1, 1,
0.216994, -0.3145892, 3.2428, 0, 0.5372549, 1, 1,
0.2213173, 0.636526, 1.027141, 0, 0.5333334, 1, 1,
0.2216652, 0.4029863, -0.03797848, 0, 0.5254902, 1, 1,
0.2238028, 0.6322756, 3.094568, 0, 0.5215687, 1, 1,
0.2325339, 0.1048869, -1.541676, 0, 0.5137255, 1, 1,
0.2348686, 1.203994, 2.72669, 0, 0.509804, 1, 1,
0.235335, -0.7194443, 3.492055, 0, 0.5019608, 1, 1,
0.2381722, 0.7508349, 0.6389233, 0, 0.4941176, 1, 1,
0.2415101, -1.217089, 3.106865, 0, 0.4901961, 1, 1,
0.2457726, 0.1995343, 2.111583, 0, 0.4823529, 1, 1,
0.2516415, 0.3552713, 0.2312215, 0, 0.4784314, 1, 1,
0.2517905, -0.5648826, 1.327083, 0, 0.4705882, 1, 1,
0.2585639, 1.69746, 2.714216, 0, 0.4666667, 1, 1,
0.2591302, -0.01450344, 0.3784865, 0, 0.4588235, 1, 1,
0.2629191, -0.6974828, 1.394153, 0, 0.454902, 1, 1,
0.2660113, -1.317127, 4.177267, 0, 0.4470588, 1, 1,
0.2684419, -0.1004233, 0.3247305, 0, 0.4431373, 1, 1,
0.2690918, 0.132255, 0.7166063, 0, 0.4352941, 1, 1,
0.2731346, 0.2663901, 1.215652, 0, 0.4313726, 1, 1,
0.2733717, 0.1557275, 0.2115625, 0, 0.4235294, 1, 1,
0.2778504, 1.302289, 0.4127152, 0, 0.4196078, 1, 1,
0.2825235, 1.293176, -0.4977984, 0, 0.4117647, 1, 1,
0.2848606, -0.2810024, 2.025193, 0, 0.4078431, 1, 1,
0.2886156, -0.05553622, -0.06387753, 0, 0.4, 1, 1,
0.2895127, 1.910206, 0.09613328, 0, 0.3921569, 1, 1,
0.2896908, -0.6127214, 3.567591, 0, 0.3882353, 1, 1,
0.2908147, 1.102636, 0.7960787, 0, 0.3803922, 1, 1,
0.2924727, -0.6142672, 2.139508, 0, 0.3764706, 1, 1,
0.3015609, 1.353231, -2.093071, 0, 0.3686275, 1, 1,
0.3030374, -0.06212544, 2.630961, 0, 0.3647059, 1, 1,
0.304876, -0.3583204, 3.419882, 0, 0.3568628, 1, 1,
0.3053875, 0.2914734, 0.7134738, 0, 0.3529412, 1, 1,
0.3069789, -0.7762983, 3.286974, 0, 0.345098, 1, 1,
0.3089316, 1.508322, 0.2861945, 0, 0.3411765, 1, 1,
0.3110022, 0.7882806, 0.9875436, 0, 0.3333333, 1, 1,
0.311722, 1.821365, -0.8877909, 0, 0.3294118, 1, 1,
0.317528, -1.247543, 2.898906, 0, 0.3215686, 1, 1,
0.3202852, 1.452147, 0.470521, 0, 0.3176471, 1, 1,
0.3240802, 0.9325305, 1.245119, 0, 0.3098039, 1, 1,
0.3245134, 1.905427, 0.1081426, 0, 0.3058824, 1, 1,
0.326562, 1.367883, 0.08700103, 0, 0.2980392, 1, 1,
0.3270989, 0.3145216, 0.4825727, 0, 0.2901961, 1, 1,
0.328631, 1.392716, 0.7654263, 0, 0.2862745, 1, 1,
0.3343777, 0.3883281, 2.098096, 0, 0.2784314, 1, 1,
0.3371129, 0.59609, -0.144296, 0, 0.2745098, 1, 1,
0.3386029, -0.2539633, 2.096089, 0, 0.2666667, 1, 1,
0.3388939, 0.8795237, 1.786608, 0, 0.2627451, 1, 1,
0.3397106, -1.439749, 3.797321, 0, 0.254902, 1, 1,
0.3407911, -0.3815881, 2.661012, 0, 0.2509804, 1, 1,
0.3437969, 0.2066209, 0.5028989, 0, 0.2431373, 1, 1,
0.3439977, -0.9321538, 1.557091, 0, 0.2392157, 1, 1,
0.348257, 0.9366176, 0.8988973, 0, 0.2313726, 1, 1,
0.3547548, 0.04324416, 1.508815, 0, 0.227451, 1, 1,
0.367855, -0.4032101, 3.015639, 0, 0.2196078, 1, 1,
0.3710521, 0.05068565, 2.267609, 0, 0.2156863, 1, 1,
0.372736, 1.833684, -0.2968329, 0, 0.2078431, 1, 1,
0.3731938, 0.5283026, 1.577484, 0, 0.2039216, 1, 1,
0.373332, -0.7759147, 3.949718, 0, 0.1960784, 1, 1,
0.381442, 0.4695471, -0.5342333, 0, 0.1882353, 1, 1,
0.3914573, -0.7635428, 3.783011, 0, 0.1843137, 1, 1,
0.3916259, -0.1432719, 2.108995, 0, 0.1764706, 1, 1,
0.3921394, -0.1931176, 0.8316584, 0, 0.172549, 1, 1,
0.396168, -1.935159, 2.005582, 0, 0.1647059, 1, 1,
0.3965303, -1.409702, 3.438642, 0, 0.1607843, 1, 1,
0.3966241, 0.3013148, 0.8925228, 0, 0.1529412, 1, 1,
0.3986964, -0.6961872, 4.420055, 0, 0.1490196, 1, 1,
0.4041786, 0.2041748, 1.74398, 0, 0.1411765, 1, 1,
0.4062001, 0.1064189, 0.7047267, 0, 0.1372549, 1, 1,
0.4227639, -1.41354, 4.808515, 0, 0.1294118, 1, 1,
0.4312741, 1.194147, -0.1925416, 0, 0.1254902, 1, 1,
0.433113, 0.1298697, 0.8084251, 0, 0.1176471, 1, 1,
0.4337934, 0.3486422, 1.363897, 0, 0.1137255, 1, 1,
0.4434889, -1.198048, 2.074771, 0, 0.1058824, 1, 1,
0.4461592, 1.883285, 0.8959299, 0, 0.09803922, 1, 1,
0.4469413, -0.1479948, 1.574475, 0, 0.09411765, 1, 1,
0.4484583, -0.6466839, 2.281053, 0, 0.08627451, 1, 1,
0.4487523, 0.9440541, 1.374071, 0, 0.08235294, 1, 1,
0.4498788, -0.5812488, 4.678913, 0, 0.07450981, 1, 1,
0.4508435, -0.2972668, 2.570784, 0, 0.07058824, 1, 1,
0.4532074, -1.294378, 2.390615, 0, 0.0627451, 1, 1,
0.4600379, 0.816792, 0.7608889, 0, 0.05882353, 1, 1,
0.4603956, -0.08705068, 2.610786, 0, 0.05098039, 1, 1,
0.461089, 1.386693, 0.7226778, 0, 0.04705882, 1, 1,
0.4627408, -1.330004, 3.033142, 0, 0.03921569, 1, 1,
0.4661489, -0.9906839, 3.017507, 0, 0.03529412, 1, 1,
0.4661951, 0.3798284, 0.5328656, 0, 0.02745098, 1, 1,
0.4666094, -0.2007462, 2.079897, 0, 0.02352941, 1, 1,
0.4744853, -2.154414, 2.279406, 0, 0.01568628, 1, 1,
0.4761272, -0.960845, 2.898886, 0, 0.01176471, 1, 1,
0.4775696, 1.343957, 0.3629794, 0, 0.003921569, 1, 1,
0.4821199, -0.1233203, 1.208006, 0.003921569, 0, 1, 1,
0.4841413, 0.5338455, 1.571064, 0.007843138, 0, 1, 1,
0.4865826, 0.6958078, 1.818922, 0.01568628, 0, 1, 1,
0.4873067, 0.1317039, 1.631318, 0.01960784, 0, 1, 1,
0.4875715, 0.310574, 0.4347905, 0.02745098, 0, 1, 1,
0.4909416, 0.3942169, 0.6357113, 0.03137255, 0, 1, 1,
0.4984904, 0.2859884, 1.715145, 0.03921569, 0, 1, 1,
0.4993035, -0.1708739, 2.714012, 0.04313726, 0, 1, 1,
0.5006248, 0.07872877, 3.773684, 0.05098039, 0, 1, 1,
0.5006446, 0.6240508, 2.864926, 0.05490196, 0, 1, 1,
0.5038565, -0.9072556, 3.159062, 0.0627451, 0, 1, 1,
0.5068777, 0.7730885, 0.9582959, 0.06666667, 0, 1, 1,
0.5085939, -1.710564, 4.653008, 0.07450981, 0, 1, 1,
0.5093197, 0.6847696, -0.6911653, 0.07843138, 0, 1, 1,
0.512772, -0.6666605, 2.514245, 0.08627451, 0, 1, 1,
0.5153368, 1.258442, 0.6800628, 0.09019608, 0, 1, 1,
0.517023, -1.134184, 2.863181, 0.09803922, 0, 1, 1,
0.5184044, -1.091997, 1.838313, 0.1058824, 0, 1, 1,
0.5196627, -0.1045058, 0.1000491, 0.1098039, 0, 1, 1,
0.52161, 1.11343, -0.8012556, 0.1176471, 0, 1, 1,
0.5218889, 0.3885989, 1.720613, 0.1215686, 0, 1, 1,
0.5221392, 2.231264, 0.4338253, 0.1294118, 0, 1, 1,
0.5223204, -1.194061, 1.763258, 0.1333333, 0, 1, 1,
0.524105, -1.499736, 3.888696, 0.1411765, 0, 1, 1,
0.5262879, 0.5839784, 2.648291, 0.145098, 0, 1, 1,
0.5292833, 0.04927467, 0.8486173, 0.1529412, 0, 1, 1,
0.5304598, -1.798255, 2.516189, 0.1568628, 0, 1, 1,
0.5344624, 2.968036, 0.1029864, 0.1647059, 0, 1, 1,
0.5345823, -0.6338646, 2.645956, 0.1686275, 0, 1, 1,
0.5401506, 1.346465, -0.1115641, 0.1764706, 0, 1, 1,
0.5402314, -0.9997237, 4.100842, 0.1803922, 0, 1, 1,
0.5434951, -0.4664947, 1.43333, 0.1882353, 0, 1, 1,
0.5451962, -0.27084, 2.313165, 0.1921569, 0, 1, 1,
0.5518742, -0.7573498, 2.36603, 0.2, 0, 1, 1,
0.5522944, -1.77367, 3.776026, 0.2078431, 0, 1, 1,
0.5536928, 1.145787, 0.09475943, 0.2117647, 0, 1, 1,
0.5571852, -0.3154491, 2.7219, 0.2196078, 0, 1, 1,
0.5594774, -1.112678, 3.294862, 0.2235294, 0, 1, 1,
0.5598397, -0.8831242, 2.059996, 0.2313726, 0, 1, 1,
0.5617598, 0.02638884, 2.236416, 0.2352941, 0, 1, 1,
0.5628417, -1.389296, 4.253135, 0.2431373, 0, 1, 1,
0.5632042, -0.1495317, 0.6866959, 0.2470588, 0, 1, 1,
0.5654778, -0.1349028, 1.71765, 0.254902, 0, 1, 1,
0.5692895, -0.7785735, 1.148701, 0.2588235, 0, 1, 1,
0.5713964, -0.2370054, 1.051509, 0.2666667, 0, 1, 1,
0.5795951, 0.367219, 2.397942, 0.2705882, 0, 1, 1,
0.5831015, 1.757758, -0.5812496, 0.2784314, 0, 1, 1,
0.5890902, 0.09924296, 1.14922, 0.282353, 0, 1, 1,
0.5900319, -0.2693296, 3.73251, 0.2901961, 0, 1, 1,
0.5900957, -1.176015, 4.47541, 0.2941177, 0, 1, 1,
0.5955375, -0.7772021, 2.379493, 0.3019608, 0, 1, 1,
0.5998579, 0.859466, 3.472012, 0.3098039, 0, 1, 1,
0.6007183, -0.5536208, 2.895127, 0.3137255, 0, 1, 1,
0.6089997, -0.6190545, 2.197237, 0.3215686, 0, 1, 1,
0.6105163, 0.5202492, -0.9899811, 0.3254902, 0, 1, 1,
0.6107899, 1.073483, 1.245211, 0.3333333, 0, 1, 1,
0.6142305, -0.9477869, 2.667583, 0.3372549, 0, 1, 1,
0.6189107, 0.801075, -1.644119, 0.345098, 0, 1, 1,
0.6189358, -1.791368, 3.726851, 0.3490196, 0, 1, 1,
0.6221218, -1.087482, 2.270551, 0.3568628, 0, 1, 1,
0.6301012, -0.3576943, 3.994536, 0.3607843, 0, 1, 1,
0.631135, 0.7007639, 0.8385872, 0.3686275, 0, 1, 1,
0.6313354, 0.3307629, 0.3882234, 0.372549, 0, 1, 1,
0.634559, -0.1030627, 2.253418, 0.3803922, 0, 1, 1,
0.6391135, 1.387836, 0.07331692, 0.3843137, 0, 1, 1,
0.6465669, -1.148401, 3.771668, 0.3921569, 0, 1, 1,
0.6566195, 1.206591, -0.7406915, 0.3960784, 0, 1, 1,
0.6665406, 1.362568, 1.738516, 0.4039216, 0, 1, 1,
0.6697583, 0.2449436, 0.02160302, 0.4117647, 0, 1, 1,
0.6709827, 0.1603226, 0.7780437, 0.4156863, 0, 1, 1,
0.6754311, -1.391468, 4.707239, 0.4235294, 0, 1, 1,
0.6755499, -1.1868, 2.389071, 0.427451, 0, 1, 1,
0.6870214, -0.8905467, 2.120019, 0.4352941, 0, 1, 1,
0.6873049, -0.3255344, 2.594116, 0.4392157, 0, 1, 1,
0.6949657, 1.429399, -0.8898281, 0.4470588, 0, 1, 1,
0.6962684, -0.6120316, 1.898132, 0.4509804, 0, 1, 1,
0.6964594, -1.219433, 3.832721, 0.4588235, 0, 1, 1,
0.7003673, -0.6162107, 0.7357892, 0.4627451, 0, 1, 1,
0.7053707, -0.3547344, 1.931148, 0.4705882, 0, 1, 1,
0.7073216, 0.9337797, -1.145148, 0.4745098, 0, 1, 1,
0.707525, 1.093838, -0.1463837, 0.4823529, 0, 1, 1,
0.7081965, -1.465874, 4.278609, 0.4862745, 0, 1, 1,
0.7123241, 1.049154, 1.233265, 0.4941176, 0, 1, 1,
0.7133591, 0.3665484, 1.808189, 0.5019608, 0, 1, 1,
0.7161096, 0.7517555, 0.8037658, 0.5058824, 0, 1, 1,
0.7224506, 0.5404211, 0.4792966, 0.5137255, 0, 1, 1,
0.7237519, 0.7332141, 1.289469, 0.5176471, 0, 1, 1,
0.728886, 1.146539, -1.036016, 0.5254902, 0, 1, 1,
0.7351604, -0.7364442, 3.886951, 0.5294118, 0, 1, 1,
0.7385197, -1.062141, 2.050555, 0.5372549, 0, 1, 1,
0.7399952, -0.2651592, 2.692313, 0.5411765, 0, 1, 1,
0.7426054, 0.7475991, -0.8116655, 0.5490196, 0, 1, 1,
0.7433172, 0.8283701, 1.81178, 0.5529412, 0, 1, 1,
0.748642, -0.7011483, 2.255987, 0.5607843, 0, 1, 1,
0.7503863, 1.852422, -0.5209633, 0.5647059, 0, 1, 1,
0.7512164, -0.6295937, 0.520027, 0.572549, 0, 1, 1,
0.7517525, 1.849554, -0.1539804, 0.5764706, 0, 1, 1,
0.7520574, 0.9884007, 0.5723278, 0.5843138, 0, 1, 1,
0.7579489, -0.6603782, 3.759696, 0.5882353, 0, 1, 1,
0.7609283, 0.4843814, 2.634226, 0.5960785, 0, 1, 1,
0.7640226, 0.4848585, 1.546077, 0.6039216, 0, 1, 1,
0.7680526, -1.108322, 2.300303, 0.6078432, 0, 1, 1,
0.7691391, -0.6333035, 2.517121, 0.6156863, 0, 1, 1,
0.7751511, 0.9484412, 0.6910434, 0.6196079, 0, 1, 1,
0.7830355, -1.639445, 1.125643, 0.627451, 0, 1, 1,
0.785074, -2.094799, 2.559102, 0.6313726, 0, 1, 1,
0.7913196, 0.5053272, 1.37247, 0.6392157, 0, 1, 1,
0.798245, -0.320539, 1.760051, 0.6431373, 0, 1, 1,
0.8044213, 0.3182731, 1.046788, 0.6509804, 0, 1, 1,
0.8066315, 0.3993804, 2.493912, 0.654902, 0, 1, 1,
0.8087153, 0.8521742, 2.199902, 0.6627451, 0, 1, 1,
0.8129773, -1.304496, 2.703114, 0.6666667, 0, 1, 1,
0.8251576, 0.2067349, 1.772655, 0.6745098, 0, 1, 1,
0.8274414, 1.572466, 1.404421, 0.6784314, 0, 1, 1,
0.8290069, 1.814061, 1.751663, 0.6862745, 0, 1, 1,
0.8312857, 1.71316, 2.41867, 0.6901961, 0, 1, 1,
0.8378696, 1.966707, 0.2186446, 0.6980392, 0, 1, 1,
0.8383363, -0.2684581, 1.998858, 0.7058824, 0, 1, 1,
0.8518885, -1.641232, 2.55588, 0.7098039, 0, 1, 1,
0.8560552, -0.4556066, 5.180165, 0.7176471, 0, 1, 1,
0.8626757, -0.1407334, 0.9977868, 0.7215686, 0, 1, 1,
0.866375, 0.7715489, -0.0754898, 0.7294118, 0, 1, 1,
0.8681862, 1.025716, 1.612983, 0.7333333, 0, 1, 1,
0.8683054, -0.06826344, 1.082416, 0.7411765, 0, 1, 1,
0.8718698, 1.488487, 0.5452063, 0.7450981, 0, 1, 1,
0.8724577, -0.9919057, 4.10118, 0.7529412, 0, 1, 1,
0.8730276, 0.1485333, 0.3555914, 0.7568628, 0, 1, 1,
0.8740399, -2.314379, 3.614602, 0.7647059, 0, 1, 1,
0.8750713, -0.2123811, 1.555389, 0.7686275, 0, 1, 1,
0.8761201, 1.920651, 0.02831712, 0.7764706, 0, 1, 1,
0.8826704, -0.2783827, 2.310629, 0.7803922, 0, 1, 1,
0.8828515, 0.3132343, 2.901286, 0.7882353, 0, 1, 1,
0.8923919, -1.153833, 0.5598182, 0.7921569, 0, 1, 1,
0.8968804, -0.8685434, 0.02834219, 0.8, 0, 1, 1,
0.909621, -0.4511927, 1.157473, 0.8078431, 0, 1, 1,
0.9105485, -0.6886411, 1.651941, 0.8117647, 0, 1, 1,
0.9167766, 0.003064506, 1.88216, 0.8196079, 0, 1, 1,
0.921373, 1.337414, -1.026574, 0.8235294, 0, 1, 1,
0.9247349, 0.4322647, 0.9792562, 0.8313726, 0, 1, 1,
0.9310101, -0.3731042, 3.090477, 0.8352941, 0, 1, 1,
0.9359695, -0.1496042, 0.8731648, 0.8431373, 0, 1, 1,
0.9368864, -0.5011269, 1.211007, 0.8470588, 0, 1, 1,
0.9398859, -1.478805, 1.857404, 0.854902, 0, 1, 1,
0.9615893, 0.5661488, 0.03596647, 0.8588235, 0, 1, 1,
0.9630817, -2.274304, 2.442294, 0.8666667, 0, 1, 1,
0.9680672, -0.670241, 3.921837, 0.8705882, 0, 1, 1,
0.9692623, 0.8170277, 0.7467479, 0.8784314, 0, 1, 1,
0.9745764, 1.02258, 1.688922, 0.8823529, 0, 1, 1,
0.9746577, -1.145592, 1.655625, 0.8901961, 0, 1, 1,
0.9813434, 0.2822689, 1.356446, 0.8941177, 0, 1, 1,
0.9863544, 0.1374719, 1.512952, 0.9019608, 0, 1, 1,
0.9896924, 0.3358909, -0.3512589, 0.9098039, 0, 1, 1,
0.9911019, 1.841268, 0.7453819, 0.9137255, 0, 1, 1,
0.9931343, -0.6670166, 2.1103, 0.9215686, 0, 1, 1,
0.9980446, -0.8801482, 1.87453, 0.9254902, 0, 1, 1,
0.9992252, -0.3236499, -0.3631592, 0.9333333, 0, 1, 1,
0.999545, -1.226218, 2.830391, 0.9372549, 0, 1, 1,
1.006384, -1.166601, 3.51116, 0.945098, 0, 1, 1,
1.008382, 1.877383, 0.8489798, 0.9490196, 0, 1, 1,
1.031544, -0.2237885, -0.1027252, 0.9568627, 0, 1, 1,
1.031669, -1.327714, 3.131255, 0.9607843, 0, 1, 1,
1.036063, -0.3828054, 0.1458405, 0.9686275, 0, 1, 1,
1.037662, 1.664464, -0.3002314, 0.972549, 0, 1, 1,
1.041021, 0.8302459, 1.392272, 0.9803922, 0, 1, 1,
1.041471, -0.4461311, 1.657651, 0.9843137, 0, 1, 1,
1.044881, 1.352245, -0.5895219, 0.9921569, 0, 1, 1,
1.045157, -0.7045788, 1.177072, 0.9960784, 0, 1, 1,
1.048422, -1.172254, 2.491535, 1, 0, 0.9960784, 1,
1.061373, -1.310125, 1.267008, 1, 0, 0.9882353, 1,
1.069109, -0.8681871, 1.464611, 1, 0, 0.9843137, 1,
1.072446, -0.09510238, 1.175425, 1, 0, 0.9764706, 1,
1.085875, 0.8548538, 1.015949, 1, 0, 0.972549, 1,
1.08805, -0.561264, 4.005916, 1, 0, 0.9647059, 1,
1.09011, 1.129554, -0.5115057, 1, 0, 0.9607843, 1,
1.091491, -0.7664657, 0.4689168, 1, 0, 0.9529412, 1,
1.095606, 1.150161, 0.05241329, 1, 0, 0.9490196, 1,
1.095777, 0.9946165, 2.53392, 1, 0, 0.9411765, 1,
1.100286, -0.1800904, 0.621133, 1, 0, 0.9372549, 1,
1.10039, -0.4107453, 1.821869, 1, 0, 0.9294118, 1,
1.100552, -0.6077191, 0.6797178, 1, 0, 0.9254902, 1,
1.109479, -0.6700706, 2.441391, 1, 0, 0.9176471, 1,
1.119211, -1.346661, 1.542282, 1, 0, 0.9137255, 1,
1.119964, 0.0927643, 1.730249, 1, 0, 0.9058824, 1,
1.12152, 0.1573295, 1.737177, 1, 0, 0.9019608, 1,
1.124838, -1.173539, 2.780037, 1, 0, 0.8941177, 1,
1.127134, 0.6869574, 0.7451997, 1, 0, 0.8862745, 1,
1.128396, -0.7089068, 2.125087, 1, 0, 0.8823529, 1,
1.128511, 0.6923257, 2.867342, 1, 0, 0.8745098, 1,
1.130186, 1.794373, -0.651033, 1, 0, 0.8705882, 1,
1.139986, 1.110551, 1.654732, 1, 0, 0.8627451, 1,
1.141016, -2.188185, 1.227403, 1, 0, 0.8588235, 1,
1.145089, -1.212531, 0.893705, 1, 0, 0.8509804, 1,
1.145505, 0.2906288, -0.08747967, 1, 0, 0.8470588, 1,
1.148435, -1.234815, 1.190456, 1, 0, 0.8392157, 1,
1.152072, 1.743329, 0.02116613, 1, 0, 0.8352941, 1,
1.169377, 1.045635, 0.6640199, 1, 0, 0.827451, 1,
1.175112, -1.017537, 1.394485, 1, 0, 0.8235294, 1,
1.181602, 0.593203, 0.7457868, 1, 0, 0.8156863, 1,
1.184179, 0.5044934, 2.022669, 1, 0, 0.8117647, 1,
1.189044, -0.680769, 2.975811, 1, 0, 0.8039216, 1,
1.202118, -0.7002993, 3.722463, 1, 0, 0.7960784, 1,
1.202295, 0.9189205, 1.596057, 1, 0, 0.7921569, 1,
1.202456, -0.2029393, 2.479337, 1, 0, 0.7843137, 1,
1.20584, 0.7947271, 2.231661, 1, 0, 0.7803922, 1,
1.210682, 0.2959326, 2.032244, 1, 0, 0.772549, 1,
1.211876, -0.4806619, 1.053542, 1, 0, 0.7686275, 1,
1.215841, 1.229024, 0.7325762, 1, 0, 0.7607843, 1,
1.215912, 1.248878, 1.509792, 1, 0, 0.7568628, 1,
1.227676, -0.545043, 2.47157, 1, 0, 0.7490196, 1,
1.231849, 0.5458568, 1.323422, 1, 0, 0.7450981, 1,
1.237796, 1.05114, 0.9344841, 1, 0, 0.7372549, 1,
1.2386, 0.9823267, 1.391009, 1, 0, 0.7333333, 1,
1.241401, -0.861936, 1.724504, 1, 0, 0.7254902, 1,
1.244232, 1.273556, 0.8232771, 1, 0, 0.7215686, 1,
1.244626, -0.2488041, 3.133759, 1, 0, 0.7137255, 1,
1.247396, 0.6176153, 0.7112225, 1, 0, 0.7098039, 1,
1.252015, 0.023073, 2.107114, 1, 0, 0.7019608, 1,
1.258269, 1.097672, -0.5557375, 1, 0, 0.6941177, 1,
1.258796, 0.1692148, 2.851257, 1, 0, 0.6901961, 1,
1.277136, -0.5987853, 0.1923564, 1, 0, 0.682353, 1,
1.307321, -0.4061409, 3.150779, 1, 0, 0.6784314, 1,
1.310431, -0.9474542, 2.684733, 1, 0, 0.6705883, 1,
1.311619, -1.320637, 2.872048, 1, 0, 0.6666667, 1,
1.318739, -0.5143095, 2.850039, 1, 0, 0.6588235, 1,
1.320938, 1.335862, 1.689912, 1, 0, 0.654902, 1,
1.3323, 0.3366646, 0.7721411, 1, 0, 0.6470588, 1,
1.33692, 1.25422, 0.5068052, 1, 0, 0.6431373, 1,
1.341899, 1.070758, 1.865376, 1, 0, 0.6352941, 1,
1.344902, -0.1920907, 1.716826, 1, 0, 0.6313726, 1,
1.350617, 1.904337, -1.178251, 1, 0, 0.6235294, 1,
1.351824, 0.8882563, 0.9971772, 1, 0, 0.6196079, 1,
1.356259, -1.699168, 3.706633, 1, 0, 0.6117647, 1,
1.357704, 0.7896299, 2.58319, 1, 0, 0.6078432, 1,
1.371105, -0.776157, 2.04178, 1, 0, 0.6, 1,
1.371909, -0.1897846, 1.421307, 1, 0, 0.5921569, 1,
1.372693, -1.847106, 2.263156, 1, 0, 0.5882353, 1,
1.373001, -1.114925, 2.298376, 1, 0, 0.5803922, 1,
1.374521, 0.6895646, 2.902784, 1, 0, 0.5764706, 1,
1.383512, -0.8726462, 4.345157, 1, 0, 0.5686275, 1,
1.386703, 0.8711103, 1.084735, 1, 0, 0.5647059, 1,
1.398056, -0.2290051, 2.389476, 1, 0, 0.5568628, 1,
1.398117, -1.094625, 2.578453, 1, 0, 0.5529412, 1,
1.405708, -0.3831185, 1.597161, 1, 0, 0.5450981, 1,
1.40722, 1.138248, 0.6605029, 1, 0, 0.5411765, 1,
1.41737, -1.595947, 1.584072, 1, 0, 0.5333334, 1,
1.417746, -0.4473881, 1.685024, 1, 0, 0.5294118, 1,
1.424714, 0.4645347, 0.1863829, 1, 0, 0.5215687, 1,
1.440268, -0.8714832, 2.37724, 1, 0, 0.5176471, 1,
1.443967, -0.1034291, 3.148664, 1, 0, 0.509804, 1,
1.455491, -0.7092267, 1.415098, 1, 0, 0.5058824, 1,
1.465893, -0.491589, 0.9030309, 1, 0, 0.4980392, 1,
1.470912, -0.3733641, 1.084312, 1, 0, 0.4901961, 1,
1.476745, 0.906593, 1.344184, 1, 0, 0.4862745, 1,
1.481308, 0.8934532, 0.953289, 1, 0, 0.4784314, 1,
1.489643, 1.630032, 0.1088913, 1, 0, 0.4745098, 1,
1.507226, -0.002164431, 1.390939, 1, 0, 0.4666667, 1,
1.513488, 0.5999383, 1.186846, 1, 0, 0.4627451, 1,
1.513511, -0.2038569, 1.961219, 1, 0, 0.454902, 1,
1.516476, -0.5742761, 2.098826, 1, 0, 0.4509804, 1,
1.519765, 1.557228, 1.434761, 1, 0, 0.4431373, 1,
1.524311, 0.8914576, 3.300389, 1, 0, 0.4392157, 1,
1.525563, -0.57965, 0.8746043, 1, 0, 0.4313726, 1,
1.525749, 0.3500386, 4.153262, 1, 0, 0.427451, 1,
1.527713, -0.7026079, 0.8492915, 1, 0, 0.4196078, 1,
1.529427, 0.290094, 1.16205, 1, 0, 0.4156863, 1,
1.547875, -1.140134, 2.880181, 1, 0, 0.4078431, 1,
1.549176, 1.574651, -0.5303113, 1, 0, 0.4039216, 1,
1.55672, -0.6295032, 3.150602, 1, 0, 0.3960784, 1,
1.605606, -0.1307042, -0.3791432, 1, 0, 0.3882353, 1,
1.613746, 1.114808, 0.1544415, 1, 0, 0.3843137, 1,
1.629481, 3.106072, 1.03072, 1, 0, 0.3764706, 1,
1.632074, -0.08307675, 2.752342, 1, 0, 0.372549, 1,
1.641279, -1.358862, 1.096044, 1, 0, 0.3647059, 1,
1.641842, -1.213157, 2.199559, 1, 0, 0.3607843, 1,
1.653261, -0.03743251, 0.5130799, 1, 0, 0.3529412, 1,
1.673491, 1.429642, 1.39013, 1, 0, 0.3490196, 1,
1.69808, 0.1645399, 1.555045, 1, 0, 0.3411765, 1,
1.70565, -0.1266568, -0.6550061, 1, 0, 0.3372549, 1,
1.706162, 0.8187135, 1.952651, 1, 0, 0.3294118, 1,
1.708379, 0.4219451, 2.569645, 1, 0, 0.3254902, 1,
1.712149, -0.2428476, 1.833533, 1, 0, 0.3176471, 1,
1.718252, -0.5085411, 3.939655, 1, 0, 0.3137255, 1,
1.734374, 2.66151, 0.525659, 1, 0, 0.3058824, 1,
1.742696, 0.7614512, -0.4173362, 1, 0, 0.2980392, 1,
1.745691, -0.9099669, 1.993108, 1, 0, 0.2941177, 1,
1.755204, -1.556397, 2.214363, 1, 0, 0.2862745, 1,
1.75603, 1.458793, -0.03018925, 1, 0, 0.282353, 1,
1.759856, -0.8542789, 1.319451, 1, 0, 0.2745098, 1,
1.762404, 3.182671, 0.08126632, 1, 0, 0.2705882, 1,
1.800423, 0.3224013, 0.2773077, 1, 0, 0.2627451, 1,
1.812501, 0.6792243, 1.736931, 1, 0, 0.2588235, 1,
1.81541, -1.588815, 3.848546, 1, 0, 0.2509804, 1,
1.826618, 0.03864358, 2.405922, 1, 0, 0.2470588, 1,
1.847454, 0.6673875, 2.114632, 1, 0, 0.2392157, 1,
1.84785, 1.109229, -1.307371, 1, 0, 0.2352941, 1,
1.875219, 0.374005, 3.572388, 1, 0, 0.227451, 1,
1.877499, 0.8913815, 0.8487012, 1, 0, 0.2235294, 1,
1.890142, -1.164556, 1.748426, 1, 0, 0.2156863, 1,
1.890628, 0.03621235, 1.251081, 1, 0, 0.2117647, 1,
1.902027, 0.6488107, 1.781014, 1, 0, 0.2039216, 1,
1.911989, -1.189996, 2.725394, 1, 0, 0.1960784, 1,
1.918891, 1.729302, 1.350543, 1, 0, 0.1921569, 1,
1.920097, -0.7450851, -0.4700576, 1, 0, 0.1843137, 1,
1.927441, -1.272009, 3.08883, 1, 0, 0.1803922, 1,
1.958824, -0.3489076, 2.323795, 1, 0, 0.172549, 1,
1.982482, 0.5666675, 0.9881898, 1, 0, 0.1686275, 1,
2.003105, -0.2015104, 2.751462, 1, 0, 0.1607843, 1,
2.012331, 0.659499, 2.084247, 1, 0, 0.1568628, 1,
2.056754, 0.3118058, 3.019013, 1, 0, 0.1490196, 1,
2.089996, -0.6691944, 0.619536, 1, 0, 0.145098, 1,
2.145168, 1.523882, 2.290679, 1, 0, 0.1372549, 1,
2.169114, 1.28768, -0.6736866, 1, 0, 0.1333333, 1,
2.177997, 1.65951, 1.381895, 1, 0, 0.1254902, 1,
2.179043, 0.243621, 1.721494, 1, 0, 0.1215686, 1,
2.195743, -1.264113, 2.913102, 1, 0, 0.1137255, 1,
2.195747, -0.09502118, 0.5463392, 1, 0, 0.1098039, 1,
2.20668, 1.051739, 1.210071, 1, 0, 0.1019608, 1,
2.281446, -0.7988061, -0.8054675, 1, 0, 0.09411765, 1,
2.458861, 0.9129485, 1.677207, 1, 0, 0.09019608, 1,
2.46139, 0.9193702, 3.159024, 1, 0, 0.08235294, 1,
2.490414, 0.1251028, 0.8161754, 1, 0, 0.07843138, 1,
2.496685, 0.1241363, 0.8280166, 1, 0, 0.07058824, 1,
2.501897, 0.9603647, 1.137009, 1, 0, 0.06666667, 1,
2.530195, -0.8595723, 1.142385, 1, 0, 0.05882353, 1,
2.628626, -0.07208563, 1.029024, 1, 0, 0.05490196, 1,
2.694805, 1.256068, 1.647691, 1, 0, 0.04705882, 1,
2.695414, 0.7789968, 0.8745199, 1, 0, 0.04313726, 1,
2.817021, -0.9069743, 1.659639, 1, 0, 0.03529412, 1,
2.833285, 0.2369663, 0.2173028, 1, 0, 0.03137255, 1,
2.837566, 0.8707086, 0.9363672, 1, 0, 0.02352941, 1,
3.313532, 0.7459348, 2.100928, 1, 0, 0.01960784, 1,
3.352152, 0.131751, 0.4512039, 1, 0, 0.01176471, 1,
3.355765, 0.4416042, 1.351202, 1, 0, 0.007843138, 1
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
-0.1799033, -3.799199, -7.389728, 0, -0.5, 0.5, 0.5,
-0.1799033, -3.799199, -7.389728, 1, -0.5, 0.5, 0.5,
-0.1799033, -3.799199, -7.389728, 1, 1.5, 0.5, 0.5,
-0.1799033, -3.799199, -7.389728, 0, 1.5, 0.5, 0.5
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
-4.914164, 0.2059059, -7.389728, 0, -0.5, 0.5, 0.5,
-4.914164, 0.2059059, -7.389728, 1, -0.5, 0.5, 0.5,
-4.914164, 0.2059059, -7.389728, 1, 1.5, 0.5, 0.5,
-4.914164, 0.2059059, -7.389728, 0, 1.5, 0.5, 0.5
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
-4.914164, -3.799199, -0.1560266, 0, -0.5, 0.5, 0.5,
-4.914164, -3.799199, -0.1560266, 1, -0.5, 0.5, 0.5,
-4.914164, -3.799199, -0.1560266, 1, 1.5, 0.5, 0.5,
-4.914164, -3.799199, -0.1560266, 0, 1.5, 0.5, 0.5
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
-2, -2.874944, -5.720412,
2, -2.874944, -5.720412,
-2, -2.874944, -5.720412,
-2, -3.028987, -5.998631,
0, -2.874944, -5.720412,
0, -3.028987, -5.998631,
2, -2.874944, -5.720412,
2, -3.028987, -5.998631
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
-2, -3.337072, -6.55507, 0, -0.5, 0.5, 0.5,
-2, -3.337072, -6.55507, 1, -0.5, 0.5, 0.5,
-2, -3.337072, -6.55507, 1, 1.5, 0.5, 0.5,
-2, -3.337072, -6.55507, 0, 1.5, 0.5, 0.5,
0, -3.337072, -6.55507, 0, -0.5, 0.5, 0.5,
0, -3.337072, -6.55507, 1, -0.5, 0.5, 0.5,
0, -3.337072, -6.55507, 1, 1.5, 0.5, 0.5,
0, -3.337072, -6.55507, 0, 1.5, 0.5, 0.5,
2, -3.337072, -6.55507, 0, -0.5, 0.5, 0.5,
2, -3.337072, -6.55507, 1, -0.5, 0.5, 0.5,
2, -3.337072, -6.55507, 1, 1.5, 0.5, 0.5,
2, -3.337072, -6.55507, 0, 1.5, 0.5, 0.5
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
-3.821642, -2, -5.720412,
-3.821642, 3, -5.720412,
-3.821642, -2, -5.720412,
-4.003729, -2, -5.998631,
-3.821642, -1, -5.720412,
-4.003729, -1, -5.998631,
-3.821642, 0, -5.720412,
-4.003729, 0, -5.998631,
-3.821642, 1, -5.720412,
-4.003729, 1, -5.998631,
-3.821642, 2, -5.720412,
-4.003729, 2, -5.998631,
-3.821642, 3, -5.720412,
-4.003729, 3, -5.998631
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
-4.367903, -2, -6.55507, 0, -0.5, 0.5, 0.5,
-4.367903, -2, -6.55507, 1, -0.5, 0.5, 0.5,
-4.367903, -2, -6.55507, 1, 1.5, 0.5, 0.5,
-4.367903, -2, -6.55507, 0, 1.5, 0.5, 0.5,
-4.367903, -1, -6.55507, 0, -0.5, 0.5, 0.5,
-4.367903, -1, -6.55507, 1, -0.5, 0.5, 0.5,
-4.367903, -1, -6.55507, 1, 1.5, 0.5, 0.5,
-4.367903, -1, -6.55507, 0, 1.5, 0.5, 0.5,
-4.367903, 0, -6.55507, 0, -0.5, 0.5, 0.5,
-4.367903, 0, -6.55507, 1, -0.5, 0.5, 0.5,
-4.367903, 0, -6.55507, 1, 1.5, 0.5, 0.5,
-4.367903, 0, -6.55507, 0, 1.5, 0.5, 0.5,
-4.367903, 1, -6.55507, 0, -0.5, 0.5, 0.5,
-4.367903, 1, -6.55507, 1, -0.5, 0.5, 0.5,
-4.367903, 1, -6.55507, 1, 1.5, 0.5, 0.5,
-4.367903, 1, -6.55507, 0, 1.5, 0.5, 0.5,
-4.367903, 2, -6.55507, 0, -0.5, 0.5, 0.5,
-4.367903, 2, -6.55507, 1, -0.5, 0.5, 0.5,
-4.367903, 2, -6.55507, 1, 1.5, 0.5, 0.5,
-4.367903, 2, -6.55507, 0, 1.5, 0.5, 0.5,
-4.367903, 3, -6.55507, 0, -0.5, 0.5, 0.5,
-4.367903, 3, -6.55507, 1, -0.5, 0.5, 0.5,
-4.367903, 3, -6.55507, 1, 1.5, 0.5, 0.5,
-4.367903, 3, -6.55507, 0, 1.5, 0.5, 0.5
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
-3.821642, -2.874944, -4,
-3.821642, -2.874944, 4,
-3.821642, -2.874944, -4,
-4.003729, -3.028987, -4,
-3.821642, -2.874944, -2,
-4.003729, -3.028987, -2,
-3.821642, -2.874944, 0,
-4.003729, -3.028987, 0,
-3.821642, -2.874944, 2,
-4.003729, -3.028987, 2,
-3.821642, -2.874944, 4,
-4.003729, -3.028987, 4
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
-4.367903, -3.337072, -4, 0, -0.5, 0.5, 0.5,
-4.367903, -3.337072, -4, 1, -0.5, 0.5, 0.5,
-4.367903, -3.337072, -4, 1, 1.5, 0.5, 0.5,
-4.367903, -3.337072, -4, 0, 1.5, 0.5, 0.5,
-4.367903, -3.337072, -2, 0, -0.5, 0.5, 0.5,
-4.367903, -3.337072, -2, 1, -0.5, 0.5, 0.5,
-4.367903, -3.337072, -2, 1, 1.5, 0.5, 0.5,
-4.367903, -3.337072, -2, 0, 1.5, 0.5, 0.5,
-4.367903, -3.337072, 0, 0, -0.5, 0.5, 0.5,
-4.367903, -3.337072, 0, 1, -0.5, 0.5, 0.5,
-4.367903, -3.337072, 0, 1, 1.5, 0.5, 0.5,
-4.367903, -3.337072, 0, 0, 1.5, 0.5, 0.5,
-4.367903, -3.337072, 2, 0, -0.5, 0.5, 0.5,
-4.367903, -3.337072, 2, 1, -0.5, 0.5, 0.5,
-4.367903, -3.337072, 2, 1, 1.5, 0.5, 0.5,
-4.367903, -3.337072, 2, 0, 1.5, 0.5, 0.5,
-4.367903, -3.337072, 4, 0, -0.5, 0.5, 0.5,
-4.367903, -3.337072, 4, 1, -0.5, 0.5, 0.5,
-4.367903, -3.337072, 4, 1, 1.5, 0.5, 0.5,
-4.367903, -3.337072, 4, 0, 1.5, 0.5, 0.5
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
-3.821642, -2.874944, -5.720412,
-3.821642, 3.286756, -5.720412,
-3.821642, -2.874944, 5.408359,
-3.821642, 3.286756, 5.408359,
-3.821642, -2.874944, -5.720412,
-3.821642, -2.874944, 5.408359,
-3.821642, 3.286756, -5.720412,
-3.821642, 3.286756, 5.408359,
-3.821642, -2.874944, -5.720412,
3.461835, -2.874944, -5.720412,
-3.821642, -2.874944, 5.408359,
3.461835, -2.874944, 5.408359,
-3.821642, 3.286756, -5.720412,
3.461835, 3.286756, -5.720412,
-3.821642, 3.286756, 5.408359,
3.461835, 3.286756, 5.408359,
3.461835, -2.874944, -5.720412,
3.461835, 3.286756, -5.720412,
3.461835, -2.874944, 5.408359,
3.461835, 3.286756, 5.408359,
3.461835, -2.874944, -5.720412,
3.461835, -2.874944, 5.408359,
3.461835, 3.286756, -5.720412,
3.461835, 3.286756, 5.408359
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
var radius = 7.827236;
var distance = 34.82426;
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
mvMatrix.translate( 0.1799033, -0.2059059, 0.1560266 );
mvMatrix.scale( 1.16194, 1.373478, 0.7604578 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.82426);
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
carbetamid<-read.table("carbetamid.xyz")
```

```
## Error in read.table("carbetamid.xyz"): no lines available in input
```

```r
x<-carbetamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbetamid' not found
```

```r
y<-carbetamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbetamid' not found
```

```r
z<-carbetamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbetamid' not found
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
-3.715572, -0.7160828, -1.158358, 0, 0, 1, 1, 1,
-3.074494, 0.8359449, -2.669799, 1, 0, 0, 1, 1,
-2.837688, -1.102119, -2.836824, 1, 0, 0, 1, 1,
-2.73981, -0.2500319, -1.305155, 1, 0, 0, 1, 1,
-2.386893, 2.874965, 0.01014744, 1, 0, 0, 1, 1,
-2.32163, 1.197736, -0.3294041, 1, 0, 0, 1, 1,
-2.282234, 0.8693303, -0.6171982, 0, 0, 0, 1, 1,
-2.277231, -0.1837882, -1.503959, 0, 0, 0, 1, 1,
-2.271938, -0.158751, -1.270536, 0, 0, 0, 1, 1,
-2.26722, 0.01379888, -0.3648815, 0, 0, 0, 1, 1,
-2.209641, -0.5406557, -0.9289895, 0, 0, 0, 1, 1,
-2.186642, -0.09866819, -1.479957, 0, 0, 0, 1, 1,
-2.177801, 1.227829, -0.7323356, 0, 0, 0, 1, 1,
-2.176454, -1.843853, -1.14453, 1, 1, 1, 1, 1,
-2.143801, -1.242041, -2.533562, 1, 1, 1, 1, 1,
-2.093461, 0.2743744, -0.1594767, 1, 1, 1, 1, 1,
-2.039213, 1.877613, 0.4981858, 1, 1, 1, 1, 1,
-2.034249, -1.601931, -2.590942, 1, 1, 1, 1, 1,
-2.018717, -1.345059, -3.742768, 1, 1, 1, 1, 1,
-1.964593, -0.1335518, -0.840318, 1, 1, 1, 1, 1,
-1.94522, 0.6198716, -0.3016666, 1, 1, 1, 1, 1,
-1.915024, -0.5631654, -2.630818, 1, 1, 1, 1, 1,
-1.904122, -1.363941, -1.021618, 1, 1, 1, 1, 1,
-1.903185, 0.9385357, -1.71355, 1, 1, 1, 1, 1,
-1.902029, -1.183599, -4.030457, 1, 1, 1, 1, 1,
-1.895013, -0.7278212, -1.437064, 1, 1, 1, 1, 1,
-1.871709, -0.7166883, -2.503374, 1, 1, 1, 1, 1,
-1.86782, -1.783934, -2.679844, 1, 1, 1, 1, 1,
-1.853539, 0.9101257, -1.991591, 0, 0, 1, 1, 1,
-1.836928, 0.9048116, -0.3561034, 1, 0, 0, 1, 1,
-1.833544, -0.1640582, -3.210916, 1, 0, 0, 1, 1,
-1.832632, 0.6410702, -0.1663535, 1, 0, 0, 1, 1,
-1.831172, 1.111163, -0.05744188, 1, 0, 0, 1, 1,
-1.818724, -0.3914247, -0.3664938, 1, 0, 0, 1, 1,
-1.786517, 0.4489429, -1.758952, 0, 0, 0, 1, 1,
-1.775504, -0.02984103, -2.375828, 0, 0, 0, 1, 1,
-1.764013, -0.5283995, -3.137009, 0, 0, 0, 1, 1,
-1.762472, -1.167504, -1.781237, 0, 0, 0, 1, 1,
-1.755375, -1.880395, -2.665792, 0, 0, 0, 1, 1,
-1.750415, 0.8546525, -0.4155538, 0, 0, 0, 1, 1,
-1.740289, -2.009608, -3.003508, 0, 0, 0, 1, 1,
-1.727602, 0.8373551, -1.488917, 1, 1, 1, 1, 1,
-1.722903, 0.2501245, -3.712218, 1, 1, 1, 1, 1,
-1.717476, 2.366076, 0.1536977, 1, 1, 1, 1, 1,
-1.698888, 0.7210604, 0.6875727, 1, 1, 1, 1, 1,
-1.692575, 1.327901, 0.3847731, 1, 1, 1, 1, 1,
-1.689034, 0.6830128, -1.922648, 1, 1, 1, 1, 1,
-1.677478, 0.1317376, -1.911306, 1, 1, 1, 1, 1,
-1.662889, -0.162692, -0.933915, 1, 1, 1, 1, 1,
-1.657343, 0.3460718, -0.06376433, 1, 1, 1, 1, 1,
-1.648128, 0.02971588, -2.399166, 1, 1, 1, 1, 1,
-1.641896, 0.4719979, -1.74877, 1, 1, 1, 1, 1,
-1.629375, 1.033378, -0.2051421, 1, 1, 1, 1, 1,
-1.606493, 0.2354032, -1.655903, 1, 1, 1, 1, 1,
-1.593982, -1.704414, -3.644856, 1, 1, 1, 1, 1,
-1.593313, -0.2611015, -0.8668308, 1, 1, 1, 1, 1,
-1.559505, -0.09250432, -1.994169, 0, 0, 1, 1, 1,
-1.547446, -0.4729479, -1.688954, 1, 0, 0, 1, 1,
-1.532413, 1.36828, -0.4257255, 1, 0, 0, 1, 1,
-1.527861, 0.01585747, -1.737243, 1, 0, 0, 1, 1,
-1.527516, -0.9526674, 0.2441065, 1, 0, 0, 1, 1,
-1.520956, -1.077567, -4.415801, 1, 0, 0, 1, 1,
-1.518548, -0.250919, -1.380424, 0, 0, 0, 1, 1,
-1.513494, 1.313181, -1.791154, 0, 0, 0, 1, 1,
-1.507182, 0.3511925, -2.609106, 0, 0, 0, 1, 1,
-1.494119, -0.7749527, -4.322406, 0, 0, 0, 1, 1,
-1.481308, 1.159536, -1.749757, 0, 0, 0, 1, 1,
-1.471527, -0.3532912, -3.166235, 0, 0, 0, 1, 1,
-1.450616, 0.6394188, -0.192777, 0, 0, 0, 1, 1,
-1.446318, 0.6170549, -1.3028, 1, 1, 1, 1, 1,
-1.437529, -0.5610403, -1.407268, 1, 1, 1, 1, 1,
-1.420548, -0.7911336, -3.383174, 1, 1, 1, 1, 1,
-1.405738, 0.1801827, -0.142685, 1, 1, 1, 1, 1,
-1.399459, 2.606274, 0.07396229, 1, 1, 1, 1, 1,
-1.395422, -0.05306696, -1.452523, 1, 1, 1, 1, 1,
-1.39495, -0.3602404, -1.843525, 1, 1, 1, 1, 1,
-1.38947, 1.618702, -1.758969, 1, 1, 1, 1, 1,
-1.38757, 0.2555684, -2.190308, 1, 1, 1, 1, 1,
-1.381222, 1.658687, 0.6357256, 1, 1, 1, 1, 1,
-1.380426, 0.6629768, 0.1467788, 1, 1, 1, 1, 1,
-1.371545, -0.3929613, -0.9189821, 1, 1, 1, 1, 1,
-1.367409, 2.024077, 0.3116566, 1, 1, 1, 1, 1,
-1.348346, -0.5737407, -1.315187, 1, 1, 1, 1, 1,
-1.347433, -0.5238442, -3.29427, 1, 1, 1, 1, 1,
-1.346791, -2.683082, -4.664056, 0, 0, 1, 1, 1,
-1.345113, 0.1338027, -1.159275, 1, 0, 0, 1, 1,
-1.317892, 0.2371249, -1.854727, 1, 0, 0, 1, 1,
-1.316009, 1.321096, -0.750892, 1, 0, 0, 1, 1,
-1.314639, -0.3288841, 0.3768705, 1, 0, 0, 1, 1,
-1.314197, 1.438989, -1.174722, 1, 0, 0, 1, 1,
-1.305492, -0.7786176, -1.22097, 0, 0, 0, 1, 1,
-1.30431, 0.2383023, -3.42474, 0, 0, 0, 1, 1,
-1.299437, 1.685122, -1.722739, 0, 0, 0, 1, 1,
-1.297119, -0.5475646, -3.413591, 0, 0, 0, 1, 1,
-1.296893, -0.9614396, -1.861679, 0, 0, 0, 1, 1,
-1.286158, 0.461127, -1.205743, 0, 0, 0, 1, 1,
-1.277408, 1.342663, 0.3262844, 0, 0, 0, 1, 1,
-1.262886, -0.3364608, -1.977997, 1, 1, 1, 1, 1,
-1.256204, -0.7148449, -2.519124, 1, 1, 1, 1, 1,
-1.251534, -2.580788, -1.97012, 1, 1, 1, 1, 1,
-1.245847, 0.2264909, -0.6216943, 1, 1, 1, 1, 1,
-1.239693, -1.853616, -2.232175, 1, 1, 1, 1, 1,
-1.234658, -2.139819, -1.604602, 1, 1, 1, 1, 1,
-1.231364, 0.3726403, -1.960313, 1, 1, 1, 1, 1,
-1.222874, -0.2527425, -1.767483, 1, 1, 1, 1, 1,
-1.209215, 0.006603294, -1.356093, 1, 1, 1, 1, 1,
-1.206409, 0.8933344, -0.4415088, 1, 1, 1, 1, 1,
-1.202373, -1.013257, -2.800992, 1, 1, 1, 1, 1,
-1.187574, -0.6744277, -1.578211, 1, 1, 1, 1, 1,
-1.184411, 1.284837, 0.4565645, 1, 1, 1, 1, 1,
-1.18428, -0.6597571, -0.9502572, 1, 1, 1, 1, 1,
-1.170748, 1.175513, -1.175979, 1, 1, 1, 1, 1,
-1.168988, 0.4517425, 0.323555, 0, 0, 1, 1, 1,
-1.155583, 0.04315897, -2.167096, 1, 0, 0, 1, 1,
-1.152906, -1.013716, -0.8397211, 1, 0, 0, 1, 1,
-1.133387, 0.4652215, -0.3670317, 1, 0, 0, 1, 1,
-1.131449, -1.036048, -1.407739, 1, 0, 0, 1, 1,
-1.130061, 1.5006, -0.8406324, 1, 0, 0, 1, 1,
-1.129661, 0.2137599, -0.6258599, 0, 0, 0, 1, 1,
-1.124279, -0.2530878, -2.850828, 0, 0, 0, 1, 1,
-1.121572, 0.5226884, -2.446462, 0, 0, 0, 1, 1,
-1.12121, 0.006015376, -1.726133, 0, 0, 0, 1, 1,
-1.120906, 0.380801, -0.5731697, 0, 0, 0, 1, 1,
-1.119506, -1.118854, -2.708242, 0, 0, 0, 1, 1,
-1.106243, -1.463946, -3.342366, 0, 0, 0, 1, 1,
-1.091685, 1.021197, 1.005964, 1, 1, 1, 1, 1,
-1.091122, 1.462012, -0.5229625, 1, 1, 1, 1, 1,
-1.086379, 0.01355383, -1.376565, 1, 1, 1, 1, 1,
-1.080251, -0.9428898, -2.671053, 1, 1, 1, 1, 1,
-1.078848, -0.1679593, -1.097949, 1, 1, 1, 1, 1,
-1.076657, 0.557735, -0.2341931, 1, 1, 1, 1, 1,
-1.064503, -0.360748, -2.738521, 1, 1, 1, 1, 1,
-1.063456, -0.7239832, -1.433647, 1, 1, 1, 1, 1,
-1.053068, 0.6167791, -1.082819, 1, 1, 1, 1, 1,
-1.048436, -1.460774, -4.008614, 1, 1, 1, 1, 1,
-1.045945, 0.9365203, -1.451884, 1, 1, 1, 1, 1,
-1.041753, 2.433211, 0.09768538, 1, 1, 1, 1, 1,
-1.039716, 0.2387223, -1.291075, 1, 1, 1, 1, 1,
-1.037416, -0.07726529, -1.457554, 1, 1, 1, 1, 1,
-1.030827, -0.1624347, -0.7691398, 1, 1, 1, 1, 1,
-1.029625, 0.655307, 0.1689055, 0, 0, 1, 1, 1,
-1.025179, 1.280728, 0.6393144, 1, 0, 0, 1, 1,
-1.023966, -1.258733, -0.887186, 1, 0, 0, 1, 1,
-1.021374, -0.3145533, -3.19641, 1, 0, 0, 1, 1,
-1.020636, 1.339463, -1.714441, 1, 0, 0, 1, 1,
-1.007472, -1.470737, -2.909466, 1, 0, 0, 1, 1,
-1.002251, 0.4370551, -2.09573, 0, 0, 0, 1, 1,
-1.002206, -1.172604, -4.211128, 0, 0, 0, 1, 1,
-0.9933689, -0.005909473, -2.411444, 0, 0, 0, 1, 1,
-0.9897587, -0.5270584, -3.260496, 0, 0, 0, 1, 1,
-0.9861423, -0.5592333, -1.508604, 0, 0, 0, 1, 1,
-0.9737508, -2.385167, -1.706698, 0, 0, 0, 1, 1,
-0.9733703, -1.471617, -2.197576, 0, 0, 0, 1, 1,
-0.9699823, -0.967914, -4.577124, 1, 1, 1, 1, 1,
-0.9695724, 1.215446, 0.2364198, 1, 1, 1, 1, 1,
-0.96797, -0.671675, -1.46942, 1, 1, 1, 1, 1,
-0.9620348, 0.47489, -1.414286, 1, 1, 1, 1, 1,
-0.9608088, 0.2092404, -2.381915, 1, 1, 1, 1, 1,
-0.9581941, -0.3694282, -1.047513, 1, 1, 1, 1, 1,
-0.9575669, -1.541504, -2.406913, 1, 1, 1, 1, 1,
-0.9508106, 0.1416189, -1.987449, 1, 1, 1, 1, 1,
-0.9493859, -1.416869, -4.464106, 1, 1, 1, 1, 1,
-0.9286994, -0.6734936, -2.19741, 1, 1, 1, 1, 1,
-0.9241238, 0.06366269, -1.578126, 1, 1, 1, 1, 1,
-0.9191242, -0.00692253, -2.162871, 1, 1, 1, 1, 1,
-0.9161264, -1.762341, -3.572006, 1, 1, 1, 1, 1,
-0.9135378, -2.280163, -1.565331, 1, 1, 1, 1, 1,
-0.9019489, 1.26554, 0.1789082, 1, 1, 1, 1, 1,
-0.9011372, -1.265103, -1.834221, 0, 0, 1, 1, 1,
-0.8966539, -0.4582025, -1.476107, 1, 0, 0, 1, 1,
-0.8936725, 1.288262, -2.112579, 1, 0, 0, 1, 1,
-0.8936035, -1.36265, -1.463061, 1, 0, 0, 1, 1,
-0.8929477, 1.711063, -0.4860771, 1, 0, 0, 1, 1,
-0.8911122, 0.4151826, -0.6163642, 1, 0, 0, 1, 1,
-0.8904008, -2.408505, -3.235523, 0, 0, 0, 1, 1,
-0.8897197, 0.8829596, -0.839095, 0, 0, 0, 1, 1,
-0.8890981, 0.3545024, -1.290743, 0, 0, 0, 1, 1,
-0.8868124, -0.4615639, -1.253916, 0, 0, 0, 1, 1,
-0.8825251, -0.7408531, -4.618968, 0, 0, 0, 1, 1,
-0.8794935, 0.4655882, -1.250949, 0, 0, 0, 1, 1,
-0.8770667, -0.7746199, -0.328764, 0, 0, 0, 1, 1,
-0.8742919, -0.5860114, -2.288309, 1, 1, 1, 1, 1,
-0.8697441, -1.139137, -2.499445, 1, 1, 1, 1, 1,
-0.8651522, -0.7608334, -1.994971, 1, 1, 1, 1, 1,
-0.8630379, -0.1212893, -1.64365, 1, 1, 1, 1, 1,
-0.8614671, -0.2201402, -3.079807, 1, 1, 1, 1, 1,
-0.8578635, -1.543619, -3.062919, 1, 1, 1, 1, 1,
-0.8564585, 0.2864684, -1.85802, 1, 1, 1, 1, 1,
-0.8555366, -0.4857352, -1.488426, 1, 1, 1, 1, 1,
-0.8529431, 2.639559, -2.058511, 1, 1, 1, 1, 1,
-0.8526874, -0.3608914, -1.944156, 1, 1, 1, 1, 1,
-0.8509744, -0.7384736, -2.408173, 1, 1, 1, 1, 1,
-0.8491052, 0.1508874, -2.08473, 1, 1, 1, 1, 1,
-0.840723, -0.3591624, -2.503983, 1, 1, 1, 1, 1,
-0.839556, -0.8643594, -1.049935, 1, 1, 1, 1, 1,
-0.8272722, -0.7898806, -2.334431, 1, 1, 1, 1, 1,
-0.8209913, -0.633144, -3.959339, 0, 0, 1, 1, 1,
-0.8188718, -0.711484, -2.479761, 1, 0, 0, 1, 1,
-0.8164067, 2.582674, -0.1824723, 1, 0, 0, 1, 1,
-0.8161399, -0.3332905, -2.618927, 1, 0, 0, 1, 1,
-0.8123535, -0.3078128, -0.8730547, 1, 0, 0, 1, 1,
-0.8089187, 0.1910967, -1.267604, 1, 0, 0, 1, 1,
-0.8088835, 1.578212, -1.086482, 0, 0, 0, 1, 1,
-0.8057452, 0.2538679, -2.381121, 0, 0, 0, 1, 1,
-0.8048053, 0.4559536, -1.869311, 0, 0, 0, 1, 1,
-0.8031887, -0.3448443, -2.116718, 0, 0, 0, 1, 1,
-0.8020947, 3.197023, 0.3106919, 0, 0, 0, 1, 1,
-0.8005009, 1.28763, -0.4781734, 0, 0, 0, 1, 1,
-0.8002549, -0.8541361, -0.7803018, 0, 0, 0, 1, 1,
-0.7942085, 1.405044, -1.28977, 1, 1, 1, 1, 1,
-0.7770476, -0.1595101, -2.816016, 1, 1, 1, 1, 1,
-0.7738701, -0.1229091, -0.3361934, 1, 1, 1, 1, 1,
-0.7708849, 0.9563745, -1.625114, 1, 1, 1, 1, 1,
-0.7672382, -1.153432, -2.324447, 1, 1, 1, 1, 1,
-0.7635294, 2.825086, 0.1245226, 1, 1, 1, 1, 1,
-0.7632096, 0.6099774, -1.360944, 1, 1, 1, 1, 1,
-0.7613694, 0.8338774, -0.7021677, 1, 1, 1, 1, 1,
-0.759612, 0.7670927, -2.243161, 1, 1, 1, 1, 1,
-0.7567751, -0.4102032, -0.9827484, 1, 1, 1, 1, 1,
-0.7567017, -0.01788537, -0.3523412, 1, 1, 1, 1, 1,
-0.751518, 0.2368683, -1.345699, 1, 1, 1, 1, 1,
-0.7502396, -2.02725, -3.745767, 1, 1, 1, 1, 1,
-0.7492525, -0.07024872, -1.193362, 1, 1, 1, 1, 1,
-0.746619, -0.7474675, -1.945983, 1, 1, 1, 1, 1,
-0.7417114, -0.8661839, -2.011897, 0, 0, 1, 1, 1,
-0.7412721, 0.08167423, -2.756015, 1, 0, 0, 1, 1,
-0.7263427, -0.03000318, -1.284765, 1, 0, 0, 1, 1,
-0.7251345, -0.4395767, -2.20046, 1, 0, 0, 1, 1,
-0.7162835, -1.670853, -2.164063, 1, 0, 0, 1, 1,
-0.7106791, -0.5449681, -1.069709, 1, 0, 0, 1, 1,
-0.7085672, -0.8550202, -1.39686, 0, 0, 0, 1, 1,
-0.7076057, 1.576019, -0.07958392, 0, 0, 0, 1, 1,
-0.7064596, 0.9251838, -0.6206253, 0, 0, 0, 1, 1,
-0.7016042, -1.423128, -3.037476, 0, 0, 0, 1, 1,
-0.7002503, -0.5387926, -3.85944, 0, 0, 0, 1, 1,
-0.6971776, -1.332253, -3.365268, 0, 0, 0, 1, 1,
-0.6959948, 0.3161376, -1.563479, 0, 0, 0, 1, 1,
-0.6952109, 1.616881, 0.394877, 1, 1, 1, 1, 1,
-0.6945025, -0.6538347, -3.472991, 1, 1, 1, 1, 1,
-0.6940354, 1.467413, -0.05468127, 1, 1, 1, 1, 1,
-0.6934533, 0.1793288, -2.275703, 1, 1, 1, 1, 1,
-0.6930382, 0.7351068, -1.588687, 1, 1, 1, 1, 1,
-0.6906425, -0.01867709, -2.224522, 1, 1, 1, 1, 1,
-0.6899117, -1.379294, -3.177722, 1, 1, 1, 1, 1,
-0.6871509, 2.127558, -1.241, 1, 1, 1, 1, 1,
-0.6836017, 0.7723531, -1.326186, 1, 1, 1, 1, 1,
-0.6824487, 1.532624, -0.08541477, 1, 1, 1, 1, 1,
-0.6807938, -0.02531576, -1.577249, 1, 1, 1, 1, 1,
-0.6684074, -0.2508467, -2.063968, 1, 1, 1, 1, 1,
-0.6641023, -0.1673947, -2.363569, 1, 1, 1, 1, 1,
-0.660489, -0.1524351, -1.943079, 1, 1, 1, 1, 1,
-0.6550139, 0.2450785, -1.251239, 1, 1, 1, 1, 1,
-0.6549227, -1.467488, -3.014815, 0, 0, 1, 1, 1,
-0.6517687, 0.8243611, -1.034326, 1, 0, 0, 1, 1,
-0.6488232, -0.3274117, -1.838776, 1, 0, 0, 1, 1,
-0.6475254, -0.9570378, -0.4275989, 1, 0, 0, 1, 1,
-0.644361, -1.55364, -2.2492, 1, 0, 0, 1, 1,
-0.6364802, 1.331922, -2.455454, 1, 0, 0, 1, 1,
-0.6337873, -2.785211, -1.343236, 0, 0, 0, 1, 1,
-0.633407, 0.02841018, -2.338554, 0, 0, 0, 1, 1,
-0.6248932, -1.393223, -2.586951, 0, 0, 0, 1, 1,
-0.6240958, -0.4452989, -3.034916, 0, 0, 0, 1, 1,
-0.6192166, -2.11468, -2.041138, 0, 0, 0, 1, 1,
-0.6093232, 1.460753, -1.086432, 0, 0, 0, 1, 1,
-0.6067763, -0.107844, -2.298952, 0, 0, 0, 1, 1,
-0.5940406, -1.543861, -1.509434, 1, 1, 1, 1, 1,
-0.5935862, 0.1661682, -1.461365, 1, 1, 1, 1, 1,
-0.5935745, 1.547849, -0.9515697, 1, 1, 1, 1, 1,
-0.5892486, 0.05181108, 0.6219814, 1, 1, 1, 1, 1,
-0.5890647, 1.316173, -0.5545508, 1, 1, 1, 1, 1,
-0.5868776, 0.2884829, 0.08959143, 1, 1, 1, 1, 1,
-0.578585, 0.05966523, -1.35252, 1, 1, 1, 1, 1,
-0.5784103, 0.4997838, -0.429718, 1, 1, 1, 1, 1,
-0.5751606, 0.3471592, -0.7749821, 1, 1, 1, 1, 1,
-0.57379, -1.482055, -3.908202, 1, 1, 1, 1, 1,
-0.5645547, 1.160788, -1.378699, 1, 1, 1, 1, 1,
-0.5626615, -0.6960593, -2.30197, 1, 1, 1, 1, 1,
-0.5595043, -0.8622218, -3.735031, 1, 1, 1, 1, 1,
-0.5581958, -1.089129, -3.865376, 1, 1, 1, 1, 1,
-0.557222, 1.138187, 0.1532554, 1, 1, 1, 1, 1,
-0.5529067, -1.848057, -2.145889, 0, 0, 1, 1, 1,
-0.5524076, -1.515713, -2.060808, 1, 0, 0, 1, 1,
-0.5495727, -0.302878, -2.707514, 1, 0, 0, 1, 1,
-0.5431919, -0.5247461, -3.852777, 1, 0, 0, 1, 1,
-0.5418715, -0.2814017, -2.537819, 1, 0, 0, 1, 1,
-0.5295343, 1.038973, 0.4744345, 1, 0, 0, 1, 1,
-0.5294294, 0.8199317, -2.679417, 0, 0, 0, 1, 1,
-0.5274016, 0.6386057, -2.643416, 0, 0, 0, 1, 1,
-0.5254325, 1.683135, 1.342043, 0, 0, 0, 1, 1,
-0.5250146, 0.5569723, -1.88061, 0, 0, 0, 1, 1,
-0.5242057, -2.730679, -1.982975, 0, 0, 0, 1, 1,
-0.5235041, -1.455164, -3.702981, 0, 0, 0, 1, 1,
-0.5223379, -0.2738278, -1.205197, 0, 0, 0, 1, 1,
-0.5197221, 0.4321484, -0.2126585, 1, 1, 1, 1, 1,
-0.517474, -0.1185671, -0.415629, 1, 1, 1, 1, 1,
-0.514612, -0.8619262, -3.991866, 1, 1, 1, 1, 1,
-0.5141627, -0.001907172, -1.226284, 1, 1, 1, 1, 1,
-0.5140864, 1.08445, -1.755872, 1, 1, 1, 1, 1,
-0.504245, -1.300687, -3.345822, 1, 1, 1, 1, 1,
-0.5015367, 0.1506826, -2.623436, 1, 1, 1, 1, 1,
-0.4970911, 0.512135, 0.08495329, 1, 1, 1, 1, 1,
-0.4916589, -0.2540731, -0.5625932, 1, 1, 1, 1, 1,
-0.4906598, -0.08612653, -0.09677072, 1, 1, 1, 1, 1,
-0.4850937, 1.40752, -0.8907291, 1, 1, 1, 1, 1,
-0.4806791, -0.3384195, -1.344932, 1, 1, 1, 1, 1,
-0.4781854, -0.0745571, -1.763963, 1, 1, 1, 1, 1,
-0.4745908, 1.788376, -0.7664086, 1, 1, 1, 1, 1,
-0.4744197, -0.5193936, -1.979565, 1, 1, 1, 1, 1,
-0.4719173, 0.9182695, -0.7101331, 0, 0, 1, 1, 1,
-0.4666269, -0.5777683, -1.626495, 1, 0, 0, 1, 1,
-0.4646485, -1.402849, -3.240079, 1, 0, 0, 1, 1,
-0.4623194, 0.7026927, 0.542581, 1, 0, 0, 1, 1,
-0.4556503, 0.4386846, -0.4535363, 1, 0, 0, 1, 1,
-0.4532933, -0.5984932, -3.145142, 1, 0, 0, 1, 1,
-0.4393692, -1.703015, -3.023796, 0, 0, 0, 1, 1,
-0.4388368, -0.8286178, -3.523235, 0, 0, 0, 1, 1,
-0.4384354, -0.3585685, -3.626982, 0, 0, 0, 1, 1,
-0.4355932, 0.3967268, -0.190902, 0, 0, 0, 1, 1,
-0.4354753, -0.8362445, -2.204062, 0, 0, 0, 1, 1,
-0.4329076, 2.224521, 0.2015382, 0, 0, 0, 1, 1,
-0.4232593, -0.4525463, -1.358754, 0, 0, 0, 1, 1,
-0.4210716, -1.185446, -3.322007, 1, 1, 1, 1, 1,
-0.4201887, -0.8316365, -2.142574, 1, 1, 1, 1, 1,
-0.4186508, -0.6323267, -3.277129, 1, 1, 1, 1, 1,
-0.4180605, 0.6941, 0.178012, 1, 1, 1, 1, 1,
-0.4145035, -0.8147806, -0.9480842, 1, 1, 1, 1, 1,
-0.407851, 1.072039, 0.5769029, 1, 1, 1, 1, 1,
-0.4073783, -2.147583, -3.808614, 1, 1, 1, 1, 1,
-0.4047028, -0.6450059, -3.823891, 1, 1, 1, 1, 1,
-0.4008237, -0.8753821, -3.592096, 1, 1, 1, 1, 1,
-0.3981091, -0.5586064, -1.797976, 1, 1, 1, 1, 1,
-0.3948362, 0.7734511, -0.3432032, 1, 1, 1, 1, 1,
-0.3876282, -0.02452712, -1.553441, 1, 1, 1, 1, 1,
-0.3862844, 0.4313435, -0.2112045, 1, 1, 1, 1, 1,
-0.384978, -1.087163, -2.531458, 1, 1, 1, 1, 1,
-0.3841387, 0.685981, -1.267498, 1, 1, 1, 1, 1,
-0.382867, -1.788315, -3.463304, 0, 0, 1, 1, 1,
-0.3803653, 0.7668797, -0.8687084, 1, 0, 0, 1, 1,
-0.3763992, 1.856324, -0.5920727, 1, 0, 0, 1, 1,
-0.3745347, -1.348, -4.077813, 1, 0, 0, 1, 1,
-0.3700118, 0.1097429, -1.148938, 1, 0, 0, 1, 1,
-0.3672883, 1.670871, -0.2942979, 1, 0, 0, 1, 1,
-0.3660722, 0.5301413, 0.07222754, 0, 0, 0, 1, 1,
-0.3647791, -1.373476, -3.172156, 0, 0, 0, 1, 1,
-0.3645464, -1.532841, -1.201634, 0, 0, 0, 1, 1,
-0.3613893, -0.2693024, -2.705262, 0, 0, 0, 1, 1,
-0.3597825, -0.1753371, -0.7562982, 0, 0, 0, 1, 1,
-0.3553874, -0.4997935, -1.943993, 0, 0, 0, 1, 1,
-0.3516334, 0.5406876, 0.8127322, 0, 0, 0, 1, 1,
-0.349484, 1.937638, -1.257178, 1, 1, 1, 1, 1,
-0.3438947, 1.183221, -1.030504, 1, 1, 1, 1, 1,
-0.3436253, -0.5710796, -2.412598, 1, 1, 1, 1, 1,
-0.3393084, -2.244901, -2.655442, 1, 1, 1, 1, 1,
-0.3321559, 1.046845, 0.5476302, 1, 1, 1, 1, 1,
-0.3320822, 1.1318, 0.7592217, 1, 1, 1, 1, 1,
-0.3286511, 1.661998, -0.2461509, 1, 1, 1, 1, 1,
-0.3272641, -0.5202416, -1.36074, 1, 1, 1, 1, 1,
-0.324893, 1.491684, 0.1315296, 1, 1, 1, 1, 1,
-0.3138283, -0.4492899, -1.630386, 1, 1, 1, 1, 1,
-0.3137559, 0.1535347, -1.214537, 1, 1, 1, 1, 1,
-0.3123603, -0.1946041, -2.317832, 1, 1, 1, 1, 1,
-0.3082077, 1.087487, 1.472376, 1, 1, 1, 1, 1,
-0.3030182, -0.3753602, -2.075503, 1, 1, 1, 1, 1,
-0.2993032, 1.734884, -0.06274007, 1, 1, 1, 1, 1,
-0.29456, -1.17046, -2.647561, 0, 0, 1, 1, 1,
-0.2913342, 1.617665, 0.566063, 1, 0, 0, 1, 1,
-0.2907353, -0.986467, -3.475203, 1, 0, 0, 1, 1,
-0.2885755, -0.5579829, -3.956951, 1, 0, 0, 1, 1,
-0.2843789, -0.0162813, -2.446861, 1, 0, 0, 1, 1,
-0.2796104, 0.5954192, -1.245278, 1, 0, 0, 1, 1,
-0.2793034, 0.1252034, -1.733287, 0, 0, 0, 1, 1,
-0.2787162, -0.3511782, -2.340619, 0, 0, 0, 1, 1,
-0.2705146, 1.242943, 0.4756831, 0, 0, 0, 1, 1,
-0.2691315, -0.498018, -3.25931, 0, 0, 0, 1, 1,
-0.2678748, 0.3208622, 0.4415559, 0, 0, 0, 1, 1,
-0.2675257, -1.137958, -1.847077, 0, 0, 0, 1, 1,
-0.2653628, 1.445205, 1.381508, 0, 0, 0, 1, 1,
-0.2645286, -1.187721, -2.000158, 1, 1, 1, 1, 1,
-0.2606713, 0.5385987, -0.3299723, 1, 1, 1, 1, 1,
-0.2566428, -0.0172519, 0.1206702, 1, 1, 1, 1, 1,
-0.2503284, 0.3654729, -0.4741651, 1, 1, 1, 1, 1,
-0.2462624, 0.6609266, -1.397415, 1, 1, 1, 1, 1,
-0.2429115, 0.02019486, -0.8626539, 1, 1, 1, 1, 1,
-0.2390915, 0.08672505, -1.508887, 1, 1, 1, 1, 1,
-0.2371522, 1.148599, 1.382556, 1, 1, 1, 1, 1,
-0.2366736, -2.01969, -2.805113, 1, 1, 1, 1, 1,
-0.2347293, 0.1472587, -2.478306, 1, 1, 1, 1, 1,
-0.2346523, 0.614122, -1.644837, 1, 1, 1, 1, 1,
-0.2296219, -1.392189, -4.023297, 1, 1, 1, 1, 1,
-0.2289972, -0.8439621, -3.068881, 1, 1, 1, 1, 1,
-0.2284528, 0.1879113, -1.357892, 1, 1, 1, 1, 1,
-0.2266883, 1.263103, -0.8313645, 1, 1, 1, 1, 1,
-0.2264198, -1.200533, -3.933369, 0, 0, 1, 1, 1,
-0.2239534, 2.241429, 0.9456773, 1, 0, 0, 1, 1,
-0.2238622, -1.794598, -2.888894, 1, 0, 0, 1, 1,
-0.2168481, 0.4409858, 0.4452654, 1, 0, 0, 1, 1,
-0.2077922, -0.1190045, -1.722661, 1, 0, 0, 1, 1,
-0.2056894, 0.9233376, -0.04279181, 1, 0, 0, 1, 1,
-0.2036012, -0.01782923, -1.499933, 0, 0, 0, 1, 1,
-0.2033508, -0.181257, -2.234315, 0, 0, 0, 1, 1,
-0.1965016, -1.654538, -2.798664, 0, 0, 0, 1, 1,
-0.1958722, 0.09380813, -1.210006, 0, 0, 0, 1, 1,
-0.1951745, 0.8988781, 0.510592, 0, 0, 0, 1, 1,
-0.1948267, -0.2933323, -3.291551, 0, 0, 0, 1, 1,
-0.1927695, 0.643303, 0.319599, 0, 0, 0, 1, 1,
-0.1895088, 0.2895136, 0.2052645, 1, 1, 1, 1, 1,
-0.1818331, -0.4070396, -1.941819, 1, 1, 1, 1, 1,
-0.1805259, -0.132327, -2.775834, 1, 1, 1, 1, 1,
-0.1792285, 0.1805809, -0.7357818, 1, 1, 1, 1, 1,
-0.1783294, -1.404164, -2.920982, 1, 1, 1, 1, 1,
-0.1695279, 1.272777, 0.5846664, 1, 1, 1, 1, 1,
-0.1689191, -0.8883656, -2.286536, 1, 1, 1, 1, 1,
-0.161414, -1.157005, -4.008271, 1, 1, 1, 1, 1,
-0.1601032, -1.451878, -3.052303, 1, 1, 1, 1, 1,
-0.1553176, -0.9373764, -2.655564, 1, 1, 1, 1, 1,
-0.1537725, 0.6118144, -0.2760236, 1, 1, 1, 1, 1,
-0.1472595, 2.515642, -1.306833, 1, 1, 1, 1, 1,
-0.1407414, 1.081858, 0.9745631, 1, 1, 1, 1, 1,
-0.1374847, 2.232686, 0.2341453, 1, 1, 1, 1, 1,
-0.1349743, -0.7845628, -1.955472, 1, 1, 1, 1, 1,
-0.1337577, -0.9305933, -4.759367, 0, 0, 1, 1, 1,
-0.1322845, -0.4239574, -1.683619, 1, 0, 0, 1, 1,
-0.1320824, 0.8690857, 0.8684564, 1, 0, 0, 1, 1,
-0.1296894, 0.4395624, 0.5207111, 1, 0, 0, 1, 1,
-0.1295857, 0.09461711, -1.099202, 1, 0, 0, 1, 1,
-0.1247349, 1.21725, 0.9186316, 1, 0, 0, 1, 1,
-0.1237413, -0.3168424, -2.461364, 0, 0, 0, 1, 1,
-0.1169297, -1.177936, -3.455775, 0, 0, 0, 1, 1,
-0.1147513, -0.6659131, -1.757033, 0, 0, 0, 1, 1,
-0.11296, 0.1580608, -1.576298, 0, 0, 0, 1, 1,
-0.111767, 1.174947, -0.611756, 0, 0, 0, 1, 1,
-0.1087483, 0.06633929, -0.001850259, 0, 0, 0, 1, 1,
-0.1059747, 1.508604, -1.117612, 0, 0, 0, 1, 1,
-0.1052099, -0.2091723, -4.008342, 1, 1, 1, 1, 1,
-0.1031289, 0.8849284, -0.3089228, 1, 1, 1, 1, 1,
-0.1029283, -0.2761042, -2.5297, 1, 1, 1, 1, 1,
-0.1005511, -1.660171, -0.8932578, 1, 1, 1, 1, 1,
-0.09446806, -1.253353, -5.558343, 1, 1, 1, 1, 1,
-0.09394699, 0.7456318, 1.44285, 1, 1, 1, 1, 1,
-0.09368686, 0.02427015, -1.667829, 1, 1, 1, 1, 1,
-0.09255535, -0.3448196, -2.481071, 1, 1, 1, 1, 1,
-0.09124888, 0.9068673, 1.982771, 1, 1, 1, 1, 1,
-0.08959199, -1.115908, -2.978724, 1, 1, 1, 1, 1,
-0.08447903, -0.5629086, -3.113205, 1, 1, 1, 1, 1,
-0.08314111, -1.000974, -4.042526, 1, 1, 1, 1, 1,
-0.08149858, -0.7590674, -3.463709, 1, 1, 1, 1, 1,
-0.08112095, 1.592317, -0.2716055, 1, 1, 1, 1, 1,
-0.07965429, 0.4501393, -0.1856332, 1, 1, 1, 1, 1,
-0.0795142, -0.4590896, -2.492171, 0, 0, 1, 1, 1,
-0.07729264, 0.1925162, -0.6242955, 1, 0, 0, 1, 1,
-0.07571702, -0.5951684, -3.013006, 1, 0, 0, 1, 1,
-0.07562117, 0.250595, -0.8882307, 1, 0, 0, 1, 1,
-0.07553491, -0.5947288, -3.493794, 1, 0, 0, 1, 1,
-0.07281584, -0.6803898, -1.626264, 1, 0, 0, 1, 1,
-0.07053161, -0.0415445, -1.808522, 0, 0, 0, 1, 1,
-0.0697499, 0.7308843, 0.9276091, 0, 0, 0, 1, 1,
-0.06925775, -0.1822255, -3.418454, 0, 0, 0, 1, 1,
-0.06825887, -0.9274511, -4.721954, 0, 0, 0, 1, 1,
-0.06805911, -1.072298, -1.457541, 0, 0, 0, 1, 1,
-0.06765295, -0.4929365, -3.445745, 0, 0, 0, 1, 1,
-0.06709927, -1.873982, -3.17389, 0, 0, 0, 1, 1,
-0.06630417, 0.4865497, -0.2317968, 1, 1, 1, 1, 1,
-0.06142065, -0.2148534, -3.112634, 1, 1, 1, 1, 1,
-0.06110101, 0.6940201, 1.442042, 1, 1, 1, 1, 1,
-0.05925986, -1.150512, -2.993016, 1, 1, 1, 1, 1,
-0.05917258, -1.001777, -4.555168, 1, 1, 1, 1, 1,
-0.05507513, -0.6723163, -3.482589, 1, 1, 1, 1, 1,
-0.0550123, 0.013382, -2.789957, 1, 1, 1, 1, 1,
-0.05259468, -0.1277647, -3.091317, 1, 1, 1, 1, 1,
-0.05180928, 0.8192156, -1.769207, 1, 1, 1, 1, 1,
-0.04639928, -0.4128543, -2.290759, 1, 1, 1, 1, 1,
-0.04515991, -2.536924, -2.253304, 1, 1, 1, 1, 1,
-0.04334889, 0.441569, -0.6334505, 1, 1, 1, 1, 1,
-0.04230156, -1.624147, -3.16574, 1, 1, 1, 1, 1,
-0.04152481, 0.2629892, -2.728934, 1, 1, 1, 1, 1,
-0.04101504, -0.8372941, -3.681015, 1, 1, 1, 1, 1,
-0.04014235, 0.5293849, 0.3160113, 0, 0, 1, 1, 1,
-0.03816457, -1.348087, -2.283911, 1, 0, 0, 1, 1,
-0.03726243, -1.359374, -2.22019, 1, 0, 0, 1, 1,
-0.02928606, 0.7370468, -0.4847487, 1, 0, 0, 1, 1,
-0.02874042, -0.5661531, -2.289014, 1, 0, 0, 1, 1,
-0.02083342, 1.520589, -1.537825, 1, 0, 0, 1, 1,
-0.01727635, -0.9942545, -4.350842, 0, 0, 0, 1, 1,
-0.01160112, 0.1947464, 0.4934555, 0, 0, 0, 1, 1,
-0.01088344, -0.8940827, -2.932162, 0, 0, 0, 1, 1,
-0.01007935, 0.1629514, 0.6815253, 0, 0, 0, 1, 1,
-0.009362908, 1.026626, -0.8332005, 0, 0, 0, 1, 1,
-0.009210618, 1.356334, -0.4284646, 0, 0, 0, 1, 1,
-0.008789043, -1.245716, -3.054324, 0, 0, 0, 1, 1,
-0.00711804, 0.549992, 0.7455751, 1, 1, 1, 1, 1,
-0.005136325, 2.051989, 0.4680675, 1, 1, 1, 1, 1,
-0.004232428, -0.164224, -2.049403, 1, 1, 1, 1, 1,
-0.003927859, 0.7609791, 1.526779, 1, 1, 1, 1, 1,
-0.002727981, -1.203502, -4.094023, 1, 1, 1, 1, 1,
0.0005714085, -2.162038, 0.9967887, 1, 1, 1, 1, 1,
0.00193864, 1.060447, 1.380238, 1, 1, 1, 1, 1,
0.01005406, -1.664112, 3.037006, 1, 1, 1, 1, 1,
0.01268146, -0.1628765, 2.789316, 1, 1, 1, 1, 1,
0.01386525, 0.4829742, -2.256705, 1, 1, 1, 1, 1,
0.01439964, 0.8977368, -0.6345367, 1, 1, 1, 1, 1,
0.01707966, 1.120645, 1.646888, 1, 1, 1, 1, 1,
0.01874515, -0.7037582, 1.746133, 1, 1, 1, 1, 1,
0.02077399, 1.461957, -0.3597603, 1, 1, 1, 1, 1,
0.02124417, -0.8193549, 1.763483, 1, 1, 1, 1, 1,
0.02157375, -1.799935, 3.761375, 0, 0, 1, 1, 1,
0.02568103, -2.136287, 1.364049, 1, 0, 0, 1, 1,
0.02621036, -1.077552, 2.894076, 1, 0, 0, 1, 1,
0.02871357, -0.298499, 3.453571, 1, 0, 0, 1, 1,
0.03304369, -0.6681566, 3.994489, 1, 0, 0, 1, 1,
0.03844534, -0.3490317, 2.72007, 1, 0, 0, 1, 1,
0.04200248, -0.1072885, 4.064139, 0, 0, 0, 1, 1,
0.0472968, 0.482578, 0.1186615, 0, 0, 0, 1, 1,
0.05185032, 1.945063, 0.8323808, 0, 0, 0, 1, 1,
0.05446936, -2.585938, 3.648802, 0, 0, 0, 1, 1,
0.06142778, -0.538578, 1.096873, 0, 0, 0, 1, 1,
0.06288453, 0.4168974, 0.5917177, 0, 0, 0, 1, 1,
0.06946281, -1.145042, 2.334869, 0, 0, 0, 1, 1,
0.07002571, -0.9758231, 5.24629, 1, 1, 1, 1, 1,
0.07775056, -0.3880375, 0.6128425, 1, 1, 1, 1, 1,
0.07965817, 1.475023, -0.5332876, 1, 1, 1, 1, 1,
0.08081184, -0.770943, 1.648519, 1, 1, 1, 1, 1,
0.08105177, 1.597607, -0.2720332, 1, 1, 1, 1, 1,
0.08510654, -1.229033, 4.64322, 1, 1, 1, 1, 1,
0.08587169, 0.6235348, -0.5831914, 1, 1, 1, 1, 1,
0.08806263, 1.228342, 2.194041, 1, 1, 1, 1, 1,
0.08978918, 1.837515, 0.1403883, 1, 1, 1, 1, 1,
0.09121943, -0.06948199, 1.747661, 1, 1, 1, 1, 1,
0.09743323, 1.152246, -1.145085, 1, 1, 1, 1, 1,
0.09807333, -1.25815, 2.159735, 1, 1, 1, 1, 1,
0.100618, 0.8572897, 0.864398, 1, 1, 1, 1, 1,
0.1050046, -0.6234807, 3.829293, 1, 1, 1, 1, 1,
0.106141, 0.1087392, 1.555811, 1, 1, 1, 1, 1,
0.1131703, -0.5108132, 1.608155, 0, 0, 1, 1, 1,
0.1156002, 1.290305, -1.005347, 1, 0, 0, 1, 1,
0.1272328, -1.631701, 2.25239, 1, 0, 0, 1, 1,
0.1273179, 0.8895711, 0.1502482, 1, 0, 0, 1, 1,
0.1281087, 0.1632334, 1.737782, 1, 0, 0, 1, 1,
0.1294107, -0.4614566, 3.572708, 1, 0, 0, 1, 1,
0.1313452, 0.3764857, -0.7384526, 0, 0, 0, 1, 1,
0.1360018, -1.421554, 2.205482, 0, 0, 0, 1, 1,
0.1432213, -1.559705, 2.121222, 0, 0, 0, 1, 1,
0.1442703, -0.04185823, 1.355879, 0, 0, 0, 1, 1,
0.1444005, -1.815566, 2.956066, 0, 0, 0, 1, 1,
0.1452556, 0.1117081, 0.6524189, 0, 0, 0, 1, 1,
0.1460496, 1.467148, 0.9325767, 0, 0, 0, 1, 1,
0.1468439, -0.3027499, 0.5016789, 1, 1, 1, 1, 1,
0.1517579, -0.05250726, 2.276271, 1, 1, 1, 1, 1,
0.1522243, -1.011994, 3.575079, 1, 1, 1, 1, 1,
0.1610258, -0.4872681, 1.909623, 1, 1, 1, 1, 1,
0.1621103, -0.1735633, 2.963414, 1, 1, 1, 1, 1,
0.1662326, -1.773468, 3.196221, 1, 1, 1, 1, 1,
0.1663854, 0.2227052, 0.6612998, 1, 1, 1, 1, 1,
0.1685136, 0.4301504, -0.2208404, 1, 1, 1, 1, 1,
0.1707764, -0.5817434, 1.019149, 1, 1, 1, 1, 1,
0.1731487, 0.1694895, 1.359687, 1, 1, 1, 1, 1,
0.1755756, -1.686652, 2.327129, 1, 1, 1, 1, 1,
0.1784251, -1.52857, 0.7688525, 1, 1, 1, 1, 1,
0.1784391, 0.6527424, 1.741299, 1, 1, 1, 1, 1,
0.1801065, -0.6279544, 3.9738, 1, 1, 1, 1, 1,
0.1833477, -1.905677, 2.403303, 1, 1, 1, 1, 1,
0.1867401, 0.1328394, 0.6344105, 0, 0, 1, 1, 1,
0.1894924, -0.8911655, 3.001318, 1, 0, 0, 1, 1,
0.1926613, -0.2365582, 0.9243538, 1, 0, 0, 1, 1,
0.194755, 0.6253676, -0.3478806, 1, 0, 0, 1, 1,
0.1978952, 0.707973, 1.469147, 1, 0, 0, 1, 1,
0.199947, 0.3103309, 0.4345542, 1, 0, 0, 1, 1,
0.2025263, -0.135627, 1.079698, 0, 0, 0, 1, 1,
0.2059927, 0.1420468, 1.755696, 0, 0, 0, 1, 1,
0.2063555, 0.4991862, -0.221467, 0, 0, 0, 1, 1,
0.2083432, 0.2804258, 1.413001, 0, 0, 0, 1, 1,
0.2093507, -0.9959368, 4.742908, 0, 0, 0, 1, 1,
0.2093895, 0.006505575, 2.819969, 0, 0, 0, 1, 1,
0.209711, -0.439796, 1.700614, 0, 0, 0, 1, 1,
0.2117946, -2.328167, 4.718254, 1, 1, 1, 1, 1,
0.21245, -0.1980932, 3.122373, 1, 1, 1, 1, 1,
0.2148619, -0.5808142, 4.432473, 1, 1, 1, 1, 1,
0.2151637, 0.2382301, -0.2211323, 1, 1, 1, 1, 1,
0.216994, -0.3145892, 3.2428, 1, 1, 1, 1, 1,
0.2213173, 0.636526, 1.027141, 1, 1, 1, 1, 1,
0.2216652, 0.4029863, -0.03797848, 1, 1, 1, 1, 1,
0.2238028, 0.6322756, 3.094568, 1, 1, 1, 1, 1,
0.2325339, 0.1048869, -1.541676, 1, 1, 1, 1, 1,
0.2348686, 1.203994, 2.72669, 1, 1, 1, 1, 1,
0.235335, -0.7194443, 3.492055, 1, 1, 1, 1, 1,
0.2381722, 0.7508349, 0.6389233, 1, 1, 1, 1, 1,
0.2415101, -1.217089, 3.106865, 1, 1, 1, 1, 1,
0.2457726, 0.1995343, 2.111583, 1, 1, 1, 1, 1,
0.2516415, 0.3552713, 0.2312215, 1, 1, 1, 1, 1,
0.2517905, -0.5648826, 1.327083, 0, 0, 1, 1, 1,
0.2585639, 1.69746, 2.714216, 1, 0, 0, 1, 1,
0.2591302, -0.01450344, 0.3784865, 1, 0, 0, 1, 1,
0.2629191, -0.6974828, 1.394153, 1, 0, 0, 1, 1,
0.2660113, -1.317127, 4.177267, 1, 0, 0, 1, 1,
0.2684419, -0.1004233, 0.3247305, 1, 0, 0, 1, 1,
0.2690918, 0.132255, 0.7166063, 0, 0, 0, 1, 1,
0.2731346, 0.2663901, 1.215652, 0, 0, 0, 1, 1,
0.2733717, 0.1557275, 0.2115625, 0, 0, 0, 1, 1,
0.2778504, 1.302289, 0.4127152, 0, 0, 0, 1, 1,
0.2825235, 1.293176, -0.4977984, 0, 0, 0, 1, 1,
0.2848606, -0.2810024, 2.025193, 0, 0, 0, 1, 1,
0.2886156, -0.05553622, -0.06387753, 0, 0, 0, 1, 1,
0.2895127, 1.910206, 0.09613328, 1, 1, 1, 1, 1,
0.2896908, -0.6127214, 3.567591, 1, 1, 1, 1, 1,
0.2908147, 1.102636, 0.7960787, 1, 1, 1, 1, 1,
0.2924727, -0.6142672, 2.139508, 1, 1, 1, 1, 1,
0.3015609, 1.353231, -2.093071, 1, 1, 1, 1, 1,
0.3030374, -0.06212544, 2.630961, 1, 1, 1, 1, 1,
0.304876, -0.3583204, 3.419882, 1, 1, 1, 1, 1,
0.3053875, 0.2914734, 0.7134738, 1, 1, 1, 1, 1,
0.3069789, -0.7762983, 3.286974, 1, 1, 1, 1, 1,
0.3089316, 1.508322, 0.2861945, 1, 1, 1, 1, 1,
0.3110022, 0.7882806, 0.9875436, 1, 1, 1, 1, 1,
0.311722, 1.821365, -0.8877909, 1, 1, 1, 1, 1,
0.317528, -1.247543, 2.898906, 1, 1, 1, 1, 1,
0.3202852, 1.452147, 0.470521, 1, 1, 1, 1, 1,
0.3240802, 0.9325305, 1.245119, 1, 1, 1, 1, 1,
0.3245134, 1.905427, 0.1081426, 0, 0, 1, 1, 1,
0.326562, 1.367883, 0.08700103, 1, 0, 0, 1, 1,
0.3270989, 0.3145216, 0.4825727, 1, 0, 0, 1, 1,
0.328631, 1.392716, 0.7654263, 1, 0, 0, 1, 1,
0.3343777, 0.3883281, 2.098096, 1, 0, 0, 1, 1,
0.3371129, 0.59609, -0.144296, 1, 0, 0, 1, 1,
0.3386029, -0.2539633, 2.096089, 0, 0, 0, 1, 1,
0.3388939, 0.8795237, 1.786608, 0, 0, 0, 1, 1,
0.3397106, -1.439749, 3.797321, 0, 0, 0, 1, 1,
0.3407911, -0.3815881, 2.661012, 0, 0, 0, 1, 1,
0.3437969, 0.2066209, 0.5028989, 0, 0, 0, 1, 1,
0.3439977, -0.9321538, 1.557091, 0, 0, 0, 1, 1,
0.348257, 0.9366176, 0.8988973, 0, 0, 0, 1, 1,
0.3547548, 0.04324416, 1.508815, 1, 1, 1, 1, 1,
0.367855, -0.4032101, 3.015639, 1, 1, 1, 1, 1,
0.3710521, 0.05068565, 2.267609, 1, 1, 1, 1, 1,
0.372736, 1.833684, -0.2968329, 1, 1, 1, 1, 1,
0.3731938, 0.5283026, 1.577484, 1, 1, 1, 1, 1,
0.373332, -0.7759147, 3.949718, 1, 1, 1, 1, 1,
0.381442, 0.4695471, -0.5342333, 1, 1, 1, 1, 1,
0.3914573, -0.7635428, 3.783011, 1, 1, 1, 1, 1,
0.3916259, -0.1432719, 2.108995, 1, 1, 1, 1, 1,
0.3921394, -0.1931176, 0.8316584, 1, 1, 1, 1, 1,
0.396168, -1.935159, 2.005582, 1, 1, 1, 1, 1,
0.3965303, -1.409702, 3.438642, 1, 1, 1, 1, 1,
0.3966241, 0.3013148, 0.8925228, 1, 1, 1, 1, 1,
0.3986964, -0.6961872, 4.420055, 1, 1, 1, 1, 1,
0.4041786, 0.2041748, 1.74398, 1, 1, 1, 1, 1,
0.4062001, 0.1064189, 0.7047267, 0, 0, 1, 1, 1,
0.4227639, -1.41354, 4.808515, 1, 0, 0, 1, 1,
0.4312741, 1.194147, -0.1925416, 1, 0, 0, 1, 1,
0.433113, 0.1298697, 0.8084251, 1, 0, 0, 1, 1,
0.4337934, 0.3486422, 1.363897, 1, 0, 0, 1, 1,
0.4434889, -1.198048, 2.074771, 1, 0, 0, 1, 1,
0.4461592, 1.883285, 0.8959299, 0, 0, 0, 1, 1,
0.4469413, -0.1479948, 1.574475, 0, 0, 0, 1, 1,
0.4484583, -0.6466839, 2.281053, 0, 0, 0, 1, 1,
0.4487523, 0.9440541, 1.374071, 0, 0, 0, 1, 1,
0.4498788, -0.5812488, 4.678913, 0, 0, 0, 1, 1,
0.4508435, -0.2972668, 2.570784, 0, 0, 0, 1, 1,
0.4532074, -1.294378, 2.390615, 0, 0, 0, 1, 1,
0.4600379, 0.816792, 0.7608889, 1, 1, 1, 1, 1,
0.4603956, -0.08705068, 2.610786, 1, 1, 1, 1, 1,
0.461089, 1.386693, 0.7226778, 1, 1, 1, 1, 1,
0.4627408, -1.330004, 3.033142, 1, 1, 1, 1, 1,
0.4661489, -0.9906839, 3.017507, 1, 1, 1, 1, 1,
0.4661951, 0.3798284, 0.5328656, 1, 1, 1, 1, 1,
0.4666094, -0.2007462, 2.079897, 1, 1, 1, 1, 1,
0.4744853, -2.154414, 2.279406, 1, 1, 1, 1, 1,
0.4761272, -0.960845, 2.898886, 1, 1, 1, 1, 1,
0.4775696, 1.343957, 0.3629794, 1, 1, 1, 1, 1,
0.4821199, -0.1233203, 1.208006, 1, 1, 1, 1, 1,
0.4841413, 0.5338455, 1.571064, 1, 1, 1, 1, 1,
0.4865826, 0.6958078, 1.818922, 1, 1, 1, 1, 1,
0.4873067, 0.1317039, 1.631318, 1, 1, 1, 1, 1,
0.4875715, 0.310574, 0.4347905, 1, 1, 1, 1, 1,
0.4909416, 0.3942169, 0.6357113, 0, 0, 1, 1, 1,
0.4984904, 0.2859884, 1.715145, 1, 0, 0, 1, 1,
0.4993035, -0.1708739, 2.714012, 1, 0, 0, 1, 1,
0.5006248, 0.07872877, 3.773684, 1, 0, 0, 1, 1,
0.5006446, 0.6240508, 2.864926, 1, 0, 0, 1, 1,
0.5038565, -0.9072556, 3.159062, 1, 0, 0, 1, 1,
0.5068777, 0.7730885, 0.9582959, 0, 0, 0, 1, 1,
0.5085939, -1.710564, 4.653008, 0, 0, 0, 1, 1,
0.5093197, 0.6847696, -0.6911653, 0, 0, 0, 1, 1,
0.512772, -0.6666605, 2.514245, 0, 0, 0, 1, 1,
0.5153368, 1.258442, 0.6800628, 0, 0, 0, 1, 1,
0.517023, -1.134184, 2.863181, 0, 0, 0, 1, 1,
0.5184044, -1.091997, 1.838313, 0, 0, 0, 1, 1,
0.5196627, -0.1045058, 0.1000491, 1, 1, 1, 1, 1,
0.52161, 1.11343, -0.8012556, 1, 1, 1, 1, 1,
0.5218889, 0.3885989, 1.720613, 1, 1, 1, 1, 1,
0.5221392, 2.231264, 0.4338253, 1, 1, 1, 1, 1,
0.5223204, -1.194061, 1.763258, 1, 1, 1, 1, 1,
0.524105, -1.499736, 3.888696, 1, 1, 1, 1, 1,
0.5262879, 0.5839784, 2.648291, 1, 1, 1, 1, 1,
0.5292833, 0.04927467, 0.8486173, 1, 1, 1, 1, 1,
0.5304598, -1.798255, 2.516189, 1, 1, 1, 1, 1,
0.5344624, 2.968036, 0.1029864, 1, 1, 1, 1, 1,
0.5345823, -0.6338646, 2.645956, 1, 1, 1, 1, 1,
0.5401506, 1.346465, -0.1115641, 1, 1, 1, 1, 1,
0.5402314, -0.9997237, 4.100842, 1, 1, 1, 1, 1,
0.5434951, -0.4664947, 1.43333, 1, 1, 1, 1, 1,
0.5451962, -0.27084, 2.313165, 1, 1, 1, 1, 1,
0.5518742, -0.7573498, 2.36603, 0, 0, 1, 1, 1,
0.5522944, -1.77367, 3.776026, 1, 0, 0, 1, 1,
0.5536928, 1.145787, 0.09475943, 1, 0, 0, 1, 1,
0.5571852, -0.3154491, 2.7219, 1, 0, 0, 1, 1,
0.5594774, -1.112678, 3.294862, 1, 0, 0, 1, 1,
0.5598397, -0.8831242, 2.059996, 1, 0, 0, 1, 1,
0.5617598, 0.02638884, 2.236416, 0, 0, 0, 1, 1,
0.5628417, -1.389296, 4.253135, 0, 0, 0, 1, 1,
0.5632042, -0.1495317, 0.6866959, 0, 0, 0, 1, 1,
0.5654778, -0.1349028, 1.71765, 0, 0, 0, 1, 1,
0.5692895, -0.7785735, 1.148701, 0, 0, 0, 1, 1,
0.5713964, -0.2370054, 1.051509, 0, 0, 0, 1, 1,
0.5795951, 0.367219, 2.397942, 0, 0, 0, 1, 1,
0.5831015, 1.757758, -0.5812496, 1, 1, 1, 1, 1,
0.5890902, 0.09924296, 1.14922, 1, 1, 1, 1, 1,
0.5900319, -0.2693296, 3.73251, 1, 1, 1, 1, 1,
0.5900957, -1.176015, 4.47541, 1, 1, 1, 1, 1,
0.5955375, -0.7772021, 2.379493, 1, 1, 1, 1, 1,
0.5998579, 0.859466, 3.472012, 1, 1, 1, 1, 1,
0.6007183, -0.5536208, 2.895127, 1, 1, 1, 1, 1,
0.6089997, -0.6190545, 2.197237, 1, 1, 1, 1, 1,
0.6105163, 0.5202492, -0.9899811, 1, 1, 1, 1, 1,
0.6107899, 1.073483, 1.245211, 1, 1, 1, 1, 1,
0.6142305, -0.9477869, 2.667583, 1, 1, 1, 1, 1,
0.6189107, 0.801075, -1.644119, 1, 1, 1, 1, 1,
0.6189358, -1.791368, 3.726851, 1, 1, 1, 1, 1,
0.6221218, -1.087482, 2.270551, 1, 1, 1, 1, 1,
0.6301012, -0.3576943, 3.994536, 1, 1, 1, 1, 1,
0.631135, 0.7007639, 0.8385872, 0, 0, 1, 1, 1,
0.6313354, 0.3307629, 0.3882234, 1, 0, 0, 1, 1,
0.634559, -0.1030627, 2.253418, 1, 0, 0, 1, 1,
0.6391135, 1.387836, 0.07331692, 1, 0, 0, 1, 1,
0.6465669, -1.148401, 3.771668, 1, 0, 0, 1, 1,
0.6566195, 1.206591, -0.7406915, 1, 0, 0, 1, 1,
0.6665406, 1.362568, 1.738516, 0, 0, 0, 1, 1,
0.6697583, 0.2449436, 0.02160302, 0, 0, 0, 1, 1,
0.6709827, 0.1603226, 0.7780437, 0, 0, 0, 1, 1,
0.6754311, -1.391468, 4.707239, 0, 0, 0, 1, 1,
0.6755499, -1.1868, 2.389071, 0, 0, 0, 1, 1,
0.6870214, -0.8905467, 2.120019, 0, 0, 0, 1, 1,
0.6873049, -0.3255344, 2.594116, 0, 0, 0, 1, 1,
0.6949657, 1.429399, -0.8898281, 1, 1, 1, 1, 1,
0.6962684, -0.6120316, 1.898132, 1, 1, 1, 1, 1,
0.6964594, -1.219433, 3.832721, 1, 1, 1, 1, 1,
0.7003673, -0.6162107, 0.7357892, 1, 1, 1, 1, 1,
0.7053707, -0.3547344, 1.931148, 1, 1, 1, 1, 1,
0.7073216, 0.9337797, -1.145148, 1, 1, 1, 1, 1,
0.707525, 1.093838, -0.1463837, 1, 1, 1, 1, 1,
0.7081965, -1.465874, 4.278609, 1, 1, 1, 1, 1,
0.7123241, 1.049154, 1.233265, 1, 1, 1, 1, 1,
0.7133591, 0.3665484, 1.808189, 1, 1, 1, 1, 1,
0.7161096, 0.7517555, 0.8037658, 1, 1, 1, 1, 1,
0.7224506, 0.5404211, 0.4792966, 1, 1, 1, 1, 1,
0.7237519, 0.7332141, 1.289469, 1, 1, 1, 1, 1,
0.728886, 1.146539, -1.036016, 1, 1, 1, 1, 1,
0.7351604, -0.7364442, 3.886951, 1, 1, 1, 1, 1,
0.7385197, -1.062141, 2.050555, 0, 0, 1, 1, 1,
0.7399952, -0.2651592, 2.692313, 1, 0, 0, 1, 1,
0.7426054, 0.7475991, -0.8116655, 1, 0, 0, 1, 1,
0.7433172, 0.8283701, 1.81178, 1, 0, 0, 1, 1,
0.748642, -0.7011483, 2.255987, 1, 0, 0, 1, 1,
0.7503863, 1.852422, -0.5209633, 1, 0, 0, 1, 1,
0.7512164, -0.6295937, 0.520027, 0, 0, 0, 1, 1,
0.7517525, 1.849554, -0.1539804, 0, 0, 0, 1, 1,
0.7520574, 0.9884007, 0.5723278, 0, 0, 0, 1, 1,
0.7579489, -0.6603782, 3.759696, 0, 0, 0, 1, 1,
0.7609283, 0.4843814, 2.634226, 0, 0, 0, 1, 1,
0.7640226, 0.4848585, 1.546077, 0, 0, 0, 1, 1,
0.7680526, -1.108322, 2.300303, 0, 0, 0, 1, 1,
0.7691391, -0.6333035, 2.517121, 1, 1, 1, 1, 1,
0.7751511, 0.9484412, 0.6910434, 1, 1, 1, 1, 1,
0.7830355, -1.639445, 1.125643, 1, 1, 1, 1, 1,
0.785074, -2.094799, 2.559102, 1, 1, 1, 1, 1,
0.7913196, 0.5053272, 1.37247, 1, 1, 1, 1, 1,
0.798245, -0.320539, 1.760051, 1, 1, 1, 1, 1,
0.8044213, 0.3182731, 1.046788, 1, 1, 1, 1, 1,
0.8066315, 0.3993804, 2.493912, 1, 1, 1, 1, 1,
0.8087153, 0.8521742, 2.199902, 1, 1, 1, 1, 1,
0.8129773, -1.304496, 2.703114, 1, 1, 1, 1, 1,
0.8251576, 0.2067349, 1.772655, 1, 1, 1, 1, 1,
0.8274414, 1.572466, 1.404421, 1, 1, 1, 1, 1,
0.8290069, 1.814061, 1.751663, 1, 1, 1, 1, 1,
0.8312857, 1.71316, 2.41867, 1, 1, 1, 1, 1,
0.8378696, 1.966707, 0.2186446, 1, 1, 1, 1, 1,
0.8383363, -0.2684581, 1.998858, 0, 0, 1, 1, 1,
0.8518885, -1.641232, 2.55588, 1, 0, 0, 1, 1,
0.8560552, -0.4556066, 5.180165, 1, 0, 0, 1, 1,
0.8626757, -0.1407334, 0.9977868, 1, 0, 0, 1, 1,
0.866375, 0.7715489, -0.0754898, 1, 0, 0, 1, 1,
0.8681862, 1.025716, 1.612983, 1, 0, 0, 1, 1,
0.8683054, -0.06826344, 1.082416, 0, 0, 0, 1, 1,
0.8718698, 1.488487, 0.5452063, 0, 0, 0, 1, 1,
0.8724577, -0.9919057, 4.10118, 0, 0, 0, 1, 1,
0.8730276, 0.1485333, 0.3555914, 0, 0, 0, 1, 1,
0.8740399, -2.314379, 3.614602, 0, 0, 0, 1, 1,
0.8750713, -0.2123811, 1.555389, 0, 0, 0, 1, 1,
0.8761201, 1.920651, 0.02831712, 0, 0, 0, 1, 1,
0.8826704, -0.2783827, 2.310629, 1, 1, 1, 1, 1,
0.8828515, 0.3132343, 2.901286, 1, 1, 1, 1, 1,
0.8923919, -1.153833, 0.5598182, 1, 1, 1, 1, 1,
0.8968804, -0.8685434, 0.02834219, 1, 1, 1, 1, 1,
0.909621, -0.4511927, 1.157473, 1, 1, 1, 1, 1,
0.9105485, -0.6886411, 1.651941, 1, 1, 1, 1, 1,
0.9167766, 0.003064506, 1.88216, 1, 1, 1, 1, 1,
0.921373, 1.337414, -1.026574, 1, 1, 1, 1, 1,
0.9247349, 0.4322647, 0.9792562, 1, 1, 1, 1, 1,
0.9310101, -0.3731042, 3.090477, 1, 1, 1, 1, 1,
0.9359695, -0.1496042, 0.8731648, 1, 1, 1, 1, 1,
0.9368864, -0.5011269, 1.211007, 1, 1, 1, 1, 1,
0.9398859, -1.478805, 1.857404, 1, 1, 1, 1, 1,
0.9615893, 0.5661488, 0.03596647, 1, 1, 1, 1, 1,
0.9630817, -2.274304, 2.442294, 1, 1, 1, 1, 1,
0.9680672, -0.670241, 3.921837, 0, 0, 1, 1, 1,
0.9692623, 0.8170277, 0.7467479, 1, 0, 0, 1, 1,
0.9745764, 1.02258, 1.688922, 1, 0, 0, 1, 1,
0.9746577, -1.145592, 1.655625, 1, 0, 0, 1, 1,
0.9813434, 0.2822689, 1.356446, 1, 0, 0, 1, 1,
0.9863544, 0.1374719, 1.512952, 1, 0, 0, 1, 1,
0.9896924, 0.3358909, -0.3512589, 0, 0, 0, 1, 1,
0.9911019, 1.841268, 0.7453819, 0, 0, 0, 1, 1,
0.9931343, -0.6670166, 2.1103, 0, 0, 0, 1, 1,
0.9980446, -0.8801482, 1.87453, 0, 0, 0, 1, 1,
0.9992252, -0.3236499, -0.3631592, 0, 0, 0, 1, 1,
0.999545, -1.226218, 2.830391, 0, 0, 0, 1, 1,
1.006384, -1.166601, 3.51116, 0, 0, 0, 1, 1,
1.008382, 1.877383, 0.8489798, 1, 1, 1, 1, 1,
1.031544, -0.2237885, -0.1027252, 1, 1, 1, 1, 1,
1.031669, -1.327714, 3.131255, 1, 1, 1, 1, 1,
1.036063, -0.3828054, 0.1458405, 1, 1, 1, 1, 1,
1.037662, 1.664464, -0.3002314, 1, 1, 1, 1, 1,
1.041021, 0.8302459, 1.392272, 1, 1, 1, 1, 1,
1.041471, -0.4461311, 1.657651, 1, 1, 1, 1, 1,
1.044881, 1.352245, -0.5895219, 1, 1, 1, 1, 1,
1.045157, -0.7045788, 1.177072, 1, 1, 1, 1, 1,
1.048422, -1.172254, 2.491535, 1, 1, 1, 1, 1,
1.061373, -1.310125, 1.267008, 1, 1, 1, 1, 1,
1.069109, -0.8681871, 1.464611, 1, 1, 1, 1, 1,
1.072446, -0.09510238, 1.175425, 1, 1, 1, 1, 1,
1.085875, 0.8548538, 1.015949, 1, 1, 1, 1, 1,
1.08805, -0.561264, 4.005916, 1, 1, 1, 1, 1,
1.09011, 1.129554, -0.5115057, 0, 0, 1, 1, 1,
1.091491, -0.7664657, 0.4689168, 1, 0, 0, 1, 1,
1.095606, 1.150161, 0.05241329, 1, 0, 0, 1, 1,
1.095777, 0.9946165, 2.53392, 1, 0, 0, 1, 1,
1.100286, -0.1800904, 0.621133, 1, 0, 0, 1, 1,
1.10039, -0.4107453, 1.821869, 1, 0, 0, 1, 1,
1.100552, -0.6077191, 0.6797178, 0, 0, 0, 1, 1,
1.109479, -0.6700706, 2.441391, 0, 0, 0, 1, 1,
1.119211, -1.346661, 1.542282, 0, 0, 0, 1, 1,
1.119964, 0.0927643, 1.730249, 0, 0, 0, 1, 1,
1.12152, 0.1573295, 1.737177, 0, 0, 0, 1, 1,
1.124838, -1.173539, 2.780037, 0, 0, 0, 1, 1,
1.127134, 0.6869574, 0.7451997, 0, 0, 0, 1, 1,
1.128396, -0.7089068, 2.125087, 1, 1, 1, 1, 1,
1.128511, 0.6923257, 2.867342, 1, 1, 1, 1, 1,
1.130186, 1.794373, -0.651033, 1, 1, 1, 1, 1,
1.139986, 1.110551, 1.654732, 1, 1, 1, 1, 1,
1.141016, -2.188185, 1.227403, 1, 1, 1, 1, 1,
1.145089, -1.212531, 0.893705, 1, 1, 1, 1, 1,
1.145505, 0.2906288, -0.08747967, 1, 1, 1, 1, 1,
1.148435, -1.234815, 1.190456, 1, 1, 1, 1, 1,
1.152072, 1.743329, 0.02116613, 1, 1, 1, 1, 1,
1.169377, 1.045635, 0.6640199, 1, 1, 1, 1, 1,
1.175112, -1.017537, 1.394485, 1, 1, 1, 1, 1,
1.181602, 0.593203, 0.7457868, 1, 1, 1, 1, 1,
1.184179, 0.5044934, 2.022669, 1, 1, 1, 1, 1,
1.189044, -0.680769, 2.975811, 1, 1, 1, 1, 1,
1.202118, -0.7002993, 3.722463, 1, 1, 1, 1, 1,
1.202295, 0.9189205, 1.596057, 0, 0, 1, 1, 1,
1.202456, -0.2029393, 2.479337, 1, 0, 0, 1, 1,
1.20584, 0.7947271, 2.231661, 1, 0, 0, 1, 1,
1.210682, 0.2959326, 2.032244, 1, 0, 0, 1, 1,
1.211876, -0.4806619, 1.053542, 1, 0, 0, 1, 1,
1.215841, 1.229024, 0.7325762, 1, 0, 0, 1, 1,
1.215912, 1.248878, 1.509792, 0, 0, 0, 1, 1,
1.227676, -0.545043, 2.47157, 0, 0, 0, 1, 1,
1.231849, 0.5458568, 1.323422, 0, 0, 0, 1, 1,
1.237796, 1.05114, 0.9344841, 0, 0, 0, 1, 1,
1.2386, 0.9823267, 1.391009, 0, 0, 0, 1, 1,
1.241401, -0.861936, 1.724504, 0, 0, 0, 1, 1,
1.244232, 1.273556, 0.8232771, 0, 0, 0, 1, 1,
1.244626, -0.2488041, 3.133759, 1, 1, 1, 1, 1,
1.247396, 0.6176153, 0.7112225, 1, 1, 1, 1, 1,
1.252015, 0.023073, 2.107114, 1, 1, 1, 1, 1,
1.258269, 1.097672, -0.5557375, 1, 1, 1, 1, 1,
1.258796, 0.1692148, 2.851257, 1, 1, 1, 1, 1,
1.277136, -0.5987853, 0.1923564, 1, 1, 1, 1, 1,
1.307321, -0.4061409, 3.150779, 1, 1, 1, 1, 1,
1.310431, -0.9474542, 2.684733, 1, 1, 1, 1, 1,
1.311619, -1.320637, 2.872048, 1, 1, 1, 1, 1,
1.318739, -0.5143095, 2.850039, 1, 1, 1, 1, 1,
1.320938, 1.335862, 1.689912, 1, 1, 1, 1, 1,
1.3323, 0.3366646, 0.7721411, 1, 1, 1, 1, 1,
1.33692, 1.25422, 0.5068052, 1, 1, 1, 1, 1,
1.341899, 1.070758, 1.865376, 1, 1, 1, 1, 1,
1.344902, -0.1920907, 1.716826, 1, 1, 1, 1, 1,
1.350617, 1.904337, -1.178251, 0, 0, 1, 1, 1,
1.351824, 0.8882563, 0.9971772, 1, 0, 0, 1, 1,
1.356259, -1.699168, 3.706633, 1, 0, 0, 1, 1,
1.357704, 0.7896299, 2.58319, 1, 0, 0, 1, 1,
1.371105, -0.776157, 2.04178, 1, 0, 0, 1, 1,
1.371909, -0.1897846, 1.421307, 1, 0, 0, 1, 1,
1.372693, -1.847106, 2.263156, 0, 0, 0, 1, 1,
1.373001, -1.114925, 2.298376, 0, 0, 0, 1, 1,
1.374521, 0.6895646, 2.902784, 0, 0, 0, 1, 1,
1.383512, -0.8726462, 4.345157, 0, 0, 0, 1, 1,
1.386703, 0.8711103, 1.084735, 0, 0, 0, 1, 1,
1.398056, -0.2290051, 2.389476, 0, 0, 0, 1, 1,
1.398117, -1.094625, 2.578453, 0, 0, 0, 1, 1,
1.405708, -0.3831185, 1.597161, 1, 1, 1, 1, 1,
1.40722, 1.138248, 0.6605029, 1, 1, 1, 1, 1,
1.41737, -1.595947, 1.584072, 1, 1, 1, 1, 1,
1.417746, -0.4473881, 1.685024, 1, 1, 1, 1, 1,
1.424714, 0.4645347, 0.1863829, 1, 1, 1, 1, 1,
1.440268, -0.8714832, 2.37724, 1, 1, 1, 1, 1,
1.443967, -0.1034291, 3.148664, 1, 1, 1, 1, 1,
1.455491, -0.7092267, 1.415098, 1, 1, 1, 1, 1,
1.465893, -0.491589, 0.9030309, 1, 1, 1, 1, 1,
1.470912, -0.3733641, 1.084312, 1, 1, 1, 1, 1,
1.476745, 0.906593, 1.344184, 1, 1, 1, 1, 1,
1.481308, 0.8934532, 0.953289, 1, 1, 1, 1, 1,
1.489643, 1.630032, 0.1088913, 1, 1, 1, 1, 1,
1.507226, -0.002164431, 1.390939, 1, 1, 1, 1, 1,
1.513488, 0.5999383, 1.186846, 1, 1, 1, 1, 1,
1.513511, -0.2038569, 1.961219, 0, 0, 1, 1, 1,
1.516476, -0.5742761, 2.098826, 1, 0, 0, 1, 1,
1.519765, 1.557228, 1.434761, 1, 0, 0, 1, 1,
1.524311, 0.8914576, 3.300389, 1, 0, 0, 1, 1,
1.525563, -0.57965, 0.8746043, 1, 0, 0, 1, 1,
1.525749, 0.3500386, 4.153262, 1, 0, 0, 1, 1,
1.527713, -0.7026079, 0.8492915, 0, 0, 0, 1, 1,
1.529427, 0.290094, 1.16205, 0, 0, 0, 1, 1,
1.547875, -1.140134, 2.880181, 0, 0, 0, 1, 1,
1.549176, 1.574651, -0.5303113, 0, 0, 0, 1, 1,
1.55672, -0.6295032, 3.150602, 0, 0, 0, 1, 1,
1.605606, -0.1307042, -0.3791432, 0, 0, 0, 1, 1,
1.613746, 1.114808, 0.1544415, 0, 0, 0, 1, 1,
1.629481, 3.106072, 1.03072, 1, 1, 1, 1, 1,
1.632074, -0.08307675, 2.752342, 1, 1, 1, 1, 1,
1.641279, -1.358862, 1.096044, 1, 1, 1, 1, 1,
1.641842, -1.213157, 2.199559, 1, 1, 1, 1, 1,
1.653261, -0.03743251, 0.5130799, 1, 1, 1, 1, 1,
1.673491, 1.429642, 1.39013, 1, 1, 1, 1, 1,
1.69808, 0.1645399, 1.555045, 1, 1, 1, 1, 1,
1.70565, -0.1266568, -0.6550061, 1, 1, 1, 1, 1,
1.706162, 0.8187135, 1.952651, 1, 1, 1, 1, 1,
1.708379, 0.4219451, 2.569645, 1, 1, 1, 1, 1,
1.712149, -0.2428476, 1.833533, 1, 1, 1, 1, 1,
1.718252, -0.5085411, 3.939655, 1, 1, 1, 1, 1,
1.734374, 2.66151, 0.525659, 1, 1, 1, 1, 1,
1.742696, 0.7614512, -0.4173362, 1, 1, 1, 1, 1,
1.745691, -0.9099669, 1.993108, 1, 1, 1, 1, 1,
1.755204, -1.556397, 2.214363, 0, 0, 1, 1, 1,
1.75603, 1.458793, -0.03018925, 1, 0, 0, 1, 1,
1.759856, -0.8542789, 1.319451, 1, 0, 0, 1, 1,
1.762404, 3.182671, 0.08126632, 1, 0, 0, 1, 1,
1.800423, 0.3224013, 0.2773077, 1, 0, 0, 1, 1,
1.812501, 0.6792243, 1.736931, 1, 0, 0, 1, 1,
1.81541, -1.588815, 3.848546, 0, 0, 0, 1, 1,
1.826618, 0.03864358, 2.405922, 0, 0, 0, 1, 1,
1.847454, 0.6673875, 2.114632, 0, 0, 0, 1, 1,
1.84785, 1.109229, -1.307371, 0, 0, 0, 1, 1,
1.875219, 0.374005, 3.572388, 0, 0, 0, 1, 1,
1.877499, 0.8913815, 0.8487012, 0, 0, 0, 1, 1,
1.890142, -1.164556, 1.748426, 0, 0, 0, 1, 1,
1.890628, 0.03621235, 1.251081, 1, 1, 1, 1, 1,
1.902027, 0.6488107, 1.781014, 1, 1, 1, 1, 1,
1.911989, -1.189996, 2.725394, 1, 1, 1, 1, 1,
1.918891, 1.729302, 1.350543, 1, 1, 1, 1, 1,
1.920097, -0.7450851, -0.4700576, 1, 1, 1, 1, 1,
1.927441, -1.272009, 3.08883, 1, 1, 1, 1, 1,
1.958824, -0.3489076, 2.323795, 1, 1, 1, 1, 1,
1.982482, 0.5666675, 0.9881898, 1, 1, 1, 1, 1,
2.003105, -0.2015104, 2.751462, 1, 1, 1, 1, 1,
2.012331, 0.659499, 2.084247, 1, 1, 1, 1, 1,
2.056754, 0.3118058, 3.019013, 1, 1, 1, 1, 1,
2.089996, -0.6691944, 0.619536, 1, 1, 1, 1, 1,
2.145168, 1.523882, 2.290679, 1, 1, 1, 1, 1,
2.169114, 1.28768, -0.6736866, 1, 1, 1, 1, 1,
2.177997, 1.65951, 1.381895, 1, 1, 1, 1, 1,
2.179043, 0.243621, 1.721494, 0, 0, 1, 1, 1,
2.195743, -1.264113, 2.913102, 1, 0, 0, 1, 1,
2.195747, -0.09502118, 0.5463392, 1, 0, 0, 1, 1,
2.20668, 1.051739, 1.210071, 1, 0, 0, 1, 1,
2.281446, -0.7988061, -0.8054675, 1, 0, 0, 1, 1,
2.458861, 0.9129485, 1.677207, 1, 0, 0, 1, 1,
2.46139, 0.9193702, 3.159024, 0, 0, 0, 1, 1,
2.490414, 0.1251028, 0.8161754, 0, 0, 0, 1, 1,
2.496685, 0.1241363, 0.8280166, 0, 0, 0, 1, 1,
2.501897, 0.9603647, 1.137009, 0, 0, 0, 1, 1,
2.530195, -0.8595723, 1.142385, 0, 0, 0, 1, 1,
2.628626, -0.07208563, 1.029024, 0, 0, 0, 1, 1,
2.694805, 1.256068, 1.647691, 0, 0, 0, 1, 1,
2.695414, 0.7789968, 0.8745199, 1, 1, 1, 1, 1,
2.817021, -0.9069743, 1.659639, 1, 1, 1, 1, 1,
2.833285, 0.2369663, 0.2173028, 1, 1, 1, 1, 1,
2.837566, 0.8707086, 0.9363672, 1, 1, 1, 1, 1,
3.313532, 0.7459348, 2.100928, 1, 1, 1, 1, 1,
3.352152, 0.131751, 0.4512039, 1, 1, 1, 1, 1,
3.355765, 0.4416042, 1.351202, 1, 1, 1, 1, 1
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
var radius = 9.683184;
var distance = 34.01177;
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
mvMatrix.translate( 0.1799033, -0.2059058, 0.1560266 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01177);
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
