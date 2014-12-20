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
-3.295176, -0.129159, -1.583031, 1, 0, 0, 1,
-3.07462, 0.1371922, -1.779261, 1, 0.007843138, 0, 1,
-2.82195, 1.071589, -0.2457629, 1, 0.01176471, 0, 1,
-2.764841, 0.8678558, 0.115459, 1, 0.01960784, 0, 1,
-2.762025, -0.6700894, 0.4409952, 1, 0.02352941, 0, 1,
-2.746369, -0.8303751, -1.504276, 1, 0.03137255, 0, 1,
-2.684884, -0.7861456, -2.791654, 1, 0.03529412, 0, 1,
-2.632236, 1.747405, -0.8750404, 1, 0.04313726, 0, 1,
-2.334257, 0.3560618, -0.1146399, 1, 0.04705882, 0, 1,
-2.299422, -0.2589819, -1.730395, 1, 0.05490196, 0, 1,
-2.184469, -1.126867, -0.6132606, 1, 0.05882353, 0, 1,
-2.165862, 1.726908, -2.888166, 1, 0.06666667, 0, 1,
-2.105195, -1.384008, -2.083406, 1, 0.07058824, 0, 1,
-2.103298, -0.2662948, -2.110009, 1, 0.07843138, 0, 1,
-2.096082, 1.088866, -0.7386324, 1, 0.08235294, 0, 1,
-2.092592, -1.219557, -4.646188, 1, 0.09019608, 0, 1,
-2.052769, 0.2274024, -3.851144, 1, 0.09411765, 0, 1,
-2.043381, -0.5017909, -0.276497, 1, 0.1019608, 0, 1,
-2.010594, -1.401431, -2.505412, 1, 0.1098039, 0, 1,
-1.995386, 0.2591655, -1.873395, 1, 0.1137255, 0, 1,
-1.973414, 0.4479016, -0.3721037, 1, 0.1215686, 0, 1,
-1.957356, -0.9229471, -2.309062, 1, 0.1254902, 0, 1,
-1.932298, 0.5778903, -0.7318434, 1, 0.1333333, 0, 1,
-1.927589, -0.0637348, -1.927908, 1, 0.1372549, 0, 1,
-1.897204, -0.1738345, -0.406177, 1, 0.145098, 0, 1,
-1.887531, -1.188366, -2.051076, 1, 0.1490196, 0, 1,
-1.868723, -0.1262315, -2.400151, 1, 0.1568628, 0, 1,
-1.865035, 1.403374, 0.4837338, 1, 0.1607843, 0, 1,
-1.861909, -0.7877508, -1.900179, 1, 0.1686275, 0, 1,
-1.857423, -0.825403, -1.213722, 1, 0.172549, 0, 1,
-1.854958, 2.488312, -0.3622153, 1, 0.1803922, 0, 1,
-1.852775, 0.1571636, -3.007832, 1, 0.1843137, 0, 1,
-1.832497, 0.9158976, -1.779112, 1, 0.1921569, 0, 1,
-1.818889, 1.014419, -0.4081902, 1, 0.1960784, 0, 1,
-1.79712, -1.154391, -2.893511, 1, 0.2039216, 0, 1,
-1.790115, -0.1283875, -0.4727279, 1, 0.2117647, 0, 1,
-1.788255, -0.6134132, -2.098885, 1, 0.2156863, 0, 1,
-1.787096, -0.8590618, -0.4919505, 1, 0.2235294, 0, 1,
-1.777284, -1.012961, -4.26757, 1, 0.227451, 0, 1,
-1.776384, -1.359478, -1.092087, 1, 0.2352941, 0, 1,
-1.763908, 0.3594192, -0.2916147, 1, 0.2392157, 0, 1,
-1.749986, 1.212549, -1.610284, 1, 0.2470588, 0, 1,
-1.739383, 1.681769, -2.638574, 1, 0.2509804, 0, 1,
-1.738742, 0.3337294, -2.156804, 1, 0.2588235, 0, 1,
-1.736373, -0.1904171, -2.709297, 1, 0.2627451, 0, 1,
-1.735759, -1.230568, -2.610999, 1, 0.2705882, 0, 1,
-1.732232, -0.6149563, -3.279311, 1, 0.2745098, 0, 1,
-1.725785, -0.1562951, -0.01600546, 1, 0.282353, 0, 1,
-1.706616, -0.1726359, -2.122413, 1, 0.2862745, 0, 1,
-1.677591, 0.7036701, -2.167404, 1, 0.2941177, 0, 1,
-1.675961, 0.2777115, -1.445308, 1, 0.3019608, 0, 1,
-1.671152, -0.2130725, -2.194915, 1, 0.3058824, 0, 1,
-1.655917, -0.5382987, -3.2584, 1, 0.3137255, 0, 1,
-1.639313, 1.371272, -1.082362, 1, 0.3176471, 0, 1,
-1.627139, 0.5286217, -1.08563, 1, 0.3254902, 0, 1,
-1.607165, 0.7501889, -0.4254552, 1, 0.3294118, 0, 1,
-1.591464, -0.2865789, -3.49773, 1, 0.3372549, 0, 1,
-1.579236, 0.6956237, 0.05840868, 1, 0.3411765, 0, 1,
-1.56586, -0.5384725, -2.644558, 1, 0.3490196, 0, 1,
-1.553247, -0.3046676, -0.208003, 1, 0.3529412, 0, 1,
-1.551592, 0.3621517, -0.6057361, 1, 0.3607843, 0, 1,
-1.548774, -0.9465275, -3.132727, 1, 0.3647059, 0, 1,
-1.548593, -1.685837, -2.908369, 1, 0.372549, 0, 1,
-1.540542, -0.8355323, -3.384141, 1, 0.3764706, 0, 1,
-1.531646, 1.234573, -1.070271, 1, 0.3843137, 0, 1,
-1.525861, -1.213916, -1.08542, 1, 0.3882353, 0, 1,
-1.52179, 0.8947805, -0.5188281, 1, 0.3960784, 0, 1,
-1.516874, 0.8006671, -1.118637, 1, 0.4039216, 0, 1,
-1.500135, -0.8724972, -2.024966, 1, 0.4078431, 0, 1,
-1.495395, -0.8109407, -2.142959, 1, 0.4156863, 0, 1,
-1.48865, -0.1207636, 0.3674645, 1, 0.4196078, 0, 1,
-1.486734, 0.3729799, -0.2287422, 1, 0.427451, 0, 1,
-1.481347, -1.342473, -1.841579, 1, 0.4313726, 0, 1,
-1.480262, 1.936389, 0.3660387, 1, 0.4392157, 0, 1,
-1.475462, -0.7669706, -3.023274, 1, 0.4431373, 0, 1,
-1.473711, -1.62671, -1.416625, 1, 0.4509804, 0, 1,
-1.469548, -0.4488917, -1.441494, 1, 0.454902, 0, 1,
-1.446033, 0.0516839, -1.820907, 1, 0.4627451, 0, 1,
-1.438383, -0.1883195, -3.343537, 1, 0.4666667, 0, 1,
-1.426437, -1.284813, -1.906111, 1, 0.4745098, 0, 1,
-1.418281, 0.8628583, -0.9032328, 1, 0.4784314, 0, 1,
-1.417819, 1.528493, 0.5660578, 1, 0.4862745, 0, 1,
-1.39471, -0.6696399, -0.5397947, 1, 0.4901961, 0, 1,
-1.382065, -0.5970197, -1.912005, 1, 0.4980392, 0, 1,
-1.379899, 0.02372621, -2.882086, 1, 0.5058824, 0, 1,
-1.378084, 1.063392, -1.06985, 1, 0.509804, 0, 1,
-1.337914, 2.064958, 0.3965859, 1, 0.5176471, 0, 1,
-1.334339, -0.4029413, -3.348915, 1, 0.5215687, 0, 1,
-1.322786, -0.575092, -0.7214451, 1, 0.5294118, 0, 1,
-1.317791, -0.7335409, -1.575956, 1, 0.5333334, 0, 1,
-1.312486, -0.7084402, -0.9646407, 1, 0.5411765, 0, 1,
-1.311597, 1.822029, -2.392573, 1, 0.5450981, 0, 1,
-1.308908, -0.5330475, -2.0126, 1, 0.5529412, 0, 1,
-1.305032, 0.6305973, -1.375403, 1, 0.5568628, 0, 1,
-1.304972, -0.8989468, -1.805532, 1, 0.5647059, 0, 1,
-1.304158, -0.3147226, -2.595586, 1, 0.5686275, 0, 1,
-1.298835, -0.01140663, -0.04222351, 1, 0.5764706, 0, 1,
-1.278722, -0.6145751, -2.267587, 1, 0.5803922, 0, 1,
-1.270515, 0.3169461, 0.3223457, 1, 0.5882353, 0, 1,
-1.265818, -0.2063485, -2.048855, 1, 0.5921569, 0, 1,
-1.265374, 1.240073, -0.2841041, 1, 0.6, 0, 1,
-1.264313, 0.7504814, -1.40219, 1, 0.6078432, 0, 1,
-1.262697, 0.2403979, -2.66965, 1, 0.6117647, 0, 1,
-1.256864, -1.030177, -3.651089, 1, 0.6196079, 0, 1,
-1.25252, 0.9387768, -2.782861, 1, 0.6235294, 0, 1,
-1.235913, -1.815907, -1.696044, 1, 0.6313726, 0, 1,
-1.234412, -0.8711154, -1.559822, 1, 0.6352941, 0, 1,
-1.229233, 1.540684, 0.5661606, 1, 0.6431373, 0, 1,
-1.226361, -0.1735284, -0.7231582, 1, 0.6470588, 0, 1,
-1.222171, -0.3750306, -0.9713615, 1, 0.654902, 0, 1,
-1.215899, -0.8233403, -4.299312, 1, 0.6588235, 0, 1,
-1.215695, -0.3484533, -0.6545898, 1, 0.6666667, 0, 1,
-1.21487, -1.269893, -4.190256, 1, 0.6705883, 0, 1,
-1.214665, -1.409658, -4.136383, 1, 0.6784314, 0, 1,
-1.212737, -0.2621918, -0.2502931, 1, 0.682353, 0, 1,
-1.201027, 0.1676541, -2.053136, 1, 0.6901961, 0, 1,
-1.200638, 1.903403, -0.6387981, 1, 0.6941177, 0, 1,
-1.193332, -1.332112, -4.191014, 1, 0.7019608, 0, 1,
-1.177671, -0.7014071, -1.905974, 1, 0.7098039, 0, 1,
-1.17487, 1.057831, -0.3006827, 1, 0.7137255, 0, 1,
-1.162127, -0.01400776, -3.230604, 1, 0.7215686, 0, 1,
-1.1601, -1.291252, -2.707627, 1, 0.7254902, 0, 1,
-1.15432, -1.434877, -1.858275, 1, 0.7333333, 0, 1,
-1.152788, 0.2626927, -0.9021805, 1, 0.7372549, 0, 1,
-1.150325, 1.246148, -2.531365, 1, 0.7450981, 0, 1,
-1.149007, 1.041857, 2.417884, 1, 0.7490196, 0, 1,
-1.147113, -1.953552, -2.998672, 1, 0.7568628, 0, 1,
-1.145926, -0.6073077, -0.9945349, 1, 0.7607843, 0, 1,
-1.14026, 1.581367, -0.8333058, 1, 0.7686275, 0, 1,
-1.1385, 0.4042847, -1.626053, 1, 0.772549, 0, 1,
-1.137886, 1.2872, -0.6215132, 1, 0.7803922, 0, 1,
-1.137092, 0.6396285, -0.8170183, 1, 0.7843137, 0, 1,
-1.124004, -0.1842925, -1.575799, 1, 0.7921569, 0, 1,
-1.121707, -0.3014746, -3.845892, 1, 0.7960784, 0, 1,
-1.113238, -0.7143437, -2.555689, 1, 0.8039216, 0, 1,
-1.112994, 0.3214063, -0.8150644, 1, 0.8117647, 0, 1,
-1.106686, -0.3753428, -1.918442, 1, 0.8156863, 0, 1,
-1.105357, -1.239074, -2.554671, 1, 0.8235294, 0, 1,
-1.102822, -1.190218, -2.356564, 1, 0.827451, 0, 1,
-1.102264, -0.7977341, -1.21653, 1, 0.8352941, 0, 1,
-1.096226, 0.1274799, -1.728064, 1, 0.8392157, 0, 1,
-1.096209, -0.2367425, -3.224717, 1, 0.8470588, 0, 1,
-1.094954, -0.6214817, -3.321275, 1, 0.8509804, 0, 1,
-1.094311, -0.5926309, -2.551013, 1, 0.8588235, 0, 1,
-1.091911, -1.19295, -3.41359, 1, 0.8627451, 0, 1,
-1.091217, -0.799159, -1.926453, 1, 0.8705882, 0, 1,
-1.087977, -0.6933506, -1.531799, 1, 0.8745098, 0, 1,
-1.08342, 0.6490901, -1.545755, 1, 0.8823529, 0, 1,
-1.077377, 0.9273897, 0.07845014, 1, 0.8862745, 0, 1,
-1.067382, 1.212172, -0.07228515, 1, 0.8941177, 0, 1,
-1.056693, -0.7996674, -2.487201, 1, 0.8980392, 0, 1,
-1.05462, 0.9590709, 1.515902, 1, 0.9058824, 0, 1,
-1.046821, -0.5143878, -1.586021, 1, 0.9137255, 0, 1,
-1.044296, 0.70546, -1.64434, 1, 0.9176471, 0, 1,
-1.041776, -0.1710599, -1.958271, 1, 0.9254902, 0, 1,
-1.039083, -1.154242, -3.868743, 1, 0.9294118, 0, 1,
-1.038917, -1.585023, -4.190012, 1, 0.9372549, 0, 1,
-1.017456, 0.7793664, -2.413409, 1, 0.9411765, 0, 1,
-1.012331, 0.006457444, -0.9406828, 1, 0.9490196, 0, 1,
-1.00535, -1.918199, -2.316595, 1, 0.9529412, 0, 1,
-1.002141, 1.415781, 0.03496105, 1, 0.9607843, 0, 1,
-0.9858556, 0.5525005, -0.7997317, 1, 0.9647059, 0, 1,
-0.9812742, 0.8671046, -2.636613, 1, 0.972549, 0, 1,
-0.9751266, 1.626455, 0.643628, 1, 0.9764706, 0, 1,
-0.9736555, 0.1082597, -2.049111, 1, 0.9843137, 0, 1,
-0.9709815, 0.9031149, -1.430108, 1, 0.9882353, 0, 1,
-0.9666352, -1.929561, -3.461134, 1, 0.9960784, 0, 1,
-0.9646012, 0.9481663, 0.1072088, 0.9960784, 1, 0, 1,
-0.9578574, -0.7699223, -0.7484397, 0.9921569, 1, 0, 1,
-0.9577385, -0.1184925, -1.432207, 0.9843137, 1, 0, 1,
-0.9548166, -0.8522395, -1.744023, 0.9803922, 1, 0, 1,
-0.9450252, -0.5906214, -1.684757, 0.972549, 1, 0, 1,
-0.9432465, -0.4642099, -0.2015433, 0.9686275, 1, 0, 1,
-0.9421312, -0.2853892, -1.814794, 0.9607843, 1, 0, 1,
-0.9404434, -0.8867782, -3.246008, 0.9568627, 1, 0, 1,
-0.937169, -1.119892, -2.076802, 0.9490196, 1, 0, 1,
-0.9322409, -1.210169, -1.573087, 0.945098, 1, 0, 1,
-0.9232664, 1.702085, -0.9206979, 0.9372549, 1, 0, 1,
-0.9201568, -0.1336609, -0.161547, 0.9333333, 1, 0, 1,
-0.9196015, -0.09328085, -3.680413, 0.9254902, 1, 0, 1,
-0.9173018, 0.6483056, -0.5926958, 0.9215686, 1, 0, 1,
-0.9113622, 0.5432387, -1.361565, 0.9137255, 1, 0, 1,
-0.907176, 0.1194935, -1.712477, 0.9098039, 1, 0, 1,
-0.9061089, -1.103431, -1.548949, 0.9019608, 1, 0, 1,
-0.9031686, 0.1762799, -0.8268981, 0.8941177, 1, 0, 1,
-0.9004853, -0.6373477, -0.4108205, 0.8901961, 1, 0, 1,
-0.899088, -0.2651685, -0.9089428, 0.8823529, 1, 0, 1,
-0.8973131, 0.8844554, 0.3786181, 0.8784314, 1, 0, 1,
-0.8956984, 0.03969587, -1.348171, 0.8705882, 1, 0, 1,
-0.8853419, -0.4800225, -2.282521, 0.8666667, 1, 0, 1,
-0.8844392, -0.09595311, -1.621531, 0.8588235, 1, 0, 1,
-0.8815516, -1.532162, -2.331541, 0.854902, 1, 0, 1,
-0.8804395, 0.9768045, 0.6452479, 0.8470588, 1, 0, 1,
-0.8757237, 0.2082568, -1.339852, 0.8431373, 1, 0, 1,
-0.872709, -0.8698048, -2.306772, 0.8352941, 1, 0, 1,
-0.8700747, 1.294519, -1.383849, 0.8313726, 1, 0, 1,
-0.8682101, 1.022056, 0.06490865, 0.8235294, 1, 0, 1,
-0.8671556, 0.9320646, -0.3901567, 0.8196079, 1, 0, 1,
-0.8625273, 0.3295172, -0.3700121, 0.8117647, 1, 0, 1,
-0.8620421, 0.8192329, -0.3464167, 0.8078431, 1, 0, 1,
-0.8605999, 0.0818046, -0.6441091, 0.8, 1, 0, 1,
-0.8604183, 1.673076, 0.6991725, 0.7921569, 1, 0, 1,
-0.858284, -0.9196801, -2.094006, 0.7882353, 1, 0, 1,
-0.8529954, -1.256222, -0.348997, 0.7803922, 1, 0, 1,
-0.8524409, 0.7016823, -0.9836149, 0.7764706, 1, 0, 1,
-0.8522494, -0.05493848, -2.179135, 0.7686275, 1, 0, 1,
-0.8497316, 0.575839, 0.4906975, 0.7647059, 1, 0, 1,
-0.8476031, -0.9917343, -3.63576, 0.7568628, 1, 0, 1,
-0.8465056, 0.03592611, -0.9871321, 0.7529412, 1, 0, 1,
-0.8452383, -0.1708795, -2.790813, 0.7450981, 1, 0, 1,
-0.8435525, 0.4243005, -1.132533, 0.7411765, 1, 0, 1,
-0.8417231, 0.9488254, -0.1914752, 0.7333333, 1, 0, 1,
-0.8414533, -0.909207, -4.742062, 0.7294118, 1, 0, 1,
-0.8306087, 0.3260053, -1.618787, 0.7215686, 1, 0, 1,
-0.8294633, -0.1195696, -0.6516232, 0.7176471, 1, 0, 1,
-0.8246469, 0.2466598, -0.8759741, 0.7098039, 1, 0, 1,
-0.8220167, 1.196139, -0.1704072, 0.7058824, 1, 0, 1,
-0.8216339, -0.1783433, -1.978231, 0.6980392, 1, 0, 1,
-0.8178058, -0.1614953, -2.660875, 0.6901961, 1, 0, 1,
-0.8143735, 1.310414, -1.536392, 0.6862745, 1, 0, 1,
-0.8120915, 0.7834409, -1.838907, 0.6784314, 1, 0, 1,
-0.8116919, 1.614116, 0.4014525, 0.6745098, 1, 0, 1,
-0.8114742, 1.206638, -0.8957856, 0.6666667, 1, 0, 1,
-0.8097744, 1.328385, -0.4780999, 0.6627451, 1, 0, 1,
-0.8075044, -1.042263, -3.050526, 0.654902, 1, 0, 1,
-0.7978432, -1.281245, -1.498482, 0.6509804, 1, 0, 1,
-0.7943988, -0.1696655, -1.959616, 0.6431373, 1, 0, 1,
-0.789314, -0.3633503, -1.141201, 0.6392157, 1, 0, 1,
-0.7741725, 1.011156, 0.8894895, 0.6313726, 1, 0, 1,
-0.7715169, 0.3619182, -1.892182, 0.627451, 1, 0, 1,
-0.7671615, 1.808688, -2.163952, 0.6196079, 1, 0, 1,
-0.7664607, 1.452826, 1.287931, 0.6156863, 1, 0, 1,
-0.7656757, 0.4536117, -2.708172, 0.6078432, 1, 0, 1,
-0.7532648, -0.7238008, -3.617247, 0.6039216, 1, 0, 1,
-0.7463378, 0.2291119, -0.724938, 0.5960785, 1, 0, 1,
-0.7436877, -0.4061693, -3.287056, 0.5882353, 1, 0, 1,
-0.7325323, 0.5642102, -2.819648, 0.5843138, 1, 0, 1,
-0.7313483, 0.3307602, -2.660745, 0.5764706, 1, 0, 1,
-0.7283809, 0.005022341, 0.519494, 0.572549, 1, 0, 1,
-0.7273192, 0.3683876, -1.491902, 0.5647059, 1, 0, 1,
-0.7234346, -1.09048, -1.071943, 0.5607843, 1, 0, 1,
-0.7214938, -0.9675811, -4.429885, 0.5529412, 1, 0, 1,
-0.7205086, -1.001697, -3.326069, 0.5490196, 1, 0, 1,
-0.7137769, -0.9423493, -0.976805, 0.5411765, 1, 0, 1,
-0.7134228, -1.157102, -3.200975, 0.5372549, 1, 0, 1,
-0.7092494, 0.3125643, -1.98224, 0.5294118, 1, 0, 1,
-0.7070876, -0.7809982, -1.695295, 0.5254902, 1, 0, 1,
-0.7065918, 1.145921, 1.327631, 0.5176471, 1, 0, 1,
-0.7009444, -0.7730031, -2.290255, 0.5137255, 1, 0, 1,
-0.7008199, 0.1577778, -1.070395, 0.5058824, 1, 0, 1,
-0.6990954, 0.4018051, -2.023414, 0.5019608, 1, 0, 1,
-0.6972552, -1.123621, -2.724404, 0.4941176, 1, 0, 1,
-0.6937531, -0.9074878, -2.018885, 0.4862745, 1, 0, 1,
-0.6901964, -1.296757, -1.431444, 0.4823529, 1, 0, 1,
-0.6863585, -0.1433543, -1.771679, 0.4745098, 1, 0, 1,
-0.6856151, -1.557872, -5.311497, 0.4705882, 1, 0, 1,
-0.6829734, 0.5065171, -0.0906835, 0.4627451, 1, 0, 1,
-0.6820732, 0.137379, -1.888001, 0.4588235, 1, 0, 1,
-0.6806089, -0.05838439, -0.8274938, 0.4509804, 1, 0, 1,
-0.676524, 0.4193973, -0.948328, 0.4470588, 1, 0, 1,
-0.6687243, 2.287117, -1.075383, 0.4392157, 1, 0, 1,
-0.6584114, 0.9399291, 0.6873828, 0.4352941, 1, 0, 1,
-0.6573887, 1.059641, -0.7044029, 0.427451, 1, 0, 1,
-0.6514925, 0.2345993, -0.4068092, 0.4235294, 1, 0, 1,
-0.6510738, 0.8870816, -0.03140196, 0.4156863, 1, 0, 1,
-0.6509855, -0.3205152, -2.233495, 0.4117647, 1, 0, 1,
-0.6487712, -0.903482, -3.026187, 0.4039216, 1, 0, 1,
-0.6384369, -1.194546, -1.515023, 0.3960784, 1, 0, 1,
-0.6382628, 0.2520757, -1.064773, 0.3921569, 1, 0, 1,
-0.637637, -0.7717991, -2.614086, 0.3843137, 1, 0, 1,
-0.6306576, 0.1188122, -2.384283, 0.3803922, 1, 0, 1,
-0.6272857, -0.1865463, -0.8957884, 0.372549, 1, 0, 1,
-0.6237133, 0.6229934, 0.333764, 0.3686275, 1, 0, 1,
-0.6236804, -0.8402542, -3.513853, 0.3607843, 1, 0, 1,
-0.6215872, 0.9253197, -0.5747656, 0.3568628, 1, 0, 1,
-0.6202784, 1.288267, 1.92688, 0.3490196, 1, 0, 1,
-0.6195984, -1.201888, -3.07507, 0.345098, 1, 0, 1,
-0.6195307, -0.200321, -2.010889, 0.3372549, 1, 0, 1,
-0.6194761, -1.324774, 0.3500733, 0.3333333, 1, 0, 1,
-0.6180803, 0.3481047, -1.260031, 0.3254902, 1, 0, 1,
-0.614782, 0.2820457, -0.8716578, 0.3215686, 1, 0, 1,
-0.6036674, -0.200199, -1.45638, 0.3137255, 1, 0, 1,
-0.5983147, -0.8595313, -3.567839, 0.3098039, 1, 0, 1,
-0.5922709, -0.9667403, -3.616739, 0.3019608, 1, 0, 1,
-0.5812317, 0.5576445, -0.3221892, 0.2941177, 1, 0, 1,
-0.5790738, 1.029031, -1.732231, 0.2901961, 1, 0, 1,
-0.5781367, 0.4749133, -2.535905, 0.282353, 1, 0, 1,
-0.571689, 0.8986005, 0.5221494, 0.2784314, 1, 0, 1,
-0.5703194, -0.2275821, -2.794139, 0.2705882, 1, 0, 1,
-0.5680346, 0.6620654, -0.2709593, 0.2666667, 1, 0, 1,
-0.561699, -0.7152792, -2.220608, 0.2588235, 1, 0, 1,
-0.5527124, 1.269795, -1.302381, 0.254902, 1, 0, 1,
-0.5521113, 0.06306902, -3.205187, 0.2470588, 1, 0, 1,
-0.5516335, -0.8226717, -1.884404, 0.2431373, 1, 0, 1,
-0.5501162, -1.755112, -2.338746, 0.2352941, 1, 0, 1,
-0.5496093, -1.555959, -1.772475, 0.2313726, 1, 0, 1,
-0.5485781, 2.085388, -1.478994, 0.2235294, 1, 0, 1,
-0.5455173, -1.79854, -3.672388, 0.2196078, 1, 0, 1,
-0.5447661, -0.2436082, -1.478172, 0.2117647, 1, 0, 1,
-0.5375473, 0.4850257, -0.2476196, 0.2078431, 1, 0, 1,
-0.5369202, -0.3557535, -3.050991, 0.2, 1, 0, 1,
-0.5352886, -0.9931238, -1.824966, 0.1921569, 1, 0, 1,
-0.5335153, 1.375108, -1.20693, 0.1882353, 1, 0, 1,
-0.5252779, -1.168796, -3.710507, 0.1803922, 1, 0, 1,
-0.5235478, -1.26327, -2.473301, 0.1764706, 1, 0, 1,
-0.5193428, 0.2834934, -1.660281, 0.1686275, 1, 0, 1,
-0.5182335, 1.102809, -0.6278076, 0.1647059, 1, 0, 1,
-0.5181351, 1.719628, -0.3133534, 0.1568628, 1, 0, 1,
-0.5161613, -1.144988, -2.278419, 0.1529412, 1, 0, 1,
-0.5140387, 0.1353609, -2.015146, 0.145098, 1, 0, 1,
-0.509399, -0.2746129, -2.26898, 0.1411765, 1, 0, 1,
-0.5070885, -1.304443, -2.514356, 0.1333333, 1, 0, 1,
-0.5061798, -1.778315, -2.451684, 0.1294118, 1, 0, 1,
-0.5029165, 1.358145, -1.958997, 0.1215686, 1, 0, 1,
-0.4996901, -1.327841, -2.473501, 0.1176471, 1, 0, 1,
-0.4979597, -1.020607, -3.141318, 0.1098039, 1, 0, 1,
-0.4965642, 0.7060434, -1.21664, 0.1058824, 1, 0, 1,
-0.4960696, 0.872333, -0.05866225, 0.09803922, 1, 0, 1,
-0.4950129, -0.2465868, -1.636667, 0.09019608, 1, 0, 1,
-0.4941105, 0.6585366, 1.307069, 0.08627451, 1, 0, 1,
-0.4846016, 0.2531038, -2.706523, 0.07843138, 1, 0, 1,
-0.4828219, -1.352629, -2.999543, 0.07450981, 1, 0, 1,
-0.4802881, 0.4854734, -1.031783, 0.06666667, 1, 0, 1,
-0.479065, -0.6866326, -2.271847, 0.0627451, 1, 0, 1,
-0.4757802, -1.151636, -2.980279, 0.05490196, 1, 0, 1,
-0.4749048, -0.6451622, -1.832959, 0.05098039, 1, 0, 1,
-0.4715935, -1.332819, -3.251715, 0.04313726, 1, 0, 1,
-0.4709612, -0.4844302, 0.3347765, 0.03921569, 1, 0, 1,
-0.4680374, -1.074872, -0.5986958, 0.03137255, 1, 0, 1,
-0.4670892, 1.979042, -0.868113, 0.02745098, 1, 0, 1,
-0.4649597, 0.1925547, -3.911585, 0.01960784, 1, 0, 1,
-0.4645886, -1.026957, -3.136643, 0.01568628, 1, 0, 1,
-0.4645256, 0.08520333, -1.876953, 0.007843138, 1, 0, 1,
-0.4588501, 0.5827957, 0.1553427, 0.003921569, 1, 0, 1,
-0.4569317, -0.598874, -2.005688, 0, 1, 0.003921569, 1,
-0.4555421, 0.4998293, 0.9462938, 0, 1, 0.01176471, 1,
-0.4528991, 0.3106609, -0.4746679, 0, 1, 0.01568628, 1,
-0.4486413, 0.3613573, 0.4725986, 0, 1, 0.02352941, 1,
-0.4485678, 0.9486536, -0.1855832, 0, 1, 0.02745098, 1,
-0.4458863, 1.639542, -1.679983, 0, 1, 0.03529412, 1,
-0.445451, -0.1272403, -1.336241, 0, 1, 0.03921569, 1,
-0.4439732, 0.9298773, -0.05449498, 0, 1, 0.04705882, 1,
-0.4360223, 1.299121, -0.6754861, 0, 1, 0.05098039, 1,
-0.4294291, -0.5222803, -1.651546, 0, 1, 0.05882353, 1,
-0.4255655, 0.635093, -1.738907, 0, 1, 0.0627451, 1,
-0.4241992, -0.6479043, -1.580066, 0, 1, 0.07058824, 1,
-0.4235411, -1.249899, -3.526461, 0, 1, 0.07450981, 1,
-0.419057, -1.447573, -1.031657, 0, 1, 0.08235294, 1,
-0.4067885, -0.5727769, -1.069891, 0, 1, 0.08627451, 1,
-0.4055181, 0.1233974, -2.243571, 0, 1, 0.09411765, 1,
-0.405082, -0.2362799, -0.6045046, 0, 1, 0.1019608, 1,
-0.3982511, -0.1272, -0.6797997, 0, 1, 0.1058824, 1,
-0.3969524, -0.04910005, -2.577666, 0, 1, 0.1137255, 1,
-0.3960652, -0.02714917, -2.345037, 0, 1, 0.1176471, 1,
-0.3954442, 0.07908465, -1.412521, 0, 1, 0.1254902, 1,
-0.3943618, 0.5793948, -0.3810075, 0, 1, 0.1294118, 1,
-0.393349, -0.326481, -3.0806, 0, 1, 0.1372549, 1,
-0.3927404, -0.2061345, -1.858851, 0, 1, 0.1411765, 1,
-0.3888169, -0.6559542, -0.5099725, 0, 1, 0.1490196, 1,
-0.3881902, 0.5526775, -0.3858354, 0, 1, 0.1529412, 1,
-0.3879214, 0.3485156, -1.156039, 0, 1, 0.1607843, 1,
-0.386873, 0.2065084, 0.0120044, 0, 1, 0.1647059, 1,
-0.3795357, 0.123782, -0.8248219, 0, 1, 0.172549, 1,
-0.3733555, 0.381515, -0.92084, 0, 1, 0.1764706, 1,
-0.3656979, 0.9807198, 0.1828583, 0, 1, 0.1843137, 1,
-0.3637912, -0.6165864, -4.1832, 0, 1, 0.1882353, 1,
-0.3586102, 0.8123053, -0.7499356, 0, 1, 0.1960784, 1,
-0.3566655, 1.030518, -2.010611, 0, 1, 0.2039216, 1,
-0.3563479, -0.8048307, -2.595638, 0, 1, 0.2078431, 1,
-0.3544703, 0.7623611, 0.7861961, 0, 1, 0.2156863, 1,
-0.351895, 0.6811686, -0.9488775, 0, 1, 0.2196078, 1,
-0.3494829, -0.5452561, -4.155856, 0, 1, 0.227451, 1,
-0.3483886, -0.1787761, -1.739514, 0, 1, 0.2313726, 1,
-0.3465493, -0.313197, -1.417023, 0, 1, 0.2392157, 1,
-0.345788, 0.6824811, -1.797089, 0, 1, 0.2431373, 1,
-0.3420957, 1.383387, -0.1895712, 0, 1, 0.2509804, 1,
-0.3420864, 0.1414415, -0.4434524, 0, 1, 0.254902, 1,
-0.3388768, -0.216983, -2.419875, 0, 1, 0.2627451, 1,
-0.3374456, 0.6933478, -1.140219, 0, 1, 0.2666667, 1,
-0.3355182, 0.6848429, 0.3546597, 0, 1, 0.2745098, 1,
-0.3254673, 1.051893, -1.608545, 0, 1, 0.2784314, 1,
-0.3244871, -0.485532, -2.887846, 0, 1, 0.2862745, 1,
-0.3221063, 0.8550438, 0.4488015, 0, 1, 0.2901961, 1,
-0.3196771, 0.2625514, -2.317802, 0, 1, 0.2980392, 1,
-0.3150847, -1.212325, -2.797368, 0, 1, 0.3058824, 1,
-0.3116719, -0.7566175, -2.982214, 0, 1, 0.3098039, 1,
-0.3056022, -0.739775, -1.500678, 0, 1, 0.3176471, 1,
-0.3055063, -0.5333957, -1.963382, 0, 1, 0.3215686, 1,
-0.3044111, 0.7850183, 0.5429341, 0, 1, 0.3294118, 1,
-0.3035233, 0.1513467, -1.331173, 0, 1, 0.3333333, 1,
-0.301912, -0.4131415, -1.774983, 0, 1, 0.3411765, 1,
-0.3009458, -0.1013724, -3.07987, 0, 1, 0.345098, 1,
-0.2956659, 0.5288356, -1.214078, 0, 1, 0.3529412, 1,
-0.2946466, -1.867671, -4.964633, 0, 1, 0.3568628, 1,
-0.2898456, -1.539569, -1.718033, 0, 1, 0.3647059, 1,
-0.2868049, 0.742337, -1.127424, 0, 1, 0.3686275, 1,
-0.2825278, 0.002120163, -1.106423, 0, 1, 0.3764706, 1,
-0.2779133, -0.2203621, 0.3862292, 0, 1, 0.3803922, 1,
-0.2771452, 0.3748209, -0.2534968, 0, 1, 0.3882353, 1,
-0.2755281, -0.2521467, -3.476152, 0, 1, 0.3921569, 1,
-0.2749735, -1.897852, -3.06982, 0, 1, 0.4, 1,
-0.2588384, 0.5750837, -0.6155524, 0, 1, 0.4078431, 1,
-0.2497642, 2.44259, 0.07440729, 0, 1, 0.4117647, 1,
-0.2471211, -0.6028193, -2.736669, 0, 1, 0.4196078, 1,
-0.2428899, -1.653842, -4.222475, 0, 1, 0.4235294, 1,
-0.2387062, 1.491014, 0.118446, 0, 1, 0.4313726, 1,
-0.2381596, -0.3214238, -2.360175, 0, 1, 0.4352941, 1,
-0.2370185, -1.205021, -2.717019, 0, 1, 0.4431373, 1,
-0.237013, 0.5646829, -1.375733, 0, 1, 0.4470588, 1,
-0.2366135, 1.805726, -2.692909, 0, 1, 0.454902, 1,
-0.2357106, 0.3667935, -0.2276655, 0, 1, 0.4588235, 1,
-0.2343301, -0.6015909, -2.851209, 0, 1, 0.4666667, 1,
-0.2335802, 1.090218, 0.297241, 0, 1, 0.4705882, 1,
-0.2310807, -0.1801828, -2.463945, 0, 1, 0.4784314, 1,
-0.2299967, -1.269807, -3.332912, 0, 1, 0.4823529, 1,
-0.2263991, -0.517482, -2.932562, 0, 1, 0.4901961, 1,
-0.2203367, 1.630725, -2.849372, 0, 1, 0.4941176, 1,
-0.2137485, -1.11847, -3.328864, 0, 1, 0.5019608, 1,
-0.2134549, -0.02619493, -2.418355, 0, 1, 0.509804, 1,
-0.2129793, -1.813878, -4.174598, 0, 1, 0.5137255, 1,
-0.2111373, -0.8946064, -2.296117, 0, 1, 0.5215687, 1,
-0.2105067, -0.1691498, -3.317312, 0, 1, 0.5254902, 1,
-0.2092543, 0.2774809, 0.4587943, 0, 1, 0.5333334, 1,
-0.207672, 0.08382336, 0.8218771, 0, 1, 0.5372549, 1,
-0.2065387, 0.6872606, -0.3620675, 0, 1, 0.5450981, 1,
-0.2032431, -2.024956, -2.699701, 0, 1, 0.5490196, 1,
-0.2016141, 1.226004, -0.0460979, 0, 1, 0.5568628, 1,
-0.1995179, -0.7976507, -3.558665, 0, 1, 0.5607843, 1,
-0.1990746, -1.424055, -2.018894, 0, 1, 0.5686275, 1,
-0.1990599, -0.03427561, -3.176353, 0, 1, 0.572549, 1,
-0.1970893, 0.6565597, -1.337044, 0, 1, 0.5803922, 1,
-0.1953764, -1.040897, -3.982775, 0, 1, 0.5843138, 1,
-0.1939227, -0.04136255, -0.7904699, 0, 1, 0.5921569, 1,
-0.1909055, -1.197554, -3.027429, 0, 1, 0.5960785, 1,
-0.1907938, -0.1040147, -3.46847, 0, 1, 0.6039216, 1,
-0.1837959, 0.1639303, -0.4877811, 0, 1, 0.6117647, 1,
-0.1832751, 2.860729, 0.1646735, 0, 1, 0.6156863, 1,
-0.1824247, 0.4133214, 0.3140642, 0, 1, 0.6235294, 1,
-0.1773606, -0.2237018, -3.351213, 0, 1, 0.627451, 1,
-0.1676788, 0.3993931, -0.9450969, 0, 1, 0.6352941, 1,
-0.1662715, -0.6323152, -3.245816, 0, 1, 0.6392157, 1,
-0.1594706, -1.585409, -3.790448, 0, 1, 0.6470588, 1,
-0.1529101, -1.461158, -3.482913, 0, 1, 0.6509804, 1,
-0.1464922, 0.1236039, 0.4002385, 0, 1, 0.6588235, 1,
-0.1457041, 0.5758258, -1.11479, 0, 1, 0.6627451, 1,
-0.1450765, -0.3283255, -3.593604, 0, 1, 0.6705883, 1,
-0.1384071, -1.002374, -2.171393, 0, 1, 0.6745098, 1,
-0.1366608, -2.035223, -2.055253, 0, 1, 0.682353, 1,
-0.1343039, 1.272055, -0.6707975, 0, 1, 0.6862745, 1,
-0.1311914, 0.1870517, -1.414109, 0, 1, 0.6941177, 1,
-0.1302234, 1.074864, -1.016487, 0, 1, 0.7019608, 1,
-0.1301191, -1.41144, -3.529824, 0, 1, 0.7058824, 1,
-0.1282184, -0.3609816, -4.221023, 0, 1, 0.7137255, 1,
-0.1261292, -2.445804, -2.494191, 0, 1, 0.7176471, 1,
-0.1257492, 1.174404, -0.6316975, 0, 1, 0.7254902, 1,
-0.1250169, -0.005045592, -1.626465, 0, 1, 0.7294118, 1,
-0.1246013, -1.452721, -3.431116, 0, 1, 0.7372549, 1,
-0.1209561, 1.538153, 0.6122473, 0, 1, 0.7411765, 1,
-0.1181259, 0.8629563, -0.7263411, 0, 1, 0.7490196, 1,
-0.1144422, -0.2797159, -2.119044, 0, 1, 0.7529412, 1,
-0.1139652, -0.2711622, -3.478277, 0, 1, 0.7607843, 1,
-0.113221, -0.5579604, -3.280358, 0, 1, 0.7647059, 1,
-0.1117683, 0.7923675, 0.1896418, 0, 1, 0.772549, 1,
-0.1113636, 0.4971452, 1.152532, 0, 1, 0.7764706, 1,
-0.1080722, 1.90573, -0.4054055, 0, 1, 0.7843137, 1,
-0.1079825, 1.358335, 1.346916, 0, 1, 0.7882353, 1,
-0.1039809, -0.5355728, -3.299886, 0, 1, 0.7960784, 1,
-0.1021814, -1.623299, -3.055515, 0, 1, 0.8039216, 1,
-0.1020648, 1.160413, 0.09784351, 0, 1, 0.8078431, 1,
-0.09777868, 0.6538151, -1.281619, 0, 1, 0.8156863, 1,
-0.09739053, -0.09693553, -1.446867, 0, 1, 0.8196079, 1,
-0.09253264, 0.8869058, -0.07428384, 0, 1, 0.827451, 1,
-0.08861396, -0.8640453, -5.116058, 0, 1, 0.8313726, 1,
-0.08543826, -0.8250009, -2.847942, 0, 1, 0.8392157, 1,
-0.08382977, 1.560393, -1.841306, 0, 1, 0.8431373, 1,
-0.08159613, 0.4539432, -0.4771039, 0, 1, 0.8509804, 1,
-0.08041296, 0.2145645, 0.8048785, 0, 1, 0.854902, 1,
-0.0773197, 1.385951, 0.3982204, 0, 1, 0.8627451, 1,
-0.07505706, -1.156187, -3.055342, 0, 1, 0.8666667, 1,
-0.07304715, 0.9392341, -0.8141778, 0, 1, 0.8745098, 1,
-0.07149151, -0.2168476, -5.530006, 0, 1, 0.8784314, 1,
-0.06785076, -0.4906967, -2.904288, 0, 1, 0.8862745, 1,
-0.05497618, 0.2078577, 0.6509714, 0, 1, 0.8901961, 1,
-0.05439487, -0.8970801, -3.393957, 0, 1, 0.8980392, 1,
-0.05247923, 1.207789, -0.5168946, 0, 1, 0.9058824, 1,
-0.05076528, -0.9040439, -3.789059, 0, 1, 0.9098039, 1,
-0.04962059, -1.423932, -1.86898, 0, 1, 0.9176471, 1,
-0.04527182, -1.041126, -3.400512, 0, 1, 0.9215686, 1,
-0.04258566, 0.4721752, 1.581621, 0, 1, 0.9294118, 1,
-0.04045975, 0.4118943, -0.7861047, 0, 1, 0.9333333, 1,
-0.03765332, 1.141459, -0.7229379, 0, 1, 0.9411765, 1,
-0.03491195, -1.071465, -3.205907, 0, 1, 0.945098, 1,
-0.02989714, -0.9538088, -2.981015, 0, 1, 0.9529412, 1,
-0.02867541, 1.991581, -0.9077641, 0, 1, 0.9568627, 1,
-0.02404689, 1.642027, 2.251997, 0, 1, 0.9647059, 1,
-0.0225278, -0.3125048, -5.063446, 0, 1, 0.9686275, 1,
-0.01264157, 0.3890038, -1.38995, 0, 1, 0.9764706, 1,
-0.01050453, 0.1910303, -2.124784, 0, 1, 0.9803922, 1,
-0.009412811, -0.3044553, -2.26917, 0, 1, 0.9882353, 1,
-0.008798346, -1.769156, -2.122316, 0, 1, 0.9921569, 1,
-0.007597835, 1.260226, 0.108209, 0, 1, 1, 1,
-0.006688763, -1.08817, -2.143164, 0, 0.9921569, 1, 1,
-0.003945732, -0.1930694, -4.491489, 0, 0.9882353, 1, 1,
-0.0002117499, -0.862487, -3.185958, 0, 0.9803922, 1, 1,
0.0002057493, 0.3953031, 1.745072, 0, 0.9764706, 1, 1,
0.007205763, -1.401184, 3.048003, 0, 0.9686275, 1, 1,
0.007440998, 1.157219, 0.6981804, 0, 0.9647059, 1, 1,
0.008948479, -0.5562019, 2.30042, 0, 0.9568627, 1, 1,
0.01219212, 0.4560906, -0.0903068, 0, 0.9529412, 1, 1,
0.01593959, -0.4489318, 1.513108, 0, 0.945098, 1, 1,
0.01930546, -0.9047939, 4.2908, 0, 0.9411765, 1, 1,
0.01968216, -0.7423559, 3.33638, 0, 0.9333333, 1, 1,
0.02157855, 0.9326873, -1.756895, 0, 0.9294118, 1, 1,
0.02559039, -0.1606953, 2.324746, 0, 0.9215686, 1, 1,
0.02905556, -0.06146463, 2.544958, 0, 0.9176471, 1, 1,
0.03097713, 1.288507, -1.753241, 0, 0.9098039, 1, 1,
0.03424131, -1.117547, 4.032297, 0, 0.9058824, 1, 1,
0.03440409, 2.17667, -0.1353038, 0, 0.8980392, 1, 1,
0.0346246, 0.1739768, -0.7317547, 0, 0.8901961, 1, 1,
0.03568779, 1.520417, -0.7956107, 0, 0.8862745, 1, 1,
0.03698701, -0.3419251, 3.640657, 0, 0.8784314, 1, 1,
0.04263178, -0.6489521, 2.243869, 0, 0.8745098, 1, 1,
0.04512383, -0.6194922, 1.627465, 0, 0.8666667, 1, 1,
0.05278794, -0.7088339, 2.334412, 0, 0.8627451, 1, 1,
0.05576312, 0.5030293, -0.1850468, 0, 0.854902, 1, 1,
0.05729179, 0.9882261, 1.024218, 0, 0.8509804, 1, 1,
0.05770546, -0.0803772, 1.889584, 0, 0.8431373, 1, 1,
0.05815348, -0.4818953, 2.378667, 0, 0.8392157, 1, 1,
0.05984498, 0.3921158, 1.482401, 0, 0.8313726, 1, 1,
0.06359838, 0.09286672, 2.337586, 0, 0.827451, 1, 1,
0.06618445, -0.15381, 4.283339, 0, 0.8196079, 1, 1,
0.06795232, 0.2277917, -0.9927556, 0, 0.8156863, 1, 1,
0.07048642, -1.358265, 4.001083, 0, 0.8078431, 1, 1,
0.0719718, -0.4287613, 3.683786, 0, 0.8039216, 1, 1,
0.07317322, 2.617922, 0.08855321, 0, 0.7960784, 1, 1,
0.07725463, -0.4087128, 3.221885, 0, 0.7882353, 1, 1,
0.07884145, 0.02119903, 0.05112556, 0, 0.7843137, 1, 1,
0.08140176, -0.7827485, 4.633452, 0, 0.7764706, 1, 1,
0.08305761, -0.5497002, 2.661667, 0, 0.772549, 1, 1,
0.09114576, 2.070193, -2.75142, 0, 0.7647059, 1, 1,
0.0968359, -0.3335596, 1.809595, 0, 0.7607843, 1, 1,
0.0991355, -1.602603, 2.801767, 0, 0.7529412, 1, 1,
0.1017516, -0.538123, 1.336321, 0, 0.7490196, 1, 1,
0.1020729, 0.371997, 0.405864, 0, 0.7411765, 1, 1,
0.1034749, -1.48154, 4.215465, 0, 0.7372549, 1, 1,
0.105132, 0.0184614, 3.015478, 0, 0.7294118, 1, 1,
0.1053326, 1.145343, 2.359981, 0, 0.7254902, 1, 1,
0.1056787, 1.787693, 0.6558626, 0, 0.7176471, 1, 1,
0.1084868, 1.129968, -0.8199438, 0, 0.7137255, 1, 1,
0.1096331, 0.8736138, -0.7968517, 0, 0.7058824, 1, 1,
0.1225043, 0.2428671, 0.316104, 0, 0.6980392, 1, 1,
0.1247231, 0.3554319, 0.2619578, 0, 0.6941177, 1, 1,
0.1287909, -0.5664552, 2.825155, 0, 0.6862745, 1, 1,
0.1329218, 1.999881, -0.5225961, 0, 0.682353, 1, 1,
0.1332164, 1.526828, -2.709635, 0, 0.6745098, 1, 1,
0.134579, 0.9667343, -0.1774511, 0, 0.6705883, 1, 1,
0.1351924, -1.523499, 3.744238, 0, 0.6627451, 1, 1,
0.1365111, -0.06515847, -0.08042987, 0, 0.6588235, 1, 1,
0.1457237, -0.9374533, 3.237674, 0, 0.6509804, 1, 1,
0.1467437, 0.3962662, 0.9526853, 0, 0.6470588, 1, 1,
0.1472668, -0.667796, 3.980088, 0, 0.6392157, 1, 1,
0.1527991, -0.2587997, 2.208124, 0, 0.6352941, 1, 1,
0.153736, -0.1723592, 2.588558, 0, 0.627451, 1, 1,
0.1553506, -0.2774618, 2.755366, 0, 0.6235294, 1, 1,
0.1588686, 0.7588691, 0.4254673, 0, 0.6156863, 1, 1,
0.1603371, -1.142215, 3.642188, 0, 0.6117647, 1, 1,
0.1616387, -0.6279052, 2.356027, 0, 0.6039216, 1, 1,
0.1637201, 0.2006294, 1.090839, 0, 0.5960785, 1, 1,
0.1651527, -0.7703012, 4.618406, 0, 0.5921569, 1, 1,
0.1659004, -1.859802, 1.924394, 0, 0.5843138, 1, 1,
0.1696355, -1.174084, 3.041845, 0, 0.5803922, 1, 1,
0.1728028, -0.6560799, 2.922485, 0, 0.572549, 1, 1,
0.1753236, -1.69701, 2.055456, 0, 0.5686275, 1, 1,
0.1756369, 0.8653828, -0.2120649, 0, 0.5607843, 1, 1,
0.1765085, 1.790943, -1.637209, 0, 0.5568628, 1, 1,
0.1779425, -0.19318, 1.620741, 0, 0.5490196, 1, 1,
0.1820065, -1.091443, 4.168568, 0, 0.5450981, 1, 1,
0.1825006, -0.7405515, 5.781972, 0, 0.5372549, 1, 1,
0.1954696, 2.178848, 1.4512, 0, 0.5333334, 1, 1,
0.1977372, 1.102296, -0.5307608, 0, 0.5254902, 1, 1,
0.1983388, -1.28855, 2.263236, 0, 0.5215687, 1, 1,
0.2003294, -1.315806, 2.372891, 0, 0.5137255, 1, 1,
0.201927, -1.791851, 3.65457, 0, 0.509804, 1, 1,
0.2038821, 1.416019, 1.025677, 0, 0.5019608, 1, 1,
0.2067516, -0.2712752, 2.120499, 0, 0.4941176, 1, 1,
0.2082098, 0.6571211, -0.4753814, 0, 0.4901961, 1, 1,
0.2117586, 0.3862698, 1.08323, 0, 0.4823529, 1, 1,
0.2134012, 0.5560012, 0.815694, 0, 0.4784314, 1, 1,
0.2225579, 0.3803885, 1.886626, 0, 0.4705882, 1, 1,
0.2235943, 0.211131, -0.9561045, 0, 0.4666667, 1, 1,
0.2337171, 0.237241, 1.868557, 0, 0.4588235, 1, 1,
0.234214, -1.039304, 2.458625, 0, 0.454902, 1, 1,
0.2364203, -0.7582439, 2.36187, 0, 0.4470588, 1, 1,
0.2389497, -0.403767, 2.757835, 0, 0.4431373, 1, 1,
0.2418455, -1.703397, 2.483856, 0, 0.4352941, 1, 1,
0.2458359, -1.49102, 2.704124, 0, 0.4313726, 1, 1,
0.2487268, -0.4206118, 3.684103, 0, 0.4235294, 1, 1,
0.2518261, -0.8100715, 2.995285, 0, 0.4196078, 1, 1,
0.255353, 0.2441207, 1.704595, 0, 0.4117647, 1, 1,
0.2591654, 2.162731, 0.2266571, 0, 0.4078431, 1, 1,
0.2598919, -0.01324823, -0.3921456, 0, 0.4, 1, 1,
0.2621796, 0.593859, 0.2610615, 0, 0.3921569, 1, 1,
0.2691996, 0.2173897, 2.179084, 0, 0.3882353, 1, 1,
0.2755347, 0.7102411, -1.164362, 0, 0.3803922, 1, 1,
0.2755535, -0.2123064, 3.045643, 0, 0.3764706, 1, 1,
0.2850182, -1.321073, 3.478453, 0, 0.3686275, 1, 1,
0.2860147, 1.509185, -0.3999319, 0, 0.3647059, 1, 1,
0.2892896, -1.054732, 2.233248, 0, 0.3568628, 1, 1,
0.2910363, 0.2334324, 0.7669576, 0, 0.3529412, 1, 1,
0.2958495, 0.1244044, -0.7515796, 0, 0.345098, 1, 1,
0.304007, 0.9000564, 0.9992412, 0, 0.3411765, 1, 1,
0.3056066, -0.06352092, 1.284478, 0, 0.3333333, 1, 1,
0.3069377, -0.7199032, 1.172141, 0, 0.3294118, 1, 1,
0.3087332, -0.7976771, 4.825214, 0, 0.3215686, 1, 1,
0.3110744, 0.6628629, 0.3188163, 0, 0.3176471, 1, 1,
0.3145136, -0.6949745, 3.011619, 0, 0.3098039, 1, 1,
0.3154362, 0.5673785, -0.3044496, 0, 0.3058824, 1, 1,
0.3213378, -0.7241351, 3.577559, 0, 0.2980392, 1, 1,
0.3226109, 1.52518, 1.251971, 0, 0.2901961, 1, 1,
0.3257032, -1.153561, 2.218529, 0, 0.2862745, 1, 1,
0.325823, -0.5141796, 2.405976, 0, 0.2784314, 1, 1,
0.3294647, -0.1269539, 1.49882, 0, 0.2745098, 1, 1,
0.3326132, -0.2020699, 2.296318, 0, 0.2666667, 1, 1,
0.3328366, -0.8650383, 2.097657, 0, 0.2627451, 1, 1,
0.3342154, -1.557485, 2.441997, 0, 0.254902, 1, 1,
0.3375507, 0.2287177, 1.323595, 0, 0.2509804, 1, 1,
0.3393984, -0.2112955, -0.06173028, 0, 0.2431373, 1, 1,
0.3394491, 0.01633108, 0.9397274, 0, 0.2392157, 1, 1,
0.3408861, 0.3516654, 1.008303, 0, 0.2313726, 1, 1,
0.344456, 0.4730103, 0.6152185, 0, 0.227451, 1, 1,
0.3448341, -1.125844, 2.039236, 0, 0.2196078, 1, 1,
0.3460634, 0.5727704, 1.592892, 0, 0.2156863, 1, 1,
0.3499973, -0.4236318, 2.208336, 0, 0.2078431, 1, 1,
0.3501632, -0.4090371, 1.894035, 0, 0.2039216, 1, 1,
0.3545882, -0.1879078, 2.251112, 0, 0.1960784, 1, 1,
0.3580811, -0.2190805, 2.272135, 0, 0.1882353, 1, 1,
0.3590378, -0.8785859, 3.736566, 0, 0.1843137, 1, 1,
0.3591099, -0.05314466, 1.615885, 0, 0.1764706, 1, 1,
0.3627051, 1.275349, 0.3050199, 0, 0.172549, 1, 1,
0.3673827, -0.6966198, 3.374682, 0, 0.1647059, 1, 1,
0.3710407, -2.127777, 4.026179, 0, 0.1607843, 1, 1,
0.37336, 2.226119, -0.3344671, 0, 0.1529412, 1, 1,
0.3762232, 0.004337237, 2.406706, 0, 0.1490196, 1, 1,
0.3827928, 1.197432, -0.2407668, 0, 0.1411765, 1, 1,
0.3849221, 0.3826241, -0.04457528, 0, 0.1372549, 1, 1,
0.386919, 0.8277329, 0.7465331, 0, 0.1294118, 1, 1,
0.3882402, -0.7393181, 3.553254, 0, 0.1254902, 1, 1,
0.3950972, -0.6564296, 3.840008, 0, 0.1176471, 1, 1,
0.3960973, 1.073576, -1.768873, 0, 0.1137255, 1, 1,
0.3986467, -0.3718244, 2.769966, 0, 0.1058824, 1, 1,
0.4026314, -0.322735, 3.268001, 0, 0.09803922, 1, 1,
0.4134792, -1.460665, 3.168692, 0, 0.09411765, 1, 1,
0.4148458, 0.811229, 1.52669, 0, 0.08627451, 1, 1,
0.414872, 1.137753, 1.025035, 0, 0.08235294, 1, 1,
0.4152901, 0.4972417, 1.621944, 0, 0.07450981, 1, 1,
0.4156545, -1.167735, 3.128346, 0, 0.07058824, 1, 1,
0.4172821, 0.3980834, 1.244504, 0, 0.0627451, 1, 1,
0.4191109, 0.1756337, 1.480724, 0, 0.05882353, 1, 1,
0.4235764, -0.6908573, 2.322823, 0, 0.05098039, 1, 1,
0.4257484, 1.376387, -0.5769165, 0, 0.04705882, 1, 1,
0.4286832, 0.7611651, 0.05177663, 0, 0.03921569, 1, 1,
0.4315238, 0.7764015, -0.1056367, 0, 0.03529412, 1, 1,
0.4335008, 1.050735, 0.1747218, 0, 0.02745098, 1, 1,
0.4336683, 1.316903, 2.627694, 0, 0.02352941, 1, 1,
0.4337897, 1.196783, -1.020762, 0, 0.01568628, 1, 1,
0.434865, -1.630863, 3.20805, 0, 0.01176471, 1, 1,
0.4377266, -0.3190436, 0.1422776, 0, 0.003921569, 1, 1,
0.4432486, -0.04692249, 1.923425, 0.003921569, 0, 1, 1,
0.44473, -1.313151, 3.189778, 0.007843138, 0, 1, 1,
0.4451604, -1.229926, 2.142029, 0.01568628, 0, 1, 1,
0.4516834, -0.8517133, 2.200756, 0.01960784, 0, 1, 1,
0.4552983, 0.1311832, 2.019739, 0.02745098, 0, 1, 1,
0.4615136, 0.3022516, 1.108551, 0.03137255, 0, 1, 1,
0.46164, -0.3030867, 1.569831, 0.03921569, 0, 1, 1,
0.463078, 1.22554, -0.4180194, 0.04313726, 0, 1, 1,
0.4648822, -2.237209, 2.439914, 0.05098039, 0, 1, 1,
0.4666277, 1.454137, -0.3489637, 0.05490196, 0, 1, 1,
0.4681441, -0.07671175, 3.099603, 0.0627451, 0, 1, 1,
0.4707091, 0.108519, 3.675725, 0.06666667, 0, 1, 1,
0.4715443, 1.204893, -0.02711058, 0.07450981, 0, 1, 1,
0.4744041, 0.4967674, 1.162952, 0.07843138, 0, 1, 1,
0.4754559, -0.6603131, 3.87592, 0.08627451, 0, 1, 1,
0.4760923, -1.79501, 5.034072, 0.09019608, 0, 1, 1,
0.4784575, -0.2636085, 0.7207618, 0.09803922, 0, 1, 1,
0.4791751, -1.118716, 2.987624, 0.1058824, 0, 1, 1,
0.4894908, -0.8759083, 2.980894, 0.1098039, 0, 1, 1,
0.4909821, -0.5787313, 1.116969, 0.1176471, 0, 1, 1,
0.4933338, 1.025227, -1.288486, 0.1215686, 0, 1, 1,
0.4941702, -0.9077975, 2.239882, 0.1294118, 0, 1, 1,
0.4953783, 0.5237193, 1.947487, 0.1333333, 0, 1, 1,
0.4958288, 0.208538, 0.542526, 0.1411765, 0, 1, 1,
0.4964538, -0.1791649, 1.159673, 0.145098, 0, 1, 1,
0.4966129, -0.1685095, 3.097038, 0.1529412, 0, 1, 1,
0.501691, 0.3029266, 1.070182, 0.1568628, 0, 1, 1,
0.5020322, 0.08326574, 0.4977201, 0.1647059, 0, 1, 1,
0.5025777, 0.4731396, 0.5793172, 0.1686275, 0, 1, 1,
0.5058888, -0.7857326, 3.648538, 0.1764706, 0, 1, 1,
0.5101766, 1.337299, 0.2368218, 0.1803922, 0, 1, 1,
0.5106265, 0.3633268, 1.265813, 0.1882353, 0, 1, 1,
0.5131429, -0.5231352, 0.1329326, 0.1921569, 0, 1, 1,
0.5137899, 0.6514533, 1.966735, 0.2, 0, 1, 1,
0.5142486, -0.5165228, 2.441163, 0.2078431, 0, 1, 1,
0.515904, -0.3799152, 2.875823, 0.2117647, 0, 1, 1,
0.5239565, 1.330853, -0.0207063, 0.2196078, 0, 1, 1,
0.5245581, -1.048661, 2.273844, 0.2235294, 0, 1, 1,
0.5247849, 1.985221, -0.3220919, 0.2313726, 0, 1, 1,
0.5251159, 0.01391494, 2.018427, 0.2352941, 0, 1, 1,
0.5266902, -1.354041, 3.00274, 0.2431373, 0, 1, 1,
0.5299668, -0.5889514, 1.886679, 0.2470588, 0, 1, 1,
0.5317764, -0.4368702, 2.561612, 0.254902, 0, 1, 1,
0.5377131, 1.225343, 2.92805, 0.2588235, 0, 1, 1,
0.5399184, 0.5448744, -1.03882, 0.2666667, 0, 1, 1,
0.5564643, -0.1526019, 2.459942, 0.2705882, 0, 1, 1,
0.5568438, 0.5160136, 1.496228, 0.2784314, 0, 1, 1,
0.5580198, 1.52561, -0.9302747, 0.282353, 0, 1, 1,
0.5581832, -0.3396985, 1.154256, 0.2901961, 0, 1, 1,
0.558967, 0.1198281, 0.9639917, 0.2941177, 0, 1, 1,
0.5625406, -0.6814107, 2.888585, 0.3019608, 0, 1, 1,
0.5649204, 0.6933572, 0.2802904, 0.3098039, 0, 1, 1,
0.5656213, 0.5140013, 0.8723673, 0.3137255, 0, 1, 1,
0.5662994, 1.871087, 0.5990103, 0.3215686, 0, 1, 1,
0.5665358, 0.5041628, 0.5498913, 0.3254902, 0, 1, 1,
0.5674716, 0.3172497, 0.2839297, 0.3333333, 0, 1, 1,
0.5692824, -0.4693363, 3.448024, 0.3372549, 0, 1, 1,
0.5705003, -0.07598606, 0.3341565, 0.345098, 0, 1, 1,
0.5737973, 0.7779562, 2.257427, 0.3490196, 0, 1, 1,
0.5750571, 2.242431, -1.371482, 0.3568628, 0, 1, 1,
0.5754985, -0.6122348, 2.427378, 0.3607843, 0, 1, 1,
0.5810688, 0.7739317, 0.6277099, 0.3686275, 0, 1, 1,
0.5828829, -0.2687486, 1.766398, 0.372549, 0, 1, 1,
0.583729, -0.6171179, 2.080626, 0.3803922, 0, 1, 1,
0.5903465, -0.9841941, 1.494534, 0.3843137, 0, 1, 1,
0.5910376, 0.4903114, 0.1252521, 0.3921569, 0, 1, 1,
0.5910397, -1.497916, 2.548273, 0.3960784, 0, 1, 1,
0.5919619, 0.6328658, 2.894026, 0.4039216, 0, 1, 1,
0.5928643, -0.6220586, 2.063835, 0.4117647, 0, 1, 1,
0.5950613, 0.733127, 2.558389, 0.4156863, 0, 1, 1,
0.5962533, 0.75186, -0.2718192, 0.4235294, 0, 1, 1,
0.5967523, 1.251202, 1.287114, 0.427451, 0, 1, 1,
0.5986101, -0.8816018, 3.184697, 0.4352941, 0, 1, 1,
0.6020975, -0.3324266, 2.032391, 0.4392157, 0, 1, 1,
0.6047794, 1.054519, 0.7630949, 0.4470588, 0, 1, 1,
0.6067663, 0.7143793, 0.5879019, 0.4509804, 0, 1, 1,
0.6099645, -0.5404333, 1.617253, 0.4588235, 0, 1, 1,
0.6105057, 0.6332515, 0.3664045, 0.4627451, 0, 1, 1,
0.6204687, 1.362651, -1.130797, 0.4705882, 0, 1, 1,
0.6227911, 0.9191118, -0.3832749, 0.4745098, 0, 1, 1,
0.6299838, -0.7350346, 3.239143, 0.4823529, 0, 1, 1,
0.6311495, -0.4004686, 0.6612818, 0.4862745, 0, 1, 1,
0.6313365, 1.167353, 1.448584, 0.4941176, 0, 1, 1,
0.6344522, 0.4461163, 0.7395408, 0.5019608, 0, 1, 1,
0.6357986, 0.8340262, -1.386913, 0.5058824, 0, 1, 1,
0.6358691, -0.1793073, 1.780725, 0.5137255, 0, 1, 1,
0.6475008, 0.5151101, 0.6552425, 0.5176471, 0, 1, 1,
0.6485747, 0.4594233, 1.466222, 0.5254902, 0, 1, 1,
0.6494443, -2.025976, 3.77816, 0.5294118, 0, 1, 1,
0.6517429, 0.05474798, 2.845163, 0.5372549, 0, 1, 1,
0.6635288, 0.4919186, 1.045085, 0.5411765, 0, 1, 1,
0.6646575, -0.9700711, 2.524811, 0.5490196, 0, 1, 1,
0.6684552, 0.01779133, 2.29924, 0.5529412, 0, 1, 1,
0.6771844, 0.2735541, 1.682936, 0.5607843, 0, 1, 1,
0.6787146, 0.7393394, 1.600311, 0.5647059, 0, 1, 1,
0.6869691, -0.7593933, 2.519819, 0.572549, 0, 1, 1,
0.6894317, -0.5830632, 1.758229, 0.5764706, 0, 1, 1,
0.6961254, 0.5729323, 0.7532994, 0.5843138, 0, 1, 1,
0.6981843, -0.1028038, 1.441489, 0.5882353, 0, 1, 1,
0.6995264, 0.2874228, 1.517818, 0.5960785, 0, 1, 1,
0.703304, 0.1695592, 2.88714, 0.6039216, 0, 1, 1,
0.7138614, -0.1616703, 3.953305, 0.6078432, 0, 1, 1,
0.7194229, 0.5937234, 1.133988, 0.6156863, 0, 1, 1,
0.7220414, 1.372584, 0.6721025, 0.6196079, 0, 1, 1,
0.728623, 1.102744, 1.346383, 0.627451, 0, 1, 1,
0.7300033, -0.9558678, 2.934129, 0.6313726, 0, 1, 1,
0.7319862, 1.415248, 0.3546512, 0.6392157, 0, 1, 1,
0.7399238, 0.09059595, 3.33919, 0.6431373, 0, 1, 1,
0.7407568, 1.156445, -0.04549854, 0.6509804, 0, 1, 1,
0.7408119, 0.7035663, 1.165722, 0.654902, 0, 1, 1,
0.7439867, 0.8078138, 0.3570215, 0.6627451, 0, 1, 1,
0.744957, -1.806162, 1.62486, 0.6666667, 0, 1, 1,
0.749127, -0.3854499, 1.633267, 0.6745098, 0, 1, 1,
0.7499688, 0.204172, 1.037621, 0.6784314, 0, 1, 1,
0.7509171, 0.8227502, 1.705234, 0.6862745, 0, 1, 1,
0.7574013, -0.07504098, 2.139317, 0.6901961, 0, 1, 1,
0.7589242, 0.7445406, 1.513872, 0.6980392, 0, 1, 1,
0.7647871, 0.3197239, 0.6045745, 0.7058824, 0, 1, 1,
0.7656685, -0.4328726, 1.604173, 0.7098039, 0, 1, 1,
0.7661234, 0.102166, 2.866308, 0.7176471, 0, 1, 1,
0.766679, 2.152599, -0.5730527, 0.7215686, 0, 1, 1,
0.767108, -0.419914, 2.276682, 0.7294118, 0, 1, 1,
0.7682236, 1.11049, 0.6154113, 0.7333333, 0, 1, 1,
0.7686697, 0.6902241, -0.09217942, 0.7411765, 0, 1, 1,
0.769523, 0.1054917, 1.794031, 0.7450981, 0, 1, 1,
0.7701602, -0.3087618, 3.28862, 0.7529412, 0, 1, 1,
0.7752823, -0.793943, 2.695371, 0.7568628, 0, 1, 1,
0.7757697, 1.353863, -0.9410213, 0.7647059, 0, 1, 1,
0.7887359, 0.11347, -0.1249364, 0.7686275, 0, 1, 1,
0.7897855, -0.8387527, 2.02975, 0.7764706, 0, 1, 1,
0.7898831, -1.38425, 2.062336, 0.7803922, 0, 1, 1,
0.7937953, 1.208566, 2.80442, 0.7882353, 0, 1, 1,
0.7976272, 0.9476268, -0.1995242, 0.7921569, 0, 1, 1,
0.7984953, 0.8221953, 0.407394, 0.8, 0, 1, 1,
0.8101949, 0.1162268, 1.020534, 0.8078431, 0, 1, 1,
0.81241, -1.816986, 1.799267, 0.8117647, 0, 1, 1,
0.8189591, -1.502193, 1.200764, 0.8196079, 0, 1, 1,
0.8194376, 0.1032087, 1.885996, 0.8235294, 0, 1, 1,
0.82692, 1.079628, 1.959752, 0.8313726, 0, 1, 1,
0.8310533, 1.556233, 1.681869, 0.8352941, 0, 1, 1,
0.8318446, 0.2524946, 0.5124009, 0.8431373, 0, 1, 1,
0.834038, -0.3066043, 2.696284, 0.8470588, 0, 1, 1,
0.8367967, 1.10463, 1.209489, 0.854902, 0, 1, 1,
0.8456647, 0.4427524, 1.252643, 0.8588235, 0, 1, 1,
0.8468267, -1.22995, 4.051965, 0.8666667, 0, 1, 1,
0.8473494, -1.469388, 3.073361, 0.8705882, 0, 1, 1,
0.8508458, 1.187726, 1.210536, 0.8784314, 0, 1, 1,
0.8544929, 2.118343, 0.7823775, 0.8823529, 0, 1, 1,
0.8561026, 1.092054, 0.8784782, 0.8901961, 0, 1, 1,
0.8584744, -0.5935418, 3.614909, 0.8941177, 0, 1, 1,
0.8602429, -0.7856177, 2.66888, 0.9019608, 0, 1, 1,
0.866203, 0.3342476, 0.4955507, 0.9098039, 0, 1, 1,
0.8683853, 0.7785785, 1.708542, 0.9137255, 0, 1, 1,
0.8732634, -0.8444206, 4.070818, 0.9215686, 0, 1, 1,
0.8763921, -0.5369421, 2.960851, 0.9254902, 0, 1, 1,
0.8780961, 2.454839, -1.807044, 0.9333333, 0, 1, 1,
0.8869893, -1.034666, 1.580299, 0.9372549, 0, 1, 1,
0.8874964, -1.051381, 3.530334, 0.945098, 0, 1, 1,
0.8897997, 0.2581935, -0.7944483, 0.9490196, 0, 1, 1,
0.8914584, 0.4612445, 0.5591484, 0.9568627, 0, 1, 1,
0.8971757, -1.727855, 3.273161, 0.9607843, 0, 1, 1,
0.9015454, 1.074726, 0.116096, 0.9686275, 0, 1, 1,
0.9019412, -0.4054854, 2.094439, 0.972549, 0, 1, 1,
0.9079154, -0.294093, 2.44309, 0.9803922, 0, 1, 1,
0.9096285, -0.7470772, 1.447642, 0.9843137, 0, 1, 1,
0.9123248, -1.05731, 2.050397, 0.9921569, 0, 1, 1,
0.913203, -1.632584, 3.62922, 0.9960784, 0, 1, 1,
0.9298443, -0.9326758, 3.561395, 1, 0, 0.9960784, 1,
0.9312257, 0.2157865, 0.6928576, 1, 0, 0.9882353, 1,
0.9367815, 1.251482, -0.05666029, 1, 0, 0.9843137, 1,
0.9385048, -1.828172, 3.062521, 1, 0, 0.9764706, 1,
0.9407914, 1.979468, 0.79352, 1, 0, 0.972549, 1,
0.943792, 0.9929986, -0.2801157, 1, 0, 0.9647059, 1,
0.9480738, 1.223831, 1.076422, 1, 0, 0.9607843, 1,
0.9514216, 1.895037, -0.8289552, 1, 0, 0.9529412, 1,
0.9553116, -2.324673, 1.980233, 1, 0, 0.9490196, 1,
0.9604328, -0.9271185, 4.68834, 1, 0, 0.9411765, 1,
0.9737343, 0.3499667, 1.326802, 1, 0, 0.9372549, 1,
0.976692, 1.336643, -0.3044428, 1, 0, 0.9294118, 1,
0.9780056, 0.1070659, 1.142742, 1, 0, 0.9254902, 1,
0.984473, -0.08717424, 1.498687, 1, 0, 0.9176471, 1,
0.9864199, -0.08874069, 2.313926, 1, 0, 0.9137255, 1,
0.9892693, -1.14304, 3.404995, 1, 0, 0.9058824, 1,
0.9903859, 0.4382425, 0.7835458, 1, 0, 0.9019608, 1,
1.001488, -0.953885, 2.216525, 1, 0, 0.8941177, 1,
1.002079, -0.6013463, 2.252219, 1, 0, 0.8862745, 1,
1.002833, 0.105739, -0.1500394, 1, 0, 0.8823529, 1,
1.005127, 0.1120631, 1.478794, 1, 0, 0.8745098, 1,
1.006526, 0.6061822, -0.03851245, 1, 0, 0.8705882, 1,
1.00665, 0.948512, 3.213482, 1, 0, 0.8627451, 1,
1.017838, 0.9688199, 0.9711373, 1, 0, 0.8588235, 1,
1.030159, -0.7563183, 2.144775, 1, 0, 0.8509804, 1,
1.03137, 1.217559, 0.1280369, 1, 0, 0.8470588, 1,
1.044324, 0.8985148, 0.9898336, 1, 0, 0.8392157, 1,
1.046085, 0.4642059, 1.610373, 1, 0, 0.8352941, 1,
1.0461, -0.4153353, 1.509546, 1, 0, 0.827451, 1,
1.061254, 0.04165637, 0.9266623, 1, 0, 0.8235294, 1,
1.063112, -0.7817739, 1.013652, 1, 0, 0.8156863, 1,
1.063524, 0.2325419, 0.09532267, 1, 0, 0.8117647, 1,
1.06503, -0.3235901, 0.4578431, 1, 0, 0.8039216, 1,
1.069282, -1.781657, 2.737181, 1, 0, 0.7960784, 1,
1.069312, 1.176477, 0.1713237, 1, 0, 0.7921569, 1,
1.070883, -0.1987614, 1.655316, 1, 0, 0.7843137, 1,
1.073164, 0.2834193, 1.910388, 1, 0, 0.7803922, 1,
1.075538, 1.570345, -0.6319126, 1, 0, 0.772549, 1,
1.088037, 0.1512813, 2.306822, 1, 0, 0.7686275, 1,
1.093381, -1.27507, 2.16999, 1, 0, 0.7607843, 1,
1.109206, -1.118954, 1.441367, 1, 0, 0.7568628, 1,
1.111614, -1.262, 2.728993, 1, 0, 0.7490196, 1,
1.117266, 1.886107, 0.2440786, 1, 0, 0.7450981, 1,
1.12104, -0.6502594, 1.86126, 1, 0, 0.7372549, 1,
1.134453, -0.9177483, 1.708465, 1, 0, 0.7333333, 1,
1.135456, -0.6060961, 2.561673, 1, 0, 0.7254902, 1,
1.137953, 0.514334, -0.1751735, 1, 0, 0.7215686, 1,
1.140685, -0.9579467, 3.523495, 1, 0, 0.7137255, 1,
1.145187, -0.2437861, 2.986436, 1, 0, 0.7098039, 1,
1.152495, 0.7924734, 0.7155899, 1, 0, 0.7019608, 1,
1.153911, -0.2153544, 2.495359, 1, 0, 0.6941177, 1,
1.156708, 0.1081567, 1.495592, 1, 0, 0.6901961, 1,
1.161616, -1.311341, 2.106721, 1, 0, 0.682353, 1,
1.171721, 0.4993213, 3.155918, 1, 0, 0.6784314, 1,
1.173488, 1.673501, 1.528105, 1, 0, 0.6705883, 1,
1.185157, -1.654926, 3.398361, 1, 0, 0.6666667, 1,
1.197522, -1.915905, 0.7721801, 1, 0, 0.6588235, 1,
1.197939, -1.152859, 1.643303, 1, 0, 0.654902, 1,
1.215994, -0.08298834, 3.414377, 1, 0, 0.6470588, 1,
1.218197, 1.845306, 1.709512, 1, 0, 0.6431373, 1,
1.220264, 0.5076198, 1.28694, 1, 0, 0.6352941, 1,
1.222933, 1.363801, -0.1555061, 1, 0, 0.6313726, 1,
1.232625, -0.5487657, 2.165691, 1, 0, 0.6235294, 1,
1.240885, 1.031083, 2.471995, 1, 0, 0.6196079, 1,
1.241272, -1.577335, 2.567185, 1, 0, 0.6117647, 1,
1.244635, 0.8764374, 1.846563, 1, 0, 0.6078432, 1,
1.245718, 0.4743352, 1.696727, 1, 0, 0.6, 1,
1.249616, -1.416757, 1.200355, 1, 0, 0.5921569, 1,
1.270788, -0.2417849, 0.3640871, 1, 0, 0.5882353, 1,
1.292085, -0.02326223, 2.38058, 1, 0, 0.5803922, 1,
1.306085, -0.2509884, 2.797325, 1, 0, 0.5764706, 1,
1.309851, -1.406668, 2.724195, 1, 0, 0.5686275, 1,
1.318298, 1.327945, -0.6013408, 1, 0, 0.5647059, 1,
1.319705, -0.3043186, -0.05403607, 1, 0, 0.5568628, 1,
1.324297, 1.105734, 4.230699, 1, 0, 0.5529412, 1,
1.324338, -0.4124037, 1.083435, 1, 0, 0.5450981, 1,
1.326677, -0.795698, 4.239562, 1, 0, 0.5411765, 1,
1.332476, -0.8792942, 1.834728, 1, 0, 0.5333334, 1,
1.347912, 1.014219, 1.051219, 1, 0, 0.5294118, 1,
1.356731, 0.6741526, 2.203694, 1, 0, 0.5215687, 1,
1.364817, 1.902506, 1.681885, 1, 0, 0.5176471, 1,
1.374527, 0.9492918, 1.143699, 1, 0, 0.509804, 1,
1.377089, -0.366066, 1.784629, 1, 0, 0.5058824, 1,
1.379547, -0.7107833, 1.523104, 1, 0, 0.4980392, 1,
1.381129, 0.6384257, 2.790134, 1, 0, 0.4901961, 1,
1.383382, -0.5714915, 1.703324, 1, 0, 0.4862745, 1,
1.393048, 0.4447711, -0.2550648, 1, 0, 0.4784314, 1,
1.393588, -0.2401502, 1.914002, 1, 0, 0.4745098, 1,
1.403425, 0.2524614, 1.481096, 1, 0, 0.4666667, 1,
1.418649, -0.06279431, 0.7772973, 1, 0, 0.4627451, 1,
1.422161, -0.3309754, 2.03475, 1, 0, 0.454902, 1,
1.437353, -1.501029, 3.238266, 1, 0, 0.4509804, 1,
1.451379, -0.6991958, 2.130424, 1, 0, 0.4431373, 1,
1.456494, -1.301625, 1.446031, 1, 0, 0.4392157, 1,
1.460579, -1.531043, 2.350363, 1, 0, 0.4313726, 1,
1.465851, -0.4179059, 2.671806, 1, 0, 0.427451, 1,
1.48112, 0.1822874, 0.4474316, 1, 0, 0.4196078, 1,
1.486648, 1.27977, 1.760506, 1, 0, 0.4156863, 1,
1.498558, 2.070538, 0.7558306, 1, 0, 0.4078431, 1,
1.500156, 1.206256, 0.1347728, 1, 0, 0.4039216, 1,
1.516673, 0.5789161, 1.34546, 1, 0, 0.3960784, 1,
1.531918, 0.9081289, 1.346759, 1, 0, 0.3882353, 1,
1.536317, 0.336667, 0.9061965, 1, 0, 0.3843137, 1,
1.54908, -0.7777939, 2.705383, 1, 0, 0.3764706, 1,
1.569172, 0.7020153, 1.050619, 1, 0, 0.372549, 1,
1.572211, 0.7608539, 0.1746501, 1, 0, 0.3647059, 1,
1.572835, -1.144351, 0.760089, 1, 0, 0.3607843, 1,
1.586329, -0.2719515, 1.972068, 1, 0, 0.3529412, 1,
1.605348, 0.6487458, 1.657525, 1, 0, 0.3490196, 1,
1.621136, 0.9511893, 0.4220082, 1, 0, 0.3411765, 1,
1.636821, -0.8006486, 3.388245, 1, 0, 0.3372549, 1,
1.637193, 1.093748, -0.7178488, 1, 0, 0.3294118, 1,
1.641041, -0.7630128, 2.331284, 1, 0, 0.3254902, 1,
1.64504, -0.479576, 1.155169, 1, 0, 0.3176471, 1,
1.658025, -0.06636519, 2.114638, 1, 0, 0.3137255, 1,
1.660729, 0.1432963, 1.95298, 1, 0, 0.3058824, 1,
1.665083, 1.251297, 1.535264, 1, 0, 0.2980392, 1,
1.669149, -1.117949, 2.207213, 1, 0, 0.2941177, 1,
1.671334, 1.364206, -0.5031587, 1, 0, 0.2862745, 1,
1.691061, 0.7679654, 2.514996, 1, 0, 0.282353, 1,
1.691579, -1.209112, 0.6940003, 1, 0, 0.2745098, 1,
1.706634, 0.2038009, 2.103355, 1, 0, 0.2705882, 1,
1.725377, -1.190458, 3.357352, 1, 0, 0.2627451, 1,
1.737448, 1.529449, 1.002402, 1, 0, 0.2588235, 1,
1.748407, -1.70484, 1.264576, 1, 0, 0.2509804, 1,
1.749349, 0.8318775, 2.064632, 1, 0, 0.2470588, 1,
1.783707, -0.8452634, 2.071962, 1, 0, 0.2392157, 1,
1.785892, -0.7751325, 3.136673, 1, 0, 0.2352941, 1,
1.796503, -0.1874308, 2.766432, 1, 0, 0.227451, 1,
1.806848, 0.2756015, 1.521778, 1, 0, 0.2235294, 1,
1.834349, -0.0307139, 1.427445, 1, 0, 0.2156863, 1,
1.851974, 1.806766, 1.698392, 1, 0, 0.2117647, 1,
1.863825, 0.58714, 1.927047, 1, 0, 0.2039216, 1,
1.864977, -0.8235049, 1.788622, 1, 0, 0.1960784, 1,
1.87892, -0.2108049, 2.295376, 1, 0, 0.1921569, 1,
1.888864, -0.1367004, 3.170746, 1, 0, 0.1843137, 1,
1.920062, -1.399094, 1.426606, 1, 0, 0.1803922, 1,
1.930629, -1.167625, 2.93417, 1, 0, 0.172549, 1,
1.962763, -2.700223, 2.103465, 1, 0, 0.1686275, 1,
1.966554, 0.4079017, 1.886669, 1, 0, 0.1607843, 1,
1.990506, -0.02875, 1.635155, 1, 0, 0.1568628, 1,
2.000288, -0.3763182, 2.170866, 1, 0, 0.1490196, 1,
2.010224, 0.06197915, 1.408162, 1, 0, 0.145098, 1,
2.048139, 1.628196, 2.272925, 1, 0, 0.1372549, 1,
2.048309, 0.5635364, 2.454696, 1, 0, 0.1333333, 1,
2.05945, 1.012446, -0.8155385, 1, 0, 0.1254902, 1,
2.076391, -0.175046, 0.8970305, 1, 0, 0.1215686, 1,
2.078544, -0.2656946, 1.970192, 1, 0, 0.1137255, 1,
2.104523, -1.384914, 2.11512, 1, 0, 0.1098039, 1,
2.113093, -0.1299926, 1.353375, 1, 0, 0.1019608, 1,
2.124684, -0.1889094, 2.058202, 1, 0, 0.09411765, 1,
2.149238, -0.3710027, 2.054199, 1, 0, 0.09019608, 1,
2.227148, -0.5112602, 2.459879, 1, 0, 0.08235294, 1,
2.230265, -0.02115594, 0.7105279, 1, 0, 0.07843138, 1,
2.255592, 3.030844e-05, 1.684374, 1, 0, 0.07058824, 1,
2.263413, 0.5544045, 2.677902, 1, 0, 0.06666667, 1,
2.294011, 0.1835419, 0.1138323, 1, 0, 0.05882353, 1,
2.340934, 1.810454, -0.2201522, 1, 0, 0.05490196, 1,
2.38613, -0.6540514, 2.225028, 1, 0, 0.04705882, 1,
2.435439, 0.2418965, 2.462398, 1, 0, 0.04313726, 1,
2.554876, -0.3298133, 2.957524, 1, 0, 0.03529412, 1,
2.561674, -1.39671, 2.658018, 1, 0, 0.03137255, 1,
2.583949, 0.007477224, 4.050987, 1, 0, 0.02352941, 1,
2.593658, 0.01068806, -0.06046307, 1, 0, 0.01960784, 1,
2.629486, -0.625989, 2.663464, 1, 0, 0.01176471, 1,
2.837923, 1.180935, 2.019073, 1, 0, 0.007843138, 1
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
-0.2286264, -3.642805, -7.447387, 0, -0.5, 0.5, 0.5,
-0.2286264, -3.642805, -7.447387, 1, -0.5, 0.5, 0.5,
-0.2286264, -3.642805, -7.447387, 1, 1.5, 0.5, 0.5,
-0.2286264, -3.642805, -7.447387, 0, 1.5, 0.5, 0.5
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
-4.334736, 0.08025253, -7.447387, 0, -0.5, 0.5, 0.5,
-4.334736, 0.08025253, -7.447387, 1, -0.5, 0.5, 0.5,
-4.334736, 0.08025253, -7.447387, 1, 1.5, 0.5, 0.5,
-4.334736, 0.08025253, -7.447387, 0, 1.5, 0.5, 0.5
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
-4.334736, -3.642805, 0.125983, 0, -0.5, 0.5, 0.5,
-4.334736, -3.642805, 0.125983, 1, -0.5, 0.5, 0.5,
-4.334736, -3.642805, 0.125983, 1, 1.5, 0.5, 0.5,
-4.334736, -3.642805, 0.125983, 0, 1.5, 0.5, 0.5
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
-3, -2.783638, -5.699686,
2, -2.783638, -5.699686,
-3, -2.783638, -5.699686,
-3, -2.926832, -5.99097,
-2, -2.783638, -5.699686,
-2, -2.926832, -5.99097,
-1, -2.783638, -5.699686,
-1, -2.926832, -5.99097,
0, -2.783638, -5.699686,
0, -2.926832, -5.99097,
1, -2.783638, -5.699686,
1, -2.926832, -5.99097,
2, -2.783638, -5.699686,
2, -2.926832, -5.99097
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
-3, -3.213221, -6.573536, 0, -0.5, 0.5, 0.5,
-3, -3.213221, -6.573536, 1, -0.5, 0.5, 0.5,
-3, -3.213221, -6.573536, 1, 1.5, 0.5, 0.5,
-3, -3.213221, -6.573536, 0, 1.5, 0.5, 0.5,
-2, -3.213221, -6.573536, 0, -0.5, 0.5, 0.5,
-2, -3.213221, -6.573536, 1, -0.5, 0.5, 0.5,
-2, -3.213221, -6.573536, 1, 1.5, 0.5, 0.5,
-2, -3.213221, -6.573536, 0, 1.5, 0.5, 0.5,
-1, -3.213221, -6.573536, 0, -0.5, 0.5, 0.5,
-1, -3.213221, -6.573536, 1, -0.5, 0.5, 0.5,
-1, -3.213221, -6.573536, 1, 1.5, 0.5, 0.5,
-1, -3.213221, -6.573536, 0, 1.5, 0.5, 0.5,
0, -3.213221, -6.573536, 0, -0.5, 0.5, 0.5,
0, -3.213221, -6.573536, 1, -0.5, 0.5, 0.5,
0, -3.213221, -6.573536, 1, 1.5, 0.5, 0.5,
0, -3.213221, -6.573536, 0, 1.5, 0.5, 0.5,
1, -3.213221, -6.573536, 0, -0.5, 0.5, 0.5,
1, -3.213221, -6.573536, 1, -0.5, 0.5, 0.5,
1, -3.213221, -6.573536, 1, 1.5, 0.5, 0.5,
1, -3.213221, -6.573536, 0, 1.5, 0.5, 0.5,
2, -3.213221, -6.573536, 0, -0.5, 0.5, 0.5,
2, -3.213221, -6.573536, 1, -0.5, 0.5, 0.5,
2, -3.213221, -6.573536, 1, 1.5, 0.5, 0.5,
2, -3.213221, -6.573536, 0, 1.5, 0.5, 0.5
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
-3.387172, -2, -5.699686,
-3.387172, 2, -5.699686,
-3.387172, -2, -5.699686,
-3.545099, -2, -5.99097,
-3.387172, -1, -5.699686,
-3.545099, -1, -5.99097,
-3.387172, 0, -5.699686,
-3.545099, 0, -5.99097,
-3.387172, 1, -5.699686,
-3.545099, 1, -5.99097,
-3.387172, 2, -5.699686,
-3.545099, 2, -5.99097
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
-3.860954, -2, -6.573536, 0, -0.5, 0.5, 0.5,
-3.860954, -2, -6.573536, 1, -0.5, 0.5, 0.5,
-3.860954, -2, -6.573536, 1, 1.5, 0.5, 0.5,
-3.860954, -2, -6.573536, 0, 1.5, 0.5, 0.5,
-3.860954, -1, -6.573536, 0, -0.5, 0.5, 0.5,
-3.860954, -1, -6.573536, 1, -0.5, 0.5, 0.5,
-3.860954, -1, -6.573536, 1, 1.5, 0.5, 0.5,
-3.860954, -1, -6.573536, 0, 1.5, 0.5, 0.5,
-3.860954, 0, -6.573536, 0, -0.5, 0.5, 0.5,
-3.860954, 0, -6.573536, 1, -0.5, 0.5, 0.5,
-3.860954, 0, -6.573536, 1, 1.5, 0.5, 0.5,
-3.860954, 0, -6.573536, 0, 1.5, 0.5, 0.5,
-3.860954, 1, -6.573536, 0, -0.5, 0.5, 0.5,
-3.860954, 1, -6.573536, 1, -0.5, 0.5, 0.5,
-3.860954, 1, -6.573536, 1, 1.5, 0.5, 0.5,
-3.860954, 1, -6.573536, 0, 1.5, 0.5, 0.5,
-3.860954, 2, -6.573536, 0, -0.5, 0.5, 0.5,
-3.860954, 2, -6.573536, 1, -0.5, 0.5, 0.5,
-3.860954, 2, -6.573536, 1, 1.5, 0.5, 0.5,
-3.860954, 2, -6.573536, 0, 1.5, 0.5, 0.5
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
-3.387172, -2.783638, -4,
-3.387172, -2.783638, 4,
-3.387172, -2.783638, -4,
-3.545099, -2.926832, -4,
-3.387172, -2.783638, -2,
-3.545099, -2.926832, -2,
-3.387172, -2.783638, 0,
-3.545099, -2.926832, 0,
-3.387172, -2.783638, 2,
-3.545099, -2.926832, 2,
-3.387172, -2.783638, 4,
-3.545099, -2.926832, 4
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
-3.860954, -3.213221, -4, 0, -0.5, 0.5, 0.5,
-3.860954, -3.213221, -4, 1, -0.5, 0.5, 0.5,
-3.860954, -3.213221, -4, 1, 1.5, 0.5, 0.5,
-3.860954, -3.213221, -4, 0, 1.5, 0.5, 0.5,
-3.860954, -3.213221, -2, 0, -0.5, 0.5, 0.5,
-3.860954, -3.213221, -2, 1, -0.5, 0.5, 0.5,
-3.860954, -3.213221, -2, 1, 1.5, 0.5, 0.5,
-3.860954, -3.213221, -2, 0, 1.5, 0.5, 0.5,
-3.860954, -3.213221, 0, 0, -0.5, 0.5, 0.5,
-3.860954, -3.213221, 0, 1, -0.5, 0.5, 0.5,
-3.860954, -3.213221, 0, 1, 1.5, 0.5, 0.5,
-3.860954, -3.213221, 0, 0, 1.5, 0.5, 0.5,
-3.860954, -3.213221, 2, 0, -0.5, 0.5, 0.5,
-3.860954, -3.213221, 2, 1, -0.5, 0.5, 0.5,
-3.860954, -3.213221, 2, 1, 1.5, 0.5, 0.5,
-3.860954, -3.213221, 2, 0, 1.5, 0.5, 0.5,
-3.860954, -3.213221, 4, 0, -0.5, 0.5, 0.5,
-3.860954, -3.213221, 4, 1, -0.5, 0.5, 0.5,
-3.860954, -3.213221, 4, 1, 1.5, 0.5, 0.5,
-3.860954, -3.213221, 4, 0, 1.5, 0.5, 0.5
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
-3.387172, -2.783638, -5.699686,
-3.387172, 2.944143, -5.699686,
-3.387172, -2.783638, 5.951652,
-3.387172, 2.944143, 5.951652,
-3.387172, -2.783638, -5.699686,
-3.387172, -2.783638, 5.951652,
-3.387172, 2.944143, -5.699686,
-3.387172, 2.944143, 5.951652,
-3.387172, -2.783638, -5.699686,
2.929919, -2.783638, -5.699686,
-3.387172, -2.783638, 5.951652,
2.929919, -2.783638, 5.951652,
-3.387172, 2.944143, -5.699686,
2.929919, 2.944143, -5.699686,
-3.387172, 2.944143, 5.951652,
2.929919, 2.944143, 5.951652,
2.929919, -2.783638, -5.699686,
2.929919, 2.944143, -5.699686,
2.929919, -2.783638, 5.951652,
2.929919, 2.944143, 5.951652,
2.929919, -2.783638, -5.699686,
2.929919, -2.783638, 5.951652,
2.929919, 2.944143, -5.699686,
2.929919, 2.944143, 5.951652
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
var radius = 7.709814;
var distance = 34.30183;
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
mvMatrix.translate( 0.2286264, -0.08025253, -0.125983 );
mvMatrix.scale( 1.319595, 1.455363, 0.7154545 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.30183);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
difenoxuron<-read.table("difenoxuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-difenoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
```

```r
y<-difenoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
```

```r
z<-difenoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenoxuron' not found
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
-3.295176, -0.129159, -1.583031, 0, 0, 1, 1, 1,
-3.07462, 0.1371922, -1.779261, 1, 0, 0, 1, 1,
-2.82195, 1.071589, -0.2457629, 1, 0, 0, 1, 1,
-2.764841, 0.8678558, 0.115459, 1, 0, 0, 1, 1,
-2.762025, -0.6700894, 0.4409952, 1, 0, 0, 1, 1,
-2.746369, -0.8303751, -1.504276, 1, 0, 0, 1, 1,
-2.684884, -0.7861456, -2.791654, 0, 0, 0, 1, 1,
-2.632236, 1.747405, -0.8750404, 0, 0, 0, 1, 1,
-2.334257, 0.3560618, -0.1146399, 0, 0, 0, 1, 1,
-2.299422, -0.2589819, -1.730395, 0, 0, 0, 1, 1,
-2.184469, -1.126867, -0.6132606, 0, 0, 0, 1, 1,
-2.165862, 1.726908, -2.888166, 0, 0, 0, 1, 1,
-2.105195, -1.384008, -2.083406, 0, 0, 0, 1, 1,
-2.103298, -0.2662948, -2.110009, 1, 1, 1, 1, 1,
-2.096082, 1.088866, -0.7386324, 1, 1, 1, 1, 1,
-2.092592, -1.219557, -4.646188, 1, 1, 1, 1, 1,
-2.052769, 0.2274024, -3.851144, 1, 1, 1, 1, 1,
-2.043381, -0.5017909, -0.276497, 1, 1, 1, 1, 1,
-2.010594, -1.401431, -2.505412, 1, 1, 1, 1, 1,
-1.995386, 0.2591655, -1.873395, 1, 1, 1, 1, 1,
-1.973414, 0.4479016, -0.3721037, 1, 1, 1, 1, 1,
-1.957356, -0.9229471, -2.309062, 1, 1, 1, 1, 1,
-1.932298, 0.5778903, -0.7318434, 1, 1, 1, 1, 1,
-1.927589, -0.0637348, -1.927908, 1, 1, 1, 1, 1,
-1.897204, -0.1738345, -0.406177, 1, 1, 1, 1, 1,
-1.887531, -1.188366, -2.051076, 1, 1, 1, 1, 1,
-1.868723, -0.1262315, -2.400151, 1, 1, 1, 1, 1,
-1.865035, 1.403374, 0.4837338, 1, 1, 1, 1, 1,
-1.861909, -0.7877508, -1.900179, 0, 0, 1, 1, 1,
-1.857423, -0.825403, -1.213722, 1, 0, 0, 1, 1,
-1.854958, 2.488312, -0.3622153, 1, 0, 0, 1, 1,
-1.852775, 0.1571636, -3.007832, 1, 0, 0, 1, 1,
-1.832497, 0.9158976, -1.779112, 1, 0, 0, 1, 1,
-1.818889, 1.014419, -0.4081902, 1, 0, 0, 1, 1,
-1.79712, -1.154391, -2.893511, 0, 0, 0, 1, 1,
-1.790115, -0.1283875, -0.4727279, 0, 0, 0, 1, 1,
-1.788255, -0.6134132, -2.098885, 0, 0, 0, 1, 1,
-1.787096, -0.8590618, -0.4919505, 0, 0, 0, 1, 1,
-1.777284, -1.012961, -4.26757, 0, 0, 0, 1, 1,
-1.776384, -1.359478, -1.092087, 0, 0, 0, 1, 1,
-1.763908, 0.3594192, -0.2916147, 0, 0, 0, 1, 1,
-1.749986, 1.212549, -1.610284, 1, 1, 1, 1, 1,
-1.739383, 1.681769, -2.638574, 1, 1, 1, 1, 1,
-1.738742, 0.3337294, -2.156804, 1, 1, 1, 1, 1,
-1.736373, -0.1904171, -2.709297, 1, 1, 1, 1, 1,
-1.735759, -1.230568, -2.610999, 1, 1, 1, 1, 1,
-1.732232, -0.6149563, -3.279311, 1, 1, 1, 1, 1,
-1.725785, -0.1562951, -0.01600546, 1, 1, 1, 1, 1,
-1.706616, -0.1726359, -2.122413, 1, 1, 1, 1, 1,
-1.677591, 0.7036701, -2.167404, 1, 1, 1, 1, 1,
-1.675961, 0.2777115, -1.445308, 1, 1, 1, 1, 1,
-1.671152, -0.2130725, -2.194915, 1, 1, 1, 1, 1,
-1.655917, -0.5382987, -3.2584, 1, 1, 1, 1, 1,
-1.639313, 1.371272, -1.082362, 1, 1, 1, 1, 1,
-1.627139, 0.5286217, -1.08563, 1, 1, 1, 1, 1,
-1.607165, 0.7501889, -0.4254552, 1, 1, 1, 1, 1,
-1.591464, -0.2865789, -3.49773, 0, 0, 1, 1, 1,
-1.579236, 0.6956237, 0.05840868, 1, 0, 0, 1, 1,
-1.56586, -0.5384725, -2.644558, 1, 0, 0, 1, 1,
-1.553247, -0.3046676, -0.208003, 1, 0, 0, 1, 1,
-1.551592, 0.3621517, -0.6057361, 1, 0, 0, 1, 1,
-1.548774, -0.9465275, -3.132727, 1, 0, 0, 1, 1,
-1.548593, -1.685837, -2.908369, 0, 0, 0, 1, 1,
-1.540542, -0.8355323, -3.384141, 0, 0, 0, 1, 1,
-1.531646, 1.234573, -1.070271, 0, 0, 0, 1, 1,
-1.525861, -1.213916, -1.08542, 0, 0, 0, 1, 1,
-1.52179, 0.8947805, -0.5188281, 0, 0, 0, 1, 1,
-1.516874, 0.8006671, -1.118637, 0, 0, 0, 1, 1,
-1.500135, -0.8724972, -2.024966, 0, 0, 0, 1, 1,
-1.495395, -0.8109407, -2.142959, 1, 1, 1, 1, 1,
-1.48865, -0.1207636, 0.3674645, 1, 1, 1, 1, 1,
-1.486734, 0.3729799, -0.2287422, 1, 1, 1, 1, 1,
-1.481347, -1.342473, -1.841579, 1, 1, 1, 1, 1,
-1.480262, 1.936389, 0.3660387, 1, 1, 1, 1, 1,
-1.475462, -0.7669706, -3.023274, 1, 1, 1, 1, 1,
-1.473711, -1.62671, -1.416625, 1, 1, 1, 1, 1,
-1.469548, -0.4488917, -1.441494, 1, 1, 1, 1, 1,
-1.446033, 0.0516839, -1.820907, 1, 1, 1, 1, 1,
-1.438383, -0.1883195, -3.343537, 1, 1, 1, 1, 1,
-1.426437, -1.284813, -1.906111, 1, 1, 1, 1, 1,
-1.418281, 0.8628583, -0.9032328, 1, 1, 1, 1, 1,
-1.417819, 1.528493, 0.5660578, 1, 1, 1, 1, 1,
-1.39471, -0.6696399, -0.5397947, 1, 1, 1, 1, 1,
-1.382065, -0.5970197, -1.912005, 1, 1, 1, 1, 1,
-1.379899, 0.02372621, -2.882086, 0, 0, 1, 1, 1,
-1.378084, 1.063392, -1.06985, 1, 0, 0, 1, 1,
-1.337914, 2.064958, 0.3965859, 1, 0, 0, 1, 1,
-1.334339, -0.4029413, -3.348915, 1, 0, 0, 1, 1,
-1.322786, -0.575092, -0.7214451, 1, 0, 0, 1, 1,
-1.317791, -0.7335409, -1.575956, 1, 0, 0, 1, 1,
-1.312486, -0.7084402, -0.9646407, 0, 0, 0, 1, 1,
-1.311597, 1.822029, -2.392573, 0, 0, 0, 1, 1,
-1.308908, -0.5330475, -2.0126, 0, 0, 0, 1, 1,
-1.305032, 0.6305973, -1.375403, 0, 0, 0, 1, 1,
-1.304972, -0.8989468, -1.805532, 0, 0, 0, 1, 1,
-1.304158, -0.3147226, -2.595586, 0, 0, 0, 1, 1,
-1.298835, -0.01140663, -0.04222351, 0, 0, 0, 1, 1,
-1.278722, -0.6145751, -2.267587, 1, 1, 1, 1, 1,
-1.270515, 0.3169461, 0.3223457, 1, 1, 1, 1, 1,
-1.265818, -0.2063485, -2.048855, 1, 1, 1, 1, 1,
-1.265374, 1.240073, -0.2841041, 1, 1, 1, 1, 1,
-1.264313, 0.7504814, -1.40219, 1, 1, 1, 1, 1,
-1.262697, 0.2403979, -2.66965, 1, 1, 1, 1, 1,
-1.256864, -1.030177, -3.651089, 1, 1, 1, 1, 1,
-1.25252, 0.9387768, -2.782861, 1, 1, 1, 1, 1,
-1.235913, -1.815907, -1.696044, 1, 1, 1, 1, 1,
-1.234412, -0.8711154, -1.559822, 1, 1, 1, 1, 1,
-1.229233, 1.540684, 0.5661606, 1, 1, 1, 1, 1,
-1.226361, -0.1735284, -0.7231582, 1, 1, 1, 1, 1,
-1.222171, -0.3750306, -0.9713615, 1, 1, 1, 1, 1,
-1.215899, -0.8233403, -4.299312, 1, 1, 1, 1, 1,
-1.215695, -0.3484533, -0.6545898, 1, 1, 1, 1, 1,
-1.21487, -1.269893, -4.190256, 0, 0, 1, 1, 1,
-1.214665, -1.409658, -4.136383, 1, 0, 0, 1, 1,
-1.212737, -0.2621918, -0.2502931, 1, 0, 0, 1, 1,
-1.201027, 0.1676541, -2.053136, 1, 0, 0, 1, 1,
-1.200638, 1.903403, -0.6387981, 1, 0, 0, 1, 1,
-1.193332, -1.332112, -4.191014, 1, 0, 0, 1, 1,
-1.177671, -0.7014071, -1.905974, 0, 0, 0, 1, 1,
-1.17487, 1.057831, -0.3006827, 0, 0, 0, 1, 1,
-1.162127, -0.01400776, -3.230604, 0, 0, 0, 1, 1,
-1.1601, -1.291252, -2.707627, 0, 0, 0, 1, 1,
-1.15432, -1.434877, -1.858275, 0, 0, 0, 1, 1,
-1.152788, 0.2626927, -0.9021805, 0, 0, 0, 1, 1,
-1.150325, 1.246148, -2.531365, 0, 0, 0, 1, 1,
-1.149007, 1.041857, 2.417884, 1, 1, 1, 1, 1,
-1.147113, -1.953552, -2.998672, 1, 1, 1, 1, 1,
-1.145926, -0.6073077, -0.9945349, 1, 1, 1, 1, 1,
-1.14026, 1.581367, -0.8333058, 1, 1, 1, 1, 1,
-1.1385, 0.4042847, -1.626053, 1, 1, 1, 1, 1,
-1.137886, 1.2872, -0.6215132, 1, 1, 1, 1, 1,
-1.137092, 0.6396285, -0.8170183, 1, 1, 1, 1, 1,
-1.124004, -0.1842925, -1.575799, 1, 1, 1, 1, 1,
-1.121707, -0.3014746, -3.845892, 1, 1, 1, 1, 1,
-1.113238, -0.7143437, -2.555689, 1, 1, 1, 1, 1,
-1.112994, 0.3214063, -0.8150644, 1, 1, 1, 1, 1,
-1.106686, -0.3753428, -1.918442, 1, 1, 1, 1, 1,
-1.105357, -1.239074, -2.554671, 1, 1, 1, 1, 1,
-1.102822, -1.190218, -2.356564, 1, 1, 1, 1, 1,
-1.102264, -0.7977341, -1.21653, 1, 1, 1, 1, 1,
-1.096226, 0.1274799, -1.728064, 0, 0, 1, 1, 1,
-1.096209, -0.2367425, -3.224717, 1, 0, 0, 1, 1,
-1.094954, -0.6214817, -3.321275, 1, 0, 0, 1, 1,
-1.094311, -0.5926309, -2.551013, 1, 0, 0, 1, 1,
-1.091911, -1.19295, -3.41359, 1, 0, 0, 1, 1,
-1.091217, -0.799159, -1.926453, 1, 0, 0, 1, 1,
-1.087977, -0.6933506, -1.531799, 0, 0, 0, 1, 1,
-1.08342, 0.6490901, -1.545755, 0, 0, 0, 1, 1,
-1.077377, 0.9273897, 0.07845014, 0, 0, 0, 1, 1,
-1.067382, 1.212172, -0.07228515, 0, 0, 0, 1, 1,
-1.056693, -0.7996674, -2.487201, 0, 0, 0, 1, 1,
-1.05462, 0.9590709, 1.515902, 0, 0, 0, 1, 1,
-1.046821, -0.5143878, -1.586021, 0, 0, 0, 1, 1,
-1.044296, 0.70546, -1.64434, 1, 1, 1, 1, 1,
-1.041776, -0.1710599, -1.958271, 1, 1, 1, 1, 1,
-1.039083, -1.154242, -3.868743, 1, 1, 1, 1, 1,
-1.038917, -1.585023, -4.190012, 1, 1, 1, 1, 1,
-1.017456, 0.7793664, -2.413409, 1, 1, 1, 1, 1,
-1.012331, 0.006457444, -0.9406828, 1, 1, 1, 1, 1,
-1.00535, -1.918199, -2.316595, 1, 1, 1, 1, 1,
-1.002141, 1.415781, 0.03496105, 1, 1, 1, 1, 1,
-0.9858556, 0.5525005, -0.7997317, 1, 1, 1, 1, 1,
-0.9812742, 0.8671046, -2.636613, 1, 1, 1, 1, 1,
-0.9751266, 1.626455, 0.643628, 1, 1, 1, 1, 1,
-0.9736555, 0.1082597, -2.049111, 1, 1, 1, 1, 1,
-0.9709815, 0.9031149, -1.430108, 1, 1, 1, 1, 1,
-0.9666352, -1.929561, -3.461134, 1, 1, 1, 1, 1,
-0.9646012, 0.9481663, 0.1072088, 1, 1, 1, 1, 1,
-0.9578574, -0.7699223, -0.7484397, 0, 0, 1, 1, 1,
-0.9577385, -0.1184925, -1.432207, 1, 0, 0, 1, 1,
-0.9548166, -0.8522395, -1.744023, 1, 0, 0, 1, 1,
-0.9450252, -0.5906214, -1.684757, 1, 0, 0, 1, 1,
-0.9432465, -0.4642099, -0.2015433, 1, 0, 0, 1, 1,
-0.9421312, -0.2853892, -1.814794, 1, 0, 0, 1, 1,
-0.9404434, -0.8867782, -3.246008, 0, 0, 0, 1, 1,
-0.937169, -1.119892, -2.076802, 0, 0, 0, 1, 1,
-0.9322409, -1.210169, -1.573087, 0, 0, 0, 1, 1,
-0.9232664, 1.702085, -0.9206979, 0, 0, 0, 1, 1,
-0.9201568, -0.1336609, -0.161547, 0, 0, 0, 1, 1,
-0.9196015, -0.09328085, -3.680413, 0, 0, 0, 1, 1,
-0.9173018, 0.6483056, -0.5926958, 0, 0, 0, 1, 1,
-0.9113622, 0.5432387, -1.361565, 1, 1, 1, 1, 1,
-0.907176, 0.1194935, -1.712477, 1, 1, 1, 1, 1,
-0.9061089, -1.103431, -1.548949, 1, 1, 1, 1, 1,
-0.9031686, 0.1762799, -0.8268981, 1, 1, 1, 1, 1,
-0.9004853, -0.6373477, -0.4108205, 1, 1, 1, 1, 1,
-0.899088, -0.2651685, -0.9089428, 1, 1, 1, 1, 1,
-0.8973131, 0.8844554, 0.3786181, 1, 1, 1, 1, 1,
-0.8956984, 0.03969587, -1.348171, 1, 1, 1, 1, 1,
-0.8853419, -0.4800225, -2.282521, 1, 1, 1, 1, 1,
-0.8844392, -0.09595311, -1.621531, 1, 1, 1, 1, 1,
-0.8815516, -1.532162, -2.331541, 1, 1, 1, 1, 1,
-0.8804395, 0.9768045, 0.6452479, 1, 1, 1, 1, 1,
-0.8757237, 0.2082568, -1.339852, 1, 1, 1, 1, 1,
-0.872709, -0.8698048, -2.306772, 1, 1, 1, 1, 1,
-0.8700747, 1.294519, -1.383849, 1, 1, 1, 1, 1,
-0.8682101, 1.022056, 0.06490865, 0, 0, 1, 1, 1,
-0.8671556, 0.9320646, -0.3901567, 1, 0, 0, 1, 1,
-0.8625273, 0.3295172, -0.3700121, 1, 0, 0, 1, 1,
-0.8620421, 0.8192329, -0.3464167, 1, 0, 0, 1, 1,
-0.8605999, 0.0818046, -0.6441091, 1, 0, 0, 1, 1,
-0.8604183, 1.673076, 0.6991725, 1, 0, 0, 1, 1,
-0.858284, -0.9196801, -2.094006, 0, 0, 0, 1, 1,
-0.8529954, -1.256222, -0.348997, 0, 0, 0, 1, 1,
-0.8524409, 0.7016823, -0.9836149, 0, 0, 0, 1, 1,
-0.8522494, -0.05493848, -2.179135, 0, 0, 0, 1, 1,
-0.8497316, 0.575839, 0.4906975, 0, 0, 0, 1, 1,
-0.8476031, -0.9917343, -3.63576, 0, 0, 0, 1, 1,
-0.8465056, 0.03592611, -0.9871321, 0, 0, 0, 1, 1,
-0.8452383, -0.1708795, -2.790813, 1, 1, 1, 1, 1,
-0.8435525, 0.4243005, -1.132533, 1, 1, 1, 1, 1,
-0.8417231, 0.9488254, -0.1914752, 1, 1, 1, 1, 1,
-0.8414533, -0.909207, -4.742062, 1, 1, 1, 1, 1,
-0.8306087, 0.3260053, -1.618787, 1, 1, 1, 1, 1,
-0.8294633, -0.1195696, -0.6516232, 1, 1, 1, 1, 1,
-0.8246469, 0.2466598, -0.8759741, 1, 1, 1, 1, 1,
-0.8220167, 1.196139, -0.1704072, 1, 1, 1, 1, 1,
-0.8216339, -0.1783433, -1.978231, 1, 1, 1, 1, 1,
-0.8178058, -0.1614953, -2.660875, 1, 1, 1, 1, 1,
-0.8143735, 1.310414, -1.536392, 1, 1, 1, 1, 1,
-0.8120915, 0.7834409, -1.838907, 1, 1, 1, 1, 1,
-0.8116919, 1.614116, 0.4014525, 1, 1, 1, 1, 1,
-0.8114742, 1.206638, -0.8957856, 1, 1, 1, 1, 1,
-0.8097744, 1.328385, -0.4780999, 1, 1, 1, 1, 1,
-0.8075044, -1.042263, -3.050526, 0, 0, 1, 1, 1,
-0.7978432, -1.281245, -1.498482, 1, 0, 0, 1, 1,
-0.7943988, -0.1696655, -1.959616, 1, 0, 0, 1, 1,
-0.789314, -0.3633503, -1.141201, 1, 0, 0, 1, 1,
-0.7741725, 1.011156, 0.8894895, 1, 0, 0, 1, 1,
-0.7715169, 0.3619182, -1.892182, 1, 0, 0, 1, 1,
-0.7671615, 1.808688, -2.163952, 0, 0, 0, 1, 1,
-0.7664607, 1.452826, 1.287931, 0, 0, 0, 1, 1,
-0.7656757, 0.4536117, -2.708172, 0, 0, 0, 1, 1,
-0.7532648, -0.7238008, -3.617247, 0, 0, 0, 1, 1,
-0.7463378, 0.2291119, -0.724938, 0, 0, 0, 1, 1,
-0.7436877, -0.4061693, -3.287056, 0, 0, 0, 1, 1,
-0.7325323, 0.5642102, -2.819648, 0, 0, 0, 1, 1,
-0.7313483, 0.3307602, -2.660745, 1, 1, 1, 1, 1,
-0.7283809, 0.005022341, 0.519494, 1, 1, 1, 1, 1,
-0.7273192, 0.3683876, -1.491902, 1, 1, 1, 1, 1,
-0.7234346, -1.09048, -1.071943, 1, 1, 1, 1, 1,
-0.7214938, -0.9675811, -4.429885, 1, 1, 1, 1, 1,
-0.7205086, -1.001697, -3.326069, 1, 1, 1, 1, 1,
-0.7137769, -0.9423493, -0.976805, 1, 1, 1, 1, 1,
-0.7134228, -1.157102, -3.200975, 1, 1, 1, 1, 1,
-0.7092494, 0.3125643, -1.98224, 1, 1, 1, 1, 1,
-0.7070876, -0.7809982, -1.695295, 1, 1, 1, 1, 1,
-0.7065918, 1.145921, 1.327631, 1, 1, 1, 1, 1,
-0.7009444, -0.7730031, -2.290255, 1, 1, 1, 1, 1,
-0.7008199, 0.1577778, -1.070395, 1, 1, 1, 1, 1,
-0.6990954, 0.4018051, -2.023414, 1, 1, 1, 1, 1,
-0.6972552, -1.123621, -2.724404, 1, 1, 1, 1, 1,
-0.6937531, -0.9074878, -2.018885, 0, 0, 1, 1, 1,
-0.6901964, -1.296757, -1.431444, 1, 0, 0, 1, 1,
-0.6863585, -0.1433543, -1.771679, 1, 0, 0, 1, 1,
-0.6856151, -1.557872, -5.311497, 1, 0, 0, 1, 1,
-0.6829734, 0.5065171, -0.0906835, 1, 0, 0, 1, 1,
-0.6820732, 0.137379, -1.888001, 1, 0, 0, 1, 1,
-0.6806089, -0.05838439, -0.8274938, 0, 0, 0, 1, 1,
-0.676524, 0.4193973, -0.948328, 0, 0, 0, 1, 1,
-0.6687243, 2.287117, -1.075383, 0, 0, 0, 1, 1,
-0.6584114, 0.9399291, 0.6873828, 0, 0, 0, 1, 1,
-0.6573887, 1.059641, -0.7044029, 0, 0, 0, 1, 1,
-0.6514925, 0.2345993, -0.4068092, 0, 0, 0, 1, 1,
-0.6510738, 0.8870816, -0.03140196, 0, 0, 0, 1, 1,
-0.6509855, -0.3205152, -2.233495, 1, 1, 1, 1, 1,
-0.6487712, -0.903482, -3.026187, 1, 1, 1, 1, 1,
-0.6384369, -1.194546, -1.515023, 1, 1, 1, 1, 1,
-0.6382628, 0.2520757, -1.064773, 1, 1, 1, 1, 1,
-0.637637, -0.7717991, -2.614086, 1, 1, 1, 1, 1,
-0.6306576, 0.1188122, -2.384283, 1, 1, 1, 1, 1,
-0.6272857, -0.1865463, -0.8957884, 1, 1, 1, 1, 1,
-0.6237133, 0.6229934, 0.333764, 1, 1, 1, 1, 1,
-0.6236804, -0.8402542, -3.513853, 1, 1, 1, 1, 1,
-0.6215872, 0.9253197, -0.5747656, 1, 1, 1, 1, 1,
-0.6202784, 1.288267, 1.92688, 1, 1, 1, 1, 1,
-0.6195984, -1.201888, -3.07507, 1, 1, 1, 1, 1,
-0.6195307, -0.200321, -2.010889, 1, 1, 1, 1, 1,
-0.6194761, -1.324774, 0.3500733, 1, 1, 1, 1, 1,
-0.6180803, 0.3481047, -1.260031, 1, 1, 1, 1, 1,
-0.614782, 0.2820457, -0.8716578, 0, 0, 1, 1, 1,
-0.6036674, -0.200199, -1.45638, 1, 0, 0, 1, 1,
-0.5983147, -0.8595313, -3.567839, 1, 0, 0, 1, 1,
-0.5922709, -0.9667403, -3.616739, 1, 0, 0, 1, 1,
-0.5812317, 0.5576445, -0.3221892, 1, 0, 0, 1, 1,
-0.5790738, 1.029031, -1.732231, 1, 0, 0, 1, 1,
-0.5781367, 0.4749133, -2.535905, 0, 0, 0, 1, 1,
-0.571689, 0.8986005, 0.5221494, 0, 0, 0, 1, 1,
-0.5703194, -0.2275821, -2.794139, 0, 0, 0, 1, 1,
-0.5680346, 0.6620654, -0.2709593, 0, 0, 0, 1, 1,
-0.561699, -0.7152792, -2.220608, 0, 0, 0, 1, 1,
-0.5527124, 1.269795, -1.302381, 0, 0, 0, 1, 1,
-0.5521113, 0.06306902, -3.205187, 0, 0, 0, 1, 1,
-0.5516335, -0.8226717, -1.884404, 1, 1, 1, 1, 1,
-0.5501162, -1.755112, -2.338746, 1, 1, 1, 1, 1,
-0.5496093, -1.555959, -1.772475, 1, 1, 1, 1, 1,
-0.5485781, 2.085388, -1.478994, 1, 1, 1, 1, 1,
-0.5455173, -1.79854, -3.672388, 1, 1, 1, 1, 1,
-0.5447661, -0.2436082, -1.478172, 1, 1, 1, 1, 1,
-0.5375473, 0.4850257, -0.2476196, 1, 1, 1, 1, 1,
-0.5369202, -0.3557535, -3.050991, 1, 1, 1, 1, 1,
-0.5352886, -0.9931238, -1.824966, 1, 1, 1, 1, 1,
-0.5335153, 1.375108, -1.20693, 1, 1, 1, 1, 1,
-0.5252779, -1.168796, -3.710507, 1, 1, 1, 1, 1,
-0.5235478, -1.26327, -2.473301, 1, 1, 1, 1, 1,
-0.5193428, 0.2834934, -1.660281, 1, 1, 1, 1, 1,
-0.5182335, 1.102809, -0.6278076, 1, 1, 1, 1, 1,
-0.5181351, 1.719628, -0.3133534, 1, 1, 1, 1, 1,
-0.5161613, -1.144988, -2.278419, 0, 0, 1, 1, 1,
-0.5140387, 0.1353609, -2.015146, 1, 0, 0, 1, 1,
-0.509399, -0.2746129, -2.26898, 1, 0, 0, 1, 1,
-0.5070885, -1.304443, -2.514356, 1, 0, 0, 1, 1,
-0.5061798, -1.778315, -2.451684, 1, 0, 0, 1, 1,
-0.5029165, 1.358145, -1.958997, 1, 0, 0, 1, 1,
-0.4996901, -1.327841, -2.473501, 0, 0, 0, 1, 1,
-0.4979597, -1.020607, -3.141318, 0, 0, 0, 1, 1,
-0.4965642, 0.7060434, -1.21664, 0, 0, 0, 1, 1,
-0.4960696, 0.872333, -0.05866225, 0, 0, 0, 1, 1,
-0.4950129, -0.2465868, -1.636667, 0, 0, 0, 1, 1,
-0.4941105, 0.6585366, 1.307069, 0, 0, 0, 1, 1,
-0.4846016, 0.2531038, -2.706523, 0, 0, 0, 1, 1,
-0.4828219, -1.352629, -2.999543, 1, 1, 1, 1, 1,
-0.4802881, 0.4854734, -1.031783, 1, 1, 1, 1, 1,
-0.479065, -0.6866326, -2.271847, 1, 1, 1, 1, 1,
-0.4757802, -1.151636, -2.980279, 1, 1, 1, 1, 1,
-0.4749048, -0.6451622, -1.832959, 1, 1, 1, 1, 1,
-0.4715935, -1.332819, -3.251715, 1, 1, 1, 1, 1,
-0.4709612, -0.4844302, 0.3347765, 1, 1, 1, 1, 1,
-0.4680374, -1.074872, -0.5986958, 1, 1, 1, 1, 1,
-0.4670892, 1.979042, -0.868113, 1, 1, 1, 1, 1,
-0.4649597, 0.1925547, -3.911585, 1, 1, 1, 1, 1,
-0.4645886, -1.026957, -3.136643, 1, 1, 1, 1, 1,
-0.4645256, 0.08520333, -1.876953, 1, 1, 1, 1, 1,
-0.4588501, 0.5827957, 0.1553427, 1, 1, 1, 1, 1,
-0.4569317, -0.598874, -2.005688, 1, 1, 1, 1, 1,
-0.4555421, 0.4998293, 0.9462938, 1, 1, 1, 1, 1,
-0.4528991, 0.3106609, -0.4746679, 0, 0, 1, 1, 1,
-0.4486413, 0.3613573, 0.4725986, 1, 0, 0, 1, 1,
-0.4485678, 0.9486536, -0.1855832, 1, 0, 0, 1, 1,
-0.4458863, 1.639542, -1.679983, 1, 0, 0, 1, 1,
-0.445451, -0.1272403, -1.336241, 1, 0, 0, 1, 1,
-0.4439732, 0.9298773, -0.05449498, 1, 0, 0, 1, 1,
-0.4360223, 1.299121, -0.6754861, 0, 0, 0, 1, 1,
-0.4294291, -0.5222803, -1.651546, 0, 0, 0, 1, 1,
-0.4255655, 0.635093, -1.738907, 0, 0, 0, 1, 1,
-0.4241992, -0.6479043, -1.580066, 0, 0, 0, 1, 1,
-0.4235411, -1.249899, -3.526461, 0, 0, 0, 1, 1,
-0.419057, -1.447573, -1.031657, 0, 0, 0, 1, 1,
-0.4067885, -0.5727769, -1.069891, 0, 0, 0, 1, 1,
-0.4055181, 0.1233974, -2.243571, 1, 1, 1, 1, 1,
-0.405082, -0.2362799, -0.6045046, 1, 1, 1, 1, 1,
-0.3982511, -0.1272, -0.6797997, 1, 1, 1, 1, 1,
-0.3969524, -0.04910005, -2.577666, 1, 1, 1, 1, 1,
-0.3960652, -0.02714917, -2.345037, 1, 1, 1, 1, 1,
-0.3954442, 0.07908465, -1.412521, 1, 1, 1, 1, 1,
-0.3943618, 0.5793948, -0.3810075, 1, 1, 1, 1, 1,
-0.393349, -0.326481, -3.0806, 1, 1, 1, 1, 1,
-0.3927404, -0.2061345, -1.858851, 1, 1, 1, 1, 1,
-0.3888169, -0.6559542, -0.5099725, 1, 1, 1, 1, 1,
-0.3881902, 0.5526775, -0.3858354, 1, 1, 1, 1, 1,
-0.3879214, 0.3485156, -1.156039, 1, 1, 1, 1, 1,
-0.386873, 0.2065084, 0.0120044, 1, 1, 1, 1, 1,
-0.3795357, 0.123782, -0.8248219, 1, 1, 1, 1, 1,
-0.3733555, 0.381515, -0.92084, 1, 1, 1, 1, 1,
-0.3656979, 0.9807198, 0.1828583, 0, 0, 1, 1, 1,
-0.3637912, -0.6165864, -4.1832, 1, 0, 0, 1, 1,
-0.3586102, 0.8123053, -0.7499356, 1, 0, 0, 1, 1,
-0.3566655, 1.030518, -2.010611, 1, 0, 0, 1, 1,
-0.3563479, -0.8048307, -2.595638, 1, 0, 0, 1, 1,
-0.3544703, 0.7623611, 0.7861961, 1, 0, 0, 1, 1,
-0.351895, 0.6811686, -0.9488775, 0, 0, 0, 1, 1,
-0.3494829, -0.5452561, -4.155856, 0, 0, 0, 1, 1,
-0.3483886, -0.1787761, -1.739514, 0, 0, 0, 1, 1,
-0.3465493, -0.313197, -1.417023, 0, 0, 0, 1, 1,
-0.345788, 0.6824811, -1.797089, 0, 0, 0, 1, 1,
-0.3420957, 1.383387, -0.1895712, 0, 0, 0, 1, 1,
-0.3420864, 0.1414415, -0.4434524, 0, 0, 0, 1, 1,
-0.3388768, -0.216983, -2.419875, 1, 1, 1, 1, 1,
-0.3374456, 0.6933478, -1.140219, 1, 1, 1, 1, 1,
-0.3355182, 0.6848429, 0.3546597, 1, 1, 1, 1, 1,
-0.3254673, 1.051893, -1.608545, 1, 1, 1, 1, 1,
-0.3244871, -0.485532, -2.887846, 1, 1, 1, 1, 1,
-0.3221063, 0.8550438, 0.4488015, 1, 1, 1, 1, 1,
-0.3196771, 0.2625514, -2.317802, 1, 1, 1, 1, 1,
-0.3150847, -1.212325, -2.797368, 1, 1, 1, 1, 1,
-0.3116719, -0.7566175, -2.982214, 1, 1, 1, 1, 1,
-0.3056022, -0.739775, -1.500678, 1, 1, 1, 1, 1,
-0.3055063, -0.5333957, -1.963382, 1, 1, 1, 1, 1,
-0.3044111, 0.7850183, 0.5429341, 1, 1, 1, 1, 1,
-0.3035233, 0.1513467, -1.331173, 1, 1, 1, 1, 1,
-0.301912, -0.4131415, -1.774983, 1, 1, 1, 1, 1,
-0.3009458, -0.1013724, -3.07987, 1, 1, 1, 1, 1,
-0.2956659, 0.5288356, -1.214078, 0, 0, 1, 1, 1,
-0.2946466, -1.867671, -4.964633, 1, 0, 0, 1, 1,
-0.2898456, -1.539569, -1.718033, 1, 0, 0, 1, 1,
-0.2868049, 0.742337, -1.127424, 1, 0, 0, 1, 1,
-0.2825278, 0.002120163, -1.106423, 1, 0, 0, 1, 1,
-0.2779133, -0.2203621, 0.3862292, 1, 0, 0, 1, 1,
-0.2771452, 0.3748209, -0.2534968, 0, 0, 0, 1, 1,
-0.2755281, -0.2521467, -3.476152, 0, 0, 0, 1, 1,
-0.2749735, -1.897852, -3.06982, 0, 0, 0, 1, 1,
-0.2588384, 0.5750837, -0.6155524, 0, 0, 0, 1, 1,
-0.2497642, 2.44259, 0.07440729, 0, 0, 0, 1, 1,
-0.2471211, -0.6028193, -2.736669, 0, 0, 0, 1, 1,
-0.2428899, -1.653842, -4.222475, 0, 0, 0, 1, 1,
-0.2387062, 1.491014, 0.118446, 1, 1, 1, 1, 1,
-0.2381596, -0.3214238, -2.360175, 1, 1, 1, 1, 1,
-0.2370185, -1.205021, -2.717019, 1, 1, 1, 1, 1,
-0.237013, 0.5646829, -1.375733, 1, 1, 1, 1, 1,
-0.2366135, 1.805726, -2.692909, 1, 1, 1, 1, 1,
-0.2357106, 0.3667935, -0.2276655, 1, 1, 1, 1, 1,
-0.2343301, -0.6015909, -2.851209, 1, 1, 1, 1, 1,
-0.2335802, 1.090218, 0.297241, 1, 1, 1, 1, 1,
-0.2310807, -0.1801828, -2.463945, 1, 1, 1, 1, 1,
-0.2299967, -1.269807, -3.332912, 1, 1, 1, 1, 1,
-0.2263991, -0.517482, -2.932562, 1, 1, 1, 1, 1,
-0.2203367, 1.630725, -2.849372, 1, 1, 1, 1, 1,
-0.2137485, -1.11847, -3.328864, 1, 1, 1, 1, 1,
-0.2134549, -0.02619493, -2.418355, 1, 1, 1, 1, 1,
-0.2129793, -1.813878, -4.174598, 1, 1, 1, 1, 1,
-0.2111373, -0.8946064, -2.296117, 0, 0, 1, 1, 1,
-0.2105067, -0.1691498, -3.317312, 1, 0, 0, 1, 1,
-0.2092543, 0.2774809, 0.4587943, 1, 0, 0, 1, 1,
-0.207672, 0.08382336, 0.8218771, 1, 0, 0, 1, 1,
-0.2065387, 0.6872606, -0.3620675, 1, 0, 0, 1, 1,
-0.2032431, -2.024956, -2.699701, 1, 0, 0, 1, 1,
-0.2016141, 1.226004, -0.0460979, 0, 0, 0, 1, 1,
-0.1995179, -0.7976507, -3.558665, 0, 0, 0, 1, 1,
-0.1990746, -1.424055, -2.018894, 0, 0, 0, 1, 1,
-0.1990599, -0.03427561, -3.176353, 0, 0, 0, 1, 1,
-0.1970893, 0.6565597, -1.337044, 0, 0, 0, 1, 1,
-0.1953764, -1.040897, -3.982775, 0, 0, 0, 1, 1,
-0.1939227, -0.04136255, -0.7904699, 0, 0, 0, 1, 1,
-0.1909055, -1.197554, -3.027429, 1, 1, 1, 1, 1,
-0.1907938, -0.1040147, -3.46847, 1, 1, 1, 1, 1,
-0.1837959, 0.1639303, -0.4877811, 1, 1, 1, 1, 1,
-0.1832751, 2.860729, 0.1646735, 1, 1, 1, 1, 1,
-0.1824247, 0.4133214, 0.3140642, 1, 1, 1, 1, 1,
-0.1773606, -0.2237018, -3.351213, 1, 1, 1, 1, 1,
-0.1676788, 0.3993931, -0.9450969, 1, 1, 1, 1, 1,
-0.1662715, -0.6323152, -3.245816, 1, 1, 1, 1, 1,
-0.1594706, -1.585409, -3.790448, 1, 1, 1, 1, 1,
-0.1529101, -1.461158, -3.482913, 1, 1, 1, 1, 1,
-0.1464922, 0.1236039, 0.4002385, 1, 1, 1, 1, 1,
-0.1457041, 0.5758258, -1.11479, 1, 1, 1, 1, 1,
-0.1450765, -0.3283255, -3.593604, 1, 1, 1, 1, 1,
-0.1384071, -1.002374, -2.171393, 1, 1, 1, 1, 1,
-0.1366608, -2.035223, -2.055253, 1, 1, 1, 1, 1,
-0.1343039, 1.272055, -0.6707975, 0, 0, 1, 1, 1,
-0.1311914, 0.1870517, -1.414109, 1, 0, 0, 1, 1,
-0.1302234, 1.074864, -1.016487, 1, 0, 0, 1, 1,
-0.1301191, -1.41144, -3.529824, 1, 0, 0, 1, 1,
-0.1282184, -0.3609816, -4.221023, 1, 0, 0, 1, 1,
-0.1261292, -2.445804, -2.494191, 1, 0, 0, 1, 1,
-0.1257492, 1.174404, -0.6316975, 0, 0, 0, 1, 1,
-0.1250169, -0.005045592, -1.626465, 0, 0, 0, 1, 1,
-0.1246013, -1.452721, -3.431116, 0, 0, 0, 1, 1,
-0.1209561, 1.538153, 0.6122473, 0, 0, 0, 1, 1,
-0.1181259, 0.8629563, -0.7263411, 0, 0, 0, 1, 1,
-0.1144422, -0.2797159, -2.119044, 0, 0, 0, 1, 1,
-0.1139652, -0.2711622, -3.478277, 0, 0, 0, 1, 1,
-0.113221, -0.5579604, -3.280358, 1, 1, 1, 1, 1,
-0.1117683, 0.7923675, 0.1896418, 1, 1, 1, 1, 1,
-0.1113636, 0.4971452, 1.152532, 1, 1, 1, 1, 1,
-0.1080722, 1.90573, -0.4054055, 1, 1, 1, 1, 1,
-0.1079825, 1.358335, 1.346916, 1, 1, 1, 1, 1,
-0.1039809, -0.5355728, -3.299886, 1, 1, 1, 1, 1,
-0.1021814, -1.623299, -3.055515, 1, 1, 1, 1, 1,
-0.1020648, 1.160413, 0.09784351, 1, 1, 1, 1, 1,
-0.09777868, 0.6538151, -1.281619, 1, 1, 1, 1, 1,
-0.09739053, -0.09693553, -1.446867, 1, 1, 1, 1, 1,
-0.09253264, 0.8869058, -0.07428384, 1, 1, 1, 1, 1,
-0.08861396, -0.8640453, -5.116058, 1, 1, 1, 1, 1,
-0.08543826, -0.8250009, -2.847942, 1, 1, 1, 1, 1,
-0.08382977, 1.560393, -1.841306, 1, 1, 1, 1, 1,
-0.08159613, 0.4539432, -0.4771039, 1, 1, 1, 1, 1,
-0.08041296, 0.2145645, 0.8048785, 0, 0, 1, 1, 1,
-0.0773197, 1.385951, 0.3982204, 1, 0, 0, 1, 1,
-0.07505706, -1.156187, -3.055342, 1, 0, 0, 1, 1,
-0.07304715, 0.9392341, -0.8141778, 1, 0, 0, 1, 1,
-0.07149151, -0.2168476, -5.530006, 1, 0, 0, 1, 1,
-0.06785076, -0.4906967, -2.904288, 1, 0, 0, 1, 1,
-0.05497618, 0.2078577, 0.6509714, 0, 0, 0, 1, 1,
-0.05439487, -0.8970801, -3.393957, 0, 0, 0, 1, 1,
-0.05247923, 1.207789, -0.5168946, 0, 0, 0, 1, 1,
-0.05076528, -0.9040439, -3.789059, 0, 0, 0, 1, 1,
-0.04962059, -1.423932, -1.86898, 0, 0, 0, 1, 1,
-0.04527182, -1.041126, -3.400512, 0, 0, 0, 1, 1,
-0.04258566, 0.4721752, 1.581621, 0, 0, 0, 1, 1,
-0.04045975, 0.4118943, -0.7861047, 1, 1, 1, 1, 1,
-0.03765332, 1.141459, -0.7229379, 1, 1, 1, 1, 1,
-0.03491195, -1.071465, -3.205907, 1, 1, 1, 1, 1,
-0.02989714, -0.9538088, -2.981015, 1, 1, 1, 1, 1,
-0.02867541, 1.991581, -0.9077641, 1, 1, 1, 1, 1,
-0.02404689, 1.642027, 2.251997, 1, 1, 1, 1, 1,
-0.0225278, -0.3125048, -5.063446, 1, 1, 1, 1, 1,
-0.01264157, 0.3890038, -1.38995, 1, 1, 1, 1, 1,
-0.01050453, 0.1910303, -2.124784, 1, 1, 1, 1, 1,
-0.009412811, -0.3044553, -2.26917, 1, 1, 1, 1, 1,
-0.008798346, -1.769156, -2.122316, 1, 1, 1, 1, 1,
-0.007597835, 1.260226, 0.108209, 1, 1, 1, 1, 1,
-0.006688763, -1.08817, -2.143164, 1, 1, 1, 1, 1,
-0.003945732, -0.1930694, -4.491489, 1, 1, 1, 1, 1,
-0.0002117499, -0.862487, -3.185958, 1, 1, 1, 1, 1,
0.0002057493, 0.3953031, 1.745072, 0, 0, 1, 1, 1,
0.007205763, -1.401184, 3.048003, 1, 0, 0, 1, 1,
0.007440998, 1.157219, 0.6981804, 1, 0, 0, 1, 1,
0.008948479, -0.5562019, 2.30042, 1, 0, 0, 1, 1,
0.01219212, 0.4560906, -0.0903068, 1, 0, 0, 1, 1,
0.01593959, -0.4489318, 1.513108, 1, 0, 0, 1, 1,
0.01930546, -0.9047939, 4.2908, 0, 0, 0, 1, 1,
0.01968216, -0.7423559, 3.33638, 0, 0, 0, 1, 1,
0.02157855, 0.9326873, -1.756895, 0, 0, 0, 1, 1,
0.02559039, -0.1606953, 2.324746, 0, 0, 0, 1, 1,
0.02905556, -0.06146463, 2.544958, 0, 0, 0, 1, 1,
0.03097713, 1.288507, -1.753241, 0, 0, 0, 1, 1,
0.03424131, -1.117547, 4.032297, 0, 0, 0, 1, 1,
0.03440409, 2.17667, -0.1353038, 1, 1, 1, 1, 1,
0.0346246, 0.1739768, -0.7317547, 1, 1, 1, 1, 1,
0.03568779, 1.520417, -0.7956107, 1, 1, 1, 1, 1,
0.03698701, -0.3419251, 3.640657, 1, 1, 1, 1, 1,
0.04263178, -0.6489521, 2.243869, 1, 1, 1, 1, 1,
0.04512383, -0.6194922, 1.627465, 1, 1, 1, 1, 1,
0.05278794, -0.7088339, 2.334412, 1, 1, 1, 1, 1,
0.05576312, 0.5030293, -0.1850468, 1, 1, 1, 1, 1,
0.05729179, 0.9882261, 1.024218, 1, 1, 1, 1, 1,
0.05770546, -0.0803772, 1.889584, 1, 1, 1, 1, 1,
0.05815348, -0.4818953, 2.378667, 1, 1, 1, 1, 1,
0.05984498, 0.3921158, 1.482401, 1, 1, 1, 1, 1,
0.06359838, 0.09286672, 2.337586, 1, 1, 1, 1, 1,
0.06618445, -0.15381, 4.283339, 1, 1, 1, 1, 1,
0.06795232, 0.2277917, -0.9927556, 1, 1, 1, 1, 1,
0.07048642, -1.358265, 4.001083, 0, 0, 1, 1, 1,
0.0719718, -0.4287613, 3.683786, 1, 0, 0, 1, 1,
0.07317322, 2.617922, 0.08855321, 1, 0, 0, 1, 1,
0.07725463, -0.4087128, 3.221885, 1, 0, 0, 1, 1,
0.07884145, 0.02119903, 0.05112556, 1, 0, 0, 1, 1,
0.08140176, -0.7827485, 4.633452, 1, 0, 0, 1, 1,
0.08305761, -0.5497002, 2.661667, 0, 0, 0, 1, 1,
0.09114576, 2.070193, -2.75142, 0, 0, 0, 1, 1,
0.0968359, -0.3335596, 1.809595, 0, 0, 0, 1, 1,
0.0991355, -1.602603, 2.801767, 0, 0, 0, 1, 1,
0.1017516, -0.538123, 1.336321, 0, 0, 0, 1, 1,
0.1020729, 0.371997, 0.405864, 0, 0, 0, 1, 1,
0.1034749, -1.48154, 4.215465, 0, 0, 0, 1, 1,
0.105132, 0.0184614, 3.015478, 1, 1, 1, 1, 1,
0.1053326, 1.145343, 2.359981, 1, 1, 1, 1, 1,
0.1056787, 1.787693, 0.6558626, 1, 1, 1, 1, 1,
0.1084868, 1.129968, -0.8199438, 1, 1, 1, 1, 1,
0.1096331, 0.8736138, -0.7968517, 1, 1, 1, 1, 1,
0.1225043, 0.2428671, 0.316104, 1, 1, 1, 1, 1,
0.1247231, 0.3554319, 0.2619578, 1, 1, 1, 1, 1,
0.1287909, -0.5664552, 2.825155, 1, 1, 1, 1, 1,
0.1329218, 1.999881, -0.5225961, 1, 1, 1, 1, 1,
0.1332164, 1.526828, -2.709635, 1, 1, 1, 1, 1,
0.134579, 0.9667343, -0.1774511, 1, 1, 1, 1, 1,
0.1351924, -1.523499, 3.744238, 1, 1, 1, 1, 1,
0.1365111, -0.06515847, -0.08042987, 1, 1, 1, 1, 1,
0.1457237, -0.9374533, 3.237674, 1, 1, 1, 1, 1,
0.1467437, 0.3962662, 0.9526853, 1, 1, 1, 1, 1,
0.1472668, -0.667796, 3.980088, 0, 0, 1, 1, 1,
0.1527991, -0.2587997, 2.208124, 1, 0, 0, 1, 1,
0.153736, -0.1723592, 2.588558, 1, 0, 0, 1, 1,
0.1553506, -0.2774618, 2.755366, 1, 0, 0, 1, 1,
0.1588686, 0.7588691, 0.4254673, 1, 0, 0, 1, 1,
0.1603371, -1.142215, 3.642188, 1, 0, 0, 1, 1,
0.1616387, -0.6279052, 2.356027, 0, 0, 0, 1, 1,
0.1637201, 0.2006294, 1.090839, 0, 0, 0, 1, 1,
0.1651527, -0.7703012, 4.618406, 0, 0, 0, 1, 1,
0.1659004, -1.859802, 1.924394, 0, 0, 0, 1, 1,
0.1696355, -1.174084, 3.041845, 0, 0, 0, 1, 1,
0.1728028, -0.6560799, 2.922485, 0, 0, 0, 1, 1,
0.1753236, -1.69701, 2.055456, 0, 0, 0, 1, 1,
0.1756369, 0.8653828, -0.2120649, 1, 1, 1, 1, 1,
0.1765085, 1.790943, -1.637209, 1, 1, 1, 1, 1,
0.1779425, -0.19318, 1.620741, 1, 1, 1, 1, 1,
0.1820065, -1.091443, 4.168568, 1, 1, 1, 1, 1,
0.1825006, -0.7405515, 5.781972, 1, 1, 1, 1, 1,
0.1954696, 2.178848, 1.4512, 1, 1, 1, 1, 1,
0.1977372, 1.102296, -0.5307608, 1, 1, 1, 1, 1,
0.1983388, -1.28855, 2.263236, 1, 1, 1, 1, 1,
0.2003294, -1.315806, 2.372891, 1, 1, 1, 1, 1,
0.201927, -1.791851, 3.65457, 1, 1, 1, 1, 1,
0.2038821, 1.416019, 1.025677, 1, 1, 1, 1, 1,
0.2067516, -0.2712752, 2.120499, 1, 1, 1, 1, 1,
0.2082098, 0.6571211, -0.4753814, 1, 1, 1, 1, 1,
0.2117586, 0.3862698, 1.08323, 1, 1, 1, 1, 1,
0.2134012, 0.5560012, 0.815694, 1, 1, 1, 1, 1,
0.2225579, 0.3803885, 1.886626, 0, 0, 1, 1, 1,
0.2235943, 0.211131, -0.9561045, 1, 0, 0, 1, 1,
0.2337171, 0.237241, 1.868557, 1, 0, 0, 1, 1,
0.234214, -1.039304, 2.458625, 1, 0, 0, 1, 1,
0.2364203, -0.7582439, 2.36187, 1, 0, 0, 1, 1,
0.2389497, -0.403767, 2.757835, 1, 0, 0, 1, 1,
0.2418455, -1.703397, 2.483856, 0, 0, 0, 1, 1,
0.2458359, -1.49102, 2.704124, 0, 0, 0, 1, 1,
0.2487268, -0.4206118, 3.684103, 0, 0, 0, 1, 1,
0.2518261, -0.8100715, 2.995285, 0, 0, 0, 1, 1,
0.255353, 0.2441207, 1.704595, 0, 0, 0, 1, 1,
0.2591654, 2.162731, 0.2266571, 0, 0, 0, 1, 1,
0.2598919, -0.01324823, -0.3921456, 0, 0, 0, 1, 1,
0.2621796, 0.593859, 0.2610615, 1, 1, 1, 1, 1,
0.2691996, 0.2173897, 2.179084, 1, 1, 1, 1, 1,
0.2755347, 0.7102411, -1.164362, 1, 1, 1, 1, 1,
0.2755535, -0.2123064, 3.045643, 1, 1, 1, 1, 1,
0.2850182, -1.321073, 3.478453, 1, 1, 1, 1, 1,
0.2860147, 1.509185, -0.3999319, 1, 1, 1, 1, 1,
0.2892896, -1.054732, 2.233248, 1, 1, 1, 1, 1,
0.2910363, 0.2334324, 0.7669576, 1, 1, 1, 1, 1,
0.2958495, 0.1244044, -0.7515796, 1, 1, 1, 1, 1,
0.304007, 0.9000564, 0.9992412, 1, 1, 1, 1, 1,
0.3056066, -0.06352092, 1.284478, 1, 1, 1, 1, 1,
0.3069377, -0.7199032, 1.172141, 1, 1, 1, 1, 1,
0.3087332, -0.7976771, 4.825214, 1, 1, 1, 1, 1,
0.3110744, 0.6628629, 0.3188163, 1, 1, 1, 1, 1,
0.3145136, -0.6949745, 3.011619, 1, 1, 1, 1, 1,
0.3154362, 0.5673785, -0.3044496, 0, 0, 1, 1, 1,
0.3213378, -0.7241351, 3.577559, 1, 0, 0, 1, 1,
0.3226109, 1.52518, 1.251971, 1, 0, 0, 1, 1,
0.3257032, -1.153561, 2.218529, 1, 0, 0, 1, 1,
0.325823, -0.5141796, 2.405976, 1, 0, 0, 1, 1,
0.3294647, -0.1269539, 1.49882, 1, 0, 0, 1, 1,
0.3326132, -0.2020699, 2.296318, 0, 0, 0, 1, 1,
0.3328366, -0.8650383, 2.097657, 0, 0, 0, 1, 1,
0.3342154, -1.557485, 2.441997, 0, 0, 0, 1, 1,
0.3375507, 0.2287177, 1.323595, 0, 0, 0, 1, 1,
0.3393984, -0.2112955, -0.06173028, 0, 0, 0, 1, 1,
0.3394491, 0.01633108, 0.9397274, 0, 0, 0, 1, 1,
0.3408861, 0.3516654, 1.008303, 0, 0, 0, 1, 1,
0.344456, 0.4730103, 0.6152185, 1, 1, 1, 1, 1,
0.3448341, -1.125844, 2.039236, 1, 1, 1, 1, 1,
0.3460634, 0.5727704, 1.592892, 1, 1, 1, 1, 1,
0.3499973, -0.4236318, 2.208336, 1, 1, 1, 1, 1,
0.3501632, -0.4090371, 1.894035, 1, 1, 1, 1, 1,
0.3545882, -0.1879078, 2.251112, 1, 1, 1, 1, 1,
0.3580811, -0.2190805, 2.272135, 1, 1, 1, 1, 1,
0.3590378, -0.8785859, 3.736566, 1, 1, 1, 1, 1,
0.3591099, -0.05314466, 1.615885, 1, 1, 1, 1, 1,
0.3627051, 1.275349, 0.3050199, 1, 1, 1, 1, 1,
0.3673827, -0.6966198, 3.374682, 1, 1, 1, 1, 1,
0.3710407, -2.127777, 4.026179, 1, 1, 1, 1, 1,
0.37336, 2.226119, -0.3344671, 1, 1, 1, 1, 1,
0.3762232, 0.004337237, 2.406706, 1, 1, 1, 1, 1,
0.3827928, 1.197432, -0.2407668, 1, 1, 1, 1, 1,
0.3849221, 0.3826241, -0.04457528, 0, 0, 1, 1, 1,
0.386919, 0.8277329, 0.7465331, 1, 0, 0, 1, 1,
0.3882402, -0.7393181, 3.553254, 1, 0, 0, 1, 1,
0.3950972, -0.6564296, 3.840008, 1, 0, 0, 1, 1,
0.3960973, 1.073576, -1.768873, 1, 0, 0, 1, 1,
0.3986467, -0.3718244, 2.769966, 1, 0, 0, 1, 1,
0.4026314, -0.322735, 3.268001, 0, 0, 0, 1, 1,
0.4134792, -1.460665, 3.168692, 0, 0, 0, 1, 1,
0.4148458, 0.811229, 1.52669, 0, 0, 0, 1, 1,
0.414872, 1.137753, 1.025035, 0, 0, 0, 1, 1,
0.4152901, 0.4972417, 1.621944, 0, 0, 0, 1, 1,
0.4156545, -1.167735, 3.128346, 0, 0, 0, 1, 1,
0.4172821, 0.3980834, 1.244504, 0, 0, 0, 1, 1,
0.4191109, 0.1756337, 1.480724, 1, 1, 1, 1, 1,
0.4235764, -0.6908573, 2.322823, 1, 1, 1, 1, 1,
0.4257484, 1.376387, -0.5769165, 1, 1, 1, 1, 1,
0.4286832, 0.7611651, 0.05177663, 1, 1, 1, 1, 1,
0.4315238, 0.7764015, -0.1056367, 1, 1, 1, 1, 1,
0.4335008, 1.050735, 0.1747218, 1, 1, 1, 1, 1,
0.4336683, 1.316903, 2.627694, 1, 1, 1, 1, 1,
0.4337897, 1.196783, -1.020762, 1, 1, 1, 1, 1,
0.434865, -1.630863, 3.20805, 1, 1, 1, 1, 1,
0.4377266, -0.3190436, 0.1422776, 1, 1, 1, 1, 1,
0.4432486, -0.04692249, 1.923425, 1, 1, 1, 1, 1,
0.44473, -1.313151, 3.189778, 1, 1, 1, 1, 1,
0.4451604, -1.229926, 2.142029, 1, 1, 1, 1, 1,
0.4516834, -0.8517133, 2.200756, 1, 1, 1, 1, 1,
0.4552983, 0.1311832, 2.019739, 1, 1, 1, 1, 1,
0.4615136, 0.3022516, 1.108551, 0, 0, 1, 1, 1,
0.46164, -0.3030867, 1.569831, 1, 0, 0, 1, 1,
0.463078, 1.22554, -0.4180194, 1, 0, 0, 1, 1,
0.4648822, -2.237209, 2.439914, 1, 0, 0, 1, 1,
0.4666277, 1.454137, -0.3489637, 1, 0, 0, 1, 1,
0.4681441, -0.07671175, 3.099603, 1, 0, 0, 1, 1,
0.4707091, 0.108519, 3.675725, 0, 0, 0, 1, 1,
0.4715443, 1.204893, -0.02711058, 0, 0, 0, 1, 1,
0.4744041, 0.4967674, 1.162952, 0, 0, 0, 1, 1,
0.4754559, -0.6603131, 3.87592, 0, 0, 0, 1, 1,
0.4760923, -1.79501, 5.034072, 0, 0, 0, 1, 1,
0.4784575, -0.2636085, 0.7207618, 0, 0, 0, 1, 1,
0.4791751, -1.118716, 2.987624, 0, 0, 0, 1, 1,
0.4894908, -0.8759083, 2.980894, 1, 1, 1, 1, 1,
0.4909821, -0.5787313, 1.116969, 1, 1, 1, 1, 1,
0.4933338, 1.025227, -1.288486, 1, 1, 1, 1, 1,
0.4941702, -0.9077975, 2.239882, 1, 1, 1, 1, 1,
0.4953783, 0.5237193, 1.947487, 1, 1, 1, 1, 1,
0.4958288, 0.208538, 0.542526, 1, 1, 1, 1, 1,
0.4964538, -0.1791649, 1.159673, 1, 1, 1, 1, 1,
0.4966129, -0.1685095, 3.097038, 1, 1, 1, 1, 1,
0.501691, 0.3029266, 1.070182, 1, 1, 1, 1, 1,
0.5020322, 0.08326574, 0.4977201, 1, 1, 1, 1, 1,
0.5025777, 0.4731396, 0.5793172, 1, 1, 1, 1, 1,
0.5058888, -0.7857326, 3.648538, 1, 1, 1, 1, 1,
0.5101766, 1.337299, 0.2368218, 1, 1, 1, 1, 1,
0.5106265, 0.3633268, 1.265813, 1, 1, 1, 1, 1,
0.5131429, -0.5231352, 0.1329326, 1, 1, 1, 1, 1,
0.5137899, 0.6514533, 1.966735, 0, 0, 1, 1, 1,
0.5142486, -0.5165228, 2.441163, 1, 0, 0, 1, 1,
0.515904, -0.3799152, 2.875823, 1, 0, 0, 1, 1,
0.5239565, 1.330853, -0.0207063, 1, 0, 0, 1, 1,
0.5245581, -1.048661, 2.273844, 1, 0, 0, 1, 1,
0.5247849, 1.985221, -0.3220919, 1, 0, 0, 1, 1,
0.5251159, 0.01391494, 2.018427, 0, 0, 0, 1, 1,
0.5266902, -1.354041, 3.00274, 0, 0, 0, 1, 1,
0.5299668, -0.5889514, 1.886679, 0, 0, 0, 1, 1,
0.5317764, -0.4368702, 2.561612, 0, 0, 0, 1, 1,
0.5377131, 1.225343, 2.92805, 0, 0, 0, 1, 1,
0.5399184, 0.5448744, -1.03882, 0, 0, 0, 1, 1,
0.5564643, -0.1526019, 2.459942, 0, 0, 0, 1, 1,
0.5568438, 0.5160136, 1.496228, 1, 1, 1, 1, 1,
0.5580198, 1.52561, -0.9302747, 1, 1, 1, 1, 1,
0.5581832, -0.3396985, 1.154256, 1, 1, 1, 1, 1,
0.558967, 0.1198281, 0.9639917, 1, 1, 1, 1, 1,
0.5625406, -0.6814107, 2.888585, 1, 1, 1, 1, 1,
0.5649204, 0.6933572, 0.2802904, 1, 1, 1, 1, 1,
0.5656213, 0.5140013, 0.8723673, 1, 1, 1, 1, 1,
0.5662994, 1.871087, 0.5990103, 1, 1, 1, 1, 1,
0.5665358, 0.5041628, 0.5498913, 1, 1, 1, 1, 1,
0.5674716, 0.3172497, 0.2839297, 1, 1, 1, 1, 1,
0.5692824, -0.4693363, 3.448024, 1, 1, 1, 1, 1,
0.5705003, -0.07598606, 0.3341565, 1, 1, 1, 1, 1,
0.5737973, 0.7779562, 2.257427, 1, 1, 1, 1, 1,
0.5750571, 2.242431, -1.371482, 1, 1, 1, 1, 1,
0.5754985, -0.6122348, 2.427378, 1, 1, 1, 1, 1,
0.5810688, 0.7739317, 0.6277099, 0, 0, 1, 1, 1,
0.5828829, -0.2687486, 1.766398, 1, 0, 0, 1, 1,
0.583729, -0.6171179, 2.080626, 1, 0, 0, 1, 1,
0.5903465, -0.9841941, 1.494534, 1, 0, 0, 1, 1,
0.5910376, 0.4903114, 0.1252521, 1, 0, 0, 1, 1,
0.5910397, -1.497916, 2.548273, 1, 0, 0, 1, 1,
0.5919619, 0.6328658, 2.894026, 0, 0, 0, 1, 1,
0.5928643, -0.6220586, 2.063835, 0, 0, 0, 1, 1,
0.5950613, 0.733127, 2.558389, 0, 0, 0, 1, 1,
0.5962533, 0.75186, -0.2718192, 0, 0, 0, 1, 1,
0.5967523, 1.251202, 1.287114, 0, 0, 0, 1, 1,
0.5986101, -0.8816018, 3.184697, 0, 0, 0, 1, 1,
0.6020975, -0.3324266, 2.032391, 0, 0, 0, 1, 1,
0.6047794, 1.054519, 0.7630949, 1, 1, 1, 1, 1,
0.6067663, 0.7143793, 0.5879019, 1, 1, 1, 1, 1,
0.6099645, -0.5404333, 1.617253, 1, 1, 1, 1, 1,
0.6105057, 0.6332515, 0.3664045, 1, 1, 1, 1, 1,
0.6204687, 1.362651, -1.130797, 1, 1, 1, 1, 1,
0.6227911, 0.9191118, -0.3832749, 1, 1, 1, 1, 1,
0.6299838, -0.7350346, 3.239143, 1, 1, 1, 1, 1,
0.6311495, -0.4004686, 0.6612818, 1, 1, 1, 1, 1,
0.6313365, 1.167353, 1.448584, 1, 1, 1, 1, 1,
0.6344522, 0.4461163, 0.7395408, 1, 1, 1, 1, 1,
0.6357986, 0.8340262, -1.386913, 1, 1, 1, 1, 1,
0.6358691, -0.1793073, 1.780725, 1, 1, 1, 1, 1,
0.6475008, 0.5151101, 0.6552425, 1, 1, 1, 1, 1,
0.6485747, 0.4594233, 1.466222, 1, 1, 1, 1, 1,
0.6494443, -2.025976, 3.77816, 1, 1, 1, 1, 1,
0.6517429, 0.05474798, 2.845163, 0, 0, 1, 1, 1,
0.6635288, 0.4919186, 1.045085, 1, 0, 0, 1, 1,
0.6646575, -0.9700711, 2.524811, 1, 0, 0, 1, 1,
0.6684552, 0.01779133, 2.29924, 1, 0, 0, 1, 1,
0.6771844, 0.2735541, 1.682936, 1, 0, 0, 1, 1,
0.6787146, 0.7393394, 1.600311, 1, 0, 0, 1, 1,
0.6869691, -0.7593933, 2.519819, 0, 0, 0, 1, 1,
0.6894317, -0.5830632, 1.758229, 0, 0, 0, 1, 1,
0.6961254, 0.5729323, 0.7532994, 0, 0, 0, 1, 1,
0.6981843, -0.1028038, 1.441489, 0, 0, 0, 1, 1,
0.6995264, 0.2874228, 1.517818, 0, 0, 0, 1, 1,
0.703304, 0.1695592, 2.88714, 0, 0, 0, 1, 1,
0.7138614, -0.1616703, 3.953305, 0, 0, 0, 1, 1,
0.7194229, 0.5937234, 1.133988, 1, 1, 1, 1, 1,
0.7220414, 1.372584, 0.6721025, 1, 1, 1, 1, 1,
0.728623, 1.102744, 1.346383, 1, 1, 1, 1, 1,
0.7300033, -0.9558678, 2.934129, 1, 1, 1, 1, 1,
0.7319862, 1.415248, 0.3546512, 1, 1, 1, 1, 1,
0.7399238, 0.09059595, 3.33919, 1, 1, 1, 1, 1,
0.7407568, 1.156445, -0.04549854, 1, 1, 1, 1, 1,
0.7408119, 0.7035663, 1.165722, 1, 1, 1, 1, 1,
0.7439867, 0.8078138, 0.3570215, 1, 1, 1, 1, 1,
0.744957, -1.806162, 1.62486, 1, 1, 1, 1, 1,
0.749127, -0.3854499, 1.633267, 1, 1, 1, 1, 1,
0.7499688, 0.204172, 1.037621, 1, 1, 1, 1, 1,
0.7509171, 0.8227502, 1.705234, 1, 1, 1, 1, 1,
0.7574013, -0.07504098, 2.139317, 1, 1, 1, 1, 1,
0.7589242, 0.7445406, 1.513872, 1, 1, 1, 1, 1,
0.7647871, 0.3197239, 0.6045745, 0, 0, 1, 1, 1,
0.7656685, -0.4328726, 1.604173, 1, 0, 0, 1, 1,
0.7661234, 0.102166, 2.866308, 1, 0, 0, 1, 1,
0.766679, 2.152599, -0.5730527, 1, 0, 0, 1, 1,
0.767108, -0.419914, 2.276682, 1, 0, 0, 1, 1,
0.7682236, 1.11049, 0.6154113, 1, 0, 0, 1, 1,
0.7686697, 0.6902241, -0.09217942, 0, 0, 0, 1, 1,
0.769523, 0.1054917, 1.794031, 0, 0, 0, 1, 1,
0.7701602, -0.3087618, 3.28862, 0, 0, 0, 1, 1,
0.7752823, -0.793943, 2.695371, 0, 0, 0, 1, 1,
0.7757697, 1.353863, -0.9410213, 0, 0, 0, 1, 1,
0.7887359, 0.11347, -0.1249364, 0, 0, 0, 1, 1,
0.7897855, -0.8387527, 2.02975, 0, 0, 0, 1, 1,
0.7898831, -1.38425, 2.062336, 1, 1, 1, 1, 1,
0.7937953, 1.208566, 2.80442, 1, 1, 1, 1, 1,
0.7976272, 0.9476268, -0.1995242, 1, 1, 1, 1, 1,
0.7984953, 0.8221953, 0.407394, 1, 1, 1, 1, 1,
0.8101949, 0.1162268, 1.020534, 1, 1, 1, 1, 1,
0.81241, -1.816986, 1.799267, 1, 1, 1, 1, 1,
0.8189591, -1.502193, 1.200764, 1, 1, 1, 1, 1,
0.8194376, 0.1032087, 1.885996, 1, 1, 1, 1, 1,
0.82692, 1.079628, 1.959752, 1, 1, 1, 1, 1,
0.8310533, 1.556233, 1.681869, 1, 1, 1, 1, 1,
0.8318446, 0.2524946, 0.5124009, 1, 1, 1, 1, 1,
0.834038, -0.3066043, 2.696284, 1, 1, 1, 1, 1,
0.8367967, 1.10463, 1.209489, 1, 1, 1, 1, 1,
0.8456647, 0.4427524, 1.252643, 1, 1, 1, 1, 1,
0.8468267, -1.22995, 4.051965, 1, 1, 1, 1, 1,
0.8473494, -1.469388, 3.073361, 0, 0, 1, 1, 1,
0.8508458, 1.187726, 1.210536, 1, 0, 0, 1, 1,
0.8544929, 2.118343, 0.7823775, 1, 0, 0, 1, 1,
0.8561026, 1.092054, 0.8784782, 1, 0, 0, 1, 1,
0.8584744, -0.5935418, 3.614909, 1, 0, 0, 1, 1,
0.8602429, -0.7856177, 2.66888, 1, 0, 0, 1, 1,
0.866203, 0.3342476, 0.4955507, 0, 0, 0, 1, 1,
0.8683853, 0.7785785, 1.708542, 0, 0, 0, 1, 1,
0.8732634, -0.8444206, 4.070818, 0, 0, 0, 1, 1,
0.8763921, -0.5369421, 2.960851, 0, 0, 0, 1, 1,
0.8780961, 2.454839, -1.807044, 0, 0, 0, 1, 1,
0.8869893, -1.034666, 1.580299, 0, 0, 0, 1, 1,
0.8874964, -1.051381, 3.530334, 0, 0, 0, 1, 1,
0.8897997, 0.2581935, -0.7944483, 1, 1, 1, 1, 1,
0.8914584, 0.4612445, 0.5591484, 1, 1, 1, 1, 1,
0.8971757, -1.727855, 3.273161, 1, 1, 1, 1, 1,
0.9015454, 1.074726, 0.116096, 1, 1, 1, 1, 1,
0.9019412, -0.4054854, 2.094439, 1, 1, 1, 1, 1,
0.9079154, -0.294093, 2.44309, 1, 1, 1, 1, 1,
0.9096285, -0.7470772, 1.447642, 1, 1, 1, 1, 1,
0.9123248, -1.05731, 2.050397, 1, 1, 1, 1, 1,
0.913203, -1.632584, 3.62922, 1, 1, 1, 1, 1,
0.9298443, -0.9326758, 3.561395, 1, 1, 1, 1, 1,
0.9312257, 0.2157865, 0.6928576, 1, 1, 1, 1, 1,
0.9367815, 1.251482, -0.05666029, 1, 1, 1, 1, 1,
0.9385048, -1.828172, 3.062521, 1, 1, 1, 1, 1,
0.9407914, 1.979468, 0.79352, 1, 1, 1, 1, 1,
0.943792, 0.9929986, -0.2801157, 1, 1, 1, 1, 1,
0.9480738, 1.223831, 1.076422, 0, 0, 1, 1, 1,
0.9514216, 1.895037, -0.8289552, 1, 0, 0, 1, 1,
0.9553116, -2.324673, 1.980233, 1, 0, 0, 1, 1,
0.9604328, -0.9271185, 4.68834, 1, 0, 0, 1, 1,
0.9737343, 0.3499667, 1.326802, 1, 0, 0, 1, 1,
0.976692, 1.336643, -0.3044428, 1, 0, 0, 1, 1,
0.9780056, 0.1070659, 1.142742, 0, 0, 0, 1, 1,
0.984473, -0.08717424, 1.498687, 0, 0, 0, 1, 1,
0.9864199, -0.08874069, 2.313926, 0, 0, 0, 1, 1,
0.9892693, -1.14304, 3.404995, 0, 0, 0, 1, 1,
0.9903859, 0.4382425, 0.7835458, 0, 0, 0, 1, 1,
1.001488, -0.953885, 2.216525, 0, 0, 0, 1, 1,
1.002079, -0.6013463, 2.252219, 0, 0, 0, 1, 1,
1.002833, 0.105739, -0.1500394, 1, 1, 1, 1, 1,
1.005127, 0.1120631, 1.478794, 1, 1, 1, 1, 1,
1.006526, 0.6061822, -0.03851245, 1, 1, 1, 1, 1,
1.00665, 0.948512, 3.213482, 1, 1, 1, 1, 1,
1.017838, 0.9688199, 0.9711373, 1, 1, 1, 1, 1,
1.030159, -0.7563183, 2.144775, 1, 1, 1, 1, 1,
1.03137, 1.217559, 0.1280369, 1, 1, 1, 1, 1,
1.044324, 0.8985148, 0.9898336, 1, 1, 1, 1, 1,
1.046085, 0.4642059, 1.610373, 1, 1, 1, 1, 1,
1.0461, -0.4153353, 1.509546, 1, 1, 1, 1, 1,
1.061254, 0.04165637, 0.9266623, 1, 1, 1, 1, 1,
1.063112, -0.7817739, 1.013652, 1, 1, 1, 1, 1,
1.063524, 0.2325419, 0.09532267, 1, 1, 1, 1, 1,
1.06503, -0.3235901, 0.4578431, 1, 1, 1, 1, 1,
1.069282, -1.781657, 2.737181, 1, 1, 1, 1, 1,
1.069312, 1.176477, 0.1713237, 0, 0, 1, 1, 1,
1.070883, -0.1987614, 1.655316, 1, 0, 0, 1, 1,
1.073164, 0.2834193, 1.910388, 1, 0, 0, 1, 1,
1.075538, 1.570345, -0.6319126, 1, 0, 0, 1, 1,
1.088037, 0.1512813, 2.306822, 1, 0, 0, 1, 1,
1.093381, -1.27507, 2.16999, 1, 0, 0, 1, 1,
1.109206, -1.118954, 1.441367, 0, 0, 0, 1, 1,
1.111614, -1.262, 2.728993, 0, 0, 0, 1, 1,
1.117266, 1.886107, 0.2440786, 0, 0, 0, 1, 1,
1.12104, -0.6502594, 1.86126, 0, 0, 0, 1, 1,
1.134453, -0.9177483, 1.708465, 0, 0, 0, 1, 1,
1.135456, -0.6060961, 2.561673, 0, 0, 0, 1, 1,
1.137953, 0.514334, -0.1751735, 0, 0, 0, 1, 1,
1.140685, -0.9579467, 3.523495, 1, 1, 1, 1, 1,
1.145187, -0.2437861, 2.986436, 1, 1, 1, 1, 1,
1.152495, 0.7924734, 0.7155899, 1, 1, 1, 1, 1,
1.153911, -0.2153544, 2.495359, 1, 1, 1, 1, 1,
1.156708, 0.1081567, 1.495592, 1, 1, 1, 1, 1,
1.161616, -1.311341, 2.106721, 1, 1, 1, 1, 1,
1.171721, 0.4993213, 3.155918, 1, 1, 1, 1, 1,
1.173488, 1.673501, 1.528105, 1, 1, 1, 1, 1,
1.185157, -1.654926, 3.398361, 1, 1, 1, 1, 1,
1.197522, -1.915905, 0.7721801, 1, 1, 1, 1, 1,
1.197939, -1.152859, 1.643303, 1, 1, 1, 1, 1,
1.215994, -0.08298834, 3.414377, 1, 1, 1, 1, 1,
1.218197, 1.845306, 1.709512, 1, 1, 1, 1, 1,
1.220264, 0.5076198, 1.28694, 1, 1, 1, 1, 1,
1.222933, 1.363801, -0.1555061, 1, 1, 1, 1, 1,
1.232625, -0.5487657, 2.165691, 0, 0, 1, 1, 1,
1.240885, 1.031083, 2.471995, 1, 0, 0, 1, 1,
1.241272, -1.577335, 2.567185, 1, 0, 0, 1, 1,
1.244635, 0.8764374, 1.846563, 1, 0, 0, 1, 1,
1.245718, 0.4743352, 1.696727, 1, 0, 0, 1, 1,
1.249616, -1.416757, 1.200355, 1, 0, 0, 1, 1,
1.270788, -0.2417849, 0.3640871, 0, 0, 0, 1, 1,
1.292085, -0.02326223, 2.38058, 0, 0, 0, 1, 1,
1.306085, -0.2509884, 2.797325, 0, 0, 0, 1, 1,
1.309851, -1.406668, 2.724195, 0, 0, 0, 1, 1,
1.318298, 1.327945, -0.6013408, 0, 0, 0, 1, 1,
1.319705, -0.3043186, -0.05403607, 0, 0, 0, 1, 1,
1.324297, 1.105734, 4.230699, 0, 0, 0, 1, 1,
1.324338, -0.4124037, 1.083435, 1, 1, 1, 1, 1,
1.326677, -0.795698, 4.239562, 1, 1, 1, 1, 1,
1.332476, -0.8792942, 1.834728, 1, 1, 1, 1, 1,
1.347912, 1.014219, 1.051219, 1, 1, 1, 1, 1,
1.356731, 0.6741526, 2.203694, 1, 1, 1, 1, 1,
1.364817, 1.902506, 1.681885, 1, 1, 1, 1, 1,
1.374527, 0.9492918, 1.143699, 1, 1, 1, 1, 1,
1.377089, -0.366066, 1.784629, 1, 1, 1, 1, 1,
1.379547, -0.7107833, 1.523104, 1, 1, 1, 1, 1,
1.381129, 0.6384257, 2.790134, 1, 1, 1, 1, 1,
1.383382, -0.5714915, 1.703324, 1, 1, 1, 1, 1,
1.393048, 0.4447711, -0.2550648, 1, 1, 1, 1, 1,
1.393588, -0.2401502, 1.914002, 1, 1, 1, 1, 1,
1.403425, 0.2524614, 1.481096, 1, 1, 1, 1, 1,
1.418649, -0.06279431, 0.7772973, 1, 1, 1, 1, 1,
1.422161, -0.3309754, 2.03475, 0, 0, 1, 1, 1,
1.437353, -1.501029, 3.238266, 1, 0, 0, 1, 1,
1.451379, -0.6991958, 2.130424, 1, 0, 0, 1, 1,
1.456494, -1.301625, 1.446031, 1, 0, 0, 1, 1,
1.460579, -1.531043, 2.350363, 1, 0, 0, 1, 1,
1.465851, -0.4179059, 2.671806, 1, 0, 0, 1, 1,
1.48112, 0.1822874, 0.4474316, 0, 0, 0, 1, 1,
1.486648, 1.27977, 1.760506, 0, 0, 0, 1, 1,
1.498558, 2.070538, 0.7558306, 0, 0, 0, 1, 1,
1.500156, 1.206256, 0.1347728, 0, 0, 0, 1, 1,
1.516673, 0.5789161, 1.34546, 0, 0, 0, 1, 1,
1.531918, 0.9081289, 1.346759, 0, 0, 0, 1, 1,
1.536317, 0.336667, 0.9061965, 0, 0, 0, 1, 1,
1.54908, -0.7777939, 2.705383, 1, 1, 1, 1, 1,
1.569172, 0.7020153, 1.050619, 1, 1, 1, 1, 1,
1.572211, 0.7608539, 0.1746501, 1, 1, 1, 1, 1,
1.572835, -1.144351, 0.760089, 1, 1, 1, 1, 1,
1.586329, -0.2719515, 1.972068, 1, 1, 1, 1, 1,
1.605348, 0.6487458, 1.657525, 1, 1, 1, 1, 1,
1.621136, 0.9511893, 0.4220082, 1, 1, 1, 1, 1,
1.636821, -0.8006486, 3.388245, 1, 1, 1, 1, 1,
1.637193, 1.093748, -0.7178488, 1, 1, 1, 1, 1,
1.641041, -0.7630128, 2.331284, 1, 1, 1, 1, 1,
1.64504, -0.479576, 1.155169, 1, 1, 1, 1, 1,
1.658025, -0.06636519, 2.114638, 1, 1, 1, 1, 1,
1.660729, 0.1432963, 1.95298, 1, 1, 1, 1, 1,
1.665083, 1.251297, 1.535264, 1, 1, 1, 1, 1,
1.669149, -1.117949, 2.207213, 1, 1, 1, 1, 1,
1.671334, 1.364206, -0.5031587, 0, 0, 1, 1, 1,
1.691061, 0.7679654, 2.514996, 1, 0, 0, 1, 1,
1.691579, -1.209112, 0.6940003, 1, 0, 0, 1, 1,
1.706634, 0.2038009, 2.103355, 1, 0, 0, 1, 1,
1.725377, -1.190458, 3.357352, 1, 0, 0, 1, 1,
1.737448, 1.529449, 1.002402, 1, 0, 0, 1, 1,
1.748407, -1.70484, 1.264576, 0, 0, 0, 1, 1,
1.749349, 0.8318775, 2.064632, 0, 0, 0, 1, 1,
1.783707, -0.8452634, 2.071962, 0, 0, 0, 1, 1,
1.785892, -0.7751325, 3.136673, 0, 0, 0, 1, 1,
1.796503, -0.1874308, 2.766432, 0, 0, 0, 1, 1,
1.806848, 0.2756015, 1.521778, 0, 0, 0, 1, 1,
1.834349, -0.0307139, 1.427445, 0, 0, 0, 1, 1,
1.851974, 1.806766, 1.698392, 1, 1, 1, 1, 1,
1.863825, 0.58714, 1.927047, 1, 1, 1, 1, 1,
1.864977, -0.8235049, 1.788622, 1, 1, 1, 1, 1,
1.87892, -0.2108049, 2.295376, 1, 1, 1, 1, 1,
1.888864, -0.1367004, 3.170746, 1, 1, 1, 1, 1,
1.920062, -1.399094, 1.426606, 1, 1, 1, 1, 1,
1.930629, -1.167625, 2.93417, 1, 1, 1, 1, 1,
1.962763, -2.700223, 2.103465, 1, 1, 1, 1, 1,
1.966554, 0.4079017, 1.886669, 1, 1, 1, 1, 1,
1.990506, -0.02875, 1.635155, 1, 1, 1, 1, 1,
2.000288, -0.3763182, 2.170866, 1, 1, 1, 1, 1,
2.010224, 0.06197915, 1.408162, 1, 1, 1, 1, 1,
2.048139, 1.628196, 2.272925, 1, 1, 1, 1, 1,
2.048309, 0.5635364, 2.454696, 1, 1, 1, 1, 1,
2.05945, 1.012446, -0.8155385, 1, 1, 1, 1, 1,
2.076391, -0.175046, 0.8970305, 0, 0, 1, 1, 1,
2.078544, -0.2656946, 1.970192, 1, 0, 0, 1, 1,
2.104523, -1.384914, 2.11512, 1, 0, 0, 1, 1,
2.113093, -0.1299926, 1.353375, 1, 0, 0, 1, 1,
2.124684, -0.1889094, 2.058202, 1, 0, 0, 1, 1,
2.149238, -0.3710027, 2.054199, 1, 0, 0, 1, 1,
2.227148, -0.5112602, 2.459879, 0, 0, 0, 1, 1,
2.230265, -0.02115594, 0.7105279, 0, 0, 0, 1, 1,
2.255592, 3.030844e-05, 1.684374, 0, 0, 0, 1, 1,
2.263413, 0.5544045, 2.677902, 0, 0, 0, 1, 1,
2.294011, 0.1835419, 0.1138323, 0, 0, 0, 1, 1,
2.340934, 1.810454, -0.2201522, 0, 0, 0, 1, 1,
2.38613, -0.6540514, 2.225028, 0, 0, 0, 1, 1,
2.435439, 0.2418965, 2.462398, 1, 1, 1, 1, 1,
2.554876, -0.3298133, 2.957524, 1, 1, 1, 1, 1,
2.561674, -1.39671, 2.658018, 1, 1, 1, 1, 1,
2.583949, 0.007477224, 4.050987, 1, 1, 1, 1, 1,
2.593658, 0.01068806, -0.06046307, 1, 1, 1, 1, 1,
2.629486, -0.625989, 2.663464, 1, 1, 1, 1, 1,
2.837923, 1.180935, 2.019073, 1, 1, 1, 1, 1
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
var radius = 9.534596;
var distance = 33.48987;
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
mvMatrix.translate( 0.2286264, -0.08025253, -0.125983 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48987);
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
