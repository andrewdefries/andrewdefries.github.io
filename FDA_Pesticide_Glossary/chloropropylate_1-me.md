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
-3.68093, -2.031188, -0.9905339, 1, 0, 0, 1,
-2.917607, 1.8661, -1.350468, 1, 0.007843138, 0, 1,
-2.638951, -0.3252906, -0.6907282, 1, 0.01176471, 0, 1,
-2.476083, 0.04408919, -2.464972, 1, 0.01960784, 0, 1,
-2.42664, -0.7381772, -0.9864937, 1, 0.02352941, 0, 1,
-2.354978, 0.7805336, -1.368831, 1, 0.03137255, 0, 1,
-2.279951, 0.03664233, -2.73999, 1, 0.03529412, 0, 1,
-2.196166, -0.1657957, -0.7286837, 1, 0.04313726, 0, 1,
-2.188011, 1.762211, -0.3233938, 1, 0.04705882, 0, 1,
-2.128668, 0.8605268, -2.531971, 1, 0.05490196, 0, 1,
-2.069406, 0.2784997, -0.468438, 1, 0.05882353, 0, 1,
-2.057621, 0.6021178, -1.059958, 1, 0.06666667, 0, 1,
-2.055001, 0.7984936, -1.082461, 1, 0.07058824, 0, 1,
-2.053015, 0.2397984, -0.5910016, 1, 0.07843138, 0, 1,
-2.029983, -0.8461849, -4.551634, 1, 0.08235294, 0, 1,
-2.022137, 0.235291, -0.9427639, 1, 0.09019608, 0, 1,
-1.996723, 2.78864, 0.3114205, 1, 0.09411765, 0, 1,
-1.989775, -0.2855352, -2.899958, 1, 0.1019608, 0, 1,
-1.982524, 1.242629, -0.6369802, 1, 0.1098039, 0, 1,
-1.939418, 0.8849016, -1.622415, 1, 0.1137255, 0, 1,
-1.938887, -0.529031, -2.362408, 1, 0.1215686, 0, 1,
-1.937461, -0.9455321, -2.119388, 1, 0.1254902, 0, 1,
-1.916369, 1.099766, -1.186402, 1, 0.1333333, 0, 1,
-1.87126, -0.1772634, -1.332138, 1, 0.1372549, 0, 1,
-1.85544, -0.6152844, -1.330431, 1, 0.145098, 0, 1,
-1.842406, 0.4424123, -1.953405, 1, 0.1490196, 0, 1,
-1.842006, -2.533583, -3.190719, 1, 0.1568628, 0, 1,
-1.839381, 0.980185, -1.520957, 1, 0.1607843, 0, 1,
-1.820983, -1.460256, -1.679909, 1, 0.1686275, 0, 1,
-1.819312, 0.9234467, -0.9475931, 1, 0.172549, 0, 1,
-1.81882, 1.655703, -1.319935, 1, 0.1803922, 0, 1,
-1.795251, 1.934603, -0.174945, 1, 0.1843137, 0, 1,
-1.780215, -0.5893763, -1.263471, 1, 0.1921569, 0, 1,
-1.771908, -0.03881991, -1.830706, 1, 0.1960784, 0, 1,
-1.758238, 0.05818313, -1.537323, 1, 0.2039216, 0, 1,
-1.754824, -0.1309363, -0.03871287, 1, 0.2117647, 0, 1,
-1.739243, -0.5999151, -1.005585, 1, 0.2156863, 0, 1,
-1.72792, -1.712414, -0.6384727, 1, 0.2235294, 0, 1,
-1.723874, 0.6689837, -0.1003709, 1, 0.227451, 0, 1,
-1.716453, -0.4021579, -1.862326, 1, 0.2352941, 0, 1,
-1.696135, -1.232562, -2.493275, 1, 0.2392157, 0, 1,
-1.691095, 0.1086214, -1.732311, 1, 0.2470588, 0, 1,
-1.68458, -1.327911, -3.334699, 1, 0.2509804, 0, 1,
-1.680238, -0.6817245, -0.8171827, 1, 0.2588235, 0, 1,
-1.676849, 0.2913173, -0.8351667, 1, 0.2627451, 0, 1,
-1.663419, 0.5680069, -1.53541, 1, 0.2705882, 0, 1,
-1.660227, 0.1752899, 1.38677, 1, 0.2745098, 0, 1,
-1.625241, -1.835473, -3.178267, 1, 0.282353, 0, 1,
-1.625237, 1.229541, -2.567719, 1, 0.2862745, 0, 1,
-1.615977, 0.811913, -3.276413, 1, 0.2941177, 0, 1,
-1.578833, 1.341812, -0.4400285, 1, 0.3019608, 0, 1,
-1.577982, -2.269897, -1.657538, 1, 0.3058824, 0, 1,
-1.577332, -0.2984122, -1.358771, 1, 0.3137255, 0, 1,
-1.555052, 0.3796513, -0.3306912, 1, 0.3176471, 0, 1,
-1.533049, -0.1092694, -1.319165, 1, 0.3254902, 0, 1,
-1.524011, -1.356231, -2.882815, 1, 0.3294118, 0, 1,
-1.515757, 2.841875, 1.727476, 1, 0.3372549, 0, 1,
-1.51547, 0.3662527, -1.880473, 1, 0.3411765, 0, 1,
-1.514364, -0.02572849, -2.027527, 1, 0.3490196, 0, 1,
-1.514165, -0.5552918, -1.093401, 1, 0.3529412, 0, 1,
-1.509817, 0.5864234, -2.155298, 1, 0.3607843, 0, 1,
-1.502128, 2.273432, -1.780002, 1, 0.3647059, 0, 1,
-1.498493, -1.99788, -3.548091, 1, 0.372549, 0, 1,
-1.483799, 1.505707, -1.688138, 1, 0.3764706, 0, 1,
-1.476875, 0.01155565, -2.100802, 1, 0.3843137, 0, 1,
-1.474991, 0.4529004, -2.615623, 1, 0.3882353, 0, 1,
-1.462243, -0.6790785, -1.989685, 1, 0.3960784, 0, 1,
-1.458155, -0.7514117, -2.757958, 1, 0.4039216, 0, 1,
-1.458043, -0.7794626, -2.558424, 1, 0.4078431, 0, 1,
-1.451064, 0.5471813, -0.6769153, 1, 0.4156863, 0, 1,
-1.441292, -0.6475672, -2.398509, 1, 0.4196078, 0, 1,
-1.437155, 0.8158624, -1.566615, 1, 0.427451, 0, 1,
-1.41587, -0.5884764, -2.613259, 1, 0.4313726, 0, 1,
-1.411776, 0.2252749, 0.2323138, 1, 0.4392157, 0, 1,
-1.404345, -2.510796, -2.007165, 1, 0.4431373, 0, 1,
-1.394367, -0.7801405, -0.1078591, 1, 0.4509804, 0, 1,
-1.385679, -0.7434532, -2.200351, 1, 0.454902, 0, 1,
-1.380479, 1.894082, -0.6105019, 1, 0.4627451, 0, 1,
-1.376276, -0.7572175, -1.517814, 1, 0.4666667, 0, 1,
-1.366443, -1.716438, -2.701547, 1, 0.4745098, 0, 1,
-1.360449, 0.9448536, 0.4851106, 1, 0.4784314, 0, 1,
-1.360226, -0.9293994, -0.7187621, 1, 0.4862745, 0, 1,
-1.358887, -0.2588021, -2.74342, 1, 0.4901961, 0, 1,
-1.355546, 0.5983437, -1.941207, 1, 0.4980392, 0, 1,
-1.350442, 0.5876931, -1.672144, 1, 0.5058824, 0, 1,
-1.308056, 1.557495, 0.1745175, 1, 0.509804, 0, 1,
-1.299944, -1.025154, -3.059288, 1, 0.5176471, 0, 1,
-1.296187, 0.4048863, -1.779439, 1, 0.5215687, 0, 1,
-1.286907, 0.01921842, -2.864026, 1, 0.5294118, 0, 1,
-1.285888, -0.7719593, -3.18074, 1, 0.5333334, 0, 1,
-1.285782, -0.1125864, -1.119463, 1, 0.5411765, 0, 1,
-1.284883, -0.1708112, -1.687973, 1, 0.5450981, 0, 1,
-1.284149, 0.4539662, -0.7795742, 1, 0.5529412, 0, 1,
-1.28053, 0.05757127, -1.875375, 1, 0.5568628, 0, 1,
-1.271032, -0.5791196, -1.572884, 1, 0.5647059, 0, 1,
-1.269305, -1.462431, -2.734857, 1, 0.5686275, 0, 1,
-1.267922, -0.01429026, -0.6377283, 1, 0.5764706, 0, 1,
-1.253836, -0.5967484, -0.9676952, 1, 0.5803922, 0, 1,
-1.251613, -0.8195687, -2.655838, 1, 0.5882353, 0, 1,
-1.243892, -0.3424581, -1.165935, 1, 0.5921569, 0, 1,
-1.222924, 1.387876, -1.091811, 1, 0.6, 0, 1,
-1.212424, 1.01383, -1.297102, 1, 0.6078432, 0, 1,
-1.209121, 0.2473097, -0.5996576, 1, 0.6117647, 0, 1,
-1.208823, -1.74344, -2.447976, 1, 0.6196079, 0, 1,
-1.203412, 0.8589473, -1.70143, 1, 0.6235294, 0, 1,
-1.200536, -1.674532, -3.464393, 1, 0.6313726, 0, 1,
-1.197362, -0.4502798, -2.436995, 1, 0.6352941, 0, 1,
-1.195556, 1.144114, -1.128043, 1, 0.6431373, 0, 1,
-1.189462, -1.651707, -1.011473, 1, 0.6470588, 0, 1,
-1.180579, 1.175411, 0.9798921, 1, 0.654902, 0, 1,
-1.1759, 0.1171722, -1.638341, 1, 0.6588235, 0, 1,
-1.173929, 0.4248562, 0.7586457, 1, 0.6666667, 0, 1,
-1.173467, -0.7095869, -0.2447967, 1, 0.6705883, 0, 1,
-1.165219, -0.3681745, -2.630223, 1, 0.6784314, 0, 1,
-1.164415, -0.6706321, -2.203925, 1, 0.682353, 0, 1,
-1.162111, 1.343687, -0.4547554, 1, 0.6901961, 0, 1,
-1.155715, 0.002284804, -1.773241, 1, 0.6941177, 0, 1,
-1.152032, -1.073236, -3.28249, 1, 0.7019608, 0, 1,
-1.151145, -0.6465455, 0.5280959, 1, 0.7098039, 0, 1,
-1.143072, 0.7285725, -3.119639, 1, 0.7137255, 0, 1,
-1.138826, -1.020825, -4.783339, 1, 0.7215686, 0, 1,
-1.136438, 1.221612, -1.026366, 1, 0.7254902, 0, 1,
-1.127051, -1.144394, -3.989746, 1, 0.7333333, 0, 1,
-1.125821, 0.5129701, -1.745167, 1, 0.7372549, 0, 1,
-1.12149, 0.5601242, -0.1086187, 1, 0.7450981, 0, 1,
-1.118279, 0.4456459, -1.123059, 1, 0.7490196, 0, 1,
-1.115876, -0.4493878, -2.622534, 1, 0.7568628, 0, 1,
-1.114679, -0.004288565, 0.2595845, 1, 0.7607843, 0, 1,
-1.114614, 0.6129827, -2.617375, 1, 0.7686275, 0, 1,
-1.114249, -0.8519402, -2.533213, 1, 0.772549, 0, 1,
-1.112972, -2.283276, -3.357732, 1, 0.7803922, 0, 1,
-1.095795, 1.039225, -0.6014988, 1, 0.7843137, 0, 1,
-1.088258, 0.7843829, -0.1305712, 1, 0.7921569, 0, 1,
-1.082046, -1.334609, -1.857216, 1, 0.7960784, 0, 1,
-1.081295, -0.2210568, -2.229719, 1, 0.8039216, 0, 1,
-1.069068, 1.296184, 0.60112, 1, 0.8117647, 0, 1,
-1.064051, 0.7075506, -1.994226, 1, 0.8156863, 0, 1,
-1.056996, -2.713087, -3.535373, 1, 0.8235294, 0, 1,
-1.050965, 0.6162202, -0.4428402, 1, 0.827451, 0, 1,
-1.050455, 0.1712126, -2.54855, 1, 0.8352941, 0, 1,
-1.046624, -1.819522, -2.180104, 1, 0.8392157, 0, 1,
-1.041704, 1.320047, -1.203021, 1, 0.8470588, 0, 1,
-1.036852, -0.007490818, -0.3783226, 1, 0.8509804, 0, 1,
-1.028165, 2.212406, 0.01040349, 1, 0.8588235, 0, 1,
-1.024875, 0.7874563, -1.308098, 1, 0.8627451, 0, 1,
-1.009598, 0.7161249, -1.360386, 1, 0.8705882, 0, 1,
-1.009537, 1.521501, -2.256911, 1, 0.8745098, 0, 1,
-0.9868616, -0.4341798, 0.2437706, 1, 0.8823529, 0, 1,
-0.9853806, -0.666113, -2.238555, 1, 0.8862745, 0, 1,
-0.9820126, 0.5730159, -0.9502518, 1, 0.8941177, 0, 1,
-0.9813254, 1.177596, -2.097709, 1, 0.8980392, 0, 1,
-0.9781376, 0.1907394, -0.7575215, 1, 0.9058824, 0, 1,
-0.9767843, -0.05794978, -1.400093, 1, 0.9137255, 0, 1,
-0.9755937, 0.05219663, -3.397095, 1, 0.9176471, 0, 1,
-0.9742394, -1.271139, -4.512917, 1, 0.9254902, 0, 1,
-0.9737198, -1.248398, -2.474017, 1, 0.9294118, 0, 1,
-0.9716625, 0.02545746, -1.013118, 1, 0.9372549, 0, 1,
-0.9677638, -1.883309, -0.7859699, 1, 0.9411765, 0, 1,
-0.9625126, -1.508364, -3.161089, 1, 0.9490196, 0, 1,
-0.9585285, -2.037718, -3.473414, 1, 0.9529412, 0, 1,
-0.9483089, -1.318349, -1.812202, 1, 0.9607843, 0, 1,
-0.9397039, 0.8320352, 0.02781756, 1, 0.9647059, 0, 1,
-0.9383606, -1.036015, -1.47699, 1, 0.972549, 0, 1,
-0.93481, -0.9773874, -1.523707, 1, 0.9764706, 0, 1,
-0.9336292, 0.8310969, -0.7532095, 1, 0.9843137, 0, 1,
-0.9331674, -1.878899, -2.898547, 1, 0.9882353, 0, 1,
-0.9310085, 0.641437, -2.247298, 1, 0.9960784, 0, 1,
-0.9303765, -0.4979064, -3.921984, 0.9960784, 1, 0, 1,
-0.9297069, -1.138409, -2.721996, 0.9921569, 1, 0, 1,
-0.9276727, -1.88691, -3.206909, 0.9843137, 1, 0, 1,
-0.9261517, 1.297084, -1.41287, 0.9803922, 1, 0, 1,
-0.9258976, -0.6683838, -2.538718, 0.972549, 1, 0, 1,
-0.9209182, 1.051587, -2.410079, 0.9686275, 1, 0, 1,
-0.9190623, 0.5564658, 0.08844044, 0.9607843, 1, 0, 1,
-0.9189346, -1.017098, -0.4817286, 0.9568627, 1, 0, 1,
-0.9147769, 0.9789514, -3.611864, 0.9490196, 1, 0, 1,
-0.912803, 0.4696953, 0.1124833, 0.945098, 1, 0, 1,
-0.9114458, 0.5281722, -1.177593, 0.9372549, 1, 0, 1,
-0.9078058, -1.230538, -2.703844, 0.9333333, 1, 0, 1,
-0.9051226, -0.2014652, -0.7426592, 0.9254902, 1, 0, 1,
-0.8951104, -0.4736678, -1.137255, 0.9215686, 1, 0, 1,
-0.8938401, -0.854645, -2.050475, 0.9137255, 1, 0, 1,
-0.8781639, -0.5525416, -1.244582, 0.9098039, 1, 0, 1,
-0.8708394, -1.23108, -2.498916, 0.9019608, 1, 0, 1,
-0.8686902, 1.645669, -0.07754146, 0.8941177, 1, 0, 1,
-0.8653691, 1.232285, -0.3661822, 0.8901961, 1, 0, 1,
-0.8652557, 0.6646542, 0.8720588, 0.8823529, 1, 0, 1,
-0.8639725, 1.51749, -1.779143, 0.8784314, 1, 0, 1,
-0.858991, 0.201186, -0.6846018, 0.8705882, 1, 0, 1,
-0.8545997, 2.154253, 1.592405, 0.8666667, 1, 0, 1,
-0.8543622, 1.679623, 0.429662, 0.8588235, 1, 0, 1,
-0.8528353, 0.6045619, 1.422821, 0.854902, 1, 0, 1,
-0.8456984, -1.083752, -1.029986, 0.8470588, 1, 0, 1,
-0.8417804, -0.001828222, -1.676434, 0.8431373, 1, 0, 1,
-0.8404909, -1.334742, -2.965551, 0.8352941, 1, 0, 1,
-0.8395484, 2.093494, -0.743783, 0.8313726, 1, 0, 1,
-0.8386189, 0.4413292, -0.7365082, 0.8235294, 1, 0, 1,
-0.8315945, -1.596154, -4.153772, 0.8196079, 1, 0, 1,
-0.8259435, -0.7604749, -0.9671986, 0.8117647, 1, 0, 1,
-0.8185992, 0.8561523, -1.763298, 0.8078431, 1, 0, 1,
-0.8175301, -0.4030623, -0.4288062, 0.8, 1, 0, 1,
-0.8168979, -0.696891, -1.096123, 0.7921569, 1, 0, 1,
-0.8127679, 0.3524027, -0.6902615, 0.7882353, 1, 0, 1,
-0.80839, 0.7084944, 0.3707189, 0.7803922, 1, 0, 1,
-0.8070629, 1.368443, -2.347211, 0.7764706, 1, 0, 1,
-0.8052907, -0.1647851, -0.4932208, 0.7686275, 1, 0, 1,
-0.7935706, -0.05013764, -1.49423, 0.7647059, 1, 0, 1,
-0.7900147, -0.007200306, -0.6300551, 0.7568628, 1, 0, 1,
-0.7834901, 1.329838, -2.489629, 0.7529412, 1, 0, 1,
-0.7792985, -0.8562902, -3.382385, 0.7450981, 1, 0, 1,
-0.7768264, -0.5785368, -2.979436, 0.7411765, 1, 0, 1,
-0.7723625, -1.800195, -2.08632, 0.7333333, 1, 0, 1,
-0.7702316, 1.67964, -0.6507508, 0.7294118, 1, 0, 1,
-0.7683516, 0.6500603, 0.8738186, 0.7215686, 1, 0, 1,
-0.7654305, -0.280668, -3.550864, 0.7176471, 1, 0, 1,
-0.7638749, 1.933062, 0.5806262, 0.7098039, 1, 0, 1,
-0.761059, -0.4066766, -2.035261, 0.7058824, 1, 0, 1,
-0.7609743, 0.06951816, 0.06849523, 0.6980392, 1, 0, 1,
-0.7587809, -0.08037792, -2.049915, 0.6901961, 1, 0, 1,
-0.7555766, 0.4866159, -0.03796399, 0.6862745, 1, 0, 1,
-0.7547118, 2.11669, -2.196766, 0.6784314, 1, 0, 1,
-0.7536747, -0.6254103, -1.692169, 0.6745098, 1, 0, 1,
-0.7525626, -0.3416394, -2.614432, 0.6666667, 1, 0, 1,
-0.7509262, 0.99438, 0.9105556, 0.6627451, 1, 0, 1,
-0.7502019, 0.1391177, -1.032794, 0.654902, 1, 0, 1,
-0.7480554, -1.639755, -2.644506, 0.6509804, 1, 0, 1,
-0.7470234, 0.1537214, -1.546455, 0.6431373, 1, 0, 1,
-0.7452462, 0.3818851, -0.473657, 0.6392157, 1, 0, 1,
-0.7440912, -1.337473, -3.773085, 0.6313726, 1, 0, 1,
-0.742581, -0.528474, -1.982353, 0.627451, 1, 0, 1,
-0.7397457, 0.01901081, -2.826774, 0.6196079, 1, 0, 1,
-0.7355292, -0.6656064, -2.358666, 0.6156863, 1, 0, 1,
-0.7352078, 0.4523259, -0.3855222, 0.6078432, 1, 0, 1,
-0.7330338, -0.2951189, -1.810429, 0.6039216, 1, 0, 1,
-0.7301517, 0.01329405, -2.43461, 0.5960785, 1, 0, 1,
-0.7297748, 0.6617082, -1.553003, 0.5882353, 1, 0, 1,
-0.7268501, -1.382658, -3.882547, 0.5843138, 1, 0, 1,
-0.7229591, -2.006578, -3.657987, 0.5764706, 1, 0, 1,
-0.7202252, 1.184965, 0.7563699, 0.572549, 1, 0, 1,
-0.7178699, 1.289746, -1.181891, 0.5647059, 1, 0, 1,
-0.7152176, -1.378449, -3.628822, 0.5607843, 1, 0, 1,
-0.7120091, 0.6719584, -0.6893347, 0.5529412, 1, 0, 1,
-0.7104932, -1.515503, -3.704432, 0.5490196, 1, 0, 1,
-0.7104407, -3.012598, -3.87286, 0.5411765, 1, 0, 1,
-0.7080328, 2.05976, -1.010528, 0.5372549, 1, 0, 1,
-0.7024767, 0.6969729, -2.07704, 0.5294118, 1, 0, 1,
-0.7000899, -0.03402034, -1.347907, 0.5254902, 1, 0, 1,
-0.6991454, -0.5366958, -1.312567, 0.5176471, 1, 0, 1,
-0.6980414, -0.6044058, -2.595832, 0.5137255, 1, 0, 1,
-0.6966668, -1.763348, -1.255282, 0.5058824, 1, 0, 1,
-0.6960822, -0.6608379, -2.155619, 0.5019608, 1, 0, 1,
-0.6937342, -0.2818945, -1.604496, 0.4941176, 1, 0, 1,
-0.6933348, -0.1472329, -2.911112, 0.4862745, 1, 0, 1,
-0.6905045, -0.7773119, -0.4003167, 0.4823529, 1, 0, 1,
-0.690321, 0.4009633, -0.5212455, 0.4745098, 1, 0, 1,
-0.6886462, -0.04020802, -1.821261, 0.4705882, 1, 0, 1,
-0.6848326, -1.550247, -3.414923, 0.4627451, 1, 0, 1,
-0.6835681, 0.4351641, -1.011397, 0.4588235, 1, 0, 1,
-0.6815695, 0.07965898, -0.6724268, 0.4509804, 1, 0, 1,
-0.6797757, 2.539722, -0.9386023, 0.4470588, 1, 0, 1,
-0.678807, -0.4089965, -1.835051, 0.4392157, 1, 0, 1,
-0.6741835, -0.9522679, -2.433702, 0.4352941, 1, 0, 1,
-0.6711054, 1.828729, 0.5621748, 0.427451, 1, 0, 1,
-0.6705298, -1.965468, -3.595982, 0.4235294, 1, 0, 1,
-0.6630875, 0.7506885, -0.7494549, 0.4156863, 1, 0, 1,
-0.6615477, -0.7135707, -0.9472449, 0.4117647, 1, 0, 1,
-0.6551849, 0.5413128, -1.564642, 0.4039216, 1, 0, 1,
-0.6528232, 0.4802768, -0.996321, 0.3960784, 1, 0, 1,
-0.6520323, -1.837104, -2.669922, 0.3921569, 1, 0, 1,
-0.6496547, 1.705609, -0.06925825, 0.3843137, 1, 0, 1,
-0.648384, -1.081592, -1.526861, 0.3803922, 1, 0, 1,
-0.6453904, 0.01125145, -0.82967, 0.372549, 1, 0, 1,
-0.6433033, -0.4442574, -1.765971, 0.3686275, 1, 0, 1,
-0.6398696, 0.005938068, -0.7931428, 0.3607843, 1, 0, 1,
-0.6392636, 2.385473, 1.180561, 0.3568628, 1, 0, 1,
-0.63181, 1.128286, -1.918275, 0.3490196, 1, 0, 1,
-0.6305432, -0.3997482, -2.2616, 0.345098, 1, 0, 1,
-0.6198771, -0.6615539, -4.405474, 0.3372549, 1, 0, 1,
-0.6139768, -0.8733808, -1.344179, 0.3333333, 1, 0, 1,
-0.6138454, -0.1331706, 1.093353, 0.3254902, 1, 0, 1,
-0.6126641, -0.192103, -0.64062, 0.3215686, 1, 0, 1,
-0.6115486, -0.009042801, -1.004921, 0.3137255, 1, 0, 1,
-0.6093879, 0.06626716, 0.4766563, 0.3098039, 1, 0, 1,
-0.6092937, 1.350507, -0.5194915, 0.3019608, 1, 0, 1,
-0.6042116, 2.758033, 1.118996, 0.2941177, 1, 0, 1,
-0.6000059, -2.757062, -3.623071, 0.2901961, 1, 0, 1,
-0.5899615, -0.149348, 0.04287668, 0.282353, 1, 0, 1,
-0.5881936, 1.633173, -1.397952, 0.2784314, 1, 0, 1,
-0.5862396, -2.591604, -2.947059, 0.2705882, 1, 0, 1,
-0.5806459, 1.465681, -0.8367131, 0.2666667, 1, 0, 1,
-0.5796171, 0.2423833, -0.6032627, 0.2588235, 1, 0, 1,
-0.5772731, -0.5577029, -2.712257, 0.254902, 1, 0, 1,
-0.5769346, 0.5723987, 0.7902555, 0.2470588, 1, 0, 1,
-0.5760499, -1.120691, -4.22827, 0.2431373, 1, 0, 1,
-0.5728288, -2.53274, -2.355012, 0.2352941, 1, 0, 1,
-0.5722559, -0.172968, -2.360984, 0.2313726, 1, 0, 1,
-0.5669321, -0.6043176, -2.814037, 0.2235294, 1, 0, 1,
-0.559973, -0.8214315, -2.478498, 0.2196078, 1, 0, 1,
-0.5575432, 0.2456678, -1.191312, 0.2117647, 1, 0, 1,
-0.5557739, 0.5411277, -0.9294558, 0.2078431, 1, 0, 1,
-0.5556328, -0.834956, -2.927878, 0.2, 1, 0, 1,
-0.5528002, 0.1974052, -1.130446, 0.1921569, 1, 0, 1,
-0.5494363, -0.7178239, -1.163135, 0.1882353, 1, 0, 1,
-0.534534, 0.07843781, -1.462613, 0.1803922, 1, 0, 1,
-0.530396, 0.4471395, -1.139946, 0.1764706, 1, 0, 1,
-0.5213752, -1.456005, -2.829074, 0.1686275, 1, 0, 1,
-0.5177949, -0.6899925, -1.865645, 0.1647059, 1, 0, 1,
-0.5155123, 0.8275087, -0.9556413, 0.1568628, 1, 0, 1,
-0.5134107, 0.8227469, -0.7217983, 0.1529412, 1, 0, 1,
-0.5112077, 0.3656789, -2.469971, 0.145098, 1, 0, 1,
-0.509806, -0.2244564, -3.059978, 0.1411765, 1, 0, 1,
-0.5089945, -0.2751885, -0.8596019, 0.1333333, 1, 0, 1,
-0.5060271, -0.2466312, -1.753908, 0.1294118, 1, 0, 1,
-0.4995171, -0.5169631, -2.334932, 0.1215686, 1, 0, 1,
-0.4986344, -1.775444, -1.622434, 0.1176471, 1, 0, 1,
-0.496674, -0.08977669, -1.650753, 0.1098039, 1, 0, 1,
-0.4950606, -0.8750124, -3.640043, 0.1058824, 1, 0, 1,
-0.4950503, 0.943371, -2.245045, 0.09803922, 1, 0, 1,
-0.4944596, 0.8922939, 1.966666, 0.09019608, 1, 0, 1,
-0.4884817, 0.5862815, 0.9838425, 0.08627451, 1, 0, 1,
-0.4857697, 0.1621841, -0.7658831, 0.07843138, 1, 0, 1,
-0.4820516, -0.967177, -2.708172, 0.07450981, 1, 0, 1,
-0.480685, 0.3689588, -1.031991, 0.06666667, 1, 0, 1,
-0.4739847, -0.5458352, -1.448764, 0.0627451, 1, 0, 1,
-0.4725176, -0.9526591, -4.402566, 0.05490196, 1, 0, 1,
-0.4664964, -1.219544, -2.02597, 0.05098039, 1, 0, 1,
-0.4646516, 0.8972285, -0.6053972, 0.04313726, 1, 0, 1,
-0.4642859, 0.3590212, -1.816618, 0.03921569, 1, 0, 1,
-0.4623107, -1.205972, -3.629465, 0.03137255, 1, 0, 1,
-0.461634, -0.5015403, -2.600469, 0.02745098, 1, 0, 1,
-0.460107, 0.4596007, -0.7855088, 0.01960784, 1, 0, 1,
-0.4549986, 0.8834369, -0.9751462, 0.01568628, 1, 0, 1,
-0.4549018, 0.06008901, -1.72013, 0.007843138, 1, 0, 1,
-0.4509378, 0.2861548, -1.601885, 0.003921569, 1, 0, 1,
-0.4470873, -1.68017, -1.377819, 0, 1, 0.003921569, 1,
-0.443889, 1.990278, -0.858214, 0, 1, 0.01176471, 1,
-0.4434104, -1.68649, -2.245314, 0, 1, 0.01568628, 1,
-0.4417428, 1.074993, -1.880614, 0, 1, 0.02352941, 1,
-0.434048, -1.715837, -2.448086, 0, 1, 0.02745098, 1,
-0.4335735, -1.078773, -1.111357, 0, 1, 0.03529412, 1,
-0.4332052, -1.642326, -1.429311, 0, 1, 0.03921569, 1,
-0.4294866, 1.222846, -1.101525, 0, 1, 0.04705882, 1,
-0.4285928, 0.5422108, -0.2858309, 0, 1, 0.05098039, 1,
-0.4276438, -0.3594157, -0.3237496, 0, 1, 0.05882353, 1,
-0.4246688, 0.941918, -1.338165, 0, 1, 0.0627451, 1,
-0.4233025, -0.06031141, -1.972449, 0, 1, 0.07058824, 1,
-0.4211331, -2.870888, -3.525917, 0, 1, 0.07450981, 1,
-0.4189143, 0.7505887, 0.2002165, 0, 1, 0.08235294, 1,
-0.4180698, 0.2283898, -1.834226, 0, 1, 0.08627451, 1,
-0.4174373, 0.9495381, -0.5466997, 0, 1, 0.09411765, 1,
-0.4164501, 0.6323674, -0.03616967, 0, 1, 0.1019608, 1,
-0.4162154, 0.3917214, -1.952632, 0, 1, 0.1058824, 1,
-0.4103957, -0.7819858, -2.878658, 0, 1, 0.1137255, 1,
-0.4099815, 0.7082217, 0.4849082, 0, 1, 0.1176471, 1,
-0.4094559, -0.9003285, -2.908367, 0, 1, 0.1254902, 1,
-0.4093749, -0.204115, -3.016179, 0, 1, 0.1294118, 1,
-0.4091122, 1.538542, -1.151553, 0, 1, 0.1372549, 1,
-0.4082806, 1.063813, -0.5817237, 0, 1, 0.1411765, 1,
-0.4054401, 0.2459441, -2.469713, 0, 1, 0.1490196, 1,
-0.4021727, 1.072043, -1.594121, 0, 1, 0.1529412, 1,
-0.4019786, 0.4298038, -0.4566969, 0, 1, 0.1607843, 1,
-0.4015961, -1.286876, -3.484248, 0, 1, 0.1647059, 1,
-0.3992901, 0.05963009, -1.786008, 0, 1, 0.172549, 1,
-0.3945293, -0.06356403, -1.660677, 0, 1, 0.1764706, 1,
-0.391352, -0.5348455, -2.135149, 0, 1, 0.1843137, 1,
-0.3891035, -1.182298, -2.019186, 0, 1, 0.1882353, 1,
-0.3855541, -0.5955114, -2.089742, 0, 1, 0.1960784, 1,
-0.3776684, -0.6227133, -3.399055, 0, 1, 0.2039216, 1,
-0.3741129, -0.3261719, -3.01903, 0, 1, 0.2078431, 1,
-0.3698155, 1.572692, -2.348997, 0, 1, 0.2156863, 1,
-0.3665777, -1.114313, -3.460717, 0, 1, 0.2196078, 1,
-0.3638699, 0.1956341, -1.17758, 0, 1, 0.227451, 1,
-0.3631128, 0.262751, -0.6583942, 0, 1, 0.2313726, 1,
-0.3622141, -1.332017, -2.989558, 0, 1, 0.2392157, 1,
-0.3621401, 0.2512231, -0.01580241, 0, 1, 0.2431373, 1,
-0.3612042, 0.2696593, -1.883881, 0, 1, 0.2509804, 1,
-0.3598427, -0.1352084, -1.917249, 0, 1, 0.254902, 1,
-0.3560823, -0.6722966, -1.480097, 0, 1, 0.2627451, 1,
-0.3493176, -0.10779, -1.193953, 0, 1, 0.2666667, 1,
-0.3446127, 1.379478, -0.246942, 0, 1, 0.2745098, 1,
-0.3414765, 1.910577, -0.4412094, 0, 1, 0.2784314, 1,
-0.3376196, -0.005253578, -0.970409, 0, 1, 0.2862745, 1,
-0.3373988, -1.123017, -2.338449, 0, 1, 0.2901961, 1,
-0.3340073, -0.7685021, -2.637893, 0, 1, 0.2980392, 1,
-0.329618, -1.699739, -2.217107, 0, 1, 0.3058824, 1,
-0.3293964, -1.028154, -1.969736, 0, 1, 0.3098039, 1,
-0.3288566, -0.0264696, -0.249715, 0, 1, 0.3176471, 1,
-0.3283812, 0.5748781, -0.1455927, 0, 1, 0.3215686, 1,
-0.3245681, -0.629261, -3.506233, 0, 1, 0.3294118, 1,
-0.319895, 0.2790956, -1.174142, 0, 1, 0.3333333, 1,
-0.3128439, 0.3017149, -2.860037, 0, 1, 0.3411765, 1,
-0.3113633, -0.6226887, -3.340682, 0, 1, 0.345098, 1,
-0.3086486, -0.8824884, -3.289201, 0, 1, 0.3529412, 1,
-0.3080031, -2.367923, -2.60374, 0, 1, 0.3568628, 1,
-0.2992305, -0.1500186, -1.147976, 0, 1, 0.3647059, 1,
-0.2969048, -0.0177423, -1.404139, 0, 1, 0.3686275, 1,
-0.295482, -0.351153, -3.455126, 0, 1, 0.3764706, 1,
-0.2952295, 0.03259412, -1.198825, 0, 1, 0.3803922, 1,
-0.293612, 0.3810198, -0.9072521, 0, 1, 0.3882353, 1,
-0.2919028, 1.221477, 1.507899, 0, 1, 0.3921569, 1,
-0.2914225, 2.043485, 0.5843318, 0, 1, 0.4, 1,
-0.2905481, 0.9156981, -2.363507, 0, 1, 0.4078431, 1,
-0.2882756, 0.4637789, -0.9670174, 0, 1, 0.4117647, 1,
-0.2874882, -2.325306, -4.581376, 0, 1, 0.4196078, 1,
-0.2873459, -2.128858, -3.09873, 0, 1, 0.4235294, 1,
-0.2869254, 0.1957594, -2.119796, 0, 1, 0.4313726, 1,
-0.278451, 0.7766051, -1.746091, 0, 1, 0.4352941, 1,
-0.27711, -0.09181657, -2.77595, 0, 1, 0.4431373, 1,
-0.2763059, 1.074265, 0.3326294, 0, 1, 0.4470588, 1,
-0.27223, -1.364962, -1.83329, 0, 1, 0.454902, 1,
-0.2709573, -0.2602722, -1.296981, 0, 1, 0.4588235, 1,
-0.2702855, -0.3675058, -2.038978, 0, 1, 0.4666667, 1,
-0.2677226, -0.6427955, -1.843959, 0, 1, 0.4705882, 1,
-0.2668114, 0.8716791, -0.4709589, 0, 1, 0.4784314, 1,
-0.2601837, 0.5257387, 0.2560868, 0, 1, 0.4823529, 1,
-0.2584699, 0.05207612, 0.4231433, 0, 1, 0.4901961, 1,
-0.2571998, -0.2095224, -2.36966, 0, 1, 0.4941176, 1,
-0.2560481, -2.087456, -3.131125, 0, 1, 0.5019608, 1,
-0.2496903, 0.5104452, -1.781243, 0, 1, 0.509804, 1,
-0.248281, 0.4971391, -1.076295, 0, 1, 0.5137255, 1,
-0.2440982, -0.3001746, -1.84252, 0, 1, 0.5215687, 1,
-0.2407545, 0.4862902, -0.9425362, 0, 1, 0.5254902, 1,
-0.238063, 0.24001, -2.248062, 0, 1, 0.5333334, 1,
-0.2301817, -1.073565, -2.310647, 0, 1, 0.5372549, 1,
-0.2278616, -1.482768, -2.468384, 0, 1, 0.5450981, 1,
-0.22378, -0.5592276, -2.17771, 0, 1, 0.5490196, 1,
-0.223482, -0.8946208, -4.772069, 0, 1, 0.5568628, 1,
-0.2223933, 0.3909002, 0.1872609, 0, 1, 0.5607843, 1,
-0.2199952, 3.33865, 1.041235, 0, 1, 0.5686275, 1,
-0.2158995, 0.8641984, 0.9002413, 0, 1, 0.572549, 1,
-0.2100525, -0.6695282, -3.158472, 0, 1, 0.5803922, 1,
-0.207548, 2.068166, 0.2560099, 0, 1, 0.5843138, 1,
-0.2004504, -0.124369, -3.464634, 0, 1, 0.5921569, 1,
-0.194925, -0.09131293, -2.89493, 0, 1, 0.5960785, 1,
-0.1859207, 1.041108, -2.274179, 0, 1, 0.6039216, 1,
-0.183014, -1.364359, -2.856039, 0, 1, 0.6117647, 1,
-0.1822495, -0.6308384, -3.494402, 0, 1, 0.6156863, 1,
-0.1815318, 0.1962848, 0.510039, 0, 1, 0.6235294, 1,
-0.1788181, -0.5998253, -2.683097, 0, 1, 0.627451, 1,
-0.1734717, 0.737348, 1.710262, 0, 1, 0.6352941, 1,
-0.1726554, -0.316795, -2.76893, 0, 1, 0.6392157, 1,
-0.1715103, -0.9323694, -2.101269, 0, 1, 0.6470588, 1,
-0.1668935, -0.5743672, -1.969469, 0, 1, 0.6509804, 1,
-0.1605078, 0.2061198, 0.03895252, 0, 1, 0.6588235, 1,
-0.1592811, -1.906912, -3.328938, 0, 1, 0.6627451, 1,
-0.1579898, 1.188166, -0.1677915, 0, 1, 0.6705883, 1,
-0.1561988, 0.2924295, -1.550555, 0, 1, 0.6745098, 1,
-0.1561895, 1.448573, 0.8048469, 0, 1, 0.682353, 1,
-0.1557545, 1.162211, 0.8988219, 0, 1, 0.6862745, 1,
-0.1527169, -0.8384646, -2.963824, 0, 1, 0.6941177, 1,
-0.1499589, 0.5879819, -2.298049, 0, 1, 0.7019608, 1,
-0.1492394, 0.3959258, -2.771949, 0, 1, 0.7058824, 1,
-0.1457126, -0.1651236, -3.073533, 0, 1, 0.7137255, 1,
-0.1452269, -0.246452, -3.207712, 0, 1, 0.7176471, 1,
-0.1427172, -1.212449, -1.113798, 0, 1, 0.7254902, 1,
-0.1425505, -0.8620712, -3.94906, 0, 1, 0.7294118, 1,
-0.138969, 1.223562, 0.01958131, 0, 1, 0.7372549, 1,
-0.1364946, -1.243308, -3.444617, 0, 1, 0.7411765, 1,
-0.1313529, 1.033085, 0.5788403, 0, 1, 0.7490196, 1,
-0.1291656, -1.170605, -5.229001, 0, 1, 0.7529412, 1,
-0.1274415, -0.2840783, -3.361028, 0, 1, 0.7607843, 1,
-0.1227435, -0.1294675, -0.673122, 0, 1, 0.7647059, 1,
-0.1214224, -0.08236013, -3.031196, 0, 1, 0.772549, 1,
-0.119935, -1.162732, -3.788794, 0, 1, 0.7764706, 1,
-0.1123622, 0.3237059, -0.1118133, 0, 1, 0.7843137, 1,
-0.108261, 0.5848267, 1.064359, 0, 1, 0.7882353, 1,
-0.1082159, 0.1619547, 0.4881992, 0, 1, 0.7960784, 1,
-0.1056238, 0.4290037, 0.504683, 0, 1, 0.8039216, 1,
-0.09360543, -1.073115, -2.882699, 0, 1, 0.8078431, 1,
-0.08817746, -0.2994715, -2.348819, 0, 1, 0.8156863, 1,
-0.08706337, -0.7370414, -3.309242, 0, 1, 0.8196079, 1,
-0.0868895, 0.1374902, 1.842491, 0, 1, 0.827451, 1,
-0.08023527, -1.731258, -3.41871, 0, 1, 0.8313726, 1,
-0.07752433, 1.595063, -0.3204124, 0, 1, 0.8392157, 1,
-0.073276, 0.5616673, 1.195893, 0, 1, 0.8431373, 1,
-0.07032314, -0.01590013, -1.485437, 0, 1, 0.8509804, 1,
-0.06916071, 0.1416295, -0.8704157, 0, 1, 0.854902, 1,
-0.06726781, -0.05014644, -1.554756, 0, 1, 0.8627451, 1,
-0.06602606, -1.340088, -2.141311, 0, 1, 0.8666667, 1,
-0.06543427, -0.48318, -1.767468, 0, 1, 0.8745098, 1,
-0.06485608, -1.079604, -3.852844, 0, 1, 0.8784314, 1,
-0.0602665, 0.08166604, -0.09650058, 0, 1, 0.8862745, 1,
-0.0556156, -1.180586, -3.481833, 0, 1, 0.8901961, 1,
-0.05517676, -0.1581985, -2.806281, 0, 1, 0.8980392, 1,
-0.04881073, 1.56862, 0.6734028, 0, 1, 0.9058824, 1,
-0.04617063, -0.7532506, -3.1727, 0, 1, 0.9098039, 1,
-0.04399277, -0.4824515, -4.715988, 0, 1, 0.9176471, 1,
-0.04294827, 1.285735, 2.81505, 0, 1, 0.9215686, 1,
-0.0406105, -0.6244714, -3.925536, 0, 1, 0.9294118, 1,
-0.03818928, -0.6538507, -2.291193, 0, 1, 0.9333333, 1,
-0.03490621, -0.6345925, -0.6410998, 0, 1, 0.9411765, 1,
-0.034553, 0.5232536, -0.1755223, 0, 1, 0.945098, 1,
-0.03222325, -0.1915007, -4.199273, 0, 1, 0.9529412, 1,
-0.03002633, -0.7581196, -3.868298, 0, 1, 0.9568627, 1,
-0.02427798, 0.5868819, 2.380266, 0, 1, 0.9647059, 1,
-0.0227349, -1.465424, -3.24876, 0, 1, 0.9686275, 1,
-0.02017775, 0.1797958, -0.08386783, 0, 1, 0.9764706, 1,
-0.01423923, 0.007355052, -1.889384, 0, 1, 0.9803922, 1,
-0.01214024, -1.379342, -2.012853, 0, 1, 0.9882353, 1,
-0.01200444, 0.2985298, 1.512016, 0, 1, 0.9921569, 1,
-0.00804195, 1.557268, -1.211349, 0, 1, 1, 1,
-0.004859732, -2.033335, -3.929813, 0, 0.9921569, 1, 1,
-0.0006557259, 0.4057777, 0.9365717, 0, 0.9882353, 1, 1,
0.0004247263, -0.6244258, 2.076517, 0, 0.9803922, 1, 1,
0.0009231822, -1.686289, 3.582828, 0, 0.9764706, 1, 1,
0.005092669, -0.01589951, 4.272218, 0, 0.9686275, 1, 1,
0.006948029, -1.782897, 3.975705, 0, 0.9647059, 1, 1,
0.007137363, -1.458005, 2.053175, 0, 0.9568627, 1, 1,
0.009022781, -0.6342285, 3.838118, 0, 0.9529412, 1, 1,
0.009872814, -0.1097012, 2.845414, 0, 0.945098, 1, 1,
0.01267667, -0.7093494, 4.140455, 0, 0.9411765, 1, 1,
0.0163748, -0.3163899, 2.488147, 0, 0.9333333, 1, 1,
0.0198591, 0.9228644, 0.9190443, 0, 0.9294118, 1, 1,
0.02677274, 0.4181149, -0.2907136, 0, 0.9215686, 1, 1,
0.03128147, -0.8895715, 3.653276, 0, 0.9176471, 1, 1,
0.03786947, -0.9377249, 3.340161, 0, 0.9098039, 1, 1,
0.04052363, -0.1846738, 3.56369, 0, 0.9058824, 1, 1,
0.04210209, -0.1590764, 1.560433, 0, 0.8980392, 1, 1,
0.04257469, -1.062296, 4.097562, 0, 0.8901961, 1, 1,
0.0460263, 1.77317, -0.5308561, 0, 0.8862745, 1, 1,
0.04883195, 0.07154241, -1.585531, 0, 0.8784314, 1, 1,
0.04919836, 1.004742, 0.9325029, 0, 0.8745098, 1, 1,
0.04956329, 0.2990824, 2.153124, 0, 0.8666667, 1, 1,
0.05066612, -0.802816, 3.030084, 0, 0.8627451, 1, 1,
0.05138818, 0.158414, -0.3838626, 0, 0.854902, 1, 1,
0.05400977, -0.5673075, 3.655178, 0, 0.8509804, 1, 1,
0.05524971, 0.9388006, -0.2150732, 0, 0.8431373, 1, 1,
0.05857474, 0.8655223, -0.3053903, 0, 0.8392157, 1, 1,
0.05945287, -0.4303933, 2.822128, 0, 0.8313726, 1, 1,
0.05949014, -1.226818, 2.517843, 0, 0.827451, 1, 1,
0.06020065, -0.05381298, 2.143726, 0, 0.8196079, 1, 1,
0.06301172, -1.956422, 3.776559, 0, 0.8156863, 1, 1,
0.06662986, 0.1497522, 0.4273633, 0, 0.8078431, 1, 1,
0.06743309, 0.6038575, -0.3076669, 0, 0.8039216, 1, 1,
0.06827655, 1.17042, 0.3431479, 0, 0.7960784, 1, 1,
0.06870551, -0.4268117, 3.785209, 0, 0.7882353, 1, 1,
0.0756013, -0.9360747, 3.103307, 0, 0.7843137, 1, 1,
0.09109432, -0.400836, 2.029051, 0, 0.7764706, 1, 1,
0.0963703, -1.28651, 4.513223, 0, 0.772549, 1, 1,
0.09658062, -1.713856, 3.547202, 0, 0.7647059, 1, 1,
0.100495, -0.3810853, 2.533706, 0, 0.7607843, 1, 1,
0.1027033, 0.2567362, 0.5325201, 0, 0.7529412, 1, 1,
0.1042024, -0.5381897, 3.86346, 0, 0.7490196, 1, 1,
0.105001, -0.4531283, 1.509125, 0, 0.7411765, 1, 1,
0.1064322, -0.8748062, 2.978247, 0, 0.7372549, 1, 1,
0.1121489, -0.05118676, 2.387317, 0, 0.7294118, 1, 1,
0.1213709, -0.3474278, 1.055346, 0, 0.7254902, 1, 1,
0.1245539, 1.892193, -0.1706204, 0, 0.7176471, 1, 1,
0.1264189, -2.023317, 3.158866, 0, 0.7137255, 1, 1,
0.1280661, 1.341378, 0.4558295, 0, 0.7058824, 1, 1,
0.1286134, 0.9791116, -0.2361298, 0, 0.6980392, 1, 1,
0.1287576, -0.03062008, 2.599802, 0, 0.6941177, 1, 1,
0.1305206, -0.3426576, 1.549133, 0, 0.6862745, 1, 1,
0.1307198, 2.351287, -0.9122352, 0, 0.682353, 1, 1,
0.1345093, 0.7664018, 1.189143, 0, 0.6745098, 1, 1,
0.1359081, -0.01739224, -0.2766785, 0, 0.6705883, 1, 1,
0.1391834, 2.289523, 1.33748, 0, 0.6627451, 1, 1,
0.1395167, -0.07937646, 2.754918, 0, 0.6588235, 1, 1,
0.1397073, 0.7145928, 0.3031323, 0, 0.6509804, 1, 1,
0.1402871, 0.1606659, 1.193325, 0, 0.6470588, 1, 1,
0.1431848, -1.617804, 1.831639, 0, 0.6392157, 1, 1,
0.1432595, 0.5991189, -0.1973784, 0, 0.6352941, 1, 1,
0.1465272, 0.007886639, 2.970789, 0, 0.627451, 1, 1,
0.1470199, -0.4354002, 2.448078, 0, 0.6235294, 1, 1,
0.151753, -0.6027032, 1.872596, 0, 0.6156863, 1, 1,
0.1520189, 0.5400918, 1.053149, 0, 0.6117647, 1, 1,
0.1531063, 1.245543, -0.8963303, 0, 0.6039216, 1, 1,
0.1575486, 1.798192, 0.2736456, 0, 0.5960785, 1, 1,
0.1652818, -0.4961897, 4.512595, 0, 0.5921569, 1, 1,
0.1676824, -0.6052867, 4.360336, 0, 0.5843138, 1, 1,
0.1679657, -1.095452, 4.195204, 0, 0.5803922, 1, 1,
0.1690668, -1.294164, 1.146462, 0, 0.572549, 1, 1,
0.1716677, 0.7181337, 2.704075, 0, 0.5686275, 1, 1,
0.1729655, -0.372012, 3.865806, 0, 0.5607843, 1, 1,
0.1754911, 0.8874265, 1.510508, 0, 0.5568628, 1, 1,
0.1810426, 0.6505717, 0.6251553, 0, 0.5490196, 1, 1,
0.1810636, 0.3628674, 0.420802, 0, 0.5450981, 1, 1,
0.181867, 1.849582e-05, 2.547885, 0, 0.5372549, 1, 1,
0.1867642, 2.539093, -1.305641, 0, 0.5333334, 1, 1,
0.1919047, -0.07333831, 2.229732, 0, 0.5254902, 1, 1,
0.1921133, -0.2091193, 1.813428, 0, 0.5215687, 1, 1,
0.1979752, 1.569004, 0.7308425, 0, 0.5137255, 1, 1,
0.2014942, -0.8845205, 3.028616, 0, 0.509804, 1, 1,
0.2020899, 0.3735596, 0.6718746, 0, 0.5019608, 1, 1,
0.2059201, 0.9448053, 0.5302728, 0, 0.4941176, 1, 1,
0.2065589, 1.375124, 0.2019879, 0, 0.4901961, 1, 1,
0.2078859, 0.004610493, 0.6154692, 0, 0.4823529, 1, 1,
0.2095912, -1.854983, 3.794698, 0, 0.4784314, 1, 1,
0.2098363, 0.01359473, 2.126877, 0, 0.4705882, 1, 1,
0.2127325, -0.1119304, 2.898348, 0, 0.4666667, 1, 1,
0.2164492, -1.314999, 4.093806, 0, 0.4588235, 1, 1,
0.2172623, 0.7494236, -0.08662026, 0, 0.454902, 1, 1,
0.2242523, -0.3027787, 2.071558, 0, 0.4470588, 1, 1,
0.2248297, -0.04875112, 0.1389243, 0, 0.4431373, 1, 1,
0.2279632, 1.313135, -0.7074367, 0, 0.4352941, 1, 1,
0.230143, -0.5635182, 4.802484, 0, 0.4313726, 1, 1,
0.2311877, 0.3550346, -1.542593, 0, 0.4235294, 1, 1,
0.2318531, -0.7833322, 4.069734, 0, 0.4196078, 1, 1,
0.2337747, -1.337515, 2.183046, 0, 0.4117647, 1, 1,
0.2351449, -1.437177, 2.765103, 0, 0.4078431, 1, 1,
0.235186, 1.145505, -0.2861328, 0, 0.4, 1, 1,
0.2364752, 1.177409, 0.2223677, 0, 0.3921569, 1, 1,
0.2373458, 0.3293299, 3.051339, 0, 0.3882353, 1, 1,
0.2389281, -0.1005694, 4.211676, 0, 0.3803922, 1, 1,
0.2409175, -0.4594318, 2.084543, 0, 0.3764706, 1, 1,
0.2429385, 1.199203, -0.6762025, 0, 0.3686275, 1, 1,
0.2466745, 1.469208, 0.04227374, 0, 0.3647059, 1, 1,
0.259013, -1.105157, 2.633703, 0, 0.3568628, 1, 1,
0.2600971, 1.692779, 0.6349109, 0, 0.3529412, 1, 1,
0.2612323, -1.24266, 2.810144, 0, 0.345098, 1, 1,
0.2684743, -0.3446338, 3.238961, 0, 0.3411765, 1, 1,
0.2694761, 1.167982, 0.02965693, 0, 0.3333333, 1, 1,
0.2746153, -1.6081, 1.063072, 0, 0.3294118, 1, 1,
0.2764685, -1.089467, 3.526013, 0, 0.3215686, 1, 1,
0.2792006, 0.5457581, 1.693175, 0, 0.3176471, 1, 1,
0.2803981, -1.055622, 2.405184, 0, 0.3098039, 1, 1,
0.2830506, 0.2203321, 1.812159, 0, 0.3058824, 1, 1,
0.2869046, 0.3983982, 0.8945094, 0, 0.2980392, 1, 1,
0.2910628, 1.577496, -1.787104, 0, 0.2901961, 1, 1,
0.2944224, 0.3169393, 0.03785097, 0, 0.2862745, 1, 1,
0.2957475, -0.2996868, 2.193495, 0, 0.2784314, 1, 1,
0.3002026, -1.094874, 2.297113, 0, 0.2745098, 1, 1,
0.3132882, -1.080762, 2.990716, 0, 0.2666667, 1, 1,
0.3154755, 0.9765926, 0.7201772, 0, 0.2627451, 1, 1,
0.3183303, 0.07279358, 0.07488801, 0, 0.254902, 1, 1,
0.3192999, -1.188916, 3.135303, 0, 0.2509804, 1, 1,
0.3207103, -1.062953, 2.229024, 0, 0.2431373, 1, 1,
0.3215281, 0.5141933, -0.123324, 0, 0.2392157, 1, 1,
0.3247369, -0.143932, 3.166016, 0, 0.2313726, 1, 1,
0.3257578, 0.1186513, 2.549524, 0, 0.227451, 1, 1,
0.3273766, 0.4749053, 1.350708, 0, 0.2196078, 1, 1,
0.3274502, -0.4291401, 2.498749, 0, 0.2156863, 1, 1,
0.32957, 0.7848262, -0.04283424, 0, 0.2078431, 1, 1,
0.338166, -0.9975559, 3.745494, 0, 0.2039216, 1, 1,
0.3408886, 0.3609683, 0.685151, 0, 0.1960784, 1, 1,
0.3416961, 0.2786165, 1.802045, 0, 0.1882353, 1, 1,
0.3420352, 1.423627, 1.682048, 0, 0.1843137, 1, 1,
0.3433476, -0.7010293, 4.276727, 0, 0.1764706, 1, 1,
0.3445896, 0.09489957, 2.66695, 0, 0.172549, 1, 1,
0.3447307, 0.4261611, 0.8719637, 0, 0.1647059, 1, 1,
0.3478811, -1.550833, 2.342583, 0, 0.1607843, 1, 1,
0.3544846, -1.513191, 3.412228, 0, 0.1529412, 1, 1,
0.35482, 0.1513107, 1.310316, 0, 0.1490196, 1, 1,
0.3563747, 0.008068184, 2.315028, 0, 0.1411765, 1, 1,
0.3667247, 1.741363, 0.07867071, 0, 0.1372549, 1, 1,
0.3699549, 0.1122215, 0.7586108, 0, 0.1294118, 1, 1,
0.3722406, 1.348721, 1.003394, 0, 0.1254902, 1, 1,
0.3768463, 0.4513786, 1.132103, 0, 0.1176471, 1, 1,
0.3812733, 0.8059009, 0.4827291, 0, 0.1137255, 1, 1,
0.3853189, -0.04870464, 1.874252, 0, 0.1058824, 1, 1,
0.3882905, -0.6045998, 3.171499, 0, 0.09803922, 1, 1,
0.3913288, 0.09255672, 0.3266475, 0, 0.09411765, 1, 1,
0.3918708, -0.2671266, 1.900921, 0, 0.08627451, 1, 1,
0.3963454, 0.9315554, 0.8672923, 0, 0.08235294, 1, 1,
0.3984424, -2.097118, 2.140372, 0, 0.07450981, 1, 1,
0.4015057, -1.047777, 1.601023, 0, 0.07058824, 1, 1,
0.4069739, 1.252148, 0.1299557, 0, 0.0627451, 1, 1,
0.408519, -0.8772503, 4.61275, 0, 0.05882353, 1, 1,
0.4113401, -0.1924425, 3.042719, 0, 0.05098039, 1, 1,
0.4172955, -0.0753462, 1.783074, 0, 0.04705882, 1, 1,
0.4173001, -0.2071389, 1.363505, 0, 0.03921569, 1, 1,
0.419696, -0.3187125, 3.393956, 0, 0.03529412, 1, 1,
0.4215601, -0.4253131, 1.340251, 0, 0.02745098, 1, 1,
0.4238578, 0.7099725, 0.5728287, 0, 0.02352941, 1, 1,
0.4256141, 1.568461, 1.124217, 0, 0.01568628, 1, 1,
0.4262556, -1.892919, 2.917729, 0, 0.01176471, 1, 1,
0.4263746, -0.238475, 2.982645, 0, 0.003921569, 1, 1,
0.426816, -0.5060748, 1.93736, 0.003921569, 0, 1, 1,
0.4273245, -0.4121151, 3.190124, 0.007843138, 0, 1, 1,
0.4283544, 1.732121, 0.3323257, 0.01568628, 0, 1, 1,
0.4333837, 0.09165423, 0.9511209, 0.01960784, 0, 1, 1,
0.4350422, -2.550598, 2.697286, 0.02745098, 0, 1, 1,
0.4353531, 0.7528474, 1.911469, 0.03137255, 0, 1, 1,
0.436272, -0.1604707, -0.2211115, 0.03921569, 0, 1, 1,
0.451755, 0.8711376, 0.5978226, 0.04313726, 0, 1, 1,
0.455878, -0.2076455, 3.49388, 0.05098039, 0, 1, 1,
0.4568313, -1.06108, 2.211902, 0.05490196, 0, 1, 1,
0.4599444, 1.546751, 0.4936935, 0.0627451, 0, 1, 1,
0.4607053, 1.175364, -0.4517634, 0.06666667, 0, 1, 1,
0.4615999, -0.3413638, 2.407766, 0.07450981, 0, 1, 1,
0.4633913, -0.9297758, 2.957309, 0.07843138, 0, 1, 1,
0.475883, -0.8920655, 2.985878, 0.08627451, 0, 1, 1,
0.4788428, 0.03892434, 2.095104, 0.09019608, 0, 1, 1,
0.480989, 0.5088252, 1.535068, 0.09803922, 0, 1, 1,
0.4817099, -0.02914583, -0.05179453, 0.1058824, 0, 1, 1,
0.4820972, -2.842366, 2.834905, 0.1098039, 0, 1, 1,
0.4909724, -0.177926, -0.03942839, 0.1176471, 0, 1, 1,
0.4910139, 0.7323241, 0.6481553, 0.1215686, 0, 1, 1,
0.5003734, -1.140461, 3.298394, 0.1294118, 0, 1, 1,
0.5010403, -1.487199, 3.566221, 0.1333333, 0, 1, 1,
0.503521, -0.8820589, 3.896417, 0.1411765, 0, 1, 1,
0.5051017, -1.098535, 3.419402, 0.145098, 0, 1, 1,
0.5061969, -0.2054314, 3.775321, 0.1529412, 0, 1, 1,
0.5067019, 1.463334, 0.2267464, 0.1568628, 0, 1, 1,
0.5082531, 1.83372, 0.8508769, 0.1647059, 0, 1, 1,
0.5101689, 0.4760275, 0.9365824, 0.1686275, 0, 1, 1,
0.5143999, 0.6507294, 1.201487, 0.1764706, 0, 1, 1,
0.5160699, -0.9424273, 2.269107, 0.1803922, 0, 1, 1,
0.5184531, 0.8433338, 0.9651985, 0.1882353, 0, 1, 1,
0.5238352, 1.20016, -0.2111912, 0.1921569, 0, 1, 1,
0.5269623, 0.3040443, 0.4360322, 0.2, 0, 1, 1,
0.532914, -0.2301911, 2.322783, 0.2078431, 0, 1, 1,
0.5378797, -0.923554, 1.948502, 0.2117647, 0, 1, 1,
0.540205, 0.4387999, 0.05125496, 0.2196078, 0, 1, 1,
0.5411127, 0.1139941, 2.485307, 0.2235294, 0, 1, 1,
0.5414927, -1.676782, 2.114275, 0.2313726, 0, 1, 1,
0.5451604, -1.53161, 3.1624, 0.2352941, 0, 1, 1,
0.5468171, -0.2428198, 3.08674, 0.2431373, 0, 1, 1,
0.5500965, 0.6446266, 0.3795658, 0.2470588, 0, 1, 1,
0.5502326, 0.3154505, 1.46141, 0.254902, 0, 1, 1,
0.5512847, -0.06027907, 1.818326, 0.2588235, 0, 1, 1,
0.5558745, -1.856913, 4.302619, 0.2666667, 0, 1, 1,
0.5570773, 1.99501, -0.6688023, 0.2705882, 0, 1, 1,
0.5579857, -0.48307, 2.491796, 0.2784314, 0, 1, 1,
0.5587468, -0.2481865, 1.805039, 0.282353, 0, 1, 1,
0.5593135, 0.8244319, -0.442906, 0.2901961, 0, 1, 1,
0.5612447, -0.1584303, 2.765581, 0.2941177, 0, 1, 1,
0.5664669, -1.055786, 3.058917, 0.3019608, 0, 1, 1,
0.5665249, 1.418189, 2.06208, 0.3098039, 0, 1, 1,
0.5723405, 0.943274, 0.8714576, 0.3137255, 0, 1, 1,
0.5736322, 0.8414508, 0.3751538, 0.3215686, 0, 1, 1,
0.5747685, 0.1201491, -0.07501066, 0.3254902, 0, 1, 1,
0.5782772, -0.9742498, 5.007833, 0.3333333, 0, 1, 1,
0.5821174, 1.264461, 1.358479, 0.3372549, 0, 1, 1,
0.5827446, 0.7220696, 0.6215359, 0.345098, 0, 1, 1,
0.5829921, 0.7787781, -1.240617, 0.3490196, 0, 1, 1,
0.5865872, 0.6383144, -0.4489263, 0.3568628, 0, 1, 1,
0.5871107, -0.4453532, 2.564849, 0.3607843, 0, 1, 1,
0.5903079, 0.259815, 0.9894133, 0.3686275, 0, 1, 1,
0.590421, -1.585612, 1.184118, 0.372549, 0, 1, 1,
0.5944545, 0.7488555, 1.689029, 0.3803922, 0, 1, 1,
0.5985054, -0.04823805, 0.8493593, 0.3843137, 0, 1, 1,
0.6012766, -1.347686, 1.357923, 0.3921569, 0, 1, 1,
0.6017898, -0.9310153, 5.058284, 0.3960784, 0, 1, 1,
0.6103172, 1.291625, 1.856265, 0.4039216, 0, 1, 1,
0.6174887, -0.931841, 2.143371, 0.4117647, 0, 1, 1,
0.6215526, 0.6715117, -0.03310297, 0.4156863, 0, 1, 1,
0.6241213, 0.3255306, -1.000187, 0.4235294, 0, 1, 1,
0.6281288, 0.9940506, 1.905033, 0.427451, 0, 1, 1,
0.6294312, -0.6253647, 3.468254, 0.4352941, 0, 1, 1,
0.6298943, -0.9580233, 2.614402, 0.4392157, 0, 1, 1,
0.6304628, 0.8898374, 1.07832, 0.4470588, 0, 1, 1,
0.6345376, 0.1747032, 1.184127, 0.4509804, 0, 1, 1,
0.6358387, -0.8603637, 1.980366, 0.4588235, 0, 1, 1,
0.6359069, 0.3033355, 2.502092, 0.4627451, 0, 1, 1,
0.6365804, 1.14327, 0.7803327, 0.4705882, 0, 1, 1,
0.6405216, 0.6062461, 0.8341478, 0.4745098, 0, 1, 1,
0.6405283, 1.009686, -0.007753431, 0.4823529, 0, 1, 1,
0.6479455, 0.4782278, -0.7913225, 0.4862745, 0, 1, 1,
0.6578488, 1.629677, -0.1807461, 0.4941176, 0, 1, 1,
0.6582966, -0.4993234, 3.521424, 0.5019608, 0, 1, 1,
0.6635567, 1.528787, 1.714889, 0.5058824, 0, 1, 1,
0.6652409, 0.9687486, 0.9963235, 0.5137255, 0, 1, 1,
0.6719605, 0.8692399, 0.3397587, 0.5176471, 0, 1, 1,
0.6793767, -0.6556646, 2.939507, 0.5254902, 0, 1, 1,
0.6812136, -0.101044, 3.790478, 0.5294118, 0, 1, 1,
0.6891467, 0.5618373, 1.930966, 0.5372549, 0, 1, 1,
0.6910756, -1.702594, 0.9847509, 0.5411765, 0, 1, 1,
0.6919479, 1.074512, 1.313096, 0.5490196, 0, 1, 1,
0.6932739, -0.6083223, 2.387058, 0.5529412, 0, 1, 1,
0.6941088, 0.2674771, 0.2807114, 0.5607843, 0, 1, 1,
0.6944715, -0.5518103, 2.802556, 0.5647059, 0, 1, 1,
0.6958005, -0.4411895, 3.646419, 0.572549, 0, 1, 1,
0.6990068, 0.6667359, -0.3610795, 0.5764706, 0, 1, 1,
0.6998109, 0.8935133, 0.8569817, 0.5843138, 0, 1, 1,
0.7010497, -0.5141564, 1.871431, 0.5882353, 0, 1, 1,
0.7030907, 1.49225, -0.09902184, 0.5960785, 0, 1, 1,
0.705336, -0.01823558, 1.71795, 0.6039216, 0, 1, 1,
0.7085118, 0.5457417, -0.124336, 0.6078432, 0, 1, 1,
0.7175927, -0.7223435, 3.360311, 0.6156863, 0, 1, 1,
0.7181508, -0.09404796, 0.2878253, 0.6196079, 0, 1, 1,
0.7185194, -1.069425, 2.654041, 0.627451, 0, 1, 1,
0.718652, -0.1635707, 1.576189, 0.6313726, 0, 1, 1,
0.7206387, 0.4877948, 2.361977, 0.6392157, 0, 1, 1,
0.7216887, -1.955084, 1.759068, 0.6431373, 0, 1, 1,
0.7247854, -0.1368324, 1.292974, 0.6509804, 0, 1, 1,
0.7263708, -1.150661, 3.237581, 0.654902, 0, 1, 1,
0.7292542, 1.288212, 0.2131858, 0.6627451, 0, 1, 1,
0.7315512, -1.672589, 2.708812, 0.6666667, 0, 1, 1,
0.7325795, -0.8591459, 3.604437, 0.6745098, 0, 1, 1,
0.7418556, -0.06534696, 1.282451, 0.6784314, 0, 1, 1,
0.7426692, 0.3193787, 1.391885, 0.6862745, 0, 1, 1,
0.7475849, 1.845078, 0.6491978, 0.6901961, 0, 1, 1,
0.7532781, -0.1387645, 1.804634, 0.6980392, 0, 1, 1,
0.7542222, -0.900487, 2.244021, 0.7058824, 0, 1, 1,
0.7570512, 0.4057318, -1.663875, 0.7098039, 0, 1, 1,
0.7590699, 0.3933915, 0.3316722, 0.7176471, 0, 1, 1,
0.7629721, 0.5812663, 0.5010138, 0.7215686, 0, 1, 1,
0.7635714, -1.525764, 2.772688, 0.7294118, 0, 1, 1,
0.766094, 0.2107344, 1.623152, 0.7333333, 0, 1, 1,
0.7688075, 0.1912339, 1.09868, 0.7411765, 0, 1, 1,
0.7689624, -0.01260683, 0.5010335, 0.7450981, 0, 1, 1,
0.7702056, 2.396024, 0.008498929, 0.7529412, 0, 1, 1,
0.7829801, 0.8668872, 0.2249718, 0.7568628, 0, 1, 1,
0.7874765, -1.658018, 2.85973, 0.7647059, 0, 1, 1,
0.7969862, -0.2348389, -0.5508813, 0.7686275, 0, 1, 1,
0.7980908, 0.7771267, 0.5344568, 0.7764706, 0, 1, 1,
0.8000864, 0.09871811, 2.209836, 0.7803922, 0, 1, 1,
0.808907, -0.09100337, 2.204348, 0.7882353, 0, 1, 1,
0.8251361, 0.2313438, 0.01257743, 0.7921569, 0, 1, 1,
0.827716, -2.285259, 2.325209, 0.8, 0, 1, 1,
0.8281719, -0.5843431, 3.655112, 0.8078431, 0, 1, 1,
0.8594509, -0.4327326, 1.302428, 0.8117647, 0, 1, 1,
0.873017, 0.685923, 1.752557, 0.8196079, 0, 1, 1,
0.8765082, -0.8224817, 2.664662, 0.8235294, 0, 1, 1,
0.8767167, -1.443484, 2.717815, 0.8313726, 0, 1, 1,
0.8878914, -0.007166945, 0.9136331, 0.8352941, 0, 1, 1,
0.8897791, -0.6183783, 2.273643, 0.8431373, 0, 1, 1,
0.8924693, -0.5240863, 2.320656, 0.8470588, 0, 1, 1,
0.8931229, 0.1565579, 1.166882, 0.854902, 0, 1, 1,
0.8985788, 1.482017, -0.3572021, 0.8588235, 0, 1, 1,
0.8988807, -0.3494585, 0.7452174, 0.8666667, 0, 1, 1,
0.9027927, 0.6326658, 0.577489, 0.8705882, 0, 1, 1,
0.9036006, -1.350517, 2.001507, 0.8784314, 0, 1, 1,
0.9054924, -0.3973599, 1.590569, 0.8823529, 0, 1, 1,
0.9062082, -0.4682436, 2.899044, 0.8901961, 0, 1, 1,
0.9100241, 0.5948903, 2.443804, 0.8941177, 0, 1, 1,
0.9114562, 0.6116919, 1.97645, 0.9019608, 0, 1, 1,
0.9214241, -1.458913, 1.229478, 0.9098039, 0, 1, 1,
0.9424384, 0.2625656, 1.740228, 0.9137255, 0, 1, 1,
0.942736, 1.664272, -0.1901181, 0.9215686, 0, 1, 1,
0.9509171, -0.6357393, 1.042317, 0.9254902, 0, 1, 1,
0.9522599, -0.4843361, 2.371355, 0.9333333, 0, 1, 1,
0.9523008, -2.215616, 3.643667, 0.9372549, 0, 1, 1,
0.9578326, -1.328339, 1.746468, 0.945098, 0, 1, 1,
0.958944, 1.478725, 1.888264, 0.9490196, 0, 1, 1,
0.9602845, -1.167913, 2.482852, 0.9568627, 0, 1, 1,
0.9606393, -1.272597, 1.681816, 0.9607843, 0, 1, 1,
0.9975264, 1.515699, 0.1899749, 0.9686275, 0, 1, 1,
0.9979262, 1.252465, 0.8084224, 0.972549, 0, 1, 1,
1.001011, -0.09030469, 1.580634, 0.9803922, 0, 1, 1,
1.00141, -0.8540262, 2.36284, 0.9843137, 0, 1, 1,
1.002425, -1.372629, 4.376967, 0.9921569, 0, 1, 1,
1.005265, -1.245826, 3.338456, 0.9960784, 0, 1, 1,
1.013765, 1.120764, 0.5219845, 1, 0, 0.9960784, 1,
1.01404, -0.4440161, 1.177478, 1, 0, 0.9882353, 1,
1.019992, -1.657168, 1.325327, 1, 0, 0.9843137, 1,
1.033436, -0.3109892, 1.774611, 1, 0, 0.9764706, 1,
1.041714, 0.8237402, 0.9541299, 1, 0, 0.972549, 1,
1.043264, 0.5503591, 1.527984, 1, 0, 0.9647059, 1,
1.046495, 1.90127, -0.4737575, 1, 0, 0.9607843, 1,
1.056542, 2.603592, -0.2061768, 1, 0, 0.9529412, 1,
1.060057, -1.623135, 2.612877, 1, 0, 0.9490196, 1,
1.06319, -0.4417626, 2.056758, 1, 0, 0.9411765, 1,
1.064394, 1.79897, -0.9979903, 1, 0, 0.9372549, 1,
1.0737, -0.08270577, 0.4963822, 1, 0, 0.9294118, 1,
1.086836, 0.1357321, 0.4927241, 1, 0, 0.9254902, 1,
1.088036, 0.7914624, 0.4792101, 1, 0, 0.9176471, 1,
1.095511, -1.026375, 2.573073, 1, 0, 0.9137255, 1,
1.096372, 1.258673, 1.80834, 1, 0, 0.9058824, 1,
1.100065, -0.4819538, 2.275236, 1, 0, 0.9019608, 1,
1.119231, 0.7681773, 1.476941, 1, 0, 0.8941177, 1,
1.119601, 1.15241, 0.1048406, 1, 0, 0.8862745, 1,
1.121275, 0.6087247, 1.893268, 1, 0, 0.8823529, 1,
1.122921, 0.2763796, 3.058365, 1, 0, 0.8745098, 1,
1.125799, -0.7281883, 1.593401, 1, 0, 0.8705882, 1,
1.128206, -1.099689, 2.014763, 1, 0, 0.8627451, 1,
1.132118, 0.8870149, -0.9730172, 1, 0, 0.8588235, 1,
1.136374, 1.509695, 2.929277, 1, 0, 0.8509804, 1,
1.143124, 1.297471, 1.509725, 1, 0, 0.8470588, 1,
1.154255, -1.051944, 1.322024, 1, 0, 0.8392157, 1,
1.160149, -1.23858, 1.854385, 1, 0, 0.8352941, 1,
1.165565, -0.4361762, 2.549789, 1, 0, 0.827451, 1,
1.183306, -0.3354455, 1.415892, 1, 0, 0.8235294, 1,
1.183316, 0.5969535, -0.5325958, 1, 0, 0.8156863, 1,
1.183946, -1.354768, 2.956755, 1, 0, 0.8117647, 1,
1.184876, -0.4887495, 1.597552, 1, 0, 0.8039216, 1,
1.185906, 0.294273, 3.485284, 1, 0, 0.7960784, 1,
1.188594, 0.3827503, -0.3314539, 1, 0, 0.7921569, 1,
1.19337, 0.2214173, 0.1635199, 1, 0, 0.7843137, 1,
1.194465, -0.1475133, 2.06741, 1, 0, 0.7803922, 1,
1.195016, 0.1910351, 1.830179, 1, 0, 0.772549, 1,
1.203529, 1.38318, 2.383812, 1, 0, 0.7686275, 1,
1.205513, -1.159493, 2.239092, 1, 0, 0.7607843, 1,
1.210142, -0.84271, 2.378252, 1, 0, 0.7568628, 1,
1.211902, 1.003411, 2.713432, 1, 0, 0.7490196, 1,
1.221197, -1.108287, 3.469637, 1, 0, 0.7450981, 1,
1.227035, -0.1751178, 0.9092556, 1, 0, 0.7372549, 1,
1.228156, 0.5343234, -1.30909, 1, 0, 0.7333333, 1,
1.235801, 0.6792135, 0.6268498, 1, 0, 0.7254902, 1,
1.237539, 1.495081, 1.946588, 1, 0, 0.7215686, 1,
1.24268, 0.4158556, -0.6446998, 1, 0, 0.7137255, 1,
1.243896, -0.491859, 1.872691, 1, 0, 0.7098039, 1,
1.245922, -1.019799, 2.953972, 1, 0, 0.7019608, 1,
1.246853, -0.2806371, 1.250499, 1, 0, 0.6941177, 1,
1.250178, 0.3559014, 3.455437, 1, 0, 0.6901961, 1,
1.254724, 0.6457889, -0.03231224, 1, 0, 0.682353, 1,
1.255801, -0.6676114, 2.398687, 1, 0, 0.6784314, 1,
1.25629, -1.460777, 1.272694, 1, 0, 0.6705883, 1,
1.258942, 0.2607718, 2.589827, 1, 0, 0.6666667, 1,
1.264964, -0.4313952, 1.729036, 1, 0, 0.6588235, 1,
1.265126, 0.3607364, 0.494824, 1, 0, 0.654902, 1,
1.265842, 0.1578184, 1.004238, 1, 0, 0.6470588, 1,
1.269579, 2.003351, 0.2306337, 1, 0, 0.6431373, 1,
1.29517, -1.006141, 4.499765, 1, 0, 0.6352941, 1,
1.303338, -0.5929089, 2.808707, 1, 0, 0.6313726, 1,
1.304915, -0.3443054, 2.689551, 1, 0, 0.6235294, 1,
1.310825, 0.2625439, 1.124497, 1, 0, 0.6196079, 1,
1.313361, -0.6494409, 2.564496, 1, 0, 0.6117647, 1,
1.315936, 0.8710715, 0.5620855, 1, 0, 0.6078432, 1,
1.320671, 1.591365, -0.1557509, 1, 0, 0.6, 1,
1.331597, -0.4571022, 1.588312, 1, 0, 0.5921569, 1,
1.345668, -0.7598326, 2.052426, 1, 0, 0.5882353, 1,
1.347995, 1.440136, 0.7697542, 1, 0, 0.5803922, 1,
1.351782, 0.6039391, 0.5329173, 1, 0, 0.5764706, 1,
1.354238, 1.779659, -0.6295068, 1, 0, 0.5686275, 1,
1.354754, -0.9569242, 2.353879, 1, 0, 0.5647059, 1,
1.357657, -1.178869, 5.525268, 1, 0, 0.5568628, 1,
1.359792, 1.330825, -0.2326794, 1, 0, 0.5529412, 1,
1.362457, -0.9170287, 3.331317, 1, 0, 0.5450981, 1,
1.363134, -2.027317, 2.57129, 1, 0, 0.5411765, 1,
1.363146, -0.603066, 3.070183, 1, 0, 0.5333334, 1,
1.370318, -0.7558869, 1.971139, 1, 0, 0.5294118, 1,
1.378429, 0.04621324, 3.000004, 1, 0, 0.5215687, 1,
1.380642, 0.2639198, 0.2429361, 1, 0, 0.5176471, 1,
1.386858, 1.758876, -0.2452192, 1, 0, 0.509804, 1,
1.392072, 1.096201, -0.06754155, 1, 0, 0.5058824, 1,
1.403669, -1.859699, 2.163565, 1, 0, 0.4980392, 1,
1.415047, 1.411254, 0.7695079, 1, 0, 0.4901961, 1,
1.423631, -0.3270798, 2.11126, 1, 0, 0.4862745, 1,
1.424469, -0.100452, 1.817554, 1, 0, 0.4784314, 1,
1.425205, -1.063335, 4.104675, 1, 0, 0.4745098, 1,
1.458375, -0.2676536, 0.9441528, 1, 0, 0.4666667, 1,
1.469213, -0.4999512, 2.386993, 1, 0, 0.4627451, 1,
1.480631, 0.06193539, 2.366567, 1, 0, 0.454902, 1,
1.488642, -2.029192, 2.620501, 1, 0, 0.4509804, 1,
1.492161, -0.1374317, 2.839476, 1, 0, 0.4431373, 1,
1.494743, 0.4819627, 1.174843, 1, 0, 0.4392157, 1,
1.499971, -1.262719, 3.450995, 1, 0, 0.4313726, 1,
1.502349, 0.1152281, 1.873101, 1, 0, 0.427451, 1,
1.509456, -0.1143325, 2.370933, 1, 0, 0.4196078, 1,
1.509648, 0.1572721, 1.332668, 1, 0, 0.4156863, 1,
1.513795, 1.519644, -0.3902708, 1, 0, 0.4078431, 1,
1.515589, 1.81063, 1.578894, 1, 0, 0.4039216, 1,
1.516804, 0.6316515, 1.556204, 1, 0, 0.3960784, 1,
1.543987, 1.390297, 1.061645, 1, 0, 0.3882353, 1,
1.547116, 0.7524142, 0.2121916, 1, 0, 0.3843137, 1,
1.583212, -0.2963027, 0.9334572, 1, 0, 0.3764706, 1,
1.604863, -1.29164, 2.511917, 1, 0, 0.372549, 1,
1.616607, -0.3859554, 1.543532, 1, 0, 0.3647059, 1,
1.622528, -0.2479797, 1.842428, 1, 0, 0.3607843, 1,
1.628456, 0.6200118, 1.936045, 1, 0, 0.3529412, 1,
1.628653, 0.08938481, 2.037263, 1, 0, 0.3490196, 1,
1.629876, -0.2626779, 2.840447, 1, 0, 0.3411765, 1,
1.64597, 1.063367, 1.451043, 1, 0, 0.3372549, 1,
1.659295, 0.3131077, 0.6058081, 1, 0, 0.3294118, 1,
1.660731, 1.246907, 0.902667, 1, 0, 0.3254902, 1,
1.673177, -2.113633, 3.363859, 1, 0, 0.3176471, 1,
1.687074, -0.3905539, 3.306756, 1, 0, 0.3137255, 1,
1.693823, -1.928314, 1.792504, 1, 0, 0.3058824, 1,
1.694082, 0.1456311, 1.077621, 1, 0, 0.2980392, 1,
1.700109, -2.974564, 3.662894, 1, 0, 0.2941177, 1,
1.706918, 0.9403471, 1.381174, 1, 0, 0.2862745, 1,
1.752678, -2.163214, 2.045481, 1, 0, 0.282353, 1,
1.759098, -0.1592702, 1.017141, 1, 0, 0.2745098, 1,
1.765956, 0.7059973, 1.269692, 1, 0, 0.2705882, 1,
1.805835, -0.9725262, 1.557944, 1, 0, 0.2627451, 1,
1.82253, -1.177669, 3.935088, 1, 0, 0.2588235, 1,
1.830574, 0.775965, 1.878018, 1, 0, 0.2509804, 1,
1.856449, -0.06759131, 2.121278, 1, 0, 0.2470588, 1,
1.862455, -1.925099, 2.666438, 1, 0, 0.2392157, 1,
1.864737, -0.1154609, 1.294157, 1, 0, 0.2352941, 1,
1.866807, -0.6030934, 2.311995, 1, 0, 0.227451, 1,
1.885425, -1.08693, 3.867875, 1, 0, 0.2235294, 1,
1.893583, 0.1081561, -0.1715661, 1, 0, 0.2156863, 1,
1.947814, -1.026994, 2.75058, 1, 0, 0.2117647, 1,
1.971949, 0.2457908, 1.257407, 1, 0, 0.2039216, 1,
2.000799, -1.202992, 1.34288, 1, 0, 0.1960784, 1,
2.014067, -0.9232838, 2.503803, 1, 0, 0.1921569, 1,
2.023678, -1.162562, 2.866556, 1, 0, 0.1843137, 1,
2.033738, 0.5771315, 2.073123, 1, 0, 0.1803922, 1,
2.044227, -0.3336951, 1.333896, 1, 0, 0.172549, 1,
2.075687, -0.335351, 1.520375, 1, 0, 0.1686275, 1,
2.090371, -0.4470684, 2.307364, 1, 0, 0.1607843, 1,
2.090766, -0.5221912, 1.36253, 1, 0, 0.1568628, 1,
2.096634, 1.248953, 1.100923, 1, 0, 0.1490196, 1,
2.124537, -0.8869244, 2.720609, 1, 0, 0.145098, 1,
2.155616, -1.72453, 2.603936, 1, 0, 0.1372549, 1,
2.184198, 1.035058, 1.079065, 1, 0, 0.1333333, 1,
2.193058, -0.425459, 2.723903, 1, 0, 0.1254902, 1,
2.194062, -1.282532, 1.552381, 1, 0, 0.1215686, 1,
2.211101, 1.184704, 0.06007291, 1, 0, 0.1137255, 1,
2.235332, -0.6234117, 2.930477, 1, 0, 0.1098039, 1,
2.247239, 0.08450461, 0.7058437, 1, 0, 0.1019608, 1,
2.24876, 0.3576173, 1.80174, 1, 0, 0.09411765, 1,
2.249651, -0.3187091, 3.166141, 1, 0, 0.09019608, 1,
2.265521, -1.058206, 2.513149, 1, 0, 0.08235294, 1,
2.297288, -1.275748, 1.360286, 1, 0, 0.07843138, 1,
2.336318, 0.6084263, 0.3731863, 1, 0, 0.07058824, 1,
2.433438, -0.9066761, 0.9305644, 1, 0, 0.06666667, 1,
2.451739, 1.26206, 2.501517, 1, 0, 0.05882353, 1,
2.460558, -0.3724306, -0.8048208, 1, 0, 0.05490196, 1,
2.522836, -0.2256339, 2.312428, 1, 0, 0.04705882, 1,
2.539036, -2.059291, 1.860096, 1, 0, 0.04313726, 1,
2.546835, -1.575028, 3.454592, 1, 0, 0.03529412, 1,
2.621553, 0.5011183, 2.476312, 1, 0, 0.03137255, 1,
2.79837, 1.010253, 0.8317578, 1, 0, 0.02352941, 1,
2.822188, 1.187479, 0.2286543, 1, 0, 0.01960784, 1,
2.839618, -0.3496368, 0.7195309, 1, 0, 0.01176471, 1,
3.159767, 0.251473, 1.586917, 1, 0, 0.007843138, 1
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
-0.2605817, -4.089134, -7.051849, 0, -0.5, 0.5, 0.5,
-0.2605817, -4.089134, -7.051849, 1, -0.5, 0.5, 0.5,
-0.2605817, -4.089134, -7.051849, 1, 1.5, 0.5, 0.5,
-0.2605817, -4.089134, -7.051849, 0, 1.5, 0.5, 0.5
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
-4.840428, 0.163026, -7.051849, 0, -0.5, 0.5, 0.5,
-4.840428, 0.163026, -7.051849, 1, -0.5, 0.5, 0.5,
-4.840428, 0.163026, -7.051849, 1, 1.5, 0.5, 0.5,
-4.840428, 0.163026, -7.051849, 0, 1.5, 0.5, 0.5
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
-4.840428, -4.089134, 0.1481338, 0, -0.5, 0.5, 0.5,
-4.840428, -4.089134, 0.1481338, 1, -0.5, 0.5, 0.5,
-4.840428, -4.089134, 0.1481338, 1, 1.5, 0.5, 0.5,
-4.840428, -4.089134, 0.1481338, 0, 1.5, 0.5, 0.5
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
-3, -3.107866, -5.390315,
3, -3.107866, -5.390315,
-3, -3.107866, -5.390315,
-3, -3.271411, -5.667237,
-2, -3.107866, -5.390315,
-2, -3.271411, -5.667237,
-1, -3.107866, -5.390315,
-1, -3.271411, -5.667237,
0, -3.107866, -5.390315,
0, -3.271411, -5.667237,
1, -3.107866, -5.390315,
1, -3.271411, -5.667237,
2, -3.107866, -5.390315,
2, -3.271411, -5.667237,
3, -3.107866, -5.390315,
3, -3.271411, -5.667237
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
-3, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
-3, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
-3, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
-3, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5,
-2, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
-2, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
-2, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
-2, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5,
-1, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
-1, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
-1, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
-1, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5,
0, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
0, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
0, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
0, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5,
1, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
1, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
1, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
1, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5,
2, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
2, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
2, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
2, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5,
3, -3.5985, -6.221082, 0, -0.5, 0.5, 0.5,
3, -3.5985, -6.221082, 1, -0.5, 0.5, 0.5,
3, -3.5985, -6.221082, 1, 1.5, 0.5, 0.5,
3, -3.5985, -6.221082, 0, 1.5, 0.5, 0.5
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
-3.783541, -3, -5.390315,
-3.783541, 3, -5.390315,
-3.783541, -3, -5.390315,
-3.959689, -3, -5.667237,
-3.783541, -2, -5.390315,
-3.959689, -2, -5.667237,
-3.783541, -1, -5.390315,
-3.959689, -1, -5.667237,
-3.783541, 0, -5.390315,
-3.959689, 0, -5.667237,
-3.783541, 1, -5.390315,
-3.959689, 1, -5.667237,
-3.783541, 2, -5.390315,
-3.959689, 2, -5.667237,
-3.783541, 3, -5.390315,
-3.959689, 3, -5.667237
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
-4.311985, -3, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, -3, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, -3, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, -3, -6.221082, 0, 1.5, 0.5, 0.5,
-4.311985, -2, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, -2, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, -2, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, -2, -6.221082, 0, 1.5, 0.5, 0.5,
-4.311985, -1, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, -1, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, -1, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, -1, -6.221082, 0, 1.5, 0.5, 0.5,
-4.311985, 0, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, 0, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, 0, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, 0, -6.221082, 0, 1.5, 0.5, 0.5,
-4.311985, 1, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, 1, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, 1, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, 1, -6.221082, 0, 1.5, 0.5, 0.5,
-4.311985, 2, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, 2, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, 2, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, 2, -6.221082, 0, 1.5, 0.5, 0.5,
-4.311985, 3, -6.221082, 0, -0.5, 0.5, 0.5,
-4.311985, 3, -6.221082, 1, -0.5, 0.5, 0.5,
-4.311985, 3, -6.221082, 1, 1.5, 0.5, 0.5,
-4.311985, 3, -6.221082, 0, 1.5, 0.5, 0.5
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
-3.783541, -3.107866, -4,
-3.783541, -3.107866, 4,
-3.783541, -3.107866, -4,
-3.959689, -3.271411, -4,
-3.783541, -3.107866, -2,
-3.959689, -3.271411, -2,
-3.783541, -3.107866, 0,
-3.959689, -3.271411, 0,
-3.783541, -3.107866, 2,
-3.959689, -3.271411, 2,
-3.783541, -3.107866, 4,
-3.959689, -3.271411, 4
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
-4.311985, -3.5985, -4, 0, -0.5, 0.5, 0.5,
-4.311985, -3.5985, -4, 1, -0.5, 0.5, 0.5,
-4.311985, -3.5985, -4, 1, 1.5, 0.5, 0.5,
-4.311985, -3.5985, -4, 0, 1.5, 0.5, 0.5,
-4.311985, -3.5985, -2, 0, -0.5, 0.5, 0.5,
-4.311985, -3.5985, -2, 1, -0.5, 0.5, 0.5,
-4.311985, -3.5985, -2, 1, 1.5, 0.5, 0.5,
-4.311985, -3.5985, -2, 0, 1.5, 0.5, 0.5,
-4.311985, -3.5985, 0, 0, -0.5, 0.5, 0.5,
-4.311985, -3.5985, 0, 1, -0.5, 0.5, 0.5,
-4.311985, -3.5985, 0, 1, 1.5, 0.5, 0.5,
-4.311985, -3.5985, 0, 0, 1.5, 0.5, 0.5,
-4.311985, -3.5985, 2, 0, -0.5, 0.5, 0.5,
-4.311985, -3.5985, 2, 1, -0.5, 0.5, 0.5,
-4.311985, -3.5985, 2, 1, 1.5, 0.5, 0.5,
-4.311985, -3.5985, 2, 0, 1.5, 0.5, 0.5,
-4.311985, -3.5985, 4, 0, -0.5, 0.5, 0.5,
-4.311985, -3.5985, 4, 1, -0.5, 0.5, 0.5,
-4.311985, -3.5985, 4, 1, 1.5, 0.5, 0.5,
-4.311985, -3.5985, 4, 0, 1.5, 0.5, 0.5
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
-3.783541, -3.107866, -5.390315,
-3.783541, 3.433918, -5.390315,
-3.783541, -3.107866, 5.686582,
-3.783541, 3.433918, 5.686582,
-3.783541, -3.107866, -5.390315,
-3.783541, -3.107866, 5.686582,
-3.783541, 3.433918, -5.390315,
-3.783541, 3.433918, 5.686582,
-3.783541, -3.107866, -5.390315,
3.262377, -3.107866, -5.390315,
-3.783541, -3.107866, 5.686582,
3.262377, -3.107866, 5.686582,
-3.783541, 3.433918, -5.390315,
3.262377, 3.433918, -5.390315,
-3.783541, 3.433918, 5.686582,
3.262377, 3.433918, 5.686582,
3.262377, -3.107866, -5.390315,
3.262377, 3.433918, -5.390315,
3.262377, -3.107866, 5.686582,
3.262377, 3.433918, 5.686582,
3.262377, -3.107866, -5.390315,
3.262377, -3.107866, 5.686582,
3.262377, 3.433918, -5.390315,
3.262377, 3.433918, 5.686582
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
var radius = 7.832196;
var distance = 34.84632;
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
mvMatrix.translate( 0.2605817, -0.163026, -0.1481338 );
mvMatrix.scale( 1.201877, 1.294498, 0.7645033 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84632);
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
chloropropylate_1-me<-read.table("chloropropylate_1-me.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chloropropylate_1-me$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate_1' not found
```

```r
y<-chloropropylate_1-me$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate_1' not found
```

```r
z<-chloropropylate_1-me$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate_1' not found
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
-3.68093, -2.031188, -0.9905339, 0, 0, 1, 1, 1,
-2.917607, 1.8661, -1.350468, 1, 0, 0, 1, 1,
-2.638951, -0.3252906, -0.6907282, 1, 0, 0, 1, 1,
-2.476083, 0.04408919, -2.464972, 1, 0, 0, 1, 1,
-2.42664, -0.7381772, -0.9864937, 1, 0, 0, 1, 1,
-2.354978, 0.7805336, -1.368831, 1, 0, 0, 1, 1,
-2.279951, 0.03664233, -2.73999, 0, 0, 0, 1, 1,
-2.196166, -0.1657957, -0.7286837, 0, 0, 0, 1, 1,
-2.188011, 1.762211, -0.3233938, 0, 0, 0, 1, 1,
-2.128668, 0.8605268, -2.531971, 0, 0, 0, 1, 1,
-2.069406, 0.2784997, -0.468438, 0, 0, 0, 1, 1,
-2.057621, 0.6021178, -1.059958, 0, 0, 0, 1, 1,
-2.055001, 0.7984936, -1.082461, 0, 0, 0, 1, 1,
-2.053015, 0.2397984, -0.5910016, 1, 1, 1, 1, 1,
-2.029983, -0.8461849, -4.551634, 1, 1, 1, 1, 1,
-2.022137, 0.235291, -0.9427639, 1, 1, 1, 1, 1,
-1.996723, 2.78864, 0.3114205, 1, 1, 1, 1, 1,
-1.989775, -0.2855352, -2.899958, 1, 1, 1, 1, 1,
-1.982524, 1.242629, -0.6369802, 1, 1, 1, 1, 1,
-1.939418, 0.8849016, -1.622415, 1, 1, 1, 1, 1,
-1.938887, -0.529031, -2.362408, 1, 1, 1, 1, 1,
-1.937461, -0.9455321, -2.119388, 1, 1, 1, 1, 1,
-1.916369, 1.099766, -1.186402, 1, 1, 1, 1, 1,
-1.87126, -0.1772634, -1.332138, 1, 1, 1, 1, 1,
-1.85544, -0.6152844, -1.330431, 1, 1, 1, 1, 1,
-1.842406, 0.4424123, -1.953405, 1, 1, 1, 1, 1,
-1.842006, -2.533583, -3.190719, 1, 1, 1, 1, 1,
-1.839381, 0.980185, -1.520957, 1, 1, 1, 1, 1,
-1.820983, -1.460256, -1.679909, 0, 0, 1, 1, 1,
-1.819312, 0.9234467, -0.9475931, 1, 0, 0, 1, 1,
-1.81882, 1.655703, -1.319935, 1, 0, 0, 1, 1,
-1.795251, 1.934603, -0.174945, 1, 0, 0, 1, 1,
-1.780215, -0.5893763, -1.263471, 1, 0, 0, 1, 1,
-1.771908, -0.03881991, -1.830706, 1, 0, 0, 1, 1,
-1.758238, 0.05818313, -1.537323, 0, 0, 0, 1, 1,
-1.754824, -0.1309363, -0.03871287, 0, 0, 0, 1, 1,
-1.739243, -0.5999151, -1.005585, 0, 0, 0, 1, 1,
-1.72792, -1.712414, -0.6384727, 0, 0, 0, 1, 1,
-1.723874, 0.6689837, -0.1003709, 0, 0, 0, 1, 1,
-1.716453, -0.4021579, -1.862326, 0, 0, 0, 1, 1,
-1.696135, -1.232562, -2.493275, 0, 0, 0, 1, 1,
-1.691095, 0.1086214, -1.732311, 1, 1, 1, 1, 1,
-1.68458, -1.327911, -3.334699, 1, 1, 1, 1, 1,
-1.680238, -0.6817245, -0.8171827, 1, 1, 1, 1, 1,
-1.676849, 0.2913173, -0.8351667, 1, 1, 1, 1, 1,
-1.663419, 0.5680069, -1.53541, 1, 1, 1, 1, 1,
-1.660227, 0.1752899, 1.38677, 1, 1, 1, 1, 1,
-1.625241, -1.835473, -3.178267, 1, 1, 1, 1, 1,
-1.625237, 1.229541, -2.567719, 1, 1, 1, 1, 1,
-1.615977, 0.811913, -3.276413, 1, 1, 1, 1, 1,
-1.578833, 1.341812, -0.4400285, 1, 1, 1, 1, 1,
-1.577982, -2.269897, -1.657538, 1, 1, 1, 1, 1,
-1.577332, -0.2984122, -1.358771, 1, 1, 1, 1, 1,
-1.555052, 0.3796513, -0.3306912, 1, 1, 1, 1, 1,
-1.533049, -0.1092694, -1.319165, 1, 1, 1, 1, 1,
-1.524011, -1.356231, -2.882815, 1, 1, 1, 1, 1,
-1.515757, 2.841875, 1.727476, 0, 0, 1, 1, 1,
-1.51547, 0.3662527, -1.880473, 1, 0, 0, 1, 1,
-1.514364, -0.02572849, -2.027527, 1, 0, 0, 1, 1,
-1.514165, -0.5552918, -1.093401, 1, 0, 0, 1, 1,
-1.509817, 0.5864234, -2.155298, 1, 0, 0, 1, 1,
-1.502128, 2.273432, -1.780002, 1, 0, 0, 1, 1,
-1.498493, -1.99788, -3.548091, 0, 0, 0, 1, 1,
-1.483799, 1.505707, -1.688138, 0, 0, 0, 1, 1,
-1.476875, 0.01155565, -2.100802, 0, 0, 0, 1, 1,
-1.474991, 0.4529004, -2.615623, 0, 0, 0, 1, 1,
-1.462243, -0.6790785, -1.989685, 0, 0, 0, 1, 1,
-1.458155, -0.7514117, -2.757958, 0, 0, 0, 1, 1,
-1.458043, -0.7794626, -2.558424, 0, 0, 0, 1, 1,
-1.451064, 0.5471813, -0.6769153, 1, 1, 1, 1, 1,
-1.441292, -0.6475672, -2.398509, 1, 1, 1, 1, 1,
-1.437155, 0.8158624, -1.566615, 1, 1, 1, 1, 1,
-1.41587, -0.5884764, -2.613259, 1, 1, 1, 1, 1,
-1.411776, 0.2252749, 0.2323138, 1, 1, 1, 1, 1,
-1.404345, -2.510796, -2.007165, 1, 1, 1, 1, 1,
-1.394367, -0.7801405, -0.1078591, 1, 1, 1, 1, 1,
-1.385679, -0.7434532, -2.200351, 1, 1, 1, 1, 1,
-1.380479, 1.894082, -0.6105019, 1, 1, 1, 1, 1,
-1.376276, -0.7572175, -1.517814, 1, 1, 1, 1, 1,
-1.366443, -1.716438, -2.701547, 1, 1, 1, 1, 1,
-1.360449, 0.9448536, 0.4851106, 1, 1, 1, 1, 1,
-1.360226, -0.9293994, -0.7187621, 1, 1, 1, 1, 1,
-1.358887, -0.2588021, -2.74342, 1, 1, 1, 1, 1,
-1.355546, 0.5983437, -1.941207, 1, 1, 1, 1, 1,
-1.350442, 0.5876931, -1.672144, 0, 0, 1, 1, 1,
-1.308056, 1.557495, 0.1745175, 1, 0, 0, 1, 1,
-1.299944, -1.025154, -3.059288, 1, 0, 0, 1, 1,
-1.296187, 0.4048863, -1.779439, 1, 0, 0, 1, 1,
-1.286907, 0.01921842, -2.864026, 1, 0, 0, 1, 1,
-1.285888, -0.7719593, -3.18074, 1, 0, 0, 1, 1,
-1.285782, -0.1125864, -1.119463, 0, 0, 0, 1, 1,
-1.284883, -0.1708112, -1.687973, 0, 0, 0, 1, 1,
-1.284149, 0.4539662, -0.7795742, 0, 0, 0, 1, 1,
-1.28053, 0.05757127, -1.875375, 0, 0, 0, 1, 1,
-1.271032, -0.5791196, -1.572884, 0, 0, 0, 1, 1,
-1.269305, -1.462431, -2.734857, 0, 0, 0, 1, 1,
-1.267922, -0.01429026, -0.6377283, 0, 0, 0, 1, 1,
-1.253836, -0.5967484, -0.9676952, 1, 1, 1, 1, 1,
-1.251613, -0.8195687, -2.655838, 1, 1, 1, 1, 1,
-1.243892, -0.3424581, -1.165935, 1, 1, 1, 1, 1,
-1.222924, 1.387876, -1.091811, 1, 1, 1, 1, 1,
-1.212424, 1.01383, -1.297102, 1, 1, 1, 1, 1,
-1.209121, 0.2473097, -0.5996576, 1, 1, 1, 1, 1,
-1.208823, -1.74344, -2.447976, 1, 1, 1, 1, 1,
-1.203412, 0.8589473, -1.70143, 1, 1, 1, 1, 1,
-1.200536, -1.674532, -3.464393, 1, 1, 1, 1, 1,
-1.197362, -0.4502798, -2.436995, 1, 1, 1, 1, 1,
-1.195556, 1.144114, -1.128043, 1, 1, 1, 1, 1,
-1.189462, -1.651707, -1.011473, 1, 1, 1, 1, 1,
-1.180579, 1.175411, 0.9798921, 1, 1, 1, 1, 1,
-1.1759, 0.1171722, -1.638341, 1, 1, 1, 1, 1,
-1.173929, 0.4248562, 0.7586457, 1, 1, 1, 1, 1,
-1.173467, -0.7095869, -0.2447967, 0, 0, 1, 1, 1,
-1.165219, -0.3681745, -2.630223, 1, 0, 0, 1, 1,
-1.164415, -0.6706321, -2.203925, 1, 0, 0, 1, 1,
-1.162111, 1.343687, -0.4547554, 1, 0, 0, 1, 1,
-1.155715, 0.002284804, -1.773241, 1, 0, 0, 1, 1,
-1.152032, -1.073236, -3.28249, 1, 0, 0, 1, 1,
-1.151145, -0.6465455, 0.5280959, 0, 0, 0, 1, 1,
-1.143072, 0.7285725, -3.119639, 0, 0, 0, 1, 1,
-1.138826, -1.020825, -4.783339, 0, 0, 0, 1, 1,
-1.136438, 1.221612, -1.026366, 0, 0, 0, 1, 1,
-1.127051, -1.144394, -3.989746, 0, 0, 0, 1, 1,
-1.125821, 0.5129701, -1.745167, 0, 0, 0, 1, 1,
-1.12149, 0.5601242, -0.1086187, 0, 0, 0, 1, 1,
-1.118279, 0.4456459, -1.123059, 1, 1, 1, 1, 1,
-1.115876, -0.4493878, -2.622534, 1, 1, 1, 1, 1,
-1.114679, -0.004288565, 0.2595845, 1, 1, 1, 1, 1,
-1.114614, 0.6129827, -2.617375, 1, 1, 1, 1, 1,
-1.114249, -0.8519402, -2.533213, 1, 1, 1, 1, 1,
-1.112972, -2.283276, -3.357732, 1, 1, 1, 1, 1,
-1.095795, 1.039225, -0.6014988, 1, 1, 1, 1, 1,
-1.088258, 0.7843829, -0.1305712, 1, 1, 1, 1, 1,
-1.082046, -1.334609, -1.857216, 1, 1, 1, 1, 1,
-1.081295, -0.2210568, -2.229719, 1, 1, 1, 1, 1,
-1.069068, 1.296184, 0.60112, 1, 1, 1, 1, 1,
-1.064051, 0.7075506, -1.994226, 1, 1, 1, 1, 1,
-1.056996, -2.713087, -3.535373, 1, 1, 1, 1, 1,
-1.050965, 0.6162202, -0.4428402, 1, 1, 1, 1, 1,
-1.050455, 0.1712126, -2.54855, 1, 1, 1, 1, 1,
-1.046624, -1.819522, -2.180104, 0, 0, 1, 1, 1,
-1.041704, 1.320047, -1.203021, 1, 0, 0, 1, 1,
-1.036852, -0.007490818, -0.3783226, 1, 0, 0, 1, 1,
-1.028165, 2.212406, 0.01040349, 1, 0, 0, 1, 1,
-1.024875, 0.7874563, -1.308098, 1, 0, 0, 1, 1,
-1.009598, 0.7161249, -1.360386, 1, 0, 0, 1, 1,
-1.009537, 1.521501, -2.256911, 0, 0, 0, 1, 1,
-0.9868616, -0.4341798, 0.2437706, 0, 0, 0, 1, 1,
-0.9853806, -0.666113, -2.238555, 0, 0, 0, 1, 1,
-0.9820126, 0.5730159, -0.9502518, 0, 0, 0, 1, 1,
-0.9813254, 1.177596, -2.097709, 0, 0, 0, 1, 1,
-0.9781376, 0.1907394, -0.7575215, 0, 0, 0, 1, 1,
-0.9767843, -0.05794978, -1.400093, 0, 0, 0, 1, 1,
-0.9755937, 0.05219663, -3.397095, 1, 1, 1, 1, 1,
-0.9742394, -1.271139, -4.512917, 1, 1, 1, 1, 1,
-0.9737198, -1.248398, -2.474017, 1, 1, 1, 1, 1,
-0.9716625, 0.02545746, -1.013118, 1, 1, 1, 1, 1,
-0.9677638, -1.883309, -0.7859699, 1, 1, 1, 1, 1,
-0.9625126, -1.508364, -3.161089, 1, 1, 1, 1, 1,
-0.9585285, -2.037718, -3.473414, 1, 1, 1, 1, 1,
-0.9483089, -1.318349, -1.812202, 1, 1, 1, 1, 1,
-0.9397039, 0.8320352, 0.02781756, 1, 1, 1, 1, 1,
-0.9383606, -1.036015, -1.47699, 1, 1, 1, 1, 1,
-0.93481, -0.9773874, -1.523707, 1, 1, 1, 1, 1,
-0.9336292, 0.8310969, -0.7532095, 1, 1, 1, 1, 1,
-0.9331674, -1.878899, -2.898547, 1, 1, 1, 1, 1,
-0.9310085, 0.641437, -2.247298, 1, 1, 1, 1, 1,
-0.9303765, -0.4979064, -3.921984, 1, 1, 1, 1, 1,
-0.9297069, -1.138409, -2.721996, 0, 0, 1, 1, 1,
-0.9276727, -1.88691, -3.206909, 1, 0, 0, 1, 1,
-0.9261517, 1.297084, -1.41287, 1, 0, 0, 1, 1,
-0.9258976, -0.6683838, -2.538718, 1, 0, 0, 1, 1,
-0.9209182, 1.051587, -2.410079, 1, 0, 0, 1, 1,
-0.9190623, 0.5564658, 0.08844044, 1, 0, 0, 1, 1,
-0.9189346, -1.017098, -0.4817286, 0, 0, 0, 1, 1,
-0.9147769, 0.9789514, -3.611864, 0, 0, 0, 1, 1,
-0.912803, 0.4696953, 0.1124833, 0, 0, 0, 1, 1,
-0.9114458, 0.5281722, -1.177593, 0, 0, 0, 1, 1,
-0.9078058, -1.230538, -2.703844, 0, 0, 0, 1, 1,
-0.9051226, -0.2014652, -0.7426592, 0, 0, 0, 1, 1,
-0.8951104, -0.4736678, -1.137255, 0, 0, 0, 1, 1,
-0.8938401, -0.854645, -2.050475, 1, 1, 1, 1, 1,
-0.8781639, -0.5525416, -1.244582, 1, 1, 1, 1, 1,
-0.8708394, -1.23108, -2.498916, 1, 1, 1, 1, 1,
-0.8686902, 1.645669, -0.07754146, 1, 1, 1, 1, 1,
-0.8653691, 1.232285, -0.3661822, 1, 1, 1, 1, 1,
-0.8652557, 0.6646542, 0.8720588, 1, 1, 1, 1, 1,
-0.8639725, 1.51749, -1.779143, 1, 1, 1, 1, 1,
-0.858991, 0.201186, -0.6846018, 1, 1, 1, 1, 1,
-0.8545997, 2.154253, 1.592405, 1, 1, 1, 1, 1,
-0.8543622, 1.679623, 0.429662, 1, 1, 1, 1, 1,
-0.8528353, 0.6045619, 1.422821, 1, 1, 1, 1, 1,
-0.8456984, -1.083752, -1.029986, 1, 1, 1, 1, 1,
-0.8417804, -0.001828222, -1.676434, 1, 1, 1, 1, 1,
-0.8404909, -1.334742, -2.965551, 1, 1, 1, 1, 1,
-0.8395484, 2.093494, -0.743783, 1, 1, 1, 1, 1,
-0.8386189, 0.4413292, -0.7365082, 0, 0, 1, 1, 1,
-0.8315945, -1.596154, -4.153772, 1, 0, 0, 1, 1,
-0.8259435, -0.7604749, -0.9671986, 1, 0, 0, 1, 1,
-0.8185992, 0.8561523, -1.763298, 1, 0, 0, 1, 1,
-0.8175301, -0.4030623, -0.4288062, 1, 0, 0, 1, 1,
-0.8168979, -0.696891, -1.096123, 1, 0, 0, 1, 1,
-0.8127679, 0.3524027, -0.6902615, 0, 0, 0, 1, 1,
-0.80839, 0.7084944, 0.3707189, 0, 0, 0, 1, 1,
-0.8070629, 1.368443, -2.347211, 0, 0, 0, 1, 1,
-0.8052907, -0.1647851, -0.4932208, 0, 0, 0, 1, 1,
-0.7935706, -0.05013764, -1.49423, 0, 0, 0, 1, 1,
-0.7900147, -0.007200306, -0.6300551, 0, 0, 0, 1, 1,
-0.7834901, 1.329838, -2.489629, 0, 0, 0, 1, 1,
-0.7792985, -0.8562902, -3.382385, 1, 1, 1, 1, 1,
-0.7768264, -0.5785368, -2.979436, 1, 1, 1, 1, 1,
-0.7723625, -1.800195, -2.08632, 1, 1, 1, 1, 1,
-0.7702316, 1.67964, -0.6507508, 1, 1, 1, 1, 1,
-0.7683516, 0.6500603, 0.8738186, 1, 1, 1, 1, 1,
-0.7654305, -0.280668, -3.550864, 1, 1, 1, 1, 1,
-0.7638749, 1.933062, 0.5806262, 1, 1, 1, 1, 1,
-0.761059, -0.4066766, -2.035261, 1, 1, 1, 1, 1,
-0.7609743, 0.06951816, 0.06849523, 1, 1, 1, 1, 1,
-0.7587809, -0.08037792, -2.049915, 1, 1, 1, 1, 1,
-0.7555766, 0.4866159, -0.03796399, 1, 1, 1, 1, 1,
-0.7547118, 2.11669, -2.196766, 1, 1, 1, 1, 1,
-0.7536747, -0.6254103, -1.692169, 1, 1, 1, 1, 1,
-0.7525626, -0.3416394, -2.614432, 1, 1, 1, 1, 1,
-0.7509262, 0.99438, 0.9105556, 1, 1, 1, 1, 1,
-0.7502019, 0.1391177, -1.032794, 0, 0, 1, 1, 1,
-0.7480554, -1.639755, -2.644506, 1, 0, 0, 1, 1,
-0.7470234, 0.1537214, -1.546455, 1, 0, 0, 1, 1,
-0.7452462, 0.3818851, -0.473657, 1, 0, 0, 1, 1,
-0.7440912, -1.337473, -3.773085, 1, 0, 0, 1, 1,
-0.742581, -0.528474, -1.982353, 1, 0, 0, 1, 1,
-0.7397457, 0.01901081, -2.826774, 0, 0, 0, 1, 1,
-0.7355292, -0.6656064, -2.358666, 0, 0, 0, 1, 1,
-0.7352078, 0.4523259, -0.3855222, 0, 0, 0, 1, 1,
-0.7330338, -0.2951189, -1.810429, 0, 0, 0, 1, 1,
-0.7301517, 0.01329405, -2.43461, 0, 0, 0, 1, 1,
-0.7297748, 0.6617082, -1.553003, 0, 0, 0, 1, 1,
-0.7268501, -1.382658, -3.882547, 0, 0, 0, 1, 1,
-0.7229591, -2.006578, -3.657987, 1, 1, 1, 1, 1,
-0.7202252, 1.184965, 0.7563699, 1, 1, 1, 1, 1,
-0.7178699, 1.289746, -1.181891, 1, 1, 1, 1, 1,
-0.7152176, -1.378449, -3.628822, 1, 1, 1, 1, 1,
-0.7120091, 0.6719584, -0.6893347, 1, 1, 1, 1, 1,
-0.7104932, -1.515503, -3.704432, 1, 1, 1, 1, 1,
-0.7104407, -3.012598, -3.87286, 1, 1, 1, 1, 1,
-0.7080328, 2.05976, -1.010528, 1, 1, 1, 1, 1,
-0.7024767, 0.6969729, -2.07704, 1, 1, 1, 1, 1,
-0.7000899, -0.03402034, -1.347907, 1, 1, 1, 1, 1,
-0.6991454, -0.5366958, -1.312567, 1, 1, 1, 1, 1,
-0.6980414, -0.6044058, -2.595832, 1, 1, 1, 1, 1,
-0.6966668, -1.763348, -1.255282, 1, 1, 1, 1, 1,
-0.6960822, -0.6608379, -2.155619, 1, 1, 1, 1, 1,
-0.6937342, -0.2818945, -1.604496, 1, 1, 1, 1, 1,
-0.6933348, -0.1472329, -2.911112, 0, 0, 1, 1, 1,
-0.6905045, -0.7773119, -0.4003167, 1, 0, 0, 1, 1,
-0.690321, 0.4009633, -0.5212455, 1, 0, 0, 1, 1,
-0.6886462, -0.04020802, -1.821261, 1, 0, 0, 1, 1,
-0.6848326, -1.550247, -3.414923, 1, 0, 0, 1, 1,
-0.6835681, 0.4351641, -1.011397, 1, 0, 0, 1, 1,
-0.6815695, 0.07965898, -0.6724268, 0, 0, 0, 1, 1,
-0.6797757, 2.539722, -0.9386023, 0, 0, 0, 1, 1,
-0.678807, -0.4089965, -1.835051, 0, 0, 0, 1, 1,
-0.6741835, -0.9522679, -2.433702, 0, 0, 0, 1, 1,
-0.6711054, 1.828729, 0.5621748, 0, 0, 0, 1, 1,
-0.6705298, -1.965468, -3.595982, 0, 0, 0, 1, 1,
-0.6630875, 0.7506885, -0.7494549, 0, 0, 0, 1, 1,
-0.6615477, -0.7135707, -0.9472449, 1, 1, 1, 1, 1,
-0.6551849, 0.5413128, -1.564642, 1, 1, 1, 1, 1,
-0.6528232, 0.4802768, -0.996321, 1, 1, 1, 1, 1,
-0.6520323, -1.837104, -2.669922, 1, 1, 1, 1, 1,
-0.6496547, 1.705609, -0.06925825, 1, 1, 1, 1, 1,
-0.648384, -1.081592, -1.526861, 1, 1, 1, 1, 1,
-0.6453904, 0.01125145, -0.82967, 1, 1, 1, 1, 1,
-0.6433033, -0.4442574, -1.765971, 1, 1, 1, 1, 1,
-0.6398696, 0.005938068, -0.7931428, 1, 1, 1, 1, 1,
-0.6392636, 2.385473, 1.180561, 1, 1, 1, 1, 1,
-0.63181, 1.128286, -1.918275, 1, 1, 1, 1, 1,
-0.6305432, -0.3997482, -2.2616, 1, 1, 1, 1, 1,
-0.6198771, -0.6615539, -4.405474, 1, 1, 1, 1, 1,
-0.6139768, -0.8733808, -1.344179, 1, 1, 1, 1, 1,
-0.6138454, -0.1331706, 1.093353, 1, 1, 1, 1, 1,
-0.6126641, -0.192103, -0.64062, 0, 0, 1, 1, 1,
-0.6115486, -0.009042801, -1.004921, 1, 0, 0, 1, 1,
-0.6093879, 0.06626716, 0.4766563, 1, 0, 0, 1, 1,
-0.6092937, 1.350507, -0.5194915, 1, 0, 0, 1, 1,
-0.6042116, 2.758033, 1.118996, 1, 0, 0, 1, 1,
-0.6000059, -2.757062, -3.623071, 1, 0, 0, 1, 1,
-0.5899615, -0.149348, 0.04287668, 0, 0, 0, 1, 1,
-0.5881936, 1.633173, -1.397952, 0, 0, 0, 1, 1,
-0.5862396, -2.591604, -2.947059, 0, 0, 0, 1, 1,
-0.5806459, 1.465681, -0.8367131, 0, 0, 0, 1, 1,
-0.5796171, 0.2423833, -0.6032627, 0, 0, 0, 1, 1,
-0.5772731, -0.5577029, -2.712257, 0, 0, 0, 1, 1,
-0.5769346, 0.5723987, 0.7902555, 0, 0, 0, 1, 1,
-0.5760499, -1.120691, -4.22827, 1, 1, 1, 1, 1,
-0.5728288, -2.53274, -2.355012, 1, 1, 1, 1, 1,
-0.5722559, -0.172968, -2.360984, 1, 1, 1, 1, 1,
-0.5669321, -0.6043176, -2.814037, 1, 1, 1, 1, 1,
-0.559973, -0.8214315, -2.478498, 1, 1, 1, 1, 1,
-0.5575432, 0.2456678, -1.191312, 1, 1, 1, 1, 1,
-0.5557739, 0.5411277, -0.9294558, 1, 1, 1, 1, 1,
-0.5556328, -0.834956, -2.927878, 1, 1, 1, 1, 1,
-0.5528002, 0.1974052, -1.130446, 1, 1, 1, 1, 1,
-0.5494363, -0.7178239, -1.163135, 1, 1, 1, 1, 1,
-0.534534, 0.07843781, -1.462613, 1, 1, 1, 1, 1,
-0.530396, 0.4471395, -1.139946, 1, 1, 1, 1, 1,
-0.5213752, -1.456005, -2.829074, 1, 1, 1, 1, 1,
-0.5177949, -0.6899925, -1.865645, 1, 1, 1, 1, 1,
-0.5155123, 0.8275087, -0.9556413, 1, 1, 1, 1, 1,
-0.5134107, 0.8227469, -0.7217983, 0, 0, 1, 1, 1,
-0.5112077, 0.3656789, -2.469971, 1, 0, 0, 1, 1,
-0.509806, -0.2244564, -3.059978, 1, 0, 0, 1, 1,
-0.5089945, -0.2751885, -0.8596019, 1, 0, 0, 1, 1,
-0.5060271, -0.2466312, -1.753908, 1, 0, 0, 1, 1,
-0.4995171, -0.5169631, -2.334932, 1, 0, 0, 1, 1,
-0.4986344, -1.775444, -1.622434, 0, 0, 0, 1, 1,
-0.496674, -0.08977669, -1.650753, 0, 0, 0, 1, 1,
-0.4950606, -0.8750124, -3.640043, 0, 0, 0, 1, 1,
-0.4950503, 0.943371, -2.245045, 0, 0, 0, 1, 1,
-0.4944596, 0.8922939, 1.966666, 0, 0, 0, 1, 1,
-0.4884817, 0.5862815, 0.9838425, 0, 0, 0, 1, 1,
-0.4857697, 0.1621841, -0.7658831, 0, 0, 0, 1, 1,
-0.4820516, -0.967177, -2.708172, 1, 1, 1, 1, 1,
-0.480685, 0.3689588, -1.031991, 1, 1, 1, 1, 1,
-0.4739847, -0.5458352, -1.448764, 1, 1, 1, 1, 1,
-0.4725176, -0.9526591, -4.402566, 1, 1, 1, 1, 1,
-0.4664964, -1.219544, -2.02597, 1, 1, 1, 1, 1,
-0.4646516, 0.8972285, -0.6053972, 1, 1, 1, 1, 1,
-0.4642859, 0.3590212, -1.816618, 1, 1, 1, 1, 1,
-0.4623107, -1.205972, -3.629465, 1, 1, 1, 1, 1,
-0.461634, -0.5015403, -2.600469, 1, 1, 1, 1, 1,
-0.460107, 0.4596007, -0.7855088, 1, 1, 1, 1, 1,
-0.4549986, 0.8834369, -0.9751462, 1, 1, 1, 1, 1,
-0.4549018, 0.06008901, -1.72013, 1, 1, 1, 1, 1,
-0.4509378, 0.2861548, -1.601885, 1, 1, 1, 1, 1,
-0.4470873, -1.68017, -1.377819, 1, 1, 1, 1, 1,
-0.443889, 1.990278, -0.858214, 1, 1, 1, 1, 1,
-0.4434104, -1.68649, -2.245314, 0, 0, 1, 1, 1,
-0.4417428, 1.074993, -1.880614, 1, 0, 0, 1, 1,
-0.434048, -1.715837, -2.448086, 1, 0, 0, 1, 1,
-0.4335735, -1.078773, -1.111357, 1, 0, 0, 1, 1,
-0.4332052, -1.642326, -1.429311, 1, 0, 0, 1, 1,
-0.4294866, 1.222846, -1.101525, 1, 0, 0, 1, 1,
-0.4285928, 0.5422108, -0.2858309, 0, 0, 0, 1, 1,
-0.4276438, -0.3594157, -0.3237496, 0, 0, 0, 1, 1,
-0.4246688, 0.941918, -1.338165, 0, 0, 0, 1, 1,
-0.4233025, -0.06031141, -1.972449, 0, 0, 0, 1, 1,
-0.4211331, -2.870888, -3.525917, 0, 0, 0, 1, 1,
-0.4189143, 0.7505887, 0.2002165, 0, 0, 0, 1, 1,
-0.4180698, 0.2283898, -1.834226, 0, 0, 0, 1, 1,
-0.4174373, 0.9495381, -0.5466997, 1, 1, 1, 1, 1,
-0.4164501, 0.6323674, -0.03616967, 1, 1, 1, 1, 1,
-0.4162154, 0.3917214, -1.952632, 1, 1, 1, 1, 1,
-0.4103957, -0.7819858, -2.878658, 1, 1, 1, 1, 1,
-0.4099815, 0.7082217, 0.4849082, 1, 1, 1, 1, 1,
-0.4094559, -0.9003285, -2.908367, 1, 1, 1, 1, 1,
-0.4093749, -0.204115, -3.016179, 1, 1, 1, 1, 1,
-0.4091122, 1.538542, -1.151553, 1, 1, 1, 1, 1,
-0.4082806, 1.063813, -0.5817237, 1, 1, 1, 1, 1,
-0.4054401, 0.2459441, -2.469713, 1, 1, 1, 1, 1,
-0.4021727, 1.072043, -1.594121, 1, 1, 1, 1, 1,
-0.4019786, 0.4298038, -0.4566969, 1, 1, 1, 1, 1,
-0.4015961, -1.286876, -3.484248, 1, 1, 1, 1, 1,
-0.3992901, 0.05963009, -1.786008, 1, 1, 1, 1, 1,
-0.3945293, -0.06356403, -1.660677, 1, 1, 1, 1, 1,
-0.391352, -0.5348455, -2.135149, 0, 0, 1, 1, 1,
-0.3891035, -1.182298, -2.019186, 1, 0, 0, 1, 1,
-0.3855541, -0.5955114, -2.089742, 1, 0, 0, 1, 1,
-0.3776684, -0.6227133, -3.399055, 1, 0, 0, 1, 1,
-0.3741129, -0.3261719, -3.01903, 1, 0, 0, 1, 1,
-0.3698155, 1.572692, -2.348997, 1, 0, 0, 1, 1,
-0.3665777, -1.114313, -3.460717, 0, 0, 0, 1, 1,
-0.3638699, 0.1956341, -1.17758, 0, 0, 0, 1, 1,
-0.3631128, 0.262751, -0.6583942, 0, 0, 0, 1, 1,
-0.3622141, -1.332017, -2.989558, 0, 0, 0, 1, 1,
-0.3621401, 0.2512231, -0.01580241, 0, 0, 0, 1, 1,
-0.3612042, 0.2696593, -1.883881, 0, 0, 0, 1, 1,
-0.3598427, -0.1352084, -1.917249, 0, 0, 0, 1, 1,
-0.3560823, -0.6722966, -1.480097, 1, 1, 1, 1, 1,
-0.3493176, -0.10779, -1.193953, 1, 1, 1, 1, 1,
-0.3446127, 1.379478, -0.246942, 1, 1, 1, 1, 1,
-0.3414765, 1.910577, -0.4412094, 1, 1, 1, 1, 1,
-0.3376196, -0.005253578, -0.970409, 1, 1, 1, 1, 1,
-0.3373988, -1.123017, -2.338449, 1, 1, 1, 1, 1,
-0.3340073, -0.7685021, -2.637893, 1, 1, 1, 1, 1,
-0.329618, -1.699739, -2.217107, 1, 1, 1, 1, 1,
-0.3293964, -1.028154, -1.969736, 1, 1, 1, 1, 1,
-0.3288566, -0.0264696, -0.249715, 1, 1, 1, 1, 1,
-0.3283812, 0.5748781, -0.1455927, 1, 1, 1, 1, 1,
-0.3245681, -0.629261, -3.506233, 1, 1, 1, 1, 1,
-0.319895, 0.2790956, -1.174142, 1, 1, 1, 1, 1,
-0.3128439, 0.3017149, -2.860037, 1, 1, 1, 1, 1,
-0.3113633, -0.6226887, -3.340682, 1, 1, 1, 1, 1,
-0.3086486, -0.8824884, -3.289201, 0, 0, 1, 1, 1,
-0.3080031, -2.367923, -2.60374, 1, 0, 0, 1, 1,
-0.2992305, -0.1500186, -1.147976, 1, 0, 0, 1, 1,
-0.2969048, -0.0177423, -1.404139, 1, 0, 0, 1, 1,
-0.295482, -0.351153, -3.455126, 1, 0, 0, 1, 1,
-0.2952295, 0.03259412, -1.198825, 1, 0, 0, 1, 1,
-0.293612, 0.3810198, -0.9072521, 0, 0, 0, 1, 1,
-0.2919028, 1.221477, 1.507899, 0, 0, 0, 1, 1,
-0.2914225, 2.043485, 0.5843318, 0, 0, 0, 1, 1,
-0.2905481, 0.9156981, -2.363507, 0, 0, 0, 1, 1,
-0.2882756, 0.4637789, -0.9670174, 0, 0, 0, 1, 1,
-0.2874882, -2.325306, -4.581376, 0, 0, 0, 1, 1,
-0.2873459, -2.128858, -3.09873, 0, 0, 0, 1, 1,
-0.2869254, 0.1957594, -2.119796, 1, 1, 1, 1, 1,
-0.278451, 0.7766051, -1.746091, 1, 1, 1, 1, 1,
-0.27711, -0.09181657, -2.77595, 1, 1, 1, 1, 1,
-0.2763059, 1.074265, 0.3326294, 1, 1, 1, 1, 1,
-0.27223, -1.364962, -1.83329, 1, 1, 1, 1, 1,
-0.2709573, -0.2602722, -1.296981, 1, 1, 1, 1, 1,
-0.2702855, -0.3675058, -2.038978, 1, 1, 1, 1, 1,
-0.2677226, -0.6427955, -1.843959, 1, 1, 1, 1, 1,
-0.2668114, 0.8716791, -0.4709589, 1, 1, 1, 1, 1,
-0.2601837, 0.5257387, 0.2560868, 1, 1, 1, 1, 1,
-0.2584699, 0.05207612, 0.4231433, 1, 1, 1, 1, 1,
-0.2571998, -0.2095224, -2.36966, 1, 1, 1, 1, 1,
-0.2560481, -2.087456, -3.131125, 1, 1, 1, 1, 1,
-0.2496903, 0.5104452, -1.781243, 1, 1, 1, 1, 1,
-0.248281, 0.4971391, -1.076295, 1, 1, 1, 1, 1,
-0.2440982, -0.3001746, -1.84252, 0, 0, 1, 1, 1,
-0.2407545, 0.4862902, -0.9425362, 1, 0, 0, 1, 1,
-0.238063, 0.24001, -2.248062, 1, 0, 0, 1, 1,
-0.2301817, -1.073565, -2.310647, 1, 0, 0, 1, 1,
-0.2278616, -1.482768, -2.468384, 1, 0, 0, 1, 1,
-0.22378, -0.5592276, -2.17771, 1, 0, 0, 1, 1,
-0.223482, -0.8946208, -4.772069, 0, 0, 0, 1, 1,
-0.2223933, 0.3909002, 0.1872609, 0, 0, 0, 1, 1,
-0.2199952, 3.33865, 1.041235, 0, 0, 0, 1, 1,
-0.2158995, 0.8641984, 0.9002413, 0, 0, 0, 1, 1,
-0.2100525, -0.6695282, -3.158472, 0, 0, 0, 1, 1,
-0.207548, 2.068166, 0.2560099, 0, 0, 0, 1, 1,
-0.2004504, -0.124369, -3.464634, 0, 0, 0, 1, 1,
-0.194925, -0.09131293, -2.89493, 1, 1, 1, 1, 1,
-0.1859207, 1.041108, -2.274179, 1, 1, 1, 1, 1,
-0.183014, -1.364359, -2.856039, 1, 1, 1, 1, 1,
-0.1822495, -0.6308384, -3.494402, 1, 1, 1, 1, 1,
-0.1815318, 0.1962848, 0.510039, 1, 1, 1, 1, 1,
-0.1788181, -0.5998253, -2.683097, 1, 1, 1, 1, 1,
-0.1734717, 0.737348, 1.710262, 1, 1, 1, 1, 1,
-0.1726554, -0.316795, -2.76893, 1, 1, 1, 1, 1,
-0.1715103, -0.9323694, -2.101269, 1, 1, 1, 1, 1,
-0.1668935, -0.5743672, -1.969469, 1, 1, 1, 1, 1,
-0.1605078, 0.2061198, 0.03895252, 1, 1, 1, 1, 1,
-0.1592811, -1.906912, -3.328938, 1, 1, 1, 1, 1,
-0.1579898, 1.188166, -0.1677915, 1, 1, 1, 1, 1,
-0.1561988, 0.2924295, -1.550555, 1, 1, 1, 1, 1,
-0.1561895, 1.448573, 0.8048469, 1, 1, 1, 1, 1,
-0.1557545, 1.162211, 0.8988219, 0, 0, 1, 1, 1,
-0.1527169, -0.8384646, -2.963824, 1, 0, 0, 1, 1,
-0.1499589, 0.5879819, -2.298049, 1, 0, 0, 1, 1,
-0.1492394, 0.3959258, -2.771949, 1, 0, 0, 1, 1,
-0.1457126, -0.1651236, -3.073533, 1, 0, 0, 1, 1,
-0.1452269, -0.246452, -3.207712, 1, 0, 0, 1, 1,
-0.1427172, -1.212449, -1.113798, 0, 0, 0, 1, 1,
-0.1425505, -0.8620712, -3.94906, 0, 0, 0, 1, 1,
-0.138969, 1.223562, 0.01958131, 0, 0, 0, 1, 1,
-0.1364946, -1.243308, -3.444617, 0, 0, 0, 1, 1,
-0.1313529, 1.033085, 0.5788403, 0, 0, 0, 1, 1,
-0.1291656, -1.170605, -5.229001, 0, 0, 0, 1, 1,
-0.1274415, -0.2840783, -3.361028, 0, 0, 0, 1, 1,
-0.1227435, -0.1294675, -0.673122, 1, 1, 1, 1, 1,
-0.1214224, -0.08236013, -3.031196, 1, 1, 1, 1, 1,
-0.119935, -1.162732, -3.788794, 1, 1, 1, 1, 1,
-0.1123622, 0.3237059, -0.1118133, 1, 1, 1, 1, 1,
-0.108261, 0.5848267, 1.064359, 1, 1, 1, 1, 1,
-0.1082159, 0.1619547, 0.4881992, 1, 1, 1, 1, 1,
-0.1056238, 0.4290037, 0.504683, 1, 1, 1, 1, 1,
-0.09360543, -1.073115, -2.882699, 1, 1, 1, 1, 1,
-0.08817746, -0.2994715, -2.348819, 1, 1, 1, 1, 1,
-0.08706337, -0.7370414, -3.309242, 1, 1, 1, 1, 1,
-0.0868895, 0.1374902, 1.842491, 1, 1, 1, 1, 1,
-0.08023527, -1.731258, -3.41871, 1, 1, 1, 1, 1,
-0.07752433, 1.595063, -0.3204124, 1, 1, 1, 1, 1,
-0.073276, 0.5616673, 1.195893, 1, 1, 1, 1, 1,
-0.07032314, -0.01590013, -1.485437, 1, 1, 1, 1, 1,
-0.06916071, 0.1416295, -0.8704157, 0, 0, 1, 1, 1,
-0.06726781, -0.05014644, -1.554756, 1, 0, 0, 1, 1,
-0.06602606, -1.340088, -2.141311, 1, 0, 0, 1, 1,
-0.06543427, -0.48318, -1.767468, 1, 0, 0, 1, 1,
-0.06485608, -1.079604, -3.852844, 1, 0, 0, 1, 1,
-0.0602665, 0.08166604, -0.09650058, 1, 0, 0, 1, 1,
-0.0556156, -1.180586, -3.481833, 0, 0, 0, 1, 1,
-0.05517676, -0.1581985, -2.806281, 0, 0, 0, 1, 1,
-0.04881073, 1.56862, 0.6734028, 0, 0, 0, 1, 1,
-0.04617063, -0.7532506, -3.1727, 0, 0, 0, 1, 1,
-0.04399277, -0.4824515, -4.715988, 0, 0, 0, 1, 1,
-0.04294827, 1.285735, 2.81505, 0, 0, 0, 1, 1,
-0.0406105, -0.6244714, -3.925536, 0, 0, 0, 1, 1,
-0.03818928, -0.6538507, -2.291193, 1, 1, 1, 1, 1,
-0.03490621, -0.6345925, -0.6410998, 1, 1, 1, 1, 1,
-0.034553, 0.5232536, -0.1755223, 1, 1, 1, 1, 1,
-0.03222325, -0.1915007, -4.199273, 1, 1, 1, 1, 1,
-0.03002633, -0.7581196, -3.868298, 1, 1, 1, 1, 1,
-0.02427798, 0.5868819, 2.380266, 1, 1, 1, 1, 1,
-0.0227349, -1.465424, -3.24876, 1, 1, 1, 1, 1,
-0.02017775, 0.1797958, -0.08386783, 1, 1, 1, 1, 1,
-0.01423923, 0.007355052, -1.889384, 1, 1, 1, 1, 1,
-0.01214024, -1.379342, -2.012853, 1, 1, 1, 1, 1,
-0.01200444, 0.2985298, 1.512016, 1, 1, 1, 1, 1,
-0.00804195, 1.557268, -1.211349, 1, 1, 1, 1, 1,
-0.004859732, -2.033335, -3.929813, 1, 1, 1, 1, 1,
-0.0006557259, 0.4057777, 0.9365717, 1, 1, 1, 1, 1,
0.0004247263, -0.6244258, 2.076517, 1, 1, 1, 1, 1,
0.0009231822, -1.686289, 3.582828, 0, 0, 1, 1, 1,
0.005092669, -0.01589951, 4.272218, 1, 0, 0, 1, 1,
0.006948029, -1.782897, 3.975705, 1, 0, 0, 1, 1,
0.007137363, -1.458005, 2.053175, 1, 0, 0, 1, 1,
0.009022781, -0.6342285, 3.838118, 1, 0, 0, 1, 1,
0.009872814, -0.1097012, 2.845414, 1, 0, 0, 1, 1,
0.01267667, -0.7093494, 4.140455, 0, 0, 0, 1, 1,
0.0163748, -0.3163899, 2.488147, 0, 0, 0, 1, 1,
0.0198591, 0.9228644, 0.9190443, 0, 0, 0, 1, 1,
0.02677274, 0.4181149, -0.2907136, 0, 0, 0, 1, 1,
0.03128147, -0.8895715, 3.653276, 0, 0, 0, 1, 1,
0.03786947, -0.9377249, 3.340161, 0, 0, 0, 1, 1,
0.04052363, -0.1846738, 3.56369, 0, 0, 0, 1, 1,
0.04210209, -0.1590764, 1.560433, 1, 1, 1, 1, 1,
0.04257469, -1.062296, 4.097562, 1, 1, 1, 1, 1,
0.0460263, 1.77317, -0.5308561, 1, 1, 1, 1, 1,
0.04883195, 0.07154241, -1.585531, 1, 1, 1, 1, 1,
0.04919836, 1.004742, 0.9325029, 1, 1, 1, 1, 1,
0.04956329, 0.2990824, 2.153124, 1, 1, 1, 1, 1,
0.05066612, -0.802816, 3.030084, 1, 1, 1, 1, 1,
0.05138818, 0.158414, -0.3838626, 1, 1, 1, 1, 1,
0.05400977, -0.5673075, 3.655178, 1, 1, 1, 1, 1,
0.05524971, 0.9388006, -0.2150732, 1, 1, 1, 1, 1,
0.05857474, 0.8655223, -0.3053903, 1, 1, 1, 1, 1,
0.05945287, -0.4303933, 2.822128, 1, 1, 1, 1, 1,
0.05949014, -1.226818, 2.517843, 1, 1, 1, 1, 1,
0.06020065, -0.05381298, 2.143726, 1, 1, 1, 1, 1,
0.06301172, -1.956422, 3.776559, 1, 1, 1, 1, 1,
0.06662986, 0.1497522, 0.4273633, 0, 0, 1, 1, 1,
0.06743309, 0.6038575, -0.3076669, 1, 0, 0, 1, 1,
0.06827655, 1.17042, 0.3431479, 1, 0, 0, 1, 1,
0.06870551, -0.4268117, 3.785209, 1, 0, 0, 1, 1,
0.0756013, -0.9360747, 3.103307, 1, 0, 0, 1, 1,
0.09109432, -0.400836, 2.029051, 1, 0, 0, 1, 1,
0.0963703, -1.28651, 4.513223, 0, 0, 0, 1, 1,
0.09658062, -1.713856, 3.547202, 0, 0, 0, 1, 1,
0.100495, -0.3810853, 2.533706, 0, 0, 0, 1, 1,
0.1027033, 0.2567362, 0.5325201, 0, 0, 0, 1, 1,
0.1042024, -0.5381897, 3.86346, 0, 0, 0, 1, 1,
0.105001, -0.4531283, 1.509125, 0, 0, 0, 1, 1,
0.1064322, -0.8748062, 2.978247, 0, 0, 0, 1, 1,
0.1121489, -0.05118676, 2.387317, 1, 1, 1, 1, 1,
0.1213709, -0.3474278, 1.055346, 1, 1, 1, 1, 1,
0.1245539, 1.892193, -0.1706204, 1, 1, 1, 1, 1,
0.1264189, -2.023317, 3.158866, 1, 1, 1, 1, 1,
0.1280661, 1.341378, 0.4558295, 1, 1, 1, 1, 1,
0.1286134, 0.9791116, -0.2361298, 1, 1, 1, 1, 1,
0.1287576, -0.03062008, 2.599802, 1, 1, 1, 1, 1,
0.1305206, -0.3426576, 1.549133, 1, 1, 1, 1, 1,
0.1307198, 2.351287, -0.9122352, 1, 1, 1, 1, 1,
0.1345093, 0.7664018, 1.189143, 1, 1, 1, 1, 1,
0.1359081, -0.01739224, -0.2766785, 1, 1, 1, 1, 1,
0.1391834, 2.289523, 1.33748, 1, 1, 1, 1, 1,
0.1395167, -0.07937646, 2.754918, 1, 1, 1, 1, 1,
0.1397073, 0.7145928, 0.3031323, 1, 1, 1, 1, 1,
0.1402871, 0.1606659, 1.193325, 1, 1, 1, 1, 1,
0.1431848, -1.617804, 1.831639, 0, 0, 1, 1, 1,
0.1432595, 0.5991189, -0.1973784, 1, 0, 0, 1, 1,
0.1465272, 0.007886639, 2.970789, 1, 0, 0, 1, 1,
0.1470199, -0.4354002, 2.448078, 1, 0, 0, 1, 1,
0.151753, -0.6027032, 1.872596, 1, 0, 0, 1, 1,
0.1520189, 0.5400918, 1.053149, 1, 0, 0, 1, 1,
0.1531063, 1.245543, -0.8963303, 0, 0, 0, 1, 1,
0.1575486, 1.798192, 0.2736456, 0, 0, 0, 1, 1,
0.1652818, -0.4961897, 4.512595, 0, 0, 0, 1, 1,
0.1676824, -0.6052867, 4.360336, 0, 0, 0, 1, 1,
0.1679657, -1.095452, 4.195204, 0, 0, 0, 1, 1,
0.1690668, -1.294164, 1.146462, 0, 0, 0, 1, 1,
0.1716677, 0.7181337, 2.704075, 0, 0, 0, 1, 1,
0.1729655, -0.372012, 3.865806, 1, 1, 1, 1, 1,
0.1754911, 0.8874265, 1.510508, 1, 1, 1, 1, 1,
0.1810426, 0.6505717, 0.6251553, 1, 1, 1, 1, 1,
0.1810636, 0.3628674, 0.420802, 1, 1, 1, 1, 1,
0.181867, 1.849582e-05, 2.547885, 1, 1, 1, 1, 1,
0.1867642, 2.539093, -1.305641, 1, 1, 1, 1, 1,
0.1919047, -0.07333831, 2.229732, 1, 1, 1, 1, 1,
0.1921133, -0.2091193, 1.813428, 1, 1, 1, 1, 1,
0.1979752, 1.569004, 0.7308425, 1, 1, 1, 1, 1,
0.2014942, -0.8845205, 3.028616, 1, 1, 1, 1, 1,
0.2020899, 0.3735596, 0.6718746, 1, 1, 1, 1, 1,
0.2059201, 0.9448053, 0.5302728, 1, 1, 1, 1, 1,
0.2065589, 1.375124, 0.2019879, 1, 1, 1, 1, 1,
0.2078859, 0.004610493, 0.6154692, 1, 1, 1, 1, 1,
0.2095912, -1.854983, 3.794698, 1, 1, 1, 1, 1,
0.2098363, 0.01359473, 2.126877, 0, 0, 1, 1, 1,
0.2127325, -0.1119304, 2.898348, 1, 0, 0, 1, 1,
0.2164492, -1.314999, 4.093806, 1, 0, 0, 1, 1,
0.2172623, 0.7494236, -0.08662026, 1, 0, 0, 1, 1,
0.2242523, -0.3027787, 2.071558, 1, 0, 0, 1, 1,
0.2248297, -0.04875112, 0.1389243, 1, 0, 0, 1, 1,
0.2279632, 1.313135, -0.7074367, 0, 0, 0, 1, 1,
0.230143, -0.5635182, 4.802484, 0, 0, 0, 1, 1,
0.2311877, 0.3550346, -1.542593, 0, 0, 0, 1, 1,
0.2318531, -0.7833322, 4.069734, 0, 0, 0, 1, 1,
0.2337747, -1.337515, 2.183046, 0, 0, 0, 1, 1,
0.2351449, -1.437177, 2.765103, 0, 0, 0, 1, 1,
0.235186, 1.145505, -0.2861328, 0, 0, 0, 1, 1,
0.2364752, 1.177409, 0.2223677, 1, 1, 1, 1, 1,
0.2373458, 0.3293299, 3.051339, 1, 1, 1, 1, 1,
0.2389281, -0.1005694, 4.211676, 1, 1, 1, 1, 1,
0.2409175, -0.4594318, 2.084543, 1, 1, 1, 1, 1,
0.2429385, 1.199203, -0.6762025, 1, 1, 1, 1, 1,
0.2466745, 1.469208, 0.04227374, 1, 1, 1, 1, 1,
0.259013, -1.105157, 2.633703, 1, 1, 1, 1, 1,
0.2600971, 1.692779, 0.6349109, 1, 1, 1, 1, 1,
0.2612323, -1.24266, 2.810144, 1, 1, 1, 1, 1,
0.2684743, -0.3446338, 3.238961, 1, 1, 1, 1, 1,
0.2694761, 1.167982, 0.02965693, 1, 1, 1, 1, 1,
0.2746153, -1.6081, 1.063072, 1, 1, 1, 1, 1,
0.2764685, -1.089467, 3.526013, 1, 1, 1, 1, 1,
0.2792006, 0.5457581, 1.693175, 1, 1, 1, 1, 1,
0.2803981, -1.055622, 2.405184, 1, 1, 1, 1, 1,
0.2830506, 0.2203321, 1.812159, 0, 0, 1, 1, 1,
0.2869046, 0.3983982, 0.8945094, 1, 0, 0, 1, 1,
0.2910628, 1.577496, -1.787104, 1, 0, 0, 1, 1,
0.2944224, 0.3169393, 0.03785097, 1, 0, 0, 1, 1,
0.2957475, -0.2996868, 2.193495, 1, 0, 0, 1, 1,
0.3002026, -1.094874, 2.297113, 1, 0, 0, 1, 1,
0.3132882, -1.080762, 2.990716, 0, 0, 0, 1, 1,
0.3154755, 0.9765926, 0.7201772, 0, 0, 0, 1, 1,
0.3183303, 0.07279358, 0.07488801, 0, 0, 0, 1, 1,
0.3192999, -1.188916, 3.135303, 0, 0, 0, 1, 1,
0.3207103, -1.062953, 2.229024, 0, 0, 0, 1, 1,
0.3215281, 0.5141933, -0.123324, 0, 0, 0, 1, 1,
0.3247369, -0.143932, 3.166016, 0, 0, 0, 1, 1,
0.3257578, 0.1186513, 2.549524, 1, 1, 1, 1, 1,
0.3273766, 0.4749053, 1.350708, 1, 1, 1, 1, 1,
0.3274502, -0.4291401, 2.498749, 1, 1, 1, 1, 1,
0.32957, 0.7848262, -0.04283424, 1, 1, 1, 1, 1,
0.338166, -0.9975559, 3.745494, 1, 1, 1, 1, 1,
0.3408886, 0.3609683, 0.685151, 1, 1, 1, 1, 1,
0.3416961, 0.2786165, 1.802045, 1, 1, 1, 1, 1,
0.3420352, 1.423627, 1.682048, 1, 1, 1, 1, 1,
0.3433476, -0.7010293, 4.276727, 1, 1, 1, 1, 1,
0.3445896, 0.09489957, 2.66695, 1, 1, 1, 1, 1,
0.3447307, 0.4261611, 0.8719637, 1, 1, 1, 1, 1,
0.3478811, -1.550833, 2.342583, 1, 1, 1, 1, 1,
0.3544846, -1.513191, 3.412228, 1, 1, 1, 1, 1,
0.35482, 0.1513107, 1.310316, 1, 1, 1, 1, 1,
0.3563747, 0.008068184, 2.315028, 1, 1, 1, 1, 1,
0.3667247, 1.741363, 0.07867071, 0, 0, 1, 1, 1,
0.3699549, 0.1122215, 0.7586108, 1, 0, 0, 1, 1,
0.3722406, 1.348721, 1.003394, 1, 0, 0, 1, 1,
0.3768463, 0.4513786, 1.132103, 1, 0, 0, 1, 1,
0.3812733, 0.8059009, 0.4827291, 1, 0, 0, 1, 1,
0.3853189, -0.04870464, 1.874252, 1, 0, 0, 1, 1,
0.3882905, -0.6045998, 3.171499, 0, 0, 0, 1, 1,
0.3913288, 0.09255672, 0.3266475, 0, 0, 0, 1, 1,
0.3918708, -0.2671266, 1.900921, 0, 0, 0, 1, 1,
0.3963454, 0.9315554, 0.8672923, 0, 0, 0, 1, 1,
0.3984424, -2.097118, 2.140372, 0, 0, 0, 1, 1,
0.4015057, -1.047777, 1.601023, 0, 0, 0, 1, 1,
0.4069739, 1.252148, 0.1299557, 0, 0, 0, 1, 1,
0.408519, -0.8772503, 4.61275, 1, 1, 1, 1, 1,
0.4113401, -0.1924425, 3.042719, 1, 1, 1, 1, 1,
0.4172955, -0.0753462, 1.783074, 1, 1, 1, 1, 1,
0.4173001, -0.2071389, 1.363505, 1, 1, 1, 1, 1,
0.419696, -0.3187125, 3.393956, 1, 1, 1, 1, 1,
0.4215601, -0.4253131, 1.340251, 1, 1, 1, 1, 1,
0.4238578, 0.7099725, 0.5728287, 1, 1, 1, 1, 1,
0.4256141, 1.568461, 1.124217, 1, 1, 1, 1, 1,
0.4262556, -1.892919, 2.917729, 1, 1, 1, 1, 1,
0.4263746, -0.238475, 2.982645, 1, 1, 1, 1, 1,
0.426816, -0.5060748, 1.93736, 1, 1, 1, 1, 1,
0.4273245, -0.4121151, 3.190124, 1, 1, 1, 1, 1,
0.4283544, 1.732121, 0.3323257, 1, 1, 1, 1, 1,
0.4333837, 0.09165423, 0.9511209, 1, 1, 1, 1, 1,
0.4350422, -2.550598, 2.697286, 1, 1, 1, 1, 1,
0.4353531, 0.7528474, 1.911469, 0, 0, 1, 1, 1,
0.436272, -0.1604707, -0.2211115, 1, 0, 0, 1, 1,
0.451755, 0.8711376, 0.5978226, 1, 0, 0, 1, 1,
0.455878, -0.2076455, 3.49388, 1, 0, 0, 1, 1,
0.4568313, -1.06108, 2.211902, 1, 0, 0, 1, 1,
0.4599444, 1.546751, 0.4936935, 1, 0, 0, 1, 1,
0.4607053, 1.175364, -0.4517634, 0, 0, 0, 1, 1,
0.4615999, -0.3413638, 2.407766, 0, 0, 0, 1, 1,
0.4633913, -0.9297758, 2.957309, 0, 0, 0, 1, 1,
0.475883, -0.8920655, 2.985878, 0, 0, 0, 1, 1,
0.4788428, 0.03892434, 2.095104, 0, 0, 0, 1, 1,
0.480989, 0.5088252, 1.535068, 0, 0, 0, 1, 1,
0.4817099, -0.02914583, -0.05179453, 0, 0, 0, 1, 1,
0.4820972, -2.842366, 2.834905, 1, 1, 1, 1, 1,
0.4909724, -0.177926, -0.03942839, 1, 1, 1, 1, 1,
0.4910139, 0.7323241, 0.6481553, 1, 1, 1, 1, 1,
0.5003734, -1.140461, 3.298394, 1, 1, 1, 1, 1,
0.5010403, -1.487199, 3.566221, 1, 1, 1, 1, 1,
0.503521, -0.8820589, 3.896417, 1, 1, 1, 1, 1,
0.5051017, -1.098535, 3.419402, 1, 1, 1, 1, 1,
0.5061969, -0.2054314, 3.775321, 1, 1, 1, 1, 1,
0.5067019, 1.463334, 0.2267464, 1, 1, 1, 1, 1,
0.5082531, 1.83372, 0.8508769, 1, 1, 1, 1, 1,
0.5101689, 0.4760275, 0.9365824, 1, 1, 1, 1, 1,
0.5143999, 0.6507294, 1.201487, 1, 1, 1, 1, 1,
0.5160699, -0.9424273, 2.269107, 1, 1, 1, 1, 1,
0.5184531, 0.8433338, 0.9651985, 1, 1, 1, 1, 1,
0.5238352, 1.20016, -0.2111912, 1, 1, 1, 1, 1,
0.5269623, 0.3040443, 0.4360322, 0, 0, 1, 1, 1,
0.532914, -0.2301911, 2.322783, 1, 0, 0, 1, 1,
0.5378797, -0.923554, 1.948502, 1, 0, 0, 1, 1,
0.540205, 0.4387999, 0.05125496, 1, 0, 0, 1, 1,
0.5411127, 0.1139941, 2.485307, 1, 0, 0, 1, 1,
0.5414927, -1.676782, 2.114275, 1, 0, 0, 1, 1,
0.5451604, -1.53161, 3.1624, 0, 0, 0, 1, 1,
0.5468171, -0.2428198, 3.08674, 0, 0, 0, 1, 1,
0.5500965, 0.6446266, 0.3795658, 0, 0, 0, 1, 1,
0.5502326, 0.3154505, 1.46141, 0, 0, 0, 1, 1,
0.5512847, -0.06027907, 1.818326, 0, 0, 0, 1, 1,
0.5558745, -1.856913, 4.302619, 0, 0, 0, 1, 1,
0.5570773, 1.99501, -0.6688023, 0, 0, 0, 1, 1,
0.5579857, -0.48307, 2.491796, 1, 1, 1, 1, 1,
0.5587468, -0.2481865, 1.805039, 1, 1, 1, 1, 1,
0.5593135, 0.8244319, -0.442906, 1, 1, 1, 1, 1,
0.5612447, -0.1584303, 2.765581, 1, 1, 1, 1, 1,
0.5664669, -1.055786, 3.058917, 1, 1, 1, 1, 1,
0.5665249, 1.418189, 2.06208, 1, 1, 1, 1, 1,
0.5723405, 0.943274, 0.8714576, 1, 1, 1, 1, 1,
0.5736322, 0.8414508, 0.3751538, 1, 1, 1, 1, 1,
0.5747685, 0.1201491, -0.07501066, 1, 1, 1, 1, 1,
0.5782772, -0.9742498, 5.007833, 1, 1, 1, 1, 1,
0.5821174, 1.264461, 1.358479, 1, 1, 1, 1, 1,
0.5827446, 0.7220696, 0.6215359, 1, 1, 1, 1, 1,
0.5829921, 0.7787781, -1.240617, 1, 1, 1, 1, 1,
0.5865872, 0.6383144, -0.4489263, 1, 1, 1, 1, 1,
0.5871107, -0.4453532, 2.564849, 1, 1, 1, 1, 1,
0.5903079, 0.259815, 0.9894133, 0, 0, 1, 1, 1,
0.590421, -1.585612, 1.184118, 1, 0, 0, 1, 1,
0.5944545, 0.7488555, 1.689029, 1, 0, 0, 1, 1,
0.5985054, -0.04823805, 0.8493593, 1, 0, 0, 1, 1,
0.6012766, -1.347686, 1.357923, 1, 0, 0, 1, 1,
0.6017898, -0.9310153, 5.058284, 1, 0, 0, 1, 1,
0.6103172, 1.291625, 1.856265, 0, 0, 0, 1, 1,
0.6174887, -0.931841, 2.143371, 0, 0, 0, 1, 1,
0.6215526, 0.6715117, -0.03310297, 0, 0, 0, 1, 1,
0.6241213, 0.3255306, -1.000187, 0, 0, 0, 1, 1,
0.6281288, 0.9940506, 1.905033, 0, 0, 0, 1, 1,
0.6294312, -0.6253647, 3.468254, 0, 0, 0, 1, 1,
0.6298943, -0.9580233, 2.614402, 0, 0, 0, 1, 1,
0.6304628, 0.8898374, 1.07832, 1, 1, 1, 1, 1,
0.6345376, 0.1747032, 1.184127, 1, 1, 1, 1, 1,
0.6358387, -0.8603637, 1.980366, 1, 1, 1, 1, 1,
0.6359069, 0.3033355, 2.502092, 1, 1, 1, 1, 1,
0.6365804, 1.14327, 0.7803327, 1, 1, 1, 1, 1,
0.6405216, 0.6062461, 0.8341478, 1, 1, 1, 1, 1,
0.6405283, 1.009686, -0.007753431, 1, 1, 1, 1, 1,
0.6479455, 0.4782278, -0.7913225, 1, 1, 1, 1, 1,
0.6578488, 1.629677, -0.1807461, 1, 1, 1, 1, 1,
0.6582966, -0.4993234, 3.521424, 1, 1, 1, 1, 1,
0.6635567, 1.528787, 1.714889, 1, 1, 1, 1, 1,
0.6652409, 0.9687486, 0.9963235, 1, 1, 1, 1, 1,
0.6719605, 0.8692399, 0.3397587, 1, 1, 1, 1, 1,
0.6793767, -0.6556646, 2.939507, 1, 1, 1, 1, 1,
0.6812136, -0.101044, 3.790478, 1, 1, 1, 1, 1,
0.6891467, 0.5618373, 1.930966, 0, 0, 1, 1, 1,
0.6910756, -1.702594, 0.9847509, 1, 0, 0, 1, 1,
0.6919479, 1.074512, 1.313096, 1, 0, 0, 1, 1,
0.6932739, -0.6083223, 2.387058, 1, 0, 0, 1, 1,
0.6941088, 0.2674771, 0.2807114, 1, 0, 0, 1, 1,
0.6944715, -0.5518103, 2.802556, 1, 0, 0, 1, 1,
0.6958005, -0.4411895, 3.646419, 0, 0, 0, 1, 1,
0.6990068, 0.6667359, -0.3610795, 0, 0, 0, 1, 1,
0.6998109, 0.8935133, 0.8569817, 0, 0, 0, 1, 1,
0.7010497, -0.5141564, 1.871431, 0, 0, 0, 1, 1,
0.7030907, 1.49225, -0.09902184, 0, 0, 0, 1, 1,
0.705336, -0.01823558, 1.71795, 0, 0, 0, 1, 1,
0.7085118, 0.5457417, -0.124336, 0, 0, 0, 1, 1,
0.7175927, -0.7223435, 3.360311, 1, 1, 1, 1, 1,
0.7181508, -0.09404796, 0.2878253, 1, 1, 1, 1, 1,
0.7185194, -1.069425, 2.654041, 1, 1, 1, 1, 1,
0.718652, -0.1635707, 1.576189, 1, 1, 1, 1, 1,
0.7206387, 0.4877948, 2.361977, 1, 1, 1, 1, 1,
0.7216887, -1.955084, 1.759068, 1, 1, 1, 1, 1,
0.7247854, -0.1368324, 1.292974, 1, 1, 1, 1, 1,
0.7263708, -1.150661, 3.237581, 1, 1, 1, 1, 1,
0.7292542, 1.288212, 0.2131858, 1, 1, 1, 1, 1,
0.7315512, -1.672589, 2.708812, 1, 1, 1, 1, 1,
0.7325795, -0.8591459, 3.604437, 1, 1, 1, 1, 1,
0.7418556, -0.06534696, 1.282451, 1, 1, 1, 1, 1,
0.7426692, 0.3193787, 1.391885, 1, 1, 1, 1, 1,
0.7475849, 1.845078, 0.6491978, 1, 1, 1, 1, 1,
0.7532781, -0.1387645, 1.804634, 1, 1, 1, 1, 1,
0.7542222, -0.900487, 2.244021, 0, 0, 1, 1, 1,
0.7570512, 0.4057318, -1.663875, 1, 0, 0, 1, 1,
0.7590699, 0.3933915, 0.3316722, 1, 0, 0, 1, 1,
0.7629721, 0.5812663, 0.5010138, 1, 0, 0, 1, 1,
0.7635714, -1.525764, 2.772688, 1, 0, 0, 1, 1,
0.766094, 0.2107344, 1.623152, 1, 0, 0, 1, 1,
0.7688075, 0.1912339, 1.09868, 0, 0, 0, 1, 1,
0.7689624, -0.01260683, 0.5010335, 0, 0, 0, 1, 1,
0.7702056, 2.396024, 0.008498929, 0, 0, 0, 1, 1,
0.7829801, 0.8668872, 0.2249718, 0, 0, 0, 1, 1,
0.7874765, -1.658018, 2.85973, 0, 0, 0, 1, 1,
0.7969862, -0.2348389, -0.5508813, 0, 0, 0, 1, 1,
0.7980908, 0.7771267, 0.5344568, 0, 0, 0, 1, 1,
0.8000864, 0.09871811, 2.209836, 1, 1, 1, 1, 1,
0.808907, -0.09100337, 2.204348, 1, 1, 1, 1, 1,
0.8251361, 0.2313438, 0.01257743, 1, 1, 1, 1, 1,
0.827716, -2.285259, 2.325209, 1, 1, 1, 1, 1,
0.8281719, -0.5843431, 3.655112, 1, 1, 1, 1, 1,
0.8594509, -0.4327326, 1.302428, 1, 1, 1, 1, 1,
0.873017, 0.685923, 1.752557, 1, 1, 1, 1, 1,
0.8765082, -0.8224817, 2.664662, 1, 1, 1, 1, 1,
0.8767167, -1.443484, 2.717815, 1, 1, 1, 1, 1,
0.8878914, -0.007166945, 0.9136331, 1, 1, 1, 1, 1,
0.8897791, -0.6183783, 2.273643, 1, 1, 1, 1, 1,
0.8924693, -0.5240863, 2.320656, 1, 1, 1, 1, 1,
0.8931229, 0.1565579, 1.166882, 1, 1, 1, 1, 1,
0.8985788, 1.482017, -0.3572021, 1, 1, 1, 1, 1,
0.8988807, -0.3494585, 0.7452174, 1, 1, 1, 1, 1,
0.9027927, 0.6326658, 0.577489, 0, 0, 1, 1, 1,
0.9036006, -1.350517, 2.001507, 1, 0, 0, 1, 1,
0.9054924, -0.3973599, 1.590569, 1, 0, 0, 1, 1,
0.9062082, -0.4682436, 2.899044, 1, 0, 0, 1, 1,
0.9100241, 0.5948903, 2.443804, 1, 0, 0, 1, 1,
0.9114562, 0.6116919, 1.97645, 1, 0, 0, 1, 1,
0.9214241, -1.458913, 1.229478, 0, 0, 0, 1, 1,
0.9424384, 0.2625656, 1.740228, 0, 0, 0, 1, 1,
0.942736, 1.664272, -0.1901181, 0, 0, 0, 1, 1,
0.9509171, -0.6357393, 1.042317, 0, 0, 0, 1, 1,
0.9522599, -0.4843361, 2.371355, 0, 0, 0, 1, 1,
0.9523008, -2.215616, 3.643667, 0, 0, 0, 1, 1,
0.9578326, -1.328339, 1.746468, 0, 0, 0, 1, 1,
0.958944, 1.478725, 1.888264, 1, 1, 1, 1, 1,
0.9602845, -1.167913, 2.482852, 1, 1, 1, 1, 1,
0.9606393, -1.272597, 1.681816, 1, 1, 1, 1, 1,
0.9975264, 1.515699, 0.1899749, 1, 1, 1, 1, 1,
0.9979262, 1.252465, 0.8084224, 1, 1, 1, 1, 1,
1.001011, -0.09030469, 1.580634, 1, 1, 1, 1, 1,
1.00141, -0.8540262, 2.36284, 1, 1, 1, 1, 1,
1.002425, -1.372629, 4.376967, 1, 1, 1, 1, 1,
1.005265, -1.245826, 3.338456, 1, 1, 1, 1, 1,
1.013765, 1.120764, 0.5219845, 1, 1, 1, 1, 1,
1.01404, -0.4440161, 1.177478, 1, 1, 1, 1, 1,
1.019992, -1.657168, 1.325327, 1, 1, 1, 1, 1,
1.033436, -0.3109892, 1.774611, 1, 1, 1, 1, 1,
1.041714, 0.8237402, 0.9541299, 1, 1, 1, 1, 1,
1.043264, 0.5503591, 1.527984, 1, 1, 1, 1, 1,
1.046495, 1.90127, -0.4737575, 0, 0, 1, 1, 1,
1.056542, 2.603592, -0.2061768, 1, 0, 0, 1, 1,
1.060057, -1.623135, 2.612877, 1, 0, 0, 1, 1,
1.06319, -0.4417626, 2.056758, 1, 0, 0, 1, 1,
1.064394, 1.79897, -0.9979903, 1, 0, 0, 1, 1,
1.0737, -0.08270577, 0.4963822, 1, 0, 0, 1, 1,
1.086836, 0.1357321, 0.4927241, 0, 0, 0, 1, 1,
1.088036, 0.7914624, 0.4792101, 0, 0, 0, 1, 1,
1.095511, -1.026375, 2.573073, 0, 0, 0, 1, 1,
1.096372, 1.258673, 1.80834, 0, 0, 0, 1, 1,
1.100065, -0.4819538, 2.275236, 0, 0, 0, 1, 1,
1.119231, 0.7681773, 1.476941, 0, 0, 0, 1, 1,
1.119601, 1.15241, 0.1048406, 0, 0, 0, 1, 1,
1.121275, 0.6087247, 1.893268, 1, 1, 1, 1, 1,
1.122921, 0.2763796, 3.058365, 1, 1, 1, 1, 1,
1.125799, -0.7281883, 1.593401, 1, 1, 1, 1, 1,
1.128206, -1.099689, 2.014763, 1, 1, 1, 1, 1,
1.132118, 0.8870149, -0.9730172, 1, 1, 1, 1, 1,
1.136374, 1.509695, 2.929277, 1, 1, 1, 1, 1,
1.143124, 1.297471, 1.509725, 1, 1, 1, 1, 1,
1.154255, -1.051944, 1.322024, 1, 1, 1, 1, 1,
1.160149, -1.23858, 1.854385, 1, 1, 1, 1, 1,
1.165565, -0.4361762, 2.549789, 1, 1, 1, 1, 1,
1.183306, -0.3354455, 1.415892, 1, 1, 1, 1, 1,
1.183316, 0.5969535, -0.5325958, 1, 1, 1, 1, 1,
1.183946, -1.354768, 2.956755, 1, 1, 1, 1, 1,
1.184876, -0.4887495, 1.597552, 1, 1, 1, 1, 1,
1.185906, 0.294273, 3.485284, 1, 1, 1, 1, 1,
1.188594, 0.3827503, -0.3314539, 0, 0, 1, 1, 1,
1.19337, 0.2214173, 0.1635199, 1, 0, 0, 1, 1,
1.194465, -0.1475133, 2.06741, 1, 0, 0, 1, 1,
1.195016, 0.1910351, 1.830179, 1, 0, 0, 1, 1,
1.203529, 1.38318, 2.383812, 1, 0, 0, 1, 1,
1.205513, -1.159493, 2.239092, 1, 0, 0, 1, 1,
1.210142, -0.84271, 2.378252, 0, 0, 0, 1, 1,
1.211902, 1.003411, 2.713432, 0, 0, 0, 1, 1,
1.221197, -1.108287, 3.469637, 0, 0, 0, 1, 1,
1.227035, -0.1751178, 0.9092556, 0, 0, 0, 1, 1,
1.228156, 0.5343234, -1.30909, 0, 0, 0, 1, 1,
1.235801, 0.6792135, 0.6268498, 0, 0, 0, 1, 1,
1.237539, 1.495081, 1.946588, 0, 0, 0, 1, 1,
1.24268, 0.4158556, -0.6446998, 1, 1, 1, 1, 1,
1.243896, -0.491859, 1.872691, 1, 1, 1, 1, 1,
1.245922, -1.019799, 2.953972, 1, 1, 1, 1, 1,
1.246853, -0.2806371, 1.250499, 1, 1, 1, 1, 1,
1.250178, 0.3559014, 3.455437, 1, 1, 1, 1, 1,
1.254724, 0.6457889, -0.03231224, 1, 1, 1, 1, 1,
1.255801, -0.6676114, 2.398687, 1, 1, 1, 1, 1,
1.25629, -1.460777, 1.272694, 1, 1, 1, 1, 1,
1.258942, 0.2607718, 2.589827, 1, 1, 1, 1, 1,
1.264964, -0.4313952, 1.729036, 1, 1, 1, 1, 1,
1.265126, 0.3607364, 0.494824, 1, 1, 1, 1, 1,
1.265842, 0.1578184, 1.004238, 1, 1, 1, 1, 1,
1.269579, 2.003351, 0.2306337, 1, 1, 1, 1, 1,
1.29517, -1.006141, 4.499765, 1, 1, 1, 1, 1,
1.303338, -0.5929089, 2.808707, 1, 1, 1, 1, 1,
1.304915, -0.3443054, 2.689551, 0, 0, 1, 1, 1,
1.310825, 0.2625439, 1.124497, 1, 0, 0, 1, 1,
1.313361, -0.6494409, 2.564496, 1, 0, 0, 1, 1,
1.315936, 0.8710715, 0.5620855, 1, 0, 0, 1, 1,
1.320671, 1.591365, -0.1557509, 1, 0, 0, 1, 1,
1.331597, -0.4571022, 1.588312, 1, 0, 0, 1, 1,
1.345668, -0.7598326, 2.052426, 0, 0, 0, 1, 1,
1.347995, 1.440136, 0.7697542, 0, 0, 0, 1, 1,
1.351782, 0.6039391, 0.5329173, 0, 0, 0, 1, 1,
1.354238, 1.779659, -0.6295068, 0, 0, 0, 1, 1,
1.354754, -0.9569242, 2.353879, 0, 0, 0, 1, 1,
1.357657, -1.178869, 5.525268, 0, 0, 0, 1, 1,
1.359792, 1.330825, -0.2326794, 0, 0, 0, 1, 1,
1.362457, -0.9170287, 3.331317, 1, 1, 1, 1, 1,
1.363134, -2.027317, 2.57129, 1, 1, 1, 1, 1,
1.363146, -0.603066, 3.070183, 1, 1, 1, 1, 1,
1.370318, -0.7558869, 1.971139, 1, 1, 1, 1, 1,
1.378429, 0.04621324, 3.000004, 1, 1, 1, 1, 1,
1.380642, 0.2639198, 0.2429361, 1, 1, 1, 1, 1,
1.386858, 1.758876, -0.2452192, 1, 1, 1, 1, 1,
1.392072, 1.096201, -0.06754155, 1, 1, 1, 1, 1,
1.403669, -1.859699, 2.163565, 1, 1, 1, 1, 1,
1.415047, 1.411254, 0.7695079, 1, 1, 1, 1, 1,
1.423631, -0.3270798, 2.11126, 1, 1, 1, 1, 1,
1.424469, -0.100452, 1.817554, 1, 1, 1, 1, 1,
1.425205, -1.063335, 4.104675, 1, 1, 1, 1, 1,
1.458375, -0.2676536, 0.9441528, 1, 1, 1, 1, 1,
1.469213, -0.4999512, 2.386993, 1, 1, 1, 1, 1,
1.480631, 0.06193539, 2.366567, 0, 0, 1, 1, 1,
1.488642, -2.029192, 2.620501, 1, 0, 0, 1, 1,
1.492161, -0.1374317, 2.839476, 1, 0, 0, 1, 1,
1.494743, 0.4819627, 1.174843, 1, 0, 0, 1, 1,
1.499971, -1.262719, 3.450995, 1, 0, 0, 1, 1,
1.502349, 0.1152281, 1.873101, 1, 0, 0, 1, 1,
1.509456, -0.1143325, 2.370933, 0, 0, 0, 1, 1,
1.509648, 0.1572721, 1.332668, 0, 0, 0, 1, 1,
1.513795, 1.519644, -0.3902708, 0, 0, 0, 1, 1,
1.515589, 1.81063, 1.578894, 0, 0, 0, 1, 1,
1.516804, 0.6316515, 1.556204, 0, 0, 0, 1, 1,
1.543987, 1.390297, 1.061645, 0, 0, 0, 1, 1,
1.547116, 0.7524142, 0.2121916, 0, 0, 0, 1, 1,
1.583212, -0.2963027, 0.9334572, 1, 1, 1, 1, 1,
1.604863, -1.29164, 2.511917, 1, 1, 1, 1, 1,
1.616607, -0.3859554, 1.543532, 1, 1, 1, 1, 1,
1.622528, -0.2479797, 1.842428, 1, 1, 1, 1, 1,
1.628456, 0.6200118, 1.936045, 1, 1, 1, 1, 1,
1.628653, 0.08938481, 2.037263, 1, 1, 1, 1, 1,
1.629876, -0.2626779, 2.840447, 1, 1, 1, 1, 1,
1.64597, 1.063367, 1.451043, 1, 1, 1, 1, 1,
1.659295, 0.3131077, 0.6058081, 1, 1, 1, 1, 1,
1.660731, 1.246907, 0.902667, 1, 1, 1, 1, 1,
1.673177, -2.113633, 3.363859, 1, 1, 1, 1, 1,
1.687074, -0.3905539, 3.306756, 1, 1, 1, 1, 1,
1.693823, -1.928314, 1.792504, 1, 1, 1, 1, 1,
1.694082, 0.1456311, 1.077621, 1, 1, 1, 1, 1,
1.700109, -2.974564, 3.662894, 1, 1, 1, 1, 1,
1.706918, 0.9403471, 1.381174, 0, 0, 1, 1, 1,
1.752678, -2.163214, 2.045481, 1, 0, 0, 1, 1,
1.759098, -0.1592702, 1.017141, 1, 0, 0, 1, 1,
1.765956, 0.7059973, 1.269692, 1, 0, 0, 1, 1,
1.805835, -0.9725262, 1.557944, 1, 0, 0, 1, 1,
1.82253, -1.177669, 3.935088, 1, 0, 0, 1, 1,
1.830574, 0.775965, 1.878018, 0, 0, 0, 1, 1,
1.856449, -0.06759131, 2.121278, 0, 0, 0, 1, 1,
1.862455, -1.925099, 2.666438, 0, 0, 0, 1, 1,
1.864737, -0.1154609, 1.294157, 0, 0, 0, 1, 1,
1.866807, -0.6030934, 2.311995, 0, 0, 0, 1, 1,
1.885425, -1.08693, 3.867875, 0, 0, 0, 1, 1,
1.893583, 0.1081561, -0.1715661, 0, 0, 0, 1, 1,
1.947814, -1.026994, 2.75058, 1, 1, 1, 1, 1,
1.971949, 0.2457908, 1.257407, 1, 1, 1, 1, 1,
2.000799, -1.202992, 1.34288, 1, 1, 1, 1, 1,
2.014067, -0.9232838, 2.503803, 1, 1, 1, 1, 1,
2.023678, -1.162562, 2.866556, 1, 1, 1, 1, 1,
2.033738, 0.5771315, 2.073123, 1, 1, 1, 1, 1,
2.044227, -0.3336951, 1.333896, 1, 1, 1, 1, 1,
2.075687, -0.335351, 1.520375, 1, 1, 1, 1, 1,
2.090371, -0.4470684, 2.307364, 1, 1, 1, 1, 1,
2.090766, -0.5221912, 1.36253, 1, 1, 1, 1, 1,
2.096634, 1.248953, 1.100923, 1, 1, 1, 1, 1,
2.124537, -0.8869244, 2.720609, 1, 1, 1, 1, 1,
2.155616, -1.72453, 2.603936, 1, 1, 1, 1, 1,
2.184198, 1.035058, 1.079065, 1, 1, 1, 1, 1,
2.193058, -0.425459, 2.723903, 1, 1, 1, 1, 1,
2.194062, -1.282532, 1.552381, 0, 0, 1, 1, 1,
2.211101, 1.184704, 0.06007291, 1, 0, 0, 1, 1,
2.235332, -0.6234117, 2.930477, 1, 0, 0, 1, 1,
2.247239, 0.08450461, 0.7058437, 1, 0, 0, 1, 1,
2.24876, 0.3576173, 1.80174, 1, 0, 0, 1, 1,
2.249651, -0.3187091, 3.166141, 1, 0, 0, 1, 1,
2.265521, -1.058206, 2.513149, 0, 0, 0, 1, 1,
2.297288, -1.275748, 1.360286, 0, 0, 0, 1, 1,
2.336318, 0.6084263, 0.3731863, 0, 0, 0, 1, 1,
2.433438, -0.9066761, 0.9305644, 0, 0, 0, 1, 1,
2.451739, 1.26206, 2.501517, 0, 0, 0, 1, 1,
2.460558, -0.3724306, -0.8048208, 0, 0, 0, 1, 1,
2.522836, -0.2256339, 2.312428, 0, 0, 0, 1, 1,
2.539036, -2.059291, 1.860096, 1, 1, 1, 1, 1,
2.546835, -1.575028, 3.454592, 1, 1, 1, 1, 1,
2.621553, 0.5011183, 2.476312, 1, 1, 1, 1, 1,
2.79837, 1.010253, 0.8317578, 1, 1, 1, 1, 1,
2.822188, 1.187479, 0.2286543, 1, 1, 1, 1, 1,
2.839618, -0.3496368, 0.7195309, 1, 1, 1, 1, 1,
3.159767, 0.251473, 1.586917, 1, 1, 1, 1, 1
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
var radius = 9.692689;
var distance = 34.04516;
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
mvMatrix.translate( 0.2605815, -0.1630261, -0.1481338 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04516);
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
