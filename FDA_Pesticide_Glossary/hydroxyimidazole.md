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
-3.005343, -0.789735, -2.00098, 1, 0, 0, 1,
-3.003346, -0.01334777, -2.18457, 1, 0.007843138, 0, 1,
-2.987385, 0.5321112, -2.439646, 1, 0.01176471, 0, 1,
-2.98629, -0.5203504, -2.798034, 1, 0.01960784, 0, 1,
-2.947017, -0.05510956, -1.317592, 1, 0.02352941, 0, 1,
-2.694292, 0.5672206, -3.531043, 1, 0.03137255, 0, 1,
-2.496581, 0.3337574, -1.653294, 1, 0.03529412, 0, 1,
-2.384228, -1.832704, -3.339247, 1, 0.04313726, 0, 1,
-2.355291, 0.07171511, -2.717431, 1, 0.04705882, 0, 1,
-2.298706, 0.9065678, -0.1329535, 1, 0.05490196, 0, 1,
-2.206563, -0.04115228, -2.608525, 1, 0.05882353, 0, 1,
-2.17125, -0.7240791, -0.5424782, 1, 0.06666667, 0, 1,
-2.160136, 0.8057446, -1.69207, 1, 0.07058824, 0, 1,
-2.154049, 0.6748272, -2.832842, 1, 0.07843138, 0, 1,
-2.134146, 0.4210308, -1.167226, 1, 0.08235294, 0, 1,
-2.085301, 0.5951209, -2.061587, 1, 0.09019608, 0, 1,
-2.057397, 0.4964816, -1.468215, 1, 0.09411765, 0, 1,
-2.052037, 1.762385, -2.495598, 1, 0.1019608, 0, 1,
-2.048327, -1.308644, 0.6969887, 1, 0.1098039, 0, 1,
-2.02161, 0.1023036, -2.62417, 1, 0.1137255, 0, 1,
-2.013013, -0.2768776, -2.496465, 1, 0.1215686, 0, 1,
-1.980452, -0.2651879, -0.06496435, 1, 0.1254902, 0, 1,
-1.967981, -0.09313495, -2.431952, 1, 0.1333333, 0, 1,
-1.966353, -1.912518, -2.345049, 1, 0.1372549, 0, 1,
-1.957441, -1.040104, -0.09932033, 1, 0.145098, 0, 1,
-1.95524, -1.768951, -3.71704, 1, 0.1490196, 0, 1,
-1.947083, -0.03783929, -1.072208, 1, 0.1568628, 0, 1,
-1.933252, 0.007349205, -2.073515, 1, 0.1607843, 0, 1,
-1.932293, 1.229375, -0.3860032, 1, 0.1686275, 0, 1,
-1.930928, -0.5248849, -1.984911, 1, 0.172549, 0, 1,
-1.922141, 2.037971, -0.9282438, 1, 0.1803922, 0, 1,
-1.918727, -0.8579227, -0.8617392, 1, 0.1843137, 0, 1,
-1.898883, -0.2088498, -0.6713372, 1, 0.1921569, 0, 1,
-1.897911, -0.9083575, -1.791126, 1, 0.1960784, 0, 1,
-1.896961, -0.441231, -2.781268, 1, 0.2039216, 0, 1,
-1.841926, 0.1844113, 0.2853504, 1, 0.2117647, 0, 1,
-1.841261, -0.07922966, -0.5393668, 1, 0.2156863, 0, 1,
-1.830799, -0.11704, -0.7261993, 1, 0.2235294, 0, 1,
-1.82178, -0.6388392, -2.162123, 1, 0.227451, 0, 1,
-1.821252, -0.249747, -2.425493, 1, 0.2352941, 0, 1,
-1.81321, 0.0005447409, -2.598237, 1, 0.2392157, 0, 1,
-1.776, -0.8283478, -2.942125, 1, 0.2470588, 0, 1,
-1.772028, 1.048931, -1.689638, 1, 0.2509804, 0, 1,
-1.76371, -1.486117, -3.022593, 1, 0.2588235, 0, 1,
-1.762277, -1.452165, -3.670933, 1, 0.2627451, 0, 1,
-1.759585, 0.7225242, -0.6537492, 1, 0.2705882, 0, 1,
-1.718891, 0.2203602, -2.238257, 1, 0.2745098, 0, 1,
-1.690048, 0.1143737, -1.028631, 1, 0.282353, 0, 1,
-1.661854, -1.041486, -2.208115, 1, 0.2862745, 0, 1,
-1.657909, -0.9581419, -0.5819135, 1, 0.2941177, 0, 1,
-1.637874, -0.5167599, -1.5912, 1, 0.3019608, 0, 1,
-1.637675, -0.4295095, -2.14118, 1, 0.3058824, 0, 1,
-1.625192, 0.9007878, -1.439085, 1, 0.3137255, 0, 1,
-1.608926, 0.1128722, -1.578457, 1, 0.3176471, 0, 1,
-1.598583, -0.6050034, -1.385498, 1, 0.3254902, 0, 1,
-1.591187, 0.5261346, -1.53739, 1, 0.3294118, 0, 1,
-1.584127, -0.5768378, -1.191322, 1, 0.3372549, 0, 1,
-1.582863, 0.2312962, -1.22699, 1, 0.3411765, 0, 1,
-1.574134, 1.813041, -1.877644, 1, 0.3490196, 0, 1,
-1.568044, -0.2061163, -2.659081, 1, 0.3529412, 0, 1,
-1.564093, 1.53084, -0.9394739, 1, 0.3607843, 0, 1,
-1.557339, 0.5576103, -1.017275, 1, 0.3647059, 0, 1,
-1.547471, 0.08546154, -2.49221, 1, 0.372549, 0, 1,
-1.547272, 1.877364, -0.1864909, 1, 0.3764706, 0, 1,
-1.544334, -2.045908, -1.893568, 1, 0.3843137, 0, 1,
-1.540985, 0.04819224, -1.568326, 1, 0.3882353, 0, 1,
-1.528588, -0.247979, -0.6512338, 1, 0.3960784, 0, 1,
-1.511768, -0.6736553, 0.20324, 1, 0.4039216, 0, 1,
-1.511318, 0.6815205, -1.851497, 1, 0.4078431, 0, 1,
-1.49919, 2.009407, -0.9167378, 1, 0.4156863, 0, 1,
-1.488701, -0.487983, -1.203724, 1, 0.4196078, 0, 1,
-1.484383, 0.4820209, -0.1761555, 1, 0.427451, 0, 1,
-1.479005, -0.3638229, -0.05225376, 1, 0.4313726, 0, 1,
-1.471804, -0.8914067, -2.57406, 1, 0.4392157, 0, 1,
-1.464593, 1.632085, -1.632655, 1, 0.4431373, 0, 1,
-1.463666, -0.4472016, -2.415538, 1, 0.4509804, 0, 1,
-1.461089, -0.182836, -0.4499805, 1, 0.454902, 0, 1,
-1.449486, 1.565668, -1.071548, 1, 0.4627451, 0, 1,
-1.439451, -0.3692094, -1.193953, 1, 0.4666667, 0, 1,
-1.436061, 1.826618, -1.228307, 1, 0.4745098, 0, 1,
-1.425746, -0.1290616, -2.384098, 1, 0.4784314, 0, 1,
-1.410354, 0.2403695, -1.969776, 1, 0.4862745, 0, 1,
-1.404433, -0.8595089, -3.717577, 1, 0.4901961, 0, 1,
-1.400899, -0.4545658, -1.798176, 1, 0.4980392, 0, 1,
-1.400218, 1.727536, -0.268102, 1, 0.5058824, 0, 1,
-1.397094, 1.0834, 0.3148137, 1, 0.509804, 0, 1,
-1.377885, -0.0456501, -1.120203, 1, 0.5176471, 0, 1,
-1.362023, -0.752179, -1.106041, 1, 0.5215687, 0, 1,
-1.360823, 0.4727734, 0.2393016, 1, 0.5294118, 0, 1,
-1.360189, -0.1202473, -0.1955884, 1, 0.5333334, 0, 1,
-1.359242, -0.09119711, -1.638648, 1, 0.5411765, 0, 1,
-1.350897, 0.2184017, -0.5147958, 1, 0.5450981, 0, 1,
-1.349417, 0.1015802, -1.57862, 1, 0.5529412, 0, 1,
-1.347255, 1.223075, -0.4911674, 1, 0.5568628, 0, 1,
-1.340177, 0.8288602, -1.479322, 1, 0.5647059, 0, 1,
-1.334664, 0.2427245, -1.728784, 1, 0.5686275, 0, 1,
-1.334352, -1.787917, -2.525402, 1, 0.5764706, 0, 1,
-1.330597, 0.6139456, -0.8950841, 1, 0.5803922, 0, 1,
-1.328353, 1.111802, -0.9670494, 1, 0.5882353, 0, 1,
-1.320409, -0.0278266, -0.4124998, 1, 0.5921569, 0, 1,
-1.319072, -0.2198858, -1.314412, 1, 0.6, 0, 1,
-1.316228, 0.969732, -1.69883, 1, 0.6078432, 0, 1,
-1.314944, -0.756206, -0.6672522, 1, 0.6117647, 0, 1,
-1.311553, 0.4565008, -0.3822614, 1, 0.6196079, 0, 1,
-1.310909, 0.2285144, -0.3268556, 1, 0.6235294, 0, 1,
-1.302546, -0.5396278, -0.2857562, 1, 0.6313726, 0, 1,
-1.302327, 0.7173415, -0.1443782, 1, 0.6352941, 0, 1,
-1.299787, 0.05351446, -2.558984, 1, 0.6431373, 0, 1,
-1.29754, 0.3012059, -0.652452, 1, 0.6470588, 0, 1,
-1.291075, 0.3250876, -1.270133, 1, 0.654902, 0, 1,
-1.281994, -1.117416, -2.72596, 1, 0.6588235, 0, 1,
-1.269009, -1.757021, -2.86587, 1, 0.6666667, 0, 1,
-1.266421, 0.798911, 0.8446486, 1, 0.6705883, 0, 1,
-1.263262, -0.231915, -1.58621, 1, 0.6784314, 0, 1,
-1.244796, 0.4309646, -1.076524, 1, 0.682353, 0, 1,
-1.241283, 0.4918334, -1.099113, 1, 0.6901961, 0, 1,
-1.238039, 0.02003044, -2.284892, 1, 0.6941177, 0, 1,
-1.237969, 0.9117808, -1.815391, 1, 0.7019608, 0, 1,
-1.224902, 0.7585962, 0.4065644, 1, 0.7098039, 0, 1,
-1.222764, 0.8940927, -1.62568, 1, 0.7137255, 0, 1,
-1.221464, -0.2196469, -2.241009, 1, 0.7215686, 0, 1,
-1.220349, 0.6137784, -1.284109, 1, 0.7254902, 0, 1,
-1.217242, -1.685808, -2.869539, 1, 0.7333333, 0, 1,
-1.21328, -0.2121992, -2.93646, 1, 0.7372549, 0, 1,
-1.210818, -0.2228102, -3.625353, 1, 0.7450981, 0, 1,
-1.209442, 0.3713634, -1.476596, 1, 0.7490196, 0, 1,
-1.207651, -1.522281, -0.6288521, 1, 0.7568628, 0, 1,
-1.205831, 0.01102184, -2.79406, 1, 0.7607843, 0, 1,
-1.205235, -0.6122015, -3.638497, 1, 0.7686275, 0, 1,
-1.204366, -0.3177748, -0.129705, 1, 0.772549, 0, 1,
-1.198482, -0.879433, -3.072504, 1, 0.7803922, 0, 1,
-1.194335, 0.7357835, 0.2954029, 1, 0.7843137, 0, 1,
-1.180951, -0.1648796, -1.30086, 1, 0.7921569, 0, 1,
-1.180703, -0.4310861, -1.513796, 1, 0.7960784, 0, 1,
-1.180034, 0.3801573, -2.005936, 1, 0.8039216, 0, 1,
-1.169196, 0.6378849, -0.2803615, 1, 0.8117647, 0, 1,
-1.169128, 1.006043, 1.011834, 1, 0.8156863, 0, 1,
-1.166606, 0.1665976, -1.909256, 1, 0.8235294, 0, 1,
-1.165017, -1.393179, -1.946728, 1, 0.827451, 0, 1,
-1.158672, -0.7468843, -1.757536, 1, 0.8352941, 0, 1,
-1.150741, -2.174478, -1.594788, 1, 0.8392157, 0, 1,
-1.147638, -0.4356157, -2.304216, 1, 0.8470588, 0, 1,
-1.142665, -1.348245, -2.353361, 1, 0.8509804, 0, 1,
-1.132299, 2.689698, -0.3098388, 1, 0.8588235, 0, 1,
-1.131825, 0.954322, -0.353358, 1, 0.8627451, 0, 1,
-1.127629, -1.303849, -0.8162742, 1, 0.8705882, 0, 1,
-1.127023, -0.9128697, -0.5653822, 1, 0.8745098, 0, 1,
-1.115437, 0.6742232, -1.098998, 1, 0.8823529, 0, 1,
-1.114716, 0.8538277, -0.5511006, 1, 0.8862745, 0, 1,
-1.10948, 1.927877, 1.123299, 1, 0.8941177, 0, 1,
-1.106453, 1.608634, -1.969072, 1, 0.8980392, 0, 1,
-1.096176, -0.3309471, -0.8902588, 1, 0.9058824, 0, 1,
-1.093223, 0.6825935, -1.111351, 1, 0.9137255, 0, 1,
-1.088724, 0.3456475, -1.837507, 1, 0.9176471, 0, 1,
-1.088657, -1.566773, -1.812171, 1, 0.9254902, 0, 1,
-1.086336, -1.998098, -2.854031, 1, 0.9294118, 0, 1,
-1.085341, -0.6928573, -2.307609, 1, 0.9372549, 0, 1,
-1.084335, 0.04904077, -1.059655, 1, 0.9411765, 0, 1,
-1.079002, -2.050414, -0.6865848, 1, 0.9490196, 0, 1,
-1.077689, 1.378129, -1.285708, 1, 0.9529412, 0, 1,
-1.072061, 0.6890585, 1.385019, 1, 0.9607843, 0, 1,
-1.057991, 1.649876, -1.221745, 1, 0.9647059, 0, 1,
-1.057361, -0.5174565, -1.73383, 1, 0.972549, 0, 1,
-1.056232, 2.362696, -1.609707, 1, 0.9764706, 0, 1,
-1.054382, 0.7226229, -0.6503026, 1, 0.9843137, 0, 1,
-1.054207, -1.772734, -3.32161, 1, 0.9882353, 0, 1,
-1.027021, -0.6200064, -3.002439, 1, 0.9960784, 0, 1,
-1.021216, -0.6659494, -1.139966, 0.9960784, 1, 0, 1,
-1.01963, 2.317329, -2.439339, 0.9921569, 1, 0, 1,
-1.01575, -0.608077, -1.888155, 0.9843137, 1, 0, 1,
-1.011679, -1.885182, -2.319128, 0.9803922, 1, 0, 1,
-1.003992, -1.462339, -2.161474, 0.972549, 1, 0, 1,
-1.000682, -0.3436096, -1.705138, 0.9686275, 1, 0, 1,
-0.9980973, 1.04793, 0.3543235, 0.9607843, 1, 0, 1,
-0.9943311, 1.485821, -0.7566741, 0.9568627, 1, 0, 1,
-0.9848548, 1.408431, -0.9063511, 0.9490196, 1, 0, 1,
-0.9785175, 0.7374057, -1.1439, 0.945098, 1, 0, 1,
-0.9772646, -0.1049586, -2.036242, 0.9372549, 1, 0, 1,
-0.9769376, -0.04462507, -2.066056, 0.9333333, 1, 0, 1,
-0.9757898, -1.533443, -2.604455, 0.9254902, 1, 0, 1,
-0.9731819, -0.8182308, -2.024737, 0.9215686, 1, 0, 1,
-0.9695257, 0.5258033, -1.640641, 0.9137255, 1, 0, 1,
-0.9668497, -1.39301, -0.9761214, 0.9098039, 1, 0, 1,
-0.9663863, 1.76104, -2.031266, 0.9019608, 1, 0, 1,
-0.9523032, 0.5119577, -0.584794, 0.8941177, 1, 0, 1,
-0.9512611, 1.836105, -1.801982, 0.8901961, 1, 0, 1,
-0.9498506, -0.5111449, -3.247901, 0.8823529, 1, 0, 1,
-0.9493796, -0.9618332, -1.830728, 0.8784314, 1, 0, 1,
-0.9490561, -1.416965, -0.614477, 0.8705882, 1, 0, 1,
-0.9485194, 0.3027129, -3.600648, 0.8666667, 1, 0, 1,
-0.9453509, -0.5612841, -3.433858, 0.8588235, 1, 0, 1,
-0.9176481, -0.2237623, -2.79496, 0.854902, 1, 0, 1,
-0.9158061, 0.3217964, -2.125835, 0.8470588, 1, 0, 1,
-0.9141901, -0.7398494, -2.434663, 0.8431373, 1, 0, 1,
-0.9128376, 2.723958, -0.3231522, 0.8352941, 1, 0, 1,
-0.9112406, 0.9378144, -0.9175738, 0.8313726, 1, 0, 1,
-0.9110674, -0.9555638, -2.060556, 0.8235294, 1, 0, 1,
-0.9095578, 0.5862955, -0.4107571, 0.8196079, 1, 0, 1,
-0.9072368, -0.1900248, -1.816735, 0.8117647, 1, 0, 1,
-0.9036596, 0.1068261, -1.181111, 0.8078431, 1, 0, 1,
-0.9020711, -0.8840092, -1.18912, 0.8, 1, 0, 1,
-0.8762312, 0.1633082, -0.4753284, 0.7921569, 1, 0, 1,
-0.8752348, 2.250437, -0.1496899, 0.7882353, 1, 0, 1,
-0.8737699, 2.298981, -1.332905, 0.7803922, 1, 0, 1,
-0.8736328, 0.3664377, -0.2469013, 0.7764706, 1, 0, 1,
-0.8676331, -1.067392, -2.565854, 0.7686275, 1, 0, 1,
-0.8544658, -0.4814703, -1.775678, 0.7647059, 1, 0, 1,
-0.8527026, 1.411478, 0.3732496, 0.7568628, 1, 0, 1,
-0.8503188, 0.9911957, -1.495583, 0.7529412, 1, 0, 1,
-0.8499851, 0.2475381, -1.561947, 0.7450981, 1, 0, 1,
-0.845611, 0.1646608, -0.7307076, 0.7411765, 1, 0, 1,
-0.8435691, -0.9022824, -2.87171, 0.7333333, 1, 0, 1,
-0.8432412, -0.6372039, -2.491383, 0.7294118, 1, 0, 1,
-0.8308965, 0.5910842, -1.718771, 0.7215686, 1, 0, 1,
-0.8278942, 0.622857, -2.110403, 0.7176471, 1, 0, 1,
-0.8269748, -0.2618774, -1.772344, 0.7098039, 1, 0, 1,
-0.8110549, 0.7081335, -0.1130977, 0.7058824, 1, 0, 1,
-0.8083556, 0.687607, 1.857268, 0.6980392, 1, 0, 1,
-0.8048422, -0.6618326, -2.276052, 0.6901961, 1, 0, 1,
-0.7977447, 0.06119391, -2.672508, 0.6862745, 1, 0, 1,
-0.7972304, 0.4328289, 0.8480738, 0.6784314, 1, 0, 1,
-0.7966344, 0.3391673, -1.185153, 0.6745098, 1, 0, 1,
-0.7957588, 0.592954, -0.5931495, 0.6666667, 1, 0, 1,
-0.7949733, -0.3067032, -3.863559, 0.6627451, 1, 0, 1,
-0.7935275, -1.104411, -2.327661, 0.654902, 1, 0, 1,
-0.790719, -2.14498, -4.584218, 0.6509804, 1, 0, 1,
-0.7904146, 0.6466542, -2.142924, 0.6431373, 1, 0, 1,
-0.7886757, 0.5273874, -1.252746, 0.6392157, 1, 0, 1,
-0.7816978, 0.9530381, -1.274928, 0.6313726, 1, 0, 1,
-0.7782918, 1.827632, 0.007650674, 0.627451, 1, 0, 1,
-0.7713595, -0.3530761, -0.5761845, 0.6196079, 1, 0, 1,
-0.770819, 0.2175207, -0.2638763, 0.6156863, 1, 0, 1,
-0.7667615, 0.6686665, -1.099373, 0.6078432, 1, 0, 1,
-0.7649564, -1.178588, -3.362903, 0.6039216, 1, 0, 1,
-0.763926, -0.4404855, -2.239512, 0.5960785, 1, 0, 1,
-0.7590033, 0.8310152, -1.355016, 0.5882353, 1, 0, 1,
-0.7584121, 0.2765153, -1.863865, 0.5843138, 1, 0, 1,
-0.7567489, -0.6067379, -3.622782, 0.5764706, 1, 0, 1,
-0.7558623, 0.1832233, -1.58598, 0.572549, 1, 0, 1,
-0.7442611, 1.999118, -0.6797546, 0.5647059, 1, 0, 1,
-0.7438272, 1.47475, -1.165706, 0.5607843, 1, 0, 1,
-0.7366932, 0.6330068, -0.1278251, 0.5529412, 1, 0, 1,
-0.7340859, 1.192442, 0.1694257, 0.5490196, 1, 0, 1,
-0.732188, -0.6456158, -2.540562, 0.5411765, 1, 0, 1,
-0.7254564, 1.684242, -0.7396573, 0.5372549, 1, 0, 1,
-0.7241082, 0.3751782, -1.476864, 0.5294118, 1, 0, 1,
-0.720555, 0.3342443, -1.485974, 0.5254902, 1, 0, 1,
-0.7181626, -1.067127, -2.974276, 0.5176471, 1, 0, 1,
-0.7180698, 0.6755211, -0.6226112, 0.5137255, 1, 0, 1,
-0.7149364, -1.57516, -3.287446, 0.5058824, 1, 0, 1,
-0.7140503, 2.124993, 0.487775, 0.5019608, 1, 0, 1,
-0.7139735, 0.4097192, -1.487573, 0.4941176, 1, 0, 1,
-0.7074956, -0.8565092, -2.671132, 0.4862745, 1, 0, 1,
-0.7073698, 0.05154457, -1.695134, 0.4823529, 1, 0, 1,
-0.7037113, 1.78303, 0.04412802, 0.4745098, 1, 0, 1,
-0.7032798, -0.05337299, -2.288709, 0.4705882, 1, 0, 1,
-0.702641, -2.457634, -4.291999, 0.4627451, 1, 0, 1,
-0.7011001, 0.05438001, -1.497091, 0.4588235, 1, 0, 1,
-0.7006603, 0.4839453, -0.7293139, 0.4509804, 1, 0, 1,
-0.6973742, -0.2840354, -3.017194, 0.4470588, 1, 0, 1,
-0.6912811, 1.6327, -0.1343334, 0.4392157, 1, 0, 1,
-0.686727, 1.351273, 1.180043, 0.4352941, 1, 0, 1,
-0.6858508, -1.02547, -4.152497, 0.427451, 1, 0, 1,
-0.6819165, -1.537053, -4.299654, 0.4235294, 1, 0, 1,
-0.6806356, 0.7413681, -1.041492, 0.4156863, 1, 0, 1,
-0.6775701, -0.8674698, -2.847839, 0.4117647, 1, 0, 1,
-0.6751857, 0.5005574, 0.08619732, 0.4039216, 1, 0, 1,
-0.674113, -0.01481766, -0.6545547, 0.3960784, 1, 0, 1,
-0.6739329, 0.3880941, -1.205089, 0.3921569, 1, 0, 1,
-0.671223, -0.3746913, -2.965707, 0.3843137, 1, 0, 1,
-0.6680906, 1.269647, 0.3017757, 0.3803922, 1, 0, 1,
-0.6605676, 0.7714233, 0.9112208, 0.372549, 1, 0, 1,
-0.658879, -0.4612535, -2.325428, 0.3686275, 1, 0, 1,
-0.6553683, 1.146232, 0.1367573, 0.3607843, 1, 0, 1,
-0.6551601, 1.457134, -0.7967973, 0.3568628, 1, 0, 1,
-0.6548796, 0.3723311, -1.699134, 0.3490196, 1, 0, 1,
-0.6529981, 0.4960643, -0.3020447, 0.345098, 1, 0, 1,
-0.650981, 1.635155, -1.552623, 0.3372549, 1, 0, 1,
-0.6457943, 0.3048072, -1.503532, 0.3333333, 1, 0, 1,
-0.6385933, 0.5034378, -0.00246232, 0.3254902, 1, 0, 1,
-0.6376941, 0.5562615, -1.281115, 0.3215686, 1, 0, 1,
-0.6366115, -2.46833, -1.704245, 0.3137255, 1, 0, 1,
-0.6355118, 1.393429, -0.442494, 0.3098039, 1, 0, 1,
-0.6340752, 1.677484, -1.531556, 0.3019608, 1, 0, 1,
-0.6308167, 1.348854, -0.9251022, 0.2941177, 1, 0, 1,
-0.6300642, -0.708191, -1.899908, 0.2901961, 1, 0, 1,
-0.6220384, 0.2900412, -2.450416, 0.282353, 1, 0, 1,
-0.6113169, -0.3496957, -2.151137, 0.2784314, 1, 0, 1,
-0.6103393, 0.3841985, -0.9881677, 0.2705882, 1, 0, 1,
-0.6074792, 1.091051, -0.2112168, 0.2666667, 1, 0, 1,
-0.6054065, -0.4253985, -1.271417, 0.2588235, 1, 0, 1,
-0.5992678, 0.5573794, -0.9490857, 0.254902, 1, 0, 1,
-0.5955968, -0.8497339, -2.151133, 0.2470588, 1, 0, 1,
-0.5898314, -0.6339006, -2.451851, 0.2431373, 1, 0, 1,
-0.5888338, -1.208554, -3.612582, 0.2352941, 1, 0, 1,
-0.5845463, -0.2744589, -1.854911, 0.2313726, 1, 0, 1,
-0.5840372, 0.1226183, -2.647551, 0.2235294, 1, 0, 1,
-0.5818793, -0.05908917, -1.750936, 0.2196078, 1, 0, 1,
-0.5793523, -2.040781, -3.689383, 0.2117647, 1, 0, 1,
-0.5787685, -0.8188701, -4.124483, 0.2078431, 1, 0, 1,
-0.5768003, -0.7899537, -4.668144, 0.2, 1, 0, 1,
-0.5757474, 0.3280168, -0.5490305, 0.1921569, 1, 0, 1,
-0.5732089, 0.7731887, 1.233156, 0.1882353, 1, 0, 1,
-0.5630702, -0.207791, -2.70844, 0.1803922, 1, 0, 1,
-0.5574255, 2.031511, -0.7462121, 0.1764706, 1, 0, 1,
-0.5563131, -1.106795, -1.402056, 0.1686275, 1, 0, 1,
-0.5539299, 0.01620445, -3.225754, 0.1647059, 1, 0, 1,
-0.55265, -0.2221771, -0.3539372, 0.1568628, 1, 0, 1,
-0.5521479, -1.524319, -3.728509, 0.1529412, 1, 0, 1,
-0.5478207, 0.8433656, -2.001995, 0.145098, 1, 0, 1,
-0.5442042, -0.2181427, -1.935325, 0.1411765, 1, 0, 1,
-0.5441791, -1.781872, -2.345357, 0.1333333, 1, 0, 1,
-0.5416164, -1.241509, -2.568184, 0.1294118, 1, 0, 1,
-0.5414201, -0.664004, -1.845262, 0.1215686, 1, 0, 1,
-0.5386721, -0.645388, -2.26706, 0.1176471, 1, 0, 1,
-0.5336185, -0.7438223, -3.287031, 0.1098039, 1, 0, 1,
-0.5309417, 1.018806, 0.1821332, 0.1058824, 1, 0, 1,
-0.5303429, 0.7987178, -1.859366, 0.09803922, 1, 0, 1,
-0.5244903, 0.4246578, -2.040316, 0.09019608, 1, 0, 1,
-0.5234716, 0.3107066, -0.756311, 0.08627451, 1, 0, 1,
-0.522226, -1.058856, -3.164444, 0.07843138, 1, 0, 1,
-0.5173976, 0.2644969, -1.044354, 0.07450981, 1, 0, 1,
-0.5150814, -1.095136, -1.187896, 0.06666667, 1, 0, 1,
-0.5060048, 0.422229, 0.500811, 0.0627451, 1, 0, 1,
-0.5035158, 0.06361017, -1.644239, 0.05490196, 1, 0, 1,
-0.5034314, -0.2771736, -1.637037, 0.05098039, 1, 0, 1,
-0.5029309, 1.62184, -0.9911053, 0.04313726, 1, 0, 1,
-0.4987693, -0.6293783, -3.197338, 0.03921569, 1, 0, 1,
-0.4987022, 0.964888, -0.04500182, 0.03137255, 1, 0, 1,
-0.4906531, -0.5018643, -0.8673251, 0.02745098, 1, 0, 1,
-0.4832036, 0.5821233, -2.41034, 0.01960784, 1, 0, 1,
-0.4743529, -0.4858932, -4.169606, 0.01568628, 1, 0, 1,
-0.4740617, 0.2123907, -1.004776, 0.007843138, 1, 0, 1,
-0.4735617, 1.492921, 0.03731788, 0.003921569, 1, 0, 1,
-0.4727397, 0.08004262, -1.1191, 0, 1, 0.003921569, 1,
-0.4720162, 1.154119, -2.288888, 0, 1, 0.01176471, 1,
-0.4712833, 0.1638481, -2.104115, 0, 1, 0.01568628, 1,
-0.4684213, -1.226286, -3.181625, 0, 1, 0.02352941, 1,
-0.461133, -0.3638191, -1.665155, 0, 1, 0.02745098, 1,
-0.4607501, -0.494459, -2.523995, 0, 1, 0.03529412, 1,
-0.4581477, 2.669667, -1.16112, 0, 1, 0.03921569, 1,
-0.4577678, 1.58955, -1.905593, 0, 1, 0.04705882, 1,
-0.4576781, -0.4171366, -1.612936, 0, 1, 0.05098039, 1,
-0.454124, 1.464892, -0.5880198, 0, 1, 0.05882353, 1,
-0.4498963, -0.07126234, -1.798824, 0, 1, 0.0627451, 1,
-0.4476179, 1.223521, 0.09051361, 0, 1, 0.07058824, 1,
-0.4445686, 0.3645109, 0.02692349, 0, 1, 0.07450981, 1,
-0.4445652, -0.01939232, -2.483705, 0, 1, 0.08235294, 1,
-0.4441555, 0.1657379, -2.082962, 0, 1, 0.08627451, 1,
-0.4438633, -0.3541141, -1.831035, 0, 1, 0.09411765, 1,
-0.4387313, 0.2192069, -2.412003, 0, 1, 0.1019608, 1,
-0.4377497, -0.07051776, -1.158661, 0, 1, 0.1058824, 1,
-0.434884, -0.7764069, -2.765779, 0, 1, 0.1137255, 1,
-0.4330163, 2.54561, 0.9232355, 0, 1, 0.1176471, 1,
-0.4316365, -0.1786476, -2.989073, 0, 1, 0.1254902, 1,
-0.4279963, 0.9098404, -1.744716, 0, 1, 0.1294118, 1,
-0.4247131, -0.6940102, -1.945527, 0, 1, 0.1372549, 1,
-0.4213175, 1.148156, -1.692855, 0, 1, 0.1411765, 1,
-0.4124497, 0.9421603, -0.8734851, 0, 1, 0.1490196, 1,
-0.4097772, 0.4623491, -1.508646, 0, 1, 0.1529412, 1,
-0.4093495, -0.6881915, -3.07602, 0, 1, 0.1607843, 1,
-0.4000534, -0.01243585, 0.02787706, 0, 1, 0.1647059, 1,
-0.3992718, 1.575906, -1.155062, 0, 1, 0.172549, 1,
-0.3991282, -0.9517872, -1.984003, 0, 1, 0.1764706, 1,
-0.3971151, -0.4169754, -2.465376, 0, 1, 0.1843137, 1,
-0.3964668, -0.7940925, -2.251586, 0, 1, 0.1882353, 1,
-0.3941678, -0.3037067, -2.046544, 0, 1, 0.1960784, 1,
-0.3941226, -0.6732369, -3.038241, 0, 1, 0.2039216, 1,
-0.3931947, -0.2023965, -2.14028, 0, 1, 0.2078431, 1,
-0.3929177, 0.3057301, 0.1867784, 0, 1, 0.2156863, 1,
-0.3912675, 0.731593, -0.5927504, 0, 1, 0.2196078, 1,
-0.3874337, -1.012843, -2.919565, 0, 1, 0.227451, 1,
-0.3843391, -0.5351894, -2.258712, 0, 1, 0.2313726, 1,
-0.3817154, -0.8617684, -2.104266, 0, 1, 0.2392157, 1,
-0.3803278, -1.789062, -3.114955, 0, 1, 0.2431373, 1,
-0.3773208, -1.663885, -2.439923, 0, 1, 0.2509804, 1,
-0.3739168, 1.550973, 0.2106255, 0, 1, 0.254902, 1,
-0.3738573, 0.969982, -1.270458, 0, 1, 0.2627451, 1,
-0.372851, -0.2924739, -2.096396, 0, 1, 0.2666667, 1,
-0.3728487, -0.1474331, -2.423719, 0, 1, 0.2745098, 1,
-0.3713473, 0.5260059, 0.4544151, 0, 1, 0.2784314, 1,
-0.3656797, 1.581207, -1.075175, 0, 1, 0.2862745, 1,
-0.3655417, -0.4465199, -3.317614, 0, 1, 0.2901961, 1,
-0.3645296, -0.2481842, -1.654008, 0, 1, 0.2980392, 1,
-0.3638357, 0.259748, -0.2878031, 0, 1, 0.3058824, 1,
-0.362192, -0.3556805, -1.841142, 0, 1, 0.3098039, 1,
-0.3492011, 1.206772, 0.2380577, 0, 1, 0.3176471, 1,
-0.3480828, 0.5179985, 0.7765549, 0, 1, 0.3215686, 1,
-0.3329768, 1.03775, -1.705066, 0, 1, 0.3294118, 1,
-0.3300393, 0.3131219, -0.425539, 0, 1, 0.3333333, 1,
-0.3285513, -0.3931554, -2.635489, 0, 1, 0.3411765, 1,
-0.3280428, -0.06074389, -4.640278, 0, 1, 0.345098, 1,
-0.3273708, 1.224098, -1.60782, 0, 1, 0.3529412, 1,
-0.3252058, -0.5870895, -3.747783, 0, 1, 0.3568628, 1,
-0.3238463, -0.9273967, -3.855816, 0, 1, 0.3647059, 1,
-0.3235533, 0.9759811, -0.6958467, 0, 1, 0.3686275, 1,
-0.3202277, -0.4250544, -2.332491, 0, 1, 0.3764706, 1,
-0.3186779, 0.2680881, -0.9204308, 0, 1, 0.3803922, 1,
-0.316699, 0.1040873, -0.1676171, 0, 1, 0.3882353, 1,
-0.3152989, -1.624924, -2.843931, 0, 1, 0.3921569, 1,
-0.3151355, -2.465089, -2.443959, 0, 1, 0.4, 1,
-0.311451, -0.6818685, -2.3283, 0, 1, 0.4078431, 1,
-0.3106214, -0.3797983, -2.516263, 0, 1, 0.4117647, 1,
-0.3087871, -0.8515324, -4.096606, 0, 1, 0.4196078, 1,
-0.3080646, -0.07964231, -0.4380251, 0, 1, 0.4235294, 1,
-0.307493, 0.2208399, -1.065281, 0, 1, 0.4313726, 1,
-0.3063775, 0.5188249, 0.7448763, 0, 1, 0.4352941, 1,
-0.3002971, -1.773467, -1.220513, 0, 1, 0.4431373, 1,
-0.2997386, -0.5361541, -3.050084, 0, 1, 0.4470588, 1,
-0.298272, -0.6890047, -4.034439, 0, 1, 0.454902, 1,
-0.2979514, 1.431905, -0.518389, 0, 1, 0.4588235, 1,
-0.2961422, 0.2989126, 0.006891759, 0, 1, 0.4666667, 1,
-0.2956856, 0.1585692, -0.02887292, 0, 1, 0.4705882, 1,
-0.2895223, -0.6353049, -3.83761, 0, 1, 0.4784314, 1,
-0.2858285, -0.2113109, -2.642869, 0, 1, 0.4823529, 1,
-0.2791492, 0.08453941, -2.678251, 0, 1, 0.4901961, 1,
-0.2775406, 0.4122953, -1.711976, 0, 1, 0.4941176, 1,
-0.272508, 1.514569, -0.001097591, 0, 1, 0.5019608, 1,
-0.2714256, 1.266793, 1.66129, 0, 1, 0.509804, 1,
-0.2686729, -0.4466115, -2.797278, 0, 1, 0.5137255, 1,
-0.2642044, 0.1440763, -2.724147, 0, 1, 0.5215687, 1,
-0.2512251, -2.242825, -1.821762, 0, 1, 0.5254902, 1,
-0.2507043, -0.1925872, -2.407043, 0, 1, 0.5333334, 1,
-0.2501563, 0.6991622, -1.106401, 0, 1, 0.5372549, 1,
-0.2496095, 1.236252, -0.3263426, 0, 1, 0.5450981, 1,
-0.2484539, -0.7053581, -3.880251, 0, 1, 0.5490196, 1,
-0.2476704, 0.322962, 0.6691682, 0, 1, 0.5568628, 1,
-0.2395448, 0.01959747, -1.819635, 0, 1, 0.5607843, 1,
-0.2311277, 0.2765509, -0.6603677, 0, 1, 0.5686275, 1,
-0.2268707, 1.157063, -1.139698, 0, 1, 0.572549, 1,
-0.2264436, -0.2444251, -3.189663, 0, 1, 0.5803922, 1,
-0.2240641, -0.4237694, -2.024433, 0, 1, 0.5843138, 1,
-0.2226856, 0.5971048, 0.302779, 0, 1, 0.5921569, 1,
-0.2226015, -1.317354, -2.622029, 0, 1, 0.5960785, 1,
-0.2208098, -0.674699, -3.253234, 0, 1, 0.6039216, 1,
-0.2152781, -0.5554706, -2.492747, 0, 1, 0.6117647, 1,
-0.2150049, 0.7794092, 0.7492415, 0, 1, 0.6156863, 1,
-0.2112294, 0.1036029, -0.8364196, 0, 1, 0.6235294, 1,
-0.2024082, 1.212558, 1.224694, 0, 1, 0.627451, 1,
-0.1987493, -1.365027, -2.680437, 0, 1, 0.6352941, 1,
-0.1960805, -0.1678419, -1.968012, 0, 1, 0.6392157, 1,
-0.1922907, 0.1790008, -0.7436587, 0, 1, 0.6470588, 1,
-0.1920888, -1.36544, -2.833303, 0, 1, 0.6509804, 1,
-0.182615, -0.1069906, -1.555487, 0, 1, 0.6588235, 1,
-0.1808302, -0.7101743, -3.871557, 0, 1, 0.6627451, 1,
-0.17715, 1.305881, 0.6101032, 0, 1, 0.6705883, 1,
-0.1751842, 0.9797341, 0.09438987, 0, 1, 0.6745098, 1,
-0.1690103, -0.05192849, -1.946303, 0, 1, 0.682353, 1,
-0.1671035, -0.650259, -2.546953, 0, 1, 0.6862745, 1,
-0.1645101, -0.4382214, -3.496466, 0, 1, 0.6941177, 1,
-0.1545, 1.649188, -1.101378, 0, 1, 0.7019608, 1,
-0.151683, 1.635381, 0.8198345, 0, 1, 0.7058824, 1,
-0.1507577, -1.577044, -3.890215, 0, 1, 0.7137255, 1,
-0.1472435, -0.1654641, -3.852714, 0, 1, 0.7176471, 1,
-0.1471634, 1.04566, -0.9088527, 0, 1, 0.7254902, 1,
-0.1452933, 0.6398172, -0.8890198, 0, 1, 0.7294118, 1,
-0.1450913, 0.7501857, 0.5888778, 0, 1, 0.7372549, 1,
-0.1447421, 0.8539231, 1.301663, 0, 1, 0.7411765, 1,
-0.1439634, -1.112539, -2.944543, 0, 1, 0.7490196, 1,
-0.1404826, -0.2067041, -3.220231, 0, 1, 0.7529412, 1,
-0.1394941, 1.047904, 0.620761, 0, 1, 0.7607843, 1,
-0.1366912, -0.5126722, -3.984704, 0, 1, 0.7647059, 1,
-0.1330999, -3.166084, -1.18824, 0, 1, 0.772549, 1,
-0.1284891, 0.702401, 0.6114457, 0, 1, 0.7764706, 1,
-0.1276671, 0.3726682, 0.005304379, 0, 1, 0.7843137, 1,
-0.125139, -0.7183028, -2.903087, 0, 1, 0.7882353, 1,
-0.1249366, -0.7405946, -3.055716, 0, 1, 0.7960784, 1,
-0.1192211, 0.9878771, -0.2423217, 0, 1, 0.8039216, 1,
-0.1168895, -1.217839, -3.539179, 0, 1, 0.8078431, 1,
-0.1122876, 0.8483618, -0.6073366, 0, 1, 0.8156863, 1,
-0.1107072, -0.7839032, -4.037063, 0, 1, 0.8196079, 1,
-0.1091754, -0.8111069, -3.727113, 0, 1, 0.827451, 1,
-0.1065232, -0.3803275, -5.30674, 0, 1, 0.8313726, 1,
-0.1059726, -1.024058, -3.783202, 0, 1, 0.8392157, 1,
-0.1033383, 0.6861317, -0.6651496, 0, 1, 0.8431373, 1,
-0.1011233, -1.301849, -3.281934, 0, 1, 0.8509804, 1,
-0.09464963, 0.2817238, -0.118807, 0, 1, 0.854902, 1,
-0.09213179, -0.3107704, -3.274493, 0, 1, 0.8627451, 1,
-0.09126306, 0.1791207, -0.5977438, 0, 1, 0.8666667, 1,
-0.08898608, -1.10342, -3.147265, 0, 1, 0.8745098, 1,
-0.08691408, 0.851854, 0.09146492, 0, 1, 0.8784314, 1,
-0.08635729, -0.7174171, -3.001584, 0, 1, 0.8862745, 1,
-0.08479846, -1.692349, -3.514168, 0, 1, 0.8901961, 1,
-0.08106629, 0.569216, -0.5437883, 0, 1, 0.8980392, 1,
-0.08071163, 0.03687062, -2.208486, 0, 1, 0.9058824, 1,
-0.08040427, -0.608908, -3.09466, 0, 1, 0.9098039, 1,
-0.07905172, 0.5165496, -0.1206427, 0, 1, 0.9176471, 1,
-0.0761658, -0.04155322, -1.511477, 0, 1, 0.9215686, 1,
-0.07279406, 1.837423, 0.3635803, 0, 1, 0.9294118, 1,
-0.07129676, 1.929068, -1.225791, 0, 1, 0.9333333, 1,
-0.06653744, -0.5279266, -0.8328875, 0, 1, 0.9411765, 1,
-0.06419382, 0.3612434, -1.48626, 0, 1, 0.945098, 1,
-0.0567581, 0.7306422, 1.192859, 0, 1, 0.9529412, 1,
-0.05556608, 0.6937427, -0.3529936, 0, 1, 0.9568627, 1,
-0.05534508, -0.2929849, -1.328455, 0, 1, 0.9647059, 1,
-0.05378107, -0.03452109, -2.715114, 0, 1, 0.9686275, 1,
-0.05259713, -0.05164194, 0.7948275, 0, 1, 0.9764706, 1,
-0.04445899, -2.122283, -2.878615, 0, 1, 0.9803922, 1,
-0.04312455, 0.6201388, 1.60544, 0, 1, 0.9882353, 1,
-0.0427084, -0.6927684, -2.431261, 0, 1, 0.9921569, 1,
-0.04263635, 0.2625791, -0.3825203, 0, 1, 1, 1,
-0.03967795, -0.07992749, -2.413572, 0, 0.9921569, 1, 1,
-0.03724347, 0.4419526, -0.3777179, 0, 0.9882353, 1, 1,
-0.03618316, -0.4975775, -2.996249, 0, 0.9803922, 1, 1,
-0.03237442, 1.489875, -0.4041905, 0, 0.9764706, 1, 1,
-0.03129344, -1.497583, -3.315471, 0, 0.9686275, 1, 1,
-0.02956408, 0.5029957, 0.6525074, 0, 0.9647059, 1, 1,
-0.0270651, 2.982481, 0.2244419, 0, 0.9568627, 1, 1,
-0.02273812, -1.619063, -4.395009, 0, 0.9529412, 1, 1,
-0.02202735, -0.7291049, -1.739215, 0, 0.945098, 1, 1,
-0.02169768, 1.875938, -2.751237, 0, 0.9411765, 1, 1,
-0.01134668, 0.3198911, -0.753499, 0, 0.9333333, 1, 1,
-0.007732536, 2.527106, 0.9560735, 0, 0.9294118, 1, 1,
-0.007122131, 0.3389172, 0.3158025, 0, 0.9215686, 1, 1,
-0.003348744, 0.1390404, -0.2602855, 0, 0.9176471, 1, 1,
-0.0008571649, -0.5409705, -3.665927, 0, 0.9098039, 1, 1,
0.005796807, 1.66241, -1.3236, 0, 0.9058824, 1, 1,
0.007521765, 0.1820491, -1.249176, 0, 0.8980392, 1, 1,
0.007692297, -1.430171, 1.619877, 0, 0.8901961, 1, 1,
0.01085512, 1.307319, -0.8989229, 0, 0.8862745, 1, 1,
0.01242941, 0.6032032, -0.9355209, 0, 0.8784314, 1, 1,
0.01316483, 0.4211985, -0.8853191, 0, 0.8745098, 1, 1,
0.01387798, -0.6902763, 1.717923, 0, 0.8666667, 1, 1,
0.01858113, -0.03794298, 1.656387, 0, 0.8627451, 1, 1,
0.02742141, 0.8019013, -0.2234389, 0, 0.854902, 1, 1,
0.02856939, -2.245475, 3.74477, 0, 0.8509804, 1, 1,
0.02873084, 0.8003188, 0.8084905, 0, 0.8431373, 1, 1,
0.03303271, -0.5856313, 4.043643, 0, 0.8392157, 1, 1,
0.03485827, -0.3079922, 3.274994, 0, 0.8313726, 1, 1,
0.03543851, 1.037874, -0.7288979, 0, 0.827451, 1, 1,
0.03770059, -1.031069, 4.05684, 0, 0.8196079, 1, 1,
0.03773395, -0.8643722, 2.679542, 0, 0.8156863, 1, 1,
0.04055047, 1.158612, -1.498401, 0, 0.8078431, 1, 1,
0.04233329, 1.239568, -2.364948, 0, 0.8039216, 1, 1,
0.04383014, 0.08439712, -0.0425943, 0, 0.7960784, 1, 1,
0.04441077, -0.8395745, 2.606941, 0, 0.7882353, 1, 1,
0.04465939, 0.4987115, 2.604419, 0, 0.7843137, 1, 1,
0.05369602, 0.814555, 0.9891286, 0, 0.7764706, 1, 1,
0.05484894, 0.2008918, 1.538685, 0, 0.772549, 1, 1,
0.05951665, -0.5765127, 3.174314, 0, 0.7647059, 1, 1,
0.06361151, 1.221227, -0.5147543, 0, 0.7607843, 1, 1,
0.06500278, 0.920235, 2.35252, 0, 0.7529412, 1, 1,
0.06737762, -0.09782124, 2.666684, 0, 0.7490196, 1, 1,
0.06771684, 1.244862, -0.3355957, 0, 0.7411765, 1, 1,
0.07144204, -0.5421889, 4.098347, 0, 0.7372549, 1, 1,
0.07185198, 0.3842691, 1.624561, 0, 0.7294118, 1, 1,
0.07416531, -0.8146849, 3.01015, 0, 0.7254902, 1, 1,
0.07642764, 0.3757914, -2.030988, 0, 0.7176471, 1, 1,
0.08848824, -0.115524, 4.238568, 0, 0.7137255, 1, 1,
0.08889676, 0.9933687, -0.8609481, 0, 0.7058824, 1, 1,
0.09060704, 0.2796344, -0.1695137, 0, 0.6980392, 1, 1,
0.1022369, -0.6612542, 4.198516, 0, 0.6941177, 1, 1,
0.1058194, -0.3198641, 2.208844, 0, 0.6862745, 1, 1,
0.1062089, 0.707703, 1.410089, 0, 0.682353, 1, 1,
0.1139963, -1.672648, 4.070677, 0, 0.6745098, 1, 1,
0.1143278, -0.4892793, 2.617232, 0, 0.6705883, 1, 1,
0.1145686, 0.6708912, -1.014328, 0, 0.6627451, 1, 1,
0.1214013, 0.06957463, 2.479906, 0, 0.6588235, 1, 1,
0.1219021, 0.5717682, 1.014561, 0, 0.6509804, 1, 1,
0.1235213, 0.597856, 0.2283329, 0, 0.6470588, 1, 1,
0.1278121, -0.04502142, 1.632571, 0, 0.6392157, 1, 1,
0.1306202, 0.5952047, 1.874711, 0, 0.6352941, 1, 1,
0.1326763, 0.4280926, -0.3591174, 0, 0.627451, 1, 1,
0.1329634, -1.412205, 3.583364, 0, 0.6235294, 1, 1,
0.1336413, -1.156276, 2.386378, 0, 0.6156863, 1, 1,
0.1432659, -0.08030123, 2.167074, 0, 0.6117647, 1, 1,
0.1497716, 1.799513, 2.097548, 0, 0.6039216, 1, 1,
0.1502443, 0.1775727, 1.617056, 0, 0.5960785, 1, 1,
0.1517362, 1.771261, 0.2389619, 0, 0.5921569, 1, 1,
0.1538944, -1.315154, 3.755458, 0, 0.5843138, 1, 1,
0.1587464, 0.300272, 1.065994, 0, 0.5803922, 1, 1,
0.1603005, -1.277179, 2.495781, 0, 0.572549, 1, 1,
0.1613427, 1.181392, 0.1157029, 0, 0.5686275, 1, 1,
0.1615592, -2.133489, 2.824123, 0, 0.5607843, 1, 1,
0.1638332, 0.05699618, 2.196394, 0, 0.5568628, 1, 1,
0.1666922, 0.7789322, -0.4544706, 0, 0.5490196, 1, 1,
0.1745758, -2.333451, 3.856093, 0, 0.5450981, 1, 1,
0.175588, 0.268404, 1.234857, 0, 0.5372549, 1, 1,
0.1791162, 0.7749754, 0.9208276, 0, 0.5333334, 1, 1,
0.1797376, 0.5154595, -0.4462312, 0, 0.5254902, 1, 1,
0.1805043, 0.02691922, 1.145551, 0, 0.5215687, 1, 1,
0.1846133, -1.674844, 3.119617, 0, 0.5137255, 1, 1,
0.1865037, -1.638363, 5.960925, 0, 0.509804, 1, 1,
0.1891442, 0.2304728, 0.9824748, 0, 0.5019608, 1, 1,
0.19221, 0.7624353, -0.9588291, 0, 0.4941176, 1, 1,
0.1933964, -0.5432832, 3.745729, 0, 0.4901961, 1, 1,
0.1994768, 0.7301489, 0.06643702, 0, 0.4823529, 1, 1,
0.2076146, 1.612855, 0.5506704, 0, 0.4784314, 1, 1,
0.2112656, -1.170645, 1.188195, 0, 0.4705882, 1, 1,
0.2156312, 1.520708, 1.316551, 0, 0.4666667, 1, 1,
0.2160598, -1.732626, 3.967536, 0, 0.4588235, 1, 1,
0.2176373, 0.5620729, 0.08882885, 0, 0.454902, 1, 1,
0.2195065, 1.642989, 0.5906997, 0, 0.4470588, 1, 1,
0.2216617, -0.5109689, 3.871204, 0, 0.4431373, 1, 1,
0.2229927, 0.4611341, 0.1395417, 0, 0.4352941, 1, 1,
0.2271142, -0.4052595, 0.5884061, 0, 0.4313726, 1, 1,
0.2273178, 1.565963, -0.05832419, 0, 0.4235294, 1, 1,
0.2311052, -1.460219, 4.22229, 0, 0.4196078, 1, 1,
0.2364162, -0.2542211, 1.010846, 0, 0.4117647, 1, 1,
0.2376483, 1.572827, 0.7134851, 0, 0.4078431, 1, 1,
0.2407404, 0.5857397, 1.122605, 0, 0.4, 1, 1,
0.2499961, 0.8837478, 1.337463, 0, 0.3921569, 1, 1,
0.25214, 1.464456, 0.7742692, 0, 0.3882353, 1, 1,
0.2523367, -0.8793057, 1.65489, 0, 0.3803922, 1, 1,
0.256618, 0.2681828, 2.1681, 0, 0.3764706, 1, 1,
0.2618992, 0.6278899, 0.8782898, 0, 0.3686275, 1, 1,
0.2624621, -0.1345867, 0.1186465, 0, 0.3647059, 1, 1,
0.2625999, 1.356354, 0.8195237, 0, 0.3568628, 1, 1,
0.2660959, 1.693033, 1.423856, 0, 0.3529412, 1, 1,
0.2672496, 0.3697729, 0.1541274, 0, 0.345098, 1, 1,
0.2698249, 0.1872424, 1.727583, 0, 0.3411765, 1, 1,
0.2757438, 0.3002813, 0.1312488, 0, 0.3333333, 1, 1,
0.275845, 1.509507, -1.105079, 0, 0.3294118, 1, 1,
0.2785708, -0.06410816, 1.953747, 0, 0.3215686, 1, 1,
0.2804118, 0.8038473, 0.02271236, 0, 0.3176471, 1, 1,
0.2819938, -1.373436, 2.826358, 0, 0.3098039, 1, 1,
0.2876604, -0.3762887, 5.106261, 0, 0.3058824, 1, 1,
0.2891078, 1.03032, 0.6866022, 0, 0.2980392, 1, 1,
0.2935019, -1.377335, 4.037571, 0, 0.2901961, 1, 1,
0.2962008, -1.04203, 3.472858, 0, 0.2862745, 1, 1,
0.299381, -1.113518, 3.546501, 0, 0.2784314, 1, 1,
0.3049706, -2.061751, 3.319097, 0, 0.2745098, 1, 1,
0.3065, -1.047755, 3.098173, 0, 0.2666667, 1, 1,
0.3067278, -0.1066551, 2.301707, 0, 0.2627451, 1, 1,
0.3118009, -0.9878218, 1.435101, 0, 0.254902, 1, 1,
0.3137021, 0.431919, 0.5125999, 0, 0.2509804, 1, 1,
0.3143736, 0.4148916, -0.5214886, 0, 0.2431373, 1, 1,
0.3198635, 0.6639093, 1.083659, 0, 0.2392157, 1, 1,
0.3218032, 0.2023033, 0.4578258, 0, 0.2313726, 1, 1,
0.323127, -1.578152, 1.823175, 0, 0.227451, 1, 1,
0.3291409, 1.234674, 0.4329039, 0, 0.2196078, 1, 1,
0.3299533, -0.3288979, 4.523571, 0, 0.2156863, 1, 1,
0.3350061, 0.2115371, 0.9751869, 0, 0.2078431, 1, 1,
0.3360448, 0.7245337, 0.4681944, 0, 0.2039216, 1, 1,
0.3376665, 0.5632086, 0.4050999, 0, 0.1960784, 1, 1,
0.3403407, 0.316247, 1.544789, 0, 0.1882353, 1, 1,
0.3405567, 1.222118, 1.532068, 0, 0.1843137, 1, 1,
0.3434951, -1.563657, 2.872402, 0, 0.1764706, 1, 1,
0.3459682, -1.060592, 2.85895, 0, 0.172549, 1, 1,
0.3494947, 3.451253, -0.2527224, 0, 0.1647059, 1, 1,
0.3502671, -0.3369404, 3.102407, 0, 0.1607843, 1, 1,
0.3504468, 1.443974, -0.107306, 0, 0.1529412, 1, 1,
0.3523905, 1.856957, -0.1114781, 0, 0.1490196, 1, 1,
0.354035, -0.2245393, 1.455642, 0, 0.1411765, 1, 1,
0.3546179, -0.2608176, 1.56393, 0, 0.1372549, 1, 1,
0.3575297, -0.2937308, 0.9205727, 0, 0.1294118, 1, 1,
0.3607107, -1.76487, 2.513523, 0, 0.1254902, 1, 1,
0.3611222, 0.505971, 1.636312, 0, 0.1176471, 1, 1,
0.3624846, -0.6506786, 0.9595394, 0, 0.1137255, 1, 1,
0.3629801, -0.3758339, 1.910234, 0, 0.1058824, 1, 1,
0.3685468, -0.9047787, 3.062431, 0, 0.09803922, 1, 1,
0.3924164, 0.5758974, 1.236265, 0, 0.09411765, 1, 1,
0.39278, 0.11567, 0.9348801, 0, 0.08627451, 1, 1,
0.3953986, -0.2998644, 2.366401, 0, 0.08235294, 1, 1,
0.3958779, -0.270503, 2.301556, 0, 0.07450981, 1, 1,
0.3984835, 2.125404, 1.434205, 0, 0.07058824, 1, 1,
0.4002831, 0.6053354, -1.200518, 0, 0.0627451, 1, 1,
0.4058612, 1.593413, -1.452042, 0, 0.05882353, 1, 1,
0.4106008, 1.481594, 1.327638, 0, 0.05098039, 1, 1,
0.4126249, 0.6948795, 1.607264, 0, 0.04705882, 1, 1,
0.4152399, -1.04492, 4.596838, 0, 0.03921569, 1, 1,
0.4152667, 0.6556807, 0.7930179, 0, 0.03529412, 1, 1,
0.4177337, 0.6527007, 1.407663, 0, 0.02745098, 1, 1,
0.4204086, 0.4221624, 0.9115974, 0, 0.02352941, 1, 1,
0.4215489, 1.773411, -0.05345405, 0, 0.01568628, 1, 1,
0.4223492, -2.102047, 4.559759, 0, 0.01176471, 1, 1,
0.4226751, -0.3410943, 3.866123, 0, 0.003921569, 1, 1,
0.4235727, -0.4342338, 3.124336, 0.003921569, 0, 1, 1,
0.4256253, 1.499167, -0.2217328, 0.007843138, 0, 1, 1,
0.4282396, 0.3421471, 1.719011, 0.01568628, 0, 1, 1,
0.4307708, -1.89182, 1.846249, 0.01960784, 0, 1, 1,
0.4320299, -0.1600675, 1.445103, 0.02745098, 0, 1, 1,
0.4347185, -0.1700551, 1.828526, 0.03137255, 0, 1, 1,
0.4369531, 1.071551, 1.324948, 0.03921569, 0, 1, 1,
0.4370187, -0.9133654, 4.195665, 0.04313726, 0, 1, 1,
0.4371873, 0.03880318, 2.567463, 0.05098039, 0, 1, 1,
0.4382572, -1.130816, 2.805858, 0.05490196, 0, 1, 1,
0.4384675, 0.2346231, 0.7832841, 0.0627451, 0, 1, 1,
0.444722, 0.1100456, 2.075396, 0.06666667, 0, 1, 1,
0.4466325, -0.8528083, 3.576317, 0.07450981, 0, 1, 1,
0.4468087, -0.2805066, 3.045946, 0.07843138, 0, 1, 1,
0.4471821, 1.008304, 1.199098, 0.08627451, 0, 1, 1,
0.4510206, 1.69251, 0.3099459, 0.09019608, 0, 1, 1,
0.4514773, 2.540431, 1.253168, 0.09803922, 0, 1, 1,
0.4551282, -1.032362, 3.189829, 0.1058824, 0, 1, 1,
0.4559306, 1.593643, 1.081673, 0.1098039, 0, 1, 1,
0.4587741, -0.1138279, 1.404319, 0.1176471, 0, 1, 1,
0.458877, 0.9855731, 3.05163, 0.1215686, 0, 1, 1,
0.4648793, -1.935987, 2.926234, 0.1294118, 0, 1, 1,
0.4676371, -0.6480156, 2.697404, 0.1333333, 0, 1, 1,
0.4680546, 1.446575, 0.303473, 0.1411765, 0, 1, 1,
0.4688154, 0.4306085, 0.529886, 0.145098, 0, 1, 1,
0.4710569, 1.255545, 0.7285472, 0.1529412, 0, 1, 1,
0.4728047, 0.03571152, 0.7486324, 0.1568628, 0, 1, 1,
0.4730472, 1.493349, 0.6844463, 0.1647059, 0, 1, 1,
0.476238, -0.8331636, 2.20218, 0.1686275, 0, 1, 1,
0.4816478, 0.8944919, 0.6374931, 0.1764706, 0, 1, 1,
0.4879372, -0.02689732, 2.308778, 0.1803922, 0, 1, 1,
0.4893516, 2.507272, -0.190544, 0.1882353, 0, 1, 1,
0.4925314, 0.5091581, 1.4287, 0.1921569, 0, 1, 1,
0.5001462, 0.5791246, -0.8955495, 0.2, 0, 1, 1,
0.5032503, 0.6564613, -0.6241488, 0.2078431, 0, 1, 1,
0.5043816, 0.4183293, 1.774008, 0.2117647, 0, 1, 1,
0.5049104, 0.002826445, 2.143461, 0.2196078, 0, 1, 1,
0.5102702, -1.672634, 2.43868, 0.2235294, 0, 1, 1,
0.5216015, 0.9841729, -0.4306726, 0.2313726, 0, 1, 1,
0.5228939, -0.5932888, 3.637839, 0.2352941, 0, 1, 1,
0.5232958, -0.8509142, 4.205744, 0.2431373, 0, 1, 1,
0.5241117, 0.8347067, 1.820424, 0.2470588, 0, 1, 1,
0.5276883, 0.6831224, 1.060956, 0.254902, 0, 1, 1,
0.5304317, 0.5824248, -0.6376514, 0.2588235, 0, 1, 1,
0.5357631, 0.4478349, 1.109163, 0.2666667, 0, 1, 1,
0.5360838, -0.6806602, 1.35883, 0.2705882, 0, 1, 1,
0.5380577, -0.2213974, 1.638058, 0.2784314, 0, 1, 1,
0.5423224, 1.39911, 0.9637889, 0.282353, 0, 1, 1,
0.5439035, 0.3157223, 1.436418, 0.2901961, 0, 1, 1,
0.5468888, 2.158695, -0.4801082, 0.2941177, 0, 1, 1,
0.5478621, -0.2658604, -0.1353114, 0.3019608, 0, 1, 1,
0.5519387, 0.6188499, 0.7208964, 0.3098039, 0, 1, 1,
0.5519502, 0.2412563, 0.8225302, 0.3137255, 0, 1, 1,
0.5690559, -0.0584165, 1.743876, 0.3215686, 0, 1, 1,
0.5703431, 2.395014, 1.10623, 0.3254902, 0, 1, 1,
0.5774651, 1.69374, 0.6712042, 0.3333333, 0, 1, 1,
0.5803005, 1.080068, -0.2400312, 0.3372549, 0, 1, 1,
0.5813718, -1.158984, 3.471707, 0.345098, 0, 1, 1,
0.5830223, 0.7964823, 0.2676697, 0.3490196, 0, 1, 1,
0.5843082, 0.1862799, 1.812326, 0.3568628, 0, 1, 1,
0.585638, -0.5530884, 1.894103, 0.3607843, 0, 1, 1,
0.5858837, -1.947034, 3.700997, 0.3686275, 0, 1, 1,
0.5865058, -0.4013833, 0.8831729, 0.372549, 0, 1, 1,
0.5887376, 0.2953755, 0.9191479, 0.3803922, 0, 1, 1,
0.5905603, 1.771599, 0.873724, 0.3843137, 0, 1, 1,
0.5917833, -0.7934747, 2.372002, 0.3921569, 0, 1, 1,
0.5964909, 0.4374088, -0.5775557, 0.3960784, 0, 1, 1,
0.5967021, -1.366977, 2.452874, 0.4039216, 0, 1, 1,
0.5980076, -0.724562, 3.146041, 0.4117647, 0, 1, 1,
0.5991476, 0.3472123, 0.752674, 0.4156863, 0, 1, 1,
0.6000674, -0.6815992, 1.351572, 0.4235294, 0, 1, 1,
0.6035898, 1.253859, 1.605903, 0.427451, 0, 1, 1,
0.6048277, 0.6089324, 2.286111, 0.4352941, 0, 1, 1,
0.6067436, -0.9030163, 1.000671, 0.4392157, 0, 1, 1,
0.6105791, -0.7192142, 1.410761, 0.4470588, 0, 1, 1,
0.6123343, -0.9471743, 1.251723, 0.4509804, 0, 1, 1,
0.6229659, 0.9832306, 1.206013, 0.4588235, 0, 1, 1,
0.6271994, -1.128771, 2.285279, 0.4627451, 0, 1, 1,
0.6317934, 0.9434524, 0.4259349, 0.4705882, 0, 1, 1,
0.6354243, -0.363935, 0.8269386, 0.4745098, 0, 1, 1,
0.6407983, -0.2078026, 1.406031, 0.4823529, 0, 1, 1,
0.6536185, -1.538516, 3.462384, 0.4862745, 0, 1, 1,
0.6544539, 0.9135054, 0.893583, 0.4941176, 0, 1, 1,
0.6553823, 0.5277535, 0.8010547, 0.5019608, 0, 1, 1,
0.6622543, -1.470395, 2.694219, 0.5058824, 0, 1, 1,
0.6633885, -0.8306808, 1.993004, 0.5137255, 0, 1, 1,
0.6643895, 0.3983887, 0.7758284, 0.5176471, 0, 1, 1,
0.6685132, 1.303103, 0.7610477, 0.5254902, 0, 1, 1,
0.6685672, -0.678517, 2.282044, 0.5294118, 0, 1, 1,
0.6748476, -1.43533, 3.810061, 0.5372549, 0, 1, 1,
0.6808816, -2.311802, 3.494564, 0.5411765, 0, 1, 1,
0.6841774, -0.1814219, 2.419497, 0.5490196, 0, 1, 1,
0.6909248, -0.4458579, 2.669536, 0.5529412, 0, 1, 1,
0.6928222, -0.8484405, 2.499395, 0.5607843, 0, 1, 1,
0.6933396, -1.498975, 1.927271, 0.5647059, 0, 1, 1,
0.6974721, 0.4409002, 2.619295, 0.572549, 0, 1, 1,
0.7019141, 1.202258, 1.983873, 0.5764706, 0, 1, 1,
0.7080254, -0.2508712, 2.450089, 0.5843138, 0, 1, 1,
0.7103418, -1.312246, 1.593328, 0.5882353, 0, 1, 1,
0.7110236, 1.148367, 1.322404, 0.5960785, 0, 1, 1,
0.7158045, 0.7469634, 0.729927, 0.6039216, 0, 1, 1,
0.7274442, 0.8997124, 0.2549645, 0.6078432, 0, 1, 1,
0.7293597, -0.2208663, 1.150879, 0.6156863, 0, 1, 1,
0.7352391, -2.071925, 2.214627, 0.6196079, 0, 1, 1,
0.741603, 1.898542, -1.441192, 0.627451, 0, 1, 1,
0.7424873, 0.2244328, 0.8942357, 0.6313726, 0, 1, 1,
0.7451964, 0.1242415, 3.391066, 0.6392157, 0, 1, 1,
0.7513141, -0.01422061, 0.1800103, 0.6431373, 0, 1, 1,
0.7521806, -0.8066485, 2.757388, 0.6509804, 0, 1, 1,
0.75239, -0.2383284, 0.03032376, 0.654902, 0, 1, 1,
0.7525057, 0.8440949, 0.09944778, 0.6627451, 0, 1, 1,
0.7545143, -1.18621, 3.425562, 0.6666667, 0, 1, 1,
0.757388, 2.689986, -0.2071269, 0.6745098, 0, 1, 1,
0.7579783, 1.629564, 1.84931, 0.6784314, 0, 1, 1,
0.7615799, 1.081597, 0.4469405, 0.6862745, 0, 1, 1,
0.7643646, -0.683715, 3.251103, 0.6901961, 0, 1, 1,
0.7718445, -1.550241, 2.752244, 0.6980392, 0, 1, 1,
0.7761965, -0.4918834, 1.968941, 0.7058824, 0, 1, 1,
0.7779225, 0.4574856, 2.355249, 0.7098039, 0, 1, 1,
0.7795976, -1.907922, 3.339875, 0.7176471, 0, 1, 1,
0.7863125, -1.385796, 3.399276, 0.7215686, 0, 1, 1,
0.7886008, -1.020363, 1.498351, 0.7294118, 0, 1, 1,
0.7921252, -2.079155, 3.397073, 0.7333333, 0, 1, 1,
0.7988148, 0.3223664, 0.9539546, 0.7411765, 0, 1, 1,
0.8013028, 0.5572447, 0.591873, 0.7450981, 0, 1, 1,
0.8027452, 1.95758, -0.09543713, 0.7529412, 0, 1, 1,
0.8062928, 0.450311, 0.6335858, 0.7568628, 0, 1, 1,
0.8094076, -2.010942, 4.600663, 0.7647059, 0, 1, 1,
0.8138826, 0.9351268, 0.6086826, 0.7686275, 0, 1, 1,
0.8157196, -0.577912, 3.004236, 0.7764706, 0, 1, 1,
0.8221171, 0.7111736, 2.681665, 0.7803922, 0, 1, 1,
0.8234293, -0.2824076, 4.377087, 0.7882353, 0, 1, 1,
0.8256924, -0.8378375, 1.107908, 0.7921569, 0, 1, 1,
0.829536, -1.301401, 3.542682, 0.8, 0, 1, 1,
0.8335679, -2.175266, 3.258286, 0.8078431, 0, 1, 1,
0.8346363, -0.4298089, 2.675622, 0.8117647, 0, 1, 1,
0.8414325, 0.9613147, -0.01213476, 0.8196079, 0, 1, 1,
0.842551, 0.3198707, 1.796836, 0.8235294, 0, 1, 1,
0.8431457, 0.9040316, 1.828917, 0.8313726, 0, 1, 1,
0.8501878, -1.146011, 2.486328, 0.8352941, 0, 1, 1,
0.8522481, 1.0988, 0.6171659, 0.8431373, 0, 1, 1,
0.8536634, 1.254069, 1.543377, 0.8470588, 0, 1, 1,
0.8572887, 0.7583585, -0.8765728, 0.854902, 0, 1, 1,
0.8698111, -0.7911035, 1.128294, 0.8588235, 0, 1, 1,
0.8702047, -0.1131296, 1.591306, 0.8666667, 0, 1, 1,
0.8740611, -1.716731, 3.824842, 0.8705882, 0, 1, 1,
0.8742947, 0.6653907, 0.6711474, 0.8784314, 0, 1, 1,
0.8914405, 1.881303, -1.349981, 0.8823529, 0, 1, 1,
0.8961846, -0.7770175, 0.9758338, 0.8901961, 0, 1, 1,
0.9080653, -0.104436, 3.620103, 0.8941177, 0, 1, 1,
0.9085687, 2.061125, 1.142289, 0.9019608, 0, 1, 1,
0.9194751, 0.1676021, 1.697025, 0.9098039, 0, 1, 1,
0.9213139, 1.111819, 1.823207, 0.9137255, 0, 1, 1,
0.9229966, 0.4682682, 1.682961, 0.9215686, 0, 1, 1,
0.9340709, 0.9385849, 1.951757, 0.9254902, 0, 1, 1,
0.9353187, 0.2871602, 2.867042, 0.9333333, 0, 1, 1,
0.9369899, -0.9666228, 2.995156, 0.9372549, 0, 1, 1,
0.9421678, 0.4455158, 1.640972, 0.945098, 0, 1, 1,
0.9518139, -2.21533, 3.749661, 0.9490196, 0, 1, 1,
0.9536455, -0.4264164, 3.468898, 0.9568627, 0, 1, 1,
0.9559705, 1.266215, 0.6748893, 0.9607843, 0, 1, 1,
0.9569517, -0.2422034, 0.9100716, 0.9686275, 0, 1, 1,
0.9594163, 0.644626, 1.751315, 0.972549, 0, 1, 1,
0.9598131, 0.1217557, 2.109321, 0.9803922, 0, 1, 1,
0.9708134, 0.2847543, 0.958943, 0.9843137, 0, 1, 1,
0.9816918, 0.06961647, 1.589987, 0.9921569, 0, 1, 1,
0.9830719, 0.9319656, 1.411955, 0.9960784, 0, 1, 1,
0.9887363, -1.612691, 2.976162, 1, 0, 0.9960784, 1,
0.9907281, -0.833223, 0.2822984, 1, 0, 0.9882353, 1,
0.9914995, -1.022637, 2.099812, 1, 0, 0.9843137, 1,
0.9996428, 0.2031217, 2.850598, 1, 0, 0.9764706, 1,
1.000905, -0.5503477, 1.852966, 1, 0, 0.972549, 1,
1.002737, -0.6891224, 1.846795, 1, 0, 0.9647059, 1,
1.003808, 0.562018, 0.6501308, 1, 0, 0.9607843, 1,
1.005813, 0.7413319, 0.866239, 1, 0, 0.9529412, 1,
1.006386, 2.374852, -0.5951453, 1, 0, 0.9490196, 1,
1.007062, 0.006062116, 2.587156, 1, 0, 0.9411765, 1,
1.008492, -0.8695107, 3.270865, 1, 0, 0.9372549, 1,
1.008854, -1.258882, 2.265591, 1, 0, 0.9294118, 1,
1.016822, 1.343915, 1.203856, 1, 0, 0.9254902, 1,
1.017239, -0.1546048, 1.670452, 1, 0, 0.9176471, 1,
1.025214, -0.7042224, 1.344698, 1, 0, 0.9137255, 1,
1.025804, 0.1236623, 2.133872, 1, 0, 0.9058824, 1,
1.029623, 0.7933484, 0.7414101, 1, 0, 0.9019608, 1,
1.030963, -0.2137333, 1.44224, 1, 0, 0.8941177, 1,
1.031021, 0.1199072, -1.291454, 1, 0, 0.8862745, 1,
1.033599, -1.032056, 3.216063, 1, 0, 0.8823529, 1,
1.033897, 0.3034141, 0.6904147, 1, 0, 0.8745098, 1,
1.038328, -0.2374662, 2.926613, 1, 0, 0.8705882, 1,
1.04173, 0.5532515, 2.02441, 1, 0, 0.8627451, 1,
1.046228, 0.1231631, 2.241909, 1, 0, 0.8588235, 1,
1.047091, -0.3954379, 0.06775608, 1, 0, 0.8509804, 1,
1.047759, 0.4414114, 1.108013, 1, 0, 0.8470588, 1,
1.049475, 0.06028802, 1.569353, 1, 0, 0.8392157, 1,
1.050632, -0.5881224, 2.952819, 1, 0, 0.8352941, 1,
1.060041, 1.533312, 0.7893721, 1, 0, 0.827451, 1,
1.060196, -0.9989125, 2.782411, 1, 0, 0.8235294, 1,
1.060988, 0.4290374, 2.105305, 1, 0, 0.8156863, 1,
1.063503, -0.9399925, 2.966533, 1, 0, 0.8117647, 1,
1.065874, 0.2154614, 0.7759073, 1, 0, 0.8039216, 1,
1.068234, 0.3782637, 1.403141, 1, 0, 0.7960784, 1,
1.069046, 0.7053281, -0.0001014172, 1, 0, 0.7921569, 1,
1.075555, 0.7143719, 0.1052468, 1, 0, 0.7843137, 1,
1.079904, 0.07772481, 2.610499, 1, 0, 0.7803922, 1,
1.081836, 0.08065841, 3.579734, 1, 0, 0.772549, 1,
1.094695, -2.042819, 3.992992, 1, 0, 0.7686275, 1,
1.09509, 0.8560507, 1.89298, 1, 0, 0.7607843, 1,
1.100984, 0.8903834, -0.6092557, 1, 0, 0.7568628, 1,
1.103312, 2.084179, 2.20143, 1, 0, 0.7490196, 1,
1.113238, -0.341345, 2.104494, 1, 0, 0.7450981, 1,
1.122789, -1.035876, 1.839953, 1, 0, 0.7372549, 1,
1.147574, 0.6002941, 0.44411, 1, 0, 0.7333333, 1,
1.148077, -1.19095, 3.580468, 1, 0, 0.7254902, 1,
1.148916, -0.02430056, -0.6285248, 1, 0, 0.7215686, 1,
1.158527, -0.1382435, 0.956971, 1, 0, 0.7137255, 1,
1.159149, -0.3327548, 2.522478, 1, 0, 0.7098039, 1,
1.161745, -0.9070066, 4.352486, 1, 0, 0.7019608, 1,
1.164995, 0.6113322, -0.08898134, 1, 0, 0.6941177, 1,
1.172554, -0.503037, 2.014022, 1, 0, 0.6901961, 1,
1.175225, 0.5907112, 2.821994, 1, 0, 0.682353, 1,
1.189029, 0.2314527, 0.6916014, 1, 0, 0.6784314, 1,
1.198408, 0.8448817, -0.5571985, 1, 0, 0.6705883, 1,
1.202035, -0.885765, 2.858882, 1, 0, 0.6666667, 1,
1.203154, -1.191632, 2.215658, 1, 0, 0.6588235, 1,
1.203293, -0.8540674, 1.419608, 1, 0, 0.654902, 1,
1.203351, -0.7893576, 2.958131, 1, 0, 0.6470588, 1,
1.211974, 0.5135901, 1.495456, 1, 0, 0.6431373, 1,
1.220884, 0.2404753, 0.9432327, 1, 0, 0.6352941, 1,
1.222224, 1.273307, 0.6538811, 1, 0, 0.6313726, 1,
1.23458, -0.7185444, 1.820696, 1, 0, 0.6235294, 1,
1.237281, -2.385623, 3.685918, 1, 0, 0.6196079, 1,
1.239217, 0.06368573, 2.096225, 1, 0, 0.6117647, 1,
1.250304, 0.3313369, 1.766613, 1, 0, 0.6078432, 1,
1.25636, -1.002574, 0.8165023, 1, 0, 0.6, 1,
1.264527, -0.4706014, 2.629158, 1, 0, 0.5921569, 1,
1.273762, -1.672627, 1.883809, 1, 0, 0.5882353, 1,
1.278195, -1.009007, 1.318893, 1, 0, 0.5803922, 1,
1.280093, -1.120139, 4.185352, 1, 0, 0.5764706, 1,
1.281362, -1.291749, 2.464702, 1, 0, 0.5686275, 1,
1.283111, -0.6261567, 2.19631, 1, 0, 0.5647059, 1,
1.291914, -0.837258, 3.113205, 1, 0, 0.5568628, 1,
1.292911, -1.754954, 3.802551, 1, 0, 0.5529412, 1,
1.296944, 0.9324032, 0.7111074, 1, 0, 0.5450981, 1,
1.301996, -1.521343, 1.425889, 1, 0, 0.5411765, 1,
1.313922, 0.09568403, 1.894362, 1, 0, 0.5333334, 1,
1.320133, 2.095194, 0.2952753, 1, 0, 0.5294118, 1,
1.324641, -0.01770524, 0.9912227, 1, 0, 0.5215687, 1,
1.326079, 0.1200118, 1.923306, 1, 0, 0.5176471, 1,
1.342812, 1.148202, 1.68498, 1, 0, 0.509804, 1,
1.344139, 1.045152, 1.457378, 1, 0, 0.5058824, 1,
1.359607, 1.139274, -0.4055184, 1, 0, 0.4980392, 1,
1.368292, -1.457556, 1.449982, 1, 0, 0.4901961, 1,
1.373637, 0.890677, 1.036161, 1, 0, 0.4862745, 1,
1.375029, 0.274074, 1.191875, 1, 0, 0.4784314, 1,
1.377075, -1.894299, 2.631323, 1, 0, 0.4745098, 1,
1.377685, -0.8787695, 1.461524, 1, 0, 0.4666667, 1,
1.387874, 1.102761, 1.472729, 1, 0, 0.4627451, 1,
1.406399, -1.023846, 1.751635, 1, 0, 0.454902, 1,
1.416819, 0.5778472, 1.928984, 1, 0, 0.4509804, 1,
1.436596, 0.6298423, 2.109061, 1, 0, 0.4431373, 1,
1.436887, 1.341094, 1.471906, 1, 0, 0.4392157, 1,
1.441723, 2.810782, -0.3704031, 1, 0, 0.4313726, 1,
1.450309, 0.862626, 2.037696, 1, 0, 0.427451, 1,
1.467464, -0.8978192, -0.3836361, 1, 0, 0.4196078, 1,
1.49664, -1.589381, 2.336857, 1, 0, 0.4156863, 1,
1.497329, 0.2497229, 1.074571, 1, 0, 0.4078431, 1,
1.503209, 0.8392521, 1.352635, 1, 0, 0.4039216, 1,
1.512733, 0.5691597, -0.1082836, 1, 0, 0.3960784, 1,
1.516856, 0.5091511, 2.666461, 1, 0, 0.3882353, 1,
1.524101, -0.3274969, 1.097628, 1, 0, 0.3843137, 1,
1.526227, 0.2676818, -0.5179763, 1, 0, 0.3764706, 1,
1.526663, 0.7170441, 1.52757, 1, 0, 0.372549, 1,
1.527551, -0.4693046, 4.437913, 1, 0, 0.3647059, 1,
1.541176, -1.256536, 2.728327, 1, 0, 0.3607843, 1,
1.570552, 0.8705443, 0.5465567, 1, 0, 0.3529412, 1,
1.571086, -1.58436, 1.655272, 1, 0, 0.3490196, 1,
1.579091, 0.2458939, 2.117784, 1, 0, 0.3411765, 1,
1.589028, 0.4140182, 1.629493, 1, 0, 0.3372549, 1,
1.589188, -0.3949466, 1.145301, 1, 0, 0.3294118, 1,
1.597721, 0.1971142, 2.562388, 1, 0, 0.3254902, 1,
1.601866, 1.383456, 0.4679145, 1, 0, 0.3176471, 1,
1.605354, 2.382894, -0.718116, 1, 0, 0.3137255, 1,
1.609269, 2.228815, 1.77867, 1, 0, 0.3058824, 1,
1.618148, -0.8990097, -0.5094269, 1, 0, 0.2980392, 1,
1.624267, -0.8341001, 0.6948763, 1, 0, 0.2941177, 1,
1.637019, -0.2541231, 0.7319465, 1, 0, 0.2862745, 1,
1.647169, -0.03055589, 1.807149, 1, 0, 0.282353, 1,
1.649864, 0.8005222, 0.3103528, 1, 0, 0.2745098, 1,
1.653291, 1.275313, 2.210586, 1, 0, 0.2705882, 1,
1.676373, 1.231328, 1.717455, 1, 0, 0.2627451, 1,
1.708348, -0.1049156, 1.180173, 1, 0, 0.2588235, 1,
1.724769, 0.02128394, 2.342896, 1, 0, 0.2509804, 1,
1.72774, -0.769013, 1.417843, 1, 0, 0.2470588, 1,
1.736687, -0.5868644, 1.562977, 1, 0, 0.2392157, 1,
1.745431, 0.5163152, 0.5619317, 1, 0, 0.2352941, 1,
1.74659, -0.1851596, 1.660298, 1, 0, 0.227451, 1,
1.755453, 1.04543, 1.753078, 1, 0, 0.2235294, 1,
1.756375, 1.038289, 1.461777, 1, 0, 0.2156863, 1,
1.805858, 0.7540212, 0.04973526, 1, 0, 0.2117647, 1,
1.825848, 0.8736619, 3.385766, 1, 0, 0.2039216, 1,
1.872456, -0.8969777, 1.394595, 1, 0, 0.1960784, 1,
1.882458, -0.580393, 1.718025, 1, 0, 0.1921569, 1,
1.900733, -0.769603, 1.905254, 1, 0, 0.1843137, 1,
1.902417, -0.3815871, 0.9126067, 1, 0, 0.1803922, 1,
1.919586, 0.627268, 1.971619, 1, 0, 0.172549, 1,
1.925133, 0.7754111, 2.167967, 1, 0, 0.1686275, 1,
1.982407, -0.6310757, 0.6759993, 1, 0, 0.1607843, 1,
2.005263, 0.6257902, 2.351601, 1, 0, 0.1568628, 1,
2.053428, -1.41268, 1.313309, 1, 0, 0.1490196, 1,
2.079517, -1.139133, 1.789911, 1, 0, 0.145098, 1,
2.093265, 1.642606, -0.5654377, 1, 0, 0.1372549, 1,
2.112791, -0.1314955, 0.7352784, 1, 0, 0.1333333, 1,
2.166367, -1.214494, 2.303427, 1, 0, 0.1254902, 1,
2.208145, 0.05186885, 0.6503535, 1, 0, 0.1215686, 1,
2.215387, 0.6516701, 0.4518401, 1, 0, 0.1137255, 1,
2.230543, -0.3776909, 1.371103, 1, 0, 0.1098039, 1,
2.234252, -1.284703, 3.368916, 1, 0, 0.1019608, 1,
2.25791, -0.5244234, 2.361821, 1, 0, 0.09411765, 1,
2.30755, 0.1719256, 0.4686527, 1, 0, 0.09019608, 1,
2.322631, -0.2002443, 0.4032395, 1, 0, 0.08235294, 1,
2.323207, 0.4911241, 0.2109311, 1, 0, 0.07843138, 1,
2.344457, 0.1994355, 2.296515, 1, 0, 0.07058824, 1,
2.357129, 0.5429457, 1.191687, 1, 0, 0.06666667, 1,
2.368695, 0.2039046, 2.060429, 1, 0, 0.05882353, 1,
2.465793, 0.3161541, 0.07144518, 1, 0, 0.05490196, 1,
2.603636, -1.426866, 1.129352, 1, 0, 0.04705882, 1,
2.64162, 0.5474862, 0.4796995, 1, 0, 0.04313726, 1,
2.742584, -0.8739368, 1.560815, 1, 0, 0.03529412, 1,
2.778112, 0.5233297, 1.884167, 1, 0, 0.03137255, 1,
2.848191, -2.125486, 2.726909, 1, 0, 0.02352941, 1,
2.893055, 0.7715881, -0.02960848, 1, 0, 0.01960784, 1,
2.936074, 0.4722216, 2.479138, 1, 0, 0.01176471, 1,
3.150261, -0.5283077, 1.646105, 1, 0, 0.007843138, 1
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
0.0724591, -4.287723, -7.216609, 0, -0.5, 0.5, 0.5,
0.0724591, -4.287723, -7.216609, 1, -0.5, 0.5, 0.5,
0.0724591, -4.287723, -7.216609, 1, 1.5, 0.5, 0.5,
0.0724591, -4.287723, -7.216609, 0, 1.5, 0.5, 0.5
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
-4.048718, 0.1425847, -7.216609, 0, -0.5, 0.5, 0.5,
-4.048718, 0.1425847, -7.216609, 1, -0.5, 0.5, 0.5,
-4.048718, 0.1425847, -7.216609, 1, 1.5, 0.5, 0.5,
-4.048718, 0.1425847, -7.216609, 0, 1.5, 0.5, 0.5
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
-4.048718, -4.287723, 0.3270924, 0, -0.5, 0.5, 0.5,
-4.048718, -4.287723, 0.3270924, 1, -0.5, 0.5, 0.5,
-4.048718, -4.287723, 0.3270924, 1, 1.5, 0.5, 0.5,
-4.048718, -4.287723, 0.3270924, 0, 1.5, 0.5, 0.5
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
-3, -3.265344, -5.475755,
3, -3.265344, -5.475755,
-3, -3.265344, -5.475755,
-3, -3.43574, -5.765897,
-2, -3.265344, -5.475755,
-2, -3.43574, -5.765897,
-1, -3.265344, -5.475755,
-1, -3.43574, -5.765897,
0, -3.265344, -5.475755,
0, -3.43574, -5.765897,
1, -3.265344, -5.475755,
1, -3.43574, -5.765897,
2, -3.265344, -5.475755,
2, -3.43574, -5.765897,
3, -3.265344, -5.475755,
3, -3.43574, -5.765897
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
-3, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
-3, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
-3, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
-3, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5,
-2, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
-2, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
-2, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
-2, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5,
-1, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
-1, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
-1, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
-1, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5,
0, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
0, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
0, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
0, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5,
1, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
1, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
1, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
1, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5,
2, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
2, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
2, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
2, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5,
3, -3.776533, -6.346182, 0, -0.5, 0.5, 0.5,
3, -3.776533, -6.346182, 1, -0.5, 0.5, 0.5,
3, -3.776533, -6.346182, 1, 1.5, 0.5, 0.5,
3, -3.776533, -6.346182, 0, 1.5, 0.5, 0.5
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
-3.097677, -3, -5.475755,
-3.097677, 3, -5.475755,
-3.097677, -3, -5.475755,
-3.256184, -3, -5.765897,
-3.097677, -2, -5.475755,
-3.256184, -2, -5.765897,
-3.097677, -1, -5.475755,
-3.256184, -1, -5.765897,
-3.097677, 0, -5.475755,
-3.256184, 0, -5.765897,
-3.097677, 1, -5.475755,
-3.256184, 1, -5.765897,
-3.097677, 2, -5.475755,
-3.256184, 2, -5.765897,
-3.097677, 3, -5.475755,
-3.256184, 3, -5.765897
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
-3.573197, -3, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, -3, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, -3, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, -3, -6.346182, 0, 1.5, 0.5, 0.5,
-3.573197, -2, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, -2, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, -2, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, -2, -6.346182, 0, 1.5, 0.5, 0.5,
-3.573197, -1, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, -1, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, -1, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, -1, -6.346182, 0, 1.5, 0.5, 0.5,
-3.573197, 0, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, 0, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, 0, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, 0, -6.346182, 0, 1.5, 0.5, 0.5,
-3.573197, 1, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, 1, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, 1, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, 1, -6.346182, 0, 1.5, 0.5, 0.5,
-3.573197, 2, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, 2, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, 2, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, 2, -6.346182, 0, 1.5, 0.5, 0.5,
-3.573197, 3, -6.346182, 0, -0.5, 0.5, 0.5,
-3.573197, 3, -6.346182, 1, -0.5, 0.5, 0.5,
-3.573197, 3, -6.346182, 1, 1.5, 0.5, 0.5,
-3.573197, 3, -6.346182, 0, 1.5, 0.5, 0.5
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
-3.097677, -3.265344, -4,
-3.097677, -3.265344, 4,
-3.097677, -3.265344, -4,
-3.256184, -3.43574, -4,
-3.097677, -3.265344, -2,
-3.256184, -3.43574, -2,
-3.097677, -3.265344, 0,
-3.256184, -3.43574, 0,
-3.097677, -3.265344, 2,
-3.256184, -3.43574, 2,
-3.097677, -3.265344, 4,
-3.256184, -3.43574, 4
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
-3.573197, -3.776533, -4, 0, -0.5, 0.5, 0.5,
-3.573197, -3.776533, -4, 1, -0.5, 0.5, 0.5,
-3.573197, -3.776533, -4, 1, 1.5, 0.5, 0.5,
-3.573197, -3.776533, -4, 0, 1.5, 0.5, 0.5,
-3.573197, -3.776533, -2, 0, -0.5, 0.5, 0.5,
-3.573197, -3.776533, -2, 1, -0.5, 0.5, 0.5,
-3.573197, -3.776533, -2, 1, 1.5, 0.5, 0.5,
-3.573197, -3.776533, -2, 0, 1.5, 0.5, 0.5,
-3.573197, -3.776533, 0, 0, -0.5, 0.5, 0.5,
-3.573197, -3.776533, 0, 1, -0.5, 0.5, 0.5,
-3.573197, -3.776533, 0, 1, 1.5, 0.5, 0.5,
-3.573197, -3.776533, 0, 0, 1.5, 0.5, 0.5,
-3.573197, -3.776533, 2, 0, -0.5, 0.5, 0.5,
-3.573197, -3.776533, 2, 1, -0.5, 0.5, 0.5,
-3.573197, -3.776533, 2, 1, 1.5, 0.5, 0.5,
-3.573197, -3.776533, 2, 0, 1.5, 0.5, 0.5,
-3.573197, -3.776533, 4, 0, -0.5, 0.5, 0.5,
-3.573197, -3.776533, 4, 1, -0.5, 0.5, 0.5,
-3.573197, -3.776533, 4, 1, 1.5, 0.5, 0.5,
-3.573197, -3.776533, 4, 0, 1.5, 0.5, 0.5
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
-3.097677, -3.265344, -5.475755,
-3.097677, 3.550513, -5.475755,
-3.097677, -3.265344, 6.12994,
-3.097677, 3.550513, 6.12994,
-3.097677, -3.265344, -5.475755,
-3.097677, -3.265344, 6.12994,
-3.097677, 3.550513, -5.475755,
-3.097677, 3.550513, 6.12994,
-3.097677, -3.265344, -5.475755,
3.242595, -3.265344, -5.475755,
-3.097677, -3.265344, 6.12994,
3.242595, -3.265344, 6.12994,
-3.097677, 3.550513, -5.475755,
3.242595, 3.550513, -5.475755,
-3.097677, 3.550513, 6.12994,
3.242595, 3.550513, 6.12994,
3.242595, -3.265344, -5.475755,
3.242595, 3.550513, -5.475755,
3.242595, -3.265344, 6.12994,
3.242595, 3.550513, 6.12994,
3.242595, -3.265344, -5.475755,
3.242595, -3.265344, 6.12994,
3.242595, 3.550513, -5.475755,
3.242595, 3.550513, 6.12994
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
var radius = 7.944424;
var distance = 35.34564;
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
mvMatrix.translate( -0.0724591, -0.1425847, -0.3270924 );
mvMatrix.scale( 1.354779, 1.260247, 0.7401252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34564);
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
hydroxyimidazole<-read.table("hydroxyimidazole.xyz")
```

```
## Error in read.table("hydroxyimidazole.xyz"): no lines available in input
```

```r
x<-hydroxyimidazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyimidazole' not found
```

```r
y<-hydroxyimidazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyimidazole' not found
```

```r
z<-hydroxyimidazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyimidazole' not found
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
-3.005343, -0.789735, -2.00098, 0, 0, 1, 1, 1,
-3.003346, -0.01334777, -2.18457, 1, 0, 0, 1, 1,
-2.987385, 0.5321112, -2.439646, 1, 0, 0, 1, 1,
-2.98629, -0.5203504, -2.798034, 1, 0, 0, 1, 1,
-2.947017, -0.05510956, -1.317592, 1, 0, 0, 1, 1,
-2.694292, 0.5672206, -3.531043, 1, 0, 0, 1, 1,
-2.496581, 0.3337574, -1.653294, 0, 0, 0, 1, 1,
-2.384228, -1.832704, -3.339247, 0, 0, 0, 1, 1,
-2.355291, 0.07171511, -2.717431, 0, 0, 0, 1, 1,
-2.298706, 0.9065678, -0.1329535, 0, 0, 0, 1, 1,
-2.206563, -0.04115228, -2.608525, 0, 0, 0, 1, 1,
-2.17125, -0.7240791, -0.5424782, 0, 0, 0, 1, 1,
-2.160136, 0.8057446, -1.69207, 0, 0, 0, 1, 1,
-2.154049, 0.6748272, -2.832842, 1, 1, 1, 1, 1,
-2.134146, 0.4210308, -1.167226, 1, 1, 1, 1, 1,
-2.085301, 0.5951209, -2.061587, 1, 1, 1, 1, 1,
-2.057397, 0.4964816, -1.468215, 1, 1, 1, 1, 1,
-2.052037, 1.762385, -2.495598, 1, 1, 1, 1, 1,
-2.048327, -1.308644, 0.6969887, 1, 1, 1, 1, 1,
-2.02161, 0.1023036, -2.62417, 1, 1, 1, 1, 1,
-2.013013, -0.2768776, -2.496465, 1, 1, 1, 1, 1,
-1.980452, -0.2651879, -0.06496435, 1, 1, 1, 1, 1,
-1.967981, -0.09313495, -2.431952, 1, 1, 1, 1, 1,
-1.966353, -1.912518, -2.345049, 1, 1, 1, 1, 1,
-1.957441, -1.040104, -0.09932033, 1, 1, 1, 1, 1,
-1.95524, -1.768951, -3.71704, 1, 1, 1, 1, 1,
-1.947083, -0.03783929, -1.072208, 1, 1, 1, 1, 1,
-1.933252, 0.007349205, -2.073515, 1, 1, 1, 1, 1,
-1.932293, 1.229375, -0.3860032, 0, 0, 1, 1, 1,
-1.930928, -0.5248849, -1.984911, 1, 0, 0, 1, 1,
-1.922141, 2.037971, -0.9282438, 1, 0, 0, 1, 1,
-1.918727, -0.8579227, -0.8617392, 1, 0, 0, 1, 1,
-1.898883, -0.2088498, -0.6713372, 1, 0, 0, 1, 1,
-1.897911, -0.9083575, -1.791126, 1, 0, 0, 1, 1,
-1.896961, -0.441231, -2.781268, 0, 0, 0, 1, 1,
-1.841926, 0.1844113, 0.2853504, 0, 0, 0, 1, 1,
-1.841261, -0.07922966, -0.5393668, 0, 0, 0, 1, 1,
-1.830799, -0.11704, -0.7261993, 0, 0, 0, 1, 1,
-1.82178, -0.6388392, -2.162123, 0, 0, 0, 1, 1,
-1.821252, -0.249747, -2.425493, 0, 0, 0, 1, 1,
-1.81321, 0.0005447409, -2.598237, 0, 0, 0, 1, 1,
-1.776, -0.8283478, -2.942125, 1, 1, 1, 1, 1,
-1.772028, 1.048931, -1.689638, 1, 1, 1, 1, 1,
-1.76371, -1.486117, -3.022593, 1, 1, 1, 1, 1,
-1.762277, -1.452165, -3.670933, 1, 1, 1, 1, 1,
-1.759585, 0.7225242, -0.6537492, 1, 1, 1, 1, 1,
-1.718891, 0.2203602, -2.238257, 1, 1, 1, 1, 1,
-1.690048, 0.1143737, -1.028631, 1, 1, 1, 1, 1,
-1.661854, -1.041486, -2.208115, 1, 1, 1, 1, 1,
-1.657909, -0.9581419, -0.5819135, 1, 1, 1, 1, 1,
-1.637874, -0.5167599, -1.5912, 1, 1, 1, 1, 1,
-1.637675, -0.4295095, -2.14118, 1, 1, 1, 1, 1,
-1.625192, 0.9007878, -1.439085, 1, 1, 1, 1, 1,
-1.608926, 0.1128722, -1.578457, 1, 1, 1, 1, 1,
-1.598583, -0.6050034, -1.385498, 1, 1, 1, 1, 1,
-1.591187, 0.5261346, -1.53739, 1, 1, 1, 1, 1,
-1.584127, -0.5768378, -1.191322, 0, 0, 1, 1, 1,
-1.582863, 0.2312962, -1.22699, 1, 0, 0, 1, 1,
-1.574134, 1.813041, -1.877644, 1, 0, 0, 1, 1,
-1.568044, -0.2061163, -2.659081, 1, 0, 0, 1, 1,
-1.564093, 1.53084, -0.9394739, 1, 0, 0, 1, 1,
-1.557339, 0.5576103, -1.017275, 1, 0, 0, 1, 1,
-1.547471, 0.08546154, -2.49221, 0, 0, 0, 1, 1,
-1.547272, 1.877364, -0.1864909, 0, 0, 0, 1, 1,
-1.544334, -2.045908, -1.893568, 0, 0, 0, 1, 1,
-1.540985, 0.04819224, -1.568326, 0, 0, 0, 1, 1,
-1.528588, -0.247979, -0.6512338, 0, 0, 0, 1, 1,
-1.511768, -0.6736553, 0.20324, 0, 0, 0, 1, 1,
-1.511318, 0.6815205, -1.851497, 0, 0, 0, 1, 1,
-1.49919, 2.009407, -0.9167378, 1, 1, 1, 1, 1,
-1.488701, -0.487983, -1.203724, 1, 1, 1, 1, 1,
-1.484383, 0.4820209, -0.1761555, 1, 1, 1, 1, 1,
-1.479005, -0.3638229, -0.05225376, 1, 1, 1, 1, 1,
-1.471804, -0.8914067, -2.57406, 1, 1, 1, 1, 1,
-1.464593, 1.632085, -1.632655, 1, 1, 1, 1, 1,
-1.463666, -0.4472016, -2.415538, 1, 1, 1, 1, 1,
-1.461089, -0.182836, -0.4499805, 1, 1, 1, 1, 1,
-1.449486, 1.565668, -1.071548, 1, 1, 1, 1, 1,
-1.439451, -0.3692094, -1.193953, 1, 1, 1, 1, 1,
-1.436061, 1.826618, -1.228307, 1, 1, 1, 1, 1,
-1.425746, -0.1290616, -2.384098, 1, 1, 1, 1, 1,
-1.410354, 0.2403695, -1.969776, 1, 1, 1, 1, 1,
-1.404433, -0.8595089, -3.717577, 1, 1, 1, 1, 1,
-1.400899, -0.4545658, -1.798176, 1, 1, 1, 1, 1,
-1.400218, 1.727536, -0.268102, 0, 0, 1, 1, 1,
-1.397094, 1.0834, 0.3148137, 1, 0, 0, 1, 1,
-1.377885, -0.0456501, -1.120203, 1, 0, 0, 1, 1,
-1.362023, -0.752179, -1.106041, 1, 0, 0, 1, 1,
-1.360823, 0.4727734, 0.2393016, 1, 0, 0, 1, 1,
-1.360189, -0.1202473, -0.1955884, 1, 0, 0, 1, 1,
-1.359242, -0.09119711, -1.638648, 0, 0, 0, 1, 1,
-1.350897, 0.2184017, -0.5147958, 0, 0, 0, 1, 1,
-1.349417, 0.1015802, -1.57862, 0, 0, 0, 1, 1,
-1.347255, 1.223075, -0.4911674, 0, 0, 0, 1, 1,
-1.340177, 0.8288602, -1.479322, 0, 0, 0, 1, 1,
-1.334664, 0.2427245, -1.728784, 0, 0, 0, 1, 1,
-1.334352, -1.787917, -2.525402, 0, 0, 0, 1, 1,
-1.330597, 0.6139456, -0.8950841, 1, 1, 1, 1, 1,
-1.328353, 1.111802, -0.9670494, 1, 1, 1, 1, 1,
-1.320409, -0.0278266, -0.4124998, 1, 1, 1, 1, 1,
-1.319072, -0.2198858, -1.314412, 1, 1, 1, 1, 1,
-1.316228, 0.969732, -1.69883, 1, 1, 1, 1, 1,
-1.314944, -0.756206, -0.6672522, 1, 1, 1, 1, 1,
-1.311553, 0.4565008, -0.3822614, 1, 1, 1, 1, 1,
-1.310909, 0.2285144, -0.3268556, 1, 1, 1, 1, 1,
-1.302546, -0.5396278, -0.2857562, 1, 1, 1, 1, 1,
-1.302327, 0.7173415, -0.1443782, 1, 1, 1, 1, 1,
-1.299787, 0.05351446, -2.558984, 1, 1, 1, 1, 1,
-1.29754, 0.3012059, -0.652452, 1, 1, 1, 1, 1,
-1.291075, 0.3250876, -1.270133, 1, 1, 1, 1, 1,
-1.281994, -1.117416, -2.72596, 1, 1, 1, 1, 1,
-1.269009, -1.757021, -2.86587, 1, 1, 1, 1, 1,
-1.266421, 0.798911, 0.8446486, 0, 0, 1, 1, 1,
-1.263262, -0.231915, -1.58621, 1, 0, 0, 1, 1,
-1.244796, 0.4309646, -1.076524, 1, 0, 0, 1, 1,
-1.241283, 0.4918334, -1.099113, 1, 0, 0, 1, 1,
-1.238039, 0.02003044, -2.284892, 1, 0, 0, 1, 1,
-1.237969, 0.9117808, -1.815391, 1, 0, 0, 1, 1,
-1.224902, 0.7585962, 0.4065644, 0, 0, 0, 1, 1,
-1.222764, 0.8940927, -1.62568, 0, 0, 0, 1, 1,
-1.221464, -0.2196469, -2.241009, 0, 0, 0, 1, 1,
-1.220349, 0.6137784, -1.284109, 0, 0, 0, 1, 1,
-1.217242, -1.685808, -2.869539, 0, 0, 0, 1, 1,
-1.21328, -0.2121992, -2.93646, 0, 0, 0, 1, 1,
-1.210818, -0.2228102, -3.625353, 0, 0, 0, 1, 1,
-1.209442, 0.3713634, -1.476596, 1, 1, 1, 1, 1,
-1.207651, -1.522281, -0.6288521, 1, 1, 1, 1, 1,
-1.205831, 0.01102184, -2.79406, 1, 1, 1, 1, 1,
-1.205235, -0.6122015, -3.638497, 1, 1, 1, 1, 1,
-1.204366, -0.3177748, -0.129705, 1, 1, 1, 1, 1,
-1.198482, -0.879433, -3.072504, 1, 1, 1, 1, 1,
-1.194335, 0.7357835, 0.2954029, 1, 1, 1, 1, 1,
-1.180951, -0.1648796, -1.30086, 1, 1, 1, 1, 1,
-1.180703, -0.4310861, -1.513796, 1, 1, 1, 1, 1,
-1.180034, 0.3801573, -2.005936, 1, 1, 1, 1, 1,
-1.169196, 0.6378849, -0.2803615, 1, 1, 1, 1, 1,
-1.169128, 1.006043, 1.011834, 1, 1, 1, 1, 1,
-1.166606, 0.1665976, -1.909256, 1, 1, 1, 1, 1,
-1.165017, -1.393179, -1.946728, 1, 1, 1, 1, 1,
-1.158672, -0.7468843, -1.757536, 1, 1, 1, 1, 1,
-1.150741, -2.174478, -1.594788, 0, 0, 1, 1, 1,
-1.147638, -0.4356157, -2.304216, 1, 0, 0, 1, 1,
-1.142665, -1.348245, -2.353361, 1, 0, 0, 1, 1,
-1.132299, 2.689698, -0.3098388, 1, 0, 0, 1, 1,
-1.131825, 0.954322, -0.353358, 1, 0, 0, 1, 1,
-1.127629, -1.303849, -0.8162742, 1, 0, 0, 1, 1,
-1.127023, -0.9128697, -0.5653822, 0, 0, 0, 1, 1,
-1.115437, 0.6742232, -1.098998, 0, 0, 0, 1, 1,
-1.114716, 0.8538277, -0.5511006, 0, 0, 0, 1, 1,
-1.10948, 1.927877, 1.123299, 0, 0, 0, 1, 1,
-1.106453, 1.608634, -1.969072, 0, 0, 0, 1, 1,
-1.096176, -0.3309471, -0.8902588, 0, 0, 0, 1, 1,
-1.093223, 0.6825935, -1.111351, 0, 0, 0, 1, 1,
-1.088724, 0.3456475, -1.837507, 1, 1, 1, 1, 1,
-1.088657, -1.566773, -1.812171, 1, 1, 1, 1, 1,
-1.086336, -1.998098, -2.854031, 1, 1, 1, 1, 1,
-1.085341, -0.6928573, -2.307609, 1, 1, 1, 1, 1,
-1.084335, 0.04904077, -1.059655, 1, 1, 1, 1, 1,
-1.079002, -2.050414, -0.6865848, 1, 1, 1, 1, 1,
-1.077689, 1.378129, -1.285708, 1, 1, 1, 1, 1,
-1.072061, 0.6890585, 1.385019, 1, 1, 1, 1, 1,
-1.057991, 1.649876, -1.221745, 1, 1, 1, 1, 1,
-1.057361, -0.5174565, -1.73383, 1, 1, 1, 1, 1,
-1.056232, 2.362696, -1.609707, 1, 1, 1, 1, 1,
-1.054382, 0.7226229, -0.6503026, 1, 1, 1, 1, 1,
-1.054207, -1.772734, -3.32161, 1, 1, 1, 1, 1,
-1.027021, -0.6200064, -3.002439, 1, 1, 1, 1, 1,
-1.021216, -0.6659494, -1.139966, 1, 1, 1, 1, 1,
-1.01963, 2.317329, -2.439339, 0, 0, 1, 1, 1,
-1.01575, -0.608077, -1.888155, 1, 0, 0, 1, 1,
-1.011679, -1.885182, -2.319128, 1, 0, 0, 1, 1,
-1.003992, -1.462339, -2.161474, 1, 0, 0, 1, 1,
-1.000682, -0.3436096, -1.705138, 1, 0, 0, 1, 1,
-0.9980973, 1.04793, 0.3543235, 1, 0, 0, 1, 1,
-0.9943311, 1.485821, -0.7566741, 0, 0, 0, 1, 1,
-0.9848548, 1.408431, -0.9063511, 0, 0, 0, 1, 1,
-0.9785175, 0.7374057, -1.1439, 0, 0, 0, 1, 1,
-0.9772646, -0.1049586, -2.036242, 0, 0, 0, 1, 1,
-0.9769376, -0.04462507, -2.066056, 0, 0, 0, 1, 1,
-0.9757898, -1.533443, -2.604455, 0, 0, 0, 1, 1,
-0.9731819, -0.8182308, -2.024737, 0, 0, 0, 1, 1,
-0.9695257, 0.5258033, -1.640641, 1, 1, 1, 1, 1,
-0.9668497, -1.39301, -0.9761214, 1, 1, 1, 1, 1,
-0.9663863, 1.76104, -2.031266, 1, 1, 1, 1, 1,
-0.9523032, 0.5119577, -0.584794, 1, 1, 1, 1, 1,
-0.9512611, 1.836105, -1.801982, 1, 1, 1, 1, 1,
-0.9498506, -0.5111449, -3.247901, 1, 1, 1, 1, 1,
-0.9493796, -0.9618332, -1.830728, 1, 1, 1, 1, 1,
-0.9490561, -1.416965, -0.614477, 1, 1, 1, 1, 1,
-0.9485194, 0.3027129, -3.600648, 1, 1, 1, 1, 1,
-0.9453509, -0.5612841, -3.433858, 1, 1, 1, 1, 1,
-0.9176481, -0.2237623, -2.79496, 1, 1, 1, 1, 1,
-0.9158061, 0.3217964, -2.125835, 1, 1, 1, 1, 1,
-0.9141901, -0.7398494, -2.434663, 1, 1, 1, 1, 1,
-0.9128376, 2.723958, -0.3231522, 1, 1, 1, 1, 1,
-0.9112406, 0.9378144, -0.9175738, 1, 1, 1, 1, 1,
-0.9110674, -0.9555638, -2.060556, 0, 0, 1, 1, 1,
-0.9095578, 0.5862955, -0.4107571, 1, 0, 0, 1, 1,
-0.9072368, -0.1900248, -1.816735, 1, 0, 0, 1, 1,
-0.9036596, 0.1068261, -1.181111, 1, 0, 0, 1, 1,
-0.9020711, -0.8840092, -1.18912, 1, 0, 0, 1, 1,
-0.8762312, 0.1633082, -0.4753284, 1, 0, 0, 1, 1,
-0.8752348, 2.250437, -0.1496899, 0, 0, 0, 1, 1,
-0.8737699, 2.298981, -1.332905, 0, 0, 0, 1, 1,
-0.8736328, 0.3664377, -0.2469013, 0, 0, 0, 1, 1,
-0.8676331, -1.067392, -2.565854, 0, 0, 0, 1, 1,
-0.8544658, -0.4814703, -1.775678, 0, 0, 0, 1, 1,
-0.8527026, 1.411478, 0.3732496, 0, 0, 0, 1, 1,
-0.8503188, 0.9911957, -1.495583, 0, 0, 0, 1, 1,
-0.8499851, 0.2475381, -1.561947, 1, 1, 1, 1, 1,
-0.845611, 0.1646608, -0.7307076, 1, 1, 1, 1, 1,
-0.8435691, -0.9022824, -2.87171, 1, 1, 1, 1, 1,
-0.8432412, -0.6372039, -2.491383, 1, 1, 1, 1, 1,
-0.8308965, 0.5910842, -1.718771, 1, 1, 1, 1, 1,
-0.8278942, 0.622857, -2.110403, 1, 1, 1, 1, 1,
-0.8269748, -0.2618774, -1.772344, 1, 1, 1, 1, 1,
-0.8110549, 0.7081335, -0.1130977, 1, 1, 1, 1, 1,
-0.8083556, 0.687607, 1.857268, 1, 1, 1, 1, 1,
-0.8048422, -0.6618326, -2.276052, 1, 1, 1, 1, 1,
-0.7977447, 0.06119391, -2.672508, 1, 1, 1, 1, 1,
-0.7972304, 0.4328289, 0.8480738, 1, 1, 1, 1, 1,
-0.7966344, 0.3391673, -1.185153, 1, 1, 1, 1, 1,
-0.7957588, 0.592954, -0.5931495, 1, 1, 1, 1, 1,
-0.7949733, -0.3067032, -3.863559, 1, 1, 1, 1, 1,
-0.7935275, -1.104411, -2.327661, 0, 0, 1, 1, 1,
-0.790719, -2.14498, -4.584218, 1, 0, 0, 1, 1,
-0.7904146, 0.6466542, -2.142924, 1, 0, 0, 1, 1,
-0.7886757, 0.5273874, -1.252746, 1, 0, 0, 1, 1,
-0.7816978, 0.9530381, -1.274928, 1, 0, 0, 1, 1,
-0.7782918, 1.827632, 0.007650674, 1, 0, 0, 1, 1,
-0.7713595, -0.3530761, -0.5761845, 0, 0, 0, 1, 1,
-0.770819, 0.2175207, -0.2638763, 0, 0, 0, 1, 1,
-0.7667615, 0.6686665, -1.099373, 0, 0, 0, 1, 1,
-0.7649564, -1.178588, -3.362903, 0, 0, 0, 1, 1,
-0.763926, -0.4404855, -2.239512, 0, 0, 0, 1, 1,
-0.7590033, 0.8310152, -1.355016, 0, 0, 0, 1, 1,
-0.7584121, 0.2765153, -1.863865, 0, 0, 0, 1, 1,
-0.7567489, -0.6067379, -3.622782, 1, 1, 1, 1, 1,
-0.7558623, 0.1832233, -1.58598, 1, 1, 1, 1, 1,
-0.7442611, 1.999118, -0.6797546, 1, 1, 1, 1, 1,
-0.7438272, 1.47475, -1.165706, 1, 1, 1, 1, 1,
-0.7366932, 0.6330068, -0.1278251, 1, 1, 1, 1, 1,
-0.7340859, 1.192442, 0.1694257, 1, 1, 1, 1, 1,
-0.732188, -0.6456158, -2.540562, 1, 1, 1, 1, 1,
-0.7254564, 1.684242, -0.7396573, 1, 1, 1, 1, 1,
-0.7241082, 0.3751782, -1.476864, 1, 1, 1, 1, 1,
-0.720555, 0.3342443, -1.485974, 1, 1, 1, 1, 1,
-0.7181626, -1.067127, -2.974276, 1, 1, 1, 1, 1,
-0.7180698, 0.6755211, -0.6226112, 1, 1, 1, 1, 1,
-0.7149364, -1.57516, -3.287446, 1, 1, 1, 1, 1,
-0.7140503, 2.124993, 0.487775, 1, 1, 1, 1, 1,
-0.7139735, 0.4097192, -1.487573, 1, 1, 1, 1, 1,
-0.7074956, -0.8565092, -2.671132, 0, 0, 1, 1, 1,
-0.7073698, 0.05154457, -1.695134, 1, 0, 0, 1, 1,
-0.7037113, 1.78303, 0.04412802, 1, 0, 0, 1, 1,
-0.7032798, -0.05337299, -2.288709, 1, 0, 0, 1, 1,
-0.702641, -2.457634, -4.291999, 1, 0, 0, 1, 1,
-0.7011001, 0.05438001, -1.497091, 1, 0, 0, 1, 1,
-0.7006603, 0.4839453, -0.7293139, 0, 0, 0, 1, 1,
-0.6973742, -0.2840354, -3.017194, 0, 0, 0, 1, 1,
-0.6912811, 1.6327, -0.1343334, 0, 0, 0, 1, 1,
-0.686727, 1.351273, 1.180043, 0, 0, 0, 1, 1,
-0.6858508, -1.02547, -4.152497, 0, 0, 0, 1, 1,
-0.6819165, -1.537053, -4.299654, 0, 0, 0, 1, 1,
-0.6806356, 0.7413681, -1.041492, 0, 0, 0, 1, 1,
-0.6775701, -0.8674698, -2.847839, 1, 1, 1, 1, 1,
-0.6751857, 0.5005574, 0.08619732, 1, 1, 1, 1, 1,
-0.674113, -0.01481766, -0.6545547, 1, 1, 1, 1, 1,
-0.6739329, 0.3880941, -1.205089, 1, 1, 1, 1, 1,
-0.671223, -0.3746913, -2.965707, 1, 1, 1, 1, 1,
-0.6680906, 1.269647, 0.3017757, 1, 1, 1, 1, 1,
-0.6605676, 0.7714233, 0.9112208, 1, 1, 1, 1, 1,
-0.658879, -0.4612535, -2.325428, 1, 1, 1, 1, 1,
-0.6553683, 1.146232, 0.1367573, 1, 1, 1, 1, 1,
-0.6551601, 1.457134, -0.7967973, 1, 1, 1, 1, 1,
-0.6548796, 0.3723311, -1.699134, 1, 1, 1, 1, 1,
-0.6529981, 0.4960643, -0.3020447, 1, 1, 1, 1, 1,
-0.650981, 1.635155, -1.552623, 1, 1, 1, 1, 1,
-0.6457943, 0.3048072, -1.503532, 1, 1, 1, 1, 1,
-0.6385933, 0.5034378, -0.00246232, 1, 1, 1, 1, 1,
-0.6376941, 0.5562615, -1.281115, 0, 0, 1, 1, 1,
-0.6366115, -2.46833, -1.704245, 1, 0, 0, 1, 1,
-0.6355118, 1.393429, -0.442494, 1, 0, 0, 1, 1,
-0.6340752, 1.677484, -1.531556, 1, 0, 0, 1, 1,
-0.6308167, 1.348854, -0.9251022, 1, 0, 0, 1, 1,
-0.6300642, -0.708191, -1.899908, 1, 0, 0, 1, 1,
-0.6220384, 0.2900412, -2.450416, 0, 0, 0, 1, 1,
-0.6113169, -0.3496957, -2.151137, 0, 0, 0, 1, 1,
-0.6103393, 0.3841985, -0.9881677, 0, 0, 0, 1, 1,
-0.6074792, 1.091051, -0.2112168, 0, 0, 0, 1, 1,
-0.6054065, -0.4253985, -1.271417, 0, 0, 0, 1, 1,
-0.5992678, 0.5573794, -0.9490857, 0, 0, 0, 1, 1,
-0.5955968, -0.8497339, -2.151133, 0, 0, 0, 1, 1,
-0.5898314, -0.6339006, -2.451851, 1, 1, 1, 1, 1,
-0.5888338, -1.208554, -3.612582, 1, 1, 1, 1, 1,
-0.5845463, -0.2744589, -1.854911, 1, 1, 1, 1, 1,
-0.5840372, 0.1226183, -2.647551, 1, 1, 1, 1, 1,
-0.5818793, -0.05908917, -1.750936, 1, 1, 1, 1, 1,
-0.5793523, -2.040781, -3.689383, 1, 1, 1, 1, 1,
-0.5787685, -0.8188701, -4.124483, 1, 1, 1, 1, 1,
-0.5768003, -0.7899537, -4.668144, 1, 1, 1, 1, 1,
-0.5757474, 0.3280168, -0.5490305, 1, 1, 1, 1, 1,
-0.5732089, 0.7731887, 1.233156, 1, 1, 1, 1, 1,
-0.5630702, -0.207791, -2.70844, 1, 1, 1, 1, 1,
-0.5574255, 2.031511, -0.7462121, 1, 1, 1, 1, 1,
-0.5563131, -1.106795, -1.402056, 1, 1, 1, 1, 1,
-0.5539299, 0.01620445, -3.225754, 1, 1, 1, 1, 1,
-0.55265, -0.2221771, -0.3539372, 1, 1, 1, 1, 1,
-0.5521479, -1.524319, -3.728509, 0, 0, 1, 1, 1,
-0.5478207, 0.8433656, -2.001995, 1, 0, 0, 1, 1,
-0.5442042, -0.2181427, -1.935325, 1, 0, 0, 1, 1,
-0.5441791, -1.781872, -2.345357, 1, 0, 0, 1, 1,
-0.5416164, -1.241509, -2.568184, 1, 0, 0, 1, 1,
-0.5414201, -0.664004, -1.845262, 1, 0, 0, 1, 1,
-0.5386721, -0.645388, -2.26706, 0, 0, 0, 1, 1,
-0.5336185, -0.7438223, -3.287031, 0, 0, 0, 1, 1,
-0.5309417, 1.018806, 0.1821332, 0, 0, 0, 1, 1,
-0.5303429, 0.7987178, -1.859366, 0, 0, 0, 1, 1,
-0.5244903, 0.4246578, -2.040316, 0, 0, 0, 1, 1,
-0.5234716, 0.3107066, -0.756311, 0, 0, 0, 1, 1,
-0.522226, -1.058856, -3.164444, 0, 0, 0, 1, 1,
-0.5173976, 0.2644969, -1.044354, 1, 1, 1, 1, 1,
-0.5150814, -1.095136, -1.187896, 1, 1, 1, 1, 1,
-0.5060048, 0.422229, 0.500811, 1, 1, 1, 1, 1,
-0.5035158, 0.06361017, -1.644239, 1, 1, 1, 1, 1,
-0.5034314, -0.2771736, -1.637037, 1, 1, 1, 1, 1,
-0.5029309, 1.62184, -0.9911053, 1, 1, 1, 1, 1,
-0.4987693, -0.6293783, -3.197338, 1, 1, 1, 1, 1,
-0.4987022, 0.964888, -0.04500182, 1, 1, 1, 1, 1,
-0.4906531, -0.5018643, -0.8673251, 1, 1, 1, 1, 1,
-0.4832036, 0.5821233, -2.41034, 1, 1, 1, 1, 1,
-0.4743529, -0.4858932, -4.169606, 1, 1, 1, 1, 1,
-0.4740617, 0.2123907, -1.004776, 1, 1, 1, 1, 1,
-0.4735617, 1.492921, 0.03731788, 1, 1, 1, 1, 1,
-0.4727397, 0.08004262, -1.1191, 1, 1, 1, 1, 1,
-0.4720162, 1.154119, -2.288888, 1, 1, 1, 1, 1,
-0.4712833, 0.1638481, -2.104115, 0, 0, 1, 1, 1,
-0.4684213, -1.226286, -3.181625, 1, 0, 0, 1, 1,
-0.461133, -0.3638191, -1.665155, 1, 0, 0, 1, 1,
-0.4607501, -0.494459, -2.523995, 1, 0, 0, 1, 1,
-0.4581477, 2.669667, -1.16112, 1, 0, 0, 1, 1,
-0.4577678, 1.58955, -1.905593, 1, 0, 0, 1, 1,
-0.4576781, -0.4171366, -1.612936, 0, 0, 0, 1, 1,
-0.454124, 1.464892, -0.5880198, 0, 0, 0, 1, 1,
-0.4498963, -0.07126234, -1.798824, 0, 0, 0, 1, 1,
-0.4476179, 1.223521, 0.09051361, 0, 0, 0, 1, 1,
-0.4445686, 0.3645109, 0.02692349, 0, 0, 0, 1, 1,
-0.4445652, -0.01939232, -2.483705, 0, 0, 0, 1, 1,
-0.4441555, 0.1657379, -2.082962, 0, 0, 0, 1, 1,
-0.4438633, -0.3541141, -1.831035, 1, 1, 1, 1, 1,
-0.4387313, 0.2192069, -2.412003, 1, 1, 1, 1, 1,
-0.4377497, -0.07051776, -1.158661, 1, 1, 1, 1, 1,
-0.434884, -0.7764069, -2.765779, 1, 1, 1, 1, 1,
-0.4330163, 2.54561, 0.9232355, 1, 1, 1, 1, 1,
-0.4316365, -0.1786476, -2.989073, 1, 1, 1, 1, 1,
-0.4279963, 0.9098404, -1.744716, 1, 1, 1, 1, 1,
-0.4247131, -0.6940102, -1.945527, 1, 1, 1, 1, 1,
-0.4213175, 1.148156, -1.692855, 1, 1, 1, 1, 1,
-0.4124497, 0.9421603, -0.8734851, 1, 1, 1, 1, 1,
-0.4097772, 0.4623491, -1.508646, 1, 1, 1, 1, 1,
-0.4093495, -0.6881915, -3.07602, 1, 1, 1, 1, 1,
-0.4000534, -0.01243585, 0.02787706, 1, 1, 1, 1, 1,
-0.3992718, 1.575906, -1.155062, 1, 1, 1, 1, 1,
-0.3991282, -0.9517872, -1.984003, 1, 1, 1, 1, 1,
-0.3971151, -0.4169754, -2.465376, 0, 0, 1, 1, 1,
-0.3964668, -0.7940925, -2.251586, 1, 0, 0, 1, 1,
-0.3941678, -0.3037067, -2.046544, 1, 0, 0, 1, 1,
-0.3941226, -0.6732369, -3.038241, 1, 0, 0, 1, 1,
-0.3931947, -0.2023965, -2.14028, 1, 0, 0, 1, 1,
-0.3929177, 0.3057301, 0.1867784, 1, 0, 0, 1, 1,
-0.3912675, 0.731593, -0.5927504, 0, 0, 0, 1, 1,
-0.3874337, -1.012843, -2.919565, 0, 0, 0, 1, 1,
-0.3843391, -0.5351894, -2.258712, 0, 0, 0, 1, 1,
-0.3817154, -0.8617684, -2.104266, 0, 0, 0, 1, 1,
-0.3803278, -1.789062, -3.114955, 0, 0, 0, 1, 1,
-0.3773208, -1.663885, -2.439923, 0, 0, 0, 1, 1,
-0.3739168, 1.550973, 0.2106255, 0, 0, 0, 1, 1,
-0.3738573, 0.969982, -1.270458, 1, 1, 1, 1, 1,
-0.372851, -0.2924739, -2.096396, 1, 1, 1, 1, 1,
-0.3728487, -0.1474331, -2.423719, 1, 1, 1, 1, 1,
-0.3713473, 0.5260059, 0.4544151, 1, 1, 1, 1, 1,
-0.3656797, 1.581207, -1.075175, 1, 1, 1, 1, 1,
-0.3655417, -0.4465199, -3.317614, 1, 1, 1, 1, 1,
-0.3645296, -0.2481842, -1.654008, 1, 1, 1, 1, 1,
-0.3638357, 0.259748, -0.2878031, 1, 1, 1, 1, 1,
-0.362192, -0.3556805, -1.841142, 1, 1, 1, 1, 1,
-0.3492011, 1.206772, 0.2380577, 1, 1, 1, 1, 1,
-0.3480828, 0.5179985, 0.7765549, 1, 1, 1, 1, 1,
-0.3329768, 1.03775, -1.705066, 1, 1, 1, 1, 1,
-0.3300393, 0.3131219, -0.425539, 1, 1, 1, 1, 1,
-0.3285513, -0.3931554, -2.635489, 1, 1, 1, 1, 1,
-0.3280428, -0.06074389, -4.640278, 1, 1, 1, 1, 1,
-0.3273708, 1.224098, -1.60782, 0, 0, 1, 1, 1,
-0.3252058, -0.5870895, -3.747783, 1, 0, 0, 1, 1,
-0.3238463, -0.9273967, -3.855816, 1, 0, 0, 1, 1,
-0.3235533, 0.9759811, -0.6958467, 1, 0, 0, 1, 1,
-0.3202277, -0.4250544, -2.332491, 1, 0, 0, 1, 1,
-0.3186779, 0.2680881, -0.9204308, 1, 0, 0, 1, 1,
-0.316699, 0.1040873, -0.1676171, 0, 0, 0, 1, 1,
-0.3152989, -1.624924, -2.843931, 0, 0, 0, 1, 1,
-0.3151355, -2.465089, -2.443959, 0, 0, 0, 1, 1,
-0.311451, -0.6818685, -2.3283, 0, 0, 0, 1, 1,
-0.3106214, -0.3797983, -2.516263, 0, 0, 0, 1, 1,
-0.3087871, -0.8515324, -4.096606, 0, 0, 0, 1, 1,
-0.3080646, -0.07964231, -0.4380251, 0, 0, 0, 1, 1,
-0.307493, 0.2208399, -1.065281, 1, 1, 1, 1, 1,
-0.3063775, 0.5188249, 0.7448763, 1, 1, 1, 1, 1,
-0.3002971, -1.773467, -1.220513, 1, 1, 1, 1, 1,
-0.2997386, -0.5361541, -3.050084, 1, 1, 1, 1, 1,
-0.298272, -0.6890047, -4.034439, 1, 1, 1, 1, 1,
-0.2979514, 1.431905, -0.518389, 1, 1, 1, 1, 1,
-0.2961422, 0.2989126, 0.006891759, 1, 1, 1, 1, 1,
-0.2956856, 0.1585692, -0.02887292, 1, 1, 1, 1, 1,
-0.2895223, -0.6353049, -3.83761, 1, 1, 1, 1, 1,
-0.2858285, -0.2113109, -2.642869, 1, 1, 1, 1, 1,
-0.2791492, 0.08453941, -2.678251, 1, 1, 1, 1, 1,
-0.2775406, 0.4122953, -1.711976, 1, 1, 1, 1, 1,
-0.272508, 1.514569, -0.001097591, 1, 1, 1, 1, 1,
-0.2714256, 1.266793, 1.66129, 1, 1, 1, 1, 1,
-0.2686729, -0.4466115, -2.797278, 1, 1, 1, 1, 1,
-0.2642044, 0.1440763, -2.724147, 0, 0, 1, 1, 1,
-0.2512251, -2.242825, -1.821762, 1, 0, 0, 1, 1,
-0.2507043, -0.1925872, -2.407043, 1, 0, 0, 1, 1,
-0.2501563, 0.6991622, -1.106401, 1, 0, 0, 1, 1,
-0.2496095, 1.236252, -0.3263426, 1, 0, 0, 1, 1,
-0.2484539, -0.7053581, -3.880251, 1, 0, 0, 1, 1,
-0.2476704, 0.322962, 0.6691682, 0, 0, 0, 1, 1,
-0.2395448, 0.01959747, -1.819635, 0, 0, 0, 1, 1,
-0.2311277, 0.2765509, -0.6603677, 0, 0, 0, 1, 1,
-0.2268707, 1.157063, -1.139698, 0, 0, 0, 1, 1,
-0.2264436, -0.2444251, -3.189663, 0, 0, 0, 1, 1,
-0.2240641, -0.4237694, -2.024433, 0, 0, 0, 1, 1,
-0.2226856, 0.5971048, 0.302779, 0, 0, 0, 1, 1,
-0.2226015, -1.317354, -2.622029, 1, 1, 1, 1, 1,
-0.2208098, -0.674699, -3.253234, 1, 1, 1, 1, 1,
-0.2152781, -0.5554706, -2.492747, 1, 1, 1, 1, 1,
-0.2150049, 0.7794092, 0.7492415, 1, 1, 1, 1, 1,
-0.2112294, 0.1036029, -0.8364196, 1, 1, 1, 1, 1,
-0.2024082, 1.212558, 1.224694, 1, 1, 1, 1, 1,
-0.1987493, -1.365027, -2.680437, 1, 1, 1, 1, 1,
-0.1960805, -0.1678419, -1.968012, 1, 1, 1, 1, 1,
-0.1922907, 0.1790008, -0.7436587, 1, 1, 1, 1, 1,
-0.1920888, -1.36544, -2.833303, 1, 1, 1, 1, 1,
-0.182615, -0.1069906, -1.555487, 1, 1, 1, 1, 1,
-0.1808302, -0.7101743, -3.871557, 1, 1, 1, 1, 1,
-0.17715, 1.305881, 0.6101032, 1, 1, 1, 1, 1,
-0.1751842, 0.9797341, 0.09438987, 1, 1, 1, 1, 1,
-0.1690103, -0.05192849, -1.946303, 1, 1, 1, 1, 1,
-0.1671035, -0.650259, -2.546953, 0, 0, 1, 1, 1,
-0.1645101, -0.4382214, -3.496466, 1, 0, 0, 1, 1,
-0.1545, 1.649188, -1.101378, 1, 0, 0, 1, 1,
-0.151683, 1.635381, 0.8198345, 1, 0, 0, 1, 1,
-0.1507577, -1.577044, -3.890215, 1, 0, 0, 1, 1,
-0.1472435, -0.1654641, -3.852714, 1, 0, 0, 1, 1,
-0.1471634, 1.04566, -0.9088527, 0, 0, 0, 1, 1,
-0.1452933, 0.6398172, -0.8890198, 0, 0, 0, 1, 1,
-0.1450913, 0.7501857, 0.5888778, 0, 0, 0, 1, 1,
-0.1447421, 0.8539231, 1.301663, 0, 0, 0, 1, 1,
-0.1439634, -1.112539, -2.944543, 0, 0, 0, 1, 1,
-0.1404826, -0.2067041, -3.220231, 0, 0, 0, 1, 1,
-0.1394941, 1.047904, 0.620761, 0, 0, 0, 1, 1,
-0.1366912, -0.5126722, -3.984704, 1, 1, 1, 1, 1,
-0.1330999, -3.166084, -1.18824, 1, 1, 1, 1, 1,
-0.1284891, 0.702401, 0.6114457, 1, 1, 1, 1, 1,
-0.1276671, 0.3726682, 0.005304379, 1, 1, 1, 1, 1,
-0.125139, -0.7183028, -2.903087, 1, 1, 1, 1, 1,
-0.1249366, -0.7405946, -3.055716, 1, 1, 1, 1, 1,
-0.1192211, 0.9878771, -0.2423217, 1, 1, 1, 1, 1,
-0.1168895, -1.217839, -3.539179, 1, 1, 1, 1, 1,
-0.1122876, 0.8483618, -0.6073366, 1, 1, 1, 1, 1,
-0.1107072, -0.7839032, -4.037063, 1, 1, 1, 1, 1,
-0.1091754, -0.8111069, -3.727113, 1, 1, 1, 1, 1,
-0.1065232, -0.3803275, -5.30674, 1, 1, 1, 1, 1,
-0.1059726, -1.024058, -3.783202, 1, 1, 1, 1, 1,
-0.1033383, 0.6861317, -0.6651496, 1, 1, 1, 1, 1,
-0.1011233, -1.301849, -3.281934, 1, 1, 1, 1, 1,
-0.09464963, 0.2817238, -0.118807, 0, 0, 1, 1, 1,
-0.09213179, -0.3107704, -3.274493, 1, 0, 0, 1, 1,
-0.09126306, 0.1791207, -0.5977438, 1, 0, 0, 1, 1,
-0.08898608, -1.10342, -3.147265, 1, 0, 0, 1, 1,
-0.08691408, 0.851854, 0.09146492, 1, 0, 0, 1, 1,
-0.08635729, -0.7174171, -3.001584, 1, 0, 0, 1, 1,
-0.08479846, -1.692349, -3.514168, 0, 0, 0, 1, 1,
-0.08106629, 0.569216, -0.5437883, 0, 0, 0, 1, 1,
-0.08071163, 0.03687062, -2.208486, 0, 0, 0, 1, 1,
-0.08040427, -0.608908, -3.09466, 0, 0, 0, 1, 1,
-0.07905172, 0.5165496, -0.1206427, 0, 0, 0, 1, 1,
-0.0761658, -0.04155322, -1.511477, 0, 0, 0, 1, 1,
-0.07279406, 1.837423, 0.3635803, 0, 0, 0, 1, 1,
-0.07129676, 1.929068, -1.225791, 1, 1, 1, 1, 1,
-0.06653744, -0.5279266, -0.8328875, 1, 1, 1, 1, 1,
-0.06419382, 0.3612434, -1.48626, 1, 1, 1, 1, 1,
-0.0567581, 0.7306422, 1.192859, 1, 1, 1, 1, 1,
-0.05556608, 0.6937427, -0.3529936, 1, 1, 1, 1, 1,
-0.05534508, -0.2929849, -1.328455, 1, 1, 1, 1, 1,
-0.05378107, -0.03452109, -2.715114, 1, 1, 1, 1, 1,
-0.05259713, -0.05164194, 0.7948275, 1, 1, 1, 1, 1,
-0.04445899, -2.122283, -2.878615, 1, 1, 1, 1, 1,
-0.04312455, 0.6201388, 1.60544, 1, 1, 1, 1, 1,
-0.0427084, -0.6927684, -2.431261, 1, 1, 1, 1, 1,
-0.04263635, 0.2625791, -0.3825203, 1, 1, 1, 1, 1,
-0.03967795, -0.07992749, -2.413572, 1, 1, 1, 1, 1,
-0.03724347, 0.4419526, -0.3777179, 1, 1, 1, 1, 1,
-0.03618316, -0.4975775, -2.996249, 1, 1, 1, 1, 1,
-0.03237442, 1.489875, -0.4041905, 0, 0, 1, 1, 1,
-0.03129344, -1.497583, -3.315471, 1, 0, 0, 1, 1,
-0.02956408, 0.5029957, 0.6525074, 1, 0, 0, 1, 1,
-0.0270651, 2.982481, 0.2244419, 1, 0, 0, 1, 1,
-0.02273812, -1.619063, -4.395009, 1, 0, 0, 1, 1,
-0.02202735, -0.7291049, -1.739215, 1, 0, 0, 1, 1,
-0.02169768, 1.875938, -2.751237, 0, 0, 0, 1, 1,
-0.01134668, 0.3198911, -0.753499, 0, 0, 0, 1, 1,
-0.007732536, 2.527106, 0.9560735, 0, 0, 0, 1, 1,
-0.007122131, 0.3389172, 0.3158025, 0, 0, 0, 1, 1,
-0.003348744, 0.1390404, -0.2602855, 0, 0, 0, 1, 1,
-0.0008571649, -0.5409705, -3.665927, 0, 0, 0, 1, 1,
0.005796807, 1.66241, -1.3236, 0, 0, 0, 1, 1,
0.007521765, 0.1820491, -1.249176, 1, 1, 1, 1, 1,
0.007692297, -1.430171, 1.619877, 1, 1, 1, 1, 1,
0.01085512, 1.307319, -0.8989229, 1, 1, 1, 1, 1,
0.01242941, 0.6032032, -0.9355209, 1, 1, 1, 1, 1,
0.01316483, 0.4211985, -0.8853191, 1, 1, 1, 1, 1,
0.01387798, -0.6902763, 1.717923, 1, 1, 1, 1, 1,
0.01858113, -0.03794298, 1.656387, 1, 1, 1, 1, 1,
0.02742141, 0.8019013, -0.2234389, 1, 1, 1, 1, 1,
0.02856939, -2.245475, 3.74477, 1, 1, 1, 1, 1,
0.02873084, 0.8003188, 0.8084905, 1, 1, 1, 1, 1,
0.03303271, -0.5856313, 4.043643, 1, 1, 1, 1, 1,
0.03485827, -0.3079922, 3.274994, 1, 1, 1, 1, 1,
0.03543851, 1.037874, -0.7288979, 1, 1, 1, 1, 1,
0.03770059, -1.031069, 4.05684, 1, 1, 1, 1, 1,
0.03773395, -0.8643722, 2.679542, 1, 1, 1, 1, 1,
0.04055047, 1.158612, -1.498401, 0, 0, 1, 1, 1,
0.04233329, 1.239568, -2.364948, 1, 0, 0, 1, 1,
0.04383014, 0.08439712, -0.0425943, 1, 0, 0, 1, 1,
0.04441077, -0.8395745, 2.606941, 1, 0, 0, 1, 1,
0.04465939, 0.4987115, 2.604419, 1, 0, 0, 1, 1,
0.05369602, 0.814555, 0.9891286, 1, 0, 0, 1, 1,
0.05484894, 0.2008918, 1.538685, 0, 0, 0, 1, 1,
0.05951665, -0.5765127, 3.174314, 0, 0, 0, 1, 1,
0.06361151, 1.221227, -0.5147543, 0, 0, 0, 1, 1,
0.06500278, 0.920235, 2.35252, 0, 0, 0, 1, 1,
0.06737762, -0.09782124, 2.666684, 0, 0, 0, 1, 1,
0.06771684, 1.244862, -0.3355957, 0, 0, 0, 1, 1,
0.07144204, -0.5421889, 4.098347, 0, 0, 0, 1, 1,
0.07185198, 0.3842691, 1.624561, 1, 1, 1, 1, 1,
0.07416531, -0.8146849, 3.01015, 1, 1, 1, 1, 1,
0.07642764, 0.3757914, -2.030988, 1, 1, 1, 1, 1,
0.08848824, -0.115524, 4.238568, 1, 1, 1, 1, 1,
0.08889676, 0.9933687, -0.8609481, 1, 1, 1, 1, 1,
0.09060704, 0.2796344, -0.1695137, 1, 1, 1, 1, 1,
0.1022369, -0.6612542, 4.198516, 1, 1, 1, 1, 1,
0.1058194, -0.3198641, 2.208844, 1, 1, 1, 1, 1,
0.1062089, 0.707703, 1.410089, 1, 1, 1, 1, 1,
0.1139963, -1.672648, 4.070677, 1, 1, 1, 1, 1,
0.1143278, -0.4892793, 2.617232, 1, 1, 1, 1, 1,
0.1145686, 0.6708912, -1.014328, 1, 1, 1, 1, 1,
0.1214013, 0.06957463, 2.479906, 1, 1, 1, 1, 1,
0.1219021, 0.5717682, 1.014561, 1, 1, 1, 1, 1,
0.1235213, 0.597856, 0.2283329, 1, 1, 1, 1, 1,
0.1278121, -0.04502142, 1.632571, 0, 0, 1, 1, 1,
0.1306202, 0.5952047, 1.874711, 1, 0, 0, 1, 1,
0.1326763, 0.4280926, -0.3591174, 1, 0, 0, 1, 1,
0.1329634, -1.412205, 3.583364, 1, 0, 0, 1, 1,
0.1336413, -1.156276, 2.386378, 1, 0, 0, 1, 1,
0.1432659, -0.08030123, 2.167074, 1, 0, 0, 1, 1,
0.1497716, 1.799513, 2.097548, 0, 0, 0, 1, 1,
0.1502443, 0.1775727, 1.617056, 0, 0, 0, 1, 1,
0.1517362, 1.771261, 0.2389619, 0, 0, 0, 1, 1,
0.1538944, -1.315154, 3.755458, 0, 0, 0, 1, 1,
0.1587464, 0.300272, 1.065994, 0, 0, 0, 1, 1,
0.1603005, -1.277179, 2.495781, 0, 0, 0, 1, 1,
0.1613427, 1.181392, 0.1157029, 0, 0, 0, 1, 1,
0.1615592, -2.133489, 2.824123, 1, 1, 1, 1, 1,
0.1638332, 0.05699618, 2.196394, 1, 1, 1, 1, 1,
0.1666922, 0.7789322, -0.4544706, 1, 1, 1, 1, 1,
0.1745758, -2.333451, 3.856093, 1, 1, 1, 1, 1,
0.175588, 0.268404, 1.234857, 1, 1, 1, 1, 1,
0.1791162, 0.7749754, 0.9208276, 1, 1, 1, 1, 1,
0.1797376, 0.5154595, -0.4462312, 1, 1, 1, 1, 1,
0.1805043, 0.02691922, 1.145551, 1, 1, 1, 1, 1,
0.1846133, -1.674844, 3.119617, 1, 1, 1, 1, 1,
0.1865037, -1.638363, 5.960925, 1, 1, 1, 1, 1,
0.1891442, 0.2304728, 0.9824748, 1, 1, 1, 1, 1,
0.19221, 0.7624353, -0.9588291, 1, 1, 1, 1, 1,
0.1933964, -0.5432832, 3.745729, 1, 1, 1, 1, 1,
0.1994768, 0.7301489, 0.06643702, 1, 1, 1, 1, 1,
0.2076146, 1.612855, 0.5506704, 1, 1, 1, 1, 1,
0.2112656, -1.170645, 1.188195, 0, 0, 1, 1, 1,
0.2156312, 1.520708, 1.316551, 1, 0, 0, 1, 1,
0.2160598, -1.732626, 3.967536, 1, 0, 0, 1, 1,
0.2176373, 0.5620729, 0.08882885, 1, 0, 0, 1, 1,
0.2195065, 1.642989, 0.5906997, 1, 0, 0, 1, 1,
0.2216617, -0.5109689, 3.871204, 1, 0, 0, 1, 1,
0.2229927, 0.4611341, 0.1395417, 0, 0, 0, 1, 1,
0.2271142, -0.4052595, 0.5884061, 0, 0, 0, 1, 1,
0.2273178, 1.565963, -0.05832419, 0, 0, 0, 1, 1,
0.2311052, -1.460219, 4.22229, 0, 0, 0, 1, 1,
0.2364162, -0.2542211, 1.010846, 0, 0, 0, 1, 1,
0.2376483, 1.572827, 0.7134851, 0, 0, 0, 1, 1,
0.2407404, 0.5857397, 1.122605, 0, 0, 0, 1, 1,
0.2499961, 0.8837478, 1.337463, 1, 1, 1, 1, 1,
0.25214, 1.464456, 0.7742692, 1, 1, 1, 1, 1,
0.2523367, -0.8793057, 1.65489, 1, 1, 1, 1, 1,
0.256618, 0.2681828, 2.1681, 1, 1, 1, 1, 1,
0.2618992, 0.6278899, 0.8782898, 1, 1, 1, 1, 1,
0.2624621, -0.1345867, 0.1186465, 1, 1, 1, 1, 1,
0.2625999, 1.356354, 0.8195237, 1, 1, 1, 1, 1,
0.2660959, 1.693033, 1.423856, 1, 1, 1, 1, 1,
0.2672496, 0.3697729, 0.1541274, 1, 1, 1, 1, 1,
0.2698249, 0.1872424, 1.727583, 1, 1, 1, 1, 1,
0.2757438, 0.3002813, 0.1312488, 1, 1, 1, 1, 1,
0.275845, 1.509507, -1.105079, 1, 1, 1, 1, 1,
0.2785708, -0.06410816, 1.953747, 1, 1, 1, 1, 1,
0.2804118, 0.8038473, 0.02271236, 1, 1, 1, 1, 1,
0.2819938, -1.373436, 2.826358, 1, 1, 1, 1, 1,
0.2876604, -0.3762887, 5.106261, 0, 0, 1, 1, 1,
0.2891078, 1.03032, 0.6866022, 1, 0, 0, 1, 1,
0.2935019, -1.377335, 4.037571, 1, 0, 0, 1, 1,
0.2962008, -1.04203, 3.472858, 1, 0, 0, 1, 1,
0.299381, -1.113518, 3.546501, 1, 0, 0, 1, 1,
0.3049706, -2.061751, 3.319097, 1, 0, 0, 1, 1,
0.3065, -1.047755, 3.098173, 0, 0, 0, 1, 1,
0.3067278, -0.1066551, 2.301707, 0, 0, 0, 1, 1,
0.3118009, -0.9878218, 1.435101, 0, 0, 0, 1, 1,
0.3137021, 0.431919, 0.5125999, 0, 0, 0, 1, 1,
0.3143736, 0.4148916, -0.5214886, 0, 0, 0, 1, 1,
0.3198635, 0.6639093, 1.083659, 0, 0, 0, 1, 1,
0.3218032, 0.2023033, 0.4578258, 0, 0, 0, 1, 1,
0.323127, -1.578152, 1.823175, 1, 1, 1, 1, 1,
0.3291409, 1.234674, 0.4329039, 1, 1, 1, 1, 1,
0.3299533, -0.3288979, 4.523571, 1, 1, 1, 1, 1,
0.3350061, 0.2115371, 0.9751869, 1, 1, 1, 1, 1,
0.3360448, 0.7245337, 0.4681944, 1, 1, 1, 1, 1,
0.3376665, 0.5632086, 0.4050999, 1, 1, 1, 1, 1,
0.3403407, 0.316247, 1.544789, 1, 1, 1, 1, 1,
0.3405567, 1.222118, 1.532068, 1, 1, 1, 1, 1,
0.3434951, -1.563657, 2.872402, 1, 1, 1, 1, 1,
0.3459682, -1.060592, 2.85895, 1, 1, 1, 1, 1,
0.3494947, 3.451253, -0.2527224, 1, 1, 1, 1, 1,
0.3502671, -0.3369404, 3.102407, 1, 1, 1, 1, 1,
0.3504468, 1.443974, -0.107306, 1, 1, 1, 1, 1,
0.3523905, 1.856957, -0.1114781, 1, 1, 1, 1, 1,
0.354035, -0.2245393, 1.455642, 1, 1, 1, 1, 1,
0.3546179, -0.2608176, 1.56393, 0, 0, 1, 1, 1,
0.3575297, -0.2937308, 0.9205727, 1, 0, 0, 1, 1,
0.3607107, -1.76487, 2.513523, 1, 0, 0, 1, 1,
0.3611222, 0.505971, 1.636312, 1, 0, 0, 1, 1,
0.3624846, -0.6506786, 0.9595394, 1, 0, 0, 1, 1,
0.3629801, -0.3758339, 1.910234, 1, 0, 0, 1, 1,
0.3685468, -0.9047787, 3.062431, 0, 0, 0, 1, 1,
0.3924164, 0.5758974, 1.236265, 0, 0, 0, 1, 1,
0.39278, 0.11567, 0.9348801, 0, 0, 0, 1, 1,
0.3953986, -0.2998644, 2.366401, 0, 0, 0, 1, 1,
0.3958779, -0.270503, 2.301556, 0, 0, 0, 1, 1,
0.3984835, 2.125404, 1.434205, 0, 0, 0, 1, 1,
0.4002831, 0.6053354, -1.200518, 0, 0, 0, 1, 1,
0.4058612, 1.593413, -1.452042, 1, 1, 1, 1, 1,
0.4106008, 1.481594, 1.327638, 1, 1, 1, 1, 1,
0.4126249, 0.6948795, 1.607264, 1, 1, 1, 1, 1,
0.4152399, -1.04492, 4.596838, 1, 1, 1, 1, 1,
0.4152667, 0.6556807, 0.7930179, 1, 1, 1, 1, 1,
0.4177337, 0.6527007, 1.407663, 1, 1, 1, 1, 1,
0.4204086, 0.4221624, 0.9115974, 1, 1, 1, 1, 1,
0.4215489, 1.773411, -0.05345405, 1, 1, 1, 1, 1,
0.4223492, -2.102047, 4.559759, 1, 1, 1, 1, 1,
0.4226751, -0.3410943, 3.866123, 1, 1, 1, 1, 1,
0.4235727, -0.4342338, 3.124336, 1, 1, 1, 1, 1,
0.4256253, 1.499167, -0.2217328, 1, 1, 1, 1, 1,
0.4282396, 0.3421471, 1.719011, 1, 1, 1, 1, 1,
0.4307708, -1.89182, 1.846249, 1, 1, 1, 1, 1,
0.4320299, -0.1600675, 1.445103, 1, 1, 1, 1, 1,
0.4347185, -0.1700551, 1.828526, 0, 0, 1, 1, 1,
0.4369531, 1.071551, 1.324948, 1, 0, 0, 1, 1,
0.4370187, -0.9133654, 4.195665, 1, 0, 0, 1, 1,
0.4371873, 0.03880318, 2.567463, 1, 0, 0, 1, 1,
0.4382572, -1.130816, 2.805858, 1, 0, 0, 1, 1,
0.4384675, 0.2346231, 0.7832841, 1, 0, 0, 1, 1,
0.444722, 0.1100456, 2.075396, 0, 0, 0, 1, 1,
0.4466325, -0.8528083, 3.576317, 0, 0, 0, 1, 1,
0.4468087, -0.2805066, 3.045946, 0, 0, 0, 1, 1,
0.4471821, 1.008304, 1.199098, 0, 0, 0, 1, 1,
0.4510206, 1.69251, 0.3099459, 0, 0, 0, 1, 1,
0.4514773, 2.540431, 1.253168, 0, 0, 0, 1, 1,
0.4551282, -1.032362, 3.189829, 0, 0, 0, 1, 1,
0.4559306, 1.593643, 1.081673, 1, 1, 1, 1, 1,
0.4587741, -0.1138279, 1.404319, 1, 1, 1, 1, 1,
0.458877, 0.9855731, 3.05163, 1, 1, 1, 1, 1,
0.4648793, -1.935987, 2.926234, 1, 1, 1, 1, 1,
0.4676371, -0.6480156, 2.697404, 1, 1, 1, 1, 1,
0.4680546, 1.446575, 0.303473, 1, 1, 1, 1, 1,
0.4688154, 0.4306085, 0.529886, 1, 1, 1, 1, 1,
0.4710569, 1.255545, 0.7285472, 1, 1, 1, 1, 1,
0.4728047, 0.03571152, 0.7486324, 1, 1, 1, 1, 1,
0.4730472, 1.493349, 0.6844463, 1, 1, 1, 1, 1,
0.476238, -0.8331636, 2.20218, 1, 1, 1, 1, 1,
0.4816478, 0.8944919, 0.6374931, 1, 1, 1, 1, 1,
0.4879372, -0.02689732, 2.308778, 1, 1, 1, 1, 1,
0.4893516, 2.507272, -0.190544, 1, 1, 1, 1, 1,
0.4925314, 0.5091581, 1.4287, 1, 1, 1, 1, 1,
0.5001462, 0.5791246, -0.8955495, 0, 0, 1, 1, 1,
0.5032503, 0.6564613, -0.6241488, 1, 0, 0, 1, 1,
0.5043816, 0.4183293, 1.774008, 1, 0, 0, 1, 1,
0.5049104, 0.002826445, 2.143461, 1, 0, 0, 1, 1,
0.5102702, -1.672634, 2.43868, 1, 0, 0, 1, 1,
0.5216015, 0.9841729, -0.4306726, 1, 0, 0, 1, 1,
0.5228939, -0.5932888, 3.637839, 0, 0, 0, 1, 1,
0.5232958, -0.8509142, 4.205744, 0, 0, 0, 1, 1,
0.5241117, 0.8347067, 1.820424, 0, 0, 0, 1, 1,
0.5276883, 0.6831224, 1.060956, 0, 0, 0, 1, 1,
0.5304317, 0.5824248, -0.6376514, 0, 0, 0, 1, 1,
0.5357631, 0.4478349, 1.109163, 0, 0, 0, 1, 1,
0.5360838, -0.6806602, 1.35883, 0, 0, 0, 1, 1,
0.5380577, -0.2213974, 1.638058, 1, 1, 1, 1, 1,
0.5423224, 1.39911, 0.9637889, 1, 1, 1, 1, 1,
0.5439035, 0.3157223, 1.436418, 1, 1, 1, 1, 1,
0.5468888, 2.158695, -0.4801082, 1, 1, 1, 1, 1,
0.5478621, -0.2658604, -0.1353114, 1, 1, 1, 1, 1,
0.5519387, 0.6188499, 0.7208964, 1, 1, 1, 1, 1,
0.5519502, 0.2412563, 0.8225302, 1, 1, 1, 1, 1,
0.5690559, -0.0584165, 1.743876, 1, 1, 1, 1, 1,
0.5703431, 2.395014, 1.10623, 1, 1, 1, 1, 1,
0.5774651, 1.69374, 0.6712042, 1, 1, 1, 1, 1,
0.5803005, 1.080068, -0.2400312, 1, 1, 1, 1, 1,
0.5813718, -1.158984, 3.471707, 1, 1, 1, 1, 1,
0.5830223, 0.7964823, 0.2676697, 1, 1, 1, 1, 1,
0.5843082, 0.1862799, 1.812326, 1, 1, 1, 1, 1,
0.585638, -0.5530884, 1.894103, 1, 1, 1, 1, 1,
0.5858837, -1.947034, 3.700997, 0, 0, 1, 1, 1,
0.5865058, -0.4013833, 0.8831729, 1, 0, 0, 1, 1,
0.5887376, 0.2953755, 0.9191479, 1, 0, 0, 1, 1,
0.5905603, 1.771599, 0.873724, 1, 0, 0, 1, 1,
0.5917833, -0.7934747, 2.372002, 1, 0, 0, 1, 1,
0.5964909, 0.4374088, -0.5775557, 1, 0, 0, 1, 1,
0.5967021, -1.366977, 2.452874, 0, 0, 0, 1, 1,
0.5980076, -0.724562, 3.146041, 0, 0, 0, 1, 1,
0.5991476, 0.3472123, 0.752674, 0, 0, 0, 1, 1,
0.6000674, -0.6815992, 1.351572, 0, 0, 0, 1, 1,
0.6035898, 1.253859, 1.605903, 0, 0, 0, 1, 1,
0.6048277, 0.6089324, 2.286111, 0, 0, 0, 1, 1,
0.6067436, -0.9030163, 1.000671, 0, 0, 0, 1, 1,
0.6105791, -0.7192142, 1.410761, 1, 1, 1, 1, 1,
0.6123343, -0.9471743, 1.251723, 1, 1, 1, 1, 1,
0.6229659, 0.9832306, 1.206013, 1, 1, 1, 1, 1,
0.6271994, -1.128771, 2.285279, 1, 1, 1, 1, 1,
0.6317934, 0.9434524, 0.4259349, 1, 1, 1, 1, 1,
0.6354243, -0.363935, 0.8269386, 1, 1, 1, 1, 1,
0.6407983, -0.2078026, 1.406031, 1, 1, 1, 1, 1,
0.6536185, -1.538516, 3.462384, 1, 1, 1, 1, 1,
0.6544539, 0.9135054, 0.893583, 1, 1, 1, 1, 1,
0.6553823, 0.5277535, 0.8010547, 1, 1, 1, 1, 1,
0.6622543, -1.470395, 2.694219, 1, 1, 1, 1, 1,
0.6633885, -0.8306808, 1.993004, 1, 1, 1, 1, 1,
0.6643895, 0.3983887, 0.7758284, 1, 1, 1, 1, 1,
0.6685132, 1.303103, 0.7610477, 1, 1, 1, 1, 1,
0.6685672, -0.678517, 2.282044, 1, 1, 1, 1, 1,
0.6748476, -1.43533, 3.810061, 0, 0, 1, 1, 1,
0.6808816, -2.311802, 3.494564, 1, 0, 0, 1, 1,
0.6841774, -0.1814219, 2.419497, 1, 0, 0, 1, 1,
0.6909248, -0.4458579, 2.669536, 1, 0, 0, 1, 1,
0.6928222, -0.8484405, 2.499395, 1, 0, 0, 1, 1,
0.6933396, -1.498975, 1.927271, 1, 0, 0, 1, 1,
0.6974721, 0.4409002, 2.619295, 0, 0, 0, 1, 1,
0.7019141, 1.202258, 1.983873, 0, 0, 0, 1, 1,
0.7080254, -0.2508712, 2.450089, 0, 0, 0, 1, 1,
0.7103418, -1.312246, 1.593328, 0, 0, 0, 1, 1,
0.7110236, 1.148367, 1.322404, 0, 0, 0, 1, 1,
0.7158045, 0.7469634, 0.729927, 0, 0, 0, 1, 1,
0.7274442, 0.8997124, 0.2549645, 0, 0, 0, 1, 1,
0.7293597, -0.2208663, 1.150879, 1, 1, 1, 1, 1,
0.7352391, -2.071925, 2.214627, 1, 1, 1, 1, 1,
0.741603, 1.898542, -1.441192, 1, 1, 1, 1, 1,
0.7424873, 0.2244328, 0.8942357, 1, 1, 1, 1, 1,
0.7451964, 0.1242415, 3.391066, 1, 1, 1, 1, 1,
0.7513141, -0.01422061, 0.1800103, 1, 1, 1, 1, 1,
0.7521806, -0.8066485, 2.757388, 1, 1, 1, 1, 1,
0.75239, -0.2383284, 0.03032376, 1, 1, 1, 1, 1,
0.7525057, 0.8440949, 0.09944778, 1, 1, 1, 1, 1,
0.7545143, -1.18621, 3.425562, 1, 1, 1, 1, 1,
0.757388, 2.689986, -0.2071269, 1, 1, 1, 1, 1,
0.7579783, 1.629564, 1.84931, 1, 1, 1, 1, 1,
0.7615799, 1.081597, 0.4469405, 1, 1, 1, 1, 1,
0.7643646, -0.683715, 3.251103, 1, 1, 1, 1, 1,
0.7718445, -1.550241, 2.752244, 1, 1, 1, 1, 1,
0.7761965, -0.4918834, 1.968941, 0, 0, 1, 1, 1,
0.7779225, 0.4574856, 2.355249, 1, 0, 0, 1, 1,
0.7795976, -1.907922, 3.339875, 1, 0, 0, 1, 1,
0.7863125, -1.385796, 3.399276, 1, 0, 0, 1, 1,
0.7886008, -1.020363, 1.498351, 1, 0, 0, 1, 1,
0.7921252, -2.079155, 3.397073, 1, 0, 0, 1, 1,
0.7988148, 0.3223664, 0.9539546, 0, 0, 0, 1, 1,
0.8013028, 0.5572447, 0.591873, 0, 0, 0, 1, 1,
0.8027452, 1.95758, -0.09543713, 0, 0, 0, 1, 1,
0.8062928, 0.450311, 0.6335858, 0, 0, 0, 1, 1,
0.8094076, -2.010942, 4.600663, 0, 0, 0, 1, 1,
0.8138826, 0.9351268, 0.6086826, 0, 0, 0, 1, 1,
0.8157196, -0.577912, 3.004236, 0, 0, 0, 1, 1,
0.8221171, 0.7111736, 2.681665, 1, 1, 1, 1, 1,
0.8234293, -0.2824076, 4.377087, 1, 1, 1, 1, 1,
0.8256924, -0.8378375, 1.107908, 1, 1, 1, 1, 1,
0.829536, -1.301401, 3.542682, 1, 1, 1, 1, 1,
0.8335679, -2.175266, 3.258286, 1, 1, 1, 1, 1,
0.8346363, -0.4298089, 2.675622, 1, 1, 1, 1, 1,
0.8414325, 0.9613147, -0.01213476, 1, 1, 1, 1, 1,
0.842551, 0.3198707, 1.796836, 1, 1, 1, 1, 1,
0.8431457, 0.9040316, 1.828917, 1, 1, 1, 1, 1,
0.8501878, -1.146011, 2.486328, 1, 1, 1, 1, 1,
0.8522481, 1.0988, 0.6171659, 1, 1, 1, 1, 1,
0.8536634, 1.254069, 1.543377, 1, 1, 1, 1, 1,
0.8572887, 0.7583585, -0.8765728, 1, 1, 1, 1, 1,
0.8698111, -0.7911035, 1.128294, 1, 1, 1, 1, 1,
0.8702047, -0.1131296, 1.591306, 1, 1, 1, 1, 1,
0.8740611, -1.716731, 3.824842, 0, 0, 1, 1, 1,
0.8742947, 0.6653907, 0.6711474, 1, 0, 0, 1, 1,
0.8914405, 1.881303, -1.349981, 1, 0, 0, 1, 1,
0.8961846, -0.7770175, 0.9758338, 1, 0, 0, 1, 1,
0.9080653, -0.104436, 3.620103, 1, 0, 0, 1, 1,
0.9085687, 2.061125, 1.142289, 1, 0, 0, 1, 1,
0.9194751, 0.1676021, 1.697025, 0, 0, 0, 1, 1,
0.9213139, 1.111819, 1.823207, 0, 0, 0, 1, 1,
0.9229966, 0.4682682, 1.682961, 0, 0, 0, 1, 1,
0.9340709, 0.9385849, 1.951757, 0, 0, 0, 1, 1,
0.9353187, 0.2871602, 2.867042, 0, 0, 0, 1, 1,
0.9369899, -0.9666228, 2.995156, 0, 0, 0, 1, 1,
0.9421678, 0.4455158, 1.640972, 0, 0, 0, 1, 1,
0.9518139, -2.21533, 3.749661, 1, 1, 1, 1, 1,
0.9536455, -0.4264164, 3.468898, 1, 1, 1, 1, 1,
0.9559705, 1.266215, 0.6748893, 1, 1, 1, 1, 1,
0.9569517, -0.2422034, 0.9100716, 1, 1, 1, 1, 1,
0.9594163, 0.644626, 1.751315, 1, 1, 1, 1, 1,
0.9598131, 0.1217557, 2.109321, 1, 1, 1, 1, 1,
0.9708134, 0.2847543, 0.958943, 1, 1, 1, 1, 1,
0.9816918, 0.06961647, 1.589987, 1, 1, 1, 1, 1,
0.9830719, 0.9319656, 1.411955, 1, 1, 1, 1, 1,
0.9887363, -1.612691, 2.976162, 1, 1, 1, 1, 1,
0.9907281, -0.833223, 0.2822984, 1, 1, 1, 1, 1,
0.9914995, -1.022637, 2.099812, 1, 1, 1, 1, 1,
0.9996428, 0.2031217, 2.850598, 1, 1, 1, 1, 1,
1.000905, -0.5503477, 1.852966, 1, 1, 1, 1, 1,
1.002737, -0.6891224, 1.846795, 1, 1, 1, 1, 1,
1.003808, 0.562018, 0.6501308, 0, 0, 1, 1, 1,
1.005813, 0.7413319, 0.866239, 1, 0, 0, 1, 1,
1.006386, 2.374852, -0.5951453, 1, 0, 0, 1, 1,
1.007062, 0.006062116, 2.587156, 1, 0, 0, 1, 1,
1.008492, -0.8695107, 3.270865, 1, 0, 0, 1, 1,
1.008854, -1.258882, 2.265591, 1, 0, 0, 1, 1,
1.016822, 1.343915, 1.203856, 0, 0, 0, 1, 1,
1.017239, -0.1546048, 1.670452, 0, 0, 0, 1, 1,
1.025214, -0.7042224, 1.344698, 0, 0, 0, 1, 1,
1.025804, 0.1236623, 2.133872, 0, 0, 0, 1, 1,
1.029623, 0.7933484, 0.7414101, 0, 0, 0, 1, 1,
1.030963, -0.2137333, 1.44224, 0, 0, 0, 1, 1,
1.031021, 0.1199072, -1.291454, 0, 0, 0, 1, 1,
1.033599, -1.032056, 3.216063, 1, 1, 1, 1, 1,
1.033897, 0.3034141, 0.6904147, 1, 1, 1, 1, 1,
1.038328, -0.2374662, 2.926613, 1, 1, 1, 1, 1,
1.04173, 0.5532515, 2.02441, 1, 1, 1, 1, 1,
1.046228, 0.1231631, 2.241909, 1, 1, 1, 1, 1,
1.047091, -0.3954379, 0.06775608, 1, 1, 1, 1, 1,
1.047759, 0.4414114, 1.108013, 1, 1, 1, 1, 1,
1.049475, 0.06028802, 1.569353, 1, 1, 1, 1, 1,
1.050632, -0.5881224, 2.952819, 1, 1, 1, 1, 1,
1.060041, 1.533312, 0.7893721, 1, 1, 1, 1, 1,
1.060196, -0.9989125, 2.782411, 1, 1, 1, 1, 1,
1.060988, 0.4290374, 2.105305, 1, 1, 1, 1, 1,
1.063503, -0.9399925, 2.966533, 1, 1, 1, 1, 1,
1.065874, 0.2154614, 0.7759073, 1, 1, 1, 1, 1,
1.068234, 0.3782637, 1.403141, 1, 1, 1, 1, 1,
1.069046, 0.7053281, -0.0001014172, 0, 0, 1, 1, 1,
1.075555, 0.7143719, 0.1052468, 1, 0, 0, 1, 1,
1.079904, 0.07772481, 2.610499, 1, 0, 0, 1, 1,
1.081836, 0.08065841, 3.579734, 1, 0, 0, 1, 1,
1.094695, -2.042819, 3.992992, 1, 0, 0, 1, 1,
1.09509, 0.8560507, 1.89298, 1, 0, 0, 1, 1,
1.100984, 0.8903834, -0.6092557, 0, 0, 0, 1, 1,
1.103312, 2.084179, 2.20143, 0, 0, 0, 1, 1,
1.113238, -0.341345, 2.104494, 0, 0, 0, 1, 1,
1.122789, -1.035876, 1.839953, 0, 0, 0, 1, 1,
1.147574, 0.6002941, 0.44411, 0, 0, 0, 1, 1,
1.148077, -1.19095, 3.580468, 0, 0, 0, 1, 1,
1.148916, -0.02430056, -0.6285248, 0, 0, 0, 1, 1,
1.158527, -0.1382435, 0.956971, 1, 1, 1, 1, 1,
1.159149, -0.3327548, 2.522478, 1, 1, 1, 1, 1,
1.161745, -0.9070066, 4.352486, 1, 1, 1, 1, 1,
1.164995, 0.6113322, -0.08898134, 1, 1, 1, 1, 1,
1.172554, -0.503037, 2.014022, 1, 1, 1, 1, 1,
1.175225, 0.5907112, 2.821994, 1, 1, 1, 1, 1,
1.189029, 0.2314527, 0.6916014, 1, 1, 1, 1, 1,
1.198408, 0.8448817, -0.5571985, 1, 1, 1, 1, 1,
1.202035, -0.885765, 2.858882, 1, 1, 1, 1, 1,
1.203154, -1.191632, 2.215658, 1, 1, 1, 1, 1,
1.203293, -0.8540674, 1.419608, 1, 1, 1, 1, 1,
1.203351, -0.7893576, 2.958131, 1, 1, 1, 1, 1,
1.211974, 0.5135901, 1.495456, 1, 1, 1, 1, 1,
1.220884, 0.2404753, 0.9432327, 1, 1, 1, 1, 1,
1.222224, 1.273307, 0.6538811, 1, 1, 1, 1, 1,
1.23458, -0.7185444, 1.820696, 0, 0, 1, 1, 1,
1.237281, -2.385623, 3.685918, 1, 0, 0, 1, 1,
1.239217, 0.06368573, 2.096225, 1, 0, 0, 1, 1,
1.250304, 0.3313369, 1.766613, 1, 0, 0, 1, 1,
1.25636, -1.002574, 0.8165023, 1, 0, 0, 1, 1,
1.264527, -0.4706014, 2.629158, 1, 0, 0, 1, 1,
1.273762, -1.672627, 1.883809, 0, 0, 0, 1, 1,
1.278195, -1.009007, 1.318893, 0, 0, 0, 1, 1,
1.280093, -1.120139, 4.185352, 0, 0, 0, 1, 1,
1.281362, -1.291749, 2.464702, 0, 0, 0, 1, 1,
1.283111, -0.6261567, 2.19631, 0, 0, 0, 1, 1,
1.291914, -0.837258, 3.113205, 0, 0, 0, 1, 1,
1.292911, -1.754954, 3.802551, 0, 0, 0, 1, 1,
1.296944, 0.9324032, 0.7111074, 1, 1, 1, 1, 1,
1.301996, -1.521343, 1.425889, 1, 1, 1, 1, 1,
1.313922, 0.09568403, 1.894362, 1, 1, 1, 1, 1,
1.320133, 2.095194, 0.2952753, 1, 1, 1, 1, 1,
1.324641, -0.01770524, 0.9912227, 1, 1, 1, 1, 1,
1.326079, 0.1200118, 1.923306, 1, 1, 1, 1, 1,
1.342812, 1.148202, 1.68498, 1, 1, 1, 1, 1,
1.344139, 1.045152, 1.457378, 1, 1, 1, 1, 1,
1.359607, 1.139274, -0.4055184, 1, 1, 1, 1, 1,
1.368292, -1.457556, 1.449982, 1, 1, 1, 1, 1,
1.373637, 0.890677, 1.036161, 1, 1, 1, 1, 1,
1.375029, 0.274074, 1.191875, 1, 1, 1, 1, 1,
1.377075, -1.894299, 2.631323, 1, 1, 1, 1, 1,
1.377685, -0.8787695, 1.461524, 1, 1, 1, 1, 1,
1.387874, 1.102761, 1.472729, 1, 1, 1, 1, 1,
1.406399, -1.023846, 1.751635, 0, 0, 1, 1, 1,
1.416819, 0.5778472, 1.928984, 1, 0, 0, 1, 1,
1.436596, 0.6298423, 2.109061, 1, 0, 0, 1, 1,
1.436887, 1.341094, 1.471906, 1, 0, 0, 1, 1,
1.441723, 2.810782, -0.3704031, 1, 0, 0, 1, 1,
1.450309, 0.862626, 2.037696, 1, 0, 0, 1, 1,
1.467464, -0.8978192, -0.3836361, 0, 0, 0, 1, 1,
1.49664, -1.589381, 2.336857, 0, 0, 0, 1, 1,
1.497329, 0.2497229, 1.074571, 0, 0, 0, 1, 1,
1.503209, 0.8392521, 1.352635, 0, 0, 0, 1, 1,
1.512733, 0.5691597, -0.1082836, 0, 0, 0, 1, 1,
1.516856, 0.5091511, 2.666461, 0, 0, 0, 1, 1,
1.524101, -0.3274969, 1.097628, 0, 0, 0, 1, 1,
1.526227, 0.2676818, -0.5179763, 1, 1, 1, 1, 1,
1.526663, 0.7170441, 1.52757, 1, 1, 1, 1, 1,
1.527551, -0.4693046, 4.437913, 1, 1, 1, 1, 1,
1.541176, -1.256536, 2.728327, 1, 1, 1, 1, 1,
1.570552, 0.8705443, 0.5465567, 1, 1, 1, 1, 1,
1.571086, -1.58436, 1.655272, 1, 1, 1, 1, 1,
1.579091, 0.2458939, 2.117784, 1, 1, 1, 1, 1,
1.589028, 0.4140182, 1.629493, 1, 1, 1, 1, 1,
1.589188, -0.3949466, 1.145301, 1, 1, 1, 1, 1,
1.597721, 0.1971142, 2.562388, 1, 1, 1, 1, 1,
1.601866, 1.383456, 0.4679145, 1, 1, 1, 1, 1,
1.605354, 2.382894, -0.718116, 1, 1, 1, 1, 1,
1.609269, 2.228815, 1.77867, 1, 1, 1, 1, 1,
1.618148, -0.8990097, -0.5094269, 1, 1, 1, 1, 1,
1.624267, -0.8341001, 0.6948763, 1, 1, 1, 1, 1,
1.637019, -0.2541231, 0.7319465, 0, 0, 1, 1, 1,
1.647169, -0.03055589, 1.807149, 1, 0, 0, 1, 1,
1.649864, 0.8005222, 0.3103528, 1, 0, 0, 1, 1,
1.653291, 1.275313, 2.210586, 1, 0, 0, 1, 1,
1.676373, 1.231328, 1.717455, 1, 0, 0, 1, 1,
1.708348, -0.1049156, 1.180173, 1, 0, 0, 1, 1,
1.724769, 0.02128394, 2.342896, 0, 0, 0, 1, 1,
1.72774, -0.769013, 1.417843, 0, 0, 0, 1, 1,
1.736687, -0.5868644, 1.562977, 0, 0, 0, 1, 1,
1.745431, 0.5163152, 0.5619317, 0, 0, 0, 1, 1,
1.74659, -0.1851596, 1.660298, 0, 0, 0, 1, 1,
1.755453, 1.04543, 1.753078, 0, 0, 0, 1, 1,
1.756375, 1.038289, 1.461777, 0, 0, 0, 1, 1,
1.805858, 0.7540212, 0.04973526, 1, 1, 1, 1, 1,
1.825848, 0.8736619, 3.385766, 1, 1, 1, 1, 1,
1.872456, -0.8969777, 1.394595, 1, 1, 1, 1, 1,
1.882458, -0.580393, 1.718025, 1, 1, 1, 1, 1,
1.900733, -0.769603, 1.905254, 1, 1, 1, 1, 1,
1.902417, -0.3815871, 0.9126067, 1, 1, 1, 1, 1,
1.919586, 0.627268, 1.971619, 1, 1, 1, 1, 1,
1.925133, 0.7754111, 2.167967, 1, 1, 1, 1, 1,
1.982407, -0.6310757, 0.6759993, 1, 1, 1, 1, 1,
2.005263, 0.6257902, 2.351601, 1, 1, 1, 1, 1,
2.053428, -1.41268, 1.313309, 1, 1, 1, 1, 1,
2.079517, -1.139133, 1.789911, 1, 1, 1, 1, 1,
2.093265, 1.642606, -0.5654377, 1, 1, 1, 1, 1,
2.112791, -0.1314955, 0.7352784, 1, 1, 1, 1, 1,
2.166367, -1.214494, 2.303427, 1, 1, 1, 1, 1,
2.208145, 0.05186885, 0.6503535, 0, 0, 1, 1, 1,
2.215387, 0.6516701, 0.4518401, 1, 0, 0, 1, 1,
2.230543, -0.3776909, 1.371103, 1, 0, 0, 1, 1,
2.234252, -1.284703, 3.368916, 1, 0, 0, 1, 1,
2.25791, -0.5244234, 2.361821, 1, 0, 0, 1, 1,
2.30755, 0.1719256, 0.4686527, 1, 0, 0, 1, 1,
2.322631, -0.2002443, 0.4032395, 0, 0, 0, 1, 1,
2.323207, 0.4911241, 0.2109311, 0, 0, 0, 1, 1,
2.344457, 0.1994355, 2.296515, 0, 0, 0, 1, 1,
2.357129, 0.5429457, 1.191687, 0, 0, 0, 1, 1,
2.368695, 0.2039046, 2.060429, 0, 0, 0, 1, 1,
2.465793, 0.3161541, 0.07144518, 0, 0, 0, 1, 1,
2.603636, -1.426866, 1.129352, 0, 0, 0, 1, 1,
2.64162, 0.5474862, 0.4796995, 1, 1, 1, 1, 1,
2.742584, -0.8739368, 1.560815, 1, 1, 1, 1, 1,
2.778112, 0.5233297, 1.884167, 1, 1, 1, 1, 1,
2.848191, -2.125486, 2.726909, 1, 1, 1, 1, 1,
2.893055, 0.7715881, -0.02960848, 1, 1, 1, 1, 1,
2.936074, 0.4722216, 2.479138, 1, 1, 1, 1, 1,
3.150261, -0.5283077, 1.646105, 1, 1, 1, 1, 1
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
var radius = 9.789433;
var distance = 34.38497;
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
mvMatrix.translate( -0.07245898, -0.1425846, -0.3270924 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38497);
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
