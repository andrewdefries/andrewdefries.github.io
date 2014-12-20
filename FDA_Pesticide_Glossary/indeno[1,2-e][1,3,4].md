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
-3.133653, 1.945986, -1.802137, 1, 0, 0, 1,
-2.564786, 0.3955023, -1.144747, 1, 0.007843138, 0, 1,
-2.472893, -1.691834, -1.364116, 1, 0.01176471, 0, 1,
-2.465553, 0.5935584, -2.905416, 1, 0.01960784, 0, 1,
-2.399595, -0.03108378, -1.131868, 1, 0.02352941, 0, 1,
-2.366388, -1.70946, -3.814338, 1, 0.03137255, 0, 1,
-2.359237, 0.2456492, -2.550354, 1, 0.03529412, 0, 1,
-2.348908, 1.325092, -2.007046, 1, 0.04313726, 0, 1,
-2.264602, 0.09727232, -3.121171, 1, 0.04705882, 0, 1,
-2.239398, 0.7114313, -1.582857, 1, 0.05490196, 0, 1,
-2.227041, -0.1191714, -1.91127, 1, 0.05882353, 0, 1,
-2.210242, 0.4430116, -1.027488, 1, 0.06666667, 0, 1,
-2.205554, 1.031661, -0.8715784, 1, 0.07058824, 0, 1,
-2.16071, -0.01467117, -1.255019, 1, 0.07843138, 0, 1,
-2.139895, 1.0946, 0.536019, 1, 0.08235294, 0, 1,
-2.12306, -0.1635503, -1.171281, 1, 0.09019608, 0, 1,
-2.061355, 1.471892, 0.08006892, 1, 0.09411765, 0, 1,
-2.025764, -0.9693664, -2.23733, 1, 0.1019608, 0, 1,
-2.01651, -0.8634159, -1.675869, 1, 0.1098039, 0, 1,
-1.99955, -0.4013831, -0.8384123, 1, 0.1137255, 0, 1,
-1.986711, 0.3770486, -2.157113, 1, 0.1215686, 0, 1,
-1.983561, -1.400938, -2.267085, 1, 0.1254902, 0, 1,
-1.930205, 0.5338213, -2.6368, 1, 0.1333333, 0, 1,
-1.902471, -1.560889, -2.167573, 1, 0.1372549, 0, 1,
-1.897747, 1.538201, -2.382578, 1, 0.145098, 0, 1,
-1.869416, 0.7283694, -0.9707232, 1, 0.1490196, 0, 1,
-1.863602, 1.850067, -0.003216494, 1, 0.1568628, 0, 1,
-1.845688, 0.01985118, -2.837476, 1, 0.1607843, 0, 1,
-1.837033, 0.2706011, -1.685023, 1, 0.1686275, 0, 1,
-1.823175, -1.526463, -1.772185, 1, 0.172549, 0, 1,
-1.801853, 1.063623, -3.099322, 1, 0.1803922, 0, 1,
-1.790582, -0.6162626, -1.453854, 1, 0.1843137, 0, 1,
-1.788246, 0.4830647, -0.5805217, 1, 0.1921569, 0, 1,
-1.773482, 0.4654284, -3.483117, 1, 0.1960784, 0, 1,
-1.762009, -0.09580451, -1.168239, 1, 0.2039216, 0, 1,
-1.760208, 1.560294, 1.817412, 1, 0.2117647, 0, 1,
-1.736831, -0.5754471, -1.513618, 1, 0.2156863, 0, 1,
-1.72447, -0.0584843, -1.680966, 1, 0.2235294, 0, 1,
-1.720453, -0.6404269, -0.6443909, 1, 0.227451, 0, 1,
-1.713352, -0.413666, -1.372615, 1, 0.2352941, 0, 1,
-1.697988, -0.6265864, -0.2692074, 1, 0.2392157, 0, 1,
-1.67446, 0.8775895, 0.3854799, 1, 0.2470588, 0, 1,
-1.66936, 0.7549469, -1.237879, 1, 0.2509804, 0, 1,
-1.666726, 0.6545973, 0.1903066, 1, 0.2588235, 0, 1,
-1.661462, -1.14893, -2.026062, 1, 0.2627451, 0, 1,
-1.653735, -0.1834021, -1.333737, 1, 0.2705882, 0, 1,
-1.64335, -1.200633, -1.434967, 1, 0.2745098, 0, 1,
-1.63922, -0.9351923, -3.559788, 1, 0.282353, 0, 1,
-1.617426, -0.6437949, -0.5156824, 1, 0.2862745, 0, 1,
-1.606058, -0.2940534, -1.392346, 1, 0.2941177, 0, 1,
-1.599731, -1.707762, -0.9577219, 1, 0.3019608, 0, 1,
-1.584356, 0.3728558, -0.6301476, 1, 0.3058824, 0, 1,
-1.570886, -1.195591, -3.298153, 1, 0.3137255, 0, 1,
-1.568099, 0.699771, -2.464594, 1, 0.3176471, 0, 1,
-1.559796, 0.8612543, -3.519826, 1, 0.3254902, 0, 1,
-1.545599, -0.01618143, -0.6833149, 1, 0.3294118, 0, 1,
-1.542662, 1.025771, -1.667643, 1, 0.3372549, 0, 1,
-1.540909, 2.091736, -0.6545852, 1, 0.3411765, 0, 1,
-1.531486, -0.9696146, -1.176492, 1, 0.3490196, 0, 1,
-1.529639, -0.4816948, -0.6551643, 1, 0.3529412, 0, 1,
-1.483332, 1.573483, 0.3601626, 1, 0.3607843, 0, 1,
-1.475111, -0.4287596, -2.652587, 1, 0.3647059, 0, 1,
-1.463644, 0.1138851, -2.039819, 1, 0.372549, 0, 1,
-1.463532, 2.853748, -0.80467, 1, 0.3764706, 0, 1,
-1.458393, 1.674367, -2.849051, 1, 0.3843137, 0, 1,
-1.445222, -0.6087503, -1.736157, 1, 0.3882353, 0, 1,
-1.436652, 1.602926, -0.09403235, 1, 0.3960784, 0, 1,
-1.42496, -1.212395, -2.367467, 1, 0.4039216, 0, 1,
-1.424574, -1.030012, -1.610688, 1, 0.4078431, 0, 1,
-1.41609, -0.5560948, -2.000706, 1, 0.4156863, 0, 1,
-1.414411, 0.6104825, -0.7529083, 1, 0.4196078, 0, 1,
-1.405968, -0.0594902, -2.124359, 1, 0.427451, 0, 1,
-1.398799, -0.621286, -3.071822, 1, 0.4313726, 0, 1,
-1.398345, 0.06027299, -1.675793, 1, 0.4392157, 0, 1,
-1.392753, 1.328386, -0.3804361, 1, 0.4431373, 0, 1,
-1.382122, -1.546073, -3.55862, 1, 0.4509804, 0, 1,
-1.368958, -0.9803588, -2.657033, 1, 0.454902, 0, 1,
-1.360576, 0.7742189, -0.6670669, 1, 0.4627451, 0, 1,
-1.358263, 1.11513, 0.2168894, 1, 0.4666667, 0, 1,
-1.353943, 1.183517, -0.8297806, 1, 0.4745098, 0, 1,
-1.345412, -0.2740797, -0.293759, 1, 0.4784314, 0, 1,
-1.344412, -0.962647, -2.261297, 1, 0.4862745, 0, 1,
-1.338241, -0.777231, -2.249381, 1, 0.4901961, 0, 1,
-1.331029, -1.264099, -3.275278, 1, 0.4980392, 0, 1,
-1.32495, -1.415815, -3.095222, 1, 0.5058824, 0, 1,
-1.313841, 0.4058876, -2.996024, 1, 0.509804, 0, 1,
-1.312711, -0.3770573, -1.465744, 1, 0.5176471, 0, 1,
-1.306171, -1.436759, -3.996629, 1, 0.5215687, 0, 1,
-1.292768, -1.217844, -2.996044, 1, 0.5294118, 0, 1,
-1.283581, 1.184111, -1.014191, 1, 0.5333334, 0, 1,
-1.276873, -0.4098851, -2.084678, 1, 0.5411765, 0, 1,
-1.27599, -0.1453449, -1.773657, 1, 0.5450981, 0, 1,
-1.275247, -0.765233, -2.656562, 1, 0.5529412, 0, 1,
-1.270675, -1.375948, -2.000547, 1, 0.5568628, 0, 1,
-1.269852, -0.5778181, -1.190265, 1, 0.5647059, 0, 1,
-1.26222, 0.6563671, -2.314939, 1, 0.5686275, 0, 1,
-1.242769, 0.6626942, -1.835628, 1, 0.5764706, 0, 1,
-1.234107, -0.3429893, -1.899024, 1, 0.5803922, 0, 1,
-1.223994, 1.173143, -0.06925504, 1, 0.5882353, 0, 1,
-1.219809, 1.765939, 0.6091031, 1, 0.5921569, 0, 1,
-1.219365, -1.206618, -2.063731, 1, 0.6, 0, 1,
-1.219172, 0.2795225, -1.981447, 1, 0.6078432, 0, 1,
-1.217814, -0.7053413, -2.989889, 1, 0.6117647, 0, 1,
-1.204435, -1.274912, -4.001204, 1, 0.6196079, 0, 1,
-1.202919, 0.2278977, -1.830839, 1, 0.6235294, 0, 1,
-1.202809, 1.586823, -0.3305673, 1, 0.6313726, 0, 1,
-1.198174, -1.201038, -1.829372, 1, 0.6352941, 0, 1,
-1.197444, -0.8698005, -2.32873, 1, 0.6431373, 0, 1,
-1.197139, 2.94038, -1.317288, 1, 0.6470588, 0, 1,
-1.194425, 0.4995441, -0.6871384, 1, 0.654902, 0, 1,
-1.194192, 2.238523, 0.6147755, 1, 0.6588235, 0, 1,
-1.192048, -0.2439261, -2.493796, 1, 0.6666667, 0, 1,
-1.189315, 1.044163, -0.1886955, 1, 0.6705883, 0, 1,
-1.187373, -0.8046152, -3.445494, 1, 0.6784314, 0, 1,
-1.179192, -0.5308811, -2.073697, 1, 0.682353, 0, 1,
-1.177082, -1.237721, -1.482093, 1, 0.6901961, 0, 1,
-1.170067, -0.01337429, -0.1354033, 1, 0.6941177, 0, 1,
-1.166625, 0.3693049, -1.605439, 1, 0.7019608, 0, 1,
-1.163663, -0.5281471, -1.203387, 1, 0.7098039, 0, 1,
-1.157505, 0.7996145, -1.366228, 1, 0.7137255, 0, 1,
-1.14685, -0.3364559, -2.731585, 1, 0.7215686, 0, 1,
-1.145795, 0.9559323, -1.188015, 1, 0.7254902, 0, 1,
-1.138929, 0.8086843, 0.2322491, 1, 0.7333333, 0, 1,
-1.136608, -0.4780792, -2.232084, 1, 0.7372549, 0, 1,
-1.133513, -1.967985, -1.446871, 1, 0.7450981, 0, 1,
-1.128104, 0.9908529, -0.7354174, 1, 0.7490196, 0, 1,
-1.127835, -0.004109391, -1.495932, 1, 0.7568628, 0, 1,
-1.125223, 1.599745, -1.134439, 1, 0.7607843, 0, 1,
-1.114, 0.3930518, -0.2750212, 1, 0.7686275, 0, 1,
-1.111754, 0.8983008, -1.234236, 1, 0.772549, 0, 1,
-1.101341, -0.1070285, -1.22068, 1, 0.7803922, 0, 1,
-1.100312, 0.2386333, -1.060197, 1, 0.7843137, 0, 1,
-1.100115, -0.04892448, -0.521781, 1, 0.7921569, 0, 1,
-1.094438, 0.2809184, 0.6405339, 1, 0.7960784, 0, 1,
-1.090156, -0.1626537, -3.416719, 1, 0.8039216, 0, 1,
-1.087877, 0.1788774, -2.156065, 1, 0.8117647, 0, 1,
-1.07802, 2.267912, 1.155558, 1, 0.8156863, 0, 1,
-1.077746, -0.4754019, -1.444086, 1, 0.8235294, 0, 1,
-1.077612, -0.2020205, -2.767509, 1, 0.827451, 0, 1,
-1.069981, -1.803087, -3.649528, 1, 0.8352941, 0, 1,
-1.068049, -1.491094, -2.220531, 1, 0.8392157, 0, 1,
-1.067616, -0.1974249, -3.051187, 1, 0.8470588, 0, 1,
-1.064967, -0.01694535, -0.9511253, 1, 0.8509804, 0, 1,
-1.058752, 0.7493848, -1.593643, 1, 0.8588235, 0, 1,
-1.056515, -0.465082, -2.682343, 1, 0.8627451, 0, 1,
-1.052368, -0.0102178, 0.3836695, 1, 0.8705882, 0, 1,
-1.035039, 0.3297053, -1.923551, 1, 0.8745098, 0, 1,
-1.034799, -0.04505194, -1.104844, 1, 0.8823529, 0, 1,
-1.030183, -0.1939976, -1.982412, 1, 0.8862745, 0, 1,
-1.022337, -0.13106, -2.142522, 1, 0.8941177, 0, 1,
-1.019741, 0.3670598, -0.6796232, 1, 0.8980392, 0, 1,
-1.019246, 0.1026922, -0.9953384, 1, 0.9058824, 0, 1,
-1.002467, 0.4078861, 0.07393541, 1, 0.9137255, 0, 1,
-1.002371, -0.7711985, -2.989264, 1, 0.9176471, 0, 1,
-0.993429, -0.2393471, -1.439548, 1, 0.9254902, 0, 1,
-0.9840185, -1.092487, -1.449574, 1, 0.9294118, 0, 1,
-0.9839455, 0.2634019, -1.459705, 1, 0.9372549, 0, 1,
-0.9779078, 0.2571331, -1.216285, 1, 0.9411765, 0, 1,
-0.9686962, 0.8543345, -1.489229, 1, 0.9490196, 0, 1,
-0.9574268, -0.4519251, -2.073728, 1, 0.9529412, 0, 1,
-0.9537451, -0.844162, -2.603405, 1, 0.9607843, 0, 1,
-0.9516845, 1.200116, -3.016353, 1, 0.9647059, 0, 1,
-0.9473736, 0.2604365, -1.734855, 1, 0.972549, 0, 1,
-0.9473385, 0.8112648, 0.8732039, 1, 0.9764706, 0, 1,
-0.9431351, 0.6305537, -2.618117, 1, 0.9843137, 0, 1,
-0.9323168, 2.093221, -0.6623896, 1, 0.9882353, 0, 1,
-0.9316425, -0.2825584, -1.564013, 1, 0.9960784, 0, 1,
-0.9200517, 0.09993553, -2.385841, 0.9960784, 1, 0, 1,
-0.9133861, -1.189373, 0.5950354, 0.9921569, 1, 0, 1,
-0.9132054, -0.5719317, -2.704998, 0.9843137, 1, 0, 1,
-0.9026145, 0.9938022, -0.9255315, 0.9803922, 1, 0, 1,
-0.8920941, -1.691155, -1.907791, 0.972549, 1, 0, 1,
-0.8910162, 0.5786535, -0.715062, 0.9686275, 1, 0, 1,
-0.8832971, 0.2892937, -1.475917, 0.9607843, 1, 0, 1,
-0.8819051, 1.797073, -0.7241006, 0.9568627, 1, 0, 1,
-0.868593, 1.343793, -1.419443, 0.9490196, 1, 0, 1,
-0.8578563, -1.104982, -1.958149, 0.945098, 1, 0, 1,
-0.8561456, 0.08998484, -0.9121654, 0.9372549, 1, 0, 1,
-0.8559324, 0.7010511, -0.7803358, 0.9333333, 1, 0, 1,
-0.8557675, -0.5035222, -2.866488, 0.9254902, 1, 0, 1,
-0.8550829, 0.315795, -1.536018, 0.9215686, 1, 0, 1,
-0.8545986, 0.1691076, -2.538455, 0.9137255, 1, 0, 1,
-0.8532625, 0.6223941, -0.6487072, 0.9098039, 1, 0, 1,
-0.8513507, -0.1452117, -1.682483, 0.9019608, 1, 0, 1,
-0.8504438, -0.761111, -3.033617, 0.8941177, 1, 0, 1,
-0.8500085, -0.04087889, -2.266871, 0.8901961, 1, 0, 1,
-0.8487729, 0.9185311, -1.658013, 0.8823529, 1, 0, 1,
-0.8481569, 1.040133, 0.3892584, 0.8784314, 1, 0, 1,
-0.8445463, -0.1632211, -1.47046, 0.8705882, 1, 0, 1,
-0.8421492, -0.1124136, -2.442789, 0.8666667, 1, 0, 1,
-0.8385872, 0.3198182, -1.877779, 0.8588235, 1, 0, 1,
-0.8341021, -1.289695, -3.590824, 0.854902, 1, 0, 1,
-0.8324327, -0.8918285, -4.093783, 0.8470588, 1, 0, 1,
-0.8273849, 1.012661, -0.1571962, 0.8431373, 1, 0, 1,
-0.8226778, -0.1597213, -0.8951377, 0.8352941, 1, 0, 1,
-0.8204129, 0.06021391, -0.376059, 0.8313726, 1, 0, 1,
-0.8182482, -0.1720947, -2.648886, 0.8235294, 1, 0, 1,
-0.8151437, 0.08921354, -1.681374, 0.8196079, 1, 0, 1,
-0.8151295, -2.699614, -2.449955, 0.8117647, 1, 0, 1,
-0.813756, 1.37336, -0.5986394, 0.8078431, 1, 0, 1,
-0.8090304, 0.4635183, -1.013319, 0.8, 1, 0, 1,
-0.8068352, 0.7622393, 0.05840997, 0.7921569, 1, 0, 1,
-0.8029987, -0.6200007, -1.5726, 0.7882353, 1, 0, 1,
-0.7942361, 0.3214956, -0.408254, 0.7803922, 1, 0, 1,
-0.7924441, -1.935138, -3.812088, 0.7764706, 1, 0, 1,
-0.7922339, 0.6425067, -0.3068558, 0.7686275, 1, 0, 1,
-0.7890133, -2.956728, -2.886011, 0.7647059, 1, 0, 1,
-0.7824031, -0.1794301, -2.434328, 0.7568628, 1, 0, 1,
-0.7793562, -0.2498909, -2.439374, 0.7529412, 1, 0, 1,
-0.7719737, -1.837072, -1.123111, 0.7450981, 1, 0, 1,
-0.7663018, 0.093881, -0.8636646, 0.7411765, 1, 0, 1,
-0.7653406, 0.636076, -0.6757635, 0.7333333, 1, 0, 1,
-0.7648183, -0.2589827, -0.339702, 0.7294118, 1, 0, 1,
-0.7629295, -0.1836022, -1.261662, 0.7215686, 1, 0, 1,
-0.7599289, 0.07614033, -0.7385294, 0.7176471, 1, 0, 1,
-0.7574685, 0.2870982, -1.059078, 0.7098039, 1, 0, 1,
-0.7521361, -0.842768, -0.8006116, 0.7058824, 1, 0, 1,
-0.7513248, 1.220052, -2.462522, 0.6980392, 1, 0, 1,
-0.7508072, -0.7417209, -1.606547, 0.6901961, 1, 0, 1,
-0.7499297, -0.8348292, -2.98041, 0.6862745, 1, 0, 1,
-0.7483751, 0.03201093, -1.273543, 0.6784314, 1, 0, 1,
-0.7473201, -1.556581, -2.517753, 0.6745098, 1, 0, 1,
-0.7359812, -0.5245717, -2.29743, 0.6666667, 1, 0, 1,
-0.7318762, 0.3756869, -1.401392, 0.6627451, 1, 0, 1,
-0.7172234, -0.2891454, -0.3776089, 0.654902, 1, 0, 1,
-0.7160701, -0.08888532, -1.837914, 0.6509804, 1, 0, 1,
-0.7039915, -1.047669, -3.550208, 0.6431373, 1, 0, 1,
-0.7001877, 0.6828092, -1.218738, 0.6392157, 1, 0, 1,
-0.6994339, -1.213389, -3.681246, 0.6313726, 1, 0, 1,
-0.6988038, -0.1909543, -1.199052, 0.627451, 1, 0, 1,
-0.6930134, 0.7925661, -1.955668, 0.6196079, 1, 0, 1,
-0.6925035, -0.4996327, -2.840493, 0.6156863, 1, 0, 1,
-0.6912874, 1.238597, -0.2519895, 0.6078432, 1, 0, 1,
-0.6903148, 1.978374, 1.113193, 0.6039216, 1, 0, 1,
-0.6857852, 0.6252173, -1.224542, 0.5960785, 1, 0, 1,
-0.6817645, 0.6867733, -1.170451, 0.5882353, 1, 0, 1,
-0.6814881, 1.619516, 0.6888583, 0.5843138, 1, 0, 1,
-0.6767216, -0.4786044, -0.3665006, 0.5764706, 1, 0, 1,
-0.6741619, -1.239568, -2.123563, 0.572549, 1, 0, 1,
-0.6704764, 0.6029878, -2.370437, 0.5647059, 1, 0, 1,
-0.6703017, -0.4851209, -1.079835, 0.5607843, 1, 0, 1,
-0.6663559, 1.525888, -0.9055386, 0.5529412, 1, 0, 1,
-0.6653349, -0.3108694, -1.707272, 0.5490196, 1, 0, 1,
-0.6645598, -0.3307011, -2.807681, 0.5411765, 1, 0, 1,
-0.6584294, 0.8276848, -1.531429, 0.5372549, 1, 0, 1,
-0.6582593, 0.8250313, 0.05540106, 0.5294118, 1, 0, 1,
-0.6551888, 0.6190262, -0.07908427, 0.5254902, 1, 0, 1,
-0.6505457, 0.8535158, -2.14009, 0.5176471, 1, 0, 1,
-0.6490965, -1.585773, -2.286353, 0.5137255, 1, 0, 1,
-0.6462327, 1.502689, -0.7747489, 0.5058824, 1, 0, 1,
-0.6452859, 0.05657233, -3.322376, 0.5019608, 1, 0, 1,
-0.6441928, 0.4423483, -1.342669, 0.4941176, 1, 0, 1,
-0.6435281, 0.7136056, -1.060658, 0.4862745, 1, 0, 1,
-0.6344037, 0.3494173, -0.6692391, 0.4823529, 1, 0, 1,
-0.6324173, 0.83891, 0.08363444, 0.4745098, 1, 0, 1,
-0.6221079, 0.4503407, 0.5206788, 0.4705882, 1, 0, 1,
-0.6178032, -0.9043096, -0.6076211, 0.4627451, 1, 0, 1,
-0.6025412, -0.105592, -0.2117585, 0.4588235, 1, 0, 1,
-0.6024984, -0.9754634, -3.196863, 0.4509804, 1, 0, 1,
-0.595403, 1.592553, 1.570427, 0.4470588, 1, 0, 1,
-0.5941469, 0.7821634, -1.243804, 0.4392157, 1, 0, 1,
-0.589959, -0.8036329, -3.04373, 0.4352941, 1, 0, 1,
-0.5879668, -0.3965488, -0.6034119, 0.427451, 1, 0, 1,
-0.587456, 0.4050033, 1.296745, 0.4235294, 1, 0, 1,
-0.5872126, -1.40911, -2.768387, 0.4156863, 1, 0, 1,
-0.5841904, -1.041834, -1.75258, 0.4117647, 1, 0, 1,
-0.5830315, -1.716126, -0.733583, 0.4039216, 1, 0, 1,
-0.582313, -0.8440253, -2.933152, 0.3960784, 1, 0, 1,
-0.5803002, -0.243405, -3.644168, 0.3921569, 1, 0, 1,
-0.5763139, 0.4764053, 0.2864853, 0.3843137, 1, 0, 1,
-0.5742638, -2.356173, -2.260041, 0.3803922, 1, 0, 1,
-0.5719504, -2.329729, -2.676746, 0.372549, 1, 0, 1,
-0.5714552, -2.696503, -4.058265, 0.3686275, 1, 0, 1,
-0.5701234, -1.740941, -3.854293, 0.3607843, 1, 0, 1,
-0.5694966, -2.657036, -3.426525, 0.3568628, 1, 0, 1,
-0.5662384, -0.863953, -3.662195, 0.3490196, 1, 0, 1,
-0.5656812, -1.110089, -4.355991, 0.345098, 1, 0, 1,
-0.5611045, -1.557471, -3.303544, 0.3372549, 1, 0, 1,
-0.5603065, 0.7611498, -0.06259234, 0.3333333, 1, 0, 1,
-0.5577954, -0.8947682, -2.572783, 0.3254902, 1, 0, 1,
-0.551098, -1.651428, -3.455574, 0.3215686, 1, 0, 1,
-0.5500429, 1.459956, -1.784052, 0.3137255, 1, 0, 1,
-0.5471768, 0.2396702, 0.4193815, 0.3098039, 1, 0, 1,
-0.5437456, -0.4039817, 0.270562, 0.3019608, 1, 0, 1,
-0.5419949, 0.08104813, -2.578702, 0.2941177, 1, 0, 1,
-0.5418614, -0.2978701, -1.251748, 0.2901961, 1, 0, 1,
-0.5383118, -1.303183, -2.877072, 0.282353, 1, 0, 1,
-0.5372509, -0.8426554, -0.3508897, 0.2784314, 1, 0, 1,
-0.533617, 1.929183, -1.841294, 0.2705882, 1, 0, 1,
-0.5284239, 0.7278757, -1.116432, 0.2666667, 1, 0, 1,
-0.5240062, 0.7771559, -1.839722, 0.2588235, 1, 0, 1,
-0.5176672, -1.763405, -3.778403, 0.254902, 1, 0, 1,
-0.5173986, 0.9365899, -1.207686, 0.2470588, 1, 0, 1,
-0.5158506, 1.207576, -0.1734603, 0.2431373, 1, 0, 1,
-0.5137985, -2.170267, -2.424266, 0.2352941, 1, 0, 1,
-0.5131608, -0.9961969, -2.902329, 0.2313726, 1, 0, 1,
-0.510065, 0.7974182, -0.4285566, 0.2235294, 1, 0, 1,
-0.5098615, 2.112759, 0.2920532, 0.2196078, 1, 0, 1,
-0.5058267, -0.6677228, -3.476964, 0.2117647, 1, 0, 1,
-0.5054598, -0.9069422, -3.895314, 0.2078431, 1, 0, 1,
-0.5038407, 0.9856533, 0.8731917, 0.2, 1, 0, 1,
-0.4968297, -0.3400285, -1.817358, 0.1921569, 1, 0, 1,
-0.4929438, -1.183802, -1.287448, 0.1882353, 1, 0, 1,
-0.4926138, -1.452984, -2.392449, 0.1803922, 1, 0, 1,
-0.4876339, 0.2986503, -0.844399, 0.1764706, 1, 0, 1,
-0.4834521, -0.06906714, -2.361924, 0.1686275, 1, 0, 1,
-0.4802781, -1.456847, -3.170021, 0.1647059, 1, 0, 1,
-0.4754827, 0.2767219, -0.3754008, 0.1568628, 1, 0, 1,
-0.4745808, 1.230736, 0.5819591, 0.1529412, 1, 0, 1,
-0.4721443, 1.4602, -0.5485956, 0.145098, 1, 0, 1,
-0.4710356, -1.318152, -2.310377, 0.1411765, 1, 0, 1,
-0.4704767, 0.7582911, -1.726268, 0.1333333, 1, 0, 1,
-0.4672438, 0.02007476, -1.242549, 0.1294118, 1, 0, 1,
-0.4658144, 2.086678, -3.053395, 0.1215686, 1, 0, 1,
-0.4629573, 0.0925846, -2.017463, 0.1176471, 1, 0, 1,
-0.4627608, -0.05234808, 0.02988571, 0.1098039, 1, 0, 1,
-0.4586312, -0.4681678, -2.827262, 0.1058824, 1, 0, 1,
-0.4569027, -0.2811403, -0.780146, 0.09803922, 1, 0, 1,
-0.4533626, 0.4928328, -0.3602381, 0.09019608, 1, 0, 1,
-0.451448, -0.1572979, -3.504767, 0.08627451, 1, 0, 1,
-0.4306309, -0.475454, -1.397996, 0.07843138, 1, 0, 1,
-0.4280673, -1.019882, -1.240325, 0.07450981, 1, 0, 1,
-0.426394, -0.6694767, -5.322485, 0.06666667, 1, 0, 1,
-0.4262838, -1.277745, -2.355639, 0.0627451, 1, 0, 1,
-0.4219539, -1.503957, -1.892489, 0.05490196, 1, 0, 1,
-0.4215398, 0.4025156, 0.4306186, 0.05098039, 1, 0, 1,
-0.4205164, 0.444131, -0.3146347, 0.04313726, 1, 0, 1,
-0.4156214, -0.8400345, -2.900038, 0.03921569, 1, 0, 1,
-0.4077821, 1.649671, -1.017414, 0.03137255, 1, 0, 1,
-0.4068031, -0.1857748, -2.790652, 0.02745098, 1, 0, 1,
-0.4036231, -1.938474, -1.989136, 0.01960784, 1, 0, 1,
-0.3989571, 0.7409016, 0.07536817, 0.01568628, 1, 0, 1,
-0.3963443, 0.8395469, 0.07596299, 0.007843138, 1, 0, 1,
-0.3868954, -0.6177743, -1.872146, 0.003921569, 1, 0, 1,
-0.3833964, -0.9811317, -2.458631, 0, 1, 0.003921569, 1,
-0.3822723, 0.06194903, -2.008975, 0, 1, 0.01176471, 1,
-0.381837, -2.207874, -2.094503, 0, 1, 0.01568628, 1,
-0.3799217, -1.031064, -2.392531, 0, 1, 0.02352941, 1,
-0.3791127, 0.7311258, 0.4313046, 0, 1, 0.02745098, 1,
-0.3790798, 0.3946113, -0.1168598, 0, 1, 0.03529412, 1,
-0.3790308, 0.7124637, -0.7540314, 0, 1, 0.03921569, 1,
-0.376065, 1.07296, -0.4131334, 0, 1, 0.04705882, 1,
-0.3748791, -0.02426701, -1.303026, 0, 1, 0.05098039, 1,
-0.3745112, -0.5474219, -2.865854, 0, 1, 0.05882353, 1,
-0.3694186, 0.4730646, 0.9629406, 0, 1, 0.0627451, 1,
-0.3685787, 0.815164, 0.7908359, 0, 1, 0.07058824, 1,
-0.3629722, 0.4040132, 0.3615523, 0, 1, 0.07450981, 1,
-0.360043, -0.1529996, -1.05463, 0, 1, 0.08235294, 1,
-0.3565786, -0.02731755, -0.9596171, 0, 1, 0.08627451, 1,
-0.3513372, 0.8886637, -1.455921, 0, 1, 0.09411765, 1,
-0.3493456, -0.2070827, -0.4510305, 0, 1, 0.1019608, 1,
-0.3476412, 0.3020714, -0.6197777, 0, 1, 0.1058824, 1,
-0.3464465, -0.810541, -1.775486, 0, 1, 0.1137255, 1,
-0.3417103, 0.5622831, -1.94732, 0, 1, 0.1176471, 1,
-0.341224, -0.8411978, -2.442185, 0, 1, 0.1254902, 1,
-0.3404873, 0.6434348, -0.6779028, 0, 1, 0.1294118, 1,
-0.3375697, 0.9198976, -1.084794, 0, 1, 0.1372549, 1,
-0.3343587, 1.66404, -0.0977523, 0, 1, 0.1411765, 1,
-0.334154, 0.7119786, -0.2208881, 0, 1, 0.1490196, 1,
-0.3328032, 0.3090005, 0.5270232, 0, 1, 0.1529412, 1,
-0.3322645, -0.80279, -2.574358, 0, 1, 0.1607843, 1,
-0.3314712, -1.051972, -2.197466, 0, 1, 0.1647059, 1,
-0.3301452, 1.042037, 1.651074, 0, 1, 0.172549, 1,
-0.3228847, -0.1203757, -1.811998, 0, 1, 0.1764706, 1,
-0.3210064, 0.1032022, -2.277458, 0, 1, 0.1843137, 1,
-0.3202861, -0.2069051, 0.5417285, 0, 1, 0.1882353, 1,
-0.3194438, -0.3699968, -3.860732, 0, 1, 0.1960784, 1,
-0.3104511, 0.11064, -1.23752, 0, 1, 0.2039216, 1,
-0.3094263, 0.2176249, 0.1940576, 0, 1, 0.2078431, 1,
-0.3062204, -0.3754288, -2.678857, 0, 1, 0.2156863, 1,
-0.2989522, -1.227535, -3.415978, 0, 1, 0.2196078, 1,
-0.2952901, 0.08541454, 0.9211831, 0, 1, 0.227451, 1,
-0.2943155, -1.20297, -3.116064, 0, 1, 0.2313726, 1,
-0.2933834, 1.05165, 0.4772478, 0, 1, 0.2392157, 1,
-0.2919023, -1.242444, -0.04250105, 0, 1, 0.2431373, 1,
-0.2889928, -1.005609, -2.888655, 0, 1, 0.2509804, 1,
-0.2848054, 0.2172202, 0.04856072, 0, 1, 0.254902, 1,
-0.2808583, 1.122535, 1.084435, 0, 1, 0.2627451, 1,
-0.2807061, -2.731859, -2.872148, 0, 1, 0.2666667, 1,
-0.2804961, 0.3635015, -1.181161, 0, 1, 0.2745098, 1,
-0.2792373, -1.967795, -3.983458, 0, 1, 0.2784314, 1,
-0.2751852, -0.207957, -2.095609, 0, 1, 0.2862745, 1,
-0.2718208, 1.274727, 0.09454324, 0, 1, 0.2901961, 1,
-0.2714753, 0.6508378, -1.016121, 0, 1, 0.2980392, 1,
-0.2695776, 1.943196, 0.3925409, 0, 1, 0.3058824, 1,
-0.2659915, 0.003575354, -0.4736235, 0, 1, 0.3098039, 1,
-0.2611603, 0.6859202, -0.9723125, 0, 1, 0.3176471, 1,
-0.2579149, 0.8602213, -0.3571438, 0, 1, 0.3215686, 1,
-0.2575872, 1.391428, -0.302084, 0, 1, 0.3294118, 1,
-0.2527196, 0.002584108, -1.874902, 0, 1, 0.3333333, 1,
-0.2526982, 0.06082368, -0.5526045, 0, 1, 0.3411765, 1,
-0.2501061, -1.141269, -2.343208, 0, 1, 0.345098, 1,
-0.247, 0.1717722, -1.492791, 0, 1, 0.3529412, 1,
-0.2428581, -0.4501093, -3.300146, 0, 1, 0.3568628, 1,
-0.2424055, 0.7292314, 1.210171, 0, 1, 0.3647059, 1,
-0.2384701, -0.3213589, -2.888233, 0, 1, 0.3686275, 1,
-0.2366046, -0.07352963, -0.4452733, 0, 1, 0.3764706, 1,
-0.2362, 0.6202214, 0.5813433, 0, 1, 0.3803922, 1,
-0.232159, 0.09885714, -1.220207, 0, 1, 0.3882353, 1,
-0.2300673, -1.934829, -3.954804, 0, 1, 0.3921569, 1,
-0.2272663, -1.104185, -4.318202, 0, 1, 0.4, 1,
-0.2269322, 0.6408912, 0.0420711, 0, 1, 0.4078431, 1,
-0.2264816, 0.3736018, 0.2712382, 0, 1, 0.4117647, 1,
-0.2261786, -0.5060332, -2.316727, 0, 1, 0.4196078, 1,
-0.2255808, 0.9610457, 1.043703, 0, 1, 0.4235294, 1,
-0.2254129, -1.515161, -3.604722, 0, 1, 0.4313726, 1,
-0.22178, -0.1152023, -2.553861, 0, 1, 0.4352941, 1,
-0.2216013, -0.2843591, -4.591559, 0, 1, 0.4431373, 1,
-0.2214408, -0.9005743, -3.348126, 0, 1, 0.4470588, 1,
-0.2207876, -1.452462, -2.740823, 0, 1, 0.454902, 1,
-0.2197817, -0.5937775, -2.095002, 0, 1, 0.4588235, 1,
-0.2194644, -1.222799, -2.839162, 0, 1, 0.4666667, 1,
-0.2179643, -0.308787, -2.054883, 0, 1, 0.4705882, 1,
-0.2096379, -0.434598, -3.214954, 0, 1, 0.4784314, 1,
-0.2083439, -3.757113, -3.956074, 0, 1, 0.4823529, 1,
-0.1929187, 0.7680566, -0.06737326, 0, 1, 0.4901961, 1,
-0.1884585, -0.1751336, -3.599788, 0, 1, 0.4941176, 1,
-0.1877474, 1.397934, -0.9508281, 0, 1, 0.5019608, 1,
-0.187641, 0.2391017, -1.878727, 0, 1, 0.509804, 1,
-0.1809346, 0.873565, 0.3021337, 0, 1, 0.5137255, 1,
-0.1802931, 1.131364, -0.3017297, 0, 1, 0.5215687, 1,
-0.18028, -0.03844129, -0.9035568, 0, 1, 0.5254902, 1,
-0.1801206, -2.949172, -2.65792, 0, 1, 0.5333334, 1,
-0.1751864, 0.9202332, 0.1143699, 0, 1, 0.5372549, 1,
-0.1740464, 1.347848, 0.3455484, 0, 1, 0.5450981, 1,
-0.1653104, 1.632774, -0.5542731, 0, 1, 0.5490196, 1,
-0.1575246, 0.4414976, 0.8860832, 0, 1, 0.5568628, 1,
-0.1574716, -1.688621, -5.319821, 0, 1, 0.5607843, 1,
-0.1517069, -0.6981954, -2.559087, 0, 1, 0.5686275, 1,
-0.1509313, -0.7318925, -1.957677, 0, 1, 0.572549, 1,
-0.1501643, 0.1340774, -0.2536244, 0, 1, 0.5803922, 1,
-0.149069, -0.1509764, -2.424598, 0, 1, 0.5843138, 1,
-0.1481951, -0.5198418, -3.917366, 0, 1, 0.5921569, 1,
-0.1464853, -1.11137, -2.593149, 0, 1, 0.5960785, 1,
-0.1464833, 0.4553458, -0.7197299, 0, 1, 0.6039216, 1,
-0.1428124, 0.988049, 0.6349263, 0, 1, 0.6117647, 1,
-0.142121, 2.98973, 0.5943772, 0, 1, 0.6156863, 1,
-0.1378507, 0.739086, -0.298787, 0, 1, 0.6235294, 1,
-0.1374151, 1.129162, -0.248702, 0, 1, 0.627451, 1,
-0.1368466, -0.6489536, -2.77528, 0, 1, 0.6352941, 1,
-0.1353066, 0.5339826, 0.759176, 0, 1, 0.6392157, 1,
-0.1348283, 0.3105478, -1.076845, 0, 1, 0.6470588, 1,
-0.1348239, -0.843832, -2.852021, 0, 1, 0.6509804, 1,
-0.1346801, 1.168168, -2.452275, 0, 1, 0.6588235, 1,
-0.1344264, 0.0866406, -1.383649, 0, 1, 0.6627451, 1,
-0.1323497, 1.960551, -0.09461505, 0, 1, 0.6705883, 1,
-0.1316291, 2.204805, 0.3847485, 0, 1, 0.6745098, 1,
-0.1316197, 0.4502454, -0.1525199, 0, 1, 0.682353, 1,
-0.1246359, 2.007444, -0.1105282, 0, 1, 0.6862745, 1,
-0.1245934, -0.112853, -2.721395, 0, 1, 0.6941177, 1,
-0.1236507, 0.614586, -0.9316522, 0, 1, 0.7019608, 1,
-0.1230508, 1.093483, -1.27032, 0, 1, 0.7058824, 1,
-0.1171688, -0.6713409, -4.609691, 0, 1, 0.7137255, 1,
-0.1159962, 1.033524, -0.5020495, 0, 1, 0.7176471, 1,
-0.1118212, -0.7962034, -2.212457, 0, 1, 0.7254902, 1,
-0.1094914, -0.08368064, -3.178155, 0, 1, 0.7294118, 1,
-0.1092489, 0.1217588, -0.1558311, 0, 1, 0.7372549, 1,
-0.1081448, -0.5571603, -3.630682, 0, 1, 0.7411765, 1,
-0.1071963, -1.5674, -4.584507, 0, 1, 0.7490196, 1,
-0.1066581, 0.1548721, 0.8843796, 0, 1, 0.7529412, 1,
-0.1040739, -0.04713853, -2.718349, 0, 1, 0.7607843, 1,
-0.09924559, -1.740386, -2.932345, 0, 1, 0.7647059, 1,
-0.09710974, -3.055567, -3.992565, 0, 1, 0.772549, 1,
-0.0954892, 0.5487269, -3.063621, 0, 1, 0.7764706, 1,
-0.09503466, -0.1030699, -2.399333, 0, 1, 0.7843137, 1,
-0.09404682, 1.084737, 0.3350176, 0, 1, 0.7882353, 1,
-0.09320521, -0.06814761, -2.465591, 0, 1, 0.7960784, 1,
-0.09191641, 1.183542, 0.005440264, 0, 1, 0.8039216, 1,
-0.09143348, 1.134924, -0.8464801, 0, 1, 0.8078431, 1,
-0.08918251, -1.473627, -3.799285, 0, 1, 0.8156863, 1,
-0.08646438, -0.1894826, -1.684234, 0, 1, 0.8196079, 1,
-0.08472023, -0.6616985, -2.230816, 0, 1, 0.827451, 1,
-0.08128315, 1.062366, -1.435808, 0, 1, 0.8313726, 1,
-0.0760004, -0.3122811, -1.914059, 0, 1, 0.8392157, 1,
-0.06451543, -0.5858622, -2.15531, 0, 1, 0.8431373, 1,
-0.06139303, 0.7097016, 0.6147923, 0, 1, 0.8509804, 1,
-0.06070718, -0.1472408, -2.61533, 0, 1, 0.854902, 1,
-0.05359542, 0.2536378, -0.7289215, 0, 1, 0.8627451, 1,
-0.05315492, 0.2632773, 0.2693675, 0, 1, 0.8666667, 1,
-0.05255767, 0.492008, 0.2124829, 0, 1, 0.8745098, 1,
-0.05115072, 1.010829, -0.4053168, 0, 1, 0.8784314, 1,
-0.04695973, 0.6156203, 0.9721372, 0, 1, 0.8862745, 1,
-0.0441394, 1.096298, -0.9700642, 0, 1, 0.8901961, 1,
-0.03479216, 1.241127, 1.309059, 0, 1, 0.8980392, 1,
-0.0302677, 0.9974905, 0.1322795, 0, 1, 0.9058824, 1,
-0.03005547, -1.084699, -4.49578, 0, 1, 0.9098039, 1,
-0.0275992, 1.376687, 0.01909344, 0, 1, 0.9176471, 1,
-0.02660597, -0.09336388, -3.150975, 0, 1, 0.9215686, 1,
-0.02279397, 0.1134303, -0.4995971, 0, 1, 0.9294118, 1,
-0.0227458, -0.78171, -1.932947, 0, 1, 0.9333333, 1,
-0.02035038, 1.387446, 1.679046, 0, 1, 0.9411765, 1,
-0.01838262, -0.8600851, -2.686984, 0, 1, 0.945098, 1,
-0.0157956, -1.435793, -2.272115, 0, 1, 0.9529412, 1,
-0.01540509, -1.695032, -2.981584, 0, 1, 0.9568627, 1,
-0.01482101, 1.030377, 0.3978128, 0, 1, 0.9647059, 1,
-0.01300499, 0.3065571, 0.89848, 0, 1, 0.9686275, 1,
-0.01220073, 1.346497, -0.6457636, 0, 1, 0.9764706, 1,
-0.01168682, 0.03528102, -0.6994373, 0, 1, 0.9803922, 1,
-0.01056542, -0.4827763, -2.306106, 0, 1, 0.9882353, 1,
-0.007523539, 1.107447, 2.325784, 0, 1, 0.9921569, 1,
-0.005860317, 1.144264, 0.6089236, 0, 1, 1, 1,
-0.002165991, 0.5091673, -0.7770978, 0, 0.9921569, 1, 1,
0.001233102, -0.3371924, 1.592087, 0, 0.9882353, 1, 1,
0.003414047, -0.8278496, 3.094594, 0, 0.9803922, 1, 1,
0.003430879, -0.3348796, 4.347512, 0, 0.9764706, 1, 1,
0.00663452, -0.2707326, 2.915881, 0, 0.9686275, 1, 1,
0.0116996, 1.340745, -0.9600536, 0, 0.9647059, 1, 1,
0.0172961, -0.3354297, 2.371212, 0, 0.9568627, 1, 1,
0.01858546, -1.062953, 5.617887, 0, 0.9529412, 1, 1,
0.02274177, 1.561411, 1.223139, 0, 0.945098, 1, 1,
0.02549381, 1.121544, -0.326008, 0, 0.9411765, 1, 1,
0.02569431, -0.4070703, 3.266476, 0, 0.9333333, 1, 1,
0.02707807, -0.9429432, 2.814646, 0, 0.9294118, 1, 1,
0.02842262, -1.313698, 2.406543, 0, 0.9215686, 1, 1,
0.03319852, 1.75187, 0.3990897, 0, 0.9176471, 1, 1,
0.03411391, 0.1477078, -0.540246, 0, 0.9098039, 1, 1,
0.04280652, -0.7533236, 3.099499, 0, 0.9058824, 1, 1,
0.04355904, -0.02176954, 4.478025, 0, 0.8980392, 1, 1,
0.04496666, 0.9029697, -0.6226221, 0, 0.8901961, 1, 1,
0.04683339, 1.369787, -0.5549878, 0, 0.8862745, 1, 1,
0.04962501, 1.61911, -1.29604, 0, 0.8784314, 1, 1,
0.04970862, 0.3577135, -0.5748289, 0, 0.8745098, 1, 1,
0.05028523, 0.04018924, -0.2884561, 0, 0.8666667, 1, 1,
0.05165646, -1.921912, 4.314723, 0, 0.8627451, 1, 1,
0.05247497, -1.537397, 3.512037, 0, 0.854902, 1, 1,
0.05537863, 1.7738, -0.8457879, 0, 0.8509804, 1, 1,
0.06063982, -0.2974064, 2.340621, 0, 0.8431373, 1, 1,
0.06238053, 0.1721645, -0.5930745, 0, 0.8392157, 1, 1,
0.06324135, -0.08833875, 3.698916, 0, 0.8313726, 1, 1,
0.0669741, -0.02723308, 1.471454, 0, 0.827451, 1, 1,
0.0672441, -0.1070463, 1.869318, 0, 0.8196079, 1, 1,
0.06738445, 0.1432927, 1.686352, 0, 0.8156863, 1, 1,
0.06905616, -0.0940725, 2.321113, 0, 0.8078431, 1, 1,
0.06980866, -0.04991206, 1.051876, 0, 0.8039216, 1, 1,
0.07148971, 1.144335, 1.045241, 0, 0.7960784, 1, 1,
0.08408162, -2.083776, 1.951501, 0, 0.7882353, 1, 1,
0.0863921, -0.3158604, 2.130267, 0, 0.7843137, 1, 1,
0.0876859, -0.5898634, 1.797805, 0, 0.7764706, 1, 1,
0.08814593, -0.226405, 4.265782, 0, 0.772549, 1, 1,
0.08942228, -1.049183, 3.843476, 0, 0.7647059, 1, 1,
0.09020343, -0.7811893, 3.695485, 0, 0.7607843, 1, 1,
0.09314336, -0.08808565, 1.978714, 0, 0.7529412, 1, 1,
0.1041199, 0.8297969, -0.3729702, 0, 0.7490196, 1, 1,
0.1080414, -0.3054766, 2.254161, 0, 0.7411765, 1, 1,
0.1091826, -0.2784941, 2.224247, 0, 0.7372549, 1, 1,
0.1127028, -0.04772535, 2.273232, 0, 0.7294118, 1, 1,
0.1144924, -0.5654176, 3.457571, 0, 0.7254902, 1, 1,
0.1169986, 0.7954937, 1.363691, 0, 0.7176471, 1, 1,
0.121047, -0.3649022, 3.457138, 0, 0.7137255, 1, 1,
0.1220655, -0.6902198, 2.954682, 0, 0.7058824, 1, 1,
0.1252061, 0.3953049, 0.1388988, 0, 0.6980392, 1, 1,
0.1267203, -1.453327, 5.562733, 0, 0.6941177, 1, 1,
0.1300465, -1.628035, 3.600597, 0, 0.6862745, 1, 1,
0.1330115, 0.5988313, -0.8906211, 0, 0.682353, 1, 1,
0.1330668, -0.2313955, 2.296251, 0, 0.6745098, 1, 1,
0.1332487, -1.618799, 2.788136, 0, 0.6705883, 1, 1,
0.1356047, 0.2314867, 0.8350092, 0, 0.6627451, 1, 1,
0.1367009, 0.4373714, 0.3322277, 0, 0.6588235, 1, 1,
0.13884, 1.69443, -0.8478288, 0, 0.6509804, 1, 1,
0.1459205, -0.2137599, 3.377326, 0, 0.6470588, 1, 1,
0.1474307, -0.7110064, 2.649005, 0, 0.6392157, 1, 1,
0.1503127, 0.5674613, 1.134797, 0, 0.6352941, 1, 1,
0.1506514, 0.1672456, -0.5325781, 0, 0.627451, 1, 1,
0.1516868, 0.8513612, 0.4574588, 0, 0.6235294, 1, 1,
0.1527293, -0.6938526, 3.093671, 0, 0.6156863, 1, 1,
0.1536251, -1.023181, 2.621834, 0, 0.6117647, 1, 1,
0.1590001, -0.3621807, 3.080518, 0, 0.6039216, 1, 1,
0.1598377, -0.5929308, 1.40625, 0, 0.5960785, 1, 1,
0.1602599, 0.6002744, 1.21564, 0, 0.5921569, 1, 1,
0.1619305, 0.5896178, -0.5393727, 0, 0.5843138, 1, 1,
0.1638641, 0.2981367, 2.110481, 0, 0.5803922, 1, 1,
0.1638643, -1.628433, 1.807431, 0, 0.572549, 1, 1,
0.1644844, 0.1379827, 0.2172641, 0, 0.5686275, 1, 1,
0.1669325, -1.737085, 2.708328, 0, 0.5607843, 1, 1,
0.1687026, 0.5150533, 1.054719, 0, 0.5568628, 1, 1,
0.169428, -0.3605486, 3.351903, 0, 0.5490196, 1, 1,
0.1712296, -1.018827, 1.428128, 0, 0.5450981, 1, 1,
0.1726928, -1.876687, 3.027327, 0, 0.5372549, 1, 1,
0.1754937, 1.041805, 0.3374147, 0, 0.5333334, 1, 1,
0.1793794, 1.76215, -1.379753, 0, 0.5254902, 1, 1,
0.1882925, -0.08020689, 2.983973, 0, 0.5215687, 1, 1,
0.1887465, -0.2906553, 0.5964255, 0, 0.5137255, 1, 1,
0.1910525, -0.4214039, 3.300247, 0, 0.509804, 1, 1,
0.1940254, 0.2758302, 0.3539008, 0, 0.5019608, 1, 1,
0.1965145, -1.487996, 2.405078, 0, 0.4941176, 1, 1,
0.1978085, 1.088373, 1.024917, 0, 0.4901961, 1, 1,
0.1998215, 1.105249, 0.8904186, 0, 0.4823529, 1, 1,
0.2018294, 0.7783257, 0.2214064, 0, 0.4784314, 1, 1,
0.2025082, 0.1566886, 0.659593, 0, 0.4705882, 1, 1,
0.2028169, 0.5228155, 0.4168065, 0, 0.4666667, 1, 1,
0.2029469, -1.897895, 1.59447, 0, 0.4588235, 1, 1,
0.2037433, 0.262185, 0.9978982, 0, 0.454902, 1, 1,
0.2040173, -0.314068, 3.516997, 0, 0.4470588, 1, 1,
0.2043287, 0.4099749, 0.1992291, 0, 0.4431373, 1, 1,
0.2066928, -0.6173497, 3.552086, 0, 0.4352941, 1, 1,
0.2076145, -0.1338221, 2.560333, 0, 0.4313726, 1, 1,
0.2094731, -0.07584514, 3.497406, 0, 0.4235294, 1, 1,
0.2234425, -1.762547, 3.551412, 0, 0.4196078, 1, 1,
0.2279869, -0.3417004, 2.307754, 0, 0.4117647, 1, 1,
0.2297106, -0.02517692, 1.80778, 0, 0.4078431, 1, 1,
0.2351438, -0.4713497, 3.340018, 0, 0.4, 1, 1,
0.2379663, -0.01500933, 1.281769, 0, 0.3921569, 1, 1,
0.239339, 0.1151378, 1.683183, 0, 0.3882353, 1, 1,
0.2398291, -0.6256793, 3.8848, 0, 0.3803922, 1, 1,
0.2402174, -0.9310635, 5.148279, 0, 0.3764706, 1, 1,
0.2419861, 0.1388031, 0.7171475, 0, 0.3686275, 1, 1,
0.2426311, 0.3073688, 1.451515, 0, 0.3647059, 1, 1,
0.2434689, -0.6215884, 2.86051, 0, 0.3568628, 1, 1,
0.2471444, 0.1853618, 0.8518658, 0, 0.3529412, 1, 1,
0.2488305, 1.468879, -0.7937148, 0, 0.345098, 1, 1,
0.2489355, 1.645519, -0.1068808, 0, 0.3411765, 1, 1,
0.2501952, 0.05640569, 2.432854, 0, 0.3333333, 1, 1,
0.2509595, -0.09982337, 3.153895, 0, 0.3294118, 1, 1,
0.2553974, 0.1656216, -1.102188, 0, 0.3215686, 1, 1,
0.2555574, -2.053016, 2.99506, 0, 0.3176471, 1, 1,
0.2560628, -1.147137, 3.600833, 0, 0.3098039, 1, 1,
0.2630252, -1.322426, 3.623224, 0, 0.3058824, 1, 1,
0.2653643, 0.3138584, 1.555118, 0, 0.2980392, 1, 1,
0.267505, 0.4793293, -1.537215, 0, 0.2901961, 1, 1,
0.2679205, -1.780897, 1.66269, 0, 0.2862745, 1, 1,
0.2701647, 1.6042, 1.124366, 0, 0.2784314, 1, 1,
0.2771015, 0.2711563, 0.7626516, 0, 0.2745098, 1, 1,
0.2788933, -1.267692, 2.310681, 0, 0.2666667, 1, 1,
0.2814149, -1.506976, 2.195773, 0, 0.2627451, 1, 1,
0.2821391, 1.913288, 0.2464887, 0, 0.254902, 1, 1,
0.285556, 0.5101216, 2.569614, 0, 0.2509804, 1, 1,
0.2890652, -1.04984, 2.309019, 0, 0.2431373, 1, 1,
0.2900336, -0.2975142, 2.276323, 0, 0.2392157, 1, 1,
0.2965296, -0.8244959, 2.92055, 0, 0.2313726, 1, 1,
0.3000278, -0.634378, 0.7275801, 0, 0.227451, 1, 1,
0.3043132, 1.156635, -0.06500863, 0, 0.2196078, 1, 1,
0.3082478, -0.1498514, 2.896862, 0, 0.2156863, 1, 1,
0.3130375, -0.7897848, 2.471265, 0, 0.2078431, 1, 1,
0.3202198, -0.2641295, 3.994442, 0, 0.2039216, 1, 1,
0.3256842, 0.1469985, 0.8096986, 0, 0.1960784, 1, 1,
0.3292963, -1.768889, 1.734387, 0, 0.1882353, 1, 1,
0.3297138, 0.1087893, -0.02723205, 0, 0.1843137, 1, 1,
0.3339636, 0.7350783, -0.5452437, 0, 0.1764706, 1, 1,
0.3340138, -0.4264559, 2.639175, 0, 0.172549, 1, 1,
0.3408753, 0.2051717, 1.458867, 0, 0.1647059, 1, 1,
0.3428154, -0.1737009, 3.296088, 0, 0.1607843, 1, 1,
0.3433793, -0.7116296, 1.662476, 0, 0.1529412, 1, 1,
0.3481509, -0.1629811, 1.921921, 0, 0.1490196, 1, 1,
0.3488732, -1.737219, 3.514174, 0, 0.1411765, 1, 1,
0.3494746, -0.6329253, 3.986659, 0, 0.1372549, 1, 1,
0.351629, -0.8697397, 2.677259, 0, 0.1294118, 1, 1,
0.3539712, -0.03741034, 0.4856168, 0, 0.1254902, 1, 1,
0.3545001, 0.8104765, -0.01813762, 0, 0.1176471, 1, 1,
0.3553689, 1.702113, 2.02912, 0, 0.1137255, 1, 1,
0.3591376, -0.7110999, 4.916003, 0, 0.1058824, 1, 1,
0.3591922, -0.08979035, 1.723766, 0, 0.09803922, 1, 1,
0.3616178, -0.952018, 1.290762, 0, 0.09411765, 1, 1,
0.3654288, -0.913484, 1.688495, 0, 0.08627451, 1, 1,
0.3774678, 0.8397195, -0.03359671, 0, 0.08235294, 1, 1,
0.3815021, 1.562245, 0.2804015, 0, 0.07450981, 1, 1,
0.3823135, 0.3819263, 1.050484, 0, 0.07058824, 1, 1,
0.3912228, 0.7397004, 2.819331, 0, 0.0627451, 1, 1,
0.3939453, 0.1506199, -0.3454497, 0, 0.05882353, 1, 1,
0.39825, 0.3085234, 0.7003323, 0, 0.05098039, 1, 1,
0.3984278, 1.004781, -0.5389792, 0, 0.04705882, 1, 1,
0.4003742, -0.1137253, 0.5623846, 0, 0.03921569, 1, 1,
0.4060063, 0.5082001, 0.7372424, 0, 0.03529412, 1, 1,
0.4126908, -1.509908, 4.364858, 0, 0.02745098, 1, 1,
0.4167041, 1.136315, 0.410156, 0, 0.02352941, 1, 1,
0.4175314, 0.9828189, -1.421564, 0, 0.01568628, 1, 1,
0.4177636, -0.2096409, 2.930182, 0, 0.01176471, 1, 1,
0.4196457, 0.9450372, -0.2770392, 0, 0.003921569, 1, 1,
0.4211766, 1.016566, 0.7709618, 0.003921569, 0, 1, 1,
0.4266559, -0.03521805, 1.608584, 0.007843138, 0, 1, 1,
0.4285041, -0.152349, 0.4205715, 0.01568628, 0, 1, 1,
0.4287928, -0.7192313, 2.607366, 0.01960784, 0, 1, 1,
0.4294732, 1.729779, 1.207361, 0.02745098, 0, 1, 1,
0.4316365, -0.4546854, 1.974283, 0.03137255, 0, 1, 1,
0.4351097, 1.49096, -2.523967, 0.03921569, 0, 1, 1,
0.4351913, 0.8661186, 0.1019724, 0.04313726, 0, 1, 1,
0.4440365, 0.557495, 2.476504, 0.05098039, 0, 1, 1,
0.4440832, -0.3754858, 2.001216, 0.05490196, 0, 1, 1,
0.4493343, -0.8227421, 2.400051, 0.0627451, 0, 1, 1,
0.4546247, 0.0406468, 1.877771, 0.06666667, 0, 1, 1,
0.4551398, -0.6394585, 3.029073, 0.07450981, 0, 1, 1,
0.4650201, 0.8811305, 2.156876, 0.07843138, 0, 1, 1,
0.4689428, -0.9869637, 3.347413, 0.08627451, 0, 1, 1,
0.4741797, 1.067437, -0.1251156, 0.09019608, 0, 1, 1,
0.474391, 0.1434222, 1.638678, 0.09803922, 0, 1, 1,
0.4784393, -0.7799264, 0.6201646, 0.1058824, 0, 1, 1,
0.481026, -0.7863174, 0.5468288, 0.1098039, 0, 1, 1,
0.4868591, -2.081752, 3.451136, 0.1176471, 0, 1, 1,
0.4911632, 0.3233611, 1.398895, 0.1215686, 0, 1, 1,
0.4936596, -0.755529, 1.445344, 0.1294118, 0, 1, 1,
0.497699, -0.4174877, 2.352246, 0.1333333, 0, 1, 1,
0.5049779, -0.5573475, 2.695573, 0.1411765, 0, 1, 1,
0.508069, 1.064397, -0.1004586, 0.145098, 0, 1, 1,
0.514407, 1.048077, -0.9702448, 0.1529412, 0, 1, 1,
0.5145448, -2.123902, 1.7857, 0.1568628, 0, 1, 1,
0.5153291, -1.352663, 2.296014, 0.1647059, 0, 1, 1,
0.5180091, 2.290283, 0.00140686, 0.1686275, 0, 1, 1,
0.5187612, -0.4042323, 0.5606811, 0.1764706, 0, 1, 1,
0.5189836, -1.958845, 3.345333, 0.1803922, 0, 1, 1,
0.519219, 0.4141198, 1.118972, 0.1882353, 0, 1, 1,
0.520226, -0.9945421, 1.333651, 0.1921569, 0, 1, 1,
0.5208547, 0.6458242, -0.116552, 0.2, 0, 1, 1,
0.523931, -0.4918929, 3.979533, 0.2078431, 0, 1, 1,
0.5259265, 1.301593, -0.841157, 0.2117647, 0, 1, 1,
0.5300744, 1.432655, -0.494992, 0.2196078, 0, 1, 1,
0.5363078, -0.4692033, 2.957418, 0.2235294, 0, 1, 1,
0.5396124, 0.7643223, 1.819756, 0.2313726, 0, 1, 1,
0.5398878, 0.04194389, 1.580662, 0.2352941, 0, 1, 1,
0.5430501, -1.726343, 1.149525, 0.2431373, 0, 1, 1,
0.5468928, -0.4386191, 3.15027, 0.2470588, 0, 1, 1,
0.547408, 0.04441795, 1.993595, 0.254902, 0, 1, 1,
0.5504929, 1.501554, -0.5811332, 0.2588235, 0, 1, 1,
0.5537658, 0.9255525, 0.07942109, 0.2666667, 0, 1, 1,
0.5552475, 0.5639225, -0.04136263, 0.2705882, 0, 1, 1,
0.5561878, -0.2220967, 3.707648, 0.2784314, 0, 1, 1,
0.5674111, 0.3276841, 0.3443708, 0.282353, 0, 1, 1,
0.5703103, 0.3485969, 1.919952, 0.2901961, 0, 1, 1,
0.5724142, 1.125061, -0.5285411, 0.2941177, 0, 1, 1,
0.5738974, 0.3308674, 0.02302707, 0.3019608, 0, 1, 1,
0.5761557, -0.2525724, 1.936546, 0.3098039, 0, 1, 1,
0.5798701, -2.388425, 3.107593, 0.3137255, 0, 1, 1,
0.5851817, -1.193116, 2.818766, 0.3215686, 0, 1, 1,
0.5853289, 2.019092, 0.8750765, 0.3254902, 0, 1, 1,
0.5874797, -0.05005075, 2.362923, 0.3333333, 0, 1, 1,
0.5878603, 1.33515, 0.05600183, 0.3372549, 0, 1, 1,
0.5884025, -0.08628871, 3.103124, 0.345098, 0, 1, 1,
0.5911036, -1.531987, 2.144578, 0.3490196, 0, 1, 1,
0.5916259, -0.2130369, 1.669442, 0.3568628, 0, 1, 1,
0.595591, -0.7083661, 1.279273, 0.3607843, 0, 1, 1,
0.5957871, -0.2903852, 3.824908, 0.3686275, 0, 1, 1,
0.5961147, 0.9004452, 1.5555, 0.372549, 0, 1, 1,
0.5964962, 2.604111, -0.3733553, 0.3803922, 0, 1, 1,
0.5983921, -0.1162837, 2.123461, 0.3843137, 0, 1, 1,
0.6092511, 0.1478803, 1.055673, 0.3921569, 0, 1, 1,
0.6139863, 0.4670399, 1.79482, 0.3960784, 0, 1, 1,
0.6186934, -1.188198, 1.916406, 0.4039216, 0, 1, 1,
0.6192434, 0.7366679, 0.6300114, 0.4117647, 0, 1, 1,
0.6272011, -0.2751109, 1.632197, 0.4156863, 0, 1, 1,
0.6278865, 0.2913978, 0.0219837, 0.4235294, 0, 1, 1,
0.6292489, -1.155529, 4.869304, 0.427451, 0, 1, 1,
0.6344916, 0.451752, 1.042339, 0.4352941, 0, 1, 1,
0.635773, -0.6241386, 2.344979, 0.4392157, 0, 1, 1,
0.636074, -0.3450221, 3.70228, 0.4470588, 0, 1, 1,
0.6423166, -0.3687113, 1.417118, 0.4509804, 0, 1, 1,
0.6445183, 1.022566, -1.229726, 0.4588235, 0, 1, 1,
0.6446878, 2.096383, -0.2158667, 0.4627451, 0, 1, 1,
0.6531627, -0.5776595, 2.344577, 0.4705882, 0, 1, 1,
0.6539333, 1.432564, 1.775998, 0.4745098, 0, 1, 1,
0.6551578, -0.3268816, 0.3876877, 0.4823529, 0, 1, 1,
0.6598134, 1.548003, 0.5071431, 0.4862745, 0, 1, 1,
0.672532, -0.5536957, 2.37818, 0.4941176, 0, 1, 1,
0.6787339, -0.7314537, 3.470589, 0.5019608, 0, 1, 1,
0.6815566, -0.3159998, 2.153043, 0.5058824, 0, 1, 1,
0.6862021, -0.4364673, 2.290983, 0.5137255, 0, 1, 1,
0.6949021, -2.104906, 3.115376, 0.5176471, 0, 1, 1,
0.6955982, 1.759614, -1.211166, 0.5254902, 0, 1, 1,
0.6962681, 1.077317, -0.314903, 0.5294118, 0, 1, 1,
0.6970915, 0.3656139, 0.03977858, 0.5372549, 0, 1, 1,
0.6995479, 1.384987, -0.256225, 0.5411765, 0, 1, 1,
0.7000638, -0.07033829, 1.466449, 0.5490196, 0, 1, 1,
0.7022969, -0.2715327, 0.7611833, 0.5529412, 0, 1, 1,
0.7043534, -0.9995486, 3.019918, 0.5607843, 0, 1, 1,
0.7059825, 0.8948479, 2.200469, 0.5647059, 0, 1, 1,
0.7088248, -0.9473997, 2.812809, 0.572549, 0, 1, 1,
0.7199518, -1.648377, 1.790554, 0.5764706, 0, 1, 1,
0.720094, -0.8895688, 2.425832, 0.5843138, 0, 1, 1,
0.7320687, -0.9656833, 2.175514, 0.5882353, 0, 1, 1,
0.7331087, -2.454145, 2.886242, 0.5960785, 0, 1, 1,
0.7334926, 1.457757, 0.859242, 0.6039216, 0, 1, 1,
0.7340523, -0.6201645, 3.010335, 0.6078432, 0, 1, 1,
0.7347285, -1.76053, 2.926963, 0.6156863, 0, 1, 1,
0.7362937, -0.3871614, 2.366835, 0.6196079, 0, 1, 1,
0.7372756, -0.6519642, 3.148168, 0.627451, 0, 1, 1,
0.741253, 1.190222, 0.9358232, 0.6313726, 0, 1, 1,
0.7479549, -0.2193453, 3.089952, 0.6392157, 0, 1, 1,
0.7500228, 0.6090409, 1.069494, 0.6431373, 0, 1, 1,
0.7510793, 2.112451, 1.702756, 0.6509804, 0, 1, 1,
0.7514041, -1.376845, 3.917656, 0.654902, 0, 1, 1,
0.7517151, 0.2348625, 1.124124, 0.6627451, 0, 1, 1,
0.7527902, -0.5690824, 0.4382839, 0.6666667, 0, 1, 1,
0.7577649, -1.163504, 0.3992039, 0.6745098, 0, 1, 1,
0.7580282, -0.1123449, 1.772952, 0.6784314, 0, 1, 1,
0.7583057, -1.067904, 2.217823, 0.6862745, 0, 1, 1,
0.7599881, 0.03384311, 2.61972, 0.6901961, 0, 1, 1,
0.7612932, -0.05849361, 0.1669978, 0.6980392, 0, 1, 1,
0.7685097, 0.4033097, 0.9596632, 0.7058824, 0, 1, 1,
0.7774842, 0.7255074, -0.2048092, 0.7098039, 0, 1, 1,
0.7817138, 0.9449009, 1.294583, 0.7176471, 0, 1, 1,
0.7842494, -0.10348, 3.834796, 0.7215686, 0, 1, 1,
0.7854455, 0.735907, 1.025937, 0.7294118, 0, 1, 1,
0.7931409, -0.395312, 2.511763, 0.7333333, 0, 1, 1,
0.7942601, 1.851854, -0.5109285, 0.7411765, 0, 1, 1,
0.7944704, 0.7175972, -0.9138364, 0.7450981, 0, 1, 1,
0.7950044, -1.520196, 2.668918, 0.7529412, 0, 1, 1,
0.7988758, 0.3468901, 2.883328, 0.7568628, 0, 1, 1,
0.7988991, 1.846584, 1.489743, 0.7647059, 0, 1, 1,
0.8008394, -2.712265, 2.385246, 0.7686275, 0, 1, 1,
0.8063123, -0.7114659, 2.232402, 0.7764706, 0, 1, 1,
0.8077844, 1.708285, 1.197299, 0.7803922, 0, 1, 1,
0.809512, 1.516, 0.9376483, 0.7882353, 0, 1, 1,
0.8155152, -0.3167381, 1.29714, 0.7921569, 0, 1, 1,
0.8162265, 0.3936534, -0.1094208, 0.8, 0, 1, 1,
0.8232477, -1.450141, 2.322008, 0.8078431, 0, 1, 1,
0.8331536, -0.1299733, 1.999752, 0.8117647, 0, 1, 1,
0.8356499, 0.63367, 1.826215, 0.8196079, 0, 1, 1,
0.8387276, 0.4986933, 1.709256, 0.8235294, 0, 1, 1,
0.8406379, -0.3785766, 1.939444, 0.8313726, 0, 1, 1,
0.8412758, 0.1536569, 1.988569, 0.8352941, 0, 1, 1,
0.8417887, -1.103263, 2.091205, 0.8431373, 0, 1, 1,
0.8450252, 0.5950235, 1.190907, 0.8470588, 0, 1, 1,
0.8486841, -0.1313458, 0.8585864, 0.854902, 0, 1, 1,
0.8508375, 1.580463, -0.002622718, 0.8588235, 0, 1, 1,
0.8555524, 2.221837, 0.8661939, 0.8666667, 0, 1, 1,
0.858474, 0.06975146, 1.314595, 0.8705882, 0, 1, 1,
0.8643803, -1.403108, 3.019006, 0.8784314, 0, 1, 1,
0.8682527, 0.7530994, 0.9561372, 0.8823529, 0, 1, 1,
0.8710989, 1.33505, 0.6705102, 0.8901961, 0, 1, 1,
0.8718125, 0.8528149, 0.200698, 0.8941177, 0, 1, 1,
0.8788955, 0.6276504, 0.934508, 0.9019608, 0, 1, 1,
0.8791326, 0.8095437, 0.3411609, 0.9098039, 0, 1, 1,
0.8827314, -0.6313505, 4.122028, 0.9137255, 0, 1, 1,
0.8855342, -0.4889804, 3.771163, 0.9215686, 0, 1, 1,
0.8913888, -2.13004, 4.236794, 0.9254902, 0, 1, 1,
0.8917273, -1.13744, 2.158113, 0.9333333, 0, 1, 1,
0.8935996, 1.905962, -1.315904, 0.9372549, 0, 1, 1,
0.8963151, 1.620076, -0.1589378, 0.945098, 0, 1, 1,
0.899022, -0.1463391, 1.837648, 0.9490196, 0, 1, 1,
0.9085509, -0.1271086, -0.4627684, 0.9568627, 0, 1, 1,
0.9194862, 0.4116738, -0.06995162, 0.9607843, 0, 1, 1,
0.9287392, 0.1882484, 1.866987, 0.9686275, 0, 1, 1,
0.9376503, -0.08945809, 1.079184, 0.972549, 0, 1, 1,
0.9381512, 0.6687765, 1.626858, 0.9803922, 0, 1, 1,
0.9381699, -0.6333005, 3.608077, 0.9843137, 0, 1, 1,
0.9393735, 1.788742, 0.5491092, 0.9921569, 0, 1, 1,
0.9452782, -0.1829554, 1.620019, 0.9960784, 0, 1, 1,
0.9484001, -0.1083584, 2.203804, 1, 0, 0.9960784, 1,
0.9543977, 0.1518748, 1.098758, 1, 0, 0.9882353, 1,
0.9617974, -0.3483166, 1.585146, 1, 0, 0.9843137, 1,
0.9677813, -0.3261475, 2.214697, 1, 0, 0.9764706, 1,
0.9727084, -0.082977, 1.400329, 1, 0, 0.972549, 1,
0.97311, 0.5551598, 1.371825, 1, 0, 0.9647059, 1,
0.9734907, -0.665269, 2.212676, 1, 0, 0.9607843, 1,
0.9831691, -0.7799255, 3.437105, 1, 0, 0.9529412, 1,
0.9911415, 0.4627793, 0.7232796, 1, 0, 0.9490196, 1,
0.9914398, -0.1296385, 1.019846, 1, 0, 0.9411765, 1,
0.991691, -2.780258, 3.274467, 1, 0, 0.9372549, 1,
0.9917657, -0.6507874, 1.901058, 1, 0, 0.9294118, 1,
0.9936836, 0.3263038, 1.925403, 1, 0, 0.9254902, 1,
0.9967997, -0.9943691, 2.233522, 1, 0, 0.9176471, 1,
1.00017, -0.02545306, 2.950115, 1, 0, 0.9137255, 1,
1.005999, 0.5618338, 1.318267, 1, 0, 0.9058824, 1,
1.012447, 1.031324, 1.083848, 1, 0, 0.9019608, 1,
1.021351, 0.1005276, 1.539715, 1, 0, 0.8941177, 1,
1.021542, -0.4331991, 0.8391479, 1, 0, 0.8862745, 1,
1.022661, 0.3819926, 1.586639, 1, 0, 0.8823529, 1,
1.027145, -0.5900325, 2.876202, 1, 0, 0.8745098, 1,
1.0273, -0.170382, 2.421497, 1, 0, 0.8705882, 1,
1.036962, -0.6551921, 2.385165, 1, 0, 0.8627451, 1,
1.037238, 0.9531584, 1.450827, 1, 0, 0.8588235, 1,
1.040812, 1.396809, -1.092858, 1, 0, 0.8509804, 1,
1.043001, 0.9154709, 2.371823, 1, 0, 0.8470588, 1,
1.048851, -0.7625287, 2.976117, 1, 0, 0.8392157, 1,
1.051227, 0.2114228, 0.2495782, 1, 0, 0.8352941, 1,
1.05814, -0.9332182, 1.439033, 1, 0, 0.827451, 1,
1.059518, -0.1533927, 1.711957, 1, 0, 0.8235294, 1,
1.068273, 0.3128709, 1.486426, 1, 0, 0.8156863, 1,
1.070858, -0.1713098, 0.9619036, 1, 0, 0.8117647, 1,
1.072062, 1.40649, 0.2326396, 1, 0, 0.8039216, 1,
1.076709, 0.6344045, -0.8673496, 1, 0, 0.7960784, 1,
1.076931, -1.674577, 3.411711, 1, 0, 0.7921569, 1,
1.086191, 0.02370512, 0.82715, 1, 0, 0.7843137, 1,
1.091339, -1.311627, 2.785683, 1, 0, 0.7803922, 1,
1.104087, 0.6936826, 0.08270329, 1, 0, 0.772549, 1,
1.110506, 1.227743, -0.1471447, 1, 0, 0.7686275, 1,
1.110524, 1.041797, 2.724224, 1, 0, 0.7607843, 1,
1.118379, 0.5991768, 0.5643311, 1, 0, 0.7568628, 1,
1.121962, 0.8474196, 1.533313, 1, 0, 0.7490196, 1,
1.125569, 0.5018328, 2.169475, 1, 0, 0.7450981, 1,
1.126822, -0.1453189, 2.226459, 1, 0, 0.7372549, 1,
1.137131, 0.6198852, 1.970846, 1, 0, 0.7333333, 1,
1.142898, 0.2884138, 2.071608, 1, 0, 0.7254902, 1,
1.14623, -0.1872027, 0.9788089, 1, 0, 0.7215686, 1,
1.151438, -0.6346952, 2.523532, 1, 0, 0.7137255, 1,
1.156777, 0.299151, 1.446674, 1, 0, 0.7098039, 1,
1.157763, 0.799377, 0.09644642, 1, 0, 0.7019608, 1,
1.166371, -1.222029, 0.5619099, 1, 0, 0.6941177, 1,
1.175231, 1.689585, 1.503344, 1, 0, 0.6901961, 1,
1.176623, 0.8186656, 0.8505528, 1, 0, 0.682353, 1,
1.177786, -0.6679555, 1.281001, 1, 0, 0.6784314, 1,
1.187682, 0.1492598, 0.5369956, 1, 0, 0.6705883, 1,
1.193795, -0.9922866, 1.061295, 1, 0, 0.6666667, 1,
1.19422, -0.7995449, 2.053898, 1, 0, 0.6588235, 1,
1.195539, 1.470171, 0.460484, 1, 0, 0.654902, 1,
1.196817, 0.938475, -0.4416039, 1, 0, 0.6470588, 1,
1.197925, 0.4597067, 1.832094, 1, 0, 0.6431373, 1,
1.208535, -1.075989, 2.447104, 1, 0, 0.6352941, 1,
1.210775, 0.9120775, 1.498284, 1, 0, 0.6313726, 1,
1.213381, 1.023774, -0.5353425, 1, 0, 0.6235294, 1,
1.216965, -1.939093, 2.236924, 1, 0, 0.6196079, 1,
1.217245, -1.157391, 2.550682, 1, 0, 0.6117647, 1,
1.217634, 1.000728, -0.6632329, 1, 0, 0.6078432, 1,
1.219966, 0.5595959, 1.151052, 1, 0, 0.6, 1,
1.222616, 2.302165, 0.1626941, 1, 0, 0.5921569, 1,
1.234295, -2.125184, 4.302906, 1, 0, 0.5882353, 1,
1.235202, 0.468459, 1.852479, 1, 0, 0.5803922, 1,
1.236343, -1.391019, 3.224823, 1, 0, 0.5764706, 1,
1.252411, -0.7536978, -0.3849472, 1, 0, 0.5686275, 1,
1.266791, -0.05905878, 2.711435, 1, 0, 0.5647059, 1,
1.281973, -0.6260284, 2.528176, 1, 0, 0.5568628, 1,
1.284129, -0.02116035, 1.947712, 1, 0, 0.5529412, 1,
1.288124, 0.673153, 0.4484099, 1, 0, 0.5450981, 1,
1.294573, 0.8938779, 0.8956634, 1, 0, 0.5411765, 1,
1.294904, -0.1127034, 1.131601, 1, 0, 0.5333334, 1,
1.300155, -0.01471984, 2.532202, 1, 0, 0.5294118, 1,
1.309304, 0.5434729, -1.057132, 1, 0, 0.5215687, 1,
1.320047, 0.2946677, 3.491351, 1, 0, 0.5176471, 1,
1.322846, -0.9585287, 1.198915, 1, 0, 0.509804, 1,
1.327945, 0.6124397, -0.1225427, 1, 0, 0.5058824, 1,
1.328313, 0.1105499, 0.9330898, 1, 0, 0.4980392, 1,
1.33115, -0.9213774, 4.217895, 1, 0, 0.4901961, 1,
1.33328, 0.3700801, 0.3907984, 1, 0, 0.4862745, 1,
1.334718, 1.954035, 0.3040285, 1, 0, 0.4784314, 1,
1.35656, 0.5482813, -0.8394681, 1, 0, 0.4745098, 1,
1.362052, -0.8097148, 2.009632, 1, 0, 0.4666667, 1,
1.375907, 0.7159274, 0.6318235, 1, 0, 0.4627451, 1,
1.376087, -0.8636978, 1.648021, 1, 0, 0.454902, 1,
1.391075, 1.555733, 1.59589, 1, 0, 0.4509804, 1,
1.399426, 1.196664, 0.7698106, 1, 0, 0.4431373, 1,
1.404861, -0.3495898, 2.221528, 1, 0, 0.4392157, 1,
1.42762, -0.2131142, 0.6650882, 1, 0, 0.4313726, 1,
1.430576, -1.369156, 3.01411, 1, 0, 0.427451, 1,
1.433512, 0.4080027, 0.1200675, 1, 0, 0.4196078, 1,
1.434348, -1.308931, 1.771235, 1, 0, 0.4156863, 1,
1.446738, 0.7751845, 1.622011, 1, 0, 0.4078431, 1,
1.474213, 1.146936, 2.166694, 1, 0, 0.4039216, 1,
1.475614, 1.216698, 2.877177, 1, 0, 0.3960784, 1,
1.501308, 0.4226246, 2.254035, 1, 0, 0.3882353, 1,
1.511607, -0.7758107, 1.486524, 1, 0, 0.3843137, 1,
1.516094, -1.160482, 1.893171, 1, 0, 0.3764706, 1,
1.517336, -0.5281085, 0.02541356, 1, 0, 0.372549, 1,
1.559483, 0.1958581, 2.487832, 1, 0, 0.3647059, 1,
1.563755, -0.3971132, 4.178964, 1, 0, 0.3607843, 1,
1.57252, 0.9127325, -0.448471, 1, 0, 0.3529412, 1,
1.580265, -3.164006, 2.47276, 1, 0, 0.3490196, 1,
1.588367, -0.6625468, 2.05813, 1, 0, 0.3411765, 1,
1.599414, 0.5186654, 0.6582697, 1, 0, 0.3372549, 1,
1.617128, -1.67463, 2.224723, 1, 0, 0.3294118, 1,
1.623559, -0.4136519, 3.70159, 1, 0, 0.3254902, 1,
1.633749, 2.398573, 0.8936864, 1, 0, 0.3176471, 1,
1.63422, 0.3080572, -0.2670546, 1, 0, 0.3137255, 1,
1.634463, 0.2086007, -1.686479, 1, 0, 0.3058824, 1,
1.645025, -0.5655004, 2.068286, 1, 0, 0.2980392, 1,
1.648125, 1.145018, 0.5190608, 1, 0, 0.2941177, 1,
1.651625, -0.03833291, 2.117451, 1, 0, 0.2862745, 1,
1.653364, -1.635225, 2.715211, 1, 0, 0.282353, 1,
1.653988, -0.2930764, 2.131957, 1, 0, 0.2745098, 1,
1.658173, -1.534265, 3.077694, 1, 0, 0.2705882, 1,
1.666993, -0.6301253, 0.6536857, 1, 0, 0.2627451, 1,
1.667032, 1.991804, 0.6605121, 1, 0, 0.2588235, 1,
1.681698, -1.150112, 0.9297736, 1, 0, 0.2509804, 1,
1.70202, -0.3494274, 2.103242, 1, 0, 0.2470588, 1,
1.720321, -0.00746782, 2.239283, 1, 0, 0.2392157, 1,
1.723144, -0.0796866, 1.560718, 1, 0, 0.2352941, 1,
1.744889, -0.4193526, -0.4014972, 1, 0, 0.227451, 1,
1.749942, -0.1260434, 1.528755, 1, 0, 0.2235294, 1,
1.766702, -0.6329851, 2.99818, 1, 0, 0.2156863, 1,
1.774617, 0.6054243, -0.5633603, 1, 0, 0.2117647, 1,
1.790339, 0.2748711, 1.571919, 1, 0, 0.2039216, 1,
1.80763, -0.06195599, 0.8224783, 1, 0, 0.1960784, 1,
1.816058, 0.1702479, 1.722365, 1, 0, 0.1921569, 1,
1.818468, -0.5610717, 1.747751, 1, 0, 0.1843137, 1,
1.846653, 0.6469769, 0.852394, 1, 0, 0.1803922, 1,
1.881536, 0.4257372, 1.472037, 1, 0, 0.172549, 1,
1.892643, 0.8800708, 0.8404172, 1, 0, 0.1686275, 1,
1.932451, 0.5101489, 0.8651467, 1, 0, 0.1607843, 1,
1.949731, 0.1601198, 1.577681, 1, 0, 0.1568628, 1,
1.962522, 0.4572953, 2.373161, 1, 0, 0.1490196, 1,
1.979499, -2.235748, 2.154695, 1, 0, 0.145098, 1,
1.981748, 1.434775, 0.4938106, 1, 0, 0.1372549, 1,
2.017205, -1.058857, 3.907434, 1, 0, 0.1333333, 1,
2.018894, 3.626673, 0.6717131, 1, 0, 0.1254902, 1,
2.053393, 0.9636165, -0.6743424, 1, 0, 0.1215686, 1,
2.076483, 0.1982949, 1.522102, 1, 0, 0.1137255, 1,
2.116071, -1.133793, 3.930195, 1, 0, 0.1098039, 1,
2.124007, 1.162158, -1.127676, 1, 0, 0.1019608, 1,
2.150142, -0.2353765, 2.623687, 1, 0, 0.09411765, 1,
2.172803, -0.6948272, 1.239762, 1, 0, 0.09019608, 1,
2.202147, 0.01519316, 0.4266723, 1, 0, 0.08235294, 1,
2.209533, -0.3324923, 2.036774, 1, 0, 0.07843138, 1,
2.229863, 1.275154, 1.398427, 1, 0, 0.07058824, 1,
2.313988, -1.472222, 1.521001, 1, 0, 0.06666667, 1,
2.325104, 0.8880019, 3.16926, 1, 0, 0.05882353, 1,
2.398914, -1.49023, 1.69692, 1, 0, 0.05490196, 1,
2.408919, 0.1537127, 1.790953, 1, 0, 0.04705882, 1,
2.409139, -1.572418, 2.10534, 1, 0, 0.04313726, 1,
2.422288, -0.4486669, 1.704321, 1, 0, 0.03529412, 1,
2.427644, 0.1265073, 1.370041, 1, 0, 0.03137255, 1,
2.435705, 1.067332, 1.546256, 1, 0, 0.02352941, 1,
2.603538, -0.4145452, 3.37043, 1, 0, 0.01960784, 1,
2.721149, -0.7718641, 0.7391751, 1, 0, 0.01176471, 1,
3.105827, -1.381459, 3.173684, 1, 0, 0.007843138, 1
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
-0.01391304, -5.008665, -7.176878, 0, -0.5, 0.5, 0.5,
-0.01391304, -5.008665, -7.176878, 1, -0.5, 0.5, 0.5,
-0.01391304, -5.008665, -7.176878, 1, 1.5, 0.5, 0.5,
-0.01391304, -5.008665, -7.176878, 0, 1.5, 0.5, 0.5
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
-4.191246, -0.06521988, -7.176878, 0, -0.5, 0.5, 0.5,
-4.191246, -0.06521988, -7.176878, 1, -0.5, 0.5, 0.5,
-4.191246, -0.06521988, -7.176878, 1, 1.5, 0.5, 0.5,
-4.191246, -0.06521988, -7.176878, 0, 1.5, 0.5, 0.5
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
-4.191246, -5.008665, 0.1477008, 0, -0.5, 0.5, 0.5,
-4.191246, -5.008665, 0.1477008, 1, -0.5, 0.5, 0.5,
-4.191246, -5.008665, 0.1477008, 1, 1.5, 0.5, 0.5,
-4.191246, -5.008665, 0.1477008, 0, 1.5, 0.5, 0.5
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
-3, -3.86787, -5.486591,
3, -3.86787, -5.486591,
-3, -3.86787, -5.486591,
-3, -4.058002, -5.768306,
-2, -3.86787, -5.486591,
-2, -4.058002, -5.768306,
-1, -3.86787, -5.486591,
-1, -4.058002, -5.768306,
0, -3.86787, -5.486591,
0, -4.058002, -5.768306,
1, -3.86787, -5.486591,
1, -4.058002, -5.768306,
2, -3.86787, -5.486591,
2, -4.058002, -5.768306,
3, -3.86787, -5.486591,
3, -4.058002, -5.768306
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
-3, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
-3, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
-3, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
-3, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5,
-2, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
-2, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
-2, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
-2, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5,
-1, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
-1, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
-1, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
-1, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5,
0, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
0, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
0, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
0, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5,
1, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
1, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
1, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
1, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5,
2, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
2, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
2, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
2, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5,
3, -4.438268, -6.331735, 0, -0.5, 0.5, 0.5,
3, -4.438268, -6.331735, 1, -0.5, 0.5, 0.5,
3, -4.438268, -6.331735, 1, 1.5, 0.5, 0.5,
3, -4.438268, -6.331735, 0, 1.5, 0.5, 0.5
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
-3.227246, -2, -5.486591,
-3.227246, 2, -5.486591,
-3.227246, -2, -5.486591,
-3.387912, -2, -5.768306,
-3.227246, 0, -5.486591,
-3.387912, 0, -5.768306,
-3.227246, 2, -5.486591,
-3.387912, 2, -5.768306
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
-3.709245, -2, -6.331735, 0, -0.5, 0.5, 0.5,
-3.709245, -2, -6.331735, 1, -0.5, 0.5, 0.5,
-3.709245, -2, -6.331735, 1, 1.5, 0.5, 0.5,
-3.709245, -2, -6.331735, 0, 1.5, 0.5, 0.5,
-3.709245, 0, -6.331735, 0, -0.5, 0.5, 0.5,
-3.709245, 0, -6.331735, 1, -0.5, 0.5, 0.5,
-3.709245, 0, -6.331735, 1, 1.5, 0.5, 0.5,
-3.709245, 0, -6.331735, 0, 1.5, 0.5, 0.5,
-3.709245, 2, -6.331735, 0, -0.5, 0.5, 0.5,
-3.709245, 2, -6.331735, 1, -0.5, 0.5, 0.5,
-3.709245, 2, -6.331735, 1, 1.5, 0.5, 0.5,
-3.709245, 2, -6.331735, 0, 1.5, 0.5, 0.5
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
-3.227246, -3.86787, -4,
-3.227246, -3.86787, 4,
-3.227246, -3.86787, -4,
-3.387912, -4.058002, -4,
-3.227246, -3.86787, -2,
-3.387912, -4.058002, -2,
-3.227246, -3.86787, 0,
-3.387912, -4.058002, 0,
-3.227246, -3.86787, 2,
-3.387912, -4.058002, 2,
-3.227246, -3.86787, 4,
-3.387912, -4.058002, 4
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
-3.709245, -4.438268, -4, 0, -0.5, 0.5, 0.5,
-3.709245, -4.438268, -4, 1, -0.5, 0.5, 0.5,
-3.709245, -4.438268, -4, 1, 1.5, 0.5, 0.5,
-3.709245, -4.438268, -4, 0, 1.5, 0.5, 0.5,
-3.709245, -4.438268, -2, 0, -0.5, 0.5, 0.5,
-3.709245, -4.438268, -2, 1, -0.5, 0.5, 0.5,
-3.709245, -4.438268, -2, 1, 1.5, 0.5, 0.5,
-3.709245, -4.438268, -2, 0, 1.5, 0.5, 0.5,
-3.709245, -4.438268, 0, 0, -0.5, 0.5, 0.5,
-3.709245, -4.438268, 0, 1, -0.5, 0.5, 0.5,
-3.709245, -4.438268, 0, 1, 1.5, 0.5, 0.5,
-3.709245, -4.438268, 0, 0, 1.5, 0.5, 0.5,
-3.709245, -4.438268, 2, 0, -0.5, 0.5, 0.5,
-3.709245, -4.438268, 2, 1, -0.5, 0.5, 0.5,
-3.709245, -4.438268, 2, 1, 1.5, 0.5, 0.5,
-3.709245, -4.438268, 2, 0, 1.5, 0.5, 0.5,
-3.709245, -4.438268, 4, 0, -0.5, 0.5, 0.5,
-3.709245, -4.438268, 4, 1, -0.5, 0.5, 0.5,
-3.709245, -4.438268, 4, 1, 1.5, 0.5, 0.5,
-3.709245, -4.438268, 4, 0, 1.5, 0.5, 0.5
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
-3.227246, -3.86787, -5.486591,
-3.227246, 3.73743, -5.486591,
-3.227246, -3.86787, 5.781992,
-3.227246, 3.73743, 5.781992,
-3.227246, -3.86787, -5.486591,
-3.227246, -3.86787, 5.781992,
-3.227246, 3.73743, -5.486591,
-3.227246, 3.73743, 5.781992,
-3.227246, -3.86787, -5.486591,
3.199419, -3.86787, -5.486591,
-3.227246, -3.86787, 5.781992,
3.199419, -3.86787, 5.781992,
-3.227246, 3.73743, -5.486591,
3.199419, 3.73743, -5.486591,
-3.227246, 3.73743, 5.781992,
3.199419, 3.73743, 5.781992,
3.199419, -3.86787, -5.486591,
3.199419, 3.73743, -5.486591,
3.199419, -3.86787, 5.781992,
3.199419, 3.73743, 5.781992,
3.199419, -3.86787, -5.486591,
3.199419, -3.86787, 5.781992,
3.199419, 3.73743, -5.486591,
3.199419, 3.73743, 5.781992
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
var radius = 8.029683;
var distance = 35.72497;
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
mvMatrix.translate( 0.01391304, 0.06521988, -0.1477008 );
mvMatrix.scale( 1.350911, 1.141553, 0.7704474 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.72497);
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
indeno[1,2-e][1,3,4]<-read.table("indeno[1,2-e][1,3,4].xyz")
```

```
## Error in read.table("indeno[1,2-e][1,3,4].xyz"): no lines available in input
```

```r
x<-indeno[1,2-e][1,3,4]$V2
```

```
## Error in eval(expr, envir, enclos): object 'indeno' not found
```

```r
y<-indeno[1,2-e][1,3,4]$V3
```

```
## Error in eval(expr, envir, enclos): object 'indeno' not found
```

```r
z<-indeno[1,2-e][1,3,4]$V4
```

```
## Error in eval(expr, envir, enclos): object 'indeno' not found
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
-3.133653, 1.945986, -1.802137, 0, 0, 1, 1, 1,
-2.564786, 0.3955023, -1.144747, 1, 0, 0, 1, 1,
-2.472893, -1.691834, -1.364116, 1, 0, 0, 1, 1,
-2.465553, 0.5935584, -2.905416, 1, 0, 0, 1, 1,
-2.399595, -0.03108378, -1.131868, 1, 0, 0, 1, 1,
-2.366388, -1.70946, -3.814338, 1, 0, 0, 1, 1,
-2.359237, 0.2456492, -2.550354, 0, 0, 0, 1, 1,
-2.348908, 1.325092, -2.007046, 0, 0, 0, 1, 1,
-2.264602, 0.09727232, -3.121171, 0, 0, 0, 1, 1,
-2.239398, 0.7114313, -1.582857, 0, 0, 0, 1, 1,
-2.227041, -0.1191714, -1.91127, 0, 0, 0, 1, 1,
-2.210242, 0.4430116, -1.027488, 0, 0, 0, 1, 1,
-2.205554, 1.031661, -0.8715784, 0, 0, 0, 1, 1,
-2.16071, -0.01467117, -1.255019, 1, 1, 1, 1, 1,
-2.139895, 1.0946, 0.536019, 1, 1, 1, 1, 1,
-2.12306, -0.1635503, -1.171281, 1, 1, 1, 1, 1,
-2.061355, 1.471892, 0.08006892, 1, 1, 1, 1, 1,
-2.025764, -0.9693664, -2.23733, 1, 1, 1, 1, 1,
-2.01651, -0.8634159, -1.675869, 1, 1, 1, 1, 1,
-1.99955, -0.4013831, -0.8384123, 1, 1, 1, 1, 1,
-1.986711, 0.3770486, -2.157113, 1, 1, 1, 1, 1,
-1.983561, -1.400938, -2.267085, 1, 1, 1, 1, 1,
-1.930205, 0.5338213, -2.6368, 1, 1, 1, 1, 1,
-1.902471, -1.560889, -2.167573, 1, 1, 1, 1, 1,
-1.897747, 1.538201, -2.382578, 1, 1, 1, 1, 1,
-1.869416, 0.7283694, -0.9707232, 1, 1, 1, 1, 1,
-1.863602, 1.850067, -0.003216494, 1, 1, 1, 1, 1,
-1.845688, 0.01985118, -2.837476, 1, 1, 1, 1, 1,
-1.837033, 0.2706011, -1.685023, 0, 0, 1, 1, 1,
-1.823175, -1.526463, -1.772185, 1, 0, 0, 1, 1,
-1.801853, 1.063623, -3.099322, 1, 0, 0, 1, 1,
-1.790582, -0.6162626, -1.453854, 1, 0, 0, 1, 1,
-1.788246, 0.4830647, -0.5805217, 1, 0, 0, 1, 1,
-1.773482, 0.4654284, -3.483117, 1, 0, 0, 1, 1,
-1.762009, -0.09580451, -1.168239, 0, 0, 0, 1, 1,
-1.760208, 1.560294, 1.817412, 0, 0, 0, 1, 1,
-1.736831, -0.5754471, -1.513618, 0, 0, 0, 1, 1,
-1.72447, -0.0584843, -1.680966, 0, 0, 0, 1, 1,
-1.720453, -0.6404269, -0.6443909, 0, 0, 0, 1, 1,
-1.713352, -0.413666, -1.372615, 0, 0, 0, 1, 1,
-1.697988, -0.6265864, -0.2692074, 0, 0, 0, 1, 1,
-1.67446, 0.8775895, 0.3854799, 1, 1, 1, 1, 1,
-1.66936, 0.7549469, -1.237879, 1, 1, 1, 1, 1,
-1.666726, 0.6545973, 0.1903066, 1, 1, 1, 1, 1,
-1.661462, -1.14893, -2.026062, 1, 1, 1, 1, 1,
-1.653735, -0.1834021, -1.333737, 1, 1, 1, 1, 1,
-1.64335, -1.200633, -1.434967, 1, 1, 1, 1, 1,
-1.63922, -0.9351923, -3.559788, 1, 1, 1, 1, 1,
-1.617426, -0.6437949, -0.5156824, 1, 1, 1, 1, 1,
-1.606058, -0.2940534, -1.392346, 1, 1, 1, 1, 1,
-1.599731, -1.707762, -0.9577219, 1, 1, 1, 1, 1,
-1.584356, 0.3728558, -0.6301476, 1, 1, 1, 1, 1,
-1.570886, -1.195591, -3.298153, 1, 1, 1, 1, 1,
-1.568099, 0.699771, -2.464594, 1, 1, 1, 1, 1,
-1.559796, 0.8612543, -3.519826, 1, 1, 1, 1, 1,
-1.545599, -0.01618143, -0.6833149, 1, 1, 1, 1, 1,
-1.542662, 1.025771, -1.667643, 0, 0, 1, 1, 1,
-1.540909, 2.091736, -0.6545852, 1, 0, 0, 1, 1,
-1.531486, -0.9696146, -1.176492, 1, 0, 0, 1, 1,
-1.529639, -0.4816948, -0.6551643, 1, 0, 0, 1, 1,
-1.483332, 1.573483, 0.3601626, 1, 0, 0, 1, 1,
-1.475111, -0.4287596, -2.652587, 1, 0, 0, 1, 1,
-1.463644, 0.1138851, -2.039819, 0, 0, 0, 1, 1,
-1.463532, 2.853748, -0.80467, 0, 0, 0, 1, 1,
-1.458393, 1.674367, -2.849051, 0, 0, 0, 1, 1,
-1.445222, -0.6087503, -1.736157, 0, 0, 0, 1, 1,
-1.436652, 1.602926, -0.09403235, 0, 0, 0, 1, 1,
-1.42496, -1.212395, -2.367467, 0, 0, 0, 1, 1,
-1.424574, -1.030012, -1.610688, 0, 0, 0, 1, 1,
-1.41609, -0.5560948, -2.000706, 1, 1, 1, 1, 1,
-1.414411, 0.6104825, -0.7529083, 1, 1, 1, 1, 1,
-1.405968, -0.0594902, -2.124359, 1, 1, 1, 1, 1,
-1.398799, -0.621286, -3.071822, 1, 1, 1, 1, 1,
-1.398345, 0.06027299, -1.675793, 1, 1, 1, 1, 1,
-1.392753, 1.328386, -0.3804361, 1, 1, 1, 1, 1,
-1.382122, -1.546073, -3.55862, 1, 1, 1, 1, 1,
-1.368958, -0.9803588, -2.657033, 1, 1, 1, 1, 1,
-1.360576, 0.7742189, -0.6670669, 1, 1, 1, 1, 1,
-1.358263, 1.11513, 0.2168894, 1, 1, 1, 1, 1,
-1.353943, 1.183517, -0.8297806, 1, 1, 1, 1, 1,
-1.345412, -0.2740797, -0.293759, 1, 1, 1, 1, 1,
-1.344412, -0.962647, -2.261297, 1, 1, 1, 1, 1,
-1.338241, -0.777231, -2.249381, 1, 1, 1, 1, 1,
-1.331029, -1.264099, -3.275278, 1, 1, 1, 1, 1,
-1.32495, -1.415815, -3.095222, 0, 0, 1, 1, 1,
-1.313841, 0.4058876, -2.996024, 1, 0, 0, 1, 1,
-1.312711, -0.3770573, -1.465744, 1, 0, 0, 1, 1,
-1.306171, -1.436759, -3.996629, 1, 0, 0, 1, 1,
-1.292768, -1.217844, -2.996044, 1, 0, 0, 1, 1,
-1.283581, 1.184111, -1.014191, 1, 0, 0, 1, 1,
-1.276873, -0.4098851, -2.084678, 0, 0, 0, 1, 1,
-1.27599, -0.1453449, -1.773657, 0, 0, 0, 1, 1,
-1.275247, -0.765233, -2.656562, 0, 0, 0, 1, 1,
-1.270675, -1.375948, -2.000547, 0, 0, 0, 1, 1,
-1.269852, -0.5778181, -1.190265, 0, 0, 0, 1, 1,
-1.26222, 0.6563671, -2.314939, 0, 0, 0, 1, 1,
-1.242769, 0.6626942, -1.835628, 0, 0, 0, 1, 1,
-1.234107, -0.3429893, -1.899024, 1, 1, 1, 1, 1,
-1.223994, 1.173143, -0.06925504, 1, 1, 1, 1, 1,
-1.219809, 1.765939, 0.6091031, 1, 1, 1, 1, 1,
-1.219365, -1.206618, -2.063731, 1, 1, 1, 1, 1,
-1.219172, 0.2795225, -1.981447, 1, 1, 1, 1, 1,
-1.217814, -0.7053413, -2.989889, 1, 1, 1, 1, 1,
-1.204435, -1.274912, -4.001204, 1, 1, 1, 1, 1,
-1.202919, 0.2278977, -1.830839, 1, 1, 1, 1, 1,
-1.202809, 1.586823, -0.3305673, 1, 1, 1, 1, 1,
-1.198174, -1.201038, -1.829372, 1, 1, 1, 1, 1,
-1.197444, -0.8698005, -2.32873, 1, 1, 1, 1, 1,
-1.197139, 2.94038, -1.317288, 1, 1, 1, 1, 1,
-1.194425, 0.4995441, -0.6871384, 1, 1, 1, 1, 1,
-1.194192, 2.238523, 0.6147755, 1, 1, 1, 1, 1,
-1.192048, -0.2439261, -2.493796, 1, 1, 1, 1, 1,
-1.189315, 1.044163, -0.1886955, 0, 0, 1, 1, 1,
-1.187373, -0.8046152, -3.445494, 1, 0, 0, 1, 1,
-1.179192, -0.5308811, -2.073697, 1, 0, 0, 1, 1,
-1.177082, -1.237721, -1.482093, 1, 0, 0, 1, 1,
-1.170067, -0.01337429, -0.1354033, 1, 0, 0, 1, 1,
-1.166625, 0.3693049, -1.605439, 1, 0, 0, 1, 1,
-1.163663, -0.5281471, -1.203387, 0, 0, 0, 1, 1,
-1.157505, 0.7996145, -1.366228, 0, 0, 0, 1, 1,
-1.14685, -0.3364559, -2.731585, 0, 0, 0, 1, 1,
-1.145795, 0.9559323, -1.188015, 0, 0, 0, 1, 1,
-1.138929, 0.8086843, 0.2322491, 0, 0, 0, 1, 1,
-1.136608, -0.4780792, -2.232084, 0, 0, 0, 1, 1,
-1.133513, -1.967985, -1.446871, 0, 0, 0, 1, 1,
-1.128104, 0.9908529, -0.7354174, 1, 1, 1, 1, 1,
-1.127835, -0.004109391, -1.495932, 1, 1, 1, 1, 1,
-1.125223, 1.599745, -1.134439, 1, 1, 1, 1, 1,
-1.114, 0.3930518, -0.2750212, 1, 1, 1, 1, 1,
-1.111754, 0.8983008, -1.234236, 1, 1, 1, 1, 1,
-1.101341, -0.1070285, -1.22068, 1, 1, 1, 1, 1,
-1.100312, 0.2386333, -1.060197, 1, 1, 1, 1, 1,
-1.100115, -0.04892448, -0.521781, 1, 1, 1, 1, 1,
-1.094438, 0.2809184, 0.6405339, 1, 1, 1, 1, 1,
-1.090156, -0.1626537, -3.416719, 1, 1, 1, 1, 1,
-1.087877, 0.1788774, -2.156065, 1, 1, 1, 1, 1,
-1.07802, 2.267912, 1.155558, 1, 1, 1, 1, 1,
-1.077746, -0.4754019, -1.444086, 1, 1, 1, 1, 1,
-1.077612, -0.2020205, -2.767509, 1, 1, 1, 1, 1,
-1.069981, -1.803087, -3.649528, 1, 1, 1, 1, 1,
-1.068049, -1.491094, -2.220531, 0, 0, 1, 1, 1,
-1.067616, -0.1974249, -3.051187, 1, 0, 0, 1, 1,
-1.064967, -0.01694535, -0.9511253, 1, 0, 0, 1, 1,
-1.058752, 0.7493848, -1.593643, 1, 0, 0, 1, 1,
-1.056515, -0.465082, -2.682343, 1, 0, 0, 1, 1,
-1.052368, -0.0102178, 0.3836695, 1, 0, 0, 1, 1,
-1.035039, 0.3297053, -1.923551, 0, 0, 0, 1, 1,
-1.034799, -0.04505194, -1.104844, 0, 0, 0, 1, 1,
-1.030183, -0.1939976, -1.982412, 0, 0, 0, 1, 1,
-1.022337, -0.13106, -2.142522, 0, 0, 0, 1, 1,
-1.019741, 0.3670598, -0.6796232, 0, 0, 0, 1, 1,
-1.019246, 0.1026922, -0.9953384, 0, 0, 0, 1, 1,
-1.002467, 0.4078861, 0.07393541, 0, 0, 0, 1, 1,
-1.002371, -0.7711985, -2.989264, 1, 1, 1, 1, 1,
-0.993429, -0.2393471, -1.439548, 1, 1, 1, 1, 1,
-0.9840185, -1.092487, -1.449574, 1, 1, 1, 1, 1,
-0.9839455, 0.2634019, -1.459705, 1, 1, 1, 1, 1,
-0.9779078, 0.2571331, -1.216285, 1, 1, 1, 1, 1,
-0.9686962, 0.8543345, -1.489229, 1, 1, 1, 1, 1,
-0.9574268, -0.4519251, -2.073728, 1, 1, 1, 1, 1,
-0.9537451, -0.844162, -2.603405, 1, 1, 1, 1, 1,
-0.9516845, 1.200116, -3.016353, 1, 1, 1, 1, 1,
-0.9473736, 0.2604365, -1.734855, 1, 1, 1, 1, 1,
-0.9473385, 0.8112648, 0.8732039, 1, 1, 1, 1, 1,
-0.9431351, 0.6305537, -2.618117, 1, 1, 1, 1, 1,
-0.9323168, 2.093221, -0.6623896, 1, 1, 1, 1, 1,
-0.9316425, -0.2825584, -1.564013, 1, 1, 1, 1, 1,
-0.9200517, 0.09993553, -2.385841, 1, 1, 1, 1, 1,
-0.9133861, -1.189373, 0.5950354, 0, 0, 1, 1, 1,
-0.9132054, -0.5719317, -2.704998, 1, 0, 0, 1, 1,
-0.9026145, 0.9938022, -0.9255315, 1, 0, 0, 1, 1,
-0.8920941, -1.691155, -1.907791, 1, 0, 0, 1, 1,
-0.8910162, 0.5786535, -0.715062, 1, 0, 0, 1, 1,
-0.8832971, 0.2892937, -1.475917, 1, 0, 0, 1, 1,
-0.8819051, 1.797073, -0.7241006, 0, 0, 0, 1, 1,
-0.868593, 1.343793, -1.419443, 0, 0, 0, 1, 1,
-0.8578563, -1.104982, -1.958149, 0, 0, 0, 1, 1,
-0.8561456, 0.08998484, -0.9121654, 0, 0, 0, 1, 1,
-0.8559324, 0.7010511, -0.7803358, 0, 0, 0, 1, 1,
-0.8557675, -0.5035222, -2.866488, 0, 0, 0, 1, 1,
-0.8550829, 0.315795, -1.536018, 0, 0, 0, 1, 1,
-0.8545986, 0.1691076, -2.538455, 1, 1, 1, 1, 1,
-0.8532625, 0.6223941, -0.6487072, 1, 1, 1, 1, 1,
-0.8513507, -0.1452117, -1.682483, 1, 1, 1, 1, 1,
-0.8504438, -0.761111, -3.033617, 1, 1, 1, 1, 1,
-0.8500085, -0.04087889, -2.266871, 1, 1, 1, 1, 1,
-0.8487729, 0.9185311, -1.658013, 1, 1, 1, 1, 1,
-0.8481569, 1.040133, 0.3892584, 1, 1, 1, 1, 1,
-0.8445463, -0.1632211, -1.47046, 1, 1, 1, 1, 1,
-0.8421492, -0.1124136, -2.442789, 1, 1, 1, 1, 1,
-0.8385872, 0.3198182, -1.877779, 1, 1, 1, 1, 1,
-0.8341021, -1.289695, -3.590824, 1, 1, 1, 1, 1,
-0.8324327, -0.8918285, -4.093783, 1, 1, 1, 1, 1,
-0.8273849, 1.012661, -0.1571962, 1, 1, 1, 1, 1,
-0.8226778, -0.1597213, -0.8951377, 1, 1, 1, 1, 1,
-0.8204129, 0.06021391, -0.376059, 1, 1, 1, 1, 1,
-0.8182482, -0.1720947, -2.648886, 0, 0, 1, 1, 1,
-0.8151437, 0.08921354, -1.681374, 1, 0, 0, 1, 1,
-0.8151295, -2.699614, -2.449955, 1, 0, 0, 1, 1,
-0.813756, 1.37336, -0.5986394, 1, 0, 0, 1, 1,
-0.8090304, 0.4635183, -1.013319, 1, 0, 0, 1, 1,
-0.8068352, 0.7622393, 0.05840997, 1, 0, 0, 1, 1,
-0.8029987, -0.6200007, -1.5726, 0, 0, 0, 1, 1,
-0.7942361, 0.3214956, -0.408254, 0, 0, 0, 1, 1,
-0.7924441, -1.935138, -3.812088, 0, 0, 0, 1, 1,
-0.7922339, 0.6425067, -0.3068558, 0, 0, 0, 1, 1,
-0.7890133, -2.956728, -2.886011, 0, 0, 0, 1, 1,
-0.7824031, -0.1794301, -2.434328, 0, 0, 0, 1, 1,
-0.7793562, -0.2498909, -2.439374, 0, 0, 0, 1, 1,
-0.7719737, -1.837072, -1.123111, 1, 1, 1, 1, 1,
-0.7663018, 0.093881, -0.8636646, 1, 1, 1, 1, 1,
-0.7653406, 0.636076, -0.6757635, 1, 1, 1, 1, 1,
-0.7648183, -0.2589827, -0.339702, 1, 1, 1, 1, 1,
-0.7629295, -0.1836022, -1.261662, 1, 1, 1, 1, 1,
-0.7599289, 0.07614033, -0.7385294, 1, 1, 1, 1, 1,
-0.7574685, 0.2870982, -1.059078, 1, 1, 1, 1, 1,
-0.7521361, -0.842768, -0.8006116, 1, 1, 1, 1, 1,
-0.7513248, 1.220052, -2.462522, 1, 1, 1, 1, 1,
-0.7508072, -0.7417209, -1.606547, 1, 1, 1, 1, 1,
-0.7499297, -0.8348292, -2.98041, 1, 1, 1, 1, 1,
-0.7483751, 0.03201093, -1.273543, 1, 1, 1, 1, 1,
-0.7473201, -1.556581, -2.517753, 1, 1, 1, 1, 1,
-0.7359812, -0.5245717, -2.29743, 1, 1, 1, 1, 1,
-0.7318762, 0.3756869, -1.401392, 1, 1, 1, 1, 1,
-0.7172234, -0.2891454, -0.3776089, 0, 0, 1, 1, 1,
-0.7160701, -0.08888532, -1.837914, 1, 0, 0, 1, 1,
-0.7039915, -1.047669, -3.550208, 1, 0, 0, 1, 1,
-0.7001877, 0.6828092, -1.218738, 1, 0, 0, 1, 1,
-0.6994339, -1.213389, -3.681246, 1, 0, 0, 1, 1,
-0.6988038, -0.1909543, -1.199052, 1, 0, 0, 1, 1,
-0.6930134, 0.7925661, -1.955668, 0, 0, 0, 1, 1,
-0.6925035, -0.4996327, -2.840493, 0, 0, 0, 1, 1,
-0.6912874, 1.238597, -0.2519895, 0, 0, 0, 1, 1,
-0.6903148, 1.978374, 1.113193, 0, 0, 0, 1, 1,
-0.6857852, 0.6252173, -1.224542, 0, 0, 0, 1, 1,
-0.6817645, 0.6867733, -1.170451, 0, 0, 0, 1, 1,
-0.6814881, 1.619516, 0.6888583, 0, 0, 0, 1, 1,
-0.6767216, -0.4786044, -0.3665006, 1, 1, 1, 1, 1,
-0.6741619, -1.239568, -2.123563, 1, 1, 1, 1, 1,
-0.6704764, 0.6029878, -2.370437, 1, 1, 1, 1, 1,
-0.6703017, -0.4851209, -1.079835, 1, 1, 1, 1, 1,
-0.6663559, 1.525888, -0.9055386, 1, 1, 1, 1, 1,
-0.6653349, -0.3108694, -1.707272, 1, 1, 1, 1, 1,
-0.6645598, -0.3307011, -2.807681, 1, 1, 1, 1, 1,
-0.6584294, 0.8276848, -1.531429, 1, 1, 1, 1, 1,
-0.6582593, 0.8250313, 0.05540106, 1, 1, 1, 1, 1,
-0.6551888, 0.6190262, -0.07908427, 1, 1, 1, 1, 1,
-0.6505457, 0.8535158, -2.14009, 1, 1, 1, 1, 1,
-0.6490965, -1.585773, -2.286353, 1, 1, 1, 1, 1,
-0.6462327, 1.502689, -0.7747489, 1, 1, 1, 1, 1,
-0.6452859, 0.05657233, -3.322376, 1, 1, 1, 1, 1,
-0.6441928, 0.4423483, -1.342669, 1, 1, 1, 1, 1,
-0.6435281, 0.7136056, -1.060658, 0, 0, 1, 1, 1,
-0.6344037, 0.3494173, -0.6692391, 1, 0, 0, 1, 1,
-0.6324173, 0.83891, 0.08363444, 1, 0, 0, 1, 1,
-0.6221079, 0.4503407, 0.5206788, 1, 0, 0, 1, 1,
-0.6178032, -0.9043096, -0.6076211, 1, 0, 0, 1, 1,
-0.6025412, -0.105592, -0.2117585, 1, 0, 0, 1, 1,
-0.6024984, -0.9754634, -3.196863, 0, 0, 0, 1, 1,
-0.595403, 1.592553, 1.570427, 0, 0, 0, 1, 1,
-0.5941469, 0.7821634, -1.243804, 0, 0, 0, 1, 1,
-0.589959, -0.8036329, -3.04373, 0, 0, 0, 1, 1,
-0.5879668, -0.3965488, -0.6034119, 0, 0, 0, 1, 1,
-0.587456, 0.4050033, 1.296745, 0, 0, 0, 1, 1,
-0.5872126, -1.40911, -2.768387, 0, 0, 0, 1, 1,
-0.5841904, -1.041834, -1.75258, 1, 1, 1, 1, 1,
-0.5830315, -1.716126, -0.733583, 1, 1, 1, 1, 1,
-0.582313, -0.8440253, -2.933152, 1, 1, 1, 1, 1,
-0.5803002, -0.243405, -3.644168, 1, 1, 1, 1, 1,
-0.5763139, 0.4764053, 0.2864853, 1, 1, 1, 1, 1,
-0.5742638, -2.356173, -2.260041, 1, 1, 1, 1, 1,
-0.5719504, -2.329729, -2.676746, 1, 1, 1, 1, 1,
-0.5714552, -2.696503, -4.058265, 1, 1, 1, 1, 1,
-0.5701234, -1.740941, -3.854293, 1, 1, 1, 1, 1,
-0.5694966, -2.657036, -3.426525, 1, 1, 1, 1, 1,
-0.5662384, -0.863953, -3.662195, 1, 1, 1, 1, 1,
-0.5656812, -1.110089, -4.355991, 1, 1, 1, 1, 1,
-0.5611045, -1.557471, -3.303544, 1, 1, 1, 1, 1,
-0.5603065, 0.7611498, -0.06259234, 1, 1, 1, 1, 1,
-0.5577954, -0.8947682, -2.572783, 1, 1, 1, 1, 1,
-0.551098, -1.651428, -3.455574, 0, 0, 1, 1, 1,
-0.5500429, 1.459956, -1.784052, 1, 0, 0, 1, 1,
-0.5471768, 0.2396702, 0.4193815, 1, 0, 0, 1, 1,
-0.5437456, -0.4039817, 0.270562, 1, 0, 0, 1, 1,
-0.5419949, 0.08104813, -2.578702, 1, 0, 0, 1, 1,
-0.5418614, -0.2978701, -1.251748, 1, 0, 0, 1, 1,
-0.5383118, -1.303183, -2.877072, 0, 0, 0, 1, 1,
-0.5372509, -0.8426554, -0.3508897, 0, 0, 0, 1, 1,
-0.533617, 1.929183, -1.841294, 0, 0, 0, 1, 1,
-0.5284239, 0.7278757, -1.116432, 0, 0, 0, 1, 1,
-0.5240062, 0.7771559, -1.839722, 0, 0, 0, 1, 1,
-0.5176672, -1.763405, -3.778403, 0, 0, 0, 1, 1,
-0.5173986, 0.9365899, -1.207686, 0, 0, 0, 1, 1,
-0.5158506, 1.207576, -0.1734603, 1, 1, 1, 1, 1,
-0.5137985, -2.170267, -2.424266, 1, 1, 1, 1, 1,
-0.5131608, -0.9961969, -2.902329, 1, 1, 1, 1, 1,
-0.510065, 0.7974182, -0.4285566, 1, 1, 1, 1, 1,
-0.5098615, 2.112759, 0.2920532, 1, 1, 1, 1, 1,
-0.5058267, -0.6677228, -3.476964, 1, 1, 1, 1, 1,
-0.5054598, -0.9069422, -3.895314, 1, 1, 1, 1, 1,
-0.5038407, 0.9856533, 0.8731917, 1, 1, 1, 1, 1,
-0.4968297, -0.3400285, -1.817358, 1, 1, 1, 1, 1,
-0.4929438, -1.183802, -1.287448, 1, 1, 1, 1, 1,
-0.4926138, -1.452984, -2.392449, 1, 1, 1, 1, 1,
-0.4876339, 0.2986503, -0.844399, 1, 1, 1, 1, 1,
-0.4834521, -0.06906714, -2.361924, 1, 1, 1, 1, 1,
-0.4802781, -1.456847, -3.170021, 1, 1, 1, 1, 1,
-0.4754827, 0.2767219, -0.3754008, 1, 1, 1, 1, 1,
-0.4745808, 1.230736, 0.5819591, 0, 0, 1, 1, 1,
-0.4721443, 1.4602, -0.5485956, 1, 0, 0, 1, 1,
-0.4710356, -1.318152, -2.310377, 1, 0, 0, 1, 1,
-0.4704767, 0.7582911, -1.726268, 1, 0, 0, 1, 1,
-0.4672438, 0.02007476, -1.242549, 1, 0, 0, 1, 1,
-0.4658144, 2.086678, -3.053395, 1, 0, 0, 1, 1,
-0.4629573, 0.0925846, -2.017463, 0, 0, 0, 1, 1,
-0.4627608, -0.05234808, 0.02988571, 0, 0, 0, 1, 1,
-0.4586312, -0.4681678, -2.827262, 0, 0, 0, 1, 1,
-0.4569027, -0.2811403, -0.780146, 0, 0, 0, 1, 1,
-0.4533626, 0.4928328, -0.3602381, 0, 0, 0, 1, 1,
-0.451448, -0.1572979, -3.504767, 0, 0, 0, 1, 1,
-0.4306309, -0.475454, -1.397996, 0, 0, 0, 1, 1,
-0.4280673, -1.019882, -1.240325, 1, 1, 1, 1, 1,
-0.426394, -0.6694767, -5.322485, 1, 1, 1, 1, 1,
-0.4262838, -1.277745, -2.355639, 1, 1, 1, 1, 1,
-0.4219539, -1.503957, -1.892489, 1, 1, 1, 1, 1,
-0.4215398, 0.4025156, 0.4306186, 1, 1, 1, 1, 1,
-0.4205164, 0.444131, -0.3146347, 1, 1, 1, 1, 1,
-0.4156214, -0.8400345, -2.900038, 1, 1, 1, 1, 1,
-0.4077821, 1.649671, -1.017414, 1, 1, 1, 1, 1,
-0.4068031, -0.1857748, -2.790652, 1, 1, 1, 1, 1,
-0.4036231, -1.938474, -1.989136, 1, 1, 1, 1, 1,
-0.3989571, 0.7409016, 0.07536817, 1, 1, 1, 1, 1,
-0.3963443, 0.8395469, 0.07596299, 1, 1, 1, 1, 1,
-0.3868954, -0.6177743, -1.872146, 1, 1, 1, 1, 1,
-0.3833964, -0.9811317, -2.458631, 1, 1, 1, 1, 1,
-0.3822723, 0.06194903, -2.008975, 1, 1, 1, 1, 1,
-0.381837, -2.207874, -2.094503, 0, 0, 1, 1, 1,
-0.3799217, -1.031064, -2.392531, 1, 0, 0, 1, 1,
-0.3791127, 0.7311258, 0.4313046, 1, 0, 0, 1, 1,
-0.3790798, 0.3946113, -0.1168598, 1, 0, 0, 1, 1,
-0.3790308, 0.7124637, -0.7540314, 1, 0, 0, 1, 1,
-0.376065, 1.07296, -0.4131334, 1, 0, 0, 1, 1,
-0.3748791, -0.02426701, -1.303026, 0, 0, 0, 1, 1,
-0.3745112, -0.5474219, -2.865854, 0, 0, 0, 1, 1,
-0.3694186, 0.4730646, 0.9629406, 0, 0, 0, 1, 1,
-0.3685787, 0.815164, 0.7908359, 0, 0, 0, 1, 1,
-0.3629722, 0.4040132, 0.3615523, 0, 0, 0, 1, 1,
-0.360043, -0.1529996, -1.05463, 0, 0, 0, 1, 1,
-0.3565786, -0.02731755, -0.9596171, 0, 0, 0, 1, 1,
-0.3513372, 0.8886637, -1.455921, 1, 1, 1, 1, 1,
-0.3493456, -0.2070827, -0.4510305, 1, 1, 1, 1, 1,
-0.3476412, 0.3020714, -0.6197777, 1, 1, 1, 1, 1,
-0.3464465, -0.810541, -1.775486, 1, 1, 1, 1, 1,
-0.3417103, 0.5622831, -1.94732, 1, 1, 1, 1, 1,
-0.341224, -0.8411978, -2.442185, 1, 1, 1, 1, 1,
-0.3404873, 0.6434348, -0.6779028, 1, 1, 1, 1, 1,
-0.3375697, 0.9198976, -1.084794, 1, 1, 1, 1, 1,
-0.3343587, 1.66404, -0.0977523, 1, 1, 1, 1, 1,
-0.334154, 0.7119786, -0.2208881, 1, 1, 1, 1, 1,
-0.3328032, 0.3090005, 0.5270232, 1, 1, 1, 1, 1,
-0.3322645, -0.80279, -2.574358, 1, 1, 1, 1, 1,
-0.3314712, -1.051972, -2.197466, 1, 1, 1, 1, 1,
-0.3301452, 1.042037, 1.651074, 1, 1, 1, 1, 1,
-0.3228847, -0.1203757, -1.811998, 1, 1, 1, 1, 1,
-0.3210064, 0.1032022, -2.277458, 0, 0, 1, 1, 1,
-0.3202861, -0.2069051, 0.5417285, 1, 0, 0, 1, 1,
-0.3194438, -0.3699968, -3.860732, 1, 0, 0, 1, 1,
-0.3104511, 0.11064, -1.23752, 1, 0, 0, 1, 1,
-0.3094263, 0.2176249, 0.1940576, 1, 0, 0, 1, 1,
-0.3062204, -0.3754288, -2.678857, 1, 0, 0, 1, 1,
-0.2989522, -1.227535, -3.415978, 0, 0, 0, 1, 1,
-0.2952901, 0.08541454, 0.9211831, 0, 0, 0, 1, 1,
-0.2943155, -1.20297, -3.116064, 0, 0, 0, 1, 1,
-0.2933834, 1.05165, 0.4772478, 0, 0, 0, 1, 1,
-0.2919023, -1.242444, -0.04250105, 0, 0, 0, 1, 1,
-0.2889928, -1.005609, -2.888655, 0, 0, 0, 1, 1,
-0.2848054, 0.2172202, 0.04856072, 0, 0, 0, 1, 1,
-0.2808583, 1.122535, 1.084435, 1, 1, 1, 1, 1,
-0.2807061, -2.731859, -2.872148, 1, 1, 1, 1, 1,
-0.2804961, 0.3635015, -1.181161, 1, 1, 1, 1, 1,
-0.2792373, -1.967795, -3.983458, 1, 1, 1, 1, 1,
-0.2751852, -0.207957, -2.095609, 1, 1, 1, 1, 1,
-0.2718208, 1.274727, 0.09454324, 1, 1, 1, 1, 1,
-0.2714753, 0.6508378, -1.016121, 1, 1, 1, 1, 1,
-0.2695776, 1.943196, 0.3925409, 1, 1, 1, 1, 1,
-0.2659915, 0.003575354, -0.4736235, 1, 1, 1, 1, 1,
-0.2611603, 0.6859202, -0.9723125, 1, 1, 1, 1, 1,
-0.2579149, 0.8602213, -0.3571438, 1, 1, 1, 1, 1,
-0.2575872, 1.391428, -0.302084, 1, 1, 1, 1, 1,
-0.2527196, 0.002584108, -1.874902, 1, 1, 1, 1, 1,
-0.2526982, 0.06082368, -0.5526045, 1, 1, 1, 1, 1,
-0.2501061, -1.141269, -2.343208, 1, 1, 1, 1, 1,
-0.247, 0.1717722, -1.492791, 0, 0, 1, 1, 1,
-0.2428581, -0.4501093, -3.300146, 1, 0, 0, 1, 1,
-0.2424055, 0.7292314, 1.210171, 1, 0, 0, 1, 1,
-0.2384701, -0.3213589, -2.888233, 1, 0, 0, 1, 1,
-0.2366046, -0.07352963, -0.4452733, 1, 0, 0, 1, 1,
-0.2362, 0.6202214, 0.5813433, 1, 0, 0, 1, 1,
-0.232159, 0.09885714, -1.220207, 0, 0, 0, 1, 1,
-0.2300673, -1.934829, -3.954804, 0, 0, 0, 1, 1,
-0.2272663, -1.104185, -4.318202, 0, 0, 0, 1, 1,
-0.2269322, 0.6408912, 0.0420711, 0, 0, 0, 1, 1,
-0.2264816, 0.3736018, 0.2712382, 0, 0, 0, 1, 1,
-0.2261786, -0.5060332, -2.316727, 0, 0, 0, 1, 1,
-0.2255808, 0.9610457, 1.043703, 0, 0, 0, 1, 1,
-0.2254129, -1.515161, -3.604722, 1, 1, 1, 1, 1,
-0.22178, -0.1152023, -2.553861, 1, 1, 1, 1, 1,
-0.2216013, -0.2843591, -4.591559, 1, 1, 1, 1, 1,
-0.2214408, -0.9005743, -3.348126, 1, 1, 1, 1, 1,
-0.2207876, -1.452462, -2.740823, 1, 1, 1, 1, 1,
-0.2197817, -0.5937775, -2.095002, 1, 1, 1, 1, 1,
-0.2194644, -1.222799, -2.839162, 1, 1, 1, 1, 1,
-0.2179643, -0.308787, -2.054883, 1, 1, 1, 1, 1,
-0.2096379, -0.434598, -3.214954, 1, 1, 1, 1, 1,
-0.2083439, -3.757113, -3.956074, 1, 1, 1, 1, 1,
-0.1929187, 0.7680566, -0.06737326, 1, 1, 1, 1, 1,
-0.1884585, -0.1751336, -3.599788, 1, 1, 1, 1, 1,
-0.1877474, 1.397934, -0.9508281, 1, 1, 1, 1, 1,
-0.187641, 0.2391017, -1.878727, 1, 1, 1, 1, 1,
-0.1809346, 0.873565, 0.3021337, 1, 1, 1, 1, 1,
-0.1802931, 1.131364, -0.3017297, 0, 0, 1, 1, 1,
-0.18028, -0.03844129, -0.9035568, 1, 0, 0, 1, 1,
-0.1801206, -2.949172, -2.65792, 1, 0, 0, 1, 1,
-0.1751864, 0.9202332, 0.1143699, 1, 0, 0, 1, 1,
-0.1740464, 1.347848, 0.3455484, 1, 0, 0, 1, 1,
-0.1653104, 1.632774, -0.5542731, 1, 0, 0, 1, 1,
-0.1575246, 0.4414976, 0.8860832, 0, 0, 0, 1, 1,
-0.1574716, -1.688621, -5.319821, 0, 0, 0, 1, 1,
-0.1517069, -0.6981954, -2.559087, 0, 0, 0, 1, 1,
-0.1509313, -0.7318925, -1.957677, 0, 0, 0, 1, 1,
-0.1501643, 0.1340774, -0.2536244, 0, 0, 0, 1, 1,
-0.149069, -0.1509764, -2.424598, 0, 0, 0, 1, 1,
-0.1481951, -0.5198418, -3.917366, 0, 0, 0, 1, 1,
-0.1464853, -1.11137, -2.593149, 1, 1, 1, 1, 1,
-0.1464833, 0.4553458, -0.7197299, 1, 1, 1, 1, 1,
-0.1428124, 0.988049, 0.6349263, 1, 1, 1, 1, 1,
-0.142121, 2.98973, 0.5943772, 1, 1, 1, 1, 1,
-0.1378507, 0.739086, -0.298787, 1, 1, 1, 1, 1,
-0.1374151, 1.129162, -0.248702, 1, 1, 1, 1, 1,
-0.1368466, -0.6489536, -2.77528, 1, 1, 1, 1, 1,
-0.1353066, 0.5339826, 0.759176, 1, 1, 1, 1, 1,
-0.1348283, 0.3105478, -1.076845, 1, 1, 1, 1, 1,
-0.1348239, -0.843832, -2.852021, 1, 1, 1, 1, 1,
-0.1346801, 1.168168, -2.452275, 1, 1, 1, 1, 1,
-0.1344264, 0.0866406, -1.383649, 1, 1, 1, 1, 1,
-0.1323497, 1.960551, -0.09461505, 1, 1, 1, 1, 1,
-0.1316291, 2.204805, 0.3847485, 1, 1, 1, 1, 1,
-0.1316197, 0.4502454, -0.1525199, 1, 1, 1, 1, 1,
-0.1246359, 2.007444, -0.1105282, 0, 0, 1, 1, 1,
-0.1245934, -0.112853, -2.721395, 1, 0, 0, 1, 1,
-0.1236507, 0.614586, -0.9316522, 1, 0, 0, 1, 1,
-0.1230508, 1.093483, -1.27032, 1, 0, 0, 1, 1,
-0.1171688, -0.6713409, -4.609691, 1, 0, 0, 1, 1,
-0.1159962, 1.033524, -0.5020495, 1, 0, 0, 1, 1,
-0.1118212, -0.7962034, -2.212457, 0, 0, 0, 1, 1,
-0.1094914, -0.08368064, -3.178155, 0, 0, 0, 1, 1,
-0.1092489, 0.1217588, -0.1558311, 0, 0, 0, 1, 1,
-0.1081448, -0.5571603, -3.630682, 0, 0, 0, 1, 1,
-0.1071963, -1.5674, -4.584507, 0, 0, 0, 1, 1,
-0.1066581, 0.1548721, 0.8843796, 0, 0, 0, 1, 1,
-0.1040739, -0.04713853, -2.718349, 0, 0, 0, 1, 1,
-0.09924559, -1.740386, -2.932345, 1, 1, 1, 1, 1,
-0.09710974, -3.055567, -3.992565, 1, 1, 1, 1, 1,
-0.0954892, 0.5487269, -3.063621, 1, 1, 1, 1, 1,
-0.09503466, -0.1030699, -2.399333, 1, 1, 1, 1, 1,
-0.09404682, 1.084737, 0.3350176, 1, 1, 1, 1, 1,
-0.09320521, -0.06814761, -2.465591, 1, 1, 1, 1, 1,
-0.09191641, 1.183542, 0.005440264, 1, 1, 1, 1, 1,
-0.09143348, 1.134924, -0.8464801, 1, 1, 1, 1, 1,
-0.08918251, -1.473627, -3.799285, 1, 1, 1, 1, 1,
-0.08646438, -0.1894826, -1.684234, 1, 1, 1, 1, 1,
-0.08472023, -0.6616985, -2.230816, 1, 1, 1, 1, 1,
-0.08128315, 1.062366, -1.435808, 1, 1, 1, 1, 1,
-0.0760004, -0.3122811, -1.914059, 1, 1, 1, 1, 1,
-0.06451543, -0.5858622, -2.15531, 1, 1, 1, 1, 1,
-0.06139303, 0.7097016, 0.6147923, 1, 1, 1, 1, 1,
-0.06070718, -0.1472408, -2.61533, 0, 0, 1, 1, 1,
-0.05359542, 0.2536378, -0.7289215, 1, 0, 0, 1, 1,
-0.05315492, 0.2632773, 0.2693675, 1, 0, 0, 1, 1,
-0.05255767, 0.492008, 0.2124829, 1, 0, 0, 1, 1,
-0.05115072, 1.010829, -0.4053168, 1, 0, 0, 1, 1,
-0.04695973, 0.6156203, 0.9721372, 1, 0, 0, 1, 1,
-0.0441394, 1.096298, -0.9700642, 0, 0, 0, 1, 1,
-0.03479216, 1.241127, 1.309059, 0, 0, 0, 1, 1,
-0.0302677, 0.9974905, 0.1322795, 0, 0, 0, 1, 1,
-0.03005547, -1.084699, -4.49578, 0, 0, 0, 1, 1,
-0.0275992, 1.376687, 0.01909344, 0, 0, 0, 1, 1,
-0.02660597, -0.09336388, -3.150975, 0, 0, 0, 1, 1,
-0.02279397, 0.1134303, -0.4995971, 0, 0, 0, 1, 1,
-0.0227458, -0.78171, -1.932947, 1, 1, 1, 1, 1,
-0.02035038, 1.387446, 1.679046, 1, 1, 1, 1, 1,
-0.01838262, -0.8600851, -2.686984, 1, 1, 1, 1, 1,
-0.0157956, -1.435793, -2.272115, 1, 1, 1, 1, 1,
-0.01540509, -1.695032, -2.981584, 1, 1, 1, 1, 1,
-0.01482101, 1.030377, 0.3978128, 1, 1, 1, 1, 1,
-0.01300499, 0.3065571, 0.89848, 1, 1, 1, 1, 1,
-0.01220073, 1.346497, -0.6457636, 1, 1, 1, 1, 1,
-0.01168682, 0.03528102, -0.6994373, 1, 1, 1, 1, 1,
-0.01056542, -0.4827763, -2.306106, 1, 1, 1, 1, 1,
-0.007523539, 1.107447, 2.325784, 1, 1, 1, 1, 1,
-0.005860317, 1.144264, 0.6089236, 1, 1, 1, 1, 1,
-0.002165991, 0.5091673, -0.7770978, 1, 1, 1, 1, 1,
0.001233102, -0.3371924, 1.592087, 1, 1, 1, 1, 1,
0.003414047, -0.8278496, 3.094594, 1, 1, 1, 1, 1,
0.003430879, -0.3348796, 4.347512, 0, 0, 1, 1, 1,
0.00663452, -0.2707326, 2.915881, 1, 0, 0, 1, 1,
0.0116996, 1.340745, -0.9600536, 1, 0, 0, 1, 1,
0.0172961, -0.3354297, 2.371212, 1, 0, 0, 1, 1,
0.01858546, -1.062953, 5.617887, 1, 0, 0, 1, 1,
0.02274177, 1.561411, 1.223139, 1, 0, 0, 1, 1,
0.02549381, 1.121544, -0.326008, 0, 0, 0, 1, 1,
0.02569431, -0.4070703, 3.266476, 0, 0, 0, 1, 1,
0.02707807, -0.9429432, 2.814646, 0, 0, 0, 1, 1,
0.02842262, -1.313698, 2.406543, 0, 0, 0, 1, 1,
0.03319852, 1.75187, 0.3990897, 0, 0, 0, 1, 1,
0.03411391, 0.1477078, -0.540246, 0, 0, 0, 1, 1,
0.04280652, -0.7533236, 3.099499, 0, 0, 0, 1, 1,
0.04355904, -0.02176954, 4.478025, 1, 1, 1, 1, 1,
0.04496666, 0.9029697, -0.6226221, 1, 1, 1, 1, 1,
0.04683339, 1.369787, -0.5549878, 1, 1, 1, 1, 1,
0.04962501, 1.61911, -1.29604, 1, 1, 1, 1, 1,
0.04970862, 0.3577135, -0.5748289, 1, 1, 1, 1, 1,
0.05028523, 0.04018924, -0.2884561, 1, 1, 1, 1, 1,
0.05165646, -1.921912, 4.314723, 1, 1, 1, 1, 1,
0.05247497, -1.537397, 3.512037, 1, 1, 1, 1, 1,
0.05537863, 1.7738, -0.8457879, 1, 1, 1, 1, 1,
0.06063982, -0.2974064, 2.340621, 1, 1, 1, 1, 1,
0.06238053, 0.1721645, -0.5930745, 1, 1, 1, 1, 1,
0.06324135, -0.08833875, 3.698916, 1, 1, 1, 1, 1,
0.0669741, -0.02723308, 1.471454, 1, 1, 1, 1, 1,
0.0672441, -0.1070463, 1.869318, 1, 1, 1, 1, 1,
0.06738445, 0.1432927, 1.686352, 1, 1, 1, 1, 1,
0.06905616, -0.0940725, 2.321113, 0, 0, 1, 1, 1,
0.06980866, -0.04991206, 1.051876, 1, 0, 0, 1, 1,
0.07148971, 1.144335, 1.045241, 1, 0, 0, 1, 1,
0.08408162, -2.083776, 1.951501, 1, 0, 0, 1, 1,
0.0863921, -0.3158604, 2.130267, 1, 0, 0, 1, 1,
0.0876859, -0.5898634, 1.797805, 1, 0, 0, 1, 1,
0.08814593, -0.226405, 4.265782, 0, 0, 0, 1, 1,
0.08942228, -1.049183, 3.843476, 0, 0, 0, 1, 1,
0.09020343, -0.7811893, 3.695485, 0, 0, 0, 1, 1,
0.09314336, -0.08808565, 1.978714, 0, 0, 0, 1, 1,
0.1041199, 0.8297969, -0.3729702, 0, 0, 0, 1, 1,
0.1080414, -0.3054766, 2.254161, 0, 0, 0, 1, 1,
0.1091826, -0.2784941, 2.224247, 0, 0, 0, 1, 1,
0.1127028, -0.04772535, 2.273232, 1, 1, 1, 1, 1,
0.1144924, -0.5654176, 3.457571, 1, 1, 1, 1, 1,
0.1169986, 0.7954937, 1.363691, 1, 1, 1, 1, 1,
0.121047, -0.3649022, 3.457138, 1, 1, 1, 1, 1,
0.1220655, -0.6902198, 2.954682, 1, 1, 1, 1, 1,
0.1252061, 0.3953049, 0.1388988, 1, 1, 1, 1, 1,
0.1267203, -1.453327, 5.562733, 1, 1, 1, 1, 1,
0.1300465, -1.628035, 3.600597, 1, 1, 1, 1, 1,
0.1330115, 0.5988313, -0.8906211, 1, 1, 1, 1, 1,
0.1330668, -0.2313955, 2.296251, 1, 1, 1, 1, 1,
0.1332487, -1.618799, 2.788136, 1, 1, 1, 1, 1,
0.1356047, 0.2314867, 0.8350092, 1, 1, 1, 1, 1,
0.1367009, 0.4373714, 0.3322277, 1, 1, 1, 1, 1,
0.13884, 1.69443, -0.8478288, 1, 1, 1, 1, 1,
0.1459205, -0.2137599, 3.377326, 1, 1, 1, 1, 1,
0.1474307, -0.7110064, 2.649005, 0, 0, 1, 1, 1,
0.1503127, 0.5674613, 1.134797, 1, 0, 0, 1, 1,
0.1506514, 0.1672456, -0.5325781, 1, 0, 0, 1, 1,
0.1516868, 0.8513612, 0.4574588, 1, 0, 0, 1, 1,
0.1527293, -0.6938526, 3.093671, 1, 0, 0, 1, 1,
0.1536251, -1.023181, 2.621834, 1, 0, 0, 1, 1,
0.1590001, -0.3621807, 3.080518, 0, 0, 0, 1, 1,
0.1598377, -0.5929308, 1.40625, 0, 0, 0, 1, 1,
0.1602599, 0.6002744, 1.21564, 0, 0, 0, 1, 1,
0.1619305, 0.5896178, -0.5393727, 0, 0, 0, 1, 1,
0.1638641, 0.2981367, 2.110481, 0, 0, 0, 1, 1,
0.1638643, -1.628433, 1.807431, 0, 0, 0, 1, 1,
0.1644844, 0.1379827, 0.2172641, 0, 0, 0, 1, 1,
0.1669325, -1.737085, 2.708328, 1, 1, 1, 1, 1,
0.1687026, 0.5150533, 1.054719, 1, 1, 1, 1, 1,
0.169428, -0.3605486, 3.351903, 1, 1, 1, 1, 1,
0.1712296, -1.018827, 1.428128, 1, 1, 1, 1, 1,
0.1726928, -1.876687, 3.027327, 1, 1, 1, 1, 1,
0.1754937, 1.041805, 0.3374147, 1, 1, 1, 1, 1,
0.1793794, 1.76215, -1.379753, 1, 1, 1, 1, 1,
0.1882925, -0.08020689, 2.983973, 1, 1, 1, 1, 1,
0.1887465, -0.2906553, 0.5964255, 1, 1, 1, 1, 1,
0.1910525, -0.4214039, 3.300247, 1, 1, 1, 1, 1,
0.1940254, 0.2758302, 0.3539008, 1, 1, 1, 1, 1,
0.1965145, -1.487996, 2.405078, 1, 1, 1, 1, 1,
0.1978085, 1.088373, 1.024917, 1, 1, 1, 1, 1,
0.1998215, 1.105249, 0.8904186, 1, 1, 1, 1, 1,
0.2018294, 0.7783257, 0.2214064, 1, 1, 1, 1, 1,
0.2025082, 0.1566886, 0.659593, 0, 0, 1, 1, 1,
0.2028169, 0.5228155, 0.4168065, 1, 0, 0, 1, 1,
0.2029469, -1.897895, 1.59447, 1, 0, 0, 1, 1,
0.2037433, 0.262185, 0.9978982, 1, 0, 0, 1, 1,
0.2040173, -0.314068, 3.516997, 1, 0, 0, 1, 1,
0.2043287, 0.4099749, 0.1992291, 1, 0, 0, 1, 1,
0.2066928, -0.6173497, 3.552086, 0, 0, 0, 1, 1,
0.2076145, -0.1338221, 2.560333, 0, 0, 0, 1, 1,
0.2094731, -0.07584514, 3.497406, 0, 0, 0, 1, 1,
0.2234425, -1.762547, 3.551412, 0, 0, 0, 1, 1,
0.2279869, -0.3417004, 2.307754, 0, 0, 0, 1, 1,
0.2297106, -0.02517692, 1.80778, 0, 0, 0, 1, 1,
0.2351438, -0.4713497, 3.340018, 0, 0, 0, 1, 1,
0.2379663, -0.01500933, 1.281769, 1, 1, 1, 1, 1,
0.239339, 0.1151378, 1.683183, 1, 1, 1, 1, 1,
0.2398291, -0.6256793, 3.8848, 1, 1, 1, 1, 1,
0.2402174, -0.9310635, 5.148279, 1, 1, 1, 1, 1,
0.2419861, 0.1388031, 0.7171475, 1, 1, 1, 1, 1,
0.2426311, 0.3073688, 1.451515, 1, 1, 1, 1, 1,
0.2434689, -0.6215884, 2.86051, 1, 1, 1, 1, 1,
0.2471444, 0.1853618, 0.8518658, 1, 1, 1, 1, 1,
0.2488305, 1.468879, -0.7937148, 1, 1, 1, 1, 1,
0.2489355, 1.645519, -0.1068808, 1, 1, 1, 1, 1,
0.2501952, 0.05640569, 2.432854, 1, 1, 1, 1, 1,
0.2509595, -0.09982337, 3.153895, 1, 1, 1, 1, 1,
0.2553974, 0.1656216, -1.102188, 1, 1, 1, 1, 1,
0.2555574, -2.053016, 2.99506, 1, 1, 1, 1, 1,
0.2560628, -1.147137, 3.600833, 1, 1, 1, 1, 1,
0.2630252, -1.322426, 3.623224, 0, 0, 1, 1, 1,
0.2653643, 0.3138584, 1.555118, 1, 0, 0, 1, 1,
0.267505, 0.4793293, -1.537215, 1, 0, 0, 1, 1,
0.2679205, -1.780897, 1.66269, 1, 0, 0, 1, 1,
0.2701647, 1.6042, 1.124366, 1, 0, 0, 1, 1,
0.2771015, 0.2711563, 0.7626516, 1, 0, 0, 1, 1,
0.2788933, -1.267692, 2.310681, 0, 0, 0, 1, 1,
0.2814149, -1.506976, 2.195773, 0, 0, 0, 1, 1,
0.2821391, 1.913288, 0.2464887, 0, 0, 0, 1, 1,
0.285556, 0.5101216, 2.569614, 0, 0, 0, 1, 1,
0.2890652, -1.04984, 2.309019, 0, 0, 0, 1, 1,
0.2900336, -0.2975142, 2.276323, 0, 0, 0, 1, 1,
0.2965296, -0.8244959, 2.92055, 0, 0, 0, 1, 1,
0.3000278, -0.634378, 0.7275801, 1, 1, 1, 1, 1,
0.3043132, 1.156635, -0.06500863, 1, 1, 1, 1, 1,
0.3082478, -0.1498514, 2.896862, 1, 1, 1, 1, 1,
0.3130375, -0.7897848, 2.471265, 1, 1, 1, 1, 1,
0.3202198, -0.2641295, 3.994442, 1, 1, 1, 1, 1,
0.3256842, 0.1469985, 0.8096986, 1, 1, 1, 1, 1,
0.3292963, -1.768889, 1.734387, 1, 1, 1, 1, 1,
0.3297138, 0.1087893, -0.02723205, 1, 1, 1, 1, 1,
0.3339636, 0.7350783, -0.5452437, 1, 1, 1, 1, 1,
0.3340138, -0.4264559, 2.639175, 1, 1, 1, 1, 1,
0.3408753, 0.2051717, 1.458867, 1, 1, 1, 1, 1,
0.3428154, -0.1737009, 3.296088, 1, 1, 1, 1, 1,
0.3433793, -0.7116296, 1.662476, 1, 1, 1, 1, 1,
0.3481509, -0.1629811, 1.921921, 1, 1, 1, 1, 1,
0.3488732, -1.737219, 3.514174, 1, 1, 1, 1, 1,
0.3494746, -0.6329253, 3.986659, 0, 0, 1, 1, 1,
0.351629, -0.8697397, 2.677259, 1, 0, 0, 1, 1,
0.3539712, -0.03741034, 0.4856168, 1, 0, 0, 1, 1,
0.3545001, 0.8104765, -0.01813762, 1, 0, 0, 1, 1,
0.3553689, 1.702113, 2.02912, 1, 0, 0, 1, 1,
0.3591376, -0.7110999, 4.916003, 1, 0, 0, 1, 1,
0.3591922, -0.08979035, 1.723766, 0, 0, 0, 1, 1,
0.3616178, -0.952018, 1.290762, 0, 0, 0, 1, 1,
0.3654288, -0.913484, 1.688495, 0, 0, 0, 1, 1,
0.3774678, 0.8397195, -0.03359671, 0, 0, 0, 1, 1,
0.3815021, 1.562245, 0.2804015, 0, 0, 0, 1, 1,
0.3823135, 0.3819263, 1.050484, 0, 0, 0, 1, 1,
0.3912228, 0.7397004, 2.819331, 0, 0, 0, 1, 1,
0.3939453, 0.1506199, -0.3454497, 1, 1, 1, 1, 1,
0.39825, 0.3085234, 0.7003323, 1, 1, 1, 1, 1,
0.3984278, 1.004781, -0.5389792, 1, 1, 1, 1, 1,
0.4003742, -0.1137253, 0.5623846, 1, 1, 1, 1, 1,
0.4060063, 0.5082001, 0.7372424, 1, 1, 1, 1, 1,
0.4126908, -1.509908, 4.364858, 1, 1, 1, 1, 1,
0.4167041, 1.136315, 0.410156, 1, 1, 1, 1, 1,
0.4175314, 0.9828189, -1.421564, 1, 1, 1, 1, 1,
0.4177636, -0.2096409, 2.930182, 1, 1, 1, 1, 1,
0.4196457, 0.9450372, -0.2770392, 1, 1, 1, 1, 1,
0.4211766, 1.016566, 0.7709618, 1, 1, 1, 1, 1,
0.4266559, -0.03521805, 1.608584, 1, 1, 1, 1, 1,
0.4285041, -0.152349, 0.4205715, 1, 1, 1, 1, 1,
0.4287928, -0.7192313, 2.607366, 1, 1, 1, 1, 1,
0.4294732, 1.729779, 1.207361, 1, 1, 1, 1, 1,
0.4316365, -0.4546854, 1.974283, 0, 0, 1, 1, 1,
0.4351097, 1.49096, -2.523967, 1, 0, 0, 1, 1,
0.4351913, 0.8661186, 0.1019724, 1, 0, 0, 1, 1,
0.4440365, 0.557495, 2.476504, 1, 0, 0, 1, 1,
0.4440832, -0.3754858, 2.001216, 1, 0, 0, 1, 1,
0.4493343, -0.8227421, 2.400051, 1, 0, 0, 1, 1,
0.4546247, 0.0406468, 1.877771, 0, 0, 0, 1, 1,
0.4551398, -0.6394585, 3.029073, 0, 0, 0, 1, 1,
0.4650201, 0.8811305, 2.156876, 0, 0, 0, 1, 1,
0.4689428, -0.9869637, 3.347413, 0, 0, 0, 1, 1,
0.4741797, 1.067437, -0.1251156, 0, 0, 0, 1, 1,
0.474391, 0.1434222, 1.638678, 0, 0, 0, 1, 1,
0.4784393, -0.7799264, 0.6201646, 0, 0, 0, 1, 1,
0.481026, -0.7863174, 0.5468288, 1, 1, 1, 1, 1,
0.4868591, -2.081752, 3.451136, 1, 1, 1, 1, 1,
0.4911632, 0.3233611, 1.398895, 1, 1, 1, 1, 1,
0.4936596, -0.755529, 1.445344, 1, 1, 1, 1, 1,
0.497699, -0.4174877, 2.352246, 1, 1, 1, 1, 1,
0.5049779, -0.5573475, 2.695573, 1, 1, 1, 1, 1,
0.508069, 1.064397, -0.1004586, 1, 1, 1, 1, 1,
0.514407, 1.048077, -0.9702448, 1, 1, 1, 1, 1,
0.5145448, -2.123902, 1.7857, 1, 1, 1, 1, 1,
0.5153291, -1.352663, 2.296014, 1, 1, 1, 1, 1,
0.5180091, 2.290283, 0.00140686, 1, 1, 1, 1, 1,
0.5187612, -0.4042323, 0.5606811, 1, 1, 1, 1, 1,
0.5189836, -1.958845, 3.345333, 1, 1, 1, 1, 1,
0.519219, 0.4141198, 1.118972, 1, 1, 1, 1, 1,
0.520226, -0.9945421, 1.333651, 1, 1, 1, 1, 1,
0.5208547, 0.6458242, -0.116552, 0, 0, 1, 1, 1,
0.523931, -0.4918929, 3.979533, 1, 0, 0, 1, 1,
0.5259265, 1.301593, -0.841157, 1, 0, 0, 1, 1,
0.5300744, 1.432655, -0.494992, 1, 0, 0, 1, 1,
0.5363078, -0.4692033, 2.957418, 1, 0, 0, 1, 1,
0.5396124, 0.7643223, 1.819756, 1, 0, 0, 1, 1,
0.5398878, 0.04194389, 1.580662, 0, 0, 0, 1, 1,
0.5430501, -1.726343, 1.149525, 0, 0, 0, 1, 1,
0.5468928, -0.4386191, 3.15027, 0, 0, 0, 1, 1,
0.547408, 0.04441795, 1.993595, 0, 0, 0, 1, 1,
0.5504929, 1.501554, -0.5811332, 0, 0, 0, 1, 1,
0.5537658, 0.9255525, 0.07942109, 0, 0, 0, 1, 1,
0.5552475, 0.5639225, -0.04136263, 0, 0, 0, 1, 1,
0.5561878, -0.2220967, 3.707648, 1, 1, 1, 1, 1,
0.5674111, 0.3276841, 0.3443708, 1, 1, 1, 1, 1,
0.5703103, 0.3485969, 1.919952, 1, 1, 1, 1, 1,
0.5724142, 1.125061, -0.5285411, 1, 1, 1, 1, 1,
0.5738974, 0.3308674, 0.02302707, 1, 1, 1, 1, 1,
0.5761557, -0.2525724, 1.936546, 1, 1, 1, 1, 1,
0.5798701, -2.388425, 3.107593, 1, 1, 1, 1, 1,
0.5851817, -1.193116, 2.818766, 1, 1, 1, 1, 1,
0.5853289, 2.019092, 0.8750765, 1, 1, 1, 1, 1,
0.5874797, -0.05005075, 2.362923, 1, 1, 1, 1, 1,
0.5878603, 1.33515, 0.05600183, 1, 1, 1, 1, 1,
0.5884025, -0.08628871, 3.103124, 1, 1, 1, 1, 1,
0.5911036, -1.531987, 2.144578, 1, 1, 1, 1, 1,
0.5916259, -0.2130369, 1.669442, 1, 1, 1, 1, 1,
0.595591, -0.7083661, 1.279273, 1, 1, 1, 1, 1,
0.5957871, -0.2903852, 3.824908, 0, 0, 1, 1, 1,
0.5961147, 0.9004452, 1.5555, 1, 0, 0, 1, 1,
0.5964962, 2.604111, -0.3733553, 1, 0, 0, 1, 1,
0.5983921, -0.1162837, 2.123461, 1, 0, 0, 1, 1,
0.6092511, 0.1478803, 1.055673, 1, 0, 0, 1, 1,
0.6139863, 0.4670399, 1.79482, 1, 0, 0, 1, 1,
0.6186934, -1.188198, 1.916406, 0, 0, 0, 1, 1,
0.6192434, 0.7366679, 0.6300114, 0, 0, 0, 1, 1,
0.6272011, -0.2751109, 1.632197, 0, 0, 0, 1, 1,
0.6278865, 0.2913978, 0.0219837, 0, 0, 0, 1, 1,
0.6292489, -1.155529, 4.869304, 0, 0, 0, 1, 1,
0.6344916, 0.451752, 1.042339, 0, 0, 0, 1, 1,
0.635773, -0.6241386, 2.344979, 0, 0, 0, 1, 1,
0.636074, -0.3450221, 3.70228, 1, 1, 1, 1, 1,
0.6423166, -0.3687113, 1.417118, 1, 1, 1, 1, 1,
0.6445183, 1.022566, -1.229726, 1, 1, 1, 1, 1,
0.6446878, 2.096383, -0.2158667, 1, 1, 1, 1, 1,
0.6531627, -0.5776595, 2.344577, 1, 1, 1, 1, 1,
0.6539333, 1.432564, 1.775998, 1, 1, 1, 1, 1,
0.6551578, -0.3268816, 0.3876877, 1, 1, 1, 1, 1,
0.6598134, 1.548003, 0.5071431, 1, 1, 1, 1, 1,
0.672532, -0.5536957, 2.37818, 1, 1, 1, 1, 1,
0.6787339, -0.7314537, 3.470589, 1, 1, 1, 1, 1,
0.6815566, -0.3159998, 2.153043, 1, 1, 1, 1, 1,
0.6862021, -0.4364673, 2.290983, 1, 1, 1, 1, 1,
0.6949021, -2.104906, 3.115376, 1, 1, 1, 1, 1,
0.6955982, 1.759614, -1.211166, 1, 1, 1, 1, 1,
0.6962681, 1.077317, -0.314903, 1, 1, 1, 1, 1,
0.6970915, 0.3656139, 0.03977858, 0, 0, 1, 1, 1,
0.6995479, 1.384987, -0.256225, 1, 0, 0, 1, 1,
0.7000638, -0.07033829, 1.466449, 1, 0, 0, 1, 1,
0.7022969, -0.2715327, 0.7611833, 1, 0, 0, 1, 1,
0.7043534, -0.9995486, 3.019918, 1, 0, 0, 1, 1,
0.7059825, 0.8948479, 2.200469, 1, 0, 0, 1, 1,
0.7088248, -0.9473997, 2.812809, 0, 0, 0, 1, 1,
0.7199518, -1.648377, 1.790554, 0, 0, 0, 1, 1,
0.720094, -0.8895688, 2.425832, 0, 0, 0, 1, 1,
0.7320687, -0.9656833, 2.175514, 0, 0, 0, 1, 1,
0.7331087, -2.454145, 2.886242, 0, 0, 0, 1, 1,
0.7334926, 1.457757, 0.859242, 0, 0, 0, 1, 1,
0.7340523, -0.6201645, 3.010335, 0, 0, 0, 1, 1,
0.7347285, -1.76053, 2.926963, 1, 1, 1, 1, 1,
0.7362937, -0.3871614, 2.366835, 1, 1, 1, 1, 1,
0.7372756, -0.6519642, 3.148168, 1, 1, 1, 1, 1,
0.741253, 1.190222, 0.9358232, 1, 1, 1, 1, 1,
0.7479549, -0.2193453, 3.089952, 1, 1, 1, 1, 1,
0.7500228, 0.6090409, 1.069494, 1, 1, 1, 1, 1,
0.7510793, 2.112451, 1.702756, 1, 1, 1, 1, 1,
0.7514041, -1.376845, 3.917656, 1, 1, 1, 1, 1,
0.7517151, 0.2348625, 1.124124, 1, 1, 1, 1, 1,
0.7527902, -0.5690824, 0.4382839, 1, 1, 1, 1, 1,
0.7577649, -1.163504, 0.3992039, 1, 1, 1, 1, 1,
0.7580282, -0.1123449, 1.772952, 1, 1, 1, 1, 1,
0.7583057, -1.067904, 2.217823, 1, 1, 1, 1, 1,
0.7599881, 0.03384311, 2.61972, 1, 1, 1, 1, 1,
0.7612932, -0.05849361, 0.1669978, 1, 1, 1, 1, 1,
0.7685097, 0.4033097, 0.9596632, 0, 0, 1, 1, 1,
0.7774842, 0.7255074, -0.2048092, 1, 0, 0, 1, 1,
0.7817138, 0.9449009, 1.294583, 1, 0, 0, 1, 1,
0.7842494, -0.10348, 3.834796, 1, 0, 0, 1, 1,
0.7854455, 0.735907, 1.025937, 1, 0, 0, 1, 1,
0.7931409, -0.395312, 2.511763, 1, 0, 0, 1, 1,
0.7942601, 1.851854, -0.5109285, 0, 0, 0, 1, 1,
0.7944704, 0.7175972, -0.9138364, 0, 0, 0, 1, 1,
0.7950044, -1.520196, 2.668918, 0, 0, 0, 1, 1,
0.7988758, 0.3468901, 2.883328, 0, 0, 0, 1, 1,
0.7988991, 1.846584, 1.489743, 0, 0, 0, 1, 1,
0.8008394, -2.712265, 2.385246, 0, 0, 0, 1, 1,
0.8063123, -0.7114659, 2.232402, 0, 0, 0, 1, 1,
0.8077844, 1.708285, 1.197299, 1, 1, 1, 1, 1,
0.809512, 1.516, 0.9376483, 1, 1, 1, 1, 1,
0.8155152, -0.3167381, 1.29714, 1, 1, 1, 1, 1,
0.8162265, 0.3936534, -0.1094208, 1, 1, 1, 1, 1,
0.8232477, -1.450141, 2.322008, 1, 1, 1, 1, 1,
0.8331536, -0.1299733, 1.999752, 1, 1, 1, 1, 1,
0.8356499, 0.63367, 1.826215, 1, 1, 1, 1, 1,
0.8387276, 0.4986933, 1.709256, 1, 1, 1, 1, 1,
0.8406379, -0.3785766, 1.939444, 1, 1, 1, 1, 1,
0.8412758, 0.1536569, 1.988569, 1, 1, 1, 1, 1,
0.8417887, -1.103263, 2.091205, 1, 1, 1, 1, 1,
0.8450252, 0.5950235, 1.190907, 1, 1, 1, 1, 1,
0.8486841, -0.1313458, 0.8585864, 1, 1, 1, 1, 1,
0.8508375, 1.580463, -0.002622718, 1, 1, 1, 1, 1,
0.8555524, 2.221837, 0.8661939, 1, 1, 1, 1, 1,
0.858474, 0.06975146, 1.314595, 0, 0, 1, 1, 1,
0.8643803, -1.403108, 3.019006, 1, 0, 0, 1, 1,
0.8682527, 0.7530994, 0.9561372, 1, 0, 0, 1, 1,
0.8710989, 1.33505, 0.6705102, 1, 0, 0, 1, 1,
0.8718125, 0.8528149, 0.200698, 1, 0, 0, 1, 1,
0.8788955, 0.6276504, 0.934508, 1, 0, 0, 1, 1,
0.8791326, 0.8095437, 0.3411609, 0, 0, 0, 1, 1,
0.8827314, -0.6313505, 4.122028, 0, 0, 0, 1, 1,
0.8855342, -0.4889804, 3.771163, 0, 0, 0, 1, 1,
0.8913888, -2.13004, 4.236794, 0, 0, 0, 1, 1,
0.8917273, -1.13744, 2.158113, 0, 0, 0, 1, 1,
0.8935996, 1.905962, -1.315904, 0, 0, 0, 1, 1,
0.8963151, 1.620076, -0.1589378, 0, 0, 0, 1, 1,
0.899022, -0.1463391, 1.837648, 1, 1, 1, 1, 1,
0.9085509, -0.1271086, -0.4627684, 1, 1, 1, 1, 1,
0.9194862, 0.4116738, -0.06995162, 1, 1, 1, 1, 1,
0.9287392, 0.1882484, 1.866987, 1, 1, 1, 1, 1,
0.9376503, -0.08945809, 1.079184, 1, 1, 1, 1, 1,
0.9381512, 0.6687765, 1.626858, 1, 1, 1, 1, 1,
0.9381699, -0.6333005, 3.608077, 1, 1, 1, 1, 1,
0.9393735, 1.788742, 0.5491092, 1, 1, 1, 1, 1,
0.9452782, -0.1829554, 1.620019, 1, 1, 1, 1, 1,
0.9484001, -0.1083584, 2.203804, 1, 1, 1, 1, 1,
0.9543977, 0.1518748, 1.098758, 1, 1, 1, 1, 1,
0.9617974, -0.3483166, 1.585146, 1, 1, 1, 1, 1,
0.9677813, -0.3261475, 2.214697, 1, 1, 1, 1, 1,
0.9727084, -0.082977, 1.400329, 1, 1, 1, 1, 1,
0.97311, 0.5551598, 1.371825, 1, 1, 1, 1, 1,
0.9734907, -0.665269, 2.212676, 0, 0, 1, 1, 1,
0.9831691, -0.7799255, 3.437105, 1, 0, 0, 1, 1,
0.9911415, 0.4627793, 0.7232796, 1, 0, 0, 1, 1,
0.9914398, -0.1296385, 1.019846, 1, 0, 0, 1, 1,
0.991691, -2.780258, 3.274467, 1, 0, 0, 1, 1,
0.9917657, -0.6507874, 1.901058, 1, 0, 0, 1, 1,
0.9936836, 0.3263038, 1.925403, 0, 0, 0, 1, 1,
0.9967997, -0.9943691, 2.233522, 0, 0, 0, 1, 1,
1.00017, -0.02545306, 2.950115, 0, 0, 0, 1, 1,
1.005999, 0.5618338, 1.318267, 0, 0, 0, 1, 1,
1.012447, 1.031324, 1.083848, 0, 0, 0, 1, 1,
1.021351, 0.1005276, 1.539715, 0, 0, 0, 1, 1,
1.021542, -0.4331991, 0.8391479, 0, 0, 0, 1, 1,
1.022661, 0.3819926, 1.586639, 1, 1, 1, 1, 1,
1.027145, -0.5900325, 2.876202, 1, 1, 1, 1, 1,
1.0273, -0.170382, 2.421497, 1, 1, 1, 1, 1,
1.036962, -0.6551921, 2.385165, 1, 1, 1, 1, 1,
1.037238, 0.9531584, 1.450827, 1, 1, 1, 1, 1,
1.040812, 1.396809, -1.092858, 1, 1, 1, 1, 1,
1.043001, 0.9154709, 2.371823, 1, 1, 1, 1, 1,
1.048851, -0.7625287, 2.976117, 1, 1, 1, 1, 1,
1.051227, 0.2114228, 0.2495782, 1, 1, 1, 1, 1,
1.05814, -0.9332182, 1.439033, 1, 1, 1, 1, 1,
1.059518, -0.1533927, 1.711957, 1, 1, 1, 1, 1,
1.068273, 0.3128709, 1.486426, 1, 1, 1, 1, 1,
1.070858, -0.1713098, 0.9619036, 1, 1, 1, 1, 1,
1.072062, 1.40649, 0.2326396, 1, 1, 1, 1, 1,
1.076709, 0.6344045, -0.8673496, 1, 1, 1, 1, 1,
1.076931, -1.674577, 3.411711, 0, 0, 1, 1, 1,
1.086191, 0.02370512, 0.82715, 1, 0, 0, 1, 1,
1.091339, -1.311627, 2.785683, 1, 0, 0, 1, 1,
1.104087, 0.6936826, 0.08270329, 1, 0, 0, 1, 1,
1.110506, 1.227743, -0.1471447, 1, 0, 0, 1, 1,
1.110524, 1.041797, 2.724224, 1, 0, 0, 1, 1,
1.118379, 0.5991768, 0.5643311, 0, 0, 0, 1, 1,
1.121962, 0.8474196, 1.533313, 0, 0, 0, 1, 1,
1.125569, 0.5018328, 2.169475, 0, 0, 0, 1, 1,
1.126822, -0.1453189, 2.226459, 0, 0, 0, 1, 1,
1.137131, 0.6198852, 1.970846, 0, 0, 0, 1, 1,
1.142898, 0.2884138, 2.071608, 0, 0, 0, 1, 1,
1.14623, -0.1872027, 0.9788089, 0, 0, 0, 1, 1,
1.151438, -0.6346952, 2.523532, 1, 1, 1, 1, 1,
1.156777, 0.299151, 1.446674, 1, 1, 1, 1, 1,
1.157763, 0.799377, 0.09644642, 1, 1, 1, 1, 1,
1.166371, -1.222029, 0.5619099, 1, 1, 1, 1, 1,
1.175231, 1.689585, 1.503344, 1, 1, 1, 1, 1,
1.176623, 0.8186656, 0.8505528, 1, 1, 1, 1, 1,
1.177786, -0.6679555, 1.281001, 1, 1, 1, 1, 1,
1.187682, 0.1492598, 0.5369956, 1, 1, 1, 1, 1,
1.193795, -0.9922866, 1.061295, 1, 1, 1, 1, 1,
1.19422, -0.7995449, 2.053898, 1, 1, 1, 1, 1,
1.195539, 1.470171, 0.460484, 1, 1, 1, 1, 1,
1.196817, 0.938475, -0.4416039, 1, 1, 1, 1, 1,
1.197925, 0.4597067, 1.832094, 1, 1, 1, 1, 1,
1.208535, -1.075989, 2.447104, 1, 1, 1, 1, 1,
1.210775, 0.9120775, 1.498284, 1, 1, 1, 1, 1,
1.213381, 1.023774, -0.5353425, 0, 0, 1, 1, 1,
1.216965, -1.939093, 2.236924, 1, 0, 0, 1, 1,
1.217245, -1.157391, 2.550682, 1, 0, 0, 1, 1,
1.217634, 1.000728, -0.6632329, 1, 0, 0, 1, 1,
1.219966, 0.5595959, 1.151052, 1, 0, 0, 1, 1,
1.222616, 2.302165, 0.1626941, 1, 0, 0, 1, 1,
1.234295, -2.125184, 4.302906, 0, 0, 0, 1, 1,
1.235202, 0.468459, 1.852479, 0, 0, 0, 1, 1,
1.236343, -1.391019, 3.224823, 0, 0, 0, 1, 1,
1.252411, -0.7536978, -0.3849472, 0, 0, 0, 1, 1,
1.266791, -0.05905878, 2.711435, 0, 0, 0, 1, 1,
1.281973, -0.6260284, 2.528176, 0, 0, 0, 1, 1,
1.284129, -0.02116035, 1.947712, 0, 0, 0, 1, 1,
1.288124, 0.673153, 0.4484099, 1, 1, 1, 1, 1,
1.294573, 0.8938779, 0.8956634, 1, 1, 1, 1, 1,
1.294904, -0.1127034, 1.131601, 1, 1, 1, 1, 1,
1.300155, -0.01471984, 2.532202, 1, 1, 1, 1, 1,
1.309304, 0.5434729, -1.057132, 1, 1, 1, 1, 1,
1.320047, 0.2946677, 3.491351, 1, 1, 1, 1, 1,
1.322846, -0.9585287, 1.198915, 1, 1, 1, 1, 1,
1.327945, 0.6124397, -0.1225427, 1, 1, 1, 1, 1,
1.328313, 0.1105499, 0.9330898, 1, 1, 1, 1, 1,
1.33115, -0.9213774, 4.217895, 1, 1, 1, 1, 1,
1.33328, 0.3700801, 0.3907984, 1, 1, 1, 1, 1,
1.334718, 1.954035, 0.3040285, 1, 1, 1, 1, 1,
1.35656, 0.5482813, -0.8394681, 1, 1, 1, 1, 1,
1.362052, -0.8097148, 2.009632, 1, 1, 1, 1, 1,
1.375907, 0.7159274, 0.6318235, 1, 1, 1, 1, 1,
1.376087, -0.8636978, 1.648021, 0, 0, 1, 1, 1,
1.391075, 1.555733, 1.59589, 1, 0, 0, 1, 1,
1.399426, 1.196664, 0.7698106, 1, 0, 0, 1, 1,
1.404861, -0.3495898, 2.221528, 1, 0, 0, 1, 1,
1.42762, -0.2131142, 0.6650882, 1, 0, 0, 1, 1,
1.430576, -1.369156, 3.01411, 1, 0, 0, 1, 1,
1.433512, 0.4080027, 0.1200675, 0, 0, 0, 1, 1,
1.434348, -1.308931, 1.771235, 0, 0, 0, 1, 1,
1.446738, 0.7751845, 1.622011, 0, 0, 0, 1, 1,
1.474213, 1.146936, 2.166694, 0, 0, 0, 1, 1,
1.475614, 1.216698, 2.877177, 0, 0, 0, 1, 1,
1.501308, 0.4226246, 2.254035, 0, 0, 0, 1, 1,
1.511607, -0.7758107, 1.486524, 0, 0, 0, 1, 1,
1.516094, -1.160482, 1.893171, 1, 1, 1, 1, 1,
1.517336, -0.5281085, 0.02541356, 1, 1, 1, 1, 1,
1.559483, 0.1958581, 2.487832, 1, 1, 1, 1, 1,
1.563755, -0.3971132, 4.178964, 1, 1, 1, 1, 1,
1.57252, 0.9127325, -0.448471, 1, 1, 1, 1, 1,
1.580265, -3.164006, 2.47276, 1, 1, 1, 1, 1,
1.588367, -0.6625468, 2.05813, 1, 1, 1, 1, 1,
1.599414, 0.5186654, 0.6582697, 1, 1, 1, 1, 1,
1.617128, -1.67463, 2.224723, 1, 1, 1, 1, 1,
1.623559, -0.4136519, 3.70159, 1, 1, 1, 1, 1,
1.633749, 2.398573, 0.8936864, 1, 1, 1, 1, 1,
1.63422, 0.3080572, -0.2670546, 1, 1, 1, 1, 1,
1.634463, 0.2086007, -1.686479, 1, 1, 1, 1, 1,
1.645025, -0.5655004, 2.068286, 1, 1, 1, 1, 1,
1.648125, 1.145018, 0.5190608, 1, 1, 1, 1, 1,
1.651625, -0.03833291, 2.117451, 0, 0, 1, 1, 1,
1.653364, -1.635225, 2.715211, 1, 0, 0, 1, 1,
1.653988, -0.2930764, 2.131957, 1, 0, 0, 1, 1,
1.658173, -1.534265, 3.077694, 1, 0, 0, 1, 1,
1.666993, -0.6301253, 0.6536857, 1, 0, 0, 1, 1,
1.667032, 1.991804, 0.6605121, 1, 0, 0, 1, 1,
1.681698, -1.150112, 0.9297736, 0, 0, 0, 1, 1,
1.70202, -0.3494274, 2.103242, 0, 0, 0, 1, 1,
1.720321, -0.00746782, 2.239283, 0, 0, 0, 1, 1,
1.723144, -0.0796866, 1.560718, 0, 0, 0, 1, 1,
1.744889, -0.4193526, -0.4014972, 0, 0, 0, 1, 1,
1.749942, -0.1260434, 1.528755, 0, 0, 0, 1, 1,
1.766702, -0.6329851, 2.99818, 0, 0, 0, 1, 1,
1.774617, 0.6054243, -0.5633603, 1, 1, 1, 1, 1,
1.790339, 0.2748711, 1.571919, 1, 1, 1, 1, 1,
1.80763, -0.06195599, 0.8224783, 1, 1, 1, 1, 1,
1.816058, 0.1702479, 1.722365, 1, 1, 1, 1, 1,
1.818468, -0.5610717, 1.747751, 1, 1, 1, 1, 1,
1.846653, 0.6469769, 0.852394, 1, 1, 1, 1, 1,
1.881536, 0.4257372, 1.472037, 1, 1, 1, 1, 1,
1.892643, 0.8800708, 0.8404172, 1, 1, 1, 1, 1,
1.932451, 0.5101489, 0.8651467, 1, 1, 1, 1, 1,
1.949731, 0.1601198, 1.577681, 1, 1, 1, 1, 1,
1.962522, 0.4572953, 2.373161, 1, 1, 1, 1, 1,
1.979499, -2.235748, 2.154695, 1, 1, 1, 1, 1,
1.981748, 1.434775, 0.4938106, 1, 1, 1, 1, 1,
2.017205, -1.058857, 3.907434, 1, 1, 1, 1, 1,
2.018894, 3.626673, 0.6717131, 1, 1, 1, 1, 1,
2.053393, 0.9636165, -0.6743424, 0, 0, 1, 1, 1,
2.076483, 0.1982949, 1.522102, 1, 0, 0, 1, 1,
2.116071, -1.133793, 3.930195, 1, 0, 0, 1, 1,
2.124007, 1.162158, -1.127676, 1, 0, 0, 1, 1,
2.150142, -0.2353765, 2.623687, 1, 0, 0, 1, 1,
2.172803, -0.6948272, 1.239762, 1, 0, 0, 1, 1,
2.202147, 0.01519316, 0.4266723, 0, 0, 0, 1, 1,
2.209533, -0.3324923, 2.036774, 0, 0, 0, 1, 1,
2.229863, 1.275154, 1.398427, 0, 0, 0, 1, 1,
2.313988, -1.472222, 1.521001, 0, 0, 0, 1, 1,
2.325104, 0.8880019, 3.16926, 0, 0, 0, 1, 1,
2.398914, -1.49023, 1.69692, 0, 0, 0, 1, 1,
2.408919, 0.1537127, 1.790953, 0, 0, 0, 1, 1,
2.409139, -1.572418, 2.10534, 1, 1, 1, 1, 1,
2.422288, -0.4486669, 1.704321, 1, 1, 1, 1, 1,
2.427644, 0.1265073, 1.370041, 1, 1, 1, 1, 1,
2.435705, 1.067332, 1.546256, 1, 1, 1, 1, 1,
2.603538, -0.4145452, 3.37043, 1, 1, 1, 1, 1,
2.721149, -0.7718641, 0.7391751, 1, 1, 1, 1, 1,
3.105827, -1.381459, 3.173684, 1, 1, 1, 1, 1
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
var radius = 9.890795;
var distance = 34.741;
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
mvMatrix.translate( 0.01391315, 0.06521988, -0.1477008 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.741);
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
