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
-3.180907, 0.6085057, -0.8556817, 1, 0, 0, 1,
-2.886358, 1.473941, -1.968038, 1, 0.007843138, 0, 1,
-2.600178, -1.538881, -2.204673, 1, 0.01176471, 0, 1,
-2.567172, 0.4486904, -2.422771, 1, 0.01960784, 0, 1,
-2.516191, 0.03796606, -1.068905, 1, 0.02352941, 0, 1,
-2.498276, -0.7161177, -2.453764, 1, 0.03137255, 0, 1,
-2.487081, -0.1851148, 0.6050167, 1, 0.03529412, 0, 1,
-2.389146, 0.7887281, -1.467984, 1, 0.04313726, 0, 1,
-2.384636, 0.2662617, -2.249723, 1, 0.04705882, 0, 1,
-2.357095, 1.590516, -1.805775, 1, 0.05490196, 0, 1,
-2.330646, -2.111797, -4.079176, 1, 0.05882353, 0, 1,
-2.323011, 1.259122, -2.1044, 1, 0.06666667, 0, 1,
-2.313711, 1.450385, -1.094186, 1, 0.07058824, 0, 1,
-2.299506, -0.9705834, -0.7504533, 1, 0.07843138, 0, 1,
-2.279836, 1.44852, -0.6179059, 1, 0.08235294, 0, 1,
-2.271484, 1.207892, -2.782749, 1, 0.09019608, 0, 1,
-2.235196, -1.585791, -2.171222, 1, 0.09411765, 0, 1,
-2.212807, -0.08844224, -0.7479471, 1, 0.1019608, 0, 1,
-2.199996, 0.3718978, -0.9777811, 1, 0.1098039, 0, 1,
-2.198467, -1.275699, -1.311551, 1, 0.1137255, 0, 1,
-2.179928, -0.6232513, -0.8384301, 1, 0.1215686, 0, 1,
-2.131501, -1.853391, -1.449433, 1, 0.1254902, 0, 1,
-2.118188, 1.977323, -2.040885, 1, 0.1333333, 0, 1,
-2.090145, -0.7350389, -2.118282, 1, 0.1372549, 0, 1,
-2.044703, 1.689864, -0.7889331, 1, 0.145098, 0, 1,
-2.037244, -0.6390909, -0.719201, 1, 0.1490196, 0, 1,
-2.002987, 0.7655314, -2.881571, 1, 0.1568628, 0, 1,
-2.001274, -1.734466, -0.6335731, 1, 0.1607843, 0, 1,
-1.992056, -1.288357, -1.529521, 1, 0.1686275, 0, 1,
-1.989283, -0.9911147, -2.731014, 1, 0.172549, 0, 1,
-1.972132, 0.1380442, -1.600886, 1, 0.1803922, 0, 1,
-1.956244, 0.5722999, -1.460688, 1, 0.1843137, 0, 1,
-1.942113, 0.2082777, -2.654754, 1, 0.1921569, 0, 1,
-1.938054, -1.684893, -2.316591, 1, 0.1960784, 0, 1,
-1.89125, 0.540082, -1.849778, 1, 0.2039216, 0, 1,
-1.891233, 0.6312371, -0.8645634, 1, 0.2117647, 0, 1,
-1.887963, 1.559954, -0.963828, 1, 0.2156863, 0, 1,
-1.850268, -0.177773, -1.471242, 1, 0.2235294, 0, 1,
-1.810545, -0.9791691, -3.556999, 1, 0.227451, 0, 1,
-1.787921, 0.2704909, -1.805637, 1, 0.2352941, 0, 1,
-1.787273, -0.1906652, -1.882249, 1, 0.2392157, 0, 1,
-1.786864, 0.07044635, -1.106222, 1, 0.2470588, 0, 1,
-1.76304, -0.1505109, -1.559437, 1, 0.2509804, 0, 1,
-1.754575, -2.653414, -3.257497, 1, 0.2588235, 0, 1,
-1.753709, 0.3921091, -1.034913, 1, 0.2627451, 0, 1,
-1.734119, -0.8272291, -1.843346, 1, 0.2705882, 0, 1,
-1.733542, -0.8047963, -2.52322, 1, 0.2745098, 0, 1,
-1.730724, -1.465803, -1.462854, 1, 0.282353, 0, 1,
-1.718353, -0.5392125, -0.9127892, 1, 0.2862745, 0, 1,
-1.714392, -1.708817, -1.897477, 1, 0.2941177, 0, 1,
-1.694057, 0.1408936, -2.339438, 1, 0.3019608, 0, 1,
-1.688797, 0.93928, -0.5353999, 1, 0.3058824, 0, 1,
-1.685074, 2.035818, -2.205659, 1, 0.3137255, 0, 1,
-1.679474, 2.239019, -0.7412392, 1, 0.3176471, 0, 1,
-1.662089, 0.8072259, -1.5675, 1, 0.3254902, 0, 1,
-1.660879, -0.9967952, -0.7161857, 1, 0.3294118, 0, 1,
-1.658159, -0.0568683, -3.68673, 1, 0.3372549, 0, 1,
-1.647161, 0.4900899, -0.3580114, 1, 0.3411765, 0, 1,
-1.646806, 1.197448, -0.4093974, 1, 0.3490196, 0, 1,
-1.644154, -0.194308, -0.9108321, 1, 0.3529412, 0, 1,
-1.640427, -0.7677652, -2.425196, 1, 0.3607843, 0, 1,
-1.63788, 1.382427, -2.161188, 1, 0.3647059, 0, 1,
-1.635912, 0.5927098, -1.433017, 1, 0.372549, 0, 1,
-1.632748, 0.2430337, -0.6756108, 1, 0.3764706, 0, 1,
-1.627261, 0.9955962, -0.9097422, 1, 0.3843137, 0, 1,
-1.62461, -0.4652089, -1.927299, 1, 0.3882353, 0, 1,
-1.61905, 0.1528912, -2.225238, 1, 0.3960784, 0, 1,
-1.614867, -0.5287578, -2.721955, 1, 0.4039216, 0, 1,
-1.601392, -1.069575, -1.481418, 1, 0.4078431, 0, 1,
-1.592237, 0.1644033, -1.684932, 1, 0.4156863, 0, 1,
-1.590688, 0.6489202, -1.675001, 1, 0.4196078, 0, 1,
-1.577624, 0.240329, -2.715917, 1, 0.427451, 0, 1,
-1.562351, 0.1771953, -2.770674, 1, 0.4313726, 0, 1,
-1.559087, -1.1454, -2.108359, 1, 0.4392157, 0, 1,
-1.550387, -0.07768063, -2.985637, 1, 0.4431373, 0, 1,
-1.547169, 0.4319557, -1.523513, 1, 0.4509804, 0, 1,
-1.542787, 0.6503262, 0.3142962, 1, 0.454902, 0, 1,
-1.542704, 0.06463664, -1.691722, 1, 0.4627451, 0, 1,
-1.541477, 0.7031146, -2.66887, 1, 0.4666667, 0, 1,
-1.519803, -0.2845552, -1.946396, 1, 0.4745098, 0, 1,
-1.511396, 0.02069972, -2.833426, 1, 0.4784314, 0, 1,
-1.504168, 1.149435, 1.193673, 1, 0.4862745, 0, 1,
-1.503228, -0.00627407, 1.37549, 1, 0.4901961, 0, 1,
-1.487288, -0.4225121, -0.5504054, 1, 0.4980392, 0, 1,
-1.486801, -0.32539, -3.007069, 1, 0.5058824, 0, 1,
-1.485464, -0.2371014, -0.6088494, 1, 0.509804, 0, 1,
-1.475752, -0.3883471, -2.379977, 1, 0.5176471, 0, 1,
-1.467816, 0.01805101, -1.94768, 1, 0.5215687, 0, 1,
-1.462098, -0.3476155, -1.915056, 1, 0.5294118, 0, 1,
-1.460222, 0.2472916, -0.5385396, 1, 0.5333334, 0, 1,
-1.436536, 0.3003283, -0.3476866, 1, 0.5411765, 0, 1,
-1.429183, -0.8211459, -2.451713, 1, 0.5450981, 0, 1,
-1.42351, 1.393811, 0.1660104, 1, 0.5529412, 0, 1,
-1.419861, 0.4883288, -1.621095, 1, 0.5568628, 0, 1,
-1.410891, 0.5638147, -1.11051, 1, 0.5647059, 0, 1,
-1.405697, -0.9320521, -1.586504, 1, 0.5686275, 0, 1,
-1.398449, 1.09724, 1.339292, 1, 0.5764706, 0, 1,
-1.397029, -0.9252226, -2.322164, 1, 0.5803922, 0, 1,
-1.388961, 0.5254688, -2.492806, 1, 0.5882353, 0, 1,
-1.386803, 0.3709542, -2.240018, 1, 0.5921569, 0, 1,
-1.368292, 1.218125, -1.569258, 1, 0.6, 0, 1,
-1.349042, 0.0285559, 0.9091231, 1, 0.6078432, 0, 1,
-1.347405, -1.835075, -0.584637, 1, 0.6117647, 0, 1,
-1.343802, -1.027499, -3.415758, 1, 0.6196079, 0, 1,
-1.339321, 0.3270425, -0.1414239, 1, 0.6235294, 0, 1,
-1.32935, -0.11935, -2.41572, 1, 0.6313726, 0, 1,
-1.326337, 0.8191564, -1.60892, 1, 0.6352941, 0, 1,
-1.325507, 1.110242, -0.07234529, 1, 0.6431373, 0, 1,
-1.316168, -1.493418, -2.388155, 1, 0.6470588, 0, 1,
-1.314549, 0.4783061, -1.283543, 1, 0.654902, 0, 1,
-1.312117, -0.400472, -1.953994, 1, 0.6588235, 0, 1,
-1.305372, 1.243801, -1.528729, 1, 0.6666667, 0, 1,
-1.302792, -0.8211507, -2.089565, 1, 0.6705883, 0, 1,
-1.300936, -0.7872772, -3.365299, 1, 0.6784314, 0, 1,
-1.277823, -0.4627057, -3.468669, 1, 0.682353, 0, 1,
-1.25168, 0.6792014, -2.992623, 1, 0.6901961, 0, 1,
-1.250128, 0.3362969, -0.1838861, 1, 0.6941177, 0, 1,
-1.24904, -0.4387407, -0.6894453, 1, 0.7019608, 0, 1,
-1.248022, -0.02314106, -1.738472, 1, 0.7098039, 0, 1,
-1.245375, -1.105652, -1.582002, 1, 0.7137255, 0, 1,
-1.243433, -0.5560204, -1.746095, 1, 0.7215686, 0, 1,
-1.242182, -0.4944499, -0.599782, 1, 0.7254902, 0, 1,
-1.241247, -1.048118, -1.157469, 1, 0.7333333, 0, 1,
-1.232709, -0.6732574, -2.869695, 1, 0.7372549, 0, 1,
-1.220965, 1.148933, -0.9744095, 1, 0.7450981, 0, 1,
-1.214819, 0.3650823, -1.362038, 1, 0.7490196, 0, 1,
-1.213972, 1.427223, -1.104941, 1, 0.7568628, 0, 1,
-1.210383, -1.914724, -3.25621, 1, 0.7607843, 0, 1,
-1.193349, 0.7218239, -3.168813, 1, 0.7686275, 0, 1,
-1.188248, 2.224186, 0.922244, 1, 0.772549, 0, 1,
-1.1821, 0.09065001, -0.127834, 1, 0.7803922, 0, 1,
-1.181319, 1.983331, -0.03960795, 1, 0.7843137, 0, 1,
-1.176497, -1.347479, -2.442029, 1, 0.7921569, 0, 1,
-1.172109, -0.8314503, -2.415981, 1, 0.7960784, 0, 1,
-1.171009, 0.4722516, -1.14473, 1, 0.8039216, 0, 1,
-1.168117, 0.1594575, -0.7352359, 1, 0.8117647, 0, 1,
-1.166944, -1.140788, -3.992117, 1, 0.8156863, 0, 1,
-1.165897, -0.6812837, -0.7751467, 1, 0.8235294, 0, 1,
-1.159779, -2.289749, -2.337724, 1, 0.827451, 0, 1,
-1.159589, -0.9360623, -1.789919, 1, 0.8352941, 0, 1,
-1.158202, -0.03496482, -1.452758, 1, 0.8392157, 0, 1,
-1.149533, -0.8549128, -1.132386, 1, 0.8470588, 0, 1,
-1.149289, 2.79186, -0.1353241, 1, 0.8509804, 0, 1,
-1.144906, -1.451198, -1.288224, 1, 0.8588235, 0, 1,
-1.144617, -2.119928, -3.339475, 1, 0.8627451, 0, 1,
-1.139275, 0.9342056, -0.9165151, 1, 0.8705882, 0, 1,
-1.136275, -0.008173799, -1.358009, 1, 0.8745098, 0, 1,
-1.129475, 0.9806603, 0.3019191, 1, 0.8823529, 0, 1,
-1.126909, -1.908419, -3.061953, 1, 0.8862745, 0, 1,
-1.11822, -0.2832332, -1.787007, 1, 0.8941177, 0, 1,
-1.102004, -0.5315257, -2.364108, 1, 0.8980392, 0, 1,
-1.101816, 1.075433, 0.7615103, 1, 0.9058824, 0, 1,
-1.099676, -1.578591, -3.735279, 1, 0.9137255, 0, 1,
-1.09921, -1.325665, -3.334302, 1, 0.9176471, 0, 1,
-1.097182, -2.102793, -4.55831, 1, 0.9254902, 0, 1,
-1.092865, 0.0601511, -1.918398, 1, 0.9294118, 0, 1,
-1.086834, -2.785622, -2.564073, 1, 0.9372549, 0, 1,
-1.077671, -0.8219368, -2.97966, 1, 0.9411765, 0, 1,
-1.069865, 1.003868, -2.154227, 1, 0.9490196, 0, 1,
-1.065328, 0.2625185, -0.8627576, 1, 0.9529412, 0, 1,
-1.064183, 0.05095997, -1.268154, 1, 0.9607843, 0, 1,
-1.06022, 0.008166851, -0.8304117, 1, 0.9647059, 0, 1,
-1.057332, -0.2931496, -1.914848, 1, 0.972549, 0, 1,
-1.041208, -0.4509532, -3.587934, 1, 0.9764706, 0, 1,
-1.040401, -1.531456, -4.242501, 1, 0.9843137, 0, 1,
-1.038526, -0.8345364, -2.913071, 1, 0.9882353, 0, 1,
-1.030533, -0.6908088, -3.052765, 1, 0.9960784, 0, 1,
-1.023487, -2.183302, -2.604213, 0.9960784, 1, 0, 1,
-1.0231, 1.370574, -1.227882, 0.9921569, 1, 0, 1,
-1.023077, -1.769178, -1.65735, 0.9843137, 1, 0, 1,
-1.018634, -1.59866, -3.996451, 0.9803922, 1, 0, 1,
-1.007952, -1.109046, -3.30678, 0.972549, 1, 0, 1,
-1.005143, 0.3173206, -0.3876338, 0.9686275, 1, 0, 1,
-0.9946184, 0.005351134, -2.595987, 0.9607843, 1, 0, 1,
-0.9944361, 0.2677912, -1.789083, 0.9568627, 1, 0, 1,
-0.9917517, 0.3135603, -0.6028512, 0.9490196, 1, 0, 1,
-0.9911295, 0.3408158, -1.884431, 0.945098, 1, 0, 1,
-0.9886573, 0.8605039, -0.6611112, 0.9372549, 1, 0, 1,
-0.986427, 0.812315, -2.156502, 0.9333333, 1, 0, 1,
-0.985562, 0.0397275, 0.3372062, 0.9254902, 1, 0, 1,
-0.9851816, 0.05639582, -1.463399, 0.9215686, 1, 0, 1,
-0.9799394, 0.06941949, -2.02642, 0.9137255, 1, 0, 1,
-0.9753742, -1.011694, -3.613079, 0.9098039, 1, 0, 1,
-0.974, -0.1073741, -1.235491, 0.9019608, 1, 0, 1,
-0.9716694, 0.4479969, 0.1249971, 0.8941177, 1, 0, 1,
-0.964103, -0.1979145, -3.189223, 0.8901961, 1, 0, 1,
-0.9592192, -0.75717, -2.37608, 0.8823529, 1, 0, 1,
-0.9555242, -2.186348, -2.383574, 0.8784314, 1, 0, 1,
-0.9369555, -2.225567, -2.395143, 0.8705882, 1, 0, 1,
-0.9309597, -0.1902477, -2.649094, 0.8666667, 1, 0, 1,
-0.928424, 1.641263, -0.6133069, 0.8588235, 1, 0, 1,
-0.9238386, -1.39539, -2.877633, 0.854902, 1, 0, 1,
-0.9217543, 1.328778, -0.382198, 0.8470588, 1, 0, 1,
-0.9119928, 1.158712, -0.6518617, 0.8431373, 1, 0, 1,
-0.9070023, 1.553952, -0.490502, 0.8352941, 1, 0, 1,
-0.905389, -0.5308523, -3.149479, 0.8313726, 1, 0, 1,
-0.9028906, 1.169524, 1.133597, 0.8235294, 1, 0, 1,
-0.9027138, 0.0374292, -2.022161, 0.8196079, 1, 0, 1,
-0.8978004, 0.4845246, -0.6801916, 0.8117647, 1, 0, 1,
-0.8959262, -0.2224786, -1.586759, 0.8078431, 1, 0, 1,
-0.8921386, -0.2621737, -1.755195, 0.8, 1, 0, 1,
-0.8912781, 0.9432797, -0.6367433, 0.7921569, 1, 0, 1,
-0.8896086, 0.08093241, -1.457282, 0.7882353, 1, 0, 1,
-0.8893861, -1.443394, -0.1236958, 0.7803922, 1, 0, 1,
-0.8848209, 0.5500925, -2.189287, 0.7764706, 1, 0, 1,
-0.8846354, 0.4541723, -2.058726, 0.7686275, 1, 0, 1,
-0.879521, -1.014358, -2.693784, 0.7647059, 1, 0, 1,
-0.8734882, 1.106197, -1.671753, 0.7568628, 1, 0, 1,
-0.8715081, 1.211367, 0.4721122, 0.7529412, 1, 0, 1,
-0.8649019, -0.7203043, -2.822601, 0.7450981, 1, 0, 1,
-0.8623768, -0.3010611, -1.954601, 0.7411765, 1, 0, 1,
-0.8559285, -0.1507162, -1.524293, 0.7333333, 1, 0, 1,
-0.8551334, 2.36289, -1.841641, 0.7294118, 1, 0, 1,
-0.8460429, -0.9200202, -3.204577, 0.7215686, 1, 0, 1,
-0.8451717, -0.103041, -3.702022, 0.7176471, 1, 0, 1,
-0.8398544, 0.3120133, -1.540189, 0.7098039, 1, 0, 1,
-0.8381561, -0.02952214, -2.535764, 0.7058824, 1, 0, 1,
-0.8354447, 1.262853, -0.4584289, 0.6980392, 1, 0, 1,
-0.8332449, 1.324975, 1.532788, 0.6901961, 1, 0, 1,
-0.832982, -0.696263, -1.967947, 0.6862745, 1, 0, 1,
-0.8298506, -0.1113265, -0.3614341, 0.6784314, 1, 0, 1,
-0.827102, 0.3468768, -1.079047, 0.6745098, 1, 0, 1,
-0.8234066, -0.9239892, -0.517055, 0.6666667, 1, 0, 1,
-0.8217835, 0.4412883, -1.545462, 0.6627451, 1, 0, 1,
-0.8179581, -0.1390154, -0.5992923, 0.654902, 1, 0, 1,
-0.8154482, 0.287295, -0.3940392, 0.6509804, 1, 0, 1,
-0.8044899, 1.050155, -1.810595, 0.6431373, 1, 0, 1,
-0.8012177, 0.06965815, -0.6632969, 0.6392157, 1, 0, 1,
-0.8009942, -0.7769864, -2.271321, 0.6313726, 1, 0, 1,
-0.7996046, 2.008192, 0.4906834, 0.627451, 1, 0, 1,
-0.7952418, 1.391484, 0.4050448, 0.6196079, 1, 0, 1,
-0.7928316, 1.866274, -2.10213, 0.6156863, 1, 0, 1,
-0.7917297, 1.288965, -1.968223, 0.6078432, 1, 0, 1,
-0.7897482, -0.08052453, -2.829041, 0.6039216, 1, 0, 1,
-0.7866513, 1.377465, -0.3740457, 0.5960785, 1, 0, 1,
-0.7819529, 2.849218, 0.0686333, 0.5882353, 1, 0, 1,
-0.774792, -0.169582, -3.172921, 0.5843138, 1, 0, 1,
-0.7686937, 0.2327519, -2.074116, 0.5764706, 1, 0, 1,
-0.7676092, 0.4755609, -1.920119, 0.572549, 1, 0, 1,
-0.7666416, -2.953018, -4.124648, 0.5647059, 1, 0, 1,
-0.7660831, 1.400336, 0.05781344, 0.5607843, 1, 0, 1,
-0.7624989, 0.8053965, -0.9950177, 0.5529412, 1, 0, 1,
-0.7547494, 2.141716, 0.411259, 0.5490196, 1, 0, 1,
-0.751078, -0.0272633, -0.4471371, 0.5411765, 1, 0, 1,
-0.747201, -0.7963957, -2.141061, 0.5372549, 1, 0, 1,
-0.7462949, 0.8785402, -0.6677222, 0.5294118, 1, 0, 1,
-0.7459243, -1.118447, -2.212598, 0.5254902, 1, 0, 1,
-0.7402325, 1.447533, -1.454729, 0.5176471, 1, 0, 1,
-0.7359638, 0.2179621, -0.6748951, 0.5137255, 1, 0, 1,
-0.7252756, -0.9797272, -1.92747, 0.5058824, 1, 0, 1,
-0.7240377, 0.9447373, 0.2246213, 0.5019608, 1, 0, 1,
-0.7228494, 0.7441642, -0.6564021, 0.4941176, 1, 0, 1,
-0.7181008, -0.4405385, -2.409999, 0.4862745, 1, 0, 1,
-0.7145016, -0.9232696, -2.336452, 0.4823529, 1, 0, 1,
-0.7117997, 0.2298586, -2.93921, 0.4745098, 1, 0, 1,
-0.7038993, 0.06462117, -0.7699444, 0.4705882, 1, 0, 1,
-0.7007176, 2.391787, -0.8792175, 0.4627451, 1, 0, 1,
-0.7006012, 0.2725141, 0.290977, 0.4588235, 1, 0, 1,
-0.6982199, -1.724595, -3.476623, 0.4509804, 1, 0, 1,
-0.6981102, 0.03417812, -0.7203415, 0.4470588, 1, 0, 1,
-0.6956261, -1.245319, -1.921966, 0.4392157, 1, 0, 1,
-0.6936247, -1.203059, -2.414464, 0.4352941, 1, 0, 1,
-0.6934405, 1.626762, 0.3227005, 0.427451, 1, 0, 1,
-0.6913106, -0.9275131, -5.039742, 0.4235294, 1, 0, 1,
-0.684772, -0.6674339, -2.342893, 0.4156863, 1, 0, 1,
-0.6841403, -1.110477, -2.321572, 0.4117647, 1, 0, 1,
-0.6802822, 1.665877, -0.2982548, 0.4039216, 1, 0, 1,
-0.6738732, -0.2716052, -0.7355196, 0.3960784, 1, 0, 1,
-0.6736496, -0.2552769, -2.451405, 0.3921569, 1, 0, 1,
-0.6688008, 0.5557231, -0.2340013, 0.3843137, 1, 0, 1,
-0.6597782, 0.5074406, -1.303334, 0.3803922, 1, 0, 1,
-0.6585231, 0.2030954, -1.027897, 0.372549, 1, 0, 1,
-0.6579919, 0.5136563, 0.5444891, 0.3686275, 1, 0, 1,
-0.6493452, 1.011599, -2.264473, 0.3607843, 1, 0, 1,
-0.6444875, 0.3027372, -0.546914, 0.3568628, 1, 0, 1,
-0.6427156, -1.305664, -2.819942, 0.3490196, 1, 0, 1,
-0.6407461, 0.1286775, -1.406, 0.345098, 1, 0, 1,
-0.6407305, 0.8227904, -0.9192451, 0.3372549, 1, 0, 1,
-0.6405663, -0.717636, -4.05631, 0.3333333, 1, 0, 1,
-0.6360673, -1.304284, -4.239103, 0.3254902, 1, 0, 1,
-0.6284735, 0.5161485, -1.090592, 0.3215686, 1, 0, 1,
-0.6186696, -1.844101, -3.920883, 0.3137255, 1, 0, 1,
-0.6011168, -0.2047098, -0.8023505, 0.3098039, 1, 0, 1,
-0.6005136, -0.08491229, -1.361377, 0.3019608, 1, 0, 1,
-0.6003722, 0.9252298, -2.069735, 0.2941177, 1, 0, 1,
-0.5999756, 0.3655924, 0.7711036, 0.2901961, 1, 0, 1,
-0.5989621, -0.5725103, -3.869192, 0.282353, 1, 0, 1,
-0.5979729, -1.629997, -2.300895, 0.2784314, 1, 0, 1,
-0.5916538, 1.408211, 0.1794458, 0.2705882, 1, 0, 1,
-0.5894113, 0.2353944, -1.149887, 0.2666667, 1, 0, 1,
-0.5875248, 1.726272, 0.1713054, 0.2588235, 1, 0, 1,
-0.5843995, 0.197659, -0.5229901, 0.254902, 1, 0, 1,
-0.583952, 0.1015894, -1.352794, 0.2470588, 1, 0, 1,
-0.5828392, 0.4460271, -1.881898, 0.2431373, 1, 0, 1,
-0.5749729, -1.953682, -3.459797, 0.2352941, 1, 0, 1,
-0.5748635, -2.010278, -2.037488, 0.2313726, 1, 0, 1,
-0.5747676, -2.473959, -3.143428, 0.2235294, 1, 0, 1,
-0.5697602, -0.5147735, -2.455812, 0.2196078, 1, 0, 1,
-0.558822, -0.272368, -2.331564, 0.2117647, 1, 0, 1,
-0.5572936, -0.8699923, -3.486305, 0.2078431, 1, 0, 1,
-0.5550832, -0.5932074, -1.619402, 0.2, 1, 0, 1,
-0.5433047, 2.48362, -2.023497, 0.1921569, 1, 0, 1,
-0.5398079, 0.3109072, -1.399647, 0.1882353, 1, 0, 1,
-0.5382312, -2.545338, -2.19314, 0.1803922, 1, 0, 1,
-0.5365846, 2.030329, -1.210493, 0.1764706, 1, 0, 1,
-0.5350788, 1.453711, 0.3839782, 0.1686275, 1, 0, 1,
-0.53205, -0.5308313, -3.664054, 0.1647059, 1, 0, 1,
-0.5316249, -1.019604, -2.179533, 0.1568628, 1, 0, 1,
-0.530749, -0.8272396, -3.012126, 0.1529412, 1, 0, 1,
-0.5274125, -0.1836987, -3.611071, 0.145098, 1, 0, 1,
-0.5217761, 0.3351732, -1.026751, 0.1411765, 1, 0, 1,
-0.5172772, 1.888528, -1.181238, 0.1333333, 1, 0, 1,
-0.5171005, -0.6741387, -3.318526, 0.1294118, 1, 0, 1,
-0.5123209, -0.8961702, -1.70102, 0.1215686, 1, 0, 1,
-0.5092394, 0.1932734, -1.410342, 0.1176471, 1, 0, 1,
-0.5077528, -0.02698499, -1.764696, 0.1098039, 1, 0, 1,
-0.5071967, 0.936031, -0.961968, 0.1058824, 1, 0, 1,
-0.5039773, -0.5932691, -2.666758, 0.09803922, 1, 0, 1,
-0.4990411, -1.226176, -1.229934, 0.09019608, 1, 0, 1,
-0.4979253, 0.01478644, -2.410982, 0.08627451, 1, 0, 1,
-0.4945879, 0.3542038, -1.084026, 0.07843138, 1, 0, 1,
-0.4816291, -1.189331, -2.002081, 0.07450981, 1, 0, 1,
-0.4816141, 0.355698, -0.775568, 0.06666667, 1, 0, 1,
-0.4782329, -1.204814, -2.136992, 0.0627451, 1, 0, 1,
-0.476594, -0.0683175, -0.5471467, 0.05490196, 1, 0, 1,
-0.4761515, -0.4049835, -2.106962, 0.05098039, 1, 0, 1,
-0.4737244, -1.490415, -4.828798, 0.04313726, 1, 0, 1,
-0.4654083, 0.4270107, -0.7014699, 0.03921569, 1, 0, 1,
-0.461098, -0.0582053, -2.758442, 0.03137255, 1, 0, 1,
-0.4547703, -0.90316, -3.550498, 0.02745098, 1, 0, 1,
-0.4513192, 1.279902, -1.486054, 0.01960784, 1, 0, 1,
-0.4504436, 1.117852, 1.242796, 0.01568628, 1, 0, 1,
-0.4496121, 0.19507, 1.884998, 0.007843138, 1, 0, 1,
-0.4490405, 0.313371, -0.2292317, 0.003921569, 1, 0, 1,
-0.4473509, 1.014637, 0.1090692, 0, 1, 0.003921569, 1,
-0.44727, -0.9090561, -3.438143, 0, 1, 0.01176471, 1,
-0.4462937, 0.459231, -0.8156137, 0, 1, 0.01568628, 1,
-0.4420381, -0.9174439, -2.351174, 0, 1, 0.02352941, 1,
-0.436201, -0.7739615, -3.668707, 0, 1, 0.02745098, 1,
-0.4345371, -2.276676, -4.262279, 0, 1, 0.03529412, 1,
-0.4343019, 1.176313, 0.6230657, 0, 1, 0.03921569, 1,
-0.4306956, 0.100095, -2.09924, 0, 1, 0.04705882, 1,
-0.4289995, -0.5141067, -1.637166, 0, 1, 0.05098039, 1,
-0.4261732, -0.6885027, -3.808959, 0, 1, 0.05882353, 1,
-0.4242858, -0.2320897, -2.526838, 0, 1, 0.0627451, 1,
-0.4210322, -0.4252174, -1.818964, 0, 1, 0.07058824, 1,
-0.4189186, 1.236007, -1.82919, 0, 1, 0.07450981, 1,
-0.417458, -0.249604, -1.627098, 0, 1, 0.08235294, 1,
-0.4154999, -0.02091406, -2.305793, 0, 1, 0.08627451, 1,
-0.4147724, 0.2238642, -0.855497, 0, 1, 0.09411765, 1,
-0.4123135, 1.192263, 0.6245133, 0, 1, 0.1019608, 1,
-0.406497, -2.286863, -3.169359, 0, 1, 0.1058824, 1,
-0.4060994, 0.05043079, -2.131881, 0, 1, 0.1137255, 1,
-0.4037328, -1.348346, -1.732737, 0, 1, 0.1176471, 1,
-0.3954504, -1.765737, -1.785072, 0, 1, 0.1254902, 1,
-0.3930385, 1.444641, 1.46261, 0, 1, 0.1294118, 1,
-0.3915865, -0.7423337, -4.012048, 0, 1, 0.1372549, 1,
-0.3889011, 2.6452, 0.2861877, 0, 1, 0.1411765, 1,
-0.3887968, 2.131528, 1.001183, 0, 1, 0.1490196, 1,
-0.3880325, 0.5874019, -0.9738013, 0, 1, 0.1529412, 1,
-0.3817307, -2.285995, -3.209214, 0, 1, 0.1607843, 1,
-0.3738307, -0.1386696, -2.859265, 0, 1, 0.1647059, 1,
-0.369963, 0.3655902, 0.3135321, 0, 1, 0.172549, 1,
-0.3687541, -0.06717821, -1.455777, 0, 1, 0.1764706, 1,
-0.3686553, 0.4194385, 0.0786733, 0, 1, 0.1843137, 1,
-0.3684814, 0.1419481, -1.780274, 0, 1, 0.1882353, 1,
-0.3673242, 0.1267804, -0.9048904, 0, 1, 0.1960784, 1,
-0.3640729, -0.4933867, -1.360295, 0, 1, 0.2039216, 1,
-0.3633199, -1.02881, -2.780294, 0, 1, 0.2078431, 1,
-0.3606491, -0.3353962, -2.80006, 0, 1, 0.2156863, 1,
-0.3593549, 0.2787101, 0.8370444, 0, 1, 0.2196078, 1,
-0.3515214, 1.840531, -0.1384525, 0, 1, 0.227451, 1,
-0.3466753, 0.6617295, -2.96898, 0, 1, 0.2313726, 1,
-0.3464648, 1.070018, 0.05659682, 0, 1, 0.2392157, 1,
-0.3420565, 0.6055647, -1.167624, 0, 1, 0.2431373, 1,
-0.3392171, -2.705974, -3.719509, 0, 1, 0.2509804, 1,
-0.3376938, -0.6495038, -2.434708, 0, 1, 0.254902, 1,
-0.3339148, -0.8268818, -1.357342, 0, 1, 0.2627451, 1,
-0.3335533, -0.4070532, -2.649902, 0, 1, 0.2666667, 1,
-0.3330019, -2.155692, -3.233306, 0, 1, 0.2745098, 1,
-0.3322893, -0.04665164, -1.325522, 0, 1, 0.2784314, 1,
-0.329453, -0.9888697, -3.203486, 0, 1, 0.2862745, 1,
-0.3279257, -0.2132693, -2.513625, 0, 1, 0.2901961, 1,
-0.326071, -0.810909, -4.13272, 0, 1, 0.2980392, 1,
-0.3245663, -0.4822866, -2.066007, 0, 1, 0.3058824, 1,
-0.3243507, -0.1250223, -1.655272, 0, 1, 0.3098039, 1,
-0.3236854, -0.1030981, -2.098908, 0, 1, 0.3176471, 1,
-0.3210431, -0.9023725, -3.899077, 0, 1, 0.3215686, 1,
-0.3156939, 1.515639, -1.730693, 0, 1, 0.3294118, 1,
-0.309135, -1.179207, -2.086194, 0, 1, 0.3333333, 1,
-0.3086147, -0.9940595, -1.118858, 0, 1, 0.3411765, 1,
-0.3065816, -0.1414953, -1.662114, 0, 1, 0.345098, 1,
-0.3053527, 1.222437, -0.5464159, 0, 1, 0.3529412, 1,
-0.3023335, 0.08233963, -1.830518, 0, 1, 0.3568628, 1,
-0.3017864, -0.1767565, -3.336562, 0, 1, 0.3647059, 1,
-0.2971191, -0.5363338, -2.160676, 0, 1, 0.3686275, 1,
-0.2940539, -0.7423072, -2.349712, 0, 1, 0.3764706, 1,
-0.2882178, 1.25664, -0.648931, 0, 1, 0.3803922, 1,
-0.2844477, 0.7135621, -0.2820021, 0, 1, 0.3882353, 1,
-0.2806107, 0.624632, -1.608543, 0, 1, 0.3921569, 1,
-0.2787814, 0.5415875, -0.808258, 0, 1, 0.4, 1,
-0.2783735, 1.569771, 0.1126841, 0, 1, 0.4078431, 1,
-0.2779768, 1.030238, 0.00541972, 0, 1, 0.4117647, 1,
-0.2747005, 1.228832, -0.3256116, 0, 1, 0.4196078, 1,
-0.2700914, 0.3583497, 0.9621234, 0, 1, 0.4235294, 1,
-0.2629028, -2.144124, -4.352712, 0, 1, 0.4313726, 1,
-0.258616, -1.080808, -2.295227, 0, 1, 0.4352941, 1,
-0.2583113, -2.102702, -2.419094, 0, 1, 0.4431373, 1,
-0.2404924, 0.9001332, -0.1896387, 0, 1, 0.4470588, 1,
-0.235942, -2.323398, -3.932315, 0, 1, 0.454902, 1,
-0.2354106, 0.3028582, -0.529236, 0, 1, 0.4588235, 1,
-0.2313214, -0.2018513, -4.580957, 0, 1, 0.4666667, 1,
-0.2225716, -0.4794086, -2.212743, 0, 1, 0.4705882, 1,
-0.2175007, -1.290469, -2.251214, 0, 1, 0.4784314, 1,
-0.209959, -0.04229207, -3.46752, 0, 1, 0.4823529, 1,
-0.209663, -1.228264, -1.690584, 0, 1, 0.4901961, 1,
-0.205348, 0.4214021, -0.5044191, 0, 1, 0.4941176, 1,
-0.2045112, -0.2904715, -2.119314, 0, 1, 0.5019608, 1,
-0.199339, 0.0264821, -1.4091, 0, 1, 0.509804, 1,
-0.196825, 1.806297, -0.1968044, 0, 1, 0.5137255, 1,
-0.195787, -2.238116, -2.091066, 0, 1, 0.5215687, 1,
-0.1935061, 0.922665, -0.1343099, 0, 1, 0.5254902, 1,
-0.1865245, -0.560941, -1.878113, 0, 1, 0.5333334, 1,
-0.1839823, -1.904013, -3.770477, 0, 1, 0.5372549, 1,
-0.1768039, -0.7460447, -2.78577, 0, 1, 0.5450981, 1,
-0.17309, -0.8287771, -2.000235, 0, 1, 0.5490196, 1,
-0.1730135, -0.9629543, -3.617258, 0, 1, 0.5568628, 1,
-0.171086, -1.149777, -0.9899756, 0, 1, 0.5607843, 1,
-0.170896, 0.2388784, -1.074212, 0, 1, 0.5686275, 1,
-0.1701252, -1.374806, -1.79096, 0, 1, 0.572549, 1,
-0.1661399, -2.396979, -3.254966, 0, 1, 0.5803922, 1,
-0.165994, -0.2177523, 0.8661317, 0, 1, 0.5843138, 1,
-0.1653344, -0.6142474, -3.005959, 0, 1, 0.5921569, 1,
-0.1631254, 0.5974084, -0.7139962, 0, 1, 0.5960785, 1,
-0.1628444, -0.3847046, -3.605728, 0, 1, 0.6039216, 1,
-0.1614952, 1.404331, -0.3464917, 0, 1, 0.6117647, 1,
-0.1608711, 0.4910092, -2.396137, 0, 1, 0.6156863, 1,
-0.1607534, 0.6787112, 0.3341834, 0, 1, 0.6235294, 1,
-0.1605104, 0.4403742, -0.3618585, 0, 1, 0.627451, 1,
-0.1521447, -0.8044333, -3.319147, 0, 1, 0.6352941, 1,
-0.147225, -0.5044991, -2.664801, 0, 1, 0.6392157, 1,
-0.1468839, 0.08290744, -1.699592, 0, 1, 0.6470588, 1,
-0.1462393, 0.2054018, -3.817648, 0, 1, 0.6509804, 1,
-0.1410565, -0.5140729, -3.472824, 0, 1, 0.6588235, 1,
-0.1407584, 0.9306259, -1.621831, 0, 1, 0.6627451, 1,
-0.135371, -0.06071486, -2.458103, 0, 1, 0.6705883, 1,
-0.1325231, 2.226316, 0.1912399, 0, 1, 0.6745098, 1,
-0.1297217, 0.7667745, 0.7869834, 0, 1, 0.682353, 1,
-0.1267036, -1.760593, -1.566289, 0, 1, 0.6862745, 1,
-0.1249795, -0.2480769, -2.577712, 0, 1, 0.6941177, 1,
-0.1223112, 0.2825337, -1.857786, 0, 1, 0.7019608, 1,
-0.1222807, 0.9226436, 0.3529258, 0, 1, 0.7058824, 1,
-0.1219976, -1.079572, -4.709249, 0, 1, 0.7137255, 1,
-0.1213178, 0.5063524, -0.8414463, 0, 1, 0.7176471, 1,
-0.1211812, 2.504405, 0.5335667, 0, 1, 0.7254902, 1,
-0.1196662, 0.05580881, -2.008557, 0, 1, 0.7294118, 1,
-0.1190285, 0.2608382, 0.2013294, 0, 1, 0.7372549, 1,
-0.1186689, -1.108591, -2.261778, 0, 1, 0.7411765, 1,
-0.1139942, 1.297169, 0.7775325, 0, 1, 0.7490196, 1,
-0.1134437, 0.4488185, -0.004447058, 0, 1, 0.7529412, 1,
-0.1128411, 0.53405, -0.2666545, 0, 1, 0.7607843, 1,
-0.1096814, 1.409695, -0.9302188, 0, 1, 0.7647059, 1,
-0.1085411, -0.6929391, -4.095584, 0, 1, 0.772549, 1,
-0.1076348, 0.325705, 0.4611245, 0, 1, 0.7764706, 1,
-0.1046612, -1.239318, -3.490014, 0, 1, 0.7843137, 1,
-0.1042071, 1.94785, -1.205398, 0, 1, 0.7882353, 1,
-0.1038982, -0.3544159, -2.491246, 0, 1, 0.7960784, 1,
-0.1030738, -1.620316, -3.778886, 0, 1, 0.8039216, 1,
-0.1018076, 0.3511983, -0.09182021, 0, 1, 0.8078431, 1,
-0.09694973, 0.01901063, -2.613423, 0, 1, 0.8156863, 1,
-0.09631325, 0.9137461, -0.4979317, 0, 1, 0.8196079, 1,
-0.09138618, 1.54634, 0.7431219, 0, 1, 0.827451, 1,
-0.09014692, -0.2530705, -4.331908, 0, 1, 0.8313726, 1,
-0.08849085, 0.429992, 1.378544, 0, 1, 0.8392157, 1,
-0.08789648, 0.2092271, -0.417503, 0, 1, 0.8431373, 1,
-0.07913419, -0.4976856, -5.720821, 0, 1, 0.8509804, 1,
-0.078694, 0.4340123, -2.464792, 0, 1, 0.854902, 1,
-0.07679466, -1.766026, -1.692813, 0, 1, 0.8627451, 1,
-0.07136675, 0.7451358, 0.169271, 0, 1, 0.8666667, 1,
-0.06583267, 0.5265434, 0.3108047, 0, 1, 0.8745098, 1,
-0.05997509, -0.7255384, -3.368262, 0, 1, 0.8784314, 1,
-0.049647, 0.1180879, -0.9735538, 0, 1, 0.8862745, 1,
-0.04810594, 0.05759298, -0.3249567, 0, 1, 0.8901961, 1,
-0.04678627, -0.2531759, -4.281743, 0, 1, 0.8980392, 1,
-0.04275214, 0.9451568, 0.1490248, 0, 1, 0.9058824, 1,
-0.04267783, -0.284553, -2.897686, 0, 1, 0.9098039, 1,
-0.04107631, 0.5105121, -0.5204598, 0, 1, 0.9176471, 1,
-0.03835424, -2.821344, -2.785789, 0, 1, 0.9215686, 1,
-0.03767747, 0.4356585, 0.3015581, 0, 1, 0.9294118, 1,
-0.02675118, -0.5034755, -1.978773, 0, 1, 0.9333333, 1,
-0.02588726, -0.4717597, -2.750474, 0, 1, 0.9411765, 1,
-0.0245032, 2.189708, 2.080581, 0, 1, 0.945098, 1,
-0.02069343, -1.095842, -1.791346, 0, 1, 0.9529412, 1,
-0.01935714, -0.2174383, -2.542598, 0, 1, 0.9568627, 1,
-0.01550295, -0.3943182, -1.758437, 0, 1, 0.9647059, 1,
-0.01261424, -0.07880244, -3.10299, 0, 1, 0.9686275, 1,
-0.009659716, 0.5491422, -0.4374408, 0, 1, 0.9764706, 1,
-0.005524557, -1.173878, -2.84532, 0, 1, 0.9803922, 1,
-0.004439785, 1.349022, 0.9235826, 0, 1, 0.9882353, 1,
-0.003785279, 0.2419226, -1.051032, 0, 1, 0.9921569, 1,
0.001264568, 0.0752843, 0.5452316, 0, 1, 1, 1,
0.003024587, -2.022534, 4.10024, 0, 0.9921569, 1, 1,
0.003910591, -0.1734872, 3.379377, 0, 0.9882353, 1, 1,
0.004816012, 0.5597988, 0.2801819, 0, 0.9803922, 1, 1,
0.006436983, -0.3561986, 3.97496, 0, 0.9764706, 1, 1,
0.009721437, -0.3931699, 2.959041, 0, 0.9686275, 1, 1,
0.01209593, -0.4730368, 1.551665, 0, 0.9647059, 1, 1,
0.01213165, 1.494899, -0.007555252, 0, 0.9568627, 1, 1,
0.01433936, -2.320722, 3.649046, 0, 0.9529412, 1, 1,
0.01574361, -0.06078281, 2.225307, 0, 0.945098, 1, 1,
0.02050916, -0.1806698, 3.588256, 0, 0.9411765, 1, 1,
0.03124027, -0.1544694, 4.054284, 0, 0.9333333, 1, 1,
0.03245725, 2.29406, -0.5564486, 0, 0.9294118, 1, 1,
0.03607003, -0.5931343, 2.760367, 0, 0.9215686, 1, 1,
0.03712717, -0.6105132, 2.008689, 0, 0.9176471, 1, 1,
0.03752339, 1.983024, -0.4825259, 0, 0.9098039, 1, 1,
0.04061053, 0.6461998, -1.15078, 0, 0.9058824, 1, 1,
0.04062931, 2.614867, 1.074962, 0, 0.8980392, 1, 1,
0.0410195, 0.423155, 1.051361, 0, 0.8901961, 1, 1,
0.04221435, 1.768964, 1.830188, 0, 0.8862745, 1, 1,
0.04244258, -0.4496162, 2.915404, 0, 0.8784314, 1, 1,
0.04332058, -0.9080403, 2.631444, 0, 0.8745098, 1, 1,
0.04769569, -0.1467228, 2.480395, 0, 0.8666667, 1, 1,
0.05138447, -0.1094539, 1.250408, 0, 0.8627451, 1, 1,
0.05668993, -1.181504, 3.46667, 0, 0.854902, 1, 1,
0.05726685, -0.4732542, 2.044369, 0, 0.8509804, 1, 1,
0.05890705, 0.4333973, 0.1231061, 0, 0.8431373, 1, 1,
0.06103863, -0.05406135, 2.691219, 0, 0.8392157, 1, 1,
0.06435975, -0.5627196, 1.972817, 0, 0.8313726, 1, 1,
0.06772435, 1.495637, 0.5882666, 0, 0.827451, 1, 1,
0.07379471, -0.232414, 4.090618, 0, 0.8196079, 1, 1,
0.07413551, -0.7217739, 3.19919, 0, 0.8156863, 1, 1,
0.07623093, -0.08120665, 1.773948, 0, 0.8078431, 1, 1,
0.07771226, 0.9779775, 0.02502487, 0, 0.8039216, 1, 1,
0.08064687, 0.3247154, -0.3877997, 0, 0.7960784, 1, 1,
0.08149916, 0.5864787, -0.206118, 0, 0.7882353, 1, 1,
0.08333907, 0.6239448, 1.752515, 0, 0.7843137, 1, 1,
0.08528064, -1.068983, 1.752762, 0, 0.7764706, 1, 1,
0.09008469, 0.7251779, 0.5392161, 0, 0.772549, 1, 1,
0.09801157, -0.3204218, 2.490537, 0, 0.7647059, 1, 1,
0.1024224, -0.463075, 2.084422, 0, 0.7607843, 1, 1,
0.1024253, -1.595479, 1.691466, 0, 0.7529412, 1, 1,
0.1050689, -1.379239, 1.91972, 0, 0.7490196, 1, 1,
0.1082722, 3.403251, -0.8293016, 0, 0.7411765, 1, 1,
0.1206188, 1.279465, -0.8572667, 0, 0.7372549, 1, 1,
0.121013, 0.3419297, 0.4914579, 0, 0.7294118, 1, 1,
0.1243397, 0.532587, -1.502497, 0, 0.7254902, 1, 1,
0.1291952, 0.200474, 2.078458, 0, 0.7176471, 1, 1,
0.1328547, 0.9674527, 2.212743, 0, 0.7137255, 1, 1,
0.1350799, -0.3855525, 3.334487, 0, 0.7058824, 1, 1,
0.1359631, -0.7143633, 3.448611, 0, 0.6980392, 1, 1,
0.1405308, 0.0280854, 3.301739, 0, 0.6941177, 1, 1,
0.1439796, -0.7129826, 3.102709, 0, 0.6862745, 1, 1,
0.1447477, -0.4914347, 4.247705, 0, 0.682353, 1, 1,
0.1463885, -2.536273, 2.658547, 0, 0.6745098, 1, 1,
0.1482382, -1.089127, 2.786743, 0, 0.6705883, 1, 1,
0.1520924, -1.567133, 1.719071, 0, 0.6627451, 1, 1,
0.1545942, 0.8992366, -0.5219069, 0, 0.6588235, 1, 1,
0.1547003, 0.05167184, 0.5119696, 0, 0.6509804, 1, 1,
0.1558093, 0.5192218, -0.03456853, 0, 0.6470588, 1, 1,
0.1575622, -0.06228976, 0.8116633, 0, 0.6392157, 1, 1,
0.1584404, -0.5332421, 2.093476, 0, 0.6352941, 1, 1,
0.1595041, -0.7072955, 2.620561, 0, 0.627451, 1, 1,
0.1626794, -1.15152, 2.599236, 0, 0.6235294, 1, 1,
0.164442, -0.6916309, 2.469712, 0, 0.6156863, 1, 1,
0.1692731, -0.8880354, 2.973511, 0, 0.6117647, 1, 1,
0.1715388, -0.2098489, 2.170448, 0, 0.6039216, 1, 1,
0.1745782, -1.76126, 2.389721, 0, 0.5960785, 1, 1,
0.1759234, -1.624062, 2.21859, 0, 0.5921569, 1, 1,
0.1770937, 1.548124, -0.1975013, 0, 0.5843138, 1, 1,
0.1815561, -1.199355, 3.594803, 0, 0.5803922, 1, 1,
0.1823349, -1.267326, 2.298271, 0, 0.572549, 1, 1,
0.182771, -0.7948987, 4.208337, 0, 0.5686275, 1, 1,
0.1845241, 0.833939, -1.651358, 0, 0.5607843, 1, 1,
0.1851201, -0.143189, 2.62582, 0, 0.5568628, 1, 1,
0.1853995, 0.5821074, -0.4211301, 0, 0.5490196, 1, 1,
0.1889738, -0.2380772, 2.224823, 0, 0.5450981, 1, 1,
0.1896401, 0.3339837, -0.2468817, 0, 0.5372549, 1, 1,
0.1937686, 0.2890698, 1.175223, 0, 0.5333334, 1, 1,
0.1990422, -0.4258268, 2.796046, 0, 0.5254902, 1, 1,
0.1992441, 0.149935, 0.4472593, 0, 0.5215687, 1, 1,
0.200487, -0.3086031, 1.920571, 0, 0.5137255, 1, 1,
0.2021091, -0.4222067, 1.124089, 0, 0.509804, 1, 1,
0.2052594, 1.220184, -0.7258258, 0, 0.5019608, 1, 1,
0.2089865, 1.272709, -0.3926458, 0, 0.4941176, 1, 1,
0.2092246, 0.4115931, -0.0727512, 0, 0.4901961, 1, 1,
0.2152599, 1.465923, -0.2849396, 0, 0.4823529, 1, 1,
0.2202204, 0.8469814, -0.4475145, 0, 0.4784314, 1, 1,
0.2218566, -0.7829551, 3.137837, 0, 0.4705882, 1, 1,
0.2236774, 0.3383287, 1.992461, 0, 0.4666667, 1, 1,
0.2244826, 2.501766, 1.858751, 0, 0.4588235, 1, 1,
0.228603, -1.059389, 2.827141, 0, 0.454902, 1, 1,
0.2320492, -0.7572995, 2.541937, 0, 0.4470588, 1, 1,
0.2336183, -0.4015118, 2.888696, 0, 0.4431373, 1, 1,
0.2356454, 0.3792264, 1.166963, 0, 0.4352941, 1, 1,
0.2361797, 1.243911, -1.64499, 0, 0.4313726, 1, 1,
0.2374785, -0.7697455, 3.495841, 0, 0.4235294, 1, 1,
0.2384982, 0.6615785, 0.642023, 0, 0.4196078, 1, 1,
0.2418567, -0.9020076, 2.350778, 0, 0.4117647, 1, 1,
0.2487846, 0.2924867, 0.38358, 0, 0.4078431, 1, 1,
0.2610021, -0.1061703, 1.960534, 0, 0.4, 1, 1,
0.2623799, -0.6530212, 4.88805, 0, 0.3921569, 1, 1,
0.2644363, -0.9728697, 1.09242, 0, 0.3882353, 1, 1,
0.2645353, -1.319202, 3.182232, 0, 0.3803922, 1, 1,
0.266082, -1.793313, 3.78578, 0, 0.3764706, 1, 1,
0.2699761, -0.4288893, 2.593816, 0, 0.3686275, 1, 1,
0.2710499, -0.5471928, 2.640136, 0, 0.3647059, 1, 1,
0.2735077, 0.5602424, 0.4265301, 0, 0.3568628, 1, 1,
0.2762229, 1.867991, -0.3181297, 0, 0.3529412, 1, 1,
0.2774364, -1.566339, 3.642916, 0, 0.345098, 1, 1,
0.2853844, -0.7552629, 5.155141, 0, 0.3411765, 1, 1,
0.2890923, 0.3081054, 1.611878, 0, 0.3333333, 1, 1,
0.3028345, 0.9440904, -0.5083085, 0, 0.3294118, 1, 1,
0.3031266, -0.1173123, 1.755921, 0, 0.3215686, 1, 1,
0.3035411, -0.9454222, 2.242799, 0, 0.3176471, 1, 1,
0.3048533, 0.1343584, 2.526575, 0, 0.3098039, 1, 1,
0.3066557, 0.2726875, 2.435012, 0, 0.3058824, 1, 1,
0.3094681, 1.674926, 1.76483, 0, 0.2980392, 1, 1,
0.3101987, -0.07390021, 1.536231, 0, 0.2901961, 1, 1,
0.3127654, 0.7219236, -1.28068, 0, 0.2862745, 1, 1,
0.3127694, -0.04737307, 0.8880099, 0, 0.2784314, 1, 1,
0.3129671, 1.250271, 0.7887805, 0, 0.2745098, 1, 1,
0.3129727, 0.6777659, -0.7226257, 0, 0.2666667, 1, 1,
0.3137872, -0.02908506, 3.244565, 0, 0.2627451, 1, 1,
0.3141427, -0.1202855, 1.809893, 0, 0.254902, 1, 1,
0.3151349, 0.7719868, 0.7989801, 0, 0.2509804, 1, 1,
0.3188101, -0.2122425, 3.487818, 0, 0.2431373, 1, 1,
0.320446, 0.808655, 0.2515587, 0, 0.2392157, 1, 1,
0.3296446, -2.414923, 3.65678, 0, 0.2313726, 1, 1,
0.3298139, -0.6593851, 2.243761, 0, 0.227451, 1, 1,
0.3306677, -0.6641351, 5.199236, 0, 0.2196078, 1, 1,
0.3309592, -2.088981, 4.194184, 0, 0.2156863, 1, 1,
0.3311049, 1.038503, -0.72519, 0, 0.2078431, 1, 1,
0.3311529, -0.08176451, 2.864497, 0, 0.2039216, 1, 1,
0.3313406, 1.047666, -1.012364, 0, 0.1960784, 1, 1,
0.3333288, 0.8977914, 2.040282, 0, 0.1882353, 1, 1,
0.342573, -1.677425, 4.163352, 0, 0.1843137, 1, 1,
0.344748, 0.952463, 0.1844281, 0, 0.1764706, 1, 1,
0.3454667, 0.09421908, 1.209397, 0, 0.172549, 1, 1,
0.3456182, -0.95433, 3.25194, 0, 0.1647059, 1, 1,
0.3484685, -0.9271483, 2.473892, 0, 0.1607843, 1, 1,
0.3516535, 1.167853, 2.885947, 0, 0.1529412, 1, 1,
0.352537, 0.4946545, -0.2619097, 0, 0.1490196, 1, 1,
0.3595484, -0.1932513, 1.405953, 0, 0.1411765, 1, 1,
0.3609001, -0.2982011, 2.200991, 0, 0.1372549, 1, 1,
0.3612115, -0.1159958, 2.881585, 0, 0.1294118, 1, 1,
0.3616168, 0.9897814, 0.4872705, 0, 0.1254902, 1, 1,
0.3663369, 0.4832383, -0.003073358, 0, 0.1176471, 1, 1,
0.3667682, 1.735908, -0.7422928, 0, 0.1137255, 1, 1,
0.3687775, 0.6622451, 3.514432, 0, 0.1058824, 1, 1,
0.3698184, 0.1576548, 0.76746, 0, 0.09803922, 1, 1,
0.3702258, -0.7359225, 3.884929, 0, 0.09411765, 1, 1,
0.3709264, 0.3768871, 1.218749, 0, 0.08627451, 1, 1,
0.3732062, -1.509935, 1.129416, 0, 0.08235294, 1, 1,
0.3779555, 0.006892237, 2.310256, 0, 0.07450981, 1, 1,
0.3785206, 0.1523661, -0.1252346, 0, 0.07058824, 1, 1,
0.3810693, 1.119121, 1.711529, 0, 0.0627451, 1, 1,
0.3833295, -0.4382797, 3.8503, 0, 0.05882353, 1, 1,
0.3839523, 0.5409603, 1.426413, 0, 0.05098039, 1, 1,
0.3875425, -0.9947768, 0.6240406, 0, 0.04705882, 1, 1,
0.3928459, 0.231559, 3.201707, 0, 0.03921569, 1, 1,
0.3975447, 1.172494, -0.8640529, 0, 0.03529412, 1, 1,
0.4037384, -1.006768, 4.58812, 0, 0.02745098, 1, 1,
0.4097585, -1.248844, 4.464911, 0, 0.02352941, 1, 1,
0.4099203, 0.7710978, 1.116757, 0, 0.01568628, 1, 1,
0.4102356, 0.1402531, -0.5004206, 0, 0.01176471, 1, 1,
0.4164119, 0.1493202, 2.253133, 0, 0.003921569, 1, 1,
0.4247147, 0.5262323, 0.8669829, 0.003921569, 0, 1, 1,
0.4249758, 1.668984, 0.7753298, 0.007843138, 0, 1, 1,
0.4294182, 0.1259846, 2.224725, 0.01568628, 0, 1, 1,
0.4321759, 0.6872687, 0.6541404, 0.01960784, 0, 1, 1,
0.4356304, 0.2834184, 0.5204622, 0.02745098, 0, 1, 1,
0.4392419, -0.2342331, 3.50903, 0.03137255, 0, 1, 1,
0.4413053, -0.2487045, 2.704358, 0.03921569, 0, 1, 1,
0.4417161, -0.278565, 0.3376971, 0.04313726, 0, 1, 1,
0.4549915, -0.7187489, 2.690086, 0.05098039, 0, 1, 1,
0.4586187, -1.09354, 0.511753, 0.05490196, 0, 1, 1,
0.4609748, 2.436016, -1.082357, 0.0627451, 0, 1, 1,
0.4662382, 1.632548, 0.4434564, 0.06666667, 0, 1, 1,
0.4667095, -2.142518, 3.386361, 0.07450981, 0, 1, 1,
0.4693862, -1.422938, 2.293317, 0.07843138, 0, 1, 1,
0.4726382, -0.7348515, 3.821019, 0.08627451, 0, 1, 1,
0.4741774, -0.04801619, 3.458805, 0.09019608, 0, 1, 1,
0.4758986, -0.4661393, 3.610248, 0.09803922, 0, 1, 1,
0.4785537, -0.5177934, 1.576048, 0.1058824, 0, 1, 1,
0.4799951, 0.4407639, -0.8187439, 0.1098039, 0, 1, 1,
0.4820993, -0.06629518, 1.666631, 0.1176471, 0, 1, 1,
0.4849093, 1.538704, 0.07869487, 0.1215686, 0, 1, 1,
0.4857453, 0.2403677, 1.81635, 0.1294118, 0, 1, 1,
0.4886692, -0.5498816, 0.1681155, 0.1333333, 0, 1, 1,
0.4931488, -0.3031466, 1.746054, 0.1411765, 0, 1, 1,
0.4941196, 0.9044459, -0.570713, 0.145098, 0, 1, 1,
0.495513, 0.4199794, 1.691045, 0.1529412, 0, 1, 1,
0.5012943, 0.3894028, 1.813774, 0.1568628, 0, 1, 1,
0.5043383, 0.2509795, 1.461173, 0.1647059, 0, 1, 1,
0.5044146, 0.2557615, 1.058014, 0.1686275, 0, 1, 1,
0.5059261, 0.1085867, 0.4745084, 0.1764706, 0, 1, 1,
0.5073526, 0.06579375, 2.020346, 0.1803922, 0, 1, 1,
0.5128024, 0.05826246, 2.454381, 0.1882353, 0, 1, 1,
0.5165719, 0.4811615, -0.102565, 0.1921569, 0, 1, 1,
0.5217062, -1.126826, 2.612696, 0.2, 0, 1, 1,
0.5246899, -0.7415521, 0.7854474, 0.2078431, 0, 1, 1,
0.5268254, 0.3744005, 1.758168, 0.2117647, 0, 1, 1,
0.5399228, -1.262959, 1.803092, 0.2196078, 0, 1, 1,
0.5413591, -1.360961, 3.905207, 0.2235294, 0, 1, 1,
0.5427734, 0.1899364, 3.539814, 0.2313726, 0, 1, 1,
0.5464202, -1.175357, 1.796212, 0.2352941, 0, 1, 1,
0.5470669, 0.07291171, 1.969566, 0.2431373, 0, 1, 1,
0.55004, -0.7892918, 1.771787, 0.2470588, 0, 1, 1,
0.5534897, -1.167565, 4.003125, 0.254902, 0, 1, 1,
0.5566191, -1.209316, 4.168644, 0.2588235, 0, 1, 1,
0.5568141, -0.7492075, 1.950178, 0.2666667, 0, 1, 1,
0.5611805, 0.8065902, -0.9769446, 0.2705882, 0, 1, 1,
0.5619681, -2.19374, 4.013615, 0.2784314, 0, 1, 1,
0.5635362, -0.7940597, 1.714651, 0.282353, 0, 1, 1,
0.5695192, -0.2657806, 0.5662129, 0.2901961, 0, 1, 1,
0.5719478, 1.057114, -0.6906738, 0.2941177, 0, 1, 1,
0.5728132, 0.3387313, 1.605502, 0.3019608, 0, 1, 1,
0.5753368, -1.271773, 1.820921, 0.3098039, 0, 1, 1,
0.5778785, -0.2081427, 1.963865, 0.3137255, 0, 1, 1,
0.5783439, 1.297758, 2.740704, 0.3215686, 0, 1, 1,
0.5784552, 0.5024098, 2.723371, 0.3254902, 0, 1, 1,
0.5813446, -0.0492008, 1.918318, 0.3333333, 0, 1, 1,
0.582952, -0.8822503, 0.3410293, 0.3372549, 0, 1, 1,
0.5880468, -1.020645, 3.812819, 0.345098, 0, 1, 1,
0.5898655, -0.03042936, 1.908802, 0.3490196, 0, 1, 1,
0.5902164, 1.694907, 0.04030652, 0.3568628, 0, 1, 1,
0.5926298, 1.398347, 1.275734, 0.3607843, 0, 1, 1,
0.5932266, -0.6568751, 2.771695, 0.3686275, 0, 1, 1,
0.6006237, 0.5071572, 0.9217358, 0.372549, 0, 1, 1,
0.6044876, 1.288891, 0.2105897, 0.3803922, 0, 1, 1,
0.6054388, -0.06471423, 2.047429, 0.3843137, 0, 1, 1,
0.6069754, 0.5952713, -0.08562934, 0.3921569, 0, 1, 1,
0.6114876, 0.9468324, 1.040535, 0.3960784, 0, 1, 1,
0.6194325, -0.3478009, 2.165292, 0.4039216, 0, 1, 1,
0.6221815, 0.3474933, 3.271633, 0.4117647, 0, 1, 1,
0.6225444, -0.5766512, 0.564792, 0.4156863, 0, 1, 1,
0.6231455, -0.5955388, 1.854819, 0.4235294, 0, 1, 1,
0.6310148, 1.074832, 0.8587828, 0.427451, 0, 1, 1,
0.6386277, 0.5852255, 1.558687, 0.4352941, 0, 1, 1,
0.6387032, -0.5222967, 1.501388, 0.4392157, 0, 1, 1,
0.6388147, -0.9546511, 2.312106, 0.4470588, 0, 1, 1,
0.6392723, 0.1039778, 1.230886, 0.4509804, 0, 1, 1,
0.6395591, -1.650667, 1.676707, 0.4588235, 0, 1, 1,
0.6407902, 0.07255216, 1.229758, 0.4627451, 0, 1, 1,
0.6440064, -0.6356807, 1.915381, 0.4705882, 0, 1, 1,
0.6441361, 1.202043, 0.07446259, 0.4745098, 0, 1, 1,
0.6484783, 0.6340178, 0.5633076, 0.4823529, 0, 1, 1,
0.65069, 1.201215, 1.726207, 0.4862745, 0, 1, 1,
0.6549869, 2.150242, -0.9231645, 0.4941176, 0, 1, 1,
0.6583102, 0.7461939, 1.647615, 0.5019608, 0, 1, 1,
0.6587439, -0.1331695, 1.622296, 0.5058824, 0, 1, 1,
0.6605845, 0.5929141, 1.898409, 0.5137255, 0, 1, 1,
0.6617528, -1.385759, 4.021495, 0.5176471, 0, 1, 1,
0.6650286, 0.4797494, 0.676392, 0.5254902, 0, 1, 1,
0.6665115, -1.421351, 2.841177, 0.5294118, 0, 1, 1,
0.6686717, -0.006604627, 1.391035, 0.5372549, 0, 1, 1,
0.6687993, 1.292123, 0.8510494, 0.5411765, 0, 1, 1,
0.6705651, -1.011967, 2.084215, 0.5490196, 0, 1, 1,
0.6736358, -0.518345, 1.970984, 0.5529412, 0, 1, 1,
0.6776831, 0.2629606, 0.4555071, 0.5607843, 0, 1, 1,
0.6871716, -1.32117, 3.117853, 0.5647059, 0, 1, 1,
0.6925932, 0.5734867, -0.07954863, 0.572549, 0, 1, 1,
0.6965117, -1.603548, 3.942123, 0.5764706, 0, 1, 1,
0.7007263, 1.017229, 1.384763, 0.5843138, 0, 1, 1,
0.7050542, 0.2756169, 0.9700845, 0.5882353, 0, 1, 1,
0.7097893, -0.4418887, 1.910828, 0.5960785, 0, 1, 1,
0.7107081, -1.211235, 3.157279, 0.6039216, 0, 1, 1,
0.7133859, -0.3208445, 1.852753, 0.6078432, 0, 1, 1,
0.7189405, 0.5607993, 0.9804987, 0.6156863, 0, 1, 1,
0.7212676, 1.031552, -0.9790486, 0.6196079, 0, 1, 1,
0.7223231, -0.3318364, 1.415547, 0.627451, 0, 1, 1,
0.7269112, -0.08491343, 3.60305, 0.6313726, 0, 1, 1,
0.7278349, -1.534522, 3.270227, 0.6392157, 0, 1, 1,
0.7322489, -0.2553807, 2.176903, 0.6431373, 0, 1, 1,
0.7368745, 1.087061, -0.2636232, 0.6509804, 0, 1, 1,
0.7379367, -0.9900494, 1.618483, 0.654902, 0, 1, 1,
0.7388157, 0.9770319, -0.2796354, 0.6627451, 0, 1, 1,
0.7559171, -0.3072163, 2.119677, 0.6666667, 0, 1, 1,
0.7591266, -0.7766776, 2.365125, 0.6745098, 0, 1, 1,
0.7637632, -0.03919238, 0.7234989, 0.6784314, 0, 1, 1,
0.7661667, -0.1486386, 1.44054, 0.6862745, 0, 1, 1,
0.7782918, -1.364128, 2.978468, 0.6901961, 0, 1, 1,
0.7783673, 2.022768, 0.8938972, 0.6980392, 0, 1, 1,
0.780156, 0.8695487, 1.936166, 0.7058824, 0, 1, 1,
0.782626, 0.5996038, 1.440455, 0.7098039, 0, 1, 1,
0.7889016, -0.2489945, 2.26144, 0.7176471, 0, 1, 1,
0.8000844, 0.8918134, 2.09054, 0.7215686, 0, 1, 1,
0.8137988, 0.5722184, 1.10574, 0.7294118, 0, 1, 1,
0.8160471, 0.2790952, 0.7740149, 0.7333333, 0, 1, 1,
0.8166181, 0.8012055, 1.308304, 0.7411765, 0, 1, 1,
0.8177789, 0.2486397, 1.505157, 0.7450981, 0, 1, 1,
0.8192419, -0.8269974, 2.940137, 0.7529412, 0, 1, 1,
0.8236499, 0.2467447, 1.706029, 0.7568628, 0, 1, 1,
0.8239534, 0.340629, 0.2753649, 0.7647059, 0, 1, 1,
0.8312171, -0.9839723, 3.295167, 0.7686275, 0, 1, 1,
0.8331586, 0.9298124, 0.6461301, 0.7764706, 0, 1, 1,
0.8370913, -0.7558749, 1.795013, 0.7803922, 0, 1, 1,
0.8388251, -0.07409485, 4.054203, 0.7882353, 0, 1, 1,
0.8388372, -1.77373, 2.339475, 0.7921569, 0, 1, 1,
0.8429659, 0.3500444, -0.7197374, 0.8, 0, 1, 1,
0.8434944, 0.2263339, 2.707826, 0.8078431, 0, 1, 1,
0.8451403, -1.385309, 3.206831, 0.8117647, 0, 1, 1,
0.8535683, 1.680997, 1.329256, 0.8196079, 0, 1, 1,
0.8582416, -0.4077898, 3.573112, 0.8235294, 0, 1, 1,
0.8599594, -0.824225, 3.915429, 0.8313726, 0, 1, 1,
0.8645571, 1.19055, -0.8765812, 0.8352941, 0, 1, 1,
0.8721461, -0.6693373, 2.152849, 0.8431373, 0, 1, 1,
0.8731595, -0.936217, 3.371818, 0.8470588, 0, 1, 1,
0.8739915, -0.3508759, 1.579375, 0.854902, 0, 1, 1,
0.8767614, -0.03576054, 0.9337263, 0.8588235, 0, 1, 1,
0.887243, 1.042438, 2.378607, 0.8666667, 0, 1, 1,
0.8882549, 0.9920443, 0.4530951, 0.8705882, 0, 1, 1,
0.8923721, -0.08473992, 0.8904457, 0.8784314, 0, 1, 1,
0.8932905, -0.5229126, 1.431412, 0.8823529, 0, 1, 1,
0.9034531, 0.5864354, 3.741459, 0.8901961, 0, 1, 1,
0.9076779, 0.9441443, 2.046005, 0.8941177, 0, 1, 1,
0.9085983, 1.177941, 0.856682, 0.9019608, 0, 1, 1,
0.9104831, -1.575453, 2.739741, 0.9098039, 0, 1, 1,
0.9109572, 0.04726678, 0.749019, 0.9137255, 0, 1, 1,
0.9162843, 0.8722063, 2.039364, 0.9215686, 0, 1, 1,
0.9216517, 0.2471519, 2.124449, 0.9254902, 0, 1, 1,
0.9268744, 1.599302, 1.371861, 0.9333333, 0, 1, 1,
0.9275448, -0.3917189, 2.5555, 0.9372549, 0, 1, 1,
0.9289956, 0.6559337, 0.8430404, 0.945098, 0, 1, 1,
0.9353012, -1.269956, 4.38548, 0.9490196, 0, 1, 1,
0.9441487, -0.2965987, 2.215475, 0.9568627, 0, 1, 1,
0.944537, 0.07328155, 0.1816142, 0.9607843, 0, 1, 1,
0.9475566, -1.007905, 2.910586, 0.9686275, 0, 1, 1,
0.9512128, 0.7938834, 3.062339, 0.972549, 0, 1, 1,
0.9540638, 1.327702, 1.036963, 0.9803922, 0, 1, 1,
0.9626846, 0.4702044, 1.643898, 0.9843137, 0, 1, 1,
0.9636348, 0.6191061, 0.6416957, 0.9921569, 0, 1, 1,
0.9636353, 1.013479, 1.557932, 0.9960784, 0, 1, 1,
0.9706513, -0.4379207, 3.561018, 1, 0, 0.9960784, 1,
0.971597, 0.6100702, 2.363158, 1, 0, 0.9882353, 1,
0.9722625, -0.417619, 1.525444, 1, 0, 0.9843137, 1,
0.9847563, 0.2451209, 3.226705, 1, 0, 0.9764706, 1,
0.985486, -1.454487, 3.200154, 1, 0, 0.972549, 1,
0.9873818, -1.725199, 2.396529, 1, 0, 0.9647059, 1,
0.9880419, -1.317166, 2.960026, 1, 0, 0.9607843, 1,
0.9899742, 0.2219365, 2.469768, 1, 0, 0.9529412, 1,
0.9934828, 1.279276, -0.02078146, 1, 0, 0.9490196, 1,
0.9942076, -0.6304244, 2.952053, 1, 0, 0.9411765, 1,
1.002535, -1.799068, 2.443992, 1, 0, 0.9372549, 1,
1.004698, -1.980627, 1.16413, 1, 0, 0.9294118, 1,
1.005957, 0.4938851, 1.894909, 1, 0, 0.9254902, 1,
1.011919, 0.550967, 1.289565, 1, 0, 0.9176471, 1,
1.01419, 0.4443679, 2.113164, 1, 0, 0.9137255, 1,
1.017841, -0.7405838, 2.827377, 1, 0, 0.9058824, 1,
1.020967, -0.7094885, 1.53105, 1, 0, 0.9019608, 1,
1.024869, 0.0869928, 0.1999941, 1, 0, 0.8941177, 1,
1.025979, -1.663777, 2.689129, 1, 0, 0.8862745, 1,
1.032501, 1.635595, 2.529334, 1, 0, 0.8823529, 1,
1.037655, 0.2396251, 0.5954746, 1, 0, 0.8745098, 1,
1.040824, -0.9235106, 2.08879, 1, 0, 0.8705882, 1,
1.043549, -1.368824, 2.114201, 1, 0, 0.8627451, 1,
1.045333, -0.6811545, 3.438073, 1, 0, 0.8588235, 1,
1.054874, 0.02830807, 0.3923601, 1, 0, 0.8509804, 1,
1.056879, 0.07837393, -0.2387787, 1, 0, 0.8470588, 1,
1.060925, -0.006277667, 0.1319775, 1, 0, 0.8392157, 1,
1.062082, 1.3908, 1.844784, 1, 0, 0.8352941, 1,
1.062675, -0.2741418, 0.266827, 1, 0, 0.827451, 1,
1.063534, -0.4968615, 2.113615, 1, 0, 0.8235294, 1,
1.067201, -0.9275948, 3.063469, 1, 0, 0.8156863, 1,
1.072044, -1.143548, 2.56221, 1, 0, 0.8117647, 1,
1.087624, 0.7310567, 2.581356, 1, 0, 0.8039216, 1,
1.088907, 1.451559, -0.06744763, 1, 0, 0.7960784, 1,
1.093589, 0.1734595, 0.8312958, 1, 0, 0.7921569, 1,
1.095966, -0.08957978, 1.364073, 1, 0, 0.7843137, 1,
1.100678, 0.1613198, 2.625613, 1, 0, 0.7803922, 1,
1.101633, 0.5006557, 2.015363, 1, 0, 0.772549, 1,
1.117392, 0.1487536, 1.184801, 1, 0, 0.7686275, 1,
1.1193, -1.143988, 2.882545, 1, 0, 0.7607843, 1,
1.121408, -0.5892292, 1.60644, 1, 0, 0.7568628, 1,
1.126639, 0.9072869, 1.08015, 1, 0, 0.7490196, 1,
1.143316, -1.886157, 1.986791, 1, 0, 0.7450981, 1,
1.143415, -0.1061809, 1.732838, 1, 0, 0.7372549, 1,
1.146585, 1.322549, 0.6721352, 1, 0, 0.7333333, 1,
1.15107, 1.284167, 1.267967, 1, 0, 0.7254902, 1,
1.151733, -0.9433311, 2.244899, 1, 0, 0.7215686, 1,
1.155602, -0.4966638, 3.596433, 1, 0, 0.7137255, 1,
1.17311, 0.2354659, 1.326058, 1, 0, 0.7098039, 1,
1.184296, 1.101674, 1.987713, 1, 0, 0.7019608, 1,
1.18772, 1.97686, -0.1220205, 1, 0, 0.6941177, 1,
1.189963, 0.04519245, -0.7466937, 1, 0, 0.6901961, 1,
1.210617, -0.06218, 2.065983, 1, 0, 0.682353, 1,
1.212268, -0.6446447, 1.938299, 1, 0, 0.6784314, 1,
1.214755, 0.7366608, 2.028575, 1, 0, 0.6705883, 1,
1.21499, -0.1502059, 1.563661, 1, 0, 0.6666667, 1,
1.216099, 0.2561791, -0.7277536, 1, 0, 0.6588235, 1,
1.220839, -0.5961214, 2.430471, 1, 0, 0.654902, 1,
1.228652, 0.674243, 0.8314438, 1, 0, 0.6470588, 1,
1.239777, 0.4480667, 0.1991897, 1, 0, 0.6431373, 1,
1.241071, -1.007879, 0.4562833, 1, 0, 0.6352941, 1,
1.272191, 1.000083, -0.2902983, 1, 0, 0.6313726, 1,
1.276307, -1.666998, 2.831532, 1, 0, 0.6235294, 1,
1.279202, 0.9174499, 0.8340638, 1, 0, 0.6196079, 1,
1.280748, 0.5560747, 2.234689, 1, 0, 0.6117647, 1,
1.281162, 0.1796519, 1.161286, 1, 0, 0.6078432, 1,
1.28126, -0.2366162, 3.689362, 1, 0, 0.6, 1,
1.290303, 0.2817212, -0.5770239, 1, 0, 0.5921569, 1,
1.291341, 1.547835, 0.8745128, 1, 0, 0.5882353, 1,
1.291478, 0.8231283, 3.328207, 1, 0, 0.5803922, 1,
1.293774, -0.1677455, 1.616525, 1, 0, 0.5764706, 1,
1.299384, -0.9260162, 1.408616, 1, 0, 0.5686275, 1,
1.299585, -0.2775828, 2.437364, 1, 0, 0.5647059, 1,
1.301744, -0.2275878, 1.110466, 1, 0, 0.5568628, 1,
1.312464, -0.3048027, 0.6063507, 1, 0, 0.5529412, 1,
1.31345, -0.8352999, 2.560321, 1, 0, 0.5450981, 1,
1.314733, -0.3072189, 1.08462, 1, 0, 0.5411765, 1,
1.317241, -0.9038022, 3.143843, 1, 0, 0.5333334, 1,
1.323576, -0.1468381, 2.176347, 1, 0, 0.5294118, 1,
1.324684, 3.34336, -0.1293421, 1, 0, 0.5215687, 1,
1.327333, -0.8402181, 3.025091, 1, 0, 0.5176471, 1,
1.333865, -1.455564, 3.688174, 1, 0, 0.509804, 1,
1.337359, 1.769347, 1.881034, 1, 0, 0.5058824, 1,
1.341667, -1.254173, 1.560176, 1, 0, 0.4980392, 1,
1.349159, -0.8547844, 2.158955, 1, 0, 0.4901961, 1,
1.351777, -0.7102324, 1.448564, 1, 0, 0.4862745, 1,
1.354693, -0.7118594, 1.70748, 1, 0, 0.4784314, 1,
1.359203, 1.18805, 1.181702, 1, 0, 0.4745098, 1,
1.36419, -0.1622037, 2.340154, 1, 0, 0.4666667, 1,
1.366224, 0.7574942, 0.7973609, 1, 0, 0.4627451, 1,
1.371865, 0.740965, 0.9794846, 1, 0, 0.454902, 1,
1.374489, -1.215684, 0.2341823, 1, 0, 0.4509804, 1,
1.375395, 0.8825958, 0.8663177, 1, 0, 0.4431373, 1,
1.376659, -0.6639288, 0.8143376, 1, 0, 0.4392157, 1,
1.379215, -0.9761417, 3.980736, 1, 0, 0.4313726, 1,
1.381489, -0.3375773, 2.889041, 1, 0, 0.427451, 1,
1.393405, -1.068864, 1.472799, 1, 0, 0.4196078, 1,
1.41414, -2.150222, 0.4884115, 1, 0, 0.4156863, 1,
1.418616, -0.3151705, 2.230608, 1, 0, 0.4078431, 1,
1.429871, 0.4322789, 1.403195, 1, 0, 0.4039216, 1,
1.438348, -0.5292967, 1.64186, 1, 0, 0.3960784, 1,
1.44733, -0.7379261, 4.242004, 1, 0, 0.3882353, 1,
1.453336, -0.9291589, 1.8368, 1, 0, 0.3843137, 1,
1.466184, -0.7030629, 2.177469, 1, 0, 0.3764706, 1,
1.478136, 1.123019, -0.09756241, 1, 0, 0.372549, 1,
1.494093, 0.2028479, 0.9637129, 1, 0, 0.3647059, 1,
1.500975, -0.1219411, 1.89874, 1, 0, 0.3607843, 1,
1.503442, -0.5907205, 2.147187, 1, 0, 0.3529412, 1,
1.510961, -0.7363776, 1.900076, 1, 0, 0.3490196, 1,
1.512724, 0.1807674, 2.601124, 1, 0, 0.3411765, 1,
1.521256, -1.336829, 1.358313, 1, 0, 0.3372549, 1,
1.52396, 0.3411309, 0.256553, 1, 0, 0.3294118, 1,
1.526483, -0.5104667, 0.3907103, 1, 0, 0.3254902, 1,
1.529016, -0.8834128, 2.434654, 1, 0, 0.3176471, 1,
1.530144, -0.1692342, 2.397588, 1, 0, 0.3137255, 1,
1.5435, -0.3188436, 3.234577, 1, 0, 0.3058824, 1,
1.545332, 0.09875396, 1.006645, 1, 0, 0.2980392, 1,
1.578752, 1.638018, -1.666938, 1, 0, 0.2941177, 1,
1.587944, -0.6840651, 3.578092, 1, 0, 0.2862745, 1,
1.593995, -0.8989758, 3.363475, 1, 0, 0.282353, 1,
1.594885, -1.148747, 2.287868, 1, 0, 0.2745098, 1,
1.599277, 0.2969669, 0.8019074, 1, 0, 0.2705882, 1,
1.66241, -0.9341156, 1.926513, 1, 0, 0.2627451, 1,
1.66798, -0.3874518, 1.990051, 1, 0, 0.2588235, 1,
1.673552, -1.692737, 1.209042, 1, 0, 0.2509804, 1,
1.686593, -1.657611, 1.311445, 1, 0, 0.2470588, 1,
1.68841, 1.900024, 0.8975288, 1, 0, 0.2392157, 1,
1.689002, 0.5606109, 2.26453, 1, 0, 0.2352941, 1,
1.692944, 0.2521837, -0.5860154, 1, 0, 0.227451, 1,
1.701497, -0.6537994, 0.4738351, 1, 0, 0.2235294, 1,
1.724241, 0.8532882, 0.8981648, 1, 0, 0.2156863, 1,
1.738684, -0.2085692, 2.053082, 1, 0, 0.2117647, 1,
1.752679, 0.7057733, -0.1285122, 1, 0, 0.2039216, 1,
1.770962, 0.9520163, 1.787312, 1, 0, 0.1960784, 1,
1.781428, -1.135814, 3.162643, 1, 0, 0.1921569, 1,
1.80419, -1.223474, 3.809565, 1, 0, 0.1843137, 1,
1.835268, -1.858437, 4.091866, 1, 0, 0.1803922, 1,
1.84835, 0.706799, 0.05835189, 1, 0, 0.172549, 1,
1.861042, -1.214284, 2.293587, 1, 0, 0.1686275, 1,
1.882897, -0.09808674, 1.057156, 1, 0, 0.1607843, 1,
1.892845, -0.5078149, 2.116832, 1, 0, 0.1568628, 1,
1.900648, 0.5674734, 1.633552, 1, 0, 0.1490196, 1,
1.905949, 1.12141, 0.7264748, 1, 0, 0.145098, 1,
1.923537, -0.1843873, 1.891401, 1, 0, 0.1372549, 1,
1.935217, -0.9129345, 3.52436, 1, 0, 0.1333333, 1,
1.938697, -1.006415, 3.141396, 1, 0, 0.1254902, 1,
1.941763, -0.2797282, 1.457706, 1, 0, 0.1215686, 1,
1.94426, -0.9149186, 1.952389, 1, 0, 0.1137255, 1,
1.968487, 1.088135, 1.804317, 1, 0, 0.1098039, 1,
1.98579, -2.080543, 3.624789, 1, 0, 0.1019608, 1,
2.030015, 0.8651881, 2.915477, 1, 0, 0.09411765, 1,
2.083229, -0.2453807, 1.308218, 1, 0, 0.09019608, 1,
2.110682, 0.4249614, 0.06488732, 1, 0, 0.08235294, 1,
2.135468, -0.4326405, 2.388246, 1, 0, 0.07843138, 1,
2.175163, -0.544488, 2.19757, 1, 0, 0.07058824, 1,
2.180834, -0.2136765, 1.192958, 1, 0, 0.06666667, 1,
2.181242, 0.5079568, 1.027695, 1, 0, 0.05882353, 1,
2.212808, -0.2177411, 1.574316, 1, 0, 0.05490196, 1,
2.291968, -1.166544, 2.074502, 1, 0, 0.04705882, 1,
2.310273, -0.1349406, 2.002536, 1, 0, 0.04313726, 1,
2.347257, -0.5340741, 1.049988, 1, 0, 0.03529412, 1,
2.397708, -1.666902, 1.633354, 1, 0, 0.03137255, 1,
2.780797, 0.3524747, 2.098935, 1, 0, 0.02352941, 1,
2.906308, -1.869529, 3.514342, 1, 0, 0.01960784, 1,
3.011786, -2.431926, 2.11612, 1, 0, 0.01176471, 1,
3.250132, -1.468031, 2.495831, 1, 0, 0.007843138, 1
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
0.03461242, -4.030406, -7.571771, 0, -0.5, 0.5, 0.5,
0.03461242, -4.030406, -7.571771, 1, -0.5, 0.5, 0.5,
0.03461242, -4.030406, -7.571771, 1, 1.5, 0.5, 0.5,
0.03461242, -4.030406, -7.571771, 0, 1.5, 0.5, 0.5
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
-4.270968, 0.2251166, -7.571771, 0, -0.5, 0.5, 0.5,
-4.270968, 0.2251166, -7.571771, 1, -0.5, 0.5, 0.5,
-4.270968, 0.2251166, -7.571771, 1, 1.5, 0.5, 0.5,
-4.270968, 0.2251166, -7.571771, 0, 1.5, 0.5, 0.5
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
-4.270968, -4.030406, -0.2607923, 0, -0.5, 0.5, 0.5,
-4.270968, -4.030406, -0.2607923, 1, -0.5, 0.5, 0.5,
-4.270968, -4.030406, -0.2607923, 1, 1.5, 0.5, 0.5,
-4.270968, -4.030406, -0.2607923, 0, 1.5, 0.5, 0.5
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
-3, -3.048362, -5.884622,
3, -3.048362, -5.884622,
-3, -3.048362, -5.884622,
-3, -3.212036, -6.165813,
-2, -3.048362, -5.884622,
-2, -3.212036, -6.165813,
-1, -3.048362, -5.884622,
-1, -3.212036, -6.165813,
0, -3.048362, -5.884622,
0, -3.212036, -6.165813,
1, -3.048362, -5.884622,
1, -3.212036, -6.165813,
2, -3.048362, -5.884622,
2, -3.212036, -6.165813,
3, -3.048362, -5.884622,
3, -3.212036, -6.165813
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
-3, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
-3, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
-3, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
-3, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5,
-2, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
-2, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
-2, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
-2, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5,
-1, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
-1, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
-1, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
-1, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5,
0, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
0, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
0, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
0, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5,
1, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
1, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
1, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
1, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5,
2, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
2, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
2, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
2, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5,
3, -3.539384, -6.728196, 0, -0.5, 0.5, 0.5,
3, -3.539384, -6.728196, 1, -0.5, 0.5, 0.5,
3, -3.539384, -6.728196, 1, 1.5, 0.5, 0.5,
3, -3.539384, -6.728196, 0, 1.5, 0.5, 0.5
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
-3.277373, -2, -5.884622,
-3.277373, 3, -5.884622,
-3.277373, -2, -5.884622,
-3.442972, -2, -6.165813,
-3.277373, -1, -5.884622,
-3.442972, -1, -6.165813,
-3.277373, 0, -5.884622,
-3.442972, 0, -6.165813,
-3.277373, 1, -5.884622,
-3.442972, 1, -6.165813,
-3.277373, 2, -5.884622,
-3.442972, 2, -6.165813,
-3.277373, 3, -5.884622,
-3.442972, 3, -6.165813
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
-3.774171, -2, -6.728196, 0, -0.5, 0.5, 0.5,
-3.774171, -2, -6.728196, 1, -0.5, 0.5, 0.5,
-3.774171, -2, -6.728196, 1, 1.5, 0.5, 0.5,
-3.774171, -2, -6.728196, 0, 1.5, 0.5, 0.5,
-3.774171, -1, -6.728196, 0, -0.5, 0.5, 0.5,
-3.774171, -1, -6.728196, 1, -0.5, 0.5, 0.5,
-3.774171, -1, -6.728196, 1, 1.5, 0.5, 0.5,
-3.774171, -1, -6.728196, 0, 1.5, 0.5, 0.5,
-3.774171, 0, -6.728196, 0, -0.5, 0.5, 0.5,
-3.774171, 0, -6.728196, 1, -0.5, 0.5, 0.5,
-3.774171, 0, -6.728196, 1, 1.5, 0.5, 0.5,
-3.774171, 0, -6.728196, 0, 1.5, 0.5, 0.5,
-3.774171, 1, -6.728196, 0, -0.5, 0.5, 0.5,
-3.774171, 1, -6.728196, 1, -0.5, 0.5, 0.5,
-3.774171, 1, -6.728196, 1, 1.5, 0.5, 0.5,
-3.774171, 1, -6.728196, 0, 1.5, 0.5, 0.5,
-3.774171, 2, -6.728196, 0, -0.5, 0.5, 0.5,
-3.774171, 2, -6.728196, 1, -0.5, 0.5, 0.5,
-3.774171, 2, -6.728196, 1, 1.5, 0.5, 0.5,
-3.774171, 2, -6.728196, 0, 1.5, 0.5, 0.5,
-3.774171, 3, -6.728196, 0, -0.5, 0.5, 0.5,
-3.774171, 3, -6.728196, 1, -0.5, 0.5, 0.5,
-3.774171, 3, -6.728196, 1, 1.5, 0.5, 0.5,
-3.774171, 3, -6.728196, 0, 1.5, 0.5, 0.5
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
-3.277373, -3.048362, -4,
-3.277373, -3.048362, 4,
-3.277373, -3.048362, -4,
-3.442972, -3.212036, -4,
-3.277373, -3.048362, -2,
-3.442972, -3.212036, -2,
-3.277373, -3.048362, 0,
-3.442972, -3.212036, 0,
-3.277373, -3.048362, 2,
-3.442972, -3.212036, 2,
-3.277373, -3.048362, 4,
-3.442972, -3.212036, 4
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
-3.774171, -3.539384, -4, 0, -0.5, 0.5, 0.5,
-3.774171, -3.539384, -4, 1, -0.5, 0.5, 0.5,
-3.774171, -3.539384, -4, 1, 1.5, 0.5, 0.5,
-3.774171, -3.539384, -4, 0, 1.5, 0.5, 0.5,
-3.774171, -3.539384, -2, 0, -0.5, 0.5, 0.5,
-3.774171, -3.539384, -2, 1, -0.5, 0.5, 0.5,
-3.774171, -3.539384, -2, 1, 1.5, 0.5, 0.5,
-3.774171, -3.539384, -2, 0, 1.5, 0.5, 0.5,
-3.774171, -3.539384, 0, 0, -0.5, 0.5, 0.5,
-3.774171, -3.539384, 0, 1, -0.5, 0.5, 0.5,
-3.774171, -3.539384, 0, 1, 1.5, 0.5, 0.5,
-3.774171, -3.539384, 0, 0, 1.5, 0.5, 0.5,
-3.774171, -3.539384, 2, 0, -0.5, 0.5, 0.5,
-3.774171, -3.539384, 2, 1, -0.5, 0.5, 0.5,
-3.774171, -3.539384, 2, 1, 1.5, 0.5, 0.5,
-3.774171, -3.539384, 2, 0, 1.5, 0.5, 0.5,
-3.774171, -3.539384, 4, 0, -0.5, 0.5, 0.5,
-3.774171, -3.539384, 4, 1, -0.5, 0.5, 0.5,
-3.774171, -3.539384, 4, 1, 1.5, 0.5, 0.5,
-3.774171, -3.539384, 4, 0, 1.5, 0.5, 0.5
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
-3.277373, -3.048362, -5.884622,
-3.277373, 3.498595, -5.884622,
-3.277373, -3.048362, 5.363037,
-3.277373, 3.498595, 5.363037,
-3.277373, -3.048362, -5.884622,
-3.277373, -3.048362, 5.363037,
-3.277373, 3.498595, -5.884622,
-3.277373, 3.498595, 5.363037,
-3.277373, -3.048362, -5.884622,
3.346598, -3.048362, -5.884622,
-3.277373, -3.048362, 5.363037,
3.346598, -3.048362, 5.363037,
-3.277373, 3.498595, -5.884622,
3.346598, 3.498595, -5.884622,
-3.277373, 3.498595, 5.363037,
3.346598, 3.498595, 5.363037,
3.346598, -3.048362, -5.884622,
3.346598, 3.498595, -5.884622,
3.346598, -3.048362, 5.363037,
3.346598, 3.498595, 5.363037,
3.346598, -3.048362, -5.884622,
3.346598, -3.048362, 5.363037,
3.346598, 3.498595, -5.884622,
3.346598, 3.498595, 5.363037
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
var radius = 7.797752;
var distance = 34.69308;
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
mvMatrix.translate( -0.03461242, -0.2251166, 0.2607923 );
mvMatrix.scale( 1.272814, 1.287786, 0.7495856 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69308);
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
dodine<-read.table("dodine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dodine$V2
```

```
## Error in eval(expr, envir, enclos): object 'dodine' not found
```

```r
y<-dodine$V3
```

```
## Error in eval(expr, envir, enclos): object 'dodine' not found
```

```r
z<-dodine$V4
```

```
## Error in eval(expr, envir, enclos): object 'dodine' not found
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
-3.180907, 0.6085057, -0.8556817, 0, 0, 1, 1, 1,
-2.886358, 1.473941, -1.968038, 1, 0, 0, 1, 1,
-2.600178, -1.538881, -2.204673, 1, 0, 0, 1, 1,
-2.567172, 0.4486904, -2.422771, 1, 0, 0, 1, 1,
-2.516191, 0.03796606, -1.068905, 1, 0, 0, 1, 1,
-2.498276, -0.7161177, -2.453764, 1, 0, 0, 1, 1,
-2.487081, -0.1851148, 0.6050167, 0, 0, 0, 1, 1,
-2.389146, 0.7887281, -1.467984, 0, 0, 0, 1, 1,
-2.384636, 0.2662617, -2.249723, 0, 0, 0, 1, 1,
-2.357095, 1.590516, -1.805775, 0, 0, 0, 1, 1,
-2.330646, -2.111797, -4.079176, 0, 0, 0, 1, 1,
-2.323011, 1.259122, -2.1044, 0, 0, 0, 1, 1,
-2.313711, 1.450385, -1.094186, 0, 0, 0, 1, 1,
-2.299506, -0.9705834, -0.7504533, 1, 1, 1, 1, 1,
-2.279836, 1.44852, -0.6179059, 1, 1, 1, 1, 1,
-2.271484, 1.207892, -2.782749, 1, 1, 1, 1, 1,
-2.235196, -1.585791, -2.171222, 1, 1, 1, 1, 1,
-2.212807, -0.08844224, -0.7479471, 1, 1, 1, 1, 1,
-2.199996, 0.3718978, -0.9777811, 1, 1, 1, 1, 1,
-2.198467, -1.275699, -1.311551, 1, 1, 1, 1, 1,
-2.179928, -0.6232513, -0.8384301, 1, 1, 1, 1, 1,
-2.131501, -1.853391, -1.449433, 1, 1, 1, 1, 1,
-2.118188, 1.977323, -2.040885, 1, 1, 1, 1, 1,
-2.090145, -0.7350389, -2.118282, 1, 1, 1, 1, 1,
-2.044703, 1.689864, -0.7889331, 1, 1, 1, 1, 1,
-2.037244, -0.6390909, -0.719201, 1, 1, 1, 1, 1,
-2.002987, 0.7655314, -2.881571, 1, 1, 1, 1, 1,
-2.001274, -1.734466, -0.6335731, 1, 1, 1, 1, 1,
-1.992056, -1.288357, -1.529521, 0, 0, 1, 1, 1,
-1.989283, -0.9911147, -2.731014, 1, 0, 0, 1, 1,
-1.972132, 0.1380442, -1.600886, 1, 0, 0, 1, 1,
-1.956244, 0.5722999, -1.460688, 1, 0, 0, 1, 1,
-1.942113, 0.2082777, -2.654754, 1, 0, 0, 1, 1,
-1.938054, -1.684893, -2.316591, 1, 0, 0, 1, 1,
-1.89125, 0.540082, -1.849778, 0, 0, 0, 1, 1,
-1.891233, 0.6312371, -0.8645634, 0, 0, 0, 1, 1,
-1.887963, 1.559954, -0.963828, 0, 0, 0, 1, 1,
-1.850268, -0.177773, -1.471242, 0, 0, 0, 1, 1,
-1.810545, -0.9791691, -3.556999, 0, 0, 0, 1, 1,
-1.787921, 0.2704909, -1.805637, 0, 0, 0, 1, 1,
-1.787273, -0.1906652, -1.882249, 0, 0, 0, 1, 1,
-1.786864, 0.07044635, -1.106222, 1, 1, 1, 1, 1,
-1.76304, -0.1505109, -1.559437, 1, 1, 1, 1, 1,
-1.754575, -2.653414, -3.257497, 1, 1, 1, 1, 1,
-1.753709, 0.3921091, -1.034913, 1, 1, 1, 1, 1,
-1.734119, -0.8272291, -1.843346, 1, 1, 1, 1, 1,
-1.733542, -0.8047963, -2.52322, 1, 1, 1, 1, 1,
-1.730724, -1.465803, -1.462854, 1, 1, 1, 1, 1,
-1.718353, -0.5392125, -0.9127892, 1, 1, 1, 1, 1,
-1.714392, -1.708817, -1.897477, 1, 1, 1, 1, 1,
-1.694057, 0.1408936, -2.339438, 1, 1, 1, 1, 1,
-1.688797, 0.93928, -0.5353999, 1, 1, 1, 1, 1,
-1.685074, 2.035818, -2.205659, 1, 1, 1, 1, 1,
-1.679474, 2.239019, -0.7412392, 1, 1, 1, 1, 1,
-1.662089, 0.8072259, -1.5675, 1, 1, 1, 1, 1,
-1.660879, -0.9967952, -0.7161857, 1, 1, 1, 1, 1,
-1.658159, -0.0568683, -3.68673, 0, 0, 1, 1, 1,
-1.647161, 0.4900899, -0.3580114, 1, 0, 0, 1, 1,
-1.646806, 1.197448, -0.4093974, 1, 0, 0, 1, 1,
-1.644154, -0.194308, -0.9108321, 1, 0, 0, 1, 1,
-1.640427, -0.7677652, -2.425196, 1, 0, 0, 1, 1,
-1.63788, 1.382427, -2.161188, 1, 0, 0, 1, 1,
-1.635912, 0.5927098, -1.433017, 0, 0, 0, 1, 1,
-1.632748, 0.2430337, -0.6756108, 0, 0, 0, 1, 1,
-1.627261, 0.9955962, -0.9097422, 0, 0, 0, 1, 1,
-1.62461, -0.4652089, -1.927299, 0, 0, 0, 1, 1,
-1.61905, 0.1528912, -2.225238, 0, 0, 0, 1, 1,
-1.614867, -0.5287578, -2.721955, 0, 0, 0, 1, 1,
-1.601392, -1.069575, -1.481418, 0, 0, 0, 1, 1,
-1.592237, 0.1644033, -1.684932, 1, 1, 1, 1, 1,
-1.590688, 0.6489202, -1.675001, 1, 1, 1, 1, 1,
-1.577624, 0.240329, -2.715917, 1, 1, 1, 1, 1,
-1.562351, 0.1771953, -2.770674, 1, 1, 1, 1, 1,
-1.559087, -1.1454, -2.108359, 1, 1, 1, 1, 1,
-1.550387, -0.07768063, -2.985637, 1, 1, 1, 1, 1,
-1.547169, 0.4319557, -1.523513, 1, 1, 1, 1, 1,
-1.542787, 0.6503262, 0.3142962, 1, 1, 1, 1, 1,
-1.542704, 0.06463664, -1.691722, 1, 1, 1, 1, 1,
-1.541477, 0.7031146, -2.66887, 1, 1, 1, 1, 1,
-1.519803, -0.2845552, -1.946396, 1, 1, 1, 1, 1,
-1.511396, 0.02069972, -2.833426, 1, 1, 1, 1, 1,
-1.504168, 1.149435, 1.193673, 1, 1, 1, 1, 1,
-1.503228, -0.00627407, 1.37549, 1, 1, 1, 1, 1,
-1.487288, -0.4225121, -0.5504054, 1, 1, 1, 1, 1,
-1.486801, -0.32539, -3.007069, 0, 0, 1, 1, 1,
-1.485464, -0.2371014, -0.6088494, 1, 0, 0, 1, 1,
-1.475752, -0.3883471, -2.379977, 1, 0, 0, 1, 1,
-1.467816, 0.01805101, -1.94768, 1, 0, 0, 1, 1,
-1.462098, -0.3476155, -1.915056, 1, 0, 0, 1, 1,
-1.460222, 0.2472916, -0.5385396, 1, 0, 0, 1, 1,
-1.436536, 0.3003283, -0.3476866, 0, 0, 0, 1, 1,
-1.429183, -0.8211459, -2.451713, 0, 0, 0, 1, 1,
-1.42351, 1.393811, 0.1660104, 0, 0, 0, 1, 1,
-1.419861, 0.4883288, -1.621095, 0, 0, 0, 1, 1,
-1.410891, 0.5638147, -1.11051, 0, 0, 0, 1, 1,
-1.405697, -0.9320521, -1.586504, 0, 0, 0, 1, 1,
-1.398449, 1.09724, 1.339292, 0, 0, 0, 1, 1,
-1.397029, -0.9252226, -2.322164, 1, 1, 1, 1, 1,
-1.388961, 0.5254688, -2.492806, 1, 1, 1, 1, 1,
-1.386803, 0.3709542, -2.240018, 1, 1, 1, 1, 1,
-1.368292, 1.218125, -1.569258, 1, 1, 1, 1, 1,
-1.349042, 0.0285559, 0.9091231, 1, 1, 1, 1, 1,
-1.347405, -1.835075, -0.584637, 1, 1, 1, 1, 1,
-1.343802, -1.027499, -3.415758, 1, 1, 1, 1, 1,
-1.339321, 0.3270425, -0.1414239, 1, 1, 1, 1, 1,
-1.32935, -0.11935, -2.41572, 1, 1, 1, 1, 1,
-1.326337, 0.8191564, -1.60892, 1, 1, 1, 1, 1,
-1.325507, 1.110242, -0.07234529, 1, 1, 1, 1, 1,
-1.316168, -1.493418, -2.388155, 1, 1, 1, 1, 1,
-1.314549, 0.4783061, -1.283543, 1, 1, 1, 1, 1,
-1.312117, -0.400472, -1.953994, 1, 1, 1, 1, 1,
-1.305372, 1.243801, -1.528729, 1, 1, 1, 1, 1,
-1.302792, -0.8211507, -2.089565, 0, 0, 1, 1, 1,
-1.300936, -0.7872772, -3.365299, 1, 0, 0, 1, 1,
-1.277823, -0.4627057, -3.468669, 1, 0, 0, 1, 1,
-1.25168, 0.6792014, -2.992623, 1, 0, 0, 1, 1,
-1.250128, 0.3362969, -0.1838861, 1, 0, 0, 1, 1,
-1.24904, -0.4387407, -0.6894453, 1, 0, 0, 1, 1,
-1.248022, -0.02314106, -1.738472, 0, 0, 0, 1, 1,
-1.245375, -1.105652, -1.582002, 0, 0, 0, 1, 1,
-1.243433, -0.5560204, -1.746095, 0, 0, 0, 1, 1,
-1.242182, -0.4944499, -0.599782, 0, 0, 0, 1, 1,
-1.241247, -1.048118, -1.157469, 0, 0, 0, 1, 1,
-1.232709, -0.6732574, -2.869695, 0, 0, 0, 1, 1,
-1.220965, 1.148933, -0.9744095, 0, 0, 0, 1, 1,
-1.214819, 0.3650823, -1.362038, 1, 1, 1, 1, 1,
-1.213972, 1.427223, -1.104941, 1, 1, 1, 1, 1,
-1.210383, -1.914724, -3.25621, 1, 1, 1, 1, 1,
-1.193349, 0.7218239, -3.168813, 1, 1, 1, 1, 1,
-1.188248, 2.224186, 0.922244, 1, 1, 1, 1, 1,
-1.1821, 0.09065001, -0.127834, 1, 1, 1, 1, 1,
-1.181319, 1.983331, -0.03960795, 1, 1, 1, 1, 1,
-1.176497, -1.347479, -2.442029, 1, 1, 1, 1, 1,
-1.172109, -0.8314503, -2.415981, 1, 1, 1, 1, 1,
-1.171009, 0.4722516, -1.14473, 1, 1, 1, 1, 1,
-1.168117, 0.1594575, -0.7352359, 1, 1, 1, 1, 1,
-1.166944, -1.140788, -3.992117, 1, 1, 1, 1, 1,
-1.165897, -0.6812837, -0.7751467, 1, 1, 1, 1, 1,
-1.159779, -2.289749, -2.337724, 1, 1, 1, 1, 1,
-1.159589, -0.9360623, -1.789919, 1, 1, 1, 1, 1,
-1.158202, -0.03496482, -1.452758, 0, 0, 1, 1, 1,
-1.149533, -0.8549128, -1.132386, 1, 0, 0, 1, 1,
-1.149289, 2.79186, -0.1353241, 1, 0, 0, 1, 1,
-1.144906, -1.451198, -1.288224, 1, 0, 0, 1, 1,
-1.144617, -2.119928, -3.339475, 1, 0, 0, 1, 1,
-1.139275, 0.9342056, -0.9165151, 1, 0, 0, 1, 1,
-1.136275, -0.008173799, -1.358009, 0, 0, 0, 1, 1,
-1.129475, 0.9806603, 0.3019191, 0, 0, 0, 1, 1,
-1.126909, -1.908419, -3.061953, 0, 0, 0, 1, 1,
-1.11822, -0.2832332, -1.787007, 0, 0, 0, 1, 1,
-1.102004, -0.5315257, -2.364108, 0, 0, 0, 1, 1,
-1.101816, 1.075433, 0.7615103, 0, 0, 0, 1, 1,
-1.099676, -1.578591, -3.735279, 0, 0, 0, 1, 1,
-1.09921, -1.325665, -3.334302, 1, 1, 1, 1, 1,
-1.097182, -2.102793, -4.55831, 1, 1, 1, 1, 1,
-1.092865, 0.0601511, -1.918398, 1, 1, 1, 1, 1,
-1.086834, -2.785622, -2.564073, 1, 1, 1, 1, 1,
-1.077671, -0.8219368, -2.97966, 1, 1, 1, 1, 1,
-1.069865, 1.003868, -2.154227, 1, 1, 1, 1, 1,
-1.065328, 0.2625185, -0.8627576, 1, 1, 1, 1, 1,
-1.064183, 0.05095997, -1.268154, 1, 1, 1, 1, 1,
-1.06022, 0.008166851, -0.8304117, 1, 1, 1, 1, 1,
-1.057332, -0.2931496, -1.914848, 1, 1, 1, 1, 1,
-1.041208, -0.4509532, -3.587934, 1, 1, 1, 1, 1,
-1.040401, -1.531456, -4.242501, 1, 1, 1, 1, 1,
-1.038526, -0.8345364, -2.913071, 1, 1, 1, 1, 1,
-1.030533, -0.6908088, -3.052765, 1, 1, 1, 1, 1,
-1.023487, -2.183302, -2.604213, 1, 1, 1, 1, 1,
-1.0231, 1.370574, -1.227882, 0, 0, 1, 1, 1,
-1.023077, -1.769178, -1.65735, 1, 0, 0, 1, 1,
-1.018634, -1.59866, -3.996451, 1, 0, 0, 1, 1,
-1.007952, -1.109046, -3.30678, 1, 0, 0, 1, 1,
-1.005143, 0.3173206, -0.3876338, 1, 0, 0, 1, 1,
-0.9946184, 0.005351134, -2.595987, 1, 0, 0, 1, 1,
-0.9944361, 0.2677912, -1.789083, 0, 0, 0, 1, 1,
-0.9917517, 0.3135603, -0.6028512, 0, 0, 0, 1, 1,
-0.9911295, 0.3408158, -1.884431, 0, 0, 0, 1, 1,
-0.9886573, 0.8605039, -0.6611112, 0, 0, 0, 1, 1,
-0.986427, 0.812315, -2.156502, 0, 0, 0, 1, 1,
-0.985562, 0.0397275, 0.3372062, 0, 0, 0, 1, 1,
-0.9851816, 0.05639582, -1.463399, 0, 0, 0, 1, 1,
-0.9799394, 0.06941949, -2.02642, 1, 1, 1, 1, 1,
-0.9753742, -1.011694, -3.613079, 1, 1, 1, 1, 1,
-0.974, -0.1073741, -1.235491, 1, 1, 1, 1, 1,
-0.9716694, 0.4479969, 0.1249971, 1, 1, 1, 1, 1,
-0.964103, -0.1979145, -3.189223, 1, 1, 1, 1, 1,
-0.9592192, -0.75717, -2.37608, 1, 1, 1, 1, 1,
-0.9555242, -2.186348, -2.383574, 1, 1, 1, 1, 1,
-0.9369555, -2.225567, -2.395143, 1, 1, 1, 1, 1,
-0.9309597, -0.1902477, -2.649094, 1, 1, 1, 1, 1,
-0.928424, 1.641263, -0.6133069, 1, 1, 1, 1, 1,
-0.9238386, -1.39539, -2.877633, 1, 1, 1, 1, 1,
-0.9217543, 1.328778, -0.382198, 1, 1, 1, 1, 1,
-0.9119928, 1.158712, -0.6518617, 1, 1, 1, 1, 1,
-0.9070023, 1.553952, -0.490502, 1, 1, 1, 1, 1,
-0.905389, -0.5308523, -3.149479, 1, 1, 1, 1, 1,
-0.9028906, 1.169524, 1.133597, 0, 0, 1, 1, 1,
-0.9027138, 0.0374292, -2.022161, 1, 0, 0, 1, 1,
-0.8978004, 0.4845246, -0.6801916, 1, 0, 0, 1, 1,
-0.8959262, -0.2224786, -1.586759, 1, 0, 0, 1, 1,
-0.8921386, -0.2621737, -1.755195, 1, 0, 0, 1, 1,
-0.8912781, 0.9432797, -0.6367433, 1, 0, 0, 1, 1,
-0.8896086, 0.08093241, -1.457282, 0, 0, 0, 1, 1,
-0.8893861, -1.443394, -0.1236958, 0, 0, 0, 1, 1,
-0.8848209, 0.5500925, -2.189287, 0, 0, 0, 1, 1,
-0.8846354, 0.4541723, -2.058726, 0, 0, 0, 1, 1,
-0.879521, -1.014358, -2.693784, 0, 0, 0, 1, 1,
-0.8734882, 1.106197, -1.671753, 0, 0, 0, 1, 1,
-0.8715081, 1.211367, 0.4721122, 0, 0, 0, 1, 1,
-0.8649019, -0.7203043, -2.822601, 1, 1, 1, 1, 1,
-0.8623768, -0.3010611, -1.954601, 1, 1, 1, 1, 1,
-0.8559285, -0.1507162, -1.524293, 1, 1, 1, 1, 1,
-0.8551334, 2.36289, -1.841641, 1, 1, 1, 1, 1,
-0.8460429, -0.9200202, -3.204577, 1, 1, 1, 1, 1,
-0.8451717, -0.103041, -3.702022, 1, 1, 1, 1, 1,
-0.8398544, 0.3120133, -1.540189, 1, 1, 1, 1, 1,
-0.8381561, -0.02952214, -2.535764, 1, 1, 1, 1, 1,
-0.8354447, 1.262853, -0.4584289, 1, 1, 1, 1, 1,
-0.8332449, 1.324975, 1.532788, 1, 1, 1, 1, 1,
-0.832982, -0.696263, -1.967947, 1, 1, 1, 1, 1,
-0.8298506, -0.1113265, -0.3614341, 1, 1, 1, 1, 1,
-0.827102, 0.3468768, -1.079047, 1, 1, 1, 1, 1,
-0.8234066, -0.9239892, -0.517055, 1, 1, 1, 1, 1,
-0.8217835, 0.4412883, -1.545462, 1, 1, 1, 1, 1,
-0.8179581, -0.1390154, -0.5992923, 0, 0, 1, 1, 1,
-0.8154482, 0.287295, -0.3940392, 1, 0, 0, 1, 1,
-0.8044899, 1.050155, -1.810595, 1, 0, 0, 1, 1,
-0.8012177, 0.06965815, -0.6632969, 1, 0, 0, 1, 1,
-0.8009942, -0.7769864, -2.271321, 1, 0, 0, 1, 1,
-0.7996046, 2.008192, 0.4906834, 1, 0, 0, 1, 1,
-0.7952418, 1.391484, 0.4050448, 0, 0, 0, 1, 1,
-0.7928316, 1.866274, -2.10213, 0, 0, 0, 1, 1,
-0.7917297, 1.288965, -1.968223, 0, 0, 0, 1, 1,
-0.7897482, -0.08052453, -2.829041, 0, 0, 0, 1, 1,
-0.7866513, 1.377465, -0.3740457, 0, 0, 0, 1, 1,
-0.7819529, 2.849218, 0.0686333, 0, 0, 0, 1, 1,
-0.774792, -0.169582, -3.172921, 0, 0, 0, 1, 1,
-0.7686937, 0.2327519, -2.074116, 1, 1, 1, 1, 1,
-0.7676092, 0.4755609, -1.920119, 1, 1, 1, 1, 1,
-0.7666416, -2.953018, -4.124648, 1, 1, 1, 1, 1,
-0.7660831, 1.400336, 0.05781344, 1, 1, 1, 1, 1,
-0.7624989, 0.8053965, -0.9950177, 1, 1, 1, 1, 1,
-0.7547494, 2.141716, 0.411259, 1, 1, 1, 1, 1,
-0.751078, -0.0272633, -0.4471371, 1, 1, 1, 1, 1,
-0.747201, -0.7963957, -2.141061, 1, 1, 1, 1, 1,
-0.7462949, 0.8785402, -0.6677222, 1, 1, 1, 1, 1,
-0.7459243, -1.118447, -2.212598, 1, 1, 1, 1, 1,
-0.7402325, 1.447533, -1.454729, 1, 1, 1, 1, 1,
-0.7359638, 0.2179621, -0.6748951, 1, 1, 1, 1, 1,
-0.7252756, -0.9797272, -1.92747, 1, 1, 1, 1, 1,
-0.7240377, 0.9447373, 0.2246213, 1, 1, 1, 1, 1,
-0.7228494, 0.7441642, -0.6564021, 1, 1, 1, 1, 1,
-0.7181008, -0.4405385, -2.409999, 0, 0, 1, 1, 1,
-0.7145016, -0.9232696, -2.336452, 1, 0, 0, 1, 1,
-0.7117997, 0.2298586, -2.93921, 1, 0, 0, 1, 1,
-0.7038993, 0.06462117, -0.7699444, 1, 0, 0, 1, 1,
-0.7007176, 2.391787, -0.8792175, 1, 0, 0, 1, 1,
-0.7006012, 0.2725141, 0.290977, 1, 0, 0, 1, 1,
-0.6982199, -1.724595, -3.476623, 0, 0, 0, 1, 1,
-0.6981102, 0.03417812, -0.7203415, 0, 0, 0, 1, 1,
-0.6956261, -1.245319, -1.921966, 0, 0, 0, 1, 1,
-0.6936247, -1.203059, -2.414464, 0, 0, 0, 1, 1,
-0.6934405, 1.626762, 0.3227005, 0, 0, 0, 1, 1,
-0.6913106, -0.9275131, -5.039742, 0, 0, 0, 1, 1,
-0.684772, -0.6674339, -2.342893, 0, 0, 0, 1, 1,
-0.6841403, -1.110477, -2.321572, 1, 1, 1, 1, 1,
-0.6802822, 1.665877, -0.2982548, 1, 1, 1, 1, 1,
-0.6738732, -0.2716052, -0.7355196, 1, 1, 1, 1, 1,
-0.6736496, -0.2552769, -2.451405, 1, 1, 1, 1, 1,
-0.6688008, 0.5557231, -0.2340013, 1, 1, 1, 1, 1,
-0.6597782, 0.5074406, -1.303334, 1, 1, 1, 1, 1,
-0.6585231, 0.2030954, -1.027897, 1, 1, 1, 1, 1,
-0.6579919, 0.5136563, 0.5444891, 1, 1, 1, 1, 1,
-0.6493452, 1.011599, -2.264473, 1, 1, 1, 1, 1,
-0.6444875, 0.3027372, -0.546914, 1, 1, 1, 1, 1,
-0.6427156, -1.305664, -2.819942, 1, 1, 1, 1, 1,
-0.6407461, 0.1286775, -1.406, 1, 1, 1, 1, 1,
-0.6407305, 0.8227904, -0.9192451, 1, 1, 1, 1, 1,
-0.6405663, -0.717636, -4.05631, 1, 1, 1, 1, 1,
-0.6360673, -1.304284, -4.239103, 1, 1, 1, 1, 1,
-0.6284735, 0.5161485, -1.090592, 0, 0, 1, 1, 1,
-0.6186696, -1.844101, -3.920883, 1, 0, 0, 1, 1,
-0.6011168, -0.2047098, -0.8023505, 1, 0, 0, 1, 1,
-0.6005136, -0.08491229, -1.361377, 1, 0, 0, 1, 1,
-0.6003722, 0.9252298, -2.069735, 1, 0, 0, 1, 1,
-0.5999756, 0.3655924, 0.7711036, 1, 0, 0, 1, 1,
-0.5989621, -0.5725103, -3.869192, 0, 0, 0, 1, 1,
-0.5979729, -1.629997, -2.300895, 0, 0, 0, 1, 1,
-0.5916538, 1.408211, 0.1794458, 0, 0, 0, 1, 1,
-0.5894113, 0.2353944, -1.149887, 0, 0, 0, 1, 1,
-0.5875248, 1.726272, 0.1713054, 0, 0, 0, 1, 1,
-0.5843995, 0.197659, -0.5229901, 0, 0, 0, 1, 1,
-0.583952, 0.1015894, -1.352794, 0, 0, 0, 1, 1,
-0.5828392, 0.4460271, -1.881898, 1, 1, 1, 1, 1,
-0.5749729, -1.953682, -3.459797, 1, 1, 1, 1, 1,
-0.5748635, -2.010278, -2.037488, 1, 1, 1, 1, 1,
-0.5747676, -2.473959, -3.143428, 1, 1, 1, 1, 1,
-0.5697602, -0.5147735, -2.455812, 1, 1, 1, 1, 1,
-0.558822, -0.272368, -2.331564, 1, 1, 1, 1, 1,
-0.5572936, -0.8699923, -3.486305, 1, 1, 1, 1, 1,
-0.5550832, -0.5932074, -1.619402, 1, 1, 1, 1, 1,
-0.5433047, 2.48362, -2.023497, 1, 1, 1, 1, 1,
-0.5398079, 0.3109072, -1.399647, 1, 1, 1, 1, 1,
-0.5382312, -2.545338, -2.19314, 1, 1, 1, 1, 1,
-0.5365846, 2.030329, -1.210493, 1, 1, 1, 1, 1,
-0.5350788, 1.453711, 0.3839782, 1, 1, 1, 1, 1,
-0.53205, -0.5308313, -3.664054, 1, 1, 1, 1, 1,
-0.5316249, -1.019604, -2.179533, 1, 1, 1, 1, 1,
-0.530749, -0.8272396, -3.012126, 0, 0, 1, 1, 1,
-0.5274125, -0.1836987, -3.611071, 1, 0, 0, 1, 1,
-0.5217761, 0.3351732, -1.026751, 1, 0, 0, 1, 1,
-0.5172772, 1.888528, -1.181238, 1, 0, 0, 1, 1,
-0.5171005, -0.6741387, -3.318526, 1, 0, 0, 1, 1,
-0.5123209, -0.8961702, -1.70102, 1, 0, 0, 1, 1,
-0.5092394, 0.1932734, -1.410342, 0, 0, 0, 1, 1,
-0.5077528, -0.02698499, -1.764696, 0, 0, 0, 1, 1,
-0.5071967, 0.936031, -0.961968, 0, 0, 0, 1, 1,
-0.5039773, -0.5932691, -2.666758, 0, 0, 0, 1, 1,
-0.4990411, -1.226176, -1.229934, 0, 0, 0, 1, 1,
-0.4979253, 0.01478644, -2.410982, 0, 0, 0, 1, 1,
-0.4945879, 0.3542038, -1.084026, 0, 0, 0, 1, 1,
-0.4816291, -1.189331, -2.002081, 1, 1, 1, 1, 1,
-0.4816141, 0.355698, -0.775568, 1, 1, 1, 1, 1,
-0.4782329, -1.204814, -2.136992, 1, 1, 1, 1, 1,
-0.476594, -0.0683175, -0.5471467, 1, 1, 1, 1, 1,
-0.4761515, -0.4049835, -2.106962, 1, 1, 1, 1, 1,
-0.4737244, -1.490415, -4.828798, 1, 1, 1, 1, 1,
-0.4654083, 0.4270107, -0.7014699, 1, 1, 1, 1, 1,
-0.461098, -0.0582053, -2.758442, 1, 1, 1, 1, 1,
-0.4547703, -0.90316, -3.550498, 1, 1, 1, 1, 1,
-0.4513192, 1.279902, -1.486054, 1, 1, 1, 1, 1,
-0.4504436, 1.117852, 1.242796, 1, 1, 1, 1, 1,
-0.4496121, 0.19507, 1.884998, 1, 1, 1, 1, 1,
-0.4490405, 0.313371, -0.2292317, 1, 1, 1, 1, 1,
-0.4473509, 1.014637, 0.1090692, 1, 1, 1, 1, 1,
-0.44727, -0.9090561, -3.438143, 1, 1, 1, 1, 1,
-0.4462937, 0.459231, -0.8156137, 0, 0, 1, 1, 1,
-0.4420381, -0.9174439, -2.351174, 1, 0, 0, 1, 1,
-0.436201, -0.7739615, -3.668707, 1, 0, 0, 1, 1,
-0.4345371, -2.276676, -4.262279, 1, 0, 0, 1, 1,
-0.4343019, 1.176313, 0.6230657, 1, 0, 0, 1, 1,
-0.4306956, 0.100095, -2.09924, 1, 0, 0, 1, 1,
-0.4289995, -0.5141067, -1.637166, 0, 0, 0, 1, 1,
-0.4261732, -0.6885027, -3.808959, 0, 0, 0, 1, 1,
-0.4242858, -0.2320897, -2.526838, 0, 0, 0, 1, 1,
-0.4210322, -0.4252174, -1.818964, 0, 0, 0, 1, 1,
-0.4189186, 1.236007, -1.82919, 0, 0, 0, 1, 1,
-0.417458, -0.249604, -1.627098, 0, 0, 0, 1, 1,
-0.4154999, -0.02091406, -2.305793, 0, 0, 0, 1, 1,
-0.4147724, 0.2238642, -0.855497, 1, 1, 1, 1, 1,
-0.4123135, 1.192263, 0.6245133, 1, 1, 1, 1, 1,
-0.406497, -2.286863, -3.169359, 1, 1, 1, 1, 1,
-0.4060994, 0.05043079, -2.131881, 1, 1, 1, 1, 1,
-0.4037328, -1.348346, -1.732737, 1, 1, 1, 1, 1,
-0.3954504, -1.765737, -1.785072, 1, 1, 1, 1, 1,
-0.3930385, 1.444641, 1.46261, 1, 1, 1, 1, 1,
-0.3915865, -0.7423337, -4.012048, 1, 1, 1, 1, 1,
-0.3889011, 2.6452, 0.2861877, 1, 1, 1, 1, 1,
-0.3887968, 2.131528, 1.001183, 1, 1, 1, 1, 1,
-0.3880325, 0.5874019, -0.9738013, 1, 1, 1, 1, 1,
-0.3817307, -2.285995, -3.209214, 1, 1, 1, 1, 1,
-0.3738307, -0.1386696, -2.859265, 1, 1, 1, 1, 1,
-0.369963, 0.3655902, 0.3135321, 1, 1, 1, 1, 1,
-0.3687541, -0.06717821, -1.455777, 1, 1, 1, 1, 1,
-0.3686553, 0.4194385, 0.0786733, 0, 0, 1, 1, 1,
-0.3684814, 0.1419481, -1.780274, 1, 0, 0, 1, 1,
-0.3673242, 0.1267804, -0.9048904, 1, 0, 0, 1, 1,
-0.3640729, -0.4933867, -1.360295, 1, 0, 0, 1, 1,
-0.3633199, -1.02881, -2.780294, 1, 0, 0, 1, 1,
-0.3606491, -0.3353962, -2.80006, 1, 0, 0, 1, 1,
-0.3593549, 0.2787101, 0.8370444, 0, 0, 0, 1, 1,
-0.3515214, 1.840531, -0.1384525, 0, 0, 0, 1, 1,
-0.3466753, 0.6617295, -2.96898, 0, 0, 0, 1, 1,
-0.3464648, 1.070018, 0.05659682, 0, 0, 0, 1, 1,
-0.3420565, 0.6055647, -1.167624, 0, 0, 0, 1, 1,
-0.3392171, -2.705974, -3.719509, 0, 0, 0, 1, 1,
-0.3376938, -0.6495038, -2.434708, 0, 0, 0, 1, 1,
-0.3339148, -0.8268818, -1.357342, 1, 1, 1, 1, 1,
-0.3335533, -0.4070532, -2.649902, 1, 1, 1, 1, 1,
-0.3330019, -2.155692, -3.233306, 1, 1, 1, 1, 1,
-0.3322893, -0.04665164, -1.325522, 1, 1, 1, 1, 1,
-0.329453, -0.9888697, -3.203486, 1, 1, 1, 1, 1,
-0.3279257, -0.2132693, -2.513625, 1, 1, 1, 1, 1,
-0.326071, -0.810909, -4.13272, 1, 1, 1, 1, 1,
-0.3245663, -0.4822866, -2.066007, 1, 1, 1, 1, 1,
-0.3243507, -0.1250223, -1.655272, 1, 1, 1, 1, 1,
-0.3236854, -0.1030981, -2.098908, 1, 1, 1, 1, 1,
-0.3210431, -0.9023725, -3.899077, 1, 1, 1, 1, 1,
-0.3156939, 1.515639, -1.730693, 1, 1, 1, 1, 1,
-0.309135, -1.179207, -2.086194, 1, 1, 1, 1, 1,
-0.3086147, -0.9940595, -1.118858, 1, 1, 1, 1, 1,
-0.3065816, -0.1414953, -1.662114, 1, 1, 1, 1, 1,
-0.3053527, 1.222437, -0.5464159, 0, 0, 1, 1, 1,
-0.3023335, 0.08233963, -1.830518, 1, 0, 0, 1, 1,
-0.3017864, -0.1767565, -3.336562, 1, 0, 0, 1, 1,
-0.2971191, -0.5363338, -2.160676, 1, 0, 0, 1, 1,
-0.2940539, -0.7423072, -2.349712, 1, 0, 0, 1, 1,
-0.2882178, 1.25664, -0.648931, 1, 0, 0, 1, 1,
-0.2844477, 0.7135621, -0.2820021, 0, 0, 0, 1, 1,
-0.2806107, 0.624632, -1.608543, 0, 0, 0, 1, 1,
-0.2787814, 0.5415875, -0.808258, 0, 0, 0, 1, 1,
-0.2783735, 1.569771, 0.1126841, 0, 0, 0, 1, 1,
-0.2779768, 1.030238, 0.00541972, 0, 0, 0, 1, 1,
-0.2747005, 1.228832, -0.3256116, 0, 0, 0, 1, 1,
-0.2700914, 0.3583497, 0.9621234, 0, 0, 0, 1, 1,
-0.2629028, -2.144124, -4.352712, 1, 1, 1, 1, 1,
-0.258616, -1.080808, -2.295227, 1, 1, 1, 1, 1,
-0.2583113, -2.102702, -2.419094, 1, 1, 1, 1, 1,
-0.2404924, 0.9001332, -0.1896387, 1, 1, 1, 1, 1,
-0.235942, -2.323398, -3.932315, 1, 1, 1, 1, 1,
-0.2354106, 0.3028582, -0.529236, 1, 1, 1, 1, 1,
-0.2313214, -0.2018513, -4.580957, 1, 1, 1, 1, 1,
-0.2225716, -0.4794086, -2.212743, 1, 1, 1, 1, 1,
-0.2175007, -1.290469, -2.251214, 1, 1, 1, 1, 1,
-0.209959, -0.04229207, -3.46752, 1, 1, 1, 1, 1,
-0.209663, -1.228264, -1.690584, 1, 1, 1, 1, 1,
-0.205348, 0.4214021, -0.5044191, 1, 1, 1, 1, 1,
-0.2045112, -0.2904715, -2.119314, 1, 1, 1, 1, 1,
-0.199339, 0.0264821, -1.4091, 1, 1, 1, 1, 1,
-0.196825, 1.806297, -0.1968044, 1, 1, 1, 1, 1,
-0.195787, -2.238116, -2.091066, 0, 0, 1, 1, 1,
-0.1935061, 0.922665, -0.1343099, 1, 0, 0, 1, 1,
-0.1865245, -0.560941, -1.878113, 1, 0, 0, 1, 1,
-0.1839823, -1.904013, -3.770477, 1, 0, 0, 1, 1,
-0.1768039, -0.7460447, -2.78577, 1, 0, 0, 1, 1,
-0.17309, -0.8287771, -2.000235, 1, 0, 0, 1, 1,
-0.1730135, -0.9629543, -3.617258, 0, 0, 0, 1, 1,
-0.171086, -1.149777, -0.9899756, 0, 0, 0, 1, 1,
-0.170896, 0.2388784, -1.074212, 0, 0, 0, 1, 1,
-0.1701252, -1.374806, -1.79096, 0, 0, 0, 1, 1,
-0.1661399, -2.396979, -3.254966, 0, 0, 0, 1, 1,
-0.165994, -0.2177523, 0.8661317, 0, 0, 0, 1, 1,
-0.1653344, -0.6142474, -3.005959, 0, 0, 0, 1, 1,
-0.1631254, 0.5974084, -0.7139962, 1, 1, 1, 1, 1,
-0.1628444, -0.3847046, -3.605728, 1, 1, 1, 1, 1,
-0.1614952, 1.404331, -0.3464917, 1, 1, 1, 1, 1,
-0.1608711, 0.4910092, -2.396137, 1, 1, 1, 1, 1,
-0.1607534, 0.6787112, 0.3341834, 1, 1, 1, 1, 1,
-0.1605104, 0.4403742, -0.3618585, 1, 1, 1, 1, 1,
-0.1521447, -0.8044333, -3.319147, 1, 1, 1, 1, 1,
-0.147225, -0.5044991, -2.664801, 1, 1, 1, 1, 1,
-0.1468839, 0.08290744, -1.699592, 1, 1, 1, 1, 1,
-0.1462393, 0.2054018, -3.817648, 1, 1, 1, 1, 1,
-0.1410565, -0.5140729, -3.472824, 1, 1, 1, 1, 1,
-0.1407584, 0.9306259, -1.621831, 1, 1, 1, 1, 1,
-0.135371, -0.06071486, -2.458103, 1, 1, 1, 1, 1,
-0.1325231, 2.226316, 0.1912399, 1, 1, 1, 1, 1,
-0.1297217, 0.7667745, 0.7869834, 1, 1, 1, 1, 1,
-0.1267036, -1.760593, -1.566289, 0, 0, 1, 1, 1,
-0.1249795, -0.2480769, -2.577712, 1, 0, 0, 1, 1,
-0.1223112, 0.2825337, -1.857786, 1, 0, 0, 1, 1,
-0.1222807, 0.9226436, 0.3529258, 1, 0, 0, 1, 1,
-0.1219976, -1.079572, -4.709249, 1, 0, 0, 1, 1,
-0.1213178, 0.5063524, -0.8414463, 1, 0, 0, 1, 1,
-0.1211812, 2.504405, 0.5335667, 0, 0, 0, 1, 1,
-0.1196662, 0.05580881, -2.008557, 0, 0, 0, 1, 1,
-0.1190285, 0.2608382, 0.2013294, 0, 0, 0, 1, 1,
-0.1186689, -1.108591, -2.261778, 0, 0, 0, 1, 1,
-0.1139942, 1.297169, 0.7775325, 0, 0, 0, 1, 1,
-0.1134437, 0.4488185, -0.004447058, 0, 0, 0, 1, 1,
-0.1128411, 0.53405, -0.2666545, 0, 0, 0, 1, 1,
-0.1096814, 1.409695, -0.9302188, 1, 1, 1, 1, 1,
-0.1085411, -0.6929391, -4.095584, 1, 1, 1, 1, 1,
-0.1076348, 0.325705, 0.4611245, 1, 1, 1, 1, 1,
-0.1046612, -1.239318, -3.490014, 1, 1, 1, 1, 1,
-0.1042071, 1.94785, -1.205398, 1, 1, 1, 1, 1,
-0.1038982, -0.3544159, -2.491246, 1, 1, 1, 1, 1,
-0.1030738, -1.620316, -3.778886, 1, 1, 1, 1, 1,
-0.1018076, 0.3511983, -0.09182021, 1, 1, 1, 1, 1,
-0.09694973, 0.01901063, -2.613423, 1, 1, 1, 1, 1,
-0.09631325, 0.9137461, -0.4979317, 1, 1, 1, 1, 1,
-0.09138618, 1.54634, 0.7431219, 1, 1, 1, 1, 1,
-0.09014692, -0.2530705, -4.331908, 1, 1, 1, 1, 1,
-0.08849085, 0.429992, 1.378544, 1, 1, 1, 1, 1,
-0.08789648, 0.2092271, -0.417503, 1, 1, 1, 1, 1,
-0.07913419, -0.4976856, -5.720821, 1, 1, 1, 1, 1,
-0.078694, 0.4340123, -2.464792, 0, 0, 1, 1, 1,
-0.07679466, -1.766026, -1.692813, 1, 0, 0, 1, 1,
-0.07136675, 0.7451358, 0.169271, 1, 0, 0, 1, 1,
-0.06583267, 0.5265434, 0.3108047, 1, 0, 0, 1, 1,
-0.05997509, -0.7255384, -3.368262, 1, 0, 0, 1, 1,
-0.049647, 0.1180879, -0.9735538, 1, 0, 0, 1, 1,
-0.04810594, 0.05759298, -0.3249567, 0, 0, 0, 1, 1,
-0.04678627, -0.2531759, -4.281743, 0, 0, 0, 1, 1,
-0.04275214, 0.9451568, 0.1490248, 0, 0, 0, 1, 1,
-0.04267783, -0.284553, -2.897686, 0, 0, 0, 1, 1,
-0.04107631, 0.5105121, -0.5204598, 0, 0, 0, 1, 1,
-0.03835424, -2.821344, -2.785789, 0, 0, 0, 1, 1,
-0.03767747, 0.4356585, 0.3015581, 0, 0, 0, 1, 1,
-0.02675118, -0.5034755, -1.978773, 1, 1, 1, 1, 1,
-0.02588726, -0.4717597, -2.750474, 1, 1, 1, 1, 1,
-0.0245032, 2.189708, 2.080581, 1, 1, 1, 1, 1,
-0.02069343, -1.095842, -1.791346, 1, 1, 1, 1, 1,
-0.01935714, -0.2174383, -2.542598, 1, 1, 1, 1, 1,
-0.01550295, -0.3943182, -1.758437, 1, 1, 1, 1, 1,
-0.01261424, -0.07880244, -3.10299, 1, 1, 1, 1, 1,
-0.009659716, 0.5491422, -0.4374408, 1, 1, 1, 1, 1,
-0.005524557, -1.173878, -2.84532, 1, 1, 1, 1, 1,
-0.004439785, 1.349022, 0.9235826, 1, 1, 1, 1, 1,
-0.003785279, 0.2419226, -1.051032, 1, 1, 1, 1, 1,
0.001264568, 0.0752843, 0.5452316, 1, 1, 1, 1, 1,
0.003024587, -2.022534, 4.10024, 1, 1, 1, 1, 1,
0.003910591, -0.1734872, 3.379377, 1, 1, 1, 1, 1,
0.004816012, 0.5597988, 0.2801819, 1, 1, 1, 1, 1,
0.006436983, -0.3561986, 3.97496, 0, 0, 1, 1, 1,
0.009721437, -0.3931699, 2.959041, 1, 0, 0, 1, 1,
0.01209593, -0.4730368, 1.551665, 1, 0, 0, 1, 1,
0.01213165, 1.494899, -0.007555252, 1, 0, 0, 1, 1,
0.01433936, -2.320722, 3.649046, 1, 0, 0, 1, 1,
0.01574361, -0.06078281, 2.225307, 1, 0, 0, 1, 1,
0.02050916, -0.1806698, 3.588256, 0, 0, 0, 1, 1,
0.03124027, -0.1544694, 4.054284, 0, 0, 0, 1, 1,
0.03245725, 2.29406, -0.5564486, 0, 0, 0, 1, 1,
0.03607003, -0.5931343, 2.760367, 0, 0, 0, 1, 1,
0.03712717, -0.6105132, 2.008689, 0, 0, 0, 1, 1,
0.03752339, 1.983024, -0.4825259, 0, 0, 0, 1, 1,
0.04061053, 0.6461998, -1.15078, 0, 0, 0, 1, 1,
0.04062931, 2.614867, 1.074962, 1, 1, 1, 1, 1,
0.0410195, 0.423155, 1.051361, 1, 1, 1, 1, 1,
0.04221435, 1.768964, 1.830188, 1, 1, 1, 1, 1,
0.04244258, -0.4496162, 2.915404, 1, 1, 1, 1, 1,
0.04332058, -0.9080403, 2.631444, 1, 1, 1, 1, 1,
0.04769569, -0.1467228, 2.480395, 1, 1, 1, 1, 1,
0.05138447, -0.1094539, 1.250408, 1, 1, 1, 1, 1,
0.05668993, -1.181504, 3.46667, 1, 1, 1, 1, 1,
0.05726685, -0.4732542, 2.044369, 1, 1, 1, 1, 1,
0.05890705, 0.4333973, 0.1231061, 1, 1, 1, 1, 1,
0.06103863, -0.05406135, 2.691219, 1, 1, 1, 1, 1,
0.06435975, -0.5627196, 1.972817, 1, 1, 1, 1, 1,
0.06772435, 1.495637, 0.5882666, 1, 1, 1, 1, 1,
0.07379471, -0.232414, 4.090618, 1, 1, 1, 1, 1,
0.07413551, -0.7217739, 3.19919, 1, 1, 1, 1, 1,
0.07623093, -0.08120665, 1.773948, 0, 0, 1, 1, 1,
0.07771226, 0.9779775, 0.02502487, 1, 0, 0, 1, 1,
0.08064687, 0.3247154, -0.3877997, 1, 0, 0, 1, 1,
0.08149916, 0.5864787, -0.206118, 1, 0, 0, 1, 1,
0.08333907, 0.6239448, 1.752515, 1, 0, 0, 1, 1,
0.08528064, -1.068983, 1.752762, 1, 0, 0, 1, 1,
0.09008469, 0.7251779, 0.5392161, 0, 0, 0, 1, 1,
0.09801157, -0.3204218, 2.490537, 0, 0, 0, 1, 1,
0.1024224, -0.463075, 2.084422, 0, 0, 0, 1, 1,
0.1024253, -1.595479, 1.691466, 0, 0, 0, 1, 1,
0.1050689, -1.379239, 1.91972, 0, 0, 0, 1, 1,
0.1082722, 3.403251, -0.8293016, 0, 0, 0, 1, 1,
0.1206188, 1.279465, -0.8572667, 0, 0, 0, 1, 1,
0.121013, 0.3419297, 0.4914579, 1, 1, 1, 1, 1,
0.1243397, 0.532587, -1.502497, 1, 1, 1, 1, 1,
0.1291952, 0.200474, 2.078458, 1, 1, 1, 1, 1,
0.1328547, 0.9674527, 2.212743, 1, 1, 1, 1, 1,
0.1350799, -0.3855525, 3.334487, 1, 1, 1, 1, 1,
0.1359631, -0.7143633, 3.448611, 1, 1, 1, 1, 1,
0.1405308, 0.0280854, 3.301739, 1, 1, 1, 1, 1,
0.1439796, -0.7129826, 3.102709, 1, 1, 1, 1, 1,
0.1447477, -0.4914347, 4.247705, 1, 1, 1, 1, 1,
0.1463885, -2.536273, 2.658547, 1, 1, 1, 1, 1,
0.1482382, -1.089127, 2.786743, 1, 1, 1, 1, 1,
0.1520924, -1.567133, 1.719071, 1, 1, 1, 1, 1,
0.1545942, 0.8992366, -0.5219069, 1, 1, 1, 1, 1,
0.1547003, 0.05167184, 0.5119696, 1, 1, 1, 1, 1,
0.1558093, 0.5192218, -0.03456853, 1, 1, 1, 1, 1,
0.1575622, -0.06228976, 0.8116633, 0, 0, 1, 1, 1,
0.1584404, -0.5332421, 2.093476, 1, 0, 0, 1, 1,
0.1595041, -0.7072955, 2.620561, 1, 0, 0, 1, 1,
0.1626794, -1.15152, 2.599236, 1, 0, 0, 1, 1,
0.164442, -0.6916309, 2.469712, 1, 0, 0, 1, 1,
0.1692731, -0.8880354, 2.973511, 1, 0, 0, 1, 1,
0.1715388, -0.2098489, 2.170448, 0, 0, 0, 1, 1,
0.1745782, -1.76126, 2.389721, 0, 0, 0, 1, 1,
0.1759234, -1.624062, 2.21859, 0, 0, 0, 1, 1,
0.1770937, 1.548124, -0.1975013, 0, 0, 0, 1, 1,
0.1815561, -1.199355, 3.594803, 0, 0, 0, 1, 1,
0.1823349, -1.267326, 2.298271, 0, 0, 0, 1, 1,
0.182771, -0.7948987, 4.208337, 0, 0, 0, 1, 1,
0.1845241, 0.833939, -1.651358, 1, 1, 1, 1, 1,
0.1851201, -0.143189, 2.62582, 1, 1, 1, 1, 1,
0.1853995, 0.5821074, -0.4211301, 1, 1, 1, 1, 1,
0.1889738, -0.2380772, 2.224823, 1, 1, 1, 1, 1,
0.1896401, 0.3339837, -0.2468817, 1, 1, 1, 1, 1,
0.1937686, 0.2890698, 1.175223, 1, 1, 1, 1, 1,
0.1990422, -0.4258268, 2.796046, 1, 1, 1, 1, 1,
0.1992441, 0.149935, 0.4472593, 1, 1, 1, 1, 1,
0.200487, -0.3086031, 1.920571, 1, 1, 1, 1, 1,
0.2021091, -0.4222067, 1.124089, 1, 1, 1, 1, 1,
0.2052594, 1.220184, -0.7258258, 1, 1, 1, 1, 1,
0.2089865, 1.272709, -0.3926458, 1, 1, 1, 1, 1,
0.2092246, 0.4115931, -0.0727512, 1, 1, 1, 1, 1,
0.2152599, 1.465923, -0.2849396, 1, 1, 1, 1, 1,
0.2202204, 0.8469814, -0.4475145, 1, 1, 1, 1, 1,
0.2218566, -0.7829551, 3.137837, 0, 0, 1, 1, 1,
0.2236774, 0.3383287, 1.992461, 1, 0, 0, 1, 1,
0.2244826, 2.501766, 1.858751, 1, 0, 0, 1, 1,
0.228603, -1.059389, 2.827141, 1, 0, 0, 1, 1,
0.2320492, -0.7572995, 2.541937, 1, 0, 0, 1, 1,
0.2336183, -0.4015118, 2.888696, 1, 0, 0, 1, 1,
0.2356454, 0.3792264, 1.166963, 0, 0, 0, 1, 1,
0.2361797, 1.243911, -1.64499, 0, 0, 0, 1, 1,
0.2374785, -0.7697455, 3.495841, 0, 0, 0, 1, 1,
0.2384982, 0.6615785, 0.642023, 0, 0, 0, 1, 1,
0.2418567, -0.9020076, 2.350778, 0, 0, 0, 1, 1,
0.2487846, 0.2924867, 0.38358, 0, 0, 0, 1, 1,
0.2610021, -0.1061703, 1.960534, 0, 0, 0, 1, 1,
0.2623799, -0.6530212, 4.88805, 1, 1, 1, 1, 1,
0.2644363, -0.9728697, 1.09242, 1, 1, 1, 1, 1,
0.2645353, -1.319202, 3.182232, 1, 1, 1, 1, 1,
0.266082, -1.793313, 3.78578, 1, 1, 1, 1, 1,
0.2699761, -0.4288893, 2.593816, 1, 1, 1, 1, 1,
0.2710499, -0.5471928, 2.640136, 1, 1, 1, 1, 1,
0.2735077, 0.5602424, 0.4265301, 1, 1, 1, 1, 1,
0.2762229, 1.867991, -0.3181297, 1, 1, 1, 1, 1,
0.2774364, -1.566339, 3.642916, 1, 1, 1, 1, 1,
0.2853844, -0.7552629, 5.155141, 1, 1, 1, 1, 1,
0.2890923, 0.3081054, 1.611878, 1, 1, 1, 1, 1,
0.3028345, 0.9440904, -0.5083085, 1, 1, 1, 1, 1,
0.3031266, -0.1173123, 1.755921, 1, 1, 1, 1, 1,
0.3035411, -0.9454222, 2.242799, 1, 1, 1, 1, 1,
0.3048533, 0.1343584, 2.526575, 1, 1, 1, 1, 1,
0.3066557, 0.2726875, 2.435012, 0, 0, 1, 1, 1,
0.3094681, 1.674926, 1.76483, 1, 0, 0, 1, 1,
0.3101987, -0.07390021, 1.536231, 1, 0, 0, 1, 1,
0.3127654, 0.7219236, -1.28068, 1, 0, 0, 1, 1,
0.3127694, -0.04737307, 0.8880099, 1, 0, 0, 1, 1,
0.3129671, 1.250271, 0.7887805, 1, 0, 0, 1, 1,
0.3129727, 0.6777659, -0.7226257, 0, 0, 0, 1, 1,
0.3137872, -0.02908506, 3.244565, 0, 0, 0, 1, 1,
0.3141427, -0.1202855, 1.809893, 0, 0, 0, 1, 1,
0.3151349, 0.7719868, 0.7989801, 0, 0, 0, 1, 1,
0.3188101, -0.2122425, 3.487818, 0, 0, 0, 1, 1,
0.320446, 0.808655, 0.2515587, 0, 0, 0, 1, 1,
0.3296446, -2.414923, 3.65678, 0, 0, 0, 1, 1,
0.3298139, -0.6593851, 2.243761, 1, 1, 1, 1, 1,
0.3306677, -0.6641351, 5.199236, 1, 1, 1, 1, 1,
0.3309592, -2.088981, 4.194184, 1, 1, 1, 1, 1,
0.3311049, 1.038503, -0.72519, 1, 1, 1, 1, 1,
0.3311529, -0.08176451, 2.864497, 1, 1, 1, 1, 1,
0.3313406, 1.047666, -1.012364, 1, 1, 1, 1, 1,
0.3333288, 0.8977914, 2.040282, 1, 1, 1, 1, 1,
0.342573, -1.677425, 4.163352, 1, 1, 1, 1, 1,
0.344748, 0.952463, 0.1844281, 1, 1, 1, 1, 1,
0.3454667, 0.09421908, 1.209397, 1, 1, 1, 1, 1,
0.3456182, -0.95433, 3.25194, 1, 1, 1, 1, 1,
0.3484685, -0.9271483, 2.473892, 1, 1, 1, 1, 1,
0.3516535, 1.167853, 2.885947, 1, 1, 1, 1, 1,
0.352537, 0.4946545, -0.2619097, 1, 1, 1, 1, 1,
0.3595484, -0.1932513, 1.405953, 1, 1, 1, 1, 1,
0.3609001, -0.2982011, 2.200991, 0, 0, 1, 1, 1,
0.3612115, -0.1159958, 2.881585, 1, 0, 0, 1, 1,
0.3616168, 0.9897814, 0.4872705, 1, 0, 0, 1, 1,
0.3663369, 0.4832383, -0.003073358, 1, 0, 0, 1, 1,
0.3667682, 1.735908, -0.7422928, 1, 0, 0, 1, 1,
0.3687775, 0.6622451, 3.514432, 1, 0, 0, 1, 1,
0.3698184, 0.1576548, 0.76746, 0, 0, 0, 1, 1,
0.3702258, -0.7359225, 3.884929, 0, 0, 0, 1, 1,
0.3709264, 0.3768871, 1.218749, 0, 0, 0, 1, 1,
0.3732062, -1.509935, 1.129416, 0, 0, 0, 1, 1,
0.3779555, 0.006892237, 2.310256, 0, 0, 0, 1, 1,
0.3785206, 0.1523661, -0.1252346, 0, 0, 0, 1, 1,
0.3810693, 1.119121, 1.711529, 0, 0, 0, 1, 1,
0.3833295, -0.4382797, 3.8503, 1, 1, 1, 1, 1,
0.3839523, 0.5409603, 1.426413, 1, 1, 1, 1, 1,
0.3875425, -0.9947768, 0.6240406, 1, 1, 1, 1, 1,
0.3928459, 0.231559, 3.201707, 1, 1, 1, 1, 1,
0.3975447, 1.172494, -0.8640529, 1, 1, 1, 1, 1,
0.4037384, -1.006768, 4.58812, 1, 1, 1, 1, 1,
0.4097585, -1.248844, 4.464911, 1, 1, 1, 1, 1,
0.4099203, 0.7710978, 1.116757, 1, 1, 1, 1, 1,
0.4102356, 0.1402531, -0.5004206, 1, 1, 1, 1, 1,
0.4164119, 0.1493202, 2.253133, 1, 1, 1, 1, 1,
0.4247147, 0.5262323, 0.8669829, 1, 1, 1, 1, 1,
0.4249758, 1.668984, 0.7753298, 1, 1, 1, 1, 1,
0.4294182, 0.1259846, 2.224725, 1, 1, 1, 1, 1,
0.4321759, 0.6872687, 0.6541404, 1, 1, 1, 1, 1,
0.4356304, 0.2834184, 0.5204622, 1, 1, 1, 1, 1,
0.4392419, -0.2342331, 3.50903, 0, 0, 1, 1, 1,
0.4413053, -0.2487045, 2.704358, 1, 0, 0, 1, 1,
0.4417161, -0.278565, 0.3376971, 1, 0, 0, 1, 1,
0.4549915, -0.7187489, 2.690086, 1, 0, 0, 1, 1,
0.4586187, -1.09354, 0.511753, 1, 0, 0, 1, 1,
0.4609748, 2.436016, -1.082357, 1, 0, 0, 1, 1,
0.4662382, 1.632548, 0.4434564, 0, 0, 0, 1, 1,
0.4667095, -2.142518, 3.386361, 0, 0, 0, 1, 1,
0.4693862, -1.422938, 2.293317, 0, 0, 0, 1, 1,
0.4726382, -0.7348515, 3.821019, 0, 0, 0, 1, 1,
0.4741774, -0.04801619, 3.458805, 0, 0, 0, 1, 1,
0.4758986, -0.4661393, 3.610248, 0, 0, 0, 1, 1,
0.4785537, -0.5177934, 1.576048, 0, 0, 0, 1, 1,
0.4799951, 0.4407639, -0.8187439, 1, 1, 1, 1, 1,
0.4820993, -0.06629518, 1.666631, 1, 1, 1, 1, 1,
0.4849093, 1.538704, 0.07869487, 1, 1, 1, 1, 1,
0.4857453, 0.2403677, 1.81635, 1, 1, 1, 1, 1,
0.4886692, -0.5498816, 0.1681155, 1, 1, 1, 1, 1,
0.4931488, -0.3031466, 1.746054, 1, 1, 1, 1, 1,
0.4941196, 0.9044459, -0.570713, 1, 1, 1, 1, 1,
0.495513, 0.4199794, 1.691045, 1, 1, 1, 1, 1,
0.5012943, 0.3894028, 1.813774, 1, 1, 1, 1, 1,
0.5043383, 0.2509795, 1.461173, 1, 1, 1, 1, 1,
0.5044146, 0.2557615, 1.058014, 1, 1, 1, 1, 1,
0.5059261, 0.1085867, 0.4745084, 1, 1, 1, 1, 1,
0.5073526, 0.06579375, 2.020346, 1, 1, 1, 1, 1,
0.5128024, 0.05826246, 2.454381, 1, 1, 1, 1, 1,
0.5165719, 0.4811615, -0.102565, 1, 1, 1, 1, 1,
0.5217062, -1.126826, 2.612696, 0, 0, 1, 1, 1,
0.5246899, -0.7415521, 0.7854474, 1, 0, 0, 1, 1,
0.5268254, 0.3744005, 1.758168, 1, 0, 0, 1, 1,
0.5399228, -1.262959, 1.803092, 1, 0, 0, 1, 1,
0.5413591, -1.360961, 3.905207, 1, 0, 0, 1, 1,
0.5427734, 0.1899364, 3.539814, 1, 0, 0, 1, 1,
0.5464202, -1.175357, 1.796212, 0, 0, 0, 1, 1,
0.5470669, 0.07291171, 1.969566, 0, 0, 0, 1, 1,
0.55004, -0.7892918, 1.771787, 0, 0, 0, 1, 1,
0.5534897, -1.167565, 4.003125, 0, 0, 0, 1, 1,
0.5566191, -1.209316, 4.168644, 0, 0, 0, 1, 1,
0.5568141, -0.7492075, 1.950178, 0, 0, 0, 1, 1,
0.5611805, 0.8065902, -0.9769446, 0, 0, 0, 1, 1,
0.5619681, -2.19374, 4.013615, 1, 1, 1, 1, 1,
0.5635362, -0.7940597, 1.714651, 1, 1, 1, 1, 1,
0.5695192, -0.2657806, 0.5662129, 1, 1, 1, 1, 1,
0.5719478, 1.057114, -0.6906738, 1, 1, 1, 1, 1,
0.5728132, 0.3387313, 1.605502, 1, 1, 1, 1, 1,
0.5753368, -1.271773, 1.820921, 1, 1, 1, 1, 1,
0.5778785, -0.2081427, 1.963865, 1, 1, 1, 1, 1,
0.5783439, 1.297758, 2.740704, 1, 1, 1, 1, 1,
0.5784552, 0.5024098, 2.723371, 1, 1, 1, 1, 1,
0.5813446, -0.0492008, 1.918318, 1, 1, 1, 1, 1,
0.582952, -0.8822503, 0.3410293, 1, 1, 1, 1, 1,
0.5880468, -1.020645, 3.812819, 1, 1, 1, 1, 1,
0.5898655, -0.03042936, 1.908802, 1, 1, 1, 1, 1,
0.5902164, 1.694907, 0.04030652, 1, 1, 1, 1, 1,
0.5926298, 1.398347, 1.275734, 1, 1, 1, 1, 1,
0.5932266, -0.6568751, 2.771695, 0, 0, 1, 1, 1,
0.6006237, 0.5071572, 0.9217358, 1, 0, 0, 1, 1,
0.6044876, 1.288891, 0.2105897, 1, 0, 0, 1, 1,
0.6054388, -0.06471423, 2.047429, 1, 0, 0, 1, 1,
0.6069754, 0.5952713, -0.08562934, 1, 0, 0, 1, 1,
0.6114876, 0.9468324, 1.040535, 1, 0, 0, 1, 1,
0.6194325, -0.3478009, 2.165292, 0, 0, 0, 1, 1,
0.6221815, 0.3474933, 3.271633, 0, 0, 0, 1, 1,
0.6225444, -0.5766512, 0.564792, 0, 0, 0, 1, 1,
0.6231455, -0.5955388, 1.854819, 0, 0, 0, 1, 1,
0.6310148, 1.074832, 0.8587828, 0, 0, 0, 1, 1,
0.6386277, 0.5852255, 1.558687, 0, 0, 0, 1, 1,
0.6387032, -0.5222967, 1.501388, 0, 0, 0, 1, 1,
0.6388147, -0.9546511, 2.312106, 1, 1, 1, 1, 1,
0.6392723, 0.1039778, 1.230886, 1, 1, 1, 1, 1,
0.6395591, -1.650667, 1.676707, 1, 1, 1, 1, 1,
0.6407902, 0.07255216, 1.229758, 1, 1, 1, 1, 1,
0.6440064, -0.6356807, 1.915381, 1, 1, 1, 1, 1,
0.6441361, 1.202043, 0.07446259, 1, 1, 1, 1, 1,
0.6484783, 0.6340178, 0.5633076, 1, 1, 1, 1, 1,
0.65069, 1.201215, 1.726207, 1, 1, 1, 1, 1,
0.6549869, 2.150242, -0.9231645, 1, 1, 1, 1, 1,
0.6583102, 0.7461939, 1.647615, 1, 1, 1, 1, 1,
0.6587439, -0.1331695, 1.622296, 1, 1, 1, 1, 1,
0.6605845, 0.5929141, 1.898409, 1, 1, 1, 1, 1,
0.6617528, -1.385759, 4.021495, 1, 1, 1, 1, 1,
0.6650286, 0.4797494, 0.676392, 1, 1, 1, 1, 1,
0.6665115, -1.421351, 2.841177, 1, 1, 1, 1, 1,
0.6686717, -0.006604627, 1.391035, 0, 0, 1, 1, 1,
0.6687993, 1.292123, 0.8510494, 1, 0, 0, 1, 1,
0.6705651, -1.011967, 2.084215, 1, 0, 0, 1, 1,
0.6736358, -0.518345, 1.970984, 1, 0, 0, 1, 1,
0.6776831, 0.2629606, 0.4555071, 1, 0, 0, 1, 1,
0.6871716, -1.32117, 3.117853, 1, 0, 0, 1, 1,
0.6925932, 0.5734867, -0.07954863, 0, 0, 0, 1, 1,
0.6965117, -1.603548, 3.942123, 0, 0, 0, 1, 1,
0.7007263, 1.017229, 1.384763, 0, 0, 0, 1, 1,
0.7050542, 0.2756169, 0.9700845, 0, 0, 0, 1, 1,
0.7097893, -0.4418887, 1.910828, 0, 0, 0, 1, 1,
0.7107081, -1.211235, 3.157279, 0, 0, 0, 1, 1,
0.7133859, -0.3208445, 1.852753, 0, 0, 0, 1, 1,
0.7189405, 0.5607993, 0.9804987, 1, 1, 1, 1, 1,
0.7212676, 1.031552, -0.9790486, 1, 1, 1, 1, 1,
0.7223231, -0.3318364, 1.415547, 1, 1, 1, 1, 1,
0.7269112, -0.08491343, 3.60305, 1, 1, 1, 1, 1,
0.7278349, -1.534522, 3.270227, 1, 1, 1, 1, 1,
0.7322489, -0.2553807, 2.176903, 1, 1, 1, 1, 1,
0.7368745, 1.087061, -0.2636232, 1, 1, 1, 1, 1,
0.7379367, -0.9900494, 1.618483, 1, 1, 1, 1, 1,
0.7388157, 0.9770319, -0.2796354, 1, 1, 1, 1, 1,
0.7559171, -0.3072163, 2.119677, 1, 1, 1, 1, 1,
0.7591266, -0.7766776, 2.365125, 1, 1, 1, 1, 1,
0.7637632, -0.03919238, 0.7234989, 1, 1, 1, 1, 1,
0.7661667, -0.1486386, 1.44054, 1, 1, 1, 1, 1,
0.7782918, -1.364128, 2.978468, 1, 1, 1, 1, 1,
0.7783673, 2.022768, 0.8938972, 1, 1, 1, 1, 1,
0.780156, 0.8695487, 1.936166, 0, 0, 1, 1, 1,
0.782626, 0.5996038, 1.440455, 1, 0, 0, 1, 1,
0.7889016, -0.2489945, 2.26144, 1, 0, 0, 1, 1,
0.8000844, 0.8918134, 2.09054, 1, 0, 0, 1, 1,
0.8137988, 0.5722184, 1.10574, 1, 0, 0, 1, 1,
0.8160471, 0.2790952, 0.7740149, 1, 0, 0, 1, 1,
0.8166181, 0.8012055, 1.308304, 0, 0, 0, 1, 1,
0.8177789, 0.2486397, 1.505157, 0, 0, 0, 1, 1,
0.8192419, -0.8269974, 2.940137, 0, 0, 0, 1, 1,
0.8236499, 0.2467447, 1.706029, 0, 0, 0, 1, 1,
0.8239534, 0.340629, 0.2753649, 0, 0, 0, 1, 1,
0.8312171, -0.9839723, 3.295167, 0, 0, 0, 1, 1,
0.8331586, 0.9298124, 0.6461301, 0, 0, 0, 1, 1,
0.8370913, -0.7558749, 1.795013, 1, 1, 1, 1, 1,
0.8388251, -0.07409485, 4.054203, 1, 1, 1, 1, 1,
0.8388372, -1.77373, 2.339475, 1, 1, 1, 1, 1,
0.8429659, 0.3500444, -0.7197374, 1, 1, 1, 1, 1,
0.8434944, 0.2263339, 2.707826, 1, 1, 1, 1, 1,
0.8451403, -1.385309, 3.206831, 1, 1, 1, 1, 1,
0.8535683, 1.680997, 1.329256, 1, 1, 1, 1, 1,
0.8582416, -0.4077898, 3.573112, 1, 1, 1, 1, 1,
0.8599594, -0.824225, 3.915429, 1, 1, 1, 1, 1,
0.8645571, 1.19055, -0.8765812, 1, 1, 1, 1, 1,
0.8721461, -0.6693373, 2.152849, 1, 1, 1, 1, 1,
0.8731595, -0.936217, 3.371818, 1, 1, 1, 1, 1,
0.8739915, -0.3508759, 1.579375, 1, 1, 1, 1, 1,
0.8767614, -0.03576054, 0.9337263, 1, 1, 1, 1, 1,
0.887243, 1.042438, 2.378607, 1, 1, 1, 1, 1,
0.8882549, 0.9920443, 0.4530951, 0, 0, 1, 1, 1,
0.8923721, -0.08473992, 0.8904457, 1, 0, 0, 1, 1,
0.8932905, -0.5229126, 1.431412, 1, 0, 0, 1, 1,
0.9034531, 0.5864354, 3.741459, 1, 0, 0, 1, 1,
0.9076779, 0.9441443, 2.046005, 1, 0, 0, 1, 1,
0.9085983, 1.177941, 0.856682, 1, 0, 0, 1, 1,
0.9104831, -1.575453, 2.739741, 0, 0, 0, 1, 1,
0.9109572, 0.04726678, 0.749019, 0, 0, 0, 1, 1,
0.9162843, 0.8722063, 2.039364, 0, 0, 0, 1, 1,
0.9216517, 0.2471519, 2.124449, 0, 0, 0, 1, 1,
0.9268744, 1.599302, 1.371861, 0, 0, 0, 1, 1,
0.9275448, -0.3917189, 2.5555, 0, 0, 0, 1, 1,
0.9289956, 0.6559337, 0.8430404, 0, 0, 0, 1, 1,
0.9353012, -1.269956, 4.38548, 1, 1, 1, 1, 1,
0.9441487, -0.2965987, 2.215475, 1, 1, 1, 1, 1,
0.944537, 0.07328155, 0.1816142, 1, 1, 1, 1, 1,
0.9475566, -1.007905, 2.910586, 1, 1, 1, 1, 1,
0.9512128, 0.7938834, 3.062339, 1, 1, 1, 1, 1,
0.9540638, 1.327702, 1.036963, 1, 1, 1, 1, 1,
0.9626846, 0.4702044, 1.643898, 1, 1, 1, 1, 1,
0.9636348, 0.6191061, 0.6416957, 1, 1, 1, 1, 1,
0.9636353, 1.013479, 1.557932, 1, 1, 1, 1, 1,
0.9706513, -0.4379207, 3.561018, 1, 1, 1, 1, 1,
0.971597, 0.6100702, 2.363158, 1, 1, 1, 1, 1,
0.9722625, -0.417619, 1.525444, 1, 1, 1, 1, 1,
0.9847563, 0.2451209, 3.226705, 1, 1, 1, 1, 1,
0.985486, -1.454487, 3.200154, 1, 1, 1, 1, 1,
0.9873818, -1.725199, 2.396529, 1, 1, 1, 1, 1,
0.9880419, -1.317166, 2.960026, 0, 0, 1, 1, 1,
0.9899742, 0.2219365, 2.469768, 1, 0, 0, 1, 1,
0.9934828, 1.279276, -0.02078146, 1, 0, 0, 1, 1,
0.9942076, -0.6304244, 2.952053, 1, 0, 0, 1, 1,
1.002535, -1.799068, 2.443992, 1, 0, 0, 1, 1,
1.004698, -1.980627, 1.16413, 1, 0, 0, 1, 1,
1.005957, 0.4938851, 1.894909, 0, 0, 0, 1, 1,
1.011919, 0.550967, 1.289565, 0, 0, 0, 1, 1,
1.01419, 0.4443679, 2.113164, 0, 0, 0, 1, 1,
1.017841, -0.7405838, 2.827377, 0, 0, 0, 1, 1,
1.020967, -0.7094885, 1.53105, 0, 0, 0, 1, 1,
1.024869, 0.0869928, 0.1999941, 0, 0, 0, 1, 1,
1.025979, -1.663777, 2.689129, 0, 0, 0, 1, 1,
1.032501, 1.635595, 2.529334, 1, 1, 1, 1, 1,
1.037655, 0.2396251, 0.5954746, 1, 1, 1, 1, 1,
1.040824, -0.9235106, 2.08879, 1, 1, 1, 1, 1,
1.043549, -1.368824, 2.114201, 1, 1, 1, 1, 1,
1.045333, -0.6811545, 3.438073, 1, 1, 1, 1, 1,
1.054874, 0.02830807, 0.3923601, 1, 1, 1, 1, 1,
1.056879, 0.07837393, -0.2387787, 1, 1, 1, 1, 1,
1.060925, -0.006277667, 0.1319775, 1, 1, 1, 1, 1,
1.062082, 1.3908, 1.844784, 1, 1, 1, 1, 1,
1.062675, -0.2741418, 0.266827, 1, 1, 1, 1, 1,
1.063534, -0.4968615, 2.113615, 1, 1, 1, 1, 1,
1.067201, -0.9275948, 3.063469, 1, 1, 1, 1, 1,
1.072044, -1.143548, 2.56221, 1, 1, 1, 1, 1,
1.087624, 0.7310567, 2.581356, 1, 1, 1, 1, 1,
1.088907, 1.451559, -0.06744763, 1, 1, 1, 1, 1,
1.093589, 0.1734595, 0.8312958, 0, 0, 1, 1, 1,
1.095966, -0.08957978, 1.364073, 1, 0, 0, 1, 1,
1.100678, 0.1613198, 2.625613, 1, 0, 0, 1, 1,
1.101633, 0.5006557, 2.015363, 1, 0, 0, 1, 1,
1.117392, 0.1487536, 1.184801, 1, 0, 0, 1, 1,
1.1193, -1.143988, 2.882545, 1, 0, 0, 1, 1,
1.121408, -0.5892292, 1.60644, 0, 0, 0, 1, 1,
1.126639, 0.9072869, 1.08015, 0, 0, 0, 1, 1,
1.143316, -1.886157, 1.986791, 0, 0, 0, 1, 1,
1.143415, -0.1061809, 1.732838, 0, 0, 0, 1, 1,
1.146585, 1.322549, 0.6721352, 0, 0, 0, 1, 1,
1.15107, 1.284167, 1.267967, 0, 0, 0, 1, 1,
1.151733, -0.9433311, 2.244899, 0, 0, 0, 1, 1,
1.155602, -0.4966638, 3.596433, 1, 1, 1, 1, 1,
1.17311, 0.2354659, 1.326058, 1, 1, 1, 1, 1,
1.184296, 1.101674, 1.987713, 1, 1, 1, 1, 1,
1.18772, 1.97686, -0.1220205, 1, 1, 1, 1, 1,
1.189963, 0.04519245, -0.7466937, 1, 1, 1, 1, 1,
1.210617, -0.06218, 2.065983, 1, 1, 1, 1, 1,
1.212268, -0.6446447, 1.938299, 1, 1, 1, 1, 1,
1.214755, 0.7366608, 2.028575, 1, 1, 1, 1, 1,
1.21499, -0.1502059, 1.563661, 1, 1, 1, 1, 1,
1.216099, 0.2561791, -0.7277536, 1, 1, 1, 1, 1,
1.220839, -0.5961214, 2.430471, 1, 1, 1, 1, 1,
1.228652, 0.674243, 0.8314438, 1, 1, 1, 1, 1,
1.239777, 0.4480667, 0.1991897, 1, 1, 1, 1, 1,
1.241071, -1.007879, 0.4562833, 1, 1, 1, 1, 1,
1.272191, 1.000083, -0.2902983, 1, 1, 1, 1, 1,
1.276307, -1.666998, 2.831532, 0, 0, 1, 1, 1,
1.279202, 0.9174499, 0.8340638, 1, 0, 0, 1, 1,
1.280748, 0.5560747, 2.234689, 1, 0, 0, 1, 1,
1.281162, 0.1796519, 1.161286, 1, 0, 0, 1, 1,
1.28126, -0.2366162, 3.689362, 1, 0, 0, 1, 1,
1.290303, 0.2817212, -0.5770239, 1, 0, 0, 1, 1,
1.291341, 1.547835, 0.8745128, 0, 0, 0, 1, 1,
1.291478, 0.8231283, 3.328207, 0, 0, 0, 1, 1,
1.293774, -0.1677455, 1.616525, 0, 0, 0, 1, 1,
1.299384, -0.9260162, 1.408616, 0, 0, 0, 1, 1,
1.299585, -0.2775828, 2.437364, 0, 0, 0, 1, 1,
1.301744, -0.2275878, 1.110466, 0, 0, 0, 1, 1,
1.312464, -0.3048027, 0.6063507, 0, 0, 0, 1, 1,
1.31345, -0.8352999, 2.560321, 1, 1, 1, 1, 1,
1.314733, -0.3072189, 1.08462, 1, 1, 1, 1, 1,
1.317241, -0.9038022, 3.143843, 1, 1, 1, 1, 1,
1.323576, -0.1468381, 2.176347, 1, 1, 1, 1, 1,
1.324684, 3.34336, -0.1293421, 1, 1, 1, 1, 1,
1.327333, -0.8402181, 3.025091, 1, 1, 1, 1, 1,
1.333865, -1.455564, 3.688174, 1, 1, 1, 1, 1,
1.337359, 1.769347, 1.881034, 1, 1, 1, 1, 1,
1.341667, -1.254173, 1.560176, 1, 1, 1, 1, 1,
1.349159, -0.8547844, 2.158955, 1, 1, 1, 1, 1,
1.351777, -0.7102324, 1.448564, 1, 1, 1, 1, 1,
1.354693, -0.7118594, 1.70748, 1, 1, 1, 1, 1,
1.359203, 1.18805, 1.181702, 1, 1, 1, 1, 1,
1.36419, -0.1622037, 2.340154, 1, 1, 1, 1, 1,
1.366224, 0.7574942, 0.7973609, 1, 1, 1, 1, 1,
1.371865, 0.740965, 0.9794846, 0, 0, 1, 1, 1,
1.374489, -1.215684, 0.2341823, 1, 0, 0, 1, 1,
1.375395, 0.8825958, 0.8663177, 1, 0, 0, 1, 1,
1.376659, -0.6639288, 0.8143376, 1, 0, 0, 1, 1,
1.379215, -0.9761417, 3.980736, 1, 0, 0, 1, 1,
1.381489, -0.3375773, 2.889041, 1, 0, 0, 1, 1,
1.393405, -1.068864, 1.472799, 0, 0, 0, 1, 1,
1.41414, -2.150222, 0.4884115, 0, 0, 0, 1, 1,
1.418616, -0.3151705, 2.230608, 0, 0, 0, 1, 1,
1.429871, 0.4322789, 1.403195, 0, 0, 0, 1, 1,
1.438348, -0.5292967, 1.64186, 0, 0, 0, 1, 1,
1.44733, -0.7379261, 4.242004, 0, 0, 0, 1, 1,
1.453336, -0.9291589, 1.8368, 0, 0, 0, 1, 1,
1.466184, -0.7030629, 2.177469, 1, 1, 1, 1, 1,
1.478136, 1.123019, -0.09756241, 1, 1, 1, 1, 1,
1.494093, 0.2028479, 0.9637129, 1, 1, 1, 1, 1,
1.500975, -0.1219411, 1.89874, 1, 1, 1, 1, 1,
1.503442, -0.5907205, 2.147187, 1, 1, 1, 1, 1,
1.510961, -0.7363776, 1.900076, 1, 1, 1, 1, 1,
1.512724, 0.1807674, 2.601124, 1, 1, 1, 1, 1,
1.521256, -1.336829, 1.358313, 1, 1, 1, 1, 1,
1.52396, 0.3411309, 0.256553, 1, 1, 1, 1, 1,
1.526483, -0.5104667, 0.3907103, 1, 1, 1, 1, 1,
1.529016, -0.8834128, 2.434654, 1, 1, 1, 1, 1,
1.530144, -0.1692342, 2.397588, 1, 1, 1, 1, 1,
1.5435, -0.3188436, 3.234577, 1, 1, 1, 1, 1,
1.545332, 0.09875396, 1.006645, 1, 1, 1, 1, 1,
1.578752, 1.638018, -1.666938, 1, 1, 1, 1, 1,
1.587944, -0.6840651, 3.578092, 0, 0, 1, 1, 1,
1.593995, -0.8989758, 3.363475, 1, 0, 0, 1, 1,
1.594885, -1.148747, 2.287868, 1, 0, 0, 1, 1,
1.599277, 0.2969669, 0.8019074, 1, 0, 0, 1, 1,
1.66241, -0.9341156, 1.926513, 1, 0, 0, 1, 1,
1.66798, -0.3874518, 1.990051, 1, 0, 0, 1, 1,
1.673552, -1.692737, 1.209042, 0, 0, 0, 1, 1,
1.686593, -1.657611, 1.311445, 0, 0, 0, 1, 1,
1.68841, 1.900024, 0.8975288, 0, 0, 0, 1, 1,
1.689002, 0.5606109, 2.26453, 0, 0, 0, 1, 1,
1.692944, 0.2521837, -0.5860154, 0, 0, 0, 1, 1,
1.701497, -0.6537994, 0.4738351, 0, 0, 0, 1, 1,
1.724241, 0.8532882, 0.8981648, 0, 0, 0, 1, 1,
1.738684, -0.2085692, 2.053082, 1, 1, 1, 1, 1,
1.752679, 0.7057733, -0.1285122, 1, 1, 1, 1, 1,
1.770962, 0.9520163, 1.787312, 1, 1, 1, 1, 1,
1.781428, -1.135814, 3.162643, 1, 1, 1, 1, 1,
1.80419, -1.223474, 3.809565, 1, 1, 1, 1, 1,
1.835268, -1.858437, 4.091866, 1, 1, 1, 1, 1,
1.84835, 0.706799, 0.05835189, 1, 1, 1, 1, 1,
1.861042, -1.214284, 2.293587, 1, 1, 1, 1, 1,
1.882897, -0.09808674, 1.057156, 1, 1, 1, 1, 1,
1.892845, -0.5078149, 2.116832, 1, 1, 1, 1, 1,
1.900648, 0.5674734, 1.633552, 1, 1, 1, 1, 1,
1.905949, 1.12141, 0.7264748, 1, 1, 1, 1, 1,
1.923537, -0.1843873, 1.891401, 1, 1, 1, 1, 1,
1.935217, -0.9129345, 3.52436, 1, 1, 1, 1, 1,
1.938697, -1.006415, 3.141396, 1, 1, 1, 1, 1,
1.941763, -0.2797282, 1.457706, 0, 0, 1, 1, 1,
1.94426, -0.9149186, 1.952389, 1, 0, 0, 1, 1,
1.968487, 1.088135, 1.804317, 1, 0, 0, 1, 1,
1.98579, -2.080543, 3.624789, 1, 0, 0, 1, 1,
2.030015, 0.8651881, 2.915477, 1, 0, 0, 1, 1,
2.083229, -0.2453807, 1.308218, 1, 0, 0, 1, 1,
2.110682, 0.4249614, 0.06488732, 0, 0, 0, 1, 1,
2.135468, -0.4326405, 2.388246, 0, 0, 0, 1, 1,
2.175163, -0.544488, 2.19757, 0, 0, 0, 1, 1,
2.180834, -0.2136765, 1.192958, 0, 0, 0, 1, 1,
2.181242, 0.5079568, 1.027695, 0, 0, 0, 1, 1,
2.212808, -0.2177411, 1.574316, 0, 0, 0, 1, 1,
2.291968, -1.166544, 2.074502, 0, 0, 0, 1, 1,
2.310273, -0.1349406, 2.002536, 1, 1, 1, 1, 1,
2.347257, -0.5340741, 1.049988, 1, 1, 1, 1, 1,
2.397708, -1.666902, 1.633354, 1, 1, 1, 1, 1,
2.780797, 0.3524747, 2.098935, 1, 1, 1, 1, 1,
2.906308, -1.869529, 3.514342, 1, 1, 1, 1, 1,
3.011786, -2.431926, 2.11612, 1, 1, 1, 1, 1,
3.250132, -1.468031, 2.495831, 1, 1, 1, 1, 1
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
var radius = 9.649915;
var distance = 33.89492;
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
mvMatrix.translate( -0.03461242, -0.2251167, 0.2607923 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89492);
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
