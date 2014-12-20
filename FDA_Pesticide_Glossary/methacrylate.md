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
-3.289679, -0.724573, -2.866659, 1, 0, 0, 1,
-2.916586, 0.01214282, -1.53202, 1, 0.007843138, 0, 1,
-2.739239, -0.3770436, -0.9102365, 1, 0.01176471, 0, 1,
-2.735281, -1.56072, -1.51695, 1, 0.01960784, 0, 1,
-2.635803, 0.050509, -3.306355, 1, 0.02352941, 0, 1,
-2.628962, 0.9539737, -1.859559, 1, 0.03137255, 0, 1,
-2.52741, 1.513118, -1.292063, 1, 0.03529412, 0, 1,
-2.380134, -0.6928356, -2.006931, 1, 0.04313726, 0, 1,
-2.335868, -0.1339925, -1.697722, 1, 0.04705882, 0, 1,
-2.323342, 0.2914975, -1.165905, 1, 0.05490196, 0, 1,
-2.281043, 0.5032472, -0.5310208, 1, 0.05882353, 0, 1,
-2.267639, 1.581248, -3.659603, 1, 0.06666667, 0, 1,
-2.189273, -1.25685, -3.324012, 1, 0.07058824, 0, 1,
-2.173823, 0.04075128, -2.265598, 1, 0.07843138, 0, 1,
-2.155358, 0.7833055, -0.6577465, 1, 0.08235294, 0, 1,
-2.11114, 0.7516705, -1.329262, 1, 0.09019608, 0, 1,
-2.064502, -0.3959728, 1.113292, 1, 0.09411765, 0, 1,
-2.037513, -0.307441, -1.493183, 1, 0.1019608, 0, 1,
-2.036611, 0.4905927, -3.870082, 1, 0.1098039, 0, 1,
-1.96808, 0.6080377, -1.062856, 1, 0.1137255, 0, 1,
-1.91146, 0.05025016, -3.784354, 1, 0.1215686, 0, 1,
-1.91146, -0.157018, -2.240642, 1, 0.1254902, 0, 1,
-1.905335, -0.2310219, 0.4475736, 1, 0.1333333, 0, 1,
-1.875437, 0.4054895, -1.572955, 1, 0.1372549, 0, 1,
-1.875115, -1.547969, -0.8250581, 1, 0.145098, 0, 1,
-1.863481, 0.7293998, -2.100202, 1, 0.1490196, 0, 1,
-1.853225, -1.81312, -2.945133, 1, 0.1568628, 0, 1,
-1.845341, 0.1558911, -1.701202, 1, 0.1607843, 0, 1,
-1.83712, 0.4259954, -2.332498, 1, 0.1686275, 0, 1,
-1.835642, 0.3349127, -0.3275715, 1, 0.172549, 0, 1,
-1.834978, 0.2620019, -1.903512, 1, 0.1803922, 0, 1,
-1.831765, 2.431889, 0.279623, 1, 0.1843137, 0, 1,
-1.82435, 1.835989, -1.119776, 1, 0.1921569, 0, 1,
-1.823438, 0.9209868, -1.69581, 1, 0.1960784, 0, 1,
-1.819046, -0.195822, -1.859799, 1, 0.2039216, 0, 1,
-1.814945, 0.4361765, -2.570619, 1, 0.2117647, 0, 1,
-1.802993, -0.176188, -1.186337, 1, 0.2156863, 0, 1,
-1.785399, -0.1590784, -2.557216, 1, 0.2235294, 0, 1,
-1.765417, -1.253073, -1.274777, 1, 0.227451, 0, 1,
-1.748366, 0.5590398, 0.4512629, 1, 0.2352941, 0, 1,
-1.731271, 0.5144052, -3.349974, 1, 0.2392157, 0, 1,
-1.726209, 0.9598304, -1.993155, 1, 0.2470588, 0, 1,
-1.726145, 0.5898437, -2.556216, 1, 0.2509804, 0, 1,
-1.719831, -1.099821, -1.554369, 1, 0.2588235, 0, 1,
-1.711408, -0.3979363, -1.957056, 1, 0.2627451, 0, 1,
-1.711099, 1.269948, 0.6046844, 1, 0.2705882, 0, 1,
-1.70592, -0.6596542, -0.3365742, 1, 0.2745098, 0, 1,
-1.699599, -1.769072, -2.281871, 1, 0.282353, 0, 1,
-1.690007, -0.2832468, -3.75161, 1, 0.2862745, 0, 1,
-1.684644, -0.6071892, -1.9804, 1, 0.2941177, 0, 1,
-1.674808, 0.2474487, -1.357699, 1, 0.3019608, 0, 1,
-1.66039, -0.3718366, -1.511447, 1, 0.3058824, 0, 1,
-1.648916, 1.8201, 0.7765272, 1, 0.3137255, 0, 1,
-1.637788, -0.09791905, -0.7071431, 1, 0.3176471, 0, 1,
-1.637082, -0.4781795, -2.830201, 1, 0.3254902, 0, 1,
-1.63343, -0.3705124, 0.1389575, 1, 0.3294118, 0, 1,
-1.624421, -1.101148, -2.220292, 1, 0.3372549, 0, 1,
-1.614776, -0.3923112, -4.106563, 1, 0.3411765, 0, 1,
-1.608526, 0.4514618, -1.259037, 1, 0.3490196, 0, 1,
-1.583884, -0.5261288, -1.50818, 1, 0.3529412, 0, 1,
-1.571899, -0.9636926, -3.566813, 1, 0.3607843, 0, 1,
-1.570293, 0.2572516, -1.949294, 1, 0.3647059, 0, 1,
-1.556706, -0.1480534, -2.765076, 1, 0.372549, 0, 1,
-1.54753, 0.7499767, -1.719646, 1, 0.3764706, 0, 1,
-1.54065, -1.290581, -3.552182, 1, 0.3843137, 0, 1,
-1.538921, -1.238989, -1.113554, 1, 0.3882353, 0, 1,
-1.524877, -0.3368012, -1.938793, 1, 0.3960784, 0, 1,
-1.51506, -0.9181458, -1.630047, 1, 0.4039216, 0, 1,
-1.511691, 1.505203, -1.743253, 1, 0.4078431, 0, 1,
-1.497684, 1.351096, -0.3138601, 1, 0.4156863, 0, 1,
-1.486271, -1.195912, -2.702144, 1, 0.4196078, 0, 1,
-1.485773, 1.411949, -0.8992555, 1, 0.427451, 0, 1,
-1.46104, 0.9251127, -2.838982, 1, 0.4313726, 0, 1,
-1.458354, 0.5372297, -2.220233, 1, 0.4392157, 0, 1,
-1.440488, -0.2633435, -1.054493, 1, 0.4431373, 0, 1,
-1.438346, -0.08114254, -0.7727922, 1, 0.4509804, 0, 1,
-1.423423, -0.0670227, -1.616607, 1, 0.454902, 0, 1,
-1.417465, -1.338071, -2.397482, 1, 0.4627451, 0, 1,
-1.40874, 0.5904509, -2.329011, 1, 0.4666667, 0, 1,
-1.390155, -0.31421, -2.924171, 1, 0.4745098, 0, 1,
-1.383616, -0.01059521, -1.284663, 1, 0.4784314, 0, 1,
-1.377154, 1.2567, -0.9450939, 1, 0.4862745, 0, 1,
-1.376977, -0.06485516, -1.80442, 1, 0.4901961, 0, 1,
-1.371609, -0.3871966, -1.908438, 1, 0.4980392, 0, 1,
-1.366119, 1.069842, 0.368259, 1, 0.5058824, 0, 1,
-1.360294, -0.03466209, 0.07002437, 1, 0.509804, 0, 1,
-1.350428, 0.425051, -0.3689885, 1, 0.5176471, 0, 1,
-1.346344, 1.279901, -1.86679, 1, 0.5215687, 0, 1,
-1.346184, -0.2982256, -2.791132, 1, 0.5294118, 0, 1,
-1.346137, -0.6132921, -1.438413, 1, 0.5333334, 0, 1,
-1.345879, -0.2918221, -3.262614, 1, 0.5411765, 0, 1,
-1.341973, 0.6847906, -0.3867548, 1, 0.5450981, 0, 1,
-1.327929, -0.8587885, -1.962114, 1, 0.5529412, 0, 1,
-1.321575, -1.350812, -2.559545, 1, 0.5568628, 0, 1,
-1.304125, -1.10148, -3.11759, 1, 0.5647059, 0, 1,
-1.303821, 0.9587252, -1.846415, 1, 0.5686275, 0, 1,
-1.301436, -0.8584396, -3.258824, 1, 0.5764706, 0, 1,
-1.287956, -1.40451, -1.536773, 1, 0.5803922, 0, 1,
-1.287327, -0.6069782, -2.467961, 1, 0.5882353, 0, 1,
-1.285062, -1.137137, -2.148947, 1, 0.5921569, 0, 1,
-1.283075, 0.7754436, -0.6174979, 1, 0.6, 0, 1,
-1.274774, 1.648616, -2.154943, 1, 0.6078432, 0, 1,
-1.274256, -0.4878525, -2.361222, 1, 0.6117647, 0, 1,
-1.263549, -0.1779296, -0.1573048, 1, 0.6196079, 0, 1,
-1.253471, -0.001657781, -1.359057, 1, 0.6235294, 0, 1,
-1.248193, -0.05928956, -2.950923, 1, 0.6313726, 0, 1,
-1.24174, -2.441278, -3.169139, 1, 0.6352941, 0, 1,
-1.230611, 0.8202372, -1.021421, 1, 0.6431373, 0, 1,
-1.214178, 0.2681488, -0.6608483, 1, 0.6470588, 0, 1,
-1.209853, 1.408475, 0.8028327, 1, 0.654902, 0, 1,
-1.20652, 0.397279, -1.103351, 1, 0.6588235, 0, 1,
-1.204036, -0.491607, -4.251939, 1, 0.6666667, 0, 1,
-1.197652, -1.85096, -2.453583, 1, 0.6705883, 0, 1,
-1.1918, 0.8301028, 0.1108037, 1, 0.6784314, 0, 1,
-1.173744, -0.6655088, -2.329781, 1, 0.682353, 0, 1,
-1.172526, 0.8876122, -1.352511, 1, 0.6901961, 0, 1,
-1.172262, -1.284605, -2.304191, 1, 0.6941177, 0, 1,
-1.162966, 0.03817884, -1.511156, 1, 0.7019608, 0, 1,
-1.162036, -0.3919209, -3.08913, 1, 0.7098039, 0, 1,
-1.157014, -0.5238895, -2.145061, 1, 0.7137255, 0, 1,
-1.153812, 0.5538507, -3.184392, 1, 0.7215686, 0, 1,
-1.152492, 1.294625, -0.9785053, 1, 0.7254902, 0, 1,
-1.150164, 0.01708854, -2.46879, 1, 0.7333333, 0, 1,
-1.147004, -0.4681507, -2.438287, 1, 0.7372549, 0, 1,
-1.142469, 1.358471, -0.07467812, 1, 0.7450981, 0, 1,
-1.138412, 1.445763, -2.228858, 1, 0.7490196, 0, 1,
-1.138255, 0.2689775, -1.801646, 1, 0.7568628, 0, 1,
-1.138015, -1.271273, -3.038043, 1, 0.7607843, 0, 1,
-1.132718, -1.58124, -2.759782, 1, 0.7686275, 0, 1,
-1.128183, 0.8878065, 0.3710583, 1, 0.772549, 0, 1,
-1.121121, -2.789207, -3.247834, 1, 0.7803922, 0, 1,
-1.121022, -1.330322, -2.903764, 1, 0.7843137, 0, 1,
-1.11988, -0.649812, -1.390119, 1, 0.7921569, 0, 1,
-1.116566, 0.4514629, -2.233446, 1, 0.7960784, 0, 1,
-1.112886, 1.306412, -1.675736, 1, 0.8039216, 0, 1,
-1.112227, 0.1444273, -1.323855, 1, 0.8117647, 0, 1,
-1.109654, -0.6815197, -2.869254, 1, 0.8156863, 0, 1,
-1.105586, 0.451479, -0.07499097, 1, 0.8235294, 0, 1,
-1.10162, 0.8888043, -1.549119, 1, 0.827451, 0, 1,
-1.093079, -1.326021, -1.07844, 1, 0.8352941, 0, 1,
-1.090058, -0.4627687, -2.081369, 1, 0.8392157, 0, 1,
-1.084568, 1.105472, -1.102727, 1, 0.8470588, 0, 1,
-1.083545, 0.4392102, -1.1999, 1, 0.8509804, 0, 1,
-1.077365, -0.6946213, -2.05697, 1, 0.8588235, 0, 1,
-1.070361, 0.2722278, -2.39707, 1, 0.8627451, 0, 1,
-1.064355, 1.799852, -1.193525, 1, 0.8705882, 0, 1,
-1.060248, -0.4991415, -2.492634, 1, 0.8745098, 0, 1,
-1.05077, -0.04629704, -3.310198, 1, 0.8823529, 0, 1,
-1.047692, -0.9537587, -2.669302, 1, 0.8862745, 0, 1,
-1.02792, 1.348916, 0.6882052, 1, 0.8941177, 0, 1,
-1.021141, 0.6984525, -0.2515742, 1, 0.8980392, 0, 1,
-1.020417, 1.6605, 0.481895, 1, 0.9058824, 0, 1,
-1.010982, -0.3123524, -2.055262, 1, 0.9137255, 0, 1,
-0.9950384, 0.3485926, -2.662899, 1, 0.9176471, 0, 1,
-0.9924779, -0.9160779, -1.680183, 1, 0.9254902, 0, 1,
-0.9862912, -0.5848832, -3.478809, 1, 0.9294118, 0, 1,
-0.9558988, -0.1775885, -2.547047, 1, 0.9372549, 0, 1,
-0.9530278, 1.93589, 0.5520385, 1, 0.9411765, 0, 1,
-0.945492, -0.3326403, -1.056993, 1, 0.9490196, 0, 1,
-0.9427874, -0.4866114, -1.989106, 1, 0.9529412, 0, 1,
-0.9360462, -0.3661769, -3.009354, 1, 0.9607843, 0, 1,
-0.9346035, -1.087236, -2.455027, 1, 0.9647059, 0, 1,
-0.930432, 1.961167, -0.2746138, 1, 0.972549, 0, 1,
-0.9301551, -0.3500321, -0.9388871, 1, 0.9764706, 0, 1,
-0.9275243, -0.7502109, -2.865183, 1, 0.9843137, 0, 1,
-0.9239503, 0.1560195, -0.02189304, 1, 0.9882353, 0, 1,
-0.9203225, -0.1591387, -2.451705, 1, 0.9960784, 0, 1,
-0.9188274, 0.2691158, -1.466874, 0.9960784, 1, 0, 1,
-0.917724, -0.9867993, -1.457996, 0.9921569, 1, 0, 1,
-0.9156227, -0.719327, -2.744257, 0.9843137, 1, 0, 1,
-0.9107073, -1.006535, -2.628172, 0.9803922, 1, 0, 1,
-0.9041127, -0.09664159, -0.3889906, 0.972549, 1, 0, 1,
-0.8961932, 1.445585, -0.5090626, 0.9686275, 1, 0, 1,
-0.8954597, -0.3294333, -1.72036, 0.9607843, 1, 0, 1,
-0.8932898, -2.985244, -1.757118, 0.9568627, 1, 0, 1,
-0.884881, -0.1362452, -1.361472, 0.9490196, 1, 0, 1,
-0.8815532, -0.4284168, -2.004566, 0.945098, 1, 0, 1,
-0.8750556, -1.512776, -2.413676, 0.9372549, 1, 0, 1,
-0.8716488, 0.2787233, -0.5792411, 0.9333333, 1, 0, 1,
-0.8679999, -0.07479484, 0.1411646, 0.9254902, 1, 0, 1,
-0.8670884, 1.02695, -0.9583015, 0.9215686, 1, 0, 1,
-0.8661639, 0.513661, -0.4012835, 0.9137255, 1, 0, 1,
-0.8588604, -1.113717, -4.221757, 0.9098039, 1, 0, 1,
-0.8581415, -1.15904, -0.3791735, 0.9019608, 1, 0, 1,
-0.8580405, 1.459794, -1.978161, 0.8941177, 1, 0, 1,
-0.8576986, -0.2060546, -2.699449, 0.8901961, 1, 0, 1,
-0.8506048, -0.1289904, -2.725967, 0.8823529, 1, 0, 1,
-0.8462366, 0.5096637, -2.548163, 0.8784314, 1, 0, 1,
-0.8434557, -0.2770635, -1.291597, 0.8705882, 1, 0, 1,
-0.8422867, -1.097684, -2.135649, 0.8666667, 1, 0, 1,
-0.8417188, -0.3706261, -1.168451, 0.8588235, 1, 0, 1,
-0.8277568, -0.9458717, -1.071809, 0.854902, 1, 0, 1,
-0.8217232, 0.0528004, -1.590567, 0.8470588, 1, 0, 1,
-0.8192348, -0.1499139, -2.582736, 0.8431373, 1, 0, 1,
-0.8183901, 2.276417, 0.01042749, 0.8352941, 1, 0, 1,
-0.8154557, -0.6625787, -2.252288, 0.8313726, 1, 0, 1,
-0.8133793, -0.3381601, -0.5662432, 0.8235294, 1, 0, 1,
-0.8070082, -2.499765, -2.628624, 0.8196079, 1, 0, 1,
-0.8063313, 0.2709267, -0.8421932, 0.8117647, 1, 0, 1,
-0.8030155, -0.2432165, -1.34772, 0.8078431, 1, 0, 1,
-0.8010865, -0.1345928, -1.489381, 0.8, 1, 0, 1,
-0.7954726, -0.2595792, -3.42409, 0.7921569, 1, 0, 1,
-0.7941127, -1.348373, -2.972047, 0.7882353, 1, 0, 1,
-0.7926969, 1.89205, 0.7890973, 0.7803922, 1, 0, 1,
-0.7907997, 1.442093, -0.2892573, 0.7764706, 1, 0, 1,
-0.7872793, -1.548149, -2.943873, 0.7686275, 1, 0, 1,
-0.7832131, -0.5139783, -3.438548, 0.7647059, 1, 0, 1,
-0.7828552, 1.12876, -0.3918275, 0.7568628, 1, 0, 1,
-0.7780245, 0.01238648, -1.026456, 0.7529412, 1, 0, 1,
-0.7778714, -1.937512, -3.702606, 0.7450981, 1, 0, 1,
-0.7772307, -0.3096628, -1.7491, 0.7411765, 1, 0, 1,
-0.7737694, -0.7586901, -1.429438, 0.7333333, 1, 0, 1,
-0.7713596, -0.2523712, 1.077788, 0.7294118, 1, 0, 1,
-0.770556, -0.1564013, -1.757269, 0.7215686, 1, 0, 1,
-0.7694538, -0.1370613, -1.237444, 0.7176471, 1, 0, 1,
-0.7682663, -0.1692034, -2.95926, 0.7098039, 1, 0, 1,
-0.7666752, -0.1621221, -2.913579, 0.7058824, 1, 0, 1,
-0.7653639, 1.636774, -1.126378, 0.6980392, 1, 0, 1,
-0.7624816, -1.120848, -2.747143, 0.6901961, 1, 0, 1,
-0.7559714, 0.3507161, -1.021704, 0.6862745, 1, 0, 1,
-0.7553695, -0.3870718, -2.420509, 0.6784314, 1, 0, 1,
-0.7542372, -1.848342, -2.354501, 0.6745098, 1, 0, 1,
-0.753598, -0.3916112, -1.579936, 0.6666667, 1, 0, 1,
-0.7456844, 0.9449871, 0.6354638, 0.6627451, 1, 0, 1,
-0.7396609, 0.2046981, -0.3378772, 0.654902, 1, 0, 1,
-0.7387312, -0.01426262, -1.972788, 0.6509804, 1, 0, 1,
-0.7376484, 0.04096704, -1.541982, 0.6431373, 1, 0, 1,
-0.736398, -1.826349, -5.331797, 0.6392157, 1, 0, 1,
-0.7284796, 2.53519, 0.5355641, 0.6313726, 1, 0, 1,
-0.72842, 0.2167189, -1.375203, 0.627451, 1, 0, 1,
-0.7239141, 0.3613614, -1.122415, 0.6196079, 1, 0, 1,
-0.7131501, 1.872509, 1.054478, 0.6156863, 1, 0, 1,
-0.7110127, 0.3364612, -0.8287193, 0.6078432, 1, 0, 1,
-0.7025777, -0.5428644, -1.535512, 0.6039216, 1, 0, 1,
-0.6924152, 1.01632, -1.21224, 0.5960785, 1, 0, 1,
-0.6919768, 0.1869927, -0.8405585, 0.5882353, 1, 0, 1,
-0.6905303, -0.9587106, -3.581678, 0.5843138, 1, 0, 1,
-0.6836966, -0.05446628, -2.169336, 0.5764706, 1, 0, 1,
-0.6786034, -0.2850678, -3.164858, 0.572549, 1, 0, 1,
-0.6775372, 0.1976299, -1.501419, 0.5647059, 1, 0, 1,
-0.676374, -0.6333663, -2.5791, 0.5607843, 1, 0, 1,
-0.6761577, -1.066903, -3.29824, 0.5529412, 1, 0, 1,
-0.673502, -0.1275408, -4.080842, 0.5490196, 1, 0, 1,
-0.671407, -0.1862909, -0.7232028, 0.5411765, 1, 0, 1,
-0.6686685, -1.27472, -2.090281, 0.5372549, 1, 0, 1,
-0.6668811, -0.4856268, -2.487663, 0.5294118, 1, 0, 1,
-0.6616011, -0.4314763, -1.416871, 0.5254902, 1, 0, 1,
-0.6611059, -1.40176, -2.616732, 0.5176471, 1, 0, 1,
-0.6567956, 0.6720146, -0.1609155, 0.5137255, 1, 0, 1,
-0.6503375, 0.08085378, -1.222664, 0.5058824, 1, 0, 1,
-0.6469152, 0.2615756, -0.7077661, 0.5019608, 1, 0, 1,
-0.6447288, -0.4395152, -2.806847, 0.4941176, 1, 0, 1,
-0.6432993, 0.4665828, 0.359411, 0.4862745, 1, 0, 1,
-0.6386168, 0.7660294, -1.133363, 0.4823529, 1, 0, 1,
-0.6366317, 1.042383, 0.3897083, 0.4745098, 1, 0, 1,
-0.6286541, 0.6675072, -1.63418, 0.4705882, 1, 0, 1,
-0.6264527, -1.045529, -1.794896, 0.4627451, 1, 0, 1,
-0.6194974, 2.017386, -1.738268, 0.4588235, 1, 0, 1,
-0.6156879, -0.9903253, -2.879352, 0.4509804, 1, 0, 1,
-0.6110793, -0.1327423, -2.092152, 0.4470588, 1, 0, 1,
-0.6062624, 0.4844865, -2.729382, 0.4392157, 1, 0, 1,
-0.6053665, -0.08061479, -2.542919, 0.4352941, 1, 0, 1,
-0.6043938, -1.840375, -2.121926, 0.427451, 1, 0, 1,
-0.6039268, -0.9463711, -3.004356, 0.4235294, 1, 0, 1,
-0.6035041, 0.06822213, -0.6017944, 0.4156863, 1, 0, 1,
-0.5970143, 2.85212, -0.3212241, 0.4117647, 1, 0, 1,
-0.5925149, -1.870161, -3.348767, 0.4039216, 1, 0, 1,
-0.5918244, 0.3415471, -2.424808, 0.3960784, 1, 0, 1,
-0.5851499, 1.446942, 0.2628992, 0.3921569, 1, 0, 1,
-0.5825861, 1.274335, -1.558663, 0.3843137, 1, 0, 1,
-0.5793476, 0.2629276, -0.7213772, 0.3803922, 1, 0, 1,
-0.575443, 0.8310201, -1.425145, 0.372549, 1, 0, 1,
-0.5734715, -2.16317, -2.218409, 0.3686275, 1, 0, 1,
-0.5678169, 0.4405065, -1.873684, 0.3607843, 1, 0, 1,
-0.5677208, -1.501989, -3.40147, 0.3568628, 1, 0, 1,
-0.5647684, 1.473947, -1.382607, 0.3490196, 1, 0, 1,
-0.5631643, -0.7698797, -3.496666, 0.345098, 1, 0, 1,
-0.5533411, -0.2373344, -3.163415, 0.3372549, 1, 0, 1,
-0.5480946, -0.771761, -3.040933, 0.3333333, 1, 0, 1,
-0.5463513, -0.3638856, -0.3374164, 0.3254902, 1, 0, 1,
-0.5439605, -0.1590474, -0.9970038, 0.3215686, 1, 0, 1,
-0.5408667, -1.227164, -3.376316, 0.3137255, 1, 0, 1,
-0.5405499, 0.9112023, -1.0529, 0.3098039, 1, 0, 1,
-0.5259209, 1.886906, -2.044112, 0.3019608, 1, 0, 1,
-0.5253034, -2.309334, -2.842361, 0.2941177, 1, 0, 1,
-0.5239367, 0.532158, 0.9969647, 0.2901961, 1, 0, 1,
-0.5222782, 0.9085151, 0.6812493, 0.282353, 1, 0, 1,
-0.5211741, 0.918558, -1.727446, 0.2784314, 1, 0, 1,
-0.5207598, 1.088304, -1.03076, 0.2705882, 1, 0, 1,
-0.5194528, 0.1163599, -1.335007, 0.2666667, 1, 0, 1,
-0.5162544, -1.834983, -2.631958, 0.2588235, 1, 0, 1,
-0.5148667, -0.09521219, 0.4325467, 0.254902, 1, 0, 1,
-0.5132371, -0.6019564, -3.13169, 0.2470588, 1, 0, 1,
-0.5103528, -0.1126388, -2.237925, 0.2431373, 1, 0, 1,
-0.5101352, -2.087884, -3.60381, 0.2352941, 1, 0, 1,
-0.5084668, 0.917992, 0.9727474, 0.2313726, 1, 0, 1,
-0.5033544, -1.105307, -2.575424, 0.2235294, 1, 0, 1,
-0.4936738, -0.2293185, -0.3452651, 0.2196078, 1, 0, 1,
-0.4875683, -0.2151466, -2.26376, 0.2117647, 1, 0, 1,
-0.4816968, 0.1425679, -2.702259, 0.2078431, 1, 0, 1,
-0.4814296, -0.8709269, -1.182504, 0.2, 1, 0, 1,
-0.480659, 0.285985, -1.487558, 0.1921569, 1, 0, 1,
-0.4796992, 1.351433, -0.2045929, 0.1882353, 1, 0, 1,
-0.4779111, -0.1212722, -1.387188, 0.1803922, 1, 0, 1,
-0.4705857, 0.075849, -2.845806, 0.1764706, 1, 0, 1,
-0.46997, 0.4057426, -1.304538, 0.1686275, 1, 0, 1,
-0.4647925, 0.4776335, -0.2868849, 0.1647059, 1, 0, 1,
-0.4604326, -0.8478581, -3.607864, 0.1568628, 1, 0, 1,
-0.4576753, -0.4681594, -2.726352, 0.1529412, 1, 0, 1,
-0.4554639, 1.676056, -2.224824, 0.145098, 1, 0, 1,
-0.4539889, -0.6961486, -1.628541, 0.1411765, 1, 0, 1,
-0.4519723, -1.060345, -2.405543, 0.1333333, 1, 0, 1,
-0.4470356, -0.3715906, -2.621949, 0.1294118, 1, 0, 1,
-0.4445845, 1.114887, 1.919468, 0.1215686, 1, 0, 1,
-0.4399956, -0.1548775, -2.788158, 0.1176471, 1, 0, 1,
-0.4397524, 1.116515, -0.5041788, 0.1098039, 1, 0, 1,
-0.4387813, 1.079514, -0.9152938, 0.1058824, 1, 0, 1,
-0.4385677, -1.251049, -3.025935, 0.09803922, 1, 0, 1,
-0.4355008, -0.09199434, -3.024881, 0.09019608, 1, 0, 1,
-0.4354732, 0.0247237, -1.611589, 0.08627451, 1, 0, 1,
-0.4309752, 1.18012, -1.148835, 0.07843138, 1, 0, 1,
-0.4256576, 1.068714, 0.05418944, 0.07450981, 1, 0, 1,
-0.4232822, -0.3913671, -3.595308, 0.06666667, 1, 0, 1,
-0.4213037, 0.9155794, -0.7854633, 0.0627451, 1, 0, 1,
-0.4132738, -0.1289724, -0.9709404, 0.05490196, 1, 0, 1,
-0.4114647, -1.227111, -3.115646, 0.05098039, 1, 0, 1,
-0.4083809, 1.56484, -0.2537469, 0.04313726, 1, 0, 1,
-0.408254, 0.2274075, -0.4866009, 0.03921569, 1, 0, 1,
-0.4073732, 1.417987, -0.1165498, 0.03137255, 1, 0, 1,
-0.405748, 0.3326641, -0.4975426, 0.02745098, 1, 0, 1,
-0.4017109, -0.202321, -1.626361, 0.01960784, 1, 0, 1,
-0.4002844, -1.231628, -2.366023, 0.01568628, 1, 0, 1,
-0.3949349, 1.377988, 0.1375378, 0.007843138, 1, 0, 1,
-0.3923459, 0.4921933, 0.004189359, 0.003921569, 1, 0, 1,
-0.3908604, 0.1681769, 0.1307222, 0, 1, 0.003921569, 1,
-0.3905473, 3.181114, -0.6479224, 0, 1, 0.01176471, 1,
-0.3882887, -0.6335241, -2.848424, 0, 1, 0.01568628, 1,
-0.3882208, 0.3358461, -0.9209663, 0, 1, 0.02352941, 1,
-0.387833, 0.1857037, -1.740005, 0, 1, 0.02745098, 1,
-0.3696005, -1.044233, -2.555944, 0, 1, 0.03529412, 1,
-0.3694299, -0.06527934, 0.4165804, 0, 1, 0.03921569, 1,
-0.3677029, 0.2421213, -0.5422094, 0, 1, 0.04705882, 1,
-0.36654, 0.5053508, -1.298937, 0, 1, 0.05098039, 1,
-0.3649419, -0.3064565, -1.071102, 0, 1, 0.05882353, 1,
-0.3623397, 0.002142212, -2.123927, 0, 1, 0.0627451, 1,
-0.3591941, -0.4719454, -2.840723, 0, 1, 0.07058824, 1,
-0.3575181, -1.253461, -2.766752, 0, 1, 0.07450981, 1,
-0.357339, -0.1943353, -2.290748, 0, 1, 0.08235294, 1,
-0.357221, -2.156055, -2.418716, 0, 1, 0.08627451, 1,
-0.3560048, -0.9266127, -3.336591, 0, 1, 0.09411765, 1,
-0.3532245, -0.1688327, -2.485304, 0, 1, 0.1019608, 1,
-0.3510808, 0.2575122, -1.330721, 0, 1, 0.1058824, 1,
-0.3479871, -0.7739564, -2.562238, 0, 1, 0.1137255, 1,
-0.3458953, 0.1965611, -1.722242, 0, 1, 0.1176471, 1,
-0.3444877, -1.634234, -3.569806, 0, 1, 0.1254902, 1,
-0.3419139, -0.6252098, -3.224396, 0, 1, 0.1294118, 1,
-0.3391941, -0.06193341, -2.501509, 0, 1, 0.1372549, 1,
-0.3390233, -0.7832668, -2.341455, 0, 1, 0.1411765, 1,
-0.3371025, 0.6535064, -1.728085, 0, 1, 0.1490196, 1,
-0.3346681, 1.743697, -0.2183336, 0, 1, 0.1529412, 1,
-0.3310557, 0.5611096, -2.015316, 0, 1, 0.1607843, 1,
-0.3251666, -0.5702276, -2.775021, 0, 1, 0.1647059, 1,
-0.3235022, 0.3218582, -1.127496, 0, 1, 0.172549, 1,
-0.3176951, -2.38997, -2.411598, 0, 1, 0.1764706, 1,
-0.3139519, -0.6456524, -2.974858, 0, 1, 0.1843137, 1,
-0.3136492, -0.9715464, -3.511692, 0, 1, 0.1882353, 1,
-0.3092611, 0.1122243, -1.906996, 0, 1, 0.1960784, 1,
-0.3035864, -0.4367613, -2.373951, 0, 1, 0.2039216, 1,
-0.3022441, 0.8442336, -0.9017298, 0, 1, 0.2078431, 1,
-0.2956328, -0.6921073, -1.886424, 0, 1, 0.2156863, 1,
-0.2929403, 0.1809477, -0.1390591, 0, 1, 0.2196078, 1,
-0.2920268, 0.6023591, 2.395344, 0, 1, 0.227451, 1,
-0.2897849, -1.272008, -3.690136, 0, 1, 0.2313726, 1,
-0.2870414, -1.141473, -4.110299, 0, 1, 0.2392157, 1,
-0.2862671, 0.2802259, -0.4770287, 0, 1, 0.2431373, 1,
-0.2818421, 0.3988354, -2.36013, 0, 1, 0.2509804, 1,
-0.2776129, 0.1329293, -1.324001, 0, 1, 0.254902, 1,
-0.2775093, -0.120332, -3.593325, 0, 1, 0.2627451, 1,
-0.2757695, 0.8369663, 0.3598695, 0, 1, 0.2666667, 1,
-0.2720425, 0.553815, 0.1635699, 0, 1, 0.2745098, 1,
-0.2706357, 1.591632, -0.7447223, 0, 1, 0.2784314, 1,
-0.2700574, 1.014968, -0.5208024, 0, 1, 0.2862745, 1,
-0.2673238, 0.185314, -0.386191, 0, 1, 0.2901961, 1,
-0.2666644, -0.2237238, -3.935571, 0, 1, 0.2980392, 1,
-0.2633638, 0.6440714, 0.6931821, 0, 1, 0.3058824, 1,
-0.2544277, -0.7328874, -2.775031, 0, 1, 0.3098039, 1,
-0.251486, 0.3896575, -0.6156417, 0, 1, 0.3176471, 1,
-0.2487711, -0.3556572, -1.759487, 0, 1, 0.3215686, 1,
-0.243746, 0.1254133, -1.362231, 0, 1, 0.3294118, 1,
-0.2417178, -0.3647015, -2.742775, 0, 1, 0.3333333, 1,
-0.2409329, -0.9347552, -3.528854, 0, 1, 0.3411765, 1,
-0.239815, 1.040454, -1.541427, 0, 1, 0.345098, 1,
-0.2393587, 1.822086, -1.166306, 0, 1, 0.3529412, 1,
-0.2358342, 0.9034898, 0.1111481, 0, 1, 0.3568628, 1,
-0.2354618, -1.675581, -1.520573, 0, 1, 0.3647059, 1,
-0.2334819, -0.8344163, -2.325363, 0, 1, 0.3686275, 1,
-0.2280304, 0.4226773, -2.364151, 0, 1, 0.3764706, 1,
-0.2253827, 0.5327387, -1.655591, 0, 1, 0.3803922, 1,
-0.2239015, 0.839389, 0.9036694, 0, 1, 0.3882353, 1,
-0.2209848, -0.218273, -1.716344, 0, 1, 0.3921569, 1,
-0.2177164, 2.318432, 1.667807, 0, 1, 0.4, 1,
-0.2147865, 0.3622926, -0.2112554, 0, 1, 0.4078431, 1,
-0.214318, -0.1481591, -2.571525, 0, 1, 0.4117647, 1,
-0.2117752, -1.163715, -3.123973, 0, 1, 0.4196078, 1,
-0.2089722, 0.7906694, 0.5842152, 0, 1, 0.4235294, 1,
-0.2035361, 0.5267759, -0.03197758, 0, 1, 0.4313726, 1,
-0.199333, 1.275612, 1.061517, 0, 1, 0.4352941, 1,
-0.1944751, -0.5095739, -1.387667, 0, 1, 0.4431373, 1,
-0.193494, -0.2130586, -1.965701, 0, 1, 0.4470588, 1,
-0.190654, -0.9086992, -3.051931, 0, 1, 0.454902, 1,
-0.1883551, 0.2375189, -1.810358, 0, 1, 0.4588235, 1,
-0.1851197, -1.924654, -3.948494, 0, 1, 0.4666667, 1,
-0.1798169, -1.341279, -3.924057, 0, 1, 0.4705882, 1,
-0.1791345, -0.1885193, -2.574605, 0, 1, 0.4784314, 1,
-0.1787992, 0.005919388, -1.50652, 0, 1, 0.4823529, 1,
-0.1771788, -0.3096107, -4.414016, 0, 1, 0.4901961, 1,
-0.1747132, -0.9050173, -1.532417, 0, 1, 0.4941176, 1,
-0.1744378, -1.00568, -3.560217, 0, 1, 0.5019608, 1,
-0.1709376, 0.06430663, -0.9512946, 0, 1, 0.509804, 1,
-0.1707482, 1.350564, 0.3342811, 0, 1, 0.5137255, 1,
-0.1699212, -1.697341, -3.964272, 0, 1, 0.5215687, 1,
-0.1622949, 0.08606675, -0.1224339, 0, 1, 0.5254902, 1,
-0.1583197, 0.08071469, -0.659965, 0, 1, 0.5333334, 1,
-0.1580406, 1.959795, 0.007931232, 0, 1, 0.5372549, 1,
-0.1572406, -0.886997, -3.199147, 0, 1, 0.5450981, 1,
-0.1557576, -1.024737, -2.372141, 0, 1, 0.5490196, 1,
-0.1539817, 0.8404063, -0.2201339, 0, 1, 0.5568628, 1,
-0.1500003, -0.6380785, -1.750887, 0, 1, 0.5607843, 1,
-0.1494564, 1.070923, 1.528274, 0, 1, 0.5686275, 1,
-0.1494326, -0.2506452, -3.77624, 0, 1, 0.572549, 1,
-0.1435688, 0.9378832, 0.123423, 0, 1, 0.5803922, 1,
-0.1413965, 0.7430974, -0.03775181, 0, 1, 0.5843138, 1,
-0.1404052, -1.082131, -3.332698, 0, 1, 0.5921569, 1,
-0.1384766, -0.03442382, -1.176871, 0, 1, 0.5960785, 1,
-0.1300916, 1.375341, -0.412866, 0, 1, 0.6039216, 1,
-0.1292422, -0.6786615, -3.525499, 0, 1, 0.6117647, 1,
-0.1289084, 1.339975, 0.8905676, 0, 1, 0.6156863, 1,
-0.1286425, 1.235236, 2.397519, 0, 1, 0.6235294, 1,
-0.12856, 1.28185, -0.7376902, 0, 1, 0.627451, 1,
-0.1270812, 0.7384589, -0.2580067, 0, 1, 0.6352941, 1,
-0.126272, -0.5716733, -3.577282, 0, 1, 0.6392157, 1,
-0.1262029, 0.2930183, -0.2065742, 0, 1, 0.6470588, 1,
-0.1256861, -2.184163, -3.221024, 0, 1, 0.6509804, 1,
-0.1252389, 0.2605115, -0.4799016, 0, 1, 0.6588235, 1,
-0.1239525, -0.6376158, -2.817047, 0, 1, 0.6627451, 1,
-0.120872, 1.942291, -0.1951057, 0, 1, 0.6705883, 1,
-0.1186015, -0.2983032, -3.857793, 0, 1, 0.6745098, 1,
-0.1172817, -1.095241, -1.173643, 0, 1, 0.682353, 1,
-0.1134049, -0.1468191, -3.107263, 0, 1, 0.6862745, 1,
-0.1128304, 0.1751538, -1.985665, 0, 1, 0.6941177, 1,
-0.1117468, 0.7339332, 1.452231, 0, 1, 0.7019608, 1,
-0.1085747, -1.009535, -2.750344, 0, 1, 0.7058824, 1,
-0.1067265, -0.5616842, -4.277782, 0, 1, 0.7137255, 1,
-0.09436081, -0.5510605, -1.744896, 0, 1, 0.7176471, 1,
-0.08974297, -1.291294, -3.446601, 0, 1, 0.7254902, 1,
-0.08945119, -0.5135874, -2.813796, 0, 1, 0.7294118, 1,
-0.08633375, -1.083329, -3.495043, 0, 1, 0.7372549, 1,
-0.08605375, -0.4667499, -3.132792, 0, 1, 0.7411765, 1,
-0.08548819, -0.4782093, -4.278087, 0, 1, 0.7490196, 1,
-0.08239361, 0.3818557, 0.06632189, 0, 1, 0.7529412, 1,
-0.07643453, -0.06253748, -1.380314, 0, 1, 0.7607843, 1,
-0.07483057, 1.745494, 1.573018, 0, 1, 0.7647059, 1,
-0.07444036, 0.6393028, -0.07899523, 0, 1, 0.772549, 1,
-0.07011757, -0.8387305, -2.664225, 0, 1, 0.7764706, 1,
-0.06950925, -0.9704381, -2.630345, 0, 1, 0.7843137, 1,
-0.06662723, 0.6876666, -0.9239659, 0, 1, 0.7882353, 1,
-0.06546587, 0.9149967, -0.7198361, 0, 1, 0.7960784, 1,
-0.06346186, -1.631257, -2.971524, 0, 1, 0.8039216, 1,
-0.05856917, 0.8415248, 0.4492491, 0, 1, 0.8078431, 1,
-0.05845232, -1.775316, -2.291777, 0, 1, 0.8156863, 1,
-0.05798632, 1.456265, 0.2582177, 0, 1, 0.8196079, 1,
-0.05782281, -0.8575106, -2.977696, 0, 1, 0.827451, 1,
-0.0555955, -1.844177, -3.699199, 0, 1, 0.8313726, 1,
-0.04554444, 0.2657614, 0.4451753, 0, 1, 0.8392157, 1,
-0.03393638, 0.6850795, -0.2073499, 0, 1, 0.8431373, 1,
-0.03118057, -0.3393822, -3.996465, 0, 1, 0.8509804, 1,
-0.03100391, -0.9170824, -4.392381, 0, 1, 0.854902, 1,
-0.03074392, -1.058897, -2.86427, 0, 1, 0.8627451, 1,
-0.03013632, -0.9862881, -2.047965, 0, 1, 0.8666667, 1,
-0.02881241, -0.5063018, -3.142126, 0, 1, 0.8745098, 1,
-0.02559923, 1.375779, 0.5192831, 0, 1, 0.8784314, 1,
-0.02467647, -1.089594, -2.513991, 0, 1, 0.8862745, 1,
-0.01955054, 0.002916825, -0.03976411, 0, 1, 0.8901961, 1,
-0.01497383, 0.02511771, 0.1600263, 0, 1, 0.8980392, 1,
-0.0144551, -0.2325354, -3.480332, 0, 1, 0.9058824, 1,
-0.01303952, 0.1624116, -1.390986, 0, 1, 0.9098039, 1,
-0.012045, 0.3447149, -0.5354233, 0, 1, 0.9176471, 1,
-0.01167857, -0.8774801, -2.814559, 0, 1, 0.9215686, 1,
-0.008987783, -1.915002, -2.740395, 0, 1, 0.9294118, 1,
-0.002714931, -1.550189, -3.493158, 0, 1, 0.9333333, 1,
-0.00147951, -1.182578, -4.176471, 0, 1, 0.9411765, 1,
-0.0004949384, -0.8384418, -3.407855, 0, 1, 0.945098, 1,
0.001341375, 1.752141, -1.524707, 0, 1, 0.9529412, 1,
0.002389673, -0.3245232, 3.120438, 0, 1, 0.9568627, 1,
0.002725071, -0.382648, 2.617008, 0, 1, 0.9647059, 1,
0.007111474, 0.07750343, 0.6196793, 0, 1, 0.9686275, 1,
0.008533123, 0.6375411, 1.49914, 0, 1, 0.9764706, 1,
0.008884911, 0.7854419, 0.630058, 0, 1, 0.9803922, 1,
0.01289272, 0.9263694, 0.02816238, 0, 1, 0.9882353, 1,
0.01353922, -0.3858764, 4.003471, 0, 1, 0.9921569, 1,
0.0155924, 0.9076357, 0.1000306, 0, 1, 1, 1,
0.02062273, 0.6519176, -0.0451364, 0, 0.9921569, 1, 1,
0.02205468, -0.308395, 3.003484, 0, 0.9882353, 1, 1,
0.02604715, -1.373731, 2.5857, 0, 0.9803922, 1, 1,
0.027147, 1.18872, -1.630664, 0, 0.9764706, 1, 1,
0.03015958, 0.4683416, 1.055784, 0, 0.9686275, 1, 1,
0.03860268, -0.4821782, 3.570357, 0, 0.9647059, 1, 1,
0.0418371, -0.5883731, 1.955411, 0, 0.9568627, 1, 1,
0.04455569, 0.4824553, 1.039629, 0, 0.9529412, 1, 1,
0.04589786, -2.252169, 4.622809, 0, 0.945098, 1, 1,
0.04803859, 1.889195, 0.5084969, 0, 0.9411765, 1, 1,
0.04859457, 0.1386614, 0.08763559, 0, 0.9333333, 1, 1,
0.04872876, 0.2073315, -0.5519864, 0, 0.9294118, 1, 1,
0.05579585, 0.4112143, -0.1591648, 0, 0.9215686, 1, 1,
0.05682575, -0.7831845, 2.971847, 0, 0.9176471, 1, 1,
0.05863755, -0.5059815, 2.729766, 0, 0.9098039, 1, 1,
0.06480741, 1.548345, 0.4032027, 0, 0.9058824, 1, 1,
0.07648311, -0.7622639, 2.295268, 0, 0.8980392, 1, 1,
0.07728238, 0.430565, -0.450157, 0, 0.8901961, 1, 1,
0.07908832, -0.7332142, 2.531626, 0, 0.8862745, 1, 1,
0.08198211, 1.521823, 0.08496089, 0, 0.8784314, 1, 1,
0.08281087, -0.2553814, 2.236864, 0, 0.8745098, 1, 1,
0.08339206, -0.5252558, 3.595352, 0, 0.8666667, 1, 1,
0.08472507, 0.4589442, 0.5336836, 0, 0.8627451, 1, 1,
0.08886494, -2.177563, 5.03706, 0, 0.854902, 1, 1,
0.09151492, 0.2071324, -1.309425, 0, 0.8509804, 1, 1,
0.09516525, 0.2149961, 0.5341008, 0, 0.8431373, 1, 1,
0.09835744, 1.849504, 0.29414, 0, 0.8392157, 1, 1,
0.09876765, -0.8428916, 2.587199, 0, 0.8313726, 1, 1,
0.1009299, 0.6486382, 0.2541183, 0, 0.827451, 1, 1,
0.105965, -0.9594188, 3.891991, 0, 0.8196079, 1, 1,
0.1073512, -0.4496284, 1.390871, 0, 0.8156863, 1, 1,
0.1146901, 1.080961, 0.883885, 0, 0.8078431, 1, 1,
0.1166615, -1.589278, 1.680818, 0, 0.8039216, 1, 1,
0.1166621, -0.7357229, 3.606242, 0, 0.7960784, 1, 1,
0.1168511, 1.44999, 0.3366839, 0, 0.7882353, 1, 1,
0.123196, -1.811059, 2.478154, 0, 0.7843137, 1, 1,
0.1238, -0.4122888, 2.559912, 0, 0.7764706, 1, 1,
0.1256332, -1.196062, 2.845835, 0, 0.772549, 1, 1,
0.1262275, 0.6648406, 0.5199351, 0, 0.7647059, 1, 1,
0.1322881, -0.2885357, 3.613753, 0, 0.7607843, 1, 1,
0.1390506, 0.6797642, 0.1090632, 0, 0.7529412, 1, 1,
0.1440023, -0.1883574, 2.768835, 0, 0.7490196, 1, 1,
0.1489929, -0.9054829, 4.437394, 0, 0.7411765, 1, 1,
0.1493686, 0.5582607, 0.543839, 0, 0.7372549, 1, 1,
0.1540076, 0.1813977, -0.0586927, 0, 0.7294118, 1, 1,
0.1601238, 0.4452915, 0.5243855, 0, 0.7254902, 1, 1,
0.1616713, 1.383324, 0.9178815, 0, 0.7176471, 1, 1,
0.163084, 0.1727966, 0.203784, 0, 0.7137255, 1, 1,
0.1633082, -0.5751393, 1.739563, 0, 0.7058824, 1, 1,
0.1643119, -0.6139374, 1.835356, 0, 0.6980392, 1, 1,
0.1652737, -1.064746, 3.262436, 0, 0.6941177, 1, 1,
0.1655837, 1.251624, -0.1680729, 0, 0.6862745, 1, 1,
0.1734407, -2.133805, 4.627951, 0, 0.682353, 1, 1,
0.1754553, -1.662471, 4.072157, 0, 0.6745098, 1, 1,
0.1780902, 0.7306663, 2.237233, 0, 0.6705883, 1, 1,
0.1787361, 0.4468336, 0.4506489, 0, 0.6627451, 1, 1,
0.1790859, -0.02042007, 1.217352, 0, 0.6588235, 1, 1,
0.1831246, 0.1448144, -0.3421842, 0, 0.6509804, 1, 1,
0.1842073, 0.004648575, 0.6045118, 0, 0.6470588, 1, 1,
0.1845265, 0.7586084, 1.618446, 0, 0.6392157, 1, 1,
0.1864462, 0.09609757, 1.195626, 0, 0.6352941, 1, 1,
0.1871757, 0.8750349, 0.8559256, 0, 0.627451, 1, 1,
0.1886578, 0.8282338, 1.941436, 0, 0.6235294, 1, 1,
0.1918196, 0.04675891, 1.728585, 0, 0.6156863, 1, 1,
0.1940614, 0.5850784, -0.4789273, 0, 0.6117647, 1, 1,
0.1951667, -0.5776795, 3.974339, 0, 0.6039216, 1, 1,
0.1964342, -1.040084, 4.328047, 0, 0.5960785, 1, 1,
0.1984156, -0.2533855, 2.200023, 0, 0.5921569, 1, 1,
0.207261, -0.7947871, 2.500011, 0, 0.5843138, 1, 1,
0.2076821, -1.189844, 4.016484, 0, 0.5803922, 1, 1,
0.2138024, 0.3055351, -0.9895818, 0, 0.572549, 1, 1,
0.2174513, 0.8035322, -0.206211, 0, 0.5686275, 1, 1,
0.2183352, 0.4948897, -0.1968479, 0, 0.5607843, 1, 1,
0.2189143, -0.4663607, 3.496536, 0, 0.5568628, 1, 1,
0.2215784, 0.3663644, 1.986284, 0, 0.5490196, 1, 1,
0.2257379, -0.5278959, 3.606485, 0, 0.5450981, 1, 1,
0.2272445, -1.834976, 1.912055, 0, 0.5372549, 1, 1,
0.2283624, -0.3793078, 0.2335426, 0, 0.5333334, 1, 1,
0.2301315, -1.165916, 3.30232, 0, 0.5254902, 1, 1,
0.2321123, -0.1575017, 1.210787, 0, 0.5215687, 1, 1,
0.2323563, -0.6881308, 2.327181, 0, 0.5137255, 1, 1,
0.2323714, -0.1346187, 3.485475, 0, 0.509804, 1, 1,
0.2373774, -0.6765805, 2.328863, 0, 0.5019608, 1, 1,
0.2405306, -1.447458, 2.081498, 0, 0.4941176, 1, 1,
0.2405626, -0.9573197, 3.152004, 0, 0.4901961, 1, 1,
0.2424268, -1.040952, 2.668203, 0, 0.4823529, 1, 1,
0.2427265, 0.2104595, 1.177094, 0, 0.4784314, 1, 1,
0.2441946, -0.6542977, 0.8762816, 0, 0.4705882, 1, 1,
0.2443266, 0.9863966, -0.03236897, 0, 0.4666667, 1, 1,
0.2444423, -0.2167296, 2.830474, 0, 0.4588235, 1, 1,
0.2452267, 0.6102838, -0.7802725, 0, 0.454902, 1, 1,
0.2468936, -0.330957, 2.412418, 0, 0.4470588, 1, 1,
0.2476736, -0.4103269, 1.728328, 0, 0.4431373, 1, 1,
0.2504099, -0.3253202, 1.401466, 0, 0.4352941, 1, 1,
0.2527972, -0.2063448, 1.2775, 0, 0.4313726, 1, 1,
0.2538716, -0.9053845, 1.337506, 0, 0.4235294, 1, 1,
0.2601649, 1.558226, 1.104535, 0, 0.4196078, 1, 1,
0.2619266, 1.722981, 1.128138, 0, 0.4117647, 1, 1,
0.2662698, -0.3343509, 3.630208, 0, 0.4078431, 1, 1,
0.2690493, 0.4555836, 0.134163, 0, 0.4, 1, 1,
0.26991, -0.2966308, 2.750893, 0, 0.3921569, 1, 1,
0.2821482, 1.137669, 1.27606, 0, 0.3882353, 1, 1,
0.2838456, -1.759141, 4.291933, 0, 0.3803922, 1, 1,
0.2845823, -2.238816, 1.930201, 0, 0.3764706, 1, 1,
0.2888355, -0.1223213, 2.641178, 0, 0.3686275, 1, 1,
0.3055585, 1.609202, 1.891086, 0, 0.3647059, 1, 1,
0.3172072, -0.2483487, 1.05078, 0, 0.3568628, 1, 1,
0.3174397, 0.8731623, -0.564937, 0, 0.3529412, 1, 1,
0.3245625, -0.01839888, -1.187238, 0, 0.345098, 1, 1,
0.3255068, 0.10948, -2.360505, 0, 0.3411765, 1, 1,
0.3334129, -0.06690324, 2.551995, 0, 0.3333333, 1, 1,
0.338561, 2.207034, -0.7721276, 0, 0.3294118, 1, 1,
0.342811, -0.5216686, 0.6082154, 0, 0.3215686, 1, 1,
0.344211, -2.035182, 3.268399, 0, 0.3176471, 1, 1,
0.3457694, -0.8018838, 1.992967, 0, 0.3098039, 1, 1,
0.3487636, 0.1423634, 0.8375664, 0, 0.3058824, 1, 1,
0.3500849, 0.2827771, 2.677933, 0, 0.2980392, 1, 1,
0.3529232, 1.802533, -1.474147, 0, 0.2901961, 1, 1,
0.3537909, 2.262732, -1.007139, 0, 0.2862745, 1, 1,
0.3569277, 0.4000035, 1.25146, 0, 0.2784314, 1, 1,
0.3590521, 0.7989438, -1.535523, 0, 0.2745098, 1, 1,
0.3591626, 0.1248293, 2.957435, 0, 0.2666667, 1, 1,
0.3654807, 0.2607528, 1.502523, 0, 0.2627451, 1, 1,
0.3664944, 1.449082, 1.031201, 0, 0.254902, 1, 1,
0.3668058, -1.612376, 4.031833, 0, 0.2509804, 1, 1,
0.3685297, 1.55013, 0.2703178, 0, 0.2431373, 1, 1,
0.3727427, -1.674911, 0.667446, 0, 0.2392157, 1, 1,
0.3779132, -0.041302, 2.236431, 0, 0.2313726, 1, 1,
0.3782931, 0.4227279, 0.9116991, 0, 0.227451, 1, 1,
0.3844273, -0.4260008, 2.983444, 0, 0.2196078, 1, 1,
0.3878909, 0.8100039, -0.2304823, 0, 0.2156863, 1, 1,
0.3880575, -1.251673, 2.270253, 0, 0.2078431, 1, 1,
0.3884557, 0.1654946, 2.383729, 0, 0.2039216, 1, 1,
0.3935263, 0.2832536, 1.477146, 0, 0.1960784, 1, 1,
0.3951233, 1.655288, 2.556672, 0, 0.1882353, 1, 1,
0.3953459, -1.65063, 1.906496, 0, 0.1843137, 1, 1,
0.396972, 0.7747681, 1.193174, 0, 0.1764706, 1, 1,
0.4000647, -0.4938687, 1.312857, 0, 0.172549, 1, 1,
0.4002502, 2.021116, -0.1804969, 0, 0.1647059, 1, 1,
0.4002537, 2.044806, 0.2830331, 0, 0.1607843, 1, 1,
0.403494, -1.103129, 3.436002, 0, 0.1529412, 1, 1,
0.4036587, 0.8953541, -0.6667953, 0, 0.1490196, 1, 1,
0.4052686, 0.7746974, 0.1510541, 0, 0.1411765, 1, 1,
0.4062391, 1.6718, 1.648623, 0, 0.1372549, 1, 1,
0.4150134, 0.6360155, -0.5759215, 0, 0.1294118, 1, 1,
0.4159065, 0.778809, 0.9295809, 0, 0.1254902, 1, 1,
0.4171112, 0.3905244, 1.384201, 0, 0.1176471, 1, 1,
0.4174048, 0.7402516, 1.166996, 0, 0.1137255, 1, 1,
0.4176021, 0.7775429, 0.4274497, 0, 0.1058824, 1, 1,
0.423677, 0.06383076, 1.885289, 0, 0.09803922, 1, 1,
0.4290987, 0.2412723, 0.9822802, 0, 0.09411765, 1, 1,
0.4309109, -0.3751797, 0.4758995, 0, 0.08627451, 1, 1,
0.4319636, -0.09916316, 0.397238, 0, 0.08235294, 1, 1,
0.4325847, 0.2299142, 0.5389985, 0, 0.07450981, 1, 1,
0.4329135, 1.047999, -0.9829352, 0, 0.07058824, 1, 1,
0.433057, 1.038099, -0.3910206, 0, 0.0627451, 1, 1,
0.4351805, 1.794552, -0.03932864, 0, 0.05882353, 1, 1,
0.4354858, 1.550829, 1.047838, 0, 0.05098039, 1, 1,
0.4363278, -2.516476, 2.485005, 0, 0.04705882, 1, 1,
0.4368204, -1.553365, 2.001374, 0, 0.03921569, 1, 1,
0.4388723, 0.4868196, 0.3584754, 0, 0.03529412, 1, 1,
0.4393846, 0.8930198, -0.9409696, 0, 0.02745098, 1, 1,
0.4409818, -1.257587, 3.113529, 0, 0.02352941, 1, 1,
0.4413092, 0.1864516, 0.4091384, 0, 0.01568628, 1, 1,
0.4445034, 0.162109, 0.4992892, 0, 0.01176471, 1, 1,
0.4463683, -0.1016001, 2.841601, 0, 0.003921569, 1, 1,
0.4464875, 0.8607658, 1.16954, 0.003921569, 0, 1, 1,
0.4470671, -1.160522, 4.22757, 0.007843138, 0, 1, 1,
0.4510075, 1.239447, -0.1753223, 0.01568628, 0, 1, 1,
0.4526964, 0.1366965, 1.224039, 0.01960784, 0, 1, 1,
0.4564425, 1.386475, 1.025209, 0.02745098, 0, 1, 1,
0.4624963, 0.9044613, 0.9352577, 0.03137255, 0, 1, 1,
0.4836818, 0.1930264, 1.706679, 0.03921569, 0, 1, 1,
0.4862548, -0.3221714, 1.152152, 0.04313726, 0, 1, 1,
0.4865986, -0.04228, 1.892174, 0.05098039, 0, 1, 1,
0.4915155, -0.3573547, 1.259421, 0.05490196, 0, 1, 1,
0.4923138, 0.765892, 2.633096, 0.0627451, 0, 1, 1,
0.4962151, 0.2691472, 0.6680217, 0.06666667, 0, 1, 1,
0.4989437, -0.002778218, 0.6484999, 0.07450981, 0, 1, 1,
0.5081418, 1.252306, -1.480216, 0.07843138, 0, 1, 1,
0.5089981, -0.1100104, 2.511159, 0.08627451, 0, 1, 1,
0.5095004, -1.283454, 3.386448, 0.09019608, 0, 1, 1,
0.5106801, 1.701153, 2.06988, 0.09803922, 0, 1, 1,
0.5184891, 0.6021968, 2.08288, 0.1058824, 0, 1, 1,
0.5229581, 0.9544885, -0.3702332, 0.1098039, 0, 1, 1,
0.5248035, -1.106976, 3.12992, 0.1176471, 0, 1, 1,
0.533506, 1.488003, -0.1343265, 0.1215686, 0, 1, 1,
0.5351769, 0.566467, -0.0906725, 0.1294118, 0, 1, 1,
0.5358846, 0.139964, 0.3098893, 0.1333333, 0, 1, 1,
0.5386553, 0.8361329, 0.3063415, 0.1411765, 0, 1, 1,
0.5389499, 0.1693114, 2.109961, 0.145098, 0, 1, 1,
0.539914, 1.799836, 1.272294, 0.1529412, 0, 1, 1,
0.548972, -0.1863659, 1.774344, 0.1568628, 0, 1, 1,
0.5506971, -2.278053, 2.190041, 0.1647059, 0, 1, 1,
0.5519686, -0.5942636, 2.607074, 0.1686275, 0, 1, 1,
0.55265, 0.2378132, 0.8063953, 0.1764706, 0, 1, 1,
0.5563847, 0.5704718, 0.7017769, 0.1803922, 0, 1, 1,
0.5571042, -0.06913487, 1.55069, 0.1882353, 0, 1, 1,
0.5599301, -1.455975, 3.306563, 0.1921569, 0, 1, 1,
0.5616884, 0.5308014, 0.8448515, 0.2, 0, 1, 1,
0.5641754, -0.677673, 0.4057462, 0.2078431, 0, 1, 1,
0.5736884, -0.741514, 2.427412, 0.2117647, 0, 1, 1,
0.5753072, 0.5926964, 0.1069439, 0.2196078, 0, 1, 1,
0.5831745, 0.4275907, -0.2476852, 0.2235294, 0, 1, 1,
0.5850986, 0.6957234, 1.464652, 0.2313726, 0, 1, 1,
0.5884764, -2.208267, 3.493842, 0.2352941, 0, 1, 1,
0.5966713, 1.456805, 0.1542376, 0.2431373, 0, 1, 1,
0.5970882, 1.607515, -0.1518559, 0.2470588, 0, 1, 1,
0.5987732, -0.3207246, 2.708496, 0.254902, 0, 1, 1,
0.5998725, 0.3077525, 0.08477588, 0.2588235, 0, 1, 1,
0.6031228, -0.5472912, 1.267295, 0.2666667, 0, 1, 1,
0.6111546, -0.3892817, 2.735672, 0.2705882, 0, 1, 1,
0.6140712, -0.434877, 1.933653, 0.2784314, 0, 1, 1,
0.6162741, -0.167355, 0.5967934, 0.282353, 0, 1, 1,
0.6185288, -0.2631247, 1.133358, 0.2901961, 0, 1, 1,
0.6212327, 0.3089507, 1.620644, 0.2941177, 0, 1, 1,
0.6219204, -0.9712384, 3.097985, 0.3019608, 0, 1, 1,
0.624474, -1.717973, 2.239172, 0.3098039, 0, 1, 1,
0.6246526, 2.283757, -0.6963709, 0.3137255, 0, 1, 1,
0.629985, 1.651339, 0.1497227, 0.3215686, 0, 1, 1,
0.6309763, 0.5168103, 0.7482453, 0.3254902, 0, 1, 1,
0.6409482, -0.5330786, 0.8103718, 0.3333333, 0, 1, 1,
0.6409517, 1.13352, 1.388991, 0.3372549, 0, 1, 1,
0.6428842, 0.5709373, 0.415502, 0.345098, 0, 1, 1,
0.6493832, 0.9669164, 1.831432, 0.3490196, 0, 1, 1,
0.6497191, 0.508306, 2.732961, 0.3568628, 0, 1, 1,
0.6536876, -1.077693, 2.135615, 0.3607843, 0, 1, 1,
0.6548092, -0.07644299, 2.629333, 0.3686275, 0, 1, 1,
0.6585101, -0.1566884, 1.847737, 0.372549, 0, 1, 1,
0.6663483, -0.003445123, 1.722352, 0.3803922, 0, 1, 1,
0.6700127, -0.9542298, 1.430678, 0.3843137, 0, 1, 1,
0.6701367, 1.462136, 1.607147, 0.3921569, 0, 1, 1,
0.6806481, -2.102503, 2.569939, 0.3960784, 0, 1, 1,
0.6872209, 0.4263115, -0.8519654, 0.4039216, 0, 1, 1,
0.6904076, -1.877773, 3.465305, 0.4117647, 0, 1, 1,
0.6966278, 0.4052809, 1.386117, 0.4156863, 0, 1, 1,
0.6977704, 0.5284729, -0.7276562, 0.4235294, 0, 1, 1,
0.6986948, 1.230772, -0.2376084, 0.427451, 0, 1, 1,
0.699799, -0.8098676, 2.503916, 0.4352941, 0, 1, 1,
0.7015708, 0.2365614, 1.031897, 0.4392157, 0, 1, 1,
0.7024814, 2.775863, 0.5840174, 0.4470588, 0, 1, 1,
0.7026232, 0.9153605, 0.5863784, 0.4509804, 0, 1, 1,
0.7114431, -0.3032218, 2.306451, 0.4588235, 0, 1, 1,
0.7137067, -2.446655, 2.217092, 0.4627451, 0, 1, 1,
0.7239258, 0.8399141, 0.67039, 0.4705882, 0, 1, 1,
0.7298996, 0.0772247, 2.709826, 0.4745098, 0, 1, 1,
0.7315015, 1.579268, -0.3108228, 0.4823529, 0, 1, 1,
0.7347968, 0.6362083, 0.6019446, 0.4862745, 0, 1, 1,
0.7348565, -1.913251, 4.604145, 0.4941176, 0, 1, 1,
0.7354371, 0.8784535, 0.5462777, 0.5019608, 0, 1, 1,
0.7437732, -0.3182971, 1.550006, 0.5058824, 0, 1, 1,
0.7441284, -0.6952174, 3.412451, 0.5137255, 0, 1, 1,
0.7448529, -0.8091183, 3.370091, 0.5176471, 0, 1, 1,
0.7476287, 0.3160231, 1.794092, 0.5254902, 0, 1, 1,
0.7497892, -0.07786846, 2.298549, 0.5294118, 0, 1, 1,
0.7502621, -1.017668, 2.940446, 0.5372549, 0, 1, 1,
0.7509668, 1.522007, 0.8947276, 0.5411765, 0, 1, 1,
0.7513256, 0.8953559, 0.2900051, 0.5490196, 0, 1, 1,
0.7564832, -0.352121, 1.695651, 0.5529412, 0, 1, 1,
0.7603468, 0.07192958, 2.719691, 0.5607843, 0, 1, 1,
0.7626967, -0.1786352, 1.330826, 0.5647059, 0, 1, 1,
0.763343, -0.7986467, 4.112803, 0.572549, 0, 1, 1,
0.7663605, -1.050682, 3.831318, 0.5764706, 0, 1, 1,
0.7874408, -0.558112, 3.759975, 0.5843138, 0, 1, 1,
0.7879437, -1.046364, 3.687618, 0.5882353, 0, 1, 1,
0.7894539, -0.2845061, 4.345508, 0.5960785, 0, 1, 1,
0.7972399, -0.5891215, 3.446431, 0.6039216, 0, 1, 1,
0.8003481, 1.075832, 3.047797, 0.6078432, 0, 1, 1,
0.8023624, 1.604448, -0.987665, 0.6156863, 0, 1, 1,
0.8050393, 0.7274474, 0.8667731, 0.6196079, 0, 1, 1,
0.8053991, 2.4195, 0.6751578, 0.627451, 0, 1, 1,
0.8107985, 0.5245286, 1.212657, 0.6313726, 0, 1, 1,
0.8115398, 0.4590203, 1.755126, 0.6392157, 0, 1, 1,
0.8119044, -1.550264, 2.473525, 0.6431373, 0, 1, 1,
0.8126088, -0.5192635, 2.837401, 0.6509804, 0, 1, 1,
0.8128842, -0.2092479, 0.8608675, 0.654902, 0, 1, 1,
0.8228155, -0.4482094, 1.722498, 0.6627451, 0, 1, 1,
0.8258086, -0.1166708, 1.196759, 0.6666667, 0, 1, 1,
0.8274338, -1.046214, 2.772515, 0.6745098, 0, 1, 1,
0.8292665, -0.3998675, 1.672817, 0.6784314, 0, 1, 1,
0.8299991, 0.2274075, 0.6711507, 0.6862745, 0, 1, 1,
0.8347946, -0.9120833, 2.467276, 0.6901961, 0, 1, 1,
0.8358084, -0.298482, 2.368391, 0.6980392, 0, 1, 1,
0.8378415, -0.8418334, 1.924866, 0.7058824, 0, 1, 1,
0.8403447, -0.36363, 2.265703, 0.7098039, 0, 1, 1,
0.8431431, 0.6753616, 0.5477922, 0.7176471, 0, 1, 1,
0.8458008, -0.5299441, 1.201767, 0.7215686, 0, 1, 1,
0.8471455, 1.047627, 1.14539, 0.7294118, 0, 1, 1,
0.8735471, 0.5196743, 2.401343, 0.7333333, 0, 1, 1,
0.8750739, 2.030914, -0.4577129, 0.7411765, 0, 1, 1,
0.8796129, -0.1892762, 0.0762136, 0.7450981, 0, 1, 1,
0.8833244, -0.5368306, 1.914751, 0.7529412, 0, 1, 1,
0.8879399, 1.624142, 0.8066515, 0.7568628, 0, 1, 1,
0.8956262, 1.24814, 0.5429379, 0.7647059, 0, 1, 1,
0.8962367, 2.338263, 0.6765776, 0.7686275, 0, 1, 1,
0.8970711, 2.589136, 0.3272248, 0.7764706, 0, 1, 1,
0.9032397, -0.9392324, 2.97978, 0.7803922, 0, 1, 1,
0.9038809, 0.9146139, 0.9277352, 0.7882353, 0, 1, 1,
0.9068718, -0.8432994, 3.284912, 0.7921569, 0, 1, 1,
0.9078983, 1.054912, 2.245, 0.8, 0, 1, 1,
0.9081213, -0.4123244, 1.627996, 0.8078431, 0, 1, 1,
0.9155983, 0.2098293, 2.253074, 0.8117647, 0, 1, 1,
0.9163342, 0.3488344, 1.0102, 0.8196079, 0, 1, 1,
0.9181396, 0.8391628, 0.3030903, 0.8235294, 0, 1, 1,
0.920709, 1.281881, 0.6278675, 0.8313726, 0, 1, 1,
0.9233023, -0.2105481, 1.188479, 0.8352941, 0, 1, 1,
0.9246723, 0.927262, -0.8036532, 0.8431373, 0, 1, 1,
0.937378, 1.692429, -0.1849445, 0.8470588, 0, 1, 1,
0.9386051, -1.106958, 3.21792, 0.854902, 0, 1, 1,
0.9407406, 0.06461811, 0.3016124, 0.8588235, 0, 1, 1,
0.942082, 0.5220811, 1.422597, 0.8666667, 0, 1, 1,
0.9437914, 1.007147, 0.8232659, 0.8705882, 0, 1, 1,
0.9465979, -0.007846757, 0.3218855, 0.8784314, 0, 1, 1,
0.9481558, 0.1172768, 0.4578734, 0.8823529, 0, 1, 1,
0.95083, 0.7990342, 1.266609, 0.8901961, 0, 1, 1,
0.9577222, -0.103075, 1.768607, 0.8941177, 0, 1, 1,
0.9600897, -0.50136, 3.222098, 0.9019608, 0, 1, 1,
0.9651333, 0.03657117, 1.232501, 0.9098039, 0, 1, 1,
0.9783144, 1.553756, 0.1038311, 0.9137255, 0, 1, 1,
0.9793743, -0.3626488, 2.692659, 0.9215686, 0, 1, 1,
0.9804882, -0.5933201, 3.713465, 0.9254902, 0, 1, 1,
0.9816674, 1.082009, 1.085763, 0.9333333, 0, 1, 1,
0.9820347, -0.6405167, 1.096058, 0.9372549, 0, 1, 1,
0.9862986, 0.4111728, 0.4337873, 0.945098, 0, 1, 1,
0.9881596, 0.6707715, 0.4097593, 0.9490196, 0, 1, 1,
0.9921981, 1.163668, 0.9136575, 0.9568627, 0, 1, 1,
0.9940931, 0.2994733, 1.333292, 0.9607843, 0, 1, 1,
0.9984342, -0.3017513, 0.7525076, 0.9686275, 0, 1, 1,
1.003964, 0.3226058, 0.2432187, 0.972549, 0, 1, 1,
1.011876, -1.784547, 2.472432, 0.9803922, 0, 1, 1,
1.017747, 1.23433, -0.4028437, 0.9843137, 0, 1, 1,
1.022637, 0.1189901, 1.85584, 0.9921569, 0, 1, 1,
1.024847, -1.961338, 2.899753, 0.9960784, 0, 1, 1,
1.025127, -0.2265611, 1.695199, 1, 0, 0.9960784, 1,
1.029399, -0.2189036, 3.040813, 1, 0, 0.9882353, 1,
1.034128, 1.115835, 0.1791041, 1, 0, 0.9843137, 1,
1.034712, -0.6255293, 2.302498, 1, 0, 0.9764706, 1,
1.042249, -0.4745889, 1.791403, 1, 0, 0.972549, 1,
1.044964, 0.1814212, 2.329798, 1, 0, 0.9647059, 1,
1.048394, 1.707037, 1.086688, 1, 0, 0.9607843, 1,
1.049939, 0.8367119, 0.5031079, 1, 0, 0.9529412, 1,
1.051315, 1.002341, 0.7787067, 1, 0, 0.9490196, 1,
1.055782, -1.006558, 3.085752, 1, 0, 0.9411765, 1,
1.05742, 0.9299565, -0.2856135, 1, 0, 0.9372549, 1,
1.059156, -0.1414344, 1.284745, 1, 0, 0.9294118, 1,
1.060382, -2.263086, 3.745534, 1, 0, 0.9254902, 1,
1.063687, 1.355743, 0.1711677, 1, 0, 0.9176471, 1,
1.066079, 0.1997448, 0.910861, 1, 0, 0.9137255, 1,
1.067414, 0.1577004, 0.5550544, 1, 0, 0.9058824, 1,
1.073772, 0.1665174, 1.492516, 1, 0, 0.9019608, 1,
1.074786, 0.04907274, 1.622322, 1, 0, 0.8941177, 1,
1.081544, -1.501209, 3.131432, 1, 0, 0.8862745, 1,
1.085948, 0.5707502, 3.101511, 1, 0, 0.8823529, 1,
1.08768, -1.290748, 2.623855, 1, 0, 0.8745098, 1,
1.088449, -0.1700032, 1.176464, 1, 0, 0.8705882, 1,
1.090318, 0.2895246, 1.854105, 1, 0, 0.8627451, 1,
1.092071, -0.7824582, 3.692049, 1, 0, 0.8588235, 1,
1.09661, 0.7001619, 0.6077685, 1, 0, 0.8509804, 1,
1.103945, -0.3245823, 1.585206, 1, 0, 0.8470588, 1,
1.104998, -0.37502, 2.992048, 1, 0, 0.8392157, 1,
1.107583, 1.887745, 0.7151837, 1, 0, 0.8352941, 1,
1.11904, 1.350961, -1.059149, 1, 0, 0.827451, 1,
1.119419, 0.5214586, 2.007738, 1, 0, 0.8235294, 1,
1.120455, -0.6065679, 1.371719, 1, 0, 0.8156863, 1,
1.121008, 0.07020134, 1.473767, 1, 0, 0.8117647, 1,
1.122546, -2.251832, 2.548269, 1, 0, 0.8039216, 1,
1.125723, 0.4023979, -0.2168244, 1, 0, 0.7960784, 1,
1.129746, -0.9684309, 1.142914, 1, 0, 0.7921569, 1,
1.131251, -1.485599, 1.573743, 1, 0, 0.7843137, 1,
1.132074, -1.327937, 3.743582, 1, 0, 0.7803922, 1,
1.13709, 1.616959, 0.1130849, 1, 0, 0.772549, 1,
1.138479, -0.7405642, 1.728677, 1, 0, 0.7686275, 1,
1.148304, -0.4066026, 3.325943, 1, 0, 0.7607843, 1,
1.151265, -0.03595488, -0.7945339, 1, 0, 0.7568628, 1,
1.151896, -1.022081, 2.398281, 1, 0, 0.7490196, 1,
1.165542, -1.036601, 3.078856, 1, 0, 0.7450981, 1,
1.166004, 0.05902723, 1.491747, 1, 0, 0.7372549, 1,
1.167464, -0.08052999, 1.109224, 1, 0, 0.7333333, 1,
1.175075, -0.09114121, 2.19349, 1, 0, 0.7254902, 1,
1.177678, -0.5598822, 3.654752, 1, 0, 0.7215686, 1,
1.187595, 1.029507, 1.424293, 1, 0, 0.7137255, 1,
1.193529, 2.112653, 0.6436245, 1, 0, 0.7098039, 1,
1.195527, 1.854453, 0.6964976, 1, 0, 0.7019608, 1,
1.20096, 1.015951, 0.1728549, 1, 0, 0.6941177, 1,
1.202669, -1.217482, 2.983989, 1, 0, 0.6901961, 1,
1.209664, -0.7782937, 2.800317, 1, 0, 0.682353, 1,
1.216897, -1.003121, 3.896744, 1, 0, 0.6784314, 1,
1.218835, -0.06462394, 0.107636, 1, 0, 0.6705883, 1,
1.22254, -1.571947, 1.560363, 1, 0, 0.6666667, 1,
1.223585, 1.274987, 2.413311, 1, 0, 0.6588235, 1,
1.227229, -1.291923, 2.853412, 1, 0, 0.654902, 1,
1.227949, 0.2110459, 1.518396, 1, 0, 0.6470588, 1,
1.232655, -1.209712, 1.685332, 1, 0, 0.6431373, 1,
1.236366, 0.07808409, 4.379516, 1, 0, 0.6352941, 1,
1.242542, -0.1573876, 1.902975, 1, 0, 0.6313726, 1,
1.252221, 1.017805, 0.9623967, 1, 0, 0.6235294, 1,
1.26613, -0.4027493, 1.88571, 1, 0, 0.6196079, 1,
1.268393, -0.6393142, 3.487734, 1, 0, 0.6117647, 1,
1.271282, -0.08606461, 1.801704, 1, 0, 0.6078432, 1,
1.272287, -0.8578458, 3.418241, 1, 0, 0.6, 1,
1.274668, 0.5509975, 0.2168408, 1, 0, 0.5921569, 1,
1.296001, -0.06309678, 0.9658777, 1, 0, 0.5882353, 1,
1.300998, 1.331829, -0.1301193, 1, 0, 0.5803922, 1,
1.305306, -0.9595892, 2.340811, 1, 0, 0.5764706, 1,
1.316465, -0.1582076, 3.501437, 1, 0, 0.5686275, 1,
1.317233, -1.965315, 2.027524, 1, 0, 0.5647059, 1,
1.322208, -0.431112, 2.644163, 1, 0, 0.5568628, 1,
1.331574, 0.9654834, 0.5881876, 1, 0, 0.5529412, 1,
1.333102, -0.2116614, 1.567701, 1, 0, 0.5450981, 1,
1.348273, 2.919136, -0.6924946, 1, 0, 0.5411765, 1,
1.367424, 1.132812, 1.259377, 1, 0, 0.5333334, 1,
1.380917, 0.4377073, 1.214951, 1, 0, 0.5294118, 1,
1.384198, -0.9458685, 2.905086, 1, 0, 0.5215687, 1,
1.389186, -0.956297, 1.60955, 1, 0, 0.5176471, 1,
1.394165, -0.6449665, 0.1432846, 1, 0, 0.509804, 1,
1.395221, 0.5599661, 2.580673, 1, 0, 0.5058824, 1,
1.398391, 0.9656785, 1.590054, 1, 0, 0.4980392, 1,
1.399495, 1.291064, 2.579732, 1, 0, 0.4901961, 1,
1.404572, 0.3753111, 1.33059, 1, 0, 0.4862745, 1,
1.409146, 0.07181884, 0.4779532, 1, 0, 0.4784314, 1,
1.412175, -0.09447467, 1.703863, 1, 0, 0.4745098, 1,
1.419475, -0.9652292, 2.644736, 1, 0, 0.4666667, 1,
1.427149, 0.497276, 2.474638, 1, 0, 0.4627451, 1,
1.430888, -0.5115463, 1.416799, 1, 0, 0.454902, 1,
1.434349, 0.2387947, 0.9152777, 1, 0, 0.4509804, 1,
1.439723, -1.030237, 2.822475, 1, 0, 0.4431373, 1,
1.451056, 0.05653263, 1.770969, 1, 0, 0.4392157, 1,
1.45209, 1.12101, 0.6131468, 1, 0, 0.4313726, 1,
1.470586, 0.5750326, 1.303756, 1, 0, 0.427451, 1,
1.471044, -2.21691, 2.220742, 1, 0, 0.4196078, 1,
1.48748, -1.735584, 1.102034, 1, 0, 0.4156863, 1,
1.489292, -1.455415, 2.352458, 1, 0, 0.4078431, 1,
1.497594, 0.2877638, 3.292323, 1, 0, 0.4039216, 1,
1.508862, -1.079089, 2.973917, 1, 0, 0.3960784, 1,
1.509909, -1.199924, 2.349477, 1, 0, 0.3882353, 1,
1.514427, 0.2414898, -0.5721167, 1, 0, 0.3843137, 1,
1.520177, 0.1491302, 2.915929, 1, 0, 0.3764706, 1,
1.532044, -0.06845334, 1.836184, 1, 0, 0.372549, 1,
1.559871, 0.6304971, 1.609845, 1, 0, 0.3647059, 1,
1.562087, 1.582666, -0.3902989, 1, 0, 0.3607843, 1,
1.563291, 0.07548499, 2.449849, 1, 0, 0.3529412, 1,
1.56882, -1.112679, 0.8127004, 1, 0, 0.3490196, 1,
1.570925, 0.8794454, -1.108507, 1, 0, 0.3411765, 1,
1.584726, 0.5616641, 1.600095, 1, 0, 0.3372549, 1,
1.587821, 0.8689846, 0.4867083, 1, 0, 0.3294118, 1,
1.593229, -1.018589, 0.6468148, 1, 0, 0.3254902, 1,
1.596207, 0.2026505, 2.403246, 1, 0, 0.3176471, 1,
1.59935, -0.1085892, 1.621451, 1, 0, 0.3137255, 1,
1.599773, 0.5709204, 1.028394, 1, 0, 0.3058824, 1,
1.611555, -1.131009, 1.838663, 1, 0, 0.2980392, 1,
1.635169, 0.1902985, 2.973919, 1, 0, 0.2941177, 1,
1.647114, 0.7885979, 1.395295, 1, 0, 0.2862745, 1,
1.64967, 2.627309, 0.3284471, 1, 0, 0.282353, 1,
1.663711, 1.955652, -0.02040413, 1, 0, 0.2745098, 1,
1.665828, 1.260918, 0.5416715, 1, 0, 0.2705882, 1,
1.669654, -0.08294959, 3.149812, 1, 0, 0.2627451, 1,
1.670179, 1.306341, 0.2636043, 1, 0, 0.2588235, 1,
1.673315, 0.9469932, 1.210243, 1, 0, 0.2509804, 1,
1.67503, 0.347342, 2.149718, 1, 0, 0.2470588, 1,
1.682759, 0.05329439, 2.090394, 1, 0, 0.2392157, 1,
1.691766, -0.6579139, 2.279032, 1, 0, 0.2352941, 1,
1.697842, 1.259237, 0.1801308, 1, 0, 0.227451, 1,
1.70432, 1.108027, -1.501746, 1, 0, 0.2235294, 1,
1.718589, -0.586193, 2.621061, 1, 0, 0.2156863, 1,
1.742139, 0.8733314, 1.048157, 1, 0, 0.2117647, 1,
1.750707, -0.09240453, 2.460008, 1, 0, 0.2039216, 1,
1.755829, 1.693472, 1.961673, 1, 0, 0.1960784, 1,
1.77255, 2.077425, 2.276503, 1, 0, 0.1921569, 1,
1.791696, -0.7587616, 2.887639, 1, 0, 0.1843137, 1,
1.800676, -1.955407, 2.658033, 1, 0, 0.1803922, 1,
1.802431, -0.1878191, 1.257123, 1, 0, 0.172549, 1,
1.816967, 1.957651, 0.7582458, 1, 0, 0.1686275, 1,
1.833541, -0.471037, 2.991639, 1, 0, 0.1607843, 1,
1.84776, 0.1317603, 1.595303, 1, 0, 0.1568628, 1,
1.888705, -1.500875, 2.395237, 1, 0, 0.1490196, 1,
1.912709, -1.50504, 2.472772, 1, 0, 0.145098, 1,
1.914431, -0.06327015, 2.591753, 1, 0, 0.1372549, 1,
1.934478, 0.1849515, 1.073537, 1, 0, 0.1333333, 1,
1.961963, 0.3900976, 1.95814, 1, 0, 0.1254902, 1,
2.032221, 0.0768737, 1.702148, 1, 0, 0.1215686, 1,
2.048269, 0.916212, 0.3824181, 1, 0, 0.1137255, 1,
2.054592, -0.658891, 2.446661, 1, 0, 0.1098039, 1,
2.058233, -0.7762048, 1.589501, 1, 0, 0.1019608, 1,
2.080106, 0.7028234, -0.7011489, 1, 0, 0.09411765, 1,
2.084728, -1.682185, 2.544604, 1, 0, 0.09019608, 1,
2.143653, 0.4251138, 0.5159648, 1, 0, 0.08235294, 1,
2.148402, -0.3585277, 3.701461, 1, 0, 0.07843138, 1,
2.170597, -0.1554412, 1.754792, 1, 0, 0.07058824, 1,
2.291915, 0.8036486, 0.9089139, 1, 0, 0.06666667, 1,
2.29254, 1.602331, 1.520292, 1, 0, 0.05882353, 1,
2.299267, 0.5992914, -0.8580723, 1, 0, 0.05490196, 1,
2.371274, -0.6592195, 1.849264, 1, 0, 0.04705882, 1,
2.396055, -1.143596, 0.9252326, 1, 0, 0.04313726, 1,
2.416345, 0.05974727, 0.8257266, 1, 0, 0.03529412, 1,
2.450848, 1.203009, 1.803829, 1, 0, 0.03137255, 1,
2.595518, -2.148139, 1.40196, 1, 0, 0.02352941, 1,
2.797178, -0.5261502, 1.331633, 1, 0, 0.01960784, 1,
3.063833, 0.593055, 3.24788, 1, 0, 0.01176471, 1,
3.075081, -0.2588779, 1.322331, 1, 0, 0.007843138, 1
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
-0.107299, -4.030442, -7.089318, 0, -0.5, 0.5, 0.5,
-0.107299, -4.030442, -7.089318, 1, -0.5, 0.5, 0.5,
-0.107299, -4.030442, -7.089318, 1, 1.5, 0.5, 0.5,
-0.107299, -4.030442, -7.089318, 0, 1.5, 0.5, 0.5
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
-4.368506, 0.09793508, -7.089318, 0, -0.5, 0.5, 0.5,
-4.368506, 0.09793508, -7.089318, 1, -0.5, 0.5, 0.5,
-4.368506, 0.09793508, -7.089318, 1, 1.5, 0.5, 0.5,
-4.368506, 0.09793508, -7.089318, 0, 1.5, 0.5, 0.5
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
-4.368506, -4.030442, -0.1473684, 0, -0.5, 0.5, 0.5,
-4.368506, -4.030442, -0.1473684, 1, -0.5, 0.5, 0.5,
-4.368506, -4.030442, -0.1473684, 1, 1.5, 0.5, 0.5,
-4.368506, -4.030442, -0.1473684, 0, 1.5, 0.5, 0.5
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
-3, -3.07774, -5.48733,
3, -3.07774, -5.48733,
-3, -3.07774, -5.48733,
-3, -3.236523, -5.754328,
-2, -3.07774, -5.48733,
-2, -3.236523, -5.754328,
-1, -3.07774, -5.48733,
-1, -3.236523, -5.754328,
0, -3.07774, -5.48733,
0, -3.236523, -5.754328,
1, -3.07774, -5.48733,
1, -3.236523, -5.754328,
2, -3.07774, -5.48733,
2, -3.236523, -5.754328,
3, -3.07774, -5.48733,
3, -3.236523, -5.754328
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
-3, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
-3, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
-3, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
-3, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5,
-2, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
-2, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
-2, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
-2, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5,
-1, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
-1, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
-1, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
-1, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5,
0, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
0, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
0, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
0, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5,
1, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
1, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
1, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
1, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5,
2, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
2, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
2, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
2, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5,
3, -3.554091, -6.288324, 0, -0.5, 0.5, 0.5,
3, -3.554091, -6.288324, 1, -0.5, 0.5, 0.5,
3, -3.554091, -6.288324, 1, 1.5, 0.5, 0.5,
3, -3.554091, -6.288324, 0, 1.5, 0.5, 0.5
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
-3.38515, -2, -5.48733,
-3.38515, 3, -5.48733,
-3.38515, -2, -5.48733,
-3.549043, -2, -5.754328,
-3.38515, -1, -5.48733,
-3.549043, -1, -5.754328,
-3.38515, 0, -5.48733,
-3.549043, 0, -5.754328,
-3.38515, 1, -5.48733,
-3.549043, 1, -5.754328,
-3.38515, 2, -5.48733,
-3.549043, 2, -5.754328,
-3.38515, 3, -5.48733,
-3.549043, 3, -5.754328
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
-3.876828, -2, -6.288324, 0, -0.5, 0.5, 0.5,
-3.876828, -2, -6.288324, 1, -0.5, 0.5, 0.5,
-3.876828, -2, -6.288324, 1, 1.5, 0.5, 0.5,
-3.876828, -2, -6.288324, 0, 1.5, 0.5, 0.5,
-3.876828, -1, -6.288324, 0, -0.5, 0.5, 0.5,
-3.876828, -1, -6.288324, 1, -0.5, 0.5, 0.5,
-3.876828, -1, -6.288324, 1, 1.5, 0.5, 0.5,
-3.876828, -1, -6.288324, 0, 1.5, 0.5, 0.5,
-3.876828, 0, -6.288324, 0, -0.5, 0.5, 0.5,
-3.876828, 0, -6.288324, 1, -0.5, 0.5, 0.5,
-3.876828, 0, -6.288324, 1, 1.5, 0.5, 0.5,
-3.876828, 0, -6.288324, 0, 1.5, 0.5, 0.5,
-3.876828, 1, -6.288324, 0, -0.5, 0.5, 0.5,
-3.876828, 1, -6.288324, 1, -0.5, 0.5, 0.5,
-3.876828, 1, -6.288324, 1, 1.5, 0.5, 0.5,
-3.876828, 1, -6.288324, 0, 1.5, 0.5, 0.5,
-3.876828, 2, -6.288324, 0, -0.5, 0.5, 0.5,
-3.876828, 2, -6.288324, 1, -0.5, 0.5, 0.5,
-3.876828, 2, -6.288324, 1, 1.5, 0.5, 0.5,
-3.876828, 2, -6.288324, 0, 1.5, 0.5, 0.5,
-3.876828, 3, -6.288324, 0, -0.5, 0.5, 0.5,
-3.876828, 3, -6.288324, 1, -0.5, 0.5, 0.5,
-3.876828, 3, -6.288324, 1, 1.5, 0.5, 0.5,
-3.876828, 3, -6.288324, 0, 1.5, 0.5, 0.5
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
-3.38515, -3.07774, -4,
-3.38515, -3.07774, 4,
-3.38515, -3.07774, -4,
-3.549043, -3.236523, -4,
-3.38515, -3.07774, -2,
-3.549043, -3.236523, -2,
-3.38515, -3.07774, 0,
-3.549043, -3.236523, 0,
-3.38515, -3.07774, 2,
-3.549043, -3.236523, 2,
-3.38515, -3.07774, 4,
-3.549043, -3.236523, 4
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
-3.876828, -3.554091, -4, 0, -0.5, 0.5, 0.5,
-3.876828, -3.554091, -4, 1, -0.5, 0.5, 0.5,
-3.876828, -3.554091, -4, 1, 1.5, 0.5, 0.5,
-3.876828, -3.554091, -4, 0, 1.5, 0.5, 0.5,
-3.876828, -3.554091, -2, 0, -0.5, 0.5, 0.5,
-3.876828, -3.554091, -2, 1, -0.5, 0.5, 0.5,
-3.876828, -3.554091, -2, 1, 1.5, 0.5, 0.5,
-3.876828, -3.554091, -2, 0, 1.5, 0.5, 0.5,
-3.876828, -3.554091, 0, 0, -0.5, 0.5, 0.5,
-3.876828, -3.554091, 0, 1, -0.5, 0.5, 0.5,
-3.876828, -3.554091, 0, 1, 1.5, 0.5, 0.5,
-3.876828, -3.554091, 0, 0, 1.5, 0.5, 0.5,
-3.876828, -3.554091, 2, 0, -0.5, 0.5, 0.5,
-3.876828, -3.554091, 2, 1, -0.5, 0.5, 0.5,
-3.876828, -3.554091, 2, 1, 1.5, 0.5, 0.5,
-3.876828, -3.554091, 2, 0, 1.5, 0.5, 0.5,
-3.876828, -3.554091, 4, 0, -0.5, 0.5, 0.5,
-3.876828, -3.554091, 4, 1, -0.5, 0.5, 0.5,
-3.876828, -3.554091, 4, 1, 1.5, 0.5, 0.5,
-3.876828, -3.554091, 4, 0, 1.5, 0.5, 0.5
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
-3.38515, -3.07774, -5.48733,
-3.38515, 3.27361, -5.48733,
-3.38515, -3.07774, 5.192593,
-3.38515, 3.27361, 5.192593,
-3.38515, -3.07774, -5.48733,
-3.38515, -3.07774, 5.192593,
-3.38515, 3.27361, -5.48733,
-3.38515, 3.27361, 5.192593,
-3.38515, -3.07774, -5.48733,
3.170552, -3.07774, -5.48733,
-3.38515, -3.07774, 5.192593,
3.170552, -3.07774, 5.192593,
-3.38515, 3.27361, -5.48733,
3.170552, 3.27361, -5.48733,
-3.38515, 3.27361, 5.192593,
3.170552, 3.27361, 5.192593,
3.170552, -3.07774, -5.48733,
3.170552, 3.27361, -5.48733,
3.170552, -3.07774, 5.192593,
3.170552, 3.27361, 5.192593,
3.170552, -3.07774, -5.48733,
3.170552, -3.07774, 5.192593,
3.170552, 3.27361, -5.48733,
3.170552, 3.27361, 5.192593
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
var radius = 7.501955;
var distance = 33.37704;
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
mvMatrix.translate( 0.107299, -0.09793508, 0.1473684 );
mvMatrix.scale( 1.237283, 1.277092, 0.7594868 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.37704);
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
methacrylate<-read.table("methacrylate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methacrylate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methacrylate' not found
```

```r
y<-methacrylate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methacrylate' not found
```

```r
z<-methacrylate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methacrylate' not found
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
-3.289679, -0.724573, -2.866659, 0, 0, 1, 1, 1,
-2.916586, 0.01214282, -1.53202, 1, 0, 0, 1, 1,
-2.739239, -0.3770436, -0.9102365, 1, 0, 0, 1, 1,
-2.735281, -1.56072, -1.51695, 1, 0, 0, 1, 1,
-2.635803, 0.050509, -3.306355, 1, 0, 0, 1, 1,
-2.628962, 0.9539737, -1.859559, 1, 0, 0, 1, 1,
-2.52741, 1.513118, -1.292063, 0, 0, 0, 1, 1,
-2.380134, -0.6928356, -2.006931, 0, 0, 0, 1, 1,
-2.335868, -0.1339925, -1.697722, 0, 0, 0, 1, 1,
-2.323342, 0.2914975, -1.165905, 0, 0, 0, 1, 1,
-2.281043, 0.5032472, -0.5310208, 0, 0, 0, 1, 1,
-2.267639, 1.581248, -3.659603, 0, 0, 0, 1, 1,
-2.189273, -1.25685, -3.324012, 0, 0, 0, 1, 1,
-2.173823, 0.04075128, -2.265598, 1, 1, 1, 1, 1,
-2.155358, 0.7833055, -0.6577465, 1, 1, 1, 1, 1,
-2.11114, 0.7516705, -1.329262, 1, 1, 1, 1, 1,
-2.064502, -0.3959728, 1.113292, 1, 1, 1, 1, 1,
-2.037513, -0.307441, -1.493183, 1, 1, 1, 1, 1,
-2.036611, 0.4905927, -3.870082, 1, 1, 1, 1, 1,
-1.96808, 0.6080377, -1.062856, 1, 1, 1, 1, 1,
-1.91146, 0.05025016, -3.784354, 1, 1, 1, 1, 1,
-1.91146, -0.157018, -2.240642, 1, 1, 1, 1, 1,
-1.905335, -0.2310219, 0.4475736, 1, 1, 1, 1, 1,
-1.875437, 0.4054895, -1.572955, 1, 1, 1, 1, 1,
-1.875115, -1.547969, -0.8250581, 1, 1, 1, 1, 1,
-1.863481, 0.7293998, -2.100202, 1, 1, 1, 1, 1,
-1.853225, -1.81312, -2.945133, 1, 1, 1, 1, 1,
-1.845341, 0.1558911, -1.701202, 1, 1, 1, 1, 1,
-1.83712, 0.4259954, -2.332498, 0, 0, 1, 1, 1,
-1.835642, 0.3349127, -0.3275715, 1, 0, 0, 1, 1,
-1.834978, 0.2620019, -1.903512, 1, 0, 0, 1, 1,
-1.831765, 2.431889, 0.279623, 1, 0, 0, 1, 1,
-1.82435, 1.835989, -1.119776, 1, 0, 0, 1, 1,
-1.823438, 0.9209868, -1.69581, 1, 0, 0, 1, 1,
-1.819046, -0.195822, -1.859799, 0, 0, 0, 1, 1,
-1.814945, 0.4361765, -2.570619, 0, 0, 0, 1, 1,
-1.802993, -0.176188, -1.186337, 0, 0, 0, 1, 1,
-1.785399, -0.1590784, -2.557216, 0, 0, 0, 1, 1,
-1.765417, -1.253073, -1.274777, 0, 0, 0, 1, 1,
-1.748366, 0.5590398, 0.4512629, 0, 0, 0, 1, 1,
-1.731271, 0.5144052, -3.349974, 0, 0, 0, 1, 1,
-1.726209, 0.9598304, -1.993155, 1, 1, 1, 1, 1,
-1.726145, 0.5898437, -2.556216, 1, 1, 1, 1, 1,
-1.719831, -1.099821, -1.554369, 1, 1, 1, 1, 1,
-1.711408, -0.3979363, -1.957056, 1, 1, 1, 1, 1,
-1.711099, 1.269948, 0.6046844, 1, 1, 1, 1, 1,
-1.70592, -0.6596542, -0.3365742, 1, 1, 1, 1, 1,
-1.699599, -1.769072, -2.281871, 1, 1, 1, 1, 1,
-1.690007, -0.2832468, -3.75161, 1, 1, 1, 1, 1,
-1.684644, -0.6071892, -1.9804, 1, 1, 1, 1, 1,
-1.674808, 0.2474487, -1.357699, 1, 1, 1, 1, 1,
-1.66039, -0.3718366, -1.511447, 1, 1, 1, 1, 1,
-1.648916, 1.8201, 0.7765272, 1, 1, 1, 1, 1,
-1.637788, -0.09791905, -0.7071431, 1, 1, 1, 1, 1,
-1.637082, -0.4781795, -2.830201, 1, 1, 1, 1, 1,
-1.63343, -0.3705124, 0.1389575, 1, 1, 1, 1, 1,
-1.624421, -1.101148, -2.220292, 0, 0, 1, 1, 1,
-1.614776, -0.3923112, -4.106563, 1, 0, 0, 1, 1,
-1.608526, 0.4514618, -1.259037, 1, 0, 0, 1, 1,
-1.583884, -0.5261288, -1.50818, 1, 0, 0, 1, 1,
-1.571899, -0.9636926, -3.566813, 1, 0, 0, 1, 1,
-1.570293, 0.2572516, -1.949294, 1, 0, 0, 1, 1,
-1.556706, -0.1480534, -2.765076, 0, 0, 0, 1, 1,
-1.54753, 0.7499767, -1.719646, 0, 0, 0, 1, 1,
-1.54065, -1.290581, -3.552182, 0, 0, 0, 1, 1,
-1.538921, -1.238989, -1.113554, 0, 0, 0, 1, 1,
-1.524877, -0.3368012, -1.938793, 0, 0, 0, 1, 1,
-1.51506, -0.9181458, -1.630047, 0, 0, 0, 1, 1,
-1.511691, 1.505203, -1.743253, 0, 0, 0, 1, 1,
-1.497684, 1.351096, -0.3138601, 1, 1, 1, 1, 1,
-1.486271, -1.195912, -2.702144, 1, 1, 1, 1, 1,
-1.485773, 1.411949, -0.8992555, 1, 1, 1, 1, 1,
-1.46104, 0.9251127, -2.838982, 1, 1, 1, 1, 1,
-1.458354, 0.5372297, -2.220233, 1, 1, 1, 1, 1,
-1.440488, -0.2633435, -1.054493, 1, 1, 1, 1, 1,
-1.438346, -0.08114254, -0.7727922, 1, 1, 1, 1, 1,
-1.423423, -0.0670227, -1.616607, 1, 1, 1, 1, 1,
-1.417465, -1.338071, -2.397482, 1, 1, 1, 1, 1,
-1.40874, 0.5904509, -2.329011, 1, 1, 1, 1, 1,
-1.390155, -0.31421, -2.924171, 1, 1, 1, 1, 1,
-1.383616, -0.01059521, -1.284663, 1, 1, 1, 1, 1,
-1.377154, 1.2567, -0.9450939, 1, 1, 1, 1, 1,
-1.376977, -0.06485516, -1.80442, 1, 1, 1, 1, 1,
-1.371609, -0.3871966, -1.908438, 1, 1, 1, 1, 1,
-1.366119, 1.069842, 0.368259, 0, 0, 1, 1, 1,
-1.360294, -0.03466209, 0.07002437, 1, 0, 0, 1, 1,
-1.350428, 0.425051, -0.3689885, 1, 0, 0, 1, 1,
-1.346344, 1.279901, -1.86679, 1, 0, 0, 1, 1,
-1.346184, -0.2982256, -2.791132, 1, 0, 0, 1, 1,
-1.346137, -0.6132921, -1.438413, 1, 0, 0, 1, 1,
-1.345879, -0.2918221, -3.262614, 0, 0, 0, 1, 1,
-1.341973, 0.6847906, -0.3867548, 0, 0, 0, 1, 1,
-1.327929, -0.8587885, -1.962114, 0, 0, 0, 1, 1,
-1.321575, -1.350812, -2.559545, 0, 0, 0, 1, 1,
-1.304125, -1.10148, -3.11759, 0, 0, 0, 1, 1,
-1.303821, 0.9587252, -1.846415, 0, 0, 0, 1, 1,
-1.301436, -0.8584396, -3.258824, 0, 0, 0, 1, 1,
-1.287956, -1.40451, -1.536773, 1, 1, 1, 1, 1,
-1.287327, -0.6069782, -2.467961, 1, 1, 1, 1, 1,
-1.285062, -1.137137, -2.148947, 1, 1, 1, 1, 1,
-1.283075, 0.7754436, -0.6174979, 1, 1, 1, 1, 1,
-1.274774, 1.648616, -2.154943, 1, 1, 1, 1, 1,
-1.274256, -0.4878525, -2.361222, 1, 1, 1, 1, 1,
-1.263549, -0.1779296, -0.1573048, 1, 1, 1, 1, 1,
-1.253471, -0.001657781, -1.359057, 1, 1, 1, 1, 1,
-1.248193, -0.05928956, -2.950923, 1, 1, 1, 1, 1,
-1.24174, -2.441278, -3.169139, 1, 1, 1, 1, 1,
-1.230611, 0.8202372, -1.021421, 1, 1, 1, 1, 1,
-1.214178, 0.2681488, -0.6608483, 1, 1, 1, 1, 1,
-1.209853, 1.408475, 0.8028327, 1, 1, 1, 1, 1,
-1.20652, 0.397279, -1.103351, 1, 1, 1, 1, 1,
-1.204036, -0.491607, -4.251939, 1, 1, 1, 1, 1,
-1.197652, -1.85096, -2.453583, 0, 0, 1, 1, 1,
-1.1918, 0.8301028, 0.1108037, 1, 0, 0, 1, 1,
-1.173744, -0.6655088, -2.329781, 1, 0, 0, 1, 1,
-1.172526, 0.8876122, -1.352511, 1, 0, 0, 1, 1,
-1.172262, -1.284605, -2.304191, 1, 0, 0, 1, 1,
-1.162966, 0.03817884, -1.511156, 1, 0, 0, 1, 1,
-1.162036, -0.3919209, -3.08913, 0, 0, 0, 1, 1,
-1.157014, -0.5238895, -2.145061, 0, 0, 0, 1, 1,
-1.153812, 0.5538507, -3.184392, 0, 0, 0, 1, 1,
-1.152492, 1.294625, -0.9785053, 0, 0, 0, 1, 1,
-1.150164, 0.01708854, -2.46879, 0, 0, 0, 1, 1,
-1.147004, -0.4681507, -2.438287, 0, 0, 0, 1, 1,
-1.142469, 1.358471, -0.07467812, 0, 0, 0, 1, 1,
-1.138412, 1.445763, -2.228858, 1, 1, 1, 1, 1,
-1.138255, 0.2689775, -1.801646, 1, 1, 1, 1, 1,
-1.138015, -1.271273, -3.038043, 1, 1, 1, 1, 1,
-1.132718, -1.58124, -2.759782, 1, 1, 1, 1, 1,
-1.128183, 0.8878065, 0.3710583, 1, 1, 1, 1, 1,
-1.121121, -2.789207, -3.247834, 1, 1, 1, 1, 1,
-1.121022, -1.330322, -2.903764, 1, 1, 1, 1, 1,
-1.11988, -0.649812, -1.390119, 1, 1, 1, 1, 1,
-1.116566, 0.4514629, -2.233446, 1, 1, 1, 1, 1,
-1.112886, 1.306412, -1.675736, 1, 1, 1, 1, 1,
-1.112227, 0.1444273, -1.323855, 1, 1, 1, 1, 1,
-1.109654, -0.6815197, -2.869254, 1, 1, 1, 1, 1,
-1.105586, 0.451479, -0.07499097, 1, 1, 1, 1, 1,
-1.10162, 0.8888043, -1.549119, 1, 1, 1, 1, 1,
-1.093079, -1.326021, -1.07844, 1, 1, 1, 1, 1,
-1.090058, -0.4627687, -2.081369, 0, 0, 1, 1, 1,
-1.084568, 1.105472, -1.102727, 1, 0, 0, 1, 1,
-1.083545, 0.4392102, -1.1999, 1, 0, 0, 1, 1,
-1.077365, -0.6946213, -2.05697, 1, 0, 0, 1, 1,
-1.070361, 0.2722278, -2.39707, 1, 0, 0, 1, 1,
-1.064355, 1.799852, -1.193525, 1, 0, 0, 1, 1,
-1.060248, -0.4991415, -2.492634, 0, 0, 0, 1, 1,
-1.05077, -0.04629704, -3.310198, 0, 0, 0, 1, 1,
-1.047692, -0.9537587, -2.669302, 0, 0, 0, 1, 1,
-1.02792, 1.348916, 0.6882052, 0, 0, 0, 1, 1,
-1.021141, 0.6984525, -0.2515742, 0, 0, 0, 1, 1,
-1.020417, 1.6605, 0.481895, 0, 0, 0, 1, 1,
-1.010982, -0.3123524, -2.055262, 0, 0, 0, 1, 1,
-0.9950384, 0.3485926, -2.662899, 1, 1, 1, 1, 1,
-0.9924779, -0.9160779, -1.680183, 1, 1, 1, 1, 1,
-0.9862912, -0.5848832, -3.478809, 1, 1, 1, 1, 1,
-0.9558988, -0.1775885, -2.547047, 1, 1, 1, 1, 1,
-0.9530278, 1.93589, 0.5520385, 1, 1, 1, 1, 1,
-0.945492, -0.3326403, -1.056993, 1, 1, 1, 1, 1,
-0.9427874, -0.4866114, -1.989106, 1, 1, 1, 1, 1,
-0.9360462, -0.3661769, -3.009354, 1, 1, 1, 1, 1,
-0.9346035, -1.087236, -2.455027, 1, 1, 1, 1, 1,
-0.930432, 1.961167, -0.2746138, 1, 1, 1, 1, 1,
-0.9301551, -0.3500321, -0.9388871, 1, 1, 1, 1, 1,
-0.9275243, -0.7502109, -2.865183, 1, 1, 1, 1, 1,
-0.9239503, 0.1560195, -0.02189304, 1, 1, 1, 1, 1,
-0.9203225, -0.1591387, -2.451705, 1, 1, 1, 1, 1,
-0.9188274, 0.2691158, -1.466874, 1, 1, 1, 1, 1,
-0.917724, -0.9867993, -1.457996, 0, 0, 1, 1, 1,
-0.9156227, -0.719327, -2.744257, 1, 0, 0, 1, 1,
-0.9107073, -1.006535, -2.628172, 1, 0, 0, 1, 1,
-0.9041127, -0.09664159, -0.3889906, 1, 0, 0, 1, 1,
-0.8961932, 1.445585, -0.5090626, 1, 0, 0, 1, 1,
-0.8954597, -0.3294333, -1.72036, 1, 0, 0, 1, 1,
-0.8932898, -2.985244, -1.757118, 0, 0, 0, 1, 1,
-0.884881, -0.1362452, -1.361472, 0, 0, 0, 1, 1,
-0.8815532, -0.4284168, -2.004566, 0, 0, 0, 1, 1,
-0.8750556, -1.512776, -2.413676, 0, 0, 0, 1, 1,
-0.8716488, 0.2787233, -0.5792411, 0, 0, 0, 1, 1,
-0.8679999, -0.07479484, 0.1411646, 0, 0, 0, 1, 1,
-0.8670884, 1.02695, -0.9583015, 0, 0, 0, 1, 1,
-0.8661639, 0.513661, -0.4012835, 1, 1, 1, 1, 1,
-0.8588604, -1.113717, -4.221757, 1, 1, 1, 1, 1,
-0.8581415, -1.15904, -0.3791735, 1, 1, 1, 1, 1,
-0.8580405, 1.459794, -1.978161, 1, 1, 1, 1, 1,
-0.8576986, -0.2060546, -2.699449, 1, 1, 1, 1, 1,
-0.8506048, -0.1289904, -2.725967, 1, 1, 1, 1, 1,
-0.8462366, 0.5096637, -2.548163, 1, 1, 1, 1, 1,
-0.8434557, -0.2770635, -1.291597, 1, 1, 1, 1, 1,
-0.8422867, -1.097684, -2.135649, 1, 1, 1, 1, 1,
-0.8417188, -0.3706261, -1.168451, 1, 1, 1, 1, 1,
-0.8277568, -0.9458717, -1.071809, 1, 1, 1, 1, 1,
-0.8217232, 0.0528004, -1.590567, 1, 1, 1, 1, 1,
-0.8192348, -0.1499139, -2.582736, 1, 1, 1, 1, 1,
-0.8183901, 2.276417, 0.01042749, 1, 1, 1, 1, 1,
-0.8154557, -0.6625787, -2.252288, 1, 1, 1, 1, 1,
-0.8133793, -0.3381601, -0.5662432, 0, 0, 1, 1, 1,
-0.8070082, -2.499765, -2.628624, 1, 0, 0, 1, 1,
-0.8063313, 0.2709267, -0.8421932, 1, 0, 0, 1, 1,
-0.8030155, -0.2432165, -1.34772, 1, 0, 0, 1, 1,
-0.8010865, -0.1345928, -1.489381, 1, 0, 0, 1, 1,
-0.7954726, -0.2595792, -3.42409, 1, 0, 0, 1, 1,
-0.7941127, -1.348373, -2.972047, 0, 0, 0, 1, 1,
-0.7926969, 1.89205, 0.7890973, 0, 0, 0, 1, 1,
-0.7907997, 1.442093, -0.2892573, 0, 0, 0, 1, 1,
-0.7872793, -1.548149, -2.943873, 0, 0, 0, 1, 1,
-0.7832131, -0.5139783, -3.438548, 0, 0, 0, 1, 1,
-0.7828552, 1.12876, -0.3918275, 0, 0, 0, 1, 1,
-0.7780245, 0.01238648, -1.026456, 0, 0, 0, 1, 1,
-0.7778714, -1.937512, -3.702606, 1, 1, 1, 1, 1,
-0.7772307, -0.3096628, -1.7491, 1, 1, 1, 1, 1,
-0.7737694, -0.7586901, -1.429438, 1, 1, 1, 1, 1,
-0.7713596, -0.2523712, 1.077788, 1, 1, 1, 1, 1,
-0.770556, -0.1564013, -1.757269, 1, 1, 1, 1, 1,
-0.7694538, -0.1370613, -1.237444, 1, 1, 1, 1, 1,
-0.7682663, -0.1692034, -2.95926, 1, 1, 1, 1, 1,
-0.7666752, -0.1621221, -2.913579, 1, 1, 1, 1, 1,
-0.7653639, 1.636774, -1.126378, 1, 1, 1, 1, 1,
-0.7624816, -1.120848, -2.747143, 1, 1, 1, 1, 1,
-0.7559714, 0.3507161, -1.021704, 1, 1, 1, 1, 1,
-0.7553695, -0.3870718, -2.420509, 1, 1, 1, 1, 1,
-0.7542372, -1.848342, -2.354501, 1, 1, 1, 1, 1,
-0.753598, -0.3916112, -1.579936, 1, 1, 1, 1, 1,
-0.7456844, 0.9449871, 0.6354638, 1, 1, 1, 1, 1,
-0.7396609, 0.2046981, -0.3378772, 0, 0, 1, 1, 1,
-0.7387312, -0.01426262, -1.972788, 1, 0, 0, 1, 1,
-0.7376484, 0.04096704, -1.541982, 1, 0, 0, 1, 1,
-0.736398, -1.826349, -5.331797, 1, 0, 0, 1, 1,
-0.7284796, 2.53519, 0.5355641, 1, 0, 0, 1, 1,
-0.72842, 0.2167189, -1.375203, 1, 0, 0, 1, 1,
-0.7239141, 0.3613614, -1.122415, 0, 0, 0, 1, 1,
-0.7131501, 1.872509, 1.054478, 0, 0, 0, 1, 1,
-0.7110127, 0.3364612, -0.8287193, 0, 0, 0, 1, 1,
-0.7025777, -0.5428644, -1.535512, 0, 0, 0, 1, 1,
-0.6924152, 1.01632, -1.21224, 0, 0, 0, 1, 1,
-0.6919768, 0.1869927, -0.8405585, 0, 0, 0, 1, 1,
-0.6905303, -0.9587106, -3.581678, 0, 0, 0, 1, 1,
-0.6836966, -0.05446628, -2.169336, 1, 1, 1, 1, 1,
-0.6786034, -0.2850678, -3.164858, 1, 1, 1, 1, 1,
-0.6775372, 0.1976299, -1.501419, 1, 1, 1, 1, 1,
-0.676374, -0.6333663, -2.5791, 1, 1, 1, 1, 1,
-0.6761577, -1.066903, -3.29824, 1, 1, 1, 1, 1,
-0.673502, -0.1275408, -4.080842, 1, 1, 1, 1, 1,
-0.671407, -0.1862909, -0.7232028, 1, 1, 1, 1, 1,
-0.6686685, -1.27472, -2.090281, 1, 1, 1, 1, 1,
-0.6668811, -0.4856268, -2.487663, 1, 1, 1, 1, 1,
-0.6616011, -0.4314763, -1.416871, 1, 1, 1, 1, 1,
-0.6611059, -1.40176, -2.616732, 1, 1, 1, 1, 1,
-0.6567956, 0.6720146, -0.1609155, 1, 1, 1, 1, 1,
-0.6503375, 0.08085378, -1.222664, 1, 1, 1, 1, 1,
-0.6469152, 0.2615756, -0.7077661, 1, 1, 1, 1, 1,
-0.6447288, -0.4395152, -2.806847, 1, 1, 1, 1, 1,
-0.6432993, 0.4665828, 0.359411, 0, 0, 1, 1, 1,
-0.6386168, 0.7660294, -1.133363, 1, 0, 0, 1, 1,
-0.6366317, 1.042383, 0.3897083, 1, 0, 0, 1, 1,
-0.6286541, 0.6675072, -1.63418, 1, 0, 0, 1, 1,
-0.6264527, -1.045529, -1.794896, 1, 0, 0, 1, 1,
-0.6194974, 2.017386, -1.738268, 1, 0, 0, 1, 1,
-0.6156879, -0.9903253, -2.879352, 0, 0, 0, 1, 1,
-0.6110793, -0.1327423, -2.092152, 0, 0, 0, 1, 1,
-0.6062624, 0.4844865, -2.729382, 0, 0, 0, 1, 1,
-0.6053665, -0.08061479, -2.542919, 0, 0, 0, 1, 1,
-0.6043938, -1.840375, -2.121926, 0, 0, 0, 1, 1,
-0.6039268, -0.9463711, -3.004356, 0, 0, 0, 1, 1,
-0.6035041, 0.06822213, -0.6017944, 0, 0, 0, 1, 1,
-0.5970143, 2.85212, -0.3212241, 1, 1, 1, 1, 1,
-0.5925149, -1.870161, -3.348767, 1, 1, 1, 1, 1,
-0.5918244, 0.3415471, -2.424808, 1, 1, 1, 1, 1,
-0.5851499, 1.446942, 0.2628992, 1, 1, 1, 1, 1,
-0.5825861, 1.274335, -1.558663, 1, 1, 1, 1, 1,
-0.5793476, 0.2629276, -0.7213772, 1, 1, 1, 1, 1,
-0.575443, 0.8310201, -1.425145, 1, 1, 1, 1, 1,
-0.5734715, -2.16317, -2.218409, 1, 1, 1, 1, 1,
-0.5678169, 0.4405065, -1.873684, 1, 1, 1, 1, 1,
-0.5677208, -1.501989, -3.40147, 1, 1, 1, 1, 1,
-0.5647684, 1.473947, -1.382607, 1, 1, 1, 1, 1,
-0.5631643, -0.7698797, -3.496666, 1, 1, 1, 1, 1,
-0.5533411, -0.2373344, -3.163415, 1, 1, 1, 1, 1,
-0.5480946, -0.771761, -3.040933, 1, 1, 1, 1, 1,
-0.5463513, -0.3638856, -0.3374164, 1, 1, 1, 1, 1,
-0.5439605, -0.1590474, -0.9970038, 0, 0, 1, 1, 1,
-0.5408667, -1.227164, -3.376316, 1, 0, 0, 1, 1,
-0.5405499, 0.9112023, -1.0529, 1, 0, 0, 1, 1,
-0.5259209, 1.886906, -2.044112, 1, 0, 0, 1, 1,
-0.5253034, -2.309334, -2.842361, 1, 0, 0, 1, 1,
-0.5239367, 0.532158, 0.9969647, 1, 0, 0, 1, 1,
-0.5222782, 0.9085151, 0.6812493, 0, 0, 0, 1, 1,
-0.5211741, 0.918558, -1.727446, 0, 0, 0, 1, 1,
-0.5207598, 1.088304, -1.03076, 0, 0, 0, 1, 1,
-0.5194528, 0.1163599, -1.335007, 0, 0, 0, 1, 1,
-0.5162544, -1.834983, -2.631958, 0, 0, 0, 1, 1,
-0.5148667, -0.09521219, 0.4325467, 0, 0, 0, 1, 1,
-0.5132371, -0.6019564, -3.13169, 0, 0, 0, 1, 1,
-0.5103528, -0.1126388, -2.237925, 1, 1, 1, 1, 1,
-0.5101352, -2.087884, -3.60381, 1, 1, 1, 1, 1,
-0.5084668, 0.917992, 0.9727474, 1, 1, 1, 1, 1,
-0.5033544, -1.105307, -2.575424, 1, 1, 1, 1, 1,
-0.4936738, -0.2293185, -0.3452651, 1, 1, 1, 1, 1,
-0.4875683, -0.2151466, -2.26376, 1, 1, 1, 1, 1,
-0.4816968, 0.1425679, -2.702259, 1, 1, 1, 1, 1,
-0.4814296, -0.8709269, -1.182504, 1, 1, 1, 1, 1,
-0.480659, 0.285985, -1.487558, 1, 1, 1, 1, 1,
-0.4796992, 1.351433, -0.2045929, 1, 1, 1, 1, 1,
-0.4779111, -0.1212722, -1.387188, 1, 1, 1, 1, 1,
-0.4705857, 0.075849, -2.845806, 1, 1, 1, 1, 1,
-0.46997, 0.4057426, -1.304538, 1, 1, 1, 1, 1,
-0.4647925, 0.4776335, -0.2868849, 1, 1, 1, 1, 1,
-0.4604326, -0.8478581, -3.607864, 1, 1, 1, 1, 1,
-0.4576753, -0.4681594, -2.726352, 0, 0, 1, 1, 1,
-0.4554639, 1.676056, -2.224824, 1, 0, 0, 1, 1,
-0.4539889, -0.6961486, -1.628541, 1, 0, 0, 1, 1,
-0.4519723, -1.060345, -2.405543, 1, 0, 0, 1, 1,
-0.4470356, -0.3715906, -2.621949, 1, 0, 0, 1, 1,
-0.4445845, 1.114887, 1.919468, 1, 0, 0, 1, 1,
-0.4399956, -0.1548775, -2.788158, 0, 0, 0, 1, 1,
-0.4397524, 1.116515, -0.5041788, 0, 0, 0, 1, 1,
-0.4387813, 1.079514, -0.9152938, 0, 0, 0, 1, 1,
-0.4385677, -1.251049, -3.025935, 0, 0, 0, 1, 1,
-0.4355008, -0.09199434, -3.024881, 0, 0, 0, 1, 1,
-0.4354732, 0.0247237, -1.611589, 0, 0, 0, 1, 1,
-0.4309752, 1.18012, -1.148835, 0, 0, 0, 1, 1,
-0.4256576, 1.068714, 0.05418944, 1, 1, 1, 1, 1,
-0.4232822, -0.3913671, -3.595308, 1, 1, 1, 1, 1,
-0.4213037, 0.9155794, -0.7854633, 1, 1, 1, 1, 1,
-0.4132738, -0.1289724, -0.9709404, 1, 1, 1, 1, 1,
-0.4114647, -1.227111, -3.115646, 1, 1, 1, 1, 1,
-0.4083809, 1.56484, -0.2537469, 1, 1, 1, 1, 1,
-0.408254, 0.2274075, -0.4866009, 1, 1, 1, 1, 1,
-0.4073732, 1.417987, -0.1165498, 1, 1, 1, 1, 1,
-0.405748, 0.3326641, -0.4975426, 1, 1, 1, 1, 1,
-0.4017109, -0.202321, -1.626361, 1, 1, 1, 1, 1,
-0.4002844, -1.231628, -2.366023, 1, 1, 1, 1, 1,
-0.3949349, 1.377988, 0.1375378, 1, 1, 1, 1, 1,
-0.3923459, 0.4921933, 0.004189359, 1, 1, 1, 1, 1,
-0.3908604, 0.1681769, 0.1307222, 1, 1, 1, 1, 1,
-0.3905473, 3.181114, -0.6479224, 1, 1, 1, 1, 1,
-0.3882887, -0.6335241, -2.848424, 0, 0, 1, 1, 1,
-0.3882208, 0.3358461, -0.9209663, 1, 0, 0, 1, 1,
-0.387833, 0.1857037, -1.740005, 1, 0, 0, 1, 1,
-0.3696005, -1.044233, -2.555944, 1, 0, 0, 1, 1,
-0.3694299, -0.06527934, 0.4165804, 1, 0, 0, 1, 1,
-0.3677029, 0.2421213, -0.5422094, 1, 0, 0, 1, 1,
-0.36654, 0.5053508, -1.298937, 0, 0, 0, 1, 1,
-0.3649419, -0.3064565, -1.071102, 0, 0, 0, 1, 1,
-0.3623397, 0.002142212, -2.123927, 0, 0, 0, 1, 1,
-0.3591941, -0.4719454, -2.840723, 0, 0, 0, 1, 1,
-0.3575181, -1.253461, -2.766752, 0, 0, 0, 1, 1,
-0.357339, -0.1943353, -2.290748, 0, 0, 0, 1, 1,
-0.357221, -2.156055, -2.418716, 0, 0, 0, 1, 1,
-0.3560048, -0.9266127, -3.336591, 1, 1, 1, 1, 1,
-0.3532245, -0.1688327, -2.485304, 1, 1, 1, 1, 1,
-0.3510808, 0.2575122, -1.330721, 1, 1, 1, 1, 1,
-0.3479871, -0.7739564, -2.562238, 1, 1, 1, 1, 1,
-0.3458953, 0.1965611, -1.722242, 1, 1, 1, 1, 1,
-0.3444877, -1.634234, -3.569806, 1, 1, 1, 1, 1,
-0.3419139, -0.6252098, -3.224396, 1, 1, 1, 1, 1,
-0.3391941, -0.06193341, -2.501509, 1, 1, 1, 1, 1,
-0.3390233, -0.7832668, -2.341455, 1, 1, 1, 1, 1,
-0.3371025, 0.6535064, -1.728085, 1, 1, 1, 1, 1,
-0.3346681, 1.743697, -0.2183336, 1, 1, 1, 1, 1,
-0.3310557, 0.5611096, -2.015316, 1, 1, 1, 1, 1,
-0.3251666, -0.5702276, -2.775021, 1, 1, 1, 1, 1,
-0.3235022, 0.3218582, -1.127496, 1, 1, 1, 1, 1,
-0.3176951, -2.38997, -2.411598, 1, 1, 1, 1, 1,
-0.3139519, -0.6456524, -2.974858, 0, 0, 1, 1, 1,
-0.3136492, -0.9715464, -3.511692, 1, 0, 0, 1, 1,
-0.3092611, 0.1122243, -1.906996, 1, 0, 0, 1, 1,
-0.3035864, -0.4367613, -2.373951, 1, 0, 0, 1, 1,
-0.3022441, 0.8442336, -0.9017298, 1, 0, 0, 1, 1,
-0.2956328, -0.6921073, -1.886424, 1, 0, 0, 1, 1,
-0.2929403, 0.1809477, -0.1390591, 0, 0, 0, 1, 1,
-0.2920268, 0.6023591, 2.395344, 0, 0, 0, 1, 1,
-0.2897849, -1.272008, -3.690136, 0, 0, 0, 1, 1,
-0.2870414, -1.141473, -4.110299, 0, 0, 0, 1, 1,
-0.2862671, 0.2802259, -0.4770287, 0, 0, 0, 1, 1,
-0.2818421, 0.3988354, -2.36013, 0, 0, 0, 1, 1,
-0.2776129, 0.1329293, -1.324001, 0, 0, 0, 1, 1,
-0.2775093, -0.120332, -3.593325, 1, 1, 1, 1, 1,
-0.2757695, 0.8369663, 0.3598695, 1, 1, 1, 1, 1,
-0.2720425, 0.553815, 0.1635699, 1, 1, 1, 1, 1,
-0.2706357, 1.591632, -0.7447223, 1, 1, 1, 1, 1,
-0.2700574, 1.014968, -0.5208024, 1, 1, 1, 1, 1,
-0.2673238, 0.185314, -0.386191, 1, 1, 1, 1, 1,
-0.2666644, -0.2237238, -3.935571, 1, 1, 1, 1, 1,
-0.2633638, 0.6440714, 0.6931821, 1, 1, 1, 1, 1,
-0.2544277, -0.7328874, -2.775031, 1, 1, 1, 1, 1,
-0.251486, 0.3896575, -0.6156417, 1, 1, 1, 1, 1,
-0.2487711, -0.3556572, -1.759487, 1, 1, 1, 1, 1,
-0.243746, 0.1254133, -1.362231, 1, 1, 1, 1, 1,
-0.2417178, -0.3647015, -2.742775, 1, 1, 1, 1, 1,
-0.2409329, -0.9347552, -3.528854, 1, 1, 1, 1, 1,
-0.239815, 1.040454, -1.541427, 1, 1, 1, 1, 1,
-0.2393587, 1.822086, -1.166306, 0, 0, 1, 1, 1,
-0.2358342, 0.9034898, 0.1111481, 1, 0, 0, 1, 1,
-0.2354618, -1.675581, -1.520573, 1, 0, 0, 1, 1,
-0.2334819, -0.8344163, -2.325363, 1, 0, 0, 1, 1,
-0.2280304, 0.4226773, -2.364151, 1, 0, 0, 1, 1,
-0.2253827, 0.5327387, -1.655591, 1, 0, 0, 1, 1,
-0.2239015, 0.839389, 0.9036694, 0, 0, 0, 1, 1,
-0.2209848, -0.218273, -1.716344, 0, 0, 0, 1, 1,
-0.2177164, 2.318432, 1.667807, 0, 0, 0, 1, 1,
-0.2147865, 0.3622926, -0.2112554, 0, 0, 0, 1, 1,
-0.214318, -0.1481591, -2.571525, 0, 0, 0, 1, 1,
-0.2117752, -1.163715, -3.123973, 0, 0, 0, 1, 1,
-0.2089722, 0.7906694, 0.5842152, 0, 0, 0, 1, 1,
-0.2035361, 0.5267759, -0.03197758, 1, 1, 1, 1, 1,
-0.199333, 1.275612, 1.061517, 1, 1, 1, 1, 1,
-0.1944751, -0.5095739, -1.387667, 1, 1, 1, 1, 1,
-0.193494, -0.2130586, -1.965701, 1, 1, 1, 1, 1,
-0.190654, -0.9086992, -3.051931, 1, 1, 1, 1, 1,
-0.1883551, 0.2375189, -1.810358, 1, 1, 1, 1, 1,
-0.1851197, -1.924654, -3.948494, 1, 1, 1, 1, 1,
-0.1798169, -1.341279, -3.924057, 1, 1, 1, 1, 1,
-0.1791345, -0.1885193, -2.574605, 1, 1, 1, 1, 1,
-0.1787992, 0.005919388, -1.50652, 1, 1, 1, 1, 1,
-0.1771788, -0.3096107, -4.414016, 1, 1, 1, 1, 1,
-0.1747132, -0.9050173, -1.532417, 1, 1, 1, 1, 1,
-0.1744378, -1.00568, -3.560217, 1, 1, 1, 1, 1,
-0.1709376, 0.06430663, -0.9512946, 1, 1, 1, 1, 1,
-0.1707482, 1.350564, 0.3342811, 1, 1, 1, 1, 1,
-0.1699212, -1.697341, -3.964272, 0, 0, 1, 1, 1,
-0.1622949, 0.08606675, -0.1224339, 1, 0, 0, 1, 1,
-0.1583197, 0.08071469, -0.659965, 1, 0, 0, 1, 1,
-0.1580406, 1.959795, 0.007931232, 1, 0, 0, 1, 1,
-0.1572406, -0.886997, -3.199147, 1, 0, 0, 1, 1,
-0.1557576, -1.024737, -2.372141, 1, 0, 0, 1, 1,
-0.1539817, 0.8404063, -0.2201339, 0, 0, 0, 1, 1,
-0.1500003, -0.6380785, -1.750887, 0, 0, 0, 1, 1,
-0.1494564, 1.070923, 1.528274, 0, 0, 0, 1, 1,
-0.1494326, -0.2506452, -3.77624, 0, 0, 0, 1, 1,
-0.1435688, 0.9378832, 0.123423, 0, 0, 0, 1, 1,
-0.1413965, 0.7430974, -0.03775181, 0, 0, 0, 1, 1,
-0.1404052, -1.082131, -3.332698, 0, 0, 0, 1, 1,
-0.1384766, -0.03442382, -1.176871, 1, 1, 1, 1, 1,
-0.1300916, 1.375341, -0.412866, 1, 1, 1, 1, 1,
-0.1292422, -0.6786615, -3.525499, 1, 1, 1, 1, 1,
-0.1289084, 1.339975, 0.8905676, 1, 1, 1, 1, 1,
-0.1286425, 1.235236, 2.397519, 1, 1, 1, 1, 1,
-0.12856, 1.28185, -0.7376902, 1, 1, 1, 1, 1,
-0.1270812, 0.7384589, -0.2580067, 1, 1, 1, 1, 1,
-0.126272, -0.5716733, -3.577282, 1, 1, 1, 1, 1,
-0.1262029, 0.2930183, -0.2065742, 1, 1, 1, 1, 1,
-0.1256861, -2.184163, -3.221024, 1, 1, 1, 1, 1,
-0.1252389, 0.2605115, -0.4799016, 1, 1, 1, 1, 1,
-0.1239525, -0.6376158, -2.817047, 1, 1, 1, 1, 1,
-0.120872, 1.942291, -0.1951057, 1, 1, 1, 1, 1,
-0.1186015, -0.2983032, -3.857793, 1, 1, 1, 1, 1,
-0.1172817, -1.095241, -1.173643, 1, 1, 1, 1, 1,
-0.1134049, -0.1468191, -3.107263, 0, 0, 1, 1, 1,
-0.1128304, 0.1751538, -1.985665, 1, 0, 0, 1, 1,
-0.1117468, 0.7339332, 1.452231, 1, 0, 0, 1, 1,
-0.1085747, -1.009535, -2.750344, 1, 0, 0, 1, 1,
-0.1067265, -0.5616842, -4.277782, 1, 0, 0, 1, 1,
-0.09436081, -0.5510605, -1.744896, 1, 0, 0, 1, 1,
-0.08974297, -1.291294, -3.446601, 0, 0, 0, 1, 1,
-0.08945119, -0.5135874, -2.813796, 0, 0, 0, 1, 1,
-0.08633375, -1.083329, -3.495043, 0, 0, 0, 1, 1,
-0.08605375, -0.4667499, -3.132792, 0, 0, 0, 1, 1,
-0.08548819, -0.4782093, -4.278087, 0, 0, 0, 1, 1,
-0.08239361, 0.3818557, 0.06632189, 0, 0, 0, 1, 1,
-0.07643453, -0.06253748, -1.380314, 0, 0, 0, 1, 1,
-0.07483057, 1.745494, 1.573018, 1, 1, 1, 1, 1,
-0.07444036, 0.6393028, -0.07899523, 1, 1, 1, 1, 1,
-0.07011757, -0.8387305, -2.664225, 1, 1, 1, 1, 1,
-0.06950925, -0.9704381, -2.630345, 1, 1, 1, 1, 1,
-0.06662723, 0.6876666, -0.9239659, 1, 1, 1, 1, 1,
-0.06546587, 0.9149967, -0.7198361, 1, 1, 1, 1, 1,
-0.06346186, -1.631257, -2.971524, 1, 1, 1, 1, 1,
-0.05856917, 0.8415248, 0.4492491, 1, 1, 1, 1, 1,
-0.05845232, -1.775316, -2.291777, 1, 1, 1, 1, 1,
-0.05798632, 1.456265, 0.2582177, 1, 1, 1, 1, 1,
-0.05782281, -0.8575106, -2.977696, 1, 1, 1, 1, 1,
-0.0555955, -1.844177, -3.699199, 1, 1, 1, 1, 1,
-0.04554444, 0.2657614, 0.4451753, 1, 1, 1, 1, 1,
-0.03393638, 0.6850795, -0.2073499, 1, 1, 1, 1, 1,
-0.03118057, -0.3393822, -3.996465, 1, 1, 1, 1, 1,
-0.03100391, -0.9170824, -4.392381, 0, 0, 1, 1, 1,
-0.03074392, -1.058897, -2.86427, 1, 0, 0, 1, 1,
-0.03013632, -0.9862881, -2.047965, 1, 0, 0, 1, 1,
-0.02881241, -0.5063018, -3.142126, 1, 0, 0, 1, 1,
-0.02559923, 1.375779, 0.5192831, 1, 0, 0, 1, 1,
-0.02467647, -1.089594, -2.513991, 1, 0, 0, 1, 1,
-0.01955054, 0.002916825, -0.03976411, 0, 0, 0, 1, 1,
-0.01497383, 0.02511771, 0.1600263, 0, 0, 0, 1, 1,
-0.0144551, -0.2325354, -3.480332, 0, 0, 0, 1, 1,
-0.01303952, 0.1624116, -1.390986, 0, 0, 0, 1, 1,
-0.012045, 0.3447149, -0.5354233, 0, 0, 0, 1, 1,
-0.01167857, -0.8774801, -2.814559, 0, 0, 0, 1, 1,
-0.008987783, -1.915002, -2.740395, 0, 0, 0, 1, 1,
-0.002714931, -1.550189, -3.493158, 1, 1, 1, 1, 1,
-0.00147951, -1.182578, -4.176471, 1, 1, 1, 1, 1,
-0.0004949384, -0.8384418, -3.407855, 1, 1, 1, 1, 1,
0.001341375, 1.752141, -1.524707, 1, 1, 1, 1, 1,
0.002389673, -0.3245232, 3.120438, 1, 1, 1, 1, 1,
0.002725071, -0.382648, 2.617008, 1, 1, 1, 1, 1,
0.007111474, 0.07750343, 0.6196793, 1, 1, 1, 1, 1,
0.008533123, 0.6375411, 1.49914, 1, 1, 1, 1, 1,
0.008884911, 0.7854419, 0.630058, 1, 1, 1, 1, 1,
0.01289272, 0.9263694, 0.02816238, 1, 1, 1, 1, 1,
0.01353922, -0.3858764, 4.003471, 1, 1, 1, 1, 1,
0.0155924, 0.9076357, 0.1000306, 1, 1, 1, 1, 1,
0.02062273, 0.6519176, -0.0451364, 1, 1, 1, 1, 1,
0.02205468, -0.308395, 3.003484, 1, 1, 1, 1, 1,
0.02604715, -1.373731, 2.5857, 1, 1, 1, 1, 1,
0.027147, 1.18872, -1.630664, 0, 0, 1, 1, 1,
0.03015958, 0.4683416, 1.055784, 1, 0, 0, 1, 1,
0.03860268, -0.4821782, 3.570357, 1, 0, 0, 1, 1,
0.0418371, -0.5883731, 1.955411, 1, 0, 0, 1, 1,
0.04455569, 0.4824553, 1.039629, 1, 0, 0, 1, 1,
0.04589786, -2.252169, 4.622809, 1, 0, 0, 1, 1,
0.04803859, 1.889195, 0.5084969, 0, 0, 0, 1, 1,
0.04859457, 0.1386614, 0.08763559, 0, 0, 0, 1, 1,
0.04872876, 0.2073315, -0.5519864, 0, 0, 0, 1, 1,
0.05579585, 0.4112143, -0.1591648, 0, 0, 0, 1, 1,
0.05682575, -0.7831845, 2.971847, 0, 0, 0, 1, 1,
0.05863755, -0.5059815, 2.729766, 0, 0, 0, 1, 1,
0.06480741, 1.548345, 0.4032027, 0, 0, 0, 1, 1,
0.07648311, -0.7622639, 2.295268, 1, 1, 1, 1, 1,
0.07728238, 0.430565, -0.450157, 1, 1, 1, 1, 1,
0.07908832, -0.7332142, 2.531626, 1, 1, 1, 1, 1,
0.08198211, 1.521823, 0.08496089, 1, 1, 1, 1, 1,
0.08281087, -0.2553814, 2.236864, 1, 1, 1, 1, 1,
0.08339206, -0.5252558, 3.595352, 1, 1, 1, 1, 1,
0.08472507, 0.4589442, 0.5336836, 1, 1, 1, 1, 1,
0.08886494, -2.177563, 5.03706, 1, 1, 1, 1, 1,
0.09151492, 0.2071324, -1.309425, 1, 1, 1, 1, 1,
0.09516525, 0.2149961, 0.5341008, 1, 1, 1, 1, 1,
0.09835744, 1.849504, 0.29414, 1, 1, 1, 1, 1,
0.09876765, -0.8428916, 2.587199, 1, 1, 1, 1, 1,
0.1009299, 0.6486382, 0.2541183, 1, 1, 1, 1, 1,
0.105965, -0.9594188, 3.891991, 1, 1, 1, 1, 1,
0.1073512, -0.4496284, 1.390871, 1, 1, 1, 1, 1,
0.1146901, 1.080961, 0.883885, 0, 0, 1, 1, 1,
0.1166615, -1.589278, 1.680818, 1, 0, 0, 1, 1,
0.1166621, -0.7357229, 3.606242, 1, 0, 0, 1, 1,
0.1168511, 1.44999, 0.3366839, 1, 0, 0, 1, 1,
0.123196, -1.811059, 2.478154, 1, 0, 0, 1, 1,
0.1238, -0.4122888, 2.559912, 1, 0, 0, 1, 1,
0.1256332, -1.196062, 2.845835, 0, 0, 0, 1, 1,
0.1262275, 0.6648406, 0.5199351, 0, 0, 0, 1, 1,
0.1322881, -0.2885357, 3.613753, 0, 0, 0, 1, 1,
0.1390506, 0.6797642, 0.1090632, 0, 0, 0, 1, 1,
0.1440023, -0.1883574, 2.768835, 0, 0, 0, 1, 1,
0.1489929, -0.9054829, 4.437394, 0, 0, 0, 1, 1,
0.1493686, 0.5582607, 0.543839, 0, 0, 0, 1, 1,
0.1540076, 0.1813977, -0.0586927, 1, 1, 1, 1, 1,
0.1601238, 0.4452915, 0.5243855, 1, 1, 1, 1, 1,
0.1616713, 1.383324, 0.9178815, 1, 1, 1, 1, 1,
0.163084, 0.1727966, 0.203784, 1, 1, 1, 1, 1,
0.1633082, -0.5751393, 1.739563, 1, 1, 1, 1, 1,
0.1643119, -0.6139374, 1.835356, 1, 1, 1, 1, 1,
0.1652737, -1.064746, 3.262436, 1, 1, 1, 1, 1,
0.1655837, 1.251624, -0.1680729, 1, 1, 1, 1, 1,
0.1734407, -2.133805, 4.627951, 1, 1, 1, 1, 1,
0.1754553, -1.662471, 4.072157, 1, 1, 1, 1, 1,
0.1780902, 0.7306663, 2.237233, 1, 1, 1, 1, 1,
0.1787361, 0.4468336, 0.4506489, 1, 1, 1, 1, 1,
0.1790859, -0.02042007, 1.217352, 1, 1, 1, 1, 1,
0.1831246, 0.1448144, -0.3421842, 1, 1, 1, 1, 1,
0.1842073, 0.004648575, 0.6045118, 1, 1, 1, 1, 1,
0.1845265, 0.7586084, 1.618446, 0, 0, 1, 1, 1,
0.1864462, 0.09609757, 1.195626, 1, 0, 0, 1, 1,
0.1871757, 0.8750349, 0.8559256, 1, 0, 0, 1, 1,
0.1886578, 0.8282338, 1.941436, 1, 0, 0, 1, 1,
0.1918196, 0.04675891, 1.728585, 1, 0, 0, 1, 1,
0.1940614, 0.5850784, -0.4789273, 1, 0, 0, 1, 1,
0.1951667, -0.5776795, 3.974339, 0, 0, 0, 1, 1,
0.1964342, -1.040084, 4.328047, 0, 0, 0, 1, 1,
0.1984156, -0.2533855, 2.200023, 0, 0, 0, 1, 1,
0.207261, -0.7947871, 2.500011, 0, 0, 0, 1, 1,
0.2076821, -1.189844, 4.016484, 0, 0, 0, 1, 1,
0.2138024, 0.3055351, -0.9895818, 0, 0, 0, 1, 1,
0.2174513, 0.8035322, -0.206211, 0, 0, 0, 1, 1,
0.2183352, 0.4948897, -0.1968479, 1, 1, 1, 1, 1,
0.2189143, -0.4663607, 3.496536, 1, 1, 1, 1, 1,
0.2215784, 0.3663644, 1.986284, 1, 1, 1, 1, 1,
0.2257379, -0.5278959, 3.606485, 1, 1, 1, 1, 1,
0.2272445, -1.834976, 1.912055, 1, 1, 1, 1, 1,
0.2283624, -0.3793078, 0.2335426, 1, 1, 1, 1, 1,
0.2301315, -1.165916, 3.30232, 1, 1, 1, 1, 1,
0.2321123, -0.1575017, 1.210787, 1, 1, 1, 1, 1,
0.2323563, -0.6881308, 2.327181, 1, 1, 1, 1, 1,
0.2323714, -0.1346187, 3.485475, 1, 1, 1, 1, 1,
0.2373774, -0.6765805, 2.328863, 1, 1, 1, 1, 1,
0.2405306, -1.447458, 2.081498, 1, 1, 1, 1, 1,
0.2405626, -0.9573197, 3.152004, 1, 1, 1, 1, 1,
0.2424268, -1.040952, 2.668203, 1, 1, 1, 1, 1,
0.2427265, 0.2104595, 1.177094, 1, 1, 1, 1, 1,
0.2441946, -0.6542977, 0.8762816, 0, 0, 1, 1, 1,
0.2443266, 0.9863966, -0.03236897, 1, 0, 0, 1, 1,
0.2444423, -0.2167296, 2.830474, 1, 0, 0, 1, 1,
0.2452267, 0.6102838, -0.7802725, 1, 0, 0, 1, 1,
0.2468936, -0.330957, 2.412418, 1, 0, 0, 1, 1,
0.2476736, -0.4103269, 1.728328, 1, 0, 0, 1, 1,
0.2504099, -0.3253202, 1.401466, 0, 0, 0, 1, 1,
0.2527972, -0.2063448, 1.2775, 0, 0, 0, 1, 1,
0.2538716, -0.9053845, 1.337506, 0, 0, 0, 1, 1,
0.2601649, 1.558226, 1.104535, 0, 0, 0, 1, 1,
0.2619266, 1.722981, 1.128138, 0, 0, 0, 1, 1,
0.2662698, -0.3343509, 3.630208, 0, 0, 0, 1, 1,
0.2690493, 0.4555836, 0.134163, 0, 0, 0, 1, 1,
0.26991, -0.2966308, 2.750893, 1, 1, 1, 1, 1,
0.2821482, 1.137669, 1.27606, 1, 1, 1, 1, 1,
0.2838456, -1.759141, 4.291933, 1, 1, 1, 1, 1,
0.2845823, -2.238816, 1.930201, 1, 1, 1, 1, 1,
0.2888355, -0.1223213, 2.641178, 1, 1, 1, 1, 1,
0.3055585, 1.609202, 1.891086, 1, 1, 1, 1, 1,
0.3172072, -0.2483487, 1.05078, 1, 1, 1, 1, 1,
0.3174397, 0.8731623, -0.564937, 1, 1, 1, 1, 1,
0.3245625, -0.01839888, -1.187238, 1, 1, 1, 1, 1,
0.3255068, 0.10948, -2.360505, 1, 1, 1, 1, 1,
0.3334129, -0.06690324, 2.551995, 1, 1, 1, 1, 1,
0.338561, 2.207034, -0.7721276, 1, 1, 1, 1, 1,
0.342811, -0.5216686, 0.6082154, 1, 1, 1, 1, 1,
0.344211, -2.035182, 3.268399, 1, 1, 1, 1, 1,
0.3457694, -0.8018838, 1.992967, 1, 1, 1, 1, 1,
0.3487636, 0.1423634, 0.8375664, 0, 0, 1, 1, 1,
0.3500849, 0.2827771, 2.677933, 1, 0, 0, 1, 1,
0.3529232, 1.802533, -1.474147, 1, 0, 0, 1, 1,
0.3537909, 2.262732, -1.007139, 1, 0, 0, 1, 1,
0.3569277, 0.4000035, 1.25146, 1, 0, 0, 1, 1,
0.3590521, 0.7989438, -1.535523, 1, 0, 0, 1, 1,
0.3591626, 0.1248293, 2.957435, 0, 0, 0, 1, 1,
0.3654807, 0.2607528, 1.502523, 0, 0, 0, 1, 1,
0.3664944, 1.449082, 1.031201, 0, 0, 0, 1, 1,
0.3668058, -1.612376, 4.031833, 0, 0, 0, 1, 1,
0.3685297, 1.55013, 0.2703178, 0, 0, 0, 1, 1,
0.3727427, -1.674911, 0.667446, 0, 0, 0, 1, 1,
0.3779132, -0.041302, 2.236431, 0, 0, 0, 1, 1,
0.3782931, 0.4227279, 0.9116991, 1, 1, 1, 1, 1,
0.3844273, -0.4260008, 2.983444, 1, 1, 1, 1, 1,
0.3878909, 0.8100039, -0.2304823, 1, 1, 1, 1, 1,
0.3880575, -1.251673, 2.270253, 1, 1, 1, 1, 1,
0.3884557, 0.1654946, 2.383729, 1, 1, 1, 1, 1,
0.3935263, 0.2832536, 1.477146, 1, 1, 1, 1, 1,
0.3951233, 1.655288, 2.556672, 1, 1, 1, 1, 1,
0.3953459, -1.65063, 1.906496, 1, 1, 1, 1, 1,
0.396972, 0.7747681, 1.193174, 1, 1, 1, 1, 1,
0.4000647, -0.4938687, 1.312857, 1, 1, 1, 1, 1,
0.4002502, 2.021116, -0.1804969, 1, 1, 1, 1, 1,
0.4002537, 2.044806, 0.2830331, 1, 1, 1, 1, 1,
0.403494, -1.103129, 3.436002, 1, 1, 1, 1, 1,
0.4036587, 0.8953541, -0.6667953, 1, 1, 1, 1, 1,
0.4052686, 0.7746974, 0.1510541, 1, 1, 1, 1, 1,
0.4062391, 1.6718, 1.648623, 0, 0, 1, 1, 1,
0.4150134, 0.6360155, -0.5759215, 1, 0, 0, 1, 1,
0.4159065, 0.778809, 0.9295809, 1, 0, 0, 1, 1,
0.4171112, 0.3905244, 1.384201, 1, 0, 0, 1, 1,
0.4174048, 0.7402516, 1.166996, 1, 0, 0, 1, 1,
0.4176021, 0.7775429, 0.4274497, 1, 0, 0, 1, 1,
0.423677, 0.06383076, 1.885289, 0, 0, 0, 1, 1,
0.4290987, 0.2412723, 0.9822802, 0, 0, 0, 1, 1,
0.4309109, -0.3751797, 0.4758995, 0, 0, 0, 1, 1,
0.4319636, -0.09916316, 0.397238, 0, 0, 0, 1, 1,
0.4325847, 0.2299142, 0.5389985, 0, 0, 0, 1, 1,
0.4329135, 1.047999, -0.9829352, 0, 0, 0, 1, 1,
0.433057, 1.038099, -0.3910206, 0, 0, 0, 1, 1,
0.4351805, 1.794552, -0.03932864, 1, 1, 1, 1, 1,
0.4354858, 1.550829, 1.047838, 1, 1, 1, 1, 1,
0.4363278, -2.516476, 2.485005, 1, 1, 1, 1, 1,
0.4368204, -1.553365, 2.001374, 1, 1, 1, 1, 1,
0.4388723, 0.4868196, 0.3584754, 1, 1, 1, 1, 1,
0.4393846, 0.8930198, -0.9409696, 1, 1, 1, 1, 1,
0.4409818, -1.257587, 3.113529, 1, 1, 1, 1, 1,
0.4413092, 0.1864516, 0.4091384, 1, 1, 1, 1, 1,
0.4445034, 0.162109, 0.4992892, 1, 1, 1, 1, 1,
0.4463683, -0.1016001, 2.841601, 1, 1, 1, 1, 1,
0.4464875, 0.8607658, 1.16954, 1, 1, 1, 1, 1,
0.4470671, -1.160522, 4.22757, 1, 1, 1, 1, 1,
0.4510075, 1.239447, -0.1753223, 1, 1, 1, 1, 1,
0.4526964, 0.1366965, 1.224039, 1, 1, 1, 1, 1,
0.4564425, 1.386475, 1.025209, 1, 1, 1, 1, 1,
0.4624963, 0.9044613, 0.9352577, 0, 0, 1, 1, 1,
0.4836818, 0.1930264, 1.706679, 1, 0, 0, 1, 1,
0.4862548, -0.3221714, 1.152152, 1, 0, 0, 1, 1,
0.4865986, -0.04228, 1.892174, 1, 0, 0, 1, 1,
0.4915155, -0.3573547, 1.259421, 1, 0, 0, 1, 1,
0.4923138, 0.765892, 2.633096, 1, 0, 0, 1, 1,
0.4962151, 0.2691472, 0.6680217, 0, 0, 0, 1, 1,
0.4989437, -0.002778218, 0.6484999, 0, 0, 0, 1, 1,
0.5081418, 1.252306, -1.480216, 0, 0, 0, 1, 1,
0.5089981, -0.1100104, 2.511159, 0, 0, 0, 1, 1,
0.5095004, -1.283454, 3.386448, 0, 0, 0, 1, 1,
0.5106801, 1.701153, 2.06988, 0, 0, 0, 1, 1,
0.5184891, 0.6021968, 2.08288, 0, 0, 0, 1, 1,
0.5229581, 0.9544885, -0.3702332, 1, 1, 1, 1, 1,
0.5248035, -1.106976, 3.12992, 1, 1, 1, 1, 1,
0.533506, 1.488003, -0.1343265, 1, 1, 1, 1, 1,
0.5351769, 0.566467, -0.0906725, 1, 1, 1, 1, 1,
0.5358846, 0.139964, 0.3098893, 1, 1, 1, 1, 1,
0.5386553, 0.8361329, 0.3063415, 1, 1, 1, 1, 1,
0.5389499, 0.1693114, 2.109961, 1, 1, 1, 1, 1,
0.539914, 1.799836, 1.272294, 1, 1, 1, 1, 1,
0.548972, -0.1863659, 1.774344, 1, 1, 1, 1, 1,
0.5506971, -2.278053, 2.190041, 1, 1, 1, 1, 1,
0.5519686, -0.5942636, 2.607074, 1, 1, 1, 1, 1,
0.55265, 0.2378132, 0.8063953, 1, 1, 1, 1, 1,
0.5563847, 0.5704718, 0.7017769, 1, 1, 1, 1, 1,
0.5571042, -0.06913487, 1.55069, 1, 1, 1, 1, 1,
0.5599301, -1.455975, 3.306563, 1, 1, 1, 1, 1,
0.5616884, 0.5308014, 0.8448515, 0, 0, 1, 1, 1,
0.5641754, -0.677673, 0.4057462, 1, 0, 0, 1, 1,
0.5736884, -0.741514, 2.427412, 1, 0, 0, 1, 1,
0.5753072, 0.5926964, 0.1069439, 1, 0, 0, 1, 1,
0.5831745, 0.4275907, -0.2476852, 1, 0, 0, 1, 1,
0.5850986, 0.6957234, 1.464652, 1, 0, 0, 1, 1,
0.5884764, -2.208267, 3.493842, 0, 0, 0, 1, 1,
0.5966713, 1.456805, 0.1542376, 0, 0, 0, 1, 1,
0.5970882, 1.607515, -0.1518559, 0, 0, 0, 1, 1,
0.5987732, -0.3207246, 2.708496, 0, 0, 0, 1, 1,
0.5998725, 0.3077525, 0.08477588, 0, 0, 0, 1, 1,
0.6031228, -0.5472912, 1.267295, 0, 0, 0, 1, 1,
0.6111546, -0.3892817, 2.735672, 0, 0, 0, 1, 1,
0.6140712, -0.434877, 1.933653, 1, 1, 1, 1, 1,
0.6162741, -0.167355, 0.5967934, 1, 1, 1, 1, 1,
0.6185288, -0.2631247, 1.133358, 1, 1, 1, 1, 1,
0.6212327, 0.3089507, 1.620644, 1, 1, 1, 1, 1,
0.6219204, -0.9712384, 3.097985, 1, 1, 1, 1, 1,
0.624474, -1.717973, 2.239172, 1, 1, 1, 1, 1,
0.6246526, 2.283757, -0.6963709, 1, 1, 1, 1, 1,
0.629985, 1.651339, 0.1497227, 1, 1, 1, 1, 1,
0.6309763, 0.5168103, 0.7482453, 1, 1, 1, 1, 1,
0.6409482, -0.5330786, 0.8103718, 1, 1, 1, 1, 1,
0.6409517, 1.13352, 1.388991, 1, 1, 1, 1, 1,
0.6428842, 0.5709373, 0.415502, 1, 1, 1, 1, 1,
0.6493832, 0.9669164, 1.831432, 1, 1, 1, 1, 1,
0.6497191, 0.508306, 2.732961, 1, 1, 1, 1, 1,
0.6536876, -1.077693, 2.135615, 1, 1, 1, 1, 1,
0.6548092, -0.07644299, 2.629333, 0, 0, 1, 1, 1,
0.6585101, -0.1566884, 1.847737, 1, 0, 0, 1, 1,
0.6663483, -0.003445123, 1.722352, 1, 0, 0, 1, 1,
0.6700127, -0.9542298, 1.430678, 1, 0, 0, 1, 1,
0.6701367, 1.462136, 1.607147, 1, 0, 0, 1, 1,
0.6806481, -2.102503, 2.569939, 1, 0, 0, 1, 1,
0.6872209, 0.4263115, -0.8519654, 0, 0, 0, 1, 1,
0.6904076, -1.877773, 3.465305, 0, 0, 0, 1, 1,
0.6966278, 0.4052809, 1.386117, 0, 0, 0, 1, 1,
0.6977704, 0.5284729, -0.7276562, 0, 0, 0, 1, 1,
0.6986948, 1.230772, -0.2376084, 0, 0, 0, 1, 1,
0.699799, -0.8098676, 2.503916, 0, 0, 0, 1, 1,
0.7015708, 0.2365614, 1.031897, 0, 0, 0, 1, 1,
0.7024814, 2.775863, 0.5840174, 1, 1, 1, 1, 1,
0.7026232, 0.9153605, 0.5863784, 1, 1, 1, 1, 1,
0.7114431, -0.3032218, 2.306451, 1, 1, 1, 1, 1,
0.7137067, -2.446655, 2.217092, 1, 1, 1, 1, 1,
0.7239258, 0.8399141, 0.67039, 1, 1, 1, 1, 1,
0.7298996, 0.0772247, 2.709826, 1, 1, 1, 1, 1,
0.7315015, 1.579268, -0.3108228, 1, 1, 1, 1, 1,
0.7347968, 0.6362083, 0.6019446, 1, 1, 1, 1, 1,
0.7348565, -1.913251, 4.604145, 1, 1, 1, 1, 1,
0.7354371, 0.8784535, 0.5462777, 1, 1, 1, 1, 1,
0.7437732, -0.3182971, 1.550006, 1, 1, 1, 1, 1,
0.7441284, -0.6952174, 3.412451, 1, 1, 1, 1, 1,
0.7448529, -0.8091183, 3.370091, 1, 1, 1, 1, 1,
0.7476287, 0.3160231, 1.794092, 1, 1, 1, 1, 1,
0.7497892, -0.07786846, 2.298549, 1, 1, 1, 1, 1,
0.7502621, -1.017668, 2.940446, 0, 0, 1, 1, 1,
0.7509668, 1.522007, 0.8947276, 1, 0, 0, 1, 1,
0.7513256, 0.8953559, 0.2900051, 1, 0, 0, 1, 1,
0.7564832, -0.352121, 1.695651, 1, 0, 0, 1, 1,
0.7603468, 0.07192958, 2.719691, 1, 0, 0, 1, 1,
0.7626967, -0.1786352, 1.330826, 1, 0, 0, 1, 1,
0.763343, -0.7986467, 4.112803, 0, 0, 0, 1, 1,
0.7663605, -1.050682, 3.831318, 0, 0, 0, 1, 1,
0.7874408, -0.558112, 3.759975, 0, 0, 0, 1, 1,
0.7879437, -1.046364, 3.687618, 0, 0, 0, 1, 1,
0.7894539, -0.2845061, 4.345508, 0, 0, 0, 1, 1,
0.7972399, -0.5891215, 3.446431, 0, 0, 0, 1, 1,
0.8003481, 1.075832, 3.047797, 0, 0, 0, 1, 1,
0.8023624, 1.604448, -0.987665, 1, 1, 1, 1, 1,
0.8050393, 0.7274474, 0.8667731, 1, 1, 1, 1, 1,
0.8053991, 2.4195, 0.6751578, 1, 1, 1, 1, 1,
0.8107985, 0.5245286, 1.212657, 1, 1, 1, 1, 1,
0.8115398, 0.4590203, 1.755126, 1, 1, 1, 1, 1,
0.8119044, -1.550264, 2.473525, 1, 1, 1, 1, 1,
0.8126088, -0.5192635, 2.837401, 1, 1, 1, 1, 1,
0.8128842, -0.2092479, 0.8608675, 1, 1, 1, 1, 1,
0.8228155, -0.4482094, 1.722498, 1, 1, 1, 1, 1,
0.8258086, -0.1166708, 1.196759, 1, 1, 1, 1, 1,
0.8274338, -1.046214, 2.772515, 1, 1, 1, 1, 1,
0.8292665, -0.3998675, 1.672817, 1, 1, 1, 1, 1,
0.8299991, 0.2274075, 0.6711507, 1, 1, 1, 1, 1,
0.8347946, -0.9120833, 2.467276, 1, 1, 1, 1, 1,
0.8358084, -0.298482, 2.368391, 1, 1, 1, 1, 1,
0.8378415, -0.8418334, 1.924866, 0, 0, 1, 1, 1,
0.8403447, -0.36363, 2.265703, 1, 0, 0, 1, 1,
0.8431431, 0.6753616, 0.5477922, 1, 0, 0, 1, 1,
0.8458008, -0.5299441, 1.201767, 1, 0, 0, 1, 1,
0.8471455, 1.047627, 1.14539, 1, 0, 0, 1, 1,
0.8735471, 0.5196743, 2.401343, 1, 0, 0, 1, 1,
0.8750739, 2.030914, -0.4577129, 0, 0, 0, 1, 1,
0.8796129, -0.1892762, 0.0762136, 0, 0, 0, 1, 1,
0.8833244, -0.5368306, 1.914751, 0, 0, 0, 1, 1,
0.8879399, 1.624142, 0.8066515, 0, 0, 0, 1, 1,
0.8956262, 1.24814, 0.5429379, 0, 0, 0, 1, 1,
0.8962367, 2.338263, 0.6765776, 0, 0, 0, 1, 1,
0.8970711, 2.589136, 0.3272248, 0, 0, 0, 1, 1,
0.9032397, -0.9392324, 2.97978, 1, 1, 1, 1, 1,
0.9038809, 0.9146139, 0.9277352, 1, 1, 1, 1, 1,
0.9068718, -0.8432994, 3.284912, 1, 1, 1, 1, 1,
0.9078983, 1.054912, 2.245, 1, 1, 1, 1, 1,
0.9081213, -0.4123244, 1.627996, 1, 1, 1, 1, 1,
0.9155983, 0.2098293, 2.253074, 1, 1, 1, 1, 1,
0.9163342, 0.3488344, 1.0102, 1, 1, 1, 1, 1,
0.9181396, 0.8391628, 0.3030903, 1, 1, 1, 1, 1,
0.920709, 1.281881, 0.6278675, 1, 1, 1, 1, 1,
0.9233023, -0.2105481, 1.188479, 1, 1, 1, 1, 1,
0.9246723, 0.927262, -0.8036532, 1, 1, 1, 1, 1,
0.937378, 1.692429, -0.1849445, 1, 1, 1, 1, 1,
0.9386051, -1.106958, 3.21792, 1, 1, 1, 1, 1,
0.9407406, 0.06461811, 0.3016124, 1, 1, 1, 1, 1,
0.942082, 0.5220811, 1.422597, 1, 1, 1, 1, 1,
0.9437914, 1.007147, 0.8232659, 0, 0, 1, 1, 1,
0.9465979, -0.007846757, 0.3218855, 1, 0, 0, 1, 1,
0.9481558, 0.1172768, 0.4578734, 1, 0, 0, 1, 1,
0.95083, 0.7990342, 1.266609, 1, 0, 0, 1, 1,
0.9577222, -0.103075, 1.768607, 1, 0, 0, 1, 1,
0.9600897, -0.50136, 3.222098, 1, 0, 0, 1, 1,
0.9651333, 0.03657117, 1.232501, 0, 0, 0, 1, 1,
0.9783144, 1.553756, 0.1038311, 0, 0, 0, 1, 1,
0.9793743, -0.3626488, 2.692659, 0, 0, 0, 1, 1,
0.9804882, -0.5933201, 3.713465, 0, 0, 0, 1, 1,
0.9816674, 1.082009, 1.085763, 0, 0, 0, 1, 1,
0.9820347, -0.6405167, 1.096058, 0, 0, 0, 1, 1,
0.9862986, 0.4111728, 0.4337873, 0, 0, 0, 1, 1,
0.9881596, 0.6707715, 0.4097593, 1, 1, 1, 1, 1,
0.9921981, 1.163668, 0.9136575, 1, 1, 1, 1, 1,
0.9940931, 0.2994733, 1.333292, 1, 1, 1, 1, 1,
0.9984342, -0.3017513, 0.7525076, 1, 1, 1, 1, 1,
1.003964, 0.3226058, 0.2432187, 1, 1, 1, 1, 1,
1.011876, -1.784547, 2.472432, 1, 1, 1, 1, 1,
1.017747, 1.23433, -0.4028437, 1, 1, 1, 1, 1,
1.022637, 0.1189901, 1.85584, 1, 1, 1, 1, 1,
1.024847, -1.961338, 2.899753, 1, 1, 1, 1, 1,
1.025127, -0.2265611, 1.695199, 1, 1, 1, 1, 1,
1.029399, -0.2189036, 3.040813, 1, 1, 1, 1, 1,
1.034128, 1.115835, 0.1791041, 1, 1, 1, 1, 1,
1.034712, -0.6255293, 2.302498, 1, 1, 1, 1, 1,
1.042249, -0.4745889, 1.791403, 1, 1, 1, 1, 1,
1.044964, 0.1814212, 2.329798, 1, 1, 1, 1, 1,
1.048394, 1.707037, 1.086688, 0, 0, 1, 1, 1,
1.049939, 0.8367119, 0.5031079, 1, 0, 0, 1, 1,
1.051315, 1.002341, 0.7787067, 1, 0, 0, 1, 1,
1.055782, -1.006558, 3.085752, 1, 0, 0, 1, 1,
1.05742, 0.9299565, -0.2856135, 1, 0, 0, 1, 1,
1.059156, -0.1414344, 1.284745, 1, 0, 0, 1, 1,
1.060382, -2.263086, 3.745534, 0, 0, 0, 1, 1,
1.063687, 1.355743, 0.1711677, 0, 0, 0, 1, 1,
1.066079, 0.1997448, 0.910861, 0, 0, 0, 1, 1,
1.067414, 0.1577004, 0.5550544, 0, 0, 0, 1, 1,
1.073772, 0.1665174, 1.492516, 0, 0, 0, 1, 1,
1.074786, 0.04907274, 1.622322, 0, 0, 0, 1, 1,
1.081544, -1.501209, 3.131432, 0, 0, 0, 1, 1,
1.085948, 0.5707502, 3.101511, 1, 1, 1, 1, 1,
1.08768, -1.290748, 2.623855, 1, 1, 1, 1, 1,
1.088449, -0.1700032, 1.176464, 1, 1, 1, 1, 1,
1.090318, 0.2895246, 1.854105, 1, 1, 1, 1, 1,
1.092071, -0.7824582, 3.692049, 1, 1, 1, 1, 1,
1.09661, 0.7001619, 0.6077685, 1, 1, 1, 1, 1,
1.103945, -0.3245823, 1.585206, 1, 1, 1, 1, 1,
1.104998, -0.37502, 2.992048, 1, 1, 1, 1, 1,
1.107583, 1.887745, 0.7151837, 1, 1, 1, 1, 1,
1.11904, 1.350961, -1.059149, 1, 1, 1, 1, 1,
1.119419, 0.5214586, 2.007738, 1, 1, 1, 1, 1,
1.120455, -0.6065679, 1.371719, 1, 1, 1, 1, 1,
1.121008, 0.07020134, 1.473767, 1, 1, 1, 1, 1,
1.122546, -2.251832, 2.548269, 1, 1, 1, 1, 1,
1.125723, 0.4023979, -0.2168244, 1, 1, 1, 1, 1,
1.129746, -0.9684309, 1.142914, 0, 0, 1, 1, 1,
1.131251, -1.485599, 1.573743, 1, 0, 0, 1, 1,
1.132074, -1.327937, 3.743582, 1, 0, 0, 1, 1,
1.13709, 1.616959, 0.1130849, 1, 0, 0, 1, 1,
1.138479, -0.7405642, 1.728677, 1, 0, 0, 1, 1,
1.148304, -0.4066026, 3.325943, 1, 0, 0, 1, 1,
1.151265, -0.03595488, -0.7945339, 0, 0, 0, 1, 1,
1.151896, -1.022081, 2.398281, 0, 0, 0, 1, 1,
1.165542, -1.036601, 3.078856, 0, 0, 0, 1, 1,
1.166004, 0.05902723, 1.491747, 0, 0, 0, 1, 1,
1.167464, -0.08052999, 1.109224, 0, 0, 0, 1, 1,
1.175075, -0.09114121, 2.19349, 0, 0, 0, 1, 1,
1.177678, -0.5598822, 3.654752, 0, 0, 0, 1, 1,
1.187595, 1.029507, 1.424293, 1, 1, 1, 1, 1,
1.193529, 2.112653, 0.6436245, 1, 1, 1, 1, 1,
1.195527, 1.854453, 0.6964976, 1, 1, 1, 1, 1,
1.20096, 1.015951, 0.1728549, 1, 1, 1, 1, 1,
1.202669, -1.217482, 2.983989, 1, 1, 1, 1, 1,
1.209664, -0.7782937, 2.800317, 1, 1, 1, 1, 1,
1.216897, -1.003121, 3.896744, 1, 1, 1, 1, 1,
1.218835, -0.06462394, 0.107636, 1, 1, 1, 1, 1,
1.22254, -1.571947, 1.560363, 1, 1, 1, 1, 1,
1.223585, 1.274987, 2.413311, 1, 1, 1, 1, 1,
1.227229, -1.291923, 2.853412, 1, 1, 1, 1, 1,
1.227949, 0.2110459, 1.518396, 1, 1, 1, 1, 1,
1.232655, -1.209712, 1.685332, 1, 1, 1, 1, 1,
1.236366, 0.07808409, 4.379516, 1, 1, 1, 1, 1,
1.242542, -0.1573876, 1.902975, 1, 1, 1, 1, 1,
1.252221, 1.017805, 0.9623967, 0, 0, 1, 1, 1,
1.26613, -0.4027493, 1.88571, 1, 0, 0, 1, 1,
1.268393, -0.6393142, 3.487734, 1, 0, 0, 1, 1,
1.271282, -0.08606461, 1.801704, 1, 0, 0, 1, 1,
1.272287, -0.8578458, 3.418241, 1, 0, 0, 1, 1,
1.274668, 0.5509975, 0.2168408, 1, 0, 0, 1, 1,
1.296001, -0.06309678, 0.9658777, 0, 0, 0, 1, 1,
1.300998, 1.331829, -0.1301193, 0, 0, 0, 1, 1,
1.305306, -0.9595892, 2.340811, 0, 0, 0, 1, 1,
1.316465, -0.1582076, 3.501437, 0, 0, 0, 1, 1,
1.317233, -1.965315, 2.027524, 0, 0, 0, 1, 1,
1.322208, -0.431112, 2.644163, 0, 0, 0, 1, 1,
1.331574, 0.9654834, 0.5881876, 0, 0, 0, 1, 1,
1.333102, -0.2116614, 1.567701, 1, 1, 1, 1, 1,
1.348273, 2.919136, -0.6924946, 1, 1, 1, 1, 1,
1.367424, 1.132812, 1.259377, 1, 1, 1, 1, 1,
1.380917, 0.4377073, 1.214951, 1, 1, 1, 1, 1,
1.384198, -0.9458685, 2.905086, 1, 1, 1, 1, 1,
1.389186, -0.956297, 1.60955, 1, 1, 1, 1, 1,
1.394165, -0.6449665, 0.1432846, 1, 1, 1, 1, 1,
1.395221, 0.5599661, 2.580673, 1, 1, 1, 1, 1,
1.398391, 0.9656785, 1.590054, 1, 1, 1, 1, 1,
1.399495, 1.291064, 2.579732, 1, 1, 1, 1, 1,
1.404572, 0.3753111, 1.33059, 1, 1, 1, 1, 1,
1.409146, 0.07181884, 0.4779532, 1, 1, 1, 1, 1,
1.412175, -0.09447467, 1.703863, 1, 1, 1, 1, 1,
1.419475, -0.9652292, 2.644736, 1, 1, 1, 1, 1,
1.427149, 0.497276, 2.474638, 1, 1, 1, 1, 1,
1.430888, -0.5115463, 1.416799, 0, 0, 1, 1, 1,
1.434349, 0.2387947, 0.9152777, 1, 0, 0, 1, 1,
1.439723, -1.030237, 2.822475, 1, 0, 0, 1, 1,
1.451056, 0.05653263, 1.770969, 1, 0, 0, 1, 1,
1.45209, 1.12101, 0.6131468, 1, 0, 0, 1, 1,
1.470586, 0.5750326, 1.303756, 1, 0, 0, 1, 1,
1.471044, -2.21691, 2.220742, 0, 0, 0, 1, 1,
1.48748, -1.735584, 1.102034, 0, 0, 0, 1, 1,
1.489292, -1.455415, 2.352458, 0, 0, 0, 1, 1,
1.497594, 0.2877638, 3.292323, 0, 0, 0, 1, 1,
1.508862, -1.079089, 2.973917, 0, 0, 0, 1, 1,
1.509909, -1.199924, 2.349477, 0, 0, 0, 1, 1,
1.514427, 0.2414898, -0.5721167, 0, 0, 0, 1, 1,
1.520177, 0.1491302, 2.915929, 1, 1, 1, 1, 1,
1.532044, -0.06845334, 1.836184, 1, 1, 1, 1, 1,
1.559871, 0.6304971, 1.609845, 1, 1, 1, 1, 1,
1.562087, 1.582666, -0.3902989, 1, 1, 1, 1, 1,
1.563291, 0.07548499, 2.449849, 1, 1, 1, 1, 1,
1.56882, -1.112679, 0.8127004, 1, 1, 1, 1, 1,
1.570925, 0.8794454, -1.108507, 1, 1, 1, 1, 1,
1.584726, 0.5616641, 1.600095, 1, 1, 1, 1, 1,
1.587821, 0.8689846, 0.4867083, 1, 1, 1, 1, 1,
1.593229, -1.018589, 0.6468148, 1, 1, 1, 1, 1,
1.596207, 0.2026505, 2.403246, 1, 1, 1, 1, 1,
1.59935, -0.1085892, 1.621451, 1, 1, 1, 1, 1,
1.599773, 0.5709204, 1.028394, 1, 1, 1, 1, 1,
1.611555, -1.131009, 1.838663, 1, 1, 1, 1, 1,
1.635169, 0.1902985, 2.973919, 1, 1, 1, 1, 1,
1.647114, 0.7885979, 1.395295, 0, 0, 1, 1, 1,
1.64967, 2.627309, 0.3284471, 1, 0, 0, 1, 1,
1.663711, 1.955652, -0.02040413, 1, 0, 0, 1, 1,
1.665828, 1.260918, 0.5416715, 1, 0, 0, 1, 1,
1.669654, -0.08294959, 3.149812, 1, 0, 0, 1, 1,
1.670179, 1.306341, 0.2636043, 1, 0, 0, 1, 1,
1.673315, 0.9469932, 1.210243, 0, 0, 0, 1, 1,
1.67503, 0.347342, 2.149718, 0, 0, 0, 1, 1,
1.682759, 0.05329439, 2.090394, 0, 0, 0, 1, 1,
1.691766, -0.6579139, 2.279032, 0, 0, 0, 1, 1,
1.697842, 1.259237, 0.1801308, 0, 0, 0, 1, 1,
1.70432, 1.108027, -1.501746, 0, 0, 0, 1, 1,
1.718589, -0.586193, 2.621061, 0, 0, 0, 1, 1,
1.742139, 0.8733314, 1.048157, 1, 1, 1, 1, 1,
1.750707, -0.09240453, 2.460008, 1, 1, 1, 1, 1,
1.755829, 1.693472, 1.961673, 1, 1, 1, 1, 1,
1.77255, 2.077425, 2.276503, 1, 1, 1, 1, 1,
1.791696, -0.7587616, 2.887639, 1, 1, 1, 1, 1,
1.800676, -1.955407, 2.658033, 1, 1, 1, 1, 1,
1.802431, -0.1878191, 1.257123, 1, 1, 1, 1, 1,
1.816967, 1.957651, 0.7582458, 1, 1, 1, 1, 1,
1.833541, -0.471037, 2.991639, 1, 1, 1, 1, 1,
1.84776, 0.1317603, 1.595303, 1, 1, 1, 1, 1,
1.888705, -1.500875, 2.395237, 1, 1, 1, 1, 1,
1.912709, -1.50504, 2.472772, 1, 1, 1, 1, 1,
1.914431, -0.06327015, 2.591753, 1, 1, 1, 1, 1,
1.934478, 0.1849515, 1.073537, 1, 1, 1, 1, 1,
1.961963, 0.3900976, 1.95814, 1, 1, 1, 1, 1,
2.032221, 0.0768737, 1.702148, 0, 0, 1, 1, 1,
2.048269, 0.916212, 0.3824181, 1, 0, 0, 1, 1,
2.054592, -0.658891, 2.446661, 1, 0, 0, 1, 1,
2.058233, -0.7762048, 1.589501, 1, 0, 0, 1, 1,
2.080106, 0.7028234, -0.7011489, 1, 0, 0, 1, 1,
2.084728, -1.682185, 2.544604, 1, 0, 0, 1, 1,
2.143653, 0.4251138, 0.5159648, 0, 0, 0, 1, 1,
2.148402, -0.3585277, 3.701461, 0, 0, 0, 1, 1,
2.170597, -0.1554412, 1.754792, 0, 0, 0, 1, 1,
2.291915, 0.8036486, 0.9089139, 0, 0, 0, 1, 1,
2.29254, 1.602331, 1.520292, 0, 0, 0, 1, 1,
2.299267, 0.5992914, -0.8580723, 0, 0, 0, 1, 1,
2.371274, -0.6592195, 1.849264, 0, 0, 0, 1, 1,
2.396055, -1.143596, 0.9252326, 1, 1, 1, 1, 1,
2.416345, 0.05974727, 0.8257266, 1, 1, 1, 1, 1,
2.450848, 1.203009, 1.803829, 1, 1, 1, 1, 1,
2.595518, -2.148139, 1.40196, 1, 1, 1, 1, 1,
2.797178, -0.5261502, 1.331633, 1, 1, 1, 1, 1,
3.063833, 0.593055, 3.24788, 1, 1, 1, 1, 1,
3.075081, -0.2588779, 1.322331, 1, 1, 1, 1, 1
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
var radius = 9.360464;
var distance = 32.87823;
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
mvMatrix.translate( 0.1072991, -0.09793496, 0.1473684 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.87823);
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
