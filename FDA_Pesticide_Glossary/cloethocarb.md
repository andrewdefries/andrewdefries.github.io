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
-2.986899, -0.793907, -1.524375, 1, 0, 0, 1,
-2.961177, 1.546304, -1.123306, 1, 0.007843138, 0, 1,
-2.865512, 0.7888036, -2.286652, 1, 0.01176471, 0, 1,
-2.718942, 0.7548709, -0.5141336, 1, 0.01960784, 0, 1,
-2.5921, -0.6985373, -3.460306, 1, 0.02352941, 0, 1,
-2.538524, 0.848484, -0.06430429, 1, 0.03137255, 0, 1,
-2.484424, -0.9584706, -2.611869, 1, 0.03529412, 0, 1,
-2.423456, -0.9399451, -2.422725, 1, 0.04313726, 0, 1,
-2.418647, -0.02174404, -3.728071, 1, 0.04705882, 0, 1,
-2.379076, -2.148792, -2.206732, 1, 0.05490196, 0, 1,
-2.284644, 0.2896125, -2.951584, 1, 0.05882353, 0, 1,
-2.281919, 0.1183763, -0.5636724, 1, 0.06666667, 0, 1,
-2.276271, -0.5480137, -0.2193541, 1, 0.07058824, 0, 1,
-2.225803, 0.5222253, -1.285643, 1, 0.07843138, 0, 1,
-2.182535, 0.2614454, -0.246225, 1, 0.08235294, 0, 1,
-2.158544, 0.8124853, -0.9290301, 1, 0.09019608, 0, 1,
-2.144252, 1.054375, -0.3114837, 1, 0.09411765, 0, 1,
-2.100779, 0.5654582, -0.6564295, 1, 0.1019608, 0, 1,
-2.097647, 0.9330828, -2.347893, 1, 0.1098039, 0, 1,
-2.052574, -0.5548818, -1.340124, 1, 0.1137255, 0, 1,
-2.033286, -0.3339908, -1.297682, 1, 0.1215686, 0, 1,
-2.012333, -0.6901122, -1.012432, 1, 0.1254902, 0, 1,
-1.998959, -0.2684916, 0.03663737, 1, 0.1333333, 0, 1,
-1.987158, 2.296899, -1.428408, 1, 0.1372549, 0, 1,
-1.963899, 0.4764268, -1.379103, 1, 0.145098, 0, 1,
-1.960551, -1.202332, -3.293679, 1, 0.1490196, 0, 1,
-1.931035, 1.136491, -1.394413, 1, 0.1568628, 0, 1,
-1.912918, -1.437898, -1.229282, 1, 0.1607843, 0, 1,
-1.908023, 2.019568, -1.617125, 1, 0.1686275, 0, 1,
-1.905387, -1.197, -2.217077, 1, 0.172549, 0, 1,
-1.898767, -1.635972, -0.5254065, 1, 0.1803922, 0, 1,
-1.887352, 0.5026583, -0.8793398, 1, 0.1843137, 0, 1,
-1.884196, -0.4659432, -2.166597, 1, 0.1921569, 0, 1,
-1.877331, -0.6397969, -0.4976266, 1, 0.1960784, 0, 1,
-1.833684, 0.673724, -4.261994, 1, 0.2039216, 0, 1,
-1.825095, -0.0122796, -2.127747, 1, 0.2117647, 0, 1,
-1.821782, 0.5648882, -1.635614, 1, 0.2156863, 0, 1,
-1.785347, 0.09983695, -2.01243, 1, 0.2235294, 0, 1,
-1.778001, -0.05961712, -1.102431, 1, 0.227451, 0, 1,
-1.777071, -0.823382, -3.689989, 1, 0.2352941, 0, 1,
-1.775802, 1.92761, -0.2868, 1, 0.2392157, 0, 1,
-1.755086, 1.025539, -2.145759, 1, 0.2470588, 0, 1,
-1.736464, 0.7034427, -1.793858, 1, 0.2509804, 0, 1,
-1.734887, 1.149513, -0.3360925, 1, 0.2588235, 0, 1,
-1.725651, 0.08667025, -0.2736416, 1, 0.2627451, 0, 1,
-1.714087, 0.3616219, 0.4757827, 1, 0.2705882, 0, 1,
-1.697837, -0.1838744, -1.390591, 1, 0.2745098, 0, 1,
-1.672242, -1.266266, -2.969214, 1, 0.282353, 0, 1,
-1.670462, 0.8513395, -0.9886537, 1, 0.2862745, 0, 1,
-1.666824, 0.2077419, -0.4238109, 1, 0.2941177, 0, 1,
-1.661086, 0.1806402, -2.660663, 1, 0.3019608, 0, 1,
-1.630277, 0.4294646, -2.425382, 1, 0.3058824, 0, 1,
-1.630242, -1.258167, -1.737245, 1, 0.3137255, 0, 1,
-1.610565, -1.344966, -2.481945, 1, 0.3176471, 0, 1,
-1.597179, 1.156285, -1.17877, 1, 0.3254902, 0, 1,
-1.593477, -1.346701, -0.362906, 1, 0.3294118, 0, 1,
-1.587796, -0.1755803, -1.436051, 1, 0.3372549, 0, 1,
-1.586401, -1.108476, -3.824097, 1, 0.3411765, 0, 1,
-1.582357, -1.172227, -1.965325, 1, 0.3490196, 0, 1,
-1.580948, 1.199288, -1.097132, 1, 0.3529412, 0, 1,
-1.577207, 0.05330538, -2.510241, 1, 0.3607843, 0, 1,
-1.567651, -0.06279881, 0.4680957, 1, 0.3647059, 0, 1,
-1.564277, 1.821317, -0.01253764, 1, 0.372549, 0, 1,
-1.55818, -0.5473691, -1.094747, 1, 0.3764706, 0, 1,
-1.536428, -0.8468665, -2.224286, 1, 0.3843137, 0, 1,
-1.536411, -0.16848, -2.064147, 1, 0.3882353, 0, 1,
-1.511141, -1.651181, -4.157254, 1, 0.3960784, 0, 1,
-1.506669, -0.2926154, -1.755715, 1, 0.4039216, 0, 1,
-1.494497, -0.1181701, -1.729086, 1, 0.4078431, 0, 1,
-1.488836, -1.193251, -1.964793, 1, 0.4156863, 0, 1,
-1.48435, 0.04885105, -0.7933915, 1, 0.4196078, 0, 1,
-1.471808, 0.5896268, -1.1576, 1, 0.427451, 0, 1,
-1.470396, 0.04482302, -1.618552, 1, 0.4313726, 0, 1,
-1.455071, -1.443714, -3.581051, 1, 0.4392157, 0, 1,
-1.454444, 0.456485, -1.07542, 1, 0.4431373, 0, 1,
-1.438273, -0.5117261, -2.679026, 1, 0.4509804, 0, 1,
-1.43794, -2.030681, -1.728808, 1, 0.454902, 0, 1,
-1.434228, -0.1137835, -1.792329, 1, 0.4627451, 0, 1,
-1.429499, 0.1535282, -2.39756, 1, 0.4666667, 0, 1,
-1.428804, 1.592305, -2.75762, 1, 0.4745098, 0, 1,
-1.427466, -1.670223, -2.889766, 1, 0.4784314, 0, 1,
-1.419124, 0.3404334, -0.6445705, 1, 0.4862745, 0, 1,
-1.411345, -0.7708247, -1.611946, 1, 0.4901961, 0, 1,
-1.406528, -1.161926, -1.271432, 1, 0.4980392, 0, 1,
-1.397717, -0.009901132, -1.598538, 1, 0.5058824, 0, 1,
-1.393272, -1.036396, -3.589998, 1, 0.509804, 0, 1,
-1.392927, 0.3003589, -1.966622, 1, 0.5176471, 0, 1,
-1.385545, 0.8129272, -1.08841, 1, 0.5215687, 0, 1,
-1.370873, 2.420528, -0.5742804, 1, 0.5294118, 0, 1,
-1.362223, 0.2710448, -2.280751, 1, 0.5333334, 0, 1,
-1.360938, -2.728662, -3.617167, 1, 0.5411765, 0, 1,
-1.359035, 1.088354, -1.472489, 1, 0.5450981, 0, 1,
-1.345852, -0.6115471, -3.121811, 1, 0.5529412, 0, 1,
-1.326072, 0.3872841, -1.28877, 1, 0.5568628, 0, 1,
-1.325797, -0.03730574, -0.1208531, 1, 0.5647059, 0, 1,
-1.324613, -0.6346902, 0.2374662, 1, 0.5686275, 0, 1,
-1.324502, -0.1387726, -3.02937, 1, 0.5764706, 0, 1,
-1.323696, -1.229217, -4.904047, 1, 0.5803922, 0, 1,
-1.311972, -0.05598352, -1.913918, 1, 0.5882353, 0, 1,
-1.309641, 0.5675066, -1.014355, 1, 0.5921569, 0, 1,
-1.299469, -0.2225134, -2.256114, 1, 0.6, 0, 1,
-1.279019, -0.9861639, -1.168386, 1, 0.6078432, 0, 1,
-1.268736, -2.251386, -3.803363, 1, 0.6117647, 0, 1,
-1.267394, 0.9786333, -0.2744767, 1, 0.6196079, 0, 1,
-1.258286, -1.074625, -3.277608, 1, 0.6235294, 0, 1,
-1.255481, -1.3021, -2.793431, 1, 0.6313726, 0, 1,
-1.244384, -0.4445592, -1.870112, 1, 0.6352941, 0, 1,
-1.223241, -0.52364, -0.7457647, 1, 0.6431373, 0, 1,
-1.220927, 0.6997505, -2.052315, 1, 0.6470588, 0, 1,
-1.215183, -0.9366983, -3.758588, 1, 0.654902, 0, 1,
-1.198075, -1.295785, -2.726562, 1, 0.6588235, 0, 1,
-1.193306, 0.462423, -0.7806444, 1, 0.6666667, 0, 1,
-1.188633, 0.7441188, -2.250734, 1, 0.6705883, 0, 1,
-1.175275, 0.2081505, -2.933921, 1, 0.6784314, 0, 1,
-1.175252, -0.7986336, -2.96354, 1, 0.682353, 0, 1,
-1.174748, 0.1689294, -2.592999, 1, 0.6901961, 0, 1,
-1.167901, 1.759925, -2.862896, 1, 0.6941177, 0, 1,
-1.167882, 0.6239325, 0.3951641, 1, 0.7019608, 0, 1,
-1.159837, 0.2075719, -1.084857, 1, 0.7098039, 0, 1,
-1.158063, -0.9482802, -3.60585, 1, 0.7137255, 0, 1,
-1.155383, 0.7880964, -0.5096301, 1, 0.7215686, 0, 1,
-1.148513, -0.8890439, -2.289295, 1, 0.7254902, 0, 1,
-1.146179, -0.6331154, -1.81551, 1, 0.7333333, 0, 1,
-1.140121, 1.226779, 0.1221947, 1, 0.7372549, 0, 1,
-1.13234, -1.113664, -3.085406, 1, 0.7450981, 0, 1,
-1.127888, 0.7918715, -1.654594, 1, 0.7490196, 0, 1,
-1.120389, 0.1709397, -0.421431, 1, 0.7568628, 0, 1,
-1.116822, -0.8839155, -2.360898, 1, 0.7607843, 0, 1,
-1.087594, 0.04603237, -1.995341, 1, 0.7686275, 0, 1,
-1.083046, -0.8715791, -2.591641, 1, 0.772549, 0, 1,
-1.070843, 1.489091, -1.082079, 1, 0.7803922, 0, 1,
-1.059028, -0.9941403, -2.237538, 1, 0.7843137, 0, 1,
-1.056973, -0.02416435, -0.9617404, 1, 0.7921569, 0, 1,
-1.055351, -1.535097, -2.528201, 1, 0.7960784, 0, 1,
-1.052284, -1.297526, -1.95273, 1, 0.8039216, 0, 1,
-1.051143, -0.9782106, -2.088101, 1, 0.8117647, 0, 1,
-1.038641, -0.5912027, -1.454261, 1, 0.8156863, 0, 1,
-1.035934, -0.4758741, -2.287298, 1, 0.8235294, 0, 1,
-1.03329, -0.05652904, -2.27631, 1, 0.827451, 0, 1,
-1.031047, -0.1401818, -1.487987, 1, 0.8352941, 0, 1,
-1.02653, 0.5405115, 0.09211072, 1, 0.8392157, 0, 1,
-1.023173, 0.1837073, -0.6608812, 1, 0.8470588, 0, 1,
-1.019533, 0.578456, 0.7340648, 1, 0.8509804, 0, 1,
-1.017879, -0.9151502, -1.370112, 1, 0.8588235, 0, 1,
-1.014451, 0.5827736, -2.294545, 1, 0.8627451, 0, 1,
-1.010157, -0.1804942, -0.8165616, 1, 0.8705882, 0, 1,
-1.006713, 0.7258667, 0.009326285, 1, 0.8745098, 0, 1,
-1.003828, -1.207926, -1.720681, 1, 0.8823529, 0, 1,
-1.003574, 0.8437808, -1.777543, 1, 0.8862745, 0, 1,
-0.9979275, -0.5823687, -0.4451976, 1, 0.8941177, 0, 1,
-0.9955906, 0.1853424, -3.043553, 1, 0.8980392, 0, 1,
-0.9941801, -0.2725719, -1.885582, 1, 0.9058824, 0, 1,
-0.9902138, -0.5658779, -1.053031, 1, 0.9137255, 0, 1,
-0.9889029, 1.501636, -2.297254, 1, 0.9176471, 0, 1,
-0.9754189, 1.288144, 0.1040994, 1, 0.9254902, 0, 1,
-0.9674252, 1.589431, -0.213447, 1, 0.9294118, 0, 1,
-0.9672912, -1.165915, -4.449551, 1, 0.9372549, 0, 1,
-0.9637518, 0.7989076, 1.810377, 1, 0.9411765, 0, 1,
-0.9631714, 0.907398, -0.5884454, 1, 0.9490196, 0, 1,
-0.9558387, -0.6371149, -2.925506, 1, 0.9529412, 0, 1,
-0.9462645, 0.592369, -1.958206, 1, 0.9607843, 0, 1,
-0.9420443, 2.609675, -0.7881256, 1, 0.9647059, 0, 1,
-0.9306807, 0.3445472, -2.069515, 1, 0.972549, 0, 1,
-0.9292049, 0.381631, -0.8294585, 1, 0.9764706, 0, 1,
-0.9198071, -0.1434311, -1.86524, 1, 0.9843137, 0, 1,
-0.9186915, 0.5548642, 0.2162752, 1, 0.9882353, 0, 1,
-0.9184683, -0.7525067, -2.676057, 1, 0.9960784, 0, 1,
-0.9151214, -0.3288547, -2.74332, 0.9960784, 1, 0, 1,
-0.9137477, -1.521139, -2.159501, 0.9921569, 1, 0, 1,
-0.9065525, 0.2352928, -2.937718, 0.9843137, 1, 0, 1,
-0.9035197, 1.551915, -1.824977, 0.9803922, 1, 0, 1,
-0.9023002, 0.1532971, -3.267949, 0.972549, 1, 0, 1,
-0.9012117, -0.1418398, -0.1848555, 0.9686275, 1, 0, 1,
-0.8985938, 0.5543268, -0.09979976, 0.9607843, 1, 0, 1,
-0.8972308, -0.1956267, 0.3896308, 0.9568627, 1, 0, 1,
-0.8963054, 0.01952219, -1.507746, 0.9490196, 1, 0, 1,
-0.8933005, -0.5766679, -4.310665, 0.945098, 1, 0, 1,
-0.8864273, -0.6098811, -1.125825, 0.9372549, 1, 0, 1,
-0.8856238, -0.6165918, -2.817297, 0.9333333, 1, 0, 1,
-0.8825583, -0.6117178, -3.739207, 0.9254902, 1, 0, 1,
-0.8824774, -2.33299, -2.763476, 0.9215686, 1, 0, 1,
-0.8800399, -0.1857255, -4.132677, 0.9137255, 1, 0, 1,
-0.8710008, -1.349563, -3.451471, 0.9098039, 1, 0, 1,
-0.8706406, 0.4805589, -0.7294669, 0.9019608, 1, 0, 1,
-0.8698891, 0.0903079, -1.194464, 0.8941177, 1, 0, 1,
-0.8689247, 1.102692, -1.120016, 0.8901961, 1, 0, 1,
-0.8652617, 1.462426, -1.509729, 0.8823529, 1, 0, 1,
-0.8609984, -1.747521, -4.035208, 0.8784314, 1, 0, 1,
-0.8609685, 0.0305735, -0.9933717, 0.8705882, 1, 0, 1,
-0.8555309, -0.5810301, -2.166933, 0.8666667, 1, 0, 1,
-0.8546203, -0.3199849, -1.953652, 0.8588235, 1, 0, 1,
-0.8447905, -0.3662716, -2.131302, 0.854902, 1, 0, 1,
-0.8427002, -1.445081, -3.491363, 0.8470588, 1, 0, 1,
-0.8276407, 0.4155693, -1.156635, 0.8431373, 1, 0, 1,
-0.8185611, 1.0705, -0.7300749, 0.8352941, 1, 0, 1,
-0.8173601, -0.5166726, -1.938722, 0.8313726, 1, 0, 1,
-0.8150154, 2.129767, -0.6700559, 0.8235294, 1, 0, 1,
-0.8118472, -1.435575, -2.240615, 0.8196079, 1, 0, 1,
-0.8112071, -0.7427247, -2.635377, 0.8117647, 1, 0, 1,
-0.8099485, 1.580412, 0.5631946, 0.8078431, 1, 0, 1,
-0.8080872, -1.177542, -2.590213, 0.8, 1, 0, 1,
-0.8061832, 1.619642, -1.575514, 0.7921569, 1, 0, 1,
-0.8053304, -1.811112, -2.264432, 0.7882353, 1, 0, 1,
-0.8044137, 1.340787, -0.3459699, 0.7803922, 1, 0, 1,
-0.7967268, -0.664919, -3.209152, 0.7764706, 1, 0, 1,
-0.7933941, -2.477507, -2.723795, 0.7686275, 1, 0, 1,
-0.7908825, 0.138805, -3.018487, 0.7647059, 1, 0, 1,
-0.7873775, 0.5910773, -2.440629, 0.7568628, 1, 0, 1,
-0.786846, 2.093097, -1.885444, 0.7529412, 1, 0, 1,
-0.7834377, -0.07909387, -2.069267, 0.7450981, 1, 0, 1,
-0.778996, 2.283887, 1.193458, 0.7411765, 1, 0, 1,
-0.7664738, -0.2646716, -2.142039, 0.7333333, 1, 0, 1,
-0.7660722, -0.9743351, -0.4189386, 0.7294118, 1, 0, 1,
-0.7630136, -0.5693046, -3.603673, 0.7215686, 1, 0, 1,
-0.7630134, 1.898627, 0.7797411, 0.7176471, 1, 0, 1,
-0.761146, 0.6347003, -0.4521006, 0.7098039, 1, 0, 1,
-0.757929, 0.05392674, -2.769295, 0.7058824, 1, 0, 1,
-0.7568882, 1.799799, 1.054409, 0.6980392, 1, 0, 1,
-0.7544841, -1.554477, -3.066761, 0.6901961, 1, 0, 1,
-0.753051, -1.088062, -1.792224, 0.6862745, 1, 0, 1,
-0.7521697, -0.4207873, -1.857891, 0.6784314, 1, 0, 1,
-0.7487537, 1.715804, -0.9571388, 0.6745098, 1, 0, 1,
-0.7450731, 0.4785092, 0.004386702, 0.6666667, 1, 0, 1,
-0.7448227, 0.3438836, -0.7426497, 0.6627451, 1, 0, 1,
-0.7375091, 0.05540886, -1.63069, 0.654902, 1, 0, 1,
-0.7374206, -0.8941173, -1.957227, 0.6509804, 1, 0, 1,
-0.7353655, -0.1567236, -0.9264139, 0.6431373, 1, 0, 1,
-0.7320135, 0.2958059, -1.143275, 0.6392157, 1, 0, 1,
-0.7271264, -1.027763, -1.014567, 0.6313726, 1, 0, 1,
-0.7198039, -1.047626, -3.116606, 0.627451, 1, 0, 1,
-0.7192808, 0.7696947, -1.151922, 0.6196079, 1, 0, 1,
-0.7100683, -0.8698762, -2.169582, 0.6156863, 1, 0, 1,
-0.7089302, 0.5218105, -2.118807, 0.6078432, 1, 0, 1,
-0.7079543, -0.1413721, -0.81883, 0.6039216, 1, 0, 1,
-0.702047, 0.6908258, 0.05323685, 0.5960785, 1, 0, 1,
-0.7001842, -1.408276, -1.972739, 0.5882353, 1, 0, 1,
-0.6981902, 0.4571301, -0.9887862, 0.5843138, 1, 0, 1,
-0.6914054, 1.683529, -0.3335058, 0.5764706, 1, 0, 1,
-0.6879771, -1.68343, -2.368775, 0.572549, 1, 0, 1,
-0.6847779, -0.1718192, -1.429075, 0.5647059, 1, 0, 1,
-0.6803702, -0.4416701, -2.976112, 0.5607843, 1, 0, 1,
-0.6745946, -1.443689, -2.914939, 0.5529412, 1, 0, 1,
-0.6718312, 1.327102, -1.998471, 0.5490196, 1, 0, 1,
-0.6685793, -0.3767787, -0.7352743, 0.5411765, 1, 0, 1,
-0.667391, -1.395166, -0.8103499, 0.5372549, 1, 0, 1,
-0.6665511, -0.3529874, -2.072862, 0.5294118, 1, 0, 1,
-0.6653886, -1.968673, -1.719911, 0.5254902, 1, 0, 1,
-0.665055, 0.6808825, -0.3944874, 0.5176471, 1, 0, 1,
-0.6650391, 0.4283184, -0.2835718, 0.5137255, 1, 0, 1,
-0.6626189, -1.339012, -2.697289, 0.5058824, 1, 0, 1,
-0.6598006, -1.498309, -2.428361, 0.5019608, 1, 0, 1,
-0.6588188, 0.008609185, -1.007764, 0.4941176, 1, 0, 1,
-0.6586521, 0.3303324, -3.623669, 0.4862745, 1, 0, 1,
-0.6434783, -1.584813, -2.830775, 0.4823529, 1, 0, 1,
-0.6396735, 0.1023161, -1.49969, 0.4745098, 1, 0, 1,
-0.6389725, -1.541257, -2.672459, 0.4705882, 1, 0, 1,
-0.6384205, 0.6898537, -3.009883, 0.4627451, 1, 0, 1,
-0.6373856, -1.185674, -2.6924, 0.4588235, 1, 0, 1,
-0.6362696, 1.534402, -0.3458027, 0.4509804, 1, 0, 1,
-0.6358032, 0.8458369, -0.6333352, 0.4470588, 1, 0, 1,
-0.6251799, 0.1769666, -0.6540166, 0.4392157, 1, 0, 1,
-0.6219451, 1.241104, -1.060049, 0.4352941, 1, 0, 1,
-0.6212755, -0.3164096, -0.4271223, 0.427451, 1, 0, 1,
-0.6198216, 0.1059652, -2.169192, 0.4235294, 1, 0, 1,
-0.6190915, -0.9790507, -3.658955, 0.4156863, 1, 0, 1,
-0.6183047, 0.7467925, -0.05383392, 0.4117647, 1, 0, 1,
-0.6171896, 1.697697, 0.1591839, 0.4039216, 1, 0, 1,
-0.6062559, 1.355942, 0.2754203, 0.3960784, 1, 0, 1,
-0.6054361, -0.1125362, -0.8425681, 0.3921569, 1, 0, 1,
-0.603694, -0.1864046, -2.667759, 0.3843137, 1, 0, 1,
-0.599787, -0.81015, -0.8700212, 0.3803922, 1, 0, 1,
-0.5985447, -1.315671, -2.660947, 0.372549, 1, 0, 1,
-0.5983559, 0.9096652, -1.584088, 0.3686275, 1, 0, 1,
-0.5977762, 0.5011805, -1.044125, 0.3607843, 1, 0, 1,
-0.5869021, 0.08820312, -0.253963, 0.3568628, 1, 0, 1,
-0.5844633, 0.296527, -0.2948395, 0.3490196, 1, 0, 1,
-0.5829883, -2.573575, -4.748534, 0.345098, 1, 0, 1,
-0.5803442, -0.4497758, -2.719817, 0.3372549, 1, 0, 1,
-0.5773779, 0.6817136, 0.02074986, 0.3333333, 1, 0, 1,
-0.5740553, -2.131702, -2.513184, 0.3254902, 1, 0, 1,
-0.5687507, 0.2862974, -0.2694836, 0.3215686, 1, 0, 1,
-0.5680629, -0.6435226, -1.372392, 0.3137255, 1, 0, 1,
-0.5679795, -2.012268, -3.408845, 0.3098039, 1, 0, 1,
-0.5604419, 0.8539181, 2.389402, 0.3019608, 1, 0, 1,
-0.5572877, 0.05502147, -1.985554, 0.2941177, 1, 0, 1,
-0.5489141, 1.861827, -0.7806106, 0.2901961, 1, 0, 1,
-0.5461354, 0.9783653, 0.1503715, 0.282353, 1, 0, 1,
-0.5455841, 1.451783, -1.144904, 0.2784314, 1, 0, 1,
-0.5445221, -0.3967984, -4.529199, 0.2705882, 1, 0, 1,
-0.5315166, -0.8447394, -1.734857, 0.2666667, 1, 0, 1,
-0.5299093, -1.446838, -1.979749, 0.2588235, 1, 0, 1,
-0.5295753, -0.8783503, -3.523527, 0.254902, 1, 0, 1,
-0.5294859, -0.2978019, -2.876084, 0.2470588, 1, 0, 1,
-0.5289688, 0.9724218, -1.098987, 0.2431373, 1, 0, 1,
-0.5205147, 2.004816, 0.9145873, 0.2352941, 1, 0, 1,
-0.5145786, -0.06552095, -1.577552, 0.2313726, 1, 0, 1,
-0.5080329, 0.1848447, 0.07412847, 0.2235294, 1, 0, 1,
-0.5069613, 0.6160998, -2.695379, 0.2196078, 1, 0, 1,
-0.5041565, -1.473957, -2.738812, 0.2117647, 1, 0, 1,
-0.5018815, -1.054956, -2.613171, 0.2078431, 1, 0, 1,
-0.5012022, -1.165909, -4.074588, 0.2, 1, 0, 1,
-0.5001856, -0.5109779, 0.09984418, 0.1921569, 1, 0, 1,
-0.4966996, 0.2210111, -1.667665, 0.1882353, 1, 0, 1,
-0.48927, 0.3393443, -1.23999, 0.1803922, 1, 0, 1,
-0.4846693, -0.8237365, -2.889717, 0.1764706, 1, 0, 1,
-0.4813669, -0.7928093, -1.196867, 0.1686275, 1, 0, 1,
-0.4810504, -0.3536904, -4.140304, 0.1647059, 1, 0, 1,
-0.4793712, -1.45885, -3.409384, 0.1568628, 1, 0, 1,
-0.4783498, 1.083686, -0.6434003, 0.1529412, 1, 0, 1,
-0.4568764, -0.7030985, -3.119045, 0.145098, 1, 0, 1,
-0.4514285, -0.4061397, -1.994444, 0.1411765, 1, 0, 1,
-0.4489747, 0.8059121, -0.7878035, 0.1333333, 1, 0, 1,
-0.4480287, 0.8159848, 0.6744292, 0.1294118, 1, 0, 1,
-0.4439663, 0.4362595, -0.5826571, 0.1215686, 1, 0, 1,
-0.4415961, -0.846234, -1.420521, 0.1176471, 1, 0, 1,
-0.4392052, 0.1576561, -1.128507, 0.1098039, 1, 0, 1,
-0.4381743, -1.356358, -1.301274, 0.1058824, 1, 0, 1,
-0.4356799, -0.1173748, -2.842591, 0.09803922, 1, 0, 1,
-0.4323011, 0.787623, 0.179011, 0.09019608, 1, 0, 1,
-0.4318586, 0.5284862, -1.08707, 0.08627451, 1, 0, 1,
-0.4305848, 0.4869178, 0.3900041, 0.07843138, 1, 0, 1,
-0.4261824, 0.4601431, -0.3936461, 0.07450981, 1, 0, 1,
-0.4255632, -0.1130705, -0.439396, 0.06666667, 1, 0, 1,
-0.4188923, -0.1645914, -2.374108, 0.0627451, 1, 0, 1,
-0.4174759, -0.09516753, -0.8276523, 0.05490196, 1, 0, 1,
-0.4168554, -0.5796055, -2.944151, 0.05098039, 1, 0, 1,
-0.4100971, 0.1353673, -0.7487953, 0.04313726, 1, 0, 1,
-0.40995, -0.01411478, -1.954081, 0.03921569, 1, 0, 1,
-0.4060386, -0.733808, -2.075821, 0.03137255, 1, 0, 1,
-0.405652, -1.152529, -1.087226, 0.02745098, 1, 0, 1,
-0.400454, 1.439727, -2.074785, 0.01960784, 1, 0, 1,
-0.3969881, -0.7003747, -1.673944, 0.01568628, 1, 0, 1,
-0.3921643, -0.6262208, -3.74316, 0.007843138, 1, 0, 1,
-0.3913689, -0.2740289, -1.416297, 0.003921569, 1, 0, 1,
-0.3875192, -1.765711, -4.356991, 0, 1, 0.003921569, 1,
-0.3874936, 0.300608, -1.095851, 0, 1, 0.01176471, 1,
-0.3868759, 0.7565135, -0.5896694, 0, 1, 0.01568628, 1,
-0.3866621, 0.8016, -1.323475, 0, 1, 0.02352941, 1,
-0.3784051, -0.2827726, -2.318442, 0, 1, 0.02745098, 1,
-0.377983, -0.218073, -3.436271, 0, 1, 0.03529412, 1,
-0.3768676, -1.490279, -2.928653, 0, 1, 0.03921569, 1,
-0.3712577, 1.086881, -1.331728, 0, 1, 0.04705882, 1,
-0.3709497, -0.2409769, -3.189999, 0, 1, 0.05098039, 1,
-0.370285, -0.1621855, -3.409711, 0, 1, 0.05882353, 1,
-0.3683476, 0.5380937, 1.000727, 0, 1, 0.0627451, 1,
-0.3650674, 0.7165118, -0.7049105, 0, 1, 0.07058824, 1,
-0.3610245, -0.3848552, -3.118176, 0, 1, 0.07450981, 1,
-0.3598126, 0.1398806, -1.628546, 0, 1, 0.08235294, 1,
-0.3593376, 1.023893, 0.9854901, 0, 1, 0.08627451, 1,
-0.3591617, -0.1043099, -1.128883, 0, 1, 0.09411765, 1,
-0.3506753, -0.1499086, -3.43949, 0, 1, 0.1019608, 1,
-0.3484721, -1.478582, -4.262568, 0, 1, 0.1058824, 1,
-0.3440197, -0.86886, -3.42714, 0, 1, 0.1137255, 1,
-0.3410105, -1.079285, -2.3195, 0, 1, 0.1176471, 1,
-0.3368988, -1.972855, -1.837277, 0, 1, 0.1254902, 1,
-0.3350082, -1.012344, -2.327305, 0, 1, 0.1294118, 1,
-0.334021, 0.7145616, -0.9440795, 0, 1, 0.1372549, 1,
-0.3299095, -2.442194, -2.070445, 0, 1, 0.1411765, 1,
-0.3255703, -0.3966063, -2.162876, 0, 1, 0.1490196, 1,
-0.3221742, 2.30002, 1.334231, 0, 1, 0.1529412, 1,
-0.3194546, 0.5524058, 0.8692396, 0, 1, 0.1607843, 1,
-0.3121762, 0.5236084, -0.5603141, 0, 1, 0.1647059, 1,
-0.3104639, -1.425278, -3.364587, 0, 1, 0.172549, 1,
-0.3064258, 1.470925, -0.01014922, 0, 1, 0.1764706, 1,
-0.3060724, -0.8917283, -4.816577, 0, 1, 0.1843137, 1,
-0.3031527, -0.3524767, -2.702128, 0, 1, 0.1882353, 1,
-0.3009556, 0.1485856, -1.984049, 0, 1, 0.1960784, 1,
-0.2999896, -0.1428928, -1.081857, 0, 1, 0.2039216, 1,
-0.2998911, -0.2666791, -3.452682, 0, 1, 0.2078431, 1,
-0.2942637, 0.5720558, -2.155683, 0, 1, 0.2156863, 1,
-0.2936355, -0.5533809, -2.309941, 0, 1, 0.2196078, 1,
-0.290018, -2.107032, -3.914865, 0, 1, 0.227451, 1,
-0.2841231, 0.09699386, 0.5755016, 0, 1, 0.2313726, 1,
-0.2801771, 0.4282064, -0.3712903, 0, 1, 0.2392157, 1,
-0.2766314, -0.2208744, -3.142697, 0, 1, 0.2431373, 1,
-0.2743123, -1.35276, -4.090053, 0, 1, 0.2509804, 1,
-0.2670591, -1.182821, -5.191243, 0, 1, 0.254902, 1,
-0.2666, -0.4118264, -4.681262, 0, 1, 0.2627451, 1,
-0.2642179, -0.7812409, -0.4563765, 0, 1, 0.2666667, 1,
-0.2641604, -0.2183215, -2.555618, 0, 1, 0.2745098, 1,
-0.2515576, 2.091237, -0.6064219, 0, 1, 0.2784314, 1,
-0.2490354, 0.6897783, -0.2972217, 0, 1, 0.2862745, 1,
-0.2489984, 0.2075039, 0.2796703, 0, 1, 0.2901961, 1,
-0.244975, -0.3969283, -2.378291, 0, 1, 0.2980392, 1,
-0.2437465, -0.04873766, -1.437626, 0, 1, 0.3058824, 1,
-0.2430618, 0.2762354, 0.190311, 0, 1, 0.3098039, 1,
-0.2415512, -1.076274, -3.018193, 0, 1, 0.3176471, 1,
-0.2411016, 0.332109, 1.555752, 0, 1, 0.3215686, 1,
-0.2406696, 0.5575983, -1.218124, 0, 1, 0.3294118, 1,
-0.2385847, -0.2002805, -3.075087, 0, 1, 0.3333333, 1,
-0.2356429, 2.389719, -2.473911, 0, 1, 0.3411765, 1,
-0.2315327, 1.218835, 0.1149345, 0, 1, 0.345098, 1,
-0.2290782, 0.3257318, 0.3039214, 0, 1, 0.3529412, 1,
-0.228435, 0.3396031, 1.161424, 0, 1, 0.3568628, 1,
-0.2257269, 0.6348739, -0.5600737, 0, 1, 0.3647059, 1,
-0.2236073, -2.268001, -3.326636, 0, 1, 0.3686275, 1,
-0.215689, -0.473542, -3.033794, 0, 1, 0.3764706, 1,
-0.2130725, -0.3066403, -2.86184, 0, 1, 0.3803922, 1,
-0.2129525, 0.1303753, -0.791632, 0, 1, 0.3882353, 1,
-0.2118002, 1.269142, 1.30391, 0, 1, 0.3921569, 1,
-0.2084866, 0.4252663, 1.533287, 0, 1, 0.4, 1,
-0.2073132, -1.112177, -4.245443, 0, 1, 0.4078431, 1,
-0.206974, 1.041387, -0.09797153, 0, 1, 0.4117647, 1,
-0.206749, 0.649442, -0.7328129, 0, 1, 0.4196078, 1,
-0.2048041, -0.004917409, -0.9544839, 0, 1, 0.4235294, 1,
-0.2035657, -0.07087234, -3.395498, 0, 1, 0.4313726, 1,
-0.2021374, -0.3935608, -3.526091, 0, 1, 0.4352941, 1,
-0.1925839, 0.4163854, -1.751308, 0, 1, 0.4431373, 1,
-0.1913995, 1.047226, 0.1894294, 0, 1, 0.4470588, 1,
-0.1895226, -0.455231, -3.556976, 0, 1, 0.454902, 1,
-0.1891497, -0.9645442, -3.114722, 0, 1, 0.4588235, 1,
-0.1884997, 1.730982, -0.323097, 0, 1, 0.4666667, 1,
-0.1856113, -0.1977375, -2.760266, 0, 1, 0.4705882, 1,
-0.1821562, -0.8182523, -2.572782, 0, 1, 0.4784314, 1,
-0.1790712, -0.9523261, -3.426654, 0, 1, 0.4823529, 1,
-0.1764267, -0.2729006, -2.938202, 0, 1, 0.4901961, 1,
-0.174123, 0.8445119, 0.5918754, 0, 1, 0.4941176, 1,
-0.1711338, -0.2128371, -2.71548, 0, 1, 0.5019608, 1,
-0.1679417, 0.09612, -1.237718, 0, 1, 0.509804, 1,
-0.1656818, -2.853496, -3.13881, 0, 1, 0.5137255, 1,
-0.1649257, -1.332834, -1.667063, 0, 1, 0.5215687, 1,
-0.1606918, -0.8234224, -2.568932, 0, 1, 0.5254902, 1,
-0.1586711, -0.6579801, -2.152589, 0, 1, 0.5333334, 1,
-0.1431812, -1.016328, -2.457572, 0, 1, 0.5372549, 1,
-0.1407742, -0.8425111, -1.527247, 0, 1, 0.5450981, 1,
-0.1359506, 1.315484, 0.7349703, 0, 1, 0.5490196, 1,
-0.1342443, -1.099869, -3.885761, 0, 1, 0.5568628, 1,
-0.1332204, -0.6197892, -3.474053, 0, 1, 0.5607843, 1,
-0.1286981, 0.6009864, -0.4440412, 0, 1, 0.5686275, 1,
-0.1272586, 1.236419, 1.805728, 0, 1, 0.572549, 1,
-0.1182201, 0.9909906, 1.141378, 0, 1, 0.5803922, 1,
-0.1172272, -0.8831407, -2.520355, 0, 1, 0.5843138, 1,
-0.1112126, -0.9077884, -3.561234, 0, 1, 0.5921569, 1,
-0.1031578, -0.8086794, -4.510498, 0, 1, 0.5960785, 1,
-0.1018122, 0.7270596, 0.3396204, 0, 1, 0.6039216, 1,
-0.1011705, 1.250278, 0.6231767, 0, 1, 0.6117647, 1,
-0.0989116, 0.1047931, 0.246427, 0, 1, 0.6156863, 1,
-0.09179609, -0.0560543, -1.914519, 0, 1, 0.6235294, 1,
-0.08785303, 2.000212, -1.524885, 0, 1, 0.627451, 1,
-0.08678596, 2.302385, 0.03318696, 0, 1, 0.6352941, 1,
-0.08658133, -0.6881213, -3.022072, 0, 1, 0.6392157, 1,
-0.08628461, 1.929337, 0.8045592, 0, 1, 0.6470588, 1,
-0.08075434, 1.79051, -1.388617, 0, 1, 0.6509804, 1,
-0.07853337, -0.464119, -2.536867, 0, 1, 0.6588235, 1,
-0.07844592, -0.793128, -1.46293, 0, 1, 0.6627451, 1,
-0.07176432, -1.35827, -3.936413, 0, 1, 0.6705883, 1,
-0.06543787, 0.9910166, -0.474618, 0, 1, 0.6745098, 1,
-0.06334205, -2.239332, -2.500349, 0, 1, 0.682353, 1,
-0.05729683, 2.112443, 0.9305178, 0, 1, 0.6862745, 1,
-0.05441408, -1.023929, -3.993926, 0, 1, 0.6941177, 1,
-0.05067329, -1.935116, -4.668295, 0, 1, 0.7019608, 1,
-0.05033858, 1.355069, -0.4443935, 0, 1, 0.7058824, 1,
-0.04722998, 1.475514, -1.464051, 0, 1, 0.7137255, 1,
-0.04337957, -0.1315375, -3.038063, 0, 1, 0.7176471, 1,
-0.04238794, -1.106575, -2.526834, 0, 1, 0.7254902, 1,
-0.04232436, 0.8153196, -1.080958, 0, 1, 0.7294118, 1,
-0.0406368, -0.7971314, -2.524717, 0, 1, 0.7372549, 1,
-0.03984699, 0.3458175, 0.04684267, 0, 1, 0.7411765, 1,
-0.03974205, -1.199734, -4.088529, 0, 1, 0.7490196, 1,
-0.03925078, -0.4201782, -3.112473, 0, 1, 0.7529412, 1,
-0.03497429, 0.6246888, -0.2282259, 0, 1, 0.7607843, 1,
-0.0319031, 1.104233, -0.9285083, 0, 1, 0.7647059, 1,
-0.02801759, -0.5616316, -4.644795, 0, 1, 0.772549, 1,
-0.02800666, -1.250088, -2.336001, 0, 1, 0.7764706, 1,
-0.02548379, 1.205724, 1.438736, 0, 1, 0.7843137, 1,
-0.02395741, 0.01120313, -1.603201, 0, 1, 0.7882353, 1,
-0.01803656, -0.3967967, -3.627145, 0, 1, 0.7960784, 1,
-0.01315174, -0.1923262, -2.868255, 0, 1, 0.8039216, 1,
-0.00836804, -2.139868, -2.935314, 0, 1, 0.8078431, 1,
-0.005955389, 0.3090115, 0.4088631, 0, 1, 0.8156863, 1,
0.001837955, 0.02930263, -0.7041246, 0, 1, 0.8196079, 1,
0.002296159, 0.0976532, -1.034734, 0, 1, 0.827451, 1,
0.003555604, -0.5964009, 3.582186, 0, 1, 0.8313726, 1,
0.009903509, 0.2792184, 0.5354823, 0, 1, 0.8392157, 1,
0.01008748, -0.3369818, 3.508927, 0, 1, 0.8431373, 1,
0.0104361, 2.433471, -1.025187, 0, 1, 0.8509804, 1,
0.01104824, 0.4247175, 0.5986589, 0, 1, 0.854902, 1,
0.01274199, -0.8942924, 4.448723, 0, 1, 0.8627451, 1,
0.01587, 1.022765, -0.5363547, 0, 1, 0.8666667, 1,
0.01858051, -0.2619645, 2.526489, 0, 1, 0.8745098, 1,
0.01893298, 0.9790616, 1.51853, 0, 1, 0.8784314, 1,
0.02138694, -0.0815324, 3.319089, 0, 1, 0.8862745, 1,
0.02405092, -0.7887657, 2.842425, 0, 1, 0.8901961, 1,
0.02685869, -0.003928777, 0.909162, 0, 1, 0.8980392, 1,
0.02834398, -0.4936663, 2.979264, 0, 1, 0.9058824, 1,
0.02847471, 0.9639026, -0.9759489, 0, 1, 0.9098039, 1,
0.02939631, 0.004879029, 2.34432, 0, 1, 0.9176471, 1,
0.03211616, -0.4202993, 2.797408, 0, 1, 0.9215686, 1,
0.03288047, 0.495792, -1.429174, 0, 1, 0.9294118, 1,
0.03369823, -0.1964415, 3.213255, 0, 1, 0.9333333, 1,
0.03492184, 1.506462, -2.218319, 0, 1, 0.9411765, 1,
0.03706845, -1.822749, 2.490362, 0, 1, 0.945098, 1,
0.03879607, -1.701121, 3.956632, 0, 1, 0.9529412, 1,
0.04065204, 1.436948, -1.581809, 0, 1, 0.9568627, 1,
0.04090164, -0.06164908, 2.727221, 0, 1, 0.9647059, 1,
0.04532102, -1.124443, 3.157248, 0, 1, 0.9686275, 1,
0.04697974, -0.196111, 2.429851, 0, 1, 0.9764706, 1,
0.0473423, 0.1823159, 2.644937, 0, 1, 0.9803922, 1,
0.0475888, -0.453949, 2.344951, 0, 1, 0.9882353, 1,
0.04854136, 0.4599782, 0.4476478, 0, 1, 0.9921569, 1,
0.04858254, 0.262637, -0.1264214, 0, 1, 1, 1,
0.04863017, -0.1038045, 2.656625, 0, 0.9921569, 1, 1,
0.05297433, -1.674088, 3.052011, 0, 0.9882353, 1, 1,
0.055773, -0.790261, 4.213386, 0, 0.9803922, 1, 1,
0.05639237, -0.4113036, 3.938831, 0, 0.9764706, 1, 1,
0.05673135, -0.2928742, 2.896553, 0, 0.9686275, 1, 1,
0.06038576, -0.427511, 2.116651, 0, 0.9647059, 1, 1,
0.06953114, 0.8921389, 1.356144, 0, 0.9568627, 1, 1,
0.07552791, -0.4137749, 5.333595, 0, 0.9529412, 1, 1,
0.07568973, 0.542439, -1.04859, 0, 0.945098, 1, 1,
0.07703265, -0.01927121, 0.4311241, 0, 0.9411765, 1, 1,
0.08582701, 0.1331476, -1.978864, 0, 0.9333333, 1, 1,
0.08805311, -0.9124529, 2.41169, 0, 0.9294118, 1, 1,
0.08840143, -0.1646814, 4.593172, 0, 0.9215686, 1, 1,
0.08848566, -0.9690598, 2.027014, 0, 0.9176471, 1, 1,
0.08944521, 2.412953, 0.4097324, 0, 0.9098039, 1, 1,
0.09037895, -1.135679, 3.799149, 0, 0.9058824, 1, 1,
0.09288099, -0.5680386, 4.359338, 0, 0.8980392, 1, 1,
0.0936482, -0.3264148, 1.031658, 0, 0.8901961, 1, 1,
0.09413975, 0.8125262, 3.10928, 0, 0.8862745, 1, 1,
0.09810478, 0.3039951, 1.294418, 0, 0.8784314, 1, 1,
0.0982255, -1.162525, 2.208064, 0, 0.8745098, 1, 1,
0.09920348, -1.160928, 2.671152, 0, 0.8666667, 1, 1,
0.1053697, 0.1212933, 1.367236, 0, 0.8627451, 1, 1,
0.1065368, 0.4802578, -0.08804902, 0, 0.854902, 1, 1,
0.1084388, -0.2338996, 3.314762, 0, 0.8509804, 1, 1,
0.1106698, -0.1888618, 2.166351, 0, 0.8431373, 1, 1,
0.1127554, -0.5204383, 3.085027, 0, 0.8392157, 1, 1,
0.1143791, -0.7278534, 4.032974, 0, 0.8313726, 1, 1,
0.1169683, 1.493345, -0.2481745, 0, 0.827451, 1, 1,
0.1216367, 0.07030733, 0.6827975, 0, 0.8196079, 1, 1,
0.1217978, -0.8811218, 3.566303, 0, 0.8156863, 1, 1,
0.1230913, 0.3208207, 1.092588, 0, 0.8078431, 1, 1,
0.1235392, 0.1728661, -0.141681, 0, 0.8039216, 1, 1,
0.1249162, -1.452388, 3.367606, 0, 0.7960784, 1, 1,
0.1250251, -0.9577725, 1.586526, 0, 0.7882353, 1, 1,
0.1288909, 2.090321, -0.1289212, 0, 0.7843137, 1, 1,
0.136404, 2.00488, 1.032701, 0, 0.7764706, 1, 1,
0.1369265, 1.509591, 0.1627152, 0, 0.772549, 1, 1,
0.1374285, 0.1754391, 1.962915, 0, 0.7647059, 1, 1,
0.1392866, 0.9020113, 0.4993356, 0, 0.7607843, 1, 1,
0.1415706, 0.6374704, 2.263786, 0, 0.7529412, 1, 1,
0.1421695, -0.6552632, 4.253761, 0, 0.7490196, 1, 1,
0.145265, -0.520824, 3.02733, 0, 0.7411765, 1, 1,
0.1502532, -0.2764866, 1.600631, 0, 0.7372549, 1, 1,
0.1518296, -0.1334636, 3.07516, 0, 0.7294118, 1, 1,
0.153235, -0.2678642, 3.12396, 0, 0.7254902, 1, 1,
0.1532675, 0.4370983, 1.26213, 0, 0.7176471, 1, 1,
0.155517, 1.507048, 0.5996866, 0, 0.7137255, 1, 1,
0.1604025, -1.708957, 3.37827, 0, 0.7058824, 1, 1,
0.163028, 0.08792101, 1.155601, 0, 0.6980392, 1, 1,
0.172523, 0.4045771, 2.500987, 0, 0.6941177, 1, 1,
0.1730956, -0.663078, 2.388281, 0, 0.6862745, 1, 1,
0.1759472, -0.6495264, 2.997824, 0, 0.682353, 1, 1,
0.1792997, -0.9411898, 2.140361, 0, 0.6745098, 1, 1,
0.1817884, -1.027741, 1.818177, 0, 0.6705883, 1, 1,
0.1855593, 0.4258665, 0.8861051, 0, 0.6627451, 1, 1,
0.1923795, 0.4110364, 0.2876745, 0, 0.6588235, 1, 1,
0.1926636, 0.5796328, 1.420765, 0, 0.6509804, 1, 1,
0.1928084, 0.8306596, 1.4631, 0, 0.6470588, 1, 1,
0.1937297, -0.6287477, 3.594747, 0, 0.6392157, 1, 1,
0.1960589, 1.109318, 0.5479326, 0, 0.6352941, 1, 1,
0.2039336, 0.6924669, 1.241512, 0, 0.627451, 1, 1,
0.2046599, 0.2145088, 0.1621641, 0, 0.6235294, 1, 1,
0.2060005, -0.1657321, 1.064974, 0, 0.6156863, 1, 1,
0.20964, 0.4558328, -1.954695, 0, 0.6117647, 1, 1,
0.2148245, -0.7435642, 3.128665, 0, 0.6039216, 1, 1,
0.2174743, 0.02317247, 3.036283, 0, 0.5960785, 1, 1,
0.2186481, -0.7639985, 3.373304, 0, 0.5921569, 1, 1,
0.2192934, -2.578643, 5.342047, 0, 0.5843138, 1, 1,
0.2271668, -0.5834905, 3.321657, 0, 0.5803922, 1, 1,
0.2288533, -0.3055229, 2.447581, 0, 0.572549, 1, 1,
0.230695, 0.05525288, 1.116042, 0, 0.5686275, 1, 1,
0.2315359, -1.428661, 1.88697, 0, 0.5607843, 1, 1,
0.2353763, 1.280396, 0.4480499, 0, 0.5568628, 1, 1,
0.2403245, 0.2136879, -1.199027, 0, 0.5490196, 1, 1,
0.2410671, -0.7728057, 5.142731, 0, 0.5450981, 1, 1,
0.2412399, -0.8259105, 3.625616, 0, 0.5372549, 1, 1,
0.2477663, -1.208883, 1.182095, 0, 0.5333334, 1, 1,
0.2496663, -0.3792613, 3.477834, 0, 0.5254902, 1, 1,
0.2535403, 0.07443824, 1.655988, 0, 0.5215687, 1, 1,
0.2536434, 0.1470438, 2.070492, 0, 0.5137255, 1, 1,
0.2545128, 0.4844948, 2.920299, 0, 0.509804, 1, 1,
0.2547361, 0.8138988, 0.9921004, 0, 0.5019608, 1, 1,
0.2579163, -0.8464478, 4.577541, 0, 0.4941176, 1, 1,
0.2602448, 0.7884095, 0.3143918, 0, 0.4901961, 1, 1,
0.261782, 1.179588, 1.14949, 0, 0.4823529, 1, 1,
0.2625908, 1.015321, -2.129637, 0, 0.4784314, 1, 1,
0.2685256, 0.9681587, 1.665859, 0, 0.4705882, 1, 1,
0.2693775, -0.4480158, 2.489095, 0, 0.4666667, 1, 1,
0.2752425, 0.5203823, -0.02432829, 0, 0.4588235, 1, 1,
0.2753119, 0.3552184, 0.6380095, 0, 0.454902, 1, 1,
0.2764162, -0.1178814, 2.630138, 0, 0.4470588, 1, 1,
0.2792059, 0.3208329, 1.778086, 0, 0.4431373, 1, 1,
0.2804382, 0.401949, -0.3299086, 0, 0.4352941, 1, 1,
0.2805986, 0.9089512, 0.9395326, 0, 0.4313726, 1, 1,
0.2873937, 1.020647, -1.423066, 0, 0.4235294, 1, 1,
0.2874563, 0.3856962, 0.5307726, 0, 0.4196078, 1, 1,
0.2911665, -1.224349, 3.387868, 0, 0.4117647, 1, 1,
0.2912066, 1.261956, 1.280452, 0, 0.4078431, 1, 1,
0.2955744, 0.325392, 0.3700676, 0, 0.4, 1, 1,
0.2963902, 0.3411302, 1.125311, 0, 0.3921569, 1, 1,
0.2965369, 1.952816, 0.7621152, 0, 0.3882353, 1, 1,
0.2995351, -1.392986, 2.137293, 0, 0.3803922, 1, 1,
0.3022937, 0.9964175, -0.9272824, 0, 0.3764706, 1, 1,
0.3024076, 0.1639048, 2.633198, 0, 0.3686275, 1, 1,
0.3025644, -0.04347327, 0.6399505, 0, 0.3647059, 1, 1,
0.3070457, -0.792028, 3.106333, 0, 0.3568628, 1, 1,
0.3120313, -0.8664446, 3.015755, 0, 0.3529412, 1, 1,
0.3190159, 2.326334, 0.1271648, 0, 0.345098, 1, 1,
0.322627, 0.1886556, 0.5835299, 0, 0.3411765, 1, 1,
0.3227196, 0.005319607, 1.9999, 0, 0.3333333, 1, 1,
0.3233323, -0.6481652, 3.312958, 0, 0.3294118, 1, 1,
0.3250654, -0.4077568, 2.40519, 0, 0.3215686, 1, 1,
0.3286317, -1.092576, 1.261142, 0, 0.3176471, 1, 1,
0.3289296, -0.2597501, 2.295866, 0, 0.3098039, 1, 1,
0.3290689, -1.353694, 3.734408, 0, 0.3058824, 1, 1,
0.3320208, 0.3067435, 2.155975, 0, 0.2980392, 1, 1,
0.3323411, 1.488162, 1.828657, 0, 0.2901961, 1, 1,
0.3350082, 0.46888, 0.5678351, 0, 0.2862745, 1, 1,
0.3413592, -1.887267, 3.380675, 0, 0.2784314, 1, 1,
0.3418587, -0.1329443, 1.317084, 0, 0.2745098, 1, 1,
0.3464547, -1.021045, 4.095325, 0, 0.2666667, 1, 1,
0.3495632, 0.6016446, 0.2149743, 0, 0.2627451, 1, 1,
0.3584444, 1.136743, -0.307223, 0, 0.254902, 1, 1,
0.3598256, 1.201162, -0.4525371, 0, 0.2509804, 1, 1,
0.3627263, 0.791657, -0.6041514, 0, 0.2431373, 1, 1,
0.3655687, 0.467849, 1.702565, 0, 0.2392157, 1, 1,
0.366823, -1.426623, 2.998692, 0, 0.2313726, 1, 1,
0.3713877, -1.950341, 2.471234, 0, 0.227451, 1, 1,
0.3751557, 0.3912147, -0.3230909, 0, 0.2196078, 1, 1,
0.3802073, -0.6863092, 3.710643, 0, 0.2156863, 1, 1,
0.383384, 0.2652867, -0.1417054, 0, 0.2078431, 1, 1,
0.3839869, 0.04777437, 1.141141, 0, 0.2039216, 1, 1,
0.3843309, 2.871028, 0.3345649, 0, 0.1960784, 1, 1,
0.3874667, 1.410091, -0.9263012, 0, 0.1882353, 1, 1,
0.3875141, 0.5665523, 0.471503, 0, 0.1843137, 1, 1,
0.3884668, -0.09755188, 1.588309, 0, 0.1764706, 1, 1,
0.3980046, -0.8937101, 1.324971, 0, 0.172549, 1, 1,
0.398977, 1.200947, 1.440475, 0, 0.1647059, 1, 1,
0.4024345, -0.2055712, 0.8912624, 0, 0.1607843, 1, 1,
0.4038239, 0.8220313, 0.6599657, 0, 0.1529412, 1, 1,
0.4049543, 0.7915074, -0.7495639, 0, 0.1490196, 1, 1,
0.4074124, 1.041551, -0.08948632, 0, 0.1411765, 1, 1,
0.4110526, 1.104141, -0.8831623, 0, 0.1372549, 1, 1,
0.4120229, -0.2954359, 1.118335, 0, 0.1294118, 1, 1,
0.418027, -0.5150043, 2.889013, 0, 0.1254902, 1, 1,
0.41811, -0.6418781, 3.333231, 0, 0.1176471, 1, 1,
0.4207017, -0.2595093, -0.2676494, 0, 0.1137255, 1, 1,
0.4334865, -0.3805472, 0.6287193, 0, 0.1058824, 1, 1,
0.435657, 2.027113, 0.7095254, 0, 0.09803922, 1, 1,
0.4361454, -2.01773, 2.202241, 0, 0.09411765, 1, 1,
0.4362926, 1.337232, 2.431311, 0, 0.08627451, 1, 1,
0.4377706, 1.210657, 1.258779, 0, 0.08235294, 1, 1,
0.4401351, 0.9562432, -0.2005587, 0, 0.07450981, 1, 1,
0.4430346, -2.135468, 3.376952, 0, 0.07058824, 1, 1,
0.4457336, 0.6026221, -1.109221, 0, 0.0627451, 1, 1,
0.4477975, -0.6870662, 3.542769, 0, 0.05882353, 1, 1,
0.4481538, -0.34557, 3.817469, 0, 0.05098039, 1, 1,
0.4482884, -0.9555696, 2.710225, 0, 0.04705882, 1, 1,
0.4510227, 1.542035, -1.182806, 0, 0.03921569, 1, 1,
0.4521163, 0.6329246, -0.1779576, 0, 0.03529412, 1, 1,
0.4599356, -1.132856, 2.009343, 0, 0.02745098, 1, 1,
0.4621488, -1.850408, 3.815972, 0, 0.02352941, 1, 1,
0.4643776, 0.08131082, 0.4153611, 0, 0.01568628, 1, 1,
0.4645643, 0.6490337, -1.397921, 0, 0.01176471, 1, 1,
0.4654484, -0.5770603, 3.906815, 0, 0.003921569, 1, 1,
0.467066, -0.4673523, 0.8387087, 0.003921569, 0, 1, 1,
0.4696236, -2.245199, 3.04093, 0.007843138, 0, 1, 1,
0.4715328, 0.909797, -0.609478, 0.01568628, 0, 1, 1,
0.4817068, -2.018856, 5.638984, 0.01960784, 0, 1, 1,
0.4866012, 0.9892697, 1.666997, 0.02745098, 0, 1, 1,
0.4955419, -0.3363489, 3.467865, 0.03137255, 0, 1, 1,
0.4993015, -0.05747178, 2.440497, 0.03921569, 0, 1, 1,
0.4993331, -0.006397367, 2.431497, 0.04313726, 0, 1, 1,
0.5041949, -0.002814611, 3.118612, 0.05098039, 0, 1, 1,
0.5047615, -0.1797821, 1.511869, 0.05490196, 0, 1, 1,
0.5065, -0.5559754, 3.445001, 0.0627451, 0, 1, 1,
0.5120658, 1.587874, 0.4927443, 0.06666667, 0, 1, 1,
0.5121674, 1.557643, -0.6359803, 0.07450981, 0, 1, 1,
0.5127215, 0.680713, 0.4791402, 0.07843138, 0, 1, 1,
0.5137209, 0.8807995, -0.2543388, 0.08627451, 0, 1, 1,
0.5143418, -0.6884988, 1.099435, 0.09019608, 0, 1, 1,
0.5145411, 1.917261, -2.617322, 0.09803922, 0, 1, 1,
0.5188046, -0.7575527, 1.152634, 0.1058824, 0, 1, 1,
0.5221366, -0.009198142, 1.869618, 0.1098039, 0, 1, 1,
0.5232944, 0.4729351, 1.296794, 0.1176471, 0, 1, 1,
0.5233276, 1.323083, 2.347264, 0.1215686, 0, 1, 1,
0.5292469, 0.135685, 1.63487, 0.1294118, 0, 1, 1,
0.5292695, 0.1956322, 1.954981, 0.1333333, 0, 1, 1,
0.5308878, 2.733622, -0.0002885163, 0.1411765, 0, 1, 1,
0.5324603, -0.7405391, 2.780527, 0.145098, 0, 1, 1,
0.5358228, -1.451209, 2.026348, 0.1529412, 0, 1, 1,
0.5367686, 0.1703998, 1.886347, 0.1568628, 0, 1, 1,
0.5384045, 1.645682, -0.6703498, 0.1647059, 0, 1, 1,
0.5414708, 0.9278549, 2.10735, 0.1686275, 0, 1, 1,
0.542338, 0.5890949, 2.15939, 0.1764706, 0, 1, 1,
0.5444525, -0.5633494, 3.630799, 0.1803922, 0, 1, 1,
0.5446541, 0.2197205, 1.313636, 0.1882353, 0, 1, 1,
0.5475652, -0.1484955, 2.807164, 0.1921569, 0, 1, 1,
0.5477778, 0.3510253, 0.6593796, 0.2, 0, 1, 1,
0.5495125, 0.2444326, -1.102877, 0.2078431, 0, 1, 1,
0.5532904, -0.4994808, 2.711598, 0.2117647, 0, 1, 1,
0.5557148, -0.0803588, -0.8514065, 0.2196078, 0, 1, 1,
0.5557339, 0.887734, 1.332048, 0.2235294, 0, 1, 1,
0.557117, 0.4369093, 0.9038014, 0.2313726, 0, 1, 1,
0.5598658, -0.8063665, 3.853172, 0.2352941, 0, 1, 1,
0.566555, -3.212055, 2.371608, 0.2431373, 0, 1, 1,
0.5792207, 0.5574648, 0.7464302, 0.2470588, 0, 1, 1,
0.5815237, 0.1882978, 0.7213377, 0.254902, 0, 1, 1,
0.5883448, -0.6872863, 3.205414, 0.2588235, 0, 1, 1,
0.588365, -2.350886, 4.445742, 0.2666667, 0, 1, 1,
0.5912504, 0.8736193, 1.619103, 0.2705882, 0, 1, 1,
0.5915065, 0.8448289, 0.2086708, 0.2784314, 0, 1, 1,
0.5991006, 1.230931, -0.3690175, 0.282353, 0, 1, 1,
0.6007102, 0.5002086, 3.600775, 0.2901961, 0, 1, 1,
0.6008508, 0.02759658, 1.625148, 0.2941177, 0, 1, 1,
0.6014624, 1.091228, 2.575337, 0.3019608, 0, 1, 1,
0.6025316, -1.648123, 3.255992, 0.3098039, 0, 1, 1,
0.6051075, -0.4790399, 2.731924, 0.3137255, 0, 1, 1,
0.6057919, 2.053178, -0.2145532, 0.3215686, 0, 1, 1,
0.6083015, -0.7694239, 2.866549, 0.3254902, 0, 1, 1,
0.6123588, -0.02037983, 2.519752, 0.3333333, 0, 1, 1,
0.6127923, -0.6909887, 2.212963, 0.3372549, 0, 1, 1,
0.6130255, -0.4290321, 1.57503, 0.345098, 0, 1, 1,
0.6144882, 2.579462, -0.3915619, 0.3490196, 0, 1, 1,
0.6161152, 0.4474417, 2.559833, 0.3568628, 0, 1, 1,
0.6203524, -0.8878019, 2.071296, 0.3607843, 0, 1, 1,
0.632395, 0.7939969, 1.10013, 0.3686275, 0, 1, 1,
0.6340901, 0.7768354, 2.413489, 0.372549, 0, 1, 1,
0.6350083, 0.4264208, 0.5752335, 0.3803922, 0, 1, 1,
0.6351826, -0.1887444, 3.142461, 0.3843137, 0, 1, 1,
0.6445455, 0.6207771, 2.120975, 0.3921569, 0, 1, 1,
0.6460603, 0.07236757, 0.7483547, 0.3960784, 0, 1, 1,
0.6470876, 0.6242826, 1.016425, 0.4039216, 0, 1, 1,
0.652128, -0.9999627, 2.937445, 0.4117647, 0, 1, 1,
0.6530202, -1.340663, 2.880562, 0.4156863, 0, 1, 1,
0.6557815, -1.230886, 2.20276, 0.4235294, 0, 1, 1,
0.6568834, 0.6086418, 2.52945, 0.427451, 0, 1, 1,
0.6605853, 0.298756, 1.798001, 0.4352941, 0, 1, 1,
0.6618719, 0.9396191, 1.915979, 0.4392157, 0, 1, 1,
0.6618927, -0.5929102, 0.9205351, 0.4470588, 0, 1, 1,
0.6663883, 0.8571182, 1.734719, 0.4509804, 0, 1, 1,
0.6674086, -0.9111752, 3.653912, 0.4588235, 0, 1, 1,
0.6676973, 0.6683805, 1.762901, 0.4627451, 0, 1, 1,
0.6689694, -2.012146, 1.284599, 0.4705882, 0, 1, 1,
0.6763681, 0.1499449, 1.550651, 0.4745098, 0, 1, 1,
0.6787862, 0.5094179, 2.04022, 0.4823529, 0, 1, 1,
0.6817492, 0.1004654, 2.656846, 0.4862745, 0, 1, 1,
0.6826055, -0.2532724, 1.275025, 0.4941176, 0, 1, 1,
0.6874061, -0.2204357, 2.682104, 0.5019608, 0, 1, 1,
0.6980044, -0.9827505, 2.574846, 0.5058824, 0, 1, 1,
0.6997048, 1.247635, -0.91413, 0.5137255, 0, 1, 1,
0.702278, 0.3465643, 0.5068334, 0.5176471, 0, 1, 1,
0.7113951, 1.042614, 0.1595326, 0.5254902, 0, 1, 1,
0.7180822, -0.6174495, 1.635042, 0.5294118, 0, 1, 1,
0.7197232, -1.093766, 3.683072, 0.5372549, 0, 1, 1,
0.7287452, 0.9317464, 0.809322, 0.5411765, 0, 1, 1,
0.735603, 0.04118965, 0.5770903, 0.5490196, 0, 1, 1,
0.7368395, -0.3392981, 4.728398, 0.5529412, 0, 1, 1,
0.7372306, 1.039174, -0.5498127, 0.5607843, 0, 1, 1,
0.7376136, -0.3745537, 2.773936, 0.5647059, 0, 1, 1,
0.7384481, 0.9800535, 0.3411847, 0.572549, 0, 1, 1,
0.7391292, 1.236887, 1.322744, 0.5764706, 0, 1, 1,
0.7394998, -2.115046, 3.368607, 0.5843138, 0, 1, 1,
0.7418551, 0.008142036, 1.670159, 0.5882353, 0, 1, 1,
0.7507351, -0.2038181, 2.254911, 0.5960785, 0, 1, 1,
0.7528085, -0.1705862, 1.567531, 0.6039216, 0, 1, 1,
0.753918, 0.2821355, 0.9079258, 0.6078432, 0, 1, 1,
0.7568316, -0.5008319, 2.354029, 0.6156863, 0, 1, 1,
0.7730681, -2.640975, 3.070761, 0.6196079, 0, 1, 1,
0.7869849, -0.09204656, 2.233748, 0.627451, 0, 1, 1,
0.7895507, -1.338048, 2.483423, 0.6313726, 0, 1, 1,
0.790257, 0.6599137, 1.446617, 0.6392157, 0, 1, 1,
0.7910864, 0.03692688, 0.6948659, 0.6431373, 0, 1, 1,
0.7962896, -0.8053344, 1.342907, 0.6509804, 0, 1, 1,
0.7976071, -0.8469086, 2.328029, 0.654902, 0, 1, 1,
0.8021931, -0.5661124, 3.277633, 0.6627451, 0, 1, 1,
0.802916, -1.111693, 3.83616, 0.6666667, 0, 1, 1,
0.822211, 1.036607, 1.552756, 0.6745098, 0, 1, 1,
0.8286447, -0.8531402, 2.27305, 0.6784314, 0, 1, 1,
0.8380602, -0.9939141, 2.528929, 0.6862745, 0, 1, 1,
0.8432592, -0.3346761, 0.9625902, 0.6901961, 0, 1, 1,
0.8451615, 1.130279, 0.5542698, 0.6980392, 0, 1, 1,
0.8472025, 0.6684703, 3.486892, 0.7058824, 0, 1, 1,
0.8494577, -0.9947011, 2.41093, 0.7098039, 0, 1, 1,
0.8528297, 1.072908, -0.5304216, 0.7176471, 0, 1, 1,
0.8582517, -0.1754128, 0.904237, 0.7215686, 0, 1, 1,
0.86035, -0.0578309, 2.466458, 0.7294118, 0, 1, 1,
0.8716858, 0.1471886, 0.7691616, 0.7333333, 0, 1, 1,
0.8745854, 1.31436, 2.762995, 0.7411765, 0, 1, 1,
0.8747492, 0.7334139, 1.243734, 0.7450981, 0, 1, 1,
0.8763496, 2.090829, 0.5329723, 0.7529412, 0, 1, 1,
0.8769, 1.588208, 0.3696865, 0.7568628, 0, 1, 1,
0.8789104, 0.6443059, 0.2992521, 0.7647059, 0, 1, 1,
0.8865831, 1.089375, 1.975334, 0.7686275, 0, 1, 1,
0.8914904, -0.6101033, 1.090533, 0.7764706, 0, 1, 1,
0.895709, 1.017795, 1.921648, 0.7803922, 0, 1, 1,
0.9000034, 0.7361405, 0.01217023, 0.7882353, 0, 1, 1,
0.9047629, 0.5338482, 0.7123341, 0.7921569, 0, 1, 1,
0.9047871, 0.1066926, 1.498284, 0.8, 0, 1, 1,
0.9052921, 0.2525114, 2.10641, 0.8078431, 0, 1, 1,
0.9072417, 0.1750526, 1.986486, 0.8117647, 0, 1, 1,
0.9095092, 0.3323619, 2.268685, 0.8196079, 0, 1, 1,
0.9155278, -2.411605, 2.652567, 0.8235294, 0, 1, 1,
0.9197817, 0.2428208, 0.01314926, 0.8313726, 0, 1, 1,
0.9224869, 0.9470244, 0.5160635, 0.8352941, 0, 1, 1,
0.9243354, -0.04475882, 1.771073, 0.8431373, 0, 1, 1,
0.925042, -0.6780933, 1.427297, 0.8470588, 0, 1, 1,
0.9282343, -0.09571785, 2.133812, 0.854902, 0, 1, 1,
0.9320026, -1.738447, 2.005795, 0.8588235, 0, 1, 1,
0.9323891, 0.9481422, 2.24596, 0.8666667, 0, 1, 1,
0.941902, -0.3122822, 1.963129, 0.8705882, 0, 1, 1,
0.9447474, -0.5056541, 1.498377, 0.8784314, 0, 1, 1,
0.9458618, -0.2363378, 2.445876, 0.8823529, 0, 1, 1,
0.9545854, 0.1024665, 0.4610698, 0.8901961, 0, 1, 1,
0.9577399, -0.6166021, 2.705654, 0.8941177, 0, 1, 1,
0.9592741, -1.915916, 4.653014, 0.9019608, 0, 1, 1,
0.9616407, 0.3787748, 2.747013, 0.9098039, 0, 1, 1,
0.9625826, 0.4705037, 1.504065, 0.9137255, 0, 1, 1,
0.9638156, 0.7725443, 2.774046, 0.9215686, 0, 1, 1,
0.969649, -0.05078597, 1.415128, 0.9254902, 0, 1, 1,
0.9704226, -0.770629, 0.5619679, 0.9333333, 0, 1, 1,
0.9722878, -0.3699438, 3.090713, 0.9372549, 0, 1, 1,
0.9763944, -0.6535715, 1.792415, 0.945098, 0, 1, 1,
0.983055, 0.058536, 1.999708, 0.9490196, 0, 1, 1,
0.9835441, 0.3889203, 1.057022, 0.9568627, 0, 1, 1,
0.9840125, -1.177426, 3.66292, 0.9607843, 0, 1, 1,
0.9927376, 1.061921, 0.7958919, 0.9686275, 0, 1, 1,
0.9930279, 0.4708859, 1.147113, 0.972549, 0, 1, 1,
0.9932501, -1.192668, 2.245856, 0.9803922, 0, 1, 1,
0.9968476, -0.08617944, 1.549783, 0.9843137, 0, 1, 1,
1.002222, 0.7146601, -0.005650886, 0.9921569, 0, 1, 1,
1.015997, -0.6110225, 2.991798, 0.9960784, 0, 1, 1,
1.016101, 2.601763, 1.744936, 1, 0, 0.9960784, 1,
1.021217, 0.1075711, 3.351552, 1, 0, 0.9882353, 1,
1.042386, -0.6466072, 0.9211929, 1, 0, 0.9843137, 1,
1.047738, 0.9729771, -1.150842, 1, 0, 0.9764706, 1,
1.052794, 1.033119, -0.3894843, 1, 0, 0.972549, 1,
1.059586, -0.2847584, 2.609905, 1, 0, 0.9647059, 1,
1.059613, 0.03607253, 1.412157, 1, 0, 0.9607843, 1,
1.06671, -0.3867578, 1.223915, 1, 0, 0.9529412, 1,
1.068496, -0.4173273, 0.7044082, 1, 0, 0.9490196, 1,
1.074675, 2.263615, -0.9209962, 1, 0, 0.9411765, 1,
1.075983, -0.9716152, 1.743975, 1, 0, 0.9372549, 1,
1.076039, -0.1358192, 3.807838, 1, 0, 0.9294118, 1,
1.085897, -0.1377583, 1.96269, 1, 0, 0.9254902, 1,
1.086001, 1.596579, 1.771326, 1, 0, 0.9176471, 1,
1.086311, -2.510314, 1.828286, 1, 0, 0.9137255, 1,
1.088421, -0.1484879, 1.075221, 1, 0, 0.9058824, 1,
1.089199, -1.012868, 0.8486376, 1, 0, 0.9019608, 1,
1.091254, 0.4883731, 1.501908, 1, 0, 0.8941177, 1,
1.091778, 0.4138615, 1.868265, 1, 0, 0.8862745, 1,
1.096519, 1.645165, 0.4141743, 1, 0, 0.8823529, 1,
1.106242, 0.2821391, 1.351148, 1, 0, 0.8745098, 1,
1.11374, -0.8313569, 1.672514, 1, 0, 0.8705882, 1,
1.124206, 0.3390664, 0.1977743, 1, 0, 0.8627451, 1,
1.131359, -1.200496, 1.102015, 1, 0, 0.8588235, 1,
1.132528, 1.201223, 0.5787508, 1, 0, 0.8509804, 1,
1.13739, 0.306949, 1.864697, 1, 0, 0.8470588, 1,
1.143428, 1.922208, 1.326713, 1, 0, 0.8392157, 1,
1.1475, -0.317299, 1.316364, 1, 0, 0.8352941, 1,
1.152903, 0.71941, 0.2114232, 1, 0, 0.827451, 1,
1.153089, 0.1575922, 1.810453, 1, 0, 0.8235294, 1,
1.153976, 0.3707044, 0.6364049, 1, 0, 0.8156863, 1,
1.154097, 1.31344, -0.7845972, 1, 0, 0.8117647, 1,
1.157501, 0.66719, 2.029042, 1, 0, 0.8039216, 1,
1.167872, -1.899819, 2.754531, 1, 0, 0.7960784, 1,
1.176493, -0.1194839, 3.655061, 1, 0, 0.7921569, 1,
1.189716, 0.3781978, 1.358263, 1, 0, 0.7843137, 1,
1.191162, 1.608063, 0.4108501, 1, 0, 0.7803922, 1,
1.192851, 0.531522, 0.7774303, 1, 0, 0.772549, 1,
1.202567, -1.958094, 3.281607, 1, 0, 0.7686275, 1,
1.20275, -0.09482033, 2.274441, 1, 0, 0.7607843, 1,
1.213111, 0.02975885, 0.5114797, 1, 0, 0.7568628, 1,
1.216093, 0.5820928, 2.013908, 1, 0, 0.7490196, 1,
1.218608, 0.7769125, 0.7951152, 1, 0, 0.7450981, 1,
1.22742, -1.821701, 3.591817, 1, 0, 0.7372549, 1,
1.228912, -1.155095, 1.434285, 1, 0, 0.7333333, 1,
1.229749, -0.502948, 2.503043, 1, 0, 0.7254902, 1,
1.231703, 1.087188, 0.6024722, 1, 0, 0.7215686, 1,
1.239815, -0.8952559, 2.051608, 1, 0, 0.7137255, 1,
1.246686, -0.9234611, 2.13484, 1, 0, 0.7098039, 1,
1.247885, 1.162022, -0.3410269, 1, 0, 0.7019608, 1,
1.248209, -0.5173844, 1.582217, 1, 0, 0.6941177, 1,
1.273803, -0.8653671, 0.7878097, 1, 0, 0.6901961, 1,
1.277359, -0.4519362, 2.987676, 1, 0, 0.682353, 1,
1.27817, 0.005372695, 2.792181, 1, 0, 0.6784314, 1,
1.28031, -0.3641892, 2.469345, 1, 0, 0.6705883, 1,
1.281972, 0.7798501, 1.684696, 1, 0, 0.6666667, 1,
1.295009, -0.08965228, 0.9148904, 1, 0, 0.6588235, 1,
1.299417, 1.270461, 2.35965, 1, 0, 0.654902, 1,
1.300237, 1.687538, -1.030952, 1, 0, 0.6470588, 1,
1.301496, 0.1785864, 0.9264807, 1, 0, 0.6431373, 1,
1.304341, 0.04897331, 0.09986136, 1, 0, 0.6352941, 1,
1.308434, 0.156046, 1.393028, 1, 0, 0.6313726, 1,
1.309229, 0.5746359, 0.1642995, 1, 0, 0.6235294, 1,
1.314385, -0.5275871, 0.3689028, 1, 0, 0.6196079, 1,
1.314729, -0.7255586, 0.4938034, 1, 0, 0.6117647, 1,
1.315412, -1.733145, 2.546654, 1, 0, 0.6078432, 1,
1.317507, 0.5455203, 1.744537, 1, 0, 0.6, 1,
1.326802, -0.5142751, 0.8374061, 1, 0, 0.5921569, 1,
1.331701, 0.04210471, 0.8432591, 1, 0, 0.5882353, 1,
1.338268, -0.7012245, 2.59168, 1, 0, 0.5803922, 1,
1.355802, 1.587058, 1.677915, 1, 0, 0.5764706, 1,
1.359346, 2.088059, -0.8718252, 1, 0, 0.5686275, 1,
1.36418, 0.4133546, 0.8795544, 1, 0, 0.5647059, 1,
1.372143, -2.059897, 3.670678, 1, 0, 0.5568628, 1,
1.373487, 0.1012252, 1.90165, 1, 0, 0.5529412, 1,
1.381975, -0.02866867, 1.626512, 1, 0, 0.5450981, 1,
1.412198, 0.1801262, 0.9542416, 1, 0, 0.5411765, 1,
1.412375, -0.9989867, 1.318264, 1, 0, 0.5333334, 1,
1.414782, -0.04177579, -0.6428574, 1, 0, 0.5294118, 1,
1.418813, 0.4866117, 1.198171, 1, 0, 0.5215687, 1,
1.427579, -0.1708255, 2.027107, 1, 0, 0.5176471, 1,
1.438406, -1.627901, 1.761961, 1, 0, 0.509804, 1,
1.438613, 0.5024836, 2.093581, 1, 0, 0.5058824, 1,
1.440042, 1.324937, 0.6173094, 1, 0, 0.4980392, 1,
1.441203, -1.198237, 3.372848, 1, 0, 0.4901961, 1,
1.441578, -1.20979, 2.33414, 1, 0, 0.4862745, 1,
1.441964, 1.606121, 1.594893, 1, 0, 0.4784314, 1,
1.453833, 0.5715113, 2.71755, 1, 0, 0.4745098, 1,
1.467732, -0.3071143, 2.555187, 1, 0, 0.4666667, 1,
1.470809, -0.613941, 2.615237, 1, 0, 0.4627451, 1,
1.478533, 0.4298188, -0.01563271, 1, 0, 0.454902, 1,
1.48736, -1.744661, 2.433874, 1, 0, 0.4509804, 1,
1.488225, -1.446541, 2.463375, 1, 0, 0.4431373, 1,
1.490655, 0.009273479, -1.05265, 1, 0, 0.4392157, 1,
1.500008, 0.7208639, 1.055035, 1, 0, 0.4313726, 1,
1.504527, 0.3249069, 1.842921, 1, 0, 0.427451, 1,
1.508253, 0.5623382, 0.1208543, 1, 0, 0.4196078, 1,
1.518489, -1.199163, 2.636678, 1, 0, 0.4156863, 1,
1.529446, -1.376527, 1.189844, 1, 0, 0.4078431, 1,
1.532438, 0.2265021, 1.748874, 1, 0, 0.4039216, 1,
1.535604, 0.9823629, 1.976202, 1, 0, 0.3960784, 1,
1.542647, 0.8361795, 2.566456, 1, 0, 0.3882353, 1,
1.579181, -0.1348222, 2.847878, 1, 0, 0.3843137, 1,
1.580706, -3.365059, 1.741098, 1, 0, 0.3764706, 1,
1.582229, 0.1457771, 2.315187, 1, 0, 0.372549, 1,
1.593458, 0.03056018, 1.973919, 1, 0, 0.3647059, 1,
1.596309, 0.01841108, 2.689931, 1, 0, 0.3607843, 1,
1.604308, 1.942237, 0.1836498, 1, 0, 0.3529412, 1,
1.604693, 0.5079686, 2.724754, 1, 0, 0.3490196, 1,
1.614714, -0.2432387, 2.396604, 1, 0, 0.3411765, 1,
1.618429, -1.206738, 1.712208, 1, 0, 0.3372549, 1,
1.631973, -0.2501739, 2.215676, 1, 0, 0.3294118, 1,
1.639047, 2.779798, 0.1503989, 1, 0, 0.3254902, 1,
1.646464, 0.2092135, -0.08030229, 1, 0, 0.3176471, 1,
1.648288, 1.037157, 1.092765, 1, 0, 0.3137255, 1,
1.651524, -2.123307, 2.735205, 1, 0, 0.3058824, 1,
1.653464, -0.9471279, 0.5491194, 1, 0, 0.2980392, 1,
1.692112, 1.11759, 0.4338907, 1, 0, 0.2941177, 1,
1.696201, -2.104379, 2.264211, 1, 0, 0.2862745, 1,
1.703204, 0.5659487, 1.746388, 1, 0, 0.282353, 1,
1.705289, -1.208063, 2.152933, 1, 0, 0.2745098, 1,
1.720297, -1.381736, 0.5122648, 1, 0, 0.2705882, 1,
1.73373, -0.1615132, -0.1539618, 1, 0, 0.2627451, 1,
1.738173, -0.01098197, 2.179935, 1, 0, 0.2588235, 1,
1.744885, 0.641867, 1.13892, 1, 0, 0.2509804, 1,
1.771064, 0.2435439, 1.829823, 1, 0, 0.2470588, 1,
1.771931, 0.1017016, 0.8674852, 1, 0, 0.2392157, 1,
1.777412, -0.3296338, 3.501101, 1, 0, 0.2352941, 1,
1.795771, 1.181604, 1.1787, 1, 0, 0.227451, 1,
1.800526, -0.762115, 4.367308, 1, 0, 0.2235294, 1,
1.803043, 2.792351, 1.61376, 1, 0, 0.2156863, 1,
1.813008, 0.03955001, 1.163622, 1, 0, 0.2117647, 1,
1.816996, 0.4925306, -0.1761297, 1, 0, 0.2039216, 1,
1.824029, 0.09580352, 0.8819292, 1, 0, 0.1960784, 1,
1.836645, 0.5204732, 2.47584, 1, 0, 0.1921569, 1,
1.871364, -0.1119713, 2.201692, 1, 0, 0.1843137, 1,
1.886873, 0.03923549, 4.160551, 1, 0, 0.1803922, 1,
1.891573, 2.339483, 1.943066, 1, 0, 0.172549, 1,
1.895223, 0.03132759, 2.231845, 1, 0, 0.1686275, 1,
1.897324, 0.6465389, 3.360827, 1, 0, 0.1607843, 1,
1.91672, 1.861196, 1.72392, 1, 0, 0.1568628, 1,
1.927036, -1.489062, 3.33367, 1, 0, 0.1490196, 1,
1.938188, -0.6090074, 3.048475, 1, 0, 0.145098, 1,
1.942457, -1.645063, 0.1077781, 1, 0, 0.1372549, 1,
1.942952, 0.6961573, 1.732289, 1, 0, 0.1333333, 1,
1.972776, 0.3126218, 1.202918, 1, 0, 0.1254902, 1,
1.990993, 1.833843, -0.1507377, 1, 0, 0.1215686, 1,
2.011208, -0.00381097, 0.5168728, 1, 0, 0.1137255, 1,
2.021339, 1.546347, 0.9127465, 1, 0, 0.1098039, 1,
2.107301, -0.3133132, 2.186549, 1, 0, 0.1019608, 1,
2.200866, 1.485701, 0.5193341, 1, 0, 0.09411765, 1,
2.232591, -1.41171, 3.376127, 1, 0, 0.09019608, 1,
2.279022, 0.8812845, 0.6699035, 1, 0, 0.08235294, 1,
2.306396, -0.06282491, 0.9892188, 1, 0, 0.07843138, 1,
2.308182, 0.4904036, 0.1530281, 1, 0, 0.07058824, 1,
2.357847, 0.1626807, 2.808945, 1, 0, 0.06666667, 1,
2.375165, -1.368935, 3.60345, 1, 0, 0.05882353, 1,
2.398204, -0.8770674, 4.994782, 1, 0, 0.05490196, 1,
2.556698, -0.9804206, 0.7913966, 1, 0, 0.04705882, 1,
2.564078, 1.403889, 1.976921, 1, 0, 0.04313726, 1,
2.577495, 1.145681, 0.8526674, 1, 0, 0.03529412, 1,
2.588664, 1.305102, 0.9104117, 1, 0, 0.03137255, 1,
2.62331, -0.2900135, 2.249099, 1, 0, 0.02352941, 1,
2.660175, 0.4065969, 1.439535, 1, 0, 0.01960784, 1,
2.718465, -1.519523, 0.8841327, 1, 0, 0.01176471, 1,
2.89337, -2.042652, 1.929803, 1, 0, 0.007843138, 1
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
-0.04676461, -4.422076, -7.026966, 0, -0.5, 0.5, 0.5,
-0.04676461, -4.422076, -7.026966, 1, -0.5, 0.5, 0.5,
-0.04676461, -4.422076, -7.026966, 1, 1.5, 0.5, 0.5,
-0.04676461, -4.422076, -7.026966, 0, 1.5, 0.5, 0.5
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
-3.983604, -0.2470156, -7.026966, 0, -0.5, 0.5, 0.5,
-3.983604, -0.2470156, -7.026966, 1, -0.5, 0.5, 0.5,
-3.983604, -0.2470156, -7.026966, 1, 1.5, 0.5, 0.5,
-3.983604, -0.2470156, -7.026966, 0, 1.5, 0.5, 0.5
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
-3.983604, -4.422076, 0.2238708, 0, -0.5, 0.5, 0.5,
-3.983604, -4.422076, 0.2238708, 1, -0.5, 0.5, 0.5,
-3.983604, -4.422076, 0.2238708, 1, 1.5, 0.5, 0.5,
-3.983604, -4.422076, 0.2238708, 0, 1.5, 0.5, 0.5
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
-2, -3.458601, -5.353696,
2, -3.458601, -5.353696,
-2, -3.458601, -5.353696,
-2, -3.61918, -5.632575,
-1, -3.458601, -5.353696,
-1, -3.61918, -5.632575,
0, -3.458601, -5.353696,
0, -3.61918, -5.632575,
1, -3.458601, -5.353696,
1, -3.61918, -5.632575,
2, -3.458601, -5.353696,
2, -3.61918, -5.632575
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
-2, -3.940338, -6.190331, 0, -0.5, 0.5, 0.5,
-2, -3.940338, -6.190331, 1, -0.5, 0.5, 0.5,
-2, -3.940338, -6.190331, 1, 1.5, 0.5, 0.5,
-2, -3.940338, -6.190331, 0, 1.5, 0.5, 0.5,
-1, -3.940338, -6.190331, 0, -0.5, 0.5, 0.5,
-1, -3.940338, -6.190331, 1, -0.5, 0.5, 0.5,
-1, -3.940338, -6.190331, 1, 1.5, 0.5, 0.5,
-1, -3.940338, -6.190331, 0, 1.5, 0.5, 0.5,
0, -3.940338, -6.190331, 0, -0.5, 0.5, 0.5,
0, -3.940338, -6.190331, 1, -0.5, 0.5, 0.5,
0, -3.940338, -6.190331, 1, 1.5, 0.5, 0.5,
0, -3.940338, -6.190331, 0, 1.5, 0.5, 0.5,
1, -3.940338, -6.190331, 0, -0.5, 0.5, 0.5,
1, -3.940338, -6.190331, 1, -0.5, 0.5, 0.5,
1, -3.940338, -6.190331, 1, 1.5, 0.5, 0.5,
1, -3.940338, -6.190331, 0, 1.5, 0.5, 0.5,
2, -3.940338, -6.190331, 0, -0.5, 0.5, 0.5,
2, -3.940338, -6.190331, 1, -0.5, 0.5, 0.5,
2, -3.940338, -6.190331, 1, 1.5, 0.5, 0.5,
2, -3.940338, -6.190331, 0, 1.5, 0.5, 0.5
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
-3.075103, -3, -5.353696,
-3.075103, 2, -5.353696,
-3.075103, -3, -5.353696,
-3.22652, -3, -5.632575,
-3.075103, -2, -5.353696,
-3.22652, -2, -5.632575,
-3.075103, -1, -5.353696,
-3.22652, -1, -5.632575,
-3.075103, 0, -5.353696,
-3.22652, 0, -5.632575,
-3.075103, 1, -5.353696,
-3.22652, 1, -5.632575,
-3.075103, 2, -5.353696,
-3.22652, 2, -5.632575
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
-3.529354, -3, -6.190331, 0, -0.5, 0.5, 0.5,
-3.529354, -3, -6.190331, 1, -0.5, 0.5, 0.5,
-3.529354, -3, -6.190331, 1, 1.5, 0.5, 0.5,
-3.529354, -3, -6.190331, 0, 1.5, 0.5, 0.5,
-3.529354, -2, -6.190331, 0, -0.5, 0.5, 0.5,
-3.529354, -2, -6.190331, 1, -0.5, 0.5, 0.5,
-3.529354, -2, -6.190331, 1, 1.5, 0.5, 0.5,
-3.529354, -2, -6.190331, 0, 1.5, 0.5, 0.5,
-3.529354, -1, -6.190331, 0, -0.5, 0.5, 0.5,
-3.529354, -1, -6.190331, 1, -0.5, 0.5, 0.5,
-3.529354, -1, -6.190331, 1, 1.5, 0.5, 0.5,
-3.529354, -1, -6.190331, 0, 1.5, 0.5, 0.5,
-3.529354, 0, -6.190331, 0, -0.5, 0.5, 0.5,
-3.529354, 0, -6.190331, 1, -0.5, 0.5, 0.5,
-3.529354, 0, -6.190331, 1, 1.5, 0.5, 0.5,
-3.529354, 0, -6.190331, 0, 1.5, 0.5, 0.5,
-3.529354, 1, -6.190331, 0, -0.5, 0.5, 0.5,
-3.529354, 1, -6.190331, 1, -0.5, 0.5, 0.5,
-3.529354, 1, -6.190331, 1, 1.5, 0.5, 0.5,
-3.529354, 1, -6.190331, 0, 1.5, 0.5, 0.5,
-3.529354, 2, -6.190331, 0, -0.5, 0.5, 0.5,
-3.529354, 2, -6.190331, 1, -0.5, 0.5, 0.5,
-3.529354, 2, -6.190331, 1, 1.5, 0.5, 0.5,
-3.529354, 2, -6.190331, 0, 1.5, 0.5, 0.5
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
-3.075103, -3.458601, -4,
-3.075103, -3.458601, 4,
-3.075103, -3.458601, -4,
-3.22652, -3.61918, -4,
-3.075103, -3.458601, -2,
-3.22652, -3.61918, -2,
-3.075103, -3.458601, 0,
-3.22652, -3.61918, 0,
-3.075103, -3.458601, 2,
-3.22652, -3.61918, 2,
-3.075103, -3.458601, 4,
-3.22652, -3.61918, 4
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
-3.529354, -3.940338, -4, 0, -0.5, 0.5, 0.5,
-3.529354, -3.940338, -4, 1, -0.5, 0.5, 0.5,
-3.529354, -3.940338, -4, 1, 1.5, 0.5, 0.5,
-3.529354, -3.940338, -4, 0, 1.5, 0.5, 0.5,
-3.529354, -3.940338, -2, 0, -0.5, 0.5, 0.5,
-3.529354, -3.940338, -2, 1, -0.5, 0.5, 0.5,
-3.529354, -3.940338, -2, 1, 1.5, 0.5, 0.5,
-3.529354, -3.940338, -2, 0, 1.5, 0.5, 0.5,
-3.529354, -3.940338, 0, 0, -0.5, 0.5, 0.5,
-3.529354, -3.940338, 0, 1, -0.5, 0.5, 0.5,
-3.529354, -3.940338, 0, 1, 1.5, 0.5, 0.5,
-3.529354, -3.940338, 0, 0, 1.5, 0.5, 0.5,
-3.529354, -3.940338, 2, 0, -0.5, 0.5, 0.5,
-3.529354, -3.940338, 2, 1, -0.5, 0.5, 0.5,
-3.529354, -3.940338, 2, 1, 1.5, 0.5, 0.5,
-3.529354, -3.940338, 2, 0, 1.5, 0.5, 0.5,
-3.529354, -3.940338, 4, 0, -0.5, 0.5, 0.5,
-3.529354, -3.940338, 4, 1, -0.5, 0.5, 0.5,
-3.529354, -3.940338, 4, 1, 1.5, 0.5, 0.5,
-3.529354, -3.940338, 4, 0, 1.5, 0.5, 0.5
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
-3.075103, -3.458601, -5.353696,
-3.075103, 2.964569, -5.353696,
-3.075103, -3.458601, 5.801437,
-3.075103, 2.964569, 5.801437,
-3.075103, -3.458601, -5.353696,
-3.075103, -3.458601, 5.801437,
-3.075103, 2.964569, -5.353696,
-3.075103, 2.964569, 5.801437,
-3.075103, -3.458601, -5.353696,
2.981574, -3.458601, -5.353696,
-3.075103, -3.458601, 5.801437,
2.981574, -3.458601, 5.801437,
-3.075103, 2.964569, -5.353696,
2.981574, 2.964569, -5.353696,
-3.075103, 2.964569, 5.801437,
2.981574, 2.964569, 5.801437,
2.981574, -3.458601, -5.353696,
2.981574, 2.964569, -5.353696,
2.981574, -3.458601, 5.801437,
2.981574, 2.964569, 5.801437,
2.981574, -3.458601, -5.353696,
2.981574, -3.458601, 5.801437,
2.981574, 2.964569, -5.353696,
2.981574, 2.964569, 5.801437
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
var radius = 7.596377;
var distance = 33.79714;
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
mvMatrix.translate( 0.04676461, 0.2470156, -0.2238708 );
mvMatrix.scale( 1.356082, 1.278707, 0.7362845 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79714);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
cloethocarb<-read.table("cloethocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cloethocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'cloethocarb' not found
```

```r
y<-cloethocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'cloethocarb' not found
```

```r
z<-cloethocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'cloethocarb' not found
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
-2.986899, -0.793907, -1.524375, 0, 0, 1, 1, 1,
-2.961177, 1.546304, -1.123306, 1, 0, 0, 1, 1,
-2.865512, 0.7888036, -2.286652, 1, 0, 0, 1, 1,
-2.718942, 0.7548709, -0.5141336, 1, 0, 0, 1, 1,
-2.5921, -0.6985373, -3.460306, 1, 0, 0, 1, 1,
-2.538524, 0.848484, -0.06430429, 1, 0, 0, 1, 1,
-2.484424, -0.9584706, -2.611869, 0, 0, 0, 1, 1,
-2.423456, -0.9399451, -2.422725, 0, 0, 0, 1, 1,
-2.418647, -0.02174404, -3.728071, 0, 0, 0, 1, 1,
-2.379076, -2.148792, -2.206732, 0, 0, 0, 1, 1,
-2.284644, 0.2896125, -2.951584, 0, 0, 0, 1, 1,
-2.281919, 0.1183763, -0.5636724, 0, 0, 0, 1, 1,
-2.276271, -0.5480137, -0.2193541, 0, 0, 0, 1, 1,
-2.225803, 0.5222253, -1.285643, 1, 1, 1, 1, 1,
-2.182535, 0.2614454, -0.246225, 1, 1, 1, 1, 1,
-2.158544, 0.8124853, -0.9290301, 1, 1, 1, 1, 1,
-2.144252, 1.054375, -0.3114837, 1, 1, 1, 1, 1,
-2.100779, 0.5654582, -0.6564295, 1, 1, 1, 1, 1,
-2.097647, 0.9330828, -2.347893, 1, 1, 1, 1, 1,
-2.052574, -0.5548818, -1.340124, 1, 1, 1, 1, 1,
-2.033286, -0.3339908, -1.297682, 1, 1, 1, 1, 1,
-2.012333, -0.6901122, -1.012432, 1, 1, 1, 1, 1,
-1.998959, -0.2684916, 0.03663737, 1, 1, 1, 1, 1,
-1.987158, 2.296899, -1.428408, 1, 1, 1, 1, 1,
-1.963899, 0.4764268, -1.379103, 1, 1, 1, 1, 1,
-1.960551, -1.202332, -3.293679, 1, 1, 1, 1, 1,
-1.931035, 1.136491, -1.394413, 1, 1, 1, 1, 1,
-1.912918, -1.437898, -1.229282, 1, 1, 1, 1, 1,
-1.908023, 2.019568, -1.617125, 0, 0, 1, 1, 1,
-1.905387, -1.197, -2.217077, 1, 0, 0, 1, 1,
-1.898767, -1.635972, -0.5254065, 1, 0, 0, 1, 1,
-1.887352, 0.5026583, -0.8793398, 1, 0, 0, 1, 1,
-1.884196, -0.4659432, -2.166597, 1, 0, 0, 1, 1,
-1.877331, -0.6397969, -0.4976266, 1, 0, 0, 1, 1,
-1.833684, 0.673724, -4.261994, 0, 0, 0, 1, 1,
-1.825095, -0.0122796, -2.127747, 0, 0, 0, 1, 1,
-1.821782, 0.5648882, -1.635614, 0, 0, 0, 1, 1,
-1.785347, 0.09983695, -2.01243, 0, 0, 0, 1, 1,
-1.778001, -0.05961712, -1.102431, 0, 0, 0, 1, 1,
-1.777071, -0.823382, -3.689989, 0, 0, 0, 1, 1,
-1.775802, 1.92761, -0.2868, 0, 0, 0, 1, 1,
-1.755086, 1.025539, -2.145759, 1, 1, 1, 1, 1,
-1.736464, 0.7034427, -1.793858, 1, 1, 1, 1, 1,
-1.734887, 1.149513, -0.3360925, 1, 1, 1, 1, 1,
-1.725651, 0.08667025, -0.2736416, 1, 1, 1, 1, 1,
-1.714087, 0.3616219, 0.4757827, 1, 1, 1, 1, 1,
-1.697837, -0.1838744, -1.390591, 1, 1, 1, 1, 1,
-1.672242, -1.266266, -2.969214, 1, 1, 1, 1, 1,
-1.670462, 0.8513395, -0.9886537, 1, 1, 1, 1, 1,
-1.666824, 0.2077419, -0.4238109, 1, 1, 1, 1, 1,
-1.661086, 0.1806402, -2.660663, 1, 1, 1, 1, 1,
-1.630277, 0.4294646, -2.425382, 1, 1, 1, 1, 1,
-1.630242, -1.258167, -1.737245, 1, 1, 1, 1, 1,
-1.610565, -1.344966, -2.481945, 1, 1, 1, 1, 1,
-1.597179, 1.156285, -1.17877, 1, 1, 1, 1, 1,
-1.593477, -1.346701, -0.362906, 1, 1, 1, 1, 1,
-1.587796, -0.1755803, -1.436051, 0, 0, 1, 1, 1,
-1.586401, -1.108476, -3.824097, 1, 0, 0, 1, 1,
-1.582357, -1.172227, -1.965325, 1, 0, 0, 1, 1,
-1.580948, 1.199288, -1.097132, 1, 0, 0, 1, 1,
-1.577207, 0.05330538, -2.510241, 1, 0, 0, 1, 1,
-1.567651, -0.06279881, 0.4680957, 1, 0, 0, 1, 1,
-1.564277, 1.821317, -0.01253764, 0, 0, 0, 1, 1,
-1.55818, -0.5473691, -1.094747, 0, 0, 0, 1, 1,
-1.536428, -0.8468665, -2.224286, 0, 0, 0, 1, 1,
-1.536411, -0.16848, -2.064147, 0, 0, 0, 1, 1,
-1.511141, -1.651181, -4.157254, 0, 0, 0, 1, 1,
-1.506669, -0.2926154, -1.755715, 0, 0, 0, 1, 1,
-1.494497, -0.1181701, -1.729086, 0, 0, 0, 1, 1,
-1.488836, -1.193251, -1.964793, 1, 1, 1, 1, 1,
-1.48435, 0.04885105, -0.7933915, 1, 1, 1, 1, 1,
-1.471808, 0.5896268, -1.1576, 1, 1, 1, 1, 1,
-1.470396, 0.04482302, -1.618552, 1, 1, 1, 1, 1,
-1.455071, -1.443714, -3.581051, 1, 1, 1, 1, 1,
-1.454444, 0.456485, -1.07542, 1, 1, 1, 1, 1,
-1.438273, -0.5117261, -2.679026, 1, 1, 1, 1, 1,
-1.43794, -2.030681, -1.728808, 1, 1, 1, 1, 1,
-1.434228, -0.1137835, -1.792329, 1, 1, 1, 1, 1,
-1.429499, 0.1535282, -2.39756, 1, 1, 1, 1, 1,
-1.428804, 1.592305, -2.75762, 1, 1, 1, 1, 1,
-1.427466, -1.670223, -2.889766, 1, 1, 1, 1, 1,
-1.419124, 0.3404334, -0.6445705, 1, 1, 1, 1, 1,
-1.411345, -0.7708247, -1.611946, 1, 1, 1, 1, 1,
-1.406528, -1.161926, -1.271432, 1, 1, 1, 1, 1,
-1.397717, -0.009901132, -1.598538, 0, 0, 1, 1, 1,
-1.393272, -1.036396, -3.589998, 1, 0, 0, 1, 1,
-1.392927, 0.3003589, -1.966622, 1, 0, 0, 1, 1,
-1.385545, 0.8129272, -1.08841, 1, 0, 0, 1, 1,
-1.370873, 2.420528, -0.5742804, 1, 0, 0, 1, 1,
-1.362223, 0.2710448, -2.280751, 1, 0, 0, 1, 1,
-1.360938, -2.728662, -3.617167, 0, 0, 0, 1, 1,
-1.359035, 1.088354, -1.472489, 0, 0, 0, 1, 1,
-1.345852, -0.6115471, -3.121811, 0, 0, 0, 1, 1,
-1.326072, 0.3872841, -1.28877, 0, 0, 0, 1, 1,
-1.325797, -0.03730574, -0.1208531, 0, 0, 0, 1, 1,
-1.324613, -0.6346902, 0.2374662, 0, 0, 0, 1, 1,
-1.324502, -0.1387726, -3.02937, 0, 0, 0, 1, 1,
-1.323696, -1.229217, -4.904047, 1, 1, 1, 1, 1,
-1.311972, -0.05598352, -1.913918, 1, 1, 1, 1, 1,
-1.309641, 0.5675066, -1.014355, 1, 1, 1, 1, 1,
-1.299469, -0.2225134, -2.256114, 1, 1, 1, 1, 1,
-1.279019, -0.9861639, -1.168386, 1, 1, 1, 1, 1,
-1.268736, -2.251386, -3.803363, 1, 1, 1, 1, 1,
-1.267394, 0.9786333, -0.2744767, 1, 1, 1, 1, 1,
-1.258286, -1.074625, -3.277608, 1, 1, 1, 1, 1,
-1.255481, -1.3021, -2.793431, 1, 1, 1, 1, 1,
-1.244384, -0.4445592, -1.870112, 1, 1, 1, 1, 1,
-1.223241, -0.52364, -0.7457647, 1, 1, 1, 1, 1,
-1.220927, 0.6997505, -2.052315, 1, 1, 1, 1, 1,
-1.215183, -0.9366983, -3.758588, 1, 1, 1, 1, 1,
-1.198075, -1.295785, -2.726562, 1, 1, 1, 1, 1,
-1.193306, 0.462423, -0.7806444, 1, 1, 1, 1, 1,
-1.188633, 0.7441188, -2.250734, 0, 0, 1, 1, 1,
-1.175275, 0.2081505, -2.933921, 1, 0, 0, 1, 1,
-1.175252, -0.7986336, -2.96354, 1, 0, 0, 1, 1,
-1.174748, 0.1689294, -2.592999, 1, 0, 0, 1, 1,
-1.167901, 1.759925, -2.862896, 1, 0, 0, 1, 1,
-1.167882, 0.6239325, 0.3951641, 1, 0, 0, 1, 1,
-1.159837, 0.2075719, -1.084857, 0, 0, 0, 1, 1,
-1.158063, -0.9482802, -3.60585, 0, 0, 0, 1, 1,
-1.155383, 0.7880964, -0.5096301, 0, 0, 0, 1, 1,
-1.148513, -0.8890439, -2.289295, 0, 0, 0, 1, 1,
-1.146179, -0.6331154, -1.81551, 0, 0, 0, 1, 1,
-1.140121, 1.226779, 0.1221947, 0, 0, 0, 1, 1,
-1.13234, -1.113664, -3.085406, 0, 0, 0, 1, 1,
-1.127888, 0.7918715, -1.654594, 1, 1, 1, 1, 1,
-1.120389, 0.1709397, -0.421431, 1, 1, 1, 1, 1,
-1.116822, -0.8839155, -2.360898, 1, 1, 1, 1, 1,
-1.087594, 0.04603237, -1.995341, 1, 1, 1, 1, 1,
-1.083046, -0.8715791, -2.591641, 1, 1, 1, 1, 1,
-1.070843, 1.489091, -1.082079, 1, 1, 1, 1, 1,
-1.059028, -0.9941403, -2.237538, 1, 1, 1, 1, 1,
-1.056973, -0.02416435, -0.9617404, 1, 1, 1, 1, 1,
-1.055351, -1.535097, -2.528201, 1, 1, 1, 1, 1,
-1.052284, -1.297526, -1.95273, 1, 1, 1, 1, 1,
-1.051143, -0.9782106, -2.088101, 1, 1, 1, 1, 1,
-1.038641, -0.5912027, -1.454261, 1, 1, 1, 1, 1,
-1.035934, -0.4758741, -2.287298, 1, 1, 1, 1, 1,
-1.03329, -0.05652904, -2.27631, 1, 1, 1, 1, 1,
-1.031047, -0.1401818, -1.487987, 1, 1, 1, 1, 1,
-1.02653, 0.5405115, 0.09211072, 0, 0, 1, 1, 1,
-1.023173, 0.1837073, -0.6608812, 1, 0, 0, 1, 1,
-1.019533, 0.578456, 0.7340648, 1, 0, 0, 1, 1,
-1.017879, -0.9151502, -1.370112, 1, 0, 0, 1, 1,
-1.014451, 0.5827736, -2.294545, 1, 0, 0, 1, 1,
-1.010157, -0.1804942, -0.8165616, 1, 0, 0, 1, 1,
-1.006713, 0.7258667, 0.009326285, 0, 0, 0, 1, 1,
-1.003828, -1.207926, -1.720681, 0, 0, 0, 1, 1,
-1.003574, 0.8437808, -1.777543, 0, 0, 0, 1, 1,
-0.9979275, -0.5823687, -0.4451976, 0, 0, 0, 1, 1,
-0.9955906, 0.1853424, -3.043553, 0, 0, 0, 1, 1,
-0.9941801, -0.2725719, -1.885582, 0, 0, 0, 1, 1,
-0.9902138, -0.5658779, -1.053031, 0, 0, 0, 1, 1,
-0.9889029, 1.501636, -2.297254, 1, 1, 1, 1, 1,
-0.9754189, 1.288144, 0.1040994, 1, 1, 1, 1, 1,
-0.9674252, 1.589431, -0.213447, 1, 1, 1, 1, 1,
-0.9672912, -1.165915, -4.449551, 1, 1, 1, 1, 1,
-0.9637518, 0.7989076, 1.810377, 1, 1, 1, 1, 1,
-0.9631714, 0.907398, -0.5884454, 1, 1, 1, 1, 1,
-0.9558387, -0.6371149, -2.925506, 1, 1, 1, 1, 1,
-0.9462645, 0.592369, -1.958206, 1, 1, 1, 1, 1,
-0.9420443, 2.609675, -0.7881256, 1, 1, 1, 1, 1,
-0.9306807, 0.3445472, -2.069515, 1, 1, 1, 1, 1,
-0.9292049, 0.381631, -0.8294585, 1, 1, 1, 1, 1,
-0.9198071, -0.1434311, -1.86524, 1, 1, 1, 1, 1,
-0.9186915, 0.5548642, 0.2162752, 1, 1, 1, 1, 1,
-0.9184683, -0.7525067, -2.676057, 1, 1, 1, 1, 1,
-0.9151214, -0.3288547, -2.74332, 1, 1, 1, 1, 1,
-0.9137477, -1.521139, -2.159501, 0, 0, 1, 1, 1,
-0.9065525, 0.2352928, -2.937718, 1, 0, 0, 1, 1,
-0.9035197, 1.551915, -1.824977, 1, 0, 0, 1, 1,
-0.9023002, 0.1532971, -3.267949, 1, 0, 0, 1, 1,
-0.9012117, -0.1418398, -0.1848555, 1, 0, 0, 1, 1,
-0.8985938, 0.5543268, -0.09979976, 1, 0, 0, 1, 1,
-0.8972308, -0.1956267, 0.3896308, 0, 0, 0, 1, 1,
-0.8963054, 0.01952219, -1.507746, 0, 0, 0, 1, 1,
-0.8933005, -0.5766679, -4.310665, 0, 0, 0, 1, 1,
-0.8864273, -0.6098811, -1.125825, 0, 0, 0, 1, 1,
-0.8856238, -0.6165918, -2.817297, 0, 0, 0, 1, 1,
-0.8825583, -0.6117178, -3.739207, 0, 0, 0, 1, 1,
-0.8824774, -2.33299, -2.763476, 0, 0, 0, 1, 1,
-0.8800399, -0.1857255, -4.132677, 1, 1, 1, 1, 1,
-0.8710008, -1.349563, -3.451471, 1, 1, 1, 1, 1,
-0.8706406, 0.4805589, -0.7294669, 1, 1, 1, 1, 1,
-0.8698891, 0.0903079, -1.194464, 1, 1, 1, 1, 1,
-0.8689247, 1.102692, -1.120016, 1, 1, 1, 1, 1,
-0.8652617, 1.462426, -1.509729, 1, 1, 1, 1, 1,
-0.8609984, -1.747521, -4.035208, 1, 1, 1, 1, 1,
-0.8609685, 0.0305735, -0.9933717, 1, 1, 1, 1, 1,
-0.8555309, -0.5810301, -2.166933, 1, 1, 1, 1, 1,
-0.8546203, -0.3199849, -1.953652, 1, 1, 1, 1, 1,
-0.8447905, -0.3662716, -2.131302, 1, 1, 1, 1, 1,
-0.8427002, -1.445081, -3.491363, 1, 1, 1, 1, 1,
-0.8276407, 0.4155693, -1.156635, 1, 1, 1, 1, 1,
-0.8185611, 1.0705, -0.7300749, 1, 1, 1, 1, 1,
-0.8173601, -0.5166726, -1.938722, 1, 1, 1, 1, 1,
-0.8150154, 2.129767, -0.6700559, 0, 0, 1, 1, 1,
-0.8118472, -1.435575, -2.240615, 1, 0, 0, 1, 1,
-0.8112071, -0.7427247, -2.635377, 1, 0, 0, 1, 1,
-0.8099485, 1.580412, 0.5631946, 1, 0, 0, 1, 1,
-0.8080872, -1.177542, -2.590213, 1, 0, 0, 1, 1,
-0.8061832, 1.619642, -1.575514, 1, 0, 0, 1, 1,
-0.8053304, -1.811112, -2.264432, 0, 0, 0, 1, 1,
-0.8044137, 1.340787, -0.3459699, 0, 0, 0, 1, 1,
-0.7967268, -0.664919, -3.209152, 0, 0, 0, 1, 1,
-0.7933941, -2.477507, -2.723795, 0, 0, 0, 1, 1,
-0.7908825, 0.138805, -3.018487, 0, 0, 0, 1, 1,
-0.7873775, 0.5910773, -2.440629, 0, 0, 0, 1, 1,
-0.786846, 2.093097, -1.885444, 0, 0, 0, 1, 1,
-0.7834377, -0.07909387, -2.069267, 1, 1, 1, 1, 1,
-0.778996, 2.283887, 1.193458, 1, 1, 1, 1, 1,
-0.7664738, -0.2646716, -2.142039, 1, 1, 1, 1, 1,
-0.7660722, -0.9743351, -0.4189386, 1, 1, 1, 1, 1,
-0.7630136, -0.5693046, -3.603673, 1, 1, 1, 1, 1,
-0.7630134, 1.898627, 0.7797411, 1, 1, 1, 1, 1,
-0.761146, 0.6347003, -0.4521006, 1, 1, 1, 1, 1,
-0.757929, 0.05392674, -2.769295, 1, 1, 1, 1, 1,
-0.7568882, 1.799799, 1.054409, 1, 1, 1, 1, 1,
-0.7544841, -1.554477, -3.066761, 1, 1, 1, 1, 1,
-0.753051, -1.088062, -1.792224, 1, 1, 1, 1, 1,
-0.7521697, -0.4207873, -1.857891, 1, 1, 1, 1, 1,
-0.7487537, 1.715804, -0.9571388, 1, 1, 1, 1, 1,
-0.7450731, 0.4785092, 0.004386702, 1, 1, 1, 1, 1,
-0.7448227, 0.3438836, -0.7426497, 1, 1, 1, 1, 1,
-0.7375091, 0.05540886, -1.63069, 0, 0, 1, 1, 1,
-0.7374206, -0.8941173, -1.957227, 1, 0, 0, 1, 1,
-0.7353655, -0.1567236, -0.9264139, 1, 0, 0, 1, 1,
-0.7320135, 0.2958059, -1.143275, 1, 0, 0, 1, 1,
-0.7271264, -1.027763, -1.014567, 1, 0, 0, 1, 1,
-0.7198039, -1.047626, -3.116606, 1, 0, 0, 1, 1,
-0.7192808, 0.7696947, -1.151922, 0, 0, 0, 1, 1,
-0.7100683, -0.8698762, -2.169582, 0, 0, 0, 1, 1,
-0.7089302, 0.5218105, -2.118807, 0, 0, 0, 1, 1,
-0.7079543, -0.1413721, -0.81883, 0, 0, 0, 1, 1,
-0.702047, 0.6908258, 0.05323685, 0, 0, 0, 1, 1,
-0.7001842, -1.408276, -1.972739, 0, 0, 0, 1, 1,
-0.6981902, 0.4571301, -0.9887862, 0, 0, 0, 1, 1,
-0.6914054, 1.683529, -0.3335058, 1, 1, 1, 1, 1,
-0.6879771, -1.68343, -2.368775, 1, 1, 1, 1, 1,
-0.6847779, -0.1718192, -1.429075, 1, 1, 1, 1, 1,
-0.6803702, -0.4416701, -2.976112, 1, 1, 1, 1, 1,
-0.6745946, -1.443689, -2.914939, 1, 1, 1, 1, 1,
-0.6718312, 1.327102, -1.998471, 1, 1, 1, 1, 1,
-0.6685793, -0.3767787, -0.7352743, 1, 1, 1, 1, 1,
-0.667391, -1.395166, -0.8103499, 1, 1, 1, 1, 1,
-0.6665511, -0.3529874, -2.072862, 1, 1, 1, 1, 1,
-0.6653886, -1.968673, -1.719911, 1, 1, 1, 1, 1,
-0.665055, 0.6808825, -0.3944874, 1, 1, 1, 1, 1,
-0.6650391, 0.4283184, -0.2835718, 1, 1, 1, 1, 1,
-0.6626189, -1.339012, -2.697289, 1, 1, 1, 1, 1,
-0.6598006, -1.498309, -2.428361, 1, 1, 1, 1, 1,
-0.6588188, 0.008609185, -1.007764, 1, 1, 1, 1, 1,
-0.6586521, 0.3303324, -3.623669, 0, 0, 1, 1, 1,
-0.6434783, -1.584813, -2.830775, 1, 0, 0, 1, 1,
-0.6396735, 0.1023161, -1.49969, 1, 0, 0, 1, 1,
-0.6389725, -1.541257, -2.672459, 1, 0, 0, 1, 1,
-0.6384205, 0.6898537, -3.009883, 1, 0, 0, 1, 1,
-0.6373856, -1.185674, -2.6924, 1, 0, 0, 1, 1,
-0.6362696, 1.534402, -0.3458027, 0, 0, 0, 1, 1,
-0.6358032, 0.8458369, -0.6333352, 0, 0, 0, 1, 1,
-0.6251799, 0.1769666, -0.6540166, 0, 0, 0, 1, 1,
-0.6219451, 1.241104, -1.060049, 0, 0, 0, 1, 1,
-0.6212755, -0.3164096, -0.4271223, 0, 0, 0, 1, 1,
-0.6198216, 0.1059652, -2.169192, 0, 0, 0, 1, 1,
-0.6190915, -0.9790507, -3.658955, 0, 0, 0, 1, 1,
-0.6183047, 0.7467925, -0.05383392, 1, 1, 1, 1, 1,
-0.6171896, 1.697697, 0.1591839, 1, 1, 1, 1, 1,
-0.6062559, 1.355942, 0.2754203, 1, 1, 1, 1, 1,
-0.6054361, -0.1125362, -0.8425681, 1, 1, 1, 1, 1,
-0.603694, -0.1864046, -2.667759, 1, 1, 1, 1, 1,
-0.599787, -0.81015, -0.8700212, 1, 1, 1, 1, 1,
-0.5985447, -1.315671, -2.660947, 1, 1, 1, 1, 1,
-0.5983559, 0.9096652, -1.584088, 1, 1, 1, 1, 1,
-0.5977762, 0.5011805, -1.044125, 1, 1, 1, 1, 1,
-0.5869021, 0.08820312, -0.253963, 1, 1, 1, 1, 1,
-0.5844633, 0.296527, -0.2948395, 1, 1, 1, 1, 1,
-0.5829883, -2.573575, -4.748534, 1, 1, 1, 1, 1,
-0.5803442, -0.4497758, -2.719817, 1, 1, 1, 1, 1,
-0.5773779, 0.6817136, 0.02074986, 1, 1, 1, 1, 1,
-0.5740553, -2.131702, -2.513184, 1, 1, 1, 1, 1,
-0.5687507, 0.2862974, -0.2694836, 0, 0, 1, 1, 1,
-0.5680629, -0.6435226, -1.372392, 1, 0, 0, 1, 1,
-0.5679795, -2.012268, -3.408845, 1, 0, 0, 1, 1,
-0.5604419, 0.8539181, 2.389402, 1, 0, 0, 1, 1,
-0.5572877, 0.05502147, -1.985554, 1, 0, 0, 1, 1,
-0.5489141, 1.861827, -0.7806106, 1, 0, 0, 1, 1,
-0.5461354, 0.9783653, 0.1503715, 0, 0, 0, 1, 1,
-0.5455841, 1.451783, -1.144904, 0, 0, 0, 1, 1,
-0.5445221, -0.3967984, -4.529199, 0, 0, 0, 1, 1,
-0.5315166, -0.8447394, -1.734857, 0, 0, 0, 1, 1,
-0.5299093, -1.446838, -1.979749, 0, 0, 0, 1, 1,
-0.5295753, -0.8783503, -3.523527, 0, 0, 0, 1, 1,
-0.5294859, -0.2978019, -2.876084, 0, 0, 0, 1, 1,
-0.5289688, 0.9724218, -1.098987, 1, 1, 1, 1, 1,
-0.5205147, 2.004816, 0.9145873, 1, 1, 1, 1, 1,
-0.5145786, -0.06552095, -1.577552, 1, 1, 1, 1, 1,
-0.5080329, 0.1848447, 0.07412847, 1, 1, 1, 1, 1,
-0.5069613, 0.6160998, -2.695379, 1, 1, 1, 1, 1,
-0.5041565, -1.473957, -2.738812, 1, 1, 1, 1, 1,
-0.5018815, -1.054956, -2.613171, 1, 1, 1, 1, 1,
-0.5012022, -1.165909, -4.074588, 1, 1, 1, 1, 1,
-0.5001856, -0.5109779, 0.09984418, 1, 1, 1, 1, 1,
-0.4966996, 0.2210111, -1.667665, 1, 1, 1, 1, 1,
-0.48927, 0.3393443, -1.23999, 1, 1, 1, 1, 1,
-0.4846693, -0.8237365, -2.889717, 1, 1, 1, 1, 1,
-0.4813669, -0.7928093, -1.196867, 1, 1, 1, 1, 1,
-0.4810504, -0.3536904, -4.140304, 1, 1, 1, 1, 1,
-0.4793712, -1.45885, -3.409384, 1, 1, 1, 1, 1,
-0.4783498, 1.083686, -0.6434003, 0, 0, 1, 1, 1,
-0.4568764, -0.7030985, -3.119045, 1, 0, 0, 1, 1,
-0.4514285, -0.4061397, -1.994444, 1, 0, 0, 1, 1,
-0.4489747, 0.8059121, -0.7878035, 1, 0, 0, 1, 1,
-0.4480287, 0.8159848, 0.6744292, 1, 0, 0, 1, 1,
-0.4439663, 0.4362595, -0.5826571, 1, 0, 0, 1, 1,
-0.4415961, -0.846234, -1.420521, 0, 0, 0, 1, 1,
-0.4392052, 0.1576561, -1.128507, 0, 0, 0, 1, 1,
-0.4381743, -1.356358, -1.301274, 0, 0, 0, 1, 1,
-0.4356799, -0.1173748, -2.842591, 0, 0, 0, 1, 1,
-0.4323011, 0.787623, 0.179011, 0, 0, 0, 1, 1,
-0.4318586, 0.5284862, -1.08707, 0, 0, 0, 1, 1,
-0.4305848, 0.4869178, 0.3900041, 0, 0, 0, 1, 1,
-0.4261824, 0.4601431, -0.3936461, 1, 1, 1, 1, 1,
-0.4255632, -0.1130705, -0.439396, 1, 1, 1, 1, 1,
-0.4188923, -0.1645914, -2.374108, 1, 1, 1, 1, 1,
-0.4174759, -0.09516753, -0.8276523, 1, 1, 1, 1, 1,
-0.4168554, -0.5796055, -2.944151, 1, 1, 1, 1, 1,
-0.4100971, 0.1353673, -0.7487953, 1, 1, 1, 1, 1,
-0.40995, -0.01411478, -1.954081, 1, 1, 1, 1, 1,
-0.4060386, -0.733808, -2.075821, 1, 1, 1, 1, 1,
-0.405652, -1.152529, -1.087226, 1, 1, 1, 1, 1,
-0.400454, 1.439727, -2.074785, 1, 1, 1, 1, 1,
-0.3969881, -0.7003747, -1.673944, 1, 1, 1, 1, 1,
-0.3921643, -0.6262208, -3.74316, 1, 1, 1, 1, 1,
-0.3913689, -0.2740289, -1.416297, 1, 1, 1, 1, 1,
-0.3875192, -1.765711, -4.356991, 1, 1, 1, 1, 1,
-0.3874936, 0.300608, -1.095851, 1, 1, 1, 1, 1,
-0.3868759, 0.7565135, -0.5896694, 0, 0, 1, 1, 1,
-0.3866621, 0.8016, -1.323475, 1, 0, 0, 1, 1,
-0.3784051, -0.2827726, -2.318442, 1, 0, 0, 1, 1,
-0.377983, -0.218073, -3.436271, 1, 0, 0, 1, 1,
-0.3768676, -1.490279, -2.928653, 1, 0, 0, 1, 1,
-0.3712577, 1.086881, -1.331728, 1, 0, 0, 1, 1,
-0.3709497, -0.2409769, -3.189999, 0, 0, 0, 1, 1,
-0.370285, -0.1621855, -3.409711, 0, 0, 0, 1, 1,
-0.3683476, 0.5380937, 1.000727, 0, 0, 0, 1, 1,
-0.3650674, 0.7165118, -0.7049105, 0, 0, 0, 1, 1,
-0.3610245, -0.3848552, -3.118176, 0, 0, 0, 1, 1,
-0.3598126, 0.1398806, -1.628546, 0, 0, 0, 1, 1,
-0.3593376, 1.023893, 0.9854901, 0, 0, 0, 1, 1,
-0.3591617, -0.1043099, -1.128883, 1, 1, 1, 1, 1,
-0.3506753, -0.1499086, -3.43949, 1, 1, 1, 1, 1,
-0.3484721, -1.478582, -4.262568, 1, 1, 1, 1, 1,
-0.3440197, -0.86886, -3.42714, 1, 1, 1, 1, 1,
-0.3410105, -1.079285, -2.3195, 1, 1, 1, 1, 1,
-0.3368988, -1.972855, -1.837277, 1, 1, 1, 1, 1,
-0.3350082, -1.012344, -2.327305, 1, 1, 1, 1, 1,
-0.334021, 0.7145616, -0.9440795, 1, 1, 1, 1, 1,
-0.3299095, -2.442194, -2.070445, 1, 1, 1, 1, 1,
-0.3255703, -0.3966063, -2.162876, 1, 1, 1, 1, 1,
-0.3221742, 2.30002, 1.334231, 1, 1, 1, 1, 1,
-0.3194546, 0.5524058, 0.8692396, 1, 1, 1, 1, 1,
-0.3121762, 0.5236084, -0.5603141, 1, 1, 1, 1, 1,
-0.3104639, -1.425278, -3.364587, 1, 1, 1, 1, 1,
-0.3064258, 1.470925, -0.01014922, 1, 1, 1, 1, 1,
-0.3060724, -0.8917283, -4.816577, 0, 0, 1, 1, 1,
-0.3031527, -0.3524767, -2.702128, 1, 0, 0, 1, 1,
-0.3009556, 0.1485856, -1.984049, 1, 0, 0, 1, 1,
-0.2999896, -0.1428928, -1.081857, 1, 0, 0, 1, 1,
-0.2998911, -0.2666791, -3.452682, 1, 0, 0, 1, 1,
-0.2942637, 0.5720558, -2.155683, 1, 0, 0, 1, 1,
-0.2936355, -0.5533809, -2.309941, 0, 0, 0, 1, 1,
-0.290018, -2.107032, -3.914865, 0, 0, 0, 1, 1,
-0.2841231, 0.09699386, 0.5755016, 0, 0, 0, 1, 1,
-0.2801771, 0.4282064, -0.3712903, 0, 0, 0, 1, 1,
-0.2766314, -0.2208744, -3.142697, 0, 0, 0, 1, 1,
-0.2743123, -1.35276, -4.090053, 0, 0, 0, 1, 1,
-0.2670591, -1.182821, -5.191243, 0, 0, 0, 1, 1,
-0.2666, -0.4118264, -4.681262, 1, 1, 1, 1, 1,
-0.2642179, -0.7812409, -0.4563765, 1, 1, 1, 1, 1,
-0.2641604, -0.2183215, -2.555618, 1, 1, 1, 1, 1,
-0.2515576, 2.091237, -0.6064219, 1, 1, 1, 1, 1,
-0.2490354, 0.6897783, -0.2972217, 1, 1, 1, 1, 1,
-0.2489984, 0.2075039, 0.2796703, 1, 1, 1, 1, 1,
-0.244975, -0.3969283, -2.378291, 1, 1, 1, 1, 1,
-0.2437465, -0.04873766, -1.437626, 1, 1, 1, 1, 1,
-0.2430618, 0.2762354, 0.190311, 1, 1, 1, 1, 1,
-0.2415512, -1.076274, -3.018193, 1, 1, 1, 1, 1,
-0.2411016, 0.332109, 1.555752, 1, 1, 1, 1, 1,
-0.2406696, 0.5575983, -1.218124, 1, 1, 1, 1, 1,
-0.2385847, -0.2002805, -3.075087, 1, 1, 1, 1, 1,
-0.2356429, 2.389719, -2.473911, 1, 1, 1, 1, 1,
-0.2315327, 1.218835, 0.1149345, 1, 1, 1, 1, 1,
-0.2290782, 0.3257318, 0.3039214, 0, 0, 1, 1, 1,
-0.228435, 0.3396031, 1.161424, 1, 0, 0, 1, 1,
-0.2257269, 0.6348739, -0.5600737, 1, 0, 0, 1, 1,
-0.2236073, -2.268001, -3.326636, 1, 0, 0, 1, 1,
-0.215689, -0.473542, -3.033794, 1, 0, 0, 1, 1,
-0.2130725, -0.3066403, -2.86184, 1, 0, 0, 1, 1,
-0.2129525, 0.1303753, -0.791632, 0, 0, 0, 1, 1,
-0.2118002, 1.269142, 1.30391, 0, 0, 0, 1, 1,
-0.2084866, 0.4252663, 1.533287, 0, 0, 0, 1, 1,
-0.2073132, -1.112177, -4.245443, 0, 0, 0, 1, 1,
-0.206974, 1.041387, -0.09797153, 0, 0, 0, 1, 1,
-0.206749, 0.649442, -0.7328129, 0, 0, 0, 1, 1,
-0.2048041, -0.004917409, -0.9544839, 0, 0, 0, 1, 1,
-0.2035657, -0.07087234, -3.395498, 1, 1, 1, 1, 1,
-0.2021374, -0.3935608, -3.526091, 1, 1, 1, 1, 1,
-0.1925839, 0.4163854, -1.751308, 1, 1, 1, 1, 1,
-0.1913995, 1.047226, 0.1894294, 1, 1, 1, 1, 1,
-0.1895226, -0.455231, -3.556976, 1, 1, 1, 1, 1,
-0.1891497, -0.9645442, -3.114722, 1, 1, 1, 1, 1,
-0.1884997, 1.730982, -0.323097, 1, 1, 1, 1, 1,
-0.1856113, -0.1977375, -2.760266, 1, 1, 1, 1, 1,
-0.1821562, -0.8182523, -2.572782, 1, 1, 1, 1, 1,
-0.1790712, -0.9523261, -3.426654, 1, 1, 1, 1, 1,
-0.1764267, -0.2729006, -2.938202, 1, 1, 1, 1, 1,
-0.174123, 0.8445119, 0.5918754, 1, 1, 1, 1, 1,
-0.1711338, -0.2128371, -2.71548, 1, 1, 1, 1, 1,
-0.1679417, 0.09612, -1.237718, 1, 1, 1, 1, 1,
-0.1656818, -2.853496, -3.13881, 1, 1, 1, 1, 1,
-0.1649257, -1.332834, -1.667063, 0, 0, 1, 1, 1,
-0.1606918, -0.8234224, -2.568932, 1, 0, 0, 1, 1,
-0.1586711, -0.6579801, -2.152589, 1, 0, 0, 1, 1,
-0.1431812, -1.016328, -2.457572, 1, 0, 0, 1, 1,
-0.1407742, -0.8425111, -1.527247, 1, 0, 0, 1, 1,
-0.1359506, 1.315484, 0.7349703, 1, 0, 0, 1, 1,
-0.1342443, -1.099869, -3.885761, 0, 0, 0, 1, 1,
-0.1332204, -0.6197892, -3.474053, 0, 0, 0, 1, 1,
-0.1286981, 0.6009864, -0.4440412, 0, 0, 0, 1, 1,
-0.1272586, 1.236419, 1.805728, 0, 0, 0, 1, 1,
-0.1182201, 0.9909906, 1.141378, 0, 0, 0, 1, 1,
-0.1172272, -0.8831407, -2.520355, 0, 0, 0, 1, 1,
-0.1112126, -0.9077884, -3.561234, 0, 0, 0, 1, 1,
-0.1031578, -0.8086794, -4.510498, 1, 1, 1, 1, 1,
-0.1018122, 0.7270596, 0.3396204, 1, 1, 1, 1, 1,
-0.1011705, 1.250278, 0.6231767, 1, 1, 1, 1, 1,
-0.0989116, 0.1047931, 0.246427, 1, 1, 1, 1, 1,
-0.09179609, -0.0560543, -1.914519, 1, 1, 1, 1, 1,
-0.08785303, 2.000212, -1.524885, 1, 1, 1, 1, 1,
-0.08678596, 2.302385, 0.03318696, 1, 1, 1, 1, 1,
-0.08658133, -0.6881213, -3.022072, 1, 1, 1, 1, 1,
-0.08628461, 1.929337, 0.8045592, 1, 1, 1, 1, 1,
-0.08075434, 1.79051, -1.388617, 1, 1, 1, 1, 1,
-0.07853337, -0.464119, -2.536867, 1, 1, 1, 1, 1,
-0.07844592, -0.793128, -1.46293, 1, 1, 1, 1, 1,
-0.07176432, -1.35827, -3.936413, 1, 1, 1, 1, 1,
-0.06543787, 0.9910166, -0.474618, 1, 1, 1, 1, 1,
-0.06334205, -2.239332, -2.500349, 1, 1, 1, 1, 1,
-0.05729683, 2.112443, 0.9305178, 0, 0, 1, 1, 1,
-0.05441408, -1.023929, -3.993926, 1, 0, 0, 1, 1,
-0.05067329, -1.935116, -4.668295, 1, 0, 0, 1, 1,
-0.05033858, 1.355069, -0.4443935, 1, 0, 0, 1, 1,
-0.04722998, 1.475514, -1.464051, 1, 0, 0, 1, 1,
-0.04337957, -0.1315375, -3.038063, 1, 0, 0, 1, 1,
-0.04238794, -1.106575, -2.526834, 0, 0, 0, 1, 1,
-0.04232436, 0.8153196, -1.080958, 0, 0, 0, 1, 1,
-0.0406368, -0.7971314, -2.524717, 0, 0, 0, 1, 1,
-0.03984699, 0.3458175, 0.04684267, 0, 0, 0, 1, 1,
-0.03974205, -1.199734, -4.088529, 0, 0, 0, 1, 1,
-0.03925078, -0.4201782, -3.112473, 0, 0, 0, 1, 1,
-0.03497429, 0.6246888, -0.2282259, 0, 0, 0, 1, 1,
-0.0319031, 1.104233, -0.9285083, 1, 1, 1, 1, 1,
-0.02801759, -0.5616316, -4.644795, 1, 1, 1, 1, 1,
-0.02800666, -1.250088, -2.336001, 1, 1, 1, 1, 1,
-0.02548379, 1.205724, 1.438736, 1, 1, 1, 1, 1,
-0.02395741, 0.01120313, -1.603201, 1, 1, 1, 1, 1,
-0.01803656, -0.3967967, -3.627145, 1, 1, 1, 1, 1,
-0.01315174, -0.1923262, -2.868255, 1, 1, 1, 1, 1,
-0.00836804, -2.139868, -2.935314, 1, 1, 1, 1, 1,
-0.005955389, 0.3090115, 0.4088631, 1, 1, 1, 1, 1,
0.001837955, 0.02930263, -0.7041246, 1, 1, 1, 1, 1,
0.002296159, 0.0976532, -1.034734, 1, 1, 1, 1, 1,
0.003555604, -0.5964009, 3.582186, 1, 1, 1, 1, 1,
0.009903509, 0.2792184, 0.5354823, 1, 1, 1, 1, 1,
0.01008748, -0.3369818, 3.508927, 1, 1, 1, 1, 1,
0.0104361, 2.433471, -1.025187, 1, 1, 1, 1, 1,
0.01104824, 0.4247175, 0.5986589, 0, 0, 1, 1, 1,
0.01274199, -0.8942924, 4.448723, 1, 0, 0, 1, 1,
0.01587, 1.022765, -0.5363547, 1, 0, 0, 1, 1,
0.01858051, -0.2619645, 2.526489, 1, 0, 0, 1, 1,
0.01893298, 0.9790616, 1.51853, 1, 0, 0, 1, 1,
0.02138694, -0.0815324, 3.319089, 1, 0, 0, 1, 1,
0.02405092, -0.7887657, 2.842425, 0, 0, 0, 1, 1,
0.02685869, -0.003928777, 0.909162, 0, 0, 0, 1, 1,
0.02834398, -0.4936663, 2.979264, 0, 0, 0, 1, 1,
0.02847471, 0.9639026, -0.9759489, 0, 0, 0, 1, 1,
0.02939631, 0.004879029, 2.34432, 0, 0, 0, 1, 1,
0.03211616, -0.4202993, 2.797408, 0, 0, 0, 1, 1,
0.03288047, 0.495792, -1.429174, 0, 0, 0, 1, 1,
0.03369823, -0.1964415, 3.213255, 1, 1, 1, 1, 1,
0.03492184, 1.506462, -2.218319, 1, 1, 1, 1, 1,
0.03706845, -1.822749, 2.490362, 1, 1, 1, 1, 1,
0.03879607, -1.701121, 3.956632, 1, 1, 1, 1, 1,
0.04065204, 1.436948, -1.581809, 1, 1, 1, 1, 1,
0.04090164, -0.06164908, 2.727221, 1, 1, 1, 1, 1,
0.04532102, -1.124443, 3.157248, 1, 1, 1, 1, 1,
0.04697974, -0.196111, 2.429851, 1, 1, 1, 1, 1,
0.0473423, 0.1823159, 2.644937, 1, 1, 1, 1, 1,
0.0475888, -0.453949, 2.344951, 1, 1, 1, 1, 1,
0.04854136, 0.4599782, 0.4476478, 1, 1, 1, 1, 1,
0.04858254, 0.262637, -0.1264214, 1, 1, 1, 1, 1,
0.04863017, -0.1038045, 2.656625, 1, 1, 1, 1, 1,
0.05297433, -1.674088, 3.052011, 1, 1, 1, 1, 1,
0.055773, -0.790261, 4.213386, 1, 1, 1, 1, 1,
0.05639237, -0.4113036, 3.938831, 0, 0, 1, 1, 1,
0.05673135, -0.2928742, 2.896553, 1, 0, 0, 1, 1,
0.06038576, -0.427511, 2.116651, 1, 0, 0, 1, 1,
0.06953114, 0.8921389, 1.356144, 1, 0, 0, 1, 1,
0.07552791, -0.4137749, 5.333595, 1, 0, 0, 1, 1,
0.07568973, 0.542439, -1.04859, 1, 0, 0, 1, 1,
0.07703265, -0.01927121, 0.4311241, 0, 0, 0, 1, 1,
0.08582701, 0.1331476, -1.978864, 0, 0, 0, 1, 1,
0.08805311, -0.9124529, 2.41169, 0, 0, 0, 1, 1,
0.08840143, -0.1646814, 4.593172, 0, 0, 0, 1, 1,
0.08848566, -0.9690598, 2.027014, 0, 0, 0, 1, 1,
0.08944521, 2.412953, 0.4097324, 0, 0, 0, 1, 1,
0.09037895, -1.135679, 3.799149, 0, 0, 0, 1, 1,
0.09288099, -0.5680386, 4.359338, 1, 1, 1, 1, 1,
0.0936482, -0.3264148, 1.031658, 1, 1, 1, 1, 1,
0.09413975, 0.8125262, 3.10928, 1, 1, 1, 1, 1,
0.09810478, 0.3039951, 1.294418, 1, 1, 1, 1, 1,
0.0982255, -1.162525, 2.208064, 1, 1, 1, 1, 1,
0.09920348, -1.160928, 2.671152, 1, 1, 1, 1, 1,
0.1053697, 0.1212933, 1.367236, 1, 1, 1, 1, 1,
0.1065368, 0.4802578, -0.08804902, 1, 1, 1, 1, 1,
0.1084388, -0.2338996, 3.314762, 1, 1, 1, 1, 1,
0.1106698, -0.1888618, 2.166351, 1, 1, 1, 1, 1,
0.1127554, -0.5204383, 3.085027, 1, 1, 1, 1, 1,
0.1143791, -0.7278534, 4.032974, 1, 1, 1, 1, 1,
0.1169683, 1.493345, -0.2481745, 1, 1, 1, 1, 1,
0.1216367, 0.07030733, 0.6827975, 1, 1, 1, 1, 1,
0.1217978, -0.8811218, 3.566303, 1, 1, 1, 1, 1,
0.1230913, 0.3208207, 1.092588, 0, 0, 1, 1, 1,
0.1235392, 0.1728661, -0.141681, 1, 0, 0, 1, 1,
0.1249162, -1.452388, 3.367606, 1, 0, 0, 1, 1,
0.1250251, -0.9577725, 1.586526, 1, 0, 0, 1, 1,
0.1288909, 2.090321, -0.1289212, 1, 0, 0, 1, 1,
0.136404, 2.00488, 1.032701, 1, 0, 0, 1, 1,
0.1369265, 1.509591, 0.1627152, 0, 0, 0, 1, 1,
0.1374285, 0.1754391, 1.962915, 0, 0, 0, 1, 1,
0.1392866, 0.9020113, 0.4993356, 0, 0, 0, 1, 1,
0.1415706, 0.6374704, 2.263786, 0, 0, 0, 1, 1,
0.1421695, -0.6552632, 4.253761, 0, 0, 0, 1, 1,
0.145265, -0.520824, 3.02733, 0, 0, 0, 1, 1,
0.1502532, -0.2764866, 1.600631, 0, 0, 0, 1, 1,
0.1518296, -0.1334636, 3.07516, 1, 1, 1, 1, 1,
0.153235, -0.2678642, 3.12396, 1, 1, 1, 1, 1,
0.1532675, 0.4370983, 1.26213, 1, 1, 1, 1, 1,
0.155517, 1.507048, 0.5996866, 1, 1, 1, 1, 1,
0.1604025, -1.708957, 3.37827, 1, 1, 1, 1, 1,
0.163028, 0.08792101, 1.155601, 1, 1, 1, 1, 1,
0.172523, 0.4045771, 2.500987, 1, 1, 1, 1, 1,
0.1730956, -0.663078, 2.388281, 1, 1, 1, 1, 1,
0.1759472, -0.6495264, 2.997824, 1, 1, 1, 1, 1,
0.1792997, -0.9411898, 2.140361, 1, 1, 1, 1, 1,
0.1817884, -1.027741, 1.818177, 1, 1, 1, 1, 1,
0.1855593, 0.4258665, 0.8861051, 1, 1, 1, 1, 1,
0.1923795, 0.4110364, 0.2876745, 1, 1, 1, 1, 1,
0.1926636, 0.5796328, 1.420765, 1, 1, 1, 1, 1,
0.1928084, 0.8306596, 1.4631, 1, 1, 1, 1, 1,
0.1937297, -0.6287477, 3.594747, 0, 0, 1, 1, 1,
0.1960589, 1.109318, 0.5479326, 1, 0, 0, 1, 1,
0.2039336, 0.6924669, 1.241512, 1, 0, 0, 1, 1,
0.2046599, 0.2145088, 0.1621641, 1, 0, 0, 1, 1,
0.2060005, -0.1657321, 1.064974, 1, 0, 0, 1, 1,
0.20964, 0.4558328, -1.954695, 1, 0, 0, 1, 1,
0.2148245, -0.7435642, 3.128665, 0, 0, 0, 1, 1,
0.2174743, 0.02317247, 3.036283, 0, 0, 0, 1, 1,
0.2186481, -0.7639985, 3.373304, 0, 0, 0, 1, 1,
0.2192934, -2.578643, 5.342047, 0, 0, 0, 1, 1,
0.2271668, -0.5834905, 3.321657, 0, 0, 0, 1, 1,
0.2288533, -0.3055229, 2.447581, 0, 0, 0, 1, 1,
0.230695, 0.05525288, 1.116042, 0, 0, 0, 1, 1,
0.2315359, -1.428661, 1.88697, 1, 1, 1, 1, 1,
0.2353763, 1.280396, 0.4480499, 1, 1, 1, 1, 1,
0.2403245, 0.2136879, -1.199027, 1, 1, 1, 1, 1,
0.2410671, -0.7728057, 5.142731, 1, 1, 1, 1, 1,
0.2412399, -0.8259105, 3.625616, 1, 1, 1, 1, 1,
0.2477663, -1.208883, 1.182095, 1, 1, 1, 1, 1,
0.2496663, -0.3792613, 3.477834, 1, 1, 1, 1, 1,
0.2535403, 0.07443824, 1.655988, 1, 1, 1, 1, 1,
0.2536434, 0.1470438, 2.070492, 1, 1, 1, 1, 1,
0.2545128, 0.4844948, 2.920299, 1, 1, 1, 1, 1,
0.2547361, 0.8138988, 0.9921004, 1, 1, 1, 1, 1,
0.2579163, -0.8464478, 4.577541, 1, 1, 1, 1, 1,
0.2602448, 0.7884095, 0.3143918, 1, 1, 1, 1, 1,
0.261782, 1.179588, 1.14949, 1, 1, 1, 1, 1,
0.2625908, 1.015321, -2.129637, 1, 1, 1, 1, 1,
0.2685256, 0.9681587, 1.665859, 0, 0, 1, 1, 1,
0.2693775, -0.4480158, 2.489095, 1, 0, 0, 1, 1,
0.2752425, 0.5203823, -0.02432829, 1, 0, 0, 1, 1,
0.2753119, 0.3552184, 0.6380095, 1, 0, 0, 1, 1,
0.2764162, -0.1178814, 2.630138, 1, 0, 0, 1, 1,
0.2792059, 0.3208329, 1.778086, 1, 0, 0, 1, 1,
0.2804382, 0.401949, -0.3299086, 0, 0, 0, 1, 1,
0.2805986, 0.9089512, 0.9395326, 0, 0, 0, 1, 1,
0.2873937, 1.020647, -1.423066, 0, 0, 0, 1, 1,
0.2874563, 0.3856962, 0.5307726, 0, 0, 0, 1, 1,
0.2911665, -1.224349, 3.387868, 0, 0, 0, 1, 1,
0.2912066, 1.261956, 1.280452, 0, 0, 0, 1, 1,
0.2955744, 0.325392, 0.3700676, 0, 0, 0, 1, 1,
0.2963902, 0.3411302, 1.125311, 1, 1, 1, 1, 1,
0.2965369, 1.952816, 0.7621152, 1, 1, 1, 1, 1,
0.2995351, -1.392986, 2.137293, 1, 1, 1, 1, 1,
0.3022937, 0.9964175, -0.9272824, 1, 1, 1, 1, 1,
0.3024076, 0.1639048, 2.633198, 1, 1, 1, 1, 1,
0.3025644, -0.04347327, 0.6399505, 1, 1, 1, 1, 1,
0.3070457, -0.792028, 3.106333, 1, 1, 1, 1, 1,
0.3120313, -0.8664446, 3.015755, 1, 1, 1, 1, 1,
0.3190159, 2.326334, 0.1271648, 1, 1, 1, 1, 1,
0.322627, 0.1886556, 0.5835299, 1, 1, 1, 1, 1,
0.3227196, 0.005319607, 1.9999, 1, 1, 1, 1, 1,
0.3233323, -0.6481652, 3.312958, 1, 1, 1, 1, 1,
0.3250654, -0.4077568, 2.40519, 1, 1, 1, 1, 1,
0.3286317, -1.092576, 1.261142, 1, 1, 1, 1, 1,
0.3289296, -0.2597501, 2.295866, 1, 1, 1, 1, 1,
0.3290689, -1.353694, 3.734408, 0, 0, 1, 1, 1,
0.3320208, 0.3067435, 2.155975, 1, 0, 0, 1, 1,
0.3323411, 1.488162, 1.828657, 1, 0, 0, 1, 1,
0.3350082, 0.46888, 0.5678351, 1, 0, 0, 1, 1,
0.3413592, -1.887267, 3.380675, 1, 0, 0, 1, 1,
0.3418587, -0.1329443, 1.317084, 1, 0, 0, 1, 1,
0.3464547, -1.021045, 4.095325, 0, 0, 0, 1, 1,
0.3495632, 0.6016446, 0.2149743, 0, 0, 0, 1, 1,
0.3584444, 1.136743, -0.307223, 0, 0, 0, 1, 1,
0.3598256, 1.201162, -0.4525371, 0, 0, 0, 1, 1,
0.3627263, 0.791657, -0.6041514, 0, 0, 0, 1, 1,
0.3655687, 0.467849, 1.702565, 0, 0, 0, 1, 1,
0.366823, -1.426623, 2.998692, 0, 0, 0, 1, 1,
0.3713877, -1.950341, 2.471234, 1, 1, 1, 1, 1,
0.3751557, 0.3912147, -0.3230909, 1, 1, 1, 1, 1,
0.3802073, -0.6863092, 3.710643, 1, 1, 1, 1, 1,
0.383384, 0.2652867, -0.1417054, 1, 1, 1, 1, 1,
0.3839869, 0.04777437, 1.141141, 1, 1, 1, 1, 1,
0.3843309, 2.871028, 0.3345649, 1, 1, 1, 1, 1,
0.3874667, 1.410091, -0.9263012, 1, 1, 1, 1, 1,
0.3875141, 0.5665523, 0.471503, 1, 1, 1, 1, 1,
0.3884668, -0.09755188, 1.588309, 1, 1, 1, 1, 1,
0.3980046, -0.8937101, 1.324971, 1, 1, 1, 1, 1,
0.398977, 1.200947, 1.440475, 1, 1, 1, 1, 1,
0.4024345, -0.2055712, 0.8912624, 1, 1, 1, 1, 1,
0.4038239, 0.8220313, 0.6599657, 1, 1, 1, 1, 1,
0.4049543, 0.7915074, -0.7495639, 1, 1, 1, 1, 1,
0.4074124, 1.041551, -0.08948632, 1, 1, 1, 1, 1,
0.4110526, 1.104141, -0.8831623, 0, 0, 1, 1, 1,
0.4120229, -0.2954359, 1.118335, 1, 0, 0, 1, 1,
0.418027, -0.5150043, 2.889013, 1, 0, 0, 1, 1,
0.41811, -0.6418781, 3.333231, 1, 0, 0, 1, 1,
0.4207017, -0.2595093, -0.2676494, 1, 0, 0, 1, 1,
0.4334865, -0.3805472, 0.6287193, 1, 0, 0, 1, 1,
0.435657, 2.027113, 0.7095254, 0, 0, 0, 1, 1,
0.4361454, -2.01773, 2.202241, 0, 0, 0, 1, 1,
0.4362926, 1.337232, 2.431311, 0, 0, 0, 1, 1,
0.4377706, 1.210657, 1.258779, 0, 0, 0, 1, 1,
0.4401351, 0.9562432, -0.2005587, 0, 0, 0, 1, 1,
0.4430346, -2.135468, 3.376952, 0, 0, 0, 1, 1,
0.4457336, 0.6026221, -1.109221, 0, 0, 0, 1, 1,
0.4477975, -0.6870662, 3.542769, 1, 1, 1, 1, 1,
0.4481538, -0.34557, 3.817469, 1, 1, 1, 1, 1,
0.4482884, -0.9555696, 2.710225, 1, 1, 1, 1, 1,
0.4510227, 1.542035, -1.182806, 1, 1, 1, 1, 1,
0.4521163, 0.6329246, -0.1779576, 1, 1, 1, 1, 1,
0.4599356, -1.132856, 2.009343, 1, 1, 1, 1, 1,
0.4621488, -1.850408, 3.815972, 1, 1, 1, 1, 1,
0.4643776, 0.08131082, 0.4153611, 1, 1, 1, 1, 1,
0.4645643, 0.6490337, -1.397921, 1, 1, 1, 1, 1,
0.4654484, -0.5770603, 3.906815, 1, 1, 1, 1, 1,
0.467066, -0.4673523, 0.8387087, 1, 1, 1, 1, 1,
0.4696236, -2.245199, 3.04093, 1, 1, 1, 1, 1,
0.4715328, 0.909797, -0.609478, 1, 1, 1, 1, 1,
0.4817068, -2.018856, 5.638984, 1, 1, 1, 1, 1,
0.4866012, 0.9892697, 1.666997, 1, 1, 1, 1, 1,
0.4955419, -0.3363489, 3.467865, 0, 0, 1, 1, 1,
0.4993015, -0.05747178, 2.440497, 1, 0, 0, 1, 1,
0.4993331, -0.006397367, 2.431497, 1, 0, 0, 1, 1,
0.5041949, -0.002814611, 3.118612, 1, 0, 0, 1, 1,
0.5047615, -0.1797821, 1.511869, 1, 0, 0, 1, 1,
0.5065, -0.5559754, 3.445001, 1, 0, 0, 1, 1,
0.5120658, 1.587874, 0.4927443, 0, 0, 0, 1, 1,
0.5121674, 1.557643, -0.6359803, 0, 0, 0, 1, 1,
0.5127215, 0.680713, 0.4791402, 0, 0, 0, 1, 1,
0.5137209, 0.8807995, -0.2543388, 0, 0, 0, 1, 1,
0.5143418, -0.6884988, 1.099435, 0, 0, 0, 1, 1,
0.5145411, 1.917261, -2.617322, 0, 0, 0, 1, 1,
0.5188046, -0.7575527, 1.152634, 0, 0, 0, 1, 1,
0.5221366, -0.009198142, 1.869618, 1, 1, 1, 1, 1,
0.5232944, 0.4729351, 1.296794, 1, 1, 1, 1, 1,
0.5233276, 1.323083, 2.347264, 1, 1, 1, 1, 1,
0.5292469, 0.135685, 1.63487, 1, 1, 1, 1, 1,
0.5292695, 0.1956322, 1.954981, 1, 1, 1, 1, 1,
0.5308878, 2.733622, -0.0002885163, 1, 1, 1, 1, 1,
0.5324603, -0.7405391, 2.780527, 1, 1, 1, 1, 1,
0.5358228, -1.451209, 2.026348, 1, 1, 1, 1, 1,
0.5367686, 0.1703998, 1.886347, 1, 1, 1, 1, 1,
0.5384045, 1.645682, -0.6703498, 1, 1, 1, 1, 1,
0.5414708, 0.9278549, 2.10735, 1, 1, 1, 1, 1,
0.542338, 0.5890949, 2.15939, 1, 1, 1, 1, 1,
0.5444525, -0.5633494, 3.630799, 1, 1, 1, 1, 1,
0.5446541, 0.2197205, 1.313636, 1, 1, 1, 1, 1,
0.5475652, -0.1484955, 2.807164, 1, 1, 1, 1, 1,
0.5477778, 0.3510253, 0.6593796, 0, 0, 1, 1, 1,
0.5495125, 0.2444326, -1.102877, 1, 0, 0, 1, 1,
0.5532904, -0.4994808, 2.711598, 1, 0, 0, 1, 1,
0.5557148, -0.0803588, -0.8514065, 1, 0, 0, 1, 1,
0.5557339, 0.887734, 1.332048, 1, 0, 0, 1, 1,
0.557117, 0.4369093, 0.9038014, 1, 0, 0, 1, 1,
0.5598658, -0.8063665, 3.853172, 0, 0, 0, 1, 1,
0.566555, -3.212055, 2.371608, 0, 0, 0, 1, 1,
0.5792207, 0.5574648, 0.7464302, 0, 0, 0, 1, 1,
0.5815237, 0.1882978, 0.7213377, 0, 0, 0, 1, 1,
0.5883448, -0.6872863, 3.205414, 0, 0, 0, 1, 1,
0.588365, -2.350886, 4.445742, 0, 0, 0, 1, 1,
0.5912504, 0.8736193, 1.619103, 0, 0, 0, 1, 1,
0.5915065, 0.8448289, 0.2086708, 1, 1, 1, 1, 1,
0.5991006, 1.230931, -0.3690175, 1, 1, 1, 1, 1,
0.6007102, 0.5002086, 3.600775, 1, 1, 1, 1, 1,
0.6008508, 0.02759658, 1.625148, 1, 1, 1, 1, 1,
0.6014624, 1.091228, 2.575337, 1, 1, 1, 1, 1,
0.6025316, -1.648123, 3.255992, 1, 1, 1, 1, 1,
0.6051075, -0.4790399, 2.731924, 1, 1, 1, 1, 1,
0.6057919, 2.053178, -0.2145532, 1, 1, 1, 1, 1,
0.6083015, -0.7694239, 2.866549, 1, 1, 1, 1, 1,
0.6123588, -0.02037983, 2.519752, 1, 1, 1, 1, 1,
0.6127923, -0.6909887, 2.212963, 1, 1, 1, 1, 1,
0.6130255, -0.4290321, 1.57503, 1, 1, 1, 1, 1,
0.6144882, 2.579462, -0.3915619, 1, 1, 1, 1, 1,
0.6161152, 0.4474417, 2.559833, 1, 1, 1, 1, 1,
0.6203524, -0.8878019, 2.071296, 1, 1, 1, 1, 1,
0.632395, 0.7939969, 1.10013, 0, 0, 1, 1, 1,
0.6340901, 0.7768354, 2.413489, 1, 0, 0, 1, 1,
0.6350083, 0.4264208, 0.5752335, 1, 0, 0, 1, 1,
0.6351826, -0.1887444, 3.142461, 1, 0, 0, 1, 1,
0.6445455, 0.6207771, 2.120975, 1, 0, 0, 1, 1,
0.6460603, 0.07236757, 0.7483547, 1, 0, 0, 1, 1,
0.6470876, 0.6242826, 1.016425, 0, 0, 0, 1, 1,
0.652128, -0.9999627, 2.937445, 0, 0, 0, 1, 1,
0.6530202, -1.340663, 2.880562, 0, 0, 0, 1, 1,
0.6557815, -1.230886, 2.20276, 0, 0, 0, 1, 1,
0.6568834, 0.6086418, 2.52945, 0, 0, 0, 1, 1,
0.6605853, 0.298756, 1.798001, 0, 0, 0, 1, 1,
0.6618719, 0.9396191, 1.915979, 0, 0, 0, 1, 1,
0.6618927, -0.5929102, 0.9205351, 1, 1, 1, 1, 1,
0.6663883, 0.8571182, 1.734719, 1, 1, 1, 1, 1,
0.6674086, -0.9111752, 3.653912, 1, 1, 1, 1, 1,
0.6676973, 0.6683805, 1.762901, 1, 1, 1, 1, 1,
0.6689694, -2.012146, 1.284599, 1, 1, 1, 1, 1,
0.6763681, 0.1499449, 1.550651, 1, 1, 1, 1, 1,
0.6787862, 0.5094179, 2.04022, 1, 1, 1, 1, 1,
0.6817492, 0.1004654, 2.656846, 1, 1, 1, 1, 1,
0.6826055, -0.2532724, 1.275025, 1, 1, 1, 1, 1,
0.6874061, -0.2204357, 2.682104, 1, 1, 1, 1, 1,
0.6980044, -0.9827505, 2.574846, 1, 1, 1, 1, 1,
0.6997048, 1.247635, -0.91413, 1, 1, 1, 1, 1,
0.702278, 0.3465643, 0.5068334, 1, 1, 1, 1, 1,
0.7113951, 1.042614, 0.1595326, 1, 1, 1, 1, 1,
0.7180822, -0.6174495, 1.635042, 1, 1, 1, 1, 1,
0.7197232, -1.093766, 3.683072, 0, 0, 1, 1, 1,
0.7287452, 0.9317464, 0.809322, 1, 0, 0, 1, 1,
0.735603, 0.04118965, 0.5770903, 1, 0, 0, 1, 1,
0.7368395, -0.3392981, 4.728398, 1, 0, 0, 1, 1,
0.7372306, 1.039174, -0.5498127, 1, 0, 0, 1, 1,
0.7376136, -0.3745537, 2.773936, 1, 0, 0, 1, 1,
0.7384481, 0.9800535, 0.3411847, 0, 0, 0, 1, 1,
0.7391292, 1.236887, 1.322744, 0, 0, 0, 1, 1,
0.7394998, -2.115046, 3.368607, 0, 0, 0, 1, 1,
0.7418551, 0.008142036, 1.670159, 0, 0, 0, 1, 1,
0.7507351, -0.2038181, 2.254911, 0, 0, 0, 1, 1,
0.7528085, -0.1705862, 1.567531, 0, 0, 0, 1, 1,
0.753918, 0.2821355, 0.9079258, 0, 0, 0, 1, 1,
0.7568316, -0.5008319, 2.354029, 1, 1, 1, 1, 1,
0.7730681, -2.640975, 3.070761, 1, 1, 1, 1, 1,
0.7869849, -0.09204656, 2.233748, 1, 1, 1, 1, 1,
0.7895507, -1.338048, 2.483423, 1, 1, 1, 1, 1,
0.790257, 0.6599137, 1.446617, 1, 1, 1, 1, 1,
0.7910864, 0.03692688, 0.6948659, 1, 1, 1, 1, 1,
0.7962896, -0.8053344, 1.342907, 1, 1, 1, 1, 1,
0.7976071, -0.8469086, 2.328029, 1, 1, 1, 1, 1,
0.8021931, -0.5661124, 3.277633, 1, 1, 1, 1, 1,
0.802916, -1.111693, 3.83616, 1, 1, 1, 1, 1,
0.822211, 1.036607, 1.552756, 1, 1, 1, 1, 1,
0.8286447, -0.8531402, 2.27305, 1, 1, 1, 1, 1,
0.8380602, -0.9939141, 2.528929, 1, 1, 1, 1, 1,
0.8432592, -0.3346761, 0.9625902, 1, 1, 1, 1, 1,
0.8451615, 1.130279, 0.5542698, 1, 1, 1, 1, 1,
0.8472025, 0.6684703, 3.486892, 0, 0, 1, 1, 1,
0.8494577, -0.9947011, 2.41093, 1, 0, 0, 1, 1,
0.8528297, 1.072908, -0.5304216, 1, 0, 0, 1, 1,
0.8582517, -0.1754128, 0.904237, 1, 0, 0, 1, 1,
0.86035, -0.0578309, 2.466458, 1, 0, 0, 1, 1,
0.8716858, 0.1471886, 0.7691616, 1, 0, 0, 1, 1,
0.8745854, 1.31436, 2.762995, 0, 0, 0, 1, 1,
0.8747492, 0.7334139, 1.243734, 0, 0, 0, 1, 1,
0.8763496, 2.090829, 0.5329723, 0, 0, 0, 1, 1,
0.8769, 1.588208, 0.3696865, 0, 0, 0, 1, 1,
0.8789104, 0.6443059, 0.2992521, 0, 0, 0, 1, 1,
0.8865831, 1.089375, 1.975334, 0, 0, 0, 1, 1,
0.8914904, -0.6101033, 1.090533, 0, 0, 0, 1, 1,
0.895709, 1.017795, 1.921648, 1, 1, 1, 1, 1,
0.9000034, 0.7361405, 0.01217023, 1, 1, 1, 1, 1,
0.9047629, 0.5338482, 0.7123341, 1, 1, 1, 1, 1,
0.9047871, 0.1066926, 1.498284, 1, 1, 1, 1, 1,
0.9052921, 0.2525114, 2.10641, 1, 1, 1, 1, 1,
0.9072417, 0.1750526, 1.986486, 1, 1, 1, 1, 1,
0.9095092, 0.3323619, 2.268685, 1, 1, 1, 1, 1,
0.9155278, -2.411605, 2.652567, 1, 1, 1, 1, 1,
0.9197817, 0.2428208, 0.01314926, 1, 1, 1, 1, 1,
0.9224869, 0.9470244, 0.5160635, 1, 1, 1, 1, 1,
0.9243354, -0.04475882, 1.771073, 1, 1, 1, 1, 1,
0.925042, -0.6780933, 1.427297, 1, 1, 1, 1, 1,
0.9282343, -0.09571785, 2.133812, 1, 1, 1, 1, 1,
0.9320026, -1.738447, 2.005795, 1, 1, 1, 1, 1,
0.9323891, 0.9481422, 2.24596, 1, 1, 1, 1, 1,
0.941902, -0.3122822, 1.963129, 0, 0, 1, 1, 1,
0.9447474, -0.5056541, 1.498377, 1, 0, 0, 1, 1,
0.9458618, -0.2363378, 2.445876, 1, 0, 0, 1, 1,
0.9545854, 0.1024665, 0.4610698, 1, 0, 0, 1, 1,
0.9577399, -0.6166021, 2.705654, 1, 0, 0, 1, 1,
0.9592741, -1.915916, 4.653014, 1, 0, 0, 1, 1,
0.9616407, 0.3787748, 2.747013, 0, 0, 0, 1, 1,
0.9625826, 0.4705037, 1.504065, 0, 0, 0, 1, 1,
0.9638156, 0.7725443, 2.774046, 0, 0, 0, 1, 1,
0.969649, -0.05078597, 1.415128, 0, 0, 0, 1, 1,
0.9704226, -0.770629, 0.5619679, 0, 0, 0, 1, 1,
0.9722878, -0.3699438, 3.090713, 0, 0, 0, 1, 1,
0.9763944, -0.6535715, 1.792415, 0, 0, 0, 1, 1,
0.983055, 0.058536, 1.999708, 1, 1, 1, 1, 1,
0.9835441, 0.3889203, 1.057022, 1, 1, 1, 1, 1,
0.9840125, -1.177426, 3.66292, 1, 1, 1, 1, 1,
0.9927376, 1.061921, 0.7958919, 1, 1, 1, 1, 1,
0.9930279, 0.4708859, 1.147113, 1, 1, 1, 1, 1,
0.9932501, -1.192668, 2.245856, 1, 1, 1, 1, 1,
0.9968476, -0.08617944, 1.549783, 1, 1, 1, 1, 1,
1.002222, 0.7146601, -0.005650886, 1, 1, 1, 1, 1,
1.015997, -0.6110225, 2.991798, 1, 1, 1, 1, 1,
1.016101, 2.601763, 1.744936, 1, 1, 1, 1, 1,
1.021217, 0.1075711, 3.351552, 1, 1, 1, 1, 1,
1.042386, -0.6466072, 0.9211929, 1, 1, 1, 1, 1,
1.047738, 0.9729771, -1.150842, 1, 1, 1, 1, 1,
1.052794, 1.033119, -0.3894843, 1, 1, 1, 1, 1,
1.059586, -0.2847584, 2.609905, 1, 1, 1, 1, 1,
1.059613, 0.03607253, 1.412157, 0, 0, 1, 1, 1,
1.06671, -0.3867578, 1.223915, 1, 0, 0, 1, 1,
1.068496, -0.4173273, 0.7044082, 1, 0, 0, 1, 1,
1.074675, 2.263615, -0.9209962, 1, 0, 0, 1, 1,
1.075983, -0.9716152, 1.743975, 1, 0, 0, 1, 1,
1.076039, -0.1358192, 3.807838, 1, 0, 0, 1, 1,
1.085897, -0.1377583, 1.96269, 0, 0, 0, 1, 1,
1.086001, 1.596579, 1.771326, 0, 0, 0, 1, 1,
1.086311, -2.510314, 1.828286, 0, 0, 0, 1, 1,
1.088421, -0.1484879, 1.075221, 0, 0, 0, 1, 1,
1.089199, -1.012868, 0.8486376, 0, 0, 0, 1, 1,
1.091254, 0.4883731, 1.501908, 0, 0, 0, 1, 1,
1.091778, 0.4138615, 1.868265, 0, 0, 0, 1, 1,
1.096519, 1.645165, 0.4141743, 1, 1, 1, 1, 1,
1.106242, 0.2821391, 1.351148, 1, 1, 1, 1, 1,
1.11374, -0.8313569, 1.672514, 1, 1, 1, 1, 1,
1.124206, 0.3390664, 0.1977743, 1, 1, 1, 1, 1,
1.131359, -1.200496, 1.102015, 1, 1, 1, 1, 1,
1.132528, 1.201223, 0.5787508, 1, 1, 1, 1, 1,
1.13739, 0.306949, 1.864697, 1, 1, 1, 1, 1,
1.143428, 1.922208, 1.326713, 1, 1, 1, 1, 1,
1.1475, -0.317299, 1.316364, 1, 1, 1, 1, 1,
1.152903, 0.71941, 0.2114232, 1, 1, 1, 1, 1,
1.153089, 0.1575922, 1.810453, 1, 1, 1, 1, 1,
1.153976, 0.3707044, 0.6364049, 1, 1, 1, 1, 1,
1.154097, 1.31344, -0.7845972, 1, 1, 1, 1, 1,
1.157501, 0.66719, 2.029042, 1, 1, 1, 1, 1,
1.167872, -1.899819, 2.754531, 1, 1, 1, 1, 1,
1.176493, -0.1194839, 3.655061, 0, 0, 1, 1, 1,
1.189716, 0.3781978, 1.358263, 1, 0, 0, 1, 1,
1.191162, 1.608063, 0.4108501, 1, 0, 0, 1, 1,
1.192851, 0.531522, 0.7774303, 1, 0, 0, 1, 1,
1.202567, -1.958094, 3.281607, 1, 0, 0, 1, 1,
1.20275, -0.09482033, 2.274441, 1, 0, 0, 1, 1,
1.213111, 0.02975885, 0.5114797, 0, 0, 0, 1, 1,
1.216093, 0.5820928, 2.013908, 0, 0, 0, 1, 1,
1.218608, 0.7769125, 0.7951152, 0, 0, 0, 1, 1,
1.22742, -1.821701, 3.591817, 0, 0, 0, 1, 1,
1.228912, -1.155095, 1.434285, 0, 0, 0, 1, 1,
1.229749, -0.502948, 2.503043, 0, 0, 0, 1, 1,
1.231703, 1.087188, 0.6024722, 0, 0, 0, 1, 1,
1.239815, -0.8952559, 2.051608, 1, 1, 1, 1, 1,
1.246686, -0.9234611, 2.13484, 1, 1, 1, 1, 1,
1.247885, 1.162022, -0.3410269, 1, 1, 1, 1, 1,
1.248209, -0.5173844, 1.582217, 1, 1, 1, 1, 1,
1.273803, -0.8653671, 0.7878097, 1, 1, 1, 1, 1,
1.277359, -0.4519362, 2.987676, 1, 1, 1, 1, 1,
1.27817, 0.005372695, 2.792181, 1, 1, 1, 1, 1,
1.28031, -0.3641892, 2.469345, 1, 1, 1, 1, 1,
1.281972, 0.7798501, 1.684696, 1, 1, 1, 1, 1,
1.295009, -0.08965228, 0.9148904, 1, 1, 1, 1, 1,
1.299417, 1.270461, 2.35965, 1, 1, 1, 1, 1,
1.300237, 1.687538, -1.030952, 1, 1, 1, 1, 1,
1.301496, 0.1785864, 0.9264807, 1, 1, 1, 1, 1,
1.304341, 0.04897331, 0.09986136, 1, 1, 1, 1, 1,
1.308434, 0.156046, 1.393028, 1, 1, 1, 1, 1,
1.309229, 0.5746359, 0.1642995, 0, 0, 1, 1, 1,
1.314385, -0.5275871, 0.3689028, 1, 0, 0, 1, 1,
1.314729, -0.7255586, 0.4938034, 1, 0, 0, 1, 1,
1.315412, -1.733145, 2.546654, 1, 0, 0, 1, 1,
1.317507, 0.5455203, 1.744537, 1, 0, 0, 1, 1,
1.326802, -0.5142751, 0.8374061, 1, 0, 0, 1, 1,
1.331701, 0.04210471, 0.8432591, 0, 0, 0, 1, 1,
1.338268, -0.7012245, 2.59168, 0, 0, 0, 1, 1,
1.355802, 1.587058, 1.677915, 0, 0, 0, 1, 1,
1.359346, 2.088059, -0.8718252, 0, 0, 0, 1, 1,
1.36418, 0.4133546, 0.8795544, 0, 0, 0, 1, 1,
1.372143, -2.059897, 3.670678, 0, 0, 0, 1, 1,
1.373487, 0.1012252, 1.90165, 0, 0, 0, 1, 1,
1.381975, -0.02866867, 1.626512, 1, 1, 1, 1, 1,
1.412198, 0.1801262, 0.9542416, 1, 1, 1, 1, 1,
1.412375, -0.9989867, 1.318264, 1, 1, 1, 1, 1,
1.414782, -0.04177579, -0.6428574, 1, 1, 1, 1, 1,
1.418813, 0.4866117, 1.198171, 1, 1, 1, 1, 1,
1.427579, -0.1708255, 2.027107, 1, 1, 1, 1, 1,
1.438406, -1.627901, 1.761961, 1, 1, 1, 1, 1,
1.438613, 0.5024836, 2.093581, 1, 1, 1, 1, 1,
1.440042, 1.324937, 0.6173094, 1, 1, 1, 1, 1,
1.441203, -1.198237, 3.372848, 1, 1, 1, 1, 1,
1.441578, -1.20979, 2.33414, 1, 1, 1, 1, 1,
1.441964, 1.606121, 1.594893, 1, 1, 1, 1, 1,
1.453833, 0.5715113, 2.71755, 1, 1, 1, 1, 1,
1.467732, -0.3071143, 2.555187, 1, 1, 1, 1, 1,
1.470809, -0.613941, 2.615237, 1, 1, 1, 1, 1,
1.478533, 0.4298188, -0.01563271, 0, 0, 1, 1, 1,
1.48736, -1.744661, 2.433874, 1, 0, 0, 1, 1,
1.488225, -1.446541, 2.463375, 1, 0, 0, 1, 1,
1.490655, 0.009273479, -1.05265, 1, 0, 0, 1, 1,
1.500008, 0.7208639, 1.055035, 1, 0, 0, 1, 1,
1.504527, 0.3249069, 1.842921, 1, 0, 0, 1, 1,
1.508253, 0.5623382, 0.1208543, 0, 0, 0, 1, 1,
1.518489, -1.199163, 2.636678, 0, 0, 0, 1, 1,
1.529446, -1.376527, 1.189844, 0, 0, 0, 1, 1,
1.532438, 0.2265021, 1.748874, 0, 0, 0, 1, 1,
1.535604, 0.9823629, 1.976202, 0, 0, 0, 1, 1,
1.542647, 0.8361795, 2.566456, 0, 0, 0, 1, 1,
1.579181, -0.1348222, 2.847878, 0, 0, 0, 1, 1,
1.580706, -3.365059, 1.741098, 1, 1, 1, 1, 1,
1.582229, 0.1457771, 2.315187, 1, 1, 1, 1, 1,
1.593458, 0.03056018, 1.973919, 1, 1, 1, 1, 1,
1.596309, 0.01841108, 2.689931, 1, 1, 1, 1, 1,
1.604308, 1.942237, 0.1836498, 1, 1, 1, 1, 1,
1.604693, 0.5079686, 2.724754, 1, 1, 1, 1, 1,
1.614714, -0.2432387, 2.396604, 1, 1, 1, 1, 1,
1.618429, -1.206738, 1.712208, 1, 1, 1, 1, 1,
1.631973, -0.2501739, 2.215676, 1, 1, 1, 1, 1,
1.639047, 2.779798, 0.1503989, 1, 1, 1, 1, 1,
1.646464, 0.2092135, -0.08030229, 1, 1, 1, 1, 1,
1.648288, 1.037157, 1.092765, 1, 1, 1, 1, 1,
1.651524, -2.123307, 2.735205, 1, 1, 1, 1, 1,
1.653464, -0.9471279, 0.5491194, 1, 1, 1, 1, 1,
1.692112, 1.11759, 0.4338907, 1, 1, 1, 1, 1,
1.696201, -2.104379, 2.264211, 0, 0, 1, 1, 1,
1.703204, 0.5659487, 1.746388, 1, 0, 0, 1, 1,
1.705289, -1.208063, 2.152933, 1, 0, 0, 1, 1,
1.720297, -1.381736, 0.5122648, 1, 0, 0, 1, 1,
1.73373, -0.1615132, -0.1539618, 1, 0, 0, 1, 1,
1.738173, -0.01098197, 2.179935, 1, 0, 0, 1, 1,
1.744885, 0.641867, 1.13892, 0, 0, 0, 1, 1,
1.771064, 0.2435439, 1.829823, 0, 0, 0, 1, 1,
1.771931, 0.1017016, 0.8674852, 0, 0, 0, 1, 1,
1.777412, -0.3296338, 3.501101, 0, 0, 0, 1, 1,
1.795771, 1.181604, 1.1787, 0, 0, 0, 1, 1,
1.800526, -0.762115, 4.367308, 0, 0, 0, 1, 1,
1.803043, 2.792351, 1.61376, 0, 0, 0, 1, 1,
1.813008, 0.03955001, 1.163622, 1, 1, 1, 1, 1,
1.816996, 0.4925306, -0.1761297, 1, 1, 1, 1, 1,
1.824029, 0.09580352, 0.8819292, 1, 1, 1, 1, 1,
1.836645, 0.5204732, 2.47584, 1, 1, 1, 1, 1,
1.871364, -0.1119713, 2.201692, 1, 1, 1, 1, 1,
1.886873, 0.03923549, 4.160551, 1, 1, 1, 1, 1,
1.891573, 2.339483, 1.943066, 1, 1, 1, 1, 1,
1.895223, 0.03132759, 2.231845, 1, 1, 1, 1, 1,
1.897324, 0.6465389, 3.360827, 1, 1, 1, 1, 1,
1.91672, 1.861196, 1.72392, 1, 1, 1, 1, 1,
1.927036, -1.489062, 3.33367, 1, 1, 1, 1, 1,
1.938188, -0.6090074, 3.048475, 1, 1, 1, 1, 1,
1.942457, -1.645063, 0.1077781, 1, 1, 1, 1, 1,
1.942952, 0.6961573, 1.732289, 1, 1, 1, 1, 1,
1.972776, 0.3126218, 1.202918, 1, 1, 1, 1, 1,
1.990993, 1.833843, -0.1507377, 0, 0, 1, 1, 1,
2.011208, -0.00381097, 0.5168728, 1, 0, 0, 1, 1,
2.021339, 1.546347, 0.9127465, 1, 0, 0, 1, 1,
2.107301, -0.3133132, 2.186549, 1, 0, 0, 1, 1,
2.200866, 1.485701, 0.5193341, 1, 0, 0, 1, 1,
2.232591, -1.41171, 3.376127, 1, 0, 0, 1, 1,
2.279022, 0.8812845, 0.6699035, 0, 0, 0, 1, 1,
2.306396, -0.06282491, 0.9892188, 0, 0, 0, 1, 1,
2.308182, 0.4904036, 0.1530281, 0, 0, 0, 1, 1,
2.357847, 0.1626807, 2.808945, 0, 0, 0, 1, 1,
2.375165, -1.368935, 3.60345, 0, 0, 0, 1, 1,
2.398204, -0.8770674, 4.994782, 0, 0, 0, 1, 1,
2.556698, -0.9804206, 0.7913966, 0, 0, 0, 1, 1,
2.564078, 1.403889, 1.976921, 1, 1, 1, 1, 1,
2.577495, 1.145681, 0.8526674, 1, 1, 1, 1, 1,
2.588664, 1.305102, 0.9104117, 1, 1, 1, 1, 1,
2.62331, -0.2900135, 2.249099, 1, 1, 1, 1, 1,
2.660175, 0.4065969, 1.439535, 1, 1, 1, 1, 1,
2.718465, -1.519523, 0.8841327, 1, 1, 1, 1, 1,
2.89337, -2.042652, 1.929803, 1, 1, 1, 1, 1
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
var radius = 9.439296;
var distance = 33.15513;
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
mvMatrix.translate( 0.04676461, 0.2470155, -0.2238708 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.15513);
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