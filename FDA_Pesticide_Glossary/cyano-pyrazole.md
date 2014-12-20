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
-2.973511, -1.89365, -2.139107, 1, 0, 0, 1,
-2.875813, 0.6374603, -0.3628246, 1, 0.007843138, 0, 1,
-2.855638, -0.2127346, -2.355582, 1, 0.01176471, 0, 1,
-2.817228, 0.3357067, -1.27337, 1, 0.01960784, 0, 1,
-2.76954, 0.763335, -2.880346, 1, 0.02352941, 0, 1,
-2.761352, 0.3310466, -1.150898, 1, 0.03137255, 0, 1,
-2.577252, 0.3138008, -1.139891, 1, 0.03529412, 0, 1,
-2.499325, 1.653811, -1.385594, 1, 0.04313726, 0, 1,
-2.497538, 0.3595187, -1.661229, 1, 0.04705882, 0, 1,
-2.432637, 0.2907977, -1.32607, 1, 0.05490196, 0, 1,
-2.412261, 1.560904, -0.1314915, 1, 0.05882353, 0, 1,
-2.393953, -0.1688964, -2.278936, 1, 0.06666667, 0, 1,
-2.328037, 0.5553663, -1.402297, 1, 0.07058824, 0, 1,
-2.29425, -0.05009476, -2.314949, 1, 0.07843138, 0, 1,
-2.249385, -1.065115, -1.577269, 1, 0.08235294, 0, 1,
-2.246562, -0.2246432, -0.7090831, 1, 0.09019608, 0, 1,
-2.216132, -0.892864, -2.908795, 1, 0.09411765, 0, 1,
-2.15182, 1.17306, -0.4726182, 1, 0.1019608, 0, 1,
-2.147984, -0.5979131, -3.142299, 1, 0.1098039, 0, 1,
-2.141878, 1.606332, -1.641933, 1, 0.1137255, 0, 1,
-2.124518, 0.3007708, -1.325788, 1, 0.1215686, 0, 1,
-2.100256, 0.3692868, -1.631161, 1, 0.1254902, 0, 1,
-2.097152, 1.003135, -0.5298881, 1, 0.1333333, 0, 1,
-2.043289, 1.226925, -1.658839, 1, 0.1372549, 0, 1,
-2.001498, 0.2745529, -0.7716475, 1, 0.145098, 0, 1,
-1.990973, -0.3046266, -1.740036, 1, 0.1490196, 0, 1,
-1.989461, 1.478488, -1.206866, 1, 0.1568628, 0, 1,
-1.977508, 0.3005348, -1.672609, 1, 0.1607843, 0, 1,
-1.971458, -0.6454043, -1.610885, 1, 0.1686275, 0, 1,
-1.970487, -0.4124838, -0.4928981, 1, 0.172549, 0, 1,
-1.934003, 0.6378356, -1.217155, 1, 0.1803922, 0, 1,
-1.92912, 1.233647, 0.7718459, 1, 0.1843137, 0, 1,
-1.929009, -0.9166659, -0.9772492, 1, 0.1921569, 0, 1,
-1.916952, 0.8989149, -1.119322, 1, 0.1960784, 0, 1,
-1.892209, -0.2077984, -1.670468, 1, 0.2039216, 0, 1,
-1.883362, 0.0780419, -1.754136, 1, 0.2117647, 0, 1,
-1.864799, 1.331201, -1.138079, 1, 0.2156863, 0, 1,
-1.816845, 0.2461161, -0.7190933, 1, 0.2235294, 0, 1,
-1.806739, 0.3097288, -1.362685, 1, 0.227451, 0, 1,
-1.800264, 0.1760951, -1.354837, 1, 0.2352941, 0, 1,
-1.799816, -0.2749564, -0.3679498, 1, 0.2392157, 0, 1,
-1.792326, 1.059067, -2.238528, 1, 0.2470588, 0, 1,
-1.789171, -1.229718, -1.49659, 1, 0.2509804, 0, 1,
-1.780316, -0.9476275, -2.804857, 1, 0.2588235, 0, 1,
-1.730866, -1.102576, -1.535478, 1, 0.2627451, 0, 1,
-1.702771, 0.3698431, 0.3090091, 1, 0.2705882, 0, 1,
-1.699376, 0.7861496, -1.676463, 1, 0.2745098, 0, 1,
-1.698303, 3.18399, -1.799396, 1, 0.282353, 0, 1,
-1.694425, 0.5420384, -1.143437, 1, 0.2862745, 0, 1,
-1.685353, 0.7394987, 0.4992509, 1, 0.2941177, 0, 1,
-1.667813, -0.5614575, -2.190249, 1, 0.3019608, 0, 1,
-1.665312, -1.864191, -1.727854, 1, 0.3058824, 0, 1,
-1.649537, 0.3829398, -0.502372, 1, 0.3137255, 0, 1,
-1.64219, 1.054929, -2.593987, 1, 0.3176471, 0, 1,
-1.638571, 0.1999748, -1.061775, 1, 0.3254902, 0, 1,
-1.60301, 1.540406, -0.2686966, 1, 0.3294118, 0, 1,
-1.592041, 0.05560252, -2.259362, 1, 0.3372549, 0, 1,
-1.583214, 1.606073, -2.264799, 1, 0.3411765, 0, 1,
-1.58078, -0.6927324, -3.337373, 1, 0.3490196, 0, 1,
-1.558074, -1.992311, -2.553131, 1, 0.3529412, 0, 1,
-1.549065, 2.020505, 1.036494, 1, 0.3607843, 0, 1,
-1.542318, -1.073217, -1.421014, 1, 0.3647059, 0, 1,
-1.537667, -0.5051327, -1.32184, 1, 0.372549, 0, 1,
-1.533664, 1.001461, -2.057974, 1, 0.3764706, 0, 1,
-1.52756, -0.3987345, -4.418813, 1, 0.3843137, 0, 1,
-1.521566, 1.52023, -0.7699685, 1, 0.3882353, 0, 1,
-1.52121, -0.4165337, -1.605001, 1, 0.3960784, 0, 1,
-1.500412, -0.8498381, -1.308751, 1, 0.4039216, 0, 1,
-1.474091, 1.005171, -1.053524, 1, 0.4078431, 0, 1,
-1.466626, 0.4135358, -0.8239061, 1, 0.4156863, 0, 1,
-1.465004, 2.10536, -0.8097197, 1, 0.4196078, 0, 1,
-1.462188, -0.8074791, -0.9042916, 1, 0.427451, 0, 1,
-1.459752, 1.853898, -0.6995726, 1, 0.4313726, 0, 1,
-1.427274, -0.2799807, -2.549323, 1, 0.4392157, 0, 1,
-1.423975, -0.2589235, -0.6186543, 1, 0.4431373, 0, 1,
-1.416139, 0.5506079, -0.1252227, 1, 0.4509804, 0, 1,
-1.411271, 0.9153622, -0.8524786, 1, 0.454902, 0, 1,
-1.393248, -0.4049843, -1.325424, 1, 0.4627451, 0, 1,
-1.390908, 0.97163, -2.247095, 1, 0.4666667, 0, 1,
-1.389018, 1.143471, 0.1212519, 1, 0.4745098, 0, 1,
-1.385475, -1.737587, -2.629556, 1, 0.4784314, 0, 1,
-1.38151, -0.7049019, -1.278813, 1, 0.4862745, 0, 1,
-1.375715, -1.116966, -2.528999, 1, 0.4901961, 0, 1,
-1.370472, 0.5924233, 0.6358712, 1, 0.4980392, 0, 1,
-1.3645, 1.305938, -0.8318909, 1, 0.5058824, 0, 1,
-1.360381, 0.178426, -2.052166, 1, 0.509804, 0, 1,
-1.360267, 1.302159, -2.233078, 1, 0.5176471, 0, 1,
-1.355577, 0.8717131, -0.408615, 1, 0.5215687, 0, 1,
-1.355332, -0.1903859, -2.181871, 1, 0.5294118, 0, 1,
-1.354797, -0.05835257, -1.891753, 1, 0.5333334, 0, 1,
-1.339696, 2.857878, 0.6240326, 1, 0.5411765, 0, 1,
-1.337281, 1.784404, -0.2915654, 1, 0.5450981, 0, 1,
-1.336828, -0.4580456, -2.564516, 1, 0.5529412, 0, 1,
-1.330487, -0.2212045, -2.939136, 1, 0.5568628, 0, 1,
-1.323332, 0.1357409, -2.197501, 1, 0.5647059, 0, 1,
-1.322659, 1.678846, -0.7383488, 1, 0.5686275, 0, 1,
-1.306087, 0.7767666, -0.9648348, 1, 0.5764706, 0, 1,
-1.305792, 0.08851157, -1.50226, 1, 0.5803922, 0, 1,
-1.293906, -1.603589, -0.2482494, 1, 0.5882353, 0, 1,
-1.285057, -1.855916, -3.042053, 1, 0.5921569, 0, 1,
-1.284876, -0.04267242, -2.409069, 1, 0.6, 0, 1,
-1.274662, 0.02471881, -0.2608819, 1, 0.6078432, 0, 1,
-1.265098, 0.6245171, 1.211864, 1, 0.6117647, 0, 1,
-1.260734, -0.3652789, -0.8208517, 1, 0.6196079, 0, 1,
-1.259808, -0.9105884, -1.987291, 1, 0.6235294, 0, 1,
-1.253263, 0.8133129, -0.7219602, 1, 0.6313726, 0, 1,
-1.243846, -0.03908565, -1.88091, 1, 0.6352941, 0, 1,
-1.242798, 0.6909643, -0.3504683, 1, 0.6431373, 0, 1,
-1.235051, -0.455483, -2.175694, 1, 0.6470588, 0, 1,
-1.231514, 0.1994012, -0.657684, 1, 0.654902, 0, 1,
-1.227061, -0.8736414, -1.690399, 1, 0.6588235, 0, 1,
-1.226114, -1.157944, -4.29503, 1, 0.6666667, 0, 1,
-1.209744, -0.3512906, -1.844355, 1, 0.6705883, 0, 1,
-1.202371, -1.175045, -2.133808, 1, 0.6784314, 0, 1,
-1.194351, 0.5074884, -1.40247, 1, 0.682353, 0, 1,
-1.192854, 0.3505334, -2.431801, 1, 0.6901961, 0, 1,
-1.187169, 1.037501, -2.586406, 1, 0.6941177, 0, 1,
-1.180269, -2.160133, -2.341093, 1, 0.7019608, 0, 1,
-1.17942, -0.4088411, -1.359085, 1, 0.7098039, 0, 1,
-1.177426, 0.8053669, -0.3597912, 1, 0.7137255, 0, 1,
-1.176735, 1.224957, -0.004598088, 1, 0.7215686, 0, 1,
-1.172352, 0.4715887, 0.0534639, 1, 0.7254902, 0, 1,
-1.169471, -1.451561, -3.938216, 1, 0.7333333, 0, 1,
-1.166578, 0.6994152, -1.491969, 1, 0.7372549, 0, 1,
-1.16274, -0.5601487, -0.1323217, 1, 0.7450981, 0, 1,
-1.162558, -0.3824449, -0.4914562, 1, 0.7490196, 0, 1,
-1.15693, -0.8722541, -1.375415, 1, 0.7568628, 0, 1,
-1.151223, 1.387383, -0.9969906, 1, 0.7607843, 0, 1,
-1.142731, 0.9627537, -2.456301, 1, 0.7686275, 0, 1,
-1.134848, 1.126014, -1.432318, 1, 0.772549, 0, 1,
-1.128703, 0.2633635, -2.150152, 1, 0.7803922, 0, 1,
-1.122607, 1.119268, -2.839604, 1, 0.7843137, 0, 1,
-1.122332, -0.9580603, -0.9338416, 1, 0.7921569, 0, 1,
-1.110177, 0.09079528, -0.5290329, 1, 0.7960784, 0, 1,
-1.107786, -0.5802448, -2.658576, 1, 0.8039216, 0, 1,
-1.099367, 0.07767794, -1.413808, 1, 0.8117647, 0, 1,
-1.086455, 0.1895006, 0.5619056, 1, 0.8156863, 0, 1,
-1.081781, 1.186978, -0.5513784, 1, 0.8235294, 0, 1,
-1.081559, 0.09116349, -1.574725, 1, 0.827451, 0, 1,
-1.07873, -0.2522933, -2.436392, 1, 0.8352941, 0, 1,
-1.070669, 0.7578033, -0.4883719, 1, 0.8392157, 0, 1,
-1.063743, 0.2713295, -0.7468209, 1, 0.8470588, 0, 1,
-1.063491, 0.4755462, -0.471646, 1, 0.8509804, 0, 1,
-1.061511, 1.087103, -0.0453878, 1, 0.8588235, 0, 1,
-1.058785, -0.144283, -1.222934, 1, 0.8627451, 0, 1,
-1.05389, -0.8222158, -1.50118, 1, 0.8705882, 0, 1,
-1.052506, 1.049689, 0.1434907, 1, 0.8745098, 0, 1,
-1.035126, -1.863191, -2.709708, 1, 0.8823529, 0, 1,
-1.028262, 0.9124022, 0.6735546, 1, 0.8862745, 0, 1,
-1.027928, 0.1978291, -1.021737, 1, 0.8941177, 0, 1,
-1.019408, -1.110859, -2.608823, 1, 0.8980392, 0, 1,
-1.017676, 0.001450434, -2.357732, 1, 0.9058824, 0, 1,
-1.01162, 0.2772383, -2.320071, 1, 0.9137255, 0, 1,
-1.008189, -1.548583, -3.403646, 1, 0.9176471, 0, 1,
-1.007808, 0.8387446, -2.619183, 1, 0.9254902, 0, 1,
-1.000684, 0.9743743, 0.1910625, 1, 0.9294118, 0, 1,
-0.9994944, 0.3979683, -1.948871, 1, 0.9372549, 0, 1,
-0.9987664, 2.126923, -0.7921615, 1, 0.9411765, 0, 1,
-0.9918851, 0.06161757, -1.009832, 1, 0.9490196, 0, 1,
-0.9847648, -0.0646299, -1.945924, 1, 0.9529412, 0, 1,
-0.9832106, -0.5630146, -1.342873, 1, 0.9607843, 0, 1,
-0.9798968, 0.2442377, -3.423472, 1, 0.9647059, 0, 1,
-0.9759706, 0.4376376, -1.383925, 1, 0.972549, 0, 1,
-0.9591222, -0.01585649, -2.208353, 1, 0.9764706, 0, 1,
-0.9554081, 1.248221, 1.045169, 1, 0.9843137, 0, 1,
-0.9547582, -0.3090575, -1.307302, 1, 0.9882353, 0, 1,
-0.9546394, -0.2101272, -2.252266, 1, 0.9960784, 0, 1,
-0.9543263, 1.768962, -0.1694877, 0.9960784, 1, 0, 1,
-0.9536562, 0.9455397, -1.143642, 0.9921569, 1, 0, 1,
-0.9489926, 1.281555, -0.32975, 0.9843137, 1, 0, 1,
-0.9471879, -1.798885, -1.968343, 0.9803922, 1, 0, 1,
-0.9410437, -1.097039, -3.449575, 0.972549, 1, 0, 1,
-0.9404398, -0.5045716, -3.083086, 0.9686275, 1, 0, 1,
-0.9293556, 0.06241567, -1.914348, 0.9607843, 1, 0, 1,
-0.927837, -0.7490353, -3.738884, 0.9568627, 1, 0, 1,
-0.9247292, -0.6804171, -3.026265, 0.9490196, 1, 0, 1,
-0.9237765, 1.246004, 0.0104243, 0.945098, 1, 0, 1,
-0.9234998, 0.4842045, -1.764266, 0.9372549, 1, 0, 1,
-0.9222353, -0.4026722, -1.7557, 0.9333333, 1, 0, 1,
-0.9166237, -0.7963996, -1.007623, 0.9254902, 1, 0, 1,
-0.9111826, -1.848016, -4.126585, 0.9215686, 1, 0, 1,
-0.9104789, -0.9727881, -2.191654, 0.9137255, 1, 0, 1,
-0.8952399, 0.7126943, 0.1719088, 0.9098039, 1, 0, 1,
-0.8882603, 0.4422648, -1.469156, 0.9019608, 1, 0, 1,
-0.8868946, -0.3771902, -2.169342, 0.8941177, 1, 0, 1,
-0.8822402, 1.07759, 0.05997845, 0.8901961, 1, 0, 1,
-0.8807915, 0.3760091, -1.952265, 0.8823529, 1, 0, 1,
-0.8806252, -0.2691936, -0.9003584, 0.8784314, 1, 0, 1,
-0.8706505, -0.7361866, -2.77246, 0.8705882, 1, 0, 1,
-0.8670308, -0.423898, -2.91968, 0.8666667, 1, 0, 1,
-0.8664702, -0.1725279, -3.195825, 0.8588235, 1, 0, 1,
-0.8652683, 0.4832909, -0.1299818, 0.854902, 1, 0, 1,
-0.8625468, -0.3101545, -1.300108, 0.8470588, 1, 0, 1,
-0.8625127, -1.790285, -3.137568, 0.8431373, 1, 0, 1,
-0.8579518, 1.270407, 1.579772, 0.8352941, 1, 0, 1,
-0.8577599, -0.9575101, -1.857374, 0.8313726, 1, 0, 1,
-0.8563657, -0.2944382, -1.323921, 0.8235294, 1, 0, 1,
-0.8549251, 0.8154879, -1.063371, 0.8196079, 1, 0, 1,
-0.8504454, -2.09445, -2.69125, 0.8117647, 1, 0, 1,
-0.8499291, 1.474455, 1.061847, 0.8078431, 1, 0, 1,
-0.8452657, -0.5841659, -3.538183, 0.8, 1, 0, 1,
-0.842886, -0.2411697, -1.745094, 0.7921569, 1, 0, 1,
-0.8416792, -0.4541799, -0.7797304, 0.7882353, 1, 0, 1,
-0.8377599, 1.1037, -0.8780774, 0.7803922, 1, 0, 1,
-0.8270875, 1.593538, -0.7872631, 0.7764706, 1, 0, 1,
-0.8244165, 0.3035066, -1.482509, 0.7686275, 1, 0, 1,
-0.8239503, 1.548271, 0.235947, 0.7647059, 1, 0, 1,
-0.8120125, -0.1075503, -2.904416, 0.7568628, 1, 0, 1,
-0.8104693, -0.4649484, -1.584275, 0.7529412, 1, 0, 1,
-0.8098769, 0.8408824, 0.01903076, 0.7450981, 1, 0, 1,
-0.8090069, -1.337415, -3.927633, 0.7411765, 1, 0, 1,
-0.8075382, 0.107086, -1.85042, 0.7333333, 1, 0, 1,
-0.8060712, 0.1109056, -0.9352936, 0.7294118, 1, 0, 1,
-0.801614, 0.7554778, -0.2681782, 0.7215686, 1, 0, 1,
-0.7949595, 0.3299565, -0.5168822, 0.7176471, 1, 0, 1,
-0.7914235, 1.168267, -1.193431, 0.7098039, 1, 0, 1,
-0.7891025, 0.3272364, -0.3969397, 0.7058824, 1, 0, 1,
-0.7859859, 0.06535498, -1.996145, 0.6980392, 1, 0, 1,
-0.7859587, -1.029359, -2.843395, 0.6901961, 1, 0, 1,
-0.7838244, -0.1682356, -1.120901, 0.6862745, 1, 0, 1,
-0.7809933, -1.090115, -1.161439, 0.6784314, 1, 0, 1,
-0.7807914, -0.4157097, -3.278456, 0.6745098, 1, 0, 1,
-0.7756543, -0.815139, -2.918227, 0.6666667, 1, 0, 1,
-0.7678732, -0.6443821, -3.839207, 0.6627451, 1, 0, 1,
-0.7637253, 0.7731888, -3.256657, 0.654902, 1, 0, 1,
-0.7597368, -0.453605, -3.173097, 0.6509804, 1, 0, 1,
-0.7564101, -1.132129, -1.721798, 0.6431373, 1, 0, 1,
-0.7524686, 0.1210042, -2.32556, 0.6392157, 1, 0, 1,
-0.7515772, 1.052612, -0.6789388, 0.6313726, 1, 0, 1,
-0.7510254, -0.8226059, -3.996266, 0.627451, 1, 0, 1,
-0.7483042, -1.038403, -3.893252, 0.6196079, 1, 0, 1,
-0.7465334, 0.6878057, -1.892117, 0.6156863, 1, 0, 1,
-0.7408369, -0.8942512, -1.892915, 0.6078432, 1, 0, 1,
-0.7378443, -0.7739425, -4.831402, 0.6039216, 1, 0, 1,
-0.7333765, 1.793153, -0.659338, 0.5960785, 1, 0, 1,
-0.7326874, 0.497727, -0.06330929, 0.5882353, 1, 0, 1,
-0.7304776, 0.9114518, -1.159987, 0.5843138, 1, 0, 1,
-0.722236, -0.6912457, -3.165327, 0.5764706, 1, 0, 1,
-0.7082416, 0.2842982, -2.395843, 0.572549, 1, 0, 1,
-0.7065446, -1.617369, -4.00865, 0.5647059, 1, 0, 1,
-0.7032211, 0.1510587, -2.074873, 0.5607843, 1, 0, 1,
-0.6996705, -0.1366715, -2.928487, 0.5529412, 1, 0, 1,
-0.6990622, 0.2203604, 0.04136186, 0.5490196, 1, 0, 1,
-0.6977151, -0.7177751, -1.890207, 0.5411765, 1, 0, 1,
-0.6965262, -0.1245974, -0.6067951, 0.5372549, 1, 0, 1,
-0.6902282, -1.776109, -2.745488, 0.5294118, 1, 0, 1,
-0.6804402, -0.4256009, -2.002012, 0.5254902, 1, 0, 1,
-0.6766351, -0.2212734, -1.019592, 0.5176471, 1, 0, 1,
-0.6759756, 0.02059469, -0.8333555, 0.5137255, 1, 0, 1,
-0.672238, 0.4090725, -0.07489699, 0.5058824, 1, 0, 1,
-0.6697112, -1.015481, -1.435128, 0.5019608, 1, 0, 1,
-0.6684926, 0.6487521, 0.02966292, 0.4941176, 1, 0, 1,
-0.6671962, -0.8811594, -0.8668911, 0.4862745, 1, 0, 1,
-0.6640282, -0.5407436, -2.86776, 0.4823529, 1, 0, 1,
-0.661974, -0.7784967, -3.281167, 0.4745098, 1, 0, 1,
-0.6604146, 0.653867, -1.016687, 0.4705882, 1, 0, 1,
-0.6573994, 1.229637, 1.154267, 0.4627451, 1, 0, 1,
-0.6532803, 0.8655986, -0.2539974, 0.4588235, 1, 0, 1,
-0.6526135, 0.07398627, -1.619409, 0.4509804, 1, 0, 1,
-0.6483322, 0.7207993, -1.946695, 0.4470588, 1, 0, 1,
-0.6444985, 1.196384, -0.6751142, 0.4392157, 1, 0, 1,
-0.6418769, 0.431362, -1.012009, 0.4352941, 1, 0, 1,
-0.640174, 0.3373044, -2.239163, 0.427451, 1, 0, 1,
-0.6375074, -0.5043727, -4.066313, 0.4235294, 1, 0, 1,
-0.6364017, -0.8822977, 0.1833107, 0.4156863, 1, 0, 1,
-0.6331061, 1.335198, 0.7267211, 0.4117647, 1, 0, 1,
-0.6300169, 0.00923001, -1.620702, 0.4039216, 1, 0, 1,
-0.6286163, -0.004099222, -1.509253, 0.3960784, 1, 0, 1,
-0.6255866, 1.836466, 0.1040978, 0.3921569, 1, 0, 1,
-0.6192604, 1.292909, 0.2163043, 0.3843137, 1, 0, 1,
-0.6183355, 0.9557658, -1.405467, 0.3803922, 1, 0, 1,
-0.6182869, -1.103381, -5.041089, 0.372549, 1, 0, 1,
-0.6134503, 0.5868054, -0.4107765, 0.3686275, 1, 0, 1,
-0.6107013, 0.7451705, -0.9104794, 0.3607843, 1, 0, 1,
-0.6061424, 0.3266944, -1.709598, 0.3568628, 1, 0, 1,
-0.6055149, 0.6330469, 1.087527, 0.3490196, 1, 0, 1,
-0.6041647, 0.5380524, 0.07790583, 0.345098, 1, 0, 1,
-0.602024, 1.435833, -0.538835, 0.3372549, 1, 0, 1,
-0.600378, 0.9068555, -1.550163, 0.3333333, 1, 0, 1,
-0.5989154, -1.112546, -2.672657, 0.3254902, 1, 0, 1,
-0.5965106, 0.3640192, -2.584793, 0.3215686, 1, 0, 1,
-0.5827587, 0.3414773, -1.404235, 0.3137255, 1, 0, 1,
-0.5811461, -0.8636672, -1.465453, 0.3098039, 1, 0, 1,
-0.5801743, 0.2275919, -2.302111, 0.3019608, 1, 0, 1,
-0.5771014, 0.1935902, -2.245511, 0.2941177, 1, 0, 1,
-0.5760143, -0.2719595, -0.3666935, 0.2901961, 1, 0, 1,
-0.5717105, -1.335532, -1.557828, 0.282353, 1, 0, 1,
-0.571018, -1.168795, -4.168374, 0.2784314, 1, 0, 1,
-0.5640496, 0.5357776, 1.388204, 0.2705882, 1, 0, 1,
-0.5625151, 0.005151224, -1.927819, 0.2666667, 1, 0, 1,
-0.5603145, 0.1949296, 0.7620622, 0.2588235, 1, 0, 1,
-0.5576277, -0.2747359, -3.103191, 0.254902, 1, 0, 1,
-0.5529917, -0.2160956, -2.342825, 0.2470588, 1, 0, 1,
-0.5433371, 1.256745, 0.2742574, 0.2431373, 1, 0, 1,
-0.5430229, 1.046234, 0.5974407, 0.2352941, 1, 0, 1,
-0.5403584, -0.6046645, -2.871368, 0.2313726, 1, 0, 1,
-0.5335068, 0.9182205, 0.9535999, 0.2235294, 1, 0, 1,
-0.5315066, 0.5099763, 0.02978584, 0.2196078, 1, 0, 1,
-0.5223268, 0.09336638, -2.113659, 0.2117647, 1, 0, 1,
-0.5123126, 0.1956004, -0.8719146, 0.2078431, 1, 0, 1,
-0.5035704, 0.436082, -1.626217, 0.2, 1, 0, 1,
-0.5030924, 0.4281216, -1.304849, 0.1921569, 1, 0, 1,
-0.5001879, 0.802455, -0.9964332, 0.1882353, 1, 0, 1,
-0.496831, 0.2339046, -1.608558, 0.1803922, 1, 0, 1,
-0.4939907, 1.391704, -0.2744544, 0.1764706, 1, 0, 1,
-0.4937718, 0.6200443, -2.035778, 0.1686275, 1, 0, 1,
-0.4916626, -1.222682, -4.080986, 0.1647059, 1, 0, 1,
-0.4907261, -0.2327585, -1.560502, 0.1568628, 1, 0, 1,
-0.4890116, 0.2129453, -1.767884, 0.1529412, 1, 0, 1,
-0.4886268, -0.3757026, -2.745124, 0.145098, 1, 0, 1,
-0.4884316, 1.632965, 0.2092477, 0.1411765, 1, 0, 1,
-0.4863973, -1.196141, -3.9909, 0.1333333, 1, 0, 1,
-0.4856402, 0.3586147, -2.086267, 0.1294118, 1, 0, 1,
-0.4838863, -1.994878, -4.1984, 0.1215686, 1, 0, 1,
-0.4810403, 1.299152, 0.7809719, 0.1176471, 1, 0, 1,
-0.4771178, -1.559495, -3.004773, 0.1098039, 1, 0, 1,
-0.4751252, 0.2217909, -1.080554, 0.1058824, 1, 0, 1,
-0.4685477, 1.396727, 1.135007, 0.09803922, 1, 0, 1,
-0.4657621, 1.863807, 0.8608693, 0.09019608, 1, 0, 1,
-0.4640987, -2.19826, -2.894578, 0.08627451, 1, 0, 1,
-0.4610581, 1.376466, -1.584943, 0.07843138, 1, 0, 1,
-0.4602017, -0.8550307, -3.279961, 0.07450981, 1, 0, 1,
-0.4575981, 0.1976042, 1.526366, 0.06666667, 1, 0, 1,
-0.4517052, -0.1389054, -0.7380393, 0.0627451, 1, 0, 1,
-0.4486693, -2.01768, -4.47383, 0.05490196, 1, 0, 1,
-0.4459556, -0.1785024, -2.22967, 0.05098039, 1, 0, 1,
-0.4457952, 0.0004227949, -1.836799, 0.04313726, 1, 0, 1,
-0.4439006, 1.087129, 0.8180897, 0.03921569, 1, 0, 1,
-0.4354937, 0.4612415, -0.6076857, 0.03137255, 1, 0, 1,
-0.4335984, 0.936535, 0.6730252, 0.02745098, 1, 0, 1,
-0.4269382, -0.1215939, -1.120062, 0.01960784, 1, 0, 1,
-0.4253439, 0.6737411, 0.4223524, 0.01568628, 1, 0, 1,
-0.4196132, 1.407678, 0.538609, 0.007843138, 1, 0, 1,
-0.4070868, 0.8727935, -1.234968, 0.003921569, 1, 0, 1,
-0.4018829, -0.8170531, -2.224162, 0, 1, 0.003921569, 1,
-0.3985971, -1.173523, -2.871014, 0, 1, 0.01176471, 1,
-0.3931341, 1.624132, 0.9931911, 0, 1, 0.01568628, 1,
-0.3923387, 1.501123, 1.279991, 0, 1, 0.02352941, 1,
-0.3904582, -2.139945, -2.758434, 0, 1, 0.02745098, 1,
-0.389737, 0.1147631, -1.802745, 0, 1, 0.03529412, 1,
-0.3876632, -0.6865844, -1.590137, 0, 1, 0.03921569, 1,
-0.3869038, -1.117567, -2.031505, 0, 1, 0.04705882, 1,
-0.385753, -0.6907012, -1.74341, 0, 1, 0.05098039, 1,
-0.3841088, -1.863202, -2.289715, 0, 1, 0.05882353, 1,
-0.3814065, 0.2201333, -0.3724555, 0, 1, 0.0627451, 1,
-0.3804897, 2.138839, -0.8887427, 0, 1, 0.07058824, 1,
-0.3783273, 0.4647314, -0.9717169, 0, 1, 0.07450981, 1,
-0.3757625, -0.1249154, -0.8608555, 0, 1, 0.08235294, 1,
-0.3747501, 0.4652461, -1.199337, 0, 1, 0.08627451, 1,
-0.372258, -1.536078, -1.413373, 0, 1, 0.09411765, 1,
-0.3712932, 0.4838521, -0.6636228, 0, 1, 0.1019608, 1,
-0.3692737, 0.4230242, -0.3160084, 0, 1, 0.1058824, 1,
-0.3662426, 0.03763989, -2.524197, 0, 1, 0.1137255, 1,
-0.3637507, -1.339607, -3.28536, 0, 1, 0.1176471, 1,
-0.3625556, -2.270326, -3.698945, 0, 1, 0.1254902, 1,
-0.3604956, 0.4993134, 0.1923572, 0, 1, 0.1294118, 1,
-0.3585722, 0.9321745, 1.204234, 0, 1, 0.1372549, 1,
-0.3555549, 0.2237822, -0.8057671, 0, 1, 0.1411765, 1,
-0.3554573, -0.5605857, -1.559032, 0, 1, 0.1490196, 1,
-0.3501777, 0.7451446, -0.6514122, 0, 1, 0.1529412, 1,
-0.3479901, -0.1760564, -1.814126, 0, 1, 0.1607843, 1,
-0.3376557, -0.8854681, -4.258718, 0, 1, 0.1647059, 1,
-0.333526, -0.05034094, -3.348524, 0, 1, 0.172549, 1,
-0.330178, 0.04978603, -2.505226, 0, 1, 0.1764706, 1,
-0.3289763, -0.706725, -1.79012, 0, 1, 0.1843137, 1,
-0.3273343, 0.7122926, -0.07027863, 0, 1, 0.1882353, 1,
-0.3226604, -2.015944, -4.285576, 0, 1, 0.1960784, 1,
-0.3217122, 1.613303, -0.9370528, 0, 1, 0.2039216, 1,
-0.3173718, -1.710463, -4.341033, 0, 1, 0.2078431, 1,
-0.3171062, -0.1806887, -0.7286231, 0, 1, 0.2156863, 1,
-0.3117236, -2.122723, -2.207352, 0, 1, 0.2196078, 1,
-0.3100775, -0.6548777, -3.354213, 0, 1, 0.227451, 1,
-0.309627, 1.289847, 0.9116348, 0, 1, 0.2313726, 1,
-0.3082103, 0.3035592, -0.2195277, 0, 1, 0.2392157, 1,
-0.3041589, 1.7188, -0.127402, 0, 1, 0.2431373, 1,
-0.3030833, 1.093015, -0.3547047, 0, 1, 0.2509804, 1,
-0.2934451, 0.04107323, -1.202799, 0, 1, 0.254902, 1,
-0.2910385, -0.04120759, -1.16961, 0, 1, 0.2627451, 1,
-0.2886055, -0.2859385, -1.443741, 0, 1, 0.2666667, 1,
-0.2873478, 0.05387045, -1.118476, 0, 1, 0.2745098, 1,
-0.2864988, 1.404856, -1.349413, 0, 1, 0.2784314, 1,
-0.2860004, -3.510601, -3.670708, 0, 1, 0.2862745, 1,
-0.2835758, 0.399877, 1.424994, 0, 1, 0.2901961, 1,
-0.2831242, 0.4698433, -0.1088347, 0, 1, 0.2980392, 1,
-0.2800953, 0.6014372, 0.6881283, 0, 1, 0.3058824, 1,
-0.2799001, -0.1244503, -1.963351, 0, 1, 0.3098039, 1,
-0.2766958, -0.5057673, -1.005052, 0, 1, 0.3176471, 1,
-0.2641303, 0.2386186, -0.3871478, 0, 1, 0.3215686, 1,
-0.2524555, 0.4084213, 0.05200322, 0, 1, 0.3294118, 1,
-0.250944, -0.3679438, -1.767118, 0, 1, 0.3333333, 1,
-0.2492275, 0.2256974, -0.1558597, 0, 1, 0.3411765, 1,
-0.2484342, 0.4364558, 0.6136221, 0, 1, 0.345098, 1,
-0.2399997, -1.557322, -3.900266, 0, 1, 0.3529412, 1,
-0.2369632, -1.220835, -2.709315, 0, 1, 0.3568628, 1,
-0.2368259, 1.477058, -0.7303309, 0, 1, 0.3647059, 1,
-0.2368151, 0.8726457, 2.675201, 0, 1, 0.3686275, 1,
-0.2311552, 0.848343, -1.010138, 0, 1, 0.3764706, 1,
-0.2305791, 0.9676926, -0.09101754, 0, 1, 0.3803922, 1,
-0.2276143, 0.4229553, 1.112076, 0, 1, 0.3882353, 1,
-0.2234797, -0.2687447, -1.627154, 0, 1, 0.3921569, 1,
-0.220789, 0.7022243, 0.3388853, 0, 1, 0.4, 1,
-0.2184289, -1.205312, -3.490671, 0, 1, 0.4078431, 1,
-0.2177716, 0.706712, 0.06673333, 0, 1, 0.4117647, 1,
-0.2168511, 1.123937, -0.4972253, 0, 1, 0.4196078, 1,
-0.2165207, 3.472471, 1.67391, 0, 1, 0.4235294, 1,
-0.2149337, -0.7588899, -1.945187, 0, 1, 0.4313726, 1,
-0.2118928, 1.84053, 1.272047, 0, 1, 0.4352941, 1,
-0.2095233, 0.743171, 1.136655, 0, 1, 0.4431373, 1,
-0.2087612, 1.236394, -0.9427866, 0, 1, 0.4470588, 1,
-0.2084662, 0.3421314, 0.2242303, 0, 1, 0.454902, 1,
-0.207283, 0.8455574, -0.6113022, 0, 1, 0.4588235, 1,
-0.2071303, 0.5901423, 0.1176985, 0, 1, 0.4666667, 1,
-0.2033998, 0.486482, -2.297996, 0, 1, 0.4705882, 1,
-0.2029546, -0.8821098, -3.54175, 0, 1, 0.4784314, 1,
-0.2022435, -1.864429, -3.962702, 0, 1, 0.4823529, 1,
-0.2013891, 2.721478, 1.107369, 0, 1, 0.4901961, 1,
-0.2012759, -1.285974, -2.341957, 0, 1, 0.4941176, 1,
-0.1989866, -0.6383226, -3.720667, 0, 1, 0.5019608, 1,
-0.1973493, -1.009929, -2.329811, 0, 1, 0.509804, 1,
-0.1935956, 0.427863, -1.3551, 0, 1, 0.5137255, 1,
-0.1917583, -0.7243384, -3.239224, 0, 1, 0.5215687, 1,
-0.1905108, 1.865555, -0.04524362, 0, 1, 0.5254902, 1,
-0.1883976, 1.618531, -0.646306, 0, 1, 0.5333334, 1,
-0.1758525, 0.7293255, -0.01032957, 0, 1, 0.5372549, 1,
-0.1724439, 0.9944214, 0.0848309, 0, 1, 0.5450981, 1,
-0.1620259, -0.1252129, -2.156796, 0, 1, 0.5490196, 1,
-0.161327, 0.6229333, -0.4759541, 0, 1, 0.5568628, 1,
-0.1611124, 0.7585452, 1.438256, 0, 1, 0.5607843, 1,
-0.1610231, 0.4931249, 1.22647, 0, 1, 0.5686275, 1,
-0.1603612, -0.6920898, -3.023082, 0, 1, 0.572549, 1,
-0.1572197, -0.5614327, -3.449816, 0, 1, 0.5803922, 1,
-0.1554185, -0.4778667, -2.438946, 0, 1, 0.5843138, 1,
-0.1537323, 0.2140732, -0.9460656, 0, 1, 0.5921569, 1,
-0.1514497, -2.012136, -2.71803, 0, 1, 0.5960785, 1,
-0.1472111, 0.7030936, 2.915764, 0, 1, 0.6039216, 1,
-0.1395953, -1.246394, -2.868932, 0, 1, 0.6117647, 1,
-0.1389789, 2.536004, 0.04024578, 0, 1, 0.6156863, 1,
-0.1362157, 0.6682894, -0.3341505, 0, 1, 0.6235294, 1,
-0.1343852, 0.1893439, -1.290221, 0, 1, 0.627451, 1,
-0.1342175, 0.6655201, -0.980589, 0, 1, 0.6352941, 1,
-0.1297702, -0.4048479, -2.997113, 0, 1, 0.6392157, 1,
-0.1292197, -0.9192563, -0.5629568, 0, 1, 0.6470588, 1,
-0.1291905, -0.8234313, -3.167023, 0, 1, 0.6509804, 1,
-0.1277862, 1.370826, -0.3281222, 0, 1, 0.6588235, 1,
-0.1214861, -0.8706528, -2.338219, 0, 1, 0.6627451, 1,
-0.1188689, 0.2628255, 0.03572702, 0, 1, 0.6705883, 1,
-0.1172995, 0.6188949, -1.552454, 0, 1, 0.6745098, 1,
-0.1106744, 0.002592356, -1.187385, 0, 1, 0.682353, 1,
-0.106561, -0.2165056, -2.9445, 0, 1, 0.6862745, 1,
-0.1061611, -1.044051, -3.313639, 0, 1, 0.6941177, 1,
-0.1048617, 0.9057191, 0.4181179, 0, 1, 0.7019608, 1,
-0.1047233, 0.3122114, -0.604494, 0, 1, 0.7058824, 1,
-0.1024602, -0.2812816, -1.683639, 0, 1, 0.7137255, 1,
-0.1023666, 0.148979, 2.023767, 0, 1, 0.7176471, 1,
-0.1002979, 0.4959934, 0.5385278, 0, 1, 0.7254902, 1,
-0.09680089, -0.04661443, -0.7908208, 0, 1, 0.7294118, 1,
-0.09216685, -0.8384649, -3.149385, 0, 1, 0.7372549, 1,
-0.0920737, -1.515471, -2.759434, 0, 1, 0.7411765, 1,
-0.08931845, -1.149094, -3.970501, 0, 1, 0.7490196, 1,
-0.08915012, -1.492799, -3.212102, 0, 1, 0.7529412, 1,
-0.08489475, 0.8694279, 0.9463623, 0, 1, 0.7607843, 1,
-0.08374982, -0.4065449, -3.097325, 0, 1, 0.7647059, 1,
-0.08327304, -0.468796, -4.013562, 0, 1, 0.772549, 1,
-0.07768458, -0.2661995, -2.154438, 0, 1, 0.7764706, 1,
-0.07757868, 0.3426901, -1.329065, 0, 1, 0.7843137, 1,
-0.07630131, -0.3029091, -2.753408, 0, 1, 0.7882353, 1,
-0.07055269, 0.003240989, -1.932044, 0, 1, 0.7960784, 1,
-0.06948388, 0.1698966, 0.3977614, 0, 1, 0.8039216, 1,
-0.06781825, 0.1815624, -1.563453, 0, 1, 0.8078431, 1,
-0.06300997, -0.7342765, -2.253917, 0, 1, 0.8156863, 1,
-0.05550063, 1.089443, -1.805517, 0, 1, 0.8196079, 1,
-0.05466449, -0.5036641, -1.635034, 0, 1, 0.827451, 1,
-0.05384989, 0.3307082, 0.3117343, 0, 1, 0.8313726, 1,
-0.04403355, -1.150266, -0.9121744, 0, 1, 0.8392157, 1,
-0.04304225, -0.1228044, -1.667526, 0, 1, 0.8431373, 1,
-0.04278489, -1.286317, -3.883286, 0, 1, 0.8509804, 1,
-0.04171895, 1.050966, 0.4033251, 0, 1, 0.854902, 1,
-0.04042677, -2.254284, -4.822545, 0, 1, 0.8627451, 1,
-0.03787009, -2.391519, -2.580317, 0, 1, 0.8666667, 1,
-0.03666472, -0.3815153, -2.237593, 0, 1, 0.8745098, 1,
-0.03627509, -0.3731068, -2.676597, 0, 1, 0.8784314, 1,
-0.03366857, -0.6466508, -3.959305, 0, 1, 0.8862745, 1,
-0.03294554, -0.6284408, -4.146977, 0, 1, 0.8901961, 1,
-0.02802973, 0.1105558, 1.041278, 0, 1, 0.8980392, 1,
-0.02232792, 0.266589, 0.3327608, 0, 1, 0.9058824, 1,
-0.01975036, 0.8709313, -0.9743617, 0, 1, 0.9098039, 1,
-0.0185984, 1.592433, -0.5154938, 0, 1, 0.9176471, 1,
-0.0169699, 2.337871, -0.4142897, 0, 1, 0.9215686, 1,
-0.01425698, 2.226742, 1.080656, 0, 1, 0.9294118, 1,
-0.01083245, 0.1533261, -0.3997128, 0, 1, 0.9333333, 1,
-0.007347495, -0.442507, -4.447095, 0, 1, 0.9411765, 1,
-0.006053705, -0.2888521, -0.9400395, 0, 1, 0.945098, 1,
-0.004145147, 0.4689383, -0.251395, 0, 1, 0.9529412, 1,
-0.001732827, 1.085775, -0.7894803, 0, 1, 0.9568627, 1,
-6.362766e-05, 0.864879, -0.131599, 0, 1, 0.9647059, 1,
0.001206404, 0.4413183, -1.79285, 0, 1, 0.9686275, 1,
0.001228427, -0.5644328, 2.107756, 0, 1, 0.9764706, 1,
0.002170768, -0.517405, 3.813671, 0, 1, 0.9803922, 1,
0.006847707, 0.4146377, -0.8387071, 0, 1, 0.9882353, 1,
0.00795295, 2.004991, -0.8394783, 0, 1, 0.9921569, 1,
0.008268244, -0.5342396, 2.959148, 0, 1, 1, 1,
0.008845836, 0.01246481, 1.686431, 0, 0.9921569, 1, 1,
0.009132912, 1.132254, 0.05459504, 0, 0.9882353, 1, 1,
0.01448494, -0.7749175, 4.089437, 0, 0.9803922, 1, 1,
0.01724908, 0.03058399, 0.189228, 0, 0.9764706, 1, 1,
0.02303085, -1.434107, 1.017204, 0, 0.9686275, 1, 1,
0.02652268, 1.052992, 0.8677186, 0, 0.9647059, 1, 1,
0.03013394, 1.716715, 0.4061107, 0, 0.9568627, 1, 1,
0.03318302, -0.1882606, 3.639697, 0, 0.9529412, 1, 1,
0.03433748, 0.5406963, 2.156667, 0, 0.945098, 1, 1,
0.03466352, -0.2474834, 2.330324, 0, 0.9411765, 1, 1,
0.03589447, 0.2416113, -0.7388223, 0, 0.9333333, 1, 1,
0.03955996, 0.8991951, -0.2537315, 0, 0.9294118, 1, 1,
0.040434, 0.1883845, 1.20226, 0, 0.9215686, 1, 1,
0.04203331, -0.7341402, 4.065639, 0, 0.9176471, 1, 1,
0.04232084, -0.931742, 4.983805, 0, 0.9098039, 1, 1,
0.04271283, 0.4765975, 1.764419, 0, 0.9058824, 1, 1,
0.04301348, -0.2099696, 4.209821, 0, 0.8980392, 1, 1,
0.04317279, -1.077112, 3.653623, 0, 0.8901961, 1, 1,
0.04738633, -0.3970733, 2.619771, 0, 0.8862745, 1, 1,
0.05046456, -1.29116, 3.679042, 0, 0.8784314, 1, 1,
0.05092111, -0.4259244, 3.409314, 0, 0.8745098, 1, 1,
0.05163424, 0.7274539, 1.486688, 0, 0.8666667, 1, 1,
0.05190079, 1.181435, 1.7346, 0, 0.8627451, 1, 1,
0.05336897, -0.1469614, 3.848744, 0, 0.854902, 1, 1,
0.05597415, 0.9003586, -0.4490024, 0, 0.8509804, 1, 1,
0.06164319, 0.7656213, -0.5324244, 0, 0.8431373, 1, 1,
0.06317629, -1.336897, 1.627084, 0, 0.8392157, 1, 1,
0.06330052, 0.1353565, 0.5090351, 0, 0.8313726, 1, 1,
0.06644329, 2.102786, 0.6960465, 0, 0.827451, 1, 1,
0.07048941, 0.736466, 0.8777537, 0, 0.8196079, 1, 1,
0.07062818, 0.7341779, 0.06816444, 0, 0.8156863, 1, 1,
0.07239643, -0.1426258, 2.788529, 0, 0.8078431, 1, 1,
0.0726546, 1.635123, 1.137055, 0, 0.8039216, 1, 1,
0.0754995, -0.3871245, 2.957985, 0, 0.7960784, 1, 1,
0.07882851, 0.72294, -1.067103, 0, 0.7882353, 1, 1,
0.08012543, -0.8370813, 1.785751, 0, 0.7843137, 1, 1,
0.08604054, -0.1128573, 2.196653, 0, 0.7764706, 1, 1,
0.08822577, -1.113079, 2.390933, 0, 0.772549, 1, 1,
0.08878472, -0.5477384, 2.709195, 0, 0.7647059, 1, 1,
0.08959433, 0.618214, -0.8930677, 0, 0.7607843, 1, 1,
0.09073385, -0.6278517, 1.532664, 0, 0.7529412, 1, 1,
0.09270956, -1.711929, 2.854166, 0, 0.7490196, 1, 1,
0.0939571, 0.5319285, 0.5665505, 0, 0.7411765, 1, 1,
0.09438307, 0.9587516, 1.212053, 0, 0.7372549, 1, 1,
0.09976611, 0.4932137, 1.401222, 0, 0.7294118, 1, 1,
0.1001795, 0.1987365, 0.2567016, 0, 0.7254902, 1, 1,
0.1028759, 0.7533522, 1.264893, 0, 0.7176471, 1, 1,
0.1040411, -0.9208617, 3.210872, 0, 0.7137255, 1, 1,
0.1041488, -0.6942437, 3.116176, 0, 0.7058824, 1, 1,
0.106948, -1.221495, 2.758127, 0, 0.6980392, 1, 1,
0.1072573, 0.5726385, 1.784266, 0, 0.6941177, 1, 1,
0.1076898, 1.446673, 0.4903392, 0, 0.6862745, 1, 1,
0.1111941, -0.2341996, 2.674823, 0, 0.682353, 1, 1,
0.111853, 0.05203255, 0.7062114, 0, 0.6745098, 1, 1,
0.1126546, -0.1025868, 2.173999, 0, 0.6705883, 1, 1,
0.1134577, -0.5284724, 3.669406, 0, 0.6627451, 1, 1,
0.1155458, -1.939787, 3.664736, 0, 0.6588235, 1, 1,
0.1185489, -0.1698649, 1.963065, 0, 0.6509804, 1, 1,
0.1198016, -0.8058295, 2.304401, 0, 0.6470588, 1, 1,
0.1265603, 0.9993617, 1.251507, 0, 0.6392157, 1, 1,
0.1322384, 0.4232033, -1.253512, 0, 0.6352941, 1, 1,
0.1339634, -0.9679931, 3.936864, 0, 0.627451, 1, 1,
0.1355764, -0.6511016, 2.508508, 0, 0.6235294, 1, 1,
0.136219, 0.4537024, 2.309968, 0, 0.6156863, 1, 1,
0.1393704, -0.4168121, 1.553377, 0, 0.6117647, 1, 1,
0.140064, -2.406205, 3.706264, 0, 0.6039216, 1, 1,
0.1414207, 0.02320958, 2.402432, 0, 0.5960785, 1, 1,
0.1425583, 0.7595033, 0.3302575, 0, 0.5921569, 1, 1,
0.1507717, 1.637534, -0.75648, 0, 0.5843138, 1, 1,
0.1556247, -0.9022581, 2.851026, 0, 0.5803922, 1, 1,
0.1558017, -2.120023, 3.045969, 0, 0.572549, 1, 1,
0.1560631, 0.3974785, -2.00364, 0, 0.5686275, 1, 1,
0.1606982, -0.004767917, 1.858396, 0, 0.5607843, 1, 1,
0.16588, -0.9618786, 2.990618, 0, 0.5568628, 1, 1,
0.171045, 0.4377109, -1.022702, 0, 0.5490196, 1, 1,
0.1712136, -0.5971878, 1.650831, 0, 0.5450981, 1, 1,
0.1821414, -0.2547089, 3.096601, 0, 0.5372549, 1, 1,
0.18328, 1.399699, -0.09673753, 0, 0.5333334, 1, 1,
0.1869647, -1.004284, 1.918067, 0, 0.5254902, 1, 1,
0.1873858, 1.110563, -0.8297373, 0, 0.5215687, 1, 1,
0.1875456, 2.208967, -1.395146, 0, 0.5137255, 1, 1,
0.188351, -0.1626772, 3.512507, 0, 0.509804, 1, 1,
0.194645, -0.4307441, 2.577348, 0, 0.5019608, 1, 1,
0.195421, -1.603004, 3.892305, 0, 0.4941176, 1, 1,
0.1976753, -0.04925953, 2.354725, 0, 0.4901961, 1, 1,
0.1980884, 0.8970491, -0.4079973, 0, 0.4823529, 1, 1,
0.1988721, 0.2466009, 0.9006788, 0, 0.4784314, 1, 1,
0.2008343, 1.290702, -0.5828397, 0, 0.4705882, 1, 1,
0.2061463, -1.13754, 2.43937, 0, 0.4666667, 1, 1,
0.2073504, -0.2692726, 3.310552, 0, 0.4588235, 1, 1,
0.211851, -1.127147, 2.469085, 0, 0.454902, 1, 1,
0.2269832, -0.1312698, 2.600149, 0, 0.4470588, 1, 1,
0.2303427, 0.6108202, 0.722872, 0, 0.4431373, 1, 1,
0.2381399, -0.3165222, 2.314704, 0, 0.4352941, 1, 1,
0.2414179, -0.183663, 1.869577, 0, 0.4313726, 1, 1,
0.2450163, -0.8357241, 3.210116, 0, 0.4235294, 1, 1,
0.245356, 0.1791931, 2.73964, 0, 0.4196078, 1, 1,
0.2455349, 0.7729567, 0.0458521, 0, 0.4117647, 1, 1,
0.247215, -0.4732292, 3.991972, 0, 0.4078431, 1, 1,
0.247219, -0.9189946, 3.738634, 0, 0.4, 1, 1,
0.248968, 0.5638282, 0.5960115, 0, 0.3921569, 1, 1,
0.2507287, -1.501018, 2.906073, 0, 0.3882353, 1, 1,
0.253483, 1.242486, 0.4591935, 0, 0.3803922, 1, 1,
0.2539846, -0.8195101, 3.152309, 0, 0.3764706, 1, 1,
0.2556278, -1.294278, 2.982517, 0, 0.3686275, 1, 1,
0.2603078, 0.4871538, 0.5368109, 0, 0.3647059, 1, 1,
0.2646926, 0.602457, 0.4541225, 0, 0.3568628, 1, 1,
0.2660975, -0.7526711, 2.673447, 0, 0.3529412, 1, 1,
0.2681019, 0.6781786, -1.422519, 0, 0.345098, 1, 1,
0.2699249, 0.02906214, 2.659607, 0, 0.3411765, 1, 1,
0.2740132, 2.009564, -1.188185, 0, 0.3333333, 1, 1,
0.2742342, 0.01819735, 0.3116284, 0, 0.3294118, 1, 1,
0.2743628, -0.2819999, 2.257946, 0, 0.3215686, 1, 1,
0.2760887, -0.02607445, 0.1858811, 0, 0.3176471, 1, 1,
0.2774552, -1.281773, 1.338628, 0, 0.3098039, 1, 1,
0.2797668, -0.9982404, 2.051738, 0, 0.3058824, 1, 1,
0.2807946, 0.3906425, 1.291776, 0, 0.2980392, 1, 1,
0.2808579, 1.471008, -0.4762418, 0, 0.2901961, 1, 1,
0.2809431, -0.778583, 3.13222, 0, 0.2862745, 1, 1,
0.2846507, -1.19093, 4.255823, 0, 0.2784314, 1, 1,
0.2980441, 0.3675649, 0.04767273, 0, 0.2745098, 1, 1,
0.2981737, -0.6559573, 2.775377, 0, 0.2666667, 1, 1,
0.2996117, -1.241909, 1.967886, 0, 0.2627451, 1, 1,
0.3081111, -0.2863808, 3.412838, 0, 0.254902, 1, 1,
0.3107319, -0.510455, 3.509402, 0, 0.2509804, 1, 1,
0.3122651, -0.5053135, 2.115478, 0, 0.2431373, 1, 1,
0.314436, -0.3073756, 2.241101, 0, 0.2392157, 1, 1,
0.3174137, 1.325158, -1.336503, 0, 0.2313726, 1, 1,
0.319759, -1.098101, 2.795403, 0, 0.227451, 1, 1,
0.3203169, -1.074168, 3.187854, 0, 0.2196078, 1, 1,
0.3241465, -0.9622739, 4.20259, 0, 0.2156863, 1, 1,
0.3271452, 0.7719474, 1.032599, 0, 0.2078431, 1, 1,
0.327311, -0.2633087, 3.311651, 0, 0.2039216, 1, 1,
0.3292669, 1.011929, -0.8401549, 0, 0.1960784, 1, 1,
0.3308723, -0.6158415, 2.552461, 0, 0.1882353, 1, 1,
0.3325888, -1.557744, 2.576923, 0, 0.1843137, 1, 1,
0.3437988, 1.32987, 0.1286501, 0, 0.1764706, 1, 1,
0.3462537, -1.285943, 2.462521, 0, 0.172549, 1, 1,
0.3479848, -0.6590344, 0.8870614, 0, 0.1647059, 1, 1,
0.3550569, -0.8195037, 1.959187, 0, 0.1607843, 1, 1,
0.3559167, -0.3993509, 2.283221, 0, 0.1529412, 1, 1,
0.3611293, -0.1687486, 0.3641469, 0, 0.1490196, 1, 1,
0.3613748, 0.4660747, -0.1974163, 0, 0.1411765, 1, 1,
0.3627082, 0.9609914, -0.3891782, 0, 0.1372549, 1, 1,
0.3633012, -0.7866791, 3.903653, 0, 0.1294118, 1, 1,
0.3653083, -0.008881889, 2.048014, 0, 0.1254902, 1, 1,
0.3672833, 1.041231, -1.082202, 0, 0.1176471, 1, 1,
0.3702613, -0.1507814, 0.6264088, 0, 0.1137255, 1, 1,
0.3715106, 0.2248164, -0.146048, 0, 0.1058824, 1, 1,
0.3722337, 1.303692, 0.6899541, 0, 0.09803922, 1, 1,
0.3723507, -0.3603684, 2.771947, 0, 0.09411765, 1, 1,
0.3727408, 0.1499806, 1.05484, 0, 0.08627451, 1, 1,
0.373548, 0.05215181, -0.4956189, 0, 0.08235294, 1, 1,
0.3747296, 0.08498588, 0.4479622, 0, 0.07450981, 1, 1,
0.3819343, 0.7868206, -0.01357866, 0, 0.07058824, 1, 1,
0.3846705, 0.128761, 1.255129, 0, 0.0627451, 1, 1,
0.389713, 2.535776, -1.681251, 0, 0.05882353, 1, 1,
0.3940362, -1.482441, 4.028041, 0, 0.05098039, 1, 1,
0.3954957, 0.288839, 0.2588384, 0, 0.04705882, 1, 1,
0.4000834, -0.1740587, 1.390471, 0, 0.03921569, 1, 1,
0.4021924, -0.5477065, 2.503784, 0, 0.03529412, 1, 1,
0.402226, -0.04788546, 2.655963, 0, 0.02745098, 1, 1,
0.4044253, 0.5727285, -0.177777, 0, 0.02352941, 1, 1,
0.4045836, 0.9687203, -0.1688898, 0, 0.01568628, 1, 1,
0.4052919, 0.001208186, 3.364993, 0, 0.01176471, 1, 1,
0.4067264, -0.9506366, 2.041041, 0, 0.003921569, 1, 1,
0.4072687, -0.2372428, 1.744021, 0.003921569, 0, 1, 1,
0.4075567, 0.5415145, 2.433523, 0.007843138, 0, 1, 1,
0.4078034, 0.2184225, 2.618602, 0.01568628, 0, 1, 1,
0.4095417, 1.270177, 0.9286963, 0.01960784, 0, 1, 1,
0.421545, -0.2808399, 1.432255, 0.02745098, 0, 1, 1,
0.4234481, -0.5864587, 2.4386, 0.03137255, 0, 1, 1,
0.4286252, -0.5006714, 3.406652, 0.03921569, 0, 1, 1,
0.4304034, 0.9209902, 1.064767, 0.04313726, 0, 1, 1,
0.4307096, 1.144808, -0.7988995, 0.05098039, 0, 1, 1,
0.4313971, 0.5007462, -0.1326612, 0.05490196, 0, 1, 1,
0.4346734, 0.07042837, 1.862734, 0.0627451, 0, 1, 1,
0.4374928, -0.2636374, 1.806442, 0.06666667, 0, 1, 1,
0.4382372, -1.383721, 0.5330129, 0.07450981, 0, 1, 1,
0.4406273, 0.2126189, 0.1439694, 0.07843138, 0, 1, 1,
0.4446704, 0.1253697, 1.259172, 0.08627451, 0, 1, 1,
0.4467717, 0.8457146, 0.5146268, 0.09019608, 0, 1, 1,
0.4499221, -0.6337401, 1.6059, 0.09803922, 0, 1, 1,
0.454919, 0.9645665, 1.695465, 0.1058824, 0, 1, 1,
0.4567703, -0.520703, 2.422061, 0.1098039, 0, 1, 1,
0.4675905, 0.5670297, 1.392387, 0.1176471, 0, 1, 1,
0.4676427, -0.4050958, 2.631603, 0.1215686, 0, 1, 1,
0.4677211, -2.115907, 3.728527, 0.1294118, 0, 1, 1,
0.4716505, -0.225676, 1.451065, 0.1333333, 0, 1, 1,
0.4734719, -0.6263127, 4.190332, 0.1411765, 0, 1, 1,
0.4762872, -0.5064647, 2.888252, 0.145098, 0, 1, 1,
0.4859934, -0.1080214, 5.428758, 0.1529412, 0, 1, 1,
0.4865398, -0.5634447, 1.851861, 0.1568628, 0, 1, 1,
0.48874, 1.357483, 0.8944463, 0.1647059, 0, 1, 1,
0.4967849, 0.9742482, 2.562097, 0.1686275, 0, 1, 1,
0.5082974, -1.036909, 1.901914, 0.1764706, 0, 1, 1,
0.5084767, -0.3187464, 0.3542002, 0.1803922, 0, 1, 1,
0.5104072, -1.153057, 3.237184, 0.1882353, 0, 1, 1,
0.5125938, -0.6646713, 1.872437, 0.1921569, 0, 1, 1,
0.5148653, 0.4498608, 0.370713, 0.2, 0, 1, 1,
0.5202187, -0.6847718, 2.287434, 0.2078431, 0, 1, 1,
0.5213016, -0.06121562, 3.965417, 0.2117647, 0, 1, 1,
0.526103, -1.781258, 3.733955, 0.2196078, 0, 1, 1,
0.5266221, 0.7357726, 1.558173, 0.2235294, 0, 1, 1,
0.5288171, -0.9640103, 2.226871, 0.2313726, 0, 1, 1,
0.5299277, -0.3284963, 3.740058, 0.2352941, 0, 1, 1,
0.5343316, -1.371061, 2.535685, 0.2431373, 0, 1, 1,
0.5344319, 0.9806512, -0.1212566, 0.2470588, 0, 1, 1,
0.5413995, 1.229416, 1.168596, 0.254902, 0, 1, 1,
0.541986, -0.07860408, 1.356611, 0.2588235, 0, 1, 1,
0.5470624, 0.84409, 0.5725653, 0.2666667, 0, 1, 1,
0.5496889, 0.3374878, 2.252852, 0.2705882, 0, 1, 1,
0.551989, 0.7402189, -0.2735205, 0.2784314, 0, 1, 1,
0.5523956, -0.38424, 1.182996, 0.282353, 0, 1, 1,
0.5648737, -2.445871, 3.447983, 0.2901961, 0, 1, 1,
0.5768421, 0.1524549, 1.551666, 0.2941177, 0, 1, 1,
0.5776851, 0.5370933, 1.221824, 0.3019608, 0, 1, 1,
0.5814826, 0.5193484, -0.2568883, 0.3098039, 0, 1, 1,
0.5870358, -0.7635413, 1.376518, 0.3137255, 0, 1, 1,
0.5914178, 0.03338094, 1.234658, 0.3215686, 0, 1, 1,
0.6022978, 0.1152576, 0.1193993, 0.3254902, 0, 1, 1,
0.6036451, 0.3819289, 1.019585, 0.3333333, 0, 1, 1,
0.6065298, 0.6524817, 1.300244, 0.3372549, 0, 1, 1,
0.606729, -0.832583, 3.543141, 0.345098, 0, 1, 1,
0.6166326, 1.254771, 0.4059907, 0.3490196, 0, 1, 1,
0.6185548, -0.0915094, 0.6020653, 0.3568628, 0, 1, 1,
0.6275408, 0.8757614, 2.492898, 0.3607843, 0, 1, 1,
0.6283194, 0.7860438, 0.4449533, 0.3686275, 0, 1, 1,
0.6355609, -0.3903663, 1.048191, 0.372549, 0, 1, 1,
0.6392272, 0.9748594, 1.010647, 0.3803922, 0, 1, 1,
0.6396803, -0.548297, 1.346792, 0.3843137, 0, 1, 1,
0.6443598, -1.817633, 3.189343, 0.3921569, 0, 1, 1,
0.6454465, -0.7953739, 2.090878, 0.3960784, 0, 1, 1,
0.6469671, -1.30348, 3.416224, 0.4039216, 0, 1, 1,
0.6475857, -0.3418286, 1.63444, 0.4117647, 0, 1, 1,
0.64921, 1.307269, -0.1338465, 0.4156863, 0, 1, 1,
0.6532568, -0.9963768, 2.620176, 0.4235294, 0, 1, 1,
0.6541617, 1.325249, 0.0620711, 0.427451, 0, 1, 1,
0.6548747, -0.9333069, 3.488581, 0.4352941, 0, 1, 1,
0.6560469, 0.701207, 0.4789627, 0.4392157, 0, 1, 1,
0.6600397, -1.038554, 2.169835, 0.4470588, 0, 1, 1,
0.6623038, -0.6379613, 1.61651, 0.4509804, 0, 1, 1,
0.6742273, 0.5142976, 1.851697, 0.4588235, 0, 1, 1,
0.6743185, 1.185735, -0.3020154, 0.4627451, 0, 1, 1,
0.6752387, -1.222312, 2.819086, 0.4705882, 0, 1, 1,
0.6775424, 0.04185119, 1.420176, 0.4745098, 0, 1, 1,
0.6792922, 2.289693, 0.1718648, 0.4823529, 0, 1, 1,
0.6802578, -1.528936, 3.065608, 0.4862745, 0, 1, 1,
0.686517, 0.545167, 1.229858, 0.4941176, 0, 1, 1,
0.6874855, -0.5536618, 2.379604, 0.5019608, 0, 1, 1,
0.6963204, 2.08393, 1.013989, 0.5058824, 0, 1, 1,
0.697235, -0.8866162, 2.864275, 0.5137255, 0, 1, 1,
0.7036284, 0.1544073, 1.198073, 0.5176471, 0, 1, 1,
0.7042041, -0.7483835, 1.19104, 0.5254902, 0, 1, 1,
0.7050207, -1.147616, 2.150342, 0.5294118, 0, 1, 1,
0.7073494, -0.7124844, 4.055973, 0.5372549, 0, 1, 1,
0.7150618, 0.5945599, 0.1538425, 0.5411765, 0, 1, 1,
0.7157924, -0.3342958, 2.52546, 0.5490196, 0, 1, 1,
0.7183806, 2.377451, 0.9614655, 0.5529412, 0, 1, 1,
0.7206053, 0.4650175, -0.6133198, 0.5607843, 0, 1, 1,
0.7217761, 0.5036467, 2.041358, 0.5647059, 0, 1, 1,
0.7233475, 1.041627, -0.8156784, 0.572549, 0, 1, 1,
0.7285609, -0.6901699, 2.604812, 0.5764706, 0, 1, 1,
0.7323137, -0.2554377, 2.423196, 0.5843138, 0, 1, 1,
0.7358145, 0.1916408, 1.53262, 0.5882353, 0, 1, 1,
0.7362853, -1.976278, 1.957768, 0.5960785, 0, 1, 1,
0.7423859, 1.608205, 2.079955, 0.6039216, 0, 1, 1,
0.7554222, 0.05290162, 1.181762, 0.6078432, 0, 1, 1,
0.7618073, 1.049425, 1.144345, 0.6156863, 0, 1, 1,
0.7647943, -1.914158, 3.051245, 0.6196079, 0, 1, 1,
0.7650677, -0.1038023, 2.299265, 0.627451, 0, 1, 1,
0.7764167, -1.56775, 2.732531, 0.6313726, 0, 1, 1,
0.7778832, 0.3859531, 0.1193469, 0.6392157, 0, 1, 1,
0.7783782, 1.473887, 2.161327, 0.6431373, 0, 1, 1,
0.7788048, -0.9434462, 1.303634, 0.6509804, 0, 1, 1,
0.7799781, -0.147802, 2.301361, 0.654902, 0, 1, 1,
0.7854872, -1.001126, 1.772591, 0.6627451, 0, 1, 1,
0.7874073, -0.715803, 2.265816, 0.6666667, 0, 1, 1,
0.7908804, 0.06894282, 2.456604, 0.6745098, 0, 1, 1,
0.7917254, -0.5959053, 3.721691, 0.6784314, 0, 1, 1,
0.7971141, -2.491977, 2.336233, 0.6862745, 0, 1, 1,
0.8001145, 0.3271594, 1.749418, 0.6901961, 0, 1, 1,
0.8004717, -0.9353521, 1.89167, 0.6980392, 0, 1, 1,
0.8021337, 0.1220141, 1.61067, 0.7058824, 0, 1, 1,
0.8028305, -1.279979, 3.81368, 0.7098039, 0, 1, 1,
0.8106201, -1.659893, 2.603398, 0.7176471, 0, 1, 1,
0.8109507, 0.716806, 1.921286, 0.7215686, 0, 1, 1,
0.8127177, -0.2986464, 0.01854523, 0.7294118, 0, 1, 1,
0.819057, 0.4757577, -0.6978934, 0.7333333, 0, 1, 1,
0.82083, -1.632207, 0.6423214, 0.7411765, 0, 1, 1,
0.8310957, -0.4451255, 0.7379403, 0.7450981, 0, 1, 1,
0.8404996, -2.066452, 2.076036, 0.7529412, 0, 1, 1,
0.8484282, -0.6160066, 2.717124, 0.7568628, 0, 1, 1,
0.8504772, -0.1212679, -0.6836645, 0.7647059, 0, 1, 1,
0.8509671, -1.288601, 2.194186, 0.7686275, 0, 1, 1,
0.8516784, 0.4046709, 0.5111688, 0.7764706, 0, 1, 1,
0.8526903, 0.08761761, 1.702006, 0.7803922, 0, 1, 1,
0.8534811, -0.4679638, 0.1807711, 0.7882353, 0, 1, 1,
0.8576434, 1.754101, 1.358445, 0.7921569, 0, 1, 1,
0.8644722, -0.3528262, 0.2560493, 0.8, 0, 1, 1,
0.8651657, 0.6148753, 1.987619, 0.8078431, 0, 1, 1,
0.8659133, 0.07675904, 3.358404, 0.8117647, 0, 1, 1,
0.8676163, -2.55217, 2.020045, 0.8196079, 0, 1, 1,
0.8710343, 0.1956396, 2.307574, 0.8235294, 0, 1, 1,
0.8722194, -1.638872, 3.267168, 0.8313726, 0, 1, 1,
0.8727537, 0.210534, 0.5555027, 0.8352941, 0, 1, 1,
0.8747639, 1.52194, -0.9046574, 0.8431373, 0, 1, 1,
0.8752416, 0.3312159, 2.157896, 0.8470588, 0, 1, 1,
0.8777086, -0.1327339, -0.1160275, 0.854902, 0, 1, 1,
0.8821599, -0.4801737, 1.123831, 0.8588235, 0, 1, 1,
0.8920515, 0.3573662, 2.519501, 0.8666667, 0, 1, 1,
0.8996712, -0.3214909, 1.30234, 0.8705882, 0, 1, 1,
0.916649, -0.1416595, 3.992975, 0.8784314, 0, 1, 1,
0.9198334, -0.4011637, 2.081642, 0.8823529, 0, 1, 1,
0.9203398, 0.3413911, 1.628439, 0.8901961, 0, 1, 1,
0.9203804, -0.1701217, 1.79711, 0.8941177, 0, 1, 1,
0.920702, 0.6343754, 1.023484, 0.9019608, 0, 1, 1,
0.9293157, -1.319626, 2.003623, 0.9098039, 0, 1, 1,
0.9332582, -3.355824, 1.895711, 0.9137255, 0, 1, 1,
0.9395618, -0.4500573, 0.7630932, 0.9215686, 0, 1, 1,
0.9412189, -1.885314, 3.659912, 0.9254902, 0, 1, 1,
0.9470308, 1.731849, 0.5574061, 0.9333333, 0, 1, 1,
0.950555, -0.08957168, 0.00677959, 0.9372549, 0, 1, 1,
0.9521189, 1.525378, 1.42457, 0.945098, 0, 1, 1,
0.9584399, 0.2016819, 0.9333481, 0.9490196, 0, 1, 1,
0.9637967, -0.2456711, 2.454496, 0.9568627, 0, 1, 1,
0.9641052, 0.06208267, 2.641541, 0.9607843, 0, 1, 1,
0.9641326, -0.4208024, 1.797928, 0.9686275, 0, 1, 1,
0.965921, 0.7110251, -0.04238417, 0.972549, 0, 1, 1,
0.9706541, -0.3541652, 1.906407, 0.9803922, 0, 1, 1,
0.9716552, -1.034308, 1.990192, 0.9843137, 0, 1, 1,
0.9753265, 1.308389, 1.517851, 0.9921569, 0, 1, 1,
0.9885038, 1.217299, 1.303742, 0.9960784, 0, 1, 1,
0.9885738, 0.5287395, 0.7149009, 1, 0, 0.9960784, 1,
0.9966209, -0.7919648, 2.567243, 1, 0, 0.9882353, 1,
0.9984795, -0.148578, 1.716386, 1, 0, 0.9843137, 1,
1.003338, 0.2380092, 1.484692, 1, 0, 0.9764706, 1,
1.009209, -0.4326442, 4.389356, 1, 0, 0.972549, 1,
1.010854, 0.8162821, 0.8232095, 1, 0, 0.9647059, 1,
1.016965, 0.6264849, 1.066275, 1, 0, 0.9607843, 1,
1.019193, 0.1583198, 0.4882149, 1, 0, 0.9529412, 1,
1.021682, -1.078432, 2.505148, 1, 0, 0.9490196, 1,
1.040727, 1.056639, 0.5685925, 1, 0, 0.9411765, 1,
1.040803, 0.1062955, 0.5130701, 1, 0, 0.9372549, 1,
1.047191, -0.2505593, 3.085158, 1, 0, 0.9294118, 1,
1.06336, -0.9913948, 2.239492, 1, 0, 0.9254902, 1,
1.063448, 1.782894, 1.303706, 1, 0, 0.9176471, 1,
1.067749, -1.214347, 0.9296126, 1, 0, 0.9137255, 1,
1.068631, -0.2177581, 1.92487, 1, 0, 0.9058824, 1,
1.069562, 1.43952, 0.6200901, 1, 0, 0.9019608, 1,
1.073434, -0.05446988, 0.8528673, 1, 0, 0.8941177, 1,
1.074993, -0.7715027, -0.2342687, 1, 0, 0.8862745, 1,
1.080821, -0.004068339, 2.485046, 1, 0, 0.8823529, 1,
1.08612, 0.3089009, 1.677354, 1, 0, 0.8745098, 1,
1.091653, -1.284988, 1.482938, 1, 0, 0.8705882, 1,
1.097061, 0.6513405, 0.5057337, 1, 0, 0.8627451, 1,
1.104305, -0.3497875, 2.404881, 1, 0, 0.8588235, 1,
1.105652, 0.6353323, 1.787451, 1, 0, 0.8509804, 1,
1.111747, -0.4873358, 3.403769, 1, 0, 0.8470588, 1,
1.117269, -0.05961467, 0.1405254, 1, 0, 0.8392157, 1,
1.119631, -0.7873631, 1.368325, 1, 0, 0.8352941, 1,
1.135674, 0.386115, 1.806228, 1, 0, 0.827451, 1,
1.139916, 0.9047829, 0.8714085, 1, 0, 0.8235294, 1,
1.142502, -1.38389, 3.40398, 1, 0, 0.8156863, 1,
1.147828, -1.299749, 3.615244, 1, 0, 0.8117647, 1,
1.151514, 1.009073, 2.078192, 1, 0, 0.8039216, 1,
1.152312, 0.109188, 2.250163, 1, 0, 0.7960784, 1,
1.152905, 0.6456945, -0.1130266, 1, 0, 0.7921569, 1,
1.156711, -1.464763, 3.447755, 1, 0, 0.7843137, 1,
1.161538, 0.3241988, 0.7342445, 1, 0, 0.7803922, 1,
1.16794, -1.683178, 2.840801, 1, 0, 0.772549, 1,
1.18253, -1.052853, 2.409442, 1, 0, 0.7686275, 1,
1.183929, 0.3286834, 1.412422, 1, 0, 0.7607843, 1,
1.186271, 0.550963, 0.4734769, 1, 0, 0.7568628, 1,
1.189852, -0.04372723, 0.9790219, 1, 0, 0.7490196, 1,
1.194686, -0.3629267, 1.361608, 1, 0, 0.7450981, 1,
1.21061, 1.226048, -0.1324696, 1, 0, 0.7372549, 1,
1.223852, -1.120411, 0.8243036, 1, 0, 0.7333333, 1,
1.231411, -0.6257748, 2.865155, 1, 0, 0.7254902, 1,
1.233606, -0.5611836, 1.718671, 1, 0, 0.7215686, 1,
1.238786, -0.009512424, 1.608326, 1, 0, 0.7137255, 1,
1.245669, -1.373764, 1.748223, 1, 0, 0.7098039, 1,
1.253679, -0.5178994, 0.3143374, 1, 0, 0.7019608, 1,
1.259571, 0.2706603, 2.259823, 1, 0, 0.6941177, 1,
1.272549, 0.4638276, 1.075796, 1, 0, 0.6901961, 1,
1.288446, 0.3054242, 1.012677, 1, 0, 0.682353, 1,
1.289448, -0.5598955, 3.409966, 1, 0, 0.6784314, 1,
1.301936, -1.748905, 3.292351, 1, 0, 0.6705883, 1,
1.306349, 1.8115, -0.4320602, 1, 0, 0.6666667, 1,
1.311405, -0.6467106, 2.816842, 1, 0, 0.6588235, 1,
1.317638, 1.067436, 2.38399, 1, 0, 0.654902, 1,
1.318371, 0.4336744, 1.473176, 1, 0, 0.6470588, 1,
1.319347, 0.134831, 1.205106, 1, 0, 0.6431373, 1,
1.325644, -0.1262754, 1.394677, 1, 0, 0.6352941, 1,
1.331953, -0.5054166, 1.349172, 1, 0, 0.6313726, 1,
1.338636, 1.278567, -1.66315, 1, 0, 0.6235294, 1,
1.339284, 0.185315, 1.63073, 1, 0, 0.6196079, 1,
1.342478, -0.1908844, 1.627476, 1, 0, 0.6117647, 1,
1.348053, 0.8473932, 1.526266, 1, 0, 0.6078432, 1,
1.350879, 2.029381, 0.1096982, 1, 0, 0.6, 1,
1.352254, 0.4473446, 1.368804, 1, 0, 0.5921569, 1,
1.352792, 1.971223, 1.539235, 1, 0, 0.5882353, 1,
1.379973, 1.273555, 0.04650776, 1, 0, 0.5803922, 1,
1.380569, -0.4861943, 1.499468, 1, 0, 0.5764706, 1,
1.383723, 0.2372936, 1.136259, 1, 0, 0.5686275, 1,
1.383858, 0.4947835, 2.919241, 1, 0, 0.5647059, 1,
1.391609, 0.502764, 1.842462, 1, 0, 0.5568628, 1,
1.406494, 1.438099, 1.697767, 1, 0, 0.5529412, 1,
1.411795, 0.9284586, 1.741917, 1, 0, 0.5450981, 1,
1.412158, -0.2652179, 2.112455, 1, 0, 0.5411765, 1,
1.417693, -0.5244, 3.584439, 1, 0, 0.5333334, 1,
1.427634, -0.1107516, 1.744892, 1, 0, 0.5294118, 1,
1.429666, 0.6577364, 1.092091, 1, 0, 0.5215687, 1,
1.431395, 1.185392, 0.08855099, 1, 0, 0.5176471, 1,
1.44685, 0.3793251, 1.240565, 1, 0, 0.509804, 1,
1.490866, -0.1225846, 1.095501, 1, 0, 0.5058824, 1,
1.491426, -0.3427321, 1.116686, 1, 0, 0.4980392, 1,
1.498233, -1.549168, 1.566783, 1, 0, 0.4901961, 1,
1.499413, 0.498315, 2.489547, 1, 0, 0.4862745, 1,
1.51978, -1.104694, 1.764916, 1, 0, 0.4784314, 1,
1.526945, 1.783003, 2.667913, 1, 0, 0.4745098, 1,
1.530887, 2.153584, 2.141219, 1, 0, 0.4666667, 1,
1.56363, -1.094579, 2.089255, 1, 0, 0.4627451, 1,
1.565831, -0.8413355, 3.234724, 1, 0, 0.454902, 1,
1.574992, -0.4608265, 1.796739, 1, 0, 0.4509804, 1,
1.579064, 0.7572036, 2.096552, 1, 0, 0.4431373, 1,
1.596267, 0.5896407, 1.918615, 1, 0, 0.4392157, 1,
1.617311, 1.393685, 1.66274, 1, 0, 0.4313726, 1,
1.64097, 0.257736, 0.5949365, 1, 0, 0.427451, 1,
1.646957, -1.250841, 3.292139, 1, 0, 0.4196078, 1,
1.652385, 0.1436677, 1.534025, 1, 0, 0.4156863, 1,
1.658706, 1.035051, 0.82239, 1, 0, 0.4078431, 1,
1.662233, 1.254731, 0.9091087, 1, 0, 0.4039216, 1,
1.662599, 1.179334, 1.683002, 1, 0, 0.3960784, 1,
1.668424, -0.9599397, 2.174071, 1, 0, 0.3882353, 1,
1.669336, -0.05590075, 1.98545, 1, 0, 0.3843137, 1,
1.680807, 0.1664989, -0.7090401, 1, 0, 0.3764706, 1,
1.690831, -0.6033817, 1.136949, 1, 0, 0.372549, 1,
1.691661, 1.869833, 0.2362747, 1, 0, 0.3647059, 1,
1.693197, -0.879539, 2.924167, 1, 0, 0.3607843, 1,
1.696125, 1.168599, -0.2826701, 1, 0, 0.3529412, 1,
1.697294, -1.820249, 2.553255, 1, 0, 0.3490196, 1,
1.698504, -1.602762, 0.798866, 1, 0, 0.3411765, 1,
1.700565, -0.1884902, 2.526986, 1, 0, 0.3372549, 1,
1.704215, 1.689455, 0.6356189, 1, 0, 0.3294118, 1,
1.705934, 0.9448593, 1.031192, 1, 0, 0.3254902, 1,
1.706138, 0.1650347, 0.7411621, 1, 0, 0.3176471, 1,
1.724706, 0.2389189, 1.888273, 1, 0, 0.3137255, 1,
1.731197, -2.620223, 0.5555546, 1, 0, 0.3058824, 1,
1.748097, 0.9436975, 1.099599, 1, 0, 0.2980392, 1,
1.761566, 1.666695, 1.195471, 1, 0, 0.2941177, 1,
1.769263, 1.356645, 0.432272, 1, 0, 0.2862745, 1,
1.781199, 0.3335474, 0.4877508, 1, 0, 0.282353, 1,
1.782284, 1.178585, 1.04999, 1, 0, 0.2745098, 1,
1.804774, 0.2627534, 0.3464882, 1, 0, 0.2705882, 1,
1.824307, -0.288631, 3.405644, 1, 0, 0.2627451, 1,
1.825398, 0.2065589, 1.082793, 1, 0, 0.2588235, 1,
1.835326, -2.399905, 2.422248, 1, 0, 0.2509804, 1,
1.836564, 2.166975, -0.8257202, 1, 0, 0.2470588, 1,
1.836792, 0.1698624, 1.539972, 1, 0, 0.2392157, 1,
1.839608, 1.348618, 0.3608003, 1, 0, 0.2352941, 1,
1.853146, -1.223505, 2.23519, 1, 0, 0.227451, 1,
1.855229, -1.748475, 3.064156, 1, 0, 0.2235294, 1,
1.862668, -0.1953826, 3.267816, 1, 0, 0.2156863, 1,
1.873193, -2.031131, 2.938395, 1, 0, 0.2117647, 1,
1.87859, -2.172683, 2.000987, 1, 0, 0.2039216, 1,
1.883104, 0.9044881, 2.480912, 1, 0, 0.1960784, 1,
1.884291, 0.5718129, 0.6964284, 1, 0, 0.1921569, 1,
1.900417, 0.3949873, 1.645838, 1, 0, 0.1843137, 1,
1.939245, 0.1180341, -0.7604811, 1, 0, 0.1803922, 1,
1.94151, 0.7076231, -0.4006419, 1, 0, 0.172549, 1,
1.943815, 1.350011, 1.290116, 1, 0, 0.1686275, 1,
1.972374, -1.061057, 3.812686, 1, 0, 0.1607843, 1,
1.980259, -0.1973327, 1.049989, 1, 0, 0.1568628, 1,
2.00356, -1.714219, 1.262495, 1, 0, 0.1490196, 1,
2.031381, -1.31549, 2.395453, 1, 0, 0.145098, 1,
2.051166, -0.6363919, 4.533184, 1, 0, 0.1372549, 1,
2.061095, 0.4321274, 2.474772, 1, 0, 0.1333333, 1,
2.069652, 0.9926076, 0.5636118, 1, 0, 0.1254902, 1,
2.079449, 1.332607, 1.577758, 1, 0, 0.1215686, 1,
2.100724, 0.7883594, 2.230891, 1, 0, 0.1137255, 1,
2.102971, -1.370981, 1.992648, 1, 0, 0.1098039, 1,
2.110337, 2.068601, -0.6158429, 1, 0, 0.1019608, 1,
2.145513, -1.637052, 1.361193, 1, 0, 0.09411765, 1,
2.155862, -0.02197763, 0.5133963, 1, 0, 0.09019608, 1,
2.161132, -0.3195992, 1.831886, 1, 0, 0.08235294, 1,
2.168845, 0.7798674, 0.4294619, 1, 0, 0.07843138, 1,
2.175081, 0.02188832, 1.078848, 1, 0, 0.07058824, 1,
2.197204, 1.22897, 2.546312, 1, 0, 0.06666667, 1,
2.229044, -0.6308988, -0.07221866, 1, 0, 0.05882353, 1,
2.451701, -0.4563336, 3.431671, 1, 0, 0.05490196, 1,
2.458896, -0.8913448, 1.930885, 1, 0, 0.04705882, 1,
2.467483, 1.323106, 1.976063, 1, 0, 0.04313726, 1,
2.497969, -0.521705, 0.1246629, 1, 0, 0.03529412, 1,
2.635975, -0.3967064, 3.444561, 1, 0, 0.03137255, 1,
2.851526, 0.006542613, 0.6230806, 1, 0, 0.02352941, 1,
2.923561, 0.4732904, -0.5773291, 1, 0, 0.01960784, 1,
3.018932, 0.07482294, 0.4897928, 1, 0, 0.01176471, 1,
3.04301, 0.81095, 1.966248, 1, 0, 0.007843138, 1
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
0.03474915, -4.694232, -6.815728, 0, -0.5, 0.5, 0.5,
0.03474915, -4.694232, -6.815728, 1, -0.5, 0.5, 0.5,
0.03474915, -4.694232, -6.815728, 1, 1.5, 0.5, 0.5,
0.03474915, -4.694232, -6.815728, 0, 1.5, 0.5, 0.5
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
-3.993311, -0.0190649, -6.815728, 0, -0.5, 0.5, 0.5,
-3.993311, -0.0190649, -6.815728, 1, -0.5, 0.5, 0.5,
-3.993311, -0.0190649, -6.815728, 1, 1.5, 0.5, 0.5,
-3.993311, -0.0190649, -6.815728, 0, 1.5, 0.5, 0.5
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
-3.993311, -4.694232, 0.1938343, 0, -0.5, 0.5, 0.5,
-3.993311, -4.694232, 0.1938343, 1, -0.5, 0.5, 0.5,
-3.993311, -4.694232, 0.1938343, 1, 1.5, 0.5, 0.5,
-3.993311, -4.694232, 0.1938343, 0, 1.5, 0.5, 0.5
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
-2, -3.615347, -5.198137,
3, -3.615347, -5.198137,
-2, -3.615347, -5.198137,
-2, -3.795161, -5.467735,
-1, -3.615347, -5.198137,
-1, -3.795161, -5.467735,
0, -3.615347, -5.198137,
0, -3.795161, -5.467735,
1, -3.615347, -5.198137,
1, -3.795161, -5.467735,
2, -3.615347, -5.198137,
2, -3.795161, -5.467735,
3, -3.615347, -5.198137,
3, -3.795161, -5.467735
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
-2, -4.154789, -6.006932, 0, -0.5, 0.5, 0.5,
-2, -4.154789, -6.006932, 1, -0.5, 0.5, 0.5,
-2, -4.154789, -6.006932, 1, 1.5, 0.5, 0.5,
-2, -4.154789, -6.006932, 0, 1.5, 0.5, 0.5,
-1, -4.154789, -6.006932, 0, -0.5, 0.5, 0.5,
-1, -4.154789, -6.006932, 1, -0.5, 0.5, 0.5,
-1, -4.154789, -6.006932, 1, 1.5, 0.5, 0.5,
-1, -4.154789, -6.006932, 0, 1.5, 0.5, 0.5,
0, -4.154789, -6.006932, 0, -0.5, 0.5, 0.5,
0, -4.154789, -6.006932, 1, -0.5, 0.5, 0.5,
0, -4.154789, -6.006932, 1, 1.5, 0.5, 0.5,
0, -4.154789, -6.006932, 0, 1.5, 0.5, 0.5,
1, -4.154789, -6.006932, 0, -0.5, 0.5, 0.5,
1, -4.154789, -6.006932, 1, -0.5, 0.5, 0.5,
1, -4.154789, -6.006932, 1, 1.5, 0.5, 0.5,
1, -4.154789, -6.006932, 0, 1.5, 0.5, 0.5,
2, -4.154789, -6.006932, 0, -0.5, 0.5, 0.5,
2, -4.154789, -6.006932, 1, -0.5, 0.5, 0.5,
2, -4.154789, -6.006932, 1, 1.5, 0.5, 0.5,
2, -4.154789, -6.006932, 0, 1.5, 0.5, 0.5,
3, -4.154789, -6.006932, 0, -0.5, 0.5, 0.5,
3, -4.154789, -6.006932, 1, -0.5, 0.5, 0.5,
3, -4.154789, -6.006932, 1, 1.5, 0.5, 0.5,
3, -4.154789, -6.006932, 0, 1.5, 0.5, 0.5
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
-3.063759, -3, -5.198137,
-3.063759, 3, -5.198137,
-3.063759, -3, -5.198137,
-3.218684, -3, -5.467735,
-3.063759, -2, -5.198137,
-3.218684, -2, -5.467735,
-3.063759, -1, -5.198137,
-3.218684, -1, -5.467735,
-3.063759, 0, -5.198137,
-3.218684, 0, -5.467735,
-3.063759, 1, -5.198137,
-3.218684, 1, -5.467735,
-3.063759, 2, -5.198137,
-3.218684, 2, -5.467735,
-3.063759, 3, -5.198137,
-3.218684, 3, -5.467735
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
-3.528535, -3, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, -3, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, -3, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, -3, -6.006932, 0, 1.5, 0.5, 0.5,
-3.528535, -2, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, -2, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, -2, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, -2, -6.006932, 0, 1.5, 0.5, 0.5,
-3.528535, -1, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, -1, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, -1, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, -1, -6.006932, 0, 1.5, 0.5, 0.5,
-3.528535, 0, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, 0, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, 0, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, 0, -6.006932, 0, 1.5, 0.5, 0.5,
-3.528535, 1, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, 1, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, 1, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, 1, -6.006932, 0, 1.5, 0.5, 0.5,
-3.528535, 2, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, 2, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, 2, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, 2, -6.006932, 0, 1.5, 0.5, 0.5,
-3.528535, 3, -6.006932, 0, -0.5, 0.5, 0.5,
-3.528535, 3, -6.006932, 1, -0.5, 0.5, 0.5,
-3.528535, 3, -6.006932, 1, 1.5, 0.5, 0.5,
-3.528535, 3, -6.006932, 0, 1.5, 0.5, 0.5
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
-3.063759, -3.615347, -4,
-3.063759, -3.615347, 4,
-3.063759, -3.615347, -4,
-3.218684, -3.795161, -4,
-3.063759, -3.615347, -2,
-3.218684, -3.795161, -2,
-3.063759, -3.615347, 0,
-3.218684, -3.795161, 0,
-3.063759, -3.615347, 2,
-3.218684, -3.795161, 2,
-3.063759, -3.615347, 4,
-3.218684, -3.795161, 4
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
-3.528535, -4.154789, -4, 0, -0.5, 0.5, 0.5,
-3.528535, -4.154789, -4, 1, -0.5, 0.5, 0.5,
-3.528535, -4.154789, -4, 1, 1.5, 0.5, 0.5,
-3.528535, -4.154789, -4, 0, 1.5, 0.5, 0.5,
-3.528535, -4.154789, -2, 0, -0.5, 0.5, 0.5,
-3.528535, -4.154789, -2, 1, -0.5, 0.5, 0.5,
-3.528535, -4.154789, -2, 1, 1.5, 0.5, 0.5,
-3.528535, -4.154789, -2, 0, 1.5, 0.5, 0.5,
-3.528535, -4.154789, 0, 0, -0.5, 0.5, 0.5,
-3.528535, -4.154789, 0, 1, -0.5, 0.5, 0.5,
-3.528535, -4.154789, 0, 1, 1.5, 0.5, 0.5,
-3.528535, -4.154789, 0, 0, 1.5, 0.5, 0.5,
-3.528535, -4.154789, 2, 0, -0.5, 0.5, 0.5,
-3.528535, -4.154789, 2, 1, -0.5, 0.5, 0.5,
-3.528535, -4.154789, 2, 1, 1.5, 0.5, 0.5,
-3.528535, -4.154789, 2, 0, 1.5, 0.5, 0.5,
-3.528535, -4.154789, 4, 0, -0.5, 0.5, 0.5,
-3.528535, -4.154789, 4, 1, -0.5, 0.5, 0.5,
-3.528535, -4.154789, 4, 1, 1.5, 0.5, 0.5,
-3.528535, -4.154789, 4, 0, 1.5, 0.5, 0.5
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
-3.063759, -3.615347, -5.198137,
-3.063759, 3.577217, -5.198137,
-3.063759, -3.615347, 5.585805,
-3.063759, 3.577217, 5.585805,
-3.063759, -3.615347, -5.198137,
-3.063759, -3.615347, 5.585805,
-3.063759, 3.577217, -5.198137,
-3.063759, 3.577217, 5.585805,
-3.063759, -3.615347, -5.198137,
3.133257, -3.615347, -5.198137,
-3.063759, -3.615347, 5.585805,
3.133257, -3.615347, 5.585805,
-3.063759, 3.577217, -5.198137,
3.133257, 3.577217, -5.198137,
-3.063759, 3.577217, 5.585805,
3.133257, 3.577217, 5.585805,
3.133257, -3.615347, -5.198137,
3.133257, 3.577217, -5.198137,
3.133257, -3.615347, 5.585805,
3.133257, 3.577217, 5.585805,
3.133257, -3.615347, -5.198137,
3.133257, -3.615347, 5.585805,
3.133257, 3.577217, -5.198137,
3.133257, 3.577217, 5.585805
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
var radius = 7.672047;
var distance = 34.1338;
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
mvMatrix.translate( -0.03474915, 0.0190649, -0.1938343 );
mvMatrix.scale( 1.338574, 1.153298, 0.7692147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.1338);
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
cyano-pyrazole<-read.table("cyano-pyrazole.xyz")
```

```
## Error in read.table("cyano-pyrazole.xyz"): no lines available in input
```

```r
x<-cyano-pyrazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
```

```r
y<-cyano-pyrazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
```

```r
z<-cyano-pyrazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyano' not found
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
-2.973511, -1.89365, -2.139107, 0, 0, 1, 1, 1,
-2.875813, 0.6374603, -0.3628246, 1, 0, 0, 1, 1,
-2.855638, -0.2127346, -2.355582, 1, 0, 0, 1, 1,
-2.817228, 0.3357067, -1.27337, 1, 0, 0, 1, 1,
-2.76954, 0.763335, -2.880346, 1, 0, 0, 1, 1,
-2.761352, 0.3310466, -1.150898, 1, 0, 0, 1, 1,
-2.577252, 0.3138008, -1.139891, 0, 0, 0, 1, 1,
-2.499325, 1.653811, -1.385594, 0, 0, 0, 1, 1,
-2.497538, 0.3595187, -1.661229, 0, 0, 0, 1, 1,
-2.432637, 0.2907977, -1.32607, 0, 0, 0, 1, 1,
-2.412261, 1.560904, -0.1314915, 0, 0, 0, 1, 1,
-2.393953, -0.1688964, -2.278936, 0, 0, 0, 1, 1,
-2.328037, 0.5553663, -1.402297, 0, 0, 0, 1, 1,
-2.29425, -0.05009476, -2.314949, 1, 1, 1, 1, 1,
-2.249385, -1.065115, -1.577269, 1, 1, 1, 1, 1,
-2.246562, -0.2246432, -0.7090831, 1, 1, 1, 1, 1,
-2.216132, -0.892864, -2.908795, 1, 1, 1, 1, 1,
-2.15182, 1.17306, -0.4726182, 1, 1, 1, 1, 1,
-2.147984, -0.5979131, -3.142299, 1, 1, 1, 1, 1,
-2.141878, 1.606332, -1.641933, 1, 1, 1, 1, 1,
-2.124518, 0.3007708, -1.325788, 1, 1, 1, 1, 1,
-2.100256, 0.3692868, -1.631161, 1, 1, 1, 1, 1,
-2.097152, 1.003135, -0.5298881, 1, 1, 1, 1, 1,
-2.043289, 1.226925, -1.658839, 1, 1, 1, 1, 1,
-2.001498, 0.2745529, -0.7716475, 1, 1, 1, 1, 1,
-1.990973, -0.3046266, -1.740036, 1, 1, 1, 1, 1,
-1.989461, 1.478488, -1.206866, 1, 1, 1, 1, 1,
-1.977508, 0.3005348, -1.672609, 1, 1, 1, 1, 1,
-1.971458, -0.6454043, -1.610885, 0, 0, 1, 1, 1,
-1.970487, -0.4124838, -0.4928981, 1, 0, 0, 1, 1,
-1.934003, 0.6378356, -1.217155, 1, 0, 0, 1, 1,
-1.92912, 1.233647, 0.7718459, 1, 0, 0, 1, 1,
-1.929009, -0.9166659, -0.9772492, 1, 0, 0, 1, 1,
-1.916952, 0.8989149, -1.119322, 1, 0, 0, 1, 1,
-1.892209, -0.2077984, -1.670468, 0, 0, 0, 1, 1,
-1.883362, 0.0780419, -1.754136, 0, 0, 0, 1, 1,
-1.864799, 1.331201, -1.138079, 0, 0, 0, 1, 1,
-1.816845, 0.2461161, -0.7190933, 0, 0, 0, 1, 1,
-1.806739, 0.3097288, -1.362685, 0, 0, 0, 1, 1,
-1.800264, 0.1760951, -1.354837, 0, 0, 0, 1, 1,
-1.799816, -0.2749564, -0.3679498, 0, 0, 0, 1, 1,
-1.792326, 1.059067, -2.238528, 1, 1, 1, 1, 1,
-1.789171, -1.229718, -1.49659, 1, 1, 1, 1, 1,
-1.780316, -0.9476275, -2.804857, 1, 1, 1, 1, 1,
-1.730866, -1.102576, -1.535478, 1, 1, 1, 1, 1,
-1.702771, 0.3698431, 0.3090091, 1, 1, 1, 1, 1,
-1.699376, 0.7861496, -1.676463, 1, 1, 1, 1, 1,
-1.698303, 3.18399, -1.799396, 1, 1, 1, 1, 1,
-1.694425, 0.5420384, -1.143437, 1, 1, 1, 1, 1,
-1.685353, 0.7394987, 0.4992509, 1, 1, 1, 1, 1,
-1.667813, -0.5614575, -2.190249, 1, 1, 1, 1, 1,
-1.665312, -1.864191, -1.727854, 1, 1, 1, 1, 1,
-1.649537, 0.3829398, -0.502372, 1, 1, 1, 1, 1,
-1.64219, 1.054929, -2.593987, 1, 1, 1, 1, 1,
-1.638571, 0.1999748, -1.061775, 1, 1, 1, 1, 1,
-1.60301, 1.540406, -0.2686966, 1, 1, 1, 1, 1,
-1.592041, 0.05560252, -2.259362, 0, 0, 1, 1, 1,
-1.583214, 1.606073, -2.264799, 1, 0, 0, 1, 1,
-1.58078, -0.6927324, -3.337373, 1, 0, 0, 1, 1,
-1.558074, -1.992311, -2.553131, 1, 0, 0, 1, 1,
-1.549065, 2.020505, 1.036494, 1, 0, 0, 1, 1,
-1.542318, -1.073217, -1.421014, 1, 0, 0, 1, 1,
-1.537667, -0.5051327, -1.32184, 0, 0, 0, 1, 1,
-1.533664, 1.001461, -2.057974, 0, 0, 0, 1, 1,
-1.52756, -0.3987345, -4.418813, 0, 0, 0, 1, 1,
-1.521566, 1.52023, -0.7699685, 0, 0, 0, 1, 1,
-1.52121, -0.4165337, -1.605001, 0, 0, 0, 1, 1,
-1.500412, -0.8498381, -1.308751, 0, 0, 0, 1, 1,
-1.474091, 1.005171, -1.053524, 0, 0, 0, 1, 1,
-1.466626, 0.4135358, -0.8239061, 1, 1, 1, 1, 1,
-1.465004, 2.10536, -0.8097197, 1, 1, 1, 1, 1,
-1.462188, -0.8074791, -0.9042916, 1, 1, 1, 1, 1,
-1.459752, 1.853898, -0.6995726, 1, 1, 1, 1, 1,
-1.427274, -0.2799807, -2.549323, 1, 1, 1, 1, 1,
-1.423975, -0.2589235, -0.6186543, 1, 1, 1, 1, 1,
-1.416139, 0.5506079, -0.1252227, 1, 1, 1, 1, 1,
-1.411271, 0.9153622, -0.8524786, 1, 1, 1, 1, 1,
-1.393248, -0.4049843, -1.325424, 1, 1, 1, 1, 1,
-1.390908, 0.97163, -2.247095, 1, 1, 1, 1, 1,
-1.389018, 1.143471, 0.1212519, 1, 1, 1, 1, 1,
-1.385475, -1.737587, -2.629556, 1, 1, 1, 1, 1,
-1.38151, -0.7049019, -1.278813, 1, 1, 1, 1, 1,
-1.375715, -1.116966, -2.528999, 1, 1, 1, 1, 1,
-1.370472, 0.5924233, 0.6358712, 1, 1, 1, 1, 1,
-1.3645, 1.305938, -0.8318909, 0, 0, 1, 1, 1,
-1.360381, 0.178426, -2.052166, 1, 0, 0, 1, 1,
-1.360267, 1.302159, -2.233078, 1, 0, 0, 1, 1,
-1.355577, 0.8717131, -0.408615, 1, 0, 0, 1, 1,
-1.355332, -0.1903859, -2.181871, 1, 0, 0, 1, 1,
-1.354797, -0.05835257, -1.891753, 1, 0, 0, 1, 1,
-1.339696, 2.857878, 0.6240326, 0, 0, 0, 1, 1,
-1.337281, 1.784404, -0.2915654, 0, 0, 0, 1, 1,
-1.336828, -0.4580456, -2.564516, 0, 0, 0, 1, 1,
-1.330487, -0.2212045, -2.939136, 0, 0, 0, 1, 1,
-1.323332, 0.1357409, -2.197501, 0, 0, 0, 1, 1,
-1.322659, 1.678846, -0.7383488, 0, 0, 0, 1, 1,
-1.306087, 0.7767666, -0.9648348, 0, 0, 0, 1, 1,
-1.305792, 0.08851157, -1.50226, 1, 1, 1, 1, 1,
-1.293906, -1.603589, -0.2482494, 1, 1, 1, 1, 1,
-1.285057, -1.855916, -3.042053, 1, 1, 1, 1, 1,
-1.284876, -0.04267242, -2.409069, 1, 1, 1, 1, 1,
-1.274662, 0.02471881, -0.2608819, 1, 1, 1, 1, 1,
-1.265098, 0.6245171, 1.211864, 1, 1, 1, 1, 1,
-1.260734, -0.3652789, -0.8208517, 1, 1, 1, 1, 1,
-1.259808, -0.9105884, -1.987291, 1, 1, 1, 1, 1,
-1.253263, 0.8133129, -0.7219602, 1, 1, 1, 1, 1,
-1.243846, -0.03908565, -1.88091, 1, 1, 1, 1, 1,
-1.242798, 0.6909643, -0.3504683, 1, 1, 1, 1, 1,
-1.235051, -0.455483, -2.175694, 1, 1, 1, 1, 1,
-1.231514, 0.1994012, -0.657684, 1, 1, 1, 1, 1,
-1.227061, -0.8736414, -1.690399, 1, 1, 1, 1, 1,
-1.226114, -1.157944, -4.29503, 1, 1, 1, 1, 1,
-1.209744, -0.3512906, -1.844355, 0, 0, 1, 1, 1,
-1.202371, -1.175045, -2.133808, 1, 0, 0, 1, 1,
-1.194351, 0.5074884, -1.40247, 1, 0, 0, 1, 1,
-1.192854, 0.3505334, -2.431801, 1, 0, 0, 1, 1,
-1.187169, 1.037501, -2.586406, 1, 0, 0, 1, 1,
-1.180269, -2.160133, -2.341093, 1, 0, 0, 1, 1,
-1.17942, -0.4088411, -1.359085, 0, 0, 0, 1, 1,
-1.177426, 0.8053669, -0.3597912, 0, 0, 0, 1, 1,
-1.176735, 1.224957, -0.004598088, 0, 0, 0, 1, 1,
-1.172352, 0.4715887, 0.0534639, 0, 0, 0, 1, 1,
-1.169471, -1.451561, -3.938216, 0, 0, 0, 1, 1,
-1.166578, 0.6994152, -1.491969, 0, 0, 0, 1, 1,
-1.16274, -0.5601487, -0.1323217, 0, 0, 0, 1, 1,
-1.162558, -0.3824449, -0.4914562, 1, 1, 1, 1, 1,
-1.15693, -0.8722541, -1.375415, 1, 1, 1, 1, 1,
-1.151223, 1.387383, -0.9969906, 1, 1, 1, 1, 1,
-1.142731, 0.9627537, -2.456301, 1, 1, 1, 1, 1,
-1.134848, 1.126014, -1.432318, 1, 1, 1, 1, 1,
-1.128703, 0.2633635, -2.150152, 1, 1, 1, 1, 1,
-1.122607, 1.119268, -2.839604, 1, 1, 1, 1, 1,
-1.122332, -0.9580603, -0.9338416, 1, 1, 1, 1, 1,
-1.110177, 0.09079528, -0.5290329, 1, 1, 1, 1, 1,
-1.107786, -0.5802448, -2.658576, 1, 1, 1, 1, 1,
-1.099367, 0.07767794, -1.413808, 1, 1, 1, 1, 1,
-1.086455, 0.1895006, 0.5619056, 1, 1, 1, 1, 1,
-1.081781, 1.186978, -0.5513784, 1, 1, 1, 1, 1,
-1.081559, 0.09116349, -1.574725, 1, 1, 1, 1, 1,
-1.07873, -0.2522933, -2.436392, 1, 1, 1, 1, 1,
-1.070669, 0.7578033, -0.4883719, 0, 0, 1, 1, 1,
-1.063743, 0.2713295, -0.7468209, 1, 0, 0, 1, 1,
-1.063491, 0.4755462, -0.471646, 1, 0, 0, 1, 1,
-1.061511, 1.087103, -0.0453878, 1, 0, 0, 1, 1,
-1.058785, -0.144283, -1.222934, 1, 0, 0, 1, 1,
-1.05389, -0.8222158, -1.50118, 1, 0, 0, 1, 1,
-1.052506, 1.049689, 0.1434907, 0, 0, 0, 1, 1,
-1.035126, -1.863191, -2.709708, 0, 0, 0, 1, 1,
-1.028262, 0.9124022, 0.6735546, 0, 0, 0, 1, 1,
-1.027928, 0.1978291, -1.021737, 0, 0, 0, 1, 1,
-1.019408, -1.110859, -2.608823, 0, 0, 0, 1, 1,
-1.017676, 0.001450434, -2.357732, 0, 0, 0, 1, 1,
-1.01162, 0.2772383, -2.320071, 0, 0, 0, 1, 1,
-1.008189, -1.548583, -3.403646, 1, 1, 1, 1, 1,
-1.007808, 0.8387446, -2.619183, 1, 1, 1, 1, 1,
-1.000684, 0.9743743, 0.1910625, 1, 1, 1, 1, 1,
-0.9994944, 0.3979683, -1.948871, 1, 1, 1, 1, 1,
-0.9987664, 2.126923, -0.7921615, 1, 1, 1, 1, 1,
-0.9918851, 0.06161757, -1.009832, 1, 1, 1, 1, 1,
-0.9847648, -0.0646299, -1.945924, 1, 1, 1, 1, 1,
-0.9832106, -0.5630146, -1.342873, 1, 1, 1, 1, 1,
-0.9798968, 0.2442377, -3.423472, 1, 1, 1, 1, 1,
-0.9759706, 0.4376376, -1.383925, 1, 1, 1, 1, 1,
-0.9591222, -0.01585649, -2.208353, 1, 1, 1, 1, 1,
-0.9554081, 1.248221, 1.045169, 1, 1, 1, 1, 1,
-0.9547582, -0.3090575, -1.307302, 1, 1, 1, 1, 1,
-0.9546394, -0.2101272, -2.252266, 1, 1, 1, 1, 1,
-0.9543263, 1.768962, -0.1694877, 1, 1, 1, 1, 1,
-0.9536562, 0.9455397, -1.143642, 0, 0, 1, 1, 1,
-0.9489926, 1.281555, -0.32975, 1, 0, 0, 1, 1,
-0.9471879, -1.798885, -1.968343, 1, 0, 0, 1, 1,
-0.9410437, -1.097039, -3.449575, 1, 0, 0, 1, 1,
-0.9404398, -0.5045716, -3.083086, 1, 0, 0, 1, 1,
-0.9293556, 0.06241567, -1.914348, 1, 0, 0, 1, 1,
-0.927837, -0.7490353, -3.738884, 0, 0, 0, 1, 1,
-0.9247292, -0.6804171, -3.026265, 0, 0, 0, 1, 1,
-0.9237765, 1.246004, 0.0104243, 0, 0, 0, 1, 1,
-0.9234998, 0.4842045, -1.764266, 0, 0, 0, 1, 1,
-0.9222353, -0.4026722, -1.7557, 0, 0, 0, 1, 1,
-0.9166237, -0.7963996, -1.007623, 0, 0, 0, 1, 1,
-0.9111826, -1.848016, -4.126585, 0, 0, 0, 1, 1,
-0.9104789, -0.9727881, -2.191654, 1, 1, 1, 1, 1,
-0.8952399, 0.7126943, 0.1719088, 1, 1, 1, 1, 1,
-0.8882603, 0.4422648, -1.469156, 1, 1, 1, 1, 1,
-0.8868946, -0.3771902, -2.169342, 1, 1, 1, 1, 1,
-0.8822402, 1.07759, 0.05997845, 1, 1, 1, 1, 1,
-0.8807915, 0.3760091, -1.952265, 1, 1, 1, 1, 1,
-0.8806252, -0.2691936, -0.9003584, 1, 1, 1, 1, 1,
-0.8706505, -0.7361866, -2.77246, 1, 1, 1, 1, 1,
-0.8670308, -0.423898, -2.91968, 1, 1, 1, 1, 1,
-0.8664702, -0.1725279, -3.195825, 1, 1, 1, 1, 1,
-0.8652683, 0.4832909, -0.1299818, 1, 1, 1, 1, 1,
-0.8625468, -0.3101545, -1.300108, 1, 1, 1, 1, 1,
-0.8625127, -1.790285, -3.137568, 1, 1, 1, 1, 1,
-0.8579518, 1.270407, 1.579772, 1, 1, 1, 1, 1,
-0.8577599, -0.9575101, -1.857374, 1, 1, 1, 1, 1,
-0.8563657, -0.2944382, -1.323921, 0, 0, 1, 1, 1,
-0.8549251, 0.8154879, -1.063371, 1, 0, 0, 1, 1,
-0.8504454, -2.09445, -2.69125, 1, 0, 0, 1, 1,
-0.8499291, 1.474455, 1.061847, 1, 0, 0, 1, 1,
-0.8452657, -0.5841659, -3.538183, 1, 0, 0, 1, 1,
-0.842886, -0.2411697, -1.745094, 1, 0, 0, 1, 1,
-0.8416792, -0.4541799, -0.7797304, 0, 0, 0, 1, 1,
-0.8377599, 1.1037, -0.8780774, 0, 0, 0, 1, 1,
-0.8270875, 1.593538, -0.7872631, 0, 0, 0, 1, 1,
-0.8244165, 0.3035066, -1.482509, 0, 0, 0, 1, 1,
-0.8239503, 1.548271, 0.235947, 0, 0, 0, 1, 1,
-0.8120125, -0.1075503, -2.904416, 0, 0, 0, 1, 1,
-0.8104693, -0.4649484, -1.584275, 0, 0, 0, 1, 1,
-0.8098769, 0.8408824, 0.01903076, 1, 1, 1, 1, 1,
-0.8090069, -1.337415, -3.927633, 1, 1, 1, 1, 1,
-0.8075382, 0.107086, -1.85042, 1, 1, 1, 1, 1,
-0.8060712, 0.1109056, -0.9352936, 1, 1, 1, 1, 1,
-0.801614, 0.7554778, -0.2681782, 1, 1, 1, 1, 1,
-0.7949595, 0.3299565, -0.5168822, 1, 1, 1, 1, 1,
-0.7914235, 1.168267, -1.193431, 1, 1, 1, 1, 1,
-0.7891025, 0.3272364, -0.3969397, 1, 1, 1, 1, 1,
-0.7859859, 0.06535498, -1.996145, 1, 1, 1, 1, 1,
-0.7859587, -1.029359, -2.843395, 1, 1, 1, 1, 1,
-0.7838244, -0.1682356, -1.120901, 1, 1, 1, 1, 1,
-0.7809933, -1.090115, -1.161439, 1, 1, 1, 1, 1,
-0.7807914, -0.4157097, -3.278456, 1, 1, 1, 1, 1,
-0.7756543, -0.815139, -2.918227, 1, 1, 1, 1, 1,
-0.7678732, -0.6443821, -3.839207, 1, 1, 1, 1, 1,
-0.7637253, 0.7731888, -3.256657, 0, 0, 1, 1, 1,
-0.7597368, -0.453605, -3.173097, 1, 0, 0, 1, 1,
-0.7564101, -1.132129, -1.721798, 1, 0, 0, 1, 1,
-0.7524686, 0.1210042, -2.32556, 1, 0, 0, 1, 1,
-0.7515772, 1.052612, -0.6789388, 1, 0, 0, 1, 1,
-0.7510254, -0.8226059, -3.996266, 1, 0, 0, 1, 1,
-0.7483042, -1.038403, -3.893252, 0, 0, 0, 1, 1,
-0.7465334, 0.6878057, -1.892117, 0, 0, 0, 1, 1,
-0.7408369, -0.8942512, -1.892915, 0, 0, 0, 1, 1,
-0.7378443, -0.7739425, -4.831402, 0, 0, 0, 1, 1,
-0.7333765, 1.793153, -0.659338, 0, 0, 0, 1, 1,
-0.7326874, 0.497727, -0.06330929, 0, 0, 0, 1, 1,
-0.7304776, 0.9114518, -1.159987, 0, 0, 0, 1, 1,
-0.722236, -0.6912457, -3.165327, 1, 1, 1, 1, 1,
-0.7082416, 0.2842982, -2.395843, 1, 1, 1, 1, 1,
-0.7065446, -1.617369, -4.00865, 1, 1, 1, 1, 1,
-0.7032211, 0.1510587, -2.074873, 1, 1, 1, 1, 1,
-0.6996705, -0.1366715, -2.928487, 1, 1, 1, 1, 1,
-0.6990622, 0.2203604, 0.04136186, 1, 1, 1, 1, 1,
-0.6977151, -0.7177751, -1.890207, 1, 1, 1, 1, 1,
-0.6965262, -0.1245974, -0.6067951, 1, 1, 1, 1, 1,
-0.6902282, -1.776109, -2.745488, 1, 1, 1, 1, 1,
-0.6804402, -0.4256009, -2.002012, 1, 1, 1, 1, 1,
-0.6766351, -0.2212734, -1.019592, 1, 1, 1, 1, 1,
-0.6759756, 0.02059469, -0.8333555, 1, 1, 1, 1, 1,
-0.672238, 0.4090725, -0.07489699, 1, 1, 1, 1, 1,
-0.6697112, -1.015481, -1.435128, 1, 1, 1, 1, 1,
-0.6684926, 0.6487521, 0.02966292, 1, 1, 1, 1, 1,
-0.6671962, -0.8811594, -0.8668911, 0, 0, 1, 1, 1,
-0.6640282, -0.5407436, -2.86776, 1, 0, 0, 1, 1,
-0.661974, -0.7784967, -3.281167, 1, 0, 0, 1, 1,
-0.6604146, 0.653867, -1.016687, 1, 0, 0, 1, 1,
-0.6573994, 1.229637, 1.154267, 1, 0, 0, 1, 1,
-0.6532803, 0.8655986, -0.2539974, 1, 0, 0, 1, 1,
-0.6526135, 0.07398627, -1.619409, 0, 0, 0, 1, 1,
-0.6483322, 0.7207993, -1.946695, 0, 0, 0, 1, 1,
-0.6444985, 1.196384, -0.6751142, 0, 0, 0, 1, 1,
-0.6418769, 0.431362, -1.012009, 0, 0, 0, 1, 1,
-0.640174, 0.3373044, -2.239163, 0, 0, 0, 1, 1,
-0.6375074, -0.5043727, -4.066313, 0, 0, 0, 1, 1,
-0.6364017, -0.8822977, 0.1833107, 0, 0, 0, 1, 1,
-0.6331061, 1.335198, 0.7267211, 1, 1, 1, 1, 1,
-0.6300169, 0.00923001, -1.620702, 1, 1, 1, 1, 1,
-0.6286163, -0.004099222, -1.509253, 1, 1, 1, 1, 1,
-0.6255866, 1.836466, 0.1040978, 1, 1, 1, 1, 1,
-0.6192604, 1.292909, 0.2163043, 1, 1, 1, 1, 1,
-0.6183355, 0.9557658, -1.405467, 1, 1, 1, 1, 1,
-0.6182869, -1.103381, -5.041089, 1, 1, 1, 1, 1,
-0.6134503, 0.5868054, -0.4107765, 1, 1, 1, 1, 1,
-0.6107013, 0.7451705, -0.9104794, 1, 1, 1, 1, 1,
-0.6061424, 0.3266944, -1.709598, 1, 1, 1, 1, 1,
-0.6055149, 0.6330469, 1.087527, 1, 1, 1, 1, 1,
-0.6041647, 0.5380524, 0.07790583, 1, 1, 1, 1, 1,
-0.602024, 1.435833, -0.538835, 1, 1, 1, 1, 1,
-0.600378, 0.9068555, -1.550163, 1, 1, 1, 1, 1,
-0.5989154, -1.112546, -2.672657, 1, 1, 1, 1, 1,
-0.5965106, 0.3640192, -2.584793, 0, 0, 1, 1, 1,
-0.5827587, 0.3414773, -1.404235, 1, 0, 0, 1, 1,
-0.5811461, -0.8636672, -1.465453, 1, 0, 0, 1, 1,
-0.5801743, 0.2275919, -2.302111, 1, 0, 0, 1, 1,
-0.5771014, 0.1935902, -2.245511, 1, 0, 0, 1, 1,
-0.5760143, -0.2719595, -0.3666935, 1, 0, 0, 1, 1,
-0.5717105, -1.335532, -1.557828, 0, 0, 0, 1, 1,
-0.571018, -1.168795, -4.168374, 0, 0, 0, 1, 1,
-0.5640496, 0.5357776, 1.388204, 0, 0, 0, 1, 1,
-0.5625151, 0.005151224, -1.927819, 0, 0, 0, 1, 1,
-0.5603145, 0.1949296, 0.7620622, 0, 0, 0, 1, 1,
-0.5576277, -0.2747359, -3.103191, 0, 0, 0, 1, 1,
-0.5529917, -0.2160956, -2.342825, 0, 0, 0, 1, 1,
-0.5433371, 1.256745, 0.2742574, 1, 1, 1, 1, 1,
-0.5430229, 1.046234, 0.5974407, 1, 1, 1, 1, 1,
-0.5403584, -0.6046645, -2.871368, 1, 1, 1, 1, 1,
-0.5335068, 0.9182205, 0.9535999, 1, 1, 1, 1, 1,
-0.5315066, 0.5099763, 0.02978584, 1, 1, 1, 1, 1,
-0.5223268, 0.09336638, -2.113659, 1, 1, 1, 1, 1,
-0.5123126, 0.1956004, -0.8719146, 1, 1, 1, 1, 1,
-0.5035704, 0.436082, -1.626217, 1, 1, 1, 1, 1,
-0.5030924, 0.4281216, -1.304849, 1, 1, 1, 1, 1,
-0.5001879, 0.802455, -0.9964332, 1, 1, 1, 1, 1,
-0.496831, 0.2339046, -1.608558, 1, 1, 1, 1, 1,
-0.4939907, 1.391704, -0.2744544, 1, 1, 1, 1, 1,
-0.4937718, 0.6200443, -2.035778, 1, 1, 1, 1, 1,
-0.4916626, -1.222682, -4.080986, 1, 1, 1, 1, 1,
-0.4907261, -0.2327585, -1.560502, 1, 1, 1, 1, 1,
-0.4890116, 0.2129453, -1.767884, 0, 0, 1, 1, 1,
-0.4886268, -0.3757026, -2.745124, 1, 0, 0, 1, 1,
-0.4884316, 1.632965, 0.2092477, 1, 0, 0, 1, 1,
-0.4863973, -1.196141, -3.9909, 1, 0, 0, 1, 1,
-0.4856402, 0.3586147, -2.086267, 1, 0, 0, 1, 1,
-0.4838863, -1.994878, -4.1984, 1, 0, 0, 1, 1,
-0.4810403, 1.299152, 0.7809719, 0, 0, 0, 1, 1,
-0.4771178, -1.559495, -3.004773, 0, 0, 0, 1, 1,
-0.4751252, 0.2217909, -1.080554, 0, 0, 0, 1, 1,
-0.4685477, 1.396727, 1.135007, 0, 0, 0, 1, 1,
-0.4657621, 1.863807, 0.8608693, 0, 0, 0, 1, 1,
-0.4640987, -2.19826, -2.894578, 0, 0, 0, 1, 1,
-0.4610581, 1.376466, -1.584943, 0, 0, 0, 1, 1,
-0.4602017, -0.8550307, -3.279961, 1, 1, 1, 1, 1,
-0.4575981, 0.1976042, 1.526366, 1, 1, 1, 1, 1,
-0.4517052, -0.1389054, -0.7380393, 1, 1, 1, 1, 1,
-0.4486693, -2.01768, -4.47383, 1, 1, 1, 1, 1,
-0.4459556, -0.1785024, -2.22967, 1, 1, 1, 1, 1,
-0.4457952, 0.0004227949, -1.836799, 1, 1, 1, 1, 1,
-0.4439006, 1.087129, 0.8180897, 1, 1, 1, 1, 1,
-0.4354937, 0.4612415, -0.6076857, 1, 1, 1, 1, 1,
-0.4335984, 0.936535, 0.6730252, 1, 1, 1, 1, 1,
-0.4269382, -0.1215939, -1.120062, 1, 1, 1, 1, 1,
-0.4253439, 0.6737411, 0.4223524, 1, 1, 1, 1, 1,
-0.4196132, 1.407678, 0.538609, 1, 1, 1, 1, 1,
-0.4070868, 0.8727935, -1.234968, 1, 1, 1, 1, 1,
-0.4018829, -0.8170531, -2.224162, 1, 1, 1, 1, 1,
-0.3985971, -1.173523, -2.871014, 1, 1, 1, 1, 1,
-0.3931341, 1.624132, 0.9931911, 0, 0, 1, 1, 1,
-0.3923387, 1.501123, 1.279991, 1, 0, 0, 1, 1,
-0.3904582, -2.139945, -2.758434, 1, 0, 0, 1, 1,
-0.389737, 0.1147631, -1.802745, 1, 0, 0, 1, 1,
-0.3876632, -0.6865844, -1.590137, 1, 0, 0, 1, 1,
-0.3869038, -1.117567, -2.031505, 1, 0, 0, 1, 1,
-0.385753, -0.6907012, -1.74341, 0, 0, 0, 1, 1,
-0.3841088, -1.863202, -2.289715, 0, 0, 0, 1, 1,
-0.3814065, 0.2201333, -0.3724555, 0, 0, 0, 1, 1,
-0.3804897, 2.138839, -0.8887427, 0, 0, 0, 1, 1,
-0.3783273, 0.4647314, -0.9717169, 0, 0, 0, 1, 1,
-0.3757625, -0.1249154, -0.8608555, 0, 0, 0, 1, 1,
-0.3747501, 0.4652461, -1.199337, 0, 0, 0, 1, 1,
-0.372258, -1.536078, -1.413373, 1, 1, 1, 1, 1,
-0.3712932, 0.4838521, -0.6636228, 1, 1, 1, 1, 1,
-0.3692737, 0.4230242, -0.3160084, 1, 1, 1, 1, 1,
-0.3662426, 0.03763989, -2.524197, 1, 1, 1, 1, 1,
-0.3637507, -1.339607, -3.28536, 1, 1, 1, 1, 1,
-0.3625556, -2.270326, -3.698945, 1, 1, 1, 1, 1,
-0.3604956, 0.4993134, 0.1923572, 1, 1, 1, 1, 1,
-0.3585722, 0.9321745, 1.204234, 1, 1, 1, 1, 1,
-0.3555549, 0.2237822, -0.8057671, 1, 1, 1, 1, 1,
-0.3554573, -0.5605857, -1.559032, 1, 1, 1, 1, 1,
-0.3501777, 0.7451446, -0.6514122, 1, 1, 1, 1, 1,
-0.3479901, -0.1760564, -1.814126, 1, 1, 1, 1, 1,
-0.3376557, -0.8854681, -4.258718, 1, 1, 1, 1, 1,
-0.333526, -0.05034094, -3.348524, 1, 1, 1, 1, 1,
-0.330178, 0.04978603, -2.505226, 1, 1, 1, 1, 1,
-0.3289763, -0.706725, -1.79012, 0, 0, 1, 1, 1,
-0.3273343, 0.7122926, -0.07027863, 1, 0, 0, 1, 1,
-0.3226604, -2.015944, -4.285576, 1, 0, 0, 1, 1,
-0.3217122, 1.613303, -0.9370528, 1, 0, 0, 1, 1,
-0.3173718, -1.710463, -4.341033, 1, 0, 0, 1, 1,
-0.3171062, -0.1806887, -0.7286231, 1, 0, 0, 1, 1,
-0.3117236, -2.122723, -2.207352, 0, 0, 0, 1, 1,
-0.3100775, -0.6548777, -3.354213, 0, 0, 0, 1, 1,
-0.309627, 1.289847, 0.9116348, 0, 0, 0, 1, 1,
-0.3082103, 0.3035592, -0.2195277, 0, 0, 0, 1, 1,
-0.3041589, 1.7188, -0.127402, 0, 0, 0, 1, 1,
-0.3030833, 1.093015, -0.3547047, 0, 0, 0, 1, 1,
-0.2934451, 0.04107323, -1.202799, 0, 0, 0, 1, 1,
-0.2910385, -0.04120759, -1.16961, 1, 1, 1, 1, 1,
-0.2886055, -0.2859385, -1.443741, 1, 1, 1, 1, 1,
-0.2873478, 0.05387045, -1.118476, 1, 1, 1, 1, 1,
-0.2864988, 1.404856, -1.349413, 1, 1, 1, 1, 1,
-0.2860004, -3.510601, -3.670708, 1, 1, 1, 1, 1,
-0.2835758, 0.399877, 1.424994, 1, 1, 1, 1, 1,
-0.2831242, 0.4698433, -0.1088347, 1, 1, 1, 1, 1,
-0.2800953, 0.6014372, 0.6881283, 1, 1, 1, 1, 1,
-0.2799001, -0.1244503, -1.963351, 1, 1, 1, 1, 1,
-0.2766958, -0.5057673, -1.005052, 1, 1, 1, 1, 1,
-0.2641303, 0.2386186, -0.3871478, 1, 1, 1, 1, 1,
-0.2524555, 0.4084213, 0.05200322, 1, 1, 1, 1, 1,
-0.250944, -0.3679438, -1.767118, 1, 1, 1, 1, 1,
-0.2492275, 0.2256974, -0.1558597, 1, 1, 1, 1, 1,
-0.2484342, 0.4364558, 0.6136221, 1, 1, 1, 1, 1,
-0.2399997, -1.557322, -3.900266, 0, 0, 1, 1, 1,
-0.2369632, -1.220835, -2.709315, 1, 0, 0, 1, 1,
-0.2368259, 1.477058, -0.7303309, 1, 0, 0, 1, 1,
-0.2368151, 0.8726457, 2.675201, 1, 0, 0, 1, 1,
-0.2311552, 0.848343, -1.010138, 1, 0, 0, 1, 1,
-0.2305791, 0.9676926, -0.09101754, 1, 0, 0, 1, 1,
-0.2276143, 0.4229553, 1.112076, 0, 0, 0, 1, 1,
-0.2234797, -0.2687447, -1.627154, 0, 0, 0, 1, 1,
-0.220789, 0.7022243, 0.3388853, 0, 0, 0, 1, 1,
-0.2184289, -1.205312, -3.490671, 0, 0, 0, 1, 1,
-0.2177716, 0.706712, 0.06673333, 0, 0, 0, 1, 1,
-0.2168511, 1.123937, -0.4972253, 0, 0, 0, 1, 1,
-0.2165207, 3.472471, 1.67391, 0, 0, 0, 1, 1,
-0.2149337, -0.7588899, -1.945187, 1, 1, 1, 1, 1,
-0.2118928, 1.84053, 1.272047, 1, 1, 1, 1, 1,
-0.2095233, 0.743171, 1.136655, 1, 1, 1, 1, 1,
-0.2087612, 1.236394, -0.9427866, 1, 1, 1, 1, 1,
-0.2084662, 0.3421314, 0.2242303, 1, 1, 1, 1, 1,
-0.207283, 0.8455574, -0.6113022, 1, 1, 1, 1, 1,
-0.2071303, 0.5901423, 0.1176985, 1, 1, 1, 1, 1,
-0.2033998, 0.486482, -2.297996, 1, 1, 1, 1, 1,
-0.2029546, -0.8821098, -3.54175, 1, 1, 1, 1, 1,
-0.2022435, -1.864429, -3.962702, 1, 1, 1, 1, 1,
-0.2013891, 2.721478, 1.107369, 1, 1, 1, 1, 1,
-0.2012759, -1.285974, -2.341957, 1, 1, 1, 1, 1,
-0.1989866, -0.6383226, -3.720667, 1, 1, 1, 1, 1,
-0.1973493, -1.009929, -2.329811, 1, 1, 1, 1, 1,
-0.1935956, 0.427863, -1.3551, 1, 1, 1, 1, 1,
-0.1917583, -0.7243384, -3.239224, 0, 0, 1, 1, 1,
-0.1905108, 1.865555, -0.04524362, 1, 0, 0, 1, 1,
-0.1883976, 1.618531, -0.646306, 1, 0, 0, 1, 1,
-0.1758525, 0.7293255, -0.01032957, 1, 0, 0, 1, 1,
-0.1724439, 0.9944214, 0.0848309, 1, 0, 0, 1, 1,
-0.1620259, -0.1252129, -2.156796, 1, 0, 0, 1, 1,
-0.161327, 0.6229333, -0.4759541, 0, 0, 0, 1, 1,
-0.1611124, 0.7585452, 1.438256, 0, 0, 0, 1, 1,
-0.1610231, 0.4931249, 1.22647, 0, 0, 0, 1, 1,
-0.1603612, -0.6920898, -3.023082, 0, 0, 0, 1, 1,
-0.1572197, -0.5614327, -3.449816, 0, 0, 0, 1, 1,
-0.1554185, -0.4778667, -2.438946, 0, 0, 0, 1, 1,
-0.1537323, 0.2140732, -0.9460656, 0, 0, 0, 1, 1,
-0.1514497, -2.012136, -2.71803, 1, 1, 1, 1, 1,
-0.1472111, 0.7030936, 2.915764, 1, 1, 1, 1, 1,
-0.1395953, -1.246394, -2.868932, 1, 1, 1, 1, 1,
-0.1389789, 2.536004, 0.04024578, 1, 1, 1, 1, 1,
-0.1362157, 0.6682894, -0.3341505, 1, 1, 1, 1, 1,
-0.1343852, 0.1893439, -1.290221, 1, 1, 1, 1, 1,
-0.1342175, 0.6655201, -0.980589, 1, 1, 1, 1, 1,
-0.1297702, -0.4048479, -2.997113, 1, 1, 1, 1, 1,
-0.1292197, -0.9192563, -0.5629568, 1, 1, 1, 1, 1,
-0.1291905, -0.8234313, -3.167023, 1, 1, 1, 1, 1,
-0.1277862, 1.370826, -0.3281222, 1, 1, 1, 1, 1,
-0.1214861, -0.8706528, -2.338219, 1, 1, 1, 1, 1,
-0.1188689, 0.2628255, 0.03572702, 1, 1, 1, 1, 1,
-0.1172995, 0.6188949, -1.552454, 1, 1, 1, 1, 1,
-0.1106744, 0.002592356, -1.187385, 1, 1, 1, 1, 1,
-0.106561, -0.2165056, -2.9445, 0, 0, 1, 1, 1,
-0.1061611, -1.044051, -3.313639, 1, 0, 0, 1, 1,
-0.1048617, 0.9057191, 0.4181179, 1, 0, 0, 1, 1,
-0.1047233, 0.3122114, -0.604494, 1, 0, 0, 1, 1,
-0.1024602, -0.2812816, -1.683639, 1, 0, 0, 1, 1,
-0.1023666, 0.148979, 2.023767, 1, 0, 0, 1, 1,
-0.1002979, 0.4959934, 0.5385278, 0, 0, 0, 1, 1,
-0.09680089, -0.04661443, -0.7908208, 0, 0, 0, 1, 1,
-0.09216685, -0.8384649, -3.149385, 0, 0, 0, 1, 1,
-0.0920737, -1.515471, -2.759434, 0, 0, 0, 1, 1,
-0.08931845, -1.149094, -3.970501, 0, 0, 0, 1, 1,
-0.08915012, -1.492799, -3.212102, 0, 0, 0, 1, 1,
-0.08489475, 0.8694279, 0.9463623, 0, 0, 0, 1, 1,
-0.08374982, -0.4065449, -3.097325, 1, 1, 1, 1, 1,
-0.08327304, -0.468796, -4.013562, 1, 1, 1, 1, 1,
-0.07768458, -0.2661995, -2.154438, 1, 1, 1, 1, 1,
-0.07757868, 0.3426901, -1.329065, 1, 1, 1, 1, 1,
-0.07630131, -0.3029091, -2.753408, 1, 1, 1, 1, 1,
-0.07055269, 0.003240989, -1.932044, 1, 1, 1, 1, 1,
-0.06948388, 0.1698966, 0.3977614, 1, 1, 1, 1, 1,
-0.06781825, 0.1815624, -1.563453, 1, 1, 1, 1, 1,
-0.06300997, -0.7342765, -2.253917, 1, 1, 1, 1, 1,
-0.05550063, 1.089443, -1.805517, 1, 1, 1, 1, 1,
-0.05466449, -0.5036641, -1.635034, 1, 1, 1, 1, 1,
-0.05384989, 0.3307082, 0.3117343, 1, 1, 1, 1, 1,
-0.04403355, -1.150266, -0.9121744, 1, 1, 1, 1, 1,
-0.04304225, -0.1228044, -1.667526, 1, 1, 1, 1, 1,
-0.04278489, -1.286317, -3.883286, 1, 1, 1, 1, 1,
-0.04171895, 1.050966, 0.4033251, 0, 0, 1, 1, 1,
-0.04042677, -2.254284, -4.822545, 1, 0, 0, 1, 1,
-0.03787009, -2.391519, -2.580317, 1, 0, 0, 1, 1,
-0.03666472, -0.3815153, -2.237593, 1, 0, 0, 1, 1,
-0.03627509, -0.3731068, -2.676597, 1, 0, 0, 1, 1,
-0.03366857, -0.6466508, -3.959305, 1, 0, 0, 1, 1,
-0.03294554, -0.6284408, -4.146977, 0, 0, 0, 1, 1,
-0.02802973, 0.1105558, 1.041278, 0, 0, 0, 1, 1,
-0.02232792, 0.266589, 0.3327608, 0, 0, 0, 1, 1,
-0.01975036, 0.8709313, -0.9743617, 0, 0, 0, 1, 1,
-0.0185984, 1.592433, -0.5154938, 0, 0, 0, 1, 1,
-0.0169699, 2.337871, -0.4142897, 0, 0, 0, 1, 1,
-0.01425698, 2.226742, 1.080656, 0, 0, 0, 1, 1,
-0.01083245, 0.1533261, -0.3997128, 1, 1, 1, 1, 1,
-0.007347495, -0.442507, -4.447095, 1, 1, 1, 1, 1,
-0.006053705, -0.2888521, -0.9400395, 1, 1, 1, 1, 1,
-0.004145147, 0.4689383, -0.251395, 1, 1, 1, 1, 1,
-0.001732827, 1.085775, -0.7894803, 1, 1, 1, 1, 1,
-6.362766e-05, 0.864879, -0.131599, 1, 1, 1, 1, 1,
0.001206404, 0.4413183, -1.79285, 1, 1, 1, 1, 1,
0.001228427, -0.5644328, 2.107756, 1, 1, 1, 1, 1,
0.002170768, -0.517405, 3.813671, 1, 1, 1, 1, 1,
0.006847707, 0.4146377, -0.8387071, 1, 1, 1, 1, 1,
0.00795295, 2.004991, -0.8394783, 1, 1, 1, 1, 1,
0.008268244, -0.5342396, 2.959148, 1, 1, 1, 1, 1,
0.008845836, 0.01246481, 1.686431, 1, 1, 1, 1, 1,
0.009132912, 1.132254, 0.05459504, 1, 1, 1, 1, 1,
0.01448494, -0.7749175, 4.089437, 1, 1, 1, 1, 1,
0.01724908, 0.03058399, 0.189228, 0, 0, 1, 1, 1,
0.02303085, -1.434107, 1.017204, 1, 0, 0, 1, 1,
0.02652268, 1.052992, 0.8677186, 1, 0, 0, 1, 1,
0.03013394, 1.716715, 0.4061107, 1, 0, 0, 1, 1,
0.03318302, -0.1882606, 3.639697, 1, 0, 0, 1, 1,
0.03433748, 0.5406963, 2.156667, 1, 0, 0, 1, 1,
0.03466352, -0.2474834, 2.330324, 0, 0, 0, 1, 1,
0.03589447, 0.2416113, -0.7388223, 0, 0, 0, 1, 1,
0.03955996, 0.8991951, -0.2537315, 0, 0, 0, 1, 1,
0.040434, 0.1883845, 1.20226, 0, 0, 0, 1, 1,
0.04203331, -0.7341402, 4.065639, 0, 0, 0, 1, 1,
0.04232084, -0.931742, 4.983805, 0, 0, 0, 1, 1,
0.04271283, 0.4765975, 1.764419, 0, 0, 0, 1, 1,
0.04301348, -0.2099696, 4.209821, 1, 1, 1, 1, 1,
0.04317279, -1.077112, 3.653623, 1, 1, 1, 1, 1,
0.04738633, -0.3970733, 2.619771, 1, 1, 1, 1, 1,
0.05046456, -1.29116, 3.679042, 1, 1, 1, 1, 1,
0.05092111, -0.4259244, 3.409314, 1, 1, 1, 1, 1,
0.05163424, 0.7274539, 1.486688, 1, 1, 1, 1, 1,
0.05190079, 1.181435, 1.7346, 1, 1, 1, 1, 1,
0.05336897, -0.1469614, 3.848744, 1, 1, 1, 1, 1,
0.05597415, 0.9003586, -0.4490024, 1, 1, 1, 1, 1,
0.06164319, 0.7656213, -0.5324244, 1, 1, 1, 1, 1,
0.06317629, -1.336897, 1.627084, 1, 1, 1, 1, 1,
0.06330052, 0.1353565, 0.5090351, 1, 1, 1, 1, 1,
0.06644329, 2.102786, 0.6960465, 1, 1, 1, 1, 1,
0.07048941, 0.736466, 0.8777537, 1, 1, 1, 1, 1,
0.07062818, 0.7341779, 0.06816444, 1, 1, 1, 1, 1,
0.07239643, -0.1426258, 2.788529, 0, 0, 1, 1, 1,
0.0726546, 1.635123, 1.137055, 1, 0, 0, 1, 1,
0.0754995, -0.3871245, 2.957985, 1, 0, 0, 1, 1,
0.07882851, 0.72294, -1.067103, 1, 0, 0, 1, 1,
0.08012543, -0.8370813, 1.785751, 1, 0, 0, 1, 1,
0.08604054, -0.1128573, 2.196653, 1, 0, 0, 1, 1,
0.08822577, -1.113079, 2.390933, 0, 0, 0, 1, 1,
0.08878472, -0.5477384, 2.709195, 0, 0, 0, 1, 1,
0.08959433, 0.618214, -0.8930677, 0, 0, 0, 1, 1,
0.09073385, -0.6278517, 1.532664, 0, 0, 0, 1, 1,
0.09270956, -1.711929, 2.854166, 0, 0, 0, 1, 1,
0.0939571, 0.5319285, 0.5665505, 0, 0, 0, 1, 1,
0.09438307, 0.9587516, 1.212053, 0, 0, 0, 1, 1,
0.09976611, 0.4932137, 1.401222, 1, 1, 1, 1, 1,
0.1001795, 0.1987365, 0.2567016, 1, 1, 1, 1, 1,
0.1028759, 0.7533522, 1.264893, 1, 1, 1, 1, 1,
0.1040411, -0.9208617, 3.210872, 1, 1, 1, 1, 1,
0.1041488, -0.6942437, 3.116176, 1, 1, 1, 1, 1,
0.106948, -1.221495, 2.758127, 1, 1, 1, 1, 1,
0.1072573, 0.5726385, 1.784266, 1, 1, 1, 1, 1,
0.1076898, 1.446673, 0.4903392, 1, 1, 1, 1, 1,
0.1111941, -0.2341996, 2.674823, 1, 1, 1, 1, 1,
0.111853, 0.05203255, 0.7062114, 1, 1, 1, 1, 1,
0.1126546, -0.1025868, 2.173999, 1, 1, 1, 1, 1,
0.1134577, -0.5284724, 3.669406, 1, 1, 1, 1, 1,
0.1155458, -1.939787, 3.664736, 1, 1, 1, 1, 1,
0.1185489, -0.1698649, 1.963065, 1, 1, 1, 1, 1,
0.1198016, -0.8058295, 2.304401, 1, 1, 1, 1, 1,
0.1265603, 0.9993617, 1.251507, 0, 0, 1, 1, 1,
0.1322384, 0.4232033, -1.253512, 1, 0, 0, 1, 1,
0.1339634, -0.9679931, 3.936864, 1, 0, 0, 1, 1,
0.1355764, -0.6511016, 2.508508, 1, 0, 0, 1, 1,
0.136219, 0.4537024, 2.309968, 1, 0, 0, 1, 1,
0.1393704, -0.4168121, 1.553377, 1, 0, 0, 1, 1,
0.140064, -2.406205, 3.706264, 0, 0, 0, 1, 1,
0.1414207, 0.02320958, 2.402432, 0, 0, 0, 1, 1,
0.1425583, 0.7595033, 0.3302575, 0, 0, 0, 1, 1,
0.1507717, 1.637534, -0.75648, 0, 0, 0, 1, 1,
0.1556247, -0.9022581, 2.851026, 0, 0, 0, 1, 1,
0.1558017, -2.120023, 3.045969, 0, 0, 0, 1, 1,
0.1560631, 0.3974785, -2.00364, 0, 0, 0, 1, 1,
0.1606982, -0.004767917, 1.858396, 1, 1, 1, 1, 1,
0.16588, -0.9618786, 2.990618, 1, 1, 1, 1, 1,
0.171045, 0.4377109, -1.022702, 1, 1, 1, 1, 1,
0.1712136, -0.5971878, 1.650831, 1, 1, 1, 1, 1,
0.1821414, -0.2547089, 3.096601, 1, 1, 1, 1, 1,
0.18328, 1.399699, -0.09673753, 1, 1, 1, 1, 1,
0.1869647, -1.004284, 1.918067, 1, 1, 1, 1, 1,
0.1873858, 1.110563, -0.8297373, 1, 1, 1, 1, 1,
0.1875456, 2.208967, -1.395146, 1, 1, 1, 1, 1,
0.188351, -0.1626772, 3.512507, 1, 1, 1, 1, 1,
0.194645, -0.4307441, 2.577348, 1, 1, 1, 1, 1,
0.195421, -1.603004, 3.892305, 1, 1, 1, 1, 1,
0.1976753, -0.04925953, 2.354725, 1, 1, 1, 1, 1,
0.1980884, 0.8970491, -0.4079973, 1, 1, 1, 1, 1,
0.1988721, 0.2466009, 0.9006788, 1, 1, 1, 1, 1,
0.2008343, 1.290702, -0.5828397, 0, 0, 1, 1, 1,
0.2061463, -1.13754, 2.43937, 1, 0, 0, 1, 1,
0.2073504, -0.2692726, 3.310552, 1, 0, 0, 1, 1,
0.211851, -1.127147, 2.469085, 1, 0, 0, 1, 1,
0.2269832, -0.1312698, 2.600149, 1, 0, 0, 1, 1,
0.2303427, 0.6108202, 0.722872, 1, 0, 0, 1, 1,
0.2381399, -0.3165222, 2.314704, 0, 0, 0, 1, 1,
0.2414179, -0.183663, 1.869577, 0, 0, 0, 1, 1,
0.2450163, -0.8357241, 3.210116, 0, 0, 0, 1, 1,
0.245356, 0.1791931, 2.73964, 0, 0, 0, 1, 1,
0.2455349, 0.7729567, 0.0458521, 0, 0, 0, 1, 1,
0.247215, -0.4732292, 3.991972, 0, 0, 0, 1, 1,
0.247219, -0.9189946, 3.738634, 0, 0, 0, 1, 1,
0.248968, 0.5638282, 0.5960115, 1, 1, 1, 1, 1,
0.2507287, -1.501018, 2.906073, 1, 1, 1, 1, 1,
0.253483, 1.242486, 0.4591935, 1, 1, 1, 1, 1,
0.2539846, -0.8195101, 3.152309, 1, 1, 1, 1, 1,
0.2556278, -1.294278, 2.982517, 1, 1, 1, 1, 1,
0.2603078, 0.4871538, 0.5368109, 1, 1, 1, 1, 1,
0.2646926, 0.602457, 0.4541225, 1, 1, 1, 1, 1,
0.2660975, -0.7526711, 2.673447, 1, 1, 1, 1, 1,
0.2681019, 0.6781786, -1.422519, 1, 1, 1, 1, 1,
0.2699249, 0.02906214, 2.659607, 1, 1, 1, 1, 1,
0.2740132, 2.009564, -1.188185, 1, 1, 1, 1, 1,
0.2742342, 0.01819735, 0.3116284, 1, 1, 1, 1, 1,
0.2743628, -0.2819999, 2.257946, 1, 1, 1, 1, 1,
0.2760887, -0.02607445, 0.1858811, 1, 1, 1, 1, 1,
0.2774552, -1.281773, 1.338628, 1, 1, 1, 1, 1,
0.2797668, -0.9982404, 2.051738, 0, 0, 1, 1, 1,
0.2807946, 0.3906425, 1.291776, 1, 0, 0, 1, 1,
0.2808579, 1.471008, -0.4762418, 1, 0, 0, 1, 1,
0.2809431, -0.778583, 3.13222, 1, 0, 0, 1, 1,
0.2846507, -1.19093, 4.255823, 1, 0, 0, 1, 1,
0.2980441, 0.3675649, 0.04767273, 1, 0, 0, 1, 1,
0.2981737, -0.6559573, 2.775377, 0, 0, 0, 1, 1,
0.2996117, -1.241909, 1.967886, 0, 0, 0, 1, 1,
0.3081111, -0.2863808, 3.412838, 0, 0, 0, 1, 1,
0.3107319, -0.510455, 3.509402, 0, 0, 0, 1, 1,
0.3122651, -0.5053135, 2.115478, 0, 0, 0, 1, 1,
0.314436, -0.3073756, 2.241101, 0, 0, 0, 1, 1,
0.3174137, 1.325158, -1.336503, 0, 0, 0, 1, 1,
0.319759, -1.098101, 2.795403, 1, 1, 1, 1, 1,
0.3203169, -1.074168, 3.187854, 1, 1, 1, 1, 1,
0.3241465, -0.9622739, 4.20259, 1, 1, 1, 1, 1,
0.3271452, 0.7719474, 1.032599, 1, 1, 1, 1, 1,
0.327311, -0.2633087, 3.311651, 1, 1, 1, 1, 1,
0.3292669, 1.011929, -0.8401549, 1, 1, 1, 1, 1,
0.3308723, -0.6158415, 2.552461, 1, 1, 1, 1, 1,
0.3325888, -1.557744, 2.576923, 1, 1, 1, 1, 1,
0.3437988, 1.32987, 0.1286501, 1, 1, 1, 1, 1,
0.3462537, -1.285943, 2.462521, 1, 1, 1, 1, 1,
0.3479848, -0.6590344, 0.8870614, 1, 1, 1, 1, 1,
0.3550569, -0.8195037, 1.959187, 1, 1, 1, 1, 1,
0.3559167, -0.3993509, 2.283221, 1, 1, 1, 1, 1,
0.3611293, -0.1687486, 0.3641469, 1, 1, 1, 1, 1,
0.3613748, 0.4660747, -0.1974163, 1, 1, 1, 1, 1,
0.3627082, 0.9609914, -0.3891782, 0, 0, 1, 1, 1,
0.3633012, -0.7866791, 3.903653, 1, 0, 0, 1, 1,
0.3653083, -0.008881889, 2.048014, 1, 0, 0, 1, 1,
0.3672833, 1.041231, -1.082202, 1, 0, 0, 1, 1,
0.3702613, -0.1507814, 0.6264088, 1, 0, 0, 1, 1,
0.3715106, 0.2248164, -0.146048, 1, 0, 0, 1, 1,
0.3722337, 1.303692, 0.6899541, 0, 0, 0, 1, 1,
0.3723507, -0.3603684, 2.771947, 0, 0, 0, 1, 1,
0.3727408, 0.1499806, 1.05484, 0, 0, 0, 1, 1,
0.373548, 0.05215181, -0.4956189, 0, 0, 0, 1, 1,
0.3747296, 0.08498588, 0.4479622, 0, 0, 0, 1, 1,
0.3819343, 0.7868206, -0.01357866, 0, 0, 0, 1, 1,
0.3846705, 0.128761, 1.255129, 0, 0, 0, 1, 1,
0.389713, 2.535776, -1.681251, 1, 1, 1, 1, 1,
0.3940362, -1.482441, 4.028041, 1, 1, 1, 1, 1,
0.3954957, 0.288839, 0.2588384, 1, 1, 1, 1, 1,
0.4000834, -0.1740587, 1.390471, 1, 1, 1, 1, 1,
0.4021924, -0.5477065, 2.503784, 1, 1, 1, 1, 1,
0.402226, -0.04788546, 2.655963, 1, 1, 1, 1, 1,
0.4044253, 0.5727285, -0.177777, 1, 1, 1, 1, 1,
0.4045836, 0.9687203, -0.1688898, 1, 1, 1, 1, 1,
0.4052919, 0.001208186, 3.364993, 1, 1, 1, 1, 1,
0.4067264, -0.9506366, 2.041041, 1, 1, 1, 1, 1,
0.4072687, -0.2372428, 1.744021, 1, 1, 1, 1, 1,
0.4075567, 0.5415145, 2.433523, 1, 1, 1, 1, 1,
0.4078034, 0.2184225, 2.618602, 1, 1, 1, 1, 1,
0.4095417, 1.270177, 0.9286963, 1, 1, 1, 1, 1,
0.421545, -0.2808399, 1.432255, 1, 1, 1, 1, 1,
0.4234481, -0.5864587, 2.4386, 0, 0, 1, 1, 1,
0.4286252, -0.5006714, 3.406652, 1, 0, 0, 1, 1,
0.4304034, 0.9209902, 1.064767, 1, 0, 0, 1, 1,
0.4307096, 1.144808, -0.7988995, 1, 0, 0, 1, 1,
0.4313971, 0.5007462, -0.1326612, 1, 0, 0, 1, 1,
0.4346734, 0.07042837, 1.862734, 1, 0, 0, 1, 1,
0.4374928, -0.2636374, 1.806442, 0, 0, 0, 1, 1,
0.4382372, -1.383721, 0.5330129, 0, 0, 0, 1, 1,
0.4406273, 0.2126189, 0.1439694, 0, 0, 0, 1, 1,
0.4446704, 0.1253697, 1.259172, 0, 0, 0, 1, 1,
0.4467717, 0.8457146, 0.5146268, 0, 0, 0, 1, 1,
0.4499221, -0.6337401, 1.6059, 0, 0, 0, 1, 1,
0.454919, 0.9645665, 1.695465, 0, 0, 0, 1, 1,
0.4567703, -0.520703, 2.422061, 1, 1, 1, 1, 1,
0.4675905, 0.5670297, 1.392387, 1, 1, 1, 1, 1,
0.4676427, -0.4050958, 2.631603, 1, 1, 1, 1, 1,
0.4677211, -2.115907, 3.728527, 1, 1, 1, 1, 1,
0.4716505, -0.225676, 1.451065, 1, 1, 1, 1, 1,
0.4734719, -0.6263127, 4.190332, 1, 1, 1, 1, 1,
0.4762872, -0.5064647, 2.888252, 1, 1, 1, 1, 1,
0.4859934, -0.1080214, 5.428758, 1, 1, 1, 1, 1,
0.4865398, -0.5634447, 1.851861, 1, 1, 1, 1, 1,
0.48874, 1.357483, 0.8944463, 1, 1, 1, 1, 1,
0.4967849, 0.9742482, 2.562097, 1, 1, 1, 1, 1,
0.5082974, -1.036909, 1.901914, 1, 1, 1, 1, 1,
0.5084767, -0.3187464, 0.3542002, 1, 1, 1, 1, 1,
0.5104072, -1.153057, 3.237184, 1, 1, 1, 1, 1,
0.5125938, -0.6646713, 1.872437, 1, 1, 1, 1, 1,
0.5148653, 0.4498608, 0.370713, 0, 0, 1, 1, 1,
0.5202187, -0.6847718, 2.287434, 1, 0, 0, 1, 1,
0.5213016, -0.06121562, 3.965417, 1, 0, 0, 1, 1,
0.526103, -1.781258, 3.733955, 1, 0, 0, 1, 1,
0.5266221, 0.7357726, 1.558173, 1, 0, 0, 1, 1,
0.5288171, -0.9640103, 2.226871, 1, 0, 0, 1, 1,
0.5299277, -0.3284963, 3.740058, 0, 0, 0, 1, 1,
0.5343316, -1.371061, 2.535685, 0, 0, 0, 1, 1,
0.5344319, 0.9806512, -0.1212566, 0, 0, 0, 1, 1,
0.5413995, 1.229416, 1.168596, 0, 0, 0, 1, 1,
0.541986, -0.07860408, 1.356611, 0, 0, 0, 1, 1,
0.5470624, 0.84409, 0.5725653, 0, 0, 0, 1, 1,
0.5496889, 0.3374878, 2.252852, 0, 0, 0, 1, 1,
0.551989, 0.7402189, -0.2735205, 1, 1, 1, 1, 1,
0.5523956, -0.38424, 1.182996, 1, 1, 1, 1, 1,
0.5648737, -2.445871, 3.447983, 1, 1, 1, 1, 1,
0.5768421, 0.1524549, 1.551666, 1, 1, 1, 1, 1,
0.5776851, 0.5370933, 1.221824, 1, 1, 1, 1, 1,
0.5814826, 0.5193484, -0.2568883, 1, 1, 1, 1, 1,
0.5870358, -0.7635413, 1.376518, 1, 1, 1, 1, 1,
0.5914178, 0.03338094, 1.234658, 1, 1, 1, 1, 1,
0.6022978, 0.1152576, 0.1193993, 1, 1, 1, 1, 1,
0.6036451, 0.3819289, 1.019585, 1, 1, 1, 1, 1,
0.6065298, 0.6524817, 1.300244, 1, 1, 1, 1, 1,
0.606729, -0.832583, 3.543141, 1, 1, 1, 1, 1,
0.6166326, 1.254771, 0.4059907, 1, 1, 1, 1, 1,
0.6185548, -0.0915094, 0.6020653, 1, 1, 1, 1, 1,
0.6275408, 0.8757614, 2.492898, 1, 1, 1, 1, 1,
0.6283194, 0.7860438, 0.4449533, 0, 0, 1, 1, 1,
0.6355609, -0.3903663, 1.048191, 1, 0, 0, 1, 1,
0.6392272, 0.9748594, 1.010647, 1, 0, 0, 1, 1,
0.6396803, -0.548297, 1.346792, 1, 0, 0, 1, 1,
0.6443598, -1.817633, 3.189343, 1, 0, 0, 1, 1,
0.6454465, -0.7953739, 2.090878, 1, 0, 0, 1, 1,
0.6469671, -1.30348, 3.416224, 0, 0, 0, 1, 1,
0.6475857, -0.3418286, 1.63444, 0, 0, 0, 1, 1,
0.64921, 1.307269, -0.1338465, 0, 0, 0, 1, 1,
0.6532568, -0.9963768, 2.620176, 0, 0, 0, 1, 1,
0.6541617, 1.325249, 0.0620711, 0, 0, 0, 1, 1,
0.6548747, -0.9333069, 3.488581, 0, 0, 0, 1, 1,
0.6560469, 0.701207, 0.4789627, 0, 0, 0, 1, 1,
0.6600397, -1.038554, 2.169835, 1, 1, 1, 1, 1,
0.6623038, -0.6379613, 1.61651, 1, 1, 1, 1, 1,
0.6742273, 0.5142976, 1.851697, 1, 1, 1, 1, 1,
0.6743185, 1.185735, -0.3020154, 1, 1, 1, 1, 1,
0.6752387, -1.222312, 2.819086, 1, 1, 1, 1, 1,
0.6775424, 0.04185119, 1.420176, 1, 1, 1, 1, 1,
0.6792922, 2.289693, 0.1718648, 1, 1, 1, 1, 1,
0.6802578, -1.528936, 3.065608, 1, 1, 1, 1, 1,
0.686517, 0.545167, 1.229858, 1, 1, 1, 1, 1,
0.6874855, -0.5536618, 2.379604, 1, 1, 1, 1, 1,
0.6963204, 2.08393, 1.013989, 1, 1, 1, 1, 1,
0.697235, -0.8866162, 2.864275, 1, 1, 1, 1, 1,
0.7036284, 0.1544073, 1.198073, 1, 1, 1, 1, 1,
0.7042041, -0.7483835, 1.19104, 1, 1, 1, 1, 1,
0.7050207, -1.147616, 2.150342, 1, 1, 1, 1, 1,
0.7073494, -0.7124844, 4.055973, 0, 0, 1, 1, 1,
0.7150618, 0.5945599, 0.1538425, 1, 0, 0, 1, 1,
0.7157924, -0.3342958, 2.52546, 1, 0, 0, 1, 1,
0.7183806, 2.377451, 0.9614655, 1, 0, 0, 1, 1,
0.7206053, 0.4650175, -0.6133198, 1, 0, 0, 1, 1,
0.7217761, 0.5036467, 2.041358, 1, 0, 0, 1, 1,
0.7233475, 1.041627, -0.8156784, 0, 0, 0, 1, 1,
0.7285609, -0.6901699, 2.604812, 0, 0, 0, 1, 1,
0.7323137, -0.2554377, 2.423196, 0, 0, 0, 1, 1,
0.7358145, 0.1916408, 1.53262, 0, 0, 0, 1, 1,
0.7362853, -1.976278, 1.957768, 0, 0, 0, 1, 1,
0.7423859, 1.608205, 2.079955, 0, 0, 0, 1, 1,
0.7554222, 0.05290162, 1.181762, 0, 0, 0, 1, 1,
0.7618073, 1.049425, 1.144345, 1, 1, 1, 1, 1,
0.7647943, -1.914158, 3.051245, 1, 1, 1, 1, 1,
0.7650677, -0.1038023, 2.299265, 1, 1, 1, 1, 1,
0.7764167, -1.56775, 2.732531, 1, 1, 1, 1, 1,
0.7778832, 0.3859531, 0.1193469, 1, 1, 1, 1, 1,
0.7783782, 1.473887, 2.161327, 1, 1, 1, 1, 1,
0.7788048, -0.9434462, 1.303634, 1, 1, 1, 1, 1,
0.7799781, -0.147802, 2.301361, 1, 1, 1, 1, 1,
0.7854872, -1.001126, 1.772591, 1, 1, 1, 1, 1,
0.7874073, -0.715803, 2.265816, 1, 1, 1, 1, 1,
0.7908804, 0.06894282, 2.456604, 1, 1, 1, 1, 1,
0.7917254, -0.5959053, 3.721691, 1, 1, 1, 1, 1,
0.7971141, -2.491977, 2.336233, 1, 1, 1, 1, 1,
0.8001145, 0.3271594, 1.749418, 1, 1, 1, 1, 1,
0.8004717, -0.9353521, 1.89167, 1, 1, 1, 1, 1,
0.8021337, 0.1220141, 1.61067, 0, 0, 1, 1, 1,
0.8028305, -1.279979, 3.81368, 1, 0, 0, 1, 1,
0.8106201, -1.659893, 2.603398, 1, 0, 0, 1, 1,
0.8109507, 0.716806, 1.921286, 1, 0, 0, 1, 1,
0.8127177, -0.2986464, 0.01854523, 1, 0, 0, 1, 1,
0.819057, 0.4757577, -0.6978934, 1, 0, 0, 1, 1,
0.82083, -1.632207, 0.6423214, 0, 0, 0, 1, 1,
0.8310957, -0.4451255, 0.7379403, 0, 0, 0, 1, 1,
0.8404996, -2.066452, 2.076036, 0, 0, 0, 1, 1,
0.8484282, -0.6160066, 2.717124, 0, 0, 0, 1, 1,
0.8504772, -0.1212679, -0.6836645, 0, 0, 0, 1, 1,
0.8509671, -1.288601, 2.194186, 0, 0, 0, 1, 1,
0.8516784, 0.4046709, 0.5111688, 0, 0, 0, 1, 1,
0.8526903, 0.08761761, 1.702006, 1, 1, 1, 1, 1,
0.8534811, -0.4679638, 0.1807711, 1, 1, 1, 1, 1,
0.8576434, 1.754101, 1.358445, 1, 1, 1, 1, 1,
0.8644722, -0.3528262, 0.2560493, 1, 1, 1, 1, 1,
0.8651657, 0.6148753, 1.987619, 1, 1, 1, 1, 1,
0.8659133, 0.07675904, 3.358404, 1, 1, 1, 1, 1,
0.8676163, -2.55217, 2.020045, 1, 1, 1, 1, 1,
0.8710343, 0.1956396, 2.307574, 1, 1, 1, 1, 1,
0.8722194, -1.638872, 3.267168, 1, 1, 1, 1, 1,
0.8727537, 0.210534, 0.5555027, 1, 1, 1, 1, 1,
0.8747639, 1.52194, -0.9046574, 1, 1, 1, 1, 1,
0.8752416, 0.3312159, 2.157896, 1, 1, 1, 1, 1,
0.8777086, -0.1327339, -0.1160275, 1, 1, 1, 1, 1,
0.8821599, -0.4801737, 1.123831, 1, 1, 1, 1, 1,
0.8920515, 0.3573662, 2.519501, 1, 1, 1, 1, 1,
0.8996712, -0.3214909, 1.30234, 0, 0, 1, 1, 1,
0.916649, -0.1416595, 3.992975, 1, 0, 0, 1, 1,
0.9198334, -0.4011637, 2.081642, 1, 0, 0, 1, 1,
0.9203398, 0.3413911, 1.628439, 1, 0, 0, 1, 1,
0.9203804, -0.1701217, 1.79711, 1, 0, 0, 1, 1,
0.920702, 0.6343754, 1.023484, 1, 0, 0, 1, 1,
0.9293157, -1.319626, 2.003623, 0, 0, 0, 1, 1,
0.9332582, -3.355824, 1.895711, 0, 0, 0, 1, 1,
0.9395618, -0.4500573, 0.7630932, 0, 0, 0, 1, 1,
0.9412189, -1.885314, 3.659912, 0, 0, 0, 1, 1,
0.9470308, 1.731849, 0.5574061, 0, 0, 0, 1, 1,
0.950555, -0.08957168, 0.00677959, 0, 0, 0, 1, 1,
0.9521189, 1.525378, 1.42457, 0, 0, 0, 1, 1,
0.9584399, 0.2016819, 0.9333481, 1, 1, 1, 1, 1,
0.9637967, -0.2456711, 2.454496, 1, 1, 1, 1, 1,
0.9641052, 0.06208267, 2.641541, 1, 1, 1, 1, 1,
0.9641326, -0.4208024, 1.797928, 1, 1, 1, 1, 1,
0.965921, 0.7110251, -0.04238417, 1, 1, 1, 1, 1,
0.9706541, -0.3541652, 1.906407, 1, 1, 1, 1, 1,
0.9716552, -1.034308, 1.990192, 1, 1, 1, 1, 1,
0.9753265, 1.308389, 1.517851, 1, 1, 1, 1, 1,
0.9885038, 1.217299, 1.303742, 1, 1, 1, 1, 1,
0.9885738, 0.5287395, 0.7149009, 1, 1, 1, 1, 1,
0.9966209, -0.7919648, 2.567243, 1, 1, 1, 1, 1,
0.9984795, -0.148578, 1.716386, 1, 1, 1, 1, 1,
1.003338, 0.2380092, 1.484692, 1, 1, 1, 1, 1,
1.009209, -0.4326442, 4.389356, 1, 1, 1, 1, 1,
1.010854, 0.8162821, 0.8232095, 1, 1, 1, 1, 1,
1.016965, 0.6264849, 1.066275, 0, 0, 1, 1, 1,
1.019193, 0.1583198, 0.4882149, 1, 0, 0, 1, 1,
1.021682, -1.078432, 2.505148, 1, 0, 0, 1, 1,
1.040727, 1.056639, 0.5685925, 1, 0, 0, 1, 1,
1.040803, 0.1062955, 0.5130701, 1, 0, 0, 1, 1,
1.047191, -0.2505593, 3.085158, 1, 0, 0, 1, 1,
1.06336, -0.9913948, 2.239492, 0, 0, 0, 1, 1,
1.063448, 1.782894, 1.303706, 0, 0, 0, 1, 1,
1.067749, -1.214347, 0.9296126, 0, 0, 0, 1, 1,
1.068631, -0.2177581, 1.92487, 0, 0, 0, 1, 1,
1.069562, 1.43952, 0.6200901, 0, 0, 0, 1, 1,
1.073434, -0.05446988, 0.8528673, 0, 0, 0, 1, 1,
1.074993, -0.7715027, -0.2342687, 0, 0, 0, 1, 1,
1.080821, -0.004068339, 2.485046, 1, 1, 1, 1, 1,
1.08612, 0.3089009, 1.677354, 1, 1, 1, 1, 1,
1.091653, -1.284988, 1.482938, 1, 1, 1, 1, 1,
1.097061, 0.6513405, 0.5057337, 1, 1, 1, 1, 1,
1.104305, -0.3497875, 2.404881, 1, 1, 1, 1, 1,
1.105652, 0.6353323, 1.787451, 1, 1, 1, 1, 1,
1.111747, -0.4873358, 3.403769, 1, 1, 1, 1, 1,
1.117269, -0.05961467, 0.1405254, 1, 1, 1, 1, 1,
1.119631, -0.7873631, 1.368325, 1, 1, 1, 1, 1,
1.135674, 0.386115, 1.806228, 1, 1, 1, 1, 1,
1.139916, 0.9047829, 0.8714085, 1, 1, 1, 1, 1,
1.142502, -1.38389, 3.40398, 1, 1, 1, 1, 1,
1.147828, -1.299749, 3.615244, 1, 1, 1, 1, 1,
1.151514, 1.009073, 2.078192, 1, 1, 1, 1, 1,
1.152312, 0.109188, 2.250163, 1, 1, 1, 1, 1,
1.152905, 0.6456945, -0.1130266, 0, 0, 1, 1, 1,
1.156711, -1.464763, 3.447755, 1, 0, 0, 1, 1,
1.161538, 0.3241988, 0.7342445, 1, 0, 0, 1, 1,
1.16794, -1.683178, 2.840801, 1, 0, 0, 1, 1,
1.18253, -1.052853, 2.409442, 1, 0, 0, 1, 1,
1.183929, 0.3286834, 1.412422, 1, 0, 0, 1, 1,
1.186271, 0.550963, 0.4734769, 0, 0, 0, 1, 1,
1.189852, -0.04372723, 0.9790219, 0, 0, 0, 1, 1,
1.194686, -0.3629267, 1.361608, 0, 0, 0, 1, 1,
1.21061, 1.226048, -0.1324696, 0, 0, 0, 1, 1,
1.223852, -1.120411, 0.8243036, 0, 0, 0, 1, 1,
1.231411, -0.6257748, 2.865155, 0, 0, 0, 1, 1,
1.233606, -0.5611836, 1.718671, 0, 0, 0, 1, 1,
1.238786, -0.009512424, 1.608326, 1, 1, 1, 1, 1,
1.245669, -1.373764, 1.748223, 1, 1, 1, 1, 1,
1.253679, -0.5178994, 0.3143374, 1, 1, 1, 1, 1,
1.259571, 0.2706603, 2.259823, 1, 1, 1, 1, 1,
1.272549, 0.4638276, 1.075796, 1, 1, 1, 1, 1,
1.288446, 0.3054242, 1.012677, 1, 1, 1, 1, 1,
1.289448, -0.5598955, 3.409966, 1, 1, 1, 1, 1,
1.301936, -1.748905, 3.292351, 1, 1, 1, 1, 1,
1.306349, 1.8115, -0.4320602, 1, 1, 1, 1, 1,
1.311405, -0.6467106, 2.816842, 1, 1, 1, 1, 1,
1.317638, 1.067436, 2.38399, 1, 1, 1, 1, 1,
1.318371, 0.4336744, 1.473176, 1, 1, 1, 1, 1,
1.319347, 0.134831, 1.205106, 1, 1, 1, 1, 1,
1.325644, -0.1262754, 1.394677, 1, 1, 1, 1, 1,
1.331953, -0.5054166, 1.349172, 1, 1, 1, 1, 1,
1.338636, 1.278567, -1.66315, 0, 0, 1, 1, 1,
1.339284, 0.185315, 1.63073, 1, 0, 0, 1, 1,
1.342478, -0.1908844, 1.627476, 1, 0, 0, 1, 1,
1.348053, 0.8473932, 1.526266, 1, 0, 0, 1, 1,
1.350879, 2.029381, 0.1096982, 1, 0, 0, 1, 1,
1.352254, 0.4473446, 1.368804, 1, 0, 0, 1, 1,
1.352792, 1.971223, 1.539235, 0, 0, 0, 1, 1,
1.379973, 1.273555, 0.04650776, 0, 0, 0, 1, 1,
1.380569, -0.4861943, 1.499468, 0, 0, 0, 1, 1,
1.383723, 0.2372936, 1.136259, 0, 0, 0, 1, 1,
1.383858, 0.4947835, 2.919241, 0, 0, 0, 1, 1,
1.391609, 0.502764, 1.842462, 0, 0, 0, 1, 1,
1.406494, 1.438099, 1.697767, 0, 0, 0, 1, 1,
1.411795, 0.9284586, 1.741917, 1, 1, 1, 1, 1,
1.412158, -0.2652179, 2.112455, 1, 1, 1, 1, 1,
1.417693, -0.5244, 3.584439, 1, 1, 1, 1, 1,
1.427634, -0.1107516, 1.744892, 1, 1, 1, 1, 1,
1.429666, 0.6577364, 1.092091, 1, 1, 1, 1, 1,
1.431395, 1.185392, 0.08855099, 1, 1, 1, 1, 1,
1.44685, 0.3793251, 1.240565, 1, 1, 1, 1, 1,
1.490866, -0.1225846, 1.095501, 1, 1, 1, 1, 1,
1.491426, -0.3427321, 1.116686, 1, 1, 1, 1, 1,
1.498233, -1.549168, 1.566783, 1, 1, 1, 1, 1,
1.499413, 0.498315, 2.489547, 1, 1, 1, 1, 1,
1.51978, -1.104694, 1.764916, 1, 1, 1, 1, 1,
1.526945, 1.783003, 2.667913, 1, 1, 1, 1, 1,
1.530887, 2.153584, 2.141219, 1, 1, 1, 1, 1,
1.56363, -1.094579, 2.089255, 1, 1, 1, 1, 1,
1.565831, -0.8413355, 3.234724, 0, 0, 1, 1, 1,
1.574992, -0.4608265, 1.796739, 1, 0, 0, 1, 1,
1.579064, 0.7572036, 2.096552, 1, 0, 0, 1, 1,
1.596267, 0.5896407, 1.918615, 1, 0, 0, 1, 1,
1.617311, 1.393685, 1.66274, 1, 0, 0, 1, 1,
1.64097, 0.257736, 0.5949365, 1, 0, 0, 1, 1,
1.646957, -1.250841, 3.292139, 0, 0, 0, 1, 1,
1.652385, 0.1436677, 1.534025, 0, 0, 0, 1, 1,
1.658706, 1.035051, 0.82239, 0, 0, 0, 1, 1,
1.662233, 1.254731, 0.9091087, 0, 0, 0, 1, 1,
1.662599, 1.179334, 1.683002, 0, 0, 0, 1, 1,
1.668424, -0.9599397, 2.174071, 0, 0, 0, 1, 1,
1.669336, -0.05590075, 1.98545, 0, 0, 0, 1, 1,
1.680807, 0.1664989, -0.7090401, 1, 1, 1, 1, 1,
1.690831, -0.6033817, 1.136949, 1, 1, 1, 1, 1,
1.691661, 1.869833, 0.2362747, 1, 1, 1, 1, 1,
1.693197, -0.879539, 2.924167, 1, 1, 1, 1, 1,
1.696125, 1.168599, -0.2826701, 1, 1, 1, 1, 1,
1.697294, -1.820249, 2.553255, 1, 1, 1, 1, 1,
1.698504, -1.602762, 0.798866, 1, 1, 1, 1, 1,
1.700565, -0.1884902, 2.526986, 1, 1, 1, 1, 1,
1.704215, 1.689455, 0.6356189, 1, 1, 1, 1, 1,
1.705934, 0.9448593, 1.031192, 1, 1, 1, 1, 1,
1.706138, 0.1650347, 0.7411621, 1, 1, 1, 1, 1,
1.724706, 0.2389189, 1.888273, 1, 1, 1, 1, 1,
1.731197, -2.620223, 0.5555546, 1, 1, 1, 1, 1,
1.748097, 0.9436975, 1.099599, 1, 1, 1, 1, 1,
1.761566, 1.666695, 1.195471, 1, 1, 1, 1, 1,
1.769263, 1.356645, 0.432272, 0, 0, 1, 1, 1,
1.781199, 0.3335474, 0.4877508, 1, 0, 0, 1, 1,
1.782284, 1.178585, 1.04999, 1, 0, 0, 1, 1,
1.804774, 0.2627534, 0.3464882, 1, 0, 0, 1, 1,
1.824307, -0.288631, 3.405644, 1, 0, 0, 1, 1,
1.825398, 0.2065589, 1.082793, 1, 0, 0, 1, 1,
1.835326, -2.399905, 2.422248, 0, 0, 0, 1, 1,
1.836564, 2.166975, -0.8257202, 0, 0, 0, 1, 1,
1.836792, 0.1698624, 1.539972, 0, 0, 0, 1, 1,
1.839608, 1.348618, 0.3608003, 0, 0, 0, 1, 1,
1.853146, -1.223505, 2.23519, 0, 0, 0, 1, 1,
1.855229, -1.748475, 3.064156, 0, 0, 0, 1, 1,
1.862668, -0.1953826, 3.267816, 0, 0, 0, 1, 1,
1.873193, -2.031131, 2.938395, 1, 1, 1, 1, 1,
1.87859, -2.172683, 2.000987, 1, 1, 1, 1, 1,
1.883104, 0.9044881, 2.480912, 1, 1, 1, 1, 1,
1.884291, 0.5718129, 0.6964284, 1, 1, 1, 1, 1,
1.900417, 0.3949873, 1.645838, 1, 1, 1, 1, 1,
1.939245, 0.1180341, -0.7604811, 1, 1, 1, 1, 1,
1.94151, 0.7076231, -0.4006419, 1, 1, 1, 1, 1,
1.943815, 1.350011, 1.290116, 1, 1, 1, 1, 1,
1.972374, -1.061057, 3.812686, 1, 1, 1, 1, 1,
1.980259, -0.1973327, 1.049989, 1, 1, 1, 1, 1,
2.00356, -1.714219, 1.262495, 1, 1, 1, 1, 1,
2.031381, -1.31549, 2.395453, 1, 1, 1, 1, 1,
2.051166, -0.6363919, 4.533184, 1, 1, 1, 1, 1,
2.061095, 0.4321274, 2.474772, 1, 1, 1, 1, 1,
2.069652, 0.9926076, 0.5636118, 1, 1, 1, 1, 1,
2.079449, 1.332607, 1.577758, 0, 0, 1, 1, 1,
2.100724, 0.7883594, 2.230891, 1, 0, 0, 1, 1,
2.102971, -1.370981, 1.992648, 1, 0, 0, 1, 1,
2.110337, 2.068601, -0.6158429, 1, 0, 0, 1, 1,
2.145513, -1.637052, 1.361193, 1, 0, 0, 1, 1,
2.155862, -0.02197763, 0.5133963, 1, 0, 0, 1, 1,
2.161132, -0.3195992, 1.831886, 0, 0, 0, 1, 1,
2.168845, 0.7798674, 0.4294619, 0, 0, 0, 1, 1,
2.175081, 0.02188832, 1.078848, 0, 0, 0, 1, 1,
2.197204, 1.22897, 2.546312, 0, 0, 0, 1, 1,
2.229044, -0.6308988, -0.07221866, 0, 0, 0, 1, 1,
2.451701, -0.4563336, 3.431671, 0, 0, 0, 1, 1,
2.458896, -0.8913448, 1.930885, 0, 0, 0, 1, 1,
2.467483, 1.323106, 1.976063, 1, 1, 1, 1, 1,
2.497969, -0.521705, 0.1246629, 1, 1, 1, 1, 1,
2.635975, -0.3967064, 3.444561, 1, 1, 1, 1, 1,
2.851526, 0.006542613, 0.6230806, 1, 1, 1, 1, 1,
2.923561, 0.4732904, -0.5773291, 1, 1, 1, 1, 1,
3.018932, 0.07482294, 0.4897928, 1, 1, 1, 1, 1,
3.04301, 0.81095, 1.966248, 1, 1, 1, 1, 1
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
var radius = 9.533537;
var distance = 33.48615;
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
mvMatrix.translate( -0.03474927, 0.0190649, -0.1938343 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48615);
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
