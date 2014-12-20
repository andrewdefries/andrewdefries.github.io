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
-3.057674, -0.5855118, -0.1769819, 1, 0, 0, 1,
-3.045461, 0.1598804, 0.5952276, 1, 0.007843138, 0, 1,
-3.027778, -0.02203967, -1.902163, 1, 0.01176471, 0, 1,
-2.873677, -0.9038957, -1.849258, 1, 0.01960784, 0, 1,
-2.756108, 0.01944136, -2.475283, 1, 0.02352941, 0, 1,
-2.704694, -0.7184603, -3.073119, 1, 0.03137255, 0, 1,
-2.630049, 1.395584, -1.691703, 1, 0.03529412, 0, 1,
-2.622903, -2.851317, -2.589742, 1, 0.04313726, 0, 1,
-2.388019, -1.382836, -2.34811, 1, 0.04705882, 0, 1,
-2.379977, -0.382813, -2.184024, 1, 0.05490196, 0, 1,
-2.33942, 0.2139969, -0.4522141, 1, 0.05882353, 0, 1,
-2.323405, 1.089721, -1.797849, 1, 0.06666667, 0, 1,
-2.249737, -0.3625647, -0.8530513, 1, 0.07058824, 0, 1,
-2.210783, 0.9038336, 0.3003077, 1, 0.07843138, 0, 1,
-2.176825, -0.5750038, -1.116343, 1, 0.08235294, 0, 1,
-2.147696, 0.08108136, -1.1769, 1, 0.09019608, 0, 1,
-2.143786, 0.8661965, -2.26601, 1, 0.09411765, 0, 1,
-2.141237, 1.682777, -1.849464, 1, 0.1019608, 0, 1,
-2.100608, 0.3432195, -1.501022, 1, 0.1098039, 0, 1,
-2.091619, -2.057483, -2.931205, 1, 0.1137255, 0, 1,
-2.073726, 1.909991, -0.2697434, 1, 0.1215686, 0, 1,
-2.043804, -0.04745509, -1.58943, 1, 0.1254902, 0, 1,
-2.041133, -0.3285829, -0.8788552, 1, 0.1333333, 0, 1,
-2.04104, 0.9591709, -1.635206, 1, 0.1372549, 0, 1,
-2.010236, -1.314156, -1.414701, 1, 0.145098, 0, 1,
-1.998546, 0.2525115, -0.971375, 1, 0.1490196, 0, 1,
-1.994405, -0.6505103, -1.131214, 1, 0.1568628, 0, 1,
-1.955419, -1.470256, -0.6636546, 1, 0.1607843, 0, 1,
-1.945378, 0.3235935, -1.997234, 1, 0.1686275, 0, 1,
-1.910118, 0.7064166, -0.01033387, 1, 0.172549, 0, 1,
-1.90928, 0.8699685, -0.4608036, 1, 0.1803922, 0, 1,
-1.89842, -0.1552381, -1.548938, 1, 0.1843137, 0, 1,
-1.897411, 0.2292525, -1.383283, 1, 0.1921569, 0, 1,
-1.885849, 0.7979085, -1.572889, 1, 0.1960784, 0, 1,
-1.883967, 0.2450114, -0.2954413, 1, 0.2039216, 0, 1,
-1.873758, 0.4236026, -0.3832882, 1, 0.2117647, 0, 1,
-1.848855, 0.1295667, -1.607876, 1, 0.2156863, 0, 1,
-1.841057, 1.173541, -0.7838081, 1, 0.2235294, 0, 1,
-1.833325, 0.3945488, -1.462946, 1, 0.227451, 0, 1,
-1.83193, -2.256267, -4.264865, 1, 0.2352941, 0, 1,
-1.802287, 1.722561, -2.102017, 1, 0.2392157, 0, 1,
-1.793735, 1.17545, -1.095271, 1, 0.2470588, 0, 1,
-1.784886, 0.9268035, -1.478599, 1, 0.2509804, 0, 1,
-1.781622, 1.303306, -1.168842, 1, 0.2588235, 0, 1,
-1.771993, 0.3575993, -2.560734, 1, 0.2627451, 0, 1,
-1.766159, -0.09687953, -1.752694, 1, 0.2705882, 0, 1,
-1.766126, 0.4982267, -0.5627118, 1, 0.2745098, 0, 1,
-1.764979, 0.03754662, -0.8370278, 1, 0.282353, 0, 1,
-1.761974, -1.172899, -1.04482, 1, 0.2862745, 0, 1,
-1.749509, 0.8166825, -0.7784417, 1, 0.2941177, 0, 1,
-1.74143, -0.6193881, -2.650105, 1, 0.3019608, 0, 1,
-1.729959, -0.1680879, -2.122896, 1, 0.3058824, 0, 1,
-1.725209, 0.9591572, -2.572699, 1, 0.3137255, 0, 1,
-1.723017, 1.350878, -0.5680572, 1, 0.3176471, 0, 1,
-1.722816, 1.584539, 0.1204029, 1, 0.3254902, 0, 1,
-1.707317, -0.1598681, -2.324536, 1, 0.3294118, 0, 1,
-1.705766, 1.502989, 0.06248438, 1, 0.3372549, 0, 1,
-1.698281, 1.388219, -1.704473, 1, 0.3411765, 0, 1,
-1.688621, 0.09402909, -1.400897, 1, 0.3490196, 0, 1,
-1.685061, -0.2922762, -2.611542, 1, 0.3529412, 0, 1,
-1.663934, -0.1328363, -1.748564, 1, 0.3607843, 0, 1,
-1.661718, -1.236604, -3.6921, 1, 0.3647059, 0, 1,
-1.641067, -0.09346543, -1.848152, 1, 0.372549, 0, 1,
-1.632404, -1.27648, -2.870694, 1, 0.3764706, 0, 1,
-1.599829, 0.07932884, 0.06563434, 1, 0.3843137, 0, 1,
-1.598414, -0.3695232, -0.1190221, 1, 0.3882353, 0, 1,
-1.591306, -0.06346875, -2.473866, 1, 0.3960784, 0, 1,
-1.588349, 0.5447125, -2.36316, 1, 0.4039216, 0, 1,
-1.581667, -1.458041, -3.176866, 1, 0.4078431, 0, 1,
-1.558187, 0.5313292, -0.9221855, 1, 0.4156863, 0, 1,
-1.554136, 2.480656, -0.6005925, 1, 0.4196078, 0, 1,
-1.552833, -0.2019871, -2.158606, 1, 0.427451, 0, 1,
-1.552831, 0.2358291, -1.812879, 1, 0.4313726, 0, 1,
-1.551616, -0.04826946, -1.013911, 1, 0.4392157, 0, 1,
-1.544318, 0.1367889, -1.326612, 1, 0.4431373, 0, 1,
-1.542182, 2.462672, -0.20746, 1, 0.4509804, 0, 1,
-1.539309, -0.3374938, -2.185386, 1, 0.454902, 0, 1,
-1.522203, -0.7274452, -2.994192, 1, 0.4627451, 0, 1,
-1.498866, -0.1547485, 1.05462, 1, 0.4666667, 0, 1,
-1.496863, 0.4586935, -2.145043, 1, 0.4745098, 0, 1,
-1.481724, -0.02010402, -3.668907, 1, 0.4784314, 0, 1,
-1.471103, -0.3997906, -2.080362, 1, 0.4862745, 0, 1,
-1.47037, 0.4956338, -1.085138, 1, 0.4901961, 0, 1,
-1.457312, 0.6909733, -3.785672, 1, 0.4980392, 0, 1,
-1.456728, 0.1233741, -0.1470524, 1, 0.5058824, 0, 1,
-1.447414, 0.1857971, -1.782811, 1, 0.509804, 0, 1,
-1.427858, 1.525209, 1.780312, 1, 0.5176471, 0, 1,
-1.427471, 1.580765, 1.156479, 1, 0.5215687, 0, 1,
-1.404526, 0.314865, -2.025881, 1, 0.5294118, 0, 1,
-1.402712, 0.1918803, -0.6074457, 1, 0.5333334, 0, 1,
-1.383872, -1.910216, -2.880551, 1, 0.5411765, 0, 1,
-1.38357, -1.59709, -2.895937, 1, 0.5450981, 0, 1,
-1.37884, -1.886743, -3.196308, 1, 0.5529412, 0, 1,
-1.352284, -0.1749749, -0.975349, 1, 0.5568628, 0, 1,
-1.350081, 2.195552, -0.6480104, 1, 0.5647059, 0, 1,
-1.349956, 0.9516535, -1.425935, 1, 0.5686275, 0, 1,
-1.342378, -0.2851995, -1.608044, 1, 0.5764706, 0, 1,
-1.340369, -0.1930446, -1.818905, 1, 0.5803922, 0, 1,
-1.338325, -0.5407983, -3.439469, 1, 0.5882353, 0, 1,
-1.337944, -0.2008722, -2.66321, 1, 0.5921569, 0, 1,
-1.337766, -0.3765795, -1.005574, 1, 0.6, 0, 1,
-1.333634, 0.5689726, -0.4666065, 1, 0.6078432, 0, 1,
-1.328194, -0.5892514, -2.804389, 1, 0.6117647, 0, 1,
-1.318954, 0.5646415, -1.072344, 1, 0.6196079, 0, 1,
-1.316958, -0.5173046, -0.8233926, 1, 0.6235294, 0, 1,
-1.314639, -0.1435566, -3.10242, 1, 0.6313726, 0, 1,
-1.311669, -0.5084968, -1.301055, 1, 0.6352941, 0, 1,
-1.305062, -0.1857589, -2.223531, 1, 0.6431373, 0, 1,
-1.289686, 1.105489, -0.8959368, 1, 0.6470588, 0, 1,
-1.28956, 1.238012, -1.272459, 1, 0.654902, 0, 1,
-1.284383, -0.2707798, -0.7238396, 1, 0.6588235, 0, 1,
-1.281729, -0.134736, -1.829411, 1, 0.6666667, 0, 1,
-1.258496, -0.5411977, -2.057413, 1, 0.6705883, 0, 1,
-1.256411, -1.254713, -2.213929, 1, 0.6784314, 0, 1,
-1.246127, 1.515939, -1.091658, 1, 0.682353, 0, 1,
-1.22069, 0.1412755, -0.3712009, 1, 0.6901961, 0, 1,
-1.217898, -0.2187951, -2.582464, 1, 0.6941177, 0, 1,
-1.217329, -0.08674164, -1.278595, 1, 0.7019608, 0, 1,
-1.217321, -0.6089507, -1.619432, 1, 0.7098039, 0, 1,
-1.203991, -0.05669626, -1.402102, 1, 0.7137255, 0, 1,
-1.201875, 0.01419558, -0.4950219, 1, 0.7215686, 0, 1,
-1.199902, 0.7853653, -0.9516272, 1, 0.7254902, 0, 1,
-1.183607, 0.05986976, -0.02849468, 1, 0.7333333, 0, 1,
-1.173338, 1.622877, -0.4624849, 1, 0.7372549, 0, 1,
-1.169615, -0.5897852, -1.645669, 1, 0.7450981, 0, 1,
-1.166897, -2.160448, -1.305779, 1, 0.7490196, 0, 1,
-1.166665, -0.7643389, -2.586496, 1, 0.7568628, 0, 1,
-1.160447, -1.226946, -3.274914, 1, 0.7607843, 0, 1,
-1.156608, -0.9783359, -2.055447, 1, 0.7686275, 0, 1,
-1.153863, -1.648089, -1.285684, 1, 0.772549, 0, 1,
-1.144056, -1.18201, -3.247308, 1, 0.7803922, 0, 1,
-1.143803, -0.3514407, -4.73665, 1, 0.7843137, 0, 1,
-1.13749, -0.103387, -1.784101, 1, 0.7921569, 0, 1,
-1.134871, 0.7323717, -2.687032, 1, 0.7960784, 0, 1,
-1.133079, -1.347423, -2.495183, 1, 0.8039216, 0, 1,
-1.130716, -0.2191003, -2.504178, 1, 0.8117647, 0, 1,
-1.113698, -0.799713, -1.839838, 1, 0.8156863, 0, 1,
-1.112925, 0.3465889, -2.770223, 1, 0.8235294, 0, 1,
-1.111255, 0.7629966, 0.2792436, 1, 0.827451, 0, 1,
-1.108637, -1.106502, -1.350002, 1, 0.8352941, 0, 1,
-1.09613, -0.6651678, -1.228736, 1, 0.8392157, 0, 1,
-1.088641, 0.890956, -0.58441, 1, 0.8470588, 0, 1,
-1.083342, -1.08066, -3.86526, 1, 0.8509804, 0, 1,
-1.076108, -1.731996, -2.479466, 1, 0.8588235, 0, 1,
-1.054495, -0.60548, -3.102833, 1, 0.8627451, 0, 1,
-1.032554, 0.6881863, -0.05222965, 1, 0.8705882, 0, 1,
-1.031673, 0.9449856, -1.480685, 1, 0.8745098, 0, 1,
-1.031245, 0.1104211, -1.506192, 1, 0.8823529, 0, 1,
-1.030478, 1.245998, -1.308825, 1, 0.8862745, 0, 1,
-1.029562, 0.438331, -0.8342466, 1, 0.8941177, 0, 1,
-1.013769, -0.7695827, -1.619322, 1, 0.8980392, 0, 1,
-1.00832, 0.1780203, -0.759872, 1, 0.9058824, 0, 1,
-1.00777, -0.9728642, -2.384286, 1, 0.9137255, 0, 1,
-0.995384, -2.196131, -1.272268, 1, 0.9176471, 0, 1,
-0.9884689, 0.8751334, -1.758739, 1, 0.9254902, 0, 1,
-0.9674554, -0.3992535, -2.64107, 1, 0.9294118, 0, 1,
-0.9666453, 0.1249304, 0.08810526, 1, 0.9372549, 0, 1,
-0.9537733, -1.630394, -1.785361, 1, 0.9411765, 0, 1,
-0.9516497, -0.6072609, -2.701528, 1, 0.9490196, 0, 1,
-0.9512864, 1.123009, -1.166656, 1, 0.9529412, 0, 1,
-0.9511518, 2.428066, -0.411007, 1, 0.9607843, 0, 1,
-0.9459075, 0.3947978, -0.1947587, 1, 0.9647059, 0, 1,
-0.9439493, 1.183884, 0.5106614, 1, 0.972549, 0, 1,
-0.9422663, -0.8914892, -1.00432, 1, 0.9764706, 0, 1,
-0.9404264, -1.339668, -0.03288637, 1, 0.9843137, 0, 1,
-0.9383845, -0.1578601, -3.461317, 1, 0.9882353, 0, 1,
-0.9355412, -0.7432026, -2.765573, 1, 0.9960784, 0, 1,
-0.9184425, 0.2529674, -0.8567508, 0.9960784, 1, 0, 1,
-0.9130229, -0.7308639, -1.204717, 0.9921569, 1, 0, 1,
-0.9075156, 1.830401, 0.4462119, 0.9843137, 1, 0, 1,
-0.9043561, 1.557647, -0.6487096, 0.9803922, 1, 0, 1,
-0.9028922, -0.8499576, -2.587442, 0.972549, 1, 0, 1,
-0.9022995, -0.6404091, -1.762397, 0.9686275, 1, 0, 1,
-0.9014653, -0.9393763, -2.067171, 0.9607843, 1, 0, 1,
-0.8993651, -0.2269957, -3.01666, 0.9568627, 1, 0, 1,
-0.8908367, 1.4545, 0.5989559, 0.9490196, 1, 0, 1,
-0.882057, -1.562407, -2.356394, 0.945098, 1, 0, 1,
-0.880795, -2.180394, -0.9350145, 0.9372549, 1, 0, 1,
-0.8788261, -0.3961032, -1.047428, 0.9333333, 1, 0, 1,
-0.8753443, 0.2167336, -2.521914, 0.9254902, 1, 0, 1,
-0.8634458, -1.4053, -1.261385, 0.9215686, 1, 0, 1,
-0.8496873, 2.313101, 0.1076156, 0.9137255, 1, 0, 1,
-0.8483346, 1.5556, -1.559686, 0.9098039, 1, 0, 1,
-0.848276, -0.1026681, -3.300145, 0.9019608, 1, 0, 1,
-0.8434509, 0.3515421, -0.9246451, 0.8941177, 1, 0, 1,
-0.8384847, 1.869952, -1.213435, 0.8901961, 1, 0, 1,
-0.8382795, 0.2083647, -2.44305, 0.8823529, 1, 0, 1,
-0.8355201, 2.213952, -0.8113797, 0.8784314, 1, 0, 1,
-0.8335166, 0.9221783, 1.122956, 0.8705882, 1, 0, 1,
-0.8331866, -0.4646408, -1.330613, 0.8666667, 1, 0, 1,
-0.8299831, -0.9908807, -1.265961, 0.8588235, 1, 0, 1,
-0.8297231, 0.0184256, -2.717278, 0.854902, 1, 0, 1,
-0.8228515, -0.359841, -0.3396511, 0.8470588, 1, 0, 1,
-0.8227379, -1.21771, -1.104175, 0.8431373, 1, 0, 1,
-0.8211613, -0.1437103, -2.873946, 0.8352941, 1, 0, 1,
-0.8209794, -1.190307, -2.665258, 0.8313726, 1, 0, 1,
-0.8167545, -0.1332681, -2.443622, 0.8235294, 1, 0, 1,
-0.8160934, -0.4573886, -3.307781, 0.8196079, 1, 0, 1,
-0.8151623, 0.8016793, -1.287588, 0.8117647, 1, 0, 1,
-0.8127525, -0.255264, -2.745058, 0.8078431, 1, 0, 1,
-0.8092602, 0.3932409, -0.3006582, 0.8, 1, 0, 1,
-0.8083884, 0.9956002, -0.2372003, 0.7921569, 1, 0, 1,
-0.8070306, -0.1603599, -1.371305, 0.7882353, 1, 0, 1,
-0.8005859, 1.273685, -2.804698, 0.7803922, 1, 0, 1,
-0.792668, 1.999268, -0.9920008, 0.7764706, 1, 0, 1,
-0.7916033, -0.4264426, -1.101433, 0.7686275, 1, 0, 1,
-0.7906995, -2.18259, -2.785235, 0.7647059, 1, 0, 1,
-0.7903385, -1.39385, -4.179634, 0.7568628, 1, 0, 1,
-0.7847106, -1.984464, -0.5985855, 0.7529412, 1, 0, 1,
-0.7841163, 0.2193364, -0.8684441, 0.7450981, 1, 0, 1,
-0.7835951, 0.7245284, -0.7858853, 0.7411765, 1, 0, 1,
-0.7821845, -0.03246044, -2.614261, 0.7333333, 1, 0, 1,
-0.7773407, 0.7908345, -0.04005773, 0.7294118, 1, 0, 1,
-0.7765034, -1.270394, -2.305538, 0.7215686, 1, 0, 1,
-0.7759916, 0.8454092, -1.527, 0.7176471, 1, 0, 1,
-0.7724886, 0.007525955, -0.8250654, 0.7098039, 1, 0, 1,
-0.7723517, 0.0805708, -1.815564, 0.7058824, 1, 0, 1,
-0.7678126, 1.246031, -0.4520558, 0.6980392, 1, 0, 1,
-0.7672006, 1.119143, -1.222557, 0.6901961, 1, 0, 1,
-0.7632604, -0.9692934, -1.061108, 0.6862745, 1, 0, 1,
-0.7614026, 1.095659, -0.8912029, 0.6784314, 1, 0, 1,
-0.7572761, 0.6184759, -1.397545, 0.6745098, 1, 0, 1,
-0.7509692, -0.2762626, -2.85336, 0.6666667, 1, 0, 1,
-0.748945, 0.3837115, -0.5956466, 0.6627451, 1, 0, 1,
-0.7428496, -0.9906334, -2.92844, 0.654902, 1, 0, 1,
-0.7376816, -0.6854954, -2.595595, 0.6509804, 1, 0, 1,
-0.7357723, -1.23521, -1.351812, 0.6431373, 1, 0, 1,
-0.7328729, 0.1237301, -1.088764, 0.6392157, 1, 0, 1,
-0.7292758, 1.272988, 0.157047, 0.6313726, 1, 0, 1,
-0.727794, 0.1871263, -1.7584, 0.627451, 1, 0, 1,
-0.7261799, -1.460401, -3.056128, 0.6196079, 1, 0, 1,
-0.7258894, 1.087834, -0.5119721, 0.6156863, 1, 0, 1,
-0.7241936, 0.1565066, -2.204292, 0.6078432, 1, 0, 1,
-0.7188462, -0.2170055, -2.943837, 0.6039216, 1, 0, 1,
-0.716566, 0.1464669, -2.254628, 0.5960785, 1, 0, 1,
-0.7140266, -0.9916262, -3.040075, 0.5882353, 1, 0, 1,
-0.7136855, 0.04622991, -2.652387, 0.5843138, 1, 0, 1,
-0.7129799, 2.333017, -0.6689662, 0.5764706, 1, 0, 1,
-0.7122831, -0.3346777, -2.209977, 0.572549, 1, 0, 1,
-0.7112116, -0.4512804, -0.2010578, 0.5647059, 1, 0, 1,
-0.7111939, 0.2209466, 0.2187799, 0.5607843, 1, 0, 1,
-0.7050103, -0.6861752, -3.43827, 0.5529412, 1, 0, 1,
-0.7042441, 1.887532, -0.4816584, 0.5490196, 1, 0, 1,
-0.6996648, 0.1268505, -0.5013283, 0.5411765, 1, 0, 1,
-0.6989757, 1.419619, -1.049178, 0.5372549, 1, 0, 1,
-0.6980389, -0.5158909, -2.012899, 0.5294118, 1, 0, 1,
-0.6926075, 1.326054, 0.4829788, 0.5254902, 1, 0, 1,
-0.6917192, -0.7166832, -0.8876327, 0.5176471, 1, 0, 1,
-0.6914936, 0.07132029, -0.6139801, 0.5137255, 1, 0, 1,
-0.6884649, 0.07038429, -2.96446, 0.5058824, 1, 0, 1,
-0.6847126, 1.767896, -0.7169898, 0.5019608, 1, 0, 1,
-0.6770545, -2.166769, -2.530188, 0.4941176, 1, 0, 1,
-0.6750798, 2.217708, -1.058848, 0.4862745, 1, 0, 1,
-0.6745017, 0.5212777, -0.07548527, 0.4823529, 1, 0, 1,
-0.6735466, 0.5048871, 1.4412, 0.4745098, 1, 0, 1,
-0.6714801, -0.5221901, -2.050601, 0.4705882, 1, 0, 1,
-0.6659396, -0.6223609, -3.870934, 0.4627451, 1, 0, 1,
-0.6632511, -0.1786948, -1.044722, 0.4588235, 1, 0, 1,
-0.6600199, 1.536187, 0.02890341, 0.4509804, 1, 0, 1,
-0.6589359, 3.280559, 0.420069, 0.4470588, 1, 0, 1,
-0.6548676, 0.858844, -2.305106, 0.4392157, 1, 0, 1,
-0.6497393, -0.2552863, -3.154694, 0.4352941, 1, 0, 1,
-0.6487237, 0.2797919, -1.160033, 0.427451, 1, 0, 1,
-0.6394991, -2.195261, -2.312926, 0.4235294, 1, 0, 1,
-0.6392035, 0.9340072, -0.323215, 0.4156863, 1, 0, 1,
-0.6340833, -1.431802, -2.372228, 0.4117647, 1, 0, 1,
-0.6300098, -1.170651, -2.053427, 0.4039216, 1, 0, 1,
-0.6196647, 0.9104326, -3.51232, 0.3960784, 1, 0, 1,
-0.6196535, 0.7889696, -2.142728, 0.3921569, 1, 0, 1,
-0.6158035, -1.63547, -2.839468, 0.3843137, 1, 0, 1,
-0.6099892, 1.819445, -0.001192286, 0.3803922, 1, 0, 1,
-0.6074589, -0.7640297, -1.883306, 0.372549, 1, 0, 1,
-0.6021719, -0.9094526, -0.9247174, 0.3686275, 1, 0, 1,
-0.5996773, 0.3827595, -1.525555, 0.3607843, 1, 0, 1,
-0.5973291, -0.5336865, -1.552177, 0.3568628, 1, 0, 1,
-0.5965996, -1.934296, -2.255477, 0.3490196, 1, 0, 1,
-0.5962625, -0.8876859, -2.621478, 0.345098, 1, 0, 1,
-0.5956407, 0.3459556, 1.053711, 0.3372549, 1, 0, 1,
-0.5953068, -0.9782, -3.610781, 0.3333333, 1, 0, 1,
-0.591351, -0.9322786, -2.849722, 0.3254902, 1, 0, 1,
-0.5904709, 0.7715667, 0.5489799, 0.3215686, 1, 0, 1,
-0.5903418, -1.013903, -1.000958, 0.3137255, 1, 0, 1,
-0.5841648, 0.3199683, -0.9787137, 0.3098039, 1, 0, 1,
-0.5826952, -0.8540419, -0.1512635, 0.3019608, 1, 0, 1,
-0.5822233, 0.4426426, -0.6911446, 0.2941177, 1, 0, 1,
-0.5812367, 1.873214, 0.1914587, 0.2901961, 1, 0, 1,
-0.5780188, -0.4191362, -0.7658567, 0.282353, 1, 0, 1,
-0.5762346, -1.513459, -1.344461, 0.2784314, 1, 0, 1,
-0.5761691, -1.228021, -1.749452, 0.2705882, 1, 0, 1,
-0.5747132, -2.052808, -4.40481, 0.2666667, 1, 0, 1,
-0.5719733, -0.4957169, -4.053696, 0.2588235, 1, 0, 1,
-0.5675185, 2.917281, 0.9612545, 0.254902, 1, 0, 1,
-0.5674076, -0.3206817, -3.134959, 0.2470588, 1, 0, 1,
-0.5654603, 0.7722988, -0.3310142, 0.2431373, 1, 0, 1,
-0.5501576, 0.104239, -3.02941, 0.2352941, 1, 0, 1,
-0.5436814, -0.1434377, -3.788095, 0.2313726, 1, 0, 1,
-0.5418216, -1.553986, -2.002981, 0.2235294, 1, 0, 1,
-0.5369622, 0.2382445, -2.210417, 0.2196078, 1, 0, 1,
-0.5350422, -1.915789, -3.52963, 0.2117647, 1, 0, 1,
-0.5340092, 0.04647398, -2.732394, 0.2078431, 1, 0, 1,
-0.5303701, 0.52767, -1.990567, 0.2, 1, 0, 1,
-0.5281745, 0.2297552, -0.3108362, 0.1921569, 1, 0, 1,
-0.5268893, 1.457115, -0.3807792, 0.1882353, 1, 0, 1,
-0.5267459, -0.1887507, -1.024933, 0.1803922, 1, 0, 1,
-0.5178849, -0.210607, -2.510744, 0.1764706, 1, 0, 1,
-0.5159851, 0.2626325, -2.232424, 0.1686275, 1, 0, 1,
-0.5079971, 0.1477601, -1.949502, 0.1647059, 1, 0, 1,
-0.5057308, 0.03051951, -1.784545, 0.1568628, 1, 0, 1,
-0.5056208, 1.145666, -2.607367, 0.1529412, 1, 0, 1,
-0.4974227, -0.7692234, -2.876867, 0.145098, 1, 0, 1,
-0.4947208, 0.6532987, -2.078053, 0.1411765, 1, 0, 1,
-0.4921678, -1.107571, -2.244211, 0.1333333, 1, 0, 1,
-0.4890332, -0.2911629, -1.647741, 0.1294118, 1, 0, 1,
-0.4880089, 1.105684, 0.1405547, 0.1215686, 1, 0, 1,
-0.4858092, 0.8421483, -1.068414, 0.1176471, 1, 0, 1,
-0.48091, 1.53883, 0.2776513, 0.1098039, 1, 0, 1,
-0.4731299, 0.008142996, -0.5340574, 0.1058824, 1, 0, 1,
-0.4663216, 1.498238, 0.1376816, 0.09803922, 1, 0, 1,
-0.4662716, 0.6182481, -0.1403144, 0.09019608, 1, 0, 1,
-0.4652402, -0.9826991, -1.620575, 0.08627451, 1, 0, 1,
-0.4638326, -0.3305031, -3.324876, 0.07843138, 1, 0, 1,
-0.4635686, 1.045895, -0.1441735, 0.07450981, 1, 0, 1,
-0.4615033, 0.5376182, -1.558021, 0.06666667, 1, 0, 1,
-0.4554255, -0.6890514, -2.560922, 0.0627451, 1, 0, 1,
-0.4547225, -1.47737, -3.668915, 0.05490196, 1, 0, 1,
-0.4531801, -0.5314866, -1.667054, 0.05098039, 1, 0, 1,
-0.4430403, 0.06576755, 0.3454731, 0.04313726, 1, 0, 1,
-0.4403462, 0.4027699, -0.5512798, 0.03921569, 1, 0, 1,
-0.43916, -0.7261871, -2.557962, 0.03137255, 1, 0, 1,
-0.4370024, 0.6483715, -1.215963, 0.02745098, 1, 0, 1,
-0.4358633, -0.5624278, -2.248194, 0.01960784, 1, 0, 1,
-0.433555, -0.1338012, -0.2517067, 0.01568628, 1, 0, 1,
-0.4331235, 0.9801655, -0.958416, 0.007843138, 1, 0, 1,
-0.4327002, 0.8741316, -0.05514898, 0.003921569, 1, 0, 1,
-0.43067, 0.04262266, -1.740939, 0, 1, 0.003921569, 1,
-0.4301863, -0.9965987, -2.309919, 0, 1, 0.01176471, 1,
-0.4301106, -0.04119036, -1.352809, 0, 1, 0.01568628, 1,
-0.425981, 0.3010536, -0.973015, 0, 1, 0.02352941, 1,
-0.4248579, -1.323443, -2.742753, 0, 1, 0.02745098, 1,
-0.4219701, 0.01861403, -2.196853, 0, 1, 0.03529412, 1,
-0.4209152, -0.2909252, -0.7739703, 0, 1, 0.03921569, 1,
-0.4165632, 0.1608191, 0.3547908, 0, 1, 0.04705882, 1,
-0.4154992, 0.3511987, -1.706009, 0, 1, 0.05098039, 1,
-0.4134145, 0.6073533, 0.3046706, 0, 1, 0.05882353, 1,
-0.4119399, 0.0891419, -2.613735, 0, 1, 0.0627451, 1,
-0.4111466, -0.3273265, -2.284163, 0, 1, 0.07058824, 1,
-0.4018657, 1.304415, 0.8328967, 0, 1, 0.07450981, 1,
-0.3990379, 0.3665607, -0.808796, 0, 1, 0.08235294, 1,
-0.3957622, -0.2953392, -2.312871, 0, 1, 0.08627451, 1,
-0.3891568, -0.3881864, -1.364948, 0, 1, 0.09411765, 1,
-0.389102, -0.8865471, -1.057139, 0, 1, 0.1019608, 1,
-0.3846371, 1.471545, 0.9576946, 0, 1, 0.1058824, 1,
-0.3845985, 1.52602, -1.262217, 0, 1, 0.1137255, 1,
-0.3808101, 1.327186, -0.04875833, 0, 1, 0.1176471, 1,
-0.3799985, -0.4641095, -2.21799, 0, 1, 0.1254902, 1,
-0.3795861, -0.5758215, -3.799953, 0, 1, 0.1294118, 1,
-0.3757575, 0.573836, -0.08994703, 0, 1, 0.1372549, 1,
-0.3738521, 0.9120852, -0.8338557, 0, 1, 0.1411765, 1,
-0.3737697, 0.0660066, -1.078919, 0, 1, 0.1490196, 1,
-0.3657771, 1.522026, -0.05072287, 0, 1, 0.1529412, 1,
-0.3638699, -0.9258229, -3.113066, 0, 1, 0.1607843, 1,
-0.3616017, 0.04123032, 0.08861203, 0, 1, 0.1647059, 1,
-0.3611116, -0.4078993, -3.442597, 0, 1, 0.172549, 1,
-0.3601868, 0.4958944, -0.2645143, 0, 1, 0.1764706, 1,
-0.3567626, 0.09087491, -2.006908, 0, 1, 0.1843137, 1,
-0.3539898, -0.9233546, -2.304976, 0, 1, 0.1882353, 1,
-0.3473781, -0.9232027, -1.455526, 0, 1, 0.1960784, 1,
-0.3467022, -0.1275259, -2.167271, 0, 1, 0.2039216, 1,
-0.3453341, -0.5660384, -4.601078, 0, 1, 0.2078431, 1,
-0.3450268, -0.3496347, -2.70521, 0, 1, 0.2156863, 1,
-0.3431646, 1.655334, -0.4875962, 0, 1, 0.2196078, 1,
-0.3420076, 0.2477089, -2.874171, 0, 1, 0.227451, 1,
-0.341581, -1.89536, -4.446932, 0, 1, 0.2313726, 1,
-0.3319469, -2.658683, -1.762626, 0, 1, 0.2392157, 1,
-0.3244978, 0.08679637, -1.463462, 0, 1, 0.2431373, 1,
-0.3235665, 0.02528768, -1.142232, 0, 1, 0.2509804, 1,
-0.3204029, -1.418701, -4.265315, 0, 1, 0.254902, 1,
-0.3202153, 1.721177, -0.7557369, 0, 1, 0.2627451, 1,
-0.3193089, -3.267348, -2.226839, 0, 1, 0.2666667, 1,
-0.3180239, -0.02562858, -1.273307, 0, 1, 0.2745098, 1,
-0.3147456, 0.6973194, -0.2098983, 0, 1, 0.2784314, 1,
-0.3140449, -0.07917161, -2.264835, 0, 1, 0.2862745, 1,
-0.3100733, -0.01914268, -3.458231, 0, 1, 0.2901961, 1,
-0.309159, -0.7332973, -3.582859, 0, 1, 0.2980392, 1,
-0.3084113, 1.25343, -1.894036, 0, 1, 0.3058824, 1,
-0.308325, 1.6959, 0.9865905, 0, 1, 0.3098039, 1,
-0.3011575, 0.2483497, -0.8696952, 0, 1, 0.3176471, 1,
-0.2868176, -1.42749, -3.143467, 0, 1, 0.3215686, 1,
-0.2868157, -0.7298056, -2.535443, 0, 1, 0.3294118, 1,
-0.2857391, -0.2791638, -2.091079, 0, 1, 0.3333333, 1,
-0.2820465, -1.621618, -3.850001, 0, 1, 0.3411765, 1,
-0.2763392, 1.303728, 0.3905397, 0, 1, 0.345098, 1,
-0.2689126, 0.3050417, -0.05593694, 0, 1, 0.3529412, 1,
-0.2675772, -0.9395424, -3.136031, 0, 1, 0.3568628, 1,
-0.2648753, -0.634852, -2.656875, 0, 1, 0.3647059, 1,
-0.2600427, 1.468007, -2.620854, 0, 1, 0.3686275, 1,
-0.2590144, -0.1997736, -2.724924, 0, 1, 0.3764706, 1,
-0.256353, 0.2127002, 1.158305, 0, 1, 0.3803922, 1,
-0.2538258, -0.1641548, -1.552655, 0, 1, 0.3882353, 1,
-0.2502099, -0.003545616, -2.068051, 0, 1, 0.3921569, 1,
-0.2490024, 1.397288, 0.3586901, 0, 1, 0.4, 1,
-0.245795, -0.3868781, -1.339269, 0, 1, 0.4078431, 1,
-0.2407964, -0.003251462, -1.413495, 0, 1, 0.4117647, 1,
-0.2400651, -3.279441, -3.840714, 0, 1, 0.4196078, 1,
-0.2372863, 0.4703235, -2.345871, 0, 1, 0.4235294, 1,
-0.2353797, -1.345334, -1.355166, 0, 1, 0.4313726, 1,
-0.235024, -1.434454, -3.967875, 0, 1, 0.4352941, 1,
-0.2323196, 1.414599, -0.737923, 0, 1, 0.4431373, 1,
-0.2319785, 0.3147551, 0.1629775, 0, 1, 0.4470588, 1,
-0.2300495, 0.6002515, -0.5358515, 0, 1, 0.454902, 1,
-0.228837, 0.2602356, -1.431005, 0, 1, 0.4588235, 1,
-0.2271178, -0.1420761, -1.636055, 0, 1, 0.4666667, 1,
-0.22564, 0.6243467, -2.111282, 0, 1, 0.4705882, 1,
-0.209029, 0.7140452, 0.7048946, 0, 1, 0.4784314, 1,
-0.2079581, 0.8537359, 1.460782, 0, 1, 0.4823529, 1,
-0.2007458, 0.3236173, -0.2098388, 0, 1, 0.4901961, 1,
-0.1999004, 1.352584, 0.4985165, 0, 1, 0.4941176, 1,
-0.1978822, 0.2541315, -2.331366, 0, 1, 0.5019608, 1,
-0.1960649, 0.9782091, 0.6287925, 0, 1, 0.509804, 1,
-0.1933232, 0.3372248, -0.4068192, 0, 1, 0.5137255, 1,
-0.1904418, 0.732402, -0.370503, 0, 1, 0.5215687, 1,
-0.1886568, 0.3382241, -0.6823667, 0, 1, 0.5254902, 1,
-0.1811051, -1.071123, -1.838686, 0, 1, 0.5333334, 1,
-0.1785038, 0.6771619, 0.3232027, 0, 1, 0.5372549, 1,
-0.1764981, -1.020443, -3.173822, 0, 1, 0.5450981, 1,
-0.1756971, -1.256097, -2.71383, 0, 1, 0.5490196, 1,
-0.1703187, -0.3507, -1.963658, 0, 1, 0.5568628, 1,
-0.167163, 0.2004204, -0.7465534, 0, 1, 0.5607843, 1,
-0.1590605, -1.416623, -4.346653, 0, 1, 0.5686275, 1,
-0.1575215, 0.3357849, -1.649807, 0, 1, 0.572549, 1,
-0.1545974, 0.3373307, -0.7381219, 0, 1, 0.5803922, 1,
-0.1544375, 0.6553269, -0.3150664, 0, 1, 0.5843138, 1,
-0.1498934, -2.29031, -4.291139, 0, 1, 0.5921569, 1,
-0.1494557, -1.996539, -5.011696, 0, 1, 0.5960785, 1,
-0.1447478, 0.4436976, -0.3868693, 0, 1, 0.6039216, 1,
-0.1432197, 0.05509117, -0.4243426, 0, 1, 0.6117647, 1,
-0.1369569, 1.358328, 0.5477974, 0, 1, 0.6156863, 1,
-0.1356215, -0.5189435, -4.489354, 0, 1, 0.6235294, 1,
-0.1338626, -0.3896987, -0.1821066, 0, 1, 0.627451, 1,
-0.133392, -0.6968797, -2.700785, 0, 1, 0.6352941, 1,
-0.1303178, -0.8621113, -2.576378, 0, 1, 0.6392157, 1,
-0.1298891, -0.6326362, -1.981454, 0, 1, 0.6470588, 1,
-0.1294078, 1.417469, -0.07230103, 0, 1, 0.6509804, 1,
-0.1269847, 0.52228, -0.07116856, 0, 1, 0.6588235, 1,
-0.1192997, 0.4074279, -0.9526778, 0, 1, 0.6627451, 1,
-0.1140236, 1.343951, 1.40927, 0, 1, 0.6705883, 1,
-0.1133446, -0.04527679, -2.419235, 0, 1, 0.6745098, 1,
-0.1131805, -0.0721092, -2.038167, 0, 1, 0.682353, 1,
-0.1091867, 0.2251477, 0.8301141, 0, 1, 0.6862745, 1,
-0.1091849, -0.975243, -4.151826, 0, 1, 0.6941177, 1,
-0.1087365, 0.8042616, 0.7706813, 0, 1, 0.7019608, 1,
-0.1080648, -1.356063, -2.611061, 0, 1, 0.7058824, 1,
-0.1068877, 0.191416, 0.6195758, 0, 1, 0.7137255, 1,
-0.1022677, 0.7746894, -0.716844, 0, 1, 0.7176471, 1,
-0.1015124, -0.01654258, -1.982525, 0, 1, 0.7254902, 1,
-0.1004044, -2.604539, -2.487084, 0, 1, 0.7294118, 1,
-0.09981313, -0.9018528, -3.773649, 0, 1, 0.7372549, 1,
-0.09809384, 1.006656, -0.5436605, 0, 1, 0.7411765, 1,
-0.09515741, -0.3352927, -3.50739, 0, 1, 0.7490196, 1,
-0.09250212, -0.6287713, -4.221567, 0, 1, 0.7529412, 1,
-0.09216066, 1.515173, 0.6791229, 0, 1, 0.7607843, 1,
-0.08617096, -1.109372, -2.852323, 0, 1, 0.7647059, 1,
-0.08483224, -0.7077308, -4.633359, 0, 1, 0.772549, 1,
-0.08208203, -0.659395, -4.318818, 0, 1, 0.7764706, 1,
-0.07371782, 2.564667, -2.407089, 0, 1, 0.7843137, 1,
-0.07297754, 0.8798398, 1.38848, 0, 1, 0.7882353, 1,
-0.07244243, 0.4412641, -0.9842417, 0, 1, 0.7960784, 1,
-0.06806755, 0.7210985, -1.497945, 0, 1, 0.8039216, 1,
-0.06622034, -0.1832679, -2.192882, 0, 1, 0.8078431, 1,
-0.05541223, -1.039216, -4.330486, 0, 1, 0.8156863, 1,
-0.05442475, -0.137004, -4.846792, 0, 1, 0.8196079, 1,
-0.05420442, -1.683524, -4.611001, 0, 1, 0.827451, 1,
-0.05009649, 0.03362968, 0.5728289, 0, 1, 0.8313726, 1,
-0.04931597, 1.397881, 0.4651994, 0, 1, 0.8392157, 1,
-0.04835779, -1.237788, -2.553268, 0, 1, 0.8431373, 1,
-0.04427367, 1.19405, -1.156566, 0, 1, 0.8509804, 1,
-0.04309731, 0.7547199, 0.2655168, 0, 1, 0.854902, 1,
-0.03937337, 0.9254015, -0.08813095, 0, 1, 0.8627451, 1,
-0.03377748, 1.208386, -1.117323, 0, 1, 0.8666667, 1,
-0.02418855, -0.07255937, -2.986273, 0, 1, 0.8745098, 1,
-0.02411465, 0.2582832, -1.4617, 0, 1, 0.8784314, 1,
-0.02296646, -2.033051, -4.230127, 0, 1, 0.8862745, 1,
-0.02280375, -0.6730897, -3.433285, 0, 1, 0.8901961, 1,
-0.01441707, -0.5962598, -2.077686, 0, 1, 0.8980392, 1,
-0.01287966, 0.8076964, 0.1951174, 0, 1, 0.9058824, 1,
-0.01096562, -0.657995, -5.202669, 0, 1, 0.9098039, 1,
-0.008969346, 2.596055, -0.8225904, 0, 1, 0.9176471, 1,
-0.007870173, 0.5043505, -0.7603338, 0, 1, 0.9215686, 1,
-0.00612099, 0.2547472, -0.08396064, 0, 1, 0.9294118, 1,
-0.003227693, -0.6568126, -3.241686, 0, 1, 0.9333333, 1,
-0.002044854, -0.4817218, -3.204981, 0, 1, 0.9411765, 1,
0.000429998, -0.1587045, 4.05983, 0, 1, 0.945098, 1,
0.00840114, -1.544533, 3.518447, 0, 1, 0.9529412, 1,
0.009743894, -0.719681, 2.184248, 0, 1, 0.9568627, 1,
0.009972299, 0.282082, 1.397487, 0, 1, 0.9647059, 1,
0.02361234, -0.4143624, 2.180523, 0, 1, 0.9686275, 1,
0.02750007, 0.8009493, 1.505693, 0, 1, 0.9764706, 1,
0.02766793, -0.4452364, 1.180198, 0, 1, 0.9803922, 1,
0.03102632, 0.6712649, -0.7379436, 0, 1, 0.9882353, 1,
0.03455724, -0.007925893, 1.804616, 0, 1, 0.9921569, 1,
0.03707518, 1.011192, -1.056495, 0, 1, 1, 1,
0.03779344, -1.261201, 2.824874, 0, 0.9921569, 1, 1,
0.03923856, 0.990095, -1.61981, 0, 0.9882353, 1, 1,
0.04085061, -1.242628, 3.283972, 0, 0.9803922, 1, 1,
0.0430699, 0.7837572, -0.1044124, 0, 0.9764706, 1, 1,
0.04311774, -1.028603, 3.811426, 0, 0.9686275, 1, 1,
0.04888069, 0.2607208, 0.08478183, 0, 0.9647059, 1, 1,
0.05238655, 0.6667392, -0.3453476, 0, 0.9568627, 1, 1,
0.07045511, 0.03501017, 0.6359131, 0, 0.9529412, 1, 1,
0.07471254, 0.2328249, 0.4183484, 0, 0.945098, 1, 1,
0.08455914, 1.674942, -0.4496132, 0, 0.9411765, 1, 1,
0.0853147, -0.0510183, 3.250003, 0, 0.9333333, 1, 1,
0.0854025, 2.037117, 0.7951815, 0, 0.9294118, 1, 1,
0.08818959, 2.156792, 0.8840115, 0, 0.9215686, 1, 1,
0.08989143, 1.26307, -1.445311, 0, 0.9176471, 1, 1,
0.08992872, -0.4049472, 2.092412, 0, 0.9098039, 1, 1,
0.0939157, -0.1024686, 3.535269, 0, 0.9058824, 1, 1,
0.1001508, -1.199806, 3.983445, 0, 0.8980392, 1, 1,
0.1069012, -1.945357, 2.977656, 0, 0.8901961, 1, 1,
0.1074425, -0.09406965, 2.555849, 0, 0.8862745, 1, 1,
0.1136076, -0.2661605, 2.749134, 0, 0.8784314, 1, 1,
0.1203694, -0.222316, 2.527742, 0, 0.8745098, 1, 1,
0.1209024, -0.6810552, 2.839555, 0, 0.8666667, 1, 1,
0.1288735, 1.929534, 0.8132267, 0, 0.8627451, 1, 1,
0.1299614, 0.03199086, 1.489072, 0, 0.854902, 1, 1,
0.1305466, 1.299017, 0.3053553, 0, 0.8509804, 1, 1,
0.1311367, 0.07673309, 1.712243, 0, 0.8431373, 1, 1,
0.1354287, -0.8909616, 3.796421, 0, 0.8392157, 1, 1,
0.1370419, -0.5240424, 2.145005, 0, 0.8313726, 1, 1,
0.1400311, -1.011165, 2.100674, 0, 0.827451, 1, 1,
0.1427372, -0.8955935, 5.718727, 0, 0.8196079, 1, 1,
0.1454711, -0.2209362, 2.173217, 0, 0.8156863, 1, 1,
0.1462268, 0.05722327, 1.357461, 0, 0.8078431, 1, 1,
0.1495868, -0.8001409, 3.034212, 0, 0.8039216, 1, 1,
0.1531282, -1.978845, 3.000665, 0, 0.7960784, 1, 1,
0.1557928, 0.9581937, 0.8906348, 0, 0.7882353, 1, 1,
0.1560732, 0.5515152, 1.20626, 0, 0.7843137, 1, 1,
0.1584749, -1.512039, 3.204321, 0, 0.7764706, 1, 1,
0.1608166, -0.2569577, 3.828062, 0, 0.772549, 1, 1,
0.1643846, 0.1609807, 1.535301, 0, 0.7647059, 1, 1,
0.1644312, -0.2101686, 4.003727, 0, 0.7607843, 1, 1,
0.1648334, 0.8894952, 0.58219, 0, 0.7529412, 1, 1,
0.1650407, -0.8796716, 2.087037, 0, 0.7490196, 1, 1,
0.1688935, 0.2347398, 1.527025, 0, 0.7411765, 1, 1,
0.1689171, -0.2995668, 2.639935, 0, 0.7372549, 1, 1,
0.17219, -2.036059, 3.452174, 0, 0.7294118, 1, 1,
0.1804536, -1.242758, 2.168202, 0, 0.7254902, 1, 1,
0.1806106, 0.8407919, 0.4701396, 0, 0.7176471, 1, 1,
0.1811645, 0.2037196, -0.2120009, 0, 0.7137255, 1, 1,
0.1852309, -0.7558238, 2.866565, 0, 0.7058824, 1, 1,
0.1876345, -0.02318373, 1.938203, 0, 0.6980392, 1, 1,
0.1907558, 1.393893, 1.258256, 0, 0.6941177, 1, 1,
0.1918376, -1.745785, 5.751387, 0, 0.6862745, 1, 1,
0.1959185, 0.2379794, 0.4370976, 0, 0.682353, 1, 1,
0.1961385, -0.8796043, 4.078688, 0, 0.6745098, 1, 1,
0.196161, -0.2473447, 3.273577, 0, 0.6705883, 1, 1,
0.2023676, -1.397938, 3.684796, 0, 0.6627451, 1, 1,
0.2047394, 1.537157, -0.3654064, 0, 0.6588235, 1, 1,
0.2048655, 1.653754, 0.03964363, 0, 0.6509804, 1, 1,
0.206181, -0.2243359, 3.396453, 0, 0.6470588, 1, 1,
0.2063326, 0.5462627, -0.1843194, 0, 0.6392157, 1, 1,
0.208498, 1.606375, -0.3418598, 0, 0.6352941, 1, 1,
0.210963, 1.751521, 1.223389, 0, 0.627451, 1, 1,
0.2124039, -0.4094497, 3.746956, 0, 0.6235294, 1, 1,
0.2142921, 0.2906457, 1.215156, 0, 0.6156863, 1, 1,
0.2195518, -0.7236383, 2.861781, 0, 0.6117647, 1, 1,
0.2201172, 0.6733552, -0.01056414, 0, 0.6039216, 1, 1,
0.2247472, -0.8818235, 1.254383, 0, 0.5960785, 1, 1,
0.2269691, -0.1651886, 2.443825, 0, 0.5921569, 1, 1,
0.2278974, 0.2540981, -0.3068001, 0, 0.5843138, 1, 1,
0.2313581, 1.060171, -0.1236731, 0, 0.5803922, 1, 1,
0.2319495, -1.088756, 3.955637, 0, 0.572549, 1, 1,
0.2324685, 0.2502545, 2.134447, 0, 0.5686275, 1, 1,
0.2327209, -0.3730318, 3.132421, 0, 0.5607843, 1, 1,
0.2331765, 0.8699016, -1.081539, 0, 0.5568628, 1, 1,
0.2337196, 0.2935618, 1.470974, 0, 0.5490196, 1, 1,
0.236431, 0.9107885, 0.8865156, 0, 0.5450981, 1, 1,
0.2371419, -2.515505, 3.332363, 0, 0.5372549, 1, 1,
0.24013, 1.53103, -0.6678166, 0, 0.5333334, 1, 1,
0.2404659, -0.7795665, 3.560557, 0, 0.5254902, 1, 1,
0.2424146, -0.5093093, 2.816712, 0, 0.5215687, 1, 1,
0.2464726, 0.7745841, -0.9199134, 0, 0.5137255, 1, 1,
0.2511287, 0.8679957, 1.309396, 0, 0.509804, 1, 1,
0.2511305, 0.3445609, 1.380579, 0, 0.5019608, 1, 1,
0.2526767, 1.075366, -0.7812232, 0, 0.4941176, 1, 1,
0.2535779, 0.8551394, -2.455288, 0, 0.4901961, 1, 1,
0.2638455, 1.366116, 1.267783, 0, 0.4823529, 1, 1,
0.2718416, 0.1145428, -1.773563, 0, 0.4784314, 1, 1,
0.2736165, 1.432441, 0.48553, 0, 0.4705882, 1, 1,
0.2774796, -1.536764, 2.37327, 0, 0.4666667, 1, 1,
0.2819031, 0.4823742, 0.2005148, 0, 0.4588235, 1, 1,
0.2827615, -1.376685, 3.214437, 0, 0.454902, 1, 1,
0.2875139, 0.1109637, 0.4070927, 0, 0.4470588, 1, 1,
0.2905201, -0.2180975, 0.09979491, 0, 0.4431373, 1, 1,
0.2924578, 0.8102117, 0.139523, 0, 0.4352941, 1, 1,
0.2926204, 0.5410006, 1.866914, 0, 0.4313726, 1, 1,
0.2933252, 0.5612341, 0.1286923, 0, 0.4235294, 1, 1,
0.2960817, -1.595341, 1.610407, 0, 0.4196078, 1, 1,
0.296222, -2.06188, 1.702972, 0, 0.4117647, 1, 1,
0.2988176, 1.102508, -0.4451779, 0, 0.4078431, 1, 1,
0.3020436, -1.508981, 2.747839, 0, 0.4, 1, 1,
0.3033939, -1.156189, 2.251523, 0, 0.3921569, 1, 1,
0.3036683, -0.673765, 1.751861, 0, 0.3882353, 1, 1,
0.3045007, 1.895212, -1.690277, 0, 0.3803922, 1, 1,
0.3055677, -1.348682, 3.240599, 0, 0.3764706, 1, 1,
0.3076601, 0.5486517, -0.04306283, 0, 0.3686275, 1, 1,
0.309271, 0.08236775, 2.662598, 0, 0.3647059, 1, 1,
0.310496, 0.1186458, 2.346469, 0, 0.3568628, 1, 1,
0.3127422, 0.9395757, 0.1303442, 0, 0.3529412, 1, 1,
0.3159033, 1.144285, -1.865758, 0, 0.345098, 1, 1,
0.3170294, -1.599182, 4.117679, 0, 0.3411765, 1, 1,
0.3206079, -1.177517, 3.473819, 0, 0.3333333, 1, 1,
0.3207426, -0.2192264, 0.5823132, 0, 0.3294118, 1, 1,
0.3227102, 0.2676617, 0.7372316, 0, 0.3215686, 1, 1,
0.3239654, -0.972991, 3.890326, 0, 0.3176471, 1, 1,
0.3263098, -0.20517, 2.553462, 0, 0.3098039, 1, 1,
0.3281648, 0.1583607, 2.782717, 0, 0.3058824, 1, 1,
0.3329792, -0.05990474, 1.669695, 0, 0.2980392, 1, 1,
0.334615, 0.6953839, 0.4151635, 0, 0.2901961, 1, 1,
0.3348245, 0.3932614, 1.230566, 0, 0.2862745, 1, 1,
0.3360982, -0.7798597, 4.560858, 0, 0.2784314, 1, 1,
0.3364865, -0.05289603, 0.8182756, 0, 0.2745098, 1, 1,
0.3382874, 0.7185522, 0.4060263, 0, 0.2666667, 1, 1,
0.3403877, 0.03212766, 2.070769, 0, 0.2627451, 1, 1,
0.3463142, -0.5977184, 2.491817, 0, 0.254902, 1, 1,
0.3489195, 0.7859993, 0.5456861, 0, 0.2509804, 1, 1,
0.3522505, 3.767958, -0.680615, 0, 0.2431373, 1, 1,
0.3531259, -0.9303135, 3.764347, 0, 0.2392157, 1, 1,
0.3557945, 0.2896555, 0.1052478, 0, 0.2313726, 1, 1,
0.3665504, 2.231725, 1.492996, 0, 0.227451, 1, 1,
0.3668158, -0.08910458, 2.050515, 0, 0.2196078, 1, 1,
0.3680694, -1.157631, 3.230961, 0, 0.2156863, 1, 1,
0.3698127, 1.408619, 0.9160224, 0, 0.2078431, 1, 1,
0.3699346, 0.7231311, 2.285725, 0, 0.2039216, 1, 1,
0.3709464, 1.029035, -0.7135824, 0, 0.1960784, 1, 1,
0.3709596, 0.9410726, -0.4348294, 0, 0.1882353, 1, 1,
0.3712849, -0.1726866, 0.6640067, 0, 0.1843137, 1, 1,
0.373704, -0.1328087, 1.608828, 0, 0.1764706, 1, 1,
0.3770601, -0.02366939, 0.841023, 0, 0.172549, 1, 1,
0.3794467, -0.4692513, 3.283694, 0, 0.1647059, 1, 1,
0.3798562, -0.1191377, 2.729218, 0, 0.1607843, 1, 1,
0.3825753, 1.133786, 0.4840764, 0, 0.1529412, 1, 1,
0.3832333, -0.5007506, 1.770675, 0, 0.1490196, 1, 1,
0.3835576, -0.3874483, 2.281028, 0, 0.1411765, 1, 1,
0.3863133, -0.3450411, -0.1736231, 0, 0.1372549, 1, 1,
0.3876969, 1.262667, -0.9617544, 0, 0.1294118, 1, 1,
0.3885472, 0.1937174, -0.1490579, 0, 0.1254902, 1, 1,
0.3891676, -0.5216351, 2.405278, 0, 0.1176471, 1, 1,
0.3934951, 1.094796, 2.116889, 0, 0.1137255, 1, 1,
0.3978195, -0.1294463, -0.1099828, 0, 0.1058824, 1, 1,
0.3991464, -1.168422, 0.9744331, 0, 0.09803922, 1, 1,
0.3993572, 1.249235, -0.3136097, 0, 0.09411765, 1, 1,
0.4019396, 0.08605613, 1.389907, 0, 0.08627451, 1, 1,
0.4024657, -0.2587155, 2.021792, 0, 0.08235294, 1, 1,
0.4055299, -0.2482956, 1.618172, 0, 0.07450981, 1, 1,
0.4117067, 0.6007878, 1.093369, 0, 0.07058824, 1, 1,
0.4156998, 1.142447, 0.03793911, 0, 0.0627451, 1, 1,
0.4252117, 1.51734, 0.4063207, 0, 0.05882353, 1, 1,
0.426048, -0.7845882, 3.325835, 0, 0.05098039, 1, 1,
0.4276738, 0.4743125, -0.2655306, 0, 0.04705882, 1, 1,
0.4326236, 1.149454, 0.5748005, 0, 0.03921569, 1, 1,
0.4327243, -2.289135, 4.620295, 0, 0.03529412, 1, 1,
0.434627, 0.767405, 0.7561409, 0, 0.02745098, 1, 1,
0.4356061, -1.085316, 3.018415, 0, 0.02352941, 1, 1,
0.4386412, 1.572108, -0.7616256, 0, 0.01568628, 1, 1,
0.4394735, 2.085678, 0.7071384, 0, 0.01176471, 1, 1,
0.4408296, 0.03631464, 1.902538, 0, 0.003921569, 1, 1,
0.44093, 0.9586341, 1.01159, 0.003921569, 0, 1, 1,
0.4426979, 1.643193, -1.02357, 0.007843138, 0, 1, 1,
0.4449084, 0.1352636, 0.9298053, 0.01568628, 0, 1, 1,
0.4465038, 0.3983794, 0.5534248, 0.01960784, 0, 1, 1,
0.4498904, -0.3903999, 1.204681, 0.02745098, 0, 1, 1,
0.4577693, 0.8560791, 1.073514, 0.03137255, 0, 1, 1,
0.459897, -2.119804, 3.383717, 0.03921569, 0, 1, 1,
0.463306, -0.3811381, 3.674875, 0.04313726, 0, 1, 1,
0.4697909, 0.1176715, 1.108195, 0.05098039, 0, 1, 1,
0.4762706, -0.1975006, 2.055913, 0.05490196, 0, 1, 1,
0.4783556, 1.783504, 0.174708, 0.0627451, 0, 1, 1,
0.4796734, -0.4618705, 1.891831, 0.06666667, 0, 1, 1,
0.4885464, 1.131791, 0.05198268, 0.07450981, 0, 1, 1,
0.4886509, -0.1274817, 0.4938028, 0.07843138, 0, 1, 1,
0.4904573, -1.106667, 1.942568, 0.08627451, 0, 1, 1,
0.4956806, -2.251017, 3.380704, 0.09019608, 0, 1, 1,
0.4964682, -0.2191807, 2.162143, 0.09803922, 0, 1, 1,
0.4971849, -0.1148011, 1.184241, 0.1058824, 0, 1, 1,
0.4997362, -0.3254497, 1.149038, 0.1098039, 0, 1, 1,
0.501316, -1.052856, 2.596187, 0.1176471, 0, 1, 1,
0.5036271, 0.1906345, 2.847828, 0.1215686, 0, 1, 1,
0.5048587, -1.285578, 4.277121, 0.1294118, 0, 1, 1,
0.5064133, 1.237358, -0.7706696, 0.1333333, 0, 1, 1,
0.5122874, 0.3333487, 0.5253593, 0.1411765, 0, 1, 1,
0.5125257, -1.493287, 1.55068, 0.145098, 0, 1, 1,
0.5143906, 0.5613834, 0.004020383, 0.1529412, 0, 1, 1,
0.51639, 1.787005, 1.33587, 0.1568628, 0, 1, 1,
0.5167129, -0.3447684, 2.193934, 0.1647059, 0, 1, 1,
0.5238062, -0.299927, 3.929427, 0.1686275, 0, 1, 1,
0.5240279, 1.042704, 0.2037405, 0.1764706, 0, 1, 1,
0.5244642, -0.3432584, 3.061881, 0.1803922, 0, 1, 1,
0.5251927, -0.854805, 2.624337, 0.1882353, 0, 1, 1,
0.5254102, -0.000592644, 2.75112, 0.1921569, 0, 1, 1,
0.526837, 0.09202817, 1.045655, 0.2, 0, 1, 1,
0.528216, -0.7368908, 1.509787, 0.2078431, 0, 1, 1,
0.5308039, 0.516715, 0.2124401, 0.2117647, 0, 1, 1,
0.5335431, -0.5208375, 3.65669, 0.2196078, 0, 1, 1,
0.538591, 3.020541, 0.5856481, 0.2235294, 0, 1, 1,
0.545231, -1.209839, 2.317319, 0.2313726, 0, 1, 1,
0.5460008, 1.138123, 2.177799, 0.2352941, 0, 1, 1,
0.551511, 0.3497177, 1.260599, 0.2431373, 0, 1, 1,
0.552812, 0.3881205, 1.835728, 0.2470588, 0, 1, 1,
0.5565283, -0.5306863, 2.412091, 0.254902, 0, 1, 1,
0.5579209, -1.093317, 2.768985, 0.2588235, 0, 1, 1,
0.5623349, -1.517953, 3.277754, 0.2666667, 0, 1, 1,
0.5673478, -0.6371583, 1.021666, 0.2705882, 0, 1, 1,
0.5731769, 0.7695726, -0.4019267, 0.2784314, 0, 1, 1,
0.57581, 0.4341578, 1.095215, 0.282353, 0, 1, 1,
0.5804306, -0.2234618, 0.431801, 0.2901961, 0, 1, 1,
0.5820184, -0.7078975, 1.788311, 0.2941177, 0, 1, 1,
0.5854191, -0.3375307, 2.182546, 0.3019608, 0, 1, 1,
0.5860131, 0.9944735, 0.5741642, 0.3098039, 0, 1, 1,
0.5896858, -0.8355306, 3.063031, 0.3137255, 0, 1, 1,
0.5918332, -1.278305, 2.65448, 0.3215686, 0, 1, 1,
0.5977468, 1.163672, 0.7823959, 0.3254902, 0, 1, 1,
0.5994018, -1.210298, 3.251544, 0.3333333, 0, 1, 1,
0.6002144, -1.533512, 1.435073, 0.3372549, 0, 1, 1,
0.6034691, -0.1062316, 1.723099, 0.345098, 0, 1, 1,
0.6041863, -0.2636708, 3.87578, 0.3490196, 0, 1, 1,
0.6050406, -0.5215931, 3.855891, 0.3568628, 0, 1, 1,
0.6070969, 0.344955, 0.3819322, 0.3607843, 0, 1, 1,
0.612048, 2.295038, 1.818108, 0.3686275, 0, 1, 1,
0.6146168, 0.8757622, 0.2241835, 0.372549, 0, 1, 1,
0.6149287, -0.6064997, 3.978649, 0.3803922, 0, 1, 1,
0.6160343, -0.03910841, 1.08905, 0.3843137, 0, 1, 1,
0.6202103, 0.7134375, 1.165398, 0.3921569, 0, 1, 1,
0.6212009, 0.1669054, 2.419718, 0.3960784, 0, 1, 1,
0.6232553, 0.5499583, 0.8180411, 0.4039216, 0, 1, 1,
0.6232872, 0.7435577, 1.621982, 0.4117647, 0, 1, 1,
0.6253724, 1.122956, 1.27204, 0.4156863, 0, 1, 1,
0.6266708, -0.9062786, 2.493296, 0.4235294, 0, 1, 1,
0.6276827, -0.2332702, 1.584217, 0.427451, 0, 1, 1,
0.6320239, 1.356703, 0.6750656, 0.4352941, 0, 1, 1,
0.6396285, -1.032379, 3.668008, 0.4392157, 0, 1, 1,
0.6414753, -0.4404209, 2.834122, 0.4470588, 0, 1, 1,
0.6513089, 0.8390368, 1.683392, 0.4509804, 0, 1, 1,
0.6536097, 0.584392, 1.129926, 0.4588235, 0, 1, 1,
0.6597244, -0.8790274, 1.983153, 0.4627451, 0, 1, 1,
0.6615527, -0.7918109, 2.708473, 0.4705882, 0, 1, 1,
0.6660625, -1.468043, 2.351438, 0.4745098, 0, 1, 1,
0.6710157, 0.5876525, 0.1765189, 0.4823529, 0, 1, 1,
0.6713938, 0.1921844, 2.166691, 0.4862745, 0, 1, 1,
0.6825976, 1.778038, 1.041342, 0.4941176, 0, 1, 1,
0.6842157, -0.4522342, 0.6160998, 0.5019608, 0, 1, 1,
0.6869991, 1.257982, -0.06766608, 0.5058824, 0, 1, 1,
0.6921481, -0.3633106, 3.023567, 0.5137255, 0, 1, 1,
0.6946071, -0.3490855, 3.059302, 0.5176471, 0, 1, 1,
0.6988438, 0.6007509, -1.262833, 0.5254902, 0, 1, 1,
0.6996946, 0.4345102, 0.8683863, 0.5294118, 0, 1, 1,
0.7017093, 1.323138, 0.03957376, 0.5372549, 0, 1, 1,
0.7074416, -1.089021, 3.952031, 0.5411765, 0, 1, 1,
0.7111275, 0.2367003, 1.458419, 0.5490196, 0, 1, 1,
0.7134581, -0.05644146, 1.456092, 0.5529412, 0, 1, 1,
0.7164608, -0.3067007, 1.189325, 0.5607843, 0, 1, 1,
0.7246186, 0.1771308, 2.245038, 0.5647059, 0, 1, 1,
0.7254843, -0.6005458, 1.587415, 0.572549, 0, 1, 1,
0.7260538, 0.247708, 1.028604, 0.5764706, 0, 1, 1,
0.7269292, 1.54471, 0.8034193, 0.5843138, 0, 1, 1,
0.7273781, -0.001126927, 1.955097, 0.5882353, 0, 1, 1,
0.7288006, -0.17692, 2.286362, 0.5960785, 0, 1, 1,
0.7310646, 0.1077564, 3.389691, 0.6039216, 0, 1, 1,
0.7339917, 1.724634, 3.311077, 0.6078432, 0, 1, 1,
0.733997, -1.19953, 2.375328, 0.6156863, 0, 1, 1,
0.7361742, 0.07615452, 2.384735, 0.6196079, 0, 1, 1,
0.7411548, -0.6857955, 3.151745, 0.627451, 0, 1, 1,
0.7444829, 0.8755946, -1.141567, 0.6313726, 0, 1, 1,
0.7539556, 0.474601, -0.4486884, 0.6392157, 0, 1, 1,
0.7561947, -0.06797992, 0.2187684, 0.6431373, 0, 1, 1,
0.7600237, 0.9928631, 1.239646, 0.6509804, 0, 1, 1,
0.7709377, 0.6917418, 1.113495, 0.654902, 0, 1, 1,
0.7751575, 0.1239612, 1.384538, 0.6627451, 0, 1, 1,
0.7782773, 0.5818601, 3.212326, 0.6666667, 0, 1, 1,
0.7805021, -0.5681069, 1.908389, 0.6745098, 0, 1, 1,
0.7875077, -0.3423198, 2.277, 0.6784314, 0, 1, 1,
0.7885894, 0.6600153, 2.322827, 0.6862745, 0, 1, 1,
0.7891576, 0.4619497, -0.08758476, 0.6901961, 0, 1, 1,
0.7931514, -0.1479322, 2.361098, 0.6980392, 0, 1, 1,
0.795289, -0.6682686, 4.462682, 0.7058824, 0, 1, 1,
0.7983294, 1.640992, 0.7083274, 0.7098039, 0, 1, 1,
0.8056813, 1.805533, 0.3176705, 0.7176471, 0, 1, 1,
0.8169938, 0.2771052, 0.5328768, 0.7215686, 0, 1, 1,
0.8174376, -3.155371, 3.215491, 0.7294118, 0, 1, 1,
0.8245736, 0.5401435, 0.2208774, 0.7333333, 0, 1, 1,
0.8265623, 0.1982255, 0.9036931, 0.7411765, 0, 1, 1,
0.8270908, 0.7040243, 0.8302326, 0.7450981, 0, 1, 1,
0.8272342, 2.15795, 1.017551, 0.7529412, 0, 1, 1,
0.8273937, 1.130766, 0.1713192, 0.7568628, 0, 1, 1,
0.8308342, -1.150616, 1.038258, 0.7647059, 0, 1, 1,
0.8312469, 1.653676, 0.4189248, 0.7686275, 0, 1, 1,
0.8329721, -1.426265, 2.643052, 0.7764706, 0, 1, 1,
0.853606, -1.122531, 4.980755, 0.7803922, 0, 1, 1,
0.8591672, 1.524605, 1.161423, 0.7882353, 0, 1, 1,
0.8624023, 0.0908286, 1.165872, 0.7921569, 0, 1, 1,
0.8676644, -1.47776, 2.148431, 0.8, 0, 1, 1,
0.8701841, -0.05864718, 2.398474, 0.8078431, 0, 1, 1,
0.873274, 1.931198, 0.9308808, 0.8117647, 0, 1, 1,
0.8743548, -0.4182926, 1.202361, 0.8196079, 0, 1, 1,
0.8840245, -0.04028923, 1.017743, 0.8235294, 0, 1, 1,
0.8934486, -0.07912408, 0.4321722, 0.8313726, 0, 1, 1,
0.8936037, 3.341237, 1.709542, 0.8352941, 0, 1, 1,
0.8982823, 0.669583, 1.911573, 0.8431373, 0, 1, 1,
0.8995538, 0.9742776, 0.9797745, 0.8470588, 0, 1, 1,
0.8997028, -0.7160841, 3.307903, 0.854902, 0, 1, 1,
0.9012732, -0.4374765, 0.952309, 0.8588235, 0, 1, 1,
0.9027115, -0.315326, 1.723701, 0.8666667, 0, 1, 1,
0.9029978, 0.1979723, 2.631778, 0.8705882, 0, 1, 1,
0.9038544, -0.2754413, 0.7409288, 0.8784314, 0, 1, 1,
0.9078166, 1.027296, 1.109012, 0.8823529, 0, 1, 1,
0.9146062, 0.348289, 0.3130618, 0.8901961, 0, 1, 1,
0.9158777, 0.281559, 1.997667, 0.8941177, 0, 1, 1,
0.9174678, 0.7638575, 1.221079, 0.9019608, 0, 1, 1,
0.9207114, 0.5703891, 2.05435, 0.9098039, 0, 1, 1,
0.9287397, -0.4666554, 4.582822, 0.9137255, 0, 1, 1,
0.928915, 0.02644191, 1.753675, 0.9215686, 0, 1, 1,
0.9314845, -1.573457, 2.386713, 0.9254902, 0, 1, 1,
0.931793, 0.7713114, 2.093323, 0.9333333, 0, 1, 1,
0.9323155, -0.1651306, 3.011567, 0.9372549, 0, 1, 1,
0.9323719, 0.3427939, 1.588865, 0.945098, 0, 1, 1,
0.9327012, 1.086917, -0.2836498, 0.9490196, 0, 1, 1,
0.9358675, -0.3360683, 2.389219, 0.9568627, 0, 1, 1,
0.9378007, 1.680269, 0.9147722, 0.9607843, 0, 1, 1,
0.939266, 1.487735, -1.025854, 0.9686275, 0, 1, 1,
0.9420865, -1.416621, 2.124788, 0.972549, 0, 1, 1,
0.9463338, 0.2113453, 0.3879449, 0.9803922, 0, 1, 1,
0.9486045, -0.4291415, 1.578395, 0.9843137, 0, 1, 1,
0.9493963, -0.4698456, 3.328856, 0.9921569, 0, 1, 1,
0.9534118, -1.609169, 2.60606, 0.9960784, 0, 1, 1,
0.9548323, -0.9638602, 1.955797, 1, 0, 0.9960784, 1,
0.9604787, -0.4985512, 2.041863, 1, 0, 0.9882353, 1,
0.966881, -1.683861, 0.8947524, 1, 0, 0.9843137, 1,
0.9702224, 1.016999, 2.468652, 1, 0, 0.9764706, 1,
0.9716585, -0.5043363, 3.076354, 1, 0, 0.972549, 1,
0.9717241, 0.01818819, 1.904707, 1, 0, 0.9647059, 1,
0.9888194, 1.823016, 0.1769601, 1, 0, 0.9607843, 1,
1.000634, -0.7499497, 1.889767, 1, 0, 0.9529412, 1,
1.003526, -0.2207811, 3.375559, 1, 0, 0.9490196, 1,
1.007279, -0.3913526, 2.504499, 1, 0, 0.9411765, 1,
1.014606, 1.707983, 0.4490717, 1, 0, 0.9372549, 1,
1.014815, 0.5719728, -0.1842495, 1, 0, 0.9294118, 1,
1.014995, -0.289686, 2.526293, 1, 0, 0.9254902, 1,
1.019502, -0.1765431, 1.287641, 1, 0, 0.9176471, 1,
1.021484, -1.35802, 2.770209, 1, 0, 0.9137255, 1,
1.02183, -0.3503416, 1.464473, 1, 0, 0.9058824, 1,
1.02199, 0.04410078, 0.473073, 1, 0, 0.9019608, 1,
1.030986, -0.3587414, 2.754884, 1, 0, 0.8941177, 1,
1.036305, -1.011428, 1.948982, 1, 0, 0.8862745, 1,
1.041206, 0.9826189, 1.471495, 1, 0, 0.8823529, 1,
1.046074, 1.015521, 0.8997943, 1, 0, 0.8745098, 1,
1.059949, -2.32043, 1.654902, 1, 0, 0.8705882, 1,
1.06078, -1.695849, 0.4792073, 1, 0, 0.8627451, 1,
1.062364, -1.509252, 2.983572, 1, 0, 0.8588235, 1,
1.067264, -0.2490795, 3.033491, 1, 0, 0.8509804, 1,
1.078082, -1.306098, 1.423492, 1, 0, 0.8470588, 1,
1.080311, 0.08992465, 3.146101, 1, 0, 0.8392157, 1,
1.083385, -0.5660918, 1.745894, 1, 0, 0.8352941, 1,
1.086195, 1.013757, 0.7743971, 1, 0, 0.827451, 1,
1.086792, -0.006181301, 3.128006, 1, 0, 0.8235294, 1,
1.087917, 1.74093, 0.1257288, 1, 0, 0.8156863, 1,
1.091427, 0.5971332, 2.602243, 1, 0, 0.8117647, 1,
1.094374, -0.02823056, 2.23921, 1, 0, 0.8039216, 1,
1.10352, -1.711918, 1.846985, 1, 0, 0.7960784, 1,
1.110106, -0.797507, 1.32166, 1, 0, 0.7921569, 1,
1.113116, 0.3355493, 1.341508, 1, 0, 0.7843137, 1,
1.119135, -0.6389431, 1.377648, 1, 0, 0.7803922, 1,
1.12981, -0.8401676, 2.602564, 1, 0, 0.772549, 1,
1.137179, -0.6380287, 3.401793, 1, 0, 0.7686275, 1,
1.145604, -0.01429988, 1.057853, 1, 0, 0.7607843, 1,
1.150611, -1.178518, 2.439721, 1, 0, 0.7568628, 1,
1.15126, -0.2094533, 1.85574, 1, 0, 0.7490196, 1,
1.153517, 1.112378, 0.6272825, 1, 0, 0.7450981, 1,
1.163749, 0.3394671, 1.327244, 1, 0, 0.7372549, 1,
1.167389, -0.6391181, 3.146466, 1, 0, 0.7333333, 1,
1.171077, -1.366931, 3.794736, 1, 0, 0.7254902, 1,
1.172358, -0.3975202, 1.36351, 1, 0, 0.7215686, 1,
1.178309, 0.08842639, 0.09205665, 1, 0, 0.7137255, 1,
1.180475, 0.4954209, 0.2843351, 1, 0, 0.7098039, 1,
1.183389, -0.9429585, 1.220951, 1, 0, 0.7019608, 1,
1.193711, 1.357077, 2.279016, 1, 0, 0.6941177, 1,
1.194894, 0.7705066, 1.14227, 1, 0, 0.6901961, 1,
1.198962, -0.1018932, -1.277424, 1, 0, 0.682353, 1,
1.216193, 0.2149031, 1.908685, 1, 0, 0.6784314, 1,
1.221422, -0.892493, 1.66275, 1, 0, 0.6705883, 1,
1.232164, 0.01058215, 2.572262, 1, 0, 0.6666667, 1,
1.24047, 0.3095607, 3.177224, 1, 0, 0.6588235, 1,
1.241134, -0.1746888, -0.2006014, 1, 0, 0.654902, 1,
1.249818, 0.6204205, 0.7322816, 1, 0, 0.6470588, 1,
1.257054, 0.4556437, 1.073952, 1, 0, 0.6431373, 1,
1.259035, 0.5485022, 0.8754489, 1, 0, 0.6352941, 1,
1.261763, -1.586295, 1.982994, 1, 0, 0.6313726, 1,
1.268072, -0.2936941, 2.644351, 1, 0, 0.6235294, 1,
1.26968, -0.3682507, 1.791255, 1, 0, 0.6196079, 1,
1.272769, 0.580038, 1.111958, 1, 0, 0.6117647, 1,
1.273836, 0.1541616, 1.22518, 1, 0, 0.6078432, 1,
1.293247, -1.087601, 3.089061, 1, 0, 0.6, 1,
1.304407, 0.3444209, -0.7670025, 1, 0, 0.5921569, 1,
1.305555, 0.07853211, 2.69244, 1, 0, 0.5882353, 1,
1.305786, -2.461128, 2.094808, 1, 0, 0.5803922, 1,
1.309007, -0.005194554, 3.361708, 1, 0, 0.5764706, 1,
1.311446, -1.616349, 1.37348, 1, 0, 0.5686275, 1,
1.312046, -1.787058, 2.922897, 1, 0, 0.5647059, 1,
1.316226, -0.8917702, 2.401391, 1, 0, 0.5568628, 1,
1.317259, -0.2711159, 0.9572926, 1, 0, 0.5529412, 1,
1.317349, -1.510888, 2.243663, 1, 0, 0.5450981, 1,
1.318003, 1.115988, 1.10321, 1, 0, 0.5411765, 1,
1.328093, -0.1187737, -0.3104434, 1, 0, 0.5333334, 1,
1.338044, -0.5875655, 0.5717909, 1, 0, 0.5294118, 1,
1.342881, 0.9945796, 0.1851866, 1, 0, 0.5215687, 1,
1.348893, 0.6034878, 1.898074, 1, 0, 0.5176471, 1,
1.371976, -0.05857252, 2.065378, 1, 0, 0.509804, 1,
1.406805, 0.460385, 1.345501, 1, 0, 0.5058824, 1,
1.427504, -0.5647825, 2.100038, 1, 0, 0.4980392, 1,
1.432304, 1.230308, -0.5199198, 1, 0, 0.4901961, 1,
1.433234, -0.4252327, 1.089227, 1, 0, 0.4862745, 1,
1.436415, -0.1223819, 2.232452, 1, 0, 0.4784314, 1,
1.436735, 0.4552595, 0.7934819, 1, 0, 0.4745098, 1,
1.473561, 1.073912, 1.703055, 1, 0, 0.4666667, 1,
1.482517, 0.6371382, 0.317642, 1, 0, 0.4627451, 1,
1.487241, 0.5155678, 0.8558692, 1, 0, 0.454902, 1,
1.520245, 0.2190446, 1.989617, 1, 0, 0.4509804, 1,
1.566302, 1.40198, 0.3004246, 1, 0, 0.4431373, 1,
1.566853, -0.3184474, 3.777197, 1, 0, 0.4392157, 1,
1.576656, 1.738242, 0.3710636, 1, 0, 0.4313726, 1,
1.584534, 1.797918, 2.295835, 1, 0, 0.427451, 1,
1.593991, -0.8867418, 2.291389, 1, 0, 0.4196078, 1,
1.602733, -0.3034133, 2.812128, 1, 0, 0.4156863, 1,
1.604788, 0.153609, 3.161918, 1, 0, 0.4078431, 1,
1.605488, 0.9832333, 2.122252, 1, 0, 0.4039216, 1,
1.614912, -0.4210634, 0.4851532, 1, 0, 0.3960784, 1,
1.619373, 0.8005435, 2.362769, 1, 0, 0.3882353, 1,
1.631414, 0.8816943, 0.5431675, 1, 0, 0.3843137, 1,
1.646053, 2.27083, 0.5864156, 1, 0, 0.3764706, 1,
1.647714, -0.04156479, 2.173815, 1, 0, 0.372549, 1,
1.660147, -0.9577296, 2.096226, 1, 0, 0.3647059, 1,
1.660924, -0.3890354, 2.471625, 1, 0, 0.3607843, 1,
1.696295, -0.2091707, 1.715622, 1, 0, 0.3529412, 1,
1.7174, 0.09098282, 0.780443, 1, 0, 0.3490196, 1,
1.718977, -0.2335809, 0.4503751, 1, 0, 0.3411765, 1,
1.72436, 1.305606, 0.1780834, 1, 0, 0.3372549, 1,
1.724559, -0.4212841, 1.461992, 1, 0, 0.3294118, 1,
1.733768, -0.8486735, 2.268892, 1, 0, 0.3254902, 1,
1.73656, -0.6683462, -0.02276145, 1, 0, 0.3176471, 1,
1.751633, 2.533707, 1.029534, 1, 0, 0.3137255, 1,
1.752946, 1.773998, 0.5642306, 1, 0, 0.3058824, 1,
1.755014, 0.2511489, 0.5330918, 1, 0, 0.2980392, 1,
1.758092, 0.522117, 1.495133, 1, 0, 0.2941177, 1,
1.758799, -1.409096, 2.337384, 1, 0, 0.2862745, 1,
1.76492, -0.002092677, 2.310724, 1, 0, 0.282353, 1,
1.767561, -0.8555524, 3.860558, 1, 0, 0.2745098, 1,
1.795316, -1.048999, 1.802256, 1, 0, 0.2705882, 1,
1.797307, -0.5041963, 2.593935, 1, 0, 0.2627451, 1,
1.814201, -0.4888513, 0.8841122, 1, 0, 0.2588235, 1,
1.816063, 0.4746052, 1.724283, 1, 0, 0.2509804, 1,
1.828902, 0.2372342, -0.2645893, 1, 0, 0.2470588, 1,
1.832599, -0.2168989, 1.938303, 1, 0, 0.2392157, 1,
1.852463, 0.02066047, 1.897718, 1, 0, 0.2352941, 1,
1.870352, 1.080076, 2.959274, 1, 0, 0.227451, 1,
1.898389, -1.890931, 2.516414, 1, 0, 0.2235294, 1,
1.901898, -0.3698387, 1.242746, 1, 0, 0.2156863, 1,
1.923139, 1.975504, 0.2191579, 1, 0, 0.2117647, 1,
1.932661, -0.7815049, 3.700458, 1, 0, 0.2039216, 1,
1.940194, -0.5777141, 2.825262, 1, 0, 0.1960784, 1,
1.949405, 1.746216, 0.8323532, 1, 0, 0.1921569, 1,
1.949996, -0.180451, 0.4254275, 1, 0, 0.1843137, 1,
1.958081, -2.527041, 3.08703, 1, 0, 0.1803922, 1,
1.962508, -1.36395, 2.991494, 1, 0, 0.172549, 1,
1.966381, -0.791819, 2.370941, 1, 0, 0.1686275, 1,
1.967108, -0.4154368, 1.821231, 1, 0, 0.1607843, 1,
1.998945, 0.4438623, 0.9028238, 1, 0, 0.1568628, 1,
2.052818, 1.566315, 0.7363347, 1, 0, 0.1490196, 1,
2.055117, -0.6827254, 1.915148, 1, 0, 0.145098, 1,
2.08421, 0.2627069, 1.387308, 1, 0, 0.1372549, 1,
2.11471, -0.7517947, 1.227267, 1, 0, 0.1333333, 1,
2.119585, 1.317197, 0.1723772, 1, 0, 0.1254902, 1,
2.127068, 0.3337494, 2.754418, 1, 0, 0.1215686, 1,
2.130075, 3.294616, 0.4370653, 1, 0, 0.1137255, 1,
2.13976, 0.1775721, 3.335686, 1, 0, 0.1098039, 1,
2.149379, -1.213835, 1.755246, 1, 0, 0.1019608, 1,
2.16465, 2.766687, 1.081655, 1, 0, 0.09411765, 1,
2.186483, 1.514934, 2.472416, 1, 0, 0.09019608, 1,
2.187157, -0.8606297, 2.786925, 1, 0, 0.08235294, 1,
2.209831, -0.0453295, 0.4933173, 1, 0, 0.07843138, 1,
2.226707, -0.06412187, 1.9353, 1, 0, 0.07058824, 1,
2.28505, 2.144336, 0.2982135, 1, 0, 0.06666667, 1,
2.341198, -0.4270459, 1.895462, 1, 0, 0.05882353, 1,
2.443166, -0.6307706, 3.126622, 1, 0, 0.05490196, 1,
2.463964, 0.3164902, 1.77225, 1, 0, 0.04705882, 1,
2.484024, -0.5945624, 1.812906, 1, 0, 0.04313726, 1,
2.605085, -0.2964504, 1.286454, 1, 0, 0.03529412, 1,
2.707834, -1.184331, 1.867421, 1, 0, 0.03137255, 1,
2.846857, -0.325561, -0.2640996, 1, 0, 0.02352941, 1,
2.921865, 0.03588087, 2.540327, 1, 0, 0.01960784, 1,
2.981356, -0.7010964, 0.6688694, 1, 0, 0.01176471, 1,
3.688158, -2.263231, 2.712456, 1, 0, 0.007843138, 1
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
0.3152418, -4.473975, -7.059381, 0, -0.5, 0.5, 0.5,
0.3152418, -4.473975, -7.059381, 1, -0.5, 0.5, 0.5,
0.3152418, -4.473975, -7.059381, 1, 1.5, 0.5, 0.5,
0.3152418, -4.473975, -7.059381, 0, 1.5, 0.5, 0.5
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
-4.201093, 0.2442586, -7.059381, 0, -0.5, 0.5, 0.5,
-4.201093, 0.2442586, -7.059381, 1, -0.5, 0.5, 0.5,
-4.201093, 0.2442586, -7.059381, 1, 1.5, 0.5, 0.5,
-4.201093, 0.2442586, -7.059381, 0, 1.5, 0.5, 0.5
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
-4.201093, -4.473975, 0.2743592, 0, -0.5, 0.5, 0.5,
-4.201093, -4.473975, 0.2743592, 1, -0.5, 0.5, 0.5,
-4.201093, -4.473975, 0.2743592, 1, 1.5, 0.5, 0.5,
-4.201093, -4.473975, 0.2743592, 0, 1.5, 0.5, 0.5
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
-3, -3.385152, -5.36698,
3, -3.385152, -5.36698,
-3, -3.385152, -5.36698,
-3, -3.566623, -5.649046,
-2, -3.385152, -5.36698,
-2, -3.566623, -5.649046,
-1, -3.385152, -5.36698,
-1, -3.566623, -5.649046,
0, -3.385152, -5.36698,
0, -3.566623, -5.649046,
1, -3.385152, -5.36698,
1, -3.566623, -5.649046,
2, -3.385152, -5.36698,
2, -3.566623, -5.649046,
3, -3.385152, -5.36698,
3, -3.566623, -5.649046
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
-3, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
-3, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
-3, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
-3, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5,
-2, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
-2, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
-2, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
-2, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5,
-1, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
-1, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
-1, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
-1, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5,
0, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
0, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
0, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
0, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5,
1, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
1, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
1, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
1, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5,
2, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
2, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
2, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
2, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5,
3, -3.929564, -6.213181, 0, -0.5, 0.5, 0.5,
3, -3.929564, -6.213181, 1, -0.5, 0.5, 0.5,
3, -3.929564, -6.213181, 1, 1.5, 0.5, 0.5,
3, -3.929564, -6.213181, 0, 1.5, 0.5, 0.5
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
-3.158862, -2, -5.36698,
-3.158862, 2, -5.36698,
-3.158862, -2, -5.36698,
-3.332567, -2, -5.649046,
-3.158862, 0, -5.36698,
-3.332567, 0, -5.649046,
-3.158862, 2, -5.36698,
-3.332567, 2, -5.649046
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
-3.679977, -2, -6.213181, 0, -0.5, 0.5, 0.5,
-3.679977, -2, -6.213181, 1, -0.5, 0.5, 0.5,
-3.679977, -2, -6.213181, 1, 1.5, 0.5, 0.5,
-3.679977, -2, -6.213181, 0, 1.5, 0.5, 0.5,
-3.679977, 0, -6.213181, 0, -0.5, 0.5, 0.5,
-3.679977, 0, -6.213181, 1, -0.5, 0.5, 0.5,
-3.679977, 0, -6.213181, 1, 1.5, 0.5, 0.5,
-3.679977, 0, -6.213181, 0, 1.5, 0.5, 0.5,
-3.679977, 2, -6.213181, 0, -0.5, 0.5, 0.5,
-3.679977, 2, -6.213181, 1, -0.5, 0.5, 0.5,
-3.679977, 2, -6.213181, 1, 1.5, 0.5, 0.5,
-3.679977, 2, -6.213181, 0, 1.5, 0.5, 0.5
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
-3.158862, -3.385152, -4,
-3.158862, -3.385152, 4,
-3.158862, -3.385152, -4,
-3.332567, -3.566623, -4,
-3.158862, -3.385152, -2,
-3.332567, -3.566623, -2,
-3.158862, -3.385152, 0,
-3.332567, -3.566623, 0,
-3.158862, -3.385152, 2,
-3.332567, -3.566623, 2,
-3.158862, -3.385152, 4,
-3.332567, -3.566623, 4
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
-3.679977, -3.929564, -4, 0, -0.5, 0.5, 0.5,
-3.679977, -3.929564, -4, 1, -0.5, 0.5, 0.5,
-3.679977, -3.929564, -4, 1, 1.5, 0.5, 0.5,
-3.679977, -3.929564, -4, 0, 1.5, 0.5, 0.5,
-3.679977, -3.929564, -2, 0, -0.5, 0.5, 0.5,
-3.679977, -3.929564, -2, 1, -0.5, 0.5, 0.5,
-3.679977, -3.929564, -2, 1, 1.5, 0.5, 0.5,
-3.679977, -3.929564, -2, 0, 1.5, 0.5, 0.5,
-3.679977, -3.929564, 0, 0, -0.5, 0.5, 0.5,
-3.679977, -3.929564, 0, 1, -0.5, 0.5, 0.5,
-3.679977, -3.929564, 0, 1, 1.5, 0.5, 0.5,
-3.679977, -3.929564, 0, 0, 1.5, 0.5, 0.5,
-3.679977, -3.929564, 2, 0, -0.5, 0.5, 0.5,
-3.679977, -3.929564, 2, 1, -0.5, 0.5, 0.5,
-3.679977, -3.929564, 2, 1, 1.5, 0.5, 0.5,
-3.679977, -3.929564, 2, 0, 1.5, 0.5, 0.5,
-3.679977, -3.929564, 4, 0, -0.5, 0.5, 0.5,
-3.679977, -3.929564, 4, 1, -0.5, 0.5, 0.5,
-3.679977, -3.929564, 4, 1, 1.5, 0.5, 0.5,
-3.679977, -3.929564, 4, 0, 1.5, 0.5, 0.5
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
-3.158862, -3.385152, -5.36698,
-3.158862, 3.873669, -5.36698,
-3.158862, -3.385152, 5.915698,
-3.158862, 3.873669, 5.915698,
-3.158862, -3.385152, -5.36698,
-3.158862, -3.385152, 5.915698,
-3.158862, 3.873669, -5.36698,
-3.158862, 3.873669, 5.915698,
-3.158862, -3.385152, -5.36698,
3.789345, -3.385152, -5.36698,
-3.158862, -3.385152, 5.915698,
3.789345, -3.385152, 5.915698,
-3.158862, 3.873669, -5.36698,
3.789345, 3.873669, -5.36698,
-3.158862, 3.873669, 5.915698,
3.789345, 3.873669, 5.915698,
3.789345, -3.385152, -5.36698,
3.789345, 3.873669, -5.36698,
3.789345, -3.385152, 5.915698,
3.789345, 3.873669, 5.915698,
3.789345, -3.385152, -5.36698,
3.789345, -3.385152, 5.915698,
3.789345, 3.873669, -5.36698,
3.789345, 3.873669, 5.915698
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
var radius = 8.067648;
var distance = 35.89388;
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
mvMatrix.translate( -0.3152418, -0.2442586, -0.2743592 );
mvMatrix.scale( 1.255417, 1.201696, 0.7731231 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.89388);
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
metribuzin<-read.table("metribuzin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metribuzin$V2
```

```
## Error in eval(expr, envir, enclos): object 'metribuzin' not found
```

```r
y<-metribuzin$V3
```

```
## Error in eval(expr, envir, enclos): object 'metribuzin' not found
```

```r
z<-metribuzin$V4
```

```
## Error in eval(expr, envir, enclos): object 'metribuzin' not found
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
-3.057674, -0.5855118, -0.1769819, 0, 0, 1, 1, 1,
-3.045461, 0.1598804, 0.5952276, 1, 0, 0, 1, 1,
-3.027778, -0.02203967, -1.902163, 1, 0, 0, 1, 1,
-2.873677, -0.9038957, -1.849258, 1, 0, 0, 1, 1,
-2.756108, 0.01944136, -2.475283, 1, 0, 0, 1, 1,
-2.704694, -0.7184603, -3.073119, 1, 0, 0, 1, 1,
-2.630049, 1.395584, -1.691703, 0, 0, 0, 1, 1,
-2.622903, -2.851317, -2.589742, 0, 0, 0, 1, 1,
-2.388019, -1.382836, -2.34811, 0, 0, 0, 1, 1,
-2.379977, -0.382813, -2.184024, 0, 0, 0, 1, 1,
-2.33942, 0.2139969, -0.4522141, 0, 0, 0, 1, 1,
-2.323405, 1.089721, -1.797849, 0, 0, 0, 1, 1,
-2.249737, -0.3625647, -0.8530513, 0, 0, 0, 1, 1,
-2.210783, 0.9038336, 0.3003077, 1, 1, 1, 1, 1,
-2.176825, -0.5750038, -1.116343, 1, 1, 1, 1, 1,
-2.147696, 0.08108136, -1.1769, 1, 1, 1, 1, 1,
-2.143786, 0.8661965, -2.26601, 1, 1, 1, 1, 1,
-2.141237, 1.682777, -1.849464, 1, 1, 1, 1, 1,
-2.100608, 0.3432195, -1.501022, 1, 1, 1, 1, 1,
-2.091619, -2.057483, -2.931205, 1, 1, 1, 1, 1,
-2.073726, 1.909991, -0.2697434, 1, 1, 1, 1, 1,
-2.043804, -0.04745509, -1.58943, 1, 1, 1, 1, 1,
-2.041133, -0.3285829, -0.8788552, 1, 1, 1, 1, 1,
-2.04104, 0.9591709, -1.635206, 1, 1, 1, 1, 1,
-2.010236, -1.314156, -1.414701, 1, 1, 1, 1, 1,
-1.998546, 0.2525115, -0.971375, 1, 1, 1, 1, 1,
-1.994405, -0.6505103, -1.131214, 1, 1, 1, 1, 1,
-1.955419, -1.470256, -0.6636546, 1, 1, 1, 1, 1,
-1.945378, 0.3235935, -1.997234, 0, 0, 1, 1, 1,
-1.910118, 0.7064166, -0.01033387, 1, 0, 0, 1, 1,
-1.90928, 0.8699685, -0.4608036, 1, 0, 0, 1, 1,
-1.89842, -0.1552381, -1.548938, 1, 0, 0, 1, 1,
-1.897411, 0.2292525, -1.383283, 1, 0, 0, 1, 1,
-1.885849, 0.7979085, -1.572889, 1, 0, 0, 1, 1,
-1.883967, 0.2450114, -0.2954413, 0, 0, 0, 1, 1,
-1.873758, 0.4236026, -0.3832882, 0, 0, 0, 1, 1,
-1.848855, 0.1295667, -1.607876, 0, 0, 0, 1, 1,
-1.841057, 1.173541, -0.7838081, 0, 0, 0, 1, 1,
-1.833325, 0.3945488, -1.462946, 0, 0, 0, 1, 1,
-1.83193, -2.256267, -4.264865, 0, 0, 0, 1, 1,
-1.802287, 1.722561, -2.102017, 0, 0, 0, 1, 1,
-1.793735, 1.17545, -1.095271, 1, 1, 1, 1, 1,
-1.784886, 0.9268035, -1.478599, 1, 1, 1, 1, 1,
-1.781622, 1.303306, -1.168842, 1, 1, 1, 1, 1,
-1.771993, 0.3575993, -2.560734, 1, 1, 1, 1, 1,
-1.766159, -0.09687953, -1.752694, 1, 1, 1, 1, 1,
-1.766126, 0.4982267, -0.5627118, 1, 1, 1, 1, 1,
-1.764979, 0.03754662, -0.8370278, 1, 1, 1, 1, 1,
-1.761974, -1.172899, -1.04482, 1, 1, 1, 1, 1,
-1.749509, 0.8166825, -0.7784417, 1, 1, 1, 1, 1,
-1.74143, -0.6193881, -2.650105, 1, 1, 1, 1, 1,
-1.729959, -0.1680879, -2.122896, 1, 1, 1, 1, 1,
-1.725209, 0.9591572, -2.572699, 1, 1, 1, 1, 1,
-1.723017, 1.350878, -0.5680572, 1, 1, 1, 1, 1,
-1.722816, 1.584539, 0.1204029, 1, 1, 1, 1, 1,
-1.707317, -0.1598681, -2.324536, 1, 1, 1, 1, 1,
-1.705766, 1.502989, 0.06248438, 0, 0, 1, 1, 1,
-1.698281, 1.388219, -1.704473, 1, 0, 0, 1, 1,
-1.688621, 0.09402909, -1.400897, 1, 0, 0, 1, 1,
-1.685061, -0.2922762, -2.611542, 1, 0, 0, 1, 1,
-1.663934, -0.1328363, -1.748564, 1, 0, 0, 1, 1,
-1.661718, -1.236604, -3.6921, 1, 0, 0, 1, 1,
-1.641067, -0.09346543, -1.848152, 0, 0, 0, 1, 1,
-1.632404, -1.27648, -2.870694, 0, 0, 0, 1, 1,
-1.599829, 0.07932884, 0.06563434, 0, 0, 0, 1, 1,
-1.598414, -0.3695232, -0.1190221, 0, 0, 0, 1, 1,
-1.591306, -0.06346875, -2.473866, 0, 0, 0, 1, 1,
-1.588349, 0.5447125, -2.36316, 0, 0, 0, 1, 1,
-1.581667, -1.458041, -3.176866, 0, 0, 0, 1, 1,
-1.558187, 0.5313292, -0.9221855, 1, 1, 1, 1, 1,
-1.554136, 2.480656, -0.6005925, 1, 1, 1, 1, 1,
-1.552833, -0.2019871, -2.158606, 1, 1, 1, 1, 1,
-1.552831, 0.2358291, -1.812879, 1, 1, 1, 1, 1,
-1.551616, -0.04826946, -1.013911, 1, 1, 1, 1, 1,
-1.544318, 0.1367889, -1.326612, 1, 1, 1, 1, 1,
-1.542182, 2.462672, -0.20746, 1, 1, 1, 1, 1,
-1.539309, -0.3374938, -2.185386, 1, 1, 1, 1, 1,
-1.522203, -0.7274452, -2.994192, 1, 1, 1, 1, 1,
-1.498866, -0.1547485, 1.05462, 1, 1, 1, 1, 1,
-1.496863, 0.4586935, -2.145043, 1, 1, 1, 1, 1,
-1.481724, -0.02010402, -3.668907, 1, 1, 1, 1, 1,
-1.471103, -0.3997906, -2.080362, 1, 1, 1, 1, 1,
-1.47037, 0.4956338, -1.085138, 1, 1, 1, 1, 1,
-1.457312, 0.6909733, -3.785672, 1, 1, 1, 1, 1,
-1.456728, 0.1233741, -0.1470524, 0, 0, 1, 1, 1,
-1.447414, 0.1857971, -1.782811, 1, 0, 0, 1, 1,
-1.427858, 1.525209, 1.780312, 1, 0, 0, 1, 1,
-1.427471, 1.580765, 1.156479, 1, 0, 0, 1, 1,
-1.404526, 0.314865, -2.025881, 1, 0, 0, 1, 1,
-1.402712, 0.1918803, -0.6074457, 1, 0, 0, 1, 1,
-1.383872, -1.910216, -2.880551, 0, 0, 0, 1, 1,
-1.38357, -1.59709, -2.895937, 0, 0, 0, 1, 1,
-1.37884, -1.886743, -3.196308, 0, 0, 0, 1, 1,
-1.352284, -0.1749749, -0.975349, 0, 0, 0, 1, 1,
-1.350081, 2.195552, -0.6480104, 0, 0, 0, 1, 1,
-1.349956, 0.9516535, -1.425935, 0, 0, 0, 1, 1,
-1.342378, -0.2851995, -1.608044, 0, 0, 0, 1, 1,
-1.340369, -0.1930446, -1.818905, 1, 1, 1, 1, 1,
-1.338325, -0.5407983, -3.439469, 1, 1, 1, 1, 1,
-1.337944, -0.2008722, -2.66321, 1, 1, 1, 1, 1,
-1.337766, -0.3765795, -1.005574, 1, 1, 1, 1, 1,
-1.333634, 0.5689726, -0.4666065, 1, 1, 1, 1, 1,
-1.328194, -0.5892514, -2.804389, 1, 1, 1, 1, 1,
-1.318954, 0.5646415, -1.072344, 1, 1, 1, 1, 1,
-1.316958, -0.5173046, -0.8233926, 1, 1, 1, 1, 1,
-1.314639, -0.1435566, -3.10242, 1, 1, 1, 1, 1,
-1.311669, -0.5084968, -1.301055, 1, 1, 1, 1, 1,
-1.305062, -0.1857589, -2.223531, 1, 1, 1, 1, 1,
-1.289686, 1.105489, -0.8959368, 1, 1, 1, 1, 1,
-1.28956, 1.238012, -1.272459, 1, 1, 1, 1, 1,
-1.284383, -0.2707798, -0.7238396, 1, 1, 1, 1, 1,
-1.281729, -0.134736, -1.829411, 1, 1, 1, 1, 1,
-1.258496, -0.5411977, -2.057413, 0, 0, 1, 1, 1,
-1.256411, -1.254713, -2.213929, 1, 0, 0, 1, 1,
-1.246127, 1.515939, -1.091658, 1, 0, 0, 1, 1,
-1.22069, 0.1412755, -0.3712009, 1, 0, 0, 1, 1,
-1.217898, -0.2187951, -2.582464, 1, 0, 0, 1, 1,
-1.217329, -0.08674164, -1.278595, 1, 0, 0, 1, 1,
-1.217321, -0.6089507, -1.619432, 0, 0, 0, 1, 1,
-1.203991, -0.05669626, -1.402102, 0, 0, 0, 1, 1,
-1.201875, 0.01419558, -0.4950219, 0, 0, 0, 1, 1,
-1.199902, 0.7853653, -0.9516272, 0, 0, 0, 1, 1,
-1.183607, 0.05986976, -0.02849468, 0, 0, 0, 1, 1,
-1.173338, 1.622877, -0.4624849, 0, 0, 0, 1, 1,
-1.169615, -0.5897852, -1.645669, 0, 0, 0, 1, 1,
-1.166897, -2.160448, -1.305779, 1, 1, 1, 1, 1,
-1.166665, -0.7643389, -2.586496, 1, 1, 1, 1, 1,
-1.160447, -1.226946, -3.274914, 1, 1, 1, 1, 1,
-1.156608, -0.9783359, -2.055447, 1, 1, 1, 1, 1,
-1.153863, -1.648089, -1.285684, 1, 1, 1, 1, 1,
-1.144056, -1.18201, -3.247308, 1, 1, 1, 1, 1,
-1.143803, -0.3514407, -4.73665, 1, 1, 1, 1, 1,
-1.13749, -0.103387, -1.784101, 1, 1, 1, 1, 1,
-1.134871, 0.7323717, -2.687032, 1, 1, 1, 1, 1,
-1.133079, -1.347423, -2.495183, 1, 1, 1, 1, 1,
-1.130716, -0.2191003, -2.504178, 1, 1, 1, 1, 1,
-1.113698, -0.799713, -1.839838, 1, 1, 1, 1, 1,
-1.112925, 0.3465889, -2.770223, 1, 1, 1, 1, 1,
-1.111255, 0.7629966, 0.2792436, 1, 1, 1, 1, 1,
-1.108637, -1.106502, -1.350002, 1, 1, 1, 1, 1,
-1.09613, -0.6651678, -1.228736, 0, 0, 1, 1, 1,
-1.088641, 0.890956, -0.58441, 1, 0, 0, 1, 1,
-1.083342, -1.08066, -3.86526, 1, 0, 0, 1, 1,
-1.076108, -1.731996, -2.479466, 1, 0, 0, 1, 1,
-1.054495, -0.60548, -3.102833, 1, 0, 0, 1, 1,
-1.032554, 0.6881863, -0.05222965, 1, 0, 0, 1, 1,
-1.031673, 0.9449856, -1.480685, 0, 0, 0, 1, 1,
-1.031245, 0.1104211, -1.506192, 0, 0, 0, 1, 1,
-1.030478, 1.245998, -1.308825, 0, 0, 0, 1, 1,
-1.029562, 0.438331, -0.8342466, 0, 0, 0, 1, 1,
-1.013769, -0.7695827, -1.619322, 0, 0, 0, 1, 1,
-1.00832, 0.1780203, -0.759872, 0, 0, 0, 1, 1,
-1.00777, -0.9728642, -2.384286, 0, 0, 0, 1, 1,
-0.995384, -2.196131, -1.272268, 1, 1, 1, 1, 1,
-0.9884689, 0.8751334, -1.758739, 1, 1, 1, 1, 1,
-0.9674554, -0.3992535, -2.64107, 1, 1, 1, 1, 1,
-0.9666453, 0.1249304, 0.08810526, 1, 1, 1, 1, 1,
-0.9537733, -1.630394, -1.785361, 1, 1, 1, 1, 1,
-0.9516497, -0.6072609, -2.701528, 1, 1, 1, 1, 1,
-0.9512864, 1.123009, -1.166656, 1, 1, 1, 1, 1,
-0.9511518, 2.428066, -0.411007, 1, 1, 1, 1, 1,
-0.9459075, 0.3947978, -0.1947587, 1, 1, 1, 1, 1,
-0.9439493, 1.183884, 0.5106614, 1, 1, 1, 1, 1,
-0.9422663, -0.8914892, -1.00432, 1, 1, 1, 1, 1,
-0.9404264, -1.339668, -0.03288637, 1, 1, 1, 1, 1,
-0.9383845, -0.1578601, -3.461317, 1, 1, 1, 1, 1,
-0.9355412, -0.7432026, -2.765573, 1, 1, 1, 1, 1,
-0.9184425, 0.2529674, -0.8567508, 1, 1, 1, 1, 1,
-0.9130229, -0.7308639, -1.204717, 0, 0, 1, 1, 1,
-0.9075156, 1.830401, 0.4462119, 1, 0, 0, 1, 1,
-0.9043561, 1.557647, -0.6487096, 1, 0, 0, 1, 1,
-0.9028922, -0.8499576, -2.587442, 1, 0, 0, 1, 1,
-0.9022995, -0.6404091, -1.762397, 1, 0, 0, 1, 1,
-0.9014653, -0.9393763, -2.067171, 1, 0, 0, 1, 1,
-0.8993651, -0.2269957, -3.01666, 0, 0, 0, 1, 1,
-0.8908367, 1.4545, 0.5989559, 0, 0, 0, 1, 1,
-0.882057, -1.562407, -2.356394, 0, 0, 0, 1, 1,
-0.880795, -2.180394, -0.9350145, 0, 0, 0, 1, 1,
-0.8788261, -0.3961032, -1.047428, 0, 0, 0, 1, 1,
-0.8753443, 0.2167336, -2.521914, 0, 0, 0, 1, 1,
-0.8634458, -1.4053, -1.261385, 0, 0, 0, 1, 1,
-0.8496873, 2.313101, 0.1076156, 1, 1, 1, 1, 1,
-0.8483346, 1.5556, -1.559686, 1, 1, 1, 1, 1,
-0.848276, -0.1026681, -3.300145, 1, 1, 1, 1, 1,
-0.8434509, 0.3515421, -0.9246451, 1, 1, 1, 1, 1,
-0.8384847, 1.869952, -1.213435, 1, 1, 1, 1, 1,
-0.8382795, 0.2083647, -2.44305, 1, 1, 1, 1, 1,
-0.8355201, 2.213952, -0.8113797, 1, 1, 1, 1, 1,
-0.8335166, 0.9221783, 1.122956, 1, 1, 1, 1, 1,
-0.8331866, -0.4646408, -1.330613, 1, 1, 1, 1, 1,
-0.8299831, -0.9908807, -1.265961, 1, 1, 1, 1, 1,
-0.8297231, 0.0184256, -2.717278, 1, 1, 1, 1, 1,
-0.8228515, -0.359841, -0.3396511, 1, 1, 1, 1, 1,
-0.8227379, -1.21771, -1.104175, 1, 1, 1, 1, 1,
-0.8211613, -0.1437103, -2.873946, 1, 1, 1, 1, 1,
-0.8209794, -1.190307, -2.665258, 1, 1, 1, 1, 1,
-0.8167545, -0.1332681, -2.443622, 0, 0, 1, 1, 1,
-0.8160934, -0.4573886, -3.307781, 1, 0, 0, 1, 1,
-0.8151623, 0.8016793, -1.287588, 1, 0, 0, 1, 1,
-0.8127525, -0.255264, -2.745058, 1, 0, 0, 1, 1,
-0.8092602, 0.3932409, -0.3006582, 1, 0, 0, 1, 1,
-0.8083884, 0.9956002, -0.2372003, 1, 0, 0, 1, 1,
-0.8070306, -0.1603599, -1.371305, 0, 0, 0, 1, 1,
-0.8005859, 1.273685, -2.804698, 0, 0, 0, 1, 1,
-0.792668, 1.999268, -0.9920008, 0, 0, 0, 1, 1,
-0.7916033, -0.4264426, -1.101433, 0, 0, 0, 1, 1,
-0.7906995, -2.18259, -2.785235, 0, 0, 0, 1, 1,
-0.7903385, -1.39385, -4.179634, 0, 0, 0, 1, 1,
-0.7847106, -1.984464, -0.5985855, 0, 0, 0, 1, 1,
-0.7841163, 0.2193364, -0.8684441, 1, 1, 1, 1, 1,
-0.7835951, 0.7245284, -0.7858853, 1, 1, 1, 1, 1,
-0.7821845, -0.03246044, -2.614261, 1, 1, 1, 1, 1,
-0.7773407, 0.7908345, -0.04005773, 1, 1, 1, 1, 1,
-0.7765034, -1.270394, -2.305538, 1, 1, 1, 1, 1,
-0.7759916, 0.8454092, -1.527, 1, 1, 1, 1, 1,
-0.7724886, 0.007525955, -0.8250654, 1, 1, 1, 1, 1,
-0.7723517, 0.0805708, -1.815564, 1, 1, 1, 1, 1,
-0.7678126, 1.246031, -0.4520558, 1, 1, 1, 1, 1,
-0.7672006, 1.119143, -1.222557, 1, 1, 1, 1, 1,
-0.7632604, -0.9692934, -1.061108, 1, 1, 1, 1, 1,
-0.7614026, 1.095659, -0.8912029, 1, 1, 1, 1, 1,
-0.7572761, 0.6184759, -1.397545, 1, 1, 1, 1, 1,
-0.7509692, -0.2762626, -2.85336, 1, 1, 1, 1, 1,
-0.748945, 0.3837115, -0.5956466, 1, 1, 1, 1, 1,
-0.7428496, -0.9906334, -2.92844, 0, 0, 1, 1, 1,
-0.7376816, -0.6854954, -2.595595, 1, 0, 0, 1, 1,
-0.7357723, -1.23521, -1.351812, 1, 0, 0, 1, 1,
-0.7328729, 0.1237301, -1.088764, 1, 0, 0, 1, 1,
-0.7292758, 1.272988, 0.157047, 1, 0, 0, 1, 1,
-0.727794, 0.1871263, -1.7584, 1, 0, 0, 1, 1,
-0.7261799, -1.460401, -3.056128, 0, 0, 0, 1, 1,
-0.7258894, 1.087834, -0.5119721, 0, 0, 0, 1, 1,
-0.7241936, 0.1565066, -2.204292, 0, 0, 0, 1, 1,
-0.7188462, -0.2170055, -2.943837, 0, 0, 0, 1, 1,
-0.716566, 0.1464669, -2.254628, 0, 0, 0, 1, 1,
-0.7140266, -0.9916262, -3.040075, 0, 0, 0, 1, 1,
-0.7136855, 0.04622991, -2.652387, 0, 0, 0, 1, 1,
-0.7129799, 2.333017, -0.6689662, 1, 1, 1, 1, 1,
-0.7122831, -0.3346777, -2.209977, 1, 1, 1, 1, 1,
-0.7112116, -0.4512804, -0.2010578, 1, 1, 1, 1, 1,
-0.7111939, 0.2209466, 0.2187799, 1, 1, 1, 1, 1,
-0.7050103, -0.6861752, -3.43827, 1, 1, 1, 1, 1,
-0.7042441, 1.887532, -0.4816584, 1, 1, 1, 1, 1,
-0.6996648, 0.1268505, -0.5013283, 1, 1, 1, 1, 1,
-0.6989757, 1.419619, -1.049178, 1, 1, 1, 1, 1,
-0.6980389, -0.5158909, -2.012899, 1, 1, 1, 1, 1,
-0.6926075, 1.326054, 0.4829788, 1, 1, 1, 1, 1,
-0.6917192, -0.7166832, -0.8876327, 1, 1, 1, 1, 1,
-0.6914936, 0.07132029, -0.6139801, 1, 1, 1, 1, 1,
-0.6884649, 0.07038429, -2.96446, 1, 1, 1, 1, 1,
-0.6847126, 1.767896, -0.7169898, 1, 1, 1, 1, 1,
-0.6770545, -2.166769, -2.530188, 1, 1, 1, 1, 1,
-0.6750798, 2.217708, -1.058848, 0, 0, 1, 1, 1,
-0.6745017, 0.5212777, -0.07548527, 1, 0, 0, 1, 1,
-0.6735466, 0.5048871, 1.4412, 1, 0, 0, 1, 1,
-0.6714801, -0.5221901, -2.050601, 1, 0, 0, 1, 1,
-0.6659396, -0.6223609, -3.870934, 1, 0, 0, 1, 1,
-0.6632511, -0.1786948, -1.044722, 1, 0, 0, 1, 1,
-0.6600199, 1.536187, 0.02890341, 0, 0, 0, 1, 1,
-0.6589359, 3.280559, 0.420069, 0, 0, 0, 1, 1,
-0.6548676, 0.858844, -2.305106, 0, 0, 0, 1, 1,
-0.6497393, -0.2552863, -3.154694, 0, 0, 0, 1, 1,
-0.6487237, 0.2797919, -1.160033, 0, 0, 0, 1, 1,
-0.6394991, -2.195261, -2.312926, 0, 0, 0, 1, 1,
-0.6392035, 0.9340072, -0.323215, 0, 0, 0, 1, 1,
-0.6340833, -1.431802, -2.372228, 1, 1, 1, 1, 1,
-0.6300098, -1.170651, -2.053427, 1, 1, 1, 1, 1,
-0.6196647, 0.9104326, -3.51232, 1, 1, 1, 1, 1,
-0.6196535, 0.7889696, -2.142728, 1, 1, 1, 1, 1,
-0.6158035, -1.63547, -2.839468, 1, 1, 1, 1, 1,
-0.6099892, 1.819445, -0.001192286, 1, 1, 1, 1, 1,
-0.6074589, -0.7640297, -1.883306, 1, 1, 1, 1, 1,
-0.6021719, -0.9094526, -0.9247174, 1, 1, 1, 1, 1,
-0.5996773, 0.3827595, -1.525555, 1, 1, 1, 1, 1,
-0.5973291, -0.5336865, -1.552177, 1, 1, 1, 1, 1,
-0.5965996, -1.934296, -2.255477, 1, 1, 1, 1, 1,
-0.5962625, -0.8876859, -2.621478, 1, 1, 1, 1, 1,
-0.5956407, 0.3459556, 1.053711, 1, 1, 1, 1, 1,
-0.5953068, -0.9782, -3.610781, 1, 1, 1, 1, 1,
-0.591351, -0.9322786, -2.849722, 1, 1, 1, 1, 1,
-0.5904709, 0.7715667, 0.5489799, 0, 0, 1, 1, 1,
-0.5903418, -1.013903, -1.000958, 1, 0, 0, 1, 1,
-0.5841648, 0.3199683, -0.9787137, 1, 0, 0, 1, 1,
-0.5826952, -0.8540419, -0.1512635, 1, 0, 0, 1, 1,
-0.5822233, 0.4426426, -0.6911446, 1, 0, 0, 1, 1,
-0.5812367, 1.873214, 0.1914587, 1, 0, 0, 1, 1,
-0.5780188, -0.4191362, -0.7658567, 0, 0, 0, 1, 1,
-0.5762346, -1.513459, -1.344461, 0, 0, 0, 1, 1,
-0.5761691, -1.228021, -1.749452, 0, 0, 0, 1, 1,
-0.5747132, -2.052808, -4.40481, 0, 0, 0, 1, 1,
-0.5719733, -0.4957169, -4.053696, 0, 0, 0, 1, 1,
-0.5675185, 2.917281, 0.9612545, 0, 0, 0, 1, 1,
-0.5674076, -0.3206817, -3.134959, 0, 0, 0, 1, 1,
-0.5654603, 0.7722988, -0.3310142, 1, 1, 1, 1, 1,
-0.5501576, 0.104239, -3.02941, 1, 1, 1, 1, 1,
-0.5436814, -0.1434377, -3.788095, 1, 1, 1, 1, 1,
-0.5418216, -1.553986, -2.002981, 1, 1, 1, 1, 1,
-0.5369622, 0.2382445, -2.210417, 1, 1, 1, 1, 1,
-0.5350422, -1.915789, -3.52963, 1, 1, 1, 1, 1,
-0.5340092, 0.04647398, -2.732394, 1, 1, 1, 1, 1,
-0.5303701, 0.52767, -1.990567, 1, 1, 1, 1, 1,
-0.5281745, 0.2297552, -0.3108362, 1, 1, 1, 1, 1,
-0.5268893, 1.457115, -0.3807792, 1, 1, 1, 1, 1,
-0.5267459, -0.1887507, -1.024933, 1, 1, 1, 1, 1,
-0.5178849, -0.210607, -2.510744, 1, 1, 1, 1, 1,
-0.5159851, 0.2626325, -2.232424, 1, 1, 1, 1, 1,
-0.5079971, 0.1477601, -1.949502, 1, 1, 1, 1, 1,
-0.5057308, 0.03051951, -1.784545, 1, 1, 1, 1, 1,
-0.5056208, 1.145666, -2.607367, 0, 0, 1, 1, 1,
-0.4974227, -0.7692234, -2.876867, 1, 0, 0, 1, 1,
-0.4947208, 0.6532987, -2.078053, 1, 0, 0, 1, 1,
-0.4921678, -1.107571, -2.244211, 1, 0, 0, 1, 1,
-0.4890332, -0.2911629, -1.647741, 1, 0, 0, 1, 1,
-0.4880089, 1.105684, 0.1405547, 1, 0, 0, 1, 1,
-0.4858092, 0.8421483, -1.068414, 0, 0, 0, 1, 1,
-0.48091, 1.53883, 0.2776513, 0, 0, 0, 1, 1,
-0.4731299, 0.008142996, -0.5340574, 0, 0, 0, 1, 1,
-0.4663216, 1.498238, 0.1376816, 0, 0, 0, 1, 1,
-0.4662716, 0.6182481, -0.1403144, 0, 0, 0, 1, 1,
-0.4652402, -0.9826991, -1.620575, 0, 0, 0, 1, 1,
-0.4638326, -0.3305031, -3.324876, 0, 0, 0, 1, 1,
-0.4635686, 1.045895, -0.1441735, 1, 1, 1, 1, 1,
-0.4615033, 0.5376182, -1.558021, 1, 1, 1, 1, 1,
-0.4554255, -0.6890514, -2.560922, 1, 1, 1, 1, 1,
-0.4547225, -1.47737, -3.668915, 1, 1, 1, 1, 1,
-0.4531801, -0.5314866, -1.667054, 1, 1, 1, 1, 1,
-0.4430403, 0.06576755, 0.3454731, 1, 1, 1, 1, 1,
-0.4403462, 0.4027699, -0.5512798, 1, 1, 1, 1, 1,
-0.43916, -0.7261871, -2.557962, 1, 1, 1, 1, 1,
-0.4370024, 0.6483715, -1.215963, 1, 1, 1, 1, 1,
-0.4358633, -0.5624278, -2.248194, 1, 1, 1, 1, 1,
-0.433555, -0.1338012, -0.2517067, 1, 1, 1, 1, 1,
-0.4331235, 0.9801655, -0.958416, 1, 1, 1, 1, 1,
-0.4327002, 0.8741316, -0.05514898, 1, 1, 1, 1, 1,
-0.43067, 0.04262266, -1.740939, 1, 1, 1, 1, 1,
-0.4301863, -0.9965987, -2.309919, 1, 1, 1, 1, 1,
-0.4301106, -0.04119036, -1.352809, 0, 0, 1, 1, 1,
-0.425981, 0.3010536, -0.973015, 1, 0, 0, 1, 1,
-0.4248579, -1.323443, -2.742753, 1, 0, 0, 1, 1,
-0.4219701, 0.01861403, -2.196853, 1, 0, 0, 1, 1,
-0.4209152, -0.2909252, -0.7739703, 1, 0, 0, 1, 1,
-0.4165632, 0.1608191, 0.3547908, 1, 0, 0, 1, 1,
-0.4154992, 0.3511987, -1.706009, 0, 0, 0, 1, 1,
-0.4134145, 0.6073533, 0.3046706, 0, 0, 0, 1, 1,
-0.4119399, 0.0891419, -2.613735, 0, 0, 0, 1, 1,
-0.4111466, -0.3273265, -2.284163, 0, 0, 0, 1, 1,
-0.4018657, 1.304415, 0.8328967, 0, 0, 0, 1, 1,
-0.3990379, 0.3665607, -0.808796, 0, 0, 0, 1, 1,
-0.3957622, -0.2953392, -2.312871, 0, 0, 0, 1, 1,
-0.3891568, -0.3881864, -1.364948, 1, 1, 1, 1, 1,
-0.389102, -0.8865471, -1.057139, 1, 1, 1, 1, 1,
-0.3846371, 1.471545, 0.9576946, 1, 1, 1, 1, 1,
-0.3845985, 1.52602, -1.262217, 1, 1, 1, 1, 1,
-0.3808101, 1.327186, -0.04875833, 1, 1, 1, 1, 1,
-0.3799985, -0.4641095, -2.21799, 1, 1, 1, 1, 1,
-0.3795861, -0.5758215, -3.799953, 1, 1, 1, 1, 1,
-0.3757575, 0.573836, -0.08994703, 1, 1, 1, 1, 1,
-0.3738521, 0.9120852, -0.8338557, 1, 1, 1, 1, 1,
-0.3737697, 0.0660066, -1.078919, 1, 1, 1, 1, 1,
-0.3657771, 1.522026, -0.05072287, 1, 1, 1, 1, 1,
-0.3638699, -0.9258229, -3.113066, 1, 1, 1, 1, 1,
-0.3616017, 0.04123032, 0.08861203, 1, 1, 1, 1, 1,
-0.3611116, -0.4078993, -3.442597, 1, 1, 1, 1, 1,
-0.3601868, 0.4958944, -0.2645143, 1, 1, 1, 1, 1,
-0.3567626, 0.09087491, -2.006908, 0, 0, 1, 1, 1,
-0.3539898, -0.9233546, -2.304976, 1, 0, 0, 1, 1,
-0.3473781, -0.9232027, -1.455526, 1, 0, 0, 1, 1,
-0.3467022, -0.1275259, -2.167271, 1, 0, 0, 1, 1,
-0.3453341, -0.5660384, -4.601078, 1, 0, 0, 1, 1,
-0.3450268, -0.3496347, -2.70521, 1, 0, 0, 1, 1,
-0.3431646, 1.655334, -0.4875962, 0, 0, 0, 1, 1,
-0.3420076, 0.2477089, -2.874171, 0, 0, 0, 1, 1,
-0.341581, -1.89536, -4.446932, 0, 0, 0, 1, 1,
-0.3319469, -2.658683, -1.762626, 0, 0, 0, 1, 1,
-0.3244978, 0.08679637, -1.463462, 0, 0, 0, 1, 1,
-0.3235665, 0.02528768, -1.142232, 0, 0, 0, 1, 1,
-0.3204029, -1.418701, -4.265315, 0, 0, 0, 1, 1,
-0.3202153, 1.721177, -0.7557369, 1, 1, 1, 1, 1,
-0.3193089, -3.267348, -2.226839, 1, 1, 1, 1, 1,
-0.3180239, -0.02562858, -1.273307, 1, 1, 1, 1, 1,
-0.3147456, 0.6973194, -0.2098983, 1, 1, 1, 1, 1,
-0.3140449, -0.07917161, -2.264835, 1, 1, 1, 1, 1,
-0.3100733, -0.01914268, -3.458231, 1, 1, 1, 1, 1,
-0.309159, -0.7332973, -3.582859, 1, 1, 1, 1, 1,
-0.3084113, 1.25343, -1.894036, 1, 1, 1, 1, 1,
-0.308325, 1.6959, 0.9865905, 1, 1, 1, 1, 1,
-0.3011575, 0.2483497, -0.8696952, 1, 1, 1, 1, 1,
-0.2868176, -1.42749, -3.143467, 1, 1, 1, 1, 1,
-0.2868157, -0.7298056, -2.535443, 1, 1, 1, 1, 1,
-0.2857391, -0.2791638, -2.091079, 1, 1, 1, 1, 1,
-0.2820465, -1.621618, -3.850001, 1, 1, 1, 1, 1,
-0.2763392, 1.303728, 0.3905397, 1, 1, 1, 1, 1,
-0.2689126, 0.3050417, -0.05593694, 0, 0, 1, 1, 1,
-0.2675772, -0.9395424, -3.136031, 1, 0, 0, 1, 1,
-0.2648753, -0.634852, -2.656875, 1, 0, 0, 1, 1,
-0.2600427, 1.468007, -2.620854, 1, 0, 0, 1, 1,
-0.2590144, -0.1997736, -2.724924, 1, 0, 0, 1, 1,
-0.256353, 0.2127002, 1.158305, 1, 0, 0, 1, 1,
-0.2538258, -0.1641548, -1.552655, 0, 0, 0, 1, 1,
-0.2502099, -0.003545616, -2.068051, 0, 0, 0, 1, 1,
-0.2490024, 1.397288, 0.3586901, 0, 0, 0, 1, 1,
-0.245795, -0.3868781, -1.339269, 0, 0, 0, 1, 1,
-0.2407964, -0.003251462, -1.413495, 0, 0, 0, 1, 1,
-0.2400651, -3.279441, -3.840714, 0, 0, 0, 1, 1,
-0.2372863, 0.4703235, -2.345871, 0, 0, 0, 1, 1,
-0.2353797, -1.345334, -1.355166, 1, 1, 1, 1, 1,
-0.235024, -1.434454, -3.967875, 1, 1, 1, 1, 1,
-0.2323196, 1.414599, -0.737923, 1, 1, 1, 1, 1,
-0.2319785, 0.3147551, 0.1629775, 1, 1, 1, 1, 1,
-0.2300495, 0.6002515, -0.5358515, 1, 1, 1, 1, 1,
-0.228837, 0.2602356, -1.431005, 1, 1, 1, 1, 1,
-0.2271178, -0.1420761, -1.636055, 1, 1, 1, 1, 1,
-0.22564, 0.6243467, -2.111282, 1, 1, 1, 1, 1,
-0.209029, 0.7140452, 0.7048946, 1, 1, 1, 1, 1,
-0.2079581, 0.8537359, 1.460782, 1, 1, 1, 1, 1,
-0.2007458, 0.3236173, -0.2098388, 1, 1, 1, 1, 1,
-0.1999004, 1.352584, 0.4985165, 1, 1, 1, 1, 1,
-0.1978822, 0.2541315, -2.331366, 1, 1, 1, 1, 1,
-0.1960649, 0.9782091, 0.6287925, 1, 1, 1, 1, 1,
-0.1933232, 0.3372248, -0.4068192, 1, 1, 1, 1, 1,
-0.1904418, 0.732402, -0.370503, 0, 0, 1, 1, 1,
-0.1886568, 0.3382241, -0.6823667, 1, 0, 0, 1, 1,
-0.1811051, -1.071123, -1.838686, 1, 0, 0, 1, 1,
-0.1785038, 0.6771619, 0.3232027, 1, 0, 0, 1, 1,
-0.1764981, -1.020443, -3.173822, 1, 0, 0, 1, 1,
-0.1756971, -1.256097, -2.71383, 1, 0, 0, 1, 1,
-0.1703187, -0.3507, -1.963658, 0, 0, 0, 1, 1,
-0.167163, 0.2004204, -0.7465534, 0, 0, 0, 1, 1,
-0.1590605, -1.416623, -4.346653, 0, 0, 0, 1, 1,
-0.1575215, 0.3357849, -1.649807, 0, 0, 0, 1, 1,
-0.1545974, 0.3373307, -0.7381219, 0, 0, 0, 1, 1,
-0.1544375, 0.6553269, -0.3150664, 0, 0, 0, 1, 1,
-0.1498934, -2.29031, -4.291139, 0, 0, 0, 1, 1,
-0.1494557, -1.996539, -5.011696, 1, 1, 1, 1, 1,
-0.1447478, 0.4436976, -0.3868693, 1, 1, 1, 1, 1,
-0.1432197, 0.05509117, -0.4243426, 1, 1, 1, 1, 1,
-0.1369569, 1.358328, 0.5477974, 1, 1, 1, 1, 1,
-0.1356215, -0.5189435, -4.489354, 1, 1, 1, 1, 1,
-0.1338626, -0.3896987, -0.1821066, 1, 1, 1, 1, 1,
-0.133392, -0.6968797, -2.700785, 1, 1, 1, 1, 1,
-0.1303178, -0.8621113, -2.576378, 1, 1, 1, 1, 1,
-0.1298891, -0.6326362, -1.981454, 1, 1, 1, 1, 1,
-0.1294078, 1.417469, -0.07230103, 1, 1, 1, 1, 1,
-0.1269847, 0.52228, -0.07116856, 1, 1, 1, 1, 1,
-0.1192997, 0.4074279, -0.9526778, 1, 1, 1, 1, 1,
-0.1140236, 1.343951, 1.40927, 1, 1, 1, 1, 1,
-0.1133446, -0.04527679, -2.419235, 1, 1, 1, 1, 1,
-0.1131805, -0.0721092, -2.038167, 1, 1, 1, 1, 1,
-0.1091867, 0.2251477, 0.8301141, 0, 0, 1, 1, 1,
-0.1091849, -0.975243, -4.151826, 1, 0, 0, 1, 1,
-0.1087365, 0.8042616, 0.7706813, 1, 0, 0, 1, 1,
-0.1080648, -1.356063, -2.611061, 1, 0, 0, 1, 1,
-0.1068877, 0.191416, 0.6195758, 1, 0, 0, 1, 1,
-0.1022677, 0.7746894, -0.716844, 1, 0, 0, 1, 1,
-0.1015124, -0.01654258, -1.982525, 0, 0, 0, 1, 1,
-0.1004044, -2.604539, -2.487084, 0, 0, 0, 1, 1,
-0.09981313, -0.9018528, -3.773649, 0, 0, 0, 1, 1,
-0.09809384, 1.006656, -0.5436605, 0, 0, 0, 1, 1,
-0.09515741, -0.3352927, -3.50739, 0, 0, 0, 1, 1,
-0.09250212, -0.6287713, -4.221567, 0, 0, 0, 1, 1,
-0.09216066, 1.515173, 0.6791229, 0, 0, 0, 1, 1,
-0.08617096, -1.109372, -2.852323, 1, 1, 1, 1, 1,
-0.08483224, -0.7077308, -4.633359, 1, 1, 1, 1, 1,
-0.08208203, -0.659395, -4.318818, 1, 1, 1, 1, 1,
-0.07371782, 2.564667, -2.407089, 1, 1, 1, 1, 1,
-0.07297754, 0.8798398, 1.38848, 1, 1, 1, 1, 1,
-0.07244243, 0.4412641, -0.9842417, 1, 1, 1, 1, 1,
-0.06806755, 0.7210985, -1.497945, 1, 1, 1, 1, 1,
-0.06622034, -0.1832679, -2.192882, 1, 1, 1, 1, 1,
-0.05541223, -1.039216, -4.330486, 1, 1, 1, 1, 1,
-0.05442475, -0.137004, -4.846792, 1, 1, 1, 1, 1,
-0.05420442, -1.683524, -4.611001, 1, 1, 1, 1, 1,
-0.05009649, 0.03362968, 0.5728289, 1, 1, 1, 1, 1,
-0.04931597, 1.397881, 0.4651994, 1, 1, 1, 1, 1,
-0.04835779, -1.237788, -2.553268, 1, 1, 1, 1, 1,
-0.04427367, 1.19405, -1.156566, 1, 1, 1, 1, 1,
-0.04309731, 0.7547199, 0.2655168, 0, 0, 1, 1, 1,
-0.03937337, 0.9254015, -0.08813095, 1, 0, 0, 1, 1,
-0.03377748, 1.208386, -1.117323, 1, 0, 0, 1, 1,
-0.02418855, -0.07255937, -2.986273, 1, 0, 0, 1, 1,
-0.02411465, 0.2582832, -1.4617, 1, 0, 0, 1, 1,
-0.02296646, -2.033051, -4.230127, 1, 0, 0, 1, 1,
-0.02280375, -0.6730897, -3.433285, 0, 0, 0, 1, 1,
-0.01441707, -0.5962598, -2.077686, 0, 0, 0, 1, 1,
-0.01287966, 0.8076964, 0.1951174, 0, 0, 0, 1, 1,
-0.01096562, -0.657995, -5.202669, 0, 0, 0, 1, 1,
-0.008969346, 2.596055, -0.8225904, 0, 0, 0, 1, 1,
-0.007870173, 0.5043505, -0.7603338, 0, 0, 0, 1, 1,
-0.00612099, 0.2547472, -0.08396064, 0, 0, 0, 1, 1,
-0.003227693, -0.6568126, -3.241686, 1, 1, 1, 1, 1,
-0.002044854, -0.4817218, -3.204981, 1, 1, 1, 1, 1,
0.000429998, -0.1587045, 4.05983, 1, 1, 1, 1, 1,
0.00840114, -1.544533, 3.518447, 1, 1, 1, 1, 1,
0.009743894, -0.719681, 2.184248, 1, 1, 1, 1, 1,
0.009972299, 0.282082, 1.397487, 1, 1, 1, 1, 1,
0.02361234, -0.4143624, 2.180523, 1, 1, 1, 1, 1,
0.02750007, 0.8009493, 1.505693, 1, 1, 1, 1, 1,
0.02766793, -0.4452364, 1.180198, 1, 1, 1, 1, 1,
0.03102632, 0.6712649, -0.7379436, 1, 1, 1, 1, 1,
0.03455724, -0.007925893, 1.804616, 1, 1, 1, 1, 1,
0.03707518, 1.011192, -1.056495, 1, 1, 1, 1, 1,
0.03779344, -1.261201, 2.824874, 1, 1, 1, 1, 1,
0.03923856, 0.990095, -1.61981, 1, 1, 1, 1, 1,
0.04085061, -1.242628, 3.283972, 1, 1, 1, 1, 1,
0.0430699, 0.7837572, -0.1044124, 0, 0, 1, 1, 1,
0.04311774, -1.028603, 3.811426, 1, 0, 0, 1, 1,
0.04888069, 0.2607208, 0.08478183, 1, 0, 0, 1, 1,
0.05238655, 0.6667392, -0.3453476, 1, 0, 0, 1, 1,
0.07045511, 0.03501017, 0.6359131, 1, 0, 0, 1, 1,
0.07471254, 0.2328249, 0.4183484, 1, 0, 0, 1, 1,
0.08455914, 1.674942, -0.4496132, 0, 0, 0, 1, 1,
0.0853147, -0.0510183, 3.250003, 0, 0, 0, 1, 1,
0.0854025, 2.037117, 0.7951815, 0, 0, 0, 1, 1,
0.08818959, 2.156792, 0.8840115, 0, 0, 0, 1, 1,
0.08989143, 1.26307, -1.445311, 0, 0, 0, 1, 1,
0.08992872, -0.4049472, 2.092412, 0, 0, 0, 1, 1,
0.0939157, -0.1024686, 3.535269, 0, 0, 0, 1, 1,
0.1001508, -1.199806, 3.983445, 1, 1, 1, 1, 1,
0.1069012, -1.945357, 2.977656, 1, 1, 1, 1, 1,
0.1074425, -0.09406965, 2.555849, 1, 1, 1, 1, 1,
0.1136076, -0.2661605, 2.749134, 1, 1, 1, 1, 1,
0.1203694, -0.222316, 2.527742, 1, 1, 1, 1, 1,
0.1209024, -0.6810552, 2.839555, 1, 1, 1, 1, 1,
0.1288735, 1.929534, 0.8132267, 1, 1, 1, 1, 1,
0.1299614, 0.03199086, 1.489072, 1, 1, 1, 1, 1,
0.1305466, 1.299017, 0.3053553, 1, 1, 1, 1, 1,
0.1311367, 0.07673309, 1.712243, 1, 1, 1, 1, 1,
0.1354287, -0.8909616, 3.796421, 1, 1, 1, 1, 1,
0.1370419, -0.5240424, 2.145005, 1, 1, 1, 1, 1,
0.1400311, -1.011165, 2.100674, 1, 1, 1, 1, 1,
0.1427372, -0.8955935, 5.718727, 1, 1, 1, 1, 1,
0.1454711, -0.2209362, 2.173217, 1, 1, 1, 1, 1,
0.1462268, 0.05722327, 1.357461, 0, 0, 1, 1, 1,
0.1495868, -0.8001409, 3.034212, 1, 0, 0, 1, 1,
0.1531282, -1.978845, 3.000665, 1, 0, 0, 1, 1,
0.1557928, 0.9581937, 0.8906348, 1, 0, 0, 1, 1,
0.1560732, 0.5515152, 1.20626, 1, 0, 0, 1, 1,
0.1584749, -1.512039, 3.204321, 1, 0, 0, 1, 1,
0.1608166, -0.2569577, 3.828062, 0, 0, 0, 1, 1,
0.1643846, 0.1609807, 1.535301, 0, 0, 0, 1, 1,
0.1644312, -0.2101686, 4.003727, 0, 0, 0, 1, 1,
0.1648334, 0.8894952, 0.58219, 0, 0, 0, 1, 1,
0.1650407, -0.8796716, 2.087037, 0, 0, 0, 1, 1,
0.1688935, 0.2347398, 1.527025, 0, 0, 0, 1, 1,
0.1689171, -0.2995668, 2.639935, 0, 0, 0, 1, 1,
0.17219, -2.036059, 3.452174, 1, 1, 1, 1, 1,
0.1804536, -1.242758, 2.168202, 1, 1, 1, 1, 1,
0.1806106, 0.8407919, 0.4701396, 1, 1, 1, 1, 1,
0.1811645, 0.2037196, -0.2120009, 1, 1, 1, 1, 1,
0.1852309, -0.7558238, 2.866565, 1, 1, 1, 1, 1,
0.1876345, -0.02318373, 1.938203, 1, 1, 1, 1, 1,
0.1907558, 1.393893, 1.258256, 1, 1, 1, 1, 1,
0.1918376, -1.745785, 5.751387, 1, 1, 1, 1, 1,
0.1959185, 0.2379794, 0.4370976, 1, 1, 1, 1, 1,
0.1961385, -0.8796043, 4.078688, 1, 1, 1, 1, 1,
0.196161, -0.2473447, 3.273577, 1, 1, 1, 1, 1,
0.2023676, -1.397938, 3.684796, 1, 1, 1, 1, 1,
0.2047394, 1.537157, -0.3654064, 1, 1, 1, 1, 1,
0.2048655, 1.653754, 0.03964363, 1, 1, 1, 1, 1,
0.206181, -0.2243359, 3.396453, 1, 1, 1, 1, 1,
0.2063326, 0.5462627, -0.1843194, 0, 0, 1, 1, 1,
0.208498, 1.606375, -0.3418598, 1, 0, 0, 1, 1,
0.210963, 1.751521, 1.223389, 1, 0, 0, 1, 1,
0.2124039, -0.4094497, 3.746956, 1, 0, 0, 1, 1,
0.2142921, 0.2906457, 1.215156, 1, 0, 0, 1, 1,
0.2195518, -0.7236383, 2.861781, 1, 0, 0, 1, 1,
0.2201172, 0.6733552, -0.01056414, 0, 0, 0, 1, 1,
0.2247472, -0.8818235, 1.254383, 0, 0, 0, 1, 1,
0.2269691, -0.1651886, 2.443825, 0, 0, 0, 1, 1,
0.2278974, 0.2540981, -0.3068001, 0, 0, 0, 1, 1,
0.2313581, 1.060171, -0.1236731, 0, 0, 0, 1, 1,
0.2319495, -1.088756, 3.955637, 0, 0, 0, 1, 1,
0.2324685, 0.2502545, 2.134447, 0, 0, 0, 1, 1,
0.2327209, -0.3730318, 3.132421, 1, 1, 1, 1, 1,
0.2331765, 0.8699016, -1.081539, 1, 1, 1, 1, 1,
0.2337196, 0.2935618, 1.470974, 1, 1, 1, 1, 1,
0.236431, 0.9107885, 0.8865156, 1, 1, 1, 1, 1,
0.2371419, -2.515505, 3.332363, 1, 1, 1, 1, 1,
0.24013, 1.53103, -0.6678166, 1, 1, 1, 1, 1,
0.2404659, -0.7795665, 3.560557, 1, 1, 1, 1, 1,
0.2424146, -0.5093093, 2.816712, 1, 1, 1, 1, 1,
0.2464726, 0.7745841, -0.9199134, 1, 1, 1, 1, 1,
0.2511287, 0.8679957, 1.309396, 1, 1, 1, 1, 1,
0.2511305, 0.3445609, 1.380579, 1, 1, 1, 1, 1,
0.2526767, 1.075366, -0.7812232, 1, 1, 1, 1, 1,
0.2535779, 0.8551394, -2.455288, 1, 1, 1, 1, 1,
0.2638455, 1.366116, 1.267783, 1, 1, 1, 1, 1,
0.2718416, 0.1145428, -1.773563, 1, 1, 1, 1, 1,
0.2736165, 1.432441, 0.48553, 0, 0, 1, 1, 1,
0.2774796, -1.536764, 2.37327, 1, 0, 0, 1, 1,
0.2819031, 0.4823742, 0.2005148, 1, 0, 0, 1, 1,
0.2827615, -1.376685, 3.214437, 1, 0, 0, 1, 1,
0.2875139, 0.1109637, 0.4070927, 1, 0, 0, 1, 1,
0.2905201, -0.2180975, 0.09979491, 1, 0, 0, 1, 1,
0.2924578, 0.8102117, 0.139523, 0, 0, 0, 1, 1,
0.2926204, 0.5410006, 1.866914, 0, 0, 0, 1, 1,
0.2933252, 0.5612341, 0.1286923, 0, 0, 0, 1, 1,
0.2960817, -1.595341, 1.610407, 0, 0, 0, 1, 1,
0.296222, -2.06188, 1.702972, 0, 0, 0, 1, 1,
0.2988176, 1.102508, -0.4451779, 0, 0, 0, 1, 1,
0.3020436, -1.508981, 2.747839, 0, 0, 0, 1, 1,
0.3033939, -1.156189, 2.251523, 1, 1, 1, 1, 1,
0.3036683, -0.673765, 1.751861, 1, 1, 1, 1, 1,
0.3045007, 1.895212, -1.690277, 1, 1, 1, 1, 1,
0.3055677, -1.348682, 3.240599, 1, 1, 1, 1, 1,
0.3076601, 0.5486517, -0.04306283, 1, 1, 1, 1, 1,
0.309271, 0.08236775, 2.662598, 1, 1, 1, 1, 1,
0.310496, 0.1186458, 2.346469, 1, 1, 1, 1, 1,
0.3127422, 0.9395757, 0.1303442, 1, 1, 1, 1, 1,
0.3159033, 1.144285, -1.865758, 1, 1, 1, 1, 1,
0.3170294, -1.599182, 4.117679, 1, 1, 1, 1, 1,
0.3206079, -1.177517, 3.473819, 1, 1, 1, 1, 1,
0.3207426, -0.2192264, 0.5823132, 1, 1, 1, 1, 1,
0.3227102, 0.2676617, 0.7372316, 1, 1, 1, 1, 1,
0.3239654, -0.972991, 3.890326, 1, 1, 1, 1, 1,
0.3263098, -0.20517, 2.553462, 1, 1, 1, 1, 1,
0.3281648, 0.1583607, 2.782717, 0, 0, 1, 1, 1,
0.3329792, -0.05990474, 1.669695, 1, 0, 0, 1, 1,
0.334615, 0.6953839, 0.4151635, 1, 0, 0, 1, 1,
0.3348245, 0.3932614, 1.230566, 1, 0, 0, 1, 1,
0.3360982, -0.7798597, 4.560858, 1, 0, 0, 1, 1,
0.3364865, -0.05289603, 0.8182756, 1, 0, 0, 1, 1,
0.3382874, 0.7185522, 0.4060263, 0, 0, 0, 1, 1,
0.3403877, 0.03212766, 2.070769, 0, 0, 0, 1, 1,
0.3463142, -0.5977184, 2.491817, 0, 0, 0, 1, 1,
0.3489195, 0.7859993, 0.5456861, 0, 0, 0, 1, 1,
0.3522505, 3.767958, -0.680615, 0, 0, 0, 1, 1,
0.3531259, -0.9303135, 3.764347, 0, 0, 0, 1, 1,
0.3557945, 0.2896555, 0.1052478, 0, 0, 0, 1, 1,
0.3665504, 2.231725, 1.492996, 1, 1, 1, 1, 1,
0.3668158, -0.08910458, 2.050515, 1, 1, 1, 1, 1,
0.3680694, -1.157631, 3.230961, 1, 1, 1, 1, 1,
0.3698127, 1.408619, 0.9160224, 1, 1, 1, 1, 1,
0.3699346, 0.7231311, 2.285725, 1, 1, 1, 1, 1,
0.3709464, 1.029035, -0.7135824, 1, 1, 1, 1, 1,
0.3709596, 0.9410726, -0.4348294, 1, 1, 1, 1, 1,
0.3712849, -0.1726866, 0.6640067, 1, 1, 1, 1, 1,
0.373704, -0.1328087, 1.608828, 1, 1, 1, 1, 1,
0.3770601, -0.02366939, 0.841023, 1, 1, 1, 1, 1,
0.3794467, -0.4692513, 3.283694, 1, 1, 1, 1, 1,
0.3798562, -0.1191377, 2.729218, 1, 1, 1, 1, 1,
0.3825753, 1.133786, 0.4840764, 1, 1, 1, 1, 1,
0.3832333, -0.5007506, 1.770675, 1, 1, 1, 1, 1,
0.3835576, -0.3874483, 2.281028, 1, 1, 1, 1, 1,
0.3863133, -0.3450411, -0.1736231, 0, 0, 1, 1, 1,
0.3876969, 1.262667, -0.9617544, 1, 0, 0, 1, 1,
0.3885472, 0.1937174, -0.1490579, 1, 0, 0, 1, 1,
0.3891676, -0.5216351, 2.405278, 1, 0, 0, 1, 1,
0.3934951, 1.094796, 2.116889, 1, 0, 0, 1, 1,
0.3978195, -0.1294463, -0.1099828, 1, 0, 0, 1, 1,
0.3991464, -1.168422, 0.9744331, 0, 0, 0, 1, 1,
0.3993572, 1.249235, -0.3136097, 0, 0, 0, 1, 1,
0.4019396, 0.08605613, 1.389907, 0, 0, 0, 1, 1,
0.4024657, -0.2587155, 2.021792, 0, 0, 0, 1, 1,
0.4055299, -0.2482956, 1.618172, 0, 0, 0, 1, 1,
0.4117067, 0.6007878, 1.093369, 0, 0, 0, 1, 1,
0.4156998, 1.142447, 0.03793911, 0, 0, 0, 1, 1,
0.4252117, 1.51734, 0.4063207, 1, 1, 1, 1, 1,
0.426048, -0.7845882, 3.325835, 1, 1, 1, 1, 1,
0.4276738, 0.4743125, -0.2655306, 1, 1, 1, 1, 1,
0.4326236, 1.149454, 0.5748005, 1, 1, 1, 1, 1,
0.4327243, -2.289135, 4.620295, 1, 1, 1, 1, 1,
0.434627, 0.767405, 0.7561409, 1, 1, 1, 1, 1,
0.4356061, -1.085316, 3.018415, 1, 1, 1, 1, 1,
0.4386412, 1.572108, -0.7616256, 1, 1, 1, 1, 1,
0.4394735, 2.085678, 0.7071384, 1, 1, 1, 1, 1,
0.4408296, 0.03631464, 1.902538, 1, 1, 1, 1, 1,
0.44093, 0.9586341, 1.01159, 1, 1, 1, 1, 1,
0.4426979, 1.643193, -1.02357, 1, 1, 1, 1, 1,
0.4449084, 0.1352636, 0.9298053, 1, 1, 1, 1, 1,
0.4465038, 0.3983794, 0.5534248, 1, 1, 1, 1, 1,
0.4498904, -0.3903999, 1.204681, 1, 1, 1, 1, 1,
0.4577693, 0.8560791, 1.073514, 0, 0, 1, 1, 1,
0.459897, -2.119804, 3.383717, 1, 0, 0, 1, 1,
0.463306, -0.3811381, 3.674875, 1, 0, 0, 1, 1,
0.4697909, 0.1176715, 1.108195, 1, 0, 0, 1, 1,
0.4762706, -0.1975006, 2.055913, 1, 0, 0, 1, 1,
0.4783556, 1.783504, 0.174708, 1, 0, 0, 1, 1,
0.4796734, -0.4618705, 1.891831, 0, 0, 0, 1, 1,
0.4885464, 1.131791, 0.05198268, 0, 0, 0, 1, 1,
0.4886509, -0.1274817, 0.4938028, 0, 0, 0, 1, 1,
0.4904573, -1.106667, 1.942568, 0, 0, 0, 1, 1,
0.4956806, -2.251017, 3.380704, 0, 0, 0, 1, 1,
0.4964682, -0.2191807, 2.162143, 0, 0, 0, 1, 1,
0.4971849, -0.1148011, 1.184241, 0, 0, 0, 1, 1,
0.4997362, -0.3254497, 1.149038, 1, 1, 1, 1, 1,
0.501316, -1.052856, 2.596187, 1, 1, 1, 1, 1,
0.5036271, 0.1906345, 2.847828, 1, 1, 1, 1, 1,
0.5048587, -1.285578, 4.277121, 1, 1, 1, 1, 1,
0.5064133, 1.237358, -0.7706696, 1, 1, 1, 1, 1,
0.5122874, 0.3333487, 0.5253593, 1, 1, 1, 1, 1,
0.5125257, -1.493287, 1.55068, 1, 1, 1, 1, 1,
0.5143906, 0.5613834, 0.004020383, 1, 1, 1, 1, 1,
0.51639, 1.787005, 1.33587, 1, 1, 1, 1, 1,
0.5167129, -0.3447684, 2.193934, 1, 1, 1, 1, 1,
0.5238062, -0.299927, 3.929427, 1, 1, 1, 1, 1,
0.5240279, 1.042704, 0.2037405, 1, 1, 1, 1, 1,
0.5244642, -0.3432584, 3.061881, 1, 1, 1, 1, 1,
0.5251927, -0.854805, 2.624337, 1, 1, 1, 1, 1,
0.5254102, -0.000592644, 2.75112, 1, 1, 1, 1, 1,
0.526837, 0.09202817, 1.045655, 0, 0, 1, 1, 1,
0.528216, -0.7368908, 1.509787, 1, 0, 0, 1, 1,
0.5308039, 0.516715, 0.2124401, 1, 0, 0, 1, 1,
0.5335431, -0.5208375, 3.65669, 1, 0, 0, 1, 1,
0.538591, 3.020541, 0.5856481, 1, 0, 0, 1, 1,
0.545231, -1.209839, 2.317319, 1, 0, 0, 1, 1,
0.5460008, 1.138123, 2.177799, 0, 0, 0, 1, 1,
0.551511, 0.3497177, 1.260599, 0, 0, 0, 1, 1,
0.552812, 0.3881205, 1.835728, 0, 0, 0, 1, 1,
0.5565283, -0.5306863, 2.412091, 0, 0, 0, 1, 1,
0.5579209, -1.093317, 2.768985, 0, 0, 0, 1, 1,
0.5623349, -1.517953, 3.277754, 0, 0, 0, 1, 1,
0.5673478, -0.6371583, 1.021666, 0, 0, 0, 1, 1,
0.5731769, 0.7695726, -0.4019267, 1, 1, 1, 1, 1,
0.57581, 0.4341578, 1.095215, 1, 1, 1, 1, 1,
0.5804306, -0.2234618, 0.431801, 1, 1, 1, 1, 1,
0.5820184, -0.7078975, 1.788311, 1, 1, 1, 1, 1,
0.5854191, -0.3375307, 2.182546, 1, 1, 1, 1, 1,
0.5860131, 0.9944735, 0.5741642, 1, 1, 1, 1, 1,
0.5896858, -0.8355306, 3.063031, 1, 1, 1, 1, 1,
0.5918332, -1.278305, 2.65448, 1, 1, 1, 1, 1,
0.5977468, 1.163672, 0.7823959, 1, 1, 1, 1, 1,
0.5994018, -1.210298, 3.251544, 1, 1, 1, 1, 1,
0.6002144, -1.533512, 1.435073, 1, 1, 1, 1, 1,
0.6034691, -0.1062316, 1.723099, 1, 1, 1, 1, 1,
0.6041863, -0.2636708, 3.87578, 1, 1, 1, 1, 1,
0.6050406, -0.5215931, 3.855891, 1, 1, 1, 1, 1,
0.6070969, 0.344955, 0.3819322, 1, 1, 1, 1, 1,
0.612048, 2.295038, 1.818108, 0, 0, 1, 1, 1,
0.6146168, 0.8757622, 0.2241835, 1, 0, 0, 1, 1,
0.6149287, -0.6064997, 3.978649, 1, 0, 0, 1, 1,
0.6160343, -0.03910841, 1.08905, 1, 0, 0, 1, 1,
0.6202103, 0.7134375, 1.165398, 1, 0, 0, 1, 1,
0.6212009, 0.1669054, 2.419718, 1, 0, 0, 1, 1,
0.6232553, 0.5499583, 0.8180411, 0, 0, 0, 1, 1,
0.6232872, 0.7435577, 1.621982, 0, 0, 0, 1, 1,
0.6253724, 1.122956, 1.27204, 0, 0, 0, 1, 1,
0.6266708, -0.9062786, 2.493296, 0, 0, 0, 1, 1,
0.6276827, -0.2332702, 1.584217, 0, 0, 0, 1, 1,
0.6320239, 1.356703, 0.6750656, 0, 0, 0, 1, 1,
0.6396285, -1.032379, 3.668008, 0, 0, 0, 1, 1,
0.6414753, -0.4404209, 2.834122, 1, 1, 1, 1, 1,
0.6513089, 0.8390368, 1.683392, 1, 1, 1, 1, 1,
0.6536097, 0.584392, 1.129926, 1, 1, 1, 1, 1,
0.6597244, -0.8790274, 1.983153, 1, 1, 1, 1, 1,
0.6615527, -0.7918109, 2.708473, 1, 1, 1, 1, 1,
0.6660625, -1.468043, 2.351438, 1, 1, 1, 1, 1,
0.6710157, 0.5876525, 0.1765189, 1, 1, 1, 1, 1,
0.6713938, 0.1921844, 2.166691, 1, 1, 1, 1, 1,
0.6825976, 1.778038, 1.041342, 1, 1, 1, 1, 1,
0.6842157, -0.4522342, 0.6160998, 1, 1, 1, 1, 1,
0.6869991, 1.257982, -0.06766608, 1, 1, 1, 1, 1,
0.6921481, -0.3633106, 3.023567, 1, 1, 1, 1, 1,
0.6946071, -0.3490855, 3.059302, 1, 1, 1, 1, 1,
0.6988438, 0.6007509, -1.262833, 1, 1, 1, 1, 1,
0.6996946, 0.4345102, 0.8683863, 1, 1, 1, 1, 1,
0.7017093, 1.323138, 0.03957376, 0, 0, 1, 1, 1,
0.7074416, -1.089021, 3.952031, 1, 0, 0, 1, 1,
0.7111275, 0.2367003, 1.458419, 1, 0, 0, 1, 1,
0.7134581, -0.05644146, 1.456092, 1, 0, 0, 1, 1,
0.7164608, -0.3067007, 1.189325, 1, 0, 0, 1, 1,
0.7246186, 0.1771308, 2.245038, 1, 0, 0, 1, 1,
0.7254843, -0.6005458, 1.587415, 0, 0, 0, 1, 1,
0.7260538, 0.247708, 1.028604, 0, 0, 0, 1, 1,
0.7269292, 1.54471, 0.8034193, 0, 0, 0, 1, 1,
0.7273781, -0.001126927, 1.955097, 0, 0, 0, 1, 1,
0.7288006, -0.17692, 2.286362, 0, 0, 0, 1, 1,
0.7310646, 0.1077564, 3.389691, 0, 0, 0, 1, 1,
0.7339917, 1.724634, 3.311077, 0, 0, 0, 1, 1,
0.733997, -1.19953, 2.375328, 1, 1, 1, 1, 1,
0.7361742, 0.07615452, 2.384735, 1, 1, 1, 1, 1,
0.7411548, -0.6857955, 3.151745, 1, 1, 1, 1, 1,
0.7444829, 0.8755946, -1.141567, 1, 1, 1, 1, 1,
0.7539556, 0.474601, -0.4486884, 1, 1, 1, 1, 1,
0.7561947, -0.06797992, 0.2187684, 1, 1, 1, 1, 1,
0.7600237, 0.9928631, 1.239646, 1, 1, 1, 1, 1,
0.7709377, 0.6917418, 1.113495, 1, 1, 1, 1, 1,
0.7751575, 0.1239612, 1.384538, 1, 1, 1, 1, 1,
0.7782773, 0.5818601, 3.212326, 1, 1, 1, 1, 1,
0.7805021, -0.5681069, 1.908389, 1, 1, 1, 1, 1,
0.7875077, -0.3423198, 2.277, 1, 1, 1, 1, 1,
0.7885894, 0.6600153, 2.322827, 1, 1, 1, 1, 1,
0.7891576, 0.4619497, -0.08758476, 1, 1, 1, 1, 1,
0.7931514, -0.1479322, 2.361098, 1, 1, 1, 1, 1,
0.795289, -0.6682686, 4.462682, 0, 0, 1, 1, 1,
0.7983294, 1.640992, 0.7083274, 1, 0, 0, 1, 1,
0.8056813, 1.805533, 0.3176705, 1, 0, 0, 1, 1,
0.8169938, 0.2771052, 0.5328768, 1, 0, 0, 1, 1,
0.8174376, -3.155371, 3.215491, 1, 0, 0, 1, 1,
0.8245736, 0.5401435, 0.2208774, 1, 0, 0, 1, 1,
0.8265623, 0.1982255, 0.9036931, 0, 0, 0, 1, 1,
0.8270908, 0.7040243, 0.8302326, 0, 0, 0, 1, 1,
0.8272342, 2.15795, 1.017551, 0, 0, 0, 1, 1,
0.8273937, 1.130766, 0.1713192, 0, 0, 0, 1, 1,
0.8308342, -1.150616, 1.038258, 0, 0, 0, 1, 1,
0.8312469, 1.653676, 0.4189248, 0, 0, 0, 1, 1,
0.8329721, -1.426265, 2.643052, 0, 0, 0, 1, 1,
0.853606, -1.122531, 4.980755, 1, 1, 1, 1, 1,
0.8591672, 1.524605, 1.161423, 1, 1, 1, 1, 1,
0.8624023, 0.0908286, 1.165872, 1, 1, 1, 1, 1,
0.8676644, -1.47776, 2.148431, 1, 1, 1, 1, 1,
0.8701841, -0.05864718, 2.398474, 1, 1, 1, 1, 1,
0.873274, 1.931198, 0.9308808, 1, 1, 1, 1, 1,
0.8743548, -0.4182926, 1.202361, 1, 1, 1, 1, 1,
0.8840245, -0.04028923, 1.017743, 1, 1, 1, 1, 1,
0.8934486, -0.07912408, 0.4321722, 1, 1, 1, 1, 1,
0.8936037, 3.341237, 1.709542, 1, 1, 1, 1, 1,
0.8982823, 0.669583, 1.911573, 1, 1, 1, 1, 1,
0.8995538, 0.9742776, 0.9797745, 1, 1, 1, 1, 1,
0.8997028, -0.7160841, 3.307903, 1, 1, 1, 1, 1,
0.9012732, -0.4374765, 0.952309, 1, 1, 1, 1, 1,
0.9027115, -0.315326, 1.723701, 1, 1, 1, 1, 1,
0.9029978, 0.1979723, 2.631778, 0, 0, 1, 1, 1,
0.9038544, -0.2754413, 0.7409288, 1, 0, 0, 1, 1,
0.9078166, 1.027296, 1.109012, 1, 0, 0, 1, 1,
0.9146062, 0.348289, 0.3130618, 1, 0, 0, 1, 1,
0.9158777, 0.281559, 1.997667, 1, 0, 0, 1, 1,
0.9174678, 0.7638575, 1.221079, 1, 0, 0, 1, 1,
0.9207114, 0.5703891, 2.05435, 0, 0, 0, 1, 1,
0.9287397, -0.4666554, 4.582822, 0, 0, 0, 1, 1,
0.928915, 0.02644191, 1.753675, 0, 0, 0, 1, 1,
0.9314845, -1.573457, 2.386713, 0, 0, 0, 1, 1,
0.931793, 0.7713114, 2.093323, 0, 0, 0, 1, 1,
0.9323155, -0.1651306, 3.011567, 0, 0, 0, 1, 1,
0.9323719, 0.3427939, 1.588865, 0, 0, 0, 1, 1,
0.9327012, 1.086917, -0.2836498, 1, 1, 1, 1, 1,
0.9358675, -0.3360683, 2.389219, 1, 1, 1, 1, 1,
0.9378007, 1.680269, 0.9147722, 1, 1, 1, 1, 1,
0.939266, 1.487735, -1.025854, 1, 1, 1, 1, 1,
0.9420865, -1.416621, 2.124788, 1, 1, 1, 1, 1,
0.9463338, 0.2113453, 0.3879449, 1, 1, 1, 1, 1,
0.9486045, -0.4291415, 1.578395, 1, 1, 1, 1, 1,
0.9493963, -0.4698456, 3.328856, 1, 1, 1, 1, 1,
0.9534118, -1.609169, 2.60606, 1, 1, 1, 1, 1,
0.9548323, -0.9638602, 1.955797, 1, 1, 1, 1, 1,
0.9604787, -0.4985512, 2.041863, 1, 1, 1, 1, 1,
0.966881, -1.683861, 0.8947524, 1, 1, 1, 1, 1,
0.9702224, 1.016999, 2.468652, 1, 1, 1, 1, 1,
0.9716585, -0.5043363, 3.076354, 1, 1, 1, 1, 1,
0.9717241, 0.01818819, 1.904707, 1, 1, 1, 1, 1,
0.9888194, 1.823016, 0.1769601, 0, 0, 1, 1, 1,
1.000634, -0.7499497, 1.889767, 1, 0, 0, 1, 1,
1.003526, -0.2207811, 3.375559, 1, 0, 0, 1, 1,
1.007279, -0.3913526, 2.504499, 1, 0, 0, 1, 1,
1.014606, 1.707983, 0.4490717, 1, 0, 0, 1, 1,
1.014815, 0.5719728, -0.1842495, 1, 0, 0, 1, 1,
1.014995, -0.289686, 2.526293, 0, 0, 0, 1, 1,
1.019502, -0.1765431, 1.287641, 0, 0, 0, 1, 1,
1.021484, -1.35802, 2.770209, 0, 0, 0, 1, 1,
1.02183, -0.3503416, 1.464473, 0, 0, 0, 1, 1,
1.02199, 0.04410078, 0.473073, 0, 0, 0, 1, 1,
1.030986, -0.3587414, 2.754884, 0, 0, 0, 1, 1,
1.036305, -1.011428, 1.948982, 0, 0, 0, 1, 1,
1.041206, 0.9826189, 1.471495, 1, 1, 1, 1, 1,
1.046074, 1.015521, 0.8997943, 1, 1, 1, 1, 1,
1.059949, -2.32043, 1.654902, 1, 1, 1, 1, 1,
1.06078, -1.695849, 0.4792073, 1, 1, 1, 1, 1,
1.062364, -1.509252, 2.983572, 1, 1, 1, 1, 1,
1.067264, -0.2490795, 3.033491, 1, 1, 1, 1, 1,
1.078082, -1.306098, 1.423492, 1, 1, 1, 1, 1,
1.080311, 0.08992465, 3.146101, 1, 1, 1, 1, 1,
1.083385, -0.5660918, 1.745894, 1, 1, 1, 1, 1,
1.086195, 1.013757, 0.7743971, 1, 1, 1, 1, 1,
1.086792, -0.006181301, 3.128006, 1, 1, 1, 1, 1,
1.087917, 1.74093, 0.1257288, 1, 1, 1, 1, 1,
1.091427, 0.5971332, 2.602243, 1, 1, 1, 1, 1,
1.094374, -0.02823056, 2.23921, 1, 1, 1, 1, 1,
1.10352, -1.711918, 1.846985, 1, 1, 1, 1, 1,
1.110106, -0.797507, 1.32166, 0, 0, 1, 1, 1,
1.113116, 0.3355493, 1.341508, 1, 0, 0, 1, 1,
1.119135, -0.6389431, 1.377648, 1, 0, 0, 1, 1,
1.12981, -0.8401676, 2.602564, 1, 0, 0, 1, 1,
1.137179, -0.6380287, 3.401793, 1, 0, 0, 1, 1,
1.145604, -0.01429988, 1.057853, 1, 0, 0, 1, 1,
1.150611, -1.178518, 2.439721, 0, 0, 0, 1, 1,
1.15126, -0.2094533, 1.85574, 0, 0, 0, 1, 1,
1.153517, 1.112378, 0.6272825, 0, 0, 0, 1, 1,
1.163749, 0.3394671, 1.327244, 0, 0, 0, 1, 1,
1.167389, -0.6391181, 3.146466, 0, 0, 0, 1, 1,
1.171077, -1.366931, 3.794736, 0, 0, 0, 1, 1,
1.172358, -0.3975202, 1.36351, 0, 0, 0, 1, 1,
1.178309, 0.08842639, 0.09205665, 1, 1, 1, 1, 1,
1.180475, 0.4954209, 0.2843351, 1, 1, 1, 1, 1,
1.183389, -0.9429585, 1.220951, 1, 1, 1, 1, 1,
1.193711, 1.357077, 2.279016, 1, 1, 1, 1, 1,
1.194894, 0.7705066, 1.14227, 1, 1, 1, 1, 1,
1.198962, -0.1018932, -1.277424, 1, 1, 1, 1, 1,
1.216193, 0.2149031, 1.908685, 1, 1, 1, 1, 1,
1.221422, -0.892493, 1.66275, 1, 1, 1, 1, 1,
1.232164, 0.01058215, 2.572262, 1, 1, 1, 1, 1,
1.24047, 0.3095607, 3.177224, 1, 1, 1, 1, 1,
1.241134, -0.1746888, -0.2006014, 1, 1, 1, 1, 1,
1.249818, 0.6204205, 0.7322816, 1, 1, 1, 1, 1,
1.257054, 0.4556437, 1.073952, 1, 1, 1, 1, 1,
1.259035, 0.5485022, 0.8754489, 1, 1, 1, 1, 1,
1.261763, -1.586295, 1.982994, 1, 1, 1, 1, 1,
1.268072, -0.2936941, 2.644351, 0, 0, 1, 1, 1,
1.26968, -0.3682507, 1.791255, 1, 0, 0, 1, 1,
1.272769, 0.580038, 1.111958, 1, 0, 0, 1, 1,
1.273836, 0.1541616, 1.22518, 1, 0, 0, 1, 1,
1.293247, -1.087601, 3.089061, 1, 0, 0, 1, 1,
1.304407, 0.3444209, -0.7670025, 1, 0, 0, 1, 1,
1.305555, 0.07853211, 2.69244, 0, 0, 0, 1, 1,
1.305786, -2.461128, 2.094808, 0, 0, 0, 1, 1,
1.309007, -0.005194554, 3.361708, 0, 0, 0, 1, 1,
1.311446, -1.616349, 1.37348, 0, 0, 0, 1, 1,
1.312046, -1.787058, 2.922897, 0, 0, 0, 1, 1,
1.316226, -0.8917702, 2.401391, 0, 0, 0, 1, 1,
1.317259, -0.2711159, 0.9572926, 0, 0, 0, 1, 1,
1.317349, -1.510888, 2.243663, 1, 1, 1, 1, 1,
1.318003, 1.115988, 1.10321, 1, 1, 1, 1, 1,
1.328093, -0.1187737, -0.3104434, 1, 1, 1, 1, 1,
1.338044, -0.5875655, 0.5717909, 1, 1, 1, 1, 1,
1.342881, 0.9945796, 0.1851866, 1, 1, 1, 1, 1,
1.348893, 0.6034878, 1.898074, 1, 1, 1, 1, 1,
1.371976, -0.05857252, 2.065378, 1, 1, 1, 1, 1,
1.406805, 0.460385, 1.345501, 1, 1, 1, 1, 1,
1.427504, -0.5647825, 2.100038, 1, 1, 1, 1, 1,
1.432304, 1.230308, -0.5199198, 1, 1, 1, 1, 1,
1.433234, -0.4252327, 1.089227, 1, 1, 1, 1, 1,
1.436415, -0.1223819, 2.232452, 1, 1, 1, 1, 1,
1.436735, 0.4552595, 0.7934819, 1, 1, 1, 1, 1,
1.473561, 1.073912, 1.703055, 1, 1, 1, 1, 1,
1.482517, 0.6371382, 0.317642, 1, 1, 1, 1, 1,
1.487241, 0.5155678, 0.8558692, 0, 0, 1, 1, 1,
1.520245, 0.2190446, 1.989617, 1, 0, 0, 1, 1,
1.566302, 1.40198, 0.3004246, 1, 0, 0, 1, 1,
1.566853, -0.3184474, 3.777197, 1, 0, 0, 1, 1,
1.576656, 1.738242, 0.3710636, 1, 0, 0, 1, 1,
1.584534, 1.797918, 2.295835, 1, 0, 0, 1, 1,
1.593991, -0.8867418, 2.291389, 0, 0, 0, 1, 1,
1.602733, -0.3034133, 2.812128, 0, 0, 0, 1, 1,
1.604788, 0.153609, 3.161918, 0, 0, 0, 1, 1,
1.605488, 0.9832333, 2.122252, 0, 0, 0, 1, 1,
1.614912, -0.4210634, 0.4851532, 0, 0, 0, 1, 1,
1.619373, 0.8005435, 2.362769, 0, 0, 0, 1, 1,
1.631414, 0.8816943, 0.5431675, 0, 0, 0, 1, 1,
1.646053, 2.27083, 0.5864156, 1, 1, 1, 1, 1,
1.647714, -0.04156479, 2.173815, 1, 1, 1, 1, 1,
1.660147, -0.9577296, 2.096226, 1, 1, 1, 1, 1,
1.660924, -0.3890354, 2.471625, 1, 1, 1, 1, 1,
1.696295, -0.2091707, 1.715622, 1, 1, 1, 1, 1,
1.7174, 0.09098282, 0.780443, 1, 1, 1, 1, 1,
1.718977, -0.2335809, 0.4503751, 1, 1, 1, 1, 1,
1.72436, 1.305606, 0.1780834, 1, 1, 1, 1, 1,
1.724559, -0.4212841, 1.461992, 1, 1, 1, 1, 1,
1.733768, -0.8486735, 2.268892, 1, 1, 1, 1, 1,
1.73656, -0.6683462, -0.02276145, 1, 1, 1, 1, 1,
1.751633, 2.533707, 1.029534, 1, 1, 1, 1, 1,
1.752946, 1.773998, 0.5642306, 1, 1, 1, 1, 1,
1.755014, 0.2511489, 0.5330918, 1, 1, 1, 1, 1,
1.758092, 0.522117, 1.495133, 1, 1, 1, 1, 1,
1.758799, -1.409096, 2.337384, 0, 0, 1, 1, 1,
1.76492, -0.002092677, 2.310724, 1, 0, 0, 1, 1,
1.767561, -0.8555524, 3.860558, 1, 0, 0, 1, 1,
1.795316, -1.048999, 1.802256, 1, 0, 0, 1, 1,
1.797307, -0.5041963, 2.593935, 1, 0, 0, 1, 1,
1.814201, -0.4888513, 0.8841122, 1, 0, 0, 1, 1,
1.816063, 0.4746052, 1.724283, 0, 0, 0, 1, 1,
1.828902, 0.2372342, -0.2645893, 0, 0, 0, 1, 1,
1.832599, -0.2168989, 1.938303, 0, 0, 0, 1, 1,
1.852463, 0.02066047, 1.897718, 0, 0, 0, 1, 1,
1.870352, 1.080076, 2.959274, 0, 0, 0, 1, 1,
1.898389, -1.890931, 2.516414, 0, 0, 0, 1, 1,
1.901898, -0.3698387, 1.242746, 0, 0, 0, 1, 1,
1.923139, 1.975504, 0.2191579, 1, 1, 1, 1, 1,
1.932661, -0.7815049, 3.700458, 1, 1, 1, 1, 1,
1.940194, -0.5777141, 2.825262, 1, 1, 1, 1, 1,
1.949405, 1.746216, 0.8323532, 1, 1, 1, 1, 1,
1.949996, -0.180451, 0.4254275, 1, 1, 1, 1, 1,
1.958081, -2.527041, 3.08703, 1, 1, 1, 1, 1,
1.962508, -1.36395, 2.991494, 1, 1, 1, 1, 1,
1.966381, -0.791819, 2.370941, 1, 1, 1, 1, 1,
1.967108, -0.4154368, 1.821231, 1, 1, 1, 1, 1,
1.998945, 0.4438623, 0.9028238, 1, 1, 1, 1, 1,
2.052818, 1.566315, 0.7363347, 1, 1, 1, 1, 1,
2.055117, -0.6827254, 1.915148, 1, 1, 1, 1, 1,
2.08421, 0.2627069, 1.387308, 1, 1, 1, 1, 1,
2.11471, -0.7517947, 1.227267, 1, 1, 1, 1, 1,
2.119585, 1.317197, 0.1723772, 1, 1, 1, 1, 1,
2.127068, 0.3337494, 2.754418, 0, 0, 1, 1, 1,
2.130075, 3.294616, 0.4370653, 1, 0, 0, 1, 1,
2.13976, 0.1775721, 3.335686, 1, 0, 0, 1, 1,
2.149379, -1.213835, 1.755246, 1, 0, 0, 1, 1,
2.16465, 2.766687, 1.081655, 1, 0, 0, 1, 1,
2.186483, 1.514934, 2.472416, 1, 0, 0, 1, 1,
2.187157, -0.8606297, 2.786925, 0, 0, 0, 1, 1,
2.209831, -0.0453295, 0.4933173, 0, 0, 0, 1, 1,
2.226707, -0.06412187, 1.9353, 0, 0, 0, 1, 1,
2.28505, 2.144336, 0.2982135, 0, 0, 0, 1, 1,
2.341198, -0.4270459, 1.895462, 0, 0, 0, 1, 1,
2.443166, -0.6307706, 3.126622, 0, 0, 0, 1, 1,
2.463964, 0.3164902, 1.77225, 0, 0, 0, 1, 1,
2.484024, -0.5945624, 1.812906, 1, 1, 1, 1, 1,
2.605085, -0.2964504, 1.286454, 1, 1, 1, 1, 1,
2.707834, -1.184331, 1.867421, 1, 1, 1, 1, 1,
2.846857, -0.325561, -0.2640996, 1, 1, 1, 1, 1,
2.921865, 0.03588087, 2.540327, 1, 1, 1, 1, 1,
2.981356, -0.7010964, 0.6688694, 1, 1, 1, 1, 1,
3.688158, -2.263231, 2.712456, 1, 1, 1, 1, 1
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
var radius = 9.932832;
var distance = 34.88865;
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
mvMatrix.translate( -0.3152418, -0.2442589, -0.2743592 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88865);
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
