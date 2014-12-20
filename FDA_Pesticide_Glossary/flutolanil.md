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
-2.854823, -0.3112366, 0.1787059, 1, 0, 0, 1,
-2.691058, -0.9090868, -1.69847, 1, 0.007843138, 0, 1,
-2.645357, -1.118085, -0.4846127, 1, 0.01176471, 0, 1,
-2.640975, -1.704787, -1.495095, 1, 0.01960784, 0, 1,
-2.545758, -0.8359246, -0.1394307, 1, 0.02352941, 0, 1,
-2.448732, -1.023351, 0.7207662, 1, 0.03137255, 0, 1,
-2.317187, 2.954869, -0.09343196, 1, 0.03529412, 0, 1,
-2.297064, -0.9904175, -3.88332, 1, 0.04313726, 0, 1,
-2.289807, -0.1780956, -1.135653, 1, 0.04705882, 0, 1,
-2.283275, 0.2501601, -2.80548, 1, 0.05490196, 0, 1,
-2.267001, 2.665369, -0.8467717, 1, 0.05882353, 0, 1,
-2.234497, 0.3775531, 0.01394316, 1, 0.06666667, 0, 1,
-2.152284, -0.3891841, -1.315495, 1, 0.07058824, 0, 1,
-2.145078, 1.211705, -0.6692791, 1, 0.07843138, 0, 1,
-2.139966, -1.444546, -3.227003, 1, 0.08235294, 0, 1,
-2.120529, 0.5590124, -0.4823897, 1, 0.09019608, 0, 1,
-2.091094, 0.639859, 0.1973527, 1, 0.09411765, 0, 1,
-2.088443, -0.08568762, -1.608799, 1, 0.1019608, 0, 1,
-2.035621, 1.137926, -0.6134229, 1, 0.1098039, 0, 1,
-2.025867, -0.2897775, -2.068737, 1, 0.1137255, 0, 1,
-2.024903, -0.1570472, -0.09574714, 1, 0.1215686, 0, 1,
-2.017928, 0.9234042, 0.2126067, 1, 0.1254902, 0, 1,
-2.01371, -0.8335714, -3.102213, 1, 0.1333333, 0, 1,
-2.011053, -0.984895, -2.638656, 1, 0.1372549, 0, 1,
-1.977854, 0.12048, -1.848259, 1, 0.145098, 0, 1,
-1.974955, 0.5075259, -0.2896194, 1, 0.1490196, 0, 1,
-1.972898, 0.3202848, -1.828291, 1, 0.1568628, 0, 1,
-1.971357, -0.03907017, -3.328667, 1, 0.1607843, 0, 1,
-1.946884, 0.6053512, -0.7635828, 1, 0.1686275, 0, 1,
-1.939258, 0.05154415, -1.075921, 1, 0.172549, 0, 1,
-1.934311, 1.143523, -1.352044, 1, 0.1803922, 0, 1,
-1.927384, -0.1623735, -1.661889, 1, 0.1843137, 0, 1,
-1.91751, -1.225613, -1.823393, 1, 0.1921569, 0, 1,
-1.911967, 0.1834073, -1.240127, 1, 0.1960784, 0, 1,
-1.895241, 0.9813539, -1.05659, 1, 0.2039216, 0, 1,
-1.894189, -1.74178, -2.44979, 1, 0.2117647, 0, 1,
-1.889724, -0.1626368, -0.9195234, 1, 0.2156863, 0, 1,
-1.865637, -0.8635554, -1.799658, 1, 0.2235294, 0, 1,
-1.857968, -0.175197, -3.176664, 1, 0.227451, 0, 1,
-1.855525, 0.2555623, -2.117483, 1, 0.2352941, 0, 1,
-1.830779, 0.5347129, -2.035782, 1, 0.2392157, 0, 1,
-1.823649, 0.5915859, -2.404262, 1, 0.2470588, 0, 1,
-1.812314, -0.3148577, -2.6934, 1, 0.2509804, 0, 1,
-1.800778, -1.260026, -1.437883, 1, 0.2588235, 0, 1,
-1.773773, -1.473016, -1.4527, 1, 0.2627451, 0, 1,
-1.7262, 1.195714, 0.4584395, 1, 0.2705882, 0, 1,
-1.717108, -2.177189, -3.351619, 1, 0.2745098, 0, 1,
-1.685138, -0.4954126, -2.906008, 1, 0.282353, 0, 1,
-1.646593, 0.3872899, -0.6284431, 1, 0.2862745, 0, 1,
-1.635341, 1.176643, 0.3221145, 1, 0.2941177, 0, 1,
-1.629104, -1.88556, -2.080108, 1, 0.3019608, 0, 1,
-1.625738, 0.4649048, 0.131182, 1, 0.3058824, 0, 1,
-1.622742, -0.1722206, -1.861591, 1, 0.3137255, 0, 1,
-1.617366, -0.1815735, -2.131062, 1, 0.3176471, 0, 1,
-1.61155, -0.4395131, -1.869492, 1, 0.3254902, 0, 1,
-1.598045, 0.6101326, -2.070631, 1, 0.3294118, 0, 1,
-1.576552, -0.04131683, -2.245756, 1, 0.3372549, 0, 1,
-1.56608, 1.450453, -2.581021, 1, 0.3411765, 0, 1,
-1.562703, -1.042011, -1.526119, 1, 0.3490196, 0, 1,
-1.560341, 0.6481763, -1.084302, 1, 0.3529412, 0, 1,
-1.522779, -0.02479567, -1.233785, 1, 0.3607843, 0, 1,
-1.515537, -0.3926336, -1.357639, 1, 0.3647059, 0, 1,
-1.502636, 0.3969228, -1.596525, 1, 0.372549, 0, 1,
-1.485296, 1.281531, -0.9541621, 1, 0.3764706, 0, 1,
-1.47946, -0.5527888, -1.180065, 1, 0.3843137, 0, 1,
-1.477138, -0.09598619, -1.562573, 1, 0.3882353, 0, 1,
-1.434924, -0.6378837, -1.065758, 1, 0.3960784, 0, 1,
-1.432541, -0.4459386, -1.876947, 1, 0.4039216, 0, 1,
-1.41932, -0.1133567, -2.012808, 1, 0.4078431, 0, 1,
-1.418751, 0.917979, -0.3699461, 1, 0.4156863, 0, 1,
-1.413068, -0.2402461, -2.082018, 1, 0.4196078, 0, 1,
-1.412016, 0.4754434, -1.859216, 1, 0.427451, 0, 1,
-1.405808, -0.5343746, -2.618273, 1, 0.4313726, 0, 1,
-1.405489, -0.1087076, -0.7545153, 1, 0.4392157, 0, 1,
-1.404368, -0.3075381, -2.169444, 1, 0.4431373, 0, 1,
-1.390527, 0.359303, -2.358862, 1, 0.4509804, 0, 1,
-1.386081, -0.668219, -1.72979, 1, 0.454902, 0, 1,
-1.385681, 0.2502775, 0.05570284, 1, 0.4627451, 0, 1,
-1.382624, -0.3521537, -0.8190593, 1, 0.4666667, 0, 1,
-1.377359, 0.13225, -0.5117593, 1, 0.4745098, 0, 1,
-1.364135, -0.1885988, -1.115078, 1, 0.4784314, 0, 1,
-1.363011, 0.2636182, -1.661072, 1, 0.4862745, 0, 1,
-1.356884, -1.52697, -2.420932, 1, 0.4901961, 0, 1,
-1.355505, -1.008677, -2.644537, 1, 0.4980392, 0, 1,
-1.349387, -1.20512, -2.828133, 1, 0.5058824, 0, 1,
-1.334138, 0.8642538, -2.09829, 1, 0.509804, 0, 1,
-1.333191, 0.5857384, -0.4151419, 1, 0.5176471, 0, 1,
-1.330688, 1.654659, -0.7111807, 1, 0.5215687, 0, 1,
-1.324804, -0.2334041, -2.718902, 1, 0.5294118, 0, 1,
-1.32441, -2.48755, -0.1815248, 1, 0.5333334, 0, 1,
-1.321352, -1.256731, -2.479848, 1, 0.5411765, 0, 1,
-1.320613, 1.753995, -1.939075, 1, 0.5450981, 0, 1,
-1.311883, -1.086377, -1.932313, 1, 0.5529412, 0, 1,
-1.281994, -0.5480455, -0.9916907, 1, 0.5568628, 0, 1,
-1.281201, 0.1184985, -1.202339, 1, 0.5647059, 0, 1,
-1.276578, -1.275165, -1.536191, 1, 0.5686275, 0, 1,
-1.273145, -1.066613, -1.769622, 1, 0.5764706, 0, 1,
-1.253577, -0.9447792, -1.309245, 1, 0.5803922, 0, 1,
-1.242479, 0.03817543, -1.348084, 1, 0.5882353, 0, 1,
-1.237122, -0.07892605, -3.657222, 1, 0.5921569, 0, 1,
-1.232815, 0.406082, 0.2035426, 1, 0.6, 0, 1,
-1.23236, 0.0466981, -0.156196, 1, 0.6078432, 0, 1,
-1.227117, 1.191195, -0.6794291, 1, 0.6117647, 0, 1,
-1.221736, 0.5895787, -1.863776, 1, 0.6196079, 0, 1,
-1.220363, -1.097076, -2.036525, 1, 0.6235294, 0, 1,
-1.218346, 0.6380395, -1.593756, 1, 0.6313726, 0, 1,
-1.218081, 0.6830145, -2.147381, 1, 0.6352941, 0, 1,
-1.213373, -0.5401443, -3.228688, 1, 0.6431373, 0, 1,
-1.212393, -0.1158433, -3.837961, 1, 0.6470588, 0, 1,
-1.211331, -0.1899098, -2.029134, 1, 0.654902, 0, 1,
-1.208949, -0.3966193, -0.5678406, 1, 0.6588235, 0, 1,
-1.204991, 0.9659526, -0.7865307, 1, 0.6666667, 0, 1,
-1.196632, 0.4141247, -0.5510702, 1, 0.6705883, 0, 1,
-1.190788, 1.474638, -3.65059, 1, 0.6784314, 0, 1,
-1.185828, -0.6531277, -3.235934, 1, 0.682353, 0, 1,
-1.176355, -2.081716, -1.338793, 1, 0.6901961, 0, 1,
-1.175219, -0.04002317, -3.037007, 1, 0.6941177, 0, 1,
-1.173392, -0.4962692, -0.3465601, 1, 0.7019608, 0, 1,
-1.172741, -0.5857229, -1.484539, 1, 0.7098039, 0, 1,
-1.169682, -0.6513252, -1.844737, 1, 0.7137255, 0, 1,
-1.158284, 0.09370191, -2.72965, 1, 0.7215686, 0, 1,
-1.156271, -0.9688606, -2.102611, 1, 0.7254902, 0, 1,
-1.15475, -1.137628, -1.51115, 1, 0.7333333, 0, 1,
-1.14581, -0.06884126, -1.875283, 1, 0.7372549, 0, 1,
-1.136126, -0.9333869, -0.6425254, 1, 0.7450981, 0, 1,
-1.133732, 0.3827908, -0.3221228, 1, 0.7490196, 0, 1,
-1.125004, -0.105404, -3.244548, 1, 0.7568628, 0, 1,
-1.119362, 0.580031, -0.1498885, 1, 0.7607843, 0, 1,
-1.116753, -0.910588, -4.651157, 1, 0.7686275, 0, 1,
-1.115229, -0.6178399, -1.425944, 1, 0.772549, 0, 1,
-1.110584, 0.2661362, -1.63179, 1, 0.7803922, 0, 1,
-1.104187, 0.365824, -2.172457, 1, 0.7843137, 0, 1,
-1.100789, 0.3510652, 0.4462308, 1, 0.7921569, 0, 1,
-1.096564, -1.00232, -0.9052652, 1, 0.7960784, 0, 1,
-1.096173, 0.2214888, -1.811458, 1, 0.8039216, 0, 1,
-1.093685, -0.9119813, -1.427655, 1, 0.8117647, 0, 1,
-1.087343, 0.6219746, -0.5346067, 1, 0.8156863, 0, 1,
-1.076897, -1.247088, -1.340244, 1, 0.8235294, 0, 1,
-1.073653, -0.0552935, -0.6865589, 1, 0.827451, 0, 1,
-1.068856, -0.4523268, -0.01304642, 1, 0.8352941, 0, 1,
-1.067911, -2.10999, 0.1702694, 1, 0.8392157, 0, 1,
-1.062342, 1.101889, -1.656497, 1, 0.8470588, 0, 1,
-1.059497, 1.106981, -0.7858158, 1, 0.8509804, 0, 1,
-1.055349, 0.1817725, -0.9557461, 1, 0.8588235, 0, 1,
-1.050027, 0.6801732, -0.9877779, 1, 0.8627451, 0, 1,
-1.049258, 1.957172, -0.8663719, 1, 0.8705882, 0, 1,
-1.046048, 0.006605219, -2.028696, 1, 0.8745098, 0, 1,
-1.03394, 0.3365144, -1.587061, 1, 0.8823529, 0, 1,
-1.029901, 0.4616523, -1.422756, 1, 0.8862745, 0, 1,
-1.02846, 0.5482001, -1.521583, 1, 0.8941177, 0, 1,
-1.027959, 1.371294, -0.3248298, 1, 0.8980392, 0, 1,
-1.02572, -1.50898, -3.072907, 1, 0.9058824, 0, 1,
-1.018269, 0.7754374, -0.7912257, 1, 0.9137255, 0, 1,
-1.014471, 0.2152863, -3.050653, 1, 0.9176471, 0, 1,
-1.014302, -0.9853896, -3.334304, 1, 0.9254902, 0, 1,
-1.013258, -0.812063, -0.5144601, 1, 0.9294118, 0, 1,
-1.008893, -0.4074743, -2.726758, 1, 0.9372549, 0, 1,
-1.00834, 0.2977628, -2.205364, 1, 0.9411765, 0, 1,
-1.001534, -2.244667, -2.461181, 1, 0.9490196, 0, 1,
-1.000327, -0.08260423, -2.063709, 1, 0.9529412, 0, 1,
-0.9995594, -0.5386124, -2.989861, 1, 0.9607843, 0, 1,
-0.9972648, -0.1050988, -0.7055116, 1, 0.9647059, 0, 1,
-0.990157, -0.05009004, -0.2554156, 1, 0.972549, 0, 1,
-0.9762529, 1.609351, 1.104113, 1, 0.9764706, 0, 1,
-0.9731899, -1.797624, -4.030567, 1, 0.9843137, 0, 1,
-0.9681126, -0.1251008, -0.4931048, 1, 0.9882353, 0, 1,
-0.9657199, 0.6064989, -1.5288, 1, 0.9960784, 0, 1,
-0.9643946, -0.1805114, -0.4552511, 0.9960784, 1, 0, 1,
-0.9616211, 0.2651459, -1.350326, 0.9921569, 1, 0, 1,
-0.9491419, 0.5749894, 0.7587622, 0.9843137, 1, 0, 1,
-0.947819, -1.685307, -4.833011, 0.9803922, 1, 0, 1,
-0.9470451, 0.4190182, -1.479138, 0.972549, 1, 0, 1,
-0.9444306, 0.9956518, -0.5546228, 0.9686275, 1, 0, 1,
-0.9419773, -0.9668189, -2.210397, 0.9607843, 1, 0, 1,
-0.9404626, -0.006876944, -1.9249, 0.9568627, 1, 0, 1,
-0.9404216, 1.043072, -0.5072311, 0.9490196, 1, 0, 1,
-0.9400385, 1.134802, -1.992389, 0.945098, 1, 0, 1,
-0.9378865, 1.15275, 0.4240077, 0.9372549, 1, 0, 1,
-0.9361834, -0.02083801, -2.761583, 0.9333333, 1, 0, 1,
-0.9317468, 0.2865966, -2.268792, 0.9254902, 1, 0, 1,
-0.9313775, -0.398362, -1.59849, 0.9215686, 1, 0, 1,
-0.9306049, 0.2319878, -1.794607, 0.9137255, 1, 0, 1,
-0.9294758, 0.2720849, -1.355762, 0.9098039, 1, 0, 1,
-0.9268159, -0.2367404, -1.456082, 0.9019608, 1, 0, 1,
-0.9190869, 0.6144422, -1.974602, 0.8941177, 1, 0, 1,
-0.914867, 1.611464, -0.1765036, 0.8901961, 1, 0, 1,
-0.9118378, -1.692255, -1.895933, 0.8823529, 1, 0, 1,
-0.9112927, -1.071532, -1.633793, 0.8784314, 1, 0, 1,
-0.9097658, -0.2699833, -0.2761741, 0.8705882, 1, 0, 1,
-0.9035447, -0.06880747, -1.865757, 0.8666667, 1, 0, 1,
-0.8911129, 0.05428565, -1.58139, 0.8588235, 1, 0, 1,
-0.8909702, -0.5926388, -2.355415, 0.854902, 1, 0, 1,
-0.8758312, -0.4011668, 0.3931309, 0.8470588, 1, 0, 1,
-0.8740126, -1.015678, -1.934426, 0.8431373, 1, 0, 1,
-0.8647296, -0.5826171, -1.60197, 0.8352941, 1, 0, 1,
-0.864709, -0.6344585, -2.323216, 0.8313726, 1, 0, 1,
-0.8638163, 0.3762071, -1.185469, 0.8235294, 1, 0, 1,
-0.8578165, 1.479058, -0.3448699, 0.8196079, 1, 0, 1,
-0.8546278, -1.474207, -3.336498, 0.8117647, 1, 0, 1,
-0.8490312, -2.037395, -0.5037445, 0.8078431, 1, 0, 1,
-0.8489742, -0.5369419, -1.566059, 0.8, 1, 0, 1,
-0.8487142, 0.01102743, 0.4560291, 0.7921569, 1, 0, 1,
-0.8463907, -0.4850207, -1.560292, 0.7882353, 1, 0, 1,
-0.8449191, -0.3589252, -1.463094, 0.7803922, 1, 0, 1,
-0.8446283, 0.5338614, 0.06966837, 0.7764706, 1, 0, 1,
-0.8444231, -0.9820614, -3.714932, 0.7686275, 1, 0, 1,
-0.8418497, -0.03382793, -1.79788, 0.7647059, 1, 0, 1,
-0.8357788, -0.01296511, -1.289022, 0.7568628, 1, 0, 1,
-0.8343998, -1.308117, -1.74973, 0.7529412, 1, 0, 1,
-0.8242707, 0.9800273, -2.278251, 0.7450981, 1, 0, 1,
-0.8242183, 0.4688621, -0.08346733, 0.7411765, 1, 0, 1,
-0.8235008, -1.800697, -2.591528, 0.7333333, 1, 0, 1,
-0.8207482, 0.5717441, -2.128751, 0.7294118, 1, 0, 1,
-0.8174639, -0.1474697, -0.8289437, 0.7215686, 1, 0, 1,
-0.8162107, -0.37128, -1.983199, 0.7176471, 1, 0, 1,
-0.8137285, -0.4389221, -3.354121, 0.7098039, 1, 0, 1,
-0.811324, -0.5172797, -0.8687814, 0.7058824, 1, 0, 1,
-0.8102238, -1.220218, -2.471445, 0.6980392, 1, 0, 1,
-0.809505, -1.116638, -1.826733, 0.6901961, 1, 0, 1,
-0.7914678, -0.1817991, 1.04256, 0.6862745, 1, 0, 1,
-0.7853487, -0.5457504, -1.39111, 0.6784314, 1, 0, 1,
-0.783029, 0.8950999, -1.009186, 0.6745098, 1, 0, 1,
-0.7783929, 1.575481, -2.228054, 0.6666667, 1, 0, 1,
-0.7764264, -1.310737, -0.6942622, 0.6627451, 1, 0, 1,
-0.7720031, 0.7614794, -0.4136025, 0.654902, 1, 0, 1,
-0.7709798, 0.07262721, 0.04895069, 0.6509804, 1, 0, 1,
-0.7659411, 1.035109, -3.037648, 0.6431373, 1, 0, 1,
-0.7625384, 0.4630503, -1.914786, 0.6392157, 1, 0, 1,
-0.7589781, 0.3750319, -1.945543, 0.6313726, 1, 0, 1,
-0.7584965, 0.2384993, -1.343111, 0.627451, 1, 0, 1,
-0.7574029, 0.7103823, -0.4972063, 0.6196079, 1, 0, 1,
-0.7561174, -2.209331, -2.221541, 0.6156863, 1, 0, 1,
-0.7520226, -0.892229, -2.653752, 0.6078432, 1, 0, 1,
-0.7451087, -0.595395, -3.767881, 0.6039216, 1, 0, 1,
-0.7438911, 0.8657664, -1.154477, 0.5960785, 1, 0, 1,
-0.74354, 0.5868989, -0.7745582, 0.5882353, 1, 0, 1,
-0.7418602, 0.2828256, -2.361297, 0.5843138, 1, 0, 1,
-0.7415762, -0.4597321, -0.7159751, 0.5764706, 1, 0, 1,
-0.7408875, 0.1370158, -2.603158, 0.572549, 1, 0, 1,
-0.7270704, 0.9149722, -0.1805369, 0.5647059, 1, 0, 1,
-0.7182735, 0.08732641, -2.325967, 0.5607843, 1, 0, 1,
-0.715662, 0.525933, -0.4392294, 0.5529412, 1, 0, 1,
-0.7140049, 1.669606, 0.4682381, 0.5490196, 1, 0, 1,
-0.7024781, -0.0597653, -1.263761, 0.5411765, 1, 0, 1,
-0.6948053, 0.9637002, -0.4582784, 0.5372549, 1, 0, 1,
-0.6925829, 0.05326062, -2.585267, 0.5294118, 1, 0, 1,
-0.6881584, 0.3591791, -1.778732, 0.5254902, 1, 0, 1,
-0.6880038, 1.952501, -1.227771, 0.5176471, 1, 0, 1,
-0.6855655, -0.074434, -1.517173, 0.5137255, 1, 0, 1,
-0.6835992, -1.630646, -1.392837, 0.5058824, 1, 0, 1,
-0.6709225, -0.1235714, -1.259545, 0.5019608, 1, 0, 1,
-0.6709105, -1.197144, -1.934069, 0.4941176, 1, 0, 1,
-0.6622176, 0.2935929, -0.5842874, 0.4862745, 1, 0, 1,
-0.6597595, 0.1525365, -0.491367, 0.4823529, 1, 0, 1,
-0.6588424, 0.695106, -1.200641, 0.4745098, 1, 0, 1,
-0.6566984, -0.2653232, -0.9813067, 0.4705882, 1, 0, 1,
-0.6539578, 0.8070913, 0.2655912, 0.4627451, 1, 0, 1,
-0.6514324, -0.1734027, -1.491958, 0.4588235, 1, 0, 1,
-0.646639, 0.4411853, -1.453769, 0.4509804, 1, 0, 1,
-0.6425406, -0.08334657, -3.398244, 0.4470588, 1, 0, 1,
-0.641663, 0.02971206, -1.492588, 0.4392157, 1, 0, 1,
-0.6400884, -0.1124161, -0.3886244, 0.4352941, 1, 0, 1,
-0.6385453, 1.122872, -1.904503, 0.427451, 1, 0, 1,
-0.6356616, 0.1841623, -3.579944, 0.4235294, 1, 0, 1,
-0.6354476, -0.08055758, -1.34098, 0.4156863, 1, 0, 1,
-0.6330487, 0.6875188, -2.63571, 0.4117647, 1, 0, 1,
-0.6326802, 1.231774, -1.768083, 0.4039216, 1, 0, 1,
-0.6319666, -0.2828845, 1.492784, 0.3960784, 1, 0, 1,
-0.627649, -1.504982, -3.405409, 0.3921569, 1, 0, 1,
-0.6192887, 1.261768, -1.152516, 0.3843137, 1, 0, 1,
-0.6176584, 1.462926, -1.560203, 0.3803922, 1, 0, 1,
-0.6172339, -1.446254, -1.870941, 0.372549, 1, 0, 1,
-0.6156051, 2.018039, -0.7441678, 0.3686275, 1, 0, 1,
-0.6065525, -0.8937652, -3.597305, 0.3607843, 1, 0, 1,
-0.6049262, -0.6614661, -2.700238, 0.3568628, 1, 0, 1,
-0.6035119, -1.058988, -2.018238, 0.3490196, 1, 0, 1,
-0.5997571, 0.7067733, -0.1100262, 0.345098, 1, 0, 1,
-0.5975684, 0.3504461, -1.393949, 0.3372549, 1, 0, 1,
-0.5973377, -0.7794827, -0.7935154, 0.3333333, 1, 0, 1,
-0.5964974, -0.8180904, -0.7975114, 0.3254902, 1, 0, 1,
-0.5887629, 1.259864, -0.7185087, 0.3215686, 1, 0, 1,
-0.5863593, 1.187205, -0.5711255, 0.3137255, 1, 0, 1,
-0.5862582, -0.229216, -3.817082, 0.3098039, 1, 0, 1,
-0.5761192, 0.1862127, -1.926558, 0.3019608, 1, 0, 1,
-0.5742961, -0.8837336, -3.553352, 0.2941177, 1, 0, 1,
-0.5739698, 0.5471561, -0.6625049, 0.2901961, 1, 0, 1,
-0.5658369, 0.3043213, -2.039673, 0.282353, 1, 0, 1,
-0.5630299, -1.060606, -2.854451, 0.2784314, 1, 0, 1,
-0.5608898, -1.094158, -2.541962, 0.2705882, 1, 0, 1,
-0.5608529, 0.3458867, -1.363668, 0.2666667, 1, 0, 1,
-0.5571287, -1.045931, -0.4058363, 0.2588235, 1, 0, 1,
-0.556681, 0.07571653, 0.4424362, 0.254902, 1, 0, 1,
-0.5544446, 0.1844941, -1.800472, 0.2470588, 1, 0, 1,
-0.5505139, -0.2274243, -1.616223, 0.2431373, 1, 0, 1,
-0.5494722, -0.5493162, -2.227722, 0.2352941, 1, 0, 1,
-0.5482002, -0.2427345, -1.211569, 0.2313726, 1, 0, 1,
-0.5446762, 0.1713196, -1.56942, 0.2235294, 1, 0, 1,
-0.5425779, 0.8875764, -0.8834958, 0.2196078, 1, 0, 1,
-0.536118, -0.4823166, -3.045285, 0.2117647, 1, 0, 1,
-0.53523, 0.8133808, -1.006341, 0.2078431, 1, 0, 1,
-0.5316418, 0.1588842, -1.577615, 0.2, 1, 0, 1,
-0.5302951, 0.08799323, -0.52288, 0.1921569, 1, 0, 1,
-0.5264536, 0.1266072, -0.3855988, 0.1882353, 1, 0, 1,
-0.5253015, -0.4279691, -2.870634, 0.1803922, 1, 0, 1,
-0.5238277, 0.005900198, -1.294054, 0.1764706, 1, 0, 1,
-0.5183941, 0.1194475, -0.3037398, 0.1686275, 1, 0, 1,
-0.5146756, 1.682115, 0.03995313, 0.1647059, 1, 0, 1,
-0.5066976, 0.3971671, -0.7811601, 0.1568628, 1, 0, 1,
-0.5010236, 0.2138239, 0.3212264, 0.1529412, 1, 0, 1,
-0.4893106, -0.02444826, -1.050241, 0.145098, 1, 0, 1,
-0.487927, 1.207834, -0.3959647, 0.1411765, 1, 0, 1,
-0.4872774, -0.1711346, -2.097585, 0.1333333, 1, 0, 1,
-0.4835647, 0.384662, -0.1657691, 0.1294118, 1, 0, 1,
-0.4794176, 0.01418266, -0.9050707, 0.1215686, 1, 0, 1,
-0.4777411, 0.1773712, -1.674295, 0.1176471, 1, 0, 1,
-0.4769275, 0.04914096, -2.865262, 0.1098039, 1, 0, 1,
-0.4764268, -1.853401, -3.645782, 0.1058824, 1, 0, 1,
-0.4571623, -1.570221, -0.3034774, 0.09803922, 1, 0, 1,
-0.4497592, -0.2303738, -0.8183452, 0.09019608, 1, 0, 1,
-0.4481431, -0.8954214, -1.031504, 0.08627451, 1, 0, 1,
-0.4467556, 0.5837688, -0.8344768, 0.07843138, 1, 0, 1,
-0.4397335, 1.384861, 1.014636, 0.07450981, 1, 0, 1,
-0.4367616, 1.004622, 0.8297372, 0.06666667, 1, 0, 1,
-0.4317241, -0.438713, -1.257051, 0.0627451, 1, 0, 1,
-0.4218635, -0.1153864, -0.07106777, 0.05490196, 1, 0, 1,
-0.4195425, -1.103509, -1.284432, 0.05098039, 1, 0, 1,
-0.4119096, 0.1335359, -1.526975, 0.04313726, 1, 0, 1,
-0.4100972, 0.8226456, -1.11861, 0.03921569, 1, 0, 1,
-0.4077204, -0.653853, -2.268947, 0.03137255, 1, 0, 1,
-0.4060247, 1.146582, -0.9576786, 0.02745098, 1, 0, 1,
-0.4021515, 0.7216218, 1.055969, 0.01960784, 1, 0, 1,
-0.4018008, -0.6793694, -3.018866, 0.01568628, 1, 0, 1,
-0.3998366, -0.513697, -2.606884, 0.007843138, 1, 0, 1,
-0.3994224, 0.8282074, -0.1023044, 0.003921569, 1, 0, 1,
-0.3935959, -0.3992741, -3.811286, 0, 1, 0.003921569, 1,
-0.3925748, -0.419576, -1.971877, 0, 1, 0.01176471, 1,
-0.3886738, -0.2388022, -2.876633, 0, 1, 0.01568628, 1,
-0.3810722, 1.388659, 0.3204779, 0, 1, 0.02352941, 1,
-0.3667302, -0.6343291, -1.778103, 0, 1, 0.02745098, 1,
-0.3663382, 1.324849, 0.5697052, 0, 1, 0.03529412, 1,
-0.362061, -0.8330903, -4.105985, 0, 1, 0.03921569, 1,
-0.3583073, 2.483575, 0.6101022, 0, 1, 0.04705882, 1,
-0.3551151, -0.4308975, -0.1155855, 0, 1, 0.05098039, 1,
-0.3537, -0.08894689, -2.555026, 0, 1, 0.05882353, 1,
-0.3522407, 0.4311195, -1.357156, 0, 1, 0.0627451, 1,
-0.3509844, 1.063236, -0.3666227, 0, 1, 0.07058824, 1,
-0.349155, -0.6480554, -2.955433, 0, 1, 0.07450981, 1,
-0.3449242, -0.1407399, -3.087349, 0, 1, 0.08235294, 1,
-0.3398606, -1.603542, -2.834332, 0, 1, 0.08627451, 1,
-0.3381941, -0.5289683, -1.907992, 0, 1, 0.09411765, 1,
-0.3320161, -0.2523691, -4.153831, 0, 1, 0.1019608, 1,
-0.3314129, 0.6656216, 0.2129804, 0, 1, 0.1058824, 1,
-0.3298546, -1.36011, -1.688215, 0, 1, 0.1137255, 1,
-0.3226383, -0.1585238, -1.731434, 0, 1, 0.1176471, 1,
-0.3083962, -0.1258369, -1.921043, 0, 1, 0.1254902, 1,
-0.3049738, -0.7302697, -3.732875, 0, 1, 0.1294118, 1,
-0.301605, 0.4125218, -0.5062376, 0, 1, 0.1372549, 1,
-0.297975, -0.2860597, -3.242479, 0, 1, 0.1411765, 1,
-0.297251, 0.3283096, 1.661572, 0, 1, 0.1490196, 1,
-0.2967337, -0.1815274, -3.008928, 0, 1, 0.1529412, 1,
-0.2901955, -1.539729, -3.506718, 0, 1, 0.1607843, 1,
-0.2901127, -1.109057, -3.031897, 0, 1, 0.1647059, 1,
-0.2876732, 0.2896469, -1.14362, 0, 1, 0.172549, 1,
-0.2842633, 0.4541167, -1.047952, 0, 1, 0.1764706, 1,
-0.2839726, -0.2261847, -2.429839, 0, 1, 0.1843137, 1,
-0.2825672, -0.06864976, -0.423091, 0, 1, 0.1882353, 1,
-0.2768839, 0.6044443, 0.6187638, 0, 1, 0.1960784, 1,
-0.2746732, 0.3356046, -0.6926467, 0, 1, 0.2039216, 1,
-0.2736193, 1.249133, 1.858705, 0, 1, 0.2078431, 1,
-0.2705835, -0.8966967, -1.848311, 0, 1, 0.2156863, 1,
-0.2703471, -1.104968, -2.073242, 0, 1, 0.2196078, 1,
-0.2696507, 0.5349846, 0.817359, 0, 1, 0.227451, 1,
-0.2670625, -0.86962, -2.10919, 0, 1, 0.2313726, 1,
-0.265756, 1.262561, 0.8956211, 0, 1, 0.2392157, 1,
-0.2641397, 0.407134, 0.8576467, 0, 1, 0.2431373, 1,
-0.2626475, 0.4151343, -0.3071185, 0, 1, 0.2509804, 1,
-0.2625228, -1.873679, 0.2795422, 0, 1, 0.254902, 1,
-0.260314, 0.5256525, 0.1681866, 0, 1, 0.2627451, 1,
-0.2585942, -1.775204, -2.361837, 0, 1, 0.2666667, 1,
-0.256264, -1.755867, -2.881355, 0, 1, 0.2745098, 1,
-0.2551247, -0.8633484, -3.080948, 0, 1, 0.2784314, 1,
-0.2523807, -0.7611412, -3.714297, 0, 1, 0.2862745, 1,
-0.2520494, -1.681965, -2.212676, 0, 1, 0.2901961, 1,
-0.2507846, -0.08834145, -0.5681121, 0, 1, 0.2980392, 1,
-0.2502448, 0.7854834, 0.6268409, 0, 1, 0.3058824, 1,
-0.2494816, 0.8517676, 0.1287287, 0, 1, 0.3098039, 1,
-0.2442465, -0.7528222, -1.20997, 0, 1, 0.3176471, 1,
-0.2441604, -0.8490324, -3.746299, 0, 1, 0.3215686, 1,
-0.2427042, 0.08343015, -2.620962, 0, 1, 0.3294118, 1,
-0.2415297, 0.6480674, -0.5889413, 0, 1, 0.3333333, 1,
-0.2392523, -0.5777472, -3.323597, 0, 1, 0.3411765, 1,
-0.2334792, 1.367734, 1.064785, 0, 1, 0.345098, 1,
-0.2316387, 0.4488147, 0.205908, 0, 1, 0.3529412, 1,
-0.2306454, 1.578295, 0.5336604, 0, 1, 0.3568628, 1,
-0.2280565, 0.6946417, -0.3473325, 0, 1, 0.3647059, 1,
-0.2197574, 0.4006883, 1.116073, 0, 1, 0.3686275, 1,
-0.2087554, 0.6694492, -0.7481475, 0, 1, 0.3764706, 1,
-0.2080383, -0.1123614, -3.38276, 0, 1, 0.3803922, 1,
-0.2062854, 0.7724672, -0.471819, 0, 1, 0.3882353, 1,
-0.2050785, -1.295144, -2.030544, 0, 1, 0.3921569, 1,
-0.2007203, 1.012525, 1.052552, 0, 1, 0.4, 1,
-0.1995218, -0.1988017, -2.9447, 0, 1, 0.4078431, 1,
-0.198156, 0.2848632, -1.388927, 0, 1, 0.4117647, 1,
-0.1947359, -0.2702499, -2.957578, 0, 1, 0.4196078, 1,
-0.1813254, -0.1419648, -1.669281, 0, 1, 0.4235294, 1,
-0.1789834, -0.2502659, -2.169654, 0, 1, 0.4313726, 1,
-0.1736331, 0.9836701, -0.5598427, 0, 1, 0.4352941, 1,
-0.1729986, -1.660126, -2.991165, 0, 1, 0.4431373, 1,
-0.1618445, -0.1110816, -0.2123597, 0, 1, 0.4470588, 1,
-0.1580536, -0.7804486, -4.331317, 0, 1, 0.454902, 1,
-0.1573385, -1.227405, -3.107563, 0, 1, 0.4588235, 1,
-0.1566189, -0.9531311, -3.673656, 0, 1, 0.4666667, 1,
-0.1561116, -0.8571823, -1.656612, 0, 1, 0.4705882, 1,
-0.1509752, 0.9653258, 0.6274055, 0, 1, 0.4784314, 1,
-0.1493869, 0.09213848, 0.1511706, 0, 1, 0.4823529, 1,
-0.1477164, 1.511346, -1.152351, 0, 1, 0.4901961, 1,
-0.146246, 0.4537916, 1.131784, 0, 1, 0.4941176, 1,
-0.1442064, -0.7386312, -3.089837, 0, 1, 0.5019608, 1,
-0.1430159, 1.207208, -1.287429, 0, 1, 0.509804, 1,
-0.1390778, 2.028255, 0.6484398, 0, 1, 0.5137255, 1,
-0.1381758, 0.6114224, -0.8543985, 0, 1, 0.5215687, 1,
-0.134686, 1.452817, 1.324519, 0, 1, 0.5254902, 1,
-0.1337738, 1.421058, 1.233689, 0, 1, 0.5333334, 1,
-0.1323656, -1.995743, -2.061486, 0, 1, 0.5372549, 1,
-0.128632, 0.9302569, -1.070667, 0, 1, 0.5450981, 1,
-0.1259033, -2.138444, -2.353137, 0, 1, 0.5490196, 1,
-0.1217763, 1.658576, 0.2393978, 0, 1, 0.5568628, 1,
-0.1216104, 0.914945, -1.528147, 0, 1, 0.5607843, 1,
-0.1187832, -2.770009, -3.897123, 0, 1, 0.5686275, 1,
-0.115019, -0.4724207, -2.028464, 0, 1, 0.572549, 1,
-0.1145569, 1.241333, 0.4501439, 0, 1, 0.5803922, 1,
-0.1141757, -0.6677181, -0.6883112, 0, 1, 0.5843138, 1,
-0.1128681, 0.152011, 2.241483, 0, 1, 0.5921569, 1,
-0.1127604, 0.4468939, -0.5611566, 0, 1, 0.5960785, 1,
-0.1110879, -0.5060158, -2.155571, 0, 1, 0.6039216, 1,
-0.1078982, 1.21837, 0.210563, 0, 1, 0.6117647, 1,
-0.1004966, 1.881293, 0.0849004, 0, 1, 0.6156863, 1,
-0.09787478, -0.9187789, -3.855589, 0, 1, 0.6235294, 1,
-0.09769172, 0.3127786, 0.966002, 0, 1, 0.627451, 1,
-0.09636419, 0.4440716, -1.609496, 0, 1, 0.6352941, 1,
-0.09457745, 0.02886716, -2.933262, 0, 1, 0.6392157, 1,
-0.09402397, 1.116644, -0.0003115689, 0, 1, 0.6470588, 1,
-0.09323912, -1.607894, -2.015927, 0, 1, 0.6509804, 1,
-0.09192136, 0.4458167, -1.8938, 0, 1, 0.6588235, 1,
-0.08893507, -1.726005, -3.445287, 0, 1, 0.6627451, 1,
-0.08676054, 0.1363804, -0.5984131, 0, 1, 0.6705883, 1,
-0.0860814, 0.9473923, -0.4411047, 0, 1, 0.6745098, 1,
-0.08489899, -0.5182208, -3.499269, 0, 1, 0.682353, 1,
-0.08449529, 0.08978368, -2.368213, 0, 1, 0.6862745, 1,
-0.0832735, -0.3294688, -3.192312, 0, 1, 0.6941177, 1,
-0.08315272, -0.01660756, -0.03037577, 0, 1, 0.7019608, 1,
-0.08084535, 0.3452133, 0.2752846, 0, 1, 0.7058824, 1,
-0.07735491, -0.59635, -2.509666, 0, 1, 0.7137255, 1,
-0.0741278, -0.2609989, -3.495984, 0, 1, 0.7176471, 1,
-0.0723534, 0.04857543, -0.01170614, 0, 1, 0.7254902, 1,
-0.0714863, 2.304636, -0.1574566, 0, 1, 0.7294118, 1,
-0.06846036, -0.1528754, -2.659656, 0, 1, 0.7372549, 1,
-0.06212603, 0.2533279, -0.4103409, 0, 1, 0.7411765, 1,
-0.06108038, -1.165704, -4.782954, 0, 1, 0.7490196, 1,
-0.05831186, 0.6426048, 0.6402713, 0, 1, 0.7529412, 1,
-0.05352861, 1.286846, 1.1889, 0, 1, 0.7607843, 1,
-0.05058312, -0.626781, -1.965636, 0, 1, 0.7647059, 1,
-0.05037973, -0.1427969, -2.943556, 0, 1, 0.772549, 1,
-0.04505332, 0.05418492, -1.941583, 0, 1, 0.7764706, 1,
-0.0385808, -1.052658, -3.694869, 0, 1, 0.7843137, 1,
-0.03805076, 1.166153, 1.920977, 0, 1, 0.7882353, 1,
-0.0352192, -0.8928803, -3.053829, 0, 1, 0.7960784, 1,
-0.03207749, 0.6609023, 1.410945, 0, 1, 0.8039216, 1,
-0.01894928, 0.3126254, 2.072111, 0, 1, 0.8078431, 1,
-0.01813393, 0.5745104, 0.4856074, 0, 1, 0.8156863, 1,
-0.0165593, -1.332635, -2.209965, 0, 1, 0.8196079, 1,
-0.01584364, -0.5224304, -2.988972, 0, 1, 0.827451, 1,
-0.01420079, 0.4093191, 0.1476689, 0, 1, 0.8313726, 1,
-0.01046758, 1.260928, 0.3129913, 0, 1, 0.8392157, 1,
-0.009343661, 0.5802325, -0.9177305, 0, 1, 0.8431373, 1,
-0.005219862, 1.393858, -0.8890017, 0, 1, 0.8509804, 1,
-0.004128525, -0.03863197, -1.656966, 0, 1, 0.854902, 1,
-0.003900675, 0.2890516, 0.7770396, 0, 1, 0.8627451, 1,
-0.002522526, -0.4940458, -2.061417, 0, 1, 0.8666667, 1,
-0.002323413, -0.0559121, -3.229492, 0, 1, 0.8745098, 1,
-0.0009008526, -1.058717, -2.400299, 0, 1, 0.8784314, 1,
-0.0006443212, -1.288232, -3.124621, 0, 1, 0.8862745, 1,
0.004364915, 0.4516986, -0.9910661, 0, 1, 0.8901961, 1,
0.00944394, 1.000248, 0.153002, 0, 1, 0.8980392, 1,
0.0121248, 0.854427, 0.4664325, 0, 1, 0.9058824, 1,
0.01589357, -1.107186, 4.09729, 0, 1, 0.9098039, 1,
0.0185322, -0.6467524, 3.450975, 0, 1, 0.9176471, 1,
0.0205876, 0.5041249, 1.372263, 0, 1, 0.9215686, 1,
0.02073981, -0.3098159, 5.598556, 0, 1, 0.9294118, 1,
0.02482336, 2.142392, 1.372099, 0, 1, 0.9333333, 1,
0.02528249, 1.179319, -0.7032762, 0, 1, 0.9411765, 1,
0.03075345, -0.6613243, 1.771441, 0, 1, 0.945098, 1,
0.03251779, 0.9596643, -2.374138, 0, 1, 0.9529412, 1,
0.03870451, -0.1640889, 2.785529, 0, 1, 0.9568627, 1,
0.03957998, -1.601936, 4.352973, 0, 1, 0.9647059, 1,
0.04016265, 1.274256, -0.9589758, 0, 1, 0.9686275, 1,
0.04141027, 0.1796996, 0.4631357, 0, 1, 0.9764706, 1,
0.04334693, -0.2275197, 2.26073, 0, 1, 0.9803922, 1,
0.04402003, -1.363082, 1.929605, 0, 1, 0.9882353, 1,
0.0448375, 0.4422627, -0.3726284, 0, 1, 0.9921569, 1,
0.04610498, 0.1627221, 0.3180956, 0, 1, 1, 1,
0.0469624, -1.358248, 1.867136, 0, 0.9921569, 1, 1,
0.04910135, -0.007218787, -1.071524, 0, 0.9882353, 1, 1,
0.04929046, 0.8435386, 0.07291181, 0, 0.9803922, 1, 1,
0.05035087, -0.3662316, 4.424064, 0, 0.9764706, 1, 1,
0.05084309, 2.100951, 0.3327559, 0, 0.9686275, 1, 1,
0.05313852, -0.6150829, 2.532024, 0, 0.9647059, 1, 1,
0.05452323, 0.04591839, 1.014344, 0, 0.9568627, 1, 1,
0.05567703, -1.05538, 0.3310559, 0, 0.9529412, 1, 1,
0.05822363, -0.001340572, 2.092669, 0, 0.945098, 1, 1,
0.06006059, -0.6127051, 2.2411, 0, 0.9411765, 1, 1,
0.0622853, 0.6605354, 0.8689634, 0, 0.9333333, 1, 1,
0.0625409, -0.5307824, 2.085, 0, 0.9294118, 1, 1,
0.0626315, 0.2514872, 0.1151396, 0, 0.9215686, 1, 1,
0.06599661, 0.9219055, 0.5659338, 0, 0.9176471, 1, 1,
0.06966657, -1.041727, 4.070424, 0, 0.9098039, 1, 1,
0.07215863, 0.1037191, 1.822403, 0, 0.9058824, 1, 1,
0.07241282, -1.7213, 1.746691, 0, 0.8980392, 1, 1,
0.07376917, -1.574206, 3.209044, 0, 0.8901961, 1, 1,
0.07421942, 0.9186295, 0.3869095, 0, 0.8862745, 1, 1,
0.07590462, -1.560417, 4.271697, 0, 0.8784314, 1, 1,
0.07698459, -0.07902612, 3.665152, 0, 0.8745098, 1, 1,
0.08151568, -1.994959, 1.863521, 0, 0.8666667, 1, 1,
0.08233036, 0.7062237, -1.331713, 0, 0.8627451, 1, 1,
0.08267175, -1.692528, 4.087449, 0, 0.854902, 1, 1,
0.08610033, 0.6761703, -2.160895, 0, 0.8509804, 1, 1,
0.09255435, -0.770771, 1.337057, 0, 0.8431373, 1, 1,
0.09264553, 1.106336, -0.5420178, 0, 0.8392157, 1, 1,
0.1003574, 1.202596, 0.123421, 0, 0.8313726, 1, 1,
0.1010686, 0.3793487, -0.6290852, 0, 0.827451, 1, 1,
0.1034717, 0.2452686, -1.482844, 0, 0.8196079, 1, 1,
0.1040604, -0.9460653, 3.21111, 0, 0.8156863, 1, 1,
0.1042265, -0.8987447, 4.159923, 0, 0.8078431, 1, 1,
0.1081477, 0.3960203, 0.8174316, 0, 0.8039216, 1, 1,
0.1129827, -0.5711735, 1.674411, 0, 0.7960784, 1, 1,
0.1160437, -2.075403, 5.522758, 0, 0.7882353, 1, 1,
0.1239371, -0.8260911, 0.6537616, 0, 0.7843137, 1, 1,
0.124246, 0.6496826, -0.2043541, 0, 0.7764706, 1, 1,
0.1261373, -0.3870704, 4.418386, 0, 0.772549, 1, 1,
0.1262657, 1.141825, -0.7540506, 0, 0.7647059, 1, 1,
0.131265, 0.9096982, 0.6900187, 0, 0.7607843, 1, 1,
0.1319809, -1.231246, 2.499916, 0, 0.7529412, 1, 1,
0.1390695, -1.517709, 2.046633, 0, 0.7490196, 1, 1,
0.1406949, -1.251303, 3.67385, 0, 0.7411765, 1, 1,
0.1421674, 0.6326426, 0.3881982, 0, 0.7372549, 1, 1,
0.1442279, -1.096286, 1.915857, 0, 0.7294118, 1, 1,
0.14709, -1.243737, 3.125906, 0, 0.7254902, 1, 1,
0.1583543, 0.0253055, 0.4537435, 0, 0.7176471, 1, 1,
0.1586456, -0.3390698, 2.948986, 0, 0.7137255, 1, 1,
0.1605588, -1.350596, 1.410482, 0, 0.7058824, 1, 1,
0.1711883, 0.8768694, 0.9933418, 0, 0.6980392, 1, 1,
0.1720716, -0.2398562, 2.765669, 0, 0.6941177, 1, 1,
0.1728291, 1.215084, -0.2635357, 0, 0.6862745, 1, 1,
0.1753178, -0.302828, 2.659749, 0, 0.682353, 1, 1,
0.1801275, -1.513674, 2.534835, 0, 0.6745098, 1, 1,
0.184511, 1.167732, 0.1416547, 0, 0.6705883, 1, 1,
0.1846712, -0.8376623, 1.418408, 0, 0.6627451, 1, 1,
0.1869153, 1.216522, 0.2242093, 0, 0.6588235, 1, 1,
0.1969942, 0.8614542, -1.119429, 0, 0.6509804, 1, 1,
0.1981027, -0.2059775, 3.770431, 0, 0.6470588, 1, 1,
0.1996636, -1.37791, 4.134007, 0, 0.6392157, 1, 1,
0.1997711, -1.595116, 2.622218, 0, 0.6352941, 1, 1,
0.2016817, -2.471949, 2.499205, 0, 0.627451, 1, 1,
0.2078252, -0.362559, 1.815473, 0, 0.6235294, 1, 1,
0.2154845, -0.7988503, 3.110025, 0, 0.6156863, 1, 1,
0.2211477, 0.9127811, -0.8628724, 0, 0.6117647, 1, 1,
0.2225177, 0.2395617, 2.379789, 0, 0.6039216, 1, 1,
0.2257897, 0.8793445, -0.2467492, 0, 0.5960785, 1, 1,
0.2258408, 1.760101, -0.7700467, 0, 0.5921569, 1, 1,
0.2259432, -2.780191, 4.116314, 0, 0.5843138, 1, 1,
0.2273974, 0.5070727, -0.1686519, 0, 0.5803922, 1, 1,
0.2278057, -0.03487987, 1.082557, 0, 0.572549, 1, 1,
0.2384043, -1.260302, 3.679634, 0, 0.5686275, 1, 1,
0.2394406, 0.8393921, -0.1149458, 0, 0.5607843, 1, 1,
0.2403139, -1.518382, 3.168882, 0, 0.5568628, 1, 1,
0.2419975, 0.8167897, 1.222775, 0, 0.5490196, 1, 1,
0.2425557, 0.1006045, 1.126244, 0, 0.5450981, 1, 1,
0.246149, -0.7975351, 1.464147, 0, 0.5372549, 1, 1,
0.2519387, -2.274774, 4.90924, 0, 0.5333334, 1, 1,
0.2549498, -1.176183, 3.055569, 0, 0.5254902, 1, 1,
0.2599341, 1.401802, -1.044819, 0, 0.5215687, 1, 1,
0.2610129, -0.3261306, 2.232549, 0, 0.5137255, 1, 1,
0.2631283, 0.5332422, 0.8849884, 0, 0.509804, 1, 1,
0.2635887, -0.432165, 2.476047, 0, 0.5019608, 1, 1,
0.2641766, 0.4466898, 0.4263986, 0, 0.4941176, 1, 1,
0.2648574, 0.5670737, -0.153163, 0, 0.4901961, 1, 1,
0.2680451, -0.2475789, 2.779761, 0, 0.4823529, 1, 1,
0.270795, -0.4157114, 4.103725, 0, 0.4784314, 1, 1,
0.2727629, -0.3723886, 2.558092, 0, 0.4705882, 1, 1,
0.2764292, 1.680615, 0.3986704, 0, 0.4666667, 1, 1,
0.2769944, 0.1746257, 1.875612, 0, 0.4588235, 1, 1,
0.2789298, -1.727317, 3.624089, 0, 0.454902, 1, 1,
0.2835614, 1.557268, -0.8666834, 0, 0.4470588, 1, 1,
0.2843364, 0.3661535, 2.263907, 0, 0.4431373, 1, 1,
0.2853985, 0.1170247, 1.865493, 0, 0.4352941, 1, 1,
0.2861645, 0.5507829, 2.189171, 0, 0.4313726, 1, 1,
0.2889015, -0.04049779, 2.138499, 0, 0.4235294, 1, 1,
0.2968461, 1.303644, 1.307151, 0, 0.4196078, 1, 1,
0.3032348, 0.941943, -1.549208, 0, 0.4117647, 1, 1,
0.3048982, -0.9228052, 2.289186, 0, 0.4078431, 1, 1,
0.3049662, 0.4376985, -0.615923, 0, 0.4, 1, 1,
0.304977, -1.601501, 3.323874, 0, 0.3921569, 1, 1,
0.3060496, 0.4036017, 0.3701106, 0, 0.3882353, 1, 1,
0.3150947, -0.8557898, 3.100591, 0, 0.3803922, 1, 1,
0.3188902, 0.007918949, 1.756378, 0, 0.3764706, 1, 1,
0.319741, 0.4263694, 1.824455, 0, 0.3686275, 1, 1,
0.3201903, -0.4574102, 1.930268, 0, 0.3647059, 1, 1,
0.3279094, -0.6873335, 2.644017, 0, 0.3568628, 1, 1,
0.3311725, 1.698477, -1.497221, 0, 0.3529412, 1, 1,
0.3363396, 0.9737803, -0.6893731, 0, 0.345098, 1, 1,
0.3421088, 0.8888727, -0.5244959, 0, 0.3411765, 1, 1,
0.3423987, -0.5132038, 3.45622, 0, 0.3333333, 1, 1,
0.3430727, 1.52061, 0.01529819, 0, 0.3294118, 1, 1,
0.3464229, 1.710599, -1.826718, 0, 0.3215686, 1, 1,
0.3484446, 1.103433, 1.252119, 0, 0.3176471, 1, 1,
0.357168, 0.2923498, -0.4122326, 0, 0.3098039, 1, 1,
0.3587391, 1.318727, -0.9778259, 0, 0.3058824, 1, 1,
0.3603508, -0.3138229, 2.145666, 0, 0.2980392, 1, 1,
0.3606074, 0.7955598, 1.128484, 0, 0.2901961, 1, 1,
0.3644745, 0.5341781, 1.431122, 0, 0.2862745, 1, 1,
0.3650099, -1.100052, 3.09159, 0, 0.2784314, 1, 1,
0.3655989, -1.194312, 2.245548, 0, 0.2745098, 1, 1,
0.3667313, -0.2854192, 1.771014, 0, 0.2666667, 1, 1,
0.3682003, 1.385801, -1.580785, 0, 0.2627451, 1, 1,
0.3701949, 1.349224, 0.8066961, 0, 0.254902, 1, 1,
0.3752185, 0.9724048, 1.420924, 0, 0.2509804, 1, 1,
0.3772376, -0.3385569, 2.784869, 0, 0.2431373, 1, 1,
0.380366, 0.05144317, 1.230137, 0, 0.2392157, 1, 1,
0.3848708, 1.025095, 2.137271, 0, 0.2313726, 1, 1,
0.3855832, -0.3494734, 0.9901224, 0, 0.227451, 1, 1,
0.3901853, -1.29845, 2.373905, 0, 0.2196078, 1, 1,
0.3902768, 1.586405, -0.1078258, 0, 0.2156863, 1, 1,
0.3927944, -1.035428, 4.297051, 0, 0.2078431, 1, 1,
0.406361, -1.568369, 3.040439, 0, 0.2039216, 1, 1,
0.4084023, 0.1689215, 0.09349379, 0, 0.1960784, 1, 1,
0.4088593, -0.1041899, 2.663589, 0, 0.1882353, 1, 1,
0.4106981, -0.2987792, 3.188416, 0, 0.1843137, 1, 1,
0.4124363, 0.8895264, 0.8952082, 0, 0.1764706, 1, 1,
0.4227789, -0.00331236, 1.204802, 0, 0.172549, 1, 1,
0.4282759, -1.109803, 3.148592, 0, 0.1647059, 1, 1,
0.4288859, -0.04707753, 1.729202, 0, 0.1607843, 1, 1,
0.4302134, 1.689699, 0.8098377, 0, 0.1529412, 1, 1,
0.4346004, 0.7267987, 0.1757363, 0, 0.1490196, 1, 1,
0.4355077, 1.182424, 0.5968555, 0, 0.1411765, 1, 1,
0.436703, -0.2057328, 3.464102, 0, 0.1372549, 1, 1,
0.437866, 0.1771468, 0.08027541, 0, 0.1294118, 1, 1,
0.438426, 1.896192, 0.5112071, 0, 0.1254902, 1, 1,
0.4399897, -0.09203991, 2.91836, 0, 0.1176471, 1, 1,
0.4418474, -0.5678182, 1.57102, 0, 0.1137255, 1, 1,
0.4439724, -0.7851157, 3.827516, 0, 0.1058824, 1, 1,
0.4443059, 1.257779, 1.812528, 0, 0.09803922, 1, 1,
0.4457178, 2.121939, 0.3037238, 0, 0.09411765, 1, 1,
0.44672, 0.6182501, -0.07467405, 0, 0.08627451, 1, 1,
0.4479334, -0.1897543, 3.086178, 0, 0.08235294, 1, 1,
0.4492711, 0.367582, -0.3750131, 0, 0.07450981, 1, 1,
0.4499028, 0.5731988, 0.9321941, 0, 0.07058824, 1, 1,
0.4503947, 0.8051608, 1.578426, 0, 0.0627451, 1, 1,
0.4524187, -0.9725257, 2.00666, 0, 0.05882353, 1, 1,
0.4528906, -0.7536634, 4.252507, 0, 0.05098039, 1, 1,
0.4530466, -1.076368, 3.047444, 0, 0.04705882, 1, 1,
0.4530873, 0.807794, -0.0432855, 0, 0.03921569, 1, 1,
0.4541514, 0.2041892, 0.9692351, 0, 0.03529412, 1, 1,
0.4573178, 1.450081, 1.231225, 0, 0.02745098, 1, 1,
0.4591999, 0.2440533, -0.5410415, 0, 0.02352941, 1, 1,
0.4639032, -0.6865761, 3.283998, 0, 0.01568628, 1, 1,
0.4642296, -1.163053, 2.596588, 0, 0.01176471, 1, 1,
0.46866, 1.242879, 1.220934, 0, 0.003921569, 1, 1,
0.4710503, -0.4184793, 1.608484, 0.003921569, 0, 1, 1,
0.4735876, -1.448665, 1.465801, 0.007843138, 0, 1, 1,
0.4736063, 2.026845, -0.8446608, 0.01568628, 0, 1, 1,
0.4750183, 1.506255, 0.3849238, 0.01960784, 0, 1, 1,
0.4768732, -0.8006485, 3.156682, 0.02745098, 0, 1, 1,
0.4842177, 0.09756251, 0.7788014, 0.03137255, 0, 1, 1,
0.4848531, -1.332324, 2.739458, 0.03921569, 0, 1, 1,
0.4895036, 0.7816029, -0.4833473, 0.04313726, 0, 1, 1,
0.4921617, 0.77544, 0.7477509, 0.05098039, 0, 1, 1,
0.4968328, 0.7966989, 3.059748, 0.05490196, 0, 1, 1,
0.4979141, 1.789462, -1.30447, 0.0627451, 0, 1, 1,
0.5001567, 0.166149, 1.087711, 0.06666667, 0, 1, 1,
0.5027413, 1.041529, -0.6203888, 0.07450981, 0, 1, 1,
0.5054935, -0.9699378, 1.107614, 0.07843138, 0, 1, 1,
0.505646, 1.153902, -1.107636, 0.08627451, 0, 1, 1,
0.5087317, 0.6268771, 0.8501192, 0.09019608, 0, 1, 1,
0.5099131, 2.74064, -0.526436, 0.09803922, 0, 1, 1,
0.5112951, -1.433363, 2.829106, 0.1058824, 0, 1, 1,
0.5134982, -0.7079073, 2.65614, 0.1098039, 0, 1, 1,
0.5210696, 1.306936, 0.3365039, 0.1176471, 0, 1, 1,
0.5269026, -0.154503, 1.687038, 0.1215686, 0, 1, 1,
0.5286669, 0.3227635, 1.817452, 0.1294118, 0, 1, 1,
0.5339605, 0.5540134, 0.8197761, 0.1333333, 0, 1, 1,
0.5365406, -0.8458906, 1.423353, 0.1411765, 0, 1, 1,
0.5390623, -1.986773, 0.7697788, 0.145098, 0, 1, 1,
0.5392177, 1.428814, -0.2512062, 0.1529412, 0, 1, 1,
0.5420873, -0.006094339, 1.204327, 0.1568628, 0, 1, 1,
0.5440443, 0.07646986, 0.8252507, 0.1647059, 0, 1, 1,
0.5480133, -0.2744917, -0.182951, 0.1686275, 0, 1, 1,
0.5525979, 0.2173018, 1.465868, 0.1764706, 0, 1, 1,
0.5560533, 1.854399, -0.6596105, 0.1803922, 0, 1, 1,
0.5620629, -1.138656, 3.007543, 0.1882353, 0, 1, 1,
0.5639574, 0.5794941, 1.312955, 0.1921569, 0, 1, 1,
0.5652098, 2.160133, -0.211288, 0.2, 0, 1, 1,
0.5660644, -0.293803, 1.750864, 0.2078431, 0, 1, 1,
0.5667819, -1.013751, 1.734981, 0.2117647, 0, 1, 1,
0.5668782, -1.295298, 3.228766, 0.2196078, 0, 1, 1,
0.5682356, -0.2263789, 2.169667, 0.2235294, 0, 1, 1,
0.5688106, 0.2007844, 1.502003, 0.2313726, 0, 1, 1,
0.5706273, 0.7808457, 1.040131, 0.2352941, 0, 1, 1,
0.5733067, 0.8330783, 0.3360602, 0.2431373, 0, 1, 1,
0.5737321, -0.7415346, 2.308803, 0.2470588, 0, 1, 1,
0.57377, 0.01927598, 0.2667986, 0.254902, 0, 1, 1,
0.5757029, -0.2057044, 2.117071, 0.2588235, 0, 1, 1,
0.5821988, 0.3465026, 0.3140262, 0.2666667, 0, 1, 1,
0.5838922, -0.5487368, 2.980076, 0.2705882, 0, 1, 1,
0.5839846, 0.3397403, -0.1549919, 0.2784314, 0, 1, 1,
0.5897545, -0.8750958, 0.8027961, 0.282353, 0, 1, 1,
0.591428, -0.2176208, 2.36137, 0.2901961, 0, 1, 1,
0.5924745, 0.9857655, 0.962283, 0.2941177, 0, 1, 1,
0.5984621, 0.08150679, 0.8905944, 0.3019608, 0, 1, 1,
0.6052697, -0.5375727, 2.708518, 0.3098039, 0, 1, 1,
0.6057317, -0.3527044, 1.254691, 0.3137255, 0, 1, 1,
0.609092, 0.5776251, 1.027294, 0.3215686, 0, 1, 1,
0.6162923, -0.7184647, 2.489464, 0.3254902, 0, 1, 1,
0.6179613, 0.2645233, 1.517442, 0.3333333, 0, 1, 1,
0.6184797, 1.7884, 0.7585592, 0.3372549, 0, 1, 1,
0.6260989, -0.1173092, 1.392728, 0.345098, 0, 1, 1,
0.6266758, -0.4482273, 2.560214, 0.3490196, 0, 1, 1,
0.6273242, -0.04121556, 1.465207, 0.3568628, 0, 1, 1,
0.6358279, 2.100109, 0.1324593, 0.3607843, 0, 1, 1,
0.6370535, -1.227656, 2.401531, 0.3686275, 0, 1, 1,
0.6382113, -0.594031, 2.571535, 0.372549, 0, 1, 1,
0.6407067, -0.139341, -0.6331148, 0.3803922, 0, 1, 1,
0.6423003, -1.015423, 2.384347, 0.3843137, 0, 1, 1,
0.6448101, -0.3512364, 1.120224, 0.3921569, 0, 1, 1,
0.6457519, 0.443401, 0.7730587, 0.3960784, 0, 1, 1,
0.6470726, -0.01901069, 2.163678, 0.4039216, 0, 1, 1,
0.6475132, 0.8412718, 2.310508, 0.4117647, 0, 1, 1,
0.6483563, -1.922772, 1.447439, 0.4156863, 0, 1, 1,
0.650667, 0.03698275, 2.631141, 0.4235294, 0, 1, 1,
0.65531, 0.3777073, 2.838895, 0.427451, 0, 1, 1,
0.6562214, 1.176713, 1.347236, 0.4352941, 0, 1, 1,
0.6566838, -0.6611986, 2.01078, 0.4392157, 0, 1, 1,
0.6657755, -1.050158, 3.309031, 0.4470588, 0, 1, 1,
0.6663556, 1.864422, -0.6146328, 0.4509804, 0, 1, 1,
0.6689979, -0.7412316, 2.308601, 0.4588235, 0, 1, 1,
0.6693273, -0.5649107, 2.49043, 0.4627451, 0, 1, 1,
0.6701988, 1.554367, -0.1828006, 0.4705882, 0, 1, 1,
0.6732703, -1.344921, 2.345422, 0.4745098, 0, 1, 1,
0.679253, 0.8837186, -0.2155207, 0.4823529, 0, 1, 1,
0.6812537, 2.071175, -0.05949052, 0.4862745, 0, 1, 1,
0.6830298, 1.17601, 0.955246, 0.4941176, 0, 1, 1,
0.686402, -0.2540609, 2.476347, 0.5019608, 0, 1, 1,
0.6932722, 0.4880399, 1.127618, 0.5058824, 0, 1, 1,
0.6953542, 0.09062933, 1.472024, 0.5137255, 0, 1, 1,
0.6990349, 0.8294472, 0.5470751, 0.5176471, 0, 1, 1,
0.7017385, -0.219423, 3.952772, 0.5254902, 0, 1, 1,
0.7038274, -0.9478834, 3.45001, 0.5294118, 0, 1, 1,
0.7050256, 1.371586, 1.658411, 0.5372549, 0, 1, 1,
0.7052789, -0.6042485, 1.753988, 0.5411765, 0, 1, 1,
0.712097, 0.2834656, 0.3902185, 0.5490196, 0, 1, 1,
0.7187594, -0.4077769, 0.6852489, 0.5529412, 0, 1, 1,
0.7200518, 0.2583919, 1.164651, 0.5607843, 0, 1, 1,
0.7218862, 0.7254789, 2.212255, 0.5647059, 0, 1, 1,
0.7282111, -0.6336507, 1.408129, 0.572549, 0, 1, 1,
0.7316741, -0.4848055, 3.613353, 0.5764706, 0, 1, 1,
0.7348739, 1.068363, 1.208396, 0.5843138, 0, 1, 1,
0.735594, 0.1277845, 2.222255, 0.5882353, 0, 1, 1,
0.7405165, -0.3860759, 1.690674, 0.5960785, 0, 1, 1,
0.742244, -1.562541, 1.920157, 0.6039216, 0, 1, 1,
0.7473669, 0.1300147, 2.766632, 0.6078432, 0, 1, 1,
0.7476338, -0.2624264, 0.6941268, 0.6156863, 0, 1, 1,
0.7500019, 0.006963642, 1.611709, 0.6196079, 0, 1, 1,
0.7500048, -1.310231, 2.522852, 0.627451, 0, 1, 1,
0.7525069, 0.9966578, 1.683531, 0.6313726, 0, 1, 1,
0.7548976, 0.4835555, 0.4653479, 0.6392157, 0, 1, 1,
0.758006, -0.9713159, 2.399336, 0.6431373, 0, 1, 1,
0.7636331, -0.3162447, 1.570704, 0.6509804, 0, 1, 1,
0.7698859, 0.2172749, 1.68686, 0.654902, 0, 1, 1,
0.7701458, 0.6379808, 0.9830416, 0.6627451, 0, 1, 1,
0.770946, -0.07651861, 2.206402, 0.6666667, 0, 1, 1,
0.7730454, -0.4541841, 1.676878, 0.6745098, 0, 1, 1,
0.7784179, 1.653488, 1.86278, 0.6784314, 0, 1, 1,
0.7796447, -0.380306, 0.7116994, 0.6862745, 0, 1, 1,
0.7885683, -0.70064, 2.678854, 0.6901961, 0, 1, 1,
0.7887976, 0.8502761, 0.7742691, 0.6980392, 0, 1, 1,
0.792011, 1.119213, 2.265224, 0.7058824, 0, 1, 1,
0.7997215, 0.8677032, 0.7833584, 0.7098039, 0, 1, 1,
0.8052719, 0.05232558, 1.412371, 0.7176471, 0, 1, 1,
0.8165143, 1.087583, 0.06953099, 0.7215686, 0, 1, 1,
0.8225413, 0.3192014, 2.005609, 0.7294118, 0, 1, 1,
0.8241498, -1.676506, 2.84755, 0.7333333, 0, 1, 1,
0.8257047, -0.1673241, 3.681417, 0.7411765, 0, 1, 1,
0.8328297, 1.294091, 0.7026986, 0.7450981, 0, 1, 1,
0.8475061, -0.3056987, 1.658648, 0.7529412, 0, 1, 1,
0.849104, -0.3799008, 0.3363184, 0.7568628, 0, 1, 1,
0.8509701, 1.080277, 0.646535, 0.7647059, 0, 1, 1,
0.8521997, -0.6772896, 2.920964, 0.7686275, 0, 1, 1,
0.8536927, 0.7087951, 2.119051, 0.7764706, 0, 1, 1,
0.8557808, 0.01809307, 1.542297, 0.7803922, 0, 1, 1,
0.8588212, 1.969419, 1.026012, 0.7882353, 0, 1, 1,
0.8620006, -1.648411, 4.776625, 0.7921569, 0, 1, 1,
0.8689377, -0.8912125, 2.532132, 0.8, 0, 1, 1,
0.8700012, 0.270652, 1.327376, 0.8078431, 0, 1, 1,
0.8707216, 1.009531, 2.608714, 0.8117647, 0, 1, 1,
0.8763509, -0.003625351, 2.357166, 0.8196079, 0, 1, 1,
0.8798263, 0.902478, -0.6243448, 0.8235294, 0, 1, 1,
0.8826288, 1.355632, 0.9011474, 0.8313726, 0, 1, 1,
0.884374, -1.873933, 1.236595, 0.8352941, 0, 1, 1,
0.8847659, -0.1676426, 1.644673, 0.8431373, 0, 1, 1,
0.8871885, 0.4035524, 3.121916, 0.8470588, 0, 1, 1,
0.8872358, 0.6001154, -0.896558, 0.854902, 0, 1, 1,
0.8900077, -1.712368, 2.083099, 0.8588235, 0, 1, 1,
0.8976288, 1.368363, -0.372949, 0.8666667, 0, 1, 1,
0.898154, -0.06382128, 3.426878, 0.8705882, 0, 1, 1,
0.900158, -0.2868993, 0.8675973, 0.8784314, 0, 1, 1,
0.900639, 0.8451963, 1.475217, 0.8823529, 0, 1, 1,
0.9008243, -0.2469088, 1.52109, 0.8901961, 0, 1, 1,
0.9226453, 0.3168425, 1.403984, 0.8941177, 0, 1, 1,
0.9240422, -1.63635, 1.775733, 0.9019608, 0, 1, 1,
0.9285831, 0.8223172, -0.1181927, 0.9098039, 0, 1, 1,
0.9303188, 1.209593, 2.452022, 0.9137255, 0, 1, 1,
0.9333757, 1.092516, -0.82365, 0.9215686, 0, 1, 1,
0.937003, 0.79509, 1.852669, 0.9254902, 0, 1, 1,
0.9392302, 1.368999, 1.055612, 0.9333333, 0, 1, 1,
0.9421968, 0.1872779, 1.995268, 0.9372549, 0, 1, 1,
0.942574, 0.1748735, -1.278377, 0.945098, 0, 1, 1,
0.9426342, -0.4420601, 0.7439963, 0.9490196, 0, 1, 1,
0.9435089, -1.019796, 1.434146, 0.9568627, 0, 1, 1,
0.949868, 1.48825, 2.039008, 0.9607843, 0, 1, 1,
0.9505951, 0.4016786, 2.170664, 0.9686275, 0, 1, 1,
0.9510525, 0.7719698, 0.642652, 0.972549, 0, 1, 1,
0.9548205, 0.164808, 0.2754532, 0.9803922, 0, 1, 1,
0.9555298, 1.248617, 0.4387284, 0.9843137, 0, 1, 1,
0.9564692, 2.720111, -0.4926122, 0.9921569, 0, 1, 1,
0.9570345, 0.09909014, 0.3684857, 0.9960784, 0, 1, 1,
0.9593225, -1.220666, 0.7903687, 1, 0, 0.9960784, 1,
0.9642955, -0.1562447, 2.870403, 1, 0, 0.9882353, 1,
0.9792268, -0.7393236, 1.030283, 1, 0, 0.9843137, 1,
0.9887181, -0.2986175, 1.859752, 1, 0, 0.9764706, 1,
1.008695, -0.2424091, 1.578618, 1, 0, 0.972549, 1,
1.009215, -0.2975218, 2.004587, 1, 0, 0.9647059, 1,
1.011506, 0.7726663, 0.3187545, 1, 0, 0.9607843, 1,
1.01822, 0.388356, 3.223938, 1, 0, 0.9529412, 1,
1.018899, -0.729292, 2.208407, 1, 0, 0.9490196, 1,
1.019817, 0.4427766, 0.7496663, 1, 0, 0.9411765, 1,
1.019954, -0.2933019, 0.5994264, 1, 0, 0.9372549, 1,
1.02256, -0.322949, 2.978114, 1, 0, 0.9294118, 1,
1.023696, -0.544609, 2.182055, 1, 0, 0.9254902, 1,
1.025573, -0.4767751, 2.685481, 1, 0, 0.9176471, 1,
1.02973, -0.6347618, 3.33208, 1, 0, 0.9137255, 1,
1.030764, 1.324964, 1.032119, 1, 0, 0.9058824, 1,
1.034532, -1.43765, 1.537166, 1, 0, 0.9019608, 1,
1.034837, -0.1322034, 0.1470244, 1, 0, 0.8941177, 1,
1.035296, -0.06796481, 2.118204, 1, 0, 0.8862745, 1,
1.037872, -0.7702872, 4.546791, 1, 0, 0.8823529, 1,
1.040439, -0.01884105, 2.772082, 1, 0, 0.8745098, 1,
1.041557, -1.197755, 3.873143, 1, 0, 0.8705882, 1,
1.045236, 0.3530046, 2.267397, 1, 0, 0.8627451, 1,
1.046601, 0.1409977, 0.923031, 1, 0, 0.8588235, 1,
1.050215, -0.3395652, -0.2530701, 1, 0, 0.8509804, 1,
1.052032, 0.40808, -0.4971257, 1, 0, 0.8470588, 1,
1.054142, 1.89662, 0.7836435, 1, 0, 0.8392157, 1,
1.056952, -1.394188, 3.372843, 1, 0, 0.8352941, 1,
1.061472, 0.7504689, -0.07069133, 1, 0, 0.827451, 1,
1.069108, 0.2940752, 2.270191, 1, 0, 0.8235294, 1,
1.07353, -1.645217, 2.457418, 1, 0, 0.8156863, 1,
1.081119, 2.703754, 0.6199685, 1, 0, 0.8117647, 1,
1.092729, -1.043849, 0.6145751, 1, 0, 0.8039216, 1,
1.099591, 0.02015546, -0.322323, 1, 0, 0.7960784, 1,
1.100405, -0.7052419, 2.090673, 1, 0, 0.7921569, 1,
1.103847, 2.024784, 1.782729, 1, 0, 0.7843137, 1,
1.107075, -0.7287047, 1.502902, 1, 0, 0.7803922, 1,
1.107526, 0.5638823, 0.3849326, 1, 0, 0.772549, 1,
1.114707, 0.6941546, 3.21288, 1, 0, 0.7686275, 1,
1.116253, 1.579277, 1.749228, 1, 0, 0.7607843, 1,
1.120783, -1.007605, 2.174993, 1, 0, 0.7568628, 1,
1.140062, -1.358633, 2.217834, 1, 0, 0.7490196, 1,
1.141515, -1.176323, 3.616593, 1, 0, 0.7450981, 1,
1.151657, 0.3532646, -1.30384, 1, 0, 0.7372549, 1,
1.152352, -0.5929557, 2.680918, 1, 0, 0.7333333, 1,
1.160739, 0.9701639, 0.4387943, 1, 0, 0.7254902, 1,
1.167369, 0.399564, 2.336639, 1, 0, 0.7215686, 1,
1.169184, 0.8889804, -0.03970934, 1, 0, 0.7137255, 1,
1.179707, -1.505097, 2.297764, 1, 0, 0.7098039, 1,
1.180401, -0.214579, 1.781239, 1, 0, 0.7019608, 1,
1.1846, 0.006748814, 1.61226, 1, 0, 0.6941177, 1,
1.184631, -0.1275459, 1.465635, 1, 0, 0.6901961, 1,
1.197543, 0.8412383, 1.108966, 1, 0, 0.682353, 1,
1.202997, 1.937425, 2.928762, 1, 0, 0.6784314, 1,
1.205821, -1.31873, 2.156401, 1, 0, 0.6705883, 1,
1.211125, 0.9449519, 0.8855707, 1, 0, 0.6666667, 1,
1.216903, 1.287154, 1.282464, 1, 0, 0.6588235, 1,
1.221145, -1.351699, 3.608224, 1, 0, 0.654902, 1,
1.227478, 0.3770984, 1.227561, 1, 0, 0.6470588, 1,
1.232822, -0.2146648, 3.862622, 1, 0, 0.6431373, 1,
1.235674, 0.0133713, 1.65751, 1, 0, 0.6352941, 1,
1.244055, 0.7376965, 1.31788, 1, 0, 0.6313726, 1,
1.248423, -0.8116087, 2.614879, 1, 0, 0.6235294, 1,
1.257972, -0.8249278, 2.9466, 1, 0, 0.6196079, 1,
1.258675, -0.3478647, 2.144001, 1, 0, 0.6117647, 1,
1.261414, 0.06533795, 2.23558, 1, 0, 0.6078432, 1,
1.268619, -0.7352154, 2.206232, 1, 0, 0.6, 1,
1.269493, 1.41313, 2.431538, 1, 0, 0.5921569, 1,
1.272891, -0.6425775, 3.257384, 1, 0, 0.5882353, 1,
1.276706, -0.6868353, 2.759549, 1, 0, 0.5803922, 1,
1.278189, 1.734106, 1.166568, 1, 0, 0.5764706, 1,
1.287358, 1.650376, -0.1403567, 1, 0, 0.5686275, 1,
1.290022, 0.316707, 2.801977, 1, 0, 0.5647059, 1,
1.295825, -0.8144282, 2.553677, 1, 0, 0.5568628, 1,
1.303296, 0.7381949, 0.5890396, 1, 0, 0.5529412, 1,
1.309697, 0.193683, 2.292426, 1, 0, 0.5450981, 1,
1.318081, -0.6475779, 1.090544, 1, 0, 0.5411765, 1,
1.319002, 0.5413748, -0.07992551, 1, 0, 0.5333334, 1,
1.331305, -0.8815687, 0.6268511, 1, 0, 0.5294118, 1,
1.336249, 1.166255, -0.6583645, 1, 0, 0.5215687, 1,
1.343232, -0.1876051, 2.427391, 1, 0, 0.5176471, 1,
1.349404, 1.032585, -1.045357, 1, 0, 0.509804, 1,
1.352837, 1.888623, 0.1799256, 1, 0, 0.5058824, 1,
1.352978, 0.1060834, 1.601544, 1, 0, 0.4980392, 1,
1.353695, 1.659509, -0.09881616, 1, 0, 0.4901961, 1,
1.365692, 2.354824, 1.082581, 1, 0, 0.4862745, 1,
1.370447, -0.931002, 1.975366, 1, 0, 0.4784314, 1,
1.374122, 0.1233765, 2.233849, 1, 0, 0.4745098, 1,
1.377496, -0.582279, 1.926614, 1, 0, 0.4666667, 1,
1.392182, -0.4788162, 3.413805, 1, 0, 0.4627451, 1,
1.394953, 0.7580805, 0.4139549, 1, 0, 0.454902, 1,
1.398351, 0.08113449, 0.3460814, 1, 0, 0.4509804, 1,
1.398836, -0.628269, 0.9776577, 1, 0, 0.4431373, 1,
1.400849, -1.274868, 1.239357, 1, 0, 0.4392157, 1,
1.403814, -0.3850898, 2.49361, 1, 0, 0.4313726, 1,
1.40642, 0.7916825, 2.487419, 1, 0, 0.427451, 1,
1.409972, 0.8056703, 0.1591036, 1, 0, 0.4196078, 1,
1.413018, -0.5123959, 2.894348, 1, 0, 0.4156863, 1,
1.41416, 1.365167, 0.9277894, 1, 0, 0.4078431, 1,
1.44697, 0.5346879, -0.5817223, 1, 0, 0.4039216, 1,
1.447198, 2.311739, 2.929691, 1, 0, 0.3960784, 1,
1.447485, -3.644733, 3.494183, 1, 0, 0.3882353, 1,
1.454614, 0.541465, 2.373564, 1, 0, 0.3843137, 1,
1.465662, 0.899215, -0.8886869, 1, 0, 0.3764706, 1,
1.471606, -0.3597449, 2.487078, 1, 0, 0.372549, 1,
1.484227, 0.6221254, 0.08099476, 1, 0, 0.3647059, 1,
1.485446, -0.493459, 2.556497, 1, 0, 0.3607843, 1,
1.503623, 0.1509998, -0.204056, 1, 0, 0.3529412, 1,
1.529169, 0.293604, 2.213472, 1, 0, 0.3490196, 1,
1.536153, 0.2783611, 2.617318, 1, 0, 0.3411765, 1,
1.538325, -1.115553, 1.070278, 1, 0, 0.3372549, 1,
1.543628, 1.118382, 0.880434, 1, 0, 0.3294118, 1,
1.564248, 1.858528, 0.4333435, 1, 0, 0.3254902, 1,
1.56643, -0.3671901, 2.131429, 1, 0, 0.3176471, 1,
1.574755, 0.9065655, -1.307188, 1, 0, 0.3137255, 1,
1.583685, 0.7793733, 1.443416, 1, 0, 0.3058824, 1,
1.591114, -1.012071, 0.9870542, 1, 0, 0.2980392, 1,
1.591498, 1.28116, 1.59462, 1, 0, 0.2941177, 1,
1.598677, -0.349245, 2.614484, 1, 0, 0.2862745, 1,
1.601954, 0.3739484, 0.4771155, 1, 0, 0.282353, 1,
1.644462, 0.3307533, 1.809259, 1, 0, 0.2745098, 1,
1.648054, -0.03080985, 1.505344, 1, 0, 0.2705882, 1,
1.652008, 0.07988607, 1.519841, 1, 0, 0.2627451, 1,
1.655849, -0.7224509, 0.7095199, 1, 0, 0.2588235, 1,
1.657432, -0.2810263, 2.803034, 1, 0, 0.2509804, 1,
1.67234, 1.134497, 0.8182368, 1, 0, 0.2470588, 1,
1.682485, 0.5923587, 0.3013328, 1, 0, 0.2392157, 1,
1.689259, -0.131752, 1.802869, 1, 0, 0.2352941, 1,
1.694674, 0.5453232, 1.767373, 1, 0, 0.227451, 1,
1.716036, -0.8114035, 3.752246, 1, 0, 0.2235294, 1,
1.765886, -0.1883622, 1.988754, 1, 0, 0.2156863, 1,
1.777226, -0.7103557, 3.64363, 1, 0, 0.2117647, 1,
1.781597, -0.9942318, 3.674831, 1, 0, 0.2039216, 1,
1.801061, -1.211923, 1.549179, 1, 0, 0.1960784, 1,
1.820671, 1.695542, 1.392009, 1, 0, 0.1921569, 1,
1.823013, -0.1669837, -0.04606622, 1, 0, 0.1843137, 1,
1.86323, 0.0501642, 0.8368671, 1, 0, 0.1803922, 1,
1.869558, -0.8759177, 1.0805, 1, 0, 0.172549, 1,
1.874019, -0.4609512, 2.796541, 1, 0, 0.1686275, 1,
1.890996, 0.02378793, 1.534616, 1, 0, 0.1607843, 1,
1.892066, 1.098624, 1.482641, 1, 0, 0.1568628, 1,
1.89431, -1.031934, 2.219868, 1, 0, 0.1490196, 1,
1.982329, 1.175027, 1.227603, 1, 0, 0.145098, 1,
2.000203, -0.7857774, 2.552879, 1, 0, 0.1372549, 1,
2.010263, -0.0172052, 1.234025, 1, 0, 0.1333333, 1,
2.053126, -0.4066228, 0.8587663, 1, 0, 0.1254902, 1,
2.117151, -2.616876, 1.213062, 1, 0, 0.1215686, 1,
2.144809, -1.246677, 3.356587, 1, 0, 0.1137255, 1,
2.167259, 0.1017153, 1.373714, 1, 0, 0.1098039, 1,
2.231238, -0.02570832, 2.909233, 1, 0, 0.1019608, 1,
2.238254, 0.93431, 0.622798, 1, 0, 0.09411765, 1,
2.239243, 1.610088, 2.543031, 1, 0, 0.09019608, 1,
2.243476, 2.260341, -0.1782359, 1, 0, 0.08235294, 1,
2.34155, 0.3752707, 0.3615088, 1, 0, 0.07843138, 1,
2.45249, 0.9585598, 1.806095, 1, 0, 0.07058824, 1,
2.460478, 0.4990667, 3.258198, 1, 0, 0.06666667, 1,
2.461118, -1.701699, 2.670911, 1, 0, 0.05882353, 1,
2.466239, 0.6517383, 1.48102, 1, 0, 0.05490196, 1,
2.696813, -0.3142191, 1.661737, 1, 0, 0.04705882, 1,
2.741704, 0.9512963, 2.127761, 1, 0, 0.04313726, 1,
2.766039, -1.272282, 1.289267, 1, 0, 0.03529412, 1,
2.810189, -0.1145208, 0.41368, 1, 0, 0.03137255, 1,
2.824614, 0.6610307, 0.7876949, 1, 0, 0.02352941, 1,
2.82491, 0.7702686, 1.283757, 1, 0, 0.01960784, 1,
3.066218, 0.6503933, 2.582327, 1, 0, 0.01176471, 1,
3.144735, 0.61799, 1.493791, 1, 0, 0.007843138, 1
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
0.1449558, -4.763366, -6.601161, 0, -0.5, 0.5, 0.5,
0.1449558, -4.763366, -6.601161, 1, -0.5, 0.5, 0.5,
0.1449558, -4.763366, -6.601161, 1, 1.5, 0.5, 0.5,
0.1449558, -4.763366, -6.601161, 0, 1.5, 0.5, 0.5
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
-3.871748, -0.3449323, -6.601161, 0, -0.5, 0.5, 0.5,
-3.871748, -0.3449323, -6.601161, 1, -0.5, 0.5, 0.5,
-3.871748, -0.3449323, -6.601161, 1, 1.5, 0.5, 0.5,
-3.871748, -0.3449323, -6.601161, 0, 1.5, 0.5, 0.5
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
-3.871748, -4.763366, 0.3827722, 0, -0.5, 0.5, 0.5,
-3.871748, -4.763366, 0.3827722, 1, -0.5, 0.5, 0.5,
-3.871748, -4.763366, 0.3827722, 1, 1.5, 0.5, 0.5,
-3.871748, -4.763366, 0.3827722, 0, 1.5, 0.5, 0.5
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
-2, -3.743727, -4.989485,
3, -3.743727, -4.989485,
-2, -3.743727, -4.989485,
-2, -3.913667, -5.258098,
-1, -3.743727, -4.989485,
-1, -3.913667, -5.258098,
0, -3.743727, -4.989485,
0, -3.913667, -5.258098,
1, -3.743727, -4.989485,
1, -3.913667, -5.258098,
2, -3.743727, -4.989485,
2, -3.913667, -5.258098,
3, -3.743727, -4.989485,
3, -3.913667, -5.258098
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
-2, -4.253546, -5.795323, 0, -0.5, 0.5, 0.5,
-2, -4.253546, -5.795323, 1, -0.5, 0.5, 0.5,
-2, -4.253546, -5.795323, 1, 1.5, 0.5, 0.5,
-2, -4.253546, -5.795323, 0, 1.5, 0.5, 0.5,
-1, -4.253546, -5.795323, 0, -0.5, 0.5, 0.5,
-1, -4.253546, -5.795323, 1, -0.5, 0.5, 0.5,
-1, -4.253546, -5.795323, 1, 1.5, 0.5, 0.5,
-1, -4.253546, -5.795323, 0, 1.5, 0.5, 0.5,
0, -4.253546, -5.795323, 0, -0.5, 0.5, 0.5,
0, -4.253546, -5.795323, 1, -0.5, 0.5, 0.5,
0, -4.253546, -5.795323, 1, 1.5, 0.5, 0.5,
0, -4.253546, -5.795323, 0, 1.5, 0.5, 0.5,
1, -4.253546, -5.795323, 0, -0.5, 0.5, 0.5,
1, -4.253546, -5.795323, 1, -0.5, 0.5, 0.5,
1, -4.253546, -5.795323, 1, 1.5, 0.5, 0.5,
1, -4.253546, -5.795323, 0, 1.5, 0.5, 0.5,
2, -4.253546, -5.795323, 0, -0.5, 0.5, 0.5,
2, -4.253546, -5.795323, 1, -0.5, 0.5, 0.5,
2, -4.253546, -5.795323, 1, 1.5, 0.5, 0.5,
2, -4.253546, -5.795323, 0, 1.5, 0.5, 0.5,
3, -4.253546, -5.795323, 0, -0.5, 0.5, 0.5,
3, -4.253546, -5.795323, 1, -0.5, 0.5, 0.5,
3, -4.253546, -5.795323, 1, 1.5, 0.5, 0.5,
3, -4.253546, -5.795323, 0, 1.5, 0.5, 0.5
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
-2.944817, -3, -4.989485,
-2.944817, 2, -4.989485,
-2.944817, -3, -4.989485,
-3.099305, -3, -5.258098,
-2.944817, -2, -4.989485,
-3.099305, -2, -5.258098,
-2.944817, -1, -4.989485,
-3.099305, -1, -5.258098,
-2.944817, 0, -4.989485,
-3.099305, 0, -5.258098,
-2.944817, 1, -4.989485,
-3.099305, 1, -5.258098,
-2.944817, 2, -4.989485,
-3.099305, 2, -5.258098
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
-3.408283, -3, -5.795323, 0, -0.5, 0.5, 0.5,
-3.408283, -3, -5.795323, 1, -0.5, 0.5, 0.5,
-3.408283, -3, -5.795323, 1, 1.5, 0.5, 0.5,
-3.408283, -3, -5.795323, 0, 1.5, 0.5, 0.5,
-3.408283, -2, -5.795323, 0, -0.5, 0.5, 0.5,
-3.408283, -2, -5.795323, 1, -0.5, 0.5, 0.5,
-3.408283, -2, -5.795323, 1, 1.5, 0.5, 0.5,
-3.408283, -2, -5.795323, 0, 1.5, 0.5, 0.5,
-3.408283, -1, -5.795323, 0, -0.5, 0.5, 0.5,
-3.408283, -1, -5.795323, 1, -0.5, 0.5, 0.5,
-3.408283, -1, -5.795323, 1, 1.5, 0.5, 0.5,
-3.408283, -1, -5.795323, 0, 1.5, 0.5, 0.5,
-3.408283, 0, -5.795323, 0, -0.5, 0.5, 0.5,
-3.408283, 0, -5.795323, 1, -0.5, 0.5, 0.5,
-3.408283, 0, -5.795323, 1, 1.5, 0.5, 0.5,
-3.408283, 0, -5.795323, 0, 1.5, 0.5, 0.5,
-3.408283, 1, -5.795323, 0, -0.5, 0.5, 0.5,
-3.408283, 1, -5.795323, 1, -0.5, 0.5, 0.5,
-3.408283, 1, -5.795323, 1, 1.5, 0.5, 0.5,
-3.408283, 1, -5.795323, 0, 1.5, 0.5, 0.5,
-3.408283, 2, -5.795323, 0, -0.5, 0.5, 0.5,
-3.408283, 2, -5.795323, 1, -0.5, 0.5, 0.5,
-3.408283, 2, -5.795323, 1, 1.5, 0.5, 0.5,
-3.408283, 2, -5.795323, 0, 1.5, 0.5, 0.5
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
-2.944817, -3.743727, -4,
-2.944817, -3.743727, 4,
-2.944817, -3.743727, -4,
-3.099305, -3.913667, -4,
-2.944817, -3.743727, -2,
-3.099305, -3.913667, -2,
-2.944817, -3.743727, 0,
-3.099305, -3.913667, 0,
-2.944817, -3.743727, 2,
-3.099305, -3.913667, 2,
-2.944817, -3.743727, 4,
-3.099305, -3.913667, 4
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
-3.408283, -4.253546, -4, 0, -0.5, 0.5, 0.5,
-3.408283, -4.253546, -4, 1, -0.5, 0.5, 0.5,
-3.408283, -4.253546, -4, 1, 1.5, 0.5, 0.5,
-3.408283, -4.253546, -4, 0, 1.5, 0.5, 0.5,
-3.408283, -4.253546, -2, 0, -0.5, 0.5, 0.5,
-3.408283, -4.253546, -2, 1, -0.5, 0.5, 0.5,
-3.408283, -4.253546, -2, 1, 1.5, 0.5, 0.5,
-3.408283, -4.253546, -2, 0, 1.5, 0.5, 0.5,
-3.408283, -4.253546, 0, 0, -0.5, 0.5, 0.5,
-3.408283, -4.253546, 0, 1, -0.5, 0.5, 0.5,
-3.408283, -4.253546, 0, 1, 1.5, 0.5, 0.5,
-3.408283, -4.253546, 0, 0, 1.5, 0.5, 0.5,
-3.408283, -4.253546, 2, 0, -0.5, 0.5, 0.5,
-3.408283, -4.253546, 2, 1, -0.5, 0.5, 0.5,
-3.408283, -4.253546, 2, 1, 1.5, 0.5, 0.5,
-3.408283, -4.253546, 2, 0, 1.5, 0.5, 0.5,
-3.408283, -4.253546, 4, 0, -0.5, 0.5, 0.5,
-3.408283, -4.253546, 4, 1, -0.5, 0.5, 0.5,
-3.408283, -4.253546, 4, 1, 1.5, 0.5, 0.5,
-3.408283, -4.253546, 4, 0, 1.5, 0.5, 0.5
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
-2.944817, -3.743727, -4.989485,
-2.944817, 3.053863, -4.989485,
-2.944817, -3.743727, 5.755029,
-2.944817, 3.053863, 5.755029,
-2.944817, -3.743727, -4.989485,
-2.944817, -3.743727, 5.755029,
-2.944817, 3.053863, -4.989485,
-2.944817, 3.053863, 5.755029,
-2.944817, -3.743727, -4.989485,
3.234728, -3.743727, -4.989485,
-2.944817, -3.743727, 5.755029,
3.234728, -3.743727, 5.755029,
-2.944817, 3.053863, -4.989485,
3.234728, 3.053863, -4.989485,
-2.944817, 3.053863, 5.755029,
3.234728, 3.053863, 5.755029,
3.234728, -3.743727, -4.989485,
3.234728, 3.053863, -4.989485,
3.234728, -3.743727, 5.755029,
3.234728, 3.053863, 5.755029,
3.234728, -3.743727, -4.989485,
3.234728, -3.743727, 5.755029,
3.234728, 3.053863, -4.989485,
3.234728, 3.053863, 5.755029
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
var radius = 7.548578;
var distance = 33.58448;
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
mvMatrix.translate( -0.1449558, 0.3449323, -0.3827722 );
mvMatrix.scale( 1.320756, 1.200671, 0.7596128 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.58448);
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
flutolanil<-read.table("flutolanil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flutolanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'flutolanil' not found
```

```r
y<-flutolanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'flutolanil' not found
```

```r
z<-flutolanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'flutolanil' not found
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
-2.854823, -0.3112366, 0.1787059, 0, 0, 1, 1, 1,
-2.691058, -0.9090868, -1.69847, 1, 0, 0, 1, 1,
-2.645357, -1.118085, -0.4846127, 1, 0, 0, 1, 1,
-2.640975, -1.704787, -1.495095, 1, 0, 0, 1, 1,
-2.545758, -0.8359246, -0.1394307, 1, 0, 0, 1, 1,
-2.448732, -1.023351, 0.7207662, 1, 0, 0, 1, 1,
-2.317187, 2.954869, -0.09343196, 0, 0, 0, 1, 1,
-2.297064, -0.9904175, -3.88332, 0, 0, 0, 1, 1,
-2.289807, -0.1780956, -1.135653, 0, 0, 0, 1, 1,
-2.283275, 0.2501601, -2.80548, 0, 0, 0, 1, 1,
-2.267001, 2.665369, -0.8467717, 0, 0, 0, 1, 1,
-2.234497, 0.3775531, 0.01394316, 0, 0, 0, 1, 1,
-2.152284, -0.3891841, -1.315495, 0, 0, 0, 1, 1,
-2.145078, 1.211705, -0.6692791, 1, 1, 1, 1, 1,
-2.139966, -1.444546, -3.227003, 1, 1, 1, 1, 1,
-2.120529, 0.5590124, -0.4823897, 1, 1, 1, 1, 1,
-2.091094, 0.639859, 0.1973527, 1, 1, 1, 1, 1,
-2.088443, -0.08568762, -1.608799, 1, 1, 1, 1, 1,
-2.035621, 1.137926, -0.6134229, 1, 1, 1, 1, 1,
-2.025867, -0.2897775, -2.068737, 1, 1, 1, 1, 1,
-2.024903, -0.1570472, -0.09574714, 1, 1, 1, 1, 1,
-2.017928, 0.9234042, 0.2126067, 1, 1, 1, 1, 1,
-2.01371, -0.8335714, -3.102213, 1, 1, 1, 1, 1,
-2.011053, -0.984895, -2.638656, 1, 1, 1, 1, 1,
-1.977854, 0.12048, -1.848259, 1, 1, 1, 1, 1,
-1.974955, 0.5075259, -0.2896194, 1, 1, 1, 1, 1,
-1.972898, 0.3202848, -1.828291, 1, 1, 1, 1, 1,
-1.971357, -0.03907017, -3.328667, 1, 1, 1, 1, 1,
-1.946884, 0.6053512, -0.7635828, 0, 0, 1, 1, 1,
-1.939258, 0.05154415, -1.075921, 1, 0, 0, 1, 1,
-1.934311, 1.143523, -1.352044, 1, 0, 0, 1, 1,
-1.927384, -0.1623735, -1.661889, 1, 0, 0, 1, 1,
-1.91751, -1.225613, -1.823393, 1, 0, 0, 1, 1,
-1.911967, 0.1834073, -1.240127, 1, 0, 0, 1, 1,
-1.895241, 0.9813539, -1.05659, 0, 0, 0, 1, 1,
-1.894189, -1.74178, -2.44979, 0, 0, 0, 1, 1,
-1.889724, -0.1626368, -0.9195234, 0, 0, 0, 1, 1,
-1.865637, -0.8635554, -1.799658, 0, 0, 0, 1, 1,
-1.857968, -0.175197, -3.176664, 0, 0, 0, 1, 1,
-1.855525, 0.2555623, -2.117483, 0, 0, 0, 1, 1,
-1.830779, 0.5347129, -2.035782, 0, 0, 0, 1, 1,
-1.823649, 0.5915859, -2.404262, 1, 1, 1, 1, 1,
-1.812314, -0.3148577, -2.6934, 1, 1, 1, 1, 1,
-1.800778, -1.260026, -1.437883, 1, 1, 1, 1, 1,
-1.773773, -1.473016, -1.4527, 1, 1, 1, 1, 1,
-1.7262, 1.195714, 0.4584395, 1, 1, 1, 1, 1,
-1.717108, -2.177189, -3.351619, 1, 1, 1, 1, 1,
-1.685138, -0.4954126, -2.906008, 1, 1, 1, 1, 1,
-1.646593, 0.3872899, -0.6284431, 1, 1, 1, 1, 1,
-1.635341, 1.176643, 0.3221145, 1, 1, 1, 1, 1,
-1.629104, -1.88556, -2.080108, 1, 1, 1, 1, 1,
-1.625738, 0.4649048, 0.131182, 1, 1, 1, 1, 1,
-1.622742, -0.1722206, -1.861591, 1, 1, 1, 1, 1,
-1.617366, -0.1815735, -2.131062, 1, 1, 1, 1, 1,
-1.61155, -0.4395131, -1.869492, 1, 1, 1, 1, 1,
-1.598045, 0.6101326, -2.070631, 1, 1, 1, 1, 1,
-1.576552, -0.04131683, -2.245756, 0, 0, 1, 1, 1,
-1.56608, 1.450453, -2.581021, 1, 0, 0, 1, 1,
-1.562703, -1.042011, -1.526119, 1, 0, 0, 1, 1,
-1.560341, 0.6481763, -1.084302, 1, 0, 0, 1, 1,
-1.522779, -0.02479567, -1.233785, 1, 0, 0, 1, 1,
-1.515537, -0.3926336, -1.357639, 1, 0, 0, 1, 1,
-1.502636, 0.3969228, -1.596525, 0, 0, 0, 1, 1,
-1.485296, 1.281531, -0.9541621, 0, 0, 0, 1, 1,
-1.47946, -0.5527888, -1.180065, 0, 0, 0, 1, 1,
-1.477138, -0.09598619, -1.562573, 0, 0, 0, 1, 1,
-1.434924, -0.6378837, -1.065758, 0, 0, 0, 1, 1,
-1.432541, -0.4459386, -1.876947, 0, 0, 0, 1, 1,
-1.41932, -0.1133567, -2.012808, 0, 0, 0, 1, 1,
-1.418751, 0.917979, -0.3699461, 1, 1, 1, 1, 1,
-1.413068, -0.2402461, -2.082018, 1, 1, 1, 1, 1,
-1.412016, 0.4754434, -1.859216, 1, 1, 1, 1, 1,
-1.405808, -0.5343746, -2.618273, 1, 1, 1, 1, 1,
-1.405489, -0.1087076, -0.7545153, 1, 1, 1, 1, 1,
-1.404368, -0.3075381, -2.169444, 1, 1, 1, 1, 1,
-1.390527, 0.359303, -2.358862, 1, 1, 1, 1, 1,
-1.386081, -0.668219, -1.72979, 1, 1, 1, 1, 1,
-1.385681, 0.2502775, 0.05570284, 1, 1, 1, 1, 1,
-1.382624, -0.3521537, -0.8190593, 1, 1, 1, 1, 1,
-1.377359, 0.13225, -0.5117593, 1, 1, 1, 1, 1,
-1.364135, -0.1885988, -1.115078, 1, 1, 1, 1, 1,
-1.363011, 0.2636182, -1.661072, 1, 1, 1, 1, 1,
-1.356884, -1.52697, -2.420932, 1, 1, 1, 1, 1,
-1.355505, -1.008677, -2.644537, 1, 1, 1, 1, 1,
-1.349387, -1.20512, -2.828133, 0, 0, 1, 1, 1,
-1.334138, 0.8642538, -2.09829, 1, 0, 0, 1, 1,
-1.333191, 0.5857384, -0.4151419, 1, 0, 0, 1, 1,
-1.330688, 1.654659, -0.7111807, 1, 0, 0, 1, 1,
-1.324804, -0.2334041, -2.718902, 1, 0, 0, 1, 1,
-1.32441, -2.48755, -0.1815248, 1, 0, 0, 1, 1,
-1.321352, -1.256731, -2.479848, 0, 0, 0, 1, 1,
-1.320613, 1.753995, -1.939075, 0, 0, 0, 1, 1,
-1.311883, -1.086377, -1.932313, 0, 0, 0, 1, 1,
-1.281994, -0.5480455, -0.9916907, 0, 0, 0, 1, 1,
-1.281201, 0.1184985, -1.202339, 0, 0, 0, 1, 1,
-1.276578, -1.275165, -1.536191, 0, 0, 0, 1, 1,
-1.273145, -1.066613, -1.769622, 0, 0, 0, 1, 1,
-1.253577, -0.9447792, -1.309245, 1, 1, 1, 1, 1,
-1.242479, 0.03817543, -1.348084, 1, 1, 1, 1, 1,
-1.237122, -0.07892605, -3.657222, 1, 1, 1, 1, 1,
-1.232815, 0.406082, 0.2035426, 1, 1, 1, 1, 1,
-1.23236, 0.0466981, -0.156196, 1, 1, 1, 1, 1,
-1.227117, 1.191195, -0.6794291, 1, 1, 1, 1, 1,
-1.221736, 0.5895787, -1.863776, 1, 1, 1, 1, 1,
-1.220363, -1.097076, -2.036525, 1, 1, 1, 1, 1,
-1.218346, 0.6380395, -1.593756, 1, 1, 1, 1, 1,
-1.218081, 0.6830145, -2.147381, 1, 1, 1, 1, 1,
-1.213373, -0.5401443, -3.228688, 1, 1, 1, 1, 1,
-1.212393, -0.1158433, -3.837961, 1, 1, 1, 1, 1,
-1.211331, -0.1899098, -2.029134, 1, 1, 1, 1, 1,
-1.208949, -0.3966193, -0.5678406, 1, 1, 1, 1, 1,
-1.204991, 0.9659526, -0.7865307, 1, 1, 1, 1, 1,
-1.196632, 0.4141247, -0.5510702, 0, 0, 1, 1, 1,
-1.190788, 1.474638, -3.65059, 1, 0, 0, 1, 1,
-1.185828, -0.6531277, -3.235934, 1, 0, 0, 1, 1,
-1.176355, -2.081716, -1.338793, 1, 0, 0, 1, 1,
-1.175219, -0.04002317, -3.037007, 1, 0, 0, 1, 1,
-1.173392, -0.4962692, -0.3465601, 1, 0, 0, 1, 1,
-1.172741, -0.5857229, -1.484539, 0, 0, 0, 1, 1,
-1.169682, -0.6513252, -1.844737, 0, 0, 0, 1, 1,
-1.158284, 0.09370191, -2.72965, 0, 0, 0, 1, 1,
-1.156271, -0.9688606, -2.102611, 0, 0, 0, 1, 1,
-1.15475, -1.137628, -1.51115, 0, 0, 0, 1, 1,
-1.14581, -0.06884126, -1.875283, 0, 0, 0, 1, 1,
-1.136126, -0.9333869, -0.6425254, 0, 0, 0, 1, 1,
-1.133732, 0.3827908, -0.3221228, 1, 1, 1, 1, 1,
-1.125004, -0.105404, -3.244548, 1, 1, 1, 1, 1,
-1.119362, 0.580031, -0.1498885, 1, 1, 1, 1, 1,
-1.116753, -0.910588, -4.651157, 1, 1, 1, 1, 1,
-1.115229, -0.6178399, -1.425944, 1, 1, 1, 1, 1,
-1.110584, 0.2661362, -1.63179, 1, 1, 1, 1, 1,
-1.104187, 0.365824, -2.172457, 1, 1, 1, 1, 1,
-1.100789, 0.3510652, 0.4462308, 1, 1, 1, 1, 1,
-1.096564, -1.00232, -0.9052652, 1, 1, 1, 1, 1,
-1.096173, 0.2214888, -1.811458, 1, 1, 1, 1, 1,
-1.093685, -0.9119813, -1.427655, 1, 1, 1, 1, 1,
-1.087343, 0.6219746, -0.5346067, 1, 1, 1, 1, 1,
-1.076897, -1.247088, -1.340244, 1, 1, 1, 1, 1,
-1.073653, -0.0552935, -0.6865589, 1, 1, 1, 1, 1,
-1.068856, -0.4523268, -0.01304642, 1, 1, 1, 1, 1,
-1.067911, -2.10999, 0.1702694, 0, 0, 1, 1, 1,
-1.062342, 1.101889, -1.656497, 1, 0, 0, 1, 1,
-1.059497, 1.106981, -0.7858158, 1, 0, 0, 1, 1,
-1.055349, 0.1817725, -0.9557461, 1, 0, 0, 1, 1,
-1.050027, 0.6801732, -0.9877779, 1, 0, 0, 1, 1,
-1.049258, 1.957172, -0.8663719, 1, 0, 0, 1, 1,
-1.046048, 0.006605219, -2.028696, 0, 0, 0, 1, 1,
-1.03394, 0.3365144, -1.587061, 0, 0, 0, 1, 1,
-1.029901, 0.4616523, -1.422756, 0, 0, 0, 1, 1,
-1.02846, 0.5482001, -1.521583, 0, 0, 0, 1, 1,
-1.027959, 1.371294, -0.3248298, 0, 0, 0, 1, 1,
-1.02572, -1.50898, -3.072907, 0, 0, 0, 1, 1,
-1.018269, 0.7754374, -0.7912257, 0, 0, 0, 1, 1,
-1.014471, 0.2152863, -3.050653, 1, 1, 1, 1, 1,
-1.014302, -0.9853896, -3.334304, 1, 1, 1, 1, 1,
-1.013258, -0.812063, -0.5144601, 1, 1, 1, 1, 1,
-1.008893, -0.4074743, -2.726758, 1, 1, 1, 1, 1,
-1.00834, 0.2977628, -2.205364, 1, 1, 1, 1, 1,
-1.001534, -2.244667, -2.461181, 1, 1, 1, 1, 1,
-1.000327, -0.08260423, -2.063709, 1, 1, 1, 1, 1,
-0.9995594, -0.5386124, -2.989861, 1, 1, 1, 1, 1,
-0.9972648, -0.1050988, -0.7055116, 1, 1, 1, 1, 1,
-0.990157, -0.05009004, -0.2554156, 1, 1, 1, 1, 1,
-0.9762529, 1.609351, 1.104113, 1, 1, 1, 1, 1,
-0.9731899, -1.797624, -4.030567, 1, 1, 1, 1, 1,
-0.9681126, -0.1251008, -0.4931048, 1, 1, 1, 1, 1,
-0.9657199, 0.6064989, -1.5288, 1, 1, 1, 1, 1,
-0.9643946, -0.1805114, -0.4552511, 1, 1, 1, 1, 1,
-0.9616211, 0.2651459, -1.350326, 0, 0, 1, 1, 1,
-0.9491419, 0.5749894, 0.7587622, 1, 0, 0, 1, 1,
-0.947819, -1.685307, -4.833011, 1, 0, 0, 1, 1,
-0.9470451, 0.4190182, -1.479138, 1, 0, 0, 1, 1,
-0.9444306, 0.9956518, -0.5546228, 1, 0, 0, 1, 1,
-0.9419773, -0.9668189, -2.210397, 1, 0, 0, 1, 1,
-0.9404626, -0.006876944, -1.9249, 0, 0, 0, 1, 1,
-0.9404216, 1.043072, -0.5072311, 0, 0, 0, 1, 1,
-0.9400385, 1.134802, -1.992389, 0, 0, 0, 1, 1,
-0.9378865, 1.15275, 0.4240077, 0, 0, 0, 1, 1,
-0.9361834, -0.02083801, -2.761583, 0, 0, 0, 1, 1,
-0.9317468, 0.2865966, -2.268792, 0, 0, 0, 1, 1,
-0.9313775, -0.398362, -1.59849, 0, 0, 0, 1, 1,
-0.9306049, 0.2319878, -1.794607, 1, 1, 1, 1, 1,
-0.9294758, 0.2720849, -1.355762, 1, 1, 1, 1, 1,
-0.9268159, -0.2367404, -1.456082, 1, 1, 1, 1, 1,
-0.9190869, 0.6144422, -1.974602, 1, 1, 1, 1, 1,
-0.914867, 1.611464, -0.1765036, 1, 1, 1, 1, 1,
-0.9118378, -1.692255, -1.895933, 1, 1, 1, 1, 1,
-0.9112927, -1.071532, -1.633793, 1, 1, 1, 1, 1,
-0.9097658, -0.2699833, -0.2761741, 1, 1, 1, 1, 1,
-0.9035447, -0.06880747, -1.865757, 1, 1, 1, 1, 1,
-0.8911129, 0.05428565, -1.58139, 1, 1, 1, 1, 1,
-0.8909702, -0.5926388, -2.355415, 1, 1, 1, 1, 1,
-0.8758312, -0.4011668, 0.3931309, 1, 1, 1, 1, 1,
-0.8740126, -1.015678, -1.934426, 1, 1, 1, 1, 1,
-0.8647296, -0.5826171, -1.60197, 1, 1, 1, 1, 1,
-0.864709, -0.6344585, -2.323216, 1, 1, 1, 1, 1,
-0.8638163, 0.3762071, -1.185469, 0, 0, 1, 1, 1,
-0.8578165, 1.479058, -0.3448699, 1, 0, 0, 1, 1,
-0.8546278, -1.474207, -3.336498, 1, 0, 0, 1, 1,
-0.8490312, -2.037395, -0.5037445, 1, 0, 0, 1, 1,
-0.8489742, -0.5369419, -1.566059, 1, 0, 0, 1, 1,
-0.8487142, 0.01102743, 0.4560291, 1, 0, 0, 1, 1,
-0.8463907, -0.4850207, -1.560292, 0, 0, 0, 1, 1,
-0.8449191, -0.3589252, -1.463094, 0, 0, 0, 1, 1,
-0.8446283, 0.5338614, 0.06966837, 0, 0, 0, 1, 1,
-0.8444231, -0.9820614, -3.714932, 0, 0, 0, 1, 1,
-0.8418497, -0.03382793, -1.79788, 0, 0, 0, 1, 1,
-0.8357788, -0.01296511, -1.289022, 0, 0, 0, 1, 1,
-0.8343998, -1.308117, -1.74973, 0, 0, 0, 1, 1,
-0.8242707, 0.9800273, -2.278251, 1, 1, 1, 1, 1,
-0.8242183, 0.4688621, -0.08346733, 1, 1, 1, 1, 1,
-0.8235008, -1.800697, -2.591528, 1, 1, 1, 1, 1,
-0.8207482, 0.5717441, -2.128751, 1, 1, 1, 1, 1,
-0.8174639, -0.1474697, -0.8289437, 1, 1, 1, 1, 1,
-0.8162107, -0.37128, -1.983199, 1, 1, 1, 1, 1,
-0.8137285, -0.4389221, -3.354121, 1, 1, 1, 1, 1,
-0.811324, -0.5172797, -0.8687814, 1, 1, 1, 1, 1,
-0.8102238, -1.220218, -2.471445, 1, 1, 1, 1, 1,
-0.809505, -1.116638, -1.826733, 1, 1, 1, 1, 1,
-0.7914678, -0.1817991, 1.04256, 1, 1, 1, 1, 1,
-0.7853487, -0.5457504, -1.39111, 1, 1, 1, 1, 1,
-0.783029, 0.8950999, -1.009186, 1, 1, 1, 1, 1,
-0.7783929, 1.575481, -2.228054, 1, 1, 1, 1, 1,
-0.7764264, -1.310737, -0.6942622, 1, 1, 1, 1, 1,
-0.7720031, 0.7614794, -0.4136025, 0, 0, 1, 1, 1,
-0.7709798, 0.07262721, 0.04895069, 1, 0, 0, 1, 1,
-0.7659411, 1.035109, -3.037648, 1, 0, 0, 1, 1,
-0.7625384, 0.4630503, -1.914786, 1, 0, 0, 1, 1,
-0.7589781, 0.3750319, -1.945543, 1, 0, 0, 1, 1,
-0.7584965, 0.2384993, -1.343111, 1, 0, 0, 1, 1,
-0.7574029, 0.7103823, -0.4972063, 0, 0, 0, 1, 1,
-0.7561174, -2.209331, -2.221541, 0, 0, 0, 1, 1,
-0.7520226, -0.892229, -2.653752, 0, 0, 0, 1, 1,
-0.7451087, -0.595395, -3.767881, 0, 0, 0, 1, 1,
-0.7438911, 0.8657664, -1.154477, 0, 0, 0, 1, 1,
-0.74354, 0.5868989, -0.7745582, 0, 0, 0, 1, 1,
-0.7418602, 0.2828256, -2.361297, 0, 0, 0, 1, 1,
-0.7415762, -0.4597321, -0.7159751, 1, 1, 1, 1, 1,
-0.7408875, 0.1370158, -2.603158, 1, 1, 1, 1, 1,
-0.7270704, 0.9149722, -0.1805369, 1, 1, 1, 1, 1,
-0.7182735, 0.08732641, -2.325967, 1, 1, 1, 1, 1,
-0.715662, 0.525933, -0.4392294, 1, 1, 1, 1, 1,
-0.7140049, 1.669606, 0.4682381, 1, 1, 1, 1, 1,
-0.7024781, -0.0597653, -1.263761, 1, 1, 1, 1, 1,
-0.6948053, 0.9637002, -0.4582784, 1, 1, 1, 1, 1,
-0.6925829, 0.05326062, -2.585267, 1, 1, 1, 1, 1,
-0.6881584, 0.3591791, -1.778732, 1, 1, 1, 1, 1,
-0.6880038, 1.952501, -1.227771, 1, 1, 1, 1, 1,
-0.6855655, -0.074434, -1.517173, 1, 1, 1, 1, 1,
-0.6835992, -1.630646, -1.392837, 1, 1, 1, 1, 1,
-0.6709225, -0.1235714, -1.259545, 1, 1, 1, 1, 1,
-0.6709105, -1.197144, -1.934069, 1, 1, 1, 1, 1,
-0.6622176, 0.2935929, -0.5842874, 0, 0, 1, 1, 1,
-0.6597595, 0.1525365, -0.491367, 1, 0, 0, 1, 1,
-0.6588424, 0.695106, -1.200641, 1, 0, 0, 1, 1,
-0.6566984, -0.2653232, -0.9813067, 1, 0, 0, 1, 1,
-0.6539578, 0.8070913, 0.2655912, 1, 0, 0, 1, 1,
-0.6514324, -0.1734027, -1.491958, 1, 0, 0, 1, 1,
-0.646639, 0.4411853, -1.453769, 0, 0, 0, 1, 1,
-0.6425406, -0.08334657, -3.398244, 0, 0, 0, 1, 1,
-0.641663, 0.02971206, -1.492588, 0, 0, 0, 1, 1,
-0.6400884, -0.1124161, -0.3886244, 0, 0, 0, 1, 1,
-0.6385453, 1.122872, -1.904503, 0, 0, 0, 1, 1,
-0.6356616, 0.1841623, -3.579944, 0, 0, 0, 1, 1,
-0.6354476, -0.08055758, -1.34098, 0, 0, 0, 1, 1,
-0.6330487, 0.6875188, -2.63571, 1, 1, 1, 1, 1,
-0.6326802, 1.231774, -1.768083, 1, 1, 1, 1, 1,
-0.6319666, -0.2828845, 1.492784, 1, 1, 1, 1, 1,
-0.627649, -1.504982, -3.405409, 1, 1, 1, 1, 1,
-0.6192887, 1.261768, -1.152516, 1, 1, 1, 1, 1,
-0.6176584, 1.462926, -1.560203, 1, 1, 1, 1, 1,
-0.6172339, -1.446254, -1.870941, 1, 1, 1, 1, 1,
-0.6156051, 2.018039, -0.7441678, 1, 1, 1, 1, 1,
-0.6065525, -0.8937652, -3.597305, 1, 1, 1, 1, 1,
-0.6049262, -0.6614661, -2.700238, 1, 1, 1, 1, 1,
-0.6035119, -1.058988, -2.018238, 1, 1, 1, 1, 1,
-0.5997571, 0.7067733, -0.1100262, 1, 1, 1, 1, 1,
-0.5975684, 0.3504461, -1.393949, 1, 1, 1, 1, 1,
-0.5973377, -0.7794827, -0.7935154, 1, 1, 1, 1, 1,
-0.5964974, -0.8180904, -0.7975114, 1, 1, 1, 1, 1,
-0.5887629, 1.259864, -0.7185087, 0, 0, 1, 1, 1,
-0.5863593, 1.187205, -0.5711255, 1, 0, 0, 1, 1,
-0.5862582, -0.229216, -3.817082, 1, 0, 0, 1, 1,
-0.5761192, 0.1862127, -1.926558, 1, 0, 0, 1, 1,
-0.5742961, -0.8837336, -3.553352, 1, 0, 0, 1, 1,
-0.5739698, 0.5471561, -0.6625049, 1, 0, 0, 1, 1,
-0.5658369, 0.3043213, -2.039673, 0, 0, 0, 1, 1,
-0.5630299, -1.060606, -2.854451, 0, 0, 0, 1, 1,
-0.5608898, -1.094158, -2.541962, 0, 0, 0, 1, 1,
-0.5608529, 0.3458867, -1.363668, 0, 0, 0, 1, 1,
-0.5571287, -1.045931, -0.4058363, 0, 0, 0, 1, 1,
-0.556681, 0.07571653, 0.4424362, 0, 0, 0, 1, 1,
-0.5544446, 0.1844941, -1.800472, 0, 0, 0, 1, 1,
-0.5505139, -0.2274243, -1.616223, 1, 1, 1, 1, 1,
-0.5494722, -0.5493162, -2.227722, 1, 1, 1, 1, 1,
-0.5482002, -0.2427345, -1.211569, 1, 1, 1, 1, 1,
-0.5446762, 0.1713196, -1.56942, 1, 1, 1, 1, 1,
-0.5425779, 0.8875764, -0.8834958, 1, 1, 1, 1, 1,
-0.536118, -0.4823166, -3.045285, 1, 1, 1, 1, 1,
-0.53523, 0.8133808, -1.006341, 1, 1, 1, 1, 1,
-0.5316418, 0.1588842, -1.577615, 1, 1, 1, 1, 1,
-0.5302951, 0.08799323, -0.52288, 1, 1, 1, 1, 1,
-0.5264536, 0.1266072, -0.3855988, 1, 1, 1, 1, 1,
-0.5253015, -0.4279691, -2.870634, 1, 1, 1, 1, 1,
-0.5238277, 0.005900198, -1.294054, 1, 1, 1, 1, 1,
-0.5183941, 0.1194475, -0.3037398, 1, 1, 1, 1, 1,
-0.5146756, 1.682115, 0.03995313, 1, 1, 1, 1, 1,
-0.5066976, 0.3971671, -0.7811601, 1, 1, 1, 1, 1,
-0.5010236, 0.2138239, 0.3212264, 0, 0, 1, 1, 1,
-0.4893106, -0.02444826, -1.050241, 1, 0, 0, 1, 1,
-0.487927, 1.207834, -0.3959647, 1, 0, 0, 1, 1,
-0.4872774, -0.1711346, -2.097585, 1, 0, 0, 1, 1,
-0.4835647, 0.384662, -0.1657691, 1, 0, 0, 1, 1,
-0.4794176, 0.01418266, -0.9050707, 1, 0, 0, 1, 1,
-0.4777411, 0.1773712, -1.674295, 0, 0, 0, 1, 1,
-0.4769275, 0.04914096, -2.865262, 0, 0, 0, 1, 1,
-0.4764268, -1.853401, -3.645782, 0, 0, 0, 1, 1,
-0.4571623, -1.570221, -0.3034774, 0, 0, 0, 1, 1,
-0.4497592, -0.2303738, -0.8183452, 0, 0, 0, 1, 1,
-0.4481431, -0.8954214, -1.031504, 0, 0, 0, 1, 1,
-0.4467556, 0.5837688, -0.8344768, 0, 0, 0, 1, 1,
-0.4397335, 1.384861, 1.014636, 1, 1, 1, 1, 1,
-0.4367616, 1.004622, 0.8297372, 1, 1, 1, 1, 1,
-0.4317241, -0.438713, -1.257051, 1, 1, 1, 1, 1,
-0.4218635, -0.1153864, -0.07106777, 1, 1, 1, 1, 1,
-0.4195425, -1.103509, -1.284432, 1, 1, 1, 1, 1,
-0.4119096, 0.1335359, -1.526975, 1, 1, 1, 1, 1,
-0.4100972, 0.8226456, -1.11861, 1, 1, 1, 1, 1,
-0.4077204, -0.653853, -2.268947, 1, 1, 1, 1, 1,
-0.4060247, 1.146582, -0.9576786, 1, 1, 1, 1, 1,
-0.4021515, 0.7216218, 1.055969, 1, 1, 1, 1, 1,
-0.4018008, -0.6793694, -3.018866, 1, 1, 1, 1, 1,
-0.3998366, -0.513697, -2.606884, 1, 1, 1, 1, 1,
-0.3994224, 0.8282074, -0.1023044, 1, 1, 1, 1, 1,
-0.3935959, -0.3992741, -3.811286, 1, 1, 1, 1, 1,
-0.3925748, -0.419576, -1.971877, 1, 1, 1, 1, 1,
-0.3886738, -0.2388022, -2.876633, 0, 0, 1, 1, 1,
-0.3810722, 1.388659, 0.3204779, 1, 0, 0, 1, 1,
-0.3667302, -0.6343291, -1.778103, 1, 0, 0, 1, 1,
-0.3663382, 1.324849, 0.5697052, 1, 0, 0, 1, 1,
-0.362061, -0.8330903, -4.105985, 1, 0, 0, 1, 1,
-0.3583073, 2.483575, 0.6101022, 1, 0, 0, 1, 1,
-0.3551151, -0.4308975, -0.1155855, 0, 0, 0, 1, 1,
-0.3537, -0.08894689, -2.555026, 0, 0, 0, 1, 1,
-0.3522407, 0.4311195, -1.357156, 0, 0, 0, 1, 1,
-0.3509844, 1.063236, -0.3666227, 0, 0, 0, 1, 1,
-0.349155, -0.6480554, -2.955433, 0, 0, 0, 1, 1,
-0.3449242, -0.1407399, -3.087349, 0, 0, 0, 1, 1,
-0.3398606, -1.603542, -2.834332, 0, 0, 0, 1, 1,
-0.3381941, -0.5289683, -1.907992, 1, 1, 1, 1, 1,
-0.3320161, -0.2523691, -4.153831, 1, 1, 1, 1, 1,
-0.3314129, 0.6656216, 0.2129804, 1, 1, 1, 1, 1,
-0.3298546, -1.36011, -1.688215, 1, 1, 1, 1, 1,
-0.3226383, -0.1585238, -1.731434, 1, 1, 1, 1, 1,
-0.3083962, -0.1258369, -1.921043, 1, 1, 1, 1, 1,
-0.3049738, -0.7302697, -3.732875, 1, 1, 1, 1, 1,
-0.301605, 0.4125218, -0.5062376, 1, 1, 1, 1, 1,
-0.297975, -0.2860597, -3.242479, 1, 1, 1, 1, 1,
-0.297251, 0.3283096, 1.661572, 1, 1, 1, 1, 1,
-0.2967337, -0.1815274, -3.008928, 1, 1, 1, 1, 1,
-0.2901955, -1.539729, -3.506718, 1, 1, 1, 1, 1,
-0.2901127, -1.109057, -3.031897, 1, 1, 1, 1, 1,
-0.2876732, 0.2896469, -1.14362, 1, 1, 1, 1, 1,
-0.2842633, 0.4541167, -1.047952, 1, 1, 1, 1, 1,
-0.2839726, -0.2261847, -2.429839, 0, 0, 1, 1, 1,
-0.2825672, -0.06864976, -0.423091, 1, 0, 0, 1, 1,
-0.2768839, 0.6044443, 0.6187638, 1, 0, 0, 1, 1,
-0.2746732, 0.3356046, -0.6926467, 1, 0, 0, 1, 1,
-0.2736193, 1.249133, 1.858705, 1, 0, 0, 1, 1,
-0.2705835, -0.8966967, -1.848311, 1, 0, 0, 1, 1,
-0.2703471, -1.104968, -2.073242, 0, 0, 0, 1, 1,
-0.2696507, 0.5349846, 0.817359, 0, 0, 0, 1, 1,
-0.2670625, -0.86962, -2.10919, 0, 0, 0, 1, 1,
-0.265756, 1.262561, 0.8956211, 0, 0, 0, 1, 1,
-0.2641397, 0.407134, 0.8576467, 0, 0, 0, 1, 1,
-0.2626475, 0.4151343, -0.3071185, 0, 0, 0, 1, 1,
-0.2625228, -1.873679, 0.2795422, 0, 0, 0, 1, 1,
-0.260314, 0.5256525, 0.1681866, 1, 1, 1, 1, 1,
-0.2585942, -1.775204, -2.361837, 1, 1, 1, 1, 1,
-0.256264, -1.755867, -2.881355, 1, 1, 1, 1, 1,
-0.2551247, -0.8633484, -3.080948, 1, 1, 1, 1, 1,
-0.2523807, -0.7611412, -3.714297, 1, 1, 1, 1, 1,
-0.2520494, -1.681965, -2.212676, 1, 1, 1, 1, 1,
-0.2507846, -0.08834145, -0.5681121, 1, 1, 1, 1, 1,
-0.2502448, 0.7854834, 0.6268409, 1, 1, 1, 1, 1,
-0.2494816, 0.8517676, 0.1287287, 1, 1, 1, 1, 1,
-0.2442465, -0.7528222, -1.20997, 1, 1, 1, 1, 1,
-0.2441604, -0.8490324, -3.746299, 1, 1, 1, 1, 1,
-0.2427042, 0.08343015, -2.620962, 1, 1, 1, 1, 1,
-0.2415297, 0.6480674, -0.5889413, 1, 1, 1, 1, 1,
-0.2392523, -0.5777472, -3.323597, 1, 1, 1, 1, 1,
-0.2334792, 1.367734, 1.064785, 1, 1, 1, 1, 1,
-0.2316387, 0.4488147, 0.205908, 0, 0, 1, 1, 1,
-0.2306454, 1.578295, 0.5336604, 1, 0, 0, 1, 1,
-0.2280565, 0.6946417, -0.3473325, 1, 0, 0, 1, 1,
-0.2197574, 0.4006883, 1.116073, 1, 0, 0, 1, 1,
-0.2087554, 0.6694492, -0.7481475, 1, 0, 0, 1, 1,
-0.2080383, -0.1123614, -3.38276, 1, 0, 0, 1, 1,
-0.2062854, 0.7724672, -0.471819, 0, 0, 0, 1, 1,
-0.2050785, -1.295144, -2.030544, 0, 0, 0, 1, 1,
-0.2007203, 1.012525, 1.052552, 0, 0, 0, 1, 1,
-0.1995218, -0.1988017, -2.9447, 0, 0, 0, 1, 1,
-0.198156, 0.2848632, -1.388927, 0, 0, 0, 1, 1,
-0.1947359, -0.2702499, -2.957578, 0, 0, 0, 1, 1,
-0.1813254, -0.1419648, -1.669281, 0, 0, 0, 1, 1,
-0.1789834, -0.2502659, -2.169654, 1, 1, 1, 1, 1,
-0.1736331, 0.9836701, -0.5598427, 1, 1, 1, 1, 1,
-0.1729986, -1.660126, -2.991165, 1, 1, 1, 1, 1,
-0.1618445, -0.1110816, -0.2123597, 1, 1, 1, 1, 1,
-0.1580536, -0.7804486, -4.331317, 1, 1, 1, 1, 1,
-0.1573385, -1.227405, -3.107563, 1, 1, 1, 1, 1,
-0.1566189, -0.9531311, -3.673656, 1, 1, 1, 1, 1,
-0.1561116, -0.8571823, -1.656612, 1, 1, 1, 1, 1,
-0.1509752, 0.9653258, 0.6274055, 1, 1, 1, 1, 1,
-0.1493869, 0.09213848, 0.1511706, 1, 1, 1, 1, 1,
-0.1477164, 1.511346, -1.152351, 1, 1, 1, 1, 1,
-0.146246, 0.4537916, 1.131784, 1, 1, 1, 1, 1,
-0.1442064, -0.7386312, -3.089837, 1, 1, 1, 1, 1,
-0.1430159, 1.207208, -1.287429, 1, 1, 1, 1, 1,
-0.1390778, 2.028255, 0.6484398, 1, 1, 1, 1, 1,
-0.1381758, 0.6114224, -0.8543985, 0, 0, 1, 1, 1,
-0.134686, 1.452817, 1.324519, 1, 0, 0, 1, 1,
-0.1337738, 1.421058, 1.233689, 1, 0, 0, 1, 1,
-0.1323656, -1.995743, -2.061486, 1, 0, 0, 1, 1,
-0.128632, 0.9302569, -1.070667, 1, 0, 0, 1, 1,
-0.1259033, -2.138444, -2.353137, 1, 0, 0, 1, 1,
-0.1217763, 1.658576, 0.2393978, 0, 0, 0, 1, 1,
-0.1216104, 0.914945, -1.528147, 0, 0, 0, 1, 1,
-0.1187832, -2.770009, -3.897123, 0, 0, 0, 1, 1,
-0.115019, -0.4724207, -2.028464, 0, 0, 0, 1, 1,
-0.1145569, 1.241333, 0.4501439, 0, 0, 0, 1, 1,
-0.1141757, -0.6677181, -0.6883112, 0, 0, 0, 1, 1,
-0.1128681, 0.152011, 2.241483, 0, 0, 0, 1, 1,
-0.1127604, 0.4468939, -0.5611566, 1, 1, 1, 1, 1,
-0.1110879, -0.5060158, -2.155571, 1, 1, 1, 1, 1,
-0.1078982, 1.21837, 0.210563, 1, 1, 1, 1, 1,
-0.1004966, 1.881293, 0.0849004, 1, 1, 1, 1, 1,
-0.09787478, -0.9187789, -3.855589, 1, 1, 1, 1, 1,
-0.09769172, 0.3127786, 0.966002, 1, 1, 1, 1, 1,
-0.09636419, 0.4440716, -1.609496, 1, 1, 1, 1, 1,
-0.09457745, 0.02886716, -2.933262, 1, 1, 1, 1, 1,
-0.09402397, 1.116644, -0.0003115689, 1, 1, 1, 1, 1,
-0.09323912, -1.607894, -2.015927, 1, 1, 1, 1, 1,
-0.09192136, 0.4458167, -1.8938, 1, 1, 1, 1, 1,
-0.08893507, -1.726005, -3.445287, 1, 1, 1, 1, 1,
-0.08676054, 0.1363804, -0.5984131, 1, 1, 1, 1, 1,
-0.0860814, 0.9473923, -0.4411047, 1, 1, 1, 1, 1,
-0.08489899, -0.5182208, -3.499269, 1, 1, 1, 1, 1,
-0.08449529, 0.08978368, -2.368213, 0, 0, 1, 1, 1,
-0.0832735, -0.3294688, -3.192312, 1, 0, 0, 1, 1,
-0.08315272, -0.01660756, -0.03037577, 1, 0, 0, 1, 1,
-0.08084535, 0.3452133, 0.2752846, 1, 0, 0, 1, 1,
-0.07735491, -0.59635, -2.509666, 1, 0, 0, 1, 1,
-0.0741278, -0.2609989, -3.495984, 1, 0, 0, 1, 1,
-0.0723534, 0.04857543, -0.01170614, 0, 0, 0, 1, 1,
-0.0714863, 2.304636, -0.1574566, 0, 0, 0, 1, 1,
-0.06846036, -0.1528754, -2.659656, 0, 0, 0, 1, 1,
-0.06212603, 0.2533279, -0.4103409, 0, 0, 0, 1, 1,
-0.06108038, -1.165704, -4.782954, 0, 0, 0, 1, 1,
-0.05831186, 0.6426048, 0.6402713, 0, 0, 0, 1, 1,
-0.05352861, 1.286846, 1.1889, 0, 0, 0, 1, 1,
-0.05058312, -0.626781, -1.965636, 1, 1, 1, 1, 1,
-0.05037973, -0.1427969, -2.943556, 1, 1, 1, 1, 1,
-0.04505332, 0.05418492, -1.941583, 1, 1, 1, 1, 1,
-0.0385808, -1.052658, -3.694869, 1, 1, 1, 1, 1,
-0.03805076, 1.166153, 1.920977, 1, 1, 1, 1, 1,
-0.0352192, -0.8928803, -3.053829, 1, 1, 1, 1, 1,
-0.03207749, 0.6609023, 1.410945, 1, 1, 1, 1, 1,
-0.01894928, 0.3126254, 2.072111, 1, 1, 1, 1, 1,
-0.01813393, 0.5745104, 0.4856074, 1, 1, 1, 1, 1,
-0.0165593, -1.332635, -2.209965, 1, 1, 1, 1, 1,
-0.01584364, -0.5224304, -2.988972, 1, 1, 1, 1, 1,
-0.01420079, 0.4093191, 0.1476689, 1, 1, 1, 1, 1,
-0.01046758, 1.260928, 0.3129913, 1, 1, 1, 1, 1,
-0.009343661, 0.5802325, -0.9177305, 1, 1, 1, 1, 1,
-0.005219862, 1.393858, -0.8890017, 1, 1, 1, 1, 1,
-0.004128525, -0.03863197, -1.656966, 0, 0, 1, 1, 1,
-0.003900675, 0.2890516, 0.7770396, 1, 0, 0, 1, 1,
-0.002522526, -0.4940458, -2.061417, 1, 0, 0, 1, 1,
-0.002323413, -0.0559121, -3.229492, 1, 0, 0, 1, 1,
-0.0009008526, -1.058717, -2.400299, 1, 0, 0, 1, 1,
-0.0006443212, -1.288232, -3.124621, 1, 0, 0, 1, 1,
0.004364915, 0.4516986, -0.9910661, 0, 0, 0, 1, 1,
0.00944394, 1.000248, 0.153002, 0, 0, 0, 1, 1,
0.0121248, 0.854427, 0.4664325, 0, 0, 0, 1, 1,
0.01589357, -1.107186, 4.09729, 0, 0, 0, 1, 1,
0.0185322, -0.6467524, 3.450975, 0, 0, 0, 1, 1,
0.0205876, 0.5041249, 1.372263, 0, 0, 0, 1, 1,
0.02073981, -0.3098159, 5.598556, 0, 0, 0, 1, 1,
0.02482336, 2.142392, 1.372099, 1, 1, 1, 1, 1,
0.02528249, 1.179319, -0.7032762, 1, 1, 1, 1, 1,
0.03075345, -0.6613243, 1.771441, 1, 1, 1, 1, 1,
0.03251779, 0.9596643, -2.374138, 1, 1, 1, 1, 1,
0.03870451, -0.1640889, 2.785529, 1, 1, 1, 1, 1,
0.03957998, -1.601936, 4.352973, 1, 1, 1, 1, 1,
0.04016265, 1.274256, -0.9589758, 1, 1, 1, 1, 1,
0.04141027, 0.1796996, 0.4631357, 1, 1, 1, 1, 1,
0.04334693, -0.2275197, 2.26073, 1, 1, 1, 1, 1,
0.04402003, -1.363082, 1.929605, 1, 1, 1, 1, 1,
0.0448375, 0.4422627, -0.3726284, 1, 1, 1, 1, 1,
0.04610498, 0.1627221, 0.3180956, 1, 1, 1, 1, 1,
0.0469624, -1.358248, 1.867136, 1, 1, 1, 1, 1,
0.04910135, -0.007218787, -1.071524, 1, 1, 1, 1, 1,
0.04929046, 0.8435386, 0.07291181, 1, 1, 1, 1, 1,
0.05035087, -0.3662316, 4.424064, 0, 0, 1, 1, 1,
0.05084309, 2.100951, 0.3327559, 1, 0, 0, 1, 1,
0.05313852, -0.6150829, 2.532024, 1, 0, 0, 1, 1,
0.05452323, 0.04591839, 1.014344, 1, 0, 0, 1, 1,
0.05567703, -1.05538, 0.3310559, 1, 0, 0, 1, 1,
0.05822363, -0.001340572, 2.092669, 1, 0, 0, 1, 1,
0.06006059, -0.6127051, 2.2411, 0, 0, 0, 1, 1,
0.0622853, 0.6605354, 0.8689634, 0, 0, 0, 1, 1,
0.0625409, -0.5307824, 2.085, 0, 0, 0, 1, 1,
0.0626315, 0.2514872, 0.1151396, 0, 0, 0, 1, 1,
0.06599661, 0.9219055, 0.5659338, 0, 0, 0, 1, 1,
0.06966657, -1.041727, 4.070424, 0, 0, 0, 1, 1,
0.07215863, 0.1037191, 1.822403, 0, 0, 0, 1, 1,
0.07241282, -1.7213, 1.746691, 1, 1, 1, 1, 1,
0.07376917, -1.574206, 3.209044, 1, 1, 1, 1, 1,
0.07421942, 0.9186295, 0.3869095, 1, 1, 1, 1, 1,
0.07590462, -1.560417, 4.271697, 1, 1, 1, 1, 1,
0.07698459, -0.07902612, 3.665152, 1, 1, 1, 1, 1,
0.08151568, -1.994959, 1.863521, 1, 1, 1, 1, 1,
0.08233036, 0.7062237, -1.331713, 1, 1, 1, 1, 1,
0.08267175, -1.692528, 4.087449, 1, 1, 1, 1, 1,
0.08610033, 0.6761703, -2.160895, 1, 1, 1, 1, 1,
0.09255435, -0.770771, 1.337057, 1, 1, 1, 1, 1,
0.09264553, 1.106336, -0.5420178, 1, 1, 1, 1, 1,
0.1003574, 1.202596, 0.123421, 1, 1, 1, 1, 1,
0.1010686, 0.3793487, -0.6290852, 1, 1, 1, 1, 1,
0.1034717, 0.2452686, -1.482844, 1, 1, 1, 1, 1,
0.1040604, -0.9460653, 3.21111, 1, 1, 1, 1, 1,
0.1042265, -0.8987447, 4.159923, 0, 0, 1, 1, 1,
0.1081477, 0.3960203, 0.8174316, 1, 0, 0, 1, 1,
0.1129827, -0.5711735, 1.674411, 1, 0, 0, 1, 1,
0.1160437, -2.075403, 5.522758, 1, 0, 0, 1, 1,
0.1239371, -0.8260911, 0.6537616, 1, 0, 0, 1, 1,
0.124246, 0.6496826, -0.2043541, 1, 0, 0, 1, 1,
0.1261373, -0.3870704, 4.418386, 0, 0, 0, 1, 1,
0.1262657, 1.141825, -0.7540506, 0, 0, 0, 1, 1,
0.131265, 0.9096982, 0.6900187, 0, 0, 0, 1, 1,
0.1319809, -1.231246, 2.499916, 0, 0, 0, 1, 1,
0.1390695, -1.517709, 2.046633, 0, 0, 0, 1, 1,
0.1406949, -1.251303, 3.67385, 0, 0, 0, 1, 1,
0.1421674, 0.6326426, 0.3881982, 0, 0, 0, 1, 1,
0.1442279, -1.096286, 1.915857, 1, 1, 1, 1, 1,
0.14709, -1.243737, 3.125906, 1, 1, 1, 1, 1,
0.1583543, 0.0253055, 0.4537435, 1, 1, 1, 1, 1,
0.1586456, -0.3390698, 2.948986, 1, 1, 1, 1, 1,
0.1605588, -1.350596, 1.410482, 1, 1, 1, 1, 1,
0.1711883, 0.8768694, 0.9933418, 1, 1, 1, 1, 1,
0.1720716, -0.2398562, 2.765669, 1, 1, 1, 1, 1,
0.1728291, 1.215084, -0.2635357, 1, 1, 1, 1, 1,
0.1753178, -0.302828, 2.659749, 1, 1, 1, 1, 1,
0.1801275, -1.513674, 2.534835, 1, 1, 1, 1, 1,
0.184511, 1.167732, 0.1416547, 1, 1, 1, 1, 1,
0.1846712, -0.8376623, 1.418408, 1, 1, 1, 1, 1,
0.1869153, 1.216522, 0.2242093, 1, 1, 1, 1, 1,
0.1969942, 0.8614542, -1.119429, 1, 1, 1, 1, 1,
0.1981027, -0.2059775, 3.770431, 1, 1, 1, 1, 1,
0.1996636, -1.37791, 4.134007, 0, 0, 1, 1, 1,
0.1997711, -1.595116, 2.622218, 1, 0, 0, 1, 1,
0.2016817, -2.471949, 2.499205, 1, 0, 0, 1, 1,
0.2078252, -0.362559, 1.815473, 1, 0, 0, 1, 1,
0.2154845, -0.7988503, 3.110025, 1, 0, 0, 1, 1,
0.2211477, 0.9127811, -0.8628724, 1, 0, 0, 1, 1,
0.2225177, 0.2395617, 2.379789, 0, 0, 0, 1, 1,
0.2257897, 0.8793445, -0.2467492, 0, 0, 0, 1, 1,
0.2258408, 1.760101, -0.7700467, 0, 0, 0, 1, 1,
0.2259432, -2.780191, 4.116314, 0, 0, 0, 1, 1,
0.2273974, 0.5070727, -0.1686519, 0, 0, 0, 1, 1,
0.2278057, -0.03487987, 1.082557, 0, 0, 0, 1, 1,
0.2384043, -1.260302, 3.679634, 0, 0, 0, 1, 1,
0.2394406, 0.8393921, -0.1149458, 1, 1, 1, 1, 1,
0.2403139, -1.518382, 3.168882, 1, 1, 1, 1, 1,
0.2419975, 0.8167897, 1.222775, 1, 1, 1, 1, 1,
0.2425557, 0.1006045, 1.126244, 1, 1, 1, 1, 1,
0.246149, -0.7975351, 1.464147, 1, 1, 1, 1, 1,
0.2519387, -2.274774, 4.90924, 1, 1, 1, 1, 1,
0.2549498, -1.176183, 3.055569, 1, 1, 1, 1, 1,
0.2599341, 1.401802, -1.044819, 1, 1, 1, 1, 1,
0.2610129, -0.3261306, 2.232549, 1, 1, 1, 1, 1,
0.2631283, 0.5332422, 0.8849884, 1, 1, 1, 1, 1,
0.2635887, -0.432165, 2.476047, 1, 1, 1, 1, 1,
0.2641766, 0.4466898, 0.4263986, 1, 1, 1, 1, 1,
0.2648574, 0.5670737, -0.153163, 1, 1, 1, 1, 1,
0.2680451, -0.2475789, 2.779761, 1, 1, 1, 1, 1,
0.270795, -0.4157114, 4.103725, 1, 1, 1, 1, 1,
0.2727629, -0.3723886, 2.558092, 0, 0, 1, 1, 1,
0.2764292, 1.680615, 0.3986704, 1, 0, 0, 1, 1,
0.2769944, 0.1746257, 1.875612, 1, 0, 0, 1, 1,
0.2789298, -1.727317, 3.624089, 1, 0, 0, 1, 1,
0.2835614, 1.557268, -0.8666834, 1, 0, 0, 1, 1,
0.2843364, 0.3661535, 2.263907, 1, 0, 0, 1, 1,
0.2853985, 0.1170247, 1.865493, 0, 0, 0, 1, 1,
0.2861645, 0.5507829, 2.189171, 0, 0, 0, 1, 1,
0.2889015, -0.04049779, 2.138499, 0, 0, 0, 1, 1,
0.2968461, 1.303644, 1.307151, 0, 0, 0, 1, 1,
0.3032348, 0.941943, -1.549208, 0, 0, 0, 1, 1,
0.3048982, -0.9228052, 2.289186, 0, 0, 0, 1, 1,
0.3049662, 0.4376985, -0.615923, 0, 0, 0, 1, 1,
0.304977, -1.601501, 3.323874, 1, 1, 1, 1, 1,
0.3060496, 0.4036017, 0.3701106, 1, 1, 1, 1, 1,
0.3150947, -0.8557898, 3.100591, 1, 1, 1, 1, 1,
0.3188902, 0.007918949, 1.756378, 1, 1, 1, 1, 1,
0.319741, 0.4263694, 1.824455, 1, 1, 1, 1, 1,
0.3201903, -0.4574102, 1.930268, 1, 1, 1, 1, 1,
0.3279094, -0.6873335, 2.644017, 1, 1, 1, 1, 1,
0.3311725, 1.698477, -1.497221, 1, 1, 1, 1, 1,
0.3363396, 0.9737803, -0.6893731, 1, 1, 1, 1, 1,
0.3421088, 0.8888727, -0.5244959, 1, 1, 1, 1, 1,
0.3423987, -0.5132038, 3.45622, 1, 1, 1, 1, 1,
0.3430727, 1.52061, 0.01529819, 1, 1, 1, 1, 1,
0.3464229, 1.710599, -1.826718, 1, 1, 1, 1, 1,
0.3484446, 1.103433, 1.252119, 1, 1, 1, 1, 1,
0.357168, 0.2923498, -0.4122326, 1, 1, 1, 1, 1,
0.3587391, 1.318727, -0.9778259, 0, 0, 1, 1, 1,
0.3603508, -0.3138229, 2.145666, 1, 0, 0, 1, 1,
0.3606074, 0.7955598, 1.128484, 1, 0, 0, 1, 1,
0.3644745, 0.5341781, 1.431122, 1, 0, 0, 1, 1,
0.3650099, -1.100052, 3.09159, 1, 0, 0, 1, 1,
0.3655989, -1.194312, 2.245548, 1, 0, 0, 1, 1,
0.3667313, -0.2854192, 1.771014, 0, 0, 0, 1, 1,
0.3682003, 1.385801, -1.580785, 0, 0, 0, 1, 1,
0.3701949, 1.349224, 0.8066961, 0, 0, 0, 1, 1,
0.3752185, 0.9724048, 1.420924, 0, 0, 0, 1, 1,
0.3772376, -0.3385569, 2.784869, 0, 0, 0, 1, 1,
0.380366, 0.05144317, 1.230137, 0, 0, 0, 1, 1,
0.3848708, 1.025095, 2.137271, 0, 0, 0, 1, 1,
0.3855832, -0.3494734, 0.9901224, 1, 1, 1, 1, 1,
0.3901853, -1.29845, 2.373905, 1, 1, 1, 1, 1,
0.3902768, 1.586405, -0.1078258, 1, 1, 1, 1, 1,
0.3927944, -1.035428, 4.297051, 1, 1, 1, 1, 1,
0.406361, -1.568369, 3.040439, 1, 1, 1, 1, 1,
0.4084023, 0.1689215, 0.09349379, 1, 1, 1, 1, 1,
0.4088593, -0.1041899, 2.663589, 1, 1, 1, 1, 1,
0.4106981, -0.2987792, 3.188416, 1, 1, 1, 1, 1,
0.4124363, 0.8895264, 0.8952082, 1, 1, 1, 1, 1,
0.4227789, -0.00331236, 1.204802, 1, 1, 1, 1, 1,
0.4282759, -1.109803, 3.148592, 1, 1, 1, 1, 1,
0.4288859, -0.04707753, 1.729202, 1, 1, 1, 1, 1,
0.4302134, 1.689699, 0.8098377, 1, 1, 1, 1, 1,
0.4346004, 0.7267987, 0.1757363, 1, 1, 1, 1, 1,
0.4355077, 1.182424, 0.5968555, 1, 1, 1, 1, 1,
0.436703, -0.2057328, 3.464102, 0, 0, 1, 1, 1,
0.437866, 0.1771468, 0.08027541, 1, 0, 0, 1, 1,
0.438426, 1.896192, 0.5112071, 1, 0, 0, 1, 1,
0.4399897, -0.09203991, 2.91836, 1, 0, 0, 1, 1,
0.4418474, -0.5678182, 1.57102, 1, 0, 0, 1, 1,
0.4439724, -0.7851157, 3.827516, 1, 0, 0, 1, 1,
0.4443059, 1.257779, 1.812528, 0, 0, 0, 1, 1,
0.4457178, 2.121939, 0.3037238, 0, 0, 0, 1, 1,
0.44672, 0.6182501, -0.07467405, 0, 0, 0, 1, 1,
0.4479334, -0.1897543, 3.086178, 0, 0, 0, 1, 1,
0.4492711, 0.367582, -0.3750131, 0, 0, 0, 1, 1,
0.4499028, 0.5731988, 0.9321941, 0, 0, 0, 1, 1,
0.4503947, 0.8051608, 1.578426, 0, 0, 0, 1, 1,
0.4524187, -0.9725257, 2.00666, 1, 1, 1, 1, 1,
0.4528906, -0.7536634, 4.252507, 1, 1, 1, 1, 1,
0.4530466, -1.076368, 3.047444, 1, 1, 1, 1, 1,
0.4530873, 0.807794, -0.0432855, 1, 1, 1, 1, 1,
0.4541514, 0.2041892, 0.9692351, 1, 1, 1, 1, 1,
0.4573178, 1.450081, 1.231225, 1, 1, 1, 1, 1,
0.4591999, 0.2440533, -0.5410415, 1, 1, 1, 1, 1,
0.4639032, -0.6865761, 3.283998, 1, 1, 1, 1, 1,
0.4642296, -1.163053, 2.596588, 1, 1, 1, 1, 1,
0.46866, 1.242879, 1.220934, 1, 1, 1, 1, 1,
0.4710503, -0.4184793, 1.608484, 1, 1, 1, 1, 1,
0.4735876, -1.448665, 1.465801, 1, 1, 1, 1, 1,
0.4736063, 2.026845, -0.8446608, 1, 1, 1, 1, 1,
0.4750183, 1.506255, 0.3849238, 1, 1, 1, 1, 1,
0.4768732, -0.8006485, 3.156682, 1, 1, 1, 1, 1,
0.4842177, 0.09756251, 0.7788014, 0, 0, 1, 1, 1,
0.4848531, -1.332324, 2.739458, 1, 0, 0, 1, 1,
0.4895036, 0.7816029, -0.4833473, 1, 0, 0, 1, 1,
0.4921617, 0.77544, 0.7477509, 1, 0, 0, 1, 1,
0.4968328, 0.7966989, 3.059748, 1, 0, 0, 1, 1,
0.4979141, 1.789462, -1.30447, 1, 0, 0, 1, 1,
0.5001567, 0.166149, 1.087711, 0, 0, 0, 1, 1,
0.5027413, 1.041529, -0.6203888, 0, 0, 0, 1, 1,
0.5054935, -0.9699378, 1.107614, 0, 0, 0, 1, 1,
0.505646, 1.153902, -1.107636, 0, 0, 0, 1, 1,
0.5087317, 0.6268771, 0.8501192, 0, 0, 0, 1, 1,
0.5099131, 2.74064, -0.526436, 0, 0, 0, 1, 1,
0.5112951, -1.433363, 2.829106, 0, 0, 0, 1, 1,
0.5134982, -0.7079073, 2.65614, 1, 1, 1, 1, 1,
0.5210696, 1.306936, 0.3365039, 1, 1, 1, 1, 1,
0.5269026, -0.154503, 1.687038, 1, 1, 1, 1, 1,
0.5286669, 0.3227635, 1.817452, 1, 1, 1, 1, 1,
0.5339605, 0.5540134, 0.8197761, 1, 1, 1, 1, 1,
0.5365406, -0.8458906, 1.423353, 1, 1, 1, 1, 1,
0.5390623, -1.986773, 0.7697788, 1, 1, 1, 1, 1,
0.5392177, 1.428814, -0.2512062, 1, 1, 1, 1, 1,
0.5420873, -0.006094339, 1.204327, 1, 1, 1, 1, 1,
0.5440443, 0.07646986, 0.8252507, 1, 1, 1, 1, 1,
0.5480133, -0.2744917, -0.182951, 1, 1, 1, 1, 1,
0.5525979, 0.2173018, 1.465868, 1, 1, 1, 1, 1,
0.5560533, 1.854399, -0.6596105, 1, 1, 1, 1, 1,
0.5620629, -1.138656, 3.007543, 1, 1, 1, 1, 1,
0.5639574, 0.5794941, 1.312955, 1, 1, 1, 1, 1,
0.5652098, 2.160133, -0.211288, 0, 0, 1, 1, 1,
0.5660644, -0.293803, 1.750864, 1, 0, 0, 1, 1,
0.5667819, -1.013751, 1.734981, 1, 0, 0, 1, 1,
0.5668782, -1.295298, 3.228766, 1, 0, 0, 1, 1,
0.5682356, -0.2263789, 2.169667, 1, 0, 0, 1, 1,
0.5688106, 0.2007844, 1.502003, 1, 0, 0, 1, 1,
0.5706273, 0.7808457, 1.040131, 0, 0, 0, 1, 1,
0.5733067, 0.8330783, 0.3360602, 0, 0, 0, 1, 1,
0.5737321, -0.7415346, 2.308803, 0, 0, 0, 1, 1,
0.57377, 0.01927598, 0.2667986, 0, 0, 0, 1, 1,
0.5757029, -0.2057044, 2.117071, 0, 0, 0, 1, 1,
0.5821988, 0.3465026, 0.3140262, 0, 0, 0, 1, 1,
0.5838922, -0.5487368, 2.980076, 0, 0, 0, 1, 1,
0.5839846, 0.3397403, -0.1549919, 1, 1, 1, 1, 1,
0.5897545, -0.8750958, 0.8027961, 1, 1, 1, 1, 1,
0.591428, -0.2176208, 2.36137, 1, 1, 1, 1, 1,
0.5924745, 0.9857655, 0.962283, 1, 1, 1, 1, 1,
0.5984621, 0.08150679, 0.8905944, 1, 1, 1, 1, 1,
0.6052697, -0.5375727, 2.708518, 1, 1, 1, 1, 1,
0.6057317, -0.3527044, 1.254691, 1, 1, 1, 1, 1,
0.609092, 0.5776251, 1.027294, 1, 1, 1, 1, 1,
0.6162923, -0.7184647, 2.489464, 1, 1, 1, 1, 1,
0.6179613, 0.2645233, 1.517442, 1, 1, 1, 1, 1,
0.6184797, 1.7884, 0.7585592, 1, 1, 1, 1, 1,
0.6260989, -0.1173092, 1.392728, 1, 1, 1, 1, 1,
0.6266758, -0.4482273, 2.560214, 1, 1, 1, 1, 1,
0.6273242, -0.04121556, 1.465207, 1, 1, 1, 1, 1,
0.6358279, 2.100109, 0.1324593, 1, 1, 1, 1, 1,
0.6370535, -1.227656, 2.401531, 0, 0, 1, 1, 1,
0.6382113, -0.594031, 2.571535, 1, 0, 0, 1, 1,
0.6407067, -0.139341, -0.6331148, 1, 0, 0, 1, 1,
0.6423003, -1.015423, 2.384347, 1, 0, 0, 1, 1,
0.6448101, -0.3512364, 1.120224, 1, 0, 0, 1, 1,
0.6457519, 0.443401, 0.7730587, 1, 0, 0, 1, 1,
0.6470726, -0.01901069, 2.163678, 0, 0, 0, 1, 1,
0.6475132, 0.8412718, 2.310508, 0, 0, 0, 1, 1,
0.6483563, -1.922772, 1.447439, 0, 0, 0, 1, 1,
0.650667, 0.03698275, 2.631141, 0, 0, 0, 1, 1,
0.65531, 0.3777073, 2.838895, 0, 0, 0, 1, 1,
0.6562214, 1.176713, 1.347236, 0, 0, 0, 1, 1,
0.6566838, -0.6611986, 2.01078, 0, 0, 0, 1, 1,
0.6657755, -1.050158, 3.309031, 1, 1, 1, 1, 1,
0.6663556, 1.864422, -0.6146328, 1, 1, 1, 1, 1,
0.6689979, -0.7412316, 2.308601, 1, 1, 1, 1, 1,
0.6693273, -0.5649107, 2.49043, 1, 1, 1, 1, 1,
0.6701988, 1.554367, -0.1828006, 1, 1, 1, 1, 1,
0.6732703, -1.344921, 2.345422, 1, 1, 1, 1, 1,
0.679253, 0.8837186, -0.2155207, 1, 1, 1, 1, 1,
0.6812537, 2.071175, -0.05949052, 1, 1, 1, 1, 1,
0.6830298, 1.17601, 0.955246, 1, 1, 1, 1, 1,
0.686402, -0.2540609, 2.476347, 1, 1, 1, 1, 1,
0.6932722, 0.4880399, 1.127618, 1, 1, 1, 1, 1,
0.6953542, 0.09062933, 1.472024, 1, 1, 1, 1, 1,
0.6990349, 0.8294472, 0.5470751, 1, 1, 1, 1, 1,
0.7017385, -0.219423, 3.952772, 1, 1, 1, 1, 1,
0.7038274, -0.9478834, 3.45001, 1, 1, 1, 1, 1,
0.7050256, 1.371586, 1.658411, 0, 0, 1, 1, 1,
0.7052789, -0.6042485, 1.753988, 1, 0, 0, 1, 1,
0.712097, 0.2834656, 0.3902185, 1, 0, 0, 1, 1,
0.7187594, -0.4077769, 0.6852489, 1, 0, 0, 1, 1,
0.7200518, 0.2583919, 1.164651, 1, 0, 0, 1, 1,
0.7218862, 0.7254789, 2.212255, 1, 0, 0, 1, 1,
0.7282111, -0.6336507, 1.408129, 0, 0, 0, 1, 1,
0.7316741, -0.4848055, 3.613353, 0, 0, 0, 1, 1,
0.7348739, 1.068363, 1.208396, 0, 0, 0, 1, 1,
0.735594, 0.1277845, 2.222255, 0, 0, 0, 1, 1,
0.7405165, -0.3860759, 1.690674, 0, 0, 0, 1, 1,
0.742244, -1.562541, 1.920157, 0, 0, 0, 1, 1,
0.7473669, 0.1300147, 2.766632, 0, 0, 0, 1, 1,
0.7476338, -0.2624264, 0.6941268, 1, 1, 1, 1, 1,
0.7500019, 0.006963642, 1.611709, 1, 1, 1, 1, 1,
0.7500048, -1.310231, 2.522852, 1, 1, 1, 1, 1,
0.7525069, 0.9966578, 1.683531, 1, 1, 1, 1, 1,
0.7548976, 0.4835555, 0.4653479, 1, 1, 1, 1, 1,
0.758006, -0.9713159, 2.399336, 1, 1, 1, 1, 1,
0.7636331, -0.3162447, 1.570704, 1, 1, 1, 1, 1,
0.7698859, 0.2172749, 1.68686, 1, 1, 1, 1, 1,
0.7701458, 0.6379808, 0.9830416, 1, 1, 1, 1, 1,
0.770946, -0.07651861, 2.206402, 1, 1, 1, 1, 1,
0.7730454, -0.4541841, 1.676878, 1, 1, 1, 1, 1,
0.7784179, 1.653488, 1.86278, 1, 1, 1, 1, 1,
0.7796447, -0.380306, 0.7116994, 1, 1, 1, 1, 1,
0.7885683, -0.70064, 2.678854, 1, 1, 1, 1, 1,
0.7887976, 0.8502761, 0.7742691, 1, 1, 1, 1, 1,
0.792011, 1.119213, 2.265224, 0, 0, 1, 1, 1,
0.7997215, 0.8677032, 0.7833584, 1, 0, 0, 1, 1,
0.8052719, 0.05232558, 1.412371, 1, 0, 0, 1, 1,
0.8165143, 1.087583, 0.06953099, 1, 0, 0, 1, 1,
0.8225413, 0.3192014, 2.005609, 1, 0, 0, 1, 1,
0.8241498, -1.676506, 2.84755, 1, 0, 0, 1, 1,
0.8257047, -0.1673241, 3.681417, 0, 0, 0, 1, 1,
0.8328297, 1.294091, 0.7026986, 0, 0, 0, 1, 1,
0.8475061, -0.3056987, 1.658648, 0, 0, 0, 1, 1,
0.849104, -0.3799008, 0.3363184, 0, 0, 0, 1, 1,
0.8509701, 1.080277, 0.646535, 0, 0, 0, 1, 1,
0.8521997, -0.6772896, 2.920964, 0, 0, 0, 1, 1,
0.8536927, 0.7087951, 2.119051, 0, 0, 0, 1, 1,
0.8557808, 0.01809307, 1.542297, 1, 1, 1, 1, 1,
0.8588212, 1.969419, 1.026012, 1, 1, 1, 1, 1,
0.8620006, -1.648411, 4.776625, 1, 1, 1, 1, 1,
0.8689377, -0.8912125, 2.532132, 1, 1, 1, 1, 1,
0.8700012, 0.270652, 1.327376, 1, 1, 1, 1, 1,
0.8707216, 1.009531, 2.608714, 1, 1, 1, 1, 1,
0.8763509, -0.003625351, 2.357166, 1, 1, 1, 1, 1,
0.8798263, 0.902478, -0.6243448, 1, 1, 1, 1, 1,
0.8826288, 1.355632, 0.9011474, 1, 1, 1, 1, 1,
0.884374, -1.873933, 1.236595, 1, 1, 1, 1, 1,
0.8847659, -0.1676426, 1.644673, 1, 1, 1, 1, 1,
0.8871885, 0.4035524, 3.121916, 1, 1, 1, 1, 1,
0.8872358, 0.6001154, -0.896558, 1, 1, 1, 1, 1,
0.8900077, -1.712368, 2.083099, 1, 1, 1, 1, 1,
0.8976288, 1.368363, -0.372949, 1, 1, 1, 1, 1,
0.898154, -0.06382128, 3.426878, 0, 0, 1, 1, 1,
0.900158, -0.2868993, 0.8675973, 1, 0, 0, 1, 1,
0.900639, 0.8451963, 1.475217, 1, 0, 0, 1, 1,
0.9008243, -0.2469088, 1.52109, 1, 0, 0, 1, 1,
0.9226453, 0.3168425, 1.403984, 1, 0, 0, 1, 1,
0.9240422, -1.63635, 1.775733, 1, 0, 0, 1, 1,
0.9285831, 0.8223172, -0.1181927, 0, 0, 0, 1, 1,
0.9303188, 1.209593, 2.452022, 0, 0, 0, 1, 1,
0.9333757, 1.092516, -0.82365, 0, 0, 0, 1, 1,
0.937003, 0.79509, 1.852669, 0, 0, 0, 1, 1,
0.9392302, 1.368999, 1.055612, 0, 0, 0, 1, 1,
0.9421968, 0.1872779, 1.995268, 0, 0, 0, 1, 1,
0.942574, 0.1748735, -1.278377, 0, 0, 0, 1, 1,
0.9426342, -0.4420601, 0.7439963, 1, 1, 1, 1, 1,
0.9435089, -1.019796, 1.434146, 1, 1, 1, 1, 1,
0.949868, 1.48825, 2.039008, 1, 1, 1, 1, 1,
0.9505951, 0.4016786, 2.170664, 1, 1, 1, 1, 1,
0.9510525, 0.7719698, 0.642652, 1, 1, 1, 1, 1,
0.9548205, 0.164808, 0.2754532, 1, 1, 1, 1, 1,
0.9555298, 1.248617, 0.4387284, 1, 1, 1, 1, 1,
0.9564692, 2.720111, -0.4926122, 1, 1, 1, 1, 1,
0.9570345, 0.09909014, 0.3684857, 1, 1, 1, 1, 1,
0.9593225, -1.220666, 0.7903687, 1, 1, 1, 1, 1,
0.9642955, -0.1562447, 2.870403, 1, 1, 1, 1, 1,
0.9792268, -0.7393236, 1.030283, 1, 1, 1, 1, 1,
0.9887181, -0.2986175, 1.859752, 1, 1, 1, 1, 1,
1.008695, -0.2424091, 1.578618, 1, 1, 1, 1, 1,
1.009215, -0.2975218, 2.004587, 1, 1, 1, 1, 1,
1.011506, 0.7726663, 0.3187545, 0, 0, 1, 1, 1,
1.01822, 0.388356, 3.223938, 1, 0, 0, 1, 1,
1.018899, -0.729292, 2.208407, 1, 0, 0, 1, 1,
1.019817, 0.4427766, 0.7496663, 1, 0, 0, 1, 1,
1.019954, -0.2933019, 0.5994264, 1, 0, 0, 1, 1,
1.02256, -0.322949, 2.978114, 1, 0, 0, 1, 1,
1.023696, -0.544609, 2.182055, 0, 0, 0, 1, 1,
1.025573, -0.4767751, 2.685481, 0, 0, 0, 1, 1,
1.02973, -0.6347618, 3.33208, 0, 0, 0, 1, 1,
1.030764, 1.324964, 1.032119, 0, 0, 0, 1, 1,
1.034532, -1.43765, 1.537166, 0, 0, 0, 1, 1,
1.034837, -0.1322034, 0.1470244, 0, 0, 0, 1, 1,
1.035296, -0.06796481, 2.118204, 0, 0, 0, 1, 1,
1.037872, -0.7702872, 4.546791, 1, 1, 1, 1, 1,
1.040439, -0.01884105, 2.772082, 1, 1, 1, 1, 1,
1.041557, -1.197755, 3.873143, 1, 1, 1, 1, 1,
1.045236, 0.3530046, 2.267397, 1, 1, 1, 1, 1,
1.046601, 0.1409977, 0.923031, 1, 1, 1, 1, 1,
1.050215, -0.3395652, -0.2530701, 1, 1, 1, 1, 1,
1.052032, 0.40808, -0.4971257, 1, 1, 1, 1, 1,
1.054142, 1.89662, 0.7836435, 1, 1, 1, 1, 1,
1.056952, -1.394188, 3.372843, 1, 1, 1, 1, 1,
1.061472, 0.7504689, -0.07069133, 1, 1, 1, 1, 1,
1.069108, 0.2940752, 2.270191, 1, 1, 1, 1, 1,
1.07353, -1.645217, 2.457418, 1, 1, 1, 1, 1,
1.081119, 2.703754, 0.6199685, 1, 1, 1, 1, 1,
1.092729, -1.043849, 0.6145751, 1, 1, 1, 1, 1,
1.099591, 0.02015546, -0.322323, 1, 1, 1, 1, 1,
1.100405, -0.7052419, 2.090673, 0, 0, 1, 1, 1,
1.103847, 2.024784, 1.782729, 1, 0, 0, 1, 1,
1.107075, -0.7287047, 1.502902, 1, 0, 0, 1, 1,
1.107526, 0.5638823, 0.3849326, 1, 0, 0, 1, 1,
1.114707, 0.6941546, 3.21288, 1, 0, 0, 1, 1,
1.116253, 1.579277, 1.749228, 1, 0, 0, 1, 1,
1.120783, -1.007605, 2.174993, 0, 0, 0, 1, 1,
1.140062, -1.358633, 2.217834, 0, 0, 0, 1, 1,
1.141515, -1.176323, 3.616593, 0, 0, 0, 1, 1,
1.151657, 0.3532646, -1.30384, 0, 0, 0, 1, 1,
1.152352, -0.5929557, 2.680918, 0, 0, 0, 1, 1,
1.160739, 0.9701639, 0.4387943, 0, 0, 0, 1, 1,
1.167369, 0.399564, 2.336639, 0, 0, 0, 1, 1,
1.169184, 0.8889804, -0.03970934, 1, 1, 1, 1, 1,
1.179707, -1.505097, 2.297764, 1, 1, 1, 1, 1,
1.180401, -0.214579, 1.781239, 1, 1, 1, 1, 1,
1.1846, 0.006748814, 1.61226, 1, 1, 1, 1, 1,
1.184631, -0.1275459, 1.465635, 1, 1, 1, 1, 1,
1.197543, 0.8412383, 1.108966, 1, 1, 1, 1, 1,
1.202997, 1.937425, 2.928762, 1, 1, 1, 1, 1,
1.205821, -1.31873, 2.156401, 1, 1, 1, 1, 1,
1.211125, 0.9449519, 0.8855707, 1, 1, 1, 1, 1,
1.216903, 1.287154, 1.282464, 1, 1, 1, 1, 1,
1.221145, -1.351699, 3.608224, 1, 1, 1, 1, 1,
1.227478, 0.3770984, 1.227561, 1, 1, 1, 1, 1,
1.232822, -0.2146648, 3.862622, 1, 1, 1, 1, 1,
1.235674, 0.0133713, 1.65751, 1, 1, 1, 1, 1,
1.244055, 0.7376965, 1.31788, 1, 1, 1, 1, 1,
1.248423, -0.8116087, 2.614879, 0, 0, 1, 1, 1,
1.257972, -0.8249278, 2.9466, 1, 0, 0, 1, 1,
1.258675, -0.3478647, 2.144001, 1, 0, 0, 1, 1,
1.261414, 0.06533795, 2.23558, 1, 0, 0, 1, 1,
1.268619, -0.7352154, 2.206232, 1, 0, 0, 1, 1,
1.269493, 1.41313, 2.431538, 1, 0, 0, 1, 1,
1.272891, -0.6425775, 3.257384, 0, 0, 0, 1, 1,
1.276706, -0.6868353, 2.759549, 0, 0, 0, 1, 1,
1.278189, 1.734106, 1.166568, 0, 0, 0, 1, 1,
1.287358, 1.650376, -0.1403567, 0, 0, 0, 1, 1,
1.290022, 0.316707, 2.801977, 0, 0, 0, 1, 1,
1.295825, -0.8144282, 2.553677, 0, 0, 0, 1, 1,
1.303296, 0.7381949, 0.5890396, 0, 0, 0, 1, 1,
1.309697, 0.193683, 2.292426, 1, 1, 1, 1, 1,
1.318081, -0.6475779, 1.090544, 1, 1, 1, 1, 1,
1.319002, 0.5413748, -0.07992551, 1, 1, 1, 1, 1,
1.331305, -0.8815687, 0.6268511, 1, 1, 1, 1, 1,
1.336249, 1.166255, -0.6583645, 1, 1, 1, 1, 1,
1.343232, -0.1876051, 2.427391, 1, 1, 1, 1, 1,
1.349404, 1.032585, -1.045357, 1, 1, 1, 1, 1,
1.352837, 1.888623, 0.1799256, 1, 1, 1, 1, 1,
1.352978, 0.1060834, 1.601544, 1, 1, 1, 1, 1,
1.353695, 1.659509, -0.09881616, 1, 1, 1, 1, 1,
1.365692, 2.354824, 1.082581, 1, 1, 1, 1, 1,
1.370447, -0.931002, 1.975366, 1, 1, 1, 1, 1,
1.374122, 0.1233765, 2.233849, 1, 1, 1, 1, 1,
1.377496, -0.582279, 1.926614, 1, 1, 1, 1, 1,
1.392182, -0.4788162, 3.413805, 1, 1, 1, 1, 1,
1.394953, 0.7580805, 0.4139549, 0, 0, 1, 1, 1,
1.398351, 0.08113449, 0.3460814, 1, 0, 0, 1, 1,
1.398836, -0.628269, 0.9776577, 1, 0, 0, 1, 1,
1.400849, -1.274868, 1.239357, 1, 0, 0, 1, 1,
1.403814, -0.3850898, 2.49361, 1, 0, 0, 1, 1,
1.40642, 0.7916825, 2.487419, 1, 0, 0, 1, 1,
1.409972, 0.8056703, 0.1591036, 0, 0, 0, 1, 1,
1.413018, -0.5123959, 2.894348, 0, 0, 0, 1, 1,
1.41416, 1.365167, 0.9277894, 0, 0, 0, 1, 1,
1.44697, 0.5346879, -0.5817223, 0, 0, 0, 1, 1,
1.447198, 2.311739, 2.929691, 0, 0, 0, 1, 1,
1.447485, -3.644733, 3.494183, 0, 0, 0, 1, 1,
1.454614, 0.541465, 2.373564, 0, 0, 0, 1, 1,
1.465662, 0.899215, -0.8886869, 1, 1, 1, 1, 1,
1.471606, -0.3597449, 2.487078, 1, 1, 1, 1, 1,
1.484227, 0.6221254, 0.08099476, 1, 1, 1, 1, 1,
1.485446, -0.493459, 2.556497, 1, 1, 1, 1, 1,
1.503623, 0.1509998, -0.204056, 1, 1, 1, 1, 1,
1.529169, 0.293604, 2.213472, 1, 1, 1, 1, 1,
1.536153, 0.2783611, 2.617318, 1, 1, 1, 1, 1,
1.538325, -1.115553, 1.070278, 1, 1, 1, 1, 1,
1.543628, 1.118382, 0.880434, 1, 1, 1, 1, 1,
1.564248, 1.858528, 0.4333435, 1, 1, 1, 1, 1,
1.56643, -0.3671901, 2.131429, 1, 1, 1, 1, 1,
1.574755, 0.9065655, -1.307188, 1, 1, 1, 1, 1,
1.583685, 0.7793733, 1.443416, 1, 1, 1, 1, 1,
1.591114, -1.012071, 0.9870542, 1, 1, 1, 1, 1,
1.591498, 1.28116, 1.59462, 1, 1, 1, 1, 1,
1.598677, -0.349245, 2.614484, 0, 0, 1, 1, 1,
1.601954, 0.3739484, 0.4771155, 1, 0, 0, 1, 1,
1.644462, 0.3307533, 1.809259, 1, 0, 0, 1, 1,
1.648054, -0.03080985, 1.505344, 1, 0, 0, 1, 1,
1.652008, 0.07988607, 1.519841, 1, 0, 0, 1, 1,
1.655849, -0.7224509, 0.7095199, 1, 0, 0, 1, 1,
1.657432, -0.2810263, 2.803034, 0, 0, 0, 1, 1,
1.67234, 1.134497, 0.8182368, 0, 0, 0, 1, 1,
1.682485, 0.5923587, 0.3013328, 0, 0, 0, 1, 1,
1.689259, -0.131752, 1.802869, 0, 0, 0, 1, 1,
1.694674, 0.5453232, 1.767373, 0, 0, 0, 1, 1,
1.716036, -0.8114035, 3.752246, 0, 0, 0, 1, 1,
1.765886, -0.1883622, 1.988754, 0, 0, 0, 1, 1,
1.777226, -0.7103557, 3.64363, 1, 1, 1, 1, 1,
1.781597, -0.9942318, 3.674831, 1, 1, 1, 1, 1,
1.801061, -1.211923, 1.549179, 1, 1, 1, 1, 1,
1.820671, 1.695542, 1.392009, 1, 1, 1, 1, 1,
1.823013, -0.1669837, -0.04606622, 1, 1, 1, 1, 1,
1.86323, 0.0501642, 0.8368671, 1, 1, 1, 1, 1,
1.869558, -0.8759177, 1.0805, 1, 1, 1, 1, 1,
1.874019, -0.4609512, 2.796541, 1, 1, 1, 1, 1,
1.890996, 0.02378793, 1.534616, 1, 1, 1, 1, 1,
1.892066, 1.098624, 1.482641, 1, 1, 1, 1, 1,
1.89431, -1.031934, 2.219868, 1, 1, 1, 1, 1,
1.982329, 1.175027, 1.227603, 1, 1, 1, 1, 1,
2.000203, -0.7857774, 2.552879, 1, 1, 1, 1, 1,
2.010263, -0.0172052, 1.234025, 1, 1, 1, 1, 1,
2.053126, -0.4066228, 0.8587663, 1, 1, 1, 1, 1,
2.117151, -2.616876, 1.213062, 0, 0, 1, 1, 1,
2.144809, -1.246677, 3.356587, 1, 0, 0, 1, 1,
2.167259, 0.1017153, 1.373714, 1, 0, 0, 1, 1,
2.231238, -0.02570832, 2.909233, 1, 0, 0, 1, 1,
2.238254, 0.93431, 0.622798, 1, 0, 0, 1, 1,
2.239243, 1.610088, 2.543031, 1, 0, 0, 1, 1,
2.243476, 2.260341, -0.1782359, 0, 0, 0, 1, 1,
2.34155, 0.3752707, 0.3615088, 0, 0, 0, 1, 1,
2.45249, 0.9585598, 1.806095, 0, 0, 0, 1, 1,
2.460478, 0.4990667, 3.258198, 0, 0, 0, 1, 1,
2.461118, -1.701699, 2.670911, 0, 0, 0, 1, 1,
2.466239, 0.6517383, 1.48102, 0, 0, 0, 1, 1,
2.696813, -0.3142191, 1.661737, 0, 0, 0, 1, 1,
2.741704, 0.9512963, 2.127761, 1, 1, 1, 1, 1,
2.766039, -1.272282, 1.289267, 1, 1, 1, 1, 1,
2.810189, -0.1145208, 0.41368, 1, 1, 1, 1, 1,
2.824614, 0.6610307, 0.7876949, 1, 1, 1, 1, 1,
2.82491, 0.7702686, 1.283757, 1, 1, 1, 1, 1,
3.066218, 0.6503933, 2.582327, 1, 1, 1, 1, 1,
3.144735, 0.61799, 1.493791, 1, 1, 1, 1, 1
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
var radius = 9.406285;
var distance = 33.03918;
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
mvMatrix.translate( -0.1449558, 0.3449324, -0.3827722 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.03918);
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
