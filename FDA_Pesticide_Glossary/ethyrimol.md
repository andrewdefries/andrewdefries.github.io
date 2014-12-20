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
-2.818396, -0.2277288, -0.08203991, 1, 0, 0, 1,
-2.727519, -0.3195986, -1.391317, 1, 0.007843138, 0, 1,
-2.68759, -0.3154896, -1.358156, 1, 0.01176471, 0, 1,
-2.646671, -0.0855162, -1.480506, 1, 0.01960784, 0, 1,
-2.563339, 0.2900534, -0.6246481, 1, 0.02352941, 0, 1,
-2.539144, 0.09783895, -1.262744, 1, 0.03137255, 0, 1,
-2.490474, 0.6183661, -0.6338185, 1, 0.03529412, 0, 1,
-2.43691, 0.05843986, -1.195906, 1, 0.04313726, 0, 1,
-2.37548, -1.075478, -0.6271704, 1, 0.04705882, 0, 1,
-2.367284, 2.455763, 0.1841834, 1, 0.05490196, 0, 1,
-2.351991, -0.7264813, -2.018607, 1, 0.05882353, 0, 1,
-2.348181, 0.3770471, -2.196287, 1, 0.06666667, 0, 1,
-2.332941, -0.6198385, -2.57423, 1, 0.07058824, 0, 1,
-2.241297, 0.4259634, -2.7705, 1, 0.07843138, 0, 1,
-2.144159, 1.078231, -1.772367, 1, 0.08235294, 0, 1,
-2.099747, 0.7774746, -3.223099, 1, 0.09019608, 0, 1,
-2.098756, 0.4588637, -1.310791, 1, 0.09411765, 0, 1,
-2.060719, 1.125067, -1.687684, 1, 0.1019608, 0, 1,
-2.035768, -1.471825, 0.4278733, 1, 0.1098039, 0, 1,
-2.009714, -0.07183081, -1.525378, 1, 0.1137255, 0, 1,
-1.997469, 0.1005309, -0.2359751, 1, 0.1215686, 0, 1,
-1.988073, 2.415702, 0.2071671, 1, 0.1254902, 0, 1,
-1.980192, 0.03460535, -0.9104399, 1, 0.1333333, 0, 1,
-1.965434, 1.486952, 1.819413, 1, 0.1372549, 0, 1,
-1.95134, -0.1746823, -1.335441, 1, 0.145098, 0, 1,
-1.951291, -0.6526783, -2.336223, 1, 0.1490196, 0, 1,
-1.950206, 1.129578, -1.88356, 1, 0.1568628, 0, 1,
-1.945751, -0.08350082, -2.047688, 1, 0.1607843, 0, 1,
-1.914402, 0.458003, -2.234929, 1, 0.1686275, 0, 1,
-1.911567, 0.05692096, -2.214846, 1, 0.172549, 0, 1,
-1.908143, -1.335334, -1.759558, 1, 0.1803922, 0, 1,
-1.871953, -1.717001, -2.390537, 1, 0.1843137, 0, 1,
-1.840384, -1.095547, -1.955857, 1, 0.1921569, 0, 1,
-1.825343, 0.004317522, -2.055824, 1, 0.1960784, 0, 1,
-1.803986, -0.6031049, -1.040757, 1, 0.2039216, 0, 1,
-1.776879, -0.9994574, -1.620737, 1, 0.2117647, 0, 1,
-1.762558, -0.62817, -0.766085, 1, 0.2156863, 0, 1,
-1.729237, 0.1496721, -2.552325, 1, 0.2235294, 0, 1,
-1.725411, 1.819663, -1.518011, 1, 0.227451, 0, 1,
-1.713534, -0.8589257, -2.987243, 1, 0.2352941, 0, 1,
-1.71286, -1.116465, -3.290112, 1, 0.2392157, 0, 1,
-1.712725, -3.12988, -0.8804468, 1, 0.2470588, 0, 1,
-1.706993, 2.391388, -0.04432055, 1, 0.2509804, 0, 1,
-1.704211, 0.3184117, -1.902541, 1, 0.2588235, 0, 1,
-1.69355, 0.5096089, -1.217253, 1, 0.2627451, 0, 1,
-1.683678, 0.5044488, -0.1819843, 1, 0.2705882, 0, 1,
-1.645713, 0.2654781, -2.656757, 1, 0.2745098, 0, 1,
-1.641427, 0.1626769, -2.422065, 1, 0.282353, 0, 1,
-1.631037, 0.2273534, -2.162491, 1, 0.2862745, 0, 1,
-1.617707, -0.6955562, -3.565558, 1, 0.2941177, 0, 1,
-1.59822, -0.4598363, -1.566289, 1, 0.3019608, 0, 1,
-1.597453, 0.5712382, -0.421634, 1, 0.3058824, 0, 1,
-1.596653, -0.6608328, -3.809964, 1, 0.3137255, 0, 1,
-1.587711, -0.7361204, -1.897796, 1, 0.3176471, 0, 1,
-1.573075, -0.673027, -1.594857, 1, 0.3254902, 0, 1,
-1.559402, -0.8663519, -2.359262, 1, 0.3294118, 0, 1,
-1.555774, 0.6088992, -1.803306, 1, 0.3372549, 0, 1,
-1.550394, 0.3455178, 0.981787, 1, 0.3411765, 0, 1,
-1.545999, -0.3097917, -1.126183, 1, 0.3490196, 0, 1,
-1.54194, 0.1428909, -1.640351, 1, 0.3529412, 0, 1,
-1.536599, 1.506771, -0.2381515, 1, 0.3607843, 0, 1,
-1.529862, -0.2249434, -2.028024, 1, 0.3647059, 0, 1,
-1.506414, 0.1722793, -1.845858, 1, 0.372549, 0, 1,
-1.494919, 0.7561817, 0.6691301, 1, 0.3764706, 0, 1,
-1.494768, -0.2246492, -1.43753, 1, 0.3843137, 0, 1,
-1.48427, 1.682608, -1.322919, 1, 0.3882353, 0, 1,
-1.482275, 0.05432334, -1.66089, 1, 0.3960784, 0, 1,
-1.478548, -0.638705, -1.207024, 1, 0.4039216, 0, 1,
-1.443572, 1.950919, -1.042886, 1, 0.4078431, 0, 1,
-1.443419, -1.255807, -2.294041, 1, 0.4156863, 0, 1,
-1.438413, 1.597616, -0.6440918, 1, 0.4196078, 0, 1,
-1.435049, 0.6441149, -1.299938, 1, 0.427451, 0, 1,
-1.430676, 0.3638885, -1.333975, 1, 0.4313726, 0, 1,
-1.42143, 0.664169, 0.9738289, 1, 0.4392157, 0, 1,
-1.418255, 0.6426064, 0.2940641, 1, 0.4431373, 0, 1,
-1.407505, 0.4288998, -3.349728, 1, 0.4509804, 0, 1,
-1.399008, 1.607305, -0.3047412, 1, 0.454902, 0, 1,
-1.398274, -0.366587, -2.053244, 1, 0.4627451, 0, 1,
-1.393846, -0.5984187, -2.721119, 1, 0.4666667, 0, 1,
-1.386942, -1.455109, -2.90476, 1, 0.4745098, 0, 1,
-1.378909, -0.082089, -0.5206136, 1, 0.4784314, 0, 1,
-1.373757, -1.819907, -4.395279, 1, 0.4862745, 0, 1,
-1.350861, -0.3343759, -1.853653, 1, 0.4901961, 0, 1,
-1.349837, 0.5091294, -0.3222868, 1, 0.4980392, 0, 1,
-1.340537, -1.422563, -2.77608, 1, 0.5058824, 0, 1,
-1.337775, -1.095687, -3.163904, 1, 0.509804, 0, 1,
-1.329991, 0.1685097, -1.837159, 1, 0.5176471, 0, 1,
-1.329959, 0.8836772, -0.7257298, 1, 0.5215687, 0, 1,
-1.325854, -0.8879884, -0.8728023, 1, 0.5294118, 0, 1,
-1.324196, 0.5078406, -0.869927, 1, 0.5333334, 0, 1,
-1.321453, -1.526059, -2.458629, 1, 0.5411765, 0, 1,
-1.320357, 0.6795352, -0.8018267, 1, 0.5450981, 0, 1,
-1.315928, -1.592277, -3.786111, 1, 0.5529412, 0, 1,
-1.315428, 1.41522, -1.741439, 1, 0.5568628, 0, 1,
-1.314835, 2.064815, -0.01724947, 1, 0.5647059, 0, 1,
-1.311491, -0.1075755, 0.6149237, 1, 0.5686275, 0, 1,
-1.306761, 0.1427776, -1.424451, 1, 0.5764706, 0, 1,
-1.306302, 0.1030262, -0.7765146, 1, 0.5803922, 0, 1,
-1.297429, -0.2714205, -2.089168, 1, 0.5882353, 0, 1,
-1.288397, 0.5350856, -2.051988, 1, 0.5921569, 0, 1,
-1.273522, 2.674516, 2.841672, 1, 0.6, 0, 1,
-1.268865, 1.114693, -1.918513, 1, 0.6078432, 0, 1,
-1.25968, 1.337385, 0.8278611, 1, 0.6117647, 0, 1,
-1.24046, -0.2838441, -1.507944, 1, 0.6196079, 0, 1,
-1.235535, -1.077861, -0.7453403, 1, 0.6235294, 0, 1,
-1.234292, 1.040398, -1.738255, 1, 0.6313726, 0, 1,
-1.213567, 0.7304546, -1.182572, 1, 0.6352941, 0, 1,
-1.212797, -0.436157, -1.286142, 1, 0.6431373, 0, 1,
-1.208786, -0.7059646, -3.012242, 1, 0.6470588, 0, 1,
-1.203725, -0.246067, -0.05458335, 1, 0.654902, 0, 1,
-1.202337, -0.6450729, -1.559546, 1, 0.6588235, 0, 1,
-1.195993, -0.2480198, -1.240387, 1, 0.6666667, 0, 1,
-1.193607, 1.288527, 0.1657747, 1, 0.6705883, 0, 1,
-1.19328, 0.7642304, -0.1671937, 1, 0.6784314, 0, 1,
-1.189104, -2.023887, -2.703986, 1, 0.682353, 0, 1,
-1.185959, -0.6999666, -3.137912, 1, 0.6901961, 0, 1,
-1.176743, -0.9079999, -2.463396, 1, 0.6941177, 0, 1,
-1.16669, 1.422861, 0.6122017, 1, 0.7019608, 0, 1,
-1.161077, 0.2417415, -2.912357, 1, 0.7098039, 0, 1,
-1.16024, -1.27806, -1.99338, 1, 0.7137255, 0, 1,
-1.15568, 1.488514, 0.2965051, 1, 0.7215686, 0, 1,
-1.155119, 0.7742425, 0.4460886, 1, 0.7254902, 0, 1,
-1.153565, 2.303237, -0.5417281, 1, 0.7333333, 0, 1,
-1.153178, -1.355439, -1.867467, 1, 0.7372549, 0, 1,
-1.151245, -0.1571935, -1.039222, 1, 0.7450981, 0, 1,
-1.149969, -1.196308, -3.015899, 1, 0.7490196, 0, 1,
-1.144226, -0.8023482, -2.978483, 1, 0.7568628, 0, 1,
-1.141321, 1.429688, 0.264699, 1, 0.7607843, 0, 1,
-1.136242, 0.1685043, -1.817743, 1, 0.7686275, 0, 1,
-1.135358, 0.3533378, -1.234942, 1, 0.772549, 0, 1,
-1.110295, -0.9374281, -3.751184, 1, 0.7803922, 0, 1,
-1.10427, -1.582155, -3.594853, 1, 0.7843137, 0, 1,
-1.101116, -1.577844, -2.344689, 1, 0.7921569, 0, 1,
-1.09338, -1.190254, -0.7305835, 1, 0.7960784, 0, 1,
-1.092308, -1.071867, -2.881454, 1, 0.8039216, 0, 1,
-1.088109, 0.2775411, -0.9471899, 1, 0.8117647, 0, 1,
-1.086544, -0.123736, -1.926194, 1, 0.8156863, 0, 1,
-1.085599, 0.5330321, -0.7041417, 1, 0.8235294, 0, 1,
-1.083772, 0.004508838, -1.972946, 1, 0.827451, 0, 1,
-1.079679, 1.007246, 0.04670754, 1, 0.8352941, 0, 1,
-1.075198, 0.2021632, -0.530792, 1, 0.8392157, 0, 1,
-1.070987, -1.362652, -4.391673, 1, 0.8470588, 0, 1,
-1.068064, 1.074905, -0.3353899, 1, 0.8509804, 0, 1,
-1.06594, 0.7532036, -0.8076848, 1, 0.8588235, 0, 1,
-1.049547, 0.3052471, -0.5968207, 1, 0.8627451, 0, 1,
-1.048677, 1.757935, 0.04947373, 1, 0.8705882, 0, 1,
-1.023583, -0.398419, -1.120016, 1, 0.8745098, 0, 1,
-1.015297, 0.5429664, -2.289427, 1, 0.8823529, 0, 1,
-1.014637, -0.09792407, -1.899453, 1, 0.8862745, 0, 1,
-1.013379, -0.6357656, -1.068897, 1, 0.8941177, 0, 1,
-1.012191, -2.39062, -2.234378, 1, 0.8980392, 0, 1,
-1.011047, 0.6529703, 0.2918113, 1, 0.9058824, 0, 1,
-1.009344, -0.1043859, -2.851092, 1, 0.9137255, 0, 1,
-1.000924, 1.425252, -1.882827, 1, 0.9176471, 0, 1,
-0.9998579, -1.015182, 0.1448351, 1, 0.9254902, 0, 1,
-0.999449, -0.8390622, -1.076162, 1, 0.9294118, 0, 1,
-0.9988328, 1.407776, -3.128435, 1, 0.9372549, 0, 1,
-0.9954199, 1.142622, -0.1585623, 1, 0.9411765, 0, 1,
-0.9922562, 1.654935, -2.518715, 1, 0.9490196, 0, 1,
-0.9885862, 0.07520327, -0.749974, 1, 0.9529412, 0, 1,
-0.9786914, 2.023905, -2.004839, 1, 0.9607843, 0, 1,
-0.9675496, 0.6416909, 1.434143, 1, 0.9647059, 0, 1,
-0.9667522, -0.1451814, -1.172031, 1, 0.972549, 0, 1,
-0.9613561, 0.6643543, -1.511278, 1, 0.9764706, 0, 1,
-0.9591213, 0.6533849, -0.6682632, 1, 0.9843137, 0, 1,
-0.9567546, 0.5570475, -0.2236079, 1, 0.9882353, 0, 1,
-0.9525692, 1.710793, -0.2075543, 1, 0.9960784, 0, 1,
-0.9502407, 1.793272, -1.130341, 0.9960784, 1, 0, 1,
-0.9497724, 0.8788888, 0.9636464, 0.9921569, 1, 0, 1,
-0.9458861, -1.020988, -1.456067, 0.9843137, 1, 0, 1,
-0.9447616, 1.701232, 0.2468891, 0.9803922, 1, 0, 1,
-0.9410814, 1.157024, 0.1073663, 0.972549, 1, 0, 1,
-0.9405758, -0.3268031, -2.456298, 0.9686275, 1, 0, 1,
-0.9380255, -0.7804883, -1.65408, 0.9607843, 1, 0, 1,
-0.9373649, -0.4050092, -1.154102, 0.9568627, 1, 0, 1,
-0.9343059, -1.20904, -1.667406, 0.9490196, 1, 0, 1,
-0.9341615, -0.7854692, -5.913661, 0.945098, 1, 0, 1,
-0.9321678, -0.1876846, -1.823535, 0.9372549, 1, 0, 1,
-0.9279338, -1.237393, -0.7489241, 0.9333333, 1, 0, 1,
-0.9251485, 0.4418281, 0.7668669, 0.9254902, 1, 0, 1,
-0.9214793, -0.7419152, -2.119385, 0.9215686, 1, 0, 1,
-0.9138919, 0.7426951, -0.431263, 0.9137255, 1, 0, 1,
-0.9136338, 0.2867582, -0.5042493, 0.9098039, 1, 0, 1,
-0.9099492, 1.490592, -1.322654, 0.9019608, 1, 0, 1,
-0.9085756, -1.521275, -2.068667, 0.8941177, 1, 0, 1,
-0.9060906, 0.4173036, -2.326266, 0.8901961, 1, 0, 1,
-0.9018562, 0.04967722, -1.570764, 0.8823529, 1, 0, 1,
-0.9008393, 0.3653416, -1.94552, 0.8784314, 1, 0, 1,
-0.8973024, 1.033876, 0.5775173, 0.8705882, 1, 0, 1,
-0.8970867, 1.145027, -0.4828231, 0.8666667, 1, 0, 1,
-0.8968525, -1.144242, -5.10447, 0.8588235, 1, 0, 1,
-0.8958704, -0.3730427, -0.4450722, 0.854902, 1, 0, 1,
-0.8940437, 1.694074, 0.110673, 0.8470588, 1, 0, 1,
-0.8914046, 0.1832334, -0.8591976, 0.8431373, 1, 0, 1,
-0.8883157, -1.344445, -4.022295, 0.8352941, 1, 0, 1,
-0.8854274, -1.343875, -2.00525, 0.8313726, 1, 0, 1,
-0.8834816, -1.7083, -2.881482, 0.8235294, 1, 0, 1,
-0.8827569, 0.1014223, -1.072283, 0.8196079, 1, 0, 1,
-0.8804743, 1.086413, 0.8403236, 0.8117647, 1, 0, 1,
-0.877242, 0.04740066, -2.852637, 0.8078431, 1, 0, 1,
-0.8747788, -0.5457406, -3.384997, 0.8, 1, 0, 1,
-0.8692122, -0.8310955, -1.499453, 0.7921569, 1, 0, 1,
-0.8684216, -0.4650217, -1.999766, 0.7882353, 1, 0, 1,
-0.8663342, -0.3578722, -2.437687, 0.7803922, 1, 0, 1,
-0.8660851, 0.1939905, -0.2150354, 0.7764706, 1, 0, 1,
-0.8610167, -0.5915754, -0.18317, 0.7686275, 1, 0, 1,
-0.8604586, 0.3946472, -1.613077, 0.7647059, 1, 0, 1,
-0.8575119, -1.020763, -3.374249, 0.7568628, 1, 0, 1,
-0.8421196, -2.194142, -3.813937, 0.7529412, 1, 0, 1,
-0.8405373, -0.6508864, -2.723409, 0.7450981, 1, 0, 1,
-0.8386285, 0.555739, 0.2359164, 0.7411765, 1, 0, 1,
-0.8379123, -0.8819764, -1.84006, 0.7333333, 1, 0, 1,
-0.8331422, -0.7437289, -2.326654, 0.7294118, 1, 0, 1,
-0.8311579, -1.26974, -4.486713, 0.7215686, 1, 0, 1,
-0.8268693, 1.640393, -0.3260498, 0.7176471, 1, 0, 1,
-0.8217802, -2.553179, -4.552931, 0.7098039, 1, 0, 1,
-0.8207305, -0.7230678, -3.904425, 0.7058824, 1, 0, 1,
-0.8141427, 0.439687, -0.5130838, 0.6980392, 1, 0, 1,
-0.8134271, 0.3036069, -0.5540647, 0.6901961, 1, 0, 1,
-0.8127817, 0.6558713, -0.9839883, 0.6862745, 1, 0, 1,
-0.8082269, -0.5684996, -1.225253, 0.6784314, 1, 0, 1,
-0.8078829, 0.242772, -2.43632, 0.6745098, 1, 0, 1,
-0.8059418, 0.50638, 0.821982, 0.6666667, 1, 0, 1,
-0.8046001, -1.490543, -5.438223, 0.6627451, 1, 0, 1,
-0.7985423, 0.01817929, -0.1204645, 0.654902, 1, 0, 1,
-0.7971335, 0.2283971, -1.027525, 0.6509804, 1, 0, 1,
-0.7886508, -0.9494554, -2.763216, 0.6431373, 1, 0, 1,
-0.782752, -0.7170505, -0.8582635, 0.6392157, 1, 0, 1,
-0.7775895, 0.6452047, -0.9478828, 0.6313726, 1, 0, 1,
-0.7712183, 1.326375, -1.392358, 0.627451, 1, 0, 1,
-0.7680365, -0.5277636, -2.941751, 0.6196079, 1, 0, 1,
-0.7678503, 1.417665, 1.064124, 0.6156863, 1, 0, 1,
-0.7644466, -0.9104083, -3.166771, 0.6078432, 1, 0, 1,
-0.7641047, 0.34467, -1.30241, 0.6039216, 1, 0, 1,
-0.756285, 0.6814745, -1.772534, 0.5960785, 1, 0, 1,
-0.7522472, -0.4228039, -2.065499, 0.5882353, 1, 0, 1,
-0.743806, 0.8857332, -0.5197157, 0.5843138, 1, 0, 1,
-0.7383717, 0.004094092, 2.116031, 0.5764706, 1, 0, 1,
-0.7374937, 0.5519629, -1.343417, 0.572549, 1, 0, 1,
-0.7337489, -0.7529145, -2.573466, 0.5647059, 1, 0, 1,
-0.7326599, 0.8636369, -0.9723404, 0.5607843, 1, 0, 1,
-0.7316637, -0.1802611, -0.9156703, 0.5529412, 1, 0, 1,
-0.7274431, -0.9784329, -2.071725, 0.5490196, 1, 0, 1,
-0.7248556, 0.2894341, -0.1511233, 0.5411765, 1, 0, 1,
-0.7234865, -0.371307, -2.600113, 0.5372549, 1, 0, 1,
-0.7184522, 0.8472123, 0.4319039, 0.5294118, 1, 0, 1,
-0.7139415, -0.1423195, -2.637695, 0.5254902, 1, 0, 1,
-0.7132924, 1.283813, -1.718806, 0.5176471, 1, 0, 1,
-0.7088545, 0.7060532, 0.1738864, 0.5137255, 1, 0, 1,
-0.7053481, 0.2441095, -0.4567082, 0.5058824, 1, 0, 1,
-0.7024748, 0.5774981, -0.7218679, 0.5019608, 1, 0, 1,
-0.6997023, -0.3149145, -2.521899, 0.4941176, 1, 0, 1,
-0.6942897, 0.1141908, -1.148633, 0.4862745, 1, 0, 1,
-0.69261, 0.1153057, -2.195121, 0.4823529, 1, 0, 1,
-0.6901064, -1.299982, -3.015263, 0.4745098, 1, 0, 1,
-0.6856942, 0.09816448, -0.9978342, 0.4705882, 1, 0, 1,
-0.6844516, 0.8498262, -0.3268186, 0.4627451, 1, 0, 1,
-0.678123, 0.3780023, -2.123928, 0.4588235, 1, 0, 1,
-0.6715809, 0.06480407, -0.7291486, 0.4509804, 1, 0, 1,
-0.6688149, -1.042887, -1.812906, 0.4470588, 1, 0, 1,
-0.6686354, 0.7381123, -2.412808, 0.4392157, 1, 0, 1,
-0.663861, 0.5218565, 0.08992004, 0.4352941, 1, 0, 1,
-0.6634043, -0.5485772, -1.308812, 0.427451, 1, 0, 1,
-0.6621467, 0.9082862, -0.879708, 0.4235294, 1, 0, 1,
-0.661271, -0.9501857, -2.405949, 0.4156863, 1, 0, 1,
-0.6595326, -0.8301836, -1.455897, 0.4117647, 1, 0, 1,
-0.6586456, 0.8037187, -1.498922, 0.4039216, 1, 0, 1,
-0.6578684, 1.669214, 1.454701, 0.3960784, 1, 0, 1,
-0.652639, 1.442515, -3.043204, 0.3921569, 1, 0, 1,
-0.6510822, -1.359697, -2.710207, 0.3843137, 1, 0, 1,
-0.6510014, -0.3354718, -1.313247, 0.3803922, 1, 0, 1,
-0.6447911, -0.1502027, -3.665209, 0.372549, 1, 0, 1,
-0.6446601, -1.112961, -1.035124, 0.3686275, 1, 0, 1,
-0.6415926, 0.894262, -1.504056, 0.3607843, 1, 0, 1,
-0.6411538, -0.2997806, -1.535423, 0.3568628, 1, 0, 1,
-0.6411418, 0.2529598, -1.404925, 0.3490196, 1, 0, 1,
-0.6373748, -1.421533, -3.542749, 0.345098, 1, 0, 1,
-0.6357434, -0.6940208, -3.89466, 0.3372549, 1, 0, 1,
-0.6354881, 0.2273966, -0.4363092, 0.3333333, 1, 0, 1,
-0.6297628, 0.1530006, -1.497205, 0.3254902, 1, 0, 1,
-0.6279085, 1.971894, 1.021892, 0.3215686, 1, 0, 1,
-0.6276516, 0.3510148, -2.462396, 0.3137255, 1, 0, 1,
-0.6096038, 0.6847662, -0.8299533, 0.3098039, 1, 0, 1,
-0.6094655, 0.008877738, -0.01675182, 0.3019608, 1, 0, 1,
-0.6034473, -0.8624486, -0.8602068, 0.2941177, 1, 0, 1,
-0.5956249, 0.1562771, -0.2649843, 0.2901961, 1, 0, 1,
-0.5949771, 1.316542, -0.006988334, 0.282353, 1, 0, 1,
-0.594057, -0.01630531, -0.6668478, 0.2784314, 1, 0, 1,
-0.5891148, -0.6547894, -1.600315, 0.2705882, 1, 0, 1,
-0.5873004, -0.50036, -2.519884, 0.2666667, 1, 0, 1,
-0.5798166, 0.2120148, -1.994819, 0.2588235, 1, 0, 1,
-0.5746831, 0.04358099, -0.3382554, 0.254902, 1, 0, 1,
-0.5741554, -0.8671125, -2.541645, 0.2470588, 1, 0, 1,
-0.5720248, -0.3745735, -2.794662, 0.2431373, 1, 0, 1,
-0.5714176, 0.9851265, -1.839866, 0.2352941, 1, 0, 1,
-0.5713679, -0.1753959, -1.080145, 0.2313726, 1, 0, 1,
-0.570678, 0.06347745, -0.05834896, 0.2235294, 1, 0, 1,
-0.5694894, 1.684448, -1.067965, 0.2196078, 1, 0, 1,
-0.568661, 1.51713, -0.8330815, 0.2117647, 1, 0, 1,
-0.5686378, -0.6150732, -2.411436, 0.2078431, 1, 0, 1,
-0.56244, 2.105187, -0.1310779, 0.2, 1, 0, 1,
-0.5575946, 0.5545645, -0.241026, 0.1921569, 1, 0, 1,
-0.5519905, 0.8533059, -0.476166, 0.1882353, 1, 0, 1,
-0.5509016, 1.625776, 1.138022, 0.1803922, 1, 0, 1,
-0.549823, 0.4322259, -2.319993, 0.1764706, 1, 0, 1,
-0.5472506, -1.050113, -3.364486, 0.1686275, 1, 0, 1,
-0.5428578, -0.1959156, -0.7443119, 0.1647059, 1, 0, 1,
-0.5426931, 0.8769237, -1.438378, 0.1568628, 1, 0, 1,
-0.5376365, 1.227337, -1.28794, 0.1529412, 1, 0, 1,
-0.5358058, -0.7162291, -1.356972, 0.145098, 1, 0, 1,
-0.5335058, -0.5502762, -3.181037, 0.1411765, 1, 0, 1,
-0.5311533, 0.7658506, -0.6735309, 0.1333333, 1, 0, 1,
-0.5288904, 0.2961777, -0.6220286, 0.1294118, 1, 0, 1,
-0.51592, -0.8358362, -1.942535, 0.1215686, 1, 0, 1,
-0.507564, -1.796978, -0.4451604, 0.1176471, 1, 0, 1,
-0.5074744, -1.899225, -4.108681, 0.1098039, 1, 0, 1,
-0.4960742, 0.5929016, -1.127158, 0.1058824, 1, 0, 1,
-0.4925528, -0.6408815, -1.401031, 0.09803922, 1, 0, 1,
-0.4919383, -0.03983733, -1.148093, 0.09019608, 1, 0, 1,
-0.4911343, -0.4018724, -1.994317, 0.08627451, 1, 0, 1,
-0.4890578, -1.214869, -2.336105, 0.07843138, 1, 0, 1,
-0.4887927, 1.300222, 0.7851614, 0.07450981, 1, 0, 1,
-0.4835694, -0.6964644, -1.584572, 0.06666667, 1, 0, 1,
-0.4831182, 0.7625323, 0.9827136, 0.0627451, 1, 0, 1,
-0.4813626, 0.2414535, -1.780239, 0.05490196, 1, 0, 1,
-0.4810893, -0.6211002, -3.879591, 0.05098039, 1, 0, 1,
-0.4810452, -1.508724, -3.039616, 0.04313726, 1, 0, 1,
-0.4773457, 0.2237406, -2.312754, 0.03921569, 1, 0, 1,
-0.4759773, -0.3570061, -1.782021, 0.03137255, 1, 0, 1,
-0.4749335, 1.443614, -0.2053522, 0.02745098, 1, 0, 1,
-0.473302, -0.5833263, -1.905038, 0.01960784, 1, 0, 1,
-0.4728028, 1.256692, -0.429484, 0.01568628, 1, 0, 1,
-0.4710178, -1.517518, -3.563707, 0.007843138, 1, 0, 1,
-0.4705007, -1.364946, -3.775127, 0.003921569, 1, 0, 1,
-0.4700149, 1.048887, -0.06214251, 0, 1, 0.003921569, 1,
-0.4618061, 1.975301, 0.5987179, 0, 1, 0.01176471, 1,
-0.4591744, -0.4126921, -3.517315, 0, 1, 0.01568628, 1,
-0.4568606, 0.2864576, -0.5664272, 0, 1, 0.02352941, 1,
-0.4568215, 1.4163, 1.321048, 0, 1, 0.02745098, 1,
-0.4559397, -0.4469568, -4.628681, 0, 1, 0.03529412, 1,
-0.4540624, 0.9379743, 0.6411818, 0, 1, 0.03921569, 1,
-0.4520055, -0.5164917, -4.441935, 0, 1, 0.04705882, 1,
-0.4511636, -0.6546835, -1.44329, 0, 1, 0.05098039, 1,
-0.4510208, 0.5050378, 0.7254958, 0, 1, 0.05882353, 1,
-0.4503409, 0.4369545, 0.631483, 0, 1, 0.0627451, 1,
-0.4500816, -1.199744, -4.23599, 0, 1, 0.07058824, 1,
-0.4497128, -0.09559868, -3.26913, 0, 1, 0.07450981, 1,
-0.4470673, -1.040645, -3.716393, 0, 1, 0.08235294, 1,
-0.4467791, -1.125016, -3.560097, 0, 1, 0.08627451, 1,
-0.4422818, -1.403747, -3.466705, 0, 1, 0.09411765, 1,
-0.4397273, -0.9008651, -4.506242, 0, 1, 0.1019608, 1,
-0.4377417, -0.06105474, -2.181864, 0, 1, 0.1058824, 1,
-0.4321582, -0.2273582, -1.074858, 0, 1, 0.1137255, 1,
-0.4303805, -0.4146166, -2.757886, 0, 1, 0.1176471, 1,
-0.4294041, 0.8511267, 0.2705165, 0, 1, 0.1254902, 1,
-0.4287359, 0.5534437, -0.4569559, 0, 1, 0.1294118, 1,
-0.4280199, 2.419995, -1.321128, 0, 1, 0.1372549, 1,
-0.4268387, -1.607644, -1.993762, 0, 1, 0.1411765, 1,
-0.4266118, -1.135572, -1.940346, 0, 1, 0.1490196, 1,
-0.4240263, -0.8245464, -2.471517, 0, 1, 0.1529412, 1,
-0.4207971, 1.554231, 0.9550492, 0, 1, 0.1607843, 1,
-0.4204127, 0.2098477, -0.8883111, 0, 1, 0.1647059, 1,
-0.4118507, 0.1394639, -0.2522689, 0, 1, 0.172549, 1,
-0.4079842, 0.9094736, 0.2574017, 0, 1, 0.1764706, 1,
-0.4066424, -0.254945, -2.476905, 0, 1, 0.1843137, 1,
-0.402785, 1.721941, -0.919907, 0, 1, 0.1882353, 1,
-0.4005148, 0.8999712, 1.128685, 0, 1, 0.1960784, 1,
-0.3941535, 0.2138518, 0.9250777, 0, 1, 0.2039216, 1,
-0.3908686, 0.637996, -0.09417853, 0, 1, 0.2078431, 1,
-0.3800861, -0.7016969, -3.729588, 0, 1, 0.2156863, 1,
-0.3792628, -0.7453446, -2.255065, 0, 1, 0.2196078, 1,
-0.3782818, 0.7917395, -0.5318993, 0, 1, 0.227451, 1,
-0.3771259, 0.06252827, -1.062608, 0, 1, 0.2313726, 1,
-0.3737299, 1.048084, -0.7106784, 0, 1, 0.2392157, 1,
-0.3680897, -0.1212783, -1.951206, 0, 1, 0.2431373, 1,
-0.3676496, 0.3162704, -2.071966, 0, 1, 0.2509804, 1,
-0.3663541, -0.5124086, -3.589321, 0, 1, 0.254902, 1,
-0.3660255, 1.259943, 0.5479417, 0, 1, 0.2627451, 1,
-0.3655582, -0.4202271, -1.849224, 0, 1, 0.2666667, 1,
-0.3543567, -0.1092384, -2.574268, 0, 1, 0.2745098, 1,
-0.351327, 0.06895448, -1.757191, 0, 1, 0.2784314, 1,
-0.3496571, -0.5882339, -2.83048, 0, 1, 0.2862745, 1,
-0.3485445, 0.4446941, -0.6044956, 0, 1, 0.2901961, 1,
-0.3414063, 0.5480124, 1.347313, 0, 1, 0.2980392, 1,
-0.3413893, 0.5635373, 1.127842, 0, 1, 0.3058824, 1,
-0.3407041, 0.1662031, -1.110546, 0, 1, 0.3098039, 1,
-0.3354821, -0.3789458, -2.4245, 0, 1, 0.3176471, 1,
-0.3353397, 0.09399518, -0.1287131, 0, 1, 0.3215686, 1,
-0.3335138, -0.2293301, -2.552666, 0, 1, 0.3294118, 1,
-0.3300437, 0.4362108, -2.218048, 0, 1, 0.3333333, 1,
-0.3294992, -0.748882, -2.943652, 0, 1, 0.3411765, 1,
-0.3289025, -0.5189841, -2.469085, 0, 1, 0.345098, 1,
-0.3283044, -1.167347, -2.061474, 0, 1, 0.3529412, 1,
-0.3281993, 0.6348718, -0.5418926, 0, 1, 0.3568628, 1,
-0.3272805, -0.9988111, -2.424385, 0, 1, 0.3647059, 1,
-0.3159351, 1.396853, -1.752102, 0, 1, 0.3686275, 1,
-0.315847, -0.1075195, -1.603818, 0, 1, 0.3764706, 1,
-0.3144361, 1.301178, 1.231081, 0, 1, 0.3803922, 1,
-0.3099034, -1.058283, -2.321715, 0, 1, 0.3882353, 1,
-0.306391, 1.093422, -0.1221891, 0, 1, 0.3921569, 1,
-0.3054296, 0.03488862, -0.683813, 0, 1, 0.4, 1,
-0.3035121, -0.1382425, -1.317221, 0, 1, 0.4078431, 1,
-0.2996429, -0.3918984, -2.228697, 0, 1, 0.4117647, 1,
-0.2935955, -0.3235349, -2.56447, 0, 1, 0.4196078, 1,
-0.2910517, 1.136677, 0.9678951, 0, 1, 0.4235294, 1,
-0.2909881, 0.4058184, -1.421914, 0, 1, 0.4313726, 1,
-0.2902667, 0.4699261, 0.9744883, 0, 1, 0.4352941, 1,
-0.2870346, -0.5010025, -2.758309, 0, 1, 0.4431373, 1,
-0.2851843, -0.04042277, -0.1227518, 0, 1, 0.4470588, 1,
-0.2769007, -0.4434247, -1.379019, 0, 1, 0.454902, 1,
-0.2768137, 1.15414, -0.5669081, 0, 1, 0.4588235, 1,
-0.2729471, 1.279893, -0.7769219, 0, 1, 0.4666667, 1,
-0.2719514, -0.6878374, -0.7063728, 0, 1, 0.4705882, 1,
-0.2669036, 0.05929343, -0.4723342, 0, 1, 0.4784314, 1,
-0.2631267, -0.01894919, -1.927537, 0, 1, 0.4823529, 1,
-0.2563983, -0.6329187, -2.923032, 0, 1, 0.4901961, 1,
-0.25431, 0.3216651, -0.03974903, 0, 1, 0.4941176, 1,
-0.250881, -1.763052, -3.597905, 0, 1, 0.5019608, 1,
-0.2500866, -0.9748399, -2.292371, 0, 1, 0.509804, 1,
-0.2497571, -0.1700857, -1.079941, 0, 1, 0.5137255, 1,
-0.2459733, -0.6549796, -3.77505, 0, 1, 0.5215687, 1,
-0.2445131, 0.1915581, -0.3827141, 0, 1, 0.5254902, 1,
-0.232883, -0.04769512, -2.527673, 0, 1, 0.5333334, 1,
-0.2273305, -0.4398203, -3.557865, 0, 1, 0.5372549, 1,
-0.2221567, -0.7636096, -0.3304393, 0, 1, 0.5450981, 1,
-0.2196472, -0.9913409, -3.417303, 0, 1, 0.5490196, 1,
-0.2182651, 1.790965, -2.950274, 0, 1, 0.5568628, 1,
-0.2178486, 0.01493834, 0.1845737, 0, 1, 0.5607843, 1,
-0.2132692, -0.3380605, -1.69121, 0, 1, 0.5686275, 1,
-0.2113365, 1.111418, -1.755219, 0, 1, 0.572549, 1,
-0.2108682, -0.8217861, -3.891221, 0, 1, 0.5803922, 1,
-0.2076647, -1.28359, -2.120722, 0, 1, 0.5843138, 1,
-0.2032892, 2.691071, -1.803172, 0, 1, 0.5921569, 1,
-0.2032747, -0.260585, -1.697448, 0, 1, 0.5960785, 1,
-0.1960668, 1.058657, -0.4580792, 0, 1, 0.6039216, 1,
-0.1957896, -1.555438, -2.452116, 0, 1, 0.6117647, 1,
-0.1956053, 0.9000682, -1.890566, 0, 1, 0.6156863, 1,
-0.1944303, -1.230268, -2.953801, 0, 1, 0.6235294, 1,
-0.1907315, -0.2276373, -3.733877, 0, 1, 0.627451, 1,
-0.189391, 1.547966, -0.9286473, 0, 1, 0.6352941, 1,
-0.1873804, 1.685432, 0.04608656, 0, 1, 0.6392157, 1,
-0.1865695, -0.2962913, -3.904634, 0, 1, 0.6470588, 1,
-0.1822173, 0.7907013, -0.316574, 0, 1, 0.6509804, 1,
-0.181375, -0.3282373, -3.530243, 0, 1, 0.6588235, 1,
-0.1801687, -0.6307002, -0.2751102, 0, 1, 0.6627451, 1,
-0.1720359, 0.2814161, -0.9155174, 0, 1, 0.6705883, 1,
-0.1698144, -0.6367915, -4.289074, 0, 1, 0.6745098, 1,
-0.1688468, -1.08654, -3.26258, 0, 1, 0.682353, 1,
-0.1662501, -0.6367633, -4.435326, 0, 1, 0.6862745, 1,
-0.1656035, 1.119645, -0.105724, 0, 1, 0.6941177, 1,
-0.1654135, -0.2577061, -3.126668, 0, 1, 0.7019608, 1,
-0.1574267, 0.01957824, -1.7766, 0, 1, 0.7058824, 1,
-0.1567243, 0.4556706, 0.03864044, 0, 1, 0.7137255, 1,
-0.1516235, 0.1410217, 0.4749958, 0, 1, 0.7176471, 1,
-0.1501361, 0.1284588, -0.7374517, 0, 1, 0.7254902, 1,
-0.1469318, -3.171346, -5.857179, 0, 1, 0.7294118, 1,
-0.1459314, 0.005133601, -1.929308, 0, 1, 0.7372549, 1,
-0.1407901, 1.645511, 0.2008579, 0, 1, 0.7411765, 1,
-0.1358072, 0.7156649, -0.7081144, 0, 1, 0.7490196, 1,
-0.1324218, 0.07240183, -0.3610292, 0, 1, 0.7529412, 1,
-0.1316032, -1.724548, -2.300916, 0, 1, 0.7607843, 1,
-0.1279249, 0.02118889, -3.97161, 0, 1, 0.7647059, 1,
-0.1272825, 0.5723459, 0.1709001, 0, 1, 0.772549, 1,
-0.1271661, 0.7964252, -0.4613557, 0, 1, 0.7764706, 1,
-0.1221397, 1.126729, 0.5615956, 0, 1, 0.7843137, 1,
-0.1220725, -1.51645, -2.838202, 0, 1, 0.7882353, 1,
-0.1127388, -0.8737261, -4.026283, 0, 1, 0.7960784, 1,
-0.1113883, 0.6674098, 1.39795, 0, 1, 0.8039216, 1,
-0.1050685, -1.380947, -3.828851, 0, 1, 0.8078431, 1,
-0.09742467, -1.638679, -2.786346, 0, 1, 0.8156863, 1,
-0.09689808, -1.67707, -2.004209, 0, 1, 0.8196079, 1,
-0.09254798, 0.3609636, -0.9244736, 0, 1, 0.827451, 1,
-0.09200215, -0.901776, -2.370949, 0, 1, 0.8313726, 1,
-0.08964868, -0.6783456, -1.727693, 0, 1, 0.8392157, 1,
-0.0893122, 0.4309918, 1.738528, 0, 1, 0.8431373, 1,
-0.08737206, -0.1472452, -2.794454, 0, 1, 0.8509804, 1,
-0.08732357, 0.5362148, 0.593631, 0, 1, 0.854902, 1,
-0.08670218, 1.102946, 0.3998383, 0, 1, 0.8627451, 1,
-0.08491001, 0.5360038, -1.796091, 0, 1, 0.8666667, 1,
-0.07960868, 0.1584539, -1.275953, 0, 1, 0.8745098, 1,
-0.07747417, 2.112087, 1.52252, 0, 1, 0.8784314, 1,
-0.077299, -0.3318845, -1.981148, 0, 1, 0.8862745, 1,
-0.06618243, -0.3423245, -2.702146, 0, 1, 0.8901961, 1,
-0.06601709, 1.116858, 0.3223564, 0, 1, 0.8980392, 1,
-0.06567567, -1.629687, -3.51943, 0, 1, 0.9058824, 1,
-0.06343455, 0.2418622, -1.394201, 0, 1, 0.9098039, 1,
-0.0624986, -2.255471, -2.861919, 0, 1, 0.9176471, 1,
-0.05926238, -1.974335, -4.446073, 0, 1, 0.9215686, 1,
-0.0543895, -0.1092516, -2.731341, 0, 1, 0.9294118, 1,
-0.05353197, 0.9211519, -0.5925646, 0, 1, 0.9333333, 1,
-0.0532306, 0.363925, -0.4211776, 0, 1, 0.9411765, 1,
-0.05296164, 1.027631, 0.4435723, 0, 1, 0.945098, 1,
-0.05226528, 0.530322, 0.1754812, 0, 1, 0.9529412, 1,
-0.05081417, 0.1494977, -0.3983214, 0, 1, 0.9568627, 1,
-0.04961861, -0.3499492, -3.428385, 0, 1, 0.9647059, 1,
-0.04927303, -0.885334, -2.030097, 0, 1, 0.9686275, 1,
-0.04652636, -0.2464551, -1.928595, 0, 1, 0.9764706, 1,
-0.04148722, -0.5165534, -3.257182, 0, 1, 0.9803922, 1,
-0.03588935, -0.2846347, -3.65695, 0, 1, 0.9882353, 1,
-0.03199003, -0.3196433, -2.196384, 0, 1, 0.9921569, 1,
-0.02741039, -1.16692, -3.069921, 0, 1, 1, 1,
-0.02247651, 0.798625, -0.1454206, 0, 0.9921569, 1, 1,
-0.02088309, -0.361339, -3.134563, 0, 0.9882353, 1, 1,
-0.008383215, -0.8472666, -2.778697, 0, 0.9803922, 1, 1,
-0.006776388, -0.1086237, -3.533484, 0, 0.9764706, 1, 1,
-0.004485518, -0.8769664, -3.719815, 0, 0.9686275, 1, 1,
-0.004348855, 0.7434913, -0.597909, 0, 0.9647059, 1, 1,
-0.003102983, -0.3406708, -4.854953, 0, 0.9568627, 1, 1,
-0.002591598, 1.493632, 0.2056693, 0, 0.9529412, 1, 1,
-0.001415373, 0.04373189, 1.050978, 0, 0.945098, 1, 1,
-0.001332696, 1.688368, 0.6583456, 0, 0.9411765, 1, 1,
0.003517215, 0.5159529, -0.7718658, 0, 0.9333333, 1, 1,
0.007361805, 1.294643, -0.5328101, 0, 0.9294118, 1, 1,
0.009166883, -0.5980741, 3.702215, 0, 0.9215686, 1, 1,
0.009427474, -0.8509367, 4.0604, 0, 0.9176471, 1, 1,
0.01096621, 1.218397, 0.3460959, 0, 0.9098039, 1, 1,
0.01266559, -1.542134, 3.382956, 0, 0.9058824, 1, 1,
0.01273882, -2.774241, 3.950101, 0, 0.8980392, 1, 1,
0.01786193, 0.8313329, 0.6144642, 0, 0.8901961, 1, 1,
0.01981118, -0.8644503, 4.977123, 0, 0.8862745, 1, 1,
0.02162929, 0.488167, 1.200803, 0, 0.8784314, 1, 1,
0.02577251, -0.9915453, 2.573695, 0, 0.8745098, 1, 1,
0.03912279, 0.7258952, 1.258157, 0, 0.8666667, 1, 1,
0.04165324, 0.2882083, 0.1617655, 0, 0.8627451, 1, 1,
0.04594515, -1.332766, 3.582157, 0, 0.854902, 1, 1,
0.05153283, -1.135391, 3.5055, 0, 0.8509804, 1, 1,
0.05195197, -0.2628664, 1.359568, 0, 0.8431373, 1, 1,
0.05215475, -0.3034663, 1.577184, 0, 0.8392157, 1, 1,
0.05290163, -0.8719819, 3.143452, 0, 0.8313726, 1, 1,
0.05468722, -1.333637, 2.731112, 0, 0.827451, 1, 1,
0.05563591, -1.857047, 4.777023, 0, 0.8196079, 1, 1,
0.05767915, 0.9802046, -0.7397755, 0, 0.8156863, 1, 1,
0.06444483, -0.5970468, 2.949539, 0, 0.8078431, 1, 1,
0.06487054, -0.2938446, 3.673012, 0, 0.8039216, 1, 1,
0.06669561, -0.5305585, 3.642803, 0, 0.7960784, 1, 1,
0.06861802, 1.070451, -2.353227, 0, 0.7882353, 1, 1,
0.07067163, -0.2371713, 3.390366, 0, 0.7843137, 1, 1,
0.08209593, 0.2710056, 1.952308, 0, 0.7764706, 1, 1,
0.08291335, 0.009692173, 2.605111, 0, 0.772549, 1, 1,
0.08403554, -0.2259997, 4.37702, 0, 0.7647059, 1, 1,
0.08796895, 0.538868, 0.6772156, 0, 0.7607843, 1, 1,
0.08803119, -0.06727049, 3.688777, 0, 0.7529412, 1, 1,
0.08923553, -0.1813183, 2.700587, 0, 0.7490196, 1, 1,
0.09536955, -0.4148186, 4.140064, 0, 0.7411765, 1, 1,
0.09680638, -1.738174, 4.032054, 0, 0.7372549, 1, 1,
0.09706858, -0.4368248, 4.134096, 0, 0.7294118, 1, 1,
0.09862351, -2.536416, 3.057978, 0, 0.7254902, 1, 1,
0.102484, -0.02602504, 0.3826631, 0, 0.7176471, 1, 1,
0.104116, 0.02339231, -0.002795437, 0, 0.7137255, 1, 1,
0.1049072, -0.4090366, 2.684319, 0, 0.7058824, 1, 1,
0.1070788, -0.7642002, 2.275772, 0, 0.6980392, 1, 1,
0.1103744, -1.517328, 3.328467, 0, 0.6941177, 1, 1,
0.1140416, 0.6512473, 0.6191044, 0, 0.6862745, 1, 1,
0.1156195, 0.09034765, -0.04821843, 0, 0.682353, 1, 1,
0.1215367, -1.822582, 4.500137, 0, 0.6745098, 1, 1,
0.1349519, 0.5242465, 1.469187, 0, 0.6705883, 1, 1,
0.1352042, -2.402779, 5.137815, 0, 0.6627451, 1, 1,
0.1386067, 0.5072018, 0.3361617, 0, 0.6588235, 1, 1,
0.1388286, 0.5317247, 0.9718225, 0, 0.6509804, 1, 1,
0.1409666, -0.004251065, 0.245617, 0, 0.6470588, 1, 1,
0.1457845, -0.4654329, 4.453827, 0, 0.6392157, 1, 1,
0.1479738, 0.515757, 0.5026236, 0, 0.6352941, 1, 1,
0.1485065, 0.2416053, -0.5080692, 0, 0.627451, 1, 1,
0.1494234, -0.07275195, 2.039471, 0, 0.6235294, 1, 1,
0.1494731, 0.5208113, 1.592768, 0, 0.6156863, 1, 1,
0.1519904, -0.5825481, 3.087593, 0, 0.6117647, 1, 1,
0.1555105, 0.6004685, 0.3394557, 0, 0.6039216, 1, 1,
0.1557078, -0.6628598, 3.07517, 0, 0.5960785, 1, 1,
0.1597445, 1.300081, 0.3467917, 0, 0.5921569, 1, 1,
0.1617944, 0.844539, -0.4064503, 0, 0.5843138, 1, 1,
0.1622298, 0.6150874, 0.2622105, 0, 0.5803922, 1, 1,
0.1624257, -0.115766, 2.969126, 0, 0.572549, 1, 1,
0.168472, -1.261826, 3.696076, 0, 0.5686275, 1, 1,
0.1712028, -0.5940933, 3.046409, 0, 0.5607843, 1, 1,
0.1765168, -0.3392857, 1.381185, 0, 0.5568628, 1, 1,
0.1768495, 0.2271567, 0.3097532, 0, 0.5490196, 1, 1,
0.1813653, 1.269789, -1.888687, 0, 0.5450981, 1, 1,
0.1823105, -1.600614, 2.884782, 0, 0.5372549, 1, 1,
0.1836581, 0.6018454, 1.458504, 0, 0.5333334, 1, 1,
0.1847481, 0.8112483, -0.02473676, 0, 0.5254902, 1, 1,
0.1858744, -0.1009777, 2.161572, 0, 0.5215687, 1, 1,
0.1867087, 0.01395203, 1.759837, 0, 0.5137255, 1, 1,
0.187699, -0.6745, 1.610541, 0, 0.509804, 1, 1,
0.1878476, 1.315486, 0.9785089, 0, 0.5019608, 1, 1,
0.189447, -0.2315892, 1.32444, 0, 0.4941176, 1, 1,
0.1906236, -1.427013, 5.399238, 0, 0.4901961, 1, 1,
0.1910897, -0.4772465, 3.55109, 0, 0.4823529, 1, 1,
0.1922976, -0.05280866, 0.7996215, 0, 0.4784314, 1, 1,
0.1955767, -0.5487825, 3.567334, 0, 0.4705882, 1, 1,
0.1963655, -0.5599883, 3.738177, 0, 0.4666667, 1, 1,
0.1990852, -0.6888086, 2.988726, 0, 0.4588235, 1, 1,
0.204801, 0.8092642, 1.100207, 0, 0.454902, 1, 1,
0.2051111, 0.2481473, -0.3440839, 0, 0.4470588, 1, 1,
0.2057767, -1.535968, 3.156757, 0, 0.4431373, 1, 1,
0.2072824, -0.1588454, 1.906082, 0, 0.4352941, 1, 1,
0.2075141, -1.755051, 2.719485, 0, 0.4313726, 1, 1,
0.2075288, 2.633589, -1.340779, 0, 0.4235294, 1, 1,
0.2262332, 1.772417, 1.477746, 0, 0.4196078, 1, 1,
0.226255, 0.9387956, -1.258341, 0, 0.4117647, 1, 1,
0.226299, -1.966675, 3.00674, 0, 0.4078431, 1, 1,
0.2265606, -1.312204, 3.895807, 0, 0.4, 1, 1,
0.2409843, 0.3821084, 1.945977, 0, 0.3921569, 1, 1,
0.243361, -0.239724, 2.186769, 0, 0.3882353, 1, 1,
0.2446925, 0.00236559, 2.479931, 0, 0.3803922, 1, 1,
0.2490868, 0.4907326, -0.5109639, 0, 0.3764706, 1, 1,
0.2507443, -1.203856, 1.720414, 0, 0.3686275, 1, 1,
0.2520333, 1.568071, -1.39657, 0, 0.3647059, 1, 1,
0.254563, 1.030938, 0.001499001, 0, 0.3568628, 1, 1,
0.2572791, -0.8343047, 0.6831216, 0, 0.3529412, 1, 1,
0.2575355, -0.3735652, 2.936877, 0, 0.345098, 1, 1,
0.2585818, 1.414, 1.592927, 0, 0.3411765, 1, 1,
0.2587088, 0.2258817, 0.6456592, 0, 0.3333333, 1, 1,
0.2594869, -2.482344, 2.992481, 0, 0.3294118, 1, 1,
0.2632397, 1.001701, 2.632679, 0, 0.3215686, 1, 1,
0.2674179, -1.810691, 2.415881, 0, 0.3176471, 1, 1,
0.2713628, -1.194946, 2.731416, 0, 0.3098039, 1, 1,
0.2717435, 0.8122885, -0.1817401, 0, 0.3058824, 1, 1,
0.2739525, -0.3128676, 2.467084, 0, 0.2980392, 1, 1,
0.2749065, -0.244126, 1.643467, 0, 0.2901961, 1, 1,
0.2758446, 0.8760467, 1.296373, 0, 0.2862745, 1, 1,
0.280765, -2.359635, 3.752698, 0, 0.2784314, 1, 1,
0.2811798, 0.9093305, -0.009071873, 0, 0.2745098, 1, 1,
0.2861103, 0.5300508, 0.1537758, 0, 0.2666667, 1, 1,
0.2865843, -0.7901427, 3.051599, 0, 0.2627451, 1, 1,
0.2967577, -0.7199616, 2.159129, 0, 0.254902, 1, 1,
0.300946, 0.9095427, 0.0467831, 0, 0.2509804, 1, 1,
0.3022889, 1.769354, -0.6200026, 0, 0.2431373, 1, 1,
0.3049265, -1.054893, 2.566407, 0, 0.2392157, 1, 1,
0.3139196, 0.5467462, 0.3523083, 0, 0.2313726, 1, 1,
0.3216653, 0.9813287, 0.4786921, 0, 0.227451, 1, 1,
0.3248807, -0.1292945, 0.9896922, 0, 0.2196078, 1, 1,
0.3273344, -0.4503704, 1.47509, 0, 0.2156863, 1, 1,
0.3293541, 1.407928, 0.1252419, 0, 0.2078431, 1, 1,
0.3295048, -1.215294, 2.491181, 0, 0.2039216, 1, 1,
0.3322049, -0.6151578, 2.714818, 0, 0.1960784, 1, 1,
0.3464557, 0.7633003, 1.099049, 0, 0.1882353, 1, 1,
0.347269, 0.1392187, 3.072239, 0, 0.1843137, 1, 1,
0.3474179, -0.4371412, 1.332764, 0, 0.1764706, 1, 1,
0.3495212, -0.6517749, 2.6669, 0, 0.172549, 1, 1,
0.3509074, 0.2852516, -0.01921695, 0, 0.1647059, 1, 1,
0.3511965, 0.06614897, 1.212277, 0, 0.1607843, 1, 1,
0.354341, -0.2208899, 3.001299, 0, 0.1529412, 1, 1,
0.3547313, 0.1277292, 3.501203, 0, 0.1490196, 1, 1,
0.3617477, 0.3054004, 0.5259069, 0, 0.1411765, 1, 1,
0.362668, 0.3235383, 2.406401, 0, 0.1372549, 1, 1,
0.3654811, -0.7185587, 2.301704, 0, 0.1294118, 1, 1,
0.3679831, 0.5065102, -0.4097195, 0, 0.1254902, 1, 1,
0.3680075, -0.6032776, 1.616306, 0, 0.1176471, 1, 1,
0.3708963, -0.1021465, -0.2799616, 0, 0.1137255, 1, 1,
0.3722519, -0.9196094, 3.592606, 0, 0.1058824, 1, 1,
0.3759551, -1.267271, 4.455132, 0, 0.09803922, 1, 1,
0.37827, -1.47023, 3.862193, 0, 0.09411765, 1, 1,
0.3794928, -0.01574926, 1.779067, 0, 0.08627451, 1, 1,
0.3802323, 0.6507534, 1.052843, 0, 0.08235294, 1, 1,
0.3846318, -0.8827772, 1.609646, 0, 0.07450981, 1, 1,
0.3862992, 0.7005121, 3.706505, 0, 0.07058824, 1, 1,
0.3885173, 0.689719, -0.5862214, 0, 0.0627451, 1, 1,
0.3894017, -0.4298791, 3.565473, 0, 0.05882353, 1, 1,
0.3918642, -0.970954, 2.235677, 0, 0.05098039, 1, 1,
0.3980946, 1.011978, -0.3898439, 0, 0.04705882, 1, 1,
0.4003368, 1.426556, -0.1115968, 0, 0.03921569, 1, 1,
0.4014159, 0.4500644, -0.4339522, 0, 0.03529412, 1, 1,
0.4016928, -0.6133119, 2.739453, 0, 0.02745098, 1, 1,
0.4055071, 0.2331748, 1.316582, 0, 0.02352941, 1, 1,
0.4069063, 0.008856443, 1.596441, 0, 0.01568628, 1, 1,
0.4100624, -0.656233, 2.694746, 0, 0.01176471, 1, 1,
0.4133489, -0.1786145, 1.352078, 0, 0.003921569, 1, 1,
0.4134145, 0.8871216, 0.3659241, 0.003921569, 0, 1, 1,
0.4164447, -0.08385813, 1.924532, 0.007843138, 0, 1, 1,
0.417858, 1.503035, 0.1727871, 0.01568628, 0, 1, 1,
0.4199367, -0.6649662, 1.399241, 0.01960784, 0, 1, 1,
0.4200384, -1.037827, 3.54271, 0.02745098, 0, 1, 1,
0.4207112, 2.336772, -0.4459457, 0.03137255, 0, 1, 1,
0.4289697, 0.9750394, -0.7888309, 0.03921569, 0, 1, 1,
0.4327035, 1.944249, 0.9210603, 0.04313726, 0, 1, 1,
0.4333695, 0.8711782, 0.5772398, 0.05098039, 0, 1, 1,
0.4347734, 0.008196316, 3.453586, 0.05490196, 0, 1, 1,
0.4360259, -0.7769337, 1.276674, 0.0627451, 0, 1, 1,
0.4411974, -0.3317167, 1.452647, 0.06666667, 0, 1, 1,
0.443972, 0.5717673, 1.677917, 0.07450981, 0, 1, 1,
0.4443076, 0.6819558, 1.280531, 0.07843138, 0, 1, 1,
0.4478065, 0.4811413, 1.339584, 0.08627451, 0, 1, 1,
0.448088, 0.2390647, 2.15714, 0.09019608, 0, 1, 1,
0.4519753, -1.123186, 4.558057, 0.09803922, 0, 1, 1,
0.4525146, -1.782157, 2.030695, 0.1058824, 0, 1, 1,
0.457592, -1.187529, 0.5343575, 0.1098039, 0, 1, 1,
0.4624658, 0.4598013, -0.6612178, 0.1176471, 0, 1, 1,
0.4649503, 0.7799664, 1.113688, 0.1215686, 0, 1, 1,
0.4659556, -0.4156419, 2.645746, 0.1294118, 0, 1, 1,
0.4714746, -0.1797287, 2.936911, 0.1333333, 0, 1, 1,
0.4725286, -1.91216, 3.217805, 0.1411765, 0, 1, 1,
0.4731776, 1.478549, -0.205508, 0.145098, 0, 1, 1,
0.4733928, -0.2103277, 1.038054, 0.1529412, 0, 1, 1,
0.4785471, 0.4496939, 2.09941, 0.1568628, 0, 1, 1,
0.4819173, -0.3762494, -0.5942156, 0.1647059, 0, 1, 1,
0.4819401, 0.5206472, -0.5828716, 0.1686275, 0, 1, 1,
0.5024694, -1.335931, 3.472244, 0.1764706, 0, 1, 1,
0.5038748, -0.2523463, 4.16614, 0.1803922, 0, 1, 1,
0.5073666, -0.8371281, 2.503491, 0.1882353, 0, 1, 1,
0.5077626, -1.376902, 2.196592, 0.1921569, 0, 1, 1,
0.5192925, -0.06430153, 2.19841, 0.2, 0, 1, 1,
0.5224286, -1.780794, 2.925907, 0.2078431, 0, 1, 1,
0.5245783, -0.4472845, 3.039074, 0.2117647, 0, 1, 1,
0.5254167, -0.5410886, 2.595421, 0.2196078, 0, 1, 1,
0.5259432, -1.937289, 2.637783, 0.2235294, 0, 1, 1,
0.5283672, 1.100083, -0.2891079, 0.2313726, 0, 1, 1,
0.5285321, 0.5411271, 2.158773, 0.2352941, 0, 1, 1,
0.5305378, 0.7148443, 0.5355098, 0.2431373, 0, 1, 1,
0.5317316, -0.3019851, 2.70223, 0.2470588, 0, 1, 1,
0.5329337, 1.433132, 0.8223496, 0.254902, 0, 1, 1,
0.5373433, 0.007774898, -0.04604658, 0.2588235, 0, 1, 1,
0.5373951, 0.03860772, 1.917343, 0.2666667, 0, 1, 1,
0.5423837, 0.2466217, 1.876294, 0.2705882, 0, 1, 1,
0.5510257, 0.01570037, 1.684907, 0.2784314, 0, 1, 1,
0.5707212, 1.118531, 1.354662, 0.282353, 0, 1, 1,
0.5709054, 0.8411025, -1.292347, 0.2901961, 0, 1, 1,
0.5712487, 0.9068261, 0.3774364, 0.2941177, 0, 1, 1,
0.5909015, 0.4202449, 0.02945066, 0.3019608, 0, 1, 1,
0.5912368, -2.048108, 3.668746, 0.3098039, 0, 1, 1,
0.6002656, -2.095563, 3.320746, 0.3137255, 0, 1, 1,
0.607219, -0.1014116, -0.281341, 0.3215686, 0, 1, 1,
0.6116802, 1.925239, -0.7564958, 0.3254902, 0, 1, 1,
0.6140235, 0.5639775, 0.09846906, 0.3333333, 0, 1, 1,
0.6151426, 0.4989857, -0.5523892, 0.3372549, 0, 1, 1,
0.6153641, -0.4086705, 1.367399, 0.345098, 0, 1, 1,
0.617403, -0.08942367, 1.065395, 0.3490196, 0, 1, 1,
0.6259441, -1.190405, 2.909589, 0.3568628, 0, 1, 1,
0.6263148, 0.9506575, 2.599755, 0.3607843, 0, 1, 1,
0.6270521, 0.7599756, 0.4069512, 0.3686275, 0, 1, 1,
0.6292914, 1.909216, -0.1240568, 0.372549, 0, 1, 1,
0.6322288, 0.9938594, 0.3951329, 0.3803922, 0, 1, 1,
0.6370373, 0.6327117, 1.911311, 0.3843137, 0, 1, 1,
0.6389228, -0.2608302, 3.182446, 0.3921569, 0, 1, 1,
0.6393273, -0.4464809, 3.446898, 0.3960784, 0, 1, 1,
0.6395408, 1.864807, -1.628175, 0.4039216, 0, 1, 1,
0.6397901, 0.4916112, 2.518258, 0.4117647, 0, 1, 1,
0.6435474, 1.09745, 0.9213089, 0.4156863, 0, 1, 1,
0.6455056, 0.671237, 0.4966315, 0.4235294, 0, 1, 1,
0.6518248, -1.28717, 3.249168, 0.427451, 0, 1, 1,
0.6524307, 0.1197931, 1.685595, 0.4352941, 0, 1, 1,
0.6552302, 1.479982, 0.9519207, 0.4392157, 0, 1, 1,
0.6565879, 2.162935, 0.498191, 0.4470588, 0, 1, 1,
0.6578574, 1.364323, 0.7158584, 0.4509804, 0, 1, 1,
0.6585118, -1.205572, 2.98374, 0.4588235, 0, 1, 1,
0.6593145, 2.341778, 1.394548, 0.4627451, 0, 1, 1,
0.6604895, 1.52499, -0.3572862, 0.4705882, 0, 1, 1,
0.6625639, 0.2540381, 3.11132, 0.4745098, 0, 1, 1,
0.6711734, -1.266559, 1.372772, 0.4823529, 0, 1, 1,
0.6716439, -0.3884873, 2.891012, 0.4862745, 0, 1, 1,
0.6742745, -1.015225, 4.570974, 0.4941176, 0, 1, 1,
0.6760994, -0.1961075, 0.2487416, 0.5019608, 0, 1, 1,
0.6856605, 1.302172, 1.235388, 0.5058824, 0, 1, 1,
0.6856816, 1.500552, 0.4203302, 0.5137255, 0, 1, 1,
0.6867454, -0.5950457, 2.214101, 0.5176471, 0, 1, 1,
0.6925268, 1.108672, -0.3761596, 0.5254902, 0, 1, 1,
0.6931027, 0.3257164, 1.260486, 0.5294118, 0, 1, 1,
0.6955965, 1.053832, 0.09229711, 0.5372549, 0, 1, 1,
0.6962436, -1.577693, 2.238391, 0.5411765, 0, 1, 1,
0.6962738, 0.2379242, 1.036761, 0.5490196, 0, 1, 1,
0.6976216, 0.6151182, 1.14251, 0.5529412, 0, 1, 1,
0.6992207, 0.6927746, 0.6132356, 0.5607843, 0, 1, 1,
0.7050946, 0.7972153, 0.3026369, 0.5647059, 0, 1, 1,
0.7062063, 0.7374496, 0.7073252, 0.572549, 0, 1, 1,
0.7103356, -0.07216199, 1.276632, 0.5764706, 0, 1, 1,
0.7133918, -0.6931112, 2.003441, 0.5843138, 0, 1, 1,
0.7162418, -1.660579, 1.667651, 0.5882353, 0, 1, 1,
0.7163039, -0.9627174, 2.776314, 0.5960785, 0, 1, 1,
0.7166669, 0.5516704, 1.285603, 0.6039216, 0, 1, 1,
0.7273446, -0.3133599, 3.023705, 0.6078432, 0, 1, 1,
0.7376082, -1.162362, 1.051107, 0.6156863, 0, 1, 1,
0.7449429, -0.1909654, 1.735501, 0.6196079, 0, 1, 1,
0.7461653, 0.01858948, 1.122445, 0.627451, 0, 1, 1,
0.7464528, -0.431107, 3.349969, 0.6313726, 0, 1, 1,
0.7466252, -0.2075031, 2.148307, 0.6392157, 0, 1, 1,
0.7522244, 0.003354665, 0.8372899, 0.6431373, 0, 1, 1,
0.7556735, -0.7273259, 1.59491, 0.6509804, 0, 1, 1,
0.7625862, -1.912527, 1.549949, 0.654902, 0, 1, 1,
0.7634754, 0.7540612, 2.507569, 0.6627451, 0, 1, 1,
0.7685897, 0.2562545, 1.856459, 0.6666667, 0, 1, 1,
0.7728658, 0.4357824, 1.917648, 0.6745098, 0, 1, 1,
0.7755995, -0.4539162, 2.223717, 0.6784314, 0, 1, 1,
0.7863157, -0.1896243, 0.8710909, 0.6862745, 0, 1, 1,
0.7906241, 0.05297752, 0.999554, 0.6901961, 0, 1, 1,
0.7911874, -0.5705671, 4.041111, 0.6980392, 0, 1, 1,
0.7955639, 1.549706, 0.6844681, 0.7058824, 0, 1, 1,
0.7955903, -1.672242, 3.077566, 0.7098039, 0, 1, 1,
0.7979891, -1.316916, 2.506049, 0.7176471, 0, 1, 1,
0.7982479, -0.390216, 2.912251, 0.7215686, 0, 1, 1,
0.8027459, 2.087404, 0.8424631, 0.7294118, 0, 1, 1,
0.809758, -0.5536078, 2.51396, 0.7333333, 0, 1, 1,
0.8150243, -0.8787394, 1.819635, 0.7411765, 0, 1, 1,
0.8150382, -0.6478447, 3.506263, 0.7450981, 0, 1, 1,
0.8150587, -1.562838, 3.934512, 0.7529412, 0, 1, 1,
0.8173808, -1.894074, 4.223306, 0.7568628, 0, 1, 1,
0.8217304, -0.1483031, 2.665311, 0.7647059, 0, 1, 1,
0.8248633, 1.000921, 0.8244279, 0.7686275, 0, 1, 1,
0.8303121, -1.040402, 3.560465, 0.7764706, 0, 1, 1,
0.8347068, -0.6121874, 3.085407, 0.7803922, 0, 1, 1,
0.8390607, 1.726373, 1.957797, 0.7882353, 0, 1, 1,
0.8448958, 0.5442377, 1.195985, 0.7921569, 0, 1, 1,
0.8473798, -1.510063, 3.263528, 0.8, 0, 1, 1,
0.8495338, 1.370886, -0.5238487, 0.8078431, 0, 1, 1,
0.8541266, -0.2728597, 0.2313847, 0.8117647, 0, 1, 1,
0.8627415, 0.8620196, -1.822775, 0.8196079, 0, 1, 1,
0.8711722, 0.2066809, 1.549334, 0.8235294, 0, 1, 1,
0.8714343, 0.6245623, 0.8115757, 0.8313726, 0, 1, 1,
0.8750587, -1.191491, 2.030788, 0.8352941, 0, 1, 1,
0.8802618, -0.8800961, 4.271902, 0.8431373, 0, 1, 1,
0.8845962, 0.6202931, 0.3829002, 0.8470588, 0, 1, 1,
0.8863563, -0.5467078, 3.404253, 0.854902, 0, 1, 1,
0.8888811, 0.8592283, 1.055004, 0.8588235, 0, 1, 1,
0.8895764, -0.8400361, 2.360416, 0.8666667, 0, 1, 1,
0.8905419, -0.09177782, 1.040156, 0.8705882, 0, 1, 1,
0.8915157, 1.493598, 0.7677202, 0.8784314, 0, 1, 1,
0.8992397, -1.138283, 2.170115, 0.8823529, 0, 1, 1,
0.9001447, -0.6812882, 1.266083, 0.8901961, 0, 1, 1,
0.9011688, -0.8621847, 4.017807, 0.8941177, 0, 1, 1,
0.9040337, -0.01145774, 2.147377, 0.9019608, 0, 1, 1,
0.9080421, 1.293102, -0.9529131, 0.9098039, 0, 1, 1,
0.9106341, 1.426912, 0.1041225, 0.9137255, 0, 1, 1,
0.9115707, -1.267823, 2.631375, 0.9215686, 0, 1, 1,
0.9121101, 0.5843014, 2.729051, 0.9254902, 0, 1, 1,
0.9123302, -0.759316, 2.086441, 0.9333333, 0, 1, 1,
0.9178352, 0.1379915, 3.120847, 0.9372549, 0, 1, 1,
0.918569, -0.7718537, 0.2844703, 0.945098, 0, 1, 1,
0.9198481, 1.117918, 1.072434, 0.9490196, 0, 1, 1,
0.9237511, -0.7503647, 2.856081, 0.9568627, 0, 1, 1,
0.9293306, 1.161079, -1.923706, 0.9607843, 0, 1, 1,
0.9317558, 0.9013575, -0.2510975, 0.9686275, 0, 1, 1,
0.9361022, 1.17277, 1.78739, 0.972549, 0, 1, 1,
0.9398078, 0.6646902, 0.8835292, 0.9803922, 0, 1, 1,
0.9466943, 2.439429, 0.07817046, 0.9843137, 0, 1, 1,
0.9473511, -0.5473918, 3.101723, 0.9921569, 0, 1, 1,
0.9589738, -0.3817868, 1.014925, 0.9960784, 0, 1, 1,
0.9599112, 0.08556868, 3.411387, 1, 0, 0.9960784, 1,
0.9629603, 0.02864009, 2.574858, 1, 0, 0.9882353, 1,
0.9692615, -1.542453, 2.878569, 1, 0, 0.9843137, 1,
0.9769836, -0.607017, 1.66207, 1, 0, 0.9764706, 1,
0.9790486, 0.1108392, 0.2299926, 1, 0, 0.972549, 1,
0.9791227, 0.5698997, -0.0773108, 1, 0, 0.9647059, 1,
0.9800276, -0.5873476, 2.660116, 1, 0, 0.9607843, 1,
0.9848595, -1.49157, 1.273659, 1, 0, 0.9529412, 1,
0.9863396, -0.7335653, 1.892126, 1, 0, 0.9490196, 1,
0.9887654, -0.4825486, 1.455334, 1, 0, 0.9411765, 1,
1.009147, -0.9612025, 0.8140171, 1, 0, 0.9372549, 1,
1.014412, -1.026125, 2.11247, 1, 0, 0.9294118, 1,
1.015109, 0.8673491, 0.5781862, 1, 0, 0.9254902, 1,
1.016693, -0.2630244, 2.908529, 1, 0, 0.9176471, 1,
1.02193, -0.3029349, 0.5899175, 1, 0, 0.9137255, 1,
1.029492, 3.051224, 2.522699, 1, 0, 0.9058824, 1,
1.030659, 1.200136, -0.3918345, 1, 0, 0.9019608, 1,
1.038639, 0.4201301, 0.9532176, 1, 0, 0.8941177, 1,
1.042885, -0.7320909, 4.306685, 1, 0, 0.8862745, 1,
1.062323, 0.6195538, 0.9073089, 1, 0, 0.8823529, 1,
1.073807, 0.9272538, 0.90975, 1, 0, 0.8745098, 1,
1.078514, -1.863638, 1.784647, 1, 0, 0.8705882, 1,
1.083729, 0.1311307, 2.565717, 1, 0, 0.8627451, 1,
1.08672, -1.209248, 2.042752, 1, 0, 0.8588235, 1,
1.088367, 0.0555057, 1.57653, 1, 0, 0.8509804, 1,
1.090528, 2.078127, 0.1520299, 1, 0, 0.8470588, 1,
1.092427, 0.9546633, 2.34878, 1, 0, 0.8392157, 1,
1.101651, -1.741833, 2.551069, 1, 0, 0.8352941, 1,
1.102137, -0.5645877, 2.580883, 1, 0, 0.827451, 1,
1.114813, -0.340437, 1.585309, 1, 0, 0.8235294, 1,
1.116819, 0.254282, 0.5922478, 1, 0, 0.8156863, 1,
1.121252, 0.2776353, 0.4493704, 1, 0, 0.8117647, 1,
1.126661, -0.6899589, 2.818377, 1, 0, 0.8039216, 1,
1.127469, 1.133182, 1.735521, 1, 0, 0.7960784, 1,
1.134635, -0.4512407, 0.09394911, 1, 0, 0.7921569, 1,
1.148672, 0.6569258, 0.4983141, 1, 0, 0.7843137, 1,
1.153472, -2.199017, 2.287477, 1, 0, 0.7803922, 1,
1.156902, 1.507228, 2.858722, 1, 0, 0.772549, 1,
1.159229, 0.5030498, 0.7747992, 1, 0, 0.7686275, 1,
1.171443, -1.165649, 3.565606, 1, 0, 0.7607843, 1,
1.172192, 0.119154, 0.7326254, 1, 0, 0.7568628, 1,
1.173758, -1.00954, 1.791435, 1, 0, 0.7490196, 1,
1.174495, -0.5586722, 1.961191, 1, 0, 0.7450981, 1,
1.181466, -0.4404219, 1.526264, 1, 0, 0.7372549, 1,
1.184865, -0.8365471, 2.411439, 1, 0, 0.7333333, 1,
1.190346, 0.271427, 0.5571079, 1, 0, 0.7254902, 1,
1.198968, 0.03842214, 1.442929, 1, 0, 0.7215686, 1,
1.205855, -0.4916363, 1.838655, 1, 0, 0.7137255, 1,
1.208739, -0.3499343, 3.192994, 1, 0, 0.7098039, 1,
1.210475, -0.2217337, 1.745753, 1, 0, 0.7019608, 1,
1.218937, 0.006077956, 2.221386, 1, 0, 0.6941177, 1,
1.219095, -0.687251, 2.866716, 1, 0, 0.6901961, 1,
1.225018, 0.9590038, 2.989494, 1, 0, 0.682353, 1,
1.227011, 0.09128359, 0.3797943, 1, 0, 0.6784314, 1,
1.231495, 0.8486155, -0.4002938, 1, 0, 0.6705883, 1,
1.23231, 1.49686, 2.368512, 1, 0, 0.6666667, 1,
1.23828, -0.596288, 1.944705, 1, 0, 0.6588235, 1,
1.238363, 1.990777, -0.4664569, 1, 0, 0.654902, 1,
1.259948, 0.6536602, 0.5469627, 1, 0, 0.6470588, 1,
1.263479, 0.0664506, 1.439333, 1, 0, 0.6431373, 1,
1.267093, 1.173978, 0.02882337, 1, 0, 0.6352941, 1,
1.280723, -0.23653, 1.052531, 1, 0, 0.6313726, 1,
1.28206, -1.400888, 3.753302, 1, 0, 0.6235294, 1,
1.297681, -0.4861844, -0.2902232, 1, 0, 0.6196079, 1,
1.298271, -0.1047745, 2.556691, 1, 0, 0.6117647, 1,
1.30364, -0.04144092, 1.384567, 1, 0, 0.6078432, 1,
1.305912, -1.918862, 3.206496, 1, 0, 0.6, 1,
1.319751, -0.0739404, 1.979736, 1, 0, 0.5921569, 1,
1.329437, -0.7566738, 2.378518, 1, 0, 0.5882353, 1,
1.33519, 1.543775, 0.3145182, 1, 0, 0.5803922, 1,
1.33677, 0.2584391, 1.283134, 1, 0, 0.5764706, 1,
1.346755, 0.2325642, -0.9266605, 1, 0, 0.5686275, 1,
1.348794, 0.6897324, 1.990079, 1, 0, 0.5647059, 1,
1.350041, 0.4541352, 0.8994201, 1, 0, 0.5568628, 1,
1.352684, -0.367335, 1.902459, 1, 0, 0.5529412, 1,
1.353919, 0.3628851, 0.8482996, 1, 0, 0.5450981, 1,
1.356862, -1.420221, 1.548748, 1, 0, 0.5411765, 1,
1.36203, -0.5694714, 2.470254, 1, 0, 0.5333334, 1,
1.366196, -0.6917663, 4.794726, 1, 0, 0.5294118, 1,
1.36787, -0.2274041, 0.7919049, 1, 0, 0.5215687, 1,
1.370077, 0.2553337, 1.118362, 1, 0, 0.5176471, 1,
1.371916, -0.7839493, 2.644555, 1, 0, 0.509804, 1,
1.375511, 0.4844183, 1.328892, 1, 0, 0.5058824, 1,
1.377349, -1.051022, 2.887328, 1, 0, 0.4980392, 1,
1.384356, -1.024219, 1.668556, 1, 0, 0.4901961, 1,
1.385012, 0.9288611, -0.6559753, 1, 0, 0.4862745, 1,
1.385146, 0.1602968, 0.566494, 1, 0, 0.4784314, 1,
1.393808, -0.08093615, 1.905424, 1, 0, 0.4745098, 1,
1.394375, -1.373557, 3.373788, 1, 0, 0.4666667, 1,
1.398061, 1.66798, 0.780311, 1, 0, 0.4627451, 1,
1.398303, 1.63421, 0.7947466, 1, 0, 0.454902, 1,
1.399509, 0.8949648, 0.5834876, 1, 0, 0.4509804, 1,
1.405336, -0.3055534, 1.1735, 1, 0, 0.4431373, 1,
1.417099, -1.835842, 4.533516, 1, 0, 0.4392157, 1,
1.418018, 0.1904647, 0.149342, 1, 0, 0.4313726, 1,
1.423784, -0.02775695, 1.539282, 1, 0, 0.427451, 1,
1.42748, -0.467698, 2.738213, 1, 0, 0.4196078, 1,
1.440616, -0.07017327, 2.730157, 1, 0, 0.4156863, 1,
1.447248, -2.260473, 2.437747, 1, 0, 0.4078431, 1,
1.455767, -0.5834438, 2.132982, 1, 0, 0.4039216, 1,
1.465189, -0.3049255, 0.6800259, 1, 0, 0.3960784, 1,
1.488097, -0.3623909, 3.246578, 1, 0, 0.3882353, 1,
1.489948, -0.2342575, 1.67905, 1, 0, 0.3843137, 1,
1.493405, 0.6390653, 2.411868, 1, 0, 0.3764706, 1,
1.494378, 0.5232812, 0.1686765, 1, 0, 0.372549, 1,
1.519927, 0.1986979, 2.473655, 1, 0, 0.3647059, 1,
1.522775, 0.3452255, 2.139678, 1, 0, 0.3607843, 1,
1.529158, 0.3459393, 1.233796, 1, 0, 0.3529412, 1,
1.541218, 1.014832, 2.891668, 1, 0, 0.3490196, 1,
1.556592, 0.57298, 0.6624512, 1, 0, 0.3411765, 1,
1.565004, -1.129761, 0.8473964, 1, 0, 0.3372549, 1,
1.566226, 0.2925176, 1.697903, 1, 0, 0.3294118, 1,
1.576549, -0.2489751, 3.839084, 1, 0, 0.3254902, 1,
1.580623, 0.6485075, 1.506119, 1, 0, 0.3176471, 1,
1.588558, 1.203959, 1.293507, 1, 0, 0.3137255, 1,
1.58869, 0.5749547, 2.179839, 1, 0, 0.3058824, 1,
1.648337, 1.092903, 1.856619, 1, 0, 0.2980392, 1,
1.662961, 1.362268, -0.02789924, 1, 0, 0.2941177, 1,
1.66297, 0.06822339, 1.492157, 1, 0, 0.2862745, 1,
1.668959, -1.346694, 2.629362, 1, 0, 0.282353, 1,
1.669457, -1.395955, 2.79372, 1, 0, 0.2745098, 1,
1.669724, -0.9955122, 2.083502, 1, 0, 0.2705882, 1,
1.672673, -0.7675661, 2.852367, 1, 0, 0.2627451, 1,
1.673516, -2.217447, 4.73208, 1, 0, 0.2588235, 1,
1.674855, -1.187023, 3.133549, 1, 0, 0.2509804, 1,
1.678598, 1.029662, 1.285583, 1, 0, 0.2470588, 1,
1.700347, 0.4022931, 0.1940046, 1, 0, 0.2392157, 1,
1.704617, 1.917709, -0.1182829, 1, 0, 0.2352941, 1,
1.70486, -0.3578778, 0.9695301, 1, 0, 0.227451, 1,
1.711161, 0.5346031, -0.3955765, 1, 0, 0.2235294, 1,
1.743427, 0.689158, -0.2440652, 1, 0, 0.2156863, 1,
1.781008, 0.2176991, 0.7353503, 1, 0, 0.2117647, 1,
1.808921, -0.3428943, 2.714138, 1, 0, 0.2039216, 1,
1.812991, 0.5733221, 0.1505114, 1, 0, 0.1960784, 1,
1.849885, -0.6493759, 2.942109, 1, 0, 0.1921569, 1,
1.852561, 0.3580567, -0.7747946, 1, 0, 0.1843137, 1,
1.876993, 0.7443358, -0.1611775, 1, 0, 0.1803922, 1,
1.883489, -1.144746, 1.665362, 1, 0, 0.172549, 1,
1.917595, 0.07410912, 2.237593, 1, 0, 0.1686275, 1,
1.930791, 0.1459005, 2.959589, 1, 0, 0.1607843, 1,
1.987518, -0.1498022, 1.364532, 1, 0, 0.1568628, 1,
1.988633, -0.6765816, 2.222874, 1, 0, 0.1490196, 1,
1.996227, 0.7216952, 2.653093, 1, 0, 0.145098, 1,
2.029935, -0.3093938, 1.519973, 1, 0, 0.1372549, 1,
2.065269, 0.7913746, 0.5895974, 1, 0, 0.1333333, 1,
2.074368, 0.04186334, 2.208093, 1, 0, 0.1254902, 1,
2.105766, 0.196354, 1.44028, 1, 0, 0.1215686, 1,
2.122164, 2.18825, 0.07746523, 1, 0, 0.1137255, 1,
2.14413, 0.319425, 0.281066, 1, 0, 0.1098039, 1,
2.151655, -1.629006, 1.018581, 1, 0, 0.1019608, 1,
2.153176, -1.372614, 2.784251, 1, 0, 0.09411765, 1,
2.175711, 0.5029468, 1.81864, 1, 0, 0.09019608, 1,
2.20207, 0.2876627, 1.7619, 1, 0, 0.08235294, 1,
2.211319, 0.5096926, 2.428727, 1, 0, 0.07843138, 1,
2.221012, -0.6404204, 0.7618983, 1, 0, 0.07058824, 1,
2.241511, 0.519378, 1.081862, 1, 0, 0.06666667, 1,
2.255867, -0.7434124, 2.251932, 1, 0, 0.05882353, 1,
2.329326, 1.081999, 0.3426662, 1, 0, 0.05490196, 1,
2.416442, -0.6108361, 2.765332, 1, 0, 0.04705882, 1,
2.45261, -0.1392664, 1.952675, 1, 0, 0.04313726, 1,
2.511506, 0.374361, 0.6956241, 1, 0, 0.03529412, 1,
2.51911, 0.3523189, 1.139225, 1, 0, 0.03137255, 1,
2.669848, 0.6304454, 2.47723, 1, 0, 0.02352941, 1,
2.859486, 0.4839175, 1.232018, 1, 0, 0.01960784, 1,
2.936025, -2.128931, 1.02132, 1, 0, 0.01176471, 1,
3.168512, 0.7059183, 0.1913864, 1, 0, 0.007843138, 1
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
0.1750576, -4.226072, -7.831197, 0, -0.5, 0.5, 0.5,
0.1750576, -4.226072, -7.831197, 1, -0.5, 0.5, 0.5,
0.1750576, -4.226072, -7.831197, 1, 1.5, 0.5, 0.5,
0.1750576, -4.226072, -7.831197, 0, 1.5, 0.5, 0.5
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
-3.833177, -0.06006122, -7.831197, 0, -0.5, 0.5, 0.5,
-3.833177, -0.06006122, -7.831197, 1, -0.5, 0.5, 0.5,
-3.833177, -0.06006122, -7.831197, 1, 1.5, 0.5, 0.5,
-3.833177, -0.06006122, -7.831197, 0, 1.5, 0.5, 0.5
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
-3.833177, -4.226072, -0.2572117, 0, -0.5, 0.5, 0.5,
-3.833177, -4.226072, -0.2572117, 1, -0.5, 0.5, 0.5,
-3.833177, -4.226072, -0.2572117, 1, 1.5, 0.5, 0.5,
-3.833177, -4.226072, -0.2572117, 0, 1.5, 0.5, 0.5
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
-2, -3.264685, -6.083354,
3, -3.264685, -6.083354,
-2, -3.264685, -6.083354,
-2, -3.424916, -6.374661,
-1, -3.264685, -6.083354,
-1, -3.424916, -6.374661,
0, -3.264685, -6.083354,
0, -3.424916, -6.374661,
1, -3.264685, -6.083354,
1, -3.424916, -6.374661,
2, -3.264685, -6.083354,
2, -3.424916, -6.374661,
3, -3.264685, -6.083354,
3, -3.424916, -6.374661
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
-2, -3.745378, -6.957276, 0, -0.5, 0.5, 0.5,
-2, -3.745378, -6.957276, 1, -0.5, 0.5, 0.5,
-2, -3.745378, -6.957276, 1, 1.5, 0.5, 0.5,
-2, -3.745378, -6.957276, 0, 1.5, 0.5, 0.5,
-1, -3.745378, -6.957276, 0, -0.5, 0.5, 0.5,
-1, -3.745378, -6.957276, 1, -0.5, 0.5, 0.5,
-1, -3.745378, -6.957276, 1, 1.5, 0.5, 0.5,
-1, -3.745378, -6.957276, 0, 1.5, 0.5, 0.5,
0, -3.745378, -6.957276, 0, -0.5, 0.5, 0.5,
0, -3.745378, -6.957276, 1, -0.5, 0.5, 0.5,
0, -3.745378, -6.957276, 1, 1.5, 0.5, 0.5,
0, -3.745378, -6.957276, 0, 1.5, 0.5, 0.5,
1, -3.745378, -6.957276, 0, -0.5, 0.5, 0.5,
1, -3.745378, -6.957276, 1, -0.5, 0.5, 0.5,
1, -3.745378, -6.957276, 1, 1.5, 0.5, 0.5,
1, -3.745378, -6.957276, 0, 1.5, 0.5, 0.5,
2, -3.745378, -6.957276, 0, -0.5, 0.5, 0.5,
2, -3.745378, -6.957276, 1, -0.5, 0.5, 0.5,
2, -3.745378, -6.957276, 1, 1.5, 0.5, 0.5,
2, -3.745378, -6.957276, 0, 1.5, 0.5, 0.5,
3, -3.745378, -6.957276, 0, -0.5, 0.5, 0.5,
3, -3.745378, -6.957276, 1, -0.5, 0.5, 0.5,
3, -3.745378, -6.957276, 1, 1.5, 0.5, 0.5,
3, -3.745378, -6.957276, 0, 1.5, 0.5, 0.5
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
-2.9082, -3, -6.083354,
-2.9082, 3, -6.083354,
-2.9082, -3, -6.083354,
-3.062363, -3, -6.374661,
-2.9082, -2, -6.083354,
-3.062363, -2, -6.374661,
-2.9082, -1, -6.083354,
-3.062363, -1, -6.374661,
-2.9082, 0, -6.083354,
-3.062363, 0, -6.374661,
-2.9082, 1, -6.083354,
-3.062363, 1, -6.374661,
-2.9082, 2, -6.083354,
-3.062363, 2, -6.374661,
-2.9082, 3, -6.083354,
-3.062363, 3, -6.374661
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
-3.370689, -3, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, -3, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, -3, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, -3, -6.957276, 0, 1.5, 0.5, 0.5,
-3.370689, -2, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, -2, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, -2, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, -2, -6.957276, 0, 1.5, 0.5, 0.5,
-3.370689, -1, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, -1, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, -1, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, -1, -6.957276, 0, 1.5, 0.5, 0.5,
-3.370689, 0, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, 0, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, 0, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, 0, -6.957276, 0, 1.5, 0.5, 0.5,
-3.370689, 1, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, 1, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, 1, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, 1, -6.957276, 0, 1.5, 0.5, 0.5,
-3.370689, 2, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, 2, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, 2, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, 2, -6.957276, 0, 1.5, 0.5, 0.5,
-3.370689, 3, -6.957276, 0, -0.5, 0.5, 0.5,
-3.370689, 3, -6.957276, 1, -0.5, 0.5, 0.5,
-3.370689, 3, -6.957276, 1, 1.5, 0.5, 0.5,
-3.370689, 3, -6.957276, 0, 1.5, 0.5, 0.5
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
-2.9082, -3.264685, -4,
-2.9082, -3.264685, 4,
-2.9082, -3.264685, -4,
-3.062363, -3.424916, -4,
-2.9082, -3.264685, -2,
-3.062363, -3.424916, -2,
-2.9082, -3.264685, 0,
-3.062363, -3.424916, 0,
-2.9082, -3.264685, 2,
-3.062363, -3.424916, 2,
-2.9082, -3.264685, 4,
-3.062363, -3.424916, 4
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
-3.370689, -3.745378, -4, 0, -0.5, 0.5, 0.5,
-3.370689, -3.745378, -4, 1, -0.5, 0.5, 0.5,
-3.370689, -3.745378, -4, 1, 1.5, 0.5, 0.5,
-3.370689, -3.745378, -4, 0, 1.5, 0.5, 0.5,
-3.370689, -3.745378, -2, 0, -0.5, 0.5, 0.5,
-3.370689, -3.745378, -2, 1, -0.5, 0.5, 0.5,
-3.370689, -3.745378, -2, 1, 1.5, 0.5, 0.5,
-3.370689, -3.745378, -2, 0, 1.5, 0.5, 0.5,
-3.370689, -3.745378, 0, 0, -0.5, 0.5, 0.5,
-3.370689, -3.745378, 0, 1, -0.5, 0.5, 0.5,
-3.370689, -3.745378, 0, 1, 1.5, 0.5, 0.5,
-3.370689, -3.745378, 0, 0, 1.5, 0.5, 0.5,
-3.370689, -3.745378, 2, 0, -0.5, 0.5, 0.5,
-3.370689, -3.745378, 2, 1, -0.5, 0.5, 0.5,
-3.370689, -3.745378, 2, 1, 1.5, 0.5, 0.5,
-3.370689, -3.745378, 2, 0, 1.5, 0.5, 0.5,
-3.370689, -3.745378, 4, 0, -0.5, 0.5, 0.5,
-3.370689, -3.745378, 4, 1, -0.5, 0.5, 0.5,
-3.370689, -3.745378, 4, 1, 1.5, 0.5, 0.5,
-3.370689, -3.745378, 4, 0, 1.5, 0.5, 0.5
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
-2.9082, -3.264685, -6.083354,
-2.9082, 3.144562, -6.083354,
-2.9082, -3.264685, 5.568931,
-2.9082, 3.144562, 5.568931,
-2.9082, -3.264685, -6.083354,
-2.9082, -3.264685, 5.568931,
-2.9082, 3.144562, -6.083354,
-2.9082, 3.144562, 5.568931,
-2.9082, -3.264685, -6.083354,
3.258315, -3.264685, -6.083354,
-2.9082, -3.264685, 5.568931,
3.258315, -3.264685, 5.568931,
-2.9082, 3.144562, -6.083354,
3.258315, 3.144562, -6.083354,
-2.9082, 3.144562, 5.568931,
3.258315, 3.144562, 5.568931,
3.258315, -3.264685, -6.083354,
3.258315, 3.144562, -6.083354,
3.258315, -3.264685, 5.568931,
3.258315, 3.144562, 5.568931,
3.258315, -3.264685, -6.083354,
3.258315, -3.264685, 5.568931,
3.258315, 3.144562, -6.083354,
3.258315, 3.144562, 5.568931
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
var radius = 7.827509;
var distance = 34.82547;
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
mvMatrix.translate( -0.1750576, 0.06006122, 0.2572117 );
mvMatrix.scale( 1.372454, 1.320476, 0.7263173 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.82547);
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
ethyrimol<-read.table("ethyrimol.xyz")
```

```
## Error in read.table("ethyrimol.xyz"): no lines available in input
```

```r
x<-ethyrimol$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyrimol' not found
```

```r
y<-ethyrimol$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyrimol' not found
```

```r
z<-ethyrimol$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyrimol' not found
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
-2.818396, -0.2277288, -0.08203991, 0, 0, 1, 1, 1,
-2.727519, -0.3195986, -1.391317, 1, 0, 0, 1, 1,
-2.68759, -0.3154896, -1.358156, 1, 0, 0, 1, 1,
-2.646671, -0.0855162, -1.480506, 1, 0, 0, 1, 1,
-2.563339, 0.2900534, -0.6246481, 1, 0, 0, 1, 1,
-2.539144, 0.09783895, -1.262744, 1, 0, 0, 1, 1,
-2.490474, 0.6183661, -0.6338185, 0, 0, 0, 1, 1,
-2.43691, 0.05843986, -1.195906, 0, 0, 0, 1, 1,
-2.37548, -1.075478, -0.6271704, 0, 0, 0, 1, 1,
-2.367284, 2.455763, 0.1841834, 0, 0, 0, 1, 1,
-2.351991, -0.7264813, -2.018607, 0, 0, 0, 1, 1,
-2.348181, 0.3770471, -2.196287, 0, 0, 0, 1, 1,
-2.332941, -0.6198385, -2.57423, 0, 0, 0, 1, 1,
-2.241297, 0.4259634, -2.7705, 1, 1, 1, 1, 1,
-2.144159, 1.078231, -1.772367, 1, 1, 1, 1, 1,
-2.099747, 0.7774746, -3.223099, 1, 1, 1, 1, 1,
-2.098756, 0.4588637, -1.310791, 1, 1, 1, 1, 1,
-2.060719, 1.125067, -1.687684, 1, 1, 1, 1, 1,
-2.035768, -1.471825, 0.4278733, 1, 1, 1, 1, 1,
-2.009714, -0.07183081, -1.525378, 1, 1, 1, 1, 1,
-1.997469, 0.1005309, -0.2359751, 1, 1, 1, 1, 1,
-1.988073, 2.415702, 0.2071671, 1, 1, 1, 1, 1,
-1.980192, 0.03460535, -0.9104399, 1, 1, 1, 1, 1,
-1.965434, 1.486952, 1.819413, 1, 1, 1, 1, 1,
-1.95134, -0.1746823, -1.335441, 1, 1, 1, 1, 1,
-1.951291, -0.6526783, -2.336223, 1, 1, 1, 1, 1,
-1.950206, 1.129578, -1.88356, 1, 1, 1, 1, 1,
-1.945751, -0.08350082, -2.047688, 1, 1, 1, 1, 1,
-1.914402, 0.458003, -2.234929, 0, 0, 1, 1, 1,
-1.911567, 0.05692096, -2.214846, 1, 0, 0, 1, 1,
-1.908143, -1.335334, -1.759558, 1, 0, 0, 1, 1,
-1.871953, -1.717001, -2.390537, 1, 0, 0, 1, 1,
-1.840384, -1.095547, -1.955857, 1, 0, 0, 1, 1,
-1.825343, 0.004317522, -2.055824, 1, 0, 0, 1, 1,
-1.803986, -0.6031049, -1.040757, 0, 0, 0, 1, 1,
-1.776879, -0.9994574, -1.620737, 0, 0, 0, 1, 1,
-1.762558, -0.62817, -0.766085, 0, 0, 0, 1, 1,
-1.729237, 0.1496721, -2.552325, 0, 0, 0, 1, 1,
-1.725411, 1.819663, -1.518011, 0, 0, 0, 1, 1,
-1.713534, -0.8589257, -2.987243, 0, 0, 0, 1, 1,
-1.71286, -1.116465, -3.290112, 0, 0, 0, 1, 1,
-1.712725, -3.12988, -0.8804468, 1, 1, 1, 1, 1,
-1.706993, 2.391388, -0.04432055, 1, 1, 1, 1, 1,
-1.704211, 0.3184117, -1.902541, 1, 1, 1, 1, 1,
-1.69355, 0.5096089, -1.217253, 1, 1, 1, 1, 1,
-1.683678, 0.5044488, -0.1819843, 1, 1, 1, 1, 1,
-1.645713, 0.2654781, -2.656757, 1, 1, 1, 1, 1,
-1.641427, 0.1626769, -2.422065, 1, 1, 1, 1, 1,
-1.631037, 0.2273534, -2.162491, 1, 1, 1, 1, 1,
-1.617707, -0.6955562, -3.565558, 1, 1, 1, 1, 1,
-1.59822, -0.4598363, -1.566289, 1, 1, 1, 1, 1,
-1.597453, 0.5712382, -0.421634, 1, 1, 1, 1, 1,
-1.596653, -0.6608328, -3.809964, 1, 1, 1, 1, 1,
-1.587711, -0.7361204, -1.897796, 1, 1, 1, 1, 1,
-1.573075, -0.673027, -1.594857, 1, 1, 1, 1, 1,
-1.559402, -0.8663519, -2.359262, 1, 1, 1, 1, 1,
-1.555774, 0.6088992, -1.803306, 0, 0, 1, 1, 1,
-1.550394, 0.3455178, 0.981787, 1, 0, 0, 1, 1,
-1.545999, -0.3097917, -1.126183, 1, 0, 0, 1, 1,
-1.54194, 0.1428909, -1.640351, 1, 0, 0, 1, 1,
-1.536599, 1.506771, -0.2381515, 1, 0, 0, 1, 1,
-1.529862, -0.2249434, -2.028024, 1, 0, 0, 1, 1,
-1.506414, 0.1722793, -1.845858, 0, 0, 0, 1, 1,
-1.494919, 0.7561817, 0.6691301, 0, 0, 0, 1, 1,
-1.494768, -0.2246492, -1.43753, 0, 0, 0, 1, 1,
-1.48427, 1.682608, -1.322919, 0, 0, 0, 1, 1,
-1.482275, 0.05432334, -1.66089, 0, 0, 0, 1, 1,
-1.478548, -0.638705, -1.207024, 0, 0, 0, 1, 1,
-1.443572, 1.950919, -1.042886, 0, 0, 0, 1, 1,
-1.443419, -1.255807, -2.294041, 1, 1, 1, 1, 1,
-1.438413, 1.597616, -0.6440918, 1, 1, 1, 1, 1,
-1.435049, 0.6441149, -1.299938, 1, 1, 1, 1, 1,
-1.430676, 0.3638885, -1.333975, 1, 1, 1, 1, 1,
-1.42143, 0.664169, 0.9738289, 1, 1, 1, 1, 1,
-1.418255, 0.6426064, 0.2940641, 1, 1, 1, 1, 1,
-1.407505, 0.4288998, -3.349728, 1, 1, 1, 1, 1,
-1.399008, 1.607305, -0.3047412, 1, 1, 1, 1, 1,
-1.398274, -0.366587, -2.053244, 1, 1, 1, 1, 1,
-1.393846, -0.5984187, -2.721119, 1, 1, 1, 1, 1,
-1.386942, -1.455109, -2.90476, 1, 1, 1, 1, 1,
-1.378909, -0.082089, -0.5206136, 1, 1, 1, 1, 1,
-1.373757, -1.819907, -4.395279, 1, 1, 1, 1, 1,
-1.350861, -0.3343759, -1.853653, 1, 1, 1, 1, 1,
-1.349837, 0.5091294, -0.3222868, 1, 1, 1, 1, 1,
-1.340537, -1.422563, -2.77608, 0, 0, 1, 1, 1,
-1.337775, -1.095687, -3.163904, 1, 0, 0, 1, 1,
-1.329991, 0.1685097, -1.837159, 1, 0, 0, 1, 1,
-1.329959, 0.8836772, -0.7257298, 1, 0, 0, 1, 1,
-1.325854, -0.8879884, -0.8728023, 1, 0, 0, 1, 1,
-1.324196, 0.5078406, -0.869927, 1, 0, 0, 1, 1,
-1.321453, -1.526059, -2.458629, 0, 0, 0, 1, 1,
-1.320357, 0.6795352, -0.8018267, 0, 0, 0, 1, 1,
-1.315928, -1.592277, -3.786111, 0, 0, 0, 1, 1,
-1.315428, 1.41522, -1.741439, 0, 0, 0, 1, 1,
-1.314835, 2.064815, -0.01724947, 0, 0, 0, 1, 1,
-1.311491, -0.1075755, 0.6149237, 0, 0, 0, 1, 1,
-1.306761, 0.1427776, -1.424451, 0, 0, 0, 1, 1,
-1.306302, 0.1030262, -0.7765146, 1, 1, 1, 1, 1,
-1.297429, -0.2714205, -2.089168, 1, 1, 1, 1, 1,
-1.288397, 0.5350856, -2.051988, 1, 1, 1, 1, 1,
-1.273522, 2.674516, 2.841672, 1, 1, 1, 1, 1,
-1.268865, 1.114693, -1.918513, 1, 1, 1, 1, 1,
-1.25968, 1.337385, 0.8278611, 1, 1, 1, 1, 1,
-1.24046, -0.2838441, -1.507944, 1, 1, 1, 1, 1,
-1.235535, -1.077861, -0.7453403, 1, 1, 1, 1, 1,
-1.234292, 1.040398, -1.738255, 1, 1, 1, 1, 1,
-1.213567, 0.7304546, -1.182572, 1, 1, 1, 1, 1,
-1.212797, -0.436157, -1.286142, 1, 1, 1, 1, 1,
-1.208786, -0.7059646, -3.012242, 1, 1, 1, 1, 1,
-1.203725, -0.246067, -0.05458335, 1, 1, 1, 1, 1,
-1.202337, -0.6450729, -1.559546, 1, 1, 1, 1, 1,
-1.195993, -0.2480198, -1.240387, 1, 1, 1, 1, 1,
-1.193607, 1.288527, 0.1657747, 0, 0, 1, 1, 1,
-1.19328, 0.7642304, -0.1671937, 1, 0, 0, 1, 1,
-1.189104, -2.023887, -2.703986, 1, 0, 0, 1, 1,
-1.185959, -0.6999666, -3.137912, 1, 0, 0, 1, 1,
-1.176743, -0.9079999, -2.463396, 1, 0, 0, 1, 1,
-1.16669, 1.422861, 0.6122017, 1, 0, 0, 1, 1,
-1.161077, 0.2417415, -2.912357, 0, 0, 0, 1, 1,
-1.16024, -1.27806, -1.99338, 0, 0, 0, 1, 1,
-1.15568, 1.488514, 0.2965051, 0, 0, 0, 1, 1,
-1.155119, 0.7742425, 0.4460886, 0, 0, 0, 1, 1,
-1.153565, 2.303237, -0.5417281, 0, 0, 0, 1, 1,
-1.153178, -1.355439, -1.867467, 0, 0, 0, 1, 1,
-1.151245, -0.1571935, -1.039222, 0, 0, 0, 1, 1,
-1.149969, -1.196308, -3.015899, 1, 1, 1, 1, 1,
-1.144226, -0.8023482, -2.978483, 1, 1, 1, 1, 1,
-1.141321, 1.429688, 0.264699, 1, 1, 1, 1, 1,
-1.136242, 0.1685043, -1.817743, 1, 1, 1, 1, 1,
-1.135358, 0.3533378, -1.234942, 1, 1, 1, 1, 1,
-1.110295, -0.9374281, -3.751184, 1, 1, 1, 1, 1,
-1.10427, -1.582155, -3.594853, 1, 1, 1, 1, 1,
-1.101116, -1.577844, -2.344689, 1, 1, 1, 1, 1,
-1.09338, -1.190254, -0.7305835, 1, 1, 1, 1, 1,
-1.092308, -1.071867, -2.881454, 1, 1, 1, 1, 1,
-1.088109, 0.2775411, -0.9471899, 1, 1, 1, 1, 1,
-1.086544, -0.123736, -1.926194, 1, 1, 1, 1, 1,
-1.085599, 0.5330321, -0.7041417, 1, 1, 1, 1, 1,
-1.083772, 0.004508838, -1.972946, 1, 1, 1, 1, 1,
-1.079679, 1.007246, 0.04670754, 1, 1, 1, 1, 1,
-1.075198, 0.2021632, -0.530792, 0, 0, 1, 1, 1,
-1.070987, -1.362652, -4.391673, 1, 0, 0, 1, 1,
-1.068064, 1.074905, -0.3353899, 1, 0, 0, 1, 1,
-1.06594, 0.7532036, -0.8076848, 1, 0, 0, 1, 1,
-1.049547, 0.3052471, -0.5968207, 1, 0, 0, 1, 1,
-1.048677, 1.757935, 0.04947373, 1, 0, 0, 1, 1,
-1.023583, -0.398419, -1.120016, 0, 0, 0, 1, 1,
-1.015297, 0.5429664, -2.289427, 0, 0, 0, 1, 1,
-1.014637, -0.09792407, -1.899453, 0, 0, 0, 1, 1,
-1.013379, -0.6357656, -1.068897, 0, 0, 0, 1, 1,
-1.012191, -2.39062, -2.234378, 0, 0, 0, 1, 1,
-1.011047, 0.6529703, 0.2918113, 0, 0, 0, 1, 1,
-1.009344, -0.1043859, -2.851092, 0, 0, 0, 1, 1,
-1.000924, 1.425252, -1.882827, 1, 1, 1, 1, 1,
-0.9998579, -1.015182, 0.1448351, 1, 1, 1, 1, 1,
-0.999449, -0.8390622, -1.076162, 1, 1, 1, 1, 1,
-0.9988328, 1.407776, -3.128435, 1, 1, 1, 1, 1,
-0.9954199, 1.142622, -0.1585623, 1, 1, 1, 1, 1,
-0.9922562, 1.654935, -2.518715, 1, 1, 1, 1, 1,
-0.9885862, 0.07520327, -0.749974, 1, 1, 1, 1, 1,
-0.9786914, 2.023905, -2.004839, 1, 1, 1, 1, 1,
-0.9675496, 0.6416909, 1.434143, 1, 1, 1, 1, 1,
-0.9667522, -0.1451814, -1.172031, 1, 1, 1, 1, 1,
-0.9613561, 0.6643543, -1.511278, 1, 1, 1, 1, 1,
-0.9591213, 0.6533849, -0.6682632, 1, 1, 1, 1, 1,
-0.9567546, 0.5570475, -0.2236079, 1, 1, 1, 1, 1,
-0.9525692, 1.710793, -0.2075543, 1, 1, 1, 1, 1,
-0.9502407, 1.793272, -1.130341, 1, 1, 1, 1, 1,
-0.9497724, 0.8788888, 0.9636464, 0, 0, 1, 1, 1,
-0.9458861, -1.020988, -1.456067, 1, 0, 0, 1, 1,
-0.9447616, 1.701232, 0.2468891, 1, 0, 0, 1, 1,
-0.9410814, 1.157024, 0.1073663, 1, 0, 0, 1, 1,
-0.9405758, -0.3268031, -2.456298, 1, 0, 0, 1, 1,
-0.9380255, -0.7804883, -1.65408, 1, 0, 0, 1, 1,
-0.9373649, -0.4050092, -1.154102, 0, 0, 0, 1, 1,
-0.9343059, -1.20904, -1.667406, 0, 0, 0, 1, 1,
-0.9341615, -0.7854692, -5.913661, 0, 0, 0, 1, 1,
-0.9321678, -0.1876846, -1.823535, 0, 0, 0, 1, 1,
-0.9279338, -1.237393, -0.7489241, 0, 0, 0, 1, 1,
-0.9251485, 0.4418281, 0.7668669, 0, 0, 0, 1, 1,
-0.9214793, -0.7419152, -2.119385, 0, 0, 0, 1, 1,
-0.9138919, 0.7426951, -0.431263, 1, 1, 1, 1, 1,
-0.9136338, 0.2867582, -0.5042493, 1, 1, 1, 1, 1,
-0.9099492, 1.490592, -1.322654, 1, 1, 1, 1, 1,
-0.9085756, -1.521275, -2.068667, 1, 1, 1, 1, 1,
-0.9060906, 0.4173036, -2.326266, 1, 1, 1, 1, 1,
-0.9018562, 0.04967722, -1.570764, 1, 1, 1, 1, 1,
-0.9008393, 0.3653416, -1.94552, 1, 1, 1, 1, 1,
-0.8973024, 1.033876, 0.5775173, 1, 1, 1, 1, 1,
-0.8970867, 1.145027, -0.4828231, 1, 1, 1, 1, 1,
-0.8968525, -1.144242, -5.10447, 1, 1, 1, 1, 1,
-0.8958704, -0.3730427, -0.4450722, 1, 1, 1, 1, 1,
-0.8940437, 1.694074, 0.110673, 1, 1, 1, 1, 1,
-0.8914046, 0.1832334, -0.8591976, 1, 1, 1, 1, 1,
-0.8883157, -1.344445, -4.022295, 1, 1, 1, 1, 1,
-0.8854274, -1.343875, -2.00525, 1, 1, 1, 1, 1,
-0.8834816, -1.7083, -2.881482, 0, 0, 1, 1, 1,
-0.8827569, 0.1014223, -1.072283, 1, 0, 0, 1, 1,
-0.8804743, 1.086413, 0.8403236, 1, 0, 0, 1, 1,
-0.877242, 0.04740066, -2.852637, 1, 0, 0, 1, 1,
-0.8747788, -0.5457406, -3.384997, 1, 0, 0, 1, 1,
-0.8692122, -0.8310955, -1.499453, 1, 0, 0, 1, 1,
-0.8684216, -0.4650217, -1.999766, 0, 0, 0, 1, 1,
-0.8663342, -0.3578722, -2.437687, 0, 0, 0, 1, 1,
-0.8660851, 0.1939905, -0.2150354, 0, 0, 0, 1, 1,
-0.8610167, -0.5915754, -0.18317, 0, 0, 0, 1, 1,
-0.8604586, 0.3946472, -1.613077, 0, 0, 0, 1, 1,
-0.8575119, -1.020763, -3.374249, 0, 0, 0, 1, 1,
-0.8421196, -2.194142, -3.813937, 0, 0, 0, 1, 1,
-0.8405373, -0.6508864, -2.723409, 1, 1, 1, 1, 1,
-0.8386285, 0.555739, 0.2359164, 1, 1, 1, 1, 1,
-0.8379123, -0.8819764, -1.84006, 1, 1, 1, 1, 1,
-0.8331422, -0.7437289, -2.326654, 1, 1, 1, 1, 1,
-0.8311579, -1.26974, -4.486713, 1, 1, 1, 1, 1,
-0.8268693, 1.640393, -0.3260498, 1, 1, 1, 1, 1,
-0.8217802, -2.553179, -4.552931, 1, 1, 1, 1, 1,
-0.8207305, -0.7230678, -3.904425, 1, 1, 1, 1, 1,
-0.8141427, 0.439687, -0.5130838, 1, 1, 1, 1, 1,
-0.8134271, 0.3036069, -0.5540647, 1, 1, 1, 1, 1,
-0.8127817, 0.6558713, -0.9839883, 1, 1, 1, 1, 1,
-0.8082269, -0.5684996, -1.225253, 1, 1, 1, 1, 1,
-0.8078829, 0.242772, -2.43632, 1, 1, 1, 1, 1,
-0.8059418, 0.50638, 0.821982, 1, 1, 1, 1, 1,
-0.8046001, -1.490543, -5.438223, 1, 1, 1, 1, 1,
-0.7985423, 0.01817929, -0.1204645, 0, 0, 1, 1, 1,
-0.7971335, 0.2283971, -1.027525, 1, 0, 0, 1, 1,
-0.7886508, -0.9494554, -2.763216, 1, 0, 0, 1, 1,
-0.782752, -0.7170505, -0.8582635, 1, 0, 0, 1, 1,
-0.7775895, 0.6452047, -0.9478828, 1, 0, 0, 1, 1,
-0.7712183, 1.326375, -1.392358, 1, 0, 0, 1, 1,
-0.7680365, -0.5277636, -2.941751, 0, 0, 0, 1, 1,
-0.7678503, 1.417665, 1.064124, 0, 0, 0, 1, 1,
-0.7644466, -0.9104083, -3.166771, 0, 0, 0, 1, 1,
-0.7641047, 0.34467, -1.30241, 0, 0, 0, 1, 1,
-0.756285, 0.6814745, -1.772534, 0, 0, 0, 1, 1,
-0.7522472, -0.4228039, -2.065499, 0, 0, 0, 1, 1,
-0.743806, 0.8857332, -0.5197157, 0, 0, 0, 1, 1,
-0.7383717, 0.004094092, 2.116031, 1, 1, 1, 1, 1,
-0.7374937, 0.5519629, -1.343417, 1, 1, 1, 1, 1,
-0.7337489, -0.7529145, -2.573466, 1, 1, 1, 1, 1,
-0.7326599, 0.8636369, -0.9723404, 1, 1, 1, 1, 1,
-0.7316637, -0.1802611, -0.9156703, 1, 1, 1, 1, 1,
-0.7274431, -0.9784329, -2.071725, 1, 1, 1, 1, 1,
-0.7248556, 0.2894341, -0.1511233, 1, 1, 1, 1, 1,
-0.7234865, -0.371307, -2.600113, 1, 1, 1, 1, 1,
-0.7184522, 0.8472123, 0.4319039, 1, 1, 1, 1, 1,
-0.7139415, -0.1423195, -2.637695, 1, 1, 1, 1, 1,
-0.7132924, 1.283813, -1.718806, 1, 1, 1, 1, 1,
-0.7088545, 0.7060532, 0.1738864, 1, 1, 1, 1, 1,
-0.7053481, 0.2441095, -0.4567082, 1, 1, 1, 1, 1,
-0.7024748, 0.5774981, -0.7218679, 1, 1, 1, 1, 1,
-0.6997023, -0.3149145, -2.521899, 1, 1, 1, 1, 1,
-0.6942897, 0.1141908, -1.148633, 0, 0, 1, 1, 1,
-0.69261, 0.1153057, -2.195121, 1, 0, 0, 1, 1,
-0.6901064, -1.299982, -3.015263, 1, 0, 0, 1, 1,
-0.6856942, 0.09816448, -0.9978342, 1, 0, 0, 1, 1,
-0.6844516, 0.8498262, -0.3268186, 1, 0, 0, 1, 1,
-0.678123, 0.3780023, -2.123928, 1, 0, 0, 1, 1,
-0.6715809, 0.06480407, -0.7291486, 0, 0, 0, 1, 1,
-0.6688149, -1.042887, -1.812906, 0, 0, 0, 1, 1,
-0.6686354, 0.7381123, -2.412808, 0, 0, 0, 1, 1,
-0.663861, 0.5218565, 0.08992004, 0, 0, 0, 1, 1,
-0.6634043, -0.5485772, -1.308812, 0, 0, 0, 1, 1,
-0.6621467, 0.9082862, -0.879708, 0, 0, 0, 1, 1,
-0.661271, -0.9501857, -2.405949, 0, 0, 0, 1, 1,
-0.6595326, -0.8301836, -1.455897, 1, 1, 1, 1, 1,
-0.6586456, 0.8037187, -1.498922, 1, 1, 1, 1, 1,
-0.6578684, 1.669214, 1.454701, 1, 1, 1, 1, 1,
-0.652639, 1.442515, -3.043204, 1, 1, 1, 1, 1,
-0.6510822, -1.359697, -2.710207, 1, 1, 1, 1, 1,
-0.6510014, -0.3354718, -1.313247, 1, 1, 1, 1, 1,
-0.6447911, -0.1502027, -3.665209, 1, 1, 1, 1, 1,
-0.6446601, -1.112961, -1.035124, 1, 1, 1, 1, 1,
-0.6415926, 0.894262, -1.504056, 1, 1, 1, 1, 1,
-0.6411538, -0.2997806, -1.535423, 1, 1, 1, 1, 1,
-0.6411418, 0.2529598, -1.404925, 1, 1, 1, 1, 1,
-0.6373748, -1.421533, -3.542749, 1, 1, 1, 1, 1,
-0.6357434, -0.6940208, -3.89466, 1, 1, 1, 1, 1,
-0.6354881, 0.2273966, -0.4363092, 1, 1, 1, 1, 1,
-0.6297628, 0.1530006, -1.497205, 1, 1, 1, 1, 1,
-0.6279085, 1.971894, 1.021892, 0, 0, 1, 1, 1,
-0.6276516, 0.3510148, -2.462396, 1, 0, 0, 1, 1,
-0.6096038, 0.6847662, -0.8299533, 1, 0, 0, 1, 1,
-0.6094655, 0.008877738, -0.01675182, 1, 0, 0, 1, 1,
-0.6034473, -0.8624486, -0.8602068, 1, 0, 0, 1, 1,
-0.5956249, 0.1562771, -0.2649843, 1, 0, 0, 1, 1,
-0.5949771, 1.316542, -0.006988334, 0, 0, 0, 1, 1,
-0.594057, -0.01630531, -0.6668478, 0, 0, 0, 1, 1,
-0.5891148, -0.6547894, -1.600315, 0, 0, 0, 1, 1,
-0.5873004, -0.50036, -2.519884, 0, 0, 0, 1, 1,
-0.5798166, 0.2120148, -1.994819, 0, 0, 0, 1, 1,
-0.5746831, 0.04358099, -0.3382554, 0, 0, 0, 1, 1,
-0.5741554, -0.8671125, -2.541645, 0, 0, 0, 1, 1,
-0.5720248, -0.3745735, -2.794662, 1, 1, 1, 1, 1,
-0.5714176, 0.9851265, -1.839866, 1, 1, 1, 1, 1,
-0.5713679, -0.1753959, -1.080145, 1, 1, 1, 1, 1,
-0.570678, 0.06347745, -0.05834896, 1, 1, 1, 1, 1,
-0.5694894, 1.684448, -1.067965, 1, 1, 1, 1, 1,
-0.568661, 1.51713, -0.8330815, 1, 1, 1, 1, 1,
-0.5686378, -0.6150732, -2.411436, 1, 1, 1, 1, 1,
-0.56244, 2.105187, -0.1310779, 1, 1, 1, 1, 1,
-0.5575946, 0.5545645, -0.241026, 1, 1, 1, 1, 1,
-0.5519905, 0.8533059, -0.476166, 1, 1, 1, 1, 1,
-0.5509016, 1.625776, 1.138022, 1, 1, 1, 1, 1,
-0.549823, 0.4322259, -2.319993, 1, 1, 1, 1, 1,
-0.5472506, -1.050113, -3.364486, 1, 1, 1, 1, 1,
-0.5428578, -0.1959156, -0.7443119, 1, 1, 1, 1, 1,
-0.5426931, 0.8769237, -1.438378, 1, 1, 1, 1, 1,
-0.5376365, 1.227337, -1.28794, 0, 0, 1, 1, 1,
-0.5358058, -0.7162291, -1.356972, 1, 0, 0, 1, 1,
-0.5335058, -0.5502762, -3.181037, 1, 0, 0, 1, 1,
-0.5311533, 0.7658506, -0.6735309, 1, 0, 0, 1, 1,
-0.5288904, 0.2961777, -0.6220286, 1, 0, 0, 1, 1,
-0.51592, -0.8358362, -1.942535, 1, 0, 0, 1, 1,
-0.507564, -1.796978, -0.4451604, 0, 0, 0, 1, 1,
-0.5074744, -1.899225, -4.108681, 0, 0, 0, 1, 1,
-0.4960742, 0.5929016, -1.127158, 0, 0, 0, 1, 1,
-0.4925528, -0.6408815, -1.401031, 0, 0, 0, 1, 1,
-0.4919383, -0.03983733, -1.148093, 0, 0, 0, 1, 1,
-0.4911343, -0.4018724, -1.994317, 0, 0, 0, 1, 1,
-0.4890578, -1.214869, -2.336105, 0, 0, 0, 1, 1,
-0.4887927, 1.300222, 0.7851614, 1, 1, 1, 1, 1,
-0.4835694, -0.6964644, -1.584572, 1, 1, 1, 1, 1,
-0.4831182, 0.7625323, 0.9827136, 1, 1, 1, 1, 1,
-0.4813626, 0.2414535, -1.780239, 1, 1, 1, 1, 1,
-0.4810893, -0.6211002, -3.879591, 1, 1, 1, 1, 1,
-0.4810452, -1.508724, -3.039616, 1, 1, 1, 1, 1,
-0.4773457, 0.2237406, -2.312754, 1, 1, 1, 1, 1,
-0.4759773, -0.3570061, -1.782021, 1, 1, 1, 1, 1,
-0.4749335, 1.443614, -0.2053522, 1, 1, 1, 1, 1,
-0.473302, -0.5833263, -1.905038, 1, 1, 1, 1, 1,
-0.4728028, 1.256692, -0.429484, 1, 1, 1, 1, 1,
-0.4710178, -1.517518, -3.563707, 1, 1, 1, 1, 1,
-0.4705007, -1.364946, -3.775127, 1, 1, 1, 1, 1,
-0.4700149, 1.048887, -0.06214251, 1, 1, 1, 1, 1,
-0.4618061, 1.975301, 0.5987179, 1, 1, 1, 1, 1,
-0.4591744, -0.4126921, -3.517315, 0, 0, 1, 1, 1,
-0.4568606, 0.2864576, -0.5664272, 1, 0, 0, 1, 1,
-0.4568215, 1.4163, 1.321048, 1, 0, 0, 1, 1,
-0.4559397, -0.4469568, -4.628681, 1, 0, 0, 1, 1,
-0.4540624, 0.9379743, 0.6411818, 1, 0, 0, 1, 1,
-0.4520055, -0.5164917, -4.441935, 1, 0, 0, 1, 1,
-0.4511636, -0.6546835, -1.44329, 0, 0, 0, 1, 1,
-0.4510208, 0.5050378, 0.7254958, 0, 0, 0, 1, 1,
-0.4503409, 0.4369545, 0.631483, 0, 0, 0, 1, 1,
-0.4500816, -1.199744, -4.23599, 0, 0, 0, 1, 1,
-0.4497128, -0.09559868, -3.26913, 0, 0, 0, 1, 1,
-0.4470673, -1.040645, -3.716393, 0, 0, 0, 1, 1,
-0.4467791, -1.125016, -3.560097, 0, 0, 0, 1, 1,
-0.4422818, -1.403747, -3.466705, 1, 1, 1, 1, 1,
-0.4397273, -0.9008651, -4.506242, 1, 1, 1, 1, 1,
-0.4377417, -0.06105474, -2.181864, 1, 1, 1, 1, 1,
-0.4321582, -0.2273582, -1.074858, 1, 1, 1, 1, 1,
-0.4303805, -0.4146166, -2.757886, 1, 1, 1, 1, 1,
-0.4294041, 0.8511267, 0.2705165, 1, 1, 1, 1, 1,
-0.4287359, 0.5534437, -0.4569559, 1, 1, 1, 1, 1,
-0.4280199, 2.419995, -1.321128, 1, 1, 1, 1, 1,
-0.4268387, -1.607644, -1.993762, 1, 1, 1, 1, 1,
-0.4266118, -1.135572, -1.940346, 1, 1, 1, 1, 1,
-0.4240263, -0.8245464, -2.471517, 1, 1, 1, 1, 1,
-0.4207971, 1.554231, 0.9550492, 1, 1, 1, 1, 1,
-0.4204127, 0.2098477, -0.8883111, 1, 1, 1, 1, 1,
-0.4118507, 0.1394639, -0.2522689, 1, 1, 1, 1, 1,
-0.4079842, 0.9094736, 0.2574017, 1, 1, 1, 1, 1,
-0.4066424, -0.254945, -2.476905, 0, 0, 1, 1, 1,
-0.402785, 1.721941, -0.919907, 1, 0, 0, 1, 1,
-0.4005148, 0.8999712, 1.128685, 1, 0, 0, 1, 1,
-0.3941535, 0.2138518, 0.9250777, 1, 0, 0, 1, 1,
-0.3908686, 0.637996, -0.09417853, 1, 0, 0, 1, 1,
-0.3800861, -0.7016969, -3.729588, 1, 0, 0, 1, 1,
-0.3792628, -0.7453446, -2.255065, 0, 0, 0, 1, 1,
-0.3782818, 0.7917395, -0.5318993, 0, 0, 0, 1, 1,
-0.3771259, 0.06252827, -1.062608, 0, 0, 0, 1, 1,
-0.3737299, 1.048084, -0.7106784, 0, 0, 0, 1, 1,
-0.3680897, -0.1212783, -1.951206, 0, 0, 0, 1, 1,
-0.3676496, 0.3162704, -2.071966, 0, 0, 0, 1, 1,
-0.3663541, -0.5124086, -3.589321, 0, 0, 0, 1, 1,
-0.3660255, 1.259943, 0.5479417, 1, 1, 1, 1, 1,
-0.3655582, -0.4202271, -1.849224, 1, 1, 1, 1, 1,
-0.3543567, -0.1092384, -2.574268, 1, 1, 1, 1, 1,
-0.351327, 0.06895448, -1.757191, 1, 1, 1, 1, 1,
-0.3496571, -0.5882339, -2.83048, 1, 1, 1, 1, 1,
-0.3485445, 0.4446941, -0.6044956, 1, 1, 1, 1, 1,
-0.3414063, 0.5480124, 1.347313, 1, 1, 1, 1, 1,
-0.3413893, 0.5635373, 1.127842, 1, 1, 1, 1, 1,
-0.3407041, 0.1662031, -1.110546, 1, 1, 1, 1, 1,
-0.3354821, -0.3789458, -2.4245, 1, 1, 1, 1, 1,
-0.3353397, 0.09399518, -0.1287131, 1, 1, 1, 1, 1,
-0.3335138, -0.2293301, -2.552666, 1, 1, 1, 1, 1,
-0.3300437, 0.4362108, -2.218048, 1, 1, 1, 1, 1,
-0.3294992, -0.748882, -2.943652, 1, 1, 1, 1, 1,
-0.3289025, -0.5189841, -2.469085, 1, 1, 1, 1, 1,
-0.3283044, -1.167347, -2.061474, 0, 0, 1, 1, 1,
-0.3281993, 0.6348718, -0.5418926, 1, 0, 0, 1, 1,
-0.3272805, -0.9988111, -2.424385, 1, 0, 0, 1, 1,
-0.3159351, 1.396853, -1.752102, 1, 0, 0, 1, 1,
-0.315847, -0.1075195, -1.603818, 1, 0, 0, 1, 1,
-0.3144361, 1.301178, 1.231081, 1, 0, 0, 1, 1,
-0.3099034, -1.058283, -2.321715, 0, 0, 0, 1, 1,
-0.306391, 1.093422, -0.1221891, 0, 0, 0, 1, 1,
-0.3054296, 0.03488862, -0.683813, 0, 0, 0, 1, 1,
-0.3035121, -0.1382425, -1.317221, 0, 0, 0, 1, 1,
-0.2996429, -0.3918984, -2.228697, 0, 0, 0, 1, 1,
-0.2935955, -0.3235349, -2.56447, 0, 0, 0, 1, 1,
-0.2910517, 1.136677, 0.9678951, 0, 0, 0, 1, 1,
-0.2909881, 0.4058184, -1.421914, 1, 1, 1, 1, 1,
-0.2902667, 0.4699261, 0.9744883, 1, 1, 1, 1, 1,
-0.2870346, -0.5010025, -2.758309, 1, 1, 1, 1, 1,
-0.2851843, -0.04042277, -0.1227518, 1, 1, 1, 1, 1,
-0.2769007, -0.4434247, -1.379019, 1, 1, 1, 1, 1,
-0.2768137, 1.15414, -0.5669081, 1, 1, 1, 1, 1,
-0.2729471, 1.279893, -0.7769219, 1, 1, 1, 1, 1,
-0.2719514, -0.6878374, -0.7063728, 1, 1, 1, 1, 1,
-0.2669036, 0.05929343, -0.4723342, 1, 1, 1, 1, 1,
-0.2631267, -0.01894919, -1.927537, 1, 1, 1, 1, 1,
-0.2563983, -0.6329187, -2.923032, 1, 1, 1, 1, 1,
-0.25431, 0.3216651, -0.03974903, 1, 1, 1, 1, 1,
-0.250881, -1.763052, -3.597905, 1, 1, 1, 1, 1,
-0.2500866, -0.9748399, -2.292371, 1, 1, 1, 1, 1,
-0.2497571, -0.1700857, -1.079941, 1, 1, 1, 1, 1,
-0.2459733, -0.6549796, -3.77505, 0, 0, 1, 1, 1,
-0.2445131, 0.1915581, -0.3827141, 1, 0, 0, 1, 1,
-0.232883, -0.04769512, -2.527673, 1, 0, 0, 1, 1,
-0.2273305, -0.4398203, -3.557865, 1, 0, 0, 1, 1,
-0.2221567, -0.7636096, -0.3304393, 1, 0, 0, 1, 1,
-0.2196472, -0.9913409, -3.417303, 1, 0, 0, 1, 1,
-0.2182651, 1.790965, -2.950274, 0, 0, 0, 1, 1,
-0.2178486, 0.01493834, 0.1845737, 0, 0, 0, 1, 1,
-0.2132692, -0.3380605, -1.69121, 0, 0, 0, 1, 1,
-0.2113365, 1.111418, -1.755219, 0, 0, 0, 1, 1,
-0.2108682, -0.8217861, -3.891221, 0, 0, 0, 1, 1,
-0.2076647, -1.28359, -2.120722, 0, 0, 0, 1, 1,
-0.2032892, 2.691071, -1.803172, 0, 0, 0, 1, 1,
-0.2032747, -0.260585, -1.697448, 1, 1, 1, 1, 1,
-0.1960668, 1.058657, -0.4580792, 1, 1, 1, 1, 1,
-0.1957896, -1.555438, -2.452116, 1, 1, 1, 1, 1,
-0.1956053, 0.9000682, -1.890566, 1, 1, 1, 1, 1,
-0.1944303, -1.230268, -2.953801, 1, 1, 1, 1, 1,
-0.1907315, -0.2276373, -3.733877, 1, 1, 1, 1, 1,
-0.189391, 1.547966, -0.9286473, 1, 1, 1, 1, 1,
-0.1873804, 1.685432, 0.04608656, 1, 1, 1, 1, 1,
-0.1865695, -0.2962913, -3.904634, 1, 1, 1, 1, 1,
-0.1822173, 0.7907013, -0.316574, 1, 1, 1, 1, 1,
-0.181375, -0.3282373, -3.530243, 1, 1, 1, 1, 1,
-0.1801687, -0.6307002, -0.2751102, 1, 1, 1, 1, 1,
-0.1720359, 0.2814161, -0.9155174, 1, 1, 1, 1, 1,
-0.1698144, -0.6367915, -4.289074, 1, 1, 1, 1, 1,
-0.1688468, -1.08654, -3.26258, 1, 1, 1, 1, 1,
-0.1662501, -0.6367633, -4.435326, 0, 0, 1, 1, 1,
-0.1656035, 1.119645, -0.105724, 1, 0, 0, 1, 1,
-0.1654135, -0.2577061, -3.126668, 1, 0, 0, 1, 1,
-0.1574267, 0.01957824, -1.7766, 1, 0, 0, 1, 1,
-0.1567243, 0.4556706, 0.03864044, 1, 0, 0, 1, 1,
-0.1516235, 0.1410217, 0.4749958, 1, 0, 0, 1, 1,
-0.1501361, 0.1284588, -0.7374517, 0, 0, 0, 1, 1,
-0.1469318, -3.171346, -5.857179, 0, 0, 0, 1, 1,
-0.1459314, 0.005133601, -1.929308, 0, 0, 0, 1, 1,
-0.1407901, 1.645511, 0.2008579, 0, 0, 0, 1, 1,
-0.1358072, 0.7156649, -0.7081144, 0, 0, 0, 1, 1,
-0.1324218, 0.07240183, -0.3610292, 0, 0, 0, 1, 1,
-0.1316032, -1.724548, -2.300916, 0, 0, 0, 1, 1,
-0.1279249, 0.02118889, -3.97161, 1, 1, 1, 1, 1,
-0.1272825, 0.5723459, 0.1709001, 1, 1, 1, 1, 1,
-0.1271661, 0.7964252, -0.4613557, 1, 1, 1, 1, 1,
-0.1221397, 1.126729, 0.5615956, 1, 1, 1, 1, 1,
-0.1220725, -1.51645, -2.838202, 1, 1, 1, 1, 1,
-0.1127388, -0.8737261, -4.026283, 1, 1, 1, 1, 1,
-0.1113883, 0.6674098, 1.39795, 1, 1, 1, 1, 1,
-0.1050685, -1.380947, -3.828851, 1, 1, 1, 1, 1,
-0.09742467, -1.638679, -2.786346, 1, 1, 1, 1, 1,
-0.09689808, -1.67707, -2.004209, 1, 1, 1, 1, 1,
-0.09254798, 0.3609636, -0.9244736, 1, 1, 1, 1, 1,
-0.09200215, -0.901776, -2.370949, 1, 1, 1, 1, 1,
-0.08964868, -0.6783456, -1.727693, 1, 1, 1, 1, 1,
-0.0893122, 0.4309918, 1.738528, 1, 1, 1, 1, 1,
-0.08737206, -0.1472452, -2.794454, 1, 1, 1, 1, 1,
-0.08732357, 0.5362148, 0.593631, 0, 0, 1, 1, 1,
-0.08670218, 1.102946, 0.3998383, 1, 0, 0, 1, 1,
-0.08491001, 0.5360038, -1.796091, 1, 0, 0, 1, 1,
-0.07960868, 0.1584539, -1.275953, 1, 0, 0, 1, 1,
-0.07747417, 2.112087, 1.52252, 1, 0, 0, 1, 1,
-0.077299, -0.3318845, -1.981148, 1, 0, 0, 1, 1,
-0.06618243, -0.3423245, -2.702146, 0, 0, 0, 1, 1,
-0.06601709, 1.116858, 0.3223564, 0, 0, 0, 1, 1,
-0.06567567, -1.629687, -3.51943, 0, 0, 0, 1, 1,
-0.06343455, 0.2418622, -1.394201, 0, 0, 0, 1, 1,
-0.0624986, -2.255471, -2.861919, 0, 0, 0, 1, 1,
-0.05926238, -1.974335, -4.446073, 0, 0, 0, 1, 1,
-0.0543895, -0.1092516, -2.731341, 0, 0, 0, 1, 1,
-0.05353197, 0.9211519, -0.5925646, 1, 1, 1, 1, 1,
-0.0532306, 0.363925, -0.4211776, 1, 1, 1, 1, 1,
-0.05296164, 1.027631, 0.4435723, 1, 1, 1, 1, 1,
-0.05226528, 0.530322, 0.1754812, 1, 1, 1, 1, 1,
-0.05081417, 0.1494977, -0.3983214, 1, 1, 1, 1, 1,
-0.04961861, -0.3499492, -3.428385, 1, 1, 1, 1, 1,
-0.04927303, -0.885334, -2.030097, 1, 1, 1, 1, 1,
-0.04652636, -0.2464551, -1.928595, 1, 1, 1, 1, 1,
-0.04148722, -0.5165534, -3.257182, 1, 1, 1, 1, 1,
-0.03588935, -0.2846347, -3.65695, 1, 1, 1, 1, 1,
-0.03199003, -0.3196433, -2.196384, 1, 1, 1, 1, 1,
-0.02741039, -1.16692, -3.069921, 1, 1, 1, 1, 1,
-0.02247651, 0.798625, -0.1454206, 1, 1, 1, 1, 1,
-0.02088309, -0.361339, -3.134563, 1, 1, 1, 1, 1,
-0.008383215, -0.8472666, -2.778697, 1, 1, 1, 1, 1,
-0.006776388, -0.1086237, -3.533484, 0, 0, 1, 1, 1,
-0.004485518, -0.8769664, -3.719815, 1, 0, 0, 1, 1,
-0.004348855, 0.7434913, -0.597909, 1, 0, 0, 1, 1,
-0.003102983, -0.3406708, -4.854953, 1, 0, 0, 1, 1,
-0.002591598, 1.493632, 0.2056693, 1, 0, 0, 1, 1,
-0.001415373, 0.04373189, 1.050978, 1, 0, 0, 1, 1,
-0.001332696, 1.688368, 0.6583456, 0, 0, 0, 1, 1,
0.003517215, 0.5159529, -0.7718658, 0, 0, 0, 1, 1,
0.007361805, 1.294643, -0.5328101, 0, 0, 0, 1, 1,
0.009166883, -0.5980741, 3.702215, 0, 0, 0, 1, 1,
0.009427474, -0.8509367, 4.0604, 0, 0, 0, 1, 1,
0.01096621, 1.218397, 0.3460959, 0, 0, 0, 1, 1,
0.01266559, -1.542134, 3.382956, 0, 0, 0, 1, 1,
0.01273882, -2.774241, 3.950101, 1, 1, 1, 1, 1,
0.01786193, 0.8313329, 0.6144642, 1, 1, 1, 1, 1,
0.01981118, -0.8644503, 4.977123, 1, 1, 1, 1, 1,
0.02162929, 0.488167, 1.200803, 1, 1, 1, 1, 1,
0.02577251, -0.9915453, 2.573695, 1, 1, 1, 1, 1,
0.03912279, 0.7258952, 1.258157, 1, 1, 1, 1, 1,
0.04165324, 0.2882083, 0.1617655, 1, 1, 1, 1, 1,
0.04594515, -1.332766, 3.582157, 1, 1, 1, 1, 1,
0.05153283, -1.135391, 3.5055, 1, 1, 1, 1, 1,
0.05195197, -0.2628664, 1.359568, 1, 1, 1, 1, 1,
0.05215475, -0.3034663, 1.577184, 1, 1, 1, 1, 1,
0.05290163, -0.8719819, 3.143452, 1, 1, 1, 1, 1,
0.05468722, -1.333637, 2.731112, 1, 1, 1, 1, 1,
0.05563591, -1.857047, 4.777023, 1, 1, 1, 1, 1,
0.05767915, 0.9802046, -0.7397755, 1, 1, 1, 1, 1,
0.06444483, -0.5970468, 2.949539, 0, 0, 1, 1, 1,
0.06487054, -0.2938446, 3.673012, 1, 0, 0, 1, 1,
0.06669561, -0.5305585, 3.642803, 1, 0, 0, 1, 1,
0.06861802, 1.070451, -2.353227, 1, 0, 0, 1, 1,
0.07067163, -0.2371713, 3.390366, 1, 0, 0, 1, 1,
0.08209593, 0.2710056, 1.952308, 1, 0, 0, 1, 1,
0.08291335, 0.009692173, 2.605111, 0, 0, 0, 1, 1,
0.08403554, -0.2259997, 4.37702, 0, 0, 0, 1, 1,
0.08796895, 0.538868, 0.6772156, 0, 0, 0, 1, 1,
0.08803119, -0.06727049, 3.688777, 0, 0, 0, 1, 1,
0.08923553, -0.1813183, 2.700587, 0, 0, 0, 1, 1,
0.09536955, -0.4148186, 4.140064, 0, 0, 0, 1, 1,
0.09680638, -1.738174, 4.032054, 0, 0, 0, 1, 1,
0.09706858, -0.4368248, 4.134096, 1, 1, 1, 1, 1,
0.09862351, -2.536416, 3.057978, 1, 1, 1, 1, 1,
0.102484, -0.02602504, 0.3826631, 1, 1, 1, 1, 1,
0.104116, 0.02339231, -0.002795437, 1, 1, 1, 1, 1,
0.1049072, -0.4090366, 2.684319, 1, 1, 1, 1, 1,
0.1070788, -0.7642002, 2.275772, 1, 1, 1, 1, 1,
0.1103744, -1.517328, 3.328467, 1, 1, 1, 1, 1,
0.1140416, 0.6512473, 0.6191044, 1, 1, 1, 1, 1,
0.1156195, 0.09034765, -0.04821843, 1, 1, 1, 1, 1,
0.1215367, -1.822582, 4.500137, 1, 1, 1, 1, 1,
0.1349519, 0.5242465, 1.469187, 1, 1, 1, 1, 1,
0.1352042, -2.402779, 5.137815, 1, 1, 1, 1, 1,
0.1386067, 0.5072018, 0.3361617, 1, 1, 1, 1, 1,
0.1388286, 0.5317247, 0.9718225, 1, 1, 1, 1, 1,
0.1409666, -0.004251065, 0.245617, 1, 1, 1, 1, 1,
0.1457845, -0.4654329, 4.453827, 0, 0, 1, 1, 1,
0.1479738, 0.515757, 0.5026236, 1, 0, 0, 1, 1,
0.1485065, 0.2416053, -0.5080692, 1, 0, 0, 1, 1,
0.1494234, -0.07275195, 2.039471, 1, 0, 0, 1, 1,
0.1494731, 0.5208113, 1.592768, 1, 0, 0, 1, 1,
0.1519904, -0.5825481, 3.087593, 1, 0, 0, 1, 1,
0.1555105, 0.6004685, 0.3394557, 0, 0, 0, 1, 1,
0.1557078, -0.6628598, 3.07517, 0, 0, 0, 1, 1,
0.1597445, 1.300081, 0.3467917, 0, 0, 0, 1, 1,
0.1617944, 0.844539, -0.4064503, 0, 0, 0, 1, 1,
0.1622298, 0.6150874, 0.2622105, 0, 0, 0, 1, 1,
0.1624257, -0.115766, 2.969126, 0, 0, 0, 1, 1,
0.168472, -1.261826, 3.696076, 0, 0, 0, 1, 1,
0.1712028, -0.5940933, 3.046409, 1, 1, 1, 1, 1,
0.1765168, -0.3392857, 1.381185, 1, 1, 1, 1, 1,
0.1768495, 0.2271567, 0.3097532, 1, 1, 1, 1, 1,
0.1813653, 1.269789, -1.888687, 1, 1, 1, 1, 1,
0.1823105, -1.600614, 2.884782, 1, 1, 1, 1, 1,
0.1836581, 0.6018454, 1.458504, 1, 1, 1, 1, 1,
0.1847481, 0.8112483, -0.02473676, 1, 1, 1, 1, 1,
0.1858744, -0.1009777, 2.161572, 1, 1, 1, 1, 1,
0.1867087, 0.01395203, 1.759837, 1, 1, 1, 1, 1,
0.187699, -0.6745, 1.610541, 1, 1, 1, 1, 1,
0.1878476, 1.315486, 0.9785089, 1, 1, 1, 1, 1,
0.189447, -0.2315892, 1.32444, 1, 1, 1, 1, 1,
0.1906236, -1.427013, 5.399238, 1, 1, 1, 1, 1,
0.1910897, -0.4772465, 3.55109, 1, 1, 1, 1, 1,
0.1922976, -0.05280866, 0.7996215, 1, 1, 1, 1, 1,
0.1955767, -0.5487825, 3.567334, 0, 0, 1, 1, 1,
0.1963655, -0.5599883, 3.738177, 1, 0, 0, 1, 1,
0.1990852, -0.6888086, 2.988726, 1, 0, 0, 1, 1,
0.204801, 0.8092642, 1.100207, 1, 0, 0, 1, 1,
0.2051111, 0.2481473, -0.3440839, 1, 0, 0, 1, 1,
0.2057767, -1.535968, 3.156757, 1, 0, 0, 1, 1,
0.2072824, -0.1588454, 1.906082, 0, 0, 0, 1, 1,
0.2075141, -1.755051, 2.719485, 0, 0, 0, 1, 1,
0.2075288, 2.633589, -1.340779, 0, 0, 0, 1, 1,
0.2262332, 1.772417, 1.477746, 0, 0, 0, 1, 1,
0.226255, 0.9387956, -1.258341, 0, 0, 0, 1, 1,
0.226299, -1.966675, 3.00674, 0, 0, 0, 1, 1,
0.2265606, -1.312204, 3.895807, 0, 0, 0, 1, 1,
0.2409843, 0.3821084, 1.945977, 1, 1, 1, 1, 1,
0.243361, -0.239724, 2.186769, 1, 1, 1, 1, 1,
0.2446925, 0.00236559, 2.479931, 1, 1, 1, 1, 1,
0.2490868, 0.4907326, -0.5109639, 1, 1, 1, 1, 1,
0.2507443, -1.203856, 1.720414, 1, 1, 1, 1, 1,
0.2520333, 1.568071, -1.39657, 1, 1, 1, 1, 1,
0.254563, 1.030938, 0.001499001, 1, 1, 1, 1, 1,
0.2572791, -0.8343047, 0.6831216, 1, 1, 1, 1, 1,
0.2575355, -0.3735652, 2.936877, 1, 1, 1, 1, 1,
0.2585818, 1.414, 1.592927, 1, 1, 1, 1, 1,
0.2587088, 0.2258817, 0.6456592, 1, 1, 1, 1, 1,
0.2594869, -2.482344, 2.992481, 1, 1, 1, 1, 1,
0.2632397, 1.001701, 2.632679, 1, 1, 1, 1, 1,
0.2674179, -1.810691, 2.415881, 1, 1, 1, 1, 1,
0.2713628, -1.194946, 2.731416, 1, 1, 1, 1, 1,
0.2717435, 0.8122885, -0.1817401, 0, 0, 1, 1, 1,
0.2739525, -0.3128676, 2.467084, 1, 0, 0, 1, 1,
0.2749065, -0.244126, 1.643467, 1, 0, 0, 1, 1,
0.2758446, 0.8760467, 1.296373, 1, 0, 0, 1, 1,
0.280765, -2.359635, 3.752698, 1, 0, 0, 1, 1,
0.2811798, 0.9093305, -0.009071873, 1, 0, 0, 1, 1,
0.2861103, 0.5300508, 0.1537758, 0, 0, 0, 1, 1,
0.2865843, -0.7901427, 3.051599, 0, 0, 0, 1, 1,
0.2967577, -0.7199616, 2.159129, 0, 0, 0, 1, 1,
0.300946, 0.9095427, 0.0467831, 0, 0, 0, 1, 1,
0.3022889, 1.769354, -0.6200026, 0, 0, 0, 1, 1,
0.3049265, -1.054893, 2.566407, 0, 0, 0, 1, 1,
0.3139196, 0.5467462, 0.3523083, 0, 0, 0, 1, 1,
0.3216653, 0.9813287, 0.4786921, 1, 1, 1, 1, 1,
0.3248807, -0.1292945, 0.9896922, 1, 1, 1, 1, 1,
0.3273344, -0.4503704, 1.47509, 1, 1, 1, 1, 1,
0.3293541, 1.407928, 0.1252419, 1, 1, 1, 1, 1,
0.3295048, -1.215294, 2.491181, 1, 1, 1, 1, 1,
0.3322049, -0.6151578, 2.714818, 1, 1, 1, 1, 1,
0.3464557, 0.7633003, 1.099049, 1, 1, 1, 1, 1,
0.347269, 0.1392187, 3.072239, 1, 1, 1, 1, 1,
0.3474179, -0.4371412, 1.332764, 1, 1, 1, 1, 1,
0.3495212, -0.6517749, 2.6669, 1, 1, 1, 1, 1,
0.3509074, 0.2852516, -0.01921695, 1, 1, 1, 1, 1,
0.3511965, 0.06614897, 1.212277, 1, 1, 1, 1, 1,
0.354341, -0.2208899, 3.001299, 1, 1, 1, 1, 1,
0.3547313, 0.1277292, 3.501203, 1, 1, 1, 1, 1,
0.3617477, 0.3054004, 0.5259069, 1, 1, 1, 1, 1,
0.362668, 0.3235383, 2.406401, 0, 0, 1, 1, 1,
0.3654811, -0.7185587, 2.301704, 1, 0, 0, 1, 1,
0.3679831, 0.5065102, -0.4097195, 1, 0, 0, 1, 1,
0.3680075, -0.6032776, 1.616306, 1, 0, 0, 1, 1,
0.3708963, -0.1021465, -0.2799616, 1, 0, 0, 1, 1,
0.3722519, -0.9196094, 3.592606, 1, 0, 0, 1, 1,
0.3759551, -1.267271, 4.455132, 0, 0, 0, 1, 1,
0.37827, -1.47023, 3.862193, 0, 0, 0, 1, 1,
0.3794928, -0.01574926, 1.779067, 0, 0, 0, 1, 1,
0.3802323, 0.6507534, 1.052843, 0, 0, 0, 1, 1,
0.3846318, -0.8827772, 1.609646, 0, 0, 0, 1, 1,
0.3862992, 0.7005121, 3.706505, 0, 0, 0, 1, 1,
0.3885173, 0.689719, -0.5862214, 0, 0, 0, 1, 1,
0.3894017, -0.4298791, 3.565473, 1, 1, 1, 1, 1,
0.3918642, -0.970954, 2.235677, 1, 1, 1, 1, 1,
0.3980946, 1.011978, -0.3898439, 1, 1, 1, 1, 1,
0.4003368, 1.426556, -0.1115968, 1, 1, 1, 1, 1,
0.4014159, 0.4500644, -0.4339522, 1, 1, 1, 1, 1,
0.4016928, -0.6133119, 2.739453, 1, 1, 1, 1, 1,
0.4055071, 0.2331748, 1.316582, 1, 1, 1, 1, 1,
0.4069063, 0.008856443, 1.596441, 1, 1, 1, 1, 1,
0.4100624, -0.656233, 2.694746, 1, 1, 1, 1, 1,
0.4133489, -0.1786145, 1.352078, 1, 1, 1, 1, 1,
0.4134145, 0.8871216, 0.3659241, 1, 1, 1, 1, 1,
0.4164447, -0.08385813, 1.924532, 1, 1, 1, 1, 1,
0.417858, 1.503035, 0.1727871, 1, 1, 1, 1, 1,
0.4199367, -0.6649662, 1.399241, 1, 1, 1, 1, 1,
0.4200384, -1.037827, 3.54271, 1, 1, 1, 1, 1,
0.4207112, 2.336772, -0.4459457, 0, 0, 1, 1, 1,
0.4289697, 0.9750394, -0.7888309, 1, 0, 0, 1, 1,
0.4327035, 1.944249, 0.9210603, 1, 0, 0, 1, 1,
0.4333695, 0.8711782, 0.5772398, 1, 0, 0, 1, 1,
0.4347734, 0.008196316, 3.453586, 1, 0, 0, 1, 1,
0.4360259, -0.7769337, 1.276674, 1, 0, 0, 1, 1,
0.4411974, -0.3317167, 1.452647, 0, 0, 0, 1, 1,
0.443972, 0.5717673, 1.677917, 0, 0, 0, 1, 1,
0.4443076, 0.6819558, 1.280531, 0, 0, 0, 1, 1,
0.4478065, 0.4811413, 1.339584, 0, 0, 0, 1, 1,
0.448088, 0.2390647, 2.15714, 0, 0, 0, 1, 1,
0.4519753, -1.123186, 4.558057, 0, 0, 0, 1, 1,
0.4525146, -1.782157, 2.030695, 0, 0, 0, 1, 1,
0.457592, -1.187529, 0.5343575, 1, 1, 1, 1, 1,
0.4624658, 0.4598013, -0.6612178, 1, 1, 1, 1, 1,
0.4649503, 0.7799664, 1.113688, 1, 1, 1, 1, 1,
0.4659556, -0.4156419, 2.645746, 1, 1, 1, 1, 1,
0.4714746, -0.1797287, 2.936911, 1, 1, 1, 1, 1,
0.4725286, -1.91216, 3.217805, 1, 1, 1, 1, 1,
0.4731776, 1.478549, -0.205508, 1, 1, 1, 1, 1,
0.4733928, -0.2103277, 1.038054, 1, 1, 1, 1, 1,
0.4785471, 0.4496939, 2.09941, 1, 1, 1, 1, 1,
0.4819173, -0.3762494, -0.5942156, 1, 1, 1, 1, 1,
0.4819401, 0.5206472, -0.5828716, 1, 1, 1, 1, 1,
0.5024694, -1.335931, 3.472244, 1, 1, 1, 1, 1,
0.5038748, -0.2523463, 4.16614, 1, 1, 1, 1, 1,
0.5073666, -0.8371281, 2.503491, 1, 1, 1, 1, 1,
0.5077626, -1.376902, 2.196592, 1, 1, 1, 1, 1,
0.5192925, -0.06430153, 2.19841, 0, 0, 1, 1, 1,
0.5224286, -1.780794, 2.925907, 1, 0, 0, 1, 1,
0.5245783, -0.4472845, 3.039074, 1, 0, 0, 1, 1,
0.5254167, -0.5410886, 2.595421, 1, 0, 0, 1, 1,
0.5259432, -1.937289, 2.637783, 1, 0, 0, 1, 1,
0.5283672, 1.100083, -0.2891079, 1, 0, 0, 1, 1,
0.5285321, 0.5411271, 2.158773, 0, 0, 0, 1, 1,
0.5305378, 0.7148443, 0.5355098, 0, 0, 0, 1, 1,
0.5317316, -0.3019851, 2.70223, 0, 0, 0, 1, 1,
0.5329337, 1.433132, 0.8223496, 0, 0, 0, 1, 1,
0.5373433, 0.007774898, -0.04604658, 0, 0, 0, 1, 1,
0.5373951, 0.03860772, 1.917343, 0, 0, 0, 1, 1,
0.5423837, 0.2466217, 1.876294, 0, 0, 0, 1, 1,
0.5510257, 0.01570037, 1.684907, 1, 1, 1, 1, 1,
0.5707212, 1.118531, 1.354662, 1, 1, 1, 1, 1,
0.5709054, 0.8411025, -1.292347, 1, 1, 1, 1, 1,
0.5712487, 0.9068261, 0.3774364, 1, 1, 1, 1, 1,
0.5909015, 0.4202449, 0.02945066, 1, 1, 1, 1, 1,
0.5912368, -2.048108, 3.668746, 1, 1, 1, 1, 1,
0.6002656, -2.095563, 3.320746, 1, 1, 1, 1, 1,
0.607219, -0.1014116, -0.281341, 1, 1, 1, 1, 1,
0.6116802, 1.925239, -0.7564958, 1, 1, 1, 1, 1,
0.6140235, 0.5639775, 0.09846906, 1, 1, 1, 1, 1,
0.6151426, 0.4989857, -0.5523892, 1, 1, 1, 1, 1,
0.6153641, -0.4086705, 1.367399, 1, 1, 1, 1, 1,
0.617403, -0.08942367, 1.065395, 1, 1, 1, 1, 1,
0.6259441, -1.190405, 2.909589, 1, 1, 1, 1, 1,
0.6263148, 0.9506575, 2.599755, 1, 1, 1, 1, 1,
0.6270521, 0.7599756, 0.4069512, 0, 0, 1, 1, 1,
0.6292914, 1.909216, -0.1240568, 1, 0, 0, 1, 1,
0.6322288, 0.9938594, 0.3951329, 1, 0, 0, 1, 1,
0.6370373, 0.6327117, 1.911311, 1, 0, 0, 1, 1,
0.6389228, -0.2608302, 3.182446, 1, 0, 0, 1, 1,
0.6393273, -0.4464809, 3.446898, 1, 0, 0, 1, 1,
0.6395408, 1.864807, -1.628175, 0, 0, 0, 1, 1,
0.6397901, 0.4916112, 2.518258, 0, 0, 0, 1, 1,
0.6435474, 1.09745, 0.9213089, 0, 0, 0, 1, 1,
0.6455056, 0.671237, 0.4966315, 0, 0, 0, 1, 1,
0.6518248, -1.28717, 3.249168, 0, 0, 0, 1, 1,
0.6524307, 0.1197931, 1.685595, 0, 0, 0, 1, 1,
0.6552302, 1.479982, 0.9519207, 0, 0, 0, 1, 1,
0.6565879, 2.162935, 0.498191, 1, 1, 1, 1, 1,
0.6578574, 1.364323, 0.7158584, 1, 1, 1, 1, 1,
0.6585118, -1.205572, 2.98374, 1, 1, 1, 1, 1,
0.6593145, 2.341778, 1.394548, 1, 1, 1, 1, 1,
0.6604895, 1.52499, -0.3572862, 1, 1, 1, 1, 1,
0.6625639, 0.2540381, 3.11132, 1, 1, 1, 1, 1,
0.6711734, -1.266559, 1.372772, 1, 1, 1, 1, 1,
0.6716439, -0.3884873, 2.891012, 1, 1, 1, 1, 1,
0.6742745, -1.015225, 4.570974, 1, 1, 1, 1, 1,
0.6760994, -0.1961075, 0.2487416, 1, 1, 1, 1, 1,
0.6856605, 1.302172, 1.235388, 1, 1, 1, 1, 1,
0.6856816, 1.500552, 0.4203302, 1, 1, 1, 1, 1,
0.6867454, -0.5950457, 2.214101, 1, 1, 1, 1, 1,
0.6925268, 1.108672, -0.3761596, 1, 1, 1, 1, 1,
0.6931027, 0.3257164, 1.260486, 1, 1, 1, 1, 1,
0.6955965, 1.053832, 0.09229711, 0, 0, 1, 1, 1,
0.6962436, -1.577693, 2.238391, 1, 0, 0, 1, 1,
0.6962738, 0.2379242, 1.036761, 1, 0, 0, 1, 1,
0.6976216, 0.6151182, 1.14251, 1, 0, 0, 1, 1,
0.6992207, 0.6927746, 0.6132356, 1, 0, 0, 1, 1,
0.7050946, 0.7972153, 0.3026369, 1, 0, 0, 1, 1,
0.7062063, 0.7374496, 0.7073252, 0, 0, 0, 1, 1,
0.7103356, -0.07216199, 1.276632, 0, 0, 0, 1, 1,
0.7133918, -0.6931112, 2.003441, 0, 0, 0, 1, 1,
0.7162418, -1.660579, 1.667651, 0, 0, 0, 1, 1,
0.7163039, -0.9627174, 2.776314, 0, 0, 0, 1, 1,
0.7166669, 0.5516704, 1.285603, 0, 0, 0, 1, 1,
0.7273446, -0.3133599, 3.023705, 0, 0, 0, 1, 1,
0.7376082, -1.162362, 1.051107, 1, 1, 1, 1, 1,
0.7449429, -0.1909654, 1.735501, 1, 1, 1, 1, 1,
0.7461653, 0.01858948, 1.122445, 1, 1, 1, 1, 1,
0.7464528, -0.431107, 3.349969, 1, 1, 1, 1, 1,
0.7466252, -0.2075031, 2.148307, 1, 1, 1, 1, 1,
0.7522244, 0.003354665, 0.8372899, 1, 1, 1, 1, 1,
0.7556735, -0.7273259, 1.59491, 1, 1, 1, 1, 1,
0.7625862, -1.912527, 1.549949, 1, 1, 1, 1, 1,
0.7634754, 0.7540612, 2.507569, 1, 1, 1, 1, 1,
0.7685897, 0.2562545, 1.856459, 1, 1, 1, 1, 1,
0.7728658, 0.4357824, 1.917648, 1, 1, 1, 1, 1,
0.7755995, -0.4539162, 2.223717, 1, 1, 1, 1, 1,
0.7863157, -0.1896243, 0.8710909, 1, 1, 1, 1, 1,
0.7906241, 0.05297752, 0.999554, 1, 1, 1, 1, 1,
0.7911874, -0.5705671, 4.041111, 1, 1, 1, 1, 1,
0.7955639, 1.549706, 0.6844681, 0, 0, 1, 1, 1,
0.7955903, -1.672242, 3.077566, 1, 0, 0, 1, 1,
0.7979891, -1.316916, 2.506049, 1, 0, 0, 1, 1,
0.7982479, -0.390216, 2.912251, 1, 0, 0, 1, 1,
0.8027459, 2.087404, 0.8424631, 1, 0, 0, 1, 1,
0.809758, -0.5536078, 2.51396, 1, 0, 0, 1, 1,
0.8150243, -0.8787394, 1.819635, 0, 0, 0, 1, 1,
0.8150382, -0.6478447, 3.506263, 0, 0, 0, 1, 1,
0.8150587, -1.562838, 3.934512, 0, 0, 0, 1, 1,
0.8173808, -1.894074, 4.223306, 0, 0, 0, 1, 1,
0.8217304, -0.1483031, 2.665311, 0, 0, 0, 1, 1,
0.8248633, 1.000921, 0.8244279, 0, 0, 0, 1, 1,
0.8303121, -1.040402, 3.560465, 0, 0, 0, 1, 1,
0.8347068, -0.6121874, 3.085407, 1, 1, 1, 1, 1,
0.8390607, 1.726373, 1.957797, 1, 1, 1, 1, 1,
0.8448958, 0.5442377, 1.195985, 1, 1, 1, 1, 1,
0.8473798, -1.510063, 3.263528, 1, 1, 1, 1, 1,
0.8495338, 1.370886, -0.5238487, 1, 1, 1, 1, 1,
0.8541266, -0.2728597, 0.2313847, 1, 1, 1, 1, 1,
0.8627415, 0.8620196, -1.822775, 1, 1, 1, 1, 1,
0.8711722, 0.2066809, 1.549334, 1, 1, 1, 1, 1,
0.8714343, 0.6245623, 0.8115757, 1, 1, 1, 1, 1,
0.8750587, -1.191491, 2.030788, 1, 1, 1, 1, 1,
0.8802618, -0.8800961, 4.271902, 1, 1, 1, 1, 1,
0.8845962, 0.6202931, 0.3829002, 1, 1, 1, 1, 1,
0.8863563, -0.5467078, 3.404253, 1, 1, 1, 1, 1,
0.8888811, 0.8592283, 1.055004, 1, 1, 1, 1, 1,
0.8895764, -0.8400361, 2.360416, 1, 1, 1, 1, 1,
0.8905419, -0.09177782, 1.040156, 0, 0, 1, 1, 1,
0.8915157, 1.493598, 0.7677202, 1, 0, 0, 1, 1,
0.8992397, -1.138283, 2.170115, 1, 0, 0, 1, 1,
0.9001447, -0.6812882, 1.266083, 1, 0, 0, 1, 1,
0.9011688, -0.8621847, 4.017807, 1, 0, 0, 1, 1,
0.9040337, -0.01145774, 2.147377, 1, 0, 0, 1, 1,
0.9080421, 1.293102, -0.9529131, 0, 0, 0, 1, 1,
0.9106341, 1.426912, 0.1041225, 0, 0, 0, 1, 1,
0.9115707, -1.267823, 2.631375, 0, 0, 0, 1, 1,
0.9121101, 0.5843014, 2.729051, 0, 0, 0, 1, 1,
0.9123302, -0.759316, 2.086441, 0, 0, 0, 1, 1,
0.9178352, 0.1379915, 3.120847, 0, 0, 0, 1, 1,
0.918569, -0.7718537, 0.2844703, 0, 0, 0, 1, 1,
0.9198481, 1.117918, 1.072434, 1, 1, 1, 1, 1,
0.9237511, -0.7503647, 2.856081, 1, 1, 1, 1, 1,
0.9293306, 1.161079, -1.923706, 1, 1, 1, 1, 1,
0.9317558, 0.9013575, -0.2510975, 1, 1, 1, 1, 1,
0.9361022, 1.17277, 1.78739, 1, 1, 1, 1, 1,
0.9398078, 0.6646902, 0.8835292, 1, 1, 1, 1, 1,
0.9466943, 2.439429, 0.07817046, 1, 1, 1, 1, 1,
0.9473511, -0.5473918, 3.101723, 1, 1, 1, 1, 1,
0.9589738, -0.3817868, 1.014925, 1, 1, 1, 1, 1,
0.9599112, 0.08556868, 3.411387, 1, 1, 1, 1, 1,
0.9629603, 0.02864009, 2.574858, 1, 1, 1, 1, 1,
0.9692615, -1.542453, 2.878569, 1, 1, 1, 1, 1,
0.9769836, -0.607017, 1.66207, 1, 1, 1, 1, 1,
0.9790486, 0.1108392, 0.2299926, 1, 1, 1, 1, 1,
0.9791227, 0.5698997, -0.0773108, 1, 1, 1, 1, 1,
0.9800276, -0.5873476, 2.660116, 0, 0, 1, 1, 1,
0.9848595, -1.49157, 1.273659, 1, 0, 0, 1, 1,
0.9863396, -0.7335653, 1.892126, 1, 0, 0, 1, 1,
0.9887654, -0.4825486, 1.455334, 1, 0, 0, 1, 1,
1.009147, -0.9612025, 0.8140171, 1, 0, 0, 1, 1,
1.014412, -1.026125, 2.11247, 1, 0, 0, 1, 1,
1.015109, 0.8673491, 0.5781862, 0, 0, 0, 1, 1,
1.016693, -0.2630244, 2.908529, 0, 0, 0, 1, 1,
1.02193, -0.3029349, 0.5899175, 0, 0, 0, 1, 1,
1.029492, 3.051224, 2.522699, 0, 0, 0, 1, 1,
1.030659, 1.200136, -0.3918345, 0, 0, 0, 1, 1,
1.038639, 0.4201301, 0.9532176, 0, 0, 0, 1, 1,
1.042885, -0.7320909, 4.306685, 0, 0, 0, 1, 1,
1.062323, 0.6195538, 0.9073089, 1, 1, 1, 1, 1,
1.073807, 0.9272538, 0.90975, 1, 1, 1, 1, 1,
1.078514, -1.863638, 1.784647, 1, 1, 1, 1, 1,
1.083729, 0.1311307, 2.565717, 1, 1, 1, 1, 1,
1.08672, -1.209248, 2.042752, 1, 1, 1, 1, 1,
1.088367, 0.0555057, 1.57653, 1, 1, 1, 1, 1,
1.090528, 2.078127, 0.1520299, 1, 1, 1, 1, 1,
1.092427, 0.9546633, 2.34878, 1, 1, 1, 1, 1,
1.101651, -1.741833, 2.551069, 1, 1, 1, 1, 1,
1.102137, -0.5645877, 2.580883, 1, 1, 1, 1, 1,
1.114813, -0.340437, 1.585309, 1, 1, 1, 1, 1,
1.116819, 0.254282, 0.5922478, 1, 1, 1, 1, 1,
1.121252, 0.2776353, 0.4493704, 1, 1, 1, 1, 1,
1.126661, -0.6899589, 2.818377, 1, 1, 1, 1, 1,
1.127469, 1.133182, 1.735521, 1, 1, 1, 1, 1,
1.134635, -0.4512407, 0.09394911, 0, 0, 1, 1, 1,
1.148672, 0.6569258, 0.4983141, 1, 0, 0, 1, 1,
1.153472, -2.199017, 2.287477, 1, 0, 0, 1, 1,
1.156902, 1.507228, 2.858722, 1, 0, 0, 1, 1,
1.159229, 0.5030498, 0.7747992, 1, 0, 0, 1, 1,
1.171443, -1.165649, 3.565606, 1, 0, 0, 1, 1,
1.172192, 0.119154, 0.7326254, 0, 0, 0, 1, 1,
1.173758, -1.00954, 1.791435, 0, 0, 0, 1, 1,
1.174495, -0.5586722, 1.961191, 0, 0, 0, 1, 1,
1.181466, -0.4404219, 1.526264, 0, 0, 0, 1, 1,
1.184865, -0.8365471, 2.411439, 0, 0, 0, 1, 1,
1.190346, 0.271427, 0.5571079, 0, 0, 0, 1, 1,
1.198968, 0.03842214, 1.442929, 0, 0, 0, 1, 1,
1.205855, -0.4916363, 1.838655, 1, 1, 1, 1, 1,
1.208739, -0.3499343, 3.192994, 1, 1, 1, 1, 1,
1.210475, -0.2217337, 1.745753, 1, 1, 1, 1, 1,
1.218937, 0.006077956, 2.221386, 1, 1, 1, 1, 1,
1.219095, -0.687251, 2.866716, 1, 1, 1, 1, 1,
1.225018, 0.9590038, 2.989494, 1, 1, 1, 1, 1,
1.227011, 0.09128359, 0.3797943, 1, 1, 1, 1, 1,
1.231495, 0.8486155, -0.4002938, 1, 1, 1, 1, 1,
1.23231, 1.49686, 2.368512, 1, 1, 1, 1, 1,
1.23828, -0.596288, 1.944705, 1, 1, 1, 1, 1,
1.238363, 1.990777, -0.4664569, 1, 1, 1, 1, 1,
1.259948, 0.6536602, 0.5469627, 1, 1, 1, 1, 1,
1.263479, 0.0664506, 1.439333, 1, 1, 1, 1, 1,
1.267093, 1.173978, 0.02882337, 1, 1, 1, 1, 1,
1.280723, -0.23653, 1.052531, 1, 1, 1, 1, 1,
1.28206, -1.400888, 3.753302, 0, 0, 1, 1, 1,
1.297681, -0.4861844, -0.2902232, 1, 0, 0, 1, 1,
1.298271, -0.1047745, 2.556691, 1, 0, 0, 1, 1,
1.30364, -0.04144092, 1.384567, 1, 0, 0, 1, 1,
1.305912, -1.918862, 3.206496, 1, 0, 0, 1, 1,
1.319751, -0.0739404, 1.979736, 1, 0, 0, 1, 1,
1.329437, -0.7566738, 2.378518, 0, 0, 0, 1, 1,
1.33519, 1.543775, 0.3145182, 0, 0, 0, 1, 1,
1.33677, 0.2584391, 1.283134, 0, 0, 0, 1, 1,
1.346755, 0.2325642, -0.9266605, 0, 0, 0, 1, 1,
1.348794, 0.6897324, 1.990079, 0, 0, 0, 1, 1,
1.350041, 0.4541352, 0.8994201, 0, 0, 0, 1, 1,
1.352684, -0.367335, 1.902459, 0, 0, 0, 1, 1,
1.353919, 0.3628851, 0.8482996, 1, 1, 1, 1, 1,
1.356862, -1.420221, 1.548748, 1, 1, 1, 1, 1,
1.36203, -0.5694714, 2.470254, 1, 1, 1, 1, 1,
1.366196, -0.6917663, 4.794726, 1, 1, 1, 1, 1,
1.36787, -0.2274041, 0.7919049, 1, 1, 1, 1, 1,
1.370077, 0.2553337, 1.118362, 1, 1, 1, 1, 1,
1.371916, -0.7839493, 2.644555, 1, 1, 1, 1, 1,
1.375511, 0.4844183, 1.328892, 1, 1, 1, 1, 1,
1.377349, -1.051022, 2.887328, 1, 1, 1, 1, 1,
1.384356, -1.024219, 1.668556, 1, 1, 1, 1, 1,
1.385012, 0.9288611, -0.6559753, 1, 1, 1, 1, 1,
1.385146, 0.1602968, 0.566494, 1, 1, 1, 1, 1,
1.393808, -0.08093615, 1.905424, 1, 1, 1, 1, 1,
1.394375, -1.373557, 3.373788, 1, 1, 1, 1, 1,
1.398061, 1.66798, 0.780311, 1, 1, 1, 1, 1,
1.398303, 1.63421, 0.7947466, 0, 0, 1, 1, 1,
1.399509, 0.8949648, 0.5834876, 1, 0, 0, 1, 1,
1.405336, -0.3055534, 1.1735, 1, 0, 0, 1, 1,
1.417099, -1.835842, 4.533516, 1, 0, 0, 1, 1,
1.418018, 0.1904647, 0.149342, 1, 0, 0, 1, 1,
1.423784, -0.02775695, 1.539282, 1, 0, 0, 1, 1,
1.42748, -0.467698, 2.738213, 0, 0, 0, 1, 1,
1.440616, -0.07017327, 2.730157, 0, 0, 0, 1, 1,
1.447248, -2.260473, 2.437747, 0, 0, 0, 1, 1,
1.455767, -0.5834438, 2.132982, 0, 0, 0, 1, 1,
1.465189, -0.3049255, 0.6800259, 0, 0, 0, 1, 1,
1.488097, -0.3623909, 3.246578, 0, 0, 0, 1, 1,
1.489948, -0.2342575, 1.67905, 0, 0, 0, 1, 1,
1.493405, 0.6390653, 2.411868, 1, 1, 1, 1, 1,
1.494378, 0.5232812, 0.1686765, 1, 1, 1, 1, 1,
1.519927, 0.1986979, 2.473655, 1, 1, 1, 1, 1,
1.522775, 0.3452255, 2.139678, 1, 1, 1, 1, 1,
1.529158, 0.3459393, 1.233796, 1, 1, 1, 1, 1,
1.541218, 1.014832, 2.891668, 1, 1, 1, 1, 1,
1.556592, 0.57298, 0.6624512, 1, 1, 1, 1, 1,
1.565004, -1.129761, 0.8473964, 1, 1, 1, 1, 1,
1.566226, 0.2925176, 1.697903, 1, 1, 1, 1, 1,
1.576549, -0.2489751, 3.839084, 1, 1, 1, 1, 1,
1.580623, 0.6485075, 1.506119, 1, 1, 1, 1, 1,
1.588558, 1.203959, 1.293507, 1, 1, 1, 1, 1,
1.58869, 0.5749547, 2.179839, 1, 1, 1, 1, 1,
1.648337, 1.092903, 1.856619, 1, 1, 1, 1, 1,
1.662961, 1.362268, -0.02789924, 1, 1, 1, 1, 1,
1.66297, 0.06822339, 1.492157, 0, 0, 1, 1, 1,
1.668959, -1.346694, 2.629362, 1, 0, 0, 1, 1,
1.669457, -1.395955, 2.79372, 1, 0, 0, 1, 1,
1.669724, -0.9955122, 2.083502, 1, 0, 0, 1, 1,
1.672673, -0.7675661, 2.852367, 1, 0, 0, 1, 1,
1.673516, -2.217447, 4.73208, 1, 0, 0, 1, 1,
1.674855, -1.187023, 3.133549, 0, 0, 0, 1, 1,
1.678598, 1.029662, 1.285583, 0, 0, 0, 1, 1,
1.700347, 0.4022931, 0.1940046, 0, 0, 0, 1, 1,
1.704617, 1.917709, -0.1182829, 0, 0, 0, 1, 1,
1.70486, -0.3578778, 0.9695301, 0, 0, 0, 1, 1,
1.711161, 0.5346031, -0.3955765, 0, 0, 0, 1, 1,
1.743427, 0.689158, -0.2440652, 0, 0, 0, 1, 1,
1.781008, 0.2176991, 0.7353503, 1, 1, 1, 1, 1,
1.808921, -0.3428943, 2.714138, 1, 1, 1, 1, 1,
1.812991, 0.5733221, 0.1505114, 1, 1, 1, 1, 1,
1.849885, -0.6493759, 2.942109, 1, 1, 1, 1, 1,
1.852561, 0.3580567, -0.7747946, 1, 1, 1, 1, 1,
1.876993, 0.7443358, -0.1611775, 1, 1, 1, 1, 1,
1.883489, -1.144746, 1.665362, 1, 1, 1, 1, 1,
1.917595, 0.07410912, 2.237593, 1, 1, 1, 1, 1,
1.930791, 0.1459005, 2.959589, 1, 1, 1, 1, 1,
1.987518, -0.1498022, 1.364532, 1, 1, 1, 1, 1,
1.988633, -0.6765816, 2.222874, 1, 1, 1, 1, 1,
1.996227, 0.7216952, 2.653093, 1, 1, 1, 1, 1,
2.029935, -0.3093938, 1.519973, 1, 1, 1, 1, 1,
2.065269, 0.7913746, 0.5895974, 1, 1, 1, 1, 1,
2.074368, 0.04186334, 2.208093, 1, 1, 1, 1, 1,
2.105766, 0.196354, 1.44028, 0, 0, 1, 1, 1,
2.122164, 2.18825, 0.07746523, 1, 0, 0, 1, 1,
2.14413, 0.319425, 0.281066, 1, 0, 0, 1, 1,
2.151655, -1.629006, 1.018581, 1, 0, 0, 1, 1,
2.153176, -1.372614, 2.784251, 1, 0, 0, 1, 1,
2.175711, 0.5029468, 1.81864, 1, 0, 0, 1, 1,
2.20207, 0.2876627, 1.7619, 0, 0, 0, 1, 1,
2.211319, 0.5096926, 2.428727, 0, 0, 0, 1, 1,
2.221012, -0.6404204, 0.7618983, 0, 0, 0, 1, 1,
2.241511, 0.519378, 1.081862, 0, 0, 0, 1, 1,
2.255867, -0.7434124, 2.251932, 0, 0, 0, 1, 1,
2.329326, 1.081999, 0.3426662, 0, 0, 0, 1, 1,
2.416442, -0.6108361, 2.765332, 0, 0, 0, 1, 1,
2.45261, -0.1392664, 1.952675, 1, 1, 1, 1, 1,
2.511506, 0.374361, 0.6956241, 1, 1, 1, 1, 1,
2.51911, 0.3523189, 1.139225, 1, 1, 1, 1, 1,
2.669848, 0.6304454, 2.47723, 1, 1, 1, 1, 1,
2.859486, 0.4839175, 1.232018, 1, 1, 1, 1, 1,
2.936025, -2.128931, 1.02132, 1, 1, 1, 1, 1,
3.168512, 0.7059183, 0.1913864, 1, 1, 1, 1, 1
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
var radius = 9.6624;
var distance = 33.93877;
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
mvMatrix.translate( -0.1750575, 0.06006145, 0.2572117 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93877);
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
