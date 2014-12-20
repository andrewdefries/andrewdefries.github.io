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
-3.381636, 0.7910262, -2.543398, 1, 0, 0, 1,
-2.863772, -0.1642636, -0.6409043, 1, 0.007843138, 0, 1,
-2.737861, 0.2910706, -2.177323, 1, 0.01176471, 0, 1,
-2.607502, -0.06275509, -2.008273, 1, 0.01960784, 0, 1,
-2.565483, 1.655687, -1.349416, 1, 0.02352941, 0, 1,
-2.554139, -0.1299804, -2.297559, 1, 0.03137255, 0, 1,
-2.546856, -0.4110652, -2.953774, 1, 0.03529412, 0, 1,
-2.536937, -1.098426, -1.532276, 1, 0.04313726, 0, 1,
-2.524036, 1.695044, -0.3869341, 1, 0.04705882, 0, 1,
-2.469888, 1.333156, -2.443251, 1, 0.05490196, 0, 1,
-2.41191, 0.6026628, -0.8693742, 1, 0.05882353, 0, 1,
-2.351156, -0.8046247, -1.762716, 1, 0.06666667, 0, 1,
-2.330877, -0.3916481, -2.992779, 1, 0.07058824, 0, 1,
-2.308275, -2.460185, -1.640276, 1, 0.07843138, 0, 1,
-2.289038, 0.8775309, -2.414639, 1, 0.08235294, 0, 1,
-2.276315, -0.4997282, -2.703014, 1, 0.09019608, 0, 1,
-2.274122, 0.8726174, -0.6659328, 1, 0.09411765, 0, 1,
-2.267704, -0.4628372, -1.240786, 1, 0.1019608, 0, 1,
-2.267256, -0.07790794, -1.583866, 1, 0.1098039, 0, 1,
-2.26351, 0.8753732, -1.591645, 1, 0.1137255, 0, 1,
-2.263296, 0.2944583, -0.9816971, 1, 0.1215686, 0, 1,
-2.247889, 1.646837, -1.012239, 1, 0.1254902, 0, 1,
-2.221297, 1.320553, -0.7706779, 1, 0.1333333, 0, 1,
-2.213047, -0.5709468, -0.0619736, 1, 0.1372549, 0, 1,
-2.193537, -2.056973, -3.616482, 1, 0.145098, 0, 1,
-2.143405, -0.1299014, -0.9469618, 1, 0.1490196, 0, 1,
-2.122807, 0.1813102, -1.98545, 1, 0.1568628, 0, 1,
-2.088538, -0.01768048, -0.7051541, 1, 0.1607843, 0, 1,
-1.991824, -0.4392916, -0.6850596, 1, 0.1686275, 0, 1,
-1.965399, -0.8603123, -2.23208, 1, 0.172549, 0, 1,
-1.963274, 1.489894, -0.2839067, 1, 0.1803922, 0, 1,
-1.959681, -0.3237261, -1.298811, 1, 0.1843137, 0, 1,
-1.941685, 0.6305481, -0.9444209, 1, 0.1921569, 0, 1,
-1.922611, 0.7551386, -0.6956408, 1, 0.1960784, 0, 1,
-1.915988, 2.798989, 1.00372, 1, 0.2039216, 0, 1,
-1.895283, 0.3868546, -0.7812423, 1, 0.2117647, 0, 1,
-1.854025, -0.5944275, -1.295015, 1, 0.2156863, 0, 1,
-1.852575, -0.3466474, -0.3812303, 1, 0.2235294, 0, 1,
-1.836252, -1.138264, -2.335601, 1, 0.227451, 0, 1,
-1.828841, -0.2330085, -3.601893, 1, 0.2352941, 0, 1,
-1.827039, 0.7940792, -2.493288, 1, 0.2392157, 0, 1,
-1.823991, -0.961657, -2.679865, 1, 0.2470588, 0, 1,
-1.817296, 0.7866296, -1.941181, 1, 0.2509804, 0, 1,
-1.815837, 0.9161782, -0.9577746, 1, 0.2588235, 0, 1,
-1.800209, -1.795965, -3.893025, 1, 0.2627451, 0, 1,
-1.799982, -1.182095, -2.928695, 1, 0.2705882, 0, 1,
-1.791105, -0.1944761, -3.262971, 1, 0.2745098, 0, 1,
-1.787995, 0.4248274, -0.761358, 1, 0.282353, 0, 1,
-1.767356, 0.0387278, -2.306021, 1, 0.2862745, 0, 1,
-1.761374, 0.8808407, -1.99738, 1, 0.2941177, 0, 1,
-1.746752, -1.657637, -2.510874, 1, 0.3019608, 0, 1,
-1.722619, -1.300192, -1.451569, 1, 0.3058824, 0, 1,
-1.710352, 0.0614191, -0.9536283, 1, 0.3137255, 0, 1,
-1.701933, 3.119598, 0.3086362, 1, 0.3176471, 0, 1,
-1.69776, 1.328601, 0.6775256, 1, 0.3254902, 0, 1,
-1.694781, -0.02704113, -2.056401, 1, 0.3294118, 0, 1,
-1.673836, 0.3892533, -2.053047, 1, 0.3372549, 0, 1,
-1.673122, 0.2821112, -0.8085297, 1, 0.3411765, 0, 1,
-1.662745, -0.3657894, -2.312181, 1, 0.3490196, 0, 1,
-1.64191, 0.5286153, -2.152694, 1, 0.3529412, 0, 1,
-1.640659, -0.3294472, -1.466332, 1, 0.3607843, 0, 1,
-1.6354, 0.1875799, -3.994687, 1, 0.3647059, 0, 1,
-1.613439, 2.720013, -1.45353, 1, 0.372549, 0, 1,
-1.61243, -0.3049625, -0.7449855, 1, 0.3764706, 0, 1,
-1.599272, 0.2150776, -1.252234, 1, 0.3843137, 0, 1,
-1.598033, 0.1622918, -1.005294, 1, 0.3882353, 0, 1,
-1.597451, 1.742589, -1.927096, 1, 0.3960784, 0, 1,
-1.585165, -0.7894555, -3.605117, 1, 0.4039216, 0, 1,
-1.582477, -0.4730119, -3.240262, 1, 0.4078431, 0, 1,
-1.577159, -0.9132716, -2.267228, 1, 0.4156863, 0, 1,
-1.569141, -0.8976384, -2.828723, 1, 0.4196078, 0, 1,
-1.555493, -1.088476, -3.658592, 1, 0.427451, 0, 1,
-1.550908, 0.1191622, -0.6832237, 1, 0.4313726, 0, 1,
-1.544707, 1.205586, 0.9793368, 1, 0.4392157, 0, 1,
-1.543995, 0.2366365, -1.29784, 1, 0.4431373, 0, 1,
-1.541076, -0.4263668, -2.502868, 1, 0.4509804, 0, 1,
-1.538019, 0.2566814, -0.9216401, 1, 0.454902, 0, 1,
-1.532691, -0.3337616, -2.181389, 1, 0.4627451, 0, 1,
-1.52746, -1.012254, -1.032261, 1, 0.4666667, 0, 1,
-1.518835, -0.8819151, -2.119255, 1, 0.4745098, 0, 1,
-1.514304, -0.5527366, -3.132052, 1, 0.4784314, 0, 1,
-1.500967, 0.4790896, -1.214434, 1, 0.4862745, 0, 1,
-1.499494, 0.8396563, -2.608529, 1, 0.4901961, 0, 1,
-1.473259, -0.9302701, -3.00496, 1, 0.4980392, 0, 1,
-1.473061, -0.4323941, -2.676668, 1, 0.5058824, 0, 1,
-1.449188, -1.092824, -3.067258, 1, 0.509804, 0, 1,
-1.447958, 0.1445638, -1.984919, 1, 0.5176471, 0, 1,
-1.438471, -0.5574837, -1.800185, 1, 0.5215687, 0, 1,
-1.435552, 0.7574492, -1.304714, 1, 0.5294118, 0, 1,
-1.429851, -0.2629126, -0.9713932, 1, 0.5333334, 0, 1,
-1.417715, 0.1681762, -0.04300251, 1, 0.5411765, 0, 1,
-1.417188, -0.9908754, -3.573537, 1, 0.5450981, 0, 1,
-1.395076, -0.1361495, -2.181149, 1, 0.5529412, 0, 1,
-1.394138, 0.09002706, -0.2131785, 1, 0.5568628, 0, 1,
-1.389409, -0.5718397, -2.390445, 1, 0.5647059, 0, 1,
-1.371702, -0.8404274, -2.272794, 1, 0.5686275, 0, 1,
-1.371154, -0.3342865, -2.579941, 1, 0.5764706, 0, 1,
-1.368983, 1.978362, -0.7683932, 1, 0.5803922, 0, 1,
-1.365125, 0.2660055, -2.816289, 1, 0.5882353, 0, 1,
-1.362462, -1.103293, -2.906909, 1, 0.5921569, 0, 1,
-1.352946, -2.109133, -2.299859, 1, 0.6, 0, 1,
-1.335113, 0.7604281, -2.141146, 1, 0.6078432, 0, 1,
-1.330207, -0.07798523, -1.486701, 1, 0.6117647, 0, 1,
-1.329942, -0.7649968, -2.619778, 1, 0.6196079, 0, 1,
-1.325356, -0.4656507, -1.164194, 1, 0.6235294, 0, 1,
-1.316098, 1.351405, -1.329335, 1, 0.6313726, 0, 1,
-1.299475, 0.1761272, -0.9945019, 1, 0.6352941, 0, 1,
-1.280832, -1.305944, -3.006821, 1, 0.6431373, 0, 1,
-1.27905, 0.1354533, -2.116581, 1, 0.6470588, 0, 1,
-1.277728, 0.02777254, -1.035485, 1, 0.654902, 0, 1,
-1.269802, 0.0129895, -2.119117, 1, 0.6588235, 0, 1,
-1.262792, 0.3899787, -1.569811, 1, 0.6666667, 0, 1,
-1.262752, 0.636427, 0.1014564, 1, 0.6705883, 0, 1,
-1.261435, -2.529712, -3.273587, 1, 0.6784314, 0, 1,
-1.259966, -0.8753564, -2.356447, 1, 0.682353, 0, 1,
-1.253573, -0.3310213, -1.140283, 1, 0.6901961, 0, 1,
-1.251953, -0.0820402, -3.088054, 1, 0.6941177, 0, 1,
-1.246801, -1.488389, -2.602573, 1, 0.7019608, 0, 1,
-1.245772, -0.5566413, -1.91935, 1, 0.7098039, 0, 1,
-1.245731, 1.343139, -1.55356, 1, 0.7137255, 0, 1,
-1.24011, -1.181601, -2.850403, 1, 0.7215686, 0, 1,
-1.238144, -0.08387722, -2.250378, 1, 0.7254902, 0, 1,
-1.234684, 0.5237735, -0.07062655, 1, 0.7333333, 0, 1,
-1.232703, -0.6206046, -1.911902, 1, 0.7372549, 0, 1,
-1.228908, 1.553728, -1.112442, 1, 0.7450981, 0, 1,
-1.217078, -0.794507, -3.504488, 1, 0.7490196, 0, 1,
-1.212897, -0.8996013, -3.793178, 1, 0.7568628, 0, 1,
-1.210499, 0.8983886, -0.4965434, 1, 0.7607843, 0, 1,
-1.203351, 0.816479, -2.043643, 1, 0.7686275, 0, 1,
-1.187675, -1.634655, -3.086697, 1, 0.772549, 0, 1,
-1.179294, -1.719601, -3.79629, 1, 0.7803922, 0, 1,
-1.177248, 0.1896828, 0.1206404, 1, 0.7843137, 0, 1,
-1.17707, 0.7252834, -1.203176, 1, 0.7921569, 0, 1,
-1.176149, -0.2123674, -2.178314, 1, 0.7960784, 0, 1,
-1.175549, -0.579773, -0.6193059, 1, 0.8039216, 0, 1,
-1.175013, 0.4082579, -0.003920741, 1, 0.8117647, 0, 1,
-1.170195, -0.6804476, -3.664083, 1, 0.8156863, 0, 1,
-1.168343, -0.5443336, -2.676735, 1, 0.8235294, 0, 1,
-1.164441, 0.127515, -2.258639, 1, 0.827451, 0, 1,
-1.158052, 1.036907, -2.120918, 1, 0.8352941, 0, 1,
-1.157414, -0.6773359, -0.8771482, 1, 0.8392157, 0, 1,
-1.149412, -0.1942483, -1.318804, 1, 0.8470588, 0, 1,
-1.14862, 1.20125, -0.8202035, 1, 0.8509804, 0, 1,
-1.146686, -1.001669, -2.644861, 1, 0.8588235, 0, 1,
-1.135184, 0.2764838, -1.584054, 1, 0.8627451, 0, 1,
-1.127205, 1.471499, -0.3197797, 1, 0.8705882, 0, 1,
-1.124524, 0.4579993, -2.324613, 1, 0.8745098, 0, 1,
-1.122871, 2.122626, 1.217311, 1, 0.8823529, 0, 1,
-1.11346, 0.845465, -0.9781179, 1, 0.8862745, 0, 1,
-1.111464, 0.5801332, -1.440137, 1, 0.8941177, 0, 1,
-1.109324, -0.3563891, -2.020718, 1, 0.8980392, 0, 1,
-1.108721, 0.32891, -1.332526, 1, 0.9058824, 0, 1,
-1.107734, -1.214635, -2.719849, 1, 0.9137255, 0, 1,
-1.099784, -0.7646309, -0.9617116, 1, 0.9176471, 0, 1,
-1.095723, 0.003670181, -1.140362, 1, 0.9254902, 0, 1,
-1.089605, -1.488064, -1.88064, 1, 0.9294118, 0, 1,
-1.085759, 2.059351, -0.464848, 1, 0.9372549, 0, 1,
-1.084429, 0.6911818, -0.8891856, 1, 0.9411765, 0, 1,
-1.083463, -0.7346801, -3.405666, 1, 0.9490196, 0, 1,
-1.070397, -0.8817566, -2.704076, 1, 0.9529412, 0, 1,
-1.068217, 0.2057806, -0.2664937, 1, 0.9607843, 0, 1,
-1.063876, -0.08068458, -1.275721, 1, 0.9647059, 0, 1,
-1.058743, -0.9667615, -1.521009, 1, 0.972549, 0, 1,
-1.052558, -0.3927583, -3.435248, 1, 0.9764706, 0, 1,
-1.05228, 1.009708, 0.1072349, 1, 0.9843137, 0, 1,
-1.049842, -1.058483, -2.048982, 1, 0.9882353, 0, 1,
-1.046954, -0.1980293, -3.530069, 1, 0.9960784, 0, 1,
-1.040971, -0.07753426, -0.8959856, 0.9960784, 1, 0, 1,
-1.040371, 0.8172945, -0.4198644, 0.9921569, 1, 0, 1,
-1.036845, -0.1165291, -1.451775, 0.9843137, 1, 0, 1,
-1.021991, 0.06568725, -0.5374447, 0.9803922, 1, 0, 1,
-1.013931, -0.3699043, -2.009033, 0.972549, 1, 0, 1,
-1.008918, 1.741964, -0.004652355, 0.9686275, 1, 0, 1,
-1.000612, -0.5474904, -2.027102, 0.9607843, 1, 0, 1,
-0.9952912, -0.6835438, -1.737437, 0.9568627, 1, 0, 1,
-0.9944447, -0.4994122, -2.443255, 0.9490196, 1, 0, 1,
-0.9921065, 1.314988, 1.278423, 0.945098, 1, 0, 1,
-0.9884074, 0.1599234, -1.199172, 0.9372549, 1, 0, 1,
-0.9883289, 1.371941, -0.5795019, 0.9333333, 1, 0, 1,
-0.987902, -2.160266, -3.032813, 0.9254902, 1, 0, 1,
-0.9862413, -0.9583463, -2.801297, 0.9215686, 1, 0, 1,
-0.9857433, 0.9802619, -1.092457, 0.9137255, 1, 0, 1,
-0.9848655, 1.397664, 0.2185123, 0.9098039, 1, 0, 1,
-0.9770249, 0.1883833, -1.373031, 0.9019608, 1, 0, 1,
-0.9740244, 1.63271, -1.484859, 0.8941177, 1, 0, 1,
-0.9735029, -0.7230197, -0.9442832, 0.8901961, 1, 0, 1,
-0.967065, 0.7189861, -2.412055, 0.8823529, 1, 0, 1,
-0.9665188, -0.1696114, -2.740129, 0.8784314, 1, 0, 1,
-0.9660854, 0.2263138, -1.179591, 0.8705882, 1, 0, 1,
-0.9659189, -0.9829594, -2.355844, 0.8666667, 1, 0, 1,
-0.9656101, -1.476733, -3.920539, 0.8588235, 1, 0, 1,
-0.9655775, 0.02658744, 0.1513359, 0.854902, 1, 0, 1,
-0.9537242, -1.02547, -1.257324, 0.8470588, 1, 0, 1,
-0.9506838, 0.04407343, -1.230756, 0.8431373, 1, 0, 1,
-0.9466623, -1.394935, -2.985013, 0.8352941, 1, 0, 1,
-0.9462902, -0.102278, -1.958709, 0.8313726, 1, 0, 1,
-0.9436336, 0.6993179, -1.859745, 0.8235294, 1, 0, 1,
-0.9389934, -0.09325223, -2.675748, 0.8196079, 1, 0, 1,
-0.9337438, 0.5736728, -1.446327, 0.8117647, 1, 0, 1,
-0.9330844, 0.192039, -0.4310125, 0.8078431, 1, 0, 1,
-0.9314258, -2.086376, -1.286805, 0.8, 1, 0, 1,
-0.9299756, 1.031016, -1.618484, 0.7921569, 1, 0, 1,
-0.9291044, -0.8507985, -2.762142, 0.7882353, 1, 0, 1,
-0.9254378, -0.4331665, -1.135392, 0.7803922, 1, 0, 1,
-0.9227881, -0.07434555, 0.360389, 0.7764706, 1, 0, 1,
-0.9181027, -0.6209442, -1.116221, 0.7686275, 1, 0, 1,
-0.9083909, -0.04675351, -1.124468, 0.7647059, 1, 0, 1,
-0.9031859, 0.07994151, -1.400812, 0.7568628, 1, 0, 1,
-0.9030708, 0.4600023, -0.7602261, 0.7529412, 1, 0, 1,
-0.8972042, 0.5441987, -0.9333573, 0.7450981, 1, 0, 1,
-0.889739, 0.3710093, -0.1564785, 0.7411765, 1, 0, 1,
-0.8894159, 1.336656, 0.3303475, 0.7333333, 1, 0, 1,
-0.8884954, 0.1535071, -2.241018, 0.7294118, 1, 0, 1,
-0.8884405, -0.009055531, -1.549204, 0.7215686, 1, 0, 1,
-0.8855602, 0.3117691, -1.811118, 0.7176471, 1, 0, 1,
-0.8802313, 0.6900987, -1.343995, 0.7098039, 1, 0, 1,
-0.8753712, -2.531517, -2.953736, 0.7058824, 1, 0, 1,
-0.8709099, 0.09578884, -2.578612, 0.6980392, 1, 0, 1,
-0.8679729, 1.303417, -1.626358, 0.6901961, 1, 0, 1,
-0.8599601, 0.3889886, -1.227396, 0.6862745, 1, 0, 1,
-0.8550698, -2.974502, -3.352768, 0.6784314, 1, 0, 1,
-0.8543179, -1.453609, -1.21138, 0.6745098, 1, 0, 1,
-0.853864, -0.5478026, -2.158535, 0.6666667, 1, 0, 1,
-0.8532327, -2.371043, -2.924925, 0.6627451, 1, 0, 1,
-0.8445595, -0.6984468, -0.5645217, 0.654902, 1, 0, 1,
-0.8444717, 0.5748624, -0.8927718, 0.6509804, 1, 0, 1,
-0.843727, -0.007033357, -1.476292, 0.6431373, 1, 0, 1,
-0.8352906, 1.073578, -2.050996, 0.6392157, 1, 0, 1,
-0.8317596, -0.09740331, -3.159368, 0.6313726, 1, 0, 1,
-0.8298429, 0.1641608, -1.581846, 0.627451, 1, 0, 1,
-0.8241053, -0.6517384, -2.018252, 0.6196079, 1, 0, 1,
-0.818539, -1.690338, -3.369131, 0.6156863, 1, 0, 1,
-0.8162104, 2.838076, -1.094208, 0.6078432, 1, 0, 1,
-0.8090682, -2.143866, -1.505016, 0.6039216, 1, 0, 1,
-0.8080653, -0.3806814, -4.002369, 0.5960785, 1, 0, 1,
-0.8030971, -1.30751, -4.434196, 0.5882353, 1, 0, 1,
-0.8001993, 1.077098, -0.342863, 0.5843138, 1, 0, 1,
-0.7903654, -0.0101006, 0.2878942, 0.5764706, 1, 0, 1,
-0.7883616, 0.5130854, -0.145858, 0.572549, 1, 0, 1,
-0.7869674, -0.9192266, -2.469898, 0.5647059, 1, 0, 1,
-0.7846564, 0.3218406, -0.27513, 0.5607843, 1, 0, 1,
-0.7838358, -0.4627054, -0.6235186, 0.5529412, 1, 0, 1,
-0.782935, -1.341713, -3.501946, 0.5490196, 1, 0, 1,
-0.7828329, 1.246165, 0.2560124, 0.5411765, 1, 0, 1,
-0.7826837, -1.233325, -2.101976, 0.5372549, 1, 0, 1,
-0.7822096, 0.3983972, -1.340453, 0.5294118, 1, 0, 1,
-0.7790362, -0.03284623, 0.2391158, 0.5254902, 1, 0, 1,
-0.7750676, -1.222733, -1.891184, 0.5176471, 1, 0, 1,
-0.772121, 0.6732385, 0.1405364, 0.5137255, 1, 0, 1,
-0.772051, 1.311291, 0.3040056, 0.5058824, 1, 0, 1,
-0.769462, -0.5092979, -1.448303, 0.5019608, 1, 0, 1,
-0.7687687, -0.8124729, -2.159905, 0.4941176, 1, 0, 1,
-0.7677212, 1.281924, -2.504188, 0.4862745, 1, 0, 1,
-0.7675237, -0.4631411, -1.879388, 0.4823529, 1, 0, 1,
-0.7653961, -1.262946, -2.138036, 0.4745098, 1, 0, 1,
-0.7647671, -0.5734497, -4.038202, 0.4705882, 1, 0, 1,
-0.7645119, -0.4342304, -2.480167, 0.4627451, 1, 0, 1,
-0.7636333, 0.219696, -2.250736, 0.4588235, 1, 0, 1,
-0.7635723, 0.6568126, -0.009654558, 0.4509804, 1, 0, 1,
-0.7585284, -0.08910686, -1.647489, 0.4470588, 1, 0, 1,
-0.7583356, 0.1425823, -1.490238, 0.4392157, 1, 0, 1,
-0.7499298, -0.8118275, -2.113531, 0.4352941, 1, 0, 1,
-0.7415137, -1.812245, -1.938446, 0.427451, 1, 0, 1,
-0.7409575, -1.238343, -1.926578, 0.4235294, 1, 0, 1,
-0.7236501, 0.02884053, -3.039651, 0.4156863, 1, 0, 1,
-0.7201074, 1.589364, -0.5209794, 0.4117647, 1, 0, 1,
-0.7195958, -0.1867028, -2.271255, 0.4039216, 1, 0, 1,
-0.7186174, 0.7159767, -0.3608322, 0.3960784, 1, 0, 1,
-0.7182465, -0.7617694, -3.289649, 0.3921569, 1, 0, 1,
-0.7160805, -0.8757312, -3.695275, 0.3843137, 1, 0, 1,
-0.7129779, 0.7332677, 0.8185601, 0.3803922, 1, 0, 1,
-0.7118838, -0.2386393, -1.577359, 0.372549, 1, 0, 1,
-0.7051494, 1.221618, -1.129269, 0.3686275, 1, 0, 1,
-0.7038593, 0.2198176, 0.03963732, 0.3607843, 1, 0, 1,
-0.7038584, 1.092847, -1.561046, 0.3568628, 1, 0, 1,
-0.7017702, -0.07856794, -2.650969, 0.3490196, 1, 0, 1,
-0.6986122, 0.9650601, -0.6861867, 0.345098, 1, 0, 1,
-0.6984217, -1.862348, -2.561654, 0.3372549, 1, 0, 1,
-0.6925928, 1.469991, -0.03311813, 0.3333333, 1, 0, 1,
-0.6914625, 1.381058, 1.087255, 0.3254902, 1, 0, 1,
-0.6912822, 0.888921, -1.811817, 0.3215686, 1, 0, 1,
-0.6887488, -1.897414, -3.812466, 0.3137255, 1, 0, 1,
-0.6877976, -0.2194031, -2.077796, 0.3098039, 1, 0, 1,
-0.68515, -0.7525548, -1.618405, 0.3019608, 1, 0, 1,
-0.6803285, 0.9936133, -0.6650814, 0.2941177, 1, 0, 1,
-0.6792135, 0.1074543, -1.241261, 0.2901961, 1, 0, 1,
-0.6768416, -0.2465888, -2.501708, 0.282353, 1, 0, 1,
-0.6763968, -0.4302918, -0.2392992, 0.2784314, 1, 0, 1,
-0.667362, -0.6806091, -2.530955, 0.2705882, 1, 0, 1,
-0.6672278, 1.313985, -1.946724, 0.2666667, 1, 0, 1,
-0.6649162, 0.8747131, -1.011361, 0.2588235, 1, 0, 1,
-0.6623071, -0.6495089, -2.148544, 0.254902, 1, 0, 1,
-0.659864, 0.6502642, 2.033549, 0.2470588, 1, 0, 1,
-0.6588339, -1.522262, -2.800972, 0.2431373, 1, 0, 1,
-0.6542686, 0.1116293, -1.057755, 0.2352941, 1, 0, 1,
-0.6536731, -1.227519, -2.049506, 0.2313726, 1, 0, 1,
-0.6473882, 0.7202691, -0.5857353, 0.2235294, 1, 0, 1,
-0.645234, -0.6634328, -1.935257, 0.2196078, 1, 0, 1,
-0.6416603, -0.4028271, -1.481232, 0.2117647, 1, 0, 1,
-0.6414075, -0.2568226, -1.458511, 0.2078431, 1, 0, 1,
-0.6260803, 0.6447552, 0.03034346, 0.2, 1, 0, 1,
-0.6211025, -0.4762653, -4.351469, 0.1921569, 1, 0, 1,
-0.6188751, 0.3844038, -1.329521, 0.1882353, 1, 0, 1,
-0.6161799, 0.3312966, -1.282209, 0.1803922, 1, 0, 1,
-0.6157956, -1.553605, -2.779335, 0.1764706, 1, 0, 1,
-0.6112918, 0.5625749, -2.065169, 0.1686275, 1, 0, 1,
-0.6080885, -0.4599565, -1.85382, 0.1647059, 1, 0, 1,
-0.6071079, 0.3807732, 1.262595, 0.1568628, 1, 0, 1,
-0.6068268, -1.742022, -1.544345, 0.1529412, 1, 0, 1,
-0.6050792, -0.04752038, -4.517429, 0.145098, 1, 0, 1,
-0.5957851, 1.689163, -0.3741531, 0.1411765, 1, 0, 1,
-0.5915149, 0.4363591, -2.062007, 0.1333333, 1, 0, 1,
-0.5893744, 1.546759, -0.9421482, 0.1294118, 1, 0, 1,
-0.5851445, -0.2853092, -2.194046, 0.1215686, 1, 0, 1,
-0.5834728, 0.6552616, 2.011719, 0.1176471, 1, 0, 1,
-0.5796066, -1.518307, -3.351645, 0.1098039, 1, 0, 1,
-0.5784774, -1.36353, -2.541861, 0.1058824, 1, 0, 1,
-0.5773305, 0.2724301, -0.8282872, 0.09803922, 1, 0, 1,
-0.5751804, -1.245979, -3.593065, 0.09019608, 1, 0, 1,
-0.5699763, 1.695396, -0.4786809, 0.08627451, 1, 0, 1,
-0.5664774, -1.08673, -3.852617, 0.07843138, 1, 0, 1,
-0.5658872, 0.05976994, -1.051785, 0.07450981, 1, 0, 1,
-0.5652796, 1.097968, 0.7141135, 0.06666667, 1, 0, 1,
-0.5525324, -0.7344424, -2.300215, 0.0627451, 1, 0, 1,
-0.5487887, 0.04279484, -1.331965, 0.05490196, 1, 0, 1,
-0.546949, -1.5883, -2.406066, 0.05098039, 1, 0, 1,
-0.5401108, 0.8906436, -0.5616606, 0.04313726, 1, 0, 1,
-0.5372423, -0.6547946, -2.263308, 0.03921569, 1, 0, 1,
-0.5326137, -1.25034, -3.751411, 0.03137255, 1, 0, 1,
-0.5292274, 1.826713, 1.220514, 0.02745098, 1, 0, 1,
-0.5273901, -0.4539322, -1.098544, 0.01960784, 1, 0, 1,
-0.5186515, 1.443521, 0.2629465, 0.01568628, 1, 0, 1,
-0.5159349, 0.8461553, -0.410799, 0.007843138, 1, 0, 1,
-0.5131134, 1.615167, -0.763898, 0.003921569, 1, 0, 1,
-0.5117428, 0.04131469, -2.80398, 0, 1, 0.003921569, 1,
-0.5003282, -0.2245336, -2.459388, 0, 1, 0.01176471, 1,
-0.499187, -0.3559778, -4.201114, 0, 1, 0.01568628, 1,
-0.4988722, 0.3180283, 0.5135692, 0, 1, 0.02352941, 1,
-0.4975188, -0.4069566, -3.402887, 0, 1, 0.02745098, 1,
-0.4961968, 0.4797421, -1.122152, 0, 1, 0.03529412, 1,
-0.4925891, -0.08065353, -2.412383, 0, 1, 0.03921569, 1,
-0.4893608, -0.8303364, -2.439147, 0, 1, 0.04705882, 1,
-0.4834158, 1.073117, -0.8326437, 0, 1, 0.05098039, 1,
-0.480827, 0.4498981, -2.121155, 0, 1, 0.05882353, 1,
-0.4734769, 1.286657, -2.151438, 0, 1, 0.0627451, 1,
-0.4717152, -1.494298, -2.003105, 0, 1, 0.07058824, 1,
-0.4701873, 0.8358397, -2.948636, 0, 1, 0.07450981, 1,
-0.4690594, 0.8725277, -0.7944185, 0, 1, 0.08235294, 1,
-0.4654607, 0.1595407, -1.294348, 0, 1, 0.08627451, 1,
-0.4507209, 0.6791866, -0.4808364, 0, 1, 0.09411765, 1,
-0.4492397, 0.5916858, -1.330009, 0, 1, 0.1019608, 1,
-0.4462017, 2.52258, 0.3648027, 0, 1, 0.1058824, 1,
-0.442237, 0.9247183, -0.5106316, 0, 1, 0.1137255, 1,
-0.4386629, -0.5405834, 0.03107216, 0, 1, 0.1176471, 1,
-0.4362321, 0.4345702, -1.902855, 0, 1, 0.1254902, 1,
-0.4345565, 0.03284866, -0.6368734, 0, 1, 0.1294118, 1,
-0.4334748, -0.6323953, -3.1014, 0, 1, 0.1372549, 1,
-0.4300985, -1.041629, -4.002145, 0, 1, 0.1411765, 1,
-0.4287888, -2.336029, -4.11596, 0, 1, 0.1490196, 1,
-0.4249657, 0.4062244, 0.2408983, 0, 1, 0.1529412, 1,
-0.4158071, -0.09101894, -3.187066, 0, 1, 0.1607843, 1,
-0.4138144, -0.07947265, -2.226648, 0, 1, 0.1647059, 1,
-0.4093582, -0.8449351, -3.087088, 0, 1, 0.172549, 1,
-0.4086803, -0.3789383, -2.799135, 0, 1, 0.1764706, 1,
-0.4086123, -0.9146718, -2.105339, 0, 1, 0.1843137, 1,
-0.4076706, -1.189499, -6.231512, 0, 1, 0.1882353, 1,
-0.4023962, -0.6698804, -2.393723, 0, 1, 0.1960784, 1,
-0.399942, -0.6101033, -5.400314, 0, 1, 0.2039216, 1,
-0.3986565, 0.5567735, -2.467858, 0, 1, 0.2078431, 1,
-0.3960143, -0.3010072, -3.375013, 0, 1, 0.2156863, 1,
-0.3921555, -1.632264, -2.33293, 0, 1, 0.2196078, 1,
-0.3908699, 0.06843291, -2.935329, 0, 1, 0.227451, 1,
-0.3906004, -1.173792, -2.109244, 0, 1, 0.2313726, 1,
-0.3888622, -0.2709639, -2.355425, 0, 1, 0.2392157, 1,
-0.3868994, 0.9678571, 0.3325067, 0, 1, 0.2431373, 1,
-0.384881, -1.37057, -2.190763, 0, 1, 0.2509804, 1,
-0.3847202, -1.425693, -3.325305, 0, 1, 0.254902, 1,
-0.3836841, 0.4081197, -2.718471, 0, 1, 0.2627451, 1,
-0.3836332, 0.8615109, -0.4238613, 0, 1, 0.2666667, 1,
-0.3786994, 1.535407, -1.727396, 0, 1, 0.2745098, 1,
-0.3775996, 0.3591831, -0.2795739, 0, 1, 0.2784314, 1,
-0.3773946, -0.06802332, -0.9560345, 0, 1, 0.2862745, 1,
-0.3771143, 1.555596, 0.6237736, 0, 1, 0.2901961, 1,
-0.3761067, 0.4562712, -0.8394146, 0, 1, 0.2980392, 1,
-0.3748141, 0.3917663, 0.2336699, 0, 1, 0.3058824, 1,
-0.372869, -0.2321577, -2.495385, 0, 1, 0.3098039, 1,
-0.3692321, 1.21653, -0.05888221, 0, 1, 0.3176471, 1,
-0.3682913, -1.747122, -2.08638, 0, 1, 0.3215686, 1,
-0.3670639, 0.1439433, -0.6260452, 0, 1, 0.3294118, 1,
-0.3655901, -0.5976508, -1.824568, 0, 1, 0.3333333, 1,
-0.3631572, 0.8874906, -1.567469, 0, 1, 0.3411765, 1,
-0.3626703, 0.3820229, -0.1931111, 0, 1, 0.345098, 1,
-0.3608067, 0.8069775, -2.781005, 0, 1, 0.3529412, 1,
-0.3514879, 0.6280372, -1.162558, 0, 1, 0.3568628, 1,
-0.3510019, 0.8145633, 0.6976997, 0, 1, 0.3647059, 1,
-0.3509032, -0.4020255, -2.972937, 0, 1, 0.3686275, 1,
-0.3508991, 2.043427, -0.6264813, 0, 1, 0.3764706, 1,
-0.3507482, -1.623883, -2.456605, 0, 1, 0.3803922, 1,
-0.345746, 0.7959645, -0.08502365, 0, 1, 0.3882353, 1,
-0.343181, -1.340236, -1.804702, 0, 1, 0.3921569, 1,
-0.3365931, -0.809091, -1.792528, 0, 1, 0.4, 1,
-0.3355236, 1.194466, -1.887089, 0, 1, 0.4078431, 1,
-0.3350362, 0.2925247, 0.6883181, 0, 1, 0.4117647, 1,
-0.3344272, 1.603848, -0.7792529, 0, 1, 0.4196078, 1,
-0.334309, 0.4454174, -0.4868018, 0, 1, 0.4235294, 1,
-0.3337577, -0.4800759, -1.918947, 0, 1, 0.4313726, 1,
-0.3285314, -0.1685524, -1.791499, 0, 1, 0.4352941, 1,
-0.3253614, -0.8495818, -3.630016, 0, 1, 0.4431373, 1,
-0.3252932, -0.4446087, -1.967216, 0, 1, 0.4470588, 1,
-0.321254, 0.9948048, -0.9390214, 0, 1, 0.454902, 1,
-0.3198584, -1.276876, -3.511347, 0, 1, 0.4588235, 1,
-0.3161071, -1.695163, -3.793123, 0, 1, 0.4666667, 1,
-0.3117954, -0.2765361, -0.5655531, 0, 1, 0.4705882, 1,
-0.3071262, 0.4903734, -0.5937514, 0, 1, 0.4784314, 1,
-0.3047172, 0.7953368, 0.3721929, 0, 1, 0.4823529, 1,
-0.3023467, 1.031284, 0.7884879, 0, 1, 0.4901961, 1,
-0.3008415, -1.867353, -2.324052, 0, 1, 0.4941176, 1,
-0.3001428, -0.1203217, -1.856573, 0, 1, 0.5019608, 1,
-0.2982708, 0.3022599, 0.3084371, 0, 1, 0.509804, 1,
-0.2953318, -0.4308447, -1.871911, 0, 1, 0.5137255, 1,
-0.2910392, 1.880792, 0.08940985, 0, 1, 0.5215687, 1,
-0.2907695, -0.5819969, -3.45034, 0, 1, 0.5254902, 1,
-0.2891734, -2.117676, -4.132513, 0, 1, 0.5333334, 1,
-0.2887712, 0.7984042, -1.384016, 0, 1, 0.5372549, 1,
-0.286923, 2.867594, 0.7820296, 0, 1, 0.5450981, 1,
-0.2829142, 0.8437824, 0.4910865, 0, 1, 0.5490196, 1,
-0.2805538, -0.9360757, -2.112574, 0, 1, 0.5568628, 1,
-0.2784245, 0.4746878, -1.11823, 0, 1, 0.5607843, 1,
-0.2686688, -0.3182991, -0.6159245, 0, 1, 0.5686275, 1,
-0.2679365, -0.1332146, -1.134483, 0, 1, 0.572549, 1,
-0.2638696, -0.4473119, -4.116864, 0, 1, 0.5803922, 1,
-0.2602745, -0.9977708, -2.433856, 0, 1, 0.5843138, 1,
-0.2595142, 1.310769, 0.2890715, 0, 1, 0.5921569, 1,
-0.251888, -1.172671, -3.157044, 0, 1, 0.5960785, 1,
-0.243893, 0.5937312, -1.181835, 0, 1, 0.6039216, 1,
-0.2414408, 0.09294345, -1.048337, 0, 1, 0.6117647, 1,
-0.2399922, 0.8937614, -0.7433475, 0, 1, 0.6156863, 1,
-0.23884, -0.9443021, -2.788241, 0, 1, 0.6235294, 1,
-0.2380364, 1.469062, 0.1269659, 0, 1, 0.627451, 1,
-0.2344117, 1.704782, -0.6965784, 0, 1, 0.6352941, 1,
-0.2343611, -0.2748212, -3.251247, 0, 1, 0.6392157, 1,
-0.2341679, -1.206328, -2.658746, 0, 1, 0.6470588, 1,
-0.2327389, 0.4527361, -0.4925393, 0, 1, 0.6509804, 1,
-0.2292303, -1.457676, -3.513013, 0, 1, 0.6588235, 1,
-0.228311, 0.6965444, 1.20859, 0, 1, 0.6627451, 1,
-0.2220716, -0.7019486, -2.797891, 0, 1, 0.6705883, 1,
-0.2158855, -0.205984, -1.495185, 0, 1, 0.6745098, 1,
-0.2118482, -0.8838269, -3.324038, 0, 1, 0.682353, 1,
-0.2037428, -0.9380075, -3.557226, 0, 1, 0.6862745, 1,
-0.1932488, 1.25816, -0.260772, 0, 1, 0.6941177, 1,
-0.1896206, 0.6984773, -1.510305, 0, 1, 0.7019608, 1,
-0.1887784, -0.6564426, -3.051193, 0, 1, 0.7058824, 1,
-0.1835541, 1.351396, 0.3016546, 0, 1, 0.7137255, 1,
-0.179542, -2.089128, -3.827916, 0, 1, 0.7176471, 1,
-0.1773846, 0.510516, -1.007767, 0, 1, 0.7254902, 1,
-0.1750099, -0.6430389, -2.625782, 0, 1, 0.7294118, 1,
-0.1680131, -1.555115, -3.146613, 0, 1, 0.7372549, 1,
-0.1652654, 0.8056492, -0.6207392, 0, 1, 0.7411765, 1,
-0.160099, 0.5785775, -1.256217, 0, 1, 0.7490196, 1,
-0.1578697, 0.6510023, -0.670298, 0, 1, 0.7529412, 1,
-0.1573487, -0.06875996, -1.206339, 0, 1, 0.7607843, 1,
-0.1555032, 1.862978, 0.51778, 0, 1, 0.7647059, 1,
-0.1506413, 0.4157244, 0.08252744, 0, 1, 0.772549, 1,
-0.1428681, -0.6318544, -3.945264, 0, 1, 0.7764706, 1,
-0.142703, 2.202137, -1.573388, 0, 1, 0.7843137, 1,
-0.1378103, 1.727071, -1.654757, 0, 1, 0.7882353, 1,
-0.1366288, -0.1036659, -3.179555, 0, 1, 0.7960784, 1,
-0.1353376, -0.6804243, -1.802146, 0, 1, 0.8039216, 1,
-0.1305869, -2.020111, -3.456805, 0, 1, 0.8078431, 1,
-0.1198096, -1.58314, -3.526769, 0, 1, 0.8156863, 1,
-0.1168518, 0.1726955, 0.4400463, 0, 1, 0.8196079, 1,
-0.1152643, -0.8776801, -2.454688, 0, 1, 0.827451, 1,
-0.1127547, 0.3501455, -1.890738, 0, 1, 0.8313726, 1,
-0.1111956, -0.4886259, -2.734169, 0, 1, 0.8392157, 1,
-0.109439, 0.4179552, 0.6699871, 0, 1, 0.8431373, 1,
-0.1059259, 2.71643, -0.0175103, 0, 1, 0.8509804, 1,
-0.101803, -0.09475488, -1.775803, 0, 1, 0.854902, 1,
-0.09995887, 0.1035904, -2.629255, 0, 1, 0.8627451, 1,
-0.09940525, -0.03343931, -1.98982, 0, 1, 0.8666667, 1,
-0.09907135, 0.4071772, 0.7796664, 0, 1, 0.8745098, 1,
-0.09757619, -2.222344, -3.704203, 0, 1, 0.8784314, 1,
-0.09647913, -0.3829135, -5.373225, 0, 1, 0.8862745, 1,
-0.09545019, -0.2820233, -2.199645, 0, 1, 0.8901961, 1,
-0.09332302, -0.503107, -2.676042, 0, 1, 0.8980392, 1,
-0.09220109, -1.088344, -2.222602, 0, 1, 0.9058824, 1,
-0.084235, 1.383802, 0.3255553, 0, 1, 0.9098039, 1,
-0.08359671, -0.1832793, -2.326178, 0, 1, 0.9176471, 1,
-0.08212316, 1.679863, -1.02578, 0, 1, 0.9215686, 1,
-0.08137187, -0.7638056, -3.901775, 0, 1, 0.9294118, 1,
-0.07166511, 0.2774752, -1.086066, 0, 1, 0.9333333, 1,
-0.06828611, 1.295795, 0.4770342, 0, 1, 0.9411765, 1,
-0.0682817, -1.268294, -3.550098, 0, 1, 0.945098, 1,
-0.06826288, 1.202837, -0.8564749, 0, 1, 0.9529412, 1,
-0.06765568, -2.243206, -2.60207, 0, 1, 0.9568627, 1,
-0.06720325, 0.07264246, -1.334775, 0, 1, 0.9647059, 1,
-0.06527259, 1.479892, -0.9357331, 0, 1, 0.9686275, 1,
-0.06523122, 0.4521429, -0.0846305, 0, 1, 0.9764706, 1,
-0.06175276, 0.5204653, 1.227809, 0, 1, 0.9803922, 1,
-0.05368412, -1.397475, -4.687786, 0, 1, 0.9882353, 1,
-0.05346094, -0.6136199, -2.524063, 0, 1, 0.9921569, 1,
-0.04865031, -0.6125722, -3.627153, 0, 1, 1, 1,
-0.04637357, 1.707282, 1.78775, 0, 0.9921569, 1, 1,
-0.04378571, -1.558066, -2.813493, 0, 0.9882353, 1, 1,
-0.04182655, -0.6946762, -1.199658, 0, 0.9803922, 1, 1,
-0.041743, -1.007542, -3.06257, 0, 0.9764706, 1, 1,
-0.04115345, -0.8858043, -4.375957, 0, 0.9686275, 1, 1,
-0.03994896, 0.429177, -0.2756689, 0, 0.9647059, 1, 1,
-0.03326312, 1.65414, -0.1649073, 0, 0.9568627, 1, 1,
-0.03173165, -0.5586922, -3.727005, 0, 0.9529412, 1, 1,
-0.03021791, -1.379876, -4.241861, 0, 0.945098, 1, 1,
-0.02887039, 1.240953, -0.8110595, 0, 0.9411765, 1, 1,
-0.02849145, -0.9766673, -1.233016, 0, 0.9333333, 1, 1,
-0.02519905, -0.2294317, -3.712873, 0, 0.9294118, 1, 1,
-0.02314691, 0.1965884, 0.6792239, 0, 0.9215686, 1, 1,
-0.02118967, -0.2626141, -3.785589, 0, 0.9176471, 1, 1,
-0.01497225, -0.9681509, -2.424958, 0, 0.9098039, 1, 1,
-0.01196724, 0.01238478, -0.8880844, 0, 0.9058824, 1, 1,
-0.006927501, -0.01032928, -3.173199, 0, 0.8980392, 1, 1,
-0.00638472, 0.7221057, -0.236736, 0, 0.8901961, 1, 1,
-0.005679816, 0.5024648, -0.7799199, 0, 0.8862745, 1, 1,
-0.005076618, 1.441658, 1.026989, 0, 0.8784314, 1, 1,
-0.00342491, 1.176446, -0.04568389, 0, 0.8745098, 1, 1,
-0.001749312, -0.1671579, -3.106985, 0, 0.8666667, 1, 1,
0.003065649, 0.8624725, -0.6809006, 0, 0.8627451, 1, 1,
0.008163204, 1.485292, -0.9011735, 0, 0.854902, 1, 1,
0.01228579, -0.4948262, 3.116021, 0, 0.8509804, 1, 1,
0.01589836, 0.1194652, -0.02089658, 0, 0.8431373, 1, 1,
0.02356654, 0.8331004, 0.4254025, 0, 0.8392157, 1, 1,
0.02706663, -0.2450385, 4.055119, 0, 0.8313726, 1, 1,
0.02929908, 0.2860154, -0.01423549, 0, 0.827451, 1, 1,
0.03198623, 0.08847412, 1.098974, 0, 0.8196079, 1, 1,
0.03397067, -1.268486, 1.933884, 0, 0.8156863, 1, 1,
0.03414357, -2.438362, 3.928998, 0, 0.8078431, 1, 1,
0.03764438, 2.024587, 1.832653, 0, 0.8039216, 1, 1,
0.03804799, 1.586041, 0.4502661, 0, 0.7960784, 1, 1,
0.03913281, -0.6384261, 3.229686, 0, 0.7882353, 1, 1,
0.03944905, 0.8699098, 0.3944334, 0, 0.7843137, 1, 1,
0.03948478, -0.8445994, 0.7336043, 0, 0.7764706, 1, 1,
0.04269694, -0.4437172, 5.056942, 0, 0.772549, 1, 1,
0.04688689, 0.5895094, 0.8927437, 0, 0.7647059, 1, 1,
0.04734545, 1.235929, 0.4250363, 0, 0.7607843, 1, 1,
0.05240667, -0.2167033, 1.462498, 0, 0.7529412, 1, 1,
0.05322703, 2.043957, -0.6109349, 0, 0.7490196, 1, 1,
0.05953538, 0.212034, 0.03312505, 0, 0.7411765, 1, 1,
0.06103382, 1.197223, -2.06048, 0, 0.7372549, 1, 1,
0.06260397, -0.2777097, 3.983018, 0, 0.7294118, 1, 1,
0.06450422, 0.1671198, -0.307539, 0, 0.7254902, 1, 1,
0.06501467, -0.5666099, 3.248335, 0, 0.7176471, 1, 1,
0.06773949, -0.9503574, 3.503165, 0, 0.7137255, 1, 1,
0.06817418, -1.536347, 2.74254, 0, 0.7058824, 1, 1,
0.07044006, -0.8043602, 1.754435, 0, 0.6980392, 1, 1,
0.07526821, 1.24869, 2.052194, 0, 0.6941177, 1, 1,
0.07608017, -1.409554, 5.166282, 0, 0.6862745, 1, 1,
0.08218677, -0.3635028, 1.619323, 0, 0.682353, 1, 1,
0.08449508, -1.136395, 3.179621, 0, 0.6745098, 1, 1,
0.08950149, 0.7761392, -0.5327291, 0, 0.6705883, 1, 1,
0.09150188, -0.5487857, 1.593467, 0, 0.6627451, 1, 1,
0.09533147, 0.5404816, 0.7035053, 0, 0.6588235, 1, 1,
0.09731148, 1.243343, 1.382905, 0, 0.6509804, 1, 1,
0.09863209, -1.444265, 4.989173, 0, 0.6470588, 1, 1,
0.09945586, 1.339688, 0.9733452, 0, 0.6392157, 1, 1,
0.1016519, 0.2297717, 0.876737, 0, 0.6352941, 1, 1,
0.1053828, 1.084445, -1.045041, 0, 0.627451, 1, 1,
0.1071775, -0.1574248, 2.654472, 0, 0.6235294, 1, 1,
0.1096224, -0.5722997, 1.644365, 0, 0.6156863, 1, 1,
0.1098369, -1.164257, 1.375659, 0, 0.6117647, 1, 1,
0.1133338, 1.606711, -1.148989, 0, 0.6039216, 1, 1,
0.114696, -0.1789171, 4.797994, 0, 0.5960785, 1, 1,
0.1163053, -1.044463, 1.434318, 0, 0.5921569, 1, 1,
0.1170709, 0.1798455, -1.377572, 0, 0.5843138, 1, 1,
0.118038, -0.0650997, 1.688135, 0, 0.5803922, 1, 1,
0.1198023, 0.3080688, -0.2560443, 0, 0.572549, 1, 1,
0.1223484, -0.560983, 2.126873, 0, 0.5686275, 1, 1,
0.1227745, -0.9251387, 1.839942, 0, 0.5607843, 1, 1,
0.1282241, -1.792786, 3.453861, 0, 0.5568628, 1, 1,
0.1283211, -0.3771904, 1.544296, 0, 0.5490196, 1, 1,
0.1292439, -0.6587902, 2.645277, 0, 0.5450981, 1, 1,
0.1298533, 0.4226349, -1.064695, 0, 0.5372549, 1, 1,
0.1311511, -0.1472088, 0.8661938, 0, 0.5333334, 1, 1,
0.1323075, 0.2603908, -0.3832977, 0, 0.5254902, 1, 1,
0.1336336, 0.5817685, 0.7008032, 0, 0.5215687, 1, 1,
0.1347618, -0.4633981, 1.248727, 0, 0.5137255, 1, 1,
0.1375728, -0.2465502, 2.98641, 0, 0.509804, 1, 1,
0.1401195, 0.03122152, 1.593137, 0, 0.5019608, 1, 1,
0.1419099, -1.195343, 3.24514, 0, 0.4941176, 1, 1,
0.142387, 0.4210029, 1.814976, 0, 0.4901961, 1, 1,
0.1430005, -0.7050896, 3.924014, 0, 0.4823529, 1, 1,
0.1498358, -1.691705, 5.085367, 0, 0.4784314, 1, 1,
0.1507327, -1.326139, 3.841627, 0, 0.4705882, 1, 1,
0.150813, -1.075925, 3.06116, 0, 0.4666667, 1, 1,
0.151867, 0.8048764, 0.1699079, 0, 0.4588235, 1, 1,
0.1580885, 2.002297, 0.1805708, 0, 0.454902, 1, 1,
0.1586903, 0.5814227, 1.50322, 0, 0.4470588, 1, 1,
0.1590777, 0.6774471, 0.141342, 0, 0.4431373, 1, 1,
0.1674973, -0.4102521, 5.214412, 0, 0.4352941, 1, 1,
0.1807222, -0.8027601, 3.743876, 0, 0.4313726, 1, 1,
0.1834249, -0.1838882, 3.144615, 0, 0.4235294, 1, 1,
0.1849944, 2.279865, 0.6528494, 0, 0.4196078, 1, 1,
0.1857061, -0.9579666, 2.809006, 0, 0.4117647, 1, 1,
0.1858529, -1.1943, 2.754994, 0, 0.4078431, 1, 1,
0.1890549, 0.4651915, 0.8682439, 0, 0.4, 1, 1,
0.1899796, -1.611195, 3.236784, 0, 0.3921569, 1, 1,
0.1901488, 1.1299, -0.03025191, 0, 0.3882353, 1, 1,
0.1915926, 0.9451202, 1.28077, 0, 0.3803922, 1, 1,
0.1917088, -0.9136501, 1.448447, 0, 0.3764706, 1, 1,
0.1936162, -0.246186, 3.039182, 0, 0.3686275, 1, 1,
0.1948238, -0.5666782, 2.742512, 0, 0.3647059, 1, 1,
0.1977973, 0.6938103, -1.5944, 0, 0.3568628, 1, 1,
0.200343, 0.1505784, 0.3335454, 0, 0.3529412, 1, 1,
0.2016425, 0.7370055, 1.149032, 0, 0.345098, 1, 1,
0.2020158, -0.5705342, 3.641139, 0, 0.3411765, 1, 1,
0.2028322, 0.6523958, 1.250486, 0, 0.3333333, 1, 1,
0.203159, 0.5015662, 1.480531, 0, 0.3294118, 1, 1,
0.207909, -0.6693219, 3.541889, 0, 0.3215686, 1, 1,
0.2090064, -1.564669, 4.263789, 0, 0.3176471, 1, 1,
0.2203214, -0.5607971, 3.887265, 0, 0.3098039, 1, 1,
0.2222392, -0.6576127, 3.59722, 0, 0.3058824, 1, 1,
0.2292509, -1.131517, 3.905321, 0, 0.2980392, 1, 1,
0.2329976, 0.2460854, 1.045785, 0, 0.2901961, 1, 1,
0.2336369, 0.7580205, 0.3196178, 0, 0.2862745, 1, 1,
0.2346895, -1.545023, 3.216306, 0, 0.2784314, 1, 1,
0.2360813, 0.1322836, 1.244015, 0, 0.2745098, 1, 1,
0.2362325, 0.1457581, 1.146509, 0, 0.2666667, 1, 1,
0.2391282, 0.4403337, 1.391346, 0, 0.2627451, 1, 1,
0.2407496, -0.604642, 1.253148, 0, 0.254902, 1, 1,
0.2469373, 0.9938423, 0.8695676, 0, 0.2509804, 1, 1,
0.2527641, 0.8572245, -1.453189, 0, 0.2431373, 1, 1,
0.2560809, -0.02386768, 0.2122233, 0, 0.2392157, 1, 1,
0.2562081, 0.2004007, -0.3083628, 0, 0.2313726, 1, 1,
0.2580341, -1.02156, 3.899158, 0, 0.227451, 1, 1,
0.2582071, 1.372109, 0.6969085, 0, 0.2196078, 1, 1,
0.2599645, 1.816606, -0.2804382, 0, 0.2156863, 1, 1,
0.2600249, -0.1280568, 0.7973275, 0, 0.2078431, 1, 1,
0.2608476, -1.392689, 2.289096, 0, 0.2039216, 1, 1,
0.2654227, 1.981236, 1.426476, 0, 0.1960784, 1, 1,
0.2691284, 1.313368, -0.1039262, 0, 0.1882353, 1, 1,
0.2703514, -1.286827, 4.078043, 0, 0.1843137, 1, 1,
0.2752931, 0.3850487, 0.8180052, 0, 0.1764706, 1, 1,
0.2778069, -0.9655437, 3.360129, 0, 0.172549, 1, 1,
0.2830627, 1.627427, 0.850007, 0, 0.1647059, 1, 1,
0.2888815, -0.9299203, 1.680098, 0, 0.1607843, 1, 1,
0.2901107, 1.353088, -0.5919253, 0, 0.1529412, 1, 1,
0.2988442, -2.272249, 2.769304, 0, 0.1490196, 1, 1,
0.2991309, -0.03610493, 0.7513567, 0, 0.1411765, 1, 1,
0.3024229, 0.4542933, -0.8828086, 0, 0.1372549, 1, 1,
0.303558, 0.8876456, 0.587457, 0, 0.1294118, 1, 1,
0.3085142, -0.3886185, 1.876986, 0, 0.1254902, 1, 1,
0.3089771, 0.03933331, 0.758307, 0, 0.1176471, 1, 1,
0.3103504, 0.6280454, 0.3317268, 0, 0.1137255, 1, 1,
0.3104354, 0.1457123, 1.565776, 0, 0.1058824, 1, 1,
0.3119851, 0.7094789, 1.880706, 0, 0.09803922, 1, 1,
0.3119905, 1.052803, 0.8197542, 0, 0.09411765, 1, 1,
0.3157726, 0.7880692, -0.7652059, 0, 0.08627451, 1, 1,
0.315821, 0.1129897, 0.770867, 0, 0.08235294, 1, 1,
0.3164795, -0.175303, 1.390399, 0, 0.07450981, 1, 1,
0.3267725, -0.1769383, 1.911214, 0, 0.07058824, 1, 1,
0.3345696, 2.091438, 1.602248, 0, 0.0627451, 1, 1,
0.3352365, 0.2895717, -0.4515692, 0, 0.05882353, 1, 1,
0.337579, -1.002851, 3.165015, 0, 0.05098039, 1, 1,
0.3377688, 0.1141206, -0.2520436, 0, 0.04705882, 1, 1,
0.3378149, 1.083414, 1.556396, 0, 0.03921569, 1, 1,
0.3395483, -2.040877, 3.726114, 0, 0.03529412, 1, 1,
0.3422893, -1.118573, 2.26112, 0, 0.02745098, 1, 1,
0.3431425, -1.523296, 2.6368, 0, 0.02352941, 1, 1,
0.3481177, 0.2364277, 1.108444, 0, 0.01568628, 1, 1,
0.3527491, 0.7861659, -0.7303655, 0, 0.01176471, 1, 1,
0.3529404, -0.8771091, 2.122012, 0, 0.003921569, 1, 1,
0.35308, -0.4141466, 1.346894, 0.003921569, 0, 1, 1,
0.3561179, 0.6716545, 0.02460081, 0.007843138, 0, 1, 1,
0.3576243, -1.940181, 3.978762, 0.01568628, 0, 1, 1,
0.3596546, 0.03535309, 2.565589, 0.01960784, 0, 1, 1,
0.3596836, 0.4708857, 0.555364, 0.02745098, 0, 1, 1,
0.3616377, -1.352049, 4.073925, 0.03137255, 0, 1, 1,
0.363336, 1.935842, 0.813939, 0.03921569, 0, 1, 1,
0.3669505, 0.6957951, 1.78102, 0.04313726, 0, 1, 1,
0.3727342, 0.9360241, 0.8371431, 0.05098039, 0, 1, 1,
0.3743783, 0.1701513, 0.803901, 0.05490196, 0, 1, 1,
0.376968, -0.1742622, 3.173945, 0.0627451, 0, 1, 1,
0.3789269, -1.384667, 1.664535, 0.06666667, 0, 1, 1,
0.3817118, -1.167531, 3.94834, 0.07450981, 0, 1, 1,
0.3829726, 1.267203, 0.6443695, 0.07843138, 0, 1, 1,
0.3836814, -1.332853, 2.424272, 0.08627451, 0, 1, 1,
0.3894939, 0.1849209, 0.3428643, 0.09019608, 0, 1, 1,
0.3963914, -0.5739554, 0.6189699, 0.09803922, 0, 1, 1,
0.3974703, 0.6820807, 0.8666522, 0.1058824, 0, 1, 1,
0.3996186, 0.4518504, 0.4216958, 0.1098039, 0, 1, 1,
0.4011856, -0.8974649, 2.596518, 0.1176471, 0, 1, 1,
0.4025147, -1.936157, 1.282171, 0.1215686, 0, 1, 1,
0.4051222, 0.3534994, 1.529374, 0.1294118, 0, 1, 1,
0.4065168, 0.4607022, 2.303676, 0.1333333, 0, 1, 1,
0.412961, 0.2370311, 1.076995, 0.1411765, 0, 1, 1,
0.4208691, -0.9525945, 4.572595, 0.145098, 0, 1, 1,
0.4224141, -0.4856374, 1.763057, 0.1529412, 0, 1, 1,
0.4293835, 0.7398517, 0.9331049, 0.1568628, 0, 1, 1,
0.4297836, -1.315661, 3.163985, 0.1647059, 0, 1, 1,
0.435633, -0.4610123, 2.413374, 0.1686275, 0, 1, 1,
0.4495702, 0.5321567, 0.7158215, 0.1764706, 0, 1, 1,
0.4569836, 0.5638413, 0.6239519, 0.1803922, 0, 1, 1,
0.457831, 0.3406492, 1.673271, 0.1882353, 0, 1, 1,
0.4586445, -1.624749, 2.576301, 0.1921569, 0, 1, 1,
0.4638662, -0.4220221, 1.877975, 0.2, 0, 1, 1,
0.4644969, 1.115918, 3.323725, 0.2078431, 0, 1, 1,
0.4655105, -0.8047882, 4.089959, 0.2117647, 0, 1, 1,
0.4676971, -0.694263, 3.662397, 0.2196078, 0, 1, 1,
0.4680246, -0.2533396, 2.502863, 0.2235294, 0, 1, 1,
0.4697511, 0.5817641, -0.3123957, 0.2313726, 0, 1, 1,
0.4703805, -0.2422421, 1.739359, 0.2352941, 0, 1, 1,
0.4778884, -0.3387838, 2.125364, 0.2431373, 0, 1, 1,
0.4821392, 0.2077974, -0.1490048, 0.2470588, 0, 1, 1,
0.4877683, -0.3781985, 1.867264, 0.254902, 0, 1, 1,
0.4878304, -2.135839, 4.245259, 0.2588235, 0, 1, 1,
0.4882167, 0.579905, 0.1703241, 0.2666667, 0, 1, 1,
0.4883382, 0.8447154, 0.8108412, 0.2705882, 0, 1, 1,
0.4926261, -0.849692, 2.459473, 0.2784314, 0, 1, 1,
0.4978013, 0.4015622, 0.4167463, 0.282353, 0, 1, 1,
0.5002925, -0.4941623, 3.824925, 0.2901961, 0, 1, 1,
0.5030997, 1.25691, 1.71961, 0.2941177, 0, 1, 1,
0.509305, -2.39395, 1.504727, 0.3019608, 0, 1, 1,
0.5102592, 0.1084009, 0.6199729, 0.3098039, 0, 1, 1,
0.517399, 1.799422, 0.9741591, 0.3137255, 0, 1, 1,
0.5188017, -0.9477952, 2.554114, 0.3215686, 0, 1, 1,
0.5204243, 1.677019, -0.2961165, 0.3254902, 0, 1, 1,
0.5218525, 0.5023425, 0.5768042, 0.3333333, 0, 1, 1,
0.5270981, -0.3780489, 1.439713, 0.3372549, 0, 1, 1,
0.5328796, 0.650331, 1.178663, 0.345098, 0, 1, 1,
0.5369285, 0.82924, -0.5136152, 0.3490196, 0, 1, 1,
0.5397846, 0.2909895, 2.148808, 0.3568628, 0, 1, 1,
0.54217, -2.218461, 4.568749, 0.3607843, 0, 1, 1,
0.5425667, -0.1080396, 1.074709, 0.3686275, 0, 1, 1,
0.5532838, -0.4317059, 2.767477, 0.372549, 0, 1, 1,
0.5550517, -0.5249779, 2.756728, 0.3803922, 0, 1, 1,
0.5554975, 0.2777762, 0.09743257, 0.3843137, 0, 1, 1,
0.5561703, -0.3177855, 3.871155, 0.3921569, 0, 1, 1,
0.5569687, -1.496131, 2.273279, 0.3960784, 0, 1, 1,
0.5578158, 0.3216759, 1.85452, 0.4039216, 0, 1, 1,
0.5586832, 2.069569, 1.270883, 0.4117647, 0, 1, 1,
0.559021, 0.4728395, 0.3139372, 0.4156863, 0, 1, 1,
0.5602329, 0.2777963, 1.451045, 0.4235294, 0, 1, 1,
0.5639965, 1.283884, -0.6529388, 0.427451, 0, 1, 1,
0.5666288, 1.498797, 0.5661094, 0.4352941, 0, 1, 1,
0.5672045, -0.6265799, 2.943528, 0.4392157, 0, 1, 1,
0.5718038, 0.2513066, 1.211608, 0.4470588, 0, 1, 1,
0.5718449, 0.8521044, -0.006077615, 0.4509804, 0, 1, 1,
0.5727509, -0.3192124, 1.830986, 0.4588235, 0, 1, 1,
0.5803251, -0.0730492, 2.498152, 0.4627451, 0, 1, 1,
0.580925, -0.7763174, 1.154141, 0.4705882, 0, 1, 1,
0.5910617, -0.4738894, 2.553432, 0.4745098, 0, 1, 1,
0.5949817, 0.8761718, -0.07979567, 0.4823529, 0, 1, 1,
0.5966418, 1.337962, 0.8122653, 0.4862745, 0, 1, 1,
0.5996869, 0.04936766, 0.1033872, 0.4941176, 0, 1, 1,
0.6007579, -1.700884, 0.8231782, 0.5019608, 0, 1, 1,
0.6031981, 0.4119538, 0.3201466, 0.5058824, 0, 1, 1,
0.6063262, -0.04055369, 3.203335, 0.5137255, 0, 1, 1,
0.6071817, 1.271576, 0.6743426, 0.5176471, 0, 1, 1,
0.6124586, 0.8003162, 1.628466, 0.5254902, 0, 1, 1,
0.6140936, 0.6157795, 1.57739, 0.5294118, 0, 1, 1,
0.6158618, 0.8279048, -0.7900339, 0.5372549, 0, 1, 1,
0.6185378, 1.660947, -0.3193361, 0.5411765, 0, 1, 1,
0.6202284, -0.2410983, 2.328545, 0.5490196, 0, 1, 1,
0.6214843, 0.2527935, 1.893291, 0.5529412, 0, 1, 1,
0.6223616, 0.9344317, 0.8007748, 0.5607843, 0, 1, 1,
0.6243654, 0.2295343, 1.772206, 0.5647059, 0, 1, 1,
0.6288657, -0.894388, 2.109614, 0.572549, 0, 1, 1,
0.630865, -0.5858056, 4.053334, 0.5764706, 0, 1, 1,
0.6337864, -0.07736079, 0.2152243, 0.5843138, 0, 1, 1,
0.63546, 0.1833755, 0.3436289, 0.5882353, 0, 1, 1,
0.638048, 0.9938272, 0.797667, 0.5960785, 0, 1, 1,
0.6420037, -0.6053757, 2.760009, 0.6039216, 0, 1, 1,
0.6482765, 0.2457577, 1.271276, 0.6078432, 0, 1, 1,
0.6508887, -1.977092, 3.617733, 0.6156863, 0, 1, 1,
0.6557427, -0.40692, 0.2119177, 0.6196079, 0, 1, 1,
0.6567684, 2.488698, -0.5597979, 0.627451, 0, 1, 1,
0.6622909, 0.1062962, 0.9217208, 0.6313726, 0, 1, 1,
0.6675186, 2.317599, -0.3055646, 0.6392157, 0, 1, 1,
0.6717757, 0.5498663, 0.1544247, 0.6431373, 0, 1, 1,
0.6787738, -1.302189, 2.656237, 0.6509804, 0, 1, 1,
0.6805226, 0.3226309, 0.1579797, 0.654902, 0, 1, 1,
0.6812813, 1.0325, 2.375581, 0.6627451, 0, 1, 1,
0.6845784, 0.4609044, 2.732779, 0.6666667, 0, 1, 1,
0.6859232, 0.6699033, -0.9093502, 0.6745098, 0, 1, 1,
0.693426, -1.052488, 1.119896, 0.6784314, 0, 1, 1,
0.6951903, -1.384934, 2.377508, 0.6862745, 0, 1, 1,
0.6993768, -1.027764, 3.118377, 0.6901961, 0, 1, 1,
0.7061874, -1.573424, 1.958482, 0.6980392, 0, 1, 1,
0.7069691, 0.7084058, 1.251917, 0.7058824, 0, 1, 1,
0.7077401, 1.317312, -0.7619411, 0.7098039, 0, 1, 1,
0.7084319, -0.5596026, 2.681838, 0.7176471, 0, 1, 1,
0.710418, 1.44194, 1.299345, 0.7215686, 0, 1, 1,
0.7115117, 0.4983761, -0.3707126, 0.7294118, 0, 1, 1,
0.7117527, -0.231346, 1.10477, 0.7333333, 0, 1, 1,
0.7167168, 0.3621736, 3.355975, 0.7411765, 0, 1, 1,
0.7182723, -0.7013362, 2.385169, 0.7450981, 0, 1, 1,
0.7203402, 1.510506, 0.9436629, 0.7529412, 0, 1, 1,
0.7234852, 0.3826974, -0.02002352, 0.7568628, 0, 1, 1,
0.7245937, 0.4649398, 0.605974, 0.7647059, 0, 1, 1,
0.7254702, -1.314751, 3.086446, 0.7686275, 0, 1, 1,
0.729749, -0.0185306, 1.981233, 0.7764706, 0, 1, 1,
0.7324978, -1.732901, 4.323987, 0.7803922, 0, 1, 1,
0.7336892, 0.9470783, 0.6257037, 0.7882353, 0, 1, 1,
0.7361529, 0.5585199, 3.462075, 0.7921569, 0, 1, 1,
0.7364193, 0.564374, 0.6445767, 0.8, 0, 1, 1,
0.741564, 1.508614, 0.8536223, 0.8078431, 0, 1, 1,
0.7457561, 1.683282, 2.126709, 0.8117647, 0, 1, 1,
0.7564816, -1.060913, 3.690045, 0.8196079, 0, 1, 1,
0.7602727, -0.1597175, 0.9507684, 0.8235294, 0, 1, 1,
0.7622916, -1.336611, 1.37645, 0.8313726, 0, 1, 1,
0.7685418, -0.7757759, 1.994255, 0.8352941, 0, 1, 1,
0.7812172, -0.4782647, 1.783853, 0.8431373, 0, 1, 1,
0.7828283, -0.6729349, 2.572116, 0.8470588, 0, 1, 1,
0.7848762, -1.355357, 1.548746, 0.854902, 0, 1, 1,
0.795619, 1.356544, 2.216586, 0.8588235, 0, 1, 1,
0.8007205, -0.05643377, -0.4911077, 0.8666667, 0, 1, 1,
0.8071539, 2.804663, -0.477903, 0.8705882, 0, 1, 1,
0.8129685, 0.9439557, 1.320369, 0.8784314, 0, 1, 1,
0.8358514, 0.4377639, 1.496289, 0.8823529, 0, 1, 1,
0.8378736, 0.710219, 2.178242, 0.8901961, 0, 1, 1,
0.8388556, -0.4309011, 1.221882, 0.8941177, 0, 1, 1,
0.847959, 0.2218246, 0.2012756, 0.9019608, 0, 1, 1,
0.8546848, -0.1048216, 0.9473412, 0.9098039, 0, 1, 1,
0.8547308, 0.7890083, 0.8625309, 0.9137255, 0, 1, 1,
0.8592793, -0.6740977, 2.761719, 0.9215686, 0, 1, 1,
0.8606966, 0.01391989, 3.460346, 0.9254902, 0, 1, 1,
0.8622484, 0.01264702, 1.544197, 0.9333333, 0, 1, 1,
0.8680758, -1.575154, 2.630293, 0.9372549, 0, 1, 1,
0.8710139, -0.1926385, 1.518429, 0.945098, 0, 1, 1,
0.8873542, -0.6738593, 3.004763, 0.9490196, 0, 1, 1,
0.8874684, -0.2076128, 0.9565527, 0.9568627, 0, 1, 1,
0.8881281, 0.5632125, -0.5672594, 0.9607843, 0, 1, 1,
0.8883465, 1.041012, -0.6713439, 0.9686275, 0, 1, 1,
0.8936304, -0.4355446, 2.408428, 0.972549, 0, 1, 1,
0.8951979, 0.2611021, 2.908998, 0.9803922, 0, 1, 1,
0.8962215, 0.008423238, 0.9913838, 0.9843137, 0, 1, 1,
0.897458, -0.7438048, 4.708557, 0.9921569, 0, 1, 1,
0.9014431, -0.4016372, 1.168692, 0.9960784, 0, 1, 1,
0.903701, -2.493644, 1.619752, 1, 0, 0.9960784, 1,
0.9049962, -0.8671957, 2.105002, 1, 0, 0.9882353, 1,
0.9056647, 1.420554, 0.090555, 1, 0, 0.9843137, 1,
0.9108209, -0.2037712, 2.013778, 1, 0, 0.9764706, 1,
0.9119313, -0.3802912, 2.752091, 1, 0, 0.972549, 1,
0.9141243, 1.034388, -0.5326138, 1, 0, 0.9647059, 1,
0.9253057, 0.6666405, 0.5169274, 1, 0, 0.9607843, 1,
0.9301551, 0.2409512, 1.578711, 1, 0, 0.9529412, 1,
0.931247, -0.7224451, 1.051541, 1, 0, 0.9490196, 1,
0.9316465, 0.1748887, 2.867521, 1, 0, 0.9411765, 1,
0.9322225, -0.9846199, 2.341817, 1, 0, 0.9372549, 1,
0.9323949, 0.6324139, 1.930602, 1, 0, 0.9294118, 1,
0.9341394, 0.4321377, 0.08881818, 1, 0, 0.9254902, 1,
0.9345921, -1.97449, 2.65614, 1, 0, 0.9176471, 1,
0.9363364, 1.464086, 0.05652658, 1, 0, 0.9137255, 1,
0.9401991, -0.9595803, 1.143285, 1, 0, 0.9058824, 1,
0.9424923, 0.02783294, 1.77091, 1, 0, 0.9019608, 1,
0.9425849, 1.007954, 0.2973285, 1, 0, 0.8941177, 1,
0.945389, 1.520957, 0.6396217, 1, 0, 0.8862745, 1,
0.9480414, 0.7482648, 1.086245, 1, 0, 0.8823529, 1,
0.9491085, -1.030378, 1.853158, 1, 0, 0.8745098, 1,
0.957132, -0.9148824, 1.033092, 1, 0, 0.8705882, 1,
0.9613767, -0.6181772, 2.604882, 1, 0, 0.8627451, 1,
0.9633386, 1.252011, 0.1693855, 1, 0, 0.8588235, 1,
0.9638507, -0.6142102, 2.788675, 1, 0, 0.8509804, 1,
0.9670168, 0.09487664, 2.626633, 1, 0, 0.8470588, 1,
0.9730481, 0.2812622, 2.904907, 1, 0, 0.8392157, 1,
0.9851508, -0.5325631, 3.406718, 1, 0, 0.8352941, 1,
0.9884304, 1.357617, -0.2580928, 1, 0, 0.827451, 1,
0.9892144, 0.02549453, 0.4363576, 1, 0, 0.8235294, 1,
0.9892794, 0.5192816, 0.3961164, 1, 0, 0.8156863, 1,
0.9895223, -0.971936, 3.161249, 1, 0, 0.8117647, 1,
0.9970054, -0.3369705, 2.042476, 1, 0, 0.8039216, 1,
0.9979197, -0.9958252, 1.307716, 1, 0, 0.7960784, 1,
1.0065, -0.8861523, 2.674717, 1, 0, 0.7921569, 1,
1.010752, -1.448062, 1.85609, 1, 0, 0.7843137, 1,
1.016152, -1.775081, 1.350637, 1, 0, 0.7803922, 1,
1.023177, -1.392645, 3.947363, 1, 0, 0.772549, 1,
1.0257, -1.345436, 2.882975, 1, 0, 0.7686275, 1,
1.030466, 1.031138, 2.225334, 1, 0, 0.7607843, 1,
1.031862, 0.446723, 0.5426345, 1, 0, 0.7568628, 1,
1.034942, -0.4098607, 2.432243, 1, 0, 0.7490196, 1,
1.041716, 1.614648, 1.512669, 1, 0, 0.7450981, 1,
1.042261, 0.1835604, 1.591097, 1, 0, 0.7372549, 1,
1.051033, 0.2184384, 3.652725, 1, 0, 0.7333333, 1,
1.055234, -0.6929681, 0.9514391, 1, 0, 0.7254902, 1,
1.056231, 0.6599165, -0.2582332, 1, 0, 0.7215686, 1,
1.058998, 0.5518044, 1.044423, 1, 0, 0.7137255, 1,
1.061481, 1.50161, 0.4778525, 1, 0, 0.7098039, 1,
1.074185, -0.8897768, 2.143218, 1, 0, 0.7019608, 1,
1.075462, -0.6290609, 2.298825, 1, 0, 0.6941177, 1,
1.07693, 0.3282355, 1.772784, 1, 0, 0.6901961, 1,
1.07975, 1.190921, -0.1648277, 1, 0, 0.682353, 1,
1.080257, 0.8057601, 1.623379, 1, 0, 0.6784314, 1,
1.082208, -0.5203387, 0.178259, 1, 0, 0.6705883, 1,
1.086485, 1.11974, 0.6623141, 1, 0, 0.6666667, 1,
1.087869, 1.09154, 1.559116, 1, 0, 0.6588235, 1,
1.092963, 1.548835, -0.4494938, 1, 0, 0.654902, 1,
1.093241, 0.008493667, 3.171713, 1, 0, 0.6470588, 1,
1.096365, 0.1142447, 1.595229, 1, 0, 0.6431373, 1,
1.09911, 1.018222, -1.323672, 1, 0, 0.6352941, 1,
1.11539, -1.468267, 2.995291, 1, 0, 0.6313726, 1,
1.123762, -0.2562584, 1.926794, 1, 0, 0.6235294, 1,
1.123905, -0.5430369, 3.21925, 1, 0, 0.6196079, 1,
1.128368, -0.3259278, 1.144094, 1, 0, 0.6117647, 1,
1.131777, 0.1315488, 0.7712126, 1, 0, 0.6078432, 1,
1.134548, 1.430754, 1.760522, 1, 0, 0.6, 1,
1.149376, -0.4637945, 1.266452, 1, 0, 0.5921569, 1,
1.14948, -1.963994, 3.326432, 1, 0, 0.5882353, 1,
1.150045, -1.310499, 1.474835, 1, 0, 0.5803922, 1,
1.151373, -1.183982, 2.986304, 1, 0, 0.5764706, 1,
1.152468, 1.073655, 0.4258087, 1, 0, 0.5686275, 1,
1.176481, 0.1404189, 2.197356, 1, 0, 0.5647059, 1,
1.188584, -2.2378, 4.346601, 1, 0, 0.5568628, 1,
1.188708, -0.9238226, 4.140636, 1, 0, 0.5529412, 1,
1.195691, -1.59886, 3.548343, 1, 0, 0.5450981, 1,
1.195767, 1.602044, 1.992752, 1, 0, 0.5411765, 1,
1.199172, 0.03927638, 1.43667, 1, 0, 0.5333334, 1,
1.204366, 0.7885826, 0.9657121, 1, 0, 0.5294118, 1,
1.219086, -0.1355018, 2.172272, 1, 0, 0.5215687, 1,
1.223207, -0.5307835, 3.199098, 1, 0, 0.5176471, 1,
1.232482, 0.07909691, 2.544555, 1, 0, 0.509804, 1,
1.234563, -1.119917, 1.131904, 1, 0, 0.5058824, 1,
1.259601, -0.07568063, 0.5727226, 1, 0, 0.4980392, 1,
1.262966, 0.321748, 1.162302, 1, 0, 0.4901961, 1,
1.264325, 0.9998896, 1.523824, 1, 0, 0.4862745, 1,
1.277363, 0.8820261, 1.178306, 1, 0, 0.4784314, 1,
1.283846, -0.2071867, 1.380046, 1, 0, 0.4745098, 1,
1.284361, 0.04354025, 1.617626, 1, 0, 0.4666667, 1,
1.290537, 1.846182, 0.2826506, 1, 0, 0.4627451, 1,
1.298589, 0.5975695, 0.2838453, 1, 0, 0.454902, 1,
1.306497, -1.438801, 1.75249, 1, 0, 0.4509804, 1,
1.317169, 0.339027, 1.65018, 1, 0, 0.4431373, 1,
1.334752, 2.262882, 0.2973171, 1, 0, 0.4392157, 1,
1.336782, -0.8299497, 2.531179, 1, 0, 0.4313726, 1,
1.341851, 0.9096861, 0.2236845, 1, 0, 0.427451, 1,
1.345936, 0.9688979, 2.006541, 1, 0, 0.4196078, 1,
1.348027, -1.625511, 4.906377, 1, 0, 0.4156863, 1,
1.350051, -1.271622, 2.238025, 1, 0, 0.4078431, 1,
1.353356, 1.547486, 2.322989, 1, 0, 0.4039216, 1,
1.387396, 0.5692027, -0.476406, 1, 0, 0.3960784, 1,
1.389055, -1.427075, 1.351527, 1, 0, 0.3882353, 1,
1.391369, -1.378136, 1.622292, 1, 0, 0.3843137, 1,
1.393876, -0.463086, 2.102581, 1, 0, 0.3764706, 1,
1.406176, 0.1172425, 2.174645, 1, 0, 0.372549, 1,
1.418216, 0.6566429, -0.8183715, 1, 0, 0.3647059, 1,
1.426754, -0.8223845, 2.04454, 1, 0, 0.3607843, 1,
1.43016, -0.8719549, 1.769757, 1, 0, 0.3529412, 1,
1.431733, -0.8778268, 1.753587, 1, 0, 0.3490196, 1,
1.436458, 1.014912, 2.583439, 1, 0, 0.3411765, 1,
1.453346, -0.7396989, 1.657115, 1, 0, 0.3372549, 1,
1.461051, 1.741883, -1.101389, 1, 0, 0.3294118, 1,
1.46194, -1.650783, 3.813083, 1, 0, 0.3254902, 1,
1.463344, 1.175645, 1.38617, 1, 0, 0.3176471, 1,
1.467716, 0.2126702, 1.568012, 1, 0, 0.3137255, 1,
1.473124, 0.2958584, 1.498028, 1, 0, 0.3058824, 1,
1.476283, -1.428009, 2.197927, 1, 0, 0.2980392, 1,
1.478161, -0.475485, 2.936254, 1, 0, 0.2941177, 1,
1.487402, 0.03472384, 1.891775, 1, 0, 0.2862745, 1,
1.521921, 0.1853607, 1.183025, 1, 0, 0.282353, 1,
1.566893, -0.8734124, 1.854022, 1, 0, 0.2745098, 1,
1.568915, 1.802819, -0.4728433, 1, 0, 0.2705882, 1,
1.575375, -1.31989, 3.99811, 1, 0, 0.2627451, 1,
1.586568, -1.49011, 1.838113, 1, 0, 0.2588235, 1,
1.592671, 1.097369, 2.151542, 1, 0, 0.2509804, 1,
1.621658, -0.4725451, 1.974209, 1, 0, 0.2470588, 1,
1.622322, 3.116275, 0.5913538, 1, 0, 0.2392157, 1,
1.623801, -0.1210069, 2.58674, 1, 0, 0.2352941, 1,
1.628247, 0.5926787, 2.232401, 1, 0, 0.227451, 1,
1.631708, 0.2234318, 1.396096, 1, 0, 0.2235294, 1,
1.636572, -1.57601, 2.92095, 1, 0, 0.2156863, 1,
1.639074, 2.14102, 1.607579, 1, 0, 0.2117647, 1,
1.64432, 0.4547529, 0.5278088, 1, 0, 0.2039216, 1,
1.654767, -1.969067, 2.518415, 1, 0, 0.1960784, 1,
1.665261, 1.039098, -0.0122359, 1, 0, 0.1921569, 1,
1.674436, 0.08457279, 1.188137, 1, 0, 0.1843137, 1,
1.708049, 1.267337, 2.315152, 1, 0, 0.1803922, 1,
1.765805, 1.604168, 2.401864, 1, 0, 0.172549, 1,
1.770481, 1.088956, 0.6335315, 1, 0, 0.1686275, 1,
1.820651, 1.112443, 2.931103, 1, 0, 0.1607843, 1,
1.833678, 0.858907, 1.438667, 1, 0, 0.1568628, 1,
1.852879, -1.097037, 1.612314, 1, 0, 0.1490196, 1,
1.864371, 0.6575577, 1.178832, 1, 0, 0.145098, 1,
1.875955, -0.9606484, 2.029178, 1, 0, 0.1372549, 1,
1.907256, -0.862622, -0.3164094, 1, 0, 0.1333333, 1,
1.924275, 1.135979, 1.72209, 1, 0, 0.1254902, 1,
1.961239, 0.3394413, 1.740172, 1, 0, 0.1215686, 1,
1.977461, 0.3873416, -0.08307874, 1, 0, 0.1137255, 1,
1.982492, -0.8095098, 2.425682, 1, 0, 0.1098039, 1,
2.008636, 0.4338951, 2.186316, 1, 0, 0.1019608, 1,
2.013737, -0.9448745, 0.7876254, 1, 0, 0.09411765, 1,
2.02189, 1.05961, 1.624478, 1, 0, 0.09019608, 1,
2.075379, 1.98065, 2.264047, 1, 0, 0.08235294, 1,
2.085789, 0.7567743, -0.2712217, 1, 0, 0.07843138, 1,
2.090492, -1.01063, 1.598095, 1, 0, 0.07058824, 1,
2.101247, 0.3070749, 1.04658, 1, 0, 0.06666667, 1,
2.234378, -0.2311987, 2.299948, 1, 0, 0.05882353, 1,
2.263736, -0.3403025, 1.862075, 1, 0, 0.05490196, 1,
2.306142, -0.4216165, 1.016218, 1, 0, 0.04705882, 1,
2.355386, -1.598342, 1.965749, 1, 0, 0.04313726, 1,
2.580921, 0.1103658, 1.986029, 1, 0, 0.03529412, 1,
2.707137, 0.2520167, 0.3535199, 1, 0, 0.03137255, 1,
2.938248, 0.7854659, -0.09252982, 1, 0, 0.02352941, 1,
3.093679, 1.079129, 1.259112, 1, 0, 0.01960784, 1,
3.810226, -0.8368437, 0.8640979, 1, 0, 0.01176471, 1,
4.011357, 1.89595, 1.928095, 1, 0, 0.007843138, 1
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
0.3148606, -4.007452, -8.171597, 0, -0.5, 0.5, 0.5,
0.3148606, -4.007452, -8.171597, 1, -0.5, 0.5, 0.5,
0.3148606, -4.007452, -8.171597, 1, 1.5, 0.5, 0.5,
0.3148606, -4.007452, -8.171597, 0, 1.5, 0.5, 0.5
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
-4.634748, 0.07254815, -8.171597, 0, -0.5, 0.5, 0.5,
-4.634748, 0.07254815, -8.171597, 1, -0.5, 0.5, 0.5,
-4.634748, 0.07254815, -8.171597, 1, 1.5, 0.5, 0.5,
-4.634748, 0.07254815, -8.171597, 0, 1.5, 0.5, 0.5
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
-4.634748, -4.007452, -0.5085499, 0, -0.5, 0.5, 0.5,
-4.634748, -4.007452, -0.5085499, 1, -0.5, 0.5, 0.5,
-4.634748, -4.007452, -0.5085499, 1, 1.5, 0.5, 0.5,
-4.634748, -4.007452, -0.5085499, 0, 1.5, 0.5, 0.5
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
-2, -3.065914, -6.403201,
4, -3.065914, -6.403201,
-2, -3.065914, -6.403201,
-2, -3.222837, -6.697934,
0, -3.065914, -6.403201,
0, -3.222837, -6.697934,
2, -3.065914, -6.403201,
2, -3.222837, -6.697934,
4, -3.065914, -6.403201,
4, -3.222837, -6.697934
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
"2",
"4"
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
-2, -3.536683, -7.287399, 0, -0.5, 0.5, 0.5,
-2, -3.536683, -7.287399, 1, -0.5, 0.5, 0.5,
-2, -3.536683, -7.287399, 1, 1.5, 0.5, 0.5,
-2, -3.536683, -7.287399, 0, 1.5, 0.5, 0.5,
0, -3.536683, -7.287399, 0, -0.5, 0.5, 0.5,
0, -3.536683, -7.287399, 1, -0.5, 0.5, 0.5,
0, -3.536683, -7.287399, 1, 1.5, 0.5, 0.5,
0, -3.536683, -7.287399, 0, 1.5, 0.5, 0.5,
2, -3.536683, -7.287399, 0, -0.5, 0.5, 0.5,
2, -3.536683, -7.287399, 1, -0.5, 0.5, 0.5,
2, -3.536683, -7.287399, 1, 1.5, 0.5, 0.5,
2, -3.536683, -7.287399, 0, 1.5, 0.5, 0.5,
4, -3.536683, -7.287399, 0, -0.5, 0.5, 0.5,
4, -3.536683, -7.287399, 1, -0.5, 0.5, 0.5,
4, -3.536683, -7.287399, 1, 1.5, 0.5, 0.5,
4, -3.536683, -7.287399, 0, 1.5, 0.5, 0.5
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
-3.492531, -2, -6.403201,
-3.492531, 3, -6.403201,
-3.492531, -2, -6.403201,
-3.682901, -2, -6.697934,
-3.492531, -1, -6.403201,
-3.682901, -1, -6.697934,
-3.492531, 0, -6.403201,
-3.682901, 0, -6.697934,
-3.492531, 1, -6.403201,
-3.682901, 1, -6.697934,
-3.492531, 2, -6.403201,
-3.682901, 2, -6.697934,
-3.492531, 3, -6.403201,
-3.682901, 3, -6.697934
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
-4.06364, -2, -7.287399, 0, -0.5, 0.5, 0.5,
-4.06364, -2, -7.287399, 1, -0.5, 0.5, 0.5,
-4.06364, -2, -7.287399, 1, 1.5, 0.5, 0.5,
-4.06364, -2, -7.287399, 0, 1.5, 0.5, 0.5,
-4.06364, -1, -7.287399, 0, -0.5, 0.5, 0.5,
-4.06364, -1, -7.287399, 1, -0.5, 0.5, 0.5,
-4.06364, -1, -7.287399, 1, 1.5, 0.5, 0.5,
-4.06364, -1, -7.287399, 0, 1.5, 0.5, 0.5,
-4.06364, 0, -7.287399, 0, -0.5, 0.5, 0.5,
-4.06364, 0, -7.287399, 1, -0.5, 0.5, 0.5,
-4.06364, 0, -7.287399, 1, 1.5, 0.5, 0.5,
-4.06364, 0, -7.287399, 0, 1.5, 0.5, 0.5,
-4.06364, 1, -7.287399, 0, -0.5, 0.5, 0.5,
-4.06364, 1, -7.287399, 1, -0.5, 0.5, 0.5,
-4.06364, 1, -7.287399, 1, 1.5, 0.5, 0.5,
-4.06364, 1, -7.287399, 0, 1.5, 0.5, 0.5,
-4.06364, 2, -7.287399, 0, -0.5, 0.5, 0.5,
-4.06364, 2, -7.287399, 1, -0.5, 0.5, 0.5,
-4.06364, 2, -7.287399, 1, 1.5, 0.5, 0.5,
-4.06364, 2, -7.287399, 0, 1.5, 0.5, 0.5,
-4.06364, 3, -7.287399, 0, -0.5, 0.5, 0.5,
-4.06364, 3, -7.287399, 1, -0.5, 0.5, 0.5,
-4.06364, 3, -7.287399, 1, 1.5, 0.5, 0.5,
-4.06364, 3, -7.287399, 0, 1.5, 0.5, 0.5
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
-3.492531, -3.065914, -6,
-3.492531, -3.065914, 4,
-3.492531, -3.065914, -6,
-3.682901, -3.222837, -6,
-3.492531, -3.065914, -4,
-3.682901, -3.222837, -4,
-3.492531, -3.065914, -2,
-3.682901, -3.222837, -2,
-3.492531, -3.065914, 0,
-3.682901, -3.222837, 0,
-3.492531, -3.065914, 2,
-3.682901, -3.222837, 2,
-3.492531, -3.065914, 4,
-3.682901, -3.222837, 4
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
-4.06364, -3.536683, -6, 0, -0.5, 0.5, 0.5,
-4.06364, -3.536683, -6, 1, -0.5, 0.5, 0.5,
-4.06364, -3.536683, -6, 1, 1.5, 0.5, 0.5,
-4.06364, -3.536683, -6, 0, 1.5, 0.5, 0.5,
-4.06364, -3.536683, -4, 0, -0.5, 0.5, 0.5,
-4.06364, -3.536683, -4, 1, -0.5, 0.5, 0.5,
-4.06364, -3.536683, -4, 1, 1.5, 0.5, 0.5,
-4.06364, -3.536683, -4, 0, 1.5, 0.5, 0.5,
-4.06364, -3.536683, -2, 0, -0.5, 0.5, 0.5,
-4.06364, -3.536683, -2, 1, -0.5, 0.5, 0.5,
-4.06364, -3.536683, -2, 1, 1.5, 0.5, 0.5,
-4.06364, -3.536683, -2, 0, 1.5, 0.5, 0.5,
-4.06364, -3.536683, 0, 0, -0.5, 0.5, 0.5,
-4.06364, -3.536683, 0, 1, -0.5, 0.5, 0.5,
-4.06364, -3.536683, 0, 1, 1.5, 0.5, 0.5,
-4.06364, -3.536683, 0, 0, 1.5, 0.5, 0.5,
-4.06364, -3.536683, 2, 0, -0.5, 0.5, 0.5,
-4.06364, -3.536683, 2, 1, -0.5, 0.5, 0.5,
-4.06364, -3.536683, 2, 1, 1.5, 0.5, 0.5,
-4.06364, -3.536683, 2, 0, 1.5, 0.5, 0.5,
-4.06364, -3.536683, 4, 0, -0.5, 0.5, 0.5,
-4.06364, -3.536683, 4, 1, -0.5, 0.5, 0.5,
-4.06364, -3.536683, 4, 1, 1.5, 0.5, 0.5,
-4.06364, -3.536683, 4, 0, 1.5, 0.5, 0.5
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
-3.492531, -3.065914, -6.403201,
-3.492531, 3.21101, -6.403201,
-3.492531, -3.065914, 5.386101,
-3.492531, 3.21101, 5.386101,
-3.492531, -3.065914, -6.403201,
-3.492531, -3.065914, 5.386101,
-3.492531, 3.21101, -6.403201,
-3.492531, 3.21101, 5.386101,
-3.492531, -3.065914, -6.403201,
4.122252, -3.065914, -6.403201,
-3.492531, -3.065914, 5.386101,
4.122252, -3.065914, 5.386101,
-3.492531, 3.21101, -6.403201,
4.122252, 3.21101, -6.403201,
-3.492531, 3.21101, 5.386101,
4.122252, 3.21101, 5.386101,
4.122252, -3.065914, -6.403201,
4.122252, 3.21101, -6.403201,
4.122252, -3.065914, 5.386101,
4.122252, 3.21101, 5.386101,
4.122252, -3.065914, -6.403201,
4.122252, -3.065914, 5.386101,
4.122252, 3.21101, -6.403201,
4.122252, 3.21101, 5.386101
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
var radius = 8.209634;
var distance = 36.52559;
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
mvMatrix.translate( -0.3148606, -0.07254815, 0.5085499 );
mvMatrix.scale( 1.165682, 1.414135, 0.7529213 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.52559);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
dichlorobenzophenone<-read.table("dichlorobenzophenone.xyz")
```

```
## Error in read.table("dichlorobenzophenone.xyz"): no lines available in input
```

```r
x<-dichlorobenzophenone$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichlorobenzophenone' not found
```

```r
y<-dichlorobenzophenone$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichlorobenzophenone' not found
```

```r
z<-dichlorobenzophenone$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichlorobenzophenone' not found
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
-3.381636, 0.7910262, -2.543398, 0, 0, 1, 1, 1,
-2.863772, -0.1642636, -0.6409043, 1, 0, 0, 1, 1,
-2.737861, 0.2910706, -2.177323, 1, 0, 0, 1, 1,
-2.607502, -0.06275509, -2.008273, 1, 0, 0, 1, 1,
-2.565483, 1.655687, -1.349416, 1, 0, 0, 1, 1,
-2.554139, -0.1299804, -2.297559, 1, 0, 0, 1, 1,
-2.546856, -0.4110652, -2.953774, 0, 0, 0, 1, 1,
-2.536937, -1.098426, -1.532276, 0, 0, 0, 1, 1,
-2.524036, 1.695044, -0.3869341, 0, 0, 0, 1, 1,
-2.469888, 1.333156, -2.443251, 0, 0, 0, 1, 1,
-2.41191, 0.6026628, -0.8693742, 0, 0, 0, 1, 1,
-2.351156, -0.8046247, -1.762716, 0, 0, 0, 1, 1,
-2.330877, -0.3916481, -2.992779, 0, 0, 0, 1, 1,
-2.308275, -2.460185, -1.640276, 1, 1, 1, 1, 1,
-2.289038, 0.8775309, -2.414639, 1, 1, 1, 1, 1,
-2.276315, -0.4997282, -2.703014, 1, 1, 1, 1, 1,
-2.274122, 0.8726174, -0.6659328, 1, 1, 1, 1, 1,
-2.267704, -0.4628372, -1.240786, 1, 1, 1, 1, 1,
-2.267256, -0.07790794, -1.583866, 1, 1, 1, 1, 1,
-2.26351, 0.8753732, -1.591645, 1, 1, 1, 1, 1,
-2.263296, 0.2944583, -0.9816971, 1, 1, 1, 1, 1,
-2.247889, 1.646837, -1.012239, 1, 1, 1, 1, 1,
-2.221297, 1.320553, -0.7706779, 1, 1, 1, 1, 1,
-2.213047, -0.5709468, -0.0619736, 1, 1, 1, 1, 1,
-2.193537, -2.056973, -3.616482, 1, 1, 1, 1, 1,
-2.143405, -0.1299014, -0.9469618, 1, 1, 1, 1, 1,
-2.122807, 0.1813102, -1.98545, 1, 1, 1, 1, 1,
-2.088538, -0.01768048, -0.7051541, 1, 1, 1, 1, 1,
-1.991824, -0.4392916, -0.6850596, 0, 0, 1, 1, 1,
-1.965399, -0.8603123, -2.23208, 1, 0, 0, 1, 1,
-1.963274, 1.489894, -0.2839067, 1, 0, 0, 1, 1,
-1.959681, -0.3237261, -1.298811, 1, 0, 0, 1, 1,
-1.941685, 0.6305481, -0.9444209, 1, 0, 0, 1, 1,
-1.922611, 0.7551386, -0.6956408, 1, 0, 0, 1, 1,
-1.915988, 2.798989, 1.00372, 0, 0, 0, 1, 1,
-1.895283, 0.3868546, -0.7812423, 0, 0, 0, 1, 1,
-1.854025, -0.5944275, -1.295015, 0, 0, 0, 1, 1,
-1.852575, -0.3466474, -0.3812303, 0, 0, 0, 1, 1,
-1.836252, -1.138264, -2.335601, 0, 0, 0, 1, 1,
-1.828841, -0.2330085, -3.601893, 0, 0, 0, 1, 1,
-1.827039, 0.7940792, -2.493288, 0, 0, 0, 1, 1,
-1.823991, -0.961657, -2.679865, 1, 1, 1, 1, 1,
-1.817296, 0.7866296, -1.941181, 1, 1, 1, 1, 1,
-1.815837, 0.9161782, -0.9577746, 1, 1, 1, 1, 1,
-1.800209, -1.795965, -3.893025, 1, 1, 1, 1, 1,
-1.799982, -1.182095, -2.928695, 1, 1, 1, 1, 1,
-1.791105, -0.1944761, -3.262971, 1, 1, 1, 1, 1,
-1.787995, 0.4248274, -0.761358, 1, 1, 1, 1, 1,
-1.767356, 0.0387278, -2.306021, 1, 1, 1, 1, 1,
-1.761374, 0.8808407, -1.99738, 1, 1, 1, 1, 1,
-1.746752, -1.657637, -2.510874, 1, 1, 1, 1, 1,
-1.722619, -1.300192, -1.451569, 1, 1, 1, 1, 1,
-1.710352, 0.0614191, -0.9536283, 1, 1, 1, 1, 1,
-1.701933, 3.119598, 0.3086362, 1, 1, 1, 1, 1,
-1.69776, 1.328601, 0.6775256, 1, 1, 1, 1, 1,
-1.694781, -0.02704113, -2.056401, 1, 1, 1, 1, 1,
-1.673836, 0.3892533, -2.053047, 0, 0, 1, 1, 1,
-1.673122, 0.2821112, -0.8085297, 1, 0, 0, 1, 1,
-1.662745, -0.3657894, -2.312181, 1, 0, 0, 1, 1,
-1.64191, 0.5286153, -2.152694, 1, 0, 0, 1, 1,
-1.640659, -0.3294472, -1.466332, 1, 0, 0, 1, 1,
-1.6354, 0.1875799, -3.994687, 1, 0, 0, 1, 1,
-1.613439, 2.720013, -1.45353, 0, 0, 0, 1, 1,
-1.61243, -0.3049625, -0.7449855, 0, 0, 0, 1, 1,
-1.599272, 0.2150776, -1.252234, 0, 0, 0, 1, 1,
-1.598033, 0.1622918, -1.005294, 0, 0, 0, 1, 1,
-1.597451, 1.742589, -1.927096, 0, 0, 0, 1, 1,
-1.585165, -0.7894555, -3.605117, 0, 0, 0, 1, 1,
-1.582477, -0.4730119, -3.240262, 0, 0, 0, 1, 1,
-1.577159, -0.9132716, -2.267228, 1, 1, 1, 1, 1,
-1.569141, -0.8976384, -2.828723, 1, 1, 1, 1, 1,
-1.555493, -1.088476, -3.658592, 1, 1, 1, 1, 1,
-1.550908, 0.1191622, -0.6832237, 1, 1, 1, 1, 1,
-1.544707, 1.205586, 0.9793368, 1, 1, 1, 1, 1,
-1.543995, 0.2366365, -1.29784, 1, 1, 1, 1, 1,
-1.541076, -0.4263668, -2.502868, 1, 1, 1, 1, 1,
-1.538019, 0.2566814, -0.9216401, 1, 1, 1, 1, 1,
-1.532691, -0.3337616, -2.181389, 1, 1, 1, 1, 1,
-1.52746, -1.012254, -1.032261, 1, 1, 1, 1, 1,
-1.518835, -0.8819151, -2.119255, 1, 1, 1, 1, 1,
-1.514304, -0.5527366, -3.132052, 1, 1, 1, 1, 1,
-1.500967, 0.4790896, -1.214434, 1, 1, 1, 1, 1,
-1.499494, 0.8396563, -2.608529, 1, 1, 1, 1, 1,
-1.473259, -0.9302701, -3.00496, 1, 1, 1, 1, 1,
-1.473061, -0.4323941, -2.676668, 0, 0, 1, 1, 1,
-1.449188, -1.092824, -3.067258, 1, 0, 0, 1, 1,
-1.447958, 0.1445638, -1.984919, 1, 0, 0, 1, 1,
-1.438471, -0.5574837, -1.800185, 1, 0, 0, 1, 1,
-1.435552, 0.7574492, -1.304714, 1, 0, 0, 1, 1,
-1.429851, -0.2629126, -0.9713932, 1, 0, 0, 1, 1,
-1.417715, 0.1681762, -0.04300251, 0, 0, 0, 1, 1,
-1.417188, -0.9908754, -3.573537, 0, 0, 0, 1, 1,
-1.395076, -0.1361495, -2.181149, 0, 0, 0, 1, 1,
-1.394138, 0.09002706, -0.2131785, 0, 0, 0, 1, 1,
-1.389409, -0.5718397, -2.390445, 0, 0, 0, 1, 1,
-1.371702, -0.8404274, -2.272794, 0, 0, 0, 1, 1,
-1.371154, -0.3342865, -2.579941, 0, 0, 0, 1, 1,
-1.368983, 1.978362, -0.7683932, 1, 1, 1, 1, 1,
-1.365125, 0.2660055, -2.816289, 1, 1, 1, 1, 1,
-1.362462, -1.103293, -2.906909, 1, 1, 1, 1, 1,
-1.352946, -2.109133, -2.299859, 1, 1, 1, 1, 1,
-1.335113, 0.7604281, -2.141146, 1, 1, 1, 1, 1,
-1.330207, -0.07798523, -1.486701, 1, 1, 1, 1, 1,
-1.329942, -0.7649968, -2.619778, 1, 1, 1, 1, 1,
-1.325356, -0.4656507, -1.164194, 1, 1, 1, 1, 1,
-1.316098, 1.351405, -1.329335, 1, 1, 1, 1, 1,
-1.299475, 0.1761272, -0.9945019, 1, 1, 1, 1, 1,
-1.280832, -1.305944, -3.006821, 1, 1, 1, 1, 1,
-1.27905, 0.1354533, -2.116581, 1, 1, 1, 1, 1,
-1.277728, 0.02777254, -1.035485, 1, 1, 1, 1, 1,
-1.269802, 0.0129895, -2.119117, 1, 1, 1, 1, 1,
-1.262792, 0.3899787, -1.569811, 1, 1, 1, 1, 1,
-1.262752, 0.636427, 0.1014564, 0, 0, 1, 1, 1,
-1.261435, -2.529712, -3.273587, 1, 0, 0, 1, 1,
-1.259966, -0.8753564, -2.356447, 1, 0, 0, 1, 1,
-1.253573, -0.3310213, -1.140283, 1, 0, 0, 1, 1,
-1.251953, -0.0820402, -3.088054, 1, 0, 0, 1, 1,
-1.246801, -1.488389, -2.602573, 1, 0, 0, 1, 1,
-1.245772, -0.5566413, -1.91935, 0, 0, 0, 1, 1,
-1.245731, 1.343139, -1.55356, 0, 0, 0, 1, 1,
-1.24011, -1.181601, -2.850403, 0, 0, 0, 1, 1,
-1.238144, -0.08387722, -2.250378, 0, 0, 0, 1, 1,
-1.234684, 0.5237735, -0.07062655, 0, 0, 0, 1, 1,
-1.232703, -0.6206046, -1.911902, 0, 0, 0, 1, 1,
-1.228908, 1.553728, -1.112442, 0, 0, 0, 1, 1,
-1.217078, -0.794507, -3.504488, 1, 1, 1, 1, 1,
-1.212897, -0.8996013, -3.793178, 1, 1, 1, 1, 1,
-1.210499, 0.8983886, -0.4965434, 1, 1, 1, 1, 1,
-1.203351, 0.816479, -2.043643, 1, 1, 1, 1, 1,
-1.187675, -1.634655, -3.086697, 1, 1, 1, 1, 1,
-1.179294, -1.719601, -3.79629, 1, 1, 1, 1, 1,
-1.177248, 0.1896828, 0.1206404, 1, 1, 1, 1, 1,
-1.17707, 0.7252834, -1.203176, 1, 1, 1, 1, 1,
-1.176149, -0.2123674, -2.178314, 1, 1, 1, 1, 1,
-1.175549, -0.579773, -0.6193059, 1, 1, 1, 1, 1,
-1.175013, 0.4082579, -0.003920741, 1, 1, 1, 1, 1,
-1.170195, -0.6804476, -3.664083, 1, 1, 1, 1, 1,
-1.168343, -0.5443336, -2.676735, 1, 1, 1, 1, 1,
-1.164441, 0.127515, -2.258639, 1, 1, 1, 1, 1,
-1.158052, 1.036907, -2.120918, 1, 1, 1, 1, 1,
-1.157414, -0.6773359, -0.8771482, 0, 0, 1, 1, 1,
-1.149412, -0.1942483, -1.318804, 1, 0, 0, 1, 1,
-1.14862, 1.20125, -0.8202035, 1, 0, 0, 1, 1,
-1.146686, -1.001669, -2.644861, 1, 0, 0, 1, 1,
-1.135184, 0.2764838, -1.584054, 1, 0, 0, 1, 1,
-1.127205, 1.471499, -0.3197797, 1, 0, 0, 1, 1,
-1.124524, 0.4579993, -2.324613, 0, 0, 0, 1, 1,
-1.122871, 2.122626, 1.217311, 0, 0, 0, 1, 1,
-1.11346, 0.845465, -0.9781179, 0, 0, 0, 1, 1,
-1.111464, 0.5801332, -1.440137, 0, 0, 0, 1, 1,
-1.109324, -0.3563891, -2.020718, 0, 0, 0, 1, 1,
-1.108721, 0.32891, -1.332526, 0, 0, 0, 1, 1,
-1.107734, -1.214635, -2.719849, 0, 0, 0, 1, 1,
-1.099784, -0.7646309, -0.9617116, 1, 1, 1, 1, 1,
-1.095723, 0.003670181, -1.140362, 1, 1, 1, 1, 1,
-1.089605, -1.488064, -1.88064, 1, 1, 1, 1, 1,
-1.085759, 2.059351, -0.464848, 1, 1, 1, 1, 1,
-1.084429, 0.6911818, -0.8891856, 1, 1, 1, 1, 1,
-1.083463, -0.7346801, -3.405666, 1, 1, 1, 1, 1,
-1.070397, -0.8817566, -2.704076, 1, 1, 1, 1, 1,
-1.068217, 0.2057806, -0.2664937, 1, 1, 1, 1, 1,
-1.063876, -0.08068458, -1.275721, 1, 1, 1, 1, 1,
-1.058743, -0.9667615, -1.521009, 1, 1, 1, 1, 1,
-1.052558, -0.3927583, -3.435248, 1, 1, 1, 1, 1,
-1.05228, 1.009708, 0.1072349, 1, 1, 1, 1, 1,
-1.049842, -1.058483, -2.048982, 1, 1, 1, 1, 1,
-1.046954, -0.1980293, -3.530069, 1, 1, 1, 1, 1,
-1.040971, -0.07753426, -0.8959856, 1, 1, 1, 1, 1,
-1.040371, 0.8172945, -0.4198644, 0, 0, 1, 1, 1,
-1.036845, -0.1165291, -1.451775, 1, 0, 0, 1, 1,
-1.021991, 0.06568725, -0.5374447, 1, 0, 0, 1, 1,
-1.013931, -0.3699043, -2.009033, 1, 0, 0, 1, 1,
-1.008918, 1.741964, -0.004652355, 1, 0, 0, 1, 1,
-1.000612, -0.5474904, -2.027102, 1, 0, 0, 1, 1,
-0.9952912, -0.6835438, -1.737437, 0, 0, 0, 1, 1,
-0.9944447, -0.4994122, -2.443255, 0, 0, 0, 1, 1,
-0.9921065, 1.314988, 1.278423, 0, 0, 0, 1, 1,
-0.9884074, 0.1599234, -1.199172, 0, 0, 0, 1, 1,
-0.9883289, 1.371941, -0.5795019, 0, 0, 0, 1, 1,
-0.987902, -2.160266, -3.032813, 0, 0, 0, 1, 1,
-0.9862413, -0.9583463, -2.801297, 0, 0, 0, 1, 1,
-0.9857433, 0.9802619, -1.092457, 1, 1, 1, 1, 1,
-0.9848655, 1.397664, 0.2185123, 1, 1, 1, 1, 1,
-0.9770249, 0.1883833, -1.373031, 1, 1, 1, 1, 1,
-0.9740244, 1.63271, -1.484859, 1, 1, 1, 1, 1,
-0.9735029, -0.7230197, -0.9442832, 1, 1, 1, 1, 1,
-0.967065, 0.7189861, -2.412055, 1, 1, 1, 1, 1,
-0.9665188, -0.1696114, -2.740129, 1, 1, 1, 1, 1,
-0.9660854, 0.2263138, -1.179591, 1, 1, 1, 1, 1,
-0.9659189, -0.9829594, -2.355844, 1, 1, 1, 1, 1,
-0.9656101, -1.476733, -3.920539, 1, 1, 1, 1, 1,
-0.9655775, 0.02658744, 0.1513359, 1, 1, 1, 1, 1,
-0.9537242, -1.02547, -1.257324, 1, 1, 1, 1, 1,
-0.9506838, 0.04407343, -1.230756, 1, 1, 1, 1, 1,
-0.9466623, -1.394935, -2.985013, 1, 1, 1, 1, 1,
-0.9462902, -0.102278, -1.958709, 1, 1, 1, 1, 1,
-0.9436336, 0.6993179, -1.859745, 0, 0, 1, 1, 1,
-0.9389934, -0.09325223, -2.675748, 1, 0, 0, 1, 1,
-0.9337438, 0.5736728, -1.446327, 1, 0, 0, 1, 1,
-0.9330844, 0.192039, -0.4310125, 1, 0, 0, 1, 1,
-0.9314258, -2.086376, -1.286805, 1, 0, 0, 1, 1,
-0.9299756, 1.031016, -1.618484, 1, 0, 0, 1, 1,
-0.9291044, -0.8507985, -2.762142, 0, 0, 0, 1, 1,
-0.9254378, -0.4331665, -1.135392, 0, 0, 0, 1, 1,
-0.9227881, -0.07434555, 0.360389, 0, 0, 0, 1, 1,
-0.9181027, -0.6209442, -1.116221, 0, 0, 0, 1, 1,
-0.9083909, -0.04675351, -1.124468, 0, 0, 0, 1, 1,
-0.9031859, 0.07994151, -1.400812, 0, 0, 0, 1, 1,
-0.9030708, 0.4600023, -0.7602261, 0, 0, 0, 1, 1,
-0.8972042, 0.5441987, -0.9333573, 1, 1, 1, 1, 1,
-0.889739, 0.3710093, -0.1564785, 1, 1, 1, 1, 1,
-0.8894159, 1.336656, 0.3303475, 1, 1, 1, 1, 1,
-0.8884954, 0.1535071, -2.241018, 1, 1, 1, 1, 1,
-0.8884405, -0.009055531, -1.549204, 1, 1, 1, 1, 1,
-0.8855602, 0.3117691, -1.811118, 1, 1, 1, 1, 1,
-0.8802313, 0.6900987, -1.343995, 1, 1, 1, 1, 1,
-0.8753712, -2.531517, -2.953736, 1, 1, 1, 1, 1,
-0.8709099, 0.09578884, -2.578612, 1, 1, 1, 1, 1,
-0.8679729, 1.303417, -1.626358, 1, 1, 1, 1, 1,
-0.8599601, 0.3889886, -1.227396, 1, 1, 1, 1, 1,
-0.8550698, -2.974502, -3.352768, 1, 1, 1, 1, 1,
-0.8543179, -1.453609, -1.21138, 1, 1, 1, 1, 1,
-0.853864, -0.5478026, -2.158535, 1, 1, 1, 1, 1,
-0.8532327, -2.371043, -2.924925, 1, 1, 1, 1, 1,
-0.8445595, -0.6984468, -0.5645217, 0, 0, 1, 1, 1,
-0.8444717, 0.5748624, -0.8927718, 1, 0, 0, 1, 1,
-0.843727, -0.007033357, -1.476292, 1, 0, 0, 1, 1,
-0.8352906, 1.073578, -2.050996, 1, 0, 0, 1, 1,
-0.8317596, -0.09740331, -3.159368, 1, 0, 0, 1, 1,
-0.8298429, 0.1641608, -1.581846, 1, 0, 0, 1, 1,
-0.8241053, -0.6517384, -2.018252, 0, 0, 0, 1, 1,
-0.818539, -1.690338, -3.369131, 0, 0, 0, 1, 1,
-0.8162104, 2.838076, -1.094208, 0, 0, 0, 1, 1,
-0.8090682, -2.143866, -1.505016, 0, 0, 0, 1, 1,
-0.8080653, -0.3806814, -4.002369, 0, 0, 0, 1, 1,
-0.8030971, -1.30751, -4.434196, 0, 0, 0, 1, 1,
-0.8001993, 1.077098, -0.342863, 0, 0, 0, 1, 1,
-0.7903654, -0.0101006, 0.2878942, 1, 1, 1, 1, 1,
-0.7883616, 0.5130854, -0.145858, 1, 1, 1, 1, 1,
-0.7869674, -0.9192266, -2.469898, 1, 1, 1, 1, 1,
-0.7846564, 0.3218406, -0.27513, 1, 1, 1, 1, 1,
-0.7838358, -0.4627054, -0.6235186, 1, 1, 1, 1, 1,
-0.782935, -1.341713, -3.501946, 1, 1, 1, 1, 1,
-0.7828329, 1.246165, 0.2560124, 1, 1, 1, 1, 1,
-0.7826837, -1.233325, -2.101976, 1, 1, 1, 1, 1,
-0.7822096, 0.3983972, -1.340453, 1, 1, 1, 1, 1,
-0.7790362, -0.03284623, 0.2391158, 1, 1, 1, 1, 1,
-0.7750676, -1.222733, -1.891184, 1, 1, 1, 1, 1,
-0.772121, 0.6732385, 0.1405364, 1, 1, 1, 1, 1,
-0.772051, 1.311291, 0.3040056, 1, 1, 1, 1, 1,
-0.769462, -0.5092979, -1.448303, 1, 1, 1, 1, 1,
-0.7687687, -0.8124729, -2.159905, 1, 1, 1, 1, 1,
-0.7677212, 1.281924, -2.504188, 0, 0, 1, 1, 1,
-0.7675237, -0.4631411, -1.879388, 1, 0, 0, 1, 1,
-0.7653961, -1.262946, -2.138036, 1, 0, 0, 1, 1,
-0.7647671, -0.5734497, -4.038202, 1, 0, 0, 1, 1,
-0.7645119, -0.4342304, -2.480167, 1, 0, 0, 1, 1,
-0.7636333, 0.219696, -2.250736, 1, 0, 0, 1, 1,
-0.7635723, 0.6568126, -0.009654558, 0, 0, 0, 1, 1,
-0.7585284, -0.08910686, -1.647489, 0, 0, 0, 1, 1,
-0.7583356, 0.1425823, -1.490238, 0, 0, 0, 1, 1,
-0.7499298, -0.8118275, -2.113531, 0, 0, 0, 1, 1,
-0.7415137, -1.812245, -1.938446, 0, 0, 0, 1, 1,
-0.7409575, -1.238343, -1.926578, 0, 0, 0, 1, 1,
-0.7236501, 0.02884053, -3.039651, 0, 0, 0, 1, 1,
-0.7201074, 1.589364, -0.5209794, 1, 1, 1, 1, 1,
-0.7195958, -0.1867028, -2.271255, 1, 1, 1, 1, 1,
-0.7186174, 0.7159767, -0.3608322, 1, 1, 1, 1, 1,
-0.7182465, -0.7617694, -3.289649, 1, 1, 1, 1, 1,
-0.7160805, -0.8757312, -3.695275, 1, 1, 1, 1, 1,
-0.7129779, 0.7332677, 0.8185601, 1, 1, 1, 1, 1,
-0.7118838, -0.2386393, -1.577359, 1, 1, 1, 1, 1,
-0.7051494, 1.221618, -1.129269, 1, 1, 1, 1, 1,
-0.7038593, 0.2198176, 0.03963732, 1, 1, 1, 1, 1,
-0.7038584, 1.092847, -1.561046, 1, 1, 1, 1, 1,
-0.7017702, -0.07856794, -2.650969, 1, 1, 1, 1, 1,
-0.6986122, 0.9650601, -0.6861867, 1, 1, 1, 1, 1,
-0.6984217, -1.862348, -2.561654, 1, 1, 1, 1, 1,
-0.6925928, 1.469991, -0.03311813, 1, 1, 1, 1, 1,
-0.6914625, 1.381058, 1.087255, 1, 1, 1, 1, 1,
-0.6912822, 0.888921, -1.811817, 0, 0, 1, 1, 1,
-0.6887488, -1.897414, -3.812466, 1, 0, 0, 1, 1,
-0.6877976, -0.2194031, -2.077796, 1, 0, 0, 1, 1,
-0.68515, -0.7525548, -1.618405, 1, 0, 0, 1, 1,
-0.6803285, 0.9936133, -0.6650814, 1, 0, 0, 1, 1,
-0.6792135, 0.1074543, -1.241261, 1, 0, 0, 1, 1,
-0.6768416, -0.2465888, -2.501708, 0, 0, 0, 1, 1,
-0.6763968, -0.4302918, -0.2392992, 0, 0, 0, 1, 1,
-0.667362, -0.6806091, -2.530955, 0, 0, 0, 1, 1,
-0.6672278, 1.313985, -1.946724, 0, 0, 0, 1, 1,
-0.6649162, 0.8747131, -1.011361, 0, 0, 0, 1, 1,
-0.6623071, -0.6495089, -2.148544, 0, 0, 0, 1, 1,
-0.659864, 0.6502642, 2.033549, 0, 0, 0, 1, 1,
-0.6588339, -1.522262, -2.800972, 1, 1, 1, 1, 1,
-0.6542686, 0.1116293, -1.057755, 1, 1, 1, 1, 1,
-0.6536731, -1.227519, -2.049506, 1, 1, 1, 1, 1,
-0.6473882, 0.7202691, -0.5857353, 1, 1, 1, 1, 1,
-0.645234, -0.6634328, -1.935257, 1, 1, 1, 1, 1,
-0.6416603, -0.4028271, -1.481232, 1, 1, 1, 1, 1,
-0.6414075, -0.2568226, -1.458511, 1, 1, 1, 1, 1,
-0.6260803, 0.6447552, 0.03034346, 1, 1, 1, 1, 1,
-0.6211025, -0.4762653, -4.351469, 1, 1, 1, 1, 1,
-0.6188751, 0.3844038, -1.329521, 1, 1, 1, 1, 1,
-0.6161799, 0.3312966, -1.282209, 1, 1, 1, 1, 1,
-0.6157956, -1.553605, -2.779335, 1, 1, 1, 1, 1,
-0.6112918, 0.5625749, -2.065169, 1, 1, 1, 1, 1,
-0.6080885, -0.4599565, -1.85382, 1, 1, 1, 1, 1,
-0.6071079, 0.3807732, 1.262595, 1, 1, 1, 1, 1,
-0.6068268, -1.742022, -1.544345, 0, 0, 1, 1, 1,
-0.6050792, -0.04752038, -4.517429, 1, 0, 0, 1, 1,
-0.5957851, 1.689163, -0.3741531, 1, 0, 0, 1, 1,
-0.5915149, 0.4363591, -2.062007, 1, 0, 0, 1, 1,
-0.5893744, 1.546759, -0.9421482, 1, 0, 0, 1, 1,
-0.5851445, -0.2853092, -2.194046, 1, 0, 0, 1, 1,
-0.5834728, 0.6552616, 2.011719, 0, 0, 0, 1, 1,
-0.5796066, -1.518307, -3.351645, 0, 0, 0, 1, 1,
-0.5784774, -1.36353, -2.541861, 0, 0, 0, 1, 1,
-0.5773305, 0.2724301, -0.8282872, 0, 0, 0, 1, 1,
-0.5751804, -1.245979, -3.593065, 0, 0, 0, 1, 1,
-0.5699763, 1.695396, -0.4786809, 0, 0, 0, 1, 1,
-0.5664774, -1.08673, -3.852617, 0, 0, 0, 1, 1,
-0.5658872, 0.05976994, -1.051785, 1, 1, 1, 1, 1,
-0.5652796, 1.097968, 0.7141135, 1, 1, 1, 1, 1,
-0.5525324, -0.7344424, -2.300215, 1, 1, 1, 1, 1,
-0.5487887, 0.04279484, -1.331965, 1, 1, 1, 1, 1,
-0.546949, -1.5883, -2.406066, 1, 1, 1, 1, 1,
-0.5401108, 0.8906436, -0.5616606, 1, 1, 1, 1, 1,
-0.5372423, -0.6547946, -2.263308, 1, 1, 1, 1, 1,
-0.5326137, -1.25034, -3.751411, 1, 1, 1, 1, 1,
-0.5292274, 1.826713, 1.220514, 1, 1, 1, 1, 1,
-0.5273901, -0.4539322, -1.098544, 1, 1, 1, 1, 1,
-0.5186515, 1.443521, 0.2629465, 1, 1, 1, 1, 1,
-0.5159349, 0.8461553, -0.410799, 1, 1, 1, 1, 1,
-0.5131134, 1.615167, -0.763898, 1, 1, 1, 1, 1,
-0.5117428, 0.04131469, -2.80398, 1, 1, 1, 1, 1,
-0.5003282, -0.2245336, -2.459388, 1, 1, 1, 1, 1,
-0.499187, -0.3559778, -4.201114, 0, 0, 1, 1, 1,
-0.4988722, 0.3180283, 0.5135692, 1, 0, 0, 1, 1,
-0.4975188, -0.4069566, -3.402887, 1, 0, 0, 1, 1,
-0.4961968, 0.4797421, -1.122152, 1, 0, 0, 1, 1,
-0.4925891, -0.08065353, -2.412383, 1, 0, 0, 1, 1,
-0.4893608, -0.8303364, -2.439147, 1, 0, 0, 1, 1,
-0.4834158, 1.073117, -0.8326437, 0, 0, 0, 1, 1,
-0.480827, 0.4498981, -2.121155, 0, 0, 0, 1, 1,
-0.4734769, 1.286657, -2.151438, 0, 0, 0, 1, 1,
-0.4717152, -1.494298, -2.003105, 0, 0, 0, 1, 1,
-0.4701873, 0.8358397, -2.948636, 0, 0, 0, 1, 1,
-0.4690594, 0.8725277, -0.7944185, 0, 0, 0, 1, 1,
-0.4654607, 0.1595407, -1.294348, 0, 0, 0, 1, 1,
-0.4507209, 0.6791866, -0.4808364, 1, 1, 1, 1, 1,
-0.4492397, 0.5916858, -1.330009, 1, 1, 1, 1, 1,
-0.4462017, 2.52258, 0.3648027, 1, 1, 1, 1, 1,
-0.442237, 0.9247183, -0.5106316, 1, 1, 1, 1, 1,
-0.4386629, -0.5405834, 0.03107216, 1, 1, 1, 1, 1,
-0.4362321, 0.4345702, -1.902855, 1, 1, 1, 1, 1,
-0.4345565, 0.03284866, -0.6368734, 1, 1, 1, 1, 1,
-0.4334748, -0.6323953, -3.1014, 1, 1, 1, 1, 1,
-0.4300985, -1.041629, -4.002145, 1, 1, 1, 1, 1,
-0.4287888, -2.336029, -4.11596, 1, 1, 1, 1, 1,
-0.4249657, 0.4062244, 0.2408983, 1, 1, 1, 1, 1,
-0.4158071, -0.09101894, -3.187066, 1, 1, 1, 1, 1,
-0.4138144, -0.07947265, -2.226648, 1, 1, 1, 1, 1,
-0.4093582, -0.8449351, -3.087088, 1, 1, 1, 1, 1,
-0.4086803, -0.3789383, -2.799135, 1, 1, 1, 1, 1,
-0.4086123, -0.9146718, -2.105339, 0, 0, 1, 1, 1,
-0.4076706, -1.189499, -6.231512, 1, 0, 0, 1, 1,
-0.4023962, -0.6698804, -2.393723, 1, 0, 0, 1, 1,
-0.399942, -0.6101033, -5.400314, 1, 0, 0, 1, 1,
-0.3986565, 0.5567735, -2.467858, 1, 0, 0, 1, 1,
-0.3960143, -0.3010072, -3.375013, 1, 0, 0, 1, 1,
-0.3921555, -1.632264, -2.33293, 0, 0, 0, 1, 1,
-0.3908699, 0.06843291, -2.935329, 0, 0, 0, 1, 1,
-0.3906004, -1.173792, -2.109244, 0, 0, 0, 1, 1,
-0.3888622, -0.2709639, -2.355425, 0, 0, 0, 1, 1,
-0.3868994, 0.9678571, 0.3325067, 0, 0, 0, 1, 1,
-0.384881, -1.37057, -2.190763, 0, 0, 0, 1, 1,
-0.3847202, -1.425693, -3.325305, 0, 0, 0, 1, 1,
-0.3836841, 0.4081197, -2.718471, 1, 1, 1, 1, 1,
-0.3836332, 0.8615109, -0.4238613, 1, 1, 1, 1, 1,
-0.3786994, 1.535407, -1.727396, 1, 1, 1, 1, 1,
-0.3775996, 0.3591831, -0.2795739, 1, 1, 1, 1, 1,
-0.3773946, -0.06802332, -0.9560345, 1, 1, 1, 1, 1,
-0.3771143, 1.555596, 0.6237736, 1, 1, 1, 1, 1,
-0.3761067, 0.4562712, -0.8394146, 1, 1, 1, 1, 1,
-0.3748141, 0.3917663, 0.2336699, 1, 1, 1, 1, 1,
-0.372869, -0.2321577, -2.495385, 1, 1, 1, 1, 1,
-0.3692321, 1.21653, -0.05888221, 1, 1, 1, 1, 1,
-0.3682913, -1.747122, -2.08638, 1, 1, 1, 1, 1,
-0.3670639, 0.1439433, -0.6260452, 1, 1, 1, 1, 1,
-0.3655901, -0.5976508, -1.824568, 1, 1, 1, 1, 1,
-0.3631572, 0.8874906, -1.567469, 1, 1, 1, 1, 1,
-0.3626703, 0.3820229, -0.1931111, 1, 1, 1, 1, 1,
-0.3608067, 0.8069775, -2.781005, 0, 0, 1, 1, 1,
-0.3514879, 0.6280372, -1.162558, 1, 0, 0, 1, 1,
-0.3510019, 0.8145633, 0.6976997, 1, 0, 0, 1, 1,
-0.3509032, -0.4020255, -2.972937, 1, 0, 0, 1, 1,
-0.3508991, 2.043427, -0.6264813, 1, 0, 0, 1, 1,
-0.3507482, -1.623883, -2.456605, 1, 0, 0, 1, 1,
-0.345746, 0.7959645, -0.08502365, 0, 0, 0, 1, 1,
-0.343181, -1.340236, -1.804702, 0, 0, 0, 1, 1,
-0.3365931, -0.809091, -1.792528, 0, 0, 0, 1, 1,
-0.3355236, 1.194466, -1.887089, 0, 0, 0, 1, 1,
-0.3350362, 0.2925247, 0.6883181, 0, 0, 0, 1, 1,
-0.3344272, 1.603848, -0.7792529, 0, 0, 0, 1, 1,
-0.334309, 0.4454174, -0.4868018, 0, 0, 0, 1, 1,
-0.3337577, -0.4800759, -1.918947, 1, 1, 1, 1, 1,
-0.3285314, -0.1685524, -1.791499, 1, 1, 1, 1, 1,
-0.3253614, -0.8495818, -3.630016, 1, 1, 1, 1, 1,
-0.3252932, -0.4446087, -1.967216, 1, 1, 1, 1, 1,
-0.321254, 0.9948048, -0.9390214, 1, 1, 1, 1, 1,
-0.3198584, -1.276876, -3.511347, 1, 1, 1, 1, 1,
-0.3161071, -1.695163, -3.793123, 1, 1, 1, 1, 1,
-0.3117954, -0.2765361, -0.5655531, 1, 1, 1, 1, 1,
-0.3071262, 0.4903734, -0.5937514, 1, 1, 1, 1, 1,
-0.3047172, 0.7953368, 0.3721929, 1, 1, 1, 1, 1,
-0.3023467, 1.031284, 0.7884879, 1, 1, 1, 1, 1,
-0.3008415, -1.867353, -2.324052, 1, 1, 1, 1, 1,
-0.3001428, -0.1203217, -1.856573, 1, 1, 1, 1, 1,
-0.2982708, 0.3022599, 0.3084371, 1, 1, 1, 1, 1,
-0.2953318, -0.4308447, -1.871911, 1, 1, 1, 1, 1,
-0.2910392, 1.880792, 0.08940985, 0, 0, 1, 1, 1,
-0.2907695, -0.5819969, -3.45034, 1, 0, 0, 1, 1,
-0.2891734, -2.117676, -4.132513, 1, 0, 0, 1, 1,
-0.2887712, 0.7984042, -1.384016, 1, 0, 0, 1, 1,
-0.286923, 2.867594, 0.7820296, 1, 0, 0, 1, 1,
-0.2829142, 0.8437824, 0.4910865, 1, 0, 0, 1, 1,
-0.2805538, -0.9360757, -2.112574, 0, 0, 0, 1, 1,
-0.2784245, 0.4746878, -1.11823, 0, 0, 0, 1, 1,
-0.2686688, -0.3182991, -0.6159245, 0, 0, 0, 1, 1,
-0.2679365, -0.1332146, -1.134483, 0, 0, 0, 1, 1,
-0.2638696, -0.4473119, -4.116864, 0, 0, 0, 1, 1,
-0.2602745, -0.9977708, -2.433856, 0, 0, 0, 1, 1,
-0.2595142, 1.310769, 0.2890715, 0, 0, 0, 1, 1,
-0.251888, -1.172671, -3.157044, 1, 1, 1, 1, 1,
-0.243893, 0.5937312, -1.181835, 1, 1, 1, 1, 1,
-0.2414408, 0.09294345, -1.048337, 1, 1, 1, 1, 1,
-0.2399922, 0.8937614, -0.7433475, 1, 1, 1, 1, 1,
-0.23884, -0.9443021, -2.788241, 1, 1, 1, 1, 1,
-0.2380364, 1.469062, 0.1269659, 1, 1, 1, 1, 1,
-0.2344117, 1.704782, -0.6965784, 1, 1, 1, 1, 1,
-0.2343611, -0.2748212, -3.251247, 1, 1, 1, 1, 1,
-0.2341679, -1.206328, -2.658746, 1, 1, 1, 1, 1,
-0.2327389, 0.4527361, -0.4925393, 1, 1, 1, 1, 1,
-0.2292303, -1.457676, -3.513013, 1, 1, 1, 1, 1,
-0.228311, 0.6965444, 1.20859, 1, 1, 1, 1, 1,
-0.2220716, -0.7019486, -2.797891, 1, 1, 1, 1, 1,
-0.2158855, -0.205984, -1.495185, 1, 1, 1, 1, 1,
-0.2118482, -0.8838269, -3.324038, 1, 1, 1, 1, 1,
-0.2037428, -0.9380075, -3.557226, 0, 0, 1, 1, 1,
-0.1932488, 1.25816, -0.260772, 1, 0, 0, 1, 1,
-0.1896206, 0.6984773, -1.510305, 1, 0, 0, 1, 1,
-0.1887784, -0.6564426, -3.051193, 1, 0, 0, 1, 1,
-0.1835541, 1.351396, 0.3016546, 1, 0, 0, 1, 1,
-0.179542, -2.089128, -3.827916, 1, 0, 0, 1, 1,
-0.1773846, 0.510516, -1.007767, 0, 0, 0, 1, 1,
-0.1750099, -0.6430389, -2.625782, 0, 0, 0, 1, 1,
-0.1680131, -1.555115, -3.146613, 0, 0, 0, 1, 1,
-0.1652654, 0.8056492, -0.6207392, 0, 0, 0, 1, 1,
-0.160099, 0.5785775, -1.256217, 0, 0, 0, 1, 1,
-0.1578697, 0.6510023, -0.670298, 0, 0, 0, 1, 1,
-0.1573487, -0.06875996, -1.206339, 0, 0, 0, 1, 1,
-0.1555032, 1.862978, 0.51778, 1, 1, 1, 1, 1,
-0.1506413, 0.4157244, 0.08252744, 1, 1, 1, 1, 1,
-0.1428681, -0.6318544, -3.945264, 1, 1, 1, 1, 1,
-0.142703, 2.202137, -1.573388, 1, 1, 1, 1, 1,
-0.1378103, 1.727071, -1.654757, 1, 1, 1, 1, 1,
-0.1366288, -0.1036659, -3.179555, 1, 1, 1, 1, 1,
-0.1353376, -0.6804243, -1.802146, 1, 1, 1, 1, 1,
-0.1305869, -2.020111, -3.456805, 1, 1, 1, 1, 1,
-0.1198096, -1.58314, -3.526769, 1, 1, 1, 1, 1,
-0.1168518, 0.1726955, 0.4400463, 1, 1, 1, 1, 1,
-0.1152643, -0.8776801, -2.454688, 1, 1, 1, 1, 1,
-0.1127547, 0.3501455, -1.890738, 1, 1, 1, 1, 1,
-0.1111956, -0.4886259, -2.734169, 1, 1, 1, 1, 1,
-0.109439, 0.4179552, 0.6699871, 1, 1, 1, 1, 1,
-0.1059259, 2.71643, -0.0175103, 1, 1, 1, 1, 1,
-0.101803, -0.09475488, -1.775803, 0, 0, 1, 1, 1,
-0.09995887, 0.1035904, -2.629255, 1, 0, 0, 1, 1,
-0.09940525, -0.03343931, -1.98982, 1, 0, 0, 1, 1,
-0.09907135, 0.4071772, 0.7796664, 1, 0, 0, 1, 1,
-0.09757619, -2.222344, -3.704203, 1, 0, 0, 1, 1,
-0.09647913, -0.3829135, -5.373225, 1, 0, 0, 1, 1,
-0.09545019, -0.2820233, -2.199645, 0, 0, 0, 1, 1,
-0.09332302, -0.503107, -2.676042, 0, 0, 0, 1, 1,
-0.09220109, -1.088344, -2.222602, 0, 0, 0, 1, 1,
-0.084235, 1.383802, 0.3255553, 0, 0, 0, 1, 1,
-0.08359671, -0.1832793, -2.326178, 0, 0, 0, 1, 1,
-0.08212316, 1.679863, -1.02578, 0, 0, 0, 1, 1,
-0.08137187, -0.7638056, -3.901775, 0, 0, 0, 1, 1,
-0.07166511, 0.2774752, -1.086066, 1, 1, 1, 1, 1,
-0.06828611, 1.295795, 0.4770342, 1, 1, 1, 1, 1,
-0.0682817, -1.268294, -3.550098, 1, 1, 1, 1, 1,
-0.06826288, 1.202837, -0.8564749, 1, 1, 1, 1, 1,
-0.06765568, -2.243206, -2.60207, 1, 1, 1, 1, 1,
-0.06720325, 0.07264246, -1.334775, 1, 1, 1, 1, 1,
-0.06527259, 1.479892, -0.9357331, 1, 1, 1, 1, 1,
-0.06523122, 0.4521429, -0.0846305, 1, 1, 1, 1, 1,
-0.06175276, 0.5204653, 1.227809, 1, 1, 1, 1, 1,
-0.05368412, -1.397475, -4.687786, 1, 1, 1, 1, 1,
-0.05346094, -0.6136199, -2.524063, 1, 1, 1, 1, 1,
-0.04865031, -0.6125722, -3.627153, 1, 1, 1, 1, 1,
-0.04637357, 1.707282, 1.78775, 1, 1, 1, 1, 1,
-0.04378571, -1.558066, -2.813493, 1, 1, 1, 1, 1,
-0.04182655, -0.6946762, -1.199658, 1, 1, 1, 1, 1,
-0.041743, -1.007542, -3.06257, 0, 0, 1, 1, 1,
-0.04115345, -0.8858043, -4.375957, 1, 0, 0, 1, 1,
-0.03994896, 0.429177, -0.2756689, 1, 0, 0, 1, 1,
-0.03326312, 1.65414, -0.1649073, 1, 0, 0, 1, 1,
-0.03173165, -0.5586922, -3.727005, 1, 0, 0, 1, 1,
-0.03021791, -1.379876, -4.241861, 1, 0, 0, 1, 1,
-0.02887039, 1.240953, -0.8110595, 0, 0, 0, 1, 1,
-0.02849145, -0.9766673, -1.233016, 0, 0, 0, 1, 1,
-0.02519905, -0.2294317, -3.712873, 0, 0, 0, 1, 1,
-0.02314691, 0.1965884, 0.6792239, 0, 0, 0, 1, 1,
-0.02118967, -0.2626141, -3.785589, 0, 0, 0, 1, 1,
-0.01497225, -0.9681509, -2.424958, 0, 0, 0, 1, 1,
-0.01196724, 0.01238478, -0.8880844, 0, 0, 0, 1, 1,
-0.006927501, -0.01032928, -3.173199, 1, 1, 1, 1, 1,
-0.00638472, 0.7221057, -0.236736, 1, 1, 1, 1, 1,
-0.005679816, 0.5024648, -0.7799199, 1, 1, 1, 1, 1,
-0.005076618, 1.441658, 1.026989, 1, 1, 1, 1, 1,
-0.00342491, 1.176446, -0.04568389, 1, 1, 1, 1, 1,
-0.001749312, -0.1671579, -3.106985, 1, 1, 1, 1, 1,
0.003065649, 0.8624725, -0.6809006, 1, 1, 1, 1, 1,
0.008163204, 1.485292, -0.9011735, 1, 1, 1, 1, 1,
0.01228579, -0.4948262, 3.116021, 1, 1, 1, 1, 1,
0.01589836, 0.1194652, -0.02089658, 1, 1, 1, 1, 1,
0.02356654, 0.8331004, 0.4254025, 1, 1, 1, 1, 1,
0.02706663, -0.2450385, 4.055119, 1, 1, 1, 1, 1,
0.02929908, 0.2860154, -0.01423549, 1, 1, 1, 1, 1,
0.03198623, 0.08847412, 1.098974, 1, 1, 1, 1, 1,
0.03397067, -1.268486, 1.933884, 1, 1, 1, 1, 1,
0.03414357, -2.438362, 3.928998, 0, 0, 1, 1, 1,
0.03764438, 2.024587, 1.832653, 1, 0, 0, 1, 1,
0.03804799, 1.586041, 0.4502661, 1, 0, 0, 1, 1,
0.03913281, -0.6384261, 3.229686, 1, 0, 0, 1, 1,
0.03944905, 0.8699098, 0.3944334, 1, 0, 0, 1, 1,
0.03948478, -0.8445994, 0.7336043, 1, 0, 0, 1, 1,
0.04269694, -0.4437172, 5.056942, 0, 0, 0, 1, 1,
0.04688689, 0.5895094, 0.8927437, 0, 0, 0, 1, 1,
0.04734545, 1.235929, 0.4250363, 0, 0, 0, 1, 1,
0.05240667, -0.2167033, 1.462498, 0, 0, 0, 1, 1,
0.05322703, 2.043957, -0.6109349, 0, 0, 0, 1, 1,
0.05953538, 0.212034, 0.03312505, 0, 0, 0, 1, 1,
0.06103382, 1.197223, -2.06048, 0, 0, 0, 1, 1,
0.06260397, -0.2777097, 3.983018, 1, 1, 1, 1, 1,
0.06450422, 0.1671198, -0.307539, 1, 1, 1, 1, 1,
0.06501467, -0.5666099, 3.248335, 1, 1, 1, 1, 1,
0.06773949, -0.9503574, 3.503165, 1, 1, 1, 1, 1,
0.06817418, -1.536347, 2.74254, 1, 1, 1, 1, 1,
0.07044006, -0.8043602, 1.754435, 1, 1, 1, 1, 1,
0.07526821, 1.24869, 2.052194, 1, 1, 1, 1, 1,
0.07608017, -1.409554, 5.166282, 1, 1, 1, 1, 1,
0.08218677, -0.3635028, 1.619323, 1, 1, 1, 1, 1,
0.08449508, -1.136395, 3.179621, 1, 1, 1, 1, 1,
0.08950149, 0.7761392, -0.5327291, 1, 1, 1, 1, 1,
0.09150188, -0.5487857, 1.593467, 1, 1, 1, 1, 1,
0.09533147, 0.5404816, 0.7035053, 1, 1, 1, 1, 1,
0.09731148, 1.243343, 1.382905, 1, 1, 1, 1, 1,
0.09863209, -1.444265, 4.989173, 1, 1, 1, 1, 1,
0.09945586, 1.339688, 0.9733452, 0, 0, 1, 1, 1,
0.1016519, 0.2297717, 0.876737, 1, 0, 0, 1, 1,
0.1053828, 1.084445, -1.045041, 1, 0, 0, 1, 1,
0.1071775, -0.1574248, 2.654472, 1, 0, 0, 1, 1,
0.1096224, -0.5722997, 1.644365, 1, 0, 0, 1, 1,
0.1098369, -1.164257, 1.375659, 1, 0, 0, 1, 1,
0.1133338, 1.606711, -1.148989, 0, 0, 0, 1, 1,
0.114696, -0.1789171, 4.797994, 0, 0, 0, 1, 1,
0.1163053, -1.044463, 1.434318, 0, 0, 0, 1, 1,
0.1170709, 0.1798455, -1.377572, 0, 0, 0, 1, 1,
0.118038, -0.0650997, 1.688135, 0, 0, 0, 1, 1,
0.1198023, 0.3080688, -0.2560443, 0, 0, 0, 1, 1,
0.1223484, -0.560983, 2.126873, 0, 0, 0, 1, 1,
0.1227745, -0.9251387, 1.839942, 1, 1, 1, 1, 1,
0.1282241, -1.792786, 3.453861, 1, 1, 1, 1, 1,
0.1283211, -0.3771904, 1.544296, 1, 1, 1, 1, 1,
0.1292439, -0.6587902, 2.645277, 1, 1, 1, 1, 1,
0.1298533, 0.4226349, -1.064695, 1, 1, 1, 1, 1,
0.1311511, -0.1472088, 0.8661938, 1, 1, 1, 1, 1,
0.1323075, 0.2603908, -0.3832977, 1, 1, 1, 1, 1,
0.1336336, 0.5817685, 0.7008032, 1, 1, 1, 1, 1,
0.1347618, -0.4633981, 1.248727, 1, 1, 1, 1, 1,
0.1375728, -0.2465502, 2.98641, 1, 1, 1, 1, 1,
0.1401195, 0.03122152, 1.593137, 1, 1, 1, 1, 1,
0.1419099, -1.195343, 3.24514, 1, 1, 1, 1, 1,
0.142387, 0.4210029, 1.814976, 1, 1, 1, 1, 1,
0.1430005, -0.7050896, 3.924014, 1, 1, 1, 1, 1,
0.1498358, -1.691705, 5.085367, 1, 1, 1, 1, 1,
0.1507327, -1.326139, 3.841627, 0, 0, 1, 1, 1,
0.150813, -1.075925, 3.06116, 1, 0, 0, 1, 1,
0.151867, 0.8048764, 0.1699079, 1, 0, 0, 1, 1,
0.1580885, 2.002297, 0.1805708, 1, 0, 0, 1, 1,
0.1586903, 0.5814227, 1.50322, 1, 0, 0, 1, 1,
0.1590777, 0.6774471, 0.141342, 1, 0, 0, 1, 1,
0.1674973, -0.4102521, 5.214412, 0, 0, 0, 1, 1,
0.1807222, -0.8027601, 3.743876, 0, 0, 0, 1, 1,
0.1834249, -0.1838882, 3.144615, 0, 0, 0, 1, 1,
0.1849944, 2.279865, 0.6528494, 0, 0, 0, 1, 1,
0.1857061, -0.9579666, 2.809006, 0, 0, 0, 1, 1,
0.1858529, -1.1943, 2.754994, 0, 0, 0, 1, 1,
0.1890549, 0.4651915, 0.8682439, 0, 0, 0, 1, 1,
0.1899796, -1.611195, 3.236784, 1, 1, 1, 1, 1,
0.1901488, 1.1299, -0.03025191, 1, 1, 1, 1, 1,
0.1915926, 0.9451202, 1.28077, 1, 1, 1, 1, 1,
0.1917088, -0.9136501, 1.448447, 1, 1, 1, 1, 1,
0.1936162, -0.246186, 3.039182, 1, 1, 1, 1, 1,
0.1948238, -0.5666782, 2.742512, 1, 1, 1, 1, 1,
0.1977973, 0.6938103, -1.5944, 1, 1, 1, 1, 1,
0.200343, 0.1505784, 0.3335454, 1, 1, 1, 1, 1,
0.2016425, 0.7370055, 1.149032, 1, 1, 1, 1, 1,
0.2020158, -0.5705342, 3.641139, 1, 1, 1, 1, 1,
0.2028322, 0.6523958, 1.250486, 1, 1, 1, 1, 1,
0.203159, 0.5015662, 1.480531, 1, 1, 1, 1, 1,
0.207909, -0.6693219, 3.541889, 1, 1, 1, 1, 1,
0.2090064, -1.564669, 4.263789, 1, 1, 1, 1, 1,
0.2203214, -0.5607971, 3.887265, 1, 1, 1, 1, 1,
0.2222392, -0.6576127, 3.59722, 0, 0, 1, 1, 1,
0.2292509, -1.131517, 3.905321, 1, 0, 0, 1, 1,
0.2329976, 0.2460854, 1.045785, 1, 0, 0, 1, 1,
0.2336369, 0.7580205, 0.3196178, 1, 0, 0, 1, 1,
0.2346895, -1.545023, 3.216306, 1, 0, 0, 1, 1,
0.2360813, 0.1322836, 1.244015, 1, 0, 0, 1, 1,
0.2362325, 0.1457581, 1.146509, 0, 0, 0, 1, 1,
0.2391282, 0.4403337, 1.391346, 0, 0, 0, 1, 1,
0.2407496, -0.604642, 1.253148, 0, 0, 0, 1, 1,
0.2469373, 0.9938423, 0.8695676, 0, 0, 0, 1, 1,
0.2527641, 0.8572245, -1.453189, 0, 0, 0, 1, 1,
0.2560809, -0.02386768, 0.2122233, 0, 0, 0, 1, 1,
0.2562081, 0.2004007, -0.3083628, 0, 0, 0, 1, 1,
0.2580341, -1.02156, 3.899158, 1, 1, 1, 1, 1,
0.2582071, 1.372109, 0.6969085, 1, 1, 1, 1, 1,
0.2599645, 1.816606, -0.2804382, 1, 1, 1, 1, 1,
0.2600249, -0.1280568, 0.7973275, 1, 1, 1, 1, 1,
0.2608476, -1.392689, 2.289096, 1, 1, 1, 1, 1,
0.2654227, 1.981236, 1.426476, 1, 1, 1, 1, 1,
0.2691284, 1.313368, -0.1039262, 1, 1, 1, 1, 1,
0.2703514, -1.286827, 4.078043, 1, 1, 1, 1, 1,
0.2752931, 0.3850487, 0.8180052, 1, 1, 1, 1, 1,
0.2778069, -0.9655437, 3.360129, 1, 1, 1, 1, 1,
0.2830627, 1.627427, 0.850007, 1, 1, 1, 1, 1,
0.2888815, -0.9299203, 1.680098, 1, 1, 1, 1, 1,
0.2901107, 1.353088, -0.5919253, 1, 1, 1, 1, 1,
0.2988442, -2.272249, 2.769304, 1, 1, 1, 1, 1,
0.2991309, -0.03610493, 0.7513567, 1, 1, 1, 1, 1,
0.3024229, 0.4542933, -0.8828086, 0, 0, 1, 1, 1,
0.303558, 0.8876456, 0.587457, 1, 0, 0, 1, 1,
0.3085142, -0.3886185, 1.876986, 1, 0, 0, 1, 1,
0.3089771, 0.03933331, 0.758307, 1, 0, 0, 1, 1,
0.3103504, 0.6280454, 0.3317268, 1, 0, 0, 1, 1,
0.3104354, 0.1457123, 1.565776, 1, 0, 0, 1, 1,
0.3119851, 0.7094789, 1.880706, 0, 0, 0, 1, 1,
0.3119905, 1.052803, 0.8197542, 0, 0, 0, 1, 1,
0.3157726, 0.7880692, -0.7652059, 0, 0, 0, 1, 1,
0.315821, 0.1129897, 0.770867, 0, 0, 0, 1, 1,
0.3164795, -0.175303, 1.390399, 0, 0, 0, 1, 1,
0.3267725, -0.1769383, 1.911214, 0, 0, 0, 1, 1,
0.3345696, 2.091438, 1.602248, 0, 0, 0, 1, 1,
0.3352365, 0.2895717, -0.4515692, 1, 1, 1, 1, 1,
0.337579, -1.002851, 3.165015, 1, 1, 1, 1, 1,
0.3377688, 0.1141206, -0.2520436, 1, 1, 1, 1, 1,
0.3378149, 1.083414, 1.556396, 1, 1, 1, 1, 1,
0.3395483, -2.040877, 3.726114, 1, 1, 1, 1, 1,
0.3422893, -1.118573, 2.26112, 1, 1, 1, 1, 1,
0.3431425, -1.523296, 2.6368, 1, 1, 1, 1, 1,
0.3481177, 0.2364277, 1.108444, 1, 1, 1, 1, 1,
0.3527491, 0.7861659, -0.7303655, 1, 1, 1, 1, 1,
0.3529404, -0.8771091, 2.122012, 1, 1, 1, 1, 1,
0.35308, -0.4141466, 1.346894, 1, 1, 1, 1, 1,
0.3561179, 0.6716545, 0.02460081, 1, 1, 1, 1, 1,
0.3576243, -1.940181, 3.978762, 1, 1, 1, 1, 1,
0.3596546, 0.03535309, 2.565589, 1, 1, 1, 1, 1,
0.3596836, 0.4708857, 0.555364, 1, 1, 1, 1, 1,
0.3616377, -1.352049, 4.073925, 0, 0, 1, 1, 1,
0.363336, 1.935842, 0.813939, 1, 0, 0, 1, 1,
0.3669505, 0.6957951, 1.78102, 1, 0, 0, 1, 1,
0.3727342, 0.9360241, 0.8371431, 1, 0, 0, 1, 1,
0.3743783, 0.1701513, 0.803901, 1, 0, 0, 1, 1,
0.376968, -0.1742622, 3.173945, 1, 0, 0, 1, 1,
0.3789269, -1.384667, 1.664535, 0, 0, 0, 1, 1,
0.3817118, -1.167531, 3.94834, 0, 0, 0, 1, 1,
0.3829726, 1.267203, 0.6443695, 0, 0, 0, 1, 1,
0.3836814, -1.332853, 2.424272, 0, 0, 0, 1, 1,
0.3894939, 0.1849209, 0.3428643, 0, 0, 0, 1, 1,
0.3963914, -0.5739554, 0.6189699, 0, 0, 0, 1, 1,
0.3974703, 0.6820807, 0.8666522, 0, 0, 0, 1, 1,
0.3996186, 0.4518504, 0.4216958, 1, 1, 1, 1, 1,
0.4011856, -0.8974649, 2.596518, 1, 1, 1, 1, 1,
0.4025147, -1.936157, 1.282171, 1, 1, 1, 1, 1,
0.4051222, 0.3534994, 1.529374, 1, 1, 1, 1, 1,
0.4065168, 0.4607022, 2.303676, 1, 1, 1, 1, 1,
0.412961, 0.2370311, 1.076995, 1, 1, 1, 1, 1,
0.4208691, -0.9525945, 4.572595, 1, 1, 1, 1, 1,
0.4224141, -0.4856374, 1.763057, 1, 1, 1, 1, 1,
0.4293835, 0.7398517, 0.9331049, 1, 1, 1, 1, 1,
0.4297836, -1.315661, 3.163985, 1, 1, 1, 1, 1,
0.435633, -0.4610123, 2.413374, 1, 1, 1, 1, 1,
0.4495702, 0.5321567, 0.7158215, 1, 1, 1, 1, 1,
0.4569836, 0.5638413, 0.6239519, 1, 1, 1, 1, 1,
0.457831, 0.3406492, 1.673271, 1, 1, 1, 1, 1,
0.4586445, -1.624749, 2.576301, 1, 1, 1, 1, 1,
0.4638662, -0.4220221, 1.877975, 0, 0, 1, 1, 1,
0.4644969, 1.115918, 3.323725, 1, 0, 0, 1, 1,
0.4655105, -0.8047882, 4.089959, 1, 0, 0, 1, 1,
0.4676971, -0.694263, 3.662397, 1, 0, 0, 1, 1,
0.4680246, -0.2533396, 2.502863, 1, 0, 0, 1, 1,
0.4697511, 0.5817641, -0.3123957, 1, 0, 0, 1, 1,
0.4703805, -0.2422421, 1.739359, 0, 0, 0, 1, 1,
0.4778884, -0.3387838, 2.125364, 0, 0, 0, 1, 1,
0.4821392, 0.2077974, -0.1490048, 0, 0, 0, 1, 1,
0.4877683, -0.3781985, 1.867264, 0, 0, 0, 1, 1,
0.4878304, -2.135839, 4.245259, 0, 0, 0, 1, 1,
0.4882167, 0.579905, 0.1703241, 0, 0, 0, 1, 1,
0.4883382, 0.8447154, 0.8108412, 0, 0, 0, 1, 1,
0.4926261, -0.849692, 2.459473, 1, 1, 1, 1, 1,
0.4978013, 0.4015622, 0.4167463, 1, 1, 1, 1, 1,
0.5002925, -0.4941623, 3.824925, 1, 1, 1, 1, 1,
0.5030997, 1.25691, 1.71961, 1, 1, 1, 1, 1,
0.509305, -2.39395, 1.504727, 1, 1, 1, 1, 1,
0.5102592, 0.1084009, 0.6199729, 1, 1, 1, 1, 1,
0.517399, 1.799422, 0.9741591, 1, 1, 1, 1, 1,
0.5188017, -0.9477952, 2.554114, 1, 1, 1, 1, 1,
0.5204243, 1.677019, -0.2961165, 1, 1, 1, 1, 1,
0.5218525, 0.5023425, 0.5768042, 1, 1, 1, 1, 1,
0.5270981, -0.3780489, 1.439713, 1, 1, 1, 1, 1,
0.5328796, 0.650331, 1.178663, 1, 1, 1, 1, 1,
0.5369285, 0.82924, -0.5136152, 1, 1, 1, 1, 1,
0.5397846, 0.2909895, 2.148808, 1, 1, 1, 1, 1,
0.54217, -2.218461, 4.568749, 1, 1, 1, 1, 1,
0.5425667, -0.1080396, 1.074709, 0, 0, 1, 1, 1,
0.5532838, -0.4317059, 2.767477, 1, 0, 0, 1, 1,
0.5550517, -0.5249779, 2.756728, 1, 0, 0, 1, 1,
0.5554975, 0.2777762, 0.09743257, 1, 0, 0, 1, 1,
0.5561703, -0.3177855, 3.871155, 1, 0, 0, 1, 1,
0.5569687, -1.496131, 2.273279, 1, 0, 0, 1, 1,
0.5578158, 0.3216759, 1.85452, 0, 0, 0, 1, 1,
0.5586832, 2.069569, 1.270883, 0, 0, 0, 1, 1,
0.559021, 0.4728395, 0.3139372, 0, 0, 0, 1, 1,
0.5602329, 0.2777963, 1.451045, 0, 0, 0, 1, 1,
0.5639965, 1.283884, -0.6529388, 0, 0, 0, 1, 1,
0.5666288, 1.498797, 0.5661094, 0, 0, 0, 1, 1,
0.5672045, -0.6265799, 2.943528, 0, 0, 0, 1, 1,
0.5718038, 0.2513066, 1.211608, 1, 1, 1, 1, 1,
0.5718449, 0.8521044, -0.006077615, 1, 1, 1, 1, 1,
0.5727509, -0.3192124, 1.830986, 1, 1, 1, 1, 1,
0.5803251, -0.0730492, 2.498152, 1, 1, 1, 1, 1,
0.580925, -0.7763174, 1.154141, 1, 1, 1, 1, 1,
0.5910617, -0.4738894, 2.553432, 1, 1, 1, 1, 1,
0.5949817, 0.8761718, -0.07979567, 1, 1, 1, 1, 1,
0.5966418, 1.337962, 0.8122653, 1, 1, 1, 1, 1,
0.5996869, 0.04936766, 0.1033872, 1, 1, 1, 1, 1,
0.6007579, -1.700884, 0.8231782, 1, 1, 1, 1, 1,
0.6031981, 0.4119538, 0.3201466, 1, 1, 1, 1, 1,
0.6063262, -0.04055369, 3.203335, 1, 1, 1, 1, 1,
0.6071817, 1.271576, 0.6743426, 1, 1, 1, 1, 1,
0.6124586, 0.8003162, 1.628466, 1, 1, 1, 1, 1,
0.6140936, 0.6157795, 1.57739, 1, 1, 1, 1, 1,
0.6158618, 0.8279048, -0.7900339, 0, 0, 1, 1, 1,
0.6185378, 1.660947, -0.3193361, 1, 0, 0, 1, 1,
0.6202284, -0.2410983, 2.328545, 1, 0, 0, 1, 1,
0.6214843, 0.2527935, 1.893291, 1, 0, 0, 1, 1,
0.6223616, 0.9344317, 0.8007748, 1, 0, 0, 1, 1,
0.6243654, 0.2295343, 1.772206, 1, 0, 0, 1, 1,
0.6288657, -0.894388, 2.109614, 0, 0, 0, 1, 1,
0.630865, -0.5858056, 4.053334, 0, 0, 0, 1, 1,
0.6337864, -0.07736079, 0.2152243, 0, 0, 0, 1, 1,
0.63546, 0.1833755, 0.3436289, 0, 0, 0, 1, 1,
0.638048, 0.9938272, 0.797667, 0, 0, 0, 1, 1,
0.6420037, -0.6053757, 2.760009, 0, 0, 0, 1, 1,
0.6482765, 0.2457577, 1.271276, 0, 0, 0, 1, 1,
0.6508887, -1.977092, 3.617733, 1, 1, 1, 1, 1,
0.6557427, -0.40692, 0.2119177, 1, 1, 1, 1, 1,
0.6567684, 2.488698, -0.5597979, 1, 1, 1, 1, 1,
0.6622909, 0.1062962, 0.9217208, 1, 1, 1, 1, 1,
0.6675186, 2.317599, -0.3055646, 1, 1, 1, 1, 1,
0.6717757, 0.5498663, 0.1544247, 1, 1, 1, 1, 1,
0.6787738, -1.302189, 2.656237, 1, 1, 1, 1, 1,
0.6805226, 0.3226309, 0.1579797, 1, 1, 1, 1, 1,
0.6812813, 1.0325, 2.375581, 1, 1, 1, 1, 1,
0.6845784, 0.4609044, 2.732779, 1, 1, 1, 1, 1,
0.6859232, 0.6699033, -0.9093502, 1, 1, 1, 1, 1,
0.693426, -1.052488, 1.119896, 1, 1, 1, 1, 1,
0.6951903, -1.384934, 2.377508, 1, 1, 1, 1, 1,
0.6993768, -1.027764, 3.118377, 1, 1, 1, 1, 1,
0.7061874, -1.573424, 1.958482, 1, 1, 1, 1, 1,
0.7069691, 0.7084058, 1.251917, 0, 0, 1, 1, 1,
0.7077401, 1.317312, -0.7619411, 1, 0, 0, 1, 1,
0.7084319, -0.5596026, 2.681838, 1, 0, 0, 1, 1,
0.710418, 1.44194, 1.299345, 1, 0, 0, 1, 1,
0.7115117, 0.4983761, -0.3707126, 1, 0, 0, 1, 1,
0.7117527, -0.231346, 1.10477, 1, 0, 0, 1, 1,
0.7167168, 0.3621736, 3.355975, 0, 0, 0, 1, 1,
0.7182723, -0.7013362, 2.385169, 0, 0, 0, 1, 1,
0.7203402, 1.510506, 0.9436629, 0, 0, 0, 1, 1,
0.7234852, 0.3826974, -0.02002352, 0, 0, 0, 1, 1,
0.7245937, 0.4649398, 0.605974, 0, 0, 0, 1, 1,
0.7254702, -1.314751, 3.086446, 0, 0, 0, 1, 1,
0.729749, -0.0185306, 1.981233, 0, 0, 0, 1, 1,
0.7324978, -1.732901, 4.323987, 1, 1, 1, 1, 1,
0.7336892, 0.9470783, 0.6257037, 1, 1, 1, 1, 1,
0.7361529, 0.5585199, 3.462075, 1, 1, 1, 1, 1,
0.7364193, 0.564374, 0.6445767, 1, 1, 1, 1, 1,
0.741564, 1.508614, 0.8536223, 1, 1, 1, 1, 1,
0.7457561, 1.683282, 2.126709, 1, 1, 1, 1, 1,
0.7564816, -1.060913, 3.690045, 1, 1, 1, 1, 1,
0.7602727, -0.1597175, 0.9507684, 1, 1, 1, 1, 1,
0.7622916, -1.336611, 1.37645, 1, 1, 1, 1, 1,
0.7685418, -0.7757759, 1.994255, 1, 1, 1, 1, 1,
0.7812172, -0.4782647, 1.783853, 1, 1, 1, 1, 1,
0.7828283, -0.6729349, 2.572116, 1, 1, 1, 1, 1,
0.7848762, -1.355357, 1.548746, 1, 1, 1, 1, 1,
0.795619, 1.356544, 2.216586, 1, 1, 1, 1, 1,
0.8007205, -0.05643377, -0.4911077, 1, 1, 1, 1, 1,
0.8071539, 2.804663, -0.477903, 0, 0, 1, 1, 1,
0.8129685, 0.9439557, 1.320369, 1, 0, 0, 1, 1,
0.8358514, 0.4377639, 1.496289, 1, 0, 0, 1, 1,
0.8378736, 0.710219, 2.178242, 1, 0, 0, 1, 1,
0.8388556, -0.4309011, 1.221882, 1, 0, 0, 1, 1,
0.847959, 0.2218246, 0.2012756, 1, 0, 0, 1, 1,
0.8546848, -0.1048216, 0.9473412, 0, 0, 0, 1, 1,
0.8547308, 0.7890083, 0.8625309, 0, 0, 0, 1, 1,
0.8592793, -0.6740977, 2.761719, 0, 0, 0, 1, 1,
0.8606966, 0.01391989, 3.460346, 0, 0, 0, 1, 1,
0.8622484, 0.01264702, 1.544197, 0, 0, 0, 1, 1,
0.8680758, -1.575154, 2.630293, 0, 0, 0, 1, 1,
0.8710139, -0.1926385, 1.518429, 0, 0, 0, 1, 1,
0.8873542, -0.6738593, 3.004763, 1, 1, 1, 1, 1,
0.8874684, -0.2076128, 0.9565527, 1, 1, 1, 1, 1,
0.8881281, 0.5632125, -0.5672594, 1, 1, 1, 1, 1,
0.8883465, 1.041012, -0.6713439, 1, 1, 1, 1, 1,
0.8936304, -0.4355446, 2.408428, 1, 1, 1, 1, 1,
0.8951979, 0.2611021, 2.908998, 1, 1, 1, 1, 1,
0.8962215, 0.008423238, 0.9913838, 1, 1, 1, 1, 1,
0.897458, -0.7438048, 4.708557, 1, 1, 1, 1, 1,
0.9014431, -0.4016372, 1.168692, 1, 1, 1, 1, 1,
0.903701, -2.493644, 1.619752, 1, 1, 1, 1, 1,
0.9049962, -0.8671957, 2.105002, 1, 1, 1, 1, 1,
0.9056647, 1.420554, 0.090555, 1, 1, 1, 1, 1,
0.9108209, -0.2037712, 2.013778, 1, 1, 1, 1, 1,
0.9119313, -0.3802912, 2.752091, 1, 1, 1, 1, 1,
0.9141243, 1.034388, -0.5326138, 1, 1, 1, 1, 1,
0.9253057, 0.6666405, 0.5169274, 0, 0, 1, 1, 1,
0.9301551, 0.2409512, 1.578711, 1, 0, 0, 1, 1,
0.931247, -0.7224451, 1.051541, 1, 0, 0, 1, 1,
0.9316465, 0.1748887, 2.867521, 1, 0, 0, 1, 1,
0.9322225, -0.9846199, 2.341817, 1, 0, 0, 1, 1,
0.9323949, 0.6324139, 1.930602, 1, 0, 0, 1, 1,
0.9341394, 0.4321377, 0.08881818, 0, 0, 0, 1, 1,
0.9345921, -1.97449, 2.65614, 0, 0, 0, 1, 1,
0.9363364, 1.464086, 0.05652658, 0, 0, 0, 1, 1,
0.9401991, -0.9595803, 1.143285, 0, 0, 0, 1, 1,
0.9424923, 0.02783294, 1.77091, 0, 0, 0, 1, 1,
0.9425849, 1.007954, 0.2973285, 0, 0, 0, 1, 1,
0.945389, 1.520957, 0.6396217, 0, 0, 0, 1, 1,
0.9480414, 0.7482648, 1.086245, 1, 1, 1, 1, 1,
0.9491085, -1.030378, 1.853158, 1, 1, 1, 1, 1,
0.957132, -0.9148824, 1.033092, 1, 1, 1, 1, 1,
0.9613767, -0.6181772, 2.604882, 1, 1, 1, 1, 1,
0.9633386, 1.252011, 0.1693855, 1, 1, 1, 1, 1,
0.9638507, -0.6142102, 2.788675, 1, 1, 1, 1, 1,
0.9670168, 0.09487664, 2.626633, 1, 1, 1, 1, 1,
0.9730481, 0.2812622, 2.904907, 1, 1, 1, 1, 1,
0.9851508, -0.5325631, 3.406718, 1, 1, 1, 1, 1,
0.9884304, 1.357617, -0.2580928, 1, 1, 1, 1, 1,
0.9892144, 0.02549453, 0.4363576, 1, 1, 1, 1, 1,
0.9892794, 0.5192816, 0.3961164, 1, 1, 1, 1, 1,
0.9895223, -0.971936, 3.161249, 1, 1, 1, 1, 1,
0.9970054, -0.3369705, 2.042476, 1, 1, 1, 1, 1,
0.9979197, -0.9958252, 1.307716, 1, 1, 1, 1, 1,
1.0065, -0.8861523, 2.674717, 0, 0, 1, 1, 1,
1.010752, -1.448062, 1.85609, 1, 0, 0, 1, 1,
1.016152, -1.775081, 1.350637, 1, 0, 0, 1, 1,
1.023177, -1.392645, 3.947363, 1, 0, 0, 1, 1,
1.0257, -1.345436, 2.882975, 1, 0, 0, 1, 1,
1.030466, 1.031138, 2.225334, 1, 0, 0, 1, 1,
1.031862, 0.446723, 0.5426345, 0, 0, 0, 1, 1,
1.034942, -0.4098607, 2.432243, 0, 0, 0, 1, 1,
1.041716, 1.614648, 1.512669, 0, 0, 0, 1, 1,
1.042261, 0.1835604, 1.591097, 0, 0, 0, 1, 1,
1.051033, 0.2184384, 3.652725, 0, 0, 0, 1, 1,
1.055234, -0.6929681, 0.9514391, 0, 0, 0, 1, 1,
1.056231, 0.6599165, -0.2582332, 0, 0, 0, 1, 1,
1.058998, 0.5518044, 1.044423, 1, 1, 1, 1, 1,
1.061481, 1.50161, 0.4778525, 1, 1, 1, 1, 1,
1.074185, -0.8897768, 2.143218, 1, 1, 1, 1, 1,
1.075462, -0.6290609, 2.298825, 1, 1, 1, 1, 1,
1.07693, 0.3282355, 1.772784, 1, 1, 1, 1, 1,
1.07975, 1.190921, -0.1648277, 1, 1, 1, 1, 1,
1.080257, 0.8057601, 1.623379, 1, 1, 1, 1, 1,
1.082208, -0.5203387, 0.178259, 1, 1, 1, 1, 1,
1.086485, 1.11974, 0.6623141, 1, 1, 1, 1, 1,
1.087869, 1.09154, 1.559116, 1, 1, 1, 1, 1,
1.092963, 1.548835, -0.4494938, 1, 1, 1, 1, 1,
1.093241, 0.008493667, 3.171713, 1, 1, 1, 1, 1,
1.096365, 0.1142447, 1.595229, 1, 1, 1, 1, 1,
1.09911, 1.018222, -1.323672, 1, 1, 1, 1, 1,
1.11539, -1.468267, 2.995291, 1, 1, 1, 1, 1,
1.123762, -0.2562584, 1.926794, 0, 0, 1, 1, 1,
1.123905, -0.5430369, 3.21925, 1, 0, 0, 1, 1,
1.128368, -0.3259278, 1.144094, 1, 0, 0, 1, 1,
1.131777, 0.1315488, 0.7712126, 1, 0, 0, 1, 1,
1.134548, 1.430754, 1.760522, 1, 0, 0, 1, 1,
1.149376, -0.4637945, 1.266452, 1, 0, 0, 1, 1,
1.14948, -1.963994, 3.326432, 0, 0, 0, 1, 1,
1.150045, -1.310499, 1.474835, 0, 0, 0, 1, 1,
1.151373, -1.183982, 2.986304, 0, 0, 0, 1, 1,
1.152468, 1.073655, 0.4258087, 0, 0, 0, 1, 1,
1.176481, 0.1404189, 2.197356, 0, 0, 0, 1, 1,
1.188584, -2.2378, 4.346601, 0, 0, 0, 1, 1,
1.188708, -0.9238226, 4.140636, 0, 0, 0, 1, 1,
1.195691, -1.59886, 3.548343, 1, 1, 1, 1, 1,
1.195767, 1.602044, 1.992752, 1, 1, 1, 1, 1,
1.199172, 0.03927638, 1.43667, 1, 1, 1, 1, 1,
1.204366, 0.7885826, 0.9657121, 1, 1, 1, 1, 1,
1.219086, -0.1355018, 2.172272, 1, 1, 1, 1, 1,
1.223207, -0.5307835, 3.199098, 1, 1, 1, 1, 1,
1.232482, 0.07909691, 2.544555, 1, 1, 1, 1, 1,
1.234563, -1.119917, 1.131904, 1, 1, 1, 1, 1,
1.259601, -0.07568063, 0.5727226, 1, 1, 1, 1, 1,
1.262966, 0.321748, 1.162302, 1, 1, 1, 1, 1,
1.264325, 0.9998896, 1.523824, 1, 1, 1, 1, 1,
1.277363, 0.8820261, 1.178306, 1, 1, 1, 1, 1,
1.283846, -0.2071867, 1.380046, 1, 1, 1, 1, 1,
1.284361, 0.04354025, 1.617626, 1, 1, 1, 1, 1,
1.290537, 1.846182, 0.2826506, 1, 1, 1, 1, 1,
1.298589, 0.5975695, 0.2838453, 0, 0, 1, 1, 1,
1.306497, -1.438801, 1.75249, 1, 0, 0, 1, 1,
1.317169, 0.339027, 1.65018, 1, 0, 0, 1, 1,
1.334752, 2.262882, 0.2973171, 1, 0, 0, 1, 1,
1.336782, -0.8299497, 2.531179, 1, 0, 0, 1, 1,
1.341851, 0.9096861, 0.2236845, 1, 0, 0, 1, 1,
1.345936, 0.9688979, 2.006541, 0, 0, 0, 1, 1,
1.348027, -1.625511, 4.906377, 0, 0, 0, 1, 1,
1.350051, -1.271622, 2.238025, 0, 0, 0, 1, 1,
1.353356, 1.547486, 2.322989, 0, 0, 0, 1, 1,
1.387396, 0.5692027, -0.476406, 0, 0, 0, 1, 1,
1.389055, -1.427075, 1.351527, 0, 0, 0, 1, 1,
1.391369, -1.378136, 1.622292, 0, 0, 0, 1, 1,
1.393876, -0.463086, 2.102581, 1, 1, 1, 1, 1,
1.406176, 0.1172425, 2.174645, 1, 1, 1, 1, 1,
1.418216, 0.6566429, -0.8183715, 1, 1, 1, 1, 1,
1.426754, -0.8223845, 2.04454, 1, 1, 1, 1, 1,
1.43016, -0.8719549, 1.769757, 1, 1, 1, 1, 1,
1.431733, -0.8778268, 1.753587, 1, 1, 1, 1, 1,
1.436458, 1.014912, 2.583439, 1, 1, 1, 1, 1,
1.453346, -0.7396989, 1.657115, 1, 1, 1, 1, 1,
1.461051, 1.741883, -1.101389, 1, 1, 1, 1, 1,
1.46194, -1.650783, 3.813083, 1, 1, 1, 1, 1,
1.463344, 1.175645, 1.38617, 1, 1, 1, 1, 1,
1.467716, 0.2126702, 1.568012, 1, 1, 1, 1, 1,
1.473124, 0.2958584, 1.498028, 1, 1, 1, 1, 1,
1.476283, -1.428009, 2.197927, 1, 1, 1, 1, 1,
1.478161, -0.475485, 2.936254, 1, 1, 1, 1, 1,
1.487402, 0.03472384, 1.891775, 0, 0, 1, 1, 1,
1.521921, 0.1853607, 1.183025, 1, 0, 0, 1, 1,
1.566893, -0.8734124, 1.854022, 1, 0, 0, 1, 1,
1.568915, 1.802819, -0.4728433, 1, 0, 0, 1, 1,
1.575375, -1.31989, 3.99811, 1, 0, 0, 1, 1,
1.586568, -1.49011, 1.838113, 1, 0, 0, 1, 1,
1.592671, 1.097369, 2.151542, 0, 0, 0, 1, 1,
1.621658, -0.4725451, 1.974209, 0, 0, 0, 1, 1,
1.622322, 3.116275, 0.5913538, 0, 0, 0, 1, 1,
1.623801, -0.1210069, 2.58674, 0, 0, 0, 1, 1,
1.628247, 0.5926787, 2.232401, 0, 0, 0, 1, 1,
1.631708, 0.2234318, 1.396096, 0, 0, 0, 1, 1,
1.636572, -1.57601, 2.92095, 0, 0, 0, 1, 1,
1.639074, 2.14102, 1.607579, 1, 1, 1, 1, 1,
1.64432, 0.4547529, 0.5278088, 1, 1, 1, 1, 1,
1.654767, -1.969067, 2.518415, 1, 1, 1, 1, 1,
1.665261, 1.039098, -0.0122359, 1, 1, 1, 1, 1,
1.674436, 0.08457279, 1.188137, 1, 1, 1, 1, 1,
1.708049, 1.267337, 2.315152, 1, 1, 1, 1, 1,
1.765805, 1.604168, 2.401864, 1, 1, 1, 1, 1,
1.770481, 1.088956, 0.6335315, 1, 1, 1, 1, 1,
1.820651, 1.112443, 2.931103, 1, 1, 1, 1, 1,
1.833678, 0.858907, 1.438667, 1, 1, 1, 1, 1,
1.852879, -1.097037, 1.612314, 1, 1, 1, 1, 1,
1.864371, 0.6575577, 1.178832, 1, 1, 1, 1, 1,
1.875955, -0.9606484, 2.029178, 1, 1, 1, 1, 1,
1.907256, -0.862622, -0.3164094, 1, 1, 1, 1, 1,
1.924275, 1.135979, 1.72209, 1, 1, 1, 1, 1,
1.961239, 0.3394413, 1.740172, 0, 0, 1, 1, 1,
1.977461, 0.3873416, -0.08307874, 1, 0, 0, 1, 1,
1.982492, -0.8095098, 2.425682, 1, 0, 0, 1, 1,
2.008636, 0.4338951, 2.186316, 1, 0, 0, 1, 1,
2.013737, -0.9448745, 0.7876254, 1, 0, 0, 1, 1,
2.02189, 1.05961, 1.624478, 1, 0, 0, 1, 1,
2.075379, 1.98065, 2.264047, 0, 0, 0, 1, 1,
2.085789, 0.7567743, -0.2712217, 0, 0, 0, 1, 1,
2.090492, -1.01063, 1.598095, 0, 0, 0, 1, 1,
2.101247, 0.3070749, 1.04658, 0, 0, 0, 1, 1,
2.234378, -0.2311987, 2.299948, 0, 0, 0, 1, 1,
2.263736, -0.3403025, 1.862075, 0, 0, 0, 1, 1,
2.306142, -0.4216165, 1.016218, 0, 0, 0, 1, 1,
2.355386, -1.598342, 1.965749, 1, 1, 1, 1, 1,
2.580921, 0.1103658, 1.986029, 1, 1, 1, 1, 1,
2.707137, 0.2520167, 0.3535199, 1, 1, 1, 1, 1,
2.938248, 0.7854659, -0.09252982, 1, 1, 1, 1, 1,
3.093679, 1.079129, 1.259112, 1, 1, 1, 1, 1,
3.810226, -0.8368437, 0.8640979, 1, 1, 1, 1, 1,
4.011357, 1.89595, 1.928095, 1, 1, 1, 1, 1
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
var radius = 10.05967;
var distance = 35.33418;
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
mvMatrix.translate( -0.3148606, -0.07254815, 0.5085499 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.33418);
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
