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
-3.286855, -1.474514, -2.200722, 1, 0, 0, 1,
-2.957083, -0.9387327, -0.3856975, 1, 0.007843138, 0, 1,
-2.87493, -2.400334, -3.581253, 1, 0.01176471, 0, 1,
-2.712555, -0.840256, -1.120115, 1, 0.01960784, 0, 1,
-2.613664, -1.19871, -2.446154, 1, 0.02352941, 0, 1,
-2.483531, 0.5006155, -0.9853582, 1, 0.03137255, 0, 1,
-2.457869, -0.7533859, -1.534077, 1, 0.03529412, 0, 1,
-2.437304, -0.4574347, -1.316704, 1, 0.04313726, 0, 1,
-2.421027, 0.664509, -1.661418, 1, 0.04705882, 0, 1,
-2.380979, -0.580349, -1.299243, 1, 0.05490196, 0, 1,
-2.362825, 1.315195, -0.1993267, 1, 0.05882353, 0, 1,
-2.270829, -2.164492, -1.621113, 1, 0.06666667, 0, 1,
-2.201181, -0.4370449, -3.828362, 1, 0.07058824, 0, 1,
-2.170697, 0.7754369, -1.089327, 1, 0.07843138, 0, 1,
-2.139169, -0.2649871, -2.321543, 1, 0.08235294, 0, 1,
-2.100245, 0.320905, -1.092064, 1, 0.09019608, 0, 1,
-2.072906, 0.3422106, -1.342558, 1, 0.09411765, 0, 1,
-2.070232, 0.1794728, -1.450287, 1, 0.1019608, 0, 1,
-2.049448, 0.54794, -2.468102, 1, 0.1098039, 0, 1,
-2.048012, -1.446703, -1.687836, 1, 0.1137255, 0, 1,
-2.031654, 0.4913973, -1.565224, 1, 0.1215686, 0, 1,
-2.027575, 0.23119, -1.493116, 1, 0.1254902, 0, 1,
-2.014006, 0.8199797, 0.5143971, 1, 0.1333333, 0, 1,
-2.013425, -0.3241866, -2.224645, 1, 0.1372549, 0, 1,
-1.999956, 0.3503951, -3.390477, 1, 0.145098, 0, 1,
-1.991111, -1.106621, -3.053104, 1, 0.1490196, 0, 1,
-1.969751, -1.327402, 0.3922693, 1, 0.1568628, 0, 1,
-1.961108, 0.618372, -1.698226, 1, 0.1607843, 0, 1,
-1.959425, 0.03422241, -2.602742, 1, 0.1686275, 0, 1,
-1.956235, -0.4795628, -1.712949, 1, 0.172549, 0, 1,
-1.89608, -1.102879, -2.624858, 1, 0.1803922, 0, 1,
-1.891907, 0.9032983, -3.608252, 1, 0.1843137, 0, 1,
-1.884952, 0.14218, -2.191968, 1, 0.1921569, 0, 1,
-1.865669, 0.1916682, -1.926675, 1, 0.1960784, 0, 1,
-1.864592, -1.280244, -2.122521, 1, 0.2039216, 0, 1,
-1.850368, -0.8535237, -3.07001, 1, 0.2117647, 0, 1,
-1.842994, -1.257076, -1.318927, 1, 0.2156863, 0, 1,
-1.839827, -1.255524, -3.421723, 1, 0.2235294, 0, 1,
-1.830651, -0.5245413, -1.93196, 1, 0.227451, 0, 1,
-1.803119, -1.288259, -0.923941, 1, 0.2352941, 0, 1,
-1.778391, 0.9870125, -0.4348729, 1, 0.2392157, 0, 1,
-1.750586, 0.4152303, -0.5345606, 1, 0.2470588, 0, 1,
-1.738954, -1.228602, -1.61162, 1, 0.2509804, 0, 1,
-1.736661, -0.01196581, -1.780875, 1, 0.2588235, 0, 1,
-1.723759, -0.3184537, -3.239293, 1, 0.2627451, 0, 1,
-1.722527, 0.5546344, -1.735434, 1, 0.2705882, 0, 1,
-1.702919, 0.2784681, -1.962463, 1, 0.2745098, 0, 1,
-1.69669, -1.566968, -1.90399, 1, 0.282353, 0, 1,
-1.688837, -0.3617095, -0.8337162, 1, 0.2862745, 0, 1,
-1.686596, 0.3233871, -0.6256776, 1, 0.2941177, 0, 1,
-1.678251, 1.39144, -2.64051, 1, 0.3019608, 0, 1,
-1.67435, 0.2617267, -1.271336, 1, 0.3058824, 0, 1,
-1.673372, 1.778376, -1.362828, 1, 0.3137255, 0, 1,
-1.672975, -0.3698504, -0.7550314, 1, 0.3176471, 0, 1,
-1.672658, -0.4290371, -3.078235, 1, 0.3254902, 0, 1,
-1.666108, 0.09975778, -2.296302, 1, 0.3294118, 0, 1,
-1.656161, 1.717963, -1.046704, 1, 0.3372549, 0, 1,
-1.654277, -1.305859, -1.755529, 1, 0.3411765, 0, 1,
-1.653171, 0.5250279, -1.581891, 1, 0.3490196, 0, 1,
-1.625642, 1.463807, -1.715542, 1, 0.3529412, 0, 1,
-1.618058, -1.211465, -3.471035, 1, 0.3607843, 0, 1,
-1.608057, -0.861444, -1.745738, 1, 0.3647059, 0, 1,
-1.601627, -1.432707, -5.952983, 1, 0.372549, 0, 1,
-1.600942, 0.02297452, -1.781362, 1, 0.3764706, 0, 1,
-1.595461, 1.070786, 0.0650415, 1, 0.3843137, 0, 1,
-1.577675, -0.9894909, -2.418169, 1, 0.3882353, 0, 1,
-1.57741, 1.763608, -0.6535149, 1, 0.3960784, 0, 1,
-1.57252, 0.7589086, 1.047089, 1, 0.4039216, 0, 1,
-1.561873, -0.240471, -1.087464, 1, 0.4078431, 0, 1,
-1.558386, -0.5044026, -3.031557, 1, 0.4156863, 0, 1,
-1.553517, -1.740384, -3.41323, 1, 0.4196078, 0, 1,
-1.550843, 1.054724, -0.2849121, 1, 0.427451, 0, 1,
-1.531031, 0.6971291, -0.8137276, 1, 0.4313726, 0, 1,
-1.528236, -0.2757116, -1.719568, 1, 0.4392157, 0, 1,
-1.511544, -0.3059888, -0.982236, 1, 0.4431373, 0, 1,
-1.509696, -1.024046, -2.056473, 1, 0.4509804, 0, 1,
-1.494938, 0.214671, -1.212236, 1, 0.454902, 0, 1,
-1.494102, 0.2035138, -1.424509, 1, 0.4627451, 0, 1,
-1.488405, -2.199497, -3.264498, 1, 0.4666667, 0, 1,
-1.481838, 1.141737, -0.9926142, 1, 0.4745098, 0, 1,
-1.477477, 1.089706, -0.777923, 1, 0.4784314, 0, 1,
-1.453114, 1.463896, -0.06103744, 1, 0.4862745, 0, 1,
-1.438834, -1.033967, -2.519542, 1, 0.4901961, 0, 1,
-1.433204, 0.1060803, -2.309251, 1, 0.4980392, 0, 1,
-1.430473, -0.8808877, -2.074548, 1, 0.5058824, 0, 1,
-1.428935, -1.088687, -1.447858, 1, 0.509804, 0, 1,
-1.420832, 0.5631849, -1.883671, 1, 0.5176471, 0, 1,
-1.419847, -1.093287, 0.3611962, 1, 0.5215687, 0, 1,
-1.416436, 0.1934044, 1.116561, 1, 0.5294118, 0, 1,
-1.413568, -0.9691401, -1.429527, 1, 0.5333334, 0, 1,
-1.412698, -1.869293, -3.035215, 1, 0.5411765, 0, 1,
-1.395875, -0.6607019, -0.6371894, 1, 0.5450981, 0, 1,
-1.391894, -1.115874, -1.130073, 1, 0.5529412, 0, 1,
-1.377931, 1.807237, -1.433967, 1, 0.5568628, 0, 1,
-1.374469, 0.3779498, -1.646641, 1, 0.5647059, 0, 1,
-1.374364, 1.898489, -1.388358, 1, 0.5686275, 0, 1,
-1.366427, 0.26535, -0.4574591, 1, 0.5764706, 0, 1,
-1.365717, 0.3558322, -2.050124, 1, 0.5803922, 0, 1,
-1.34124, -1.893648, -2.768414, 1, 0.5882353, 0, 1,
-1.340721, 0.1967133, -2.639439, 1, 0.5921569, 0, 1,
-1.333479, 0.06396502, -2.082204, 1, 0.6, 0, 1,
-1.324188, -0.2940166, -3.32226, 1, 0.6078432, 0, 1,
-1.319453, 0.7284956, -1.086735, 1, 0.6117647, 0, 1,
-1.314552, -2.049367, -2.345098, 1, 0.6196079, 0, 1,
-1.308937, 0.7855331, -1.375207, 1, 0.6235294, 0, 1,
-1.281776, -0.4014497, -2.859127, 1, 0.6313726, 0, 1,
-1.27708, 0.3799969, -0.7693359, 1, 0.6352941, 0, 1,
-1.27225, -0.135119, -0.7995369, 1, 0.6431373, 0, 1,
-1.253388, 0.6433361, -1.323062, 1, 0.6470588, 0, 1,
-1.252107, 0.005381028, -2.171771, 1, 0.654902, 0, 1,
-1.247341, 0.6410238, 0.8152417, 1, 0.6588235, 0, 1,
-1.23833, 1.898173, -0.4936981, 1, 0.6666667, 0, 1,
-1.235213, 0.02614591, -1.039087, 1, 0.6705883, 0, 1,
-1.230856, 1.01449, -1.457229, 1, 0.6784314, 0, 1,
-1.226294, 0.8933253, -1.899457, 1, 0.682353, 0, 1,
-1.224823, -0.4284829, -1.421073, 1, 0.6901961, 0, 1,
-1.211557, 0.2440439, -1.015402, 1, 0.6941177, 0, 1,
-1.19559, -0.899151, -1.17519, 1, 0.7019608, 0, 1,
-1.192337, 1.448733, 0.5522369, 1, 0.7098039, 0, 1,
-1.185527, -0.7256281, -1.882101, 1, 0.7137255, 0, 1,
-1.177284, -1.102248, -2.915666, 1, 0.7215686, 0, 1,
-1.176815, -0.1847635, -2.901296, 1, 0.7254902, 0, 1,
-1.173458, 1.914458, 1.700618, 1, 0.7333333, 0, 1,
-1.163226, -0.4956204, -2.338153, 1, 0.7372549, 0, 1,
-1.162192, -1.001498, -1.712652, 1, 0.7450981, 0, 1,
-1.150332, 0.1031666, -2.06103, 1, 0.7490196, 0, 1,
-1.144647, 1.352515, -0.7267428, 1, 0.7568628, 0, 1,
-1.141976, 0.4992646, -0.8148426, 1, 0.7607843, 0, 1,
-1.14192, -0.4918187, -1.738426, 1, 0.7686275, 0, 1,
-1.14135, -1.763392, -3.013522, 1, 0.772549, 0, 1,
-1.140167, 1.20278, -1.054605, 1, 0.7803922, 0, 1,
-1.134562, -0.02106439, -2.479449, 1, 0.7843137, 0, 1,
-1.12831, 0.1121196, -0.9759615, 1, 0.7921569, 0, 1,
-1.125736, 0.8981382, -0.1686633, 1, 0.7960784, 0, 1,
-1.123752, -1.687367, -0.5412689, 1, 0.8039216, 0, 1,
-1.118419, 1.083569, -1.122326, 1, 0.8117647, 0, 1,
-1.105736, -0.6196023, -1.728133, 1, 0.8156863, 0, 1,
-1.10229, 1.861677, -0.06005031, 1, 0.8235294, 0, 1,
-1.102175, -1.473778, -1.004437, 1, 0.827451, 0, 1,
-1.101956, 0.2165725, -1.479334, 1, 0.8352941, 0, 1,
-1.100947, -0.7494412, -2.457377, 1, 0.8392157, 0, 1,
-1.099095, -1.253404, -4.094947, 1, 0.8470588, 0, 1,
-1.095529, -0.2808779, -1.153889, 1, 0.8509804, 0, 1,
-1.087707, 1.179031, 1.221862, 1, 0.8588235, 0, 1,
-1.084765, 0.01024387, 0.6872688, 1, 0.8627451, 0, 1,
-1.083955, -0.03648987, -2.58775, 1, 0.8705882, 0, 1,
-1.08166, 1.738681, -0.8194729, 1, 0.8745098, 0, 1,
-1.080682, 0.3666044, -0.1979895, 1, 0.8823529, 0, 1,
-1.078958, -0.3900731, -2.935338, 1, 0.8862745, 0, 1,
-1.075627, -0.7279326, -2.196801, 1, 0.8941177, 0, 1,
-1.070426, -0.5660486, -2.914823, 1, 0.8980392, 0, 1,
-1.067081, 1.165254, -0.5434687, 1, 0.9058824, 0, 1,
-1.061602, -0.5799707, -3.312717, 1, 0.9137255, 0, 1,
-1.061407, -0.264123, -3.275441, 1, 0.9176471, 0, 1,
-1.059849, 0.7524999, -1.045473, 1, 0.9254902, 0, 1,
-1.057915, -0.858226, -3.544888, 1, 0.9294118, 0, 1,
-1.055724, -0.7836859, -1.581383, 1, 0.9372549, 0, 1,
-1.050179, 0.8696567, -0.5818473, 1, 0.9411765, 0, 1,
-1.045728, 1.089977, -0.6291587, 1, 0.9490196, 0, 1,
-1.044436, 0.5596231, -0.9765453, 1, 0.9529412, 0, 1,
-1.039907, -0.3914655, -3.386497, 1, 0.9607843, 0, 1,
-1.03732, 2.050785, -0.7629009, 1, 0.9647059, 0, 1,
-1.036992, 1.97112, -0.6121523, 1, 0.972549, 0, 1,
-1.034773, 0.07729609, -1.762556, 1, 0.9764706, 0, 1,
-1.028391, 0.5631034, -2.682345, 1, 0.9843137, 0, 1,
-1.02708, -0.3309611, -2.327277, 1, 0.9882353, 0, 1,
-1.022548, -0.7775334, -2.547967, 1, 0.9960784, 0, 1,
-1.013254, 0.7936562, -3.43053, 0.9960784, 1, 0, 1,
-1.011305, -1.078354, -1.101269, 0.9921569, 1, 0, 1,
-1.00609, -0.20771, -0.4350347, 0.9843137, 1, 0, 1,
-1.003426, 1.131572, -1.599953, 0.9803922, 1, 0, 1,
-1.001993, 0.1610845, -2.163733, 0.972549, 1, 0, 1,
-0.9980287, 0.09644099, -0.929814, 0.9686275, 1, 0, 1,
-0.9909779, -1.211897, -1.761802, 0.9607843, 1, 0, 1,
-0.990517, 0.1859964, -1.435985, 0.9568627, 1, 0, 1,
-0.9884958, -1.226755, -1.238779, 0.9490196, 1, 0, 1,
-0.9817287, 0.237438, -2.017611, 0.945098, 1, 0, 1,
-0.9791635, -0.3064223, -1.202936, 0.9372549, 1, 0, 1,
-0.9768825, 0.8137619, -0.3997255, 0.9333333, 1, 0, 1,
-0.9745256, -0.8684408, -1.297995, 0.9254902, 1, 0, 1,
-0.9719139, 1.051983, 0.828715, 0.9215686, 1, 0, 1,
-0.9709574, 0.8338455, -0.7642497, 0.9137255, 1, 0, 1,
-0.9603963, -0.05578991, -1.452818, 0.9098039, 1, 0, 1,
-0.9581829, 0.3202593, -1.284451, 0.9019608, 1, 0, 1,
-0.9564545, -1.591683, -3.11298, 0.8941177, 1, 0, 1,
-0.9547365, 0.3722957, -1.791248, 0.8901961, 1, 0, 1,
-0.9436135, 0.0151631, -1.580459, 0.8823529, 1, 0, 1,
-0.9421236, 0.7106264, -2.199865, 0.8784314, 1, 0, 1,
-0.93584, 0.4303705, -1.793705, 0.8705882, 1, 0, 1,
-0.9346112, 1.034275, 0.3081317, 0.8666667, 1, 0, 1,
-0.9294643, 0.5623987, -1.529, 0.8588235, 1, 0, 1,
-0.9255005, -0.1422964, -1.407282, 0.854902, 1, 0, 1,
-0.9251552, 0.03229076, -3.182818, 0.8470588, 1, 0, 1,
-0.9128515, -0.1545786, -0.4282054, 0.8431373, 1, 0, 1,
-0.9101638, -0.7726949, -2.10785, 0.8352941, 1, 0, 1,
-0.9101534, 0.3639727, 0.8679371, 0.8313726, 1, 0, 1,
-0.9086314, -2.043009, -2.634791, 0.8235294, 1, 0, 1,
-0.9019629, -0.06319796, -2.143473, 0.8196079, 1, 0, 1,
-0.9015395, 0.06137231, -4.132971, 0.8117647, 1, 0, 1,
-0.8971503, 0.168952, -3.103928, 0.8078431, 1, 0, 1,
-0.896346, -2.232738, -1.866381, 0.8, 1, 0, 1,
-0.8912755, -0.5016306, -1.008156, 0.7921569, 1, 0, 1,
-0.8819356, 0.9925554, 0.4129346, 0.7882353, 1, 0, 1,
-0.8799542, 0.9561155, 0.2900571, 0.7803922, 1, 0, 1,
-0.8780316, 0.3690797, -0.6144391, 0.7764706, 1, 0, 1,
-0.8733449, -0.2625705, -0.8531025, 0.7686275, 1, 0, 1,
-0.8680683, 0.8208369, -1.912963, 0.7647059, 1, 0, 1,
-0.8675518, 0.9896252, -0.2188549, 0.7568628, 1, 0, 1,
-0.864247, -0.4557566, -2.592628, 0.7529412, 1, 0, 1,
-0.8628008, -0.2428311, -3.086426, 0.7450981, 1, 0, 1,
-0.8510608, 0.9797395, 0.698949, 0.7411765, 1, 0, 1,
-0.8467737, -0.7099369, -2.168979, 0.7333333, 1, 0, 1,
-0.8457282, -0.5451548, -2.080458, 0.7294118, 1, 0, 1,
-0.8393979, -0.2287388, -2.325196, 0.7215686, 1, 0, 1,
-0.8375794, -0.3377393, -2.589525, 0.7176471, 1, 0, 1,
-0.8365399, 0.1029286, -2.668779, 0.7098039, 1, 0, 1,
-0.8359155, -0.9808162, -3.065179, 0.7058824, 1, 0, 1,
-0.8294172, -1.17975, -3.025999, 0.6980392, 1, 0, 1,
-0.8232897, -0.107093, -2.794675, 0.6901961, 1, 0, 1,
-0.8223143, 0.6495369, -0.7478878, 0.6862745, 1, 0, 1,
-0.8098284, 1.212839, 0.1574619, 0.6784314, 1, 0, 1,
-0.8067223, -0.6339065, -4.497857, 0.6745098, 1, 0, 1,
-0.806162, 1.145605, -0.8972034, 0.6666667, 1, 0, 1,
-0.8047008, 0.5235139, -0.02949674, 0.6627451, 1, 0, 1,
-0.8032339, 0.06841507, -0.9468343, 0.654902, 1, 0, 1,
-0.8024454, -0.5588002, -2.327635, 0.6509804, 1, 0, 1,
-0.800761, 0.4118559, -1.530824, 0.6431373, 1, 0, 1,
-0.7995476, -0.1311355, -1.060778, 0.6392157, 1, 0, 1,
-0.7994763, 0.2309375, -0.6369005, 0.6313726, 1, 0, 1,
-0.7975984, 0.002546016, -2.531741, 0.627451, 1, 0, 1,
-0.7897847, -0.6796993, -1.225751, 0.6196079, 1, 0, 1,
-0.7883757, 0.5377221, 0.434254, 0.6156863, 1, 0, 1,
-0.7871979, -0.2378898, -1.890848, 0.6078432, 1, 0, 1,
-0.7842923, 1.286636, 1.497038, 0.6039216, 1, 0, 1,
-0.7830207, 0.8804302, 0.6272181, 0.5960785, 1, 0, 1,
-0.7778454, 0.9988685, -1.207385, 0.5882353, 1, 0, 1,
-0.7759147, -1.036819, -3.576573, 0.5843138, 1, 0, 1,
-0.7724403, 0.1335951, -0.2793046, 0.5764706, 1, 0, 1,
-0.7712284, 1.0785, -1.581064, 0.572549, 1, 0, 1,
-0.7662097, -0.3588786, -1.989909, 0.5647059, 1, 0, 1,
-0.7568357, 0.4038289, -0.1815318, 0.5607843, 1, 0, 1,
-0.7555575, 2.022244, -0.08982781, 0.5529412, 1, 0, 1,
-0.7532298, -0.5042695, -2.748811, 0.5490196, 1, 0, 1,
-0.7497814, 0.1077996, -1.226498, 0.5411765, 1, 0, 1,
-0.7456379, -0.7218959, -2.660717, 0.5372549, 1, 0, 1,
-0.7412412, 0.4124905, -2.063015, 0.5294118, 1, 0, 1,
-0.7362334, 1.916742, -0.8009118, 0.5254902, 1, 0, 1,
-0.7334344, 0.124169, -0.7539027, 0.5176471, 1, 0, 1,
-0.7302338, 1.402545, -1.23636, 0.5137255, 1, 0, 1,
-0.7255117, 0.6958196, -0.4722513, 0.5058824, 1, 0, 1,
-0.7221345, 1.61753, -0.70266, 0.5019608, 1, 0, 1,
-0.7186176, 1.626685, -1.852123, 0.4941176, 1, 0, 1,
-0.7171267, -0.5676093, -3.558286, 0.4862745, 1, 0, 1,
-0.7016423, 0.1133133, -1.091885, 0.4823529, 1, 0, 1,
-0.6974254, -2.168623, -1.659802, 0.4745098, 1, 0, 1,
-0.6970008, 0.1287878, -0.8809659, 0.4705882, 1, 0, 1,
-0.6955569, 0.7637061, -0.6019041, 0.4627451, 1, 0, 1,
-0.6948637, 0.3650691, -1.385477, 0.4588235, 1, 0, 1,
-0.6908088, -0.5261224, -2.197871, 0.4509804, 1, 0, 1,
-0.6902406, 0.6939015, -0.436138, 0.4470588, 1, 0, 1,
-0.6895314, 1.23301, -1.786621, 0.4392157, 1, 0, 1,
-0.6880424, -0.8452976, -4.205173, 0.4352941, 1, 0, 1,
-0.6865713, -0.7474523, -3.538617, 0.427451, 1, 0, 1,
-0.6842906, -0.5194495, -2.261775, 0.4235294, 1, 0, 1,
-0.6831456, -0.6973396, -1.190349, 0.4156863, 1, 0, 1,
-0.6830828, -0.2127865, -2.045913, 0.4117647, 1, 0, 1,
-0.6816297, -0.603689, -1.18328, 0.4039216, 1, 0, 1,
-0.6813303, 1.200152, 1.89889, 0.3960784, 1, 0, 1,
-0.6706581, -0.5601012, -3.511584, 0.3921569, 1, 0, 1,
-0.6692938, 0.5255608, 0.2487928, 0.3843137, 1, 0, 1,
-0.6634437, 1.823339, -1.137217, 0.3803922, 1, 0, 1,
-0.6528453, -1.041092, -2.060613, 0.372549, 1, 0, 1,
-0.6516837, 0.5931543, -1.06798, 0.3686275, 1, 0, 1,
-0.6516259, -0.8887569, -3.255056, 0.3607843, 1, 0, 1,
-0.6512994, -0.5762733, -2.905874, 0.3568628, 1, 0, 1,
-0.6487839, 0.2184384, -2.84309, 0.3490196, 1, 0, 1,
-0.6424338, 0.3495452, -0.1443226, 0.345098, 1, 0, 1,
-0.6414077, -0.2876332, -2.588721, 0.3372549, 1, 0, 1,
-0.640735, 0.7600291, 0.831121, 0.3333333, 1, 0, 1,
-0.6311591, 1.119411, 0.240602, 0.3254902, 1, 0, 1,
-0.6280305, -0.6285096, -0.915457, 0.3215686, 1, 0, 1,
-0.6212893, 0.745686, -1.642898, 0.3137255, 1, 0, 1,
-0.6201719, -0.3013949, -3.135185, 0.3098039, 1, 0, 1,
-0.6153131, 0.8374128, -0.8955418, 0.3019608, 1, 0, 1,
-0.6142851, 1.444329, -0.6654148, 0.2941177, 1, 0, 1,
-0.6139687, 0.2852086, -1.862126, 0.2901961, 1, 0, 1,
-0.613759, 0.358022, -0.6538042, 0.282353, 1, 0, 1,
-0.6134463, -0.5617496, -2.339009, 0.2784314, 1, 0, 1,
-0.6128013, 0.02159028, -1.468299, 0.2705882, 1, 0, 1,
-0.6078773, 1.975291, 1.951039, 0.2666667, 1, 0, 1,
-0.6055506, 0.9330482, 0.247303, 0.2588235, 1, 0, 1,
-0.6053752, 0.182442, -1.514728, 0.254902, 1, 0, 1,
-0.5996075, -1.834974, -1.004984, 0.2470588, 1, 0, 1,
-0.5991024, 0.690038, -0.2499047, 0.2431373, 1, 0, 1,
-0.5961112, -0.1877246, -2.220426, 0.2352941, 1, 0, 1,
-0.5905291, -1.665246, -1.817932, 0.2313726, 1, 0, 1,
-0.5849993, -0.7230225, -2.39887, 0.2235294, 1, 0, 1,
-0.5740529, -0.5101619, -2.644299, 0.2196078, 1, 0, 1,
-0.5723456, -1.825338, -3.285722, 0.2117647, 1, 0, 1,
-0.5667278, 0.4395765, -1.152313, 0.2078431, 1, 0, 1,
-0.5633144, 0.2411346, -1.22823, 0.2, 1, 0, 1,
-0.5625171, -0.2060914, -1.483874, 0.1921569, 1, 0, 1,
-0.5616774, 1.109521, -0.9864373, 0.1882353, 1, 0, 1,
-0.5570462, -0.05517017, -1.476295, 0.1803922, 1, 0, 1,
-0.5525536, -1.621925, -3.875469, 0.1764706, 1, 0, 1,
-0.5453966, -0.7017136, -2.793939, 0.1686275, 1, 0, 1,
-0.5436498, -0.7033466, -4.04561, 0.1647059, 1, 0, 1,
-0.5406249, 1.940802, 0.04096979, 0.1568628, 1, 0, 1,
-0.5379251, -0.5836846, -2.070127, 0.1529412, 1, 0, 1,
-0.5371338, -0.9713134, -4.615688, 0.145098, 1, 0, 1,
-0.5360571, -0.35592, -0.7952681, 0.1411765, 1, 0, 1,
-0.5359943, 0.09045021, -1.955347, 0.1333333, 1, 0, 1,
-0.5320618, 0.01111884, -0.5878876, 0.1294118, 1, 0, 1,
-0.5270789, -0.1166391, -3.851036, 0.1215686, 1, 0, 1,
-0.5211186, 0.9377736, -0.2849511, 0.1176471, 1, 0, 1,
-0.5190135, -0.3827594, -2.824235, 0.1098039, 1, 0, 1,
-0.5182223, 0.1812488, -2.609608, 0.1058824, 1, 0, 1,
-0.5179366, -0.5802371, -3.558443, 0.09803922, 1, 0, 1,
-0.5169816, 1.155192, 0.2270624, 0.09019608, 1, 0, 1,
-0.5168374, 1.210332, 0.3520986, 0.08627451, 1, 0, 1,
-0.5168315, 0.8136388, -1.671659, 0.07843138, 1, 0, 1,
-0.5112405, 1.528846, 0.4314736, 0.07450981, 1, 0, 1,
-0.5110091, 0.265808, 0.2215377, 0.06666667, 1, 0, 1,
-0.5086079, 1.449676, -0.8790897, 0.0627451, 1, 0, 1,
-0.4984162, 0.9816148, 0.6975355, 0.05490196, 1, 0, 1,
-0.4975674, 0.3046583, -0.9004801, 0.05098039, 1, 0, 1,
-0.4947517, -2.523916, -2.522447, 0.04313726, 1, 0, 1,
-0.4916767, -2.979138, -2.460235, 0.03921569, 1, 0, 1,
-0.4901742, 0.7952133, -0.313614, 0.03137255, 1, 0, 1,
-0.485515, -0.5254849, -2.498523, 0.02745098, 1, 0, 1,
-0.4804075, 0.08133199, -2.205989, 0.01960784, 1, 0, 1,
-0.4795567, -0.9902996, -2.189601, 0.01568628, 1, 0, 1,
-0.476255, -0.7673531, -2.87407, 0.007843138, 1, 0, 1,
-0.4752115, -2.450495, -3.918741, 0.003921569, 1, 0, 1,
-0.4747605, -0.4863148, -5.760378, 0, 1, 0.003921569, 1,
-0.4684543, 0.6910498, -0.7250085, 0, 1, 0.01176471, 1,
-0.462626, 0.6101266, -2.8729, 0, 1, 0.01568628, 1,
-0.4602967, -0.6314486, -2.304229, 0, 1, 0.02352941, 1,
-0.4528638, 1.622257, -0.4783867, 0, 1, 0.02745098, 1,
-0.4502396, -0.07542539, -1.55287, 0, 1, 0.03529412, 1,
-0.4485488, 0.4640322, -0.3820548, 0, 1, 0.03921569, 1,
-0.4480135, 0.4655107, -1.594706, 0, 1, 0.04705882, 1,
-0.4390064, -1.456396, -1.996007, 0, 1, 0.05098039, 1,
-0.4165974, -1.736256, -3.506179, 0, 1, 0.05882353, 1,
-0.414375, 0.06946765, 0.2400614, 0, 1, 0.0627451, 1,
-0.4100558, 2.316178, -1.498483, 0, 1, 0.07058824, 1,
-0.4100203, 0.7946142, 0.3274747, 0, 1, 0.07450981, 1,
-0.4082873, 0.7797849, -0.2421869, 0, 1, 0.08235294, 1,
-0.401923, 0.3690962, -1.420318, 0, 1, 0.08627451, 1,
-0.3981931, -1.039899, -3.38151, 0, 1, 0.09411765, 1,
-0.3939727, 1.521054, -0.9241419, 0, 1, 0.1019608, 1,
-0.3920548, 0.3419304, -0.5196797, 0, 1, 0.1058824, 1,
-0.3901051, 0.09631277, -0.1725014, 0, 1, 0.1137255, 1,
-0.3884558, -0.662, -3.035067, 0, 1, 0.1176471, 1,
-0.3869605, 0.0004111496, -0.3183758, 0, 1, 0.1254902, 1,
-0.3849447, -0.457461, -2.543754, 0, 1, 0.1294118, 1,
-0.3833491, 1.957819, 0.5415133, 0, 1, 0.1372549, 1,
-0.3786455, 0.9062377, 1.134046, 0, 1, 0.1411765, 1,
-0.3770477, -0.5990815, -1.267919, 0, 1, 0.1490196, 1,
-0.3724988, -2.290337, -3.361424, 0, 1, 0.1529412, 1,
-0.3651679, 1.639117, -0.3810602, 0, 1, 0.1607843, 1,
-0.3648072, 1.91634, 1.110445, 0, 1, 0.1647059, 1,
-0.358115, 0.3709642, 0.5831416, 0, 1, 0.172549, 1,
-0.3567776, -0.4572344, -1.938613, 0, 1, 0.1764706, 1,
-0.3542463, -0.5752484, -2.75121, 0, 1, 0.1843137, 1,
-0.3526516, 0.1140257, -1.238569, 0, 1, 0.1882353, 1,
-0.35048, 0.7368766, -1.437335, 0, 1, 0.1960784, 1,
-0.3494643, 0.310723, -1.720775, 0, 1, 0.2039216, 1,
-0.3475424, -0.8535853, -4.116005, 0, 1, 0.2078431, 1,
-0.3436842, -0.005550208, -2.238214, 0, 1, 0.2156863, 1,
-0.3416375, 2.492735, -0.02416916, 0, 1, 0.2196078, 1,
-0.340097, 0.313573, -2.470916, 0, 1, 0.227451, 1,
-0.3371049, -0.5085219, -3.899333, 0, 1, 0.2313726, 1,
-0.3333547, 0.4231424, -1.465792, 0, 1, 0.2392157, 1,
-0.3330156, 0.6744944, -0.8458792, 0, 1, 0.2431373, 1,
-0.3324037, 1.174122, -1.38341, 0, 1, 0.2509804, 1,
-0.3296604, 0.0003117456, -1.968345, 0, 1, 0.254902, 1,
-0.3278603, -0.4134387, -2.827797, 0, 1, 0.2627451, 1,
-0.3272853, 1.021563, -1.558788, 0, 1, 0.2666667, 1,
-0.327068, 0.232148, -2.523398, 0, 1, 0.2745098, 1,
-0.3270208, -2.094493, -3.58485, 0, 1, 0.2784314, 1,
-0.3257172, 1.242994, 0.04046306, 0, 1, 0.2862745, 1,
-0.319759, -1.137596, -2.931448, 0, 1, 0.2901961, 1,
-0.3110233, 2.007866, 0.2687197, 0, 1, 0.2980392, 1,
-0.308423, -0.3182003, -2.085928, 0, 1, 0.3058824, 1,
-0.302395, 0.7084647, -1.042631, 0, 1, 0.3098039, 1,
-0.3016334, -0.1318296, -3.418885, 0, 1, 0.3176471, 1,
-0.2992359, -0.3094957, -2.275283, 0, 1, 0.3215686, 1,
-0.298676, -1.61798, -1.930285, 0, 1, 0.3294118, 1,
-0.2924675, 0.07652294, 0.01085613, 0, 1, 0.3333333, 1,
-0.2857732, -1.78199, -3.753563, 0, 1, 0.3411765, 1,
-0.2837422, -0.5107316, -2.901096, 0, 1, 0.345098, 1,
-0.2812111, 0.1240842, -1.281318, 0, 1, 0.3529412, 1,
-0.2800157, -1.104156, -3.129873, 0, 1, 0.3568628, 1,
-0.2754569, -0.2786229, -1.254651, 0, 1, 0.3647059, 1,
-0.268792, -0.4384449, -2.197989, 0, 1, 0.3686275, 1,
-0.2634178, 0.07899612, -1.445593, 0, 1, 0.3764706, 1,
-0.2624699, -0.7402396, -3.95008, 0, 1, 0.3803922, 1,
-0.2600383, 1.136017, -0.1944682, 0, 1, 0.3882353, 1,
-0.2573388, 0.5425637, 1.254514, 0, 1, 0.3921569, 1,
-0.2562962, -1.860247, -1.694533, 0, 1, 0.4, 1,
-0.2552948, -0.8307146, -2.33546, 0, 1, 0.4078431, 1,
-0.2435502, 1.178623, 1.341012, 0, 1, 0.4117647, 1,
-0.2393308, -0.5585625, -3.733268, 0, 1, 0.4196078, 1,
-0.2390543, -1.512379, -2.58365, 0, 1, 0.4235294, 1,
-0.2388156, -0.5162916, -1.847332, 0, 1, 0.4313726, 1,
-0.2369828, -0.4284072, -3.581268, 0, 1, 0.4352941, 1,
-0.2363243, 0.4909444, -0.2143902, 0, 1, 0.4431373, 1,
-0.2327494, 0.5319772, -0.2750812, 0, 1, 0.4470588, 1,
-0.2315735, -1.748378, -2.870939, 0, 1, 0.454902, 1,
-0.2312486, -0.534035, -2.09206, 0, 1, 0.4588235, 1,
-0.2269652, 0.05439127, -1.702966, 0, 1, 0.4666667, 1,
-0.2261988, 0.6126122, 0.04907871, 0, 1, 0.4705882, 1,
-0.2240751, 1.558527, -0.7540902, 0, 1, 0.4784314, 1,
-0.2210739, -0.4244022, -2.220019, 0, 1, 0.4823529, 1,
-0.2156991, 0.3177885, -0.2727754, 0, 1, 0.4901961, 1,
-0.2134769, 0.3496394, 0.1105104, 0, 1, 0.4941176, 1,
-0.209547, -1.143585, -3.003051, 0, 1, 0.5019608, 1,
-0.2018512, -0.0493193, -1.209678, 0, 1, 0.509804, 1,
-0.1877818, 0.3881819, -0.5342618, 0, 1, 0.5137255, 1,
-0.1812953, -1.433229, -3.839444, 0, 1, 0.5215687, 1,
-0.1781915, -0.7070493, -1.254429, 0, 1, 0.5254902, 1,
-0.1709509, 1.368743, 1.396888, 0, 1, 0.5333334, 1,
-0.1694434, 2.046981, 2.045945, 0, 1, 0.5372549, 1,
-0.1674776, 1.760878, 0.2398931, 0, 1, 0.5450981, 1,
-0.1597693, 1.710757, 0.9319081, 0, 1, 0.5490196, 1,
-0.1554661, 2.087552, 0.07914011, 0, 1, 0.5568628, 1,
-0.1550038, 1.070042, -1.704113, 0, 1, 0.5607843, 1,
-0.1467583, -0.1498453, -3.069425, 0, 1, 0.5686275, 1,
-0.1436581, -0.2814518, -2.367838, 0, 1, 0.572549, 1,
-0.143648, 0.05736708, -1.221061, 0, 1, 0.5803922, 1,
-0.1404017, 1.193197, 0.9795586, 0, 1, 0.5843138, 1,
-0.1361656, 1.45656, 0.8858552, 0, 1, 0.5921569, 1,
-0.135296, 0.5682548, -3.683008, 0, 1, 0.5960785, 1,
-0.1326732, -0.5496593, -6.098717, 0, 1, 0.6039216, 1,
-0.1313062, 0.5815302, -1.375315, 0, 1, 0.6117647, 1,
-0.1312106, 0.3382513, -1.60589, 0, 1, 0.6156863, 1,
-0.1288456, -1.052925, -2.096095, 0, 1, 0.6235294, 1,
-0.1242338, -1.023192, -4.287516, 0, 1, 0.627451, 1,
-0.1217342, 0.6578942, -0.5806651, 0, 1, 0.6352941, 1,
-0.1191683, 0.4407421, -0.6176342, 0, 1, 0.6392157, 1,
-0.1188669, 1.929938, 2.181907, 0, 1, 0.6470588, 1,
-0.1188508, -0.4034438, -5.302885, 0, 1, 0.6509804, 1,
-0.1188476, 0.2118546, -0.864427, 0, 1, 0.6588235, 1,
-0.1122895, -1.028988, -1.806312, 0, 1, 0.6627451, 1,
-0.1008907, -0.6251551, -1.564798, 0, 1, 0.6705883, 1,
-0.1005647, 0.9062309, 0.1162034, 0, 1, 0.6745098, 1,
-0.0988906, 1.302285, -1.526424, 0, 1, 0.682353, 1,
-0.09797651, 1.165628, -1.121738, 0, 1, 0.6862745, 1,
-0.09476837, 0.9576101, 0.7765959, 0, 1, 0.6941177, 1,
-0.09455215, -1.519665, -2.389345, 0, 1, 0.7019608, 1,
-0.09305075, 0.7341483, -1.014797, 0, 1, 0.7058824, 1,
-0.09087729, -0.2959228, -4.127714, 0, 1, 0.7137255, 1,
-0.08498843, 1.084686, -0.3716189, 0, 1, 0.7176471, 1,
-0.08456893, -0.2041428, -1.5812, 0, 1, 0.7254902, 1,
-0.08407332, -0.1579868, -3.012723, 0, 1, 0.7294118, 1,
-0.08271611, 0.3577486, 0.3785618, 0, 1, 0.7372549, 1,
-0.07881352, -1.441098, -4.204847, 0, 1, 0.7411765, 1,
-0.07631513, -0.7159084, -2.114807, 0, 1, 0.7490196, 1,
-0.0757111, -0.1305051, -2.68303, 0, 1, 0.7529412, 1,
-0.07417374, 1.100452, 0.7101164, 0, 1, 0.7607843, 1,
-0.07097521, 1.31473, -0.2848319, 0, 1, 0.7647059, 1,
-0.06667168, 0.3448605, -0.2294993, 0, 1, 0.772549, 1,
-0.06226593, 0.2518971, 0.6298706, 0, 1, 0.7764706, 1,
-0.06197336, 0.3042688, 0.06790335, 0, 1, 0.7843137, 1,
-0.05914839, -1.777244, -2.399369, 0, 1, 0.7882353, 1,
-0.05447575, 0.6193078, -0.6072383, 0, 1, 0.7960784, 1,
-0.0496528, -0.5581881, -2.802418, 0, 1, 0.8039216, 1,
-0.04531109, 2.223557, -0.09862321, 0, 1, 0.8078431, 1,
-0.04507801, -0.5387036, -3.656447, 0, 1, 0.8156863, 1,
-0.04476998, -1.060421, -3.338483, 0, 1, 0.8196079, 1,
-0.04240536, 0.2820089, 0.2618907, 0, 1, 0.827451, 1,
-0.03571116, -1.68594, -2.329928, 0, 1, 0.8313726, 1,
-0.03433337, 0.6199067, -0.6294106, 0, 1, 0.8392157, 1,
-0.0338744, 0.9188804, -0.8183628, 0, 1, 0.8431373, 1,
-0.03145983, -1.224703, -3.835362, 0, 1, 0.8509804, 1,
-0.02761409, 0.493533, -0.3451381, 0, 1, 0.854902, 1,
-0.02553727, 1.732749, -0.2659994, 0, 1, 0.8627451, 1,
-0.02488543, 1.084041, 2.320443, 0, 1, 0.8666667, 1,
-0.02467855, -1.065215, -2.834046, 0, 1, 0.8745098, 1,
-0.01753659, -0.419262, -2.638161, 0, 1, 0.8784314, 1,
-0.01566804, -1.546121, -3.335243, 0, 1, 0.8862745, 1,
-0.01322392, 1.46197, -0.04446658, 0, 1, 0.8901961, 1,
-0.01135822, 1.121223, 0.4179764, 0, 1, 0.8980392, 1,
-0.006290644, -1.470139, -3.10581, 0, 1, 0.9058824, 1,
-0.005414951, -0.3729833, -4.498221, 0, 1, 0.9098039, 1,
-0.004292117, -1.495531, -4.192705, 0, 1, 0.9176471, 1,
-0.002719207, -0.02185871, -4.219383, 0, 1, 0.9215686, 1,
0.0002299159, 0.02344813, 0.208739, 0, 1, 0.9294118, 1,
0.004833275, -0.5570601, 2.931713, 0, 1, 0.9333333, 1,
0.005789043, -1.311043, 2.8794, 0, 1, 0.9411765, 1,
0.006313393, -0.3969266, 2.387754, 0, 1, 0.945098, 1,
0.01236717, -1.243056, 3.555298, 0, 1, 0.9529412, 1,
0.01562661, 0.01123913, 0.1037629, 0, 1, 0.9568627, 1,
0.01619704, -0.7715672, 3.246534, 0, 1, 0.9647059, 1,
0.01636788, -0.8448152, 4.599787, 0, 1, 0.9686275, 1,
0.01870264, 1.13494, 0.02274626, 0, 1, 0.9764706, 1,
0.01873858, 0.8881463, -0.5162307, 0, 1, 0.9803922, 1,
0.01959798, -1.372861, 2.404127, 0, 1, 0.9882353, 1,
0.0198834, -0.0524216, 1.031311, 0, 1, 0.9921569, 1,
0.02262055, -0.02475243, 1.856661, 0, 1, 1, 1,
0.02295881, 1.217417, 0.4615646, 0, 0.9921569, 1, 1,
0.02343892, -0.6684488, 3.39091, 0, 0.9882353, 1, 1,
0.02641774, -1.672095, 2.919531, 0, 0.9803922, 1, 1,
0.02741011, 0.1351908, -1.755041, 0, 0.9764706, 1, 1,
0.03332813, -0.58394, 3.598309, 0, 0.9686275, 1, 1,
0.03715378, -0.2562067, 1.545416, 0, 0.9647059, 1, 1,
0.0383806, 0.2768835, 1.297074, 0, 0.9568627, 1, 1,
0.04026373, -1.919805, 2.134138, 0, 0.9529412, 1, 1,
0.04117296, 1.2227, -0.9314538, 0, 0.945098, 1, 1,
0.04475768, -1.034609, 2.941277, 0, 0.9411765, 1, 1,
0.04546447, 0.2536573, 0.2210284, 0, 0.9333333, 1, 1,
0.04711496, 1.585595, 0.4167309, 0, 0.9294118, 1, 1,
0.04777434, -0.3611777, 3.399943, 0, 0.9215686, 1, 1,
0.04803615, -0.3573444, 5.076882, 0, 0.9176471, 1, 1,
0.04892534, 0.5603167, 2.184622, 0, 0.9098039, 1, 1,
0.05799859, -0.3250769, 1.173308, 0, 0.9058824, 1, 1,
0.05850231, -0.7536656, 1.692931, 0, 0.8980392, 1, 1,
0.06037358, 1.386872, -0.03702287, 0, 0.8901961, 1, 1,
0.06158211, -0.4845385, 1.179281, 0, 0.8862745, 1, 1,
0.06234568, 0.5671799, 0.6532809, 0, 0.8784314, 1, 1,
0.06382446, -0.8151633, 1.80569, 0, 0.8745098, 1, 1,
0.06468422, -1.933325, 1.604398, 0, 0.8666667, 1, 1,
0.06472324, -0.6854783, 3.033496, 0, 0.8627451, 1, 1,
0.06476517, -1.856735, 2.647238, 0, 0.854902, 1, 1,
0.07186001, 0.1983484, 0.2098102, 0, 0.8509804, 1, 1,
0.07613175, -0.4756803, 1.994792, 0, 0.8431373, 1, 1,
0.07618597, 2.084708, 1.019331, 0, 0.8392157, 1, 1,
0.07890373, 0.8900938, -0.5079303, 0, 0.8313726, 1, 1,
0.0803358, -0.1941499, 4.019561, 0, 0.827451, 1, 1,
0.08126792, -0.1814966, 2.076731, 0, 0.8196079, 1, 1,
0.08171203, 1.250484, 1.222738, 0, 0.8156863, 1, 1,
0.08248015, -1.022654, 3.436997, 0, 0.8078431, 1, 1,
0.08427253, -0.5002536, 3.175107, 0, 0.8039216, 1, 1,
0.084635, -0.3790361, 3.290121, 0, 0.7960784, 1, 1,
0.08656135, 0.4039356, -0.5531261, 0, 0.7882353, 1, 1,
0.08770541, 1.524319, 0.216957, 0, 0.7843137, 1, 1,
0.09833834, -0.5867948, 2.373693, 0, 0.7764706, 1, 1,
0.1052474, -0.351866, 2.35067, 0, 0.772549, 1, 1,
0.1061055, 0.5078891, 0.1016903, 0, 0.7647059, 1, 1,
0.1076341, 1.671991, -1.532071, 0, 0.7607843, 1, 1,
0.111097, 0.8544472, -0.02457979, 0, 0.7529412, 1, 1,
0.1119042, 0.5000996, 2.595888, 0, 0.7490196, 1, 1,
0.1152209, -0.8729758, 2.430913, 0, 0.7411765, 1, 1,
0.1154405, -0.03379493, 1.477785, 0, 0.7372549, 1, 1,
0.1191165, 0.03797752, 1.095095, 0, 0.7294118, 1, 1,
0.1215522, -0.303561, 1.152922, 0, 0.7254902, 1, 1,
0.1222537, -1.296038, 2.740367, 0, 0.7176471, 1, 1,
0.1248159, -0.681727, 3.251363, 0, 0.7137255, 1, 1,
0.1273941, -0.8457239, 2.304126, 0, 0.7058824, 1, 1,
0.1285498, 0.7294503, -0.0704872, 0, 0.6980392, 1, 1,
0.1296564, 1.487923, 1.996086, 0, 0.6941177, 1, 1,
0.1361061, -0.9118597, 2.331063, 0, 0.6862745, 1, 1,
0.1431284, 0.5761239, 0.639842, 0, 0.682353, 1, 1,
0.1529071, -0.855007, 3.709255, 0, 0.6745098, 1, 1,
0.1542921, -0.06443132, 2.785511, 0, 0.6705883, 1, 1,
0.1544343, -0.7159408, 2.47629, 0, 0.6627451, 1, 1,
0.15588, 0.3120573, 1.50913, 0, 0.6588235, 1, 1,
0.1566983, -0.4346434, 2.584376, 0, 0.6509804, 1, 1,
0.1591176, 0.4558204, 1.620114, 0, 0.6470588, 1, 1,
0.1696837, 2.255011, -0.282454, 0, 0.6392157, 1, 1,
0.1718279, 0.6232564, -2.355478, 0, 0.6352941, 1, 1,
0.1788081, 0.5703098, 1.15949, 0, 0.627451, 1, 1,
0.1833308, 0.6797624, 0.4691823, 0, 0.6235294, 1, 1,
0.1837718, 1.318184, -0.9113974, 0, 0.6156863, 1, 1,
0.1874159, -0.8945065, 2.99085, 0, 0.6117647, 1, 1,
0.1882599, 1.44069, -0.4043203, 0, 0.6039216, 1, 1,
0.1902243, 0.8112867, -1.405631, 0, 0.5960785, 1, 1,
0.19207, 0.005923706, 0.2376584, 0, 0.5921569, 1, 1,
0.1947578, -0.0533984, 2.252235, 0, 0.5843138, 1, 1,
0.1978803, 1.030989, 1.950648, 0, 0.5803922, 1, 1,
0.2026542, 1.554282, 0.157272, 0, 0.572549, 1, 1,
0.2032343, -0.4808905, 2.126852, 0, 0.5686275, 1, 1,
0.2064766, -0.7064285, 4.607564, 0, 0.5607843, 1, 1,
0.2077588, 0.1800766, 1.713885, 0, 0.5568628, 1, 1,
0.2109793, -1.011136, 2.397947, 0, 0.5490196, 1, 1,
0.2109902, -0.4434385, 2.710423, 0, 0.5450981, 1, 1,
0.2116479, 1.183629, 0.7685245, 0, 0.5372549, 1, 1,
0.2193782, -0.7063938, 5.012343, 0, 0.5333334, 1, 1,
0.2234708, 0.7915879, -0.07426345, 0, 0.5254902, 1, 1,
0.2241267, 1.208198, 0.1443224, 0, 0.5215687, 1, 1,
0.2254746, 0.1717452, 2.134551, 0, 0.5137255, 1, 1,
0.2263808, -0.2175281, 1.399244, 0, 0.509804, 1, 1,
0.2300842, -0.8721541, 1.386494, 0, 0.5019608, 1, 1,
0.2307512, -0.8597934, 2.259869, 0, 0.4941176, 1, 1,
0.2313307, -0.4226545, 3.510632, 0, 0.4901961, 1, 1,
0.2319205, -0.2715827, 2.429499, 0, 0.4823529, 1, 1,
0.2320183, 0.1620973, 1.594092, 0, 0.4784314, 1, 1,
0.2346428, 0.9788001, 1.102003, 0, 0.4705882, 1, 1,
0.234863, 1.059317, -0.9867166, 0, 0.4666667, 1, 1,
0.2363402, 0.4383637, 0.6770937, 0, 0.4588235, 1, 1,
0.2401018, -2.372183, 2.893281, 0, 0.454902, 1, 1,
0.2401569, 0.9968454, 0.6858584, 0, 0.4470588, 1, 1,
0.2460381, 0.9939546, 0.442785, 0, 0.4431373, 1, 1,
0.2474969, 1.457613, 0.7500958, 0, 0.4352941, 1, 1,
0.2496671, -1.382474, 3.597942, 0, 0.4313726, 1, 1,
0.2521391, 0.5765104, 1.08579, 0, 0.4235294, 1, 1,
0.2535441, 0.9481474, 0.9881692, 0, 0.4196078, 1, 1,
0.2551424, -3.105044, 4.06608, 0, 0.4117647, 1, 1,
0.2577309, -0.7275007, 2.125885, 0, 0.4078431, 1, 1,
0.2592546, -0.3586851, 2.852333, 0, 0.4, 1, 1,
0.2631868, 0.5246212, 0.03436808, 0, 0.3921569, 1, 1,
0.2668059, -1.370661, 3.19866, 0, 0.3882353, 1, 1,
0.2681674, -0.278241, 1.86275, 0, 0.3803922, 1, 1,
0.26979, 1.540117, 1.473652, 0, 0.3764706, 1, 1,
0.2702703, 0.5157105, -0.66281, 0, 0.3686275, 1, 1,
0.270832, -1.308447, 3.058717, 0, 0.3647059, 1, 1,
0.2725367, -0.115937, 2.561226, 0, 0.3568628, 1, 1,
0.2731093, -0.8977342, 1.636195, 0, 0.3529412, 1, 1,
0.2736498, -0.2811214, 3.100677, 0, 0.345098, 1, 1,
0.2757956, 1.631003, -0.03818314, 0, 0.3411765, 1, 1,
0.2831469, 0.4994662, 1.134116, 0, 0.3333333, 1, 1,
0.2832327, 0.9872279, 1.258922, 0, 0.3294118, 1, 1,
0.2852305, -0.1628263, 2.575081, 0, 0.3215686, 1, 1,
0.2865439, -0.04281787, 2.270576, 0, 0.3176471, 1, 1,
0.2926981, -1.649983, 3.462045, 0, 0.3098039, 1, 1,
0.2943598, -1.859195, 3.107682, 0, 0.3058824, 1, 1,
0.2950037, 1.471283, -0.005719494, 0, 0.2980392, 1, 1,
0.2977162, -0.2842187, 1.581561, 0, 0.2901961, 1, 1,
0.298809, -1.446614, 2.056961, 0, 0.2862745, 1, 1,
0.301519, -1.861495, 2.383274, 0, 0.2784314, 1, 1,
0.3017865, -0.6114086, 2.939102, 0, 0.2745098, 1, 1,
0.3077221, -0.5162089, 2.428379, 0, 0.2666667, 1, 1,
0.3086131, 0.5063961, 2.028828, 0, 0.2627451, 1, 1,
0.3176857, -0.3660029, 2.400255, 0, 0.254902, 1, 1,
0.3263796, -1.123947, 2.789327, 0, 0.2509804, 1, 1,
0.3318167, 0.5287762, 1.693163, 0, 0.2431373, 1, 1,
0.3362304, 1.406181, -0.5259449, 0, 0.2392157, 1, 1,
0.3363958, -0.1369417, 2.200666, 0, 0.2313726, 1, 1,
0.3387492, -1.45764, 1.497054, 0, 0.227451, 1, 1,
0.3436847, -0.06612063, 1.640545, 0, 0.2196078, 1, 1,
0.3456774, -0.3227601, 2.205992, 0, 0.2156863, 1, 1,
0.3457105, -1.649355, 2.046941, 0, 0.2078431, 1, 1,
0.350314, -1.358444, 3.077702, 0, 0.2039216, 1, 1,
0.351027, 0.09620153, 1.291278, 0, 0.1960784, 1, 1,
0.3531349, -1.616769, 4.239074, 0, 0.1882353, 1, 1,
0.3581206, 0.4081082, 1.489616, 0, 0.1843137, 1, 1,
0.3604706, 1.118482, 0.6879897, 0, 0.1764706, 1, 1,
0.3670504, 1.414646, -0.07921779, 0, 0.172549, 1, 1,
0.367748, -0.9409043, 1.983559, 0, 0.1647059, 1, 1,
0.3689634, -0.1346113, 1.682944, 0, 0.1607843, 1, 1,
0.3720828, -0.07173619, 1.875829, 0, 0.1529412, 1, 1,
0.3798313, 0.8710063, -0.2161414, 0, 0.1490196, 1, 1,
0.3814428, -0.4661687, 3.301001, 0, 0.1411765, 1, 1,
0.3863918, -0.2665038, 1.154464, 0, 0.1372549, 1, 1,
0.3874601, 0.2733255, 1.995718, 0, 0.1294118, 1, 1,
0.3891219, -0.8738779, 4.292369, 0, 0.1254902, 1, 1,
0.3893905, -0.4755896, 1.578403, 0, 0.1176471, 1, 1,
0.3898658, -1.1288, 3.470879, 0, 0.1137255, 1, 1,
0.3927433, 0.3256867, 1.046362, 0, 0.1058824, 1, 1,
0.3957975, -0.4366277, 2.529034, 0, 0.09803922, 1, 1,
0.39725, -1.376487, 2.500506, 0, 0.09411765, 1, 1,
0.4016026, 1.737035, 0.1895652, 0, 0.08627451, 1, 1,
0.4039084, -1.740204, 4.99756, 0, 0.08235294, 1, 1,
0.4042746, 0.3180576, 1.340829, 0, 0.07450981, 1, 1,
0.407929, 0.5310076, 0.06947713, 0, 0.07058824, 1, 1,
0.4127394, -1.299077, 4.401023, 0, 0.0627451, 1, 1,
0.4188763, 2.62211, 0.2643539, 0, 0.05882353, 1, 1,
0.4207973, -1.951513, 3.21514, 0, 0.05098039, 1, 1,
0.4222314, -2.318841, 2.426723, 0, 0.04705882, 1, 1,
0.4264839, 0.6809251, 1.332568, 0, 0.03921569, 1, 1,
0.4301403, 1.708535, 0.01952169, 0, 0.03529412, 1, 1,
0.4311703, -2.031135, 4.569408, 0, 0.02745098, 1, 1,
0.4367375, 0.3215806, -1.440199, 0, 0.02352941, 1, 1,
0.4368366, 1.68861, 0.4823947, 0, 0.01568628, 1, 1,
0.4393995, -0.09843424, 2.225124, 0, 0.01176471, 1, 1,
0.4419932, 0.1125001, 0.2993371, 0, 0.003921569, 1, 1,
0.4423535, 0.1831465, 1.682976, 0.003921569, 0, 1, 1,
0.4431714, 0.5112964, 3.145431, 0.007843138, 0, 1, 1,
0.451018, 0.8944352, -0.5361524, 0.01568628, 0, 1, 1,
0.4531082, 0.8137327, 0.2795328, 0.01960784, 0, 1, 1,
0.4608126, 1.296969, -1.380032, 0.02745098, 0, 1, 1,
0.4612837, 0.6496924, -0.8617636, 0.03137255, 0, 1, 1,
0.4616552, -0.0538167, 1.320575, 0.03921569, 0, 1, 1,
0.4653859, 0.5317072, 1.429649, 0.04313726, 0, 1, 1,
0.4687722, 1.452567, -1.183796, 0.05098039, 0, 1, 1,
0.4714538, -0.5558321, 1.781399, 0.05490196, 0, 1, 1,
0.4741398, -1.141083, 2.2069, 0.0627451, 0, 1, 1,
0.4763633, -0.1111744, 2.445244, 0.06666667, 0, 1, 1,
0.4813366, -0.05268996, 3.539685, 0.07450981, 0, 1, 1,
0.4843125, 1.218913, 2.346028, 0.07843138, 0, 1, 1,
0.487447, 0.3894782, 1.53843, 0.08627451, 0, 1, 1,
0.4884022, -0.2923768, 3.125106, 0.09019608, 0, 1, 1,
0.4913258, 0.2979424, 2.462082, 0.09803922, 0, 1, 1,
0.4919898, 0.3691829, 1.663604, 0.1058824, 0, 1, 1,
0.4935654, 1.558203, 0.401067, 0.1098039, 0, 1, 1,
0.494218, -0.2603205, 1.783109, 0.1176471, 0, 1, 1,
0.4992515, -0.1035405, 4.861902, 0.1215686, 0, 1, 1,
0.5001255, 0.6634571, -0.7910084, 0.1294118, 0, 1, 1,
0.5019475, -0.4551881, 0.6645567, 0.1333333, 0, 1, 1,
0.5056149, 0.09295435, 0.632897, 0.1411765, 0, 1, 1,
0.5121741, -0.04393009, 2.067456, 0.145098, 0, 1, 1,
0.5122775, -0.1022319, 1.345061, 0.1529412, 0, 1, 1,
0.5153918, 1.105267, -0.05782137, 0.1568628, 0, 1, 1,
0.5168131, -0.4596992, 1.428885, 0.1647059, 0, 1, 1,
0.5212131, 1.21615, -0.7403764, 0.1686275, 0, 1, 1,
0.5321187, -1.133687, 2.203326, 0.1764706, 0, 1, 1,
0.5329508, -1.447033, 1.379942, 0.1803922, 0, 1, 1,
0.5332958, 1.461893, -0.5393808, 0.1882353, 0, 1, 1,
0.5334764, -0.468428, 4.379075, 0.1921569, 0, 1, 1,
0.5356757, 0.7569422, 2.399274, 0.2, 0, 1, 1,
0.537447, 0.05324843, 2.499701, 0.2078431, 0, 1, 1,
0.5409958, -0.5711684, 0.6368762, 0.2117647, 0, 1, 1,
0.5525175, 0.3121631, 1.698157, 0.2196078, 0, 1, 1,
0.5528514, -0.7279019, 1.583718, 0.2235294, 0, 1, 1,
0.5557799, 1.973129, -0.3594963, 0.2313726, 0, 1, 1,
0.5609286, -0.04104519, 1.846499, 0.2352941, 0, 1, 1,
0.5617697, 0.856769, -1.221127, 0.2431373, 0, 1, 1,
0.5644026, -0.1482536, 2.402476, 0.2470588, 0, 1, 1,
0.5681049, 0.3916217, 0.6108798, 0.254902, 0, 1, 1,
0.5696265, -0.2370423, 2.850116, 0.2588235, 0, 1, 1,
0.5746305, 0.1268934, 0.8814055, 0.2666667, 0, 1, 1,
0.5747384, -0.1062182, 3.134271, 0.2705882, 0, 1, 1,
0.5747905, 2.265132, -0.4068143, 0.2784314, 0, 1, 1,
0.5768664, 0.01438925, 1.23544, 0.282353, 0, 1, 1,
0.5778391, -0.3993336, 0.9153067, 0.2901961, 0, 1, 1,
0.5781645, 0.5156561, -0.188921, 0.2941177, 0, 1, 1,
0.5818131, 0.4662155, 0.2570085, 0.3019608, 0, 1, 1,
0.5840489, -0.9863755, 4.046463, 0.3098039, 0, 1, 1,
0.587957, -1.108528, 1.258773, 0.3137255, 0, 1, 1,
0.6004295, 0.3911978, 0.06883398, 0.3215686, 0, 1, 1,
0.6072021, 0.354206, 0.8683267, 0.3254902, 0, 1, 1,
0.6149351, 0.2857719, -0.5963517, 0.3333333, 0, 1, 1,
0.6167332, -1.028986, 1.396524, 0.3372549, 0, 1, 1,
0.6208064, 0.2362174, 2.123258, 0.345098, 0, 1, 1,
0.6209106, -0.1350666, 0.9367037, 0.3490196, 0, 1, 1,
0.622668, -0.757552, 2.09517, 0.3568628, 0, 1, 1,
0.6236324, 0.9883906, 0.66368, 0.3607843, 0, 1, 1,
0.6263574, 0.3476796, 0.6365712, 0.3686275, 0, 1, 1,
0.6268142, 2.050248, 0.969323, 0.372549, 0, 1, 1,
0.6284654, -1.990042, 3.023147, 0.3803922, 0, 1, 1,
0.6294903, -0.4058101, 2.615186, 0.3843137, 0, 1, 1,
0.6338039, 2.056839, 2.454392, 0.3921569, 0, 1, 1,
0.6360843, 0.2990076, -0.1443392, 0.3960784, 0, 1, 1,
0.6384291, 2.291755, 0.2485221, 0.4039216, 0, 1, 1,
0.6411668, 0.9075968, 0.6006249, 0.4117647, 0, 1, 1,
0.6446168, 1.652245, -0.7843085, 0.4156863, 0, 1, 1,
0.6451071, -1.293016, 3.423754, 0.4235294, 0, 1, 1,
0.6467794, -1.354537, 3.813333, 0.427451, 0, 1, 1,
0.650694, 0.786037, 0.5320224, 0.4352941, 0, 1, 1,
0.6597465, -0.4302126, 4.131288, 0.4392157, 0, 1, 1,
0.663572, 0.27641, 2.291625, 0.4470588, 0, 1, 1,
0.6672178, 1.520507, -1.029628, 0.4509804, 0, 1, 1,
0.6683838, -1.15001, 2.997706, 0.4588235, 0, 1, 1,
0.6699926, 0.3953142, 0.7960428, 0.4627451, 0, 1, 1,
0.6718856, -1.044084, 1.250587, 0.4705882, 0, 1, 1,
0.6737275, 0.8832439, 0.5195826, 0.4745098, 0, 1, 1,
0.6807878, 1.278346, -1.114966, 0.4823529, 0, 1, 1,
0.6839612, -0.2515672, -0.1867031, 0.4862745, 0, 1, 1,
0.6893767, -0.4081208, 0.6112524, 0.4941176, 0, 1, 1,
0.6907459, -0.3480252, 2.178112, 0.5019608, 0, 1, 1,
0.6943599, -1.355966, 1.822676, 0.5058824, 0, 1, 1,
0.6993278, 1.18266, 0.01503706, 0.5137255, 0, 1, 1,
0.7007852, 0.1090115, -0.008361127, 0.5176471, 0, 1, 1,
0.7009416, -0.9843484, 3.591662, 0.5254902, 0, 1, 1,
0.7095768, -0.7413727, 2.247849, 0.5294118, 0, 1, 1,
0.7100776, 1.047877, 0.6412926, 0.5372549, 0, 1, 1,
0.7126356, -0.4829568, 2.103135, 0.5411765, 0, 1, 1,
0.7179716, -0.2741615, 3.042459, 0.5490196, 0, 1, 1,
0.7185131, -1.923571, 2.524137, 0.5529412, 0, 1, 1,
0.7209744, 0.03264438, 2.542994, 0.5607843, 0, 1, 1,
0.7218387, -0.5073156, 4.044906, 0.5647059, 0, 1, 1,
0.7245911, 1.236998, 0.8419994, 0.572549, 0, 1, 1,
0.7248182, 0.2145002, 0.6617539, 0.5764706, 0, 1, 1,
0.7258378, 0.3664362, 1.291722, 0.5843138, 0, 1, 1,
0.7276686, 0.9080387, -0.7840706, 0.5882353, 0, 1, 1,
0.7283525, -0.08188464, 0.9639042, 0.5960785, 0, 1, 1,
0.7287698, 0.07248273, 1.644343, 0.6039216, 0, 1, 1,
0.7327286, 0.963943, 0.6819452, 0.6078432, 0, 1, 1,
0.7353174, 0.2399631, -0.3156859, 0.6156863, 0, 1, 1,
0.7399967, 0.01224904, 1.583128, 0.6196079, 0, 1, 1,
0.7425612, -0.6280652, 2.372618, 0.627451, 0, 1, 1,
0.7449402, 0.7478687, -0.01909687, 0.6313726, 0, 1, 1,
0.7451794, -0.02521758, 2.666759, 0.6392157, 0, 1, 1,
0.7497559, -0.3923246, 2.00931, 0.6431373, 0, 1, 1,
0.7552078, 0.3247654, 0.8534192, 0.6509804, 0, 1, 1,
0.75854, 0.6562988, 1.262593, 0.654902, 0, 1, 1,
0.7678944, 0.404688, 1.172753, 0.6627451, 0, 1, 1,
0.7791486, -0.7817165, 3.125606, 0.6666667, 0, 1, 1,
0.7801027, 0.008234329, 2.333394, 0.6745098, 0, 1, 1,
0.7814767, -1.330141, 2.023449, 0.6784314, 0, 1, 1,
0.7868122, -3.105843, 1.651464, 0.6862745, 0, 1, 1,
0.787735, 1.096519, 0.1203618, 0.6901961, 0, 1, 1,
0.7884854, -3.004823, 2.37767, 0.6980392, 0, 1, 1,
0.792821, -0.4668455, 2.607592, 0.7058824, 0, 1, 1,
0.797106, 2.09253, 0.4396905, 0.7098039, 0, 1, 1,
0.7971429, -0.9729092, 1.940477, 0.7176471, 0, 1, 1,
0.7991726, 1.524858, 0.5804228, 0.7215686, 0, 1, 1,
0.7997246, -0.04721672, 1.182647, 0.7294118, 0, 1, 1,
0.8033907, -0.4999517, 2.153125, 0.7333333, 0, 1, 1,
0.8034971, -1.101477, 1.9487, 0.7411765, 0, 1, 1,
0.8044149, 0.9684577, 1.204632, 0.7450981, 0, 1, 1,
0.8073996, -1.065056, 4.170197, 0.7529412, 0, 1, 1,
0.8116235, 0.2809076, 1.199329, 0.7568628, 0, 1, 1,
0.8162504, 0.1673827, -0.3661183, 0.7647059, 0, 1, 1,
0.8205892, 0.5390611, 1.885866, 0.7686275, 0, 1, 1,
0.8278105, 2.497648, 2.255513, 0.7764706, 0, 1, 1,
0.8280897, 0.6057928, 0.9749035, 0.7803922, 0, 1, 1,
0.8286098, 0.6933633, 1.511471, 0.7882353, 0, 1, 1,
0.82876, -0.1867105, 1.023587, 0.7921569, 0, 1, 1,
0.8308753, 0.4871671, 1.230077, 0.8, 0, 1, 1,
0.8359503, 0.9760945, -0.8131569, 0.8078431, 0, 1, 1,
0.8392752, 0.09716271, 1.595057, 0.8117647, 0, 1, 1,
0.8450854, 0.2928343, -0.6314177, 0.8196079, 0, 1, 1,
0.855327, -1.208039, 3.436841, 0.8235294, 0, 1, 1,
0.8581843, 0.7490606, 0.8650818, 0.8313726, 0, 1, 1,
0.8590645, 0.544899, 1.294092, 0.8352941, 0, 1, 1,
0.8592577, -0.8657096, 1.37421, 0.8431373, 0, 1, 1,
0.8651706, 1.581144, 0.638121, 0.8470588, 0, 1, 1,
0.869365, 0.101532, 2.298723, 0.854902, 0, 1, 1,
0.8744369, -0.0001852096, 2.087533, 0.8588235, 0, 1, 1,
0.8866961, 3.14319, 0.4772527, 0.8666667, 0, 1, 1,
0.8949658, -1.477336, 2.315073, 0.8705882, 0, 1, 1,
0.8957128, 0.07127471, 0.8278098, 0.8784314, 0, 1, 1,
0.9073026, -0.2026126, 0.3990083, 0.8823529, 0, 1, 1,
0.9082749, 0.248066, 2.02453, 0.8901961, 0, 1, 1,
0.9089864, -0.9144136, 3.745558, 0.8941177, 0, 1, 1,
0.9111544, 0.3435613, 0.9825104, 0.9019608, 0, 1, 1,
0.9135336, 0.4913129, 0.8663106, 0.9098039, 0, 1, 1,
0.9259942, 0.3647706, 0.4717213, 0.9137255, 0, 1, 1,
0.9307677, 0.04266138, 2.529576, 0.9215686, 0, 1, 1,
0.9310422, 0.5553439, 2.39576, 0.9254902, 0, 1, 1,
0.9324139, -0.5501497, 2.532297, 0.9333333, 0, 1, 1,
0.9444407, -0.9623802, 4.838694, 0.9372549, 0, 1, 1,
0.9492057, 0.4155732, 1.103779, 0.945098, 0, 1, 1,
0.9538869, -0.7126368, 1.380976, 0.9490196, 0, 1, 1,
0.9539071, 1.939389, 0.6979084, 0.9568627, 0, 1, 1,
0.9547225, -0.4128848, 2.87384, 0.9607843, 0, 1, 1,
0.9549564, -0.3607113, 3.356802, 0.9686275, 0, 1, 1,
0.9581231, -1.360871, 4.31298, 0.972549, 0, 1, 1,
0.9607574, -1.125494, 2.236322, 0.9803922, 0, 1, 1,
0.9613266, 0.8917542, 0.6803588, 0.9843137, 0, 1, 1,
0.9635409, 0.03176613, 2.685023, 0.9921569, 0, 1, 1,
0.968644, -2.044027, 1.269571, 0.9960784, 0, 1, 1,
0.9701619, 0.5260832, 1.139973, 1, 0, 0.9960784, 1,
0.9767408, 0.8503275, 1.281571, 1, 0, 0.9882353, 1,
0.9803317, 0.9277099, 0.4565815, 1, 0, 0.9843137, 1,
0.9835938, 1.556868, 2.546389, 1, 0, 0.9764706, 1,
0.9883952, -0.3712543, 1.779437, 1, 0, 0.972549, 1,
0.9910203, 2.796877, 0.2196872, 1, 0, 0.9647059, 1,
0.9986112, -1.691706, 2.574769, 1, 0, 0.9607843, 1,
0.9993005, -1.800283, 2.747578, 1, 0, 0.9529412, 1,
1.002996, 1.315169, 1.946795, 1, 0, 0.9490196, 1,
1.009879, -0.5487548, 1.374081, 1, 0, 0.9411765, 1,
1.021755, -0.04502564, 2.563575, 1, 0, 0.9372549, 1,
1.026166, 0.2841457, 1.557563, 1, 0, 0.9294118, 1,
1.028617, -1.243774, 3.694572, 1, 0, 0.9254902, 1,
1.031137, -0.3910593, 2.121173, 1, 0, 0.9176471, 1,
1.055088, -1.091104, 2.917282, 1, 0, 0.9137255, 1,
1.055479, -0.1988137, 1.033055, 1, 0, 0.9058824, 1,
1.055883, -0.7166578, 1.728055, 1, 0, 0.9019608, 1,
1.057606, -0.4176274, 1.656956, 1, 0, 0.8941177, 1,
1.059075, 0.1505506, 1.162552, 1, 0, 0.8862745, 1,
1.062033, -0.4943939, 1.335736, 1, 0, 0.8823529, 1,
1.063265, -0.2559422, 1.50064, 1, 0, 0.8745098, 1,
1.064444, 0.173397, 1.454472, 1, 0, 0.8705882, 1,
1.071349, 0.3061453, 2.246224, 1, 0, 0.8627451, 1,
1.073607, 1.694406, -0.1940045, 1, 0, 0.8588235, 1,
1.074216, -1.567309, 3.127953, 1, 0, 0.8509804, 1,
1.080395, 0.556657, 1.843059, 1, 0, 0.8470588, 1,
1.080548, -0.5299124, 1.822064, 1, 0, 0.8392157, 1,
1.092799, 0.6927463, 1.174308, 1, 0, 0.8352941, 1,
1.092823, -1.654611, 1.253816, 1, 0, 0.827451, 1,
1.09983, 0.8563871, 0.3532722, 1, 0, 0.8235294, 1,
1.104056, 2.249461, 1.01384, 1, 0, 0.8156863, 1,
1.108774, -1.673677, 3.411407, 1, 0, 0.8117647, 1,
1.113661, 0.2629476, 3.346755, 1, 0, 0.8039216, 1,
1.1196, -0.9352966, 3.437988, 1, 0, 0.7960784, 1,
1.130785, 0.6067879, 0.2392389, 1, 0, 0.7921569, 1,
1.137587, -2.033513, 3.181242, 1, 0, 0.7843137, 1,
1.14856, 1.390258, 1.495151, 1, 0, 0.7803922, 1,
1.149233, -1.227836, 0.881635, 1, 0, 0.772549, 1,
1.153808, -0.4315228, 4.019303, 1, 0, 0.7686275, 1,
1.160881, 0.9996806, -0.003620601, 1, 0, 0.7607843, 1,
1.16602, 0.1065872, 1.090636, 1, 0, 0.7568628, 1,
1.167375, 0.7946888, 3.337869, 1, 0, 0.7490196, 1,
1.169304, 1.040667, 0.3183193, 1, 0, 0.7450981, 1,
1.173224, -0.9724141, 1.749386, 1, 0, 0.7372549, 1,
1.178359, 0.5117216, 1.389704, 1, 0, 0.7333333, 1,
1.180806, 1.382867, -0.7386486, 1, 0, 0.7254902, 1,
1.189195, 0.720962, 0.7704168, 1, 0, 0.7215686, 1,
1.195723, -0.9392923, 1.351375, 1, 0, 0.7137255, 1,
1.197914, -0.4708194, 1.886458, 1, 0, 0.7098039, 1,
1.198017, 2.087452, -0.7070358, 1, 0, 0.7019608, 1,
1.205644, 1.325372, 0.231638, 1, 0, 0.6941177, 1,
1.212232, 0.5123177, 1.190859, 1, 0, 0.6901961, 1,
1.221257, 0.6249634, 0.3586671, 1, 0, 0.682353, 1,
1.224365, -1.737853, 3.804483, 1, 0, 0.6784314, 1,
1.228686, -0.3137548, 0.2177238, 1, 0, 0.6705883, 1,
1.239575, 0.7520883, 1.60942, 1, 0, 0.6666667, 1,
1.244677, -1.296772, 2.221932, 1, 0, 0.6588235, 1,
1.24637, -0.3135595, 2.421346, 1, 0, 0.654902, 1,
1.252477, 0.1176107, 1.73222, 1, 0, 0.6470588, 1,
1.260547, -1.605125, 2.472255, 1, 0, 0.6431373, 1,
1.264442, 0.7551863, 1.425884, 1, 0, 0.6352941, 1,
1.265618, 0.4713054, 1.015147, 1, 0, 0.6313726, 1,
1.27514, 2.089381, 1.427573, 1, 0, 0.6235294, 1,
1.283942, 0.2693478, 0.2288947, 1, 0, 0.6196079, 1,
1.286077, 1.191479, 1.087782, 1, 0, 0.6117647, 1,
1.29569, -0.6117678, 2.855545, 1, 0, 0.6078432, 1,
1.296412, -0.1137597, 1.638816, 1, 0, 0.6, 1,
1.299673, 3.328412, -0.946459, 1, 0, 0.5921569, 1,
1.300063, 0.8330676, -0.2252945, 1, 0, 0.5882353, 1,
1.309991, 0.6119646, 1.504551, 1, 0, 0.5803922, 1,
1.315925, 2.551253, 1.162462, 1, 0, 0.5764706, 1,
1.323781, -0.6187671, 2.799539, 1, 0, 0.5686275, 1,
1.32495, 0.34721, 0.6815545, 1, 0, 0.5647059, 1,
1.326943, -0.1710252, 2.957485, 1, 0, 0.5568628, 1,
1.329376, -0.847743, 2.977141, 1, 0, 0.5529412, 1,
1.345971, 1.060576, 1.08472, 1, 0, 0.5450981, 1,
1.348974, -1.304963, 2.758754, 1, 0, 0.5411765, 1,
1.352504, -0.195266, 0.9542261, 1, 0, 0.5333334, 1,
1.369156, 0.5395085, -0.9363299, 1, 0, 0.5294118, 1,
1.375868, -1.201082, 2.145191, 1, 0, 0.5215687, 1,
1.383756, 0.2203608, 0.821794, 1, 0, 0.5176471, 1,
1.389519, 0.5168442, 0.5809948, 1, 0, 0.509804, 1,
1.394305, -0.454905, 3.733954, 1, 0, 0.5058824, 1,
1.397266, 1.760572, 0.5907835, 1, 0, 0.4980392, 1,
1.413807, -0.8271906, 2.490782, 1, 0, 0.4901961, 1,
1.420277, -1.124486, 2.029959, 1, 0, 0.4862745, 1,
1.426257, 0.3835503, 1.51371, 1, 0, 0.4784314, 1,
1.444485, -1.671131, 1.063852, 1, 0, 0.4745098, 1,
1.457566, 0.658542, 0.7591797, 1, 0, 0.4666667, 1,
1.45839, 1.353332, 0.9046466, 1, 0, 0.4627451, 1,
1.485639, -0.8697481, 2.383217, 1, 0, 0.454902, 1,
1.495734, 0.3568359, 2.178499, 1, 0, 0.4509804, 1,
1.496085, 0.6017275, 2.154032, 1, 0, 0.4431373, 1,
1.498942, 0.286182, 1.506966, 1, 0, 0.4392157, 1,
1.499771, 0.4820797, 0.4339249, 1, 0, 0.4313726, 1,
1.518944, -0.2752221, 1.365769, 1, 0, 0.427451, 1,
1.531621, 0.115683, 4.257513, 1, 0, 0.4196078, 1,
1.540123, -1.180029, 2.44924, 1, 0, 0.4156863, 1,
1.545986, 0.03090566, 0.1284614, 1, 0, 0.4078431, 1,
1.551955, 0.8746312, 0.7106591, 1, 0, 0.4039216, 1,
1.559899, 2.63652, 0.5283153, 1, 0, 0.3960784, 1,
1.570457, -1.133684, 1.381801, 1, 0, 0.3882353, 1,
1.602748, 1.235354, 2.279164, 1, 0, 0.3843137, 1,
1.607503, -0.5118739, 2.540824, 1, 0, 0.3764706, 1,
1.607563, 0.06709821, 2.375009, 1, 0, 0.372549, 1,
1.612862, 0.7925237, 1.756508, 1, 0, 0.3647059, 1,
1.615249, -0.5902003, 1.716226, 1, 0, 0.3607843, 1,
1.63468, -1.144953, 1.312028, 1, 0, 0.3529412, 1,
1.643445, -0.6841844, 3.24747, 1, 0, 0.3490196, 1,
1.650703, -0.2721464, 1.12632, 1, 0, 0.3411765, 1,
1.660621, -0.9674614, 0.2263225, 1, 0, 0.3372549, 1,
1.677645, -0.1309863, 1.790713, 1, 0, 0.3294118, 1,
1.684149, -0.6623412, 3.034609, 1, 0, 0.3254902, 1,
1.701308, 0.1854989, 1.804807, 1, 0, 0.3176471, 1,
1.714389, -1.450618, 2.745432, 1, 0, 0.3137255, 1,
1.716056, -0.936658, 3.160167, 1, 0, 0.3058824, 1,
1.721967, -0.02078911, 0.7296002, 1, 0, 0.2980392, 1,
1.727875, -0.4218, 1.660246, 1, 0, 0.2941177, 1,
1.73855, 1.779225, 1.534077, 1, 0, 0.2862745, 1,
1.741527, -0.6251228, 0.8707947, 1, 0, 0.282353, 1,
1.744143, 0.7320042, 0.2297572, 1, 0, 0.2745098, 1,
1.757259, -0.3327753, 1.749714, 1, 0, 0.2705882, 1,
1.761954, 0.5991706, 1.2199, 1, 0, 0.2627451, 1,
1.767701, -1.553033, 1.872091, 1, 0, 0.2588235, 1,
1.782814, -1.651576, 0.8027227, 1, 0, 0.2509804, 1,
1.785825, 1.28693, 1.186152, 1, 0, 0.2470588, 1,
1.787426, -1.051178, 2.569961, 1, 0, 0.2392157, 1,
1.795144, 0.04876703, 2.875872, 1, 0, 0.2352941, 1,
1.814457, 0.1376983, 0.7532803, 1, 0, 0.227451, 1,
1.830472, 2.239544, 0.5511023, 1, 0, 0.2235294, 1,
1.831687, 0.6702401, 1.919601, 1, 0, 0.2156863, 1,
1.884521, 0.08464399, 2.869938, 1, 0, 0.2117647, 1,
1.907065, -0.2989373, 2.365941, 1, 0, 0.2039216, 1,
1.920314, 1.487348, -0.3749003, 1, 0, 0.1960784, 1,
1.922378, -0.21191, 1.617125, 1, 0, 0.1921569, 1,
1.956401, 0.9008344, 0.6651679, 1, 0, 0.1843137, 1,
1.956513, 0.5804145, 1.994299, 1, 0, 0.1803922, 1,
1.961327, -0.8304845, 0.6065206, 1, 0, 0.172549, 1,
1.975934, 0.3843126, 2.07608, 1, 0, 0.1686275, 1,
1.978348, 1.496525, -0.7430359, 1, 0, 0.1607843, 1,
2.004889, 2.717978, 0.7318159, 1, 0, 0.1568628, 1,
2.004961, 1.953595, -0.1095789, 1, 0, 0.1490196, 1,
2.007565, 0.4518842, -0.04496968, 1, 0, 0.145098, 1,
2.016275, 0.9067615, 0.9895571, 1, 0, 0.1372549, 1,
2.031091, 0.2606733, 1.690943, 1, 0, 0.1333333, 1,
2.033853, 0.4494336, 1.347202, 1, 0, 0.1254902, 1,
2.034193, 0.5725904, 2.095623, 1, 0, 0.1215686, 1,
2.045773, 0.3852961, 1.806449, 1, 0, 0.1137255, 1,
2.048101, -0.5985457, 0.9962826, 1, 0, 0.1098039, 1,
2.073469, -0.08193223, 0.8373073, 1, 0, 0.1019608, 1,
2.125267, 1.025269, -0.00785279, 1, 0, 0.09411765, 1,
2.196095, 0.8460324, 1.039506, 1, 0, 0.09019608, 1,
2.206512, -1.815821, 3.807106, 1, 0, 0.08235294, 1,
2.211384, 0.9656428, 1.485334, 1, 0, 0.07843138, 1,
2.214047, -0.2347969, 0.5875914, 1, 0, 0.07058824, 1,
2.221314, 0.3438988, -1.009615, 1, 0, 0.06666667, 1,
2.25375, -0.19703, 2.616134, 1, 0, 0.05882353, 1,
2.27599, 1.391334, -0.02499321, 1, 0, 0.05490196, 1,
2.283109, -0.2253923, 0.8501423, 1, 0, 0.04705882, 1,
2.302885, -0.7001391, 2.216143, 1, 0, 0.04313726, 1,
2.421931, -0.8111371, 0.4971793, 1, 0, 0.03529412, 1,
2.581549, 0.9710948, 1.266178, 1, 0, 0.03137255, 1,
2.65327, -2.204081, -0.009114569, 1, 0, 0.02352941, 1,
2.720137, 0.6209176, 1.917926, 1, 0, 0.01960784, 1,
3.146214, 1.352565, 1.625664, 1, 0, 0.01176471, 1,
3.277479, 0.5159605, 1.764883, 1, 0, 0.007843138, 1
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
-0.004687905, -4.196449, -7.992981, 0, -0.5, 0.5, 0.5,
-0.004687905, -4.196449, -7.992981, 1, -0.5, 0.5, 0.5,
-0.004687905, -4.196449, -7.992981, 1, 1.5, 0.5, 0.5,
-0.004687905, -4.196449, -7.992981, 0, 1.5, 0.5, 0.5
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
-4.399509, 0.1112844, -7.992981, 0, -0.5, 0.5, 0.5,
-4.399509, 0.1112844, -7.992981, 1, -0.5, 0.5, 0.5,
-4.399509, 0.1112844, -7.992981, 1, 1.5, 0.5, 0.5,
-4.399509, 0.1112844, -7.992981, 0, 1.5, 0.5, 0.5
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
-4.399509, -4.196449, -0.5109174, 0, -0.5, 0.5, 0.5,
-4.399509, -4.196449, -0.5109174, 1, -0.5, 0.5, 0.5,
-4.399509, -4.196449, -0.5109174, 1, 1.5, 0.5, 0.5,
-4.399509, -4.196449, -0.5109174, 0, 1.5, 0.5, 0.5
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
-3, -3.202357, -6.266351,
3, -3.202357, -6.266351,
-3, -3.202357, -6.266351,
-3, -3.368039, -6.554123,
-2, -3.202357, -6.266351,
-2, -3.368039, -6.554123,
-1, -3.202357, -6.266351,
-1, -3.368039, -6.554123,
0, -3.202357, -6.266351,
0, -3.368039, -6.554123,
1, -3.202357, -6.266351,
1, -3.368039, -6.554123,
2, -3.202357, -6.266351,
2, -3.368039, -6.554123,
3, -3.202357, -6.266351,
3, -3.368039, -6.554123
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
-3, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
-3, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
-3, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
-3, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5,
-2, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
-2, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
-2, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
-2, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5,
-1, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
-1, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
-1, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
-1, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5,
0, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
0, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
0, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
0, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5,
1, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
1, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
1, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
1, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5,
2, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
2, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
2, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
2, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5,
3, -3.699403, -7.129666, 0, -0.5, 0.5, 0.5,
3, -3.699403, -7.129666, 1, -0.5, 0.5, 0.5,
3, -3.699403, -7.129666, 1, 1.5, 0.5, 0.5,
3, -3.699403, -7.129666, 0, 1.5, 0.5, 0.5
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
-3.385319, -3, -6.266351,
-3.385319, 3, -6.266351,
-3.385319, -3, -6.266351,
-3.554351, -3, -6.554123,
-3.385319, -2, -6.266351,
-3.554351, -2, -6.554123,
-3.385319, -1, -6.266351,
-3.554351, -1, -6.554123,
-3.385319, 0, -6.266351,
-3.554351, 0, -6.554123,
-3.385319, 1, -6.266351,
-3.554351, 1, -6.554123,
-3.385319, 2, -6.266351,
-3.554351, 2, -6.554123,
-3.385319, 3, -6.266351,
-3.554351, 3, -6.554123
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
-3.892414, -3, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, -3, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, -3, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, -3, -7.129666, 0, 1.5, 0.5, 0.5,
-3.892414, -2, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, -2, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, -2, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, -2, -7.129666, 0, 1.5, 0.5, 0.5,
-3.892414, -1, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, -1, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, -1, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, -1, -7.129666, 0, 1.5, 0.5, 0.5,
-3.892414, 0, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, 0, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, 0, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, 0, -7.129666, 0, 1.5, 0.5, 0.5,
-3.892414, 1, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, 1, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, 1, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, 1, -7.129666, 0, 1.5, 0.5, 0.5,
-3.892414, 2, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, 2, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, 2, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, 2, -7.129666, 0, 1.5, 0.5, 0.5,
-3.892414, 3, -7.129666, 0, -0.5, 0.5, 0.5,
-3.892414, 3, -7.129666, 1, -0.5, 0.5, 0.5,
-3.892414, 3, -7.129666, 1, 1.5, 0.5, 0.5,
-3.892414, 3, -7.129666, 0, 1.5, 0.5, 0.5
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
-3.385319, -3.202357, -6,
-3.385319, -3.202357, 4,
-3.385319, -3.202357, -6,
-3.554351, -3.368039, -6,
-3.385319, -3.202357, -4,
-3.554351, -3.368039, -4,
-3.385319, -3.202357, -2,
-3.554351, -3.368039, -2,
-3.385319, -3.202357, 0,
-3.554351, -3.368039, 0,
-3.385319, -3.202357, 2,
-3.554351, -3.368039, 2,
-3.385319, -3.202357, 4,
-3.554351, -3.368039, 4
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
"-6",
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
-3.892414, -3.699403, -6, 0, -0.5, 0.5, 0.5,
-3.892414, -3.699403, -6, 1, -0.5, 0.5, 0.5,
-3.892414, -3.699403, -6, 1, 1.5, 0.5, 0.5,
-3.892414, -3.699403, -6, 0, 1.5, 0.5, 0.5,
-3.892414, -3.699403, -4, 0, -0.5, 0.5, 0.5,
-3.892414, -3.699403, -4, 1, -0.5, 0.5, 0.5,
-3.892414, -3.699403, -4, 1, 1.5, 0.5, 0.5,
-3.892414, -3.699403, -4, 0, 1.5, 0.5, 0.5,
-3.892414, -3.699403, -2, 0, -0.5, 0.5, 0.5,
-3.892414, -3.699403, -2, 1, -0.5, 0.5, 0.5,
-3.892414, -3.699403, -2, 1, 1.5, 0.5, 0.5,
-3.892414, -3.699403, -2, 0, 1.5, 0.5, 0.5,
-3.892414, -3.699403, 0, 0, -0.5, 0.5, 0.5,
-3.892414, -3.699403, 0, 1, -0.5, 0.5, 0.5,
-3.892414, -3.699403, 0, 1, 1.5, 0.5, 0.5,
-3.892414, -3.699403, 0, 0, 1.5, 0.5, 0.5,
-3.892414, -3.699403, 2, 0, -0.5, 0.5, 0.5,
-3.892414, -3.699403, 2, 1, -0.5, 0.5, 0.5,
-3.892414, -3.699403, 2, 1, 1.5, 0.5, 0.5,
-3.892414, -3.699403, 2, 0, 1.5, 0.5, 0.5,
-3.892414, -3.699403, 4, 0, -0.5, 0.5, 0.5,
-3.892414, -3.699403, 4, 1, -0.5, 0.5, 0.5,
-3.892414, -3.699403, 4, 1, 1.5, 0.5, 0.5,
-3.892414, -3.699403, 4, 0, 1.5, 0.5, 0.5
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
-3.385319, -3.202357, -6.266351,
-3.385319, 3.424926, -6.266351,
-3.385319, -3.202357, 5.244516,
-3.385319, 3.424926, 5.244516,
-3.385319, -3.202357, -6.266351,
-3.385319, -3.202357, 5.244516,
-3.385319, 3.424926, -6.266351,
-3.385319, 3.424926, 5.244516,
-3.385319, -3.202357, -6.266351,
3.375944, -3.202357, -6.266351,
-3.385319, -3.202357, 5.244516,
3.375944, -3.202357, 5.244516,
-3.385319, 3.424926, -6.266351,
3.375944, 3.424926, -6.266351,
-3.385319, 3.424926, 5.244516,
3.375944, 3.424926, 5.244516,
3.375944, -3.202357, -6.266351,
3.375944, 3.424926, -6.266351,
3.375944, -3.202357, 5.244516,
3.375944, 3.424926, 5.244516,
3.375944, -3.202357, -6.266351,
3.375944, -3.202357, 5.244516,
3.375944, 3.424926, -6.266351,
3.375944, 3.424926, 5.244516
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
var radius = 7.958562;
var distance = 35.40854;
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
mvMatrix.translate( 0.004687905, -0.1112844, 0.5109174 );
mvMatrix.scale( 1.272684, 1.298413, 0.7475503 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.40854);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
machete<-read.table("machete.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-machete$V2
```

```
## Error in eval(expr, envir, enclos): object 'machete' not found
```

```r
y<-machete$V3
```

```
## Error in eval(expr, envir, enclos): object 'machete' not found
```

```r
z<-machete$V4
```

```
## Error in eval(expr, envir, enclos): object 'machete' not found
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
-3.286855, -1.474514, -2.200722, 0, 0, 1, 1, 1,
-2.957083, -0.9387327, -0.3856975, 1, 0, 0, 1, 1,
-2.87493, -2.400334, -3.581253, 1, 0, 0, 1, 1,
-2.712555, -0.840256, -1.120115, 1, 0, 0, 1, 1,
-2.613664, -1.19871, -2.446154, 1, 0, 0, 1, 1,
-2.483531, 0.5006155, -0.9853582, 1, 0, 0, 1, 1,
-2.457869, -0.7533859, -1.534077, 0, 0, 0, 1, 1,
-2.437304, -0.4574347, -1.316704, 0, 0, 0, 1, 1,
-2.421027, 0.664509, -1.661418, 0, 0, 0, 1, 1,
-2.380979, -0.580349, -1.299243, 0, 0, 0, 1, 1,
-2.362825, 1.315195, -0.1993267, 0, 0, 0, 1, 1,
-2.270829, -2.164492, -1.621113, 0, 0, 0, 1, 1,
-2.201181, -0.4370449, -3.828362, 0, 0, 0, 1, 1,
-2.170697, 0.7754369, -1.089327, 1, 1, 1, 1, 1,
-2.139169, -0.2649871, -2.321543, 1, 1, 1, 1, 1,
-2.100245, 0.320905, -1.092064, 1, 1, 1, 1, 1,
-2.072906, 0.3422106, -1.342558, 1, 1, 1, 1, 1,
-2.070232, 0.1794728, -1.450287, 1, 1, 1, 1, 1,
-2.049448, 0.54794, -2.468102, 1, 1, 1, 1, 1,
-2.048012, -1.446703, -1.687836, 1, 1, 1, 1, 1,
-2.031654, 0.4913973, -1.565224, 1, 1, 1, 1, 1,
-2.027575, 0.23119, -1.493116, 1, 1, 1, 1, 1,
-2.014006, 0.8199797, 0.5143971, 1, 1, 1, 1, 1,
-2.013425, -0.3241866, -2.224645, 1, 1, 1, 1, 1,
-1.999956, 0.3503951, -3.390477, 1, 1, 1, 1, 1,
-1.991111, -1.106621, -3.053104, 1, 1, 1, 1, 1,
-1.969751, -1.327402, 0.3922693, 1, 1, 1, 1, 1,
-1.961108, 0.618372, -1.698226, 1, 1, 1, 1, 1,
-1.959425, 0.03422241, -2.602742, 0, 0, 1, 1, 1,
-1.956235, -0.4795628, -1.712949, 1, 0, 0, 1, 1,
-1.89608, -1.102879, -2.624858, 1, 0, 0, 1, 1,
-1.891907, 0.9032983, -3.608252, 1, 0, 0, 1, 1,
-1.884952, 0.14218, -2.191968, 1, 0, 0, 1, 1,
-1.865669, 0.1916682, -1.926675, 1, 0, 0, 1, 1,
-1.864592, -1.280244, -2.122521, 0, 0, 0, 1, 1,
-1.850368, -0.8535237, -3.07001, 0, 0, 0, 1, 1,
-1.842994, -1.257076, -1.318927, 0, 0, 0, 1, 1,
-1.839827, -1.255524, -3.421723, 0, 0, 0, 1, 1,
-1.830651, -0.5245413, -1.93196, 0, 0, 0, 1, 1,
-1.803119, -1.288259, -0.923941, 0, 0, 0, 1, 1,
-1.778391, 0.9870125, -0.4348729, 0, 0, 0, 1, 1,
-1.750586, 0.4152303, -0.5345606, 1, 1, 1, 1, 1,
-1.738954, -1.228602, -1.61162, 1, 1, 1, 1, 1,
-1.736661, -0.01196581, -1.780875, 1, 1, 1, 1, 1,
-1.723759, -0.3184537, -3.239293, 1, 1, 1, 1, 1,
-1.722527, 0.5546344, -1.735434, 1, 1, 1, 1, 1,
-1.702919, 0.2784681, -1.962463, 1, 1, 1, 1, 1,
-1.69669, -1.566968, -1.90399, 1, 1, 1, 1, 1,
-1.688837, -0.3617095, -0.8337162, 1, 1, 1, 1, 1,
-1.686596, 0.3233871, -0.6256776, 1, 1, 1, 1, 1,
-1.678251, 1.39144, -2.64051, 1, 1, 1, 1, 1,
-1.67435, 0.2617267, -1.271336, 1, 1, 1, 1, 1,
-1.673372, 1.778376, -1.362828, 1, 1, 1, 1, 1,
-1.672975, -0.3698504, -0.7550314, 1, 1, 1, 1, 1,
-1.672658, -0.4290371, -3.078235, 1, 1, 1, 1, 1,
-1.666108, 0.09975778, -2.296302, 1, 1, 1, 1, 1,
-1.656161, 1.717963, -1.046704, 0, 0, 1, 1, 1,
-1.654277, -1.305859, -1.755529, 1, 0, 0, 1, 1,
-1.653171, 0.5250279, -1.581891, 1, 0, 0, 1, 1,
-1.625642, 1.463807, -1.715542, 1, 0, 0, 1, 1,
-1.618058, -1.211465, -3.471035, 1, 0, 0, 1, 1,
-1.608057, -0.861444, -1.745738, 1, 0, 0, 1, 1,
-1.601627, -1.432707, -5.952983, 0, 0, 0, 1, 1,
-1.600942, 0.02297452, -1.781362, 0, 0, 0, 1, 1,
-1.595461, 1.070786, 0.0650415, 0, 0, 0, 1, 1,
-1.577675, -0.9894909, -2.418169, 0, 0, 0, 1, 1,
-1.57741, 1.763608, -0.6535149, 0, 0, 0, 1, 1,
-1.57252, 0.7589086, 1.047089, 0, 0, 0, 1, 1,
-1.561873, -0.240471, -1.087464, 0, 0, 0, 1, 1,
-1.558386, -0.5044026, -3.031557, 1, 1, 1, 1, 1,
-1.553517, -1.740384, -3.41323, 1, 1, 1, 1, 1,
-1.550843, 1.054724, -0.2849121, 1, 1, 1, 1, 1,
-1.531031, 0.6971291, -0.8137276, 1, 1, 1, 1, 1,
-1.528236, -0.2757116, -1.719568, 1, 1, 1, 1, 1,
-1.511544, -0.3059888, -0.982236, 1, 1, 1, 1, 1,
-1.509696, -1.024046, -2.056473, 1, 1, 1, 1, 1,
-1.494938, 0.214671, -1.212236, 1, 1, 1, 1, 1,
-1.494102, 0.2035138, -1.424509, 1, 1, 1, 1, 1,
-1.488405, -2.199497, -3.264498, 1, 1, 1, 1, 1,
-1.481838, 1.141737, -0.9926142, 1, 1, 1, 1, 1,
-1.477477, 1.089706, -0.777923, 1, 1, 1, 1, 1,
-1.453114, 1.463896, -0.06103744, 1, 1, 1, 1, 1,
-1.438834, -1.033967, -2.519542, 1, 1, 1, 1, 1,
-1.433204, 0.1060803, -2.309251, 1, 1, 1, 1, 1,
-1.430473, -0.8808877, -2.074548, 0, 0, 1, 1, 1,
-1.428935, -1.088687, -1.447858, 1, 0, 0, 1, 1,
-1.420832, 0.5631849, -1.883671, 1, 0, 0, 1, 1,
-1.419847, -1.093287, 0.3611962, 1, 0, 0, 1, 1,
-1.416436, 0.1934044, 1.116561, 1, 0, 0, 1, 1,
-1.413568, -0.9691401, -1.429527, 1, 0, 0, 1, 1,
-1.412698, -1.869293, -3.035215, 0, 0, 0, 1, 1,
-1.395875, -0.6607019, -0.6371894, 0, 0, 0, 1, 1,
-1.391894, -1.115874, -1.130073, 0, 0, 0, 1, 1,
-1.377931, 1.807237, -1.433967, 0, 0, 0, 1, 1,
-1.374469, 0.3779498, -1.646641, 0, 0, 0, 1, 1,
-1.374364, 1.898489, -1.388358, 0, 0, 0, 1, 1,
-1.366427, 0.26535, -0.4574591, 0, 0, 0, 1, 1,
-1.365717, 0.3558322, -2.050124, 1, 1, 1, 1, 1,
-1.34124, -1.893648, -2.768414, 1, 1, 1, 1, 1,
-1.340721, 0.1967133, -2.639439, 1, 1, 1, 1, 1,
-1.333479, 0.06396502, -2.082204, 1, 1, 1, 1, 1,
-1.324188, -0.2940166, -3.32226, 1, 1, 1, 1, 1,
-1.319453, 0.7284956, -1.086735, 1, 1, 1, 1, 1,
-1.314552, -2.049367, -2.345098, 1, 1, 1, 1, 1,
-1.308937, 0.7855331, -1.375207, 1, 1, 1, 1, 1,
-1.281776, -0.4014497, -2.859127, 1, 1, 1, 1, 1,
-1.27708, 0.3799969, -0.7693359, 1, 1, 1, 1, 1,
-1.27225, -0.135119, -0.7995369, 1, 1, 1, 1, 1,
-1.253388, 0.6433361, -1.323062, 1, 1, 1, 1, 1,
-1.252107, 0.005381028, -2.171771, 1, 1, 1, 1, 1,
-1.247341, 0.6410238, 0.8152417, 1, 1, 1, 1, 1,
-1.23833, 1.898173, -0.4936981, 1, 1, 1, 1, 1,
-1.235213, 0.02614591, -1.039087, 0, 0, 1, 1, 1,
-1.230856, 1.01449, -1.457229, 1, 0, 0, 1, 1,
-1.226294, 0.8933253, -1.899457, 1, 0, 0, 1, 1,
-1.224823, -0.4284829, -1.421073, 1, 0, 0, 1, 1,
-1.211557, 0.2440439, -1.015402, 1, 0, 0, 1, 1,
-1.19559, -0.899151, -1.17519, 1, 0, 0, 1, 1,
-1.192337, 1.448733, 0.5522369, 0, 0, 0, 1, 1,
-1.185527, -0.7256281, -1.882101, 0, 0, 0, 1, 1,
-1.177284, -1.102248, -2.915666, 0, 0, 0, 1, 1,
-1.176815, -0.1847635, -2.901296, 0, 0, 0, 1, 1,
-1.173458, 1.914458, 1.700618, 0, 0, 0, 1, 1,
-1.163226, -0.4956204, -2.338153, 0, 0, 0, 1, 1,
-1.162192, -1.001498, -1.712652, 0, 0, 0, 1, 1,
-1.150332, 0.1031666, -2.06103, 1, 1, 1, 1, 1,
-1.144647, 1.352515, -0.7267428, 1, 1, 1, 1, 1,
-1.141976, 0.4992646, -0.8148426, 1, 1, 1, 1, 1,
-1.14192, -0.4918187, -1.738426, 1, 1, 1, 1, 1,
-1.14135, -1.763392, -3.013522, 1, 1, 1, 1, 1,
-1.140167, 1.20278, -1.054605, 1, 1, 1, 1, 1,
-1.134562, -0.02106439, -2.479449, 1, 1, 1, 1, 1,
-1.12831, 0.1121196, -0.9759615, 1, 1, 1, 1, 1,
-1.125736, 0.8981382, -0.1686633, 1, 1, 1, 1, 1,
-1.123752, -1.687367, -0.5412689, 1, 1, 1, 1, 1,
-1.118419, 1.083569, -1.122326, 1, 1, 1, 1, 1,
-1.105736, -0.6196023, -1.728133, 1, 1, 1, 1, 1,
-1.10229, 1.861677, -0.06005031, 1, 1, 1, 1, 1,
-1.102175, -1.473778, -1.004437, 1, 1, 1, 1, 1,
-1.101956, 0.2165725, -1.479334, 1, 1, 1, 1, 1,
-1.100947, -0.7494412, -2.457377, 0, 0, 1, 1, 1,
-1.099095, -1.253404, -4.094947, 1, 0, 0, 1, 1,
-1.095529, -0.2808779, -1.153889, 1, 0, 0, 1, 1,
-1.087707, 1.179031, 1.221862, 1, 0, 0, 1, 1,
-1.084765, 0.01024387, 0.6872688, 1, 0, 0, 1, 1,
-1.083955, -0.03648987, -2.58775, 1, 0, 0, 1, 1,
-1.08166, 1.738681, -0.8194729, 0, 0, 0, 1, 1,
-1.080682, 0.3666044, -0.1979895, 0, 0, 0, 1, 1,
-1.078958, -0.3900731, -2.935338, 0, 0, 0, 1, 1,
-1.075627, -0.7279326, -2.196801, 0, 0, 0, 1, 1,
-1.070426, -0.5660486, -2.914823, 0, 0, 0, 1, 1,
-1.067081, 1.165254, -0.5434687, 0, 0, 0, 1, 1,
-1.061602, -0.5799707, -3.312717, 0, 0, 0, 1, 1,
-1.061407, -0.264123, -3.275441, 1, 1, 1, 1, 1,
-1.059849, 0.7524999, -1.045473, 1, 1, 1, 1, 1,
-1.057915, -0.858226, -3.544888, 1, 1, 1, 1, 1,
-1.055724, -0.7836859, -1.581383, 1, 1, 1, 1, 1,
-1.050179, 0.8696567, -0.5818473, 1, 1, 1, 1, 1,
-1.045728, 1.089977, -0.6291587, 1, 1, 1, 1, 1,
-1.044436, 0.5596231, -0.9765453, 1, 1, 1, 1, 1,
-1.039907, -0.3914655, -3.386497, 1, 1, 1, 1, 1,
-1.03732, 2.050785, -0.7629009, 1, 1, 1, 1, 1,
-1.036992, 1.97112, -0.6121523, 1, 1, 1, 1, 1,
-1.034773, 0.07729609, -1.762556, 1, 1, 1, 1, 1,
-1.028391, 0.5631034, -2.682345, 1, 1, 1, 1, 1,
-1.02708, -0.3309611, -2.327277, 1, 1, 1, 1, 1,
-1.022548, -0.7775334, -2.547967, 1, 1, 1, 1, 1,
-1.013254, 0.7936562, -3.43053, 1, 1, 1, 1, 1,
-1.011305, -1.078354, -1.101269, 0, 0, 1, 1, 1,
-1.00609, -0.20771, -0.4350347, 1, 0, 0, 1, 1,
-1.003426, 1.131572, -1.599953, 1, 0, 0, 1, 1,
-1.001993, 0.1610845, -2.163733, 1, 0, 0, 1, 1,
-0.9980287, 0.09644099, -0.929814, 1, 0, 0, 1, 1,
-0.9909779, -1.211897, -1.761802, 1, 0, 0, 1, 1,
-0.990517, 0.1859964, -1.435985, 0, 0, 0, 1, 1,
-0.9884958, -1.226755, -1.238779, 0, 0, 0, 1, 1,
-0.9817287, 0.237438, -2.017611, 0, 0, 0, 1, 1,
-0.9791635, -0.3064223, -1.202936, 0, 0, 0, 1, 1,
-0.9768825, 0.8137619, -0.3997255, 0, 0, 0, 1, 1,
-0.9745256, -0.8684408, -1.297995, 0, 0, 0, 1, 1,
-0.9719139, 1.051983, 0.828715, 0, 0, 0, 1, 1,
-0.9709574, 0.8338455, -0.7642497, 1, 1, 1, 1, 1,
-0.9603963, -0.05578991, -1.452818, 1, 1, 1, 1, 1,
-0.9581829, 0.3202593, -1.284451, 1, 1, 1, 1, 1,
-0.9564545, -1.591683, -3.11298, 1, 1, 1, 1, 1,
-0.9547365, 0.3722957, -1.791248, 1, 1, 1, 1, 1,
-0.9436135, 0.0151631, -1.580459, 1, 1, 1, 1, 1,
-0.9421236, 0.7106264, -2.199865, 1, 1, 1, 1, 1,
-0.93584, 0.4303705, -1.793705, 1, 1, 1, 1, 1,
-0.9346112, 1.034275, 0.3081317, 1, 1, 1, 1, 1,
-0.9294643, 0.5623987, -1.529, 1, 1, 1, 1, 1,
-0.9255005, -0.1422964, -1.407282, 1, 1, 1, 1, 1,
-0.9251552, 0.03229076, -3.182818, 1, 1, 1, 1, 1,
-0.9128515, -0.1545786, -0.4282054, 1, 1, 1, 1, 1,
-0.9101638, -0.7726949, -2.10785, 1, 1, 1, 1, 1,
-0.9101534, 0.3639727, 0.8679371, 1, 1, 1, 1, 1,
-0.9086314, -2.043009, -2.634791, 0, 0, 1, 1, 1,
-0.9019629, -0.06319796, -2.143473, 1, 0, 0, 1, 1,
-0.9015395, 0.06137231, -4.132971, 1, 0, 0, 1, 1,
-0.8971503, 0.168952, -3.103928, 1, 0, 0, 1, 1,
-0.896346, -2.232738, -1.866381, 1, 0, 0, 1, 1,
-0.8912755, -0.5016306, -1.008156, 1, 0, 0, 1, 1,
-0.8819356, 0.9925554, 0.4129346, 0, 0, 0, 1, 1,
-0.8799542, 0.9561155, 0.2900571, 0, 0, 0, 1, 1,
-0.8780316, 0.3690797, -0.6144391, 0, 0, 0, 1, 1,
-0.8733449, -0.2625705, -0.8531025, 0, 0, 0, 1, 1,
-0.8680683, 0.8208369, -1.912963, 0, 0, 0, 1, 1,
-0.8675518, 0.9896252, -0.2188549, 0, 0, 0, 1, 1,
-0.864247, -0.4557566, -2.592628, 0, 0, 0, 1, 1,
-0.8628008, -0.2428311, -3.086426, 1, 1, 1, 1, 1,
-0.8510608, 0.9797395, 0.698949, 1, 1, 1, 1, 1,
-0.8467737, -0.7099369, -2.168979, 1, 1, 1, 1, 1,
-0.8457282, -0.5451548, -2.080458, 1, 1, 1, 1, 1,
-0.8393979, -0.2287388, -2.325196, 1, 1, 1, 1, 1,
-0.8375794, -0.3377393, -2.589525, 1, 1, 1, 1, 1,
-0.8365399, 0.1029286, -2.668779, 1, 1, 1, 1, 1,
-0.8359155, -0.9808162, -3.065179, 1, 1, 1, 1, 1,
-0.8294172, -1.17975, -3.025999, 1, 1, 1, 1, 1,
-0.8232897, -0.107093, -2.794675, 1, 1, 1, 1, 1,
-0.8223143, 0.6495369, -0.7478878, 1, 1, 1, 1, 1,
-0.8098284, 1.212839, 0.1574619, 1, 1, 1, 1, 1,
-0.8067223, -0.6339065, -4.497857, 1, 1, 1, 1, 1,
-0.806162, 1.145605, -0.8972034, 1, 1, 1, 1, 1,
-0.8047008, 0.5235139, -0.02949674, 1, 1, 1, 1, 1,
-0.8032339, 0.06841507, -0.9468343, 0, 0, 1, 1, 1,
-0.8024454, -0.5588002, -2.327635, 1, 0, 0, 1, 1,
-0.800761, 0.4118559, -1.530824, 1, 0, 0, 1, 1,
-0.7995476, -0.1311355, -1.060778, 1, 0, 0, 1, 1,
-0.7994763, 0.2309375, -0.6369005, 1, 0, 0, 1, 1,
-0.7975984, 0.002546016, -2.531741, 1, 0, 0, 1, 1,
-0.7897847, -0.6796993, -1.225751, 0, 0, 0, 1, 1,
-0.7883757, 0.5377221, 0.434254, 0, 0, 0, 1, 1,
-0.7871979, -0.2378898, -1.890848, 0, 0, 0, 1, 1,
-0.7842923, 1.286636, 1.497038, 0, 0, 0, 1, 1,
-0.7830207, 0.8804302, 0.6272181, 0, 0, 0, 1, 1,
-0.7778454, 0.9988685, -1.207385, 0, 0, 0, 1, 1,
-0.7759147, -1.036819, -3.576573, 0, 0, 0, 1, 1,
-0.7724403, 0.1335951, -0.2793046, 1, 1, 1, 1, 1,
-0.7712284, 1.0785, -1.581064, 1, 1, 1, 1, 1,
-0.7662097, -0.3588786, -1.989909, 1, 1, 1, 1, 1,
-0.7568357, 0.4038289, -0.1815318, 1, 1, 1, 1, 1,
-0.7555575, 2.022244, -0.08982781, 1, 1, 1, 1, 1,
-0.7532298, -0.5042695, -2.748811, 1, 1, 1, 1, 1,
-0.7497814, 0.1077996, -1.226498, 1, 1, 1, 1, 1,
-0.7456379, -0.7218959, -2.660717, 1, 1, 1, 1, 1,
-0.7412412, 0.4124905, -2.063015, 1, 1, 1, 1, 1,
-0.7362334, 1.916742, -0.8009118, 1, 1, 1, 1, 1,
-0.7334344, 0.124169, -0.7539027, 1, 1, 1, 1, 1,
-0.7302338, 1.402545, -1.23636, 1, 1, 1, 1, 1,
-0.7255117, 0.6958196, -0.4722513, 1, 1, 1, 1, 1,
-0.7221345, 1.61753, -0.70266, 1, 1, 1, 1, 1,
-0.7186176, 1.626685, -1.852123, 1, 1, 1, 1, 1,
-0.7171267, -0.5676093, -3.558286, 0, 0, 1, 1, 1,
-0.7016423, 0.1133133, -1.091885, 1, 0, 0, 1, 1,
-0.6974254, -2.168623, -1.659802, 1, 0, 0, 1, 1,
-0.6970008, 0.1287878, -0.8809659, 1, 0, 0, 1, 1,
-0.6955569, 0.7637061, -0.6019041, 1, 0, 0, 1, 1,
-0.6948637, 0.3650691, -1.385477, 1, 0, 0, 1, 1,
-0.6908088, -0.5261224, -2.197871, 0, 0, 0, 1, 1,
-0.6902406, 0.6939015, -0.436138, 0, 0, 0, 1, 1,
-0.6895314, 1.23301, -1.786621, 0, 0, 0, 1, 1,
-0.6880424, -0.8452976, -4.205173, 0, 0, 0, 1, 1,
-0.6865713, -0.7474523, -3.538617, 0, 0, 0, 1, 1,
-0.6842906, -0.5194495, -2.261775, 0, 0, 0, 1, 1,
-0.6831456, -0.6973396, -1.190349, 0, 0, 0, 1, 1,
-0.6830828, -0.2127865, -2.045913, 1, 1, 1, 1, 1,
-0.6816297, -0.603689, -1.18328, 1, 1, 1, 1, 1,
-0.6813303, 1.200152, 1.89889, 1, 1, 1, 1, 1,
-0.6706581, -0.5601012, -3.511584, 1, 1, 1, 1, 1,
-0.6692938, 0.5255608, 0.2487928, 1, 1, 1, 1, 1,
-0.6634437, 1.823339, -1.137217, 1, 1, 1, 1, 1,
-0.6528453, -1.041092, -2.060613, 1, 1, 1, 1, 1,
-0.6516837, 0.5931543, -1.06798, 1, 1, 1, 1, 1,
-0.6516259, -0.8887569, -3.255056, 1, 1, 1, 1, 1,
-0.6512994, -0.5762733, -2.905874, 1, 1, 1, 1, 1,
-0.6487839, 0.2184384, -2.84309, 1, 1, 1, 1, 1,
-0.6424338, 0.3495452, -0.1443226, 1, 1, 1, 1, 1,
-0.6414077, -0.2876332, -2.588721, 1, 1, 1, 1, 1,
-0.640735, 0.7600291, 0.831121, 1, 1, 1, 1, 1,
-0.6311591, 1.119411, 0.240602, 1, 1, 1, 1, 1,
-0.6280305, -0.6285096, -0.915457, 0, 0, 1, 1, 1,
-0.6212893, 0.745686, -1.642898, 1, 0, 0, 1, 1,
-0.6201719, -0.3013949, -3.135185, 1, 0, 0, 1, 1,
-0.6153131, 0.8374128, -0.8955418, 1, 0, 0, 1, 1,
-0.6142851, 1.444329, -0.6654148, 1, 0, 0, 1, 1,
-0.6139687, 0.2852086, -1.862126, 1, 0, 0, 1, 1,
-0.613759, 0.358022, -0.6538042, 0, 0, 0, 1, 1,
-0.6134463, -0.5617496, -2.339009, 0, 0, 0, 1, 1,
-0.6128013, 0.02159028, -1.468299, 0, 0, 0, 1, 1,
-0.6078773, 1.975291, 1.951039, 0, 0, 0, 1, 1,
-0.6055506, 0.9330482, 0.247303, 0, 0, 0, 1, 1,
-0.6053752, 0.182442, -1.514728, 0, 0, 0, 1, 1,
-0.5996075, -1.834974, -1.004984, 0, 0, 0, 1, 1,
-0.5991024, 0.690038, -0.2499047, 1, 1, 1, 1, 1,
-0.5961112, -0.1877246, -2.220426, 1, 1, 1, 1, 1,
-0.5905291, -1.665246, -1.817932, 1, 1, 1, 1, 1,
-0.5849993, -0.7230225, -2.39887, 1, 1, 1, 1, 1,
-0.5740529, -0.5101619, -2.644299, 1, 1, 1, 1, 1,
-0.5723456, -1.825338, -3.285722, 1, 1, 1, 1, 1,
-0.5667278, 0.4395765, -1.152313, 1, 1, 1, 1, 1,
-0.5633144, 0.2411346, -1.22823, 1, 1, 1, 1, 1,
-0.5625171, -0.2060914, -1.483874, 1, 1, 1, 1, 1,
-0.5616774, 1.109521, -0.9864373, 1, 1, 1, 1, 1,
-0.5570462, -0.05517017, -1.476295, 1, 1, 1, 1, 1,
-0.5525536, -1.621925, -3.875469, 1, 1, 1, 1, 1,
-0.5453966, -0.7017136, -2.793939, 1, 1, 1, 1, 1,
-0.5436498, -0.7033466, -4.04561, 1, 1, 1, 1, 1,
-0.5406249, 1.940802, 0.04096979, 1, 1, 1, 1, 1,
-0.5379251, -0.5836846, -2.070127, 0, 0, 1, 1, 1,
-0.5371338, -0.9713134, -4.615688, 1, 0, 0, 1, 1,
-0.5360571, -0.35592, -0.7952681, 1, 0, 0, 1, 1,
-0.5359943, 0.09045021, -1.955347, 1, 0, 0, 1, 1,
-0.5320618, 0.01111884, -0.5878876, 1, 0, 0, 1, 1,
-0.5270789, -0.1166391, -3.851036, 1, 0, 0, 1, 1,
-0.5211186, 0.9377736, -0.2849511, 0, 0, 0, 1, 1,
-0.5190135, -0.3827594, -2.824235, 0, 0, 0, 1, 1,
-0.5182223, 0.1812488, -2.609608, 0, 0, 0, 1, 1,
-0.5179366, -0.5802371, -3.558443, 0, 0, 0, 1, 1,
-0.5169816, 1.155192, 0.2270624, 0, 0, 0, 1, 1,
-0.5168374, 1.210332, 0.3520986, 0, 0, 0, 1, 1,
-0.5168315, 0.8136388, -1.671659, 0, 0, 0, 1, 1,
-0.5112405, 1.528846, 0.4314736, 1, 1, 1, 1, 1,
-0.5110091, 0.265808, 0.2215377, 1, 1, 1, 1, 1,
-0.5086079, 1.449676, -0.8790897, 1, 1, 1, 1, 1,
-0.4984162, 0.9816148, 0.6975355, 1, 1, 1, 1, 1,
-0.4975674, 0.3046583, -0.9004801, 1, 1, 1, 1, 1,
-0.4947517, -2.523916, -2.522447, 1, 1, 1, 1, 1,
-0.4916767, -2.979138, -2.460235, 1, 1, 1, 1, 1,
-0.4901742, 0.7952133, -0.313614, 1, 1, 1, 1, 1,
-0.485515, -0.5254849, -2.498523, 1, 1, 1, 1, 1,
-0.4804075, 0.08133199, -2.205989, 1, 1, 1, 1, 1,
-0.4795567, -0.9902996, -2.189601, 1, 1, 1, 1, 1,
-0.476255, -0.7673531, -2.87407, 1, 1, 1, 1, 1,
-0.4752115, -2.450495, -3.918741, 1, 1, 1, 1, 1,
-0.4747605, -0.4863148, -5.760378, 1, 1, 1, 1, 1,
-0.4684543, 0.6910498, -0.7250085, 1, 1, 1, 1, 1,
-0.462626, 0.6101266, -2.8729, 0, 0, 1, 1, 1,
-0.4602967, -0.6314486, -2.304229, 1, 0, 0, 1, 1,
-0.4528638, 1.622257, -0.4783867, 1, 0, 0, 1, 1,
-0.4502396, -0.07542539, -1.55287, 1, 0, 0, 1, 1,
-0.4485488, 0.4640322, -0.3820548, 1, 0, 0, 1, 1,
-0.4480135, 0.4655107, -1.594706, 1, 0, 0, 1, 1,
-0.4390064, -1.456396, -1.996007, 0, 0, 0, 1, 1,
-0.4165974, -1.736256, -3.506179, 0, 0, 0, 1, 1,
-0.414375, 0.06946765, 0.2400614, 0, 0, 0, 1, 1,
-0.4100558, 2.316178, -1.498483, 0, 0, 0, 1, 1,
-0.4100203, 0.7946142, 0.3274747, 0, 0, 0, 1, 1,
-0.4082873, 0.7797849, -0.2421869, 0, 0, 0, 1, 1,
-0.401923, 0.3690962, -1.420318, 0, 0, 0, 1, 1,
-0.3981931, -1.039899, -3.38151, 1, 1, 1, 1, 1,
-0.3939727, 1.521054, -0.9241419, 1, 1, 1, 1, 1,
-0.3920548, 0.3419304, -0.5196797, 1, 1, 1, 1, 1,
-0.3901051, 0.09631277, -0.1725014, 1, 1, 1, 1, 1,
-0.3884558, -0.662, -3.035067, 1, 1, 1, 1, 1,
-0.3869605, 0.0004111496, -0.3183758, 1, 1, 1, 1, 1,
-0.3849447, -0.457461, -2.543754, 1, 1, 1, 1, 1,
-0.3833491, 1.957819, 0.5415133, 1, 1, 1, 1, 1,
-0.3786455, 0.9062377, 1.134046, 1, 1, 1, 1, 1,
-0.3770477, -0.5990815, -1.267919, 1, 1, 1, 1, 1,
-0.3724988, -2.290337, -3.361424, 1, 1, 1, 1, 1,
-0.3651679, 1.639117, -0.3810602, 1, 1, 1, 1, 1,
-0.3648072, 1.91634, 1.110445, 1, 1, 1, 1, 1,
-0.358115, 0.3709642, 0.5831416, 1, 1, 1, 1, 1,
-0.3567776, -0.4572344, -1.938613, 1, 1, 1, 1, 1,
-0.3542463, -0.5752484, -2.75121, 0, 0, 1, 1, 1,
-0.3526516, 0.1140257, -1.238569, 1, 0, 0, 1, 1,
-0.35048, 0.7368766, -1.437335, 1, 0, 0, 1, 1,
-0.3494643, 0.310723, -1.720775, 1, 0, 0, 1, 1,
-0.3475424, -0.8535853, -4.116005, 1, 0, 0, 1, 1,
-0.3436842, -0.005550208, -2.238214, 1, 0, 0, 1, 1,
-0.3416375, 2.492735, -0.02416916, 0, 0, 0, 1, 1,
-0.340097, 0.313573, -2.470916, 0, 0, 0, 1, 1,
-0.3371049, -0.5085219, -3.899333, 0, 0, 0, 1, 1,
-0.3333547, 0.4231424, -1.465792, 0, 0, 0, 1, 1,
-0.3330156, 0.6744944, -0.8458792, 0, 0, 0, 1, 1,
-0.3324037, 1.174122, -1.38341, 0, 0, 0, 1, 1,
-0.3296604, 0.0003117456, -1.968345, 0, 0, 0, 1, 1,
-0.3278603, -0.4134387, -2.827797, 1, 1, 1, 1, 1,
-0.3272853, 1.021563, -1.558788, 1, 1, 1, 1, 1,
-0.327068, 0.232148, -2.523398, 1, 1, 1, 1, 1,
-0.3270208, -2.094493, -3.58485, 1, 1, 1, 1, 1,
-0.3257172, 1.242994, 0.04046306, 1, 1, 1, 1, 1,
-0.319759, -1.137596, -2.931448, 1, 1, 1, 1, 1,
-0.3110233, 2.007866, 0.2687197, 1, 1, 1, 1, 1,
-0.308423, -0.3182003, -2.085928, 1, 1, 1, 1, 1,
-0.302395, 0.7084647, -1.042631, 1, 1, 1, 1, 1,
-0.3016334, -0.1318296, -3.418885, 1, 1, 1, 1, 1,
-0.2992359, -0.3094957, -2.275283, 1, 1, 1, 1, 1,
-0.298676, -1.61798, -1.930285, 1, 1, 1, 1, 1,
-0.2924675, 0.07652294, 0.01085613, 1, 1, 1, 1, 1,
-0.2857732, -1.78199, -3.753563, 1, 1, 1, 1, 1,
-0.2837422, -0.5107316, -2.901096, 1, 1, 1, 1, 1,
-0.2812111, 0.1240842, -1.281318, 0, 0, 1, 1, 1,
-0.2800157, -1.104156, -3.129873, 1, 0, 0, 1, 1,
-0.2754569, -0.2786229, -1.254651, 1, 0, 0, 1, 1,
-0.268792, -0.4384449, -2.197989, 1, 0, 0, 1, 1,
-0.2634178, 0.07899612, -1.445593, 1, 0, 0, 1, 1,
-0.2624699, -0.7402396, -3.95008, 1, 0, 0, 1, 1,
-0.2600383, 1.136017, -0.1944682, 0, 0, 0, 1, 1,
-0.2573388, 0.5425637, 1.254514, 0, 0, 0, 1, 1,
-0.2562962, -1.860247, -1.694533, 0, 0, 0, 1, 1,
-0.2552948, -0.8307146, -2.33546, 0, 0, 0, 1, 1,
-0.2435502, 1.178623, 1.341012, 0, 0, 0, 1, 1,
-0.2393308, -0.5585625, -3.733268, 0, 0, 0, 1, 1,
-0.2390543, -1.512379, -2.58365, 0, 0, 0, 1, 1,
-0.2388156, -0.5162916, -1.847332, 1, 1, 1, 1, 1,
-0.2369828, -0.4284072, -3.581268, 1, 1, 1, 1, 1,
-0.2363243, 0.4909444, -0.2143902, 1, 1, 1, 1, 1,
-0.2327494, 0.5319772, -0.2750812, 1, 1, 1, 1, 1,
-0.2315735, -1.748378, -2.870939, 1, 1, 1, 1, 1,
-0.2312486, -0.534035, -2.09206, 1, 1, 1, 1, 1,
-0.2269652, 0.05439127, -1.702966, 1, 1, 1, 1, 1,
-0.2261988, 0.6126122, 0.04907871, 1, 1, 1, 1, 1,
-0.2240751, 1.558527, -0.7540902, 1, 1, 1, 1, 1,
-0.2210739, -0.4244022, -2.220019, 1, 1, 1, 1, 1,
-0.2156991, 0.3177885, -0.2727754, 1, 1, 1, 1, 1,
-0.2134769, 0.3496394, 0.1105104, 1, 1, 1, 1, 1,
-0.209547, -1.143585, -3.003051, 1, 1, 1, 1, 1,
-0.2018512, -0.0493193, -1.209678, 1, 1, 1, 1, 1,
-0.1877818, 0.3881819, -0.5342618, 1, 1, 1, 1, 1,
-0.1812953, -1.433229, -3.839444, 0, 0, 1, 1, 1,
-0.1781915, -0.7070493, -1.254429, 1, 0, 0, 1, 1,
-0.1709509, 1.368743, 1.396888, 1, 0, 0, 1, 1,
-0.1694434, 2.046981, 2.045945, 1, 0, 0, 1, 1,
-0.1674776, 1.760878, 0.2398931, 1, 0, 0, 1, 1,
-0.1597693, 1.710757, 0.9319081, 1, 0, 0, 1, 1,
-0.1554661, 2.087552, 0.07914011, 0, 0, 0, 1, 1,
-0.1550038, 1.070042, -1.704113, 0, 0, 0, 1, 1,
-0.1467583, -0.1498453, -3.069425, 0, 0, 0, 1, 1,
-0.1436581, -0.2814518, -2.367838, 0, 0, 0, 1, 1,
-0.143648, 0.05736708, -1.221061, 0, 0, 0, 1, 1,
-0.1404017, 1.193197, 0.9795586, 0, 0, 0, 1, 1,
-0.1361656, 1.45656, 0.8858552, 0, 0, 0, 1, 1,
-0.135296, 0.5682548, -3.683008, 1, 1, 1, 1, 1,
-0.1326732, -0.5496593, -6.098717, 1, 1, 1, 1, 1,
-0.1313062, 0.5815302, -1.375315, 1, 1, 1, 1, 1,
-0.1312106, 0.3382513, -1.60589, 1, 1, 1, 1, 1,
-0.1288456, -1.052925, -2.096095, 1, 1, 1, 1, 1,
-0.1242338, -1.023192, -4.287516, 1, 1, 1, 1, 1,
-0.1217342, 0.6578942, -0.5806651, 1, 1, 1, 1, 1,
-0.1191683, 0.4407421, -0.6176342, 1, 1, 1, 1, 1,
-0.1188669, 1.929938, 2.181907, 1, 1, 1, 1, 1,
-0.1188508, -0.4034438, -5.302885, 1, 1, 1, 1, 1,
-0.1188476, 0.2118546, -0.864427, 1, 1, 1, 1, 1,
-0.1122895, -1.028988, -1.806312, 1, 1, 1, 1, 1,
-0.1008907, -0.6251551, -1.564798, 1, 1, 1, 1, 1,
-0.1005647, 0.9062309, 0.1162034, 1, 1, 1, 1, 1,
-0.0988906, 1.302285, -1.526424, 1, 1, 1, 1, 1,
-0.09797651, 1.165628, -1.121738, 0, 0, 1, 1, 1,
-0.09476837, 0.9576101, 0.7765959, 1, 0, 0, 1, 1,
-0.09455215, -1.519665, -2.389345, 1, 0, 0, 1, 1,
-0.09305075, 0.7341483, -1.014797, 1, 0, 0, 1, 1,
-0.09087729, -0.2959228, -4.127714, 1, 0, 0, 1, 1,
-0.08498843, 1.084686, -0.3716189, 1, 0, 0, 1, 1,
-0.08456893, -0.2041428, -1.5812, 0, 0, 0, 1, 1,
-0.08407332, -0.1579868, -3.012723, 0, 0, 0, 1, 1,
-0.08271611, 0.3577486, 0.3785618, 0, 0, 0, 1, 1,
-0.07881352, -1.441098, -4.204847, 0, 0, 0, 1, 1,
-0.07631513, -0.7159084, -2.114807, 0, 0, 0, 1, 1,
-0.0757111, -0.1305051, -2.68303, 0, 0, 0, 1, 1,
-0.07417374, 1.100452, 0.7101164, 0, 0, 0, 1, 1,
-0.07097521, 1.31473, -0.2848319, 1, 1, 1, 1, 1,
-0.06667168, 0.3448605, -0.2294993, 1, 1, 1, 1, 1,
-0.06226593, 0.2518971, 0.6298706, 1, 1, 1, 1, 1,
-0.06197336, 0.3042688, 0.06790335, 1, 1, 1, 1, 1,
-0.05914839, -1.777244, -2.399369, 1, 1, 1, 1, 1,
-0.05447575, 0.6193078, -0.6072383, 1, 1, 1, 1, 1,
-0.0496528, -0.5581881, -2.802418, 1, 1, 1, 1, 1,
-0.04531109, 2.223557, -0.09862321, 1, 1, 1, 1, 1,
-0.04507801, -0.5387036, -3.656447, 1, 1, 1, 1, 1,
-0.04476998, -1.060421, -3.338483, 1, 1, 1, 1, 1,
-0.04240536, 0.2820089, 0.2618907, 1, 1, 1, 1, 1,
-0.03571116, -1.68594, -2.329928, 1, 1, 1, 1, 1,
-0.03433337, 0.6199067, -0.6294106, 1, 1, 1, 1, 1,
-0.0338744, 0.9188804, -0.8183628, 1, 1, 1, 1, 1,
-0.03145983, -1.224703, -3.835362, 1, 1, 1, 1, 1,
-0.02761409, 0.493533, -0.3451381, 0, 0, 1, 1, 1,
-0.02553727, 1.732749, -0.2659994, 1, 0, 0, 1, 1,
-0.02488543, 1.084041, 2.320443, 1, 0, 0, 1, 1,
-0.02467855, -1.065215, -2.834046, 1, 0, 0, 1, 1,
-0.01753659, -0.419262, -2.638161, 1, 0, 0, 1, 1,
-0.01566804, -1.546121, -3.335243, 1, 0, 0, 1, 1,
-0.01322392, 1.46197, -0.04446658, 0, 0, 0, 1, 1,
-0.01135822, 1.121223, 0.4179764, 0, 0, 0, 1, 1,
-0.006290644, -1.470139, -3.10581, 0, 0, 0, 1, 1,
-0.005414951, -0.3729833, -4.498221, 0, 0, 0, 1, 1,
-0.004292117, -1.495531, -4.192705, 0, 0, 0, 1, 1,
-0.002719207, -0.02185871, -4.219383, 0, 0, 0, 1, 1,
0.0002299159, 0.02344813, 0.208739, 0, 0, 0, 1, 1,
0.004833275, -0.5570601, 2.931713, 1, 1, 1, 1, 1,
0.005789043, -1.311043, 2.8794, 1, 1, 1, 1, 1,
0.006313393, -0.3969266, 2.387754, 1, 1, 1, 1, 1,
0.01236717, -1.243056, 3.555298, 1, 1, 1, 1, 1,
0.01562661, 0.01123913, 0.1037629, 1, 1, 1, 1, 1,
0.01619704, -0.7715672, 3.246534, 1, 1, 1, 1, 1,
0.01636788, -0.8448152, 4.599787, 1, 1, 1, 1, 1,
0.01870264, 1.13494, 0.02274626, 1, 1, 1, 1, 1,
0.01873858, 0.8881463, -0.5162307, 1, 1, 1, 1, 1,
0.01959798, -1.372861, 2.404127, 1, 1, 1, 1, 1,
0.0198834, -0.0524216, 1.031311, 1, 1, 1, 1, 1,
0.02262055, -0.02475243, 1.856661, 1, 1, 1, 1, 1,
0.02295881, 1.217417, 0.4615646, 1, 1, 1, 1, 1,
0.02343892, -0.6684488, 3.39091, 1, 1, 1, 1, 1,
0.02641774, -1.672095, 2.919531, 1, 1, 1, 1, 1,
0.02741011, 0.1351908, -1.755041, 0, 0, 1, 1, 1,
0.03332813, -0.58394, 3.598309, 1, 0, 0, 1, 1,
0.03715378, -0.2562067, 1.545416, 1, 0, 0, 1, 1,
0.0383806, 0.2768835, 1.297074, 1, 0, 0, 1, 1,
0.04026373, -1.919805, 2.134138, 1, 0, 0, 1, 1,
0.04117296, 1.2227, -0.9314538, 1, 0, 0, 1, 1,
0.04475768, -1.034609, 2.941277, 0, 0, 0, 1, 1,
0.04546447, 0.2536573, 0.2210284, 0, 0, 0, 1, 1,
0.04711496, 1.585595, 0.4167309, 0, 0, 0, 1, 1,
0.04777434, -0.3611777, 3.399943, 0, 0, 0, 1, 1,
0.04803615, -0.3573444, 5.076882, 0, 0, 0, 1, 1,
0.04892534, 0.5603167, 2.184622, 0, 0, 0, 1, 1,
0.05799859, -0.3250769, 1.173308, 0, 0, 0, 1, 1,
0.05850231, -0.7536656, 1.692931, 1, 1, 1, 1, 1,
0.06037358, 1.386872, -0.03702287, 1, 1, 1, 1, 1,
0.06158211, -0.4845385, 1.179281, 1, 1, 1, 1, 1,
0.06234568, 0.5671799, 0.6532809, 1, 1, 1, 1, 1,
0.06382446, -0.8151633, 1.80569, 1, 1, 1, 1, 1,
0.06468422, -1.933325, 1.604398, 1, 1, 1, 1, 1,
0.06472324, -0.6854783, 3.033496, 1, 1, 1, 1, 1,
0.06476517, -1.856735, 2.647238, 1, 1, 1, 1, 1,
0.07186001, 0.1983484, 0.2098102, 1, 1, 1, 1, 1,
0.07613175, -0.4756803, 1.994792, 1, 1, 1, 1, 1,
0.07618597, 2.084708, 1.019331, 1, 1, 1, 1, 1,
0.07890373, 0.8900938, -0.5079303, 1, 1, 1, 1, 1,
0.0803358, -0.1941499, 4.019561, 1, 1, 1, 1, 1,
0.08126792, -0.1814966, 2.076731, 1, 1, 1, 1, 1,
0.08171203, 1.250484, 1.222738, 1, 1, 1, 1, 1,
0.08248015, -1.022654, 3.436997, 0, 0, 1, 1, 1,
0.08427253, -0.5002536, 3.175107, 1, 0, 0, 1, 1,
0.084635, -0.3790361, 3.290121, 1, 0, 0, 1, 1,
0.08656135, 0.4039356, -0.5531261, 1, 0, 0, 1, 1,
0.08770541, 1.524319, 0.216957, 1, 0, 0, 1, 1,
0.09833834, -0.5867948, 2.373693, 1, 0, 0, 1, 1,
0.1052474, -0.351866, 2.35067, 0, 0, 0, 1, 1,
0.1061055, 0.5078891, 0.1016903, 0, 0, 0, 1, 1,
0.1076341, 1.671991, -1.532071, 0, 0, 0, 1, 1,
0.111097, 0.8544472, -0.02457979, 0, 0, 0, 1, 1,
0.1119042, 0.5000996, 2.595888, 0, 0, 0, 1, 1,
0.1152209, -0.8729758, 2.430913, 0, 0, 0, 1, 1,
0.1154405, -0.03379493, 1.477785, 0, 0, 0, 1, 1,
0.1191165, 0.03797752, 1.095095, 1, 1, 1, 1, 1,
0.1215522, -0.303561, 1.152922, 1, 1, 1, 1, 1,
0.1222537, -1.296038, 2.740367, 1, 1, 1, 1, 1,
0.1248159, -0.681727, 3.251363, 1, 1, 1, 1, 1,
0.1273941, -0.8457239, 2.304126, 1, 1, 1, 1, 1,
0.1285498, 0.7294503, -0.0704872, 1, 1, 1, 1, 1,
0.1296564, 1.487923, 1.996086, 1, 1, 1, 1, 1,
0.1361061, -0.9118597, 2.331063, 1, 1, 1, 1, 1,
0.1431284, 0.5761239, 0.639842, 1, 1, 1, 1, 1,
0.1529071, -0.855007, 3.709255, 1, 1, 1, 1, 1,
0.1542921, -0.06443132, 2.785511, 1, 1, 1, 1, 1,
0.1544343, -0.7159408, 2.47629, 1, 1, 1, 1, 1,
0.15588, 0.3120573, 1.50913, 1, 1, 1, 1, 1,
0.1566983, -0.4346434, 2.584376, 1, 1, 1, 1, 1,
0.1591176, 0.4558204, 1.620114, 1, 1, 1, 1, 1,
0.1696837, 2.255011, -0.282454, 0, 0, 1, 1, 1,
0.1718279, 0.6232564, -2.355478, 1, 0, 0, 1, 1,
0.1788081, 0.5703098, 1.15949, 1, 0, 0, 1, 1,
0.1833308, 0.6797624, 0.4691823, 1, 0, 0, 1, 1,
0.1837718, 1.318184, -0.9113974, 1, 0, 0, 1, 1,
0.1874159, -0.8945065, 2.99085, 1, 0, 0, 1, 1,
0.1882599, 1.44069, -0.4043203, 0, 0, 0, 1, 1,
0.1902243, 0.8112867, -1.405631, 0, 0, 0, 1, 1,
0.19207, 0.005923706, 0.2376584, 0, 0, 0, 1, 1,
0.1947578, -0.0533984, 2.252235, 0, 0, 0, 1, 1,
0.1978803, 1.030989, 1.950648, 0, 0, 0, 1, 1,
0.2026542, 1.554282, 0.157272, 0, 0, 0, 1, 1,
0.2032343, -0.4808905, 2.126852, 0, 0, 0, 1, 1,
0.2064766, -0.7064285, 4.607564, 1, 1, 1, 1, 1,
0.2077588, 0.1800766, 1.713885, 1, 1, 1, 1, 1,
0.2109793, -1.011136, 2.397947, 1, 1, 1, 1, 1,
0.2109902, -0.4434385, 2.710423, 1, 1, 1, 1, 1,
0.2116479, 1.183629, 0.7685245, 1, 1, 1, 1, 1,
0.2193782, -0.7063938, 5.012343, 1, 1, 1, 1, 1,
0.2234708, 0.7915879, -0.07426345, 1, 1, 1, 1, 1,
0.2241267, 1.208198, 0.1443224, 1, 1, 1, 1, 1,
0.2254746, 0.1717452, 2.134551, 1, 1, 1, 1, 1,
0.2263808, -0.2175281, 1.399244, 1, 1, 1, 1, 1,
0.2300842, -0.8721541, 1.386494, 1, 1, 1, 1, 1,
0.2307512, -0.8597934, 2.259869, 1, 1, 1, 1, 1,
0.2313307, -0.4226545, 3.510632, 1, 1, 1, 1, 1,
0.2319205, -0.2715827, 2.429499, 1, 1, 1, 1, 1,
0.2320183, 0.1620973, 1.594092, 1, 1, 1, 1, 1,
0.2346428, 0.9788001, 1.102003, 0, 0, 1, 1, 1,
0.234863, 1.059317, -0.9867166, 1, 0, 0, 1, 1,
0.2363402, 0.4383637, 0.6770937, 1, 0, 0, 1, 1,
0.2401018, -2.372183, 2.893281, 1, 0, 0, 1, 1,
0.2401569, 0.9968454, 0.6858584, 1, 0, 0, 1, 1,
0.2460381, 0.9939546, 0.442785, 1, 0, 0, 1, 1,
0.2474969, 1.457613, 0.7500958, 0, 0, 0, 1, 1,
0.2496671, -1.382474, 3.597942, 0, 0, 0, 1, 1,
0.2521391, 0.5765104, 1.08579, 0, 0, 0, 1, 1,
0.2535441, 0.9481474, 0.9881692, 0, 0, 0, 1, 1,
0.2551424, -3.105044, 4.06608, 0, 0, 0, 1, 1,
0.2577309, -0.7275007, 2.125885, 0, 0, 0, 1, 1,
0.2592546, -0.3586851, 2.852333, 0, 0, 0, 1, 1,
0.2631868, 0.5246212, 0.03436808, 1, 1, 1, 1, 1,
0.2668059, -1.370661, 3.19866, 1, 1, 1, 1, 1,
0.2681674, -0.278241, 1.86275, 1, 1, 1, 1, 1,
0.26979, 1.540117, 1.473652, 1, 1, 1, 1, 1,
0.2702703, 0.5157105, -0.66281, 1, 1, 1, 1, 1,
0.270832, -1.308447, 3.058717, 1, 1, 1, 1, 1,
0.2725367, -0.115937, 2.561226, 1, 1, 1, 1, 1,
0.2731093, -0.8977342, 1.636195, 1, 1, 1, 1, 1,
0.2736498, -0.2811214, 3.100677, 1, 1, 1, 1, 1,
0.2757956, 1.631003, -0.03818314, 1, 1, 1, 1, 1,
0.2831469, 0.4994662, 1.134116, 1, 1, 1, 1, 1,
0.2832327, 0.9872279, 1.258922, 1, 1, 1, 1, 1,
0.2852305, -0.1628263, 2.575081, 1, 1, 1, 1, 1,
0.2865439, -0.04281787, 2.270576, 1, 1, 1, 1, 1,
0.2926981, -1.649983, 3.462045, 1, 1, 1, 1, 1,
0.2943598, -1.859195, 3.107682, 0, 0, 1, 1, 1,
0.2950037, 1.471283, -0.005719494, 1, 0, 0, 1, 1,
0.2977162, -0.2842187, 1.581561, 1, 0, 0, 1, 1,
0.298809, -1.446614, 2.056961, 1, 0, 0, 1, 1,
0.301519, -1.861495, 2.383274, 1, 0, 0, 1, 1,
0.3017865, -0.6114086, 2.939102, 1, 0, 0, 1, 1,
0.3077221, -0.5162089, 2.428379, 0, 0, 0, 1, 1,
0.3086131, 0.5063961, 2.028828, 0, 0, 0, 1, 1,
0.3176857, -0.3660029, 2.400255, 0, 0, 0, 1, 1,
0.3263796, -1.123947, 2.789327, 0, 0, 0, 1, 1,
0.3318167, 0.5287762, 1.693163, 0, 0, 0, 1, 1,
0.3362304, 1.406181, -0.5259449, 0, 0, 0, 1, 1,
0.3363958, -0.1369417, 2.200666, 0, 0, 0, 1, 1,
0.3387492, -1.45764, 1.497054, 1, 1, 1, 1, 1,
0.3436847, -0.06612063, 1.640545, 1, 1, 1, 1, 1,
0.3456774, -0.3227601, 2.205992, 1, 1, 1, 1, 1,
0.3457105, -1.649355, 2.046941, 1, 1, 1, 1, 1,
0.350314, -1.358444, 3.077702, 1, 1, 1, 1, 1,
0.351027, 0.09620153, 1.291278, 1, 1, 1, 1, 1,
0.3531349, -1.616769, 4.239074, 1, 1, 1, 1, 1,
0.3581206, 0.4081082, 1.489616, 1, 1, 1, 1, 1,
0.3604706, 1.118482, 0.6879897, 1, 1, 1, 1, 1,
0.3670504, 1.414646, -0.07921779, 1, 1, 1, 1, 1,
0.367748, -0.9409043, 1.983559, 1, 1, 1, 1, 1,
0.3689634, -0.1346113, 1.682944, 1, 1, 1, 1, 1,
0.3720828, -0.07173619, 1.875829, 1, 1, 1, 1, 1,
0.3798313, 0.8710063, -0.2161414, 1, 1, 1, 1, 1,
0.3814428, -0.4661687, 3.301001, 1, 1, 1, 1, 1,
0.3863918, -0.2665038, 1.154464, 0, 0, 1, 1, 1,
0.3874601, 0.2733255, 1.995718, 1, 0, 0, 1, 1,
0.3891219, -0.8738779, 4.292369, 1, 0, 0, 1, 1,
0.3893905, -0.4755896, 1.578403, 1, 0, 0, 1, 1,
0.3898658, -1.1288, 3.470879, 1, 0, 0, 1, 1,
0.3927433, 0.3256867, 1.046362, 1, 0, 0, 1, 1,
0.3957975, -0.4366277, 2.529034, 0, 0, 0, 1, 1,
0.39725, -1.376487, 2.500506, 0, 0, 0, 1, 1,
0.4016026, 1.737035, 0.1895652, 0, 0, 0, 1, 1,
0.4039084, -1.740204, 4.99756, 0, 0, 0, 1, 1,
0.4042746, 0.3180576, 1.340829, 0, 0, 0, 1, 1,
0.407929, 0.5310076, 0.06947713, 0, 0, 0, 1, 1,
0.4127394, -1.299077, 4.401023, 0, 0, 0, 1, 1,
0.4188763, 2.62211, 0.2643539, 1, 1, 1, 1, 1,
0.4207973, -1.951513, 3.21514, 1, 1, 1, 1, 1,
0.4222314, -2.318841, 2.426723, 1, 1, 1, 1, 1,
0.4264839, 0.6809251, 1.332568, 1, 1, 1, 1, 1,
0.4301403, 1.708535, 0.01952169, 1, 1, 1, 1, 1,
0.4311703, -2.031135, 4.569408, 1, 1, 1, 1, 1,
0.4367375, 0.3215806, -1.440199, 1, 1, 1, 1, 1,
0.4368366, 1.68861, 0.4823947, 1, 1, 1, 1, 1,
0.4393995, -0.09843424, 2.225124, 1, 1, 1, 1, 1,
0.4419932, 0.1125001, 0.2993371, 1, 1, 1, 1, 1,
0.4423535, 0.1831465, 1.682976, 1, 1, 1, 1, 1,
0.4431714, 0.5112964, 3.145431, 1, 1, 1, 1, 1,
0.451018, 0.8944352, -0.5361524, 1, 1, 1, 1, 1,
0.4531082, 0.8137327, 0.2795328, 1, 1, 1, 1, 1,
0.4608126, 1.296969, -1.380032, 1, 1, 1, 1, 1,
0.4612837, 0.6496924, -0.8617636, 0, 0, 1, 1, 1,
0.4616552, -0.0538167, 1.320575, 1, 0, 0, 1, 1,
0.4653859, 0.5317072, 1.429649, 1, 0, 0, 1, 1,
0.4687722, 1.452567, -1.183796, 1, 0, 0, 1, 1,
0.4714538, -0.5558321, 1.781399, 1, 0, 0, 1, 1,
0.4741398, -1.141083, 2.2069, 1, 0, 0, 1, 1,
0.4763633, -0.1111744, 2.445244, 0, 0, 0, 1, 1,
0.4813366, -0.05268996, 3.539685, 0, 0, 0, 1, 1,
0.4843125, 1.218913, 2.346028, 0, 0, 0, 1, 1,
0.487447, 0.3894782, 1.53843, 0, 0, 0, 1, 1,
0.4884022, -0.2923768, 3.125106, 0, 0, 0, 1, 1,
0.4913258, 0.2979424, 2.462082, 0, 0, 0, 1, 1,
0.4919898, 0.3691829, 1.663604, 0, 0, 0, 1, 1,
0.4935654, 1.558203, 0.401067, 1, 1, 1, 1, 1,
0.494218, -0.2603205, 1.783109, 1, 1, 1, 1, 1,
0.4992515, -0.1035405, 4.861902, 1, 1, 1, 1, 1,
0.5001255, 0.6634571, -0.7910084, 1, 1, 1, 1, 1,
0.5019475, -0.4551881, 0.6645567, 1, 1, 1, 1, 1,
0.5056149, 0.09295435, 0.632897, 1, 1, 1, 1, 1,
0.5121741, -0.04393009, 2.067456, 1, 1, 1, 1, 1,
0.5122775, -0.1022319, 1.345061, 1, 1, 1, 1, 1,
0.5153918, 1.105267, -0.05782137, 1, 1, 1, 1, 1,
0.5168131, -0.4596992, 1.428885, 1, 1, 1, 1, 1,
0.5212131, 1.21615, -0.7403764, 1, 1, 1, 1, 1,
0.5321187, -1.133687, 2.203326, 1, 1, 1, 1, 1,
0.5329508, -1.447033, 1.379942, 1, 1, 1, 1, 1,
0.5332958, 1.461893, -0.5393808, 1, 1, 1, 1, 1,
0.5334764, -0.468428, 4.379075, 1, 1, 1, 1, 1,
0.5356757, 0.7569422, 2.399274, 0, 0, 1, 1, 1,
0.537447, 0.05324843, 2.499701, 1, 0, 0, 1, 1,
0.5409958, -0.5711684, 0.6368762, 1, 0, 0, 1, 1,
0.5525175, 0.3121631, 1.698157, 1, 0, 0, 1, 1,
0.5528514, -0.7279019, 1.583718, 1, 0, 0, 1, 1,
0.5557799, 1.973129, -0.3594963, 1, 0, 0, 1, 1,
0.5609286, -0.04104519, 1.846499, 0, 0, 0, 1, 1,
0.5617697, 0.856769, -1.221127, 0, 0, 0, 1, 1,
0.5644026, -0.1482536, 2.402476, 0, 0, 0, 1, 1,
0.5681049, 0.3916217, 0.6108798, 0, 0, 0, 1, 1,
0.5696265, -0.2370423, 2.850116, 0, 0, 0, 1, 1,
0.5746305, 0.1268934, 0.8814055, 0, 0, 0, 1, 1,
0.5747384, -0.1062182, 3.134271, 0, 0, 0, 1, 1,
0.5747905, 2.265132, -0.4068143, 1, 1, 1, 1, 1,
0.5768664, 0.01438925, 1.23544, 1, 1, 1, 1, 1,
0.5778391, -0.3993336, 0.9153067, 1, 1, 1, 1, 1,
0.5781645, 0.5156561, -0.188921, 1, 1, 1, 1, 1,
0.5818131, 0.4662155, 0.2570085, 1, 1, 1, 1, 1,
0.5840489, -0.9863755, 4.046463, 1, 1, 1, 1, 1,
0.587957, -1.108528, 1.258773, 1, 1, 1, 1, 1,
0.6004295, 0.3911978, 0.06883398, 1, 1, 1, 1, 1,
0.6072021, 0.354206, 0.8683267, 1, 1, 1, 1, 1,
0.6149351, 0.2857719, -0.5963517, 1, 1, 1, 1, 1,
0.6167332, -1.028986, 1.396524, 1, 1, 1, 1, 1,
0.6208064, 0.2362174, 2.123258, 1, 1, 1, 1, 1,
0.6209106, -0.1350666, 0.9367037, 1, 1, 1, 1, 1,
0.622668, -0.757552, 2.09517, 1, 1, 1, 1, 1,
0.6236324, 0.9883906, 0.66368, 1, 1, 1, 1, 1,
0.6263574, 0.3476796, 0.6365712, 0, 0, 1, 1, 1,
0.6268142, 2.050248, 0.969323, 1, 0, 0, 1, 1,
0.6284654, -1.990042, 3.023147, 1, 0, 0, 1, 1,
0.6294903, -0.4058101, 2.615186, 1, 0, 0, 1, 1,
0.6338039, 2.056839, 2.454392, 1, 0, 0, 1, 1,
0.6360843, 0.2990076, -0.1443392, 1, 0, 0, 1, 1,
0.6384291, 2.291755, 0.2485221, 0, 0, 0, 1, 1,
0.6411668, 0.9075968, 0.6006249, 0, 0, 0, 1, 1,
0.6446168, 1.652245, -0.7843085, 0, 0, 0, 1, 1,
0.6451071, -1.293016, 3.423754, 0, 0, 0, 1, 1,
0.6467794, -1.354537, 3.813333, 0, 0, 0, 1, 1,
0.650694, 0.786037, 0.5320224, 0, 0, 0, 1, 1,
0.6597465, -0.4302126, 4.131288, 0, 0, 0, 1, 1,
0.663572, 0.27641, 2.291625, 1, 1, 1, 1, 1,
0.6672178, 1.520507, -1.029628, 1, 1, 1, 1, 1,
0.6683838, -1.15001, 2.997706, 1, 1, 1, 1, 1,
0.6699926, 0.3953142, 0.7960428, 1, 1, 1, 1, 1,
0.6718856, -1.044084, 1.250587, 1, 1, 1, 1, 1,
0.6737275, 0.8832439, 0.5195826, 1, 1, 1, 1, 1,
0.6807878, 1.278346, -1.114966, 1, 1, 1, 1, 1,
0.6839612, -0.2515672, -0.1867031, 1, 1, 1, 1, 1,
0.6893767, -0.4081208, 0.6112524, 1, 1, 1, 1, 1,
0.6907459, -0.3480252, 2.178112, 1, 1, 1, 1, 1,
0.6943599, -1.355966, 1.822676, 1, 1, 1, 1, 1,
0.6993278, 1.18266, 0.01503706, 1, 1, 1, 1, 1,
0.7007852, 0.1090115, -0.008361127, 1, 1, 1, 1, 1,
0.7009416, -0.9843484, 3.591662, 1, 1, 1, 1, 1,
0.7095768, -0.7413727, 2.247849, 1, 1, 1, 1, 1,
0.7100776, 1.047877, 0.6412926, 0, 0, 1, 1, 1,
0.7126356, -0.4829568, 2.103135, 1, 0, 0, 1, 1,
0.7179716, -0.2741615, 3.042459, 1, 0, 0, 1, 1,
0.7185131, -1.923571, 2.524137, 1, 0, 0, 1, 1,
0.7209744, 0.03264438, 2.542994, 1, 0, 0, 1, 1,
0.7218387, -0.5073156, 4.044906, 1, 0, 0, 1, 1,
0.7245911, 1.236998, 0.8419994, 0, 0, 0, 1, 1,
0.7248182, 0.2145002, 0.6617539, 0, 0, 0, 1, 1,
0.7258378, 0.3664362, 1.291722, 0, 0, 0, 1, 1,
0.7276686, 0.9080387, -0.7840706, 0, 0, 0, 1, 1,
0.7283525, -0.08188464, 0.9639042, 0, 0, 0, 1, 1,
0.7287698, 0.07248273, 1.644343, 0, 0, 0, 1, 1,
0.7327286, 0.963943, 0.6819452, 0, 0, 0, 1, 1,
0.7353174, 0.2399631, -0.3156859, 1, 1, 1, 1, 1,
0.7399967, 0.01224904, 1.583128, 1, 1, 1, 1, 1,
0.7425612, -0.6280652, 2.372618, 1, 1, 1, 1, 1,
0.7449402, 0.7478687, -0.01909687, 1, 1, 1, 1, 1,
0.7451794, -0.02521758, 2.666759, 1, 1, 1, 1, 1,
0.7497559, -0.3923246, 2.00931, 1, 1, 1, 1, 1,
0.7552078, 0.3247654, 0.8534192, 1, 1, 1, 1, 1,
0.75854, 0.6562988, 1.262593, 1, 1, 1, 1, 1,
0.7678944, 0.404688, 1.172753, 1, 1, 1, 1, 1,
0.7791486, -0.7817165, 3.125606, 1, 1, 1, 1, 1,
0.7801027, 0.008234329, 2.333394, 1, 1, 1, 1, 1,
0.7814767, -1.330141, 2.023449, 1, 1, 1, 1, 1,
0.7868122, -3.105843, 1.651464, 1, 1, 1, 1, 1,
0.787735, 1.096519, 0.1203618, 1, 1, 1, 1, 1,
0.7884854, -3.004823, 2.37767, 1, 1, 1, 1, 1,
0.792821, -0.4668455, 2.607592, 0, 0, 1, 1, 1,
0.797106, 2.09253, 0.4396905, 1, 0, 0, 1, 1,
0.7971429, -0.9729092, 1.940477, 1, 0, 0, 1, 1,
0.7991726, 1.524858, 0.5804228, 1, 0, 0, 1, 1,
0.7997246, -0.04721672, 1.182647, 1, 0, 0, 1, 1,
0.8033907, -0.4999517, 2.153125, 1, 0, 0, 1, 1,
0.8034971, -1.101477, 1.9487, 0, 0, 0, 1, 1,
0.8044149, 0.9684577, 1.204632, 0, 0, 0, 1, 1,
0.8073996, -1.065056, 4.170197, 0, 0, 0, 1, 1,
0.8116235, 0.2809076, 1.199329, 0, 0, 0, 1, 1,
0.8162504, 0.1673827, -0.3661183, 0, 0, 0, 1, 1,
0.8205892, 0.5390611, 1.885866, 0, 0, 0, 1, 1,
0.8278105, 2.497648, 2.255513, 0, 0, 0, 1, 1,
0.8280897, 0.6057928, 0.9749035, 1, 1, 1, 1, 1,
0.8286098, 0.6933633, 1.511471, 1, 1, 1, 1, 1,
0.82876, -0.1867105, 1.023587, 1, 1, 1, 1, 1,
0.8308753, 0.4871671, 1.230077, 1, 1, 1, 1, 1,
0.8359503, 0.9760945, -0.8131569, 1, 1, 1, 1, 1,
0.8392752, 0.09716271, 1.595057, 1, 1, 1, 1, 1,
0.8450854, 0.2928343, -0.6314177, 1, 1, 1, 1, 1,
0.855327, -1.208039, 3.436841, 1, 1, 1, 1, 1,
0.8581843, 0.7490606, 0.8650818, 1, 1, 1, 1, 1,
0.8590645, 0.544899, 1.294092, 1, 1, 1, 1, 1,
0.8592577, -0.8657096, 1.37421, 1, 1, 1, 1, 1,
0.8651706, 1.581144, 0.638121, 1, 1, 1, 1, 1,
0.869365, 0.101532, 2.298723, 1, 1, 1, 1, 1,
0.8744369, -0.0001852096, 2.087533, 1, 1, 1, 1, 1,
0.8866961, 3.14319, 0.4772527, 1, 1, 1, 1, 1,
0.8949658, -1.477336, 2.315073, 0, 0, 1, 1, 1,
0.8957128, 0.07127471, 0.8278098, 1, 0, 0, 1, 1,
0.9073026, -0.2026126, 0.3990083, 1, 0, 0, 1, 1,
0.9082749, 0.248066, 2.02453, 1, 0, 0, 1, 1,
0.9089864, -0.9144136, 3.745558, 1, 0, 0, 1, 1,
0.9111544, 0.3435613, 0.9825104, 1, 0, 0, 1, 1,
0.9135336, 0.4913129, 0.8663106, 0, 0, 0, 1, 1,
0.9259942, 0.3647706, 0.4717213, 0, 0, 0, 1, 1,
0.9307677, 0.04266138, 2.529576, 0, 0, 0, 1, 1,
0.9310422, 0.5553439, 2.39576, 0, 0, 0, 1, 1,
0.9324139, -0.5501497, 2.532297, 0, 0, 0, 1, 1,
0.9444407, -0.9623802, 4.838694, 0, 0, 0, 1, 1,
0.9492057, 0.4155732, 1.103779, 0, 0, 0, 1, 1,
0.9538869, -0.7126368, 1.380976, 1, 1, 1, 1, 1,
0.9539071, 1.939389, 0.6979084, 1, 1, 1, 1, 1,
0.9547225, -0.4128848, 2.87384, 1, 1, 1, 1, 1,
0.9549564, -0.3607113, 3.356802, 1, 1, 1, 1, 1,
0.9581231, -1.360871, 4.31298, 1, 1, 1, 1, 1,
0.9607574, -1.125494, 2.236322, 1, 1, 1, 1, 1,
0.9613266, 0.8917542, 0.6803588, 1, 1, 1, 1, 1,
0.9635409, 0.03176613, 2.685023, 1, 1, 1, 1, 1,
0.968644, -2.044027, 1.269571, 1, 1, 1, 1, 1,
0.9701619, 0.5260832, 1.139973, 1, 1, 1, 1, 1,
0.9767408, 0.8503275, 1.281571, 1, 1, 1, 1, 1,
0.9803317, 0.9277099, 0.4565815, 1, 1, 1, 1, 1,
0.9835938, 1.556868, 2.546389, 1, 1, 1, 1, 1,
0.9883952, -0.3712543, 1.779437, 1, 1, 1, 1, 1,
0.9910203, 2.796877, 0.2196872, 1, 1, 1, 1, 1,
0.9986112, -1.691706, 2.574769, 0, 0, 1, 1, 1,
0.9993005, -1.800283, 2.747578, 1, 0, 0, 1, 1,
1.002996, 1.315169, 1.946795, 1, 0, 0, 1, 1,
1.009879, -0.5487548, 1.374081, 1, 0, 0, 1, 1,
1.021755, -0.04502564, 2.563575, 1, 0, 0, 1, 1,
1.026166, 0.2841457, 1.557563, 1, 0, 0, 1, 1,
1.028617, -1.243774, 3.694572, 0, 0, 0, 1, 1,
1.031137, -0.3910593, 2.121173, 0, 0, 0, 1, 1,
1.055088, -1.091104, 2.917282, 0, 0, 0, 1, 1,
1.055479, -0.1988137, 1.033055, 0, 0, 0, 1, 1,
1.055883, -0.7166578, 1.728055, 0, 0, 0, 1, 1,
1.057606, -0.4176274, 1.656956, 0, 0, 0, 1, 1,
1.059075, 0.1505506, 1.162552, 0, 0, 0, 1, 1,
1.062033, -0.4943939, 1.335736, 1, 1, 1, 1, 1,
1.063265, -0.2559422, 1.50064, 1, 1, 1, 1, 1,
1.064444, 0.173397, 1.454472, 1, 1, 1, 1, 1,
1.071349, 0.3061453, 2.246224, 1, 1, 1, 1, 1,
1.073607, 1.694406, -0.1940045, 1, 1, 1, 1, 1,
1.074216, -1.567309, 3.127953, 1, 1, 1, 1, 1,
1.080395, 0.556657, 1.843059, 1, 1, 1, 1, 1,
1.080548, -0.5299124, 1.822064, 1, 1, 1, 1, 1,
1.092799, 0.6927463, 1.174308, 1, 1, 1, 1, 1,
1.092823, -1.654611, 1.253816, 1, 1, 1, 1, 1,
1.09983, 0.8563871, 0.3532722, 1, 1, 1, 1, 1,
1.104056, 2.249461, 1.01384, 1, 1, 1, 1, 1,
1.108774, -1.673677, 3.411407, 1, 1, 1, 1, 1,
1.113661, 0.2629476, 3.346755, 1, 1, 1, 1, 1,
1.1196, -0.9352966, 3.437988, 1, 1, 1, 1, 1,
1.130785, 0.6067879, 0.2392389, 0, 0, 1, 1, 1,
1.137587, -2.033513, 3.181242, 1, 0, 0, 1, 1,
1.14856, 1.390258, 1.495151, 1, 0, 0, 1, 1,
1.149233, -1.227836, 0.881635, 1, 0, 0, 1, 1,
1.153808, -0.4315228, 4.019303, 1, 0, 0, 1, 1,
1.160881, 0.9996806, -0.003620601, 1, 0, 0, 1, 1,
1.16602, 0.1065872, 1.090636, 0, 0, 0, 1, 1,
1.167375, 0.7946888, 3.337869, 0, 0, 0, 1, 1,
1.169304, 1.040667, 0.3183193, 0, 0, 0, 1, 1,
1.173224, -0.9724141, 1.749386, 0, 0, 0, 1, 1,
1.178359, 0.5117216, 1.389704, 0, 0, 0, 1, 1,
1.180806, 1.382867, -0.7386486, 0, 0, 0, 1, 1,
1.189195, 0.720962, 0.7704168, 0, 0, 0, 1, 1,
1.195723, -0.9392923, 1.351375, 1, 1, 1, 1, 1,
1.197914, -0.4708194, 1.886458, 1, 1, 1, 1, 1,
1.198017, 2.087452, -0.7070358, 1, 1, 1, 1, 1,
1.205644, 1.325372, 0.231638, 1, 1, 1, 1, 1,
1.212232, 0.5123177, 1.190859, 1, 1, 1, 1, 1,
1.221257, 0.6249634, 0.3586671, 1, 1, 1, 1, 1,
1.224365, -1.737853, 3.804483, 1, 1, 1, 1, 1,
1.228686, -0.3137548, 0.2177238, 1, 1, 1, 1, 1,
1.239575, 0.7520883, 1.60942, 1, 1, 1, 1, 1,
1.244677, -1.296772, 2.221932, 1, 1, 1, 1, 1,
1.24637, -0.3135595, 2.421346, 1, 1, 1, 1, 1,
1.252477, 0.1176107, 1.73222, 1, 1, 1, 1, 1,
1.260547, -1.605125, 2.472255, 1, 1, 1, 1, 1,
1.264442, 0.7551863, 1.425884, 1, 1, 1, 1, 1,
1.265618, 0.4713054, 1.015147, 1, 1, 1, 1, 1,
1.27514, 2.089381, 1.427573, 0, 0, 1, 1, 1,
1.283942, 0.2693478, 0.2288947, 1, 0, 0, 1, 1,
1.286077, 1.191479, 1.087782, 1, 0, 0, 1, 1,
1.29569, -0.6117678, 2.855545, 1, 0, 0, 1, 1,
1.296412, -0.1137597, 1.638816, 1, 0, 0, 1, 1,
1.299673, 3.328412, -0.946459, 1, 0, 0, 1, 1,
1.300063, 0.8330676, -0.2252945, 0, 0, 0, 1, 1,
1.309991, 0.6119646, 1.504551, 0, 0, 0, 1, 1,
1.315925, 2.551253, 1.162462, 0, 0, 0, 1, 1,
1.323781, -0.6187671, 2.799539, 0, 0, 0, 1, 1,
1.32495, 0.34721, 0.6815545, 0, 0, 0, 1, 1,
1.326943, -0.1710252, 2.957485, 0, 0, 0, 1, 1,
1.329376, -0.847743, 2.977141, 0, 0, 0, 1, 1,
1.345971, 1.060576, 1.08472, 1, 1, 1, 1, 1,
1.348974, -1.304963, 2.758754, 1, 1, 1, 1, 1,
1.352504, -0.195266, 0.9542261, 1, 1, 1, 1, 1,
1.369156, 0.5395085, -0.9363299, 1, 1, 1, 1, 1,
1.375868, -1.201082, 2.145191, 1, 1, 1, 1, 1,
1.383756, 0.2203608, 0.821794, 1, 1, 1, 1, 1,
1.389519, 0.5168442, 0.5809948, 1, 1, 1, 1, 1,
1.394305, -0.454905, 3.733954, 1, 1, 1, 1, 1,
1.397266, 1.760572, 0.5907835, 1, 1, 1, 1, 1,
1.413807, -0.8271906, 2.490782, 1, 1, 1, 1, 1,
1.420277, -1.124486, 2.029959, 1, 1, 1, 1, 1,
1.426257, 0.3835503, 1.51371, 1, 1, 1, 1, 1,
1.444485, -1.671131, 1.063852, 1, 1, 1, 1, 1,
1.457566, 0.658542, 0.7591797, 1, 1, 1, 1, 1,
1.45839, 1.353332, 0.9046466, 1, 1, 1, 1, 1,
1.485639, -0.8697481, 2.383217, 0, 0, 1, 1, 1,
1.495734, 0.3568359, 2.178499, 1, 0, 0, 1, 1,
1.496085, 0.6017275, 2.154032, 1, 0, 0, 1, 1,
1.498942, 0.286182, 1.506966, 1, 0, 0, 1, 1,
1.499771, 0.4820797, 0.4339249, 1, 0, 0, 1, 1,
1.518944, -0.2752221, 1.365769, 1, 0, 0, 1, 1,
1.531621, 0.115683, 4.257513, 0, 0, 0, 1, 1,
1.540123, -1.180029, 2.44924, 0, 0, 0, 1, 1,
1.545986, 0.03090566, 0.1284614, 0, 0, 0, 1, 1,
1.551955, 0.8746312, 0.7106591, 0, 0, 0, 1, 1,
1.559899, 2.63652, 0.5283153, 0, 0, 0, 1, 1,
1.570457, -1.133684, 1.381801, 0, 0, 0, 1, 1,
1.602748, 1.235354, 2.279164, 0, 0, 0, 1, 1,
1.607503, -0.5118739, 2.540824, 1, 1, 1, 1, 1,
1.607563, 0.06709821, 2.375009, 1, 1, 1, 1, 1,
1.612862, 0.7925237, 1.756508, 1, 1, 1, 1, 1,
1.615249, -0.5902003, 1.716226, 1, 1, 1, 1, 1,
1.63468, -1.144953, 1.312028, 1, 1, 1, 1, 1,
1.643445, -0.6841844, 3.24747, 1, 1, 1, 1, 1,
1.650703, -0.2721464, 1.12632, 1, 1, 1, 1, 1,
1.660621, -0.9674614, 0.2263225, 1, 1, 1, 1, 1,
1.677645, -0.1309863, 1.790713, 1, 1, 1, 1, 1,
1.684149, -0.6623412, 3.034609, 1, 1, 1, 1, 1,
1.701308, 0.1854989, 1.804807, 1, 1, 1, 1, 1,
1.714389, -1.450618, 2.745432, 1, 1, 1, 1, 1,
1.716056, -0.936658, 3.160167, 1, 1, 1, 1, 1,
1.721967, -0.02078911, 0.7296002, 1, 1, 1, 1, 1,
1.727875, -0.4218, 1.660246, 1, 1, 1, 1, 1,
1.73855, 1.779225, 1.534077, 0, 0, 1, 1, 1,
1.741527, -0.6251228, 0.8707947, 1, 0, 0, 1, 1,
1.744143, 0.7320042, 0.2297572, 1, 0, 0, 1, 1,
1.757259, -0.3327753, 1.749714, 1, 0, 0, 1, 1,
1.761954, 0.5991706, 1.2199, 1, 0, 0, 1, 1,
1.767701, -1.553033, 1.872091, 1, 0, 0, 1, 1,
1.782814, -1.651576, 0.8027227, 0, 0, 0, 1, 1,
1.785825, 1.28693, 1.186152, 0, 0, 0, 1, 1,
1.787426, -1.051178, 2.569961, 0, 0, 0, 1, 1,
1.795144, 0.04876703, 2.875872, 0, 0, 0, 1, 1,
1.814457, 0.1376983, 0.7532803, 0, 0, 0, 1, 1,
1.830472, 2.239544, 0.5511023, 0, 0, 0, 1, 1,
1.831687, 0.6702401, 1.919601, 0, 0, 0, 1, 1,
1.884521, 0.08464399, 2.869938, 1, 1, 1, 1, 1,
1.907065, -0.2989373, 2.365941, 1, 1, 1, 1, 1,
1.920314, 1.487348, -0.3749003, 1, 1, 1, 1, 1,
1.922378, -0.21191, 1.617125, 1, 1, 1, 1, 1,
1.956401, 0.9008344, 0.6651679, 1, 1, 1, 1, 1,
1.956513, 0.5804145, 1.994299, 1, 1, 1, 1, 1,
1.961327, -0.8304845, 0.6065206, 1, 1, 1, 1, 1,
1.975934, 0.3843126, 2.07608, 1, 1, 1, 1, 1,
1.978348, 1.496525, -0.7430359, 1, 1, 1, 1, 1,
2.004889, 2.717978, 0.7318159, 1, 1, 1, 1, 1,
2.004961, 1.953595, -0.1095789, 1, 1, 1, 1, 1,
2.007565, 0.4518842, -0.04496968, 1, 1, 1, 1, 1,
2.016275, 0.9067615, 0.9895571, 1, 1, 1, 1, 1,
2.031091, 0.2606733, 1.690943, 1, 1, 1, 1, 1,
2.033853, 0.4494336, 1.347202, 1, 1, 1, 1, 1,
2.034193, 0.5725904, 2.095623, 0, 0, 1, 1, 1,
2.045773, 0.3852961, 1.806449, 1, 0, 0, 1, 1,
2.048101, -0.5985457, 0.9962826, 1, 0, 0, 1, 1,
2.073469, -0.08193223, 0.8373073, 1, 0, 0, 1, 1,
2.125267, 1.025269, -0.00785279, 1, 0, 0, 1, 1,
2.196095, 0.8460324, 1.039506, 1, 0, 0, 1, 1,
2.206512, -1.815821, 3.807106, 0, 0, 0, 1, 1,
2.211384, 0.9656428, 1.485334, 0, 0, 0, 1, 1,
2.214047, -0.2347969, 0.5875914, 0, 0, 0, 1, 1,
2.221314, 0.3438988, -1.009615, 0, 0, 0, 1, 1,
2.25375, -0.19703, 2.616134, 0, 0, 0, 1, 1,
2.27599, 1.391334, -0.02499321, 0, 0, 0, 1, 1,
2.283109, -0.2253923, 0.8501423, 0, 0, 0, 1, 1,
2.302885, -0.7001391, 2.216143, 1, 1, 1, 1, 1,
2.421931, -0.8111371, 0.4971793, 1, 1, 1, 1, 1,
2.581549, 0.9710948, 1.266178, 1, 1, 1, 1, 1,
2.65327, -2.204081, -0.009114569, 1, 1, 1, 1, 1,
2.720137, 0.6209176, 1.917926, 1, 1, 1, 1, 1,
3.146214, 1.352565, 1.625664, 1, 1, 1, 1, 1,
3.277479, 0.5159605, 1.764883, 1, 1, 1, 1, 1
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
var radius = 9.809152;
var distance = 34.45424;
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
mvMatrix.translate( 0.004688025, -0.1112845, 0.5109174 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45424);
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