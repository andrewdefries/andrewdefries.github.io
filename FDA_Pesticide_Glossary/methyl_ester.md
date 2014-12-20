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
-2.809246, -0.145244, 0.3838317, 1, 0, 0, 1,
-2.598122, -1.483631, -0.7457972, 1, 0.007843138, 0, 1,
-2.592769, 0.5702841, -0.8635696, 1, 0.01176471, 0, 1,
-2.458794, -0.5512933, -2.812213, 1, 0.01960784, 0, 1,
-2.442523, -1.501535, -1.845766, 1, 0.02352941, 0, 1,
-2.394921, -0.270862, -1.544472, 1, 0.03137255, 0, 1,
-2.351981, 0.8518149, 0.05964959, 1, 0.03529412, 0, 1,
-2.337865, 0.1265897, -2.330349, 1, 0.04313726, 0, 1,
-2.310058, -0.0382168, 0.2879112, 1, 0.04705882, 0, 1,
-2.252499, 1.094775, -0.6118001, 1, 0.05490196, 0, 1,
-2.219525, 0.2848092, -0.7618934, 1, 0.05882353, 0, 1,
-2.216581, 0.250498, -1.622829, 1, 0.06666667, 0, 1,
-2.172464, 1.451116, -2.827211, 1, 0.07058824, 0, 1,
-2.166469, 0.654241, -1.853909, 1, 0.07843138, 0, 1,
-2.165817, -1.277197, -2.672899, 1, 0.08235294, 0, 1,
-2.147752, -1.194237, -2.607489, 1, 0.09019608, 0, 1,
-2.144485, -0.6711064, -1.825635, 1, 0.09411765, 0, 1,
-2.111971, 0.4076959, -0.7773826, 1, 0.1019608, 0, 1,
-2.075339, -0.8388163, -0.2593295, 1, 0.1098039, 0, 1,
-2.073192, 1.024849, -1.240557, 1, 0.1137255, 0, 1,
-2.048464, -2.91875, -2.724606, 1, 0.1215686, 0, 1,
-2.045742, 1.050608, -1.104864, 1, 0.1254902, 0, 1,
-2.020983, -0.8363124, -2.143598, 1, 0.1333333, 0, 1,
-2.013232, 0.8531449, -1.938007, 1, 0.1372549, 0, 1,
-1.999942, 0.1522895, -2.945562, 1, 0.145098, 0, 1,
-1.986035, 1.365794, -2.118885, 1, 0.1490196, 0, 1,
-1.881061, 0.105297, -1.150875, 1, 0.1568628, 0, 1,
-1.864896, 0.7689068, -1.668268, 1, 0.1607843, 0, 1,
-1.839793, -0.1415444, -1.190535, 1, 0.1686275, 0, 1,
-1.836602, -0.2001317, -1.043633, 1, 0.172549, 0, 1,
-1.834887, 0.06463649, -1.078026, 1, 0.1803922, 0, 1,
-1.818326, 2.413138, -0.5781635, 1, 0.1843137, 0, 1,
-1.81198, 0.9091153, -3.720746, 1, 0.1921569, 0, 1,
-1.811004, 0.8183745, -0.7106907, 1, 0.1960784, 0, 1,
-1.806941, 1.94986, -0.5681978, 1, 0.2039216, 0, 1,
-1.793933, -0.9399384, -0.7068076, 1, 0.2117647, 0, 1,
-1.778881, 0.7896225, -0.306996, 1, 0.2156863, 0, 1,
-1.756495, -0.9481515, -2.106962, 1, 0.2235294, 0, 1,
-1.75367, -2.605432, -4.756513, 1, 0.227451, 0, 1,
-1.748405, -0.1626035, -3.207721, 1, 0.2352941, 0, 1,
-1.738255, -0.635599, -2.156458, 1, 0.2392157, 0, 1,
-1.728953, 1.242802, -1.491117, 1, 0.2470588, 0, 1,
-1.727782, 0.3324535, -0.007348564, 1, 0.2509804, 0, 1,
-1.715084, -0.2505842, -1.350646, 1, 0.2588235, 0, 1,
-1.706336, -1.49204, -1.797864, 1, 0.2627451, 0, 1,
-1.691815, -0.4491999, -3.208026, 1, 0.2705882, 0, 1,
-1.686256, 1.911871, -1.009842, 1, 0.2745098, 0, 1,
-1.684338, 1.882221, -1.067385, 1, 0.282353, 0, 1,
-1.681939, 2.097877, 0.1806871, 1, 0.2862745, 0, 1,
-1.673971, -0.7560501, -3.057185, 1, 0.2941177, 0, 1,
-1.673066, -1.59655, -2.169877, 1, 0.3019608, 0, 1,
-1.672676, 1.489854, -0.5350444, 1, 0.3058824, 0, 1,
-1.666995, -0.5495173, -1.900874, 1, 0.3137255, 0, 1,
-1.665542, -1.00347, -1.560797, 1, 0.3176471, 0, 1,
-1.658783, 0.579245, -2.356088, 1, 0.3254902, 0, 1,
-1.657984, -0.4325979, -2.621171, 1, 0.3294118, 0, 1,
-1.642238, -1.370799, 0.1177394, 1, 0.3372549, 0, 1,
-1.640033, 0.1216043, -0.5177247, 1, 0.3411765, 0, 1,
-1.637999, 0.4615614, -1.47506, 1, 0.3490196, 0, 1,
-1.632843, -0.5821352, -2.109738, 1, 0.3529412, 0, 1,
-1.629584, 1.230148, 1.036417, 1, 0.3607843, 0, 1,
-1.625714, 0.5401372, -1.050208, 1, 0.3647059, 0, 1,
-1.615688, -0.006139457, -2.917872, 1, 0.372549, 0, 1,
-1.599617, -1.901806, -0.7809362, 1, 0.3764706, 0, 1,
-1.594377, -0.7000899, -0.5122196, 1, 0.3843137, 0, 1,
-1.585747, 0.4653606, -1.364832, 1, 0.3882353, 0, 1,
-1.582372, 0.7387727, -0.9191559, 1, 0.3960784, 0, 1,
-1.569499, 0.6722988, 0.01646579, 1, 0.4039216, 0, 1,
-1.567209, 0.1022807, -0.8455181, 1, 0.4078431, 0, 1,
-1.552425, -0.2612403, -1.652426, 1, 0.4156863, 0, 1,
-1.55081, 0.05868158, -1.432629, 1, 0.4196078, 0, 1,
-1.548134, 0.04590087, -0.9228907, 1, 0.427451, 0, 1,
-1.545152, 0.164395, 0.5247863, 1, 0.4313726, 0, 1,
-1.541662, 0.3465192, -1.55611, 1, 0.4392157, 0, 1,
-1.533408, 0.4127007, -3.210141, 1, 0.4431373, 0, 1,
-1.522674, 0.9143503, -3.173492, 1, 0.4509804, 0, 1,
-1.518472, -0.04974442, -3.148772, 1, 0.454902, 0, 1,
-1.506911, -1.608541, -2.528686, 1, 0.4627451, 0, 1,
-1.505144, -1.611346, -2.28476, 1, 0.4666667, 0, 1,
-1.50123, -2.092211, -3.91078, 1, 0.4745098, 0, 1,
-1.489584, -0.3090382, -2.246186, 1, 0.4784314, 0, 1,
-1.483785, 1.054396, -2.046195, 1, 0.4862745, 0, 1,
-1.478096, 0.8699155, -2.465608, 1, 0.4901961, 0, 1,
-1.475153, 0.5251741, -2.424986, 1, 0.4980392, 0, 1,
-1.471054, 0.1657906, -3.322567, 1, 0.5058824, 0, 1,
-1.453888, -2.693216, -0.4223341, 1, 0.509804, 0, 1,
-1.431314, 0.809693, -0.9541358, 1, 0.5176471, 0, 1,
-1.397731, -0.7918996, -1.329503, 1, 0.5215687, 0, 1,
-1.392565, -0.004172509, -1.559305, 1, 0.5294118, 0, 1,
-1.390981, -0.2445874, -2.323484, 1, 0.5333334, 0, 1,
-1.389822, 0.6305518, -1.681141, 1, 0.5411765, 0, 1,
-1.383203, -0.2767045, -2.735105, 1, 0.5450981, 0, 1,
-1.378957, 0.8519195, -1.172578, 1, 0.5529412, 0, 1,
-1.377937, 0.2411097, -2.863119, 1, 0.5568628, 0, 1,
-1.371319, 0.5174681, -1.656507, 1, 0.5647059, 0, 1,
-1.360528, 0.4485446, -2.114164, 1, 0.5686275, 0, 1,
-1.353931, -1.456777, -3.107487, 1, 0.5764706, 0, 1,
-1.347044, -0.2741215, -2.87639, 1, 0.5803922, 0, 1,
-1.342914, -3.52576, -3.55642, 1, 0.5882353, 0, 1,
-1.32819, 1.327692, -0.5770819, 1, 0.5921569, 0, 1,
-1.327874, -1.642475, -2.86948, 1, 0.6, 0, 1,
-1.324268, -0.6213595, -1.618528, 1, 0.6078432, 0, 1,
-1.321921, 0.1412926, -1.455141, 1, 0.6117647, 0, 1,
-1.318816, -1.719781, -3.214826, 1, 0.6196079, 0, 1,
-1.303041, -1.683493, -1.951172, 1, 0.6235294, 0, 1,
-1.300227, 1.581068, -1.103146, 1, 0.6313726, 0, 1,
-1.295056, 1.451315, 0.3512661, 1, 0.6352941, 0, 1,
-1.291584, 0.7808916, 0.8896984, 1, 0.6431373, 0, 1,
-1.265865, -0.2222223, -2.647909, 1, 0.6470588, 0, 1,
-1.263188, 0.4237815, -2.287053, 1, 0.654902, 0, 1,
-1.261163, 0.4382029, -1.329298, 1, 0.6588235, 0, 1,
-1.248258, 0.4559775, -0.2114992, 1, 0.6666667, 0, 1,
-1.245786, 0.4213171, -0.8674874, 1, 0.6705883, 0, 1,
-1.240988, 1.7066, -0.7936041, 1, 0.6784314, 0, 1,
-1.240796, 0.5259475, -1.055169, 1, 0.682353, 0, 1,
-1.227768, 1.058827, -0.8912669, 1, 0.6901961, 0, 1,
-1.22104, 0.5106361, -0.9992446, 1, 0.6941177, 0, 1,
-1.208649, 0.1179656, -0.9237414, 1, 0.7019608, 0, 1,
-1.204616, 0.4956048, 0.3375855, 1, 0.7098039, 0, 1,
-1.203245, 0.8968173, -0.6116335, 1, 0.7137255, 0, 1,
-1.203184, -0.9854165, -1.225922, 1, 0.7215686, 0, 1,
-1.196273, 0.1216741, 0.1068366, 1, 0.7254902, 0, 1,
-1.185597, 0.87642, 0.3585522, 1, 0.7333333, 0, 1,
-1.179765, 0.5635592, -2.36308, 1, 0.7372549, 0, 1,
-1.177667, -0.5583443, -0.7235255, 1, 0.7450981, 0, 1,
-1.177464, -0.3989238, -2.971495, 1, 0.7490196, 0, 1,
-1.172903, -0.2562605, -1.523935, 1, 0.7568628, 0, 1,
-1.161798, -0.4140797, -1.402752, 1, 0.7607843, 0, 1,
-1.153892, -0.6324151, -1.858939, 1, 0.7686275, 0, 1,
-1.15119, -2.693724, -2.347232, 1, 0.772549, 0, 1,
-1.146886, -0.598124, -0.676772, 1, 0.7803922, 0, 1,
-1.137554, 2.98866, -0.9120595, 1, 0.7843137, 0, 1,
-1.124768, 0.6038162, -1.971299, 1, 0.7921569, 0, 1,
-1.116014, -0.5335541, -2.867105, 1, 0.7960784, 0, 1,
-1.111749, 0.4349167, -1.341543, 1, 0.8039216, 0, 1,
-1.09848, -0.5107837, -0.974251, 1, 0.8117647, 0, 1,
-1.095253, 0.2512389, -2.844576, 1, 0.8156863, 0, 1,
-1.090129, 0.9079546, 0.01736487, 1, 0.8235294, 0, 1,
-1.08944, -0.2167515, -3.57585, 1, 0.827451, 0, 1,
-1.08931, -0.6918142, -0.4264508, 1, 0.8352941, 0, 1,
-1.088577, -1.321936, -1.326742, 1, 0.8392157, 0, 1,
-1.086692, -0.07607756, -2.51749, 1, 0.8470588, 0, 1,
-1.06701, 0.623375, -1.42018, 1, 0.8509804, 0, 1,
-1.066465, 2.70427, -0.2962141, 1, 0.8588235, 0, 1,
-1.054634, -0.28322, -2.181249, 1, 0.8627451, 0, 1,
-1.053936, -2.425193, -3.242559, 1, 0.8705882, 0, 1,
-1.05128, -1.06391, -2.320201, 1, 0.8745098, 0, 1,
-1.051205, 0.05038119, 0.5202591, 1, 0.8823529, 0, 1,
-1.040487, -0.01397436, -0.8904708, 1, 0.8862745, 0, 1,
-1.035569, -1.739275, -3.971211, 1, 0.8941177, 0, 1,
-1.035389, 0.03062102, -0.1745506, 1, 0.8980392, 0, 1,
-1.026763, 0.1185945, -1.939003, 1, 0.9058824, 0, 1,
-1.023895, 0.1937725, -2.69223, 1, 0.9137255, 0, 1,
-1.020623, -0.3955092, -1.434243, 1, 0.9176471, 0, 1,
-1.012324, 0.0990378, -1.290486, 1, 0.9254902, 0, 1,
-1.011903, -1.265885, -2.751933, 1, 0.9294118, 0, 1,
-1.002489, 0.8778089, 0.0394097, 1, 0.9372549, 0, 1,
-0.990169, -0.7192081, -4.627741, 1, 0.9411765, 0, 1,
-0.9863166, -0.7739482, -2.149471, 1, 0.9490196, 0, 1,
-0.9818869, 0.08078206, -1.397078, 1, 0.9529412, 0, 1,
-0.9796293, 0.8617458, 0.03946308, 1, 0.9607843, 0, 1,
-0.9763388, -1.509531, -0.7068767, 1, 0.9647059, 0, 1,
-0.9748487, -0.6372657, -1.23974, 1, 0.972549, 0, 1,
-0.9726163, 0.5482536, -2.345072, 1, 0.9764706, 0, 1,
-0.9674689, -0.4634658, -3.108415, 1, 0.9843137, 0, 1,
-0.9669219, 0.09299574, -0.4795893, 1, 0.9882353, 0, 1,
-0.9627459, 1.97345, 0.5000083, 1, 0.9960784, 0, 1,
-0.9585174, -0.3226396, -0.5742093, 0.9960784, 1, 0, 1,
-0.9542716, -1.411728, -1.316656, 0.9921569, 1, 0, 1,
-0.9533494, -1.786297, -2.467384, 0.9843137, 1, 0, 1,
-0.9339203, 0.9298972, -2.493053, 0.9803922, 1, 0, 1,
-0.9333754, 0.01949678, 0.07311159, 0.972549, 1, 0, 1,
-0.9320515, 1.117312, -0.6469359, 0.9686275, 1, 0, 1,
-0.9313218, 0.07517599, -1.826935, 0.9607843, 1, 0, 1,
-0.930101, -3.529136, -4.206024, 0.9568627, 1, 0, 1,
-0.928687, -0.09735196, -0.6110891, 0.9490196, 1, 0, 1,
-0.9282138, 1.331915, -1.749442, 0.945098, 1, 0, 1,
-0.9268419, 1.313368, -0.606576, 0.9372549, 1, 0, 1,
-0.9204959, 1.534635, -0.698221, 0.9333333, 1, 0, 1,
-0.9192974, -1.372474, -2.999022, 0.9254902, 1, 0, 1,
-0.919026, 0.4686145, -1.137104, 0.9215686, 1, 0, 1,
-0.9160351, 1.102006, 0.2727556, 0.9137255, 1, 0, 1,
-0.9113758, -0.0185221, -0.5666235, 0.9098039, 1, 0, 1,
-0.9087003, -0.2584125, -0.08565067, 0.9019608, 1, 0, 1,
-0.9082536, -1.06545, -1.551529, 0.8941177, 1, 0, 1,
-0.9020156, 0.7876644, -2.345179, 0.8901961, 1, 0, 1,
-0.8994852, -0.9430549, -0.8981149, 0.8823529, 1, 0, 1,
-0.8970454, 0.6955929, 1.685659, 0.8784314, 1, 0, 1,
-0.8964829, 0.2467151, -0.7288262, 0.8705882, 1, 0, 1,
-0.8954928, 0.1029876, -0.06990442, 0.8666667, 1, 0, 1,
-0.8942897, -1.356061, -3.824073, 0.8588235, 1, 0, 1,
-0.8898427, 0.7294712, -2.418058, 0.854902, 1, 0, 1,
-0.8872389, 2.366393, 0.4495906, 0.8470588, 1, 0, 1,
-0.8806472, -1.062731, -2.079056, 0.8431373, 1, 0, 1,
-0.8801839, 2.018739, -0.6224985, 0.8352941, 1, 0, 1,
-0.8761871, 0.6671305, -1.967874, 0.8313726, 1, 0, 1,
-0.8747202, 1.659356, 0.5573257, 0.8235294, 1, 0, 1,
-0.8739464, -0.7095784, -3.200677, 0.8196079, 1, 0, 1,
-0.8736052, 0.4722313, -1.44962, 0.8117647, 1, 0, 1,
-0.8724424, -0.3894967, -1.290506, 0.8078431, 1, 0, 1,
-0.8723485, 0.2219765, -0.6561731, 0.8, 1, 0, 1,
-0.8640832, -0.9457677, -3.047354, 0.7921569, 1, 0, 1,
-0.8616777, 0.7612922, 0.07438736, 0.7882353, 1, 0, 1,
-0.8583874, -0.5033511, -2.438059, 0.7803922, 1, 0, 1,
-0.8566644, 0.5283115, -0.482128, 0.7764706, 1, 0, 1,
-0.8530312, -0.4346794, -3.35158, 0.7686275, 1, 0, 1,
-0.8527879, 1.382209, 1.102389, 0.7647059, 1, 0, 1,
-0.8453435, -0.8577168, -4.341308, 0.7568628, 1, 0, 1,
-0.8441944, -0.7976246, -2.733676, 0.7529412, 1, 0, 1,
-0.8441497, -0.3378284, -2.085442, 0.7450981, 1, 0, 1,
-0.8439658, -0.5391793, -1.992042, 0.7411765, 1, 0, 1,
-0.8428257, -0.7133175, -3.664009, 0.7333333, 1, 0, 1,
-0.8404962, 0.4029855, -1.162711, 0.7294118, 1, 0, 1,
-0.8389803, 0.8864261, -2.200146, 0.7215686, 1, 0, 1,
-0.8382722, 0.2863988, -3.48901, 0.7176471, 1, 0, 1,
-0.8311268, -0.9267036, -1.398236, 0.7098039, 1, 0, 1,
-0.8310183, -1.421916, -1.660066, 0.7058824, 1, 0, 1,
-0.8270998, -0.6764517, -0.3694353, 0.6980392, 1, 0, 1,
-0.8238609, -1.20937, -0.880552, 0.6901961, 1, 0, 1,
-0.8210546, -1.156079, -1.969243, 0.6862745, 1, 0, 1,
-0.8155665, 2.651543, 0.3578275, 0.6784314, 1, 0, 1,
-0.812585, 0.2941427, -0.6892188, 0.6745098, 1, 0, 1,
-0.8085374, -0.3963982, -1.337419, 0.6666667, 1, 0, 1,
-0.8079922, 0.1698101, -1.303323, 0.6627451, 1, 0, 1,
-0.8063452, 1.019063, 0.4662617, 0.654902, 1, 0, 1,
-0.8003839, -0.3698421, -2.624975, 0.6509804, 1, 0, 1,
-0.8000323, 1.828885, 0.7696385, 0.6431373, 1, 0, 1,
-0.7955043, -0.2251362, -1.758739, 0.6392157, 1, 0, 1,
-0.7935724, -2.071199, -3.503564, 0.6313726, 1, 0, 1,
-0.7923631, 1.014038, -2.026694, 0.627451, 1, 0, 1,
-0.791759, -0.972138, -2.552212, 0.6196079, 1, 0, 1,
-0.7906352, -0.1416174, -3.591898, 0.6156863, 1, 0, 1,
-0.7861071, 0.08700843, -2.163321, 0.6078432, 1, 0, 1,
-0.78583, -1.019728, -3.140388, 0.6039216, 1, 0, 1,
-0.7849528, -0.7764388, -3.300881, 0.5960785, 1, 0, 1,
-0.7839261, -0.4681199, -0.3259445, 0.5882353, 1, 0, 1,
-0.7704176, -0.2136208, -2.154144, 0.5843138, 1, 0, 1,
-0.7670118, 0.1439405, -1.792177, 0.5764706, 1, 0, 1,
-0.7664192, -1.223814, -2.359223, 0.572549, 1, 0, 1,
-0.7637933, -0.07426273, -0.9935374, 0.5647059, 1, 0, 1,
-0.7565546, -0.5966883, -3.03447, 0.5607843, 1, 0, 1,
-0.7518611, 0.5205927, 0.2655756, 0.5529412, 1, 0, 1,
-0.7518532, 0.8523803, -1.637582, 0.5490196, 1, 0, 1,
-0.7517574, -0.5177953, -2.373045, 0.5411765, 1, 0, 1,
-0.7514754, 0.5125493, -1.202679, 0.5372549, 1, 0, 1,
-0.7509181, -0.5496915, -1.317498, 0.5294118, 1, 0, 1,
-0.7490984, -0.3393959, -2.164889, 0.5254902, 1, 0, 1,
-0.7479522, -0.1169096, -0.7847835, 0.5176471, 1, 0, 1,
-0.7466382, 0.3426355, -1.210104, 0.5137255, 1, 0, 1,
-0.7442583, 0.7991998, -2.554695, 0.5058824, 1, 0, 1,
-0.742386, 0.8515871, -1.094043, 0.5019608, 1, 0, 1,
-0.7314757, 0.5500682, -0.9664399, 0.4941176, 1, 0, 1,
-0.7271184, 0.09487861, -1.874251, 0.4862745, 1, 0, 1,
-0.7122237, -0.3790831, -0.7366136, 0.4823529, 1, 0, 1,
-0.7110651, 0.8196501, 0.5393413, 0.4745098, 1, 0, 1,
-0.7088008, 0.3275183, -2.607232, 0.4705882, 1, 0, 1,
-0.7087017, 1.175148, -1.251477, 0.4627451, 1, 0, 1,
-0.699726, -0.07897228, 0.085562, 0.4588235, 1, 0, 1,
-0.6986079, -1.248079, -4.649585, 0.4509804, 1, 0, 1,
-0.6968951, 0.3288288, -2.835897, 0.4470588, 1, 0, 1,
-0.6957051, 0.3448746, -0.6903779, 0.4392157, 1, 0, 1,
-0.6855969, -1.184839, -1.309479, 0.4352941, 1, 0, 1,
-0.6828144, -1.830061, -4.354398, 0.427451, 1, 0, 1,
-0.6811811, 2.352212, -3.061336, 0.4235294, 1, 0, 1,
-0.674562, -0.5029014, -1.137266, 0.4156863, 1, 0, 1,
-0.6690632, -0.8048057, -2.346193, 0.4117647, 1, 0, 1,
-0.6624551, -1.366442, -3.613981, 0.4039216, 1, 0, 1,
-0.6615527, 0.4203905, -0.8838965, 0.3960784, 1, 0, 1,
-0.6558331, 0.005208686, -3.59485, 0.3921569, 1, 0, 1,
-0.6529551, -1.329107, -1.422663, 0.3843137, 1, 0, 1,
-0.6529448, 1.573833, 0.9980624, 0.3803922, 1, 0, 1,
-0.6395437, -0.9785913, -2.2504, 0.372549, 1, 0, 1,
-0.6389351, 0.9652035, 0.2110769, 0.3686275, 1, 0, 1,
-0.6373597, -0.8379689, -2.538047, 0.3607843, 1, 0, 1,
-0.6371791, -0.1148508, -2.405855, 0.3568628, 1, 0, 1,
-0.6352848, -0.1369358, -2.835755, 0.3490196, 1, 0, 1,
-0.6349578, -0.4117699, -2.070374, 0.345098, 1, 0, 1,
-0.6330631, -0.6807082, -2.707969, 0.3372549, 1, 0, 1,
-0.6312501, 0.9641351, -0.6307219, 0.3333333, 1, 0, 1,
-0.6296663, 0.4110701, 0.1025622, 0.3254902, 1, 0, 1,
-0.6253682, -0.1134788, -2.753858, 0.3215686, 1, 0, 1,
-0.6251509, 1.288145, -2.840268, 0.3137255, 1, 0, 1,
-0.6226943, -1.736935, -3.910922, 0.3098039, 1, 0, 1,
-0.6132219, -2.500286, -2.913201, 0.3019608, 1, 0, 1,
-0.6015876, 0.8462218, -0.3688779, 0.2941177, 1, 0, 1,
-0.6012466, -0.5729833, -2.991341, 0.2901961, 1, 0, 1,
-0.597284, 0.9504111, 2.072428, 0.282353, 1, 0, 1,
-0.593025, -0.1674258, -2.058575, 0.2784314, 1, 0, 1,
-0.5929481, -0.3710832, -0.618171, 0.2705882, 1, 0, 1,
-0.591397, 0.3759689, -0.9710795, 0.2666667, 1, 0, 1,
-0.5906101, 0.7339283, -0.5664343, 0.2588235, 1, 0, 1,
-0.5895558, -1.7808, -3.440582, 0.254902, 1, 0, 1,
-0.5880798, -0.7930458, -2.006065, 0.2470588, 1, 0, 1,
-0.5861696, 1.029665, 0.7616683, 0.2431373, 1, 0, 1,
-0.5830571, -0.8410265, -1.866857, 0.2352941, 1, 0, 1,
-0.5823144, -0.9792307, -2.889493, 0.2313726, 1, 0, 1,
-0.5822368, 1.093343, -1.457527, 0.2235294, 1, 0, 1,
-0.5808834, -0.5891088, -3.353572, 0.2196078, 1, 0, 1,
-0.5791054, -0.4274277, -2.313804, 0.2117647, 1, 0, 1,
-0.5782901, -0.72601, -1.967716, 0.2078431, 1, 0, 1,
-0.5721149, 1.951271, -1.212349, 0.2, 1, 0, 1,
-0.5682164, -0.2458207, -1.36003, 0.1921569, 1, 0, 1,
-0.5646895, 1.891164, -0.09826697, 0.1882353, 1, 0, 1,
-0.5618664, 0.7705358, -1.396495, 0.1803922, 1, 0, 1,
-0.5604097, 0.2306798, -1.894102, 0.1764706, 1, 0, 1,
-0.5560389, 0.5715935, -2.30739, 0.1686275, 1, 0, 1,
-0.5535743, -0.06411545, -2.260074, 0.1647059, 1, 0, 1,
-0.5517547, -0.4218795, -2.507025, 0.1568628, 1, 0, 1,
-0.5487939, 0.5869272, -0.2416564, 0.1529412, 1, 0, 1,
-0.5422722, 0.3478066, -1.675345, 0.145098, 1, 0, 1,
-0.5408447, 1.166145, -0.572862, 0.1411765, 1, 0, 1,
-0.5402239, 0.7176269, -0.238808, 0.1333333, 1, 0, 1,
-0.5402176, 3.085606, 0.1367421, 0.1294118, 1, 0, 1,
-0.5340815, 1.375964, 0.3264111, 0.1215686, 1, 0, 1,
-0.5321879, 1.073844, -0.8837118, 0.1176471, 1, 0, 1,
-0.5313859, 0.6125325, -0.5957107, 0.1098039, 1, 0, 1,
-0.5288837, -1.425206, -2.438372, 0.1058824, 1, 0, 1,
-0.5166779, -0.9128355, -1.308875, 0.09803922, 1, 0, 1,
-0.5164436, -0.3732918, -1.977826, 0.09019608, 1, 0, 1,
-0.5132422, 0.4509677, -1.734954, 0.08627451, 1, 0, 1,
-0.5080426, -0.6776977, -2.597981, 0.07843138, 1, 0, 1,
-0.5076532, -0.9293981, -1.821585, 0.07450981, 1, 0, 1,
-0.5030655, 1.198661, -1.046599, 0.06666667, 1, 0, 1,
-0.4885274, -1.303695, -2.924642, 0.0627451, 1, 0, 1,
-0.4835951, 0.6310133, 0.4874332, 0.05490196, 1, 0, 1,
-0.4810432, 1.064749, -1.633109, 0.05098039, 1, 0, 1,
-0.4787448, 0.3899416, -1.176921, 0.04313726, 1, 0, 1,
-0.4752658, 1.664446, -0.5625135, 0.03921569, 1, 0, 1,
-0.474767, 0.04566933, -3.596055, 0.03137255, 1, 0, 1,
-0.4727495, -0.3185311, -2.377835, 0.02745098, 1, 0, 1,
-0.4713162, 0.5235855, -3.132857, 0.01960784, 1, 0, 1,
-0.469209, -1.78958, -2.828334, 0.01568628, 1, 0, 1,
-0.4653744, -0.08180723, -0.002268521, 0.007843138, 1, 0, 1,
-0.4632448, -1.486976, -4.593117, 0.003921569, 1, 0, 1,
-0.4604227, -0.7070107, -4.332081, 0, 1, 0.003921569, 1,
-0.4579594, -1.743185, -2.726546, 0, 1, 0.01176471, 1,
-0.4575393, -0.5656258, -2.118799, 0, 1, 0.01568628, 1,
-0.4516977, -0.4759054, -2.115627, 0, 1, 0.02352941, 1,
-0.4512303, 0.06054257, -0.2472998, 0, 1, 0.02745098, 1,
-0.4471698, -1.196829, -1.891902, 0, 1, 0.03529412, 1,
-0.4381354, -0.1892013, -2.952104, 0, 1, 0.03921569, 1,
-0.4380031, 0.6460792, 0.2999401, 0, 1, 0.04705882, 1,
-0.4362771, 0.1269968, -2.193727, 0, 1, 0.05098039, 1,
-0.4343844, 1.80223, 0.696609, 0, 1, 0.05882353, 1,
-0.4305029, 0.8077531, -0.07013648, 0, 1, 0.0627451, 1,
-0.4292745, 0.7852359, -0.4244522, 0, 1, 0.07058824, 1,
-0.4288811, -0.5978889, -3.718155, 0, 1, 0.07450981, 1,
-0.4272755, 2.687654, 0.2360258, 0, 1, 0.08235294, 1,
-0.4250493, 0.8746659, -0.8366337, 0, 1, 0.08627451, 1,
-0.4196931, 1.155638, -1.045259, 0, 1, 0.09411765, 1,
-0.4193464, -0.2024265, -2.050519, 0, 1, 0.1019608, 1,
-0.4172336, -0.5677536, -3.041039, 0, 1, 0.1058824, 1,
-0.4150056, 0.5995887, -1.819312, 0, 1, 0.1137255, 1,
-0.4142758, -0.08446639, -1.7774, 0, 1, 0.1176471, 1,
-0.4138229, -1.173682, -3.454263, 0, 1, 0.1254902, 1,
-0.4115956, -0.1053961, -1.830879, 0, 1, 0.1294118, 1,
-0.4076538, 0.2332346, -1.481335, 0, 1, 0.1372549, 1,
-0.4070567, -0.4278881, -2.520562, 0, 1, 0.1411765, 1,
-0.4032591, 1.734211, -0.5234364, 0, 1, 0.1490196, 1,
-0.4000093, -0.949299, -2.573228, 0, 1, 0.1529412, 1,
-0.3971685, 0.6156058, -1.309004, 0, 1, 0.1607843, 1,
-0.3952589, 0.3332748, -2.926741, 0, 1, 0.1647059, 1,
-0.3944182, -1.946081, -2.563294, 0, 1, 0.172549, 1,
-0.3941801, -0.6525624, -2.444692, 0, 1, 0.1764706, 1,
-0.3930357, 0.3708964, -0.4593125, 0, 1, 0.1843137, 1,
-0.3927304, 0.9356292, 0.0767455, 0, 1, 0.1882353, 1,
-0.3801703, -0.4953148, -0.8540973, 0, 1, 0.1960784, 1,
-0.3766637, -0.2101261, -3.92933, 0, 1, 0.2039216, 1,
-0.3766313, -0.3572088, -3.613965, 0, 1, 0.2078431, 1,
-0.3765294, 0.1566309, -2.605471, 0, 1, 0.2156863, 1,
-0.3764247, 1.095321, -0.05193797, 0, 1, 0.2196078, 1,
-0.3755612, 0.1412048, -2.260357, 0, 1, 0.227451, 1,
-0.3751294, -1.546194, -3.489865, 0, 1, 0.2313726, 1,
-0.374347, -0.9329649, -2.56442, 0, 1, 0.2392157, 1,
-0.3738236, -0.9583249, -2.197901, 0, 1, 0.2431373, 1,
-0.3717496, 0.1831376, -1.980299, 0, 1, 0.2509804, 1,
-0.3700178, -1.130811, -2.554152, 0, 1, 0.254902, 1,
-0.3650867, 1.318713, 2.305658, 0, 1, 0.2627451, 1,
-0.3645172, -0.4650399, -2.594678, 0, 1, 0.2666667, 1,
-0.3599456, -0.6600088, -3.71136, 0, 1, 0.2745098, 1,
-0.3559404, 0.1126244, -0.187271, 0, 1, 0.2784314, 1,
-0.3428557, -0.07803047, -2.244515, 0, 1, 0.2862745, 1,
-0.3357894, 0.9443408, -0.4900755, 0, 1, 0.2901961, 1,
-0.3331153, -0.9834577, -4.174116, 0, 1, 0.2980392, 1,
-0.3328433, -1.676332, -1.864977, 0, 1, 0.3058824, 1,
-0.3302872, 0.5746031, -1.561901, 0, 1, 0.3098039, 1,
-0.328668, -0.1836687, -1.313891, 0, 1, 0.3176471, 1,
-0.3251449, -0.2144852, -2.62327, 0, 1, 0.3215686, 1,
-0.3212593, 0.6269994, -1.311793, 0, 1, 0.3294118, 1,
-0.3199281, 2.490904, -0.3319036, 0, 1, 0.3333333, 1,
-0.3189635, 0.5024052, 1.423099, 0, 1, 0.3411765, 1,
-0.3155221, -0.3658235, -1.739877, 0, 1, 0.345098, 1,
-0.3117156, 1.122646, -2.934611, 0, 1, 0.3529412, 1,
-0.3080236, 1.203248, 0.2661538, 0, 1, 0.3568628, 1,
-0.3062721, 0.1896526, -1.123136, 0, 1, 0.3647059, 1,
-0.2992281, 0.7710758, 1.247686, 0, 1, 0.3686275, 1,
-0.2972388, 0.9210179, -1.265311, 0, 1, 0.3764706, 1,
-0.2969345, 0.3594786, -1.583788, 0, 1, 0.3803922, 1,
-0.2904836, 0.4756745, -1.892116, 0, 1, 0.3882353, 1,
-0.2898273, -0.1241353, -2.473812, 0, 1, 0.3921569, 1,
-0.2877614, -0.417638, -2.557306, 0, 1, 0.4, 1,
-0.286352, -1.173922, -3.829276, 0, 1, 0.4078431, 1,
-0.2860286, 0.4639979, -0.09013546, 0, 1, 0.4117647, 1,
-0.2815193, -0.2184089, 0.08358777, 0, 1, 0.4196078, 1,
-0.2809876, 0.7040018, 1.389982, 0, 1, 0.4235294, 1,
-0.2806098, 0.9289922, -1.283546, 0, 1, 0.4313726, 1,
-0.280071, 0.1494569, -1.725111, 0, 1, 0.4352941, 1,
-0.2768772, 0.7095063, 1.865404, 0, 1, 0.4431373, 1,
-0.2730265, 0.08558398, -0.03026967, 0, 1, 0.4470588, 1,
-0.2700804, -0.5523448, -1.622631, 0, 1, 0.454902, 1,
-0.2698886, -0.1316825, -1.985371, 0, 1, 0.4588235, 1,
-0.2676907, 0.04195498, -1.153706, 0, 1, 0.4666667, 1,
-0.2674107, -0.5251916, -2.034013, 0, 1, 0.4705882, 1,
-0.2610941, 1.397201, -0.7402575, 0, 1, 0.4784314, 1,
-0.2585879, 0.7607158, 0.8598751, 0, 1, 0.4823529, 1,
-0.2538377, 1.231714, 0.8074346, 0, 1, 0.4901961, 1,
-0.2523267, -0.7601136, -3.165096, 0, 1, 0.4941176, 1,
-0.2509679, -0.3061444, -3.200832, 0, 1, 0.5019608, 1,
-0.2481655, 1.629235, -1.132722, 0, 1, 0.509804, 1,
-0.2454621, 0.6151491, -1.715175, 0, 1, 0.5137255, 1,
-0.2446855, -0.2987898, -4.011715, 0, 1, 0.5215687, 1,
-0.2376685, 0.4475796, -0.3443863, 0, 1, 0.5254902, 1,
-0.233959, 0.931391, 0.4382295, 0, 1, 0.5333334, 1,
-0.2325653, -0.9676295, -1.759238, 0, 1, 0.5372549, 1,
-0.232273, -0.4432449, -2.436753, 0, 1, 0.5450981, 1,
-0.226506, 0.2794919, -0.1138204, 0, 1, 0.5490196, 1,
-0.2147138, 2.822444, -0.5692154, 0, 1, 0.5568628, 1,
-0.2100916, -1.350895, -2.801335, 0, 1, 0.5607843, 1,
-0.2021616, 0.6791355, -1.845471, 0, 1, 0.5686275, 1,
-0.1985505, 0.6240702, -1.561777, 0, 1, 0.572549, 1,
-0.1954348, 0.174043, -1.141097, 0, 1, 0.5803922, 1,
-0.1932651, -1.613925, -4.139786, 0, 1, 0.5843138, 1,
-0.1915672, 1.692387, -1.982147, 0, 1, 0.5921569, 1,
-0.1911565, 0.2936053, 0.5308398, 0, 1, 0.5960785, 1,
-0.1844026, 1.242617, -1.13892, 0, 1, 0.6039216, 1,
-0.1842563, 1.320061, 0.2851762, 0, 1, 0.6117647, 1,
-0.1839977, -0.4805112, -0.8526887, 0, 1, 0.6156863, 1,
-0.1821586, 0.5342031, -0.03525009, 0, 1, 0.6235294, 1,
-0.1808977, 1.304448, 1.031895, 0, 1, 0.627451, 1,
-0.1799014, -0.6734105, -4.028448, 0, 1, 0.6352941, 1,
-0.1777615, 1.401127, 0.5944155, 0, 1, 0.6392157, 1,
-0.1637483, 0.4690303, -0.5887123, 0, 1, 0.6470588, 1,
-0.157432, 0.06525718, -3.016993, 0, 1, 0.6509804, 1,
-0.1569255, -1.526896, -3.087201, 0, 1, 0.6588235, 1,
-0.1517039, 0.3542143, 0.2372853, 0, 1, 0.6627451, 1,
-0.1505339, 1.135368, 0.7548073, 0, 1, 0.6705883, 1,
-0.1504721, 0.1463136, -2.498535, 0, 1, 0.6745098, 1,
-0.1502485, 0.9540551, -0.1943106, 0, 1, 0.682353, 1,
-0.1469934, -0.8349184, -1.683814, 0, 1, 0.6862745, 1,
-0.1467782, 0.5345394, -0.1591205, 0, 1, 0.6941177, 1,
-0.1454714, 0.8019542, 0.8257821, 0, 1, 0.7019608, 1,
-0.1429717, 1.56575, 0.9307469, 0, 1, 0.7058824, 1,
-0.141025, -1.994554, -3.125058, 0, 1, 0.7137255, 1,
-0.1405076, -0.4085256, -1.748638, 0, 1, 0.7176471, 1,
-0.1403219, 1.056177, -0.6714658, 0, 1, 0.7254902, 1,
-0.1381141, -1.329265, -3.286971, 0, 1, 0.7294118, 1,
-0.1376829, -0.9792535, -2.09523, 0, 1, 0.7372549, 1,
-0.1265274, 1.121447, 0.9351427, 0, 1, 0.7411765, 1,
-0.1261276, -0.4488164, -2.52338, 0, 1, 0.7490196, 1,
-0.1223845, 1.03365, -0.2905065, 0, 1, 0.7529412, 1,
-0.1159089, -1.224536, -4.532852, 0, 1, 0.7607843, 1,
-0.1136565, -2.319371, -3.55379, 0, 1, 0.7647059, 1,
-0.1124196, -0.5645997, -2.362595, 0, 1, 0.772549, 1,
-0.1118426, 0.5887497, -0.3101702, 0, 1, 0.7764706, 1,
-0.109824, -0.6101274, -3.120354, 0, 1, 0.7843137, 1,
-0.1057545, -1.70233, -3.705678, 0, 1, 0.7882353, 1,
-0.104237, -0.2165086, -2.848947, 0, 1, 0.7960784, 1,
-0.1021596, 1.477431, -0.6311914, 0, 1, 0.8039216, 1,
-0.09907255, -1.365523, -2.640847, 0, 1, 0.8078431, 1,
-0.09576064, -0.8004259, -2.589083, 0, 1, 0.8156863, 1,
-0.09127562, -0.5609772, -3.631491, 0, 1, 0.8196079, 1,
-0.08892234, -0.2800816, -0.6746877, 0, 1, 0.827451, 1,
-0.08626091, 0.4984068, 1.485496, 0, 1, 0.8313726, 1,
-0.08255581, -0.6446465, -0.9873672, 0, 1, 0.8392157, 1,
-0.07397746, -0.5491546, -2.632793, 0, 1, 0.8431373, 1,
-0.06960836, 1.521602, -0.6758618, 0, 1, 0.8509804, 1,
-0.06641252, 1.442701, -0.0408861, 0, 1, 0.854902, 1,
-0.0652399, -0.2705437, -1.717311, 0, 1, 0.8627451, 1,
-0.06398264, -0.7577259, -2.506526, 0, 1, 0.8666667, 1,
-0.06026663, -0.0772696, -3.070096, 0, 1, 0.8745098, 1,
-0.05222782, 0.06183349, -0.009154465, 0, 1, 0.8784314, 1,
-0.04912597, 0.01989078, -0.8137998, 0, 1, 0.8862745, 1,
-0.0443919, 1.063008, -0.2306938, 0, 1, 0.8901961, 1,
-0.04119357, -0.3850726, -4.232699, 0, 1, 0.8980392, 1,
-0.0408346, -0.6836196, -2.079964, 0, 1, 0.9058824, 1,
-0.03828891, -1.102658, -2.342875, 0, 1, 0.9098039, 1,
-0.03477678, -0.4543285, -2.929008, 0, 1, 0.9176471, 1,
-0.03446555, -0.9986693, -2.537743, 0, 1, 0.9215686, 1,
-0.03348031, 0.2847945, 0.1725868, 0, 1, 0.9294118, 1,
-0.03259652, 0.2653574, 0.1662638, 0, 1, 0.9333333, 1,
-0.03055502, -0.8584042, -2.425946, 0, 1, 0.9411765, 1,
-0.02798085, -0.3716449, -4.422884, 0, 1, 0.945098, 1,
-0.02618016, 0.6974443, -0.06800036, 0, 1, 0.9529412, 1,
-0.02376071, -1.243201, -1.686119, 0, 1, 0.9568627, 1,
-0.0151224, -1.586666, -3.71719, 0, 1, 0.9647059, 1,
-0.01190036, -2.046384, -1.51817, 0, 1, 0.9686275, 1,
-0.01174077, 2.464649, -0.04068416, 0, 1, 0.9764706, 1,
-0.01110015, -2.046102, -2.530737, 0, 1, 0.9803922, 1,
-0.01040058, -0.2759291, -2.55371, 0, 1, 0.9882353, 1,
-0.01015709, -0.5276883, -4.049664, 0, 1, 0.9921569, 1,
-0.007272154, 0.692363, -0.4624432, 0, 1, 1, 1,
-0.00186421, 0.6149233, 0.1697477, 0, 0.9921569, 1, 1,
0.00266553, -0.1370372, 1.957786, 0, 0.9882353, 1, 1,
0.005264151, 1.659115, 1.915225, 0, 0.9803922, 1, 1,
0.005285835, -0.2178052, 2.88957, 0, 0.9764706, 1, 1,
0.01002492, -0.7397423, 4.422427, 0, 0.9686275, 1, 1,
0.01158644, -0.9554024, 4.152462, 0, 0.9647059, 1, 1,
0.01194395, -0.7946503, 2.149024, 0, 0.9568627, 1, 1,
0.01488216, 1.056701, 1.238823, 0, 0.9529412, 1, 1,
0.01510869, -0.9432304, 2.976584, 0, 0.945098, 1, 1,
0.01878794, -0.1929969, 1.216409, 0, 0.9411765, 1, 1,
0.01883776, 1.142358, -0.7416795, 0, 0.9333333, 1, 1,
0.02455866, -1.577532, 2.610709, 0, 0.9294118, 1, 1,
0.0254619, 0.2196698, -0.07092815, 0, 0.9215686, 1, 1,
0.0307412, -0.5118306, 2.258252, 0, 0.9176471, 1, 1,
0.03205908, -1.778244, 2.222312, 0, 0.9098039, 1, 1,
0.03271137, 1.697762, 0.07790115, 0, 0.9058824, 1, 1,
0.03452537, -0.8408899, 1.160587, 0, 0.8980392, 1, 1,
0.03504934, 1.267798, 0.4531323, 0, 0.8901961, 1, 1,
0.03780982, -1.553783, 3.978863, 0, 0.8862745, 1, 1,
0.03973614, 0.3525003, 0.1216287, 0, 0.8784314, 1, 1,
0.04004345, -0.9363829, 3.161596, 0, 0.8745098, 1, 1,
0.04071783, 1.694312, 1.48559, 0, 0.8666667, 1, 1,
0.04176509, -0.9425651, 3.177374, 0, 0.8627451, 1, 1,
0.05165656, 1.850679, 0.206717, 0, 0.854902, 1, 1,
0.05299322, -0.6849387, 2.637464, 0, 0.8509804, 1, 1,
0.0532911, -1.895902, 1.791222, 0, 0.8431373, 1, 1,
0.05425708, -0.5980693, 4.262459, 0, 0.8392157, 1, 1,
0.05552819, -0.5082729, 2.795255, 0, 0.8313726, 1, 1,
0.05781875, -2.326573, 2.641685, 0, 0.827451, 1, 1,
0.0643848, 0.6265799, 0.1473279, 0, 0.8196079, 1, 1,
0.06462819, -1.578943, 2.512629, 0, 0.8156863, 1, 1,
0.06539075, -0.8336465, 2.49881, 0, 0.8078431, 1, 1,
0.06899758, 0.5894758, -1.191649, 0, 0.8039216, 1, 1,
0.0702246, -0.7424971, 1.751184, 0, 0.7960784, 1, 1,
0.07207312, 0.1794724, 0.3805448, 0, 0.7882353, 1, 1,
0.07278596, 0.9513215, -0.2878392, 0, 0.7843137, 1, 1,
0.07295587, 0.4395878, -1.20099, 0, 0.7764706, 1, 1,
0.07419125, -0.7630478, 3.526628, 0, 0.772549, 1, 1,
0.07901712, -0.871838, 2.930164, 0, 0.7647059, 1, 1,
0.08370317, -1.185008, 2.509279, 0, 0.7607843, 1, 1,
0.08431677, 0.1035039, 0.9195642, 0, 0.7529412, 1, 1,
0.08437227, -2.736311, 4.568161, 0, 0.7490196, 1, 1,
0.0869923, 0.3919682, 0.5828171, 0, 0.7411765, 1, 1,
0.08723766, -0.9113236, 1.81149, 0, 0.7372549, 1, 1,
0.08832462, 1.405591, 0.2787437, 0, 0.7294118, 1, 1,
0.08913133, -1.106225, 3.238047, 0, 0.7254902, 1, 1,
0.09310383, 1.252208, -0.3488175, 0, 0.7176471, 1, 1,
0.09792055, -0.1371285, 2.249641, 0, 0.7137255, 1, 1,
0.09942902, -0.8468714, 2.024039, 0, 0.7058824, 1, 1,
0.1119935, -0.5328901, 2.242747, 0, 0.6980392, 1, 1,
0.1133675, -0.2332071, 1.967395, 0, 0.6941177, 1, 1,
0.1151818, 0.6494824, -0.04741192, 0, 0.6862745, 1, 1,
0.1184013, 1.638749, 2.369736, 0, 0.682353, 1, 1,
0.1213221, -1.378001, 2.870064, 0, 0.6745098, 1, 1,
0.1216814, -1.70892, 2.692783, 0, 0.6705883, 1, 1,
0.1265878, -0.1854941, 2.423021, 0, 0.6627451, 1, 1,
0.1312453, -0.759049, 1.205377, 0, 0.6588235, 1, 1,
0.1337697, 0.4455701, 2.329157, 0, 0.6509804, 1, 1,
0.1337741, -1.99354, 2.000837, 0, 0.6470588, 1, 1,
0.1378559, -0.159836, 1.701255, 0, 0.6392157, 1, 1,
0.1409491, -0.7470576, 3.812037, 0, 0.6352941, 1, 1,
0.1421448, 1.561575, -0.240491, 0, 0.627451, 1, 1,
0.1455696, 1.425557, 1.788316, 0, 0.6235294, 1, 1,
0.1459999, 0.2513282, 1.238914, 0, 0.6156863, 1, 1,
0.1486445, 0.4650906, 1.769738, 0, 0.6117647, 1, 1,
0.1542644, -0.0278944, 2.855015, 0, 0.6039216, 1, 1,
0.1567017, -1.517757, 2.540977, 0, 0.5960785, 1, 1,
0.1575191, -0.1974665, 2.473936, 0, 0.5921569, 1, 1,
0.1618275, -0.2514454, 2.869873, 0, 0.5843138, 1, 1,
0.1619815, -2.29603, 2.493893, 0, 0.5803922, 1, 1,
0.1628022, -0.3997305, 3.082863, 0, 0.572549, 1, 1,
0.1704499, -0.05604156, 2.067547, 0, 0.5686275, 1, 1,
0.1715655, -0.1071172, 2.693617, 0, 0.5607843, 1, 1,
0.1718777, -0.006776286, 1.487215, 0, 0.5568628, 1, 1,
0.1776069, -0.1231438, 3.101501, 0, 0.5490196, 1, 1,
0.1792849, 1.068085, 0.8585351, 0, 0.5450981, 1, 1,
0.1851075, -0.5307346, 4.538476, 0, 0.5372549, 1, 1,
0.18756, 1.753695, -0.06953322, 0, 0.5333334, 1, 1,
0.1896966, -0.02690329, 2.871888, 0, 0.5254902, 1, 1,
0.1903793, 0.4762191, 1.716934, 0, 0.5215687, 1, 1,
0.1905626, 0.05932211, 1.308395, 0, 0.5137255, 1, 1,
0.1908889, 0.5181124, 0.9217676, 0, 0.509804, 1, 1,
0.1914045, 0.1351799, 1.85181, 0, 0.5019608, 1, 1,
0.1935936, 0.05440736, 0.893125, 0, 0.4941176, 1, 1,
0.1989716, 0.5619233, 1.574654, 0, 0.4901961, 1, 1,
0.1991553, -0.680425, 3.873712, 0, 0.4823529, 1, 1,
0.2008252, 1.296644, 1.371478, 0, 0.4784314, 1, 1,
0.2015934, -0.8306616, 4.122653, 0, 0.4705882, 1, 1,
0.206373, 0.6830857, 1.21789, 0, 0.4666667, 1, 1,
0.2074096, -0.126985, 1.551838, 0, 0.4588235, 1, 1,
0.2131898, -0.6457059, 2.105836, 0, 0.454902, 1, 1,
0.2132063, 0.2628753, 1.034626, 0, 0.4470588, 1, 1,
0.2137112, -0.5253391, 2.45266, 0, 0.4431373, 1, 1,
0.2140556, -0.3875576, 1.390713, 0, 0.4352941, 1, 1,
0.2141402, 1.956535, -0.1712377, 0, 0.4313726, 1, 1,
0.2159852, -0.5540065, 3.646275, 0, 0.4235294, 1, 1,
0.2179652, -0.339302, 0.9125022, 0, 0.4196078, 1, 1,
0.2219453, -4.005061, 2.834718, 0, 0.4117647, 1, 1,
0.2231802, -1.804352, 4.805007, 0, 0.4078431, 1, 1,
0.224419, 0.8003389, -0.2065822, 0, 0.4, 1, 1,
0.2250789, -1.103724, 3.69919, 0, 0.3921569, 1, 1,
0.2261539, 1.845098, 0.5242316, 0, 0.3882353, 1, 1,
0.2274838, -0.5618128, 2.85829, 0, 0.3803922, 1, 1,
0.2282118, 1.365589, 0.5851182, 0, 0.3764706, 1, 1,
0.2331357, -0.4047118, 2.752868, 0, 0.3686275, 1, 1,
0.2372055, 1.345154, -0.1229647, 0, 0.3647059, 1, 1,
0.2402795, 1.494853, -1.820478, 0, 0.3568628, 1, 1,
0.240469, 0.2090739, 0.8742488, 0, 0.3529412, 1, 1,
0.2407524, 1.221591, -1.164955, 0, 0.345098, 1, 1,
0.2407909, -0.4093807, 2.647374, 0, 0.3411765, 1, 1,
0.2444976, 0.2309124, 0.9132789, 0, 0.3333333, 1, 1,
0.2463859, -0.2802165, 0.9060647, 0, 0.3294118, 1, 1,
0.2467563, 1.72952, 0.1204853, 0, 0.3215686, 1, 1,
0.2561157, -0.9899652, 3.454962, 0, 0.3176471, 1, 1,
0.2642877, -0.3234172, 3.123178, 0, 0.3098039, 1, 1,
0.2657201, 0.2666225, 1.603294, 0, 0.3058824, 1, 1,
0.2661129, 0.7371019, -0.0423411, 0, 0.2980392, 1, 1,
0.2699068, -1.237734, 2.762772, 0, 0.2901961, 1, 1,
0.2717756, 0.2296738, 0.2835766, 0, 0.2862745, 1, 1,
0.271798, 0.7326545, 0.3604839, 0, 0.2784314, 1, 1,
0.2761232, -1.632087, 2.230429, 0, 0.2745098, 1, 1,
0.2820113, -0.2008948, 3.264177, 0, 0.2666667, 1, 1,
0.2821663, -0.3453688, 1.179123, 0, 0.2627451, 1, 1,
0.2864676, -1.604039, 3.773927, 0, 0.254902, 1, 1,
0.2910285, 0.1939018, 0.782291, 0, 0.2509804, 1, 1,
0.294236, 0.6187835, -1.247999, 0, 0.2431373, 1, 1,
0.2962558, -0.5681488, 3.000111, 0, 0.2392157, 1, 1,
0.296833, 0.2323187, 2.167745, 0, 0.2313726, 1, 1,
0.2978109, -0.1271988, 3.083278, 0, 0.227451, 1, 1,
0.3005418, -0.7284364, 3.596928, 0, 0.2196078, 1, 1,
0.3012978, 0.2243073, 0.524034, 0, 0.2156863, 1, 1,
0.3159861, -1.253395, 4.343843, 0, 0.2078431, 1, 1,
0.316585, -0.88984, 4.14215, 0, 0.2039216, 1, 1,
0.3187249, -0.08751047, 2.445228, 0, 0.1960784, 1, 1,
0.3278686, 0.4470934, 0.4349084, 0, 0.1882353, 1, 1,
0.3312419, 1.342063, -0.6450018, 0, 0.1843137, 1, 1,
0.3331189, -2.446156, 2.290485, 0, 0.1764706, 1, 1,
0.3357099, -0.681381, 3.246529, 0, 0.172549, 1, 1,
0.3399014, 1.836963, -0.3471044, 0, 0.1647059, 1, 1,
0.3415177, -0.8800986, 3.507149, 0, 0.1607843, 1, 1,
0.3424382, -0.478362, 3.289522, 0, 0.1529412, 1, 1,
0.3440797, -0.6327448, 1.157093, 0, 0.1490196, 1, 1,
0.3477203, -1.17796, 2.151828, 0, 0.1411765, 1, 1,
0.3496478, 0.3426894, 1.589269, 0, 0.1372549, 1, 1,
0.3502668, 0.7225983, 0.3167817, 0, 0.1294118, 1, 1,
0.3503925, -0.7219973, 2.317116, 0, 0.1254902, 1, 1,
0.3574814, -0.7536863, 3.137786, 0, 0.1176471, 1, 1,
0.3642923, -0.5244565, 2.005949, 0, 0.1137255, 1, 1,
0.3651988, 0.8222489, -0.4756029, 0, 0.1058824, 1, 1,
0.3700791, 0.5758291, 0.2452371, 0, 0.09803922, 1, 1,
0.3716259, -0.375592, 3.102012, 0, 0.09411765, 1, 1,
0.3728516, 1.387001, -1.008006, 0, 0.08627451, 1, 1,
0.3772753, 1.178137, 1.68557, 0, 0.08235294, 1, 1,
0.3789494, -0.07617855, 1.475209, 0, 0.07450981, 1, 1,
0.3800816, -0.02875658, 2.238101, 0, 0.07058824, 1, 1,
0.3828248, -1.017972, 3.624969, 0, 0.0627451, 1, 1,
0.3844545, 0.4684342, 1.598734, 0, 0.05882353, 1, 1,
0.3861493, 1.105656, -0.6493075, 0, 0.05098039, 1, 1,
0.3899719, -1.199227, 2.797793, 0, 0.04705882, 1, 1,
0.3901847, 0.04428542, 0.8708991, 0, 0.03921569, 1, 1,
0.3978889, 0.751048, -0.6515919, 0, 0.03529412, 1, 1,
0.398362, -0.2103718, 2.310545, 0, 0.02745098, 1, 1,
0.4093099, 0.3909376, 0.1962797, 0, 0.02352941, 1, 1,
0.4113822, -1.24935, 1.444694, 0, 0.01568628, 1, 1,
0.4118702, -0.0428358, 0.05650225, 0, 0.01176471, 1, 1,
0.412917, -3.695744, 3.153043, 0, 0.003921569, 1, 1,
0.4156442, 0.2785893, 2.916485, 0.003921569, 0, 1, 1,
0.4207153, -0.2519431, 1.099569, 0.007843138, 0, 1, 1,
0.4250041, 0.9253121, 0.3300893, 0.01568628, 0, 1, 1,
0.4251483, 0.09426511, 2.463048, 0.01960784, 0, 1, 1,
0.4294513, -0.761587, 1.757535, 0.02745098, 0, 1, 1,
0.4299721, 1.32398, 0.291317, 0.03137255, 0, 1, 1,
0.4334716, 0.49836, 0.1114587, 0.03921569, 0, 1, 1,
0.4336426, 1.063591, 1.614789, 0.04313726, 0, 1, 1,
0.4378345, -0.01262798, 1.099417, 0.05098039, 0, 1, 1,
0.4412752, -0.1977085, 1.246956, 0.05490196, 0, 1, 1,
0.4462464, -0.7236294, 2.160374, 0.0627451, 0, 1, 1,
0.4482347, 0.9877178, -1.170142, 0.06666667, 0, 1, 1,
0.4551565, 0.1174841, 3.490785, 0.07450981, 0, 1, 1,
0.4617983, -1.775147, 2.750188, 0.07843138, 0, 1, 1,
0.4634747, -0.3241939, 3.052232, 0.08627451, 0, 1, 1,
0.4715985, -0.2814147, 0.2185617, 0.09019608, 0, 1, 1,
0.4752811, 0.4421454, 0.2279664, 0.09803922, 0, 1, 1,
0.4766732, -1.274334, 4.406598, 0.1058824, 0, 1, 1,
0.4818146, -1.061024, 3.854776, 0.1098039, 0, 1, 1,
0.4820199, 0.9876514, 0.0006646356, 0.1176471, 0, 1, 1,
0.4864371, 0.4444792, 1.361294, 0.1215686, 0, 1, 1,
0.4877988, -0.374808, 3.090284, 0.1294118, 0, 1, 1,
0.4940812, -1.945726, 4.439026, 0.1333333, 0, 1, 1,
0.4975263, -1.111089, 2.34908, 0.1411765, 0, 1, 1,
0.5056312, -0.2688567, 2.176264, 0.145098, 0, 1, 1,
0.5074496, 0.6596308, 0.2777494, 0.1529412, 0, 1, 1,
0.5106353, -0.403625, 1.819149, 0.1568628, 0, 1, 1,
0.5112465, -0.8781406, 2.236439, 0.1647059, 0, 1, 1,
0.5153057, -1.232865, 0.8584118, 0.1686275, 0, 1, 1,
0.5153385, 1.292203, 0.6502444, 0.1764706, 0, 1, 1,
0.5176992, -0.7999213, 2.46716, 0.1803922, 0, 1, 1,
0.5186104, 0.3528735, 0.4273068, 0.1882353, 0, 1, 1,
0.5218111, -0.2393706, 1.775915, 0.1921569, 0, 1, 1,
0.5221019, 0.2816854, -0.7749965, 0.2, 0, 1, 1,
0.5243852, 0.946791, -0.5023541, 0.2078431, 0, 1, 1,
0.5250019, -1.451346, 3.169149, 0.2117647, 0, 1, 1,
0.5300527, 0.6212679, 0.8471515, 0.2196078, 0, 1, 1,
0.5300775, -1.173764, 0.8953745, 0.2235294, 0, 1, 1,
0.5323043, 0.5515871, 1.618663, 0.2313726, 0, 1, 1,
0.5329781, 0.5229694, -0.5782068, 0.2352941, 0, 1, 1,
0.5422814, -2.186697, 4.056385, 0.2431373, 0, 1, 1,
0.5479661, 2.004072, 0.2012996, 0.2470588, 0, 1, 1,
0.5480337, 0.5328274, -0.136479, 0.254902, 0, 1, 1,
0.5512567, -0.3198326, 1.683846, 0.2588235, 0, 1, 1,
0.5528205, 1.779624, 0.226413, 0.2666667, 0, 1, 1,
0.5535532, -1.199262, 3.177103, 0.2705882, 0, 1, 1,
0.556241, -1.700999, 2.425774, 0.2784314, 0, 1, 1,
0.5619318, 2.532588, 1.132111, 0.282353, 0, 1, 1,
0.5638736, 0.5989556, 1.622224, 0.2901961, 0, 1, 1,
0.5695616, 0.6339666, 1.161062, 0.2941177, 0, 1, 1,
0.5703844, 1.864998, -0.5444001, 0.3019608, 0, 1, 1,
0.5718711, 1.315391, 0.1772347, 0.3098039, 0, 1, 1,
0.5739675, 1.098412, -2.211775, 0.3137255, 0, 1, 1,
0.5757302, -0.3950661, 1.659158, 0.3215686, 0, 1, 1,
0.5830788, 0.6099778, -0.1864457, 0.3254902, 0, 1, 1,
0.5872896, -0.03318123, 0.8690173, 0.3333333, 0, 1, 1,
0.5929393, 0.5888273, 1.839841, 0.3372549, 0, 1, 1,
0.5965256, -0.6734231, 3.414935, 0.345098, 0, 1, 1,
0.6019359, 0.2573552, 1.251691, 0.3490196, 0, 1, 1,
0.6064981, -0.551141, 1.610449, 0.3568628, 0, 1, 1,
0.6075659, 2.075855, 0.0199594, 0.3607843, 0, 1, 1,
0.6092092, -0.9040561, 3.935733, 0.3686275, 0, 1, 1,
0.6099347, -2.239358, 2.470131, 0.372549, 0, 1, 1,
0.6128714, -0.4106702, 1.445131, 0.3803922, 0, 1, 1,
0.6136872, -0.5524047, -0.5376137, 0.3843137, 0, 1, 1,
0.6282884, -0.3303393, 0.5343298, 0.3921569, 0, 1, 1,
0.6344856, -0.3915116, 1.091229, 0.3960784, 0, 1, 1,
0.6345596, 0.01315032, 1.561825, 0.4039216, 0, 1, 1,
0.6433185, -0.1088856, 0.822122, 0.4117647, 0, 1, 1,
0.6435115, -0.3076911, 2.711929, 0.4156863, 0, 1, 1,
0.6438971, -0.1784816, 0.2466124, 0.4235294, 0, 1, 1,
0.6490935, 3.039302, 0.5555029, 0.427451, 0, 1, 1,
0.65434, -0.1638968, 3.829458, 0.4352941, 0, 1, 1,
0.6553801, -1.509871, 2.911474, 0.4392157, 0, 1, 1,
0.6601633, 1.413743, -0.8993257, 0.4470588, 0, 1, 1,
0.6607526, 0.1878764, 4.099086, 0.4509804, 0, 1, 1,
0.6666725, 1.183886, -1.401883, 0.4588235, 0, 1, 1,
0.6680094, 0.7045882, 1.359733, 0.4627451, 0, 1, 1,
0.6684922, 2.217702, 0.2399967, 0.4705882, 0, 1, 1,
0.6708444, -2.059143, 2.570788, 0.4745098, 0, 1, 1,
0.6718224, -1.10088, 3.458666, 0.4823529, 0, 1, 1,
0.6724554, 0.4019455, 0.6303738, 0.4862745, 0, 1, 1,
0.6731166, -0.9322756, 2.982987, 0.4941176, 0, 1, 1,
0.6751786, 0.4362866, 2.029158, 0.5019608, 0, 1, 1,
0.6755411, -0.7136014, 2.444925, 0.5058824, 0, 1, 1,
0.6773002, -1.166434, 1.669881, 0.5137255, 0, 1, 1,
0.6776931, -0.2480646, 0.3586016, 0.5176471, 0, 1, 1,
0.6806364, -0.7523218, 3.395604, 0.5254902, 0, 1, 1,
0.6819407, -0.008109416, 0.9558123, 0.5294118, 0, 1, 1,
0.6853444, -0.3590437, 0.9607967, 0.5372549, 0, 1, 1,
0.6871918, -0.07010008, 1.769181, 0.5411765, 0, 1, 1,
0.694541, -0.2503826, 0.7849654, 0.5490196, 0, 1, 1,
0.7009323, 0.8116333, 0.08271552, 0.5529412, 0, 1, 1,
0.7050424, 1.082743, 0.9593702, 0.5607843, 0, 1, 1,
0.710316, -1.573392, 1.866139, 0.5647059, 0, 1, 1,
0.7122693, -0.413692, 1.535313, 0.572549, 0, 1, 1,
0.7132959, 1.873324, -1.355293, 0.5764706, 0, 1, 1,
0.7174229, -0.9106226, 2.051997, 0.5843138, 0, 1, 1,
0.7176953, -0.6450879, 2.796787, 0.5882353, 0, 1, 1,
0.7177551, 2.134575, -0.8359823, 0.5960785, 0, 1, 1,
0.7201861, 1.415825, -0.2204664, 0.6039216, 0, 1, 1,
0.7284671, 1.783494, -0.4422492, 0.6078432, 0, 1, 1,
0.7341355, -1.419244, 2.865458, 0.6156863, 0, 1, 1,
0.7341942, 0.3295929, 2.222522, 0.6196079, 0, 1, 1,
0.7352087, 1.033373, 0.2050641, 0.627451, 0, 1, 1,
0.738579, 1.693868, 1.281762, 0.6313726, 0, 1, 1,
0.7414231, 0.03482567, 0.3814287, 0.6392157, 0, 1, 1,
0.7519919, -0.031831, 1.944801, 0.6431373, 0, 1, 1,
0.7520224, -0.7720288, 2.175159, 0.6509804, 0, 1, 1,
0.7522521, -0.7191427, 1.341985, 0.654902, 0, 1, 1,
0.7543928, 0.06979764, 1.482369, 0.6627451, 0, 1, 1,
0.7551491, -0.5386456, 2.00106, 0.6666667, 0, 1, 1,
0.7575081, 1.066218, -0.05415887, 0.6745098, 0, 1, 1,
0.7581095, -0.4535101, 2.651935, 0.6784314, 0, 1, 1,
0.7624862, 1.269075, -0.1600765, 0.6862745, 0, 1, 1,
0.7677562, -0.2685493, 1.893247, 0.6901961, 0, 1, 1,
0.768917, 0.5775903, 0.3198166, 0.6980392, 0, 1, 1,
0.7728254, 0.6763403, 1.299348, 0.7058824, 0, 1, 1,
0.7748815, -0.2462714, 1.352803, 0.7098039, 0, 1, 1,
0.7803822, -0.8374598, 1.7453, 0.7176471, 0, 1, 1,
0.7836133, -1.194752, 3.387955, 0.7215686, 0, 1, 1,
0.7894049, 0.6765184, 1.406891, 0.7294118, 0, 1, 1,
0.7983942, -1.243542, 4.107601, 0.7333333, 0, 1, 1,
0.7995661, -0.387649, 1.976261, 0.7411765, 0, 1, 1,
0.8113273, 1.255365, 0.008762465, 0.7450981, 0, 1, 1,
0.8189301, 0.3490304, 1.621149, 0.7529412, 0, 1, 1,
0.8194025, 0.8521303, 0.9333984, 0.7568628, 0, 1, 1,
0.8246446, 0.05544056, 0.5871335, 0.7647059, 0, 1, 1,
0.8268049, -0.3096288, 0.9829873, 0.7686275, 0, 1, 1,
0.8305422, 0.5882619, 0.1328717, 0.7764706, 0, 1, 1,
0.8321882, -0.6994386, 1.387666, 0.7803922, 0, 1, 1,
0.8336599, 0.6058012, 1.823369, 0.7882353, 0, 1, 1,
0.8374562, 1.397644, 1.433103, 0.7921569, 0, 1, 1,
0.8415725, -1.004212, 3.705839, 0.8, 0, 1, 1,
0.8424441, 1.47576, -0.5778818, 0.8078431, 0, 1, 1,
0.8572812, 1.004992, 0.8016774, 0.8117647, 0, 1, 1,
0.8573117, 1.445391, 0.9395577, 0.8196079, 0, 1, 1,
0.8629323, 0.5564597, 2.229981, 0.8235294, 0, 1, 1,
0.8677511, 0.6214499, -0.9765962, 0.8313726, 0, 1, 1,
0.8700513, -0.02480756, 1.543124, 0.8352941, 0, 1, 1,
0.8700631, 1.044123, 1.47295, 0.8431373, 0, 1, 1,
0.8762513, 0.5890328, 1.086294, 0.8470588, 0, 1, 1,
0.8840519, 0.8450251, 1.09175, 0.854902, 0, 1, 1,
0.8858664, 0.6355186, 0.2675838, 0.8588235, 0, 1, 1,
0.8875172, -0.3027999, 3.297033, 0.8666667, 0, 1, 1,
0.8886595, 2.434826, 1.711572, 0.8705882, 0, 1, 1,
0.8932078, 1.107197, 1.163664, 0.8784314, 0, 1, 1,
0.8958765, -0.01580242, 0.5517327, 0.8823529, 0, 1, 1,
0.8964254, 0.7665645, 2.029671, 0.8901961, 0, 1, 1,
0.8984445, -0.9941894, 2.510275, 0.8941177, 0, 1, 1,
0.9044433, -0.3304302, 2.443311, 0.9019608, 0, 1, 1,
0.90718, -1.067827, 2.374218, 0.9098039, 0, 1, 1,
0.9147893, -0.3291805, 1.739186, 0.9137255, 0, 1, 1,
0.9161728, -1.946, 3.774167, 0.9215686, 0, 1, 1,
0.9259927, 1.774192, 0.5302243, 0.9254902, 0, 1, 1,
0.9272547, 0.9998278, 1.114003, 0.9333333, 0, 1, 1,
0.9382254, -1.104411, 3.006599, 0.9372549, 0, 1, 1,
0.9464339, -0.8218569, 2.685541, 0.945098, 0, 1, 1,
0.9486185, -1.534409, 3.980634, 0.9490196, 0, 1, 1,
0.9550078, 1.412871, 0.7008032, 0.9568627, 0, 1, 1,
0.9581478, 0.3187745, 0.8015727, 0.9607843, 0, 1, 1,
0.9582757, 1.074365, -0.4687747, 0.9686275, 0, 1, 1,
0.9698681, 0.1525778, 1.900252, 0.972549, 0, 1, 1,
0.9762174, 0.6868743, 0.3032616, 0.9803922, 0, 1, 1,
0.9784058, -2.52431, 2.449053, 0.9843137, 0, 1, 1,
0.9797176, 0.3786361, 1.094346, 0.9921569, 0, 1, 1,
0.980553, -2.625371, 2.686219, 0.9960784, 0, 1, 1,
0.9878202, -0.1684361, 1.850438, 1, 0, 0.9960784, 1,
0.990591, -1.025497, 3.813777, 1, 0, 0.9882353, 1,
0.9958136, -1.297598, 1.514156, 1, 0, 0.9843137, 1,
1.010566, -0.3198283, 1.951818, 1, 0, 0.9764706, 1,
1.012296, 0.5579384, 0.9975762, 1, 0, 0.972549, 1,
1.021954, 0.7075959, 1.62395, 1, 0, 0.9647059, 1,
1.022465, 0.2215182, 0.3385482, 1, 0, 0.9607843, 1,
1.023083, 1.205424, 1.557206, 1, 0, 0.9529412, 1,
1.035911, -1.821224, 1.895216, 1, 0, 0.9490196, 1,
1.039798, -0.3934912, 1.239632, 1, 0, 0.9411765, 1,
1.040495, 0.1180244, 0.5373438, 1, 0, 0.9372549, 1,
1.044141, -1.299078, 1.919766, 1, 0, 0.9294118, 1,
1.044264, -1.101382, 3.189947, 1, 0, 0.9254902, 1,
1.0481, -1.09447, 2.326224, 1, 0, 0.9176471, 1,
1.066059, -1.627127, 2.35752, 1, 0, 0.9137255, 1,
1.080664, -2.919843, 1.650722, 1, 0, 0.9058824, 1,
1.083809, 0.4984571, 0.2063319, 1, 0, 0.9019608, 1,
1.085976, 0.2016793, 1.488428, 1, 0, 0.8941177, 1,
1.08623, -0.09437121, 2.002856, 1, 0, 0.8862745, 1,
1.089399, 0.9843553, 0.2687196, 1, 0, 0.8823529, 1,
1.091302, 0.499516, 0.4614941, 1, 0, 0.8745098, 1,
1.092364, 0.280172, 0.7790334, 1, 0, 0.8705882, 1,
1.0998, -0.6683727, 1.246863, 1, 0, 0.8627451, 1,
1.101071, 0.03862781, 2.109673, 1, 0, 0.8588235, 1,
1.107282, -3.131505, 3.523771, 1, 0, 0.8509804, 1,
1.108843, -1.562809, 0.8274691, 1, 0, 0.8470588, 1,
1.112191, 0.06761262, 2.374255, 1, 0, 0.8392157, 1,
1.113545, 0.7161153, 1.256282, 1, 0, 0.8352941, 1,
1.121879, -0.2534955, 1.486365, 1, 0, 0.827451, 1,
1.130796, -0.002171512, 2.754154, 1, 0, 0.8235294, 1,
1.143858, -0.125828, 0.7458007, 1, 0, 0.8156863, 1,
1.150262, -0.2456386, -0.2775515, 1, 0, 0.8117647, 1,
1.153731, -0.4817721, 3.288976, 1, 0, 0.8039216, 1,
1.157026, -0.466158, 3.05004, 1, 0, 0.7960784, 1,
1.161143, 0.6607603, 0.6778917, 1, 0, 0.7921569, 1,
1.162368, 0.08213951, 1.264484, 1, 0, 0.7843137, 1,
1.171269, 0.141232, 0.8828704, 1, 0, 0.7803922, 1,
1.176723, 0.222181, -0.09260131, 1, 0, 0.772549, 1,
1.180396, -0.2069659, 2.581664, 1, 0, 0.7686275, 1,
1.191655, -1.875107, 1.676096, 1, 0, 0.7607843, 1,
1.196283, 1.268791, -0.7289004, 1, 0, 0.7568628, 1,
1.19723, 0.9503216, 2.325867, 1, 0, 0.7490196, 1,
1.199706, -0.08253267, 3.560047, 1, 0, 0.7450981, 1,
1.204714, -0.9122619, 2.488928, 1, 0, 0.7372549, 1,
1.222355, -0.8249254, 2.014029, 1, 0, 0.7333333, 1,
1.226151, -0.5329988, 1.85307, 1, 0, 0.7254902, 1,
1.229195, 0.6524672, 2.272397, 1, 0, 0.7215686, 1,
1.229285, -0.5028521, 1.03416, 1, 0, 0.7137255, 1,
1.230619, 0.8120787, -0.2099365, 1, 0, 0.7098039, 1,
1.230664, 0.468503, 2.215463, 1, 0, 0.7019608, 1,
1.231436, -1.743306, 2.599837, 1, 0, 0.6941177, 1,
1.232673, 0.7590105, 0.7677343, 1, 0, 0.6901961, 1,
1.23338, -1.783146, 4.281812, 1, 0, 0.682353, 1,
1.235494, 0.0101803, 3.706546, 1, 0, 0.6784314, 1,
1.253129, -0.6513907, 1.396453, 1, 0, 0.6705883, 1,
1.254658, 0.4685853, 0.5683549, 1, 0, 0.6666667, 1,
1.257673, -0.07557946, 0.2440082, 1, 0, 0.6588235, 1,
1.258299, 0.868804, -0.4795996, 1, 0, 0.654902, 1,
1.263522, 0.1080998, 0.6960321, 1, 0, 0.6470588, 1,
1.274899, 1.157014, 0.739691, 1, 0, 0.6431373, 1,
1.277473, 2.360174, -0.1765944, 1, 0, 0.6352941, 1,
1.279451, -1.858602, 2.44644, 1, 0, 0.6313726, 1,
1.280823, 0.7619272, 2.019611, 1, 0, 0.6235294, 1,
1.284431, -0.03629047, 2.079409, 1, 0, 0.6196079, 1,
1.288833, 1.157589, -0.3875315, 1, 0, 0.6117647, 1,
1.295919, -0.950502, 1.40152, 1, 0, 0.6078432, 1,
1.301275, -0.1469579, 3.601546, 1, 0, 0.6, 1,
1.305475, 0.190959, 1.49872, 1, 0, 0.5921569, 1,
1.31018, 0.2553653, 1.785846, 1, 0, 0.5882353, 1,
1.318072, 0.3257391, 0.6682411, 1, 0, 0.5803922, 1,
1.332473, 0.3151733, -1.390765, 1, 0, 0.5764706, 1,
1.334941, 1.039074, 1.702174, 1, 0, 0.5686275, 1,
1.338177, 1.147241, 2.468774, 1, 0, 0.5647059, 1,
1.344546, 0.2264774, 1.264159, 1, 0, 0.5568628, 1,
1.356801, 1.494457, 1.328096, 1, 0, 0.5529412, 1,
1.360027, -0.9554138, 2.343824, 1, 0, 0.5450981, 1,
1.37023, 0.3260867, 1.7877, 1, 0, 0.5411765, 1,
1.381643, 1.02858, 1.113039, 1, 0, 0.5333334, 1,
1.390382, 0.7777732, 1.002208, 1, 0, 0.5294118, 1,
1.415472, -1.807512, 3.061241, 1, 0, 0.5215687, 1,
1.418022, 0.08576496, 0.8649032, 1, 0, 0.5176471, 1,
1.435591, -0.5953822, 1.155774, 1, 0, 0.509804, 1,
1.436567, -1.148825, 1.879424, 1, 0, 0.5058824, 1,
1.444561, -0.7602292, 1.015185, 1, 0, 0.4980392, 1,
1.448018, 0.4337043, 0.9283377, 1, 0, 0.4901961, 1,
1.457179, 0.2489768, -0.09271237, 1, 0, 0.4862745, 1,
1.45945, 0.610477, 0.06731337, 1, 0, 0.4784314, 1,
1.465668, 0.07713132, 3.599944, 1, 0, 0.4745098, 1,
1.466756, -0.5825932, 1.260476, 1, 0, 0.4666667, 1,
1.475629, 0.3197965, 0.1097481, 1, 0, 0.4627451, 1,
1.479675, 2.114808, -0.5029168, 1, 0, 0.454902, 1,
1.505444, 1.670474, 0.8525094, 1, 0, 0.4509804, 1,
1.508093, 0.5112989, 1.76563, 1, 0, 0.4431373, 1,
1.51112, 0.4051234, 1.085536, 1, 0, 0.4392157, 1,
1.511337, -0.7609953, 2.264585, 1, 0, 0.4313726, 1,
1.519589, 0.08630934, 1.416062, 1, 0, 0.427451, 1,
1.522227, 1.486615, -0.3491508, 1, 0, 0.4196078, 1,
1.523811, -0.861619, 1.232709, 1, 0, 0.4156863, 1,
1.527453, -0.03933488, 1.439937, 1, 0, 0.4078431, 1,
1.536213, 0.6602417, 2.027853, 1, 0, 0.4039216, 1,
1.539889, 0.1175442, 2.556995, 1, 0, 0.3960784, 1,
1.544999, -0.8464741, 1.747436, 1, 0, 0.3882353, 1,
1.551537, 0.9262562, 1.934479, 1, 0, 0.3843137, 1,
1.558773, 0.9990596, 1.714991, 1, 0, 0.3764706, 1,
1.560953, 0.6204416, 1.991545, 1, 0, 0.372549, 1,
1.609427, 0.849282, -0.08158304, 1, 0, 0.3647059, 1,
1.617777, 1.77386, 0.7064568, 1, 0, 0.3607843, 1,
1.620241, 0.04477391, 0.0473638, 1, 0, 0.3529412, 1,
1.627724, -1.134705, 2.622166, 1, 0, 0.3490196, 1,
1.638652, 0.6243067, -0.03363999, 1, 0, 0.3411765, 1,
1.661359, 1.856109, 2.645298, 1, 0, 0.3372549, 1,
1.666443, 0.7610319, 1.636599, 1, 0, 0.3294118, 1,
1.669634, -0.3705349, 2.063238, 1, 0, 0.3254902, 1,
1.693841, 0.8529058, 1.358587, 1, 0, 0.3176471, 1,
1.71955, -1.272475, 2.222734, 1, 0, 0.3137255, 1,
1.723415, 0.2919443, 1.493259, 1, 0, 0.3058824, 1,
1.724303, 0.9582217, 2.121653, 1, 0, 0.2980392, 1,
1.73331, -0.6568373, 1.042239, 1, 0, 0.2941177, 1,
1.734603, 0.292087, 2.195334, 1, 0, 0.2862745, 1,
1.739607, -1.151222, 1.500962, 1, 0, 0.282353, 1,
1.740658, 1.020235, 1.513755, 1, 0, 0.2745098, 1,
1.758461, 1.970332, 0.9676864, 1, 0, 0.2705882, 1,
1.776044, -1.073784, 3.174926, 1, 0, 0.2627451, 1,
1.779507, -0.162624, 2.559716, 1, 0, 0.2588235, 1,
1.787297, 1.197022, 1.31738, 1, 0, 0.2509804, 1,
1.78868, -0.6455432, 1.392777, 1, 0, 0.2470588, 1,
1.792707, 0.4279709, 1.466347, 1, 0, 0.2392157, 1,
1.79452, -0.3006977, 2.363668, 1, 0, 0.2352941, 1,
1.805582, 2.021221, -0.4272471, 1, 0, 0.227451, 1,
1.807994, -2.03031, 1.468116, 1, 0, 0.2235294, 1,
1.820272, 0.08752527, 0.1303356, 1, 0, 0.2156863, 1,
1.823489, 0.1685645, -0.3739175, 1, 0, 0.2117647, 1,
1.824253, -0.8819745, 0.4526474, 1, 0, 0.2039216, 1,
1.833064, 0.3203648, 2.05984, 1, 0, 0.1960784, 1,
1.878679, 0.9475533, 1.139846, 1, 0, 0.1921569, 1,
1.882439, 0.006874732, 3.061288, 1, 0, 0.1843137, 1,
1.892491, 1.79791, 0.572744, 1, 0, 0.1803922, 1,
1.944732, 0.09633416, 1.136147, 1, 0, 0.172549, 1,
2.009978, -0.02268037, 0.06949375, 1, 0, 0.1686275, 1,
2.018281, 0.1193132, 3.426679, 1, 0, 0.1607843, 1,
2.025108, -0.8402178, 2.27061, 1, 0, 0.1568628, 1,
2.039438, 0.6199967, 0.8584703, 1, 0, 0.1490196, 1,
2.081488, -2.728981, 2.629191, 1, 0, 0.145098, 1,
2.090073, -0.9202878, 3.574788, 1, 0, 0.1372549, 1,
2.112342, -0.2412291, 2.803018, 1, 0, 0.1333333, 1,
2.127019, 0.5599543, 1.990948, 1, 0, 0.1254902, 1,
2.12736, -2.063056, 1.623408, 1, 0, 0.1215686, 1,
2.152797, 0.920087, 1.674046, 1, 0, 0.1137255, 1,
2.164591, 1.030513, -0.6189527, 1, 0, 0.1098039, 1,
2.170876, -0.25641, 2.318078, 1, 0, 0.1019608, 1,
2.217806, -0.8486649, 1.702305, 1, 0, 0.09411765, 1,
2.238458, -0.284555, 1.724629, 1, 0, 0.09019608, 1,
2.270194, -1.756414, 2.881022, 1, 0, 0.08235294, 1,
2.280045, -0.9128551, 1.894045, 1, 0, 0.07843138, 1,
2.427831, 0.7003418, 3.010139, 1, 0, 0.07058824, 1,
2.428476, -0.4854601, 1.134945, 1, 0, 0.06666667, 1,
2.446219, -0.696063, 1.61437, 1, 0, 0.05882353, 1,
2.503295, -2.096939, 2.585809, 1, 0, 0.05490196, 1,
2.526839, 1.209956, 3.548655, 1, 0, 0.04705882, 1,
2.535109, -1.096072, 2.853283, 1, 0, 0.04313726, 1,
2.68308, -1.503622, 1.68568, 1, 0, 0.03529412, 1,
2.707395, -1.689517, 2.578752, 1, 0, 0.03137255, 1,
2.75253, 0.2619266, -0.1093412, 1, 0, 0.02352941, 1,
2.753235, 0.2330535, 2.508001, 1, 0, 0.01960784, 1,
3.149472, -1.644959, 2.661495, 1, 0, 0.01176471, 1,
3.34825, -0.1027573, 1.606956, 1, 0, 0.007843138, 1
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
0.269502, -5.206929, -6.37719, 0, -0.5, 0.5, 0.5,
0.269502, -5.206929, -6.37719, 1, -0.5, 0.5, 0.5,
0.269502, -5.206929, -6.37719, 1, 1.5, 0.5, 0.5,
0.269502, -5.206929, -6.37719, 0, 1.5, 0.5, 0.5
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
-3.852942, -0.4597274, -6.37719, 0, -0.5, 0.5, 0.5,
-3.852942, -0.4597274, -6.37719, 1, -0.5, 0.5, 0.5,
-3.852942, -0.4597274, -6.37719, 1, 1.5, 0.5, 0.5,
-3.852942, -0.4597274, -6.37719, 0, 1.5, 0.5, 0.5
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
-3.852942, -5.206929, 0.02424693, 0, -0.5, 0.5, 0.5,
-3.852942, -5.206929, 0.02424693, 1, -0.5, 0.5, 0.5,
-3.852942, -5.206929, 0.02424693, 1, 1.5, 0.5, 0.5,
-3.852942, -5.206929, 0.02424693, 0, 1.5, 0.5, 0.5
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
-2, -4.111421, -4.899935,
3, -4.111421, -4.899935,
-2, -4.111421, -4.899935,
-2, -4.294006, -5.146144,
-1, -4.111421, -4.899935,
-1, -4.294006, -5.146144,
0, -4.111421, -4.899935,
0, -4.294006, -5.146144,
1, -4.111421, -4.899935,
1, -4.294006, -5.146144,
2, -4.111421, -4.899935,
2, -4.294006, -5.146144,
3, -4.111421, -4.899935,
3, -4.294006, -5.146144
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
-2, -4.659175, -5.638563, 0, -0.5, 0.5, 0.5,
-2, -4.659175, -5.638563, 1, -0.5, 0.5, 0.5,
-2, -4.659175, -5.638563, 1, 1.5, 0.5, 0.5,
-2, -4.659175, -5.638563, 0, 1.5, 0.5, 0.5,
-1, -4.659175, -5.638563, 0, -0.5, 0.5, 0.5,
-1, -4.659175, -5.638563, 1, -0.5, 0.5, 0.5,
-1, -4.659175, -5.638563, 1, 1.5, 0.5, 0.5,
-1, -4.659175, -5.638563, 0, 1.5, 0.5, 0.5,
0, -4.659175, -5.638563, 0, -0.5, 0.5, 0.5,
0, -4.659175, -5.638563, 1, -0.5, 0.5, 0.5,
0, -4.659175, -5.638563, 1, 1.5, 0.5, 0.5,
0, -4.659175, -5.638563, 0, 1.5, 0.5, 0.5,
1, -4.659175, -5.638563, 0, -0.5, 0.5, 0.5,
1, -4.659175, -5.638563, 1, -0.5, 0.5, 0.5,
1, -4.659175, -5.638563, 1, 1.5, 0.5, 0.5,
1, -4.659175, -5.638563, 0, 1.5, 0.5, 0.5,
2, -4.659175, -5.638563, 0, -0.5, 0.5, 0.5,
2, -4.659175, -5.638563, 1, -0.5, 0.5, 0.5,
2, -4.659175, -5.638563, 1, 1.5, 0.5, 0.5,
2, -4.659175, -5.638563, 0, 1.5, 0.5, 0.5,
3, -4.659175, -5.638563, 0, -0.5, 0.5, 0.5,
3, -4.659175, -5.638563, 1, -0.5, 0.5, 0.5,
3, -4.659175, -5.638563, 1, 1.5, 0.5, 0.5,
3, -4.659175, -5.638563, 0, 1.5, 0.5, 0.5
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
-2.901608, -4, -4.899935,
-2.901608, 2, -4.899935,
-2.901608, -4, -4.899935,
-3.060164, -4, -5.146144,
-2.901608, -2, -4.899935,
-3.060164, -2, -5.146144,
-2.901608, 0, -4.899935,
-3.060164, 0, -5.146144,
-2.901608, 2, -4.899935,
-3.060164, 2, -5.146144
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
"-4",
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
-3.377275, -4, -5.638563, 0, -0.5, 0.5, 0.5,
-3.377275, -4, -5.638563, 1, -0.5, 0.5, 0.5,
-3.377275, -4, -5.638563, 1, 1.5, 0.5, 0.5,
-3.377275, -4, -5.638563, 0, 1.5, 0.5, 0.5,
-3.377275, -2, -5.638563, 0, -0.5, 0.5, 0.5,
-3.377275, -2, -5.638563, 1, -0.5, 0.5, 0.5,
-3.377275, -2, -5.638563, 1, 1.5, 0.5, 0.5,
-3.377275, -2, -5.638563, 0, 1.5, 0.5, 0.5,
-3.377275, 0, -5.638563, 0, -0.5, 0.5, 0.5,
-3.377275, 0, -5.638563, 1, -0.5, 0.5, 0.5,
-3.377275, 0, -5.638563, 1, 1.5, 0.5, 0.5,
-3.377275, 0, -5.638563, 0, 1.5, 0.5, 0.5,
-3.377275, 2, -5.638563, 0, -0.5, 0.5, 0.5,
-3.377275, 2, -5.638563, 1, -0.5, 0.5, 0.5,
-3.377275, 2, -5.638563, 1, 1.5, 0.5, 0.5,
-3.377275, 2, -5.638563, 0, 1.5, 0.5, 0.5
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
-2.901608, -4.111421, -4,
-2.901608, -4.111421, 4,
-2.901608, -4.111421, -4,
-3.060164, -4.294006, -4,
-2.901608, -4.111421, -2,
-3.060164, -4.294006, -2,
-2.901608, -4.111421, 0,
-3.060164, -4.294006, 0,
-2.901608, -4.111421, 2,
-3.060164, -4.294006, 2,
-2.901608, -4.111421, 4,
-3.060164, -4.294006, 4
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
-3.377275, -4.659175, -4, 0, -0.5, 0.5, 0.5,
-3.377275, -4.659175, -4, 1, -0.5, 0.5, 0.5,
-3.377275, -4.659175, -4, 1, 1.5, 0.5, 0.5,
-3.377275, -4.659175, -4, 0, 1.5, 0.5, 0.5,
-3.377275, -4.659175, -2, 0, -0.5, 0.5, 0.5,
-3.377275, -4.659175, -2, 1, -0.5, 0.5, 0.5,
-3.377275, -4.659175, -2, 1, 1.5, 0.5, 0.5,
-3.377275, -4.659175, -2, 0, 1.5, 0.5, 0.5,
-3.377275, -4.659175, 0, 0, -0.5, 0.5, 0.5,
-3.377275, -4.659175, 0, 1, -0.5, 0.5, 0.5,
-3.377275, -4.659175, 0, 1, 1.5, 0.5, 0.5,
-3.377275, -4.659175, 0, 0, 1.5, 0.5, 0.5,
-3.377275, -4.659175, 2, 0, -0.5, 0.5, 0.5,
-3.377275, -4.659175, 2, 1, -0.5, 0.5, 0.5,
-3.377275, -4.659175, 2, 1, 1.5, 0.5, 0.5,
-3.377275, -4.659175, 2, 0, 1.5, 0.5, 0.5,
-3.377275, -4.659175, 4, 0, -0.5, 0.5, 0.5,
-3.377275, -4.659175, 4, 1, -0.5, 0.5, 0.5,
-3.377275, -4.659175, 4, 1, 1.5, 0.5, 0.5,
-3.377275, -4.659175, 4, 0, 1.5, 0.5, 0.5
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
-2.901608, -4.111421, -4.899935,
-2.901608, 3.191966, -4.899935,
-2.901608, -4.111421, 4.948429,
-2.901608, 3.191966, 4.948429,
-2.901608, -4.111421, -4.899935,
-2.901608, -4.111421, 4.948429,
-2.901608, 3.191966, -4.899935,
-2.901608, 3.191966, 4.948429,
-2.901608, -4.111421, -4.899935,
3.440613, -4.111421, -4.899935,
-2.901608, -4.111421, 4.948429,
3.440613, -4.111421, 4.948429,
-2.901608, 3.191966, -4.899935,
3.440613, 3.191966, -4.899935,
-2.901608, 3.191966, 4.948429,
3.440613, 3.191966, 4.948429,
3.440613, -4.111421, -4.899935,
3.440613, 3.191966, -4.899935,
3.440613, -4.111421, 4.948429,
3.440613, 3.191966, 4.948429,
3.440613, -4.111421, -4.899935,
3.440613, -4.111421, 4.948429,
3.440613, 3.191966, -4.899935,
3.440613, 3.191966, 4.948429
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
var radius = 7.371128;
var distance = 32.79498;
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
mvMatrix.translate( -0.269502, 0.4597274, -0.02424693 );
mvMatrix.scale( 1.256627, 1.091248, 0.8092519 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.79498);
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
methyl_ester<-read.table("methyl_ester.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyl_ester$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
```

```r
y<-methyl_ester$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
```

```r
z<-methyl_ester$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_ester' not found
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
-2.809246, -0.145244, 0.3838317, 0, 0, 1, 1, 1,
-2.598122, -1.483631, -0.7457972, 1, 0, 0, 1, 1,
-2.592769, 0.5702841, -0.8635696, 1, 0, 0, 1, 1,
-2.458794, -0.5512933, -2.812213, 1, 0, 0, 1, 1,
-2.442523, -1.501535, -1.845766, 1, 0, 0, 1, 1,
-2.394921, -0.270862, -1.544472, 1, 0, 0, 1, 1,
-2.351981, 0.8518149, 0.05964959, 0, 0, 0, 1, 1,
-2.337865, 0.1265897, -2.330349, 0, 0, 0, 1, 1,
-2.310058, -0.0382168, 0.2879112, 0, 0, 0, 1, 1,
-2.252499, 1.094775, -0.6118001, 0, 0, 0, 1, 1,
-2.219525, 0.2848092, -0.7618934, 0, 0, 0, 1, 1,
-2.216581, 0.250498, -1.622829, 0, 0, 0, 1, 1,
-2.172464, 1.451116, -2.827211, 0, 0, 0, 1, 1,
-2.166469, 0.654241, -1.853909, 1, 1, 1, 1, 1,
-2.165817, -1.277197, -2.672899, 1, 1, 1, 1, 1,
-2.147752, -1.194237, -2.607489, 1, 1, 1, 1, 1,
-2.144485, -0.6711064, -1.825635, 1, 1, 1, 1, 1,
-2.111971, 0.4076959, -0.7773826, 1, 1, 1, 1, 1,
-2.075339, -0.8388163, -0.2593295, 1, 1, 1, 1, 1,
-2.073192, 1.024849, -1.240557, 1, 1, 1, 1, 1,
-2.048464, -2.91875, -2.724606, 1, 1, 1, 1, 1,
-2.045742, 1.050608, -1.104864, 1, 1, 1, 1, 1,
-2.020983, -0.8363124, -2.143598, 1, 1, 1, 1, 1,
-2.013232, 0.8531449, -1.938007, 1, 1, 1, 1, 1,
-1.999942, 0.1522895, -2.945562, 1, 1, 1, 1, 1,
-1.986035, 1.365794, -2.118885, 1, 1, 1, 1, 1,
-1.881061, 0.105297, -1.150875, 1, 1, 1, 1, 1,
-1.864896, 0.7689068, -1.668268, 1, 1, 1, 1, 1,
-1.839793, -0.1415444, -1.190535, 0, 0, 1, 1, 1,
-1.836602, -0.2001317, -1.043633, 1, 0, 0, 1, 1,
-1.834887, 0.06463649, -1.078026, 1, 0, 0, 1, 1,
-1.818326, 2.413138, -0.5781635, 1, 0, 0, 1, 1,
-1.81198, 0.9091153, -3.720746, 1, 0, 0, 1, 1,
-1.811004, 0.8183745, -0.7106907, 1, 0, 0, 1, 1,
-1.806941, 1.94986, -0.5681978, 0, 0, 0, 1, 1,
-1.793933, -0.9399384, -0.7068076, 0, 0, 0, 1, 1,
-1.778881, 0.7896225, -0.306996, 0, 0, 0, 1, 1,
-1.756495, -0.9481515, -2.106962, 0, 0, 0, 1, 1,
-1.75367, -2.605432, -4.756513, 0, 0, 0, 1, 1,
-1.748405, -0.1626035, -3.207721, 0, 0, 0, 1, 1,
-1.738255, -0.635599, -2.156458, 0, 0, 0, 1, 1,
-1.728953, 1.242802, -1.491117, 1, 1, 1, 1, 1,
-1.727782, 0.3324535, -0.007348564, 1, 1, 1, 1, 1,
-1.715084, -0.2505842, -1.350646, 1, 1, 1, 1, 1,
-1.706336, -1.49204, -1.797864, 1, 1, 1, 1, 1,
-1.691815, -0.4491999, -3.208026, 1, 1, 1, 1, 1,
-1.686256, 1.911871, -1.009842, 1, 1, 1, 1, 1,
-1.684338, 1.882221, -1.067385, 1, 1, 1, 1, 1,
-1.681939, 2.097877, 0.1806871, 1, 1, 1, 1, 1,
-1.673971, -0.7560501, -3.057185, 1, 1, 1, 1, 1,
-1.673066, -1.59655, -2.169877, 1, 1, 1, 1, 1,
-1.672676, 1.489854, -0.5350444, 1, 1, 1, 1, 1,
-1.666995, -0.5495173, -1.900874, 1, 1, 1, 1, 1,
-1.665542, -1.00347, -1.560797, 1, 1, 1, 1, 1,
-1.658783, 0.579245, -2.356088, 1, 1, 1, 1, 1,
-1.657984, -0.4325979, -2.621171, 1, 1, 1, 1, 1,
-1.642238, -1.370799, 0.1177394, 0, 0, 1, 1, 1,
-1.640033, 0.1216043, -0.5177247, 1, 0, 0, 1, 1,
-1.637999, 0.4615614, -1.47506, 1, 0, 0, 1, 1,
-1.632843, -0.5821352, -2.109738, 1, 0, 0, 1, 1,
-1.629584, 1.230148, 1.036417, 1, 0, 0, 1, 1,
-1.625714, 0.5401372, -1.050208, 1, 0, 0, 1, 1,
-1.615688, -0.006139457, -2.917872, 0, 0, 0, 1, 1,
-1.599617, -1.901806, -0.7809362, 0, 0, 0, 1, 1,
-1.594377, -0.7000899, -0.5122196, 0, 0, 0, 1, 1,
-1.585747, 0.4653606, -1.364832, 0, 0, 0, 1, 1,
-1.582372, 0.7387727, -0.9191559, 0, 0, 0, 1, 1,
-1.569499, 0.6722988, 0.01646579, 0, 0, 0, 1, 1,
-1.567209, 0.1022807, -0.8455181, 0, 0, 0, 1, 1,
-1.552425, -0.2612403, -1.652426, 1, 1, 1, 1, 1,
-1.55081, 0.05868158, -1.432629, 1, 1, 1, 1, 1,
-1.548134, 0.04590087, -0.9228907, 1, 1, 1, 1, 1,
-1.545152, 0.164395, 0.5247863, 1, 1, 1, 1, 1,
-1.541662, 0.3465192, -1.55611, 1, 1, 1, 1, 1,
-1.533408, 0.4127007, -3.210141, 1, 1, 1, 1, 1,
-1.522674, 0.9143503, -3.173492, 1, 1, 1, 1, 1,
-1.518472, -0.04974442, -3.148772, 1, 1, 1, 1, 1,
-1.506911, -1.608541, -2.528686, 1, 1, 1, 1, 1,
-1.505144, -1.611346, -2.28476, 1, 1, 1, 1, 1,
-1.50123, -2.092211, -3.91078, 1, 1, 1, 1, 1,
-1.489584, -0.3090382, -2.246186, 1, 1, 1, 1, 1,
-1.483785, 1.054396, -2.046195, 1, 1, 1, 1, 1,
-1.478096, 0.8699155, -2.465608, 1, 1, 1, 1, 1,
-1.475153, 0.5251741, -2.424986, 1, 1, 1, 1, 1,
-1.471054, 0.1657906, -3.322567, 0, 0, 1, 1, 1,
-1.453888, -2.693216, -0.4223341, 1, 0, 0, 1, 1,
-1.431314, 0.809693, -0.9541358, 1, 0, 0, 1, 1,
-1.397731, -0.7918996, -1.329503, 1, 0, 0, 1, 1,
-1.392565, -0.004172509, -1.559305, 1, 0, 0, 1, 1,
-1.390981, -0.2445874, -2.323484, 1, 0, 0, 1, 1,
-1.389822, 0.6305518, -1.681141, 0, 0, 0, 1, 1,
-1.383203, -0.2767045, -2.735105, 0, 0, 0, 1, 1,
-1.378957, 0.8519195, -1.172578, 0, 0, 0, 1, 1,
-1.377937, 0.2411097, -2.863119, 0, 0, 0, 1, 1,
-1.371319, 0.5174681, -1.656507, 0, 0, 0, 1, 1,
-1.360528, 0.4485446, -2.114164, 0, 0, 0, 1, 1,
-1.353931, -1.456777, -3.107487, 0, 0, 0, 1, 1,
-1.347044, -0.2741215, -2.87639, 1, 1, 1, 1, 1,
-1.342914, -3.52576, -3.55642, 1, 1, 1, 1, 1,
-1.32819, 1.327692, -0.5770819, 1, 1, 1, 1, 1,
-1.327874, -1.642475, -2.86948, 1, 1, 1, 1, 1,
-1.324268, -0.6213595, -1.618528, 1, 1, 1, 1, 1,
-1.321921, 0.1412926, -1.455141, 1, 1, 1, 1, 1,
-1.318816, -1.719781, -3.214826, 1, 1, 1, 1, 1,
-1.303041, -1.683493, -1.951172, 1, 1, 1, 1, 1,
-1.300227, 1.581068, -1.103146, 1, 1, 1, 1, 1,
-1.295056, 1.451315, 0.3512661, 1, 1, 1, 1, 1,
-1.291584, 0.7808916, 0.8896984, 1, 1, 1, 1, 1,
-1.265865, -0.2222223, -2.647909, 1, 1, 1, 1, 1,
-1.263188, 0.4237815, -2.287053, 1, 1, 1, 1, 1,
-1.261163, 0.4382029, -1.329298, 1, 1, 1, 1, 1,
-1.248258, 0.4559775, -0.2114992, 1, 1, 1, 1, 1,
-1.245786, 0.4213171, -0.8674874, 0, 0, 1, 1, 1,
-1.240988, 1.7066, -0.7936041, 1, 0, 0, 1, 1,
-1.240796, 0.5259475, -1.055169, 1, 0, 0, 1, 1,
-1.227768, 1.058827, -0.8912669, 1, 0, 0, 1, 1,
-1.22104, 0.5106361, -0.9992446, 1, 0, 0, 1, 1,
-1.208649, 0.1179656, -0.9237414, 1, 0, 0, 1, 1,
-1.204616, 0.4956048, 0.3375855, 0, 0, 0, 1, 1,
-1.203245, 0.8968173, -0.6116335, 0, 0, 0, 1, 1,
-1.203184, -0.9854165, -1.225922, 0, 0, 0, 1, 1,
-1.196273, 0.1216741, 0.1068366, 0, 0, 0, 1, 1,
-1.185597, 0.87642, 0.3585522, 0, 0, 0, 1, 1,
-1.179765, 0.5635592, -2.36308, 0, 0, 0, 1, 1,
-1.177667, -0.5583443, -0.7235255, 0, 0, 0, 1, 1,
-1.177464, -0.3989238, -2.971495, 1, 1, 1, 1, 1,
-1.172903, -0.2562605, -1.523935, 1, 1, 1, 1, 1,
-1.161798, -0.4140797, -1.402752, 1, 1, 1, 1, 1,
-1.153892, -0.6324151, -1.858939, 1, 1, 1, 1, 1,
-1.15119, -2.693724, -2.347232, 1, 1, 1, 1, 1,
-1.146886, -0.598124, -0.676772, 1, 1, 1, 1, 1,
-1.137554, 2.98866, -0.9120595, 1, 1, 1, 1, 1,
-1.124768, 0.6038162, -1.971299, 1, 1, 1, 1, 1,
-1.116014, -0.5335541, -2.867105, 1, 1, 1, 1, 1,
-1.111749, 0.4349167, -1.341543, 1, 1, 1, 1, 1,
-1.09848, -0.5107837, -0.974251, 1, 1, 1, 1, 1,
-1.095253, 0.2512389, -2.844576, 1, 1, 1, 1, 1,
-1.090129, 0.9079546, 0.01736487, 1, 1, 1, 1, 1,
-1.08944, -0.2167515, -3.57585, 1, 1, 1, 1, 1,
-1.08931, -0.6918142, -0.4264508, 1, 1, 1, 1, 1,
-1.088577, -1.321936, -1.326742, 0, 0, 1, 1, 1,
-1.086692, -0.07607756, -2.51749, 1, 0, 0, 1, 1,
-1.06701, 0.623375, -1.42018, 1, 0, 0, 1, 1,
-1.066465, 2.70427, -0.2962141, 1, 0, 0, 1, 1,
-1.054634, -0.28322, -2.181249, 1, 0, 0, 1, 1,
-1.053936, -2.425193, -3.242559, 1, 0, 0, 1, 1,
-1.05128, -1.06391, -2.320201, 0, 0, 0, 1, 1,
-1.051205, 0.05038119, 0.5202591, 0, 0, 0, 1, 1,
-1.040487, -0.01397436, -0.8904708, 0, 0, 0, 1, 1,
-1.035569, -1.739275, -3.971211, 0, 0, 0, 1, 1,
-1.035389, 0.03062102, -0.1745506, 0, 0, 0, 1, 1,
-1.026763, 0.1185945, -1.939003, 0, 0, 0, 1, 1,
-1.023895, 0.1937725, -2.69223, 0, 0, 0, 1, 1,
-1.020623, -0.3955092, -1.434243, 1, 1, 1, 1, 1,
-1.012324, 0.0990378, -1.290486, 1, 1, 1, 1, 1,
-1.011903, -1.265885, -2.751933, 1, 1, 1, 1, 1,
-1.002489, 0.8778089, 0.0394097, 1, 1, 1, 1, 1,
-0.990169, -0.7192081, -4.627741, 1, 1, 1, 1, 1,
-0.9863166, -0.7739482, -2.149471, 1, 1, 1, 1, 1,
-0.9818869, 0.08078206, -1.397078, 1, 1, 1, 1, 1,
-0.9796293, 0.8617458, 0.03946308, 1, 1, 1, 1, 1,
-0.9763388, -1.509531, -0.7068767, 1, 1, 1, 1, 1,
-0.9748487, -0.6372657, -1.23974, 1, 1, 1, 1, 1,
-0.9726163, 0.5482536, -2.345072, 1, 1, 1, 1, 1,
-0.9674689, -0.4634658, -3.108415, 1, 1, 1, 1, 1,
-0.9669219, 0.09299574, -0.4795893, 1, 1, 1, 1, 1,
-0.9627459, 1.97345, 0.5000083, 1, 1, 1, 1, 1,
-0.9585174, -0.3226396, -0.5742093, 1, 1, 1, 1, 1,
-0.9542716, -1.411728, -1.316656, 0, 0, 1, 1, 1,
-0.9533494, -1.786297, -2.467384, 1, 0, 0, 1, 1,
-0.9339203, 0.9298972, -2.493053, 1, 0, 0, 1, 1,
-0.9333754, 0.01949678, 0.07311159, 1, 0, 0, 1, 1,
-0.9320515, 1.117312, -0.6469359, 1, 0, 0, 1, 1,
-0.9313218, 0.07517599, -1.826935, 1, 0, 0, 1, 1,
-0.930101, -3.529136, -4.206024, 0, 0, 0, 1, 1,
-0.928687, -0.09735196, -0.6110891, 0, 0, 0, 1, 1,
-0.9282138, 1.331915, -1.749442, 0, 0, 0, 1, 1,
-0.9268419, 1.313368, -0.606576, 0, 0, 0, 1, 1,
-0.9204959, 1.534635, -0.698221, 0, 0, 0, 1, 1,
-0.9192974, -1.372474, -2.999022, 0, 0, 0, 1, 1,
-0.919026, 0.4686145, -1.137104, 0, 0, 0, 1, 1,
-0.9160351, 1.102006, 0.2727556, 1, 1, 1, 1, 1,
-0.9113758, -0.0185221, -0.5666235, 1, 1, 1, 1, 1,
-0.9087003, -0.2584125, -0.08565067, 1, 1, 1, 1, 1,
-0.9082536, -1.06545, -1.551529, 1, 1, 1, 1, 1,
-0.9020156, 0.7876644, -2.345179, 1, 1, 1, 1, 1,
-0.8994852, -0.9430549, -0.8981149, 1, 1, 1, 1, 1,
-0.8970454, 0.6955929, 1.685659, 1, 1, 1, 1, 1,
-0.8964829, 0.2467151, -0.7288262, 1, 1, 1, 1, 1,
-0.8954928, 0.1029876, -0.06990442, 1, 1, 1, 1, 1,
-0.8942897, -1.356061, -3.824073, 1, 1, 1, 1, 1,
-0.8898427, 0.7294712, -2.418058, 1, 1, 1, 1, 1,
-0.8872389, 2.366393, 0.4495906, 1, 1, 1, 1, 1,
-0.8806472, -1.062731, -2.079056, 1, 1, 1, 1, 1,
-0.8801839, 2.018739, -0.6224985, 1, 1, 1, 1, 1,
-0.8761871, 0.6671305, -1.967874, 1, 1, 1, 1, 1,
-0.8747202, 1.659356, 0.5573257, 0, 0, 1, 1, 1,
-0.8739464, -0.7095784, -3.200677, 1, 0, 0, 1, 1,
-0.8736052, 0.4722313, -1.44962, 1, 0, 0, 1, 1,
-0.8724424, -0.3894967, -1.290506, 1, 0, 0, 1, 1,
-0.8723485, 0.2219765, -0.6561731, 1, 0, 0, 1, 1,
-0.8640832, -0.9457677, -3.047354, 1, 0, 0, 1, 1,
-0.8616777, 0.7612922, 0.07438736, 0, 0, 0, 1, 1,
-0.8583874, -0.5033511, -2.438059, 0, 0, 0, 1, 1,
-0.8566644, 0.5283115, -0.482128, 0, 0, 0, 1, 1,
-0.8530312, -0.4346794, -3.35158, 0, 0, 0, 1, 1,
-0.8527879, 1.382209, 1.102389, 0, 0, 0, 1, 1,
-0.8453435, -0.8577168, -4.341308, 0, 0, 0, 1, 1,
-0.8441944, -0.7976246, -2.733676, 0, 0, 0, 1, 1,
-0.8441497, -0.3378284, -2.085442, 1, 1, 1, 1, 1,
-0.8439658, -0.5391793, -1.992042, 1, 1, 1, 1, 1,
-0.8428257, -0.7133175, -3.664009, 1, 1, 1, 1, 1,
-0.8404962, 0.4029855, -1.162711, 1, 1, 1, 1, 1,
-0.8389803, 0.8864261, -2.200146, 1, 1, 1, 1, 1,
-0.8382722, 0.2863988, -3.48901, 1, 1, 1, 1, 1,
-0.8311268, -0.9267036, -1.398236, 1, 1, 1, 1, 1,
-0.8310183, -1.421916, -1.660066, 1, 1, 1, 1, 1,
-0.8270998, -0.6764517, -0.3694353, 1, 1, 1, 1, 1,
-0.8238609, -1.20937, -0.880552, 1, 1, 1, 1, 1,
-0.8210546, -1.156079, -1.969243, 1, 1, 1, 1, 1,
-0.8155665, 2.651543, 0.3578275, 1, 1, 1, 1, 1,
-0.812585, 0.2941427, -0.6892188, 1, 1, 1, 1, 1,
-0.8085374, -0.3963982, -1.337419, 1, 1, 1, 1, 1,
-0.8079922, 0.1698101, -1.303323, 1, 1, 1, 1, 1,
-0.8063452, 1.019063, 0.4662617, 0, 0, 1, 1, 1,
-0.8003839, -0.3698421, -2.624975, 1, 0, 0, 1, 1,
-0.8000323, 1.828885, 0.7696385, 1, 0, 0, 1, 1,
-0.7955043, -0.2251362, -1.758739, 1, 0, 0, 1, 1,
-0.7935724, -2.071199, -3.503564, 1, 0, 0, 1, 1,
-0.7923631, 1.014038, -2.026694, 1, 0, 0, 1, 1,
-0.791759, -0.972138, -2.552212, 0, 0, 0, 1, 1,
-0.7906352, -0.1416174, -3.591898, 0, 0, 0, 1, 1,
-0.7861071, 0.08700843, -2.163321, 0, 0, 0, 1, 1,
-0.78583, -1.019728, -3.140388, 0, 0, 0, 1, 1,
-0.7849528, -0.7764388, -3.300881, 0, 0, 0, 1, 1,
-0.7839261, -0.4681199, -0.3259445, 0, 0, 0, 1, 1,
-0.7704176, -0.2136208, -2.154144, 0, 0, 0, 1, 1,
-0.7670118, 0.1439405, -1.792177, 1, 1, 1, 1, 1,
-0.7664192, -1.223814, -2.359223, 1, 1, 1, 1, 1,
-0.7637933, -0.07426273, -0.9935374, 1, 1, 1, 1, 1,
-0.7565546, -0.5966883, -3.03447, 1, 1, 1, 1, 1,
-0.7518611, 0.5205927, 0.2655756, 1, 1, 1, 1, 1,
-0.7518532, 0.8523803, -1.637582, 1, 1, 1, 1, 1,
-0.7517574, -0.5177953, -2.373045, 1, 1, 1, 1, 1,
-0.7514754, 0.5125493, -1.202679, 1, 1, 1, 1, 1,
-0.7509181, -0.5496915, -1.317498, 1, 1, 1, 1, 1,
-0.7490984, -0.3393959, -2.164889, 1, 1, 1, 1, 1,
-0.7479522, -0.1169096, -0.7847835, 1, 1, 1, 1, 1,
-0.7466382, 0.3426355, -1.210104, 1, 1, 1, 1, 1,
-0.7442583, 0.7991998, -2.554695, 1, 1, 1, 1, 1,
-0.742386, 0.8515871, -1.094043, 1, 1, 1, 1, 1,
-0.7314757, 0.5500682, -0.9664399, 1, 1, 1, 1, 1,
-0.7271184, 0.09487861, -1.874251, 0, 0, 1, 1, 1,
-0.7122237, -0.3790831, -0.7366136, 1, 0, 0, 1, 1,
-0.7110651, 0.8196501, 0.5393413, 1, 0, 0, 1, 1,
-0.7088008, 0.3275183, -2.607232, 1, 0, 0, 1, 1,
-0.7087017, 1.175148, -1.251477, 1, 0, 0, 1, 1,
-0.699726, -0.07897228, 0.085562, 1, 0, 0, 1, 1,
-0.6986079, -1.248079, -4.649585, 0, 0, 0, 1, 1,
-0.6968951, 0.3288288, -2.835897, 0, 0, 0, 1, 1,
-0.6957051, 0.3448746, -0.6903779, 0, 0, 0, 1, 1,
-0.6855969, -1.184839, -1.309479, 0, 0, 0, 1, 1,
-0.6828144, -1.830061, -4.354398, 0, 0, 0, 1, 1,
-0.6811811, 2.352212, -3.061336, 0, 0, 0, 1, 1,
-0.674562, -0.5029014, -1.137266, 0, 0, 0, 1, 1,
-0.6690632, -0.8048057, -2.346193, 1, 1, 1, 1, 1,
-0.6624551, -1.366442, -3.613981, 1, 1, 1, 1, 1,
-0.6615527, 0.4203905, -0.8838965, 1, 1, 1, 1, 1,
-0.6558331, 0.005208686, -3.59485, 1, 1, 1, 1, 1,
-0.6529551, -1.329107, -1.422663, 1, 1, 1, 1, 1,
-0.6529448, 1.573833, 0.9980624, 1, 1, 1, 1, 1,
-0.6395437, -0.9785913, -2.2504, 1, 1, 1, 1, 1,
-0.6389351, 0.9652035, 0.2110769, 1, 1, 1, 1, 1,
-0.6373597, -0.8379689, -2.538047, 1, 1, 1, 1, 1,
-0.6371791, -0.1148508, -2.405855, 1, 1, 1, 1, 1,
-0.6352848, -0.1369358, -2.835755, 1, 1, 1, 1, 1,
-0.6349578, -0.4117699, -2.070374, 1, 1, 1, 1, 1,
-0.6330631, -0.6807082, -2.707969, 1, 1, 1, 1, 1,
-0.6312501, 0.9641351, -0.6307219, 1, 1, 1, 1, 1,
-0.6296663, 0.4110701, 0.1025622, 1, 1, 1, 1, 1,
-0.6253682, -0.1134788, -2.753858, 0, 0, 1, 1, 1,
-0.6251509, 1.288145, -2.840268, 1, 0, 0, 1, 1,
-0.6226943, -1.736935, -3.910922, 1, 0, 0, 1, 1,
-0.6132219, -2.500286, -2.913201, 1, 0, 0, 1, 1,
-0.6015876, 0.8462218, -0.3688779, 1, 0, 0, 1, 1,
-0.6012466, -0.5729833, -2.991341, 1, 0, 0, 1, 1,
-0.597284, 0.9504111, 2.072428, 0, 0, 0, 1, 1,
-0.593025, -0.1674258, -2.058575, 0, 0, 0, 1, 1,
-0.5929481, -0.3710832, -0.618171, 0, 0, 0, 1, 1,
-0.591397, 0.3759689, -0.9710795, 0, 0, 0, 1, 1,
-0.5906101, 0.7339283, -0.5664343, 0, 0, 0, 1, 1,
-0.5895558, -1.7808, -3.440582, 0, 0, 0, 1, 1,
-0.5880798, -0.7930458, -2.006065, 0, 0, 0, 1, 1,
-0.5861696, 1.029665, 0.7616683, 1, 1, 1, 1, 1,
-0.5830571, -0.8410265, -1.866857, 1, 1, 1, 1, 1,
-0.5823144, -0.9792307, -2.889493, 1, 1, 1, 1, 1,
-0.5822368, 1.093343, -1.457527, 1, 1, 1, 1, 1,
-0.5808834, -0.5891088, -3.353572, 1, 1, 1, 1, 1,
-0.5791054, -0.4274277, -2.313804, 1, 1, 1, 1, 1,
-0.5782901, -0.72601, -1.967716, 1, 1, 1, 1, 1,
-0.5721149, 1.951271, -1.212349, 1, 1, 1, 1, 1,
-0.5682164, -0.2458207, -1.36003, 1, 1, 1, 1, 1,
-0.5646895, 1.891164, -0.09826697, 1, 1, 1, 1, 1,
-0.5618664, 0.7705358, -1.396495, 1, 1, 1, 1, 1,
-0.5604097, 0.2306798, -1.894102, 1, 1, 1, 1, 1,
-0.5560389, 0.5715935, -2.30739, 1, 1, 1, 1, 1,
-0.5535743, -0.06411545, -2.260074, 1, 1, 1, 1, 1,
-0.5517547, -0.4218795, -2.507025, 1, 1, 1, 1, 1,
-0.5487939, 0.5869272, -0.2416564, 0, 0, 1, 1, 1,
-0.5422722, 0.3478066, -1.675345, 1, 0, 0, 1, 1,
-0.5408447, 1.166145, -0.572862, 1, 0, 0, 1, 1,
-0.5402239, 0.7176269, -0.238808, 1, 0, 0, 1, 1,
-0.5402176, 3.085606, 0.1367421, 1, 0, 0, 1, 1,
-0.5340815, 1.375964, 0.3264111, 1, 0, 0, 1, 1,
-0.5321879, 1.073844, -0.8837118, 0, 0, 0, 1, 1,
-0.5313859, 0.6125325, -0.5957107, 0, 0, 0, 1, 1,
-0.5288837, -1.425206, -2.438372, 0, 0, 0, 1, 1,
-0.5166779, -0.9128355, -1.308875, 0, 0, 0, 1, 1,
-0.5164436, -0.3732918, -1.977826, 0, 0, 0, 1, 1,
-0.5132422, 0.4509677, -1.734954, 0, 0, 0, 1, 1,
-0.5080426, -0.6776977, -2.597981, 0, 0, 0, 1, 1,
-0.5076532, -0.9293981, -1.821585, 1, 1, 1, 1, 1,
-0.5030655, 1.198661, -1.046599, 1, 1, 1, 1, 1,
-0.4885274, -1.303695, -2.924642, 1, 1, 1, 1, 1,
-0.4835951, 0.6310133, 0.4874332, 1, 1, 1, 1, 1,
-0.4810432, 1.064749, -1.633109, 1, 1, 1, 1, 1,
-0.4787448, 0.3899416, -1.176921, 1, 1, 1, 1, 1,
-0.4752658, 1.664446, -0.5625135, 1, 1, 1, 1, 1,
-0.474767, 0.04566933, -3.596055, 1, 1, 1, 1, 1,
-0.4727495, -0.3185311, -2.377835, 1, 1, 1, 1, 1,
-0.4713162, 0.5235855, -3.132857, 1, 1, 1, 1, 1,
-0.469209, -1.78958, -2.828334, 1, 1, 1, 1, 1,
-0.4653744, -0.08180723, -0.002268521, 1, 1, 1, 1, 1,
-0.4632448, -1.486976, -4.593117, 1, 1, 1, 1, 1,
-0.4604227, -0.7070107, -4.332081, 1, 1, 1, 1, 1,
-0.4579594, -1.743185, -2.726546, 1, 1, 1, 1, 1,
-0.4575393, -0.5656258, -2.118799, 0, 0, 1, 1, 1,
-0.4516977, -0.4759054, -2.115627, 1, 0, 0, 1, 1,
-0.4512303, 0.06054257, -0.2472998, 1, 0, 0, 1, 1,
-0.4471698, -1.196829, -1.891902, 1, 0, 0, 1, 1,
-0.4381354, -0.1892013, -2.952104, 1, 0, 0, 1, 1,
-0.4380031, 0.6460792, 0.2999401, 1, 0, 0, 1, 1,
-0.4362771, 0.1269968, -2.193727, 0, 0, 0, 1, 1,
-0.4343844, 1.80223, 0.696609, 0, 0, 0, 1, 1,
-0.4305029, 0.8077531, -0.07013648, 0, 0, 0, 1, 1,
-0.4292745, 0.7852359, -0.4244522, 0, 0, 0, 1, 1,
-0.4288811, -0.5978889, -3.718155, 0, 0, 0, 1, 1,
-0.4272755, 2.687654, 0.2360258, 0, 0, 0, 1, 1,
-0.4250493, 0.8746659, -0.8366337, 0, 0, 0, 1, 1,
-0.4196931, 1.155638, -1.045259, 1, 1, 1, 1, 1,
-0.4193464, -0.2024265, -2.050519, 1, 1, 1, 1, 1,
-0.4172336, -0.5677536, -3.041039, 1, 1, 1, 1, 1,
-0.4150056, 0.5995887, -1.819312, 1, 1, 1, 1, 1,
-0.4142758, -0.08446639, -1.7774, 1, 1, 1, 1, 1,
-0.4138229, -1.173682, -3.454263, 1, 1, 1, 1, 1,
-0.4115956, -0.1053961, -1.830879, 1, 1, 1, 1, 1,
-0.4076538, 0.2332346, -1.481335, 1, 1, 1, 1, 1,
-0.4070567, -0.4278881, -2.520562, 1, 1, 1, 1, 1,
-0.4032591, 1.734211, -0.5234364, 1, 1, 1, 1, 1,
-0.4000093, -0.949299, -2.573228, 1, 1, 1, 1, 1,
-0.3971685, 0.6156058, -1.309004, 1, 1, 1, 1, 1,
-0.3952589, 0.3332748, -2.926741, 1, 1, 1, 1, 1,
-0.3944182, -1.946081, -2.563294, 1, 1, 1, 1, 1,
-0.3941801, -0.6525624, -2.444692, 1, 1, 1, 1, 1,
-0.3930357, 0.3708964, -0.4593125, 0, 0, 1, 1, 1,
-0.3927304, 0.9356292, 0.0767455, 1, 0, 0, 1, 1,
-0.3801703, -0.4953148, -0.8540973, 1, 0, 0, 1, 1,
-0.3766637, -0.2101261, -3.92933, 1, 0, 0, 1, 1,
-0.3766313, -0.3572088, -3.613965, 1, 0, 0, 1, 1,
-0.3765294, 0.1566309, -2.605471, 1, 0, 0, 1, 1,
-0.3764247, 1.095321, -0.05193797, 0, 0, 0, 1, 1,
-0.3755612, 0.1412048, -2.260357, 0, 0, 0, 1, 1,
-0.3751294, -1.546194, -3.489865, 0, 0, 0, 1, 1,
-0.374347, -0.9329649, -2.56442, 0, 0, 0, 1, 1,
-0.3738236, -0.9583249, -2.197901, 0, 0, 0, 1, 1,
-0.3717496, 0.1831376, -1.980299, 0, 0, 0, 1, 1,
-0.3700178, -1.130811, -2.554152, 0, 0, 0, 1, 1,
-0.3650867, 1.318713, 2.305658, 1, 1, 1, 1, 1,
-0.3645172, -0.4650399, -2.594678, 1, 1, 1, 1, 1,
-0.3599456, -0.6600088, -3.71136, 1, 1, 1, 1, 1,
-0.3559404, 0.1126244, -0.187271, 1, 1, 1, 1, 1,
-0.3428557, -0.07803047, -2.244515, 1, 1, 1, 1, 1,
-0.3357894, 0.9443408, -0.4900755, 1, 1, 1, 1, 1,
-0.3331153, -0.9834577, -4.174116, 1, 1, 1, 1, 1,
-0.3328433, -1.676332, -1.864977, 1, 1, 1, 1, 1,
-0.3302872, 0.5746031, -1.561901, 1, 1, 1, 1, 1,
-0.328668, -0.1836687, -1.313891, 1, 1, 1, 1, 1,
-0.3251449, -0.2144852, -2.62327, 1, 1, 1, 1, 1,
-0.3212593, 0.6269994, -1.311793, 1, 1, 1, 1, 1,
-0.3199281, 2.490904, -0.3319036, 1, 1, 1, 1, 1,
-0.3189635, 0.5024052, 1.423099, 1, 1, 1, 1, 1,
-0.3155221, -0.3658235, -1.739877, 1, 1, 1, 1, 1,
-0.3117156, 1.122646, -2.934611, 0, 0, 1, 1, 1,
-0.3080236, 1.203248, 0.2661538, 1, 0, 0, 1, 1,
-0.3062721, 0.1896526, -1.123136, 1, 0, 0, 1, 1,
-0.2992281, 0.7710758, 1.247686, 1, 0, 0, 1, 1,
-0.2972388, 0.9210179, -1.265311, 1, 0, 0, 1, 1,
-0.2969345, 0.3594786, -1.583788, 1, 0, 0, 1, 1,
-0.2904836, 0.4756745, -1.892116, 0, 0, 0, 1, 1,
-0.2898273, -0.1241353, -2.473812, 0, 0, 0, 1, 1,
-0.2877614, -0.417638, -2.557306, 0, 0, 0, 1, 1,
-0.286352, -1.173922, -3.829276, 0, 0, 0, 1, 1,
-0.2860286, 0.4639979, -0.09013546, 0, 0, 0, 1, 1,
-0.2815193, -0.2184089, 0.08358777, 0, 0, 0, 1, 1,
-0.2809876, 0.7040018, 1.389982, 0, 0, 0, 1, 1,
-0.2806098, 0.9289922, -1.283546, 1, 1, 1, 1, 1,
-0.280071, 0.1494569, -1.725111, 1, 1, 1, 1, 1,
-0.2768772, 0.7095063, 1.865404, 1, 1, 1, 1, 1,
-0.2730265, 0.08558398, -0.03026967, 1, 1, 1, 1, 1,
-0.2700804, -0.5523448, -1.622631, 1, 1, 1, 1, 1,
-0.2698886, -0.1316825, -1.985371, 1, 1, 1, 1, 1,
-0.2676907, 0.04195498, -1.153706, 1, 1, 1, 1, 1,
-0.2674107, -0.5251916, -2.034013, 1, 1, 1, 1, 1,
-0.2610941, 1.397201, -0.7402575, 1, 1, 1, 1, 1,
-0.2585879, 0.7607158, 0.8598751, 1, 1, 1, 1, 1,
-0.2538377, 1.231714, 0.8074346, 1, 1, 1, 1, 1,
-0.2523267, -0.7601136, -3.165096, 1, 1, 1, 1, 1,
-0.2509679, -0.3061444, -3.200832, 1, 1, 1, 1, 1,
-0.2481655, 1.629235, -1.132722, 1, 1, 1, 1, 1,
-0.2454621, 0.6151491, -1.715175, 1, 1, 1, 1, 1,
-0.2446855, -0.2987898, -4.011715, 0, 0, 1, 1, 1,
-0.2376685, 0.4475796, -0.3443863, 1, 0, 0, 1, 1,
-0.233959, 0.931391, 0.4382295, 1, 0, 0, 1, 1,
-0.2325653, -0.9676295, -1.759238, 1, 0, 0, 1, 1,
-0.232273, -0.4432449, -2.436753, 1, 0, 0, 1, 1,
-0.226506, 0.2794919, -0.1138204, 1, 0, 0, 1, 1,
-0.2147138, 2.822444, -0.5692154, 0, 0, 0, 1, 1,
-0.2100916, -1.350895, -2.801335, 0, 0, 0, 1, 1,
-0.2021616, 0.6791355, -1.845471, 0, 0, 0, 1, 1,
-0.1985505, 0.6240702, -1.561777, 0, 0, 0, 1, 1,
-0.1954348, 0.174043, -1.141097, 0, 0, 0, 1, 1,
-0.1932651, -1.613925, -4.139786, 0, 0, 0, 1, 1,
-0.1915672, 1.692387, -1.982147, 0, 0, 0, 1, 1,
-0.1911565, 0.2936053, 0.5308398, 1, 1, 1, 1, 1,
-0.1844026, 1.242617, -1.13892, 1, 1, 1, 1, 1,
-0.1842563, 1.320061, 0.2851762, 1, 1, 1, 1, 1,
-0.1839977, -0.4805112, -0.8526887, 1, 1, 1, 1, 1,
-0.1821586, 0.5342031, -0.03525009, 1, 1, 1, 1, 1,
-0.1808977, 1.304448, 1.031895, 1, 1, 1, 1, 1,
-0.1799014, -0.6734105, -4.028448, 1, 1, 1, 1, 1,
-0.1777615, 1.401127, 0.5944155, 1, 1, 1, 1, 1,
-0.1637483, 0.4690303, -0.5887123, 1, 1, 1, 1, 1,
-0.157432, 0.06525718, -3.016993, 1, 1, 1, 1, 1,
-0.1569255, -1.526896, -3.087201, 1, 1, 1, 1, 1,
-0.1517039, 0.3542143, 0.2372853, 1, 1, 1, 1, 1,
-0.1505339, 1.135368, 0.7548073, 1, 1, 1, 1, 1,
-0.1504721, 0.1463136, -2.498535, 1, 1, 1, 1, 1,
-0.1502485, 0.9540551, -0.1943106, 1, 1, 1, 1, 1,
-0.1469934, -0.8349184, -1.683814, 0, 0, 1, 1, 1,
-0.1467782, 0.5345394, -0.1591205, 1, 0, 0, 1, 1,
-0.1454714, 0.8019542, 0.8257821, 1, 0, 0, 1, 1,
-0.1429717, 1.56575, 0.9307469, 1, 0, 0, 1, 1,
-0.141025, -1.994554, -3.125058, 1, 0, 0, 1, 1,
-0.1405076, -0.4085256, -1.748638, 1, 0, 0, 1, 1,
-0.1403219, 1.056177, -0.6714658, 0, 0, 0, 1, 1,
-0.1381141, -1.329265, -3.286971, 0, 0, 0, 1, 1,
-0.1376829, -0.9792535, -2.09523, 0, 0, 0, 1, 1,
-0.1265274, 1.121447, 0.9351427, 0, 0, 0, 1, 1,
-0.1261276, -0.4488164, -2.52338, 0, 0, 0, 1, 1,
-0.1223845, 1.03365, -0.2905065, 0, 0, 0, 1, 1,
-0.1159089, -1.224536, -4.532852, 0, 0, 0, 1, 1,
-0.1136565, -2.319371, -3.55379, 1, 1, 1, 1, 1,
-0.1124196, -0.5645997, -2.362595, 1, 1, 1, 1, 1,
-0.1118426, 0.5887497, -0.3101702, 1, 1, 1, 1, 1,
-0.109824, -0.6101274, -3.120354, 1, 1, 1, 1, 1,
-0.1057545, -1.70233, -3.705678, 1, 1, 1, 1, 1,
-0.104237, -0.2165086, -2.848947, 1, 1, 1, 1, 1,
-0.1021596, 1.477431, -0.6311914, 1, 1, 1, 1, 1,
-0.09907255, -1.365523, -2.640847, 1, 1, 1, 1, 1,
-0.09576064, -0.8004259, -2.589083, 1, 1, 1, 1, 1,
-0.09127562, -0.5609772, -3.631491, 1, 1, 1, 1, 1,
-0.08892234, -0.2800816, -0.6746877, 1, 1, 1, 1, 1,
-0.08626091, 0.4984068, 1.485496, 1, 1, 1, 1, 1,
-0.08255581, -0.6446465, -0.9873672, 1, 1, 1, 1, 1,
-0.07397746, -0.5491546, -2.632793, 1, 1, 1, 1, 1,
-0.06960836, 1.521602, -0.6758618, 1, 1, 1, 1, 1,
-0.06641252, 1.442701, -0.0408861, 0, 0, 1, 1, 1,
-0.0652399, -0.2705437, -1.717311, 1, 0, 0, 1, 1,
-0.06398264, -0.7577259, -2.506526, 1, 0, 0, 1, 1,
-0.06026663, -0.0772696, -3.070096, 1, 0, 0, 1, 1,
-0.05222782, 0.06183349, -0.009154465, 1, 0, 0, 1, 1,
-0.04912597, 0.01989078, -0.8137998, 1, 0, 0, 1, 1,
-0.0443919, 1.063008, -0.2306938, 0, 0, 0, 1, 1,
-0.04119357, -0.3850726, -4.232699, 0, 0, 0, 1, 1,
-0.0408346, -0.6836196, -2.079964, 0, 0, 0, 1, 1,
-0.03828891, -1.102658, -2.342875, 0, 0, 0, 1, 1,
-0.03477678, -0.4543285, -2.929008, 0, 0, 0, 1, 1,
-0.03446555, -0.9986693, -2.537743, 0, 0, 0, 1, 1,
-0.03348031, 0.2847945, 0.1725868, 0, 0, 0, 1, 1,
-0.03259652, 0.2653574, 0.1662638, 1, 1, 1, 1, 1,
-0.03055502, -0.8584042, -2.425946, 1, 1, 1, 1, 1,
-0.02798085, -0.3716449, -4.422884, 1, 1, 1, 1, 1,
-0.02618016, 0.6974443, -0.06800036, 1, 1, 1, 1, 1,
-0.02376071, -1.243201, -1.686119, 1, 1, 1, 1, 1,
-0.0151224, -1.586666, -3.71719, 1, 1, 1, 1, 1,
-0.01190036, -2.046384, -1.51817, 1, 1, 1, 1, 1,
-0.01174077, 2.464649, -0.04068416, 1, 1, 1, 1, 1,
-0.01110015, -2.046102, -2.530737, 1, 1, 1, 1, 1,
-0.01040058, -0.2759291, -2.55371, 1, 1, 1, 1, 1,
-0.01015709, -0.5276883, -4.049664, 1, 1, 1, 1, 1,
-0.007272154, 0.692363, -0.4624432, 1, 1, 1, 1, 1,
-0.00186421, 0.6149233, 0.1697477, 1, 1, 1, 1, 1,
0.00266553, -0.1370372, 1.957786, 1, 1, 1, 1, 1,
0.005264151, 1.659115, 1.915225, 1, 1, 1, 1, 1,
0.005285835, -0.2178052, 2.88957, 0, 0, 1, 1, 1,
0.01002492, -0.7397423, 4.422427, 1, 0, 0, 1, 1,
0.01158644, -0.9554024, 4.152462, 1, 0, 0, 1, 1,
0.01194395, -0.7946503, 2.149024, 1, 0, 0, 1, 1,
0.01488216, 1.056701, 1.238823, 1, 0, 0, 1, 1,
0.01510869, -0.9432304, 2.976584, 1, 0, 0, 1, 1,
0.01878794, -0.1929969, 1.216409, 0, 0, 0, 1, 1,
0.01883776, 1.142358, -0.7416795, 0, 0, 0, 1, 1,
0.02455866, -1.577532, 2.610709, 0, 0, 0, 1, 1,
0.0254619, 0.2196698, -0.07092815, 0, 0, 0, 1, 1,
0.0307412, -0.5118306, 2.258252, 0, 0, 0, 1, 1,
0.03205908, -1.778244, 2.222312, 0, 0, 0, 1, 1,
0.03271137, 1.697762, 0.07790115, 0, 0, 0, 1, 1,
0.03452537, -0.8408899, 1.160587, 1, 1, 1, 1, 1,
0.03504934, 1.267798, 0.4531323, 1, 1, 1, 1, 1,
0.03780982, -1.553783, 3.978863, 1, 1, 1, 1, 1,
0.03973614, 0.3525003, 0.1216287, 1, 1, 1, 1, 1,
0.04004345, -0.9363829, 3.161596, 1, 1, 1, 1, 1,
0.04071783, 1.694312, 1.48559, 1, 1, 1, 1, 1,
0.04176509, -0.9425651, 3.177374, 1, 1, 1, 1, 1,
0.05165656, 1.850679, 0.206717, 1, 1, 1, 1, 1,
0.05299322, -0.6849387, 2.637464, 1, 1, 1, 1, 1,
0.0532911, -1.895902, 1.791222, 1, 1, 1, 1, 1,
0.05425708, -0.5980693, 4.262459, 1, 1, 1, 1, 1,
0.05552819, -0.5082729, 2.795255, 1, 1, 1, 1, 1,
0.05781875, -2.326573, 2.641685, 1, 1, 1, 1, 1,
0.0643848, 0.6265799, 0.1473279, 1, 1, 1, 1, 1,
0.06462819, -1.578943, 2.512629, 1, 1, 1, 1, 1,
0.06539075, -0.8336465, 2.49881, 0, 0, 1, 1, 1,
0.06899758, 0.5894758, -1.191649, 1, 0, 0, 1, 1,
0.0702246, -0.7424971, 1.751184, 1, 0, 0, 1, 1,
0.07207312, 0.1794724, 0.3805448, 1, 0, 0, 1, 1,
0.07278596, 0.9513215, -0.2878392, 1, 0, 0, 1, 1,
0.07295587, 0.4395878, -1.20099, 1, 0, 0, 1, 1,
0.07419125, -0.7630478, 3.526628, 0, 0, 0, 1, 1,
0.07901712, -0.871838, 2.930164, 0, 0, 0, 1, 1,
0.08370317, -1.185008, 2.509279, 0, 0, 0, 1, 1,
0.08431677, 0.1035039, 0.9195642, 0, 0, 0, 1, 1,
0.08437227, -2.736311, 4.568161, 0, 0, 0, 1, 1,
0.0869923, 0.3919682, 0.5828171, 0, 0, 0, 1, 1,
0.08723766, -0.9113236, 1.81149, 0, 0, 0, 1, 1,
0.08832462, 1.405591, 0.2787437, 1, 1, 1, 1, 1,
0.08913133, -1.106225, 3.238047, 1, 1, 1, 1, 1,
0.09310383, 1.252208, -0.3488175, 1, 1, 1, 1, 1,
0.09792055, -0.1371285, 2.249641, 1, 1, 1, 1, 1,
0.09942902, -0.8468714, 2.024039, 1, 1, 1, 1, 1,
0.1119935, -0.5328901, 2.242747, 1, 1, 1, 1, 1,
0.1133675, -0.2332071, 1.967395, 1, 1, 1, 1, 1,
0.1151818, 0.6494824, -0.04741192, 1, 1, 1, 1, 1,
0.1184013, 1.638749, 2.369736, 1, 1, 1, 1, 1,
0.1213221, -1.378001, 2.870064, 1, 1, 1, 1, 1,
0.1216814, -1.70892, 2.692783, 1, 1, 1, 1, 1,
0.1265878, -0.1854941, 2.423021, 1, 1, 1, 1, 1,
0.1312453, -0.759049, 1.205377, 1, 1, 1, 1, 1,
0.1337697, 0.4455701, 2.329157, 1, 1, 1, 1, 1,
0.1337741, -1.99354, 2.000837, 1, 1, 1, 1, 1,
0.1378559, -0.159836, 1.701255, 0, 0, 1, 1, 1,
0.1409491, -0.7470576, 3.812037, 1, 0, 0, 1, 1,
0.1421448, 1.561575, -0.240491, 1, 0, 0, 1, 1,
0.1455696, 1.425557, 1.788316, 1, 0, 0, 1, 1,
0.1459999, 0.2513282, 1.238914, 1, 0, 0, 1, 1,
0.1486445, 0.4650906, 1.769738, 1, 0, 0, 1, 1,
0.1542644, -0.0278944, 2.855015, 0, 0, 0, 1, 1,
0.1567017, -1.517757, 2.540977, 0, 0, 0, 1, 1,
0.1575191, -0.1974665, 2.473936, 0, 0, 0, 1, 1,
0.1618275, -0.2514454, 2.869873, 0, 0, 0, 1, 1,
0.1619815, -2.29603, 2.493893, 0, 0, 0, 1, 1,
0.1628022, -0.3997305, 3.082863, 0, 0, 0, 1, 1,
0.1704499, -0.05604156, 2.067547, 0, 0, 0, 1, 1,
0.1715655, -0.1071172, 2.693617, 1, 1, 1, 1, 1,
0.1718777, -0.006776286, 1.487215, 1, 1, 1, 1, 1,
0.1776069, -0.1231438, 3.101501, 1, 1, 1, 1, 1,
0.1792849, 1.068085, 0.8585351, 1, 1, 1, 1, 1,
0.1851075, -0.5307346, 4.538476, 1, 1, 1, 1, 1,
0.18756, 1.753695, -0.06953322, 1, 1, 1, 1, 1,
0.1896966, -0.02690329, 2.871888, 1, 1, 1, 1, 1,
0.1903793, 0.4762191, 1.716934, 1, 1, 1, 1, 1,
0.1905626, 0.05932211, 1.308395, 1, 1, 1, 1, 1,
0.1908889, 0.5181124, 0.9217676, 1, 1, 1, 1, 1,
0.1914045, 0.1351799, 1.85181, 1, 1, 1, 1, 1,
0.1935936, 0.05440736, 0.893125, 1, 1, 1, 1, 1,
0.1989716, 0.5619233, 1.574654, 1, 1, 1, 1, 1,
0.1991553, -0.680425, 3.873712, 1, 1, 1, 1, 1,
0.2008252, 1.296644, 1.371478, 1, 1, 1, 1, 1,
0.2015934, -0.8306616, 4.122653, 0, 0, 1, 1, 1,
0.206373, 0.6830857, 1.21789, 1, 0, 0, 1, 1,
0.2074096, -0.126985, 1.551838, 1, 0, 0, 1, 1,
0.2131898, -0.6457059, 2.105836, 1, 0, 0, 1, 1,
0.2132063, 0.2628753, 1.034626, 1, 0, 0, 1, 1,
0.2137112, -0.5253391, 2.45266, 1, 0, 0, 1, 1,
0.2140556, -0.3875576, 1.390713, 0, 0, 0, 1, 1,
0.2141402, 1.956535, -0.1712377, 0, 0, 0, 1, 1,
0.2159852, -0.5540065, 3.646275, 0, 0, 0, 1, 1,
0.2179652, -0.339302, 0.9125022, 0, 0, 0, 1, 1,
0.2219453, -4.005061, 2.834718, 0, 0, 0, 1, 1,
0.2231802, -1.804352, 4.805007, 0, 0, 0, 1, 1,
0.224419, 0.8003389, -0.2065822, 0, 0, 0, 1, 1,
0.2250789, -1.103724, 3.69919, 1, 1, 1, 1, 1,
0.2261539, 1.845098, 0.5242316, 1, 1, 1, 1, 1,
0.2274838, -0.5618128, 2.85829, 1, 1, 1, 1, 1,
0.2282118, 1.365589, 0.5851182, 1, 1, 1, 1, 1,
0.2331357, -0.4047118, 2.752868, 1, 1, 1, 1, 1,
0.2372055, 1.345154, -0.1229647, 1, 1, 1, 1, 1,
0.2402795, 1.494853, -1.820478, 1, 1, 1, 1, 1,
0.240469, 0.2090739, 0.8742488, 1, 1, 1, 1, 1,
0.2407524, 1.221591, -1.164955, 1, 1, 1, 1, 1,
0.2407909, -0.4093807, 2.647374, 1, 1, 1, 1, 1,
0.2444976, 0.2309124, 0.9132789, 1, 1, 1, 1, 1,
0.2463859, -0.2802165, 0.9060647, 1, 1, 1, 1, 1,
0.2467563, 1.72952, 0.1204853, 1, 1, 1, 1, 1,
0.2561157, -0.9899652, 3.454962, 1, 1, 1, 1, 1,
0.2642877, -0.3234172, 3.123178, 1, 1, 1, 1, 1,
0.2657201, 0.2666225, 1.603294, 0, 0, 1, 1, 1,
0.2661129, 0.7371019, -0.0423411, 1, 0, 0, 1, 1,
0.2699068, -1.237734, 2.762772, 1, 0, 0, 1, 1,
0.2717756, 0.2296738, 0.2835766, 1, 0, 0, 1, 1,
0.271798, 0.7326545, 0.3604839, 1, 0, 0, 1, 1,
0.2761232, -1.632087, 2.230429, 1, 0, 0, 1, 1,
0.2820113, -0.2008948, 3.264177, 0, 0, 0, 1, 1,
0.2821663, -0.3453688, 1.179123, 0, 0, 0, 1, 1,
0.2864676, -1.604039, 3.773927, 0, 0, 0, 1, 1,
0.2910285, 0.1939018, 0.782291, 0, 0, 0, 1, 1,
0.294236, 0.6187835, -1.247999, 0, 0, 0, 1, 1,
0.2962558, -0.5681488, 3.000111, 0, 0, 0, 1, 1,
0.296833, 0.2323187, 2.167745, 0, 0, 0, 1, 1,
0.2978109, -0.1271988, 3.083278, 1, 1, 1, 1, 1,
0.3005418, -0.7284364, 3.596928, 1, 1, 1, 1, 1,
0.3012978, 0.2243073, 0.524034, 1, 1, 1, 1, 1,
0.3159861, -1.253395, 4.343843, 1, 1, 1, 1, 1,
0.316585, -0.88984, 4.14215, 1, 1, 1, 1, 1,
0.3187249, -0.08751047, 2.445228, 1, 1, 1, 1, 1,
0.3278686, 0.4470934, 0.4349084, 1, 1, 1, 1, 1,
0.3312419, 1.342063, -0.6450018, 1, 1, 1, 1, 1,
0.3331189, -2.446156, 2.290485, 1, 1, 1, 1, 1,
0.3357099, -0.681381, 3.246529, 1, 1, 1, 1, 1,
0.3399014, 1.836963, -0.3471044, 1, 1, 1, 1, 1,
0.3415177, -0.8800986, 3.507149, 1, 1, 1, 1, 1,
0.3424382, -0.478362, 3.289522, 1, 1, 1, 1, 1,
0.3440797, -0.6327448, 1.157093, 1, 1, 1, 1, 1,
0.3477203, -1.17796, 2.151828, 1, 1, 1, 1, 1,
0.3496478, 0.3426894, 1.589269, 0, 0, 1, 1, 1,
0.3502668, 0.7225983, 0.3167817, 1, 0, 0, 1, 1,
0.3503925, -0.7219973, 2.317116, 1, 0, 0, 1, 1,
0.3574814, -0.7536863, 3.137786, 1, 0, 0, 1, 1,
0.3642923, -0.5244565, 2.005949, 1, 0, 0, 1, 1,
0.3651988, 0.8222489, -0.4756029, 1, 0, 0, 1, 1,
0.3700791, 0.5758291, 0.2452371, 0, 0, 0, 1, 1,
0.3716259, -0.375592, 3.102012, 0, 0, 0, 1, 1,
0.3728516, 1.387001, -1.008006, 0, 0, 0, 1, 1,
0.3772753, 1.178137, 1.68557, 0, 0, 0, 1, 1,
0.3789494, -0.07617855, 1.475209, 0, 0, 0, 1, 1,
0.3800816, -0.02875658, 2.238101, 0, 0, 0, 1, 1,
0.3828248, -1.017972, 3.624969, 0, 0, 0, 1, 1,
0.3844545, 0.4684342, 1.598734, 1, 1, 1, 1, 1,
0.3861493, 1.105656, -0.6493075, 1, 1, 1, 1, 1,
0.3899719, -1.199227, 2.797793, 1, 1, 1, 1, 1,
0.3901847, 0.04428542, 0.8708991, 1, 1, 1, 1, 1,
0.3978889, 0.751048, -0.6515919, 1, 1, 1, 1, 1,
0.398362, -0.2103718, 2.310545, 1, 1, 1, 1, 1,
0.4093099, 0.3909376, 0.1962797, 1, 1, 1, 1, 1,
0.4113822, -1.24935, 1.444694, 1, 1, 1, 1, 1,
0.4118702, -0.0428358, 0.05650225, 1, 1, 1, 1, 1,
0.412917, -3.695744, 3.153043, 1, 1, 1, 1, 1,
0.4156442, 0.2785893, 2.916485, 1, 1, 1, 1, 1,
0.4207153, -0.2519431, 1.099569, 1, 1, 1, 1, 1,
0.4250041, 0.9253121, 0.3300893, 1, 1, 1, 1, 1,
0.4251483, 0.09426511, 2.463048, 1, 1, 1, 1, 1,
0.4294513, -0.761587, 1.757535, 1, 1, 1, 1, 1,
0.4299721, 1.32398, 0.291317, 0, 0, 1, 1, 1,
0.4334716, 0.49836, 0.1114587, 1, 0, 0, 1, 1,
0.4336426, 1.063591, 1.614789, 1, 0, 0, 1, 1,
0.4378345, -0.01262798, 1.099417, 1, 0, 0, 1, 1,
0.4412752, -0.1977085, 1.246956, 1, 0, 0, 1, 1,
0.4462464, -0.7236294, 2.160374, 1, 0, 0, 1, 1,
0.4482347, 0.9877178, -1.170142, 0, 0, 0, 1, 1,
0.4551565, 0.1174841, 3.490785, 0, 0, 0, 1, 1,
0.4617983, -1.775147, 2.750188, 0, 0, 0, 1, 1,
0.4634747, -0.3241939, 3.052232, 0, 0, 0, 1, 1,
0.4715985, -0.2814147, 0.2185617, 0, 0, 0, 1, 1,
0.4752811, 0.4421454, 0.2279664, 0, 0, 0, 1, 1,
0.4766732, -1.274334, 4.406598, 0, 0, 0, 1, 1,
0.4818146, -1.061024, 3.854776, 1, 1, 1, 1, 1,
0.4820199, 0.9876514, 0.0006646356, 1, 1, 1, 1, 1,
0.4864371, 0.4444792, 1.361294, 1, 1, 1, 1, 1,
0.4877988, -0.374808, 3.090284, 1, 1, 1, 1, 1,
0.4940812, -1.945726, 4.439026, 1, 1, 1, 1, 1,
0.4975263, -1.111089, 2.34908, 1, 1, 1, 1, 1,
0.5056312, -0.2688567, 2.176264, 1, 1, 1, 1, 1,
0.5074496, 0.6596308, 0.2777494, 1, 1, 1, 1, 1,
0.5106353, -0.403625, 1.819149, 1, 1, 1, 1, 1,
0.5112465, -0.8781406, 2.236439, 1, 1, 1, 1, 1,
0.5153057, -1.232865, 0.8584118, 1, 1, 1, 1, 1,
0.5153385, 1.292203, 0.6502444, 1, 1, 1, 1, 1,
0.5176992, -0.7999213, 2.46716, 1, 1, 1, 1, 1,
0.5186104, 0.3528735, 0.4273068, 1, 1, 1, 1, 1,
0.5218111, -0.2393706, 1.775915, 1, 1, 1, 1, 1,
0.5221019, 0.2816854, -0.7749965, 0, 0, 1, 1, 1,
0.5243852, 0.946791, -0.5023541, 1, 0, 0, 1, 1,
0.5250019, -1.451346, 3.169149, 1, 0, 0, 1, 1,
0.5300527, 0.6212679, 0.8471515, 1, 0, 0, 1, 1,
0.5300775, -1.173764, 0.8953745, 1, 0, 0, 1, 1,
0.5323043, 0.5515871, 1.618663, 1, 0, 0, 1, 1,
0.5329781, 0.5229694, -0.5782068, 0, 0, 0, 1, 1,
0.5422814, -2.186697, 4.056385, 0, 0, 0, 1, 1,
0.5479661, 2.004072, 0.2012996, 0, 0, 0, 1, 1,
0.5480337, 0.5328274, -0.136479, 0, 0, 0, 1, 1,
0.5512567, -0.3198326, 1.683846, 0, 0, 0, 1, 1,
0.5528205, 1.779624, 0.226413, 0, 0, 0, 1, 1,
0.5535532, -1.199262, 3.177103, 0, 0, 0, 1, 1,
0.556241, -1.700999, 2.425774, 1, 1, 1, 1, 1,
0.5619318, 2.532588, 1.132111, 1, 1, 1, 1, 1,
0.5638736, 0.5989556, 1.622224, 1, 1, 1, 1, 1,
0.5695616, 0.6339666, 1.161062, 1, 1, 1, 1, 1,
0.5703844, 1.864998, -0.5444001, 1, 1, 1, 1, 1,
0.5718711, 1.315391, 0.1772347, 1, 1, 1, 1, 1,
0.5739675, 1.098412, -2.211775, 1, 1, 1, 1, 1,
0.5757302, -0.3950661, 1.659158, 1, 1, 1, 1, 1,
0.5830788, 0.6099778, -0.1864457, 1, 1, 1, 1, 1,
0.5872896, -0.03318123, 0.8690173, 1, 1, 1, 1, 1,
0.5929393, 0.5888273, 1.839841, 1, 1, 1, 1, 1,
0.5965256, -0.6734231, 3.414935, 1, 1, 1, 1, 1,
0.6019359, 0.2573552, 1.251691, 1, 1, 1, 1, 1,
0.6064981, -0.551141, 1.610449, 1, 1, 1, 1, 1,
0.6075659, 2.075855, 0.0199594, 1, 1, 1, 1, 1,
0.6092092, -0.9040561, 3.935733, 0, 0, 1, 1, 1,
0.6099347, -2.239358, 2.470131, 1, 0, 0, 1, 1,
0.6128714, -0.4106702, 1.445131, 1, 0, 0, 1, 1,
0.6136872, -0.5524047, -0.5376137, 1, 0, 0, 1, 1,
0.6282884, -0.3303393, 0.5343298, 1, 0, 0, 1, 1,
0.6344856, -0.3915116, 1.091229, 1, 0, 0, 1, 1,
0.6345596, 0.01315032, 1.561825, 0, 0, 0, 1, 1,
0.6433185, -0.1088856, 0.822122, 0, 0, 0, 1, 1,
0.6435115, -0.3076911, 2.711929, 0, 0, 0, 1, 1,
0.6438971, -0.1784816, 0.2466124, 0, 0, 0, 1, 1,
0.6490935, 3.039302, 0.5555029, 0, 0, 0, 1, 1,
0.65434, -0.1638968, 3.829458, 0, 0, 0, 1, 1,
0.6553801, -1.509871, 2.911474, 0, 0, 0, 1, 1,
0.6601633, 1.413743, -0.8993257, 1, 1, 1, 1, 1,
0.6607526, 0.1878764, 4.099086, 1, 1, 1, 1, 1,
0.6666725, 1.183886, -1.401883, 1, 1, 1, 1, 1,
0.6680094, 0.7045882, 1.359733, 1, 1, 1, 1, 1,
0.6684922, 2.217702, 0.2399967, 1, 1, 1, 1, 1,
0.6708444, -2.059143, 2.570788, 1, 1, 1, 1, 1,
0.6718224, -1.10088, 3.458666, 1, 1, 1, 1, 1,
0.6724554, 0.4019455, 0.6303738, 1, 1, 1, 1, 1,
0.6731166, -0.9322756, 2.982987, 1, 1, 1, 1, 1,
0.6751786, 0.4362866, 2.029158, 1, 1, 1, 1, 1,
0.6755411, -0.7136014, 2.444925, 1, 1, 1, 1, 1,
0.6773002, -1.166434, 1.669881, 1, 1, 1, 1, 1,
0.6776931, -0.2480646, 0.3586016, 1, 1, 1, 1, 1,
0.6806364, -0.7523218, 3.395604, 1, 1, 1, 1, 1,
0.6819407, -0.008109416, 0.9558123, 1, 1, 1, 1, 1,
0.6853444, -0.3590437, 0.9607967, 0, 0, 1, 1, 1,
0.6871918, -0.07010008, 1.769181, 1, 0, 0, 1, 1,
0.694541, -0.2503826, 0.7849654, 1, 0, 0, 1, 1,
0.7009323, 0.8116333, 0.08271552, 1, 0, 0, 1, 1,
0.7050424, 1.082743, 0.9593702, 1, 0, 0, 1, 1,
0.710316, -1.573392, 1.866139, 1, 0, 0, 1, 1,
0.7122693, -0.413692, 1.535313, 0, 0, 0, 1, 1,
0.7132959, 1.873324, -1.355293, 0, 0, 0, 1, 1,
0.7174229, -0.9106226, 2.051997, 0, 0, 0, 1, 1,
0.7176953, -0.6450879, 2.796787, 0, 0, 0, 1, 1,
0.7177551, 2.134575, -0.8359823, 0, 0, 0, 1, 1,
0.7201861, 1.415825, -0.2204664, 0, 0, 0, 1, 1,
0.7284671, 1.783494, -0.4422492, 0, 0, 0, 1, 1,
0.7341355, -1.419244, 2.865458, 1, 1, 1, 1, 1,
0.7341942, 0.3295929, 2.222522, 1, 1, 1, 1, 1,
0.7352087, 1.033373, 0.2050641, 1, 1, 1, 1, 1,
0.738579, 1.693868, 1.281762, 1, 1, 1, 1, 1,
0.7414231, 0.03482567, 0.3814287, 1, 1, 1, 1, 1,
0.7519919, -0.031831, 1.944801, 1, 1, 1, 1, 1,
0.7520224, -0.7720288, 2.175159, 1, 1, 1, 1, 1,
0.7522521, -0.7191427, 1.341985, 1, 1, 1, 1, 1,
0.7543928, 0.06979764, 1.482369, 1, 1, 1, 1, 1,
0.7551491, -0.5386456, 2.00106, 1, 1, 1, 1, 1,
0.7575081, 1.066218, -0.05415887, 1, 1, 1, 1, 1,
0.7581095, -0.4535101, 2.651935, 1, 1, 1, 1, 1,
0.7624862, 1.269075, -0.1600765, 1, 1, 1, 1, 1,
0.7677562, -0.2685493, 1.893247, 1, 1, 1, 1, 1,
0.768917, 0.5775903, 0.3198166, 1, 1, 1, 1, 1,
0.7728254, 0.6763403, 1.299348, 0, 0, 1, 1, 1,
0.7748815, -0.2462714, 1.352803, 1, 0, 0, 1, 1,
0.7803822, -0.8374598, 1.7453, 1, 0, 0, 1, 1,
0.7836133, -1.194752, 3.387955, 1, 0, 0, 1, 1,
0.7894049, 0.6765184, 1.406891, 1, 0, 0, 1, 1,
0.7983942, -1.243542, 4.107601, 1, 0, 0, 1, 1,
0.7995661, -0.387649, 1.976261, 0, 0, 0, 1, 1,
0.8113273, 1.255365, 0.008762465, 0, 0, 0, 1, 1,
0.8189301, 0.3490304, 1.621149, 0, 0, 0, 1, 1,
0.8194025, 0.8521303, 0.9333984, 0, 0, 0, 1, 1,
0.8246446, 0.05544056, 0.5871335, 0, 0, 0, 1, 1,
0.8268049, -0.3096288, 0.9829873, 0, 0, 0, 1, 1,
0.8305422, 0.5882619, 0.1328717, 0, 0, 0, 1, 1,
0.8321882, -0.6994386, 1.387666, 1, 1, 1, 1, 1,
0.8336599, 0.6058012, 1.823369, 1, 1, 1, 1, 1,
0.8374562, 1.397644, 1.433103, 1, 1, 1, 1, 1,
0.8415725, -1.004212, 3.705839, 1, 1, 1, 1, 1,
0.8424441, 1.47576, -0.5778818, 1, 1, 1, 1, 1,
0.8572812, 1.004992, 0.8016774, 1, 1, 1, 1, 1,
0.8573117, 1.445391, 0.9395577, 1, 1, 1, 1, 1,
0.8629323, 0.5564597, 2.229981, 1, 1, 1, 1, 1,
0.8677511, 0.6214499, -0.9765962, 1, 1, 1, 1, 1,
0.8700513, -0.02480756, 1.543124, 1, 1, 1, 1, 1,
0.8700631, 1.044123, 1.47295, 1, 1, 1, 1, 1,
0.8762513, 0.5890328, 1.086294, 1, 1, 1, 1, 1,
0.8840519, 0.8450251, 1.09175, 1, 1, 1, 1, 1,
0.8858664, 0.6355186, 0.2675838, 1, 1, 1, 1, 1,
0.8875172, -0.3027999, 3.297033, 1, 1, 1, 1, 1,
0.8886595, 2.434826, 1.711572, 0, 0, 1, 1, 1,
0.8932078, 1.107197, 1.163664, 1, 0, 0, 1, 1,
0.8958765, -0.01580242, 0.5517327, 1, 0, 0, 1, 1,
0.8964254, 0.7665645, 2.029671, 1, 0, 0, 1, 1,
0.8984445, -0.9941894, 2.510275, 1, 0, 0, 1, 1,
0.9044433, -0.3304302, 2.443311, 1, 0, 0, 1, 1,
0.90718, -1.067827, 2.374218, 0, 0, 0, 1, 1,
0.9147893, -0.3291805, 1.739186, 0, 0, 0, 1, 1,
0.9161728, -1.946, 3.774167, 0, 0, 0, 1, 1,
0.9259927, 1.774192, 0.5302243, 0, 0, 0, 1, 1,
0.9272547, 0.9998278, 1.114003, 0, 0, 0, 1, 1,
0.9382254, -1.104411, 3.006599, 0, 0, 0, 1, 1,
0.9464339, -0.8218569, 2.685541, 0, 0, 0, 1, 1,
0.9486185, -1.534409, 3.980634, 1, 1, 1, 1, 1,
0.9550078, 1.412871, 0.7008032, 1, 1, 1, 1, 1,
0.9581478, 0.3187745, 0.8015727, 1, 1, 1, 1, 1,
0.9582757, 1.074365, -0.4687747, 1, 1, 1, 1, 1,
0.9698681, 0.1525778, 1.900252, 1, 1, 1, 1, 1,
0.9762174, 0.6868743, 0.3032616, 1, 1, 1, 1, 1,
0.9784058, -2.52431, 2.449053, 1, 1, 1, 1, 1,
0.9797176, 0.3786361, 1.094346, 1, 1, 1, 1, 1,
0.980553, -2.625371, 2.686219, 1, 1, 1, 1, 1,
0.9878202, -0.1684361, 1.850438, 1, 1, 1, 1, 1,
0.990591, -1.025497, 3.813777, 1, 1, 1, 1, 1,
0.9958136, -1.297598, 1.514156, 1, 1, 1, 1, 1,
1.010566, -0.3198283, 1.951818, 1, 1, 1, 1, 1,
1.012296, 0.5579384, 0.9975762, 1, 1, 1, 1, 1,
1.021954, 0.7075959, 1.62395, 1, 1, 1, 1, 1,
1.022465, 0.2215182, 0.3385482, 0, 0, 1, 1, 1,
1.023083, 1.205424, 1.557206, 1, 0, 0, 1, 1,
1.035911, -1.821224, 1.895216, 1, 0, 0, 1, 1,
1.039798, -0.3934912, 1.239632, 1, 0, 0, 1, 1,
1.040495, 0.1180244, 0.5373438, 1, 0, 0, 1, 1,
1.044141, -1.299078, 1.919766, 1, 0, 0, 1, 1,
1.044264, -1.101382, 3.189947, 0, 0, 0, 1, 1,
1.0481, -1.09447, 2.326224, 0, 0, 0, 1, 1,
1.066059, -1.627127, 2.35752, 0, 0, 0, 1, 1,
1.080664, -2.919843, 1.650722, 0, 0, 0, 1, 1,
1.083809, 0.4984571, 0.2063319, 0, 0, 0, 1, 1,
1.085976, 0.2016793, 1.488428, 0, 0, 0, 1, 1,
1.08623, -0.09437121, 2.002856, 0, 0, 0, 1, 1,
1.089399, 0.9843553, 0.2687196, 1, 1, 1, 1, 1,
1.091302, 0.499516, 0.4614941, 1, 1, 1, 1, 1,
1.092364, 0.280172, 0.7790334, 1, 1, 1, 1, 1,
1.0998, -0.6683727, 1.246863, 1, 1, 1, 1, 1,
1.101071, 0.03862781, 2.109673, 1, 1, 1, 1, 1,
1.107282, -3.131505, 3.523771, 1, 1, 1, 1, 1,
1.108843, -1.562809, 0.8274691, 1, 1, 1, 1, 1,
1.112191, 0.06761262, 2.374255, 1, 1, 1, 1, 1,
1.113545, 0.7161153, 1.256282, 1, 1, 1, 1, 1,
1.121879, -0.2534955, 1.486365, 1, 1, 1, 1, 1,
1.130796, -0.002171512, 2.754154, 1, 1, 1, 1, 1,
1.143858, -0.125828, 0.7458007, 1, 1, 1, 1, 1,
1.150262, -0.2456386, -0.2775515, 1, 1, 1, 1, 1,
1.153731, -0.4817721, 3.288976, 1, 1, 1, 1, 1,
1.157026, -0.466158, 3.05004, 1, 1, 1, 1, 1,
1.161143, 0.6607603, 0.6778917, 0, 0, 1, 1, 1,
1.162368, 0.08213951, 1.264484, 1, 0, 0, 1, 1,
1.171269, 0.141232, 0.8828704, 1, 0, 0, 1, 1,
1.176723, 0.222181, -0.09260131, 1, 0, 0, 1, 1,
1.180396, -0.2069659, 2.581664, 1, 0, 0, 1, 1,
1.191655, -1.875107, 1.676096, 1, 0, 0, 1, 1,
1.196283, 1.268791, -0.7289004, 0, 0, 0, 1, 1,
1.19723, 0.9503216, 2.325867, 0, 0, 0, 1, 1,
1.199706, -0.08253267, 3.560047, 0, 0, 0, 1, 1,
1.204714, -0.9122619, 2.488928, 0, 0, 0, 1, 1,
1.222355, -0.8249254, 2.014029, 0, 0, 0, 1, 1,
1.226151, -0.5329988, 1.85307, 0, 0, 0, 1, 1,
1.229195, 0.6524672, 2.272397, 0, 0, 0, 1, 1,
1.229285, -0.5028521, 1.03416, 1, 1, 1, 1, 1,
1.230619, 0.8120787, -0.2099365, 1, 1, 1, 1, 1,
1.230664, 0.468503, 2.215463, 1, 1, 1, 1, 1,
1.231436, -1.743306, 2.599837, 1, 1, 1, 1, 1,
1.232673, 0.7590105, 0.7677343, 1, 1, 1, 1, 1,
1.23338, -1.783146, 4.281812, 1, 1, 1, 1, 1,
1.235494, 0.0101803, 3.706546, 1, 1, 1, 1, 1,
1.253129, -0.6513907, 1.396453, 1, 1, 1, 1, 1,
1.254658, 0.4685853, 0.5683549, 1, 1, 1, 1, 1,
1.257673, -0.07557946, 0.2440082, 1, 1, 1, 1, 1,
1.258299, 0.868804, -0.4795996, 1, 1, 1, 1, 1,
1.263522, 0.1080998, 0.6960321, 1, 1, 1, 1, 1,
1.274899, 1.157014, 0.739691, 1, 1, 1, 1, 1,
1.277473, 2.360174, -0.1765944, 1, 1, 1, 1, 1,
1.279451, -1.858602, 2.44644, 1, 1, 1, 1, 1,
1.280823, 0.7619272, 2.019611, 0, 0, 1, 1, 1,
1.284431, -0.03629047, 2.079409, 1, 0, 0, 1, 1,
1.288833, 1.157589, -0.3875315, 1, 0, 0, 1, 1,
1.295919, -0.950502, 1.40152, 1, 0, 0, 1, 1,
1.301275, -0.1469579, 3.601546, 1, 0, 0, 1, 1,
1.305475, 0.190959, 1.49872, 1, 0, 0, 1, 1,
1.31018, 0.2553653, 1.785846, 0, 0, 0, 1, 1,
1.318072, 0.3257391, 0.6682411, 0, 0, 0, 1, 1,
1.332473, 0.3151733, -1.390765, 0, 0, 0, 1, 1,
1.334941, 1.039074, 1.702174, 0, 0, 0, 1, 1,
1.338177, 1.147241, 2.468774, 0, 0, 0, 1, 1,
1.344546, 0.2264774, 1.264159, 0, 0, 0, 1, 1,
1.356801, 1.494457, 1.328096, 0, 0, 0, 1, 1,
1.360027, -0.9554138, 2.343824, 1, 1, 1, 1, 1,
1.37023, 0.3260867, 1.7877, 1, 1, 1, 1, 1,
1.381643, 1.02858, 1.113039, 1, 1, 1, 1, 1,
1.390382, 0.7777732, 1.002208, 1, 1, 1, 1, 1,
1.415472, -1.807512, 3.061241, 1, 1, 1, 1, 1,
1.418022, 0.08576496, 0.8649032, 1, 1, 1, 1, 1,
1.435591, -0.5953822, 1.155774, 1, 1, 1, 1, 1,
1.436567, -1.148825, 1.879424, 1, 1, 1, 1, 1,
1.444561, -0.7602292, 1.015185, 1, 1, 1, 1, 1,
1.448018, 0.4337043, 0.9283377, 1, 1, 1, 1, 1,
1.457179, 0.2489768, -0.09271237, 1, 1, 1, 1, 1,
1.45945, 0.610477, 0.06731337, 1, 1, 1, 1, 1,
1.465668, 0.07713132, 3.599944, 1, 1, 1, 1, 1,
1.466756, -0.5825932, 1.260476, 1, 1, 1, 1, 1,
1.475629, 0.3197965, 0.1097481, 1, 1, 1, 1, 1,
1.479675, 2.114808, -0.5029168, 0, 0, 1, 1, 1,
1.505444, 1.670474, 0.8525094, 1, 0, 0, 1, 1,
1.508093, 0.5112989, 1.76563, 1, 0, 0, 1, 1,
1.51112, 0.4051234, 1.085536, 1, 0, 0, 1, 1,
1.511337, -0.7609953, 2.264585, 1, 0, 0, 1, 1,
1.519589, 0.08630934, 1.416062, 1, 0, 0, 1, 1,
1.522227, 1.486615, -0.3491508, 0, 0, 0, 1, 1,
1.523811, -0.861619, 1.232709, 0, 0, 0, 1, 1,
1.527453, -0.03933488, 1.439937, 0, 0, 0, 1, 1,
1.536213, 0.6602417, 2.027853, 0, 0, 0, 1, 1,
1.539889, 0.1175442, 2.556995, 0, 0, 0, 1, 1,
1.544999, -0.8464741, 1.747436, 0, 0, 0, 1, 1,
1.551537, 0.9262562, 1.934479, 0, 0, 0, 1, 1,
1.558773, 0.9990596, 1.714991, 1, 1, 1, 1, 1,
1.560953, 0.6204416, 1.991545, 1, 1, 1, 1, 1,
1.609427, 0.849282, -0.08158304, 1, 1, 1, 1, 1,
1.617777, 1.77386, 0.7064568, 1, 1, 1, 1, 1,
1.620241, 0.04477391, 0.0473638, 1, 1, 1, 1, 1,
1.627724, -1.134705, 2.622166, 1, 1, 1, 1, 1,
1.638652, 0.6243067, -0.03363999, 1, 1, 1, 1, 1,
1.661359, 1.856109, 2.645298, 1, 1, 1, 1, 1,
1.666443, 0.7610319, 1.636599, 1, 1, 1, 1, 1,
1.669634, -0.3705349, 2.063238, 1, 1, 1, 1, 1,
1.693841, 0.8529058, 1.358587, 1, 1, 1, 1, 1,
1.71955, -1.272475, 2.222734, 1, 1, 1, 1, 1,
1.723415, 0.2919443, 1.493259, 1, 1, 1, 1, 1,
1.724303, 0.9582217, 2.121653, 1, 1, 1, 1, 1,
1.73331, -0.6568373, 1.042239, 1, 1, 1, 1, 1,
1.734603, 0.292087, 2.195334, 0, 0, 1, 1, 1,
1.739607, -1.151222, 1.500962, 1, 0, 0, 1, 1,
1.740658, 1.020235, 1.513755, 1, 0, 0, 1, 1,
1.758461, 1.970332, 0.9676864, 1, 0, 0, 1, 1,
1.776044, -1.073784, 3.174926, 1, 0, 0, 1, 1,
1.779507, -0.162624, 2.559716, 1, 0, 0, 1, 1,
1.787297, 1.197022, 1.31738, 0, 0, 0, 1, 1,
1.78868, -0.6455432, 1.392777, 0, 0, 0, 1, 1,
1.792707, 0.4279709, 1.466347, 0, 0, 0, 1, 1,
1.79452, -0.3006977, 2.363668, 0, 0, 0, 1, 1,
1.805582, 2.021221, -0.4272471, 0, 0, 0, 1, 1,
1.807994, -2.03031, 1.468116, 0, 0, 0, 1, 1,
1.820272, 0.08752527, 0.1303356, 0, 0, 0, 1, 1,
1.823489, 0.1685645, -0.3739175, 1, 1, 1, 1, 1,
1.824253, -0.8819745, 0.4526474, 1, 1, 1, 1, 1,
1.833064, 0.3203648, 2.05984, 1, 1, 1, 1, 1,
1.878679, 0.9475533, 1.139846, 1, 1, 1, 1, 1,
1.882439, 0.006874732, 3.061288, 1, 1, 1, 1, 1,
1.892491, 1.79791, 0.572744, 1, 1, 1, 1, 1,
1.944732, 0.09633416, 1.136147, 1, 1, 1, 1, 1,
2.009978, -0.02268037, 0.06949375, 1, 1, 1, 1, 1,
2.018281, 0.1193132, 3.426679, 1, 1, 1, 1, 1,
2.025108, -0.8402178, 2.27061, 1, 1, 1, 1, 1,
2.039438, 0.6199967, 0.8584703, 1, 1, 1, 1, 1,
2.081488, -2.728981, 2.629191, 1, 1, 1, 1, 1,
2.090073, -0.9202878, 3.574788, 1, 1, 1, 1, 1,
2.112342, -0.2412291, 2.803018, 1, 1, 1, 1, 1,
2.127019, 0.5599543, 1.990948, 1, 1, 1, 1, 1,
2.12736, -2.063056, 1.623408, 0, 0, 1, 1, 1,
2.152797, 0.920087, 1.674046, 1, 0, 0, 1, 1,
2.164591, 1.030513, -0.6189527, 1, 0, 0, 1, 1,
2.170876, -0.25641, 2.318078, 1, 0, 0, 1, 1,
2.217806, -0.8486649, 1.702305, 1, 0, 0, 1, 1,
2.238458, -0.284555, 1.724629, 1, 0, 0, 1, 1,
2.270194, -1.756414, 2.881022, 0, 0, 0, 1, 1,
2.280045, -0.9128551, 1.894045, 0, 0, 0, 1, 1,
2.427831, 0.7003418, 3.010139, 0, 0, 0, 1, 1,
2.428476, -0.4854601, 1.134945, 0, 0, 0, 1, 1,
2.446219, -0.696063, 1.61437, 0, 0, 0, 1, 1,
2.503295, -2.096939, 2.585809, 0, 0, 0, 1, 1,
2.526839, 1.209956, 3.548655, 0, 0, 0, 1, 1,
2.535109, -1.096072, 2.853283, 1, 1, 1, 1, 1,
2.68308, -1.503622, 1.68568, 1, 1, 1, 1, 1,
2.707395, -1.689517, 2.578752, 1, 1, 1, 1, 1,
2.75253, 0.2619266, -0.1093412, 1, 1, 1, 1, 1,
2.753235, 0.2330535, 2.508001, 1, 1, 1, 1, 1,
3.149472, -1.644959, 2.661495, 1, 1, 1, 1, 1,
3.34825, -0.1027573, 1.606956, 1, 1, 1, 1, 1
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
var radius = 9.25004;
var distance = 32.49037;
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
mvMatrix.translate( -0.2695022, 0.4597273, -0.02424693 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.49037);
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
