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
-3.262336, -0.01644382, -3.607858, 1, 0, 0, 1,
-3.097254, -1.412766, -0.3767001, 1, 0.007843138, 0, 1,
-3.000954, 0.4909708, 0.1694198, 1, 0.01176471, 0, 1,
-2.80862, -1.786595, -2.254307, 1, 0.01960784, 0, 1,
-2.694699, -0.708146, -3.07656, 1, 0.02352941, 0, 1,
-2.551749, 1.032217, -0.5472586, 1, 0.03137255, 0, 1,
-2.444318, 0.156691, -2.151617, 1, 0.03529412, 0, 1,
-2.382403, -0.4985917, -3.022779, 1, 0.04313726, 0, 1,
-2.377733, 0.1057568, -0.9027352, 1, 0.04705882, 0, 1,
-2.371551, -1.199054, -1.768387, 1, 0.05490196, 0, 1,
-2.367537, 0.3573695, -0.9816424, 1, 0.05882353, 0, 1,
-2.23893, 0.9062312, 0.2845471, 1, 0.06666667, 0, 1,
-2.230204, 0.5051946, -0.7814041, 1, 0.07058824, 0, 1,
-2.195964, -1.073919, -2.741857, 1, 0.07843138, 0, 1,
-2.160377, 0.2391467, -1.557981, 1, 0.08235294, 0, 1,
-2.153738, -0.6935232, -1.525667, 1, 0.09019608, 0, 1,
-2.145299, -0.3790865, -1.779561, 1, 0.09411765, 0, 1,
-2.138341, -0.4289846, -2.226204, 1, 0.1019608, 0, 1,
-2.13074, -1.842574, -1.844566, 1, 0.1098039, 0, 1,
-2.111764, 0.977918, -0.579885, 1, 0.1137255, 0, 1,
-2.0064, -0.525807, -1.898903, 1, 0.1215686, 0, 1,
-1.999865, 1.39186, -0.9161679, 1, 0.1254902, 0, 1,
-1.992723, 1.044302, -0.8989982, 1, 0.1333333, 0, 1,
-1.974504, 0.2617464, -1.115235, 1, 0.1372549, 0, 1,
-1.956507, 1.168485, -0.07509285, 1, 0.145098, 0, 1,
-1.932683, 0.4219301, -2.530862, 1, 0.1490196, 0, 1,
-1.915511, 1.074541, -0.670029, 1, 0.1568628, 0, 1,
-1.88035, 1.361114, -0.6314166, 1, 0.1607843, 0, 1,
-1.861251, -1.820334, -2.123426, 1, 0.1686275, 0, 1,
-1.859151, 0.6822158, -1.101282, 1, 0.172549, 0, 1,
-1.827221, -0.5439922, -1.363276, 1, 0.1803922, 0, 1,
-1.807503, 0.2828302, 0.006465189, 1, 0.1843137, 0, 1,
-1.773014, 0.1944281, -1.426464, 1, 0.1921569, 0, 1,
-1.752274, -1.67042, -1.663618, 1, 0.1960784, 0, 1,
-1.72013, 0.6809428, -0.9047791, 1, 0.2039216, 0, 1,
-1.711613, 1.131132, -2.914599, 1, 0.2117647, 0, 1,
-1.706577, -0.5071147, -3.723849, 1, 0.2156863, 0, 1,
-1.685888, -1.70601, -2.682398, 1, 0.2235294, 0, 1,
-1.682802, -1.354165, -2.954861, 1, 0.227451, 0, 1,
-1.671568, -0.8389283, -1.969624, 1, 0.2352941, 0, 1,
-1.657522, -0.1452399, -0.9011164, 1, 0.2392157, 0, 1,
-1.655028, 0.2935598, -1.38635, 1, 0.2470588, 0, 1,
-1.650918, -0.03484835, -3.044755, 1, 0.2509804, 0, 1,
-1.646624, 0.7369415, -2.242244, 1, 0.2588235, 0, 1,
-1.644547, 0.7220021, -0.8213996, 1, 0.2627451, 0, 1,
-1.634164, 0.04301207, 0.307079, 1, 0.2705882, 0, 1,
-1.627626, 0.5376384, -3.217014, 1, 0.2745098, 0, 1,
-1.625054, 0.1676709, -3.838214, 1, 0.282353, 0, 1,
-1.623347, 0.1666545, -1.296264, 1, 0.2862745, 0, 1,
-1.618524, 1.785685, 1.043963, 1, 0.2941177, 0, 1,
-1.605792, 1.687186, -1.49664, 1, 0.3019608, 0, 1,
-1.595444, -0.1141623, -4.544924, 1, 0.3058824, 0, 1,
-1.593204, -0.135941, -1.394296, 1, 0.3137255, 0, 1,
-1.590367, -3.555848, -2.31416, 1, 0.3176471, 0, 1,
-1.585125, -1.238605, -1.888969, 1, 0.3254902, 0, 1,
-1.583225, 0.8187898, -2.909568, 1, 0.3294118, 0, 1,
-1.562187, -0.5452578, -1.367868, 1, 0.3372549, 0, 1,
-1.537926, -1.629242, -2.369414, 1, 0.3411765, 0, 1,
-1.532291, 0.4897112, 0.5024661, 1, 0.3490196, 0, 1,
-1.532006, -0.9340522, -1.965916, 1, 0.3529412, 0, 1,
-1.505999, -0.981056, -2.899988, 1, 0.3607843, 0, 1,
-1.49666, -0.1901608, -1.333086, 1, 0.3647059, 0, 1,
-1.496114, -0.7874677, -1.427179, 1, 0.372549, 0, 1,
-1.494872, 0.6840535, -1.167404, 1, 0.3764706, 0, 1,
-1.491362, -0.3502468, -1.592701, 1, 0.3843137, 0, 1,
-1.479906, 2.149964, -0.4082124, 1, 0.3882353, 0, 1,
-1.47914, 0.6944807, -1.359151, 1, 0.3960784, 0, 1,
-1.475676, -1.463937, -2.082715, 1, 0.4039216, 0, 1,
-1.471995, 1.525117, -1.959794, 1, 0.4078431, 0, 1,
-1.464809, 1.286825, -1.124887, 1, 0.4156863, 0, 1,
-1.456812, 0.85754, -0.1241403, 1, 0.4196078, 0, 1,
-1.43435, 0.1772872, -0.9711752, 1, 0.427451, 0, 1,
-1.433938, 0.6124278, -1.416967, 1, 0.4313726, 0, 1,
-1.423516, -0.3305089, -0.7703409, 1, 0.4392157, 0, 1,
-1.420136, 0.7471382, 1.196333, 1, 0.4431373, 0, 1,
-1.418851, 0.9297598, -0.4532291, 1, 0.4509804, 0, 1,
-1.409913, 1.831156, -0.4580083, 1, 0.454902, 0, 1,
-1.393521, -1.047853, -1.710865, 1, 0.4627451, 0, 1,
-1.391811, 2.001902, 0.8733962, 1, 0.4666667, 0, 1,
-1.372707, 0.7534348, -1.327401, 1, 0.4745098, 0, 1,
-1.362935, 0.8669191, -2.638436, 1, 0.4784314, 0, 1,
-1.3526, 0.4991027, -1.083658, 1, 0.4862745, 0, 1,
-1.344949, -1.11283, -1.594651, 1, 0.4901961, 0, 1,
-1.334265, -0.06640553, -1.90162, 1, 0.4980392, 0, 1,
-1.329213, -0.21912, -1.024051, 1, 0.5058824, 0, 1,
-1.325711, -0.08204988, -1.03718, 1, 0.509804, 0, 1,
-1.313663, 0.3129641, -3.19903, 1, 0.5176471, 0, 1,
-1.313301, -0.5350038, 2.277287e-05, 1, 0.5215687, 0, 1,
-1.307665, -1.23152, -0.7670023, 1, 0.5294118, 0, 1,
-1.305312, -0.5944724, -1.338486, 1, 0.5333334, 0, 1,
-1.299743, 0.9262465, -0.7778674, 1, 0.5411765, 0, 1,
-1.294981, 0.5331539, -0.4202653, 1, 0.5450981, 0, 1,
-1.29457, -0.7525799, -3.244934, 1, 0.5529412, 0, 1,
-1.287713, -1.101661, -2.324954, 1, 0.5568628, 0, 1,
-1.280801, 0.1325556, -0.9235632, 1, 0.5647059, 0, 1,
-1.279145, -0.2729078, -2.261743, 1, 0.5686275, 0, 1,
-1.271553, -0.368515, -2.018504, 1, 0.5764706, 0, 1,
-1.258115, -0.996056, -1.651715, 1, 0.5803922, 0, 1,
-1.255092, 0.6967994, -0.4932026, 1, 0.5882353, 0, 1,
-1.251114, -1.331478, -1.782239, 1, 0.5921569, 0, 1,
-1.243999, 0.1531405, -2.895101, 1, 0.6, 0, 1,
-1.22972, 1.192221, -2.068781, 1, 0.6078432, 0, 1,
-1.217144, 0.02809079, -2.332638, 1, 0.6117647, 0, 1,
-1.216117, 1.03873, -1.227355, 1, 0.6196079, 0, 1,
-1.207566, -0.5001979, -3.36551, 1, 0.6235294, 0, 1,
-1.205562, -1.203552, -1.700234, 1, 0.6313726, 0, 1,
-1.197626, -0.4733718, -0.7618434, 1, 0.6352941, 0, 1,
-1.197479, -1.664321, -3.970351, 1, 0.6431373, 0, 1,
-1.187828, 0.6082379, -3.869104, 1, 0.6470588, 0, 1,
-1.187132, 0.5328197, 0.4345539, 1, 0.654902, 0, 1,
-1.185742, -0.02408814, -2.050179, 1, 0.6588235, 0, 1,
-1.18179, -0.5941209, -1.399408, 1, 0.6666667, 0, 1,
-1.178254, 0.7812438, -1.395724, 1, 0.6705883, 0, 1,
-1.17821, -0.04396049, -0.6719742, 1, 0.6784314, 0, 1,
-1.177162, 0.7053054, 0.6840758, 1, 0.682353, 0, 1,
-1.174615, -0.5699211, -1.10129, 1, 0.6901961, 0, 1,
-1.169527, -1.923594, -2.541627, 1, 0.6941177, 0, 1,
-1.169403, -0.6139943, -1.089993, 1, 0.7019608, 0, 1,
-1.145594, -0.7966548, -2.273496, 1, 0.7098039, 0, 1,
-1.13791, -1.775766, -2.091944, 1, 0.7137255, 0, 1,
-1.132976, 1.557939, -1.201351, 1, 0.7215686, 0, 1,
-1.131806, -0.6946068, -0.7115768, 1, 0.7254902, 0, 1,
-1.127622, -0.0518455, 0.09542818, 1, 0.7333333, 0, 1,
-1.126762, 1.577271, -1.263956, 1, 0.7372549, 0, 1,
-1.123676, 0.2251848, -1.238892, 1, 0.7450981, 0, 1,
-1.120983, -1.039661, 0.1579035, 1, 0.7490196, 0, 1,
-1.111563, 0.9968569, -1.842538, 1, 0.7568628, 0, 1,
-1.10682, -0.3277311, -3.384555, 1, 0.7607843, 0, 1,
-1.097629, 0.2215747, -1.494955, 1, 0.7686275, 0, 1,
-1.094343, 1.51022, -1.115594, 1, 0.772549, 0, 1,
-1.087634, 0.1756572, -1.506859, 1, 0.7803922, 0, 1,
-1.086219, 1.653841, 1.341539, 1, 0.7843137, 0, 1,
-1.071591, 1.14802, 0.1901867, 1, 0.7921569, 0, 1,
-1.06931, 0.7160087, -0.1654316, 1, 0.7960784, 0, 1,
-1.069161, -0.1509265, -0.7388066, 1, 0.8039216, 0, 1,
-1.068626, 0.4274822, 0.2269318, 1, 0.8117647, 0, 1,
-1.068153, -0.6841621, -0.2353326, 1, 0.8156863, 0, 1,
-1.05959, -0.6515123, -2.989017, 1, 0.8235294, 0, 1,
-1.029741, 0.4911231, -1.143354, 1, 0.827451, 0, 1,
-1.029666, -1.434525, -3.311713, 1, 0.8352941, 0, 1,
-1.021269, 1.544289, 0.200498, 1, 0.8392157, 0, 1,
-1.020184, -1.131097, -2.391311, 1, 0.8470588, 0, 1,
-1.019354, -0.574245, -0.9759388, 1, 0.8509804, 0, 1,
-1.00359, -0.9364738, -1.647231, 1, 0.8588235, 0, 1,
-0.9993449, 0.01929885, -1.117697, 1, 0.8627451, 0, 1,
-0.9970334, 0.05582556, -0.9864635, 1, 0.8705882, 0, 1,
-0.9960555, 0.1345007, -0.1254988, 1, 0.8745098, 0, 1,
-0.9952165, -0.1123001, -1.587523, 1, 0.8823529, 0, 1,
-0.9934688, 1.344902, -1.183019, 1, 0.8862745, 0, 1,
-0.9904048, 1.36772, -2.476707, 1, 0.8941177, 0, 1,
-0.9851014, -0.2811262, -1.297943, 1, 0.8980392, 0, 1,
-0.9845187, 0.1742557, -1.881085, 1, 0.9058824, 0, 1,
-0.9822583, -0.1019759, 0.4317127, 1, 0.9137255, 0, 1,
-0.9796243, 0.1169308, -0.5744066, 1, 0.9176471, 0, 1,
-0.9763781, -1.331186, -4.419557, 1, 0.9254902, 0, 1,
-0.9742399, 0.5140433, 0.9250686, 1, 0.9294118, 0, 1,
-0.9731082, 0.4710226, -1.450539, 1, 0.9372549, 0, 1,
-0.9725903, -1.168029, -0.4377244, 1, 0.9411765, 0, 1,
-0.9697467, -1.70899, -4.197158, 1, 0.9490196, 0, 1,
-0.9632868, -0.1479952, 0.1283153, 1, 0.9529412, 0, 1,
-0.9546142, 0.05486858, -0.6137984, 1, 0.9607843, 0, 1,
-0.9538647, 1.662215, -1.911894, 1, 0.9647059, 0, 1,
-0.9488029, 1.36348, -1.720471, 1, 0.972549, 0, 1,
-0.9371831, 0.7008703, -0.4388079, 1, 0.9764706, 0, 1,
-0.9319743, 0.4744696, -3.304153, 1, 0.9843137, 0, 1,
-0.9311727, -1.365347, -3.699842, 1, 0.9882353, 0, 1,
-0.929088, -2.598942, -1.264679, 1, 0.9960784, 0, 1,
-0.9261333, 0.4594875, -1.062615, 0.9960784, 1, 0, 1,
-0.9126173, 0.224, -0.4423631, 0.9921569, 1, 0, 1,
-0.9120597, 0.8818237, -2.240014, 0.9843137, 1, 0, 1,
-0.9050118, 0.2973348, -2.064568, 0.9803922, 1, 0, 1,
-0.9015897, 0.506008, 0.9416286, 0.972549, 1, 0, 1,
-0.8992136, -1.111182, -3.978423, 0.9686275, 1, 0, 1,
-0.8839587, 0.358014, -1.362271, 0.9607843, 1, 0, 1,
-0.8791474, 0.01965222, -2.851686, 0.9568627, 1, 0, 1,
-0.8740534, 1.843368, 0.7015693, 0.9490196, 1, 0, 1,
-0.872099, -0.3622732, -4.692512, 0.945098, 1, 0, 1,
-0.8671449, -0.07782793, -3.277686, 0.9372549, 1, 0, 1,
-0.8548807, 0.3238791, 0.06163963, 0.9333333, 1, 0, 1,
-0.8509159, -0.7401913, -3.221689, 0.9254902, 1, 0, 1,
-0.8465933, -1.334456, -0.6270319, 0.9215686, 1, 0, 1,
-0.8428102, 0.9736087, -2.323732, 0.9137255, 1, 0, 1,
-0.8382429, -1.914922, -3.210483, 0.9098039, 1, 0, 1,
-0.8342247, 0.03712689, -2.449314, 0.9019608, 1, 0, 1,
-0.8332462, 1.787557, -1.243666, 0.8941177, 1, 0, 1,
-0.8331184, -0.8556634, -2.06025, 0.8901961, 1, 0, 1,
-0.832233, -0.2135336, -1.602704, 0.8823529, 1, 0, 1,
-0.8235056, -0.5615893, -3.693439, 0.8784314, 1, 0, 1,
-0.8224428, -0.3462454, -2.336546, 0.8705882, 1, 0, 1,
-0.8220214, 0.3159981, -1.198499, 0.8666667, 1, 0, 1,
-0.820762, -1.162411, -2.329052, 0.8588235, 1, 0, 1,
-0.8166268, 2.077833, -0.464191, 0.854902, 1, 0, 1,
-0.8164725, -0.3839645, -0.8365445, 0.8470588, 1, 0, 1,
-0.8145329, -0.7656912, -2.824953, 0.8431373, 1, 0, 1,
-0.8136544, 0.9570169, -1.801325, 0.8352941, 1, 0, 1,
-0.8100013, 0.8510342, -2.25887, 0.8313726, 1, 0, 1,
-0.8061528, -0.4970264, -3.657719, 0.8235294, 1, 0, 1,
-0.8022807, -0.1779869, -2.557194, 0.8196079, 1, 0, 1,
-0.7972453, 1.080913, -0.8862419, 0.8117647, 1, 0, 1,
-0.7949834, 0.1544111, -0.1229932, 0.8078431, 1, 0, 1,
-0.7872174, 0.09434766, -1.575314, 0.8, 1, 0, 1,
-0.7866792, -0.4600506, -0.2837758, 0.7921569, 1, 0, 1,
-0.7857807, -0.1993769, -0.04367748, 0.7882353, 1, 0, 1,
-0.7818003, 0.380823, -1.817265, 0.7803922, 1, 0, 1,
-0.7788476, 0.3489074, -0.8969885, 0.7764706, 1, 0, 1,
-0.7766023, 1.378826, -1.181601, 0.7686275, 1, 0, 1,
-0.7639071, 0.7351632, -1.176915, 0.7647059, 1, 0, 1,
-0.7575673, -0.6706941, -2.705888, 0.7568628, 1, 0, 1,
-0.7561713, -1.718308, -4.159629, 0.7529412, 1, 0, 1,
-0.7523493, -0.3777538, -0.4608666, 0.7450981, 1, 0, 1,
-0.7511749, 0.8353853, -0.5174146, 0.7411765, 1, 0, 1,
-0.7509556, -0.2838441, -0.9097605, 0.7333333, 1, 0, 1,
-0.7492096, -1.25119, -2.410352, 0.7294118, 1, 0, 1,
-0.7472209, 1.943141, -0.6780051, 0.7215686, 1, 0, 1,
-0.7379353, -0.5862811, -2.163775, 0.7176471, 1, 0, 1,
-0.73749, -0.2394347, -1.224563, 0.7098039, 1, 0, 1,
-0.7358636, 0.3961275, 0.2255502, 0.7058824, 1, 0, 1,
-0.735001, -0.2477768, -2.236984, 0.6980392, 1, 0, 1,
-0.7337341, 0.6200763, -1.580107, 0.6901961, 1, 0, 1,
-0.7272009, -0.4657572, -1.882717, 0.6862745, 1, 0, 1,
-0.7259864, 0.6929708, -0.9779205, 0.6784314, 1, 0, 1,
-0.7234811, -1.065265, -4.270617, 0.6745098, 1, 0, 1,
-0.7119708, -1.254918, -2.634834, 0.6666667, 1, 0, 1,
-0.7113417, 1.099082, -0.5165707, 0.6627451, 1, 0, 1,
-0.7061307, -0.5099679, -1.641462, 0.654902, 1, 0, 1,
-0.7030599, -0.01020376, -1.660397, 0.6509804, 1, 0, 1,
-0.7000588, -0.2517662, -3.554052, 0.6431373, 1, 0, 1,
-0.6986304, -0.4009174, -2.6649, 0.6392157, 1, 0, 1,
-0.6970047, -0.135401, -2.302632, 0.6313726, 1, 0, 1,
-0.6915569, -1.330829, -3.556285, 0.627451, 1, 0, 1,
-0.6868853, 0.9358187, -2.240633, 0.6196079, 1, 0, 1,
-0.6834369, 1.176495, -0.3055109, 0.6156863, 1, 0, 1,
-0.6831934, 0.1297726, -0.8648968, 0.6078432, 1, 0, 1,
-0.6829941, 0.2342097, -1.179133, 0.6039216, 1, 0, 1,
-0.6822947, -1.343611, -2.085506, 0.5960785, 1, 0, 1,
-0.6783611, -2.401349, -1.903578, 0.5882353, 1, 0, 1,
-0.6779248, -0.5055694, -1.49274, 0.5843138, 1, 0, 1,
-0.6769787, -0.9160054, -3.301791, 0.5764706, 1, 0, 1,
-0.6760382, -0.5924448, -1.364563, 0.572549, 1, 0, 1,
-0.6744829, -0.190244, -3.162577, 0.5647059, 1, 0, 1,
-0.6733299, 0.892902, 0.4232386, 0.5607843, 1, 0, 1,
-0.6704116, 0.3868278, -0.1778018, 0.5529412, 1, 0, 1,
-0.6698492, -0.7218682, -3.129878, 0.5490196, 1, 0, 1,
-0.6689513, -0.0141628, -2.820181, 0.5411765, 1, 0, 1,
-0.6662543, 0.2776044, -1.726757, 0.5372549, 1, 0, 1,
-0.6645197, 2.012553, -0.3029024, 0.5294118, 1, 0, 1,
-0.6599473, -0.5757282, -0.05118585, 0.5254902, 1, 0, 1,
-0.6596694, 0.8657103, 0.6555204, 0.5176471, 1, 0, 1,
-0.6586506, -0.3125241, -2.395958, 0.5137255, 1, 0, 1,
-0.6564888, 0.4046296, -3.515035, 0.5058824, 1, 0, 1,
-0.6484944, -0.07727487, -2.5172, 0.5019608, 1, 0, 1,
-0.6447923, -0.5076245, -1.484004, 0.4941176, 1, 0, 1,
-0.6439753, 1.338351, -1.193879, 0.4862745, 1, 0, 1,
-0.6438412, -0.3345515, -2.297412, 0.4823529, 1, 0, 1,
-0.6431515, -2.192736, -2.921995, 0.4745098, 1, 0, 1,
-0.6377217, -0.5239267, -1.820692, 0.4705882, 1, 0, 1,
-0.6374155, -0.1048841, -1.797633, 0.4627451, 1, 0, 1,
-0.6363625, -1.166199, -1.343176, 0.4588235, 1, 0, 1,
-0.632074, 1.6232, 0.9762552, 0.4509804, 1, 0, 1,
-0.6308914, 0.0321707, -1.247029, 0.4470588, 1, 0, 1,
-0.6275425, -1.08227, -2.852854, 0.4392157, 1, 0, 1,
-0.6235224, 1.110079, -1.185228, 0.4352941, 1, 0, 1,
-0.6210964, -1.162378, -1.468954, 0.427451, 1, 0, 1,
-0.6202121, -0.4312433, -3.50044, 0.4235294, 1, 0, 1,
-0.6188254, 2.056833, -0.7148328, 0.4156863, 1, 0, 1,
-0.6185196, -0.3018633, -2.558299, 0.4117647, 1, 0, 1,
-0.6130172, -3.330131, -2.152342, 0.4039216, 1, 0, 1,
-0.6079845, -0.9168465, -2.99408, 0.3960784, 1, 0, 1,
-0.6072427, 1.418644, -0.53446, 0.3921569, 1, 0, 1,
-0.6058395, -0.5494855, -2.675071, 0.3843137, 1, 0, 1,
-0.6053583, 0.7902759, 0.02454966, 0.3803922, 1, 0, 1,
-0.6040844, 0.1836641, -2.5545, 0.372549, 1, 0, 1,
-0.602452, 0.1524573, -0.6716957, 0.3686275, 1, 0, 1,
-0.5988516, -0.677093, -3.202146, 0.3607843, 1, 0, 1,
-0.596437, -0.1449383, -1.849591, 0.3568628, 1, 0, 1,
-0.5946587, 2.233102, -0.6561745, 0.3490196, 1, 0, 1,
-0.5928937, 0.3164665, -1.719823, 0.345098, 1, 0, 1,
-0.5896464, 0.6934998, -0.03004943, 0.3372549, 1, 0, 1,
-0.5892402, 0.5694106, -0.7328015, 0.3333333, 1, 0, 1,
-0.5854282, 0.9416398, -1.301121, 0.3254902, 1, 0, 1,
-0.5830075, 0.7992284, -0.4457094, 0.3215686, 1, 0, 1,
-0.5789399, -0.3754715, -0.9221455, 0.3137255, 1, 0, 1,
-0.5769278, -1.382638, -1.901846, 0.3098039, 1, 0, 1,
-0.5685041, 0.8556922, 0.8727781, 0.3019608, 1, 0, 1,
-0.5638165, 0.1042316, -2.675775, 0.2941177, 1, 0, 1,
-0.559604, 3.70531, 0.2529431, 0.2901961, 1, 0, 1,
-0.5563634, 2.107309, 0.6413455, 0.282353, 1, 0, 1,
-0.5554011, 0.4477422, -0.3892648, 0.2784314, 1, 0, 1,
-0.5551696, -0.5877993, -2.299749, 0.2705882, 1, 0, 1,
-0.5538712, 0.105546, -2.256822, 0.2666667, 1, 0, 1,
-0.551038, 0.6320555, -2.027526, 0.2588235, 1, 0, 1,
-0.5453266, -1.94426, -1.270099, 0.254902, 1, 0, 1,
-0.5429433, 0.5540581, -2.741692, 0.2470588, 1, 0, 1,
-0.5427006, -0.1053106, -0.8617852, 0.2431373, 1, 0, 1,
-0.5401606, 1.935901, -0.7552524, 0.2352941, 1, 0, 1,
-0.535576, 1.247364, -2.014097, 0.2313726, 1, 0, 1,
-0.5270188, 0.4804218, -0.07834722, 0.2235294, 1, 0, 1,
-0.525467, -1.701353, -4.431478, 0.2196078, 1, 0, 1,
-0.5203878, -0.3526525, -3.397508, 0.2117647, 1, 0, 1,
-0.5182579, 0.6489182, -1.982774, 0.2078431, 1, 0, 1,
-0.5161156, -0.4176914, -3.559469, 0.2, 1, 0, 1,
-0.5154809, -0.9268395, -1.522526, 0.1921569, 1, 0, 1,
-0.5122073, -0.6652068, -1.958033, 0.1882353, 1, 0, 1,
-0.5071344, 1.716812, 0.9644138, 0.1803922, 1, 0, 1,
-0.504721, -0.1652438, -1.735444, 0.1764706, 1, 0, 1,
-0.5036791, -0.02033086, -1.164527, 0.1686275, 1, 0, 1,
-0.499922, -0.07272801, -1.315252, 0.1647059, 1, 0, 1,
-0.4990205, -0.768137, -2.711305, 0.1568628, 1, 0, 1,
-0.4952352, 0.2944314, -1.325031, 0.1529412, 1, 0, 1,
-0.4935893, -0.1809772, -1.195062, 0.145098, 1, 0, 1,
-0.4933484, -0.02401456, -0.4790256, 0.1411765, 1, 0, 1,
-0.4932182, -1.266285, -3.67811, 0.1333333, 1, 0, 1,
-0.4902514, -1.544415, -3.400064, 0.1294118, 1, 0, 1,
-0.4857578, -1.443719, -3.753257, 0.1215686, 1, 0, 1,
-0.4812078, 0.8079978, -0.7616057, 0.1176471, 1, 0, 1,
-0.4719289, -0.8943379, -1.269807, 0.1098039, 1, 0, 1,
-0.4695816, 0.7684634, -0.3701128, 0.1058824, 1, 0, 1,
-0.4660133, 0.4001054, -0.4026402, 0.09803922, 1, 0, 1,
-0.4645818, 0.6435637, -1.374363, 0.09019608, 1, 0, 1,
-0.4623828, 0.1978244, -1.805518, 0.08627451, 1, 0, 1,
-0.4613081, -0.6101685, -2.284202, 0.07843138, 1, 0, 1,
-0.4602903, -0.2285537, -2.02922, 0.07450981, 1, 0, 1,
-0.4593836, 0.4918481, -1.029941, 0.06666667, 1, 0, 1,
-0.4585083, -0.3697118, -1.521206, 0.0627451, 1, 0, 1,
-0.4428026, -0.3161022, -0.6997041, 0.05490196, 1, 0, 1,
-0.4382636, -1.458456, -5.757656, 0.05098039, 1, 0, 1,
-0.4373799, 0.2826158, -0.3269834, 0.04313726, 1, 0, 1,
-0.428606, -0.6206836, -1.502928, 0.03921569, 1, 0, 1,
-0.426143, 1.899051, 0.5423265, 0.03137255, 1, 0, 1,
-0.4241655, 0.407432, -1.142315, 0.02745098, 1, 0, 1,
-0.4186636, -1.452542, 0.5704077, 0.01960784, 1, 0, 1,
-0.4175666, 0.6898115, 1.751353, 0.01568628, 1, 0, 1,
-0.4170967, -0.4398305, -0.7926142, 0.007843138, 1, 0, 1,
-0.4165872, 0.5636826, -0.2506171, 0.003921569, 1, 0, 1,
-0.4153858, 1.091908, -1.67297, 0, 1, 0.003921569, 1,
-0.4143851, 1.503435, -0.08060274, 0, 1, 0.01176471, 1,
-0.4106719, 1.056466, -0.9290697, 0, 1, 0.01568628, 1,
-0.4096089, -0.8562806, -3.224474, 0, 1, 0.02352941, 1,
-0.4088427, 0.06496595, -1.297286, 0, 1, 0.02745098, 1,
-0.4034881, -0.5379798, -3.172312, 0, 1, 0.03529412, 1,
-0.4017577, -0.5703668, -1.317478, 0, 1, 0.03921569, 1,
-0.4015619, -0.4853756, -1.696041, 0, 1, 0.04705882, 1,
-0.400905, 0.7376931, -0.1662103, 0, 1, 0.05098039, 1,
-0.3983403, -1.711272, -4.396871, 0, 1, 0.05882353, 1,
-0.3967141, 0.6405711, 0.979642, 0, 1, 0.0627451, 1,
-0.3964171, -0.8207427, -2.065771, 0, 1, 0.07058824, 1,
-0.3934444, 1.027667, -1.034667, 0, 1, 0.07450981, 1,
-0.3917866, -1.642341, -2.470181, 0, 1, 0.08235294, 1,
-0.3865438, -2.334347, -4.52896, 0, 1, 0.08627451, 1,
-0.3848725, -1.62381, -2.616017, 0, 1, 0.09411765, 1,
-0.3844349, 1.904569, 0.3383962, 0, 1, 0.1019608, 1,
-0.3771578, 0.2936315, -1.953134, 0, 1, 0.1058824, 1,
-0.3769942, 0.1544555, -1.759588, 0, 1, 0.1137255, 1,
-0.3753399, -2.352979, -2.473381, 0, 1, 0.1176471, 1,
-0.3719968, 0.159406, -2.500924, 0, 1, 0.1254902, 1,
-0.3689724, 1.275554, 0.9375092, 0, 1, 0.1294118, 1,
-0.3682918, -0.5100889, -2.666764, 0, 1, 0.1372549, 1,
-0.3635879, 0.3188562, 0.5641695, 0, 1, 0.1411765, 1,
-0.3578726, 0.8226079, -1.072188, 0, 1, 0.1490196, 1,
-0.3575404, -0.9485139, -1.351928, 0, 1, 0.1529412, 1,
-0.3554181, 0.5977821, -1.292812, 0, 1, 0.1607843, 1,
-0.3548286, -1.085988, -3.344245, 0, 1, 0.1647059, 1,
-0.3532155, -0.006923242, -0.007847884, 0, 1, 0.172549, 1,
-0.3530587, -0.1320737, -0.9901757, 0, 1, 0.1764706, 1,
-0.3511025, -0.3308771, -1.048762, 0, 1, 0.1843137, 1,
-0.3470948, -0.7064509, -2.574827, 0, 1, 0.1882353, 1,
-0.3419965, -1.01428, -3.57351, 0, 1, 0.1960784, 1,
-0.3384129, 0.8574541, -0.4410684, 0, 1, 0.2039216, 1,
-0.3279661, 0.6130292, -0.2878359, 0, 1, 0.2078431, 1,
-0.3244509, -0.8052335, -1.558459, 0, 1, 0.2156863, 1,
-0.3216498, 0.07436058, -0.4002459, 0, 1, 0.2196078, 1,
-0.3199569, 1.152517, 1.072408, 0, 1, 0.227451, 1,
-0.3176514, -0.8792449, -1.972479, 0, 1, 0.2313726, 1,
-0.3137082, 0.006390077, -2.110545, 0, 1, 0.2392157, 1,
-0.310013, -1.198474, -1.592818, 0, 1, 0.2431373, 1,
-0.308645, -0.5447033, -5.821889, 0, 1, 0.2509804, 1,
-0.3017322, -1.050005, -3.082776, 0, 1, 0.254902, 1,
-0.3010046, 0.4389987, 0.4823302, 0, 1, 0.2627451, 1,
-0.2971186, 0.5683874, 0.8504692, 0, 1, 0.2666667, 1,
-0.2950995, 0.1384756, -1.425053, 0, 1, 0.2745098, 1,
-0.2919533, 0.7422627, -0.2067861, 0, 1, 0.2784314, 1,
-0.2853804, 0.5712965, -0.6170425, 0, 1, 0.2862745, 1,
-0.2846934, 0.7373731, 0.6266105, 0, 1, 0.2901961, 1,
-0.2838307, -1.860739, -3.366001, 0, 1, 0.2980392, 1,
-0.2782143, -1.871749, -2.402206, 0, 1, 0.3058824, 1,
-0.2781084, 0.02652121, -1.254075, 0, 1, 0.3098039, 1,
-0.2723599, 1.009626, -0.4169606, 0, 1, 0.3176471, 1,
-0.2718017, 0.2055058, 0.2539733, 0, 1, 0.3215686, 1,
-0.2696896, 0.1618052, -1.037115, 0, 1, 0.3294118, 1,
-0.2660644, 0.3749994, -0.4466977, 0, 1, 0.3333333, 1,
-0.2655544, -0.5669787, -1.915303, 0, 1, 0.3411765, 1,
-0.261003, -0.9928373, -2.868462, 0, 1, 0.345098, 1,
-0.2551444, -1.451855, -3.182831, 0, 1, 0.3529412, 1,
-0.2544354, 0.8156089, -0.7544824, 0, 1, 0.3568628, 1,
-0.253595, -1.114006, -4.347061, 0, 1, 0.3647059, 1,
-0.2531235, -0.04682479, -1.15653, 0, 1, 0.3686275, 1,
-0.2530206, 1.060128, -0.9742531, 0, 1, 0.3764706, 1,
-0.2528378, -1.356989, -2.111389, 0, 1, 0.3803922, 1,
-0.2457414, -0.591352, -2.468242, 0, 1, 0.3882353, 1,
-0.2448584, 0.6521655, -1.309916, 0, 1, 0.3921569, 1,
-0.243494, -0.68953, -2.080517, 0, 1, 0.4, 1,
-0.2434141, 1.248006, -0.5407358, 0, 1, 0.4078431, 1,
-0.2431699, 0.3055857, -1.826708, 0, 1, 0.4117647, 1,
-0.2416688, 1.214639, -0.2060291, 0, 1, 0.4196078, 1,
-0.2354758, -0.4532182, -4.023175, 0, 1, 0.4235294, 1,
-0.2318209, 0.6683996, -1.116629, 0, 1, 0.4313726, 1,
-0.2312908, -1.930721, -3.805813, 0, 1, 0.4352941, 1,
-0.2242397, -1.522431, -2.365797, 0, 1, 0.4431373, 1,
-0.2234914, 0.02430022, -0.7508443, 0, 1, 0.4470588, 1,
-0.2205785, -0.7252004, -3.679429, 0, 1, 0.454902, 1,
-0.2186128, -0.553344, -2.884025, 0, 1, 0.4588235, 1,
-0.2151278, 2.231806, 1.21136, 0, 1, 0.4666667, 1,
-0.2142347, 1.628697, 0.2131544, 0, 1, 0.4705882, 1,
-0.2071383, -0.6796871, -3.463669, 0, 1, 0.4784314, 1,
-0.203263, 0.5378307, 0.4384287, 0, 1, 0.4823529, 1,
-0.2021788, 0.2559802, -0.1015444, 0, 1, 0.4901961, 1,
-0.2005829, 1.518607, -0.7088082, 0, 1, 0.4941176, 1,
-0.1920606, 1.097324, -1.197905, 0, 1, 0.5019608, 1,
-0.1907029, 1.377238, 0.9941403, 0, 1, 0.509804, 1,
-0.1904288, 0.2861211, -0.5986125, 0, 1, 0.5137255, 1,
-0.1866954, 0.02405455, -1.639897, 0, 1, 0.5215687, 1,
-0.1864614, 0.5235149, -2.059355, 0, 1, 0.5254902, 1,
-0.1845733, 0.1505313, -1.705319, 0, 1, 0.5333334, 1,
-0.1826126, -0.6507211, -2.970053, 0, 1, 0.5372549, 1,
-0.1799694, -0.8918874, -3.168213, 0, 1, 0.5450981, 1,
-0.1787722, 0.02420644, 0.9362677, 0, 1, 0.5490196, 1,
-0.1764393, 2.087991, 0.2159574, 0, 1, 0.5568628, 1,
-0.1731499, 0.4035164, -1.55078, 0, 1, 0.5607843, 1,
-0.1712898, -0.8920566, -3.286024, 0, 1, 0.5686275, 1,
-0.1651184, -0.9333034, -3.788677, 0, 1, 0.572549, 1,
-0.1648119, 0.362316, -0.689402, 0, 1, 0.5803922, 1,
-0.1589968, -1.500938, -2.361797, 0, 1, 0.5843138, 1,
-0.1488583, 1.958369, 0.1527398, 0, 1, 0.5921569, 1,
-0.1472696, -1.317726, -2.826313, 0, 1, 0.5960785, 1,
-0.1404207, -0.3681681, -4.019109, 0, 1, 0.6039216, 1,
-0.1385838, 0.5893264, -0.5132853, 0, 1, 0.6117647, 1,
-0.136505, 0.06977184, -2.972873, 0, 1, 0.6156863, 1,
-0.1360732, 0.5115364, 1.287105, 0, 1, 0.6235294, 1,
-0.1340083, -0.7986891, -5.731692, 0, 1, 0.627451, 1,
-0.1335525, 0.781379, -1.454291, 0, 1, 0.6352941, 1,
-0.1318284, -0.9628305, -3.88899, 0, 1, 0.6392157, 1,
-0.1317629, 0.7736312, -0.2790038, 0, 1, 0.6470588, 1,
-0.1255715, 0.2343924, -0.7615244, 0, 1, 0.6509804, 1,
-0.1255371, -0.7035354, -1.418275, 0, 1, 0.6588235, 1,
-0.1160719, 0.5529186, -1.033474, 0, 1, 0.6627451, 1,
-0.1117847, -0.2384394, -2.390526, 0, 1, 0.6705883, 1,
-0.1109246, 0.1203413, -1.147659, 0, 1, 0.6745098, 1,
-0.1103627, -0.2052961, -2.933114, 0, 1, 0.682353, 1,
-0.1103575, -0.4520603, -3.891129, 0, 1, 0.6862745, 1,
-0.1102015, -0.06065831, -1.248326, 0, 1, 0.6941177, 1,
-0.1100458, 1.086567, 0.08328299, 0, 1, 0.7019608, 1,
-0.1089906, 1.536471, -1.267979, 0, 1, 0.7058824, 1,
-0.09902891, -0.3206701, -4.161331, 0, 1, 0.7137255, 1,
-0.0971195, 0.7218887, 1.530592, 0, 1, 0.7176471, 1,
-0.0958927, 1.881715, 0.69421, 0, 1, 0.7254902, 1,
-0.0924782, -0.09255266, -3.157824, 0, 1, 0.7294118, 1,
-0.092326, 0.8758324, -2.276222, 0, 1, 0.7372549, 1,
-0.09112601, -0.9349849, -2.909128, 0, 1, 0.7411765, 1,
-0.08838122, 1.212286, -0.4499399, 0, 1, 0.7490196, 1,
-0.08581185, 0.3124399, -0.7072465, 0, 1, 0.7529412, 1,
-0.08367398, 0.997998, -1.155541, 0, 1, 0.7607843, 1,
-0.07808392, 1.279898, 0.6494123, 0, 1, 0.7647059, 1,
-0.06749766, 1.380659, -0.2495436, 0, 1, 0.772549, 1,
-0.06625856, -0.6174419, -3.504321, 0, 1, 0.7764706, 1,
-0.06237188, 1.260015, -2.202729, 0, 1, 0.7843137, 1,
-0.06177173, -1.024592, -2.864037, 0, 1, 0.7882353, 1,
-0.06052795, -0.4237513, -3.821548, 0, 1, 0.7960784, 1,
-0.05930674, 0.6473964, 0.5735836, 0, 1, 0.8039216, 1,
-0.05661698, -0.4745029, -3.639688, 0, 1, 0.8078431, 1,
-0.05641854, -0.5088994, -2.238043, 0, 1, 0.8156863, 1,
-0.05079785, -0.5810998, -2.50859, 0, 1, 0.8196079, 1,
-0.0480933, -0.7916581, -4.163917, 0, 1, 0.827451, 1,
-0.04784233, -1.454281, -2.024507, 0, 1, 0.8313726, 1,
-0.04535161, -0.05816584, -2.15167, 0, 1, 0.8392157, 1,
-0.04528432, 1.723939, 0.5296928, 0, 1, 0.8431373, 1,
-0.0416892, -0.6642297, -3.576227, 0, 1, 0.8509804, 1,
-0.03658809, 0.5868384, -0.6370392, 0, 1, 0.854902, 1,
-0.03594529, 0.2100942, 0.2865663, 0, 1, 0.8627451, 1,
-0.03339576, -0.4707569, -2.715349, 0, 1, 0.8666667, 1,
-0.02837143, -0.604158, -3.336737, 0, 1, 0.8745098, 1,
-0.02482637, -0.2073826, -2.802308, 0, 1, 0.8784314, 1,
-0.02122529, -0.06439503, -3.342034, 0, 1, 0.8862745, 1,
-0.01903653, 0.07006343, -0.9524572, 0, 1, 0.8901961, 1,
-0.01584066, -2.151462, -2.347611, 0, 1, 0.8980392, 1,
-0.0135218, 0.0666402, 0.5097626, 0, 1, 0.9058824, 1,
-0.01208522, 0.1399353, -1.164477, 0, 1, 0.9098039, 1,
-0.01159513, 0.8695801, 0.4232202, 0, 1, 0.9176471, 1,
-0.01076967, 1.23589, -1.45939, 0, 1, 0.9215686, 1,
-0.01028342, -1.726071, -3.626152, 0, 1, 0.9294118, 1,
-0.009201245, -1.865431, -2.254653, 0, 1, 0.9333333, 1,
-0.006996079, 1.123799, 0.7232966, 0, 1, 0.9411765, 1,
-0.006416052, 1.813076, 0.01731939, 0, 1, 0.945098, 1,
0.0005036694, 0.7817549, -0.8209537, 0, 1, 0.9529412, 1,
0.008896959, -0.8989797, 3.068078, 0, 1, 0.9568627, 1,
0.01508238, 1.387372, 0.1628089, 0, 1, 0.9647059, 1,
0.01607921, 0.5473322, 0.4587378, 0, 1, 0.9686275, 1,
0.01695007, -0.1508897, 2.134966, 0, 1, 0.9764706, 1,
0.0171566, 0.3050421, 0.3885532, 0, 1, 0.9803922, 1,
0.01751236, -0.651282, 4.518646, 0, 1, 0.9882353, 1,
0.02164215, 0.7443527, 0.05180305, 0, 1, 0.9921569, 1,
0.02204953, 2.053692, 0.1747465, 0, 1, 1, 1,
0.02717708, 1.609853, 0.5771157, 0, 0.9921569, 1, 1,
0.03477015, -0.1474156, 3.311009, 0, 0.9882353, 1, 1,
0.03490668, -0.277355, 0.8230799, 0, 0.9803922, 1, 1,
0.03531408, -1.184112, 3.658443, 0, 0.9764706, 1, 1,
0.0392631, -0.8545908, 3.801238, 0, 0.9686275, 1, 1,
0.03958999, -0.3257807, 2.071388, 0, 0.9647059, 1, 1,
0.04129943, -1.202007, 1.280159, 0, 0.9568627, 1, 1,
0.04145042, 0.1764585, -0.8741205, 0, 0.9529412, 1, 1,
0.04293577, 0.4607779, -2.354521, 0, 0.945098, 1, 1,
0.04363246, 0.8905631, -1.439788, 0, 0.9411765, 1, 1,
0.04444314, -1.384217, 3.067735, 0, 0.9333333, 1, 1,
0.04503543, 0.9707277, 1.183445, 0, 0.9294118, 1, 1,
0.05131336, -0.3735971, 2.901689, 0, 0.9215686, 1, 1,
0.05672448, -0.662838, 3.942681, 0, 0.9176471, 1, 1,
0.0580474, 0.1090092, -0.09648323, 0, 0.9098039, 1, 1,
0.0587143, 1.615463, -1.455424, 0, 0.9058824, 1, 1,
0.05956472, -0.9172436, 2.243494, 0, 0.8980392, 1, 1,
0.06225247, -1.309685, 1.996164, 0, 0.8901961, 1, 1,
0.06361834, -0.6843437, 3.22177, 0, 0.8862745, 1, 1,
0.07104786, 1.885045, 0.3041646, 0, 0.8784314, 1, 1,
0.07149992, -3.20348, 1.228257, 0, 0.8745098, 1, 1,
0.0719299, -1.950051, 1.801112, 0, 0.8666667, 1, 1,
0.07205907, 0.8097579, 0.5439103, 0, 0.8627451, 1, 1,
0.07216848, -0.3914155, 2.235234, 0, 0.854902, 1, 1,
0.07538068, 1.220549, 2.291219, 0, 0.8509804, 1, 1,
0.08092722, -1.251651, 5.023993, 0, 0.8431373, 1, 1,
0.08472261, -0.8006088, 4.532495, 0, 0.8392157, 1, 1,
0.08541883, -0.5833251, 2.484242, 0, 0.8313726, 1, 1,
0.08824359, -1.008779, 2.047881, 0, 0.827451, 1, 1,
0.09298449, 0.0764489, 1.048498, 0, 0.8196079, 1, 1,
0.09493151, -0.4256299, 2.596373, 0, 0.8156863, 1, 1,
0.0968563, 0.07002252, -0.592968, 0, 0.8078431, 1, 1,
0.09915941, 0.7957308, 2.47865, 0, 0.8039216, 1, 1,
0.1019276, -0.6900188, 2.995218, 0, 0.7960784, 1, 1,
0.102095, 1.537283, -0.7596522, 0, 0.7882353, 1, 1,
0.1021388, 0.1740054, 1.016416, 0, 0.7843137, 1, 1,
0.1045738, -2.017699, 3.254127, 0, 0.7764706, 1, 1,
0.1080659, -0.1254252, 3.059067, 0, 0.772549, 1, 1,
0.1167628, -1.684724, 2.251315, 0, 0.7647059, 1, 1,
0.1179089, -0.1029673, 2.932519, 0, 0.7607843, 1, 1,
0.1265754, 0.9286772, -0.6688362, 0, 0.7529412, 1, 1,
0.1286828, -2.91122, 2.301731, 0, 0.7490196, 1, 1,
0.1299219, 1.013617, 2.018078, 0, 0.7411765, 1, 1,
0.1302458, -0.07372337, 2.34673, 0, 0.7372549, 1, 1,
0.1370386, 0.2407338, -1.348453, 0, 0.7294118, 1, 1,
0.1382277, -1.712804, 2.176243, 0, 0.7254902, 1, 1,
0.1386404, -0.5767033, 2.629793, 0, 0.7176471, 1, 1,
0.1405486, 1.775499, -0.06218118, 0, 0.7137255, 1, 1,
0.1418453, 1.213666, -0.7023164, 0, 0.7058824, 1, 1,
0.1424897, -0.8038973, 3.271523, 0, 0.6980392, 1, 1,
0.1440054, 0.5370021, -0.3131434, 0, 0.6941177, 1, 1,
0.1440469, 0.5243161, 0.07590236, 0, 0.6862745, 1, 1,
0.1441905, -0.3762679, 3.237559, 0, 0.682353, 1, 1,
0.1455847, 0.5928782, 0.8422267, 0, 0.6745098, 1, 1,
0.1463859, -0.1899172, 1.823888, 0, 0.6705883, 1, 1,
0.1468156, 0.8526124, -0.5286285, 0, 0.6627451, 1, 1,
0.1529237, -0.3892573, 1.023398, 0, 0.6588235, 1, 1,
0.1587578, 0.4181741, 0.6230758, 0, 0.6509804, 1, 1,
0.1600022, 0.3872307, 1.566392, 0, 0.6470588, 1, 1,
0.1640954, -1.288772, 3.698388, 0, 0.6392157, 1, 1,
0.1656941, -0.3516182, 3.159097, 0, 0.6352941, 1, 1,
0.168695, -0.1301603, 2.181638, 0, 0.627451, 1, 1,
0.1688162, -0.4106439, 3.323341, 0, 0.6235294, 1, 1,
0.1714406, -2.224285, 1.505725, 0, 0.6156863, 1, 1,
0.1754398, 0.1815414, -1.435138, 0, 0.6117647, 1, 1,
0.1784719, 0.3049108, 0.2044069, 0, 0.6039216, 1, 1,
0.1788883, 0.8771545, 1.847098, 0, 0.5960785, 1, 1,
0.1828777, 0.7528157, -2.145601, 0, 0.5921569, 1, 1,
0.1834261, 1.466931, 0.5638641, 0, 0.5843138, 1, 1,
0.1876298, 2.828494, -0.6161089, 0, 0.5803922, 1, 1,
0.1897129, 1.293989, -0.9761952, 0, 0.572549, 1, 1,
0.1940975, 1.280689, -0.05800802, 0, 0.5686275, 1, 1,
0.1947242, -0.4801077, 1.688359, 0, 0.5607843, 1, 1,
0.1953171, 1.090783, 0.06200562, 0, 0.5568628, 1, 1,
0.1961804, -0.8025443, 1.824123, 0, 0.5490196, 1, 1,
0.2044991, 0.7627207, 0.728421, 0, 0.5450981, 1, 1,
0.2050892, 0.2489027, 0.6385828, 0, 0.5372549, 1, 1,
0.2100828, -1.326797, 4.040249, 0, 0.5333334, 1, 1,
0.2113115, 1.654995, 1.416406, 0, 0.5254902, 1, 1,
0.2161161, 0.2121462, -1.089539, 0, 0.5215687, 1, 1,
0.2167839, -0.2824695, 3.904433, 0, 0.5137255, 1, 1,
0.2313589, -0.1781778, 1.896313, 0, 0.509804, 1, 1,
0.2350509, -1.050345, 4.187535, 0, 0.5019608, 1, 1,
0.2377331, 0.1305327, 1.161257, 0, 0.4941176, 1, 1,
0.2495898, 1.743208, -1.166491, 0, 0.4901961, 1, 1,
0.2578782, 0.5831204, 0.8478774, 0, 0.4823529, 1, 1,
0.2580073, 0.3283094, -0.432087, 0, 0.4784314, 1, 1,
0.2596593, 1.52286, 1.249027, 0, 0.4705882, 1, 1,
0.2677687, 0.4054242, 0.4511695, 0, 0.4666667, 1, 1,
0.2683291, -1.325328, 1.620685, 0, 0.4588235, 1, 1,
0.2702008, -0.6797689, 3.577972, 0, 0.454902, 1, 1,
0.2716422, -1.989732, 4.3771, 0, 0.4470588, 1, 1,
0.2748967, -0.9906486, 3.509366, 0, 0.4431373, 1, 1,
0.2848217, -0.04312358, 2.145724, 0, 0.4352941, 1, 1,
0.2885321, -0.9795712, 4.572316, 0, 0.4313726, 1, 1,
0.2907176, -0.8136948, 3.226849, 0, 0.4235294, 1, 1,
0.2908082, 1.905657, -0.3611704, 0, 0.4196078, 1, 1,
0.292975, 0.9635811, -0.9369704, 0, 0.4117647, 1, 1,
0.2953412, 0.3137587, 0.6311634, 0, 0.4078431, 1, 1,
0.3011561, 1.188581, 0.9242921, 0, 0.4, 1, 1,
0.3078096, 3.366078, -0.02871811, 0, 0.3921569, 1, 1,
0.3150309, 1.705495, 0.3952812, 0, 0.3882353, 1, 1,
0.3152498, 1.148957, 0.1532279, 0, 0.3803922, 1, 1,
0.3166867, -0.880037, 2.704442, 0, 0.3764706, 1, 1,
0.316734, 0.1754253, 2.169692, 0, 0.3686275, 1, 1,
0.3223095, 0.7455313, -1.283114, 0, 0.3647059, 1, 1,
0.3237849, 1.597018, 0.8375508, 0, 0.3568628, 1, 1,
0.3268477, 1.803054, -0.6803892, 0, 0.3529412, 1, 1,
0.3282584, -1.334579, 2.095483, 0, 0.345098, 1, 1,
0.3304756, 1.063436, 0.1158233, 0, 0.3411765, 1, 1,
0.3305192, -1.1966, 3.26111, 0, 0.3333333, 1, 1,
0.3349911, 1.6195, 1.295695, 0, 0.3294118, 1, 1,
0.3359946, -0.8907867, 3.021083, 0, 0.3215686, 1, 1,
0.3433747, -1.094145, 2.832074, 0, 0.3176471, 1, 1,
0.345165, 0.1663414, 1.067342, 0, 0.3098039, 1, 1,
0.3459305, 2.190186, -0.8122932, 0, 0.3058824, 1, 1,
0.3559017, -0.3696304, 2.929204, 0, 0.2980392, 1, 1,
0.3592055, 0.7246646, 0.9778888, 0, 0.2901961, 1, 1,
0.3593211, -1.544761, 2.395666, 0, 0.2862745, 1, 1,
0.3609372, -0.950756, 1.797849, 0, 0.2784314, 1, 1,
0.3629998, 0.6543407, 1.612844, 0, 0.2745098, 1, 1,
0.3677612, 0.6751153, 1.499141, 0, 0.2666667, 1, 1,
0.3704889, -0.5715353, 3.273552, 0, 0.2627451, 1, 1,
0.371395, -1.058197, 2.027229, 0, 0.254902, 1, 1,
0.3716185, 0.4905879, 2.035079, 0, 0.2509804, 1, 1,
0.3726274, 1.137179, 0.4883109, 0, 0.2431373, 1, 1,
0.3767816, 0.2547236, -0.3858263, 0, 0.2392157, 1, 1,
0.376862, 0.8749068, 1.641936, 0, 0.2313726, 1, 1,
0.3772582, -1.873806, 1.094291, 0, 0.227451, 1, 1,
0.3800024, 1.637779, 0.5672855, 0, 0.2196078, 1, 1,
0.3857889, 0.1344542, 0.7908015, 0, 0.2156863, 1, 1,
0.3859727, 0.4209415, 1.544858, 0, 0.2078431, 1, 1,
0.3890579, -0.1247053, 0.3337325, 0, 0.2039216, 1, 1,
0.3915019, -0.883911, 2.177989, 0, 0.1960784, 1, 1,
0.3938575, -0.7505333, 4.329519, 0, 0.1882353, 1, 1,
0.4002331, 0.8602778, -0.1285591, 0, 0.1843137, 1, 1,
0.4004539, 1.066354, 1.773979, 0, 0.1764706, 1, 1,
0.4014753, 1.278015, -0.5719674, 0, 0.172549, 1, 1,
0.4029369, -0.6661262, 5.14684, 0, 0.1647059, 1, 1,
0.4032219, -0.3282375, 2.863088, 0, 0.1607843, 1, 1,
0.4038866, 1.19261, 0.3383851, 0, 0.1529412, 1, 1,
0.4045071, -0.298009, 2.010643, 0, 0.1490196, 1, 1,
0.4078444, 0.5863999, 1.594215, 0, 0.1411765, 1, 1,
0.4088363, 0.03996936, 0.1040052, 0, 0.1372549, 1, 1,
0.4166799, 0.02575742, 1.142628, 0, 0.1294118, 1, 1,
0.4167182, -0.4916161, 3.117439, 0, 0.1254902, 1, 1,
0.4191395, 0.9302231, -1.921836, 0, 0.1176471, 1, 1,
0.4210856, -2.34583, 2.608057, 0, 0.1137255, 1, 1,
0.4211699, -1.222747, 2.34995, 0, 0.1058824, 1, 1,
0.4222774, 1.775755, 1.142583, 0, 0.09803922, 1, 1,
0.4224387, -0.5584013, 3.455843, 0, 0.09411765, 1, 1,
0.4261498, -1.436221, 3.234476, 0, 0.08627451, 1, 1,
0.426424, -0.6177037, 1.974475, 0, 0.08235294, 1, 1,
0.4287437, -0.5976652, 1.305494, 0, 0.07450981, 1, 1,
0.4345287, -0.4714681, 2.817239, 0, 0.07058824, 1, 1,
0.4359634, -0.4427792, 1.489662, 0, 0.0627451, 1, 1,
0.4375884, 0.1219043, 0.7344211, 0, 0.05882353, 1, 1,
0.4378635, -0.2527534, 0.5316498, 0, 0.05098039, 1, 1,
0.4401007, -0.650915, 2.99977, 0, 0.04705882, 1, 1,
0.4441468, 1.091205, 0.8743261, 0, 0.03921569, 1, 1,
0.448769, 1.341111, -0.3219464, 0, 0.03529412, 1, 1,
0.449219, 1.187463, 2.131377, 0, 0.02745098, 1, 1,
0.4509913, -1.757357, 2.207948, 0, 0.02352941, 1, 1,
0.4572658, -0.7940578, 4.066494, 0, 0.01568628, 1, 1,
0.4587382, -0.188622, 1.255995, 0, 0.01176471, 1, 1,
0.4591646, -0.1773951, 0.1918178, 0, 0.003921569, 1, 1,
0.4625752, -1.289661, 2.133068, 0.003921569, 0, 1, 1,
0.4640015, -0.4830621, 3.210912, 0.007843138, 0, 1, 1,
0.4651459, -1.632875, 3.704732, 0.01568628, 0, 1, 1,
0.4655124, 0.7116326, 0.473067, 0.01960784, 0, 1, 1,
0.4665118, -1.376197, 4.225692, 0.02745098, 0, 1, 1,
0.4747151, 2.673719, -1.117306, 0.03137255, 0, 1, 1,
0.4787565, -0.797675, 2.603385, 0.03921569, 0, 1, 1,
0.4797198, 0.6390871, 0.9326676, 0.04313726, 0, 1, 1,
0.4812718, -0.002461122, 1.068093, 0.05098039, 0, 1, 1,
0.4833315, 0.1645069, 2.899122, 0.05490196, 0, 1, 1,
0.4862585, 1.043674, 1.856057, 0.0627451, 0, 1, 1,
0.4915828, -0.4519087, 1.265429, 0.06666667, 0, 1, 1,
0.4946242, 0.9497609, 2.153579, 0.07450981, 0, 1, 1,
0.4949046, -1.008671, 4.046209, 0.07843138, 0, 1, 1,
0.4973748, -0.4642853, 1.907952, 0.08627451, 0, 1, 1,
0.5015638, -0.6699932, 2.581722, 0.09019608, 0, 1, 1,
0.5069041, 0.2693941, 0.6471077, 0.09803922, 0, 1, 1,
0.5075023, 0.211214, -0.09390318, 0.1058824, 0, 1, 1,
0.5102568, -0.9238473, 2.632292, 0.1098039, 0, 1, 1,
0.5119348, 0.08248815, 1.942951, 0.1176471, 0, 1, 1,
0.5123877, 0.1674615, 1.844344, 0.1215686, 0, 1, 1,
0.5137761, 2.265841, 1.020835, 0.1294118, 0, 1, 1,
0.5139101, 0.05041793, -0.4478845, 0.1333333, 0, 1, 1,
0.5151985, 0.4250309, 1.269984, 0.1411765, 0, 1, 1,
0.5159403, -1.082946, 1.72999, 0.145098, 0, 1, 1,
0.5173231, -0.8425019, 2.125365, 0.1529412, 0, 1, 1,
0.5179119, -1.394982, 1.628053, 0.1568628, 0, 1, 1,
0.5207644, -0.1243085, 1.977178, 0.1647059, 0, 1, 1,
0.5270039, 1.541053, -0.4120829, 0.1686275, 0, 1, 1,
0.5291954, 0.06074599, 0.9376971, 0.1764706, 0, 1, 1,
0.529753, 1.285585, -1.327991, 0.1803922, 0, 1, 1,
0.5318537, -0.8803329, 1.472561, 0.1882353, 0, 1, 1,
0.5381174, -0.2058377, 2.295986, 0.1921569, 0, 1, 1,
0.5407012, 1.732138, -1.096124, 0.2, 0, 1, 1,
0.5428367, -1.854572, 2.816035, 0.2078431, 0, 1, 1,
0.5428726, 2.713491, 1.007922, 0.2117647, 0, 1, 1,
0.5441324, 1.325271, 1.454384, 0.2196078, 0, 1, 1,
0.546524, 0.5625946, -0.4121941, 0.2235294, 0, 1, 1,
0.5511076, 0.5334013, 1.697085, 0.2313726, 0, 1, 1,
0.5515723, -0.807676, 2.758231, 0.2352941, 0, 1, 1,
0.5518078, 0.09743054, 1.88303, 0.2431373, 0, 1, 1,
0.5555471, -0.1834286, 3.410667, 0.2470588, 0, 1, 1,
0.5562999, -0.4855118, 4.340681, 0.254902, 0, 1, 1,
0.5588065, -0.003859079, 1.642752, 0.2588235, 0, 1, 1,
0.5655079, 0.5393382, -1.731671, 0.2666667, 0, 1, 1,
0.5686293, 0.7061846, -1.160381, 0.2705882, 0, 1, 1,
0.5733734, -0.4998236, 2.23119, 0.2784314, 0, 1, 1,
0.5733888, -1.839067, 2.56804, 0.282353, 0, 1, 1,
0.5752453, -0.003044383, 1.677956, 0.2901961, 0, 1, 1,
0.5759475, 0.6543961, -0.6434099, 0.2941177, 0, 1, 1,
0.576271, -0.520784, 3.672268, 0.3019608, 0, 1, 1,
0.579402, 0.1397518, 2.585307, 0.3098039, 0, 1, 1,
0.5832894, 1.477369, 0.1717401, 0.3137255, 0, 1, 1,
0.5894638, 2.066504, -0.05891798, 0.3215686, 0, 1, 1,
0.5898716, 1.068335, -0.8918571, 0.3254902, 0, 1, 1,
0.5954305, -1.286531, 3.997925, 0.3333333, 0, 1, 1,
0.6039303, 0.02227411, 0.04703876, 0.3372549, 0, 1, 1,
0.6093682, 0.4140467, 0.1722612, 0.345098, 0, 1, 1,
0.6194178, 1.12833, 1.463519, 0.3490196, 0, 1, 1,
0.6277508, -1.471846, 3.035573, 0.3568628, 0, 1, 1,
0.6291328, -0.0316512, 1.145069, 0.3607843, 0, 1, 1,
0.6341913, 0.3048141, 0.1541701, 0.3686275, 0, 1, 1,
0.643024, 1.037227, 0.5429265, 0.372549, 0, 1, 1,
0.6485172, -0.456997, 3.123679, 0.3803922, 0, 1, 1,
0.6497791, 0.2200248, 0.4804584, 0.3843137, 0, 1, 1,
0.6510568, -0.7742704, 2.216566, 0.3921569, 0, 1, 1,
0.6513346, 0.7470801, 1.522923, 0.3960784, 0, 1, 1,
0.6519589, 0.1505698, 2.763409, 0.4039216, 0, 1, 1,
0.6543838, 0.5976145, 0.6963636, 0.4117647, 0, 1, 1,
0.6557299, 2.154203, -0.06171701, 0.4156863, 0, 1, 1,
0.6573055, 0.9387219, 2.017273, 0.4235294, 0, 1, 1,
0.6579575, 0.09160431, 0.9658448, 0.427451, 0, 1, 1,
0.6630024, -0.2849029, 2.409986, 0.4352941, 0, 1, 1,
0.668843, 1.301302, 0.1876673, 0.4392157, 0, 1, 1,
0.6718534, -1.008591, 0.8578172, 0.4470588, 0, 1, 1,
0.6808322, -1.172615, 2.786025, 0.4509804, 0, 1, 1,
0.6895379, -1.300541, 1.025057, 0.4588235, 0, 1, 1,
0.6897144, -0.713256, 2.498336, 0.4627451, 0, 1, 1,
0.6961878, 0.07834475, 0.8224183, 0.4705882, 0, 1, 1,
0.6963568, -1.721146, 1.724245, 0.4745098, 0, 1, 1,
0.697718, -1.997451, 3.830485, 0.4823529, 0, 1, 1,
0.7039068, -0.1792143, 1.180447, 0.4862745, 0, 1, 1,
0.7042235, -0.6919914, 3.341145, 0.4941176, 0, 1, 1,
0.7046944, 0.07371103, 1.035749, 0.5019608, 0, 1, 1,
0.7052345, 0.4978882, 1.209629, 0.5058824, 0, 1, 1,
0.705757, -0.365, 1.161458, 0.5137255, 0, 1, 1,
0.7061402, -0.6585435, 4.062473, 0.5176471, 0, 1, 1,
0.7102544, 1.006408, -0.9668931, 0.5254902, 0, 1, 1,
0.7223174, -2.229165, 2.784491, 0.5294118, 0, 1, 1,
0.7270374, 2.409083, -0.4253817, 0.5372549, 0, 1, 1,
0.7290712, -0.9518026, 2.780068, 0.5411765, 0, 1, 1,
0.7310247, -0.8413796, 1.79183, 0.5490196, 0, 1, 1,
0.7337769, 1.982186, -0.1551178, 0.5529412, 0, 1, 1,
0.7407671, 1.724438, 1.433221, 0.5607843, 0, 1, 1,
0.7533134, -0.9109652, 1.296297, 0.5647059, 0, 1, 1,
0.7536207, 0.4386237, 1.376711, 0.572549, 0, 1, 1,
0.7536351, -0.4121104, 2.613283, 0.5764706, 0, 1, 1,
0.755018, -0.9092575, 1.318269, 0.5843138, 0, 1, 1,
0.7561381, 0.9089521, 0.3412884, 0.5882353, 0, 1, 1,
0.7565077, -0.1949688, 0.6113998, 0.5960785, 0, 1, 1,
0.7617391, -1.20196, 2.412136, 0.6039216, 0, 1, 1,
0.7618119, -3.185503, 3.910642, 0.6078432, 0, 1, 1,
0.7652176, 0.3262499, 3.793588, 0.6156863, 0, 1, 1,
0.7681842, 0.6205717, 1.567504, 0.6196079, 0, 1, 1,
0.7712749, -1.49653, 0.09759314, 0.627451, 0, 1, 1,
0.774693, 0.4237583, -1.311532, 0.6313726, 0, 1, 1,
0.7793126, -0.0166798, 2.061825, 0.6392157, 0, 1, 1,
0.7804011, 0.143471, 1.550328, 0.6431373, 0, 1, 1,
0.7816573, 1.324093, 0.5818387, 0.6509804, 0, 1, 1,
0.7833853, 0.8290826, 1.640734, 0.654902, 0, 1, 1,
0.786625, -0.3521222, 0.7422393, 0.6627451, 0, 1, 1,
0.7876792, 0.7705474, 0.5081422, 0.6666667, 0, 1, 1,
0.7945126, 0.2418301, 1.077684, 0.6745098, 0, 1, 1,
0.7946094, -0.5382324, 2.974207, 0.6784314, 0, 1, 1,
0.7976488, 0.8220661, 0.7684228, 0.6862745, 0, 1, 1,
0.80293, 0.2055426, 1.591285, 0.6901961, 0, 1, 1,
0.8042181, -1.319511, 3.118902, 0.6980392, 0, 1, 1,
0.8102239, 1.181655, -1.277643, 0.7058824, 0, 1, 1,
0.8212299, 1.231435, -0.4667347, 0.7098039, 0, 1, 1,
0.8225386, -0.4416515, 3.130694, 0.7176471, 0, 1, 1,
0.8270659, -0.6363803, 1.191744, 0.7215686, 0, 1, 1,
0.8288718, -0.4803651, 2.429892, 0.7294118, 0, 1, 1,
0.8333713, -0.3176599, 2.224081, 0.7333333, 0, 1, 1,
0.8338295, 0.07010867, 0.655625, 0.7411765, 0, 1, 1,
0.8342605, -1.029463, 1.776611, 0.7450981, 0, 1, 1,
0.8361603, -0.07062823, 2.631028, 0.7529412, 0, 1, 1,
0.8420238, -0.1821149, 3.271977, 0.7568628, 0, 1, 1,
0.8456954, -1.96656, 3.88336, 0.7647059, 0, 1, 1,
0.851765, 0.9967986, 0.8252437, 0.7686275, 0, 1, 1,
0.8528434, 1.224746, 0.4530405, 0.7764706, 0, 1, 1,
0.8573532, 1.493281, 0.05613795, 0.7803922, 0, 1, 1,
0.8581339, -0.3156058, 2.849736, 0.7882353, 0, 1, 1,
0.8587767, -0.2807646, 1.488194, 0.7921569, 0, 1, 1,
0.8598321, -0.9050611, 0.4912519, 0.8, 0, 1, 1,
0.8606272, -1.267595, 3.346717, 0.8078431, 0, 1, 1,
0.8620188, 0.731843, -0.8956984, 0.8117647, 0, 1, 1,
0.8651324, -0.3008977, 2.555859, 0.8196079, 0, 1, 1,
0.8687856, -1.276947, 1.415618, 0.8235294, 0, 1, 1,
0.8716366, -0.9488434, 1.066499, 0.8313726, 0, 1, 1,
0.8729298, 1.291667, -0.3015571, 0.8352941, 0, 1, 1,
0.8770866, 0.5291748, -0.3320011, 0.8431373, 0, 1, 1,
0.8783578, 0.3846029, 0.415347, 0.8470588, 0, 1, 1,
0.8797112, 1.211984, -0.3687889, 0.854902, 0, 1, 1,
0.8809479, -0.8031867, 2.709472, 0.8588235, 0, 1, 1,
0.8891279, 0.1880413, 0.08061775, 0.8666667, 0, 1, 1,
0.8924771, -1.056838, 3.992845, 0.8705882, 0, 1, 1,
0.8939068, -1.469772, 1.034935, 0.8784314, 0, 1, 1,
0.8943939, -1.170789, 2.206874, 0.8823529, 0, 1, 1,
0.8952026, 1.113328, 0.4166034, 0.8901961, 0, 1, 1,
0.8965143, -0.06765337, 1.969146, 0.8941177, 0, 1, 1,
0.897388, 0.01933549, 0.6964913, 0.9019608, 0, 1, 1,
0.9039717, 1.202815, 2.413219, 0.9098039, 0, 1, 1,
0.9091411, 0.9874219, 2.694302, 0.9137255, 0, 1, 1,
0.9104974, 0.5986742, 1.951593, 0.9215686, 0, 1, 1,
0.9112352, -1.352375, 1.903848, 0.9254902, 0, 1, 1,
0.9165763, 1.426033, 0.6292324, 0.9333333, 0, 1, 1,
0.9169106, -0.09337009, 0.864969, 0.9372549, 0, 1, 1,
0.9190418, -0.1493362, 1.466515, 0.945098, 0, 1, 1,
0.9233858, 1.101395, 0.06571399, 0.9490196, 0, 1, 1,
0.9248354, -3.293815, 3.496376, 0.9568627, 0, 1, 1,
0.9285044, -1.149848, 0.9297906, 0.9607843, 0, 1, 1,
0.9309112, 0.1174101, 2.183125, 0.9686275, 0, 1, 1,
0.9341521, 0.3322327, 0.4365465, 0.972549, 0, 1, 1,
0.9438953, 0.6372557, 3.381288, 0.9803922, 0, 1, 1,
0.9473004, 0.2896068, 0.07394114, 0.9843137, 0, 1, 1,
0.9491587, 0.6083955, 0.6951546, 0.9921569, 0, 1, 1,
0.9578818, -0.5294998, 3.009928, 0.9960784, 0, 1, 1,
0.961819, 0.3675646, 0.7787932, 1, 0, 0.9960784, 1,
0.9668934, 0.4320165, 0.3414484, 1, 0, 0.9882353, 1,
0.9733165, -0.6089184, 2.109775, 1, 0, 0.9843137, 1,
0.9744889, 0.5764425, 2.276463, 1, 0, 0.9764706, 1,
0.9757913, -0.4730254, 2.423122, 1, 0, 0.972549, 1,
0.9782796, -0.07101603, 1.870644, 1, 0, 0.9647059, 1,
0.981097, -0.858926, 1.712505, 1, 0, 0.9607843, 1,
0.9817014, -0.9217596, 2.365942, 1, 0, 0.9529412, 1,
0.9873126, 0.6094168, 2.153302, 1, 0, 0.9490196, 1,
0.9908818, 1.741153, 0.7952237, 1, 0, 0.9411765, 1,
0.9912181, 2.36048, 0.7925348, 1, 0, 0.9372549, 1,
0.9926805, 1.187674, 0.7013997, 1, 0, 0.9294118, 1,
1.003025, 0.3221922, 1.820258, 1, 0, 0.9254902, 1,
1.005483, 0.4932881, 2.107338, 1, 0, 0.9176471, 1,
1.011858, 1.059024, 0.9891521, 1, 0, 0.9137255, 1,
1.023963, 1.651123, -0.871148, 1, 0, 0.9058824, 1,
1.026293, 0.5274174, 1.622036, 1, 0, 0.9019608, 1,
1.027499, -1.124447, 3.7747, 1, 0, 0.8941177, 1,
1.03143, 0.4501989, 2.073728, 1, 0, 0.8862745, 1,
1.031964, 0.1604404, 0.2098571, 1, 0, 0.8823529, 1,
1.035019, -1.595576, 3.574156, 1, 0, 0.8745098, 1,
1.0373, 0.09247109, 0.9699727, 1, 0, 0.8705882, 1,
1.048782, 0.07607947, 0.1796579, 1, 0, 0.8627451, 1,
1.053162, 1.903016, 0.1823475, 1, 0, 0.8588235, 1,
1.056396, 0.2725694, 1.097005, 1, 0, 0.8509804, 1,
1.058951, -1.280956, 1.698677, 1, 0, 0.8470588, 1,
1.072289, -0.2257108, 2.001115, 1, 0, 0.8392157, 1,
1.07564, -1.03747, 3.986136, 1, 0, 0.8352941, 1,
1.08289, -0.8714651, 2.120995, 1, 0, 0.827451, 1,
1.086759, -0.7627527, 2.315886, 1, 0, 0.8235294, 1,
1.095626, -0.714336, 3.634313, 1, 0, 0.8156863, 1,
1.098138, 1.199541, 1.142337, 1, 0, 0.8117647, 1,
1.098899, -0.3063749, 0.1075099, 1, 0, 0.8039216, 1,
1.099937, -0.7251664, 3.429104, 1, 0, 0.7960784, 1,
1.100274, -0.3148158, 1.756091, 1, 0, 0.7921569, 1,
1.101498, 0.894851, 2.094919, 1, 0, 0.7843137, 1,
1.112093, -0.5025753, 2.759353, 1, 0, 0.7803922, 1,
1.134293, -0.5221647, 3.835671, 1, 0, 0.772549, 1,
1.135404, -0.1562678, 1.641935, 1, 0, 0.7686275, 1,
1.13619, 0.4702287, 0.8743671, 1, 0, 0.7607843, 1,
1.136737, -1.087856, 2.231287, 1, 0, 0.7568628, 1,
1.149411, -0.5557343, 2.587566, 1, 0, 0.7490196, 1,
1.167452, 0.5046839, 1.406272, 1, 0, 0.7450981, 1,
1.172502, -0.6556079, 1.787996, 1, 0, 0.7372549, 1,
1.180529, -0.918219, 3.666416, 1, 0, 0.7333333, 1,
1.193686, -1.403725, 2.590586, 1, 0, 0.7254902, 1,
1.200279, -0.986869, 2.626092, 1, 0, 0.7215686, 1,
1.206164, 0.2866181, 1.407333, 1, 0, 0.7137255, 1,
1.212291, -1.012867, 3.081845, 1, 0, 0.7098039, 1,
1.216701, 0.361669, 2.896156, 1, 0, 0.7019608, 1,
1.222286, -0.4410585, 1.563738, 1, 0, 0.6941177, 1,
1.223157, -0.4309404, 2.643612, 1, 0, 0.6901961, 1,
1.23673, 0.1825112, 2.882296, 1, 0, 0.682353, 1,
1.238453, -0.3904606, 1.72714, 1, 0, 0.6784314, 1,
1.243199, 0.2728241, 1.480879, 1, 0, 0.6705883, 1,
1.250567, -0.3199585, 3.100746, 1, 0, 0.6666667, 1,
1.252581, 1.001292, 0.2375344, 1, 0, 0.6588235, 1,
1.279926, 0.2802699, 4.67263, 1, 0, 0.654902, 1,
1.292142, 2.266066, 0.5360892, 1, 0, 0.6470588, 1,
1.293395, -1.33861, 2.1405, 1, 0, 0.6431373, 1,
1.301003, -0.5963148, 1.057792, 1, 0, 0.6352941, 1,
1.302921, -0.274703, 1.870183, 1, 0, 0.6313726, 1,
1.304633, -0.07823264, 2.487755, 1, 0, 0.6235294, 1,
1.309125, -0.2507388, 0.5483151, 1, 0, 0.6196079, 1,
1.309803, 0.01393624, 1.336611, 1, 0, 0.6117647, 1,
1.310022, 0.4657619, 2.28854, 1, 0, 0.6078432, 1,
1.3102, -1.192112, 2.623966, 1, 0, 0.6, 1,
1.312476, 1.39537, 0.9248414, 1, 0, 0.5921569, 1,
1.325574, -1.220593, 1.07959, 1, 0, 0.5882353, 1,
1.326705, -2.045528, 1.425677, 1, 0, 0.5803922, 1,
1.326894, -2.154789, 3.234038, 1, 0, 0.5764706, 1,
1.340883, 1.108811, 1.941853, 1, 0, 0.5686275, 1,
1.354033, -0.1504275, -0.06813176, 1, 0, 0.5647059, 1,
1.354188, -0.9024351, 1.258766, 1, 0, 0.5568628, 1,
1.365165, -1.083818, 1.650371, 1, 0, 0.5529412, 1,
1.369004, -0.519909, 2.630056, 1, 0, 0.5450981, 1,
1.37526, -0.9449359, 2.672527, 1, 0, 0.5411765, 1,
1.386545, -0.5074325, 2.547331, 1, 0, 0.5333334, 1,
1.387244, -0.4251578, 2.27297, 1, 0, 0.5294118, 1,
1.392779, 0.4461367, 2.377321, 1, 0, 0.5215687, 1,
1.413401, 0.3725599, 0.6026433, 1, 0, 0.5176471, 1,
1.423644, 0.8854217, 2.152915, 1, 0, 0.509804, 1,
1.431037, -1.007127, 2.221049, 1, 0, 0.5058824, 1,
1.431352, -0.569325, 2.298733, 1, 0, 0.4980392, 1,
1.433935, 1.347274, -0.03445348, 1, 0, 0.4901961, 1,
1.472768, 1.339823, 1.402672, 1, 0, 0.4862745, 1,
1.475054, -0.1564435, 1.420404, 1, 0, 0.4784314, 1,
1.483932, 1.266723, 2.608424, 1, 0, 0.4745098, 1,
1.485921, -0.001423983, 2.093285, 1, 0, 0.4666667, 1,
1.488165, -1.691061, 1.524378, 1, 0, 0.4627451, 1,
1.496062, 0.1410272, 1.463258, 1, 0, 0.454902, 1,
1.50516, -1.392078, 1.414908, 1, 0, 0.4509804, 1,
1.506145, 1.39344, 1.305525, 1, 0, 0.4431373, 1,
1.51589, 0.07273988, 0.4341845, 1, 0, 0.4392157, 1,
1.516625, -0.3359516, 1.141431, 1, 0, 0.4313726, 1,
1.517289, 0.5424604, 3.656754, 1, 0, 0.427451, 1,
1.521921, 0.8045794, 2.957746, 1, 0, 0.4196078, 1,
1.536514, -0.03661837, 2.589397, 1, 0, 0.4156863, 1,
1.538703, 0.1568568, 1.32054, 1, 0, 0.4078431, 1,
1.538804, -0.7675202, 1.437942, 1, 0, 0.4039216, 1,
1.547329, -1.435143, 1.30884, 1, 0, 0.3960784, 1,
1.548478, 1.756864, 1.942626, 1, 0, 0.3882353, 1,
1.576952, -0.2210729, 1.47299, 1, 0, 0.3843137, 1,
1.595057, -1.31514, 2.242553, 1, 0, 0.3764706, 1,
1.613903, 1.363244, 0.7906064, 1, 0, 0.372549, 1,
1.62094, -0.496078, 1.155943, 1, 0, 0.3647059, 1,
1.630955, -1.472594, 2.508406, 1, 0, 0.3607843, 1,
1.646707, -1.150218, 1.163738, 1, 0, 0.3529412, 1,
1.65701, -0.5213498, 1.373161, 1, 0, 0.3490196, 1,
1.671988, -1.480152, 2.764535, 1, 0, 0.3411765, 1,
1.67422, -0.2331225, 2.087282, 1, 0, 0.3372549, 1,
1.677199, -1.900617, 3.105103, 1, 0, 0.3294118, 1,
1.679825, -0.4280145, -0.04994564, 1, 0, 0.3254902, 1,
1.683874, -1.594186, 0.7498276, 1, 0, 0.3176471, 1,
1.686891, -1.494443, 1.939993, 1, 0, 0.3137255, 1,
1.688401, -0.3639839, 2.852282, 1, 0, 0.3058824, 1,
1.697882, -0.8530894, 2.890747, 1, 0, 0.2980392, 1,
1.711201, -0.04865142, 2.608835, 1, 0, 0.2941177, 1,
1.725619, 1.274322, 0.0492764, 1, 0, 0.2862745, 1,
1.735057, 0.1635105, 0.828319, 1, 0, 0.282353, 1,
1.752388, -1.111932, 1.172286, 1, 0, 0.2745098, 1,
1.755867, 0.4715121, 1.737879, 1, 0, 0.2705882, 1,
1.783339, 0.5369103, 0.7766336, 1, 0, 0.2627451, 1,
1.818302, 2.861151, -0.9755306, 1, 0, 0.2588235, 1,
1.818378, -0.6058369, 2.491848, 1, 0, 0.2509804, 1,
1.818711, -0.2986808, 1.749251, 1, 0, 0.2470588, 1,
1.837287, -0.0900119, 0.8864676, 1, 0, 0.2392157, 1,
1.852466, -0.1411965, 1.42441, 1, 0, 0.2352941, 1,
1.888929, 0.5057721, 2.466431, 1, 0, 0.227451, 1,
1.900631, 1.750057, 0.6139748, 1, 0, 0.2235294, 1,
1.905225, 0.2907977, 1.916736, 1, 0, 0.2156863, 1,
1.90755, 0.3881511, 0.9837887, 1, 0, 0.2117647, 1,
1.92081, 2.263335, 2.552511, 1, 0, 0.2039216, 1,
1.923729, -0.4937513, 2.784956, 1, 0, 0.1960784, 1,
1.952803, -0.2894662, 2.510417, 1, 0, 0.1921569, 1,
1.968738, 0.007431215, 1.629395, 1, 0, 0.1843137, 1,
1.979038, -1.125216, 1.400988, 1, 0, 0.1803922, 1,
1.986557, -0.4389943, 0.9132406, 1, 0, 0.172549, 1,
2.010815, 0.5342306, -0.593462, 1, 0, 0.1686275, 1,
2.051446, -0.4096524, 1.014055, 1, 0, 0.1607843, 1,
2.091643, -0.4768291, 3.123419, 1, 0, 0.1568628, 1,
2.102025, 0.9274299, 0.3325981, 1, 0, 0.1490196, 1,
2.158848, 0.09299523, 0.6348867, 1, 0, 0.145098, 1,
2.158892, 0.5466934, 2.133211, 1, 0, 0.1372549, 1,
2.164265, 0.2951936, 1.777845, 1, 0, 0.1333333, 1,
2.181579, -1.50481, 2.411878, 1, 0, 0.1254902, 1,
2.190424, -1.100449, 1.977984, 1, 0, 0.1215686, 1,
2.191605, 0.3013705, 0.1180737, 1, 0, 0.1137255, 1,
2.198019, -1.091269, 2.723618, 1, 0, 0.1098039, 1,
2.210138, 1.649714, 1.958897, 1, 0, 0.1019608, 1,
2.212533, 0.397056, 1.284016, 1, 0, 0.09411765, 1,
2.215702, 1.355888, 1.193325, 1, 0, 0.09019608, 1,
2.219045, -0.398275, 1.496082, 1, 0, 0.08235294, 1,
2.221485, -0.4447238, 2.412991, 1, 0, 0.07843138, 1,
2.278341, 0.5723209, 1.933204, 1, 0, 0.07058824, 1,
2.293246, -1.268214, 2.630017, 1, 0, 0.06666667, 1,
2.298799, 1.289167, 0.8210046, 1, 0, 0.05882353, 1,
2.331517, -1.748395, 2.108333, 1, 0, 0.05490196, 1,
2.347565, 0.258332, 2.276764, 1, 0, 0.04705882, 1,
2.374034, -0.6745405, 1.312019, 1, 0, 0.04313726, 1,
2.405542, -1.291131, 0.004798113, 1, 0, 0.03529412, 1,
2.530726, -0.3074951, 1.208055, 1, 0, 0.03137255, 1,
2.544615, 0.6704322, 2.231078, 1, 0, 0.02352941, 1,
2.582651, 0.1477205, 1.674633, 1, 0, 0.01960784, 1,
2.787359, -0.2181873, 1.0485, 1, 0, 0.01176471, 1,
3.702696, 3.076497, 0.3636115, 1, 0, 0.007843138, 1
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
0.22018, -4.786614, -7.681088, 0, -0.5, 0.5, 0.5,
0.22018, -4.786614, -7.681088, 1, -0.5, 0.5, 0.5,
0.22018, -4.786614, -7.681088, 1, 1.5, 0.5, 0.5,
0.22018, -4.786614, -7.681088, 0, 1.5, 0.5, 0.5
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
-4.442909, 0.07473111, -7.681088, 0, -0.5, 0.5, 0.5,
-4.442909, 0.07473111, -7.681088, 1, -0.5, 0.5, 0.5,
-4.442909, 0.07473111, -7.681088, 1, 1.5, 0.5, 0.5,
-4.442909, 0.07473111, -7.681088, 0, 1.5, 0.5, 0.5
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
-4.442909, -4.786614, -0.3375244, 0, -0.5, 0.5, 0.5,
-4.442909, -4.786614, -0.3375244, 1, -0.5, 0.5, 0.5,
-4.442909, -4.786614, -0.3375244, 1, 1.5, 0.5, 0.5,
-4.442909, -4.786614, -0.3375244, 0, 1.5, 0.5, 0.5
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
-3, -3.664765, -5.98642,
3, -3.664765, -5.98642,
-3, -3.664765, -5.98642,
-3, -3.85174, -6.268865,
-2, -3.664765, -5.98642,
-2, -3.85174, -6.268865,
-1, -3.664765, -5.98642,
-1, -3.85174, -6.268865,
0, -3.664765, -5.98642,
0, -3.85174, -6.268865,
1, -3.664765, -5.98642,
1, -3.85174, -6.268865,
2, -3.664765, -5.98642,
2, -3.85174, -6.268865,
3, -3.664765, -5.98642,
3, -3.85174, -6.268865
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
-3, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
-3, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
-3, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
-3, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5,
-2, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
-2, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
-2, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
-2, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5,
-1, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
-1, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
-1, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
-1, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5,
0, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
0, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
0, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
0, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5,
1, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
1, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
1, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
1, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5,
2, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
2, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
2, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
2, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5,
3, -4.225689, -6.833754, 0, -0.5, 0.5, 0.5,
3, -4.225689, -6.833754, 1, -0.5, 0.5, 0.5,
3, -4.225689, -6.833754, 1, 1.5, 0.5, 0.5,
3, -4.225689, -6.833754, 0, 1.5, 0.5, 0.5
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
-3.366812, -2, -5.98642,
-3.366812, 2, -5.98642,
-3.366812, -2, -5.98642,
-3.546161, -2, -6.268865,
-3.366812, 0, -5.98642,
-3.546161, 0, -6.268865,
-3.366812, 2, -5.98642,
-3.546161, 2, -6.268865
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
-3.90486, -2, -6.833754, 0, -0.5, 0.5, 0.5,
-3.90486, -2, -6.833754, 1, -0.5, 0.5, 0.5,
-3.90486, -2, -6.833754, 1, 1.5, 0.5, 0.5,
-3.90486, -2, -6.833754, 0, 1.5, 0.5, 0.5,
-3.90486, 0, -6.833754, 0, -0.5, 0.5, 0.5,
-3.90486, 0, -6.833754, 1, -0.5, 0.5, 0.5,
-3.90486, 0, -6.833754, 1, 1.5, 0.5, 0.5,
-3.90486, 0, -6.833754, 0, 1.5, 0.5, 0.5,
-3.90486, 2, -6.833754, 0, -0.5, 0.5, 0.5,
-3.90486, 2, -6.833754, 1, -0.5, 0.5, 0.5,
-3.90486, 2, -6.833754, 1, 1.5, 0.5, 0.5,
-3.90486, 2, -6.833754, 0, 1.5, 0.5, 0.5
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
-3.366812, -3.664765, -4,
-3.366812, -3.664765, 4,
-3.366812, -3.664765, -4,
-3.546161, -3.85174, -4,
-3.366812, -3.664765, -2,
-3.546161, -3.85174, -2,
-3.366812, -3.664765, 0,
-3.546161, -3.85174, 0,
-3.366812, -3.664765, 2,
-3.546161, -3.85174, 2,
-3.366812, -3.664765, 4,
-3.546161, -3.85174, 4
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
-3.90486, -4.225689, -4, 0, -0.5, 0.5, 0.5,
-3.90486, -4.225689, -4, 1, -0.5, 0.5, 0.5,
-3.90486, -4.225689, -4, 1, 1.5, 0.5, 0.5,
-3.90486, -4.225689, -4, 0, 1.5, 0.5, 0.5,
-3.90486, -4.225689, -2, 0, -0.5, 0.5, 0.5,
-3.90486, -4.225689, -2, 1, -0.5, 0.5, 0.5,
-3.90486, -4.225689, -2, 1, 1.5, 0.5, 0.5,
-3.90486, -4.225689, -2, 0, 1.5, 0.5, 0.5,
-3.90486, -4.225689, 0, 0, -0.5, 0.5, 0.5,
-3.90486, -4.225689, 0, 1, -0.5, 0.5, 0.5,
-3.90486, -4.225689, 0, 1, 1.5, 0.5, 0.5,
-3.90486, -4.225689, 0, 0, 1.5, 0.5, 0.5,
-3.90486, -4.225689, 2, 0, -0.5, 0.5, 0.5,
-3.90486, -4.225689, 2, 1, -0.5, 0.5, 0.5,
-3.90486, -4.225689, 2, 1, 1.5, 0.5, 0.5,
-3.90486, -4.225689, 2, 0, 1.5, 0.5, 0.5,
-3.90486, -4.225689, 4, 0, -0.5, 0.5, 0.5,
-3.90486, -4.225689, 4, 1, -0.5, 0.5, 0.5,
-3.90486, -4.225689, 4, 1, 1.5, 0.5, 0.5,
-3.90486, -4.225689, 4, 0, 1.5, 0.5, 0.5
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
-3.366812, -3.664765, -5.98642,
-3.366812, 3.814227, -5.98642,
-3.366812, -3.664765, 5.311371,
-3.366812, 3.814227, 5.311371,
-3.366812, -3.664765, -5.98642,
-3.366812, -3.664765, 5.311371,
-3.366812, 3.814227, -5.98642,
-3.366812, 3.814227, 5.311371,
-3.366812, -3.664765, -5.98642,
3.807172, -3.664765, -5.98642,
-3.366812, -3.664765, 5.311371,
3.807172, -3.664765, 5.311371,
-3.366812, 3.814227, -5.98642,
3.807172, 3.814227, -5.98642,
-3.366812, 3.814227, 5.311371,
3.807172, 3.814227, 5.311371,
3.807172, -3.664765, -5.98642,
3.807172, 3.814227, -5.98642,
3.807172, -3.664765, 5.311371,
3.807172, 3.814227, 5.311371,
3.807172, -3.664765, -5.98642,
3.807172, -3.664765, 5.311371,
3.807172, 3.814227, -5.98642,
3.807172, 3.814227, 5.311371
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
var radius = 8.186489;
var distance = 36.42261;
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
mvMatrix.translate( -0.22018, -0.07473111, 0.3375244 );
mvMatrix.scale( 1.233818, 1.183501, 0.7834622 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.42261);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ethoxysulfuron<-read.table("ethoxysulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethoxysulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxysulfuron' not found
```

```r
y<-ethoxysulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxysulfuron' not found
```

```r
z<-ethoxysulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxysulfuron' not found
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
-3.262336, -0.01644382, -3.607858, 0, 0, 1, 1, 1,
-3.097254, -1.412766, -0.3767001, 1, 0, 0, 1, 1,
-3.000954, 0.4909708, 0.1694198, 1, 0, 0, 1, 1,
-2.80862, -1.786595, -2.254307, 1, 0, 0, 1, 1,
-2.694699, -0.708146, -3.07656, 1, 0, 0, 1, 1,
-2.551749, 1.032217, -0.5472586, 1, 0, 0, 1, 1,
-2.444318, 0.156691, -2.151617, 0, 0, 0, 1, 1,
-2.382403, -0.4985917, -3.022779, 0, 0, 0, 1, 1,
-2.377733, 0.1057568, -0.9027352, 0, 0, 0, 1, 1,
-2.371551, -1.199054, -1.768387, 0, 0, 0, 1, 1,
-2.367537, 0.3573695, -0.9816424, 0, 0, 0, 1, 1,
-2.23893, 0.9062312, 0.2845471, 0, 0, 0, 1, 1,
-2.230204, 0.5051946, -0.7814041, 0, 0, 0, 1, 1,
-2.195964, -1.073919, -2.741857, 1, 1, 1, 1, 1,
-2.160377, 0.2391467, -1.557981, 1, 1, 1, 1, 1,
-2.153738, -0.6935232, -1.525667, 1, 1, 1, 1, 1,
-2.145299, -0.3790865, -1.779561, 1, 1, 1, 1, 1,
-2.138341, -0.4289846, -2.226204, 1, 1, 1, 1, 1,
-2.13074, -1.842574, -1.844566, 1, 1, 1, 1, 1,
-2.111764, 0.977918, -0.579885, 1, 1, 1, 1, 1,
-2.0064, -0.525807, -1.898903, 1, 1, 1, 1, 1,
-1.999865, 1.39186, -0.9161679, 1, 1, 1, 1, 1,
-1.992723, 1.044302, -0.8989982, 1, 1, 1, 1, 1,
-1.974504, 0.2617464, -1.115235, 1, 1, 1, 1, 1,
-1.956507, 1.168485, -0.07509285, 1, 1, 1, 1, 1,
-1.932683, 0.4219301, -2.530862, 1, 1, 1, 1, 1,
-1.915511, 1.074541, -0.670029, 1, 1, 1, 1, 1,
-1.88035, 1.361114, -0.6314166, 1, 1, 1, 1, 1,
-1.861251, -1.820334, -2.123426, 0, 0, 1, 1, 1,
-1.859151, 0.6822158, -1.101282, 1, 0, 0, 1, 1,
-1.827221, -0.5439922, -1.363276, 1, 0, 0, 1, 1,
-1.807503, 0.2828302, 0.006465189, 1, 0, 0, 1, 1,
-1.773014, 0.1944281, -1.426464, 1, 0, 0, 1, 1,
-1.752274, -1.67042, -1.663618, 1, 0, 0, 1, 1,
-1.72013, 0.6809428, -0.9047791, 0, 0, 0, 1, 1,
-1.711613, 1.131132, -2.914599, 0, 0, 0, 1, 1,
-1.706577, -0.5071147, -3.723849, 0, 0, 0, 1, 1,
-1.685888, -1.70601, -2.682398, 0, 0, 0, 1, 1,
-1.682802, -1.354165, -2.954861, 0, 0, 0, 1, 1,
-1.671568, -0.8389283, -1.969624, 0, 0, 0, 1, 1,
-1.657522, -0.1452399, -0.9011164, 0, 0, 0, 1, 1,
-1.655028, 0.2935598, -1.38635, 1, 1, 1, 1, 1,
-1.650918, -0.03484835, -3.044755, 1, 1, 1, 1, 1,
-1.646624, 0.7369415, -2.242244, 1, 1, 1, 1, 1,
-1.644547, 0.7220021, -0.8213996, 1, 1, 1, 1, 1,
-1.634164, 0.04301207, 0.307079, 1, 1, 1, 1, 1,
-1.627626, 0.5376384, -3.217014, 1, 1, 1, 1, 1,
-1.625054, 0.1676709, -3.838214, 1, 1, 1, 1, 1,
-1.623347, 0.1666545, -1.296264, 1, 1, 1, 1, 1,
-1.618524, 1.785685, 1.043963, 1, 1, 1, 1, 1,
-1.605792, 1.687186, -1.49664, 1, 1, 1, 1, 1,
-1.595444, -0.1141623, -4.544924, 1, 1, 1, 1, 1,
-1.593204, -0.135941, -1.394296, 1, 1, 1, 1, 1,
-1.590367, -3.555848, -2.31416, 1, 1, 1, 1, 1,
-1.585125, -1.238605, -1.888969, 1, 1, 1, 1, 1,
-1.583225, 0.8187898, -2.909568, 1, 1, 1, 1, 1,
-1.562187, -0.5452578, -1.367868, 0, 0, 1, 1, 1,
-1.537926, -1.629242, -2.369414, 1, 0, 0, 1, 1,
-1.532291, 0.4897112, 0.5024661, 1, 0, 0, 1, 1,
-1.532006, -0.9340522, -1.965916, 1, 0, 0, 1, 1,
-1.505999, -0.981056, -2.899988, 1, 0, 0, 1, 1,
-1.49666, -0.1901608, -1.333086, 1, 0, 0, 1, 1,
-1.496114, -0.7874677, -1.427179, 0, 0, 0, 1, 1,
-1.494872, 0.6840535, -1.167404, 0, 0, 0, 1, 1,
-1.491362, -0.3502468, -1.592701, 0, 0, 0, 1, 1,
-1.479906, 2.149964, -0.4082124, 0, 0, 0, 1, 1,
-1.47914, 0.6944807, -1.359151, 0, 0, 0, 1, 1,
-1.475676, -1.463937, -2.082715, 0, 0, 0, 1, 1,
-1.471995, 1.525117, -1.959794, 0, 0, 0, 1, 1,
-1.464809, 1.286825, -1.124887, 1, 1, 1, 1, 1,
-1.456812, 0.85754, -0.1241403, 1, 1, 1, 1, 1,
-1.43435, 0.1772872, -0.9711752, 1, 1, 1, 1, 1,
-1.433938, 0.6124278, -1.416967, 1, 1, 1, 1, 1,
-1.423516, -0.3305089, -0.7703409, 1, 1, 1, 1, 1,
-1.420136, 0.7471382, 1.196333, 1, 1, 1, 1, 1,
-1.418851, 0.9297598, -0.4532291, 1, 1, 1, 1, 1,
-1.409913, 1.831156, -0.4580083, 1, 1, 1, 1, 1,
-1.393521, -1.047853, -1.710865, 1, 1, 1, 1, 1,
-1.391811, 2.001902, 0.8733962, 1, 1, 1, 1, 1,
-1.372707, 0.7534348, -1.327401, 1, 1, 1, 1, 1,
-1.362935, 0.8669191, -2.638436, 1, 1, 1, 1, 1,
-1.3526, 0.4991027, -1.083658, 1, 1, 1, 1, 1,
-1.344949, -1.11283, -1.594651, 1, 1, 1, 1, 1,
-1.334265, -0.06640553, -1.90162, 1, 1, 1, 1, 1,
-1.329213, -0.21912, -1.024051, 0, 0, 1, 1, 1,
-1.325711, -0.08204988, -1.03718, 1, 0, 0, 1, 1,
-1.313663, 0.3129641, -3.19903, 1, 0, 0, 1, 1,
-1.313301, -0.5350038, 2.277287e-05, 1, 0, 0, 1, 1,
-1.307665, -1.23152, -0.7670023, 1, 0, 0, 1, 1,
-1.305312, -0.5944724, -1.338486, 1, 0, 0, 1, 1,
-1.299743, 0.9262465, -0.7778674, 0, 0, 0, 1, 1,
-1.294981, 0.5331539, -0.4202653, 0, 0, 0, 1, 1,
-1.29457, -0.7525799, -3.244934, 0, 0, 0, 1, 1,
-1.287713, -1.101661, -2.324954, 0, 0, 0, 1, 1,
-1.280801, 0.1325556, -0.9235632, 0, 0, 0, 1, 1,
-1.279145, -0.2729078, -2.261743, 0, 0, 0, 1, 1,
-1.271553, -0.368515, -2.018504, 0, 0, 0, 1, 1,
-1.258115, -0.996056, -1.651715, 1, 1, 1, 1, 1,
-1.255092, 0.6967994, -0.4932026, 1, 1, 1, 1, 1,
-1.251114, -1.331478, -1.782239, 1, 1, 1, 1, 1,
-1.243999, 0.1531405, -2.895101, 1, 1, 1, 1, 1,
-1.22972, 1.192221, -2.068781, 1, 1, 1, 1, 1,
-1.217144, 0.02809079, -2.332638, 1, 1, 1, 1, 1,
-1.216117, 1.03873, -1.227355, 1, 1, 1, 1, 1,
-1.207566, -0.5001979, -3.36551, 1, 1, 1, 1, 1,
-1.205562, -1.203552, -1.700234, 1, 1, 1, 1, 1,
-1.197626, -0.4733718, -0.7618434, 1, 1, 1, 1, 1,
-1.197479, -1.664321, -3.970351, 1, 1, 1, 1, 1,
-1.187828, 0.6082379, -3.869104, 1, 1, 1, 1, 1,
-1.187132, 0.5328197, 0.4345539, 1, 1, 1, 1, 1,
-1.185742, -0.02408814, -2.050179, 1, 1, 1, 1, 1,
-1.18179, -0.5941209, -1.399408, 1, 1, 1, 1, 1,
-1.178254, 0.7812438, -1.395724, 0, 0, 1, 1, 1,
-1.17821, -0.04396049, -0.6719742, 1, 0, 0, 1, 1,
-1.177162, 0.7053054, 0.6840758, 1, 0, 0, 1, 1,
-1.174615, -0.5699211, -1.10129, 1, 0, 0, 1, 1,
-1.169527, -1.923594, -2.541627, 1, 0, 0, 1, 1,
-1.169403, -0.6139943, -1.089993, 1, 0, 0, 1, 1,
-1.145594, -0.7966548, -2.273496, 0, 0, 0, 1, 1,
-1.13791, -1.775766, -2.091944, 0, 0, 0, 1, 1,
-1.132976, 1.557939, -1.201351, 0, 0, 0, 1, 1,
-1.131806, -0.6946068, -0.7115768, 0, 0, 0, 1, 1,
-1.127622, -0.0518455, 0.09542818, 0, 0, 0, 1, 1,
-1.126762, 1.577271, -1.263956, 0, 0, 0, 1, 1,
-1.123676, 0.2251848, -1.238892, 0, 0, 0, 1, 1,
-1.120983, -1.039661, 0.1579035, 1, 1, 1, 1, 1,
-1.111563, 0.9968569, -1.842538, 1, 1, 1, 1, 1,
-1.10682, -0.3277311, -3.384555, 1, 1, 1, 1, 1,
-1.097629, 0.2215747, -1.494955, 1, 1, 1, 1, 1,
-1.094343, 1.51022, -1.115594, 1, 1, 1, 1, 1,
-1.087634, 0.1756572, -1.506859, 1, 1, 1, 1, 1,
-1.086219, 1.653841, 1.341539, 1, 1, 1, 1, 1,
-1.071591, 1.14802, 0.1901867, 1, 1, 1, 1, 1,
-1.06931, 0.7160087, -0.1654316, 1, 1, 1, 1, 1,
-1.069161, -0.1509265, -0.7388066, 1, 1, 1, 1, 1,
-1.068626, 0.4274822, 0.2269318, 1, 1, 1, 1, 1,
-1.068153, -0.6841621, -0.2353326, 1, 1, 1, 1, 1,
-1.05959, -0.6515123, -2.989017, 1, 1, 1, 1, 1,
-1.029741, 0.4911231, -1.143354, 1, 1, 1, 1, 1,
-1.029666, -1.434525, -3.311713, 1, 1, 1, 1, 1,
-1.021269, 1.544289, 0.200498, 0, 0, 1, 1, 1,
-1.020184, -1.131097, -2.391311, 1, 0, 0, 1, 1,
-1.019354, -0.574245, -0.9759388, 1, 0, 0, 1, 1,
-1.00359, -0.9364738, -1.647231, 1, 0, 0, 1, 1,
-0.9993449, 0.01929885, -1.117697, 1, 0, 0, 1, 1,
-0.9970334, 0.05582556, -0.9864635, 1, 0, 0, 1, 1,
-0.9960555, 0.1345007, -0.1254988, 0, 0, 0, 1, 1,
-0.9952165, -0.1123001, -1.587523, 0, 0, 0, 1, 1,
-0.9934688, 1.344902, -1.183019, 0, 0, 0, 1, 1,
-0.9904048, 1.36772, -2.476707, 0, 0, 0, 1, 1,
-0.9851014, -0.2811262, -1.297943, 0, 0, 0, 1, 1,
-0.9845187, 0.1742557, -1.881085, 0, 0, 0, 1, 1,
-0.9822583, -0.1019759, 0.4317127, 0, 0, 0, 1, 1,
-0.9796243, 0.1169308, -0.5744066, 1, 1, 1, 1, 1,
-0.9763781, -1.331186, -4.419557, 1, 1, 1, 1, 1,
-0.9742399, 0.5140433, 0.9250686, 1, 1, 1, 1, 1,
-0.9731082, 0.4710226, -1.450539, 1, 1, 1, 1, 1,
-0.9725903, -1.168029, -0.4377244, 1, 1, 1, 1, 1,
-0.9697467, -1.70899, -4.197158, 1, 1, 1, 1, 1,
-0.9632868, -0.1479952, 0.1283153, 1, 1, 1, 1, 1,
-0.9546142, 0.05486858, -0.6137984, 1, 1, 1, 1, 1,
-0.9538647, 1.662215, -1.911894, 1, 1, 1, 1, 1,
-0.9488029, 1.36348, -1.720471, 1, 1, 1, 1, 1,
-0.9371831, 0.7008703, -0.4388079, 1, 1, 1, 1, 1,
-0.9319743, 0.4744696, -3.304153, 1, 1, 1, 1, 1,
-0.9311727, -1.365347, -3.699842, 1, 1, 1, 1, 1,
-0.929088, -2.598942, -1.264679, 1, 1, 1, 1, 1,
-0.9261333, 0.4594875, -1.062615, 1, 1, 1, 1, 1,
-0.9126173, 0.224, -0.4423631, 0, 0, 1, 1, 1,
-0.9120597, 0.8818237, -2.240014, 1, 0, 0, 1, 1,
-0.9050118, 0.2973348, -2.064568, 1, 0, 0, 1, 1,
-0.9015897, 0.506008, 0.9416286, 1, 0, 0, 1, 1,
-0.8992136, -1.111182, -3.978423, 1, 0, 0, 1, 1,
-0.8839587, 0.358014, -1.362271, 1, 0, 0, 1, 1,
-0.8791474, 0.01965222, -2.851686, 0, 0, 0, 1, 1,
-0.8740534, 1.843368, 0.7015693, 0, 0, 0, 1, 1,
-0.872099, -0.3622732, -4.692512, 0, 0, 0, 1, 1,
-0.8671449, -0.07782793, -3.277686, 0, 0, 0, 1, 1,
-0.8548807, 0.3238791, 0.06163963, 0, 0, 0, 1, 1,
-0.8509159, -0.7401913, -3.221689, 0, 0, 0, 1, 1,
-0.8465933, -1.334456, -0.6270319, 0, 0, 0, 1, 1,
-0.8428102, 0.9736087, -2.323732, 1, 1, 1, 1, 1,
-0.8382429, -1.914922, -3.210483, 1, 1, 1, 1, 1,
-0.8342247, 0.03712689, -2.449314, 1, 1, 1, 1, 1,
-0.8332462, 1.787557, -1.243666, 1, 1, 1, 1, 1,
-0.8331184, -0.8556634, -2.06025, 1, 1, 1, 1, 1,
-0.832233, -0.2135336, -1.602704, 1, 1, 1, 1, 1,
-0.8235056, -0.5615893, -3.693439, 1, 1, 1, 1, 1,
-0.8224428, -0.3462454, -2.336546, 1, 1, 1, 1, 1,
-0.8220214, 0.3159981, -1.198499, 1, 1, 1, 1, 1,
-0.820762, -1.162411, -2.329052, 1, 1, 1, 1, 1,
-0.8166268, 2.077833, -0.464191, 1, 1, 1, 1, 1,
-0.8164725, -0.3839645, -0.8365445, 1, 1, 1, 1, 1,
-0.8145329, -0.7656912, -2.824953, 1, 1, 1, 1, 1,
-0.8136544, 0.9570169, -1.801325, 1, 1, 1, 1, 1,
-0.8100013, 0.8510342, -2.25887, 1, 1, 1, 1, 1,
-0.8061528, -0.4970264, -3.657719, 0, 0, 1, 1, 1,
-0.8022807, -0.1779869, -2.557194, 1, 0, 0, 1, 1,
-0.7972453, 1.080913, -0.8862419, 1, 0, 0, 1, 1,
-0.7949834, 0.1544111, -0.1229932, 1, 0, 0, 1, 1,
-0.7872174, 0.09434766, -1.575314, 1, 0, 0, 1, 1,
-0.7866792, -0.4600506, -0.2837758, 1, 0, 0, 1, 1,
-0.7857807, -0.1993769, -0.04367748, 0, 0, 0, 1, 1,
-0.7818003, 0.380823, -1.817265, 0, 0, 0, 1, 1,
-0.7788476, 0.3489074, -0.8969885, 0, 0, 0, 1, 1,
-0.7766023, 1.378826, -1.181601, 0, 0, 0, 1, 1,
-0.7639071, 0.7351632, -1.176915, 0, 0, 0, 1, 1,
-0.7575673, -0.6706941, -2.705888, 0, 0, 0, 1, 1,
-0.7561713, -1.718308, -4.159629, 0, 0, 0, 1, 1,
-0.7523493, -0.3777538, -0.4608666, 1, 1, 1, 1, 1,
-0.7511749, 0.8353853, -0.5174146, 1, 1, 1, 1, 1,
-0.7509556, -0.2838441, -0.9097605, 1, 1, 1, 1, 1,
-0.7492096, -1.25119, -2.410352, 1, 1, 1, 1, 1,
-0.7472209, 1.943141, -0.6780051, 1, 1, 1, 1, 1,
-0.7379353, -0.5862811, -2.163775, 1, 1, 1, 1, 1,
-0.73749, -0.2394347, -1.224563, 1, 1, 1, 1, 1,
-0.7358636, 0.3961275, 0.2255502, 1, 1, 1, 1, 1,
-0.735001, -0.2477768, -2.236984, 1, 1, 1, 1, 1,
-0.7337341, 0.6200763, -1.580107, 1, 1, 1, 1, 1,
-0.7272009, -0.4657572, -1.882717, 1, 1, 1, 1, 1,
-0.7259864, 0.6929708, -0.9779205, 1, 1, 1, 1, 1,
-0.7234811, -1.065265, -4.270617, 1, 1, 1, 1, 1,
-0.7119708, -1.254918, -2.634834, 1, 1, 1, 1, 1,
-0.7113417, 1.099082, -0.5165707, 1, 1, 1, 1, 1,
-0.7061307, -0.5099679, -1.641462, 0, 0, 1, 1, 1,
-0.7030599, -0.01020376, -1.660397, 1, 0, 0, 1, 1,
-0.7000588, -0.2517662, -3.554052, 1, 0, 0, 1, 1,
-0.6986304, -0.4009174, -2.6649, 1, 0, 0, 1, 1,
-0.6970047, -0.135401, -2.302632, 1, 0, 0, 1, 1,
-0.6915569, -1.330829, -3.556285, 1, 0, 0, 1, 1,
-0.6868853, 0.9358187, -2.240633, 0, 0, 0, 1, 1,
-0.6834369, 1.176495, -0.3055109, 0, 0, 0, 1, 1,
-0.6831934, 0.1297726, -0.8648968, 0, 0, 0, 1, 1,
-0.6829941, 0.2342097, -1.179133, 0, 0, 0, 1, 1,
-0.6822947, -1.343611, -2.085506, 0, 0, 0, 1, 1,
-0.6783611, -2.401349, -1.903578, 0, 0, 0, 1, 1,
-0.6779248, -0.5055694, -1.49274, 0, 0, 0, 1, 1,
-0.6769787, -0.9160054, -3.301791, 1, 1, 1, 1, 1,
-0.6760382, -0.5924448, -1.364563, 1, 1, 1, 1, 1,
-0.6744829, -0.190244, -3.162577, 1, 1, 1, 1, 1,
-0.6733299, 0.892902, 0.4232386, 1, 1, 1, 1, 1,
-0.6704116, 0.3868278, -0.1778018, 1, 1, 1, 1, 1,
-0.6698492, -0.7218682, -3.129878, 1, 1, 1, 1, 1,
-0.6689513, -0.0141628, -2.820181, 1, 1, 1, 1, 1,
-0.6662543, 0.2776044, -1.726757, 1, 1, 1, 1, 1,
-0.6645197, 2.012553, -0.3029024, 1, 1, 1, 1, 1,
-0.6599473, -0.5757282, -0.05118585, 1, 1, 1, 1, 1,
-0.6596694, 0.8657103, 0.6555204, 1, 1, 1, 1, 1,
-0.6586506, -0.3125241, -2.395958, 1, 1, 1, 1, 1,
-0.6564888, 0.4046296, -3.515035, 1, 1, 1, 1, 1,
-0.6484944, -0.07727487, -2.5172, 1, 1, 1, 1, 1,
-0.6447923, -0.5076245, -1.484004, 1, 1, 1, 1, 1,
-0.6439753, 1.338351, -1.193879, 0, 0, 1, 1, 1,
-0.6438412, -0.3345515, -2.297412, 1, 0, 0, 1, 1,
-0.6431515, -2.192736, -2.921995, 1, 0, 0, 1, 1,
-0.6377217, -0.5239267, -1.820692, 1, 0, 0, 1, 1,
-0.6374155, -0.1048841, -1.797633, 1, 0, 0, 1, 1,
-0.6363625, -1.166199, -1.343176, 1, 0, 0, 1, 1,
-0.632074, 1.6232, 0.9762552, 0, 0, 0, 1, 1,
-0.6308914, 0.0321707, -1.247029, 0, 0, 0, 1, 1,
-0.6275425, -1.08227, -2.852854, 0, 0, 0, 1, 1,
-0.6235224, 1.110079, -1.185228, 0, 0, 0, 1, 1,
-0.6210964, -1.162378, -1.468954, 0, 0, 0, 1, 1,
-0.6202121, -0.4312433, -3.50044, 0, 0, 0, 1, 1,
-0.6188254, 2.056833, -0.7148328, 0, 0, 0, 1, 1,
-0.6185196, -0.3018633, -2.558299, 1, 1, 1, 1, 1,
-0.6130172, -3.330131, -2.152342, 1, 1, 1, 1, 1,
-0.6079845, -0.9168465, -2.99408, 1, 1, 1, 1, 1,
-0.6072427, 1.418644, -0.53446, 1, 1, 1, 1, 1,
-0.6058395, -0.5494855, -2.675071, 1, 1, 1, 1, 1,
-0.6053583, 0.7902759, 0.02454966, 1, 1, 1, 1, 1,
-0.6040844, 0.1836641, -2.5545, 1, 1, 1, 1, 1,
-0.602452, 0.1524573, -0.6716957, 1, 1, 1, 1, 1,
-0.5988516, -0.677093, -3.202146, 1, 1, 1, 1, 1,
-0.596437, -0.1449383, -1.849591, 1, 1, 1, 1, 1,
-0.5946587, 2.233102, -0.6561745, 1, 1, 1, 1, 1,
-0.5928937, 0.3164665, -1.719823, 1, 1, 1, 1, 1,
-0.5896464, 0.6934998, -0.03004943, 1, 1, 1, 1, 1,
-0.5892402, 0.5694106, -0.7328015, 1, 1, 1, 1, 1,
-0.5854282, 0.9416398, -1.301121, 1, 1, 1, 1, 1,
-0.5830075, 0.7992284, -0.4457094, 0, 0, 1, 1, 1,
-0.5789399, -0.3754715, -0.9221455, 1, 0, 0, 1, 1,
-0.5769278, -1.382638, -1.901846, 1, 0, 0, 1, 1,
-0.5685041, 0.8556922, 0.8727781, 1, 0, 0, 1, 1,
-0.5638165, 0.1042316, -2.675775, 1, 0, 0, 1, 1,
-0.559604, 3.70531, 0.2529431, 1, 0, 0, 1, 1,
-0.5563634, 2.107309, 0.6413455, 0, 0, 0, 1, 1,
-0.5554011, 0.4477422, -0.3892648, 0, 0, 0, 1, 1,
-0.5551696, -0.5877993, -2.299749, 0, 0, 0, 1, 1,
-0.5538712, 0.105546, -2.256822, 0, 0, 0, 1, 1,
-0.551038, 0.6320555, -2.027526, 0, 0, 0, 1, 1,
-0.5453266, -1.94426, -1.270099, 0, 0, 0, 1, 1,
-0.5429433, 0.5540581, -2.741692, 0, 0, 0, 1, 1,
-0.5427006, -0.1053106, -0.8617852, 1, 1, 1, 1, 1,
-0.5401606, 1.935901, -0.7552524, 1, 1, 1, 1, 1,
-0.535576, 1.247364, -2.014097, 1, 1, 1, 1, 1,
-0.5270188, 0.4804218, -0.07834722, 1, 1, 1, 1, 1,
-0.525467, -1.701353, -4.431478, 1, 1, 1, 1, 1,
-0.5203878, -0.3526525, -3.397508, 1, 1, 1, 1, 1,
-0.5182579, 0.6489182, -1.982774, 1, 1, 1, 1, 1,
-0.5161156, -0.4176914, -3.559469, 1, 1, 1, 1, 1,
-0.5154809, -0.9268395, -1.522526, 1, 1, 1, 1, 1,
-0.5122073, -0.6652068, -1.958033, 1, 1, 1, 1, 1,
-0.5071344, 1.716812, 0.9644138, 1, 1, 1, 1, 1,
-0.504721, -0.1652438, -1.735444, 1, 1, 1, 1, 1,
-0.5036791, -0.02033086, -1.164527, 1, 1, 1, 1, 1,
-0.499922, -0.07272801, -1.315252, 1, 1, 1, 1, 1,
-0.4990205, -0.768137, -2.711305, 1, 1, 1, 1, 1,
-0.4952352, 0.2944314, -1.325031, 0, 0, 1, 1, 1,
-0.4935893, -0.1809772, -1.195062, 1, 0, 0, 1, 1,
-0.4933484, -0.02401456, -0.4790256, 1, 0, 0, 1, 1,
-0.4932182, -1.266285, -3.67811, 1, 0, 0, 1, 1,
-0.4902514, -1.544415, -3.400064, 1, 0, 0, 1, 1,
-0.4857578, -1.443719, -3.753257, 1, 0, 0, 1, 1,
-0.4812078, 0.8079978, -0.7616057, 0, 0, 0, 1, 1,
-0.4719289, -0.8943379, -1.269807, 0, 0, 0, 1, 1,
-0.4695816, 0.7684634, -0.3701128, 0, 0, 0, 1, 1,
-0.4660133, 0.4001054, -0.4026402, 0, 0, 0, 1, 1,
-0.4645818, 0.6435637, -1.374363, 0, 0, 0, 1, 1,
-0.4623828, 0.1978244, -1.805518, 0, 0, 0, 1, 1,
-0.4613081, -0.6101685, -2.284202, 0, 0, 0, 1, 1,
-0.4602903, -0.2285537, -2.02922, 1, 1, 1, 1, 1,
-0.4593836, 0.4918481, -1.029941, 1, 1, 1, 1, 1,
-0.4585083, -0.3697118, -1.521206, 1, 1, 1, 1, 1,
-0.4428026, -0.3161022, -0.6997041, 1, 1, 1, 1, 1,
-0.4382636, -1.458456, -5.757656, 1, 1, 1, 1, 1,
-0.4373799, 0.2826158, -0.3269834, 1, 1, 1, 1, 1,
-0.428606, -0.6206836, -1.502928, 1, 1, 1, 1, 1,
-0.426143, 1.899051, 0.5423265, 1, 1, 1, 1, 1,
-0.4241655, 0.407432, -1.142315, 1, 1, 1, 1, 1,
-0.4186636, -1.452542, 0.5704077, 1, 1, 1, 1, 1,
-0.4175666, 0.6898115, 1.751353, 1, 1, 1, 1, 1,
-0.4170967, -0.4398305, -0.7926142, 1, 1, 1, 1, 1,
-0.4165872, 0.5636826, -0.2506171, 1, 1, 1, 1, 1,
-0.4153858, 1.091908, -1.67297, 1, 1, 1, 1, 1,
-0.4143851, 1.503435, -0.08060274, 1, 1, 1, 1, 1,
-0.4106719, 1.056466, -0.9290697, 0, 0, 1, 1, 1,
-0.4096089, -0.8562806, -3.224474, 1, 0, 0, 1, 1,
-0.4088427, 0.06496595, -1.297286, 1, 0, 0, 1, 1,
-0.4034881, -0.5379798, -3.172312, 1, 0, 0, 1, 1,
-0.4017577, -0.5703668, -1.317478, 1, 0, 0, 1, 1,
-0.4015619, -0.4853756, -1.696041, 1, 0, 0, 1, 1,
-0.400905, 0.7376931, -0.1662103, 0, 0, 0, 1, 1,
-0.3983403, -1.711272, -4.396871, 0, 0, 0, 1, 1,
-0.3967141, 0.6405711, 0.979642, 0, 0, 0, 1, 1,
-0.3964171, -0.8207427, -2.065771, 0, 0, 0, 1, 1,
-0.3934444, 1.027667, -1.034667, 0, 0, 0, 1, 1,
-0.3917866, -1.642341, -2.470181, 0, 0, 0, 1, 1,
-0.3865438, -2.334347, -4.52896, 0, 0, 0, 1, 1,
-0.3848725, -1.62381, -2.616017, 1, 1, 1, 1, 1,
-0.3844349, 1.904569, 0.3383962, 1, 1, 1, 1, 1,
-0.3771578, 0.2936315, -1.953134, 1, 1, 1, 1, 1,
-0.3769942, 0.1544555, -1.759588, 1, 1, 1, 1, 1,
-0.3753399, -2.352979, -2.473381, 1, 1, 1, 1, 1,
-0.3719968, 0.159406, -2.500924, 1, 1, 1, 1, 1,
-0.3689724, 1.275554, 0.9375092, 1, 1, 1, 1, 1,
-0.3682918, -0.5100889, -2.666764, 1, 1, 1, 1, 1,
-0.3635879, 0.3188562, 0.5641695, 1, 1, 1, 1, 1,
-0.3578726, 0.8226079, -1.072188, 1, 1, 1, 1, 1,
-0.3575404, -0.9485139, -1.351928, 1, 1, 1, 1, 1,
-0.3554181, 0.5977821, -1.292812, 1, 1, 1, 1, 1,
-0.3548286, -1.085988, -3.344245, 1, 1, 1, 1, 1,
-0.3532155, -0.006923242, -0.007847884, 1, 1, 1, 1, 1,
-0.3530587, -0.1320737, -0.9901757, 1, 1, 1, 1, 1,
-0.3511025, -0.3308771, -1.048762, 0, 0, 1, 1, 1,
-0.3470948, -0.7064509, -2.574827, 1, 0, 0, 1, 1,
-0.3419965, -1.01428, -3.57351, 1, 0, 0, 1, 1,
-0.3384129, 0.8574541, -0.4410684, 1, 0, 0, 1, 1,
-0.3279661, 0.6130292, -0.2878359, 1, 0, 0, 1, 1,
-0.3244509, -0.8052335, -1.558459, 1, 0, 0, 1, 1,
-0.3216498, 0.07436058, -0.4002459, 0, 0, 0, 1, 1,
-0.3199569, 1.152517, 1.072408, 0, 0, 0, 1, 1,
-0.3176514, -0.8792449, -1.972479, 0, 0, 0, 1, 1,
-0.3137082, 0.006390077, -2.110545, 0, 0, 0, 1, 1,
-0.310013, -1.198474, -1.592818, 0, 0, 0, 1, 1,
-0.308645, -0.5447033, -5.821889, 0, 0, 0, 1, 1,
-0.3017322, -1.050005, -3.082776, 0, 0, 0, 1, 1,
-0.3010046, 0.4389987, 0.4823302, 1, 1, 1, 1, 1,
-0.2971186, 0.5683874, 0.8504692, 1, 1, 1, 1, 1,
-0.2950995, 0.1384756, -1.425053, 1, 1, 1, 1, 1,
-0.2919533, 0.7422627, -0.2067861, 1, 1, 1, 1, 1,
-0.2853804, 0.5712965, -0.6170425, 1, 1, 1, 1, 1,
-0.2846934, 0.7373731, 0.6266105, 1, 1, 1, 1, 1,
-0.2838307, -1.860739, -3.366001, 1, 1, 1, 1, 1,
-0.2782143, -1.871749, -2.402206, 1, 1, 1, 1, 1,
-0.2781084, 0.02652121, -1.254075, 1, 1, 1, 1, 1,
-0.2723599, 1.009626, -0.4169606, 1, 1, 1, 1, 1,
-0.2718017, 0.2055058, 0.2539733, 1, 1, 1, 1, 1,
-0.2696896, 0.1618052, -1.037115, 1, 1, 1, 1, 1,
-0.2660644, 0.3749994, -0.4466977, 1, 1, 1, 1, 1,
-0.2655544, -0.5669787, -1.915303, 1, 1, 1, 1, 1,
-0.261003, -0.9928373, -2.868462, 1, 1, 1, 1, 1,
-0.2551444, -1.451855, -3.182831, 0, 0, 1, 1, 1,
-0.2544354, 0.8156089, -0.7544824, 1, 0, 0, 1, 1,
-0.253595, -1.114006, -4.347061, 1, 0, 0, 1, 1,
-0.2531235, -0.04682479, -1.15653, 1, 0, 0, 1, 1,
-0.2530206, 1.060128, -0.9742531, 1, 0, 0, 1, 1,
-0.2528378, -1.356989, -2.111389, 1, 0, 0, 1, 1,
-0.2457414, -0.591352, -2.468242, 0, 0, 0, 1, 1,
-0.2448584, 0.6521655, -1.309916, 0, 0, 0, 1, 1,
-0.243494, -0.68953, -2.080517, 0, 0, 0, 1, 1,
-0.2434141, 1.248006, -0.5407358, 0, 0, 0, 1, 1,
-0.2431699, 0.3055857, -1.826708, 0, 0, 0, 1, 1,
-0.2416688, 1.214639, -0.2060291, 0, 0, 0, 1, 1,
-0.2354758, -0.4532182, -4.023175, 0, 0, 0, 1, 1,
-0.2318209, 0.6683996, -1.116629, 1, 1, 1, 1, 1,
-0.2312908, -1.930721, -3.805813, 1, 1, 1, 1, 1,
-0.2242397, -1.522431, -2.365797, 1, 1, 1, 1, 1,
-0.2234914, 0.02430022, -0.7508443, 1, 1, 1, 1, 1,
-0.2205785, -0.7252004, -3.679429, 1, 1, 1, 1, 1,
-0.2186128, -0.553344, -2.884025, 1, 1, 1, 1, 1,
-0.2151278, 2.231806, 1.21136, 1, 1, 1, 1, 1,
-0.2142347, 1.628697, 0.2131544, 1, 1, 1, 1, 1,
-0.2071383, -0.6796871, -3.463669, 1, 1, 1, 1, 1,
-0.203263, 0.5378307, 0.4384287, 1, 1, 1, 1, 1,
-0.2021788, 0.2559802, -0.1015444, 1, 1, 1, 1, 1,
-0.2005829, 1.518607, -0.7088082, 1, 1, 1, 1, 1,
-0.1920606, 1.097324, -1.197905, 1, 1, 1, 1, 1,
-0.1907029, 1.377238, 0.9941403, 1, 1, 1, 1, 1,
-0.1904288, 0.2861211, -0.5986125, 1, 1, 1, 1, 1,
-0.1866954, 0.02405455, -1.639897, 0, 0, 1, 1, 1,
-0.1864614, 0.5235149, -2.059355, 1, 0, 0, 1, 1,
-0.1845733, 0.1505313, -1.705319, 1, 0, 0, 1, 1,
-0.1826126, -0.6507211, -2.970053, 1, 0, 0, 1, 1,
-0.1799694, -0.8918874, -3.168213, 1, 0, 0, 1, 1,
-0.1787722, 0.02420644, 0.9362677, 1, 0, 0, 1, 1,
-0.1764393, 2.087991, 0.2159574, 0, 0, 0, 1, 1,
-0.1731499, 0.4035164, -1.55078, 0, 0, 0, 1, 1,
-0.1712898, -0.8920566, -3.286024, 0, 0, 0, 1, 1,
-0.1651184, -0.9333034, -3.788677, 0, 0, 0, 1, 1,
-0.1648119, 0.362316, -0.689402, 0, 0, 0, 1, 1,
-0.1589968, -1.500938, -2.361797, 0, 0, 0, 1, 1,
-0.1488583, 1.958369, 0.1527398, 0, 0, 0, 1, 1,
-0.1472696, -1.317726, -2.826313, 1, 1, 1, 1, 1,
-0.1404207, -0.3681681, -4.019109, 1, 1, 1, 1, 1,
-0.1385838, 0.5893264, -0.5132853, 1, 1, 1, 1, 1,
-0.136505, 0.06977184, -2.972873, 1, 1, 1, 1, 1,
-0.1360732, 0.5115364, 1.287105, 1, 1, 1, 1, 1,
-0.1340083, -0.7986891, -5.731692, 1, 1, 1, 1, 1,
-0.1335525, 0.781379, -1.454291, 1, 1, 1, 1, 1,
-0.1318284, -0.9628305, -3.88899, 1, 1, 1, 1, 1,
-0.1317629, 0.7736312, -0.2790038, 1, 1, 1, 1, 1,
-0.1255715, 0.2343924, -0.7615244, 1, 1, 1, 1, 1,
-0.1255371, -0.7035354, -1.418275, 1, 1, 1, 1, 1,
-0.1160719, 0.5529186, -1.033474, 1, 1, 1, 1, 1,
-0.1117847, -0.2384394, -2.390526, 1, 1, 1, 1, 1,
-0.1109246, 0.1203413, -1.147659, 1, 1, 1, 1, 1,
-0.1103627, -0.2052961, -2.933114, 1, 1, 1, 1, 1,
-0.1103575, -0.4520603, -3.891129, 0, 0, 1, 1, 1,
-0.1102015, -0.06065831, -1.248326, 1, 0, 0, 1, 1,
-0.1100458, 1.086567, 0.08328299, 1, 0, 0, 1, 1,
-0.1089906, 1.536471, -1.267979, 1, 0, 0, 1, 1,
-0.09902891, -0.3206701, -4.161331, 1, 0, 0, 1, 1,
-0.0971195, 0.7218887, 1.530592, 1, 0, 0, 1, 1,
-0.0958927, 1.881715, 0.69421, 0, 0, 0, 1, 1,
-0.0924782, -0.09255266, -3.157824, 0, 0, 0, 1, 1,
-0.092326, 0.8758324, -2.276222, 0, 0, 0, 1, 1,
-0.09112601, -0.9349849, -2.909128, 0, 0, 0, 1, 1,
-0.08838122, 1.212286, -0.4499399, 0, 0, 0, 1, 1,
-0.08581185, 0.3124399, -0.7072465, 0, 0, 0, 1, 1,
-0.08367398, 0.997998, -1.155541, 0, 0, 0, 1, 1,
-0.07808392, 1.279898, 0.6494123, 1, 1, 1, 1, 1,
-0.06749766, 1.380659, -0.2495436, 1, 1, 1, 1, 1,
-0.06625856, -0.6174419, -3.504321, 1, 1, 1, 1, 1,
-0.06237188, 1.260015, -2.202729, 1, 1, 1, 1, 1,
-0.06177173, -1.024592, -2.864037, 1, 1, 1, 1, 1,
-0.06052795, -0.4237513, -3.821548, 1, 1, 1, 1, 1,
-0.05930674, 0.6473964, 0.5735836, 1, 1, 1, 1, 1,
-0.05661698, -0.4745029, -3.639688, 1, 1, 1, 1, 1,
-0.05641854, -0.5088994, -2.238043, 1, 1, 1, 1, 1,
-0.05079785, -0.5810998, -2.50859, 1, 1, 1, 1, 1,
-0.0480933, -0.7916581, -4.163917, 1, 1, 1, 1, 1,
-0.04784233, -1.454281, -2.024507, 1, 1, 1, 1, 1,
-0.04535161, -0.05816584, -2.15167, 1, 1, 1, 1, 1,
-0.04528432, 1.723939, 0.5296928, 1, 1, 1, 1, 1,
-0.0416892, -0.6642297, -3.576227, 1, 1, 1, 1, 1,
-0.03658809, 0.5868384, -0.6370392, 0, 0, 1, 1, 1,
-0.03594529, 0.2100942, 0.2865663, 1, 0, 0, 1, 1,
-0.03339576, -0.4707569, -2.715349, 1, 0, 0, 1, 1,
-0.02837143, -0.604158, -3.336737, 1, 0, 0, 1, 1,
-0.02482637, -0.2073826, -2.802308, 1, 0, 0, 1, 1,
-0.02122529, -0.06439503, -3.342034, 1, 0, 0, 1, 1,
-0.01903653, 0.07006343, -0.9524572, 0, 0, 0, 1, 1,
-0.01584066, -2.151462, -2.347611, 0, 0, 0, 1, 1,
-0.0135218, 0.0666402, 0.5097626, 0, 0, 0, 1, 1,
-0.01208522, 0.1399353, -1.164477, 0, 0, 0, 1, 1,
-0.01159513, 0.8695801, 0.4232202, 0, 0, 0, 1, 1,
-0.01076967, 1.23589, -1.45939, 0, 0, 0, 1, 1,
-0.01028342, -1.726071, -3.626152, 0, 0, 0, 1, 1,
-0.009201245, -1.865431, -2.254653, 1, 1, 1, 1, 1,
-0.006996079, 1.123799, 0.7232966, 1, 1, 1, 1, 1,
-0.006416052, 1.813076, 0.01731939, 1, 1, 1, 1, 1,
0.0005036694, 0.7817549, -0.8209537, 1, 1, 1, 1, 1,
0.008896959, -0.8989797, 3.068078, 1, 1, 1, 1, 1,
0.01508238, 1.387372, 0.1628089, 1, 1, 1, 1, 1,
0.01607921, 0.5473322, 0.4587378, 1, 1, 1, 1, 1,
0.01695007, -0.1508897, 2.134966, 1, 1, 1, 1, 1,
0.0171566, 0.3050421, 0.3885532, 1, 1, 1, 1, 1,
0.01751236, -0.651282, 4.518646, 1, 1, 1, 1, 1,
0.02164215, 0.7443527, 0.05180305, 1, 1, 1, 1, 1,
0.02204953, 2.053692, 0.1747465, 1, 1, 1, 1, 1,
0.02717708, 1.609853, 0.5771157, 1, 1, 1, 1, 1,
0.03477015, -0.1474156, 3.311009, 1, 1, 1, 1, 1,
0.03490668, -0.277355, 0.8230799, 1, 1, 1, 1, 1,
0.03531408, -1.184112, 3.658443, 0, 0, 1, 1, 1,
0.0392631, -0.8545908, 3.801238, 1, 0, 0, 1, 1,
0.03958999, -0.3257807, 2.071388, 1, 0, 0, 1, 1,
0.04129943, -1.202007, 1.280159, 1, 0, 0, 1, 1,
0.04145042, 0.1764585, -0.8741205, 1, 0, 0, 1, 1,
0.04293577, 0.4607779, -2.354521, 1, 0, 0, 1, 1,
0.04363246, 0.8905631, -1.439788, 0, 0, 0, 1, 1,
0.04444314, -1.384217, 3.067735, 0, 0, 0, 1, 1,
0.04503543, 0.9707277, 1.183445, 0, 0, 0, 1, 1,
0.05131336, -0.3735971, 2.901689, 0, 0, 0, 1, 1,
0.05672448, -0.662838, 3.942681, 0, 0, 0, 1, 1,
0.0580474, 0.1090092, -0.09648323, 0, 0, 0, 1, 1,
0.0587143, 1.615463, -1.455424, 0, 0, 0, 1, 1,
0.05956472, -0.9172436, 2.243494, 1, 1, 1, 1, 1,
0.06225247, -1.309685, 1.996164, 1, 1, 1, 1, 1,
0.06361834, -0.6843437, 3.22177, 1, 1, 1, 1, 1,
0.07104786, 1.885045, 0.3041646, 1, 1, 1, 1, 1,
0.07149992, -3.20348, 1.228257, 1, 1, 1, 1, 1,
0.0719299, -1.950051, 1.801112, 1, 1, 1, 1, 1,
0.07205907, 0.8097579, 0.5439103, 1, 1, 1, 1, 1,
0.07216848, -0.3914155, 2.235234, 1, 1, 1, 1, 1,
0.07538068, 1.220549, 2.291219, 1, 1, 1, 1, 1,
0.08092722, -1.251651, 5.023993, 1, 1, 1, 1, 1,
0.08472261, -0.8006088, 4.532495, 1, 1, 1, 1, 1,
0.08541883, -0.5833251, 2.484242, 1, 1, 1, 1, 1,
0.08824359, -1.008779, 2.047881, 1, 1, 1, 1, 1,
0.09298449, 0.0764489, 1.048498, 1, 1, 1, 1, 1,
0.09493151, -0.4256299, 2.596373, 1, 1, 1, 1, 1,
0.0968563, 0.07002252, -0.592968, 0, 0, 1, 1, 1,
0.09915941, 0.7957308, 2.47865, 1, 0, 0, 1, 1,
0.1019276, -0.6900188, 2.995218, 1, 0, 0, 1, 1,
0.102095, 1.537283, -0.7596522, 1, 0, 0, 1, 1,
0.1021388, 0.1740054, 1.016416, 1, 0, 0, 1, 1,
0.1045738, -2.017699, 3.254127, 1, 0, 0, 1, 1,
0.1080659, -0.1254252, 3.059067, 0, 0, 0, 1, 1,
0.1167628, -1.684724, 2.251315, 0, 0, 0, 1, 1,
0.1179089, -0.1029673, 2.932519, 0, 0, 0, 1, 1,
0.1265754, 0.9286772, -0.6688362, 0, 0, 0, 1, 1,
0.1286828, -2.91122, 2.301731, 0, 0, 0, 1, 1,
0.1299219, 1.013617, 2.018078, 0, 0, 0, 1, 1,
0.1302458, -0.07372337, 2.34673, 0, 0, 0, 1, 1,
0.1370386, 0.2407338, -1.348453, 1, 1, 1, 1, 1,
0.1382277, -1.712804, 2.176243, 1, 1, 1, 1, 1,
0.1386404, -0.5767033, 2.629793, 1, 1, 1, 1, 1,
0.1405486, 1.775499, -0.06218118, 1, 1, 1, 1, 1,
0.1418453, 1.213666, -0.7023164, 1, 1, 1, 1, 1,
0.1424897, -0.8038973, 3.271523, 1, 1, 1, 1, 1,
0.1440054, 0.5370021, -0.3131434, 1, 1, 1, 1, 1,
0.1440469, 0.5243161, 0.07590236, 1, 1, 1, 1, 1,
0.1441905, -0.3762679, 3.237559, 1, 1, 1, 1, 1,
0.1455847, 0.5928782, 0.8422267, 1, 1, 1, 1, 1,
0.1463859, -0.1899172, 1.823888, 1, 1, 1, 1, 1,
0.1468156, 0.8526124, -0.5286285, 1, 1, 1, 1, 1,
0.1529237, -0.3892573, 1.023398, 1, 1, 1, 1, 1,
0.1587578, 0.4181741, 0.6230758, 1, 1, 1, 1, 1,
0.1600022, 0.3872307, 1.566392, 1, 1, 1, 1, 1,
0.1640954, -1.288772, 3.698388, 0, 0, 1, 1, 1,
0.1656941, -0.3516182, 3.159097, 1, 0, 0, 1, 1,
0.168695, -0.1301603, 2.181638, 1, 0, 0, 1, 1,
0.1688162, -0.4106439, 3.323341, 1, 0, 0, 1, 1,
0.1714406, -2.224285, 1.505725, 1, 0, 0, 1, 1,
0.1754398, 0.1815414, -1.435138, 1, 0, 0, 1, 1,
0.1784719, 0.3049108, 0.2044069, 0, 0, 0, 1, 1,
0.1788883, 0.8771545, 1.847098, 0, 0, 0, 1, 1,
0.1828777, 0.7528157, -2.145601, 0, 0, 0, 1, 1,
0.1834261, 1.466931, 0.5638641, 0, 0, 0, 1, 1,
0.1876298, 2.828494, -0.6161089, 0, 0, 0, 1, 1,
0.1897129, 1.293989, -0.9761952, 0, 0, 0, 1, 1,
0.1940975, 1.280689, -0.05800802, 0, 0, 0, 1, 1,
0.1947242, -0.4801077, 1.688359, 1, 1, 1, 1, 1,
0.1953171, 1.090783, 0.06200562, 1, 1, 1, 1, 1,
0.1961804, -0.8025443, 1.824123, 1, 1, 1, 1, 1,
0.2044991, 0.7627207, 0.728421, 1, 1, 1, 1, 1,
0.2050892, 0.2489027, 0.6385828, 1, 1, 1, 1, 1,
0.2100828, -1.326797, 4.040249, 1, 1, 1, 1, 1,
0.2113115, 1.654995, 1.416406, 1, 1, 1, 1, 1,
0.2161161, 0.2121462, -1.089539, 1, 1, 1, 1, 1,
0.2167839, -0.2824695, 3.904433, 1, 1, 1, 1, 1,
0.2313589, -0.1781778, 1.896313, 1, 1, 1, 1, 1,
0.2350509, -1.050345, 4.187535, 1, 1, 1, 1, 1,
0.2377331, 0.1305327, 1.161257, 1, 1, 1, 1, 1,
0.2495898, 1.743208, -1.166491, 1, 1, 1, 1, 1,
0.2578782, 0.5831204, 0.8478774, 1, 1, 1, 1, 1,
0.2580073, 0.3283094, -0.432087, 1, 1, 1, 1, 1,
0.2596593, 1.52286, 1.249027, 0, 0, 1, 1, 1,
0.2677687, 0.4054242, 0.4511695, 1, 0, 0, 1, 1,
0.2683291, -1.325328, 1.620685, 1, 0, 0, 1, 1,
0.2702008, -0.6797689, 3.577972, 1, 0, 0, 1, 1,
0.2716422, -1.989732, 4.3771, 1, 0, 0, 1, 1,
0.2748967, -0.9906486, 3.509366, 1, 0, 0, 1, 1,
0.2848217, -0.04312358, 2.145724, 0, 0, 0, 1, 1,
0.2885321, -0.9795712, 4.572316, 0, 0, 0, 1, 1,
0.2907176, -0.8136948, 3.226849, 0, 0, 0, 1, 1,
0.2908082, 1.905657, -0.3611704, 0, 0, 0, 1, 1,
0.292975, 0.9635811, -0.9369704, 0, 0, 0, 1, 1,
0.2953412, 0.3137587, 0.6311634, 0, 0, 0, 1, 1,
0.3011561, 1.188581, 0.9242921, 0, 0, 0, 1, 1,
0.3078096, 3.366078, -0.02871811, 1, 1, 1, 1, 1,
0.3150309, 1.705495, 0.3952812, 1, 1, 1, 1, 1,
0.3152498, 1.148957, 0.1532279, 1, 1, 1, 1, 1,
0.3166867, -0.880037, 2.704442, 1, 1, 1, 1, 1,
0.316734, 0.1754253, 2.169692, 1, 1, 1, 1, 1,
0.3223095, 0.7455313, -1.283114, 1, 1, 1, 1, 1,
0.3237849, 1.597018, 0.8375508, 1, 1, 1, 1, 1,
0.3268477, 1.803054, -0.6803892, 1, 1, 1, 1, 1,
0.3282584, -1.334579, 2.095483, 1, 1, 1, 1, 1,
0.3304756, 1.063436, 0.1158233, 1, 1, 1, 1, 1,
0.3305192, -1.1966, 3.26111, 1, 1, 1, 1, 1,
0.3349911, 1.6195, 1.295695, 1, 1, 1, 1, 1,
0.3359946, -0.8907867, 3.021083, 1, 1, 1, 1, 1,
0.3433747, -1.094145, 2.832074, 1, 1, 1, 1, 1,
0.345165, 0.1663414, 1.067342, 1, 1, 1, 1, 1,
0.3459305, 2.190186, -0.8122932, 0, 0, 1, 1, 1,
0.3559017, -0.3696304, 2.929204, 1, 0, 0, 1, 1,
0.3592055, 0.7246646, 0.9778888, 1, 0, 0, 1, 1,
0.3593211, -1.544761, 2.395666, 1, 0, 0, 1, 1,
0.3609372, -0.950756, 1.797849, 1, 0, 0, 1, 1,
0.3629998, 0.6543407, 1.612844, 1, 0, 0, 1, 1,
0.3677612, 0.6751153, 1.499141, 0, 0, 0, 1, 1,
0.3704889, -0.5715353, 3.273552, 0, 0, 0, 1, 1,
0.371395, -1.058197, 2.027229, 0, 0, 0, 1, 1,
0.3716185, 0.4905879, 2.035079, 0, 0, 0, 1, 1,
0.3726274, 1.137179, 0.4883109, 0, 0, 0, 1, 1,
0.3767816, 0.2547236, -0.3858263, 0, 0, 0, 1, 1,
0.376862, 0.8749068, 1.641936, 0, 0, 0, 1, 1,
0.3772582, -1.873806, 1.094291, 1, 1, 1, 1, 1,
0.3800024, 1.637779, 0.5672855, 1, 1, 1, 1, 1,
0.3857889, 0.1344542, 0.7908015, 1, 1, 1, 1, 1,
0.3859727, 0.4209415, 1.544858, 1, 1, 1, 1, 1,
0.3890579, -0.1247053, 0.3337325, 1, 1, 1, 1, 1,
0.3915019, -0.883911, 2.177989, 1, 1, 1, 1, 1,
0.3938575, -0.7505333, 4.329519, 1, 1, 1, 1, 1,
0.4002331, 0.8602778, -0.1285591, 1, 1, 1, 1, 1,
0.4004539, 1.066354, 1.773979, 1, 1, 1, 1, 1,
0.4014753, 1.278015, -0.5719674, 1, 1, 1, 1, 1,
0.4029369, -0.6661262, 5.14684, 1, 1, 1, 1, 1,
0.4032219, -0.3282375, 2.863088, 1, 1, 1, 1, 1,
0.4038866, 1.19261, 0.3383851, 1, 1, 1, 1, 1,
0.4045071, -0.298009, 2.010643, 1, 1, 1, 1, 1,
0.4078444, 0.5863999, 1.594215, 1, 1, 1, 1, 1,
0.4088363, 0.03996936, 0.1040052, 0, 0, 1, 1, 1,
0.4166799, 0.02575742, 1.142628, 1, 0, 0, 1, 1,
0.4167182, -0.4916161, 3.117439, 1, 0, 0, 1, 1,
0.4191395, 0.9302231, -1.921836, 1, 0, 0, 1, 1,
0.4210856, -2.34583, 2.608057, 1, 0, 0, 1, 1,
0.4211699, -1.222747, 2.34995, 1, 0, 0, 1, 1,
0.4222774, 1.775755, 1.142583, 0, 0, 0, 1, 1,
0.4224387, -0.5584013, 3.455843, 0, 0, 0, 1, 1,
0.4261498, -1.436221, 3.234476, 0, 0, 0, 1, 1,
0.426424, -0.6177037, 1.974475, 0, 0, 0, 1, 1,
0.4287437, -0.5976652, 1.305494, 0, 0, 0, 1, 1,
0.4345287, -0.4714681, 2.817239, 0, 0, 0, 1, 1,
0.4359634, -0.4427792, 1.489662, 0, 0, 0, 1, 1,
0.4375884, 0.1219043, 0.7344211, 1, 1, 1, 1, 1,
0.4378635, -0.2527534, 0.5316498, 1, 1, 1, 1, 1,
0.4401007, -0.650915, 2.99977, 1, 1, 1, 1, 1,
0.4441468, 1.091205, 0.8743261, 1, 1, 1, 1, 1,
0.448769, 1.341111, -0.3219464, 1, 1, 1, 1, 1,
0.449219, 1.187463, 2.131377, 1, 1, 1, 1, 1,
0.4509913, -1.757357, 2.207948, 1, 1, 1, 1, 1,
0.4572658, -0.7940578, 4.066494, 1, 1, 1, 1, 1,
0.4587382, -0.188622, 1.255995, 1, 1, 1, 1, 1,
0.4591646, -0.1773951, 0.1918178, 1, 1, 1, 1, 1,
0.4625752, -1.289661, 2.133068, 1, 1, 1, 1, 1,
0.4640015, -0.4830621, 3.210912, 1, 1, 1, 1, 1,
0.4651459, -1.632875, 3.704732, 1, 1, 1, 1, 1,
0.4655124, 0.7116326, 0.473067, 1, 1, 1, 1, 1,
0.4665118, -1.376197, 4.225692, 1, 1, 1, 1, 1,
0.4747151, 2.673719, -1.117306, 0, 0, 1, 1, 1,
0.4787565, -0.797675, 2.603385, 1, 0, 0, 1, 1,
0.4797198, 0.6390871, 0.9326676, 1, 0, 0, 1, 1,
0.4812718, -0.002461122, 1.068093, 1, 0, 0, 1, 1,
0.4833315, 0.1645069, 2.899122, 1, 0, 0, 1, 1,
0.4862585, 1.043674, 1.856057, 1, 0, 0, 1, 1,
0.4915828, -0.4519087, 1.265429, 0, 0, 0, 1, 1,
0.4946242, 0.9497609, 2.153579, 0, 0, 0, 1, 1,
0.4949046, -1.008671, 4.046209, 0, 0, 0, 1, 1,
0.4973748, -0.4642853, 1.907952, 0, 0, 0, 1, 1,
0.5015638, -0.6699932, 2.581722, 0, 0, 0, 1, 1,
0.5069041, 0.2693941, 0.6471077, 0, 0, 0, 1, 1,
0.5075023, 0.211214, -0.09390318, 0, 0, 0, 1, 1,
0.5102568, -0.9238473, 2.632292, 1, 1, 1, 1, 1,
0.5119348, 0.08248815, 1.942951, 1, 1, 1, 1, 1,
0.5123877, 0.1674615, 1.844344, 1, 1, 1, 1, 1,
0.5137761, 2.265841, 1.020835, 1, 1, 1, 1, 1,
0.5139101, 0.05041793, -0.4478845, 1, 1, 1, 1, 1,
0.5151985, 0.4250309, 1.269984, 1, 1, 1, 1, 1,
0.5159403, -1.082946, 1.72999, 1, 1, 1, 1, 1,
0.5173231, -0.8425019, 2.125365, 1, 1, 1, 1, 1,
0.5179119, -1.394982, 1.628053, 1, 1, 1, 1, 1,
0.5207644, -0.1243085, 1.977178, 1, 1, 1, 1, 1,
0.5270039, 1.541053, -0.4120829, 1, 1, 1, 1, 1,
0.5291954, 0.06074599, 0.9376971, 1, 1, 1, 1, 1,
0.529753, 1.285585, -1.327991, 1, 1, 1, 1, 1,
0.5318537, -0.8803329, 1.472561, 1, 1, 1, 1, 1,
0.5381174, -0.2058377, 2.295986, 1, 1, 1, 1, 1,
0.5407012, 1.732138, -1.096124, 0, 0, 1, 1, 1,
0.5428367, -1.854572, 2.816035, 1, 0, 0, 1, 1,
0.5428726, 2.713491, 1.007922, 1, 0, 0, 1, 1,
0.5441324, 1.325271, 1.454384, 1, 0, 0, 1, 1,
0.546524, 0.5625946, -0.4121941, 1, 0, 0, 1, 1,
0.5511076, 0.5334013, 1.697085, 1, 0, 0, 1, 1,
0.5515723, -0.807676, 2.758231, 0, 0, 0, 1, 1,
0.5518078, 0.09743054, 1.88303, 0, 0, 0, 1, 1,
0.5555471, -0.1834286, 3.410667, 0, 0, 0, 1, 1,
0.5562999, -0.4855118, 4.340681, 0, 0, 0, 1, 1,
0.5588065, -0.003859079, 1.642752, 0, 0, 0, 1, 1,
0.5655079, 0.5393382, -1.731671, 0, 0, 0, 1, 1,
0.5686293, 0.7061846, -1.160381, 0, 0, 0, 1, 1,
0.5733734, -0.4998236, 2.23119, 1, 1, 1, 1, 1,
0.5733888, -1.839067, 2.56804, 1, 1, 1, 1, 1,
0.5752453, -0.003044383, 1.677956, 1, 1, 1, 1, 1,
0.5759475, 0.6543961, -0.6434099, 1, 1, 1, 1, 1,
0.576271, -0.520784, 3.672268, 1, 1, 1, 1, 1,
0.579402, 0.1397518, 2.585307, 1, 1, 1, 1, 1,
0.5832894, 1.477369, 0.1717401, 1, 1, 1, 1, 1,
0.5894638, 2.066504, -0.05891798, 1, 1, 1, 1, 1,
0.5898716, 1.068335, -0.8918571, 1, 1, 1, 1, 1,
0.5954305, -1.286531, 3.997925, 1, 1, 1, 1, 1,
0.6039303, 0.02227411, 0.04703876, 1, 1, 1, 1, 1,
0.6093682, 0.4140467, 0.1722612, 1, 1, 1, 1, 1,
0.6194178, 1.12833, 1.463519, 1, 1, 1, 1, 1,
0.6277508, -1.471846, 3.035573, 1, 1, 1, 1, 1,
0.6291328, -0.0316512, 1.145069, 1, 1, 1, 1, 1,
0.6341913, 0.3048141, 0.1541701, 0, 0, 1, 1, 1,
0.643024, 1.037227, 0.5429265, 1, 0, 0, 1, 1,
0.6485172, -0.456997, 3.123679, 1, 0, 0, 1, 1,
0.6497791, 0.2200248, 0.4804584, 1, 0, 0, 1, 1,
0.6510568, -0.7742704, 2.216566, 1, 0, 0, 1, 1,
0.6513346, 0.7470801, 1.522923, 1, 0, 0, 1, 1,
0.6519589, 0.1505698, 2.763409, 0, 0, 0, 1, 1,
0.6543838, 0.5976145, 0.6963636, 0, 0, 0, 1, 1,
0.6557299, 2.154203, -0.06171701, 0, 0, 0, 1, 1,
0.6573055, 0.9387219, 2.017273, 0, 0, 0, 1, 1,
0.6579575, 0.09160431, 0.9658448, 0, 0, 0, 1, 1,
0.6630024, -0.2849029, 2.409986, 0, 0, 0, 1, 1,
0.668843, 1.301302, 0.1876673, 0, 0, 0, 1, 1,
0.6718534, -1.008591, 0.8578172, 1, 1, 1, 1, 1,
0.6808322, -1.172615, 2.786025, 1, 1, 1, 1, 1,
0.6895379, -1.300541, 1.025057, 1, 1, 1, 1, 1,
0.6897144, -0.713256, 2.498336, 1, 1, 1, 1, 1,
0.6961878, 0.07834475, 0.8224183, 1, 1, 1, 1, 1,
0.6963568, -1.721146, 1.724245, 1, 1, 1, 1, 1,
0.697718, -1.997451, 3.830485, 1, 1, 1, 1, 1,
0.7039068, -0.1792143, 1.180447, 1, 1, 1, 1, 1,
0.7042235, -0.6919914, 3.341145, 1, 1, 1, 1, 1,
0.7046944, 0.07371103, 1.035749, 1, 1, 1, 1, 1,
0.7052345, 0.4978882, 1.209629, 1, 1, 1, 1, 1,
0.705757, -0.365, 1.161458, 1, 1, 1, 1, 1,
0.7061402, -0.6585435, 4.062473, 1, 1, 1, 1, 1,
0.7102544, 1.006408, -0.9668931, 1, 1, 1, 1, 1,
0.7223174, -2.229165, 2.784491, 1, 1, 1, 1, 1,
0.7270374, 2.409083, -0.4253817, 0, 0, 1, 1, 1,
0.7290712, -0.9518026, 2.780068, 1, 0, 0, 1, 1,
0.7310247, -0.8413796, 1.79183, 1, 0, 0, 1, 1,
0.7337769, 1.982186, -0.1551178, 1, 0, 0, 1, 1,
0.7407671, 1.724438, 1.433221, 1, 0, 0, 1, 1,
0.7533134, -0.9109652, 1.296297, 1, 0, 0, 1, 1,
0.7536207, 0.4386237, 1.376711, 0, 0, 0, 1, 1,
0.7536351, -0.4121104, 2.613283, 0, 0, 0, 1, 1,
0.755018, -0.9092575, 1.318269, 0, 0, 0, 1, 1,
0.7561381, 0.9089521, 0.3412884, 0, 0, 0, 1, 1,
0.7565077, -0.1949688, 0.6113998, 0, 0, 0, 1, 1,
0.7617391, -1.20196, 2.412136, 0, 0, 0, 1, 1,
0.7618119, -3.185503, 3.910642, 0, 0, 0, 1, 1,
0.7652176, 0.3262499, 3.793588, 1, 1, 1, 1, 1,
0.7681842, 0.6205717, 1.567504, 1, 1, 1, 1, 1,
0.7712749, -1.49653, 0.09759314, 1, 1, 1, 1, 1,
0.774693, 0.4237583, -1.311532, 1, 1, 1, 1, 1,
0.7793126, -0.0166798, 2.061825, 1, 1, 1, 1, 1,
0.7804011, 0.143471, 1.550328, 1, 1, 1, 1, 1,
0.7816573, 1.324093, 0.5818387, 1, 1, 1, 1, 1,
0.7833853, 0.8290826, 1.640734, 1, 1, 1, 1, 1,
0.786625, -0.3521222, 0.7422393, 1, 1, 1, 1, 1,
0.7876792, 0.7705474, 0.5081422, 1, 1, 1, 1, 1,
0.7945126, 0.2418301, 1.077684, 1, 1, 1, 1, 1,
0.7946094, -0.5382324, 2.974207, 1, 1, 1, 1, 1,
0.7976488, 0.8220661, 0.7684228, 1, 1, 1, 1, 1,
0.80293, 0.2055426, 1.591285, 1, 1, 1, 1, 1,
0.8042181, -1.319511, 3.118902, 1, 1, 1, 1, 1,
0.8102239, 1.181655, -1.277643, 0, 0, 1, 1, 1,
0.8212299, 1.231435, -0.4667347, 1, 0, 0, 1, 1,
0.8225386, -0.4416515, 3.130694, 1, 0, 0, 1, 1,
0.8270659, -0.6363803, 1.191744, 1, 0, 0, 1, 1,
0.8288718, -0.4803651, 2.429892, 1, 0, 0, 1, 1,
0.8333713, -0.3176599, 2.224081, 1, 0, 0, 1, 1,
0.8338295, 0.07010867, 0.655625, 0, 0, 0, 1, 1,
0.8342605, -1.029463, 1.776611, 0, 0, 0, 1, 1,
0.8361603, -0.07062823, 2.631028, 0, 0, 0, 1, 1,
0.8420238, -0.1821149, 3.271977, 0, 0, 0, 1, 1,
0.8456954, -1.96656, 3.88336, 0, 0, 0, 1, 1,
0.851765, 0.9967986, 0.8252437, 0, 0, 0, 1, 1,
0.8528434, 1.224746, 0.4530405, 0, 0, 0, 1, 1,
0.8573532, 1.493281, 0.05613795, 1, 1, 1, 1, 1,
0.8581339, -0.3156058, 2.849736, 1, 1, 1, 1, 1,
0.8587767, -0.2807646, 1.488194, 1, 1, 1, 1, 1,
0.8598321, -0.9050611, 0.4912519, 1, 1, 1, 1, 1,
0.8606272, -1.267595, 3.346717, 1, 1, 1, 1, 1,
0.8620188, 0.731843, -0.8956984, 1, 1, 1, 1, 1,
0.8651324, -0.3008977, 2.555859, 1, 1, 1, 1, 1,
0.8687856, -1.276947, 1.415618, 1, 1, 1, 1, 1,
0.8716366, -0.9488434, 1.066499, 1, 1, 1, 1, 1,
0.8729298, 1.291667, -0.3015571, 1, 1, 1, 1, 1,
0.8770866, 0.5291748, -0.3320011, 1, 1, 1, 1, 1,
0.8783578, 0.3846029, 0.415347, 1, 1, 1, 1, 1,
0.8797112, 1.211984, -0.3687889, 1, 1, 1, 1, 1,
0.8809479, -0.8031867, 2.709472, 1, 1, 1, 1, 1,
0.8891279, 0.1880413, 0.08061775, 1, 1, 1, 1, 1,
0.8924771, -1.056838, 3.992845, 0, 0, 1, 1, 1,
0.8939068, -1.469772, 1.034935, 1, 0, 0, 1, 1,
0.8943939, -1.170789, 2.206874, 1, 0, 0, 1, 1,
0.8952026, 1.113328, 0.4166034, 1, 0, 0, 1, 1,
0.8965143, -0.06765337, 1.969146, 1, 0, 0, 1, 1,
0.897388, 0.01933549, 0.6964913, 1, 0, 0, 1, 1,
0.9039717, 1.202815, 2.413219, 0, 0, 0, 1, 1,
0.9091411, 0.9874219, 2.694302, 0, 0, 0, 1, 1,
0.9104974, 0.5986742, 1.951593, 0, 0, 0, 1, 1,
0.9112352, -1.352375, 1.903848, 0, 0, 0, 1, 1,
0.9165763, 1.426033, 0.6292324, 0, 0, 0, 1, 1,
0.9169106, -0.09337009, 0.864969, 0, 0, 0, 1, 1,
0.9190418, -0.1493362, 1.466515, 0, 0, 0, 1, 1,
0.9233858, 1.101395, 0.06571399, 1, 1, 1, 1, 1,
0.9248354, -3.293815, 3.496376, 1, 1, 1, 1, 1,
0.9285044, -1.149848, 0.9297906, 1, 1, 1, 1, 1,
0.9309112, 0.1174101, 2.183125, 1, 1, 1, 1, 1,
0.9341521, 0.3322327, 0.4365465, 1, 1, 1, 1, 1,
0.9438953, 0.6372557, 3.381288, 1, 1, 1, 1, 1,
0.9473004, 0.2896068, 0.07394114, 1, 1, 1, 1, 1,
0.9491587, 0.6083955, 0.6951546, 1, 1, 1, 1, 1,
0.9578818, -0.5294998, 3.009928, 1, 1, 1, 1, 1,
0.961819, 0.3675646, 0.7787932, 1, 1, 1, 1, 1,
0.9668934, 0.4320165, 0.3414484, 1, 1, 1, 1, 1,
0.9733165, -0.6089184, 2.109775, 1, 1, 1, 1, 1,
0.9744889, 0.5764425, 2.276463, 1, 1, 1, 1, 1,
0.9757913, -0.4730254, 2.423122, 1, 1, 1, 1, 1,
0.9782796, -0.07101603, 1.870644, 1, 1, 1, 1, 1,
0.981097, -0.858926, 1.712505, 0, 0, 1, 1, 1,
0.9817014, -0.9217596, 2.365942, 1, 0, 0, 1, 1,
0.9873126, 0.6094168, 2.153302, 1, 0, 0, 1, 1,
0.9908818, 1.741153, 0.7952237, 1, 0, 0, 1, 1,
0.9912181, 2.36048, 0.7925348, 1, 0, 0, 1, 1,
0.9926805, 1.187674, 0.7013997, 1, 0, 0, 1, 1,
1.003025, 0.3221922, 1.820258, 0, 0, 0, 1, 1,
1.005483, 0.4932881, 2.107338, 0, 0, 0, 1, 1,
1.011858, 1.059024, 0.9891521, 0, 0, 0, 1, 1,
1.023963, 1.651123, -0.871148, 0, 0, 0, 1, 1,
1.026293, 0.5274174, 1.622036, 0, 0, 0, 1, 1,
1.027499, -1.124447, 3.7747, 0, 0, 0, 1, 1,
1.03143, 0.4501989, 2.073728, 0, 0, 0, 1, 1,
1.031964, 0.1604404, 0.2098571, 1, 1, 1, 1, 1,
1.035019, -1.595576, 3.574156, 1, 1, 1, 1, 1,
1.0373, 0.09247109, 0.9699727, 1, 1, 1, 1, 1,
1.048782, 0.07607947, 0.1796579, 1, 1, 1, 1, 1,
1.053162, 1.903016, 0.1823475, 1, 1, 1, 1, 1,
1.056396, 0.2725694, 1.097005, 1, 1, 1, 1, 1,
1.058951, -1.280956, 1.698677, 1, 1, 1, 1, 1,
1.072289, -0.2257108, 2.001115, 1, 1, 1, 1, 1,
1.07564, -1.03747, 3.986136, 1, 1, 1, 1, 1,
1.08289, -0.8714651, 2.120995, 1, 1, 1, 1, 1,
1.086759, -0.7627527, 2.315886, 1, 1, 1, 1, 1,
1.095626, -0.714336, 3.634313, 1, 1, 1, 1, 1,
1.098138, 1.199541, 1.142337, 1, 1, 1, 1, 1,
1.098899, -0.3063749, 0.1075099, 1, 1, 1, 1, 1,
1.099937, -0.7251664, 3.429104, 1, 1, 1, 1, 1,
1.100274, -0.3148158, 1.756091, 0, 0, 1, 1, 1,
1.101498, 0.894851, 2.094919, 1, 0, 0, 1, 1,
1.112093, -0.5025753, 2.759353, 1, 0, 0, 1, 1,
1.134293, -0.5221647, 3.835671, 1, 0, 0, 1, 1,
1.135404, -0.1562678, 1.641935, 1, 0, 0, 1, 1,
1.13619, 0.4702287, 0.8743671, 1, 0, 0, 1, 1,
1.136737, -1.087856, 2.231287, 0, 0, 0, 1, 1,
1.149411, -0.5557343, 2.587566, 0, 0, 0, 1, 1,
1.167452, 0.5046839, 1.406272, 0, 0, 0, 1, 1,
1.172502, -0.6556079, 1.787996, 0, 0, 0, 1, 1,
1.180529, -0.918219, 3.666416, 0, 0, 0, 1, 1,
1.193686, -1.403725, 2.590586, 0, 0, 0, 1, 1,
1.200279, -0.986869, 2.626092, 0, 0, 0, 1, 1,
1.206164, 0.2866181, 1.407333, 1, 1, 1, 1, 1,
1.212291, -1.012867, 3.081845, 1, 1, 1, 1, 1,
1.216701, 0.361669, 2.896156, 1, 1, 1, 1, 1,
1.222286, -0.4410585, 1.563738, 1, 1, 1, 1, 1,
1.223157, -0.4309404, 2.643612, 1, 1, 1, 1, 1,
1.23673, 0.1825112, 2.882296, 1, 1, 1, 1, 1,
1.238453, -0.3904606, 1.72714, 1, 1, 1, 1, 1,
1.243199, 0.2728241, 1.480879, 1, 1, 1, 1, 1,
1.250567, -0.3199585, 3.100746, 1, 1, 1, 1, 1,
1.252581, 1.001292, 0.2375344, 1, 1, 1, 1, 1,
1.279926, 0.2802699, 4.67263, 1, 1, 1, 1, 1,
1.292142, 2.266066, 0.5360892, 1, 1, 1, 1, 1,
1.293395, -1.33861, 2.1405, 1, 1, 1, 1, 1,
1.301003, -0.5963148, 1.057792, 1, 1, 1, 1, 1,
1.302921, -0.274703, 1.870183, 1, 1, 1, 1, 1,
1.304633, -0.07823264, 2.487755, 0, 0, 1, 1, 1,
1.309125, -0.2507388, 0.5483151, 1, 0, 0, 1, 1,
1.309803, 0.01393624, 1.336611, 1, 0, 0, 1, 1,
1.310022, 0.4657619, 2.28854, 1, 0, 0, 1, 1,
1.3102, -1.192112, 2.623966, 1, 0, 0, 1, 1,
1.312476, 1.39537, 0.9248414, 1, 0, 0, 1, 1,
1.325574, -1.220593, 1.07959, 0, 0, 0, 1, 1,
1.326705, -2.045528, 1.425677, 0, 0, 0, 1, 1,
1.326894, -2.154789, 3.234038, 0, 0, 0, 1, 1,
1.340883, 1.108811, 1.941853, 0, 0, 0, 1, 1,
1.354033, -0.1504275, -0.06813176, 0, 0, 0, 1, 1,
1.354188, -0.9024351, 1.258766, 0, 0, 0, 1, 1,
1.365165, -1.083818, 1.650371, 0, 0, 0, 1, 1,
1.369004, -0.519909, 2.630056, 1, 1, 1, 1, 1,
1.37526, -0.9449359, 2.672527, 1, 1, 1, 1, 1,
1.386545, -0.5074325, 2.547331, 1, 1, 1, 1, 1,
1.387244, -0.4251578, 2.27297, 1, 1, 1, 1, 1,
1.392779, 0.4461367, 2.377321, 1, 1, 1, 1, 1,
1.413401, 0.3725599, 0.6026433, 1, 1, 1, 1, 1,
1.423644, 0.8854217, 2.152915, 1, 1, 1, 1, 1,
1.431037, -1.007127, 2.221049, 1, 1, 1, 1, 1,
1.431352, -0.569325, 2.298733, 1, 1, 1, 1, 1,
1.433935, 1.347274, -0.03445348, 1, 1, 1, 1, 1,
1.472768, 1.339823, 1.402672, 1, 1, 1, 1, 1,
1.475054, -0.1564435, 1.420404, 1, 1, 1, 1, 1,
1.483932, 1.266723, 2.608424, 1, 1, 1, 1, 1,
1.485921, -0.001423983, 2.093285, 1, 1, 1, 1, 1,
1.488165, -1.691061, 1.524378, 1, 1, 1, 1, 1,
1.496062, 0.1410272, 1.463258, 0, 0, 1, 1, 1,
1.50516, -1.392078, 1.414908, 1, 0, 0, 1, 1,
1.506145, 1.39344, 1.305525, 1, 0, 0, 1, 1,
1.51589, 0.07273988, 0.4341845, 1, 0, 0, 1, 1,
1.516625, -0.3359516, 1.141431, 1, 0, 0, 1, 1,
1.517289, 0.5424604, 3.656754, 1, 0, 0, 1, 1,
1.521921, 0.8045794, 2.957746, 0, 0, 0, 1, 1,
1.536514, -0.03661837, 2.589397, 0, 0, 0, 1, 1,
1.538703, 0.1568568, 1.32054, 0, 0, 0, 1, 1,
1.538804, -0.7675202, 1.437942, 0, 0, 0, 1, 1,
1.547329, -1.435143, 1.30884, 0, 0, 0, 1, 1,
1.548478, 1.756864, 1.942626, 0, 0, 0, 1, 1,
1.576952, -0.2210729, 1.47299, 0, 0, 0, 1, 1,
1.595057, -1.31514, 2.242553, 1, 1, 1, 1, 1,
1.613903, 1.363244, 0.7906064, 1, 1, 1, 1, 1,
1.62094, -0.496078, 1.155943, 1, 1, 1, 1, 1,
1.630955, -1.472594, 2.508406, 1, 1, 1, 1, 1,
1.646707, -1.150218, 1.163738, 1, 1, 1, 1, 1,
1.65701, -0.5213498, 1.373161, 1, 1, 1, 1, 1,
1.671988, -1.480152, 2.764535, 1, 1, 1, 1, 1,
1.67422, -0.2331225, 2.087282, 1, 1, 1, 1, 1,
1.677199, -1.900617, 3.105103, 1, 1, 1, 1, 1,
1.679825, -0.4280145, -0.04994564, 1, 1, 1, 1, 1,
1.683874, -1.594186, 0.7498276, 1, 1, 1, 1, 1,
1.686891, -1.494443, 1.939993, 1, 1, 1, 1, 1,
1.688401, -0.3639839, 2.852282, 1, 1, 1, 1, 1,
1.697882, -0.8530894, 2.890747, 1, 1, 1, 1, 1,
1.711201, -0.04865142, 2.608835, 1, 1, 1, 1, 1,
1.725619, 1.274322, 0.0492764, 0, 0, 1, 1, 1,
1.735057, 0.1635105, 0.828319, 1, 0, 0, 1, 1,
1.752388, -1.111932, 1.172286, 1, 0, 0, 1, 1,
1.755867, 0.4715121, 1.737879, 1, 0, 0, 1, 1,
1.783339, 0.5369103, 0.7766336, 1, 0, 0, 1, 1,
1.818302, 2.861151, -0.9755306, 1, 0, 0, 1, 1,
1.818378, -0.6058369, 2.491848, 0, 0, 0, 1, 1,
1.818711, -0.2986808, 1.749251, 0, 0, 0, 1, 1,
1.837287, -0.0900119, 0.8864676, 0, 0, 0, 1, 1,
1.852466, -0.1411965, 1.42441, 0, 0, 0, 1, 1,
1.888929, 0.5057721, 2.466431, 0, 0, 0, 1, 1,
1.900631, 1.750057, 0.6139748, 0, 0, 0, 1, 1,
1.905225, 0.2907977, 1.916736, 0, 0, 0, 1, 1,
1.90755, 0.3881511, 0.9837887, 1, 1, 1, 1, 1,
1.92081, 2.263335, 2.552511, 1, 1, 1, 1, 1,
1.923729, -0.4937513, 2.784956, 1, 1, 1, 1, 1,
1.952803, -0.2894662, 2.510417, 1, 1, 1, 1, 1,
1.968738, 0.007431215, 1.629395, 1, 1, 1, 1, 1,
1.979038, -1.125216, 1.400988, 1, 1, 1, 1, 1,
1.986557, -0.4389943, 0.9132406, 1, 1, 1, 1, 1,
2.010815, 0.5342306, -0.593462, 1, 1, 1, 1, 1,
2.051446, -0.4096524, 1.014055, 1, 1, 1, 1, 1,
2.091643, -0.4768291, 3.123419, 1, 1, 1, 1, 1,
2.102025, 0.9274299, 0.3325981, 1, 1, 1, 1, 1,
2.158848, 0.09299523, 0.6348867, 1, 1, 1, 1, 1,
2.158892, 0.5466934, 2.133211, 1, 1, 1, 1, 1,
2.164265, 0.2951936, 1.777845, 1, 1, 1, 1, 1,
2.181579, -1.50481, 2.411878, 1, 1, 1, 1, 1,
2.190424, -1.100449, 1.977984, 0, 0, 1, 1, 1,
2.191605, 0.3013705, 0.1180737, 1, 0, 0, 1, 1,
2.198019, -1.091269, 2.723618, 1, 0, 0, 1, 1,
2.210138, 1.649714, 1.958897, 1, 0, 0, 1, 1,
2.212533, 0.397056, 1.284016, 1, 0, 0, 1, 1,
2.215702, 1.355888, 1.193325, 1, 0, 0, 1, 1,
2.219045, -0.398275, 1.496082, 0, 0, 0, 1, 1,
2.221485, -0.4447238, 2.412991, 0, 0, 0, 1, 1,
2.278341, 0.5723209, 1.933204, 0, 0, 0, 1, 1,
2.293246, -1.268214, 2.630017, 0, 0, 0, 1, 1,
2.298799, 1.289167, 0.8210046, 0, 0, 0, 1, 1,
2.331517, -1.748395, 2.108333, 0, 0, 0, 1, 1,
2.347565, 0.258332, 2.276764, 0, 0, 0, 1, 1,
2.374034, -0.6745405, 1.312019, 1, 1, 1, 1, 1,
2.405542, -1.291131, 0.004798113, 1, 1, 1, 1, 1,
2.530726, -0.3074951, 1.208055, 1, 1, 1, 1, 1,
2.544615, 0.6704322, 2.231078, 1, 1, 1, 1, 1,
2.582651, 0.1477205, 1.674633, 1, 1, 1, 1, 1,
2.787359, -0.2181873, 1.0485, 1, 1, 1, 1, 1,
3.702696, 3.076497, 0.3636115, 1, 1, 1, 1, 1
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
var radius = 10.05656;
var distance = 35.32325;
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
mvMatrix.translate( -0.22018, -0.07473111, 0.3375244 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.32325);
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
