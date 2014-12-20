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
-3.033639, -0.09181701, -1.259504, 1, 0, 0, 1,
-2.967002, -0.09331325, 1.185563, 1, 0.007843138, 0, 1,
-2.786052, 0.6753612, -1.822225, 1, 0.01176471, 0, 1,
-2.726393, -0.3550069, -1.026942, 1, 0.01960784, 0, 1,
-2.691907, 0.5049523, -1.634242, 1, 0.02352941, 0, 1,
-2.679793, -0.7362159, -0.995582, 1, 0.03137255, 0, 1,
-2.610038, 0.729108, -2.459403, 1, 0.03529412, 0, 1,
-2.520407, -1.035417, -0.4802667, 1, 0.04313726, 0, 1,
-2.495886, 0.0738987, -1.061732, 1, 0.04705882, 0, 1,
-2.492435, -0.2022892, -1.2038, 1, 0.05490196, 0, 1,
-2.3942, 0.165822, 0.09385697, 1, 0.05882353, 0, 1,
-2.291058, 0.4877137, -0.5233203, 1, 0.06666667, 0, 1,
-2.281596, -0.807273, -2.748477, 1, 0.07058824, 0, 1,
-2.275524, 1.73152, -2.602878, 1, 0.07843138, 0, 1,
-2.252259, 0.8510913, -1.158028, 1, 0.08235294, 0, 1,
-2.245422, -0.7022702, -1.820671, 1, 0.09019608, 0, 1,
-2.208892, -0.3622873, -2.180772, 1, 0.09411765, 0, 1,
-2.206157, 0.2892728, -1.647453, 1, 0.1019608, 0, 1,
-2.203477, -0.6924589, -0.9488568, 1, 0.1098039, 0, 1,
-2.143476, -0.09561738, -0.6180781, 1, 0.1137255, 0, 1,
-2.117209, 0.4734287, -2.005723, 1, 0.1215686, 0, 1,
-2.102716, 1.718559, -1.40422, 1, 0.1254902, 0, 1,
-2.083966, -0.7442949, -1.498572, 1, 0.1333333, 0, 1,
-2.081002, -0.07380775, -0.7612221, 1, 0.1372549, 0, 1,
-2.038979, 0.07536694, -2.653925, 1, 0.145098, 0, 1,
-2.020746, 0.4017997, -0.8743279, 1, 0.1490196, 0, 1,
-1.987881, -0.8530177, -2.753535, 1, 0.1568628, 0, 1,
-1.981173, 1.17351, -1.975559, 1, 0.1607843, 0, 1,
-1.977553, -1.598029, -1.897731, 1, 0.1686275, 0, 1,
-1.960111, 0.4193605, 0.01586075, 1, 0.172549, 0, 1,
-1.917933, -1.308467, -2.868738, 1, 0.1803922, 0, 1,
-1.913434, 0.9352697, -0.3902348, 1, 0.1843137, 0, 1,
-1.912366, 0.4270032, -4.381876, 1, 0.1921569, 0, 1,
-1.909363, -0.1438276, -1.346875, 1, 0.1960784, 0, 1,
-1.897714, -0.6091238, -2.424616, 1, 0.2039216, 0, 1,
-1.887187, -1.06078, -3.446245, 1, 0.2117647, 0, 1,
-1.876755, 0.4736394, -1.617566, 1, 0.2156863, 0, 1,
-1.863437, -1.800601, -1.209222, 1, 0.2235294, 0, 1,
-1.853819, 0.08786741, -3.120237, 1, 0.227451, 0, 1,
-1.849309, 0.4467179, -1.561586, 1, 0.2352941, 0, 1,
-1.84009, 0.5599043, -3.218024, 1, 0.2392157, 0, 1,
-1.830647, 0.6006432, -0.5793627, 1, 0.2470588, 0, 1,
-1.818049, 0.4455346, 0.04547998, 1, 0.2509804, 0, 1,
-1.812329, 0.3828219, -0.8166077, 1, 0.2588235, 0, 1,
-1.79359, -1.399142, -2.866845, 1, 0.2627451, 0, 1,
-1.792872, -1.116548, -3.250818, 1, 0.2705882, 0, 1,
-1.782531, -0.3847469, -3.600428, 1, 0.2745098, 0, 1,
-1.772819, 0.0566548, -0.3633664, 1, 0.282353, 0, 1,
-1.770296, -0.07859515, -0.6602857, 1, 0.2862745, 0, 1,
-1.765934, 0.4184013, -1.04945, 1, 0.2941177, 0, 1,
-1.744067, -1.049798, -3.310969, 1, 0.3019608, 0, 1,
-1.730886, 1.30355, -1.180254, 1, 0.3058824, 0, 1,
-1.727797, 1.08696, -0.954166, 1, 0.3137255, 0, 1,
-1.723451, -0.4603758, -0.5583439, 1, 0.3176471, 0, 1,
-1.715722, -0.0486794, -2.068817, 1, 0.3254902, 0, 1,
-1.711198, -1.009171, -0.9932696, 1, 0.3294118, 0, 1,
-1.709811, -1.592535, -3.329833, 1, 0.3372549, 0, 1,
-1.707295, -0.2044088, -1.376626, 1, 0.3411765, 0, 1,
-1.662733, 0.6101941, -1.723411, 1, 0.3490196, 0, 1,
-1.661124, -0.7337629, -1.146434, 1, 0.3529412, 0, 1,
-1.645046, 1.140837, -0.1478371, 1, 0.3607843, 0, 1,
-1.644127, 1.387946, -0.6179184, 1, 0.3647059, 0, 1,
-1.642454, -0.02738681, -0.6492226, 1, 0.372549, 0, 1,
-1.633431, -0.322564, -1.130157, 1, 0.3764706, 0, 1,
-1.631723, 1.399651, -0.9729905, 1, 0.3843137, 0, 1,
-1.626842, -0.4328877, -0.6276877, 1, 0.3882353, 0, 1,
-1.585036, -1.384767, -1.896155, 1, 0.3960784, 0, 1,
-1.573091, 0.9862285, -1.072939, 1, 0.4039216, 0, 1,
-1.563839, 0.7449253, -2.339604, 1, 0.4078431, 0, 1,
-1.552837, 1.057748, 1.619576, 1, 0.4156863, 0, 1,
-1.542247, 0.06530745, -2.674311, 1, 0.4196078, 0, 1,
-1.539038, 0.6003413, -1.071513, 1, 0.427451, 0, 1,
-1.531674, 0.631968, -3.565389, 1, 0.4313726, 0, 1,
-1.527162, -0.5976942, -0.5686203, 1, 0.4392157, 0, 1,
-1.513255, 0.757158, -1.652806, 1, 0.4431373, 0, 1,
-1.499553, 0.4683321, -1.000744, 1, 0.4509804, 0, 1,
-1.494414, 0.05651823, -3.613119, 1, 0.454902, 0, 1,
-1.489066, -0.6045756, -1.43417, 1, 0.4627451, 0, 1,
-1.485965, -2.525271, -2.714745, 1, 0.4666667, 0, 1,
-1.484051, 0.350463, -1.983626, 1, 0.4745098, 0, 1,
-1.469917, 0.2069928, -2.962821, 1, 0.4784314, 0, 1,
-1.469556, 1.15545, -0.3863128, 1, 0.4862745, 0, 1,
-1.457202, 0.05662744, -2.202092, 1, 0.4901961, 0, 1,
-1.45575, 0.6139306, -0.7788162, 1, 0.4980392, 0, 1,
-1.444692, -0.3060979, -1.342733, 1, 0.5058824, 0, 1,
-1.444661, 1.258575, 0.1869007, 1, 0.509804, 0, 1,
-1.44206, -0.6729804, -2.565517, 1, 0.5176471, 0, 1,
-1.439276, -1.07176, -2.821592, 1, 0.5215687, 0, 1,
-1.438877, -0.9036949, -1.436856, 1, 0.5294118, 0, 1,
-1.438336, -0.5697502, -1.298356, 1, 0.5333334, 0, 1,
-1.433693, -1.186947, -1.63614, 1, 0.5411765, 0, 1,
-1.433378, 1.27911, 0.9038822, 1, 0.5450981, 0, 1,
-1.414721, 0.4857861, -1.313236, 1, 0.5529412, 0, 1,
-1.411095, -1.163337, -1.931551, 1, 0.5568628, 0, 1,
-1.377009, 1.013269, -0.6530934, 1, 0.5647059, 0, 1,
-1.370022, -0.6885619, -2.936298, 1, 0.5686275, 0, 1,
-1.352676, 0.3910908, -0.1264188, 1, 0.5764706, 0, 1,
-1.349643, -0.9818507, -2.658108, 1, 0.5803922, 0, 1,
-1.346485, 0.7194294, -1.155342, 1, 0.5882353, 0, 1,
-1.341748, 1.361383, 0.3346623, 1, 0.5921569, 0, 1,
-1.341701, 0.8101649, -0.1934291, 1, 0.6, 0, 1,
-1.3374, -1.500134, -1.595824, 1, 0.6078432, 0, 1,
-1.326323, 0.6073263, -0.1469466, 1, 0.6117647, 0, 1,
-1.325894, -0.4525737, -1.801874, 1, 0.6196079, 0, 1,
-1.325011, 0.3893595, -0.02504877, 1, 0.6235294, 0, 1,
-1.319533, 0.721365, -0.1664697, 1, 0.6313726, 0, 1,
-1.317039, 1.133781, -1.729584, 1, 0.6352941, 0, 1,
-1.290628, 0.5540367, 0.1448631, 1, 0.6431373, 0, 1,
-1.272025, 0.9247885, 2.187244, 1, 0.6470588, 0, 1,
-1.270463, -0.06791437, -0.06217277, 1, 0.654902, 0, 1,
-1.258293, 0.3569711, -2.48924, 1, 0.6588235, 0, 1,
-1.258254, -1.266364, -0.6828742, 1, 0.6666667, 0, 1,
-1.25396, 0.6184981, -0.8732064, 1, 0.6705883, 0, 1,
-1.253471, 0.3876082, -0.4319646, 1, 0.6784314, 0, 1,
-1.253028, -0.3563322, -1.589363, 1, 0.682353, 0, 1,
-1.238447, 0.09616669, -1.421692, 1, 0.6901961, 0, 1,
-1.237244, 0.0566428, -1.995025, 1, 0.6941177, 0, 1,
-1.233568, 0.04497651, -0.9787642, 1, 0.7019608, 0, 1,
-1.214698, -0.5095247, -1.603263, 1, 0.7098039, 0, 1,
-1.211862, 0.3955179, -2.378136, 1, 0.7137255, 0, 1,
-1.211277, -0.2409412, -2.479052, 1, 0.7215686, 0, 1,
-1.209066, 0.6394705, -2.466533, 1, 0.7254902, 0, 1,
-1.208097, -0.6843219, -2.329057, 1, 0.7333333, 0, 1,
-1.181924, 0.6080133, -0.4315108, 1, 0.7372549, 0, 1,
-1.177371, 0.05824023, -0.6215519, 1, 0.7450981, 0, 1,
-1.175349, 0.2225855, -2.915172, 1, 0.7490196, 0, 1,
-1.171563, 0.7723847, 0.6418377, 1, 0.7568628, 0, 1,
-1.165308, 1.186799, -0.01117874, 1, 0.7607843, 0, 1,
-1.161378, 0.4097952, 2.104204, 1, 0.7686275, 0, 1,
-1.160954, -1.036947, -2.320622, 1, 0.772549, 0, 1,
-1.158426, -0.9029271, -1.278722, 1, 0.7803922, 0, 1,
-1.157814, 0.05610241, -1.053457, 1, 0.7843137, 0, 1,
-1.156894, 0.8058213, -2.310711, 1, 0.7921569, 0, 1,
-1.152298, -0.3508618, -0.4640675, 1, 0.7960784, 0, 1,
-1.146528, 1.174957, 0.4155582, 1, 0.8039216, 0, 1,
-1.143085, 1.763931, -0.6018702, 1, 0.8117647, 0, 1,
-1.140051, -1.140197, -1.300241, 1, 0.8156863, 0, 1,
-1.137484, 0.8445424, -0.4892958, 1, 0.8235294, 0, 1,
-1.135987, -0.08418988, -1.691307, 1, 0.827451, 0, 1,
-1.135469, 2.922865, -0.9416035, 1, 0.8352941, 0, 1,
-1.131602, -0.4830083, -3.12535, 1, 0.8392157, 0, 1,
-1.121286, -0.7855622, -0.6627873, 1, 0.8470588, 0, 1,
-1.120957, 0.7729301, -0.8309706, 1, 0.8509804, 0, 1,
-1.11527, -1.584069, -2.874195, 1, 0.8588235, 0, 1,
-1.113006, 0.7299682, -0.8287418, 1, 0.8627451, 0, 1,
-1.110651, -0.6849719, -2.13296, 1, 0.8705882, 0, 1,
-1.110391, -0.3439248, -0.7591257, 1, 0.8745098, 0, 1,
-1.105454, 0.6754047, -2.382563, 1, 0.8823529, 0, 1,
-1.104917, -0.8550649, -2.278005, 1, 0.8862745, 0, 1,
-1.101122, 0.0109286, -2.829304, 1, 0.8941177, 0, 1,
-1.099421, -1.569449, -1.195991, 1, 0.8980392, 0, 1,
-1.093397, -1.242464, -2.693817, 1, 0.9058824, 0, 1,
-1.09159, 1.467257, -0.2128869, 1, 0.9137255, 0, 1,
-1.078831, -0.3149762, -0.6384647, 1, 0.9176471, 0, 1,
-1.075166, 0.2349009, -1.531383, 1, 0.9254902, 0, 1,
-1.059179, 2.264823, -0.5547221, 1, 0.9294118, 0, 1,
-1.058846, -0.7065284, -1.815736, 1, 0.9372549, 0, 1,
-1.056718, 0.2979198, -2.031171, 1, 0.9411765, 0, 1,
-1.055378, -1.030805, -2.330796, 1, 0.9490196, 0, 1,
-1.053045, -1.03789, -4.362517, 1, 0.9529412, 0, 1,
-1.048223, 1.358724, -0.9675345, 1, 0.9607843, 0, 1,
-1.04821, 0.5393267, -0.5921571, 1, 0.9647059, 0, 1,
-1.045968, -0.2379147, -3.353711, 1, 0.972549, 0, 1,
-1.035942, -1.371658, -3.630366, 1, 0.9764706, 0, 1,
-1.021266, 0.6855429, -0.9258347, 1, 0.9843137, 0, 1,
-1.017468, 0.8347453, -2.661205, 1, 0.9882353, 0, 1,
-1.016744, -0.1069209, -1.260158, 1, 0.9960784, 0, 1,
-1.016718, 0.4506311, 0.1902083, 0.9960784, 1, 0, 1,
-1.016485, 0.8106406, -2.650404, 0.9921569, 1, 0, 1,
-1.015344, -0.9436631, -2.107406, 0.9843137, 1, 0, 1,
-1.013196, 1.218516, 1.069258, 0.9803922, 1, 0, 1,
-1.012163, 0.5410775, -1.278816, 0.972549, 1, 0, 1,
-1.011253, 2.317268, -0.3160753, 0.9686275, 1, 0, 1,
-1.011193, -0.5844796, -3.466607, 0.9607843, 1, 0, 1,
-1.007878, -0.9442732, -1.652177, 0.9568627, 1, 0, 1,
-1.006241, 0.7152538, -0.8889903, 0.9490196, 1, 0, 1,
-0.9965943, 1.628997, -1.000972, 0.945098, 1, 0, 1,
-0.9850222, -0.8687366, -3.648657, 0.9372549, 1, 0, 1,
-0.9813702, -1.345958, -2.258005, 0.9333333, 1, 0, 1,
-0.978125, -0.1132181, -1.494248, 0.9254902, 1, 0, 1,
-0.9616119, 0.6490257, -1.670959, 0.9215686, 1, 0, 1,
-0.9515328, 1.415135, -0.2852043, 0.9137255, 1, 0, 1,
-0.9470794, 0.2497088, 0.009767535, 0.9098039, 1, 0, 1,
-0.9450058, 0.08837884, -0.8067755, 0.9019608, 1, 0, 1,
-0.9418401, -1.202659, -1.917319, 0.8941177, 1, 0, 1,
-0.941662, -0.08334665, -2.561044, 0.8901961, 1, 0, 1,
-0.9414847, 0.7866446, 0.257354, 0.8823529, 1, 0, 1,
-0.9412377, -0.5570644, -2.220354, 0.8784314, 1, 0, 1,
-0.9352854, 0.5900317, -0.4411962, 0.8705882, 1, 0, 1,
-0.9222894, 1.278807, -1.009243, 0.8666667, 1, 0, 1,
-0.9203327, -1.19087, -3.18768, 0.8588235, 1, 0, 1,
-0.9149482, -0.5519042, -2.562616, 0.854902, 1, 0, 1,
-0.9131622, 0.2288797, -0.889752, 0.8470588, 1, 0, 1,
-0.9122552, -0.3564323, -0.8785202, 0.8431373, 1, 0, 1,
-0.9117364, 0.0153332, 0.5838174, 0.8352941, 1, 0, 1,
-0.908304, -1.0134, -1.958919, 0.8313726, 1, 0, 1,
-0.9056397, -0.6917773, -1.687233, 0.8235294, 1, 0, 1,
-0.9037233, 0.4490783, 0.3411998, 0.8196079, 1, 0, 1,
-0.885594, 0.6653022, -0.7831717, 0.8117647, 1, 0, 1,
-0.8851026, 1.186717, -1.774965, 0.8078431, 1, 0, 1,
-0.8834348, 1.553954, -1.718858, 0.8, 1, 0, 1,
-0.8820496, -2.550141, -1.930782, 0.7921569, 1, 0, 1,
-0.8779036, 0.3200551, -0.6837988, 0.7882353, 1, 0, 1,
-0.876748, 0.8961186, -0.720203, 0.7803922, 1, 0, 1,
-0.8629897, -1.429091, -3.181747, 0.7764706, 1, 0, 1,
-0.851002, 0.8180027, -0.3320478, 0.7686275, 1, 0, 1,
-0.8385314, -0.3398357, -0.934692, 0.7647059, 1, 0, 1,
-0.8291752, 1.682671, -0.5112297, 0.7568628, 1, 0, 1,
-0.8093764, -0.730631, -0.7262393, 0.7529412, 1, 0, 1,
-0.8070336, -0.5211846, -1.477947, 0.7450981, 1, 0, 1,
-0.8064674, 0.4432286, -2.228471, 0.7411765, 1, 0, 1,
-0.8060688, -1.601007, -2.749512, 0.7333333, 1, 0, 1,
-0.8013672, -0.5900324, -1.960252, 0.7294118, 1, 0, 1,
-0.8001167, -1.582623, -2.238264, 0.7215686, 1, 0, 1,
-0.7968009, 1.051856, -1.378267, 0.7176471, 1, 0, 1,
-0.7927793, -1.885834, -3.948701, 0.7098039, 1, 0, 1,
-0.7904212, 2.155285, -1.358982, 0.7058824, 1, 0, 1,
-0.7896965, 0.3733288, -0.7102635, 0.6980392, 1, 0, 1,
-0.785227, -0.4183525, -3.262847, 0.6901961, 1, 0, 1,
-0.7839599, -0.6856127, -4.316091, 0.6862745, 1, 0, 1,
-0.7839157, 2.928452, 1.907988, 0.6784314, 1, 0, 1,
-0.7835405, -1.583227, -2.458458, 0.6745098, 1, 0, 1,
-0.77614, -1.076232, -1.638904, 0.6666667, 1, 0, 1,
-0.7758399, 1.33811, -1.634263, 0.6627451, 1, 0, 1,
-0.7750662, 0.1170217, -0.4329009, 0.654902, 1, 0, 1,
-0.7692974, 0.9288261, -1.498348, 0.6509804, 1, 0, 1,
-0.7442225, -1.691994, -3.53204, 0.6431373, 1, 0, 1,
-0.7346316, -0.4074393, -2.932578, 0.6392157, 1, 0, 1,
-0.7274661, 1.146469, 0.01376292, 0.6313726, 1, 0, 1,
-0.7256141, -0.7857931, -3.115632, 0.627451, 1, 0, 1,
-0.7163441, -0.591469, -0.3049328, 0.6196079, 1, 0, 1,
-0.7155134, 0.3203227, -0.7790006, 0.6156863, 1, 0, 1,
-0.7148352, 0.04263372, -1.570211, 0.6078432, 1, 0, 1,
-0.7024316, -1.294038, -1.426385, 0.6039216, 1, 0, 1,
-0.6938468, -0.2108855, -3.544713, 0.5960785, 1, 0, 1,
-0.693491, -0.8020082, -1.593524, 0.5882353, 1, 0, 1,
-0.6879693, 0.9301218, -0.9417009, 0.5843138, 1, 0, 1,
-0.6829598, 2.122743, -1.898001, 0.5764706, 1, 0, 1,
-0.6814399, -0.4900685, -3.138, 0.572549, 1, 0, 1,
-0.6802161, 0.0796272, -1.501346, 0.5647059, 1, 0, 1,
-0.680006, 1.421984, 1.329039, 0.5607843, 1, 0, 1,
-0.6730433, 0.9662132, -0.4883842, 0.5529412, 1, 0, 1,
-0.6724157, 0.7349806, 0.2118551, 0.5490196, 1, 0, 1,
-0.6721969, 0.0215049, -1.481779, 0.5411765, 1, 0, 1,
-0.6622003, -0.9748367, -3.088385, 0.5372549, 1, 0, 1,
-0.6537141, -0.3054732, -4.725556, 0.5294118, 1, 0, 1,
-0.6499906, 1.240165, -3.798048, 0.5254902, 1, 0, 1,
-0.6499317, -0.6162566, -3.067427, 0.5176471, 1, 0, 1,
-0.6474591, -0.2509283, -0.7671505, 0.5137255, 1, 0, 1,
-0.6388606, -0.6844657, -1.723487, 0.5058824, 1, 0, 1,
-0.6386968, 0.1588877, -2.747672, 0.5019608, 1, 0, 1,
-0.6363859, -0.6424162, -2.390183, 0.4941176, 1, 0, 1,
-0.6333991, -2.305518, -2.408375, 0.4862745, 1, 0, 1,
-0.6304067, -0.06296697, 0.3816196, 0.4823529, 1, 0, 1,
-0.6292722, -0.03094443, -3.013959, 0.4745098, 1, 0, 1,
-0.6230422, 0.7485804, -1.601961, 0.4705882, 1, 0, 1,
-0.6217069, -0.5388213, -0.7404625, 0.4627451, 1, 0, 1,
-0.6207519, 0.7999769, 1.059891, 0.4588235, 1, 0, 1,
-0.6204077, 0.5258333, 0.395958, 0.4509804, 1, 0, 1,
-0.6185468, -0.4407758, -1.597652, 0.4470588, 1, 0, 1,
-0.6170731, 1.501602, -0.08612822, 0.4392157, 1, 0, 1,
-0.6163656, 0.08416762, -2.2173, 0.4352941, 1, 0, 1,
-0.6120127, 0.2060698, -0.2408514, 0.427451, 1, 0, 1,
-0.6118286, -0.5036404, -2.457957, 0.4235294, 1, 0, 1,
-0.6107802, 0.8649538, -0.8517756, 0.4156863, 1, 0, 1,
-0.6094146, -1.083104, -3.561398, 0.4117647, 1, 0, 1,
-0.6079943, 0.7701454, 0.3615892, 0.4039216, 1, 0, 1,
-0.6061281, -0.8249696, -3.001872, 0.3960784, 1, 0, 1,
-0.6048253, -1.298833, -3.063249, 0.3921569, 1, 0, 1,
-0.5968594, -0.0003913551, -0.3563432, 0.3843137, 1, 0, 1,
-0.5964127, -1.2136, -2.838491, 0.3803922, 1, 0, 1,
-0.5844133, 1.4032, -1.118974, 0.372549, 1, 0, 1,
-0.5833032, 2.222336, -1.275458, 0.3686275, 1, 0, 1,
-0.5742181, -0.6572718, -2.150695, 0.3607843, 1, 0, 1,
-0.5725439, 0.8101797, -0.1114381, 0.3568628, 1, 0, 1,
-0.5719105, 0.7969909, -0.2875269, 0.3490196, 1, 0, 1,
-0.5707004, -0.1636332, -2.888926, 0.345098, 1, 0, 1,
-0.5699277, -0.03201985, -1.014487, 0.3372549, 1, 0, 1,
-0.5653605, 0.4155217, -1.768657, 0.3333333, 1, 0, 1,
-0.5637755, 0.4681986, -1.685867, 0.3254902, 1, 0, 1,
-0.5622393, -0.3043481, -2.987847, 0.3215686, 1, 0, 1,
-0.56141, -0.817771, -3.563071, 0.3137255, 1, 0, 1,
-0.5593027, 0.09845053, -1.910893, 0.3098039, 1, 0, 1,
-0.5584438, 2.094007, -0.3405772, 0.3019608, 1, 0, 1,
-0.5539901, 0.6060808, 0.00911446, 0.2941177, 1, 0, 1,
-0.5402895, -0.0967219, -2.100993, 0.2901961, 1, 0, 1,
-0.5389318, -0.6564512, -1.893157, 0.282353, 1, 0, 1,
-0.5382784, -0.172966, -3.18068, 0.2784314, 1, 0, 1,
-0.5362642, -1.147781, -4.564213, 0.2705882, 1, 0, 1,
-0.5347357, 0.07247806, -1.613534, 0.2666667, 1, 0, 1,
-0.5296469, -0.1040912, -1.963801, 0.2588235, 1, 0, 1,
-0.5290789, 2.464235, -0.3179426, 0.254902, 1, 0, 1,
-0.5279608, -1.339053, -3.150859, 0.2470588, 1, 0, 1,
-0.5254978, 0.5701442, 1.168203, 0.2431373, 1, 0, 1,
-0.5222886, -0.6722169, -2.292005, 0.2352941, 1, 0, 1,
-0.5209167, 0.6172523, -1.590752, 0.2313726, 1, 0, 1,
-0.5164582, -0.4835536, -2.688841, 0.2235294, 1, 0, 1,
-0.5163896, 0.1376707, -2.357396, 0.2196078, 1, 0, 1,
-0.5127959, -1.279458, -3.132966, 0.2117647, 1, 0, 1,
-0.5095099, 0.1267956, -1.437048, 0.2078431, 1, 0, 1,
-0.5037246, 0.7618122, -2.216004, 0.2, 1, 0, 1,
-0.5034882, -0.1176917, -2.861917, 0.1921569, 1, 0, 1,
-0.5027843, -1.361309, -3.343587, 0.1882353, 1, 0, 1,
-0.5019165, 0.3455584, -1.463092, 0.1803922, 1, 0, 1,
-0.5012263, -1.005427, -2.972064, 0.1764706, 1, 0, 1,
-0.5003445, -0.7498329, -2.974778, 0.1686275, 1, 0, 1,
-0.5001997, 0.0764166, -2.546398, 0.1647059, 1, 0, 1,
-0.4901291, 0.01744615, -0.7302327, 0.1568628, 1, 0, 1,
-0.4888646, 0.711547, -0.7440294, 0.1529412, 1, 0, 1,
-0.4881947, 1.378985, -1.547422, 0.145098, 1, 0, 1,
-0.4877497, -0.3762268, -1.607736, 0.1411765, 1, 0, 1,
-0.487616, 0.1715652, -0.5752802, 0.1333333, 1, 0, 1,
-0.4804515, 1.324633, 0.3653357, 0.1294118, 1, 0, 1,
-0.4757112, -1.268043, -4.646606, 0.1215686, 1, 0, 1,
-0.4743366, -1.897612, -3.637808, 0.1176471, 1, 0, 1,
-0.4613849, 0.6537575, -1.4643, 0.1098039, 1, 0, 1,
-0.4579713, 0.07638791, -0.4357823, 0.1058824, 1, 0, 1,
-0.4563209, -2.043738, -2.007071, 0.09803922, 1, 0, 1,
-0.4559215, -0.8513314, -1.751062, 0.09019608, 1, 0, 1,
-0.4557871, 1.177762, 0.6770001, 0.08627451, 1, 0, 1,
-0.4541191, -0.1076589, -0.9295286, 0.07843138, 1, 0, 1,
-0.4535163, -2.58487, -1.9398, 0.07450981, 1, 0, 1,
-0.4529458, 0.7167227, -1.717301, 0.06666667, 1, 0, 1,
-0.4480926, -0.373485, -1.569887, 0.0627451, 1, 0, 1,
-0.4401712, 0.08884353, -2.784335, 0.05490196, 1, 0, 1,
-0.4375109, 1.840929, 1.055867, 0.05098039, 1, 0, 1,
-0.435187, 0.6171925, -1.667396, 0.04313726, 1, 0, 1,
-0.4349567, -0.9658946, -3.019094, 0.03921569, 1, 0, 1,
-0.4339819, -0.02625569, -1.377455, 0.03137255, 1, 0, 1,
-0.4331876, -2.743873, -2.539922, 0.02745098, 1, 0, 1,
-0.4217599, -0.4971607, -1.214364, 0.01960784, 1, 0, 1,
-0.4180509, -0.8431224, -2.319789, 0.01568628, 1, 0, 1,
-0.4170344, -1.890148, -0.6771088, 0.007843138, 1, 0, 1,
-0.4167331, 0.7727917, -1.93572, 0.003921569, 1, 0, 1,
-0.4151871, -0.7876677, -3.495259, 0, 1, 0.003921569, 1,
-0.409881, 0.1913939, -0.5492941, 0, 1, 0.01176471, 1,
-0.4098575, 0.8203838, -0.5130572, 0, 1, 0.01568628, 1,
-0.4078071, -1.472499, -2.163939, 0, 1, 0.02352941, 1,
-0.4072922, 1.19734, -0.8656984, 0, 1, 0.02745098, 1,
-0.4046844, -0.08084222, -0.9550113, 0, 1, 0.03529412, 1,
-0.4023331, 0.6327574, -0.1903018, 0, 1, 0.03921569, 1,
-0.3976413, -1.358308, -3.399127, 0, 1, 0.04705882, 1,
-0.3909948, 0.3812667, -0.829611, 0, 1, 0.05098039, 1,
-0.3866795, 0.07785708, -0.9393728, 0, 1, 0.05882353, 1,
-0.3845512, -0.9553223, -2.604597, 0, 1, 0.0627451, 1,
-0.3841504, -2.09076, -2.912848, 0, 1, 0.07058824, 1,
-0.3836765, 0.4387538, -0.814846, 0, 1, 0.07450981, 1,
-0.3784638, -1.894931, -3.207741, 0, 1, 0.08235294, 1,
-0.3717805, 1.202711, 1.011714, 0, 1, 0.08627451, 1,
-0.3704226, -0.8401304, -3.750673, 0, 1, 0.09411765, 1,
-0.3703793, 2.034105, -0.02097011, 0, 1, 0.1019608, 1,
-0.3687762, 0.02833829, -1.498074, 0, 1, 0.1058824, 1,
-0.3658161, -0.595738, -3.778821, 0, 1, 0.1137255, 1,
-0.3637867, -2.45555, -1.063205, 0, 1, 0.1176471, 1,
-0.3600884, -0.6965302, -2.203105, 0, 1, 0.1254902, 1,
-0.3575895, 0.7399166, -1.623332, 0, 1, 0.1294118, 1,
-0.3554263, -1.001866, -3.27158, 0, 1, 0.1372549, 1,
-0.3522453, 0.774002, -0.2316207, 0, 1, 0.1411765, 1,
-0.3487425, -1.304709, -4.212688, 0, 1, 0.1490196, 1,
-0.3483377, 1.162994, -1.348217, 0, 1, 0.1529412, 1,
-0.3442903, 0.4924733, -2.360645, 0, 1, 0.1607843, 1,
-0.3439549, -2.112104, -3.054354, 0, 1, 0.1647059, 1,
-0.3423626, -0.7712331, -3.578645, 0, 1, 0.172549, 1,
-0.3319854, -0.2950263, -3.525023, 0, 1, 0.1764706, 1,
-0.3270293, -0.5743202, -2.863091, 0, 1, 0.1843137, 1,
-0.3266553, -0.01656019, -0.5181661, 0, 1, 0.1882353, 1,
-0.3251407, -1.580186, -3.879077, 0, 1, 0.1960784, 1,
-0.3194813, 0.6166288, -0.003523537, 0, 1, 0.2039216, 1,
-0.3146369, 0.7686548, -0.108767, 0, 1, 0.2078431, 1,
-0.3142667, -0.3362665, -0.163679, 0, 1, 0.2156863, 1,
-0.313156, -1.152208, -4.666252, 0, 1, 0.2196078, 1,
-0.3126403, 1.408404, 0.7716394, 0, 1, 0.227451, 1,
-0.3115886, -0.6007771, -3.980879, 0, 1, 0.2313726, 1,
-0.3110946, -0.1267163, -3.437583, 0, 1, 0.2392157, 1,
-0.3076884, -1.887885, -3.985517, 0, 1, 0.2431373, 1,
-0.3076155, 0.3016397, 0.2136258, 0, 1, 0.2509804, 1,
-0.3059142, 0.5267385, -0.004328405, 0, 1, 0.254902, 1,
-0.304432, -0.3680412, -3.411176, 0, 1, 0.2627451, 1,
-0.3031508, -1.012326, -3.075878, 0, 1, 0.2666667, 1,
-0.3021998, 0.6324434, -1.022929, 0, 1, 0.2745098, 1,
-0.3004766, 2.132004, 0.1827356, 0, 1, 0.2784314, 1,
-0.299815, 0.9121506, -0.8234804, 0, 1, 0.2862745, 1,
-0.2977538, -0.9796969, -3.220969, 0, 1, 0.2901961, 1,
-0.293497, -0.3168326, -0.5159936, 0, 1, 0.2980392, 1,
-0.2923131, -1.56471, -2.602845, 0, 1, 0.3058824, 1,
-0.2901129, 0.190173, -0.6995355, 0, 1, 0.3098039, 1,
-0.2850044, -0.7319966, -2.507657, 0, 1, 0.3176471, 1,
-0.2817911, -0.4124538, -1.385347, 0, 1, 0.3215686, 1,
-0.2697865, -0.04708011, -3.933988, 0, 1, 0.3294118, 1,
-0.2677867, 0.8289475, -0.06370091, 0, 1, 0.3333333, 1,
-0.2641067, 2.373647, -0.0522854, 0, 1, 0.3411765, 1,
-0.2626431, 0.5896928, 0.3363486, 0, 1, 0.345098, 1,
-0.259736, -0.5087029, -1.624938, 0, 1, 0.3529412, 1,
-0.2589483, 2.839562, -0.1590017, 0, 1, 0.3568628, 1,
-0.2586106, -0.8628238, -3.646005, 0, 1, 0.3647059, 1,
-0.2584104, -0.4439426, -1.9658, 0, 1, 0.3686275, 1,
-0.2563176, 1.424214, 0.3586009, 0, 1, 0.3764706, 1,
-0.2533505, 0.8380591, 2.717434, 0, 1, 0.3803922, 1,
-0.2522386, 1.226745, 0.6163423, 0, 1, 0.3882353, 1,
-0.250338, 0.8763391, -0.5067878, 0, 1, 0.3921569, 1,
-0.2500107, 0.4132634, -0.8161338, 0, 1, 0.4, 1,
-0.2493633, 0.7385544, 0.6679184, 0, 1, 0.4078431, 1,
-0.2437691, -0.3776339, -3.429539, 0, 1, 0.4117647, 1,
-0.2416153, 2.736072, -0.7796973, 0, 1, 0.4196078, 1,
-0.2339385, 1.033483, 0.3029969, 0, 1, 0.4235294, 1,
-0.2332003, -0.4355915, -3.385357, 0, 1, 0.4313726, 1,
-0.2309836, -0.165251, -1.178244, 0, 1, 0.4352941, 1,
-0.2292907, -0.3323441, -2.523516, 0, 1, 0.4431373, 1,
-0.2244653, -0.1046276, -1.47467, 0, 1, 0.4470588, 1,
-0.2236858, 0.5742261, -2.470241, 0, 1, 0.454902, 1,
-0.2231996, 1.822462, -0.2603609, 0, 1, 0.4588235, 1,
-0.2172491, -1.16951, -1.848203, 0, 1, 0.4666667, 1,
-0.2153561, -0.3315358, -3.864388, 0, 1, 0.4705882, 1,
-0.212255, -0.8554765, -1.823843, 0, 1, 0.4784314, 1,
-0.2073956, 1.985281, -0.6825439, 0, 1, 0.4823529, 1,
-0.2041467, 0.9741597, -0.6576388, 0, 1, 0.4901961, 1,
-0.2037589, -0.9841058, -5.969363, 0, 1, 0.4941176, 1,
-0.2003216, -1.845285, -2.683408, 0, 1, 0.5019608, 1,
-0.2002728, -0.5669849, -2.975497, 0, 1, 0.509804, 1,
-0.1994868, -0.7043778, -4.331892, 0, 1, 0.5137255, 1,
-0.1980192, -0.4758351, -1.134749, 0, 1, 0.5215687, 1,
-0.1972913, 1.132117, 0.09301623, 0, 1, 0.5254902, 1,
-0.1940853, -1.236244, -2.173853, 0, 1, 0.5333334, 1,
-0.1934117, 2.886204, 0.5382795, 0, 1, 0.5372549, 1,
-0.1902012, 0.9980832, 0.6565402, 0, 1, 0.5450981, 1,
-0.1877609, 1.141758, 1.319263, 0, 1, 0.5490196, 1,
-0.1859305, 0.7046768, -0.5646753, 0, 1, 0.5568628, 1,
-0.1800726, -0.4242472, -4.41391, 0, 1, 0.5607843, 1,
-0.1795743, -0.3408668, -3.248893, 0, 1, 0.5686275, 1,
-0.1794095, -0.2121894, -2.11386, 0, 1, 0.572549, 1,
-0.172306, 1.437297, 0.1277416, 0, 1, 0.5803922, 1,
-0.1706224, 0.8287712, -0.7927135, 0, 1, 0.5843138, 1,
-0.1655393, 0.7703568, 0.01579525, 0, 1, 0.5921569, 1,
-0.1652941, -2.03467, -4.133044, 0, 1, 0.5960785, 1,
-0.1639769, -0.3201329, -1.784612, 0, 1, 0.6039216, 1,
-0.1624673, 0.3446109, 0.7969079, 0, 1, 0.6117647, 1,
-0.1605059, -1.141155, -3.22784, 0, 1, 0.6156863, 1,
-0.1564535, -0.242791, -2.649981, 0, 1, 0.6235294, 1,
-0.1555278, 1.366715, 0.8654546, 0, 1, 0.627451, 1,
-0.1553286, 0.3103178, -1.326289, 0, 1, 0.6352941, 1,
-0.1532692, 0.0571439, -1.995017, 0, 1, 0.6392157, 1,
-0.1532263, -0.6352161, -4.620186, 0, 1, 0.6470588, 1,
-0.153037, -0.09428905, -3.477099, 0, 1, 0.6509804, 1,
-0.1502117, -0.4145541, -4.564048, 0, 1, 0.6588235, 1,
-0.1467064, 2.92514, 0.6119865, 0, 1, 0.6627451, 1,
-0.1457178, 1.736681, 0.8553416, 0, 1, 0.6705883, 1,
-0.1442634, -0.7212356, -4.245905, 0, 1, 0.6745098, 1,
-0.1413272, -1.227989, -3.145346, 0, 1, 0.682353, 1,
-0.1398334, 0.05163653, -1.539622, 0, 1, 0.6862745, 1,
-0.1360233, -1.570331, -5.361688, 0, 1, 0.6941177, 1,
-0.1342816, -0.9078064, -2.967481, 0, 1, 0.7019608, 1,
-0.1316056, 1.487632, -0.5672218, 0, 1, 0.7058824, 1,
-0.1309005, -0.1412271, -3.358074, 0, 1, 0.7137255, 1,
-0.1305866, 0.4240103, -0.9540812, 0, 1, 0.7176471, 1,
-0.1291778, -0.7698845, -3.372809, 0, 1, 0.7254902, 1,
-0.1250796, -2.784561, -3.457575, 0, 1, 0.7294118, 1,
-0.121391, 0.6140184, -0.1327327, 0, 1, 0.7372549, 1,
-0.1203193, 1.031395, -0.7522972, 0, 1, 0.7411765, 1,
-0.1201097, -0.9959946, -5.093411, 0, 1, 0.7490196, 1,
-0.116145, -0.05866948, -2.349577, 0, 1, 0.7529412, 1,
-0.1149671, -0.9102392, -3.234162, 0, 1, 0.7607843, 1,
-0.1122458, -0.6361023, -5.385158, 0, 1, 0.7647059, 1,
-0.1101993, 0.686257, 2.171881, 0, 1, 0.772549, 1,
-0.108654, 1.408219, 0.6995423, 0, 1, 0.7764706, 1,
-0.1081599, 0.4824226, 1.283107, 0, 1, 0.7843137, 1,
-0.1071527, 0.8549957, -0.4898987, 0, 1, 0.7882353, 1,
-0.1055056, -0.3834372, -2.87382, 0, 1, 0.7960784, 1,
-0.1041395, -0.6622149, -2.445502, 0, 1, 0.8039216, 1,
-0.1029319, 1.235711, 0.5142268, 0, 1, 0.8078431, 1,
-0.10273, 0.4317528, -1.668424, 0, 1, 0.8156863, 1,
-0.1017348, 0.1827928, -1.07934, 0, 1, 0.8196079, 1,
-0.09831385, 0.4030567, -0.8186935, 0, 1, 0.827451, 1,
-0.09687824, 0.3628906, -0.03821908, 0, 1, 0.8313726, 1,
-0.09451092, -2.337122, -5.251998, 0, 1, 0.8392157, 1,
-0.09244065, 0.6214284, 1.127538, 0, 1, 0.8431373, 1,
-0.09170371, 0.3098644, -0.3065029, 0, 1, 0.8509804, 1,
-0.08990959, 0.3681157, 0.3138842, 0, 1, 0.854902, 1,
-0.08957301, -0.3716533, -3.796001, 0, 1, 0.8627451, 1,
-0.08834387, 1.09226, 0.1597282, 0, 1, 0.8666667, 1,
-0.08385437, -0.3238721, -3.242063, 0, 1, 0.8745098, 1,
-0.08309623, 1.094785, 0.8279343, 0, 1, 0.8784314, 1,
-0.07273486, -0.2190375, -3.230036, 0, 1, 0.8862745, 1,
-0.07120728, 1.01178, 0.6191595, 0, 1, 0.8901961, 1,
-0.06806889, -0.14807, 0.6464717, 0, 1, 0.8980392, 1,
-0.06694314, 0.9100411, -0.05811675, 0, 1, 0.9058824, 1,
-0.06631619, -0.5079836, -3.658065, 0, 1, 0.9098039, 1,
-0.0601025, -0.4145259, -4.270606, 0, 1, 0.9176471, 1,
-0.05835383, -1.220346, -4.496142, 0, 1, 0.9215686, 1,
-0.05244659, 0.0707968, -1.404274, 0, 1, 0.9294118, 1,
-0.05168764, 1.930859, -0.6773309, 0, 1, 0.9333333, 1,
-0.04885275, -1.127114, -1.733262, 0, 1, 0.9411765, 1,
-0.04573848, 0.6170767, -0.4502033, 0, 1, 0.945098, 1,
-0.03938182, 1.227909, 0.3897057, 0, 1, 0.9529412, 1,
-0.03767639, -0.4698908, -2.224313, 0, 1, 0.9568627, 1,
-0.03720787, -2.456486, -4.540529, 0, 1, 0.9647059, 1,
-0.03652705, 1.556228, 0.3949683, 0, 1, 0.9686275, 1,
-0.03411746, 1.033035, 0.4385194, 0, 1, 0.9764706, 1,
-0.02091684, -0.8187618, -4.226434, 0, 1, 0.9803922, 1,
-0.01893532, 0.5882412, 0.8938162, 0, 1, 0.9882353, 1,
-0.01873513, 1.748078, 0.2469787, 0, 1, 0.9921569, 1,
-0.01141527, 1.303547, -0.2158423, 0, 1, 1, 1,
-0.01106061, -1.192743, -1.918542, 0, 0.9921569, 1, 1,
-0.008225227, -0.2663421, -3.385706, 0, 0.9882353, 1, 1,
-0.006977465, -0.8020726, -4.804419, 0, 0.9803922, 1, 1,
-0.005207593, -0.933025, -1.993983, 0, 0.9764706, 1, 1,
-0.004378479, -0.16993, -5.657022, 0, 0.9686275, 1, 1,
0.0003617322, 1.043035, 0.8934229, 0, 0.9647059, 1, 1,
0.001244161, 0.4209905, 1.185099, 0, 0.9568627, 1, 1,
0.003207043, -0.3461651, 2.383817, 0, 0.9529412, 1, 1,
0.007632886, 0.8207475, -0.2699314, 0, 0.945098, 1, 1,
0.008627926, 1.490884, 0.2135563, 0, 0.9411765, 1, 1,
0.01314245, -1.466409, 2.747938, 0, 0.9333333, 1, 1,
0.01517223, -0.9939277, 3.651809, 0, 0.9294118, 1, 1,
0.01781154, 0.3102445, -1.110388, 0, 0.9215686, 1, 1,
0.02157672, 0.1935144, 1.932252, 0, 0.9176471, 1, 1,
0.02871582, -0.1367212, 3.761994, 0, 0.9098039, 1, 1,
0.03235988, 0.5987234, -1.369617, 0, 0.9058824, 1, 1,
0.03439342, -1.958555, 4.395051, 0, 0.8980392, 1, 1,
0.03489229, -0.6267052, 2.294476, 0, 0.8901961, 1, 1,
0.0359597, -1.232345, 2.884434, 0, 0.8862745, 1, 1,
0.03700941, 0.2941041, 0.7881188, 0, 0.8784314, 1, 1,
0.04324879, -1.122152, 1.117419, 0, 0.8745098, 1, 1,
0.05238128, 1.29336, -0.2434139, 0, 0.8666667, 1, 1,
0.05653314, -0.5666381, 3.362657, 0, 0.8627451, 1, 1,
0.05725514, -1.321553, 3.713988, 0, 0.854902, 1, 1,
0.05780788, 0.05962018, 2.601161, 0, 0.8509804, 1, 1,
0.06415572, 0.4940855, -0.03010498, 0, 0.8431373, 1, 1,
0.06425969, 0.5380402, 0.0396313, 0, 0.8392157, 1, 1,
0.06786426, 0.4246486, -1.292609, 0, 0.8313726, 1, 1,
0.06824468, 0.2651695, 0.3498949, 0, 0.827451, 1, 1,
0.06956659, -0.3946138, 1.807462, 0, 0.8196079, 1, 1,
0.07219183, 0.6517882, 0.4845245, 0, 0.8156863, 1, 1,
0.07264788, 0.3440657, -0.109632, 0, 0.8078431, 1, 1,
0.07405933, -1.671591, 2.446531, 0, 0.8039216, 1, 1,
0.07519444, -1.083679, 2.188625, 0, 0.7960784, 1, 1,
0.08049515, 0.3041329, 1.858553, 0, 0.7882353, 1, 1,
0.08201981, 0.5262859, 1.328527, 0, 0.7843137, 1, 1,
0.0823002, 0.6239557, -0.4340234, 0, 0.7764706, 1, 1,
0.08375181, 0.8133981, -0.6088973, 0, 0.772549, 1, 1,
0.0837798, -0.2642258, 2.457803, 0, 0.7647059, 1, 1,
0.08414067, 0.1730916, -0.1919812, 0, 0.7607843, 1, 1,
0.08444972, 0.9311509, -1.532054, 0, 0.7529412, 1, 1,
0.08789128, 0.4010358, 2.101291, 0, 0.7490196, 1, 1,
0.08867257, -0.1187431, 2.512683, 0, 0.7411765, 1, 1,
0.0911588, -0.8080301, 3.952675, 0, 0.7372549, 1, 1,
0.09117024, -0.6075646, 2.717763, 0, 0.7294118, 1, 1,
0.09258968, -0.182039, 2.766911, 0, 0.7254902, 1, 1,
0.09412927, 0.2057863, -0.9431863, 0, 0.7176471, 1, 1,
0.09482656, -0.2290224, 1.103527, 0, 0.7137255, 1, 1,
0.0956892, -0.8884337, 0.6619263, 0, 0.7058824, 1, 1,
0.1001465, -1.073212, 2.879884, 0, 0.6980392, 1, 1,
0.1001874, 0.3625241, 1.407659, 0, 0.6941177, 1, 1,
0.1109006, -0.006139275, 3.805595, 0, 0.6862745, 1, 1,
0.1123226, -1.038161, 3.850157, 0, 0.682353, 1, 1,
0.115277, -0.9283804, 3.437891, 0, 0.6745098, 1, 1,
0.1176706, -1.204054, 1.90172, 0, 0.6705883, 1, 1,
0.1186304, 0.3841607, 0.2305329, 0, 0.6627451, 1, 1,
0.1226778, 0.2177338, 1.143951, 0, 0.6588235, 1, 1,
0.1245305, 0.4843838, -0.7587104, 0, 0.6509804, 1, 1,
0.1253663, 0.3135062, -0.2966906, 0, 0.6470588, 1, 1,
0.1265841, -1.067287, 4.752717, 0, 0.6392157, 1, 1,
0.1306279, -0.3320004, 3.087605, 0, 0.6352941, 1, 1,
0.1325629, -0.941911, 4.898154, 0, 0.627451, 1, 1,
0.136176, -0.5511839, 2.516121, 0, 0.6235294, 1, 1,
0.1376601, -0.9821349, 3.630402, 0, 0.6156863, 1, 1,
0.1388063, -0.5192491, 1.500159, 0, 0.6117647, 1, 1,
0.1429039, -0.1652003, 3.864034, 0, 0.6039216, 1, 1,
0.1441708, 0.4139385, -0.01059319, 0, 0.5960785, 1, 1,
0.1522545, 1.022437, 0.1937341, 0, 0.5921569, 1, 1,
0.1600975, -0.6542776, 1.837029, 0, 0.5843138, 1, 1,
0.1629174, 0.6666933, -1.217961, 0, 0.5803922, 1, 1,
0.172996, 0.8951989, 1.327408, 0, 0.572549, 1, 1,
0.1732648, -0.9448905, 2.835833, 0, 0.5686275, 1, 1,
0.1748402, 0.2453618, 0.03495269, 0, 0.5607843, 1, 1,
0.1751718, -1.18767, 3.4611, 0, 0.5568628, 1, 1,
0.179715, -1.520325, 4.791395, 0, 0.5490196, 1, 1,
0.1829105, -1.195177, 3.597123, 0, 0.5450981, 1, 1,
0.1870948, -0.9599334, 3.106763, 0, 0.5372549, 1, 1,
0.1896005, -0.4076892, 2.408111, 0, 0.5333334, 1, 1,
0.1923591, 0.6293706, -0.03331765, 0, 0.5254902, 1, 1,
0.1958729, -0.595431, 2.428022, 0, 0.5215687, 1, 1,
0.199435, -1.359674, 2.846605, 0, 0.5137255, 1, 1,
0.1996873, 0.07968619, 0.9308534, 0, 0.509804, 1, 1,
0.2011444, 0.04558748, 2.50272, 0, 0.5019608, 1, 1,
0.2013018, 0.5572062, -0.3406544, 0, 0.4941176, 1, 1,
0.2088859, -0.3109988, 0.9258841, 0, 0.4901961, 1, 1,
0.2092337, -0.01622203, 2.155981, 0, 0.4823529, 1, 1,
0.2094204, -0.3446335, 2.887908, 0, 0.4784314, 1, 1,
0.2106783, 0.7754902, 0.7732394, 0, 0.4705882, 1, 1,
0.211121, 0.8534802, -0.184278, 0, 0.4666667, 1, 1,
0.2136298, -0.1965218, 3.284846, 0, 0.4588235, 1, 1,
0.2149019, -1.579681, 4.074618, 0, 0.454902, 1, 1,
0.2160489, 1.023758, 0.1980896, 0, 0.4470588, 1, 1,
0.2160504, -2.076268, 3.583242, 0, 0.4431373, 1, 1,
0.2223088, -0.4508898, 2.894366, 0, 0.4352941, 1, 1,
0.2230739, -1.012328, 2.901213, 0, 0.4313726, 1, 1,
0.2318324, -0.4203051, 3.323886, 0, 0.4235294, 1, 1,
0.2342666, 0.8187749, 0.1122509, 0, 0.4196078, 1, 1,
0.2393424, 0.03627663, 2.729566, 0, 0.4117647, 1, 1,
0.2407764, -0.6519074, 4.016626, 0, 0.4078431, 1, 1,
0.2460713, 0.7085377, 0.428834, 0, 0.4, 1, 1,
0.2509142, -1.564594, 1.787726, 0, 0.3921569, 1, 1,
0.2519611, 1.005734, 0.8938166, 0, 0.3882353, 1, 1,
0.2522734, 0.05218333, 2.089342, 0, 0.3803922, 1, 1,
0.2523841, 0.8030731, 0.960982, 0, 0.3764706, 1, 1,
0.2547228, 0.3544617, -0.2079729, 0, 0.3686275, 1, 1,
0.2577408, -1.05785, 2.217887, 0, 0.3647059, 1, 1,
0.2617582, -2.197557, 3.729917, 0, 0.3568628, 1, 1,
0.2685378, -0.7511752, 2.375588, 0, 0.3529412, 1, 1,
0.2708846, -0.7133037, 2.134185, 0, 0.345098, 1, 1,
0.2718529, 0.3014162, 0.3813506, 0, 0.3411765, 1, 1,
0.2745138, -0.9785752, 2.216707, 0, 0.3333333, 1, 1,
0.2760999, -1.046579, 1.911449, 0, 0.3294118, 1, 1,
0.2783592, 0.09473298, 1.969066, 0, 0.3215686, 1, 1,
0.2792861, -1.153181, 1.680732, 0, 0.3176471, 1, 1,
0.2889764, -1.056242, 2.138263, 0, 0.3098039, 1, 1,
0.2932272, 1.170182, -1.982528, 0, 0.3058824, 1, 1,
0.2951333, -1.222083, 3.329934, 0, 0.2980392, 1, 1,
0.2952773, -0.3702202, 3.627806, 0, 0.2901961, 1, 1,
0.2989854, -0.514101, 2.650997, 0, 0.2862745, 1, 1,
0.2995888, 2.315336, 1.043016, 0, 0.2784314, 1, 1,
0.3083885, 0.4727722, 0.2864908, 0, 0.2745098, 1, 1,
0.3103977, 0.3493241, 2.722049, 0, 0.2666667, 1, 1,
0.311665, 0.09714226, 0.3799132, 0, 0.2627451, 1, 1,
0.3188376, 0.5321174, 1.014817, 0, 0.254902, 1, 1,
0.3267811, 1.286042, -0.5769902, 0, 0.2509804, 1, 1,
0.3269936, 1.223414, -0.1615685, 0, 0.2431373, 1, 1,
0.3273296, 0.32671, -0.4252829, 0, 0.2392157, 1, 1,
0.3359821, -0.4207959, 3.710249, 0, 0.2313726, 1, 1,
0.3406885, 1.114778, 0.8662771, 0, 0.227451, 1, 1,
0.3423361, -1.656021, 1.923109, 0, 0.2196078, 1, 1,
0.3584437, 0.06677169, 2.287586, 0, 0.2156863, 1, 1,
0.3585716, 0.3050794, -0.5640692, 0, 0.2078431, 1, 1,
0.3600549, 0.2621851, 1.21407, 0, 0.2039216, 1, 1,
0.3608761, -1.036549, 1.534821, 0, 0.1960784, 1, 1,
0.3639133, -1.179609, 3.396431, 0, 0.1882353, 1, 1,
0.3664442, 2.481848, -1.383951, 0, 0.1843137, 1, 1,
0.3677847, -0.1159158, 2.680948, 0, 0.1764706, 1, 1,
0.372615, -1.903513, 5.090672, 0, 0.172549, 1, 1,
0.377154, -2.110451, 2.194745, 0, 0.1647059, 1, 1,
0.3791813, -0.4729743, 1.289288, 0, 0.1607843, 1, 1,
0.3817054, 0.2753235, 1.330685, 0, 0.1529412, 1, 1,
0.3863781, -0.4198541, 3.630055, 0, 0.1490196, 1, 1,
0.3901847, 1.211342, 0.547567, 0, 0.1411765, 1, 1,
0.3908433, -0.7322999, 3.033898, 0, 0.1372549, 1, 1,
0.3975822, 1.718289, -0.06853424, 0, 0.1294118, 1, 1,
0.4018702, -0.01426193, 0.2425544, 0, 0.1254902, 1, 1,
0.4028049, -1.54352, 3.297305, 0, 0.1176471, 1, 1,
0.4069462, 0.9822659, 0.1417505, 0, 0.1137255, 1, 1,
0.4072139, -0.3898621, 2.37663, 0, 0.1058824, 1, 1,
0.413957, -0.6869379, 1.843049, 0, 0.09803922, 1, 1,
0.4158616, 0.449928, 0.7227105, 0, 0.09411765, 1, 1,
0.4173111, -0.206334, 0.7042147, 0, 0.08627451, 1, 1,
0.4192233, -0.3803193, 1.754373, 0, 0.08235294, 1, 1,
0.4242703, -0.1939475, 2.596372, 0, 0.07450981, 1, 1,
0.4263776, 1.327718, 1.131875, 0, 0.07058824, 1, 1,
0.4270762, -0.117853, 3.584416, 0, 0.0627451, 1, 1,
0.4274822, 0.8894687, 1.412641, 0, 0.05882353, 1, 1,
0.4288776, 0.2579713, 0.4761131, 0, 0.05098039, 1, 1,
0.4290894, -0.3701779, 3.297477, 0, 0.04705882, 1, 1,
0.4295304, -0.3354034, 2.883516, 0, 0.03921569, 1, 1,
0.4305502, -0.8442444, 1.740988, 0, 0.03529412, 1, 1,
0.437995, 1.822458, 0.6996393, 0, 0.02745098, 1, 1,
0.4390904, 0.699986, -0.3067891, 0, 0.02352941, 1, 1,
0.440119, -1.430405, 2.752381, 0, 0.01568628, 1, 1,
0.4420651, 1.230276, 1.186677, 0, 0.01176471, 1, 1,
0.444308, -1.131962, 3.069414, 0, 0.003921569, 1, 1,
0.4491146, -0.1343774, 1.803954, 0.003921569, 0, 1, 1,
0.4501145, -1.22505, 3.493563, 0.007843138, 0, 1, 1,
0.4556659, 1.1477, 1.886364, 0.01568628, 0, 1, 1,
0.4559262, -0.07066035, 1.659813, 0.01960784, 0, 1, 1,
0.4597658, 0.9186094, -0.3371125, 0.02745098, 0, 1, 1,
0.4631786, 1.241241, 0.6478709, 0.03137255, 0, 1, 1,
0.4666767, -0.1871451, 4.303932, 0.03921569, 0, 1, 1,
0.4707261, -0.006856015, 0.5085071, 0.04313726, 0, 1, 1,
0.4728292, -1.648931, 2.563341, 0.05098039, 0, 1, 1,
0.4787097, -0.6626225, 1.77213, 0.05490196, 0, 1, 1,
0.4788096, -0.3074586, 1.551007, 0.0627451, 0, 1, 1,
0.4803253, 2.078215, 0.0788956, 0.06666667, 0, 1, 1,
0.4808763, 0.5658341, 0.9853586, 0.07450981, 0, 1, 1,
0.481063, -0.8044176, 4.858425, 0.07843138, 0, 1, 1,
0.4836193, -1.710087, 2.736245, 0.08627451, 0, 1, 1,
0.4847362, -1.887573, 2.949774, 0.09019608, 0, 1, 1,
0.4858347, -2.011729, 2.548547, 0.09803922, 0, 1, 1,
0.4861624, 1.044816, 1.092555, 0.1058824, 0, 1, 1,
0.4871859, -1.701237, 1.170806, 0.1098039, 0, 1, 1,
0.4875906, -0.1594871, 3.675076, 0.1176471, 0, 1, 1,
0.4906599, 0.6424655, 0.1705629, 0.1215686, 0, 1, 1,
0.4977033, 0.01509708, 2.243433, 0.1294118, 0, 1, 1,
0.49965, 0.4912864, -0.4860843, 0.1333333, 0, 1, 1,
0.5025949, 2.707173, -0.06954341, 0.1411765, 0, 1, 1,
0.5031651, 0.1390112, -0.001512614, 0.145098, 0, 1, 1,
0.5039604, 2.420895, 1.07962, 0.1529412, 0, 1, 1,
0.5053113, 0.337627, -0.1833385, 0.1568628, 0, 1, 1,
0.5074485, -0.7643873, 1.795765, 0.1647059, 0, 1, 1,
0.5092871, 0.8375604, -0.5396608, 0.1686275, 0, 1, 1,
0.5093595, 0.8124856, 1.11768, 0.1764706, 0, 1, 1,
0.5142703, 1.84103, -0.04836508, 0.1803922, 0, 1, 1,
0.5145755, 0.6016351, 0.6419771, 0.1882353, 0, 1, 1,
0.5223417, 1.605736, -0.5682548, 0.1921569, 0, 1, 1,
0.5242458, -1.12295, 3.657106, 0.2, 0, 1, 1,
0.5265502, -1.096733, 2.07578, 0.2078431, 0, 1, 1,
0.528026, -0.1660032, 1.469355, 0.2117647, 0, 1, 1,
0.5301952, -0.5112043, 1.905402, 0.2196078, 0, 1, 1,
0.5304436, -0.263297, 0.762093, 0.2235294, 0, 1, 1,
0.5329581, 1.610643, 0.805344, 0.2313726, 0, 1, 1,
0.5370668, 0.01568792, 3.112413, 0.2352941, 0, 1, 1,
0.5403839, -0.2415237, 3.573778, 0.2431373, 0, 1, 1,
0.5426548, 0.01230125, 0.5907454, 0.2470588, 0, 1, 1,
0.5427773, 1.087879, 0.198594, 0.254902, 0, 1, 1,
0.5481117, 0.5746812, 1.405882, 0.2588235, 0, 1, 1,
0.5524155, -0.4226512, 3.065153, 0.2666667, 0, 1, 1,
0.5561122, 1.419151, -0.2775362, 0.2705882, 0, 1, 1,
0.5569673, -2.145572, 3.042877, 0.2784314, 0, 1, 1,
0.557334, -0.6614026, 2.965373, 0.282353, 0, 1, 1,
0.5698525, 0.1434858, 0.2015902, 0.2901961, 0, 1, 1,
0.5707377, 0.6895704, 2.139531, 0.2941177, 0, 1, 1,
0.572345, 1.146397, -1.157679, 0.3019608, 0, 1, 1,
0.574398, 0.6836928, 1.087685, 0.3098039, 0, 1, 1,
0.5768904, -0.3124114, 0.8684633, 0.3137255, 0, 1, 1,
0.5780402, -0.8867279, 2.979211, 0.3215686, 0, 1, 1,
0.5782712, -1.015493, 2.911973, 0.3254902, 0, 1, 1,
0.5819537, -0.8310859, 0.9731034, 0.3333333, 0, 1, 1,
0.5895186, 1.237412, 3.109201, 0.3372549, 0, 1, 1,
0.5922833, 0.1179735, 0.7942339, 0.345098, 0, 1, 1,
0.5925494, -0.5152867, 1.319507, 0.3490196, 0, 1, 1,
0.595115, -0.6355261, 1.859062, 0.3568628, 0, 1, 1,
0.6132399, -0.1023877, 1.493055, 0.3607843, 0, 1, 1,
0.6224869, 0.4543817, 2.052247, 0.3686275, 0, 1, 1,
0.6233059, -0.06732309, 3.755398, 0.372549, 0, 1, 1,
0.6273586, 0.6273294, 2.739235, 0.3803922, 0, 1, 1,
0.6307606, -1.154006, 3.396712, 0.3843137, 0, 1, 1,
0.6310999, 1.408135, 1.647337, 0.3921569, 0, 1, 1,
0.6356881, -0.7496985, 1.588954, 0.3960784, 0, 1, 1,
0.6475285, -2.422804, 2.239167, 0.4039216, 0, 1, 1,
0.6477458, -0.5569476, 2.858111, 0.4117647, 0, 1, 1,
0.649001, 0.4351652, 0.3173995, 0.4156863, 0, 1, 1,
0.6497741, -0.9781654, 1.189027, 0.4235294, 0, 1, 1,
0.6516446, -0.4646652, 2.607151, 0.427451, 0, 1, 1,
0.6548221, -1.019641, 2.880315, 0.4352941, 0, 1, 1,
0.6605261, -0.05015369, 1.402783, 0.4392157, 0, 1, 1,
0.6631142, 1.307295, 0.004617862, 0.4470588, 0, 1, 1,
0.6678163, 0.127364, 0.86691, 0.4509804, 0, 1, 1,
0.6687802, -0.8720315, 2.588068, 0.4588235, 0, 1, 1,
0.6713362, 0.08954884, 2.02434, 0.4627451, 0, 1, 1,
0.6740149, -0.1521527, -0.1942994, 0.4705882, 0, 1, 1,
0.6822367, 0.5960975, -0.2673554, 0.4745098, 0, 1, 1,
0.6845629, 0.3720238, 1.787952, 0.4823529, 0, 1, 1,
0.6846291, -1.623686, 2.785973, 0.4862745, 0, 1, 1,
0.6856505, 0.9511375, 1.753947, 0.4941176, 0, 1, 1,
0.6874459, -0.2668592, 1.525841, 0.5019608, 0, 1, 1,
0.6884829, -0.5031026, 2.769149, 0.5058824, 0, 1, 1,
0.7017962, 1.928092, 0.6524978, 0.5137255, 0, 1, 1,
0.7024615, -0.2378981, 1.82629, 0.5176471, 0, 1, 1,
0.7087322, 0.922244, 1.766756, 0.5254902, 0, 1, 1,
0.7160339, -1.098649, 3.524854, 0.5294118, 0, 1, 1,
0.719775, 0.6759753, 0.8556983, 0.5372549, 0, 1, 1,
0.7242637, -0.2489535, 1.189857, 0.5411765, 0, 1, 1,
0.7258963, -0.2184066, 1.134974, 0.5490196, 0, 1, 1,
0.7261723, -0.06620134, 1.7907, 0.5529412, 0, 1, 1,
0.7272125, -0.03555683, 2.895519, 0.5607843, 0, 1, 1,
0.7272223, -0.2052237, 1.643202, 0.5647059, 0, 1, 1,
0.7372886, -0.09196885, 1.543265, 0.572549, 0, 1, 1,
0.7382012, -0.1294074, 2.429119, 0.5764706, 0, 1, 1,
0.744677, -0.6989049, 2.651688, 0.5843138, 0, 1, 1,
0.7454339, 0.4551426, 2.085629, 0.5882353, 0, 1, 1,
0.7540636, -1.064509, 3.243032, 0.5960785, 0, 1, 1,
0.7591837, 0.4135135, 0.9663526, 0.6039216, 0, 1, 1,
0.7600027, -0.105044, 1.51582, 0.6078432, 0, 1, 1,
0.7608186, 1.782239, 1.148135, 0.6156863, 0, 1, 1,
0.7644925, -0.3167821, 1.363192, 0.6196079, 0, 1, 1,
0.7671586, 0.294502, -0.08551618, 0.627451, 0, 1, 1,
0.7705579, 0.5939039, 0.7165167, 0.6313726, 0, 1, 1,
0.7784637, 0.3047427, 0.4277746, 0.6392157, 0, 1, 1,
0.7794574, -0.301083, -0.1802204, 0.6431373, 0, 1, 1,
0.7831669, 1.452636, 0.4179736, 0.6509804, 0, 1, 1,
0.7892483, -0.3867343, 2.253052, 0.654902, 0, 1, 1,
0.7910154, 0.1966282, 0.5791257, 0.6627451, 0, 1, 1,
0.798172, -0.4858854, 2.542934, 0.6666667, 0, 1, 1,
0.8004333, 0.1981921, 2.866888, 0.6745098, 0, 1, 1,
0.8004427, 0.3510523, 1.279172, 0.6784314, 0, 1, 1,
0.8143432, -0.9249862, 2.178342, 0.6862745, 0, 1, 1,
0.8171866, -0.2001645, 1.033151, 0.6901961, 0, 1, 1,
0.8207417, -0.9481659, 2.739281, 0.6980392, 0, 1, 1,
0.8214344, 1.124379, -0.3315957, 0.7058824, 0, 1, 1,
0.8227595, 0.7772382, -0.9933779, 0.7098039, 0, 1, 1,
0.8241599, -1.090893, 0.7858425, 0.7176471, 0, 1, 1,
0.8261642, -0.6191702, 2.58876, 0.7215686, 0, 1, 1,
0.8297789, -2.700089, 4.072582, 0.7294118, 0, 1, 1,
0.8320185, -0.4115612, 2.100834, 0.7333333, 0, 1, 1,
0.8321922, 1.889811, 1.752043, 0.7411765, 0, 1, 1,
0.8407434, 2.295956, 0.7587196, 0.7450981, 0, 1, 1,
0.8418272, 0.6165157, 0.4645489, 0.7529412, 0, 1, 1,
0.8429587, -0.7783047, 2.237289, 0.7568628, 0, 1, 1,
0.843594, -0.5956784, 2.017778, 0.7647059, 0, 1, 1,
0.843609, -1.882509, 3.418638, 0.7686275, 0, 1, 1,
0.8512588, 0.3936233, 1.900811, 0.7764706, 0, 1, 1,
0.8555948, -1.617521, 1.511301, 0.7803922, 0, 1, 1,
0.8600183, -0.7346649, 3.47168, 0.7882353, 0, 1, 1,
0.8692252, 0.1474465, 4.311818, 0.7921569, 0, 1, 1,
0.8692377, -0.2840557, 2.688128, 0.8, 0, 1, 1,
0.8724599, 0.4084025, 0.8960354, 0.8078431, 0, 1, 1,
0.8789586, 2.073495, 0.643391, 0.8117647, 0, 1, 1,
0.8804028, 1.569561, 1.543666, 0.8196079, 0, 1, 1,
0.8810543, -0.1672928, 3.02347, 0.8235294, 0, 1, 1,
0.882131, 0.09732573, 1.889254, 0.8313726, 0, 1, 1,
0.8837782, 0.7132896, 0.2868138, 0.8352941, 0, 1, 1,
0.8931811, 0.122706, 2.739552, 0.8431373, 0, 1, 1,
0.8954706, 0.5837344, 2.758169, 0.8470588, 0, 1, 1,
0.9013062, -1.536494, 1.293045, 0.854902, 0, 1, 1,
0.9120269, -0.6844282, 1.996905, 0.8588235, 0, 1, 1,
0.9126302, -0.4110121, 1.180367, 0.8666667, 0, 1, 1,
0.9132028, 1.144578, -0.1806582, 0.8705882, 0, 1, 1,
0.9136729, -0.3187206, 4.48304, 0.8784314, 0, 1, 1,
0.9171103, -1.38176, 3.132615, 0.8823529, 0, 1, 1,
0.9224613, -0.2161848, 0.4992732, 0.8901961, 0, 1, 1,
0.9246634, -0.4977811, 2.428204, 0.8941177, 0, 1, 1,
0.9288353, 0.7274929, -0.4392387, 0.9019608, 0, 1, 1,
0.9292521, -0.2342286, 1.606083, 0.9098039, 0, 1, 1,
0.9295741, 0.4929068, 3.483602, 0.9137255, 0, 1, 1,
0.9315816, 0.5226637, -0.6314875, 0.9215686, 0, 1, 1,
0.9378585, -0.481819, 2.234865, 0.9254902, 0, 1, 1,
0.9444483, -0.08570968, 1.570326, 0.9333333, 0, 1, 1,
0.9616767, 1.699055, 0.6099614, 0.9372549, 0, 1, 1,
0.9662833, -1.855294, 2.427967, 0.945098, 0, 1, 1,
0.9701913, -0.5336486, 1.342272, 0.9490196, 0, 1, 1,
0.9778318, 0.5702602, 0.3328362, 0.9568627, 0, 1, 1,
0.9807262, 2.027573, 0.1623603, 0.9607843, 0, 1, 1,
0.9827589, -0.6021048, 2.591607, 0.9686275, 0, 1, 1,
0.9858632, -1.863783, 3.847024, 0.972549, 0, 1, 1,
0.9950811, 1.642733, 0.5014726, 0.9803922, 0, 1, 1,
0.9993569, 1.415254, 0.2348246, 0.9843137, 0, 1, 1,
1.002618, 0.6771555, 0.623848, 0.9921569, 0, 1, 1,
1.005275, -0.5187853, 1.504129, 0.9960784, 0, 1, 1,
1.007086, 2.098423, -2.062912, 1, 0, 0.9960784, 1,
1.013954, 0.2690588, 0.2021453, 1, 0, 0.9882353, 1,
1.016606, 1.456353, 2.061133, 1, 0, 0.9843137, 1,
1.017628, 1.550499, 0.4815027, 1, 0, 0.9764706, 1,
1.027545, 0.8493576, -0.0749833, 1, 0, 0.972549, 1,
1.029944, 0.3179331, 0.4405423, 1, 0, 0.9647059, 1,
1.04067, 0.09655347, 2.10314, 1, 0, 0.9607843, 1,
1.041285, 0.1559195, 1.105223, 1, 0, 0.9529412, 1,
1.041394, 0.506981, 1.159957, 1, 0, 0.9490196, 1,
1.042248, 1.796777, 0.6911538, 1, 0, 0.9411765, 1,
1.043689, -0.3132703, 2.056583, 1, 0, 0.9372549, 1,
1.044442, -2.569408, 1.880957, 1, 0, 0.9294118, 1,
1.046684, -0.7657276, 1.975174, 1, 0, 0.9254902, 1,
1.048728, -1.741517, 3.396741, 1, 0, 0.9176471, 1,
1.064321, 2.470035, 0.6037101, 1, 0, 0.9137255, 1,
1.070381, -0.9776136, 1.678174, 1, 0, 0.9058824, 1,
1.071775, -0.1401907, 1.724209, 1, 0, 0.9019608, 1,
1.073353, -1.147785, 2.282436, 1, 0, 0.8941177, 1,
1.076236, -0.00992541, 1.763652, 1, 0, 0.8862745, 1,
1.078028, -0.0708034, 2.941141, 1, 0, 0.8823529, 1,
1.078032, 0.252964, 1.611184, 1, 0, 0.8745098, 1,
1.079227, 0.3398906, 1.287951, 1, 0, 0.8705882, 1,
1.07956, 0.7978924, 1.820165, 1, 0, 0.8627451, 1,
1.080459, 0.02626244, 1.316849, 1, 0, 0.8588235, 1,
1.090219, 1.355648, 2.013517, 1, 0, 0.8509804, 1,
1.09168, 0.4335929, 0.9820136, 1, 0, 0.8470588, 1,
1.092223, -0.5786157, 0.1575467, 1, 0, 0.8392157, 1,
1.099838, -0.1149138, 0.7901258, 1, 0, 0.8352941, 1,
1.111078, 1.06784, 2.038155, 1, 0, 0.827451, 1,
1.117445, 1.193818, -0.7610241, 1, 0, 0.8235294, 1,
1.119988, 0.06591933, 3.084314, 1, 0, 0.8156863, 1,
1.122315, 1.352494, 0.9171262, 1, 0, 0.8117647, 1,
1.134798, 0.1597705, 0.9114293, 1, 0, 0.8039216, 1,
1.139495, -1.525595, 1.92977, 1, 0, 0.7960784, 1,
1.140335, 1.165855, 3.913152, 1, 0, 0.7921569, 1,
1.143928, -1.326057, 2.913301, 1, 0, 0.7843137, 1,
1.145344, 0.6800165, 1.773365, 1, 0, 0.7803922, 1,
1.147405, -0.1482153, 0.493163, 1, 0, 0.772549, 1,
1.15617, 0.6876524, 2.445265, 1, 0, 0.7686275, 1,
1.162293, 1.737532, -0.4670255, 1, 0, 0.7607843, 1,
1.173531, -0.2977908, 0.4913146, 1, 0, 0.7568628, 1,
1.173905, 0.5653916, 3.038168, 1, 0, 0.7490196, 1,
1.177431, 0.2940536, 1.76207, 1, 0, 0.7450981, 1,
1.178696, -1.352041, 4.662639, 1, 0, 0.7372549, 1,
1.181366, 1.101359, 1.12558, 1, 0, 0.7333333, 1,
1.195077, 2.081581, -1.015395, 1, 0, 0.7254902, 1,
1.200954, 0.8285534, 0.3559112, 1, 0, 0.7215686, 1,
1.203248, 1.477166, 1.371168, 1, 0, 0.7137255, 1,
1.207683, 0.8539599, 1.033149, 1, 0, 0.7098039, 1,
1.209067, -1.413461, 1.977623, 1, 0, 0.7019608, 1,
1.220707, -2.061309, 2.999463, 1, 0, 0.6941177, 1,
1.224408, 0.7646836, 1.597728, 1, 0, 0.6901961, 1,
1.226402, 2.043406, -0.7051237, 1, 0, 0.682353, 1,
1.242387, 0.2779101, 1.157767, 1, 0, 0.6784314, 1,
1.247157, -0.4429355, -0.4402365, 1, 0, 0.6705883, 1,
1.251595, -0.9252942, 2.686036, 1, 0, 0.6666667, 1,
1.255562, -1.570269, 2.231812, 1, 0, 0.6588235, 1,
1.259155, 3.687677, 1.368239, 1, 0, 0.654902, 1,
1.260057, 0.007341319, 2.190542, 1, 0, 0.6470588, 1,
1.263212, -1.853524, 2.632861, 1, 0, 0.6431373, 1,
1.266558, -0.3931837, 3.005732, 1, 0, 0.6352941, 1,
1.269564, -0.3046986, 3.384336, 1, 0, 0.6313726, 1,
1.272714, 0.1185253, 1.594943, 1, 0, 0.6235294, 1,
1.283543, 1.394968, -0.1197068, 1, 0, 0.6196079, 1,
1.291123, 0.3838034, 3.255462, 1, 0, 0.6117647, 1,
1.291221, 0.7498519, 0.09327043, 1, 0, 0.6078432, 1,
1.293627, 0.1007212, 0.9602072, 1, 0, 0.6, 1,
1.300802, 0.06737304, 3.160762, 1, 0, 0.5921569, 1,
1.303409, -1.544996, 0.7992314, 1, 0, 0.5882353, 1,
1.307331, 0.4243681, 0.01691376, 1, 0, 0.5803922, 1,
1.310232, -0.1889737, 1.692434, 1, 0, 0.5764706, 1,
1.330164, -0.3222871, 1.694811, 1, 0, 0.5686275, 1,
1.340249, 1.320429, 2.312926, 1, 0, 0.5647059, 1,
1.342612, -0.4794572, 1.813223, 1, 0, 0.5568628, 1,
1.344065, -0.7204894, 1.40864, 1, 0, 0.5529412, 1,
1.351408, 0.6629652, 1.513537, 1, 0, 0.5450981, 1,
1.354764, -2.028575, 1.879608, 1, 0, 0.5411765, 1,
1.366305, -1.57434, 1.438893, 1, 0, 0.5333334, 1,
1.367507, -0.1642646, 2.606369, 1, 0, 0.5294118, 1,
1.369365, -0.7015531, 1.718486, 1, 0, 0.5215687, 1,
1.370465, 0.9442352, 0.8409992, 1, 0, 0.5176471, 1,
1.373642, -0.08784392, 1.848331, 1, 0, 0.509804, 1,
1.374409, -1.328695, 1.085542, 1, 0, 0.5058824, 1,
1.375894, 0.2528984, 2.939643, 1, 0, 0.4980392, 1,
1.389607, -1.044831, 2.089292, 1, 0, 0.4901961, 1,
1.401853, 1.007936, 0.4005944, 1, 0, 0.4862745, 1,
1.414226, 0.5062849, 1.678199, 1, 0, 0.4784314, 1,
1.418632, 0.5120996, 1.346114, 1, 0, 0.4745098, 1,
1.421703, 0.7729864, 1.690473, 1, 0, 0.4666667, 1,
1.432604, -2.252614, 3.217657, 1, 0, 0.4627451, 1,
1.434307, 1.013523, 1.285054, 1, 0, 0.454902, 1,
1.44474, 1.670558, 0.7323598, 1, 0, 0.4509804, 1,
1.444921, -0.3924175, 0.3804636, 1, 0, 0.4431373, 1,
1.448515, -0.9436567, 2.302557, 1, 0, 0.4392157, 1,
1.449911, -0.106991, 1.249619, 1, 0, 0.4313726, 1,
1.467308, 0.03690348, 1.55663, 1, 0, 0.427451, 1,
1.476414, -1.810462, 2.23659, 1, 0, 0.4196078, 1,
1.47873, -0.2567998, 3.467818, 1, 0, 0.4156863, 1,
1.479101, -0.7934936, 3.557835, 1, 0, 0.4078431, 1,
1.484621, 0.838169, 0.322522, 1, 0, 0.4039216, 1,
1.492381, -2.182535, 3.049284, 1, 0, 0.3960784, 1,
1.49384, 1.581747, 1.318344, 1, 0, 0.3882353, 1,
1.507457, -1.144479, 1.831541, 1, 0, 0.3843137, 1,
1.507877, -1.455831, 2.011955, 1, 0, 0.3764706, 1,
1.526611, 1.532558, -0.4137976, 1, 0, 0.372549, 1,
1.533222, 0.1968451, 1.459072, 1, 0, 0.3647059, 1,
1.546179, -1.536109, 1.004235, 1, 0, 0.3607843, 1,
1.546387, 1.977191, -0.192376, 1, 0, 0.3529412, 1,
1.548169, 2.37696, 0.5905373, 1, 0, 0.3490196, 1,
1.570827, 0.4048122, 1.939707, 1, 0, 0.3411765, 1,
1.571362, 0.5836659, -0.3274681, 1, 0, 0.3372549, 1,
1.574779, 0.1965496, 0.9863867, 1, 0, 0.3294118, 1,
1.581321, -1.291354, 2.277168, 1, 0, 0.3254902, 1,
1.588833, -1.691476, 2.483033, 1, 0, 0.3176471, 1,
1.609167, 2.089106, 0.1068955, 1, 0, 0.3137255, 1,
1.65891, -0.9317659, 1.984773, 1, 0, 0.3058824, 1,
1.661967, -0.9320033, 2.044545, 1, 0, 0.2980392, 1,
1.666057, 0.5578762, 1.687068, 1, 0, 0.2941177, 1,
1.66632, 0.233866, 2.163342, 1, 0, 0.2862745, 1,
1.700608, 0.5967563, 1.469443, 1, 0, 0.282353, 1,
1.702653, -1.477896, 1.218899, 1, 0, 0.2745098, 1,
1.709565, 1.610922, 2.347305, 1, 0, 0.2705882, 1,
1.71315, -0.06093727, 1.210914, 1, 0, 0.2627451, 1,
1.715535, -0.04137408, 2.621058, 1, 0, 0.2588235, 1,
1.734974, -1.690665, 2.580608, 1, 0, 0.2509804, 1,
1.736988, 0.5656268, 1.960101, 1, 0, 0.2470588, 1,
1.751936, -0.7866833, 0.6280616, 1, 0, 0.2392157, 1,
1.761905, -0.162762, 0.8843069, 1, 0, 0.2352941, 1,
1.773389, 0.3043465, 1.045089, 1, 0, 0.227451, 1,
1.777206, -0.3038014, 1.075485, 1, 0, 0.2235294, 1,
1.786159, -0.7061197, 1.825391, 1, 0, 0.2156863, 1,
1.803044, 0.1387464, 3.177297, 1, 0, 0.2117647, 1,
1.809712, -0.8971677, 1.783754, 1, 0, 0.2039216, 1,
1.809983, 0.1038107, 0.9211107, 1, 0, 0.1960784, 1,
1.810997, -0.5436848, 2.386024, 1, 0, 0.1921569, 1,
1.814205, 0.05708994, 0.9863729, 1, 0, 0.1843137, 1,
1.814321, -0.2874385, 2.433835, 1, 0, 0.1803922, 1,
1.814585, -0.01742149, 2.902593, 1, 0, 0.172549, 1,
1.816992, -0.5235499, 3.208482, 1, 0, 0.1686275, 1,
1.819326, -0.6517128, 1.901299, 1, 0, 0.1607843, 1,
1.839296, -0.1335835, 1.436181, 1, 0, 0.1568628, 1,
1.881554, 0.5563811, 0.7705242, 1, 0, 0.1490196, 1,
1.884495, -2.94732, 2.059695, 1, 0, 0.145098, 1,
1.907876, 1.668015, 1.130674, 1, 0, 0.1372549, 1,
1.942228, -1.059619, 1.420027, 1, 0, 0.1333333, 1,
1.966659, 1.054492, 0.6744447, 1, 0, 0.1254902, 1,
2.000127, -0.3772409, -0.1206677, 1, 0, 0.1215686, 1,
2.051875, -0.1287035, 1.742631, 1, 0, 0.1137255, 1,
2.105911, -0.7613477, 1.538264, 1, 0, 0.1098039, 1,
2.12994, -1.346494, 1.951437, 1, 0, 0.1019608, 1,
2.138813, 1.171284, 2.110937, 1, 0, 0.09411765, 1,
2.151191, -0.1204882, -0.3120027, 1, 0, 0.09019608, 1,
2.16713, -2.025331, 2.933675, 1, 0, 0.08235294, 1,
2.203069, -0.6920499, 3.502967, 1, 0, 0.07843138, 1,
2.21046, 0.1635468, 1.184817, 1, 0, 0.07058824, 1,
2.252751, -0.1029968, 0.6972886, 1, 0, 0.06666667, 1,
2.289983, -0.2862785, 1.833404, 1, 0, 0.05882353, 1,
2.324666, -0.1315132, 2.161673, 1, 0, 0.05490196, 1,
2.377727, -1.180586, 3.529169, 1, 0, 0.04705882, 1,
2.390404, 2.157285, 1.466404, 1, 0, 0.04313726, 1,
2.680202, -0.3987212, 3.057397, 1, 0, 0.03529412, 1,
2.765511, -0.06415921, 2.516912, 1, 0, 0.03137255, 1,
2.82582, 1.592225, -0.4307868, 1, 0, 0.02352941, 1,
3.013573, -0.5126207, 2.105328, 1, 0, 0.01960784, 1,
3.302301, -0.57478, 0.861683, 1, 0, 0.01176471, 1,
3.528209, -0.722969, 0.8269505, 1, 0, 0.007843138, 1
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
0.2472848, -4.071952, -7.844039, 0, -0.5, 0.5, 0.5,
0.2472848, -4.071952, -7.844039, 1, -0.5, 0.5, 0.5,
0.2472848, -4.071952, -7.844039, 1, 1.5, 0.5, 0.5,
0.2472848, -4.071952, -7.844039, 0, 1.5, 0.5, 0.5
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
-4.145873, 0.3701786, -7.844039, 0, -0.5, 0.5, 0.5,
-4.145873, 0.3701786, -7.844039, 1, -0.5, 0.5, 0.5,
-4.145873, 0.3701786, -7.844039, 1, 1.5, 0.5, 0.5,
-4.145873, 0.3701786, -7.844039, 0, 1.5, 0.5, 0.5
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
-4.145873, -4.071952, -0.4393454, 0, -0.5, 0.5, 0.5,
-4.145873, -4.071952, -0.4393454, 1, -0.5, 0.5, 0.5,
-4.145873, -4.071952, -0.4393454, 1, 1.5, 0.5, 0.5,
-4.145873, -4.071952, -0.4393454, 0, 1.5, 0.5, 0.5
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
-3, -3.046845, -6.135264,
3, -3.046845, -6.135264,
-3, -3.046845, -6.135264,
-3, -3.217696, -6.42006,
-2, -3.046845, -6.135264,
-2, -3.217696, -6.42006,
-1, -3.046845, -6.135264,
-1, -3.217696, -6.42006,
0, -3.046845, -6.135264,
0, -3.217696, -6.42006,
1, -3.046845, -6.135264,
1, -3.217696, -6.42006,
2, -3.046845, -6.135264,
2, -3.217696, -6.42006,
3, -3.046845, -6.135264,
3, -3.217696, -6.42006
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
-3, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
-3, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
-3, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
-3, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5,
-2, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
-2, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
-2, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
-2, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5,
-1, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
-1, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
-1, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
-1, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5,
0, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
0, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
0, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
0, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5,
1, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
1, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
1, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
1, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5,
2, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
2, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
2, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
2, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5,
3, -3.559399, -6.989652, 0, -0.5, 0.5, 0.5,
3, -3.559399, -6.989652, 1, -0.5, 0.5, 0.5,
3, -3.559399, -6.989652, 1, 1.5, 0.5, 0.5,
3, -3.559399, -6.989652, 0, 1.5, 0.5, 0.5
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
-3.132067, -2, -6.135264,
-3.132067, 3, -6.135264,
-3.132067, -2, -6.135264,
-3.301034, -2, -6.42006,
-3.132067, -1, -6.135264,
-3.301034, -1, -6.42006,
-3.132067, 0, -6.135264,
-3.301034, 0, -6.42006,
-3.132067, 1, -6.135264,
-3.301034, 1, -6.42006,
-3.132067, 2, -6.135264,
-3.301034, 2, -6.42006,
-3.132067, 3, -6.135264,
-3.301034, 3, -6.42006
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
-3.63897, -2, -6.989652, 0, -0.5, 0.5, 0.5,
-3.63897, -2, -6.989652, 1, -0.5, 0.5, 0.5,
-3.63897, -2, -6.989652, 1, 1.5, 0.5, 0.5,
-3.63897, -2, -6.989652, 0, 1.5, 0.5, 0.5,
-3.63897, -1, -6.989652, 0, -0.5, 0.5, 0.5,
-3.63897, -1, -6.989652, 1, -0.5, 0.5, 0.5,
-3.63897, -1, -6.989652, 1, 1.5, 0.5, 0.5,
-3.63897, -1, -6.989652, 0, 1.5, 0.5, 0.5,
-3.63897, 0, -6.989652, 0, -0.5, 0.5, 0.5,
-3.63897, 0, -6.989652, 1, -0.5, 0.5, 0.5,
-3.63897, 0, -6.989652, 1, 1.5, 0.5, 0.5,
-3.63897, 0, -6.989652, 0, 1.5, 0.5, 0.5,
-3.63897, 1, -6.989652, 0, -0.5, 0.5, 0.5,
-3.63897, 1, -6.989652, 1, -0.5, 0.5, 0.5,
-3.63897, 1, -6.989652, 1, 1.5, 0.5, 0.5,
-3.63897, 1, -6.989652, 0, 1.5, 0.5, 0.5,
-3.63897, 2, -6.989652, 0, -0.5, 0.5, 0.5,
-3.63897, 2, -6.989652, 1, -0.5, 0.5, 0.5,
-3.63897, 2, -6.989652, 1, 1.5, 0.5, 0.5,
-3.63897, 2, -6.989652, 0, 1.5, 0.5, 0.5,
-3.63897, 3, -6.989652, 0, -0.5, 0.5, 0.5,
-3.63897, 3, -6.989652, 1, -0.5, 0.5, 0.5,
-3.63897, 3, -6.989652, 1, 1.5, 0.5, 0.5,
-3.63897, 3, -6.989652, 0, 1.5, 0.5, 0.5
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
-3.132067, -3.046845, -4,
-3.132067, -3.046845, 4,
-3.132067, -3.046845, -4,
-3.301034, -3.217696, -4,
-3.132067, -3.046845, -2,
-3.301034, -3.217696, -2,
-3.132067, -3.046845, 0,
-3.301034, -3.217696, 0,
-3.132067, -3.046845, 2,
-3.301034, -3.217696, 2,
-3.132067, -3.046845, 4,
-3.301034, -3.217696, 4
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
-3.63897, -3.559399, -4, 0, -0.5, 0.5, 0.5,
-3.63897, -3.559399, -4, 1, -0.5, 0.5, 0.5,
-3.63897, -3.559399, -4, 1, 1.5, 0.5, 0.5,
-3.63897, -3.559399, -4, 0, 1.5, 0.5, 0.5,
-3.63897, -3.559399, -2, 0, -0.5, 0.5, 0.5,
-3.63897, -3.559399, -2, 1, -0.5, 0.5, 0.5,
-3.63897, -3.559399, -2, 1, 1.5, 0.5, 0.5,
-3.63897, -3.559399, -2, 0, 1.5, 0.5, 0.5,
-3.63897, -3.559399, 0, 0, -0.5, 0.5, 0.5,
-3.63897, -3.559399, 0, 1, -0.5, 0.5, 0.5,
-3.63897, -3.559399, 0, 1, 1.5, 0.5, 0.5,
-3.63897, -3.559399, 0, 0, 1.5, 0.5, 0.5,
-3.63897, -3.559399, 2, 0, -0.5, 0.5, 0.5,
-3.63897, -3.559399, 2, 1, -0.5, 0.5, 0.5,
-3.63897, -3.559399, 2, 1, 1.5, 0.5, 0.5,
-3.63897, -3.559399, 2, 0, 1.5, 0.5, 0.5,
-3.63897, -3.559399, 4, 0, -0.5, 0.5, 0.5,
-3.63897, -3.559399, 4, 1, -0.5, 0.5, 0.5,
-3.63897, -3.559399, 4, 1, 1.5, 0.5, 0.5,
-3.63897, -3.559399, 4, 0, 1.5, 0.5, 0.5
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
-3.132067, -3.046845, -6.135264,
-3.132067, 3.787202, -6.135264,
-3.132067, -3.046845, 5.256573,
-3.132067, 3.787202, 5.256573,
-3.132067, -3.046845, -6.135264,
-3.132067, -3.046845, 5.256573,
-3.132067, 3.787202, -6.135264,
-3.132067, 3.787202, 5.256573,
-3.132067, -3.046845, -6.135264,
3.626637, -3.046845, -6.135264,
-3.132067, -3.046845, 5.256573,
3.626637, -3.046845, 5.256573,
-3.132067, 3.787202, -6.135264,
3.626637, 3.787202, -6.135264,
-3.132067, 3.787202, 5.256573,
3.626637, 3.787202, 5.256573,
3.626637, -3.046845, -6.135264,
3.626637, 3.787202, -6.135264,
3.626637, -3.046845, 5.256573,
3.626637, 3.787202, 5.256573,
3.626637, -3.046845, -6.135264,
3.626637, -3.046845, 5.256573,
3.626637, 3.787202, -6.135264,
3.626637, 3.787202, 5.256573
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
var radius = 7.958966;
var distance = 35.41034;
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
mvMatrix.translate( -0.2472848, -0.3701786, 0.4393454 );
mvMatrix.scale( 1.273231, 1.259194, 0.7553997 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41034);
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
dimethylether<-read.table("dimethylether.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethylether$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
y<-dimethylether$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
z<-dimethylether$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
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
-3.033639, -0.09181701, -1.259504, 0, 0, 1, 1, 1,
-2.967002, -0.09331325, 1.185563, 1, 0, 0, 1, 1,
-2.786052, 0.6753612, -1.822225, 1, 0, 0, 1, 1,
-2.726393, -0.3550069, -1.026942, 1, 0, 0, 1, 1,
-2.691907, 0.5049523, -1.634242, 1, 0, 0, 1, 1,
-2.679793, -0.7362159, -0.995582, 1, 0, 0, 1, 1,
-2.610038, 0.729108, -2.459403, 0, 0, 0, 1, 1,
-2.520407, -1.035417, -0.4802667, 0, 0, 0, 1, 1,
-2.495886, 0.0738987, -1.061732, 0, 0, 0, 1, 1,
-2.492435, -0.2022892, -1.2038, 0, 0, 0, 1, 1,
-2.3942, 0.165822, 0.09385697, 0, 0, 0, 1, 1,
-2.291058, 0.4877137, -0.5233203, 0, 0, 0, 1, 1,
-2.281596, -0.807273, -2.748477, 0, 0, 0, 1, 1,
-2.275524, 1.73152, -2.602878, 1, 1, 1, 1, 1,
-2.252259, 0.8510913, -1.158028, 1, 1, 1, 1, 1,
-2.245422, -0.7022702, -1.820671, 1, 1, 1, 1, 1,
-2.208892, -0.3622873, -2.180772, 1, 1, 1, 1, 1,
-2.206157, 0.2892728, -1.647453, 1, 1, 1, 1, 1,
-2.203477, -0.6924589, -0.9488568, 1, 1, 1, 1, 1,
-2.143476, -0.09561738, -0.6180781, 1, 1, 1, 1, 1,
-2.117209, 0.4734287, -2.005723, 1, 1, 1, 1, 1,
-2.102716, 1.718559, -1.40422, 1, 1, 1, 1, 1,
-2.083966, -0.7442949, -1.498572, 1, 1, 1, 1, 1,
-2.081002, -0.07380775, -0.7612221, 1, 1, 1, 1, 1,
-2.038979, 0.07536694, -2.653925, 1, 1, 1, 1, 1,
-2.020746, 0.4017997, -0.8743279, 1, 1, 1, 1, 1,
-1.987881, -0.8530177, -2.753535, 1, 1, 1, 1, 1,
-1.981173, 1.17351, -1.975559, 1, 1, 1, 1, 1,
-1.977553, -1.598029, -1.897731, 0, 0, 1, 1, 1,
-1.960111, 0.4193605, 0.01586075, 1, 0, 0, 1, 1,
-1.917933, -1.308467, -2.868738, 1, 0, 0, 1, 1,
-1.913434, 0.9352697, -0.3902348, 1, 0, 0, 1, 1,
-1.912366, 0.4270032, -4.381876, 1, 0, 0, 1, 1,
-1.909363, -0.1438276, -1.346875, 1, 0, 0, 1, 1,
-1.897714, -0.6091238, -2.424616, 0, 0, 0, 1, 1,
-1.887187, -1.06078, -3.446245, 0, 0, 0, 1, 1,
-1.876755, 0.4736394, -1.617566, 0, 0, 0, 1, 1,
-1.863437, -1.800601, -1.209222, 0, 0, 0, 1, 1,
-1.853819, 0.08786741, -3.120237, 0, 0, 0, 1, 1,
-1.849309, 0.4467179, -1.561586, 0, 0, 0, 1, 1,
-1.84009, 0.5599043, -3.218024, 0, 0, 0, 1, 1,
-1.830647, 0.6006432, -0.5793627, 1, 1, 1, 1, 1,
-1.818049, 0.4455346, 0.04547998, 1, 1, 1, 1, 1,
-1.812329, 0.3828219, -0.8166077, 1, 1, 1, 1, 1,
-1.79359, -1.399142, -2.866845, 1, 1, 1, 1, 1,
-1.792872, -1.116548, -3.250818, 1, 1, 1, 1, 1,
-1.782531, -0.3847469, -3.600428, 1, 1, 1, 1, 1,
-1.772819, 0.0566548, -0.3633664, 1, 1, 1, 1, 1,
-1.770296, -0.07859515, -0.6602857, 1, 1, 1, 1, 1,
-1.765934, 0.4184013, -1.04945, 1, 1, 1, 1, 1,
-1.744067, -1.049798, -3.310969, 1, 1, 1, 1, 1,
-1.730886, 1.30355, -1.180254, 1, 1, 1, 1, 1,
-1.727797, 1.08696, -0.954166, 1, 1, 1, 1, 1,
-1.723451, -0.4603758, -0.5583439, 1, 1, 1, 1, 1,
-1.715722, -0.0486794, -2.068817, 1, 1, 1, 1, 1,
-1.711198, -1.009171, -0.9932696, 1, 1, 1, 1, 1,
-1.709811, -1.592535, -3.329833, 0, 0, 1, 1, 1,
-1.707295, -0.2044088, -1.376626, 1, 0, 0, 1, 1,
-1.662733, 0.6101941, -1.723411, 1, 0, 0, 1, 1,
-1.661124, -0.7337629, -1.146434, 1, 0, 0, 1, 1,
-1.645046, 1.140837, -0.1478371, 1, 0, 0, 1, 1,
-1.644127, 1.387946, -0.6179184, 1, 0, 0, 1, 1,
-1.642454, -0.02738681, -0.6492226, 0, 0, 0, 1, 1,
-1.633431, -0.322564, -1.130157, 0, 0, 0, 1, 1,
-1.631723, 1.399651, -0.9729905, 0, 0, 0, 1, 1,
-1.626842, -0.4328877, -0.6276877, 0, 0, 0, 1, 1,
-1.585036, -1.384767, -1.896155, 0, 0, 0, 1, 1,
-1.573091, 0.9862285, -1.072939, 0, 0, 0, 1, 1,
-1.563839, 0.7449253, -2.339604, 0, 0, 0, 1, 1,
-1.552837, 1.057748, 1.619576, 1, 1, 1, 1, 1,
-1.542247, 0.06530745, -2.674311, 1, 1, 1, 1, 1,
-1.539038, 0.6003413, -1.071513, 1, 1, 1, 1, 1,
-1.531674, 0.631968, -3.565389, 1, 1, 1, 1, 1,
-1.527162, -0.5976942, -0.5686203, 1, 1, 1, 1, 1,
-1.513255, 0.757158, -1.652806, 1, 1, 1, 1, 1,
-1.499553, 0.4683321, -1.000744, 1, 1, 1, 1, 1,
-1.494414, 0.05651823, -3.613119, 1, 1, 1, 1, 1,
-1.489066, -0.6045756, -1.43417, 1, 1, 1, 1, 1,
-1.485965, -2.525271, -2.714745, 1, 1, 1, 1, 1,
-1.484051, 0.350463, -1.983626, 1, 1, 1, 1, 1,
-1.469917, 0.2069928, -2.962821, 1, 1, 1, 1, 1,
-1.469556, 1.15545, -0.3863128, 1, 1, 1, 1, 1,
-1.457202, 0.05662744, -2.202092, 1, 1, 1, 1, 1,
-1.45575, 0.6139306, -0.7788162, 1, 1, 1, 1, 1,
-1.444692, -0.3060979, -1.342733, 0, 0, 1, 1, 1,
-1.444661, 1.258575, 0.1869007, 1, 0, 0, 1, 1,
-1.44206, -0.6729804, -2.565517, 1, 0, 0, 1, 1,
-1.439276, -1.07176, -2.821592, 1, 0, 0, 1, 1,
-1.438877, -0.9036949, -1.436856, 1, 0, 0, 1, 1,
-1.438336, -0.5697502, -1.298356, 1, 0, 0, 1, 1,
-1.433693, -1.186947, -1.63614, 0, 0, 0, 1, 1,
-1.433378, 1.27911, 0.9038822, 0, 0, 0, 1, 1,
-1.414721, 0.4857861, -1.313236, 0, 0, 0, 1, 1,
-1.411095, -1.163337, -1.931551, 0, 0, 0, 1, 1,
-1.377009, 1.013269, -0.6530934, 0, 0, 0, 1, 1,
-1.370022, -0.6885619, -2.936298, 0, 0, 0, 1, 1,
-1.352676, 0.3910908, -0.1264188, 0, 0, 0, 1, 1,
-1.349643, -0.9818507, -2.658108, 1, 1, 1, 1, 1,
-1.346485, 0.7194294, -1.155342, 1, 1, 1, 1, 1,
-1.341748, 1.361383, 0.3346623, 1, 1, 1, 1, 1,
-1.341701, 0.8101649, -0.1934291, 1, 1, 1, 1, 1,
-1.3374, -1.500134, -1.595824, 1, 1, 1, 1, 1,
-1.326323, 0.6073263, -0.1469466, 1, 1, 1, 1, 1,
-1.325894, -0.4525737, -1.801874, 1, 1, 1, 1, 1,
-1.325011, 0.3893595, -0.02504877, 1, 1, 1, 1, 1,
-1.319533, 0.721365, -0.1664697, 1, 1, 1, 1, 1,
-1.317039, 1.133781, -1.729584, 1, 1, 1, 1, 1,
-1.290628, 0.5540367, 0.1448631, 1, 1, 1, 1, 1,
-1.272025, 0.9247885, 2.187244, 1, 1, 1, 1, 1,
-1.270463, -0.06791437, -0.06217277, 1, 1, 1, 1, 1,
-1.258293, 0.3569711, -2.48924, 1, 1, 1, 1, 1,
-1.258254, -1.266364, -0.6828742, 1, 1, 1, 1, 1,
-1.25396, 0.6184981, -0.8732064, 0, 0, 1, 1, 1,
-1.253471, 0.3876082, -0.4319646, 1, 0, 0, 1, 1,
-1.253028, -0.3563322, -1.589363, 1, 0, 0, 1, 1,
-1.238447, 0.09616669, -1.421692, 1, 0, 0, 1, 1,
-1.237244, 0.0566428, -1.995025, 1, 0, 0, 1, 1,
-1.233568, 0.04497651, -0.9787642, 1, 0, 0, 1, 1,
-1.214698, -0.5095247, -1.603263, 0, 0, 0, 1, 1,
-1.211862, 0.3955179, -2.378136, 0, 0, 0, 1, 1,
-1.211277, -0.2409412, -2.479052, 0, 0, 0, 1, 1,
-1.209066, 0.6394705, -2.466533, 0, 0, 0, 1, 1,
-1.208097, -0.6843219, -2.329057, 0, 0, 0, 1, 1,
-1.181924, 0.6080133, -0.4315108, 0, 0, 0, 1, 1,
-1.177371, 0.05824023, -0.6215519, 0, 0, 0, 1, 1,
-1.175349, 0.2225855, -2.915172, 1, 1, 1, 1, 1,
-1.171563, 0.7723847, 0.6418377, 1, 1, 1, 1, 1,
-1.165308, 1.186799, -0.01117874, 1, 1, 1, 1, 1,
-1.161378, 0.4097952, 2.104204, 1, 1, 1, 1, 1,
-1.160954, -1.036947, -2.320622, 1, 1, 1, 1, 1,
-1.158426, -0.9029271, -1.278722, 1, 1, 1, 1, 1,
-1.157814, 0.05610241, -1.053457, 1, 1, 1, 1, 1,
-1.156894, 0.8058213, -2.310711, 1, 1, 1, 1, 1,
-1.152298, -0.3508618, -0.4640675, 1, 1, 1, 1, 1,
-1.146528, 1.174957, 0.4155582, 1, 1, 1, 1, 1,
-1.143085, 1.763931, -0.6018702, 1, 1, 1, 1, 1,
-1.140051, -1.140197, -1.300241, 1, 1, 1, 1, 1,
-1.137484, 0.8445424, -0.4892958, 1, 1, 1, 1, 1,
-1.135987, -0.08418988, -1.691307, 1, 1, 1, 1, 1,
-1.135469, 2.922865, -0.9416035, 1, 1, 1, 1, 1,
-1.131602, -0.4830083, -3.12535, 0, 0, 1, 1, 1,
-1.121286, -0.7855622, -0.6627873, 1, 0, 0, 1, 1,
-1.120957, 0.7729301, -0.8309706, 1, 0, 0, 1, 1,
-1.11527, -1.584069, -2.874195, 1, 0, 0, 1, 1,
-1.113006, 0.7299682, -0.8287418, 1, 0, 0, 1, 1,
-1.110651, -0.6849719, -2.13296, 1, 0, 0, 1, 1,
-1.110391, -0.3439248, -0.7591257, 0, 0, 0, 1, 1,
-1.105454, 0.6754047, -2.382563, 0, 0, 0, 1, 1,
-1.104917, -0.8550649, -2.278005, 0, 0, 0, 1, 1,
-1.101122, 0.0109286, -2.829304, 0, 0, 0, 1, 1,
-1.099421, -1.569449, -1.195991, 0, 0, 0, 1, 1,
-1.093397, -1.242464, -2.693817, 0, 0, 0, 1, 1,
-1.09159, 1.467257, -0.2128869, 0, 0, 0, 1, 1,
-1.078831, -0.3149762, -0.6384647, 1, 1, 1, 1, 1,
-1.075166, 0.2349009, -1.531383, 1, 1, 1, 1, 1,
-1.059179, 2.264823, -0.5547221, 1, 1, 1, 1, 1,
-1.058846, -0.7065284, -1.815736, 1, 1, 1, 1, 1,
-1.056718, 0.2979198, -2.031171, 1, 1, 1, 1, 1,
-1.055378, -1.030805, -2.330796, 1, 1, 1, 1, 1,
-1.053045, -1.03789, -4.362517, 1, 1, 1, 1, 1,
-1.048223, 1.358724, -0.9675345, 1, 1, 1, 1, 1,
-1.04821, 0.5393267, -0.5921571, 1, 1, 1, 1, 1,
-1.045968, -0.2379147, -3.353711, 1, 1, 1, 1, 1,
-1.035942, -1.371658, -3.630366, 1, 1, 1, 1, 1,
-1.021266, 0.6855429, -0.9258347, 1, 1, 1, 1, 1,
-1.017468, 0.8347453, -2.661205, 1, 1, 1, 1, 1,
-1.016744, -0.1069209, -1.260158, 1, 1, 1, 1, 1,
-1.016718, 0.4506311, 0.1902083, 1, 1, 1, 1, 1,
-1.016485, 0.8106406, -2.650404, 0, 0, 1, 1, 1,
-1.015344, -0.9436631, -2.107406, 1, 0, 0, 1, 1,
-1.013196, 1.218516, 1.069258, 1, 0, 0, 1, 1,
-1.012163, 0.5410775, -1.278816, 1, 0, 0, 1, 1,
-1.011253, 2.317268, -0.3160753, 1, 0, 0, 1, 1,
-1.011193, -0.5844796, -3.466607, 1, 0, 0, 1, 1,
-1.007878, -0.9442732, -1.652177, 0, 0, 0, 1, 1,
-1.006241, 0.7152538, -0.8889903, 0, 0, 0, 1, 1,
-0.9965943, 1.628997, -1.000972, 0, 0, 0, 1, 1,
-0.9850222, -0.8687366, -3.648657, 0, 0, 0, 1, 1,
-0.9813702, -1.345958, -2.258005, 0, 0, 0, 1, 1,
-0.978125, -0.1132181, -1.494248, 0, 0, 0, 1, 1,
-0.9616119, 0.6490257, -1.670959, 0, 0, 0, 1, 1,
-0.9515328, 1.415135, -0.2852043, 1, 1, 1, 1, 1,
-0.9470794, 0.2497088, 0.009767535, 1, 1, 1, 1, 1,
-0.9450058, 0.08837884, -0.8067755, 1, 1, 1, 1, 1,
-0.9418401, -1.202659, -1.917319, 1, 1, 1, 1, 1,
-0.941662, -0.08334665, -2.561044, 1, 1, 1, 1, 1,
-0.9414847, 0.7866446, 0.257354, 1, 1, 1, 1, 1,
-0.9412377, -0.5570644, -2.220354, 1, 1, 1, 1, 1,
-0.9352854, 0.5900317, -0.4411962, 1, 1, 1, 1, 1,
-0.9222894, 1.278807, -1.009243, 1, 1, 1, 1, 1,
-0.9203327, -1.19087, -3.18768, 1, 1, 1, 1, 1,
-0.9149482, -0.5519042, -2.562616, 1, 1, 1, 1, 1,
-0.9131622, 0.2288797, -0.889752, 1, 1, 1, 1, 1,
-0.9122552, -0.3564323, -0.8785202, 1, 1, 1, 1, 1,
-0.9117364, 0.0153332, 0.5838174, 1, 1, 1, 1, 1,
-0.908304, -1.0134, -1.958919, 1, 1, 1, 1, 1,
-0.9056397, -0.6917773, -1.687233, 0, 0, 1, 1, 1,
-0.9037233, 0.4490783, 0.3411998, 1, 0, 0, 1, 1,
-0.885594, 0.6653022, -0.7831717, 1, 0, 0, 1, 1,
-0.8851026, 1.186717, -1.774965, 1, 0, 0, 1, 1,
-0.8834348, 1.553954, -1.718858, 1, 0, 0, 1, 1,
-0.8820496, -2.550141, -1.930782, 1, 0, 0, 1, 1,
-0.8779036, 0.3200551, -0.6837988, 0, 0, 0, 1, 1,
-0.876748, 0.8961186, -0.720203, 0, 0, 0, 1, 1,
-0.8629897, -1.429091, -3.181747, 0, 0, 0, 1, 1,
-0.851002, 0.8180027, -0.3320478, 0, 0, 0, 1, 1,
-0.8385314, -0.3398357, -0.934692, 0, 0, 0, 1, 1,
-0.8291752, 1.682671, -0.5112297, 0, 0, 0, 1, 1,
-0.8093764, -0.730631, -0.7262393, 0, 0, 0, 1, 1,
-0.8070336, -0.5211846, -1.477947, 1, 1, 1, 1, 1,
-0.8064674, 0.4432286, -2.228471, 1, 1, 1, 1, 1,
-0.8060688, -1.601007, -2.749512, 1, 1, 1, 1, 1,
-0.8013672, -0.5900324, -1.960252, 1, 1, 1, 1, 1,
-0.8001167, -1.582623, -2.238264, 1, 1, 1, 1, 1,
-0.7968009, 1.051856, -1.378267, 1, 1, 1, 1, 1,
-0.7927793, -1.885834, -3.948701, 1, 1, 1, 1, 1,
-0.7904212, 2.155285, -1.358982, 1, 1, 1, 1, 1,
-0.7896965, 0.3733288, -0.7102635, 1, 1, 1, 1, 1,
-0.785227, -0.4183525, -3.262847, 1, 1, 1, 1, 1,
-0.7839599, -0.6856127, -4.316091, 1, 1, 1, 1, 1,
-0.7839157, 2.928452, 1.907988, 1, 1, 1, 1, 1,
-0.7835405, -1.583227, -2.458458, 1, 1, 1, 1, 1,
-0.77614, -1.076232, -1.638904, 1, 1, 1, 1, 1,
-0.7758399, 1.33811, -1.634263, 1, 1, 1, 1, 1,
-0.7750662, 0.1170217, -0.4329009, 0, 0, 1, 1, 1,
-0.7692974, 0.9288261, -1.498348, 1, 0, 0, 1, 1,
-0.7442225, -1.691994, -3.53204, 1, 0, 0, 1, 1,
-0.7346316, -0.4074393, -2.932578, 1, 0, 0, 1, 1,
-0.7274661, 1.146469, 0.01376292, 1, 0, 0, 1, 1,
-0.7256141, -0.7857931, -3.115632, 1, 0, 0, 1, 1,
-0.7163441, -0.591469, -0.3049328, 0, 0, 0, 1, 1,
-0.7155134, 0.3203227, -0.7790006, 0, 0, 0, 1, 1,
-0.7148352, 0.04263372, -1.570211, 0, 0, 0, 1, 1,
-0.7024316, -1.294038, -1.426385, 0, 0, 0, 1, 1,
-0.6938468, -0.2108855, -3.544713, 0, 0, 0, 1, 1,
-0.693491, -0.8020082, -1.593524, 0, 0, 0, 1, 1,
-0.6879693, 0.9301218, -0.9417009, 0, 0, 0, 1, 1,
-0.6829598, 2.122743, -1.898001, 1, 1, 1, 1, 1,
-0.6814399, -0.4900685, -3.138, 1, 1, 1, 1, 1,
-0.6802161, 0.0796272, -1.501346, 1, 1, 1, 1, 1,
-0.680006, 1.421984, 1.329039, 1, 1, 1, 1, 1,
-0.6730433, 0.9662132, -0.4883842, 1, 1, 1, 1, 1,
-0.6724157, 0.7349806, 0.2118551, 1, 1, 1, 1, 1,
-0.6721969, 0.0215049, -1.481779, 1, 1, 1, 1, 1,
-0.6622003, -0.9748367, -3.088385, 1, 1, 1, 1, 1,
-0.6537141, -0.3054732, -4.725556, 1, 1, 1, 1, 1,
-0.6499906, 1.240165, -3.798048, 1, 1, 1, 1, 1,
-0.6499317, -0.6162566, -3.067427, 1, 1, 1, 1, 1,
-0.6474591, -0.2509283, -0.7671505, 1, 1, 1, 1, 1,
-0.6388606, -0.6844657, -1.723487, 1, 1, 1, 1, 1,
-0.6386968, 0.1588877, -2.747672, 1, 1, 1, 1, 1,
-0.6363859, -0.6424162, -2.390183, 1, 1, 1, 1, 1,
-0.6333991, -2.305518, -2.408375, 0, 0, 1, 1, 1,
-0.6304067, -0.06296697, 0.3816196, 1, 0, 0, 1, 1,
-0.6292722, -0.03094443, -3.013959, 1, 0, 0, 1, 1,
-0.6230422, 0.7485804, -1.601961, 1, 0, 0, 1, 1,
-0.6217069, -0.5388213, -0.7404625, 1, 0, 0, 1, 1,
-0.6207519, 0.7999769, 1.059891, 1, 0, 0, 1, 1,
-0.6204077, 0.5258333, 0.395958, 0, 0, 0, 1, 1,
-0.6185468, -0.4407758, -1.597652, 0, 0, 0, 1, 1,
-0.6170731, 1.501602, -0.08612822, 0, 0, 0, 1, 1,
-0.6163656, 0.08416762, -2.2173, 0, 0, 0, 1, 1,
-0.6120127, 0.2060698, -0.2408514, 0, 0, 0, 1, 1,
-0.6118286, -0.5036404, -2.457957, 0, 0, 0, 1, 1,
-0.6107802, 0.8649538, -0.8517756, 0, 0, 0, 1, 1,
-0.6094146, -1.083104, -3.561398, 1, 1, 1, 1, 1,
-0.6079943, 0.7701454, 0.3615892, 1, 1, 1, 1, 1,
-0.6061281, -0.8249696, -3.001872, 1, 1, 1, 1, 1,
-0.6048253, -1.298833, -3.063249, 1, 1, 1, 1, 1,
-0.5968594, -0.0003913551, -0.3563432, 1, 1, 1, 1, 1,
-0.5964127, -1.2136, -2.838491, 1, 1, 1, 1, 1,
-0.5844133, 1.4032, -1.118974, 1, 1, 1, 1, 1,
-0.5833032, 2.222336, -1.275458, 1, 1, 1, 1, 1,
-0.5742181, -0.6572718, -2.150695, 1, 1, 1, 1, 1,
-0.5725439, 0.8101797, -0.1114381, 1, 1, 1, 1, 1,
-0.5719105, 0.7969909, -0.2875269, 1, 1, 1, 1, 1,
-0.5707004, -0.1636332, -2.888926, 1, 1, 1, 1, 1,
-0.5699277, -0.03201985, -1.014487, 1, 1, 1, 1, 1,
-0.5653605, 0.4155217, -1.768657, 1, 1, 1, 1, 1,
-0.5637755, 0.4681986, -1.685867, 1, 1, 1, 1, 1,
-0.5622393, -0.3043481, -2.987847, 0, 0, 1, 1, 1,
-0.56141, -0.817771, -3.563071, 1, 0, 0, 1, 1,
-0.5593027, 0.09845053, -1.910893, 1, 0, 0, 1, 1,
-0.5584438, 2.094007, -0.3405772, 1, 0, 0, 1, 1,
-0.5539901, 0.6060808, 0.00911446, 1, 0, 0, 1, 1,
-0.5402895, -0.0967219, -2.100993, 1, 0, 0, 1, 1,
-0.5389318, -0.6564512, -1.893157, 0, 0, 0, 1, 1,
-0.5382784, -0.172966, -3.18068, 0, 0, 0, 1, 1,
-0.5362642, -1.147781, -4.564213, 0, 0, 0, 1, 1,
-0.5347357, 0.07247806, -1.613534, 0, 0, 0, 1, 1,
-0.5296469, -0.1040912, -1.963801, 0, 0, 0, 1, 1,
-0.5290789, 2.464235, -0.3179426, 0, 0, 0, 1, 1,
-0.5279608, -1.339053, -3.150859, 0, 0, 0, 1, 1,
-0.5254978, 0.5701442, 1.168203, 1, 1, 1, 1, 1,
-0.5222886, -0.6722169, -2.292005, 1, 1, 1, 1, 1,
-0.5209167, 0.6172523, -1.590752, 1, 1, 1, 1, 1,
-0.5164582, -0.4835536, -2.688841, 1, 1, 1, 1, 1,
-0.5163896, 0.1376707, -2.357396, 1, 1, 1, 1, 1,
-0.5127959, -1.279458, -3.132966, 1, 1, 1, 1, 1,
-0.5095099, 0.1267956, -1.437048, 1, 1, 1, 1, 1,
-0.5037246, 0.7618122, -2.216004, 1, 1, 1, 1, 1,
-0.5034882, -0.1176917, -2.861917, 1, 1, 1, 1, 1,
-0.5027843, -1.361309, -3.343587, 1, 1, 1, 1, 1,
-0.5019165, 0.3455584, -1.463092, 1, 1, 1, 1, 1,
-0.5012263, -1.005427, -2.972064, 1, 1, 1, 1, 1,
-0.5003445, -0.7498329, -2.974778, 1, 1, 1, 1, 1,
-0.5001997, 0.0764166, -2.546398, 1, 1, 1, 1, 1,
-0.4901291, 0.01744615, -0.7302327, 1, 1, 1, 1, 1,
-0.4888646, 0.711547, -0.7440294, 0, 0, 1, 1, 1,
-0.4881947, 1.378985, -1.547422, 1, 0, 0, 1, 1,
-0.4877497, -0.3762268, -1.607736, 1, 0, 0, 1, 1,
-0.487616, 0.1715652, -0.5752802, 1, 0, 0, 1, 1,
-0.4804515, 1.324633, 0.3653357, 1, 0, 0, 1, 1,
-0.4757112, -1.268043, -4.646606, 1, 0, 0, 1, 1,
-0.4743366, -1.897612, -3.637808, 0, 0, 0, 1, 1,
-0.4613849, 0.6537575, -1.4643, 0, 0, 0, 1, 1,
-0.4579713, 0.07638791, -0.4357823, 0, 0, 0, 1, 1,
-0.4563209, -2.043738, -2.007071, 0, 0, 0, 1, 1,
-0.4559215, -0.8513314, -1.751062, 0, 0, 0, 1, 1,
-0.4557871, 1.177762, 0.6770001, 0, 0, 0, 1, 1,
-0.4541191, -0.1076589, -0.9295286, 0, 0, 0, 1, 1,
-0.4535163, -2.58487, -1.9398, 1, 1, 1, 1, 1,
-0.4529458, 0.7167227, -1.717301, 1, 1, 1, 1, 1,
-0.4480926, -0.373485, -1.569887, 1, 1, 1, 1, 1,
-0.4401712, 0.08884353, -2.784335, 1, 1, 1, 1, 1,
-0.4375109, 1.840929, 1.055867, 1, 1, 1, 1, 1,
-0.435187, 0.6171925, -1.667396, 1, 1, 1, 1, 1,
-0.4349567, -0.9658946, -3.019094, 1, 1, 1, 1, 1,
-0.4339819, -0.02625569, -1.377455, 1, 1, 1, 1, 1,
-0.4331876, -2.743873, -2.539922, 1, 1, 1, 1, 1,
-0.4217599, -0.4971607, -1.214364, 1, 1, 1, 1, 1,
-0.4180509, -0.8431224, -2.319789, 1, 1, 1, 1, 1,
-0.4170344, -1.890148, -0.6771088, 1, 1, 1, 1, 1,
-0.4167331, 0.7727917, -1.93572, 1, 1, 1, 1, 1,
-0.4151871, -0.7876677, -3.495259, 1, 1, 1, 1, 1,
-0.409881, 0.1913939, -0.5492941, 1, 1, 1, 1, 1,
-0.4098575, 0.8203838, -0.5130572, 0, 0, 1, 1, 1,
-0.4078071, -1.472499, -2.163939, 1, 0, 0, 1, 1,
-0.4072922, 1.19734, -0.8656984, 1, 0, 0, 1, 1,
-0.4046844, -0.08084222, -0.9550113, 1, 0, 0, 1, 1,
-0.4023331, 0.6327574, -0.1903018, 1, 0, 0, 1, 1,
-0.3976413, -1.358308, -3.399127, 1, 0, 0, 1, 1,
-0.3909948, 0.3812667, -0.829611, 0, 0, 0, 1, 1,
-0.3866795, 0.07785708, -0.9393728, 0, 0, 0, 1, 1,
-0.3845512, -0.9553223, -2.604597, 0, 0, 0, 1, 1,
-0.3841504, -2.09076, -2.912848, 0, 0, 0, 1, 1,
-0.3836765, 0.4387538, -0.814846, 0, 0, 0, 1, 1,
-0.3784638, -1.894931, -3.207741, 0, 0, 0, 1, 1,
-0.3717805, 1.202711, 1.011714, 0, 0, 0, 1, 1,
-0.3704226, -0.8401304, -3.750673, 1, 1, 1, 1, 1,
-0.3703793, 2.034105, -0.02097011, 1, 1, 1, 1, 1,
-0.3687762, 0.02833829, -1.498074, 1, 1, 1, 1, 1,
-0.3658161, -0.595738, -3.778821, 1, 1, 1, 1, 1,
-0.3637867, -2.45555, -1.063205, 1, 1, 1, 1, 1,
-0.3600884, -0.6965302, -2.203105, 1, 1, 1, 1, 1,
-0.3575895, 0.7399166, -1.623332, 1, 1, 1, 1, 1,
-0.3554263, -1.001866, -3.27158, 1, 1, 1, 1, 1,
-0.3522453, 0.774002, -0.2316207, 1, 1, 1, 1, 1,
-0.3487425, -1.304709, -4.212688, 1, 1, 1, 1, 1,
-0.3483377, 1.162994, -1.348217, 1, 1, 1, 1, 1,
-0.3442903, 0.4924733, -2.360645, 1, 1, 1, 1, 1,
-0.3439549, -2.112104, -3.054354, 1, 1, 1, 1, 1,
-0.3423626, -0.7712331, -3.578645, 1, 1, 1, 1, 1,
-0.3319854, -0.2950263, -3.525023, 1, 1, 1, 1, 1,
-0.3270293, -0.5743202, -2.863091, 0, 0, 1, 1, 1,
-0.3266553, -0.01656019, -0.5181661, 1, 0, 0, 1, 1,
-0.3251407, -1.580186, -3.879077, 1, 0, 0, 1, 1,
-0.3194813, 0.6166288, -0.003523537, 1, 0, 0, 1, 1,
-0.3146369, 0.7686548, -0.108767, 1, 0, 0, 1, 1,
-0.3142667, -0.3362665, -0.163679, 1, 0, 0, 1, 1,
-0.313156, -1.152208, -4.666252, 0, 0, 0, 1, 1,
-0.3126403, 1.408404, 0.7716394, 0, 0, 0, 1, 1,
-0.3115886, -0.6007771, -3.980879, 0, 0, 0, 1, 1,
-0.3110946, -0.1267163, -3.437583, 0, 0, 0, 1, 1,
-0.3076884, -1.887885, -3.985517, 0, 0, 0, 1, 1,
-0.3076155, 0.3016397, 0.2136258, 0, 0, 0, 1, 1,
-0.3059142, 0.5267385, -0.004328405, 0, 0, 0, 1, 1,
-0.304432, -0.3680412, -3.411176, 1, 1, 1, 1, 1,
-0.3031508, -1.012326, -3.075878, 1, 1, 1, 1, 1,
-0.3021998, 0.6324434, -1.022929, 1, 1, 1, 1, 1,
-0.3004766, 2.132004, 0.1827356, 1, 1, 1, 1, 1,
-0.299815, 0.9121506, -0.8234804, 1, 1, 1, 1, 1,
-0.2977538, -0.9796969, -3.220969, 1, 1, 1, 1, 1,
-0.293497, -0.3168326, -0.5159936, 1, 1, 1, 1, 1,
-0.2923131, -1.56471, -2.602845, 1, 1, 1, 1, 1,
-0.2901129, 0.190173, -0.6995355, 1, 1, 1, 1, 1,
-0.2850044, -0.7319966, -2.507657, 1, 1, 1, 1, 1,
-0.2817911, -0.4124538, -1.385347, 1, 1, 1, 1, 1,
-0.2697865, -0.04708011, -3.933988, 1, 1, 1, 1, 1,
-0.2677867, 0.8289475, -0.06370091, 1, 1, 1, 1, 1,
-0.2641067, 2.373647, -0.0522854, 1, 1, 1, 1, 1,
-0.2626431, 0.5896928, 0.3363486, 1, 1, 1, 1, 1,
-0.259736, -0.5087029, -1.624938, 0, 0, 1, 1, 1,
-0.2589483, 2.839562, -0.1590017, 1, 0, 0, 1, 1,
-0.2586106, -0.8628238, -3.646005, 1, 0, 0, 1, 1,
-0.2584104, -0.4439426, -1.9658, 1, 0, 0, 1, 1,
-0.2563176, 1.424214, 0.3586009, 1, 0, 0, 1, 1,
-0.2533505, 0.8380591, 2.717434, 1, 0, 0, 1, 1,
-0.2522386, 1.226745, 0.6163423, 0, 0, 0, 1, 1,
-0.250338, 0.8763391, -0.5067878, 0, 0, 0, 1, 1,
-0.2500107, 0.4132634, -0.8161338, 0, 0, 0, 1, 1,
-0.2493633, 0.7385544, 0.6679184, 0, 0, 0, 1, 1,
-0.2437691, -0.3776339, -3.429539, 0, 0, 0, 1, 1,
-0.2416153, 2.736072, -0.7796973, 0, 0, 0, 1, 1,
-0.2339385, 1.033483, 0.3029969, 0, 0, 0, 1, 1,
-0.2332003, -0.4355915, -3.385357, 1, 1, 1, 1, 1,
-0.2309836, -0.165251, -1.178244, 1, 1, 1, 1, 1,
-0.2292907, -0.3323441, -2.523516, 1, 1, 1, 1, 1,
-0.2244653, -0.1046276, -1.47467, 1, 1, 1, 1, 1,
-0.2236858, 0.5742261, -2.470241, 1, 1, 1, 1, 1,
-0.2231996, 1.822462, -0.2603609, 1, 1, 1, 1, 1,
-0.2172491, -1.16951, -1.848203, 1, 1, 1, 1, 1,
-0.2153561, -0.3315358, -3.864388, 1, 1, 1, 1, 1,
-0.212255, -0.8554765, -1.823843, 1, 1, 1, 1, 1,
-0.2073956, 1.985281, -0.6825439, 1, 1, 1, 1, 1,
-0.2041467, 0.9741597, -0.6576388, 1, 1, 1, 1, 1,
-0.2037589, -0.9841058, -5.969363, 1, 1, 1, 1, 1,
-0.2003216, -1.845285, -2.683408, 1, 1, 1, 1, 1,
-0.2002728, -0.5669849, -2.975497, 1, 1, 1, 1, 1,
-0.1994868, -0.7043778, -4.331892, 1, 1, 1, 1, 1,
-0.1980192, -0.4758351, -1.134749, 0, 0, 1, 1, 1,
-0.1972913, 1.132117, 0.09301623, 1, 0, 0, 1, 1,
-0.1940853, -1.236244, -2.173853, 1, 0, 0, 1, 1,
-0.1934117, 2.886204, 0.5382795, 1, 0, 0, 1, 1,
-0.1902012, 0.9980832, 0.6565402, 1, 0, 0, 1, 1,
-0.1877609, 1.141758, 1.319263, 1, 0, 0, 1, 1,
-0.1859305, 0.7046768, -0.5646753, 0, 0, 0, 1, 1,
-0.1800726, -0.4242472, -4.41391, 0, 0, 0, 1, 1,
-0.1795743, -0.3408668, -3.248893, 0, 0, 0, 1, 1,
-0.1794095, -0.2121894, -2.11386, 0, 0, 0, 1, 1,
-0.172306, 1.437297, 0.1277416, 0, 0, 0, 1, 1,
-0.1706224, 0.8287712, -0.7927135, 0, 0, 0, 1, 1,
-0.1655393, 0.7703568, 0.01579525, 0, 0, 0, 1, 1,
-0.1652941, -2.03467, -4.133044, 1, 1, 1, 1, 1,
-0.1639769, -0.3201329, -1.784612, 1, 1, 1, 1, 1,
-0.1624673, 0.3446109, 0.7969079, 1, 1, 1, 1, 1,
-0.1605059, -1.141155, -3.22784, 1, 1, 1, 1, 1,
-0.1564535, -0.242791, -2.649981, 1, 1, 1, 1, 1,
-0.1555278, 1.366715, 0.8654546, 1, 1, 1, 1, 1,
-0.1553286, 0.3103178, -1.326289, 1, 1, 1, 1, 1,
-0.1532692, 0.0571439, -1.995017, 1, 1, 1, 1, 1,
-0.1532263, -0.6352161, -4.620186, 1, 1, 1, 1, 1,
-0.153037, -0.09428905, -3.477099, 1, 1, 1, 1, 1,
-0.1502117, -0.4145541, -4.564048, 1, 1, 1, 1, 1,
-0.1467064, 2.92514, 0.6119865, 1, 1, 1, 1, 1,
-0.1457178, 1.736681, 0.8553416, 1, 1, 1, 1, 1,
-0.1442634, -0.7212356, -4.245905, 1, 1, 1, 1, 1,
-0.1413272, -1.227989, -3.145346, 1, 1, 1, 1, 1,
-0.1398334, 0.05163653, -1.539622, 0, 0, 1, 1, 1,
-0.1360233, -1.570331, -5.361688, 1, 0, 0, 1, 1,
-0.1342816, -0.9078064, -2.967481, 1, 0, 0, 1, 1,
-0.1316056, 1.487632, -0.5672218, 1, 0, 0, 1, 1,
-0.1309005, -0.1412271, -3.358074, 1, 0, 0, 1, 1,
-0.1305866, 0.4240103, -0.9540812, 1, 0, 0, 1, 1,
-0.1291778, -0.7698845, -3.372809, 0, 0, 0, 1, 1,
-0.1250796, -2.784561, -3.457575, 0, 0, 0, 1, 1,
-0.121391, 0.6140184, -0.1327327, 0, 0, 0, 1, 1,
-0.1203193, 1.031395, -0.7522972, 0, 0, 0, 1, 1,
-0.1201097, -0.9959946, -5.093411, 0, 0, 0, 1, 1,
-0.116145, -0.05866948, -2.349577, 0, 0, 0, 1, 1,
-0.1149671, -0.9102392, -3.234162, 0, 0, 0, 1, 1,
-0.1122458, -0.6361023, -5.385158, 1, 1, 1, 1, 1,
-0.1101993, 0.686257, 2.171881, 1, 1, 1, 1, 1,
-0.108654, 1.408219, 0.6995423, 1, 1, 1, 1, 1,
-0.1081599, 0.4824226, 1.283107, 1, 1, 1, 1, 1,
-0.1071527, 0.8549957, -0.4898987, 1, 1, 1, 1, 1,
-0.1055056, -0.3834372, -2.87382, 1, 1, 1, 1, 1,
-0.1041395, -0.6622149, -2.445502, 1, 1, 1, 1, 1,
-0.1029319, 1.235711, 0.5142268, 1, 1, 1, 1, 1,
-0.10273, 0.4317528, -1.668424, 1, 1, 1, 1, 1,
-0.1017348, 0.1827928, -1.07934, 1, 1, 1, 1, 1,
-0.09831385, 0.4030567, -0.8186935, 1, 1, 1, 1, 1,
-0.09687824, 0.3628906, -0.03821908, 1, 1, 1, 1, 1,
-0.09451092, -2.337122, -5.251998, 1, 1, 1, 1, 1,
-0.09244065, 0.6214284, 1.127538, 1, 1, 1, 1, 1,
-0.09170371, 0.3098644, -0.3065029, 1, 1, 1, 1, 1,
-0.08990959, 0.3681157, 0.3138842, 0, 0, 1, 1, 1,
-0.08957301, -0.3716533, -3.796001, 1, 0, 0, 1, 1,
-0.08834387, 1.09226, 0.1597282, 1, 0, 0, 1, 1,
-0.08385437, -0.3238721, -3.242063, 1, 0, 0, 1, 1,
-0.08309623, 1.094785, 0.8279343, 1, 0, 0, 1, 1,
-0.07273486, -0.2190375, -3.230036, 1, 0, 0, 1, 1,
-0.07120728, 1.01178, 0.6191595, 0, 0, 0, 1, 1,
-0.06806889, -0.14807, 0.6464717, 0, 0, 0, 1, 1,
-0.06694314, 0.9100411, -0.05811675, 0, 0, 0, 1, 1,
-0.06631619, -0.5079836, -3.658065, 0, 0, 0, 1, 1,
-0.0601025, -0.4145259, -4.270606, 0, 0, 0, 1, 1,
-0.05835383, -1.220346, -4.496142, 0, 0, 0, 1, 1,
-0.05244659, 0.0707968, -1.404274, 0, 0, 0, 1, 1,
-0.05168764, 1.930859, -0.6773309, 1, 1, 1, 1, 1,
-0.04885275, -1.127114, -1.733262, 1, 1, 1, 1, 1,
-0.04573848, 0.6170767, -0.4502033, 1, 1, 1, 1, 1,
-0.03938182, 1.227909, 0.3897057, 1, 1, 1, 1, 1,
-0.03767639, -0.4698908, -2.224313, 1, 1, 1, 1, 1,
-0.03720787, -2.456486, -4.540529, 1, 1, 1, 1, 1,
-0.03652705, 1.556228, 0.3949683, 1, 1, 1, 1, 1,
-0.03411746, 1.033035, 0.4385194, 1, 1, 1, 1, 1,
-0.02091684, -0.8187618, -4.226434, 1, 1, 1, 1, 1,
-0.01893532, 0.5882412, 0.8938162, 1, 1, 1, 1, 1,
-0.01873513, 1.748078, 0.2469787, 1, 1, 1, 1, 1,
-0.01141527, 1.303547, -0.2158423, 1, 1, 1, 1, 1,
-0.01106061, -1.192743, -1.918542, 1, 1, 1, 1, 1,
-0.008225227, -0.2663421, -3.385706, 1, 1, 1, 1, 1,
-0.006977465, -0.8020726, -4.804419, 1, 1, 1, 1, 1,
-0.005207593, -0.933025, -1.993983, 0, 0, 1, 1, 1,
-0.004378479, -0.16993, -5.657022, 1, 0, 0, 1, 1,
0.0003617322, 1.043035, 0.8934229, 1, 0, 0, 1, 1,
0.001244161, 0.4209905, 1.185099, 1, 0, 0, 1, 1,
0.003207043, -0.3461651, 2.383817, 1, 0, 0, 1, 1,
0.007632886, 0.8207475, -0.2699314, 1, 0, 0, 1, 1,
0.008627926, 1.490884, 0.2135563, 0, 0, 0, 1, 1,
0.01314245, -1.466409, 2.747938, 0, 0, 0, 1, 1,
0.01517223, -0.9939277, 3.651809, 0, 0, 0, 1, 1,
0.01781154, 0.3102445, -1.110388, 0, 0, 0, 1, 1,
0.02157672, 0.1935144, 1.932252, 0, 0, 0, 1, 1,
0.02871582, -0.1367212, 3.761994, 0, 0, 0, 1, 1,
0.03235988, 0.5987234, -1.369617, 0, 0, 0, 1, 1,
0.03439342, -1.958555, 4.395051, 1, 1, 1, 1, 1,
0.03489229, -0.6267052, 2.294476, 1, 1, 1, 1, 1,
0.0359597, -1.232345, 2.884434, 1, 1, 1, 1, 1,
0.03700941, 0.2941041, 0.7881188, 1, 1, 1, 1, 1,
0.04324879, -1.122152, 1.117419, 1, 1, 1, 1, 1,
0.05238128, 1.29336, -0.2434139, 1, 1, 1, 1, 1,
0.05653314, -0.5666381, 3.362657, 1, 1, 1, 1, 1,
0.05725514, -1.321553, 3.713988, 1, 1, 1, 1, 1,
0.05780788, 0.05962018, 2.601161, 1, 1, 1, 1, 1,
0.06415572, 0.4940855, -0.03010498, 1, 1, 1, 1, 1,
0.06425969, 0.5380402, 0.0396313, 1, 1, 1, 1, 1,
0.06786426, 0.4246486, -1.292609, 1, 1, 1, 1, 1,
0.06824468, 0.2651695, 0.3498949, 1, 1, 1, 1, 1,
0.06956659, -0.3946138, 1.807462, 1, 1, 1, 1, 1,
0.07219183, 0.6517882, 0.4845245, 1, 1, 1, 1, 1,
0.07264788, 0.3440657, -0.109632, 0, 0, 1, 1, 1,
0.07405933, -1.671591, 2.446531, 1, 0, 0, 1, 1,
0.07519444, -1.083679, 2.188625, 1, 0, 0, 1, 1,
0.08049515, 0.3041329, 1.858553, 1, 0, 0, 1, 1,
0.08201981, 0.5262859, 1.328527, 1, 0, 0, 1, 1,
0.0823002, 0.6239557, -0.4340234, 1, 0, 0, 1, 1,
0.08375181, 0.8133981, -0.6088973, 0, 0, 0, 1, 1,
0.0837798, -0.2642258, 2.457803, 0, 0, 0, 1, 1,
0.08414067, 0.1730916, -0.1919812, 0, 0, 0, 1, 1,
0.08444972, 0.9311509, -1.532054, 0, 0, 0, 1, 1,
0.08789128, 0.4010358, 2.101291, 0, 0, 0, 1, 1,
0.08867257, -0.1187431, 2.512683, 0, 0, 0, 1, 1,
0.0911588, -0.8080301, 3.952675, 0, 0, 0, 1, 1,
0.09117024, -0.6075646, 2.717763, 1, 1, 1, 1, 1,
0.09258968, -0.182039, 2.766911, 1, 1, 1, 1, 1,
0.09412927, 0.2057863, -0.9431863, 1, 1, 1, 1, 1,
0.09482656, -0.2290224, 1.103527, 1, 1, 1, 1, 1,
0.0956892, -0.8884337, 0.6619263, 1, 1, 1, 1, 1,
0.1001465, -1.073212, 2.879884, 1, 1, 1, 1, 1,
0.1001874, 0.3625241, 1.407659, 1, 1, 1, 1, 1,
0.1109006, -0.006139275, 3.805595, 1, 1, 1, 1, 1,
0.1123226, -1.038161, 3.850157, 1, 1, 1, 1, 1,
0.115277, -0.9283804, 3.437891, 1, 1, 1, 1, 1,
0.1176706, -1.204054, 1.90172, 1, 1, 1, 1, 1,
0.1186304, 0.3841607, 0.2305329, 1, 1, 1, 1, 1,
0.1226778, 0.2177338, 1.143951, 1, 1, 1, 1, 1,
0.1245305, 0.4843838, -0.7587104, 1, 1, 1, 1, 1,
0.1253663, 0.3135062, -0.2966906, 1, 1, 1, 1, 1,
0.1265841, -1.067287, 4.752717, 0, 0, 1, 1, 1,
0.1306279, -0.3320004, 3.087605, 1, 0, 0, 1, 1,
0.1325629, -0.941911, 4.898154, 1, 0, 0, 1, 1,
0.136176, -0.5511839, 2.516121, 1, 0, 0, 1, 1,
0.1376601, -0.9821349, 3.630402, 1, 0, 0, 1, 1,
0.1388063, -0.5192491, 1.500159, 1, 0, 0, 1, 1,
0.1429039, -0.1652003, 3.864034, 0, 0, 0, 1, 1,
0.1441708, 0.4139385, -0.01059319, 0, 0, 0, 1, 1,
0.1522545, 1.022437, 0.1937341, 0, 0, 0, 1, 1,
0.1600975, -0.6542776, 1.837029, 0, 0, 0, 1, 1,
0.1629174, 0.6666933, -1.217961, 0, 0, 0, 1, 1,
0.172996, 0.8951989, 1.327408, 0, 0, 0, 1, 1,
0.1732648, -0.9448905, 2.835833, 0, 0, 0, 1, 1,
0.1748402, 0.2453618, 0.03495269, 1, 1, 1, 1, 1,
0.1751718, -1.18767, 3.4611, 1, 1, 1, 1, 1,
0.179715, -1.520325, 4.791395, 1, 1, 1, 1, 1,
0.1829105, -1.195177, 3.597123, 1, 1, 1, 1, 1,
0.1870948, -0.9599334, 3.106763, 1, 1, 1, 1, 1,
0.1896005, -0.4076892, 2.408111, 1, 1, 1, 1, 1,
0.1923591, 0.6293706, -0.03331765, 1, 1, 1, 1, 1,
0.1958729, -0.595431, 2.428022, 1, 1, 1, 1, 1,
0.199435, -1.359674, 2.846605, 1, 1, 1, 1, 1,
0.1996873, 0.07968619, 0.9308534, 1, 1, 1, 1, 1,
0.2011444, 0.04558748, 2.50272, 1, 1, 1, 1, 1,
0.2013018, 0.5572062, -0.3406544, 1, 1, 1, 1, 1,
0.2088859, -0.3109988, 0.9258841, 1, 1, 1, 1, 1,
0.2092337, -0.01622203, 2.155981, 1, 1, 1, 1, 1,
0.2094204, -0.3446335, 2.887908, 1, 1, 1, 1, 1,
0.2106783, 0.7754902, 0.7732394, 0, 0, 1, 1, 1,
0.211121, 0.8534802, -0.184278, 1, 0, 0, 1, 1,
0.2136298, -0.1965218, 3.284846, 1, 0, 0, 1, 1,
0.2149019, -1.579681, 4.074618, 1, 0, 0, 1, 1,
0.2160489, 1.023758, 0.1980896, 1, 0, 0, 1, 1,
0.2160504, -2.076268, 3.583242, 1, 0, 0, 1, 1,
0.2223088, -0.4508898, 2.894366, 0, 0, 0, 1, 1,
0.2230739, -1.012328, 2.901213, 0, 0, 0, 1, 1,
0.2318324, -0.4203051, 3.323886, 0, 0, 0, 1, 1,
0.2342666, 0.8187749, 0.1122509, 0, 0, 0, 1, 1,
0.2393424, 0.03627663, 2.729566, 0, 0, 0, 1, 1,
0.2407764, -0.6519074, 4.016626, 0, 0, 0, 1, 1,
0.2460713, 0.7085377, 0.428834, 0, 0, 0, 1, 1,
0.2509142, -1.564594, 1.787726, 1, 1, 1, 1, 1,
0.2519611, 1.005734, 0.8938166, 1, 1, 1, 1, 1,
0.2522734, 0.05218333, 2.089342, 1, 1, 1, 1, 1,
0.2523841, 0.8030731, 0.960982, 1, 1, 1, 1, 1,
0.2547228, 0.3544617, -0.2079729, 1, 1, 1, 1, 1,
0.2577408, -1.05785, 2.217887, 1, 1, 1, 1, 1,
0.2617582, -2.197557, 3.729917, 1, 1, 1, 1, 1,
0.2685378, -0.7511752, 2.375588, 1, 1, 1, 1, 1,
0.2708846, -0.7133037, 2.134185, 1, 1, 1, 1, 1,
0.2718529, 0.3014162, 0.3813506, 1, 1, 1, 1, 1,
0.2745138, -0.9785752, 2.216707, 1, 1, 1, 1, 1,
0.2760999, -1.046579, 1.911449, 1, 1, 1, 1, 1,
0.2783592, 0.09473298, 1.969066, 1, 1, 1, 1, 1,
0.2792861, -1.153181, 1.680732, 1, 1, 1, 1, 1,
0.2889764, -1.056242, 2.138263, 1, 1, 1, 1, 1,
0.2932272, 1.170182, -1.982528, 0, 0, 1, 1, 1,
0.2951333, -1.222083, 3.329934, 1, 0, 0, 1, 1,
0.2952773, -0.3702202, 3.627806, 1, 0, 0, 1, 1,
0.2989854, -0.514101, 2.650997, 1, 0, 0, 1, 1,
0.2995888, 2.315336, 1.043016, 1, 0, 0, 1, 1,
0.3083885, 0.4727722, 0.2864908, 1, 0, 0, 1, 1,
0.3103977, 0.3493241, 2.722049, 0, 0, 0, 1, 1,
0.311665, 0.09714226, 0.3799132, 0, 0, 0, 1, 1,
0.3188376, 0.5321174, 1.014817, 0, 0, 0, 1, 1,
0.3267811, 1.286042, -0.5769902, 0, 0, 0, 1, 1,
0.3269936, 1.223414, -0.1615685, 0, 0, 0, 1, 1,
0.3273296, 0.32671, -0.4252829, 0, 0, 0, 1, 1,
0.3359821, -0.4207959, 3.710249, 0, 0, 0, 1, 1,
0.3406885, 1.114778, 0.8662771, 1, 1, 1, 1, 1,
0.3423361, -1.656021, 1.923109, 1, 1, 1, 1, 1,
0.3584437, 0.06677169, 2.287586, 1, 1, 1, 1, 1,
0.3585716, 0.3050794, -0.5640692, 1, 1, 1, 1, 1,
0.3600549, 0.2621851, 1.21407, 1, 1, 1, 1, 1,
0.3608761, -1.036549, 1.534821, 1, 1, 1, 1, 1,
0.3639133, -1.179609, 3.396431, 1, 1, 1, 1, 1,
0.3664442, 2.481848, -1.383951, 1, 1, 1, 1, 1,
0.3677847, -0.1159158, 2.680948, 1, 1, 1, 1, 1,
0.372615, -1.903513, 5.090672, 1, 1, 1, 1, 1,
0.377154, -2.110451, 2.194745, 1, 1, 1, 1, 1,
0.3791813, -0.4729743, 1.289288, 1, 1, 1, 1, 1,
0.3817054, 0.2753235, 1.330685, 1, 1, 1, 1, 1,
0.3863781, -0.4198541, 3.630055, 1, 1, 1, 1, 1,
0.3901847, 1.211342, 0.547567, 1, 1, 1, 1, 1,
0.3908433, -0.7322999, 3.033898, 0, 0, 1, 1, 1,
0.3975822, 1.718289, -0.06853424, 1, 0, 0, 1, 1,
0.4018702, -0.01426193, 0.2425544, 1, 0, 0, 1, 1,
0.4028049, -1.54352, 3.297305, 1, 0, 0, 1, 1,
0.4069462, 0.9822659, 0.1417505, 1, 0, 0, 1, 1,
0.4072139, -0.3898621, 2.37663, 1, 0, 0, 1, 1,
0.413957, -0.6869379, 1.843049, 0, 0, 0, 1, 1,
0.4158616, 0.449928, 0.7227105, 0, 0, 0, 1, 1,
0.4173111, -0.206334, 0.7042147, 0, 0, 0, 1, 1,
0.4192233, -0.3803193, 1.754373, 0, 0, 0, 1, 1,
0.4242703, -0.1939475, 2.596372, 0, 0, 0, 1, 1,
0.4263776, 1.327718, 1.131875, 0, 0, 0, 1, 1,
0.4270762, -0.117853, 3.584416, 0, 0, 0, 1, 1,
0.4274822, 0.8894687, 1.412641, 1, 1, 1, 1, 1,
0.4288776, 0.2579713, 0.4761131, 1, 1, 1, 1, 1,
0.4290894, -0.3701779, 3.297477, 1, 1, 1, 1, 1,
0.4295304, -0.3354034, 2.883516, 1, 1, 1, 1, 1,
0.4305502, -0.8442444, 1.740988, 1, 1, 1, 1, 1,
0.437995, 1.822458, 0.6996393, 1, 1, 1, 1, 1,
0.4390904, 0.699986, -0.3067891, 1, 1, 1, 1, 1,
0.440119, -1.430405, 2.752381, 1, 1, 1, 1, 1,
0.4420651, 1.230276, 1.186677, 1, 1, 1, 1, 1,
0.444308, -1.131962, 3.069414, 1, 1, 1, 1, 1,
0.4491146, -0.1343774, 1.803954, 1, 1, 1, 1, 1,
0.4501145, -1.22505, 3.493563, 1, 1, 1, 1, 1,
0.4556659, 1.1477, 1.886364, 1, 1, 1, 1, 1,
0.4559262, -0.07066035, 1.659813, 1, 1, 1, 1, 1,
0.4597658, 0.9186094, -0.3371125, 1, 1, 1, 1, 1,
0.4631786, 1.241241, 0.6478709, 0, 0, 1, 1, 1,
0.4666767, -0.1871451, 4.303932, 1, 0, 0, 1, 1,
0.4707261, -0.006856015, 0.5085071, 1, 0, 0, 1, 1,
0.4728292, -1.648931, 2.563341, 1, 0, 0, 1, 1,
0.4787097, -0.6626225, 1.77213, 1, 0, 0, 1, 1,
0.4788096, -0.3074586, 1.551007, 1, 0, 0, 1, 1,
0.4803253, 2.078215, 0.0788956, 0, 0, 0, 1, 1,
0.4808763, 0.5658341, 0.9853586, 0, 0, 0, 1, 1,
0.481063, -0.8044176, 4.858425, 0, 0, 0, 1, 1,
0.4836193, -1.710087, 2.736245, 0, 0, 0, 1, 1,
0.4847362, -1.887573, 2.949774, 0, 0, 0, 1, 1,
0.4858347, -2.011729, 2.548547, 0, 0, 0, 1, 1,
0.4861624, 1.044816, 1.092555, 0, 0, 0, 1, 1,
0.4871859, -1.701237, 1.170806, 1, 1, 1, 1, 1,
0.4875906, -0.1594871, 3.675076, 1, 1, 1, 1, 1,
0.4906599, 0.6424655, 0.1705629, 1, 1, 1, 1, 1,
0.4977033, 0.01509708, 2.243433, 1, 1, 1, 1, 1,
0.49965, 0.4912864, -0.4860843, 1, 1, 1, 1, 1,
0.5025949, 2.707173, -0.06954341, 1, 1, 1, 1, 1,
0.5031651, 0.1390112, -0.001512614, 1, 1, 1, 1, 1,
0.5039604, 2.420895, 1.07962, 1, 1, 1, 1, 1,
0.5053113, 0.337627, -0.1833385, 1, 1, 1, 1, 1,
0.5074485, -0.7643873, 1.795765, 1, 1, 1, 1, 1,
0.5092871, 0.8375604, -0.5396608, 1, 1, 1, 1, 1,
0.5093595, 0.8124856, 1.11768, 1, 1, 1, 1, 1,
0.5142703, 1.84103, -0.04836508, 1, 1, 1, 1, 1,
0.5145755, 0.6016351, 0.6419771, 1, 1, 1, 1, 1,
0.5223417, 1.605736, -0.5682548, 1, 1, 1, 1, 1,
0.5242458, -1.12295, 3.657106, 0, 0, 1, 1, 1,
0.5265502, -1.096733, 2.07578, 1, 0, 0, 1, 1,
0.528026, -0.1660032, 1.469355, 1, 0, 0, 1, 1,
0.5301952, -0.5112043, 1.905402, 1, 0, 0, 1, 1,
0.5304436, -0.263297, 0.762093, 1, 0, 0, 1, 1,
0.5329581, 1.610643, 0.805344, 1, 0, 0, 1, 1,
0.5370668, 0.01568792, 3.112413, 0, 0, 0, 1, 1,
0.5403839, -0.2415237, 3.573778, 0, 0, 0, 1, 1,
0.5426548, 0.01230125, 0.5907454, 0, 0, 0, 1, 1,
0.5427773, 1.087879, 0.198594, 0, 0, 0, 1, 1,
0.5481117, 0.5746812, 1.405882, 0, 0, 0, 1, 1,
0.5524155, -0.4226512, 3.065153, 0, 0, 0, 1, 1,
0.5561122, 1.419151, -0.2775362, 0, 0, 0, 1, 1,
0.5569673, -2.145572, 3.042877, 1, 1, 1, 1, 1,
0.557334, -0.6614026, 2.965373, 1, 1, 1, 1, 1,
0.5698525, 0.1434858, 0.2015902, 1, 1, 1, 1, 1,
0.5707377, 0.6895704, 2.139531, 1, 1, 1, 1, 1,
0.572345, 1.146397, -1.157679, 1, 1, 1, 1, 1,
0.574398, 0.6836928, 1.087685, 1, 1, 1, 1, 1,
0.5768904, -0.3124114, 0.8684633, 1, 1, 1, 1, 1,
0.5780402, -0.8867279, 2.979211, 1, 1, 1, 1, 1,
0.5782712, -1.015493, 2.911973, 1, 1, 1, 1, 1,
0.5819537, -0.8310859, 0.9731034, 1, 1, 1, 1, 1,
0.5895186, 1.237412, 3.109201, 1, 1, 1, 1, 1,
0.5922833, 0.1179735, 0.7942339, 1, 1, 1, 1, 1,
0.5925494, -0.5152867, 1.319507, 1, 1, 1, 1, 1,
0.595115, -0.6355261, 1.859062, 1, 1, 1, 1, 1,
0.6132399, -0.1023877, 1.493055, 1, 1, 1, 1, 1,
0.6224869, 0.4543817, 2.052247, 0, 0, 1, 1, 1,
0.6233059, -0.06732309, 3.755398, 1, 0, 0, 1, 1,
0.6273586, 0.6273294, 2.739235, 1, 0, 0, 1, 1,
0.6307606, -1.154006, 3.396712, 1, 0, 0, 1, 1,
0.6310999, 1.408135, 1.647337, 1, 0, 0, 1, 1,
0.6356881, -0.7496985, 1.588954, 1, 0, 0, 1, 1,
0.6475285, -2.422804, 2.239167, 0, 0, 0, 1, 1,
0.6477458, -0.5569476, 2.858111, 0, 0, 0, 1, 1,
0.649001, 0.4351652, 0.3173995, 0, 0, 0, 1, 1,
0.6497741, -0.9781654, 1.189027, 0, 0, 0, 1, 1,
0.6516446, -0.4646652, 2.607151, 0, 0, 0, 1, 1,
0.6548221, -1.019641, 2.880315, 0, 0, 0, 1, 1,
0.6605261, -0.05015369, 1.402783, 0, 0, 0, 1, 1,
0.6631142, 1.307295, 0.004617862, 1, 1, 1, 1, 1,
0.6678163, 0.127364, 0.86691, 1, 1, 1, 1, 1,
0.6687802, -0.8720315, 2.588068, 1, 1, 1, 1, 1,
0.6713362, 0.08954884, 2.02434, 1, 1, 1, 1, 1,
0.6740149, -0.1521527, -0.1942994, 1, 1, 1, 1, 1,
0.6822367, 0.5960975, -0.2673554, 1, 1, 1, 1, 1,
0.6845629, 0.3720238, 1.787952, 1, 1, 1, 1, 1,
0.6846291, -1.623686, 2.785973, 1, 1, 1, 1, 1,
0.6856505, 0.9511375, 1.753947, 1, 1, 1, 1, 1,
0.6874459, -0.2668592, 1.525841, 1, 1, 1, 1, 1,
0.6884829, -0.5031026, 2.769149, 1, 1, 1, 1, 1,
0.7017962, 1.928092, 0.6524978, 1, 1, 1, 1, 1,
0.7024615, -0.2378981, 1.82629, 1, 1, 1, 1, 1,
0.7087322, 0.922244, 1.766756, 1, 1, 1, 1, 1,
0.7160339, -1.098649, 3.524854, 1, 1, 1, 1, 1,
0.719775, 0.6759753, 0.8556983, 0, 0, 1, 1, 1,
0.7242637, -0.2489535, 1.189857, 1, 0, 0, 1, 1,
0.7258963, -0.2184066, 1.134974, 1, 0, 0, 1, 1,
0.7261723, -0.06620134, 1.7907, 1, 0, 0, 1, 1,
0.7272125, -0.03555683, 2.895519, 1, 0, 0, 1, 1,
0.7272223, -0.2052237, 1.643202, 1, 0, 0, 1, 1,
0.7372886, -0.09196885, 1.543265, 0, 0, 0, 1, 1,
0.7382012, -0.1294074, 2.429119, 0, 0, 0, 1, 1,
0.744677, -0.6989049, 2.651688, 0, 0, 0, 1, 1,
0.7454339, 0.4551426, 2.085629, 0, 0, 0, 1, 1,
0.7540636, -1.064509, 3.243032, 0, 0, 0, 1, 1,
0.7591837, 0.4135135, 0.9663526, 0, 0, 0, 1, 1,
0.7600027, -0.105044, 1.51582, 0, 0, 0, 1, 1,
0.7608186, 1.782239, 1.148135, 1, 1, 1, 1, 1,
0.7644925, -0.3167821, 1.363192, 1, 1, 1, 1, 1,
0.7671586, 0.294502, -0.08551618, 1, 1, 1, 1, 1,
0.7705579, 0.5939039, 0.7165167, 1, 1, 1, 1, 1,
0.7784637, 0.3047427, 0.4277746, 1, 1, 1, 1, 1,
0.7794574, -0.301083, -0.1802204, 1, 1, 1, 1, 1,
0.7831669, 1.452636, 0.4179736, 1, 1, 1, 1, 1,
0.7892483, -0.3867343, 2.253052, 1, 1, 1, 1, 1,
0.7910154, 0.1966282, 0.5791257, 1, 1, 1, 1, 1,
0.798172, -0.4858854, 2.542934, 1, 1, 1, 1, 1,
0.8004333, 0.1981921, 2.866888, 1, 1, 1, 1, 1,
0.8004427, 0.3510523, 1.279172, 1, 1, 1, 1, 1,
0.8143432, -0.9249862, 2.178342, 1, 1, 1, 1, 1,
0.8171866, -0.2001645, 1.033151, 1, 1, 1, 1, 1,
0.8207417, -0.9481659, 2.739281, 1, 1, 1, 1, 1,
0.8214344, 1.124379, -0.3315957, 0, 0, 1, 1, 1,
0.8227595, 0.7772382, -0.9933779, 1, 0, 0, 1, 1,
0.8241599, -1.090893, 0.7858425, 1, 0, 0, 1, 1,
0.8261642, -0.6191702, 2.58876, 1, 0, 0, 1, 1,
0.8297789, -2.700089, 4.072582, 1, 0, 0, 1, 1,
0.8320185, -0.4115612, 2.100834, 1, 0, 0, 1, 1,
0.8321922, 1.889811, 1.752043, 0, 0, 0, 1, 1,
0.8407434, 2.295956, 0.7587196, 0, 0, 0, 1, 1,
0.8418272, 0.6165157, 0.4645489, 0, 0, 0, 1, 1,
0.8429587, -0.7783047, 2.237289, 0, 0, 0, 1, 1,
0.843594, -0.5956784, 2.017778, 0, 0, 0, 1, 1,
0.843609, -1.882509, 3.418638, 0, 0, 0, 1, 1,
0.8512588, 0.3936233, 1.900811, 0, 0, 0, 1, 1,
0.8555948, -1.617521, 1.511301, 1, 1, 1, 1, 1,
0.8600183, -0.7346649, 3.47168, 1, 1, 1, 1, 1,
0.8692252, 0.1474465, 4.311818, 1, 1, 1, 1, 1,
0.8692377, -0.2840557, 2.688128, 1, 1, 1, 1, 1,
0.8724599, 0.4084025, 0.8960354, 1, 1, 1, 1, 1,
0.8789586, 2.073495, 0.643391, 1, 1, 1, 1, 1,
0.8804028, 1.569561, 1.543666, 1, 1, 1, 1, 1,
0.8810543, -0.1672928, 3.02347, 1, 1, 1, 1, 1,
0.882131, 0.09732573, 1.889254, 1, 1, 1, 1, 1,
0.8837782, 0.7132896, 0.2868138, 1, 1, 1, 1, 1,
0.8931811, 0.122706, 2.739552, 1, 1, 1, 1, 1,
0.8954706, 0.5837344, 2.758169, 1, 1, 1, 1, 1,
0.9013062, -1.536494, 1.293045, 1, 1, 1, 1, 1,
0.9120269, -0.6844282, 1.996905, 1, 1, 1, 1, 1,
0.9126302, -0.4110121, 1.180367, 1, 1, 1, 1, 1,
0.9132028, 1.144578, -0.1806582, 0, 0, 1, 1, 1,
0.9136729, -0.3187206, 4.48304, 1, 0, 0, 1, 1,
0.9171103, -1.38176, 3.132615, 1, 0, 0, 1, 1,
0.9224613, -0.2161848, 0.4992732, 1, 0, 0, 1, 1,
0.9246634, -0.4977811, 2.428204, 1, 0, 0, 1, 1,
0.9288353, 0.7274929, -0.4392387, 1, 0, 0, 1, 1,
0.9292521, -0.2342286, 1.606083, 0, 0, 0, 1, 1,
0.9295741, 0.4929068, 3.483602, 0, 0, 0, 1, 1,
0.9315816, 0.5226637, -0.6314875, 0, 0, 0, 1, 1,
0.9378585, -0.481819, 2.234865, 0, 0, 0, 1, 1,
0.9444483, -0.08570968, 1.570326, 0, 0, 0, 1, 1,
0.9616767, 1.699055, 0.6099614, 0, 0, 0, 1, 1,
0.9662833, -1.855294, 2.427967, 0, 0, 0, 1, 1,
0.9701913, -0.5336486, 1.342272, 1, 1, 1, 1, 1,
0.9778318, 0.5702602, 0.3328362, 1, 1, 1, 1, 1,
0.9807262, 2.027573, 0.1623603, 1, 1, 1, 1, 1,
0.9827589, -0.6021048, 2.591607, 1, 1, 1, 1, 1,
0.9858632, -1.863783, 3.847024, 1, 1, 1, 1, 1,
0.9950811, 1.642733, 0.5014726, 1, 1, 1, 1, 1,
0.9993569, 1.415254, 0.2348246, 1, 1, 1, 1, 1,
1.002618, 0.6771555, 0.623848, 1, 1, 1, 1, 1,
1.005275, -0.5187853, 1.504129, 1, 1, 1, 1, 1,
1.007086, 2.098423, -2.062912, 1, 1, 1, 1, 1,
1.013954, 0.2690588, 0.2021453, 1, 1, 1, 1, 1,
1.016606, 1.456353, 2.061133, 1, 1, 1, 1, 1,
1.017628, 1.550499, 0.4815027, 1, 1, 1, 1, 1,
1.027545, 0.8493576, -0.0749833, 1, 1, 1, 1, 1,
1.029944, 0.3179331, 0.4405423, 1, 1, 1, 1, 1,
1.04067, 0.09655347, 2.10314, 0, 0, 1, 1, 1,
1.041285, 0.1559195, 1.105223, 1, 0, 0, 1, 1,
1.041394, 0.506981, 1.159957, 1, 0, 0, 1, 1,
1.042248, 1.796777, 0.6911538, 1, 0, 0, 1, 1,
1.043689, -0.3132703, 2.056583, 1, 0, 0, 1, 1,
1.044442, -2.569408, 1.880957, 1, 0, 0, 1, 1,
1.046684, -0.7657276, 1.975174, 0, 0, 0, 1, 1,
1.048728, -1.741517, 3.396741, 0, 0, 0, 1, 1,
1.064321, 2.470035, 0.6037101, 0, 0, 0, 1, 1,
1.070381, -0.9776136, 1.678174, 0, 0, 0, 1, 1,
1.071775, -0.1401907, 1.724209, 0, 0, 0, 1, 1,
1.073353, -1.147785, 2.282436, 0, 0, 0, 1, 1,
1.076236, -0.00992541, 1.763652, 0, 0, 0, 1, 1,
1.078028, -0.0708034, 2.941141, 1, 1, 1, 1, 1,
1.078032, 0.252964, 1.611184, 1, 1, 1, 1, 1,
1.079227, 0.3398906, 1.287951, 1, 1, 1, 1, 1,
1.07956, 0.7978924, 1.820165, 1, 1, 1, 1, 1,
1.080459, 0.02626244, 1.316849, 1, 1, 1, 1, 1,
1.090219, 1.355648, 2.013517, 1, 1, 1, 1, 1,
1.09168, 0.4335929, 0.9820136, 1, 1, 1, 1, 1,
1.092223, -0.5786157, 0.1575467, 1, 1, 1, 1, 1,
1.099838, -0.1149138, 0.7901258, 1, 1, 1, 1, 1,
1.111078, 1.06784, 2.038155, 1, 1, 1, 1, 1,
1.117445, 1.193818, -0.7610241, 1, 1, 1, 1, 1,
1.119988, 0.06591933, 3.084314, 1, 1, 1, 1, 1,
1.122315, 1.352494, 0.9171262, 1, 1, 1, 1, 1,
1.134798, 0.1597705, 0.9114293, 1, 1, 1, 1, 1,
1.139495, -1.525595, 1.92977, 1, 1, 1, 1, 1,
1.140335, 1.165855, 3.913152, 0, 0, 1, 1, 1,
1.143928, -1.326057, 2.913301, 1, 0, 0, 1, 1,
1.145344, 0.6800165, 1.773365, 1, 0, 0, 1, 1,
1.147405, -0.1482153, 0.493163, 1, 0, 0, 1, 1,
1.15617, 0.6876524, 2.445265, 1, 0, 0, 1, 1,
1.162293, 1.737532, -0.4670255, 1, 0, 0, 1, 1,
1.173531, -0.2977908, 0.4913146, 0, 0, 0, 1, 1,
1.173905, 0.5653916, 3.038168, 0, 0, 0, 1, 1,
1.177431, 0.2940536, 1.76207, 0, 0, 0, 1, 1,
1.178696, -1.352041, 4.662639, 0, 0, 0, 1, 1,
1.181366, 1.101359, 1.12558, 0, 0, 0, 1, 1,
1.195077, 2.081581, -1.015395, 0, 0, 0, 1, 1,
1.200954, 0.8285534, 0.3559112, 0, 0, 0, 1, 1,
1.203248, 1.477166, 1.371168, 1, 1, 1, 1, 1,
1.207683, 0.8539599, 1.033149, 1, 1, 1, 1, 1,
1.209067, -1.413461, 1.977623, 1, 1, 1, 1, 1,
1.220707, -2.061309, 2.999463, 1, 1, 1, 1, 1,
1.224408, 0.7646836, 1.597728, 1, 1, 1, 1, 1,
1.226402, 2.043406, -0.7051237, 1, 1, 1, 1, 1,
1.242387, 0.2779101, 1.157767, 1, 1, 1, 1, 1,
1.247157, -0.4429355, -0.4402365, 1, 1, 1, 1, 1,
1.251595, -0.9252942, 2.686036, 1, 1, 1, 1, 1,
1.255562, -1.570269, 2.231812, 1, 1, 1, 1, 1,
1.259155, 3.687677, 1.368239, 1, 1, 1, 1, 1,
1.260057, 0.007341319, 2.190542, 1, 1, 1, 1, 1,
1.263212, -1.853524, 2.632861, 1, 1, 1, 1, 1,
1.266558, -0.3931837, 3.005732, 1, 1, 1, 1, 1,
1.269564, -0.3046986, 3.384336, 1, 1, 1, 1, 1,
1.272714, 0.1185253, 1.594943, 0, 0, 1, 1, 1,
1.283543, 1.394968, -0.1197068, 1, 0, 0, 1, 1,
1.291123, 0.3838034, 3.255462, 1, 0, 0, 1, 1,
1.291221, 0.7498519, 0.09327043, 1, 0, 0, 1, 1,
1.293627, 0.1007212, 0.9602072, 1, 0, 0, 1, 1,
1.300802, 0.06737304, 3.160762, 1, 0, 0, 1, 1,
1.303409, -1.544996, 0.7992314, 0, 0, 0, 1, 1,
1.307331, 0.4243681, 0.01691376, 0, 0, 0, 1, 1,
1.310232, -0.1889737, 1.692434, 0, 0, 0, 1, 1,
1.330164, -0.3222871, 1.694811, 0, 0, 0, 1, 1,
1.340249, 1.320429, 2.312926, 0, 0, 0, 1, 1,
1.342612, -0.4794572, 1.813223, 0, 0, 0, 1, 1,
1.344065, -0.7204894, 1.40864, 0, 0, 0, 1, 1,
1.351408, 0.6629652, 1.513537, 1, 1, 1, 1, 1,
1.354764, -2.028575, 1.879608, 1, 1, 1, 1, 1,
1.366305, -1.57434, 1.438893, 1, 1, 1, 1, 1,
1.367507, -0.1642646, 2.606369, 1, 1, 1, 1, 1,
1.369365, -0.7015531, 1.718486, 1, 1, 1, 1, 1,
1.370465, 0.9442352, 0.8409992, 1, 1, 1, 1, 1,
1.373642, -0.08784392, 1.848331, 1, 1, 1, 1, 1,
1.374409, -1.328695, 1.085542, 1, 1, 1, 1, 1,
1.375894, 0.2528984, 2.939643, 1, 1, 1, 1, 1,
1.389607, -1.044831, 2.089292, 1, 1, 1, 1, 1,
1.401853, 1.007936, 0.4005944, 1, 1, 1, 1, 1,
1.414226, 0.5062849, 1.678199, 1, 1, 1, 1, 1,
1.418632, 0.5120996, 1.346114, 1, 1, 1, 1, 1,
1.421703, 0.7729864, 1.690473, 1, 1, 1, 1, 1,
1.432604, -2.252614, 3.217657, 1, 1, 1, 1, 1,
1.434307, 1.013523, 1.285054, 0, 0, 1, 1, 1,
1.44474, 1.670558, 0.7323598, 1, 0, 0, 1, 1,
1.444921, -0.3924175, 0.3804636, 1, 0, 0, 1, 1,
1.448515, -0.9436567, 2.302557, 1, 0, 0, 1, 1,
1.449911, -0.106991, 1.249619, 1, 0, 0, 1, 1,
1.467308, 0.03690348, 1.55663, 1, 0, 0, 1, 1,
1.476414, -1.810462, 2.23659, 0, 0, 0, 1, 1,
1.47873, -0.2567998, 3.467818, 0, 0, 0, 1, 1,
1.479101, -0.7934936, 3.557835, 0, 0, 0, 1, 1,
1.484621, 0.838169, 0.322522, 0, 0, 0, 1, 1,
1.492381, -2.182535, 3.049284, 0, 0, 0, 1, 1,
1.49384, 1.581747, 1.318344, 0, 0, 0, 1, 1,
1.507457, -1.144479, 1.831541, 0, 0, 0, 1, 1,
1.507877, -1.455831, 2.011955, 1, 1, 1, 1, 1,
1.526611, 1.532558, -0.4137976, 1, 1, 1, 1, 1,
1.533222, 0.1968451, 1.459072, 1, 1, 1, 1, 1,
1.546179, -1.536109, 1.004235, 1, 1, 1, 1, 1,
1.546387, 1.977191, -0.192376, 1, 1, 1, 1, 1,
1.548169, 2.37696, 0.5905373, 1, 1, 1, 1, 1,
1.570827, 0.4048122, 1.939707, 1, 1, 1, 1, 1,
1.571362, 0.5836659, -0.3274681, 1, 1, 1, 1, 1,
1.574779, 0.1965496, 0.9863867, 1, 1, 1, 1, 1,
1.581321, -1.291354, 2.277168, 1, 1, 1, 1, 1,
1.588833, -1.691476, 2.483033, 1, 1, 1, 1, 1,
1.609167, 2.089106, 0.1068955, 1, 1, 1, 1, 1,
1.65891, -0.9317659, 1.984773, 1, 1, 1, 1, 1,
1.661967, -0.9320033, 2.044545, 1, 1, 1, 1, 1,
1.666057, 0.5578762, 1.687068, 1, 1, 1, 1, 1,
1.66632, 0.233866, 2.163342, 0, 0, 1, 1, 1,
1.700608, 0.5967563, 1.469443, 1, 0, 0, 1, 1,
1.702653, -1.477896, 1.218899, 1, 0, 0, 1, 1,
1.709565, 1.610922, 2.347305, 1, 0, 0, 1, 1,
1.71315, -0.06093727, 1.210914, 1, 0, 0, 1, 1,
1.715535, -0.04137408, 2.621058, 1, 0, 0, 1, 1,
1.734974, -1.690665, 2.580608, 0, 0, 0, 1, 1,
1.736988, 0.5656268, 1.960101, 0, 0, 0, 1, 1,
1.751936, -0.7866833, 0.6280616, 0, 0, 0, 1, 1,
1.761905, -0.162762, 0.8843069, 0, 0, 0, 1, 1,
1.773389, 0.3043465, 1.045089, 0, 0, 0, 1, 1,
1.777206, -0.3038014, 1.075485, 0, 0, 0, 1, 1,
1.786159, -0.7061197, 1.825391, 0, 0, 0, 1, 1,
1.803044, 0.1387464, 3.177297, 1, 1, 1, 1, 1,
1.809712, -0.8971677, 1.783754, 1, 1, 1, 1, 1,
1.809983, 0.1038107, 0.9211107, 1, 1, 1, 1, 1,
1.810997, -0.5436848, 2.386024, 1, 1, 1, 1, 1,
1.814205, 0.05708994, 0.9863729, 1, 1, 1, 1, 1,
1.814321, -0.2874385, 2.433835, 1, 1, 1, 1, 1,
1.814585, -0.01742149, 2.902593, 1, 1, 1, 1, 1,
1.816992, -0.5235499, 3.208482, 1, 1, 1, 1, 1,
1.819326, -0.6517128, 1.901299, 1, 1, 1, 1, 1,
1.839296, -0.1335835, 1.436181, 1, 1, 1, 1, 1,
1.881554, 0.5563811, 0.7705242, 1, 1, 1, 1, 1,
1.884495, -2.94732, 2.059695, 1, 1, 1, 1, 1,
1.907876, 1.668015, 1.130674, 1, 1, 1, 1, 1,
1.942228, -1.059619, 1.420027, 1, 1, 1, 1, 1,
1.966659, 1.054492, 0.6744447, 1, 1, 1, 1, 1,
2.000127, -0.3772409, -0.1206677, 0, 0, 1, 1, 1,
2.051875, -0.1287035, 1.742631, 1, 0, 0, 1, 1,
2.105911, -0.7613477, 1.538264, 1, 0, 0, 1, 1,
2.12994, -1.346494, 1.951437, 1, 0, 0, 1, 1,
2.138813, 1.171284, 2.110937, 1, 0, 0, 1, 1,
2.151191, -0.1204882, -0.3120027, 1, 0, 0, 1, 1,
2.16713, -2.025331, 2.933675, 0, 0, 0, 1, 1,
2.203069, -0.6920499, 3.502967, 0, 0, 0, 1, 1,
2.21046, 0.1635468, 1.184817, 0, 0, 0, 1, 1,
2.252751, -0.1029968, 0.6972886, 0, 0, 0, 1, 1,
2.289983, -0.2862785, 1.833404, 0, 0, 0, 1, 1,
2.324666, -0.1315132, 2.161673, 0, 0, 0, 1, 1,
2.377727, -1.180586, 3.529169, 0, 0, 0, 1, 1,
2.390404, 2.157285, 1.466404, 1, 1, 1, 1, 1,
2.680202, -0.3987212, 3.057397, 1, 1, 1, 1, 1,
2.765511, -0.06415921, 2.516912, 1, 1, 1, 1, 1,
2.82582, 1.592225, -0.4307868, 1, 1, 1, 1, 1,
3.013573, -0.5126207, 2.105328, 1, 1, 1, 1, 1,
3.302301, -0.57478, 0.861683, 1, 1, 1, 1, 1,
3.528209, -0.722969, 0.8269505, 1, 1, 1, 1, 1
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
var radius = 9.814579;
var distance = 34.47329;
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
mvMatrix.translate( -0.2472849, -0.3701786, 0.4393454 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47329);
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
