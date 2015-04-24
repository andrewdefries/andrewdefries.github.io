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
-3.709481, -1.499614, -1.154092, 1, 0, 0, 1,
-3.415226, 0.8167098, -1.478818, 1, 0.007843138, 0, 1,
-2.844725, -1.650229, -1.238819, 1, 0.01176471, 0, 1,
-2.757701, -0.9817063, -2.111817, 1, 0.01960784, 0, 1,
-2.476927, -1.265652, -2.453496, 1, 0.02352941, 0, 1,
-2.413132, -0.7198255, -1.251974, 1, 0.03137255, 0, 1,
-2.366248, -0.8292934, -3.482714, 1, 0.03529412, 0, 1,
-2.33453, 0.3502059, -0.2046487, 1, 0.04313726, 0, 1,
-2.331592, 0.4873896, -0.4421974, 1, 0.04705882, 0, 1,
-2.311133, 0.5911102, -3.087129, 1, 0.05490196, 0, 1,
-2.283376, -0.2139632, -2.696224, 1, 0.05882353, 0, 1,
-2.267043, -0.1174814, -1.373168, 1, 0.06666667, 0, 1,
-2.175313, 1.835561, -0.3288134, 1, 0.07058824, 0, 1,
-2.116284, -1.914632, -1.647216, 1, 0.07843138, 0, 1,
-2.091284, 1.251874, -2.714879, 1, 0.08235294, 0, 1,
-2.08088, -1.906139, -2.55127, 1, 0.09019608, 0, 1,
-2.044392, -0.06540188, 0.07080478, 1, 0.09411765, 0, 1,
-2.036145, 0.6201891, 0.1533691, 1, 0.1019608, 0, 1,
-1.962062, 0.17945, -0.4941457, 1, 0.1098039, 0, 1,
-1.950369, 0.3967204, -3.3572, 1, 0.1137255, 0, 1,
-1.947515, 0.5681462, -1.820983, 1, 0.1215686, 0, 1,
-1.92127, 0.6300772, -1.154274, 1, 0.1254902, 0, 1,
-1.918688, -0.3041826, -1.523554, 1, 0.1333333, 0, 1,
-1.908364, 1.385562, -1.94832, 1, 0.1372549, 0, 1,
-1.877201, 0.8110061, 0.04997822, 1, 0.145098, 0, 1,
-1.875091, 0.08229095, -1.076769, 1, 0.1490196, 0, 1,
-1.871319, 0.9262387, -1.858454, 1, 0.1568628, 0, 1,
-1.846651, 0.9231555, -2.890322, 1, 0.1607843, 0, 1,
-1.840496, 0.7097263, -0.8309185, 1, 0.1686275, 0, 1,
-1.839787, -0.007166293, -0.7517153, 1, 0.172549, 0, 1,
-1.794939, -1.068846, -2.757587, 1, 0.1803922, 0, 1,
-1.75849, 0.8232855, -1.198971, 1, 0.1843137, 0, 1,
-1.719952, 1.465805, -1.900848, 1, 0.1921569, 0, 1,
-1.715766, 1.996303, -0.01260743, 1, 0.1960784, 0, 1,
-1.696557, 0.9454533, -1.414769, 1, 0.2039216, 0, 1,
-1.681781, -0.4154213, -0.7876874, 1, 0.2117647, 0, 1,
-1.654329, 2.008395, -0.6175655, 1, 0.2156863, 0, 1,
-1.650114, 0.8153737, -0.06089052, 1, 0.2235294, 0, 1,
-1.645505, -1.577021, -0.729219, 1, 0.227451, 0, 1,
-1.642369, 2.804336, -0.6450737, 1, 0.2352941, 0, 1,
-1.639915, 1.149956, -0.6912918, 1, 0.2392157, 0, 1,
-1.635576, -1.265291, -1.724433, 1, 0.2470588, 0, 1,
-1.631657, -0.5223718, -1.180483, 1, 0.2509804, 0, 1,
-1.610053, -1.351363, -3.177354, 1, 0.2588235, 0, 1,
-1.605723, -0.4342294, -1.658301, 1, 0.2627451, 0, 1,
-1.605243, -1.161188, -2.722425, 1, 0.2705882, 0, 1,
-1.60164, 0.6666352, -2.322611, 1, 0.2745098, 0, 1,
-1.593572, -0.8658621, -1.267667, 1, 0.282353, 0, 1,
-1.589309, -0.6643224, -1.434363, 1, 0.2862745, 0, 1,
-1.577806, -1.413817, -2.826288, 1, 0.2941177, 0, 1,
-1.567029, 0.2186671, -0.7784386, 1, 0.3019608, 0, 1,
-1.559047, -1.479824, -3.088481, 1, 0.3058824, 0, 1,
-1.558828, 1.618152, -0.5332663, 1, 0.3137255, 0, 1,
-1.544841, -0.6334466, 0.1016127, 1, 0.3176471, 0, 1,
-1.533429, 0.9662246, -1.111116, 1, 0.3254902, 0, 1,
-1.530532, -0.8882707, -0.9535409, 1, 0.3294118, 0, 1,
-1.499704, 1.010084, -0.2500831, 1, 0.3372549, 0, 1,
-1.496979, -0.0476577, -1.70977, 1, 0.3411765, 0, 1,
-1.491343, -0.4903412, -1.527377, 1, 0.3490196, 0, 1,
-1.48757, 0.7776401, -0.6819432, 1, 0.3529412, 0, 1,
-1.486746, -0.9499986, -1.697065, 1, 0.3607843, 0, 1,
-1.472015, -2.205526, -0.5617387, 1, 0.3647059, 0, 1,
-1.468221, -0.08630638, -1.567164, 1, 0.372549, 0, 1,
-1.459456, -0.8859629, -0.7325051, 1, 0.3764706, 0, 1,
-1.45514, 1.910031, -0.2474422, 1, 0.3843137, 0, 1,
-1.453547, -0.8441424, -3.414282, 1, 0.3882353, 0, 1,
-1.44652, 0.723084, -0.3003978, 1, 0.3960784, 0, 1,
-1.436103, -0.5641694, -1.485857, 1, 0.4039216, 0, 1,
-1.419747, -0.4354292, -2.023476, 1, 0.4078431, 0, 1,
-1.414335, 0.2787429, -2.33502, 1, 0.4156863, 0, 1,
-1.411546, -1.026198, -2.664757, 1, 0.4196078, 0, 1,
-1.403948, -1.288799, -2.565532, 1, 0.427451, 0, 1,
-1.39412, -0.5665045, -1.489801, 1, 0.4313726, 0, 1,
-1.374064, 0.02859759, -1.444646, 1, 0.4392157, 0, 1,
-1.370178, -0.2605481, -0.7201509, 1, 0.4431373, 0, 1,
-1.370026, 0.4258893, 0.1652865, 1, 0.4509804, 0, 1,
-1.364053, -0.01257087, -0.3387992, 1, 0.454902, 0, 1,
-1.364011, 0.6702677, -1.794882, 1, 0.4627451, 0, 1,
-1.36258, 1.106904, -0.4625374, 1, 0.4666667, 0, 1,
-1.356985, -1.107322, -0.00361546, 1, 0.4745098, 0, 1,
-1.354231, -0.4378731, -2.191303, 1, 0.4784314, 0, 1,
-1.353798, -0.7232572, -2.623181, 1, 0.4862745, 0, 1,
-1.349008, 0.1968824, -1.257864, 1, 0.4901961, 0, 1,
-1.347383, 0.1032557, -0.8141269, 1, 0.4980392, 0, 1,
-1.338155, -1.551652, -0.95835, 1, 0.5058824, 0, 1,
-1.33123, -0.2462129, -3.051164, 1, 0.509804, 0, 1,
-1.321123, 0.4172195, -0.8625707, 1, 0.5176471, 0, 1,
-1.316916, -0.06045775, -0.9882501, 1, 0.5215687, 0, 1,
-1.311362, 0.9299075, 0.02617552, 1, 0.5294118, 0, 1,
-1.310707, 0.1697847, -2.807898, 1, 0.5333334, 0, 1,
-1.307121, 0.6564193, -0.3587803, 1, 0.5411765, 0, 1,
-1.302688, -1.753939, -1.439789, 1, 0.5450981, 0, 1,
-1.291929, 0.4099582, 0.02546275, 1, 0.5529412, 0, 1,
-1.286873, 0.7387398, -2.249556, 1, 0.5568628, 0, 1,
-1.28302, -1.567678, -1.274272, 1, 0.5647059, 0, 1,
-1.282531, -1.023368, -0.5353076, 1, 0.5686275, 0, 1,
-1.280206, 0.1141169, 0.6904927, 1, 0.5764706, 0, 1,
-1.278003, -0.5102016, -2.820311, 1, 0.5803922, 0, 1,
-1.270176, 0.8125773, -1.517667, 1, 0.5882353, 0, 1,
-1.265113, 2.375672, 0.113084, 1, 0.5921569, 0, 1,
-1.261103, -0.847156, -1.81962, 1, 0.6, 0, 1,
-1.247459, 0.6787819, -1.252627, 1, 0.6078432, 0, 1,
-1.24476, 0.1776184, -1.581901, 1, 0.6117647, 0, 1,
-1.243287, 0.1022316, -2.659987, 1, 0.6196079, 0, 1,
-1.23707, -0.1676302, -2.314713, 1, 0.6235294, 0, 1,
-1.233189, -0.8436245, -1.537859, 1, 0.6313726, 0, 1,
-1.232731, 0.5641465, -2.351377, 1, 0.6352941, 0, 1,
-1.231929, -0.2954193, -2.406432, 1, 0.6431373, 0, 1,
-1.213504, 0.998181, -0.9364774, 1, 0.6470588, 0, 1,
-1.211651, 0.9262915, -0.3882391, 1, 0.654902, 0, 1,
-1.20821, -1.175368, -4.194436, 1, 0.6588235, 0, 1,
-1.206011, 1.198758, -3.765679, 1, 0.6666667, 0, 1,
-1.199412, -1.325878, -1.886076, 1, 0.6705883, 0, 1,
-1.190313, 0.6968337, -0.7001856, 1, 0.6784314, 0, 1,
-1.184252, 1.517737, 0.1031236, 1, 0.682353, 0, 1,
-1.183638, 0.1334331, -3.026826, 1, 0.6901961, 0, 1,
-1.172237, -0.8203269, -3.010677, 1, 0.6941177, 0, 1,
-1.168847, -0.8158549, -3.154029, 1, 0.7019608, 0, 1,
-1.163239, 0.06814405, -0.8101519, 1, 0.7098039, 0, 1,
-1.16196, -1.724154, -3.232259, 1, 0.7137255, 0, 1,
-1.161263, 0.8927867, -3.496082, 1, 0.7215686, 0, 1,
-1.154369, 0.4285471, -1.914709, 1, 0.7254902, 0, 1,
-1.148142, -0.3615909, -0.6763569, 1, 0.7333333, 0, 1,
-1.147111, -0.3110715, 0.9240561, 1, 0.7372549, 0, 1,
-1.14672, -1.606372, -0.9845195, 1, 0.7450981, 0, 1,
-1.140913, -0.00297018, -2.832932, 1, 0.7490196, 0, 1,
-1.139541, 0.6180931, -2.552287, 1, 0.7568628, 0, 1,
-1.132848, -0.6095853, -3.772325, 1, 0.7607843, 0, 1,
-1.130509, -0.4365994, -1.711946, 1, 0.7686275, 0, 1,
-1.129385, 1.388418, -0.5815438, 1, 0.772549, 0, 1,
-1.118081, 1.274859, -1.873397, 1, 0.7803922, 0, 1,
-1.111216, 0.8046729, -1.787878, 1, 0.7843137, 0, 1,
-1.109338, -0.1110306, -0.5753806, 1, 0.7921569, 0, 1,
-1.108779, -1.635965, -3.053323, 1, 0.7960784, 0, 1,
-1.099491, 2.605764, -0.5565317, 1, 0.8039216, 0, 1,
-1.097367, -0.3565387, -1.251853, 1, 0.8117647, 0, 1,
-1.08789, 0.7506886, 0.1466594, 1, 0.8156863, 0, 1,
-1.077244, -2.039589, -2.30289, 1, 0.8235294, 0, 1,
-1.076229, -0.6164621, -1.330313, 1, 0.827451, 0, 1,
-1.073142, -0.3499762, -1.665226, 1, 0.8352941, 0, 1,
-1.070958, -0.5190946, -1.805941, 1, 0.8392157, 0, 1,
-1.070609, -0.671151, 0.5763633, 1, 0.8470588, 0, 1,
-1.066562, 2.049269, 1.803893, 1, 0.8509804, 0, 1,
-1.065513, 0.3583227, -2.125259, 1, 0.8588235, 0, 1,
-1.061528, -1.63043, -2.533489, 1, 0.8627451, 0, 1,
-1.059399, 0.9164795, -1.108922, 1, 0.8705882, 0, 1,
-1.051174, 0.04682901, -0.1379837, 1, 0.8745098, 0, 1,
-1.049429, 0.5098459, -1.632163, 1, 0.8823529, 0, 1,
-1.043887, 0.5107819, -1.285522, 1, 0.8862745, 0, 1,
-1.04032, 2.934929, 0.737139, 1, 0.8941177, 0, 1,
-1.035575, -0.1364385, -2.591159, 1, 0.8980392, 0, 1,
-1.034366, 1.078231, -0.6662429, 1, 0.9058824, 0, 1,
-1.022029, 0.648055, -2.099339, 1, 0.9137255, 0, 1,
-1.020395, 0.9132897, -0.9822118, 1, 0.9176471, 0, 1,
-1.016198, -0.332933, -2.429104, 1, 0.9254902, 0, 1,
-1.005611, 0.6168736, -0.7772311, 1, 0.9294118, 0, 1,
-1.003832, 0.1064736, -2.094967, 1, 0.9372549, 0, 1,
-0.9950327, 0.9776179, -1.385225, 1, 0.9411765, 0, 1,
-0.9944125, -1.143634, -2.366283, 1, 0.9490196, 0, 1,
-0.9835535, 0.556073, -0.1605371, 1, 0.9529412, 0, 1,
-0.9820473, -1.947407, -3.01538, 1, 0.9607843, 0, 1,
-0.9806441, -0.2910189, -0.8941854, 1, 0.9647059, 0, 1,
-0.9764395, -0.9718117, -2.215046, 1, 0.972549, 0, 1,
-0.9763492, -0.9836454, -0.4519614, 1, 0.9764706, 0, 1,
-0.9760125, -1.139255, -1.734961, 1, 0.9843137, 0, 1,
-0.9740965, 0.2251411, -2.245886, 1, 0.9882353, 0, 1,
-0.9724008, -0.2079221, -0.9368159, 1, 0.9960784, 0, 1,
-0.9697841, -0.5913411, -2.28844, 0.9960784, 1, 0, 1,
-0.9678087, 0.08000403, 0.2830076, 0.9921569, 1, 0, 1,
-0.9596346, 0.1065444, -2.53251, 0.9843137, 1, 0, 1,
-0.953275, -0.1408819, -1.922188, 0.9803922, 1, 0, 1,
-0.9464077, 0.4990978, -1.571237, 0.972549, 1, 0, 1,
-0.9422551, -0.2636492, -2.624006, 0.9686275, 1, 0, 1,
-0.9399647, -0.4633661, -1.934469, 0.9607843, 1, 0, 1,
-0.9385776, 0.7178801, -0.3973393, 0.9568627, 1, 0, 1,
-0.9376108, 0.8260632, 0.1635628, 0.9490196, 1, 0, 1,
-0.9290358, 0.360711, -0.7562308, 0.945098, 1, 0, 1,
-0.9247821, -3.10419, -4.490493, 0.9372549, 1, 0, 1,
-0.920053, -0.790601, -1.176393, 0.9333333, 1, 0, 1,
-0.918168, 0.08321083, -1.367374, 0.9254902, 1, 0, 1,
-0.9141939, -1.786909, -3.001142, 0.9215686, 1, 0, 1,
-0.9097284, 0.05033062, -1.117016, 0.9137255, 1, 0, 1,
-0.906749, -0.4464043, -1.014091, 0.9098039, 1, 0, 1,
-0.9042897, 0.2534141, -0.1503869, 0.9019608, 1, 0, 1,
-0.9037596, 0.8104482, -1.188642, 0.8941177, 1, 0, 1,
-0.9004559, 0.1894594, -1.224347, 0.8901961, 1, 0, 1,
-0.8985478, -0.940959, -3.324266, 0.8823529, 1, 0, 1,
-0.8925899, -0.9567298, -1.340843, 0.8784314, 1, 0, 1,
-0.8918322, -0.4973717, -2.377484, 0.8705882, 1, 0, 1,
-0.8798803, 0.3904905, 0.04656069, 0.8666667, 1, 0, 1,
-0.8658661, 0.6656661, -1.420758, 0.8588235, 1, 0, 1,
-0.8630563, 0.1347114, -2.127229, 0.854902, 1, 0, 1,
-0.8620821, -0.126085, -1.246144, 0.8470588, 1, 0, 1,
-0.8600441, -0.4907693, -1.135691, 0.8431373, 1, 0, 1,
-0.8547328, 0.507633, -1.179017, 0.8352941, 1, 0, 1,
-0.8400832, 1.379314, -0.9665223, 0.8313726, 1, 0, 1,
-0.8368245, 0.08354631, -0.523984, 0.8235294, 1, 0, 1,
-0.8357035, -0.7485395, -2.333422, 0.8196079, 1, 0, 1,
-0.8331768, -0.1778956, -0.3470877, 0.8117647, 1, 0, 1,
-0.8331081, 0.870874, -1.353691, 0.8078431, 1, 0, 1,
-0.8328064, -1.164729, -2.703391, 0.8, 1, 0, 1,
-0.8279328, 0.626318, -0.3458374, 0.7921569, 1, 0, 1,
-0.8173922, 1.933284, -0.7618462, 0.7882353, 1, 0, 1,
-0.8099613, -0.5037374, -1.368334, 0.7803922, 1, 0, 1,
-0.8096805, 0.7166332, -0.2573061, 0.7764706, 1, 0, 1,
-0.8043851, -0.2917353, -1.395468, 0.7686275, 1, 0, 1,
-0.8041186, -2.016078, -2.953236, 0.7647059, 1, 0, 1,
-0.8015381, 0.1580262, -0.9899521, 0.7568628, 1, 0, 1,
-0.7936843, -0.2799909, -1.356632, 0.7529412, 1, 0, 1,
-0.7891362, -0.0388449, -1.153899, 0.7450981, 1, 0, 1,
-0.7872305, 0.02415033, -1.226408, 0.7411765, 1, 0, 1,
-0.7850309, 0.1652544, -2.236692, 0.7333333, 1, 0, 1,
-0.7808232, 0.4398752, -0.7644199, 0.7294118, 1, 0, 1,
-0.7804357, 0.1437673, -1.004803, 0.7215686, 1, 0, 1,
-0.7794418, 0.6106114, -0.07374951, 0.7176471, 1, 0, 1,
-0.7753006, -1.139742, -1.979658, 0.7098039, 1, 0, 1,
-0.774452, 0.6623012, -0.6355835, 0.7058824, 1, 0, 1,
-0.7733022, 1.35809, 0.9134747, 0.6980392, 1, 0, 1,
-0.7681919, -0.5954205, -2.566253, 0.6901961, 1, 0, 1,
-0.7611496, -1.072323, -2.266496, 0.6862745, 1, 0, 1,
-0.7607427, -0.02347096, -1.430344, 0.6784314, 1, 0, 1,
-0.7525729, 1.737857, -0.1988838, 0.6745098, 1, 0, 1,
-0.7513182, 0.06907798, -3.412448, 0.6666667, 1, 0, 1,
-0.750173, 1.776033, -0.593641, 0.6627451, 1, 0, 1,
-0.7500966, 0.004920073, -3.627994, 0.654902, 1, 0, 1,
-0.7433221, 0.2231202, -0.2175274, 0.6509804, 1, 0, 1,
-0.7408329, -0.3024384, -0.9001701, 0.6431373, 1, 0, 1,
-0.7361409, -1.081935, -2.748674, 0.6392157, 1, 0, 1,
-0.734789, -0.5321496, -1.125719, 0.6313726, 1, 0, 1,
-0.7225676, 0.9635427, 0.7867364, 0.627451, 1, 0, 1,
-0.7225026, 0.008462073, -0.7622103, 0.6196079, 1, 0, 1,
-0.714588, 0.7460223, -1.529162, 0.6156863, 1, 0, 1,
-0.7077749, 0.5331116, -2.370262, 0.6078432, 1, 0, 1,
-0.7054048, -0.3173167, -1.798659, 0.6039216, 1, 0, 1,
-0.7043905, 0.3642823, 0.5655181, 0.5960785, 1, 0, 1,
-0.6950148, 1.688355, -1.486259, 0.5882353, 1, 0, 1,
-0.6949247, 1.60314, 0.08396649, 0.5843138, 1, 0, 1,
-0.6940598, -0.8876373, -1.840808, 0.5764706, 1, 0, 1,
-0.6925005, 2.446805, 0.1211364, 0.572549, 1, 0, 1,
-0.6877343, -1.137079, -1.363188, 0.5647059, 1, 0, 1,
-0.6805173, -1.529663, -1.340577, 0.5607843, 1, 0, 1,
-0.6804259, -0.2808613, -2.980303, 0.5529412, 1, 0, 1,
-0.6723077, 1.479052, -1.030923, 0.5490196, 1, 0, 1,
-0.6708915, 1.130316, -2.931045, 0.5411765, 1, 0, 1,
-0.6662497, 0.4229846, -1.314469, 0.5372549, 1, 0, 1,
-0.6660366, -0.5164485, -0.8776821, 0.5294118, 1, 0, 1,
-0.663021, 1.14505, -0.2132871, 0.5254902, 1, 0, 1,
-0.6624882, 1.401347, -0.2822695, 0.5176471, 1, 0, 1,
-0.6623995, 0.1148863, -1.989366, 0.5137255, 1, 0, 1,
-0.659507, -1.027594, -2.667611, 0.5058824, 1, 0, 1,
-0.656317, 0.5588107, -1.673319, 0.5019608, 1, 0, 1,
-0.6516864, 0.6450936, -0.9467344, 0.4941176, 1, 0, 1,
-0.6456029, 1.03332, -0.643488, 0.4862745, 1, 0, 1,
-0.6427044, 0.2759054, -0.5451716, 0.4823529, 1, 0, 1,
-0.6419311, 1.616007, -0.8732776, 0.4745098, 1, 0, 1,
-0.6410983, -0.6334854, -2.216165, 0.4705882, 1, 0, 1,
-0.6409085, 0.8171164, -2.477697, 0.4627451, 1, 0, 1,
-0.6312971, -1.530496, -2.111027, 0.4588235, 1, 0, 1,
-0.6298277, -0.2704802, -2.524544, 0.4509804, 1, 0, 1,
-0.6256409, 0.8528172, -1.026286, 0.4470588, 1, 0, 1,
-0.6233135, -0.3581436, -2.983164, 0.4392157, 1, 0, 1,
-0.6200822, 0.09730364, -2.44064, 0.4352941, 1, 0, 1,
-0.6099123, -0.02120996, -1.979739, 0.427451, 1, 0, 1,
-0.608801, 0.5489337, 0.571068, 0.4235294, 1, 0, 1,
-0.6076521, 0.5817911, -2.374247, 0.4156863, 1, 0, 1,
-0.6073699, -0.3772659, -4.382193, 0.4117647, 1, 0, 1,
-0.602581, 1.381658, -1.553364, 0.4039216, 1, 0, 1,
-0.6018587, -0.215486, -2.423427, 0.3960784, 1, 0, 1,
-0.6013278, 0.05864185, -2.342654, 0.3921569, 1, 0, 1,
-0.5981765, 0.7634462, -1.048033, 0.3843137, 1, 0, 1,
-0.5961045, -0.4164241, -3.435634, 0.3803922, 1, 0, 1,
-0.5925803, 0.1191012, -2.726373, 0.372549, 1, 0, 1,
-0.5910469, 0.5511144, 0.2207552, 0.3686275, 1, 0, 1,
-0.5870394, -0.6221697, -4.183582, 0.3607843, 1, 0, 1,
-0.5868406, -0.2816508, -1.071678, 0.3568628, 1, 0, 1,
-0.5831935, -2.36746, -3.122418, 0.3490196, 1, 0, 1,
-0.5791328, 0.02557583, -1.14599, 0.345098, 1, 0, 1,
-0.5785016, 0.1250464, -1.552982, 0.3372549, 1, 0, 1,
-0.577696, 1.396091, -1.143974, 0.3333333, 1, 0, 1,
-0.5774774, 1.191709, -0.1267682, 0.3254902, 1, 0, 1,
-0.574567, 0.5443422, -2.094985, 0.3215686, 1, 0, 1,
-0.5704738, 1.589835, 2.070851, 0.3137255, 1, 0, 1,
-0.5655457, -1.609472, -2.651455, 0.3098039, 1, 0, 1,
-0.5611216, 0.3430063, -0.5936904, 0.3019608, 1, 0, 1,
-0.5602573, -0.1896935, -2.172714, 0.2941177, 1, 0, 1,
-0.5582067, 0.1599159, -0.8185778, 0.2901961, 1, 0, 1,
-0.554974, 0.9861786, -1.686695, 0.282353, 1, 0, 1,
-0.5535682, -0.2562827, -1.374806, 0.2784314, 1, 0, 1,
-0.5534293, -0.1549599, -0.8839437, 0.2705882, 1, 0, 1,
-0.5532091, -1.202702, -3.424292, 0.2666667, 1, 0, 1,
-0.5423517, 1.42015, 0.1935094, 0.2588235, 1, 0, 1,
-0.5399643, -0.2376308, -2.022837, 0.254902, 1, 0, 1,
-0.5368835, 2.175134, -0.2817671, 0.2470588, 1, 0, 1,
-0.5267714, 0.2583556, -1.567866, 0.2431373, 1, 0, 1,
-0.5230547, -1.693698, -3.047022, 0.2352941, 1, 0, 1,
-0.5225574, -0.7833983, -1.839329, 0.2313726, 1, 0, 1,
-0.5202403, -0.2742978, -0.5712596, 0.2235294, 1, 0, 1,
-0.5200915, -1.483489, -2.922944, 0.2196078, 1, 0, 1,
-0.5199491, -1.261387, -3.422852, 0.2117647, 1, 0, 1,
-0.5198652, -0.4946458, -1.202484, 0.2078431, 1, 0, 1,
-0.5192155, -0.5197591, -2.351417, 0.2, 1, 0, 1,
-0.5185979, 0.4370405, -0.4240463, 0.1921569, 1, 0, 1,
-0.5170407, 0.4123033, -0.6450804, 0.1882353, 1, 0, 1,
-0.5105544, -0.9907393, -2.274401, 0.1803922, 1, 0, 1,
-0.5084912, 0.6085248, 0.3321835, 0.1764706, 1, 0, 1,
-0.5061196, -1.26976, -3.858985, 0.1686275, 1, 0, 1,
-0.5060498, -0.3482677, -1.486236, 0.1647059, 1, 0, 1,
-0.5040731, 1.245191, -0.211444, 0.1568628, 1, 0, 1,
-0.5025095, 0.7275681, -0.4567442, 0.1529412, 1, 0, 1,
-0.5003793, -0.7748026, -2.064055, 0.145098, 1, 0, 1,
-0.4960849, 0.281922, -1.606261, 0.1411765, 1, 0, 1,
-0.4950662, -1.003146, -1.322381, 0.1333333, 1, 0, 1,
-0.4872719, -0.1839443, -2.613614, 0.1294118, 1, 0, 1,
-0.4860753, -0.5406437, -2.130778, 0.1215686, 1, 0, 1,
-0.4856746, 0.978249, -0.5123082, 0.1176471, 1, 0, 1,
-0.4847325, 1.865077, -1.626992, 0.1098039, 1, 0, 1,
-0.4805879, -0.6483779, -2.10598, 0.1058824, 1, 0, 1,
-0.4804077, 0.4026201, -1.01851, 0.09803922, 1, 0, 1,
-0.4787864, -0.995333, -2.223374, 0.09019608, 1, 0, 1,
-0.4784554, -1.445187, -1.059529, 0.08627451, 1, 0, 1,
-0.4757819, -0.7183143, -2.839921, 0.07843138, 1, 0, 1,
-0.4725487, -1.330433, -3.08177, 0.07450981, 1, 0, 1,
-0.4687019, -0.8977389, -1.59725, 0.06666667, 1, 0, 1,
-0.4672558, -0.3891243, -0.4692622, 0.0627451, 1, 0, 1,
-0.4671354, -0.1433617, -2.227332, 0.05490196, 1, 0, 1,
-0.4667805, -0.02577121, -1.919901, 0.05098039, 1, 0, 1,
-0.4638663, 0.205766, -0.902709, 0.04313726, 1, 0, 1,
-0.4629098, -2.622881, -2.524324, 0.03921569, 1, 0, 1,
-0.4621125, -1.231217, -1.743025, 0.03137255, 1, 0, 1,
-0.4607961, -1.048849, -2.029063, 0.02745098, 1, 0, 1,
-0.4605344, -0.4628991, -2.497431, 0.01960784, 1, 0, 1,
-0.4595708, 0.2692771, 0.2642763, 0.01568628, 1, 0, 1,
-0.4569682, -0.8390957, -3.323099, 0.007843138, 1, 0, 1,
-0.4497164, 0.4384887, -2.984474, 0.003921569, 1, 0, 1,
-0.4491778, -0.4847859, -2.533618, 0, 1, 0.003921569, 1,
-0.4478453, 0.02399792, -2.63905, 0, 1, 0.01176471, 1,
-0.4422017, -0.3664315, -1.294839, 0, 1, 0.01568628, 1,
-0.4264386, 0.1374638, 0.007133368, 0, 1, 0.02352941, 1,
-0.4247693, 0.2379632, -3.118112, 0, 1, 0.02745098, 1,
-0.4245957, -0.3800944, -3.581193, 0, 1, 0.03529412, 1,
-0.4218574, -0.5757794, -1.95483, 0, 1, 0.03921569, 1,
-0.4213384, 1.176339, 0.04030792, 0, 1, 0.04705882, 1,
-0.4196123, 0.1764866, -1.352666, 0, 1, 0.05098039, 1,
-0.4180917, 0.6371621, 0.5023386, 0, 1, 0.05882353, 1,
-0.4168858, -0.5588079, -2.875809, 0, 1, 0.0627451, 1,
-0.4157979, 1.895397, -1.420608, 0, 1, 0.07058824, 1,
-0.4108949, -0.6333156, -2.254589, 0, 1, 0.07450981, 1,
-0.4097745, 0.4351431, -0.7209131, 0, 1, 0.08235294, 1,
-0.4050407, -0.1594302, -1.901621, 0, 1, 0.08627451, 1,
-0.4032097, 0.1892496, -1.714599, 0, 1, 0.09411765, 1,
-0.399734, 0.008115268, -0.4137408, 0, 1, 0.1019608, 1,
-0.3932641, 0.2250573, -0.2881362, 0, 1, 0.1058824, 1,
-0.392369, -0.5133677, -4.161714, 0, 1, 0.1137255, 1,
-0.3884879, 1.009871, -1.893224, 0, 1, 0.1176471, 1,
-0.3831407, -0.02813089, -2.407877, 0, 1, 0.1254902, 1,
-0.3712976, -1.553168, -2.448961, 0, 1, 0.1294118, 1,
-0.3686869, 1.243414, 0.3713465, 0, 1, 0.1372549, 1,
-0.3651014, -0.2231224, -4.76545, 0, 1, 0.1411765, 1,
-0.3650185, 0.8890769, -0.5456626, 0, 1, 0.1490196, 1,
-0.358784, 0.8025536, 0.09652557, 0, 1, 0.1529412, 1,
-0.3518538, 0.6017786, 1.520815, 0, 1, 0.1607843, 1,
-0.3508621, 0.4323426, -1.452039, 0, 1, 0.1647059, 1,
-0.3501846, 0.220857, -0.7252098, 0, 1, 0.172549, 1,
-0.3431326, 0.2538257, -0.2262143, 0, 1, 0.1764706, 1,
-0.33758, 0.6274379, 0.637431, 0, 1, 0.1843137, 1,
-0.3330505, -0.7585416, -2.188901, 0, 1, 0.1882353, 1,
-0.3321806, 0.2996741, -0.8686023, 0, 1, 0.1960784, 1,
-0.3295214, 0.9452977, -0.05757344, 0, 1, 0.2039216, 1,
-0.3274834, 0.5599645, -1.662614, 0, 1, 0.2078431, 1,
-0.3267531, -1.032401, -3.008549, 0, 1, 0.2156863, 1,
-0.3253273, -1.837345, -2.135363, 0, 1, 0.2196078, 1,
-0.3252826, -0.829163, -4.000751, 0, 1, 0.227451, 1,
-0.3235054, 2.311781, -0.2098454, 0, 1, 0.2313726, 1,
-0.3198442, -1.045889, -3.983982, 0, 1, 0.2392157, 1,
-0.3132508, 0.4520033, -0.6152348, 0, 1, 0.2431373, 1,
-0.3122475, 2.212797, -0.6233872, 0, 1, 0.2509804, 1,
-0.3104213, 1.127617, -0.8377115, 0, 1, 0.254902, 1,
-0.3100959, 0.4329862, -1.621564, 0, 1, 0.2627451, 1,
-0.309666, -0.1735718, -1.770177, 0, 1, 0.2666667, 1,
-0.3068409, -1.295013, -2.431031, 0, 1, 0.2745098, 1,
-0.2939159, 0.1614005, -1.547962, 0, 1, 0.2784314, 1,
-0.2888877, -0.6518914, -1.959548, 0, 1, 0.2862745, 1,
-0.2873947, 1.859534, 0.6532282, 0, 1, 0.2901961, 1,
-0.2868851, -1.693379, -3.131513, 0, 1, 0.2980392, 1,
-0.2851675, 0.2685373, -0.9207572, 0, 1, 0.3058824, 1,
-0.2840702, -0.38613, -2.492117, 0, 1, 0.3098039, 1,
-0.2772779, -1.577698, -2.40382, 0, 1, 0.3176471, 1,
-0.2741072, -0.5507207, -2.562416, 0, 1, 0.3215686, 1,
-0.2715875, -1.391382, -4.691552, 0, 1, 0.3294118, 1,
-0.2704459, 0.7755903, 0.5251952, 0, 1, 0.3333333, 1,
-0.2699869, -0.1274655, -0.6460924, 0, 1, 0.3411765, 1,
-0.267415, 0.2904062, -2.87612, 0, 1, 0.345098, 1,
-0.2671451, -0.1689674, -1.954021, 0, 1, 0.3529412, 1,
-0.2659789, 2.577156, 0.9531085, 0, 1, 0.3568628, 1,
-0.2650568, -1.183501, -3.891113, 0, 1, 0.3647059, 1,
-0.2635862, 0.3989529, -1.243471, 0, 1, 0.3686275, 1,
-0.2634944, 0.5422129, 0.8509257, 0, 1, 0.3764706, 1,
-0.2631075, 0.6075527, -0.1683155, 0, 1, 0.3803922, 1,
-0.2628153, 0.4032472, -2.517674, 0, 1, 0.3882353, 1,
-0.261555, 1.307401, -3.02222, 0, 1, 0.3921569, 1,
-0.2589963, 0.06629245, -1.761379, 0, 1, 0.4, 1,
-0.257125, -0.2308975, -0.9979075, 0, 1, 0.4078431, 1,
-0.2499371, 0.2715189, 0.5527623, 0, 1, 0.4117647, 1,
-0.2480423, -0.3556602, -2.399486, 0, 1, 0.4196078, 1,
-0.2470216, -0.2524335, -2.196217, 0, 1, 0.4235294, 1,
-0.2448286, 0.9808272, -1.150621, 0, 1, 0.4313726, 1,
-0.241557, 1.347089, -0.3909984, 0, 1, 0.4352941, 1,
-0.2404777, 0.1170488, 0.5447258, 0, 1, 0.4431373, 1,
-0.2392678, 1.558344, -1.134786, 0, 1, 0.4470588, 1,
-0.2375232, 0.5566409, -2.285122, 0, 1, 0.454902, 1,
-0.2354511, 0.1184026, 0.8278001, 0, 1, 0.4588235, 1,
-0.2312408, 0.5100245, -2.761134, 0, 1, 0.4666667, 1,
-0.2294324, -1.400759, -1.817212, 0, 1, 0.4705882, 1,
-0.2288242, 0.6219148, -0.4577348, 0, 1, 0.4784314, 1,
-0.2222908, 1.659616, -0.7818564, 0, 1, 0.4823529, 1,
-0.2183834, 2.197983, -0.856478, 0, 1, 0.4901961, 1,
-0.2180564, 1.657694, -1.321141, 0, 1, 0.4941176, 1,
-0.2131723, 0.08721554, 1.453223, 0, 1, 0.5019608, 1,
-0.2075382, 0.5221246, 0.4262459, 0, 1, 0.509804, 1,
-0.2056331, -0.5746116, -3.230375, 0, 1, 0.5137255, 1,
-0.2055662, -0.1905765, -2.032575, 0, 1, 0.5215687, 1,
-0.2011061, -0.8540781, -2.275956, 0, 1, 0.5254902, 1,
-0.1994819, 0.01793753, -2.413483, 0, 1, 0.5333334, 1,
-0.1953832, 0.08298614, -3.792185, 0, 1, 0.5372549, 1,
-0.1953228, 1.212291, 0.5479102, 0, 1, 0.5450981, 1,
-0.1942434, -0.4473279, -3.549541, 0, 1, 0.5490196, 1,
-0.1934261, -0.9077971, -0.8587306, 0, 1, 0.5568628, 1,
-0.1930381, 0.1792728, -0.8581501, 0, 1, 0.5607843, 1,
-0.1920269, 1.073492, -0.2879904, 0, 1, 0.5686275, 1,
-0.189918, 0.1046598, -1.479289, 0, 1, 0.572549, 1,
-0.1881938, 1.000803, 0.5706455, 0, 1, 0.5803922, 1,
-0.1828621, -1.096454, -1.258806, 0, 1, 0.5843138, 1,
-0.1764765, 0.02628641, -2.172524, 0, 1, 0.5921569, 1,
-0.1758524, 0.6968793, 1.210716, 0, 1, 0.5960785, 1,
-0.1754453, 0.4988582, 1.155584, 0, 1, 0.6039216, 1,
-0.1732645, -0.6983156, -3.348676, 0, 1, 0.6117647, 1,
-0.1674797, -0.04110798, -2.234538, 0, 1, 0.6156863, 1,
-0.166072, -0.8953714, -4.004292, 0, 1, 0.6235294, 1,
-0.1640001, 0.4416998, 0.02507856, 0, 1, 0.627451, 1,
-0.1619817, -0.9370238, -2.421994, 0, 1, 0.6352941, 1,
-0.1600789, -1.640029, -3.827393, 0, 1, 0.6392157, 1,
-0.1583041, -1.156889, -3.300717, 0, 1, 0.6470588, 1,
-0.156196, -0.8291833, -2.839837, 0, 1, 0.6509804, 1,
-0.1487843, 0.1908809, -1.783683, 0, 1, 0.6588235, 1,
-0.1475686, -0.8295213, -3.143862, 0, 1, 0.6627451, 1,
-0.1464497, -0.7393897, -1.653626, 0, 1, 0.6705883, 1,
-0.1429634, 0.9772479, 0.01042693, 0, 1, 0.6745098, 1,
-0.1421352, 0.08033504, -2.18064, 0, 1, 0.682353, 1,
-0.1412118, 1.137701, 1.092597, 0, 1, 0.6862745, 1,
-0.1401144, 0.4410459, -1.272639, 0, 1, 0.6941177, 1,
-0.1369597, 0.9292344, 0.3054273, 0, 1, 0.7019608, 1,
-0.1358282, -0.7914687, -3.037785, 0, 1, 0.7058824, 1,
-0.1335285, -1.925457, -3.366172, 0, 1, 0.7137255, 1,
-0.1334489, 0.621284, -0.2297604, 0, 1, 0.7176471, 1,
-0.1213574, 0.6422332, 0.5645939, 0, 1, 0.7254902, 1,
-0.1203352, -0.1219218, -2.163107, 0, 1, 0.7294118, 1,
-0.1174055, -0.2056635, -1.31259, 0, 1, 0.7372549, 1,
-0.1152263, 0.3832377, -0.3479185, 0, 1, 0.7411765, 1,
-0.1145455, 0.4142217, -1.357393, 0, 1, 0.7490196, 1,
-0.1139001, -1.421946, -3.490364, 0, 1, 0.7529412, 1,
-0.1131094, -1.22725, -2.794297, 0, 1, 0.7607843, 1,
-0.1110247, -1.404077, -2.594865, 0, 1, 0.7647059, 1,
-0.1039333, 0.2519702, -0.4761188, 0, 1, 0.772549, 1,
-0.1035428, -0.1556639, -3.234334, 0, 1, 0.7764706, 1,
-0.1018885, -0.4836521, -2.285915, 0, 1, 0.7843137, 1,
-0.09848801, -0.9158853, -2.26544, 0, 1, 0.7882353, 1,
-0.09455159, 0.4458388, 2.550393, 0, 1, 0.7960784, 1,
-0.09410798, 0.6662131, -1.852507, 0, 1, 0.8039216, 1,
-0.08827899, -1.028851, -2.318111, 0, 1, 0.8078431, 1,
-0.08610904, 0.8346867, -1.894273, 0, 1, 0.8156863, 1,
-0.08568224, 0.4131061, 0.8356478, 0, 1, 0.8196079, 1,
-0.0849308, -2.999542, -4.813366, 0, 1, 0.827451, 1,
-0.08132578, 0.6458674, 1.98354, 0, 1, 0.8313726, 1,
-0.07485418, -0.8418989, -3.607367, 0, 1, 0.8392157, 1,
-0.07476325, 2.290735, 0.2790324, 0, 1, 0.8431373, 1,
-0.07067212, -0.221205, -1.453461, 0, 1, 0.8509804, 1,
-0.06671982, -0.9312773, -3.171324, 0, 1, 0.854902, 1,
-0.0636906, 0.9058446, -0.2105982, 0, 1, 0.8627451, 1,
-0.06238859, -0.5605128, -0.9249899, 0, 1, 0.8666667, 1,
-0.06069469, -0.835001, -2.484875, 0, 1, 0.8745098, 1,
-0.0597584, -1.198031, -2.369271, 0, 1, 0.8784314, 1,
-0.04594639, -1.071768, -0.7577359, 0, 1, 0.8862745, 1,
-0.04357582, -0.4720426, -3.400377, 0, 1, 0.8901961, 1,
-0.04081494, -0.9763157, -2.539074, 0, 1, 0.8980392, 1,
-0.03894782, -0.6846745, -3.133565, 0, 1, 0.9058824, 1,
-0.03846142, -0.4688798, -2.750233, 0, 1, 0.9098039, 1,
-0.03229816, 0.2677492, -2.537348, 0, 1, 0.9176471, 1,
-0.02807048, -1.225063, -3.624142, 0, 1, 0.9215686, 1,
-0.02577136, -0.2352964, -3.795164, 0, 1, 0.9294118, 1,
-0.02507091, 0.2661056, -1.855305, 0, 1, 0.9333333, 1,
-0.02117519, -0.3438427, -3.26126, 0, 1, 0.9411765, 1,
-0.02082621, 0.3135346, 0.16857, 0, 1, 0.945098, 1,
-0.01711949, -0.5736787, -2.171171, 0, 1, 0.9529412, 1,
-0.01636645, 0.6541106, -0.6701748, 0, 1, 0.9568627, 1,
-0.01175284, 1.855499, -0.3700783, 0, 1, 0.9647059, 1,
-0.01072147, -0.4228965, -3.05571, 0, 1, 0.9686275, 1,
-0.006113383, -0.6359598, -3.713877, 0, 1, 0.9764706, 1,
-0.005839084, -0.2740538, -3.965767, 0, 1, 0.9803922, 1,
-0.005554154, -1.056516, -3.338316, 0, 1, 0.9882353, 1,
-0.004097415, -0.3541608, -3.075024, 0, 1, 0.9921569, 1,
-0.002894269, 1.396721, 1.105562, 0, 1, 1, 1,
0.001430139, 0.5958145, 0.004188118, 0, 0.9921569, 1, 1,
0.001560432, -0.02534585, 2.381469, 0, 0.9882353, 1, 1,
0.001687224, 1.751651, 0.2599574, 0, 0.9803922, 1, 1,
0.002481085, -0.7923028, 0.6623481, 0, 0.9764706, 1, 1,
0.004343548, 1.285625, -0.7609743, 0, 0.9686275, 1, 1,
0.004922201, 0.7678954, -1.535747, 0, 0.9647059, 1, 1,
0.005417801, 0.3961471, -0.3801147, 0, 0.9568627, 1, 1,
0.007750945, -1.306122, 3.414875, 0, 0.9529412, 1, 1,
0.009731804, 0.2352583, 0.2067959, 0, 0.945098, 1, 1,
0.01008871, -0.8633599, 4.82313, 0, 0.9411765, 1, 1,
0.01483789, -0.6480497, 2.337056, 0, 0.9333333, 1, 1,
0.01512057, 0.1969575, 0.668802, 0, 0.9294118, 1, 1,
0.01733558, -1.923979, 3.28602, 0, 0.9215686, 1, 1,
0.01771371, -0.7049726, 2.283954, 0, 0.9176471, 1, 1,
0.0183639, 0.8837808, -3.574878, 0, 0.9098039, 1, 1,
0.02220421, 0.7200909, 0.2639956, 0, 0.9058824, 1, 1,
0.02606127, 1.421235, 1.9102, 0, 0.8980392, 1, 1,
0.0260729, 0.2213412, -0.5012015, 0, 0.8901961, 1, 1,
0.02713584, -0.8880658, 3.22113, 0, 0.8862745, 1, 1,
0.02718549, 0.5206127, 0.7101568, 0, 0.8784314, 1, 1,
0.03347544, 0.8713018, -0.4184909, 0, 0.8745098, 1, 1,
0.03363122, -0.1117242, 4.37385, 0, 0.8666667, 1, 1,
0.03825178, -0.6389369, 3.02175, 0, 0.8627451, 1, 1,
0.03924407, 0.1838563, 0.8017496, 0, 0.854902, 1, 1,
0.04239507, -1.203689, 4.26126, 0, 0.8509804, 1, 1,
0.04447788, -2.11768, 2.041299, 0, 0.8431373, 1, 1,
0.04448891, 0.3455122, -0.004711398, 0, 0.8392157, 1, 1,
0.05204591, 0.2481334, 1.863243, 0, 0.8313726, 1, 1,
0.05374025, -1.545829, 3.994419, 0, 0.827451, 1, 1,
0.05620277, -2.319602, 3.574391, 0, 0.8196079, 1, 1,
0.06021063, -0.7472384, 3.636922, 0, 0.8156863, 1, 1,
0.06432693, 0.4741057, 1.631926, 0, 0.8078431, 1, 1,
0.06814764, -0.1237542, 4.353485, 0, 0.8039216, 1, 1,
0.06855277, -0.7102934, 2.239773, 0, 0.7960784, 1, 1,
0.07244777, -1.218608, 2.463053, 0, 0.7882353, 1, 1,
0.07365825, -0.4215639, 3.905735, 0, 0.7843137, 1, 1,
0.0780521, 0.7786246, -0.08661998, 0, 0.7764706, 1, 1,
0.08607426, -1.700358, 3.180039, 0, 0.772549, 1, 1,
0.08748263, -0.4897633, 3.424817, 0, 0.7647059, 1, 1,
0.08829592, -1.174715, 1.017202, 0, 0.7607843, 1, 1,
0.1007412, -0.9072139, 3.831591, 0, 0.7529412, 1, 1,
0.1031859, 0.9751491, 0.4021315, 0, 0.7490196, 1, 1,
0.1094733, -0.8675088, 2.384918, 0, 0.7411765, 1, 1,
0.1097185, -0.01503867, 1.509831, 0, 0.7372549, 1, 1,
0.1137138, 0.1454376, 0.6519753, 0, 0.7294118, 1, 1,
0.1138778, -0.8143463, 2.195562, 0, 0.7254902, 1, 1,
0.1161637, -0.06523756, 2.23473, 0, 0.7176471, 1, 1,
0.1167984, 1.134576, -0.1282137, 0, 0.7137255, 1, 1,
0.1185201, 0.233372, 1.632799, 0, 0.7058824, 1, 1,
0.1228318, -0.6026428, 2.33076, 0, 0.6980392, 1, 1,
0.1263665, 0.8664479, -0.8279238, 0, 0.6941177, 1, 1,
0.1279896, -1.042081, 3.340538, 0, 0.6862745, 1, 1,
0.1283077, 1.676813, -1.43585, 0, 0.682353, 1, 1,
0.1287795, 0.3899871, 0.431926, 0, 0.6745098, 1, 1,
0.1320812, -0.3331703, 4.191587, 0, 0.6705883, 1, 1,
0.1383544, -0.9260977, 2.80856, 0, 0.6627451, 1, 1,
0.1384308, -1.127037, 3.188102, 0, 0.6588235, 1, 1,
0.1390975, 0.6325125, 1.692927, 0, 0.6509804, 1, 1,
0.1427391, 0.8561163, -0.7356747, 0, 0.6470588, 1, 1,
0.1443539, -1.07487, 1.490729, 0, 0.6392157, 1, 1,
0.1457682, 0.6665962, -0.08045523, 0, 0.6352941, 1, 1,
0.1486072, -0.1991189, 4.327434, 0, 0.627451, 1, 1,
0.1498971, -0.2948917, 1.751827, 0, 0.6235294, 1, 1,
0.1520182, -0.3265809, 2.821914, 0, 0.6156863, 1, 1,
0.1546909, -0.262655, 1.930097, 0, 0.6117647, 1, 1,
0.1566936, 1.264741, 1.105476, 0, 0.6039216, 1, 1,
0.1570393, 0.5276657, 0.2946455, 0, 0.5960785, 1, 1,
0.1584898, 2.303401, -0.1455622, 0, 0.5921569, 1, 1,
0.1615014, 1.608485, -0.353563, 0, 0.5843138, 1, 1,
0.1647661, -1.574582, 2.91361, 0, 0.5803922, 1, 1,
0.1658578, -0.159987, 1.784946, 0, 0.572549, 1, 1,
0.1663961, 0.9402684, -0.3489793, 0, 0.5686275, 1, 1,
0.168305, -0.1395211, 0.444567, 0, 0.5607843, 1, 1,
0.1709487, 2.791805, 2.177984, 0, 0.5568628, 1, 1,
0.1715976, -0.1670353, 0.9739749, 0, 0.5490196, 1, 1,
0.1753097, -1.806481, 2.86269, 0, 0.5450981, 1, 1,
0.1771114, -0.4489858, 1.489768, 0, 0.5372549, 1, 1,
0.1777242, 0.8940933, 1.171931, 0, 0.5333334, 1, 1,
0.1824813, -0.3653391, 0.299686, 0, 0.5254902, 1, 1,
0.182551, -0.3783468, 1.656296, 0, 0.5215687, 1, 1,
0.1835494, -0.2004538, 2.163003, 0, 0.5137255, 1, 1,
0.1891855, 0.6424015, 0.5693513, 0, 0.509804, 1, 1,
0.1963344, -0.275115, 3.092525, 0, 0.5019608, 1, 1,
0.1973826, -0.01052412, 1.418276, 0, 0.4941176, 1, 1,
0.2004885, -0.1685686, 1.340592, 0, 0.4901961, 1, 1,
0.2007294, 0.008962987, -0.6619001, 0, 0.4823529, 1, 1,
0.201069, 1.628275, 1.154926, 0, 0.4784314, 1, 1,
0.2026338, 0.04820221, 1.584293, 0, 0.4705882, 1, 1,
0.2047171, 0.3395074, 2.391278, 0, 0.4666667, 1, 1,
0.2050247, 1.255826, 0.05779066, 0, 0.4588235, 1, 1,
0.2079885, -0.6321304, 3.88198, 0, 0.454902, 1, 1,
0.208638, 0.8771149, 0.9574719, 0, 0.4470588, 1, 1,
0.2107709, 0.4235331, 1.080066, 0, 0.4431373, 1, 1,
0.2124691, -0.0583066, 3.013615, 0, 0.4352941, 1, 1,
0.2170365, -0.3079315, 2.145878, 0, 0.4313726, 1, 1,
0.220344, 1.106491, -0.05207513, 0, 0.4235294, 1, 1,
0.2209198, -2.241753, 3.265443, 0, 0.4196078, 1, 1,
0.2221277, -0.07044043, 1.180422, 0, 0.4117647, 1, 1,
0.2264419, -0.4392387, 2.769788, 0, 0.4078431, 1, 1,
0.2268684, -0.1697017, 2.055733, 0, 0.4, 1, 1,
0.2290283, -1.617226, 3.621271, 0, 0.3921569, 1, 1,
0.2301802, 0.6906338, -1.182763, 0, 0.3882353, 1, 1,
0.2304567, -0.2252137, 1.616186, 0, 0.3803922, 1, 1,
0.2314446, 1.545177, 1.155719, 0, 0.3764706, 1, 1,
0.2330518, 0.2409304, 1.493551, 0, 0.3686275, 1, 1,
0.2377887, 0.1021943, 1.01297, 0, 0.3647059, 1, 1,
0.2458508, 0.1297466, 2.265576, 0, 0.3568628, 1, 1,
0.2481793, -0.8261394, 0.7407757, 0, 0.3529412, 1, 1,
0.249513, -0.8215545, 2.827544, 0, 0.345098, 1, 1,
0.2501676, -1.150239, 0.7881944, 0, 0.3411765, 1, 1,
0.2527213, -0.2831586, 3.073068, 0, 0.3333333, 1, 1,
0.2553789, -0.04776238, 1.535856, 0, 0.3294118, 1, 1,
0.2568894, 0.3890028, 1.105683, 0, 0.3215686, 1, 1,
0.2569223, 0.3475417, 0.6314414, 0, 0.3176471, 1, 1,
0.2569486, 1.395584, 0.7447312, 0, 0.3098039, 1, 1,
0.2611475, 1.688928, -0.9373196, 0, 0.3058824, 1, 1,
0.2726585, 1.181328, -0.4283338, 0, 0.2980392, 1, 1,
0.2734621, 0.6093123, 0.396453, 0, 0.2901961, 1, 1,
0.2754171, -0.6268356, 1.573177, 0, 0.2862745, 1, 1,
0.2768463, -1.049858, 3.895611, 0, 0.2784314, 1, 1,
0.2769386, -0.9860252, 4.308173, 0, 0.2745098, 1, 1,
0.2792414, 0.372552, 0.52423, 0, 0.2666667, 1, 1,
0.2792461, 1.040615, 1.426072, 0, 0.2627451, 1, 1,
0.2810773, -0.2692493, 2.215507, 0, 0.254902, 1, 1,
0.2846367, 0.5978081, 1.686165, 0, 0.2509804, 1, 1,
0.2865171, -0.0810314, 2.629147, 0, 0.2431373, 1, 1,
0.2887633, -0.9362602, 3.223427, 0, 0.2392157, 1, 1,
0.2891353, -0.6967463, 4.321791, 0, 0.2313726, 1, 1,
0.2986355, 0.6361209, 0.2109026, 0, 0.227451, 1, 1,
0.2990143, -1.806245, 3.5794, 0, 0.2196078, 1, 1,
0.300699, -1.168104, 2.408719, 0, 0.2156863, 1, 1,
0.301871, -2.184335, 1.882195, 0, 0.2078431, 1, 1,
0.3032742, -0.3509988, 4.766637, 0, 0.2039216, 1, 1,
0.3058135, 0.1851151, -1.322243, 0, 0.1960784, 1, 1,
0.3107014, -0.8297639, 1.921099, 0, 0.1882353, 1, 1,
0.3122024, -0.5055147, 0.8617425, 0, 0.1843137, 1, 1,
0.3146152, -0.06231824, 1.008549, 0, 0.1764706, 1, 1,
0.3177104, 0.1962997, -0.5463008, 0, 0.172549, 1, 1,
0.3195162, -0.4007676, 3.517097, 0, 0.1647059, 1, 1,
0.3283437, 0.6455422, 0.3560186, 0, 0.1607843, 1, 1,
0.3289101, -0.323659, 4.968983, 0, 0.1529412, 1, 1,
0.3292252, -0.9572161, 2.918175, 0, 0.1490196, 1, 1,
0.3310446, -1.715115, 2.992602, 0, 0.1411765, 1, 1,
0.3315533, 0.3747942, 1.382598, 0, 0.1372549, 1, 1,
0.3366912, -0.8200734, 2.739552, 0, 0.1294118, 1, 1,
0.3442249, 0.2434776, 1.579034, 0, 0.1254902, 1, 1,
0.349314, -2.241075, 1.942374, 0, 0.1176471, 1, 1,
0.3496121, -2.481247, 5.309348, 0, 0.1137255, 1, 1,
0.3508295, -0.2806756, 2.456375, 0, 0.1058824, 1, 1,
0.3542175, -0.08578079, 4.399857, 0, 0.09803922, 1, 1,
0.3561419, -0.9512441, 2.741957, 0, 0.09411765, 1, 1,
0.3576232, -1.307906, 4.783312, 0, 0.08627451, 1, 1,
0.3662429, 0.03139411, 1.595315, 0, 0.08235294, 1, 1,
0.3677823, -0.06070499, 1.466707, 0, 0.07450981, 1, 1,
0.371372, -0.1835966, 2.067969, 0, 0.07058824, 1, 1,
0.3824852, -0.3079194, 3.100805, 0, 0.0627451, 1, 1,
0.3840187, -0.2073069, 1.304871, 0, 0.05882353, 1, 1,
0.3864785, 0.2889416, 2.692929, 0, 0.05098039, 1, 1,
0.3971122, -0.3769079, 2.465278, 0, 0.04705882, 1, 1,
0.3990325, 0.691989, 0.09552365, 0, 0.03921569, 1, 1,
0.401056, 0.8010653, -0.2364014, 0, 0.03529412, 1, 1,
0.4023513, -0.7145364, 2.739168, 0, 0.02745098, 1, 1,
0.4047337, 0.6731485, 0.9778752, 0, 0.02352941, 1, 1,
0.4075124, -1.141829, 1.277519, 0, 0.01568628, 1, 1,
0.4084104, -1.898723, 3.913415, 0, 0.01176471, 1, 1,
0.4099494, -0.1596939, 0.9438567, 0, 0.003921569, 1, 1,
0.4101202, -0.3009949, 2.89623, 0.003921569, 0, 1, 1,
0.4117405, -0.3374004, 1.880811, 0.007843138, 0, 1, 1,
0.4180728, -0.8458239, 2.493568, 0.01568628, 0, 1, 1,
0.4206345, 0.5386468, -0.3019234, 0.01960784, 0, 1, 1,
0.424627, -0.7193889, 2.834338, 0.02745098, 0, 1, 1,
0.4256263, -0.6966032, 3.395749, 0.03137255, 0, 1, 1,
0.4273641, -0.684983, 3.14228, 0.03921569, 0, 1, 1,
0.4330834, -1.326133, 1.239068, 0.04313726, 0, 1, 1,
0.4348786, 0.8396045, 1.632362, 0.05098039, 0, 1, 1,
0.4354712, 2.093955, -0.9091322, 0.05490196, 0, 1, 1,
0.4405769, -1.15205, 3.462411, 0.0627451, 0, 1, 1,
0.4432543, -1.020111, 3.580961, 0.06666667, 0, 1, 1,
0.4448016, -0.06631166, 3.920476, 0.07450981, 0, 1, 1,
0.4449035, 0.6562735, 1.142137, 0.07843138, 0, 1, 1,
0.4454575, 0.08062836, 3.623034, 0.08627451, 0, 1, 1,
0.4479215, 0.8746941, 0.03078061, 0.09019608, 0, 1, 1,
0.4497056, -0.6749698, 1.882017, 0.09803922, 0, 1, 1,
0.467029, 0.322318, 0.9877013, 0.1058824, 0, 1, 1,
0.46905, 0.944864, -0.01831562, 0.1098039, 0, 1, 1,
0.473965, -0.9496258, 2.080332, 0.1176471, 0, 1, 1,
0.4820673, 1.45402, -1.055024, 0.1215686, 0, 1, 1,
0.4860795, 0.731999, -1.92781, 0.1294118, 0, 1, 1,
0.4943599, 1.026007, 0.4250327, 0.1333333, 0, 1, 1,
0.4949608, -0.03603703, 3.86613, 0.1411765, 0, 1, 1,
0.4983438, 0.9384302, 0.4808769, 0.145098, 0, 1, 1,
0.5022511, 1.522556, -0.3903511, 0.1529412, 0, 1, 1,
0.5085598, 1.827328, 1.319488, 0.1568628, 0, 1, 1,
0.5105212, 0.6767021, 1.18621, 0.1647059, 0, 1, 1,
0.5151615, 0.1693673, 0.3778568, 0.1686275, 0, 1, 1,
0.5158215, 1.522927, -0.7113407, 0.1764706, 0, 1, 1,
0.5171168, -0.6746809, 1.262035, 0.1803922, 0, 1, 1,
0.5230637, 0.501627, 1.015252, 0.1882353, 0, 1, 1,
0.5256929, 0.5548715, -1.731526, 0.1921569, 0, 1, 1,
0.5259383, -1.605368, 2.456489, 0.2, 0, 1, 1,
0.527588, 0.05832377, 1.996819, 0.2078431, 0, 1, 1,
0.5277269, -0.08630858, 0.7109654, 0.2117647, 0, 1, 1,
0.5279057, -0.3819549, 2.00804, 0.2196078, 0, 1, 1,
0.5285517, -0.6549013, 2.399098, 0.2235294, 0, 1, 1,
0.530846, -0.2924982, 2.815245, 0.2313726, 0, 1, 1,
0.5339336, -0.4948115, 3.31339, 0.2352941, 0, 1, 1,
0.5362263, -0.8504155, 2.768799, 0.2431373, 0, 1, 1,
0.5388746, 0.324197, 1.761433, 0.2470588, 0, 1, 1,
0.5446323, 0.4371621, 0.1506059, 0.254902, 0, 1, 1,
0.5460205, 0.9498152, 0.06694788, 0.2588235, 0, 1, 1,
0.5468383, 2.717932, -1.017228, 0.2666667, 0, 1, 1,
0.5517024, -0.6541418, 3.660885, 0.2705882, 0, 1, 1,
0.5522555, 1.824809, -0.5815704, 0.2784314, 0, 1, 1,
0.5550401, 0.3225622, 0.300605, 0.282353, 0, 1, 1,
0.5620788, 0.7593047, 0.2678533, 0.2901961, 0, 1, 1,
0.5625098, -0.6314325, 4.412542, 0.2941177, 0, 1, 1,
0.5626453, -0.875823, 2.69242, 0.3019608, 0, 1, 1,
0.5633703, -1.050821, 1.896592, 0.3098039, 0, 1, 1,
0.5634928, -1.378759, 2.600544, 0.3137255, 0, 1, 1,
0.5704136, -0.3044894, 2.880098, 0.3215686, 0, 1, 1,
0.5752237, 1.853382, -0.1392192, 0.3254902, 0, 1, 1,
0.5849891, 1.27049, -0.9421706, 0.3333333, 0, 1, 1,
0.5850933, 0.7290825, -0.2952842, 0.3372549, 0, 1, 1,
0.5871938, 0.7225735, 0.1012502, 0.345098, 0, 1, 1,
0.5885686, 0.7414507, 1.426628, 0.3490196, 0, 1, 1,
0.5888866, 1.165761, 1.860639, 0.3568628, 0, 1, 1,
0.5903298, 1.132409, 1.354996, 0.3607843, 0, 1, 1,
0.590908, 0.01621999, 0.5165049, 0.3686275, 0, 1, 1,
0.5940349, -3.062329, 4.409728, 0.372549, 0, 1, 1,
0.5944337, -1.129574, 2.076219, 0.3803922, 0, 1, 1,
0.5969232, -0.3827522, 1.611738, 0.3843137, 0, 1, 1,
0.5997396, 0.9699796, 0.2074437, 0.3921569, 0, 1, 1,
0.6005611, -0.9353212, 1.883579, 0.3960784, 0, 1, 1,
0.6014048, 0.05355641, 1.845782, 0.4039216, 0, 1, 1,
0.6026982, 1.239477, 1.717757, 0.4117647, 0, 1, 1,
0.6028728, -1.356251, 3.02366, 0.4156863, 0, 1, 1,
0.6049632, 0.9308962, -0.137311, 0.4235294, 0, 1, 1,
0.6065735, 0.2720389, 3.260778, 0.427451, 0, 1, 1,
0.6092195, 1.303884, 1.446818, 0.4352941, 0, 1, 1,
0.6149358, 1.424127, 1.991131, 0.4392157, 0, 1, 1,
0.6154298, -0.5206561, 2.236619, 0.4470588, 0, 1, 1,
0.6293994, -0.9017487, 3.262979, 0.4509804, 0, 1, 1,
0.6386735, -0.5900854, 5.043827, 0.4588235, 0, 1, 1,
0.6409257, 0.395704, 1.799011, 0.4627451, 0, 1, 1,
0.6425028, 0.4282911, -0.3592925, 0.4705882, 0, 1, 1,
0.6473616, -0.8773051, 2.055319, 0.4745098, 0, 1, 1,
0.651106, -1.347796, 2.507582, 0.4823529, 0, 1, 1,
0.6554101, 0.7362784, 0.1708682, 0.4862745, 0, 1, 1,
0.6560413, 0.04930417, 0.6087286, 0.4941176, 0, 1, 1,
0.6565622, -0.9761639, 3.396563, 0.5019608, 0, 1, 1,
0.6583563, 0.7557144, 1.355067, 0.5058824, 0, 1, 1,
0.6602554, -1.36913, 2.331171, 0.5137255, 0, 1, 1,
0.6619914, -0.08847079, -0.3386629, 0.5176471, 0, 1, 1,
0.6653933, -0.4467745, 1.814349, 0.5254902, 0, 1, 1,
0.6660816, -0.4147238, 2.018902, 0.5294118, 0, 1, 1,
0.6695247, 0.02153953, 2.363673, 0.5372549, 0, 1, 1,
0.6726782, 0.1310831, 0.3323092, 0.5411765, 0, 1, 1,
0.6740555, 1.568416, 0.3393031, 0.5490196, 0, 1, 1,
0.675566, 1.23449, -0.7306798, 0.5529412, 0, 1, 1,
0.6832874, 0.7424724, 0.27309, 0.5607843, 0, 1, 1,
0.6855268, 0.4296479, 1.333113, 0.5647059, 0, 1, 1,
0.68782, -0.04970192, 1.02205, 0.572549, 0, 1, 1,
0.6898798, 0.377882, 2.163163, 0.5764706, 0, 1, 1,
0.6918572, 0.3152374, 0.5058143, 0.5843138, 0, 1, 1,
0.6974771, -0.9606712, 1.967772, 0.5882353, 0, 1, 1,
0.7035419, 1.033896, 1.164826, 0.5960785, 0, 1, 1,
0.7148575, 0.5577114, 3.656434, 0.6039216, 0, 1, 1,
0.728866, -0.7641189, 0.846178, 0.6078432, 0, 1, 1,
0.7324003, -0.7260582, 1.718284, 0.6156863, 0, 1, 1,
0.740295, -1.270063, 0.512945, 0.6196079, 0, 1, 1,
0.743184, -0.7920964, 2.841525, 0.627451, 0, 1, 1,
0.746015, -1.806052, 1.783459, 0.6313726, 0, 1, 1,
0.7520718, -1.108857, 3.251842, 0.6392157, 0, 1, 1,
0.7522853, -0.5782502, 1.195943, 0.6431373, 0, 1, 1,
0.7525571, 1.513871, 0.3896929, 0.6509804, 0, 1, 1,
0.7537878, 0.8005609, 0.01684884, 0.654902, 0, 1, 1,
0.7545281, -0.1196114, 1.948938, 0.6627451, 0, 1, 1,
0.7593623, 2.57985, 0.1773825, 0.6666667, 0, 1, 1,
0.7629487, -1.573955, 3.879344, 0.6745098, 0, 1, 1,
0.763872, 0.258385, 1.175095, 0.6784314, 0, 1, 1,
0.7645212, 0.583023, 0.2702658, 0.6862745, 0, 1, 1,
0.7648852, 1.342323, 3.552694, 0.6901961, 0, 1, 1,
0.7676291, -0.7554649, 3.26889, 0.6980392, 0, 1, 1,
0.773197, 0.6433434, 0.822916, 0.7058824, 0, 1, 1,
0.7741036, -1.60702, 2.644732, 0.7098039, 0, 1, 1,
0.7744135, -0.1437627, 1.033936, 0.7176471, 0, 1, 1,
0.7749243, 1.44881, 0.9551367, 0.7215686, 0, 1, 1,
0.7768162, -0.2497535, 1.538527, 0.7294118, 0, 1, 1,
0.7811875, 0.7569304, 0.952738, 0.7333333, 0, 1, 1,
0.7866026, 0.7255453, -0.2529024, 0.7411765, 0, 1, 1,
0.7895905, 0.3185021, 0.8468974, 0.7450981, 0, 1, 1,
0.7898043, -0.4049361, 3.480744, 0.7529412, 0, 1, 1,
0.7915351, -1.161659, 2.346582, 0.7568628, 0, 1, 1,
0.7954677, -1.17737, 2.157938, 0.7647059, 0, 1, 1,
0.7973441, 0.3721563, 1.865148, 0.7686275, 0, 1, 1,
0.8070863, 1.240314, 1.003484, 0.7764706, 0, 1, 1,
0.8079102, -0.6445445, 2.021083, 0.7803922, 0, 1, 1,
0.8248843, 0.4323502, 1.008055, 0.7882353, 0, 1, 1,
0.8357119, -2.540361, 3.219148, 0.7921569, 0, 1, 1,
0.838992, 2.020544, 1.020492, 0.8, 0, 1, 1,
0.8400919, 0.1307112, 2.646412, 0.8078431, 0, 1, 1,
0.8522173, -0.001041545, 2.016905, 0.8117647, 0, 1, 1,
0.8588737, 0.7357492, 0.8388172, 0.8196079, 0, 1, 1,
0.8595901, -2.061398, 2.981055, 0.8235294, 0, 1, 1,
0.8609483, 0.7095478, 1.578562, 0.8313726, 0, 1, 1,
0.861708, 0.5173287, 0.7973014, 0.8352941, 0, 1, 1,
0.8690458, 0.4416147, 1.38099, 0.8431373, 0, 1, 1,
0.8700047, 1.111437, 0.08186944, 0.8470588, 0, 1, 1,
0.8734376, 0.9641482, 0.63363, 0.854902, 0, 1, 1,
0.8765955, 0.288314, 1.539617, 0.8588235, 0, 1, 1,
0.8790708, 1.261077, 0.08773932, 0.8666667, 0, 1, 1,
0.8823882, -1.645949, 2.897548, 0.8705882, 0, 1, 1,
0.8826172, -0.07842811, 1.170058, 0.8784314, 0, 1, 1,
0.8848508, -0.6742895, 0.5276477, 0.8823529, 0, 1, 1,
0.8885207, -1.577548, 3.244372, 0.8901961, 0, 1, 1,
0.8899863, -1.417536, 1.377286, 0.8941177, 0, 1, 1,
0.8901864, -0.2621544, 2.321841, 0.9019608, 0, 1, 1,
0.8902005, -1.050738, 2.703722, 0.9098039, 0, 1, 1,
0.8914033, -1.203711, 2.032799, 0.9137255, 0, 1, 1,
0.8950124, -2.180272, 2.839206, 0.9215686, 0, 1, 1,
0.9018697, -0.1284101, 1.340943, 0.9254902, 0, 1, 1,
0.9042197, 0.5904346, 0.9129679, 0.9333333, 0, 1, 1,
0.9052122, 2.085205, -0.264388, 0.9372549, 0, 1, 1,
0.9076667, 0.004156354, 1.637681, 0.945098, 0, 1, 1,
0.9107861, 1.36602, 0.5305316, 0.9490196, 0, 1, 1,
0.9108834, -1.391093, 2.704931, 0.9568627, 0, 1, 1,
0.9134554, -1.031233, 5.007294, 0.9607843, 0, 1, 1,
0.9135345, 1.881183, 0.9845021, 0.9686275, 0, 1, 1,
0.9195733, 0.7960861, -0.1246035, 0.972549, 0, 1, 1,
0.9200354, -0.5208127, 2.345559, 0.9803922, 0, 1, 1,
0.9200506, 1.125832, 0.2217095, 0.9843137, 0, 1, 1,
0.9238454, 0.5459672, -0.3912115, 0.9921569, 0, 1, 1,
0.9338842, 0.1585009, 1.401311, 0.9960784, 0, 1, 1,
0.9367253, 0.01875931, 2.54456, 1, 0, 0.9960784, 1,
0.939338, 0.2507263, 1.345233, 1, 0, 0.9882353, 1,
0.94554, 0.1013357, 0.399821, 1, 0, 0.9843137, 1,
0.9488345, 1.159645, -0.8319615, 1, 0, 0.9764706, 1,
0.9519264, 1.312247, 2.097951, 1, 0, 0.972549, 1,
0.9528227, -0.4979805, 1.332002, 1, 0, 0.9647059, 1,
0.9548738, 0.05885801, 0.7971078, 1, 0, 0.9607843, 1,
0.9551986, -0.2685376, 1.902468, 1, 0, 0.9529412, 1,
0.9573575, -0.569102, 1.194402, 1, 0, 0.9490196, 1,
0.9637762, 0.2060373, 0.8936655, 1, 0, 0.9411765, 1,
0.9755755, -0.6999604, 1.090973, 1, 0, 0.9372549, 1,
0.9785964, -1.301765, 2.095114, 1, 0, 0.9294118, 1,
0.981982, 0.5018854, 1.651954, 1, 0, 0.9254902, 1,
0.9821529, -1.336558, 2.356006, 1, 0, 0.9176471, 1,
0.9870394, -0.2466819, 0.831422, 1, 0, 0.9137255, 1,
0.9940491, -1.095605, 3.379552, 1, 0, 0.9058824, 1,
0.9979497, -0.1953549, 2.21568, 1, 0, 0.9019608, 1,
1.000898, -0.8935188, 2.763724, 1, 0, 0.8941177, 1,
1.00666, 2.696012, 0.2561873, 1, 0, 0.8862745, 1,
1.010648, -0.3583078, 1.340467, 1, 0, 0.8823529, 1,
1.014561, -0.7295172, 3.282616, 1, 0, 0.8745098, 1,
1.020339, -0.173048, 2.647356, 1, 0, 0.8705882, 1,
1.030605, 0.714449, 0.750532, 1, 0, 0.8627451, 1,
1.040414, 1.649997, 0.006968599, 1, 0, 0.8588235, 1,
1.044868, 0.897181, 0.4471625, 1, 0, 0.8509804, 1,
1.045565, 0.06982258, 2.571078, 1, 0, 0.8470588, 1,
1.047145, -0.5905859, 2.462839, 1, 0, 0.8392157, 1,
1.075613, -1.063266, 3.786134, 1, 0, 0.8352941, 1,
1.080087, -1.38275, 3.681147, 1, 0, 0.827451, 1,
1.081248, 1.002433, 1.707855, 1, 0, 0.8235294, 1,
1.085961, -0.5625584, 2.327639, 1, 0, 0.8156863, 1,
1.088962, -0.7768932, 4.45623, 1, 0, 0.8117647, 1,
1.090683, 0.9409196, 1.127679, 1, 0, 0.8039216, 1,
1.091601, 0.5893468, 0.5121351, 1, 0, 0.7960784, 1,
1.092232, 0.8099703, 0.599858, 1, 0, 0.7921569, 1,
1.099586, 0.795641, 0.6708283, 1, 0, 0.7843137, 1,
1.115792, -2.160886, 3.449217, 1, 0, 0.7803922, 1,
1.120098, -1.103949, 1.242509, 1, 0, 0.772549, 1,
1.127942, 1.048235, 0.7773163, 1, 0, 0.7686275, 1,
1.130515, 2.4265, 1.061734, 1, 0, 0.7607843, 1,
1.133435, 0.619536, 0.1955794, 1, 0, 0.7568628, 1,
1.136154, 0.1224229, 0.4634511, 1, 0, 0.7490196, 1,
1.14372, -0.3429652, 2.078489, 1, 0, 0.7450981, 1,
1.148855, -1.503964, 3.189493, 1, 0, 0.7372549, 1,
1.149328, 0.4529533, 2.128054, 1, 0, 0.7333333, 1,
1.152463, -0.8310398, 0.5582812, 1, 0, 0.7254902, 1,
1.16218, -1.166033, 2.279433, 1, 0, 0.7215686, 1,
1.167661, 1.769, -0.2336087, 1, 0, 0.7137255, 1,
1.167841, -0.6317291, 2.132135, 1, 0, 0.7098039, 1,
1.178585, -0.06178266, 1.715047, 1, 0, 0.7019608, 1,
1.179352, -0.5960838, 1.69683, 1, 0, 0.6941177, 1,
1.18249, 0.5329338, 1.765984, 1, 0, 0.6901961, 1,
1.188367, 1.866683, 2.384671, 1, 0, 0.682353, 1,
1.188848, -1.336271, 3.137893, 1, 0, 0.6784314, 1,
1.192825, 1.042702, 2.089675, 1, 0, 0.6705883, 1,
1.194117, 1.144959, 0.3521833, 1, 0, 0.6666667, 1,
1.194844, -0.1262021, 3.462539, 1, 0, 0.6588235, 1,
1.205086, 0.2600215, 1.531566, 1, 0, 0.654902, 1,
1.206003, -1.020953, 3.167205, 1, 0, 0.6470588, 1,
1.207569, 1.37894, 0.4152283, 1, 0, 0.6431373, 1,
1.213498, -1.732487, 2.518741, 1, 0, 0.6352941, 1,
1.217492, 1.383691, 1.272352, 1, 0, 0.6313726, 1,
1.219856, -0.3856081, 1.967194, 1, 0, 0.6235294, 1,
1.21993, 2.292033, -0.05628814, 1, 0, 0.6196079, 1,
1.227852, -0.4769626, 1.412185, 1, 0, 0.6117647, 1,
1.24869, -0.5637752, 4.105212, 1, 0, 0.6078432, 1,
1.257262, 1.25339, 1.25361, 1, 0, 0.6, 1,
1.257792, 2.025207, 1.210256, 1, 0, 0.5921569, 1,
1.264097, 0.4112754, 2.455427, 1, 0, 0.5882353, 1,
1.266813, 0.1952362, 1.262529, 1, 0, 0.5803922, 1,
1.271489, -1.110685, 2.249532, 1, 0, 0.5764706, 1,
1.276221, 0.4085593, 0.1900244, 1, 0, 0.5686275, 1,
1.276429, 0.6266325, 1.718609, 1, 0, 0.5647059, 1,
1.295061, -1.108608, 1.504362, 1, 0, 0.5568628, 1,
1.297893, 0.5377067, 1.123126, 1, 0, 0.5529412, 1,
1.30349, -0.05383343, 3.041114, 1, 0, 0.5450981, 1,
1.304445, 0.3647517, 1.44786, 1, 0, 0.5411765, 1,
1.308431, -0.3685582, 0.09446698, 1, 0, 0.5333334, 1,
1.308475, 0.009324335, 1.185845, 1, 0, 0.5294118, 1,
1.309165, -1.113404, 1.535017, 1, 0, 0.5215687, 1,
1.310378, -1.117882, 0.5611988, 1, 0, 0.5176471, 1,
1.310795, -0.7172031, 1.168201, 1, 0, 0.509804, 1,
1.323061, 0.3446805, 1.994768, 1, 0, 0.5058824, 1,
1.324262, 0.8968008, 0.6114055, 1, 0, 0.4980392, 1,
1.34312, -0.1100978, 3.552002, 1, 0, 0.4901961, 1,
1.344224, -0.2644249, 1.145784, 1, 0, 0.4862745, 1,
1.348441, -1.42546, 1.910383, 1, 0, 0.4784314, 1,
1.356737, 1.564364, 0.6659317, 1, 0, 0.4745098, 1,
1.360314, 2.316957, 1.53634, 1, 0, 0.4666667, 1,
1.365227, -0.6943454, 1.006799, 1, 0, 0.4627451, 1,
1.372705, -1.024903, 1.303612, 1, 0, 0.454902, 1,
1.37317, -0.8959559, 3.640504, 1, 0, 0.4509804, 1,
1.375606, -0.2884464, 2.961182, 1, 0, 0.4431373, 1,
1.389215, -0.08040229, 2.205246, 1, 0, 0.4392157, 1,
1.391182, 1.418347, 1.068466, 1, 0, 0.4313726, 1,
1.393014, -0.270392, 2.835218, 1, 0, 0.427451, 1,
1.410639, -0.7975191, 3.524836, 1, 0, 0.4196078, 1,
1.410742, 0.1945866, 1.892462, 1, 0, 0.4156863, 1,
1.420842, 1.520148, 0.4340622, 1, 0, 0.4078431, 1,
1.422295, -0.07494257, 2.515308, 1, 0, 0.4039216, 1,
1.430839, 0.8598498, 1.659356, 1, 0, 0.3960784, 1,
1.444024, -0.06101935, 2.448661, 1, 0, 0.3882353, 1,
1.452024, -0.3923594, 2.54972, 1, 0, 0.3843137, 1,
1.47772, -1.373081, 2.47979, 1, 0, 0.3764706, 1,
1.498783, -2.385977, 2.851043, 1, 0, 0.372549, 1,
1.499644, -0.1087971, -0.5140524, 1, 0, 0.3647059, 1,
1.502711, -0.4955967, 2.172693, 1, 0, 0.3607843, 1,
1.514698, 0.3273245, 1.450302, 1, 0, 0.3529412, 1,
1.515961, -0.7128158, 2.325382, 1, 0, 0.3490196, 1,
1.517959, -0.002021898, 0.7191582, 1, 0, 0.3411765, 1,
1.523823, -0.187406, 2.475422, 1, 0, 0.3372549, 1,
1.541608, -0.8572868, 2.203499, 1, 0, 0.3294118, 1,
1.547415, -0.9493126, 0.6164694, 1, 0, 0.3254902, 1,
1.574668, -0.4629032, 1.374232, 1, 0, 0.3176471, 1,
1.577494, -0.7445212, 0.6961182, 1, 0, 0.3137255, 1,
1.582714, -0.4647796, 2.301869, 1, 0, 0.3058824, 1,
1.586564, -0.1266839, 1.659496, 1, 0, 0.2980392, 1,
1.588417, 0.2268646, -0.4709623, 1, 0, 0.2941177, 1,
1.595539, -1.719382, 1.610844, 1, 0, 0.2862745, 1,
1.60284, 0.4773453, 0.6733426, 1, 0, 0.282353, 1,
1.606942, 0.5701303, 2.142605, 1, 0, 0.2745098, 1,
1.618381, -2.325917, 0.999561, 1, 0, 0.2705882, 1,
1.618677, -0.006791179, 1.995061, 1, 0, 0.2627451, 1,
1.635534, -0.01928779, 2.433715, 1, 0, 0.2588235, 1,
1.650613, -0.01117018, 1.49787, 1, 0, 0.2509804, 1,
1.660578, -0.9504424, 2.98897, 1, 0, 0.2470588, 1,
1.671737, -0.04726043, 3.88741, 1, 0, 0.2392157, 1,
1.685654, 3.014351, 0.3181679, 1, 0, 0.2352941, 1,
1.686602, -1.334155, 1.171638, 1, 0, 0.227451, 1,
1.688362, 1.008123, 0.1052552, 1, 0, 0.2235294, 1,
1.701824, -0.5002806, 2.549281, 1, 0, 0.2156863, 1,
1.724687, 0.06533508, 1.752905, 1, 0, 0.2117647, 1,
1.73392, 0.899729, 0.7935236, 1, 0, 0.2039216, 1,
1.75453, 0.0434148, -0.07694726, 1, 0, 0.1960784, 1,
1.761946, 2.79001, -1.278162, 1, 0, 0.1921569, 1,
1.770116, 0.8137507, -0.02922781, 1, 0, 0.1843137, 1,
1.797899, -0.04971764, 1.711646, 1, 0, 0.1803922, 1,
1.809999, -0.8801897, -0.3224188, 1, 0, 0.172549, 1,
1.810771, 0.05637668, 1.270247, 1, 0, 0.1686275, 1,
1.823567, 0.5494065, 2.677662, 1, 0, 0.1607843, 1,
1.824798, -1.232302, 1.923825, 1, 0, 0.1568628, 1,
1.847738, 1.644364, 0.1075643, 1, 0, 0.1490196, 1,
1.853325, 0.5195926, 0.6689206, 1, 0, 0.145098, 1,
1.859296, -0.2897203, 1.213177, 1, 0, 0.1372549, 1,
1.874442, 0.8113668, 1.757395, 1, 0, 0.1333333, 1,
1.879341, -0.1952545, 1.141898, 1, 0, 0.1254902, 1,
1.883972, 0.4930588, 0.3767665, 1, 0, 0.1215686, 1,
1.896916, -0.1870754, 2.798998, 1, 0, 0.1137255, 1,
1.926013, -0.9895809, 2.059701, 1, 0, 0.1098039, 1,
1.928947, -0.9225029, 2.624237, 1, 0, 0.1019608, 1,
1.940772, 2.213056, 0.3331279, 1, 0, 0.09411765, 1,
1.993877, 1.883142, 1.214958, 1, 0, 0.09019608, 1,
2.034571, -0.3770884, 0.9704387, 1, 0, 0.08235294, 1,
2.056168, 0.7065157, 0.3248186, 1, 0, 0.07843138, 1,
2.158262, -1.548759, 2.478272, 1, 0, 0.07058824, 1,
2.262073, 0.6987171, 0.6166672, 1, 0, 0.06666667, 1,
2.280637, -0.09452119, 3.821411, 1, 0, 0.05882353, 1,
2.288046, 0.2633606, 1.103917, 1, 0, 0.05490196, 1,
2.3663, 0.7086874, -0.0215797, 1, 0, 0.04705882, 1,
2.396958, -0.9488159, 2.268313, 1, 0, 0.04313726, 1,
2.402148, 0.6581769, 1.657163, 1, 0, 0.03529412, 1,
2.433172, -0.6081704, 1.483431, 1, 0, 0.03137255, 1,
2.479836, 0.7486167, 1.223277, 1, 0, 0.02352941, 1,
2.483032, 0.4452867, 1.819472, 1, 0, 0.01960784, 1,
2.54967, -0.04309316, 1.113867, 1, 0, 0.01176471, 1,
2.745064, 1.366097, 0.6952039, 1, 0, 0.007843138, 1
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
-0.4822087, -4.141283, -6.529166, 0, -0.5, 0.5, 0.5,
-0.4822087, -4.141283, -6.529166, 1, -0.5, 0.5, 0.5,
-0.4822087, -4.141283, -6.529166, 1, 1.5, 0.5, 0.5,
-0.4822087, -4.141283, -6.529166, 0, 1.5, 0.5, 0.5
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
-4.803526, -0.04491949, -6.529166, 0, -0.5, 0.5, 0.5,
-4.803526, -0.04491949, -6.529166, 1, -0.5, 0.5, 0.5,
-4.803526, -0.04491949, -6.529166, 1, 1.5, 0.5, 0.5,
-4.803526, -0.04491949, -6.529166, 0, 1.5, 0.5, 0.5
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
-4.803526, -4.141283, 0.2479908, 0, -0.5, 0.5, 0.5,
-4.803526, -4.141283, 0.2479908, 1, -0.5, 0.5, 0.5,
-4.803526, -4.141283, 0.2479908, 1, 1.5, 0.5, 0.5,
-4.803526, -4.141283, 0.2479908, 0, 1.5, 0.5, 0.5
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
-3, -3.195968, -4.965207,
2, -3.195968, -4.965207,
-3, -3.195968, -4.965207,
-3, -3.353521, -5.225866,
-2, -3.195968, -4.965207,
-2, -3.353521, -5.225866,
-1, -3.195968, -4.965207,
-1, -3.353521, -5.225866,
0, -3.195968, -4.965207,
0, -3.353521, -5.225866,
1, -3.195968, -4.965207,
1, -3.353521, -5.225866,
2, -3.195968, -4.965207,
2, -3.353521, -5.225866
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
-3, -3.668626, -5.747186, 0, -0.5, 0.5, 0.5,
-3, -3.668626, -5.747186, 1, -0.5, 0.5, 0.5,
-3, -3.668626, -5.747186, 1, 1.5, 0.5, 0.5,
-3, -3.668626, -5.747186, 0, 1.5, 0.5, 0.5,
-2, -3.668626, -5.747186, 0, -0.5, 0.5, 0.5,
-2, -3.668626, -5.747186, 1, -0.5, 0.5, 0.5,
-2, -3.668626, -5.747186, 1, 1.5, 0.5, 0.5,
-2, -3.668626, -5.747186, 0, 1.5, 0.5, 0.5,
-1, -3.668626, -5.747186, 0, -0.5, 0.5, 0.5,
-1, -3.668626, -5.747186, 1, -0.5, 0.5, 0.5,
-1, -3.668626, -5.747186, 1, 1.5, 0.5, 0.5,
-1, -3.668626, -5.747186, 0, 1.5, 0.5, 0.5,
0, -3.668626, -5.747186, 0, -0.5, 0.5, 0.5,
0, -3.668626, -5.747186, 1, -0.5, 0.5, 0.5,
0, -3.668626, -5.747186, 1, 1.5, 0.5, 0.5,
0, -3.668626, -5.747186, 0, 1.5, 0.5, 0.5,
1, -3.668626, -5.747186, 0, -0.5, 0.5, 0.5,
1, -3.668626, -5.747186, 1, -0.5, 0.5, 0.5,
1, -3.668626, -5.747186, 1, 1.5, 0.5, 0.5,
1, -3.668626, -5.747186, 0, 1.5, 0.5, 0.5,
2, -3.668626, -5.747186, 0, -0.5, 0.5, 0.5,
2, -3.668626, -5.747186, 1, -0.5, 0.5, 0.5,
2, -3.668626, -5.747186, 1, 1.5, 0.5, 0.5,
2, -3.668626, -5.747186, 0, 1.5, 0.5, 0.5
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
-3.806299, -3, -4.965207,
-3.806299, 3, -4.965207,
-3.806299, -3, -4.965207,
-3.972504, -3, -5.225866,
-3.806299, -2, -4.965207,
-3.972504, -2, -5.225866,
-3.806299, -1, -4.965207,
-3.972504, -1, -5.225866,
-3.806299, 0, -4.965207,
-3.972504, 0, -5.225866,
-3.806299, 1, -4.965207,
-3.972504, 1, -5.225866,
-3.806299, 2, -4.965207,
-3.972504, 2, -5.225866,
-3.806299, 3, -4.965207,
-3.972504, 3, -5.225866
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
-4.304913, -3, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, -3, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, -3, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, -3, -5.747186, 0, 1.5, 0.5, 0.5,
-4.304913, -2, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, -2, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, -2, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, -2, -5.747186, 0, 1.5, 0.5, 0.5,
-4.304913, -1, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, -1, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, -1, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, -1, -5.747186, 0, 1.5, 0.5, 0.5,
-4.304913, 0, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, 0, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, 0, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, 0, -5.747186, 0, 1.5, 0.5, 0.5,
-4.304913, 1, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, 1, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, 1, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, 1, -5.747186, 0, 1.5, 0.5, 0.5,
-4.304913, 2, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, 2, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, 2, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, 2, -5.747186, 0, 1.5, 0.5, 0.5,
-4.304913, 3, -5.747186, 0, -0.5, 0.5, 0.5,
-4.304913, 3, -5.747186, 1, -0.5, 0.5, 0.5,
-4.304913, 3, -5.747186, 1, 1.5, 0.5, 0.5,
-4.304913, 3, -5.747186, 0, 1.5, 0.5, 0.5
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
-3.806299, -3.195968, -4,
-3.806299, -3.195968, 4,
-3.806299, -3.195968, -4,
-3.972504, -3.353521, -4,
-3.806299, -3.195968, -2,
-3.972504, -3.353521, -2,
-3.806299, -3.195968, 0,
-3.972504, -3.353521, 0,
-3.806299, -3.195968, 2,
-3.972504, -3.353521, 2,
-3.806299, -3.195968, 4,
-3.972504, -3.353521, 4
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
-4.304913, -3.668626, -4, 0, -0.5, 0.5, 0.5,
-4.304913, -3.668626, -4, 1, -0.5, 0.5, 0.5,
-4.304913, -3.668626, -4, 1, 1.5, 0.5, 0.5,
-4.304913, -3.668626, -4, 0, 1.5, 0.5, 0.5,
-4.304913, -3.668626, -2, 0, -0.5, 0.5, 0.5,
-4.304913, -3.668626, -2, 1, -0.5, 0.5, 0.5,
-4.304913, -3.668626, -2, 1, 1.5, 0.5, 0.5,
-4.304913, -3.668626, -2, 0, 1.5, 0.5, 0.5,
-4.304913, -3.668626, 0, 0, -0.5, 0.5, 0.5,
-4.304913, -3.668626, 0, 1, -0.5, 0.5, 0.5,
-4.304913, -3.668626, 0, 1, 1.5, 0.5, 0.5,
-4.304913, -3.668626, 0, 0, 1.5, 0.5, 0.5,
-4.304913, -3.668626, 2, 0, -0.5, 0.5, 0.5,
-4.304913, -3.668626, 2, 1, -0.5, 0.5, 0.5,
-4.304913, -3.668626, 2, 1, 1.5, 0.5, 0.5,
-4.304913, -3.668626, 2, 0, 1.5, 0.5, 0.5,
-4.304913, -3.668626, 4, 0, -0.5, 0.5, 0.5,
-4.304913, -3.668626, 4, 1, -0.5, 0.5, 0.5,
-4.304913, -3.668626, 4, 1, 1.5, 0.5, 0.5,
-4.304913, -3.668626, 4, 0, 1.5, 0.5, 0.5
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
-3.806299, -3.195968, -4.965207,
-3.806299, 3.106129, -4.965207,
-3.806299, -3.195968, 5.461188,
-3.806299, 3.106129, 5.461188,
-3.806299, -3.195968, -4.965207,
-3.806299, -3.195968, 5.461188,
-3.806299, 3.106129, -4.965207,
-3.806299, 3.106129, 5.461188,
-3.806299, -3.195968, -4.965207,
2.841882, -3.195968, -4.965207,
-3.806299, -3.195968, 5.461188,
2.841882, -3.195968, 5.461188,
-3.806299, 3.106129, -4.965207,
2.841882, 3.106129, -4.965207,
-3.806299, 3.106129, 5.461188,
2.841882, 3.106129, 5.461188,
2.841882, -3.195968, -4.965207,
2.841882, 3.106129, -4.965207,
2.841882, -3.195968, 5.461188,
2.841882, 3.106129, 5.461188,
2.841882, -3.195968, -4.965207,
2.841882, -3.195968, 5.461188,
2.841882, 3.106129, -4.965207,
2.841882, 3.106129, 5.461188
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
var radius = 7.411074;
var distance = 32.97271;
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
mvMatrix.translate( 0.4822087, 0.04491949, -0.2479908 );
mvMatrix.scale( 1.205292, 1.271481, 0.7685301 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.97271);
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
halofenozide<-read.table("halofenozide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-halofenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
```

```r
y<-halofenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
```

```r
z<-halofenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'halofenozide' not found
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
-3.709481, -1.499614, -1.154092, 0, 0, 1, 1, 1,
-3.415226, 0.8167098, -1.478818, 1, 0, 0, 1, 1,
-2.844725, -1.650229, -1.238819, 1, 0, 0, 1, 1,
-2.757701, -0.9817063, -2.111817, 1, 0, 0, 1, 1,
-2.476927, -1.265652, -2.453496, 1, 0, 0, 1, 1,
-2.413132, -0.7198255, -1.251974, 1, 0, 0, 1, 1,
-2.366248, -0.8292934, -3.482714, 0, 0, 0, 1, 1,
-2.33453, 0.3502059, -0.2046487, 0, 0, 0, 1, 1,
-2.331592, 0.4873896, -0.4421974, 0, 0, 0, 1, 1,
-2.311133, 0.5911102, -3.087129, 0, 0, 0, 1, 1,
-2.283376, -0.2139632, -2.696224, 0, 0, 0, 1, 1,
-2.267043, -0.1174814, -1.373168, 0, 0, 0, 1, 1,
-2.175313, 1.835561, -0.3288134, 0, 0, 0, 1, 1,
-2.116284, -1.914632, -1.647216, 1, 1, 1, 1, 1,
-2.091284, 1.251874, -2.714879, 1, 1, 1, 1, 1,
-2.08088, -1.906139, -2.55127, 1, 1, 1, 1, 1,
-2.044392, -0.06540188, 0.07080478, 1, 1, 1, 1, 1,
-2.036145, 0.6201891, 0.1533691, 1, 1, 1, 1, 1,
-1.962062, 0.17945, -0.4941457, 1, 1, 1, 1, 1,
-1.950369, 0.3967204, -3.3572, 1, 1, 1, 1, 1,
-1.947515, 0.5681462, -1.820983, 1, 1, 1, 1, 1,
-1.92127, 0.6300772, -1.154274, 1, 1, 1, 1, 1,
-1.918688, -0.3041826, -1.523554, 1, 1, 1, 1, 1,
-1.908364, 1.385562, -1.94832, 1, 1, 1, 1, 1,
-1.877201, 0.8110061, 0.04997822, 1, 1, 1, 1, 1,
-1.875091, 0.08229095, -1.076769, 1, 1, 1, 1, 1,
-1.871319, 0.9262387, -1.858454, 1, 1, 1, 1, 1,
-1.846651, 0.9231555, -2.890322, 1, 1, 1, 1, 1,
-1.840496, 0.7097263, -0.8309185, 0, 0, 1, 1, 1,
-1.839787, -0.007166293, -0.7517153, 1, 0, 0, 1, 1,
-1.794939, -1.068846, -2.757587, 1, 0, 0, 1, 1,
-1.75849, 0.8232855, -1.198971, 1, 0, 0, 1, 1,
-1.719952, 1.465805, -1.900848, 1, 0, 0, 1, 1,
-1.715766, 1.996303, -0.01260743, 1, 0, 0, 1, 1,
-1.696557, 0.9454533, -1.414769, 0, 0, 0, 1, 1,
-1.681781, -0.4154213, -0.7876874, 0, 0, 0, 1, 1,
-1.654329, 2.008395, -0.6175655, 0, 0, 0, 1, 1,
-1.650114, 0.8153737, -0.06089052, 0, 0, 0, 1, 1,
-1.645505, -1.577021, -0.729219, 0, 0, 0, 1, 1,
-1.642369, 2.804336, -0.6450737, 0, 0, 0, 1, 1,
-1.639915, 1.149956, -0.6912918, 0, 0, 0, 1, 1,
-1.635576, -1.265291, -1.724433, 1, 1, 1, 1, 1,
-1.631657, -0.5223718, -1.180483, 1, 1, 1, 1, 1,
-1.610053, -1.351363, -3.177354, 1, 1, 1, 1, 1,
-1.605723, -0.4342294, -1.658301, 1, 1, 1, 1, 1,
-1.605243, -1.161188, -2.722425, 1, 1, 1, 1, 1,
-1.60164, 0.6666352, -2.322611, 1, 1, 1, 1, 1,
-1.593572, -0.8658621, -1.267667, 1, 1, 1, 1, 1,
-1.589309, -0.6643224, -1.434363, 1, 1, 1, 1, 1,
-1.577806, -1.413817, -2.826288, 1, 1, 1, 1, 1,
-1.567029, 0.2186671, -0.7784386, 1, 1, 1, 1, 1,
-1.559047, -1.479824, -3.088481, 1, 1, 1, 1, 1,
-1.558828, 1.618152, -0.5332663, 1, 1, 1, 1, 1,
-1.544841, -0.6334466, 0.1016127, 1, 1, 1, 1, 1,
-1.533429, 0.9662246, -1.111116, 1, 1, 1, 1, 1,
-1.530532, -0.8882707, -0.9535409, 1, 1, 1, 1, 1,
-1.499704, 1.010084, -0.2500831, 0, 0, 1, 1, 1,
-1.496979, -0.0476577, -1.70977, 1, 0, 0, 1, 1,
-1.491343, -0.4903412, -1.527377, 1, 0, 0, 1, 1,
-1.48757, 0.7776401, -0.6819432, 1, 0, 0, 1, 1,
-1.486746, -0.9499986, -1.697065, 1, 0, 0, 1, 1,
-1.472015, -2.205526, -0.5617387, 1, 0, 0, 1, 1,
-1.468221, -0.08630638, -1.567164, 0, 0, 0, 1, 1,
-1.459456, -0.8859629, -0.7325051, 0, 0, 0, 1, 1,
-1.45514, 1.910031, -0.2474422, 0, 0, 0, 1, 1,
-1.453547, -0.8441424, -3.414282, 0, 0, 0, 1, 1,
-1.44652, 0.723084, -0.3003978, 0, 0, 0, 1, 1,
-1.436103, -0.5641694, -1.485857, 0, 0, 0, 1, 1,
-1.419747, -0.4354292, -2.023476, 0, 0, 0, 1, 1,
-1.414335, 0.2787429, -2.33502, 1, 1, 1, 1, 1,
-1.411546, -1.026198, -2.664757, 1, 1, 1, 1, 1,
-1.403948, -1.288799, -2.565532, 1, 1, 1, 1, 1,
-1.39412, -0.5665045, -1.489801, 1, 1, 1, 1, 1,
-1.374064, 0.02859759, -1.444646, 1, 1, 1, 1, 1,
-1.370178, -0.2605481, -0.7201509, 1, 1, 1, 1, 1,
-1.370026, 0.4258893, 0.1652865, 1, 1, 1, 1, 1,
-1.364053, -0.01257087, -0.3387992, 1, 1, 1, 1, 1,
-1.364011, 0.6702677, -1.794882, 1, 1, 1, 1, 1,
-1.36258, 1.106904, -0.4625374, 1, 1, 1, 1, 1,
-1.356985, -1.107322, -0.00361546, 1, 1, 1, 1, 1,
-1.354231, -0.4378731, -2.191303, 1, 1, 1, 1, 1,
-1.353798, -0.7232572, -2.623181, 1, 1, 1, 1, 1,
-1.349008, 0.1968824, -1.257864, 1, 1, 1, 1, 1,
-1.347383, 0.1032557, -0.8141269, 1, 1, 1, 1, 1,
-1.338155, -1.551652, -0.95835, 0, 0, 1, 1, 1,
-1.33123, -0.2462129, -3.051164, 1, 0, 0, 1, 1,
-1.321123, 0.4172195, -0.8625707, 1, 0, 0, 1, 1,
-1.316916, -0.06045775, -0.9882501, 1, 0, 0, 1, 1,
-1.311362, 0.9299075, 0.02617552, 1, 0, 0, 1, 1,
-1.310707, 0.1697847, -2.807898, 1, 0, 0, 1, 1,
-1.307121, 0.6564193, -0.3587803, 0, 0, 0, 1, 1,
-1.302688, -1.753939, -1.439789, 0, 0, 0, 1, 1,
-1.291929, 0.4099582, 0.02546275, 0, 0, 0, 1, 1,
-1.286873, 0.7387398, -2.249556, 0, 0, 0, 1, 1,
-1.28302, -1.567678, -1.274272, 0, 0, 0, 1, 1,
-1.282531, -1.023368, -0.5353076, 0, 0, 0, 1, 1,
-1.280206, 0.1141169, 0.6904927, 0, 0, 0, 1, 1,
-1.278003, -0.5102016, -2.820311, 1, 1, 1, 1, 1,
-1.270176, 0.8125773, -1.517667, 1, 1, 1, 1, 1,
-1.265113, 2.375672, 0.113084, 1, 1, 1, 1, 1,
-1.261103, -0.847156, -1.81962, 1, 1, 1, 1, 1,
-1.247459, 0.6787819, -1.252627, 1, 1, 1, 1, 1,
-1.24476, 0.1776184, -1.581901, 1, 1, 1, 1, 1,
-1.243287, 0.1022316, -2.659987, 1, 1, 1, 1, 1,
-1.23707, -0.1676302, -2.314713, 1, 1, 1, 1, 1,
-1.233189, -0.8436245, -1.537859, 1, 1, 1, 1, 1,
-1.232731, 0.5641465, -2.351377, 1, 1, 1, 1, 1,
-1.231929, -0.2954193, -2.406432, 1, 1, 1, 1, 1,
-1.213504, 0.998181, -0.9364774, 1, 1, 1, 1, 1,
-1.211651, 0.9262915, -0.3882391, 1, 1, 1, 1, 1,
-1.20821, -1.175368, -4.194436, 1, 1, 1, 1, 1,
-1.206011, 1.198758, -3.765679, 1, 1, 1, 1, 1,
-1.199412, -1.325878, -1.886076, 0, 0, 1, 1, 1,
-1.190313, 0.6968337, -0.7001856, 1, 0, 0, 1, 1,
-1.184252, 1.517737, 0.1031236, 1, 0, 0, 1, 1,
-1.183638, 0.1334331, -3.026826, 1, 0, 0, 1, 1,
-1.172237, -0.8203269, -3.010677, 1, 0, 0, 1, 1,
-1.168847, -0.8158549, -3.154029, 1, 0, 0, 1, 1,
-1.163239, 0.06814405, -0.8101519, 0, 0, 0, 1, 1,
-1.16196, -1.724154, -3.232259, 0, 0, 0, 1, 1,
-1.161263, 0.8927867, -3.496082, 0, 0, 0, 1, 1,
-1.154369, 0.4285471, -1.914709, 0, 0, 0, 1, 1,
-1.148142, -0.3615909, -0.6763569, 0, 0, 0, 1, 1,
-1.147111, -0.3110715, 0.9240561, 0, 0, 0, 1, 1,
-1.14672, -1.606372, -0.9845195, 0, 0, 0, 1, 1,
-1.140913, -0.00297018, -2.832932, 1, 1, 1, 1, 1,
-1.139541, 0.6180931, -2.552287, 1, 1, 1, 1, 1,
-1.132848, -0.6095853, -3.772325, 1, 1, 1, 1, 1,
-1.130509, -0.4365994, -1.711946, 1, 1, 1, 1, 1,
-1.129385, 1.388418, -0.5815438, 1, 1, 1, 1, 1,
-1.118081, 1.274859, -1.873397, 1, 1, 1, 1, 1,
-1.111216, 0.8046729, -1.787878, 1, 1, 1, 1, 1,
-1.109338, -0.1110306, -0.5753806, 1, 1, 1, 1, 1,
-1.108779, -1.635965, -3.053323, 1, 1, 1, 1, 1,
-1.099491, 2.605764, -0.5565317, 1, 1, 1, 1, 1,
-1.097367, -0.3565387, -1.251853, 1, 1, 1, 1, 1,
-1.08789, 0.7506886, 0.1466594, 1, 1, 1, 1, 1,
-1.077244, -2.039589, -2.30289, 1, 1, 1, 1, 1,
-1.076229, -0.6164621, -1.330313, 1, 1, 1, 1, 1,
-1.073142, -0.3499762, -1.665226, 1, 1, 1, 1, 1,
-1.070958, -0.5190946, -1.805941, 0, 0, 1, 1, 1,
-1.070609, -0.671151, 0.5763633, 1, 0, 0, 1, 1,
-1.066562, 2.049269, 1.803893, 1, 0, 0, 1, 1,
-1.065513, 0.3583227, -2.125259, 1, 0, 0, 1, 1,
-1.061528, -1.63043, -2.533489, 1, 0, 0, 1, 1,
-1.059399, 0.9164795, -1.108922, 1, 0, 0, 1, 1,
-1.051174, 0.04682901, -0.1379837, 0, 0, 0, 1, 1,
-1.049429, 0.5098459, -1.632163, 0, 0, 0, 1, 1,
-1.043887, 0.5107819, -1.285522, 0, 0, 0, 1, 1,
-1.04032, 2.934929, 0.737139, 0, 0, 0, 1, 1,
-1.035575, -0.1364385, -2.591159, 0, 0, 0, 1, 1,
-1.034366, 1.078231, -0.6662429, 0, 0, 0, 1, 1,
-1.022029, 0.648055, -2.099339, 0, 0, 0, 1, 1,
-1.020395, 0.9132897, -0.9822118, 1, 1, 1, 1, 1,
-1.016198, -0.332933, -2.429104, 1, 1, 1, 1, 1,
-1.005611, 0.6168736, -0.7772311, 1, 1, 1, 1, 1,
-1.003832, 0.1064736, -2.094967, 1, 1, 1, 1, 1,
-0.9950327, 0.9776179, -1.385225, 1, 1, 1, 1, 1,
-0.9944125, -1.143634, -2.366283, 1, 1, 1, 1, 1,
-0.9835535, 0.556073, -0.1605371, 1, 1, 1, 1, 1,
-0.9820473, -1.947407, -3.01538, 1, 1, 1, 1, 1,
-0.9806441, -0.2910189, -0.8941854, 1, 1, 1, 1, 1,
-0.9764395, -0.9718117, -2.215046, 1, 1, 1, 1, 1,
-0.9763492, -0.9836454, -0.4519614, 1, 1, 1, 1, 1,
-0.9760125, -1.139255, -1.734961, 1, 1, 1, 1, 1,
-0.9740965, 0.2251411, -2.245886, 1, 1, 1, 1, 1,
-0.9724008, -0.2079221, -0.9368159, 1, 1, 1, 1, 1,
-0.9697841, -0.5913411, -2.28844, 1, 1, 1, 1, 1,
-0.9678087, 0.08000403, 0.2830076, 0, 0, 1, 1, 1,
-0.9596346, 0.1065444, -2.53251, 1, 0, 0, 1, 1,
-0.953275, -0.1408819, -1.922188, 1, 0, 0, 1, 1,
-0.9464077, 0.4990978, -1.571237, 1, 0, 0, 1, 1,
-0.9422551, -0.2636492, -2.624006, 1, 0, 0, 1, 1,
-0.9399647, -0.4633661, -1.934469, 1, 0, 0, 1, 1,
-0.9385776, 0.7178801, -0.3973393, 0, 0, 0, 1, 1,
-0.9376108, 0.8260632, 0.1635628, 0, 0, 0, 1, 1,
-0.9290358, 0.360711, -0.7562308, 0, 0, 0, 1, 1,
-0.9247821, -3.10419, -4.490493, 0, 0, 0, 1, 1,
-0.920053, -0.790601, -1.176393, 0, 0, 0, 1, 1,
-0.918168, 0.08321083, -1.367374, 0, 0, 0, 1, 1,
-0.9141939, -1.786909, -3.001142, 0, 0, 0, 1, 1,
-0.9097284, 0.05033062, -1.117016, 1, 1, 1, 1, 1,
-0.906749, -0.4464043, -1.014091, 1, 1, 1, 1, 1,
-0.9042897, 0.2534141, -0.1503869, 1, 1, 1, 1, 1,
-0.9037596, 0.8104482, -1.188642, 1, 1, 1, 1, 1,
-0.9004559, 0.1894594, -1.224347, 1, 1, 1, 1, 1,
-0.8985478, -0.940959, -3.324266, 1, 1, 1, 1, 1,
-0.8925899, -0.9567298, -1.340843, 1, 1, 1, 1, 1,
-0.8918322, -0.4973717, -2.377484, 1, 1, 1, 1, 1,
-0.8798803, 0.3904905, 0.04656069, 1, 1, 1, 1, 1,
-0.8658661, 0.6656661, -1.420758, 1, 1, 1, 1, 1,
-0.8630563, 0.1347114, -2.127229, 1, 1, 1, 1, 1,
-0.8620821, -0.126085, -1.246144, 1, 1, 1, 1, 1,
-0.8600441, -0.4907693, -1.135691, 1, 1, 1, 1, 1,
-0.8547328, 0.507633, -1.179017, 1, 1, 1, 1, 1,
-0.8400832, 1.379314, -0.9665223, 1, 1, 1, 1, 1,
-0.8368245, 0.08354631, -0.523984, 0, 0, 1, 1, 1,
-0.8357035, -0.7485395, -2.333422, 1, 0, 0, 1, 1,
-0.8331768, -0.1778956, -0.3470877, 1, 0, 0, 1, 1,
-0.8331081, 0.870874, -1.353691, 1, 0, 0, 1, 1,
-0.8328064, -1.164729, -2.703391, 1, 0, 0, 1, 1,
-0.8279328, 0.626318, -0.3458374, 1, 0, 0, 1, 1,
-0.8173922, 1.933284, -0.7618462, 0, 0, 0, 1, 1,
-0.8099613, -0.5037374, -1.368334, 0, 0, 0, 1, 1,
-0.8096805, 0.7166332, -0.2573061, 0, 0, 0, 1, 1,
-0.8043851, -0.2917353, -1.395468, 0, 0, 0, 1, 1,
-0.8041186, -2.016078, -2.953236, 0, 0, 0, 1, 1,
-0.8015381, 0.1580262, -0.9899521, 0, 0, 0, 1, 1,
-0.7936843, -0.2799909, -1.356632, 0, 0, 0, 1, 1,
-0.7891362, -0.0388449, -1.153899, 1, 1, 1, 1, 1,
-0.7872305, 0.02415033, -1.226408, 1, 1, 1, 1, 1,
-0.7850309, 0.1652544, -2.236692, 1, 1, 1, 1, 1,
-0.7808232, 0.4398752, -0.7644199, 1, 1, 1, 1, 1,
-0.7804357, 0.1437673, -1.004803, 1, 1, 1, 1, 1,
-0.7794418, 0.6106114, -0.07374951, 1, 1, 1, 1, 1,
-0.7753006, -1.139742, -1.979658, 1, 1, 1, 1, 1,
-0.774452, 0.6623012, -0.6355835, 1, 1, 1, 1, 1,
-0.7733022, 1.35809, 0.9134747, 1, 1, 1, 1, 1,
-0.7681919, -0.5954205, -2.566253, 1, 1, 1, 1, 1,
-0.7611496, -1.072323, -2.266496, 1, 1, 1, 1, 1,
-0.7607427, -0.02347096, -1.430344, 1, 1, 1, 1, 1,
-0.7525729, 1.737857, -0.1988838, 1, 1, 1, 1, 1,
-0.7513182, 0.06907798, -3.412448, 1, 1, 1, 1, 1,
-0.750173, 1.776033, -0.593641, 1, 1, 1, 1, 1,
-0.7500966, 0.004920073, -3.627994, 0, 0, 1, 1, 1,
-0.7433221, 0.2231202, -0.2175274, 1, 0, 0, 1, 1,
-0.7408329, -0.3024384, -0.9001701, 1, 0, 0, 1, 1,
-0.7361409, -1.081935, -2.748674, 1, 0, 0, 1, 1,
-0.734789, -0.5321496, -1.125719, 1, 0, 0, 1, 1,
-0.7225676, 0.9635427, 0.7867364, 1, 0, 0, 1, 1,
-0.7225026, 0.008462073, -0.7622103, 0, 0, 0, 1, 1,
-0.714588, 0.7460223, -1.529162, 0, 0, 0, 1, 1,
-0.7077749, 0.5331116, -2.370262, 0, 0, 0, 1, 1,
-0.7054048, -0.3173167, -1.798659, 0, 0, 0, 1, 1,
-0.7043905, 0.3642823, 0.5655181, 0, 0, 0, 1, 1,
-0.6950148, 1.688355, -1.486259, 0, 0, 0, 1, 1,
-0.6949247, 1.60314, 0.08396649, 0, 0, 0, 1, 1,
-0.6940598, -0.8876373, -1.840808, 1, 1, 1, 1, 1,
-0.6925005, 2.446805, 0.1211364, 1, 1, 1, 1, 1,
-0.6877343, -1.137079, -1.363188, 1, 1, 1, 1, 1,
-0.6805173, -1.529663, -1.340577, 1, 1, 1, 1, 1,
-0.6804259, -0.2808613, -2.980303, 1, 1, 1, 1, 1,
-0.6723077, 1.479052, -1.030923, 1, 1, 1, 1, 1,
-0.6708915, 1.130316, -2.931045, 1, 1, 1, 1, 1,
-0.6662497, 0.4229846, -1.314469, 1, 1, 1, 1, 1,
-0.6660366, -0.5164485, -0.8776821, 1, 1, 1, 1, 1,
-0.663021, 1.14505, -0.2132871, 1, 1, 1, 1, 1,
-0.6624882, 1.401347, -0.2822695, 1, 1, 1, 1, 1,
-0.6623995, 0.1148863, -1.989366, 1, 1, 1, 1, 1,
-0.659507, -1.027594, -2.667611, 1, 1, 1, 1, 1,
-0.656317, 0.5588107, -1.673319, 1, 1, 1, 1, 1,
-0.6516864, 0.6450936, -0.9467344, 1, 1, 1, 1, 1,
-0.6456029, 1.03332, -0.643488, 0, 0, 1, 1, 1,
-0.6427044, 0.2759054, -0.5451716, 1, 0, 0, 1, 1,
-0.6419311, 1.616007, -0.8732776, 1, 0, 0, 1, 1,
-0.6410983, -0.6334854, -2.216165, 1, 0, 0, 1, 1,
-0.6409085, 0.8171164, -2.477697, 1, 0, 0, 1, 1,
-0.6312971, -1.530496, -2.111027, 1, 0, 0, 1, 1,
-0.6298277, -0.2704802, -2.524544, 0, 0, 0, 1, 1,
-0.6256409, 0.8528172, -1.026286, 0, 0, 0, 1, 1,
-0.6233135, -0.3581436, -2.983164, 0, 0, 0, 1, 1,
-0.6200822, 0.09730364, -2.44064, 0, 0, 0, 1, 1,
-0.6099123, -0.02120996, -1.979739, 0, 0, 0, 1, 1,
-0.608801, 0.5489337, 0.571068, 0, 0, 0, 1, 1,
-0.6076521, 0.5817911, -2.374247, 0, 0, 0, 1, 1,
-0.6073699, -0.3772659, -4.382193, 1, 1, 1, 1, 1,
-0.602581, 1.381658, -1.553364, 1, 1, 1, 1, 1,
-0.6018587, -0.215486, -2.423427, 1, 1, 1, 1, 1,
-0.6013278, 0.05864185, -2.342654, 1, 1, 1, 1, 1,
-0.5981765, 0.7634462, -1.048033, 1, 1, 1, 1, 1,
-0.5961045, -0.4164241, -3.435634, 1, 1, 1, 1, 1,
-0.5925803, 0.1191012, -2.726373, 1, 1, 1, 1, 1,
-0.5910469, 0.5511144, 0.2207552, 1, 1, 1, 1, 1,
-0.5870394, -0.6221697, -4.183582, 1, 1, 1, 1, 1,
-0.5868406, -0.2816508, -1.071678, 1, 1, 1, 1, 1,
-0.5831935, -2.36746, -3.122418, 1, 1, 1, 1, 1,
-0.5791328, 0.02557583, -1.14599, 1, 1, 1, 1, 1,
-0.5785016, 0.1250464, -1.552982, 1, 1, 1, 1, 1,
-0.577696, 1.396091, -1.143974, 1, 1, 1, 1, 1,
-0.5774774, 1.191709, -0.1267682, 1, 1, 1, 1, 1,
-0.574567, 0.5443422, -2.094985, 0, 0, 1, 1, 1,
-0.5704738, 1.589835, 2.070851, 1, 0, 0, 1, 1,
-0.5655457, -1.609472, -2.651455, 1, 0, 0, 1, 1,
-0.5611216, 0.3430063, -0.5936904, 1, 0, 0, 1, 1,
-0.5602573, -0.1896935, -2.172714, 1, 0, 0, 1, 1,
-0.5582067, 0.1599159, -0.8185778, 1, 0, 0, 1, 1,
-0.554974, 0.9861786, -1.686695, 0, 0, 0, 1, 1,
-0.5535682, -0.2562827, -1.374806, 0, 0, 0, 1, 1,
-0.5534293, -0.1549599, -0.8839437, 0, 0, 0, 1, 1,
-0.5532091, -1.202702, -3.424292, 0, 0, 0, 1, 1,
-0.5423517, 1.42015, 0.1935094, 0, 0, 0, 1, 1,
-0.5399643, -0.2376308, -2.022837, 0, 0, 0, 1, 1,
-0.5368835, 2.175134, -0.2817671, 0, 0, 0, 1, 1,
-0.5267714, 0.2583556, -1.567866, 1, 1, 1, 1, 1,
-0.5230547, -1.693698, -3.047022, 1, 1, 1, 1, 1,
-0.5225574, -0.7833983, -1.839329, 1, 1, 1, 1, 1,
-0.5202403, -0.2742978, -0.5712596, 1, 1, 1, 1, 1,
-0.5200915, -1.483489, -2.922944, 1, 1, 1, 1, 1,
-0.5199491, -1.261387, -3.422852, 1, 1, 1, 1, 1,
-0.5198652, -0.4946458, -1.202484, 1, 1, 1, 1, 1,
-0.5192155, -0.5197591, -2.351417, 1, 1, 1, 1, 1,
-0.5185979, 0.4370405, -0.4240463, 1, 1, 1, 1, 1,
-0.5170407, 0.4123033, -0.6450804, 1, 1, 1, 1, 1,
-0.5105544, -0.9907393, -2.274401, 1, 1, 1, 1, 1,
-0.5084912, 0.6085248, 0.3321835, 1, 1, 1, 1, 1,
-0.5061196, -1.26976, -3.858985, 1, 1, 1, 1, 1,
-0.5060498, -0.3482677, -1.486236, 1, 1, 1, 1, 1,
-0.5040731, 1.245191, -0.211444, 1, 1, 1, 1, 1,
-0.5025095, 0.7275681, -0.4567442, 0, 0, 1, 1, 1,
-0.5003793, -0.7748026, -2.064055, 1, 0, 0, 1, 1,
-0.4960849, 0.281922, -1.606261, 1, 0, 0, 1, 1,
-0.4950662, -1.003146, -1.322381, 1, 0, 0, 1, 1,
-0.4872719, -0.1839443, -2.613614, 1, 0, 0, 1, 1,
-0.4860753, -0.5406437, -2.130778, 1, 0, 0, 1, 1,
-0.4856746, 0.978249, -0.5123082, 0, 0, 0, 1, 1,
-0.4847325, 1.865077, -1.626992, 0, 0, 0, 1, 1,
-0.4805879, -0.6483779, -2.10598, 0, 0, 0, 1, 1,
-0.4804077, 0.4026201, -1.01851, 0, 0, 0, 1, 1,
-0.4787864, -0.995333, -2.223374, 0, 0, 0, 1, 1,
-0.4784554, -1.445187, -1.059529, 0, 0, 0, 1, 1,
-0.4757819, -0.7183143, -2.839921, 0, 0, 0, 1, 1,
-0.4725487, -1.330433, -3.08177, 1, 1, 1, 1, 1,
-0.4687019, -0.8977389, -1.59725, 1, 1, 1, 1, 1,
-0.4672558, -0.3891243, -0.4692622, 1, 1, 1, 1, 1,
-0.4671354, -0.1433617, -2.227332, 1, 1, 1, 1, 1,
-0.4667805, -0.02577121, -1.919901, 1, 1, 1, 1, 1,
-0.4638663, 0.205766, -0.902709, 1, 1, 1, 1, 1,
-0.4629098, -2.622881, -2.524324, 1, 1, 1, 1, 1,
-0.4621125, -1.231217, -1.743025, 1, 1, 1, 1, 1,
-0.4607961, -1.048849, -2.029063, 1, 1, 1, 1, 1,
-0.4605344, -0.4628991, -2.497431, 1, 1, 1, 1, 1,
-0.4595708, 0.2692771, 0.2642763, 1, 1, 1, 1, 1,
-0.4569682, -0.8390957, -3.323099, 1, 1, 1, 1, 1,
-0.4497164, 0.4384887, -2.984474, 1, 1, 1, 1, 1,
-0.4491778, -0.4847859, -2.533618, 1, 1, 1, 1, 1,
-0.4478453, 0.02399792, -2.63905, 1, 1, 1, 1, 1,
-0.4422017, -0.3664315, -1.294839, 0, 0, 1, 1, 1,
-0.4264386, 0.1374638, 0.007133368, 1, 0, 0, 1, 1,
-0.4247693, 0.2379632, -3.118112, 1, 0, 0, 1, 1,
-0.4245957, -0.3800944, -3.581193, 1, 0, 0, 1, 1,
-0.4218574, -0.5757794, -1.95483, 1, 0, 0, 1, 1,
-0.4213384, 1.176339, 0.04030792, 1, 0, 0, 1, 1,
-0.4196123, 0.1764866, -1.352666, 0, 0, 0, 1, 1,
-0.4180917, 0.6371621, 0.5023386, 0, 0, 0, 1, 1,
-0.4168858, -0.5588079, -2.875809, 0, 0, 0, 1, 1,
-0.4157979, 1.895397, -1.420608, 0, 0, 0, 1, 1,
-0.4108949, -0.6333156, -2.254589, 0, 0, 0, 1, 1,
-0.4097745, 0.4351431, -0.7209131, 0, 0, 0, 1, 1,
-0.4050407, -0.1594302, -1.901621, 0, 0, 0, 1, 1,
-0.4032097, 0.1892496, -1.714599, 1, 1, 1, 1, 1,
-0.399734, 0.008115268, -0.4137408, 1, 1, 1, 1, 1,
-0.3932641, 0.2250573, -0.2881362, 1, 1, 1, 1, 1,
-0.392369, -0.5133677, -4.161714, 1, 1, 1, 1, 1,
-0.3884879, 1.009871, -1.893224, 1, 1, 1, 1, 1,
-0.3831407, -0.02813089, -2.407877, 1, 1, 1, 1, 1,
-0.3712976, -1.553168, -2.448961, 1, 1, 1, 1, 1,
-0.3686869, 1.243414, 0.3713465, 1, 1, 1, 1, 1,
-0.3651014, -0.2231224, -4.76545, 1, 1, 1, 1, 1,
-0.3650185, 0.8890769, -0.5456626, 1, 1, 1, 1, 1,
-0.358784, 0.8025536, 0.09652557, 1, 1, 1, 1, 1,
-0.3518538, 0.6017786, 1.520815, 1, 1, 1, 1, 1,
-0.3508621, 0.4323426, -1.452039, 1, 1, 1, 1, 1,
-0.3501846, 0.220857, -0.7252098, 1, 1, 1, 1, 1,
-0.3431326, 0.2538257, -0.2262143, 1, 1, 1, 1, 1,
-0.33758, 0.6274379, 0.637431, 0, 0, 1, 1, 1,
-0.3330505, -0.7585416, -2.188901, 1, 0, 0, 1, 1,
-0.3321806, 0.2996741, -0.8686023, 1, 0, 0, 1, 1,
-0.3295214, 0.9452977, -0.05757344, 1, 0, 0, 1, 1,
-0.3274834, 0.5599645, -1.662614, 1, 0, 0, 1, 1,
-0.3267531, -1.032401, -3.008549, 1, 0, 0, 1, 1,
-0.3253273, -1.837345, -2.135363, 0, 0, 0, 1, 1,
-0.3252826, -0.829163, -4.000751, 0, 0, 0, 1, 1,
-0.3235054, 2.311781, -0.2098454, 0, 0, 0, 1, 1,
-0.3198442, -1.045889, -3.983982, 0, 0, 0, 1, 1,
-0.3132508, 0.4520033, -0.6152348, 0, 0, 0, 1, 1,
-0.3122475, 2.212797, -0.6233872, 0, 0, 0, 1, 1,
-0.3104213, 1.127617, -0.8377115, 0, 0, 0, 1, 1,
-0.3100959, 0.4329862, -1.621564, 1, 1, 1, 1, 1,
-0.309666, -0.1735718, -1.770177, 1, 1, 1, 1, 1,
-0.3068409, -1.295013, -2.431031, 1, 1, 1, 1, 1,
-0.2939159, 0.1614005, -1.547962, 1, 1, 1, 1, 1,
-0.2888877, -0.6518914, -1.959548, 1, 1, 1, 1, 1,
-0.2873947, 1.859534, 0.6532282, 1, 1, 1, 1, 1,
-0.2868851, -1.693379, -3.131513, 1, 1, 1, 1, 1,
-0.2851675, 0.2685373, -0.9207572, 1, 1, 1, 1, 1,
-0.2840702, -0.38613, -2.492117, 1, 1, 1, 1, 1,
-0.2772779, -1.577698, -2.40382, 1, 1, 1, 1, 1,
-0.2741072, -0.5507207, -2.562416, 1, 1, 1, 1, 1,
-0.2715875, -1.391382, -4.691552, 1, 1, 1, 1, 1,
-0.2704459, 0.7755903, 0.5251952, 1, 1, 1, 1, 1,
-0.2699869, -0.1274655, -0.6460924, 1, 1, 1, 1, 1,
-0.267415, 0.2904062, -2.87612, 1, 1, 1, 1, 1,
-0.2671451, -0.1689674, -1.954021, 0, 0, 1, 1, 1,
-0.2659789, 2.577156, 0.9531085, 1, 0, 0, 1, 1,
-0.2650568, -1.183501, -3.891113, 1, 0, 0, 1, 1,
-0.2635862, 0.3989529, -1.243471, 1, 0, 0, 1, 1,
-0.2634944, 0.5422129, 0.8509257, 1, 0, 0, 1, 1,
-0.2631075, 0.6075527, -0.1683155, 1, 0, 0, 1, 1,
-0.2628153, 0.4032472, -2.517674, 0, 0, 0, 1, 1,
-0.261555, 1.307401, -3.02222, 0, 0, 0, 1, 1,
-0.2589963, 0.06629245, -1.761379, 0, 0, 0, 1, 1,
-0.257125, -0.2308975, -0.9979075, 0, 0, 0, 1, 1,
-0.2499371, 0.2715189, 0.5527623, 0, 0, 0, 1, 1,
-0.2480423, -0.3556602, -2.399486, 0, 0, 0, 1, 1,
-0.2470216, -0.2524335, -2.196217, 0, 0, 0, 1, 1,
-0.2448286, 0.9808272, -1.150621, 1, 1, 1, 1, 1,
-0.241557, 1.347089, -0.3909984, 1, 1, 1, 1, 1,
-0.2404777, 0.1170488, 0.5447258, 1, 1, 1, 1, 1,
-0.2392678, 1.558344, -1.134786, 1, 1, 1, 1, 1,
-0.2375232, 0.5566409, -2.285122, 1, 1, 1, 1, 1,
-0.2354511, 0.1184026, 0.8278001, 1, 1, 1, 1, 1,
-0.2312408, 0.5100245, -2.761134, 1, 1, 1, 1, 1,
-0.2294324, -1.400759, -1.817212, 1, 1, 1, 1, 1,
-0.2288242, 0.6219148, -0.4577348, 1, 1, 1, 1, 1,
-0.2222908, 1.659616, -0.7818564, 1, 1, 1, 1, 1,
-0.2183834, 2.197983, -0.856478, 1, 1, 1, 1, 1,
-0.2180564, 1.657694, -1.321141, 1, 1, 1, 1, 1,
-0.2131723, 0.08721554, 1.453223, 1, 1, 1, 1, 1,
-0.2075382, 0.5221246, 0.4262459, 1, 1, 1, 1, 1,
-0.2056331, -0.5746116, -3.230375, 1, 1, 1, 1, 1,
-0.2055662, -0.1905765, -2.032575, 0, 0, 1, 1, 1,
-0.2011061, -0.8540781, -2.275956, 1, 0, 0, 1, 1,
-0.1994819, 0.01793753, -2.413483, 1, 0, 0, 1, 1,
-0.1953832, 0.08298614, -3.792185, 1, 0, 0, 1, 1,
-0.1953228, 1.212291, 0.5479102, 1, 0, 0, 1, 1,
-0.1942434, -0.4473279, -3.549541, 1, 0, 0, 1, 1,
-0.1934261, -0.9077971, -0.8587306, 0, 0, 0, 1, 1,
-0.1930381, 0.1792728, -0.8581501, 0, 0, 0, 1, 1,
-0.1920269, 1.073492, -0.2879904, 0, 0, 0, 1, 1,
-0.189918, 0.1046598, -1.479289, 0, 0, 0, 1, 1,
-0.1881938, 1.000803, 0.5706455, 0, 0, 0, 1, 1,
-0.1828621, -1.096454, -1.258806, 0, 0, 0, 1, 1,
-0.1764765, 0.02628641, -2.172524, 0, 0, 0, 1, 1,
-0.1758524, 0.6968793, 1.210716, 1, 1, 1, 1, 1,
-0.1754453, 0.4988582, 1.155584, 1, 1, 1, 1, 1,
-0.1732645, -0.6983156, -3.348676, 1, 1, 1, 1, 1,
-0.1674797, -0.04110798, -2.234538, 1, 1, 1, 1, 1,
-0.166072, -0.8953714, -4.004292, 1, 1, 1, 1, 1,
-0.1640001, 0.4416998, 0.02507856, 1, 1, 1, 1, 1,
-0.1619817, -0.9370238, -2.421994, 1, 1, 1, 1, 1,
-0.1600789, -1.640029, -3.827393, 1, 1, 1, 1, 1,
-0.1583041, -1.156889, -3.300717, 1, 1, 1, 1, 1,
-0.156196, -0.8291833, -2.839837, 1, 1, 1, 1, 1,
-0.1487843, 0.1908809, -1.783683, 1, 1, 1, 1, 1,
-0.1475686, -0.8295213, -3.143862, 1, 1, 1, 1, 1,
-0.1464497, -0.7393897, -1.653626, 1, 1, 1, 1, 1,
-0.1429634, 0.9772479, 0.01042693, 1, 1, 1, 1, 1,
-0.1421352, 0.08033504, -2.18064, 1, 1, 1, 1, 1,
-0.1412118, 1.137701, 1.092597, 0, 0, 1, 1, 1,
-0.1401144, 0.4410459, -1.272639, 1, 0, 0, 1, 1,
-0.1369597, 0.9292344, 0.3054273, 1, 0, 0, 1, 1,
-0.1358282, -0.7914687, -3.037785, 1, 0, 0, 1, 1,
-0.1335285, -1.925457, -3.366172, 1, 0, 0, 1, 1,
-0.1334489, 0.621284, -0.2297604, 1, 0, 0, 1, 1,
-0.1213574, 0.6422332, 0.5645939, 0, 0, 0, 1, 1,
-0.1203352, -0.1219218, -2.163107, 0, 0, 0, 1, 1,
-0.1174055, -0.2056635, -1.31259, 0, 0, 0, 1, 1,
-0.1152263, 0.3832377, -0.3479185, 0, 0, 0, 1, 1,
-0.1145455, 0.4142217, -1.357393, 0, 0, 0, 1, 1,
-0.1139001, -1.421946, -3.490364, 0, 0, 0, 1, 1,
-0.1131094, -1.22725, -2.794297, 0, 0, 0, 1, 1,
-0.1110247, -1.404077, -2.594865, 1, 1, 1, 1, 1,
-0.1039333, 0.2519702, -0.4761188, 1, 1, 1, 1, 1,
-0.1035428, -0.1556639, -3.234334, 1, 1, 1, 1, 1,
-0.1018885, -0.4836521, -2.285915, 1, 1, 1, 1, 1,
-0.09848801, -0.9158853, -2.26544, 1, 1, 1, 1, 1,
-0.09455159, 0.4458388, 2.550393, 1, 1, 1, 1, 1,
-0.09410798, 0.6662131, -1.852507, 1, 1, 1, 1, 1,
-0.08827899, -1.028851, -2.318111, 1, 1, 1, 1, 1,
-0.08610904, 0.8346867, -1.894273, 1, 1, 1, 1, 1,
-0.08568224, 0.4131061, 0.8356478, 1, 1, 1, 1, 1,
-0.0849308, -2.999542, -4.813366, 1, 1, 1, 1, 1,
-0.08132578, 0.6458674, 1.98354, 1, 1, 1, 1, 1,
-0.07485418, -0.8418989, -3.607367, 1, 1, 1, 1, 1,
-0.07476325, 2.290735, 0.2790324, 1, 1, 1, 1, 1,
-0.07067212, -0.221205, -1.453461, 1, 1, 1, 1, 1,
-0.06671982, -0.9312773, -3.171324, 0, 0, 1, 1, 1,
-0.0636906, 0.9058446, -0.2105982, 1, 0, 0, 1, 1,
-0.06238859, -0.5605128, -0.9249899, 1, 0, 0, 1, 1,
-0.06069469, -0.835001, -2.484875, 1, 0, 0, 1, 1,
-0.0597584, -1.198031, -2.369271, 1, 0, 0, 1, 1,
-0.04594639, -1.071768, -0.7577359, 1, 0, 0, 1, 1,
-0.04357582, -0.4720426, -3.400377, 0, 0, 0, 1, 1,
-0.04081494, -0.9763157, -2.539074, 0, 0, 0, 1, 1,
-0.03894782, -0.6846745, -3.133565, 0, 0, 0, 1, 1,
-0.03846142, -0.4688798, -2.750233, 0, 0, 0, 1, 1,
-0.03229816, 0.2677492, -2.537348, 0, 0, 0, 1, 1,
-0.02807048, -1.225063, -3.624142, 0, 0, 0, 1, 1,
-0.02577136, -0.2352964, -3.795164, 0, 0, 0, 1, 1,
-0.02507091, 0.2661056, -1.855305, 1, 1, 1, 1, 1,
-0.02117519, -0.3438427, -3.26126, 1, 1, 1, 1, 1,
-0.02082621, 0.3135346, 0.16857, 1, 1, 1, 1, 1,
-0.01711949, -0.5736787, -2.171171, 1, 1, 1, 1, 1,
-0.01636645, 0.6541106, -0.6701748, 1, 1, 1, 1, 1,
-0.01175284, 1.855499, -0.3700783, 1, 1, 1, 1, 1,
-0.01072147, -0.4228965, -3.05571, 1, 1, 1, 1, 1,
-0.006113383, -0.6359598, -3.713877, 1, 1, 1, 1, 1,
-0.005839084, -0.2740538, -3.965767, 1, 1, 1, 1, 1,
-0.005554154, -1.056516, -3.338316, 1, 1, 1, 1, 1,
-0.004097415, -0.3541608, -3.075024, 1, 1, 1, 1, 1,
-0.002894269, 1.396721, 1.105562, 1, 1, 1, 1, 1,
0.001430139, 0.5958145, 0.004188118, 1, 1, 1, 1, 1,
0.001560432, -0.02534585, 2.381469, 1, 1, 1, 1, 1,
0.001687224, 1.751651, 0.2599574, 1, 1, 1, 1, 1,
0.002481085, -0.7923028, 0.6623481, 0, 0, 1, 1, 1,
0.004343548, 1.285625, -0.7609743, 1, 0, 0, 1, 1,
0.004922201, 0.7678954, -1.535747, 1, 0, 0, 1, 1,
0.005417801, 0.3961471, -0.3801147, 1, 0, 0, 1, 1,
0.007750945, -1.306122, 3.414875, 1, 0, 0, 1, 1,
0.009731804, 0.2352583, 0.2067959, 1, 0, 0, 1, 1,
0.01008871, -0.8633599, 4.82313, 0, 0, 0, 1, 1,
0.01483789, -0.6480497, 2.337056, 0, 0, 0, 1, 1,
0.01512057, 0.1969575, 0.668802, 0, 0, 0, 1, 1,
0.01733558, -1.923979, 3.28602, 0, 0, 0, 1, 1,
0.01771371, -0.7049726, 2.283954, 0, 0, 0, 1, 1,
0.0183639, 0.8837808, -3.574878, 0, 0, 0, 1, 1,
0.02220421, 0.7200909, 0.2639956, 0, 0, 0, 1, 1,
0.02606127, 1.421235, 1.9102, 1, 1, 1, 1, 1,
0.0260729, 0.2213412, -0.5012015, 1, 1, 1, 1, 1,
0.02713584, -0.8880658, 3.22113, 1, 1, 1, 1, 1,
0.02718549, 0.5206127, 0.7101568, 1, 1, 1, 1, 1,
0.03347544, 0.8713018, -0.4184909, 1, 1, 1, 1, 1,
0.03363122, -0.1117242, 4.37385, 1, 1, 1, 1, 1,
0.03825178, -0.6389369, 3.02175, 1, 1, 1, 1, 1,
0.03924407, 0.1838563, 0.8017496, 1, 1, 1, 1, 1,
0.04239507, -1.203689, 4.26126, 1, 1, 1, 1, 1,
0.04447788, -2.11768, 2.041299, 1, 1, 1, 1, 1,
0.04448891, 0.3455122, -0.004711398, 1, 1, 1, 1, 1,
0.05204591, 0.2481334, 1.863243, 1, 1, 1, 1, 1,
0.05374025, -1.545829, 3.994419, 1, 1, 1, 1, 1,
0.05620277, -2.319602, 3.574391, 1, 1, 1, 1, 1,
0.06021063, -0.7472384, 3.636922, 1, 1, 1, 1, 1,
0.06432693, 0.4741057, 1.631926, 0, 0, 1, 1, 1,
0.06814764, -0.1237542, 4.353485, 1, 0, 0, 1, 1,
0.06855277, -0.7102934, 2.239773, 1, 0, 0, 1, 1,
0.07244777, -1.218608, 2.463053, 1, 0, 0, 1, 1,
0.07365825, -0.4215639, 3.905735, 1, 0, 0, 1, 1,
0.0780521, 0.7786246, -0.08661998, 1, 0, 0, 1, 1,
0.08607426, -1.700358, 3.180039, 0, 0, 0, 1, 1,
0.08748263, -0.4897633, 3.424817, 0, 0, 0, 1, 1,
0.08829592, -1.174715, 1.017202, 0, 0, 0, 1, 1,
0.1007412, -0.9072139, 3.831591, 0, 0, 0, 1, 1,
0.1031859, 0.9751491, 0.4021315, 0, 0, 0, 1, 1,
0.1094733, -0.8675088, 2.384918, 0, 0, 0, 1, 1,
0.1097185, -0.01503867, 1.509831, 0, 0, 0, 1, 1,
0.1137138, 0.1454376, 0.6519753, 1, 1, 1, 1, 1,
0.1138778, -0.8143463, 2.195562, 1, 1, 1, 1, 1,
0.1161637, -0.06523756, 2.23473, 1, 1, 1, 1, 1,
0.1167984, 1.134576, -0.1282137, 1, 1, 1, 1, 1,
0.1185201, 0.233372, 1.632799, 1, 1, 1, 1, 1,
0.1228318, -0.6026428, 2.33076, 1, 1, 1, 1, 1,
0.1263665, 0.8664479, -0.8279238, 1, 1, 1, 1, 1,
0.1279896, -1.042081, 3.340538, 1, 1, 1, 1, 1,
0.1283077, 1.676813, -1.43585, 1, 1, 1, 1, 1,
0.1287795, 0.3899871, 0.431926, 1, 1, 1, 1, 1,
0.1320812, -0.3331703, 4.191587, 1, 1, 1, 1, 1,
0.1383544, -0.9260977, 2.80856, 1, 1, 1, 1, 1,
0.1384308, -1.127037, 3.188102, 1, 1, 1, 1, 1,
0.1390975, 0.6325125, 1.692927, 1, 1, 1, 1, 1,
0.1427391, 0.8561163, -0.7356747, 1, 1, 1, 1, 1,
0.1443539, -1.07487, 1.490729, 0, 0, 1, 1, 1,
0.1457682, 0.6665962, -0.08045523, 1, 0, 0, 1, 1,
0.1486072, -0.1991189, 4.327434, 1, 0, 0, 1, 1,
0.1498971, -0.2948917, 1.751827, 1, 0, 0, 1, 1,
0.1520182, -0.3265809, 2.821914, 1, 0, 0, 1, 1,
0.1546909, -0.262655, 1.930097, 1, 0, 0, 1, 1,
0.1566936, 1.264741, 1.105476, 0, 0, 0, 1, 1,
0.1570393, 0.5276657, 0.2946455, 0, 0, 0, 1, 1,
0.1584898, 2.303401, -0.1455622, 0, 0, 0, 1, 1,
0.1615014, 1.608485, -0.353563, 0, 0, 0, 1, 1,
0.1647661, -1.574582, 2.91361, 0, 0, 0, 1, 1,
0.1658578, -0.159987, 1.784946, 0, 0, 0, 1, 1,
0.1663961, 0.9402684, -0.3489793, 0, 0, 0, 1, 1,
0.168305, -0.1395211, 0.444567, 1, 1, 1, 1, 1,
0.1709487, 2.791805, 2.177984, 1, 1, 1, 1, 1,
0.1715976, -0.1670353, 0.9739749, 1, 1, 1, 1, 1,
0.1753097, -1.806481, 2.86269, 1, 1, 1, 1, 1,
0.1771114, -0.4489858, 1.489768, 1, 1, 1, 1, 1,
0.1777242, 0.8940933, 1.171931, 1, 1, 1, 1, 1,
0.1824813, -0.3653391, 0.299686, 1, 1, 1, 1, 1,
0.182551, -0.3783468, 1.656296, 1, 1, 1, 1, 1,
0.1835494, -0.2004538, 2.163003, 1, 1, 1, 1, 1,
0.1891855, 0.6424015, 0.5693513, 1, 1, 1, 1, 1,
0.1963344, -0.275115, 3.092525, 1, 1, 1, 1, 1,
0.1973826, -0.01052412, 1.418276, 1, 1, 1, 1, 1,
0.2004885, -0.1685686, 1.340592, 1, 1, 1, 1, 1,
0.2007294, 0.008962987, -0.6619001, 1, 1, 1, 1, 1,
0.201069, 1.628275, 1.154926, 1, 1, 1, 1, 1,
0.2026338, 0.04820221, 1.584293, 0, 0, 1, 1, 1,
0.2047171, 0.3395074, 2.391278, 1, 0, 0, 1, 1,
0.2050247, 1.255826, 0.05779066, 1, 0, 0, 1, 1,
0.2079885, -0.6321304, 3.88198, 1, 0, 0, 1, 1,
0.208638, 0.8771149, 0.9574719, 1, 0, 0, 1, 1,
0.2107709, 0.4235331, 1.080066, 1, 0, 0, 1, 1,
0.2124691, -0.0583066, 3.013615, 0, 0, 0, 1, 1,
0.2170365, -0.3079315, 2.145878, 0, 0, 0, 1, 1,
0.220344, 1.106491, -0.05207513, 0, 0, 0, 1, 1,
0.2209198, -2.241753, 3.265443, 0, 0, 0, 1, 1,
0.2221277, -0.07044043, 1.180422, 0, 0, 0, 1, 1,
0.2264419, -0.4392387, 2.769788, 0, 0, 0, 1, 1,
0.2268684, -0.1697017, 2.055733, 0, 0, 0, 1, 1,
0.2290283, -1.617226, 3.621271, 1, 1, 1, 1, 1,
0.2301802, 0.6906338, -1.182763, 1, 1, 1, 1, 1,
0.2304567, -0.2252137, 1.616186, 1, 1, 1, 1, 1,
0.2314446, 1.545177, 1.155719, 1, 1, 1, 1, 1,
0.2330518, 0.2409304, 1.493551, 1, 1, 1, 1, 1,
0.2377887, 0.1021943, 1.01297, 1, 1, 1, 1, 1,
0.2458508, 0.1297466, 2.265576, 1, 1, 1, 1, 1,
0.2481793, -0.8261394, 0.7407757, 1, 1, 1, 1, 1,
0.249513, -0.8215545, 2.827544, 1, 1, 1, 1, 1,
0.2501676, -1.150239, 0.7881944, 1, 1, 1, 1, 1,
0.2527213, -0.2831586, 3.073068, 1, 1, 1, 1, 1,
0.2553789, -0.04776238, 1.535856, 1, 1, 1, 1, 1,
0.2568894, 0.3890028, 1.105683, 1, 1, 1, 1, 1,
0.2569223, 0.3475417, 0.6314414, 1, 1, 1, 1, 1,
0.2569486, 1.395584, 0.7447312, 1, 1, 1, 1, 1,
0.2611475, 1.688928, -0.9373196, 0, 0, 1, 1, 1,
0.2726585, 1.181328, -0.4283338, 1, 0, 0, 1, 1,
0.2734621, 0.6093123, 0.396453, 1, 0, 0, 1, 1,
0.2754171, -0.6268356, 1.573177, 1, 0, 0, 1, 1,
0.2768463, -1.049858, 3.895611, 1, 0, 0, 1, 1,
0.2769386, -0.9860252, 4.308173, 1, 0, 0, 1, 1,
0.2792414, 0.372552, 0.52423, 0, 0, 0, 1, 1,
0.2792461, 1.040615, 1.426072, 0, 0, 0, 1, 1,
0.2810773, -0.2692493, 2.215507, 0, 0, 0, 1, 1,
0.2846367, 0.5978081, 1.686165, 0, 0, 0, 1, 1,
0.2865171, -0.0810314, 2.629147, 0, 0, 0, 1, 1,
0.2887633, -0.9362602, 3.223427, 0, 0, 0, 1, 1,
0.2891353, -0.6967463, 4.321791, 0, 0, 0, 1, 1,
0.2986355, 0.6361209, 0.2109026, 1, 1, 1, 1, 1,
0.2990143, -1.806245, 3.5794, 1, 1, 1, 1, 1,
0.300699, -1.168104, 2.408719, 1, 1, 1, 1, 1,
0.301871, -2.184335, 1.882195, 1, 1, 1, 1, 1,
0.3032742, -0.3509988, 4.766637, 1, 1, 1, 1, 1,
0.3058135, 0.1851151, -1.322243, 1, 1, 1, 1, 1,
0.3107014, -0.8297639, 1.921099, 1, 1, 1, 1, 1,
0.3122024, -0.5055147, 0.8617425, 1, 1, 1, 1, 1,
0.3146152, -0.06231824, 1.008549, 1, 1, 1, 1, 1,
0.3177104, 0.1962997, -0.5463008, 1, 1, 1, 1, 1,
0.3195162, -0.4007676, 3.517097, 1, 1, 1, 1, 1,
0.3283437, 0.6455422, 0.3560186, 1, 1, 1, 1, 1,
0.3289101, -0.323659, 4.968983, 1, 1, 1, 1, 1,
0.3292252, -0.9572161, 2.918175, 1, 1, 1, 1, 1,
0.3310446, -1.715115, 2.992602, 1, 1, 1, 1, 1,
0.3315533, 0.3747942, 1.382598, 0, 0, 1, 1, 1,
0.3366912, -0.8200734, 2.739552, 1, 0, 0, 1, 1,
0.3442249, 0.2434776, 1.579034, 1, 0, 0, 1, 1,
0.349314, -2.241075, 1.942374, 1, 0, 0, 1, 1,
0.3496121, -2.481247, 5.309348, 1, 0, 0, 1, 1,
0.3508295, -0.2806756, 2.456375, 1, 0, 0, 1, 1,
0.3542175, -0.08578079, 4.399857, 0, 0, 0, 1, 1,
0.3561419, -0.9512441, 2.741957, 0, 0, 0, 1, 1,
0.3576232, -1.307906, 4.783312, 0, 0, 0, 1, 1,
0.3662429, 0.03139411, 1.595315, 0, 0, 0, 1, 1,
0.3677823, -0.06070499, 1.466707, 0, 0, 0, 1, 1,
0.371372, -0.1835966, 2.067969, 0, 0, 0, 1, 1,
0.3824852, -0.3079194, 3.100805, 0, 0, 0, 1, 1,
0.3840187, -0.2073069, 1.304871, 1, 1, 1, 1, 1,
0.3864785, 0.2889416, 2.692929, 1, 1, 1, 1, 1,
0.3971122, -0.3769079, 2.465278, 1, 1, 1, 1, 1,
0.3990325, 0.691989, 0.09552365, 1, 1, 1, 1, 1,
0.401056, 0.8010653, -0.2364014, 1, 1, 1, 1, 1,
0.4023513, -0.7145364, 2.739168, 1, 1, 1, 1, 1,
0.4047337, 0.6731485, 0.9778752, 1, 1, 1, 1, 1,
0.4075124, -1.141829, 1.277519, 1, 1, 1, 1, 1,
0.4084104, -1.898723, 3.913415, 1, 1, 1, 1, 1,
0.4099494, -0.1596939, 0.9438567, 1, 1, 1, 1, 1,
0.4101202, -0.3009949, 2.89623, 1, 1, 1, 1, 1,
0.4117405, -0.3374004, 1.880811, 1, 1, 1, 1, 1,
0.4180728, -0.8458239, 2.493568, 1, 1, 1, 1, 1,
0.4206345, 0.5386468, -0.3019234, 1, 1, 1, 1, 1,
0.424627, -0.7193889, 2.834338, 1, 1, 1, 1, 1,
0.4256263, -0.6966032, 3.395749, 0, 0, 1, 1, 1,
0.4273641, -0.684983, 3.14228, 1, 0, 0, 1, 1,
0.4330834, -1.326133, 1.239068, 1, 0, 0, 1, 1,
0.4348786, 0.8396045, 1.632362, 1, 0, 0, 1, 1,
0.4354712, 2.093955, -0.9091322, 1, 0, 0, 1, 1,
0.4405769, -1.15205, 3.462411, 1, 0, 0, 1, 1,
0.4432543, -1.020111, 3.580961, 0, 0, 0, 1, 1,
0.4448016, -0.06631166, 3.920476, 0, 0, 0, 1, 1,
0.4449035, 0.6562735, 1.142137, 0, 0, 0, 1, 1,
0.4454575, 0.08062836, 3.623034, 0, 0, 0, 1, 1,
0.4479215, 0.8746941, 0.03078061, 0, 0, 0, 1, 1,
0.4497056, -0.6749698, 1.882017, 0, 0, 0, 1, 1,
0.467029, 0.322318, 0.9877013, 0, 0, 0, 1, 1,
0.46905, 0.944864, -0.01831562, 1, 1, 1, 1, 1,
0.473965, -0.9496258, 2.080332, 1, 1, 1, 1, 1,
0.4820673, 1.45402, -1.055024, 1, 1, 1, 1, 1,
0.4860795, 0.731999, -1.92781, 1, 1, 1, 1, 1,
0.4943599, 1.026007, 0.4250327, 1, 1, 1, 1, 1,
0.4949608, -0.03603703, 3.86613, 1, 1, 1, 1, 1,
0.4983438, 0.9384302, 0.4808769, 1, 1, 1, 1, 1,
0.5022511, 1.522556, -0.3903511, 1, 1, 1, 1, 1,
0.5085598, 1.827328, 1.319488, 1, 1, 1, 1, 1,
0.5105212, 0.6767021, 1.18621, 1, 1, 1, 1, 1,
0.5151615, 0.1693673, 0.3778568, 1, 1, 1, 1, 1,
0.5158215, 1.522927, -0.7113407, 1, 1, 1, 1, 1,
0.5171168, -0.6746809, 1.262035, 1, 1, 1, 1, 1,
0.5230637, 0.501627, 1.015252, 1, 1, 1, 1, 1,
0.5256929, 0.5548715, -1.731526, 1, 1, 1, 1, 1,
0.5259383, -1.605368, 2.456489, 0, 0, 1, 1, 1,
0.527588, 0.05832377, 1.996819, 1, 0, 0, 1, 1,
0.5277269, -0.08630858, 0.7109654, 1, 0, 0, 1, 1,
0.5279057, -0.3819549, 2.00804, 1, 0, 0, 1, 1,
0.5285517, -0.6549013, 2.399098, 1, 0, 0, 1, 1,
0.530846, -0.2924982, 2.815245, 1, 0, 0, 1, 1,
0.5339336, -0.4948115, 3.31339, 0, 0, 0, 1, 1,
0.5362263, -0.8504155, 2.768799, 0, 0, 0, 1, 1,
0.5388746, 0.324197, 1.761433, 0, 0, 0, 1, 1,
0.5446323, 0.4371621, 0.1506059, 0, 0, 0, 1, 1,
0.5460205, 0.9498152, 0.06694788, 0, 0, 0, 1, 1,
0.5468383, 2.717932, -1.017228, 0, 0, 0, 1, 1,
0.5517024, -0.6541418, 3.660885, 0, 0, 0, 1, 1,
0.5522555, 1.824809, -0.5815704, 1, 1, 1, 1, 1,
0.5550401, 0.3225622, 0.300605, 1, 1, 1, 1, 1,
0.5620788, 0.7593047, 0.2678533, 1, 1, 1, 1, 1,
0.5625098, -0.6314325, 4.412542, 1, 1, 1, 1, 1,
0.5626453, -0.875823, 2.69242, 1, 1, 1, 1, 1,
0.5633703, -1.050821, 1.896592, 1, 1, 1, 1, 1,
0.5634928, -1.378759, 2.600544, 1, 1, 1, 1, 1,
0.5704136, -0.3044894, 2.880098, 1, 1, 1, 1, 1,
0.5752237, 1.853382, -0.1392192, 1, 1, 1, 1, 1,
0.5849891, 1.27049, -0.9421706, 1, 1, 1, 1, 1,
0.5850933, 0.7290825, -0.2952842, 1, 1, 1, 1, 1,
0.5871938, 0.7225735, 0.1012502, 1, 1, 1, 1, 1,
0.5885686, 0.7414507, 1.426628, 1, 1, 1, 1, 1,
0.5888866, 1.165761, 1.860639, 1, 1, 1, 1, 1,
0.5903298, 1.132409, 1.354996, 1, 1, 1, 1, 1,
0.590908, 0.01621999, 0.5165049, 0, 0, 1, 1, 1,
0.5940349, -3.062329, 4.409728, 1, 0, 0, 1, 1,
0.5944337, -1.129574, 2.076219, 1, 0, 0, 1, 1,
0.5969232, -0.3827522, 1.611738, 1, 0, 0, 1, 1,
0.5997396, 0.9699796, 0.2074437, 1, 0, 0, 1, 1,
0.6005611, -0.9353212, 1.883579, 1, 0, 0, 1, 1,
0.6014048, 0.05355641, 1.845782, 0, 0, 0, 1, 1,
0.6026982, 1.239477, 1.717757, 0, 0, 0, 1, 1,
0.6028728, -1.356251, 3.02366, 0, 0, 0, 1, 1,
0.6049632, 0.9308962, -0.137311, 0, 0, 0, 1, 1,
0.6065735, 0.2720389, 3.260778, 0, 0, 0, 1, 1,
0.6092195, 1.303884, 1.446818, 0, 0, 0, 1, 1,
0.6149358, 1.424127, 1.991131, 0, 0, 0, 1, 1,
0.6154298, -0.5206561, 2.236619, 1, 1, 1, 1, 1,
0.6293994, -0.9017487, 3.262979, 1, 1, 1, 1, 1,
0.6386735, -0.5900854, 5.043827, 1, 1, 1, 1, 1,
0.6409257, 0.395704, 1.799011, 1, 1, 1, 1, 1,
0.6425028, 0.4282911, -0.3592925, 1, 1, 1, 1, 1,
0.6473616, -0.8773051, 2.055319, 1, 1, 1, 1, 1,
0.651106, -1.347796, 2.507582, 1, 1, 1, 1, 1,
0.6554101, 0.7362784, 0.1708682, 1, 1, 1, 1, 1,
0.6560413, 0.04930417, 0.6087286, 1, 1, 1, 1, 1,
0.6565622, -0.9761639, 3.396563, 1, 1, 1, 1, 1,
0.6583563, 0.7557144, 1.355067, 1, 1, 1, 1, 1,
0.6602554, -1.36913, 2.331171, 1, 1, 1, 1, 1,
0.6619914, -0.08847079, -0.3386629, 1, 1, 1, 1, 1,
0.6653933, -0.4467745, 1.814349, 1, 1, 1, 1, 1,
0.6660816, -0.4147238, 2.018902, 1, 1, 1, 1, 1,
0.6695247, 0.02153953, 2.363673, 0, 0, 1, 1, 1,
0.6726782, 0.1310831, 0.3323092, 1, 0, 0, 1, 1,
0.6740555, 1.568416, 0.3393031, 1, 0, 0, 1, 1,
0.675566, 1.23449, -0.7306798, 1, 0, 0, 1, 1,
0.6832874, 0.7424724, 0.27309, 1, 0, 0, 1, 1,
0.6855268, 0.4296479, 1.333113, 1, 0, 0, 1, 1,
0.68782, -0.04970192, 1.02205, 0, 0, 0, 1, 1,
0.6898798, 0.377882, 2.163163, 0, 0, 0, 1, 1,
0.6918572, 0.3152374, 0.5058143, 0, 0, 0, 1, 1,
0.6974771, -0.9606712, 1.967772, 0, 0, 0, 1, 1,
0.7035419, 1.033896, 1.164826, 0, 0, 0, 1, 1,
0.7148575, 0.5577114, 3.656434, 0, 0, 0, 1, 1,
0.728866, -0.7641189, 0.846178, 0, 0, 0, 1, 1,
0.7324003, -0.7260582, 1.718284, 1, 1, 1, 1, 1,
0.740295, -1.270063, 0.512945, 1, 1, 1, 1, 1,
0.743184, -0.7920964, 2.841525, 1, 1, 1, 1, 1,
0.746015, -1.806052, 1.783459, 1, 1, 1, 1, 1,
0.7520718, -1.108857, 3.251842, 1, 1, 1, 1, 1,
0.7522853, -0.5782502, 1.195943, 1, 1, 1, 1, 1,
0.7525571, 1.513871, 0.3896929, 1, 1, 1, 1, 1,
0.7537878, 0.8005609, 0.01684884, 1, 1, 1, 1, 1,
0.7545281, -0.1196114, 1.948938, 1, 1, 1, 1, 1,
0.7593623, 2.57985, 0.1773825, 1, 1, 1, 1, 1,
0.7629487, -1.573955, 3.879344, 1, 1, 1, 1, 1,
0.763872, 0.258385, 1.175095, 1, 1, 1, 1, 1,
0.7645212, 0.583023, 0.2702658, 1, 1, 1, 1, 1,
0.7648852, 1.342323, 3.552694, 1, 1, 1, 1, 1,
0.7676291, -0.7554649, 3.26889, 1, 1, 1, 1, 1,
0.773197, 0.6433434, 0.822916, 0, 0, 1, 1, 1,
0.7741036, -1.60702, 2.644732, 1, 0, 0, 1, 1,
0.7744135, -0.1437627, 1.033936, 1, 0, 0, 1, 1,
0.7749243, 1.44881, 0.9551367, 1, 0, 0, 1, 1,
0.7768162, -0.2497535, 1.538527, 1, 0, 0, 1, 1,
0.7811875, 0.7569304, 0.952738, 1, 0, 0, 1, 1,
0.7866026, 0.7255453, -0.2529024, 0, 0, 0, 1, 1,
0.7895905, 0.3185021, 0.8468974, 0, 0, 0, 1, 1,
0.7898043, -0.4049361, 3.480744, 0, 0, 0, 1, 1,
0.7915351, -1.161659, 2.346582, 0, 0, 0, 1, 1,
0.7954677, -1.17737, 2.157938, 0, 0, 0, 1, 1,
0.7973441, 0.3721563, 1.865148, 0, 0, 0, 1, 1,
0.8070863, 1.240314, 1.003484, 0, 0, 0, 1, 1,
0.8079102, -0.6445445, 2.021083, 1, 1, 1, 1, 1,
0.8248843, 0.4323502, 1.008055, 1, 1, 1, 1, 1,
0.8357119, -2.540361, 3.219148, 1, 1, 1, 1, 1,
0.838992, 2.020544, 1.020492, 1, 1, 1, 1, 1,
0.8400919, 0.1307112, 2.646412, 1, 1, 1, 1, 1,
0.8522173, -0.001041545, 2.016905, 1, 1, 1, 1, 1,
0.8588737, 0.7357492, 0.8388172, 1, 1, 1, 1, 1,
0.8595901, -2.061398, 2.981055, 1, 1, 1, 1, 1,
0.8609483, 0.7095478, 1.578562, 1, 1, 1, 1, 1,
0.861708, 0.5173287, 0.7973014, 1, 1, 1, 1, 1,
0.8690458, 0.4416147, 1.38099, 1, 1, 1, 1, 1,
0.8700047, 1.111437, 0.08186944, 1, 1, 1, 1, 1,
0.8734376, 0.9641482, 0.63363, 1, 1, 1, 1, 1,
0.8765955, 0.288314, 1.539617, 1, 1, 1, 1, 1,
0.8790708, 1.261077, 0.08773932, 1, 1, 1, 1, 1,
0.8823882, -1.645949, 2.897548, 0, 0, 1, 1, 1,
0.8826172, -0.07842811, 1.170058, 1, 0, 0, 1, 1,
0.8848508, -0.6742895, 0.5276477, 1, 0, 0, 1, 1,
0.8885207, -1.577548, 3.244372, 1, 0, 0, 1, 1,
0.8899863, -1.417536, 1.377286, 1, 0, 0, 1, 1,
0.8901864, -0.2621544, 2.321841, 1, 0, 0, 1, 1,
0.8902005, -1.050738, 2.703722, 0, 0, 0, 1, 1,
0.8914033, -1.203711, 2.032799, 0, 0, 0, 1, 1,
0.8950124, -2.180272, 2.839206, 0, 0, 0, 1, 1,
0.9018697, -0.1284101, 1.340943, 0, 0, 0, 1, 1,
0.9042197, 0.5904346, 0.9129679, 0, 0, 0, 1, 1,
0.9052122, 2.085205, -0.264388, 0, 0, 0, 1, 1,
0.9076667, 0.004156354, 1.637681, 0, 0, 0, 1, 1,
0.9107861, 1.36602, 0.5305316, 1, 1, 1, 1, 1,
0.9108834, -1.391093, 2.704931, 1, 1, 1, 1, 1,
0.9134554, -1.031233, 5.007294, 1, 1, 1, 1, 1,
0.9135345, 1.881183, 0.9845021, 1, 1, 1, 1, 1,
0.9195733, 0.7960861, -0.1246035, 1, 1, 1, 1, 1,
0.9200354, -0.5208127, 2.345559, 1, 1, 1, 1, 1,
0.9200506, 1.125832, 0.2217095, 1, 1, 1, 1, 1,
0.9238454, 0.5459672, -0.3912115, 1, 1, 1, 1, 1,
0.9338842, 0.1585009, 1.401311, 1, 1, 1, 1, 1,
0.9367253, 0.01875931, 2.54456, 1, 1, 1, 1, 1,
0.939338, 0.2507263, 1.345233, 1, 1, 1, 1, 1,
0.94554, 0.1013357, 0.399821, 1, 1, 1, 1, 1,
0.9488345, 1.159645, -0.8319615, 1, 1, 1, 1, 1,
0.9519264, 1.312247, 2.097951, 1, 1, 1, 1, 1,
0.9528227, -0.4979805, 1.332002, 1, 1, 1, 1, 1,
0.9548738, 0.05885801, 0.7971078, 0, 0, 1, 1, 1,
0.9551986, -0.2685376, 1.902468, 1, 0, 0, 1, 1,
0.9573575, -0.569102, 1.194402, 1, 0, 0, 1, 1,
0.9637762, 0.2060373, 0.8936655, 1, 0, 0, 1, 1,
0.9755755, -0.6999604, 1.090973, 1, 0, 0, 1, 1,
0.9785964, -1.301765, 2.095114, 1, 0, 0, 1, 1,
0.981982, 0.5018854, 1.651954, 0, 0, 0, 1, 1,
0.9821529, -1.336558, 2.356006, 0, 0, 0, 1, 1,
0.9870394, -0.2466819, 0.831422, 0, 0, 0, 1, 1,
0.9940491, -1.095605, 3.379552, 0, 0, 0, 1, 1,
0.9979497, -0.1953549, 2.21568, 0, 0, 0, 1, 1,
1.000898, -0.8935188, 2.763724, 0, 0, 0, 1, 1,
1.00666, 2.696012, 0.2561873, 0, 0, 0, 1, 1,
1.010648, -0.3583078, 1.340467, 1, 1, 1, 1, 1,
1.014561, -0.7295172, 3.282616, 1, 1, 1, 1, 1,
1.020339, -0.173048, 2.647356, 1, 1, 1, 1, 1,
1.030605, 0.714449, 0.750532, 1, 1, 1, 1, 1,
1.040414, 1.649997, 0.006968599, 1, 1, 1, 1, 1,
1.044868, 0.897181, 0.4471625, 1, 1, 1, 1, 1,
1.045565, 0.06982258, 2.571078, 1, 1, 1, 1, 1,
1.047145, -0.5905859, 2.462839, 1, 1, 1, 1, 1,
1.075613, -1.063266, 3.786134, 1, 1, 1, 1, 1,
1.080087, -1.38275, 3.681147, 1, 1, 1, 1, 1,
1.081248, 1.002433, 1.707855, 1, 1, 1, 1, 1,
1.085961, -0.5625584, 2.327639, 1, 1, 1, 1, 1,
1.088962, -0.7768932, 4.45623, 1, 1, 1, 1, 1,
1.090683, 0.9409196, 1.127679, 1, 1, 1, 1, 1,
1.091601, 0.5893468, 0.5121351, 1, 1, 1, 1, 1,
1.092232, 0.8099703, 0.599858, 0, 0, 1, 1, 1,
1.099586, 0.795641, 0.6708283, 1, 0, 0, 1, 1,
1.115792, -2.160886, 3.449217, 1, 0, 0, 1, 1,
1.120098, -1.103949, 1.242509, 1, 0, 0, 1, 1,
1.127942, 1.048235, 0.7773163, 1, 0, 0, 1, 1,
1.130515, 2.4265, 1.061734, 1, 0, 0, 1, 1,
1.133435, 0.619536, 0.1955794, 0, 0, 0, 1, 1,
1.136154, 0.1224229, 0.4634511, 0, 0, 0, 1, 1,
1.14372, -0.3429652, 2.078489, 0, 0, 0, 1, 1,
1.148855, -1.503964, 3.189493, 0, 0, 0, 1, 1,
1.149328, 0.4529533, 2.128054, 0, 0, 0, 1, 1,
1.152463, -0.8310398, 0.5582812, 0, 0, 0, 1, 1,
1.16218, -1.166033, 2.279433, 0, 0, 0, 1, 1,
1.167661, 1.769, -0.2336087, 1, 1, 1, 1, 1,
1.167841, -0.6317291, 2.132135, 1, 1, 1, 1, 1,
1.178585, -0.06178266, 1.715047, 1, 1, 1, 1, 1,
1.179352, -0.5960838, 1.69683, 1, 1, 1, 1, 1,
1.18249, 0.5329338, 1.765984, 1, 1, 1, 1, 1,
1.188367, 1.866683, 2.384671, 1, 1, 1, 1, 1,
1.188848, -1.336271, 3.137893, 1, 1, 1, 1, 1,
1.192825, 1.042702, 2.089675, 1, 1, 1, 1, 1,
1.194117, 1.144959, 0.3521833, 1, 1, 1, 1, 1,
1.194844, -0.1262021, 3.462539, 1, 1, 1, 1, 1,
1.205086, 0.2600215, 1.531566, 1, 1, 1, 1, 1,
1.206003, -1.020953, 3.167205, 1, 1, 1, 1, 1,
1.207569, 1.37894, 0.4152283, 1, 1, 1, 1, 1,
1.213498, -1.732487, 2.518741, 1, 1, 1, 1, 1,
1.217492, 1.383691, 1.272352, 1, 1, 1, 1, 1,
1.219856, -0.3856081, 1.967194, 0, 0, 1, 1, 1,
1.21993, 2.292033, -0.05628814, 1, 0, 0, 1, 1,
1.227852, -0.4769626, 1.412185, 1, 0, 0, 1, 1,
1.24869, -0.5637752, 4.105212, 1, 0, 0, 1, 1,
1.257262, 1.25339, 1.25361, 1, 0, 0, 1, 1,
1.257792, 2.025207, 1.210256, 1, 0, 0, 1, 1,
1.264097, 0.4112754, 2.455427, 0, 0, 0, 1, 1,
1.266813, 0.1952362, 1.262529, 0, 0, 0, 1, 1,
1.271489, -1.110685, 2.249532, 0, 0, 0, 1, 1,
1.276221, 0.4085593, 0.1900244, 0, 0, 0, 1, 1,
1.276429, 0.6266325, 1.718609, 0, 0, 0, 1, 1,
1.295061, -1.108608, 1.504362, 0, 0, 0, 1, 1,
1.297893, 0.5377067, 1.123126, 0, 0, 0, 1, 1,
1.30349, -0.05383343, 3.041114, 1, 1, 1, 1, 1,
1.304445, 0.3647517, 1.44786, 1, 1, 1, 1, 1,
1.308431, -0.3685582, 0.09446698, 1, 1, 1, 1, 1,
1.308475, 0.009324335, 1.185845, 1, 1, 1, 1, 1,
1.309165, -1.113404, 1.535017, 1, 1, 1, 1, 1,
1.310378, -1.117882, 0.5611988, 1, 1, 1, 1, 1,
1.310795, -0.7172031, 1.168201, 1, 1, 1, 1, 1,
1.323061, 0.3446805, 1.994768, 1, 1, 1, 1, 1,
1.324262, 0.8968008, 0.6114055, 1, 1, 1, 1, 1,
1.34312, -0.1100978, 3.552002, 1, 1, 1, 1, 1,
1.344224, -0.2644249, 1.145784, 1, 1, 1, 1, 1,
1.348441, -1.42546, 1.910383, 1, 1, 1, 1, 1,
1.356737, 1.564364, 0.6659317, 1, 1, 1, 1, 1,
1.360314, 2.316957, 1.53634, 1, 1, 1, 1, 1,
1.365227, -0.6943454, 1.006799, 1, 1, 1, 1, 1,
1.372705, -1.024903, 1.303612, 0, 0, 1, 1, 1,
1.37317, -0.8959559, 3.640504, 1, 0, 0, 1, 1,
1.375606, -0.2884464, 2.961182, 1, 0, 0, 1, 1,
1.389215, -0.08040229, 2.205246, 1, 0, 0, 1, 1,
1.391182, 1.418347, 1.068466, 1, 0, 0, 1, 1,
1.393014, -0.270392, 2.835218, 1, 0, 0, 1, 1,
1.410639, -0.7975191, 3.524836, 0, 0, 0, 1, 1,
1.410742, 0.1945866, 1.892462, 0, 0, 0, 1, 1,
1.420842, 1.520148, 0.4340622, 0, 0, 0, 1, 1,
1.422295, -0.07494257, 2.515308, 0, 0, 0, 1, 1,
1.430839, 0.8598498, 1.659356, 0, 0, 0, 1, 1,
1.444024, -0.06101935, 2.448661, 0, 0, 0, 1, 1,
1.452024, -0.3923594, 2.54972, 0, 0, 0, 1, 1,
1.47772, -1.373081, 2.47979, 1, 1, 1, 1, 1,
1.498783, -2.385977, 2.851043, 1, 1, 1, 1, 1,
1.499644, -0.1087971, -0.5140524, 1, 1, 1, 1, 1,
1.502711, -0.4955967, 2.172693, 1, 1, 1, 1, 1,
1.514698, 0.3273245, 1.450302, 1, 1, 1, 1, 1,
1.515961, -0.7128158, 2.325382, 1, 1, 1, 1, 1,
1.517959, -0.002021898, 0.7191582, 1, 1, 1, 1, 1,
1.523823, -0.187406, 2.475422, 1, 1, 1, 1, 1,
1.541608, -0.8572868, 2.203499, 1, 1, 1, 1, 1,
1.547415, -0.9493126, 0.6164694, 1, 1, 1, 1, 1,
1.574668, -0.4629032, 1.374232, 1, 1, 1, 1, 1,
1.577494, -0.7445212, 0.6961182, 1, 1, 1, 1, 1,
1.582714, -0.4647796, 2.301869, 1, 1, 1, 1, 1,
1.586564, -0.1266839, 1.659496, 1, 1, 1, 1, 1,
1.588417, 0.2268646, -0.4709623, 1, 1, 1, 1, 1,
1.595539, -1.719382, 1.610844, 0, 0, 1, 1, 1,
1.60284, 0.4773453, 0.6733426, 1, 0, 0, 1, 1,
1.606942, 0.5701303, 2.142605, 1, 0, 0, 1, 1,
1.618381, -2.325917, 0.999561, 1, 0, 0, 1, 1,
1.618677, -0.006791179, 1.995061, 1, 0, 0, 1, 1,
1.635534, -0.01928779, 2.433715, 1, 0, 0, 1, 1,
1.650613, -0.01117018, 1.49787, 0, 0, 0, 1, 1,
1.660578, -0.9504424, 2.98897, 0, 0, 0, 1, 1,
1.671737, -0.04726043, 3.88741, 0, 0, 0, 1, 1,
1.685654, 3.014351, 0.3181679, 0, 0, 0, 1, 1,
1.686602, -1.334155, 1.171638, 0, 0, 0, 1, 1,
1.688362, 1.008123, 0.1052552, 0, 0, 0, 1, 1,
1.701824, -0.5002806, 2.549281, 0, 0, 0, 1, 1,
1.724687, 0.06533508, 1.752905, 1, 1, 1, 1, 1,
1.73392, 0.899729, 0.7935236, 1, 1, 1, 1, 1,
1.75453, 0.0434148, -0.07694726, 1, 1, 1, 1, 1,
1.761946, 2.79001, -1.278162, 1, 1, 1, 1, 1,
1.770116, 0.8137507, -0.02922781, 1, 1, 1, 1, 1,
1.797899, -0.04971764, 1.711646, 1, 1, 1, 1, 1,
1.809999, -0.8801897, -0.3224188, 1, 1, 1, 1, 1,
1.810771, 0.05637668, 1.270247, 1, 1, 1, 1, 1,
1.823567, 0.5494065, 2.677662, 1, 1, 1, 1, 1,
1.824798, -1.232302, 1.923825, 1, 1, 1, 1, 1,
1.847738, 1.644364, 0.1075643, 1, 1, 1, 1, 1,
1.853325, 0.5195926, 0.6689206, 1, 1, 1, 1, 1,
1.859296, -0.2897203, 1.213177, 1, 1, 1, 1, 1,
1.874442, 0.8113668, 1.757395, 1, 1, 1, 1, 1,
1.879341, -0.1952545, 1.141898, 1, 1, 1, 1, 1,
1.883972, 0.4930588, 0.3767665, 0, 0, 1, 1, 1,
1.896916, -0.1870754, 2.798998, 1, 0, 0, 1, 1,
1.926013, -0.9895809, 2.059701, 1, 0, 0, 1, 1,
1.928947, -0.9225029, 2.624237, 1, 0, 0, 1, 1,
1.940772, 2.213056, 0.3331279, 1, 0, 0, 1, 1,
1.993877, 1.883142, 1.214958, 1, 0, 0, 1, 1,
2.034571, -0.3770884, 0.9704387, 0, 0, 0, 1, 1,
2.056168, 0.7065157, 0.3248186, 0, 0, 0, 1, 1,
2.158262, -1.548759, 2.478272, 0, 0, 0, 1, 1,
2.262073, 0.6987171, 0.6166672, 0, 0, 0, 1, 1,
2.280637, -0.09452119, 3.821411, 0, 0, 0, 1, 1,
2.288046, 0.2633606, 1.103917, 0, 0, 0, 1, 1,
2.3663, 0.7086874, -0.0215797, 0, 0, 0, 1, 1,
2.396958, -0.9488159, 2.268313, 1, 1, 1, 1, 1,
2.402148, 0.6581769, 1.657163, 1, 1, 1, 1, 1,
2.433172, -0.6081704, 1.483431, 1, 1, 1, 1, 1,
2.479836, 0.7486167, 1.223277, 1, 1, 1, 1, 1,
2.483032, 0.4452867, 1.819472, 1, 1, 1, 1, 1,
2.54967, -0.04309316, 1.113867, 1, 1, 1, 1, 1,
2.745064, 1.366097, 0.6952039, 1, 1, 1, 1, 1
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
var radius = 9.274478;
var distance = 32.57621;
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
mvMatrix.translate( 0.4822088, 0.04491949, -0.2479908 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.57621);
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