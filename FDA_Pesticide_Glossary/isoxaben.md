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
-3.075302, -0.2432406, -1.011971, 1, 0, 0, 1,
-2.954458, -0.6104035, -1.96466, 1, 0.007843138, 0, 1,
-2.60053, -1.509391, -1.922945, 1, 0.01176471, 0, 1,
-2.532199, -0.5634016, -1.115568, 1, 0.01960784, 0, 1,
-2.306872, 1.30537, -0.06511665, 1, 0.02352941, 0, 1,
-2.24775, 0.4876422, -2.516789, 1, 0.03137255, 0, 1,
-2.245891, -1.543501, -1.509094, 1, 0.03529412, 0, 1,
-2.193038, -0.1563038, -1.582507, 1, 0.04313726, 0, 1,
-2.144726, 0.9075177, -1.204221, 1, 0.04705882, 0, 1,
-2.126905, -1.035273, -0.5791106, 1, 0.05490196, 0, 1,
-2.125992, -0.3647261, -1.624279, 1, 0.05882353, 0, 1,
-2.073019, 1.5894, -0.4986849, 1, 0.06666667, 0, 1,
-2.058011, -0.607352, -0.138419, 1, 0.07058824, 0, 1,
-2.046494, -0.2577873, -0.9467367, 1, 0.07843138, 0, 1,
-2.040608, -1.17474, -1.716624, 1, 0.08235294, 0, 1,
-2.025299, -0.6087624, -2.074176, 1, 0.09019608, 0, 1,
-2.025047, 1.036263, -1.64124, 1, 0.09411765, 0, 1,
-1.933167, -0.8178843, -2.186757, 1, 0.1019608, 0, 1,
-1.932333, -0.1471338, -1.546414, 1, 0.1098039, 0, 1,
-1.908311, 2.246444, -0.8633612, 1, 0.1137255, 0, 1,
-1.877066, 0.3513736, 0.194897, 1, 0.1215686, 0, 1,
-1.837248, 0.8017887, -0.2637161, 1, 0.1254902, 0, 1,
-1.813743, -0.3732941, -0.7860542, 1, 0.1333333, 0, 1,
-1.80961, 2.024428, -0.7859627, 1, 0.1372549, 0, 1,
-1.809366, 0.3465327, -2.194262, 1, 0.145098, 0, 1,
-1.795316, -1.295788, -2.841967, 1, 0.1490196, 0, 1,
-1.789728, 0.2139338, -1.963158, 1, 0.1568628, 0, 1,
-1.767562, 0.2379159, -0.6376927, 1, 0.1607843, 0, 1,
-1.740398, -0.3763633, -3.976106, 1, 0.1686275, 0, 1,
-1.717499, -0.764268, -1.424295, 1, 0.172549, 0, 1,
-1.716083, -1.404864, 0.1848452, 1, 0.1803922, 0, 1,
-1.712306, 0.3629514, -0.7857988, 1, 0.1843137, 0, 1,
-1.709596, 0.655394, -2.280628, 1, 0.1921569, 0, 1,
-1.679389, 2.539434, 0.7204557, 1, 0.1960784, 0, 1,
-1.664114, 1.295173, -1.82819, 1, 0.2039216, 0, 1,
-1.655746, -0.9895936, -2.596367, 1, 0.2117647, 0, 1,
-1.653522, 0.2914711, -4.282462, 1, 0.2156863, 0, 1,
-1.647377, 0.6100627, -1.399922, 1, 0.2235294, 0, 1,
-1.646051, 0.707583, -2.255346, 1, 0.227451, 0, 1,
-1.641028, 0.9134061, -1.457664, 1, 0.2352941, 0, 1,
-1.616124, 0.5924319, 0.4361286, 1, 0.2392157, 0, 1,
-1.603893, 0.4753202, -2.217123, 1, 0.2470588, 0, 1,
-1.59941, -0.88231, -1.911474, 1, 0.2509804, 0, 1,
-1.590883, 1.263906, -1.578878, 1, 0.2588235, 0, 1,
-1.588544, -0.07557082, -1.8505, 1, 0.2627451, 0, 1,
-1.584593, 0.702758, -2.083283, 1, 0.2705882, 0, 1,
-1.577544, -0.5520357, -2.07789, 1, 0.2745098, 0, 1,
-1.577134, 0.6788941, -0.733655, 1, 0.282353, 0, 1,
-1.562114, -0.7443241, 0.05019601, 1, 0.2862745, 0, 1,
-1.555415, -0.755933, -2.003366, 1, 0.2941177, 0, 1,
-1.550201, 0.366219, -0.8998516, 1, 0.3019608, 0, 1,
-1.548598, 1.573017, -1.0026, 1, 0.3058824, 0, 1,
-1.49542, 1.407037, -1.209272, 1, 0.3137255, 0, 1,
-1.455497, -0.4672036, 0.3905009, 1, 0.3176471, 0, 1,
-1.449701, -0.25604, -1.58683, 1, 0.3254902, 0, 1,
-1.440175, 0.02016744, -3.742064, 1, 0.3294118, 0, 1,
-1.43479, -0.1121986, -0.9209432, 1, 0.3372549, 0, 1,
-1.431148, 1.881548, -2.317717, 1, 0.3411765, 0, 1,
-1.409769, -0.3216156, -2.442604, 1, 0.3490196, 0, 1,
-1.406775, -0.5629193, -2.304056, 1, 0.3529412, 0, 1,
-1.400666, -0.4517551, -2.655965, 1, 0.3607843, 0, 1,
-1.400282, 0.5924135, -1.350285, 1, 0.3647059, 0, 1,
-1.395342, 0.6941542, -2.874582, 1, 0.372549, 0, 1,
-1.39451, -0.5397562, -2.716839, 1, 0.3764706, 0, 1,
-1.390494, -0.5354393, -1.30129, 1, 0.3843137, 0, 1,
-1.387344, -0.1496313, -1.180104, 1, 0.3882353, 0, 1,
-1.381689, 0.2380974, -1.930126, 1, 0.3960784, 0, 1,
-1.380077, -1.077956, -1.86057, 1, 0.4039216, 0, 1,
-1.376761, -1.537968, -3.13445, 1, 0.4078431, 0, 1,
-1.338288, 0.4103046, -3.250579, 1, 0.4156863, 0, 1,
-1.338062, -0.4977284, -0.4250972, 1, 0.4196078, 0, 1,
-1.335049, -1.014761, -1.464994, 1, 0.427451, 0, 1,
-1.307874, 0.5761597, -0.112931, 1, 0.4313726, 0, 1,
-1.300747, 0.307169, -1.174417, 1, 0.4392157, 0, 1,
-1.290279, 1.034848, -1.130381, 1, 0.4431373, 0, 1,
-1.288717, -0.4284201, -2.175704, 1, 0.4509804, 0, 1,
-1.269586, 0.05551947, -1.877455, 1, 0.454902, 0, 1,
-1.268862, -1.393204, -2.113673, 1, 0.4627451, 0, 1,
-1.267559, 0.8953413, -0.862502, 1, 0.4666667, 0, 1,
-1.264658, 1.085022, -2.054718, 1, 0.4745098, 0, 1,
-1.260902, -0.4823672, -1.035226, 1, 0.4784314, 0, 1,
-1.25697, 1.022165, -0.5722609, 1, 0.4862745, 0, 1,
-1.25667, -0.1701277, -2.784026, 1, 0.4901961, 0, 1,
-1.251796, -0.1741302, -1.445101, 1, 0.4980392, 0, 1,
-1.24888, -0.02598117, -0.727699, 1, 0.5058824, 0, 1,
-1.241502, 0.8486023, -1.786397, 1, 0.509804, 0, 1,
-1.241338, -0.1528483, -1.99982, 1, 0.5176471, 0, 1,
-1.230617, -0.5626616, -1.574604, 1, 0.5215687, 0, 1,
-1.221734, 0.07368547, -3.398815, 1, 0.5294118, 0, 1,
-1.220101, -0.1259075, -2.058011, 1, 0.5333334, 0, 1,
-1.20219, 1.857146, -0.1946847, 1, 0.5411765, 0, 1,
-1.196067, 0.4778206, -2.121803, 1, 0.5450981, 0, 1,
-1.195677, -0.08449528, -0.6747222, 1, 0.5529412, 0, 1,
-1.195468, 0.2318036, -2.288954, 1, 0.5568628, 0, 1,
-1.183019, 0.7846814, -1.367427, 1, 0.5647059, 0, 1,
-1.182001, 3.092095, -1.048347, 1, 0.5686275, 0, 1,
-1.179651, 0.7285212, -1.891506, 1, 0.5764706, 0, 1,
-1.174062, -0.3709186, -1.646067, 1, 0.5803922, 0, 1,
-1.16997, -1.995102, -4.547977, 1, 0.5882353, 0, 1,
-1.165382, 0.1060596, -2.001242, 1, 0.5921569, 0, 1,
-1.1645, 0.444694, -1.051321, 1, 0.6, 0, 1,
-1.164114, -0.8779973, -0.7654613, 1, 0.6078432, 0, 1,
-1.156792, -0.8162391, -2.172385, 1, 0.6117647, 0, 1,
-1.152402, -1.753838, -1.466999, 1, 0.6196079, 0, 1,
-1.14679, -1.29842, -4.047984, 1, 0.6235294, 0, 1,
-1.141977, 0.2592276, -2.234574, 1, 0.6313726, 0, 1,
-1.139483, 1.398174, -1.187707, 1, 0.6352941, 0, 1,
-1.134486, 0.3802861, -0.9397795, 1, 0.6431373, 0, 1,
-1.130569, 1.005918, -1.153175, 1, 0.6470588, 0, 1,
-1.122501, 0.7370909, 0.9028493, 1, 0.654902, 0, 1,
-1.116126, -0.2781668, -1.327321, 1, 0.6588235, 0, 1,
-1.100508, 0.6815857, -2.138775, 1, 0.6666667, 0, 1,
-1.094382, 1.155683, -1.251222, 1, 0.6705883, 0, 1,
-1.093612, 0.9691162, -0.3677012, 1, 0.6784314, 0, 1,
-1.091676, 0.5436271, -2.240577, 1, 0.682353, 0, 1,
-1.079346, 1.096074, 0.2538909, 1, 0.6901961, 0, 1,
-1.078742, -0.9697095, -2.448015, 1, 0.6941177, 0, 1,
-1.077198, -0.9147099, -0.9527821, 1, 0.7019608, 0, 1,
-1.07363, -0.9127686, -3.104831, 1, 0.7098039, 0, 1,
-1.067036, -1.221813, -1.374345, 1, 0.7137255, 0, 1,
-1.065921, -0.8175501, -2.961195, 1, 0.7215686, 0, 1,
-1.062657, -0.07137898, -0.3800723, 1, 0.7254902, 0, 1,
-1.061606, -0.6809464, -1.755221, 1, 0.7333333, 0, 1,
-1.060535, -1.443857, -4.179878, 1, 0.7372549, 0, 1,
-1.059557, -0.1334758, -2.181221, 1, 0.7450981, 0, 1,
-1.058668, 2.018933, -1.408294, 1, 0.7490196, 0, 1,
-1.056542, 0.06188167, -1.272753, 1, 0.7568628, 0, 1,
-1.049743, 0.1291982, -1.483541, 1, 0.7607843, 0, 1,
-1.043782, 0.5766803, 0.02024151, 1, 0.7686275, 0, 1,
-1.041624, -0.8932666, -2.870616, 1, 0.772549, 0, 1,
-1.040205, 0.2156876, -1.914563, 1, 0.7803922, 0, 1,
-1.039558, 0.358577, -2.435203, 1, 0.7843137, 0, 1,
-1.039342, 1.442408, -1.06992, 1, 0.7921569, 0, 1,
-1.035268, -0.5099436, -4.454222, 1, 0.7960784, 0, 1,
-1.030218, -1.175799, -1.592648, 1, 0.8039216, 0, 1,
-1.028013, 0.1083468, -1.725732, 1, 0.8117647, 0, 1,
-1.019909, 0.02561642, -0.9432853, 1, 0.8156863, 0, 1,
-1.014716, -1.13535, -1.136201, 1, 0.8235294, 0, 1,
-1.014227, 0.4103529, -1.244235, 1, 0.827451, 0, 1,
-1.009038, 0.3007746, -1.383093, 1, 0.8352941, 0, 1,
-1.005564, -0.2086475, -0.9461308, 1, 0.8392157, 0, 1,
-0.9966644, -0.5897297, -2.718217, 1, 0.8470588, 0, 1,
-0.9939227, -0.2905145, -1.743792, 1, 0.8509804, 0, 1,
-0.9901373, -0.567449, -2.511008, 1, 0.8588235, 0, 1,
-0.9897771, -0.2445729, -2.67114, 1, 0.8627451, 0, 1,
-0.9869535, -1.351316, -3.549565, 1, 0.8705882, 0, 1,
-0.9833896, 0.5240443, -1.173299, 1, 0.8745098, 0, 1,
-0.9779978, 0.3152542, -0.3456066, 1, 0.8823529, 0, 1,
-0.9756055, -1.410978, -2.373782, 1, 0.8862745, 0, 1,
-0.9700696, -0.9543122, -3.396233, 1, 0.8941177, 0, 1,
-0.9684295, 0.3981186, -2.464879, 1, 0.8980392, 0, 1,
-0.9672698, 0.3147047, -0.5375026, 1, 0.9058824, 0, 1,
-0.962194, -0.04212813, -3.405493, 1, 0.9137255, 0, 1,
-0.9586846, 2.211993, -2.018175, 1, 0.9176471, 0, 1,
-0.9568167, -0.2425625, -1.146919, 1, 0.9254902, 0, 1,
-0.9547083, 0.5808442, -1.715277, 1, 0.9294118, 0, 1,
-0.9502133, -1.564073, -3.244457, 1, 0.9372549, 0, 1,
-0.9434484, -0.265316, -1.63917, 1, 0.9411765, 0, 1,
-0.9405611, 0.2000222, -3.340683, 1, 0.9490196, 0, 1,
-0.940428, -0.7351962, -1.789944, 1, 0.9529412, 0, 1,
-0.9326817, -0.9936942, -4.463751, 1, 0.9607843, 0, 1,
-0.9309092, 0.485538, -2.337617, 1, 0.9647059, 0, 1,
-0.9274528, -0.9046299, -3.543644, 1, 0.972549, 0, 1,
-0.9132416, -0.7927144, -1.705587, 1, 0.9764706, 0, 1,
-0.9092854, 0.1704558, 0.6412042, 1, 0.9843137, 0, 1,
-0.9092806, -0.7785938, -2.623091, 1, 0.9882353, 0, 1,
-0.9079925, 0.9135218, -0.01372966, 1, 0.9960784, 0, 1,
-0.9074734, 0.05440971, -1.564583, 0.9960784, 1, 0, 1,
-0.8951067, -0.4715053, -3.199596, 0.9921569, 1, 0, 1,
-0.8939866, -1.278962, -2.726372, 0.9843137, 1, 0, 1,
-0.8874364, -1.112211, -4.062214, 0.9803922, 1, 0, 1,
-0.886877, 2.543055, 0.2856191, 0.972549, 1, 0, 1,
-0.8855266, -0.3455901, -2.181966, 0.9686275, 1, 0, 1,
-0.8812525, 0.8535625, -0.1033311, 0.9607843, 1, 0, 1,
-0.878874, 0.5329857, -1.633336, 0.9568627, 1, 0, 1,
-0.8779813, -1.432608, -2.140732, 0.9490196, 1, 0, 1,
-0.8760369, -0.6173534, -0.2903008, 0.945098, 1, 0, 1,
-0.8759997, -0.1498392, -3.139913, 0.9372549, 1, 0, 1,
-0.8712642, -3.177544, -3.974451, 0.9333333, 1, 0, 1,
-0.8670347, 1.878872, -2.087626, 0.9254902, 1, 0, 1,
-0.8662566, 0.5170953, -0.5090312, 0.9215686, 1, 0, 1,
-0.8625956, -0.7602978, -1.688408, 0.9137255, 1, 0, 1,
-0.8621709, 0.3274202, -1.232703, 0.9098039, 1, 0, 1,
-0.854504, 0.1355651, -1.62347, 0.9019608, 1, 0, 1,
-0.8543831, -0.06436808, 0.6329358, 0.8941177, 1, 0, 1,
-0.8503464, -0.7334872, -0.3830222, 0.8901961, 1, 0, 1,
-0.8486698, 0.9140918, 0.4465991, 0.8823529, 1, 0, 1,
-0.8486342, -0.2145236, -1.283036, 0.8784314, 1, 0, 1,
-0.8477973, 0.35692, -2.390144, 0.8705882, 1, 0, 1,
-0.8460979, -1.244414, -1.772052, 0.8666667, 1, 0, 1,
-0.8426617, -0.1379149, -1.311632, 0.8588235, 1, 0, 1,
-0.841665, 0.6797237, -1.758906, 0.854902, 1, 0, 1,
-0.8401046, 0.9434906, -1.491638, 0.8470588, 1, 0, 1,
-0.8399049, 1.097003, -2.175841, 0.8431373, 1, 0, 1,
-0.8294205, -0.7837497, -2.946088, 0.8352941, 1, 0, 1,
-0.8242848, 0.5697103, -0.5670424, 0.8313726, 1, 0, 1,
-0.8231008, 0.04771648, -0.4800634, 0.8235294, 1, 0, 1,
-0.8223115, 1.843702, -0.5918127, 0.8196079, 1, 0, 1,
-0.8176941, -0.32638, -0.673879, 0.8117647, 1, 0, 1,
-0.8166678, -0.5590017, -2.534508, 0.8078431, 1, 0, 1,
-0.8134506, 0.6926844, 1.162797, 0.8, 1, 0, 1,
-0.8112196, 2.334305, -0.2194707, 0.7921569, 1, 0, 1,
-0.8109584, -0.8178349, -2.526125, 0.7882353, 1, 0, 1,
-0.8044061, -1.246899, -3.006296, 0.7803922, 1, 0, 1,
-0.804304, -1.121108, -2.719697, 0.7764706, 1, 0, 1,
-0.8001618, 0.4958839, 0.5409124, 0.7686275, 1, 0, 1,
-0.7994983, -0.7201446, -2.871681, 0.7647059, 1, 0, 1,
-0.794178, -0.9791373, -1.438522, 0.7568628, 1, 0, 1,
-0.7910127, -1.25929, -3.094335, 0.7529412, 1, 0, 1,
-0.7804088, 0.1701046, -1.440078, 0.7450981, 1, 0, 1,
-0.7801335, -0.245196, -3.749962, 0.7411765, 1, 0, 1,
-0.7771336, -1.654932, -3.908358, 0.7333333, 1, 0, 1,
-0.7689017, -0.8261458, -2.741775, 0.7294118, 1, 0, 1,
-0.763513, 0.4460912, -0.8424506, 0.7215686, 1, 0, 1,
-0.7624934, 0.8607447, -2.178967, 0.7176471, 1, 0, 1,
-0.76195, -0.873793, -2.685632, 0.7098039, 1, 0, 1,
-0.7586018, -2.593381, -4.556756, 0.7058824, 1, 0, 1,
-0.7550629, 0.461292, -2.489008, 0.6980392, 1, 0, 1,
-0.7548581, 1.2582, -1.271612, 0.6901961, 1, 0, 1,
-0.7545798, 0.4658583, 0.3438324, 0.6862745, 1, 0, 1,
-0.7523581, 0.1738976, -0.5659434, 0.6784314, 1, 0, 1,
-0.748085, 0.2888314, -2.076657, 0.6745098, 1, 0, 1,
-0.7465169, -2.196806, -3.326982, 0.6666667, 1, 0, 1,
-0.734354, 0.1441767, 0.7521025, 0.6627451, 1, 0, 1,
-0.7342319, 0.2894239, -1.911829, 0.654902, 1, 0, 1,
-0.7341937, -1.460431, -2.238927, 0.6509804, 1, 0, 1,
-0.7288069, -0.1346257, -0.7450177, 0.6431373, 1, 0, 1,
-0.7271576, 0.8078561, -0.2507591, 0.6392157, 1, 0, 1,
-0.7240483, 2.427312, 0.9889892, 0.6313726, 1, 0, 1,
-0.7205232, -0.4693954, -1.863855, 0.627451, 1, 0, 1,
-0.7179617, -1.237382, -3.907264, 0.6196079, 1, 0, 1,
-0.7174924, 0.47144, -2.130888, 0.6156863, 1, 0, 1,
-0.7157181, -1.648654, -2.635361, 0.6078432, 1, 0, 1,
-0.7085121, 0.5139226, -1.374831, 0.6039216, 1, 0, 1,
-0.7048315, -0.1895366, -2.880038, 0.5960785, 1, 0, 1,
-0.7034565, 0.5312685, 0.1997117, 0.5882353, 1, 0, 1,
-0.7027555, -0.4767449, -1.134652, 0.5843138, 1, 0, 1,
-0.6888943, 0.4091218, -0.01510774, 0.5764706, 1, 0, 1,
-0.6879122, 0.1983995, -1.905353, 0.572549, 1, 0, 1,
-0.6871062, -1.686083, -1.885388, 0.5647059, 1, 0, 1,
-0.6870696, -0.4965922, -2.438492, 0.5607843, 1, 0, 1,
-0.6867716, 0.1831474, -1.275517, 0.5529412, 1, 0, 1,
-0.6855574, -1.28512, -2.428922, 0.5490196, 1, 0, 1,
-0.6826757, 0.1089485, -3.14004, 0.5411765, 1, 0, 1,
-0.6794844, -1.723829, -2.737085, 0.5372549, 1, 0, 1,
-0.6720999, 0.4992084, 0.1428179, 0.5294118, 1, 0, 1,
-0.6716001, -0.7356879, -2.000511, 0.5254902, 1, 0, 1,
-0.6691243, -0.6682079, -1.934905, 0.5176471, 1, 0, 1,
-0.6668932, 1.139008, -0.8235284, 0.5137255, 1, 0, 1,
-0.6664051, -0.2614312, -0.2998278, 0.5058824, 1, 0, 1,
-0.6621454, -0.7160724, -3.782324, 0.5019608, 1, 0, 1,
-0.6609279, 0.7535198, -0.7717825, 0.4941176, 1, 0, 1,
-0.6588538, -1.159302, -2.820037, 0.4862745, 1, 0, 1,
-0.6568501, 1.26252, -0.3128443, 0.4823529, 1, 0, 1,
-0.6551526, -0.7583126, -1.360091, 0.4745098, 1, 0, 1,
-0.6533352, -0.510748, -0.0835118, 0.4705882, 1, 0, 1,
-0.6461186, 0.6551358, 1.598018, 0.4627451, 1, 0, 1,
-0.643002, -0.3526022, -1.126108, 0.4588235, 1, 0, 1,
-0.6381944, -0.003965225, -1.434654, 0.4509804, 1, 0, 1,
-0.6346245, 0.5884389, -2.871394, 0.4470588, 1, 0, 1,
-0.6262258, -0.4439809, -0.75965, 0.4392157, 1, 0, 1,
-0.6251011, 0.2833793, -0.794302, 0.4352941, 1, 0, 1,
-0.6245885, 0.1232903, -2.953966, 0.427451, 1, 0, 1,
-0.6155277, 2.145294, 0.5505391, 0.4235294, 1, 0, 1,
-0.6154169, 0.08394947, -1.524662, 0.4156863, 1, 0, 1,
-0.6144046, -0.2527021, -0.9855266, 0.4117647, 1, 0, 1,
-0.6137568, 1.235942, -1.586881, 0.4039216, 1, 0, 1,
-0.6135866, -0.3048171, -2.123284, 0.3960784, 1, 0, 1,
-0.6129269, -2.296451, -2.738408, 0.3921569, 1, 0, 1,
-0.6120135, 1.832732, -1.689275, 0.3843137, 1, 0, 1,
-0.6080806, -0.5353464, -2.916919, 0.3803922, 1, 0, 1,
-0.6004546, -0.5436848, -3.305749, 0.372549, 1, 0, 1,
-0.5992785, -0.1075364, -1.419432, 0.3686275, 1, 0, 1,
-0.5959105, 0.2672593, -1.477655, 0.3607843, 1, 0, 1,
-0.5942959, -0.4281759, -1.668682, 0.3568628, 1, 0, 1,
-0.5927046, 0.5412245, -1.807827, 0.3490196, 1, 0, 1,
-0.5908401, -1.365115, -3.910511, 0.345098, 1, 0, 1,
-0.5884899, 1.059016, -0.9474227, 0.3372549, 1, 0, 1,
-0.5867116, -1.552878, -4.625832, 0.3333333, 1, 0, 1,
-0.582628, -0.4583095, -3.439773, 0.3254902, 1, 0, 1,
-0.582253, -2.250206, -2.292702, 0.3215686, 1, 0, 1,
-0.5744077, 1.730307, -0.5222356, 0.3137255, 1, 0, 1,
-0.5629679, -0.9922155, -2.401717, 0.3098039, 1, 0, 1,
-0.5598177, 0.3491056, -0.8390124, 0.3019608, 1, 0, 1,
-0.5591137, -1.062069, -3.03243, 0.2941177, 1, 0, 1,
-0.5582302, -0.6372507, -1.347946, 0.2901961, 1, 0, 1,
-0.5578495, -0.5237164, -1.252657, 0.282353, 1, 0, 1,
-0.5545068, -0.1429387, -2.695517, 0.2784314, 1, 0, 1,
-0.5537173, -0.5045656, -0.6216904, 0.2705882, 1, 0, 1,
-0.5527463, -1.702382, -3.459224, 0.2666667, 1, 0, 1,
-0.5517482, -0.0761728, -2.602444, 0.2588235, 1, 0, 1,
-0.5393115, -1.199619, -3.51734, 0.254902, 1, 0, 1,
-0.5380132, 0.7041609, 0.1741921, 0.2470588, 1, 0, 1,
-0.5361777, 0.5638085, -0.3847091, 0.2431373, 1, 0, 1,
-0.5361742, 0.2156674, -0.6715708, 0.2352941, 1, 0, 1,
-0.5335843, -0.6932001, -0.9822232, 0.2313726, 1, 0, 1,
-0.53297, 0.9300682, 1.151705, 0.2235294, 1, 0, 1,
-0.5263219, 0.01134993, -0.05809636, 0.2196078, 1, 0, 1,
-0.5252921, 0.1470745, 0.0577388, 0.2117647, 1, 0, 1,
-0.5252492, -1.011632, -2.951955, 0.2078431, 1, 0, 1,
-0.5051343, 1.111927, -1.938616, 0.2, 1, 0, 1,
-0.5045211, -0.5414736, -2.751999, 0.1921569, 1, 0, 1,
-0.5037361, -0.6940167, -2.095759, 0.1882353, 1, 0, 1,
-0.5033469, -0.7344427, -4.239955, 0.1803922, 1, 0, 1,
-0.5021439, 1.319808, 0.09350897, 0.1764706, 1, 0, 1,
-0.4905916, -0.5452384, -2.192362, 0.1686275, 1, 0, 1,
-0.4898782, -0.627349, -0.7565572, 0.1647059, 1, 0, 1,
-0.4777107, 0.8031739, 0.7328346, 0.1568628, 1, 0, 1,
-0.4753461, 2.235416, 0.6852793, 0.1529412, 1, 0, 1,
-0.4738199, 1.717666, -0.2038222, 0.145098, 1, 0, 1,
-0.4728998, 0.7941319, 1.351072, 0.1411765, 1, 0, 1,
-0.4722348, 0.9099885, -0.8761237, 0.1333333, 1, 0, 1,
-0.4718084, 1.583122, -0.7995568, 0.1294118, 1, 0, 1,
-0.4713998, -1.000001, -3.404945, 0.1215686, 1, 0, 1,
-0.4700733, 1.205053, -1.880059, 0.1176471, 1, 0, 1,
-0.4697309, -1.553734, -3.358292, 0.1098039, 1, 0, 1,
-0.4687098, 0.8397156, -2.407026, 0.1058824, 1, 0, 1,
-0.4661356, 1.547545, -0.1484342, 0.09803922, 1, 0, 1,
-0.4639323, -0.166537, -0.6126181, 0.09019608, 1, 0, 1,
-0.4632998, -1.805736, -1.357255, 0.08627451, 1, 0, 1,
-0.4629808, 0.1882725, 0.06166558, 0.07843138, 1, 0, 1,
-0.4605461, -1.184261, -2.794266, 0.07450981, 1, 0, 1,
-0.4580239, 1.072472, -0.3539344, 0.06666667, 1, 0, 1,
-0.4567733, -0.6797932, -1.887142, 0.0627451, 1, 0, 1,
-0.4559067, 0.8272384, -1.005056, 0.05490196, 1, 0, 1,
-0.4552296, 0.739481, -0.321448, 0.05098039, 1, 0, 1,
-0.448789, 0.8560245, -1.139358, 0.04313726, 1, 0, 1,
-0.4487387, 1.237176, -0.244813, 0.03921569, 1, 0, 1,
-0.4478018, 0.4317852, -0.8607947, 0.03137255, 1, 0, 1,
-0.4466167, 1.719685, 0.9822723, 0.02745098, 1, 0, 1,
-0.4452045, 0.3281029, -0.3742476, 0.01960784, 1, 0, 1,
-0.4420356, -0.7410281, -2.852951, 0.01568628, 1, 0, 1,
-0.4412557, 1.407694, 1.654268, 0.007843138, 1, 0, 1,
-0.440047, -0.7673365, -1.862843, 0.003921569, 1, 0, 1,
-0.4393969, -2.25638, -3.786035, 0, 1, 0.003921569, 1,
-0.4371456, -0.2988625, -3.933085, 0, 1, 0.01176471, 1,
-0.4348681, 0.557511, -0.8205265, 0, 1, 0.01568628, 1,
-0.4288796, -1.508189, -3.150341, 0, 1, 0.02352941, 1,
-0.4286902, -0.4709472, -2.653403, 0, 1, 0.02745098, 1,
-0.4281094, 1.203889, -0.5321224, 0, 1, 0.03529412, 1,
-0.4265761, -0.6249858, -0.02935674, 0, 1, 0.03921569, 1,
-0.4256011, 0.5636782, -0.3993549, 0, 1, 0.04705882, 1,
-0.4243653, -0.3610156, -4.220312, 0, 1, 0.05098039, 1,
-0.4238172, -0.3988071, -2.116642, 0, 1, 0.05882353, 1,
-0.4220959, -1.440516, -1.312362, 0, 1, 0.0627451, 1,
-0.4181902, -1.065927, -1.13411, 0, 1, 0.07058824, 1,
-0.4145984, 0.8344147, -0.09922809, 0, 1, 0.07450981, 1,
-0.413376, -0.6704593, -2.335759, 0, 1, 0.08235294, 1,
-0.4127586, -0.5252066, -1.727498, 0, 1, 0.08627451, 1,
-0.412577, -0.1104327, 0.330114, 0, 1, 0.09411765, 1,
-0.4074846, 1.273248, -0.1346689, 0, 1, 0.1019608, 1,
-0.407449, -1.680902, -2.890341, 0, 1, 0.1058824, 1,
-0.4070592, -1.220697, -1.628558, 0, 1, 0.1137255, 1,
-0.4068935, -1.536561, -3.066535, 0, 1, 0.1176471, 1,
-0.405567, 1.014445, -0.5363912, 0, 1, 0.1254902, 1,
-0.404261, 0.1028474, -0.2808583, 0, 1, 0.1294118, 1,
-0.4030892, 1.346024, 0.247696, 0, 1, 0.1372549, 1,
-0.402692, -0.2338821, -1.637045, 0, 1, 0.1411765, 1,
-0.3986057, 1.450727, -1.334938, 0, 1, 0.1490196, 1,
-0.3971968, 1.019059, -0.5958098, 0, 1, 0.1529412, 1,
-0.3952561, -0.7226651, -1.37043, 0, 1, 0.1607843, 1,
-0.3942731, -0.05159903, -1.264621, 0, 1, 0.1647059, 1,
-0.3925455, 2.276419, -0.1287988, 0, 1, 0.172549, 1,
-0.3921234, -0.3346666, -0.6653421, 0, 1, 0.1764706, 1,
-0.3888246, -0.7041926, -3.387908, 0, 1, 0.1843137, 1,
-0.3838269, 0.05987668, -0.08473115, 0, 1, 0.1882353, 1,
-0.3795823, 0.9643071, 1.122002, 0, 1, 0.1960784, 1,
-0.3791996, 0.5155851, -1.238288, 0, 1, 0.2039216, 1,
-0.3791815, -1.053576, -2.925847, 0, 1, 0.2078431, 1,
-0.3746012, 0.09595934, -1.567114, 0, 1, 0.2156863, 1,
-0.372043, -0.6557898, -3.045124, 0, 1, 0.2196078, 1,
-0.3695981, 1.064713, 0.6371961, 0, 1, 0.227451, 1,
-0.3694969, -1.089849, -4.521231, 0, 1, 0.2313726, 1,
-0.3658443, -0.46576, -2.321839, 0, 1, 0.2392157, 1,
-0.359391, 0.5476258, -0.9314045, 0, 1, 0.2431373, 1,
-0.3542565, 0.2149327, -1.159499, 0, 1, 0.2509804, 1,
-0.3527263, -1.132915, -4.67099, 0, 1, 0.254902, 1,
-0.3515238, 0.5359311, -1.620157, 0, 1, 0.2627451, 1,
-0.3342879, 0.3727879, -0.3474979, 0, 1, 0.2666667, 1,
-0.3332725, -0.6691974, -3.688697, 0, 1, 0.2745098, 1,
-0.3284639, 0.3521512, -2.028775, 0, 1, 0.2784314, 1,
-0.3219804, -0.7800505, -4.030959, 0, 1, 0.2862745, 1,
-0.3173734, 1.491743, -0.04376772, 0, 1, 0.2901961, 1,
-0.3163708, 1.340888, 2.081563, 0, 1, 0.2980392, 1,
-0.312282, -0.8214044, -0.568631, 0, 1, 0.3058824, 1,
-0.3119341, 0.8958436, -2.17504, 0, 1, 0.3098039, 1,
-0.3097228, -0.9369255, -3.451535, 0, 1, 0.3176471, 1,
-0.3019922, -0.6875189, -2.236105, 0, 1, 0.3215686, 1,
-0.2918548, 0.3627429, -2.926602, 0, 1, 0.3294118, 1,
-0.2854056, 0.287943, -1.169226, 0, 1, 0.3333333, 1,
-0.284783, -1.794385, -2.6715, 0, 1, 0.3411765, 1,
-0.2834501, -0.4234042, -2.17916, 0, 1, 0.345098, 1,
-0.2834182, -2.863481, -3.817772, 0, 1, 0.3529412, 1,
-0.2774255, 1.12926, -0.09220573, 0, 1, 0.3568628, 1,
-0.2753094, -0.3637614, -4.70357, 0, 1, 0.3647059, 1,
-0.2752286, 0.9800531, 0.799486, 0, 1, 0.3686275, 1,
-0.2742332, 1.467191, 2.289835, 0, 1, 0.3764706, 1,
-0.2723671, -0.9615881, -2.363045, 0, 1, 0.3803922, 1,
-0.2704875, -0.1562553, -1.778733, 0, 1, 0.3882353, 1,
-0.2703839, -0.08852447, -1.384538, 0, 1, 0.3921569, 1,
-0.2682908, 0.7110561, 1.318676, 0, 1, 0.4, 1,
-0.2682626, 0.8523068, -1.568325, 0, 1, 0.4078431, 1,
-0.2654893, -0.9910626, -2.245161, 0, 1, 0.4117647, 1,
-0.2642388, -0.5744247, -3.860534, 0, 1, 0.4196078, 1,
-0.2571993, 0.918687, -0.2618365, 0, 1, 0.4235294, 1,
-0.2570872, 0.7336938, 0.343577, 0, 1, 0.4313726, 1,
-0.2527105, 0.9120593, 1.140922, 0, 1, 0.4352941, 1,
-0.2484062, -1.315288, -2.031625, 0, 1, 0.4431373, 1,
-0.2482883, 0.6006579, 1.121609, 0, 1, 0.4470588, 1,
-0.2481136, 1.569545, 1.555428, 0, 1, 0.454902, 1,
-0.2463219, -2.052449, -3.270822, 0, 1, 0.4588235, 1,
-0.2436157, -0.2804214, -2.400406, 0, 1, 0.4666667, 1,
-0.2400519, 1.201717, 0.8513852, 0, 1, 0.4705882, 1,
-0.2359169, -0.8125075, -4.124031, 0, 1, 0.4784314, 1,
-0.2330651, 0.394241, -1.528464, 0, 1, 0.4823529, 1,
-0.2324763, -0.09210076, -3.665087, 0, 1, 0.4901961, 1,
-0.2319889, 0.2870997, -0.7580653, 0, 1, 0.4941176, 1,
-0.2313266, -0.6445951, -1.709498, 0, 1, 0.5019608, 1,
-0.2288523, -0.7557172, -5.446452, 0, 1, 0.509804, 1,
-0.2283107, -0.978449, -4.080822, 0, 1, 0.5137255, 1,
-0.2254086, 1.64344, -2.348066, 0, 1, 0.5215687, 1,
-0.2189927, 0.7146521, 0.244062, 0, 1, 0.5254902, 1,
-0.2177605, 0.7113467, -0.1617508, 0, 1, 0.5333334, 1,
-0.2172976, -0.8257149, -3.874159, 0, 1, 0.5372549, 1,
-0.2133822, 0.1104393, -1.877214, 0, 1, 0.5450981, 1,
-0.2123722, -0.5298514, -3.099943, 0, 1, 0.5490196, 1,
-0.2109985, 1.470079, 0.3691961, 0, 1, 0.5568628, 1,
-0.2082558, 2.148378, -0.2236536, 0, 1, 0.5607843, 1,
-0.1958603, -1.793159, -3.241478, 0, 1, 0.5686275, 1,
-0.1946654, 1.173643, -1.408773, 0, 1, 0.572549, 1,
-0.1935279, -0.7369606, -2.830958, 0, 1, 0.5803922, 1,
-0.1893328, 0.16841, -0.1037371, 0, 1, 0.5843138, 1,
-0.181843, -0.587483, -4.233212, 0, 1, 0.5921569, 1,
-0.1816328, 1.02249, 1.023753, 0, 1, 0.5960785, 1,
-0.1779592, -0.1552588, -3.245187, 0, 1, 0.6039216, 1,
-0.1775295, -0.4309894, -3.539531, 0, 1, 0.6117647, 1,
-0.1774106, -0.4202671, -3.680747, 0, 1, 0.6156863, 1,
-0.1672816, -1.263334, -1.404114, 0, 1, 0.6235294, 1,
-0.1651302, 0.3704095, -1.118101, 0, 1, 0.627451, 1,
-0.1605569, 1.952977, -0.7523468, 0, 1, 0.6352941, 1,
-0.1541402, 0.2890096, 0.7415479, 0, 1, 0.6392157, 1,
-0.1538961, -1.40334, -3.988992, 0, 1, 0.6470588, 1,
-0.1518478, 0.3612381, 0.1751246, 0, 1, 0.6509804, 1,
-0.1517956, -0.3053257, -1.845655, 0, 1, 0.6588235, 1,
-0.1483322, 0.6186868, -0.8239486, 0, 1, 0.6627451, 1,
-0.1472927, 0.8777518, 0.6335337, 0, 1, 0.6705883, 1,
-0.1453986, 0.08107204, 0.8430475, 0, 1, 0.6745098, 1,
-0.1444678, -1.199038, -2.550038, 0, 1, 0.682353, 1,
-0.1406397, 0.0907675, -1.013573, 0, 1, 0.6862745, 1,
-0.1381603, -1.733498, -2.270909, 0, 1, 0.6941177, 1,
-0.1374156, -0.7848105, -2.647106, 0, 1, 0.7019608, 1,
-0.1372636, 0.7834031, 0.9205077, 0, 1, 0.7058824, 1,
-0.1369059, -0.8239068, -3.773265, 0, 1, 0.7137255, 1,
-0.132497, 2.781642, 0.03219307, 0, 1, 0.7176471, 1,
-0.1292308, 2.141483, -0.6567816, 0, 1, 0.7254902, 1,
-0.1287708, 1.62518, -1.255675, 0, 1, 0.7294118, 1,
-0.1253155, -0.568305, -1.73246, 0, 1, 0.7372549, 1,
-0.1223269, -0.4330902, -1.432592, 0, 1, 0.7411765, 1,
-0.1214081, 0.3351289, -1.056215, 0, 1, 0.7490196, 1,
-0.1201571, -1.63277, -5.841248, 0, 1, 0.7529412, 1,
-0.1187033, -0.1671261, -2.338466, 0, 1, 0.7607843, 1,
-0.1166694, 0.7026516, -0.3177792, 0, 1, 0.7647059, 1,
-0.1151716, -0.4397056, -3.524528, 0, 1, 0.772549, 1,
-0.1088383, 0.1289746, -2.027576, 0, 1, 0.7764706, 1,
-0.1078748, 1.868696, -0.2455235, 0, 1, 0.7843137, 1,
-0.1060403, -0.02244602, -0.9239464, 0, 1, 0.7882353, 1,
-0.1048941, -0.6705977, -3.164143, 0, 1, 0.7960784, 1,
-0.1025667, -0.6736526, -3.50775, 0, 1, 0.8039216, 1,
-0.1023305, -0.314642, -5.317903, 0, 1, 0.8078431, 1,
-0.101863, -0.3096986, -1.820895, 0, 1, 0.8156863, 1,
-0.1014301, 0.8390121, 0.015954, 0, 1, 0.8196079, 1,
-0.1001729, -1.675034, -2.233477, 0, 1, 0.827451, 1,
-0.1000967, -1.785557, -4.44899, 0, 1, 0.8313726, 1,
-0.09618406, -0.7624753, -3.188864, 0, 1, 0.8392157, 1,
-0.09046696, 0.6426181, -0.2119233, 0, 1, 0.8431373, 1,
-0.08633132, 0.5977411, 0.8233866, 0, 1, 0.8509804, 1,
-0.08469657, -0.2544479, -2.738174, 0, 1, 0.854902, 1,
-0.08282252, -1.389242, -3.718913, 0, 1, 0.8627451, 1,
-0.08241923, -0.9121168, -3.206179, 0, 1, 0.8666667, 1,
-0.08237836, 0.2848787, -0.8209786, 0, 1, 0.8745098, 1,
-0.07876213, 1.708307, 0.3606465, 0, 1, 0.8784314, 1,
-0.07703611, 1.134958, -2.301964, 0, 1, 0.8862745, 1,
-0.07342939, -0.6940219, -4.075328, 0, 1, 0.8901961, 1,
-0.0691932, 0.4612859, -0.151929, 0, 1, 0.8980392, 1,
-0.06703495, 0.07971094, -1.7254, 0, 1, 0.9058824, 1,
-0.06693507, 0.7652075, 2.481061, 0, 1, 0.9098039, 1,
-0.06380404, -0.7046424, -2.621448, 0, 1, 0.9176471, 1,
-0.06281762, -0.2266965, -4.460429, 0, 1, 0.9215686, 1,
-0.06072635, -0.9183004, -3.322082, 0, 1, 0.9294118, 1,
-0.0565028, -0.4198989, -1.555058, 0, 1, 0.9333333, 1,
-0.05398113, -0.4662709, -2.351052, 0, 1, 0.9411765, 1,
-0.05283641, -0.06944358, -2.044441, 0, 1, 0.945098, 1,
-0.05184763, 0.6011063, -0.1793852, 0, 1, 0.9529412, 1,
-0.05145892, -1.270912, -2.767624, 0, 1, 0.9568627, 1,
-0.04942576, -0.8295946, -3.489143, 0, 1, 0.9647059, 1,
-0.04887701, 1.969796, -0.3015179, 0, 1, 0.9686275, 1,
-0.04881741, -0.2283362, -4.841378, 0, 1, 0.9764706, 1,
-0.04599122, 0.5676351, -0.9999785, 0, 1, 0.9803922, 1,
-0.04578435, 0.3051598, -0.1387343, 0, 1, 0.9882353, 1,
-0.04440824, 0.08264083, -0.9556605, 0, 1, 0.9921569, 1,
-0.04393408, -0.1492143, -5.239989, 0, 1, 1, 1,
-0.04249165, -0.1494973, -4.219879, 0, 0.9921569, 1, 1,
-0.04235857, 1.002074, 0.03605699, 0, 0.9882353, 1, 1,
-0.03797956, 1.27433, 0.06536435, 0, 0.9803922, 1, 1,
-0.03535556, 0.5132774, 0.07003525, 0, 0.9764706, 1, 1,
-0.03115484, 0.1024949, -1.830684, 0, 0.9686275, 1, 1,
-0.02942904, 0.4921439, -1.21339, 0, 0.9647059, 1, 1,
-0.02520613, 1.0255, -1.241559, 0, 0.9568627, 1, 1,
-0.02507151, 0.02318989, -0.9234982, 0, 0.9529412, 1, 1,
-0.01446713, 1.344126, 1.165286, 0, 0.945098, 1, 1,
-0.007601936, 0.06959485, 1.095864, 0, 0.9411765, 1, 1,
-0.004156435, -1.4379, -3.774287, 0, 0.9333333, 1, 1,
-0.003674055, 0.3384749, 0.0194454, 0, 0.9294118, 1, 1,
-0.0007174037, 0.08216155, 1.168742, 0, 0.9215686, 1, 1,
-4.788237e-05, -0.9868436, -3.496403, 0, 0.9176471, 1, 1,
0.01124254, 0.1586643, 0.2691477, 0, 0.9098039, 1, 1,
0.0161337, -1.320995, 2.491502, 0, 0.9058824, 1, 1,
0.01876851, -1.671424, 2.214289, 0, 0.8980392, 1, 1,
0.02179178, 0.02176482, 0.8919942, 0, 0.8901961, 1, 1,
0.02185928, 1.357131, 0.3195508, 0, 0.8862745, 1, 1,
0.02777071, -0.07757367, 2.101343, 0, 0.8784314, 1, 1,
0.02931881, -0.4513524, 1.584279, 0, 0.8745098, 1, 1,
0.03043593, -0.1964082, 4.294106, 0, 0.8666667, 1, 1,
0.030747, 0.3160273, 0.09339852, 0, 0.8627451, 1, 1,
0.03102558, -1.006361, 1.945948, 0, 0.854902, 1, 1,
0.03460972, 0.2457609, -0.1355233, 0, 0.8509804, 1, 1,
0.0365004, -0.7832319, 1.438105, 0, 0.8431373, 1, 1,
0.03952156, 0.6411868, 0.5929074, 0, 0.8392157, 1, 1,
0.04216047, -1.35762, 2.222684, 0, 0.8313726, 1, 1,
0.04515472, -0.2786122, 3.055157, 0, 0.827451, 1, 1,
0.04523113, -1.378197, 3.380281, 0, 0.8196079, 1, 1,
0.04539901, -0.8961009, 4.482656, 0, 0.8156863, 1, 1,
0.04780189, 0.107736, -0.990038, 0, 0.8078431, 1, 1,
0.05226685, 1.284555, -0.5814503, 0, 0.8039216, 1, 1,
0.05996998, 1.297535, 1.813045, 0, 0.7960784, 1, 1,
0.06596851, 0.4766509, 2.219011, 0, 0.7882353, 1, 1,
0.0669714, 0.0958821, 1.591223, 0, 0.7843137, 1, 1,
0.06826941, 0.1038837, 0.4355322, 0, 0.7764706, 1, 1,
0.06843001, -1.162305, 3.567056, 0, 0.772549, 1, 1,
0.06985737, 1.123174, -1.303705, 0, 0.7647059, 1, 1,
0.06987543, 0.426538, -0.4127103, 0, 0.7607843, 1, 1,
0.07099835, -1.784467, 3.731909, 0, 0.7529412, 1, 1,
0.07110859, -0.3746734, 2.090435, 0, 0.7490196, 1, 1,
0.08294947, -0.07502957, 2.88339, 0, 0.7411765, 1, 1,
0.0863641, 0.6139146, 0.5182901, 0, 0.7372549, 1, 1,
0.08718613, 0.2525086, 1.646458, 0, 0.7294118, 1, 1,
0.08814488, 1.008768, -0.1770357, 0, 0.7254902, 1, 1,
0.08875681, -0.07825197, 3.075948, 0, 0.7176471, 1, 1,
0.09594466, 0.2426144, 0.1451946, 0, 0.7137255, 1, 1,
0.09840111, 1.190331, -0.09859795, 0, 0.7058824, 1, 1,
0.1014652, 0.7406888, -0.05294468, 0, 0.6980392, 1, 1,
0.1068604, 0.2934034, 0.9805399, 0, 0.6941177, 1, 1,
0.1076511, 0.7039841, -1.003219, 0, 0.6862745, 1, 1,
0.1102641, -0.7334607, 4.562332, 0, 0.682353, 1, 1,
0.1106363, -0.8395034, 2.286257, 0, 0.6745098, 1, 1,
0.1112365, -0.1909354, 4.182856, 0, 0.6705883, 1, 1,
0.1122398, 1.15773, 0.5734807, 0, 0.6627451, 1, 1,
0.1127322, 0.07514213, 2.035859, 0, 0.6588235, 1, 1,
0.1215296, 0.02149413, 3.055035, 0, 0.6509804, 1, 1,
0.1246091, -1.104436, 3.903942, 0, 0.6470588, 1, 1,
0.1264026, -0.3456439, 2.050873, 0, 0.6392157, 1, 1,
0.126417, 0.842913, 0.9565572, 0, 0.6352941, 1, 1,
0.1264514, -0.1858968, 2.50234, 0, 0.627451, 1, 1,
0.1272276, -0.253636, 1.158934, 0, 0.6235294, 1, 1,
0.1287015, 0.6621843, -0.1839015, 0, 0.6156863, 1, 1,
0.1327639, -1.161477, 3.163917, 0, 0.6117647, 1, 1,
0.1328373, -1.873443, 3.357817, 0, 0.6039216, 1, 1,
0.1362284, -0.1413931, 1.82734, 0, 0.5960785, 1, 1,
0.1373415, 0.1776951, 1.898453, 0, 0.5921569, 1, 1,
0.1387837, 0.6110564, -0.1834381, 0, 0.5843138, 1, 1,
0.1387867, -0.3365595, 2.317698, 0, 0.5803922, 1, 1,
0.1390138, 0.3120506, -0.0352035, 0, 0.572549, 1, 1,
0.1414873, -0.4354958, 2.182155, 0, 0.5686275, 1, 1,
0.1420263, 0.3809147, -1.045641, 0, 0.5607843, 1, 1,
0.1423205, 0.1128362, 0.4258223, 0, 0.5568628, 1, 1,
0.1456621, -0.09367095, 2.895009, 0, 0.5490196, 1, 1,
0.1464326, 0.09187974, 0.7879925, 0, 0.5450981, 1, 1,
0.1497512, 1.357309, 0.1326191, 0, 0.5372549, 1, 1,
0.1647739, 1.435314, -1.020201, 0, 0.5333334, 1, 1,
0.16479, 0.7265318, -0.194529, 0, 0.5254902, 1, 1,
0.1666429, 1.172842, -0.840363, 0, 0.5215687, 1, 1,
0.1706661, -0.1676562, 3.167913, 0, 0.5137255, 1, 1,
0.1717835, -1.374363, 4.620995, 0, 0.509804, 1, 1,
0.1721218, 0.7889087, 0.186494, 0, 0.5019608, 1, 1,
0.173427, 1.15031, 0.3499515, 0, 0.4941176, 1, 1,
0.1756632, -1.480576, 1.858989, 0, 0.4901961, 1, 1,
0.1797873, -0.02359786, 1.952179, 0, 0.4823529, 1, 1,
0.180323, -0.8059275, 1.022089, 0, 0.4784314, 1, 1,
0.1809967, -1.205141, 2.62677, 0, 0.4705882, 1, 1,
0.1815868, 0.7221683, 0.4913401, 0, 0.4666667, 1, 1,
0.1835435, -0.3185061, 1.900605, 0, 0.4588235, 1, 1,
0.1845505, -0.6306989, 3.533777, 0, 0.454902, 1, 1,
0.1846748, -1.298796, 3.4543, 0, 0.4470588, 1, 1,
0.1849452, -1.368315, 3.436158, 0, 0.4431373, 1, 1,
0.1880899, 0.2385708, 0.3528725, 0, 0.4352941, 1, 1,
0.1899935, -0.7302157, 0.3322314, 0, 0.4313726, 1, 1,
0.1906941, -1.211962, 3.807501, 0, 0.4235294, 1, 1,
0.1907714, 1.813851, 1.337985, 0, 0.4196078, 1, 1,
0.1938174, 0.7716578, -0.7396333, 0, 0.4117647, 1, 1,
0.1943051, 0.2749574, -0.2883627, 0, 0.4078431, 1, 1,
0.2003777, 1.865919, -1.282071, 0, 0.4, 1, 1,
0.2011128, -0.435051, 5.343861, 0, 0.3921569, 1, 1,
0.2013157, 0.2083302, 0.01526143, 0, 0.3882353, 1, 1,
0.2141702, 1.271208, -0.7546019, 0, 0.3803922, 1, 1,
0.2145347, 0.3300281, 0.1151671, 0, 0.3764706, 1, 1,
0.2150266, 0.8045622, 0.1425711, 0, 0.3686275, 1, 1,
0.2159681, -0.2524849, 3.856343, 0, 0.3647059, 1, 1,
0.2166214, -1.039698, 2.100157, 0, 0.3568628, 1, 1,
0.2211709, 1.954778, -0.8906651, 0, 0.3529412, 1, 1,
0.2226229, -0.7405846, 0.9317152, 0, 0.345098, 1, 1,
0.2243135, -0.1803486, 4.044089, 0, 0.3411765, 1, 1,
0.2252056, 0.5144967, 0.7235649, 0, 0.3333333, 1, 1,
0.2261481, -0.1237184, 1.953104, 0, 0.3294118, 1, 1,
0.2279463, -0.5298324, 2.817651, 0, 0.3215686, 1, 1,
0.2317213, -1.907905, 4.046614, 0, 0.3176471, 1, 1,
0.233421, 0.7935764, 0.8724941, 0, 0.3098039, 1, 1,
0.2337006, 0.3488787, 1.931796, 0, 0.3058824, 1, 1,
0.2370779, 0.236302, 1.018968, 0, 0.2980392, 1, 1,
0.2381456, -0.09894912, 1.376855, 0, 0.2901961, 1, 1,
0.2457693, -0.6333323, 3.510658, 0, 0.2862745, 1, 1,
0.2458744, -0.6985074, 3.641907, 0, 0.2784314, 1, 1,
0.246168, -0.5460156, 3.412814, 0, 0.2745098, 1, 1,
0.2483991, 0.23429, 0.3588469, 0, 0.2666667, 1, 1,
0.2485829, -1.169669, 2.290335, 0, 0.2627451, 1, 1,
0.2530631, 0.8089887, -0.1214302, 0, 0.254902, 1, 1,
0.25337, -0.7206137, 1.783471, 0, 0.2509804, 1, 1,
0.2534966, -0.354747, 2.311645, 0, 0.2431373, 1, 1,
0.2546705, 0.1123521, 2.314837, 0, 0.2392157, 1, 1,
0.2555877, -1.285143, 2.827109, 0, 0.2313726, 1, 1,
0.2568623, 0.09829871, 1.062374, 0, 0.227451, 1, 1,
0.2671823, -1.025419, 3.205159, 0, 0.2196078, 1, 1,
0.2672085, 0.5128418, 0.7044959, 0, 0.2156863, 1, 1,
0.2676235, -1.437049, 2.56308, 0, 0.2078431, 1, 1,
0.2684514, -0.3148419, 2.86732, 0, 0.2039216, 1, 1,
0.2693404, -0.6639828, 2.179363, 0, 0.1960784, 1, 1,
0.2707835, 1.307144, -0.08159906, 0, 0.1882353, 1, 1,
0.270802, 0.1574219, 0.41886, 0, 0.1843137, 1, 1,
0.2757089, 0.9223122, -1.282004, 0, 0.1764706, 1, 1,
0.2786313, 1.88533, 0.4531398, 0, 0.172549, 1, 1,
0.2819205, -0.7140413, 2.727355, 0, 0.1647059, 1, 1,
0.2874134, -1.075798, 2.635557, 0, 0.1607843, 1, 1,
0.2892371, -1.793576, 4.635255, 0, 0.1529412, 1, 1,
0.2953383, 0.397116, -0.2533105, 0, 0.1490196, 1, 1,
0.2978952, 1.002373, -0.3367729, 0, 0.1411765, 1, 1,
0.3011284, 0.4197646, 0.2002173, 0, 0.1372549, 1, 1,
0.3033526, 0.5376589, -0.05364582, 0, 0.1294118, 1, 1,
0.3035607, -0.5746796, 2.429251, 0, 0.1254902, 1, 1,
0.3056419, -2.185991, 0.6542209, 0, 0.1176471, 1, 1,
0.3057921, 0.05238523, 1.75683, 0, 0.1137255, 1, 1,
0.3105078, -0.07063659, 2.206363, 0, 0.1058824, 1, 1,
0.3241159, -1.915356, 2.859218, 0, 0.09803922, 1, 1,
0.3271265, -1.003612, 2.329384, 0, 0.09411765, 1, 1,
0.3295243, 0.8842411, -0.9208121, 0, 0.08627451, 1, 1,
0.3405548, 0.9836007, 0.04732792, 0, 0.08235294, 1, 1,
0.3412965, 0.112143, 1.663966, 0, 0.07450981, 1, 1,
0.3413032, -1.308979, 1.436614, 0, 0.07058824, 1, 1,
0.3496682, 0.8525837, -1.174609, 0, 0.0627451, 1, 1,
0.349932, 1.103317, 0.4810606, 0, 0.05882353, 1, 1,
0.352773, -0.1787014, 1.17684, 0, 0.05098039, 1, 1,
0.3534975, 0.6391014, 1.701418, 0, 0.04705882, 1, 1,
0.3547361, -1.077466, 3.079974, 0, 0.03921569, 1, 1,
0.3548886, -0.795005, 0.7316897, 0, 0.03529412, 1, 1,
0.3577694, -0.2558638, 3.161059, 0, 0.02745098, 1, 1,
0.3591342, -0.9873453, 1.302466, 0, 0.02352941, 1, 1,
0.3643311, -0.6344882, 2.370469, 0, 0.01568628, 1, 1,
0.3647398, -2.511382, 1.601275, 0, 0.01176471, 1, 1,
0.3668985, 0.5277492, -0.1479564, 0, 0.003921569, 1, 1,
0.3679552, 2.227393, -0.4813484, 0.003921569, 0, 1, 1,
0.3772669, 0.001670727, 0.2270192, 0.007843138, 0, 1, 1,
0.3830971, -0.9277495, 3.712491, 0.01568628, 0, 1, 1,
0.3837507, 0.9096233, 0.2170548, 0.01960784, 0, 1, 1,
0.3884054, 0.8144419, -0.1036302, 0.02745098, 0, 1, 1,
0.39176, 1.323878, -0.2387113, 0.03137255, 0, 1, 1,
0.3932877, 1.099255, 0.4108404, 0.03921569, 0, 1, 1,
0.3946746, -0.467552, 1.355913, 0.04313726, 0, 1, 1,
0.3971876, 1.125871, 1.20848, 0.05098039, 0, 1, 1,
0.3973008, -1.059292, 4.028092, 0.05490196, 0, 1, 1,
0.4002644, 0.2121828, 1.527244, 0.0627451, 0, 1, 1,
0.4060644, -0.6992654, 2.246336, 0.06666667, 0, 1, 1,
0.4077857, 0.07165775, 2.249273, 0.07450981, 0, 1, 1,
0.4135744, 0.7994737, -0.3918771, 0.07843138, 0, 1, 1,
0.4183328, -0.2072774, 2.957051, 0.08627451, 0, 1, 1,
0.4204799, -1.406994, 2.242127, 0.09019608, 0, 1, 1,
0.4263475, 0.2247503, 0.04392353, 0.09803922, 0, 1, 1,
0.4276155, 0.9008312, 0.8043943, 0.1058824, 0, 1, 1,
0.4289343, -1.801702, 1.583635, 0.1098039, 0, 1, 1,
0.4344479, -0.6244808, 2.331191, 0.1176471, 0, 1, 1,
0.4428707, -0.02804645, 1.37566, 0.1215686, 0, 1, 1,
0.4431001, 0.4201024, 1.934708, 0.1294118, 0, 1, 1,
0.4433009, 0.5092148, 2.566453, 0.1333333, 0, 1, 1,
0.4488587, 0.5804826, 2.249488, 0.1411765, 0, 1, 1,
0.4501848, 0.7026243, 0.2721334, 0.145098, 0, 1, 1,
0.4527206, 0.6295179, 1.852876, 0.1529412, 0, 1, 1,
0.4529622, -1.188186, 3.648408, 0.1568628, 0, 1, 1,
0.4570059, 1.667788, -0.2001297, 0.1647059, 0, 1, 1,
0.4671701, -1.221959, 3.601057, 0.1686275, 0, 1, 1,
0.468852, -0.6734536, 2.879079, 0.1764706, 0, 1, 1,
0.4693519, 0.2656938, 1.483439, 0.1803922, 0, 1, 1,
0.4824725, 1.573793, 1.848668, 0.1882353, 0, 1, 1,
0.4825035, -0.4410134, 0.2849838, 0.1921569, 0, 1, 1,
0.4845357, 1.770919, -0.6065913, 0.2, 0, 1, 1,
0.4848891, 0.4197369, 0.4617485, 0.2078431, 0, 1, 1,
0.487476, 0.4056289, -0.07660572, 0.2117647, 0, 1, 1,
0.4886563, -0.03578248, 0.3205574, 0.2196078, 0, 1, 1,
0.4896317, 1.157297, -1.161942, 0.2235294, 0, 1, 1,
0.4915925, 1.423711, 1.489141, 0.2313726, 0, 1, 1,
0.4992698, 0.6685345, 0.3069956, 0.2352941, 0, 1, 1,
0.4994887, -0.3470225, 2.830038, 0.2431373, 0, 1, 1,
0.4996373, -1.163697, 3.068677, 0.2470588, 0, 1, 1,
0.5024223, -0.3695038, 2.523804, 0.254902, 0, 1, 1,
0.5030106, -0.3786398, 0.3375103, 0.2588235, 0, 1, 1,
0.5050981, 3.011062, 0.447498, 0.2666667, 0, 1, 1,
0.5081146, 0.8605793, 1.67601, 0.2705882, 0, 1, 1,
0.5087314, -1.271544, 2.399803, 0.2784314, 0, 1, 1,
0.5098452, -0.6254832, 2.666968, 0.282353, 0, 1, 1,
0.5222483, 0.1175073, 1.583808, 0.2901961, 0, 1, 1,
0.5238402, 0.6396938, 0.02143047, 0.2941177, 0, 1, 1,
0.5279393, -0.8281135, 2.512865, 0.3019608, 0, 1, 1,
0.5404018, -0.6682761, 1.785139, 0.3098039, 0, 1, 1,
0.5421332, 1.902008, 0.4962142, 0.3137255, 0, 1, 1,
0.5500417, -1.235131, 2.263811, 0.3215686, 0, 1, 1,
0.5537475, 0.06817446, 0.649065, 0.3254902, 0, 1, 1,
0.5615239, -0.8161169, 2.791607, 0.3333333, 0, 1, 1,
0.5615977, 1.055109, -0.2998978, 0.3372549, 0, 1, 1,
0.57202, -1.239546, 2.927066, 0.345098, 0, 1, 1,
0.5781265, 0.1240178, 0.7370059, 0.3490196, 0, 1, 1,
0.5795392, -0.8960146, 2.994792, 0.3568628, 0, 1, 1,
0.583902, 0.7867213, 1.254475, 0.3607843, 0, 1, 1,
0.5844572, 0.08659168, 2.913839, 0.3686275, 0, 1, 1,
0.5876513, -1.379514, 3.808526, 0.372549, 0, 1, 1,
0.5904767, 0.8531877, 2.141329, 0.3803922, 0, 1, 1,
0.5906221, 1.675892, -1.04472, 0.3843137, 0, 1, 1,
0.5976964, -1.601521, 4.557574, 0.3921569, 0, 1, 1,
0.6006029, 0.7318202, 1.61053, 0.3960784, 0, 1, 1,
0.6039391, 0.7812412, 1.311274, 0.4039216, 0, 1, 1,
0.6053839, 0.7975932, -0.9273331, 0.4117647, 0, 1, 1,
0.6158434, -0.4583135, 3.316492, 0.4156863, 0, 1, 1,
0.6199809, -1.048449, 0.3659459, 0.4235294, 0, 1, 1,
0.6204469, -2.618793, 2.624759, 0.427451, 0, 1, 1,
0.6227641, 2.560758, 1.836448, 0.4352941, 0, 1, 1,
0.6259157, -0.4487358, 2.06762, 0.4392157, 0, 1, 1,
0.630876, 0.296466, 2.225842, 0.4470588, 0, 1, 1,
0.6308836, -0.3279968, 0.6534702, 0.4509804, 0, 1, 1,
0.6318492, -0.3305932, 1.526517, 0.4588235, 0, 1, 1,
0.631896, 1.022532, 2.364671, 0.4627451, 0, 1, 1,
0.6367967, -0.8247896, 1.916321, 0.4705882, 0, 1, 1,
0.6377193, 0.28057, 2.574171, 0.4745098, 0, 1, 1,
0.6447598, 1.124711, 0.8337723, 0.4823529, 0, 1, 1,
0.6548719, 2.170018, -0.05691255, 0.4862745, 0, 1, 1,
0.656227, -1.079287, 1.587931, 0.4941176, 0, 1, 1,
0.6569459, -0.3946493, 1.052049, 0.5019608, 0, 1, 1,
0.6633474, 0.623253, -0.4304216, 0.5058824, 0, 1, 1,
0.6649935, -0.1536825, 3.202527, 0.5137255, 0, 1, 1,
0.6715866, 0.4914461, 1.906124, 0.5176471, 0, 1, 1,
0.674905, -0.2009654, 1.32174, 0.5254902, 0, 1, 1,
0.678142, 1.593431, 1.269557, 0.5294118, 0, 1, 1,
0.6792407, 0.8263131, 0.3399809, 0.5372549, 0, 1, 1,
0.688349, -0.3959535, 1.927184, 0.5411765, 0, 1, 1,
0.6905702, 0.3037081, 0.8993908, 0.5490196, 0, 1, 1,
0.6959283, 0.7606309, 2.078142, 0.5529412, 0, 1, 1,
0.6959386, 0.3701724, -0.2646447, 0.5607843, 0, 1, 1,
0.7017351, -2.232984, 3.529211, 0.5647059, 0, 1, 1,
0.7026525, 0.295773, 1.828999, 0.572549, 0, 1, 1,
0.703084, -0.4801212, 1.303953, 0.5764706, 0, 1, 1,
0.7065093, -0.9190032, 3.263832, 0.5843138, 0, 1, 1,
0.7066814, 0.5628722, 1.824571, 0.5882353, 0, 1, 1,
0.7066962, -0.3665301, 0.414663, 0.5960785, 0, 1, 1,
0.7090023, -0.008621352, 1.30723, 0.6039216, 0, 1, 1,
0.7173837, -0.004463611, 1.930451, 0.6078432, 0, 1, 1,
0.7188779, -0.9696478, 2.877835, 0.6156863, 0, 1, 1,
0.7210612, -0.2480509, 1.436507, 0.6196079, 0, 1, 1,
0.723999, -0.3919156, 3.806459, 0.627451, 0, 1, 1,
0.7258103, 0.2197092, 0.8323048, 0.6313726, 0, 1, 1,
0.7276406, -1.065229, 2.009492, 0.6392157, 0, 1, 1,
0.7283739, 0.6381429, -0.1531646, 0.6431373, 0, 1, 1,
0.7314896, 0.812986, -0.704642, 0.6509804, 0, 1, 1,
0.7463846, 0.5216342, -1.108986, 0.654902, 0, 1, 1,
0.7512197, -0.008257117, 1.148913, 0.6627451, 0, 1, 1,
0.751865, 1.849987, 0.7061135, 0.6666667, 0, 1, 1,
0.7524913, -1.07918, 3.144348, 0.6745098, 0, 1, 1,
0.7535978, 0.6095806, -0.588181, 0.6784314, 0, 1, 1,
0.7599521, 0.9461904, 1.372321, 0.6862745, 0, 1, 1,
0.7640214, -0.4938395, 1.561169, 0.6901961, 0, 1, 1,
0.7679947, 0.231565, 1.153843, 0.6980392, 0, 1, 1,
0.7721901, -0.1794161, 2.408221, 0.7058824, 0, 1, 1,
0.7823261, 0.9117275, 0.2416539, 0.7098039, 0, 1, 1,
0.7829084, 0.01848704, 1.903862, 0.7176471, 0, 1, 1,
0.787066, -0.7788517, 1.817031, 0.7215686, 0, 1, 1,
0.7893443, -1.494165, 4.551949, 0.7294118, 0, 1, 1,
0.7918681, 0.3266009, 0.9758094, 0.7333333, 0, 1, 1,
0.7967281, -1.431333, 3.041753, 0.7411765, 0, 1, 1,
0.7970104, -1.240394, 2.085723, 0.7450981, 0, 1, 1,
0.7977663, 2.469158, 0.03073646, 0.7529412, 0, 1, 1,
0.7984559, -1.428884, 3.605149, 0.7568628, 0, 1, 1,
0.7987074, -0.004076688, 1.631054, 0.7647059, 0, 1, 1,
0.8006657, 0.2953582, 0.3914425, 0.7686275, 0, 1, 1,
0.8017083, 0.1570624, 1.244506, 0.7764706, 0, 1, 1,
0.8110362, -0.6538938, 3.956745, 0.7803922, 0, 1, 1,
0.815685, 0.6601717, 0.6946857, 0.7882353, 0, 1, 1,
0.8156953, -1.222693, 1.680183, 0.7921569, 0, 1, 1,
0.8228645, -0.1555793, 0.5665917, 0.8, 0, 1, 1,
0.8278998, -1.469755, 3.425397, 0.8078431, 0, 1, 1,
0.8296428, -0.5858718, 3.333709, 0.8117647, 0, 1, 1,
0.8368609, 0.2523901, 0.2808169, 0.8196079, 0, 1, 1,
0.8376617, 0.4394473, -0.4103741, 0.8235294, 0, 1, 1,
0.8385053, -1.832315, 3.755396, 0.8313726, 0, 1, 1,
0.8395694, -1.606089, 2.497868, 0.8352941, 0, 1, 1,
0.8395869, -1.25544, 1.183716, 0.8431373, 0, 1, 1,
0.8406901, 0.716057, 1.20764, 0.8470588, 0, 1, 1,
0.8508595, -1.501246, 4.738497, 0.854902, 0, 1, 1,
0.8533668, -1.229182, 3.331253, 0.8588235, 0, 1, 1,
0.8546181, 0.003275395, 1.048187, 0.8666667, 0, 1, 1,
0.8547937, -1.554997, 2.56825, 0.8705882, 0, 1, 1,
0.8616961, -1.541586, 3.393203, 0.8784314, 0, 1, 1,
0.8659781, -0.4961886, 1.981131, 0.8823529, 0, 1, 1,
0.8725961, 0.6823437, 1.543819, 0.8901961, 0, 1, 1,
0.8726335, 0.570415, 0.4824786, 0.8941177, 0, 1, 1,
0.8738117, -0.5093568, 1.359441, 0.9019608, 0, 1, 1,
0.8866812, 0.06866647, 2.95173, 0.9098039, 0, 1, 1,
0.8892879, -0.2225255, 1.998646, 0.9137255, 0, 1, 1,
0.8905488, 0.7450189, 3.580151, 0.9215686, 0, 1, 1,
0.8925908, 0.3662225, -0.01697195, 0.9254902, 0, 1, 1,
0.8961325, 1.014529, -0.1719627, 0.9333333, 0, 1, 1,
0.8962178, 1.276752, 1.54074, 0.9372549, 0, 1, 1,
0.8990318, 0.68396, 2.158293, 0.945098, 0, 1, 1,
0.9132959, -0.7897575, 1.53993, 0.9490196, 0, 1, 1,
0.9143301, 1.077324, 1.050587, 0.9568627, 0, 1, 1,
0.915834, 1.359716, 0.8826914, 0.9607843, 0, 1, 1,
0.9161795, 0.08133417, 1.138856, 0.9686275, 0, 1, 1,
0.9262274, -0.5845099, 2.390092, 0.972549, 0, 1, 1,
0.9263963, 0.5329719, -0.1903261, 0.9803922, 0, 1, 1,
0.9300013, -0.9013439, 1.674484, 0.9843137, 0, 1, 1,
0.9329265, -0.8577174, 2.162629, 0.9921569, 0, 1, 1,
0.9332548, -0.2364013, 0.6453143, 0.9960784, 0, 1, 1,
0.9347929, 1.971751, 0.7793443, 1, 0, 0.9960784, 1,
0.9363307, -1.275632, 3.17409, 1, 0, 0.9882353, 1,
0.9380974, -0.1845361, 2.310093, 1, 0, 0.9843137, 1,
0.9421605, -0.3111831, 0.9863813, 1, 0, 0.9764706, 1,
0.9429809, -0.5377713, -0.1446068, 1, 0, 0.972549, 1,
0.9522502, -0.3654456, 2.343886, 1, 0, 0.9647059, 1,
0.9555176, 0.708178, 2.154641, 1, 0, 0.9607843, 1,
0.9586824, -1.040322, 3.219525, 1, 0, 0.9529412, 1,
0.9624765, -0.01772027, 1.348347, 1, 0, 0.9490196, 1,
0.9668277, -0.2273187, 2.293462, 1, 0, 0.9411765, 1,
0.9703758, 0.7120992, 2.263196, 1, 0, 0.9372549, 1,
0.9705822, -1.745869, 2.336281, 1, 0, 0.9294118, 1,
0.9772907, -1.000075, 3.065108, 1, 0, 0.9254902, 1,
0.9784509, -1.016714, 2.63544, 1, 0, 0.9176471, 1,
0.9914516, 0.2738855, 0.4973031, 1, 0, 0.9137255, 1,
0.9919673, -0.144557, 0.2816146, 1, 0, 0.9058824, 1,
0.9942095, 0.3092707, 0.4208794, 1, 0, 0.9019608, 1,
0.9974908, -1.1495, 2.557541, 1, 0, 0.8941177, 1,
0.9980363, 0.7097638, -0.5612815, 1, 0, 0.8862745, 1,
0.9982509, 0.614727, 1.045571, 1, 0, 0.8823529, 1,
1.005697, 0.4129971, 2.813823, 1, 0, 0.8745098, 1,
1.012671, -1.245804, 1.768281, 1, 0, 0.8705882, 1,
1.013858, 1.307825, -0.1800669, 1, 0, 0.8627451, 1,
1.017177, 0.9912252, -0.59328, 1, 0, 0.8588235, 1,
1.024401, 1.398125, 1.232148, 1, 0, 0.8509804, 1,
1.024978, -0.05882501, 0.2967797, 1, 0, 0.8470588, 1,
1.033096, -0.699675, 0.6962195, 1, 0, 0.8392157, 1,
1.036319, -0.305033, 1.413864, 1, 0, 0.8352941, 1,
1.040767, -1.335481, 3.252455, 1, 0, 0.827451, 1,
1.060919, 1.162933, 1.26151, 1, 0, 0.8235294, 1,
1.063399, -1.539558, 3.237024, 1, 0, 0.8156863, 1,
1.071352, -1.971467, 3.483031, 1, 0, 0.8117647, 1,
1.085966, 0.2929879, 0.6679842, 1, 0, 0.8039216, 1,
1.088625, 2.054738, -0.08002081, 1, 0, 0.7960784, 1,
1.091546, 0.3753793, 0.4349068, 1, 0, 0.7921569, 1,
1.092021, 0.8749152, 1.794546, 1, 0, 0.7843137, 1,
1.112473, 1.648158, 0.01306741, 1, 0, 0.7803922, 1,
1.118103, 0.2102382, 2.432812, 1, 0, 0.772549, 1,
1.134999, -0.8104793, 1.585856, 1, 0, 0.7686275, 1,
1.135157, -0.8736618, 4.667649, 1, 0, 0.7607843, 1,
1.141773, -0.5286057, 3.170528, 1, 0, 0.7568628, 1,
1.142256, 1.360089, 0.2053786, 1, 0, 0.7490196, 1,
1.144448, 0.3552938, 1.902593, 1, 0, 0.7450981, 1,
1.150715, 0.8600298, 1.964783, 1, 0, 0.7372549, 1,
1.154326, 0.3950118, 0.6870254, 1, 0, 0.7333333, 1,
1.155685, 0.1073853, 2.567787, 1, 0, 0.7254902, 1,
1.156641, -0.4491691, 2.802455, 1, 0, 0.7215686, 1,
1.169706, -0.3292612, 2.903644, 1, 0, 0.7137255, 1,
1.171559, 0.08046587, 1.358454, 1, 0, 0.7098039, 1,
1.176006, -0.590516, 1.31212, 1, 0, 0.7019608, 1,
1.176951, 0.6211712, 0.06678648, 1, 0, 0.6941177, 1,
1.178047, 0.6154894, 2.31304, 1, 0, 0.6901961, 1,
1.178557, 0.5361071, 1.432082, 1, 0, 0.682353, 1,
1.178975, -0.1615642, 2.550739, 1, 0, 0.6784314, 1,
1.185222, -0.5087627, 2.425738, 1, 0, 0.6705883, 1,
1.188339, -0.7208448, 3.763294, 1, 0, 0.6666667, 1,
1.189096, 0.3776601, 1.486244, 1, 0, 0.6588235, 1,
1.199787, -0.1359835, 1.396665, 1, 0, 0.654902, 1,
1.20445, 0.7951616, 3.022922, 1, 0, 0.6470588, 1,
1.20513, 0.8659984, 2.15297, 1, 0, 0.6431373, 1,
1.208885, -0.7662479, 0.8584225, 1, 0, 0.6352941, 1,
1.213466, 0.2107482, 0.4129249, 1, 0, 0.6313726, 1,
1.214797, -0.9868239, 2.871353, 1, 0, 0.6235294, 1,
1.22046, -0.002939844, 3.012506, 1, 0, 0.6196079, 1,
1.22102, 1.947519, -0.006317582, 1, 0, 0.6117647, 1,
1.22291, -0.5687382, 1.377497, 1, 0, 0.6078432, 1,
1.225504, -0.04836241, 1.688371, 1, 0, 0.6, 1,
1.23835, -1.256805, 2.472005, 1, 0, 0.5921569, 1,
1.239729, -0.2151408, 0.2868319, 1, 0, 0.5882353, 1,
1.240677, 1.571009, 1.730498, 1, 0, 0.5803922, 1,
1.242026, 0.1995075, 2.335825, 1, 0, 0.5764706, 1,
1.24403, 0.2877125, 1.025602, 1, 0, 0.5686275, 1,
1.246208, 0.6250003, 0.5051775, 1, 0, 0.5647059, 1,
1.247661, 0.6787923, 1.195473, 1, 0, 0.5568628, 1,
1.250225, -0.9022516, 4.984122, 1, 0, 0.5529412, 1,
1.27143, 1.707624, 0.7371326, 1, 0, 0.5450981, 1,
1.274884, -0.353391, 2.29549, 1, 0, 0.5411765, 1,
1.290183, 0.2199436, 0.2221195, 1, 0, 0.5333334, 1,
1.29826, 0.005523565, 2.277835, 1, 0, 0.5294118, 1,
1.298531, 1.463645, -0.5954823, 1, 0, 0.5215687, 1,
1.310496, -1.305168, 2.660391, 1, 0, 0.5176471, 1,
1.318724, -1.36687, 3.286542, 1, 0, 0.509804, 1,
1.325964, -0.5138408, 1.092511, 1, 0, 0.5058824, 1,
1.336512, 0.4719817, 0.5712576, 1, 0, 0.4980392, 1,
1.35149, -0.1132315, 0.5745842, 1, 0, 0.4901961, 1,
1.361225, 1.892102, -0.4907567, 1, 0, 0.4862745, 1,
1.362575, -0.6945195, 1.786611, 1, 0, 0.4784314, 1,
1.374308, 0.3854827, 1.77238, 1, 0, 0.4745098, 1,
1.378928, 0.9785002, 0.7358083, 1, 0, 0.4666667, 1,
1.381288, 1.321914, -0.9718978, 1, 0, 0.4627451, 1,
1.388727, 0.04213641, 1.449408, 1, 0, 0.454902, 1,
1.404662, -0.3592386, -0.9462088, 1, 0, 0.4509804, 1,
1.405865, 1.87251, -0.3653488, 1, 0, 0.4431373, 1,
1.417079, 0.04832188, 2.376128, 1, 0, 0.4392157, 1,
1.419279, -0.8433843, 1.365309, 1, 0, 0.4313726, 1,
1.428591, -1.491162, 1.16134, 1, 0, 0.427451, 1,
1.430026, 0.02115334, 1.163325, 1, 0, 0.4196078, 1,
1.434418, -0.6181408, 2.866138, 1, 0, 0.4156863, 1,
1.439524, -1.376039, 2.418716, 1, 0, 0.4078431, 1,
1.440623, -0.18656, 3.734171, 1, 0, 0.4039216, 1,
1.451573, 0.3954063, 0.7802461, 1, 0, 0.3960784, 1,
1.458462, -0.2750863, 0.2160684, 1, 0, 0.3882353, 1,
1.458693, 1.89219, 0.7676039, 1, 0, 0.3843137, 1,
1.46789, 0.1293009, 0.8341923, 1, 0, 0.3764706, 1,
1.48568, -0.6489819, 1.928327, 1, 0, 0.372549, 1,
1.494045, 0.7548304, 1.314335, 1, 0, 0.3647059, 1,
1.498946, -0.2139506, 2.061957, 1, 0, 0.3607843, 1,
1.505288, 0.5187134, 1.440184, 1, 0, 0.3529412, 1,
1.511068, 0.4460215, -0.6116199, 1, 0, 0.3490196, 1,
1.520099, 0.7082201, 0.02324747, 1, 0, 0.3411765, 1,
1.52064, -0.06255796, 2.438706, 1, 0, 0.3372549, 1,
1.526289, 0.5378586, 1.454429, 1, 0, 0.3294118, 1,
1.530341, 1.377188, 1.008537, 1, 0, 0.3254902, 1,
1.539678, -0.877771, 1.767836, 1, 0, 0.3176471, 1,
1.545015, -0.02387289, 1.728456, 1, 0, 0.3137255, 1,
1.547066, -1.799566, 3.095833, 1, 0, 0.3058824, 1,
1.560415, -0.1030393, 1.582358, 1, 0, 0.2980392, 1,
1.561731, -0.4419212, 0.5541095, 1, 0, 0.2941177, 1,
1.564311, 0.1381448, 1.236632, 1, 0, 0.2862745, 1,
1.604324, -1.329507, 1.387462, 1, 0, 0.282353, 1,
1.628371, 2.440418, 0.512068, 1, 0, 0.2745098, 1,
1.658967, 0.8699957, 0.5656564, 1, 0, 0.2705882, 1,
1.659579, -0.2745351, 0.4603679, 1, 0, 0.2627451, 1,
1.666579, 1.520408, 1.754641, 1, 0, 0.2588235, 1,
1.67813, 0.6437663, 2.188868, 1, 0, 0.2509804, 1,
1.681565, 1.766547, 1.139742, 1, 0, 0.2470588, 1,
1.681761, -0.776087, -0.1850919, 1, 0, 0.2392157, 1,
1.690681, -0.7213907, 3.699376, 1, 0, 0.2352941, 1,
1.692522, 0.2563012, 0.3955863, 1, 0, 0.227451, 1,
1.692976, 0.4846416, 1.250449, 1, 0, 0.2235294, 1,
1.706265, 1.303446, 0.8602631, 1, 0, 0.2156863, 1,
1.712259, -0.1661493, 2.60599, 1, 0, 0.2117647, 1,
1.71364, -0.3126326, 1.469785, 1, 0, 0.2039216, 1,
1.716622, -0.3746776, 1.381401, 1, 0, 0.1960784, 1,
1.716883, 1.477612, -0.3203656, 1, 0, 0.1921569, 1,
1.728199, -0.3380817, 3.643703, 1, 0, 0.1843137, 1,
1.731009, 0.4694999, 2.430927, 1, 0, 0.1803922, 1,
1.781228, -0.2052265, 1.660658, 1, 0, 0.172549, 1,
1.78282, -1.050346, 3.720166, 1, 0, 0.1686275, 1,
1.789336, -0.3094737, 2.851019, 1, 0, 0.1607843, 1,
1.79542, 0.5938194, 2.298397, 1, 0, 0.1568628, 1,
1.819889, -0.602659, 2.545598, 1, 0, 0.1490196, 1,
1.846384, -0.4639219, 1.656606, 1, 0, 0.145098, 1,
1.850396, -1.615866, 0.2446761, 1, 0, 0.1372549, 1,
1.865411, -0.5659324, 1.188579, 1, 0, 0.1333333, 1,
1.87168, -1.67807, 1.667251, 1, 0, 0.1254902, 1,
1.892297, -0.948727, 3.226403, 1, 0, 0.1215686, 1,
1.909457, -1.134695, 1.687831, 1, 0, 0.1137255, 1,
1.975283, -0.2493783, 2.052254, 1, 0, 0.1098039, 1,
2.004234, 0.06464367, 1.72726, 1, 0, 0.1019608, 1,
2.015852, 0.8135146, 0.3706815, 1, 0, 0.09411765, 1,
2.025195, 1.000309, -0.253798, 1, 0, 0.09019608, 1,
2.123251, 0.4395236, 2.29668, 1, 0, 0.08235294, 1,
2.128693, 1.4836, 0.4488416, 1, 0, 0.07843138, 1,
2.136726, -1.566707, 4.630928, 1, 0, 0.07058824, 1,
2.15361, -0.5426806, 1.266689, 1, 0, 0.06666667, 1,
2.154059, -1.382398, -0.3792413, 1, 0, 0.05882353, 1,
2.199825, -2.096325, 3.136038, 1, 0, 0.05490196, 1,
2.245067, -1.022817, 1.628034, 1, 0, 0.04705882, 1,
2.315311, 1.014221, 1.683424, 1, 0, 0.04313726, 1,
2.41777, 0.2496195, 3.316314, 1, 0, 0.03529412, 1,
2.56199, 1.091877, 1.428397, 1, 0, 0.03137255, 1,
2.716527, -0.4161131, 2.226617, 1, 0, 0.02352941, 1,
2.788149, 1.623299, 0.4439756, 1, 0, 0.01960784, 1,
2.957024, 2.052672, 0.7471565, 1, 0, 0.01176471, 1,
3.079159, -0.1919875, 2.166552, 1, 0, 0.007843138, 1
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
0.001928568, -4.240248, -7.737123, 0, -0.5, 0.5, 0.5,
0.001928568, -4.240248, -7.737123, 1, -0.5, 0.5, 0.5,
0.001928568, -4.240248, -7.737123, 1, 1.5, 0.5, 0.5,
0.001928568, -4.240248, -7.737123, 0, 1.5, 0.5, 0.5
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
-4.118484, -0.04272461, -7.737123, 0, -0.5, 0.5, 0.5,
-4.118484, -0.04272461, -7.737123, 1, -0.5, 0.5, 0.5,
-4.118484, -0.04272461, -7.737123, 1, 1.5, 0.5, 0.5,
-4.118484, -0.04272461, -7.737123, 0, 1.5, 0.5, 0.5
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
-4.118484, -4.240248, -0.2486935, 0, -0.5, 0.5, 0.5,
-4.118484, -4.240248, -0.2486935, 1, -0.5, 0.5, 0.5,
-4.118484, -4.240248, -0.2486935, 1, 1.5, 0.5, 0.5,
-4.118484, -4.240248, -0.2486935, 0, 1.5, 0.5, 0.5
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
-3, -3.271589, -6.009024,
3, -3.271589, -6.009024,
-3, -3.271589, -6.009024,
-3, -3.433032, -6.297041,
-2, -3.271589, -6.009024,
-2, -3.433032, -6.297041,
-1, -3.271589, -6.009024,
-1, -3.433032, -6.297041,
0, -3.271589, -6.009024,
0, -3.433032, -6.297041,
1, -3.271589, -6.009024,
1, -3.433032, -6.297041,
2, -3.271589, -6.009024,
2, -3.433032, -6.297041,
3, -3.271589, -6.009024,
3, -3.433032, -6.297041
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
-3, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
-3, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
-3, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
-3, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5,
-2, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
-2, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
-2, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
-2, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5,
-1, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
-1, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
-1, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
-1, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5,
0, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
0, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
0, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
0, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5,
1, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
1, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
1, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
1, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5,
2, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
2, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
2, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
2, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5,
3, -3.755918, -6.873074, 0, -0.5, 0.5, 0.5,
3, -3.755918, -6.873074, 1, -0.5, 0.5, 0.5,
3, -3.755918, -6.873074, 1, 1.5, 0.5, 0.5,
3, -3.755918, -6.873074, 0, 1.5, 0.5, 0.5
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
-3.167619, -3, -6.009024,
-3.167619, 3, -6.009024,
-3.167619, -3, -6.009024,
-3.326097, -3, -6.297041,
-3.167619, -2, -6.009024,
-3.326097, -2, -6.297041,
-3.167619, -1, -6.009024,
-3.326097, -1, -6.297041,
-3.167619, 0, -6.009024,
-3.326097, 0, -6.297041,
-3.167619, 1, -6.009024,
-3.326097, 1, -6.297041,
-3.167619, 2, -6.009024,
-3.326097, 2, -6.297041,
-3.167619, 3, -6.009024,
-3.326097, 3, -6.297041
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
-3.643051, -3, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, -3, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, -3, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, -3, -6.873074, 0, 1.5, 0.5, 0.5,
-3.643051, -2, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, -2, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, -2, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, -2, -6.873074, 0, 1.5, 0.5, 0.5,
-3.643051, -1, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, -1, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, -1, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, -1, -6.873074, 0, 1.5, 0.5, 0.5,
-3.643051, 0, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, 0, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, 0, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, 0, -6.873074, 0, 1.5, 0.5, 0.5,
-3.643051, 1, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, 1, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, 1, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, 1, -6.873074, 0, 1.5, 0.5, 0.5,
-3.643051, 2, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, 2, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, 2, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, 2, -6.873074, 0, 1.5, 0.5, 0.5,
-3.643051, 3, -6.873074, 0, -0.5, 0.5, 0.5,
-3.643051, 3, -6.873074, 1, -0.5, 0.5, 0.5,
-3.643051, 3, -6.873074, 1, 1.5, 0.5, 0.5,
-3.643051, 3, -6.873074, 0, 1.5, 0.5, 0.5
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
-3.167619, -3.271589, -4,
-3.167619, -3.271589, 4,
-3.167619, -3.271589, -4,
-3.326097, -3.433032, -4,
-3.167619, -3.271589, -2,
-3.326097, -3.433032, -2,
-3.167619, -3.271589, 0,
-3.326097, -3.433032, 0,
-3.167619, -3.271589, 2,
-3.326097, -3.433032, 2,
-3.167619, -3.271589, 4,
-3.326097, -3.433032, 4
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
-3.643051, -3.755918, -4, 0, -0.5, 0.5, 0.5,
-3.643051, -3.755918, -4, 1, -0.5, 0.5, 0.5,
-3.643051, -3.755918, -4, 1, 1.5, 0.5, 0.5,
-3.643051, -3.755918, -4, 0, 1.5, 0.5, 0.5,
-3.643051, -3.755918, -2, 0, -0.5, 0.5, 0.5,
-3.643051, -3.755918, -2, 1, -0.5, 0.5, 0.5,
-3.643051, -3.755918, -2, 1, 1.5, 0.5, 0.5,
-3.643051, -3.755918, -2, 0, 1.5, 0.5, 0.5,
-3.643051, -3.755918, 0, 0, -0.5, 0.5, 0.5,
-3.643051, -3.755918, 0, 1, -0.5, 0.5, 0.5,
-3.643051, -3.755918, 0, 1, 1.5, 0.5, 0.5,
-3.643051, -3.755918, 0, 0, 1.5, 0.5, 0.5,
-3.643051, -3.755918, 2, 0, -0.5, 0.5, 0.5,
-3.643051, -3.755918, 2, 1, -0.5, 0.5, 0.5,
-3.643051, -3.755918, 2, 1, 1.5, 0.5, 0.5,
-3.643051, -3.755918, 2, 0, 1.5, 0.5, 0.5,
-3.643051, -3.755918, 4, 0, -0.5, 0.5, 0.5,
-3.643051, -3.755918, 4, 1, -0.5, 0.5, 0.5,
-3.643051, -3.755918, 4, 1, 1.5, 0.5, 0.5,
-3.643051, -3.755918, 4, 0, 1.5, 0.5, 0.5
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
-3.167619, -3.271589, -6.009024,
-3.167619, 3.186139, -6.009024,
-3.167619, -3.271589, 5.511637,
-3.167619, 3.186139, 5.511637,
-3.167619, -3.271589, -6.009024,
-3.167619, -3.271589, 5.511637,
-3.167619, 3.186139, -6.009024,
-3.167619, 3.186139, 5.511637,
-3.167619, -3.271589, -6.009024,
3.171476, -3.271589, -6.009024,
-3.167619, -3.271589, 5.511637,
3.171476, -3.271589, 5.511637,
-3.167619, 3.186139, -6.009024,
3.171476, 3.186139, -6.009024,
-3.167619, 3.186139, 5.511637,
3.171476, 3.186139, 5.511637,
3.171476, -3.271589, -6.009024,
3.171476, 3.186139, -6.009024,
3.171476, -3.271589, 5.511637,
3.171476, 3.186139, 5.511637,
3.171476, -3.271589, -6.009024,
3.171476, -3.271589, 5.511637,
3.171476, 3.186139, -6.009024,
3.171476, 3.186139, 5.511637
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
var radius = 7.822624;
var distance = 34.80374;
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
mvMatrix.translate( -0.001928568, 0.04272461, 0.2486935 );
mvMatrix.scale( 1.334256, 1.309745, 0.734157 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80374);
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
isoxaben<-read.table("isoxaben.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoxaben$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoxaben' not found
```

```r
y<-isoxaben$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoxaben' not found
```

```r
z<-isoxaben$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoxaben' not found
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
-3.075302, -0.2432406, -1.011971, 0, 0, 1, 1, 1,
-2.954458, -0.6104035, -1.96466, 1, 0, 0, 1, 1,
-2.60053, -1.509391, -1.922945, 1, 0, 0, 1, 1,
-2.532199, -0.5634016, -1.115568, 1, 0, 0, 1, 1,
-2.306872, 1.30537, -0.06511665, 1, 0, 0, 1, 1,
-2.24775, 0.4876422, -2.516789, 1, 0, 0, 1, 1,
-2.245891, -1.543501, -1.509094, 0, 0, 0, 1, 1,
-2.193038, -0.1563038, -1.582507, 0, 0, 0, 1, 1,
-2.144726, 0.9075177, -1.204221, 0, 0, 0, 1, 1,
-2.126905, -1.035273, -0.5791106, 0, 0, 0, 1, 1,
-2.125992, -0.3647261, -1.624279, 0, 0, 0, 1, 1,
-2.073019, 1.5894, -0.4986849, 0, 0, 0, 1, 1,
-2.058011, -0.607352, -0.138419, 0, 0, 0, 1, 1,
-2.046494, -0.2577873, -0.9467367, 1, 1, 1, 1, 1,
-2.040608, -1.17474, -1.716624, 1, 1, 1, 1, 1,
-2.025299, -0.6087624, -2.074176, 1, 1, 1, 1, 1,
-2.025047, 1.036263, -1.64124, 1, 1, 1, 1, 1,
-1.933167, -0.8178843, -2.186757, 1, 1, 1, 1, 1,
-1.932333, -0.1471338, -1.546414, 1, 1, 1, 1, 1,
-1.908311, 2.246444, -0.8633612, 1, 1, 1, 1, 1,
-1.877066, 0.3513736, 0.194897, 1, 1, 1, 1, 1,
-1.837248, 0.8017887, -0.2637161, 1, 1, 1, 1, 1,
-1.813743, -0.3732941, -0.7860542, 1, 1, 1, 1, 1,
-1.80961, 2.024428, -0.7859627, 1, 1, 1, 1, 1,
-1.809366, 0.3465327, -2.194262, 1, 1, 1, 1, 1,
-1.795316, -1.295788, -2.841967, 1, 1, 1, 1, 1,
-1.789728, 0.2139338, -1.963158, 1, 1, 1, 1, 1,
-1.767562, 0.2379159, -0.6376927, 1, 1, 1, 1, 1,
-1.740398, -0.3763633, -3.976106, 0, 0, 1, 1, 1,
-1.717499, -0.764268, -1.424295, 1, 0, 0, 1, 1,
-1.716083, -1.404864, 0.1848452, 1, 0, 0, 1, 1,
-1.712306, 0.3629514, -0.7857988, 1, 0, 0, 1, 1,
-1.709596, 0.655394, -2.280628, 1, 0, 0, 1, 1,
-1.679389, 2.539434, 0.7204557, 1, 0, 0, 1, 1,
-1.664114, 1.295173, -1.82819, 0, 0, 0, 1, 1,
-1.655746, -0.9895936, -2.596367, 0, 0, 0, 1, 1,
-1.653522, 0.2914711, -4.282462, 0, 0, 0, 1, 1,
-1.647377, 0.6100627, -1.399922, 0, 0, 0, 1, 1,
-1.646051, 0.707583, -2.255346, 0, 0, 0, 1, 1,
-1.641028, 0.9134061, -1.457664, 0, 0, 0, 1, 1,
-1.616124, 0.5924319, 0.4361286, 0, 0, 0, 1, 1,
-1.603893, 0.4753202, -2.217123, 1, 1, 1, 1, 1,
-1.59941, -0.88231, -1.911474, 1, 1, 1, 1, 1,
-1.590883, 1.263906, -1.578878, 1, 1, 1, 1, 1,
-1.588544, -0.07557082, -1.8505, 1, 1, 1, 1, 1,
-1.584593, 0.702758, -2.083283, 1, 1, 1, 1, 1,
-1.577544, -0.5520357, -2.07789, 1, 1, 1, 1, 1,
-1.577134, 0.6788941, -0.733655, 1, 1, 1, 1, 1,
-1.562114, -0.7443241, 0.05019601, 1, 1, 1, 1, 1,
-1.555415, -0.755933, -2.003366, 1, 1, 1, 1, 1,
-1.550201, 0.366219, -0.8998516, 1, 1, 1, 1, 1,
-1.548598, 1.573017, -1.0026, 1, 1, 1, 1, 1,
-1.49542, 1.407037, -1.209272, 1, 1, 1, 1, 1,
-1.455497, -0.4672036, 0.3905009, 1, 1, 1, 1, 1,
-1.449701, -0.25604, -1.58683, 1, 1, 1, 1, 1,
-1.440175, 0.02016744, -3.742064, 1, 1, 1, 1, 1,
-1.43479, -0.1121986, -0.9209432, 0, 0, 1, 1, 1,
-1.431148, 1.881548, -2.317717, 1, 0, 0, 1, 1,
-1.409769, -0.3216156, -2.442604, 1, 0, 0, 1, 1,
-1.406775, -0.5629193, -2.304056, 1, 0, 0, 1, 1,
-1.400666, -0.4517551, -2.655965, 1, 0, 0, 1, 1,
-1.400282, 0.5924135, -1.350285, 1, 0, 0, 1, 1,
-1.395342, 0.6941542, -2.874582, 0, 0, 0, 1, 1,
-1.39451, -0.5397562, -2.716839, 0, 0, 0, 1, 1,
-1.390494, -0.5354393, -1.30129, 0, 0, 0, 1, 1,
-1.387344, -0.1496313, -1.180104, 0, 0, 0, 1, 1,
-1.381689, 0.2380974, -1.930126, 0, 0, 0, 1, 1,
-1.380077, -1.077956, -1.86057, 0, 0, 0, 1, 1,
-1.376761, -1.537968, -3.13445, 0, 0, 0, 1, 1,
-1.338288, 0.4103046, -3.250579, 1, 1, 1, 1, 1,
-1.338062, -0.4977284, -0.4250972, 1, 1, 1, 1, 1,
-1.335049, -1.014761, -1.464994, 1, 1, 1, 1, 1,
-1.307874, 0.5761597, -0.112931, 1, 1, 1, 1, 1,
-1.300747, 0.307169, -1.174417, 1, 1, 1, 1, 1,
-1.290279, 1.034848, -1.130381, 1, 1, 1, 1, 1,
-1.288717, -0.4284201, -2.175704, 1, 1, 1, 1, 1,
-1.269586, 0.05551947, -1.877455, 1, 1, 1, 1, 1,
-1.268862, -1.393204, -2.113673, 1, 1, 1, 1, 1,
-1.267559, 0.8953413, -0.862502, 1, 1, 1, 1, 1,
-1.264658, 1.085022, -2.054718, 1, 1, 1, 1, 1,
-1.260902, -0.4823672, -1.035226, 1, 1, 1, 1, 1,
-1.25697, 1.022165, -0.5722609, 1, 1, 1, 1, 1,
-1.25667, -0.1701277, -2.784026, 1, 1, 1, 1, 1,
-1.251796, -0.1741302, -1.445101, 1, 1, 1, 1, 1,
-1.24888, -0.02598117, -0.727699, 0, 0, 1, 1, 1,
-1.241502, 0.8486023, -1.786397, 1, 0, 0, 1, 1,
-1.241338, -0.1528483, -1.99982, 1, 0, 0, 1, 1,
-1.230617, -0.5626616, -1.574604, 1, 0, 0, 1, 1,
-1.221734, 0.07368547, -3.398815, 1, 0, 0, 1, 1,
-1.220101, -0.1259075, -2.058011, 1, 0, 0, 1, 1,
-1.20219, 1.857146, -0.1946847, 0, 0, 0, 1, 1,
-1.196067, 0.4778206, -2.121803, 0, 0, 0, 1, 1,
-1.195677, -0.08449528, -0.6747222, 0, 0, 0, 1, 1,
-1.195468, 0.2318036, -2.288954, 0, 0, 0, 1, 1,
-1.183019, 0.7846814, -1.367427, 0, 0, 0, 1, 1,
-1.182001, 3.092095, -1.048347, 0, 0, 0, 1, 1,
-1.179651, 0.7285212, -1.891506, 0, 0, 0, 1, 1,
-1.174062, -0.3709186, -1.646067, 1, 1, 1, 1, 1,
-1.16997, -1.995102, -4.547977, 1, 1, 1, 1, 1,
-1.165382, 0.1060596, -2.001242, 1, 1, 1, 1, 1,
-1.1645, 0.444694, -1.051321, 1, 1, 1, 1, 1,
-1.164114, -0.8779973, -0.7654613, 1, 1, 1, 1, 1,
-1.156792, -0.8162391, -2.172385, 1, 1, 1, 1, 1,
-1.152402, -1.753838, -1.466999, 1, 1, 1, 1, 1,
-1.14679, -1.29842, -4.047984, 1, 1, 1, 1, 1,
-1.141977, 0.2592276, -2.234574, 1, 1, 1, 1, 1,
-1.139483, 1.398174, -1.187707, 1, 1, 1, 1, 1,
-1.134486, 0.3802861, -0.9397795, 1, 1, 1, 1, 1,
-1.130569, 1.005918, -1.153175, 1, 1, 1, 1, 1,
-1.122501, 0.7370909, 0.9028493, 1, 1, 1, 1, 1,
-1.116126, -0.2781668, -1.327321, 1, 1, 1, 1, 1,
-1.100508, 0.6815857, -2.138775, 1, 1, 1, 1, 1,
-1.094382, 1.155683, -1.251222, 0, 0, 1, 1, 1,
-1.093612, 0.9691162, -0.3677012, 1, 0, 0, 1, 1,
-1.091676, 0.5436271, -2.240577, 1, 0, 0, 1, 1,
-1.079346, 1.096074, 0.2538909, 1, 0, 0, 1, 1,
-1.078742, -0.9697095, -2.448015, 1, 0, 0, 1, 1,
-1.077198, -0.9147099, -0.9527821, 1, 0, 0, 1, 1,
-1.07363, -0.9127686, -3.104831, 0, 0, 0, 1, 1,
-1.067036, -1.221813, -1.374345, 0, 0, 0, 1, 1,
-1.065921, -0.8175501, -2.961195, 0, 0, 0, 1, 1,
-1.062657, -0.07137898, -0.3800723, 0, 0, 0, 1, 1,
-1.061606, -0.6809464, -1.755221, 0, 0, 0, 1, 1,
-1.060535, -1.443857, -4.179878, 0, 0, 0, 1, 1,
-1.059557, -0.1334758, -2.181221, 0, 0, 0, 1, 1,
-1.058668, 2.018933, -1.408294, 1, 1, 1, 1, 1,
-1.056542, 0.06188167, -1.272753, 1, 1, 1, 1, 1,
-1.049743, 0.1291982, -1.483541, 1, 1, 1, 1, 1,
-1.043782, 0.5766803, 0.02024151, 1, 1, 1, 1, 1,
-1.041624, -0.8932666, -2.870616, 1, 1, 1, 1, 1,
-1.040205, 0.2156876, -1.914563, 1, 1, 1, 1, 1,
-1.039558, 0.358577, -2.435203, 1, 1, 1, 1, 1,
-1.039342, 1.442408, -1.06992, 1, 1, 1, 1, 1,
-1.035268, -0.5099436, -4.454222, 1, 1, 1, 1, 1,
-1.030218, -1.175799, -1.592648, 1, 1, 1, 1, 1,
-1.028013, 0.1083468, -1.725732, 1, 1, 1, 1, 1,
-1.019909, 0.02561642, -0.9432853, 1, 1, 1, 1, 1,
-1.014716, -1.13535, -1.136201, 1, 1, 1, 1, 1,
-1.014227, 0.4103529, -1.244235, 1, 1, 1, 1, 1,
-1.009038, 0.3007746, -1.383093, 1, 1, 1, 1, 1,
-1.005564, -0.2086475, -0.9461308, 0, 0, 1, 1, 1,
-0.9966644, -0.5897297, -2.718217, 1, 0, 0, 1, 1,
-0.9939227, -0.2905145, -1.743792, 1, 0, 0, 1, 1,
-0.9901373, -0.567449, -2.511008, 1, 0, 0, 1, 1,
-0.9897771, -0.2445729, -2.67114, 1, 0, 0, 1, 1,
-0.9869535, -1.351316, -3.549565, 1, 0, 0, 1, 1,
-0.9833896, 0.5240443, -1.173299, 0, 0, 0, 1, 1,
-0.9779978, 0.3152542, -0.3456066, 0, 0, 0, 1, 1,
-0.9756055, -1.410978, -2.373782, 0, 0, 0, 1, 1,
-0.9700696, -0.9543122, -3.396233, 0, 0, 0, 1, 1,
-0.9684295, 0.3981186, -2.464879, 0, 0, 0, 1, 1,
-0.9672698, 0.3147047, -0.5375026, 0, 0, 0, 1, 1,
-0.962194, -0.04212813, -3.405493, 0, 0, 0, 1, 1,
-0.9586846, 2.211993, -2.018175, 1, 1, 1, 1, 1,
-0.9568167, -0.2425625, -1.146919, 1, 1, 1, 1, 1,
-0.9547083, 0.5808442, -1.715277, 1, 1, 1, 1, 1,
-0.9502133, -1.564073, -3.244457, 1, 1, 1, 1, 1,
-0.9434484, -0.265316, -1.63917, 1, 1, 1, 1, 1,
-0.9405611, 0.2000222, -3.340683, 1, 1, 1, 1, 1,
-0.940428, -0.7351962, -1.789944, 1, 1, 1, 1, 1,
-0.9326817, -0.9936942, -4.463751, 1, 1, 1, 1, 1,
-0.9309092, 0.485538, -2.337617, 1, 1, 1, 1, 1,
-0.9274528, -0.9046299, -3.543644, 1, 1, 1, 1, 1,
-0.9132416, -0.7927144, -1.705587, 1, 1, 1, 1, 1,
-0.9092854, 0.1704558, 0.6412042, 1, 1, 1, 1, 1,
-0.9092806, -0.7785938, -2.623091, 1, 1, 1, 1, 1,
-0.9079925, 0.9135218, -0.01372966, 1, 1, 1, 1, 1,
-0.9074734, 0.05440971, -1.564583, 1, 1, 1, 1, 1,
-0.8951067, -0.4715053, -3.199596, 0, 0, 1, 1, 1,
-0.8939866, -1.278962, -2.726372, 1, 0, 0, 1, 1,
-0.8874364, -1.112211, -4.062214, 1, 0, 0, 1, 1,
-0.886877, 2.543055, 0.2856191, 1, 0, 0, 1, 1,
-0.8855266, -0.3455901, -2.181966, 1, 0, 0, 1, 1,
-0.8812525, 0.8535625, -0.1033311, 1, 0, 0, 1, 1,
-0.878874, 0.5329857, -1.633336, 0, 0, 0, 1, 1,
-0.8779813, -1.432608, -2.140732, 0, 0, 0, 1, 1,
-0.8760369, -0.6173534, -0.2903008, 0, 0, 0, 1, 1,
-0.8759997, -0.1498392, -3.139913, 0, 0, 0, 1, 1,
-0.8712642, -3.177544, -3.974451, 0, 0, 0, 1, 1,
-0.8670347, 1.878872, -2.087626, 0, 0, 0, 1, 1,
-0.8662566, 0.5170953, -0.5090312, 0, 0, 0, 1, 1,
-0.8625956, -0.7602978, -1.688408, 1, 1, 1, 1, 1,
-0.8621709, 0.3274202, -1.232703, 1, 1, 1, 1, 1,
-0.854504, 0.1355651, -1.62347, 1, 1, 1, 1, 1,
-0.8543831, -0.06436808, 0.6329358, 1, 1, 1, 1, 1,
-0.8503464, -0.7334872, -0.3830222, 1, 1, 1, 1, 1,
-0.8486698, 0.9140918, 0.4465991, 1, 1, 1, 1, 1,
-0.8486342, -0.2145236, -1.283036, 1, 1, 1, 1, 1,
-0.8477973, 0.35692, -2.390144, 1, 1, 1, 1, 1,
-0.8460979, -1.244414, -1.772052, 1, 1, 1, 1, 1,
-0.8426617, -0.1379149, -1.311632, 1, 1, 1, 1, 1,
-0.841665, 0.6797237, -1.758906, 1, 1, 1, 1, 1,
-0.8401046, 0.9434906, -1.491638, 1, 1, 1, 1, 1,
-0.8399049, 1.097003, -2.175841, 1, 1, 1, 1, 1,
-0.8294205, -0.7837497, -2.946088, 1, 1, 1, 1, 1,
-0.8242848, 0.5697103, -0.5670424, 1, 1, 1, 1, 1,
-0.8231008, 0.04771648, -0.4800634, 0, 0, 1, 1, 1,
-0.8223115, 1.843702, -0.5918127, 1, 0, 0, 1, 1,
-0.8176941, -0.32638, -0.673879, 1, 0, 0, 1, 1,
-0.8166678, -0.5590017, -2.534508, 1, 0, 0, 1, 1,
-0.8134506, 0.6926844, 1.162797, 1, 0, 0, 1, 1,
-0.8112196, 2.334305, -0.2194707, 1, 0, 0, 1, 1,
-0.8109584, -0.8178349, -2.526125, 0, 0, 0, 1, 1,
-0.8044061, -1.246899, -3.006296, 0, 0, 0, 1, 1,
-0.804304, -1.121108, -2.719697, 0, 0, 0, 1, 1,
-0.8001618, 0.4958839, 0.5409124, 0, 0, 0, 1, 1,
-0.7994983, -0.7201446, -2.871681, 0, 0, 0, 1, 1,
-0.794178, -0.9791373, -1.438522, 0, 0, 0, 1, 1,
-0.7910127, -1.25929, -3.094335, 0, 0, 0, 1, 1,
-0.7804088, 0.1701046, -1.440078, 1, 1, 1, 1, 1,
-0.7801335, -0.245196, -3.749962, 1, 1, 1, 1, 1,
-0.7771336, -1.654932, -3.908358, 1, 1, 1, 1, 1,
-0.7689017, -0.8261458, -2.741775, 1, 1, 1, 1, 1,
-0.763513, 0.4460912, -0.8424506, 1, 1, 1, 1, 1,
-0.7624934, 0.8607447, -2.178967, 1, 1, 1, 1, 1,
-0.76195, -0.873793, -2.685632, 1, 1, 1, 1, 1,
-0.7586018, -2.593381, -4.556756, 1, 1, 1, 1, 1,
-0.7550629, 0.461292, -2.489008, 1, 1, 1, 1, 1,
-0.7548581, 1.2582, -1.271612, 1, 1, 1, 1, 1,
-0.7545798, 0.4658583, 0.3438324, 1, 1, 1, 1, 1,
-0.7523581, 0.1738976, -0.5659434, 1, 1, 1, 1, 1,
-0.748085, 0.2888314, -2.076657, 1, 1, 1, 1, 1,
-0.7465169, -2.196806, -3.326982, 1, 1, 1, 1, 1,
-0.734354, 0.1441767, 0.7521025, 1, 1, 1, 1, 1,
-0.7342319, 0.2894239, -1.911829, 0, 0, 1, 1, 1,
-0.7341937, -1.460431, -2.238927, 1, 0, 0, 1, 1,
-0.7288069, -0.1346257, -0.7450177, 1, 0, 0, 1, 1,
-0.7271576, 0.8078561, -0.2507591, 1, 0, 0, 1, 1,
-0.7240483, 2.427312, 0.9889892, 1, 0, 0, 1, 1,
-0.7205232, -0.4693954, -1.863855, 1, 0, 0, 1, 1,
-0.7179617, -1.237382, -3.907264, 0, 0, 0, 1, 1,
-0.7174924, 0.47144, -2.130888, 0, 0, 0, 1, 1,
-0.7157181, -1.648654, -2.635361, 0, 0, 0, 1, 1,
-0.7085121, 0.5139226, -1.374831, 0, 0, 0, 1, 1,
-0.7048315, -0.1895366, -2.880038, 0, 0, 0, 1, 1,
-0.7034565, 0.5312685, 0.1997117, 0, 0, 0, 1, 1,
-0.7027555, -0.4767449, -1.134652, 0, 0, 0, 1, 1,
-0.6888943, 0.4091218, -0.01510774, 1, 1, 1, 1, 1,
-0.6879122, 0.1983995, -1.905353, 1, 1, 1, 1, 1,
-0.6871062, -1.686083, -1.885388, 1, 1, 1, 1, 1,
-0.6870696, -0.4965922, -2.438492, 1, 1, 1, 1, 1,
-0.6867716, 0.1831474, -1.275517, 1, 1, 1, 1, 1,
-0.6855574, -1.28512, -2.428922, 1, 1, 1, 1, 1,
-0.6826757, 0.1089485, -3.14004, 1, 1, 1, 1, 1,
-0.6794844, -1.723829, -2.737085, 1, 1, 1, 1, 1,
-0.6720999, 0.4992084, 0.1428179, 1, 1, 1, 1, 1,
-0.6716001, -0.7356879, -2.000511, 1, 1, 1, 1, 1,
-0.6691243, -0.6682079, -1.934905, 1, 1, 1, 1, 1,
-0.6668932, 1.139008, -0.8235284, 1, 1, 1, 1, 1,
-0.6664051, -0.2614312, -0.2998278, 1, 1, 1, 1, 1,
-0.6621454, -0.7160724, -3.782324, 1, 1, 1, 1, 1,
-0.6609279, 0.7535198, -0.7717825, 1, 1, 1, 1, 1,
-0.6588538, -1.159302, -2.820037, 0, 0, 1, 1, 1,
-0.6568501, 1.26252, -0.3128443, 1, 0, 0, 1, 1,
-0.6551526, -0.7583126, -1.360091, 1, 0, 0, 1, 1,
-0.6533352, -0.510748, -0.0835118, 1, 0, 0, 1, 1,
-0.6461186, 0.6551358, 1.598018, 1, 0, 0, 1, 1,
-0.643002, -0.3526022, -1.126108, 1, 0, 0, 1, 1,
-0.6381944, -0.003965225, -1.434654, 0, 0, 0, 1, 1,
-0.6346245, 0.5884389, -2.871394, 0, 0, 0, 1, 1,
-0.6262258, -0.4439809, -0.75965, 0, 0, 0, 1, 1,
-0.6251011, 0.2833793, -0.794302, 0, 0, 0, 1, 1,
-0.6245885, 0.1232903, -2.953966, 0, 0, 0, 1, 1,
-0.6155277, 2.145294, 0.5505391, 0, 0, 0, 1, 1,
-0.6154169, 0.08394947, -1.524662, 0, 0, 0, 1, 1,
-0.6144046, -0.2527021, -0.9855266, 1, 1, 1, 1, 1,
-0.6137568, 1.235942, -1.586881, 1, 1, 1, 1, 1,
-0.6135866, -0.3048171, -2.123284, 1, 1, 1, 1, 1,
-0.6129269, -2.296451, -2.738408, 1, 1, 1, 1, 1,
-0.6120135, 1.832732, -1.689275, 1, 1, 1, 1, 1,
-0.6080806, -0.5353464, -2.916919, 1, 1, 1, 1, 1,
-0.6004546, -0.5436848, -3.305749, 1, 1, 1, 1, 1,
-0.5992785, -0.1075364, -1.419432, 1, 1, 1, 1, 1,
-0.5959105, 0.2672593, -1.477655, 1, 1, 1, 1, 1,
-0.5942959, -0.4281759, -1.668682, 1, 1, 1, 1, 1,
-0.5927046, 0.5412245, -1.807827, 1, 1, 1, 1, 1,
-0.5908401, -1.365115, -3.910511, 1, 1, 1, 1, 1,
-0.5884899, 1.059016, -0.9474227, 1, 1, 1, 1, 1,
-0.5867116, -1.552878, -4.625832, 1, 1, 1, 1, 1,
-0.582628, -0.4583095, -3.439773, 1, 1, 1, 1, 1,
-0.582253, -2.250206, -2.292702, 0, 0, 1, 1, 1,
-0.5744077, 1.730307, -0.5222356, 1, 0, 0, 1, 1,
-0.5629679, -0.9922155, -2.401717, 1, 0, 0, 1, 1,
-0.5598177, 0.3491056, -0.8390124, 1, 0, 0, 1, 1,
-0.5591137, -1.062069, -3.03243, 1, 0, 0, 1, 1,
-0.5582302, -0.6372507, -1.347946, 1, 0, 0, 1, 1,
-0.5578495, -0.5237164, -1.252657, 0, 0, 0, 1, 1,
-0.5545068, -0.1429387, -2.695517, 0, 0, 0, 1, 1,
-0.5537173, -0.5045656, -0.6216904, 0, 0, 0, 1, 1,
-0.5527463, -1.702382, -3.459224, 0, 0, 0, 1, 1,
-0.5517482, -0.0761728, -2.602444, 0, 0, 0, 1, 1,
-0.5393115, -1.199619, -3.51734, 0, 0, 0, 1, 1,
-0.5380132, 0.7041609, 0.1741921, 0, 0, 0, 1, 1,
-0.5361777, 0.5638085, -0.3847091, 1, 1, 1, 1, 1,
-0.5361742, 0.2156674, -0.6715708, 1, 1, 1, 1, 1,
-0.5335843, -0.6932001, -0.9822232, 1, 1, 1, 1, 1,
-0.53297, 0.9300682, 1.151705, 1, 1, 1, 1, 1,
-0.5263219, 0.01134993, -0.05809636, 1, 1, 1, 1, 1,
-0.5252921, 0.1470745, 0.0577388, 1, 1, 1, 1, 1,
-0.5252492, -1.011632, -2.951955, 1, 1, 1, 1, 1,
-0.5051343, 1.111927, -1.938616, 1, 1, 1, 1, 1,
-0.5045211, -0.5414736, -2.751999, 1, 1, 1, 1, 1,
-0.5037361, -0.6940167, -2.095759, 1, 1, 1, 1, 1,
-0.5033469, -0.7344427, -4.239955, 1, 1, 1, 1, 1,
-0.5021439, 1.319808, 0.09350897, 1, 1, 1, 1, 1,
-0.4905916, -0.5452384, -2.192362, 1, 1, 1, 1, 1,
-0.4898782, -0.627349, -0.7565572, 1, 1, 1, 1, 1,
-0.4777107, 0.8031739, 0.7328346, 1, 1, 1, 1, 1,
-0.4753461, 2.235416, 0.6852793, 0, 0, 1, 1, 1,
-0.4738199, 1.717666, -0.2038222, 1, 0, 0, 1, 1,
-0.4728998, 0.7941319, 1.351072, 1, 0, 0, 1, 1,
-0.4722348, 0.9099885, -0.8761237, 1, 0, 0, 1, 1,
-0.4718084, 1.583122, -0.7995568, 1, 0, 0, 1, 1,
-0.4713998, -1.000001, -3.404945, 1, 0, 0, 1, 1,
-0.4700733, 1.205053, -1.880059, 0, 0, 0, 1, 1,
-0.4697309, -1.553734, -3.358292, 0, 0, 0, 1, 1,
-0.4687098, 0.8397156, -2.407026, 0, 0, 0, 1, 1,
-0.4661356, 1.547545, -0.1484342, 0, 0, 0, 1, 1,
-0.4639323, -0.166537, -0.6126181, 0, 0, 0, 1, 1,
-0.4632998, -1.805736, -1.357255, 0, 0, 0, 1, 1,
-0.4629808, 0.1882725, 0.06166558, 0, 0, 0, 1, 1,
-0.4605461, -1.184261, -2.794266, 1, 1, 1, 1, 1,
-0.4580239, 1.072472, -0.3539344, 1, 1, 1, 1, 1,
-0.4567733, -0.6797932, -1.887142, 1, 1, 1, 1, 1,
-0.4559067, 0.8272384, -1.005056, 1, 1, 1, 1, 1,
-0.4552296, 0.739481, -0.321448, 1, 1, 1, 1, 1,
-0.448789, 0.8560245, -1.139358, 1, 1, 1, 1, 1,
-0.4487387, 1.237176, -0.244813, 1, 1, 1, 1, 1,
-0.4478018, 0.4317852, -0.8607947, 1, 1, 1, 1, 1,
-0.4466167, 1.719685, 0.9822723, 1, 1, 1, 1, 1,
-0.4452045, 0.3281029, -0.3742476, 1, 1, 1, 1, 1,
-0.4420356, -0.7410281, -2.852951, 1, 1, 1, 1, 1,
-0.4412557, 1.407694, 1.654268, 1, 1, 1, 1, 1,
-0.440047, -0.7673365, -1.862843, 1, 1, 1, 1, 1,
-0.4393969, -2.25638, -3.786035, 1, 1, 1, 1, 1,
-0.4371456, -0.2988625, -3.933085, 1, 1, 1, 1, 1,
-0.4348681, 0.557511, -0.8205265, 0, 0, 1, 1, 1,
-0.4288796, -1.508189, -3.150341, 1, 0, 0, 1, 1,
-0.4286902, -0.4709472, -2.653403, 1, 0, 0, 1, 1,
-0.4281094, 1.203889, -0.5321224, 1, 0, 0, 1, 1,
-0.4265761, -0.6249858, -0.02935674, 1, 0, 0, 1, 1,
-0.4256011, 0.5636782, -0.3993549, 1, 0, 0, 1, 1,
-0.4243653, -0.3610156, -4.220312, 0, 0, 0, 1, 1,
-0.4238172, -0.3988071, -2.116642, 0, 0, 0, 1, 1,
-0.4220959, -1.440516, -1.312362, 0, 0, 0, 1, 1,
-0.4181902, -1.065927, -1.13411, 0, 0, 0, 1, 1,
-0.4145984, 0.8344147, -0.09922809, 0, 0, 0, 1, 1,
-0.413376, -0.6704593, -2.335759, 0, 0, 0, 1, 1,
-0.4127586, -0.5252066, -1.727498, 0, 0, 0, 1, 1,
-0.412577, -0.1104327, 0.330114, 1, 1, 1, 1, 1,
-0.4074846, 1.273248, -0.1346689, 1, 1, 1, 1, 1,
-0.407449, -1.680902, -2.890341, 1, 1, 1, 1, 1,
-0.4070592, -1.220697, -1.628558, 1, 1, 1, 1, 1,
-0.4068935, -1.536561, -3.066535, 1, 1, 1, 1, 1,
-0.405567, 1.014445, -0.5363912, 1, 1, 1, 1, 1,
-0.404261, 0.1028474, -0.2808583, 1, 1, 1, 1, 1,
-0.4030892, 1.346024, 0.247696, 1, 1, 1, 1, 1,
-0.402692, -0.2338821, -1.637045, 1, 1, 1, 1, 1,
-0.3986057, 1.450727, -1.334938, 1, 1, 1, 1, 1,
-0.3971968, 1.019059, -0.5958098, 1, 1, 1, 1, 1,
-0.3952561, -0.7226651, -1.37043, 1, 1, 1, 1, 1,
-0.3942731, -0.05159903, -1.264621, 1, 1, 1, 1, 1,
-0.3925455, 2.276419, -0.1287988, 1, 1, 1, 1, 1,
-0.3921234, -0.3346666, -0.6653421, 1, 1, 1, 1, 1,
-0.3888246, -0.7041926, -3.387908, 0, 0, 1, 1, 1,
-0.3838269, 0.05987668, -0.08473115, 1, 0, 0, 1, 1,
-0.3795823, 0.9643071, 1.122002, 1, 0, 0, 1, 1,
-0.3791996, 0.5155851, -1.238288, 1, 0, 0, 1, 1,
-0.3791815, -1.053576, -2.925847, 1, 0, 0, 1, 1,
-0.3746012, 0.09595934, -1.567114, 1, 0, 0, 1, 1,
-0.372043, -0.6557898, -3.045124, 0, 0, 0, 1, 1,
-0.3695981, 1.064713, 0.6371961, 0, 0, 0, 1, 1,
-0.3694969, -1.089849, -4.521231, 0, 0, 0, 1, 1,
-0.3658443, -0.46576, -2.321839, 0, 0, 0, 1, 1,
-0.359391, 0.5476258, -0.9314045, 0, 0, 0, 1, 1,
-0.3542565, 0.2149327, -1.159499, 0, 0, 0, 1, 1,
-0.3527263, -1.132915, -4.67099, 0, 0, 0, 1, 1,
-0.3515238, 0.5359311, -1.620157, 1, 1, 1, 1, 1,
-0.3342879, 0.3727879, -0.3474979, 1, 1, 1, 1, 1,
-0.3332725, -0.6691974, -3.688697, 1, 1, 1, 1, 1,
-0.3284639, 0.3521512, -2.028775, 1, 1, 1, 1, 1,
-0.3219804, -0.7800505, -4.030959, 1, 1, 1, 1, 1,
-0.3173734, 1.491743, -0.04376772, 1, 1, 1, 1, 1,
-0.3163708, 1.340888, 2.081563, 1, 1, 1, 1, 1,
-0.312282, -0.8214044, -0.568631, 1, 1, 1, 1, 1,
-0.3119341, 0.8958436, -2.17504, 1, 1, 1, 1, 1,
-0.3097228, -0.9369255, -3.451535, 1, 1, 1, 1, 1,
-0.3019922, -0.6875189, -2.236105, 1, 1, 1, 1, 1,
-0.2918548, 0.3627429, -2.926602, 1, 1, 1, 1, 1,
-0.2854056, 0.287943, -1.169226, 1, 1, 1, 1, 1,
-0.284783, -1.794385, -2.6715, 1, 1, 1, 1, 1,
-0.2834501, -0.4234042, -2.17916, 1, 1, 1, 1, 1,
-0.2834182, -2.863481, -3.817772, 0, 0, 1, 1, 1,
-0.2774255, 1.12926, -0.09220573, 1, 0, 0, 1, 1,
-0.2753094, -0.3637614, -4.70357, 1, 0, 0, 1, 1,
-0.2752286, 0.9800531, 0.799486, 1, 0, 0, 1, 1,
-0.2742332, 1.467191, 2.289835, 1, 0, 0, 1, 1,
-0.2723671, -0.9615881, -2.363045, 1, 0, 0, 1, 1,
-0.2704875, -0.1562553, -1.778733, 0, 0, 0, 1, 1,
-0.2703839, -0.08852447, -1.384538, 0, 0, 0, 1, 1,
-0.2682908, 0.7110561, 1.318676, 0, 0, 0, 1, 1,
-0.2682626, 0.8523068, -1.568325, 0, 0, 0, 1, 1,
-0.2654893, -0.9910626, -2.245161, 0, 0, 0, 1, 1,
-0.2642388, -0.5744247, -3.860534, 0, 0, 0, 1, 1,
-0.2571993, 0.918687, -0.2618365, 0, 0, 0, 1, 1,
-0.2570872, 0.7336938, 0.343577, 1, 1, 1, 1, 1,
-0.2527105, 0.9120593, 1.140922, 1, 1, 1, 1, 1,
-0.2484062, -1.315288, -2.031625, 1, 1, 1, 1, 1,
-0.2482883, 0.6006579, 1.121609, 1, 1, 1, 1, 1,
-0.2481136, 1.569545, 1.555428, 1, 1, 1, 1, 1,
-0.2463219, -2.052449, -3.270822, 1, 1, 1, 1, 1,
-0.2436157, -0.2804214, -2.400406, 1, 1, 1, 1, 1,
-0.2400519, 1.201717, 0.8513852, 1, 1, 1, 1, 1,
-0.2359169, -0.8125075, -4.124031, 1, 1, 1, 1, 1,
-0.2330651, 0.394241, -1.528464, 1, 1, 1, 1, 1,
-0.2324763, -0.09210076, -3.665087, 1, 1, 1, 1, 1,
-0.2319889, 0.2870997, -0.7580653, 1, 1, 1, 1, 1,
-0.2313266, -0.6445951, -1.709498, 1, 1, 1, 1, 1,
-0.2288523, -0.7557172, -5.446452, 1, 1, 1, 1, 1,
-0.2283107, -0.978449, -4.080822, 1, 1, 1, 1, 1,
-0.2254086, 1.64344, -2.348066, 0, 0, 1, 1, 1,
-0.2189927, 0.7146521, 0.244062, 1, 0, 0, 1, 1,
-0.2177605, 0.7113467, -0.1617508, 1, 0, 0, 1, 1,
-0.2172976, -0.8257149, -3.874159, 1, 0, 0, 1, 1,
-0.2133822, 0.1104393, -1.877214, 1, 0, 0, 1, 1,
-0.2123722, -0.5298514, -3.099943, 1, 0, 0, 1, 1,
-0.2109985, 1.470079, 0.3691961, 0, 0, 0, 1, 1,
-0.2082558, 2.148378, -0.2236536, 0, 0, 0, 1, 1,
-0.1958603, -1.793159, -3.241478, 0, 0, 0, 1, 1,
-0.1946654, 1.173643, -1.408773, 0, 0, 0, 1, 1,
-0.1935279, -0.7369606, -2.830958, 0, 0, 0, 1, 1,
-0.1893328, 0.16841, -0.1037371, 0, 0, 0, 1, 1,
-0.181843, -0.587483, -4.233212, 0, 0, 0, 1, 1,
-0.1816328, 1.02249, 1.023753, 1, 1, 1, 1, 1,
-0.1779592, -0.1552588, -3.245187, 1, 1, 1, 1, 1,
-0.1775295, -0.4309894, -3.539531, 1, 1, 1, 1, 1,
-0.1774106, -0.4202671, -3.680747, 1, 1, 1, 1, 1,
-0.1672816, -1.263334, -1.404114, 1, 1, 1, 1, 1,
-0.1651302, 0.3704095, -1.118101, 1, 1, 1, 1, 1,
-0.1605569, 1.952977, -0.7523468, 1, 1, 1, 1, 1,
-0.1541402, 0.2890096, 0.7415479, 1, 1, 1, 1, 1,
-0.1538961, -1.40334, -3.988992, 1, 1, 1, 1, 1,
-0.1518478, 0.3612381, 0.1751246, 1, 1, 1, 1, 1,
-0.1517956, -0.3053257, -1.845655, 1, 1, 1, 1, 1,
-0.1483322, 0.6186868, -0.8239486, 1, 1, 1, 1, 1,
-0.1472927, 0.8777518, 0.6335337, 1, 1, 1, 1, 1,
-0.1453986, 0.08107204, 0.8430475, 1, 1, 1, 1, 1,
-0.1444678, -1.199038, -2.550038, 1, 1, 1, 1, 1,
-0.1406397, 0.0907675, -1.013573, 0, 0, 1, 1, 1,
-0.1381603, -1.733498, -2.270909, 1, 0, 0, 1, 1,
-0.1374156, -0.7848105, -2.647106, 1, 0, 0, 1, 1,
-0.1372636, 0.7834031, 0.9205077, 1, 0, 0, 1, 1,
-0.1369059, -0.8239068, -3.773265, 1, 0, 0, 1, 1,
-0.132497, 2.781642, 0.03219307, 1, 0, 0, 1, 1,
-0.1292308, 2.141483, -0.6567816, 0, 0, 0, 1, 1,
-0.1287708, 1.62518, -1.255675, 0, 0, 0, 1, 1,
-0.1253155, -0.568305, -1.73246, 0, 0, 0, 1, 1,
-0.1223269, -0.4330902, -1.432592, 0, 0, 0, 1, 1,
-0.1214081, 0.3351289, -1.056215, 0, 0, 0, 1, 1,
-0.1201571, -1.63277, -5.841248, 0, 0, 0, 1, 1,
-0.1187033, -0.1671261, -2.338466, 0, 0, 0, 1, 1,
-0.1166694, 0.7026516, -0.3177792, 1, 1, 1, 1, 1,
-0.1151716, -0.4397056, -3.524528, 1, 1, 1, 1, 1,
-0.1088383, 0.1289746, -2.027576, 1, 1, 1, 1, 1,
-0.1078748, 1.868696, -0.2455235, 1, 1, 1, 1, 1,
-0.1060403, -0.02244602, -0.9239464, 1, 1, 1, 1, 1,
-0.1048941, -0.6705977, -3.164143, 1, 1, 1, 1, 1,
-0.1025667, -0.6736526, -3.50775, 1, 1, 1, 1, 1,
-0.1023305, -0.314642, -5.317903, 1, 1, 1, 1, 1,
-0.101863, -0.3096986, -1.820895, 1, 1, 1, 1, 1,
-0.1014301, 0.8390121, 0.015954, 1, 1, 1, 1, 1,
-0.1001729, -1.675034, -2.233477, 1, 1, 1, 1, 1,
-0.1000967, -1.785557, -4.44899, 1, 1, 1, 1, 1,
-0.09618406, -0.7624753, -3.188864, 1, 1, 1, 1, 1,
-0.09046696, 0.6426181, -0.2119233, 1, 1, 1, 1, 1,
-0.08633132, 0.5977411, 0.8233866, 1, 1, 1, 1, 1,
-0.08469657, -0.2544479, -2.738174, 0, 0, 1, 1, 1,
-0.08282252, -1.389242, -3.718913, 1, 0, 0, 1, 1,
-0.08241923, -0.9121168, -3.206179, 1, 0, 0, 1, 1,
-0.08237836, 0.2848787, -0.8209786, 1, 0, 0, 1, 1,
-0.07876213, 1.708307, 0.3606465, 1, 0, 0, 1, 1,
-0.07703611, 1.134958, -2.301964, 1, 0, 0, 1, 1,
-0.07342939, -0.6940219, -4.075328, 0, 0, 0, 1, 1,
-0.0691932, 0.4612859, -0.151929, 0, 0, 0, 1, 1,
-0.06703495, 0.07971094, -1.7254, 0, 0, 0, 1, 1,
-0.06693507, 0.7652075, 2.481061, 0, 0, 0, 1, 1,
-0.06380404, -0.7046424, -2.621448, 0, 0, 0, 1, 1,
-0.06281762, -0.2266965, -4.460429, 0, 0, 0, 1, 1,
-0.06072635, -0.9183004, -3.322082, 0, 0, 0, 1, 1,
-0.0565028, -0.4198989, -1.555058, 1, 1, 1, 1, 1,
-0.05398113, -0.4662709, -2.351052, 1, 1, 1, 1, 1,
-0.05283641, -0.06944358, -2.044441, 1, 1, 1, 1, 1,
-0.05184763, 0.6011063, -0.1793852, 1, 1, 1, 1, 1,
-0.05145892, -1.270912, -2.767624, 1, 1, 1, 1, 1,
-0.04942576, -0.8295946, -3.489143, 1, 1, 1, 1, 1,
-0.04887701, 1.969796, -0.3015179, 1, 1, 1, 1, 1,
-0.04881741, -0.2283362, -4.841378, 1, 1, 1, 1, 1,
-0.04599122, 0.5676351, -0.9999785, 1, 1, 1, 1, 1,
-0.04578435, 0.3051598, -0.1387343, 1, 1, 1, 1, 1,
-0.04440824, 0.08264083, -0.9556605, 1, 1, 1, 1, 1,
-0.04393408, -0.1492143, -5.239989, 1, 1, 1, 1, 1,
-0.04249165, -0.1494973, -4.219879, 1, 1, 1, 1, 1,
-0.04235857, 1.002074, 0.03605699, 1, 1, 1, 1, 1,
-0.03797956, 1.27433, 0.06536435, 1, 1, 1, 1, 1,
-0.03535556, 0.5132774, 0.07003525, 0, 0, 1, 1, 1,
-0.03115484, 0.1024949, -1.830684, 1, 0, 0, 1, 1,
-0.02942904, 0.4921439, -1.21339, 1, 0, 0, 1, 1,
-0.02520613, 1.0255, -1.241559, 1, 0, 0, 1, 1,
-0.02507151, 0.02318989, -0.9234982, 1, 0, 0, 1, 1,
-0.01446713, 1.344126, 1.165286, 1, 0, 0, 1, 1,
-0.007601936, 0.06959485, 1.095864, 0, 0, 0, 1, 1,
-0.004156435, -1.4379, -3.774287, 0, 0, 0, 1, 1,
-0.003674055, 0.3384749, 0.0194454, 0, 0, 0, 1, 1,
-0.0007174037, 0.08216155, 1.168742, 0, 0, 0, 1, 1,
-4.788237e-05, -0.9868436, -3.496403, 0, 0, 0, 1, 1,
0.01124254, 0.1586643, 0.2691477, 0, 0, 0, 1, 1,
0.0161337, -1.320995, 2.491502, 0, 0, 0, 1, 1,
0.01876851, -1.671424, 2.214289, 1, 1, 1, 1, 1,
0.02179178, 0.02176482, 0.8919942, 1, 1, 1, 1, 1,
0.02185928, 1.357131, 0.3195508, 1, 1, 1, 1, 1,
0.02777071, -0.07757367, 2.101343, 1, 1, 1, 1, 1,
0.02931881, -0.4513524, 1.584279, 1, 1, 1, 1, 1,
0.03043593, -0.1964082, 4.294106, 1, 1, 1, 1, 1,
0.030747, 0.3160273, 0.09339852, 1, 1, 1, 1, 1,
0.03102558, -1.006361, 1.945948, 1, 1, 1, 1, 1,
0.03460972, 0.2457609, -0.1355233, 1, 1, 1, 1, 1,
0.0365004, -0.7832319, 1.438105, 1, 1, 1, 1, 1,
0.03952156, 0.6411868, 0.5929074, 1, 1, 1, 1, 1,
0.04216047, -1.35762, 2.222684, 1, 1, 1, 1, 1,
0.04515472, -0.2786122, 3.055157, 1, 1, 1, 1, 1,
0.04523113, -1.378197, 3.380281, 1, 1, 1, 1, 1,
0.04539901, -0.8961009, 4.482656, 1, 1, 1, 1, 1,
0.04780189, 0.107736, -0.990038, 0, 0, 1, 1, 1,
0.05226685, 1.284555, -0.5814503, 1, 0, 0, 1, 1,
0.05996998, 1.297535, 1.813045, 1, 0, 0, 1, 1,
0.06596851, 0.4766509, 2.219011, 1, 0, 0, 1, 1,
0.0669714, 0.0958821, 1.591223, 1, 0, 0, 1, 1,
0.06826941, 0.1038837, 0.4355322, 1, 0, 0, 1, 1,
0.06843001, -1.162305, 3.567056, 0, 0, 0, 1, 1,
0.06985737, 1.123174, -1.303705, 0, 0, 0, 1, 1,
0.06987543, 0.426538, -0.4127103, 0, 0, 0, 1, 1,
0.07099835, -1.784467, 3.731909, 0, 0, 0, 1, 1,
0.07110859, -0.3746734, 2.090435, 0, 0, 0, 1, 1,
0.08294947, -0.07502957, 2.88339, 0, 0, 0, 1, 1,
0.0863641, 0.6139146, 0.5182901, 0, 0, 0, 1, 1,
0.08718613, 0.2525086, 1.646458, 1, 1, 1, 1, 1,
0.08814488, 1.008768, -0.1770357, 1, 1, 1, 1, 1,
0.08875681, -0.07825197, 3.075948, 1, 1, 1, 1, 1,
0.09594466, 0.2426144, 0.1451946, 1, 1, 1, 1, 1,
0.09840111, 1.190331, -0.09859795, 1, 1, 1, 1, 1,
0.1014652, 0.7406888, -0.05294468, 1, 1, 1, 1, 1,
0.1068604, 0.2934034, 0.9805399, 1, 1, 1, 1, 1,
0.1076511, 0.7039841, -1.003219, 1, 1, 1, 1, 1,
0.1102641, -0.7334607, 4.562332, 1, 1, 1, 1, 1,
0.1106363, -0.8395034, 2.286257, 1, 1, 1, 1, 1,
0.1112365, -0.1909354, 4.182856, 1, 1, 1, 1, 1,
0.1122398, 1.15773, 0.5734807, 1, 1, 1, 1, 1,
0.1127322, 0.07514213, 2.035859, 1, 1, 1, 1, 1,
0.1215296, 0.02149413, 3.055035, 1, 1, 1, 1, 1,
0.1246091, -1.104436, 3.903942, 1, 1, 1, 1, 1,
0.1264026, -0.3456439, 2.050873, 0, 0, 1, 1, 1,
0.126417, 0.842913, 0.9565572, 1, 0, 0, 1, 1,
0.1264514, -0.1858968, 2.50234, 1, 0, 0, 1, 1,
0.1272276, -0.253636, 1.158934, 1, 0, 0, 1, 1,
0.1287015, 0.6621843, -0.1839015, 1, 0, 0, 1, 1,
0.1327639, -1.161477, 3.163917, 1, 0, 0, 1, 1,
0.1328373, -1.873443, 3.357817, 0, 0, 0, 1, 1,
0.1362284, -0.1413931, 1.82734, 0, 0, 0, 1, 1,
0.1373415, 0.1776951, 1.898453, 0, 0, 0, 1, 1,
0.1387837, 0.6110564, -0.1834381, 0, 0, 0, 1, 1,
0.1387867, -0.3365595, 2.317698, 0, 0, 0, 1, 1,
0.1390138, 0.3120506, -0.0352035, 0, 0, 0, 1, 1,
0.1414873, -0.4354958, 2.182155, 0, 0, 0, 1, 1,
0.1420263, 0.3809147, -1.045641, 1, 1, 1, 1, 1,
0.1423205, 0.1128362, 0.4258223, 1, 1, 1, 1, 1,
0.1456621, -0.09367095, 2.895009, 1, 1, 1, 1, 1,
0.1464326, 0.09187974, 0.7879925, 1, 1, 1, 1, 1,
0.1497512, 1.357309, 0.1326191, 1, 1, 1, 1, 1,
0.1647739, 1.435314, -1.020201, 1, 1, 1, 1, 1,
0.16479, 0.7265318, -0.194529, 1, 1, 1, 1, 1,
0.1666429, 1.172842, -0.840363, 1, 1, 1, 1, 1,
0.1706661, -0.1676562, 3.167913, 1, 1, 1, 1, 1,
0.1717835, -1.374363, 4.620995, 1, 1, 1, 1, 1,
0.1721218, 0.7889087, 0.186494, 1, 1, 1, 1, 1,
0.173427, 1.15031, 0.3499515, 1, 1, 1, 1, 1,
0.1756632, -1.480576, 1.858989, 1, 1, 1, 1, 1,
0.1797873, -0.02359786, 1.952179, 1, 1, 1, 1, 1,
0.180323, -0.8059275, 1.022089, 1, 1, 1, 1, 1,
0.1809967, -1.205141, 2.62677, 0, 0, 1, 1, 1,
0.1815868, 0.7221683, 0.4913401, 1, 0, 0, 1, 1,
0.1835435, -0.3185061, 1.900605, 1, 0, 0, 1, 1,
0.1845505, -0.6306989, 3.533777, 1, 0, 0, 1, 1,
0.1846748, -1.298796, 3.4543, 1, 0, 0, 1, 1,
0.1849452, -1.368315, 3.436158, 1, 0, 0, 1, 1,
0.1880899, 0.2385708, 0.3528725, 0, 0, 0, 1, 1,
0.1899935, -0.7302157, 0.3322314, 0, 0, 0, 1, 1,
0.1906941, -1.211962, 3.807501, 0, 0, 0, 1, 1,
0.1907714, 1.813851, 1.337985, 0, 0, 0, 1, 1,
0.1938174, 0.7716578, -0.7396333, 0, 0, 0, 1, 1,
0.1943051, 0.2749574, -0.2883627, 0, 0, 0, 1, 1,
0.2003777, 1.865919, -1.282071, 0, 0, 0, 1, 1,
0.2011128, -0.435051, 5.343861, 1, 1, 1, 1, 1,
0.2013157, 0.2083302, 0.01526143, 1, 1, 1, 1, 1,
0.2141702, 1.271208, -0.7546019, 1, 1, 1, 1, 1,
0.2145347, 0.3300281, 0.1151671, 1, 1, 1, 1, 1,
0.2150266, 0.8045622, 0.1425711, 1, 1, 1, 1, 1,
0.2159681, -0.2524849, 3.856343, 1, 1, 1, 1, 1,
0.2166214, -1.039698, 2.100157, 1, 1, 1, 1, 1,
0.2211709, 1.954778, -0.8906651, 1, 1, 1, 1, 1,
0.2226229, -0.7405846, 0.9317152, 1, 1, 1, 1, 1,
0.2243135, -0.1803486, 4.044089, 1, 1, 1, 1, 1,
0.2252056, 0.5144967, 0.7235649, 1, 1, 1, 1, 1,
0.2261481, -0.1237184, 1.953104, 1, 1, 1, 1, 1,
0.2279463, -0.5298324, 2.817651, 1, 1, 1, 1, 1,
0.2317213, -1.907905, 4.046614, 1, 1, 1, 1, 1,
0.233421, 0.7935764, 0.8724941, 1, 1, 1, 1, 1,
0.2337006, 0.3488787, 1.931796, 0, 0, 1, 1, 1,
0.2370779, 0.236302, 1.018968, 1, 0, 0, 1, 1,
0.2381456, -0.09894912, 1.376855, 1, 0, 0, 1, 1,
0.2457693, -0.6333323, 3.510658, 1, 0, 0, 1, 1,
0.2458744, -0.6985074, 3.641907, 1, 0, 0, 1, 1,
0.246168, -0.5460156, 3.412814, 1, 0, 0, 1, 1,
0.2483991, 0.23429, 0.3588469, 0, 0, 0, 1, 1,
0.2485829, -1.169669, 2.290335, 0, 0, 0, 1, 1,
0.2530631, 0.8089887, -0.1214302, 0, 0, 0, 1, 1,
0.25337, -0.7206137, 1.783471, 0, 0, 0, 1, 1,
0.2534966, -0.354747, 2.311645, 0, 0, 0, 1, 1,
0.2546705, 0.1123521, 2.314837, 0, 0, 0, 1, 1,
0.2555877, -1.285143, 2.827109, 0, 0, 0, 1, 1,
0.2568623, 0.09829871, 1.062374, 1, 1, 1, 1, 1,
0.2671823, -1.025419, 3.205159, 1, 1, 1, 1, 1,
0.2672085, 0.5128418, 0.7044959, 1, 1, 1, 1, 1,
0.2676235, -1.437049, 2.56308, 1, 1, 1, 1, 1,
0.2684514, -0.3148419, 2.86732, 1, 1, 1, 1, 1,
0.2693404, -0.6639828, 2.179363, 1, 1, 1, 1, 1,
0.2707835, 1.307144, -0.08159906, 1, 1, 1, 1, 1,
0.270802, 0.1574219, 0.41886, 1, 1, 1, 1, 1,
0.2757089, 0.9223122, -1.282004, 1, 1, 1, 1, 1,
0.2786313, 1.88533, 0.4531398, 1, 1, 1, 1, 1,
0.2819205, -0.7140413, 2.727355, 1, 1, 1, 1, 1,
0.2874134, -1.075798, 2.635557, 1, 1, 1, 1, 1,
0.2892371, -1.793576, 4.635255, 1, 1, 1, 1, 1,
0.2953383, 0.397116, -0.2533105, 1, 1, 1, 1, 1,
0.2978952, 1.002373, -0.3367729, 1, 1, 1, 1, 1,
0.3011284, 0.4197646, 0.2002173, 0, 0, 1, 1, 1,
0.3033526, 0.5376589, -0.05364582, 1, 0, 0, 1, 1,
0.3035607, -0.5746796, 2.429251, 1, 0, 0, 1, 1,
0.3056419, -2.185991, 0.6542209, 1, 0, 0, 1, 1,
0.3057921, 0.05238523, 1.75683, 1, 0, 0, 1, 1,
0.3105078, -0.07063659, 2.206363, 1, 0, 0, 1, 1,
0.3241159, -1.915356, 2.859218, 0, 0, 0, 1, 1,
0.3271265, -1.003612, 2.329384, 0, 0, 0, 1, 1,
0.3295243, 0.8842411, -0.9208121, 0, 0, 0, 1, 1,
0.3405548, 0.9836007, 0.04732792, 0, 0, 0, 1, 1,
0.3412965, 0.112143, 1.663966, 0, 0, 0, 1, 1,
0.3413032, -1.308979, 1.436614, 0, 0, 0, 1, 1,
0.3496682, 0.8525837, -1.174609, 0, 0, 0, 1, 1,
0.349932, 1.103317, 0.4810606, 1, 1, 1, 1, 1,
0.352773, -0.1787014, 1.17684, 1, 1, 1, 1, 1,
0.3534975, 0.6391014, 1.701418, 1, 1, 1, 1, 1,
0.3547361, -1.077466, 3.079974, 1, 1, 1, 1, 1,
0.3548886, -0.795005, 0.7316897, 1, 1, 1, 1, 1,
0.3577694, -0.2558638, 3.161059, 1, 1, 1, 1, 1,
0.3591342, -0.9873453, 1.302466, 1, 1, 1, 1, 1,
0.3643311, -0.6344882, 2.370469, 1, 1, 1, 1, 1,
0.3647398, -2.511382, 1.601275, 1, 1, 1, 1, 1,
0.3668985, 0.5277492, -0.1479564, 1, 1, 1, 1, 1,
0.3679552, 2.227393, -0.4813484, 1, 1, 1, 1, 1,
0.3772669, 0.001670727, 0.2270192, 1, 1, 1, 1, 1,
0.3830971, -0.9277495, 3.712491, 1, 1, 1, 1, 1,
0.3837507, 0.9096233, 0.2170548, 1, 1, 1, 1, 1,
0.3884054, 0.8144419, -0.1036302, 1, 1, 1, 1, 1,
0.39176, 1.323878, -0.2387113, 0, 0, 1, 1, 1,
0.3932877, 1.099255, 0.4108404, 1, 0, 0, 1, 1,
0.3946746, -0.467552, 1.355913, 1, 0, 0, 1, 1,
0.3971876, 1.125871, 1.20848, 1, 0, 0, 1, 1,
0.3973008, -1.059292, 4.028092, 1, 0, 0, 1, 1,
0.4002644, 0.2121828, 1.527244, 1, 0, 0, 1, 1,
0.4060644, -0.6992654, 2.246336, 0, 0, 0, 1, 1,
0.4077857, 0.07165775, 2.249273, 0, 0, 0, 1, 1,
0.4135744, 0.7994737, -0.3918771, 0, 0, 0, 1, 1,
0.4183328, -0.2072774, 2.957051, 0, 0, 0, 1, 1,
0.4204799, -1.406994, 2.242127, 0, 0, 0, 1, 1,
0.4263475, 0.2247503, 0.04392353, 0, 0, 0, 1, 1,
0.4276155, 0.9008312, 0.8043943, 0, 0, 0, 1, 1,
0.4289343, -1.801702, 1.583635, 1, 1, 1, 1, 1,
0.4344479, -0.6244808, 2.331191, 1, 1, 1, 1, 1,
0.4428707, -0.02804645, 1.37566, 1, 1, 1, 1, 1,
0.4431001, 0.4201024, 1.934708, 1, 1, 1, 1, 1,
0.4433009, 0.5092148, 2.566453, 1, 1, 1, 1, 1,
0.4488587, 0.5804826, 2.249488, 1, 1, 1, 1, 1,
0.4501848, 0.7026243, 0.2721334, 1, 1, 1, 1, 1,
0.4527206, 0.6295179, 1.852876, 1, 1, 1, 1, 1,
0.4529622, -1.188186, 3.648408, 1, 1, 1, 1, 1,
0.4570059, 1.667788, -0.2001297, 1, 1, 1, 1, 1,
0.4671701, -1.221959, 3.601057, 1, 1, 1, 1, 1,
0.468852, -0.6734536, 2.879079, 1, 1, 1, 1, 1,
0.4693519, 0.2656938, 1.483439, 1, 1, 1, 1, 1,
0.4824725, 1.573793, 1.848668, 1, 1, 1, 1, 1,
0.4825035, -0.4410134, 0.2849838, 1, 1, 1, 1, 1,
0.4845357, 1.770919, -0.6065913, 0, 0, 1, 1, 1,
0.4848891, 0.4197369, 0.4617485, 1, 0, 0, 1, 1,
0.487476, 0.4056289, -0.07660572, 1, 0, 0, 1, 1,
0.4886563, -0.03578248, 0.3205574, 1, 0, 0, 1, 1,
0.4896317, 1.157297, -1.161942, 1, 0, 0, 1, 1,
0.4915925, 1.423711, 1.489141, 1, 0, 0, 1, 1,
0.4992698, 0.6685345, 0.3069956, 0, 0, 0, 1, 1,
0.4994887, -0.3470225, 2.830038, 0, 0, 0, 1, 1,
0.4996373, -1.163697, 3.068677, 0, 0, 0, 1, 1,
0.5024223, -0.3695038, 2.523804, 0, 0, 0, 1, 1,
0.5030106, -0.3786398, 0.3375103, 0, 0, 0, 1, 1,
0.5050981, 3.011062, 0.447498, 0, 0, 0, 1, 1,
0.5081146, 0.8605793, 1.67601, 0, 0, 0, 1, 1,
0.5087314, -1.271544, 2.399803, 1, 1, 1, 1, 1,
0.5098452, -0.6254832, 2.666968, 1, 1, 1, 1, 1,
0.5222483, 0.1175073, 1.583808, 1, 1, 1, 1, 1,
0.5238402, 0.6396938, 0.02143047, 1, 1, 1, 1, 1,
0.5279393, -0.8281135, 2.512865, 1, 1, 1, 1, 1,
0.5404018, -0.6682761, 1.785139, 1, 1, 1, 1, 1,
0.5421332, 1.902008, 0.4962142, 1, 1, 1, 1, 1,
0.5500417, -1.235131, 2.263811, 1, 1, 1, 1, 1,
0.5537475, 0.06817446, 0.649065, 1, 1, 1, 1, 1,
0.5615239, -0.8161169, 2.791607, 1, 1, 1, 1, 1,
0.5615977, 1.055109, -0.2998978, 1, 1, 1, 1, 1,
0.57202, -1.239546, 2.927066, 1, 1, 1, 1, 1,
0.5781265, 0.1240178, 0.7370059, 1, 1, 1, 1, 1,
0.5795392, -0.8960146, 2.994792, 1, 1, 1, 1, 1,
0.583902, 0.7867213, 1.254475, 1, 1, 1, 1, 1,
0.5844572, 0.08659168, 2.913839, 0, 0, 1, 1, 1,
0.5876513, -1.379514, 3.808526, 1, 0, 0, 1, 1,
0.5904767, 0.8531877, 2.141329, 1, 0, 0, 1, 1,
0.5906221, 1.675892, -1.04472, 1, 0, 0, 1, 1,
0.5976964, -1.601521, 4.557574, 1, 0, 0, 1, 1,
0.6006029, 0.7318202, 1.61053, 1, 0, 0, 1, 1,
0.6039391, 0.7812412, 1.311274, 0, 0, 0, 1, 1,
0.6053839, 0.7975932, -0.9273331, 0, 0, 0, 1, 1,
0.6158434, -0.4583135, 3.316492, 0, 0, 0, 1, 1,
0.6199809, -1.048449, 0.3659459, 0, 0, 0, 1, 1,
0.6204469, -2.618793, 2.624759, 0, 0, 0, 1, 1,
0.6227641, 2.560758, 1.836448, 0, 0, 0, 1, 1,
0.6259157, -0.4487358, 2.06762, 0, 0, 0, 1, 1,
0.630876, 0.296466, 2.225842, 1, 1, 1, 1, 1,
0.6308836, -0.3279968, 0.6534702, 1, 1, 1, 1, 1,
0.6318492, -0.3305932, 1.526517, 1, 1, 1, 1, 1,
0.631896, 1.022532, 2.364671, 1, 1, 1, 1, 1,
0.6367967, -0.8247896, 1.916321, 1, 1, 1, 1, 1,
0.6377193, 0.28057, 2.574171, 1, 1, 1, 1, 1,
0.6447598, 1.124711, 0.8337723, 1, 1, 1, 1, 1,
0.6548719, 2.170018, -0.05691255, 1, 1, 1, 1, 1,
0.656227, -1.079287, 1.587931, 1, 1, 1, 1, 1,
0.6569459, -0.3946493, 1.052049, 1, 1, 1, 1, 1,
0.6633474, 0.623253, -0.4304216, 1, 1, 1, 1, 1,
0.6649935, -0.1536825, 3.202527, 1, 1, 1, 1, 1,
0.6715866, 0.4914461, 1.906124, 1, 1, 1, 1, 1,
0.674905, -0.2009654, 1.32174, 1, 1, 1, 1, 1,
0.678142, 1.593431, 1.269557, 1, 1, 1, 1, 1,
0.6792407, 0.8263131, 0.3399809, 0, 0, 1, 1, 1,
0.688349, -0.3959535, 1.927184, 1, 0, 0, 1, 1,
0.6905702, 0.3037081, 0.8993908, 1, 0, 0, 1, 1,
0.6959283, 0.7606309, 2.078142, 1, 0, 0, 1, 1,
0.6959386, 0.3701724, -0.2646447, 1, 0, 0, 1, 1,
0.7017351, -2.232984, 3.529211, 1, 0, 0, 1, 1,
0.7026525, 0.295773, 1.828999, 0, 0, 0, 1, 1,
0.703084, -0.4801212, 1.303953, 0, 0, 0, 1, 1,
0.7065093, -0.9190032, 3.263832, 0, 0, 0, 1, 1,
0.7066814, 0.5628722, 1.824571, 0, 0, 0, 1, 1,
0.7066962, -0.3665301, 0.414663, 0, 0, 0, 1, 1,
0.7090023, -0.008621352, 1.30723, 0, 0, 0, 1, 1,
0.7173837, -0.004463611, 1.930451, 0, 0, 0, 1, 1,
0.7188779, -0.9696478, 2.877835, 1, 1, 1, 1, 1,
0.7210612, -0.2480509, 1.436507, 1, 1, 1, 1, 1,
0.723999, -0.3919156, 3.806459, 1, 1, 1, 1, 1,
0.7258103, 0.2197092, 0.8323048, 1, 1, 1, 1, 1,
0.7276406, -1.065229, 2.009492, 1, 1, 1, 1, 1,
0.7283739, 0.6381429, -0.1531646, 1, 1, 1, 1, 1,
0.7314896, 0.812986, -0.704642, 1, 1, 1, 1, 1,
0.7463846, 0.5216342, -1.108986, 1, 1, 1, 1, 1,
0.7512197, -0.008257117, 1.148913, 1, 1, 1, 1, 1,
0.751865, 1.849987, 0.7061135, 1, 1, 1, 1, 1,
0.7524913, -1.07918, 3.144348, 1, 1, 1, 1, 1,
0.7535978, 0.6095806, -0.588181, 1, 1, 1, 1, 1,
0.7599521, 0.9461904, 1.372321, 1, 1, 1, 1, 1,
0.7640214, -0.4938395, 1.561169, 1, 1, 1, 1, 1,
0.7679947, 0.231565, 1.153843, 1, 1, 1, 1, 1,
0.7721901, -0.1794161, 2.408221, 0, 0, 1, 1, 1,
0.7823261, 0.9117275, 0.2416539, 1, 0, 0, 1, 1,
0.7829084, 0.01848704, 1.903862, 1, 0, 0, 1, 1,
0.787066, -0.7788517, 1.817031, 1, 0, 0, 1, 1,
0.7893443, -1.494165, 4.551949, 1, 0, 0, 1, 1,
0.7918681, 0.3266009, 0.9758094, 1, 0, 0, 1, 1,
0.7967281, -1.431333, 3.041753, 0, 0, 0, 1, 1,
0.7970104, -1.240394, 2.085723, 0, 0, 0, 1, 1,
0.7977663, 2.469158, 0.03073646, 0, 0, 0, 1, 1,
0.7984559, -1.428884, 3.605149, 0, 0, 0, 1, 1,
0.7987074, -0.004076688, 1.631054, 0, 0, 0, 1, 1,
0.8006657, 0.2953582, 0.3914425, 0, 0, 0, 1, 1,
0.8017083, 0.1570624, 1.244506, 0, 0, 0, 1, 1,
0.8110362, -0.6538938, 3.956745, 1, 1, 1, 1, 1,
0.815685, 0.6601717, 0.6946857, 1, 1, 1, 1, 1,
0.8156953, -1.222693, 1.680183, 1, 1, 1, 1, 1,
0.8228645, -0.1555793, 0.5665917, 1, 1, 1, 1, 1,
0.8278998, -1.469755, 3.425397, 1, 1, 1, 1, 1,
0.8296428, -0.5858718, 3.333709, 1, 1, 1, 1, 1,
0.8368609, 0.2523901, 0.2808169, 1, 1, 1, 1, 1,
0.8376617, 0.4394473, -0.4103741, 1, 1, 1, 1, 1,
0.8385053, -1.832315, 3.755396, 1, 1, 1, 1, 1,
0.8395694, -1.606089, 2.497868, 1, 1, 1, 1, 1,
0.8395869, -1.25544, 1.183716, 1, 1, 1, 1, 1,
0.8406901, 0.716057, 1.20764, 1, 1, 1, 1, 1,
0.8508595, -1.501246, 4.738497, 1, 1, 1, 1, 1,
0.8533668, -1.229182, 3.331253, 1, 1, 1, 1, 1,
0.8546181, 0.003275395, 1.048187, 1, 1, 1, 1, 1,
0.8547937, -1.554997, 2.56825, 0, 0, 1, 1, 1,
0.8616961, -1.541586, 3.393203, 1, 0, 0, 1, 1,
0.8659781, -0.4961886, 1.981131, 1, 0, 0, 1, 1,
0.8725961, 0.6823437, 1.543819, 1, 0, 0, 1, 1,
0.8726335, 0.570415, 0.4824786, 1, 0, 0, 1, 1,
0.8738117, -0.5093568, 1.359441, 1, 0, 0, 1, 1,
0.8866812, 0.06866647, 2.95173, 0, 0, 0, 1, 1,
0.8892879, -0.2225255, 1.998646, 0, 0, 0, 1, 1,
0.8905488, 0.7450189, 3.580151, 0, 0, 0, 1, 1,
0.8925908, 0.3662225, -0.01697195, 0, 0, 0, 1, 1,
0.8961325, 1.014529, -0.1719627, 0, 0, 0, 1, 1,
0.8962178, 1.276752, 1.54074, 0, 0, 0, 1, 1,
0.8990318, 0.68396, 2.158293, 0, 0, 0, 1, 1,
0.9132959, -0.7897575, 1.53993, 1, 1, 1, 1, 1,
0.9143301, 1.077324, 1.050587, 1, 1, 1, 1, 1,
0.915834, 1.359716, 0.8826914, 1, 1, 1, 1, 1,
0.9161795, 0.08133417, 1.138856, 1, 1, 1, 1, 1,
0.9262274, -0.5845099, 2.390092, 1, 1, 1, 1, 1,
0.9263963, 0.5329719, -0.1903261, 1, 1, 1, 1, 1,
0.9300013, -0.9013439, 1.674484, 1, 1, 1, 1, 1,
0.9329265, -0.8577174, 2.162629, 1, 1, 1, 1, 1,
0.9332548, -0.2364013, 0.6453143, 1, 1, 1, 1, 1,
0.9347929, 1.971751, 0.7793443, 1, 1, 1, 1, 1,
0.9363307, -1.275632, 3.17409, 1, 1, 1, 1, 1,
0.9380974, -0.1845361, 2.310093, 1, 1, 1, 1, 1,
0.9421605, -0.3111831, 0.9863813, 1, 1, 1, 1, 1,
0.9429809, -0.5377713, -0.1446068, 1, 1, 1, 1, 1,
0.9522502, -0.3654456, 2.343886, 1, 1, 1, 1, 1,
0.9555176, 0.708178, 2.154641, 0, 0, 1, 1, 1,
0.9586824, -1.040322, 3.219525, 1, 0, 0, 1, 1,
0.9624765, -0.01772027, 1.348347, 1, 0, 0, 1, 1,
0.9668277, -0.2273187, 2.293462, 1, 0, 0, 1, 1,
0.9703758, 0.7120992, 2.263196, 1, 0, 0, 1, 1,
0.9705822, -1.745869, 2.336281, 1, 0, 0, 1, 1,
0.9772907, -1.000075, 3.065108, 0, 0, 0, 1, 1,
0.9784509, -1.016714, 2.63544, 0, 0, 0, 1, 1,
0.9914516, 0.2738855, 0.4973031, 0, 0, 0, 1, 1,
0.9919673, -0.144557, 0.2816146, 0, 0, 0, 1, 1,
0.9942095, 0.3092707, 0.4208794, 0, 0, 0, 1, 1,
0.9974908, -1.1495, 2.557541, 0, 0, 0, 1, 1,
0.9980363, 0.7097638, -0.5612815, 0, 0, 0, 1, 1,
0.9982509, 0.614727, 1.045571, 1, 1, 1, 1, 1,
1.005697, 0.4129971, 2.813823, 1, 1, 1, 1, 1,
1.012671, -1.245804, 1.768281, 1, 1, 1, 1, 1,
1.013858, 1.307825, -0.1800669, 1, 1, 1, 1, 1,
1.017177, 0.9912252, -0.59328, 1, 1, 1, 1, 1,
1.024401, 1.398125, 1.232148, 1, 1, 1, 1, 1,
1.024978, -0.05882501, 0.2967797, 1, 1, 1, 1, 1,
1.033096, -0.699675, 0.6962195, 1, 1, 1, 1, 1,
1.036319, -0.305033, 1.413864, 1, 1, 1, 1, 1,
1.040767, -1.335481, 3.252455, 1, 1, 1, 1, 1,
1.060919, 1.162933, 1.26151, 1, 1, 1, 1, 1,
1.063399, -1.539558, 3.237024, 1, 1, 1, 1, 1,
1.071352, -1.971467, 3.483031, 1, 1, 1, 1, 1,
1.085966, 0.2929879, 0.6679842, 1, 1, 1, 1, 1,
1.088625, 2.054738, -0.08002081, 1, 1, 1, 1, 1,
1.091546, 0.3753793, 0.4349068, 0, 0, 1, 1, 1,
1.092021, 0.8749152, 1.794546, 1, 0, 0, 1, 1,
1.112473, 1.648158, 0.01306741, 1, 0, 0, 1, 1,
1.118103, 0.2102382, 2.432812, 1, 0, 0, 1, 1,
1.134999, -0.8104793, 1.585856, 1, 0, 0, 1, 1,
1.135157, -0.8736618, 4.667649, 1, 0, 0, 1, 1,
1.141773, -0.5286057, 3.170528, 0, 0, 0, 1, 1,
1.142256, 1.360089, 0.2053786, 0, 0, 0, 1, 1,
1.144448, 0.3552938, 1.902593, 0, 0, 0, 1, 1,
1.150715, 0.8600298, 1.964783, 0, 0, 0, 1, 1,
1.154326, 0.3950118, 0.6870254, 0, 0, 0, 1, 1,
1.155685, 0.1073853, 2.567787, 0, 0, 0, 1, 1,
1.156641, -0.4491691, 2.802455, 0, 0, 0, 1, 1,
1.169706, -0.3292612, 2.903644, 1, 1, 1, 1, 1,
1.171559, 0.08046587, 1.358454, 1, 1, 1, 1, 1,
1.176006, -0.590516, 1.31212, 1, 1, 1, 1, 1,
1.176951, 0.6211712, 0.06678648, 1, 1, 1, 1, 1,
1.178047, 0.6154894, 2.31304, 1, 1, 1, 1, 1,
1.178557, 0.5361071, 1.432082, 1, 1, 1, 1, 1,
1.178975, -0.1615642, 2.550739, 1, 1, 1, 1, 1,
1.185222, -0.5087627, 2.425738, 1, 1, 1, 1, 1,
1.188339, -0.7208448, 3.763294, 1, 1, 1, 1, 1,
1.189096, 0.3776601, 1.486244, 1, 1, 1, 1, 1,
1.199787, -0.1359835, 1.396665, 1, 1, 1, 1, 1,
1.20445, 0.7951616, 3.022922, 1, 1, 1, 1, 1,
1.20513, 0.8659984, 2.15297, 1, 1, 1, 1, 1,
1.208885, -0.7662479, 0.8584225, 1, 1, 1, 1, 1,
1.213466, 0.2107482, 0.4129249, 1, 1, 1, 1, 1,
1.214797, -0.9868239, 2.871353, 0, 0, 1, 1, 1,
1.22046, -0.002939844, 3.012506, 1, 0, 0, 1, 1,
1.22102, 1.947519, -0.006317582, 1, 0, 0, 1, 1,
1.22291, -0.5687382, 1.377497, 1, 0, 0, 1, 1,
1.225504, -0.04836241, 1.688371, 1, 0, 0, 1, 1,
1.23835, -1.256805, 2.472005, 1, 0, 0, 1, 1,
1.239729, -0.2151408, 0.2868319, 0, 0, 0, 1, 1,
1.240677, 1.571009, 1.730498, 0, 0, 0, 1, 1,
1.242026, 0.1995075, 2.335825, 0, 0, 0, 1, 1,
1.24403, 0.2877125, 1.025602, 0, 0, 0, 1, 1,
1.246208, 0.6250003, 0.5051775, 0, 0, 0, 1, 1,
1.247661, 0.6787923, 1.195473, 0, 0, 0, 1, 1,
1.250225, -0.9022516, 4.984122, 0, 0, 0, 1, 1,
1.27143, 1.707624, 0.7371326, 1, 1, 1, 1, 1,
1.274884, -0.353391, 2.29549, 1, 1, 1, 1, 1,
1.290183, 0.2199436, 0.2221195, 1, 1, 1, 1, 1,
1.29826, 0.005523565, 2.277835, 1, 1, 1, 1, 1,
1.298531, 1.463645, -0.5954823, 1, 1, 1, 1, 1,
1.310496, -1.305168, 2.660391, 1, 1, 1, 1, 1,
1.318724, -1.36687, 3.286542, 1, 1, 1, 1, 1,
1.325964, -0.5138408, 1.092511, 1, 1, 1, 1, 1,
1.336512, 0.4719817, 0.5712576, 1, 1, 1, 1, 1,
1.35149, -0.1132315, 0.5745842, 1, 1, 1, 1, 1,
1.361225, 1.892102, -0.4907567, 1, 1, 1, 1, 1,
1.362575, -0.6945195, 1.786611, 1, 1, 1, 1, 1,
1.374308, 0.3854827, 1.77238, 1, 1, 1, 1, 1,
1.378928, 0.9785002, 0.7358083, 1, 1, 1, 1, 1,
1.381288, 1.321914, -0.9718978, 1, 1, 1, 1, 1,
1.388727, 0.04213641, 1.449408, 0, 0, 1, 1, 1,
1.404662, -0.3592386, -0.9462088, 1, 0, 0, 1, 1,
1.405865, 1.87251, -0.3653488, 1, 0, 0, 1, 1,
1.417079, 0.04832188, 2.376128, 1, 0, 0, 1, 1,
1.419279, -0.8433843, 1.365309, 1, 0, 0, 1, 1,
1.428591, -1.491162, 1.16134, 1, 0, 0, 1, 1,
1.430026, 0.02115334, 1.163325, 0, 0, 0, 1, 1,
1.434418, -0.6181408, 2.866138, 0, 0, 0, 1, 1,
1.439524, -1.376039, 2.418716, 0, 0, 0, 1, 1,
1.440623, -0.18656, 3.734171, 0, 0, 0, 1, 1,
1.451573, 0.3954063, 0.7802461, 0, 0, 0, 1, 1,
1.458462, -0.2750863, 0.2160684, 0, 0, 0, 1, 1,
1.458693, 1.89219, 0.7676039, 0, 0, 0, 1, 1,
1.46789, 0.1293009, 0.8341923, 1, 1, 1, 1, 1,
1.48568, -0.6489819, 1.928327, 1, 1, 1, 1, 1,
1.494045, 0.7548304, 1.314335, 1, 1, 1, 1, 1,
1.498946, -0.2139506, 2.061957, 1, 1, 1, 1, 1,
1.505288, 0.5187134, 1.440184, 1, 1, 1, 1, 1,
1.511068, 0.4460215, -0.6116199, 1, 1, 1, 1, 1,
1.520099, 0.7082201, 0.02324747, 1, 1, 1, 1, 1,
1.52064, -0.06255796, 2.438706, 1, 1, 1, 1, 1,
1.526289, 0.5378586, 1.454429, 1, 1, 1, 1, 1,
1.530341, 1.377188, 1.008537, 1, 1, 1, 1, 1,
1.539678, -0.877771, 1.767836, 1, 1, 1, 1, 1,
1.545015, -0.02387289, 1.728456, 1, 1, 1, 1, 1,
1.547066, -1.799566, 3.095833, 1, 1, 1, 1, 1,
1.560415, -0.1030393, 1.582358, 1, 1, 1, 1, 1,
1.561731, -0.4419212, 0.5541095, 1, 1, 1, 1, 1,
1.564311, 0.1381448, 1.236632, 0, 0, 1, 1, 1,
1.604324, -1.329507, 1.387462, 1, 0, 0, 1, 1,
1.628371, 2.440418, 0.512068, 1, 0, 0, 1, 1,
1.658967, 0.8699957, 0.5656564, 1, 0, 0, 1, 1,
1.659579, -0.2745351, 0.4603679, 1, 0, 0, 1, 1,
1.666579, 1.520408, 1.754641, 1, 0, 0, 1, 1,
1.67813, 0.6437663, 2.188868, 0, 0, 0, 1, 1,
1.681565, 1.766547, 1.139742, 0, 0, 0, 1, 1,
1.681761, -0.776087, -0.1850919, 0, 0, 0, 1, 1,
1.690681, -0.7213907, 3.699376, 0, 0, 0, 1, 1,
1.692522, 0.2563012, 0.3955863, 0, 0, 0, 1, 1,
1.692976, 0.4846416, 1.250449, 0, 0, 0, 1, 1,
1.706265, 1.303446, 0.8602631, 0, 0, 0, 1, 1,
1.712259, -0.1661493, 2.60599, 1, 1, 1, 1, 1,
1.71364, -0.3126326, 1.469785, 1, 1, 1, 1, 1,
1.716622, -0.3746776, 1.381401, 1, 1, 1, 1, 1,
1.716883, 1.477612, -0.3203656, 1, 1, 1, 1, 1,
1.728199, -0.3380817, 3.643703, 1, 1, 1, 1, 1,
1.731009, 0.4694999, 2.430927, 1, 1, 1, 1, 1,
1.781228, -0.2052265, 1.660658, 1, 1, 1, 1, 1,
1.78282, -1.050346, 3.720166, 1, 1, 1, 1, 1,
1.789336, -0.3094737, 2.851019, 1, 1, 1, 1, 1,
1.79542, 0.5938194, 2.298397, 1, 1, 1, 1, 1,
1.819889, -0.602659, 2.545598, 1, 1, 1, 1, 1,
1.846384, -0.4639219, 1.656606, 1, 1, 1, 1, 1,
1.850396, -1.615866, 0.2446761, 1, 1, 1, 1, 1,
1.865411, -0.5659324, 1.188579, 1, 1, 1, 1, 1,
1.87168, -1.67807, 1.667251, 1, 1, 1, 1, 1,
1.892297, -0.948727, 3.226403, 0, 0, 1, 1, 1,
1.909457, -1.134695, 1.687831, 1, 0, 0, 1, 1,
1.975283, -0.2493783, 2.052254, 1, 0, 0, 1, 1,
2.004234, 0.06464367, 1.72726, 1, 0, 0, 1, 1,
2.015852, 0.8135146, 0.3706815, 1, 0, 0, 1, 1,
2.025195, 1.000309, -0.253798, 1, 0, 0, 1, 1,
2.123251, 0.4395236, 2.29668, 0, 0, 0, 1, 1,
2.128693, 1.4836, 0.4488416, 0, 0, 0, 1, 1,
2.136726, -1.566707, 4.630928, 0, 0, 0, 1, 1,
2.15361, -0.5426806, 1.266689, 0, 0, 0, 1, 1,
2.154059, -1.382398, -0.3792413, 0, 0, 0, 1, 1,
2.199825, -2.096325, 3.136038, 0, 0, 0, 1, 1,
2.245067, -1.022817, 1.628034, 0, 0, 0, 1, 1,
2.315311, 1.014221, 1.683424, 1, 1, 1, 1, 1,
2.41777, 0.2496195, 3.316314, 1, 1, 1, 1, 1,
2.56199, 1.091877, 1.428397, 1, 1, 1, 1, 1,
2.716527, -0.4161131, 2.226617, 1, 1, 1, 1, 1,
2.788149, 1.623299, 0.4439756, 1, 1, 1, 1, 1,
2.957024, 2.052672, 0.7471565, 1, 1, 1, 1, 1,
3.079159, -0.1919875, 2.166552, 1, 1, 1, 1, 1
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
var radius = 9.663881;
var distance = 33.94397;
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
mvMatrix.translate( -0.001928568, 0.04272461, 0.2486935 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94397);
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
