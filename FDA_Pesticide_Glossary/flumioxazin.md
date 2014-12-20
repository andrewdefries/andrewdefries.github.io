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
-3.024325, -0.4561332, -1.7143, 1, 0, 0, 1,
-2.812238, -0.8899444, -1.915497, 1, 0.007843138, 0, 1,
-2.760546, -1.331057, -3.538264, 1, 0.01176471, 0, 1,
-2.667258, -0.6739181, -3.325447, 1, 0.01960784, 0, 1,
-2.611508, -0.170462, -1.886078, 1, 0.02352941, 0, 1,
-2.566608, 0.9841302, -0.8989508, 1, 0.03137255, 0, 1,
-2.564638, -0.4502484, -0.9428461, 1, 0.03529412, 0, 1,
-2.526898, -0.3142213, -2.183244, 1, 0.04313726, 0, 1,
-2.44595, 0.01510734, 0.1551576, 1, 0.04705882, 0, 1,
-2.427699, -0.728076, -1.036592, 1, 0.05490196, 0, 1,
-2.41547, 0.2141382, -1.434282, 1, 0.05882353, 0, 1,
-2.339852, -0.3676919, -1.266992, 1, 0.06666667, 0, 1,
-2.283582, 0.9514675, -1.44564, 1, 0.07058824, 0, 1,
-2.255094, -1.9118, -4.459575, 1, 0.07843138, 0, 1,
-2.247781, 0.3600039, -1.091688, 1, 0.08235294, 0, 1,
-2.21499, -0.2824229, -0.7899632, 1, 0.09019608, 0, 1,
-2.14147, -0.6083056, -2.101439, 1, 0.09411765, 0, 1,
-2.106953, 0.6532638, -0.2314679, 1, 0.1019608, 0, 1,
-2.10305, 0.976451, -2.712151, 1, 0.1098039, 0, 1,
-2.101708, 0.009447463, -1.254007, 1, 0.1137255, 0, 1,
-2.091457, 0.7379535, -1.909498, 1, 0.1215686, 0, 1,
-2.08319, -0.6240144, -0.9176282, 1, 0.1254902, 0, 1,
-2.049341, -0.2836337, -2.152686, 1, 0.1333333, 0, 1,
-2.035373, -0.2357316, -3.299098, 1, 0.1372549, 0, 1,
-2.026796, 1.298483, 0.3491282, 1, 0.145098, 0, 1,
-2.013834, -1.245948, -2.637003, 1, 0.1490196, 0, 1,
-2.002305, 0.8232827, -0.9732574, 1, 0.1568628, 0, 1,
-1.971719, -0.9038618, -3.242289, 1, 0.1607843, 0, 1,
-1.9703, 0.6717741, -1.169652, 1, 0.1686275, 0, 1,
-1.935238, 0.1908664, -2.113319, 1, 0.172549, 0, 1,
-1.892519, -1.70514, -1.380536, 1, 0.1803922, 0, 1,
-1.888483, -0.6871562, -2.660098, 1, 0.1843137, 0, 1,
-1.88257, 0.584119, -3.05767, 1, 0.1921569, 0, 1,
-1.871656, -1.007042, -2.453488, 1, 0.1960784, 0, 1,
-1.832381, -0.7722535, -0.4232028, 1, 0.2039216, 0, 1,
-1.829812, -0.164556, -2.935796, 1, 0.2117647, 0, 1,
-1.795855, -0.06987424, -3.466046, 1, 0.2156863, 0, 1,
-1.794321, 1.442356, 0.02941894, 1, 0.2235294, 0, 1,
-1.71043, -1.307892, -2.070868, 1, 0.227451, 0, 1,
-1.70286, 2.056043, -1.157113, 1, 0.2352941, 0, 1,
-1.691413, 0.3583122, -0.8216326, 1, 0.2392157, 0, 1,
-1.690003, 0.8797765, -1.242489, 1, 0.2470588, 0, 1,
-1.672743, -0.2235402, -1.551643, 1, 0.2509804, 0, 1,
-1.666678, 1.671623, -1.043754, 1, 0.2588235, 0, 1,
-1.619614, -0.4172058, -2.014666, 1, 0.2627451, 0, 1,
-1.613024, -0.1476977, -0.3772502, 1, 0.2705882, 0, 1,
-1.603972, -0.6155056, -1.801843, 1, 0.2745098, 0, 1,
-1.602148, -0.3473825, -2.214362, 1, 0.282353, 0, 1,
-1.562754, -0.08580306, -0.9684041, 1, 0.2862745, 0, 1,
-1.557348, -1.032049, -3.256516, 1, 0.2941177, 0, 1,
-1.542978, -0.491646, -1.388069, 1, 0.3019608, 0, 1,
-1.535998, -0.5338231, -2.833449, 1, 0.3058824, 0, 1,
-1.529828, -0.1285607, -2.029864, 1, 0.3137255, 0, 1,
-1.509836, -0.009669368, -3.283911, 1, 0.3176471, 0, 1,
-1.508355, -1.036913, -2.269746, 1, 0.3254902, 0, 1,
-1.498717, 0.1967422, -4.150584, 1, 0.3294118, 0, 1,
-1.495417, 0.8315039, -0.7315881, 1, 0.3372549, 0, 1,
-1.462286, -0.4416087, 0.3002826, 1, 0.3411765, 0, 1,
-1.461615, 0.8528739, -0.3328192, 1, 0.3490196, 0, 1,
-1.453625, -1.11976, -1.875403, 1, 0.3529412, 0, 1,
-1.438803, -1.635415, -1.254128, 1, 0.3607843, 0, 1,
-1.433661, 0.3382665, -2.342956, 1, 0.3647059, 0, 1,
-1.43, 0.7726758, -2.113839, 1, 0.372549, 0, 1,
-1.414915, 0.7677532, -0.4099261, 1, 0.3764706, 0, 1,
-1.407128, 0.2256085, -1.63039, 1, 0.3843137, 0, 1,
-1.403907, -0.5246634, -1.20988, 1, 0.3882353, 0, 1,
-1.396072, 0.3323979, -1.158674, 1, 0.3960784, 0, 1,
-1.395214, -0.3916037, -4.141081, 1, 0.4039216, 0, 1,
-1.394666, -0.3752139, -1.640131, 1, 0.4078431, 0, 1,
-1.394389, 1.490657, -1.639852, 1, 0.4156863, 0, 1,
-1.394174, -0.5808876, -1.034843, 1, 0.4196078, 0, 1,
-1.387741, 0.4785447, 0.9226701, 1, 0.427451, 0, 1,
-1.374558, -1.8091, -3.290969, 1, 0.4313726, 0, 1,
-1.372985, -1.105956, -2.383975, 1, 0.4392157, 0, 1,
-1.368865, 0.2718977, -0.5013629, 1, 0.4431373, 0, 1,
-1.355456, -1.824362, -1.255765, 1, 0.4509804, 0, 1,
-1.346197, -0.4900225, -1.978415, 1, 0.454902, 0, 1,
-1.343607, 0.795159, -1.829713, 1, 0.4627451, 0, 1,
-1.335969, -0.3403943, -1.398662, 1, 0.4666667, 0, 1,
-1.334338, -2.171379, -2.121455, 1, 0.4745098, 0, 1,
-1.332858, -0.01576482, 0.07356736, 1, 0.4784314, 0, 1,
-1.326771, 0.2585279, -3.008, 1, 0.4862745, 0, 1,
-1.326263, 0.7189026, -0.4139736, 1, 0.4901961, 0, 1,
-1.313378, 1.207635, -0.06473079, 1, 0.4980392, 0, 1,
-1.304923, 1.663281, -1.288932, 1, 0.5058824, 0, 1,
-1.289561, -1.606905, -3.715726, 1, 0.509804, 0, 1,
-1.283558, -2.743015, -2.655601, 1, 0.5176471, 0, 1,
-1.282527, 0.8245809, -1.113793, 1, 0.5215687, 0, 1,
-1.280552, -0.4548905, -1.34302, 1, 0.5294118, 0, 1,
-1.269988, -0.7892842, -2.008417, 1, 0.5333334, 0, 1,
-1.25921, -0.9389393, -1.798124, 1, 0.5411765, 0, 1,
-1.259162, -0.4314007, -2.003472, 1, 0.5450981, 0, 1,
-1.25625, 0.7484114, -1.114832, 1, 0.5529412, 0, 1,
-1.244381, -0.9924077, -0.5411945, 1, 0.5568628, 0, 1,
-1.243632, -0.2758702, -1.482422, 1, 0.5647059, 0, 1,
-1.232253, 1.449164, 0.2605315, 1, 0.5686275, 0, 1,
-1.227682, 0.3201801, -0.8274791, 1, 0.5764706, 0, 1,
-1.215757, -0.01612788, -3.308897, 1, 0.5803922, 0, 1,
-1.215192, -0.5940846, -2.142633, 1, 0.5882353, 0, 1,
-1.190427, -0.685515, -4.149327, 1, 0.5921569, 0, 1,
-1.189702, 0.3792887, -1.8006, 1, 0.6, 0, 1,
-1.189249, -0.3510346, -1.214091, 1, 0.6078432, 0, 1,
-1.174883, 0.385691, -0.9994488, 1, 0.6117647, 0, 1,
-1.164405, 0.6326144, -0.3945049, 1, 0.6196079, 0, 1,
-1.1582, 0.6779059, -1.848506, 1, 0.6235294, 0, 1,
-1.133979, 0.720444, -3.361475, 1, 0.6313726, 0, 1,
-1.133799, 0.04110462, -2.910991, 1, 0.6352941, 0, 1,
-1.133774, 0.8970762, -0.9543242, 1, 0.6431373, 0, 1,
-1.128508, 0.5450227, -0.1550405, 1, 0.6470588, 0, 1,
-1.126913, -0.8499616, -1.503123, 1, 0.654902, 0, 1,
-1.122741, -0.3437831, -1.554365, 1, 0.6588235, 0, 1,
-1.122319, 0.4611636, -1.850862, 1, 0.6666667, 0, 1,
-1.121493, 0.8058671, -0.5242214, 1, 0.6705883, 0, 1,
-1.119269, -0.1495435, -0.5773664, 1, 0.6784314, 0, 1,
-1.115447, 0.4448879, -1.337695, 1, 0.682353, 0, 1,
-1.106988, 0.6595766, -1.369785, 1, 0.6901961, 0, 1,
-1.106072, 0.3811054, -1.295258, 1, 0.6941177, 0, 1,
-1.099656, 0.3937336, -0.7288859, 1, 0.7019608, 0, 1,
-1.098262, -1.146168, -1.579741, 1, 0.7098039, 0, 1,
-1.097567, 0.05290765, -2.994263, 1, 0.7137255, 0, 1,
-1.090982, 0.5064033, -0.9649217, 1, 0.7215686, 0, 1,
-1.089788, 0.3723359, -2.828942, 1, 0.7254902, 0, 1,
-1.086956, -1.82596, -0.6589183, 1, 0.7333333, 0, 1,
-1.078461, 0.01763538, 0.04369951, 1, 0.7372549, 0, 1,
-1.077976, -0.344042, -0.4692928, 1, 0.7450981, 0, 1,
-1.076636, -0.500334, -1.661878, 1, 0.7490196, 0, 1,
-1.067439, 1.412754, 0.1321699, 1, 0.7568628, 0, 1,
-1.064698, -2.588809, -4.106422, 1, 0.7607843, 0, 1,
-1.06329, -0.6639777, -1.299631, 1, 0.7686275, 0, 1,
-1.060582, 0.07739872, 0.4751473, 1, 0.772549, 0, 1,
-1.05192, 0.6424018, -0.5027021, 1, 0.7803922, 0, 1,
-1.045993, -0.6737502, -1.337638, 1, 0.7843137, 0, 1,
-1.041254, 0.5381734, -0.8280126, 1, 0.7921569, 0, 1,
-1.039293, -0.09224825, -1.311764, 1, 0.7960784, 0, 1,
-1.032823, -1.796147, -0.4332874, 1, 0.8039216, 0, 1,
-1.029276, -0.2998396, -0.3368056, 1, 0.8117647, 0, 1,
-1.027837, -0.8962852, -3.302771, 1, 0.8156863, 0, 1,
-1.026442, 1.589887, -1.558855, 1, 0.8235294, 0, 1,
-1.024429, 2.243536, 0.8203346, 1, 0.827451, 0, 1,
-1.022938, -0.4838601, -1.872234, 1, 0.8352941, 0, 1,
-1.022933, -1.710513, -2.959038, 1, 0.8392157, 0, 1,
-1.018419, 0.2989722, -1.636301, 1, 0.8470588, 0, 1,
-1.01787, 0.6653426, -2.107511, 1, 0.8509804, 0, 1,
-1.009094, -0.9297991, -3.169353, 1, 0.8588235, 0, 1,
-1.007308, -1.062177, -1.809782, 1, 0.8627451, 0, 1,
-1.003764, -1.224635, -1.230257, 1, 0.8705882, 0, 1,
-1.0035, 2.128585, -0.07155737, 1, 0.8745098, 0, 1,
-0.9970524, -0.8106059, -1.21176, 1, 0.8823529, 0, 1,
-0.9901031, 0.2623188, -0.01912341, 1, 0.8862745, 0, 1,
-0.9831318, 0.8269067, -1.14429, 1, 0.8941177, 0, 1,
-0.9812698, -0.8959774, -2.250627, 1, 0.8980392, 0, 1,
-0.9803901, 1.924314, 0.05229277, 1, 0.9058824, 0, 1,
-0.9727598, 0.5693541, 0.0413086, 1, 0.9137255, 0, 1,
-0.9661838, -0.3672917, -1.742213, 1, 0.9176471, 0, 1,
-0.9654303, -0.8231651, -1.659491, 1, 0.9254902, 0, 1,
-0.9645333, -0.11635, -2.073027, 1, 0.9294118, 0, 1,
-0.9590122, -0.8135899, -1.993542, 1, 0.9372549, 0, 1,
-0.9585204, 0.8700725, -1.706144, 1, 0.9411765, 0, 1,
-0.9548678, -0.1145779, -1.698588, 1, 0.9490196, 0, 1,
-0.9544691, -2.110682, -4.398776, 1, 0.9529412, 0, 1,
-0.9542326, 1.128955, -2.384648, 1, 0.9607843, 0, 1,
-0.9500167, 0.5265309, -0.6187482, 1, 0.9647059, 0, 1,
-0.9468536, -0.3092983, -2.272711, 1, 0.972549, 0, 1,
-0.946306, 0.1211347, -1.305454, 1, 0.9764706, 0, 1,
-0.946135, 0.5518007, -2.288802, 1, 0.9843137, 0, 1,
-0.9431843, 1.50125, -1.799077, 1, 0.9882353, 0, 1,
-0.9420804, 0.184146, -0.5839247, 1, 0.9960784, 0, 1,
-0.9386106, -0.01965909, -0.9350451, 0.9960784, 1, 0, 1,
-0.9327874, -0.6227713, -2.8116, 0.9921569, 1, 0, 1,
-0.9301602, 1.2285, -0.4060401, 0.9843137, 1, 0, 1,
-0.9297125, 0.1105782, -0.581097, 0.9803922, 1, 0, 1,
-0.9285251, -0.08549355, -2.589119, 0.972549, 1, 0, 1,
-0.9248391, -0.0263916, -2.187872, 0.9686275, 1, 0, 1,
-0.9229461, 0.4211834, -1.786477, 0.9607843, 1, 0, 1,
-0.917056, -0.04052625, -0.8417161, 0.9568627, 1, 0, 1,
-0.9166467, 1.246804, -1.648746, 0.9490196, 1, 0, 1,
-0.9039603, -0.9678342, -2.762202, 0.945098, 1, 0, 1,
-0.9030154, 1.428093, -0.8484425, 0.9372549, 1, 0, 1,
-0.8970064, -1.245328, -3.922117, 0.9333333, 1, 0, 1,
-0.8932679, 1.3802, -2.101011, 0.9254902, 1, 0, 1,
-0.8898153, 0.8346304, -0.6492002, 0.9215686, 1, 0, 1,
-0.8816723, -1.290833, -2.882195, 0.9137255, 1, 0, 1,
-0.8769558, -1.184527, -1.951856, 0.9098039, 1, 0, 1,
-0.875451, 1.033385, -1.682681, 0.9019608, 1, 0, 1,
-0.8751833, 0.1671658, -0.7895187, 0.8941177, 1, 0, 1,
-0.873797, -1.474812, -4.117018, 0.8901961, 1, 0, 1,
-0.8708082, 0.8287569, -0.8352877, 0.8823529, 1, 0, 1,
-0.8668091, 0.5830398, -0.4629225, 0.8784314, 1, 0, 1,
-0.8639185, 0.9414104, -2.177287, 0.8705882, 1, 0, 1,
-0.8565701, -0.7538309, -0.231083, 0.8666667, 1, 0, 1,
-0.8564059, -2.129556, -2.920875, 0.8588235, 1, 0, 1,
-0.854712, 0.3308289, -1.969539, 0.854902, 1, 0, 1,
-0.8479452, -0.09447685, -0.7117996, 0.8470588, 1, 0, 1,
-0.8417307, 0.3872879, -0.2787938, 0.8431373, 1, 0, 1,
-0.8412596, -1.336167, -3.134633, 0.8352941, 1, 0, 1,
-0.8403029, 0.07728707, -1.031003, 0.8313726, 1, 0, 1,
-0.8347345, 1.735201, -0.6203462, 0.8235294, 1, 0, 1,
-0.8345413, 1.685103, -0.008340387, 0.8196079, 1, 0, 1,
-0.8326849, -1.337925, -1.339043, 0.8117647, 1, 0, 1,
-0.8301454, 0.105115, 0.7241798, 0.8078431, 1, 0, 1,
-0.8209806, -1.299453, -2.620037, 0.8, 1, 0, 1,
-0.8154511, 0.2686757, 0.2575431, 0.7921569, 1, 0, 1,
-0.811122, -1.985507, -3.02607, 0.7882353, 1, 0, 1,
-0.810152, 1.391445, 0.9137481, 0.7803922, 1, 0, 1,
-0.8045529, -0.5321558, -0.5354391, 0.7764706, 1, 0, 1,
-0.8002803, -0.3915017, 0.9562374, 0.7686275, 1, 0, 1,
-0.7959607, -1.331563, -1.730761, 0.7647059, 1, 0, 1,
-0.7819258, 0.8562507, 0.01548997, 0.7568628, 1, 0, 1,
-0.780023, 0.7194851, -2.798099, 0.7529412, 1, 0, 1,
-0.774982, 0.3425477, 0.05798337, 0.7450981, 1, 0, 1,
-0.7732308, -1.970179, -3.037296, 0.7411765, 1, 0, 1,
-0.7721099, 1.005103, -1.030452, 0.7333333, 1, 0, 1,
-0.7650316, 0.546589, -1.106304, 0.7294118, 1, 0, 1,
-0.7611133, 1.304415, -0.7031242, 0.7215686, 1, 0, 1,
-0.7606514, -1.277743, -2.785697, 0.7176471, 1, 0, 1,
-0.7604095, -0.4561139, -4.104643, 0.7098039, 1, 0, 1,
-0.7594345, -1.432965, -1.822497, 0.7058824, 1, 0, 1,
-0.7586466, 0.3963987, -2.842313, 0.6980392, 1, 0, 1,
-0.7544967, -0.01490465, -0.9905243, 0.6901961, 1, 0, 1,
-0.75433, -0.007860679, -1.248218, 0.6862745, 1, 0, 1,
-0.7508002, -0.1971418, -2.346485, 0.6784314, 1, 0, 1,
-0.7439371, 0.4447192, 0.5110285, 0.6745098, 1, 0, 1,
-0.7408742, 2.565128, 0.3167356, 0.6666667, 1, 0, 1,
-0.7373039, -0.4019348, -2.904743, 0.6627451, 1, 0, 1,
-0.7370679, 1.613169, -1.26949, 0.654902, 1, 0, 1,
-0.7353755, -0.1970774, -1.58678, 0.6509804, 1, 0, 1,
-0.7344923, 2.22998, -2.463878, 0.6431373, 1, 0, 1,
-0.7337784, -2.33734, -2.204663, 0.6392157, 1, 0, 1,
-0.728627, -0.6028915, -2.423475, 0.6313726, 1, 0, 1,
-0.7246174, 0.721525, -0.2911856, 0.627451, 1, 0, 1,
-0.724273, 1.249076, -1.06995, 0.6196079, 1, 0, 1,
-0.7233239, -0.6039069, -2.334971, 0.6156863, 1, 0, 1,
-0.7152915, 0.8058602, -1.490409, 0.6078432, 1, 0, 1,
-0.7102962, 0.9457496, 0.3966133, 0.6039216, 1, 0, 1,
-0.7069962, 0.8708902, -1.903157, 0.5960785, 1, 0, 1,
-0.7039724, 0.3321863, -1.659466, 0.5882353, 1, 0, 1,
-0.697271, 0.4633135, -0.5355155, 0.5843138, 1, 0, 1,
-0.6964625, -1.729619, -2.227223, 0.5764706, 1, 0, 1,
-0.6959054, 0.4387642, -1.129768, 0.572549, 1, 0, 1,
-0.6952703, 0.7967037, -0.5890144, 0.5647059, 1, 0, 1,
-0.6921256, -1.805723, -3.72986, 0.5607843, 1, 0, 1,
-0.6913642, 0.2498442, 0.7595152, 0.5529412, 1, 0, 1,
-0.691266, 0.04704517, -0.9158317, 0.5490196, 1, 0, 1,
-0.6887558, 1.148218, 1.101879, 0.5411765, 1, 0, 1,
-0.6857494, -0.2659746, -0.9647001, 0.5372549, 1, 0, 1,
-0.6824529, -2.130393, -2.894456, 0.5294118, 1, 0, 1,
-0.6809258, -0.06219904, -1.600798, 0.5254902, 1, 0, 1,
-0.6709511, 0.18357, -0.8482128, 0.5176471, 1, 0, 1,
-0.6704075, 1.137503, -0.3566571, 0.5137255, 1, 0, 1,
-0.6693305, -0.7034545, -4.978442, 0.5058824, 1, 0, 1,
-0.6687014, 1.644789, 0.01878252, 0.5019608, 1, 0, 1,
-0.6631052, -0.463288, -2.515766, 0.4941176, 1, 0, 1,
-0.6599113, -0.3625584, -0.6825981, 0.4862745, 1, 0, 1,
-0.6590582, -0.7829157, -2.398914, 0.4823529, 1, 0, 1,
-0.6579167, -0.3712753, -0.1913868, 0.4745098, 1, 0, 1,
-0.6564404, 0.8934221, -0.2109755, 0.4705882, 1, 0, 1,
-0.6532363, -0.5234432, -2.536447, 0.4627451, 1, 0, 1,
-0.6531772, -0.5793977, -3.106509, 0.4588235, 1, 0, 1,
-0.6526019, -0.1493574, -1.623281, 0.4509804, 1, 0, 1,
-0.6456636, -0.3607182, -2.105168, 0.4470588, 1, 0, 1,
-0.6441312, -0.9915808, -1.679026, 0.4392157, 1, 0, 1,
-0.6395766, 1.178907, 0.5962067, 0.4352941, 1, 0, 1,
-0.6352067, 0.3592192, -0.6858719, 0.427451, 1, 0, 1,
-0.6327665, -0.05874971, -0.731115, 0.4235294, 1, 0, 1,
-0.6315404, 0.05768898, -1.011516, 0.4156863, 1, 0, 1,
-0.6288295, 0.02858429, -1.922234, 0.4117647, 1, 0, 1,
-0.6269809, -0.8466631, -3.229703, 0.4039216, 1, 0, 1,
-0.6250569, 1.339765, -0.5114779, 0.3960784, 1, 0, 1,
-0.6233728, 0.08853392, -1.010388, 0.3921569, 1, 0, 1,
-0.616349, 0.5965999, 0.44651, 0.3843137, 1, 0, 1,
-0.6153438, 0.9855897, -0.8985543, 0.3803922, 1, 0, 1,
-0.6123824, -0.5356039, -2.546378, 0.372549, 1, 0, 1,
-0.6118782, 1.126616, 0.871433, 0.3686275, 1, 0, 1,
-0.6098381, 1.19893, -0.4759826, 0.3607843, 1, 0, 1,
-0.5971197, 1.076928, -1.076783, 0.3568628, 1, 0, 1,
-0.5966471, -2.038791, -2.929534, 0.3490196, 1, 0, 1,
-0.5965156, 1.386512, -0.9415215, 0.345098, 1, 0, 1,
-0.5960934, -1.719617, -4.44796, 0.3372549, 1, 0, 1,
-0.5956277, 0.2174834, -2.219237, 0.3333333, 1, 0, 1,
-0.5936724, -0.06768613, -2.494114, 0.3254902, 1, 0, 1,
-0.5894675, -0.2328499, 1.511804, 0.3215686, 1, 0, 1,
-0.587881, 0.4292052, -0.3302064, 0.3137255, 1, 0, 1,
-0.5806187, 1.076541, 0.2704619, 0.3098039, 1, 0, 1,
-0.5804126, 0.4051043, -1.584765, 0.3019608, 1, 0, 1,
-0.5720932, 0.5710742, -1.046425, 0.2941177, 1, 0, 1,
-0.5711851, 0.5248019, -0.7058082, 0.2901961, 1, 0, 1,
-0.5706343, 1.137386, 0.2474418, 0.282353, 1, 0, 1,
-0.5675573, 0.8352308, 0.9935299, 0.2784314, 1, 0, 1,
-0.5663955, -0.2358034, -2.824156, 0.2705882, 1, 0, 1,
-0.5589489, 1.275837, 0.9944281, 0.2666667, 1, 0, 1,
-0.5573902, -0.247519, -2.577012, 0.2588235, 1, 0, 1,
-0.5537665, -0.161936, -2.460877, 0.254902, 1, 0, 1,
-0.553027, 0.4300081, -2.939127, 0.2470588, 1, 0, 1,
-0.5461948, -0.2711718, -0.9909061, 0.2431373, 1, 0, 1,
-0.5457881, 1.116622, -1.517803, 0.2352941, 1, 0, 1,
-0.5428042, -0.1225174, -3.998316, 0.2313726, 1, 0, 1,
-0.5402825, -0.0456624, -2.825135, 0.2235294, 1, 0, 1,
-0.5345877, -1.429888, -3.200547, 0.2196078, 1, 0, 1,
-0.5323082, 0.8148898, -1.102906, 0.2117647, 1, 0, 1,
-0.5273979, 0.5074651, -1.262003, 0.2078431, 1, 0, 1,
-0.5268285, 0.8048394, -0.1527784, 0.2, 1, 0, 1,
-0.5236713, -2.198613, -1.409026, 0.1921569, 1, 0, 1,
-0.5208935, -0.5885789, -1.988001, 0.1882353, 1, 0, 1,
-0.5205265, -0.5556133, -2.240407, 0.1803922, 1, 0, 1,
-0.51772, 0.06057559, -0.3033319, 0.1764706, 1, 0, 1,
-0.511435, -0.3700953, -2.492836, 0.1686275, 1, 0, 1,
-0.5112426, -0.3358245, -2.521592, 0.1647059, 1, 0, 1,
-0.5084469, 0.2830614, -0.2846791, 0.1568628, 1, 0, 1,
-0.5029061, -0.0664527, -0.9986836, 0.1529412, 1, 0, 1,
-0.4988413, 1.41434, -0.04526294, 0.145098, 1, 0, 1,
-0.498767, -0.6324688, -4.0474, 0.1411765, 1, 0, 1,
-0.4938973, -1.149806, -4.519047, 0.1333333, 1, 0, 1,
-0.4933193, 1.520369, 0.5307384, 0.1294118, 1, 0, 1,
-0.4926026, 0.9930476, -1.189515, 0.1215686, 1, 0, 1,
-0.4925806, 0.4195331, -1.502566, 0.1176471, 1, 0, 1,
-0.490475, -0.4041842, -3.128289, 0.1098039, 1, 0, 1,
-0.4882891, -0.6648809, -1.697581, 0.1058824, 1, 0, 1,
-0.4858905, -0.3135359, -1.201127, 0.09803922, 1, 0, 1,
-0.4857962, -0.317322, -3.096212, 0.09019608, 1, 0, 1,
-0.4842672, -1.106666, -4.228858, 0.08627451, 1, 0, 1,
-0.4842338, 0.453233, -0.9306518, 0.07843138, 1, 0, 1,
-0.4821941, -1.454966, -3.175926, 0.07450981, 1, 0, 1,
-0.4791466, -1.397058, -2.825798, 0.06666667, 1, 0, 1,
-0.4755918, -1.050354, -3.308281, 0.0627451, 1, 0, 1,
-0.4683312, 1.416646, 0.9832029, 0.05490196, 1, 0, 1,
-0.4645648, 1.113473, -0.3177754, 0.05098039, 1, 0, 1,
-0.4623607, -2.240353, -1.593072, 0.04313726, 1, 0, 1,
-0.4619689, 1.155398, 0.3976309, 0.03921569, 1, 0, 1,
-0.4615889, -1.346228, -2.621386, 0.03137255, 1, 0, 1,
-0.4600334, -0.4637936, -3.140367, 0.02745098, 1, 0, 1,
-0.4591835, 1.162957, 1.010695, 0.01960784, 1, 0, 1,
-0.4580486, -0.9824298, -2.822646, 0.01568628, 1, 0, 1,
-0.4562914, -1.090689, -2.832534, 0.007843138, 1, 0, 1,
-0.4513797, 0.4714556, -0.4092339, 0.003921569, 1, 0, 1,
-0.4491982, -0.5566217, -1.158614, 0, 1, 0.003921569, 1,
-0.4457717, 0.473529, -0.9536384, 0, 1, 0.01176471, 1,
-0.4315386, -0.3389826, -2.897321, 0, 1, 0.01568628, 1,
-0.4299302, 1.048845, -1.651868, 0, 1, 0.02352941, 1,
-0.4262067, -0.6074695, -0.9530052, 0, 1, 0.02745098, 1,
-0.4243423, -0.861398, -1.298319, 0, 1, 0.03529412, 1,
-0.4163673, 0.1991637, -1.700847, 0, 1, 0.03921569, 1,
-0.4162163, -0.2462594, -4.26557, 0, 1, 0.04705882, 1,
-0.415138, -0.03672175, -0.6824965, 0, 1, 0.05098039, 1,
-0.4128022, -1.165503, -3.010226, 0, 1, 0.05882353, 1,
-0.4110121, 0.01446982, 0.1194182, 0, 1, 0.0627451, 1,
-0.4090963, -1.136337, -4.093317, 0, 1, 0.07058824, 1,
-0.4089941, -0.07954145, -2.740808, 0, 1, 0.07450981, 1,
-0.4084187, -1.032147, -3.247084, 0, 1, 0.08235294, 1,
-0.4050905, -0.4375994, -1.613499, 0, 1, 0.08627451, 1,
-0.4046848, -1.286612, -2.75105, 0, 1, 0.09411765, 1,
-0.4037874, 0.4909025, -1.348096, 0, 1, 0.1019608, 1,
-0.3999252, 0.7717201, 1.781609, 0, 1, 0.1058824, 1,
-0.3971029, 0.1263113, -0.3614339, 0, 1, 0.1137255, 1,
-0.3966725, -0.3185836, -1.3567, 0, 1, 0.1176471, 1,
-0.3965551, -0.07347415, -0.1143071, 0, 1, 0.1254902, 1,
-0.3925863, 0.1777829, -1.673684, 0, 1, 0.1294118, 1,
-0.3911026, -0.7170166, -2.458945, 0, 1, 0.1372549, 1,
-0.3828644, -0.6369808, -3.027022, 0, 1, 0.1411765, 1,
-0.3825225, -1.097604, -4.831167, 0, 1, 0.1490196, 1,
-0.3821239, -2.032515, -3.900064, 0, 1, 0.1529412, 1,
-0.3803395, 0.3704047, -0.4579033, 0, 1, 0.1607843, 1,
-0.3801619, -1.867038, -2.837844, 0, 1, 0.1647059, 1,
-0.3709374, -0.423362, -2.520713, 0, 1, 0.172549, 1,
-0.3707851, 0.4746131, 0.2347538, 0, 1, 0.1764706, 1,
-0.3692714, -0.4750732, -2.50471, 0, 1, 0.1843137, 1,
-0.369128, 1.150481, -0.4274868, 0, 1, 0.1882353, 1,
-0.3687812, 1.136932, -0.3057772, 0, 1, 0.1960784, 1,
-0.3687391, -0.591531, -2.163131, 0, 1, 0.2039216, 1,
-0.3685467, 0.05318944, -2.395536, 0, 1, 0.2078431, 1,
-0.359008, -1.09185, -2.676621, 0, 1, 0.2156863, 1,
-0.3589524, -1.641672, -4.247246, 0, 1, 0.2196078, 1,
-0.358609, -0.4485618, -4.204099, 0, 1, 0.227451, 1,
-0.35656, 0.5625206, 0.2430641, 0, 1, 0.2313726, 1,
-0.3565592, 0.5352564, -1.548981, 0, 1, 0.2392157, 1,
-0.355206, -0.2501836, -1.104633, 0, 1, 0.2431373, 1,
-0.3521062, -0.2643771, -0.4083112, 0, 1, 0.2509804, 1,
-0.3488396, 0.9765854, -0.4190726, 0, 1, 0.254902, 1,
-0.3467169, -0.2002683, -3.273849, 0, 1, 0.2627451, 1,
-0.345974, -0.2305278, -1.987366, 0, 1, 0.2666667, 1,
-0.338948, 0.4181515, -0.7286379, 0, 1, 0.2745098, 1,
-0.3332765, -0.2165214, -2.353793, 0, 1, 0.2784314, 1,
-0.3288695, 1.890637, 1.306603, 0, 1, 0.2862745, 1,
-0.327108, -0.3623491, -3.607986, 0, 1, 0.2901961, 1,
-0.3270662, 0.8549547, 0.1534901, 0, 1, 0.2980392, 1,
-0.32706, -1.193144, -4.272348, 0, 1, 0.3058824, 1,
-0.3224238, -0.5304635, -4.738438, 0, 1, 0.3098039, 1,
-0.3199839, -0.7321295, -1.427207, 0, 1, 0.3176471, 1,
-0.3193847, -0.8567943, -1.975914, 0, 1, 0.3215686, 1,
-0.3178926, 0.330894, -0.895025, 0, 1, 0.3294118, 1,
-0.3155779, 1.172089, -1.499791, 0, 1, 0.3333333, 1,
-0.3154557, -0.3899287, -2.69227, 0, 1, 0.3411765, 1,
-0.3146297, 0.2617552, 0.8499182, 0, 1, 0.345098, 1,
-0.3142687, -1.900959, -2.551685, 0, 1, 0.3529412, 1,
-0.3126335, -1.546629, -2.731665, 0, 1, 0.3568628, 1,
-0.3097097, 0.1161099, -1.043435, 0, 1, 0.3647059, 1,
-0.3047778, -1.821388, -3.272181, 0, 1, 0.3686275, 1,
-0.3040434, 0.9123127, -1.185702, 0, 1, 0.3764706, 1,
-0.3030546, -1.79332, -3.98443, 0, 1, 0.3803922, 1,
-0.300685, -1.189647, -1.997556, 0, 1, 0.3882353, 1,
-0.3005691, -1.124242, -3.864673, 0, 1, 0.3921569, 1,
-0.2980479, -0.4242431, -1.569673, 0, 1, 0.4, 1,
-0.2970501, 0.8028421, 0.07930304, 0, 1, 0.4078431, 1,
-0.2940091, 1.262286, -0.005488457, 0, 1, 0.4117647, 1,
-0.2920809, -0.7906522, -4.159276, 0, 1, 0.4196078, 1,
-0.2870637, -0.4217214, -2.916651, 0, 1, 0.4235294, 1,
-0.2864522, -0.4661455, -1.250992, 0, 1, 0.4313726, 1,
-0.2840319, -1.883009, -4.033443, 0, 1, 0.4352941, 1,
-0.2835531, -0.649419, -1.914449, 0, 1, 0.4431373, 1,
-0.2791797, -0.6256009, -2.826248, 0, 1, 0.4470588, 1,
-0.269835, -1.16874, -3.850786, 0, 1, 0.454902, 1,
-0.2696557, 0.9735274, 0.7670774, 0, 1, 0.4588235, 1,
-0.2696025, 0.1280544, -1.827781, 0, 1, 0.4666667, 1,
-0.2678226, 0.4367222, -0.1487471, 0, 1, 0.4705882, 1,
-0.2645616, 0.3561336, -0.5020733, 0, 1, 0.4784314, 1,
-0.248679, -1.150712, -4.217984, 0, 1, 0.4823529, 1,
-0.2486394, -1.149443, -1.156806, 0, 1, 0.4901961, 1,
-0.2464218, 0.6217783, -0.4377124, 0, 1, 0.4941176, 1,
-0.2435458, -0.223016, -1.849786, 0, 1, 0.5019608, 1,
-0.2352262, 1.35207, 0.3368927, 0, 1, 0.509804, 1,
-0.2303987, -0.2058371, -2.146434, 0, 1, 0.5137255, 1,
-0.2287749, -0.1433794, -4.064098, 0, 1, 0.5215687, 1,
-0.2252493, -2.098616, -1.581353, 0, 1, 0.5254902, 1,
-0.2235543, -0.5284209, -2.051309, 0, 1, 0.5333334, 1,
-0.2201918, -0.7751305, -3.14211, 0, 1, 0.5372549, 1,
-0.2194716, 0.9526915, -0.712907, 0, 1, 0.5450981, 1,
-0.2193454, 0.1579009, -0.4091874, 0, 1, 0.5490196, 1,
-0.2173115, -0.7382094, -2.170024, 0, 1, 0.5568628, 1,
-0.2166308, -0.1687318, -2.967843, 0, 1, 0.5607843, 1,
-0.2065625, 0.3733896, 0.01319896, 0, 1, 0.5686275, 1,
-0.2061511, 0.8636736, 1.884856, 0, 1, 0.572549, 1,
-0.2020261, -0.9740142, -2.584893, 0, 1, 0.5803922, 1,
-0.2017578, -0.5223901, -1.998423, 0, 1, 0.5843138, 1,
-0.1996491, -0.7157767, -1.62966, 0, 1, 0.5921569, 1,
-0.1980498, -0.3076409, -0.3246055, 0, 1, 0.5960785, 1,
-0.1885536, -1.102851, -3.701051, 0, 1, 0.6039216, 1,
-0.188014, -0.1590255, -3.899403, 0, 1, 0.6117647, 1,
-0.18785, -0.0344749, -0.9926779, 0, 1, 0.6156863, 1,
-0.1854422, -0.3339867, -3.865229, 0, 1, 0.6235294, 1,
-0.1842404, -0.765994, -2.832094, 0, 1, 0.627451, 1,
-0.1826326, 0.9848095, -0.8420022, 0, 1, 0.6352941, 1,
-0.1792767, 0.2138263, -1.106473, 0, 1, 0.6392157, 1,
-0.1756572, -0.09068784, -1.402361, 0, 1, 0.6470588, 1,
-0.1720921, -0.5714708, -2.04443, 0, 1, 0.6509804, 1,
-0.1717366, -0.6518818, -2.789265, 0, 1, 0.6588235, 1,
-0.1702056, -0.9097919, -4.229703, 0, 1, 0.6627451, 1,
-0.1696701, 0.5564508, -0.383144, 0, 1, 0.6705883, 1,
-0.1651067, -1.569251, -4.498549, 0, 1, 0.6745098, 1,
-0.1635562, -0.5903261, -4.168012, 0, 1, 0.682353, 1,
-0.162531, -0.280801, -2.578992, 0, 1, 0.6862745, 1,
-0.1621743, -0.4866218, -3.06107, 0, 1, 0.6941177, 1,
-0.1616169, 0.319794, -0.6600106, 0, 1, 0.7019608, 1,
-0.1569624, 0.594244, 1.207877, 0, 1, 0.7058824, 1,
-0.1568672, 0.8042263, -0.3786097, 0, 1, 0.7137255, 1,
-0.1560837, -1.525299, -3.629878, 0, 1, 0.7176471, 1,
-0.1536832, 0.1830889, -1.355342, 0, 1, 0.7254902, 1,
-0.1525311, 0.5636511, -0.9396226, 0, 1, 0.7294118, 1,
-0.1495411, 0.0859245, 0.02114397, 0, 1, 0.7372549, 1,
-0.1416794, 0.8078348, -1.314254, 0, 1, 0.7411765, 1,
-0.1394813, 0.8486115, 1.338939, 0, 1, 0.7490196, 1,
-0.1385778, 0.2058072, -1.71353, 0, 1, 0.7529412, 1,
-0.1380081, 0.520072, 0.5975748, 0, 1, 0.7607843, 1,
-0.1304661, -1.423669, -2.333, 0, 1, 0.7647059, 1,
-0.1296191, -0.4909161, -3.828394, 0, 1, 0.772549, 1,
-0.1285526, 1.068158, 0.5454447, 0, 1, 0.7764706, 1,
-0.1265699, 0.4814266, -1.401366, 0, 1, 0.7843137, 1,
-0.121649, -0.0123136, -4.121456, 0, 1, 0.7882353, 1,
-0.1168849, -0.5897056, -2.572532, 0, 1, 0.7960784, 1,
-0.112586, 0.7594123, -1.560798, 0, 1, 0.8039216, 1,
-0.1093058, 0.6791249, -0.2318233, 0, 1, 0.8078431, 1,
-0.108135, -0.002545538, -1.84762, 0, 1, 0.8156863, 1,
-0.1054007, 1.054639, -0.339267, 0, 1, 0.8196079, 1,
-0.1053763, -0.1830233, -2.878697, 0, 1, 0.827451, 1,
-0.1050833, -0.6833093, -1.210576, 0, 1, 0.8313726, 1,
-0.1043501, -0.7202553, -5.25681, 0, 1, 0.8392157, 1,
-0.103452, 0.4164636, -0.5046604, 0, 1, 0.8431373, 1,
-0.1014936, 1.008176, -0.9967167, 0, 1, 0.8509804, 1,
-0.09961686, 1.023551, -0.5136281, 0, 1, 0.854902, 1,
-0.0979683, 0.2747468, -0.9982803, 0, 1, 0.8627451, 1,
-0.09796143, -0.2991156, -1.551051, 0, 1, 0.8666667, 1,
-0.09741153, 0.7377943, -0.3528285, 0, 1, 0.8745098, 1,
-0.09513849, -1.4029, -1.871032, 0, 1, 0.8784314, 1,
-0.09382463, 0.997883, 0.2726428, 0, 1, 0.8862745, 1,
-0.08578227, 0.1176061, -1.364324, 0, 1, 0.8901961, 1,
-0.08456335, -0.1201247, -5.027687, 0, 1, 0.8980392, 1,
-0.0798365, 0.5312731, -0.6848775, 0, 1, 0.9058824, 1,
-0.07936716, -1.097326, -2.158539, 0, 1, 0.9098039, 1,
-0.07813591, -0.8434343, -3.785029, 0, 1, 0.9176471, 1,
-0.07601879, -0.07018574, -0.9939423, 0, 1, 0.9215686, 1,
-0.07324316, 0.5466357, -2.082126, 0, 1, 0.9294118, 1,
-0.07191037, -2.027295, -3.330031, 0, 1, 0.9333333, 1,
-0.06283116, 0.9569139, 0.1314923, 0, 1, 0.9411765, 1,
-0.06124001, -0.1873718, -3.19175, 0, 1, 0.945098, 1,
-0.05217559, 1.119483, 0.916862, 0, 1, 0.9529412, 1,
-0.05093888, 1.325046, 2.095953, 0, 1, 0.9568627, 1,
-0.04937671, 1.720119, 0.4838676, 0, 1, 0.9647059, 1,
-0.04798991, 1.210802, 0.7274482, 0, 1, 0.9686275, 1,
-0.04794186, -0.5016031, -2.3886, 0, 1, 0.9764706, 1,
-0.04632849, -1.079394, -2.485705, 0, 1, 0.9803922, 1,
-0.0458708, 0.5043179, -0.3330325, 0, 1, 0.9882353, 1,
-0.04444095, 1.049044, 1.240422, 0, 1, 0.9921569, 1,
-0.04382183, 0.6979222, 0.2991518, 0, 1, 1, 1,
-0.04280773, 1.235545, 0.3219958, 0, 0.9921569, 1, 1,
-0.04271455, -1.159731, -3.261055, 0, 0.9882353, 1, 1,
-0.03632314, 0.2956622, 0.6886502, 0, 0.9803922, 1, 1,
-0.03599021, 0.7714488, -1.01386, 0, 0.9764706, 1, 1,
-0.03509745, -0.1224298, -3.828712, 0, 0.9686275, 1, 1,
-0.02969681, -1.469474, -2.355747, 0, 0.9647059, 1, 1,
-0.02929459, 1.532543, 0.7376485, 0, 0.9568627, 1, 1,
-0.02668964, 1.007624, -1.061549, 0, 0.9529412, 1, 1,
-0.02664628, -0.7916192, -2.2517, 0, 0.945098, 1, 1,
-0.02325385, -0.8148234, -2.182812, 0, 0.9411765, 1, 1,
-0.0207754, -0.7610891, -1.702779, 0, 0.9333333, 1, 1,
-0.01968416, 0.2057581, -0.280533, 0, 0.9294118, 1, 1,
-0.01937233, 0.1284238, 0.7808836, 0, 0.9215686, 1, 1,
-0.01901699, -1.400228, -3.059024, 0, 0.9176471, 1, 1,
-0.01291587, 0.7455384, -0.9647307, 0, 0.9098039, 1, 1,
-0.009598339, 0.4888565, 0.4851227, 0, 0.9058824, 1, 1,
-0.009252377, 1.132849, 1.92059, 0, 0.8980392, 1, 1,
-0.006838953, 1.064129, 1.237951, 0, 0.8901961, 1, 1,
-0.006294538, 0.199644, -0.1413694, 0, 0.8862745, 1, 1,
-0.005239706, 0.2625072, 1.173515, 0, 0.8784314, 1, 1,
-0.004662433, 2.342364, 1.49261, 0, 0.8745098, 1, 1,
-0.0002278849, 1.319145, 1.02232, 0, 0.8666667, 1, 1,
0.002415886, -0.2617513, 5.114023, 0, 0.8627451, 1, 1,
0.005081483, 0.3138911, 0.3705183, 0, 0.854902, 1, 1,
0.01032049, -1.409807, 4.319184, 0, 0.8509804, 1, 1,
0.01158974, -1.847239, 1.941897, 0, 0.8431373, 1, 1,
0.0139094, 1.424487, 0.4298949, 0, 0.8392157, 1, 1,
0.01508593, 1.087576, -0.8121997, 0, 0.8313726, 1, 1,
0.01544454, -0.3711249, 4.79735, 0, 0.827451, 1, 1,
0.02255973, -0.5367821, 3.396582, 0, 0.8196079, 1, 1,
0.02400877, -0.0008984955, -0.06048635, 0, 0.8156863, 1, 1,
0.02649355, -0.745746, 2.462361, 0, 0.8078431, 1, 1,
0.02750495, -0.2969378, 2.16336, 0, 0.8039216, 1, 1,
0.04288299, 1.515887, 0.2293658, 0, 0.7960784, 1, 1,
0.0433434, 0.2564763, 2.791436, 0, 0.7882353, 1, 1,
0.04512694, -0.007973297, 2.145505, 0, 0.7843137, 1, 1,
0.04621848, 1.608057, -0.02416193, 0, 0.7764706, 1, 1,
0.04624911, -0.7133226, 2.668715, 0, 0.772549, 1, 1,
0.04892635, -0.611066, 3.815809, 0, 0.7647059, 1, 1,
0.05397207, 0.517647, -1.145347, 0, 0.7607843, 1, 1,
0.05434292, 0.3871998, 0.3703139, 0, 0.7529412, 1, 1,
0.05571513, -0.3432914, 2.444777, 0, 0.7490196, 1, 1,
0.05603247, -0.6515836, 2.938622, 0, 0.7411765, 1, 1,
0.0568559, -0.4734726, 1.467336, 0, 0.7372549, 1, 1,
0.05813327, -1.315073, 2.126186, 0, 0.7294118, 1, 1,
0.06076496, -0.2406855, 3.362096, 0, 0.7254902, 1, 1,
0.06118425, 0.0580274, -0.09735908, 0, 0.7176471, 1, 1,
0.06187594, -0.07617323, 1.682134, 0, 0.7137255, 1, 1,
0.06590834, -1.88203, 3.704507, 0, 0.7058824, 1, 1,
0.06723993, -1.878394, 2.966447, 0, 0.6980392, 1, 1,
0.06944127, 1.500154, 0.2973768, 0, 0.6941177, 1, 1,
0.06958748, -0.6244696, 2.952722, 0, 0.6862745, 1, 1,
0.08172668, 1.287686, 0.3751862, 0, 0.682353, 1, 1,
0.08749489, 1.519266, 1.202185, 0, 0.6745098, 1, 1,
0.08991756, -0.1421816, 2.4007, 0, 0.6705883, 1, 1,
0.09285586, 0.03905034, 2.859015, 0, 0.6627451, 1, 1,
0.09415309, -0.01007246, 2.321416, 0, 0.6588235, 1, 1,
0.09630616, 1.77576, -0.9341748, 0, 0.6509804, 1, 1,
0.09700513, -0.1267763, 2.6009, 0, 0.6470588, 1, 1,
0.09860853, 0.4524027, 0.8176748, 0, 0.6392157, 1, 1,
0.109556, 0.1215172, 0.5088194, 0, 0.6352941, 1, 1,
0.1104273, 0.4754221, -1.298644, 0, 0.627451, 1, 1,
0.112942, 0.05355069, 2.11589, 0, 0.6235294, 1, 1,
0.1176507, 1.002844, -0.6174203, 0, 0.6156863, 1, 1,
0.1194383, -0.5619308, 1.686747, 0, 0.6117647, 1, 1,
0.1195656, 0.8142466, -1.371339, 0, 0.6039216, 1, 1,
0.1211614, -0.4096445, 1.599068, 0, 0.5960785, 1, 1,
0.1227271, 1.42933, 0.1006185, 0, 0.5921569, 1, 1,
0.1242048, 1.083299, 0.1137617, 0, 0.5843138, 1, 1,
0.1247011, -0.8714421, 4.412401, 0, 0.5803922, 1, 1,
0.1340946, 1.41811, 0.25401, 0, 0.572549, 1, 1,
0.1364474, 1.498634, -0.5742226, 0, 0.5686275, 1, 1,
0.1393045, -0.5796514, 4.430191, 0, 0.5607843, 1, 1,
0.1399383, 1.138206, 0.03623432, 0, 0.5568628, 1, 1,
0.1400195, 0.3441305, -0.6033637, 0, 0.5490196, 1, 1,
0.1414034, 1.600395, 0.02884783, 0, 0.5450981, 1, 1,
0.1471083, 1.248244, 1.07138, 0, 0.5372549, 1, 1,
0.148303, 4.177876, -0.1094132, 0, 0.5333334, 1, 1,
0.1517202, -0.2571518, 2.414241, 0, 0.5254902, 1, 1,
0.1548748, -0.8437642, 3.559648, 0, 0.5215687, 1, 1,
0.1566532, -0.4378027, 4.254376, 0, 0.5137255, 1, 1,
0.157701, 0.2894521, 0.3896346, 0, 0.509804, 1, 1,
0.1581371, 1.296433, 1.892971, 0, 0.5019608, 1, 1,
0.1677438, 0.7860404, 0.8338329, 0, 0.4941176, 1, 1,
0.1724535, 0.7027134, 0.002040923, 0, 0.4901961, 1, 1,
0.1780856, 0.4356446, 0.6860664, 0, 0.4823529, 1, 1,
0.1788672, 0.9596711, -0.1566093, 0, 0.4784314, 1, 1,
0.1830706, -0.9001479, 4.168246, 0, 0.4705882, 1, 1,
0.1870115, 0.01031113, 2.650962, 0, 0.4666667, 1, 1,
0.1896308, -1.360636, 4.586909, 0, 0.4588235, 1, 1,
0.192045, 0.1172106, -0.2014899, 0, 0.454902, 1, 1,
0.1931966, -0.1328258, 2.150032, 0, 0.4470588, 1, 1,
0.1934418, -1.138599, 2.758037, 0, 0.4431373, 1, 1,
0.1959802, -0.1411879, 3.095319, 0, 0.4352941, 1, 1,
0.1984051, -0.4579943, 4.063807, 0, 0.4313726, 1, 1,
0.1997305, 0.6124402, -0.7032835, 0, 0.4235294, 1, 1,
0.2008023, 0.1820205, 0.5389691, 0, 0.4196078, 1, 1,
0.2016688, 0.6787761, -1.374224, 0, 0.4117647, 1, 1,
0.2062141, 0.06892674, 2.113932, 0, 0.4078431, 1, 1,
0.2076985, 0.7326649, 1.480579, 0, 0.4, 1, 1,
0.2094738, -1.615375, 5.077143, 0, 0.3921569, 1, 1,
0.2128872, 1.342066, 0.5702265, 0, 0.3882353, 1, 1,
0.2147553, -1.715364, 3.381855, 0, 0.3803922, 1, 1,
0.2150156, -0.06739693, 1.609751, 0, 0.3764706, 1, 1,
0.2191494, -1.283663, 3.169156, 0, 0.3686275, 1, 1,
0.2226061, -0.5629143, 1.735312, 0, 0.3647059, 1, 1,
0.2258888, 0.7060379, 1.736178, 0, 0.3568628, 1, 1,
0.2295517, -0.5836716, 2.341072, 0, 0.3529412, 1, 1,
0.2305519, 0.4686053, -0.1985527, 0, 0.345098, 1, 1,
0.2350889, 0.4824972, 0.969071, 0, 0.3411765, 1, 1,
0.2375896, 0.6210381, 0.5336499, 0, 0.3333333, 1, 1,
0.2395638, 0.9543823, 0.8053139, 0, 0.3294118, 1, 1,
0.2423986, 0.4409475, 0.1229558, 0, 0.3215686, 1, 1,
0.248145, 1.380643, 0.7530117, 0, 0.3176471, 1, 1,
0.2484815, -0.8253481, 1.595024, 0, 0.3098039, 1, 1,
0.2488466, -1.563511, 4.941103, 0, 0.3058824, 1, 1,
0.2510459, 0.2657368, 1.825478, 0, 0.2980392, 1, 1,
0.2534017, -0.4755197, 2.431164, 0, 0.2901961, 1, 1,
0.2546721, -0.9747814, 2.83489, 0, 0.2862745, 1, 1,
0.2549394, 0.5357156, 1.593113, 0, 0.2784314, 1, 1,
0.2565129, 0.8359583, 0.7932315, 0, 0.2745098, 1, 1,
0.2602023, 1.081028, -0.5966134, 0, 0.2666667, 1, 1,
0.2623368, -0.4374109, 0.9830862, 0, 0.2627451, 1, 1,
0.2636291, -0.3570284, 1.933285, 0, 0.254902, 1, 1,
0.2645867, -1.92001, 2.995862, 0, 0.2509804, 1, 1,
0.2660466, -2.043153, 2.054772, 0, 0.2431373, 1, 1,
0.2674113, 0.1150952, 0.9530096, 0, 0.2392157, 1, 1,
0.2679314, 2.32744, -0.8660293, 0, 0.2313726, 1, 1,
0.2686574, 1.728251, -0.2951376, 0, 0.227451, 1, 1,
0.2703252, -3.157021, 2.054079, 0, 0.2196078, 1, 1,
0.2709035, -0.1623322, 1.481842, 0, 0.2156863, 1, 1,
0.2784999, -0.02417661, 0.01714271, 0, 0.2078431, 1, 1,
0.2850363, -0.6052862, 4.571624, 0, 0.2039216, 1, 1,
0.2896531, 0.1997842, -0.4765811, 0, 0.1960784, 1, 1,
0.2953422, 0.3396793, -0.8992032, 0, 0.1882353, 1, 1,
0.2974783, -0.3545577, 2.343506, 0, 0.1843137, 1, 1,
0.303229, 0.2940829, 1.138044, 0, 0.1764706, 1, 1,
0.3044155, -0.06418993, 1.660612, 0, 0.172549, 1, 1,
0.3062157, -1.544015, 3.232995, 0, 0.1647059, 1, 1,
0.3074022, -1.995324, 3.404837, 0, 0.1607843, 1, 1,
0.3080909, 0.5028356, -0.2341658, 0, 0.1529412, 1, 1,
0.3092711, 0.05444644, 3.009197, 0, 0.1490196, 1, 1,
0.3098378, -0.07844079, 2.818238, 0, 0.1411765, 1, 1,
0.3147518, -0.7745342, 2.438437, 0, 0.1372549, 1, 1,
0.3150957, 0.4854924, 0.2460472, 0, 0.1294118, 1, 1,
0.3154934, -0.2759223, 3.566116, 0, 0.1254902, 1, 1,
0.316367, -0.1870703, 3.491133, 0, 0.1176471, 1, 1,
0.3166204, -0.7768681, 1.940699, 0, 0.1137255, 1, 1,
0.3210825, 0.09914222, 1.622336, 0, 0.1058824, 1, 1,
0.3261924, -0.7611605, 2.99741, 0, 0.09803922, 1, 1,
0.328848, -1.651439, 2.206624, 0, 0.09411765, 1, 1,
0.3393313, 1.073098, 0.6456605, 0, 0.08627451, 1, 1,
0.3403252, 1.226084, -0.6215454, 0, 0.08235294, 1, 1,
0.3459994, -1.250418, 2.310985, 0, 0.07450981, 1, 1,
0.3497827, 0.2689008, 2.656846, 0, 0.07058824, 1, 1,
0.351093, -0.7576065, 3.766352, 0, 0.0627451, 1, 1,
0.3516616, -0.04896942, 0.3347096, 0, 0.05882353, 1, 1,
0.3517236, -0.689379, 3.99774, 0, 0.05098039, 1, 1,
0.3532856, -0.1904186, 1.158037, 0, 0.04705882, 1, 1,
0.3553187, 2.316806, -0.0654789, 0, 0.03921569, 1, 1,
0.3567319, -0.9276919, 0.2691752, 0, 0.03529412, 1, 1,
0.3591333, 0.02808284, -1.268507, 0, 0.02745098, 1, 1,
0.3653414, 0.6553299, 0.1128507, 0, 0.02352941, 1, 1,
0.3703969, -1.861217, 3.044929, 0, 0.01568628, 1, 1,
0.3721913, -1.257251, 1.882402, 0, 0.01176471, 1, 1,
0.3751984, 0.05576587, 1.353557, 0, 0.003921569, 1, 1,
0.3815261, -0.1373468, 1.085102, 0.003921569, 0, 1, 1,
0.3861395, 0.6059296, 0.9311224, 0.007843138, 0, 1, 1,
0.3928635, -0.5626542, 2.044994, 0.01568628, 0, 1, 1,
0.3949312, 0.5119926, 1.31847, 0.01960784, 0, 1, 1,
0.3953168, 0.4847021, 1.228886, 0.02745098, 0, 1, 1,
0.3988228, -0.3470147, 2.190614, 0.03137255, 0, 1, 1,
0.3999797, 0.8923335, 1.100161, 0.03921569, 0, 1, 1,
0.4004583, 0.3345366, 0.6899586, 0.04313726, 0, 1, 1,
0.400703, 0.6033959, 0.4744242, 0.05098039, 0, 1, 1,
0.4011565, -0.3143435, 0.6730435, 0.05490196, 0, 1, 1,
0.4035915, 0.004901879, 1.539981, 0.0627451, 0, 1, 1,
0.4056346, 1.48914, -0.6044315, 0.06666667, 0, 1, 1,
0.4077755, 1.799787, 0.2616887, 0.07450981, 0, 1, 1,
0.4102981, 0.3385862, 0.5851991, 0.07843138, 0, 1, 1,
0.4115015, -0.6878889, 1.749684, 0.08627451, 0, 1, 1,
0.4126425, 1.512204, 0.2663318, 0.09019608, 0, 1, 1,
0.4156344, -0.6235872, 3.300047, 0.09803922, 0, 1, 1,
0.4158906, -0.4295899, 1.385136, 0.1058824, 0, 1, 1,
0.4167212, -0.265299, 1.399572, 0.1098039, 0, 1, 1,
0.4238376, -1.871584, 1.773481, 0.1176471, 0, 1, 1,
0.4314972, 0.9955903, 0.1416606, 0.1215686, 0, 1, 1,
0.4316625, -0.6038066, 1.109848, 0.1294118, 0, 1, 1,
0.43311, 0.7233239, -0.6523097, 0.1333333, 0, 1, 1,
0.438402, 2.275489, 0.3150674, 0.1411765, 0, 1, 1,
0.4469918, -1.289394, 4.144435, 0.145098, 0, 1, 1,
0.4487924, 1.87095, 1.907214, 0.1529412, 0, 1, 1,
0.4504203, 2.00977, 0.9091079, 0.1568628, 0, 1, 1,
0.4542979, 0.7088167, 0.3605877, 0.1647059, 0, 1, 1,
0.4545437, 0.7979403, 2.566677, 0.1686275, 0, 1, 1,
0.4605337, 1.056486, 0.5757675, 0.1764706, 0, 1, 1,
0.4632398, 1.835606, 0.3090095, 0.1803922, 0, 1, 1,
0.4648714, 0.3298371, 1.921396, 0.1882353, 0, 1, 1,
0.4649881, 0.7067003, 0.4006677, 0.1921569, 0, 1, 1,
0.4653331, 0.1273964, 2.800096, 0.2, 0, 1, 1,
0.4703818, 1.502557, 0.1454064, 0.2078431, 0, 1, 1,
0.4752354, 0.5818624, -0.276604, 0.2117647, 0, 1, 1,
0.4813972, -1.219477, 3.621154, 0.2196078, 0, 1, 1,
0.4917576, 1.257185, 1.360712, 0.2235294, 0, 1, 1,
0.493885, 0.2989892, 1.535642, 0.2313726, 0, 1, 1,
0.4953047, 0.2603975, -0.9609873, 0.2352941, 0, 1, 1,
0.4962662, -0.8286393, 2.468206, 0.2431373, 0, 1, 1,
0.4978647, 2.327054, 0.2619854, 0.2470588, 0, 1, 1,
0.498324, 0.9786493, 0.8745004, 0.254902, 0, 1, 1,
0.5027744, -1.524313, 2.281082, 0.2588235, 0, 1, 1,
0.5087767, 1.072755, 0.7783255, 0.2666667, 0, 1, 1,
0.50906, -0.2043221, 3.539986, 0.2705882, 0, 1, 1,
0.5142114, 0.03825055, 1.7432, 0.2784314, 0, 1, 1,
0.5170219, 0.5434355, 1.819823, 0.282353, 0, 1, 1,
0.5179637, -0.2724139, 0.803297, 0.2901961, 0, 1, 1,
0.518778, -0.08818199, 1.392554, 0.2941177, 0, 1, 1,
0.5210246, -1.085066, 2.410813, 0.3019608, 0, 1, 1,
0.5253078, 1.291857, -0.1933302, 0.3098039, 0, 1, 1,
0.5271483, -0.1008761, 3.011203, 0.3137255, 0, 1, 1,
0.5350506, -0.3733581, 1.142182, 0.3215686, 0, 1, 1,
0.5393201, -1.511457, 1.969619, 0.3254902, 0, 1, 1,
0.5431453, 0.6047835, 1.832565, 0.3333333, 0, 1, 1,
0.5445385, 0.6401822, -0.9949722, 0.3372549, 0, 1, 1,
0.5463169, 1.8258, -2.58297, 0.345098, 0, 1, 1,
0.5464866, 0.360976, -0.3621009, 0.3490196, 0, 1, 1,
0.546697, 0.8954928, 1.278559, 0.3568628, 0, 1, 1,
0.5518848, -0.0199907, 0.8540781, 0.3607843, 0, 1, 1,
0.5545275, 0.09668976, 0.3194922, 0.3686275, 0, 1, 1,
0.5553913, 0.8856856, 1.988033, 0.372549, 0, 1, 1,
0.555949, -0.7036341, 1.601256, 0.3803922, 0, 1, 1,
0.5581774, 0.101215, 0.4970777, 0.3843137, 0, 1, 1,
0.5586154, 0.5530514, 0.08471473, 0.3921569, 0, 1, 1,
0.5617262, 0.07382978, 1.663593, 0.3960784, 0, 1, 1,
0.5644288, 0.6444818, 2.967045, 0.4039216, 0, 1, 1,
0.5681074, -0.465669, 1.622684, 0.4117647, 0, 1, 1,
0.5769254, -0.8776233, 4.140519, 0.4156863, 0, 1, 1,
0.5804603, -0.3860165, 0.566447, 0.4235294, 0, 1, 1,
0.5918062, -0.6076057, 1.132437, 0.427451, 0, 1, 1,
0.5926303, 0.6633745, 1.032787, 0.4352941, 0, 1, 1,
0.5930632, -1.2419, 1.949615, 0.4392157, 0, 1, 1,
0.5950589, 0.5050213, 1.354164, 0.4470588, 0, 1, 1,
0.6039817, -0.02950267, 3.244333, 0.4509804, 0, 1, 1,
0.6050112, 0.4240407, 1.890302, 0.4588235, 0, 1, 1,
0.6091377, 0.4838826, 0.5492709, 0.4627451, 0, 1, 1,
0.6092774, 1.856882, 0.1330446, 0.4705882, 0, 1, 1,
0.6141092, -0.9528563, 3.742495, 0.4745098, 0, 1, 1,
0.6150274, -0.2329386, 2.373795, 0.4823529, 0, 1, 1,
0.6157069, -2.76066, 2.759014, 0.4862745, 0, 1, 1,
0.6168779, -0.6051584, 4.161705, 0.4941176, 0, 1, 1,
0.6209174, 0.7747608, 0.9063116, 0.5019608, 0, 1, 1,
0.6216633, -0.3533655, 1.505472, 0.5058824, 0, 1, 1,
0.6233395, 0.02614122, 1.373508, 0.5137255, 0, 1, 1,
0.6290221, -0.7014529, 4.385351, 0.5176471, 0, 1, 1,
0.6355138, -0.270014, 2.252045, 0.5254902, 0, 1, 1,
0.6412015, -0.1255278, 2.880473, 0.5294118, 0, 1, 1,
0.6454712, 0.2780008, 0.6998025, 0.5372549, 0, 1, 1,
0.6469157, -0.3999083, 1.897179, 0.5411765, 0, 1, 1,
0.6489586, -1.153865, 2.490967, 0.5490196, 0, 1, 1,
0.6615359, 0.00957895, 2.905248, 0.5529412, 0, 1, 1,
0.6617725, 1.041049, 1.178474, 0.5607843, 0, 1, 1,
0.6618962, -1.051579, 1.89347, 0.5647059, 0, 1, 1,
0.6656339, -2.145409, 2.607495, 0.572549, 0, 1, 1,
0.666853, 1.743972, 1.509762, 0.5764706, 0, 1, 1,
0.6680529, -0.03274322, 0.334997, 0.5843138, 0, 1, 1,
0.6706924, 0.2583381, -0.03585545, 0.5882353, 0, 1, 1,
0.6711785, -0.3900499, 2.973742, 0.5960785, 0, 1, 1,
0.6721186, 0.1785413, 1.006179, 0.6039216, 0, 1, 1,
0.6800968, 0.5807302, 1.487134, 0.6078432, 0, 1, 1,
0.6817494, -0.4331627, 2.762339, 0.6156863, 0, 1, 1,
0.6827666, -1.244822, 3.200697, 0.6196079, 0, 1, 1,
0.6849446, 0.6200504, 2.115835, 0.627451, 0, 1, 1,
0.6850371, 1.802832, 0.1505122, 0.6313726, 0, 1, 1,
0.687326, 0.650265, 0.7896237, 0.6392157, 0, 1, 1,
0.7021953, -0.4741141, 1.941797, 0.6431373, 0, 1, 1,
0.706684, 0.1865396, 0.9289559, 0.6509804, 0, 1, 1,
0.7092372, 0.4648652, 0.8498111, 0.654902, 0, 1, 1,
0.709649, -0.2698432, 1.77723, 0.6627451, 0, 1, 1,
0.7123494, -2.113714, 2.255251, 0.6666667, 0, 1, 1,
0.7161533, 0.2254996, 1.441314, 0.6745098, 0, 1, 1,
0.7184517, 1.454875, -1.405246, 0.6784314, 0, 1, 1,
0.7283381, -1.407383, 3.87805, 0.6862745, 0, 1, 1,
0.7345343, -0.4404067, 1.63531, 0.6901961, 0, 1, 1,
0.7359573, -1.28654, 2.236398, 0.6980392, 0, 1, 1,
0.736079, 0.9994408, 0.790873, 0.7058824, 0, 1, 1,
0.7457234, -0.1857439, 1.282276, 0.7098039, 0, 1, 1,
0.7466436, -1.161934, 2.347024, 0.7176471, 0, 1, 1,
0.7491476, -0.3476082, 1.425976, 0.7215686, 0, 1, 1,
0.7522041, 0.3042783, 2.237435, 0.7294118, 0, 1, 1,
0.754532, -0.4865533, 4.159193, 0.7333333, 0, 1, 1,
0.7551501, 0.01010443, 1.347178, 0.7411765, 0, 1, 1,
0.757084, 1.46523, -0.5250868, 0.7450981, 0, 1, 1,
0.7763442, -0.6638353, 2.340493, 0.7529412, 0, 1, 1,
0.7770085, 0.1543824, 0.5935018, 0.7568628, 0, 1, 1,
0.7789877, -1.201064, 1.483333, 0.7647059, 0, 1, 1,
0.7835966, -0.5667906, 1.734532, 0.7686275, 0, 1, 1,
0.7851642, 0.6189364, -0.5240976, 0.7764706, 0, 1, 1,
0.7882565, 0.4111264, 2.921164, 0.7803922, 0, 1, 1,
0.8024473, 0.5142744, 0.6689234, 0.7882353, 0, 1, 1,
0.8045154, -1.037451, 3.480619, 0.7921569, 0, 1, 1,
0.8062717, -0.7428896, 3.876308, 0.8, 0, 1, 1,
0.8066335, 1.437855, 1.486252, 0.8078431, 0, 1, 1,
0.8131083, -0.3316289, 2.853817, 0.8117647, 0, 1, 1,
0.8154902, 0.135468, 1.687664, 0.8196079, 0, 1, 1,
0.820817, -0.06598271, 2.522178, 0.8235294, 0, 1, 1,
0.8223693, 0.9322652, 1.661747, 0.8313726, 0, 1, 1,
0.8236256, -0.8131328, 2.193939, 0.8352941, 0, 1, 1,
0.8237913, -1.028071, 2.972862, 0.8431373, 0, 1, 1,
0.828289, 1.182177, 1.540471, 0.8470588, 0, 1, 1,
0.829848, 0.200226, 0.477801, 0.854902, 0, 1, 1,
0.8340504, 0.7870101, 1.224583, 0.8588235, 0, 1, 1,
0.8434091, 0.6229985, 0.6667464, 0.8666667, 0, 1, 1,
0.8475612, 0.006065182, 2.876328, 0.8705882, 0, 1, 1,
0.8511457, -0.7718386, 1.069824, 0.8784314, 0, 1, 1,
0.8538186, 0.2721656, 1.374297, 0.8823529, 0, 1, 1,
0.8604688, -0.3587893, 1.828638, 0.8901961, 0, 1, 1,
0.8658379, 1.141195, 1.262879, 0.8941177, 0, 1, 1,
0.8673705, -2.761142, 5.205425, 0.9019608, 0, 1, 1,
0.8710292, 0.2362427, 0.7339932, 0.9098039, 0, 1, 1,
0.8752837, 0.7156882, 0.6083134, 0.9137255, 0, 1, 1,
0.8771241, -1.038418, 2.911094, 0.9215686, 0, 1, 1,
0.8773459, -0.6347181, 2.303873, 0.9254902, 0, 1, 1,
0.886106, -1.584629, 4.293559, 0.9333333, 0, 1, 1,
0.886614, 0.3129268, 3.523013, 0.9372549, 0, 1, 1,
0.8880352, 1.148958, 0.3022479, 0.945098, 0, 1, 1,
0.8907232, 0.6010446, 0.2059651, 0.9490196, 0, 1, 1,
0.8941406, -0.8431138, 1.631579, 0.9568627, 0, 1, 1,
0.90076, 1.43129, 2.11156, 0.9607843, 0, 1, 1,
0.9015338, -0.5621915, 3.901838, 0.9686275, 0, 1, 1,
0.9127821, 0.1216424, 0.08602223, 0.972549, 0, 1, 1,
0.9137908, 0.4600815, 1.328701, 0.9803922, 0, 1, 1,
0.9311855, 0.6038101, 1.601876, 0.9843137, 0, 1, 1,
0.9313173, 0.5152131, 1.063977, 0.9921569, 0, 1, 1,
0.9317997, 0.05627062, 0.7321278, 0.9960784, 0, 1, 1,
0.9327664, -1.01177, 3.423037, 1, 0, 0.9960784, 1,
0.9334638, -0.07262506, 2.578082, 1, 0, 0.9882353, 1,
0.9419352, -0.5988908, 2.361328, 1, 0, 0.9843137, 1,
0.9452004, 0.6350905, 0.5079867, 1, 0, 0.9764706, 1,
0.9471239, -0.9376978, 3.180362, 1, 0, 0.972549, 1,
0.9485222, 0.3173901, -1.027024, 1, 0, 0.9647059, 1,
0.9522278, -1.58349, 2.609664, 1, 0, 0.9607843, 1,
0.9526956, 0.9480143, 1.895225, 1, 0, 0.9529412, 1,
0.9595916, -1.420328, 1.626005, 1, 0, 0.9490196, 1,
0.961196, 0.1657159, 2.265723, 1, 0, 0.9411765, 1,
0.9622912, -0.2909967, 0.9372274, 1, 0, 0.9372549, 1,
0.9640995, -1.059487, 3.580707, 1, 0, 0.9294118, 1,
0.96668, -1.004371, 2.579076, 1, 0, 0.9254902, 1,
0.9695796, 0.1836373, 0.7519938, 1, 0, 0.9176471, 1,
0.9704393, -1.362887, 1.766915, 1, 0, 0.9137255, 1,
0.97545, 0.3522139, 1.643051, 1, 0, 0.9058824, 1,
0.9859963, 1.511437, 0.9372016, 1, 0, 0.9019608, 1,
0.9863797, -0.5037871, 0.7282994, 1, 0, 0.8941177, 1,
0.9890868, 0.5948572, 1.699608, 1, 0, 0.8862745, 1,
0.9917244, -0.7450818, 2.209005, 1, 0, 0.8823529, 1,
1.00048, -1.022109, 2.115349, 1, 0, 0.8745098, 1,
1.002148, -0.05560248, 1.584884, 1, 0, 0.8705882, 1,
1.006197, -0.1985777, 2.712194, 1, 0, 0.8627451, 1,
1.006752, -0.4466959, 2.031769, 1, 0, 0.8588235, 1,
1.008757, -1.573963, 2.29935, 1, 0, 0.8509804, 1,
1.01234, -0.9904681, 2.915914, 1, 0, 0.8470588, 1,
1.014742, 0.6495607, 1.383822, 1, 0, 0.8392157, 1,
1.044922, -0.4465602, 2.856771, 1, 0, 0.8352941, 1,
1.045865, -0.3180904, 0.6666623, 1, 0, 0.827451, 1,
1.054717, -0.5287905, 4.258097, 1, 0, 0.8235294, 1,
1.05622, -0.2850356, -1.63282, 1, 0, 0.8156863, 1,
1.056605, 0.2558789, -0.07643541, 1, 0, 0.8117647, 1,
1.058968, 1.585414, 1.429635, 1, 0, 0.8039216, 1,
1.068789, 0.391645, 2.823428, 1, 0, 0.7960784, 1,
1.070779, -0.7684148, 2.942269, 1, 0, 0.7921569, 1,
1.07596, 0.1669785, 0.7780365, 1, 0, 0.7843137, 1,
1.078934, 0.3177243, 1.255695, 1, 0, 0.7803922, 1,
1.081422, -0.5936751, 2.654879, 1, 0, 0.772549, 1,
1.102736, -1.152487, 2.627157, 1, 0, 0.7686275, 1,
1.103032, 0.9989954, 0.5667706, 1, 0, 0.7607843, 1,
1.108902, 0.8327635, 1.304595, 1, 0, 0.7568628, 1,
1.116474, -1.001539, 3.123074, 1, 0, 0.7490196, 1,
1.120229, -0.9712666, 2.262871, 1, 0, 0.7450981, 1,
1.120918, 0.8943425, 1.491227, 1, 0, 0.7372549, 1,
1.123022, 0.8516281, 1.493969, 1, 0, 0.7333333, 1,
1.123748, 0.4932446, 0.2932119, 1, 0, 0.7254902, 1,
1.127135, -0.6189179, 3.510534, 1, 0, 0.7215686, 1,
1.127758, 0.09271377, 2.759722, 1, 0, 0.7137255, 1,
1.134409, 0.1264866, 0.1289673, 1, 0, 0.7098039, 1,
1.136268, 0.2761829, 1.50149, 1, 0, 0.7019608, 1,
1.145502, -0.05549552, 1.321645, 1, 0, 0.6941177, 1,
1.149673, 0.1914832, 3.144959, 1, 0, 0.6901961, 1,
1.159456, -1.76451, 2.95665, 1, 0, 0.682353, 1,
1.162667, 0.4892006, 1.440475, 1, 0, 0.6784314, 1,
1.167644, -0.4983726, 3.866139, 1, 0, 0.6705883, 1,
1.173555, 1.344249, 0.771623, 1, 0, 0.6666667, 1,
1.175997, -1.268322, 1.326617, 1, 0, 0.6588235, 1,
1.178199, -0.2365802, 1.7554, 1, 0, 0.654902, 1,
1.190149, -1.129765, 1.597157, 1, 0, 0.6470588, 1,
1.195877, 0.5005726, 1.868567, 1, 0, 0.6431373, 1,
1.204975, 1.559066, -1.915547, 1, 0, 0.6352941, 1,
1.210508, 0.05859578, -0.7384427, 1, 0, 0.6313726, 1,
1.216097, 0.1508243, 3.274686, 1, 0, 0.6235294, 1,
1.216705, -1.139106, 3.263484, 1, 0, 0.6196079, 1,
1.222702, -0.1631147, 2.494632, 1, 0, 0.6117647, 1,
1.229532, 0.6288987, 2.323707, 1, 0, 0.6078432, 1,
1.244724, 0.4067837, 0.898054, 1, 0, 0.6, 1,
1.253287, 1.29907, 2.210546, 1, 0, 0.5921569, 1,
1.268801, 0.3234762, 0.7789322, 1, 0, 0.5882353, 1,
1.269389, 0.03793638, 1.155674, 1, 0, 0.5803922, 1,
1.271389, 1.049949, 1.831114, 1, 0, 0.5764706, 1,
1.274861, 0.6027017, 0.5638185, 1, 0, 0.5686275, 1,
1.280968, 1.349125, 1.837119, 1, 0, 0.5647059, 1,
1.284263, 0.6191929, 2.234141, 1, 0, 0.5568628, 1,
1.287978, -0.1507224, 1.084867, 1, 0, 0.5529412, 1,
1.289206, -0.7066021, 2.549757, 1, 0, 0.5450981, 1,
1.290279, 0.4145768, 1.007664, 1, 0, 0.5411765, 1,
1.30308, 1.396665, 0.5430376, 1, 0, 0.5333334, 1,
1.307747, 0.7655539, 0.3538025, 1, 0, 0.5294118, 1,
1.312093, -1.53359, 3.447653, 1, 0, 0.5215687, 1,
1.312841, 1.358935, -1.883625, 1, 0, 0.5176471, 1,
1.314946, 0.08845563, 1.391008, 1, 0, 0.509804, 1,
1.318123, 0.3819222, 2.644804, 1, 0, 0.5058824, 1,
1.324489, 0.3471921, 2.043614, 1, 0, 0.4980392, 1,
1.32542, 0.005700478, 1.51568, 1, 0, 0.4901961, 1,
1.327729, -2.429203, 2.860207, 1, 0, 0.4862745, 1,
1.337778, 0.5244366, 0.950046, 1, 0, 0.4784314, 1,
1.344249, -0.8987105, 1.764924, 1, 0, 0.4745098, 1,
1.344265, 0.5193313, 1.380915, 1, 0, 0.4666667, 1,
1.357661, 1.302931, 0.9732637, 1, 0, 0.4627451, 1,
1.363382, -0.9138624, 2.112797, 1, 0, 0.454902, 1,
1.363447, -0.7350163, 1.969938, 1, 0, 0.4509804, 1,
1.363857, -0.2948236, 1.46562, 1, 0, 0.4431373, 1,
1.363947, 0.5355046, 0.816256, 1, 0, 0.4392157, 1,
1.365715, -2.295478, 2.235233, 1, 0, 0.4313726, 1,
1.374966, 0.4517916, 0.5718268, 1, 0, 0.427451, 1,
1.390644, -0.8308358, 0.815421, 1, 0, 0.4196078, 1,
1.392279, 0.1475784, 2.19005, 1, 0, 0.4156863, 1,
1.393126, 0.6381995, 1.550403, 1, 0, 0.4078431, 1,
1.399401, -0.9951949, 1.567331, 1, 0, 0.4039216, 1,
1.402983, -0.5433063, 2.41241, 1, 0, 0.3960784, 1,
1.41528, 1.12269, -0.03305136, 1, 0, 0.3882353, 1,
1.422268, 0.6004124, -0.1480551, 1, 0, 0.3843137, 1,
1.428517, -1.435477, 1.690531, 1, 0, 0.3764706, 1,
1.428929, -0.3435362, 3.198539, 1, 0, 0.372549, 1,
1.441838, 1.156912, 1.427796, 1, 0, 0.3647059, 1,
1.447086, 0.1631381, 1.766174, 1, 0, 0.3607843, 1,
1.447209, -2.226632, 1.903886, 1, 0, 0.3529412, 1,
1.461437, 2.236296, 0.8180053, 1, 0, 0.3490196, 1,
1.4764, -0.01073894, 3.334023, 1, 0, 0.3411765, 1,
1.481747, 0.4837287, 1.978091, 1, 0, 0.3372549, 1,
1.482552, 0.01946636, 1.526532, 1, 0, 0.3294118, 1,
1.486389, 1.076794, 0.1244658, 1, 0, 0.3254902, 1,
1.490192, -0.8106406, 2.955848, 1, 0, 0.3176471, 1,
1.492089, 0.1865537, 3.533814, 1, 0, 0.3137255, 1,
1.498973, -0.08816203, 2.035804, 1, 0, 0.3058824, 1,
1.516136, 1.084082, 1.443718, 1, 0, 0.2980392, 1,
1.523703, -0.5124683, 2.966192, 1, 0, 0.2941177, 1,
1.53374, 1.210546, 2.412288, 1, 0, 0.2862745, 1,
1.549133, -0.1397437, 2.090723, 1, 0, 0.282353, 1,
1.557217, -0.5288841, 4.142533, 1, 0, 0.2745098, 1,
1.575361, -2.44963, 0.7925579, 1, 0, 0.2705882, 1,
1.577828, -1.890539, 4.071464, 1, 0, 0.2627451, 1,
1.589679, 0.03396252, 1.563222, 1, 0, 0.2588235, 1,
1.608258, 0.3088044, 0.9929567, 1, 0, 0.2509804, 1,
1.647835, 1.637271, 1.555779, 1, 0, 0.2470588, 1,
1.670781, -2.218783, 3.490084, 1, 0, 0.2392157, 1,
1.677402, -1.348872, 2.867023, 1, 0, 0.2352941, 1,
1.677717, 0.9583862, 1.351731, 1, 0, 0.227451, 1,
1.689069, -0.0893788, 1.000891, 1, 0, 0.2235294, 1,
1.691262, 1.034049, 0.6908218, 1, 0, 0.2156863, 1,
1.698554, 0.124436, 4.655217, 1, 0, 0.2117647, 1,
1.705297, 1.517429, 0.4273238, 1, 0, 0.2039216, 1,
1.723796, -1.143641, 2.17252, 1, 0, 0.1960784, 1,
1.724558, 1.223272, -0.6488205, 1, 0, 0.1921569, 1,
1.73585, 0.2411028, 0.681002, 1, 0, 0.1843137, 1,
1.73845, -0.9612222, 2.17766, 1, 0, 0.1803922, 1,
1.764006, -0.2650188, 2.305706, 1, 0, 0.172549, 1,
1.769363, -2.063515, 2.29162, 1, 0, 0.1686275, 1,
1.771717, -0.2129649, 1.912218, 1, 0, 0.1607843, 1,
1.810747, 0.2562864, 0.6148909, 1, 0, 0.1568628, 1,
1.829713, 0.4953832, 0.9204358, 1, 0, 0.1490196, 1,
1.876657, 0.5388351, 0.5862429, 1, 0, 0.145098, 1,
1.892358, -0.8402511, 1.012215, 1, 0, 0.1372549, 1,
1.922789, -0.484898, 1.698742, 1, 0, 0.1333333, 1,
1.937151, 1.348451, 1.13553, 1, 0, 0.1254902, 1,
1.949525, -0.3090374, 2.18217, 1, 0, 0.1215686, 1,
1.974002, 0.3612483, 0.003509021, 1, 0, 0.1137255, 1,
2.033947, -0.7003059, 0.9987498, 1, 0, 0.1098039, 1,
2.040555, -0.2758128, 2.364033, 1, 0, 0.1019608, 1,
2.049897, 2.029698, -0.7429257, 1, 0, 0.09411765, 1,
2.077082, -0.7873126, 3.204771, 1, 0, 0.09019608, 1,
2.111711, 1.22756, 0.7245607, 1, 0, 0.08235294, 1,
2.11608, 0.4324221, 3.446101, 1, 0, 0.07843138, 1,
2.158562, 0.09962361, -0.5469856, 1, 0, 0.07058824, 1,
2.183789, 2.172411, 0.2435529, 1, 0, 0.06666667, 1,
2.229322, 0.821907, 2.214475, 1, 0, 0.05882353, 1,
2.25084, 1.923743, -0.4338156, 1, 0, 0.05490196, 1,
2.335899, -1.439647, -0.9285942, 1, 0, 0.04705882, 1,
2.364685, -0.4547604, 1.317839, 1, 0, 0.04313726, 1,
2.39586, -0.7363178, 1.756825, 1, 0, 0.03529412, 1,
2.434083, 0.6872883, 0.01372007, 1, 0, 0.03137255, 1,
2.481262, 2.020861, 1.244724, 1, 0, 0.02352941, 1,
2.803893, 1.005959, 2.85986, 1, 0, 0.01960784, 1,
2.912535, -1.009921, 2.68853, 1, 0, 0.01176471, 1,
3.155464, 1.260567, 0.714031, 1, 0, 0.007843138, 1
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
0.0655694, -4.400286, -7.030159, 0, -0.5, 0.5, 0.5,
0.0655694, -4.400286, -7.030159, 1, -0.5, 0.5, 0.5,
0.0655694, -4.400286, -7.030159, 1, 1.5, 0.5, 0.5,
0.0655694, -4.400286, -7.030159, 0, 1.5, 0.5, 0.5
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
-4.0718, 0.510428, -7.030159, 0, -0.5, 0.5, 0.5,
-4.0718, 0.510428, -7.030159, 1, -0.5, 0.5, 0.5,
-4.0718, 0.510428, -7.030159, 1, 1.5, 0.5, 0.5,
-4.0718, 0.510428, -7.030159, 0, 1.5, 0.5, 0.5
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
-4.0718, -4.400286, -0.02569246, 0, -0.5, 0.5, 0.5,
-4.0718, -4.400286, -0.02569246, 1, -0.5, 0.5, 0.5,
-4.0718, -4.400286, -0.02569246, 1, 1.5, 0.5, 0.5,
-4.0718, -4.400286, -0.02569246, 0, 1.5, 0.5, 0.5
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
-3, -3.267044, -5.413743,
3, -3.267044, -5.413743,
-3, -3.267044, -5.413743,
-3, -3.455918, -5.683146,
-2, -3.267044, -5.413743,
-2, -3.455918, -5.683146,
-1, -3.267044, -5.413743,
-1, -3.455918, -5.683146,
0, -3.267044, -5.413743,
0, -3.455918, -5.683146,
1, -3.267044, -5.413743,
1, -3.455918, -5.683146,
2, -3.267044, -5.413743,
2, -3.455918, -5.683146,
3, -3.267044, -5.413743,
3, -3.455918, -5.683146
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
-3, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
-3, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
-3, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
-3, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5,
-2, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
-2, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
-2, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
-2, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5,
-1, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
-1, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
-1, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
-1, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5,
0, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
0, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
0, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
0, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5,
1, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
1, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
1, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
1, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5,
2, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
2, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
2, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
2, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5,
3, -3.833665, -6.221951, 0, -0.5, 0.5, 0.5,
3, -3.833665, -6.221951, 1, -0.5, 0.5, 0.5,
3, -3.833665, -6.221951, 1, 1.5, 0.5, 0.5,
3, -3.833665, -6.221951, 0, 1.5, 0.5, 0.5
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
-3.117022, -2, -5.413743,
-3.117022, 4, -5.413743,
-3.117022, -2, -5.413743,
-3.276152, -2, -5.683146,
-3.117022, 0, -5.413743,
-3.276152, 0, -5.683146,
-3.117022, 2, -5.413743,
-3.276152, 2, -5.683146,
-3.117022, 4, -5.413743,
-3.276152, 4, -5.683146
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
"2",
"4"
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
-3.594411, -2, -6.221951, 0, -0.5, 0.5, 0.5,
-3.594411, -2, -6.221951, 1, -0.5, 0.5, 0.5,
-3.594411, -2, -6.221951, 1, 1.5, 0.5, 0.5,
-3.594411, -2, -6.221951, 0, 1.5, 0.5, 0.5,
-3.594411, 0, -6.221951, 0, -0.5, 0.5, 0.5,
-3.594411, 0, -6.221951, 1, -0.5, 0.5, 0.5,
-3.594411, 0, -6.221951, 1, 1.5, 0.5, 0.5,
-3.594411, 0, -6.221951, 0, 1.5, 0.5, 0.5,
-3.594411, 2, -6.221951, 0, -0.5, 0.5, 0.5,
-3.594411, 2, -6.221951, 1, -0.5, 0.5, 0.5,
-3.594411, 2, -6.221951, 1, 1.5, 0.5, 0.5,
-3.594411, 2, -6.221951, 0, 1.5, 0.5, 0.5,
-3.594411, 4, -6.221951, 0, -0.5, 0.5, 0.5,
-3.594411, 4, -6.221951, 1, -0.5, 0.5, 0.5,
-3.594411, 4, -6.221951, 1, 1.5, 0.5, 0.5,
-3.594411, 4, -6.221951, 0, 1.5, 0.5, 0.5
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
-3.117022, -3.267044, -4,
-3.117022, -3.267044, 4,
-3.117022, -3.267044, -4,
-3.276152, -3.455918, -4,
-3.117022, -3.267044, -2,
-3.276152, -3.455918, -2,
-3.117022, -3.267044, 0,
-3.276152, -3.455918, 0,
-3.117022, -3.267044, 2,
-3.276152, -3.455918, 2,
-3.117022, -3.267044, 4,
-3.276152, -3.455918, 4
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
-3.594411, -3.833665, -4, 0, -0.5, 0.5, 0.5,
-3.594411, -3.833665, -4, 1, -0.5, 0.5, 0.5,
-3.594411, -3.833665, -4, 1, 1.5, 0.5, 0.5,
-3.594411, -3.833665, -4, 0, 1.5, 0.5, 0.5,
-3.594411, -3.833665, -2, 0, -0.5, 0.5, 0.5,
-3.594411, -3.833665, -2, 1, -0.5, 0.5, 0.5,
-3.594411, -3.833665, -2, 1, 1.5, 0.5, 0.5,
-3.594411, -3.833665, -2, 0, 1.5, 0.5, 0.5,
-3.594411, -3.833665, 0, 0, -0.5, 0.5, 0.5,
-3.594411, -3.833665, 0, 1, -0.5, 0.5, 0.5,
-3.594411, -3.833665, 0, 1, 1.5, 0.5, 0.5,
-3.594411, -3.833665, 0, 0, 1.5, 0.5, 0.5,
-3.594411, -3.833665, 2, 0, -0.5, 0.5, 0.5,
-3.594411, -3.833665, 2, 1, -0.5, 0.5, 0.5,
-3.594411, -3.833665, 2, 1, 1.5, 0.5, 0.5,
-3.594411, -3.833665, 2, 0, 1.5, 0.5, 0.5,
-3.594411, -3.833665, 4, 0, -0.5, 0.5, 0.5,
-3.594411, -3.833665, 4, 1, -0.5, 0.5, 0.5,
-3.594411, -3.833665, 4, 1, 1.5, 0.5, 0.5,
-3.594411, -3.833665, 4, 0, 1.5, 0.5, 0.5
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
-3.117022, -3.267044, -5.413743,
-3.117022, 4.2879, -5.413743,
-3.117022, -3.267044, 5.362359,
-3.117022, 4.2879, 5.362359,
-3.117022, -3.267044, -5.413743,
-3.117022, -3.267044, 5.362359,
-3.117022, 4.2879, -5.413743,
-3.117022, 4.2879, 5.362359,
-3.117022, -3.267044, -5.413743,
3.248161, -3.267044, -5.413743,
-3.117022, -3.267044, 5.362359,
3.248161, -3.267044, 5.362359,
-3.117022, 4.2879, -5.413743,
3.248161, 4.2879, -5.413743,
-3.117022, 4.2879, 5.362359,
3.248161, 4.2879, 5.362359,
3.248161, -3.267044, -5.413743,
3.248161, 4.2879, -5.413743,
3.248161, -3.267044, 5.362359,
3.248161, 4.2879, 5.362359,
3.248161, -3.267044, -5.413743,
3.248161, -3.267044, 5.362359,
3.248161, 4.2879, -5.413743,
3.248161, 4.2879, 5.362359
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
var radius = 7.806298;
var distance = 34.7311;
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
mvMatrix.translate( -0.0655694, -0.510428, 0.02569246 );
mvMatrix.scale( 1.326014, 1.117192, 0.7832444 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.7311);
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
flumioxazin<-read.table("flumioxazin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flumioxazin$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumioxazin' not found
```

```r
y<-flumioxazin$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumioxazin' not found
```

```r
z<-flumioxazin$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumioxazin' not found
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
-3.024325, -0.4561332, -1.7143, 0, 0, 1, 1, 1,
-2.812238, -0.8899444, -1.915497, 1, 0, 0, 1, 1,
-2.760546, -1.331057, -3.538264, 1, 0, 0, 1, 1,
-2.667258, -0.6739181, -3.325447, 1, 0, 0, 1, 1,
-2.611508, -0.170462, -1.886078, 1, 0, 0, 1, 1,
-2.566608, 0.9841302, -0.8989508, 1, 0, 0, 1, 1,
-2.564638, -0.4502484, -0.9428461, 0, 0, 0, 1, 1,
-2.526898, -0.3142213, -2.183244, 0, 0, 0, 1, 1,
-2.44595, 0.01510734, 0.1551576, 0, 0, 0, 1, 1,
-2.427699, -0.728076, -1.036592, 0, 0, 0, 1, 1,
-2.41547, 0.2141382, -1.434282, 0, 0, 0, 1, 1,
-2.339852, -0.3676919, -1.266992, 0, 0, 0, 1, 1,
-2.283582, 0.9514675, -1.44564, 0, 0, 0, 1, 1,
-2.255094, -1.9118, -4.459575, 1, 1, 1, 1, 1,
-2.247781, 0.3600039, -1.091688, 1, 1, 1, 1, 1,
-2.21499, -0.2824229, -0.7899632, 1, 1, 1, 1, 1,
-2.14147, -0.6083056, -2.101439, 1, 1, 1, 1, 1,
-2.106953, 0.6532638, -0.2314679, 1, 1, 1, 1, 1,
-2.10305, 0.976451, -2.712151, 1, 1, 1, 1, 1,
-2.101708, 0.009447463, -1.254007, 1, 1, 1, 1, 1,
-2.091457, 0.7379535, -1.909498, 1, 1, 1, 1, 1,
-2.08319, -0.6240144, -0.9176282, 1, 1, 1, 1, 1,
-2.049341, -0.2836337, -2.152686, 1, 1, 1, 1, 1,
-2.035373, -0.2357316, -3.299098, 1, 1, 1, 1, 1,
-2.026796, 1.298483, 0.3491282, 1, 1, 1, 1, 1,
-2.013834, -1.245948, -2.637003, 1, 1, 1, 1, 1,
-2.002305, 0.8232827, -0.9732574, 1, 1, 1, 1, 1,
-1.971719, -0.9038618, -3.242289, 1, 1, 1, 1, 1,
-1.9703, 0.6717741, -1.169652, 0, 0, 1, 1, 1,
-1.935238, 0.1908664, -2.113319, 1, 0, 0, 1, 1,
-1.892519, -1.70514, -1.380536, 1, 0, 0, 1, 1,
-1.888483, -0.6871562, -2.660098, 1, 0, 0, 1, 1,
-1.88257, 0.584119, -3.05767, 1, 0, 0, 1, 1,
-1.871656, -1.007042, -2.453488, 1, 0, 0, 1, 1,
-1.832381, -0.7722535, -0.4232028, 0, 0, 0, 1, 1,
-1.829812, -0.164556, -2.935796, 0, 0, 0, 1, 1,
-1.795855, -0.06987424, -3.466046, 0, 0, 0, 1, 1,
-1.794321, 1.442356, 0.02941894, 0, 0, 0, 1, 1,
-1.71043, -1.307892, -2.070868, 0, 0, 0, 1, 1,
-1.70286, 2.056043, -1.157113, 0, 0, 0, 1, 1,
-1.691413, 0.3583122, -0.8216326, 0, 0, 0, 1, 1,
-1.690003, 0.8797765, -1.242489, 1, 1, 1, 1, 1,
-1.672743, -0.2235402, -1.551643, 1, 1, 1, 1, 1,
-1.666678, 1.671623, -1.043754, 1, 1, 1, 1, 1,
-1.619614, -0.4172058, -2.014666, 1, 1, 1, 1, 1,
-1.613024, -0.1476977, -0.3772502, 1, 1, 1, 1, 1,
-1.603972, -0.6155056, -1.801843, 1, 1, 1, 1, 1,
-1.602148, -0.3473825, -2.214362, 1, 1, 1, 1, 1,
-1.562754, -0.08580306, -0.9684041, 1, 1, 1, 1, 1,
-1.557348, -1.032049, -3.256516, 1, 1, 1, 1, 1,
-1.542978, -0.491646, -1.388069, 1, 1, 1, 1, 1,
-1.535998, -0.5338231, -2.833449, 1, 1, 1, 1, 1,
-1.529828, -0.1285607, -2.029864, 1, 1, 1, 1, 1,
-1.509836, -0.009669368, -3.283911, 1, 1, 1, 1, 1,
-1.508355, -1.036913, -2.269746, 1, 1, 1, 1, 1,
-1.498717, 0.1967422, -4.150584, 1, 1, 1, 1, 1,
-1.495417, 0.8315039, -0.7315881, 0, 0, 1, 1, 1,
-1.462286, -0.4416087, 0.3002826, 1, 0, 0, 1, 1,
-1.461615, 0.8528739, -0.3328192, 1, 0, 0, 1, 1,
-1.453625, -1.11976, -1.875403, 1, 0, 0, 1, 1,
-1.438803, -1.635415, -1.254128, 1, 0, 0, 1, 1,
-1.433661, 0.3382665, -2.342956, 1, 0, 0, 1, 1,
-1.43, 0.7726758, -2.113839, 0, 0, 0, 1, 1,
-1.414915, 0.7677532, -0.4099261, 0, 0, 0, 1, 1,
-1.407128, 0.2256085, -1.63039, 0, 0, 0, 1, 1,
-1.403907, -0.5246634, -1.20988, 0, 0, 0, 1, 1,
-1.396072, 0.3323979, -1.158674, 0, 0, 0, 1, 1,
-1.395214, -0.3916037, -4.141081, 0, 0, 0, 1, 1,
-1.394666, -0.3752139, -1.640131, 0, 0, 0, 1, 1,
-1.394389, 1.490657, -1.639852, 1, 1, 1, 1, 1,
-1.394174, -0.5808876, -1.034843, 1, 1, 1, 1, 1,
-1.387741, 0.4785447, 0.9226701, 1, 1, 1, 1, 1,
-1.374558, -1.8091, -3.290969, 1, 1, 1, 1, 1,
-1.372985, -1.105956, -2.383975, 1, 1, 1, 1, 1,
-1.368865, 0.2718977, -0.5013629, 1, 1, 1, 1, 1,
-1.355456, -1.824362, -1.255765, 1, 1, 1, 1, 1,
-1.346197, -0.4900225, -1.978415, 1, 1, 1, 1, 1,
-1.343607, 0.795159, -1.829713, 1, 1, 1, 1, 1,
-1.335969, -0.3403943, -1.398662, 1, 1, 1, 1, 1,
-1.334338, -2.171379, -2.121455, 1, 1, 1, 1, 1,
-1.332858, -0.01576482, 0.07356736, 1, 1, 1, 1, 1,
-1.326771, 0.2585279, -3.008, 1, 1, 1, 1, 1,
-1.326263, 0.7189026, -0.4139736, 1, 1, 1, 1, 1,
-1.313378, 1.207635, -0.06473079, 1, 1, 1, 1, 1,
-1.304923, 1.663281, -1.288932, 0, 0, 1, 1, 1,
-1.289561, -1.606905, -3.715726, 1, 0, 0, 1, 1,
-1.283558, -2.743015, -2.655601, 1, 0, 0, 1, 1,
-1.282527, 0.8245809, -1.113793, 1, 0, 0, 1, 1,
-1.280552, -0.4548905, -1.34302, 1, 0, 0, 1, 1,
-1.269988, -0.7892842, -2.008417, 1, 0, 0, 1, 1,
-1.25921, -0.9389393, -1.798124, 0, 0, 0, 1, 1,
-1.259162, -0.4314007, -2.003472, 0, 0, 0, 1, 1,
-1.25625, 0.7484114, -1.114832, 0, 0, 0, 1, 1,
-1.244381, -0.9924077, -0.5411945, 0, 0, 0, 1, 1,
-1.243632, -0.2758702, -1.482422, 0, 0, 0, 1, 1,
-1.232253, 1.449164, 0.2605315, 0, 0, 0, 1, 1,
-1.227682, 0.3201801, -0.8274791, 0, 0, 0, 1, 1,
-1.215757, -0.01612788, -3.308897, 1, 1, 1, 1, 1,
-1.215192, -0.5940846, -2.142633, 1, 1, 1, 1, 1,
-1.190427, -0.685515, -4.149327, 1, 1, 1, 1, 1,
-1.189702, 0.3792887, -1.8006, 1, 1, 1, 1, 1,
-1.189249, -0.3510346, -1.214091, 1, 1, 1, 1, 1,
-1.174883, 0.385691, -0.9994488, 1, 1, 1, 1, 1,
-1.164405, 0.6326144, -0.3945049, 1, 1, 1, 1, 1,
-1.1582, 0.6779059, -1.848506, 1, 1, 1, 1, 1,
-1.133979, 0.720444, -3.361475, 1, 1, 1, 1, 1,
-1.133799, 0.04110462, -2.910991, 1, 1, 1, 1, 1,
-1.133774, 0.8970762, -0.9543242, 1, 1, 1, 1, 1,
-1.128508, 0.5450227, -0.1550405, 1, 1, 1, 1, 1,
-1.126913, -0.8499616, -1.503123, 1, 1, 1, 1, 1,
-1.122741, -0.3437831, -1.554365, 1, 1, 1, 1, 1,
-1.122319, 0.4611636, -1.850862, 1, 1, 1, 1, 1,
-1.121493, 0.8058671, -0.5242214, 0, 0, 1, 1, 1,
-1.119269, -0.1495435, -0.5773664, 1, 0, 0, 1, 1,
-1.115447, 0.4448879, -1.337695, 1, 0, 0, 1, 1,
-1.106988, 0.6595766, -1.369785, 1, 0, 0, 1, 1,
-1.106072, 0.3811054, -1.295258, 1, 0, 0, 1, 1,
-1.099656, 0.3937336, -0.7288859, 1, 0, 0, 1, 1,
-1.098262, -1.146168, -1.579741, 0, 0, 0, 1, 1,
-1.097567, 0.05290765, -2.994263, 0, 0, 0, 1, 1,
-1.090982, 0.5064033, -0.9649217, 0, 0, 0, 1, 1,
-1.089788, 0.3723359, -2.828942, 0, 0, 0, 1, 1,
-1.086956, -1.82596, -0.6589183, 0, 0, 0, 1, 1,
-1.078461, 0.01763538, 0.04369951, 0, 0, 0, 1, 1,
-1.077976, -0.344042, -0.4692928, 0, 0, 0, 1, 1,
-1.076636, -0.500334, -1.661878, 1, 1, 1, 1, 1,
-1.067439, 1.412754, 0.1321699, 1, 1, 1, 1, 1,
-1.064698, -2.588809, -4.106422, 1, 1, 1, 1, 1,
-1.06329, -0.6639777, -1.299631, 1, 1, 1, 1, 1,
-1.060582, 0.07739872, 0.4751473, 1, 1, 1, 1, 1,
-1.05192, 0.6424018, -0.5027021, 1, 1, 1, 1, 1,
-1.045993, -0.6737502, -1.337638, 1, 1, 1, 1, 1,
-1.041254, 0.5381734, -0.8280126, 1, 1, 1, 1, 1,
-1.039293, -0.09224825, -1.311764, 1, 1, 1, 1, 1,
-1.032823, -1.796147, -0.4332874, 1, 1, 1, 1, 1,
-1.029276, -0.2998396, -0.3368056, 1, 1, 1, 1, 1,
-1.027837, -0.8962852, -3.302771, 1, 1, 1, 1, 1,
-1.026442, 1.589887, -1.558855, 1, 1, 1, 1, 1,
-1.024429, 2.243536, 0.8203346, 1, 1, 1, 1, 1,
-1.022938, -0.4838601, -1.872234, 1, 1, 1, 1, 1,
-1.022933, -1.710513, -2.959038, 0, 0, 1, 1, 1,
-1.018419, 0.2989722, -1.636301, 1, 0, 0, 1, 1,
-1.01787, 0.6653426, -2.107511, 1, 0, 0, 1, 1,
-1.009094, -0.9297991, -3.169353, 1, 0, 0, 1, 1,
-1.007308, -1.062177, -1.809782, 1, 0, 0, 1, 1,
-1.003764, -1.224635, -1.230257, 1, 0, 0, 1, 1,
-1.0035, 2.128585, -0.07155737, 0, 0, 0, 1, 1,
-0.9970524, -0.8106059, -1.21176, 0, 0, 0, 1, 1,
-0.9901031, 0.2623188, -0.01912341, 0, 0, 0, 1, 1,
-0.9831318, 0.8269067, -1.14429, 0, 0, 0, 1, 1,
-0.9812698, -0.8959774, -2.250627, 0, 0, 0, 1, 1,
-0.9803901, 1.924314, 0.05229277, 0, 0, 0, 1, 1,
-0.9727598, 0.5693541, 0.0413086, 0, 0, 0, 1, 1,
-0.9661838, -0.3672917, -1.742213, 1, 1, 1, 1, 1,
-0.9654303, -0.8231651, -1.659491, 1, 1, 1, 1, 1,
-0.9645333, -0.11635, -2.073027, 1, 1, 1, 1, 1,
-0.9590122, -0.8135899, -1.993542, 1, 1, 1, 1, 1,
-0.9585204, 0.8700725, -1.706144, 1, 1, 1, 1, 1,
-0.9548678, -0.1145779, -1.698588, 1, 1, 1, 1, 1,
-0.9544691, -2.110682, -4.398776, 1, 1, 1, 1, 1,
-0.9542326, 1.128955, -2.384648, 1, 1, 1, 1, 1,
-0.9500167, 0.5265309, -0.6187482, 1, 1, 1, 1, 1,
-0.9468536, -0.3092983, -2.272711, 1, 1, 1, 1, 1,
-0.946306, 0.1211347, -1.305454, 1, 1, 1, 1, 1,
-0.946135, 0.5518007, -2.288802, 1, 1, 1, 1, 1,
-0.9431843, 1.50125, -1.799077, 1, 1, 1, 1, 1,
-0.9420804, 0.184146, -0.5839247, 1, 1, 1, 1, 1,
-0.9386106, -0.01965909, -0.9350451, 1, 1, 1, 1, 1,
-0.9327874, -0.6227713, -2.8116, 0, 0, 1, 1, 1,
-0.9301602, 1.2285, -0.4060401, 1, 0, 0, 1, 1,
-0.9297125, 0.1105782, -0.581097, 1, 0, 0, 1, 1,
-0.9285251, -0.08549355, -2.589119, 1, 0, 0, 1, 1,
-0.9248391, -0.0263916, -2.187872, 1, 0, 0, 1, 1,
-0.9229461, 0.4211834, -1.786477, 1, 0, 0, 1, 1,
-0.917056, -0.04052625, -0.8417161, 0, 0, 0, 1, 1,
-0.9166467, 1.246804, -1.648746, 0, 0, 0, 1, 1,
-0.9039603, -0.9678342, -2.762202, 0, 0, 0, 1, 1,
-0.9030154, 1.428093, -0.8484425, 0, 0, 0, 1, 1,
-0.8970064, -1.245328, -3.922117, 0, 0, 0, 1, 1,
-0.8932679, 1.3802, -2.101011, 0, 0, 0, 1, 1,
-0.8898153, 0.8346304, -0.6492002, 0, 0, 0, 1, 1,
-0.8816723, -1.290833, -2.882195, 1, 1, 1, 1, 1,
-0.8769558, -1.184527, -1.951856, 1, 1, 1, 1, 1,
-0.875451, 1.033385, -1.682681, 1, 1, 1, 1, 1,
-0.8751833, 0.1671658, -0.7895187, 1, 1, 1, 1, 1,
-0.873797, -1.474812, -4.117018, 1, 1, 1, 1, 1,
-0.8708082, 0.8287569, -0.8352877, 1, 1, 1, 1, 1,
-0.8668091, 0.5830398, -0.4629225, 1, 1, 1, 1, 1,
-0.8639185, 0.9414104, -2.177287, 1, 1, 1, 1, 1,
-0.8565701, -0.7538309, -0.231083, 1, 1, 1, 1, 1,
-0.8564059, -2.129556, -2.920875, 1, 1, 1, 1, 1,
-0.854712, 0.3308289, -1.969539, 1, 1, 1, 1, 1,
-0.8479452, -0.09447685, -0.7117996, 1, 1, 1, 1, 1,
-0.8417307, 0.3872879, -0.2787938, 1, 1, 1, 1, 1,
-0.8412596, -1.336167, -3.134633, 1, 1, 1, 1, 1,
-0.8403029, 0.07728707, -1.031003, 1, 1, 1, 1, 1,
-0.8347345, 1.735201, -0.6203462, 0, 0, 1, 1, 1,
-0.8345413, 1.685103, -0.008340387, 1, 0, 0, 1, 1,
-0.8326849, -1.337925, -1.339043, 1, 0, 0, 1, 1,
-0.8301454, 0.105115, 0.7241798, 1, 0, 0, 1, 1,
-0.8209806, -1.299453, -2.620037, 1, 0, 0, 1, 1,
-0.8154511, 0.2686757, 0.2575431, 1, 0, 0, 1, 1,
-0.811122, -1.985507, -3.02607, 0, 0, 0, 1, 1,
-0.810152, 1.391445, 0.9137481, 0, 0, 0, 1, 1,
-0.8045529, -0.5321558, -0.5354391, 0, 0, 0, 1, 1,
-0.8002803, -0.3915017, 0.9562374, 0, 0, 0, 1, 1,
-0.7959607, -1.331563, -1.730761, 0, 0, 0, 1, 1,
-0.7819258, 0.8562507, 0.01548997, 0, 0, 0, 1, 1,
-0.780023, 0.7194851, -2.798099, 0, 0, 0, 1, 1,
-0.774982, 0.3425477, 0.05798337, 1, 1, 1, 1, 1,
-0.7732308, -1.970179, -3.037296, 1, 1, 1, 1, 1,
-0.7721099, 1.005103, -1.030452, 1, 1, 1, 1, 1,
-0.7650316, 0.546589, -1.106304, 1, 1, 1, 1, 1,
-0.7611133, 1.304415, -0.7031242, 1, 1, 1, 1, 1,
-0.7606514, -1.277743, -2.785697, 1, 1, 1, 1, 1,
-0.7604095, -0.4561139, -4.104643, 1, 1, 1, 1, 1,
-0.7594345, -1.432965, -1.822497, 1, 1, 1, 1, 1,
-0.7586466, 0.3963987, -2.842313, 1, 1, 1, 1, 1,
-0.7544967, -0.01490465, -0.9905243, 1, 1, 1, 1, 1,
-0.75433, -0.007860679, -1.248218, 1, 1, 1, 1, 1,
-0.7508002, -0.1971418, -2.346485, 1, 1, 1, 1, 1,
-0.7439371, 0.4447192, 0.5110285, 1, 1, 1, 1, 1,
-0.7408742, 2.565128, 0.3167356, 1, 1, 1, 1, 1,
-0.7373039, -0.4019348, -2.904743, 1, 1, 1, 1, 1,
-0.7370679, 1.613169, -1.26949, 0, 0, 1, 1, 1,
-0.7353755, -0.1970774, -1.58678, 1, 0, 0, 1, 1,
-0.7344923, 2.22998, -2.463878, 1, 0, 0, 1, 1,
-0.7337784, -2.33734, -2.204663, 1, 0, 0, 1, 1,
-0.728627, -0.6028915, -2.423475, 1, 0, 0, 1, 1,
-0.7246174, 0.721525, -0.2911856, 1, 0, 0, 1, 1,
-0.724273, 1.249076, -1.06995, 0, 0, 0, 1, 1,
-0.7233239, -0.6039069, -2.334971, 0, 0, 0, 1, 1,
-0.7152915, 0.8058602, -1.490409, 0, 0, 0, 1, 1,
-0.7102962, 0.9457496, 0.3966133, 0, 0, 0, 1, 1,
-0.7069962, 0.8708902, -1.903157, 0, 0, 0, 1, 1,
-0.7039724, 0.3321863, -1.659466, 0, 0, 0, 1, 1,
-0.697271, 0.4633135, -0.5355155, 0, 0, 0, 1, 1,
-0.6964625, -1.729619, -2.227223, 1, 1, 1, 1, 1,
-0.6959054, 0.4387642, -1.129768, 1, 1, 1, 1, 1,
-0.6952703, 0.7967037, -0.5890144, 1, 1, 1, 1, 1,
-0.6921256, -1.805723, -3.72986, 1, 1, 1, 1, 1,
-0.6913642, 0.2498442, 0.7595152, 1, 1, 1, 1, 1,
-0.691266, 0.04704517, -0.9158317, 1, 1, 1, 1, 1,
-0.6887558, 1.148218, 1.101879, 1, 1, 1, 1, 1,
-0.6857494, -0.2659746, -0.9647001, 1, 1, 1, 1, 1,
-0.6824529, -2.130393, -2.894456, 1, 1, 1, 1, 1,
-0.6809258, -0.06219904, -1.600798, 1, 1, 1, 1, 1,
-0.6709511, 0.18357, -0.8482128, 1, 1, 1, 1, 1,
-0.6704075, 1.137503, -0.3566571, 1, 1, 1, 1, 1,
-0.6693305, -0.7034545, -4.978442, 1, 1, 1, 1, 1,
-0.6687014, 1.644789, 0.01878252, 1, 1, 1, 1, 1,
-0.6631052, -0.463288, -2.515766, 1, 1, 1, 1, 1,
-0.6599113, -0.3625584, -0.6825981, 0, 0, 1, 1, 1,
-0.6590582, -0.7829157, -2.398914, 1, 0, 0, 1, 1,
-0.6579167, -0.3712753, -0.1913868, 1, 0, 0, 1, 1,
-0.6564404, 0.8934221, -0.2109755, 1, 0, 0, 1, 1,
-0.6532363, -0.5234432, -2.536447, 1, 0, 0, 1, 1,
-0.6531772, -0.5793977, -3.106509, 1, 0, 0, 1, 1,
-0.6526019, -0.1493574, -1.623281, 0, 0, 0, 1, 1,
-0.6456636, -0.3607182, -2.105168, 0, 0, 0, 1, 1,
-0.6441312, -0.9915808, -1.679026, 0, 0, 0, 1, 1,
-0.6395766, 1.178907, 0.5962067, 0, 0, 0, 1, 1,
-0.6352067, 0.3592192, -0.6858719, 0, 0, 0, 1, 1,
-0.6327665, -0.05874971, -0.731115, 0, 0, 0, 1, 1,
-0.6315404, 0.05768898, -1.011516, 0, 0, 0, 1, 1,
-0.6288295, 0.02858429, -1.922234, 1, 1, 1, 1, 1,
-0.6269809, -0.8466631, -3.229703, 1, 1, 1, 1, 1,
-0.6250569, 1.339765, -0.5114779, 1, 1, 1, 1, 1,
-0.6233728, 0.08853392, -1.010388, 1, 1, 1, 1, 1,
-0.616349, 0.5965999, 0.44651, 1, 1, 1, 1, 1,
-0.6153438, 0.9855897, -0.8985543, 1, 1, 1, 1, 1,
-0.6123824, -0.5356039, -2.546378, 1, 1, 1, 1, 1,
-0.6118782, 1.126616, 0.871433, 1, 1, 1, 1, 1,
-0.6098381, 1.19893, -0.4759826, 1, 1, 1, 1, 1,
-0.5971197, 1.076928, -1.076783, 1, 1, 1, 1, 1,
-0.5966471, -2.038791, -2.929534, 1, 1, 1, 1, 1,
-0.5965156, 1.386512, -0.9415215, 1, 1, 1, 1, 1,
-0.5960934, -1.719617, -4.44796, 1, 1, 1, 1, 1,
-0.5956277, 0.2174834, -2.219237, 1, 1, 1, 1, 1,
-0.5936724, -0.06768613, -2.494114, 1, 1, 1, 1, 1,
-0.5894675, -0.2328499, 1.511804, 0, 0, 1, 1, 1,
-0.587881, 0.4292052, -0.3302064, 1, 0, 0, 1, 1,
-0.5806187, 1.076541, 0.2704619, 1, 0, 0, 1, 1,
-0.5804126, 0.4051043, -1.584765, 1, 0, 0, 1, 1,
-0.5720932, 0.5710742, -1.046425, 1, 0, 0, 1, 1,
-0.5711851, 0.5248019, -0.7058082, 1, 0, 0, 1, 1,
-0.5706343, 1.137386, 0.2474418, 0, 0, 0, 1, 1,
-0.5675573, 0.8352308, 0.9935299, 0, 0, 0, 1, 1,
-0.5663955, -0.2358034, -2.824156, 0, 0, 0, 1, 1,
-0.5589489, 1.275837, 0.9944281, 0, 0, 0, 1, 1,
-0.5573902, -0.247519, -2.577012, 0, 0, 0, 1, 1,
-0.5537665, -0.161936, -2.460877, 0, 0, 0, 1, 1,
-0.553027, 0.4300081, -2.939127, 0, 0, 0, 1, 1,
-0.5461948, -0.2711718, -0.9909061, 1, 1, 1, 1, 1,
-0.5457881, 1.116622, -1.517803, 1, 1, 1, 1, 1,
-0.5428042, -0.1225174, -3.998316, 1, 1, 1, 1, 1,
-0.5402825, -0.0456624, -2.825135, 1, 1, 1, 1, 1,
-0.5345877, -1.429888, -3.200547, 1, 1, 1, 1, 1,
-0.5323082, 0.8148898, -1.102906, 1, 1, 1, 1, 1,
-0.5273979, 0.5074651, -1.262003, 1, 1, 1, 1, 1,
-0.5268285, 0.8048394, -0.1527784, 1, 1, 1, 1, 1,
-0.5236713, -2.198613, -1.409026, 1, 1, 1, 1, 1,
-0.5208935, -0.5885789, -1.988001, 1, 1, 1, 1, 1,
-0.5205265, -0.5556133, -2.240407, 1, 1, 1, 1, 1,
-0.51772, 0.06057559, -0.3033319, 1, 1, 1, 1, 1,
-0.511435, -0.3700953, -2.492836, 1, 1, 1, 1, 1,
-0.5112426, -0.3358245, -2.521592, 1, 1, 1, 1, 1,
-0.5084469, 0.2830614, -0.2846791, 1, 1, 1, 1, 1,
-0.5029061, -0.0664527, -0.9986836, 0, 0, 1, 1, 1,
-0.4988413, 1.41434, -0.04526294, 1, 0, 0, 1, 1,
-0.498767, -0.6324688, -4.0474, 1, 0, 0, 1, 1,
-0.4938973, -1.149806, -4.519047, 1, 0, 0, 1, 1,
-0.4933193, 1.520369, 0.5307384, 1, 0, 0, 1, 1,
-0.4926026, 0.9930476, -1.189515, 1, 0, 0, 1, 1,
-0.4925806, 0.4195331, -1.502566, 0, 0, 0, 1, 1,
-0.490475, -0.4041842, -3.128289, 0, 0, 0, 1, 1,
-0.4882891, -0.6648809, -1.697581, 0, 0, 0, 1, 1,
-0.4858905, -0.3135359, -1.201127, 0, 0, 0, 1, 1,
-0.4857962, -0.317322, -3.096212, 0, 0, 0, 1, 1,
-0.4842672, -1.106666, -4.228858, 0, 0, 0, 1, 1,
-0.4842338, 0.453233, -0.9306518, 0, 0, 0, 1, 1,
-0.4821941, -1.454966, -3.175926, 1, 1, 1, 1, 1,
-0.4791466, -1.397058, -2.825798, 1, 1, 1, 1, 1,
-0.4755918, -1.050354, -3.308281, 1, 1, 1, 1, 1,
-0.4683312, 1.416646, 0.9832029, 1, 1, 1, 1, 1,
-0.4645648, 1.113473, -0.3177754, 1, 1, 1, 1, 1,
-0.4623607, -2.240353, -1.593072, 1, 1, 1, 1, 1,
-0.4619689, 1.155398, 0.3976309, 1, 1, 1, 1, 1,
-0.4615889, -1.346228, -2.621386, 1, 1, 1, 1, 1,
-0.4600334, -0.4637936, -3.140367, 1, 1, 1, 1, 1,
-0.4591835, 1.162957, 1.010695, 1, 1, 1, 1, 1,
-0.4580486, -0.9824298, -2.822646, 1, 1, 1, 1, 1,
-0.4562914, -1.090689, -2.832534, 1, 1, 1, 1, 1,
-0.4513797, 0.4714556, -0.4092339, 1, 1, 1, 1, 1,
-0.4491982, -0.5566217, -1.158614, 1, 1, 1, 1, 1,
-0.4457717, 0.473529, -0.9536384, 1, 1, 1, 1, 1,
-0.4315386, -0.3389826, -2.897321, 0, 0, 1, 1, 1,
-0.4299302, 1.048845, -1.651868, 1, 0, 0, 1, 1,
-0.4262067, -0.6074695, -0.9530052, 1, 0, 0, 1, 1,
-0.4243423, -0.861398, -1.298319, 1, 0, 0, 1, 1,
-0.4163673, 0.1991637, -1.700847, 1, 0, 0, 1, 1,
-0.4162163, -0.2462594, -4.26557, 1, 0, 0, 1, 1,
-0.415138, -0.03672175, -0.6824965, 0, 0, 0, 1, 1,
-0.4128022, -1.165503, -3.010226, 0, 0, 0, 1, 1,
-0.4110121, 0.01446982, 0.1194182, 0, 0, 0, 1, 1,
-0.4090963, -1.136337, -4.093317, 0, 0, 0, 1, 1,
-0.4089941, -0.07954145, -2.740808, 0, 0, 0, 1, 1,
-0.4084187, -1.032147, -3.247084, 0, 0, 0, 1, 1,
-0.4050905, -0.4375994, -1.613499, 0, 0, 0, 1, 1,
-0.4046848, -1.286612, -2.75105, 1, 1, 1, 1, 1,
-0.4037874, 0.4909025, -1.348096, 1, 1, 1, 1, 1,
-0.3999252, 0.7717201, 1.781609, 1, 1, 1, 1, 1,
-0.3971029, 0.1263113, -0.3614339, 1, 1, 1, 1, 1,
-0.3966725, -0.3185836, -1.3567, 1, 1, 1, 1, 1,
-0.3965551, -0.07347415, -0.1143071, 1, 1, 1, 1, 1,
-0.3925863, 0.1777829, -1.673684, 1, 1, 1, 1, 1,
-0.3911026, -0.7170166, -2.458945, 1, 1, 1, 1, 1,
-0.3828644, -0.6369808, -3.027022, 1, 1, 1, 1, 1,
-0.3825225, -1.097604, -4.831167, 1, 1, 1, 1, 1,
-0.3821239, -2.032515, -3.900064, 1, 1, 1, 1, 1,
-0.3803395, 0.3704047, -0.4579033, 1, 1, 1, 1, 1,
-0.3801619, -1.867038, -2.837844, 1, 1, 1, 1, 1,
-0.3709374, -0.423362, -2.520713, 1, 1, 1, 1, 1,
-0.3707851, 0.4746131, 0.2347538, 1, 1, 1, 1, 1,
-0.3692714, -0.4750732, -2.50471, 0, 0, 1, 1, 1,
-0.369128, 1.150481, -0.4274868, 1, 0, 0, 1, 1,
-0.3687812, 1.136932, -0.3057772, 1, 0, 0, 1, 1,
-0.3687391, -0.591531, -2.163131, 1, 0, 0, 1, 1,
-0.3685467, 0.05318944, -2.395536, 1, 0, 0, 1, 1,
-0.359008, -1.09185, -2.676621, 1, 0, 0, 1, 1,
-0.3589524, -1.641672, -4.247246, 0, 0, 0, 1, 1,
-0.358609, -0.4485618, -4.204099, 0, 0, 0, 1, 1,
-0.35656, 0.5625206, 0.2430641, 0, 0, 0, 1, 1,
-0.3565592, 0.5352564, -1.548981, 0, 0, 0, 1, 1,
-0.355206, -0.2501836, -1.104633, 0, 0, 0, 1, 1,
-0.3521062, -0.2643771, -0.4083112, 0, 0, 0, 1, 1,
-0.3488396, 0.9765854, -0.4190726, 0, 0, 0, 1, 1,
-0.3467169, -0.2002683, -3.273849, 1, 1, 1, 1, 1,
-0.345974, -0.2305278, -1.987366, 1, 1, 1, 1, 1,
-0.338948, 0.4181515, -0.7286379, 1, 1, 1, 1, 1,
-0.3332765, -0.2165214, -2.353793, 1, 1, 1, 1, 1,
-0.3288695, 1.890637, 1.306603, 1, 1, 1, 1, 1,
-0.327108, -0.3623491, -3.607986, 1, 1, 1, 1, 1,
-0.3270662, 0.8549547, 0.1534901, 1, 1, 1, 1, 1,
-0.32706, -1.193144, -4.272348, 1, 1, 1, 1, 1,
-0.3224238, -0.5304635, -4.738438, 1, 1, 1, 1, 1,
-0.3199839, -0.7321295, -1.427207, 1, 1, 1, 1, 1,
-0.3193847, -0.8567943, -1.975914, 1, 1, 1, 1, 1,
-0.3178926, 0.330894, -0.895025, 1, 1, 1, 1, 1,
-0.3155779, 1.172089, -1.499791, 1, 1, 1, 1, 1,
-0.3154557, -0.3899287, -2.69227, 1, 1, 1, 1, 1,
-0.3146297, 0.2617552, 0.8499182, 1, 1, 1, 1, 1,
-0.3142687, -1.900959, -2.551685, 0, 0, 1, 1, 1,
-0.3126335, -1.546629, -2.731665, 1, 0, 0, 1, 1,
-0.3097097, 0.1161099, -1.043435, 1, 0, 0, 1, 1,
-0.3047778, -1.821388, -3.272181, 1, 0, 0, 1, 1,
-0.3040434, 0.9123127, -1.185702, 1, 0, 0, 1, 1,
-0.3030546, -1.79332, -3.98443, 1, 0, 0, 1, 1,
-0.300685, -1.189647, -1.997556, 0, 0, 0, 1, 1,
-0.3005691, -1.124242, -3.864673, 0, 0, 0, 1, 1,
-0.2980479, -0.4242431, -1.569673, 0, 0, 0, 1, 1,
-0.2970501, 0.8028421, 0.07930304, 0, 0, 0, 1, 1,
-0.2940091, 1.262286, -0.005488457, 0, 0, 0, 1, 1,
-0.2920809, -0.7906522, -4.159276, 0, 0, 0, 1, 1,
-0.2870637, -0.4217214, -2.916651, 0, 0, 0, 1, 1,
-0.2864522, -0.4661455, -1.250992, 1, 1, 1, 1, 1,
-0.2840319, -1.883009, -4.033443, 1, 1, 1, 1, 1,
-0.2835531, -0.649419, -1.914449, 1, 1, 1, 1, 1,
-0.2791797, -0.6256009, -2.826248, 1, 1, 1, 1, 1,
-0.269835, -1.16874, -3.850786, 1, 1, 1, 1, 1,
-0.2696557, 0.9735274, 0.7670774, 1, 1, 1, 1, 1,
-0.2696025, 0.1280544, -1.827781, 1, 1, 1, 1, 1,
-0.2678226, 0.4367222, -0.1487471, 1, 1, 1, 1, 1,
-0.2645616, 0.3561336, -0.5020733, 1, 1, 1, 1, 1,
-0.248679, -1.150712, -4.217984, 1, 1, 1, 1, 1,
-0.2486394, -1.149443, -1.156806, 1, 1, 1, 1, 1,
-0.2464218, 0.6217783, -0.4377124, 1, 1, 1, 1, 1,
-0.2435458, -0.223016, -1.849786, 1, 1, 1, 1, 1,
-0.2352262, 1.35207, 0.3368927, 1, 1, 1, 1, 1,
-0.2303987, -0.2058371, -2.146434, 1, 1, 1, 1, 1,
-0.2287749, -0.1433794, -4.064098, 0, 0, 1, 1, 1,
-0.2252493, -2.098616, -1.581353, 1, 0, 0, 1, 1,
-0.2235543, -0.5284209, -2.051309, 1, 0, 0, 1, 1,
-0.2201918, -0.7751305, -3.14211, 1, 0, 0, 1, 1,
-0.2194716, 0.9526915, -0.712907, 1, 0, 0, 1, 1,
-0.2193454, 0.1579009, -0.4091874, 1, 0, 0, 1, 1,
-0.2173115, -0.7382094, -2.170024, 0, 0, 0, 1, 1,
-0.2166308, -0.1687318, -2.967843, 0, 0, 0, 1, 1,
-0.2065625, 0.3733896, 0.01319896, 0, 0, 0, 1, 1,
-0.2061511, 0.8636736, 1.884856, 0, 0, 0, 1, 1,
-0.2020261, -0.9740142, -2.584893, 0, 0, 0, 1, 1,
-0.2017578, -0.5223901, -1.998423, 0, 0, 0, 1, 1,
-0.1996491, -0.7157767, -1.62966, 0, 0, 0, 1, 1,
-0.1980498, -0.3076409, -0.3246055, 1, 1, 1, 1, 1,
-0.1885536, -1.102851, -3.701051, 1, 1, 1, 1, 1,
-0.188014, -0.1590255, -3.899403, 1, 1, 1, 1, 1,
-0.18785, -0.0344749, -0.9926779, 1, 1, 1, 1, 1,
-0.1854422, -0.3339867, -3.865229, 1, 1, 1, 1, 1,
-0.1842404, -0.765994, -2.832094, 1, 1, 1, 1, 1,
-0.1826326, 0.9848095, -0.8420022, 1, 1, 1, 1, 1,
-0.1792767, 0.2138263, -1.106473, 1, 1, 1, 1, 1,
-0.1756572, -0.09068784, -1.402361, 1, 1, 1, 1, 1,
-0.1720921, -0.5714708, -2.04443, 1, 1, 1, 1, 1,
-0.1717366, -0.6518818, -2.789265, 1, 1, 1, 1, 1,
-0.1702056, -0.9097919, -4.229703, 1, 1, 1, 1, 1,
-0.1696701, 0.5564508, -0.383144, 1, 1, 1, 1, 1,
-0.1651067, -1.569251, -4.498549, 1, 1, 1, 1, 1,
-0.1635562, -0.5903261, -4.168012, 1, 1, 1, 1, 1,
-0.162531, -0.280801, -2.578992, 0, 0, 1, 1, 1,
-0.1621743, -0.4866218, -3.06107, 1, 0, 0, 1, 1,
-0.1616169, 0.319794, -0.6600106, 1, 0, 0, 1, 1,
-0.1569624, 0.594244, 1.207877, 1, 0, 0, 1, 1,
-0.1568672, 0.8042263, -0.3786097, 1, 0, 0, 1, 1,
-0.1560837, -1.525299, -3.629878, 1, 0, 0, 1, 1,
-0.1536832, 0.1830889, -1.355342, 0, 0, 0, 1, 1,
-0.1525311, 0.5636511, -0.9396226, 0, 0, 0, 1, 1,
-0.1495411, 0.0859245, 0.02114397, 0, 0, 0, 1, 1,
-0.1416794, 0.8078348, -1.314254, 0, 0, 0, 1, 1,
-0.1394813, 0.8486115, 1.338939, 0, 0, 0, 1, 1,
-0.1385778, 0.2058072, -1.71353, 0, 0, 0, 1, 1,
-0.1380081, 0.520072, 0.5975748, 0, 0, 0, 1, 1,
-0.1304661, -1.423669, -2.333, 1, 1, 1, 1, 1,
-0.1296191, -0.4909161, -3.828394, 1, 1, 1, 1, 1,
-0.1285526, 1.068158, 0.5454447, 1, 1, 1, 1, 1,
-0.1265699, 0.4814266, -1.401366, 1, 1, 1, 1, 1,
-0.121649, -0.0123136, -4.121456, 1, 1, 1, 1, 1,
-0.1168849, -0.5897056, -2.572532, 1, 1, 1, 1, 1,
-0.112586, 0.7594123, -1.560798, 1, 1, 1, 1, 1,
-0.1093058, 0.6791249, -0.2318233, 1, 1, 1, 1, 1,
-0.108135, -0.002545538, -1.84762, 1, 1, 1, 1, 1,
-0.1054007, 1.054639, -0.339267, 1, 1, 1, 1, 1,
-0.1053763, -0.1830233, -2.878697, 1, 1, 1, 1, 1,
-0.1050833, -0.6833093, -1.210576, 1, 1, 1, 1, 1,
-0.1043501, -0.7202553, -5.25681, 1, 1, 1, 1, 1,
-0.103452, 0.4164636, -0.5046604, 1, 1, 1, 1, 1,
-0.1014936, 1.008176, -0.9967167, 1, 1, 1, 1, 1,
-0.09961686, 1.023551, -0.5136281, 0, 0, 1, 1, 1,
-0.0979683, 0.2747468, -0.9982803, 1, 0, 0, 1, 1,
-0.09796143, -0.2991156, -1.551051, 1, 0, 0, 1, 1,
-0.09741153, 0.7377943, -0.3528285, 1, 0, 0, 1, 1,
-0.09513849, -1.4029, -1.871032, 1, 0, 0, 1, 1,
-0.09382463, 0.997883, 0.2726428, 1, 0, 0, 1, 1,
-0.08578227, 0.1176061, -1.364324, 0, 0, 0, 1, 1,
-0.08456335, -0.1201247, -5.027687, 0, 0, 0, 1, 1,
-0.0798365, 0.5312731, -0.6848775, 0, 0, 0, 1, 1,
-0.07936716, -1.097326, -2.158539, 0, 0, 0, 1, 1,
-0.07813591, -0.8434343, -3.785029, 0, 0, 0, 1, 1,
-0.07601879, -0.07018574, -0.9939423, 0, 0, 0, 1, 1,
-0.07324316, 0.5466357, -2.082126, 0, 0, 0, 1, 1,
-0.07191037, -2.027295, -3.330031, 1, 1, 1, 1, 1,
-0.06283116, 0.9569139, 0.1314923, 1, 1, 1, 1, 1,
-0.06124001, -0.1873718, -3.19175, 1, 1, 1, 1, 1,
-0.05217559, 1.119483, 0.916862, 1, 1, 1, 1, 1,
-0.05093888, 1.325046, 2.095953, 1, 1, 1, 1, 1,
-0.04937671, 1.720119, 0.4838676, 1, 1, 1, 1, 1,
-0.04798991, 1.210802, 0.7274482, 1, 1, 1, 1, 1,
-0.04794186, -0.5016031, -2.3886, 1, 1, 1, 1, 1,
-0.04632849, -1.079394, -2.485705, 1, 1, 1, 1, 1,
-0.0458708, 0.5043179, -0.3330325, 1, 1, 1, 1, 1,
-0.04444095, 1.049044, 1.240422, 1, 1, 1, 1, 1,
-0.04382183, 0.6979222, 0.2991518, 1, 1, 1, 1, 1,
-0.04280773, 1.235545, 0.3219958, 1, 1, 1, 1, 1,
-0.04271455, -1.159731, -3.261055, 1, 1, 1, 1, 1,
-0.03632314, 0.2956622, 0.6886502, 1, 1, 1, 1, 1,
-0.03599021, 0.7714488, -1.01386, 0, 0, 1, 1, 1,
-0.03509745, -0.1224298, -3.828712, 1, 0, 0, 1, 1,
-0.02969681, -1.469474, -2.355747, 1, 0, 0, 1, 1,
-0.02929459, 1.532543, 0.7376485, 1, 0, 0, 1, 1,
-0.02668964, 1.007624, -1.061549, 1, 0, 0, 1, 1,
-0.02664628, -0.7916192, -2.2517, 1, 0, 0, 1, 1,
-0.02325385, -0.8148234, -2.182812, 0, 0, 0, 1, 1,
-0.0207754, -0.7610891, -1.702779, 0, 0, 0, 1, 1,
-0.01968416, 0.2057581, -0.280533, 0, 0, 0, 1, 1,
-0.01937233, 0.1284238, 0.7808836, 0, 0, 0, 1, 1,
-0.01901699, -1.400228, -3.059024, 0, 0, 0, 1, 1,
-0.01291587, 0.7455384, -0.9647307, 0, 0, 0, 1, 1,
-0.009598339, 0.4888565, 0.4851227, 0, 0, 0, 1, 1,
-0.009252377, 1.132849, 1.92059, 1, 1, 1, 1, 1,
-0.006838953, 1.064129, 1.237951, 1, 1, 1, 1, 1,
-0.006294538, 0.199644, -0.1413694, 1, 1, 1, 1, 1,
-0.005239706, 0.2625072, 1.173515, 1, 1, 1, 1, 1,
-0.004662433, 2.342364, 1.49261, 1, 1, 1, 1, 1,
-0.0002278849, 1.319145, 1.02232, 1, 1, 1, 1, 1,
0.002415886, -0.2617513, 5.114023, 1, 1, 1, 1, 1,
0.005081483, 0.3138911, 0.3705183, 1, 1, 1, 1, 1,
0.01032049, -1.409807, 4.319184, 1, 1, 1, 1, 1,
0.01158974, -1.847239, 1.941897, 1, 1, 1, 1, 1,
0.0139094, 1.424487, 0.4298949, 1, 1, 1, 1, 1,
0.01508593, 1.087576, -0.8121997, 1, 1, 1, 1, 1,
0.01544454, -0.3711249, 4.79735, 1, 1, 1, 1, 1,
0.02255973, -0.5367821, 3.396582, 1, 1, 1, 1, 1,
0.02400877, -0.0008984955, -0.06048635, 1, 1, 1, 1, 1,
0.02649355, -0.745746, 2.462361, 0, 0, 1, 1, 1,
0.02750495, -0.2969378, 2.16336, 1, 0, 0, 1, 1,
0.04288299, 1.515887, 0.2293658, 1, 0, 0, 1, 1,
0.0433434, 0.2564763, 2.791436, 1, 0, 0, 1, 1,
0.04512694, -0.007973297, 2.145505, 1, 0, 0, 1, 1,
0.04621848, 1.608057, -0.02416193, 1, 0, 0, 1, 1,
0.04624911, -0.7133226, 2.668715, 0, 0, 0, 1, 1,
0.04892635, -0.611066, 3.815809, 0, 0, 0, 1, 1,
0.05397207, 0.517647, -1.145347, 0, 0, 0, 1, 1,
0.05434292, 0.3871998, 0.3703139, 0, 0, 0, 1, 1,
0.05571513, -0.3432914, 2.444777, 0, 0, 0, 1, 1,
0.05603247, -0.6515836, 2.938622, 0, 0, 0, 1, 1,
0.0568559, -0.4734726, 1.467336, 0, 0, 0, 1, 1,
0.05813327, -1.315073, 2.126186, 1, 1, 1, 1, 1,
0.06076496, -0.2406855, 3.362096, 1, 1, 1, 1, 1,
0.06118425, 0.0580274, -0.09735908, 1, 1, 1, 1, 1,
0.06187594, -0.07617323, 1.682134, 1, 1, 1, 1, 1,
0.06590834, -1.88203, 3.704507, 1, 1, 1, 1, 1,
0.06723993, -1.878394, 2.966447, 1, 1, 1, 1, 1,
0.06944127, 1.500154, 0.2973768, 1, 1, 1, 1, 1,
0.06958748, -0.6244696, 2.952722, 1, 1, 1, 1, 1,
0.08172668, 1.287686, 0.3751862, 1, 1, 1, 1, 1,
0.08749489, 1.519266, 1.202185, 1, 1, 1, 1, 1,
0.08991756, -0.1421816, 2.4007, 1, 1, 1, 1, 1,
0.09285586, 0.03905034, 2.859015, 1, 1, 1, 1, 1,
0.09415309, -0.01007246, 2.321416, 1, 1, 1, 1, 1,
0.09630616, 1.77576, -0.9341748, 1, 1, 1, 1, 1,
0.09700513, -0.1267763, 2.6009, 1, 1, 1, 1, 1,
0.09860853, 0.4524027, 0.8176748, 0, 0, 1, 1, 1,
0.109556, 0.1215172, 0.5088194, 1, 0, 0, 1, 1,
0.1104273, 0.4754221, -1.298644, 1, 0, 0, 1, 1,
0.112942, 0.05355069, 2.11589, 1, 0, 0, 1, 1,
0.1176507, 1.002844, -0.6174203, 1, 0, 0, 1, 1,
0.1194383, -0.5619308, 1.686747, 1, 0, 0, 1, 1,
0.1195656, 0.8142466, -1.371339, 0, 0, 0, 1, 1,
0.1211614, -0.4096445, 1.599068, 0, 0, 0, 1, 1,
0.1227271, 1.42933, 0.1006185, 0, 0, 0, 1, 1,
0.1242048, 1.083299, 0.1137617, 0, 0, 0, 1, 1,
0.1247011, -0.8714421, 4.412401, 0, 0, 0, 1, 1,
0.1340946, 1.41811, 0.25401, 0, 0, 0, 1, 1,
0.1364474, 1.498634, -0.5742226, 0, 0, 0, 1, 1,
0.1393045, -0.5796514, 4.430191, 1, 1, 1, 1, 1,
0.1399383, 1.138206, 0.03623432, 1, 1, 1, 1, 1,
0.1400195, 0.3441305, -0.6033637, 1, 1, 1, 1, 1,
0.1414034, 1.600395, 0.02884783, 1, 1, 1, 1, 1,
0.1471083, 1.248244, 1.07138, 1, 1, 1, 1, 1,
0.148303, 4.177876, -0.1094132, 1, 1, 1, 1, 1,
0.1517202, -0.2571518, 2.414241, 1, 1, 1, 1, 1,
0.1548748, -0.8437642, 3.559648, 1, 1, 1, 1, 1,
0.1566532, -0.4378027, 4.254376, 1, 1, 1, 1, 1,
0.157701, 0.2894521, 0.3896346, 1, 1, 1, 1, 1,
0.1581371, 1.296433, 1.892971, 1, 1, 1, 1, 1,
0.1677438, 0.7860404, 0.8338329, 1, 1, 1, 1, 1,
0.1724535, 0.7027134, 0.002040923, 1, 1, 1, 1, 1,
0.1780856, 0.4356446, 0.6860664, 1, 1, 1, 1, 1,
0.1788672, 0.9596711, -0.1566093, 1, 1, 1, 1, 1,
0.1830706, -0.9001479, 4.168246, 0, 0, 1, 1, 1,
0.1870115, 0.01031113, 2.650962, 1, 0, 0, 1, 1,
0.1896308, -1.360636, 4.586909, 1, 0, 0, 1, 1,
0.192045, 0.1172106, -0.2014899, 1, 0, 0, 1, 1,
0.1931966, -0.1328258, 2.150032, 1, 0, 0, 1, 1,
0.1934418, -1.138599, 2.758037, 1, 0, 0, 1, 1,
0.1959802, -0.1411879, 3.095319, 0, 0, 0, 1, 1,
0.1984051, -0.4579943, 4.063807, 0, 0, 0, 1, 1,
0.1997305, 0.6124402, -0.7032835, 0, 0, 0, 1, 1,
0.2008023, 0.1820205, 0.5389691, 0, 0, 0, 1, 1,
0.2016688, 0.6787761, -1.374224, 0, 0, 0, 1, 1,
0.2062141, 0.06892674, 2.113932, 0, 0, 0, 1, 1,
0.2076985, 0.7326649, 1.480579, 0, 0, 0, 1, 1,
0.2094738, -1.615375, 5.077143, 1, 1, 1, 1, 1,
0.2128872, 1.342066, 0.5702265, 1, 1, 1, 1, 1,
0.2147553, -1.715364, 3.381855, 1, 1, 1, 1, 1,
0.2150156, -0.06739693, 1.609751, 1, 1, 1, 1, 1,
0.2191494, -1.283663, 3.169156, 1, 1, 1, 1, 1,
0.2226061, -0.5629143, 1.735312, 1, 1, 1, 1, 1,
0.2258888, 0.7060379, 1.736178, 1, 1, 1, 1, 1,
0.2295517, -0.5836716, 2.341072, 1, 1, 1, 1, 1,
0.2305519, 0.4686053, -0.1985527, 1, 1, 1, 1, 1,
0.2350889, 0.4824972, 0.969071, 1, 1, 1, 1, 1,
0.2375896, 0.6210381, 0.5336499, 1, 1, 1, 1, 1,
0.2395638, 0.9543823, 0.8053139, 1, 1, 1, 1, 1,
0.2423986, 0.4409475, 0.1229558, 1, 1, 1, 1, 1,
0.248145, 1.380643, 0.7530117, 1, 1, 1, 1, 1,
0.2484815, -0.8253481, 1.595024, 1, 1, 1, 1, 1,
0.2488466, -1.563511, 4.941103, 0, 0, 1, 1, 1,
0.2510459, 0.2657368, 1.825478, 1, 0, 0, 1, 1,
0.2534017, -0.4755197, 2.431164, 1, 0, 0, 1, 1,
0.2546721, -0.9747814, 2.83489, 1, 0, 0, 1, 1,
0.2549394, 0.5357156, 1.593113, 1, 0, 0, 1, 1,
0.2565129, 0.8359583, 0.7932315, 1, 0, 0, 1, 1,
0.2602023, 1.081028, -0.5966134, 0, 0, 0, 1, 1,
0.2623368, -0.4374109, 0.9830862, 0, 0, 0, 1, 1,
0.2636291, -0.3570284, 1.933285, 0, 0, 0, 1, 1,
0.2645867, -1.92001, 2.995862, 0, 0, 0, 1, 1,
0.2660466, -2.043153, 2.054772, 0, 0, 0, 1, 1,
0.2674113, 0.1150952, 0.9530096, 0, 0, 0, 1, 1,
0.2679314, 2.32744, -0.8660293, 0, 0, 0, 1, 1,
0.2686574, 1.728251, -0.2951376, 1, 1, 1, 1, 1,
0.2703252, -3.157021, 2.054079, 1, 1, 1, 1, 1,
0.2709035, -0.1623322, 1.481842, 1, 1, 1, 1, 1,
0.2784999, -0.02417661, 0.01714271, 1, 1, 1, 1, 1,
0.2850363, -0.6052862, 4.571624, 1, 1, 1, 1, 1,
0.2896531, 0.1997842, -0.4765811, 1, 1, 1, 1, 1,
0.2953422, 0.3396793, -0.8992032, 1, 1, 1, 1, 1,
0.2974783, -0.3545577, 2.343506, 1, 1, 1, 1, 1,
0.303229, 0.2940829, 1.138044, 1, 1, 1, 1, 1,
0.3044155, -0.06418993, 1.660612, 1, 1, 1, 1, 1,
0.3062157, -1.544015, 3.232995, 1, 1, 1, 1, 1,
0.3074022, -1.995324, 3.404837, 1, 1, 1, 1, 1,
0.3080909, 0.5028356, -0.2341658, 1, 1, 1, 1, 1,
0.3092711, 0.05444644, 3.009197, 1, 1, 1, 1, 1,
0.3098378, -0.07844079, 2.818238, 1, 1, 1, 1, 1,
0.3147518, -0.7745342, 2.438437, 0, 0, 1, 1, 1,
0.3150957, 0.4854924, 0.2460472, 1, 0, 0, 1, 1,
0.3154934, -0.2759223, 3.566116, 1, 0, 0, 1, 1,
0.316367, -0.1870703, 3.491133, 1, 0, 0, 1, 1,
0.3166204, -0.7768681, 1.940699, 1, 0, 0, 1, 1,
0.3210825, 0.09914222, 1.622336, 1, 0, 0, 1, 1,
0.3261924, -0.7611605, 2.99741, 0, 0, 0, 1, 1,
0.328848, -1.651439, 2.206624, 0, 0, 0, 1, 1,
0.3393313, 1.073098, 0.6456605, 0, 0, 0, 1, 1,
0.3403252, 1.226084, -0.6215454, 0, 0, 0, 1, 1,
0.3459994, -1.250418, 2.310985, 0, 0, 0, 1, 1,
0.3497827, 0.2689008, 2.656846, 0, 0, 0, 1, 1,
0.351093, -0.7576065, 3.766352, 0, 0, 0, 1, 1,
0.3516616, -0.04896942, 0.3347096, 1, 1, 1, 1, 1,
0.3517236, -0.689379, 3.99774, 1, 1, 1, 1, 1,
0.3532856, -0.1904186, 1.158037, 1, 1, 1, 1, 1,
0.3553187, 2.316806, -0.0654789, 1, 1, 1, 1, 1,
0.3567319, -0.9276919, 0.2691752, 1, 1, 1, 1, 1,
0.3591333, 0.02808284, -1.268507, 1, 1, 1, 1, 1,
0.3653414, 0.6553299, 0.1128507, 1, 1, 1, 1, 1,
0.3703969, -1.861217, 3.044929, 1, 1, 1, 1, 1,
0.3721913, -1.257251, 1.882402, 1, 1, 1, 1, 1,
0.3751984, 0.05576587, 1.353557, 1, 1, 1, 1, 1,
0.3815261, -0.1373468, 1.085102, 1, 1, 1, 1, 1,
0.3861395, 0.6059296, 0.9311224, 1, 1, 1, 1, 1,
0.3928635, -0.5626542, 2.044994, 1, 1, 1, 1, 1,
0.3949312, 0.5119926, 1.31847, 1, 1, 1, 1, 1,
0.3953168, 0.4847021, 1.228886, 1, 1, 1, 1, 1,
0.3988228, -0.3470147, 2.190614, 0, 0, 1, 1, 1,
0.3999797, 0.8923335, 1.100161, 1, 0, 0, 1, 1,
0.4004583, 0.3345366, 0.6899586, 1, 0, 0, 1, 1,
0.400703, 0.6033959, 0.4744242, 1, 0, 0, 1, 1,
0.4011565, -0.3143435, 0.6730435, 1, 0, 0, 1, 1,
0.4035915, 0.004901879, 1.539981, 1, 0, 0, 1, 1,
0.4056346, 1.48914, -0.6044315, 0, 0, 0, 1, 1,
0.4077755, 1.799787, 0.2616887, 0, 0, 0, 1, 1,
0.4102981, 0.3385862, 0.5851991, 0, 0, 0, 1, 1,
0.4115015, -0.6878889, 1.749684, 0, 0, 0, 1, 1,
0.4126425, 1.512204, 0.2663318, 0, 0, 0, 1, 1,
0.4156344, -0.6235872, 3.300047, 0, 0, 0, 1, 1,
0.4158906, -0.4295899, 1.385136, 0, 0, 0, 1, 1,
0.4167212, -0.265299, 1.399572, 1, 1, 1, 1, 1,
0.4238376, -1.871584, 1.773481, 1, 1, 1, 1, 1,
0.4314972, 0.9955903, 0.1416606, 1, 1, 1, 1, 1,
0.4316625, -0.6038066, 1.109848, 1, 1, 1, 1, 1,
0.43311, 0.7233239, -0.6523097, 1, 1, 1, 1, 1,
0.438402, 2.275489, 0.3150674, 1, 1, 1, 1, 1,
0.4469918, -1.289394, 4.144435, 1, 1, 1, 1, 1,
0.4487924, 1.87095, 1.907214, 1, 1, 1, 1, 1,
0.4504203, 2.00977, 0.9091079, 1, 1, 1, 1, 1,
0.4542979, 0.7088167, 0.3605877, 1, 1, 1, 1, 1,
0.4545437, 0.7979403, 2.566677, 1, 1, 1, 1, 1,
0.4605337, 1.056486, 0.5757675, 1, 1, 1, 1, 1,
0.4632398, 1.835606, 0.3090095, 1, 1, 1, 1, 1,
0.4648714, 0.3298371, 1.921396, 1, 1, 1, 1, 1,
0.4649881, 0.7067003, 0.4006677, 1, 1, 1, 1, 1,
0.4653331, 0.1273964, 2.800096, 0, 0, 1, 1, 1,
0.4703818, 1.502557, 0.1454064, 1, 0, 0, 1, 1,
0.4752354, 0.5818624, -0.276604, 1, 0, 0, 1, 1,
0.4813972, -1.219477, 3.621154, 1, 0, 0, 1, 1,
0.4917576, 1.257185, 1.360712, 1, 0, 0, 1, 1,
0.493885, 0.2989892, 1.535642, 1, 0, 0, 1, 1,
0.4953047, 0.2603975, -0.9609873, 0, 0, 0, 1, 1,
0.4962662, -0.8286393, 2.468206, 0, 0, 0, 1, 1,
0.4978647, 2.327054, 0.2619854, 0, 0, 0, 1, 1,
0.498324, 0.9786493, 0.8745004, 0, 0, 0, 1, 1,
0.5027744, -1.524313, 2.281082, 0, 0, 0, 1, 1,
0.5087767, 1.072755, 0.7783255, 0, 0, 0, 1, 1,
0.50906, -0.2043221, 3.539986, 0, 0, 0, 1, 1,
0.5142114, 0.03825055, 1.7432, 1, 1, 1, 1, 1,
0.5170219, 0.5434355, 1.819823, 1, 1, 1, 1, 1,
0.5179637, -0.2724139, 0.803297, 1, 1, 1, 1, 1,
0.518778, -0.08818199, 1.392554, 1, 1, 1, 1, 1,
0.5210246, -1.085066, 2.410813, 1, 1, 1, 1, 1,
0.5253078, 1.291857, -0.1933302, 1, 1, 1, 1, 1,
0.5271483, -0.1008761, 3.011203, 1, 1, 1, 1, 1,
0.5350506, -0.3733581, 1.142182, 1, 1, 1, 1, 1,
0.5393201, -1.511457, 1.969619, 1, 1, 1, 1, 1,
0.5431453, 0.6047835, 1.832565, 1, 1, 1, 1, 1,
0.5445385, 0.6401822, -0.9949722, 1, 1, 1, 1, 1,
0.5463169, 1.8258, -2.58297, 1, 1, 1, 1, 1,
0.5464866, 0.360976, -0.3621009, 1, 1, 1, 1, 1,
0.546697, 0.8954928, 1.278559, 1, 1, 1, 1, 1,
0.5518848, -0.0199907, 0.8540781, 1, 1, 1, 1, 1,
0.5545275, 0.09668976, 0.3194922, 0, 0, 1, 1, 1,
0.5553913, 0.8856856, 1.988033, 1, 0, 0, 1, 1,
0.555949, -0.7036341, 1.601256, 1, 0, 0, 1, 1,
0.5581774, 0.101215, 0.4970777, 1, 0, 0, 1, 1,
0.5586154, 0.5530514, 0.08471473, 1, 0, 0, 1, 1,
0.5617262, 0.07382978, 1.663593, 1, 0, 0, 1, 1,
0.5644288, 0.6444818, 2.967045, 0, 0, 0, 1, 1,
0.5681074, -0.465669, 1.622684, 0, 0, 0, 1, 1,
0.5769254, -0.8776233, 4.140519, 0, 0, 0, 1, 1,
0.5804603, -0.3860165, 0.566447, 0, 0, 0, 1, 1,
0.5918062, -0.6076057, 1.132437, 0, 0, 0, 1, 1,
0.5926303, 0.6633745, 1.032787, 0, 0, 0, 1, 1,
0.5930632, -1.2419, 1.949615, 0, 0, 0, 1, 1,
0.5950589, 0.5050213, 1.354164, 1, 1, 1, 1, 1,
0.6039817, -0.02950267, 3.244333, 1, 1, 1, 1, 1,
0.6050112, 0.4240407, 1.890302, 1, 1, 1, 1, 1,
0.6091377, 0.4838826, 0.5492709, 1, 1, 1, 1, 1,
0.6092774, 1.856882, 0.1330446, 1, 1, 1, 1, 1,
0.6141092, -0.9528563, 3.742495, 1, 1, 1, 1, 1,
0.6150274, -0.2329386, 2.373795, 1, 1, 1, 1, 1,
0.6157069, -2.76066, 2.759014, 1, 1, 1, 1, 1,
0.6168779, -0.6051584, 4.161705, 1, 1, 1, 1, 1,
0.6209174, 0.7747608, 0.9063116, 1, 1, 1, 1, 1,
0.6216633, -0.3533655, 1.505472, 1, 1, 1, 1, 1,
0.6233395, 0.02614122, 1.373508, 1, 1, 1, 1, 1,
0.6290221, -0.7014529, 4.385351, 1, 1, 1, 1, 1,
0.6355138, -0.270014, 2.252045, 1, 1, 1, 1, 1,
0.6412015, -0.1255278, 2.880473, 1, 1, 1, 1, 1,
0.6454712, 0.2780008, 0.6998025, 0, 0, 1, 1, 1,
0.6469157, -0.3999083, 1.897179, 1, 0, 0, 1, 1,
0.6489586, -1.153865, 2.490967, 1, 0, 0, 1, 1,
0.6615359, 0.00957895, 2.905248, 1, 0, 0, 1, 1,
0.6617725, 1.041049, 1.178474, 1, 0, 0, 1, 1,
0.6618962, -1.051579, 1.89347, 1, 0, 0, 1, 1,
0.6656339, -2.145409, 2.607495, 0, 0, 0, 1, 1,
0.666853, 1.743972, 1.509762, 0, 0, 0, 1, 1,
0.6680529, -0.03274322, 0.334997, 0, 0, 0, 1, 1,
0.6706924, 0.2583381, -0.03585545, 0, 0, 0, 1, 1,
0.6711785, -0.3900499, 2.973742, 0, 0, 0, 1, 1,
0.6721186, 0.1785413, 1.006179, 0, 0, 0, 1, 1,
0.6800968, 0.5807302, 1.487134, 0, 0, 0, 1, 1,
0.6817494, -0.4331627, 2.762339, 1, 1, 1, 1, 1,
0.6827666, -1.244822, 3.200697, 1, 1, 1, 1, 1,
0.6849446, 0.6200504, 2.115835, 1, 1, 1, 1, 1,
0.6850371, 1.802832, 0.1505122, 1, 1, 1, 1, 1,
0.687326, 0.650265, 0.7896237, 1, 1, 1, 1, 1,
0.7021953, -0.4741141, 1.941797, 1, 1, 1, 1, 1,
0.706684, 0.1865396, 0.9289559, 1, 1, 1, 1, 1,
0.7092372, 0.4648652, 0.8498111, 1, 1, 1, 1, 1,
0.709649, -0.2698432, 1.77723, 1, 1, 1, 1, 1,
0.7123494, -2.113714, 2.255251, 1, 1, 1, 1, 1,
0.7161533, 0.2254996, 1.441314, 1, 1, 1, 1, 1,
0.7184517, 1.454875, -1.405246, 1, 1, 1, 1, 1,
0.7283381, -1.407383, 3.87805, 1, 1, 1, 1, 1,
0.7345343, -0.4404067, 1.63531, 1, 1, 1, 1, 1,
0.7359573, -1.28654, 2.236398, 1, 1, 1, 1, 1,
0.736079, 0.9994408, 0.790873, 0, 0, 1, 1, 1,
0.7457234, -0.1857439, 1.282276, 1, 0, 0, 1, 1,
0.7466436, -1.161934, 2.347024, 1, 0, 0, 1, 1,
0.7491476, -0.3476082, 1.425976, 1, 0, 0, 1, 1,
0.7522041, 0.3042783, 2.237435, 1, 0, 0, 1, 1,
0.754532, -0.4865533, 4.159193, 1, 0, 0, 1, 1,
0.7551501, 0.01010443, 1.347178, 0, 0, 0, 1, 1,
0.757084, 1.46523, -0.5250868, 0, 0, 0, 1, 1,
0.7763442, -0.6638353, 2.340493, 0, 0, 0, 1, 1,
0.7770085, 0.1543824, 0.5935018, 0, 0, 0, 1, 1,
0.7789877, -1.201064, 1.483333, 0, 0, 0, 1, 1,
0.7835966, -0.5667906, 1.734532, 0, 0, 0, 1, 1,
0.7851642, 0.6189364, -0.5240976, 0, 0, 0, 1, 1,
0.7882565, 0.4111264, 2.921164, 1, 1, 1, 1, 1,
0.8024473, 0.5142744, 0.6689234, 1, 1, 1, 1, 1,
0.8045154, -1.037451, 3.480619, 1, 1, 1, 1, 1,
0.8062717, -0.7428896, 3.876308, 1, 1, 1, 1, 1,
0.8066335, 1.437855, 1.486252, 1, 1, 1, 1, 1,
0.8131083, -0.3316289, 2.853817, 1, 1, 1, 1, 1,
0.8154902, 0.135468, 1.687664, 1, 1, 1, 1, 1,
0.820817, -0.06598271, 2.522178, 1, 1, 1, 1, 1,
0.8223693, 0.9322652, 1.661747, 1, 1, 1, 1, 1,
0.8236256, -0.8131328, 2.193939, 1, 1, 1, 1, 1,
0.8237913, -1.028071, 2.972862, 1, 1, 1, 1, 1,
0.828289, 1.182177, 1.540471, 1, 1, 1, 1, 1,
0.829848, 0.200226, 0.477801, 1, 1, 1, 1, 1,
0.8340504, 0.7870101, 1.224583, 1, 1, 1, 1, 1,
0.8434091, 0.6229985, 0.6667464, 1, 1, 1, 1, 1,
0.8475612, 0.006065182, 2.876328, 0, 0, 1, 1, 1,
0.8511457, -0.7718386, 1.069824, 1, 0, 0, 1, 1,
0.8538186, 0.2721656, 1.374297, 1, 0, 0, 1, 1,
0.8604688, -0.3587893, 1.828638, 1, 0, 0, 1, 1,
0.8658379, 1.141195, 1.262879, 1, 0, 0, 1, 1,
0.8673705, -2.761142, 5.205425, 1, 0, 0, 1, 1,
0.8710292, 0.2362427, 0.7339932, 0, 0, 0, 1, 1,
0.8752837, 0.7156882, 0.6083134, 0, 0, 0, 1, 1,
0.8771241, -1.038418, 2.911094, 0, 0, 0, 1, 1,
0.8773459, -0.6347181, 2.303873, 0, 0, 0, 1, 1,
0.886106, -1.584629, 4.293559, 0, 0, 0, 1, 1,
0.886614, 0.3129268, 3.523013, 0, 0, 0, 1, 1,
0.8880352, 1.148958, 0.3022479, 0, 0, 0, 1, 1,
0.8907232, 0.6010446, 0.2059651, 1, 1, 1, 1, 1,
0.8941406, -0.8431138, 1.631579, 1, 1, 1, 1, 1,
0.90076, 1.43129, 2.11156, 1, 1, 1, 1, 1,
0.9015338, -0.5621915, 3.901838, 1, 1, 1, 1, 1,
0.9127821, 0.1216424, 0.08602223, 1, 1, 1, 1, 1,
0.9137908, 0.4600815, 1.328701, 1, 1, 1, 1, 1,
0.9311855, 0.6038101, 1.601876, 1, 1, 1, 1, 1,
0.9313173, 0.5152131, 1.063977, 1, 1, 1, 1, 1,
0.9317997, 0.05627062, 0.7321278, 1, 1, 1, 1, 1,
0.9327664, -1.01177, 3.423037, 1, 1, 1, 1, 1,
0.9334638, -0.07262506, 2.578082, 1, 1, 1, 1, 1,
0.9419352, -0.5988908, 2.361328, 1, 1, 1, 1, 1,
0.9452004, 0.6350905, 0.5079867, 1, 1, 1, 1, 1,
0.9471239, -0.9376978, 3.180362, 1, 1, 1, 1, 1,
0.9485222, 0.3173901, -1.027024, 1, 1, 1, 1, 1,
0.9522278, -1.58349, 2.609664, 0, 0, 1, 1, 1,
0.9526956, 0.9480143, 1.895225, 1, 0, 0, 1, 1,
0.9595916, -1.420328, 1.626005, 1, 0, 0, 1, 1,
0.961196, 0.1657159, 2.265723, 1, 0, 0, 1, 1,
0.9622912, -0.2909967, 0.9372274, 1, 0, 0, 1, 1,
0.9640995, -1.059487, 3.580707, 1, 0, 0, 1, 1,
0.96668, -1.004371, 2.579076, 0, 0, 0, 1, 1,
0.9695796, 0.1836373, 0.7519938, 0, 0, 0, 1, 1,
0.9704393, -1.362887, 1.766915, 0, 0, 0, 1, 1,
0.97545, 0.3522139, 1.643051, 0, 0, 0, 1, 1,
0.9859963, 1.511437, 0.9372016, 0, 0, 0, 1, 1,
0.9863797, -0.5037871, 0.7282994, 0, 0, 0, 1, 1,
0.9890868, 0.5948572, 1.699608, 0, 0, 0, 1, 1,
0.9917244, -0.7450818, 2.209005, 1, 1, 1, 1, 1,
1.00048, -1.022109, 2.115349, 1, 1, 1, 1, 1,
1.002148, -0.05560248, 1.584884, 1, 1, 1, 1, 1,
1.006197, -0.1985777, 2.712194, 1, 1, 1, 1, 1,
1.006752, -0.4466959, 2.031769, 1, 1, 1, 1, 1,
1.008757, -1.573963, 2.29935, 1, 1, 1, 1, 1,
1.01234, -0.9904681, 2.915914, 1, 1, 1, 1, 1,
1.014742, 0.6495607, 1.383822, 1, 1, 1, 1, 1,
1.044922, -0.4465602, 2.856771, 1, 1, 1, 1, 1,
1.045865, -0.3180904, 0.6666623, 1, 1, 1, 1, 1,
1.054717, -0.5287905, 4.258097, 1, 1, 1, 1, 1,
1.05622, -0.2850356, -1.63282, 1, 1, 1, 1, 1,
1.056605, 0.2558789, -0.07643541, 1, 1, 1, 1, 1,
1.058968, 1.585414, 1.429635, 1, 1, 1, 1, 1,
1.068789, 0.391645, 2.823428, 1, 1, 1, 1, 1,
1.070779, -0.7684148, 2.942269, 0, 0, 1, 1, 1,
1.07596, 0.1669785, 0.7780365, 1, 0, 0, 1, 1,
1.078934, 0.3177243, 1.255695, 1, 0, 0, 1, 1,
1.081422, -0.5936751, 2.654879, 1, 0, 0, 1, 1,
1.102736, -1.152487, 2.627157, 1, 0, 0, 1, 1,
1.103032, 0.9989954, 0.5667706, 1, 0, 0, 1, 1,
1.108902, 0.8327635, 1.304595, 0, 0, 0, 1, 1,
1.116474, -1.001539, 3.123074, 0, 0, 0, 1, 1,
1.120229, -0.9712666, 2.262871, 0, 0, 0, 1, 1,
1.120918, 0.8943425, 1.491227, 0, 0, 0, 1, 1,
1.123022, 0.8516281, 1.493969, 0, 0, 0, 1, 1,
1.123748, 0.4932446, 0.2932119, 0, 0, 0, 1, 1,
1.127135, -0.6189179, 3.510534, 0, 0, 0, 1, 1,
1.127758, 0.09271377, 2.759722, 1, 1, 1, 1, 1,
1.134409, 0.1264866, 0.1289673, 1, 1, 1, 1, 1,
1.136268, 0.2761829, 1.50149, 1, 1, 1, 1, 1,
1.145502, -0.05549552, 1.321645, 1, 1, 1, 1, 1,
1.149673, 0.1914832, 3.144959, 1, 1, 1, 1, 1,
1.159456, -1.76451, 2.95665, 1, 1, 1, 1, 1,
1.162667, 0.4892006, 1.440475, 1, 1, 1, 1, 1,
1.167644, -0.4983726, 3.866139, 1, 1, 1, 1, 1,
1.173555, 1.344249, 0.771623, 1, 1, 1, 1, 1,
1.175997, -1.268322, 1.326617, 1, 1, 1, 1, 1,
1.178199, -0.2365802, 1.7554, 1, 1, 1, 1, 1,
1.190149, -1.129765, 1.597157, 1, 1, 1, 1, 1,
1.195877, 0.5005726, 1.868567, 1, 1, 1, 1, 1,
1.204975, 1.559066, -1.915547, 1, 1, 1, 1, 1,
1.210508, 0.05859578, -0.7384427, 1, 1, 1, 1, 1,
1.216097, 0.1508243, 3.274686, 0, 0, 1, 1, 1,
1.216705, -1.139106, 3.263484, 1, 0, 0, 1, 1,
1.222702, -0.1631147, 2.494632, 1, 0, 0, 1, 1,
1.229532, 0.6288987, 2.323707, 1, 0, 0, 1, 1,
1.244724, 0.4067837, 0.898054, 1, 0, 0, 1, 1,
1.253287, 1.29907, 2.210546, 1, 0, 0, 1, 1,
1.268801, 0.3234762, 0.7789322, 0, 0, 0, 1, 1,
1.269389, 0.03793638, 1.155674, 0, 0, 0, 1, 1,
1.271389, 1.049949, 1.831114, 0, 0, 0, 1, 1,
1.274861, 0.6027017, 0.5638185, 0, 0, 0, 1, 1,
1.280968, 1.349125, 1.837119, 0, 0, 0, 1, 1,
1.284263, 0.6191929, 2.234141, 0, 0, 0, 1, 1,
1.287978, -0.1507224, 1.084867, 0, 0, 0, 1, 1,
1.289206, -0.7066021, 2.549757, 1, 1, 1, 1, 1,
1.290279, 0.4145768, 1.007664, 1, 1, 1, 1, 1,
1.30308, 1.396665, 0.5430376, 1, 1, 1, 1, 1,
1.307747, 0.7655539, 0.3538025, 1, 1, 1, 1, 1,
1.312093, -1.53359, 3.447653, 1, 1, 1, 1, 1,
1.312841, 1.358935, -1.883625, 1, 1, 1, 1, 1,
1.314946, 0.08845563, 1.391008, 1, 1, 1, 1, 1,
1.318123, 0.3819222, 2.644804, 1, 1, 1, 1, 1,
1.324489, 0.3471921, 2.043614, 1, 1, 1, 1, 1,
1.32542, 0.005700478, 1.51568, 1, 1, 1, 1, 1,
1.327729, -2.429203, 2.860207, 1, 1, 1, 1, 1,
1.337778, 0.5244366, 0.950046, 1, 1, 1, 1, 1,
1.344249, -0.8987105, 1.764924, 1, 1, 1, 1, 1,
1.344265, 0.5193313, 1.380915, 1, 1, 1, 1, 1,
1.357661, 1.302931, 0.9732637, 1, 1, 1, 1, 1,
1.363382, -0.9138624, 2.112797, 0, 0, 1, 1, 1,
1.363447, -0.7350163, 1.969938, 1, 0, 0, 1, 1,
1.363857, -0.2948236, 1.46562, 1, 0, 0, 1, 1,
1.363947, 0.5355046, 0.816256, 1, 0, 0, 1, 1,
1.365715, -2.295478, 2.235233, 1, 0, 0, 1, 1,
1.374966, 0.4517916, 0.5718268, 1, 0, 0, 1, 1,
1.390644, -0.8308358, 0.815421, 0, 0, 0, 1, 1,
1.392279, 0.1475784, 2.19005, 0, 0, 0, 1, 1,
1.393126, 0.6381995, 1.550403, 0, 0, 0, 1, 1,
1.399401, -0.9951949, 1.567331, 0, 0, 0, 1, 1,
1.402983, -0.5433063, 2.41241, 0, 0, 0, 1, 1,
1.41528, 1.12269, -0.03305136, 0, 0, 0, 1, 1,
1.422268, 0.6004124, -0.1480551, 0, 0, 0, 1, 1,
1.428517, -1.435477, 1.690531, 1, 1, 1, 1, 1,
1.428929, -0.3435362, 3.198539, 1, 1, 1, 1, 1,
1.441838, 1.156912, 1.427796, 1, 1, 1, 1, 1,
1.447086, 0.1631381, 1.766174, 1, 1, 1, 1, 1,
1.447209, -2.226632, 1.903886, 1, 1, 1, 1, 1,
1.461437, 2.236296, 0.8180053, 1, 1, 1, 1, 1,
1.4764, -0.01073894, 3.334023, 1, 1, 1, 1, 1,
1.481747, 0.4837287, 1.978091, 1, 1, 1, 1, 1,
1.482552, 0.01946636, 1.526532, 1, 1, 1, 1, 1,
1.486389, 1.076794, 0.1244658, 1, 1, 1, 1, 1,
1.490192, -0.8106406, 2.955848, 1, 1, 1, 1, 1,
1.492089, 0.1865537, 3.533814, 1, 1, 1, 1, 1,
1.498973, -0.08816203, 2.035804, 1, 1, 1, 1, 1,
1.516136, 1.084082, 1.443718, 1, 1, 1, 1, 1,
1.523703, -0.5124683, 2.966192, 1, 1, 1, 1, 1,
1.53374, 1.210546, 2.412288, 0, 0, 1, 1, 1,
1.549133, -0.1397437, 2.090723, 1, 0, 0, 1, 1,
1.557217, -0.5288841, 4.142533, 1, 0, 0, 1, 1,
1.575361, -2.44963, 0.7925579, 1, 0, 0, 1, 1,
1.577828, -1.890539, 4.071464, 1, 0, 0, 1, 1,
1.589679, 0.03396252, 1.563222, 1, 0, 0, 1, 1,
1.608258, 0.3088044, 0.9929567, 0, 0, 0, 1, 1,
1.647835, 1.637271, 1.555779, 0, 0, 0, 1, 1,
1.670781, -2.218783, 3.490084, 0, 0, 0, 1, 1,
1.677402, -1.348872, 2.867023, 0, 0, 0, 1, 1,
1.677717, 0.9583862, 1.351731, 0, 0, 0, 1, 1,
1.689069, -0.0893788, 1.000891, 0, 0, 0, 1, 1,
1.691262, 1.034049, 0.6908218, 0, 0, 0, 1, 1,
1.698554, 0.124436, 4.655217, 1, 1, 1, 1, 1,
1.705297, 1.517429, 0.4273238, 1, 1, 1, 1, 1,
1.723796, -1.143641, 2.17252, 1, 1, 1, 1, 1,
1.724558, 1.223272, -0.6488205, 1, 1, 1, 1, 1,
1.73585, 0.2411028, 0.681002, 1, 1, 1, 1, 1,
1.73845, -0.9612222, 2.17766, 1, 1, 1, 1, 1,
1.764006, -0.2650188, 2.305706, 1, 1, 1, 1, 1,
1.769363, -2.063515, 2.29162, 1, 1, 1, 1, 1,
1.771717, -0.2129649, 1.912218, 1, 1, 1, 1, 1,
1.810747, 0.2562864, 0.6148909, 1, 1, 1, 1, 1,
1.829713, 0.4953832, 0.9204358, 1, 1, 1, 1, 1,
1.876657, 0.5388351, 0.5862429, 1, 1, 1, 1, 1,
1.892358, -0.8402511, 1.012215, 1, 1, 1, 1, 1,
1.922789, -0.484898, 1.698742, 1, 1, 1, 1, 1,
1.937151, 1.348451, 1.13553, 1, 1, 1, 1, 1,
1.949525, -0.3090374, 2.18217, 0, 0, 1, 1, 1,
1.974002, 0.3612483, 0.003509021, 1, 0, 0, 1, 1,
2.033947, -0.7003059, 0.9987498, 1, 0, 0, 1, 1,
2.040555, -0.2758128, 2.364033, 1, 0, 0, 1, 1,
2.049897, 2.029698, -0.7429257, 1, 0, 0, 1, 1,
2.077082, -0.7873126, 3.204771, 1, 0, 0, 1, 1,
2.111711, 1.22756, 0.7245607, 0, 0, 0, 1, 1,
2.11608, 0.4324221, 3.446101, 0, 0, 0, 1, 1,
2.158562, 0.09962361, -0.5469856, 0, 0, 0, 1, 1,
2.183789, 2.172411, 0.2435529, 0, 0, 0, 1, 1,
2.229322, 0.821907, 2.214475, 0, 0, 0, 1, 1,
2.25084, 1.923743, -0.4338156, 0, 0, 0, 1, 1,
2.335899, -1.439647, -0.9285942, 0, 0, 0, 1, 1,
2.364685, -0.4547604, 1.317839, 1, 1, 1, 1, 1,
2.39586, -0.7363178, 1.756825, 1, 1, 1, 1, 1,
2.434083, 0.6872883, 0.01372007, 1, 1, 1, 1, 1,
2.481262, 2.020861, 1.244724, 1, 1, 1, 1, 1,
2.803893, 1.005959, 2.85986, 1, 1, 1, 1, 1,
2.912535, -1.009921, 2.68853, 1, 1, 1, 1, 1,
3.155464, 1.260567, 0.714031, 1, 1, 1, 1, 1
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
var radius = 9.673694;
var distance = 33.97844;
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
mvMatrix.translate( -0.0655694, -0.510428, 0.02569246 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97844);
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
