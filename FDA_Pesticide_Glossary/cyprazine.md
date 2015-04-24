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
-3.081674, 0.7596212, -2.600889, 1, 0, 0, 1,
-2.826006, 0.295512, -1.623592, 1, 0.007843138, 0, 1,
-2.76219, 0.06779841, -1.064857, 1, 0.01176471, 0, 1,
-2.726075, 1.056874, -2.935036, 1, 0.01960784, 0, 1,
-2.701803, 0.4872803, -2.380756, 1, 0.02352941, 0, 1,
-2.584592, -0.008757073, -0.1271857, 1, 0.03137255, 0, 1,
-2.570465, -0.4790542, -2.557018, 1, 0.03529412, 0, 1,
-2.56632, -0.07613743, -3.280211, 1, 0.04313726, 0, 1,
-2.544552, 0.3768717, -0.8465877, 1, 0.04705882, 0, 1,
-2.505125, 0.6431534, -1.499988, 1, 0.05490196, 0, 1,
-2.490087, -0.4078862, -3.201244, 1, 0.05882353, 0, 1,
-2.393398, -1.473389, -2.40722, 1, 0.06666667, 0, 1,
-2.39081, 0.8269728, 0.144042, 1, 0.07058824, 0, 1,
-2.244364, 0.2644484, -1.280374, 1, 0.07843138, 0, 1,
-2.197938, -0.726299, 0.5798388, 1, 0.08235294, 0, 1,
-2.197542, -0.5225326, -2.41558, 1, 0.09019608, 0, 1,
-2.11603, -0.428567, -1.448419, 1, 0.09411765, 0, 1,
-2.073684, 1.401797, -1.323063, 1, 0.1019608, 0, 1,
-2.0601, 0.1262409, -1.766975, 1, 0.1098039, 0, 1,
-2.04252, -0.5434156, -1.876852, 1, 0.1137255, 0, 1,
-2.028762, 1.174187, 0.04179228, 1, 0.1215686, 0, 1,
-2.006858, 1.435937, -2.784214, 1, 0.1254902, 0, 1,
-1.992244, -0.224541, -3.066865, 1, 0.1333333, 0, 1,
-1.986492, 0.5386649, -1.493466, 1, 0.1372549, 0, 1,
-1.985384, -0.366163, -0.3040426, 1, 0.145098, 0, 1,
-1.960831, 2.220599, -1.128871, 1, 0.1490196, 0, 1,
-1.936773, 0.04400468, -2.112715, 1, 0.1568628, 0, 1,
-1.921695, 0.2111273, -2.273498, 1, 0.1607843, 0, 1,
-1.903668, -1.240993, -2.521857, 1, 0.1686275, 0, 1,
-1.902213, -0.7544945, -0.7780997, 1, 0.172549, 0, 1,
-1.899769, -0.551977, -2.714689, 1, 0.1803922, 0, 1,
-1.899539, 0.3294784, -1.909234, 1, 0.1843137, 0, 1,
-1.894533, 1.018806, -1.469336, 1, 0.1921569, 0, 1,
-1.874767, -0.5331496, 0.1266447, 1, 0.1960784, 0, 1,
-1.873683, 0.8566505, 0.2693069, 1, 0.2039216, 0, 1,
-1.87194, 0.8270584, -1.035062, 1, 0.2117647, 0, 1,
-1.869044, 0.9365671, 0.2574556, 1, 0.2156863, 0, 1,
-1.85611, -0.8185545, -1.105967, 1, 0.2235294, 0, 1,
-1.833038, -0.01426167, -1.868838, 1, 0.227451, 0, 1,
-1.813032, -0.2572652, -0.5524327, 1, 0.2352941, 0, 1,
-1.809046, 1.27835, -2.535785, 1, 0.2392157, 0, 1,
-1.786144, 0.4667581, -1.101102, 1, 0.2470588, 0, 1,
-1.767054, -0.4365429, -2.037168, 1, 0.2509804, 0, 1,
-1.761852, 0.07900471, 0.2643869, 1, 0.2588235, 0, 1,
-1.75713, -0.2883334, -3.205241, 1, 0.2627451, 0, 1,
-1.756239, 1.713451, -0.9411651, 1, 0.2705882, 0, 1,
-1.756184, 0.1334725, -2.899583, 1, 0.2745098, 0, 1,
-1.754302, -1.721423, -3.292383, 1, 0.282353, 0, 1,
-1.737091, 1.619112, -0.1154529, 1, 0.2862745, 0, 1,
-1.734308, -1.439459, -1.445856, 1, 0.2941177, 0, 1,
-1.725193, -0.8523749, -2.074903, 1, 0.3019608, 0, 1,
-1.723846, 0.2933695, -0.08990507, 1, 0.3058824, 0, 1,
-1.715918, 1.182175, -2.209265, 1, 0.3137255, 0, 1,
-1.696279, 1.093999, -0.691227, 1, 0.3176471, 0, 1,
-1.690018, -1.171031, -3.068071, 1, 0.3254902, 0, 1,
-1.689375, -0.4456115, -2.707458, 1, 0.3294118, 0, 1,
-1.688563, 0.9315021, -0.8436348, 1, 0.3372549, 0, 1,
-1.675142, 0.8594026, -2.560693, 1, 0.3411765, 0, 1,
-1.666388, -0.6944116, -1.240242, 1, 0.3490196, 0, 1,
-1.654561, -0.9321169, -2.614749, 1, 0.3529412, 0, 1,
-1.646694, 0.06303333, -2.199475, 1, 0.3607843, 0, 1,
-1.645163, 0.3967823, -1.234781, 1, 0.3647059, 0, 1,
-1.643925, -0.6703874, -0.9502484, 1, 0.372549, 0, 1,
-1.634952, -1.671415, -0.3090179, 1, 0.3764706, 0, 1,
-1.63132, 0.6167597, -1.569576, 1, 0.3843137, 0, 1,
-1.631109, -1.191512, -0.8349558, 1, 0.3882353, 0, 1,
-1.623981, -1.476836, -1.227327, 1, 0.3960784, 0, 1,
-1.622401, 0.02375763, -0.2306838, 1, 0.4039216, 0, 1,
-1.619904, 2.793621, 0.2214267, 1, 0.4078431, 0, 1,
-1.61802, -0.7713616, -1.483975, 1, 0.4156863, 0, 1,
-1.589955, -0.7722442, -2.138036, 1, 0.4196078, 0, 1,
-1.579155, 0.5461389, -0.7198136, 1, 0.427451, 0, 1,
-1.575987, -0.8879976, -2.491506, 1, 0.4313726, 0, 1,
-1.566493, -0.6220638, -1.986463, 1, 0.4392157, 0, 1,
-1.557308, -0.1876364, -1.568601, 1, 0.4431373, 0, 1,
-1.556593, 1.400101, -3.263279, 1, 0.4509804, 0, 1,
-1.523698, 0.6852885, -0.4184353, 1, 0.454902, 0, 1,
-1.503719, -2.393571, -1.912166, 1, 0.4627451, 0, 1,
-1.49853, -0.3655115, -1.6788, 1, 0.4666667, 0, 1,
-1.492999, 0.4287267, -1.363046, 1, 0.4745098, 0, 1,
-1.490423, 0.2581054, -0.8596384, 1, 0.4784314, 0, 1,
-1.483323, -0.921504, -2.14626, 1, 0.4862745, 0, 1,
-1.48064, -0.1554608, -1.133286, 1, 0.4901961, 0, 1,
-1.476727, -0.7504205, -0.2564154, 1, 0.4980392, 0, 1,
-1.475122, -0.06336188, -1.839096, 1, 0.5058824, 0, 1,
-1.470985, 0.6321575, 0.2648384, 1, 0.509804, 0, 1,
-1.467316, -1.389974, -2.410079, 1, 0.5176471, 0, 1,
-1.465252, 0.03814242, -0.8012539, 1, 0.5215687, 0, 1,
-1.463568, -0.6771945, -2.546002, 1, 0.5294118, 0, 1,
-1.448433, 0.7899907, -0.06059481, 1, 0.5333334, 0, 1,
-1.43946, -1.505007, -2.802323, 1, 0.5411765, 0, 1,
-1.438757, 0.8040916, -0.652159, 1, 0.5450981, 0, 1,
-1.437505, 2.293502, 0.4923428, 1, 0.5529412, 0, 1,
-1.435203, -0.6214849, -1.976762, 1, 0.5568628, 0, 1,
-1.432078, 0.687504, -0.6719677, 1, 0.5647059, 0, 1,
-1.431268, 1.494754, -0.4058268, 1, 0.5686275, 0, 1,
-1.427107, 0.8279797, -0.0728333, 1, 0.5764706, 0, 1,
-1.421244, -0.9414055, -1.235475, 1, 0.5803922, 0, 1,
-1.419879, -1.082032, -1.789932, 1, 0.5882353, 0, 1,
-1.419168, -1.431331, -1.587838, 1, 0.5921569, 0, 1,
-1.412344, -0.8359557, -1.932919, 1, 0.6, 0, 1,
-1.406035, -0.731131, -0.517291, 1, 0.6078432, 0, 1,
-1.405687, -1.735798, -2.274496, 1, 0.6117647, 0, 1,
-1.404648, -1.749079, -0.9857127, 1, 0.6196079, 0, 1,
-1.398147, 0.6293982, -3.097739, 1, 0.6235294, 0, 1,
-1.396494, 0.8179238, -1.852238, 1, 0.6313726, 0, 1,
-1.388598, 0.2945882, -1.443551, 1, 0.6352941, 0, 1,
-1.377084, -0.03585362, -2.019376, 1, 0.6431373, 0, 1,
-1.367975, 0.9167768, -1.905935, 1, 0.6470588, 0, 1,
-1.362657, -2.549783, -1.737324, 1, 0.654902, 0, 1,
-1.361596, 0.4209647, -2.051764, 1, 0.6588235, 0, 1,
-1.360871, -0.09126663, -1.283064, 1, 0.6666667, 0, 1,
-1.358553, 0.7601907, -1.583187, 1, 0.6705883, 0, 1,
-1.356073, -0.2346434, -2.742884, 1, 0.6784314, 0, 1,
-1.352798, 1.340076, -1.877145, 1, 0.682353, 0, 1,
-1.351607, 0.7274849, -0.9409322, 1, 0.6901961, 0, 1,
-1.348851, 0.2722454, -2.233839, 1, 0.6941177, 0, 1,
-1.347824, -0.101435, -4.05021, 1, 0.7019608, 0, 1,
-1.346205, -0.9323354, -1.208969, 1, 0.7098039, 0, 1,
-1.345171, 0.8761255, -2.793738, 1, 0.7137255, 0, 1,
-1.336636, 0.1925006, -1.572713, 1, 0.7215686, 0, 1,
-1.334162, 0.3930021, -1.699764, 1, 0.7254902, 0, 1,
-1.333475, -0.6345925, -1.308227, 1, 0.7333333, 0, 1,
-1.328765, 0.9280568, 0.1110627, 1, 0.7372549, 0, 1,
-1.317306, 2.304644, -2.385083, 1, 0.7450981, 0, 1,
-1.303817, -0.5656855, -2.028015, 1, 0.7490196, 0, 1,
-1.302138, -1.703375, -2.411051, 1, 0.7568628, 0, 1,
-1.298919, -0.6395981, -2.900385, 1, 0.7607843, 0, 1,
-1.297988, 1.062914, 0.2271382, 1, 0.7686275, 0, 1,
-1.289886, -0.776505, -2.675343, 1, 0.772549, 0, 1,
-1.284909, -1.777583, -1.899348, 1, 0.7803922, 0, 1,
-1.279814, -0.06844207, -3.357999, 1, 0.7843137, 0, 1,
-1.267554, -0.6537611, -1.159423, 1, 0.7921569, 0, 1,
-1.264099, 1.155815, -0.9191217, 1, 0.7960784, 0, 1,
-1.26142, 0.8055459, -1.625191, 1, 0.8039216, 0, 1,
-1.260651, -0.7105385, -1.41412, 1, 0.8117647, 0, 1,
-1.257539, 0.4006259, -1.048558, 1, 0.8156863, 0, 1,
-1.256293, 0.5318608, -0.365409, 1, 0.8235294, 0, 1,
-1.246768, 1.638682, -0.3945193, 1, 0.827451, 0, 1,
-1.24615, -0.4261026, -0.501937, 1, 0.8352941, 0, 1,
-1.243933, -0.9480429, -0.6436689, 1, 0.8392157, 0, 1,
-1.243354, -1.462903, -1.385758, 1, 0.8470588, 0, 1,
-1.221097, 0.4303921, 0.7490922, 1, 0.8509804, 0, 1,
-1.221061, 0.8882512, -0.4309047, 1, 0.8588235, 0, 1,
-1.217205, 0.620501, -1.266808, 1, 0.8627451, 0, 1,
-1.213958, 0.2650024, -2.979162, 1, 0.8705882, 0, 1,
-1.212795, 0.8308122, -1.564831, 1, 0.8745098, 0, 1,
-1.209057, -0.6480488, -3.791989, 1, 0.8823529, 0, 1,
-1.201134, -0.8332008, -1.442954, 1, 0.8862745, 0, 1,
-1.19729, -0.9942063, -2.443641, 1, 0.8941177, 0, 1,
-1.193228, -0.1005207, 0.08541701, 1, 0.8980392, 0, 1,
-1.17767, -1.3006, -2.956919, 1, 0.9058824, 0, 1,
-1.17327, 0.1027147, -1.712742, 1, 0.9137255, 0, 1,
-1.170882, -0.5196009, -2.206891, 1, 0.9176471, 0, 1,
-1.169181, 1.647815, 0.05373716, 1, 0.9254902, 0, 1,
-1.165858, -0.7948846, -2.678097, 1, 0.9294118, 0, 1,
-1.159095, 0.7986509, -0.656305, 1, 0.9372549, 0, 1,
-1.155164, 1.217899, 0.5331138, 1, 0.9411765, 0, 1,
-1.150694, -1.481925, -2.460123, 1, 0.9490196, 0, 1,
-1.14862, 1.37078, -0.7560582, 1, 0.9529412, 0, 1,
-1.147319, -1.070908, -2.724795, 1, 0.9607843, 0, 1,
-1.146133, 0.8259829, 0.5887722, 1, 0.9647059, 0, 1,
-1.143675, -0.2295712, -2.267462, 1, 0.972549, 0, 1,
-1.143157, 0.9983008, -1.473618, 1, 0.9764706, 0, 1,
-1.142739, -0.06834, -0.8900689, 1, 0.9843137, 0, 1,
-1.136945, 0.6403124, -0.2759811, 1, 0.9882353, 0, 1,
-1.134533, -0.02821991, -3.586853, 1, 0.9960784, 0, 1,
-1.134269, 0.1728127, -1.556702, 0.9960784, 1, 0, 1,
-1.124438, 0.1578638, -2.021952, 0.9921569, 1, 0, 1,
-1.124007, 0.07838149, -0.9246272, 0.9843137, 1, 0, 1,
-1.121376, 0.4839195, -0.9492131, 0.9803922, 1, 0, 1,
-1.10958, 0.6362625, -0.09241185, 0.972549, 1, 0, 1,
-1.109098, 1.164335, -0.7778165, 0.9686275, 1, 0, 1,
-1.096524, 0.4635751, 0.1351106, 0.9607843, 1, 0, 1,
-1.091213, -0.6282058, -1.952995, 0.9568627, 1, 0, 1,
-1.089811, 0.996932, -1.764786, 0.9490196, 1, 0, 1,
-1.084348, -1.244591, -2.314224, 0.945098, 1, 0, 1,
-1.071128, -0.5676612, -1.315084, 0.9372549, 1, 0, 1,
-1.071012, -1.129643, -2.968835, 0.9333333, 1, 0, 1,
-1.063898, 0.4851512, -3.281185, 0.9254902, 1, 0, 1,
-1.062156, -0.004406272, -2.032476, 0.9215686, 1, 0, 1,
-1.037393, 0.2389569, -2.651107, 0.9137255, 1, 0, 1,
-1.035599, 0.3634234, 0.2819018, 0.9098039, 1, 0, 1,
-1.023439, -0.4128897, -0.1187862, 0.9019608, 1, 0, 1,
-1.014222, -0.3051897, -1.39774, 0.8941177, 1, 0, 1,
-1.014213, 1.052605, -0.4552419, 0.8901961, 1, 0, 1,
-1.005705, -0.01172523, -2.409618, 0.8823529, 1, 0, 1,
-1.004854, 0.1098484, -1.046909, 0.8784314, 1, 0, 1,
-0.9992399, -1.275125, -2.18732, 0.8705882, 1, 0, 1,
-0.9960513, -0.7366407, -1.590136, 0.8666667, 1, 0, 1,
-0.9916695, 2.041869, -0.09836614, 0.8588235, 1, 0, 1,
-0.9885263, -0.6656134, -2.251924, 0.854902, 1, 0, 1,
-0.9870284, -0.1656916, -2.502409, 0.8470588, 1, 0, 1,
-0.9765868, 1.233651, -0.4777267, 0.8431373, 1, 0, 1,
-0.9753391, -0.1441453, -0.9919292, 0.8352941, 1, 0, 1,
-0.9715916, -0.5138564, -3.196686, 0.8313726, 1, 0, 1,
-0.9691198, -0.01265463, -2.205621, 0.8235294, 1, 0, 1,
-0.9688508, -1.996731, -2.117633, 0.8196079, 1, 0, 1,
-0.9683697, -0.2202784, -1.235717, 0.8117647, 1, 0, 1,
-0.968137, -0.9157585, -3.023959, 0.8078431, 1, 0, 1,
-0.9663996, 0.8185449, -1.416654, 0.8, 1, 0, 1,
-0.9654575, -2.152127, -0.7855437, 0.7921569, 1, 0, 1,
-0.9627429, -0.4182144, -1.383722, 0.7882353, 1, 0, 1,
-0.9576543, -2.107532, -2.093796, 0.7803922, 1, 0, 1,
-0.9564545, -0.07404714, -1.866706, 0.7764706, 1, 0, 1,
-0.9430235, -1.511529, -1.740392, 0.7686275, 1, 0, 1,
-0.9346786, -0.7506974, -1.806288, 0.7647059, 1, 0, 1,
-0.9342626, 1.08331, -2.039311, 0.7568628, 1, 0, 1,
-0.9337287, 0.8550173, -2.0957, 0.7529412, 1, 0, 1,
-0.9293075, -1.002691, -2.749052, 0.7450981, 1, 0, 1,
-0.9230669, -0.3116137, -2.387877, 0.7411765, 1, 0, 1,
-0.9169446, -1.099296, -0.6488754, 0.7333333, 1, 0, 1,
-0.9167963, 1.293198, -0.3455919, 0.7294118, 1, 0, 1,
-0.9135596, 0.893665, -0.2765785, 0.7215686, 1, 0, 1,
-0.9132101, -0.09556034, -1.425598, 0.7176471, 1, 0, 1,
-0.9060738, -0.6811301, -2.5963, 0.7098039, 1, 0, 1,
-0.8998438, 1.213267, -1.860092, 0.7058824, 1, 0, 1,
-0.8940761, -0.2348146, -0.6553623, 0.6980392, 1, 0, 1,
-0.8915532, -0.2577876, -0.03597752, 0.6901961, 1, 0, 1,
-0.8892686, 0.199094, -1.077552, 0.6862745, 1, 0, 1,
-0.8887319, 0.1640326, -1.606441, 0.6784314, 1, 0, 1,
-0.8845809, -1.451622, -2.152129, 0.6745098, 1, 0, 1,
-0.8811649, 0.0971322, -1.779204, 0.6666667, 1, 0, 1,
-0.8764929, -0.7600957, -2.025015, 0.6627451, 1, 0, 1,
-0.8718113, -1.752732, -2.520917, 0.654902, 1, 0, 1,
-0.8633222, 0.9192241, -0.2988756, 0.6509804, 1, 0, 1,
-0.8627618, 3.071547, 1.094341, 0.6431373, 1, 0, 1,
-0.8586802, -1.662819, -2.42169, 0.6392157, 1, 0, 1,
-0.8529977, -0.4242107, -1.770783, 0.6313726, 1, 0, 1,
-0.8510569, -2.013809, -2.100959, 0.627451, 1, 0, 1,
-0.8496464, -0.4466814, -2.112101, 0.6196079, 1, 0, 1,
-0.8485712, 0.4599715, -1.630916, 0.6156863, 1, 0, 1,
-0.8469168, -2.402942, -2.898947, 0.6078432, 1, 0, 1,
-0.8466315, -0.4351113, -0.9242939, 0.6039216, 1, 0, 1,
-0.8447968, -1.476604, -1.522887, 0.5960785, 1, 0, 1,
-0.841374, -0.9170573, -2.993849, 0.5882353, 1, 0, 1,
-0.833701, -0.1032553, -1.172105, 0.5843138, 1, 0, 1,
-0.8329443, 0.6197368, -0.9041791, 0.5764706, 1, 0, 1,
-0.8322337, 1.021658, -2.134237, 0.572549, 1, 0, 1,
-0.8138654, 0.09438469, -0.4916886, 0.5647059, 1, 0, 1,
-0.8125488, -0.4640155, -2.264897, 0.5607843, 1, 0, 1,
-0.8084518, 0.3909152, -0.6435935, 0.5529412, 1, 0, 1,
-0.8035524, 0.09646956, -0.6324599, 0.5490196, 1, 0, 1,
-0.7952138, -0.9252641, -2.796873, 0.5411765, 1, 0, 1,
-0.7942886, 1.721874, 0.3058974, 0.5372549, 1, 0, 1,
-0.7938984, 0.3884189, -0.5667332, 0.5294118, 1, 0, 1,
-0.7936317, -0.02839358, -0.8840638, 0.5254902, 1, 0, 1,
-0.789811, 0.9853516, -0.6463998, 0.5176471, 1, 0, 1,
-0.778587, -1.12227, -1.772354, 0.5137255, 1, 0, 1,
-0.7782575, -0.5323463, -1.917416, 0.5058824, 1, 0, 1,
-0.7772513, -0.05829078, -2.947437, 0.5019608, 1, 0, 1,
-0.7730382, 0.0216253, -3.229181, 0.4941176, 1, 0, 1,
-0.7728783, -0.6994763, -2.607343, 0.4862745, 1, 0, 1,
-0.770251, 0.5557579, -2.320688, 0.4823529, 1, 0, 1,
-0.7695179, -1.18633, -3.279168, 0.4745098, 1, 0, 1,
-0.7690759, -0.1468561, -1.86737, 0.4705882, 1, 0, 1,
-0.7608935, -0.2648491, -0.08166748, 0.4627451, 1, 0, 1,
-0.7596415, 0.1198194, -0.3774993, 0.4588235, 1, 0, 1,
-0.7588754, -0.1657119, -0.4650977, 0.4509804, 1, 0, 1,
-0.7582165, -0.3271044, -3.644219, 0.4470588, 1, 0, 1,
-0.7570449, 0.3137059, -0.2955487, 0.4392157, 1, 0, 1,
-0.7553996, 1.095136, -0.7172887, 0.4352941, 1, 0, 1,
-0.7552444, -0.366636, -2.417194, 0.427451, 1, 0, 1,
-0.7526624, 0.5659883, -1.085333, 0.4235294, 1, 0, 1,
-0.7493794, 0.4018912, -1.283811, 0.4156863, 1, 0, 1,
-0.7435204, -1.377782, -3.191954, 0.4117647, 1, 0, 1,
-0.7410809, -1.432505, -2.857445, 0.4039216, 1, 0, 1,
-0.7398801, -0.5752592, -2.692008, 0.3960784, 1, 0, 1,
-0.739416, -0.4070512, -2.427803, 0.3921569, 1, 0, 1,
-0.7381919, 0.3289499, -1.222533, 0.3843137, 1, 0, 1,
-0.73679, -1.053805, -2.680473, 0.3803922, 1, 0, 1,
-0.7330651, 0.2286403, -1.435656, 0.372549, 1, 0, 1,
-0.727433, 1.537879, -1.345068, 0.3686275, 1, 0, 1,
-0.7263342, 1.649384, -0.789413, 0.3607843, 1, 0, 1,
-0.7192674, 0.089241, -1.215913, 0.3568628, 1, 0, 1,
-0.715889, -0.857991, -3.194235, 0.3490196, 1, 0, 1,
-0.7150381, -1.322417, -0.3545401, 0.345098, 1, 0, 1,
-0.7091702, 1.119404, -0.698378, 0.3372549, 1, 0, 1,
-0.7089193, -0.06215554, -1.313652, 0.3333333, 1, 0, 1,
-0.7088178, -0.08669151, -2.611871, 0.3254902, 1, 0, 1,
-0.7085063, -0.7809259, -1.67152, 0.3215686, 1, 0, 1,
-0.7059304, 1.447819, -1.794633, 0.3137255, 1, 0, 1,
-0.6896265, 0.1851148, -2.062101, 0.3098039, 1, 0, 1,
-0.6872945, 1.160119, -0.5943699, 0.3019608, 1, 0, 1,
-0.6847337, -0.347115, -0.07178177, 0.2941177, 1, 0, 1,
-0.6755373, 0.02446399, -3.05274, 0.2901961, 1, 0, 1,
-0.6731175, -1.358838, -2.160298, 0.282353, 1, 0, 1,
-0.6720706, -0.1307625, -2.641127, 0.2784314, 1, 0, 1,
-0.6706904, -1.56517, -3.388283, 0.2705882, 1, 0, 1,
-0.6706544, 0.1094645, -2.523263, 0.2666667, 1, 0, 1,
-0.6668233, 0.3508877, -0.3166694, 0.2588235, 1, 0, 1,
-0.6658239, 0.6008573, -1.199064, 0.254902, 1, 0, 1,
-0.6640054, 0.6935117, -1.024278, 0.2470588, 1, 0, 1,
-0.6616494, -0.6788217, -4.394373, 0.2431373, 1, 0, 1,
-0.6594218, -0.003692735, -0.178085, 0.2352941, 1, 0, 1,
-0.6578269, 0.536166, -1.055971, 0.2313726, 1, 0, 1,
-0.6572286, 1.073035, -0.3846191, 0.2235294, 1, 0, 1,
-0.6549706, -0.1120109, -0.7849441, 0.2196078, 1, 0, 1,
-0.6545364, 1.175511, -1.908934, 0.2117647, 1, 0, 1,
-0.6510695, 0.9860687, 0.3158729, 0.2078431, 1, 0, 1,
-0.6489689, 0.4102638, -2.242592, 0.2, 1, 0, 1,
-0.6477231, 1.530829, -1.354612, 0.1921569, 1, 0, 1,
-0.6474479, 0.2560848, 0.1865845, 0.1882353, 1, 0, 1,
-0.6447109, -0.7643047, -3.282519, 0.1803922, 1, 0, 1,
-0.6442842, -0.04246813, -1.163895, 0.1764706, 1, 0, 1,
-0.6423327, -1.254977, -2.652688, 0.1686275, 1, 0, 1,
-0.641505, -0.521306, -1.707466, 0.1647059, 1, 0, 1,
-0.6399553, 0.3221167, -1.761034, 0.1568628, 1, 0, 1,
-0.6374155, -0.006058073, -0.6641921, 0.1529412, 1, 0, 1,
-0.6334143, 0.7059656, 0.3337252, 0.145098, 1, 0, 1,
-0.6324062, 0.6440461, -0.4925066, 0.1411765, 1, 0, 1,
-0.6262468, 0.01826703, -1.329907, 0.1333333, 1, 0, 1,
-0.6261429, 0.5757594, 0.06626438, 0.1294118, 1, 0, 1,
-0.6236032, 0.5457645, -1.324055, 0.1215686, 1, 0, 1,
-0.6015085, 0.07488643, -2.799869, 0.1176471, 1, 0, 1,
-0.5900015, -0.8369435, -3.001018, 0.1098039, 1, 0, 1,
-0.5889651, 1.124704, -0.7948405, 0.1058824, 1, 0, 1,
-0.5854138, 0.213895, -0.5843308, 0.09803922, 1, 0, 1,
-0.581551, 0.443291, -1.428965, 0.09019608, 1, 0, 1,
-0.5730084, 0.6763662, -1.904397, 0.08627451, 1, 0, 1,
-0.5711497, 1.652193, -0.4990504, 0.07843138, 1, 0, 1,
-0.5674704, 1.748067, -0.08259921, 0.07450981, 1, 0, 1,
-0.5657772, -1.004616, -3.221769, 0.06666667, 1, 0, 1,
-0.5630233, -0.2579952, -2.002922, 0.0627451, 1, 0, 1,
-0.5609914, -1.823681, -1.92568, 0.05490196, 1, 0, 1,
-0.5507973, 0.2314176, -2.026247, 0.05098039, 1, 0, 1,
-0.5471396, 0.1586143, -2.135254, 0.04313726, 1, 0, 1,
-0.546092, 0.3171426, -0.2415602, 0.03921569, 1, 0, 1,
-0.5456166, 0.7393719, -0.395219, 0.03137255, 1, 0, 1,
-0.545517, 0.6997227, -1.646294, 0.02745098, 1, 0, 1,
-0.5405548, 0.4076231, -1.279007, 0.01960784, 1, 0, 1,
-0.537065, 0.7700737, -0.344541, 0.01568628, 1, 0, 1,
-0.5354193, -1.095487, -3.550486, 0.007843138, 1, 0, 1,
-0.5347965, 1.368021, -2.738097, 0.003921569, 1, 0, 1,
-0.5305095, 0.06897618, 0.5821453, 0, 1, 0.003921569, 1,
-0.5288889, -1.268718, -2.299046, 0, 1, 0.01176471, 1,
-0.5277119, -0.6014089, -2.555871, 0, 1, 0.01568628, 1,
-0.5238764, -0.8987902, -2.707522, 0, 1, 0.02352941, 1,
-0.5119352, -0.9363189, -3.851327, 0, 1, 0.02745098, 1,
-0.5118012, -0.0640338, -1.125758, 0, 1, 0.03529412, 1,
-0.5075085, 0.7463086, -0.7850199, 0, 1, 0.03921569, 1,
-0.5026625, 0.6003518, -0.9936531, 0, 1, 0.04705882, 1,
-0.4979294, 0.8478994, -0.9321042, 0, 1, 0.05098039, 1,
-0.4969957, 0.7272563, -1.526446, 0, 1, 0.05882353, 1,
-0.4923135, 0.2520585, -0.6781451, 0, 1, 0.0627451, 1,
-0.4858027, 0.7178585, -2.500167, 0, 1, 0.07058824, 1,
-0.4815914, 0.5374209, -2.820314, 0, 1, 0.07450981, 1,
-0.4801624, 2.019482, 0.3684112, 0, 1, 0.08235294, 1,
-0.4773883, 0.5097964, -1.483593, 0, 1, 0.08627451, 1,
-0.4758486, 0.865271, -0.3953526, 0, 1, 0.09411765, 1,
-0.4659288, -0.1655864, -0.9733002, 0, 1, 0.1019608, 1,
-0.4635247, -1.086228, -2.161109, 0, 1, 0.1058824, 1,
-0.4621697, 1.164983, 1.539714, 0, 1, 0.1137255, 1,
-0.461736, -0.2886756, -1.787737, 0, 1, 0.1176471, 1,
-0.4572594, 1.022165, 0.7089112, 0, 1, 0.1254902, 1,
-0.454786, 0.7295768, 0.3385812, 0, 1, 0.1294118, 1,
-0.451989, -1.260874, -3.162219, 0, 1, 0.1372549, 1,
-0.4515771, 2.303471, -1.100621, 0, 1, 0.1411765, 1,
-0.4482127, 0.9058654, 0.5220097, 0, 1, 0.1490196, 1,
-0.4427599, -0.10083, -1.674891, 0, 1, 0.1529412, 1,
-0.4350299, -0.8251272, -3.607298, 0, 1, 0.1607843, 1,
-0.4251446, -0.2444664, -1.134351, 0, 1, 0.1647059, 1,
-0.4240939, 0.2506037, -0.5963766, 0, 1, 0.172549, 1,
-0.4238367, 0.04063017, -1.639368, 0, 1, 0.1764706, 1,
-0.420693, 0.3378789, -0.3293815, 0, 1, 0.1843137, 1,
-0.4202324, 2.070488, -1.035281, 0, 1, 0.1882353, 1,
-0.4198905, -0.337267, -1.423477, 0, 1, 0.1960784, 1,
-0.4125985, 0.6404426, 0.109738, 0, 1, 0.2039216, 1,
-0.411383, 0.9028699, -0.3371518, 0, 1, 0.2078431, 1,
-0.4103609, 0.7370449, -0.450712, 0, 1, 0.2156863, 1,
-0.4083995, -0.1125437, -1.896034, 0, 1, 0.2196078, 1,
-0.4027428, -0.8598618, -2.91174, 0, 1, 0.227451, 1,
-0.4019857, 0.1036943, -2.51102, 0, 1, 0.2313726, 1,
-0.4014068, 0.08116006, -0.825744, 0, 1, 0.2392157, 1,
-0.3947026, 0.06001154, -1.876839, 0, 1, 0.2431373, 1,
-0.3891735, 1.93904, -0.04672215, 0, 1, 0.2509804, 1,
-0.3871771, -0.1055516, -1.913405, 0, 1, 0.254902, 1,
-0.3861733, -0.6563048, -3.024561, 0, 1, 0.2627451, 1,
-0.3854852, -0.2782303, -3.115091, 0, 1, 0.2666667, 1,
-0.3843191, 1.000408, 0.7337976, 0, 1, 0.2745098, 1,
-0.3814912, 0.3530779, -1.114098, 0, 1, 0.2784314, 1,
-0.3712862, 0.3948708, 0.01100682, 0, 1, 0.2862745, 1,
-0.3658567, -2.346307, -2.450518, 0, 1, 0.2901961, 1,
-0.3652728, -0.1178169, -3.40542, 0, 1, 0.2980392, 1,
-0.3539416, -2.026642, -3.802458, 0, 1, 0.3058824, 1,
-0.3522817, 1.412579, 0.2367584, 0, 1, 0.3098039, 1,
-0.3509264, -0.6343415, -1.28571, 0, 1, 0.3176471, 1,
-0.3504516, 1.078472, 0.5063835, 0, 1, 0.3215686, 1,
-0.3503674, 0.7818491, -0.8527139, 0, 1, 0.3294118, 1,
-0.3502438, 0.8851854, 1.904036, 0, 1, 0.3333333, 1,
-0.3487177, 1.75833, 0.4125839, 0, 1, 0.3411765, 1,
-0.3484268, 0.7370801, -0.4156001, 0, 1, 0.345098, 1,
-0.3384847, -1.623244, -3.248791, 0, 1, 0.3529412, 1,
-0.338419, 0.2312508, 0.6593933, 0, 1, 0.3568628, 1,
-0.3326848, 0.403669, -0.6318803, 0, 1, 0.3647059, 1,
-0.3266834, -0.3167551, -1.22706, 0, 1, 0.3686275, 1,
-0.3259485, 0.2819246, -2.616031, 0, 1, 0.3764706, 1,
-0.3249891, 0.473192, 0.1623569, 0, 1, 0.3803922, 1,
-0.3237195, -0.948342, -2.92975, 0, 1, 0.3882353, 1,
-0.3231156, 0.2088185, 0.128021, 0, 1, 0.3921569, 1,
-0.3195384, 0.4868847, -3.041531, 0, 1, 0.4, 1,
-0.3136262, 2.068278, -0.1736425, 0, 1, 0.4078431, 1,
-0.3128871, 0.5719016, -1.746048, 0, 1, 0.4117647, 1,
-0.3118351, -0.3066526, -1.642018, 0, 1, 0.4196078, 1,
-0.3070548, 1.214533, -0.5245761, 0, 1, 0.4235294, 1,
-0.3058999, 0.5930005, -0.6147155, 0, 1, 0.4313726, 1,
-0.3057356, 0.3815292, -1.658377, 0, 1, 0.4352941, 1,
-0.3052889, -2.121454, -3.957248, 0, 1, 0.4431373, 1,
-0.3022217, -2.395591, -3.531767, 0, 1, 0.4470588, 1,
-0.2984177, 0.6955306, 0.5934026, 0, 1, 0.454902, 1,
-0.293021, 0.7148153, 0.4536701, 0, 1, 0.4588235, 1,
-0.2903925, -0.7636687, -3.887046, 0, 1, 0.4666667, 1,
-0.2902143, -0.151162, -2.461171, 0, 1, 0.4705882, 1,
-0.2894254, -0.3966908, -1.77521, 0, 1, 0.4784314, 1,
-0.2844271, 0.5086596, -1.664005, 0, 1, 0.4823529, 1,
-0.2839613, 0.2873797, -1.788182, 0, 1, 0.4901961, 1,
-0.2829341, -1.840248, -2.645324, 0, 1, 0.4941176, 1,
-0.282056, -0.5007156, -2.761303, 0, 1, 0.5019608, 1,
-0.2808041, -1.473413, -3.733517, 0, 1, 0.509804, 1,
-0.277744, 0.06057266, -2.554979, 0, 1, 0.5137255, 1,
-0.275712, 1.444214, 2.622202, 0, 1, 0.5215687, 1,
-0.2756001, -1.775224, -1.577767, 0, 1, 0.5254902, 1,
-0.2741122, -1.127491, -2.706577, 0, 1, 0.5333334, 1,
-0.2730575, -0.3712533, -2.849372, 0, 1, 0.5372549, 1,
-0.2712858, 0.2730984, -2.424615, 0, 1, 0.5450981, 1,
-0.2658669, -0.05726697, -0.6585507, 0, 1, 0.5490196, 1,
-0.2609824, 1.156518, -1.269255, 0, 1, 0.5568628, 1,
-0.2608639, 1.291117, -0.8510888, 0, 1, 0.5607843, 1,
-0.2606793, -0.8660455, -5.138607, 0, 1, 0.5686275, 1,
-0.2606181, -0.09788604, -2.438131, 0, 1, 0.572549, 1,
-0.2587334, -0.07269578, -1.370279, 0, 1, 0.5803922, 1,
-0.2581469, 0.09492311, -0.3595617, 0, 1, 0.5843138, 1,
-0.2576277, 2.0432, -0.06393385, 0, 1, 0.5921569, 1,
-0.2565024, 0.08162943, -0.4975456, 0, 1, 0.5960785, 1,
-0.255859, 0.3713568, 0.8936265, 0, 1, 0.6039216, 1,
-0.2549927, -1.703776, -2.060272, 0, 1, 0.6117647, 1,
-0.2544016, -0.4476919, -3.314466, 0, 1, 0.6156863, 1,
-0.2485482, 1.105321, -1.257085, 0, 1, 0.6235294, 1,
-0.2437907, -0.5727662, -3.17009, 0, 1, 0.627451, 1,
-0.2422958, -1.087913, -3.260345, 0, 1, 0.6352941, 1,
-0.2398857, -1.419518, -4.245862, 0, 1, 0.6392157, 1,
-0.239606, 0.6649731, 0.3309906, 0, 1, 0.6470588, 1,
-0.2371905, 0.214467, 0.4216856, 0, 1, 0.6509804, 1,
-0.2315546, 2.298409, -0.03398138, 0, 1, 0.6588235, 1,
-0.2289666, -1.210208, -3.720289, 0, 1, 0.6627451, 1,
-0.2274039, 1.166144, -0.1479314, 0, 1, 0.6705883, 1,
-0.2260606, 0.2866763, -0.4817134, 0, 1, 0.6745098, 1,
-0.225299, 0.09720025, -2.278431, 0, 1, 0.682353, 1,
-0.2247157, -1.121811, -2.771252, 0, 1, 0.6862745, 1,
-0.2195812, 1.657936, 0.6716889, 0, 1, 0.6941177, 1,
-0.2189834, 0.8734748, 1.007667, 0, 1, 0.7019608, 1,
-0.2156682, 0.4731533, -0.373369, 0, 1, 0.7058824, 1,
-0.215303, 0.3608803, -0.9738896, 0, 1, 0.7137255, 1,
-0.2148574, -0.7038298, -5.355196, 0, 1, 0.7176471, 1,
-0.2125481, 0.2177935, -1.051018, 0, 1, 0.7254902, 1,
-0.2114429, -0.437665, -3.314152, 0, 1, 0.7294118, 1,
-0.2106821, 0.3053873, -0.1356283, 0, 1, 0.7372549, 1,
-0.2092242, 1.014332, -1.662842, 0, 1, 0.7411765, 1,
-0.2064846, 0.5465954, -1.375053, 0, 1, 0.7490196, 1,
-0.2057006, -1.375452, -3.950038, 0, 1, 0.7529412, 1,
-0.2055764, 0.8140149, -0.352532, 0, 1, 0.7607843, 1,
-0.1987063, -0.5154442, -3.231906, 0, 1, 0.7647059, 1,
-0.1984982, -0.3320421, -1.324388, 0, 1, 0.772549, 1,
-0.1980648, -0.7185112, -3.208081, 0, 1, 0.7764706, 1,
-0.1923593, 0.6805676, -0.8749015, 0, 1, 0.7843137, 1,
-0.1893133, 1.001928, 0.6018026, 0, 1, 0.7882353, 1,
-0.1844274, -1.153665, -2.276123, 0, 1, 0.7960784, 1,
-0.1821465, -1.710295, -3.411916, 0, 1, 0.8039216, 1,
-0.1816111, -0.5077253, -3.054263, 0, 1, 0.8078431, 1,
-0.1810493, -0.1732406, -2.922892, 0, 1, 0.8156863, 1,
-0.1803393, 0.9594249, -1.305562, 0, 1, 0.8196079, 1,
-0.1778934, -0.009400378, -2.328734, 0, 1, 0.827451, 1,
-0.1748178, 0.5480805, 0.7699425, 0, 1, 0.8313726, 1,
-0.1726971, -0.03037951, -0.3459185, 0, 1, 0.8392157, 1,
-0.1700701, -1.199509, -4.615908, 0, 1, 0.8431373, 1,
-0.1680004, 0.1263469, -1.680055, 0, 1, 0.8509804, 1,
-0.164076, 0.2346307, -0.365127, 0, 1, 0.854902, 1,
-0.1590743, -0.4438852, -3.424037, 0, 1, 0.8627451, 1,
-0.1579725, -1.20152, -3.09609, 0, 1, 0.8666667, 1,
-0.1569305, -0.5709417, -3.850943, 0, 1, 0.8745098, 1,
-0.1554686, -0.6447679, -3.643959, 0, 1, 0.8784314, 1,
-0.150776, -0.1909118, -4.992205, 0, 1, 0.8862745, 1,
-0.142394, -1.973577, -2.417095, 0, 1, 0.8901961, 1,
-0.1387028, -0.9283357, -3.634945, 0, 1, 0.8980392, 1,
-0.134219, -0.3723508, -2.671376, 0, 1, 0.9058824, 1,
-0.1334069, 0.2221358, -2.860686, 0, 1, 0.9098039, 1,
-0.1331926, 1.169264, 0.852247, 0, 1, 0.9176471, 1,
-0.1310441, -0.4406525, -5.268754, 0, 1, 0.9215686, 1,
-0.1208, -0.2638862, -4.264826, 0, 1, 0.9294118, 1,
-0.1196158, 2.489724, -0.2431492, 0, 1, 0.9333333, 1,
-0.11474, -0.7312278, -2.639153, 0, 1, 0.9411765, 1,
-0.1135785, 1.929729, -0.3230946, 0, 1, 0.945098, 1,
-0.112813, -0.4009366, -2.461315, 0, 1, 0.9529412, 1,
-0.09160206, 1.020613, -0.3990045, 0, 1, 0.9568627, 1,
-0.08770973, -0.5595971, -3.166169, 0, 1, 0.9647059, 1,
-0.08604379, -1.516508, -3.515194, 0, 1, 0.9686275, 1,
-0.0821911, -0.5683627, -2.36945, 0, 1, 0.9764706, 1,
-0.07963654, -1.339145, -3.352368, 0, 1, 0.9803922, 1,
-0.07732602, 0.5857216, -0.446551, 0, 1, 0.9882353, 1,
-0.07458752, 1.468974, -1.215174, 0, 1, 0.9921569, 1,
-0.07387943, -2.407317, -1.244407, 0, 1, 1, 1,
-0.06968601, -0.2089817, -1.561721, 0, 0.9921569, 1, 1,
-0.06771072, 1.038976, -0.348231, 0, 0.9882353, 1, 1,
-0.05884123, 1.072807, -0.370796, 0, 0.9803922, 1, 1,
-0.05848381, -1.461581, -1.206807, 0, 0.9764706, 1, 1,
-0.05767512, 0.5368649, -0.5766379, 0, 0.9686275, 1, 1,
-0.0468406, -0.6872866, -1.536521, 0, 0.9647059, 1, 1,
-0.04550407, -1.262362, -3.192177, 0, 0.9568627, 1, 1,
-0.04347745, 0.1081009, -1.026996, 0, 0.9529412, 1, 1,
-0.04175554, -0.5873423, -3.206286, 0, 0.945098, 1, 1,
-0.03740082, 0.964655, -0.5412278, 0, 0.9411765, 1, 1,
-0.02862284, -0.209398, -2.74688, 0, 0.9333333, 1, 1,
-0.02706309, -0.8610345, -2.436218, 0, 0.9294118, 1, 1,
-0.02592014, -1.20581, -2.610099, 0, 0.9215686, 1, 1,
-0.02448315, 0.1118616, 0.2211465, 0, 0.9176471, 1, 1,
-0.02112148, -1.438127, -3.212937, 0, 0.9098039, 1, 1,
-0.02082062, -1.029571, -4.298989, 0, 0.9058824, 1, 1,
-0.02032191, 1.091613, 0.08504802, 0, 0.8980392, 1, 1,
-0.01925021, 1.692724, -0.8430032, 0, 0.8901961, 1, 1,
-0.01767222, -0.9425477, -3.746352, 0, 0.8862745, 1, 1,
-0.01610396, -0.6867639, -2.922357, 0, 0.8784314, 1, 1,
-0.01584986, 2.73127, -0.05285469, 0, 0.8745098, 1, 1,
-0.01327013, -2.388408, -4.087147, 0, 0.8666667, 1, 1,
-0.01298566, -0.2624888, -3.085871, 0, 0.8627451, 1, 1,
-0.006293868, 0.9660612, -0.7552636, 0, 0.854902, 1, 1,
-0.005877083, 1.191674, -0.1634491, 0, 0.8509804, 1, 1,
-0.00517358, 0.1375071, 0.2709265, 0, 0.8431373, 1, 1,
-0.004910543, -2.168378, -1.623051, 0, 0.8392157, 1, 1,
0.004904673, 0.2549703, -2.480828, 0, 0.8313726, 1, 1,
0.005758327, 2.058046, -0.4460598, 0, 0.827451, 1, 1,
0.009382903, 1.899328, 0.8463188, 0, 0.8196079, 1, 1,
0.01002483, -0.5709874, 3.630931, 0, 0.8156863, 1, 1,
0.0143736, 0.4047682, 0.7675286, 0, 0.8078431, 1, 1,
0.01897762, 0.9760194, 1.555909, 0, 0.8039216, 1, 1,
0.02215469, -0.6755974, 2.450172, 0, 0.7960784, 1, 1,
0.02657502, -0.04370838, 3.0146, 0, 0.7882353, 1, 1,
0.04182877, -0.7901089, 2.637893, 0, 0.7843137, 1, 1,
0.04933993, -0.34328, 2.379771, 0, 0.7764706, 1, 1,
0.05025515, -0.6542427, 4.19842, 0, 0.772549, 1, 1,
0.05092095, -0.6402097, 3.134915, 0, 0.7647059, 1, 1,
0.05256896, -1.049053, 2.92774, 0, 0.7607843, 1, 1,
0.05267939, -0.7595212, 3.356053, 0, 0.7529412, 1, 1,
0.0591126, -0.2342989, 3.64466, 0, 0.7490196, 1, 1,
0.05931306, -0.9402858, 2.577937, 0, 0.7411765, 1, 1,
0.06045589, -0.7669172, 4.509365, 0, 0.7372549, 1, 1,
0.06097392, 0.6341606, -0.267766, 0, 0.7294118, 1, 1,
0.06564304, -1.187069, 1.279943, 0, 0.7254902, 1, 1,
0.06594291, -0.5501007, 2.087047, 0, 0.7176471, 1, 1,
0.06927451, 0.70272, -1.300243, 0, 0.7137255, 1, 1,
0.0716808, -0.4331391, 2.860056, 0, 0.7058824, 1, 1,
0.07545658, 0.1799871, -0.2298553, 0, 0.6980392, 1, 1,
0.08210456, -0.8241141, 3.127521, 0, 0.6941177, 1, 1,
0.08331542, 0.8162334, -0.3521698, 0, 0.6862745, 1, 1,
0.08544034, -0.03713332, 1.559776, 0, 0.682353, 1, 1,
0.09394074, 0.3658391, 2.192401, 0, 0.6745098, 1, 1,
0.09980498, -0.4539866, 3.181711, 0, 0.6705883, 1, 1,
0.1047381, 0.1979961, 0.9062552, 0, 0.6627451, 1, 1,
0.106531, 0.06689038, 1.036401, 0, 0.6588235, 1, 1,
0.107321, 2.307352, -0.9236668, 0, 0.6509804, 1, 1,
0.1084194, 0.4611108, 1.927854, 0, 0.6470588, 1, 1,
0.1102513, -0.8091888, 2.435271, 0, 0.6392157, 1, 1,
0.1117839, 1.441038, 0.2958232, 0, 0.6352941, 1, 1,
0.1147704, 0.789458, -0.08704494, 0, 0.627451, 1, 1,
0.1170572, 0.6740334, -2.166256, 0, 0.6235294, 1, 1,
0.1176629, -0.3717479, 3.227998, 0, 0.6156863, 1, 1,
0.1192216, -1.100766, 3.149126, 0, 0.6117647, 1, 1,
0.1196914, -0.01248626, 2.656512, 0, 0.6039216, 1, 1,
0.1299904, 2.304356, -1.547698, 0, 0.5960785, 1, 1,
0.1320515, -0.2790664, 2.335023, 0, 0.5921569, 1, 1,
0.1350994, -0.1028169, 2.816764, 0, 0.5843138, 1, 1,
0.1372344, -3.079456, 3.676015, 0, 0.5803922, 1, 1,
0.1390469, 0.5887558, 0.1664591, 0, 0.572549, 1, 1,
0.1407194, 0.6601328, 0.07973184, 0, 0.5686275, 1, 1,
0.1436291, -0.6066268, 2.920666, 0, 0.5607843, 1, 1,
0.1437632, -0.1202027, 1.13061, 0, 0.5568628, 1, 1,
0.1481177, 0.02580975, 0.7344497, 0, 0.5490196, 1, 1,
0.1492631, -0.1324759, 2.936572, 0, 0.5450981, 1, 1,
0.1523945, 2.00402, 1.418095, 0, 0.5372549, 1, 1,
0.1562615, 0.3755068, 1.255945, 0, 0.5333334, 1, 1,
0.1574294, 0.7438305, -0.1678901, 0, 0.5254902, 1, 1,
0.1586791, 1.411717, 1.925543, 0, 0.5215687, 1, 1,
0.1618447, 0.5943922, 1.518763, 0, 0.5137255, 1, 1,
0.1649575, -0.5847066, 0.6762809, 0, 0.509804, 1, 1,
0.1667477, -1.692914, 1.379924, 0, 0.5019608, 1, 1,
0.1682921, 0.811308, 0.4018096, 0, 0.4941176, 1, 1,
0.1684404, 2.137911, 0.6556481, 0, 0.4901961, 1, 1,
0.1717197, 0.5743557, 0.6358558, 0, 0.4823529, 1, 1,
0.1745819, -0.6522995, 2.11492, 0, 0.4784314, 1, 1,
0.1764587, 0.710272, 0.7821004, 0, 0.4705882, 1, 1,
0.1838874, 0.4373748, -0.7553999, 0, 0.4666667, 1, 1,
0.1840159, 1.260964, -0.2556072, 0, 0.4588235, 1, 1,
0.1935235, -0.634038, 4.519313, 0, 0.454902, 1, 1,
0.1966528, -1.355823, 5.520323, 0, 0.4470588, 1, 1,
0.1979517, 1.068785, 1.212417, 0, 0.4431373, 1, 1,
0.1985954, -0.8567992, 2.633836, 0, 0.4352941, 1, 1,
0.200041, -0.6636828, 1.777485, 0, 0.4313726, 1, 1,
0.201276, -0.321526, 1.954676, 0, 0.4235294, 1, 1,
0.20147, 1.185523, -1.392043, 0, 0.4196078, 1, 1,
0.2026184, 0.1066607, -0.7376007, 0, 0.4117647, 1, 1,
0.2044569, 1.600375, -0.2919052, 0, 0.4078431, 1, 1,
0.2073612, 0.7729313, -1.715199, 0, 0.4, 1, 1,
0.2084435, 1.436628, -1.159944, 0, 0.3921569, 1, 1,
0.2102991, -0.2582551, 0.7396921, 0, 0.3882353, 1, 1,
0.2123809, -1.00217, 2.846204, 0, 0.3803922, 1, 1,
0.2126707, -0.7469667, 1.695676, 0, 0.3764706, 1, 1,
0.213944, 0.375795, 1.443958, 0, 0.3686275, 1, 1,
0.215877, 1.036525, 0.737287, 0, 0.3647059, 1, 1,
0.2160576, -0.1234652, 3.57988, 0, 0.3568628, 1, 1,
0.2184025, -0.7848514, 2.633371, 0, 0.3529412, 1, 1,
0.2201587, -0.2630166, 2.79587, 0, 0.345098, 1, 1,
0.2236648, 0.4580937, -0.5339938, 0, 0.3411765, 1, 1,
0.2257385, -1.095091, 3.056702, 0, 0.3333333, 1, 1,
0.2269632, -0.8443567, 1.776425, 0, 0.3294118, 1, 1,
0.2295292, -0.6395741, 4.104634, 0, 0.3215686, 1, 1,
0.2320041, -1.33874, 4.922161, 0, 0.3176471, 1, 1,
0.2331709, -0.1328908, 1.627145, 0, 0.3098039, 1, 1,
0.2339653, 2.10472, -1.185488, 0, 0.3058824, 1, 1,
0.235046, -0.7838853, 4.730371, 0, 0.2980392, 1, 1,
0.2393605, 0.3043229, 1.195207, 0, 0.2901961, 1, 1,
0.2417423, -1.517306, 3.100096, 0, 0.2862745, 1, 1,
0.2429412, -1.651059, 2.903234, 0, 0.2784314, 1, 1,
0.2431105, -0.7042417, 2.430792, 0, 0.2745098, 1, 1,
0.2599224, 0.2849451, 0.8966519, 0, 0.2666667, 1, 1,
0.2606172, 0.7661123, 0.7959334, 0, 0.2627451, 1, 1,
0.2676888, -0.7509896, 3.390774, 0, 0.254902, 1, 1,
0.2701395, -0.6428842, 2.600343, 0, 0.2509804, 1, 1,
0.2707219, -1.343985, 4.487719, 0, 0.2431373, 1, 1,
0.270932, -1.193739, 4.649251, 0, 0.2392157, 1, 1,
0.2825775, -1.142138, 3.91084, 0, 0.2313726, 1, 1,
0.2854957, 0.3089311, -0.5223693, 0, 0.227451, 1, 1,
0.2872429, 0.4494433, -0.4934281, 0, 0.2196078, 1, 1,
0.2874615, 0.1488265, 0.2787977, 0, 0.2156863, 1, 1,
0.2906615, -1.520305, 2.093559, 0, 0.2078431, 1, 1,
0.2910703, -0.352727, 3.039348, 0, 0.2039216, 1, 1,
0.2953652, -1.258687, 2.283503, 0, 0.1960784, 1, 1,
0.2970753, 0.8717664, 1.536697, 0, 0.1882353, 1, 1,
0.3003614, -0.5007876, 1.230158, 0, 0.1843137, 1, 1,
0.3038184, -0.9260504, 2.882136, 0, 0.1764706, 1, 1,
0.3067192, 1.142587, 0.5364357, 0, 0.172549, 1, 1,
0.3112276, -0.5674344, 2.048965, 0, 0.1647059, 1, 1,
0.3115102, -0.4061648, -0.1690443, 0, 0.1607843, 1, 1,
0.3140273, 0.737955, -1.130203, 0, 0.1529412, 1, 1,
0.3142282, -0.562534, 3.40286, 0, 0.1490196, 1, 1,
0.3161137, -2.313646, 3.017413, 0, 0.1411765, 1, 1,
0.3175077, 0.6724337, 0.2755497, 0, 0.1372549, 1, 1,
0.3223897, -0.7596128, 3.143809, 0, 0.1294118, 1, 1,
0.3228858, 0.2092415, 0.2957752, 0, 0.1254902, 1, 1,
0.3233615, 1.046544, -1.354964, 0, 0.1176471, 1, 1,
0.3264152, -1.115516, 2.582392, 0, 0.1137255, 1, 1,
0.3303535, 0.3351225, 0.268911, 0, 0.1058824, 1, 1,
0.3336912, 1.599739, 1.652267, 0, 0.09803922, 1, 1,
0.3380177, -1.2234, 3.115525, 0, 0.09411765, 1, 1,
0.3424063, 0.05654201, 1.889108, 0, 0.08627451, 1, 1,
0.3440569, 0.1562321, 1.466408, 0, 0.08235294, 1, 1,
0.3445167, -1.09219, 4.24739, 0, 0.07450981, 1, 1,
0.3472917, -1.399073, 3.196471, 0, 0.07058824, 1, 1,
0.3500239, -0.6727628, 3.624598, 0, 0.0627451, 1, 1,
0.3521497, 0.1810898, -0.5729732, 0, 0.05882353, 1, 1,
0.3530052, 0.7369636, 0.3773779, 0, 0.05098039, 1, 1,
0.3539025, -0.1115433, 1.757807, 0, 0.04705882, 1, 1,
0.3562852, -0.3530037, 3.113965, 0, 0.03921569, 1, 1,
0.357046, -0.1523015, 2.747763, 0, 0.03529412, 1, 1,
0.3607827, -0.749573, 2.128079, 0, 0.02745098, 1, 1,
0.3659186, -0.4923451, 2.108431, 0, 0.02352941, 1, 1,
0.3685328, -1.188636, 2.855816, 0, 0.01568628, 1, 1,
0.38037, -0.03163998, 1.849856, 0, 0.01176471, 1, 1,
0.3815081, 1.122149, 1.007585, 0, 0.003921569, 1, 1,
0.3868442, -1.499771, 3.677297, 0.003921569, 0, 1, 1,
0.3897951, 1.318096, -1.071384, 0.007843138, 0, 1, 1,
0.3900713, -0.2473842, 2.049515, 0.01568628, 0, 1, 1,
0.3945449, -0.2380429, 0.3863945, 0.01960784, 0, 1, 1,
0.3954395, 0.5757492, 1.806244, 0.02745098, 0, 1, 1,
0.3958219, -0.8105785, 2.25182, 0.03137255, 0, 1, 1,
0.3960458, -0.00504472, 1.72384, 0.03921569, 0, 1, 1,
0.3962243, 0.03042109, 0.9117433, 0.04313726, 0, 1, 1,
0.4048066, 0.1895391, 0.9293169, 0.05098039, 0, 1, 1,
0.4123876, 1.019441, -0.07705718, 0.05490196, 0, 1, 1,
0.4135197, -0.1093113, 0.458304, 0.0627451, 0, 1, 1,
0.4193925, -1.088241, 2.343106, 0.06666667, 0, 1, 1,
0.4217169, 1.188241, 0.06564176, 0.07450981, 0, 1, 1,
0.4284187, 1.389453, 0.7304867, 0.07843138, 0, 1, 1,
0.4292335, -0.6727248, 1.926355, 0.08627451, 0, 1, 1,
0.4301519, 1.521052, -0.5910249, 0.09019608, 0, 1, 1,
0.4358435, -1.227956, 2.854216, 0.09803922, 0, 1, 1,
0.4397491, 0.4256403, 2.432182, 0.1058824, 0, 1, 1,
0.4415033, -0.435541, 3.277675, 0.1098039, 0, 1, 1,
0.4439087, 1.388009, 1.567399, 0.1176471, 0, 1, 1,
0.4449649, 0.4597574, -0.1479033, 0.1215686, 0, 1, 1,
0.4466833, -2.796696, 4.519532, 0.1294118, 0, 1, 1,
0.4468088, -0.1013119, 3.119647, 0.1333333, 0, 1, 1,
0.4474498, -1.034375, 0.6757737, 0.1411765, 0, 1, 1,
0.448004, -1.085565, 3.811749, 0.145098, 0, 1, 1,
0.4483551, 1.645189, -0.3489776, 0.1529412, 0, 1, 1,
0.4493818, 0.820741, -0.1671136, 0.1568628, 0, 1, 1,
0.4499091, 0.6539469, 0.6623239, 0.1647059, 0, 1, 1,
0.4528558, 0.08199791, 0.9134469, 0.1686275, 0, 1, 1,
0.4531814, -0.604329, 2.316023, 0.1764706, 0, 1, 1,
0.4536354, 0.08661098, 0.3333535, 0.1803922, 0, 1, 1,
0.4537894, 0.7699692, -0.7733198, 0.1882353, 0, 1, 1,
0.4560974, 0.8651325, 0.7856575, 0.1921569, 0, 1, 1,
0.4571462, 1.940241, 0.6562789, 0.2, 0, 1, 1,
0.465446, 0.0422332, 1.047998, 0.2078431, 0, 1, 1,
0.4743505, -1.250591, 2.233279, 0.2117647, 0, 1, 1,
0.4749214, 0.1708211, 0.02821787, 0.2196078, 0, 1, 1,
0.4761675, 0.8931327, -0.3439495, 0.2235294, 0, 1, 1,
0.4772229, 1.140872, 0.7157146, 0.2313726, 0, 1, 1,
0.4816284, -1.641294, 1.980268, 0.2352941, 0, 1, 1,
0.4836337, 2.148262, 0.9781402, 0.2431373, 0, 1, 1,
0.4871193, 0.9048792, 0.7245876, 0.2470588, 0, 1, 1,
0.4893406, -1.324484, 1.977439, 0.254902, 0, 1, 1,
0.4910579, -2.07036, 2.853745, 0.2588235, 0, 1, 1,
0.4910794, -0.9165232, 4.142914, 0.2666667, 0, 1, 1,
0.4915367, 1.662704, 0.159293, 0.2705882, 0, 1, 1,
0.4945558, -0.6114304, 1.511435, 0.2784314, 0, 1, 1,
0.5010672, 1.384868, 0.954478, 0.282353, 0, 1, 1,
0.5020571, 0.5073333, 0.01047222, 0.2901961, 0, 1, 1,
0.5022057, 0.1348525, 2.58227, 0.2941177, 0, 1, 1,
0.5143211, -0.1273858, 1.764605, 0.3019608, 0, 1, 1,
0.5182565, 1.4171, -0.9572012, 0.3098039, 0, 1, 1,
0.5204259, -0.4088864, 3.401725, 0.3137255, 0, 1, 1,
0.5225704, 0.08284166, 2.814555, 0.3215686, 0, 1, 1,
0.5251765, -0.2127969, 2.385324, 0.3254902, 0, 1, 1,
0.5259957, 0.5334831, 1.300625, 0.3333333, 0, 1, 1,
0.5286994, -0.1626814, 3.250473, 0.3372549, 0, 1, 1,
0.5330542, 0.515388, -0.1109787, 0.345098, 0, 1, 1,
0.5375208, 0.3013875, 0.06201595, 0.3490196, 0, 1, 1,
0.5407194, 1.605683, 0.4152693, 0.3568628, 0, 1, 1,
0.5420812, 1.37608, 2.14486, 0.3607843, 0, 1, 1,
0.5486212, 0.04137648, 3.869706, 0.3686275, 0, 1, 1,
0.5494509, 2.197593, 0.4250943, 0.372549, 0, 1, 1,
0.5506008, -0.4937979, 3.020471, 0.3803922, 0, 1, 1,
0.55091, -1.034419, 2.763745, 0.3843137, 0, 1, 1,
0.5556591, -1.530141, 1.202826, 0.3921569, 0, 1, 1,
0.5615108, 0.07660666, 1.173051, 0.3960784, 0, 1, 1,
0.584822, -1.188771, 2.414979, 0.4039216, 0, 1, 1,
0.5858854, 0.5151123, 1.110844, 0.4117647, 0, 1, 1,
0.5898976, -1.613093, 3.729324, 0.4156863, 0, 1, 1,
0.5946103, -0.5229487, 1.603064, 0.4235294, 0, 1, 1,
0.5960327, -0.06455029, 0.2259066, 0.427451, 0, 1, 1,
0.5986605, -0.2065838, 1.415244, 0.4352941, 0, 1, 1,
0.6060989, -0.9807442, 2.360591, 0.4392157, 0, 1, 1,
0.607104, 0.4664489, 1.962832, 0.4470588, 0, 1, 1,
0.6071667, 0.03115808, 2.12949, 0.4509804, 0, 1, 1,
0.6130189, 0.7359884, 1.87018, 0.4588235, 0, 1, 1,
0.6187218, -0.522489, 3.610126, 0.4627451, 0, 1, 1,
0.6216899, -0.4944999, 1.925774, 0.4705882, 0, 1, 1,
0.6232386, -2.587919, 3.977182, 0.4745098, 0, 1, 1,
0.6232488, -1.995386, 1.268255, 0.4823529, 0, 1, 1,
0.6261811, 0.4310887, -0.1015796, 0.4862745, 0, 1, 1,
0.6263742, -0.811551, 1.139929, 0.4941176, 0, 1, 1,
0.6376523, 0.5328522, 1.34319, 0.5019608, 0, 1, 1,
0.6377441, -1.333297, 3.952774, 0.5058824, 0, 1, 1,
0.6461734, -0.1705595, 2.760236, 0.5137255, 0, 1, 1,
0.6471041, -0.3460979, 2.489097, 0.5176471, 0, 1, 1,
0.6499859, 2.150434, -0.9055998, 0.5254902, 0, 1, 1,
0.6506801, -0.6925128, 2.690967, 0.5294118, 0, 1, 1,
0.6518953, -1.246222, 3.140827, 0.5372549, 0, 1, 1,
0.6586277, -0.6598239, 2.345047, 0.5411765, 0, 1, 1,
0.6587172, 0.07967182, 1.135529, 0.5490196, 0, 1, 1,
0.664144, -0.9848536, 3.825885, 0.5529412, 0, 1, 1,
0.6760494, 0.05252751, 1.895217, 0.5607843, 0, 1, 1,
0.6785424, -0.745803, 2.238026, 0.5647059, 0, 1, 1,
0.6799657, -0.01441314, -0.1279207, 0.572549, 0, 1, 1,
0.6809844, 0.4653936, 0.4273581, 0.5764706, 0, 1, 1,
0.6889578, -0.1358417, 2.085037, 0.5843138, 0, 1, 1,
0.6905422, 1.11862, 0.2125694, 0.5882353, 0, 1, 1,
0.6909853, 0.1720607, 0.82426, 0.5960785, 0, 1, 1,
0.6918961, -0.6031811, 1.916177, 0.6039216, 0, 1, 1,
0.6948621, 2.323116, -0.4404494, 0.6078432, 0, 1, 1,
0.6972893, -2.273448, 3.952695, 0.6156863, 0, 1, 1,
0.697768, -2.197522, 3.370215, 0.6196079, 0, 1, 1,
0.6995341, 0.6321812, 1.691164, 0.627451, 0, 1, 1,
0.7101955, -1.068553, 3.04579, 0.6313726, 0, 1, 1,
0.7116547, 0.1427269, 0.8553856, 0.6392157, 0, 1, 1,
0.7132438, -0.4767697, -1.210167, 0.6431373, 0, 1, 1,
0.7145348, -1.273312, 3.275322, 0.6509804, 0, 1, 1,
0.7171157, 0.1192475, 0.6059659, 0.654902, 0, 1, 1,
0.7231498, 0.4106053, 0.2515937, 0.6627451, 0, 1, 1,
0.7262887, 0.2297616, 0.386526, 0.6666667, 0, 1, 1,
0.7359377, -2.281222, 1.120166, 0.6745098, 0, 1, 1,
0.7363893, -0.7886682, 2.166708, 0.6784314, 0, 1, 1,
0.7373686, 0.8969192, 0.01495427, 0.6862745, 0, 1, 1,
0.7375984, 1.084734, -0.1682328, 0.6901961, 0, 1, 1,
0.7397352, -0.6050178, 2.004705, 0.6980392, 0, 1, 1,
0.7418327, -0.1930442, 2.049858, 0.7058824, 0, 1, 1,
0.7446783, 1.116986, 1.716984, 0.7098039, 0, 1, 1,
0.7500927, -0.305341, 1.352364, 0.7176471, 0, 1, 1,
0.755207, -0.5583152, 1.326253, 0.7215686, 0, 1, 1,
0.7553533, 0.4914446, 0.4629757, 0.7294118, 0, 1, 1,
0.7589082, 0.9656793, 0.3211481, 0.7333333, 0, 1, 1,
0.7610613, -1.059449, 1.291037, 0.7411765, 0, 1, 1,
0.7691625, 0.3807496, 1.362516, 0.7450981, 0, 1, 1,
0.7738091, -0.7659016, 3.300015, 0.7529412, 0, 1, 1,
0.7740108, 0.6460057, 0.8427164, 0.7568628, 0, 1, 1,
0.7827901, -0.2953973, 3.887714, 0.7647059, 0, 1, 1,
0.7837414, -0.4567026, 3.168048, 0.7686275, 0, 1, 1,
0.7913967, -0.8732439, 2.723578, 0.7764706, 0, 1, 1,
0.7932501, 1.243286, -0.1952608, 0.7803922, 0, 1, 1,
0.7940586, 0.4339674, 0.9820726, 0.7882353, 0, 1, 1,
0.7959141, -0.5137784, 1.725234, 0.7921569, 0, 1, 1,
0.7962224, 1.529482, 1.253579, 0.8, 0, 1, 1,
0.8026254, -0.5894079, 1.867513, 0.8078431, 0, 1, 1,
0.8033941, 0.6669754, 0.3641865, 0.8117647, 0, 1, 1,
0.8055014, 0.4941112, 0.6385719, 0.8196079, 0, 1, 1,
0.8060305, 0.6745405, 1.130605, 0.8235294, 0, 1, 1,
0.8123058, -0.9923936, 3.85046, 0.8313726, 0, 1, 1,
0.8129445, 0.7828234, 1.806107, 0.8352941, 0, 1, 1,
0.8223802, 1.051242, -0.3127369, 0.8431373, 0, 1, 1,
0.8232994, -1.010061, 2.325128, 0.8470588, 0, 1, 1,
0.82895, -0.7764223, 1.882206, 0.854902, 0, 1, 1,
0.8289666, -0.1424246, 3.297344, 0.8588235, 0, 1, 1,
0.837308, 1.006758, 0.5873361, 0.8666667, 0, 1, 1,
0.8391385, -1.255259, 3.312789, 0.8705882, 0, 1, 1,
0.8403842, -1.307108, 1.837338, 0.8784314, 0, 1, 1,
0.8411636, 0.4372533, -0.03334539, 0.8823529, 0, 1, 1,
0.8430132, -1.029546, 1.848931, 0.8901961, 0, 1, 1,
0.8437703, 0.5739056, 3.387563, 0.8941177, 0, 1, 1,
0.8437915, 1.406952, 0.1831048, 0.9019608, 0, 1, 1,
0.8507866, -0.9350563, 2.088821, 0.9098039, 0, 1, 1,
0.8510938, 0.5120344, 2.373943, 0.9137255, 0, 1, 1,
0.8511098, -0.05665826, 1.191178, 0.9215686, 0, 1, 1,
0.8518157, 0.2901628, 1.727179, 0.9254902, 0, 1, 1,
0.8564563, 0.1806568, 0.5816541, 0.9333333, 0, 1, 1,
0.8570284, 2.052379, -1.06809, 0.9372549, 0, 1, 1,
0.8572344, 0.3244942, 0.9808837, 0.945098, 0, 1, 1,
0.8575959, -1.356138, 1.930442, 0.9490196, 0, 1, 1,
0.8609715, 1.922418, 1.315127, 0.9568627, 0, 1, 1,
0.8653691, 0.9681407, 0.4170868, 0.9607843, 0, 1, 1,
0.8745193, -0.5993245, 2.908916, 0.9686275, 0, 1, 1,
0.8777906, -0.6637852, 1.460717, 0.972549, 0, 1, 1,
0.8809659, -1.252182, 3.453147, 0.9803922, 0, 1, 1,
0.8844587, 0.5657507, 0.07271586, 0.9843137, 0, 1, 1,
0.8856542, 1.254264, -0.1741871, 0.9921569, 0, 1, 1,
0.8934877, -0.2478341, 3.174376, 0.9960784, 0, 1, 1,
0.8936169, 0.921927, 1.919215, 1, 0, 0.9960784, 1,
0.8958923, -0.7698753, 2.614321, 1, 0, 0.9882353, 1,
0.8970296, -0.9616579, 2.185464, 1, 0, 0.9843137, 1,
0.8995577, 0.2008152, 2.389816, 1, 0, 0.9764706, 1,
0.9020128, -0.4670872, 0.4382492, 1, 0, 0.972549, 1,
0.9025649, 0.7932944, 0.9925016, 1, 0, 0.9647059, 1,
0.9078499, 0.3225915, 2.359171, 1, 0, 0.9607843, 1,
0.9108284, 0.05153657, 1.169117, 1, 0, 0.9529412, 1,
0.9127827, -0.9307782, 2.346395, 1, 0, 0.9490196, 1,
0.9152747, 0.934164, -0.2941039, 1, 0, 0.9411765, 1,
0.9287029, 0.8624957, 2.001789, 1, 0, 0.9372549, 1,
0.9415917, -1.883249, 1.057873, 1, 0, 0.9294118, 1,
0.9515982, -0.1009271, 1.282967, 1, 0, 0.9254902, 1,
0.9554837, 0.5287761, 2.688553, 1, 0, 0.9176471, 1,
0.9560839, 1.468545, 0.2089079, 1, 0, 0.9137255, 1,
0.9567451, 0.9196073, 1.131548, 1, 0, 0.9058824, 1,
0.9584765, 0.1978896, 1.12008, 1, 0, 0.9019608, 1,
0.9603147, 1.968019, 2.026905, 1, 0, 0.8941177, 1,
0.9607881, -0.01431131, 2.419863, 1, 0, 0.8862745, 1,
0.9610399, 0.5087606, 0.6893019, 1, 0, 0.8823529, 1,
0.9744569, -0.8967599, 1.692958, 1, 0, 0.8745098, 1,
0.9812213, 0.7309572, 1.727488, 1, 0, 0.8705882, 1,
0.9899613, 0.7148612, 1.290286, 1, 0, 0.8627451, 1,
0.9931609, 0.01218409, 0.1002697, 1, 0, 0.8588235, 1,
0.9971474, 0.6065151, -0.3824607, 1, 0, 0.8509804, 1,
1.006101, 0.2050493, 0.5153553, 1, 0, 0.8470588, 1,
1.01144, 0.40804, -0.3299959, 1, 0, 0.8392157, 1,
1.017013, -1.557374, 2.126905, 1, 0, 0.8352941, 1,
1.017632, 0.5260493, 1.656376, 1, 0, 0.827451, 1,
1.023167, 1.865153, -1.719488, 1, 0, 0.8235294, 1,
1.0315, 2.255688, 1.563812, 1, 0, 0.8156863, 1,
1.034574, 0.0679377, 2.228003, 1, 0, 0.8117647, 1,
1.046124, -2.308094, -0.1845193, 1, 0, 0.8039216, 1,
1.048134, 0.7163575, -0.8478121, 1, 0, 0.7960784, 1,
1.060419, -0.6357654, 2.495616, 1, 0, 0.7921569, 1,
1.061749, -0.6085013, 2.733014, 1, 0, 0.7843137, 1,
1.062741, -0.6782175, 2.498024, 1, 0, 0.7803922, 1,
1.068948, -0.02429992, 2.856859, 1, 0, 0.772549, 1,
1.075838, 0.940876, -0.9487544, 1, 0, 0.7686275, 1,
1.07594, -0.9999028, 2.270457, 1, 0, 0.7607843, 1,
1.07621, 0.7956349, 1.257461, 1, 0, 0.7568628, 1,
1.084577, 0.05040637, -0.5106735, 1, 0, 0.7490196, 1,
1.08915, -0.5012806, 2.888013, 1, 0, 0.7450981, 1,
1.091701, -1.59547, 3.408328, 1, 0, 0.7372549, 1,
1.121094, 1.804928, -0.8109142, 1, 0, 0.7333333, 1,
1.1359, -1.675536, 2.278506, 1, 0, 0.7254902, 1,
1.142552, -1.367027, 2.994091, 1, 0, 0.7215686, 1,
1.144676, -0.003099485, 0.9741421, 1, 0, 0.7137255, 1,
1.150903, -0.1181287, 1.836035, 1, 0, 0.7098039, 1,
1.153886, -2.071592, 2.104008, 1, 0, 0.7019608, 1,
1.15597, -2.228643, 2.976581, 1, 0, 0.6941177, 1,
1.16168, 0.3887813, 0.8513607, 1, 0, 0.6901961, 1,
1.167414, 0.2355211, 1.483315, 1, 0, 0.682353, 1,
1.172549, -2.031992, -0.1099947, 1, 0, 0.6784314, 1,
1.172973, -0.1159785, 1.661858, 1, 0, 0.6705883, 1,
1.178358, -0.6473289, 0.961754, 1, 0, 0.6666667, 1,
1.186266, -0.4878829, 0.5290029, 1, 0, 0.6588235, 1,
1.191632, 1.828071, 2.10731, 1, 0, 0.654902, 1,
1.198574, -0.7794366, 2.357868, 1, 0, 0.6470588, 1,
1.204533, -0.0182566, 1.73115, 1, 0, 0.6431373, 1,
1.210542, -1.148356, 2.364493, 1, 0, 0.6352941, 1,
1.212668, -0.8877636, 1.021937, 1, 0, 0.6313726, 1,
1.223515, -0.2099936, 1.237942, 1, 0, 0.6235294, 1,
1.224257, -1.494781, 1.313896, 1, 0, 0.6196079, 1,
1.225879, 1.43101, 0.9967192, 1, 0, 0.6117647, 1,
1.228216, -1.269108, 2.223566, 1, 0, 0.6078432, 1,
1.233969, -0.4354953, 2.685429, 1, 0, 0.6, 1,
1.236619, 0.7493582, 1.534541, 1, 0, 0.5921569, 1,
1.237486, 1.68289, 1.029189, 1, 0, 0.5882353, 1,
1.239956, 0.2228643, -0.703416, 1, 0, 0.5803922, 1,
1.255673, 0.4542833, 0.5741305, 1, 0, 0.5764706, 1,
1.260931, 0.8970852, 0.2861894, 1, 0, 0.5686275, 1,
1.268442, 0.8576176, -0.028539, 1, 0, 0.5647059, 1,
1.268482, 0.2413538, 1.372102, 1, 0, 0.5568628, 1,
1.270964, -0.007354308, 2.818742, 1, 0, 0.5529412, 1,
1.276861, -1.67809, 3.936984, 1, 0, 0.5450981, 1,
1.277382, 0.08093044, 1.271101, 1, 0, 0.5411765, 1,
1.28053, 0.404687, 1.940213, 1, 0, 0.5333334, 1,
1.287848, -0.8541576, 1.383548, 1, 0, 0.5294118, 1,
1.291371, 0.2515921, 1.936779, 1, 0, 0.5215687, 1,
1.297752, -0.2727374, 3.103421, 1, 0, 0.5176471, 1,
1.311697, 0.5296829, -0.2641605, 1, 0, 0.509804, 1,
1.32068, -0.1694903, 1.484545, 1, 0, 0.5058824, 1,
1.332664, -1.357703, 2.333515, 1, 0, 0.4980392, 1,
1.360105, -0.604643, 1.628114, 1, 0, 0.4901961, 1,
1.362042, 0.3574783, -0.5686375, 1, 0, 0.4862745, 1,
1.37044, 0.04444912, 1.718623, 1, 0, 0.4784314, 1,
1.372214, 1.908737, 0.3388428, 1, 0, 0.4745098, 1,
1.380408, -1.335168, 3.343133, 1, 0, 0.4666667, 1,
1.410095, -0.2008476, 1.646448, 1, 0, 0.4627451, 1,
1.410806, 1.79453, 1.245201, 1, 0, 0.454902, 1,
1.411488, 1.987163, -0.840241, 1, 0, 0.4509804, 1,
1.412538, -1.178864, 2.113867, 1, 0, 0.4431373, 1,
1.417477, -4.599218, 3.820395, 1, 0, 0.4392157, 1,
1.427662, -1.443803, 3.207641, 1, 0, 0.4313726, 1,
1.433772, -1.324396, 3.856459, 1, 0, 0.427451, 1,
1.44519, -0.4475186, 0.8205234, 1, 0, 0.4196078, 1,
1.453818, -1.035507, 1.751555, 1, 0, 0.4156863, 1,
1.464859, -0.7823888, 2.645228, 1, 0, 0.4078431, 1,
1.466529, 0.4531212, 1.110084, 1, 0, 0.4039216, 1,
1.473276, 0.6093811, 2.745173, 1, 0, 0.3960784, 1,
1.474693, 0.9149058, 1.475855, 1, 0, 0.3882353, 1,
1.487252, -0.5948057, 1.214033, 1, 0, 0.3843137, 1,
1.490414, 1.023337, 1.226755, 1, 0, 0.3764706, 1,
1.499795, 1.081829, -0.1637995, 1, 0, 0.372549, 1,
1.513232, 0.2925076, 1.899356, 1, 0, 0.3647059, 1,
1.524374, -0.01943964, 1.028646, 1, 0, 0.3607843, 1,
1.525976, -0.3275522, 2.373543, 1, 0, 0.3529412, 1,
1.537479, 0.6449522, 1.059374, 1, 0, 0.3490196, 1,
1.53879, 1.228936, 1.371985, 1, 0, 0.3411765, 1,
1.551833, -1.908828, 4.09746, 1, 0, 0.3372549, 1,
1.554939, -1.154803, 2.1288, 1, 0, 0.3294118, 1,
1.557338, -0.7064878, 3.165294, 1, 0, 0.3254902, 1,
1.560957, -1.634557, 3.8475, 1, 0, 0.3176471, 1,
1.564969, -1.1883, 3.965102, 1, 0, 0.3137255, 1,
1.58253, 0.4258474, 2.439622, 1, 0, 0.3058824, 1,
1.600434, 0.5916517, 1.269372, 1, 0, 0.2980392, 1,
1.60412, 0.4489039, 0.5700004, 1, 0, 0.2941177, 1,
1.613931, 0.3748994, 2.116196, 1, 0, 0.2862745, 1,
1.613941, 1.556689, -0.05805089, 1, 0, 0.282353, 1,
1.621772, 0.9518183, 0.395029, 1, 0, 0.2745098, 1,
1.62794, 0.4163185, 1.846156, 1, 0, 0.2705882, 1,
1.641238, 0.6068043, 3.14243, 1, 0, 0.2627451, 1,
1.664147, 0.1242024, 1.33693, 1, 0, 0.2588235, 1,
1.675892, -2.149558, 2.949279, 1, 0, 0.2509804, 1,
1.679219, -0.2059163, 2.676793, 1, 0, 0.2470588, 1,
1.683034, -0.2521883, 2.0114, 1, 0, 0.2392157, 1,
1.691161, 1.60694, -0.2037182, 1, 0, 0.2352941, 1,
1.691196, 0.06295942, 0.8806257, 1, 0, 0.227451, 1,
1.724718, 0.4795601, 0.4452848, 1, 0, 0.2235294, 1,
1.736962, -1.47583, 1.908477, 1, 0, 0.2156863, 1,
1.744125, -1.949071, 2.342107, 1, 0, 0.2117647, 1,
1.754466, 0.09825371, 2.598574, 1, 0, 0.2039216, 1,
1.768878, -0.5782005, 0.4918453, 1, 0, 0.1960784, 1,
1.78693, -0.2470723, 2.536958, 1, 0, 0.1921569, 1,
1.791224, 0.4186148, 1.640893, 1, 0, 0.1843137, 1,
1.801509, 0.6868279, 2.476691, 1, 0, 0.1803922, 1,
1.812599, -0.1453103, 2.226352, 1, 0, 0.172549, 1,
1.818252, 2.48231, 1.982527, 1, 0, 0.1686275, 1,
1.828879, 0.1325654, 1.544636, 1, 0, 0.1607843, 1,
1.845224, -0.4521996, -0.4332615, 1, 0, 0.1568628, 1,
1.846681, -0.2905806, 2.313055, 1, 0, 0.1490196, 1,
1.850829, 0.1096375, 2.049102, 1, 0, 0.145098, 1,
1.851306, 0.4028922, 2.647932, 1, 0, 0.1372549, 1,
1.858704, 0.7920425, 0.4349687, 1, 0, 0.1333333, 1,
1.878949, -0.1582002, 2.076285, 1, 0, 0.1254902, 1,
1.910403, 0.2016991, 3.540051, 1, 0, 0.1215686, 1,
1.935504, 1.090232, 0.7343081, 1, 0, 0.1137255, 1,
1.993947, -0.529314, 1.371584, 1, 0, 0.1098039, 1,
1.997834, -1.250547, 3.004261, 1, 0, 0.1019608, 1,
2.024354, 0.4999024, 1.167028, 1, 0, 0.09411765, 1,
2.02775, 0.547398, 0.5567134, 1, 0, 0.09019608, 1,
2.049961, 0.6799962, 1.280062, 1, 0, 0.08235294, 1,
2.075232, 0.4921769, 2.54247, 1, 0, 0.07843138, 1,
2.075401, 1.12973, 1.458065, 1, 0, 0.07058824, 1,
2.091507, 0.9574831, 0.7514535, 1, 0, 0.06666667, 1,
2.115449, -0.3715207, 1.305005, 1, 0, 0.05882353, 1,
2.125779, 0.5690476, 1.004257, 1, 0, 0.05490196, 1,
2.130798, 1.296459, 1.792294, 1, 0, 0.04705882, 1,
2.139453, -0.4315633, 1.261203, 1, 0, 0.04313726, 1,
2.161919, 0.7539788, 2.763953, 1, 0, 0.03529412, 1,
2.195049, 0.3234296, 3.329154, 1, 0, 0.03137255, 1,
2.308582, -0.3136302, 0.5311815, 1, 0, 0.02352941, 1,
2.322732, 0.8497182, 1.057974, 1, 0, 0.01960784, 1,
2.352959, -1.267481, 1.237676, 1, 0, 0.01176471, 1,
2.542871, 0.5243689, 1.507645, 1, 0, 0.007843138, 1
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
-0.2694019, -5.899413, -7.198597, 0, -0.5, 0.5, 0.5,
-0.2694019, -5.899413, -7.198597, 1, -0.5, 0.5, 0.5,
-0.2694019, -5.899413, -7.198597, 1, 1.5, 0.5, 0.5,
-0.2694019, -5.899413, -7.198597, 0, 1.5, 0.5, 0.5
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
-4.035035, -0.7638358, -7.198597, 0, -0.5, 0.5, 0.5,
-4.035035, -0.7638358, -7.198597, 1, -0.5, 0.5, 0.5,
-4.035035, -0.7638358, -7.198597, 1, 1.5, 0.5, 0.5,
-4.035035, -0.7638358, -7.198597, 0, 1.5, 0.5, 0.5
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
-4.035035, -5.899413, 0.08256316, 0, -0.5, 0.5, 0.5,
-4.035035, -5.899413, 0.08256316, 1, -0.5, 0.5, 0.5,
-4.035035, -5.899413, 0.08256316, 1, 1.5, 0.5, 0.5,
-4.035035, -5.899413, 0.08256316, 0, 1.5, 0.5, 0.5
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
-3, -4.71428, -5.518329,
2, -4.71428, -5.518329,
-3, -4.71428, -5.518329,
-3, -4.911802, -5.798374,
-2, -4.71428, -5.518329,
-2, -4.911802, -5.798374,
-1, -4.71428, -5.518329,
-1, -4.911802, -5.798374,
0, -4.71428, -5.518329,
0, -4.911802, -5.798374,
1, -4.71428, -5.518329,
1, -4.911802, -5.798374,
2, -4.71428, -5.518329,
2, -4.911802, -5.798374
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
-3, -5.306847, -6.358463, 0, -0.5, 0.5, 0.5,
-3, -5.306847, -6.358463, 1, -0.5, 0.5, 0.5,
-3, -5.306847, -6.358463, 1, 1.5, 0.5, 0.5,
-3, -5.306847, -6.358463, 0, 1.5, 0.5, 0.5,
-2, -5.306847, -6.358463, 0, -0.5, 0.5, 0.5,
-2, -5.306847, -6.358463, 1, -0.5, 0.5, 0.5,
-2, -5.306847, -6.358463, 1, 1.5, 0.5, 0.5,
-2, -5.306847, -6.358463, 0, 1.5, 0.5, 0.5,
-1, -5.306847, -6.358463, 0, -0.5, 0.5, 0.5,
-1, -5.306847, -6.358463, 1, -0.5, 0.5, 0.5,
-1, -5.306847, -6.358463, 1, 1.5, 0.5, 0.5,
-1, -5.306847, -6.358463, 0, 1.5, 0.5, 0.5,
0, -5.306847, -6.358463, 0, -0.5, 0.5, 0.5,
0, -5.306847, -6.358463, 1, -0.5, 0.5, 0.5,
0, -5.306847, -6.358463, 1, 1.5, 0.5, 0.5,
0, -5.306847, -6.358463, 0, 1.5, 0.5, 0.5,
1, -5.306847, -6.358463, 0, -0.5, 0.5, 0.5,
1, -5.306847, -6.358463, 1, -0.5, 0.5, 0.5,
1, -5.306847, -6.358463, 1, 1.5, 0.5, 0.5,
1, -5.306847, -6.358463, 0, 1.5, 0.5, 0.5,
2, -5.306847, -6.358463, 0, -0.5, 0.5, 0.5,
2, -5.306847, -6.358463, 1, -0.5, 0.5, 0.5,
2, -5.306847, -6.358463, 1, 1.5, 0.5, 0.5,
2, -5.306847, -6.358463, 0, 1.5, 0.5, 0.5
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
-3.166043, -4, -5.518329,
-3.166043, 2, -5.518329,
-3.166043, -4, -5.518329,
-3.310874, -4, -5.798374,
-3.166043, -2, -5.518329,
-3.310874, -2, -5.798374,
-3.166043, 0, -5.518329,
-3.310874, 0, -5.798374,
-3.166043, 2, -5.518329,
-3.310874, 2, -5.798374
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
"-4",
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
-3.600538, -4, -6.358463, 0, -0.5, 0.5, 0.5,
-3.600538, -4, -6.358463, 1, -0.5, 0.5, 0.5,
-3.600538, -4, -6.358463, 1, 1.5, 0.5, 0.5,
-3.600538, -4, -6.358463, 0, 1.5, 0.5, 0.5,
-3.600538, -2, -6.358463, 0, -0.5, 0.5, 0.5,
-3.600538, -2, -6.358463, 1, -0.5, 0.5, 0.5,
-3.600538, -2, -6.358463, 1, 1.5, 0.5, 0.5,
-3.600538, -2, -6.358463, 0, 1.5, 0.5, 0.5,
-3.600538, 0, -6.358463, 0, -0.5, 0.5, 0.5,
-3.600538, 0, -6.358463, 1, -0.5, 0.5, 0.5,
-3.600538, 0, -6.358463, 1, 1.5, 0.5, 0.5,
-3.600538, 0, -6.358463, 0, 1.5, 0.5, 0.5,
-3.600538, 2, -6.358463, 0, -0.5, 0.5, 0.5,
-3.600538, 2, -6.358463, 1, -0.5, 0.5, 0.5,
-3.600538, 2, -6.358463, 1, 1.5, 0.5, 0.5,
-3.600538, 2, -6.358463, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.166043, -4.71428, -4,
-3.166043, -4.71428, 4,
-3.166043, -4.71428, -4,
-3.310874, -4.911802, -4,
-3.166043, -4.71428, -2,
-3.310874, -4.911802, -2,
-3.166043, -4.71428, 0,
-3.310874, -4.911802, 0,
-3.166043, -4.71428, 2,
-3.310874, -4.911802, 2,
-3.166043, -4.71428, 4,
-3.310874, -4.911802, 4
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
-3.600538, -5.306847, -4, 0, -0.5, 0.5, 0.5,
-3.600538, -5.306847, -4, 1, -0.5, 0.5, 0.5,
-3.600538, -5.306847, -4, 1, 1.5, 0.5, 0.5,
-3.600538, -5.306847, -4, 0, 1.5, 0.5, 0.5,
-3.600538, -5.306847, -2, 0, -0.5, 0.5, 0.5,
-3.600538, -5.306847, -2, 1, -0.5, 0.5, 0.5,
-3.600538, -5.306847, -2, 1, 1.5, 0.5, 0.5,
-3.600538, -5.306847, -2, 0, 1.5, 0.5, 0.5,
-3.600538, -5.306847, 0, 0, -0.5, 0.5, 0.5,
-3.600538, -5.306847, 0, 1, -0.5, 0.5, 0.5,
-3.600538, -5.306847, 0, 1, 1.5, 0.5, 0.5,
-3.600538, -5.306847, 0, 0, 1.5, 0.5, 0.5,
-3.600538, -5.306847, 2, 0, -0.5, 0.5, 0.5,
-3.600538, -5.306847, 2, 1, -0.5, 0.5, 0.5,
-3.600538, -5.306847, 2, 1, 1.5, 0.5, 0.5,
-3.600538, -5.306847, 2, 0, 1.5, 0.5, 0.5,
-3.600538, -5.306847, 4, 0, -0.5, 0.5, 0.5,
-3.600538, -5.306847, 4, 1, -0.5, 0.5, 0.5,
-3.600538, -5.306847, 4, 1, 1.5, 0.5, 0.5,
-3.600538, -5.306847, 4, 0, 1.5, 0.5, 0.5
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
-3.166043, -4.71428, -5.518329,
-3.166043, 3.186608, -5.518329,
-3.166043, -4.71428, 5.683455,
-3.166043, 3.186608, 5.683455,
-3.166043, -4.71428, -5.518329,
-3.166043, -4.71428, 5.683455,
-3.166043, 3.186608, -5.518329,
-3.166043, 3.186608, 5.683455,
-3.166043, -4.71428, -5.518329,
2.627239, -4.71428, -5.518329,
-3.166043, -4.71428, 5.683455,
2.627239, -4.71428, 5.683455,
-3.166043, 3.186608, -5.518329,
2.627239, 3.186608, -5.518329,
-3.166043, 3.186608, 5.683455,
2.627239, 3.186608, 5.683455,
2.627239, -4.71428, -5.518329,
2.627239, 3.186608, -5.518329,
2.627239, -4.71428, 5.683455,
2.627239, 3.186608, 5.683455,
2.627239, -4.71428, -5.518329,
2.627239, -4.71428, 5.683455,
2.627239, 3.186608, -5.518329,
2.627239, 3.186608, 5.683455
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
var radius = 7.946559;
var distance = 35.35514;
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
mvMatrix.translate( 0.2694019, 0.7638358, -0.08256316 );
mvMatrix.scale( 1.483093, 1.08747, 0.7670184 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.35514);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
cyprazine<-read.table("cyprazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyprazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyprazine' not found
```

```r
y<-cyprazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyprazine' not found
```

```r
z<-cyprazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyprazine' not found
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
-3.081674, 0.7596212, -2.600889, 0, 0, 1, 1, 1,
-2.826006, 0.295512, -1.623592, 1, 0, 0, 1, 1,
-2.76219, 0.06779841, -1.064857, 1, 0, 0, 1, 1,
-2.726075, 1.056874, -2.935036, 1, 0, 0, 1, 1,
-2.701803, 0.4872803, -2.380756, 1, 0, 0, 1, 1,
-2.584592, -0.008757073, -0.1271857, 1, 0, 0, 1, 1,
-2.570465, -0.4790542, -2.557018, 0, 0, 0, 1, 1,
-2.56632, -0.07613743, -3.280211, 0, 0, 0, 1, 1,
-2.544552, 0.3768717, -0.8465877, 0, 0, 0, 1, 1,
-2.505125, 0.6431534, -1.499988, 0, 0, 0, 1, 1,
-2.490087, -0.4078862, -3.201244, 0, 0, 0, 1, 1,
-2.393398, -1.473389, -2.40722, 0, 0, 0, 1, 1,
-2.39081, 0.8269728, 0.144042, 0, 0, 0, 1, 1,
-2.244364, 0.2644484, -1.280374, 1, 1, 1, 1, 1,
-2.197938, -0.726299, 0.5798388, 1, 1, 1, 1, 1,
-2.197542, -0.5225326, -2.41558, 1, 1, 1, 1, 1,
-2.11603, -0.428567, -1.448419, 1, 1, 1, 1, 1,
-2.073684, 1.401797, -1.323063, 1, 1, 1, 1, 1,
-2.0601, 0.1262409, -1.766975, 1, 1, 1, 1, 1,
-2.04252, -0.5434156, -1.876852, 1, 1, 1, 1, 1,
-2.028762, 1.174187, 0.04179228, 1, 1, 1, 1, 1,
-2.006858, 1.435937, -2.784214, 1, 1, 1, 1, 1,
-1.992244, -0.224541, -3.066865, 1, 1, 1, 1, 1,
-1.986492, 0.5386649, -1.493466, 1, 1, 1, 1, 1,
-1.985384, -0.366163, -0.3040426, 1, 1, 1, 1, 1,
-1.960831, 2.220599, -1.128871, 1, 1, 1, 1, 1,
-1.936773, 0.04400468, -2.112715, 1, 1, 1, 1, 1,
-1.921695, 0.2111273, -2.273498, 1, 1, 1, 1, 1,
-1.903668, -1.240993, -2.521857, 0, 0, 1, 1, 1,
-1.902213, -0.7544945, -0.7780997, 1, 0, 0, 1, 1,
-1.899769, -0.551977, -2.714689, 1, 0, 0, 1, 1,
-1.899539, 0.3294784, -1.909234, 1, 0, 0, 1, 1,
-1.894533, 1.018806, -1.469336, 1, 0, 0, 1, 1,
-1.874767, -0.5331496, 0.1266447, 1, 0, 0, 1, 1,
-1.873683, 0.8566505, 0.2693069, 0, 0, 0, 1, 1,
-1.87194, 0.8270584, -1.035062, 0, 0, 0, 1, 1,
-1.869044, 0.9365671, 0.2574556, 0, 0, 0, 1, 1,
-1.85611, -0.8185545, -1.105967, 0, 0, 0, 1, 1,
-1.833038, -0.01426167, -1.868838, 0, 0, 0, 1, 1,
-1.813032, -0.2572652, -0.5524327, 0, 0, 0, 1, 1,
-1.809046, 1.27835, -2.535785, 0, 0, 0, 1, 1,
-1.786144, 0.4667581, -1.101102, 1, 1, 1, 1, 1,
-1.767054, -0.4365429, -2.037168, 1, 1, 1, 1, 1,
-1.761852, 0.07900471, 0.2643869, 1, 1, 1, 1, 1,
-1.75713, -0.2883334, -3.205241, 1, 1, 1, 1, 1,
-1.756239, 1.713451, -0.9411651, 1, 1, 1, 1, 1,
-1.756184, 0.1334725, -2.899583, 1, 1, 1, 1, 1,
-1.754302, -1.721423, -3.292383, 1, 1, 1, 1, 1,
-1.737091, 1.619112, -0.1154529, 1, 1, 1, 1, 1,
-1.734308, -1.439459, -1.445856, 1, 1, 1, 1, 1,
-1.725193, -0.8523749, -2.074903, 1, 1, 1, 1, 1,
-1.723846, 0.2933695, -0.08990507, 1, 1, 1, 1, 1,
-1.715918, 1.182175, -2.209265, 1, 1, 1, 1, 1,
-1.696279, 1.093999, -0.691227, 1, 1, 1, 1, 1,
-1.690018, -1.171031, -3.068071, 1, 1, 1, 1, 1,
-1.689375, -0.4456115, -2.707458, 1, 1, 1, 1, 1,
-1.688563, 0.9315021, -0.8436348, 0, 0, 1, 1, 1,
-1.675142, 0.8594026, -2.560693, 1, 0, 0, 1, 1,
-1.666388, -0.6944116, -1.240242, 1, 0, 0, 1, 1,
-1.654561, -0.9321169, -2.614749, 1, 0, 0, 1, 1,
-1.646694, 0.06303333, -2.199475, 1, 0, 0, 1, 1,
-1.645163, 0.3967823, -1.234781, 1, 0, 0, 1, 1,
-1.643925, -0.6703874, -0.9502484, 0, 0, 0, 1, 1,
-1.634952, -1.671415, -0.3090179, 0, 0, 0, 1, 1,
-1.63132, 0.6167597, -1.569576, 0, 0, 0, 1, 1,
-1.631109, -1.191512, -0.8349558, 0, 0, 0, 1, 1,
-1.623981, -1.476836, -1.227327, 0, 0, 0, 1, 1,
-1.622401, 0.02375763, -0.2306838, 0, 0, 0, 1, 1,
-1.619904, 2.793621, 0.2214267, 0, 0, 0, 1, 1,
-1.61802, -0.7713616, -1.483975, 1, 1, 1, 1, 1,
-1.589955, -0.7722442, -2.138036, 1, 1, 1, 1, 1,
-1.579155, 0.5461389, -0.7198136, 1, 1, 1, 1, 1,
-1.575987, -0.8879976, -2.491506, 1, 1, 1, 1, 1,
-1.566493, -0.6220638, -1.986463, 1, 1, 1, 1, 1,
-1.557308, -0.1876364, -1.568601, 1, 1, 1, 1, 1,
-1.556593, 1.400101, -3.263279, 1, 1, 1, 1, 1,
-1.523698, 0.6852885, -0.4184353, 1, 1, 1, 1, 1,
-1.503719, -2.393571, -1.912166, 1, 1, 1, 1, 1,
-1.49853, -0.3655115, -1.6788, 1, 1, 1, 1, 1,
-1.492999, 0.4287267, -1.363046, 1, 1, 1, 1, 1,
-1.490423, 0.2581054, -0.8596384, 1, 1, 1, 1, 1,
-1.483323, -0.921504, -2.14626, 1, 1, 1, 1, 1,
-1.48064, -0.1554608, -1.133286, 1, 1, 1, 1, 1,
-1.476727, -0.7504205, -0.2564154, 1, 1, 1, 1, 1,
-1.475122, -0.06336188, -1.839096, 0, 0, 1, 1, 1,
-1.470985, 0.6321575, 0.2648384, 1, 0, 0, 1, 1,
-1.467316, -1.389974, -2.410079, 1, 0, 0, 1, 1,
-1.465252, 0.03814242, -0.8012539, 1, 0, 0, 1, 1,
-1.463568, -0.6771945, -2.546002, 1, 0, 0, 1, 1,
-1.448433, 0.7899907, -0.06059481, 1, 0, 0, 1, 1,
-1.43946, -1.505007, -2.802323, 0, 0, 0, 1, 1,
-1.438757, 0.8040916, -0.652159, 0, 0, 0, 1, 1,
-1.437505, 2.293502, 0.4923428, 0, 0, 0, 1, 1,
-1.435203, -0.6214849, -1.976762, 0, 0, 0, 1, 1,
-1.432078, 0.687504, -0.6719677, 0, 0, 0, 1, 1,
-1.431268, 1.494754, -0.4058268, 0, 0, 0, 1, 1,
-1.427107, 0.8279797, -0.0728333, 0, 0, 0, 1, 1,
-1.421244, -0.9414055, -1.235475, 1, 1, 1, 1, 1,
-1.419879, -1.082032, -1.789932, 1, 1, 1, 1, 1,
-1.419168, -1.431331, -1.587838, 1, 1, 1, 1, 1,
-1.412344, -0.8359557, -1.932919, 1, 1, 1, 1, 1,
-1.406035, -0.731131, -0.517291, 1, 1, 1, 1, 1,
-1.405687, -1.735798, -2.274496, 1, 1, 1, 1, 1,
-1.404648, -1.749079, -0.9857127, 1, 1, 1, 1, 1,
-1.398147, 0.6293982, -3.097739, 1, 1, 1, 1, 1,
-1.396494, 0.8179238, -1.852238, 1, 1, 1, 1, 1,
-1.388598, 0.2945882, -1.443551, 1, 1, 1, 1, 1,
-1.377084, -0.03585362, -2.019376, 1, 1, 1, 1, 1,
-1.367975, 0.9167768, -1.905935, 1, 1, 1, 1, 1,
-1.362657, -2.549783, -1.737324, 1, 1, 1, 1, 1,
-1.361596, 0.4209647, -2.051764, 1, 1, 1, 1, 1,
-1.360871, -0.09126663, -1.283064, 1, 1, 1, 1, 1,
-1.358553, 0.7601907, -1.583187, 0, 0, 1, 1, 1,
-1.356073, -0.2346434, -2.742884, 1, 0, 0, 1, 1,
-1.352798, 1.340076, -1.877145, 1, 0, 0, 1, 1,
-1.351607, 0.7274849, -0.9409322, 1, 0, 0, 1, 1,
-1.348851, 0.2722454, -2.233839, 1, 0, 0, 1, 1,
-1.347824, -0.101435, -4.05021, 1, 0, 0, 1, 1,
-1.346205, -0.9323354, -1.208969, 0, 0, 0, 1, 1,
-1.345171, 0.8761255, -2.793738, 0, 0, 0, 1, 1,
-1.336636, 0.1925006, -1.572713, 0, 0, 0, 1, 1,
-1.334162, 0.3930021, -1.699764, 0, 0, 0, 1, 1,
-1.333475, -0.6345925, -1.308227, 0, 0, 0, 1, 1,
-1.328765, 0.9280568, 0.1110627, 0, 0, 0, 1, 1,
-1.317306, 2.304644, -2.385083, 0, 0, 0, 1, 1,
-1.303817, -0.5656855, -2.028015, 1, 1, 1, 1, 1,
-1.302138, -1.703375, -2.411051, 1, 1, 1, 1, 1,
-1.298919, -0.6395981, -2.900385, 1, 1, 1, 1, 1,
-1.297988, 1.062914, 0.2271382, 1, 1, 1, 1, 1,
-1.289886, -0.776505, -2.675343, 1, 1, 1, 1, 1,
-1.284909, -1.777583, -1.899348, 1, 1, 1, 1, 1,
-1.279814, -0.06844207, -3.357999, 1, 1, 1, 1, 1,
-1.267554, -0.6537611, -1.159423, 1, 1, 1, 1, 1,
-1.264099, 1.155815, -0.9191217, 1, 1, 1, 1, 1,
-1.26142, 0.8055459, -1.625191, 1, 1, 1, 1, 1,
-1.260651, -0.7105385, -1.41412, 1, 1, 1, 1, 1,
-1.257539, 0.4006259, -1.048558, 1, 1, 1, 1, 1,
-1.256293, 0.5318608, -0.365409, 1, 1, 1, 1, 1,
-1.246768, 1.638682, -0.3945193, 1, 1, 1, 1, 1,
-1.24615, -0.4261026, -0.501937, 1, 1, 1, 1, 1,
-1.243933, -0.9480429, -0.6436689, 0, 0, 1, 1, 1,
-1.243354, -1.462903, -1.385758, 1, 0, 0, 1, 1,
-1.221097, 0.4303921, 0.7490922, 1, 0, 0, 1, 1,
-1.221061, 0.8882512, -0.4309047, 1, 0, 0, 1, 1,
-1.217205, 0.620501, -1.266808, 1, 0, 0, 1, 1,
-1.213958, 0.2650024, -2.979162, 1, 0, 0, 1, 1,
-1.212795, 0.8308122, -1.564831, 0, 0, 0, 1, 1,
-1.209057, -0.6480488, -3.791989, 0, 0, 0, 1, 1,
-1.201134, -0.8332008, -1.442954, 0, 0, 0, 1, 1,
-1.19729, -0.9942063, -2.443641, 0, 0, 0, 1, 1,
-1.193228, -0.1005207, 0.08541701, 0, 0, 0, 1, 1,
-1.17767, -1.3006, -2.956919, 0, 0, 0, 1, 1,
-1.17327, 0.1027147, -1.712742, 0, 0, 0, 1, 1,
-1.170882, -0.5196009, -2.206891, 1, 1, 1, 1, 1,
-1.169181, 1.647815, 0.05373716, 1, 1, 1, 1, 1,
-1.165858, -0.7948846, -2.678097, 1, 1, 1, 1, 1,
-1.159095, 0.7986509, -0.656305, 1, 1, 1, 1, 1,
-1.155164, 1.217899, 0.5331138, 1, 1, 1, 1, 1,
-1.150694, -1.481925, -2.460123, 1, 1, 1, 1, 1,
-1.14862, 1.37078, -0.7560582, 1, 1, 1, 1, 1,
-1.147319, -1.070908, -2.724795, 1, 1, 1, 1, 1,
-1.146133, 0.8259829, 0.5887722, 1, 1, 1, 1, 1,
-1.143675, -0.2295712, -2.267462, 1, 1, 1, 1, 1,
-1.143157, 0.9983008, -1.473618, 1, 1, 1, 1, 1,
-1.142739, -0.06834, -0.8900689, 1, 1, 1, 1, 1,
-1.136945, 0.6403124, -0.2759811, 1, 1, 1, 1, 1,
-1.134533, -0.02821991, -3.586853, 1, 1, 1, 1, 1,
-1.134269, 0.1728127, -1.556702, 1, 1, 1, 1, 1,
-1.124438, 0.1578638, -2.021952, 0, 0, 1, 1, 1,
-1.124007, 0.07838149, -0.9246272, 1, 0, 0, 1, 1,
-1.121376, 0.4839195, -0.9492131, 1, 0, 0, 1, 1,
-1.10958, 0.6362625, -0.09241185, 1, 0, 0, 1, 1,
-1.109098, 1.164335, -0.7778165, 1, 0, 0, 1, 1,
-1.096524, 0.4635751, 0.1351106, 1, 0, 0, 1, 1,
-1.091213, -0.6282058, -1.952995, 0, 0, 0, 1, 1,
-1.089811, 0.996932, -1.764786, 0, 0, 0, 1, 1,
-1.084348, -1.244591, -2.314224, 0, 0, 0, 1, 1,
-1.071128, -0.5676612, -1.315084, 0, 0, 0, 1, 1,
-1.071012, -1.129643, -2.968835, 0, 0, 0, 1, 1,
-1.063898, 0.4851512, -3.281185, 0, 0, 0, 1, 1,
-1.062156, -0.004406272, -2.032476, 0, 0, 0, 1, 1,
-1.037393, 0.2389569, -2.651107, 1, 1, 1, 1, 1,
-1.035599, 0.3634234, 0.2819018, 1, 1, 1, 1, 1,
-1.023439, -0.4128897, -0.1187862, 1, 1, 1, 1, 1,
-1.014222, -0.3051897, -1.39774, 1, 1, 1, 1, 1,
-1.014213, 1.052605, -0.4552419, 1, 1, 1, 1, 1,
-1.005705, -0.01172523, -2.409618, 1, 1, 1, 1, 1,
-1.004854, 0.1098484, -1.046909, 1, 1, 1, 1, 1,
-0.9992399, -1.275125, -2.18732, 1, 1, 1, 1, 1,
-0.9960513, -0.7366407, -1.590136, 1, 1, 1, 1, 1,
-0.9916695, 2.041869, -0.09836614, 1, 1, 1, 1, 1,
-0.9885263, -0.6656134, -2.251924, 1, 1, 1, 1, 1,
-0.9870284, -0.1656916, -2.502409, 1, 1, 1, 1, 1,
-0.9765868, 1.233651, -0.4777267, 1, 1, 1, 1, 1,
-0.9753391, -0.1441453, -0.9919292, 1, 1, 1, 1, 1,
-0.9715916, -0.5138564, -3.196686, 1, 1, 1, 1, 1,
-0.9691198, -0.01265463, -2.205621, 0, 0, 1, 1, 1,
-0.9688508, -1.996731, -2.117633, 1, 0, 0, 1, 1,
-0.9683697, -0.2202784, -1.235717, 1, 0, 0, 1, 1,
-0.968137, -0.9157585, -3.023959, 1, 0, 0, 1, 1,
-0.9663996, 0.8185449, -1.416654, 1, 0, 0, 1, 1,
-0.9654575, -2.152127, -0.7855437, 1, 0, 0, 1, 1,
-0.9627429, -0.4182144, -1.383722, 0, 0, 0, 1, 1,
-0.9576543, -2.107532, -2.093796, 0, 0, 0, 1, 1,
-0.9564545, -0.07404714, -1.866706, 0, 0, 0, 1, 1,
-0.9430235, -1.511529, -1.740392, 0, 0, 0, 1, 1,
-0.9346786, -0.7506974, -1.806288, 0, 0, 0, 1, 1,
-0.9342626, 1.08331, -2.039311, 0, 0, 0, 1, 1,
-0.9337287, 0.8550173, -2.0957, 0, 0, 0, 1, 1,
-0.9293075, -1.002691, -2.749052, 1, 1, 1, 1, 1,
-0.9230669, -0.3116137, -2.387877, 1, 1, 1, 1, 1,
-0.9169446, -1.099296, -0.6488754, 1, 1, 1, 1, 1,
-0.9167963, 1.293198, -0.3455919, 1, 1, 1, 1, 1,
-0.9135596, 0.893665, -0.2765785, 1, 1, 1, 1, 1,
-0.9132101, -0.09556034, -1.425598, 1, 1, 1, 1, 1,
-0.9060738, -0.6811301, -2.5963, 1, 1, 1, 1, 1,
-0.8998438, 1.213267, -1.860092, 1, 1, 1, 1, 1,
-0.8940761, -0.2348146, -0.6553623, 1, 1, 1, 1, 1,
-0.8915532, -0.2577876, -0.03597752, 1, 1, 1, 1, 1,
-0.8892686, 0.199094, -1.077552, 1, 1, 1, 1, 1,
-0.8887319, 0.1640326, -1.606441, 1, 1, 1, 1, 1,
-0.8845809, -1.451622, -2.152129, 1, 1, 1, 1, 1,
-0.8811649, 0.0971322, -1.779204, 1, 1, 1, 1, 1,
-0.8764929, -0.7600957, -2.025015, 1, 1, 1, 1, 1,
-0.8718113, -1.752732, -2.520917, 0, 0, 1, 1, 1,
-0.8633222, 0.9192241, -0.2988756, 1, 0, 0, 1, 1,
-0.8627618, 3.071547, 1.094341, 1, 0, 0, 1, 1,
-0.8586802, -1.662819, -2.42169, 1, 0, 0, 1, 1,
-0.8529977, -0.4242107, -1.770783, 1, 0, 0, 1, 1,
-0.8510569, -2.013809, -2.100959, 1, 0, 0, 1, 1,
-0.8496464, -0.4466814, -2.112101, 0, 0, 0, 1, 1,
-0.8485712, 0.4599715, -1.630916, 0, 0, 0, 1, 1,
-0.8469168, -2.402942, -2.898947, 0, 0, 0, 1, 1,
-0.8466315, -0.4351113, -0.9242939, 0, 0, 0, 1, 1,
-0.8447968, -1.476604, -1.522887, 0, 0, 0, 1, 1,
-0.841374, -0.9170573, -2.993849, 0, 0, 0, 1, 1,
-0.833701, -0.1032553, -1.172105, 0, 0, 0, 1, 1,
-0.8329443, 0.6197368, -0.9041791, 1, 1, 1, 1, 1,
-0.8322337, 1.021658, -2.134237, 1, 1, 1, 1, 1,
-0.8138654, 0.09438469, -0.4916886, 1, 1, 1, 1, 1,
-0.8125488, -0.4640155, -2.264897, 1, 1, 1, 1, 1,
-0.8084518, 0.3909152, -0.6435935, 1, 1, 1, 1, 1,
-0.8035524, 0.09646956, -0.6324599, 1, 1, 1, 1, 1,
-0.7952138, -0.9252641, -2.796873, 1, 1, 1, 1, 1,
-0.7942886, 1.721874, 0.3058974, 1, 1, 1, 1, 1,
-0.7938984, 0.3884189, -0.5667332, 1, 1, 1, 1, 1,
-0.7936317, -0.02839358, -0.8840638, 1, 1, 1, 1, 1,
-0.789811, 0.9853516, -0.6463998, 1, 1, 1, 1, 1,
-0.778587, -1.12227, -1.772354, 1, 1, 1, 1, 1,
-0.7782575, -0.5323463, -1.917416, 1, 1, 1, 1, 1,
-0.7772513, -0.05829078, -2.947437, 1, 1, 1, 1, 1,
-0.7730382, 0.0216253, -3.229181, 1, 1, 1, 1, 1,
-0.7728783, -0.6994763, -2.607343, 0, 0, 1, 1, 1,
-0.770251, 0.5557579, -2.320688, 1, 0, 0, 1, 1,
-0.7695179, -1.18633, -3.279168, 1, 0, 0, 1, 1,
-0.7690759, -0.1468561, -1.86737, 1, 0, 0, 1, 1,
-0.7608935, -0.2648491, -0.08166748, 1, 0, 0, 1, 1,
-0.7596415, 0.1198194, -0.3774993, 1, 0, 0, 1, 1,
-0.7588754, -0.1657119, -0.4650977, 0, 0, 0, 1, 1,
-0.7582165, -0.3271044, -3.644219, 0, 0, 0, 1, 1,
-0.7570449, 0.3137059, -0.2955487, 0, 0, 0, 1, 1,
-0.7553996, 1.095136, -0.7172887, 0, 0, 0, 1, 1,
-0.7552444, -0.366636, -2.417194, 0, 0, 0, 1, 1,
-0.7526624, 0.5659883, -1.085333, 0, 0, 0, 1, 1,
-0.7493794, 0.4018912, -1.283811, 0, 0, 0, 1, 1,
-0.7435204, -1.377782, -3.191954, 1, 1, 1, 1, 1,
-0.7410809, -1.432505, -2.857445, 1, 1, 1, 1, 1,
-0.7398801, -0.5752592, -2.692008, 1, 1, 1, 1, 1,
-0.739416, -0.4070512, -2.427803, 1, 1, 1, 1, 1,
-0.7381919, 0.3289499, -1.222533, 1, 1, 1, 1, 1,
-0.73679, -1.053805, -2.680473, 1, 1, 1, 1, 1,
-0.7330651, 0.2286403, -1.435656, 1, 1, 1, 1, 1,
-0.727433, 1.537879, -1.345068, 1, 1, 1, 1, 1,
-0.7263342, 1.649384, -0.789413, 1, 1, 1, 1, 1,
-0.7192674, 0.089241, -1.215913, 1, 1, 1, 1, 1,
-0.715889, -0.857991, -3.194235, 1, 1, 1, 1, 1,
-0.7150381, -1.322417, -0.3545401, 1, 1, 1, 1, 1,
-0.7091702, 1.119404, -0.698378, 1, 1, 1, 1, 1,
-0.7089193, -0.06215554, -1.313652, 1, 1, 1, 1, 1,
-0.7088178, -0.08669151, -2.611871, 1, 1, 1, 1, 1,
-0.7085063, -0.7809259, -1.67152, 0, 0, 1, 1, 1,
-0.7059304, 1.447819, -1.794633, 1, 0, 0, 1, 1,
-0.6896265, 0.1851148, -2.062101, 1, 0, 0, 1, 1,
-0.6872945, 1.160119, -0.5943699, 1, 0, 0, 1, 1,
-0.6847337, -0.347115, -0.07178177, 1, 0, 0, 1, 1,
-0.6755373, 0.02446399, -3.05274, 1, 0, 0, 1, 1,
-0.6731175, -1.358838, -2.160298, 0, 0, 0, 1, 1,
-0.6720706, -0.1307625, -2.641127, 0, 0, 0, 1, 1,
-0.6706904, -1.56517, -3.388283, 0, 0, 0, 1, 1,
-0.6706544, 0.1094645, -2.523263, 0, 0, 0, 1, 1,
-0.6668233, 0.3508877, -0.3166694, 0, 0, 0, 1, 1,
-0.6658239, 0.6008573, -1.199064, 0, 0, 0, 1, 1,
-0.6640054, 0.6935117, -1.024278, 0, 0, 0, 1, 1,
-0.6616494, -0.6788217, -4.394373, 1, 1, 1, 1, 1,
-0.6594218, -0.003692735, -0.178085, 1, 1, 1, 1, 1,
-0.6578269, 0.536166, -1.055971, 1, 1, 1, 1, 1,
-0.6572286, 1.073035, -0.3846191, 1, 1, 1, 1, 1,
-0.6549706, -0.1120109, -0.7849441, 1, 1, 1, 1, 1,
-0.6545364, 1.175511, -1.908934, 1, 1, 1, 1, 1,
-0.6510695, 0.9860687, 0.3158729, 1, 1, 1, 1, 1,
-0.6489689, 0.4102638, -2.242592, 1, 1, 1, 1, 1,
-0.6477231, 1.530829, -1.354612, 1, 1, 1, 1, 1,
-0.6474479, 0.2560848, 0.1865845, 1, 1, 1, 1, 1,
-0.6447109, -0.7643047, -3.282519, 1, 1, 1, 1, 1,
-0.6442842, -0.04246813, -1.163895, 1, 1, 1, 1, 1,
-0.6423327, -1.254977, -2.652688, 1, 1, 1, 1, 1,
-0.641505, -0.521306, -1.707466, 1, 1, 1, 1, 1,
-0.6399553, 0.3221167, -1.761034, 1, 1, 1, 1, 1,
-0.6374155, -0.006058073, -0.6641921, 0, 0, 1, 1, 1,
-0.6334143, 0.7059656, 0.3337252, 1, 0, 0, 1, 1,
-0.6324062, 0.6440461, -0.4925066, 1, 0, 0, 1, 1,
-0.6262468, 0.01826703, -1.329907, 1, 0, 0, 1, 1,
-0.6261429, 0.5757594, 0.06626438, 1, 0, 0, 1, 1,
-0.6236032, 0.5457645, -1.324055, 1, 0, 0, 1, 1,
-0.6015085, 0.07488643, -2.799869, 0, 0, 0, 1, 1,
-0.5900015, -0.8369435, -3.001018, 0, 0, 0, 1, 1,
-0.5889651, 1.124704, -0.7948405, 0, 0, 0, 1, 1,
-0.5854138, 0.213895, -0.5843308, 0, 0, 0, 1, 1,
-0.581551, 0.443291, -1.428965, 0, 0, 0, 1, 1,
-0.5730084, 0.6763662, -1.904397, 0, 0, 0, 1, 1,
-0.5711497, 1.652193, -0.4990504, 0, 0, 0, 1, 1,
-0.5674704, 1.748067, -0.08259921, 1, 1, 1, 1, 1,
-0.5657772, -1.004616, -3.221769, 1, 1, 1, 1, 1,
-0.5630233, -0.2579952, -2.002922, 1, 1, 1, 1, 1,
-0.5609914, -1.823681, -1.92568, 1, 1, 1, 1, 1,
-0.5507973, 0.2314176, -2.026247, 1, 1, 1, 1, 1,
-0.5471396, 0.1586143, -2.135254, 1, 1, 1, 1, 1,
-0.546092, 0.3171426, -0.2415602, 1, 1, 1, 1, 1,
-0.5456166, 0.7393719, -0.395219, 1, 1, 1, 1, 1,
-0.545517, 0.6997227, -1.646294, 1, 1, 1, 1, 1,
-0.5405548, 0.4076231, -1.279007, 1, 1, 1, 1, 1,
-0.537065, 0.7700737, -0.344541, 1, 1, 1, 1, 1,
-0.5354193, -1.095487, -3.550486, 1, 1, 1, 1, 1,
-0.5347965, 1.368021, -2.738097, 1, 1, 1, 1, 1,
-0.5305095, 0.06897618, 0.5821453, 1, 1, 1, 1, 1,
-0.5288889, -1.268718, -2.299046, 1, 1, 1, 1, 1,
-0.5277119, -0.6014089, -2.555871, 0, 0, 1, 1, 1,
-0.5238764, -0.8987902, -2.707522, 1, 0, 0, 1, 1,
-0.5119352, -0.9363189, -3.851327, 1, 0, 0, 1, 1,
-0.5118012, -0.0640338, -1.125758, 1, 0, 0, 1, 1,
-0.5075085, 0.7463086, -0.7850199, 1, 0, 0, 1, 1,
-0.5026625, 0.6003518, -0.9936531, 1, 0, 0, 1, 1,
-0.4979294, 0.8478994, -0.9321042, 0, 0, 0, 1, 1,
-0.4969957, 0.7272563, -1.526446, 0, 0, 0, 1, 1,
-0.4923135, 0.2520585, -0.6781451, 0, 0, 0, 1, 1,
-0.4858027, 0.7178585, -2.500167, 0, 0, 0, 1, 1,
-0.4815914, 0.5374209, -2.820314, 0, 0, 0, 1, 1,
-0.4801624, 2.019482, 0.3684112, 0, 0, 0, 1, 1,
-0.4773883, 0.5097964, -1.483593, 0, 0, 0, 1, 1,
-0.4758486, 0.865271, -0.3953526, 1, 1, 1, 1, 1,
-0.4659288, -0.1655864, -0.9733002, 1, 1, 1, 1, 1,
-0.4635247, -1.086228, -2.161109, 1, 1, 1, 1, 1,
-0.4621697, 1.164983, 1.539714, 1, 1, 1, 1, 1,
-0.461736, -0.2886756, -1.787737, 1, 1, 1, 1, 1,
-0.4572594, 1.022165, 0.7089112, 1, 1, 1, 1, 1,
-0.454786, 0.7295768, 0.3385812, 1, 1, 1, 1, 1,
-0.451989, -1.260874, -3.162219, 1, 1, 1, 1, 1,
-0.4515771, 2.303471, -1.100621, 1, 1, 1, 1, 1,
-0.4482127, 0.9058654, 0.5220097, 1, 1, 1, 1, 1,
-0.4427599, -0.10083, -1.674891, 1, 1, 1, 1, 1,
-0.4350299, -0.8251272, -3.607298, 1, 1, 1, 1, 1,
-0.4251446, -0.2444664, -1.134351, 1, 1, 1, 1, 1,
-0.4240939, 0.2506037, -0.5963766, 1, 1, 1, 1, 1,
-0.4238367, 0.04063017, -1.639368, 1, 1, 1, 1, 1,
-0.420693, 0.3378789, -0.3293815, 0, 0, 1, 1, 1,
-0.4202324, 2.070488, -1.035281, 1, 0, 0, 1, 1,
-0.4198905, -0.337267, -1.423477, 1, 0, 0, 1, 1,
-0.4125985, 0.6404426, 0.109738, 1, 0, 0, 1, 1,
-0.411383, 0.9028699, -0.3371518, 1, 0, 0, 1, 1,
-0.4103609, 0.7370449, -0.450712, 1, 0, 0, 1, 1,
-0.4083995, -0.1125437, -1.896034, 0, 0, 0, 1, 1,
-0.4027428, -0.8598618, -2.91174, 0, 0, 0, 1, 1,
-0.4019857, 0.1036943, -2.51102, 0, 0, 0, 1, 1,
-0.4014068, 0.08116006, -0.825744, 0, 0, 0, 1, 1,
-0.3947026, 0.06001154, -1.876839, 0, 0, 0, 1, 1,
-0.3891735, 1.93904, -0.04672215, 0, 0, 0, 1, 1,
-0.3871771, -0.1055516, -1.913405, 0, 0, 0, 1, 1,
-0.3861733, -0.6563048, -3.024561, 1, 1, 1, 1, 1,
-0.3854852, -0.2782303, -3.115091, 1, 1, 1, 1, 1,
-0.3843191, 1.000408, 0.7337976, 1, 1, 1, 1, 1,
-0.3814912, 0.3530779, -1.114098, 1, 1, 1, 1, 1,
-0.3712862, 0.3948708, 0.01100682, 1, 1, 1, 1, 1,
-0.3658567, -2.346307, -2.450518, 1, 1, 1, 1, 1,
-0.3652728, -0.1178169, -3.40542, 1, 1, 1, 1, 1,
-0.3539416, -2.026642, -3.802458, 1, 1, 1, 1, 1,
-0.3522817, 1.412579, 0.2367584, 1, 1, 1, 1, 1,
-0.3509264, -0.6343415, -1.28571, 1, 1, 1, 1, 1,
-0.3504516, 1.078472, 0.5063835, 1, 1, 1, 1, 1,
-0.3503674, 0.7818491, -0.8527139, 1, 1, 1, 1, 1,
-0.3502438, 0.8851854, 1.904036, 1, 1, 1, 1, 1,
-0.3487177, 1.75833, 0.4125839, 1, 1, 1, 1, 1,
-0.3484268, 0.7370801, -0.4156001, 1, 1, 1, 1, 1,
-0.3384847, -1.623244, -3.248791, 0, 0, 1, 1, 1,
-0.338419, 0.2312508, 0.6593933, 1, 0, 0, 1, 1,
-0.3326848, 0.403669, -0.6318803, 1, 0, 0, 1, 1,
-0.3266834, -0.3167551, -1.22706, 1, 0, 0, 1, 1,
-0.3259485, 0.2819246, -2.616031, 1, 0, 0, 1, 1,
-0.3249891, 0.473192, 0.1623569, 1, 0, 0, 1, 1,
-0.3237195, -0.948342, -2.92975, 0, 0, 0, 1, 1,
-0.3231156, 0.2088185, 0.128021, 0, 0, 0, 1, 1,
-0.3195384, 0.4868847, -3.041531, 0, 0, 0, 1, 1,
-0.3136262, 2.068278, -0.1736425, 0, 0, 0, 1, 1,
-0.3128871, 0.5719016, -1.746048, 0, 0, 0, 1, 1,
-0.3118351, -0.3066526, -1.642018, 0, 0, 0, 1, 1,
-0.3070548, 1.214533, -0.5245761, 0, 0, 0, 1, 1,
-0.3058999, 0.5930005, -0.6147155, 1, 1, 1, 1, 1,
-0.3057356, 0.3815292, -1.658377, 1, 1, 1, 1, 1,
-0.3052889, -2.121454, -3.957248, 1, 1, 1, 1, 1,
-0.3022217, -2.395591, -3.531767, 1, 1, 1, 1, 1,
-0.2984177, 0.6955306, 0.5934026, 1, 1, 1, 1, 1,
-0.293021, 0.7148153, 0.4536701, 1, 1, 1, 1, 1,
-0.2903925, -0.7636687, -3.887046, 1, 1, 1, 1, 1,
-0.2902143, -0.151162, -2.461171, 1, 1, 1, 1, 1,
-0.2894254, -0.3966908, -1.77521, 1, 1, 1, 1, 1,
-0.2844271, 0.5086596, -1.664005, 1, 1, 1, 1, 1,
-0.2839613, 0.2873797, -1.788182, 1, 1, 1, 1, 1,
-0.2829341, -1.840248, -2.645324, 1, 1, 1, 1, 1,
-0.282056, -0.5007156, -2.761303, 1, 1, 1, 1, 1,
-0.2808041, -1.473413, -3.733517, 1, 1, 1, 1, 1,
-0.277744, 0.06057266, -2.554979, 1, 1, 1, 1, 1,
-0.275712, 1.444214, 2.622202, 0, 0, 1, 1, 1,
-0.2756001, -1.775224, -1.577767, 1, 0, 0, 1, 1,
-0.2741122, -1.127491, -2.706577, 1, 0, 0, 1, 1,
-0.2730575, -0.3712533, -2.849372, 1, 0, 0, 1, 1,
-0.2712858, 0.2730984, -2.424615, 1, 0, 0, 1, 1,
-0.2658669, -0.05726697, -0.6585507, 1, 0, 0, 1, 1,
-0.2609824, 1.156518, -1.269255, 0, 0, 0, 1, 1,
-0.2608639, 1.291117, -0.8510888, 0, 0, 0, 1, 1,
-0.2606793, -0.8660455, -5.138607, 0, 0, 0, 1, 1,
-0.2606181, -0.09788604, -2.438131, 0, 0, 0, 1, 1,
-0.2587334, -0.07269578, -1.370279, 0, 0, 0, 1, 1,
-0.2581469, 0.09492311, -0.3595617, 0, 0, 0, 1, 1,
-0.2576277, 2.0432, -0.06393385, 0, 0, 0, 1, 1,
-0.2565024, 0.08162943, -0.4975456, 1, 1, 1, 1, 1,
-0.255859, 0.3713568, 0.8936265, 1, 1, 1, 1, 1,
-0.2549927, -1.703776, -2.060272, 1, 1, 1, 1, 1,
-0.2544016, -0.4476919, -3.314466, 1, 1, 1, 1, 1,
-0.2485482, 1.105321, -1.257085, 1, 1, 1, 1, 1,
-0.2437907, -0.5727662, -3.17009, 1, 1, 1, 1, 1,
-0.2422958, -1.087913, -3.260345, 1, 1, 1, 1, 1,
-0.2398857, -1.419518, -4.245862, 1, 1, 1, 1, 1,
-0.239606, 0.6649731, 0.3309906, 1, 1, 1, 1, 1,
-0.2371905, 0.214467, 0.4216856, 1, 1, 1, 1, 1,
-0.2315546, 2.298409, -0.03398138, 1, 1, 1, 1, 1,
-0.2289666, -1.210208, -3.720289, 1, 1, 1, 1, 1,
-0.2274039, 1.166144, -0.1479314, 1, 1, 1, 1, 1,
-0.2260606, 0.2866763, -0.4817134, 1, 1, 1, 1, 1,
-0.225299, 0.09720025, -2.278431, 1, 1, 1, 1, 1,
-0.2247157, -1.121811, -2.771252, 0, 0, 1, 1, 1,
-0.2195812, 1.657936, 0.6716889, 1, 0, 0, 1, 1,
-0.2189834, 0.8734748, 1.007667, 1, 0, 0, 1, 1,
-0.2156682, 0.4731533, -0.373369, 1, 0, 0, 1, 1,
-0.215303, 0.3608803, -0.9738896, 1, 0, 0, 1, 1,
-0.2148574, -0.7038298, -5.355196, 1, 0, 0, 1, 1,
-0.2125481, 0.2177935, -1.051018, 0, 0, 0, 1, 1,
-0.2114429, -0.437665, -3.314152, 0, 0, 0, 1, 1,
-0.2106821, 0.3053873, -0.1356283, 0, 0, 0, 1, 1,
-0.2092242, 1.014332, -1.662842, 0, 0, 0, 1, 1,
-0.2064846, 0.5465954, -1.375053, 0, 0, 0, 1, 1,
-0.2057006, -1.375452, -3.950038, 0, 0, 0, 1, 1,
-0.2055764, 0.8140149, -0.352532, 0, 0, 0, 1, 1,
-0.1987063, -0.5154442, -3.231906, 1, 1, 1, 1, 1,
-0.1984982, -0.3320421, -1.324388, 1, 1, 1, 1, 1,
-0.1980648, -0.7185112, -3.208081, 1, 1, 1, 1, 1,
-0.1923593, 0.6805676, -0.8749015, 1, 1, 1, 1, 1,
-0.1893133, 1.001928, 0.6018026, 1, 1, 1, 1, 1,
-0.1844274, -1.153665, -2.276123, 1, 1, 1, 1, 1,
-0.1821465, -1.710295, -3.411916, 1, 1, 1, 1, 1,
-0.1816111, -0.5077253, -3.054263, 1, 1, 1, 1, 1,
-0.1810493, -0.1732406, -2.922892, 1, 1, 1, 1, 1,
-0.1803393, 0.9594249, -1.305562, 1, 1, 1, 1, 1,
-0.1778934, -0.009400378, -2.328734, 1, 1, 1, 1, 1,
-0.1748178, 0.5480805, 0.7699425, 1, 1, 1, 1, 1,
-0.1726971, -0.03037951, -0.3459185, 1, 1, 1, 1, 1,
-0.1700701, -1.199509, -4.615908, 1, 1, 1, 1, 1,
-0.1680004, 0.1263469, -1.680055, 1, 1, 1, 1, 1,
-0.164076, 0.2346307, -0.365127, 0, 0, 1, 1, 1,
-0.1590743, -0.4438852, -3.424037, 1, 0, 0, 1, 1,
-0.1579725, -1.20152, -3.09609, 1, 0, 0, 1, 1,
-0.1569305, -0.5709417, -3.850943, 1, 0, 0, 1, 1,
-0.1554686, -0.6447679, -3.643959, 1, 0, 0, 1, 1,
-0.150776, -0.1909118, -4.992205, 1, 0, 0, 1, 1,
-0.142394, -1.973577, -2.417095, 0, 0, 0, 1, 1,
-0.1387028, -0.9283357, -3.634945, 0, 0, 0, 1, 1,
-0.134219, -0.3723508, -2.671376, 0, 0, 0, 1, 1,
-0.1334069, 0.2221358, -2.860686, 0, 0, 0, 1, 1,
-0.1331926, 1.169264, 0.852247, 0, 0, 0, 1, 1,
-0.1310441, -0.4406525, -5.268754, 0, 0, 0, 1, 1,
-0.1208, -0.2638862, -4.264826, 0, 0, 0, 1, 1,
-0.1196158, 2.489724, -0.2431492, 1, 1, 1, 1, 1,
-0.11474, -0.7312278, -2.639153, 1, 1, 1, 1, 1,
-0.1135785, 1.929729, -0.3230946, 1, 1, 1, 1, 1,
-0.112813, -0.4009366, -2.461315, 1, 1, 1, 1, 1,
-0.09160206, 1.020613, -0.3990045, 1, 1, 1, 1, 1,
-0.08770973, -0.5595971, -3.166169, 1, 1, 1, 1, 1,
-0.08604379, -1.516508, -3.515194, 1, 1, 1, 1, 1,
-0.0821911, -0.5683627, -2.36945, 1, 1, 1, 1, 1,
-0.07963654, -1.339145, -3.352368, 1, 1, 1, 1, 1,
-0.07732602, 0.5857216, -0.446551, 1, 1, 1, 1, 1,
-0.07458752, 1.468974, -1.215174, 1, 1, 1, 1, 1,
-0.07387943, -2.407317, -1.244407, 1, 1, 1, 1, 1,
-0.06968601, -0.2089817, -1.561721, 1, 1, 1, 1, 1,
-0.06771072, 1.038976, -0.348231, 1, 1, 1, 1, 1,
-0.05884123, 1.072807, -0.370796, 1, 1, 1, 1, 1,
-0.05848381, -1.461581, -1.206807, 0, 0, 1, 1, 1,
-0.05767512, 0.5368649, -0.5766379, 1, 0, 0, 1, 1,
-0.0468406, -0.6872866, -1.536521, 1, 0, 0, 1, 1,
-0.04550407, -1.262362, -3.192177, 1, 0, 0, 1, 1,
-0.04347745, 0.1081009, -1.026996, 1, 0, 0, 1, 1,
-0.04175554, -0.5873423, -3.206286, 1, 0, 0, 1, 1,
-0.03740082, 0.964655, -0.5412278, 0, 0, 0, 1, 1,
-0.02862284, -0.209398, -2.74688, 0, 0, 0, 1, 1,
-0.02706309, -0.8610345, -2.436218, 0, 0, 0, 1, 1,
-0.02592014, -1.20581, -2.610099, 0, 0, 0, 1, 1,
-0.02448315, 0.1118616, 0.2211465, 0, 0, 0, 1, 1,
-0.02112148, -1.438127, -3.212937, 0, 0, 0, 1, 1,
-0.02082062, -1.029571, -4.298989, 0, 0, 0, 1, 1,
-0.02032191, 1.091613, 0.08504802, 1, 1, 1, 1, 1,
-0.01925021, 1.692724, -0.8430032, 1, 1, 1, 1, 1,
-0.01767222, -0.9425477, -3.746352, 1, 1, 1, 1, 1,
-0.01610396, -0.6867639, -2.922357, 1, 1, 1, 1, 1,
-0.01584986, 2.73127, -0.05285469, 1, 1, 1, 1, 1,
-0.01327013, -2.388408, -4.087147, 1, 1, 1, 1, 1,
-0.01298566, -0.2624888, -3.085871, 1, 1, 1, 1, 1,
-0.006293868, 0.9660612, -0.7552636, 1, 1, 1, 1, 1,
-0.005877083, 1.191674, -0.1634491, 1, 1, 1, 1, 1,
-0.00517358, 0.1375071, 0.2709265, 1, 1, 1, 1, 1,
-0.004910543, -2.168378, -1.623051, 1, 1, 1, 1, 1,
0.004904673, 0.2549703, -2.480828, 1, 1, 1, 1, 1,
0.005758327, 2.058046, -0.4460598, 1, 1, 1, 1, 1,
0.009382903, 1.899328, 0.8463188, 1, 1, 1, 1, 1,
0.01002483, -0.5709874, 3.630931, 1, 1, 1, 1, 1,
0.0143736, 0.4047682, 0.7675286, 0, 0, 1, 1, 1,
0.01897762, 0.9760194, 1.555909, 1, 0, 0, 1, 1,
0.02215469, -0.6755974, 2.450172, 1, 0, 0, 1, 1,
0.02657502, -0.04370838, 3.0146, 1, 0, 0, 1, 1,
0.04182877, -0.7901089, 2.637893, 1, 0, 0, 1, 1,
0.04933993, -0.34328, 2.379771, 1, 0, 0, 1, 1,
0.05025515, -0.6542427, 4.19842, 0, 0, 0, 1, 1,
0.05092095, -0.6402097, 3.134915, 0, 0, 0, 1, 1,
0.05256896, -1.049053, 2.92774, 0, 0, 0, 1, 1,
0.05267939, -0.7595212, 3.356053, 0, 0, 0, 1, 1,
0.0591126, -0.2342989, 3.64466, 0, 0, 0, 1, 1,
0.05931306, -0.9402858, 2.577937, 0, 0, 0, 1, 1,
0.06045589, -0.7669172, 4.509365, 0, 0, 0, 1, 1,
0.06097392, 0.6341606, -0.267766, 1, 1, 1, 1, 1,
0.06564304, -1.187069, 1.279943, 1, 1, 1, 1, 1,
0.06594291, -0.5501007, 2.087047, 1, 1, 1, 1, 1,
0.06927451, 0.70272, -1.300243, 1, 1, 1, 1, 1,
0.0716808, -0.4331391, 2.860056, 1, 1, 1, 1, 1,
0.07545658, 0.1799871, -0.2298553, 1, 1, 1, 1, 1,
0.08210456, -0.8241141, 3.127521, 1, 1, 1, 1, 1,
0.08331542, 0.8162334, -0.3521698, 1, 1, 1, 1, 1,
0.08544034, -0.03713332, 1.559776, 1, 1, 1, 1, 1,
0.09394074, 0.3658391, 2.192401, 1, 1, 1, 1, 1,
0.09980498, -0.4539866, 3.181711, 1, 1, 1, 1, 1,
0.1047381, 0.1979961, 0.9062552, 1, 1, 1, 1, 1,
0.106531, 0.06689038, 1.036401, 1, 1, 1, 1, 1,
0.107321, 2.307352, -0.9236668, 1, 1, 1, 1, 1,
0.1084194, 0.4611108, 1.927854, 1, 1, 1, 1, 1,
0.1102513, -0.8091888, 2.435271, 0, 0, 1, 1, 1,
0.1117839, 1.441038, 0.2958232, 1, 0, 0, 1, 1,
0.1147704, 0.789458, -0.08704494, 1, 0, 0, 1, 1,
0.1170572, 0.6740334, -2.166256, 1, 0, 0, 1, 1,
0.1176629, -0.3717479, 3.227998, 1, 0, 0, 1, 1,
0.1192216, -1.100766, 3.149126, 1, 0, 0, 1, 1,
0.1196914, -0.01248626, 2.656512, 0, 0, 0, 1, 1,
0.1299904, 2.304356, -1.547698, 0, 0, 0, 1, 1,
0.1320515, -0.2790664, 2.335023, 0, 0, 0, 1, 1,
0.1350994, -0.1028169, 2.816764, 0, 0, 0, 1, 1,
0.1372344, -3.079456, 3.676015, 0, 0, 0, 1, 1,
0.1390469, 0.5887558, 0.1664591, 0, 0, 0, 1, 1,
0.1407194, 0.6601328, 0.07973184, 0, 0, 0, 1, 1,
0.1436291, -0.6066268, 2.920666, 1, 1, 1, 1, 1,
0.1437632, -0.1202027, 1.13061, 1, 1, 1, 1, 1,
0.1481177, 0.02580975, 0.7344497, 1, 1, 1, 1, 1,
0.1492631, -0.1324759, 2.936572, 1, 1, 1, 1, 1,
0.1523945, 2.00402, 1.418095, 1, 1, 1, 1, 1,
0.1562615, 0.3755068, 1.255945, 1, 1, 1, 1, 1,
0.1574294, 0.7438305, -0.1678901, 1, 1, 1, 1, 1,
0.1586791, 1.411717, 1.925543, 1, 1, 1, 1, 1,
0.1618447, 0.5943922, 1.518763, 1, 1, 1, 1, 1,
0.1649575, -0.5847066, 0.6762809, 1, 1, 1, 1, 1,
0.1667477, -1.692914, 1.379924, 1, 1, 1, 1, 1,
0.1682921, 0.811308, 0.4018096, 1, 1, 1, 1, 1,
0.1684404, 2.137911, 0.6556481, 1, 1, 1, 1, 1,
0.1717197, 0.5743557, 0.6358558, 1, 1, 1, 1, 1,
0.1745819, -0.6522995, 2.11492, 1, 1, 1, 1, 1,
0.1764587, 0.710272, 0.7821004, 0, 0, 1, 1, 1,
0.1838874, 0.4373748, -0.7553999, 1, 0, 0, 1, 1,
0.1840159, 1.260964, -0.2556072, 1, 0, 0, 1, 1,
0.1935235, -0.634038, 4.519313, 1, 0, 0, 1, 1,
0.1966528, -1.355823, 5.520323, 1, 0, 0, 1, 1,
0.1979517, 1.068785, 1.212417, 1, 0, 0, 1, 1,
0.1985954, -0.8567992, 2.633836, 0, 0, 0, 1, 1,
0.200041, -0.6636828, 1.777485, 0, 0, 0, 1, 1,
0.201276, -0.321526, 1.954676, 0, 0, 0, 1, 1,
0.20147, 1.185523, -1.392043, 0, 0, 0, 1, 1,
0.2026184, 0.1066607, -0.7376007, 0, 0, 0, 1, 1,
0.2044569, 1.600375, -0.2919052, 0, 0, 0, 1, 1,
0.2073612, 0.7729313, -1.715199, 0, 0, 0, 1, 1,
0.2084435, 1.436628, -1.159944, 1, 1, 1, 1, 1,
0.2102991, -0.2582551, 0.7396921, 1, 1, 1, 1, 1,
0.2123809, -1.00217, 2.846204, 1, 1, 1, 1, 1,
0.2126707, -0.7469667, 1.695676, 1, 1, 1, 1, 1,
0.213944, 0.375795, 1.443958, 1, 1, 1, 1, 1,
0.215877, 1.036525, 0.737287, 1, 1, 1, 1, 1,
0.2160576, -0.1234652, 3.57988, 1, 1, 1, 1, 1,
0.2184025, -0.7848514, 2.633371, 1, 1, 1, 1, 1,
0.2201587, -0.2630166, 2.79587, 1, 1, 1, 1, 1,
0.2236648, 0.4580937, -0.5339938, 1, 1, 1, 1, 1,
0.2257385, -1.095091, 3.056702, 1, 1, 1, 1, 1,
0.2269632, -0.8443567, 1.776425, 1, 1, 1, 1, 1,
0.2295292, -0.6395741, 4.104634, 1, 1, 1, 1, 1,
0.2320041, -1.33874, 4.922161, 1, 1, 1, 1, 1,
0.2331709, -0.1328908, 1.627145, 1, 1, 1, 1, 1,
0.2339653, 2.10472, -1.185488, 0, 0, 1, 1, 1,
0.235046, -0.7838853, 4.730371, 1, 0, 0, 1, 1,
0.2393605, 0.3043229, 1.195207, 1, 0, 0, 1, 1,
0.2417423, -1.517306, 3.100096, 1, 0, 0, 1, 1,
0.2429412, -1.651059, 2.903234, 1, 0, 0, 1, 1,
0.2431105, -0.7042417, 2.430792, 1, 0, 0, 1, 1,
0.2599224, 0.2849451, 0.8966519, 0, 0, 0, 1, 1,
0.2606172, 0.7661123, 0.7959334, 0, 0, 0, 1, 1,
0.2676888, -0.7509896, 3.390774, 0, 0, 0, 1, 1,
0.2701395, -0.6428842, 2.600343, 0, 0, 0, 1, 1,
0.2707219, -1.343985, 4.487719, 0, 0, 0, 1, 1,
0.270932, -1.193739, 4.649251, 0, 0, 0, 1, 1,
0.2825775, -1.142138, 3.91084, 0, 0, 0, 1, 1,
0.2854957, 0.3089311, -0.5223693, 1, 1, 1, 1, 1,
0.2872429, 0.4494433, -0.4934281, 1, 1, 1, 1, 1,
0.2874615, 0.1488265, 0.2787977, 1, 1, 1, 1, 1,
0.2906615, -1.520305, 2.093559, 1, 1, 1, 1, 1,
0.2910703, -0.352727, 3.039348, 1, 1, 1, 1, 1,
0.2953652, -1.258687, 2.283503, 1, 1, 1, 1, 1,
0.2970753, 0.8717664, 1.536697, 1, 1, 1, 1, 1,
0.3003614, -0.5007876, 1.230158, 1, 1, 1, 1, 1,
0.3038184, -0.9260504, 2.882136, 1, 1, 1, 1, 1,
0.3067192, 1.142587, 0.5364357, 1, 1, 1, 1, 1,
0.3112276, -0.5674344, 2.048965, 1, 1, 1, 1, 1,
0.3115102, -0.4061648, -0.1690443, 1, 1, 1, 1, 1,
0.3140273, 0.737955, -1.130203, 1, 1, 1, 1, 1,
0.3142282, -0.562534, 3.40286, 1, 1, 1, 1, 1,
0.3161137, -2.313646, 3.017413, 1, 1, 1, 1, 1,
0.3175077, 0.6724337, 0.2755497, 0, 0, 1, 1, 1,
0.3223897, -0.7596128, 3.143809, 1, 0, 0, 1, 1,
0.3228858, 0.2092415, 0.2957752, 1, 0, 0, 1, 1,
0.3233615, 1.046544, -1.354964, 1, 0, 0, 1, 1,
0.3264152, -1.115516, 2.582392, 1, 0, 0, 1, 1,
0.3303535, 0.3351225, 0.268911, 1, 0, 0, 1, 1,
0.3336912, 1.599739, 1.652267, 0, 0, 0, 1, 1,
0.3380177, -1.2234, 3.115525, 0, 0, 0, 1, 1,
0.3424063, 0.05654201, 1.889108, 0, 0, 0, 1, 1,
0.3440569, 0.1562321, 1.466408, 0, 0, 0, 1, 1,
0.3445167, -1.09219, 4.24739, 0, 0, 0, 1, 1,
0.3472917, -1.399073, 3.196471, 0, 0, 0, 1, 1,
0.3500239, -0.6727628, 3.624598, 0, 0, 0, 1, 1,
0.3521497, 0.1810898, -0.5729732, 1, 1, 1, 1, 1,
0.3530052, 0.7369636, 0.3773779, 1, 1, 1, 1, 1,
0.3539025, -0.1115433, 1.757807, 1, 1, 1, 1, 1,
0.3562852, -0.3530037, 3.113965, 1, 1, 1, 1, 1,
0.357046, -0.1523015, 2.747763, 1, 1, 1, 1, 1,
0.3607827, -0.749573, 2.128079, 1, 1, 1, 1, 1,
0.3659186, -0.4923451, 2.108431, 1, 1, 1, 1, 1,
0.3685328, -1.188636, 2.855816, 1, 1, 1, 1, 1,
0.38037, -0.03163998, 1.849856, 1, 1, 1, 1, 1,
0.3815081, 1.122149, 1.007585, 1, 1, 1, 1, 1,
0.3868442, -1.499771, 3.677297, 1, 1, 1, 1, 1,
0.3897951, 1.318096, -1.071384, 1, 1, 1, 1, 1,
0.3900713, -0.2473842, 2.049515, 1, 1, 1, 1, 1,
0.3945449, -0.2380429, 0.3863945, 1, 1, 1, 1, 1,
0.3954395, 0.5757492, 1.806244, 1, 1, 1, 1, 1,
0.3958219, -0.8105785, 2.25182, 0, 0, 1, 1, 1,
0.3960458, -0.00504472, 1.72384, 1, 0, 0, 1, 1,
0.3962243, 0.03042109, 0.9117433, 1, 0, 0, 1, 1,
0.4048066, 0.1895391, 0.9293169, 1, 0, 0, 1, 1,
0.4123876, 1.019441, -0.07705718, 1, 0, 0, 1, 1,
0.4135197, -0.1093113, 0.458304, 1, 0, 0, 1, 1,
0.4193925, -1.088241, 2.343106, 0, 0, 0, 1, 1,
0.4217169, 1.188241, 0.06564176, 0, 0, 0, 1, 1,
0.4284187, 1.389453, 0.7304867, 0, 0, 0, 1, 1,
0.4292335, -0.6727248, 1.926355, 0, 0, 0, 1, 1,
0.4301519, 1.521052, -0.5910249, 0, 0, 0, 1, 1,
0.4358435, -1.227956, 2.854216, 0, 0, 0, 1, 1,
0.4397491, 0.4256403, 2.432182, 0, 0, 0, 1, 1,
0.4415033, -0.435541, 3.277675, 1, 1, 1, 1, 1,
0.4439087, 1.388009, 1.567399, 1, 1, 1, 1, 1,
0.4449649, 0.4597574, -0.1479033, 1, 1, 1, 1, 1,
0.4466833, -2.796696, 4.519532, 1, 1, 1, 1, 1,
0.4468088, -0.1013119, 3.119647, 1, 1, 1, 1, 1,
0.4474498, -1.034375, 0.6757737, 1, 1, 1, 1, 1,
0.448004, -1.085565, 3.811749, 1, 1, 1, 1, 1,
0.4483551, 1.645189, -0.3489776, 1, 1, 1, 1, 1,
0.4493818, 0.820741, -0.1671136, 1, 1, 1, 1, 1,
0.4499091, 0.6539469, 0.6623239, 1, 1, 1, 1, 1,
0.4528558, 0.08199791, 0.9134469, 1, 1, 1, 1, 1,
0.4531814, -0.604329, 2.316023, 1, 1, 1, 1, 1,
0.4536354, 0.08661098, 0.3333535, 1, 1, 1, 1, 1,
0.4537894, 0.7699692, -0.7733198, 1, 1, 1, 1, 1,
0.4560974, 0.8651325, 0.7856575, 1, 1, 1, 1, 1,
0.4571462, 1.940241, 0.6562789, 0, 0, 1, 1, 1,
0.465446, 0.0422332, 1.047998, 1, 0, 0, 1, 1,
0.4743505, -1.250591, 2.233279, 1, 0, 0, 1, 1,
0.4749214, 0.1708211, 0.02821787, 1, 0, 0, 1, 1,
0.4761675, 0.8931327, -0.3439495, 1, 0, 0, 1, 1,
0.4772229, 1.140872, 0.7157146, 1, 0, 0, 1, 1,
0.4816284, -1.641294, 1.980268, 0, 0, 0, 1, 1,
0.4836337, 2.148262, 0.9781402, 0, 0, 0, 1, 1,
0.4871193, 0.9048792, 0.7245876, 0, 0, 0, 1, 1,
0.4893406, -1.324484, 1.977439, 0, 0, 0, 1, 1,
0.4910579, -2.07036, 2.853745, 0, 0, 0, 1, 1,
0.4910794, -0.9165232, 4.142914, 0, 0, 0, 1, 1,
0.4915367, 1.662704, 0.159293, 0, 0, 0, 1, 1,
0.4945558, -0.6114304, 1.511435, 1, 1, 1, 1, 1,
0.5010672, 1.384868, 0.954478, 1, 1, 1, 1, 1,
0.5020571, 0.5073333, 0.01047222, 1, 1, 1, 1, 1,
0.5022057, 0.1348525, 2.58227, 1, 1, 1, 1, 1,
0.5143211, -0.1273858, 1.764605, 1, 1, 1, 1, 1,
0.5182565, 1.4171, -0.9572012, 1, 1, 1, 1, 1,
0.5204259, -0.4088864, 3.401725, 1, 1, 1, 1, 1,
0.5225704, 0.08284166, 2.814555, 1, 1, 1, 1, 1,
0.5251765, -0.2127969, 2.385324, 1, 1, 1, 1, 1,
0.5259957, 0.5334831, 1.300625, 1, 1, 1, 1, 1,
0.5286994, -0.1626814, 3.250473, 1, 1, 1, 1, 1,
0.5330542, 0.515388, -0.1109787, 1, 1, 1, 1, 1,
0.5375208, 0.3013875, 0.06201595, 1, 1, 1, 1, 1,
0.5407194, 1.605683, 0.4152693, 1, 1, 1, 1, 1,
0.5420812, 1.37608, 2.14486, 1, 1, 1, 1, 1,
0.5486212, 0.04137648, 3.869706, 0, 0, 1, 1, 1,
0.5494509, 2.197593, 0.4250943, 1, 0, 0, 1, 1,
0.5506008, -0.4937979, 3.020471, 1, 0, 0, 1, 1,
0.55091, -1.034419, 2.763745, 1, 0, 0, 1, 1,
0.5556591, -1.530141, 1.202826, 1, 0, 0, 1, 1,
0.5615108, 0.07660666, 1.173051, 1, 0, 0, 1, 1,
0.584822, -1.188771, 2.414979, 0, 0, 0, 1, 1,
0.5858854, 0.5151123, 1.110844, 0, 0, 0, 1, 1,
0.5898976, -1.613093, 3.729324, 0, 0, 0, 1, 1,
0.5946103, -0.5229487, 1.603064, 0, 0, 0, 1, 1,
0.5960327, -0.06455029, 0.2259066, 0, 0, 0, 1, 1,
0.5986605, -0.2065838, 1.415244, 0, 0, 0, 1, 1,
0.6060989, -0.9807442, 2.360591, 0, 0, 0, 1, 1,
0.607104, 0.4664489, 1.962832, 1, 1, 1, 1, 1,
0.6071667, 0.03115808, 2.12949, 1, 1, 1, 1, 1,
0.6130189, 0.7359884, 1.87018, 1, 1, 1, 1, 1,
0.6187218, -0.522489, 3.610126, 1, 1, 1, 1, 1,
0.6216899, -0.4944999, 1.925774, 1, 1, 1, 1, 1,
0.6232386, -2.587919, 3.977182, 1, 1, 1, 1, 1,
0.6232488, -1.995386, 1.268255, 1, 1, 1, 1, 1,
0.6261811, 0.4310887, -0.1015796, 1, 1, 1, 1, 1,
0.6263742, -0.811551, 1.139929, 1, 1, 1, 1, 1,
0.6376523, 0.5328522, 1.34319, 1, 1, 1, 1, 1,
0.6377441, -1.333297, 3.952774, 1, 1, 1, 1, 1,
0.6461734, -0.1705595, 2.760236, 1, 1, 1, 1, 1,
0.6471041, -0.3460979, 2.489097, 1, 1, 1, 1, 1,
0.6499859, 2.150434, -0.9055998, 1, 1, 1, 1, 1,
0.6506801, -0.6925128, 2.690967, 1, 1, 1, 1, 1,
0.6518953, -1.246222, 3.140827, 0, 0, 1, 1, 1,
0.6586277, -0.6598239, 2.345047, 1, 0, 0, 1, 1,
0.6587172, 0.07967182, 1.135529, 1, 0, 0, 1, 1,
0.664144, -0.9848536, 3.825885, 1, 0, 0, 1, 1,
0.6760494, 0.05252751, 1.895217, 1, 0, 0, 1, 1,
0.6785424, -0.745803, 2.238026, 1, 0, 0, 1, 1,
0.6799657, -0.01441314, -0.1279207, 0, 0, 0, 1, 1,
0.6809844, 0.4653936, 0.4273581, 0, 0, 0, 1, 1,
0.6889578, -0.1358417, 2.085037, 0, 0, 0, 1, 1,
0.6905422, 1.11862, 0.2125694, 0, 0, 0, 1, 1,
0.6909853, 0.1720607, 0.82426, 0, 0, 0, 1, 1,
0.6918961, -0.6031811, 1.916177, 0, 0, 0, 1, 1,
0.6948621, 2.323116, -0.4404494, 0, 0, 0, 1, 1,
0.6972893, -2.273448, 3.952695, 1, 1, 1, 1, 1,
0.697768, -2.197522, 3.370215, 1, 1, 1, 1, 1,
0.6995341, 0.6321812, 1.691164, 1, 1, 1, 1, 1,
0.7101955, -1.068553, 3.04579, 1, 1, 1, 1, 1,
0.7116547, 0.1427269, 0.8553856, 1, 1, 1, 1, 1,
0.7132438, -0.4767697, -1.210167, 1, 1, 1, 1, 1,
0.7145348, -1.273312, 3.275322, 1, 1, 1, 1, 1,
0.7171157, 0.1192475, 0.6059659, 1, 1, 1, 1, 1,
0.7231498, 0.4106053, 0.2515937, 1, 1, 1, 1, 1,
0.7262887, 0.2297616, 0.386526, 1, 1, 1, 1, 1,
0.7359377, -2.281222, 1.120166, 1, 1, 1, 1, 1,
0.7363893, -0.7886682, 2.166708, 1, 1, 1, 1, 1,
0.7373686, 0.8969192, 0.01495427, 1, 1, 1, 1, 1,
0.7375984, 1.084734, -0.1682328, 1, 1, 1, 1, 1,
0.7397352, -0.6050178, 2.004705, 1, 1, 1, 1, 1,
0.7418327, -0.1930442, 2.049858, 0, 0, 1, 1, 1,
0.7446783, 1.116986, 1.716984, 1, 0, 0, 1, 1,
0.7500927, -0.305341, 1.352364, 1, 0, 0, 1, 1,
0.755207, -0.5583152, 1.326253, 1, 0, 0, 1, 1,
0.7553533, 0.4914446, 0.4629757, 1, 0, 0, 1, 1,
0.7589082, 0.9656793, 0.3211481, 1, 0, 0, 1, 1,
0.7610613, -1.059449, 1.291037, 0, 0, 0, 1, 1,
0.7691625, 0.3807496, 1.362516, 0, 0, 0, 1, 1,
0.7738091, -0.7659016, 3.300015, 0, 0, 0, 1, 1,
0.7740108, 0.6460057, 0.8427164, 0, 0, 0, 1, 1,
0.7827901, -0.2953973, 3.887714, 0, 0, 0, 1, 1,
0.7837414, -0.4567026, 3.168048, 0, 0, 0, 1, 1,
0.7913967, -0.8732439, 2.723578, 0, 0, 0, 1, 1,
0.7932501, 1.243286, -0.1952608, 1, 1, 1, 1, 1,
0.7940586, 0.4339674, 0.9820726, 1, 1, 1, 1, 1,
0.7959141, -0.5137784, 1.725234, 1, 1, 1, 1, 1,
0.7962224, 1.529482, 1.253579, 1, 1, 1, 1, 1,
0.8026254, -0.5894079, 1.867513, 1, 1, 1, 1, 1,
0.8033941, 0.6669754, 0.3641865, 1, 1, 1, 1, 1,
0.8055014, 0.4941112, 0.6385719, 1, 1, 1, 1, 1,
0.8060305, 0.6745405, 1.130605, 1, 1, 1, 1, 1,
0.8123058, -0.9923936, 3.85046, 1, 1, 1, 1, 1,
0.8129445, 0.7828234, 1.806107, 1, 1, 1, 1, 1,
0.8223802, 1.051242, -0.3127369, 1, 1, 1, 1, 1,
0.8232994, -1.010061, 2.325128, 1, 1, 1, 1, 1,
0.82895, -0.7764223, 1.882206, 1, 1, 1, 1, 1,
0.8289666, -0.1424246, 3.297344, 1, 1, 1, 1, 1,
0.837308, 1.006758, 0.5873361, 1, 1, 1, 1, 1,
0.8391385, -1.255259, 3.312789, 0, 0, 1, 1, 1,
0.8403842, -1.307108, 1.837338, 1, 0, 0, 1, 1,
0.8411636, 0.4372533, -0.03334539, 1, 0, 0, 1, 1,
0.8430132, -1.029546, 1.848931, 1, 0, 0, 1, 1,
0.8437703, 0.5739056, 3.387563, 1, 0, 0, 1, 1,
0.8437915, 1.406952, 0.1831048, 1, 0, 0, 1, 1,
0.8507866, -0.9350563, 2.088821, 0, 0, 0, 1, 1,
0.8510938, 0.5120344, 2.373943, 0, 0, 0, 1, 1,
0.8511098, -0.05665826, 1.191178, 0, 0, 0, 1, 1,
0.8518157, 0.2901628, 1.727179, 0, 0, 0, 1, 1,
0.8564563, 0.1806568, 0.5816541, 0, 0, 0, 1, 1,
0.8570284, 2.052379, -1.06809, 0, 0, 0, 1, 1,
0.8572344, 0.3244942, 0.9808837, 0, 0, 0, 1, 1,
0.8575959, -1.356138, 1.930442, 1, 1, 1, 1, 1,
0.8609715, 1.922418, 1.315127, 1, 1, 1, 1, 1,
0.8653691, 0.9681407, 0.4170868, 1, 1, 1, 1, 1,
0.8745193, -0.5993245, 2.908916, 1, 1, 1, 1, 1,
0.8777906, -0.6637852, 1.460717, 1, 1, 1, 1, 1,
0.8809659, -1.252182, 3.453147, 1, 1, 1, 1, 1,
0.8844587, 0.5657507, 0.07271586, 1, 1, 1, 1, 1,
0.8856542, 1.254264, -0.1741871, 1, 1, 1, 1, 1,
0.8934877, -0.2478341, 3.174376, 1, 1, 1, 1, 1,
0.8936169, 0.921927, 1.919215, 1, 1, 1, 1, 1,
0.8958923, -0.7698753, 2.614321, 1, 1, 1, 1, 1,
0.8970296, -0.9616579, 2.185464, 1, 1, 1, 1, 1,
0.8995577, 0.2008152, 2.389816, 1, 1, 1, 1, 1,
0.9020128, -0.4670872, 0.4382492, 1, 1, 1, 1, 1,
0.9025649, 0.7932944, 0.9925016, 1, 1, 1, 1, 1,
0.9078499, 0.3225915, 2.359171, 0, 0, 1, 1, 1,
0.9108284, 0.05153657, 1.169117, 1, 0, 0, 1, 1,
0.9127827, -0.9307782, 2.346395, 1, 0, 0, 1, 1,
0.9152747, 0.934164, -0.2941039, 1, 0, 0, 1, 1,
0.9287029, 0.8624957, 2.001789, 1, 0, 0, 1, 1,
0.9415917, -1.883249, 1.057873, 1, 0, 0, 1, 1,
0.9515982, -0.1009271, 1.282967, 0, 0, 0, 1, 1,
0.9554837, 0.5287761, 2.688553, 0, 0, 0, 1, 1,
0.9560839, 1.468545, 0.2089079, 0, 0, 0, 1, 1,
0.9567451, 0.9196073, 1.131548, 0, 0, 0, 1, 1,
0.9584765, 0.1978896, 1.12008, 0, 0, 0, 1, 1,
0.9603147, 1.968019, 2.026905, 0, 0, 0, 1, 1,
0.9607881, -0.01431131, 2.419863, 0, 0, 0, 1, 1,
0.9610399, 0.5087606, 0.6893019, 1, 1, 1, 1, 1,
0.9744569, -0.8967599, 1.692958, 1, 1, 1, 1, 1,
0.9812213, 0.7309572, 1.727488, 1, 1, 1, 1, 1,
0.9899613, 0.7148612, 1.290286, 1, 1, 1, 1, 1,
0.9931609, 0.01218409, 0.1002697, 1, 1, 1, 1, 1,
0.9971474, 0.6065151, -0.3824607, 1, 1, 1, 1, 1,
1.006101, 0.2050493, 0.5153553, 1, 1, 1, 1, 1,
1.01144, 0.40804, -0.3299959, 1, 1, 1, 1, 1,
1.017013, -1.557374, 2.126905, 1, 1, 1, 1, 1,
1.017632, 0.5260493, 1.656376, 1, 1, 1, 1, 1,
1.023167, 1.865153, -1.719488, 1, 1, 1, 1, 1,
1.0315, 2.255688, 1.563812, 1, 1, 1, 1, 1,
1.034574, 0.0679377, 2.228003, 1, 1, 1, 1, 1,
1.046124, -2.308094, -0.1845193, 1, 1, 1, 1, 1,
1.048134, 0.7163575, -0.8478121, 1, 1, 1, 1, 1,
1.060419, -0.6357654, 2.495616, 0, 0, 1, 1, 1,
1.061749, -0.6085013, 2.733014, 1, 0, 0, 1, 1,
1.062741, -0.6782175, 2.498024, 1, 0, 0, 1, 1,
1.068948, -0.02429992, 2.856859, 1, 0, 0, 1, 1,
1.075838, 0.940876, -0.9487544, 1, 0, 0, 1, 1,
1.07594, -0.9999028, 2.270457, 1, 0, 0, 1, 1,
1.07621, 0.7956349, 1.257461, 0, 0, 0, 1, 1,
1.084577, 0.05040637, -0.5106735, 0, 0, 0, 1, 1,
1.08915, -0.5012806, 2.888013, 0, 0, 0, 1, 1,
1.091701, -1.59547, 3.408328, 0, 0, 0, 1, 1,
1.121094, 1.804928, -0.8109142, 0, 0, 0, 1, 1,
1.1359, -1.675536, 2.278506, 0, 0, 0, 1, 1,
1.142552, -1.367027, 2.994091, 0, 0, 0, 1, 1,
1.144676, -0.003099485, 0.9741421, 1, 1, 1, 1, 1,
1.150903, -0.1181287, 1.836035, 1, 1, 1, 1, 1,
1.153886, -2.071592, 2.104008, 1, 1, 1, 1, 1,
1.15597, -2.228643, 2.976581, 1, 1, 1, 1, 1,
1.16168, 0.3887813, 0.8513607, 1, 1, 1, 1, 1,
1.167414, 0.2355211, 1.483315, 1, 1, 1, 1, 1,
1.172549, -2.031992, -0.1099947, 1, 1, 1, 1, 1,
1.172973, -0.1159785, 1.661858, 1, 1, 1, 1, 1,
1.178358, -0.6473289, 0.961754, 1, 1, 1, 1, 1,
1.186266, -0.4878829, 0.5290029, 1, 1, 1, 1, 1,
1.191632, 1.828071, 2.10731, 1, 1, 1, 1, 1,
1.198574, -0.7794366, 2.357868, 1, 1, 1, 1, 1,
1.204533, -0.0182566, 1.73115, 1, 1, 1, 1, 1,
1.210542, -1.148356, 2.364493, 1, 1, 1, 1, 1,
1.212668, -0.8877636, 1.021937, 1, 1, 1, 1, 1,
1.223515, -0.2099936, 1.237942, 0, 0, 1, 1, 1,
1.224257, -1.494781, 1.313896, 1, 0, 0, 1, 1,
1.225879, 1.43101, 0.9967192, 1, 0, 0, 1, 1,
1.228216, -1.269108, 2.223566, 1, 0, 0, 1, 1,
1.233969, -0.4354953, 2.685429, 1, 0, 0, 1, 1,
1.236619, 0.7493582, 1.534541, 1, 0, 0, 1, 1,
1.237486, 1.68289, 1.029189, 0, 0, 0, 1, 1,
1.239956, 0.2228643, -0.703416, 0, 0, 0, 1, 1,
1.255673, 0.4542833, 0.5741305, 0, 0, 0, 1, 1,
1.260931, 0.8970852, 0.2861894, 0, 0, 0, 1, 1,
1.268442, 0.8576176, -0.028539, 0, 0, 0, 1, 1,
1.268482, 0.2413538, 1.372102, 0, 0, 0, 1, 1,
1.270964, -0.007354308, 2.818742, 0, 0, 0, 1, 1,
1.276861, -1.67809, 3.936984, 1, 1, 1, 1, 1,
1.277382, 0.08093044, 1.271101, 1, 1, 1, 1, 1,
1.28053, 0.404687, 1.940213, 1, 1, 1, 1, 1,
1.287848, -0.8541576, 1.383548, 1, 1, 1, 1, 1,
1.291371, 0.2515921, 1.936779, 1, 1, 1, 1, 1,
1.297752, -0.2727374, 3.103421, 1, 1, 1, 1, 1,
1.311697, 0.5296829, -0.2641605, 1, 1, 1, 1, 1,
1.32068, -0.1694903, 1.484545, 1, 1, 1, 1, 1,
1.332664, -1.357703, 2.333515, 1, 1, 1, 1, 1,
1.360105, -0.604643, 1.628114, 1, 1, 1, 1, 1,
1.362042, 0.3574783, -0.5686375, 1, 1, 1, 1, 1,
1.37044, 0.04444912, 1.718623, 1, 1, 1, 1, 1,
1.372214, 1.908737, 0.3388428, 1, 1, 1, 1, 1,
1.380408, -1.335168, 3.343133, 1, 1, 1, 1, 1,
1.410095, -0.2008476, 1.646448, 1, 1, 1, 1, 1,
1.410806, 1.79453, 1.245201, 0, 0, 1, 1, 1,
1.411488, 1.987163, -0.840241, 1, 0, 0, 1, 1,
1.412538, -1.178864, 2.113867, 1, 0, 0, 1, 1,
1.417477, -4.599218, 3.820395, 1, 0, 0, 1, 1,
1.427662, -1.443803, 3.207641, 1, 0, 0, 1, 1,
1.433772, -1.324396, 3.856459, 1, 0, 0, 1, 1,
1.44519, -0.4475186, 0.8205234, 0, 0, 0, 1, 1,
1.453818, -1.035507, 1.751555, 0, 0, 0, 1, 1,
1.464859, -0.7823888, 2.645228, 0, 0, 0, 1, 1,
1.466529, 0.4531212, 1.110084, 0, 0, 0, 1, 1,
1.473276, 0.6093811, 2.745173, 0, 0, 0, 1, 1,
1.474693, 0.9149058, 1.475855, 0, 0, 0, 1, 1,
1.487252, -0.5948057, 1.214033, 0, 0, 0, 1, 1,
1.490414, 1.023337, 1.226755, 1, 1, 1, 1, 1,
1.499795, 1.081829, -0.1637995, 1, 1, 1, 1, 1,
1.513232, 0.2925076, 1.899356, 1, 1, 1, 1, 1,
1.524374, -0.01943964, 1.028646, 1, 1, 1, 1, 1,
1.525976, -0.3275522, 2.373543, 1, 1, 1, 1, 1,
1.537479, 0.6449522, 1.059374, 1, 1, 1, 1, 1,
1.53879, 1.228936, 1.371985, 1, 1, 1, 1, 1,
1.551833, -1.908828, 4.09746, 1, 1, 1, 1, 1,
1.554939, -1.154803, 2.1288, 1, 1, 1, 1, 1,
1.557338, -0.7064878, 3.165294, 1, 1, 1, 1, 1,
1.560957, -1.634557, 3.8475, 1, 1, 1, 1, 1,
1.564969, -1.1883, 3.965102, 1, 1, 1, 1, 1,
1.58253, 0.4258474, 2.439622, 1, 1, 1, 1, 1,
1.600434, 0.5916517, 1.269372, 1, 1, 1, 1, 1,
1.60412, 0.4489039, 0.5700004, 1, 1, 1, 1, 1,
1.613931, 0.3748994, 2.116196, 0, 0, 1, 1, 1,
1.613941, 1.556689, -0.05805089, 1, 0, 0, 1, 1,
1.621772, 0.9518183, 0.395029, 1, 0, 0, 1, 1,
1.62794, 0.4163185, 1.846156, 1, 0, 0, 1, 1,
1.641238, 0.6068043, 3.14243, 1, 0, 0, 1, 1,
1.664147, 0.1242024, 1.33693, 1, 0, 0, 1, 1,
1.675892, -2.149558, 2.949279, 0, 0, 0, 1, 1,
1.679219, -0.2059163, 2.676793, 0, 0, 0, 1, 1,
1.683034, -0.2521883, 2.0114, 0, 0, 0, 1, 1,
1.691161, 1.60694, -0.2037182, 0, 0, 0, 1, 1,
1.691196, 0.06295942, 0.8806257, 0, 0, 0, 1, 1,
1.724718, 0.4795601, 0.4452848, 0, 0, 0, 1, 1,
1.736962, -1.47583, 1.908477, 0, 0, 0, 1, 1,
1.744125, -1.949071, 2.342107, 1, 1, 1, 1, 1,
1.754466, 0.09825371, 2.598574, 1, 1, 1, 1, 1,
1.768878, -0.5782005, 0.4918453, 1, 1, 1, 1, 1,
1.78693, -0.2470723, 2.536958, 1, 1, 1, 1, 1,
1.791224, 0.4186148, 1.640893, 1, 1, 1, 1, 1,
1.801509, 0.6868279, 2.476691, 1, 1, 1, 1, 1,
1.812599, -0.1453103, 2.226352, 1, 1, 1, 1, 1,
1.818252, 2.48231, 1.982527, 1, 1, 1, 1, 1,
1.828879, 0.1325654, 1.544636, 1, 1, 1, 1, 1,
1.845224, -0.4521996, -0.4332615, 1, 1, 1, 1, 1,
1.846681, -0.2905806, 2.313055, 1, 1, 1, 1, 1,
1.850829, 0.1096375, 2.049102, 1, 1, 1, 1, 1,
1.851306, 0.4028922, 2.647932, 1, 1, 1, 1, 1,
1.858704, 0.7920425, 0.4349687, 1, 1, 1, 1, 1,
1.878949, -0.1582002, 2.076285, 1, 1, 1, 1, 1,
1.910403, 0.2016991, 3.540051, 0, 0, 1, 1, 1,
1.935504, 1.090232, 0.7343081, 1, 0, 0, 1, 1,
1.993947, -0.529314, 1.371584, 1, 0, 0, 1, 1,
1.997834, -1.250547, 3.004261, 1, 0, 0, 1, 1,
2.024354, 0.4999024, 1.167028, 1, 0, 0, 1, 1,
2.02775, 0.547398, 0.5567134, 1, 0, 0, 1, 1,
2.049961, 0.6799962, 1.280062, 0, 0, 0, 1, 1,
2.075232, 0.4921769, 2.54247, 0, 0, 0, 1, 1,
2.075401, 1.12973, 1.458065, 0, 0, 0, 1, 1,
2.091507, 0.9574831, 0.7514535, 0, 0, 0, 1, 1,
2.115449, -0.3715207, 1.305005, 0, 0, 0, 1, 1,
2.125779, 0.5690476, 1.004257, 0, 0, 0, 1, 1,
2.130798, 1.296459, 1.792294, 0, 0, 0, 1, 1,
2.139453, -0.4315633, 1.261203, 1, 1, 1, 1, 1,
2.161919, 0.7539788, 2.763953, 1, 1, 1, 1, 1,
2.195049, 0.3234296, 3.329154, 1, 1, 1, 1, 1,
2.308582, -0.3136302, 0.5311815, 1, 1, 1, 1, 1,
2.322732, 0.8497182, 1.057974, 1, 1, 1, 1, 1,
2.352959, -1.267481, 1.237676, 1, 1, 1, 1, 1,
2.542871, 0.5243689, 1.507645, 1, 1, 1, 1, 1
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
var radius = 9.799209;
var distance = 34.41931;
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
mvMatrix.translate( 0.269402, 0.7638359, -0.08256316 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41931);
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