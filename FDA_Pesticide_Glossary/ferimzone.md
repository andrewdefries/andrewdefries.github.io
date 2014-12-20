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
-3.515122, -0.9534122, -1.65259, 1, 0, 0, 1,
-2.632853, 0.9973439, 0.4067599, 1, 0.007843138, 0, 1,
-2.615923, -0.3851267, -0.6372162, 1, 0.01176471, 0, 1,
-2.537564, -0.9761969, -2.784017, 1, 0.01960784, 0, 1,
-2.510223, 0.2288723, -2.344085, 1, 0.02352941, 0, 1,
-2.479529, 0.5542459, -1.316402, 1, 0.03137255, 0, 1,
-2.383455, -1.314071, -2.121468, 1, 0.03529412, 0, 1,
-2.362297, -0.7837481, -2.338376, 1, 0.04313726, 0, 1,
-2.3574, -1.218867, -0.5942533, 1, 0.04705882, 0, 1,
-2.343697, -1.684413, -4.342169, 1, 0.05490196, 0, 1,
-2.327812, -0.7050187, -0.812863, 1, 0.05882353, 0, 1,
-2.321671, -0.2523816, -1.365235, 1, 0.06666667, 0, 1,
-2.319124, 1.076984, -2.187897, 1, 0.07058824, 0, 1,
-2.303818, -0.3654836, -1.440285, 1, 0.07843138, 0, 1,
-2.269782, -0.5244361, -0.0241971, 1, 0.08235294, 0, 1,
-2.213067, -0.1127104, -2.488705, 1, 0.09019608, 0, 1,
-2.179463, -1.058135, -1.570892, 1, 0.09411765, 0, 1,
-2.174168, 0.4797089, -1.80201, 1, 0.1019608, 0, 1,
-2.141748, -1.798123, -2.341834, 1, 0.1098039, 0, 1,
-2.119993, -0.384793, -3.512502, 1, 0.1137255, 0, 1,
-2.087918, 0.7302279, -0.386854, 1, 0.1215686, 0, 1,
-2.06645, 0.7357168, -1.614314, 1, 0.1254902, 0, 1,
-2.064462, 0.6209965, -0.8226279, 1, 0.1333333, 0, 1,
-2.02868, -1.232566, -2.27009, 1, 0.1372549, 0, 1,
-2.020908, -0.7126209, -1.61345, 1, 0.145098, 0, 1,
-2.018745, -1.157265, 0.3100157, 1, 0.1490196, 0, 1,
-1.992338, 1.586101, -1.276442, 1, 0.1568628, 0, 1,
-1.985496, -0.1890179, -0.7957569, 1, 0.1607843, 0, 1,
-1.951643, -0.7088804, -3.410762, 1, 0.1686275, 0, 1,
-1.949574, -0.3166268, -1.564968, 1, 0.172549, 0, 1,
-1.94292, 0.1346063, -0.7677137, 1, 0.1803922, 0, 1,
-1.936455, -0.4733828, -2.405361, 1, 0.1843137, 0, 1,
-1.936265, -0.3031226, -1.535529, 1, 0.1921569, 0, 1,
-1.931714, 0.07096676, -0.1904299, 1, 0.1960784, 0, 1,
-1.922877, 2.077593, -1.612728, 1, 0.2039216, 0, 1,
-1.922227, 1.812641, -2.240469, 1, 0.2117647, 0, 1,
-1.908494, -1.565765, -3.11584, 1, 0.2156863, 0, 1,
-1.899113, -0.3358236, -2.377305, 1, 0.2235294, 0, 1,
-1.894187, -0.3003189, -1.125203, 1, 0.227451, 0, 1,
-1.819996, -1.441435, -5.036347, 1, 0.2352941, 0, 1,
-1.80861, -1.389846, -3.135253, 1, 0.2392157, 0, 1,
-1.802641, 0.7412553, -2.629031, 1, 0.2470588, 0, 1,
-1.779174, -0.6797606, -1.687509, 1, 0.2509804, 0, 1,
-1.771361, 1.138574, -1.850518, 1, 0.2588235, 0, 1,
-1.756061, 1.608386, -0.04615257, 1, 0.2627451, 0, 1,
-1.736317, -0.3014562, -1.843148, 1, 0.2705882, 0, 1,
-1.729702, -1.302877, -1.985372, 1, 0.2745098, 0, 1,
-1.724815, -0.004736111, -0.7007713, 1, 0.282353, 0, 1,
-1.700527, -0.2057914, -1.757198, 1, 0.2862745, 0, 1,
-1.689556, 0.8271679, 0.3106484, 1, 0.2941177, 0, 1,
-1.688573, -0.4401614, -0.4631151, 1, 0.3019608, 0, 1,
-1.680398, -0.1771077, -2.379979, 1, 0.3058824, 0, 1,
-1.673588, 1.087572, 0.1697581, 1, 0.3137255, 0, 1,
-1.630663, -0.7371905, -1.491596, 1, 0.3176471, 0, 1,
-1.629976, 0.008965528, -1.381158, 1, 0.3254902, 0, 1,
-1.615877, -0.521699, -1.426834, 1, 0.3294118, 0, 1,
-1.586214, 0.8625777, 0.2494582, 1, 0.3372549, 0, 1,
-1.581151, 0.5357286, -0.3843957, 1, 0.3411765, 0, 1,
-1.561479, -1.445904, -2.463686, 1, 0.3490196, 0, 1,
-1.545051, -0.4971126, -1.762441, 1, 0.3529412, 0, 1,
-1.538697, 0.9190618, -2.471678, 1, 0.3607843, 0, 1,
-1.535496, 1.099711, -1.083267, 1, 0.3647059, 0, 1,
-1.532312, 1.648722, -2.269891, 1, 0.372549, 0, 1,
-1.529043, 0.4282365, -1.794305, 1, 0.3764706, 0, 1,
-1.528385, -0.5021759, -2.11273, 1, 0.3843137, 0, 1,
-1.524335, 0.6250025, -0.4212124, 1, 0.3882353, 0, 1,
-1.518634, 1.116061, -1.464327, 1, 0.3960784, 0, 1,
-1.518366, -2.397165, -0.9622539, 1, 0.4039216, 0, 1,
-1.491764, 0.5872448, -0.5886641, 1, 0.4078431, 0, 1,
-1.49098, -0.23874, -0.9028518, 1, 0.4156863, 0, 1,
-1.483847, -1.58549, -1.889444, 1, 0.4196078, 0, 1,
-1.473227, -0.2422139, -2.004805, 1, 0.427451, 0, 1,
-1.473174, -0.0878863, -1.657159, 1, 0.4313726, 0, 1,
-1.459352, 0.3611325, -1.944217, 1, 0.4392157, 0, 1,
-1.457966, -1.626464, 0.08275428, 1, 0.4431373, 0, 1,
-1.451053, -0.7736879, -2.002134, 1, 0.4509804, 0, 1,
-1.446708, -2.343208, -3.027112, 1, 0.454902, 0, 1,
-1.446562, 1.36988, -2.005643, 1, 0.4627451, 0, 1,
-1.443147, 0.004635138, 0.3325633, 1, 0.4666667, 0, 1,
-1.427729, -0.5518355, -0.8156681, 1, 0.4745098, 0, 1,
-1.423528, -1.091897, -1.057274, 1, 0.4784314, 0, 1,
-1.415598, 0.7117864, -0.3791505, 1, 0.4862745, 0, 1,
-1.414785, 0.2741752, -2.171649, 1, 0.4901961, 0, 1,
-1.40935, -1.138912, -3.023466, 1, 0.4980392, 0, 1,
-1.407186, 0.156291, -0.8709559, 1, 0.5058824, 0, 1,
-1.403725, -1.564129, -2.538667, 1, 0.509804, 0, 1,
-1.402562, -0.9908435, -0.1325386, 1, 0.5176471, 0, 1,
-1.399683, 0.7600552, -1.546034, 1, 0.5215687, 0, 1,
-1.396762, -1.340875, -2.759441, 1, 0.5294118, 0, 1,
-1.39655, -0.8929868, -1.666749, 1, 0.5333334, 0, 1,
-1.394693, -0.1552488, -2.09107, 1, 0.5411765, 0, 1,
-1.394238, -0.8684934, -0.2205549, 1, 0.5450981, 0, 1,
-1.392782, 0.8400325, -2.253436, 1, 0.5529412, 0, 1,
-1.392458, -0.8331744, -2.791774, 1, 0.5568628, 0, 1,
-1.381752, 1.279741, 0.6911535, 1, 0.5647059, 0, 1,
-1.381517, 0.3598998, -1.365324, 1, 0.5686275, 0, 1,
-1.349272, 0.9734986, -1.520658, 1, 0.5764706, 0, 1,
-1.346275, -2.123023, -2.711512, 1, 0.5803922, 0, 1,
-1.344044, 0.621578, -0.4785126, 1, 0.5882353, 0, 1,
-1.332805, 1.383966, 2.231574, 1, 0.5921569, 0, 1,
-1.332314, 0.5650386, -1.103324, 1, 0.6, 0, 1,
-1.332136, 0.5780169, -2.370471, 1, 0.6078432, 0, 1,
-1.331376, 1.476281, 0.6125808, 1, 0.6117647, 0, 1,
-1.325436, -0.5408236, -2.348974, 1, 0.6196079, 0, 1,
-1.318638, -1.835666, -2.659817, 1, 0.6235294, 0, 1,
-1.307505, -0.3071919, -2.001572, 1, 0.6313726, 0, 1,
-1.300514, 0.9565099, -1.810724, 1, 0.6352941, 0, 1,
-1.296109, 0.3046859, -1.146828, 1, 0.6431373, 0, 1,
-1.285516, -2.136441, -2.004863, 1, 0.6470588, 0, 1,
-1.284512, -1.772943, -1.057994, 1, 0.654902, 0, 1,
-1.278973, 0.4614329, -0.3891296, 1, 0.6588235, 0, 1,
-1.277076, -0.370371, -1.915886, 1, 0.6666667, 0, 1,
-1.27582, -1.201895, -3.997474, 1, 0.6705883, 0, 1,
-1.267315, -0.9766153, -2.601569, 1, 0.6784314, 0, 1,
-1.260211, 1.07949, -0.07313898, 1, 0.682353, 0, 1,
-1.25547, 1.135489, 1.146461, 1, 0.6901961, 0, 1,
-1.241902, 1.393889, -0.2488474, 1, 0.6941177, 0, 1,
-1.228235, -2.539134, -1.994916, 1, 0.7019608, 0, 1,
-1.224928, 1.419971, 0.8435489, 1, 0.7098039, 0, 1,
-1.219938, -0.6625964, -1.968462, 1, 0.7137255, 0, 1,
-1.207266, -0.7355047, -2.231532, 1, 0.7215686, 0, 1,
-1.197594, 1.067946, -1.180962, 1, 0.7254902, 0, 1,
-1.190968, 0.4806477, -3.011875, 1, 0.7333333, 0, 1,
-1.190791, -0.4388529, -2.479646, 1, 0.7372549, 0, 1,
-1.182864, -1.372379, -2.461832, 1, 0.7450981, 0, 1,
-1.176367, -0.4017601, -1.03339, 1, 0.7490196, 0, 1,
-1.174629, 1.040285, 0.1279005, 1, 0.7568628, 0, 1,
-1.15978, 0.2955038, -0.4976135, 1, 0.7607843, 0, 1,
-1.148217, -1.107794, -3.106784, 1, 0.7686275, 0, 1,
-1.137052, 0.8913003, 0.4069604, 1, 0.772549, 0, 1,
-1.132132, -0.650329, -2.788989, 1, 0.7803922, 0, 1,
-1.125327, -0.1164623, -2.210236, 1, 0.7843137, 0, 1,
-1.124848, 0.1719249, -1.043568, 1, 0.7921569, 0, 1,
-1.120498, 0.4966268, -1.27779, 1, 0.7960784, 0, 1,
-1.119194, 0.9763129, -1.516381, 1, 0.8039216, 0, 1,
-1.118974, 0.4891005, -0.9126994, 1, 0.8117647, 0, 1,
-1.105292, -2.790713, -1.807729, 1, 0.8156863, 0, 1,
-1.09832, -0.9543768, -3.086487, 1, 0.8235294, 0, 1,
-1.092111, -0.2000305, -0.7816381, 1, 0.827451, 0, 1,
-1.091877, 0.8150014, -0.6895726, 1, 0.8352941, 0, 1,
-1.082791, -0.3478192, 0.6082141, 1, 0.8392157, 0, 1,
-1.077349, 0.4709804, -2.11615, 1, 0.8470588, 0, 1,
-1.066377, 1.272085, -1.973236, 1, 0.8509804, 0, 1,
-1.061589, 0.5305846, -0.7554775, 1, 0.8588235, 0, 1,
-1.05974, 0.5323148, -0.4853578, 1, 0.8627451, 0, 1,
-1.048678, -0.0976221, -2.625108, 1, 0.8705882, 0, 1,
-1.047053, 0.1124225, -1.269389, 1, 0.8745098, 0, 1,
-1.04222, 0.6960256, -2.909847, 1, 0.8823529, 0, 1,
-1.038349, -1.418875, -3.492455, 1, 0.8862745, 0, 1,
-1.037882, 2.514096, -0.7682154, 1, 0.8941177, 0, 1,
-1.027458, -0.9904793, -3.726881, 1, 0.8980392, 0, 1,
-1.017766, 0.6411011, -0.3172255, 1, 0.9058824, 0, 1,
-1.010207, -0.094384, -0.3674925, 1, 0.9137255, 0, 1,
-1.006216, -2.075947, -3.18556, 1, 0.9176471, 0, 1,
-1.00375, 0.8903866, -2.582358, 1, 0.9254902, 0, 1,
-1.003066, -0.1801466, -2.820046, 1, 0.9294118, 0, 1,
-1.001175, 0.3873063, -0.8023844, 1, 0.9372549, 0, 1,
-0.9982224, -0.3946334, -1.51636, 1, 0.9411765, 0, 1,
-0.9972129, 0.3523326, -2.759481, 1, 0.9490196, 0, 1,
-0.9965982, -0.3960548, -0.2279477, 1, 0.9529412, 0, 1,
-0.9911503, -1.470656, -1.08409, 1, 0.9607843, 0, 1,
-0.9795972, -0.5434837, -1.803656, 1, 0.9647059, 0, 1,
-0.9744078, 0.04290455, -1.457663, 1, 0.972549, 0, 1,
-0.9742134, -1.028072, -1.140405, 1, 0.9764706, 0, 1,
-0.9663481, -1.189963, -2.030002, 1, 0.9843137, 0, 1,
-0.9656369, 1.53772, -2.319709, 1, 0.9882353, 0, 1,
-0.9622175, -0.7246289, -3.03247, 1, 0.9960784, 0, 1,
-0.9551656, 0.5325727, -0.5013949, 0.9960784, 1, 0, 1,
-0.9534125, 0.4002423, -1.872919, 0.9921569, 1, 0, 1,
-0.9531677, 0.5578247, -0.6391599, 0.9843137, 1, 0, 1,
-0.9416039, -1.551302, -2.733352, 0.9803922, 1, 0, 1,
-0.9413185, -0.4337081, -1.406137, 0.972549, 1, 0, 1,
-0.9361864, 0.6176636, -1.471727, 0.9686275, 1, 0, 1,
-0.9307662, 0.003474101, -3.157237, 0.9607843, 1, 0, 1,
-0.9213627, -0.1897477, -1.568448, 0.9568627, 1, 0, 1,
-0.9201622, 1.028805, -0.009060714, 0.9490196, 1, 0, 1,
-0.9125127, 2.124385, -1.326809, 0.945098, 1, 0, 1,
-0.9082345, -0.2294175, -3.04189, 0.9372549, 1, 0, 1,
-0.9014051, 0.721559, -1.3533, 0.9333333, 1, 0, 1,
-0.9010061, -0.7252831, -3.212092, 0.9254902, 1, 0, 1,
-0.8997619, -0.1280337, -0.680573, 0.9215686, 1, 0, 1,
-0.8898222, -1.857127, -1.811114, 0.9137255, 1, 0, 1,
-0.8855968, -0.004854283, -2.217864, 0.9098039, 1, 0, 1,
-0.8843787, -1.143833, -2.311934, 0.9019608, 1, 0, 1,
-0.8831757, -2.057649, -1.182613, 0.8941177, 1, 0, 1,
-0.8819081, 2.645653, -0.518707, 0.8901961, 1, 0, 1,
-0.8771606, -0.5386277, -1.620486, 0.8823529, 1, 0, 1,
-0.8700716, -0.4241501, -1.692201, 0.8784314, 1, 0, 1,
-0.8689201, 0.3547771, -0.8164482, 0.8705882, 1, 0, 1,
-0.858133, 0.6448636, -0.9743702, 0.8666667, 1, 0, 1,
-0.8508973, -0.3179168, -2.172858, 0.8588235, 1, 0, 1,
-0.8481316, 0.9818283, -0.1639818, 0.854902, 1, 0, 1,
-0.8457889, -0.9115366, -3.442677, 0.8470588, 1, 0, 1,
-0.8446666, -0.1116714, -0.9699605, 0.8431373, 1, 0, 1,
-0.8428574, 0.3672671, -1.06315, 0.8352941, 1, 0, 1,
-0.8334603, 1.257241, 0.3092166, 0.8313726, 1, 0, 1,
-0.821536, -0.4785089, -2.918378, 0.8235294, 1, 0, 1,
-0.8209603, 2.323433, -0.5650581, 0.8196079, 1, 0, 1,
-0.8205993, -1.866209, -3.485264, 0.8117647, 1, 0, 1,
-0.8111921, 0.492159, 0.184411, 0.8078431, 1, 0, 1,
-0.8019506, 0.468915, -1.588028, 0.8, 1, 0, 1,
-0.7987455, -0.02743556, -1.969201, 0.7921569, 1, 0, 1,
-0.7975481, -0.006394975, -2.08842, 0.7882353, 1, 0, 1,
-0.7926059, 1.073564, -2.306665, 0.7803922, 1, 0, 1,
-0.7888015, -1.643597, -2.592645, 0.7764706, 1, 0, 1,
-0.7885334, 1.139418, -0.8520174, 0.7686275, 1, 0, 1,
-0.7858958, 1.073246, -2.13409, 0.7647059, 1, 0, 1,
-0.7835991, -0.5008727, -2.103448, 0.7568628, 1, 0, 1,
-0.7828557, -0.163911, -3.009196, 0.7529412, 1, 0, 1,
-0.7773214, -0.2725842, -1.548469, 0.7450981, 1, 0, 1,
-0.7687142, 1.097408, -0.5495173, 0.7411765, 1, 0, 1,
-0.7672046, -0.2807639, -1.219128, 0.7333333, 1, 0, 1,
-0.7652628, -0.1415584, -1.610217, 0.7294118, 1, 0, 1,
-0.7644138, 1.132133, -2.160346, 0.7215686, 1, 0, 1,
-0.7601424, 0.5719163, -1.018619, 0.7176471, 1, 0, 1,
-0.7580399, -0.61156, -1.863203, 0.7098039, 1, 0, 1,
-0.7469444, 1.33663, -1.950839, 0.7058824, 1, 0, 1,
-0.746102, 0.5289533, -3.059068, 0.6980392, 1, 0, 1,
-0.7457461, 0.5412731, -2.503035, 0.6901961, 1, 0, 1,
-0.7456837, -1.657793, -3.958329, 0.6862745, 1, 0, 1,
-0.7390532, 1.043049, -1.819939, 0.6784314, 1, 0, 1,
-0.7384836, -1.017072, -2.982703, 0.6745098, 1, 0, 1,
-0.7382093, 0.7438959, -0.3000646, 0.6666667, 1, 0, 1,
-0.7317751, 1.25751, -0.7095081, 0.6627451, 1, 0, 1,
-0.7238873, 0.0307035, 0.4394268, 0.654902, 1, 0, 1,
-0.723703, -1.131214, -2.443856, 0.6509804, 1, 0, 1,
-0.7232267, 0.4504894, -0.7963333, 0.6431373, 1, 0, 1,
-0.7218992, -0.2781048, -2.324723, 0.6392157, 1, 0, 1,
-0.7203583, 0.01485611, -1.278628, 0.6313726, 1, 0, 1,
-0.7186483, 2.019643, -1.610537, 0.627451, 1, 0, 1,
-0.7170595, -1.21648, -2.074015, 0.6196079, 1, 0, 1,
-0.7170138, -1.207467, -2.812711, 0.6156863, 1, 0, 1,
-0.711988, -0.03130366, 0.1021513, 0.6078432, 1, 0, 1,
-0.7100981, 0.5661051, -0.2978273, 0.6039216, 1, 0, 1,
-0.7039872, -0.04703062, -3.166258, 0.5960785, 1, 0, 1,
-0.7002717, 0.007520701, -2.018883, 0.5882353, 1, 0, 1,
-0.6998302, 0.0288089, -1.759662, 0.5843138, 1, 0, 1,
-0.696043, 0.2895449, -0.7046976, 0.5764706, 1, 0, 1,
-0.6945103, -0.5140601, -1.024898, 0.572549, 1, 0, 1,
-0.6942833, 0.0757734, -1.778126, 0.5647059, 1, 0, 1,
-0.6902703, -0.5318524, -1.848608, 0.5607843, 1, 0, 1,
-0.6878772, 0.2207632, -0.1310638, 0.5529412, 1, 0, 1,
-0.6866047, -0.5299782, -3.389033, 0.5490196, 1, 0, 1,
-0.6859186, 0.6940643, -0.193805, 0.5411765, 1, 0, 1,
-0.6793528, 1.284631, -1.981852, 0.5372549, 1, 0, 1,
-0.6783605, 0.5115514, -0.720003, 0.5294118, 1, 0, 1,
-0.6778346, -0.1196479, -2.058114, 0.5254902, 1, 0, 1,
-0.6761881, 0.3856491, -1.078066, 0.5176471, 1, 0, 1,
-0.6664639, 1.374745, -0.1938051, 0.5137255, 1, 0, 1,
-0.6642807, 3.579681, 0.1958769, 0.5058824, 1, 0, 1,
-0.6638342, 2.2039, -0.6142708, 0.5019608, 1, 0, 1,
-0.661511, -0.1174805, -0.003647816, 0.4941176, 1, 0, 1,
-0.6609687, 0.5502733, -1.314247, 0.4862745, 1, 0, 1,
-0.6606238, -0.4589279, -1.971301, 0.4823529, 1, 0, 1,
-0.6560823, -0.3329156, -3.068389, 0.4745098, 1, 0, 1,
-0.644618, -0.3429689, -2.550384, 0.4705882, 1, 0, 1,
-0.6442875, -0.619167, -2.530009, 0.4627451, 1, 0, 1,
-0.6404645, -0.2559621, -2.289538, 0.4588235, 1, 0, 1,
-0.6382802, -0.4325252, -2.133034, 0.4509804, 1, 0, 1,
-0.6274098, 0.8929139, 0.03172981, 0.4470588, 1, 0, 1,
-0.6253555, 0.1369625, -1.202521, 0.4392157, 1, 0, 1,
-0.6193995, -0.1742098, -0.6896073, 0.4352941, 1, 0, 1,
-0.6153871, -0.3703474, -2.391149, 0.427451, 1, 0, 1,
-0.6135497, 0.3007236, -1.002326, 0.4235294, 1, 0, 1,
-0.6131001, 0.2927451, -2.160407, 0.4156863, 1, 0, 1,
-0.611725, 0.203762, -0.8869641, 0.4117647, 1, 0, 1,
-0.6116406, 1.720558, -0.5422338, 0.4039216, 1, 0, 1,
-0.6044172, 1.291175, 0.03920167, 0.3960784, 1, 0, 1,
-0.5997436, 1.917802, -0.9375083, 0.3921569, 1, 0, 1,
-0.5941247, 2.580659, 0.7990613, 0.3843137, 1, 0, 1,
-0.5900643, -0.2212077, -0.09137803, 0.3803922, 1, 0, 1,
-0.5890787, -0.9719233, -2.40812, 0.372549, 1, 0, 1,
-0.5870602, -0.2924615, -1.616161, 0.3686275, 1, 0, 1,
-0.5851444, -1.294397, -1.103886, 0.3607843, 1, 0, 1,
-0.5832091, -0.5866535, -1.996869, 0.3568628, 1, 0, 1,
-0.5774647, 0.6457373, -0.1649061, 0.3490196, 1, 0, 1,
-0.5761145, -1.096843, -1.00751, 0.345098, 1, 0, 1,
-0.5752338, 0.8933336, 0.2183956, 0.3372549, 1, 0, 1,
-0.5680344, 0.5659299, -1.5421, 0.3333333, 1, 0, 1,
-0.5676816, 0.6809977, -0.2306241, 0.3254902, 1, 0, 1,
-0.563067, -1.116651, -4.516514, 0.3215686, 1, 0, 1,
-0.5610279, -0.3849904, -2.162424, 0.3137255, 1, 0, 1,
-0.5570956, -0.9032378, -1.881417, 0.3098039, 1, 0, 1,
-0.5543399, -0.8001252, -2.651597, 0.3019608, 1, 0, 1,
-0.5539978, -1.207308, -2.397106, 0.2941177, 1, 0, 1,
-0.5518374, -0.1297109, -2.056003, 0.2901961, 1, 0, 1,
-0.5460088, -0.2830116, -2.141645, 0.282353, 1, 0, 1,
-0.5408599, -0.5458669, -3.168193, 0.2784314, 1, 0, 1,
-0.5377369, 0.8759981, -1.00587, 0.2705882, 1, 0, 1,
-0.5348027, -1.343895, -3.490197, 0.2666667, 1, 0, 1,
-0.5325676, 0.8773626, -0.7224422, 0.2588235, 1, 0, 1,
-0.5274858, -0.02252508, -1.692386, 0.254902, 1, 0, 1,
-0.5270728, -0.2959773, -1.625405, 0.2470588, 1, 0, 1,
-0.5247309, -0.2723506, -2.547815, 0.2431373, 1, 0, 1,
-0.5244185, 0.3681288, -1.244546, 0.2352941, 1, 0, 1,
-0.5240352, 1.146877, 0.4179823, 0.2313726, 1, 0, 1,
-0.5220473, 1.715509, -0.7409456, 0.2235294, 1, 0, 1,
-0.5214978, 0.6564847, -1.297409, 0.2196078, 1, 0, 1,
-0.5134017, 0.07223275, -1.328536, 0.2117647, 1, 0, 1,
-0.4968104, 0.4334177, -0.5415959, 0.2078431, 1, 0, 1,
-0.4956155, -1.841875, -1.739524, 0.2, 1, 0, 1,
-0.4856604, -0.5008616, -2.600122, 0.1921569, 1, 0, 1,
-0.4847461, -2.713491, -3.745123, 0.1882353, 1, 0, 1,
-0.4837097, -0.7931473, -2.997474, 0.1803922, 1, 0, 1,
-0.4835046, 0.9445198, -2.377009, 0.1764706, 1, 0, 1,
-0.4823581, 0.05590923, -0.3278871, 0.1686275, 1, 0, 1,
-0.4816857, -0.5232852, -3.214738, 0.1647059, 1, 0, 1,
-0.4809271, 0.3980507, -2.011144, 0.1568628, 1, 0, 1,
-0.4724429, -1.143805, -1.916818, 0.1529412, 1, 0, 1,
-0.4723894, 0.3076396, -0.4335433, 0.145098, 1, 0, 1,
-0.4658715, -1.794455, -3.316887, 0.1411765, 1, 0, 1,
-0.4655598, -0.4758565, -2.564488, 0.1333333, 1, 0, 1,
-0.4653993, -0.7978929, -2.273109, 0.1294118, 1, 0, 1,
-0.4628756, -1.554997, -3.099803, 0.1215686, 1, 0, 1,
-0.4605881, 1.35673, -0.01271092, 0.1176471, 1, 0, 1,
-0.4595454, -0.4558187, -1.740047, 0.1098039, 1, 0, 1,
-0.4576633, -0.3476355, -1.419604, 0.1058824, 1, 0, 1,
-0.4527591, 0.9023567, -1.502792, 0.09803922, 1, 0, 1,
-0.4518049, -0.7535754, -3.664693, 0.09019608, 1, 0, 1,
-0.4509435, -0.2702112, -0.5171061, 0.08627451, 1, 0, 1,
-0.4506142, -0.5128917, -3.223141, 0.07843138, 1, 0, 1,
-0.4447964, 0.3398278, -1.637031, 0.07450981, 1, 0, 1,
-0.4408737, 1.742614, -1.318221, 0.06666667, 1, 0, 1,
-0.4388359, -1.041415, -1.890775, 0.0627451, 1, 0, 1,
-0.4369735, -0.7334076, -2.405919, 0.05490196, 1, 0, 1,
-0.4270191, 1.807603, 0.2871949, 0.05098039, 1, 0, 1,
-0.4215522, -0.4083438, -2.456717, 0.04313726, 1, 0, 1,
-0.4202381, 0.8148279, 1.79361, 0.03921569, 1, 0, 1,
-0.4174213, -0.7631504, -2.023606, 0.03137255, 1, 0, 1,
-0.4173802, 0.5923132, 0.0729102, 0.02745098, 1, 0, 1,
-0.4166584, 0.977699, 1.776114, 0.01960784, 1, 0, 1,
-0.4089713, -1.026542, -2.809757, 0.01568628, 1, 0, 1,
-0.4081145, 0.8625706, -2.077883, 0.007843138, 1, 0, 1,
-0.4024571, -3.136297, -3.084731, 0.003921569, 1, 0, 1,
-0.4010424, -0.4402003, -2.569103, 0, 1, 0.003921569, 1,
-0.3974613, 1.854632, -1.585813, 0, 1, 0.01176471, 1,
-0.3959852, 2.230615, -1.110042, 0, 1, 0.01568628, 1,
-0.3959163, -1.040604, -4.110062, 0, 1, 0.02352941, 1,
-0.3912008, -1.056568, -2.747065, 0, 1, 0.02745098, 1,
-0.3909477, -0.4394094, -2.600178, 0, 1, 0.03529412, 1,
-0.3852222, -0.4532204, -2.253881, 0, 1, 0.03921569, 1,
-0.3841164, -0.5230941, -1.793395, 0, 1, 0.04705882, 1,
-0.3835235, -0.2437758, -3.756141, 0, 1, 0.05098039, 1,
-0.3828051, 0.03116804, -0.5194381, 0, 1, 0.05882353, 1,
-0.3825384, 0.645977, -0.5387283, 0, 1, 0.0627451, 1,
-0.3798362, -0.5135081, -2.163544, 0, 1, 0.07058824, 1,
-0.3760942, -0.4256045, -2.680814, 0, 1, 0.07450981, 1,
-0.3736632, -2.036187, -2.796133, 0, 1, 0.08235294, 1,
-0.3698581, 0.1651196, -0.2684159, 0, 1, 0.08627451, 1,
-0.3679095, 1.364166, -0.1114022, 0, 1, 0.09411765, 1,
-0.3576658, -1.084245, -3.770303, 0, 1, 0.1019608, 1,
-0.3528214, 0.0755831, 1.155113, 0, 1, 0.1058824, 1,
-0.3484727, 0.9184722, 0.4344773, 0, 1, 0.1137255, 1,
-0.3424732, -0.8602097, -2.973795, 0, 1, 0.1176471, 1,
-0.3415618, -1.382016, -3.176606, 0, 1, 0.1254902, 1,
-0.341522, -1.105277, -1.874577, 0, 1, 0.1294118, 1,
-0.3392083, 1.728614, -0.8766829, 0, 1, 0.1372549, 1,
-0.3374656, -0.6973613, -3.428399, 0, 1, 0.1411765, 1,
-0.3354255, 1.133, -1.020236, 0, 1, 0.1490196, 1,
-0.3299378, 1.664279, 0.1644502, 0, 1, 0.1529412, 1,
-0.3266507, -0.2983326, -2.348893, 0, 1, 0.1607843, 1,
-0.3247576, 0.4024361, -2.038215, 0, 1, 0.1647059, 1,
-0.3204351, -0.3242319, -2.464913, 0, 1, 0.172549, 1,
-0.318645, 1.159837, -0.4804226, 0, 1, 0.1764706, 1,
-0.3102687, -0.4785872, -3.499884, 0, 1, 0.1843137, 1,
-0.3082436, -0.003164175, -1.425202, 0, 1, 0.1882353, 1,
-0.3066655, 0.5429425, -0.9153562, 0, 1, 0.1960784, 1,
-0.3031934, 0.4878882, 1.332377, 0, 1, 0.2039216, 1,
-0.3021896, -0.7670699, -3.258703, 0, 1, 0.2078431, 1,
-0.2992861, 1.192618, -1.341593, 0, 1, 0.2156863, 1,
-0.2982848, 2.09984, 0.3483101, 0, 1, 0.2196078, 1,
-0.2975395, 0.1879211, -2.5548, 0, 1, 0.227451, 1,
-0.2947832, 1.230848, 1.270253, 0, 1, 0.2313726, 1,
-0.2936714, -1.717104, -2.6916, 0, 1, 0.2392157, 1,
-0.2856381, -1.434297, -1.744677, 0, 1, 0.2431373, 1,
-0.2824786, -0.4620855, -2.929321, 0, 1, 0.2509804, 1,
-0.2819141, 0.1548936, 0.4690655, 0, 1, 0.254902, 1,
-0.2818448, -0.06281496, -1.109419, 0, 1, 0.2627451, 1,
-0.2817489, -0.5775456, -3.676267, 0, 1, 0.2666667, 1,
-0.2813022, -2.486037, -2.782349, 0, 1, 0.2745098, 1,
-0.2768685, 1.057429, 1.041012, 0, 1, 0.2784314, 1,
-0.2722899, -0.1520842, -1.631045, 0, 1, 0.2862745, 1,
-0.2702301, -0.7735915, -2.12793, 0, 1, 0.2901961, 1,
-0.269796, 0.04626664, -0.974103, 0, 1, 0.2980392, 1,
-0.2691167, -0.2174712, -1.428776, 0, 1, 0.3058824, 1,
-0.26905, -1.009484, -2.402984, 0, 1, 0.3098039, 1,
-0.2638875, 0.004352679, -0.7949107, 0, 1, 0.3176471, 1,
-0.2524044, -0.1992682, -3.625722, 0, 1, 0.3215686, 1,
-0.2503735, -0.5623444, -2.029101, 0, 1, 0.3294118, 1,
-0.2490112, 1.437262, 1.229249, 0, 1, 0.3333333, 1,
-0.248876, 0.292397, -1.039759, 0, 1, 0.3411765, 1,
-0.24859, -1.103343, -3.405385, 0, 1, 0.345098, 1,
-0.2462956, 0.4637032, 0.7569474, 0, 1, 0.3529412, 1,
-0.2424889, 1.672307, -0.8378164, 0, 1, 0.3568628, 1,
-0.2398173, -0.1144601, -0.7119021, 0, 1, 0.3647059, 1,
-0.236849, 0.4113787, -1.067111, 0, 1, 0.3686275, 1,
-0.2357313, -2.079198, -2.892458, 0, 1, 0.3764706, 1,
-0.2355517, -0.2740042, -2.329792, 0, 1, 0.3803922, 1,
-0.2341083, -0.4897597, -2.305643, 0, 1, 0.3882353, 1,
-0.2335674, 0.48582, -0.8356054, 0, 1, 0.3921569, 1,
-0.2310113, -0.612144, -2.61652, 0, 1, 0.4, 1,
-0.2272968, -0.4664299, -2.994997, 0, 1, 0.4078431, 1,
-0.2265579, 0.4922954, 0.3664972, 0, 1, 0.4117647, 1,
-0.2261934, 1.368629, 0.3555881, 0, 1, 0.4196078, 1,
-0.2260386, 2.307135, -0.6155053, 0, 1, 0.4235294, 1,
-0.2236376, 1.465812, -0.8712909, 0, 1, 0.4313726, 1,
-0.2188554, -1.456932, -2.837343, 0, 1, 0.4352941, 1,
-0.2162738, 0.1647118, 0.2426438, 0, 1, 0.4431373, 1,
-0.2160426, 0.7852729, -0.5076441, 0, 1, 0.4470588, 1,
-0.2093764, -1.187286, -2.789128, 0, 1, 0.454902, 1,
-0.2080889, 0.5811222, -0.1493895, 0, 1, 0.4588235, 1,
-0.2068899, -0.1376315, -3.435099, 0, 1, 0.4666667, 1,
-0.2052677, 1.576007, 1.075547, 0, 1, 0.4705882, 1,
-0.205038, -0.1796068, -2.859391, 0, 1, 0.4784314, 1,
-0.2044353, 0.829287, -0.3670053, 0, 1, 0.4823529, 1,
-0.203821, 0.4872593, 1.97934, 0, 1, 0.4901961, 1,
-0.2031531, 0.9207515, 2.680685, 0, 1, 0.4941176, 1,
-0.1998439, 1.345141, -1.119958, 0, 1, 0.5019608, 1,
-0.1990685, 0.1078972, -0.2163012, 0, 1, 0.509804, 1,
-0.1974087, 1.553343, -0.1928808, 0, 1, 0.5137255, 1,
-0.1953662, -0.7241019, -2.208464, 0, 1, 0.5215687, 1,
-0.1933353, 1.801297, 0.4237891, 0, 1, 0.5254902, 1,
-0.1919588, -0.337862, -3.025753, 0, 1, 0.5333334, 1,
-0.1914029, 2.264784, 0.1784412, 0, 1, 0.5372549, 1,
-0.1907201, 0.008403464, -2.702601, 0, 1, 0.5450981, 1,
-0.1869969, -0.1945758, -1.815971, 0, 1, 0.5490196, 1,
-0.1835969, -1.607258, -1.191088, 0, 1, 0.5568628, 1,
-0.1828692, 2.522671, -1.696511, 0, 1, 0.5607843, 1,
-0.1732558, -0.2248389, -3.522203, 0, 1, 0.5686275, 1,
-0.1695064, -2.313255, -4.059114, 0, 1, 0.572549, 1,
-0.168273, -0.8070251, -4.826356, 0, 1, 0.5803922, 1,
-0.1669273, 0.03969802, -2.890099, 0, 1, 0.5843138, 1,
-0.1647575, -0.751251, -2.720625, 0, 1, 0.5921569, 1,
-0.1647293, 1.243371, -0.3995291, 0, 1, 0.5960785, 1,
-0.1586439, 0.3578163, 0.2707184, 0, 1, 0.6039216, 1,
-0.1584515, -1.012448, -2.598052, 0, 1, 0.6117647, 1,
-0.1576971, 0.7870356, 0.8050465, 0, 1, 0.6156863, 1,
-0.1574621, 0.09148759, -1.652449, 0, 1, 0.6235294, 1,
-0.1565066, 1.612364, 0.526616, 0, 1, 0.627451, 1,
-0.1548318, 2.763408, 0.01414513, 0, 1, 0.6352941, 1,
-0.1526964, 1.383933, -1.89146, 0, 1, 0.6392157, 1,
-0.1450517, -1.368594, -4.194607, 0, 1, 0.6470588, 1,
-0.1445234, 0.8680583, -0.3222409, 0, 1, 0.6509804, 1,
-0.144224, -0.9991914, -1.460467, 0, 1, 0.6588235, 1,
-0.1429897, 0.2427499, 0.08890145, 0, 1, 0.6627451, 1,
-0.1367794, 1.231889, 0.7917319, 0, 1, 0.6705883, 1,
-0.1358382, 0.5351902, -0.6224439, 0, 1, 0.6745098, 1,
-0.1318521, -3.022241, -3.944136, 0, 1, 0.682353, 1,
-0.1263231, -0.7693369, -1.895218, 0, 1, 0.6862745, 1,
-0.1257577, -0.1893412, -2.463771, 0, 1, 0.6941177, 1,
-0.12528, -0.06153972, -1.278137, 0, 1, 0.7019608, 1,
-0.1242578, 1.172105, -0.57581, 0, 1, 0.7058824, 1,
-0.1168738, -0.8016206, -2.787571, 0, 1, 0.7137255, 1,
-0.11656, -1.162168, -2.370671, 0, 1, 0.7176471, 1,
-0.1131701, -1.329122, -4.54268, 0, 1, 0.7254902, 1,
-0.113139, 0.8631963, -0.1651905, 0, 1, 0.7294118, 1,
-0.1118826, 1.01971, 0.1266333, 0, 1, 0.7372549, 1,
-0.1037216, -0.9437895, -2.340633, 0, 1, 0.7411765, 1,
-0.1011422, 0.6535066, 0.3404235, 0, 1, 0.7490196, 1,
-0.1009076, -1.811422, -2.305114, 0, 1, 0.7529412, 1,
-0.1004731, 1.866179, 0.898378, 0, 1, 0.7607843, 1,
-0.09991437, 0.06351554, -0.7487158, 0, 1, 0.7647059, 1,
-0.09913096, 1.720445, -1.373968, 0, 1, 0.772549, 1,
-0.09672274, -1.245268, -1.230722, 0, 1, 0.7764706, 1,
-0.09534928, 0.4208582, 0.1392647, 0, 1, 0.7843137, 1,
-0.09241055, -0.9637215, -2.604117, 0, 1, 0.7882353, 1,
-0.08561914, -0.375411, -2.235396, 0, 1, 0.7960784, 1,
-0.0851035, -0.2060922, -3.772451, 0, 1, 0.8039216, 1,
-0.08460204, -0.4140241, -2.815723, 0, 1, 0.8078431, 1,
-0.08381193, 0.868166, -1.304941, 0, 1, 0.8156863, 1,
-0.07708784, -0.420036, -2.116412, 0, 1, 0.8196079, 1,
-0.07677328, 0.2162004, -0.6269653, 0, 1, 0.827451, 1,
-0.07649503, -0.3245431, -1.7199, 0, 1, 0.8313726, 1,
-0.07327735, -0.7164338, -3.522494, 0, 1, 0.8392157, 1,
-0.06959476, 0.7403656, -0.1926174, 0, 1, 0.8431373, 1,
-0.06686798, 0.1668101, -2.728654, 0, 1, 0.8509804, 1,
-0.06286669, 0.3834509, 1.034073, 0, 1, 0.854902, 1,
-0.05890971, 0.2287434, -0.7258554, 0, 1, 0.8627451, 1,
-0.05363042, -0.6411101, -1.064677, 0, 1, 0.8666667, 1,
-0.05124635, -0.5135207, -5.023836, 0, 1, 0.8745098, 1,
-0.04716522, -0.4534948, -3.354535, 0, 1, 0.8784314, 1,
-0.04038605, 0.4652167, -0.02178328, 0, 1, 0.8862745, 1,
-0.03648466, -0.5733879, -3.342288, 0, 1, 0.8901961, 1,
-0.03574281, 1.024125, 0.555472, 0, 1, 0.8980392, 1,
-0.03237622, -2.488906, -3.560639, 0, 1, 0.9058824, 1,
-0.03046803, 0.5513738, 0.1635094, 0, 1, 0.9098039, 1,
-0.02788542, -0.4528158, -3.65835, 0, 1, 0.9176471, 1,
-0.0257881, -2.229825, -4.288412, 0, 1, 0.9215686, 1,
-0.02072139, 0.4443081, -1.479789, 0, 1, 0.9294118, 1,
-0.02018506, 0.354464, -0.285522, 0, 1, 0.9333333, 1,
-0.01947889, -1.978825, -3.810103, 0, 1, 0.9411765, 1,
-0.01893427, -0.6147044, -3.048203, 0, 1, 0.945098, 1,
-0.01878951, 0.7146518, -0.03227194, 0, 1, 0.9529412, 1,
-0.01872567, -1.311191, -3.125078, 0, 1, 0.9568627, 1,
-0.01857312, 0.3353697, -0.8942754, 0, 1, 0.9647059, 1,
-0.01351968, -0.08300386, -4.126185, 0, 1, 0.9686275, 1,
-0.0009037149, 0.2962984, -1.102486, 0, 1, 0.9764706, 1,
-0.0005776087, 0.1889635, 0.0375221, 0, 1, 0.9803922, 1,
-0.0002999142, 0.8265533, 0.7147254, 0, 1, 0.9882353, 1,
0.003704433, 0.225824, 1.999916, 0, 1, 0.9921569, 1,
0.006624343, 0.7722351, 0.3146426, 0, 1, 1, 1,
0.00943331, -1.062133, 4.838088, 0, 0.9921569, 1, 1,
0.01110425, 0.5224773, 1.320288, 0, 0.9882353, 1, 1,
0.01115547, 0.5846659, 0.6381781, 0, 0.9803922, 1, 1,
0.01142986, 0.6575798, 1.395918, 0, 0.9764706, 1, 1,
0.01800651, 0.6387617, 1.07337, 0, 0.9686275, 1, 1,
0.01870042, 2.981661, 0.1761813, 0, 0.9647059, 1, 1,
0.01995942, -0.7897576, 0.8824557, 0, 0.9568627, 1, 1,
0.0203415, -0.352295, 3.063799, 0, 0.9529412, 1, 1,
0.02036616, 0.9360852, -0.8212214, 0, 0.945098, 1, 1,
0.02060991, -0.1314866, 1.513693, 0, 0.9411765, 1, 1,
0.02102306, 0.4847753, 1.672988, 0, 0.9333333, 1, 1,
0.02543641, -0.6686001, 1.849748, 0, 0.9294118, 1, 1,
0.02601372, 2.358535, -0.05041827, 0, 0.9215686, 1, 1,
0.02837997, 0.5538447, 0.7431101, 0, 0.9176471, 1, 1,
0.03101703, 0.1075873, -0.4722474, 0, 0.9098039, 1, 1,
0.03322138, -0.02302393, 1.00143, 0, 0.9058824, 1, 1,
0.03344827, 1.54529, -0.4888319, 0, 0.8980392, 1, 1,
0.03643428, -0.6845056, 3.261666, 0, 0.8901961, 1, 1,
0.04544012, 0.451726, 1.20597, 0, 0.8862745, 1, 1,
0.04597414, -0.02647468, 1.161548, 0, 0.8784314, 1, 1,
0.04722811, -0.5037044, 2.927549, 0, 0.8745098, 1, 1,
0.04871696, -1.268457, 2.161919, 0, 0.8666667, 1, 1,
0.05159674, -0.4593256, 2.828446, 0, 0.8627451, 1, 1,
0.05161774, 0.3146025, 1.010734, 0, 0.854902, 1, 1,
0.05168032, -0.2775186, 2.84736, 0, 0.8509804, 1, 1,
0.05710379, -0.3039698, 3.352211, 0, 0.8431373, 1, 1,
0.05883182, 0.6057208, -0.7523924, 0, 0.8392157, 1, 1,
0.05955527, -1.815765, 1.716084, 0, 0.8313726, 1, 1,
0.06009649, 1.039984, 1.216283, 0, 0.827451, 1, 1,
0.0623402, -1.035331, 1.727381, 0, 0.8196079, 1, 1,
0.06344642, -0.8029609, 3.689003, 0, 0.8156863, 1, 1,
0.06606687, 0.1153694, 1.176823, 0, 0.8078431, 1, 1,
0.06799646, -2.142215, 4.409673, 0, 0.8039216, 1, 1,
0.06971173, -1.527433, 3.981339, 0, 0.7960784, 1, 1,
0.07010245, -1.103805, 4.22247, 0, 0.7882353, 1, 1,
0.07088669, 0.6759923, -0.3264262, 0, 0.7843137, 1, 1,
0.07660455, -2.370174, 3.840115, 0, 0.7764706, 1, 1,
0.07956874, 0.5264561, 0.9994278, 0, 0.772549, 1, 1,
0.08054454, 0.5514141, 0.1987169, 0, 0.7647059, 1, 1,
0.08475848, -1.894003, 3.478862, 0, 0.7607843, 1, 1,
0.08735736, 0.1671135, 1.982757, 0, 0.7529412, 1, 1,
0.08858529, -0.1155204, 1.525106, 0, 0.7490196, 1, 1,
0.095172, -1.938709, 3.523347, 0, 0.7411765, 1, 1,
0.100868, -0.8180546, 2.3443, 0, 0.7372549, 1, 1,
0.1030136, 0.8705373, 0.5748721, 0, 0.7294118, 1, 1,
0.1050827, -0.8329302, 0.8634379, 0, 0.7254902, 1, 1,
0.1063964, -1.293931, 5.510226, 0, 0.7176471, 1, 1,
0.106968, 0.6182026, 0.3492287, 0, 0.7137255, 1, 1,
0.1073395, -1.064266, 3.788784, 0, 0.7058824, 1, 1,
0.1077764, 0.5693822, -0.3543328, 0, 0.6980392, 1, 1,
0.1092115, -0.8826909, 1.247776, 0, 0.6941177, 1, 1,
0.1206558, 0.7706793, -2.297509, 0, 0.6862745, 1, 1,
0.1209761, -0.984898, 4.714205, 0, 0.682353, 1, 1,
0.1253968, -0.4022259, 1.464767, 0, 0.6745098, 1, 1,
0.1292511, 1.427118, 0.06410421, 0, 0.6705883, 1, 1,
0.130531, -0.2546462, 3.457463, 0, 0.6627451, 1, 1,
0.1310638, -1.421966, 2.990959, 0, 0.6588235, 1, 1,
0.1343687, 0.08033248, 1.215459, 0, 0.6509804, 1, 1,
0.1357939, -0.6143325, 4.121125, 0, 0.6470588, 1, 1,
0.1359695, 0.2550211, 1.641675, 0, 0.6392157, 1, 1,
0.1380561, 1.352649, 1.002761, 0, 0.6352941, 1, 1,
0.1390079, 0.08245157, 1.024283, 0, 0.627451, 1, 1,
0.1392691, 0.3198825, -0.06706467, 0, 0.6235294, 1, 1,
0.1444883, -0.02124438, 1.255842, 0, 0.6156863, 1, 1,
0.1512129, -1.618007, 1.959431, 0, 0.6117647, 1, 1,
0.1514488, -0.2477115, 3.280451, 0, 0.6039216, 1, 1,
0.1520369, -1.024238, 1.448254, 0, 0.5960785, 1, 1,
0.1561448, -0.4911478, 2.601427, 0, 0.5921569, 1, 1,
0.1577276, 0.7618827, 2.079063, 0, 0.5843138, 1, 1,
0.1579971, -0.1708277, 3.828772, 0, 0.5803922, 1, 1,
0.1588493, -0.6707935, 3.493126, 0, 0.572549, 1, 1,
0.1612411, -0.7402825, 2.959818, 0, 0.5686275, 1, 1,
0.1617292, -1.569228, 4.034203, 0, 0.5607843, 1, 1,
0.1648836, 1.639673, 1.799807, 0, 0.5568628, 1, 1,
0.1651026, -0.4337525, 1.468913, 0, 0.5490196, 1, 1,
0.1674228, -1.160912, 2.883643, 0, 0.5450981, 1, 1,
0.1685153, 1.228296, -1.385944, 0, 0.5372549, 1, 1,
0.1686766, -0.3068175, 3.484685, 0, 0.5333334, 1, 1,
0.1778977, -0.07107055, 1.970812, 0, 0.5254902, 1, 1,
0.1786947, 0.1577013, 0.4664693, 0, 0.5215687, 1, 1,
0.1795136, -0.2895909, 3.267939, 0, 0.5137255, 1, 1,
0.1800531, -0.05089777, 2.0804, 0, 0.509804, 1, 1,
0.1824318, 1.334673, -0.09033764, 0, 0.5019608, 1, 1,
0.1836632, -0.0574925, 0.4673792, 0, 0.4941176, 1, 1,
0.1841653, 0.6381661, 0.5580841, 0, 0.4901961, 1, 1,
0.1843301, -0.9007079, 2.283307, 0, 0.4823529, 1, 1,
0.1867031, 0.403266, -0.3864113, 0, 0.4784314, 1, 1,
0.1901712, -1.498634, 2.23648, 0, 0.4705882, 1, 1,
0.1907965, -0.8524009, 3.151763, 0, 0.4666667, 1, 1,
0.1941659, 0.5776775, 1.313756, 0, 0.4588235, 1, 1,
0.1941859, -2.722783, 4.241359, 0, 0.454902, 1, 1,
0.1954606, 1.321863, -1.157964, 0, 0.4470588, 1, 1,
0.1959693, -0.296776, 2.092231, 0, 0.4431373, 1, 1,
0.1970691, -0.3773957, 3.495253, 0, 0.4352941, 1, 1,
0.1979373, -0.4422615, 1.597713, 0, 0.4313726, 1, 1,
0.1990208, 0.5936028, 0.02813785, 0, 0.4235294, 1, 1,
0.2009789, -0.5292879, 2.950773, 0, 0.4196078, 1, 1,
0.2013815, 1.131512, 1.265684, 0, 0.4117647, 1, 1,
0.2021707, -1.057349, 3.107357, 0, 0.4078431, 1, 1,
0.2023013, 1.74226, -1.005521, 0, 0.4, 1, 1,
0.2029085, -0.8263883, 4.47758, 0, 0.3921569, 1, 1,
0.2077498, 0.941594, -0.3519405, 0, 0.3882353, 1, 1,
0.2084818, 0.6624532, -0.3717159, 0, 0.3803922, 1, 1,
0.2086468, 0.1233315, 1.292443, 0, 0.3764706, 1, 1,
0.2202451, 0.6059018, 2.944219, 0, 0.3686275, 1, 1,
0.2222496, -1.305447, 3.976604, 0, 0.3647059, 1, 1,
0.222416, -0.4005529, 1.894262, 0, 0.3568628, 1, 1,
0.2274492, 0.8009799, -0.4637788, 0, 0.3529412, 1, 1,
0.2324089, -0.08652318, 3.747633, 0, 0.345098, 1, 1,
0.2371714, -0.8009048, 1.41585, 0, 0.3411765, 1, 1,
0.237239, -2.347025, 3.598225, 0, 0.3333333, 1, 1,
0.2376757, -0.6719677, 2.172294, 0, 0.3294118, 1, 1,
0.2377884, -0.6442286, 2.753579, 0, 0.3215686, 1, 1,
0.2407384, -0.12824, 2.595822, 0, 0.3176471, 1, 1,
0.2414523, -0.3686473, 2.708922, 0, 0.3098039, 1, 1,
0.2436862, 0.6301902, 0.5225178, 0, 0.3058824, 1, 1,
0.2440546, -1.335111, 1.790193, 0, 0.2980392, 1, 1,
0.2496113, 0.04042831, 3.545645, 0, 0.2901961, 1, 1,
0.2500224, -0.3405719, 4.394209, 0, 0.2862745, 1, 1,
0.2534686, 0.3424951, 1.05659, 0, 0.2784314, 1, 1,
0.2813484, -0.3008834, 2.001963, 0, 0.2745098, 1, 1,
0.2816704, 0.02493294, 1.811604, 0, 0.2666667, 1, 1,
0.2817529, -0.1838976, 1.440223, 0, 0.2627451, 1, 1,
0.2856647, -0.7934655, 3.135061, 0, 0.254902, 1, 1,
0.2898711, -0.7818425, 2.19369, 0, 0.2509804, 1, 1,
0.2914615, -0.4143268, 2.347236, 0, 0.2431373, 1, 1,
0.2924613, 0.9904127, 0.8332976, 0, 0.2392157, 1, 1,
0.2932776, 0.6519527, -0.231398, 0, 0.2313726, 1, 1,
0.2938452, 0.5733419, 2.268985, 0, 0.227451, 1, 1,
0.3005801, -1.865451, 3.213076, 0, 0.2196078, 1, 1,
0.3020719, -0.1154952, 1.517772, 0, 0.2156863, 1, 1,
0.3055679, 1.068346, -0.365389, 0, 0.2078431, 1, 1,
0.3069203, 1.224745, -0.3291023, 0, 0.2039216, 1, 1,
0.3092985, 0.6167491, 0.6871437, 0, 0.1960784, 1, 1,
0.3112336, 0.9032064, 1.557809, 0, 0.1882353, 1, 1,
0.320695, 0.2101774, 0.2948727, 0, 0.1843137, 1, 1,
0.3213302, 0.3584619, 0.9422652, 0, 0.1764706, 1, 1,
0.3238936, -0.1015538, 1.256449, 0, 0.172549, 1, 1,
0.3246432, 0.5629934, 0.8609648, 0, 0.1647059, 1, 1,
0.3263354, -0.5214282, 1.284136, 0, 0.1607843, 1, 1,
0.331222, -0.2703569, 3.138852, 0, 0.1529412, 1, 1,
0.3322912, -1.490193, 2.965021, 0, 0.1490196, 1, 1,
0.3328584, -0.2324592, 3.299159, 0, 0.1411765, 1, 1,
0.3417515, 1.399142, -0.5078093, 0, 0.1372549, 1, 1,
0.3460518, -1.168636, 3.144727, 0, 0.1294118, 1, 1,
0.3463983, -0.1350524, 2.331466, 0, 0.1254902, 1, 1,
0.3492723, 0.03929832, 1.182607, 0, 0.1176471, 1, 1,
0.3520638, -0.8518955, 2.176471, 0, 0.1137255, 1, 1,
0.3535135, -1.524921, 2.881968, 0, 0.1058824, 1, 1,
0.3553854, -0.9178589, 4.409134, 0, 0.09803922, 1, 1,
0.3555869, -0.4446818, 2.809839, 0, 0.09411765, 1, 1,
0.3616148, -0.2428831, 3.323349, 0, 0.08627451, 1, 1,
0.3649842, -1.232802, 1.793985, 0, 0.08235294, 1, 1,
0.3650205, 0.6455913, 1.544199, 0, 0.07450981, 1, 1,
0.3668546, -0.7917646, 2.703253, 0, 0.07058824, 1, 1,
0.3764903, 0.8367822, 0.9970102, 0, 0.0627451, 1, 1,
0.381003, 0.2875133, -0.05486365, 0, 0.05882353, 1, 1,
0.3821489, 1.621282, 2.257303, 0, 0.05098039, 1, 1,
0.3821941, -1.108741, -0.03664491, 0, 0.04705882, 1, 1,
0.3826601, -0.44352, 4.426708, 0, 0.03921569, 1, 1,
0.3837105, 0.1827865, -0.3353214, 0, 0.03529412, 1, 1,
0.3894002, -1.590101, 4.529782, 0, 0.02745098, 1, 1,
0.3963453, 0.9088609, 1.452653, 0, 0.02352941, 1, 1,
0.3985409, 0.04908092, 2.455011, 0, 0.01568628, 1, 1,
0.4073167, 0.3920273, 1.594513, 0, 0.01176471, 1, 1,
0.407676, -0.8239179, 2.864991, 0, 0.003921569, 1, 1,
0.4114752, 0.08456217, 1.900683, 0.003921569, 0, 1, 1,
0.4147119, 0.1403342, 1.37505, 0.007843138, 0, 1, 1,
0.4181601, -0.4792736, 3.520941, 0.01568628, 0, 1, 1,
0.4185576, 0.9823102, 0.2711032, 0.01960784, 0, 1, 1,
0.4189245, 1.35692, -0.7156352, 0.02745098, 0, 1, 1,
0.4203855, -0.3726153, 2.439986, 0.03137255, 0, 1, 1,
0.4269611, 1.271099, -1.789818, 0.03921569, 0, 1, 1,
0.4313384, -0.7030957, 2.501539, 0.04313726, 0, 1, 1,
0.4313506, 0.7582214, -1.088101, 0.05098039, 0, 1, 1,
0.4341423, 0.5891747, 0.06319883, 0.05490196, 0, 1, 1,
0.4423174, 0.2323642, 0.8584508, 0.0627451, 0, 1, 1,
0.4437432, 0.5097489, 0.1509428, 0.06666667, 0, 1, 1,
0.4444733, 0.7984017, 0.6240399, 0.07450981, 0, 1, 1,
0.448135, 1.702936, 0.01060105, 0.07843138, 0, 1, 1,
0.4572521, 2.090691, -0.2635087, 0.08627451, 0, 1, 1,
0.4588211, 0.8114091, -0.221633, 0.09019608, 0, 1, 1,
0.4594941, -0.9334974, 3.152952, 0.09803922, 0, 1, 1,
0.4634545, -0.1751639, 2.798332, 0.1058824, 0, 1, 1,
0.4634874, -1.165717, 1.773674, 0.1098039, 0, 1, 1,
0.4664737, 0.6088627, 1.221715, 0.1176471, 0, 1, 1,
0.4713245, -0.5571225, 1.460911, 0.1215686, 0, 1, 1,
0.4760615, -0.569683, 3.569412, 0.1294118, 0, 1, 1,
0.4790458, 0.57159, 0.7626667, 0.1333333, 0, 1, 1,
0.4805536, -0.7084143, 2.513664, 0.1411765, 0, 1, 1,
0.4811752, 1.900784, 1.525642, 0.145098, 0, 1, 1,
0.4818895, 0.3975511, 0.3431544, 0.1529412, 0, 1, 1,
0.48317, -0.179482, 2.189572, 0.1568628, 0, 1, 1,
0.4847195, -0.4482459, 2.085651, 0.1647059, 0, 1, 1,
0.4881102, 1.143532, 0.4577172, 0.1686275, 0, 1, 1,
0.4936328, -1.243794, 2.309126, 0.1764706, 0, 1, 1,
0.4945747, -0.03129173, 1.628252, 0.1803922, 0, 1, 1,
0.4993311, 0.6552266, -0.6574891, 0.1882353, 0, 1, 1,
0.5025919, -1.603736, 2.347609, 0.1921569, 0, 1, 1,
0.5082108, -0.970988, 1.633596, 0.2, 0, 1, 1,
0.5155405, -1.658773, 2.08576, 0.2078431, 0, 1, 1,
0.5183624, 0.5718815, 0.7706942, 0.2117647, 0, 1, 1,
0.5231732, 1.180143, 0.243273, 0.2196078, 0, 1, 1,
0.5304155, 2.939255, 1.910193, 0.2235294, 0, 1, 1,
0.537605, -0.6000869, 1.0532, 0.2313726, 0, 1, 1,
0.5389744, -0.1933609, 3.197006, 0.2352941, 0, 1, 1,
0.5432016, -0.4106134, 2.857446, 0.2431373, 0, 1, 1,
0.5533497, -1.072978, 1.400616, 0.2470588, 0, 1, 1,
0.5618678, 1.788542, 2.374168, 0.254902, 0, 1, 1,
0.5647485, -0.06019419, 2.423981, 0.2588235, 0, 1, 1,
0.5648264, -1.098804, 0.7946291, 0.2666667, 0, 1, 1,
0.565519, -0.3204588, 1.965809, 0.2705882, 0, 1, 1,
0.5682138, 1.997992, 1.158567, 0.2784314, 0, 1, 1,
0.5689051, -1.675678, 3.811246, 0.282353, 0, 1, 1,
0.5743213, -1.106425, 3.407107, 0.2901961, 0, 1, 1,
0.5752276, -0.245422, 0.293174, 0.2941177, 0, 1, 1,
0.5779064, 0.07769231, 1.020852, 0.3019608, 0, 1, 1,
0.5791271, -1.057164, 2.417535, 0.3098039, 0, 1, 1,
0.5800902, -0.2602336, 1.442517, 0.3137255, 0, 1, 1,
0.592423, 0.1094157, 2.015419, 0.3215686, 0, 1, 1,
0.5933895, -0.08194673, 2.359672, 0.3254902, 0, 1, 1,
0.5947016, -0.4373165, 1.477144, 0.3333333, 0, 1, 1,
0.5971991, 0.7781974, 1.617391, 0.3372549, 0, 1, 1,
0.6087902, -0.5806126, 2.574524, 0.345098, 0, 1, 1,
0.6161233, -0.1055281, 1.989545, 0.3490196, 0, 1, 1,
0.6170642, -1.855283, 2.065105, 0.3568628, 0, 1, 1,
0.6180845, -0.3093955, 1.92975, 0.3607843, 0, 1, 1,
0.6202832, -0.9677319, 2.629548, 0.3686275, 0, 1, 1,
0.6221162, -0.3066361, 2.281223, 0.372549, 0, 1, 1,
0.6227849, 0.435571, -0.2816094, 0.3803922, 0, 1, 1,
0.6280223, -0.1494254, -0.3051181, 0.3843137, 0, 1, 1,
0.6322117, -0.2919638, 4.305798, 0.3921569, 0, 1, 1,
0.6323431, 0.1013621, 1.065811, 0.3960784, 0, 1, 1,
0.632618, 0.2904705, 0.93583, 0.4039216, 0, 1, 1,
0.6370168, 0.3989689, -0.1715282, 0.4117647, 0, 1, 1,
0.6379825, 0.6148215, 0.6222069, 0.4156863, 0, 1, 1,
0.6444101, 0.617835, 2.625069, 0.4235294, 0, 1, 1,
0.6475024, 0.4533425, 2.391428, 0.427451, 0, 1, 1,
0.6492611, -0.7540856, 1.833967, 0.4352941, 0, 1, 1,
0.6514817, -1.552981, 2.921858, 0.4392157, 0, 1, 1,
0.6518551, -0.2366735, 1.172217, 0.4470588, 0, 1, 1,
0.6563199, -0.4233613, 1.296673, 0.4509804, 0, 1, 1,
0.6569495, -0.03693982, 0.5487701, 0.4588235, 0, 1, 1,
0.6612163, 0.190631, 1.540124, 0.4627451, 0, 1, 1,
0.661333, -0.4398516, 3.111276, 0.4705882, 0, 1, 1,
0.6658506, 1.340675, 3.034419, 0.4745098, 0, 1, 1,
0.6692685, 0.5093315, 0.5645427, 0.4823529, 0, 1, 1,
0.6724547, 0.7084175, 2.18787, 0.4862745, 0, 1, 1,
0.6748863, -0.9473097, 2.589314, 0.4941176, 0, 1, 1,
0.6769525, 0.8050718, 1.114189, 0.5019608, 0, 1, 1,
0.6987876, 0.020648, 2.471472, 0.5058824, 0, 1, 1,
0.7001162, 1.528343, 1.355263, 0.5137255, 0, 1, 1,
0.7020442, -0.3268501, 1.515785, 0.5176471, 0, 1, 1,
0.7029908, -1.067923, 2.939854, 0.5254902, 0, 1, 1,
0.7093028, -0.1220654, 1.961016, 0.5294118, 0, 1, 1,
0.7112286, 0.1098944, 1.014871, 0.5372549, 0, 1, 1,
0.7205613, 0.06957067, 1.585478, 0.5411765, 0, 1, 1,
0.7218437, 0.628095, 1.616007, 0.5490196, 0, 1, 1,
0.7238569, -0.1403404, 1.442691, 0.5529412, 0, 1, 1,
0.7239859, -1.394266, 2.821348, 0.5607843, 0, 1, 1,
0.7338959, 1.332358, -0.667986, 0.5647059, 0, 1, 1,
0.7355981, -0.1747248, 3.489365, 0.572549, 0, 1, 1,
0.73641, 0.8956319, 1.268045, 0.5764706, 0, 1, 1,
0.7369935, -0.7207139, 1.563714, 0.5843138, 0, 1, 1,
0.7370812, -1.348536, 1.930678, 0.5882353, 0, 1, 1,
0.7409849, 0.9171964, 0.4830555, 0.5960785, 0, 1, 1,
0.7446643, -0.8652356, 2.233255, 0.6039216, 0, 1, 1,
0.745996, -0.07597734, 1.590392, 0.6078432, 0, 1, 1,
0.7467217, 1.115996, 1.33835, 0.6156863, 0, 1, 1,
0.7470682, -1.531149, 4.741339, 0.6196079, 0, 1, 1,
0.7495665, -0.4314236, 2.503438, 0.627451, 0, 1, 1,
0.7564538, -0.7966639, 2.884964, 0.6313726, 0, 1, 1,
0.7602525, 0.3999104, 2.855038, 0.6392157, 0, 1, 1,
0.7606248, 0.7640654, 1.298002, 0.6431373, 0, 1, 1,
0.7627816, 1.536504, 0.5238, 0.6509804, 0, 1, 1,
0.7668101, 0.4042931, -0.1341858, 0.654902, 0, 1, 1,
0.7726721, 0.3001563, 1.373437, 0.6627451, 0, 1, 1,
0.7758002, 0.4940153, 1.294015, 0.6666667, 0, 1, 1,
0.7762159, -0.1998631, 2.94464, 0.6745098, 0, 1, 1,
0.7854345, 0.7883393, -0.2960565, 0.6784314, 0, 1, 1,
0.7858378, -2.884693, 3.058099, 0.6862745, 0, 1, 1,
0.7873988, -0.8700802, 1.807914, 0.6901961, 0, 1, 1,
0.7897336, 0.7778721, -0.7335464, 0.6980392, 0, 1, 1,
0.7973535, -0.1046663, 1.390059, 0.7058824, 0, 1, 1,
0.7999543, -0.1113345, 1.121875, 0.7098039, 0, 1, 1,
0.8034011, -0.3827516, 2.670286, 0.7176471, 0, 1, 1,
0.8049358, -1.026775, 2.044414, 0.7215686, 0, 1, 1,
0.8088107, 0.9988691, 1.953258, 0.7294118, 0, 1, 1,
0.8100139, 0.522535, 1.103934, 0.7333333, 0, 1, 1,
0.8129148, 2.334003, -0.2434934, 0.7411765, 0, 1, 1,
0.8159138, -0.1093215, 2.078019, 0.7450981, 0, 1, 1,
0.8164359, 0.3423573, 1.502986, 0.7529412, 0, 1, 1,
0.8207134, 0.3399738, 2.766827, 0.7568628, 0, 1, 1,
0.8211981, -0.609737, 1.004813, 0.7647059, 0, 1, 1,
0.8227862, 2.259625, -0.08995091, 0.7686275, 0, 1, 1,
0.8240399, -0.4844526, 2.548267, 0.7764706, 0, 1, 1,
0.8244023, -0.04181253, 1.766369, 0.7803922, 0, 1, 1,
0.8245523, 0.03817371, 1.755339, 0.7882353, 0, 1, 1,
0.8274112, -0.06423002, 2.847676, 0.7921569, 0, 1, 1,
0.82743, -0.9411908, 1.494643, 0.8, 0, 1, 1,
0.8290678, -0.5775829, 0.6670535, 0.8078431, 0, 1, 1,
0.8307066, 0.9390724, -1.538919, 0.8117647, 0, 1, 1,
0.8308268, 0.006955051, 1.474769, 0.8196079, 0, 1, 1,
0.8356623, -0.5990363, 1.258465, 0.8235294, 0, 1, 1,
0.8370686, 1.405566, 0.1046972, 0.8313726, 0, 1, 1,
0.8398532, -1.345146, 3.028147, 0.8352941, 0, 1, 1,
0.8449343, 1.350284, -0.4996147, 0.8431373, 0, 1, 1,
0.8483026, 0.6305594, 2.41683, 0.8470588, 0, 1, 1,
0.8512622, 1.2691, 0.3736509, 0.854902, 0, 1, 1,
0.8518294, -0.7806998, 2.711768, 0.8588235, 0, 1, 1,
0.8541406, 0.6542891, 0.1368231, 0.8666667, 0, 1, 1,
0.858672, 2.414888, 1.198885, 0.8705882, 0, 1, 1,
0.8629981, 1.522438, 0.02378335, 0.8784314, 0, 1, 1,
0.8645837, 0.8012254, -0.1207016, 0.8823529, 0, 1, 1,
0.8648403, -0.04762981, 2.194091, 0.8901961, 0, 1, 1,
0.8654639, -1.386057, 2.450443, 0.8941177, 0, 1, 1,
0.8655704, -0.3005009, 1.800169, 0.9019608, 0, 1, 1,
0.867718, 0.9858838, -1.445627, 0.9098039, 0, 1, 1,
0.8704717, 0.7713929, 0.4030163, 0.9137255, 0, 1, 1,
0.8753991, 0.5600979, 0.4144173, 0.9215686, 0, 1, 1,
0.8756683, 0.1335927, -0.2109943, 0.9254902, 0, 1, 1,
0.8759395, -1.317926, 3.171829, 0.9333333, 0, 1, 1,
0.8761375, -1.260732, 0.8708385, 0.9372549, 0, 1, 1,
0.8788152, -0.06365149, 0.578523, 0.945098, 0, 1, 1,
0.8861786, -0.3352003, 1.536039, 0.9490196, 0, 1, 1,
0.8879276, 0.05635614, 1.200823, 0.9568627, 0, 1, 1,
0.8879842, 0.05817168, 0.7504144, 0.9607843, 0, 1, 1,
0.8930828, 0.6468941, 1.09922, 0.9686275, 0, 1, 1,
0.895857, 2.07243, -0.7178651, 0.972549, 0, 1, 1,
0.9028851, -2.256854, 2.502435, 0.9803922, 0, 1, 1,
0.906254, -2.428114, 2.478715, 0.9843137, 0, 1, 1,
0.9066727, -0.07752398, -0.4356097, 0.9921569, 0, 1, 1,
0.9120466, 0.1692155, 0.4043535, 0.9960784, 0, 1, 1,
0.9147677, -1.36559, 2.541873, 1, 0, 0.9960784, 1,
0.9171272, -1.587406, 2.383158, 1, 0, 0.9882353, 1,
0.9181636, -0.9610355, 2.84363, 1, 0, 0.9843137, 1,
0.9251152, -1.87831, 3.34346, 1, 0, 0.9764706, 1,
0.9443379, 1.006764, 2.271246, 1, 0, 0.972549, 1,
0.9507797, -0.7518521, 1.073252, 1, 0, 0.9647059, 1,
0.9627965, 1.409804, 2.033016, 1, 0, 0.9607843, 1,
0.9701705, -1.479938, 2.446853, 1, 0, 0.9529412, 1,
0.9710097, 1.404714, 2.409716, 1, 0, 0.9490196, 1,
0.9716871, 0.3811882, 0.3752276, 1, 0, 0.9411765, 1,
0.9729545, 0.6031131, -0.401043, 1, 0, 0.9372549, 1,
0.9773977, -1.002719, 3.719279, 1, 0, 0.9294118, 1,
0.9819972, 0.4854815, 3.572438, 1, 0, 0.9254902, 1,
0.982485, 0.9818836, 0.7335857, 1, 0, 0.9176471, 1,
0.9858775, -0.84965, 3.512887, 1, 0, 0.9137255, 1,
0.9947005, -1.263382, 2.420487, 1, 0, 0.9058824, 1,
0.9957028, 2.286188, -0.3967497, 1, 0, 0.9019608, 1,
0.9969999, -0.2511104, 2.437748, 1, 0, 0.8941177, 1,
1.003943, -0.7341717, 2.923333, 1, 0, 0.8862745, 1,
1.016509, 0.7950021, -1.365178, 1, 0, 0.8823529, 1,
1.023016, -0.31719, 3.25368, 1, 0, 0.8745098, 1,
1.024008, -0.03474195, 1.553729, 1, 0, 0.8705882, 1,
1.035637, -0.05194218, 2.218407, 1, 0, 0.8627451, 1,
1.039332, 0.9209154, 0.7953191, 1, 0, 0.8588235, 1,
1.042347, -0.8049753, 1.58927, 1, 0, 0.8509804, 1,
1.044808, -0.02612473, 0.4913423, 1, 0, 0.8470588, 1,
1.044868, -1.851989, 2.428186, 1, 0, 0.8392157, 1,
1.048286, -0.1678401, 0.8058506, 1, 0, 0.8352941, 1,
1.052547, -0.4937977, 2.821091, 1, 0, 0.827451, 1,
1.05583, -0.7620834, 2.008786, 1, 0, 0.8235294, 1,
1.05683, 0.4993687, 0.07819851, 1, 0, 0.8156863, 1,
1.061458, 0.1532925, -2.294596, 1, 0, 0.8117647, 1,
1.067674, 0.9159008, 1.857605, 1, 0, 0.8039216, 1,
1.068433, -0.2831828, 4.292625, 1, 0, 0.7960784, 1,
1.073195, -0.9496056, 2.239627, 1, 0, 0.7921569, 1,
1.077162, -1.863712, 2.989934, 1, 0, 0.7843137, 1,
1.077694, -1.591269, 3.270846, 1, 0, 0.7803922, 1,
1.08813, 0.4125879, 0.3211704, 1, 0, 0.772549, 1,
1.090424, -0.08052826, -0.4252327, 1, 0, 0.7686275, 1,
1.092522, 0.3923029, 0.3119432, 1, 0, 0.7607843, 1,
1.094453, -0.5327376, 1.028241, 1, 0, 0.7568628, 1,
1.097702, -1.464508, 2.731783, 1, 0, 0.7490196, 1,
1.100353, 0.1762861, 0.6474889, 1, 0, 0.7450981, 1,
1.110516, 0.197853, 0.7298512, 1, 0, 0.7372549, 1,
1.110953, -1.966916, 2.772939, 1, 0, 0.7333333, 1,
1.111227, -0.6108304, 2.691955, 1, 0, 0.7254902, 1,
1.123365, -0.6704078, 1.740381, 1, 0, 0.7215686, 1,
1.129888, 0.5216705, 0.88367, 1, 0, 0.7137255, 1,
1.138385, -0.05860989, 0.9802268, 1, 0, 0.7098039, 1,
1.144075, 2.012563, 1.575116, 1, 0, 0.7019608, 1,
1.144918, -1.048317, 4.315283, 1, 0, 0.6941177, 1,
1.147629, -1.970374, 2.36211, 1, 0, 0.6901961, 1,
1.149406, -0.1907596, 2.294005, 1, 0, 0.682353, 1,
1.150571, -0.7187462, 2.80033, 1, 0, 0.6784314, 1,
1.150923, 0.9051208, 1.168242, 1, 0, 0.6705883, 1,
1.151301, -1.261967, 2.796235, 1, 0, 0.6666667, 1,
1.154561, 0.9359403, 0.8206209, 1, 0, 0.6588235, 1,
1.157494, 1.457148, -0.1317226, 1, 0, 0.654902, 1,
1.159676, -1.023152, 2.89974, 1, 0, 0.6470588, 1,
1.160356, 0.5845169, 2.010029, 1, 0, 0.6431373, 1,
1.167974, -0.416664, 1.791356, 1, 0, 0.6352941, 1,
1.169613, 0.2901164, 2.87806, 1, 0, 0.6313726, 1,
1.175637, -1.383426, 3.271389, 1, 0, 0.6235294, 1,
1.17625, -0.792475, 2.448683, 1, 0, 0.6196079, 1,
1.179171, -1.94057, 1.575962, 1, 0, 0.6117647, 1,
1.184092, -0.9353556, 2.831233, 1, 0, 0.6078432, 1,
1.18808, -0.006207846, 1.126881, 1, 0, 0.6, 1,
1.188104, 0.1616966, 1.6543, 1, 0, 0.5921569, 1,
1.193182, 0.2866795, 0.4050411, 1, 0, 0.5882353, 1,
1.210282, -0.8392885, 3.549764, 1, 0, 0.5803922, 1,
1.211982, 0.4115514, 2.85537, 1, 0, 0.5764706, 1,
1.22591, 0.5387012, 1.418806, 1, 0, 0.5686275, 1,
1.230547, 0.6225231, 1.161186, 1, 0, 0.5647059, 1,
1.235546, -0.02260824, 1.425446, 1, 0, 0.5568628, 1,
1.247542, 2.528567, 0.6998727, 1, 0, 0.5529412, 1,
1.26536, -0.3638029, 1.571399, 1, 0, 0.5450981, 1,
1.266894, -1.37528, 0.8752409, 1, 0, 0.5411765, 1,
1.268517, -1.17053, 3.948119, 1, 0, 0.5333334, 1,
1.268744, -1.616013, 4.419228, 1, 0, 0.5294118, 1,
1.271356, -0.5869943, 2.249428, 1, 0, 0.5215687, 1,
1.274587, 0.01228926, 3.922377, 1, 0, 0.5176471, 1,
1.288393, 0.7065222, 1.097136, 1, 0, 0.509804, 1,
1.291124, -1.818997, 3.803585, 1, 0, 0.5058824, 1,
1.310194, -0.387989, 2.003966, 1, 0, 0.4980392, 1,
1.312335, 0.3466606, 3.283824, 1, 0, 0.4901961, 1,
1.320359, -0.6188182, 1.250536, 1, 0, 0.4862745, 1,
1.321336, 1.222971, 2.176502, 1, 0, 0.4784314, 1,
1.342676, 0.4023715, 0.3825616, 1, 0, 0.4745098, 1,
1.36015, 0.5932941, 2.279341, 1, 0, 0.4666667, 1,
1.369647, -0.4718652, 1.800654, 1, 0, 0.4627451, 1,
1.371654, 1.228649, 0.4414682, 1, 0, 0.454902, 1,
1.399617, 1.202965, -3.337169, 1, 0, 0.4509804, 1,
1.405441, -0.3789036, 1.582032, 1, 0, 0.4431373, 1,
1.408414, 1.149991, 0.4061229, 1, 0, 0.4392157, 1,
1.428253, 0.075594, 1.226913, 1, 0, 0.4313726, 1,
1.451647, 1.071793, 0.6608572, 1, 0, 0.427451, 1,
1.454063, -0.9595068, 1.911474, 1, 0, 0.4196078, 1,
1.464791, -0.2882643, 1.435199, 1, 0, 0.4156863, 1,
1.492757, -0.7593658, 2.988258, 1, 0, 0.4078431, 1,
1.495729, -0.08660572, 1.955175, 1, 0, 0.4039216, 1,
1.511206, -0.7228462, 1.725168, 1, 0, 0.3960784, 1,
1.515487, -0.09120078, 4.010391, 1, 0, 0.3882353, 1,
1.525919, 1.42139, 0.8303977, 1, 0, 0.3843137, 1,
1.534341, -0.3808267, 2.349581, 1, 0, 0.3764706, 1,
1.539776, -0.01895336, -1.225821, 1, 0, 0.372549, 1,
1.55248, 0.889149, 1.468008, 1, 0, 0.3647059, 1,
1.567512, 1.12011, 1.344496, 1, 0, 0.3607843, 1,
1.574765, -1.447785, 3.099796, 1, 0, 0.3529412, 1,
1.598345, -0.6729029, 1.092666, 1, 0, 0.3490196, 1,
1.612387, -1.241415, 2.081084, 1, 0, 0.3411765, 1,
1.615033, 0.2918935, 1.80953, 1, 0, 0.3372549, 1,
1.622795, -0.08024555, 2.053873, 1, 0, 0.3294118, 1,
1.623483, -0.5710247, 0.8563715, 1, 0, 0.3254902, 1,
1.626611, 0.3039296, 0.2508362, 1, 0, 0.3176471, 1,
1.635878, 0.341704, -1.717931, 1, 0, 0.3137255, 1,
1.63595, 0.4996555, 2.413116, 1, 0, 0.3058824, 1,
1.646545, -1.549972, 1.467506, 1, 0, 0.2980392, 1,
1.6483, 0.3420369, 0.5675356, 1, 0, 0.2941177, 1,
1.648319, 1.083874, 1.4038, 1, 0, 0.2862745, 1,
1.65498, -0.6735354, 1.26298, 1, 0, 0.282353, 1,
1.678861, 0.2922975, 2.111732, 1, 0, 0.2745098, 1,
1.687462, 0.7564011, -0.6076989, 1, 0, 0.2705882, 1,
1.700557, 1.552168, 0.4253587, 1, 0, 0.2627451, 1,
1.701268, -0.565041, 2.746225, 1, 0, 0.2588235, 1,
1.709121, -1.772506, 3.326523, 1, 0, 0.2509804, 1,
1.73456, -1.153816, 1.806391, 1, 0, 0.2470588, 1,
1.781776, 0.1158338, 0.7506426, 1, 0, 0.2392157, 1,
1.782583, 0.8167123, 1.788901, 1, 0, 0.2352941, 1,
1.793067, 1.742757, -0.8460256, 1, 0, 0.227451, 1,
1.796415, -0.01685457, 3.084751, 1, 0, 0.2235294, 1,
1.829742, 0.2179602, 0.02842298, 1, 0, 0.2156863, 1,
1.872005, 0.4529744, 2.20464, 1, 0, 0.2117647, 1,
1.875439, 0.3697632, 1.709651, 1, 0, 0.2039216, 1,
1.886879, -0.2480231, 1.419357, 1, 0, 0.1960784, 1,
1.969245, -0.01659573, 1.440816, 1, 0, 0.1921569, 1,
1.984802, -2.316622, 0.8303634, 1, 0, 0.1843137, 1,
1.984997, -0.6875005, 1.668484, 1, 0, 0.1803922, 1,
1.987512, 0.961852, -0.6165152, 1, 0, 0.172549, 1,
1.98829, 0.7200662, 0.447058, 1, 0, 0.1686275, 1,
2.030959, -0.3089183, 1.381362, 1, 0, 0.1607843, 1,
2.032604, 0.4900251, 1.468734, 1, 0, 0.1568628, 1,
2.059063, 0.4698498, 0.6011646, 1, 0, 0.1490196, 1,
2.06477, -0.4131907, 0.6355838, 1, 0, 0.145098, 1,
2.085044, -1.730989, 1.578902, 1, 0, 0.1372549, 1,
2.112321, 0.1347774, 2.418714, 1, 0, 0.1333333, 1,
2.118523, -0.1498895, 0.3315434, 1, 0, 0.1254902, 1,
2.13541, 0.6146857, 1.488266, 1, 0, 0.1215686, 1,
2.135526, -0.4977536, 2.282116, 1, 0, 0.1137255, 1,
2.241976, 1.903444, 0.8008608, 1, 0, 0.1098039, 1,
2.270162, -0.4228538, -0.3622168, 1, 0, 0.1019608, 1,
2.419594, -0.5168787, 0.1761709, 1, 0, 0.09411765, 1,
2.435709, 0.404171, 1.859486, 1, 0, 0.09019608, 1,
2.446206, -0.123691, 1.773284, 1, 0, 0.08235294, 1,
2.497744, 0.6483448, 0.777954, 1, 0, 0.07843138, 1,
2.513935, 1.898773, 0.5850421, 1, 0, 0.07058824, 1,
2.534105, 1.14901, 1.46983, 1, 0, 0.06666667, 1,
2.551331, 1.286891, -0.5803492, 1, 0, 0.05882353, 1,
2.59584, 1.092576, 3.211779, 1, 0, 0.05490196, 1,
2.601046, -2.456403, 3.57009, 1, 0, 0.04705882, 1,
2.620625, -1.500835, 1.242473, 1, 0, 0.04313726, 1,
2.66123, 0.1275119, 0.3714716, 1, 0, 0.03529412, 1,
2.666882, -0.9563213, 1.365118, 1, 0, 0.03137255, 1,
2.673153, -1.162023, 1.437231, 1, 0, 0.02352941, 1,
2.674548, -0.4410807, 2.152075, 1, 0, 0.01960784, 1,
2.92443, -1.285024, 1.505244, 1, 0, 0.01176471, 1,
2.988584, 0.3699932, -0.1665959, 1, 0, 0.007843138, 1
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
-0.2632687, -4.274655, -6.823991, 0, -0.5, 0.5, 0.5,
-0.2632687, -4.274655, -6.823991, 1, -0.5, 0.5, 0.5,
-0.2632687, -4.274655, -6.823991, 1, 1.5, 0.5, 0.5,
-0.2632687, -4.274655, -6.823991, 0, 1.5, 0.5, 0.5
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
-4.6175, 0.221692, -6.823991, 0, -0.5, 0.5, 0.5,
-4.6175, 0.221692, -6.823991, 1, -0.5, 0.5, 0.5,
-4.6175, 0.221692, -6.823991, 1, 1.5, 0.5, 0.5,
-4.6175, 0.221692, -6.823991, 0, 1.5, 0.5, 0.5
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
-4.6175, -4.274655, 0.2369394, 0, -0.5, 0.5, 0.5,
-4.6175, -4.274655, 0.2369394, 1, -0.5, 0.5, 0.5,
-4.6175, -4.274655, 0.2369394, 1, 1.5, 0.5, 0.5,
-4.6175, -4.274655, 0.2369394, 0, 1.5, 0.5, 0.5
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
-3, -3.237036, -5.194545,
2, -3.237036, -5.194545,
-3, -3.237036, -5.194545,
-3, -3.409973, -5.46612,
-2, -3.237036, -5.194545,
-2, -3.409973, -5.46612,
-1, -3.237036, -5.194545,
-1, -3.409973, -5.46612,
0, -3.237036, -5.194545,
0, -3.409973, -5.46612,
1, -3.237036, -5.194545,
1, -3.409973, -5.46612,
2, -3.237036, -5.194545,
2, -3.409973, -5.46612
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
-3, -3.755846, -6.009268, 0, -0.5, 0.5, 0.5,
-3, -3.755846, -6.009268, 1, -0.5, 0.5, 0.5,
-3, -3.755846, -6.009268, 1, 1.5, 0.5, 0.5,
-3, -3.755846, -6.009268, 0, 1.5, 0.5, 0.5,
-2, -3.755846, -6.009268, 0, -0.5, 0.5, 0.5,
-2, -3.755846, -6.009268, 1, -0.5, 0.5, 0.5,
-2, -3.755846, -6.009268, 1, 1.5, 0.5, 0.5,
-2, -3.755846, -6.009268, 0, 1.5, 0.5, 0.5,
-1, -3.755846, -6.009268, 0, -0.5, 0.5, 0.5,
-1, -3.755846, -6.009268, 1, -0.5, 0.5, 0.5,
-1, -3.755846, -6.009268, 1, 1.5, 0.5, 0.5,
-1, -3.755846, -6.009268, 0, 1.5, 0.5, 0.5,
0, -3.755846, -6.009268, 0, -0.5, 0.5, 0.5,
0, -3.755846, -6.009268, 1, -0.5, 0.5, 0.5,
0, -3.755846, -6.009268, 1, 1.5, 0.5, 0.5,
0, -3.755846, -6.009268, 0, 1.5, 0.5, 0.5,
1, -3.755846, -6.009268, 0, -0.5, 0.5, 0.5,
1, -3.755846, -6.009268, 1, -0.5, 0.5, 0.5,
1, -3.755846, -6.009268, 1, 1.5, 0.5, 0.5,
1, -3.755846, -6.009268, 0, 1.5, 0.5, 0.5,
2, -3.755846, -6.009268, 0, -0.5, 0.5, 0.5,
2, -3.755846, -6.009268, 1, -0.5, 0.5, 0.5,
2, -3.755846, -6.009268, 1, 1.5, 0.5, 0.5,
2, -3.755846, -6.009268, 0, 1.5, 0.5, 0.5
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
-3.612677, -3, -5.194545,
-3.612677, 3, -5.194545,
-3.612677, -3, -5.194545,
-3.780148, -3, -5.46612,
-3.612677, -2, -5.194545,
-3.780148, -2, -5.46612,
-3.612677, -1, -5.194545,
-3.780148, -1, -5.46612,
-3.612677, 0, -5.194545,
-3.780148, 0, -5.46612,
-3.612677, 1, -5.194545,
-3.780148, 1, -5.46612,
-3.612677, 2, -5.194545,
-3.780148, 2, -5.46612,
-3.612677, 3, -5.194545,
-3.780148, 3, -5.46612
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
-4.115088, -3, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, -3, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, -3, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, -3, -6.009268, 0, 1.5, 0.5, 0.5,
-4.115088, -2, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, -2, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, -2, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, -2, -6.009268, 0, 1.5, 0.5, 0.5,
-4.115088, -1, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, -1, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, -1, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, -1, -6.009268, 0, 1.5, 0.5, 0.5,
-4.115088, 0, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, 0, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, 0, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, 0, -6.009268, 0, 1.5, 0.5, 0.5,
-4.115088, 1, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, 1, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, 1, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, 1, -6.009268, 0, 1.5, 0.5, 0.5,
-4.115088, 2, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, 2, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, 2, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, 2, -6.009268, 0, 1.5, 0.5, 0.5,
-4.115088, 3, -6.009268, 0, -0.5, 0.5, 0.5,
-4.115088, 3, -6.009268, 1, -0.5, 0.5, 0.5,
-4.115088, 3, -6.009268, 1, 1.5, 0.5, 0.5,
-4.115088, 3, -6.009268, 0, 1.5, 0.5, 0.5
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
-3.612677, -3.237036, -4,
-3.612677, -3.237036, 4,
-3.612677, -3.237036, -4,
-3.780148, -3.409973, -4,
-3.612677, -3.237036, -2,
-3.780148, -3.409973, -2,
-3.612677, -3.237036, 0,
-3.780148, -3.409973, 0,
-3.612677, -3.237036, 2,
-3.780148, -3.409973, 2,
-3.612677, -3.237036, 4,
-3.780148, -3.409973, 4
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
-4.115088, -3.755846, -4, 0, -0.5, 0.5, 0.5,
-4.115088, -3.755846, -4, 1, -0.5, 0.5, 0.5,
-4.115088, -3.755846, -4, 1, 1.5, 0.5, 0.5,
-4.115088, -3.755846, -4, 0, 1.5, 0.5, 0.5,
-4.115088, -3.755846, -2, 0, -0.5, 0.5, 0.5,
-4.115088, -3.755846, -2, 1, -0.5, 0.5, 0.5,
-4.115088, -3.755846, -2, 1, 1.5, 0.5, 0.5,
-4.115088, -3.755846, -2, 0, 1.5, 0.5, 0.5,
-4.115088, -3.755846, 0, 0, -0.5, 0.5, 0.5,
-4.115088, -3.755846, 0, 1, -0.5, 0.5, 0.5,
-4.115088, -3.755846, 0, 1, 1.5, 0.5, 0.5,
-4.115088, -3.755846, 0, 0, 1.5, 0.5, 0.5,
-4.115088, -3.755846, 2, 0, -0.5, 0.5, 0.5,
-4.115088, -3.755846, 2, 1, -0.5, 0.5, 0.5,
-4.115088, -3.755846, 2, 1, 1.5, 0.5, 0.5,
-4.115088, -3.755846, 2, 0, 1.5, 0.5, 0.5,
-4.115088, -3.755846, 4, 0, -0.5, 0.5, 0.5,
-4.115088, -3.755846, 4, 1, -0.5, 0.5, 0.5,
-4.115088, -3.755846, 4, 1, 1.5, 0.5, 0.5,
-4.115088, -3.755846, 4, 0, 1.5, 0.5, 0.5
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
-3.612677, -3.237036, -5.194545,
-3.612677, 3.68042, -5.194545,
-3.612677, -3.237036, 5.668424,
-3.612677, 3.68042, 5.668424,
-3.612677, -3.237036, -5.194545,
-3.612677, -3.237036, 5.668424,
-3.612677, 3.68042, -5.194545,
-3.612677, 3.68042, 5.668424,
-3.612677, -3.237036, -5.194545,
3.08614, -3.237036, -5.194545,
-3.612677, -3.237036, 5.668424,
3.08614, -3.237036, 5.668424,
-3.612677, 3.68042, -5.194545,
3.08614, 3.68042, -5.194545,
-3.612677, 3.68042, 5.668424,
3.08614, 3.68042, 5.668424,
3.08614, -3.237036, -5.194545,
3.08614, 3.68042, -5.194545,
3.08614, -3.237036, 5.668424,
3.08614, 3.68042, 5.668424,
3.08614, -3.237036, -5.194545,
3.08614, -3.237036, 5.668424,
3.08614, 3.68042, -5.194545,
3.08614, 3.68042, 5.668424
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
var radius = 7.751542;
var distance = 34.48748;
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
mvMatrix.translate( 0.2632687, -0.221692, -0.2369394 );
mvMatrix.scale( 1.251134, 1.21159, 0.7715311 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48748);
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
ferimzone<-read.table("ferimzone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ferimzone$V2
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
```

```r
y<-ferimzone$V3
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
```

```r
z<-ferimzone$V4
```

```
## Error in eval(expr, envir, enclos): object 'ferimzone' not found
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
-3.515122, -0.9534122, -1.65259, 0, 0, 1, 1, 1,
-2.632853, 0.9973439, 0.4067599, 1, 0, 0, 1, 1,
-2.615923, -0.3851267, -0.6372162, 1, 0, 0, 1, 1,
-2.537564, -0.9761969, -2.784017, 1, 0, 0, 1, 1,
-2.510223, 0.2288723, -2.344085, 1, 0, 0, 1, 1,
-2.479529, 0.5542459, -1.316402, 1, 0, 0, 1, 1,
-2.383455, -1.314071, -2.121468, 0, 0, 0, 1, 1,
-2.362297, -0.7837481, -2.338376, 0, 0, 0, 1, 1,
-2.3574, -1.218867, -0.5942533, 0, 0, 0, 1, 1,
-2.343697, -1.684413, -4.342169, 0, 0, 0, 1, 1,
-2.327812, -0.7050187, -0.812863, 0, 0, 0, 1, 1,
-2.321671, -0.2523816, -1.365235, 0, 0, 0, 1, 1,
-2.319124, 1.076984, -2.187897, 0, 0, 0, 1, 1,
-2.303818, -0.3654836, -1.440285, 1, 1, 1, 1, 1,
-2.269782, -0.5244361, -0.0241971, 1, 1, 1, 1, 1,
-2.213067, -0.1127104, -2.488705, 1, 1, 1, 1, 1,
-2.179463, -1.058135, -1.570892, 1, 1, 1, 1, 1,
-2.174168, 0.4797089, -1.80201, 1, 1, 1, 1, 1,
-2.141748, -1.798123, -2.341834, 1, 1, 1, 1, 1,
-2.119993, -0.384793, -3.512502, 1, 1, 1, 1, 1,
-2.087918, 0.7302279, -0.386854, 1, 1, 1, 1, 1,
-2.06645, 0.7357168, -1.614314, 1, 1, 1, 1, 1,
-2.064462, 0.6209965, -0.8226279, 1, 1, 1, 1, 1,
-2.02868, -1.232566, -2.27009, 1, 1, 1, 1, 1,
-2.020908, -0.7126209, -1.61345, 1, 1, 1, 1, 1,
-2.018745, -1.157265, 0.3100157, 1, 1, 1, 1, 1,
-1.992338, 1.586101, -1.276442, 1, 1, 1, 1, 1,
-1.985496, -0.1890179, -0.7957569, 1, 1, 1, 1, 1,
-1.951643, -0.7088804, -3.410762, 0, 0, 1, 1, 1,
-1.949574, -0.3166268, -1.564968, 1, 0, 0, 1, 1,
-1.94292, 0.1346063, -0.7677137, 1, 0, 0, 1, 1,
-1.936455, -0.4733828, -2.405361, 1, 0, 0, 1, 1,
-1.936265, -0.3031226, -1.535529, 1, 0, 0, 1, 1,
-1.931714, 0.07096676, -0.1904299, 1, 0, 0, 1, 1,
-1.922877, 2.077593, -1.612728, 0, 0, 0, 1, 1,
-1.922227, 1.812641, -2.240469, 0, 0, 0, 1, 1,
-1.908494, -1.565765, -3.11584, 0, 0, 0, 1, 1,
-1.899113, -0.3358236, -2.377305, 0, 0, 0, 1, 1,
-1.894187, -0.3003189, -1.125203, 0, 0, 0, 1, 1,
-1.819996, -1.441435, -5.036347, 0, 0, 0, 1, 1,
-1.80861, -1.389846, -3.135253, 0, 0, 0, 1, 1,
-1.802641, 0.7412553, -2.629031, 1, 1, 1, 1, 1,
-1.779174, -0.6797606, -1.687509, 1, 1, 1, 1, 1,
-1.771361, 1.138574, -1.850518, 1, 1, 1, 1, 1,
-1.756061, 1.608386, -0.04615257, 1, 1, 1, 1, 1,
-1.736317, -0.3014562, -1.843148, 1, 1, 1, 1, 1,
-1.729702, -1.302877, -1.985372, 1, 1, 1, 1, 1,
-1.724815, -0.004736111, -0.7007713, 1, 1, 1, 1, 1,
-1.700527, -0.2057914, -1.757198, 1, 1, 1, 1, 1,
-1.689556, 0.8271679, 0.3106484, 1, 1, 1, 1, 1,
-1.688573, -0.4401614, -0.4631151, 1, 1, 1, 1, 1,
-1.680398, -0.1771077, -2.379979, 1, 1, 1, 1, 1,
-1.673588, 1.087572, 0.1697581, 1, 1, 1, 1, 1,
-1.630663, -0.7371905, -1.491596, 1, 1, 1, 1, 1,
-1.629976, 0.008965528, -1.381158, 1, 1, 1, 1, 1,
-1.615877, -0.521699, -1.426834, 1, 1, 1, 1, 1,
-1.586214, 0.8625777, 0.2494582, 0, 0, 1, 1, 1,
-1.581151, 0.5357286, -0.3843957, 1, 0, 0, 1, 1,
-1.561479, -1.445904, -2.463686, 1, 0, 0, 1, 1,
-1.545051, -0.4971126, -1.762441, 1, 0, 0, 1, 1,
-1.538697, 0.9190618, -2.471678, 1, 0, 0, 1, 1,
-1.535496, 1.099711, -1.083267, 1, 0, 0, 1, 1,
-1.532312, 1.648722, -2.269891, 0, 0, 0, 1, 1,
-1.529043, 0.4282365, -1.794305, 0, 0, 0, 1, 1,
-1.528385, -0.5021759, -2.11273, 0, 0, 0, 1, 1,
-1.524335, 0.6250025, -0.4212124, 0, 0, 0, 1, 1,
-1.518634, 1.116061, -1.464327, 0, 0, 0, 1, 1,
-1.518366, -2.397165, -0.9622539, 0, 0, 0, 1, 1,
-1.491764, 0.5872448, -0.5886641, 0, 0, 0, 1, 1,
-1.49098, -0.23874, -0.9028518, 1, 1, 1, 1, 1,
-1.483847, -1.58549, -1.889444, 1, 1, 1, 1, 1,
-1.473227, -0.2422139, -2.004805, 1, 1, 1, 1, 1,
-1.473174, -0.0878863, -1.657159, 1, 1, 1, 1, 1,
-1.459352, 0.3611325, -1.944217, 1, 1, 1, 1, 1,
-1.457966, -1.626464, 0.08275428, 1, 1, 1, 1, 1,
-1.451053, -0.7736879, -2.002134, 1, 1, 1, 1, 1,
-1.446708, -2.343208, -3.027112, 1, 1, 1, 1, 1,
-1.446562, 1.36988, -2.005643, 1, 1, 1, 1, 1,
-1.443147, 0.004635138, 0.3325633, 1, 1, 1, 1, 1,
-1.427729, -0.5518355, -0.8156681, 1, 1, 1, 1, 1,
-1.423528, -1.091897, -1.057274, 1, 1, 1, 1, 1,
-1.415598, 0.7117864, -0.3791505, 1, 1, 1, 1, 1,
-1.414785, 0.2741752, -2.171649, 1, 1, 1, 1, 1,
-1.40935, -1.138912, -3.023466, 1, 1, 1, 1, 1,
-1.407186, 0.156291, -0.8709559, 0, 0, 1, 1, 1,
-1.403725, -1.564129, -2.538667, 1, 0, 0, 1, 1,
-1.402562, -0.9908435, -0.1325386, 1, 0, 0, 1, 1,
-1.399683, 0.7600552, -1.546034, 1, 0, 0, 1, 1,
-1.396762, -1.340875, -2.759441, 1, 0, 0, 1, 1,
-1.39655, -0.8929868, -1.666749, 1, 0, 0, 1, 1,
-1.394693, -0.1552488, -2.09107, 0, 0, 0, 1, 1,
-1.394238, -0.8684934, -0.2205549, 0, 0, 0, 1, 1,
-1.392782, 0.8400325, -2.253436, 0, 0, 0, 1, 1,
-1.392458, -0.8331744, -2.791774, 0, 0, 0, 1, 1,
-1.381752, 1.279741, 0.6911535, 0, 0, 0, 1, 1,
-1.381517, 0.3598998, -1.365324, 0, 0, 0, 1, 1,
-1.349272, 0.9734986, -1.520658, 0, 0, 0, 1, 1,
-1.346275, -2.123023, -2.711512, 1, 1, 1, 1, 1,
-1.344044, 0.621578, -0.4785126, 1, 1, 1, 1, 1,
-1.332805, 1.383966, 2.231574, 1, 1, 1, 1, 1,
-1.332314, 0.5650386, -1.103324, 1, 1, 1, 1, 1,
-1.332136, 0.5780169, -2.370471, 1, 1, 1, 1, 1,
-1.331376, 1.476281, 0.6125808, 1, 1, 1, 1, 1,
-1.325436, -0.5408236, -2.348974, 1, 1, 1, 1, 1,
-1.318638, -1.835666, -2.659817, 1, 1, 1, 1, 1,
-1.307505, -0.3071919, -2.001572, 1, 1, 1, 1, 1,
-1.300514, 0.9565099, -1.810724, 1, 1, 1, 1, 1,
-1.296109, 0.3046859, -1.146828, 1, 1, 1, 1, 1,
-1.285516, -2.136441, -2.004863, 1, 1, 1, 1, 1,
-1.284512, -1.772943, -1.057994, 1, 1, 1, 1, 1,
-1.278973, 0.4614329, -0.3891296, 1, 1, 1, 1, 1,
-1.277076, -0.370371, -1.915886, 1, 1, 1, 1, 1,
-1.27582, -1.201895, -3.997474, 0, 0, 1, 1, 1,
-1.267315, -0.9766153, -2.601569, 1, 0, 0, 1, 1,
-1.260211, 1.07949, -0.07313898, 1, 0, 0, 1, 1,
-1.25547, 1.135489, 1.146461, 1, 0, 0, 1, 1,
-1.241902, 1.393889, -0.2488474, 1, 0, 0, 1, 1,
-1.228235, -2.539134, -1.994916, 1, 0, 0, 1, 1,
-1.224928, 1.419971, 0.8435489, 0, 0, 0, 1, 1,
-1.219938, -0.6625964, -1.968462, 0, 0, 0, 1, 1,
-1.207266, -0.7355047, -2.231532, 0, 0, 0, 1, 1,
-1.197594, 1.067946, -1.180962, 0, 0, 0, 1, 1,
-1.190968, 0.4806477, -3.011875, 0, 0, 0, 1, 1,
-1.190791, -0.4388529, -2.479646, 0, 0, 0, 1, 1,
-1.182864, -1.372379, -2.461832, 0, 0, 0, 1, 1,
-1.176367, -0.4017601, -1.03339, 1, 1, 1, 1, 1,
-1.174629, 1.040285, 0.1279005, 1, 1, 1, 1, 1,
-1.15978, 0.2955038, -0.4976135, 1, 1, 1, 1, 1,
-1.148217, -1.107794, -3.106784, 1, 1, 1, 1, 1,
-1.137052, 0.8913003, 0.4069604, 1, 1, 1, 1, 1,
-1.132132, -0.650329, -2.788989, 1, 1, 1, 1, 1,
-1.125327, -0.1164623, -2.210236, 1, 1, 1, 1, 1,
-1.124848, 0.1719249, -1.043568, 1, 1, 1, 1, 1,
-1.120498, 0.4966268, -1.27779, 1, 1, 1, 1, 1,
-1.119194, 0.9763129, -1.516381, 1, 1, 1, 1, 1,
-1.118974, 0.4891005, -0.9126994, 1, 1, 1, 1, 1,
-1.105292, -2.790713, -1.807729, 1, 1, 1, 1, 1,
-1.09832, -0.9543768, -3.086487, 1, 1, 1, 1, 1,
-1.092111, -0.2000305, -0.7816381, 1, 1, 1, 1, 1,
-1.091877, 0.8150014, -0.6895726, 1, 1, 1, 1, 1,
-1.082791, -0.3478192, 0.6082141, 0, 0, 1, 1, 1,
-1.077349, 0.4709804, -2.11615, 1, 0, 0, 1, 1,
-1.066377, 1.272085, -1.973236, 1, 0, 0, 1, 1,
-1.061589, 0.5305846, -0.7554775, 1, 0, 0, 1, 1,
-1.05974, 0.5323148, -0.4853578, 1, 0, 0, 1, 1,
-1.048678, -0.0976221, -2.625108, 1, 0, 0, 1, 1,
-1.047053, 0.1124225, -1.269389, 0, 0, 0, 1, 1,
-1.04222, 0.6960256, -2.909847, 0, 0, 0, 1, 1,
-1.038349, -1.418875, -3.492455, 0, 0, 0, 1, 1,
-1.037882, 2.514096, -0.7682154, 0, 0, 0, 1, 1,
-1.027458, -0.9904793, -3.726881, 0, 0, 0, 1, 1,
-1.017766, 0.6411011, -0.3172255, 0, 0, 0, 1, 1,
-1.010207, -0.094384, -0.3674925, 0, 0, 0, 1, 1,
-1.006216, -2.075947, -3.18556, 1, 1, 1, 1, 1,
-1.00375, 0.8903866, -2.582358, 1, 1, 1, 1, 1,
-1.003066, -0.1801466, -2.820046, 1, 1, 1, 1, 1,
-1.001175, 0.3873063, -0.8023844, 1, 1, 1, 1, 1,
-0.9982224, -0.3946334, -1.51636, 1, 1, 1, 1, 1,
-0.9972129, 0.3523326, -2.759481, 1, 1, 1, 1, 1,
-0.9965982, -0.3960548, -0.2279477, 1, 1, 1, 1, 1,
-0.9911503, -1.470656, -1.08409, 1, 1, 1, 1, 1,
-0.9795972, -0.5434837, -1.803656, 1, 1, 1, 1, 1,
-0.9744078, 0.04290455, -1.457663, 1, 1, 1, 1, 1,
-0.9742134, -1.028072, -1.140405, 1, 1, 1, 1, 1,
-0.9663481, -1.189963, -2.030002, 1, 1, 1, 1, 1,
-0.9656369, 1.53772, -2.319709, 1, 1, 1, 1, 1,
-0.9622175, -0.7246289, -3.03247, 1, 1, 1, 1, 1,
-0.9551656, 0.5325727, -0.5013949, 1, 1, 1, 1, 1,
-0.9534125, 0.4002423, -1.872919, 0, 0, 1, 1, 1,
-0.9531677, 0.5578247, -0.6391599, 1, 0, 0, 1, 1,
-0.9416039, -1.551302, -2.733352, 1, 0, 0, 1, 1,
-0.9413185, -0.4337081, -1.406137, 1, 0, 0, 1, 1,
-0.9361864, 0.6176636, -1.471727, 1, 0, 0, 1, 1,
-0.9307662, 0.003474101, -3.157237, 1, 0, 0, 1, 1,
-0.9213627, -0.1897477, -1.568448, 0, 0, 0, 1, 1,
-0.9201622, 1.028805, -0.009060714, 0, 0, 0, 1, 1,
-0.9125127, 2.124385, -1.326809, 0, 0, 0, 1, 1,
-0.9082345, -0.2294175, -3.04189, 0, 0, 0, 1, 1,
-0.9014051, 0.721559, -1.3533, 0, 0, 0, 1, 1,
-0.9010061, -0.7252831, -3.212092, 0, 0, 0, 1, 1,
-0.8997619, -0.1280337, -0.680573, 0, 0, 0, 1, 1,
-0.8898222, -1.857127, -1.811114, 1, 1, 1, 1, 1,
-0.8855968, -0.004854283, -2.217864, 1, 1, 1, 1, 1,
-0.8843787, -1.143833, -2.311934, 1, 1, 1, 1, 1,
-0.8831757, -2.057649, -1.182613, 1, 1, 1, 1, 1,
-0.8819081, 2.645653, -0.518707, 1, 1, 1, 1, 1,
-0.8771606, -0.5386277, -1.620486, 1, 1, 1, 1, 1,
-0.8700716, -0.4241501, -1.692201, 1, 1, 1, 1, 1,
-0.8689201, 0.3547771, -0.8164482, 1, 1, 1, 1, 1,
-0.858133, 0.6448636, -0.9743702, 1, 1, 1, 1, 1,
-0.8508973, -0.3179168, -2.172858, 1, 1, 1, 1, 1,
-0.8481316, 0.9818283, -0.1639818, 1, 1, 1, 1, 1,
-0.8457889, -0.9115366, -3.442677, 1, 1, 1, 1, 1,
-0.8446666, -0.1116714, -0.9699605, 1, 1, 1, 1, 1,
-0.8428574, 0.3672671, -1.06315, 1, 1, 1, 1, 1,
-0.8334603, 1.257241, 0.3092166, 1, 1, 1, 1, 1,
-0.821536, -0.4785089, -2.918378, 0, 0, 1, 1, 1,
-0.8209603, 2.323433, -0.5650581, 1, 0, 0, 1, 1,
-0.8205993, -1.866209, -3.485264, 1, 0, 0, 1, 1,
-0.8111921, 0.492159, 0.184411, 1, 0, 0, 1, 1,
-0.8019506, 0.468915, -1.588028, 1, 0, 0, 1, 1,
-0.7987455, -0.02743556, -1.969201, 1, 0, 0, 1, 1,
-0.7975481, -0.006394975, -2.08842, 0, 0, 0, 1, 1,
-0.7926059, 1.073564, -2.306665, 0, 0, 0, 1, 1,
-0.7888015, -1.643597, -2.592645, 0, 0, 0, 1, 1,
-0.7885334, 1.139418, -0.8520174, 0, 0, 0, 1, 1,
-0.7858958, 1.073246, -2.13409, 0, 0, 0, 1, 1,
-0.7835991, -0.5008727, -2.103448, 0, 0, 0, 1, 1,
-0.7828557, -0.163911, -3.009196, 0, 0, 0, 1, 1,
-0.7773214, -0.2725842, -1.548469, 1, 1, 1, 1, 1,
-0.7687142, 1.097408, -0.5495173, 1, 1, 1, 1, 1,
-0.7672046, -0.2807639, -1.219128, 1, 1, 1, 1, 1,
-0.7652628, -0.1415584, -1.610217, 1, 1, 1, 1, 1,
-0.7644138, 1.132133, -2.160346, 1, 1, 1, 1, 1,
-0.7601424, 0.5719163, -1.018619, 1, 1, 1, 1, 1,
-0.7580399, -0.61156, -1.863203, 1, 1, 1, 1, 1,
-0.7469444, 1.33663, -1.950839, 1, 1, 1, 1, 1,
-0.746102, 0.5289533, -3.059068, 1, 1, 1, 1, 1,
-0.7457461, 0.5412731, -2.503035, 1, 1, 1, 1, 1,
-0.7456837, -1.657793, -3.958329, 1, 1, 1, 1, 1,
-0.7390532, 1.043049, -1.819939, 1, 1, 1, 1, 1,
-0.7384836, -1.017072, -2.982703, 1, 1, 1, 1, 1,
-0.7382093, 0.7438959, -0.3000646, 1, 1, 1, 1, 1,
-0.7317751, 1.25751, -0.7095081, 1, 1, 1, 1, 1,
-0.7238873, 0.0307035, 0.4394268, 0, 0, 1, 1, 1,
-0.723703, -1.131214, -2.443856, 1, 0, 0, 1, 1,
-0.7232267, 0.4504894, -0.7963333, 1, 0, 0, 1, 1,
-0.7218992, -0.2781048, -2.324723, 1, 0, 0, 1, 1,
-0.7203583, 0.01485611, -1.278628, 1, 0, 0, 1, 1,
-0.7186483, 2.019643, -1.610537, 1, 0, 0, 1, 1,
-0.7170595, -1.21648, -2.074015, 0, 0, 0, 1, 1,
-0.7170138, -1.207467, -2.812711, 0, 0, 0, 1, 1,
-0.711988, -0.03130366, 0.1021513, 0, 0, 0, 1, 1,
-0.7100981, 0.5661051, -0.2978273, 0, 0, 0, 1, 1,
-0.7039872, -0.04703062, -3.166258, 0, 0, 0, 1, 1,
-0.7002717, 0.007520701, -2.018883, 0, 0, 0, 1, 1,
-0.6998302, 0.0288089, -1.759662, 0, 0, 0, 1, 1,
-0.696043, 0.2895449, -0.7046976, 1, 1, 1, 1, 1,
-0.6945103, -0.5140601, -1.024898, 1, 1, 1, 1, 1,
-0.6942833, 0.0757734, -1.778126, 1, 1, 1, 1, 1,
-0.6902703, -0.5318524, -1.848608, 1, 1, 1, 1, 1,
-0.6878772, 0.2207632, -0.1310638, 1, 1, 1, 1, 1,
-0.6866047, -0.5299782, -3.389033, 1, 1, 1, 1, 1,
-0.6859186, 0.6940643, -0.193805, 1, 1, 1, 1, 1,
-0.6793528, 1.284631, -1.981852, 1, 1, 1, 1, 1,
-0.6783605, 0.5115514, -0.720003, 1, 1, 1, 1, 1,
-0.6778346, -0.1196479, -2.058114, 1, 1, 1, 1, 1,
-0.6761881, 0.3856491, -1.078066, 1, 1, 1, 1, 1,
-0.6664639, 1.374745, -0.1938051, 1, 1, 1, 1, 1,
-0.6642807, 3.579681, 0.1958769, 1, 1, 1, 1, 1,
-0.6638342, 2.2039, -0.6142708, 1, 1, 1, 1, 1,
-0.661511, -0.1174805, -0.003647816, 1, 1, 1, 1, 1,
-0.6609687, 0.5502733, -1.314247, 0, 0, 1, 1, 1,
-0.6606238, -0.4589279, -1.971301, 1, 0, 0, 1, 1,
-0.6560823, -0.3329156, -3.068389, 1, 0, 0, 1, 1,
-0.644618, -0.3429689, -2.550384, 1, 0, 0, 1, 1,
-0.6442875, -0.619167, -2.530009, 1, 0, 0, 1, 1,
-0.6404645, -0.2559621, -2.289538, 1, 0, 0, 1, 1,
-0.6382802, -0.4325252, -2.133034, 0, 0, 0, 1, 1,
-0.6274098, 0.8929139, 0.03172981, 0, 0, 0, 1, 1,
-0.6253555, 0.1369625, -1.202521, 0, 0, 0, 1, 1,
-0.6193995, -0.1742098, -0.6896073, 0, 0, 0, 1, 1,
-0.6153871, -0.3703474, -2.391149, 0, 0, 0, 1, 1,
-0.6135497, 0.3007236, -1.002326, 0, 0, 0, 1, 1,
-0.6131001, 0.2927451, -2.160407, 0, 0, 0, 1, 1,
-0.611725, 0.203762, -0.8869641, 1, 1, 1, 1, 1,
-0.6116406, 1.720558, -0.5422338, 1, 1, 1, 1, 1,
-0.6044172, 1.291175, 0.03920167, 1, 1, 1, 1, 1,
-0.5997436, 1.917802, -0.9375083, 1, 1, 1, 1, 1,
-0.5941247, 2.580659, 0.7990613, 1, 1, 1, 1, 1,
-0.5900643, -0.2212077, -0.09137803, 1, 1, 1, 1, 1,
-0.5890787, -0.9719233, -2.40812, 1, 1, 1, 1, 1,
-0.5870602, -0.2924615, -1.616161, 1, 1, 1, 1, 1,
-0.5851444, -1.294397, -1.103886, 1, 1, 1, 1, 1,
-0.5832091, -0.5866535, -1.996869, 1, 1, 1, 1, 1,
-0.5774647, 0.6457373, -0.1649061, 1, 1, 1, 1, 1,
-0.5761145, -1.096843, -1.00751, 1, 1, 1, 1, 1,
-0.5752338, 0.8933336, 0.2183956, 1, 1, 1, 1, 1,
-0.5680344, 0.5659299, -1.5421, 1, 1, 1, 1, 1,
-0.5676816, 0.6809977, -0.2306241, 1, 1, 1, 1, 1,
-0.563067, -1.116651, -4.516514, 0, 0, 1, 1, 1,
-0.5610279, -0.3849904, -2.162424, 1, 0, 0, 1, 1,
-0.5570956, -0.9032378, -1.881417, 1, 0, 0, 1, 1,
-0.5543399, -0.8001252, -2.651597, 1, 0, 0, 1, 1,
-0.5539978, -1.207308, -2.397106, 1, 0, 0, 1, 1,
-0.5518374, -0.1297109, -2.056003, 1, 0, 0, 1, 1,
-0.5460088, -0.2830116, -2.141645, 0, 0, 0, 1, 1,
-0.5408599, -0.5458669, -3.168193, 0, 0, 0, 1, 1,
-0.5377369, 0.8759981, -1.00587, 0, 0, 0, 1, 1,
-0.5348027, -1.343895, -3.490197, 0, 0, 0, 1, 1,
-0.5325676, 0.8773626, -0.7224422, 0, 0, 0, 1, 1,
-0.5274858, -0.02252508, -1.692386, 0, 0, 0, 1, 1,
-0.5270728, -0.2959773, -1.625405, 0, 0, 0, 1, 1,
-0.5247309, -0.2723506, -2.547815, 1, 1, 1, 1, 1,
-0.5244185, 0.3681288, -1.244546, 1, 1, 1, 1, 1,
-0.5240352, 1.146877, 0.4179823, 1, 1, 1, 1, 1,
-0.5220473, 1.715509, -0.7409456, 1, 1, 1, 1, 1,
-0.5214978, 0.6564847, -1.297409, 1, 1, 1, 1, 1,
-0.5134017, 0.07223275, -1.328536, 1, 1, 1, 1, 1,
-0.4968104, 0.4334177, -0.5415959, 1, 1, 1, 1, 1,
-0.4956155, -1.841875, -1.739524, 1, 1, 1, 1, 1,
-0.4856604, -0.5008616, -2.600122, 1, 1, 1, 1, 1,
-0.4847461, -2.713491, -3.745123, 1, 1, 1, 1, 1,
-0.4837097, -0.7931473, -2.997474, 1, 1, 1, 1, 1,
-0.4835046, 0.9445198, -2.377009, 1, 1, 1, 1, 1,
-0.4823581, 0.05590923, -0.3278871, 1, 1, 1, 1, 1,
-0.4816857, -0.5232852, -3.214738, 1, 1, 1, 1, 1,
-0.4809271, 0.3980507, -2.011144, 1, 1, 1, 1, 1,
-0.4724429, -1.143805, -1.916818, 0, 0, 1, 1, 1,
-0.4723894, 0.3076396, -0.4335433, 1, 0, 0, 1, 1,
-0.4658715, -1.794455, -3.316887, 1, 0, 0, 1, 1,
-0.4655598, -0.4758565, -2.564488, 1, 0, 0, 1, 1,
-0.4653993, -0.7978929, -2.273109, 1, 0, 0, 1, 1,
-0.4628756, -1.554997, -3.099803, 1, 0, 0, 1, 1,
-0.4605881, 1.35673, -0.01271092, 0, 0, 0, 1, 1,
-0.4595454, -0.4558187, -1.740047, 0, 0, 0, 1, 1,
-0.4576633, -0.3476355, -1.419604, 0, 0, 0, 1, 1,
-0.4527591, 0.9023567, -1.502792, 0, 0, 0, 1, 1,
-0.4518049, -0.7535754, -3.664693, 0, 0, 0, 1, 1,
-0.4509435, -0.2702112, -0.5171061, 0, 0, 0, 1, 1,
-0.4506142, -0.5128917, -3.223141, 0, 0, 0, 1, 1,
-0.4447964, 0.3398278, -1.637031, 1, 1, 1, 1, 1,
-0.4408737, 1.742614, -1.318221, 1, 1, 1, 1, 1,
-0.4388359, -1.041415, -1.890775, 1, 1, 1, 1, 1,
-0.4369735, -0.7334076, -2.405919, 1, 1, 1, 1, 1,
-0.4270191, 1.807603, 0.2871949, 1, 1, 1, 1, 1,
-0.4215522, -0.4083438, -2.456717, 1, 1, 1, 1, 1,
-0.4202381, 0.8148279, 1.79361, 1, 1, 1, 1, 1,
-0.4174213, -0.7631504, -2.023606, 1, 1, 1, 1, 1,
-0.4173802, 0.5923132, 0.0729102, 1, 1, 1, 1, 1,
-0.4166584, 0.977699, 1.776114, 1, 1, 1, 1, 1,
-0.4089713, -1.026542, -2.809757, 1, 1, 1, 1, 1,
-0.4081145, 0.8625706, -2.077883, 1, 1, 1, 1, 1,
-0.4024571, -3.136297, -3.084731, 1, 1, 1, 1, 1,
-0.4010424, -0.4402003, -2.569103, 1, 1, 1, 1, 1,
-0.3974613, 1.854632, -1.585813, 1, 1, 1, 1, 1,
-0.3959852, 2.230615, -1.110042, 0, 0, 1, 1, 1,
-0.3959163, -1.040604, -4.110062, 1, 0, 0, 1, 1,
-0.3912008, -1.056568, -2.747065, 1, 0, 0, 1, 1,
-0.3909477, -0.4394094, -2.600178, 1, 0, 0, 1, 1,
-0.3852222, -0.4532204, -2.253881, 1, 0, 0, 1, 1,
-0.3841164, -0.5230941, -1.793395, 1, 0, 0, 1, 1,
-0.3835235, -0.2437758, -3.756141, 0, 0, 0, 1, 1,
-0.3828051, 0.03116804, -0.5194381, 0, 0, 0, 1, 1,
-0.3825384, 0.645977, -0.5387283, 0, 0, 0, 1, 1,
-0.3798362, -0.5135081, -2.163544, 0, 0, 0, 1, 1,
-0.3760942, -0.4256045, -2.680814, 0, 0, 0, 1, 1,
-0.3736632, -2.036187, -2.796133, 0, 0, 0, 1, 1,
-0.3698581, 0.1651196, -0.2684159, 0, 0, 0, 1, 1,
-0.3679095, 1.364166, -0.1114022, 1, 1, 1, 1, 1,
-0.3576658, -1.084245, -3.770303, 1, 1, 1, 1, 1,
-0.3528214, 0.0755831, 1.155113, 1, 1, 1, 1, 1,
-0.3484727, 0.9184722, 0.4344773, 1, 1, 1, 1, 1,
-0.3424732, -0.8602097, -2.973795, 1, 1, 1, 1, 1,
-0.3415618, -1.382016, -3.176606, 1, 1, 1, 1, 1,
-0.341522, -1.105277, -1.874577, 1, 1, 1, 1, 1,
-0.3392083, 1.728614, -0.8766829, 1, 1, 1, 1, 1,
-0.3374656, -0.6973613, -3.428399, 1, 1, 1, 1, 1,
-0.3354255, 1.133, -1.020236, 1, 1, 1, 1, 1,
-0.3299378, 1.664279, 0.1644502, 1, 1, 1, 1, 1,
-0.3266507, -0.2983326, -2.348893, 1, 1, 1, 1, 1,
-0.3247576, 0.4024361, -2.038215, 1, 1, 1, 1, 1,
-0.3204351, -0.3242319, -2.464913, 1, 1, 1, 1, 1,
-0.318645, 1.159837, -0.4804226, 1, 1, 1, 1, 1,
-0.3102687, -0.4785872, -3.499884, 0, 0, 1, 1, 1,
-0.3082436, -0.003164175, -1.425202, 1, 0, 0, 1, 1,
-0.3066655, 0.5429425, -0.9153562, 1, 0, 0, 1, 1,
-0.3031934, 0.4878882, 1.332377, 1, 0, 0, 1, 1,
-0.3021896, -0.7670699, -3.258703, 1, 0, 0, 1, 1,
-0.2992861, 1.192618, -1.341593, 1, 0, 0, 1, 1,
-0.2982848, 2.09984, 0.3483101, 0, 0, 0, 1, 1,
-0.2975395, 0.1879211, -2.5548, 0, 0, 0, 1, 1,
-0.2947832, 1.230848, 1.270253, 0, 0, 0, 1, 1,
-0.2936714, -1.717104, -2.6916, 0, 0, 0, 1, 1,
-0.2856381, -1.434297, -1.744677, 0, 0, 0, 1, 1,
-0.2824786, -0.4620855, -2.929321, 0, 0, 0, 1, 1,
-0.2819141, 0.1548936, 0.4690655, 0, 0, 0, 1, 1,
-0.2818448, -0.06281496, -1.109419, 1, 1, 1, 1, 1,
-0.2817489, -0.5775456, -3.676267, 1, 1, 1, 1, 1,
-0.2813022, -2.486037, -2.782349, 1, 1, 1, 1, 1,
-0.2768685, 1.057429, 1.041012, 1, 1, 1, 1, 1,
-0.2722899, -0.1520842, -1.631045, 1, 1, 1, 1, 1,
-0.2702301, -0.7735915, -2.12793, 1, 1, 1, 1, 1,
-0.269796, 0.04626664, -0.974103, 1, 1, 1, 1, 1,
-0.2691167, -0.2174712, -1.428776, 1, 1, 1, 1, 1,
-0.26905, -1.009484, -2.402984, 1, 1, 1, 1, 1,
-0.2638875, 0.004352679, -0.7949107, 1, 1, 1, 1, 1,
-0.2524044, -0.1992682, -3.625722, 1, 1, 1, 1, 1,
-0.2503735, -0.5623444, -2.029101, 1, 1, 1, 1, 1,
-0.2490112, 1.437262, 1.229249, 1, 1, 1, 1, 1,
-0.248876, 0.292397, -1.039759, 1, 1, 1, 1, 1,
-0.24859, -1.103343, -3.405385, 1, 1, 1, 1, 1,
-0.2462956, 0.4637032, 0.7569474, 0, 0, 1, 1, 1,
-0.2424889, 1.672307, -0.8378164, 1, 0, 0, 1, 1,
-0.2398173, -0.1144601, -0.7119021, 1, 0, 0, 1, 1,
-0.236849, 0.4113787, -1.067111, 1, 0, 0, 1, 1,
-0.2357313, -2.079198, -2.892458, 1, 0, 0, 1, 1,
-0.2355517, -0.2740042, -2.329792, 1, 0, 0, 1, 1,
-0.2341083, -0.4897597, -2.305643, 0, 0, 0, 1, 1,
-0.2335674, 0.48582, -0.8356054, 0, 0, 0, 1, 1,
-0.2310113, -0.612144, -2.61652, 0, 0, 0, 1, 1,
-0.2272968, -0.4664299, -2.994997, 0, 0, 0, 1, 1,
-0.2265579, 0.4922954, 0.3664972, 0, 0, 0, 1, 1,
-0.2261934, 1.368629, 0.3555881, 0, 0, 0, 1, 1,
-0.2260386, 2.307135, -0.6155053, 0, 0, 0, 1, 1,
-0.2236376, 1.465812, -0.8712909, 1, 1, 1, 1, 1,
-0.2188554, -1.456932, -2.837343, 1, 1, 1, 1, 1,
-0.2162738, 0.1647118, 0.2426438, 1, 1, 1, 1, 1,
-0.2160426, 0.7852729, -0.5076441, 1, 1, 1, 1, 1,
-0.2093764, -1.187286, -2.789128, 1, 1, 1, 1, 1,
-0.2080889, 0.5811222, -0.1493895, 1, 1, 1, 1, 1,
-0.2068899, -0.1376315, -3.435099, 1, 1, 1, 1, 1,
-0.2052677, 1.576007, 1.075547, 1, 1, 1, 1, 1,
-0.205038, -0.1796068, -2.859391, 1, 1, 1, 1, 1,
-0.2044353, 0.829287, -0.3670053, 1, 1, 1, 1, 1,
-0.203821, 0.4872593, 1.97934, 1, 1, 1, 1, 1,
-0.2031531, 0.9207515, 2.680685, 1, 1, 1, 1, 1,
-0.1998439, 1.345141, -1.119958, 1, 1, 1, 1, 1,
-0.1990685, 0.1078972, -0.2163012, 1, 1, 1, 1, 1,
-0.1974087, 1.553343, -0.1928808, 1, 1, 1, 1, 1,
-0.1953662, -0.7241019, -2.208464, 0, 0, 1, 1, 1,
-0.1933353, 1.801297, 0.4237891, 1, 0, 0, 1, 1,
-0.1919588, -0.337862, -3.025753, 1, 0, 0, 1, 1,
-0.1914029, 2.264784, 0.1784412, 1, 0, 0, 1, 1,
-0.1907201, 0.008403464, -2.702601, 1, 0, 0, 1, 1,
-0.1869969, -0.1945758, -1.815971, 1, 0, 0, 1, 1,
-0.1835969, -1.607258, -1.191088, 0, 0, 0, 1, 1,
-0.1828692, 2.522671, -1.696511, 0, 0, 0, 1, 1,
-0.1732558, -0.2248389, -3.522203, 0, 0, 0, 1, 1,
-0.1695064, -2.313255, -4.059114, 0, 0, 0, 1, 1,
-0.168273, -0.8070251, -4.826356, 0, 0, 0, 1, 1,
-0.1669273, 0.03969802, -2.890099, 0, 0, 0, 1, 1,
-0.1647575, -0.751251, -2.720625, 0, 0, 0, 1, 1,
-0.1647293, 1.243371, -0.3995291, 1, 1, 1, 1, 1,
-0.1586439, 0.3578163, 0.2707184, 1, 1, 1, 1, 1,
-0.1584515, -1.012448, -2.598052, 1, 1, 1, 1, 1,
-0.1576971, 0.7870356, 0.8050465, 1, 1, 1, 1, 1,
-0.1574621, 0.09148759, -1.652449, 1, 1, 1, 1, 1,
-0.1565066, 1.612364, 0.526616, 1, 1, 1, 1, 1,
-0.1548318, 2.763408, 0.01414513, 1, 1, 1, 1, 1,
-0.1526964, 1.383933, -1.89146, 1, 1, 1, 1, 1,
-0.1450517, -1.368594, -4.194607, 1, 1, 1, 1, 1,
-0.1445234, 0.8680583, -0.3222409, 1, 1, 1, 1, 1,
-0.144224, -0.9991914, -1.460467, 1, 1, 1, 1, 1,
-0.1429897, 0.2427499, 0.08890145, 1, 1, 1, 1, 1,
-0.1367794, 1.231889, 0.7917319, 1, 1, 1, 1, 1,
-0.1358382, 0.5351902, -0.6224439, 1, 1, 1, 1, 1,
-0.1318521, -3.022241, -3.944136, 1, 1, 1, 1, 1,
-0.1263231, -0.7693369, -1.895218, 0, 0, 1, 1, 1,
-0.1257577, -0.1893412, -2.463771, 1, 0, 0, 1, 1,
-0.12528, -0.06153972, -1.278137, 1, 0, 0, 1, 1,
-0.1242578, 1.172105, -0.57581, 1, 0, 0, 1, 1,
-0.1168738, -0.8016206, -2.787571, 1, 0, 0, 1, 1,
-0.11656, -1.162168, -2.370671, 1, 0, 0, 1, 1,
-0.1131701, -1.329122, -4.54268, 0, 0, 0, 1, 1,
-0.113139, 0.8631963, -0.1651905, 0, 0, 0, 1, 1,
-0.1118826, 1.01971, 0.1266333, 0, 0, 0, 1, 1,
-0.1037216, -0.9437895, -2.340633, 0, 0, 0, 1, 1,
-0.1011422, 0.6535066, 0.3404235, 0, 0, 0, 1, 1,
-0.1009076, -1.811422, -2.305114, 0, 0, 0, 1, 1,
-0.1004731, 1.866179, 0.898378, 0, 0, 0, 1, 1,
-0.09991437, 0.06351554, -0.7487158, 1, 1, 1, 1, 1,
-0.09913096, 1.720445, -1.373968, 1, 1, 1, 1, 1,
-0.09672274, -1.245268, -1.230722, 1, 1, 1, 1, 1,
-0.09534928, 0.4208582, 0.1392647, 1, 1, 1, 1, 1,
-0.09241055, -0.9637215, -2.604117, 1, 1, 1, 1, 1,
-0.08561914, -0.375411, -2.235396, 1, 1, 1, 1, 1,
-0.0851035, -0.2060922, -3.772451, 1, 1, 1, 1, 1,
-0.08460204, -0.4140241, -2.815723, 1, 1, 1, 1, 1,
-0.08381193, 0.868166, -1.304941, 1, 1, 1, 1, 1,
-0.07708784, -0.420036, -2.116412, 1, 1, 1, 1, 1,
-0.07677328, 0.2162004, -0.6269653, 1, 1, 1, 1, 1,
-0.07649503, -0.3245431, -1.7199, 1, 1, 1, 1, 1,
-0.07327735, -0.7164338, -3.522494, 1, 1, 1, 1, 1,
-0.06959476, 0.7403656, -0.1926174, 1, 1, 1, 1, 1,
-0.06686798, 0.1668101, -2.728654, 1, 1, 1, 1, 1,
-0.06286669, 0.3834509, 1.034073, 0, 0, 1, 1, 1,
-0.05890971, 0.2287434, -0.7258554, 1, 0, 0, 1, 1,
-0.05363042, -0.6411101, -1.064677, 1, 0, 0, 1, 1,
-0.05124635, -0.5135207, -5.023836, 1, 0, 0, 1, 1,
-0.04716522, -0.4534948, -3.354535, 1, 0, 0, 1, 1,
-0.04038605, 0.4652167, -0.02178328, 1, 0, 0, 1, 1,
-0.03648466, -0.5733879, -3.342288, 0, 0, 0, 1, 1,
-0.03574281, 1.024125, 0.555472, 0, 0, 0, 1, 1,
-0.03237622, -2.488906, -3.560639, 0, 0, 0, 1, 1,
-0.03046803, 0.5513738, 0.1635094, 0, 0, 0, 1, 1,
-0.02788542, -0.4528158, -3.65835, 0, 0, 0, 1, 1,
-0.0257881, -2.229825, -4.288412, 0, 0, 0, 1, 1,
-0.02072139, 0.4443081, -1.479789, 0, 0, 0, 1, 1,
-0.02018506, 0.354464, -0.285522, 1, 1, 1, 1, 1,
-0.01947889, -1.978825, -3.810103, 1, 1, 1, 1, 1,
-0.01893427, -0.6147044, -3.048203, 1, 1, 1, 1, 1,
-0.01878951, 0.7146518, -0.03227194, 1, 1, 1, 1, 1,
-0.01872567, -1.311191, -3.125078, 1, 1, 1, 1, 1,
-0.01857312, 0.3353697, -0.8942754, 1, 1, 1, 1, 1,
-0.01351968, -0.08300386, -4.126185, 1, 1, 1, 1, 1,
-0.0009037149, 0.2962984, -1.102486, 1, 1, 1, 1, 1,
-0.0005776087, 0.1889635, 0.0375221, 1, 1, 1, 1, 1,
-0.0002999142, 0.8265533, 0.7147254, 1, 1, 1, 1, 1,
0.003704433, 0.225824, 1.999916, 1, 1, 1, 1, 1,
0.006624343, 0.7722351, 0.3146426, 1, 1, 1, 1, 1,
0.00943331, -1.062133, 4.838088, 1, 1, 1, 1, 1,
0.01110425, 0.5224773, 1.320288, 1, 1, 1, 1, 1,
0.01115547, 0.5846659, 0.6381781, 1, 1, 1, 1, 1,
0.01142986, 0.6575798, 1.395918, 0, 0, 1, 1, 1,
0.01800651, 0.6387617, 1.07337, 1, 0, 0, 1, 1,
0.01870042, 2.981661, 0.1761813, 1, 0, 0, 1, 1,
0.01995942, -0.7897576, 0.8824557, 1, 0, 0, 1, 1,
0.0203415, -0.352295, 3.063799, 1, 0, 0, 1, 1,
0.02036616, 0.9360852, -0.8212214, 1, 0, 0, 1, 1,
0.02060991, -0.1314866, 1.513693, 0, 0, 0, 1, 1,
0.02102306, 0.4847753, 1.672988, 0, 0, 0, 1, 1,
0.02543641, -0.6686001, 1.849748, 0, 0, 0, 1, 1,
0.02601372, 2.358535, -0.05041827, 0, 0, 0, 1, 1,
0.02837997, 0.5538447, 0.7431101, 0, 0, 0, 1, 1,
0.03101703, 0.1075873, -0.4722474, 0, 0, 0, 1, 1,
0.03322138, -0.02302393, 1.00143, 0, 0, 0, 1, 1,
0.03344827, 1.54529, -0.4888319, 1, 1, 1, 1, 1,
0.03643428, -0.6845056, 3.261666, 1, 1, 1, 1, 1,
0.04544012, 0.451726, 1.20597, 1, 1, 1, 1, 1,
0.04597414, -0.02647468, 1.161548, 1, 1, 1, 1, 1,
0.04722811, -0.5037044, 2.927549, 1, 1, 1, 1, 1,
0.04871696, -1.268457, 2.161919, 1, 1, 1, 1, 1,
0.05159674, -0.4593256, 2.828446, 1, 1, 1, 1, 1,
0.05161774, 0.3146025, 1.010734, 1, 1, 1, 1, 1,
0.05168032, -0.2775186, 2.84736, 1, 1, 1, 1, 1,
0.05710379, -0.3039698, 3.352211, 1, 1, 1, 1, 1,
0.05883182, 0.6057208, -0.7523924, 1, 1, 1, 1, 1,
0.05955527, -1.815765, 1.716084, 1, 1, 1, 1, 1,
0.06009649, 1.039984, 1.216283, 1, 1, 1, 1, 1,
0.0623402, -1.035331, 1.727381, 1, 1, 1, 1, 1,
0.06344642, -0.8029609, 3.689003, 1, 1, 1, 1, 1,
0.06606687, 0.1153694, 1.176823, 0, 0, 1, 1, 1,
0.06799646, -2.142215, 4.409673, 1, 0, 0, 1, 1,
0.06971173, -1.527433, 3.981339, 1, 0, 0, 1, 1,
0.07010245, -1.103805, 4.22247, 1, 0, 0, 1, 1,
0.07088669, 0.6759923, -0.3264262, 1, 0, 0, 1, 1,
0.07660455, -2.370174, 3.840115, 1, 0, 0, 1, 1,
0.07956874, 0.5264561, 0.9994278, 0, 0, 0, 1, 1,
0.08054454, 0.5514141, 0.1987169, 0, 0, 0, 1, 1,
0.08475848, -1.894003, 3.478862, 0, 0, 0, 1, 1,
0.08735736, 0.1671135, 1.982757, 0, 0, 0, 1, 1,
0.08858529, -0.1155204, 1.525106, 0, 0, 0, 1, 1,
0.095172, -1.938709, 3.523347, 0, 0, 0, 1, 1,
0.100868, -0.8180546, 2.3443, 0, 0, 0, 1, 1,
0.1030136, 0.8705373, 0.5748721, 1, 1, 1, 1, 1,
0.1050827, -0.8329302, 0.8634379, 1, 1, 1, 1, 1,
0.1063964, -1.293931, 5.510226, 1, 1, 1, 1, 1,
0.106968, 0.6182026, 0.3492287, 1, 1, 1, 1, 1,
0.1073395, -1.064266, 3.788784, 1, 1, 1, 1, 1,
0.1077764, 0.5693822, -0.3543328, 1, 1, 1, 1, 1,
0.1092115, -0.8826909, 1.247776, 1, 1, 1, 1, 1,
0.1206558, 0.7706793, -2.297509, 1, 1, 1, 1, 1,
0.1209761, -0.984898, 4.714205, 1, 1, 1, 1, 1,
0.1253968, -0.4022259, 1.464767, 1, 1, 1, 1, 1,
0.1292511, 1.427118, 0.06410421, 1, 1, 1, 1, 1,
0.130531, -0.2546462, 3.457463, 1, 1, 1, 1, 1,
0.1310638, -1.421966, 2.990959, 1, 1, 1, 1, 1,
0.1343687, 0.08033248, 1.215459, 1, 1, 1, 1, 1,
0.1357939, -0.6143325, 4.121125, 1, 1, 1, 1, 1,
0.1359695, 0.2550211, 1.641675, 0, 0, 1, 1, 1,
0.1380561, 1.352649, 1.002761, 1, 0, 0, 1, 1,
0.1390079, 0.08245157, 1.024283, 1, 0, 0, 1, 1,
0.1392691, 0.3198825, -0.06706467, 1, 0, 0, 1, 1,
0.1444883, -0.02124438, 1.255842, 1, 0, 0, 1, 1,
0.1512129, -1.618007, 1.959431, 1, 0, 0, 1, 1,
0.1514488, -0.2477115, 3.280451, 0, 0, 0, 1, 1,
0.1520369, -1.024238, 1.448254, 0, 0, 0, 1, 1,
0.1561448, -0.4911478, 2.601427, 0, 0, 0, 1, 1,
0.1577276, 0.7618827, 2.079063, 0, 0, 0, 1, 1,
0.1579971, -0.1708277, 3.828772, 0, 0, 0, 1, 1,
0.1588493, -0.6707935, 3.493126, 0, 0, 0, 1, 1,
0.1612411, -0.7402825, 2.959818, 0, 0, 0, 1, 1,
0.1617292, -1.569228, 4.034203, 1, 1, 1, 1, 1,
0.1648836, 1.639673, 1.799807, 1, 1, 1, 1, 1,
0.1651026, -0.4337525, 1.468913, 1, 1, 1, 1, 1,
0.1674228, -1.160912, 2.883643, 1, 1, 1, 1, 1,
0.1685153, 1.228296, -1.385944, 1, 1, 1, 1, 1,
0.1686766, -0.3068175, 3.484685, 1, 1, 1, 1, 1,
0.1778977, -0.07107055, 1.970812, 1, 1, 1, 1, 1,
0.1786947, 0.1577013, 0.4664693, 1, 1, 1, 1, 1,
0.1795136, -0.2895909, 3.267939, 1, 1, 1, 1, 1,
0.1800531, -0.05089777, 2.0804, 1, 1, 1, 1, 1,
0.1824318, 1.334673, -0.09033764, 1, 1, 1, 1, 1,
0.1836632, -0.0574925, 0.4673792, 1, 1, 1, 1, 1,
0.1841653, 0.6381661, 0.5580841, 1, 1, 1, 1, 1,
0.1843301, -0.9007079, 2.283307, 1, 1, 1, 1, 1,
0.1867031, 0.403266, -0.3864113, 1, 1, 1, 1, 1,
0.1901712, -1.498634, 2.23648, 0, 0, 1, 1, 1,
0.1907965, -0.8524009, 3.151763, 1, 0, 0, 1, 1,
0.1941659, 0.5776775, 1.313756, 1, 0, 0, 1, 1,
0.1941859, -2.722783, 4.241359, 1, 0, 0, 1, 1,
0.1954606, 1.321863, -1.157964, 1, 0, 0, 1, 1,
0.1959693, -0.296776, 2.092231, 1, 0, 0, 1, 1,
0.1970691, -0.3773957, 3.495253, 0, 0, 0, 1, 1,
0.1979373, -0.4422615, 1.597713, 0, 0, 0, 1, 1,
0.1990208, 0.5936028, 0.02813785, 0, 0, 0, 1, 1,
0.2009789, -0.5292879, 2.950773, 0, 0, 0, 1, 1,
0.2013815, 1.131512, 1.265684, 0, 0, 0, 1, 1,
0.2021707, -1.057349, 3.107357, 0, 0, 0, 1, 1,
0.2023013, 1.74226, -1.005521, 0, 0, 0, 1, 1,
0.2029085, -0.8263883, 4.47758, 1, 1, 1, 1, 1,
0.2077498, 0.941594, -0.3519405, 1, 1, 1, 1, 1,
0.2084818, 0.6624532, -0.3717159, 1, 1, 1, 1, 1,
0.2086468, 0.1233315, 1.292443, 1, 1, 1, 1, 1,
0.2202451, 0.6059018, 2.944219, 1, 1, 1, 1, 1,
0.2222496, -1.305447, 3.976604, 1, 1, 1, 1, 1,
0.222416, -0.4005529, 1.894262, 1, 1, 1, 1, 1,
0.2274492, 0.8009799, -0.4637788, 1, 1, 1, 1, 1,
0.2324089, -0.08652318, 3.747633, 1, 1, 1, 1, 1,
0.2371714, -0.8009048, 1.41585, 1, 1, 1, 1, 1,
0.237239, -2.347025, 3.598225, 1, 1, 1, 1, 1,
0.2376757, -0.6719677, 2.172294, 1, 1, 1, 1, 1,
0.2377884, -0.6442286, 2.753579, 1, 1, 1, 1, 1,
0.2407384, -0.12824, 2.595822, 1, 1, 1, 1, 1,
0.2414523, -0.3686473, 2.708922, 1, 1, 1, 1, 1,
0.2436862, 0.6301902, 0.5225178, 0, 0, 1, 1, 1,
0.2440546, -1.335111, 1.790193, 1, 0, 0, 1, 1,
0.2496113, 0.04042831, 3.545645, 1, 0, 0, 1, 1,
0.2500224, -0.3405719, 4.394209, 1, 0, 0, 1, 1,
0.2534686, 0.3424951, 1.05659, 1, 0, 0, 1, 1,
0.2813484, -0.3008834, 2.001963, 1, 0, 0, 1, 1,
0.2816704, 0.02493294, 1.811604, 0, 0, 0, 1, 1,
0.2817529, -0.1838976, 1.440223, 0, 0, 0, 1, 1,
0.2856647, -0.7934655, 3.135061, 0, 0, 0, 1, 1,
0.2898711, -0.7818425, 2.19369, 0, 0, 0, 1, 1,
0.2914615, -0.4143268, 2.347236, 0, 0, 0, 1, 1,
0.2924613, 0.9904127, 0.8332976, 0, 0, 0, 1, 1,
0.2932776, 0.6519527, -0.231398, 0, 0, 0, 1, 1,
0.2938452, 0.5733419, 2.268985, 1, 1, 1, 1, 1,
0.3005801, -1.865451, 3.213076, 1, 1, 1, 1, 1,
0.3020719, -0.1154952, 1.517772, 1, 1, 1, 1, 1,
0.3055679, 1.068346, -0.365389, 1, 1, 1, 1, 1,
0.3069203, 1.224745, -0.3291023, 1, 1, 1, 1, 1,
0.3092985, 0.6167491, 0.6871437, 1, 1, 1, 1, 1,
0.3112336, 0.9032064, 1.557809, 1, 1, 1, 1, 1,
0.320695, 0.2101774, 0.2948727, 1, 1, 1, 1, 1,
0.3213302, 0.3584619, 0.9422652, 1, 1, 1, 1, 1,
0.3238936, -0.1015538, 1.256449, 1, 1, 1, 1, 1,
0.3246432, 0.5629934, 0.8609648, 1, 1, 1, 1, 1,
0.3263354, -0.5214282, 1.284136, 1, 1, 1, 1, 1,
0.331222, -0.2703569, 3.138852, 1, 1, 1, 1, 1,
0.3322912, -1.490193, 2.965021, 1, 1, 1, 1, 1,
0.3328584, -0.2324592, 3.299159, 1, 1, 1, 1, 1,
0.3417515, 1.399142, -0.5078093, 0, 0, 1, 1, 1,
0.3460518, -1.168636, 3.144727, 1, 0, 0, 1, 1,
0.3463983, -0.1350524, 2.331466, 1, 0, 0, 1, 1,
0.3492723, 0.03929832, 1.182607, 1, 0, 0, 1, 1,
0.3520638, -0.8518955, 2.176471, 1, 0, 0, 1, 1,
0.3535135, -1.524921, 2.881968, 1, 0, 0, 1, 1,
0.3553854, -0.9178589, 4.409134, 0, 0, 0, 1, 1,
0.3555869, -0.4446818, 2.809839, 0, 0, 0, 1, 1,
0.3616148, -0.2428831, 3.323349, 0, 0, 0, 1, 1,
0.3649842, -1.232802, 1.793985, 0, 0, 0, 1, 1,
0.3650205, 0.6455913, 1.544199, 0, 0, 0, 1, 1,
0.3668546, -0.7917646, 2.703253, 0, 0, 0, 1, 1,
0.3764903, 0.8367822, 0.9970102, 0, 0, 0, 1, 1,
0.381003, 0.2875133, -0.05486365, 1, 1, 1, 1, 1,
0.3821489, 1.621282, 2.257303, 1, 1, 1, 1, 1,
0.3821941, -1.108741, -0.03664491, 1, 1, 1, 1, 1,
0.3826601, -0.44352, 4.426708, 1, 1, 1, 1, 1,
0.3837105, 0.1827865, -0.3353214, 1, 1, 1, 1, 1,
0.3894002, -1.590101, 4.529782, 1, 1, 1, 1, 1,
0.3963453, 0.9088609, 1.452653, 1, 1, 1, 1, 1,
0.3985409, 0.04908092, 2.455011, 1, 1, 1, 1, 1,
0.4073167, 0.3920273, 1.594513, 1, 1, 1, 1, 1,
0.407676, -0.8239179, 2.864991, 1, 1, 1, 1, 1,
0.4114752, 0.08456217, 1.900683, 1, 1, 1, 1, 1,
0.4147119, 0.1403342, 1.37505, 1, 1, 1, 1, 1,
0.4181601, -0.4792736, 3.520941, 1, 1, 1, 1, 1,
0.4185576, 0.9823102, 0.2711032, 1, 1, 1, 1, 1,
0.4189245, 1.35692, -0.7156352, 1, 1, 1, 1, 1,
0.4203855, -0.3726153, 2.439986, 0, 0, 1, 1, 1,
0.4269611, 1.271099, -1.789818, 1, 0, 0, 1, 1,
0.4313384, -0.7030957, 2.501539, 1, 0, 0, 1, 1,
0.4313506, 0.7582214, -1.088101, 1, 0, 0, 1, 1,
0.4341423, 0.5891747, 0.06319883, 1, 0, 0, 1, 1,
0.4423174, 0.2323642, 0.8584508, 1, 0, 0, 1, 1,
0.4437432, 0.5097489, 0.1509428, 0, 0, 0, 1, 1,
0.4444733, 0.7984017, 0.6240399, 0, 0, 0, 1, 1,
0.448135, 1.702936, 0.01060105, 0, 0, 0, 1, 1,
0.4572521, 2.090691, -0.2635087, 0, 0, 0, 1, 1,
0.4588211, 0.8114091, -0.221633, 0, 0, 0, 1, 1,
0.4594941, -0.9334974, 3.152952, 0, 0, 0, 1, 1,
0.4634545, -0.1751639, 2.798332, 0, 0, 0, 1, 1,
0.4634874, -1.165717, 1.773674, 1, 1, 1, 1, 1,
0.4664737, 0.6088627, 1.221715, 1, 1, 1, 1, 1,
0.4713245, -0.5571225, 1.460911, 1, 1, 1, 1, 1,
0.4760615, -0.569683, 3.569412, 1, 1, 1, 1, 1,
0.4790458, 0.57159, 0.7626667, 1, 1, 1, 1, 1,
0.4805536, -0.7084143, 2.513664, 1, 1, 1, 1, 1,
0.4811752, 1.900784, 1.525642, 1, 1, 1, 1, 1,
0.4818895, 0.3975511, 0.3431544, 1, 1, 1, 1, 1,
0.48317, -0.179482, 2.189572, 1, 1, 1, 1, 1,
0.4847195, -0.4482459, 2.085651, 1, 1, 1, 1, 1,
0.4881102, 1.143532, 0.4577172, 1, 1, 1, 1, 1,
0.4936328, -1.243794, 2.309126, 1, 1, 1, 1, 1,
0.4945747, -0.03129173, 1.628252, 1, 1, 1, 1, 1,
0.4993311, 0.6552266, -0.6574891, 1, 1, 1, 1, 1,
0.5025919, -1.603736, 2.347609, 1, 1, 1, 1, 1,
0.5082108, -0.970988, 1.633596, 0, 0, 1, 1, 1,
0.5155405, -1.658773, 2.08576, 1, 0, 0, 1, 1,
0.5183624, 0.5718815, 0.7706942, 1, 0, 0, 1, 1,
0.5231732, 1.180143, 0.243273, 1, 0, 0, 1, 1,
0.5304155, 2.939255, 1.910193, 1, 0, 0, 1, 1,
0.537605, -0.6000869, 1.0532, 1, 0, 0, 1, 1,
0.5389744, -0.1933609, 3.197006, 0, 0, 0, 1, 1,
0.5432016, -0.4106134, 2.857446, 0, 0, 0, 1, 1,
0.5533497, -1.072978, 1.400616, 0, 0, 0, 1, 1,
0.5618678, 1.788542, 2.374168, 0, 0, 0, 1, 1,
0.5647485, -0.06019419, 2.423981, 0, 0, 0, 1, 1,
0.5648264, -1.098804, 0.7946291, 0, 0, 0, 1, 1,
0.565519, -0.3204588, 1.965809, 0, 0, 0, 1, 1,
0.5682138, 1.997992, 1.158567, 1, 1, 1, 1, 1,
0.5689051, -1.675678, 3.811246, 1, 1, 1, 1, 1,
0.5743213, -1.106425, 3.407107, 1, 1, 1, 1, 1,
0.5752276, -0.245422, 0.293174, 1, 1, 1, 1, 1,
0.5779064, 0.07769231, 1.020852, 1, 1, 1, 1, 1,
0.5791271, -1.057164, 2.417535, 1, 1, 1, 1, 1,
0.5800902, -0.2602336, 1.442517, 1, 1, 1, 1, 1,
0.592423, 0.1094157, 2.015419, 1, 1, 1, 1, 1,
0.5933895, -0.08194673, 2.359672, 1, 1, 1, 1, 1,
0.5947016, -0.4373165, 1.477144, 1, 1, 1, 1, 1,
0.5971991, 0.7781974, 1.617391, 1, 1, 1, 1, 1,
0.6087902, -0.5806126, 2.574524, 1, 1, 1, 1, 1,
0.6161233, -0.1055281, 1.989545, 1, 1, 1, 1, 1,
0.6170642, -1.855283, 2.065105, 1, 1, 1, 1, 1,
0.6180845, -0.3093955, 1.92975, 1, 1, 1, 1, 1,
0.6202832, -0.9677319, 2.629548, 0, 0, 1, 1, 1,
0.6221162, -0.3066361, 2.281223, 1, 0, 0, 1, 1,
0.6227849, 0.435571, -0.2816094, 1, 0, 0, 1, 1,
0.6280223, -0.1494254, -0.3051181, 1, 0, 0, 1, 1,
0.6322117, -0.2919638, 4.305798, 1, 0, 0, 1, 1,
0.6323431, 0.1013621, 1.065811, 1, 0, 0, 1, 1,
0.632618, 0.2904705, 0.93583, 0, 0, 0, 1, 1,
0.6370168, 0.3989689, -0.1715282, 0, 0, 0, 1, 1,
0.6379825, 0.6148215, 0.6222069, 0, 0, 0, 1, 1,
0.6444101, 0.617835, 2.625069, 0, 0, 0, 1, 1,
0.6475024, 0.4533425, 2.391428, 0, 0, 0, 1, 1,
0.6492611, -0.7540856, 1.833967, 0, 0, 0, 1, 1,
0.6514817, -1.552981, 2.921858, 0, 0, 0, 1, 1,
0.6518551, -0.2366735, 1.172217, 1, 1, 1, 1, 1,
0.6563199, -0.4233613, 1.296673, 1, 1, 1, 1, 1,
0.6569495, -0.03693982, 0.5487701, 1, 1, 1, 1, 1,
0.6612163, 0.190631, 1.540124, 1, 1, 1, 1, 1,
0.661333, -0.4398516, 3.111276, 1, 1, 1, 1, 1,
0.6658506, 1.340675, 3.034419, 1, 1, 1, 1, 1,
0.6692685, 0.5093315, 0.5645427, 1, 1, 1, 1, 1,
0.6724547, 0.7084175, 2.18787, 1, 1, 1, 1, 1,
0.6748863, -0.9473097, 2.589314, 1, 1, 1, 1, 1,
0.6769525, 0.8050718, 1.114189, 1, 1, 1, 1, 1,
0.6987876, 0.020648, 2.471472, 1, 1, 1, 1, 1,
0.7001162, 1.528343, 1.355263, 1, 1, 1, 1, 1,
0.7020442, -0.3268501, 1.515785, 1, 1, 1, 1, 1,
0.7029908, -1.067923, 2.939854, 1, 1, 1, 1, 1,
0.7093028, -0.1220654, 1.961016, 1, 1, 1, 1, 1,
0.7112286, 0.1098944, 1.014871, 0, 0, 1, 1, 1,
0.7205613, 0.06957067, 1.585478, 1, 0, 0, 1, 1,
0.7218437, 0.628095, 1.616007, 1, 0, 0, 1, 1,
0.7238569, -0.1403404, 1.442691, 1, 0, 0, 1, 1,
0.7239859, -1.394266, 2.821348, 1, 0, 0, 1, 1,
0.7338959, 1.332358, -0.667986, 1, 0, 0, 1, 1,
0.7355981, -0.1747248, 3.489365, 0, 0, 0, 1, 1,
0.73641, 0.8956319, 1.268045, 0, 0, 0, 1, 1,
0.7369935, -0.7207139, 1.563714, 0, 0, 0, 1, 1,
0.7370812, -1.348536, 1.930678, 0, 0, 0, 1, 1,
0.7409849, 0.9171964, 0.4830555, 0, 0, 0, 1, 1,
0.7446643, -0.8652356, 2.233255, 0, 0, 0, 1, 1,
0.745996, -0.07597734, 1.590392, 0, 0, 0, 1, 1,
0.7467217, 1.115996, 1.33835, 1, 1, 1, 1, 1,
0.7470682, -1.531149, 4.741339, 1, 1, 1, 1, 1,
0.7495665, -0.4314236, 2.503438, 1, 1, 1, 1, 1,
0.7564538, -0.7966639, 2.884964, 1, 1, 1, 1, 1,
0.7602525, 0.3999104, 2.855038, 1, 1, 1, 1, 1,
0.7606248, 0.7640654, 1.298002, 1, 1, 1, 1, 1,
0.7627816, 1.536504, 0.5238, 1, 1, 1, 1, 1,
0.7668101, 0.4042931, -0.1341858, 1, 1, 1, 1, 1,
0.7726721, 0.3001563, 1.373437, 1, 1, 1, 1, 1,
0.7758002, 0.4940153, 1.294015, 1, 1, 1, 1, 1,
0.7762159, -0.1998631, 2.94464, 1, 1, 1, 1, 1,
0.7854345, 0.7883393, -0.2960565, 1, 1, 1, 1, 1,
0.7858378, -2.884693, 3.058099, 1, 1, 1, 1, 1,
0.7873988, -0.8700802, 1.807914, 1, 1, 1, 1, 1,
0.7897336, 0.7778721, -0.7335464, 1, 1, 1, 1, 1,
0.7973535, -0.1046663, 1.390059, 0, 0, 1, 1, 1,
0.7999543, -0.1113345, 1.121875, 1, 0, 0, 1, 1,
0.8034011, -0.3827516, 2.670286, 1, 0, 0, 1, 1,
0.8049358, -1.026775, 2.044414, 1, 0, 0, 1, 1,
0.8088107, 0.9988691, 1.953258, 1, 0, 0, 1, 1,
0.8100139, 0.522535, 1.103934, 1, 0, 0, 1, 1,
0.8129148, 2.334003, -0.2434934, 0, 0, 0, 1, 1,
0.8159138, -0.1093215, 2.078019, 0, 0, 0, 1, 1,
0.8164359, 0.3423573, 1.502986, 0, 0, 0, 1, 1,
0.8207134, 0.3399738, 2.766827, 0, 0, 0, 1, 1,
0.8211981, -0.609737, 1.004813, 0, 0, 0, 1, 1,
0.8227862, 2.259625, -0.08995091, 0, 0, 0, 1, 1,
0.8240399, -0.4844526, 2.548267, 0, 0, 0, 1, 1,
0.8244023, -0.04181253, 1.766369, 1, 1, 1, 1, 1,
0.8245523, 0.03817371, 1.755339, 1, 1, 1, 1, 1,
0.8274112, -0.06423002, 2.847676, 1, 1, 1, 1, 1,
0.82743, -0.9411908, 1.494643, 1, 1, 1, 1, 1,
0.8290678, -0.5775829, 0.6670535, 1, 1, 1, 1, 1,
0.8307066, 0.9390724, -1.538919, 1, 1, 1, 1, 1,
0.8308268, 0.006955051, 1.474769, 1, 1, 1, 1, 1,
0.8356623, -0.5990363, 1.258465, 1, 1, 1, 1, 1,
0.8370686, 1.405566, 0.1046972, 1, 1, 1, 1, 1,
0.8398532, -1.345146, 3.028147, 1, 1, 1, 1, 1,
0.8449343, 1.350284, -0.4996147, 1, 1, 1, 1, 1,
0.8483026, 0.6305594, 2.41683, 1, 1, 1, 1, 1,
0.8512622, 1.2691, 0.3736509, 1, 1, 1, 1, 1,
0.8518294, -0.7806998, 2.711768, 1, 1, 1, 1, 1,
0.8541406, 0.6542891, 0.1368231, 1, 1, 1, 1, 1,
0.858672, 2.414888, 1.198885, 0, 0, 1, 1, 1,
0.8629981, 1.522438, 0.02378335, 1, 0, 0, 1, 1,
0.8645837, 0.8012254, -0.1207016, 1, 0, 0, 1, 1,
0.8648403, -0.04762981, 2.194091, 1, 0, 0, 1, 1,
0.8654639, -1.386057, 2.450443, 1, 0, 0, 1, 1,
0.8655704, -0.3005009, 1.800169, 1, 0, 0, 1, 1,
0.867718, 0.9858838, -1.445627, 0, 0, 0, 1, 1,
0.8704717, 0.7713929, 0.4030163, 0, 0, 0, 1, 1,
0.8753991, 0.5600979, 0.4144173, 0, 0, 0, 1, 1,
0.8756683, 0.1335927, -0.2109943, 0, 0, 0, 1, 1,
0.8759395, -1.317926, 3.171829, 0, 0, 0, 1, 1,
0.8761375, -1.260732, 0.8708385, 0, 0, 0, 1, 1,
0.8788152, -0.06365149, 0.578523, 0, 0, 0, 1, 1,
0.8861786, -0.3352003, 1.536039, 1, 1, 1, 1, 1,
0.8879276, 0.05635614, 1.200823, 1, 1, 1, 1, 1,
0.8879842, 0.05817168, 0.7504144, 1, 1, 1, 1, 1,
0.8930828, 0.6468941, 1.09922, 1, 1, 1, 1, 1,
0.895857, 2.07243, -0.7178651, 1, 1, 1, 1, 1,
0.9028851, -2.256854, 2.502435, 1, 1, 1, 1, 1,
0.906254, -2.428114, 2.478715, 1, 1, 1, 1, 1,
0.9066727, -0.07752398, -0.4356097, 1, 1, 1, 1, 1,
0.9120466, 0.1692155, 0.4043535, 1, 1, 1, 1, 1,
0.9147677, -1.36559, 2.541873, 1, 1, 1, 1, 1,
0.9171272, -1.587406, 2.383158, 1, 1, 1, 1, 1,
0.9181636, -0.9610355, 2.84363, 1, 1, 1, 1, 1,
0.9251152, -1.87831, 3.34346, 1, 1, 1, 1, 1,
0.9443379, 1.006764, 2.271246, 1, 1, 1, 1, 1,
0.9507797, -0.7518521, 1.073252, 1, 1, 1, 1, 1,
0.9627965, 1.409804, 2.033016, 0, 0, 1, 1, 1,
0.9701705, -1.479938, 2.446853, 1, 0, 0, 1, 1,
0.9710097, 1.404714, 2.409716, 1, 0, 0, 1, 1,
0.9716871, 0.3811882, 0.3752276, 1, 0, 0, 1, 1,
0.9729545, 0.6031131, -0.401043, 1, 0, 0, 1, 1,
0.9773977, -1.002719, 3.719279, 1, 0, 0, 1, 1,
0.9819972, 0.4854815, 3.572438, 0, 0, 0, 1, 1,
0.982485, 0.9818836, 0.7335857, 0, 0, 0, 1, 1,
0.9858775, -0.84965, 3.512887, 0, 0, 0, 1, 1,
0.9947005, -1.263382, 2.420487, 0, 0, 0, 1, 1,
0.9957028, 2.286188, -0.3967497, 0, 0, 0, 1, 1,
0.9969999, -0.2511104, 2.437748, 0, 0, 0, 1, 1,
1.003943, -0.7341717, 2.923333, 0, 0, 0, 1, 1,
1.016509, 0.7950021, -1.365178, 1, 1, 1, 1, 1,
1.023016, -0.31719, 3.25368, 1, 1, 1, 1, 1,
1.024008, -0.03474195, 1.553729, 1, 1, 1, 1, 1,
1.035637, -0.05194218, 2.218407, 1, 1, 1, 1, 1,
1.039332, 0.9209154, 0.7953191, 1, 1, 1, 1, 1,
1.042347, -0.8049753, 1.58927, 1, 1, 1, 1, 1,
1.044808, -0.02612473, 0.4913423, 1, 1, 1, 1, 1,
1.044868, -1.851989, 2.428186, 1, 1, 1, 1, 1,
1.048286, -0.1678401, 0.8058506, 1, 1, 1, 1, 1,
1.052547, -0.4937977, 2.821091, 1, 1, 1, 1, 1,
1.05583, -0.7620834, 2.008786, 1, 1, 1, 1, 1,
1.05683, 0.4993687, 0.07819851, 1, 1, 1, 1, 1,
1.061458, 0.1532925, -2.294596, 1, 1, 1, 1, 1,
1.067674, 0.9159008, 1.857605, 1, 1, 1, 1, 1,
1.068433, -0.2831828, 4.292625, 1, 1, 1, 1, 1,
1.073195, -0.9496056, 2.239627, 0, 0, 1, 1, 1,
1.077162, -1.863712, 2.989934, 1, 0, 0, 1, 1,
1.077694, -1.591269, 3.270846, 1, 0, 0, 1, 1,
1.08813, 0.4125879, 0.3211704, 1, 0, 0, 1, 1,
1.090424, -0.08052826, -0.4252327, 1, 0, 0, 1, 1,
1.092522, 0.3923029, 0.3119432, 1, 0, 0, 1, 1,
1.094453, -0.5327376, 1.028241, 0, 0, 0, 1, 1,
1.097702, -1.464508, 2.731783, 0, 0, 0, 1, 1,
1.100353, 0.1762861, 0.6474889, 0, 0, 0, 1, 1,
1.110516, 0.197853, 0.7298512, 0, 0, 0, 1, 1,
1.110953, -1.966916, 2.772939, 0, 0, 0, 1, 1,
1.111227, -0.6108304, 2.691955, 0, 0, 0, 1, 1,
1.123365, -0.6704078, 1.740381, 0, 0, 0, 1, 1,
1.129888, 0.5216705, 0.88367, 1, 1, 1, 1, 1,
1.138385, -0.05860989, 0.9802268, 1, 1, 1, 1, 1,
1.144075, 2.012563, 1.575116, 1, 1, 1, 1, 1,
1.144918, -1.048317, 4.315283, 1, 1, 1, 1, 1,
1.147629, -1.970374, 2.36211, 1, 1, 1, 1, 1,
1.149406, -0.1907596, 2.294005, 1, 1, 1, 1, 1,
1.150571, -0.7187462, 2.80033, 1, 1, 1, 1, 1,
1.150923, 0.9051208, 1.168242, 1, 1, 1, 1, 1,
1.151301, -1.261967, 2.796235, 1, 1, 1, 1, 1,
1.154561, 0.9359403, 0.8206209, 1, 1, 1, 1, 1,
1.157494, 1.457148, -0.1317226, 1, 1, 1, 1, 1,
1.159676, -1.023152, 2.89974, 1, 1, 1, 1, 1,
1.160356, 0.5845169, 2.010029, 1, 1, 1, 1, 1,
1.167974, -0.416664, 1.791356, 1, 1, 1, 1, 1,
1.169613, 0.2901164, 2.87806, 1, 1, 1, 1, 1,
1.175637, -1.383426, 3.271389, 0, 0, 1, 1, 1,
1.17625, -0.792475, 2.448683, 1, 0, 0, 1, 1,
1.179171, -1.94057, 1.575962, 1, 0, 0, 1, 1,
1.184092, -0.9353556, 2.831233, 1, 0, 0, 1, 1,
1.18808, -0.006207846, 1.126881, 1, 0, 0, 1, 1,
1.188104, 0.1616966, 1.6543, 1, 0, 0, 1, 1,
1.193182, 0.2866795, 0.4050411, 0, 0, 0, 1, 1,
1.210282, -0.8392885, 3.549764, 0, 0, 0, 1, 1,
1.211982, 0.4115514, 2.85537, 0, 0, 0, 1, 1,
1.22591, 0.5387012, 1.418806, 0, 0, 0, 1, 1,
1.230547, 0.6225231, 1.161186, 0, 0, 0, 1, 1,
1.235546, -0.02260824, 1.425446, 0, 0, 0, 1, 1,
1.247542, 2.528567, 0.6998727, 0, 0, 0, 1, 1,
1.26536, -0.3638029, 1.571399, 1, 1, 1, 1, 1,
1.266894, -1.37528, 0.8752409, 1, 1, 1, 1, 1,
1.268517, -1.17053, 3.948119, 1, 1, 1, 1, 1,
1.268744, -1.616013, 4.419228, 1, 1, 1, 1, 1,
1.271356, -0.5869943, 2.249428, 1, 1, 1, 1, 1,
1.274587, 0.01228926, 3.922377, 1, 1, 1, 1, 1,
1.288393, 0.7065222, 1.097136, 1, 1, 1, 1, 1,
1.291124, -1.818997, 3.803585, 1, 1, 1, 1, 1,
1.310194, -0.387989, 2.003966, 1, 1, 1, 1, 1,
1.312335, 0.3466606, 3.283824, 1, 1, 1, 1, 1,
1.320359, -0.6188182, 1.250536, 1, 1, 1, 1, 1,
1.321336, 1.222971, 2.176502, 1, 1, 1, 1, 1,
1.342676, 0.4023715, 0.3825616, 1, 1, 1, 1, 1,
1.36015, 0.5932941, 2.279341, 1, 1, 1, 1, 1,
1.369647, -0.4718652, 1.800654, 1, 1, 1, 1, 1,
1.371654, 1.228649, 0.4414682, 0, 0, 1, 1, 1,
1.399617, 1.202965, -3.337169, 1, 0, 0, 1, 1,
1.405441, -0.3789036, 1.582032, 1, 0, 0, 1, 1,
1.408414, 1.149991, 0.4061229, 1, 0, 0, 1, 1,
1.428253, 0.075594, 1.226913, 1, 0, 0, 1, 1,
1.451647, 1.071793, 0.6608572, 1, 0, 0, 1, 1,
1.454063, -0.9595068, 1.911474, 0, 0, 0, 1, 1,
1.464791, -0.2882643, 1.435199, 0, 0, 0, 1, 1,
1.492757, -0.7593658, 2.988258, 0, 0, 0, 1, 1,
1.495729, -0.08660572, 1.955175, 0, 0, 0, 1, 1,
1.511206, -0.7228462, 1.725168, 0, 0, 0, 1, 1,
1.515487, -0.09120078, 4.010391, 0, 0, 0, 1, 1,
1.525919, 1.42139, 0.8303977, 0, 0, 0, 1, 1,
1.534341, -0.3808267, 2.349581, 1, 1, 1, 1, 1,
1.539776, -0.01895336, -1.225821, 1, 1, 1, 1, 1,
1.55248, 0.889149, 1.468008, 1, 1, 1, 1, 1,
1.567512, 1.12011, 1.344496, 1, 1, 1, 1, 1,
1.574765, -1.447785, 3.099796, 1, 1, 1, 1, 1,
1.598345, -0.6729029, 1.092666, 1, 1, 1, 1, 1,
1.612387, -1.241415, 2.081084, 1, 1, 1, 1, 1,
1.615033, 0.2918935, 1.80953, 1, 1, 1, 1, 1,
1.622795, -0.08024555, 2.053873, 1, 1, 1, 1, 1,
1.623483, -0.5710247, 0.8563715, 1, 1, 1, 1, 1,
1.626611, 0.3039296, 0.2508362, 1, 1, 1, 1, 1,
1.635878, 0.341704, -1.717931, 1, 1, 1, 1, 1,
1.63595, 0.4996555, 2.413116, 1, 1, 1, 1, 1,
1.646545, -1.549972, 1.467506, 1, 1, 1, 1, 1,
1.6483, 0.3420369, 0.5675356, 1, 1, 1, 1, 1,
1.648319, 1.083874, 1.4038, 0, 0, 1, 1, 1,
1.65498, -0.6735354, 1.26298, 1, 0, 0, 1, 1,
1.678861, 0.2922975, 2.111732, 1, 0, 0, 1, 1,
1.687462, 0.7564011, -0.6076989, 1, 0, 0, 1, 1,
1.700557, 1.552168, 0.4253587, 1, 0, 0, 1, 1,
1.701268, -0.565041, 2.746225, 1, 0, 0, 1, 1,
1.709121, -1.772506, 3.326523, 0, 0, 0, 1, 1,
1.73456, -1.153816, 1.806391, 0, 0, 0, 1, 1,
1.781776, 0.1158338, 0.7506426, 0, 0, 0, 1, 1,
1.782583, 0.8167123, 1.788901, 0, 0, 0, 1, 1,
1.793067, 1.742757, -0.8460256, 0, 0, 0, 1, 1,
1.796415, -0.01685457, 3.084751, 0, 0, 0, 1, 1,
1.829742, 0.2179602, 0.02842298, 0, 0, 0, 1, 1,
1.872005, 0.4529744, 2.20464, 1, 1, 1, 1, 1,
1.875439, 0.3697632, 1.709651, 1, 1, 1, 1, 1,
1.886879, -0.2480231, 1.419357, 1, 1, 1, 1, 1,
1.969245, -0.01659573, 1.440816, 1, 1, 1, 1, 1,
1.984802, -2.316622, 0.8303634, 1, 1, 1, 1, 1,
1.984997, -0.6875005, 1.668484, 1, 1, 1, 1, 1,
1.987512, 0.961852, -0.6165152, 1, 1, 1, 1, 1,
1.98829, 0.7200662, 0.447058, 1, 1, 1, 1, 1,
2.030959, -0.3089183, 1.381362, 1, 1, 1, 1, 1,
2.032604, 0.4900251, 1.468734, 1, 1, 1, 1, 1,
2.059063, 0.4698498, 0.6011646, 1, 1, 1, 1, 1,
2.06477, -0.4131907, 0.6355838, 1, 1, 1, 1, 1,
2.085044, -1.730989, 1.578902, 1, 1, 1, 1, 1,
2.112321, 0.1347774, 2.418714, 1, 1, 1, 1, 1,
2.118523, -0.1498895, 0.3315434, 1, 1, 1, 1, 1,
2.13541, 0.6146857, 1.488266, 0, 0, 1, 1, 1,
2.135526, -0.4977536, 2.282116, 1, 0, 0, 1, 1,
2.241976, 1.903444, 0.8008608, 1, 0, 0, 1, 1,
2.270162, -0.4228538, -0.3622168, 1, 0, 0, 1, 1,
2.419594, -0.5168787, 0.1761709, 1, 0, 0, 1, 1,
2.435709, 0.404171, 1.859486, 1, 0, 0, 1, 1,
2.446206, -0.123691, 1.773284, 0, 0, 0, 1, 1,
2.497744, 0.6483448, 0.777954, 0, 0, 0, 1, 1,
2.513935, 1.898773, 0.5850421, 0, 0, 0, 1, 1,
2.534105, 1.14901, 1.46983, 0, 0, 0, 1, 1,
2.551331, 1.286891, -0.5803492, 0, 0, 0, 1, 1,
2.59584, 1.092576, 3.211779, 0, 0, 0, 1, 1,
2.601046, -2.456403, 3.57009, 0, 0, 0, 1, 1,
2.620625, -1.500835, 1.242473, 1, 1, 1, 1, 1,
2.66123, 0.1275119, 0.3714716, 1, 1, 1, 1, 1,
2.666882, -0.9563213, 1.365118, 1, 1, 1, 1, 1,
2.673153, -1.162023, 1.437231, 1, 1, 1, 1, 1,
2.674548, -0.4410807, 2.152075, 1, 1, 1, 1, 1,
2.92443, -1.285024, 1.505244, 1, 1, 1, 1, 1,
2.988584, 0.3699932, -0.1665959, 1, 1, 1, 1, 1
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
var radius = 9.616318;
var distance = 33.77691;
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
mvMatrix.translate( 0.2632686, -0.2216918, -0.2369394 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77691);
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
