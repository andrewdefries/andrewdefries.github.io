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
-2.844887, -2.06988, -1.154567, 1, 0, 0, 1,
-2.782435, 0.1205313, -0.2745208, 1, 0.007843138, 0, 1,
-2.6514, -0.5030724, -1.295947, 1, 0.01176471, 0, 1,
-2.64445, 0.6979442, -0.4151174, 1, 0.01960784, 0, 1,
-2.534702, -1.691283, -0.6194971, 1, 0.02352941, 0, 1,
-2.492863, 0.01497837, -2.42751, 1, 0.03137255, 0, 1,
-2.44301, -1.500339, -1.694491, 1, 0.03529412, 0, 1,
-2.421641, -0.2452221, -2.318252, 1, 0.04313726, 0, 1,
-2.391495, 0.4699652, -1.389569, 1, 0.04705882, 0, 1,
-2.36497, 1.218331, -1.461547, 1, 0.05490196, 0, 1,
-2.354233, -0.05202584, -1.3881, 1, 0.05882353, 0, 1,
-2.283986, 1.021115, -0.7233094, 1, 0.06666667, 0, 1,
-2.224106, 0.5684918, 0.184738, 1, 0.07058824, 0, 1,
-2.216691, -1.361765, -2.21492, 1, 0.07843138, 0, 1,
-2.196673, 1.061121, -1.886159, 1, 0.08235294, 0, 1,
-2.18516, -1.594239, -3.151852, 1, 0.09019608, 0, 1,
-2.175378, 0.1651653, -1.621075, 1, 0.09411765, 0, 1,
-2.173194, 0.1604312, -1.008839, 1, 0.1019608, 0, 1,
-2.131561, 1.711636, 0.5914791, 1, 0.1098039, 0, 1,
-2.125158, 1.948613, 0.04577162, 1, 0.1137255, 0, 1,
-2.098925, -0.9317905, -1.675763, 1, 0.1215686, 0, 1,
-2.061401, 2.446402, -2.130172, 1, 0.1254902, 0, 1,
-2.012405, 0.3917472, -2.511357, 1, 0.1333333, 0, 1,
-1.992331, 1.212197, -0.1102408, 1, 0.1372549, 0, 1,
-1.983877, -0.2172322, -1.679996, 1, 0.145098, 0, 1,
-1.975297, -0.2981255, -2.942345, 1, 0.1490196, 0, 1,
-1.968189, -0.8981783, -1.014141, 1, 0.1568628, 0, 1,
-1.919786, 0.1091438, -2.147857, 1, 0.1607843, 0, 1,
-1.90692, 1.108934, 1.850343, 1, 0.1686275, 0, 1,
-1.881988, -0.4539996, -2.595736, 1, 0.172549, 0, 1,
-1.867047, 0.3752299, -2.055586, 1, 0.1803922, 0, 1,
-1.860625, -0.6143122, -1.530025, 1, 0.1843137, 0, 1,
-1.856064, -1.104717, -1.403456, 1, 0.1921569, 0, 1,
-1.850734, 0.9520265, -2.430855, 1, 0.1960784, 0, 1,
-1.848163, -0.7543057, -1.776713, 1, 0.2039216, 0, 1,
-1.846078, -0.3884999, -2.580242, 1, 0.2117647, 0, 1,
-1.843882, 0.7389575, -0.5506234, 1, 0.2156863, 0, 1,
-1.83554, 0.7486339, -1.286489, 1, 0.2235294, 0, 1,
-1.808201, -0.8735796, -2.685616, 1, 0.227451, 0, 1,
-1.803552, -1.275062, -2.213527, 1, 0.2352941, 0, 1,
-1.76405, -0.9013789, -3.480269, 1, 0.2392157, 0, 1,
-1.752034, -0.8856405, -2.55805, 1, 0.2470588, 0, 1,
-1.723656, 2.198643, -1.348285, 1, 0.2509804, 0, 1,
-1.721855, -0.2309003, -1.376065, 1, 0.2588235, 0, 1,
-1.719659, 0.2268526, -2.038171, 1, 0.2627451, 0, 1,
-1.698833, 1.324014, -0.6902308, 1, 0.2705882, 0, 1,
-1.691032, 1.07109, -0.8244576, 1, 0.2745098, 0, 1,
-1.682867, -0.9324073, -0.4851082, 1, 0.282353, 0, 1,
-1.677737, 0.4126064, -1.197543, 1, 0.2862745, 0, 1,
-1.671512, 2.105924, -0.6125066, 1, 0.2941177, 0, 1,
-1.66934, 1.916555, -0.3271153, 1, 0.3019608, 0, 1,
-1.662528, -0.6833337, -2.837262, 1, 0.3058824, 0, 1,
-1.658394, -0.06543808, -2.259456, 1, 0.3137255, 0, 1,
-1.642065, -1.599243, -2.122282, 1, 0.3176471, 0, 1,
-1.640437, -0.9916896, -2.476584, 1, 0.3254902, 0, 1,
-1.634514, 0.4834171, -0.4528928, 1, 0.3294118, 0, 1,
-1.61605, 0.8127279, -0.9750021, 1, 0.3372549, 0, 1,
-1.606724, -0.3340397, -2.087296, 1, 0.3411765, 0, 1,
-1.604265, 1.989637, 0.3666468, 1, 0.3490196, 0, 1,
-1.581831, 1.238787, -0.0307729, 1, 0.3529412, 0, 1,
-1.577942, -2.010679, -0.9745674, 1, 0.3607843, 0, 1,
-1.574187, -0.06306527, -2.644731, 1, 0.3647059, 0, 1,
-1.573803, 0.5692627, -3.098491, 1, 0.372549, 0, 1,
-1.564918, -1.560576, -1.292576, 1, 0.3764706, 0, 1,
-1.560275, 0.1028689, -0.2037317, 1, 0.3843137, 0, 1,
-1.558193, -1.397072, -1.863801, 1, 0.3882353, 0, 1,
-1.555043, 1.567125, -0.6203666, 1, 0.3960784, 0, 1,
-1.547033, 0.2160531, -1.949797, 1, 0.4039216, 0, 1,
-1.531237, 1.376297, -1.500913, 1, 0.4078431, 0, 1,
-1.531191, -0.494498, -1.36977, 1, 0.4156863, 0, 1,
-1.53029, 0.5575452, -0.4948399, 1, 0.4196078, 0, 1,
-1.519233, -0.4497418, -1.145202, 1, 0.427451, 0, 1,
-1.509008, 0.5339019, -2.084372, 1, 0.4313726, 0, 1,
-1.506685, 0.6681186, -2.390227, 1, 0.4392157, 0, 1,
-1.4994, 0.4426706, -1.97563, 1, 0.4431373, 0, 1,
-1.490692, 1.501569, -1.023763, 1, 0.4509804, 0, 1,
-1.47268, 0.06193512, -1.469837, 1, 0.454902, 0, 1,
-1.470706, 0.07980163, -0.5917542, 1, 0.4627451, 0, 1,
-1.467955, 0.1211481, -1.813161, 1, 0.4666667, 0, 1,
-1.467318, -2.297714, -3.89396, 1, 0.4745098, 0, 1,
-1.465574, 1.49987, -0.8905069, 1, 0.4784314, 0, 1,
-1.455208, 0.1100455, -0.3127067, 1, 0.4862745, 0, 1,
-1.448681, 0.3435094, -2.216443, 1, 0.4901961, 0, 1,
-1.437151, 1.363188, -0.149141, 1, 0.4980392, 0, 1,
-1.417118, -0.6308743, -0.1292143, 1, 0.5058824, 0, 1,
-1.413249, -0.1985072, -2.652156, 1, 0.509804, 0, 1,
-1.40469, -0.9322071, -3.870736, 1, 0.5176471, 0, 1,
-1.387537, -2.577605, -3.821478, 1, 0.5215687, 0, 1,
-1.378427, 0.569253, -0.07575427, 1, 0.5294118, 0, 1,
-1.377788, -1.57107, -1.831913, 1, 0.5333334, 0, 1,
-1.353348, 0.4148541, -0.8591576, 1, 0.5411765, 0, 1,
-1.346968, -0.9774309, -2.284902, 1, 0.5450981, 0, 1,
-1.341785, 0.6387053, -2.859964, 1, 0.5529412, 0, 1,
-1.336772, 0.7917835, 0.199634, 1, 0.5568628, 0, 1,
-1.3272, 0.3390325, -1.400997, 1, 0.5647059, 0, 1,
-1.316929, -0.1988819, -1.775056, 1, 0.5686275, 0, 1,
-1.309862, 0.446059, -1.974273, 1, 0.5764706, 0, 1,
-1.308037, 0.8093767, -0.9507677, 1, 0.5803922, 0, 1,
-1.304322, 0.1578465, -1.781471, 1, 0.5882353, 0, 1,
-1.294505, -0.5182723, -2.123427, 1, 0.5921569, 0, 1,
-1.289532, 1.574805, -0.5485312, 1, 0.6, 0, 1,
-1.282344, 0.4206562, -0.6490629, 1, 0.6078432, 0, 1,
-1.277749, -1.294817, -3.93163, 1, 0.6117647, 0, 1,
-1.266359, -0.08295549, -1.918254, 1, 0.6196079, 0, 1,
-1.249947, -1.570556, -3.855833, 1, 0.6235294, 0, 1,
-1.240471, 1.609174, 0.1489543, 1, 0.6313726, 0, 1,
-1.230297, -1.025144, -3.539645, 1, 0.6352941, 0, 1,
-1.229557, 0.3685451, -0.217238, 1, 0.6431373, 0, 1,
-1.225431, 0.00388207, -1.898379, 1, 0.6470588, 0, 1,
-1.217983, 0.7322485, -1.456445, 1, 0.654902, 0, 1,
-1.215707, -1.966184, -2.127142, 1, 0.6588235, 0, 1,
-1.214501, -0.7067214, -4.112606, 1, 0.6666667, 0, 1,
-1.207663, 0.1636022, -1.352596, 1, 0.6705883, 0, 1,
-1.202564, -0.1775565, -1.122461, 1, 0.6784314, 0, 1,
-1.179542, -0.1249158, -2.192987, 1, 0.682353, 0, 1,
-1.176043, 2.03883, 1.126339, 1, 0.6901961, 0, 1,
-1.17008, -0.5143201, -1.41747, 1, 0.6941177, 0, 1,
-1.16923, -1.252139, -3.023193, 1, 0.7019608, 0, 1,
-1.163563, -0.3365577, -2.443451, 1, 0.7098039, 0, 1,
-1.16242, -0.1918377, -3.17682, 1, 0.7137255, 0, 1,
-1.15749, -0.0694048, -1.132585, 1, 0.7215686, 0, 1,
-1.157326, -0.3329525, -3.170254, 1, 0.7254902, 0, 1,
-1.156678, 0.1380272, -2.522701, 1, 0.7333333, 0, 1,
-1.146585, 0.285799, -0.9587057, 1, 0.7372549, 0, 1,
-1.142796, 1.154035, -0.3783216, 1, 0.7450981, 0, 1,
-1.140008, -0.4464351, -3.033818, 1, 0.7490196, 0, 1,
-1.134133, -0.5911193, -3.301793, 1, 0.7568628, 0, 1,
-1.131062, -0.9364603, -3.632667, 1, 0.7607843, 0, 1,
-1.124161, -1.814891, -1.333858, 1, 0.7686275, 0, 1,
-1.120827, -0.6559132, -3.74175, 1, 0.772549, 0, 1,
-1.114051, 0.4605803, -0.9869832, 1, 0.7803922, 0, 1,
-1.112322, 0.5424734, -1.378013, 1, 0.7843137, 0, 1,
-1.097074, 0.2969063, -2.46634, 1, 0.7921569, 0, 1,
-1.095858, 0.6500241, -1.021822, 1, 0.7960784, 0, 1,
-1.092826, -0.04946686, -1.854713, 1, 0.8039216, 0, 1,
-1.079924, 0.07602708, -2.079805, 1, 0.8117647, 0, 1,
-1.075195, 1.339599, 0.276519, 1, 0.8156863, 0, 1,
-1.0708, -0.9078588, -2.060702, 1, 0.8235294, 0, 1,
-1.066174, 1.723782, -0.2251668, 1, 0.827451, 0, 1,
-1.065749, 2.042811, -1.982025, 1, 0.8352941, 0, 1,
-1.0636, 0.3718192, -1.639848, 1, 0.8392157, 0, 1,
-1.059171, -1.346528, -4.222228, 1, 0.8470588, 0, 1,
-1.047957, 0.3355717, -0.3164594, 1, 0.8509804, 0, 1,
-1.047206, -0.04431306, -2.011223, 1, 0.8588235, 0, 1,
-1.040763, 0.9937909, 0.2759989, 1, 0.8627451, 0, 1,
-1.03821, 0.6677363, -0.9754146, 1, 0.8705882, 0, 1,
-1.031036, -1.119166, -0.525346, 1, 0.8745098, 0, 1,
-1.029639, 0.5159228, -1.003938, 1, 0.8823529, 0, 1,
-1.026752, -1.221447, -1.242574, 1, 0.8862745, 0, 1,
-1.01599, -0.04554662, -2.571388, 1, 0.8941177, 0, 1,
-1.014066, -0.4093554, -0.277993, 1, 0.8980392, 0, 1,
-1.009255, 0.4405725, -0.5576847, 1, 0.9058824, 0, 1,
-1.006233, 1.936989, 0.3819072, 1, 0.9137255, 0, 1,
-0.9931579, -1.512417, -1.730918, 1, 0.9176471, 0, 1,
-0.9930491, -0.5049294, -1.392881, 1, 0.9254902, 0, 1,
-0.9902974, -1.810536, -2.73406, 1, 0.9294118, 0, 1,
-0.9898344, -0.07445257, -1.475539, 1, 0.9372549, 0, 1,
-0.9751866, -0.3706062, -2.735538, 1, 0.9411765, 0, 1,
-0.9742565, 0.8245509, -0.3705637, 1, 0.9490196, 0, 1,
-0.9627921, -0.7976616, -2.379946, 1, 0.9529412, 0, 1,
-0.9598367, -0.3852767, -0.8908654, 1, 0.9607843, 0, 1,
-0.9553996, 0.6011438, -1.992345, 1, 0.9647059, 0, 1,
-0.9514885, 1.855975, -0.8777717, 1, 0.972549, 0, 1,
-0.9512156, -1.318599, -2.824803, 1, 0.9764706, 0, 1,
-0.9505089, 0.3709811, -0.8605189, 1, 0.9843137, 0, 1,
-0.9493586, -0.7372152, -0.2939226, 1, 0.9882353, 0, 1,
-0.9480715, 0.1371586, -1.570711, 1, 0.9960784, 0, 1,
-0.9461582, -0.3988409, -2.259117, 0.9960784, 1, 0, 1,
-0.9461504, 1.483889, -0.6752015, 0.9921569, 1, 0, 1,
-0.9423034, 0.9625179, -0.5606302, 0.9843137, 1, 0, 1,
-0.9345288, 1.537456, 0.1679007, 0.9803922, 1, 0, 1,
-0.9269394, -0.5946401, -2.113165, 0.972549, 1, 0, 1,
-0.918245, 1.013836, -1.411492, 0.9686275, 1, 0, 1,
-0.9114657, -0.04795706, -1.36842, 0.9607843, 1, 0, 1,
-0.9062656, 0.6719315, -0.9450728, 0.9568627, 1, 0, 1,
-0.9041685, -2.13276, -2.752646, 0.9490196, 1, 0, 1,
-0.902321, 0.233142, -0.0757462, 0.945098, 1, 0, 1,
-0.8959188, 0.2848785, -0.8850999, 0.9372549, 1, 0, 1,
-0.8942722, 1.336364, -0.7978995, 0.9333333, 1, 0, 1,
-0.8932167, -1.531666, -3.587368, 0.9254902, 1, 0, 1,
-0.8867426, 0.3669142, -3.009593, 0.9215686, 1, 0, 1,
-0.8864651, 0.3999456, -0.3968935, 0.9137255, 1, 0, 1,
-0.8818157, 0.4809336, -1.133242, 0.9098039, 1, 0, 1,
-0.8793966, -0.878577, -2.263128, 0.9019608, 1, 0, 1,
-0.8790234, 0.613014, -0.2249908, 0.8941177, 1, 0, 1,
-0.8772909, -2.342685, -2.411371, 0.8901961, 1, 0, 1,
-0.8670648, -0.4074169, -1.865953, 0.8823529, 1, 0, 1,
-0.8669578, -1.173002, -0.7242626, 0.8784314, 1, 0, 1,
-0.8629386, 0.4791554, 1.008556, 0.8705882, 1, 0, 1,
-0.8622705, -1.112833, -1.513841, 0.8666667, 1, 0, 1,
-0.861653, 0.7756699, -0.8150044, 0.8588235, 1, 0, 1,
-0.8615401, -1.832115, -2.405532, 0.854902, 1, 0, 1,
-0.8566926, -0.9429355, -2.448977, 0.8470588, 1, 0, 1,
-0.8544388, -0.5332949, -2.852239, 0.8431373, 1, 0, 1,
-0.8537154, -0.6383584, -1.164896, 0.8352941, 1, 0, 1,
-0.853642, 0.2584834, -1.167784, 0.8313726, 1, 0, 1,
-0.8529993, -0.9806302, -3.933507, 0.8235294, 1, 0, 1,
-0.8507931, 0.4222303, 0.9061978, 0.8196079, 1, 0, 1,
-0.8503037, -0.6258634, -0.7685197, 0.8117647, 1, 0, 1,
-0.847211, -1.127138, -3.524935, 0.8078431, 1, 0, 1,
-0.8434893, -1.004845, -2.454367, 0.8, 1, 0, 1,
-0.8417125, -0.6228667, -2.522774, 0.7921569, 1, 0, 1,
-0.8381149, 1.058483, 0.9486066, 0.7882353, 1, 0, 1,
-0.8367555, -0.2709038, -3.742593, 0.7803922, 1, 0, 1,
-0.8357898, -0.7079039, -1.724421, 0.7764706, 1, 0, 1,
-0.8296861, -2.483793, -3.032584, 0.7686275, 1, 0, 1,
-0.8246641, -0.9436927, -2.744245, 0.7647059, 1, 0, 1,
-0.8212271, -0.6453955, -1.357089, 0.7568628, 1, 0, 1,
-0.8198512, -0.6159819, -1.494995, 0.7529412, 1, 0, 1,
-0.8145984, 1.49386, -0.1005288, 0.7450981, 1, 0, 1,
-0.8124394, 0.8462811, -1.655249, 0.7411765, 1, 0, 1,
-0.8085329, -0.7206359, -2.624778, 0.7333333, 1, 0, 1,
-0.808134, -1.694655, -3.676458, 0.7294118, 1, 0, 1,
-0.8075753, 0.845475, -1.160947, 0.7215686, 1, 0, 1,
-0.8066542, 0.6418465, -1.300561, 0.7176471, 1, 0, 1,
-0.7983438, 0.6379343, 0.5900475, 0.7098039, 1, 0, 1,
-0.7963538, -0.9774999, -3.187134, 0.7058824, 1, 0, 1,
-0.7934133, 2.104008, -1.19511, 0.6980392, 1, 0, 1,
-0.7924214, -1.004221, -2.331226, 0.6901961, 1, 0, 1,
-0.790555, 0.2478881, -0.9971996, 0.6862745, 1, 0, 1,
-0.7899619, -0.372246, -3.639318, 0.6784314, 1, 0, 1,
-0.7860513, 0.2645364, 0.2944895, 0.6745098, 1, 0, 1,
-0.7803756, 1.728004, 0.1893004, 0.6666667, 1, 0, 1,
-0.7782236, 1.511396, 2.337866, 0.6627451, 1, 0, 1,
-0.7771748, -0.1691576, -3.030843, 0.654902, 1, 0, 1,
-0.77267, -1.752128, -3.014975, 0.6509804, 1, 0, 1,
-0.7704793, 0.8041281, -1.755856, 0.6431373, 1, 0, 1,
-0.7674463, 0.3327791, -0.1852403, 0.6392157, 1, 0, 1,
-0.7659215, 1.062363, -1.863064, 0.6313726, 1, 0, 1,
-0.7626945, -0.5473838, -2.32343, 0.627451, 1, 0, 1,
-0.7623947, -1.578004, -4.76293, 0.6196079, 1, 0, 1,
-0.7452686, 0.7635874, -2.123979, 0.6156863, 1, 0, 1,
-0.738862, -0.3231343, -2.506021, 0.6078432, 1, 0, 1,
-0.7375355, -0.939584, -1.191192, 0.6039216, 1, 0, 1,
-0.7360737, 0.6833047, -1.274786, 0.5960785, 1, 0, 1,
-0.7356726, 0.1851248, 0.06325866, 0.5882353, 1, 0, 1,
-0.727273, 0.251317, -0.1949925, 0.5843138, 1, 0, 1,
-0.7221804, -0.9215534, -3.672205, 0.5764706, 1, 0, 1,
-0.7122834, -1.695793, -1.440697, 0.572549, 1, 0, 1,
-0.7118146, 0.1566767, -2.681799, 0.5647059, 1, 0, 1,
-0.7097923, 0.3744619, -1.910346, 0.5607843, 1, 0, 1,
-0.7075767, 0.2176968, -2.403951, 0.5529412, 1, 0, 1,
-0.702659, 0.1652667, 0.132221, 0.5490196, 1, 0, 1,
-0.7015901, 0.8556057, 0.9380016, 0.5411765, 1, 0, 1,
-0.6997761, 0.1551761, 1.163171, 0.5372549, 1, 0, 1,
-0.6990474, 0.6598409, -0.8967218, 0.5294118, 1, 0, 1,
-0.698137, 0.3689265, -0.4397104, 0.5254902, 1, 0, 1,
-0.693662, -0.02135399, -1.180364, 0.5176471, 1, 0, 1,
-0.683856, -0.7548016, -2.239802, 0.5137255, 1, 0, 1,
-0.6824006, 1.187888, -0.9536846, 0.5058824, 1, 0, 1,
-0.6810498, 1.130296, -0.723048, 0.5019608, 1, 0, 1,
-0.6773255, 1.003464, -0.2954882, 0.4941176, 1, 0, 1,
-0.6755409, 1.809612, -0.1244289, 0.4862745, 1, 0, 1,
-0.6730518, 0.4088092, 0.105401, 0.4823529, 1, 0, 1,
-0.6728995, -0.7024171, -2.353385, 0.4745098, 1, 0, 1,
-0.6696959, 0.01696818, -1.45118, 0.4705882, 1, 0, 1,
-0.6682085, 0.3147898, -0.8668065, 0.4627451, 1, 0, 1,
-0.6649696, 1.234083, -1.21863, 0.4588235, 1, 0, 1,
-0.6611585, -0.09900165, -2.645654, 0.4509804, 1, 0, 1,
-0.6607007, 0.3153996, -0.5111598, 0.4470588, 1, 0, 1,
-0.6592228, 0.1166237, -2.686479, 0.4392157, 1, 0, 1,
-0.6535851, -1.059683, -3.213771, 0.4352941, 1, 0, 1,
-0.6509275, -1.856792, -2.012337, 0.427451, 1, 0, 1,
-0.6504866, -1.113489, -3.749033, 0.4235294, 1, 0, 1,
-0.646444, -0.2043531, -2.705104, 0.4156863, 1, 0, 1,
-0.6396497, 1.512748, -0.4204324, 0.4117647, 1, 0, 1,
-0.6392236, 0.7737558, -0.6396772, 0.4039216, 1, 0, 1,
-0.6372456, 0.4363247, 0.009353762, 0.3960784, 1, 0, 1,
-0.6340646, -0.800636, -2.507526, 0.3921569, 1, 0, 1,
-0.6329371, 1.209609, -0.3670183, 0.3843137, 1, 0, 1,
-0.6174139, -1.414526, -1.743977, 0.3803922, 1, 0, 1,
-0.6096532, 0.9097716, -0.5214413, 0.372549, 1, 0, 1,
-0.5952047, 0.8617272, -0.7246559, 0.3686275, 1, 0, 1,
-0.5938995, 1.994768, -0.1405973, 0.3607843, 1, 0, 1,
-0.5930282, -0.1496971, -3.953326, 0.3568628, 1, 0, 1,
-0.5906298, -0.6400244, -1.519573, 0.3490196, 1, 0, 1,
-0.5871288, -1.174054, -2.668504, 0.345098, 1, 0, 1,
-0.5862387, -0.5533786, -2.114545, 0.3372549, 1, 0, 1,
-0.5845321, -0.7473845, -3.617749, 0.3333333, 1, 0, 1,
-0.5819008, -0.0158732, -1.397753, 0.3254902, 1, 0, 1,
-0.5788355, 1.417868, 1.204553, 0.3215686, 1, 0, 1,
-0.5775086, -0.52691, -2.403266, 0.3137255, 1, 0, 1,
-0.575556, 0.0244184, -2.42205, 0.3098039, 1, 0, 1,
-0.5726721, -0.5846727, -2.143564, 0.3019608, 1, 0, 1,
-0.5686914, 0.5802282, -0.2932102, 0.2941177, 1, 0, 1,
-0.5685831, 1.457092, 1.115561, 0.2901961, 1, 0, 1,
-0.5682661, 1.352737, 2.251674, 0.282353, 1, 0, 1,
-0.5632741, 0.1797748, -2.471464, 0.2784314, 1, 0, 1,
-0.5628172, -0.4587488, -2.664953, 0.2705882, 1, 0, 1,
-0.5625151, -0.7327417, -2.88094, 0.2666667, 1, 0, 1,
-0.5606588, -0.8158522, -1.940449, 0.2588235, 1, 0, 1,
-0.5570545, 1.585715, -1.089859, 0.254902, 1, 0, 1,
-0.5527592, 1.656683, -1.517404, 0.2470588, 1, 0, 1,
-0.5497566, -1.401129, -2.955162, 0.2431373, 1, 0, 1,
-0.5483631, 1.235113, -0.385473, 0.2352941, 1, 0, 1,
-0.5468864, 2.725627, 1.124447, 0.2313726, 1, 0, 1,
-0.5393517, -0.3050771, 0.123418, 0.2235294, 1, 0, 1,
-0.5391353, -1.148816, -3.947178, 0.2196078, 1, 0, 1,
-0.5386692, 0.03638656, -0.04927366, 0.2117647, 1, 0, 1,
-0.5335865, -1.065413, -0.9576343, 0.2078431, 1, 0, 1,
-0.5305728, -0.3007983, -2.745355, 0.2, 1, 0, 1,
-0.5254059, -0.4060697, -1.929083, 0.1921569, 1, 0, 1,
-0.5226229, 0.3646768, -1.05634, 0.1882353, 1, 0, 1,
-0.5210649, -0.2914673, -1.400112, 0.1803922, 1, 0, 1,
-0.5183812, -0.7923661, -3.248684, 0.1764706, 1, 0, 1,
-0.5136228, 0.6049928, -2.432926, 0.1686275, 1, 0, 1,
-0.5127883, -1.049978, -4.29905, 0.1647059, 1, 0, 1,
-0.5118701, -0.7971249, -2.836198, 0.1568628, 1, 0, 1,
-0.5118085, 0.1907738, -2.022283, 0.1529412, 1, 0, 1,
-0.4946361, 0.4050575, -0.8880191, 0.145098, 1, 0, 1,
-0.4893355, -1.413678, -2.546, 0.1411765, 1, 0, 1,
-0.466854, 1.334547, 1.239802, 0.1333333, 1, 0, 1,
-0.4661352, -0.4415927, -1.258813, 0.1294118, 1, 0, 1,
-0.4634092, -1.568513, -3.105628, 0.1215686, 1, 0, 1,
-0.4610617, 1.442675, 0.9654083, 0.1176471, 1, 0, 1,
-0.4606206, 0.8456761, 0.4923291, 0.1098039, 1, 0, 1,
-0.4581528, -1.074602, -2.424036, 0.1058824, 1, 0, 1,
-0.4524464, -1.799191, -2.310024, 0.09803922, 1, 0, 1,
-0.452434, -0.3053261, -1.225718, 0.09019608, 1, 0, 1,
-0.4522045, -1.767846, -4.827035, 0.08627451, 1, 0, 1,
-0.4498469, 0.7837707, -1.179519, 0.07843138, 1, 0, 1,
-0.4496367, -0.42749, -0.7230015, 0.07450981, 1, 0, 1,
-0.4495817, -1.617371, -2.323734, 0.06666667, 1, 0, 1,
-0.4484236, -1.82012, -3.184473, 0.0627451, 1, 0, 1,
-0.4483187, -0.8402696, -2.935156, 0.05490196, 1, 0, 1,
-0.4442866, 0.1707617, -0.003688825, 0.05098039, 1, 0, 1,
-0.4405032, -1.682721, -4.286815, 0.04313726, 1, 0, 1,
-0.4401448, 0.0846108, -2.29253, 0.03921569, 1, 0, 1,
-0.439605, -0.2505449, -1.548588, 0.03137255, 1, 0, 1,
-0.439377, 0.2058642, -2.2995, 0.02745098, 1, 0, 1,
-0.4386894, -0.4341967, -1.964078, 0.01960784, 1, 0, 1,
-0.4367242, 0.3720512, -1.981361, 0.01568628, 1, 0, 1,
-0.4364265, -0.4574409, -2.00432, 0.007843138, 1, 0, 1,
-0.4361192, -0.6008456, -1.263569, 0.003921569, 1, 0, 1,
-0.4355609, 0.2314183, 0.1453165, 0, 1, 0.003921569, 1,
-0.4320182, -0.3931265, -1.483181, 0, 1, 0.01176471, 1,
-0.430689, -2.712806, -2.959444, 0, 1, 0.01568628, 1,
-0.4300048, -0.5219437, -4.02263, 0, 1, 0.02352941, 1,
-0.4260809, -1.616173, -4.172609, 0, 1, 0.02745098, 1,
-0.4252555, -0.527642, -2.781718, 0, 1, 0.03529412, 1,
-0.4187186, 0.4874075, 0.2462299, 0, 1, 0.03921569, 1,
-0.4151913, -0.7074341, -2.831141, 0, 1, 0.04705882, 1,
-0.4115525, 0.9025262, -1.688107, 0, 1, 0.05098039, 1,
-0.4086916, 1.022251, -2.892406, 0, 1, 0.05882353, 1,
-0.4056612, -0.7033734, -0.007891995, 0, 1, 0.0627451, 1,
-0.4050644, 0.6667757, -0.6741955, 0, 1, 0.07058824, 1,
-0.3994489, -0.3409076, -1.317757, 0, 1, 0.07450981, 1,
-0.399084, 0.08478125, -2.71089, 0, 1, 0.08235294, 1,
-0.3985785, 2.013893, 1.107614, 0, 1, 0.08627451, 1,
-0.3966018, -1.356682, -2.912677, 0, 1, 0.09411765, 1,
-0.3964865, 0.662744, -1.627614, 0, 1, 0.1019608, 1,
-0.394997, 1.652993, -0.7602856, 0, 1, 0.1058824, 1,
-0.3842491, -1.367755, -4.679699, 0, 1, 0.1137255, 1,
-0.3836086, 3.023205, 0.5123312, 0, 1, 0.1176471, 1,
-0.37936, 1.643389, 0.6844766, 0, 1, 0.1254902, 1,
-0.3786804, 0.8493921, -1.216554, 0, 1, 0.1294118, 1,
-0.3762719, 0.105491, -1.029962, 0, 1, 0.1372549, 1,
-0.3746722, -0.484994, -3.094843, 0, 1, 0.1411765, 1,
-0.3730977, -1.566381, -2.91782, 0, 1, 0.1490196, 1,
-0.3725989, 0.1643672, -0.5843713, 0, 1, 0.1529412, 1,
-0.3724048, 0.2895952, -1.240204, 0, 1, 0.1607843, 1,
-0.3711801, -0.32942, -2.124145, 0, 1, 0.1647059, 1,
-0.3667854, -1.687442, -3.326296, 0, 1, 0.172549, 1,
-0.3648666, -1.076261, -2.40649, 0, 1, 0.1764706, 1,
-0.3646554, 0.4786434, -1.270124, 0, 1, 0.1843137, 1,
-0.3642929, -0.438381, -1.099217, 0, 1, 0.1882353, 1,
-0.3514677, -0.4912477, -2.791999, 0, 1, 0.1960784, 1,
-0.3500603, 1.034547, 0.1044424, 0, 1, 0.2039216, 1,
-0.3400559, -0.4010863, -2.877773, 0, 1, 0.2078431, 1,
-0.3389857, 0.3508405, 1.226738, 0, 1, 0.2156863, 1,
-0.3313176, 0.6567237, -0.2527122, 0, 1, 0.2196078, 1,
-0.3311673, -1.759724, -3.218275, 0, 1, 0.227451, 1,
-0.3262353, -0.3723042, -1.89479, 0, 1, 0.2313726, 1,
-0.3245601, -0.4216629, -1.200835, 0, 1, 0.2392157, 1,
-0.3217549, 1.332949, 0.1509812, 0, 1, 0.2431373, 1,
-0.3191852, 0.3919677, -1.91367, 0, 1, 0.2509804, 1,
-0.3176279, 1.076642, -0.6884838, 0, 1, 0.254902, 1,
-0.3162074, -1.295505, -2.331118, 0, 1, 0.2627451, 1,
-0.3130415, -0.7203889, -3.927578, 0, 1, 0.2666667, 1,
-0.3117, 0.5353751, -1.253638, 0, 1, 0.2745098, 1,
-0.3027304, 0.2694764, -0.8843859, 0, 1, 0.2784314, 1,
-0.3023383, -0.9151214, -2.144008, 0, 1, 0.2862745, 1,
-0.2990597, -0.9254019, -3.285791, 0, 1, 0.2901961, 1,
-0.2981466, -1.946244, -3.567262, 0, 1, 0.2980392, 1,
-0.2967795, -0.262838, -1.662599, 0, 1, 0.3058824, 1,
-0.2959908, -0.2508216, -2.337885, 0, 1, 0.3098039, 1,
-0.2806579, 0.4198163, -1.224215, 0, 1, 0.3176471, 1,
-0.2774795, -1.350067, -2.087033, 0, 1, 0.3215686, 1,
-0.2674968, 1.164308, 0.5834805, 0, 1, 0.3294118, 1,
-0.2655889, 0.2415216, -0.2270756, 0, 1, 0.3333333, 1,
-0.2605623, 1.99337, -0.9068629, 0, 1, 0.3411765, 1,
-0.2579335, -0.7928504, -3.769624, 0, 1, 0.345098, 1,
-0.2505717, -0.09437098, -2.574783, 0, 1, 0.3529412, 1,
-0.247098, 0.9557175, 0.5503086, 0, 1, 0.3568628, 1,
-0.246663, 0.1359113, -0.6878911, 0, 1, 0.3647059, 1,
-0.2429153, 0.5402476, -0.6843852, 0, 1, 0.3686275, 1,
-0.2393928, 0.6918145, 0.6725947, 0, 1, 0.3764706, 1,
-0.2389907, 1.08885, -0.5188193, 0, 1, 0.3803922, 1,
-0.2354593, 0.06229837, -1.875134, 0, 1, 0.3882353, 1,
-0.234291, -0.4765113, -2.732062, 0, 1, 0.3921569, 1,
-0.2332596, -0.03552376, -1.277781, 0, 1, 0.4, 1,
-0.2331368, -0.9398832, -2.626205, 0, 1, 0.4078431, 1,
-0.2315112, -0.05082489, -2.7604, 0, 1, 0.4117647, 1,
-0.2278522, -0.3419068, -3.07136, 0, 1, 0.4196078, 1,
-0.2266506, 0.03798261, 0.1381068, 0, 1, 0.4235294, 1,
-0.2220822, 1.047355, -0.3159916, 0, 1, 0.4313726, 1,
-0.2212923, -0.03283929, -2.857466, 0, 1, 0.4352941, 1,
-0.2190859, -0.3724358, -3.470646, 0, 1, 0.4431373, 1,
-0.2188636, -0.569643, -3.057866, 0, 1, 0.4470588, 1,
-0.2163242, -0.7740845, -4.348911, 0, 1, 0.454902, 1,
-0.2147513, 1.306155, -2.186158, 0, 1, 0.4588235, 1,
-0.2092986, 0.4076386, -0.2671163, 0, 1, 0.4666667, 1,
-0.2089452, 1.236169, -0.2950567, 0, 1, 0.4705882, 1,
-0.2062169, 0.019781, -2.775678, 0, 1, 0.4784314, 1,
-0.2034477, -0.6618785, -2.600909, 0, 1, 0.4823529, 1,
-0.2029442, -1.183138, -1.299834, 0, 1, 0.4901961, 1,
-0.2008274, 0.4741405, 0.5837599, 0, 1, 0.4941176, 1,
-0.2004946, 0.9434029, -0.2078932, 0, 1, 0.5019608, 1,
-0.1999903, -0.713491, -2.991742, 0, 1, 0.509804, 1,
-0.1973096, 0.4206192, 0.5249988, 0, 1, 0.5137255, 1,
-0.1972997, -2.763359, -3.327669, 0, 1, 0.5215687, 1,
-0.1950849, -0.1628696, -2.13293, 0, 1, 0.5254902, 1,
-0.1940695, -0.2030492, -3.867619, 0, 1, 0.5333334, 1,
-0.1926515, -1.791269, -1.831458, 0, 1, 0.5372549, 1,
-0.1921114, -1.615447, -3.867545, 0, 1, 0.5450981, 1,
-0.1920819, 0.5901791, 0.3757216, 0, 1, 0.5490196, 1,
-0.1906539, 0.08183077, -0.4644769, 0, 1, 0.5568628, 1,
-0.1887269, 1.844162, 0.6704253, 0, 1, 0.5607843, 1,
-0.1853917, 2.317144, -0.6930419, 0, 1, 0.5686275, 1,
-0.1828821, -0.14988, -2.60402, 0, 1, 0.572549, 1,
-0.1795221, 0.4081793, -0.4028419, 0, 1, 0.5803922, 1,
-0.1774565, 2.195397, -0.3735994, 0, 1, 0.5843138, 1,
-0.1759289, 0.9172621, -0.7248517, 0, 1, 0.5921569, 1,
-0.1745422, -0.9205213, -5.163941, 0, 1, 0.5960785, 1,
-0.1741402, -1.490456, -2.594783, 0, 1, 0.6039216, 1,
-0.1738469, -0.2236225, -1.204183, 0, 1, 0.6117647, 1,
-0.1738308, -0.3891881, -3.349823, 0, 1, 0.6156863, 1,
-0.1694519, 1.055432, -0.941996, 0, 1, 0.6235294, 1,
-0.1684565, -0.239998, -1.819788, 0, 1, 0.627451, 1,
-0.1642294, 0.2137075, -2.568583, 0, 1, 0.6352941, 1,
-0.1613292, 0.4315123, 0.6067424, 0, 1, 0.6392157, 1,
-0.1602338, 0.00961055, -0.5441396, 0, 1, 0.6470588, 1,
-0.156382, 0.4255275, 1.144168, 0, 1, 0.6509804, 1,
-0.1472877, 0.5030827, 0.2419161, 0, 1, 0.6588235, 1,
-0.1467114, 0.4611866, -2.82905, 0, 1, 0.6627451, 1,
-0.1451081, 0.6743898, 0.4097659, 0, 1, 0.6705883, 1,
-0.1416471, -0.9420751, -1.315404, 0, 1, 0.6745098, 1,
-0.1380688, 0.6497433, 1.164097, 0, 1, 0.682353, 1,
-0.1352002, 0.3652872, -0.1842438, 0, 1, 0.6862745, 1,
-0.1349923, 0.5817047, -0.3585933, 0, 1, 0.6941177, 1,
-0.1340384, -1.605685, -3.408294, 0, 1, 0.7019608, 1,
-0.1332605, 0.5219576, 0.6326057, 0, 1, 0.7058824, 1,
-0.1298319, -0.4422345, -3.671076, 0, 1, 0.7137255, 1,
-0.1237435, -0.3948795, -3.053086, 0, 1, 0.7176471, 1,
-0.1215594, -0.1325474, -3.340577, 0, 1, 0.7254902, 1,
-0.116239, 1.126257, -0.8840196, 0, 1, 0.7294118, 1,
-0.1148342, -0.003761139, -1.018398, 0, 1, 0.7372549, 1,
-0.1144557, -0.4910684, -3.552099, 0, 1, 0.7411765, 1,
-0.112512, -0.4958771, -2.068504, 0, 1, 0.7490196, 1,
-0.1116794, 1.177091, -1.351769, 0, 1, 0.7529412, 1,
-0.1093461, 1.907377, -0.2605698, 0, 1, 0.7607843, 1,
-0.1080297, -0.445083, -1.497686, 0, 1, 0.7647059, 1,
-0.1074697, 1.899141, -1.687104, 0, 1, 0.772549, 1,
-0.1057218, -0.7967038, -5.159431, 0, 1, 0.7764706, 1,
-0.09765288, 0.274543, -0.08707581, 0, 1, 0.7843137, 1,
-0.09715416, 0.05585671, -2.471298, 0, 1, 0.7882353, 1,
-0.09112791, -0.3827215, -2.89747, 0, 1, 0.7960784, 1,
-0.09097604, 0.679857, 1.245391, 0, 1, 0.8039216, 1,
-0.08602086, 0.1816211, 0.2471166, 0, 1, 0.8078431, 1,
-0.08520164, -0.485953, -3.786291, 0, 1, 0.8156863, 1,
-0.06604843, 1.111225, -1.121817, 0, 1, 0.8196079, 1,
-0.06547607, -0.3606947, -2.26803, 0, 1, 0.827451, 1,
-0.0630262, -1.398523, -2.883531, 0, 1, 0.8313726, 1,
-0.06250289, 0.2159942, -0.8397646, 0, 1, 0.8392157, 1,
-0.06231278, -0.5142086, -3.613826, 0, 1, 0.8431373, 1,
-0.05849495, 1.348607, 1.507937, 0, 1, 0.8509804, 1,
-0.05807498, 0.3602635, 0.7732247, 0, 1, 0.854902, 1,
-0.05502253, -1.497875, -3.145765, 0, 1, 0.8627451, 1,
-0.04940132, 0.1132229, -0.3077668, 0, 1, 0.8666667, 1,
-0.04657622, -0.08036988, -1.14329, 0, 1, 0.8745098, 1,
-0.04586938, 0.7727482, -0.8171445, 0, 1, 0.8784314, 1,
-0.04549304, -0.2926868, -3.015465, 0, 1, 0.8862745, 1,
-0.04535828, 0.5766294, 0.5138461, 0, 1, 0.8901961, 1,
-0.03905667, -0.9679577, -2.431616, 0, 1, 0.8980392, 1,
-0.03542331, 0.4846425, 0.555974, 0, 1, 0.9058824, 1,
-0.03236171, 0.4118683, 0.4010235, 0, 1, 0.9098039, 1,
-0.0287354, 0.01168102, -3.373957, 0, 1, 0.9176471, 1,
-0.02090568, -1.239122, -4.603736, 0, 1, 0.9215686, 1,
-0.01970758, -1.332944, -1.630038, 0, 1, 0.9294118, 1,
-0.01667992, -0.4152877, -2.666888, 0, 1, 0.9333333, 1,
-0.001002056, -0.2725152, -2.781407, 0, 1, 0.9411765, 1,
-0.0005312192, 2.106899, -0.5295757, 0, 1, 0.945098, 1,
0.001054919, 0.6709819, 0.6334008, 0, 1, 0.9529412, 1,
0.003152058, 0.356394, 0.1034187, 0, 1, 0.9568627, 1,
0.003378723, -1.042188, 3.821545, 0, 1, 0.9647059, 1,
0.006159456, 0.5195308, -0.177783, 0, 1, 0.9686275, 1,
0.01086778, 0.7632238, -0.1615359, 0, 1, 0.9764706, 1,
0.01493151, -0.5921186, 4.006384, 0, 1, 0.9803922, 1,
0.01527985, 1.430463, 0.5526168, 0, 1, 0.9882353, 1,
0.01821914, -1.945611, 0.9041561, 0, 1, 0.9921569, 1,
0.02407528, 2.082846, -0.6781149, 0, 1, 1, 1,
0.03212111, -1.000048, 2.891385, 0, 0.9921569, 1, 1,
0.03742383, -0.7944329, 3.037093, 0, 0.9882353, 1, 1,
0.04046692, -0.4259634, 2.088094, 0, 0.9803922, 1, 1,
0.04218238, 0.6496631, 0.07462741, 0, 0.9764706, 1, 1,
0.04441141, 0.4199419, -1.180411, 0, 0.9686275, 1, 1,
0.04475231, -1.381909, 2.652249, 0, 0.9647059, 1, 1,
0.04753758, -0.4194156, 2.881854, 0, 0.9568627, 1, 1,
0.048446, 0.4056035, 0.7250898, 0, 0.9529412, 1, 1,
0.05167334, -0.8601815, 3.349329, 0, 0.945098, 1, 1,
0.05322119, -1.892417, 3.650962, 0, 0.9411765, 1, 1,
0.05472869, -1.158828, 3.366508, 0, 0.9333333, 1, 1,
0.05572419, 1.642786, 1.705792, 0, 0.9294118, 1, 1,
0.05765034, 0.2101364, -0.1125694, 0, 0.9215686, 1, 1,
0.05766519, 2.03824, 1.084204, 0, 0.9176471, 1, 1,
0.06102271, 0.5149769, -1.257883, 0, 0.9098039, 1, 1,
0.06348783, -0.7762731, 1.994347, 0, 0.9058824, 1, 1,
0.0645425, 0.09465011, -0.2389169, 0, 0.8980392, 1, 1,
0.06761245, -0.4002929, 2.547916, 0, 0.8901961, 1, 1,
0.06910425, -1.382636, 2.550705, 0, 0.8862745, 1, 1,
0.07073255, 1.29332, -0.7177281, 0, 0.8784314, 1, 1,
0.07545085, 0.6083276, -2.679865, 0, 0.8745098, 1, 1,
0.09195106, 0.7949252, -0.3000481, 0, 0.8666667, 1, 1,
0.09221458, -1.104782, 3.148581, 0, 0.8627451, 1, 1,
0.09506549, -0.695004, 1.876045, 0, 0.854902, 1, 1,
0.0963118, -1.166723, 1.737951, 0, 0.8509804, 1, 1,
0.09674925, 0.1692282, 0.03900199, 0, 0.8431373, 1, 1,
0.09935162, -0.3351058, 4.607308, 0, 0.8392157, 1, 1,
0.1008173, -0.1492855, 3.136763, 0, 0.8313726, 1, 1,
0.1033254, -0.2362075, 3.108021, 0, 0.827451, 1, 1,
0.1034756, 0.6692868, -0.2527039, 0, 0.8196079, 1, 1,
0.1039229, 1.157538, -0.1230162, 0, 0.8156863, 1, 1,
0.1041027, 1.244439, 0.4011348, 0, 0.8078431, 1, 1,
0.106729, 0.9918532, -2.291438, 0, 0.8039216, 1, 1,
0.1089594, -0.795974, 2.785391, 0, 0.7960784, 1, 1,
0.1147965, 1.180597, 1.755846, 0, 0.7882353, 1, 1,
0.1156635, 2.215558, -1.707304, 0, 0.7843137, 1, 1,
0.1185041, 1.695956, -0.6168098, 0, 0.7764706, 1, 1,
0.1187024, -0.8225839, 3.284009, 0, 0.772549, 1, 1,
0.1187415, -0.6458373, 2.925033, 0, 0.7647059, 1, 1,
0.1234923, -0.1851011, 2.342637, 0, 0.7607843, 1, 1,
0.1237207, 0.2416898, -1.822862, 0, 0.7529412, 1, 1,
0.1254359, -0.4819004, 4.347497, 0, 0.7490196, 1, 1,
0.1258557, 0.879117, 0.08620935, 0, 0.7411765, 1, 1,
0.1268076, -0.7041763, 3.196815, 0, 0.7372549, 1, 1,
0.1290489, -0.2881953, 2.911223, 0, 0.7294118, 1, 1,
0.1300049, 1.316242, 0.02820824, 0, 0.7254902, 1, 1,
0.1309544, 0.1758081, -0.7229025, 0, 0.7176471, 1, 1,
0.1327727, -0.6587242, 2.63116, 0, 0.7137255, 1, 1,
0.1346881, -0.9402373, 4.331476, 0, 0.7058824, 1, 1,
0.1380452, -0.3968465, 2.020865, 0, 0.6980392, 1, 1,
0.1381083, 0.6255363, -0.1783031, 0, 0.6941177, 1, 1,
0.1386692, 1.157248, -0.7959901, 0, 0.6862745, 1, 1,
0.1408771, 0.6703328, -0.8276743, 0, 0.682353, 1, 1,
0.1434069, 1.877974, 1.277789, 0, 0.6745098, 1, 1,
0.1437548, -0.2970674, 3.480712, 0, 0.6705883, 1, 1,
0.1464876, -0.7751205, 2.222106, 0, 0.6627451, 1, 1,
0.1499241, -0.4299433, 2.35329, 0, 0.6588235, 1, 1,
0.1520632, -0.5714661, 1.097376, 0, 0.6509804, 1, 1,
0.1525367, 2.231066, -0.1030345, 0, 0.6470588, 1, 1,
0.1550411, 0.4869626, 0.1958966, 0, 0.6392157, 1, 1,
0.1593063, 0.06992076, 2.94254, 0, 0.6352941, 1, 1,
0.1593245, 0.6390894, -0.6390932, 0, 0.627451, 1, 1,
0.1642012, 0.9264404, -0.3624729, 0, 0.6235294, 1, 1,
0.1656109, -0.3729125, 0.3579861, 0, 0.6156863, 1, 1,
0.1685572, 0.4084273, 1.630088, 0, 0.6117647, 1, 1,
0.168669, -1.281722, 3.205544, 0, 0.6039216, 1, 1,
0.168876, 1.396671, -0.2677622, 0, 0.5960785, 1, 1,
0.1774878, 0.5782024, -0.05953078, 0, 0.5921569, 1, 1,
0.1794036, -0.9956588, 2.939406, 0, 0.5843138, 1, 1,
0.1898072, -0.5978129, 1.796994, 0, 0.5803922, 1, 1,
0.1908355, 0.03316811, 2.524633, 0, 0.572549, 1, 1,
0.1976095, 0.0100146, 2.028556, 0, 0.5686275, 1, 1,
0.1977248, -0.2428308, 3.742229, 0, 0.5607843, 1, 1,
0.2062523, -0.9662117, 3.357629, 0, 0.5568628, 1, 1,
0.2090728, -0.5819626, 0.8114063, 0, 0.5490196, 1, 1,
0.2098204, -0.1468389, 1.8335, 0, 0.5450981, 1, 1,
0.213183, -0.6633666, 3.087478, 0, 0.5372549, 1, 1,
0.2141629, -0.9297327, 3.22573, 0, 0.5333334, 1, 1,
0.2174107, -0.1407813, 1.930557, 0, 0.5254902, 1, 1,
0.2182954, -1.401302, 2.725769, 0, 0.5215687, 1, 1,
0.2190885, -0.8331605, 4.140263, 0, 0.5137255, 1, 1,
0.2205697, 0.2889464, 0.5411909, 0, 0.509804, 1, 1,
0.2256185, 0.1700355, -0.3078153, 0, 0.5019608, 1, 1,
0.2398926, 1.031628, 2.208897, 0, 0.4941176, 1, 1,
0.2403464, -0.3724588, 3.266468, 0, 0.4901961, 1, 1,
0.243285, 0.1370038, 0.8652072, 0, 0.4823529, 1, 1,
0.2447795, 0.2114203, 0.906827, 0, 0.4784314, 1, 1,
0.2524746, -1.408907, 2.011014, 0, 0.4705882, 1, 1,
0.2545484, 0.3896168, -0.330751, 0, 0.4666667, 1, 1,
0.2564767, 1.399974, -1.036679, 0, 0.4588235, 1, 1,
0.2571583, -0.8119132, 3.700344, 0, 0.454902, 1, 1,
0.2648472, -0.7172778, 1.462805, 0, 0.4470588, 1, 1,
0.2648848, 1.23782, 0.2998781, 0, 0.4431373, 1, 1,
0.267015, 0.2502021, -1.058815, 0, 0.4352941, 1, 1,
0.2776354, 1.672727, -0.5732699, 0, 0.4313726, 1, 1,
0.2783656, 0.6729224, 0.7847229, 0, 0.4235294, 1, 1,
0.2822067, -1.072166, 2.568443, 0, 0.4196078, 1, 1,
0.2832941, 1.378201, -1.216396, 0, 0.4117647, 1, 1,
0.2844592, 0.2015372, -1.260422, 0, 0.4078431, 1, 1,
0.2855264, 0.9573417, 0.7977819, 0, 0.4, 1, 1,
0.2860121, 0.1469048, 1.63865, 0, 0.3921569, 1, 1,
0.2895564, 1.222685, 0.5307308, 0, 0.3882353, 1, 1,
0.2897255, -0.4401442, 3.558972, 0, 0.3803922, 1, 1,
0.2903399, 0.08582573, 2.446364, 0, 0.3764706, 1, 1,
0.2913437, -0.6973972, 3.296299, 0, 0.3686275, 1, 1,
0.2929876, 0.3497841, 0.1869459, 0, 0.3647059, 1, 1,
0.2932147, 1.287175, 0.299127, 0, 0.3568628, 1, 1,
0.2963187, 0.8813974, 0.03617471, 0, 0.3529412, 1, 1,
0.2985016, 0.7543043, 0.1437863, 0, 0.345098, 1, 1,
0.298641, 0.9773614, -2.114879, 0, 0.3411765, 1, 1,
0.2997837, 1.407407, 2.622982, 0, 0.3333333, 1, 1,
0.3000326, 0.9820779, 1.467816, 0, 0.3294118, 1, 1,
0.3069161, -0.2243786, 2.217644, 0, 0.3215686, 1, 1,
0.3084132, 0.8590131, 1.303553, 0, 0.3176471, 1, 1,
0.3099951, 1.993881, -1.375794, 0, 0.3098039, 1, 1,
0.3107163, -0.2567023, 4.353186, 0, 0.3058824, 1, 1,
0.3130634, -0.7442226, 2.676094, 0, 0.2980392, 1, 1,
0.314249, 1.236931, 0.7005414, 0, 0.2901961, 1, 1,
0.3163562, 0.1961776, -0.4211403, 0, 0.2862745, 1, 1,
0.3255532, -1.756765, 2.608864, 0, 0.2784314, 1, 1,
0.3268995, 0.0383294, 1.826638, 0, 0.2745098, 1, 1,
0.3273162, 0.6917678, -0.3004331, 0, 0.2666667, 1, 1,
0.3279837, 0.984173, 1.399644, 0, 0.2627451, 1, 1,
0.3286569, -1.541856, 2.997431, 0, 0.254902, 1, 1,
0.3310981, -0.1561178, 1.723982, 0, 0.2509804, 1, 1,
0.3363075, 0.4227077, 0.04698896, 0, 0.2431373, 1, 1,
0.3367707, -2.069724, 2.39313, 0, 0.2392157, 1, 1,
0.3385281, 2.45734, -1.459013, 0, 0.2313726, 1, 1,
0.3389779, 1.121171, -0.1297659, 0, 0.227451, 1, 1,
0.341893, -0.9308617, 1.090469, 0, 0.2196078, 1, 1,
0.3450046, -1.531013, 3.748952, 0, 0.2156863, 1, 1,
0.3450238, -0.8657075, 5.103388, 0, 0.2078431, 1, 1,
0.3479082, 0.8216313, 0.5039967, 0, 0.2039216, 1, 1,
0.3500585, 0.03217173, 3.08642, 0, 0.1960784, 1, 1,
0.3521481, -0.08844556, 0.5841261, 0, 0.1882353, 1, 1,
0.3534646, -0.1728856, 2.791513, 0, 0.1843137, 1, 1,
0.3542025, -0.6441334, 2.939723, 0, 0.1764706, 1, 1,
0.3587761, 0.7626788, 3.438945, 0, 0.172549, 1, 1,
0.3592505, -2.642226, 2.214362, 0, 0.1647059, 1, 1,
0.3616701, 0.7699653, 0.5392729, 0, 0.1607843, 1, 1,
0.3622273, 0.01334869, 1.688672, 0, 0.1529412, 1, 1,
0.3686785, -0.9904509, 3.893485, 0, 0.1490196, 1, 1,
0.3820057, -0.3985204, 3.899493, 0, 0.1411765, 1, 1,
0.3825893, -0.2439047, 0.3687985, 0, 0.1372549, 1, 1,
0.3847834, 0.5331779, 0.4762175, 0, 0.1294118, 1, 1,
0.3892807, 1.660924, 0.9993581, 0, 0.1254902, 1, 1,
0.3893332, -2.050285, 3.398, 0, 0.1176471, 1, 1,
0.3913334, 0.4507183, 1.03758, 0, 0.1137255, 1, 1,
0.4023957, 0.1543265, 1.64224, 0, 0.1058824, 1, 1,
0.4076551, -1.174231, 3.350696, 0, 0.09803922, 1, 1,
0.4079616, -0.5490041, 2.934748, 0, 0.09411765, 1, 1,
0.409281, 2.127716, 1.950407, 0, 0.08627451, 1, 1,
0.4161031, 0.2064753, -1.362572, 0, 0.08235294, 1, 1,
0.4175723, 0.3826396, 0.6517064, 0, 0.07450981, 1, 1,
0.4213598, -0.8829195, 2.384043, 0, 0.07058824, 1, 1,
0.4229372, -2.121662, 2.573466, 0, 0.0627451, 1, 1,
0.4255138, -0.4772191, 1.607147, 0, 0.05882353, 1, 1,
0.4271032, -2.02417, 2.180382, 0, 0.05098039, 1, 1,
0.4314223, 0.3360008, 1.12184, 0, 0.04705882, 1, 1,
0.4316044, -0.8540723, 1.486875, 0, 0.03921569, 1, 1,
0.4338919, 0.0619467, -0.1720225, 0, 0.03529412, 1, 1,
0.4373304, 0.7108799, 0.09380301, 0, 0.02745098, 1, 1,
0.4444921, -1.161718, 3.115263, 0, 0.02352941, 1, 1,
0.4454828, -1.515728, 3.727926, 0, 0.01568628, 1, 1,
0.4498581, -0.9221727, 1.583832, 0, 0.01176471, 1, 1,
0.4507568, -0.8590927, 2.908714, 0, 0.003921569, 1, 1,
0.4513766, -0.5637969, 2.012195, 0.003921569, 0, 1, 1,
0.4573382, 0.1223927, 1.913179, 0.007843138, 0, 1, 1,
0.4577816, -1.586299, 3.21763, 0.01568628, 0, 1, 1,
0.4619441, 0.7804562, 0.8552993, 0.01960784, 0, 1, 1,
0.4642498, -0.08111315, 0.2020393, 0.02745098, 0, 1, 1,
0.4725766, -0.9275653, 1.649187, 0.03137255, 0, 1, 1,
0.4739413, 0.1687725, 0.9158919, 0.03921569, 0, 1, 1,
0.4740233, 0.5983171, 0.7082555, 0.04313726, 0, 1, 1,
0.4755709, -0.1612352, 0.03028207, 0.05098039, 0, 1, 1,
0.4780399, -0.1797699, 1.944745, 0.05490196, 0, 1, 1,
0.4847218, -0.003086603, 2.146721, 0.0627451, 0, 1, 1,
0.489527, 1.744974, -1.035475, 0.06666667, 0, 1, 1,
0.491437, 1.702444, 0.003961483, 0.07450981, 0, 1, 1,
0.4949875, -1.785888, 2.971037, 0.07843138, 0, 1, 1,
0.4958681, -1.139114, 3.854524, 0.08627451, 0, 1, 1,
0.4958739, -0.2329854, 1.886221, 0.09019608, 0, 1, 1,
0.4959747, -1.217037, 2.112726, 0.09803922, 0, 1, 1,
0.4983705, 0.1677522, 1.997636, 0.1058824, 0, 1, 1,
0.498548, -0.2486125, 1.92613, 0.1098039, 0, 1, 1,
0.5021441, 1.137685, 0.9131826, 0.1176471, 0, 1, 1,
0.5022692, 0.63995, 0.9885852, 0.1215686, 0, 1, 1,
0.5037537, -0.1774191, 1.191095, 0.1294118, 0, 1, 1,
0.5079335, -0.4125798, 2.289581, 0.1333333, 0, 1, 1,
0.5175844, -0.02146791, 1.503259, 0.1411765, 0, 1, 1,
0.5237671, -0.5602405, 3.182275, 0.145098, 0, 1, 1,
0.5259703, 0.6261134, 2.12318, 0.1529412, 0, 1, 1,
0.5286455, 0.4550084, 0.8572347, 0.1568628, 0, 1, 1,
0.533524, 1.633554, 1.953182, 0.1647059, 0, 1, 1,
0.5402742, 0.01613366, 2.201111, 0.1686275, 0, 1, 1,
0.5457339, 0.527101, 0.6041913, 0.1764706, 0, 1, 1,
0.5481689, 0.2239799, 0.5673051, 0.1803922, 0, 1, 1,
0.5564976, 1.25803, -0.6153876, 0.1882353, 0, 1, 1,
0.5608636, -0.3622766, 0.9204822, 0.1921569, 0, 1, 1,
0.5613763, 0.2495581, 2.023398, 0.2, 0, 1, 1,
0.5720136, 0.3307241, 1.586442, 0.2078431, 0, 1, 1,
0.5736545, 0.3900202, 0.3658746, 0.2117647, 0, 1, 1,
0.574156, -0.9518181, 2.98575, 0.2196078, 0, 1, 1,
0.5837991, -1.130879, 1.933233, 0.2235294, 0, 1, 1,
0.5912361, -0.8145044, 2.449048, 0.2313726, 0, 1, 1,
0.5963678, -1.717017, 2.197153, 0.2352941, 0, 1, 1,
0.5978757, -0.1733633, 1.240371, 0.2431373, 0, 1, 1,
0.6011093, -1.878757, 2.377772, 0.2470588, 0, 1, 1,
0.6012014, -1.181305, 3.777703, 0.254902, 0, 1, 1,
0.601746, 0.03250996, -0.4026108, 0.2588235, 0, 1, 1,
0.6066399, -0.06205286, 1.348304, 0.2666667, 0, 1, 1,
0.6120446, -0.1128729, 0.8827801, 0.2705882, 0, 1, 1,
0.6122254, -2.969265, 1.85332, 0.2784314, 0, 1, 1,
0.6135615, 0.2746467, 1.059033, 0.282353, 0, 1, 1,
0.614765, -1.365986, 1.367512, 0.2901961, 0, 1, 1,
0.6185384, -0.1725032, 1.403219, 0.2941177, 0, 1, 1,
0.6190988, -0.8550873, 2.740357, 0.3019608, 0, 1, 1,
0.6219921, 2.972525, 1.061314, 0.3098039, 0, 1, 1,
0.6246635, 1.197913, 0.1118689, 0.3137255, 0, 1, 1,
0.6267691, -0.2338593, 2.133553, 0.3215686, 0, 1, 1,
0.6337356, -0.8475823, 1.892547, 0.3254902, 0, 1, 1,
0.6338153, -0.9279761, 1.975121, 0.3333333, 0, 1, 1,
0.6469287, -1.246849, 5.002062, 0.3372549, 0, 1, 1,
0.6475835, 1.364636, 0.6242549, 0.345098, 0, 1, 1,
0.649475, 0.8116031, -1.122989, 0.3490196, 0, 1, 1,
0.6536927, -0.5723152, 3.279322, 0.3568628, 0, 1, 1,
0.6546649, 0.6420668, 1.13942, 0.3607843, 0, 1, 1,
0.6578139, 0.225782, 3.466597, 0.3686275, 0, 1, 1,
0.66099, 0.03793404, 2.525681, 0.372549, 0, 1, 1,
0.6667577, -1.636845, 3.535897, 0.3803922, 0, 1, 1,
0.6688185, 0.6542298, 0.3857294, 0.3843137, 0, 1, 1,
0.6729919, 0.7413805, 1.057747, 0.3921569, 0, 1, 1,
0.6769272, 2.247869, -0.003463582, 0.3960784, 0, 1, 1,
0.6796455, 1.500826, 0.9023741, 0.4039216, 0, 1, 1,
0.679948, -0.5739499, 2.00745, 0.4117647, 0, 1, 1,
0.6849262, -0.2191884, 3.069957, 0.4156863, 0, 1, 1,
0.6854019, 0.1088611, 3.43813, 0.4235294, 0, 1, 1,
0.6915466, -1.110842, 2.930504, 0.427451, 0, 1, 1,
0.694913, -0.09804192, -0.3745722, 0.4352941, 0, 1, 1,
0.696661, 0.2723319, 0.9985008, 0.4392157, 0, 1, 1,
0.6993855, 0.9067498, 0.5449899, 0.4470588, 0, 1, 1,
0.7006115, 0.2348051, 1.461857, 0.4509804, 0, 1, 1,
0.7117012, 0.7200373, 2.204784, 0.4588235, 0, 1, 1,
0.7129397, 0.9716793, -0.8244638, 0.4627451, 0, 1, 1,
0.7161285, 0.02536127, 0.2816288, 0.4705882, 0, 1, 1,
0.7165737, -0.987612, 3.097446, 0.4745098, 0, 1, 1,
0.7189445, 0.7101711, -0.7927462, 0.4823529, 0, 1, 1,
0.7223688, -0.6666682, 3.166363, 0.4862745, 0, 1, 1,
0.7293426, 1.43866, -0.9223222, 0.4941176, 0, 1, 1,
0.730219, -0.9316368, 3.29863, 0.5019608, 0, 1, 1,
0.7312341, 0.5264661, 0.9803129, 0.5058824, 0, 1, 1,
0.7341206, 0.1307138, 1.491678, 0.5137255, 0, 1, 1,
0.7347273, 0.1873166, 0.6864003, 0.5176471, 0, 1, 1,
0.7396134, -1.187888, 2.547843, 0.5254902, 0, 1, 1,
0.7408897, -0.5707473, 2.01579, 0.5294118, 0, 1, 1,
0.745456, -1.120634, 1.078087, 0.5372549, 0, 1, 1,
0.74849, -0.7868031, 3.678137, 0.5411765, 0, 1, 1,
0.7517576, -0.9764608, 1.718496, 0.5490196, 0, 1, 1,
0.7534708, 0.1823044, 1.864836, 0.5529412, 0, 1, 1,
0.7536558, -0.709832, 2.585445, 0.5607843, 0, 1, 1,
0.7570124, -0.2193601, 0.8972177, 0.5647059, 0, 1, 1,
0.7579168, -0.01754595, 2.507735, 0.572549, 0, 1, 1,
0.7598481, 0.1516985, 0.4257534, 0.5764706, 0, 1, 1,
0.7620505, 1.241721, 0.9353212, 0.5843138, 0, 1, 1,
0.7636833, -0.01391401, 0.7597215, 0.5882353, 0, 1, 1,
0.7672718, -1.638456, 2.776067, 0.5960785, 0, 1, 1,
0.7729662, 1.341352, -0.3102485, 0.6039216, 0, 1, 1,
0.7791861, 0.5287767, 1.006894, 0.6078432, 0, 1, 1,
0.7797456, 0.4827699, 0.6243864, 0.6156863, 0, 1, 1,
0.7799902, 0.3979293, 2.045404, 0.6196079, 0, 1, 1,
0.7829651, 0.06289783, 1.421506, 0.627451, 0, 1, 1,
0.7837665, 0.7310393, 0.6002659, 0.6313726, 0, 1, 1,
0.7874538, 0.9800257, -0.9005716, 0.6392157, 0, 1, 1,
0.7919552, 0.1610407, 3.109389, 0.6431373, 0, 1, 1,
0.7933654, -2.355893, 3.540756, 0.6509804, 0, 1, 1,
0.8020178, -1.264425, 3.245755, 0.654902, 0, 1, 1,
0.8051172, 0.8396685, -0.1512719, 0.6627451, 0, 1, 1,
0.8095399, 0.001779887, 1.731275, 0.6666667, 0, 1, 1,
0.8098806, 0.230205, 1.136235, 0.6745098, 0, 1, 1,
0.8110067, 0.1646298, 1.971371, 0.6784314, 0, 1, 1,
0.8177667, 0.6658397, 2.064463, 0.6862745, 0, 1, 1,
0.8178089, -2.880042, 1.953527, 0.6901961, 0, 1, 1,
0.8245225, -0.5367937, 1.626862, 0.6980392, 0, 1, 1,
0.8314182, 1.232127, 1.146652, 0.7058824, 0, 1, 1,
0.8319256, -1.378223, 2.742535, 0.7098039, 0, 1, 1,
0.8342113, -0.5032216, 1.664431, 0.7176471, 0, 1, 1,
0.8383155, 0.08367535, 0.9817133, 0.7215686, 0, 1, 1,
0.839, -0.7048981, 1.729687, 0.7294118, 0, 1, 1,
0.8394141, 0.6009446, 1.154708, 0.7333333, 0, 1, 1,
0.8471448, -2.509916, 0.6459059, 0.7411765, 0, 1, 1,
0.8479499, -1.048922, 2.582515, 0.7450981, 0, 1, 1,
0.8483516, 0.79242, 0.5047722, 0.7529412, 0, 1, 1,
0.8527787, -0.4335537, 2.073102, 0.7568628, 0, 1, 1,
0.8534124, 1.69657, 0.3069088, 0.7647059, 0, 1, 1,
0.8537093, 1.002184, 0.03118724, 0.7686275, 0, 1, 1,
0.8542392, -1.393918, 1.712987, 0.7764706, 0, 1, 1,
0.8554693, 0.8485188, 0.4079029, 0.7803922, 0, 1, 1,
0.8561583, -1.090674, 2.474959, 0.7882353, 0, 1, 1,
0.8587024, -1.128981, 1.481515, 0.7921569, 0, 1, 1,
0.861087, 1.115653, 0.7123262, 0.8, 0, 1, 1,
0.8624968, 0.47675, 0.4353836, 0.8078431, 0, 1, 1,
0.8630721, 0.7252449, 0.160294, 0.8117647, 0, 1, 1,
0.8669949, -1.379809, 2.903092, 0.8196079, 0, 1, 1,
0.8693227, -0.9239257, 3.830729, 0.8235294, 0, 1, 1,
0.8763552, 0.07687931, 1.586432, 0.8313726, 0, 1, 1,
0.881292, 0.117112, 1.475862, 0.8352941, 0, 1, 1,
0.8835955, 0.08572293, 1.754899, 0.8431373, 0, 1, 1,
0.8862038, 0.2126587, 2.954695, 0.8470588, 0, 1, 1,
0.8882219, -1.546176, 4.2558, 0.854902, 0, 1, 1,
0.8999647, 0.073897, 2.079667, 0.8588235, 0, 1, 1,
0.9151744, -0.1283261, 1.340808, 0.8666667, 0, 1, 1,
0.9206643, 0.1303421, 1.76057, 0.8705882, 0, 1, 1,
0.9281605, 0.3280638, 1.580952, 0.8784314, 0, 1, 1,
0.9291298, 1.76311, 0.3889288, 0.8823529, 0, 1, 1,
0.9292309, 0.7220746, 1.858708, 0.8901961, 0, 1, 1,
0.9298891, -0.6994851, 2.694889, 0.8941177, 0, 1, 1,
0.9322118, 0.1037016, 1.361133, 0.9019608, 0, 1, 1,
0.9322705, -0.1166929, 1.360644, 0.9098039, 0, 1, 1,
0.932463, 0.3863441, 1.883288, 0.9137255, 0, 1, 1,
0.9477555, 0.4063939, 2.677448, 0.9215686, 0, 1, 1,
0.9487277, -2.15971, 2.664238, 0.9254902, 0, 1, 1,
0.9489415, -0.7937096, 1.782565, 0.9333333, 0, 1, 1,
0.950273, 0.2132398, 1.378573, 0.9372549, 0, 1, 1,
0.9542402, -0.133389, 3.018988, 0.945098, 0, 1, 1,
0.9616225, 0.4474595, 1.820577, 0.9490196, 0, 1, 1,
0.9625079, 0.8654857, 2.112294, 0.9568627, 0, 1, 1,
0.9625753, -1.860393, 2.296869, 0.9607843, 0, 1, 1,
0.9697398, -0.255878, 1.630973, 0.9686275, 0, 1, 1,
0.9706606, 0.1552673, 1.678818, 0.972549, 0, 1, 1,
0.9716254, 0.6954279, 0.438782, 0.9803922, 0, 1, 1,
0.972323, -0.4590543, 2.053877, 0.9843137, 0, 1, 1,
0.9752295, 1.135176, -0.7789449, 0.9921569, 0, 1, 1,
0.9813518, 0.8652817, 0.9597189, 0.9960784, 0, 1, 1,
0.9814268, -0.581138, 3.549107, 1, 0, 0.9960784, 1,
0.9883098, -0.8721738, 1.963083, 1, 0, 0.9882353, 1,
0.994166, -1.10903, 3.192907, 1, 0, 0.9843137, 1,
0.9950163, -0.03970117, -0.03686832, 1, 0, 0.9764706, 1,
0.9953723, 0.1267323, 2.657855, 1, 0, 0.972549, 1,
1.004553, 0.5500867, 1.01942, 1, 0, 0.9647059, 1,
1.006086, -2.614168, 3.20172, 1, 0, 0.9607843, 1,
1.006309, 0.7943682, 2.997524, 1, 0, 0.9529412, 1,
1.010079, -1.359431, 0.500743, 1, 0, 0.9490196, 1,
1.013077, 1.452418, 0.8201311, 1, 0, 0.9411765, 1,
1.020187, 0.6858884, 0.394334, 1, 0, 0.9372549, 1,
1.024216, -1.184948, 1.587142, 1, 0, 0.9294118, 1,
1.025424, -0.3937403, -0.536746, 1, 0, 0.9254902, 1,
1.029354, 2.207621, 0.2395037, 1, 0, 0.9176471, 1,
1.03285, 0.6239087, -0.628504, 1, 0, 0.9137255, 1,
1.039253, 1.011547, -0.3896656, 1, 0, 0.9058824, 1,
1.04709, 1.100616, 0.970043, 1, 0, 0.9019608, 1,
1.051942, -0.5459626, 1.785678, 1, 0, 0.8941177, 1,
1.05365, -1.00581, 3.232448, 1, 0, 0.8862745, 1,
1.057791, 0.9853573, 0.5046506, 1, 0, 0.8823529, 1,
1.058942, -0.2788879, 2.956597, 1, 0, 0.8745098, 1,
1.068302, -0.02475141, 1.342712, 1, 0, 0.8705882, 1,
1.071097, -0.2250253, 0.7888477, 1, 0, 0.8627451, 1,
1.074203, 0.7935381, 1.207288, 1, 0, 0.8588235, 1,
1.075267, 1.132652, -0.08456972, 1, 0, 0.8509804, 1,
1.07683, -0.866151, 2.219245, 1, 0, 0.8470588, 1,
1.081429, -0.1584775, 3.396579, 1, 0, 0.8392157, 1,
1.084993, -0.2009528, 2.340801, 1, 0, 0.8352941, 1,
1.092396, -0.8417198, 2.785056, 1, 0, 0.827451, 1,
1.09391, 1.567759, 1.509931, 1, 0, 0.8235294, 1,
1.096259, 0.1594669, 3.367877, 1, 0, 0.8156863, 1,
1.098551, 0.933351, 0.569936, 1, 0, 0.8117647, 1,
1.099351, -2.205156, 5.142619, 1, 0, 0.8039216, 1,
1.102566, 0.2378771, 0.9143484, 1, 0, 0.7960784, 1,
1.103223, -1.966746, 3.086423, 1, 0, 0.7921569, 1,
1.103372, 1.415126, 0.9468477, 1, 0, 0.7843137, 1,
1.103608, 1.162218, -1.169835, 1, 0, 0.7803922, 1,
1.106107, -2.125136, 2.437921, 1, 0, 0.772549, 1,
1.116897, -1.576554, 1.614639, 1, 0, 0.7686275, 1,
1.119736, -0.7887939, 2.739735, 1, 0, 0.7607843, 1,
1.122354, 2.203279, 0.5783026, 1, 0, 0.7568628, 1,
1.133646, 1.147638, 0.3198144, 1, 0, 0.7490196, 1,
1.141601, 0.0463758, 0.9288853, 1, 0, 0.7450981, 1,
1.143955, 0.03209511, 2.842062, 1, 0, 0.7372549, 1,
1.146743, -1.155507, 3.046206, 1, 0, 0.7333333, 1,
1.150043, 1.090387, 0.6936972, 1, 0, 0.7254902, 1,
1.150944, -0.1249305, 1.95652, 1, 0, 0.7215686, 1,
1.151976, -0.5540797, 3.054606, 1, 0, 0.7137255, 1,
1.159427, 1.162386, 2.145933, 1, 0, 0.7098039, 1,
1.160508, -0.3022571, 1.749835, 1, 0, 0.7019608, 1,
1.172031, 1.695551, 1.730989, 1, 0, 0.6941177, 1,
1.176467, -0.33263, 3.428304, 1, 0, 0.6901961, 1,
1.184334, 0.04492086, 2.064988, 1, 0, 0.682353, 1,
1.200972, 0.9351279, 0.06301059, 1, 0, 0.6784314, 1,
1.204353, -0.2434901, 2.475981, 1, 0, 0.6705883, 1,
1.213141, 0.9918686, 0.6465808, 1, 0, 0.6666667, 1,
1.214618, -1.341315, 2.565389, 1, 0, 0.6588235, 1,
1.233018, -1.142298, 1.722798, 1, 0, 0.654902, 1,
1.235036, -1.314802, 3.135251, 1, 0, 0.6470588, 1,
1.240981, 2.00894, -0.06738591, 1, 0, 0.6431373, 1,
1.244014, 0.9745249, 0.3427445, 1, 0, 0.6352941, 1,
1.245252, -1.144833, 0.7643449, 1, 0, 0.6313726, 1,
1.248896, 1.121487, 0.9100665, 1, 0, 0.6235294, 1,
1.2648, -0.01369426, 1.222089, 1, 0, 0.6196079, 1,
1.270793, 0.1368725, 2.659993, 1, 0, 0.6117647, 1,
1.278634, 1.090943, 2.269074, 1, 0, 0.6078432, 1,
1.283268, -0.05426308, 2.857734, 1, 0, 0.6, 1,
1.28352, -0.3983397, 2.046093, 1, 0, 0.5921569, 1,
1.291112, -0.9974435, 1.849627, 1, 0, 0.5882353, 1,
1.291213, 0.05698487, 2.967196, 1, 0, 0.5803922, 1,
1.292948, -0.2490999, 0.9840434, 1, 0, 0.5764706, 1,
1.293563, -0.1728005, 1.282009, 1, 0, 0.5686275, 1,
1.294716, -0.007822636, 1.662362, 1, 0, 0.5647059, 1,
1.295534, 1.107334, 0.3255983, 1, 0, 0.5568628, 1,
1.303599, -0.06748443, -0.1440064, 1, 0, 0.5529412, 1,
1.305519, -0.3001569, 1.763004, 1, 0, 0.5450981, 1,
1.307436, -0.7229361, 0.4596808, 1, 0, 0.5411765, 1,
1.307964, 0.5071678, -0.07318404, 1, 0, 0.5333334, 1,
1.309794, 0.8373476, 0.6275381, 1, 0, 0.5294118, 1,
1.320001, -1.816224, 3.338747, 1, 0, 0.5215687, 1,
1.323869, 0.3591326, 2.0458, 1, 0, 0.5176471, 1,
1.331215, -0.7258274, 2.587152, 1, 0, 0.509804, 1,
1.332324, 0.1521053, 0.5955263, 1, 0, 0.5058824, 1,
1.342796, 0.2394212, 1.204272, 1, 0, 0.4980392, 1,
1.349181, -0.05310973, 0.9878453, 1, 0, 0.4901961, 1,
1.352377, 0.8810913, 2.692858, 1, 0, 0.4862745, 1,
1.358965, 1.83014, 0.9145554, 1, 0, 0.4784314, 1,
1.361328, -0.3602346, 4.297026, 1, 0, 0.4745098, 1,
1.362987, -2.147613, 3.745344, 1, 0, 0.4666667, 1,
1.377839, 0.238363, 1.856692, 1, 0, 0.4627451, 1,
1.380823, 0.591633, 0.8708207, 1, 0, 0.454902, 1,
1.389707, 0.2395285, 1.063413, 1, 0, 0.4509804, 1,
1.391941, 0.8213688, 1.147324, 1, 0, 0.4431373, 1,
1.4005, -0.8681422, 2.545585, 1, 0, 0.4392157, 1,
1.403084, 1.779207, 1.324286, 1, 0, 0.4313726, 1,
1.414715, 0.6920975, -0.2723131, 1, 0, 0.427451, 1,
1.440408, -0.296798, 1.921441, 1, 0, 0.4196078, 1,
1.441092, 0.3694528, 1.77291, 1, 0, 0.4156863, 1,
1.4456, 0.8716992, -0.5108897, 1, 0, 0.4078431, 1,
1.446128, -0.9809013, 1.74052, 1, 0, 0.4039216, 1,
1.453027, -2.051382, 1.397397, 1, 0, 0.3960784, 1,
1.508374, 0.3124121, 1.761021, 1, 0, 0.3882353, 1,
1.522854, -0.3150551, 1.222878, 1, 0, 0.3843137, 1,
1.542041, -0.1999248, 0.8998932, 1, 0, 0.3764706, 1,
1.561824, 0.7212164, 0.740885, 1, 0, 0.372549, 1,
1.573806, 0.3890922, 1.464704, 1, 0, 0.3647059, 1,
1.585914, -1.95277, 3.424432, 1, 0, 0.3607843, 1,
1.593896, 0.6706328, 3.272635, 1, 0, 0.3529412, 1,
1.613106, -0.2543792, 0.8704415, 1, 0, 0.3490196, 1,
1.625364, 0.00383086, 1.891436, 1, 0, 0.3411765, 1,
1.62621, -1.01301, 1.730437, 1, 0, 0.3372549, 1,
1.632069, 0.9173198, 0.1561158, 1, 0, 0.3294118, 1,
1.654443, 1.152331, -0.0507497, 1, 0, 0.3254902, 1,
1.67369, -0.7625341, 3.766713, 1, 0, 0.3176471, 1,
1.679858, 1.03679, 2.690266, 1, 0, 0.3137255, 1,
1.686287, 0.0605762, 1.499427, 1, 0, 0.3058824, 1,
1.704834, 1.602585, 1.096491, 1, 0, 0.2980392, 1,
1.720272, 0.626999, 0.4008767, 1, 0, 0.2941177, 1,
1.72409, -0.02604748, 2.229939, 1, 0, 0.2862745, 1,
1.735847, 0.4136212, 2.058407, 1, 0, 0.282353, 1,
1.74375, 0.2293273, 0.8481449, 1, 0, 0.2745098, 1,
1.75717, 1.470688, 2.550895, 1, 0, 0.2705882, 1,
1.765799, 0.8087157, 2.277152, 1, 0, 0.2627451, 1,
1.766277, 0.8409275, 0.748082, 1, 0, 0.2588235, 1,
1.769218, 1.634881, -0.2916438, 1, 0, 0.2509804, 1,
1.77036, 0.9349282, 0.7509885, 1, 0, 0.2470588, 1,
1.81054, 0.9863896, 1.577255, 1, 0, 0.2392157, 1,
1.823172, 1.796851, 2.465957, 1, 0, 0.2352941, 1,
1.824469, 0.7311843, 1.872664, 1, 0, 0.227451, 1,
1.841487, 0.2419516, -0.1485033, 1, 0, 0.2235294, 1,
1.847941, -0.9524838, 1.767873, 1, 0, 0.2156863, 1,
1.851808, 0.7956322, 1.269704, 1, 0, 0.2117647, 1,
1.860261, -0.5736867, 0.7512218, 1, 0, 0.2039216, 1,
1.860355, 1.131977, 2.307022, 1, 0, 0.1960784, 1,
1.895409, -0.7186461, 1.550412, 1, 0, 0.1921569, 1,
1.919167, -0.6572393, 2.130156, 1, 0, 0.1843137, 1,
1.921005, -0.2494609, -0.8891508, 1, 0, 0.1803922, 1,
1.923113, -0.9167239, 2.315591, 1, 0, 0.172549, 1,
1.937577, 1.090956, 1.46306, 1, 0, 0.1686275, 1,
1.944636, -1.098706, 2.703475, 1, 0, 0.1607843, 1,
1.959849, -1.059877, 2.402558, 1, 0, 0.1568628, 1,
1.961554, -1.942227, 4.877991, 1, 0, 0.1490196, 1,
1.964375, -0.9748302, 3.300335, 1, 0, 0.145098, 1,
1.967587, 0.5357313, 0.6597708, 1, 0, 0.1372549, 1,
1.996444, -2.116078, 1.123712, 1, 0, 0.1333333, 1,
2.010496, -0.2882059, -0.3056441, 1, 0, 0.1254902, 1,
2.026095, -0.4420919, 0.1288608, 1, 0, 0.1215686, 1,
2.045835, -1.567257, 2.028769, 1, 0, 0.1137255, 1,
2.072515, 1.323544, 2.400952, 1, 0, 0.1098039, 1,
2.096969, -0.06076866, 0.8050363, 1, 0, 0.1019608, 1,
2.133694, -0.4105074, 2.497803, 1, 0, 0.09411765, 1,
2.137437, 0.03089447, 1.238284, 1, 0, 0.09019608, 1,
2.142125, -1.091174, 2.375199, 1, 0, 0.08235294, 1,
2.163032, 0.5207696, 2.036791, 1, 0, 0.07843138, 1,
2.193008, 0.1171171, 2.153438, 1, 0, 0.07058824, 1,
2.246248, 0.547987, 0.9345143, 1, 0, 0.06666667, 1,
2.252412, -1.009234, 1.748594, 1, 0, 0.05882353, 1,
2.260621, -0.04371534, 1.529408, 1, 0, 0.05490196, 1,
2.29584, 0.8034082, 1.66118, 1, 0, 0.04705882, 1,
2.304624, -0.1375148, 1.738954, 1, 0, 0.04313726, 1,
2.392478, 0.9799899, 1.845214, 1, 0, 0.03529412, 1,
2.40466, 1.921859, -0.2557158, 1, 0, 0.03137255, 1,
2.41294, 1.089768, 1.621633, 1, 0, 0.02352941, 1,
2.479095, -0.4873709, 2.386157, 1, 0, 0.01960784, 1,
2.497452, -0.9751009, 0.72052, 1, 0, 0.01176471, 1,
2.831494, -2.859379, 2.982038, 1, 0, 0.007843138, 1
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
-0.006696463, -3.984989, -6.910903, 0, -0.5, 0.5, 0.5,
-0.006696463, -3.984989, -6.910903, 1, -0.5, 0.5, 0.5,
-0.006696463, -3.984989, -6.910903, 1, 1.5, 0.5, 0.5,
-0.006696463, -3.984989, -6.910903, 0, 1.5, 0.5, 0.5
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
-3.807033, 0.02697003, -6.910903, 0, -0.5, 0.5, 0.5,
-3.807033, 0.02697003, -6.910903, 1, -0.5, 0.5, 0.5,
-3.807033, 0.02697003, -6.910903, 1, 1.5, 0.5, 0.5,
-3.807033, 0.02697003, -6.910903, 0, 1.5, 0.5, 0.5
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
-3.807033, -3.984989, -0.01066113, 0, -0.5, 0.5, 0.5,
-3.807033, -3.984989, -0.01066113, 1, -0.5, 0.5, 0.5,
-3.807033, -3.984989, -0.01066113, 1, 1.5, 0.5, 0.5,
-3.807033, -3.984989, -0.01066113, 0, 1.5, 0.5, 0.5
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
-2, -3.059152, -5.31854,
2, -3.059152, -5.31854,
-2, -3.059152, -5.31854,
-2, -3.213458, -5.583934,
-1, -3.059152, -5.31854,
-1, -3.213458, -5.583934,
0, -3.059152, -5.31854,
0, -3.213458, -5.583934,
1, -3.059152, -5.31854,
1, -3.213458, -5.583934,
2, -3.059152, -5.31854,
2, -3.213458, -5.583934
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
-2, -3.522071, -6.114722, 0, -0.5, 0.5, 0.5,
-2, -3.522071, -6.114722, 1, -0.5, 0.5, 0.5,
-2, -3.522071, -6.114722, 1, 1.5, 0.5, 0.5,
-2, -3.522071, -6.114722, 0, 1.5, 0.5, 0.5,
-1, -3.522071, -6.114722, 0, -0.5, 0.5, 0.5,
-1, -3.522071, -6.114722, 1, -0.5, 0.5, 0.5,
-1, -3.522071, -6.114722, 1, 1.5, 0.5, 0.5,
-1, -3.522071, -6.114722, 0, 1.5, 0.5, 0.5,
0, -3.522071, -6.114722, 0, -0.5, 0.5, 0.5,
0, -3.522071, -6.114722, 1, -0.5, 0.5, 0.5,
0, -3.522071, -6.114722, 1, 1.5, 0.5, 0.5,
0, -3.522071, -6.114722, 0, 1.5, 0.5, 0.5,
1, -3.522071, -6.114722, 0, -0.5, 0.5, 0.5,
1, -3.522071, -6.114722, 1, -0.5, 0.5, 0.5,
1, -3.522071, -6.114722, 1, 1.5, 0.5, 0.5,
1, -3.522071, -6.114722, 0, 1.5, 0.5, 0.5,
2, -3.522071, -6.114722, 0, -0.5, 0.5, 0.5,
2, -3.522071, -6.114722, 1, -0.5, 0.5, 0.5,
2, -3.522071, -6.114722, 1, 1.5, 0.5, 0.5,
2, -3.522071, -6.114722, 0, 1.5, 0.5, 0.5
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
-2.930032, -2, -5.31854,
-2.930032, 3, -5.31854,
-2.930032, -2, -5.31854,
-3.076199, -2, -5.583934,
-2.930032, -1, -5.31854,
-3.076199, -1, -5.583934,
-2.930032, 0, -5.31854,
-3.076199, 0, -5.583934,
-2.930032, 1, -5.31854,
-3.076199, 1, -5.583934,
-2.930032, 2, -5.31854,
-3.076199, 2, -5.583934,
-2.930032, 3, -5.31854,
-3.076199, 3, -5.583934
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
-3.368533, -2, -6.114722, 0, -0.5, 0.5, 0.5,
-3.368533, -2, -6.114722, 1, -0.5, 0.5, 0.5,
-3.368533, -2, -6.114722, 1, 1.5, 0.5, 0.5,
-3.368533, -2, -6.114722, 0, 1.5, 0.5, 0.5,
-3.368533, -1, -6.114722, 0, -0.5, 0.5, 0.5,
-3.368533, -1, -6.114722, 1, -0.5, 0.5, 0.5,
-3.368533, -1, -6.114722, 1, 1.5, 0.5, 0.5,
-3.368533, -1, -6.114722, 0, 1.5, 0.5, 0.5,
-3.368533, 0, -6.114722, 0, -0.5, 0.5, 0.5,
-3.368533, 0, -6.114722, 1, -0.5, 0.5, 0.5,
-3.368533, 0, -6.114722, 1, 1.5, 0.5, 0.5,
-3.368533, 0, -6.114722, 0, 1.5, 0.5, 0.5,
-3.368533, 1, -6.114722, 0, -0.5, 0.5, 0.5,
-3.368533, 1, -6.114722, 1, -0.5, 0.5, 0.5,
-3.368533, 1, -6.114722, 1, 1.5, 0.5, 0.5,
-3.368533, 1, -6.114722, 0, 1.5, 0.5, 0.5,
-3.368533, 2, -6.114722, 0, -0.5, 0.5, 0.5,
-3.368533, 2, -6.114722, 1, -0.5, 0.5, 0.5,
-3.368533, 2, -6.114722, 1, 1.5, 0.5, 0.5,
-3.368533, 2, -6.114722, 0, 1.5, 0.5, 0.5,
-3.368533, 3, -6.114722, 0, -0.5, 0.5, 0.5,
-3.368533, 3, -6.114722, 1, -0.5, 0.5, 0.5,
-3.368533, 3, -6.114722, 1, 1.5, 0.5, 0.5,
-3.368533, 3, -6.114722, 0, 1.5, 0.5, 0.5
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
-2.930032, -3.059152, -4,
-2.930032, -3.059152, 4,
-2.930032, -3.059152, -4,
-3.076199, -3.213458, -4,
-2.930032, -3.059152, -2,
-3.076199, -3.213458, -2,
-2.930032, -3.059152, 0,
-3.076199, -3.213458, 0,
-2.930032, -3.059152, 2,
-3.076199, -3.213458, 2,
-2.930032, -3.059152, 4,
-3.076199, -3.213458, 4
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
-3.368533, -3.522071, -4, 0, -0.5, 0.5, 0.5,
-3.368533, -3.522071, -4, 1, -0.5, 0.5, 0.5,
-3.368533, -3.522071, -4, 1, 1.5, 0.5, 0.5,
-3.368533, -3.522071, -4, 0, 1.5, 0.5, 0.5,
-3.368533, -3.522071, -2, 0, -0.5, 0.5, 0.5,
-3.368533, -3.522071, -2, 1, -0.5, 0.5, 0.5,
-3.368533, -3.522071, -2, 1, 1.5, 0.5, 0.5,
-3.368533, -3.522071, -2, 0, 1.5, 0.5, 0.5,
-3.368533, -3.522071, 0, 0, -0.5, 0.5, 0.5,
-3.368533, -3.522071, 0, 1, -0.5, 0.5, 0.5,
-3.368533, -3.522071, 0, 1, 1.5, 0.5, 0.5,
-3.368533, -3.522071, 0, 0, 1.5, 0.5, 0.5,
-3.368533, -3.522071, 2, 0, -0.5, 0.5, 0.5,
-3.368533, -3.522071, 2, 1, -0.5, 0.5, 0.5,
-3.368533, -3.522071, 2, 1, 1.5, 0.5, 0.5,
-3.368533, -3.522071, 2, 0, 1.5, 0.5, 0.5,
-3.368533, -3.522071, 4, 0, -0.5, 0.5, 0.5,
-3.368533, -3.522071, 4, 1, -0.5, 0.5, 0.5,
-3.368533, -3.522071, 4, 1, 1.5, 0.5, 0.5,
-3.368533, -3.522071, 4, 0, 1.5, 0.5, 0.5
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
-2.930032, -3.059152, -5.31854,
-2.930032, 3.113092, -5.31854,
-2.930032, -3.059152, 5.297217,
-2.930032, 3.113092, 5.297217,
-2.930032, -3.059152, -5.31854,
-2.930032, -3.059152, 5.297217,
-2.930032, 3.113092, -5.31854,
-2.930032, 3.113092, 5.297217,
-2.930032, -3.059152, -5.31854,
2.91664, -3.059152, -5.31854,
-2.930032, -3.059152, 5.297217,
2.91664, -3.059152, 5.297217,
-2.930032, 3.113092, -5.31854,
2.91664, 3.113092, -5.31854,
-2.930032, 3.113092, 5.297217,
2.91664, 3.113092, 5.297217,
2.91664, -3.059152, -5.31854,
2.91664, 3.113092, -5.31854,
2.91664, -3.059152, 5.297217,
2.91664, 3.113092, 5.297217,
2.91664, -3.059152, -5.31854,
2.91664, -3.059152, 5.297217,
2.91664, 3.113092, -5.31854,
2.91664, 3.113092, 5.297217
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
var radius = 7.26242;
var distance = 32.31133;
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
mvMatrix.translate( 0.006696463, -0.02697003, 0.01066113 );
mvMatrix.scale( 1.343033, 1.272191, 0.7396807 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.31133);
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
fenfuram<-read.table("fenfuram.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenfuram$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
```

```r
y<-fenfuram$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
```

```r
z<-fenfuram$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenfuram' not found
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
-2.844887, -2.06988, -1.154567, 0, 0, 1, 1, 1,
-2.782435, 0.1205313, -0.2745208, 1, 0, 0, 1, 1,
-2.6514, -0.5030724, -1.295947, 1, 0, 0, 1, 1,
-2.64445, 0.6979442, -0.4151174, 1, 0, 0, 1, 1,
-2.534702, -1.691283, -0.6194971, 1, 0, 0, 1, 1,
-2.492863, 0.01497837, -2.42751, 1, 0, 0, 1, 1,
-2.44301, -1.500339, -1.694491, 0, 0, 0, 1, 1,
-2.421641, -0.2452221, -2.318252, 0, 0, 0, 1, 1,
-2.391495, 0.4699652, -1.389569, 0, 0, 0, 1, 1,
-2.36497, 1.218331, -1.461547, 0, 0, 0, 1, 1,
-2.354233, -0.05202584, -1.3881, 0, 0, 0, 1, 1,
-2.283986, 1.021115, -0.7233094, 0, 0, 0, 1, 1,
-2.224106, 0.5684918, 0.184738, 0, 0, 0, 1, 1,
-2.216691, -1.361765, -2.21492, 1, 1, 1, 1, 1,
-2.196673, 1.061121, -1.886159, 1, 1, 1, 1, 1,
-2.18516, -1.594239, -3.151852, 1, 1, 1, 1, 1,
-2.175378, 0.1651653, -1.621075, 1, 1, 1, 1, 1,
-2.173194, 0.1604312, -1.008839, 1, 1, 1, 1, 1,
-2.131561, 1.711636, 0.5914791, 1, 1, 1, 1, 1,
-2.125158, 1.948613, 0.04577162, 1, 1, 1, 1, 1,
-2.098925, -0.9317905, -1.675763, 1, 1, 1, 1, 1,
-2.061401, 2.446402, -2.130172, 1, 1, 1, 1, 1,
-2.012405, 0.3917472, -2.511357, 1, 1, 1, 1, 1,
-1.992331, 1.212197, -0.1102408, 1, 1, 1, 1, 1,
-1.983877, -0.2172322, -1.679996, 1, 1, 1, 1, 1,
-1.975297, -0.2981255, -2.942345, 1, 1, 1, 1, 1,
-1.968189, -0.8981783, -1.014141, 1, 1, 1, 1, 1,
-1.919786, 0.1091438, -2.147857, 1, 1, 1, 1, 1,
-1.90692, 1.108934, 1.850343, 0, 0, 1, 1, 1,
-1.881988, -0.4539996, -2.595736, 1, 0, 0, 1, 1,
-1.867047, 0.3752299, -2.055586, 1, 0, 0, 1, 1,
-1.860625, -0.6143122, -1.530025, 1, 0, 0, 1, 1,
-1.856064, -1.104717, -1.403456, 1, 0, 0, 1, 1,
-1.850734, 0.9520265, -2.430855, 1, 0, 0, 1, 1,
-1.848163, -0.7543057, -1.776713, 0, 0, 0, 1, 1,
-1.846078, -0.3884999, -2.580242, 0, 0, 0, 1, 1,
-1.843882, 0.7389575, -0.5506234, 0, 0, 0, 1, 1,
-1.83554, 0.7486339, -1.286489, 0, 0, 0, 1, 1,
-1.808201, -0.8735796, -2.685616, 0, 0, 0, 1, 1,
-1.803552, -1.275062, -2.213527, 0, 0, 0, 1, 1,
-1.76405, -0.9013789, -3.480269, 0, 0, 0, 1, 1,
-1.752034, -0.8856405, -2.55805, 1, 1, 1, 1, 1,
-1.723656, 2.198643, -1.348285, 1, 1, 1, 1, 1,
-1.721855, -0.2309003, -1.376065, 1, 1, 1, 1, 1,
-1.719659, 0.2268526, -2.038171, 1, 1, 1, 1, 1,
-1.698833, 1.324014, -0.6902308, 1, 1, 1, 1, 1,
-1.691032, 1.07109, -0.8244576, 1, 1, 1, 1, 1,
-1.682867, -0.9324073, -0.4851082, 1, 1, 1, 1, 1,
-1.677737, 0.4126064, -1.197543, 1, 1, 1, 1, 1,
-1.671512, 2.105924, -0.6125066, 1, 1, 1, 1, 1,
-1.66934, 1.916555, -0.3271153, 1, 1, 1, 1, 1,
-1.662528, -0.6833337, -2.837262, 1, 1, 1, 1, 1,
-1.658394, -0.06543808, -2.259456, 1, 1, 1, 1, 1,
-1.642065, -1.599243, -2.122282, 1, 1, 1, 1, 1,
-1.640437, -0.9916896, -2.476584, 1, 1, 1, 1, 1,
-1.634514, 0.4834171, -0.4528928, 1, 1, 1, 1, 1,
-1.61605, 0.8127279, -0.9750021, 0, 0, 1, 1, 1,
-1.606724, -0.3340397, -2.087296, 1, 0, 0, 1, 1,
-1.604265, 1.989637, 0.3666468, 1, 0, 0, 1, 1,
-1.581831, 1.238787, -0.0307729, 1, 0, 0, 1, 1,
-1.577942, -2.010679, -0.9745674, 1, 0, 0, 1, 1,
-1.574187, -0.06306527, -2.644731, 1, 0, 0, 1, 1,
-1.573803, 0.5692627, -3.098491, 0, 0, 0, 1, 1,
-1.564918, -1.560576, -1.292576, 0, 0, 0, 1, 1,
-1.560275, 0.1028689, -0.2037317, 0, 0, 0, 1, 1,
-1.558193, -1.397072, -1.863801, 0, 0, 0, 1, 1,
-1.555043, 1.567125, -0.6203666, 0, 0, 0, 1, 1,
-1.547033, 0.2160531, -1.949797, 0, 0, 0, 1, 1,
-1.531237, 1.376297, -1.500913, 0, 0, 0, 1, 1,
-1.531191, -0.494498, -1.36977, 1, 1, 1, 1, 1,
-1.53029, 0.5575452, -0.4948399, 1, 1, 1, 1, 1,
-1.519233, -0.4497418, -1.145202, 1, 1, 1, 1, 1,
-1.509008, 0.5339019, -2.084372, 1, 1, 1, 1, 1,
-1.506685, 0.6681186, -2.390227, 1, 1, 1, 1, 1,
-1.4994, 0.4426706, -1.97563, 1, 1, 1, 1, 1,
-1.490692, 1.501569, -1.023763, 1, 1, 1, 1, 1,
-1.47268, 0.06193512, -1.469837, 1, 1, 1, 1, 1,
-1.470706, 0.07980163, -0.5917542, 1, 1, 1, 1, 1,
-1.467955, 0.1211481, -1.813161, 1, 1, 1, 1, 1,
-1.467318, -2.297714, -3.89396, 1, 1, 1, 1, 1,
-1.465574, 1.49987, -0.8905069, 1, 1, 1, 1, 1,
-1.455208, 0.1100455, -0.3127067, 1, 1, 1, 1, 1,
-1.448681, 0.3435094, -2.216443, 1, 1, 1, 1, 1,
-1.437151, 1.363188, -0.149141, 1, 1, 1, 1, 1,
-1.417118, -0.6308743, -0.1292143, 0, 0, 1, 1, 1,
-1.413249, -0.1985072, -2.652156, 1, 0, 0, 1, 1,
-1.40469, -0.9322071, -3.870736, 1, 0, 0, 1, 1,
-1.387537, -2.577605, -3.821478, 1, 0, 0, 1, 1,
-1.378427, 0.569253, -0.07575427, 1, 0, 0, 1, 1,
-1.377788, -1.57107, -1.831913, 1, 0, 0, 1, 1,
-1.353348, 0.4148541, -0.8591576, 0, 0, 0, 1, 1,
-1.346968, -0.9774309, -2.284902, 0, 0, 0, 1, 1,
-1.341785, 0.6387053, -2.859964, 0, 0, 0, 1, 1,
-1.336772, 0.7917835, 0.199634, 0, 0, 0, 1, 1,
-1.3272, 0.3390325, -1.400997, 0, 0, 0, 1, 1,
-1.316929, -0.1988819, -1.775056, 0, 0, 0, 1, 1,
-1.309862, 0.446059, -1.974273, 0, 0, 0, 1, 1,
-1.308037, 0.8093767, -0.9507677, 1, 1, 1, 1, 1,
-1.304322, 0.1578465, -1.781471, 1, 1, 1, 1, 1,
-1.294505, -0.5182723, -2.123427, 1, 1, 1, 1, 1,
-1.289532, 1.574805, -0.5485312, 1, 1, 1, 1, 1,
-1.282344, 0.4206562, -0.6490629, 1, 1, 1, 1, 1,
-1.277749, -1.294817, -3.93163, 1, 1, 1, 1, 1,
-1.266359, -0.08295549, -1.918254, 1, 1, 1, 1, 1,
-1.249947, -1.570556, -3.855833, 1, 1, 1, 1, 1,
-1.240471, 1.609174, 0.1489543, 1, 1, 1, 1, 1,
-1.230297, -1.025144, -3.539645, 1, 1, 1, 1, 1,
-1.229557, 0.3685451, -0.217238, 1, 1, 1, 1, 1,
-1.225431, 0.00388207, -1.898379, 1, 1, 1, 1, 1,
-1.217983, 0.7322485, -1.456445, 1, 1, 1, 1, 1,
-1.215707, -1.966184, -2.127142, 1, 1, 1, 1, 1,
-1.214501, -0.7067214, -4.112606, 1, 1, 1, 1, 1,
-1.207663, 0.1636022, -1.352596, 0, 0, 1, 1, 1,
-1.202564, -0.1775565, -1.122461, 1, 0, 0, 1, 1,
-1.179542, -0.1249158, -2.192987, 1, 0, 0, 1, 1,
-1.176043, 2.03883, 1.126339, 1, 0, 0, 1, 1,
-1.17008, -0.5143201, -1.41747, 1, 0, 0, 1, 1,
-1.16923, -1.252139, -3.023193, 1, 0, 0, 1, 1,
-1.163563, -0.3365577, -2.443451, 0, 0, 0, 1, 1,
-1.16242, -0.1918377, -3.17682, 0, 0, 0, 1, 1,
-1.15749, -0.0694048, -1.132585, 0, 0, 0, 1, 1,
-1.157326, -0.3329525, -3.170254, 0, 0, 0, 1, 1,
-1.156678, 0.1380272, -2.522701, 0, 0, 0, 1, 1,
-1.146585, 0.285799, -0.9587057, 0, 0, 0, 1, 1,
-1.142796, 1.154035, -0.3783216, 0, 0, 0, 1, 1,
-1.140008, -0.4464351, -3.033818, 1, 1, 1, 1, 1,
-1.134133, -0.5911193, -3.301793, 1, 1, 1, 1, 1,
-1.131062, -0.9364603, -3.632667, 1, 1, 1, 1, 1,
-1.124161, -1.814891, -1.333858, 1, 1, 1, 1, 1,
-1.120827, -0.6559132, -3.74175, 1, 1, 1, 1, 1,
-1.114051, 0.4605803, -0.9869832, 1, 1, 1, 1, 1,
-1.112322, 0.5424734, -1.378013, 1, 1, 1, 1, 1,
-1.097074, 0.2969063, -2.46634, 1, 1, 1, 1, 1,
-1.095858, 0.6500241, -1.021822, 1, 1, 1, 1, 1,
-1.092826, -0.04946686, -1.854713, 1, 1, 1, 1, 1,
-1.079924, 0.07602708, -2.079805, 1, 1, 1, 1, 1,
-1.075195, 1.339599, 0.276519, 1, 1, 1, 1, 1,
-1.0708, -0.9078588, -2.060702, 1, 1, 1, 1, 1,
-1.066174, 1.723782, -0.2251668, 1, 1, 1, 1, 1,
-1.065749, 2.042811, -1.982025, 1, 1, 1, 1, 1,
-1.0636, 0.3718192, -1.639848, 0, 0, 1, 1, 1,
-1.059171, -1.346528, -4.222228, 1, 0, 0, 1, 1,
-1.047957, 0.3355717, -0.3164594, 1, 0, 0, 1, 1,
-1.047206, -0.04431306, -2.011223, 1, 0, 0, 1, 1,
-1.040763, 0.9937909, 0.2759989, 1, 0, 0, 1, 1,
-1.03821, 0.6677363, -0.9754146, 1, 0, 0, 1, 1,
-1.031036, -1.119166, -0.525346, 0, 0, 0, 1, 1,
-1.029639, 0.5159228, -1.003938, 0, 0, 0, 1, 1,
-1.026752, -1.221447, -1.242574, 0, 0, 0, 1, 1,
-1.01599, -0.04554662, -2.571388, 0, 0, 0, 1, 1,
-1.014066, -0.4093554, -0.277993, 0, 0, 0, 1, 1,
-1.009255, 0.4405725, -0.5576847, 0, 0, 0, 1, 1,
-1.006233, 1.936989, 0.3819072, 0, 0, 0, 1, 1,
-0.9931579, -1.512417, -1.730918, 1, 1, 1, 1, 1,
-0.9930491, -0.5049294, -1.392881, 1, 1, 1, 1, 1,
-0.9902974, -1.810536, -2.73406, 1, 1, 1, 1, 1,
-0.9898344, -0.07445257, -1.475539, 1, 1, 1, 1, 1,
-0.9751866, -0.3706062, -2.735538, 1, 1, 1, 1, 1,
-0.9742565, 0.8245509, -0.3705637, 1, 1, 1, 1, 1,
-0.9627921, -0.7976616, -2.379946, 1, 1, 1, 1, 1,
-0.9598367, -0.3852767, -0.8908654, 1, 1, 1, 1, 1,
-0.9553996, 0.6011438, -1.992345, 1, 1, 1, 1, 1,
-0.9514885, 1.855975, -0.8777717, 1, 1, 1, 1, 1,
-0.9512156, -1.318599, -2.824803, 1, 1, 1, 1, 1,
-0.9505089, 0.3709811, -0.8605189, 1, 1, 1, 1, 1,
-0.9493586, -0.7372152, -0.2939226, 1, 1, 1, 1, 1,
-0.9480715, 0.1371586, -1.570711, 1, 1, 1, 1, 1,
-0.9461582, -0.3988409, -2.259117, 1, 1, 1, 1, 1,
-0.9461504, 1.483889, -0.6752015, 0, 0, 1, 1, 1,
-0.9423034, 0.9625179, -0.5606302, 1, 0, 0, 1, 1,
-0.9345288, 1.537456, 0.1679007, 1, 0, 0, 1, 1,
-0.9269394, -0.5946401, -2.113165, 1, 0, 0, 1, 1,
-0.918245, 1.013836, -1.411492, 1, 0, 0, 1, 1,
-0.9114657, -0.04795706, -1.36842, 1, 0, 0, 1, 1,
-0.9062656, 0.6719315, -0.9450728, 0, 0, 0, 1, 1,
-0.9041685, -2.13276, -2.752646, 0, 0, 0, 1, 1,
-0.902321, 0.233142, -0.0757462, 0, 0, 0, 1, 1,
-0.8959188, 0.2848785, -0.8850999, 0, 0, 0, 1, 1,
-0.8942722, 1.336364, -0.7978995, 0, 0, 0, 1, 1,
-0.8932167, -1.531666, -3.587368, 0, 0, 0, 1, 1,
-0.8867426, 0.3669142, -3.009593, 0, 0, 0, 1, 1,
-0.8864651, 0.3999456, -0.3968935, 1, 1, 1, 1, 1,
-0.8818157, 0.4809336, -1.133242, 1, 1, 1, 1, 1,
-0.8793966, -0.878577, -2.263128, 1, 1, 1, 1, 1,
-0.8790234, 0.613014, -0.2249908, 1, 1, 1, 1, 1,
-0.8772909, -2.342685, -2.411371, 1, 1, 1, 1, 1,
-0.8670648, -0.4074169, -1.865953, 1, 1, 1, 1, 1,
-0.8669578, -1.173002, -0.7242626, 1, 1, 1, 1, 1,
-0.8629386, 0.4791554, 1.008556, 1, 1, 1, 1, 1,
-0.8622705, -1.112833, -1.513841, 1, 1, 1, 1, 1,
-0.861653, 0.7756699, -0.8150044, 1, 1, 1, 1, 1,
-0.8615401, -1.832115, -2.405532, 1, 1, 1, 1, 1,
-0.8566926, -0.9429355, -2.448977, 1, 1, 1, 1, 1,
-0.8544388, -0.5332949, -2.852239, 1, 1, 1, 1, 1,
-0.8537154, -0.6383584, -1.164896, 1, 1, 1, 1, 1,
-0.853642, 0.2584834, -1.167784, 1, 1, 1, 1, 1,
-0.8529993, -0.9806302, -3.933507, 0, 0, 1, 1, 1,
-0.8507931, 0.4222303, 0.9061978, 1, 0, 0, 1, 1,
-0.8503037, -0.6258634, -0.7685197, 1, 0, 0, 1, 1,
-0.847211, -1.127138, -3.524935, 1, 0, 0, 1, 1,
-0.8434893, -1.004845, -2.454367, 1, 0, 0, 1, 1,
-0.8417125, -0.6228667, -2.522774, 1, 0, 0, 1, 1,
-0.8381149, 1.058483, 0.9486066, 0, 0, 0, 1, 1,
-0.8367555, -0.2709038, -3.742593, 0, 0, 0, 1, 1,
-0.8357898, -0.7079039, -1.724421, 0, 0, 0, 1, 1,
-0.8296861, -2.483793, -3.032584, 0, 0, 0, 1, 1,
-0.8246641, -0.9436927, -2.744245, 0, 0, 0, 1, 1,
-0.8212271, -0.6453955, -1.357089, 0, 0, 0, 1, 1,
-0.8198512, -0.6159819, -1.494995, 0, 0, 0, 1, 1,
-0.8145984, 1.49386, -0.1005288, 1, 1, 1, 1, 1,
-0.8124394, 0.8462811, -1.655249, 1, 1, 1, 1, 1,
-0.8085329, -0.7206359, -2.624778, 1, 1, 1, 1, 1,
-0.808134, -1.694655, -3.676458, 1, 1, 1, 1, 1,
-0.8075753, 0.845475, -1.160947, 1, 1, 1, 1, 1,
-0.8066542, 0.6418465, -1.300561, 1, 1, 1, 1, 1,
-0.7983438, 0.6379343, 0.5900475, 1, 1, 1, 1, 1,
-0.7963538, -0.9774999, -3.187134, 1, 1, 1, 1, 1,
-0.7934133, 2.104008, -1.19511, 1, 1, 1, 1, 1,
-0.7924214, -1.004221, -2.331226, 1, 1, 1, 1, 1,
-0.790555, 0.2478881, -0.9971996, 1, 1, 1, 1, 1,
-0.7899619, -0.372246, -3.639318, 1, 1, 1, 1, 1,
-0.7860513, 0.2645364, 0.2944895, 1, 1, 1, 1, 1,
-0.7803756, 1.728004, 0.1893004, 1, 1, 1, 1, 1,
-0.7782236, 1.511396, 2.337866, 1, 1, 1, 1, 1,
-0.7771748, -0.1691576, -3.030843, 0, 0, 1, 1, 1,
-0.77267, -1.752128, -3.014975, 1, 0, 0, 1, 1,
-0.7704793, 0.8041281, -1.755856, 1, 0, 0, 1, 1,
-0.7674463, 0.3327791, -0.1852403, 1, 0, 0, 1, 1,
-0.7659215, 1.062363, -1.863064, 1, 0, 0, 1, 1,
-0.7626945, -0.5473838, -2.32343, 1, 0, 0, 1, 1,
-0.7623947, -1.578004, -4.76293, 0, 0, 0, 1, 1,
-0.7452686, 0.7635874, -2.123979, 0, 0, 0, 1, 1,
-0.738862, -0.3231343, -2.506021, 0, 0, 0, 1, 1,
-0.7375355, -0.939584, -1.191192, 0, 0, 0, 1, 1,
-0.7360737, 0.6833047, -1.274786, 0, 0, 0, 1, 1,
-0.7356726, 0.1851248, 0.06325866, 0, 0, 0, 1, 1,
-0.727273, 0.251317, -0.1949925, 0, 0, 0, 1, 1,
-0.7221804, -0.9215534, -3.672205, 1, 1, 1, 1, 1,
-0.7122834, -1.695793, -1.440697, 1, 1, 1, 1, 1,
-0.7118146, 0.1566767, -2.681799, 1, 1, 1, 1, 1,
-0.7097923, 0.3744619, -1.910346, 1, 1, 1, 1, 1,
-0.7075767, 0.2176968, -2.403951, 1, 1, 1, 1, 1,
-0.702659, 0.1652667, 0.132221, 1, 1, 1, 1, 1,
-0.7015901, 0.8556057, 0.9380016, 1, 1, 1, 1, 1,
-0.6997761, 0.1551761, 1.163171, 1, 1, 1, 1, 1,
-0.6990474, 0.6598409, -0.8967218, 1, 1, 1, 1, 1,
-0.698137, 0.3689265, -0.4397104, 1, 1, 1, 1, 1,
-0.693662, -0.02135399, -1.180364, 1, 1, 1, 1, 1,
-0.683856, -0.7548016, -2.239802, 1, 1, 1, 1, 1,
-0.6824006, 1.187888, -0.9536846, 1, 1, 1, 1, 1,
-0.6810498, 1.130296, -0.723048, 1, 1, 1, 1, 1,
-0.6773255, 1.003464, -0.2954882, 1, 1, 1, 1, 1,
-0.6755409, 1.809612, -0.1244289, 0, 0, 1, 1, 1,
-0.6730518, 0.4088092, 0.105401, 1, 0, 0, 1, 1,
-0.6728995, -0.7024171, -2.353385, 1, 0, 0, 1, 1,
-0.6696959, 0.01696818, -1.45118, 1, 0, 0, 1, 1,
-0.6682085, 0.3147898, -0.8668065, 1, 0, 0, 1, 1,
-0.6649696, 1.234083, -1.21863, 1, 0, 0, 1, 1,
-0.6611585, -0.09900165, -2.645654, 0, 0, 0, 1, 1,
-0.6607007, 0.3153996, -0.5111598, 0, 0, 0, 1, 1,
-0.6592228, 0.1166237, -2.686479, 0, 0, 0, 1, 1,
-0.6535851, -1.059683, -3.213771, 0, 0, 0, 1, 1,
-0.6509275, -1.856792, -2.012337, 0, 0, 0, 1, 1,
-0.6504866, -1.113489, -3.749033, 0, 0, 0, 1, 1,
-0.646444, -0.2043531, -2.705104, 0, 0, 0, 1, 1,
-0.6396497, 1.512748, -0.4204324, 1, 1, 1, 1, 1,
-0.6392236, 0.7737558, -0.6396772, 1, 1, 1, 1, 1,
-0.6372456, 0.4363247, 0.009353762, 1, 1, 1, 1, 1,
-0.6340646, -0.800636, -2.507526, 1, 1, 1, 1, 1,
-0.6329371, 1.209609, -0.3670183, 1, 1, 1, 1, 1,
-0.6174139, -1.414526, -1.743977, 1, 1, 1, 1, 1,
-0.6096532, 0.9097716, -0.5214413, 1, 1, 1, 1, 1,
-0.5952047, 0.8617272, -0.7246559, 1, 1, 1, 1, 1,
-0.5938995, 1.994768, -0.1405973, 1, 1, 1, 1, 1,
-0.5930282, -0.1496971, -3.953326, 1, 1, 1, 1, 1,
-0.5906298, -0.6400244, -1.519573, 1, 1, 1, 1, 1,
-0.5871288, -1.174054, -2.668504, 1, 1, 1, 1, 1,
-0.5862387, -0.5533786, -2.114545, 1, 1, 1, 1, 1,
-0.5845321, -0.7473845, -3.617749, 1, 1, 1, 1, 1,
-0.5819008, -0.0158732, -1.397753, 1, 1, 1, 1, 1,
-0.5788355, 1.417868, 1.204553, 0, 0, 1, 1, 1,
-0.5775086, -0.52691, -2.403266, 1, 0, 0, 1, 1,
-0.575556, 0.0244184, -2.42205, 1, 0, 0, 1, 1,
-0.5726721, -0.5846727, -2.143564, 1, 0, 0, 1, 1,
-0.5686914, 0.5802282, -0.2932102, 1, 0, 0, 1, 1,
-0.5685831, 1.457092, 1.115561, 1, 0, 0, 1, 1,
-0.5682661, 1.352737, 2.251674, 0, 0, 0, 1, 1,
-0.5632741, 0.1797748, -2.471464, 0, 0, 0, 1, 1,
-0.5628172, -0.4587488, -2.664953, 0, 0, 0, 1, 1,
-0.5625151, -0.7327417, -2.88094, 0, 0, 0, 1, 1,
-0.5606588, -0.8158522, -1.940449, 0, 0, 0, 1, 1,
-0.5570545, 1.585715, -1.089859, 0, 0, 0, 1, 1,
-0.5527592, 1.656683, -1.517404, 0, 0, 0, 1, 1,
-0.5497566, -1.401129, -2.955162, 1, 1, 1, 1, 1,
-0.5483631, 1.235113, -0.385473, 1, 1, 1, 1, 1,
-0.5468864, 2.725627, 1.124447, 1, 1, 1, 1, 1,
-0.5393517, -0.3050771, 0.123418, 1, 1, 1, 1, 1,
-0.5391353, -1.148816, -3.947178, 1, 1, 1, 1, 1,
-0.5386692, 0.03638656, -0.04927366, 1, 1, 1, 1, 1,
-0.5335865, -1.065413, -0.9576343, 1, 1, 1, 1, 1,
-0.5305728, -0.3007983, -2.745355, 1, 1, 1, 1, 1,
-0.5254059, -0.4060697, -1.929083, 1, 1, 1, 1, 1,
-0.5226229, 0.3646768, -1.05634, 1, 1, 1, 1, 1,
-0.5210649, -0.2914673, -1.400112, 1, 1, 1, 1, 1,
-0.5183812, -0.7923661, -3.248684, 1, 1, 1, 1, 1,
-0.5136228, 0.6049928, -2.432926, 1, 1, 1, 1, 1,
-0.5127883, -1.049978, -4.29905, 1, 1, 1, 1, 1,
-0.5118701, -0.7971249, -2.836198, 1, 1, 1, 1, 1,
-0.5118085, 0.1907738, -2.022283, 0, 0, 1, 1, 1,
-0.4946361, 0.4050575, -0.8880191, 1, 0, 0, 1, 1,
-0.4893355, -1.413678, -2.546, 1, 0, 0, 1, 1,
-0.466854, 1.334547, 1.239802, 1, 0, 0, 1, 1,
-0.4661352, -0.4415927, -1.258813, 1, 0, 0, 1, 1,
-0.4634092, -1.568513, -3.105628, 1, 0, 0, 1, 1,
-0.4610617, 1.442675, 0.9654083, 0, 0, 0, 1, 1,
-0.4606206, 0.8456761, 0.4923291, 0, 0, 0, 1, 1,
-0.4581528, -1.074602, -2.424036, 0, 0, 0, 1, 1,
-0.4524464, -1.799191, -2.310024, 0, 0, 0, 1, 1,
-0.452434, -0.3053261, -1.225718, 0, 0, 0, 1, 1,
-0.4522045, -1.767846, -4.827035, 0, 0, 0, 1, 1,
-0.4498469, 0.7837707, -1.179519, 0, 0, 0, 1, 1,
-0.4496367, -0.42749, -0.7230015, 1, 1, 1, 1, 1,
-0.4495817, -1.617371, -2.323734, 1, 1, 1, 1, 1,
-0.4484236, -1.82012, -3.184473, 1, 1, 1, 1, 1,
-0.4483187, -0.8402696, -2.935156, 1, 1, 1, 1, 1,
-0.4442866, 0.1707617, -0.003688825, 1, 1, 1, 1, 1,
-0.4405032, -1.682721, -4.286815, 1, 1, 1, 1, 1,
-0.4401448, 0.0846108, -2.29253, 1, 1, 1, 1, 1,
-0.439605, -0.2505449, -1.548588, 1, 1, 1, 1, 1,
-0.439377, 0.2058642, -2.2995, 1, 1, 1, 1, 1,
-0.4386894, -0.4341967, -1.964078, 1, 1, 1, 1, 1,
-0.4367242, 0.3720512, -1.981361, 1, 1, 1, 1, 1,
-0.4364265, -0.4574409, -2.00432, 1, 1, 1, 1, 1,
-0.4361192, -0.6008456, -1.263569, 1, 1, 1, 1, 1,
-0.4355609, 0.2314183, 0.1453165, 1, 1, 1, 1, 1,
-0.4320182, -0.3931265, -1.483181, 1, 1, 1, 1, 1,
-0.430689, -2.712806, -2.959444, 0, 0, 1, 1, 1,
-0.4300048, -0.5219437, -4.02263, 1, 0, 0, 1, 1,
-0.4260809, -1.616173, -4.172609, 1, 0, 0, 1, 1,
-0.4252555, -0.527642, -2.781718, 1, 0, 0, 1, 1,
-0.4187186, 0.4874075, 0.2462299, 1, 0, 0, 1, 1,
-0.4151913, -0.7074341, -2.831141, 1, 0, 0, 1, 1,
-0.4115525, 0.9025262, -1.688107, 0, 0, 0, 1, 1,
-0.4086916, 1.022251, -2.892406, 0, 0, 0, 1, 1,
-0.4056612, -0.7033734, -0.007891995, 0, 0, 0, 1, 1,
-0.4050644, 0.6667757, -0.6741955, 0, 0, 0, 1, 1,
-0.3994489, -0.3409076, -1.317757, 0, 0, 0, 1, 1,
-0.399084, 0.08478125, -2.71089, 0, 0, 0, 1, 1,
-0.3985785, 2.013893, 1.107614, 0, 0, 0, 1, 1,
-0.3966018, -1.356682, -2.912677, 1, 1, 1, 1, 1,
-0.3964865, 0.662744, -1.627614, 1, 1, 1, 1, 1,
-0.394997, 1.652993, -0.7602856, 1, 1, 1, 1, 1,
-0.3842491, -1.367755, -4.679699, 1, 1, 1, 1, 1,
-0.3836086, 3.023205, 0.5123312, 1, 1, 1, 1, 1,
-0.37936, 1.643389, 0.6844766, 1, 1, 1, 1, 1,
-0.3786804, 0.8493921, -1.216554, 1, 1, 1, 1, 1,
-0.3762719, 0.105491, -1.029962, 1, 1, 1, 1, 1,
-0.3746722, -0.484994, -3.094843, 1, 1, 1, 1, 1,
-0.3730977, -1.566381, -2.91782, 1, 1, 1, 1, 1,
-0.3725989, 0.1643672, -0.5843713, 1, 1, 1, 1, 1,
-0.3724048, 0.2895952, -1.240204, 1, 1, 1, 1, 1,
-0.3711801, -0.32942, -2.124145, 1, 1, 1, 1, 1,
-0.3667854, -1.687442, -3.326296, 1, 1, 1, 1, 1,
-0.3648666, -1.076261, -2.40649, 1, 1, 1, 1, 1,
-0.3646554, 0.4786434, -1.270124, 0, 0, 1, 1, 1,
-0.3642929, -0.438381, -1.099217, 1, 0, 0, 1, 1,
-0.3514677, -0.4912477, -2.791999, 1, 0, 0, 1, 1,
-0.3500603, 1.034547, 0.1044424, 1, 0, 0, 1, 1,
-0.3400559, -0.4010863, -2.877773, 1, 0, 0, 1, 1,
-0.3389857, 0.3508405, 1.226738, 1, 0, 0, 1, 1,
-0.3313176, 0.6567237, -0.2527122, 0, 0, 0, 1, 1,
-0.3311673, -1.759724, -3.218275, 0, 0, 0, 1, 1,
-0.3262353, -0.3723042, -1.89479, 0, 0, 0, 1, 1,
-0.3245601, -0.4216629, -1.200835, 0, 0, 0, 1, 1,
-0.3217549, 1.332949, 0.1509812, 0, 0, 0, 1, 1,
-0.3191852, 0.3919677, -1.91367, 0, 0, 0, 1, 1,
-0.3176279, 1.076642, -0.6884838, 0, 0, 0, 1, 1,
-0.3162074, -1.295505, -2.331118, 1, 1, 1, 1, 1,
-0.3130415, -0.7203889, -3.927578, 1, 1, 1, 1, 1,
-0.3117, 0.5353751, -1.253638, 1, 1, 1, 1, 1,
-0.3027304, 0.2694764, -0.8843859, 1, 1, 1, 1, 1,
-0.3023383, -0.9151214, -2.144008, 1, 1, 1, 1, 1,
-0.2990597, -0.9254019, -3.285791, 1, 1, 1, 1, 1,
-0.2981466, -1.946244, -3.567262, 1, 1, 1, 1, 1,
-0.2967795, -0.262838, -1.662599, 1, 1, 1, 1, 1,
-0.2959908, -0.2508216, -2.337885, 1, 1, 1, 1, 1,
-0.2806579, 0.4198163, -1.224215, 1, 1, 1, 1, 1,
-0.2774795, -1.350067, -2.087033, 1, 1, 1, 1, 1,
-0.2674968, 1.164308, 0.5834805, 1, 1, 1, 1, 1,
-0.2655889, 0.2415216, -0.2270756, 1, 1, 1, 1, 1,
-0.2605623, 1.99337, -0.9068629, 1, 1, 1, 1, 1,
-0.2579335, -0.7928504, -3.769624, 1, 1, 1, 1, 1,
-0.2505717, -0.09437098, -2.574783, 0, 0, 1, 1, 1,
-0.247098, 0.9557175, 0.5503086, 1, 0, 0, 1, 1,
-0.246663, 0.1359113, -0.6878911, 1, 0, 0, 1, 1,
-0.2429153, 0.5402476, -0.6843852, 1, 0, 0, 1, 1,
-0.2393928, 0.6918145, 0.6725947, 1, 0, 0, 1, 1,
-0.2389907, 1.08885, -0.5188193, 1, 0, 0, 1, 1,
-0.2354593, 0.06229837, -1.875134, 0, 0, 0, 1, 1,
-0.234291, -0.4765113, -2.732062, 0, 0, 0, 1, 1,
-0.2332596, -0.03552376, -1.277781, 0, 0, 0, 1, 1,
-0.2331368, -0.9398832, -2.626205, 0, 0, 0, 1, 1,
-0.2315112, -0.05082489, -2.7604, 0, 0, 0, 1, 1,
-0.2278522, -0.3419068, -3.07136, 0, 0, 0, 1, 1,
-0.2266506, 0.03798261, 0.1381068, 0, 0, 0, 1, 1,
-0.2220822, 1.047355, -0.3159916, 1, 1, 1, 1, 1,
-0.2212923, -0.03283929, -2.857466, 1, 1, 1, 1, 1,
-0.2190859, -0.3724358, -3.470646, 1, 1, 1, 1, 1,
-0.2188636, -0.569643, -3.057866, 1, 1, 1, 1, 1,
-0.2163242, -0.7740845, -4.348911, 1, 1, 1, 1, 1,
-0.2147513, 1.306155, -2.186158, 1, 1, 1, 1, 1,
-0.2092986, 0.4076386, -0.2671163, 1, 1, 1, 1, 1,
-0.2089452, 1.236169, -0.2950567, 1, 1, 1, 1, 1,
-0.2062169, 0.019781, -2.775678, 1, 1, 1, 1, 1,
-0.2034477, -0.6618785, -2.600909, 1, 1, 1, 1, 1,
-0.2029442, -1.183138, -1.299834, 1, 1, 1, 1, 1,
-0.2008274, 0.4741405, 0.5837599, 1, 1, 1, 1, 1,
-0.2004946, 0.9434029, -0.2078932, 1, 1, 1, 1, 1,
-0.1999903, -0.713491, -2.991742, 1, 1, 1, 1, 1,
-0.1973096, 0.4206192, 0.5249988, 1, 1, 1, 1, 1,
-0.1972997, -2.763359, -3.327669, 0, 0, 1, 1, 1,
-0.1950849, -0.1628696, -2.13293, 1, 0, 0, 1, 1,
-0.1940695, -0.2030492, -3.867619, 1, 0, 0, 1, 1,
-0.1926515, -1.791269, -1.831458, 1, 0, 0, 1, 1,
-0.1921114, -1.615447, -3.867545, 1, 0, 0, 1, 1,
-0.1920819, 0.5901791, 0.3757216, 1, 0, 0, 1, 1,
-0.1906539, 0.08183077, -0.4644769, 0, 0, 0, 1, 1,
-0.1887269, 1.844162, 0.6704253, 0, 0, 0, 1, 1,
-0.1853917, 2.317144, -0.6930419, 0, 0, 0, 1, 1,
-0.1828821, -0.14988, -2.60402, 0, 0, 0, 1, 1,
-0.1795221, 0.4081793, -0.4028419, 0, 0, 0, 1, 1,
-0.1774565, 2.195397, -0.3735994, 0, 0, 0, 1, 1,
-0.1759289, 0.9172621, -0.7248517, 0, 0, 0, 1, 1,
-0.1745422, -0.9205213, -5.163941, 1, 1, 1, 1, 1,
-0.1741402, -1.490456, -2.594783, 1, 1, 1, 1, 1,
-0.1738469, -0.2236225, -1.204183, 1, 1, 1, 1, 1,
-0.1738308, -0.3891881, -3.349823, 1, 1, 1, 1, 1,
-0.1694519, 1.055432, -0.941996, 1, 1, 1, 1, 1,
-0.1684565, -0.239998, -1.819788, 1, 1, 1, 1, 1,
-0.1642294, 0.2137075, -2.568583, 1, 1, 1, 1, 1,
-0.1613292, 0.4315123, 0.6067424, 1, 1, 1, 1, 1,
-0.1602338, 0.00961055, -0.5441396, 1, 1, 1, 1, 1,
-0.156382, 0.4255275, 1.144168, 1, 1, 1, 1, 1,
-0.1472877, 0.5030827, 0.2419161, 1, 1, 1, 1, 1,
-0.1467114, 0.4611866, -2.82905, 1, 1, 1, 1, 1,
-0.1451081, 0.6743898, 0.4097659, 1, 1, 1, 1, 1,
-0.1416471, -0.9420751, -1.315404, 1, 1, 1, 1, 1,
-0.1380688, 0.6497433, 1.164097, 1, 1, 1, 1, 1,
-0.1352002, 0.3652872, -0.1842438, 0, 0, 1, 1, 1,
-0.1349923, 0.5817047, -0.3585933, 1, 0, 0, 1, 1,
-0.1340384, -1.605685, -3.408294, 1, 0, 0, 1, 1,
-0.1332605, 0.5219576, 0.6326057, 1, 0, 0, 1, 1,
-0.1298319, -0.4422345, -3.671076, 1, 0, 0, 1, 1,
-0.1237435, -0.3948795, -3.053086, 1, 0, 0, 1, 1,
-0.1215594, -0.1325474, -3.340577, 0, 0, 0, 1, 1,
-0.116239, 1.126257, -0.8840196, 0, 0, 0, 1, 1,
-0.1148342, -0.003761139, -1.018398, 0, 0, 0, 1, 1,
-0.1144557, -0.4910684, -3.552099, 0, 0, 0, 1, 1,
-0.112512, -0.4958771, -2.068504, 0, 0, 0, 1, 1,
-0.1116794, 1.177091, -1.351769, 0, 0, 0, 1, 1,
-0.1093461, 1.907377, -0.2605698, 0, 0, 0, 1, 1,
-0.1080297, -0.445083, -1.497686, 1, 1, 1, 1, 1,
-0.1074697, 1.899141, -1.687104, 1, 1, 1, 1, 1,
-0.1057218, -0.7967038, -5.159431, 1, 1, 1, 1, 1,
-0.09765288, 0.274543, -0.08707581, 1, 1, 1, 1, 1,
-0.09715416, 0.05585671, -2.471298, 1, 1, 1, 1, 1,
-0.09112791, -0.3827215, -2.89747, 1, 1, 1, 1, 1,
-0.09097604, 0.679857, 1.245391, 1, 1, 1, 1, 1,
-0.08602086, 0.1816211, 0.2471166, 1, 1, 1, 1, 1,
-0.08520164, -0.485953, -3.786291, 1, 1, 1, 1, 1,
-0.06604843, 1.111225, -1.121817, 1, 1, 1, 1, 1,
-0.06547607, -0.3606947, -2.26803, 1, 1, 1, 1, 1,
-0.0630262, -1.398523, -2.883531, 1, 1, 1, 1, 1,
-0.06250289, 0.2159942, -0.8397646, 1, 1, 1, 1, 1,
-0.06231278, -0.5142086, -3.613826, 1, 1, 1, 1, 1,
-0.05849495, 1.348607, 1.507937, 1, 1, 1, 1, 1,
-0.05807498, 0.3602635, 0.7732247, 0, 0, 1, 1, 1,
-0.05502253, -1.497875, -3.145765, 1, 0, 0, 1, 1,
-0.04940132, 0.1132229, -0.3077668, 1, 0, 0, 1, 1,
-0.04657622, -0.08036988, -1.14329, 1, 0, 0, 1, 1,
-0.04586938, 0.7727482, -0.8171445, 1, 0, 0, 1, 1,
-0.04549304, -0.2926868, -3.015465, 1, 0, 0, 1, 1,
-0.04535828, 0.5766294, 0.5138461, 0, 0, 0, 1, 1,
-0.03905667, -0.9679577, -2.431616, 0, 0, 0, 1, 1,
-0.03542331, 0.4846425, 0.555974, 0, 0, 0, 1, 1,
-0.03236171, 0.4118683, 0.4010235, 0, 0, 0, 1, 1,
-0.0287354, 0.01168102, -3.373957, 0, 0, 0, 1, 1,
-0.02090568, -1.239122, -4.603736, 0, 0, 0, 1, 1,
-0.01970758, -1.332944, -1.630038, 0, 0, 0, 1, 1,
-0.01667992, -0.4152877, -2.666888, 1, 1, 1, 1, 1,
-0.001002056, -0.2725152, -2.781407, 1, 1, 1, 1, 1,
-0.0005312192, 2.106899, -0.5295757, 1, 1, 1, 1, 1,
0.001054919, 0.6709819, 0.6334008, 1, 1, 1, 1, 1,
0.003152058, 0.356394, 0.1034187, 1, 1, 1, 1, 1,
0.003378723, -1.042188, 3.821545, 1, 1, 1, 1, 1,
0.006159456, 0.5195308, -0.177783, 1, 1, 1, 1, 1,
0.01086778, 0.7632238, -0.1615359, 1, 1, 1, 1, 1,
0.01493151, -0.5921186, 4.006384, 1, 1, 1, 1, 1,
0.01527985, 1.430463, 0.5526168, 1, 1, 1, 1, 1,
0.01821914, -1.945611, 0.9041561, 1, 1, 1, 1, 1,
0.02407528, 2.082846, -0.6781149, 1, 1, 1, 1, 1,
0.03212111, -1.000048, 2.891385, 1, 1, 1, 1, 1,
0.03742383, -0.7944329, 3.037093, 1, 1, 1, 1, 1,
0.04046692, -0.4259634, 2.088094, 1, 1, 1, 1, 1,
0.04218238, 0.6496631, 0.07462741, 0, 0, 1, 1, 1,
0.04441141, 0.4199419, -1.180411, 1, 0, 0, 1, 1,
0.04475231, -1.381909, 2.652249, 1, 0, 0, 1, 1,
0.04753758, -0.4194156, 2.881854, 1, 0, 0, 1, 1,
0.048446, 0.4056035, 0.7250898, 1, 0, 0, 1, 1,
0.05167334, -0.8601815, 3.349329, 1, 0, 0, 1, 1,
0.05322119, -1.892417, 3.650962, 0, 0, 0, 1, 1,
0.05472869, -1.158828, 3.366508, 0, 0, 0, 1, 1,
0.05572419, 1.642786, 1.705792, 0, 0, 0, 1, 1,
0.05765034, 0.2101364, -0.1125694, 0, 0, 0, 1, 1,
0.05766519, 2.03824, 1.084204, 0, 0, 0, 1, 1,
0.06102271, 0.5149769, -1.257883, 0, 0, 0, 1, 1,
0.06348783, -0.7762731, 1.994347, 0, 0, 0, 1, 1,
0.0645425, 0.09465011, -0.2389169, 1, 1, 1, 1, 1,
0.06761245, -0.4002929, 2.547916, 1, 1, 1, 1, 1,
0.06910425, -1.382636, 2.550705, 1, 1, 1, 1, 1,
0.07073255, 1.29332, -0.7177281, 1, 1, 1, 1, 1,
0.07545085, 0.6083276, -2.679865, 1, 1, 1, 1, 1,
0.09195106, 0.7949252, -0.3000481, 1, 1, 1, 1, 1,
0.09221458, -1.104782, 3.148581, 1, 1, 1, 1, 1,
0.09506549, -0.695004, 1.876045, 1, 1, 1, 1, 1,
0.0963118, -1.166723, 1.737951, 1, 1, 1, 1, 1,
0.09674925, 0.1692282, 0.03900199, 1, 1, 1, 1, 1,
0.09935162, -0.3351058, 4.607308, 1, 1, 1, 1, 1,
0.1008173, -0.1492855, 3.136763, 1, 1, 1, 1, 1,
0.1033254, -0.2362075, 3.108021, 1, 1, 1, 1, 1,
0.1034756, 0.6692868, -0.2527039, 1, 1, 1, 1, 1,
0.1039229, 1.157538, -0.1230162, 1, 1, 1, 1, 1,
0.1041027, 1.244439, 0.4011348, 0, 0, 1, 1, 1,
0.106729, 0.9918532, -2.291438, 1, 0, 0, 1, 1,
0.1089594, -0.795974, 2.785391, 1, 0, 0, 1, 1,
0.1147965, 1.180597, 1.755846, 1, 0, 0, 1, 1,
0.1156635, 2.215558, -1.707304, 1, 0, 0, 1, 1,
0.1185041, 1.695956, -0.6168098, 1, 0, 0, 1, 1,
0.1187024, -0.8225839, 3.284009, 0, 0, 0, 1, 1,
0.1187415, -0.6458373, 2.925033, 0, 0, 0, 1, 1,
0.1234923, -0.1851011, 2.342637, 0, 0, 0, 1, 1,
0.1237207, 0.2416898, -1.822862, 0, 0, 0, 1, 1,
0.1254359, -0.4819004, 4.347497, 0, 0, 0, 1, 1,
0.1258557, 0.879117, 0.08620935, 0, 0, 0, 1, 1,
0.1268076, -0.7041763, 3.196815, 0, 0, 0, 1, 1,
0.1290489, -0.2881953, 2.911223, 1, 1, 1, 1, 1,
0.1300049, 1.316242, 0.02820824, 1, 1, 1, 1, 1,
0.1309544, 0.1758081, -0.7229025, 1, 1, 1, 1, 1,
0.1327727, -0.6587242, 2.63116, 1, 1, 1, 1, 1,
0.1346881, -0.9402373, 4.331476, 1, 1, 1, 1, 1,
0.1380452, -0.3968465, 2.020865, 1, 1, 1, 1, 1,
0.1381083, 0.6255363, -0.1783031, 1, 1, 1, 1, 1,
0.1386692, 1.157248, -0.7959901, 1, 1, 1, 1, 1,
0.1408771, 0.6703328, -0.8276743, 1, 1, 1, 1, 1,
0.1434069, 1.877974, 1.277789, 1, 1, 1, 1, 1,
0.1437548, -0.2970674, 3.480712, 1, 1, 1, 1, 1,
0.1464876, -0.7751205, 2.222106, 1, 1, 1, 1, 1,
0.1499241, -0.4299433, 2.35329, 1, 1, 1, 1, 1,
0.1520632, -0.5714661, 1.097376, 1, 1, 1, 1, 1,
0.1525367, 2.231066, -0.1030345, 1, 1, 1, 1, 1,
0.1550411, 0.4869626, 0.1958966, 0, 0, 1, 1, 1,
0.1593063, 0.06992076, 2.94254, 1, 0, 0, 1, 1,
0.1593245, 0.6390894, -0.6390932, 1, 0, 0, 1, 1,
0.1642012, 0.9264404, -0.3624729, 1, 0, 0, 1, 1,
0.1656109, -0.3729125, 0.3579861, 1, 0, 0, 1, 1,
0.1685572, 0.4084273, 1.630088, 1, 0, 0, 1, 1,
0.168669, -1.281722, 3.205544, 0, 0, 0, 1, 1,
0.168876, 1.396671, -0.2677622, 0, 0, 0, 1, 1,
0.1774878, 0.5782024, -0.05953078, 0, 0, 0, 1, 1,
0.1794036, -0.9956588, 2.939406, 0, 0, 0, 1, 1,
0.1898072, -0.5978129, 1.796994, 0, 0, 0, 1, 1,
0.1908355, 0.03316811, 2.524633, 0, 0, 0, 1, 1,
0.1976095, 0.0100146, 2.028556, 0, 0, 0, 1, 1,
0.1977248, -0.2428308, 3.742229, 1, 1, 1, 1, 1,
0.2062523, -0.9662117, 3.357629, 1, 1, 1, 1, 1,
0.2090728, -0.5819626, 0.8114063, 1, 1, 1, 1, 1,
0.2098204, -0.1468389, 1.8335, 1, 1, 1, 1, 1,
0.213183, -0.6633666, 3.087478, 1, 1, 1, 1, 1,
0.2141629, -0.9297327, 3.22573, 1, 1, 1, 1, 1,
0.2174107, -0.1407813, 1.930557, 1, 1, 1, 1, 1,
0.2182954, -1.401302, 2.725769, 1, 1, 1, 1, 1,
0.2190885, -0.8331605, 4.140263, 1, 1, 1, 1, 1,
0.2205697, 0.2889464, 0.5411909, 1, 1, 1, 1, 1,
0.2256185, 0.1700355, -0.3078153, 1, 1, 1, 1, 1,
0.2398926, 1.031628, 2.208897, 1, 1, 1, 1, 1,
0.2403464, -0.3724588, 3.266468, 1, 1, 1, 1, 1,
0.243285, 0.1370038, 0.8652072, 1, 1, 1, 1, 1,
0.2447795, 0.2114203, 0.906827, 1, 1, 1, 1, 1,
0.2524746, -1.408907, 2.011014, 0, 0, 1, 1, 1,
0.2545484, 0.3896168, -0.330751, 1, 0, 0, 1, 1,
0.2564767, 1.399974, -1.036679, 1, 0, 0, 1, 1,
0.2571583, -0.8119132, 3.700344, 1, 0, 0, 1, 1,
0.2648472, -0.7172778, 1.462805, 1, 0, 0, 1, 1,
0.2648848, 1.23782, 0.2998781, 1, 0, 0, 1, 1,
0.267015, 0.2502021, -1.058815, 0, 0, 0, 1, 1,
0.2776354, 1.672727, -0.5732699, 0, 0, 0, 1, 1,
0.2783656, 0.6729224, 0.7847229, 0, 0, 0, 1, 1,
0.2822067, -1.072166, 2.568443, 0, 0, 0, 1, 1,
0.2832941, 1.378201, -1.216396, 0, 0, 0, 1, 1,
0.2844592, 0.2015372, -1.260422, 0, 0, 0, 1, 1,
0.2855264, 0.9573417, 0.7977819, 0, 0, 0, 1, 1,
0.2860121, 0.1469048, 1.63865, 1, 1, 1, 1, 1,
0.2895564, 1.222685, 0.5307308, 1, 1, 1, 1, 1,
0.2897255, -0.4401442, 3.558972, 1, 1, 1, 1, 1,
0.2903399, 0.08582573, 2.446364, 1, 1, 1, 1, 1,
0.2913437, -0.6973972, 3.296299, 1, 1, 1, 1, 1,
0.2929876, 0.3497841, 0.1869459, 1, 1, 1, 1, 1,
0.2932147, 1.287175, 0.299127, 1, 1, 1, 1, 1,
0.2963187, 0.8813974, 0.03617471, 1, 1, 1, 1, 1,
0.2985016, 0.7543043, 0.1437863, 1, 1, 1, 1, 1,
0.298641, 0.9773614, -2.114879, 1, 1, 1, 1, 1,
0.2997837, 1.407407, 2.622982, 1, 1, 1, 1, 1,
0.3000326, 0.9820779, 1.467816, 1, 1, 1, 1, 1,
0.3069161, -0.2243786, 2.217644, 1, 1, 1, 1, 1,
0.3084132, 0.8590131, 1.303553, 1, 1, 1, 1, 1,
0.3099951, 1.993881, -1.375794, 1, 1, 1, 1, 1,
0.3107163, -0.2567023, 4.353186, 0, 0, 1, 1, 1,
0.3130634, -0.7442226, 2.676094, 1, 0, 0, 1, 1,
0.314249, 1.236931, 0.7005414, 1, 0, 0, 1, 1,
0.3163562, 0.1961776, -0.4211403, 1, 0, 0, 1, 1,
0.3255532, -1.756765, 2.608864, 1, 0, 0, 1, 1,
0.3268995, 0.0383294, 1.826638, 1, 0, 0, 1, 1,
0.3273162, 0.6917678, -0.3004331, 0, 0, 0, 1, 1,
0.3279837, 0.984173, 1.399644, 0, 0, 0, 1, 1,
0.3286569, -1.541856, 2.997431, 0, 0, 0, 1, 1,
0.3310981, -0.1561178, 1.723982, 0, 0, 0, 1, 1,
0.3363075, 0.4227077, 0.04698896, 0, 0, 0, 1, 1,
0.3367707, -2.069724, 2.39313, 0, 0, 0, 1, 1,
0.3385281, 2.45734, -1.459013, 0, 0, 0, 1, 1,
0.3389779, 1.121171, -0.1297659, 1, 1, 1, 1, 1,
0.341893, -0.9308617, 1.090469, 1, 1, 1, 1, 1,
0.3450046, -1.531013, 3.748952, 1, 1, 1, 1, 1,
0.3450238, -0.8657075, 5.103388, 1, 1, 1, 1, 1,
0.3479082, 0.8216313, 0.5039967, 1, 1, 1, 1, 1,
0.3500585, 0.03217173, 3.08642, 1, 1, 1, 1, 1,
0.3521481, -0.08844556, 0.5841261, 1, 1, 1, 1, 1,
0.3534646, -0.1728856, 2.791513, 1, 1, 1, 1, 1,
0.3542025, -0.6441334, 2.939723, 1, 1, 1, 1, 1,
0.3587761, 0.7626788, 3.438945, 1, 1, 1, 1, 1,
0.3592505, -2.642226, 2.214362, 1, 1, 1, 1, 1,
0.3616701, 0.7699653, 0.5392729, 1, 1, 1, 1, 1,
0.3622273, 0.01334869, 1.688672, 1, 1, 1, 1, 1,
0.3686785, -0.9904509, 3.893485, 1, 1, 1, 1, 1,
0.3820057, -0.3985204, 3.899493, 1, 1, 1, 1, 1,
0.3825893, -0.2439047, 0.3687985, 0, 0, 1, 1, 1,
0.3847834, 0.5331779, 0.4762175, 1, 0, 0, 1, 1,
0.3892807, 1.660924, 0.9993581, 1, 0, 0, 1, 1,
0.3893332, -2.050285, 3.398, 1, 0, 0, 1, 1,
0.3913334, 0.4507183, 1.03758, 1, 0, 0, 1, 1,
0.4023957, 0.1543265, 1.64224, 1, 0, 0, 1, 1,
0.4076551, -1.174231, 3.350696, 0, 0, 0, 1, 1,
0.4079616, -0.5490041, 2.934748, 0, 0, 0, 1, 1,
0.409281, 2.127716, 1.950407, 0, 0, 0, 1, 1,
0.4161031, 0.2064753, -1.362572, 0, 0, 0, 1, 1,
0.4175723, 0.3826396, 0.6517064, 0, 0, 0, 1, 1,
0.4213598, -0.8829195, 2.384043, 0, 0, 0, 1, 1,
0.4229372, -2.121662, 2.573466, 0, 0, 0, 1, 1,
0.4255138, -0.4772191, 1.607147, 1, 1, 1, 1, 1,
0.4271032, -2.02417, 2.180382, 1, 1, 1, 1, 1,
0.4314223, 0.3360008, 1.12184, 1, 1, 1, 1, 1,
0.4316044, -0.8540723, 1.486875, 1, 1, 1, 1, 1,
0.4338919, 0.0619467, -0.1720225, 1, 1, 1, 1, 1,
0.4373304, 0.7108799, 0.09380301, 1, 1, 1, 1, 1,
0.4444921, -1.161718, 3.115263, 1, 1, 1, 1, 1,
0.4454828, -1.515728, 3.727926, 1, 1, 1, 1, 1,
0.4498581, -0.9221727, 1.583832, 1, 1, 1, 1, 1,
0.4507568, -0.8590927, 2.908714, 1, 1, 1, 1, 1,
0.4513766, -0.5637969, 2.012195, 1, 1, 1, 1, 1,
0.4573382, 0.1223927, 1.913179, 1, 1, 1, 1, 1,
0.4577816, -1.586299, 3.21763, 1, 1, 1, 1, 1,
0.4619441, 0.7804562, 0.8552993, 1, 1, 1, 1, 1,
0.4642498, -0.08111315, 0.2020393, 1, 1, 1, 1, 1,
0.4725766, -0.9275653, 1.649187, 0, 0, 1, 1, 1,
0.4739413, 0.1687725, 0.9158919, 1, 0, 0, 1, 1,
0.4740233, 0.5983171, 0.7082555, 1, 0, 0, 1, 1,
0.4755709, -0.1612352, 0.03028207, 1, 0, 0, 1, 1,
0.4780399, -0.1797699, 1.944745, 1, 0, 0, 1, 1,
0.4847218, -0.003086603, 2.146721, 1, 0, 0, 1, 1,
0.489527, 1.744974, -1.035475, 0, 0, 0, 1, 1,
0.491437, 1.702444, 0.003961483, 0, 0, 0, 1, 1,
0.4949875, -1.785888, 2.971037, 0, 0, 0, 1, 1,
0.4958681, -1.139114, 3.854524, 0, 0, 0, 1, 1,
0.4958739, -0.2329854, 1.886221, 0, 0, 0, 1, 1,
0.4959747, -1.217037, 2.112726, 0, 0, 0, 1, 1,
0.4983705, 0.1677522, 1.997636, 0, 0, 0, 1, 1,
0.498548, -0.2486125, 1.92613, 1, 1, 1, 1, 1,
0.5021441, 1.137685, 0.9131826, 1, 1, 1, 1, 1,
0.5022692, 0.63995, 0.9885852, 1, 1, 1, 1, 1,
0.5037537, -0.1774191, 1.191095, 1, 1, 1, 1, 1,
0.5079335, -0.4125798, 2.289581, 1, 1, 1, 1, 1,
0.5175844, -0.02146791, 1.503259, 1, 1, 1, 1, 1,
0.5237671, -0.5602405, 3.182275, 1, 1, 1, 1, 1,
0.5259703, 0.6261134, 2.12318, 1, 1, 1, 1, 1,
0.5286455, 0.4550084, 0.8572347, 1, 1, 1, 1, 1,
0.533524, 1.633554, 1.953182, 1, 1, 1, 1, 1,
0.5402742, 0.01613366, 2.201111, 1, 1, 1, 1, 1,
0.5457339, 0.527101, 0.6041913, 1, 1, 1, 1, 1,
0.5481689, 0.2239799, 0.5673051, 1, 1, 1, 1, 1,
0.5564976, 1.25803, -0.6153876, 1, 1, 1, 1, 1,
0.5608636, -0.3622766, 0.9204822, 1, 1, 1, 1, 1,
0.5613763, 0.2495581, 2.023398, 0, 0, 1, 1, 1,
0.5720136, 0.3307241, 1.586442, 1, 0, 0, 1, 1,
0.5736545, 0.3900202, 0.3658746, 1, 0, 0, 1, 1,
0.574156, -0.9518181, 2.98575, 1, 0, 0, 1, 1,
0.5837991, -1.130879, 1.933233, 1, 0, 0, 1, 1,
0.5912361, -0.8145044, 2.449048, 1, 0, 0, 1, 1,
0.5963678, -1.717017, 2.197153, 0, 0, 0, 1, 1,
0.5978757, -0.1733633, 1.240371, 0, 0, 0, 1, 1,
0.6011093, -1.878757, 2.377772, 0, 0, 0, 1, 1,
0.6012014, -1.181305, 3.777703, 0, 0, 0, 1, 1,
0.601746, 0.03250996, -0.4026108, 0, 0, 0, 1, 1,
0.6066399, -0.06205286, 1.348304, 0, 0, 0, 1, 1,
0.6120446, -0.1128729, 0.8827801, 0, 0, 0, 1, 1,
0.6122254, -2.969265, 1.85332, 1, 1, 1, 1, 1,
0.6135615, 0.2746467, 1.059033, 1, 1, 1, 1, 1,
0.614765, -1.365986, 1.367512, 1, 1, 1, 1, 1,
0.6185384, -0.1725032, 1.403219, 1, 1, 1, 1, 1,
0.6190988, -0.8550873, 2.740357, 1, 1, 1, 1, 1,
0.6219921, 2.972525, 1.061314, 1, 1, 1, 1, 1,
0.6246635, 1.197913, 0.1118689, 1, 1, 1, 1, 1,
0.6267691, -0.2338593, 2.133553, 1, 1, 1, 1, 1,
0.6337356, -0.8475823, 1.892547, 1, 1, 1, 1, 1,
0.6338153, -0.9279761, 1.975121, 1, 1, 1, 1, 1,
0.6469287, -1.246849, 5.002062, 1, 1, 1, 1, 1,
0.6475835, 1.364636, 0.6242549, 1, 1, 1, 1, 1,
0.649475, 0.8116031, -1.122989, 1, 1, 1, 1, 1,
0.6536927, -0.5723152, 3.279322, 1, 1, 1, 1, 1,
0.6546649, 0.6420668, 1.13942, 1, 1, 1, 1, 1,
0.6578139, 0.225782, 3.466597, 0, 0, 1, 1, 1,
0.66099, 0.03793404, 2.525681, 1, 0, 0, 1, 1,
0.6667577, -1.636845, 3.535897, 1, 0, 0, 1, 1,
0.6688185, 0.6542298, 0.3857294, 1, 0, 0, 1, 1,
0.6729919, 0.7413805, 1.057747, 1, 0, 0, 1, 1,
0.6769272, 2.247869, -0.003463582, 1, 0, 0, 1, 1,
0.6796455, 1.500826, 0.9023741, 0, 0, 0, 1, 1,
0.679948, -0.5739499, 2.00745, 0, 0, 0, 1, 1,
0.6849262, -0.2191884, 3.069957, 0, 0, 0, 1, 1,
0.6854019, 0.1088611, 3.43813, 0, 0, 0, 1, 1,
0.6915466, -1.110842, 2.930504, 0, 0, 0, 1, 1,
0.694913, -0.09804192, -0.3745722, 0, 0, 0, 1, 1,
0.696661, 0.2723319, 0.9985008, 0, 0, 0, 1, 1,
0.6993855, 0.9067498, 0.5449899, 1, 1, 1, 1, 1,
0.7006115, 0.2348051, 1.461857, 1, 1, 1, 1, 1,
0.7117012, 0.7200373, 2.204784, 1, 1, 1, 1, 1,
0.7129397, 0.9716793, -0.8244638, 1, 1, 1, 1, 1,
0.7161285, 0.02536127, 0.2816288, 1, 1, 1, 1, 1,
0.7165737, -0.987612, 3.097446, 1, 1, 1, 1, 1,
0.7189445, 0.7101711, -0.7927462, 1, 1, 1, 1, 1,
0.7223688, -0.6666682, 3.166363, 1, 1, 1, 1, 1,
0.7293426, 1.43866, -0.9223222, 1, 1, 1, 1, 1,
0.730219, -0.9316368, 3.29863, 1, 1, 1, 1, 1,
0.7312341, 0.5264661, 0.9803129, 1, 1, 1, 1, 1,
0.7341206, 0.1307138, 1.491678, 1, 1, 1, 1, 1,
0.7347273, 0.1873166, 0.6864003, 1, 1, 1, 1, 1,
0.7396134, -1.187888, 2.547843, 1, 1, 1, 1, 1,
0.7408897, -0.5707473, 2.01579, 1, 1, 1, 1, 1,
0.745456, -1.120634, 1.078087, 0, 0, 1, 1, 1,
0.74849, -0.7868031, 3.678137, 1, 0, 0, 1, 1,
0.7517576, -0.9764608, 1.718496, 1, 0, 0, 1, 1,
0.7534708, 0.1823044, 1.864836, 1, 0, 0, 1, 1,
0.7536558, -0.709832, 2.585445, 1, 0, 0, 1, 1,
0.7570124, -0.2193601, 0.8972177, 1, 0, 0, 1, 1,
0.7579168, -0.01754595, 2.507735, 0, 0, 0, 1, 1,
0.7598481, 0.1516985, 0.4257534, 0, 0, 0, 1, 1,
0.7620505, 1.241721, 0.9353212, 0, 0, 0, 1, 1,
0.7636833, -0.01391401, 0.7597215, 0, 0, 0, 1, 1,
0.7672718, -1.638456, 2.776067, 0, 0, 0, 1, 1,
0.7729662, 1.341352, -0.3102485, 0, 0, 0, 1, 1,
0.7791861, 0.5287767, 1.006894, 0, 0, 0, 1, 1,
0.7797456, 0.4827699, 0.6243864, 1, 1, 1, 1, 1,
0.7799902, 0.3979293, 2.045404, 1, 1, 1, 1, 1,
0.7829651, 0.06289783, 1.421506, 1, 1, 1, 1, 1,
0.7837665, 0.7310393, 0.6002659, 1, 1, 1, 1, 1,
0.7874538, 0.9800257, -0.9005716, 1, 1, 1, 1, 1,
0.7919552, 0.1610407, 3.109389, 1, 1, 1, 1, 1,
0.7933654, -2.355893, 3.540756, 1, 1, 1, 1, 1,
0.8020178, -1.264425, 3.245755, 1, 1, 1, 1, 1,
0.8051172, 0.8396685, -0.1512719, 1, 1, 1, 1, 1,
0.8095399, 0.001779887, 1.731275, 1, 1, 1, 1, 1,
0.8098806, 0.230205, 1.136235, 1, 1, 1, 1, 1,
0.8110067, 0.1646298, 1.971371, 1, 1, 1, 1, 1,
0.8177667, 0.6658397, 2.064463, 1, 1, 1, 1, 1,
0.8178089, -2.880042, 1.953527, 1, 1, 1, 1, 1,
0.8245225, -0.5367937, 1.626862, 1, 1, 1, 1, 1,
0.8314182, 1.232127, 1.146652, 0, 0, 1, 1, 1,
0.8319256, -1.378223, 2.742535, 1, 0, 0, 1, 1,
0.8342113, -0.5032216, 1.664431, 1, 0, 0, 1, 1,
0.8383155, 0.08367535, 0.9817133, 1, 0, 0, 1, 1,
0.839, -0.7048981, 1.729687, 1, 0, 0, 1, 1,
0.8394141, 0.6009446, 1.154708, 1, 0, 0, 1, 1,
0.8471448, -2.509916, 0.6459059, 0, 0, 0, 1, 1,
0.8479499, -1.048922, 2.582515, 0, 0, 0, 1, 1,
0.8483516, 0.79242, 0.5047722, 0, 0, 0, 1, 1,
0.8527787, -0.4335537, 2.073102, 0, 0, 0, 1, 1,
0.8534124, 1.69657, 0.3069088, 0, 0, 0, 1, 1,
0.8537093, 1.002184, 0.03118724, 0, 0, 0, 1, 1,
0.8542392, -1.393918, 1.712987, 0, 0, 0, 1, 1,
0.8554693, 0.8485188, 0.4079029, 1, 1, 1, 1, 1,
0.8561583, -1.090674, 2.474959, 1, 1, 1, 1, 1,
0.8587024, -1.128981, 1.481515, 1, 1, 1, 1, 1,
0.861087, 1.115653, 0.7123262, 1, 1, 1, 1, 1,
0.8624968, 0.47675, 0.4353836, 1, 1, 1, 1, 1,
0.8630721, 0.7252449, 0.160294, 1, 1, 1, 1, 1,
0.8669949, -1.379809, 2.903092, 1, 1, 1, 1, 1,
0.8693227, -0.9239257, 3.830729, 1, 1, 1, 1, 1,
0.8763552, 0.07687931, 1.586432, 1, 1, 1, 1, 1,
0.881292, 0.117112, 1.475862, 1, 1, 1, 1, 1,
0.8835955, 0.08572293, 1.754899, 1, 1, 1, 1, 1,
0.8862038, 0.2126587, 2.954695, 1, 1, 1, 1, 1,
0.8882219, -1.546176, 4.2558, 1, 1, 1, 1, 1,
0.8999647, 0.073897, 2.079667, 1, 1, 1, 1, 1,
0.9151744, -0.1283261, 1.340808, 1, 1, 1, 1, 1,
0.9206643, 0.1303421, 1.76057, 0, 0, 1, 1, 1,
0.9281605, 0.3280638, 1.580952, 1, 0, 0, 1, 1,
0.9291298, 1.76311, 0.3889288, 1, 0, 0, 1, 1,
0.9292309, 0.7220746, 1.858708, 1, 0, 0, 1, 1,
0.9298891, -0.6994851, 2.694889, 1, 0, 0, 1, 1,
0.9322118, 0.1037016, 1.361133, 1, 0, 0, 1, 1,
0.9322705, -0.1166929, 1.360644, 0, 0, 0, 1, 1,
0.932463, 0.3863441, 1.883288, 0, 0, 0, 1, 1,
0.9477555, 0.4063939, 2.677448, 0, 0, 0, 1, 1,
0.9487277, -2.15971, 2.664238, 0, 0, 0, 1, 1,
0.9489415, -0.7937096, 1.782565, 0, 0, 0, 1, 1,
0.950273, 0.2132398, 1.378573, 0, 0, 0, 1, 1,
0.9542402, -0.133389, 3.018988, 0, 0, 0, 1, 1,
0.9616225, 0.4474595, 1.820577, 1, 1, 1, 1, 1,
0.9625079, 0.8654857, 2.112294, 1, 1, 1, 1, 1,
0.9625753, -1.860393, 2.296869, 1, 1, 1, 1, 1,
0.9697398, -0.255878, 1.630973, 1, 1, 1, 1, 1,
0.9706606, 0.1552673, 1.678818, 1, 1, 1, 1, 1,
0.9716254, 0.6954279, 0.438782, 1, 1, 1, 1, 1,
0.972323, -0.4590543, 2.053877, 1, 1, 1, 1, 1,
0.9752295, 1.135176, -0.7789449, 1, 1, 1, 1, 1,
0.9813518, 0.8652817, 0.9597189, 1, 1, 1, 1, 1,
0.9814268, -0.581138, 3.549107, 1, 1, 1, 1, 1,
0.9883098, -0.8721738, 1.963083, 1, 1, 1, 1, 1,
0.994166, -1.10903, 3.192907, 1, 1, 1, 1, 1,
0.9950163, -0.03970117, -0.03686832, 1, 1, 1, 1, 1,
0.9953723, 0.1267323, 2.657855, 1, 1, 1, 1, 1,
1.004553, 0.5500867, 1.01942, 1, 1, 1, 1, 1,
1.006086, -2.614168, 3.20172, 0, 0, 1, 1, 1,
1.006309, 0.7943682, 2.997524, 1, 0, 0, 1, 1,
1.010079, -1.359431, 0.500743, 1, 0, 0, 1, 1,
1.013077, 1.452418, 0.8201311, 1, 0, 0, 1, 1,
1.020187, 0.6858884, 0.394334, 1, 0, 0, 1, 1,
1.024216, -1.184948, 1.587142, 1, 0, 0, 1, 1,
1.025424, -0.3937403, -0.536746, 0, 0, 0, 1, 1,
1.029354, 2.207621, 0.2395037, 0, 0, 0, 1, 1,
1.03285, 0.6239087, -0.628504, 0, 0, 0, 1, 1,
1.039253, 1.011547, -0.3896656, 0, 0, 0, 1, 1,
1.04709, 1.100616, 0.970043, 0, 0, 0, 1, 1,
1.051942, -0.5459626, 1.785678, 0, 0, 0, 1, 1,
1.05365, -1.00581, 3.232448, 0, 0, 0, 1, 1,
1.057791, 0.9853573, 0.5046506, 1, 1, 1, 1, 1,
1.058942, -0.2788879, 2.956597, 1, 1, 1, 1, 1,
1.068302, -0.02475141, 1.342712, 1, 1, 1, 1, 1,
1.071097, -0.2250253, 0.7888477, 1, 1, 1, 1, 1,
1.074203, 0.7935381, 1.207288, 1, 1, 1, 1, 1,
1.075267, 1.132652, -0.08456972, 1, 1, 1, 1, 1,
1.07683, -0.866151, 2.219245, 1, 1, 1, 1, 1,
1.081429, -0.1584775, 3.396579, 1, 1, 1, 1, 1,
1.084993, -0.2009528, 2.340801, 1, 1, 1, 1, 1,
1.092396, -0.8417198, 2.785056, 1, 1, 1, 1, 1,
1.09391, 1.567759, 1.509931, 1, 1, 1, 1, 1,
1.096259, 0.1594669, 3.367877, 1, 1, 1, 1, 1,
1.098551, 0.933351, 0.569936, 1, 1, 1, 1, 1,
1.099351, -2.205156, 5.142619, 1, 1, 1, 1, 1,
1.102566, 0.2378771, 0.9143484, 1, 1, 1, 1, 1,
1.103223, -1.966746, 3.086423, 0, 0, 1, 1, 1,
1.103372, 1.415126, 0.9468477, 1, 0, 0, 1, 1,
1.103608, 1.162218, -1.169835, 1, 0, 0, 1, 1,
1.106107, -2.125136, 2.437921, 1, 0, 0, 1, 1,
1.116897, -1.576554, 1.614639, 1, 0, 0, 1, 1,
1.119736, -0.7887939, 2.739735, 1, 0, 0, 1, 1,
1.122354, 2.203279, 0.5783026, 0, 0, 0, 1, 1,
1.133646, 1.147638, 0.3198144, 0, 0, 0, 1, 1,
1.141601, 0.0463758, 0.9288853, 0, 0, 0, 1, 1,
1.143955, 0.03209511, 2.842062, 0, 0, 0, 1, 1,
1.146743, -1.155507, 3.046206, 0, 0, 0, 1, 1,
1.150043, 1.090387, 0.6936972, 0, 0, 0, 1, 1,
1.150944, -0.1249305, 1.95652, 0, 0, 0, 1, 1,
1.151976, -0.5540797, 3.054606, 1, 1, 1, 1, 1,
1.159427, 1.162386, 2.145933, 1, 1, 1, 1, 1,
1.160508, -0.3022571, 1.749835, 1, 1, 1, 1, 1,
1.172031, 1.695551, 1.730989, 1, 1, 1, 1, 1,
1.176467, -0.33263, 3.428304, 1, 1, 1, 1, 1,
1.184334, 0.04492086, 2.064988, 1, 1, 1, 1, 1,
1.200972, 0.9351279, 0.06301059, 1, 1, 1, 1, 1,
1.204353, -0.2434901, 2.475981, 1, 1, 1, 1, 1,
1.213141, 0.9918686, 0.6465808, 1, 1, 1, 1, 1,
1.214618, -1.341315, 2.565389, 1, 1, 1, 1, 1,
1.233018, -1.142298, 1.722798, 1, 1, 1, 1, 1,
1.235036, -1.314802, 3.135251, 1, 1, 1, 1, 1,
1.240981, 2.00894, -0.06738591, 1, 1, 1, 1, 1,
1.244014, 0.9745249, 0.3427445, 1, 1, 1, 1, 1,
1.245252, -1.144833, 0.7643449, 1, 1, 1, 1, 1,
1.248896, 1.121487, 0.9100665, 0, 0, 1, 1, 1,
1.2648, -0.01369426, 1.222089, 1, 0, 0, 1, 1,
1.270793, 0.1368725, 2.659993, 1, 0, 0, 1, 1,
1.278634, 1.090943, 2.269074, 1, 0, 0, 1, 1,
1.283268, -0.05426308, 2.857734, 1, 0, 0, 1, 1,
1.28352, -0.3983397, 2.046093, 1, 0, 0, 1, 1,
1.291112, -0.9974435, 1.849627, 0, 0, 0, 1, 1,
1.291213, 0.05698487, 2.967196, 0, 0, 0, 1, 1,
1.292948, -0.2490999, 0.9840434, 0, 0, 0, 1, 1,
1.293563, -0.1728005, 1.282009, 0, 0, 0, 1, 1,
1.294716, -0.007822636, 1.662362, 0, 0, 0, 1, 1,
1.295534, 1.107334, 0.3255983, 0, 0, 0, 1, 1,
1.303599, -0.06748443, -0.1440064, 0, 0, 0, 1, 1,
1.305519, -0.3001569, 1.763004, 1, 1, 1, 1, 1,
1.307436, -0.7229361, 0.4596808, 1, 1, 1, 1, 1,
1.307964, 0.5071678, -0.07318404, 1, 1, 1, 1, 1,
1.309794, 0.8373476, 0.6275381, 1, 1, 1, 1, 1,
1.320001, -1.816224, 3.338747, 1, 1, 1, 1, 1,
1.323869, 0.3591326, 2.0458, 1, 1, 1, 1, 1,
1.331215, -0.7258274, 2.587152, 1, 1, 1, 1, 1,
1.332324, 0.1521053, 0.5955263, 1, 1, 1, 1, 1,
1.342796, 0.2394212, 1.204272, 1, 1, 1, 1, 1,
1.349181, -0.05310973, 0.9878453, 1, 1, 1, 1, 1,
1.352377, 0.8810913, 2.692858, 1, 1, 1, 1, 1,
1.358965, 1.83014, 0.9145554, 1, 1, 1, 1, 1,
1.361328, -0.3602346, 4.297026, 1, 1, 1, 1, 1,
1.362987, -2.147613, 3.745344, 1, 1, 1, 1, 1,
1.377839, 0.238363, 1.856692, 1, 1, 1, 1, 1,
1.380823, 0.591633, 0.8708207, 0, 0, 1, 1, 1,
1.389707, 0.2395285, 1.063413, 1, 0, 0, 1, 1,
1.391941, 0.8213688, 1.147324, 1, 0, 0, 1, 1,
1.4005, -0.8681422, 2.545585, 1, 0, 0, 1, 1,
1.403084, 1.779207, 1.324286, 1, 0, 0, 1, 1,
1.414715, 0.6920975, -0.2723131, 1, 0, 0, 1, 1,
1.440408, -0.296798, 1.921441, 0, 0, 0, 1, 1,
1.441092, 0.3694528, 1.77291, 0, 0, 0, 1, 1,
1.4456, 0.8716992, -0.5108897, 0, 0, 0, 1, 1,
1.446128, -0.9809013, 1.74052, 0, 0, 0, 1, 1,
1.453027, -2.051382, 1.397397, 0, 0, 0, 1, 1,
1.508374, 0.3124121, 1.761021, 0, 0, 0, 1, 1,
1.522854, -0.3150551, 1.222878, 0, 0, 0, 1, 1,
1.542041, -0.1999248, 0.8998932, 1, 1, 1, 1, 1,
1.561824, 0.7212164, 0.740885, 1, 1, 1, 1, 1,
1.573806, 0.3890922, 1.464704, 1, 1, 1, 1, 1,
1.585914, -1.95277, 3.424432, 1, 1, 1, 1, 1,
1.593896, 0.6706328, 3.272635, 1, 1, 1, 1, 1,
1.613106, -0.2543792, 0.8704415, 1, 1, 1, 1, 1,
1.625364, 0.00383086, 1.891436, 1, 1, 1, 1, 1,
1.62621, -1.01301, 1.730437, 1, 1, 1, 1, 1,
1.632069, 0.9173198, 0.1561158, 1, 1, 1, 1, 1,
1.654443, 1.152331, -0.0507497, 1, 1, 1, 1, 1,
1.67369, -0.7625341, 3.766713, 1, 1, 1, 1, 1,
1.679858, 1.03679, 2.690266, 1, 1, 1, 1, 1,
1.686287, 0.0605762, 1.499427, 1, 1, 1, 1, 1,
1.704834, 1.602585, 1.096491, 1, 1, 1, 1, 1,
1.720272, 0.626999, 0.4008767, 1, 1, 1, 1, 1,
1.72409, -0.02604748, 2.229939, 0, 0, 1, 1, 1,
1.735847, 0.4136212, 2.058407, 1, 0, 0, 1, 1,
1.74375, 0.2293273, 0.8481449, 1, 0, 0, 1, 1,
1.75717, 1.470688, 2.550895, 1, 0, 0, 1, 1,
1.765799, 0.8087157, 2.277152, 1, 0, 0, 1, 1,
1.766277, 0.8409275, 0.748082, 1, 0, 0, 1, 1,
1.769218, 1.634881, -0.2916438, 0, 0, 0, 1, 1,
1.77036, 0.9349282, 0.7509885, 0, 0, 0, 1, 1,
1.81054, 0.9863896, 1.577255, 0, 0, 0, 1, 1,
1.823172, 1.796851, 2.465957, 0, 0, 0, 1, 1,
1.824469, 0.7311843, 1.872664, 0, 0, 0, 1, 1,
1.841487, 0.2419516, -0.1485033, 0, 0, 0, 1, 1,
1.847941, -0.9524838, 1.767873, 0, 0, 0, 1, 1,
1.851808, 0.7956322, 1.269704, 1, 1, 1, 1, 1,
1.860261, -0.5736867, 0.7512218, 1, 1, 1, 1, 1,
1.860355, 1.131977, 2.307022, 1, 1, 1, 1, 1,
1.895409, -0.7186461, 1.550412, 1, 1, 1, 1, 1,
1.919167, -0.6572393, 2.130156, 1, 1, 1, 1, 1,
1.921005, -0.2494609, -0.8891508, 1, 1, 1, 1, 1,
1.923113, -0.9167239, 2.315591, 1, 1, 1, 1, 1,
1.937577, 1.090956, 1.46306, 1, 1, 1, 1, 1,
1.944636, -1.098706, 2.703475, 1, 1, 1, 1, 1,
1.959849, -1.059877, 2.402558, 1, 1, 1, 1, 1,
1.961554, -1.942227, 4.877991, 1, 1, 1, 1, 1,
1.964375, -0.9748302, 3.300335, 1, 1, 1, 1, 1,
1.967587, 0.5357313, 0.6597708, 1, 1, 1, 1, 1,
1.996444, -2.116078, 1.123712, 1, 1, 1, 1, 1,
2.010496, -0.2882059, -0.3056441, 1, 1, 1, 1, 1,
2.026095, -0.4420919, 0.1288608, 0, 0, 1, 1, 1,
2.045835, -1.567257, 2.028769, 1, 0, 0, 1, 1,
2.072515, 1.323544, 2.400952, 1, 0, 0, 1, 1,
2.096969, -0.06076866, 0.8050363, 1, 0, 0, 1, 1,
2.133694, -0.4105074, 2.497803, 1, 0, 0, 1, 1,
2.137437, 0.03089447, 1.238284, 1, 0, 0, 1, 1,
2.142125, -1.091174, 2.375199, 0, 0, 0, 1, 1,
2.163032, 0.5207696, 2.036791, 0, 0, 0, 1, 1,
2.193008, 0.1171171, 2.153438, 0, 0, 0, 1, 1,
2.246248, 0.547987, 0.9345143, 0, 0, 0, 1, 1,
2.252412, -1.009234, 1.748594, 0, 0, 0, 1, 1,
2.260621, -0.04371534, 1.529408, 0, 0, 0, 1, 1,
2.29584, 0.8034082, 1.66118, 0, 0, 0, 1, 1,
2.304624, -0.1375148, 1.738954, 1, 1, 1, 1, 1,
2.392478, 0.9799899, 1.845214, 1, 1, 1, 1, 1,
2.40466, 1.921859, -0.2557158, 1, 1, 1, 1, 1,
2.41294, 1.089768, 1.621633, 1, 1, 1, 1, 1,
2.479095, -0.4873709, 2.386157, 1, 1, 1, 1, 1,
2.497452, -0.9751009, 0.72052, 1, 1, 1, 1, 1,
2.831494, -2.859379, 2.982038, 1, 1, 1, 1, 1
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
var radius = 9.108402;
var distance = 31.99288;
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
mvMatrix.translate( 0.006696463, -0.02697003, 0.01066113 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.99288);
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
