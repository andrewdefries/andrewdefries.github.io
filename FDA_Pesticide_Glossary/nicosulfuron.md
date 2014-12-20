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
-3.516082, -0.6517013, 1.076401, 1, 0, 0, 1,
-3.419736, 0.1459746, -4.099487, 1, 0.007843138, 0, 1,
-3.059039, 0.8664311, -0.7541413, 1, 0.01176471, 0, 1,
-3.039347, 2.745009, -0.15606, 1, 0.01960784, 0, 1,
-3.014066, -1.322716, -1.554194, 1, 0.02352941, 0, 1,
-2.779094, -0.2791297, -1.6162, 1, 0.03137255, 0, 1,
-2.763473, 1.156264, -0.06668898, 1, 0.03529412, 0, 1,
-2.761606, 0.5516936, -0.5358663, 1, 0.04313726, 0, 1,
-2.56486, 1.018345, 1.04973, 1, 0.04705882, 0, 1,
-2.463261, 0.344163, -1.373385, 1, 0.05490196, 0, 1,
-2.319535, -0.166352, -1.82276, 1, 0.05882353, 0, 1,
-2.311341, 0.2405323, -0.6799754, 1, 0.06666667, 0, 1,
-2.306278, 0.4443092, -1.555762, 1, 0.07058824, 0, 1,
-2.304533, 0.588015, -2.536071, 1, 0.07843138, 0, 1,
-2.299687, 0.2692745, -2.503097, 1, 0.08235294, 0, 1,
-2.298849, 0.4080854, -2.258705, 1, 0.09019608, 0, 1,
-2.28309, -1.564333, -3.10035, 1, 0.09411765, 0, 1,
-2.270231, -1.164271, -3.339463, 1, 0.1019608, 0, 1,
-2.263104, -2.154365, -1.948163, 1, 0.1098039, 0, 1,
-2.261916, 0.0996122, -2.668726, 1, 0.1137255, 0, 1,
-2.252611, 0.965691, -2.1263, 1, 0.1215686, 0, 1,
-2.246358, 1.666237, -2.009216, 1, 0.1254902, 0, 1,
-2.23152, 0.9752004, -2.603382, 1, 0.1333333, 0, 1,
-2.228046, -0.1127752, -1.449311, 1, 0.1372549, 0, 1,
-2.144923, -1.178887, -1.401745, 1, 0.145098, 0, 1,
-2.144869, 0.6051741, -0.7647564, 1, 0.1490196, 0, 1,
-2.133121, 0.3221323, -2.343714, 1, 0.1568628, 0, 1,
-2.112205, -1.485439, -2.017624, 1, 0.1607843, 0, 1,
-2.071602, -0.6082455, -1.008948, 1, 0.1686275, 0, 1,
-2.050761, 0.2149255, -2.155874, 1, 0.172549, 0, 1,
-2.047457, 1.489364, -1.139575, 1, 0.1803922, 0, 1,
-2.042201, -1.57392, -2.911173, 1, 0.1843137, 0, 1,
-2.03662, 2.058154, -0.5019313, 1, 0.1921569, 0, 1,
-2.030807, -1.241758, -1.927569, 1, 0.1960784, 0, 1,
-2.020356, -0.437966, -0.8558391, 1, 0.2039216, 0, 1,
-2.019992, 0.3151185, -1.326487, 1, 0.2117647, 0, 1,
-2.004258, 1.196105, -2.044893, 1, 0.2156863, 0, 1,
-1.97597, -0.5246343, 0.4275923, 1, 0.2235294, 0, 1,
-1.947861, 1.001384, 0.01353563, 1, 0.227451, 0, 1,
-1.940284, 1.917284, -1.918743, 1, 0.2352941, 0, 1,
-1.908454, 0.5735512, -2.432464, 1, 0.2392157, 0, 1,
-1.903728, -1.634875, -3.018087, 1, 0.2470588, 0, 1,
-1.889741, -2.142677, -3.420596, 1, 0.2509804, 0, 1,
-1.84586, -1.218123, -2.580851, 1, 0.2588235, 0, 1,
-1.845766, -1.850987, -2.233171, 1, 0.2627451, 0, 1,
-1.834219, -0.5016531, -1.828009, 1, 0.2705882, 0, 1,
-1.831545, -1.183396, -1.999653, 1, 0.2745098, 0, 1,
-1.824705, -1.36885, -1.89789, 1, 0.282353, 0, 1,
-1.823189, -0.02078097, -3.944933, 1, 0.2862745, 0, 1,
-1.818425, -0.6325541, -2.502398, 1, 0.2941177, 0, 1,
-1.796534, 0.2406874, -2.303624, 1, 0.3019608, 0, 1,
-1.783988, 2.05353, 0.8063108, 1, 0.3058824, 0, 1,
-1.758892, -0.2274339, -0.3572942, 1, 0.3137255, 0, 1,
-1.758663, -1.732435, -1.981332, 1, 0.3176471, 0, 1,
-1.746195, 0.3469142, -1.677012, 1, 0.3254902, 0, 1,
-1.701089, -0.6368845, -0.3656716, 1, 0.3294118, 0, 1,
-1.689658, -0.8391075, -0.8995259, 1, 0.3372549, 0, 1,
-1.688896, 0.6240357, -0.8115396, 1, 0.3411765, 0, 1,
-1.658836, 1.834599, 0.2412786, 1, 0.3490196, 0, 1,
-1.652812, -1.504122, -1.299143, 1, 0.3529412, 0, 1,
-1.646582, -1.37118, -1.516539, 1, 0.3607843, 0, 1,
-1.63605, -0.5246148, -2.754954, 1, 0.3647059, 0, 1,
-1.624793, 0.4715296, -0.9826642, 1, 0.372549, 0, 1,
-1.592382, 0.8858512, 0.07026045, 1, 0.3764706, 0, 1,
-1.563765, -0.8881513, -3.691227, 1, 0.3843137, 0, 1,
-1.560966, 0.1441427, -2.877721, 1, 0.3882353, 0, 1,
-1.545193, -0.2376489, -1.441761, 1, 0.3960784, 0, 1,
-1.543711, 0.02153753, -0.4821091, 1, 0.4039216, 0, 1,
-1.540861, -1.275838, -1.227651, 1, 0.4078431, 0, 1,
-1.524189, -1.468038, -2.444122, 1, 0.4156863, 0, 1,
-1.504734, -1.549458, -2.404932, 1, 0.4196078, 0, 1,
-1.504312, 0.4875353, -1.754891, 1, 0.427451, 0, 1,
-1.502863, -0.5104727, -2.365174, 1, 0.4313726, 0, 1,
-1.476074, 0.9135685, -0.7706604, 1, 0.4392157, 0, 1,
-1.475778, 0.938814, -0.2562065, 1, 0.4431373, 0, 1,
-1.46989, -0.558925, -2.673974, 1, 0.4509804, 0, 1,
-1.467069, 1.345272, -1.850985, 1, 0.454902, 0, 1,
-1.466455, 0.06830462, -2.037466, 1, 0.4627451, 0, 1,
-1.453341, -0.120291, -2.996238, 1, 0.4666667, 0, 1,
-1.4455, -0.2923765, -1.53957, 1, 0.4745098, 0, 1,
-1.440441, -0.8853561, -2.378061, 1, 0.4784314, 0, 1,
-1.43423, 0.8485366, -1.996787, 1, 0.4862745, 0, 1,
-1.421784, -0.2212007, -1.104144, 1, 0.4901961, 0, 1,
-1.418329, -0.40363, -3.499445, 1, 0.4980392, 0, 1,
-1.417371, -0.3621195, -2.70135, 1, 0.5058824, 0, 1,
-1.415353, 0.542451, -0.8532292, 1, 0.509804, 0, 1,
-1.411367, 1.904427, 0.06471299, 1, 0.5176471, 0, 1,
-1.406641, 0.4879794, -2.292912, 1, 0.5215687, 0, 1,
-1.404786, -1.459421, 0.2109728, 1, 0.5294118, 0, 1,
-1.404326, -0.2455114, -2.301038, 1, 0.5333334, 0, 1,
-1.394852, -0.1742156, -2.834335, 1, 0.5411765, 0, 1,
-1.383786, -0.06944465, -2.527772, 1, 0.5450981, 0, 1,
-1.382756, -0.05162891, -0.7489814, 1, 0.5529412, 0, 1,
-1.381186, 2.150963, -0.9135146, 1, 0.5568628, 0, 1,
-1.373701, 1.398557, -0.06720267, 1, 0.5647059, 0, 1,
-1.358934, 0.4920241, -0.6684675, 1, 0.5686275, 0, 1,
-1.35475, -1.171976, -0.6748692, 1, 0.5764706, 0, 1,
-1.353016, -0.7050736, -1.533902, 1, 0.5803922, 0, 1,
-1.349811, 0.3369685, -2.207097, 1, 0.5882353, 0, 1,
-1.348343, -1.029098, -3.788684, 1, 0.5921569, 0, 1,
-1.344576, 1.146912, -1.230933, 1, 0.6, 0, 1,
-1.342092, 1.072516, -2.010465, 1, 0.6078432, 0, 1,
-1.341341, 1.678787, -0.2823828, 1, 0.6117647, 0, 1,
-1.329929, -0.7165595, -3.237748, 1, 0.6196079, 0, 1,
-1.325105, -0.6729037, -0.738674, 1, 0.6235294, 0, 1,
-1.31531, -1.828616, -2.591448, 1, 0.6313726, 0, 1,
-1.307289, 0.7278005, 0.004371739, 1, 0.6352941, 0, 1,
-1.302464, -2.215839, -2.475448, 1, 0.6431373, 0, 1,
-1.301634, -0.9315348, -2.896478, 1, 0.6470588, 0, 1,
-1.300892, 0.01149592, -1.628323, 1, 0.654902, 0, 1,
-1.300577, 0.5158945, -1.482963, 1, 0.6588235, 0, 1,
-1.300011, -0.7493089, -2.391748, 1, 0.6666667, 0, 1,
-1.298899, -0.04430518, -1.597068, 1, 0.6705883, 0, 1,
-1.292393, -0.07915073, -1.370297, 1, 0.6784314, 0, 1,
-1.288692, -0.3394704, -3.350271, 1, 0.682353, 0, 1,
-1.287871, -1.584214, -3.234816, 1, 0.6901961, 0, 1,
-1.283666, 0.09883611, -1.033712, 1, 0.6941177, 0, 1,
-1.283381, 2.034628, 0.5073949, 1, 0.7019608, 0, 1,
-1.275684, 0.06632161, -2.542574, 1, 0.7098039, 0, 1,
-1.270911, 2.027027, 0.02850473, 1, 0.7137255, 0, 1,
-1.26539, 1.047676, -1.857915, 1, 0.7215686, 0, 1,
-1.259348, 1.195507, -2.404707, 1, 0.7254902, 0, 1,
-1.257927, 0.1199543, 0.3058399, 1, 0.7333333, 0, 1,
-1.250117, -0.111824, -2.947438, 1, 0.7372549, 0, 1,
-1.245716, 0.991405, -1.100984, 1, 0.7450981, 0, 1,
-1.24446, -0.8854781, -2.406921, 1, 0.7490196, 0, 1,
-1.22926, -1.924978, -1.998475, 1, 0.7568628, 0, 1,
-1.22918, -0.7890747, -0.6888046, 1, 0.7607843, 0, 1,
-1.222353, -0.4474832, -0.6304275, 1, 0.7686275, 0, 1,
-1.220266, -0.2543069, -2.078769, 1, 0.772549, 0, 1,
-1.210583, 1.007295, -1.599089, 1, 0.7803922, 0, 1,
-1.207582, -0.1348381, -1.024493, 1, 0.7843137, 0, 1,
-1.20446, -0.5247795, -2.40933, 1, 0.7921569, 0, 1,
-1.203329, -0.7531449, -2.04761, 1, 0.7960784, 0, 1,
-1.20117, -0.2510618, -1.05492, 1, 0.8039216, 0, 1,
-1.195077, 1.059035, 0.9113981, 1, 0.8117647, 0, 1,
-1.189144, 1.467312, -0.2297451, 1, 0.8156863, 0, 1,
-1.187461, 1.307281, -1.732327, 1, 0.8235294, 0, 1,
-1.186491, -2.252051, -3.698246, 1, 0.827451, 0, 1,
-1.180841, 1.728038, -0.39489, 1, 0.8352941, 0, 1,
-1.174751, -0.2028938, -1.025862, 1, 0.8392157, 0, 1,
-1.174019, 0.5596734, -0.6795136, 1, 0.8470588, 0, 1,
-1.166305, -1.287573, -2.150492, 1, 0.8509804, 0, 1,
-1.163506, -0.5996981, 0.6201952, 1, 0.8588235, 0, 1,
-1.148736, -0.2054967, -2.332198, 1, 0.8627451, 0, 1,
-1.148078, 0.3384675, -2.236824, 1, 0.8705882, 0, 1,
-1.141806, -1.30237, -1.411955, 1, 0.8745098, 0, 1,
-1.135741, -0.3499576, -1.385476, 1, 0.8823529, 0, 1,
-1.13322, 1.127618, -1.923858, 1, 0.8862745, 0, 1,
-1.131805, -0.06548493, -0.4711458, 1, 0.8941177, 0, 1,
-1.117281, 1.848991, -0.4050275, 1, 0.8980392, 0, 1,
-1.116124, -0.3145179, -1.250746, 1, 0.9058824, 0, 1,
-1.114462, 0.3441844, -1.303254, 1, 0.9137255, 0, 1,
-1.113127, 0.9560263, -1.20396, 1, 0.9176471, 0, 1,
-1.110973, -0.02549905, -1.35462, 1, 0.9254902, 0, 1,
-1.10672, 0.8434048, -2.176829, 1, 0.9294118, 0, 1,
-1.104254, 0.4652525, -0.5427655, 1, 0.9372549, 0, 1,
-1.103056, -0.492026, -3.118293, 1, 0.9411765, 0, 1,
-1.096887, 0.7147552, -1.099506, 1, 0.9490196, 0, 1,
-1.096247, 1.506739, 0.3663888, 1, 0.9529412, 0, 1,
-1.088188, -0.1978741, -1.197116, 1, 0.9607843, 0, 1,
-1.086322, 1.308328, -1.384385, 1, 0.9647059, 0, 1,
-1.08372, -0.8237001, -3.840733, 1, 0.972549, 0, 1,
-1.074659, 2.32468, -1.764756, 1, 0.9764706, 0, 1,
-1.071554, -0.4167707, 0.2737208, 1, 0.9843137, 0, 1,
-1.062036, 2.188871, -0.02216059, 1, 0.9882353, 0, 1,
-1.060858, -0.1494869, -1.435221, 1, 0.9960784, 0, 1,
-1.041197, -1.231014, -3.614142, 0.9960784, 1, 0, 1,
-1.039858, -0.5772641, -1.405437, 0.9921569, 1, 0, 1,
-1.035515, 1.56527, -0.7294512, 0.9843137, 1, 0, 1,
-1.032223, -0.4712114, -2.275588, 0.9803922, 1, 0, 1,
-1.023698, 0.7646279, -1.246867, 0.972549, 1, 0, 1,
-1.022697, -1.159421, -2.085569, 0.9686275, 1, 0, 1,
-1.0195, -0.6009579, -2.259528, 0.9607843, 1, 0, 1,
-1.014089, -0.2581485, -2.557693, 0.9568627, 1, 0, 1,
-1.00018, -0.859058, -2.155694, 0.9490196, 1, 0, 1,
-0.9960944, 0.1571741, -1.143864, 0.945098, 1, 0, 1,
-0.989302, -2.09242, -0.6817101, 0.9372549, 1, 0, 1,
-0.9886169, -0.5367842, -0.4438436, 0.9333333, 1, 0, 1,
-0.9855233, -1.807356, -3.387008, 0.9254902, 1, 0, 1,
-0.9759229, -0.4295191, -2.989077, 0.9215686, 1, 0, 1,
-0.9755176, -0.4645129, -1.405639, 0.9137255, 1, 0, 1,
-0.9732335, -1.588431, -1.657124, 0.9098039, 1, 0, 1,
-0.961612, 0.7889804, -1.962914, 0.9019608, 1, 0, 1,
-0.9600875, -0.4979643, 0.1404928, 0.8941177, 1, 0, 1,
-0.9561283, 2.320174, -1.917139, 0.8901961, 1, 0, 1,
-0.951701, -0.003921471, -2.846884, 0.8823529, 1, 0, 1,
-0.94833, -0.06635284, -1.588434, 0.8784314, 1, 0, 1,
-0.9438871, -0.1049595, -4.188179, 0.8705882, 1, 0, 1,
-0.9437417, -1.299832, -2.389282, 0.8666667, 1, 0, 1,
-0.9394652, 0.2483622, -1.401188, 0.8588235, 1, 0, 1,
-0.9275058, -0.6883563, -1.984036, 0.854902, 1, 0, 1,
-0.9266748, 0.6855099, -0.9064339, 0.8470588, 1, 0, 1,
-0.9249038, -0.1283715, -1.623375, 0.8431373, 1, 0, 1,
-0.9219933, -0.531456, -1.232448, 0.8352941, 1, 0, 1,
-0.9176479, 0.2247059, -2.129566, 0.8313726, 1, 0, 1,
-0.9142154, -1.325117, -2.26955, 0.8235294, 1, 0, 1,
-0.9124253, 0.9731399, -1.293696, 0.8196079, 1, 0, 1,
-0.9101815, 0.7389355, 0.1813555, 0.8117647, 1, 0, 1,
-0.9083257, 2.713046, -0.3802444, 0.8078431, 1, 0, 1,
-0.9072152, -1.480681, -1.850438, 0.8, 1, 0, 1,
-0.9070773, -0.5453068, -0.223974, 0.7921569, 1, 0, 1,
-0.9041035, 1.608426, -0.5468549, 0.7882353, 1, 0, 1,
-0.897224, -0.6589928, -0.8463506, 0.7803922, 1, 0, 1,
-0.8897146, 1.239361, -1.959707, 0.7764706, 1, 0, 1,
-0.8880326, -1.066194, -2.653506, 0.7686275, 1, 0, 1,
-0.8738377, 0.4547418, -0.4651551, 0.7647059, 1, 0, 1,
-0.8717968, -0.4211627, -3.651113, 0.7568628, 1, 0, 1,
-0.8691933, -0.2173231, -1.63405, 0.7529412, 1, 0, 1,
-0.861109, 1.073849, 0.781819, 0.7450981, 1, 0, 1,
-0.8584933, 0.6032463, 0.02749992, 0.7411765, 1, 0, 1,
-0.8558463, -1.349625, -1.878383, 0.7333333, 1, 0, 1,
-0.8535448, -0.9021, -3.527904, 0.7294118, 1, 0, 1,
-0.8471142, 1.737293, 1.366836, 0.7215686, 1, 0, 1,
-0.8465331, 0.5375828, 0.3066173, 0.7176471, 1, 0, 1,
-0.843429, -0.9193444, -1.962582, 0.7098039, 1, 0, 1,
-0.8384702, 1.797097, -1.259594, 0.7058824, 1, 0, 1,
-0.8378834, -0.3821065, -1.553473, 0.6980392, 1, 0, 1,
-0.8337652, 0.1133155, -0.9202946, 0.6901961, 1, 0, 1,
-0.83187, 0.01686097, -1.423782, 0.6862745, 1, 0, 1,
-0.8276592, 0.2488138, -1.158826, 0.6784314, 1, 0, 1,
-0.821932, -0.6673471, -2.440557, 0.6745098, 1, 0, 1,
-0.819979, 0.7739179, -1.146792, 0.6666667, 1, 0, 1,
-0.8195016, 1.530484, 0.7381514, 0.6627451, 1, 0, 1,
-0.8143219, 1.08488, -0.1799437, 0.654902, 1, 0, 1,
-0.808647, -0.5391949, -1.217054, 0.6509804, 1, 0, 1,
-0.7982485, 0.5345495, -1.116143, 0.6431373, 1, 0, 1,
-0.797552, 0.0004344849, -0.4320068, 0.6392157, 1, 0, 1,
-0.7973916, 0.5952864, -0.8976823, 0.6313726, 1, 0, 1,
-0.7895782, 0.3688845, 0.5778644, 0.627451, 1, 0, 1,
-0.7883107, -0.7919317, -2.853321, 0.6196079, 1, 0, 1,
-0.7878846, -0.07655966, -2.606109, 0.6156863, 1, 0, 1,
-0.7866849, -1.451272, -2.259945, 0.6078432, 1, 0, 1,
-0.7862992, 0.3722534, -1.401039, 0.6039216, 1, 0, 1,
-0.7828456, 0.3010903, -0.3658914, 0.5960785, 1, 0, 1,
-0.7777879, 1.0081, -1.074229, 0.5882353, 1, 0, 1,
-0.7756168, -1.829431, -3.008372, 0.5843138, 1, 0, 1,
-0.7695524, -0.4820325, -1.038115, 0.5764706, 1, 0, 1,
-0.7690704, -0.287308, -1.763978, 0.572549, 1, 0, 1,
-0.7683198, -1.273251, -2.555338, 0.5647059, 1, 0, 1,
-0.767844, 1.552079, -2.985097, 0.5607843, 1, 0, 1,
-0.764967, -0.02577136, -1.983981, 0.5529412, 1, 0, 1,
-0.7587026, -1.749798, -3.506449, 0.5490196, 1, 0, 1,
-0.7586347, -1.125041, -1.7243, 0.5411765, 1, 0, 1,
-0.751958, -0.03470543, -0.4105864, 0.5372549, 1, 0, 1,
-0.7460335, 0.6076763, -2.371267, 0.5294118, 1, 0, 1,
-0.7438396, -0.5736073, -3.418666, 0.5254902, 1, 0, 1,
-0.7406408, 0.4893821, -2.204439, 0.5176471, 1, 0, 1,
-0.7406383, -1.13411, -2.612369, 0.5137255, 1, 0, 1,
-0.7380144, 0.3256762, -1.679429, 0.5058824, 1, 0, 1,
-0.7241136, -0.1597644, -3.91283, 0.5019608, 1, 0, 1,
-0.7218099, 0.7033918, -0.5264065, 0.4941176, 1, 0, 1,
-0.7177168, -0.9826057, -2.020752, 0.4862745, 1, 0, 1,
-0.7150967, 0.3735242, -2.021832, 0.4823529, 1, 0, 1,
-0.7136421, -0.3913128, -0.1905679, 0.4745098, 1, 0, 1,
-0.7105251, -0.5146475, -2.649917, 0.4705882, 1, 0, 1,
-0.7084587, -0.2098362, -1.085463, 0.4627451, 1, 0, 1,
-0.708172, 1.081516, -1.047184, 0.4588235, 1, 0, 1,
-0.7000651, -0.1127023, -1.959504, 0.4509804, 1, 0, 1,
-0.6951261, -0.5169797, -2.685361, 0.4470588, 1, 0, 1,
-0.694886, 0.4413017, -1.228311, 0.4392157, 1, 0, 1,
-0.6936364, 2.648498, -2.472308, 0.4352941, 1, 0, 1,
-0.69247, -3.122782, -3.430558, 0.427451, 1, 0, 1,
-0.6921288, -1.438333, -3.047727, 0.4235294, 1, 0, 1,
-0.6909953, -0.2148463, -2.468268, 0.4156863, 1, 0, 1,
-0.6848865, 0.8140154, -1.0034, 0.4117647, 1, 0, 1,
-0.6848121, 2.704327, -1.261657, 0.4039216, 1, 0, 1,
-0.6838301, 1.406187, -0.01499329, 0.3960784, 1, 0, 1,
-0.683487, 1.023826, 0.1571732, 0.3921569, 1, 0, 1,
-0.6775743, -1.361989, -2.507968, 0.3843137, 1, 0, 1,
-0.6763614, -1.465315, -3.987101, 0.3803922, 1, 0, 1,
-0.6748239, -0.1310133, -2.434826, 0.372549, 1, 0, 1,
-0.6742851, -0.8645551, -1.109057, 0.3686275, 1, 0, 1,
-0.6665633, 0.8616403, -0.2741605, 0.3607843, 1, 0, 1,
-0.665024, -0.5180274, -0.683606, 0.3568628, 1, 0, 1,
-0.6641468, -0.130621, -0.2851625, 0.3490196, 1, 0, 1,
-0.646736, 1.143042, 0.1978687, 0.345098, 1, 0, 1,
-0.6233481, 0.6775241, -0.9044214, 0.3372549, 1, 0, 1,
-0.6213861, -0.8471102, -1.362265, 0.3333333, 1, 0, 1,
-0.62057, 0.3315552, -1.445716, 0.3254902, 1, 0, 1,
-0.6140255, 0.003838226, -2.702058, 0.3215686, 1, 0, 1,
-0.611214, 0.1641104, -1.312567, 0.3137255, 1, 0, 1,
-0.6103293, -1.113089, -1.885798, 0.3098039, 1, 0, 1,
-0.6049181, -0.3855561, -1.532495, 0.3019608, 1, 0, 1,
-0.6009937, -0.1024613, -1.469254, 0.2941177, 1, 0, 1,
-0.5990405, -0.5398614, -1.995985, 0.2901961, 1, 0, 1,
-0.5969502, 0.6313756, -1.38476, 0.282353, 1, 0, 1,
-0.5963948, 1.298257, -0.3494969, 0.2784314, 1, 0, 1,
-0.5952802, -0.2838598, -0.5874227, 0.2705882, 1, 0, 1,
-0.5951816, 0.1402398, -1.771378, 0.2666667, 1, 0, 1,
-0.5940607, -1.103535, -1.245526, 0.2588235, 1, 0, 1,
-0.5937907, 1.225561, 0.04857329, 0.254902, 1, 0, 1,
-0.5929873, -2.094134, -4.739685, 0.2470588, 1, 0, 1,
-0.5928721, 0.1929302, -2.225763, 0.2431373, 1, 0, 1,
-0.5895616, -0.3841068, -1.493748, 0.2352941, 1, 0, 1,
-0.58319, 1.707652, -0.62119, 0.2313726, 1, 0, 1,
-0.5739001, -0.5326353, -3.195604, 0.2235294, 1, 0, 1,
-0.5647017, 0.002903031, -0.6603119, 0.2196078, 1, 0, 1,
-0.5557219, 0.5828695, -0.9765055, 0.2117647, 1, 0, 1,
-0.5535733, -0.4662189, -2.110928, 0.2078431, 1, 0, 1,
-0.5509456, 0.9715571, -0.06299987, 0.2, 1, 0, 1,
-0.5470535, 0.2374598, 0.2724314, 0.1921569, 1, 0, 1,
-0.5445536, -0.310035, -1.559908, 0.1882353, 1, 0, 1,
-0.5437566, -1.283031, -2.606476, 0.1803922, 1, 0, 1,
-0.5385379, 0.4727287, -1.386312, 0.1764706, 1, 0, 1,
-0.5329807, -1.297406, -3.089713, 0.1686275, 1, 0, 1,
-0.5325177, -1.436692, -2.145908, 0.1647059, 1, 0, 1,
-0.5299968, 0.3995101, 0.03743447, 0.1568628, 1, 0, 1,
-0.5244588, 2.417755, -0.366277, 0.1529412, 1, 0, 1,
-0.5215599, -3.623507, -3.447508, 0.145098, 1, 0, 1,
-0.5211315, -0.4295658, -0.7011867, 0.1411765, 1, 0, 1,
-0.51809, 0.9151785, -0.9558101, 0.1333333, 1, 0, 1,
-0.5165007, 1.44557, -0.2009154, 0.1294118, 1, 0, 1,
-0.5158846, 0.772922, 0.131647, 0.1215686, 1, 0, 1,
-0.5113413, 0.3230155, 0.7617203, 0.1176471, 1, 0, 1,
-0.5105754, -0.04213848, -1.894248, 0.1098039, 1, 0, 1,
-0.5102417, 0.01191927, -1.887746, 0.1058824, 1, 0, 1,
-0.5098246, -0.2067974, -2.017766, 0.09803922, 1, 0, 1,
-0.506126, 0.9492064, -1.019266, 0.09019608, 1, 0, 1,
-0.5043885, -2.122927, -3.38605, 0.08627451, 1, 0, 1,
-0.4992649, 0.3188395, -0.7777682, 0.07843138, 1, 0, 1,
-0.4863801, 0.8977997, -2.314596, 0.07450981, 1, 0, 1,
-0.4844222, 0.01706853, -1.771327, 0.06666667, 1, 0, 1,
-0.4833824, 0.5432804, -0.7348264, 0.0627451, 1, 0, 1,
-0.4782762, 0.8772709, -1.695528, 0.05490196, 1, 0, 1,
-0.4723271, -0.9096985, -2.315868, 0.05098039, 1, 0, 1,
-0.4689273, -0.9543366, -3.010637, 0.04313726, 1, 0, 1,
-0.4678473, 2.846399, -0.03824118, 0.03921569, 1, 0, 1,
-0.4667025, 0.9787939, 0.4885897, 0.03137255, 1, 0, 1,
-0.4643495, -0.4193843, -1.517141, 0.02745098, 1, 0, 1,
-0.4620735, 0.9077551, -1.112091, 0.01960784, 1, 0, 1,
-0.4598886, 0.1389472, -1.298064, 0.01568628, 1, 0, 1,
-0.4532948, 0.08616275, -0.6199604, 0.007843138, 1, 0, 1,
-0.4375527, 0.3542579, -2.262049, 0.003921569, 1, 0, 1,
-0.4334993, 0.7839481, -0.2278111, 0, 1, 0.003921569, 1,
-0.4333451, 0.9572333, -0.8237228, 0, 1, 0.01176471, 1,
-0.4261768, 0.3441241, -0.8265428, 0, 1, 0.01568628, 1,
-0.4245039, 0.1044443, 0.370163, 0, 1, 0.02352941, 1,
-0.4226869, -0.04822671, -1.474181, 0, 1, 0.02745098, 1,
-0.4190188, -0.05855254, -0.8960817, 0, 1, 0.03529412, 1,
-0.4140812, 0.8572119, -0.3376392, 0, 1, 0.03921569, 1,
-0.4074874, -1.140007, -2.267715, 0, 1, 0.04705882, 1,
-0.392452, -1.221059, -1.727296, 0, 1, 0.05098039, 1,
-0.3846694, -0.5947796, -2.47701, 0, 1, 0.05882353, 1,
-0.3796789, -0.9862955, -1.644182, 0, 1, 0.0627451, 1,
-0.3786617, 0.641322, -0.9080958, 0, 1, 0.07058824, 1,
-0.3743553, 1.098255, 0.7313328, 0, 1, 0.07450981, 1,
-0.373838, -0.6544527, -2.223515, 0, 1, 0.08235294, 1,
-0.3705683, 0.06713457, -1.265189, 0, 1, 0.08627451, 1,
-0.3703107, 0.6756076, -1.818768, 0, 1, 0.09411765, 1,
-0.3694807, -0.7930363, -2.704842, 0, 1, 0.1019608, 1,
-0.3661947, -0.07236177, -0.6284145, 0, 1, 0.1058824, 1,
-0.3597623, -0.2668833, -2.557184, 0, 1, 0.1137255, 1,
-0.3581371, -0.6417721, -1.903274, 0, 1, 0.1176471, 1,
-0.357446, 1.404639, -0.4086097, 0, 1, 0.1254902, 1,
-0.3562133, -0.7361026, -3.40007, 0, 1, 0.1294118, 1,
-0.356015, -0.1606543, -3.739541, 0, 1, 0.1372549, 1,
-0.3559749, -0.468301, -1.869595, 0, 1, 0.1411765, 1,
-0.3539028, -1.088916, -2.441535, 0, 1, 0.1490196, 1,
-0.3528711, -2.34653, -3.67453, 0, 1, 0.1529412, 1,
-0.3515814, 0.4076679, -0.93464, 0, 1, 0.1607843, 1,
-0.347344, -0.9472845, -3.469324, 0, 1, 0.1647059, 1,
-0.3394406, -3.412401, -4.229963, 0, 1, 0.172549, 1,
-0.3391052, -0.391991, -2.209887, 0, 1, 0.1764706, 1,
-0.3381131, 1.087004, 0.6016123, 0, 1, 0.1843137, 1,
-0.3358741, 0.6293604, -0.461394, 0, 1, 0.1882353, 1,
-0.3328696, 1.314344, -0.06426268, 0, 1, 0.1960784, 1,
-0.3312522, -0.9428331, -1.843993, 0, 1, 0.2039216, 1,
-0.3289421, -1.096593, -2.550475, 0, 1, 0.2078431, 1,
-0.3282261, 0.6926473, -1.896851, 0, 1, 0.2156863, 1,
-0.3267362, 0.5705699, -0.3175381, 0, 1, 0.2196078, 1,
-0.3254465, -0.5216569, -3.404365, 0, 1, 0.227451, 1,
-0.3238716, -0.1529027, -3.100765, 0, 1, 0.2313726, 1,
-0.3214318, -0.4102035, -2.513625, 0, 1, 0.2392157, 1,
-0.3202974, 0.4926274, -1.5288, 0, 1, 0.2431373, 1,
-0.3158217, 1.320389, -1.037909, 0, 1, 0.2509804, 1,
-0.315168, 0.2802917, -1.278126, 0, 1, 0.254902, 1,
-0.3103093, -0.7478096, -1.3652, 0, 1, 0.2627451, 1,
-0.3053558, 0.8890976, -0.7246714, 0, 1, 0.2666667, 1,
-0.3025088, -1.131587, -1.687023, 0, 1, 0.2745098, 1,
-0.30201, 0.1333365, -0.2142149, 0, 1, 0.2784314, 1,
-0.3011099, 0.9249772, 0.3265894, 0, 1, 0.2862745, 1,
-0.3005342, 0.3016003, -0.2185008, 0, 1, 0.2901961, 1,
-0.2996843, 0.005501818, 1.507921, 0, 1, 0.2980392, 1,
-0.2978082, -0.9383402, -1.66983, 0, 1, 0.3058824, 1,
-0.2962054, 0.9321694, 0.3519687, 0, 1, 0.3098039, 1,
-0.2932178, 0.8335555, -0.3587636, 0, 1, 0.3176471, 1,
-0.2922099, -0.2329776, -1.431128, 0, 1, 0.3215686, 1,
-0.2921927, 0.7069635, -2.052823, 0, 1, 0.3294118, 1,
-0.2919585, 1.259596, 0.3893836, 0, 1, 0.3333333, 1,
-0.2909465, -0.7512988, -2.038864, 0, 1, 0.3411765, 1,
-0.2889502, -0.105007, -1.390026, 0, 1, 0.345098, 1,
-0.2857538, 0.2244918, -1.209002, 0, 1, 0.3529412, 1,
-0.2853779, 0.1269559, -2.697461, 0, 1, 0.3568628, 1,
-0.2846763, -0.7919978, -2.260496, 0, 1, 0.3647059, 1,
-0.2838099, 0.5704092, 0.2675838, 0, 1, 0.3686275, 1,
-0.2773146, -0.4779415, -3.017235, 0, 1, 0.3764706, 1,
-0.2769653, -0.4302789, -3.393215, 0, 1, 0.3803922, 1,
-0.2757579, -0.4827154, -3.231171, 0, 1, 0.3882353, 1,
-0.2734364, 0.4695621, 0.1461784, 0, 1, 0.3921569, 1,
-0.272429, 0.7582953, 0.9335095, 0, 1, 0.4, 1,
-0.2720293, 0.705373, -1.270658, 0, 1, 0.4078431, 1,
-0.2692907, -0.1702608, -2.322545, 0, 1, 0.4117647, 1,
-0.269188, -0.05760558, -2.885987, 0, 1, 0.4196078, 1,
-0.2672292, 1.284083, -0.9895648, 0, 1, 0.4235294, 1,
-0.2670076, 1.410827, -0.1277959, 0, 1, 0.4313726, 1,
-0.2665388, -0.6421545, -2.56053, 0, 1, 0.4352941, 1,
-0.25984, -0.6753616, -1.594466, 0, 1, 0.4431373, 1,
-0.2521115, 0.7851231, 1.986748, 0, 1, 0.4470588, 1,
-0.2493986, 1.626755, 0.4641271, 0, 1, 0.454902, 1,
-0.2474916, -0.5848059, -3.074286, 0, 1, 0.4588235, 1,
-0.2399187, -0.7777286, -1.467937, 0, 1, 0.4666667, 1,
-0.2395548, -1.408332, -2.607507, 0, 1, 0.4705882, 1,
-0.2394318, -0.9911515, -1.720275, 0, 1, 0.4784314, 1,
-0.2346665, 1.273243, 1.070369, 0, 1, 0.4823529, 1,
-0.2337546, 0.1074765, 0.1460115, 0, 1, 0.4901961, 1,
-0.2335011, -0.8158674, -3.240498, 0, 1, 0.4941176, 1,
-0.2293032, 1.717794, 1.48725, 0, 1, 0.5019608, 1,
-0.2279501, 1.138256, 0.3935525, 0, 1, 0.509804, 1,
-0.2238252, 0.6966555, -0.06442577, 0, 1, 0.5137255, 1,
-0.2235284, -0.7958359, -3.743245, 0, 1, 0.5215687, 1,
-0.2166119, 0.8110474, -1.200095, 0, 1, 0.5254902, 1,
-0.2150449, 0.4671215, -1.376123, 0, 1, 0.5333334, 1,
-0.2120092, -1.823482, -2.84185, 0, 1, 0.5372549, 1,
-0.2077111, -0.05097626, -3.174685, 0, 1, 0.5450981, 1,
-0.2051858, -1.03161, -1.930996, 0, 1, 0.5490196, 1,
-0.2046709, 2.423316, 0.9223858, 0, 1, 0.5568628, 1,
-0.2031218, 1.416919, -0.1383987, 0, 1, 0.5607843, 1,
-0.1980673, -0.1421522, -2.044835, 0, 1, 0.5686275, 1,
-0.1977082, 1.805242, -0.8603048, 0, 1, 0.572549, 1,
-0.1953026, 0.1592802, 0.09053878, 0, 1, 0.5803922, 1,
-0.1891743, 0.2313359, -0.3371476, 0, 1, 0.5843138, 1,
-0.1872647, -2.405944, -1.555302, 0, 1, 0.5921569, 1,
-0.1868636, 0.8779063, -0.4302226, 0, 1, 0.5960785, 1,
-0.1866812, 0.4596443, -1.605445, 0, 1, 0.6039216, 1,
-0.1846819, 0.7364668, -0.7034309, 0, 1, 0.6117647, 1,
-0.1779223, 0.01926785, -2.625741, 0, 1, 0.6156863, 1,
-0.1761425, -1.916063, -1.11503, 0, 1, 0.6235294, 1,
-0.1727113, 0.7834331, -0.7616135, 0, 1, 0.627451, 1,
-0.1713884, 0.07596735, -0.2939231, 0, 1, 0.6352941, 1,
-0.1706791, -0.3414304, -1.574065, 0, 1, 0.6392157, 1,
-0.1647958, -1.159967, -1.935368, 0, 1, 0.6470588, 1,
-0.1647389, 0.8189663, 0.9423757, 0, 1, 0.6509804, 1,
-0.1631307, -0.6279885, -2.454733, 0, 1, 0.6588235, 1,
-0.1629414, 0.3928809, -0.5240631, 0, 1, 0.6627451, 1,
-0.1565473, -0.8728569, -3.850193, 0, 1, 0.6705883, 1,
-0.15619, 0.3076366, -2.763196, 0, 1, 0.6745098, 1,
-0.1507381, 0.7433208, 0.778949, 0, 1, 0.682353, 1,
-0.1502809, -0.7055518, -4.501912, 0, 1, 0.6862745, 1,
-0.1441962, -0.5281613, -2.520957, 0, 1, 0.6941177, 1,
-0.1391686, -0.7599626, -4.099391, 0, 1, 0.7019608, 1,
-0.1346979, -1.276883, -3.030049, 0, 1, 0.7058824, 1,
-0.1335119, 0.5174651, -1.638618, 0, 1, 0.7137255, 1,
-0.1294663, -0.16333, -2.643159, 0, 1, 0.7176471, 1,
-0.1287748, 0.8170093, -0.993708, 0, 1, 0.7254902, 1,
-0.1280986, 0.8926058, 0.459133, 0, 1, 0.7294118, 1,
-0.1270275, 0.9057263, -1.551867, 0, 1, 0.7372549, 1,
-0.1269183, -1.404514, -2.619776, 0, 1, 0.7411765, 1,
-0.1263542, -0.7345468, -3.597888, 0, 1, 0.7490196, 1,
-0.1248426, -1.158473, -4.922822, 0, 1, 0.7529412, 1,
-0.1230507, 0.5566787, -0.9013348, 0, 1, 0.7607843, 1,
-0.1193747, -0.5310515, -2.64398, 0, 1, 0.7647059, 1,
-0.1177883, 0.6792648, 0.373154, 0, 1, 0.772549, 1,
-0.112907, 0.3559929, -1.947022, 0, 1, 0.7764706, 1,
-0.1123664, 0.9038318, 0.6442531, 0, 1, 0.7843137, 1,
-0.1103543, -0.8620618, -2.420819, 0, 1, 0.7882353, 1,
-0.1081726, -0.01235093, -3.244463, 0, 1, 0.7960784, 1,
-0.1048653, -2.158795, -4.540826, 0, 1, 0.8039216, 1,
-0.102191, 0.07595913, -0.7997986, 0, 1, 0.8078431, 1,
-0.09725649, 0.7411544, 0.8692802, 0, 1, 0.8156863, 1,
-0.09692014, -0.8724651, -1.15608, 0, 1, 0.8196079, 1,
-0.09550712, 0.3015166, 0.5250475, 0, 1, 0.827451, 1,
-0.09184799, 0.6596816, -0.5846056, 0, 1, 0.8313726, 1,
-0.08902255, 1.589352, 2.21861, 0, 1, 0.8392157, 1,
-0.08760697, 0.6408274, -0.800717, 0, 1, 0.8431373, 1,
-0.08693049, 0.7558718, -0.286589, 0, 1, 0.8509804, 1,
-0.08637283, -0.4235263, -2.661323, 0, 1, 0.854902, 1,
-0.07463368, 1.478809, -1.655259, 0, 1, 0.8627451, 1,
-0.07296969, 1.479334, 0.6491104, 0, 1, 0.8666667, 1,
-0.07292982, 0.3113582, -0.779171, 0, 1, 0.8745098, 1,
-0.07229186, -0.0386, -3.897832, 0, 1, 0.8784314, 1,
-0.07156838, -1.977665, -4.5171, 0, 1, 0.8862745, 1,
-0.07145584, -0.3692386, -3.460152, 0, 1, 0.8901961, 1,
-0.07096816, 1.608705, 0.6374742, 0, 1, 0.8980392, 1,
-0.06985573, 0.2865113, 0.2212438, 0, 1, 0.9058824, 1,
-0.06982328, -0.1821838, -3.66557, 0, 1, 0.9098039, 1,
-0.06655859, 2.477247, 1.062903, 0, 1, 0.9176471, 1,
-0.06332307, 0.652002, 0.4481385, 0, 1, 0.9215686, 1,
-0.06166984, -0.516971, -4.706402, 0, 1, 0.9294118, 1,
-0.06166842, 0.2785575, 0.579644, 0, 1, 0.9333333, 1,
-0.05853578, -0.8206692, -3.470457, 0, 1, 0.9411765, 1,
-0.04166785, -0.9630244, -3.019177, 0, 1, 0.945098, 1,
-0.03925815, 0.4519517, -0.3995303, 0, 1, 0.9529412, 1,
-0.03745962, 0.5789686, -0.7842578, 0, 1, 0.9568627, 1,
-0.03268258, 0.3832044, 0.946613, 0, 1, 0.9647059, 1,
-0.03004737, 0.6582575, -1.925397, 0, 1, 0.9686275, 1,
-0.02585703, -0.4571925, -1.83168, 0, 1, 0.9764706, 1,
-0.0230918, -0.510605, -3.279403, 0, 1, 0.9803922, 1,
-0.007368233, -1.174103, -4.346163, 0, 1, 0.9882353, 1,
-0.006356359, -0.08776072, -2.409076, 0, 1, 0.9921569, 1,
-0.006049915, 1.375861, 0.3826977, 0, 1, 1, 1,
-0.003394202, -0.7335725, -4.316214, 0, 0.9921569, 1, 1,
0.0009906298, 3.210688, -0.05056759, 0, 0.9882353, 1, 1,
0.002372586, -0.2327514, 2.291242, 0, 0.9803922, 1, 1,
0.004549999, -1.218264, 4.463947, 0, 0.9764706, 1, 1,
0.004557571, -1.894871, 4.866666, 0, 0.9686275, 1, 1,
0.005205476, -1.100899, 3.294166, 0, 0.9647059, 1, 1,
0.008694609, -0.2455941, 1.470335, 0, 0.9568627, 1, 1,
0.009741721, 0.9315127, 1.681834, 0, 0.9529412, 1, 1,
0.01480712, -0.8142935, 4.136791, 0, 0.945098, 1, 1,
0.01751296, -0.8484648, 3.80227, 0, 0.9411765, 1, 1,
0.01826096, 0.6285304, 0.01688653, 0, 0.9333333, 1, 1,
0.01880636, 0.0848032, -0.2606828, 0, 0.9294118, 1, 1,
0.02471986, 1.39573, 0.8131962, 0, 0.9215686, 1, 1,
0.02742308, -0.6594082, 1.83986, 0, 0.9176471, 1, 1,
0.03174433, 1.002664, 0.2299701, 0, 0.9098039, 1, 1,
0.03300585, 0.03868875, -0.4792955, 0, 0.9058824, 1, 1,
0.0378035, -0.37604, 2.583975, 0, 0.8980392, 1, 1,
0.03864469, 0.02548773, 2.080904, 0, 0.8901961, 1, 1,
0.04598168, 0.3549262, -0.5867935, 0, 0.8862745, 1, 1,
0.04627743, 0.2368214, -0.2129003, 0, 0.8784314, 1, 1,
0.04835606, 0.5398983, -0.4927032, 0, 0.8745098, 1, 1,
0.0513945, -0.1644207, 1.31653, 0, 0.8666667, 1, 1,
0.05475666, -1.989467, 3.208966, 0, 0.8627451, 1, 1,
0.05860291, 0.1903718, -0.6662258, 0, 0.854902, 1, 1,
0.0624882, 1.154324, -0.178274, 0, 0.8509804, 1, 1,
0.0680348, -0.7927914, 3.001723, 0, 0.8431373, 1, 1,
0.07419631, -0.561419, 2.153943, 0, 0.8392157, 1, 1,
0.07814996, -0.6284331, 1.515322, 0, 0.8313726, 1, 1,
0.07956187, -0.8809392, 3.949811, 0, 0.827451, 1, 1,
0.08300353, -0.7684284, 1.902192, 0, 0.8196079, 1, 1,
0.08776603, 1.183783, -0.008630943, 0, 0.8156863, 1, 1,
0.08791989, -1.126718, 2.595167, 0, 0.8078431, 1, 1,
0.08899009, 0.6944407, 0.003763943, 0, 0.8039216, 1, 1,
0.09191505, -0.6885563, 3.300912, 0, 0.7960784, 1, 1,
0.09797123, 0.1882019, 0.2130949, 0, 0.7882353, 1, 1,
0.1027394, 0.7780797, 2.873327, 0, 0.7843137, 1, 1,
0.1050765, 1.834143, 0.03837325, 0, 0.7764706, 1, 1,
0.1052322, -1.488261, 2.849953, 0, 0.772549, 1, 1,
0.1085196, -1.738416, 4.466191, 0, 0.7647059, 1, 1,
0.1106076, -0.5400788, 4.880123, 0, 0.7607843, 1, 1,
0.1132192, -0.9429749, 3.262747, 0, 0.7529412, 1, 1,
0.1151211, 0.1622376, 0.4695459, 0, 0.7490196, 1, 1,
0.1185217, -0.5301242, 3.590447, 0, 0.7411765, 1, 1,
0.1186471, 1.395265, 1.202243, 0, 0.7372549, 1, 1,
0.1243671, -0.09366945, 2.549223, 0, 0.7294118, 1, 1,
0.1288073, 1.136972, 1.638817, 0, 0.7254902, 1, 1,
0.1290874, -1.104961, 2.919872, 0, 0.7176471, 1, 1,
0.1338077, -0.7313668, 3.984964, 0, 0.7137255, 1, 1,
0.1352529, 0.6397351, 2.607169, 0, 0.7058824, 1, 1,
0.1354297, 0.5201362, -0.1947246, 0, 0.6980392, 1, 1,
0.1407741, -0.565582, 2.744565, 0, 0.6941177, 1, 1,
0.140981, -0.9387575, 4.768919, 0, 0.6862745, 1, 1,
0.1422297, 0.09900086, 0.3397045, 0, 0.682353, 1, 1,
0.1443609, -1.272034, 3.319398, 0, 0.6745098, 1, 1,
0.1449629, -0.8971475, 3.64753, 0, 0.6705883, 1, 1,
0.1481319, -0.06712305, 1.445035, 0, 0.6627451, 1, 1,
0.1484756, 0.02230444, -0.1342857, 0, 0.6588235, 1, 1,
0.159905, 0.6097273, -0.1778884, 0, 0.6509804, 1, 1,
0.1620254, 0.1101164, 1.356079, 0, 0.6470588, 1, 1,
0.1664722, 0.3731821, 1.223044, 0, 0.6392157, 1, 1,
0.1665191, -0.4263231, 2.488571, 0, 0.6352941, 1, 1,
0.1667703, 0.3578697, 1.465358, 0, 0.627451, 1, 1,
0.1796337, -1.067752, 3.832583, 0, 0.6235294, 1, 1,
0.1799562, 0.1164391, 1.138641, 0, 0.6156863, 1, 1,
0.1899838, 0.08916333, 2.091782, 0, 0.6117647, 1, 1,
0.1924586, 0.2362381, 1.382218, 0, 0.6039216, 1, 1,
0.1987293, -1.606567, 2.561707, 0, 0.5960785, 1, 1,
0.2057922, -0.3582461, 2.009418, 0, 0.5921569, 1, 1,
0.2080869, 0.1327069, 3.081184, 0, 0.5843138, 1, 1,
0.2183216, 1.505649, -2.200645, 0, 0.5803922, 1, 1,
0.2184278, -1.142925, 3.435912, 0, 0.572549, 1, 1,
0.2189112, 0.4808448, 1.929394, 0, 0.5686275, 1, 1,
0.2194357, -1.218857, 2.36731, 0, 0.5607843, 1, 1,
0.2222238, 1.546135, -1.017679, 0, 0.5568628, 1, 1,
0.2230617, 0.4214831, 0.611133, 0, 0.5490196, 1, 1,
0.2289395, 0.8572567, -0.8513542, 0, 0.5450981, 1, 1,
0.2320871, 0.6195174, 1.302488, 0, 0.5372549, 1, 1,
0.2336963, -1.567095, 4.044861, 0, 0.5333334, 1, 1,
0.2381245, 2.426879, -0.6451028, 0, 0.5254902, 1, 1,
0.2399339, -0.5940058, 2.16019, 0, 0.5215687, 1, 1,
0.2403447, 0.2992683, 0.4910632, 0, 0.5137255, 1, 1,
0.2426066, 0.0571886, 0.4868708, 0, 0.509804, 1, 1,
0.2427206, 2.401297, 0.04238978, 0, 0.5019608, 1, 1,
0.2478376, -1.53264, 2.887486, 0, 0.4941176, 1, 1,
0.2486804, -0.5930231, 1.598835, 0, 0.4901961, 1, 1,
0.2509648, 1.120862, 0.001102696, 0, 0.4823529, 1, 1,
0.2522491, 0.5173531, 1.234947, 0, 0.4784314, 1, 1,
0.2569787, 1.137351, 0.2238439, 0, 0.4705882, 1, 1,
0.2582349, -0.5290419, 1.151173, 0, 0.4666667, 1, 1,
0.2605842, 1.100313, 0.3480019, 0, 0.4588235, 1, 1,
0.2610608, 0.4194403, 1.792464, 0, 0.454902, 1, 1,
0.263328, 1.592825, 0.4859671, 0, 0.4470588, 1, 1,
0.2647911, 1.427802, -0.5719559, 0, 0.4431373, 1, 1,
0.2666343, 0.6963325, 0.7863533, 0, 0.4352941, 1, 1,
0.2742343, 0.5430713, 1.369487, 0, 0.4313726, 1, 1,
0.2761344, -1.35909, 3.382674, 0, 0.4235294, 1, 1,
0.2790616, -0.6672218, 2.729075, 0, 0.4196078, 1, 1,
0.2797631, 0.5455337, 1.332872, 0, 0.4117647, 1, 1,
0.2799018, 1.586784, 0.3664205, 0, 0.4078431, 1, 1,
0.2802814, -1.925723, 2.045893, 0, 0.4, 1, 1,
0.2854473, 0.7082813, -0.8307157, 0, 0.3921569, 1, 1,
0.2912689, -0.5694501, 3.722003, 0, 0.3882353, 1, 1,
0.305744, 0.6139532, 1.677146, 0, 0.3803922, 1, 1,
0.3124821, 1.401458, -0.19242, 0, 0.3764706, 1, 1,
0.3188894, 0.03015795, 3.006617, 0, 0.3686275, 1, 1,
0.3203484, -0.1450259, 1.502932, 0, 0.3647059, 1, 1,
0.3242953, 0.4990378, 0.1767583, 0, 0.3568628, 1, 1,
0.3260348, -0.1339593, 1.321213, 0, 0.3529412, 1, 1,
0.3269101, -0.6706083, 3.721787, 0, 0.345098, 1, 1,
0.3298459, 0.02746226, 1.47434, 0, 0.3411765, 1, 1,
0.3408236, 0.1323039, 1.394353, 0, 0.3333333, 1, 1,
0.3422496, 0.7282771, 0.1755218, 0, 0.3294118, 1, 1,
0.3423815, -0.6643983, 1.052708, 0, 0.3215686, 1, 1,
0.3499181, -0.2667913, 1.933339, 0, 0.3176471, 1, 1,
0.3553219, -0.3781665, 0.9867045, 0, 0.3098039, 1, 1,
0.3586644, -0.4768888, 1.552393, 0, 0.3058824, 1, 1,
0.3610166, 2.307907, -0.1185929, 0, 0.2980392, 1, 1,
0.3638394, 1.71167, 0.05004127, 0, 0.2901961, 1, 1,
0.3647515, -0.3082863, 1.91833, 0, 0.2862745, 1, 1,
0.3649306, 0.285693, 0.363444, 0, 0.2784314, 1, 1,
0.3676918, -1.762809, 3.812318, 0, 0.2745098, 1, 1,
0.3678017, 1.342842, 1.265814, 0, 0.2666667, 1, 1,
0.3692954, 0.1315883, 1.532218, 0, 0.2627451, 1, 1,
0.3709344, 0.1362056, 1.527893, 0, 0.254902, 1, 1,
0.372358, 0.1542767, 4.062786, 0, 0.2509804, 1, 1,
0.3765351, -0.4692812, 2.478391, 0, 0.2431373, 1, 1,
0.3776026, 0.4091238, -0.5916059, 0, 0.2392157, 1, 1,
0.380271, -1.741198, 2.762824, 0, 0.2313726, 1, 1,
0.3807886, -0.1844572, 2.199924, 0, 0.227451, 1, 1,
0.3815876, 0.136382, 1.278485, 0, 0.2196078, 1, 1,
0.3867744, -2.394276, 2.111946, 0, 0.2156863, 1, 1,
0.3894704, 2.622272, 1.945218, 0, 0.2078431, 1, 1,
0.3930271, 0.3712799, 1.164416, 0, 0.2039216, 1, 1,
0.3979277, -0.8783523, 2.575325, 0, 0.1960784, 1, 1,
0.4004912, 1.356891, -0.05824452, 0, 0.1882353, 1, 1,
0.4076845, 0.06769118, 1.994405, 0, 0.1843137, 1, 1,
0.4077074, -0.3346045, 1.948126, 0, 0.1764706, 1, 1,
0.4095229, 0.9522257, -0.5214397, 0, 0.172549, 1, 1,
0.4137918, 1.318199, 0.5072729, 0, 0.1647059, 1, 1,
0.4151689, -0.4588542, 1.678421, 0, 0.1607843, 1, 1,
0.4156267, 1.677187, -0.1709931, 0, 0.1529412, 1, 1,
0.41754, -0.7541015, 3.757885, 0, 0.1490196, 1, 1,
0.4194086, -0.2208394, 2.757322, 0, 0.1411765, 1, 1,
0.4216921, -1.010573, 3.422206, 0, 0.1372549, 1, 1,
0.4244615, -0.4011804, 1.852894, 0, 0.1294118, 1, 1,
0.4246221, 0.72728, 1.258988, 0, 0.1254902, 1, 1,
0.4265674, -0.4448737, 2.016252, 0, 0.1176471, 1, 1,
0.427196, -0.7869803, 2.975883, 0, 0.1137255, 1, 1,
0.4293479, 0.7942297, 2.002274, 0, 0.1058824, 1, 1,
0.432136, 0.8965936, 1.016842, 0, 0.09803922, 1, 1,
0.433951, 0.2031598, 0.600234, 0, 0.09411765, 1, 1,
0.4418454, 0.4645611, -0.4339881, 0, 0.08627451, 1, 1,
0.4429887, -1.160769, 3.522108, 0, 0.08235294, 1, 1,
0.4432033, 0.8558828, 0.4924542, 0, 0.07450981, 1, 1,
0.4482157, 0.6735444, 1.287066, 0, 0.07058824, 1, 1,
0.4485753, -0.9431082, 2.423671, 0, 0.0627451, 1, 1,
0.4535123, -0.9382714, 3.261619, 0, 0.05882353, 1, 1,
0.4604629, -0.0283092, 0.9333491, 0, 0.05098039, 1, 1,
0.4693906, 0.688963, 1.24017, 0, 0.04705882, 1, 1,
0.4693941, 0.3120793, 1.949065, 0, 0.03921569, 1, 1,
0.4708708, -0.4407327, 3.729881, 0, 0.03529412, 1, 1,
0.4711145, 0.9090592, 0.3546474, 0, 0.02745098, 1, 1,
0.4730698, 1.313434, 1.579005, 0, 0.02352941, 1, 1,
0.4745029, 0.3638254, 1.314927, 0, 0.01568628, 1, 1,
0.474521, 1.209002, 0.1906222, 0, 0.01176471, 1, 1,
0.4777296, 0.5737368, 1.683104, 0, 0.003921569, 1, 1,
0.478419, -0.8312605, 2.60079, 0.003921569, 0, 1, 1,
0.4829959, 0.2569599, -0.1349889, 0.007843138, 0, 1, 1,
0.4851818, -0.7835131, 1.655016, 0.01568628, 0, 1, 1,
0.4889344, -1.429171, 4.17743, 0.01960784, 0, 1, 1,
0.4899615, 0.01152673, 1.220376, 0.02745098, 0, 1, 1,
0.4912283, 2.208516, 0.2042672, 0.03137255, 0, 1, 1,
0.4946961, 0.8664595, 0.7381006, 0.03921569, 0, 1, 1,
0.4959622, -0.637714, 2.349744, 0.04313726, 0, 1, 1,
0.4978767, 1.080128, -1.18424, 0.05098039, 0, 1, 1,
0.4992076, -0.7539991, 2.761124, 0.05490196, 0, 1, 1,
0.5037251, -0.470663, 2.854635, 0.0627451, 0, 1, 1,
0.5056058, 1.317618, -1.723103, 0.06666667, 0, 1, 1,
0.5060447, -0.790676, 2.920146, 0.07450981, 0, 1, 1,
0.5108688, 1.036681, 0.72482, 0.07843138, 0, 1, 1,
0.5150164, -0.3542567, 1.429546, 0.08627451, 0, 1, 1,
0.519267, -0.5834376, 2.287845, 0.09019608, 0, 1, 1,
0.5198685, -0.1189567, -0.9200424, 0.09803922, 0, 1, 1,
0.5287728, 0.4891884, -0.8335227, 0.1058824, 0, 1, 1,
0.5300419, -0.6118787, 2.680083, 0.1098039, 0, 1, 1,
0.5358742, -1.201773, 2.691257, 0.1176471, 0, 1, 1,
0.5367724, -0.1525843, 0.3648649, 0.1215686, 0, 1, 1,
0.5378384, 1.182235, -0.4969143, 0.1294118, 0, 1, 1,
0.5521563, -0.3873509, -0.8773892, 0.1333333, 0, 1, 1,
0.5557895, 0.004783332, 1.576478, 0.1411765, 0, 1, 1,
0.5577725, 1.96977, 1.027138, 0.145098, 0, 1, 1,
0.558713, 0.1731527, 3.276635, 0.1529412, 0, 1, 1,
0.5657804, -1.27622, 2.140114, 0.1568628, 0, 1, 1,
0.5685789, -0.08272339, 0.9582037, 0.1647059, 0, 1, 1,
0.5709155, 0.5803443, 1.599182, 0.1686275, 0, 1, 1,
0.5736212, -0.09287407, 3.368326, 0.1764706, 0, 1, 1,
0.5787926, -0.7139421, 2.109347, 0.1803922, 0, 1, 1,
0.5813645, -0.4718015, 1.271657, 0.1882353, 0, 1, 1,
0.5831292, 1.304564, 0.6398782, 0.1921569, 0, 1, 1,
0.5833766, 0.6449767, -1.777361, 0.2, 0, 1, 1,
0.5848272, -1.877959, 3.374887, 0.2078431, 0, 1, 1,
0.5862625, -0.7451528, 1.131761, 0.2117647, 0, 1, 1,
0.5893524, 0.707004, 0.9221945, 0.2196078, 0, 1, 1,
0.5937827, 0.4823847, 0.4787322, 0.2235294, 0, 1, 1,
0.598199, -0.08387823, 1.557291, 0.2313726, 0, 1, 1,
0.5988583, 1.183054, -0.6650103, 0.2352941, 0, 1, 1,
0.5993909, 0.3521395, 1.335718, 0.2431373, 0, 1, 1,
0.6009177, -0.2640029, 1.490065, 0.2470588, 0, 1, 1,
0.6092705, -0.4123471, -0.02416012, 0.254902, 0, 1, 1,
0.6097498, 0.3422383, 0.8442804, 0.2588235, 0, 1, 1,
0.6120843, -1.215572, 2.135421, 0.2666667, 0, 1, 1,
0.6159864, 0.8431497, 0.5862364, 0.2705882, 0, 1, 1,
0.624561, 0.8130987, 2.012851, 0.2784314, 0, 1, 1,
0.6249263, -0.1334432, 1.972683, 0.282353, 0, 1, 1,
0.6251562, -0.7500097, 2.478397, 0.2901961, 0, 1, 1,
0.628103, 0.4317643, 1.350092, 0.2941177, 0, 1, 1,
0.6355423, -0.2875849, 0.2731303, 0.3019608, 0, 1, 1,
0.6357675, 0.5400682, -0.05537566, 0.3098039, 0, 1, 1,
0.6391016, -0.2601092, 1.64206, 0.3137255, 0, 1, 1,
0.6428624, -0.09559701, 2.026143, 0.3215686, 0, 1, 1,
0.6485802, 1.881227, 1.259568, 0.3254902, 0, 1, 1,
0.6488765, -1.444909, 1.088594, 0.3333333, 0, 1, 1,
0.6490111, -0.7251627, 1.380382, 0.3372549, 0, 1, 1,
0.6623352, -0.1474964, 2.637521, 0.345098, 0, 1, 1,
0.6627808, -0.4087089, 2.032836, 0.3490196, 0, 1, 1,
0.6652142, -0.7022337, 3.601265, 0.3568628, 0, 1, 1,
0.6661061, 1.256337, -1.185437, 0.3607843, 0, 1, 1,
0.6711656, -2.401391, 3.608767, 0.3686275, 0, 1, 1,
0.671542, -0.2799591, 1.672283, 0.372549, 0, 1, 1,
0.6733838, -1.728957, 1.505408, 0.3803922, 0, 1, 1,
0.6816688, -0.6165504, 1.03172, 0.3843137, 0, 1, 1,
0.6823159, 1.336024, 1.234305, 0.3921569, 0, 1, 1,
0.6863617, -0.141295, 2.584259, 0.3960784, 0, 1, 1,
0.6863681, 1.123196, 0.737027, 0.4039216, 0, 1, 1,
0.6882026, -0.1173649, 3.328692, 0.4117647, 0, 1, 1,
0.6913099, -0.05355727, 1.655628, 0.4156863, 0, 1, 1,
0.6989427, -1.496316, 1.033108, 0.4235294, 0, 1, 1,
0.7142814, -0.5994188, 1.438577, 0.427451, 0, 1, 1,
0.7157032, -0.3823669, 1.620172, 0.4352941, 0, 1, 1,
0.7163469, -0.6348868, 1.886926, 0.4392157, 0, 1, 1,
0.720644, -0.3468029, 1.325282, 0.4470588, 0, 1, 1,
0.7215504, 0.6882656, 0.2894197, 0.4509804, 0, 1, 1,
0.7313404, 0.3903179, 0.3089154, 0.4588235, 0, 1, 1,
0.7348193, -1.711022, 3.281905, 0.4627451, 0, 1, 1,
0.7369264, -0.9409714, 2.238905, 0.4705882, 0, 1, 1,
0.7377825, 1.846187, -0.02988135, 0.4745098, 0, 1, 1,
0.7402784, 0.3666183, 1.372664, 0.4823529, 0, 1, 1,
0.7404492, 0.3594115, 0.3986216, 0.4862745, 0, 1, 1,
0.7437159, -0.09852757, 1.39405, 0.4941176, 0, 1, 1,
0.7468677, 0.6806809, -0.9556109, 0.5019608, 0, 1, 1,
0.7480922, 0.6624063, 0.5137087, 0.5058824, 0, 1, 1,
0.7547841, 0.8864024, -0.2842893, 0.5137255, 0, 1, 1,
0.7551977, 1.579734, 0.3156258, 0.5176471, 0, 1, 1,
0.7591857, -1.028394, 1.691781, 0.5254902, 0, 1, 1,
0.7614924, 1.303604, 0.9036751, 0.5294118, 0, 1, 1,
0.7635862, -0.6971428, 1.200629, 0.5372549, 0, 1, 1,
0.7649414, -1.395393, 3.425118, 0.5411765, 0, 1, 1,
0.7666551, -1.010635, 0.2480362, 0.5490196, 0, 1, 1,
0.7667909, -0.6134513, 2.144174, 0.5529412, 0, 1, 1,
0.7700016, -0.8064723, 3.088832, 0.5607843, 0, 1, 1,
0.7713667, -1.774383, 2.926424, 0.5647059, 0, 1, 1,
0.7717789, -0.7041458, 2.916479, 0.572549, 0, 1, 1,
0.772801, -2.279323, 5.33266, 0.5764706, 0, 1, 1,
0.7775984, 1.002, -0.05901838, 0.5843138, 0, 1, 1,
0.7789993, -0.5010563, 2.313914, 0.5882353, 0, 1, 1,
0.7799697, -2.255426, 2.314761, 0.5960785, 0, 1, 1,
0.7803014, 0.03723621, 1.198537, 0.6039216, 0, 1, 1,
0.7827588, -0.6579837, 2.549041, 0.6078432, 0, 1, 1,
0.786069, 0.4076214, -0.1371513, 0.6156863, 0, 1, 1,
0.7913087, -0.6310539, 2.942291, 0.6196079, 0, 1, 1,
0.8029258, 1.962932, 0.8875296, 0.627451, 0, 1, 1,
0.8075208, -1.785523, 2.237298, 0.6313726, 0, 1, 1,
0.8081276, 1.21469, -0.4323604, 0.6392157, 0, 1, 1,
0.8108544, -0.02247734, 0.5070398, 0.6431373, 0, 1, 1,
0.8112034, -1.473637, 1.912314, 0.6509804, 0, 1, 1,
0.8141567, -0.1121365, 0.1544921, 0.654902, 0, 1, 1,
0.8181927, 0.4046136, 1.93004, 0.6627451, 0, 1, 1,
0.8183435, 0.7178259, 0.3605655, 0.6666667, 0, 1, 1,
0.819622, -0.7105097, 0.3169317, 0.6745098, 0, 1, 1,
0.8197245, -0.5831771, 1.535533, 0.6784314, 0, 1, 1,
0.8229555, -0.2413451, 1.975956, 0.6862745, 0, 1, 1,
0.8245179, -1.917143, 3.654038, 0.6901961, 0, 1, 1,
0.8250278, 0.6179823, 1.597377, 0.6980392, 0, 1, 1,
0.8296729, 0.6522589, 1.813141, 0.7058824, 0, 1, 1,
0.8301444, 0.09343532, 1.899763, 0.7098039, 0, 1, 1,
0.8301965, -1.755895, 2.623288, 0.7176471, 0, 1, 1,
0.8392269, 0.07100666, 0.181464, 0.7215686, 0, 1, 1,
0.8417394, 0.2409775, 1.586193, 0.7294118, 0, 1, 1,
0.8490669, 0.5103568, 1.547238, 0.7333333, 0, 1, 1,
0.8577504, 0.6332959, -0.3250877, 0.7411765, 0, 1, 1,
0.8609108, -0.3393484, 1.042733, 0.7450981, 0, 1, 1,
0.8622622, -0.1857342, 1.679266, 0.7529412, 0, 1, 1,
0.8626211, -0.8506826, 2.773608, 0.7568628, 0, 1, 1,
0.8653947, 0.3552172, 3.714946, 0.7647059, 0, 1, 1,
0.8696071, 1.914997, 2.208556, 0.7686275, 0, 1, 1,
0.8731164, -0.8220406, 2.582092, 0.7764706, 0, 1, 1,
0.878971, -1.65906, 1.827422, 0.7803922, 0, 1, 1,
0.8817483, -0.9996305, 1.034838, 0.7882353, 0, 1, 1,
0.8824809, 0.6835945, 1.369832, 0.7921569, 0, 1, 1,
0.8851457, 1.955036, 2.491749, 0.8, 0, 1, 1,
0.8861137, -1.104286, 1.748915, 0.8078431, 0, 1, 1,
0.8877171, 2.770084, 0.5425082, 0.8117647, 0, 1, 1,
0.8887704, -0.303596, 2.910849, 0.8196079, 0, 1, 1,
0.8910169, 1.706975, -0.8038641, 0.8235294, 0, 1, 1,
0.8926477, -2.102794, 2.204895, 0.8313726, 0, 1, 1,
0.8977536, 1.460356, 0.854708, 0.8352941, 0, 1, 1,
0.907185, 0.2879398, 1.465517, 0.8431373, 0, 1, 1,
0.9106038, 1.017105, 1.566775, 0.8470588, 0, 1, 1,
0.9121925, 1.267355, -1.636959, 0.854902, 0, 1, 1,
0.938993, 1.667124, 0.8729878, 0.8588235, 0, 1, 1,
0.9447278, 0.2020534, 0.4767283, 0.8666667, 0, 1, 1,
0.952136, -1.179406, 3.479251, 0.8705882, 0, 1, 1,
0.9545743, -0.6503345, 1.935412, 0.8784314, 0, 1, 1,
0.9564736, -1.065966, 0.766719, 0.8823529, 0, 1, 1,
0.9576441, -1.125747, 2.804732, 0.8901961, 0, 1, 1,
0.9597443, 0.5578781, 1.676426, 0.8941177, 0, 1, 1,
0.9697112, 0.3728997, 1.64662, 0.9019608, 0, 1, 1,
0.9838621, 0.8647604, 0.6502415, 0.9098039, 0, 1, 1,
0.9851334, 0.7973224, 0.8540683, 0.9137255, 0, 1, 1,
0.9852117, 0.03940159, 1.924137, 0.9215686, 0, 1, 1,
0.9913142, 2.039163, -0.2224318, 0.9254902, 0, 1, 1,
0.9924128, -0.109964, 2.232895, 0.9333333, 0, 1, 1,
0.9957125, -0.1468867, 0.6843456, 0.9372549, 0, 1, 1,
0.9990163, -0.9463834, 3.241684, 0.945098, 0, 1, 1,
1.000731, 0.1811213, 0.5723488, 0.9490196, 0, 1, 1,
1.003683, -0.9952177, 1.861609, 0.9568627, 0, 1, 1,
1.0123, 0.1632593, 0.9808965, 0.9607843, 0, 1, 1,
1.022572, 0.8075268, 2.172427, 0.9686275, 0, 1, 1,
1.024355, 1.419152, 0.5277988, 0.972549, 0, 1, 1,
1.024938, -1.423204, 3.358361, 0.9803922, 0, 1, 1,
1.025295, 0.7328112, 1.798876, 0.9843137, 0, 1, 1,
1.026145, -0.0743279, 0.6868879, 0.9921569, 0, 1, 1,
1.026362, -0.6662605, 1.529996, 0.9960784, 0, 1, 1,
1.029357, 0.3825944, 0.9049333, 1, 0, 0.9960784, 1,
1.035857, -0.3842146, 2.10286, 1, 0, 0.9882353, 1,
1.039167, 2.313506, 0.6099394, 1, 0, 0.9843137, 1,
1.039613, 1.102354, 2.400455, 1, 0, 0.9764706, 1,
1.041815, -0.3271143, 0.4148435, 1, 0, 0.972549, 1,
1.046589, 2.716818, 0.2154531, 1, 0, 0.9647059, 1,
1.05281, -1.178922, 1.660523, 1, 0, 0.9607843, 1,
1.055793, 0.4491621, 1.21113, 1, 0, 0.9529412, 1,
1.058312, 3.000362, 0.3957572, 1, 0, 0.9490196, 1,
1.059963, -1.592019, 2.422457, 1, 0, 0.9411765, 1,
1.060236, -0.2908183, 3.457252, 1, 0, 0.9372549, 1,
1.060456, -1.705394, 2.177476, 1, 0, 0.9294118, 1,
1.063392, -1.363452, 3.878075, 1, 0, 0.9254902, 1,
1.066895, 2.422442, -0.3848048, 1, 0, 0.9176471, 1,
1.071103, -0.2670939, 0.9531006, 1, 0, 0.9137255, 1,
1.079056, -1.681077, 2.27024, 1, 0, 0.9058824, 1,
1.083327, -0.997564, 2.582845, 1, 0, 0.9019608, 1,
1.086606, 1.089067, -0.4679612, 1, 0, 0.8941177, 1,
1.086921, 0.3874572, 0.4674682, 1, 0, 0.8862745, 1,
1.087385, 0.5686136, 0.5822967, 1, 0, 0.8823529, 1,
1.093, 1.343273, -1.482322, 1, 0, 0.8745098, 1,
1.095422, -0.1407423, 2.833119, 1, 0, 0.8705882, 1,
1.098067, -0.1545907, 1.159868, 1, 0, 0.8627451, 1,
1.102227, 0.7064945, 1.624463, 1, 0, 0.8588235, 1,
1.109947, -0.9354243, 2.176594, 1, 0, 0.8509804, 1,
1.109954, -0.7420613, 2.996397, 1, 0, 0.8470588, 1,
1.116859, 0.4993976, 1.879524, 1, 0, 0.8392157, 1,
1.117203, -1.993822, 1.223896, 1, 0, 0.8352941, 1,
1.120338, -0.6096671, 0.6920882, 1, 0, 0.827451, 1,
1.127209, -0.8624469, 1.244813, 1, 0, 0.8235294, 1,
1.129061, 0.6277282, 3.10018, 1, 0, 0.8156863, 1,
1.132373, 1.477727, -1.076119, 1, 0, 0.8117647, 1,
1.140391, 0.9819781, 0.924256, 1, 0, 0.8039216, 1,
1.144611, -0.03818747, 1.907463, 1, 0, 0.7960784, 1,
1.158122, 0.8017498, 1.456986, 1, 0, 0.7921569, 1,
1.161368, -1.486826, 2.360896, 1, 0, 0.7843137, 1,
1.163539, 1.693055, 1.73397, 1, 0, 0.7803922, 1,
1.172658, 0.438328, 2.275167, 1, 0, 0.772549, 1,
1.175687, -0.9163099, 3.112783, 1, 0, 0.7686275, 1,
1.182462, -0.5197212, 2.528954, 1, 0, 0.7607843, 1,
1.18847, -1.897272, 3.233904, 1, 0, 0.7568628, 1,
1.18944, -0.1383834, 2.694111, 1, 0, 0.7490196, 1,
1.193217, -0.06723623, 2.048574, 1, 0, 0.7450981, 1,
1.203753, 1.708997, -0.4262396, 1, 0, 0.7372549, 1,
1.209569, 0.8921438, 0.2934913, 1, 0, 0.7333333, 1,
1.217225, -0.01346688, 0.4144299, 1, 0, 0.7254902, 1,
1.218107, 1.323054, 0.707828, 1, 0, 0.7215686, 1,
1.223213, 0.6372355, 1.249456, 1, 0, 0.7137255, 1,
1.223901, 0.007143931, 2.485961, 1, 0, 0.7098039, 1,
1.224175, 0.7430791, 1.783968, 1, 0, 0.7019608, 1,
1.225024, -0.1213373, 1.675151, 1, 0, 0.6941177, 1,
1.228097, 0.1026552, -0.3776499, 1, 0, 0.6901961, 1,
1.229854, -2.276016, 2.964882, 1, 0, 0.682353, 1,
1.230732, -0.04878471, 2.372578, 1, 0, 0.6784314, 1,
1.236586, -1.543156, 2.805212, 1, 0, 0.6705883, 1,
1.243329, -0.3827811, 3.223824, 1, 0, 0.6666667, 1,
1.243535, -0.07449345, 2.671978, 1, 0, 0.6588235, 1,
1.252927, 0.6690301, 3.23917, 1, 0, 0.654902, 1,
1.258769, 0.7516563, -0.7998894, 1, 0, 0.6470588, 1,
1.258808, -1.157721, 1.463086, 1, 0, 0.6431373, 1,
1.277466, -1.476234, 2.9399, 1, 0, 0.6352941, 1,
1.279907, 0.8003798, 0.7461859, 1, 0, 0.6313726, 1,
1.28135, -1.166738, 2.366604, 1, 0, 0.6235294, 1,
1.299088, -0.2157423, 1.39112, 1, 0, 0.6196079, 1,
1.302211, -0.2957332, 1.688114, 1, 0, 0.6117647, 1,
1.314749, -0.01448995, 0.8782057, 1, 0, 0.6078432, 1,
1.316064, -1.321428, 2.175911, 1, 0, 0.6, 1,
1.316819, 1.998383, 1.02605, 1, 0, 0.5921569, 1,
1.319324, 0.2208948, 2.301944, 1, 0, 0.5882353, 1,
1.331519, 0.9419932, 0.7211131, 1, 0, 0.5803922, 1,
1.34239, 0.1151881, 0.08983504, 1, 0, 0.5764706, 1,
1.343987, -0.4471732, 1.114817, 1, 0, 0.5686275, 1,
1.35268, 0.9826171, 2.772892, 1, 0, 0.5647059, 1,
1.353342, 0.1981463, 2.169848, 1, 0, 0.5568628, 1,
1.35569, 0.8460149, -0.5928831, 1, 0, 0.5529412, 1,
1.357743, 0.01296036, 1.006935, 1, 0, 0.5450981, 1,
1.363501, 0.7627323, 0.2414443, 1, 0, 0.5411765, 1,
1.367027, -0.119453, 2.506736, 1, 0, 0.5333334, 1,
1.376306, 0.100653, 1.331008, 1, 0, 0.5294118, 1,
1.383584, 0.7191408, 1.561342, 1, 0, 0.5215687, 1,
1.409187, -0.3654678, 2.49469, 1, 0, 0.5176471, 1,
1.410546, -0.6484219, 2.522319, 1, 0, 0.509804, 1,
1.411428, 0.8641223, 1.559804, 1, 0, 0.5058824, 1,
1.415295, 0.5095502, 1.033016, 1, 0, 0.4980392, 1,
1.416015, 1.09628, 0.369987, 1, 0, 0.4901961, 1,
1.431054, 0.08497192, 1.457144, 1, 0, 0.4862745, 1,
1.435506, 0.6810343, 0.8559139, 1, 0, 0.4784314, 1,
1.437796, -0.6075448, 2.809977, 1, 0, 0.4745098, 1,
1.438448, -1.410681, 2.792101, 1, 0, 0.4666667, 1,
1.439068, -0.4512862, 2.942936, 1, 0, 0.4627451, 1,
1.44393, 0.7236766, 0.4977776, 1, 0, 0.454902, 1,
1.45569, 0.1390329, 2.499554, 1, 0, 0.4509804, 1,
1.458093, -1.413795, 1.15997, 1, 0, 0.4431373, 1,
1.461791, -0.973222, 2.584076, 1, 0, 0.4392157, 1,
1.462171, -0.03881203, 1.106691, 1, 0, 0.4313726, 1,
1.485806, -0.6160157, 3.096737, 1, 0, 0.427451, 1,
1.497748, -1.044694, 3.142946, 1, 0, 0.4196078, 1,
1.501059, -0.2606839, 0.2821861, 1, 0, 0.4156863, 1,
1.502419, 1.100583, 3.258111, 1, 0, 0.4078431, 1,
1.513783, 0.144252, 2.322272, 1, 0, 0.4039216, 1,
1.540514, 0.4227141, 2.151503, 1, 0, 0.3960784, 1,
1.547692, 0.2323252, 3.032963, 1, 0, 0.3882353, 1,
1.549866, 0.9685252, 0.6280244, 1, 0, 0.3843137, 1,
1.584282, -0.725886, 0.8170303, 1, 0, 0.3764706, 1,
1.584926, 0.6231818, 1.633743, 1, 0, 0.372549, 1,
1.588839, 0.4942885, 1.430908, 1, 0, 0.3647059, 1,
1.589487, 0.2206668, 1.159205, 1, 0, 0.3607843, 1,
1.598661, -0.7946119, 2.468294, 1, 0, 0.3529412, 1,
1.607069, -0.4658195, 0.5638209, 1, 0, 0.3490196, 1,
1.608624, 0.2888047, 2.645285, 1, 0, 0.3411765, 1,
1.631998, -1.475636, 1.811137, 1, 0, 0.3372549, 1,
1.639501, -0.8260204, 1.417795, 1, 0, 0.3294118, 1,
1.645266, 0.6727561, 3.401824, 1, 0, 0.3254902, 1,
1.64566, -0.7521822, 2.15168, 1, 0, 0.3176471, 1,
1.64901, -0.06708319, 1.023722, 1, 0, 0.3137255, 1,
1.655485, -0.5500277, 1.292875, 1, 0, 0.3058824, 1,
1.660116, 0.2004171, -0.8026625, 1, 0, 0.2980392, 1,
1.662873, -0.0378728, 2.756507, 1, 0, 0.2941177, 1,
1.697465, 0.4261242, 1.815419, 1, 0, 0.2862745, 1,
1.706125, -0.1331619, 0.8690985, 1, 0, 0.282353, 1,
1.708624, -0.5106382, 0.913376, 1, 0, 0.2745098, 1,
1.71209, 0.2628023, 1.273787, 1, 0, 0.2705882, 1,
1.712259, 0.4279386, 3.459854, 1, 0, 0.2627451, 1,
1.715693, 0.04215011, 2.782391, 1, 0, 0.2588235, 1,
1.718166, 0.2532448, 0.6892863, 1, 0, 0.2509804, 1,
1.73072, -0.5636571, 1.14932, 1, 0, 0.2470588, 1,
1.735345, -0.1644038, 2.037412, 1, 0, 0.2392157, 1,
1.73664, 1.673236, -0.2751119, 1, 0, 0.2352941, 1,
1.744054, -0.5299951, 1.570716, 1, 0, 0.227451, 1,
1.754655, -0.02888689, 2.698027, 1, 0, 0.2235294, 1,
1.773123, -0.2840167, 1.594015, 1, 0, 0.2156863, 1,
1.784116, 0.2058592, 2.522041, 1, 0, 0.2117647, 1,
1.840751, 1.370531, 1.233177, 1, 0, 0.2039216, 1,
1.858859, 1.188683, -0.3043135, 1, 0, 0.1960784, 1,
1.862601, 0.4828599, 2.44415, 1, 0, 0.1921569, 1,
1.870761, 0.9876944, 0.6985457, 1, 0, 0.1843137, 1,
1.914724, 0.9184089, -0.6534202, 1, 0, 0.1803922, 1,
1.925478, -0.008350271, 1.961413, 1, 0, 0.172549, 1,
1.93274, -0.860374, 2.778884, 1, 0, 0.1686275, 1,
1.937515, -1.072553, 3.184703, 1, 0, 0.1607843, 1,
1.954162, -0.4243707, 1.647767, 1, 0, 0.1568628, 1,
1.995032, -2.626901, 1.370059, 1, 0, 0.1490196, 1,
1.995794, -0.4764736, 1.722607, 1, 0, 0.145098, 1,
2.017825, 1.195517, 1.142967, 1, 0, 0.1372549, 1,
2.047556, -1.320628, 2.04484, 1, 0, 0.1333333, 1,
2.088745, 0.9769856, 0.6522373, 1, 0, 0.1254902, 1,
2.118037, 0.8368297, 1.544584, 1, 0, 0.1215686, 1,
2.153928, 0.03536565, 2.12509, 1, 0, 0.1137255, 1,
2.167801, 2.352147, 0.683814, 1, 0, 0.1098039, 1,
2.205221, -0.715367, 1.101373, 1, 0, 0.1019608, 1,
2.241643, 0.1248523, 1.849375, 1, 0, 0.09411765, 1,
2.247852, -0.246064, 2.799336, 1, 0, 0.09019608, 1,
2.288093, 0.1691604, 3.33577, 1, 0, 0.08235294, 1,
2.296845, 0.3448355, 1.068476, 1, 0, 0.07843138, 1,
2.318261, 1.216441, -1.959285, 1, 0, 0.07058824, 1,
2.31961, 0.7818653, 0.3370613, 1, 0, 0.06666667, 1,
2.396581, -0.5119593, 3.184528, 1, 0, 0.05882353, 1,
2.435824, -1.879672, 2.299073, 1, 0, 0.05490196, 1,
2.453507, -0.2858452, 2.369034, 1, 0, 0.04705882, 1,
2.454569, 0.5536751, 2.115163, 1, 0, 0.04313726, 1,
2.460609, 0.1209191, 1.216094, 1, 0, 0.03529412, 1,
2.541879, -0.8931656, 2.07017, 1, 0, 0.03137255, 1,
2.660936, -2.254716, 1.220424, 1, 0, 0.02352941, 1,
2.752723, 0.7185728, 1.033382, 1, 0, 0.01960784, 1,
2.98193, 0.6782022, 3.510381, 1, 0, 0.01176471, 1,
3.221977, 0.4553483, 0.7091634, 1, 0, 0.007843138, 1
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
-0.1470524, -4.781904, -6.661126, 0, -0.5, 0.5, 0.5,
-0.1470524, -4.781904, -6.661126, 1, -0.5, 0.5, 0.5,
-0.1470524, -4.781904, -6.661126, 1, 1.5, 0.5, 0.5,
-0.1470524, -4.781904, -6.661126, 0, 1.5, 0.5, 0.5
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
-4.658183, -0.2064098, -6.661126, 0, -0.5, 0.5, 0.5,
-4.658183, -0.2064098, -6.661126, 1, -0.5, 0.5, 0.5,
-4.658183, -0.2064098, -6.661126, 1, 1.5, 0.5, 0.5,
-4.658183, -0.2064098, -6.661126, 0, 1.5, 0.5, 0.5
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
-4.658183, -4.781904, 0.2049189, 0, -0.5, 0.5, 0.5,
-4.658183, -4.781904, 0.2049189, 1, -0.5, 0.5, 0.5,
-4.658183, -4.781904, 0.2049189, 1, 1.5, 0.5, 0.5,
-4.658183, -4.781904, 0.2049189, 0, 1.5, 0.5, 0.5
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
-3, -3.72602, -5.076654,
3, -3.72602, -5.076654,
-3, -3.72602, -5.076654,
-3, -3.902001, -5.340733,
-2, -3.72602, -5.076654,
-2, -3.902001, -5.340733,
-1, -3.72602, -5.076654,
-1, -3.902001, -5.340733,
0, -3.72602, -5.076654,
0, -3.902001, -5.340733,
1, -3.72602, -5.076654,
1, -3.902001, -5.340733,
2, -3.72602, -5.076654,
2, -3.902001, -5.340733,
3, -3.72602, -5.076654,
3, -3.902001, -5.340733
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
-3, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
-3, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
-3, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
-3, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5,
-2, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
-2, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
-2, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
-2, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5,
-1, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
-1, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
-1, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
-1, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5,
0, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
0, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
0, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
0, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5,
1, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
1, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
1, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
1, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5,
2, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
2, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
2, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
2, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5,
3, -4.253962, -5.86889, 0, -0.5, 0.5, 0.5,
3, -4.253962, -5.86889, 1, -0.5, 0.5, 0.5,
3, -4.253962, -5.86889, 1, 1.5, 0.5, 0.5,
3, -4.253962, -5.86889, 0, 1.5, 0.5, 0.5
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
-3.617153, -3, -5.076654,
-3.617153, 3, -5.076654,
-3.617153, -3, -5.076654,
-3.790658, -3, -5.340733,
-3.617153, -2, -5.076654,
-3.790658, -2, -5.340733,
-3.617153, -1, -5.076654,
-3.790658, -1, -5.340733,
-3.617153, 0, -5.076654,
-3.790658, 0, -5.340733,
-3.617153, 1, -5.076654,
-3.790658, 1, -5.340733,
-3.617153, 2, -5.076654,
-3.790658, 2, -5.340733,
-3.617153, 3, -5.076654,
-3.790658, 3, -5.340733
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
-4.137668, -3, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, -3, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, -3, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, -3, -5.86889, 0, 1.5, 0.5, 0.5,
-4.137668, -2, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, -2, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, -2, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, -2, -5.86889, 0, 1.5, 0.5, 0.5,
-4.137668, -1, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, -1, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, -1, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, -1, -5.86889, 0, 1.5, 0.5, 0.5,
-4.137668, 0, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, 0, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, 0, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, 0, -5.86889, 0, 1.5, 0.5, 0.5,
-4.137668, 1, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, 1, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, 1, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, 1, -5.86889, 0, 1.5, 0.5, 0.5,
-4.137668, 2, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, 2, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, 2, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, 2, -5.86889, 0, 1.5, 0.5, 0.5,
-4.137668, 3, -5.86889, 0, -0.5, 0.5, 0.5,
-4.137668, 3, -5.86889, 1, -0.5, 0.5, 0.5,
-4.137668, 3, -5.86889, 1, 1.5, 0.5, 0.5,
-4.137668, 3, -5.86889, 0, 1.5, 0.5, 0.5
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
-3.617153, -3.72602, -4,
-3.617153, -3.72602, 4,
-3.617153, -3.72602, -4,
-3.790658, -3.902001, -4,
-3.617153, -3.72602, -2,
-3.790658, -3.902001, -2,
-3.617153, -3.72602, 0,
-3.790658, -3.902001, 0,
-3.617153, -3.72602, 2,
-3.790658, -3.902001, 2,
-3.617153, -3.72602, 4,
-3.790658, -3.902001, 4
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
-4.137668, -4.253962, -4, 0, -0.5, 0.5, 0.5,
-4.137668, -4.253962, -4, 1, -0.5, 0.5, 0.5,
-4.137668, -4.253962, -4, 1, 1.5, 0.5, 0.5,
-4.137668, -4.253962, -4, 0, 1.5, 0.5, 0.5,
-4.137668, -4.253962, -2, 0, -0.5, 0.5, 0.5,
-4.137668, -4.253962, -2, 1, -0.5, 0.5, 0.5,
-4.137668, -4.253962, -2, 1, 1.5, 0.5, 0.5,
-4.137668, -4.253962, -2, 0, 1.5, 0.5, 0.5,
-4.137668, -4.253962, 0, 0, -0.5, 0.5, 0.5,
-4.137668, -4.253962, 0, 1, -0.5, 0.5, 0.5,
-4.137668, -4.253962, 0, 1, 1.5, 0.5, 0.5,
-4.137668, -4.253962, 0, 0, 1.5, 0.5, 0.5,
-4.137668, -4.253962, 2, 0, -0.5, 0.5, 0.5,
-4.137668, -4.253962, 2, 1, -0.5, 0.5, 0.5,
-4.137668, -4.253962, 2, 1, 1.5, 0.5, 0.5,
-4.137668, -4.253962, 2, 0, 1.5, 0.5, 0.5,
-4.137668, -4.253962, 4, 0, -0.5, 0.5, 0.5,
-4.137668, -4.253962, 4, 1, -0.5, 0.5, 0.5,
-4.137668, -4.253962, 4, 1, 1.5, 0.5, 0.5,
-4.137668, -4.253962, 4, 0, 1.5, 0.5, 0.5
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
-3.617153, -3.72602, -5.076654,
-3.617153, 3.313201, -5.076654,
-3.617153, -3.72602, 5.486492,
-3.617153, 3.313201, 5.486492,
-3.617153, -3.72602, -5.076654,
-3.617153, -3.72602, 5.486492,
-3.617153, 3.313201, -5.076654,
-3.617153, 3.313201, 5.486492,
-3.617153, -3.72602, -5.076654,
3.323048, -3.72602, -5.076654,
-3.617153, -3.72602, 5.486492,
3.323048, -3.72602, 5.486492,
-3.617153, 3.313201, -5.076654,
3.323048, 3.313201, -5.076654,
-3.617153, 3.313201, 5.486492,
3.323048, 3.313201, 5.486492,
3.323048, -3.72602, -5.076654,
3.323048, 3.313201, -5.076654,
3.323048, -3.72602, 5.486492,
3.323048, 3.313201, 5.486492,
3.323048, -3.72602, -5.076654,
3.323048, -3.72602, 5.486492,
3.323048, 3.313201, -5.076654,
3.323048, 3.313201, 5.486492
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
var radius = 7.725152;
var distance = 34.37008;
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
mvMatrix.translate( 0.1470524, 0.2064098, -0.2049189 );
mvMatrix.scale( 1.203508, 1.186578, 0.790729 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.37008);
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
nicosulfuron<-read.table("nicosulfuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nicosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
```

```r
y<-nicosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
```

```r
z<-nicosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'nicosulfuron' not found
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
-3.516082, -0.6517013, 1.076401, 0, 0, 1, 1, 1,
-3.419736, 0.1459746, -4.099487, 1, 0, 0, 1, 1,
-3.059039, 0.8664311, -0.7541413, 1, 0, 0, 1, 1,
-3.039347, 2.745009, -0.15606, 1, 0, 0, 1, 1,
-3.014066, -1.322716, -1.554194, 1, 0, 0, 1, 1,
-2.779094, -0.2791297, -1.6162, 1, 0, 0, 1, 1,
-2.763473, 1.156264, -0.06668898, 0, 0, 0, 1, 1,
-2.761606, 0.5516936, -0.5358663, 0, 0, 0, 1, 1,
-2.56486, 1.018345, 1.04973, 0, 0, 0, 1, 1,
-2.463261, 0.344163, -1.373385, 0, 0, 0, 1, 1,
-2.319535, -0.166352, -1.82276, 0, 0, 0, 1, 1,
-2.311341, 0.2405323, -0.6799754, 0, 0, 0, 1, 1,
-2.306278, 0.4443092, -1.555762, 0, 0, 0, 1, 1,
-2.304533, 0.588015, -2.536071, 1, 1, 1, 1, 1,
-2.299687, 0.2692745, -2.503097, 1, 1, 1, 1, 1,
-2.298849, 0.4080854, -2.258705, 1, 1, 1, 1, 1,
-2.28309, -1.564333, -3.10035, 1, 1, 1, 1, 1,
-2.270231, -1.164271, -3.339463, 1, 1, 1, 1, 1,
-2.263104, -2.154365, -1.948163, 1, 1, 1, 1, 1,
-2.261916, 0.0996122, -2.668726, 1, 1, 1, 1, 1,
-2.252611, 0.965691, -2.1263, 1, 1, 1, 1, 1,
-2.246358, 1.666237, -2.009216, 1, 1, 1, 1, 1,
-2.23152, 0.9752004, -2.603382, 1, 1, 1, 1, 1,
-2.228046, -0.1127752, -1.449311, 1, 1, 1, 1, 1,
-2.144923, -1.178887, -1.401745, 1, 1, 1, 1, 1,
-2.144869, 0.6051741, -0.7647564, 1, 1, 1, 1, 1,
-2.133121, 0.3221323, -2.343714, 1, 1, 1, 1, 1,
-2.112205, -1.485439, -2.017624, 1, 1, 1, 1, 1,
-2.071602, -0.6082455, -1.008948, 0, 0, 1, 1, 1,
-2.050761, 0.2149255, -2.155874, 1, 0, 0, 1, 1,
-2.047457, 1.489364, -1.139575, 1, 0, 0, 1, 1,
-2.042201, -1.57392, -2.911173, 1, 0, 0, 1, 1,
-2.03662, 2.058154, -0.5019313, 1, 0, 0, 1, 1,
-2.030807, -1.241758, -1.927569, 1, 0, 0, 1, 1,
-2.020356, -0.437966, -0.8558391, 0, 0, 0, 1, 1,
-2.019992, 0.3151185, -1.326487, 0, 0, 0, 1, 1,
-2.004258, 1.196105, -2.044893, 0, 0, 0, 1, 1,
-1.97597, -0.5246343, 0.4275923, 0, 0, 0, 1, 1,
-1.947861, 1.001384, 0.01353563, 0, 0, 0, 1, 1,
-1.940284, 1.917284, -1.918743, 0, 0, 0, 1, 1,
-1.908454, 0.5735512, -2.432464, 0, 0, 0, 1, 1,
-1.903728, -1.634875, -3.018087, 1, 1, 1, 1, 1,
-1.889741, -2.142677, -3.420596, 1, 1, 1, 1, 1,
-1.84586, -1.218123, -2.580851, 1, 1, 1, 1, 1,
-1.845766, -1.850987, -2.233171, 1, 1, 1, 1, 1,
-1.834219, -0.5016531, -1.828009, 1, 1, 1, 1, 1,
-1.831545, -1.183396, -1.999653, 1, 1, 1, 1, 1,
-1.824705, -1.36885, -1.89789, 1, 1, 1, 1, 1,
-1.823189, -0.02078097, -3.944933, 1, 1, 1, 1, 1,
-1.818425, -0.6325541, -2.502398, 1, 1, 1, 1, 1,
-1.796534, 0.2406874, -2.303624, 1, 1, 1, 1, 1,
-1.783988, 2.05353, 0.8063108, 1, 1, 1, 1, 1,
-1.758892, -0.2274339, -0.3572942, 1, 1, 1, 1, 1,
-1.758663, -1.732435, -1.981332, 1, 1, 1, 1, 1,
-1.746195, 0.3469142, -1.677012, 1, 1, 1, 1, 1,
-1.701089, -0.6368845, -0.3656716, 1, 1, 1, 1, 1,
-1.689658, -0.8391075, -0.8995259, 0, 0, 1, 1, 1,
-1.688896, 0.6240357, -0.8115396, 1, 0, 0, 1, 1,
-1.658836, 1.834599, 0.2412786, 1, 0, 0, 1, 1,
-1.652812, -1.504122, -1.299143, 1, 0, 0, 1, 1,
-1.646582, -1.37118, -1.516539, 1, 0, 0, 1, 1,
-1.63605, -0.5246148, -2.754954, 1, 0, 0, 1, 1,
-1.624793, 0.4715296, -0.9826642, 0, 0, 0, 1, 1,
-1.592382, 0.8858512, 0.07026045, 0, 0, 0, 1, 1,
-1.563765, -0.8881513, -3.691227, 0, 0, 0, 1, 1,
-1.560966, 0.1441427, -2.877721, 0, 0, 0, 1, 1,
-1.545193, -0.2376489, -1.441761, 0, 0, 0, 1, 1,
-1.543711, 0.02153753, -0.4821091, 0, 0, 0, 1, 1,
-1.540861, -1.275838, -1.227651, 0, 0, 0, 1, 1,
-1.524189, -1.468038, -2.444122, 1, 1, 1, 1, 1,
-1.504734, -1.549458, -2.404932, 1, 1, 1, 1, 1,
-1.504312, 0.4875353, -1.754891, 1, 1, 1, 1, 1,
-1.502863, -0.5104727, -2.365174, 1, 1, 1, 1, 1,
-1.476074, 0.9135685, -0.7706604, 1, 1, 1, 1, 1,
-1.475778, 0.938814, -0.2562065, 1, 1, 1, 1, 1,
-1.46989, -0.558925, -2.673974, 1, 1, 1, 1, 1,
-1.467069, 1.345272, -1.850985, 1, 1, 1, 1, 1,
-1.466455, 0.06830462, -2.037466, 1, 1, 1, 1, 1,
-1.453341, -0.120291, -2.996238, 1, 1, 1, 1, 1,
-1.4455, -0.2923765, -1.53957, 1, 1, 1, 1, 1,
-1.440441, -0.8853561, -2.378061, 1, 1, 1, 1, 1,
-1.43423, 0.8485366, -1.996787, 1, 1, 1, 1, 1,
-1.421784, -0.2212007, -1.104144, 1, 1, 1, 1, 1,
-1.418329, -0.40363, -3.499445, 1, 1, 1, 1, 1,
-1.417371, -0.3621195, -2.70135, 0, 0, 1, 1, 1,
-1.415353, 0.542451, -0.8532292, 1, 0, 0, 1, 1,
-1.411367, 1.904427, 0.06471299, 1, 0, 0, 1, 1,
-1.406641, 0.4879794, -2.292912, 1, 0, 0, 1, 1,
-1.404786, -1.459421, 0.2109728, 1, 0, 0, 1, 1,
-1.404326, -0.2455114, -2.301038, 1, 0, 0, 1, 1,
-1.394852, -0.1742156, -2.834335, 0, 0, 0, 1, 1,
-1.383786, -0.06944465, -2.527772, 0, 0, 0, 1, 1,
-1.382756, -0.05162891, -0.7489814, 0, 0, 0, 1, 1,
-1.381186, 2.150963, -0.9135146, 0, 0, 0, 1, 1,
-1.373701, 1.398557, -0.06720267, 0, 0, 0, 1, 1,
-1.358934, 0.4920241, -0.6684675, 0, 0, 0, 1, 1,
-1.35475, -1.171976, -0.6748692, 0, 0, 0, 1, 1,
-1.353016, -0.7050736, -1.533902, 1, 1, 1, 1, 1,
-1.349811, 0.3369685, -2.207097, 1, 1, 1, 1, 1,
-1.348343, -1.029098, -3.788684, 1, 1, 1, 1, 1,
-1.344576, 1.146912, -1.230933, 1, 1, 1, 1, 1,
-1.342092, 1.072516, -2.010465, 1, 1, 1, 1, 1,
-1.341341, 1.678787, -0.2823828, 1, 1, 1, 1, 1,
-1.329929, -0.7165595, -3.237748, 1, 1, 1, 1, 1,
-1.325105, -0.6729037, -0.738674, 1, 1, 1, 1, 1,
-1.31531, -1.828616, -2.591448, 1, 1, 1, 1, 1,
-1.307289, 0.7278005, 0.004371739, 1, 1, 1, 1, 1,
-1.302464, -2.215839, -2.475448, 1, 1, 1, 1, 1,
-1.301634, -0.9315348, -2.896478, 1, 1, 1, 1, 1,
-1.300892, 0.01149592, -1.628323, 1, 1, 1, 1, 1,
-1.300577, 0.5158945, -1.482963, 1, 1, 1, 1, 1,
-1.300011, -0.7493089, -2.391748, 1, 1, 1, 1, 1,
-1.298899, -0.04430518, -1.597068, 0, 0, 1, 1, 1,
-1.292393, -0.07915073, -1.370297, 1, 0, 0, 1, 1,
-1.288692, -0.3394704, -3.350271, 1, 0, 0, 1, 1,
-1.287871, -1.584214, -3.234816, 1, 0, 0, 1, 1,
-1.283666, 0.09883611, -1.033712, 1, 0, 0, 1, 1,
-1.283381, 2.034628, 0.5073949, 1, 0, 0, 1, 1,
-1.275684, 0.06632161, -2.542574, 0, 0, 0, 1, 1,
-1.270911, 2.027027, 0.02850473, 0, 0, 0, 1, 1,
-1.26539, 1.047676, -1.857915, 0, 0, 0, 1, 1,
-1.259348, 1.195507, -2.404707, 0, 0, 0, 1, 1,
-1.257927, 0.1199543, 0.3058399, 0, 0, 0, 1, 1,
-1.250117, -0.111824, -2.947438, 0, 0, 0, 1, 1,
-1.245716, 0.991405, -1.100984, 0, 0, 0, 1, 1,
-1.24446, -0.8854781, -2.406921, 1, 1, 1, 1, 1,
-1.22926, -1.924978, -1.998475, 1, 1, 1, 1, 1,
-1.22918, -0.7890747, -0.6888046, 1, 1, 1, 1, 1,
-1.222353, -0.4474832, -0.6304275, 1, 1, 1, 1, 1,
-1.220266, -0.2543069, -2.078769, 1, 1, 1, 1, 1,
-1.210583, 1.007295, -1.599089, 1, 1, 1, 1, 1,
-1.207582, -0.1348381, -1.024493, 1, 1, 1, 1, 1,
-1.20446, -0.5247795, -2.40933, 1, 1, 1, 1, 1,
-1.203329, -0.7531449, -2.04761, 1, 1, 1, 1, 1,
-1.20117, -0.2510618, -1.05492, 1, 1, 1, 1, 1,
-1.195077, 1.059035, 0.9113981, 1, 1, 1, 1, 1,
-1.189144, 1.467312, -0.2297451, 1, 1, 1, 1, 1,
-1.187461, 1.307281, -1.732327, 1, 1, 1, 1, 1,
-1.186491, -2.252051, -3.698246, 1, 1, 1, 1, 1,
-1.180841, 1.728038, -0.39489, 1, 1, 1, 1, 1,
-1.174751, -0.2028938, -1.025862, 0, 0, 1, 1, 1,
-1.174019, 0.5596734, -0.6795136, 1, 0, 0, 1, 1,
-1.166305, -1.287573, -2.150492, 1, 0, 0, 1, 1,
-1.163506, -0.5996981, 0.6201952, 1, 0, 0, 1, 1,
-1.148736, -0.2054967, -2.332198, 1, 0, 0, 1, 1,
-1.148078, 0.3384675, -2.236824, 1, 0, 0, 1, 1,
-1.141806, -1.30237, -1.411955, 0, 0, 0, 1, 1,
-1.135741, -0.3499576, -1.385476, 0, 0, 0, 1, 1,
-1.13322, 1.127618, -1.923858, 0, 0, 0, 1, 1,
-1.131805, -0.06548493, -0.4711458, 0, 0, 0, 1, 1,
-1.117281, 1.848991, -0.4050275, 0, 0, 0, 1, 1,
-1.116124, -0.3145179, -1.250746, 0, 0, 0, 1, 1,
-1.114462, 0.3441844, -1.303254, 0, 0, 0, 1, 1,
-1.113127, 0.9560263, -1.20396, 1, 1, 1, 1, 1,
-1.110973, -0.02549905, -1.35462, 1, 1, 1, 1, 1,
-1.10672, 0.8434048, -2.176829, 1, 1, 1, 1, 1,
-1.104254, 0.4652525, -0.5427655, 1, 1, 1, 1, 1,
-1.103056, -0.492026, -3.118293, 1, 1, 1, 1, 1,
-1.096887, 0.7147552, -1.099506, 1, 1, 1, 1, 1,
-1.096247, 1.506739, 0.3663888, 1, 1, 1, 1, 1,
-1.088188, -0.1978741, -1.197116, 1, 1, 1, 1, 1,
-1.086322, 1.308328, -1.384385, 1, 1, 1, 1, 1,
-1.08372, -0.8237001, -3.840733, 1, 1, 1, 1, 1,
-1.074659, 2.32468, -1.764756, 1, 1, 1, 1, 1,
-1.071554, -0.4167707, 0.2737208, 1, 1, 1, 1, 1,
-1.062036, 2.188871, -0.02216059, 1, 1, 1, 1, 1,
-1.060858, -0.1494869, -1.435221, 1, 1, 1, 1, 1,
-1.041197, -1.231014, -3.614142, 1, 1, 1, 1, 1,
-1.039858, -0.5772641, -1.405437, 0, 0, 1, 1, 1,
-1.035515, 1.56527, -0.7294512, 1, 0, 0, 1, 1,
-1.032223, -0.4712114, -2.275588, 1, 0, 0, 1, 1,
-1.023698, 0.7646279, -1.246867, 1, 0, 0, 1, 1,
-1.022697, -1.159421, -2.085569, 1, 0, 0, 1, 1,
-1.0195, -0.6009579, -2.259528, 1, 0, 0, 1, 1,
-1.014089, -0.2581485, -2.557693, 0, 0, 0, 1, 1,
-1.00018, -0.859058, -2.155694, 0, 0, 0, 1, 1,
-0.9960944, 0.1571741, -1.143864, 0, 0, 0, 1, 1,
-0.989302, -2.09242, -0.6817101, 0, 0, 0, 1, 1,
-0.9886169, -0.5367842, -0.4438436, 0, 0, 0, 1, 1,
-0.9855233, -1.807356, -3.387008, 0, 0, 0, 1, 1,
-0.9759229, -0.4295191, -2.989077, 0, 0, 0, 1, 1,
-0.9755176, -0.4645129, -1.405639, 1, 1, 1, 1, 1,
-0.9732335, -1.588431, -1.657124, 1, 1, 1, 1, 1,
-0.961612, 0.7889804, -1.962914, 1, 1, 1, 1, 1,
-0.9600875, -0.4979643, 0.1404928, 1, 1, 1, 1, 1,
-0.9561283, 2.320174, -1.917139, 1, 1, 1, 1, 1,
-0.951701, -0.003921471, -2.846884, 1, 1, 1, 1, 1,
-0.94833, -0.06635284, -1.588434, 1, 1, 1, 1, 1,
-0.9438871, -0.1049595, -4.188179, 1, 1, 1, 1, 1,
-0.9437417, -1.299832, -2.389282, 1, 1, 1, 1, 1,
-0.9394652, 0.2483622, -1.401188, 1, 1, 1, 1, 1,
-0.9275058, -0.6883563, -1.984036, 1, 1, 1, 1, 1,
-0.9266748, 0.6855099, -0.9064339, 1, 1, 1, 1, 1,
-0.9249038, -0.1283715, -1.623375, 1, 1, 1, 1, 1,
-0.9219933, -0.531456, -1.232448, 1, 1, 1, 1, 1,
-0.9176479, 0.2247059, -2.129566, 1, 1, 1, 1, 1,
-0.9142154, -1.325117, -2.26955, 0, 0, 1, 1, 1,
-0.9124253, 0.9731399, -1.293696, 1, 0, 0, 1, 1,
-0.9101815, 0.7389355, 0.1813555, 1, 0, 0, 1, 1,
-0.9083257, 2.713046, -0.3802444, 1, 0, 0, 1, 1,
-0.9072152, -1.480681, -1.850438, 1, 0, 0, 1, 1,
-0.9070773, -0.5453068, -0.223974, 1, 0, 0, 1, 1,
-0.9041035, 1.608426, -0.5468549, 0, 0, 0, 1, 1,
-0.897224, -0.6589928, -0.8463506, 0, 0, 0, 1, 1,
-0.8897146, 1.239361, -1.959707, 0, 0, 0, 1, 1,
-0.8880326, -1.066194, -2.653506, 0, 0, 0, 1, 1,
-0.8738377, 0.4547418, -0.4651551, 0, 0, 0, 1, 1,
-0.8717968, -0.4211627, -3.651113, 0, 0, 0, 1, 1,
-0.8691933, -0.2173231, -1.63405, 0, 0, 0, 1, 1,
-0.861109, 1.073849, 0.781819, 1, 1, 1, 1, 1,
-0.8584933, 0.6032463, 0.02749992, 1, 1, 1, 1, 1,
-0.8558463, -1.349625, -1.878383, 1, 1, 1, 1, 1,
-0.8535448, -0.9021, -3.527904, 1, 1, 1, 1, 1,
-0.8471142, 1.737293, 1.366836, 1, 1, 1, 1, 1,
-0.8465331, 0.5375828, 0.3066173, 1, 1, 1, 1, 1,
-0.843429, -0.9193444, -1.962582, 1, 1, 1, 1, 1,
-0.8384702, 1.797097, -1.259594, 1, 1, 1, 1, 1,
-0.8378834, -0.3821065, -1.553473, 1, 1, 1, 1, 1,
-0.8337652, 0.1133155, -0.9202946, 1, 1, 1, 1, 1,
-0.83187, 0.01686097, -1.423782, 1, 1, 1, 1, 1,
-0.8276592, 0.2488138, -1.158826, 1, 1, 1, 1, 1,
-0.821932, -0.6673471, -2.440557, 1, 1, 1, 1, 1,
-0.819979, 0.7739179, -1.146792, 1, 1, 1, 1, 1,
-0.8195016, 1.530484, 0.7381514, 1, 1, 1, 1, 1,
-0.8143219, 1.08488, -0.1799437, 0, 0, 1, 1, 1,
-0.808647, -0.5391949, -1.217054, 1, 0, 0, 1, 1,
-0.7982485, 0.5345495, -1.116143, 1, 0, 0, 1, 1,
-0.797552, 0.0004344849, -0.4320068, 1, 0, 0, 1, 1,
-0.7973916, 0.5952864, -0.8976823, 1, 0, 0, 1, 1,
-0.7895782, 0.3688845, 0.5778644, 1, 0, 0, 1, 1,
-0.7883107, -0.7919317, -2.853321, 0, 0, 0, 1, 1,
-0.7878846, -0.07655966, -2.606109, 0, 0, 0, 1, 1,
-0.7866849, -1.451272, -2.259945, 0, 0, 0, 1, 1,
-0.7862992, 0.3722534, -1.401039, 0, 0, 0, 1, 1,
-0.7828456, 0.3010903, -0.3658914, 0, 0, 0, 1, 1,
-0.7777879, 1.0081, -1.074229, 0, 0, 0, 1, 1,
-0.7756168, -1.829431, -3.008372, 0, 0, 0, 1, 1,
-0.7695524, -0.4820325, -1.038115, 1, 1, 1, 1, 1,
-0.7690704, -0.287308, -1.763978, 1, 1, 1, 1, 1,
-0.7683198, -1.273251, -2.555338, 1, 1, 1, 1, 1,
-0.767844, 1.552079, -2.985097, 1, 1, 1, 1, 1,
-0.764967, -0.02577136, -1.983981, 1, 1, 1, 1, 1,
-0.7587026, -1.749798, -3.506449, 1, 1, 1, 1, 1,
-0.7586347, -1.125041, -1.7243, 1, 1, 1, 1, 1,
-0.751958, -0.03470543, -0.4105864, 1, 1, 1, 1, 1,
-0.7460335, 0.6076763, -2.371267, 1, 1, 1, 1, 1,
-0.7438396, -0.5736073, -3.418666, 1, 1, 1, 1, 1,
-0.7406408, 0.4893821, -2.204439, 1, 1, 1, 1, 1,
-0.7406383, -1.13411, -2.612369, 1, 1, 1, 1, 1,
-0.7380144, 0.3256762, -1.679429, 1, 1, 1, 1, 1,
-0.7241136, -0.1597644, -3.91283, 1, 1, 1, 1, 1,
-0.7218099, 0.7033918, -0.5264065, 1, 1, 1, 1, 1,
-0.7177168, -0.9826057, -2.020752, 0, 0, 1, 1, 1,
-0.7150967, 0.3735242, -2.021832, 1, 0, 0, 1, 1,
-0.7136421, -0.3913128, -0.1905679, 1, 0, 0, 1, 1,
-0.7105251, -0.5146475, -2.649917, 1, 0, 0, 1, 1,
-0.7084587, -0.2098362, -1.085463, 1, 0, 0, 1, 1,
-0.708172, 1.081516, -1.047184, 1, 0, 0, 1, 1,
-0.7000651, -0.1127023, -1.959504, 0, 0, 0, 1, 1,
-0.6951261, -0.5169797, -2.685361, 0, 0, 0, 1, 1,
-0.694886, 0.4413017, -1.228311, 0, 0, 0, 1, 1,
-0.6936364, 2.648498, -2.472308, 0, 0, 0, 1, 1,
-0.69247, -3.122782, -3.430558, 0, 0, 0, 1, 1,
-0.6921288, -1.438333, -3.047727, 0, 0, 0, 1, 1,
-0.6909953, -0.2148463, -2.468268, 0, 0, 0, 1, 1,
-0.6848865, 0.8140154, -1.0034, 1, 1, 1, 1, 1,
-0.6848121, 2.704327, -1.261657, 1, 1, 1, 1, 1,
-0.6838301, 1.406187, -0.01499329, 1, 1, 1, 1, 1,
-0.683487, 1.023826, 0.1571732, 1, 1, 1, 1, 1,
-0.6775743, -1.361989, -2.507968, 1, 1, 1, 1, 1,
-0.6763614, -1.465315, -3.987101, 1, 1, 1, 1, 1,
-0.6748239, -0.1310133, -2.434826, 1, 1, 1, 1, 1,
-0.6742851, -0.8645551, -1.109057, 1, 1, 1, 1, 1,
-0.6665633, 0.8616403, -0.2741605, 1, 1, 1, 1, 1,
-0.665024, -0.5180274, -0.683606, 1, 1, 1, 1, 1,
-0.6641468, -0.130621, -0.2851625, 1, 1, 1, 1, 1,
-0.646736, 1.143042, 0.1978687, 1, 1, 1, 1, 1,
-0.6233481, 0.6775241, -0.9044214, 1, 1, 1, 1, 1,
-0.6213861, -0.8471102, -1.362265, 1, 1, 1, 1, 1,
-0.62057, 0.3315552, -1.445716, 1, 1, 1, 1, 1,
-0.6140255, 0.003838226, -2.702058, 0, 0, 1, 1, 1,
-0.611214, 0.1641104, -1.312567, 1, 0, 0, 1, 1,
-0.6103293, -1.113089, -1.885798, 1, 0, 0, 1, 1,
-0.6049181, -0.3855561, -1.532495, 1, 0, 0, 1, 1,
-0.6009937, -0.1024613, -1.469254, 1, 0, 0, 1, 1,
-0.5990405, -0.5398614, -1.995985, 1, 0, 0, 1, 1,
-0.5969502, 0.6313756, -1.38476, 0, 0, 0, 1, 1,
-0.5963948, 1.298257, -0.3494969, 0, 0, 0, 1, 1,
-0.5952802, -0.2838598, -0.5874227, 0, 0, 0, 1, 1,
-0.5951816, 0.1402398, -1.771378, 0, 0, 0, 1, 1,
-0.5940607, -1.103535, -1.245526, 0, 0, 0, 1, 1,
-0.5937907, 1.225561, 0.04857329, 0, 0, 0, 1, 1,
-0.5929873, -2.094134, -4.739685, 0, 0, 0, 1, 1,
-0.5928721, 0.1929302, -2.225763, 1, 1, 1, 1, 1,
-0.5895616, -0.3841068, -1.493748, 1, 1, 1, 1, 1,
-0.58319, 1.707652, -0.62119, 1, 1, 1, 1, 1,
-0.5739001, -0.5326353, -3.195604, 1, 1, 1, 1, 1,
-0.5647017, 0.002903031, -0.6603119, 1, 1, 1, 1, 1,
-0.5557219, 0.5828695, -0.9765055, 1, 1, 1, 1, 1,
-0.5535733, -0.4662189, -2.110928, 1, 1, 1, 1, 1,
-0.5509456, 0.9715571, -0.06299987, 1, 1, 1, 1, 1,
-0.5470535, 0.2374598, 0.2724314, 1, 1, 1, 1, 1,
-0.5445536, -0.310035, -1.559908, 1, 1, 1, 1, 1,
-0.5437566, -1.283031, -2.606476, 1, 1, 1, 1, 1,
-0.5385379, 0.4727287, -1.386312, 1, 1, 1, 1, 1,
-0.5329807, -1.297406, -3.089713, 1, 1, 1, 1, 1,
-0.5325177, -1.436692, -2.145908, 1, 1, 1, 1, 1,
-0.5299968, 0.3995101, 0.03743447, 1, 1, 1, 1, 1,
-0.5244588, 2.417755, -0.366277, 0, 0, 1, 1, 1,
-0.5215599, -3.623507, -3.447508, 1, 0, 0, 1, 1,
-0.5211315, -0.4295658, -0.7011867, 1, 0, 0, 1, 1,
-0.51809, 0.9151785, -0.9558101, 1, 0, 0, 1, 1,
-0.5165007, 1.44557, -0.2009154, 1, 0, 0, 1, 1,
-0.5158846, 0.772922, 0.131647, 1, 0, 0, 1, 1,
-0.5113413, 0.3230155, 0.7617203, 0, 0, 0, 1, 1,
-0.5105754, -0.04213848, -1.894248, 0, 0, 0, 1, 1,
-0.5102417, 0.01191927, -1.887746, 0, 0, 0, 1, 1,
-0.5098246, -0.2067974, -2.017766, 0, 0, 0, 1, 1,
-0.506126, 0.9492064, -1.019266, 0, 0, 0, 1, 1,
-0.5043885, -2.122927, -3.38605, 0, 0, 0, 1, 1,
-0.4992649, 0.3188395, -0.7777682, 0, 0, 0, 1, 1,
-0.4863801, 0.8977997, -2.314596, 1, 1, 1, 1, 1,
-0.4844222, 0.01706853, -1.771327, 1, 1, 1, 1, 1,
-0.4833824, 0.5432804, -0.7348264, 1, 1, 1, 1, 1,
-0.4782762, 0.8772709, -1.695528, 1, 1, 1, 1, 1,
-0.4723271, -0.9096985, -2.315868, 1, 1, 1, 1, 1,
-0.4689273, -0.9543366, -3.010637, 1, 1, 1, 1, 1,
-0.4678473, 2.846399, -0.03824118, 1, 1, 1, 1, 1,
-0.4667025, 0.9787939, 0.4885897, 1, 1, 1, 1, 1,
-0.4643495, -0.4193843, -1.517141, 1, 1, 1, 1, 1,
-0.4620735, 0.9077551, -1.112091, 1, 1, 1, 1, 1,
-0.4598886, 0.1389472, -1.298064, 1, 1, 1, 1, 1,
-0.4532948, 0.08616275, -0.6199604, 1, 1, 1, 1, 1,
-0.4375527, 0.3542579, -2.262049, 1, 1, 1, 1, 1,
-0.4334993, 0.7839481, -0.2278111, 1, 1, 1, 1, 1,
-0.4333451, 0.9572333, -0.8237228, 1, 1, 1, 1, 1,
-0.4261768, 0.3441241, -0.8265428, 0, 0, 1, 1, 1,
-0.4245039, 0.1044443, 0.370163, 1, 0, 0, 1, 1,
-0.4226869, -0.04822671, -1.474181, 1, 0, 0, 1, 1,
-0.4190188, -0.05855254, -0.8960817, 1, 0, 0, 1, 1,
-0.4140812, 0.8572119, -0.3376392, 1, 0, 0, 1, 1,
-0.4074874, -1.140007, -2.267715, 1, 0, 0, 1, 1,
-0.392452, -1.221059, -1.727296, 0, 0, 0, 1, 1,
-0.3846694, -0.5947796, -2.47701, 0, 0, 0, 1, 1,
-0.3796789, -0.9862955, -1.644182, 0, 0, 0, 1, 1,
-0.3786617, 0.641322, -0.9080958, 0, 0, 0, 1, 1,
-0.3743553, 1.098255, 0.7313328, 0, 0, 0, 1, 1,
-0.373838, -0.6544527, -2.223515, 0, 0, 0, 1, 1,
-0.3705683, 0.06713457, -1.265189, 0, 0, 0, 1, 1,
-0.3703107, 0.6756076, -1.818768, 1, 1, 1, 1, 1,
-0.3694807, -0.7930363, -2.704842, 1, 1, 1, 1, 1,
-0.3661947, -0.07236177, -0.6284145, 1, 1, 1, 1, 1,
-0.3597623, -0.2668833, -2.557184, 1, 1, 1, 1, 1,
-0.3581371, -0.6417721, -1.903274, 1, 1, 1, 1, 1,
-0.357446, 1.404639, -0.4086097, 1, 1, 1, 1, 1,
-0.3562133, -0.7361026, -3.40007, 1, 1, 1, 1, 1,
-0.356015, -0.1606543, -3.739541, 1, 1, 1, 1, 1,
-0.3559749, -0.468301, -1.869595, 1, 1, 1, 1, 1,
-0.3539028, -1.088916, -2.441535, 1, 1, 1, 1, 1,
-0.3528711, -2.34653, -3.67453, 1, 1, 1, 1, 1,
-0.3515814, 0.4076679, -0.93464, 1, 1, 1, 1, 1,
-0.347344, -0.9472845, -3.469324, 1, 1, 1, 1, 1,
-0.3394406, -3.412401, -4.229963, 1, 1, 1, 1, 1,
-0.3391052, -0.391991, -2.209887, 1, 1, 1, 1, 1,
-0.3381131, 1.087004, 0.6016123, 0, 0, 1, 1, 1,
-0.3358741, 0.6293604, -0.461394, 1, 0, 0, 1, 1,
-0.3328696, 1.314344, -0.06426268, 1, 0, 0, 1, 1,
-0.3312522, -0.9428331, -1.843993, 1, 0, 0, 1, 1,
-0.3289421, -1.096593, -2.550475, 1, 0, 0, 1, 1,
-0.3282261, 0.6926473, -1.896851, 1, 0, 0, 1, 1,
-0.3267362, 0.5705699, -0.3175381, 0, 0, 0, 1, 1,
-0.3254465, -0.5216569, -3.404365, 0, 0, 0, 1, 1,
-0.3238716, -0.1529027, -3.100765, 0, 0, 0, 1, 1,
-0.3214318, -0.4102035, -2.513625, 0, 0, 0, 1, 1,
-0.3202974, 0.4926274, -1.5288, 0, 0, 0, 1, 1,
-0.3158217, 1.320389, -1.037909, 0, 0, 0, 1, 1,
-0.315168, 0.2802917, -1.278126, 0, 0, 0, 1, 1,
-0.3103093, -0.7478096, -1.3652, 1, 1, 1, 1, 1,
-0.3053558, 0.8890976, -0.7246714, 1, 1, 1, 1, 1,
-0.3025088, -1.131587, -1.687023, 1, 1, 1, 1, 1,
-0.30201, 0.1333365, -0.2142149, 1, 1, 1, 1, 1,
-0.3011099, 0.9249772, 0.3265894, 1, 1, 1, 1, 1,
-0.3005342, 0.3016003, -0.2185008, 1, 1, 1, 1, 1,
-0.2996843, 0.005501818, 1.507921, 1, 1, 1, 1, 1,
-0.2978082, -0.9383402, -1.66983, 1, 1, 1, 1, 1,
-0.2962054, 0.9321694, 0.3519687, 1, 1, 1, 1, 1,
-0.2932178, 0.8335555, -0.3587636, 1, 1, 1, 1, 1,
-0.2922099, -0.2329776, -1.431128, 1, 1, 1, 1, 1,
-0.2921927, 0.7069635, -2.052823, 1, 1, 1, 1, 1,
-0.2919585, 1.259596, 0.3893836, 1, 1, 1, 1, 1,
-0.2909465, -0.7512988, -2.038864, 1, 1, 1, 1, 1,
-0.2889502, -0.105007, -1.390026, 1, 1, 1, 1, 1,
-0.2857538, 0.2244918, -1.209002, 0, 0, 1, 1, 1,
-0.2853779, 0.1269559, -2.697461, 1, 0, 0, 1, 1,
-0.2846763, -0.7919978, -2.260496, 1, 0, 0, 1, 1,
-0.2838099, 0.5704092, 0.2675838, 1, 0, 0, 1, 1,
-0.2773146, -0.4779415, -3.017235, 1, 0, 0, 1, 1,
-0.2769653, -0.4302789, -3.393215, 1, 0, 0, 1, 1,
-0.2757579, -0.4827154, -3.231171, 0, 0, 0, 1, 1,
-0.2734364, 0.4695621, 0.1461784, 0, 0, 0, 1, 1,
-0.272429, 0.7582953, 0.9335095, 0, 0, 0, 1, 1,
-0.2720293, 0.705373, -1.270658, 0, 0, 0, 1, 1,
-0.2692907, -0.1702608, -2.322545, 0, 0, 0, 1, 1,
-0.269188, -0.05760558, -2.885987, 0, 0, 0, 1, 1,
-0.2672292, 1.284083, -0.9895648, 0, 0, 0, 1, 1,
-0.2670076, 1.410827, -0.1277959, 1, 1, 1, 1, 1,
-0.2665388, -0.6421545, -2.56053, 1, 1, 1, 1, 1,
-0.25984, -0.6753616, -1.594466, 1, 1, 1, 1, 1,
-0.2521115, 0.7851231, 1.986748, 1, 1, 1, 1, 1,
-0.2493986, 1.626755, 0.4641271, 1, 1, 1, 1, 1,
-0.2474916, -0.5848059, -3.074286, 1, 1, 1, 1, 1,
-0.2399187, -0.7777286, -1.467937, 1, 1, 1, 1, 1,
-0.2395548, -1.408332, -2.607507, 1, 1, 1, 1, 1,
-0.2394318, -0.9911515, -1.720275, 1, 1, 1, 1, 1,
-0.2346665, 1.273243, 1.070369, 1, 1, 1, 1, 1,
-0.2337546, 0.1074765, 0.1460115, 1, 1, 1, 1, 1,
-0.2335011, -0.8158674, -3.240498, 1, 1, 1, 1, 1,
-0.2293032, 1.717794, 1.48725, 1, 1, 1, 1, 1,
-0.2279501, 1.138256, 0.3935525, 1, 1, 1, 1, 1,
-0.2238252, 0.6966555, -0.06442577, 1, 1, 1, 1, 1,
-0.2235284, -0.7958359, -3.743245, 0, 0, 1, 1, 1,
-0.2166119, 0.8110474, -1.200095, 1, 0, 0, 1, 1,
-0.2150449, 0.4671215, -1.376123, 1, 0, 0, 1, 1,
-0.2120092, -1.823482, -2.84185, 1, 0, 0, 1, 1,
-0.2077111, -0.05097626, -3.174685, 1, 0, 0, 1, 1,
-0.2051858, -1.03161, -1.930996, 1, 0, 0, 1, 1,
-0.2046709, 2.423316, 0.9223858, 0, 0, 0, 1, 1,
-0.2031218, 1.416919, -0.1383987, 0, 0, 0, 1, 1,
-0.1980673, -0.1421522, -2.044835, 0, 0, 0, 1, 1,
-0.1977082, 1.805242, -0.8603048, 0, 0, 0, 1, 1,
-0.1953026, 0.1592802, 0.09053878, 0, 0, 0, 1, 1,
-0.1891743, 0.2313359, -0.3371476, 0, 0, 0, 1, 1,
-0.1872647, -2.405944, -1.555302, 0, 0, 0, 1, 1,
-0.1868636, 0.8779063, -0.4302226, 1, 1, 1, 1, 1,
-0.1866812, 0.4596443, -1.605445, 1, 1, 1, 1, 1,
-0.1846819, 0.7364668, -0.7034309, 1, 1, 1, 1, 1,
-0.1779223, 0.01926785, -2.625741, 1, 1, 1, 1, 1,
-0.1761425, -1.916063, -1.11503, 1, 1, 1, 1, 1,
-0.1727113, 0.7834331, -0.7616135, 1, 1, 1, 1, 1,
-0.1713884, 0.07596735, -0.2939231, 1, 1, 1, 1, 1,
-0.1706791, -0.3414304, -1.574065, 1, 1, 1, 1, 1,
-0.1647958, -1.159967, -1.935368, 1, 1, 1, 1, 1,
-0.1647389, 0.8189663, 0.9423757, 1, 1, 1, 1, 1,
-0.1631307, -0.6279885, -2.454733, 1, 1, 1, 1, 1,
-0.1629414, 0.3928809, -0.5240631, 1, 1, 1, 1, 1,
-0.1565473, -0.8728569, -3.850193, 1, 1, 1, 1, 1,
-0.15619, 0.3076366, -2.763196, 1, 1, 1, 1, 1,
-0.1507381, 0.7433208, 0.778949, 1, 1, 1, 1, 1,
-0.1502809, -0.7055518, -4.501912, 0, 0, 1, 1, 1,
-0.1441962, -0.5281613, -2.520957, 1, 0, 0, 1, 1,
-0.1391686, -0.7599626, -4.099391, 1, 0, 0, 1, 1,
-0.1346979, -1.276883, -3.030049, 1, 0, 0, 1, 1,
-0.1335119, 0.5174651, -1.638618, 1, 0, 0, 1, 1,
-0.1294663, -0.16333, -2.643159, 1, 0, 0, 1, 1,
-0.1287748, 0.8170093, -0.993708, 0, 0, 0, 1, 1,
-0.1280986, 0.8926058, 0.459133, 0, 0, 0, 1, 1,
-0.1270275, 0.9057263, -1.551867, 0, 0, 0, 1, 1,
-0.1269183, -1.404514, -2.619776, 0, 0, 0, 1, 1,
-0.1263542, -0.7345468, -3.597888, 0, 0, 0, 1, 1,
-0.1248426, -1.158473, -4.922822, 0, 0, 0, 1, 1,
-0.1230507, 0.5566787, -0.9013348, 0, 0, 0, 1, 1,
-0.1193747, -0.5310515, -2.64398, 1, 1, 1, 1, 1,
-0.1177883, 0.6792648, 0.373154, 1, 1, 1, 1, 1,
-0.112907, 0.3559929, -1.947022, 1, 1, 1, 1, 1,
-0.1123664, 0.9038318, 0.6442531, 1, 1, 1, 1, 1,
-0.1103543, -0.8620618, -2.420819, 1, 1, 1, 1, 1,
-0.1081726, -0.01235093, -3.244463, 1, 1, 1, 1, 1,
-0.1048653, -2.158795, -4.540826, 1, 1, 1, 1, 1,
-0.102191, 0.07595913, -0.7997986, 1, 1, 1, 1, 1,
-0.09725649, 0.7411544, 0.8692802, 1, 1, 1, 1, 1,
-0.09692014, -0.8724651, -1.15608, 1, 1, 1, 1, 1,
-0.09550712, 0.3015166, 0.5250475, 1, 1, 1, 1, 1,
-0.09184799, 0.6596816, -0.5846056, 1, 1, 1, 1, 1,
-0.08902255, 1.589352, 2.21861, 1, 1, 1, 1, 1,
-0.08760697, 0.6408274, -0.800717, 1, 1, 1, 1, 1,
-0.08693049, 0.7558718, -0.286589, 1, 1, 1, 1, 1,
-0.08637283, -0.4235263, -2.661323, 0, 0, 1, 1, 1,
-0.07463368, 1.478809, -1.655259, 1, 0, 0, 1, 1,
-0.07296969, 1.479334, 0.6491104, 1, 0, 0, 1, 1,
-0.07292982, 0.3113582, -0.779171, 1, 0, 0, 1, 1,
-0.07229186, -0.0386, -3.897832, 1, 0, 0, 1, 1,
-0.07156838, -1.977665, -4.5171, 1, 0, 0, 1, 1,
-0.07145584, -0.3692386, -3.460152, 0, 0, 0, 1, 1,
-0.07096816, 1.608705, 0.6374742, 0, 0, 0, 1, 1,
-0.06985573, 0.2865113, 0.2212438, 0, 0, 0, 1, 1,
-0.06982328, -0.1821838, -3.66557, 0, 0, 0, 1, 1,
-0.06655859, 2.477247, 1.062903, 0, 0, 0, 1, 1,
-0.06332307, 0.652002, 0.4481385, 0, 0, 0, 1, 1,
-0.06166984, -0.516971, -4.706402, 0, 0, 0, 1, 1,
-0.06166842, 0.2785575, 0.579644, 1, 1, 1, 1, 1,
-0.05853578, -0.8206692, -3.470457, 1, 1, 1, 1, 1,
-0.04166785, -0.9630244, -3.019177, 1, 1, 1, 1, 1,
-0.03925815, 0.4519517, -0.3995303, 1, 1, 1, 1, 1,
-0.03745962, 0.5789686, -0.7842578, 1, 1, 1, 1, 1,
-0.03268258, 0.3832044, 0.946613, 1, 1, 1, 1, 1,
-0.03004737, 0.6582575, -1.925397, 1, 1, 1, 1, 1,
-0.02585703, -0.4571925, -1.83168, 1, 1, 1, 1, 1,
-0.0230918, -0.510605, -3.279403, 1, 1, 1, 1, 1,
-0.007368233, -1.174103, -4.346163, 1, 1, 1, 1, 1,
-0.006356359, -0.08776072, -2.409076, 1, 1, 1, 1, 1,
-0.006049915, 1.375861, 0.3826977, 1, 1, 1, 1, 1,
-0.003394202, -0.7335725, -4.316214, 1, 1, 1, 1, 1,
0.0009906298, 3.210688, -0.05056759, 1, 1, 1, 1, 1,
0.002372586, -0.2327514, 2.291242, 1, 1, 1, 1, 1,
0.004549999, -1.218264, 4.463947, 0, 0, 1, 1, 1,
0.004557571, -1.894871, 4.866666, 1, 0, 0, 1, 1,
0.005205476, -1.100899, 3.294166, 1, 0, 0, 1, 1,
0.008694609, -0.2455941, 1.470335, 1, 0, 0, 1, 1,
0.009741721, 0.9315127, 1.681834, 1, 0, 0, 1, 1,
0.01480712, -0.8142935, 4.136791, 1, 0, 0, 1, 1,
0.01751296, -0.8484648, 3.80227, 0, 0, 0, 1, 1,
0.01826096, 0.6285304, 0.01688653, 0, 0, 0, 1, 1,
0.01880636, 0.0848032, -0.2606828, 0, 0, 0, 1, 1,
0.02471986, 1.39573, 0.8131962, 0, 0, 0, 1, 1,
0.02742308, -0.6594082, 1.83986, 0, 0, 0, 1, 1,
0.03174433, 1.002664, 0.2299701, 0, 0, 0, 1, 1,
0.03300585, 0.03868875, -0.4792955, 0, 0, 0, 1, 1,
0.0378035, -0.37604, 2.583975, 1, 1, 1, 1, 1,
0.03864469, 0.02548773, 2.080904, 1, 1, 1, 1, 1,
0.04598168, 0.3549262, -0.5867935, 1, 1, 1, 1, 1,
0.04627743, 0.2368214, -0.2129003, 1, 1, 1, 1, 1,
0.04835606, 0.5398983, -0.4927032, 1, 1, 1, 1, 1,
0.0513945, -0.1644207, 1.31653, 1, 1, 1, 1, 1,
0.05475666, -1.989467, 3.208966, 1, 1, 1, 1, 1,
0.05860291, 0.1903718, -0.6662258, 1, 1, 1, 1, 1,
0.0624882, 1.154324, -0.178274, 1, 1, 1, 1, 1,
0.0680348, -0.7927914, 3.001723, 1, 1, 1, 1, 1,
0.07419631, -0.561419, 2.153943, 1, 1, 1, 1, 1,
0.07814996, -0.6284331, 1.515322, 1, 1, 1, 1, 1,
0.07956187, -0.8809392, 3.949811, 1, 1, 1, 1, 1,
0.08300353, -0.7684284, 1.902192, 1, 1, 1, 1, 1,
0.08776603, 1.183783, -0.008630943, 1, 1, 1, 1, 1,
0.08791989, -1.126718, 2.595167, 0, 0, 1, 1, 1,
0.08899009, 0.6944407, 0.003763943, 1, 0, 0, 1, 1,
0.09191505, -0.6885563, 3.300912, 1, 0, 0, 1, 1,
0.09797123, 0.1882019, 0.2130949, 1, 0, 0, 1, 1,
0.1027394, 0.7780797, 2.873327, 1, 0, 0, 1, 1,
0.1050765, 1.834143, 0.03837325, 1, 0, 0, 1, 1,
0.1052322, -1.488261, 2.849953, 0, 0, 0, 1, 1,
0.1085196, -1.738416, 4.466191, 0, 0, 0, 1, 1,
0.1106076, -0.5400788, 4.880123, 0, 0, 0, 1, 1,
0.1132192, -0.9429749, 3.262747, 0, 0, 0, 1, 1,
0.1151211, 0.1622376, 0.4695459, 0, 0, 0, 1, 1,
0.1185217, -0.5301242, 3.590447, 0, 0, 0, 1, 1,
0.1186471, 1.395265, 1.202243, 0, 0, 0, 1, 1,
0.1243671, -0.09366945, 2.549223, 1, 1, 1, 1, 1,
0.1288073, 1.136972, 1.638817, 1, 1, 1, 1, 1,
0.1290874, -1.104961, 2.919872, 1, 1, 1, 1, 1,
0.1338077, -0.7313668, 3.984964, 1, 1, 1, 1, 1,
0.1352529, 0.6397351, 2.607169, 1, 1, 1, 1, 1,
0.1354297, 0.5201362, -0.1947246, 1, 1, 1, 1, 1,
0.1407741, -0.565582, 2.744565, 1, 1, 1, 1, 1,
0.140981, -0.9387575, 4.768919, 1, 1, 1, 1, 1,
0.1422297, 0.09900086, 0.3397045, 1, 1, 1, 1, 1,
0.1443609, -1.272034, 3.319398, 1, 1, 1, 1, 1,
0.1449629, -0.8971475, 3.64753, 1, 1, 1, 1, 1,
0.1481319, -0.06712305, 1.445035, 1, 1, 1, 1, 1,
0.1484756, 0.02230444, -0.1342857, 1, 1, 1, 1, 1,
0.159905, 0.6097273, -0.1778884, 1, 1, 1, 1, 1,
0.1620254, 0.1101164, 1.356079, 1, 1, 1, 1, 1,
0.1664722, 0.3731821, 1.223044, 0, 0, 1, 1, 1,
0.1665191, -0.4263231, 2.488571, 1, 0, 0, 1, 1,
0.1667703, 0.3578697, 1.465358, 1, 0, 0, 1, 1,
0.1796337, -1.067752, 3.832583, 1, 0, 0, 1, 1,
0.1799562, 0.1164391, 1.138641, 1, 0, 0, 1, 1,
0.1899838, 0.08916333, 2.091782, 1, 0, 0, 1, 1,
0.1924586, 0.2362381, 1.382218, 0, 0, 0, 1, 1,
0.1987293, -1.606567, 2.561707, 0, 0, 0, 1, 1,
0.2057922, -0.3582461, 2.009418, 0, 0, 0, 1, 1,
0.2080869, 0.1327069, 3.081184, 0, 0, 0, 1, 1,
0.2183216, 1.505649, -2.200645, 0, 0, 0, 1, 1,
0.2184278, -1.142925, 3.435912, 0, 0, 0, 1, 1,
0.2189112, 0.4808448, 1.929394, 0, 0, 0, 1, 1,
0.2194357, -1.218857, 2.36731, 1, 1, 1, 1, 1,
0.2222238, 1.546135, -1.017679, 1, 1, 1, 1, 1,
0.2230617, 0.4214831, 0.611133, 1, 1, 1, 1, 1,
0.2289395, 0.8572567, -0.8513542, 1, 1, 1, 1, 1,
0.2320871, 0.6195174, 1.302488, 1, 1, 1, 1, 1,
0.2336963, -1.567095, 4.044861, 1, 1, 1, 1, 1,
0.2381245, 2.426879, -0.6451028, 1, 1, 1, 1, 1,
0.2399339, -0.5940058, 2.16019, 1, 1, 1, 1, 1,
0.2403447, 0.2992683, 0.4910632, 1, 1, 1, 1, 1,
0.2426066, 0.0571886, 0.4868708, 1, 1, 1, 1, 1,
0.2427206, 2.401297, 0.04238978, 1, 1, 1, 1, 1,
0.2478376, -1.53264, 2.887486, 1, 1, 1, 1, 1,
0.2486804, -0.5930231, 1.598835, 1, 1, 1, 1, 1,
0.2509648, 1.120862, 0.001102696, 1, 1, 1, 1, 1,
0.2522491, 0.5173531, 1.234947, 1, 1, 1, 1, 1,
0.2569787, 1.137351, 0.2238439, 0, 0, 1, 1, 1,
0.2582349, -0.5290419, 1.151173, 1, 0, 0, 1, 1,
0.2605842, 1.100313, 0.3480019, 1, 0, 0, 1, 1,
0.2610608, 0.4194403, 1.792464, 1, 0, 0, 1, 1,
0.263328, 1.592825, 0.4859671, 1, 0, 0, 1, 1,
0.2647911, 1.427802, -0.5719559, 1, 0, 0, 1, 1,
0.2666343, 0.6963325, 0.7863533, 0, 0, 0, 1, 1,
0.2742343, 0.5430713, 1.369487, 0, 0, 0, 1, 1,
0.2761344, -1.35909, 3.382674, 0, 0, 0, 1, 1,
0.2790616, -0.6672218, 2.729075, 0, 0, 0, 1, 1,
0.2797631, 0.5455337, 1.332872, 0, 0, 0, 1, 1,
0.2799018, 1.586784, 0.3664205, 0, 0, 0, 1, 1,
0.2802814, -1.925723, 2.045893, 0, 0, 0, 1, 1,
0.2854473, 0.7082813, -0.8307157, 1, 1, 1, 1, 1,
0.2912689, -0.5694501, 3.722003, 1, 1, 1, 1, 1,
0.305744, 0.6139532, 1.677146, 1, 1, 1, 1, 1,
0.3124821, 1.401458, -0.19242, 1, 1, 1, 1, 1,
0.3188894, 0.03015795, 3.006617, 1, 1, 1, 1, 1,
0.3203484, -0.1450259, 1.502932, 1, 1, 1, 1, 1,
0.3242953, 0.4990378, 0.1767583, 1, 1, 1, 1, 1,
0.3260348, -0.1339593, 1.321213, 1, 1, 1, 1, 1,
0.3269101, -0.6706083, 3.721787, 1, 1, 1, 1, 1,
0.3298459, 0.02746226, 1.47434, 1, 1, 1, 1, 1,
0.3408236, 0.1323039, 1.394353, 1, 1, 1, 1, 1,
0.3422496, 0.7282771, 0.1755218, 1, 1, 1, 1, 1,
0.3423815, -0.6643983, 1.052708, 1, 1, 1, 1, 1,
0.3499181, -0.2667913, 1.933339, 1, 1, 1, 1, 1,
0.3553219, -0.3781665, 0.9867045, 1, 1, 1, 1, 1,
0.3586644, -0.4768888, 1.552393, 0, 0, 1, 1, 1,
0.3610166, 2.307907, -0.1185929, 1, 0, 0, 1, 1,
0.3638394, 1.71167, 0.05004127, 1, 0, 0, 1, 1,
0.3647515, -0.3082863, 1.91833, 1, 0, 0, 1, 1,
0.3649306, 0.285693, 0.363444, 1, 0, 0, 1, 1,
0.3676918, -1.762809, 3.812318, 1, 0, 0, 1, 1,
0.3678017, 1.342842, 1.265814, 0, 0, 0, 1, 1,
0.3692954, 0.1315883, 1.532218, 0, 0, 0, 1, 1,
0.3709344, 0.1362056, 1.527893, 0, 0, 0, 1, 1,
0.372358, 0.1542767, 4.062786, 0, 0, 0, 1, 1,
0.3765351, -0.4692812, 2.478391, 0, 0, 0, 1, 1,
0.3776026, 0.4091238, -0.5916059, 0, 0, 0, 1, 1,
0.380271, -1.741198, 2.762824, 0, 0, 0, 1, 1,
0.3807886, -0.1844572, 2.199924, 1, 1, 1, 1, 1,
0.3815876, 0.136382, 1.278485, 1, 1, 1, 1, 1,
0.3867744, -2.394276, 2.111946, 1, 1, 1, 1, 1,
0.3894704, 2.622272, 1.945218, 1, 1, 1, 1, 1,
0.3930271, 0.3712799, 1.164416, 1, 1, 1, 1, 1,
0.3979277, -0.8783523, 2.575325, 1, 1, 1, 1, 1,
0.4004912, 1.356891, -0.05824452, 1, 1, 1, 1, 1,
0.4076845, 0.06769118, 1.994405, 1, 1, 1, 1, 1,
0.4077074, -0.3346045, 1.948126, 1, 1, 1, 1, 1,
0.4095229, 0.9522257, -0.5214397, 1, 1, 1, 1, 1,
0.4137918, 1.318199, 0.5072729, 1, 1, 1, 1, 1,
0.4151689, -0.4588542, 1.678421, 1, 1, 1, 1, 1,
0.4156267, 1.677187, -0.1709931, 1, 1, 1, 1, 1,
0.41754, -0.7541015, 3.757885, 1, 1, 1, 1, 1,
0.4194086, -0.2208394, 2.757322, 1, 1, 1, 1, 1,
0.4216921, -1.010573, 3.422206, 0, 0, 1, 1, 1,
0.4244615, -0.4011804, 1.852894, 1, 0, 0, 1, 1,
0.4246221, 0.72728, 1.258988, 1, 0, 0, 1, 1,
0.4265674, -0.4448737, 2.016252, 1, 0, 0, 1, 1,
0.427196, -0.7869803, 2.975883, 1, 0, 0, 1, 1,
0.4293479, 0.7942297, 2.002274, 1, 0, 0, 1, 1,
0.432136, 0.8965936, 1.016842, 0, 0, 0, 1, 1,
0.433951, 0.2031598, 0.600234, 0, 0, 0, 1, 1,
0.4418454, 0.4645611, -0.4339881, 0, 0, 0, 1, 1,
0.4429887, -1.160769, 3.522108, 0, 0, 0, 1, 1,
0.4432033, 0.8558828, 0.4924542, 0, 0, 0, 1, 1,
0.4482157, 0.6735444, 1.287066, 0, 0, 0, 1, 1,
0.4485753, -0.9431082, 2.423671, 0, 0, 0, 1, 1,
0.4535123, -0.9382714, 3.261619, 1, 1, 1, 1, 1,
0.4604629, -0.0283092, 0.9333491, 1, 1, 1, 1, 1,
0.4693906, 0.688963, 1.24017, 1, 1, 1, 1, 1,
0.4693941, 0.3120793, 1.949065, 1, 1, 1, 1, 1,
0.4708708, -0.4407327, 3.729881, 1, 1, 1, 1, 1,
0.4711145, 0.9090592, 0.3546474, 1, 1, 1, 1, 1,
0.4730698, 1.313434, 1.579005, 1, 1, 1, 1, 1,
0.4745029, 0.3638254, 1.314927, 1, 1, 1, 1, 1,
0.474521, 1.209002, 0.1906222, 1, 1, 1, 1, 1,
0.4777296, 0.5737368, 1.683104, 1, 1, 1, 1, 1,
0.478419, -0.8312605, 2.60079, 1, 1, 1, 1, 1,
0.4829959, 0.2569599, -0.1349889, 1, 1, 1, 1, 1,
0.4851818, -0.7835131, 1.655016, 1, 1, 1, 1, 1,
0.4889344, -1.429171, 4.17743, 1, 1, 1, 1, 1,
0.4899615, 0.01152673, 1.220376, 1, 1, 1, 1, 1,
0.4912283, 2.208516, 0.2042672, 0, 0, 1, 1, 1,
0.4946961, 0.8664595, 0.7381006, 1, 0, 0, 1, 1,
0.4959622, -0.637714, 2.349744, 1, 0, 0, 1, 1,
0.4978767, 1.080128, -1.18424, 1, 0, 0, 1, 1,
0.4992076, -0.7539991, 2.761124, 1, 0, 0, 1, 1,
0.5037251, -0.470663, 2.854635, 1, 0, 0, 1, 1,
0.5056058, 1.317618, -1.723103, 0, 0, 0, 1, 1,
0.5060447, -0.790676, 2.920146, 0, 0, 0, 1, 1,
0.5108688, 1.036681, 0.72482, 0, 0, 0, 1, 1,
0.5150164, -0.3542567, 1.429546, 0, 0, 0, 1, 1,
0.519267, -0.5834376, 2.287845, 0, 0, 0, 1, 1,
0.5198685, -0.1189567, -0.9200424, 0, 0, 0, 1, 1,
0.5287728, 0.4891884, -0.8335227, 0, 0, 0, 1, 1,
0.5300419, -0.6118787, 2.680083, 1, 1, 1, 1, 1,
0.5358742, -1.201773, 2.691257, 1, 1, 1, 1, 1,
0.5367724, -0.1525843, 0.3648649, 1, 1, 1, 1, 1,
0.5378384, 1.182235, -0.4969143, 1, 1, 1, 1, 1,
0.5521563, -0.3873509, -0.8773892, 1, 1, 1, 1, 1,
0.5557895, 0.004783332, 1.576478, 1, 1, 1, 1, 1,
0.5577725, 1.96977, 1.027138, 1, 1, 1, 1, 1,
0.558713, 0.1731527, 3.276635, 1, 1, 1, 1, 1,
0.5657804, -1.27622, 2.140114, 1, 1, 1, 1, 1,
0.5685789, -0.08272339, 0.9582037, 1, 1, 1, 1, 1,
0.5709155, 0.5803443, 1.599182, 1, 1, 1, 1, 1,
0.5736212, -0.09287407, 3.368326, 1, 1, 1, 1, 1,
0.5787926, -0.7139421, 2.109347, 1, 1, 1, 1, 1,
0.5813645, -0.4718015, 1.271657, 1, 1, 1, 1, 1,
0.5831292, 1.304564, 0.6398782, 1, 1, 1, 1, 1,
0.5833766, 0.6449767, -1.777361, 0, 0, 1, 1, 1,
0.5848272, -1.877959, 3.374887, 1, 0, 0, 1, 1,
0.5862625, -0.7451528, 1.131761, 1, 0, 0, 1, 1,
0.5893524, 0.707004, 0.9221945, 1, 0, 0, 1, 1,
0.5937827, 0.4823847, 0.4787322, 1, 0, 0, 1, 1,
0.598199, -0.08387823, 1.557291, 1, 0, 0, 1, 1,
0.5988583, 1.183054, -0.6650103, 0, 0, 0, 1, 1,
0.5993909, 0.3521395, 1.335718, 0, 0, 0, 1, 1,
0.6009177, -0.2640029, 1.490065, 0, 0, 0, 1, 1,
0.6092705, -0.4123471, -0.02416012, 0, 0, 0, 1, 1,
0.6097498, 0.3422383, 0.8442804, 0, 0, 0, 1, 1,
0.6120843, -1.215572, 2.135421, 0, 0, 0, 1, 1,
0.6159864, 0.8431497, 0.5862364, 0, 0, 0, 1, 1,
0.624561, 0.8130987, 2.012851, 1, 1, 1, 1, 1,
0.6249263, -0.1334432, 1.972683, 1, 1, 1, 1, 1,
0.6251562, -0.7500097, 2.478397, 1, 1, 1, 1, 1,
0.628103, 0.4317643, 1.350092, 1, 1, 1, 1, 1,
0.6355423, -0.2875849, 0.2731303, 1, 1, 1, 1, 1,
0.6357675, 0.5400682, -0.05537566, 1, 1, 1, 1, 1,
0.6391016, -0.2601092, 1.64206, 1, 1, 1, 1, 1,
0.6428624, -0.09559701, 2.026143, 1, 1, 1, 1, 1,
0.6485802, 1.881227, 1.259568, 1, 1, 1, 1, 1,
0.6488765, -1.444909, 1.088594, 1, 1, 1, 1, 1,
0.6490111, -0.7251627, 1.380382, 1, 1, 1, 1, 1,
0.6623352, -0.1474964, 2.637521, 1, 1, 1, 1, 1,
0.6627808, -0.4087089, 2.032836, 1, 1, 1, 1, 1,
0.6652142, -0.7022337, 3.601265, 1, 1, 1, 1, 1,
0.6661061, 1.256337, -1.185437, 1, 1, 1, 1, 1,
0.6711656, -2.401391, 3.608767, 0, 0, 1, 1, 1,
0.671542, -0.2799591, 1.672283, 1, 0, 0, 1, 1,
0.6733838, -1.728957, 1.505408, 1, 0, 0, 1, 1,
0.6816688, -0.6165504, 1.03172, 1, 0, 0, 1, 1,
0.6823159, 1.336024, 1.234305, 1, 0, 0, 1, 1,
0.6863617, -0.141295, 2.584259, 1, 0, 0, 1, 1,
0.6863681, 1.123196, 0.737027, 0, 0, 0, 1, 1,
0.6882026, -0.1173649, 3.328692, 0, 0, 0, 1, 1,
0.6913099, -0.05355727, 1.655628, 0, 0, 0, 1, 1,
0.6989427, -1.496316, 1.033108, 0, 0, 0, 1, 1,
0.7142814, -0.5994188, 1.438577, 0, 0, 0, 1, 1,
0.7157032, -0.3823669, 1.620172, 0, 0, 0, 1, 1,
0.7163469, -0.6348868, 1.886926, 0, 0, 0, 1, 1,
0.720644, -0.3468029, 1.325282, 1, 1, 1, 1, 1,
0.7215504, 0.6882656, 0.2894197, 1, 1, 1, 1, 1,
0.7313404, 0.3903179, 0.3089154, 1, 1, 1, 1, 1,
0.7348193, -1.711022, 3.281905, 1, 1, 1, 1, 1,
0.7369264, -0.9409714, 2.238905, 1, 1, 1, 1, 1,
0.7377825, 1.846187, -0.02988135, 1, 1, 1, 1, 1,
0.7402784, 0.3666183, 1.372664, 1, 1, 1, 1, 1,
0.7404492, 0.3594115, 0.3986216, 1, 1, 1, 1, 1,
0.7437159, -0.09852757, 1.39405, 1, 1, 1, 1, 1,
0.7468677, 0.6806809, -0.9556109, 1, 1, 1, 1, 1,
0.7480922, 0.6624063, 0.5137087, 1, 1, 1, 1, 1,
0.7547841, 0.8864024, -0.2842893, 1, 1, 1, 1, 1,
0.7551977, 1.579734, 0.3156258, 1, 1, 1, 1, 1,
0.7591857, -1.028394, 1.691781, 1, 1, 1, 1, 1,
0.7614924, 1.303604, 0.9036751, 1, 1, 1, 1, 1,
0.7635862, -0.6971428, 1.200629, 0, 0, 1, 1, 1,
0.7649414, -1.395393, 3.425118, 1, 0, 0, 1, 1,
0.7666551, -1.010635, 0.2480362, 1, 0, 0, 1, 1,
0.7667909, -0.6134513, 2.144174, 1, 0, 0, 1, 1,
0.7700016, -0.8064723, 3.088832, 1, 0, 0, 1, 1,
0.7713667, -1.774383, 2.926424, 1, 0, 0, 1, 1,
0.7717789, -0.7041458, 2.916479, 0, 0, 0, 1, 1,
0.772801, -2.279323, 5.33266, 0, 0, 0, 1, 1,
0.7775984, 1.002, -0.05901838, 0, 0, 0, 1, 1,
0.7789993, -0.5010563, 2.313914, 0, 0, 0, 1, 1,
0.7799697, -2.255426, 2.314761, 0, 0, 0, 1, 1,
0.7803014, 0.03723621, 1.198537, 0, 0, 0, 1, 1,
0.7827588, -0.6579837, 2.549041, 0, 0, 0, 1, 1,
0.786069, 0.4076214, -0.1371513, 1, 1, 1, 1, 1,
0.7913087, -0.6310539, 2.942291, 1, 1, 1, 1, 1,
0.8029258, 1.962932, 0.8875296, 1, 1, 1, 1, 1,
0.8075208, -1.785523, 2.237298, 1, 1, 1, 1, 1,
0.8081276, 1.21469, -0.4323604, 1, 1, 1, 1, 1,
0.8108544, -0.02247734, 0.5070398, 1, 1, 1, 1, 1,
0.8112034, -1.473637, 1.912314, 1, 1, 1, 1, 1,
0.8141567, -0.1121365, 0.1544921, 1, 1, 1, 1, 1,
0.8181927, 0.4046136, 1.93004, 1, 1, 1, 1, 1,
0.8183435, 0.7178259, 0.3605655, 1, 1, 1, 1, 1,
0.819622, -0.7105097, 0.3169317, 1, 1, 1, 1, 1,
0.8197245, -0.5831771, 1.535533, 1, 1, 1, 1, 1,
0.8229555, -0.2413451, 1.975956, 1, 1, 1, 1, 1,
0.8245179, -1.917143, 3.654038, 1, 1, 1, 1, 1,
0.8250278, 0.6179823, 1.597377, 1, 1, 1, 1, 1,
0.8296729, 0.6522589, 1.813141, 0, 0, 1, 1, 1,
0.8301444, 0.09343532, 1.899763, 1, 0, 0, 1, 1,
0.8301965, -1.755895, 2.623288, 1, 0, 0, 1, 1,
0.8392269, 0.07100666, 0.181464, 1, 0, 0, 1, 1,
0.8417394, 0.2409775, 1.586193, 1, 0, 0, 1, 1,
0.8490669, 0.5103568, 1.547238, 1, 0, 0, 1, 1,
0.8577504, 0.6332959, -0.3250877, 0, 0, 0, 1, 1,
0.8609108, -0.3393484, 1.042733, 0, 0, 0, 1, 1,
0.8622622, -0.1857342, 1.679266, 0, 0, 0, 1, 1,
0.8626211, -0.8506826, 2.773608, 0, 0, 0, 1, 1,
0.8653947, 0.3552172, 3.714946, 0, 0, 0, 1, 1,
0.8696071, 1.914997, 2.208556, 0, 0, 0, 1, 1,
0.8731164, -0.8220406, 2.582092, 0, 0, 0, 1, 1,
0.878971, -1.65906, 1.827422, 1, 1, 1, 1, 1,
0.8817483, -0.9996305, 1.034838, 1, 1, 1, 1, 1,
0.8824809, 0.6835945, 1.369832, 1, 1, 1, 1, 1,
0.8851457, 1.955036, 2.491749, 1, 1, 1, 1, 1,
0.8861137, -1.104286, 1.748915, 1, 1, 1, 1, 1,
0.8877171, 2.770084, 0.5425082, 1, 1, 1, 1, 1,
0.8887704, -0.303596, 2.910849, 1, 1, 1, 1, 1,
0.8910169, 1.706975, -0.8038641, 1, 1, 1, 1, 1,
0.8926477, -2.102794, 2.204895, 1, 1, 1, 1, 1,
0.8977536, 1.460356, 0.854708, 1, 1, 1, 1, 1,
0.907185, 0.2879398, 1.465517, 1, 1, 1, 1, 1,
0.9106038, 1.017105, 1.566775, 1, 1, 1, 1, 1,
0.9121925, 1.267355, -1.636959, 1, 1, 1, 1, 1,
0.938993, 1.667124, 0.8729878, 1, 1, 1, 1, 1,
0.9447278, 0.2020534, 0.4767283, 1, 1, 1, 1, 1,
0.952136, -1.179406, 3.479251, 0, 0, 1, 1, 1,
0.9545743, -0.6503345, 1.935412, 1, 0, 0, 1, 1,
0.9564736, -1.065966, 0.766719, 1, 0, 0, 1, 1,
0.9576441, -1.125747, 2.804732, 1, 0, 0, 1, 1,
0.9597443, 0.5578781, 1.676426, 1, 0, 0, 1, 1,
0.9697112, 0.3728997, 1.64662, 1, 0, 0, 1, 1,
0.9838621, 0.8647604, 0.6502415, 0, 0, 0, 1, 1,
0.9851334, 0.7973224, 0.8540683, 0, 0, 0, 1, 1,
0.9852117, 0.03940159, 1.924137, 0, 0, 0, 1, 1,
0.9913142, 2.039163, -0.2224318, 0, 0, 0, 1, 1,
0.9924128, -0.109964, 2.232895, 0, 0, 0, 1, 1,
0.9957125, -0.1468867, 0.6843456, 0, 0, 0, 1, 1,
0.9990163, -0.9463834, 3.241684, 0, 0, 0, 1, 1,
1.000731, 0.1811213, 0.5723488, 1, 1, 1, 1, 1,
1.003683, -0.9952177, 1.861609, 1, 1, 1, 1, 1,
1.0123, 0.1632593, 0.9808965, 1, 1, 1, 1, 1,
1.022572, 0.8075268, 2.172427, 1, 1, 1, 1, 1,
1.024355, 1.419152, 0.5277988, 1, 1, 1, 1, 1,
1.024938, -1.423204, 3.358361, 1, 1, 1, 1, 1,
1.025295, 0.7328112, 1.798876, 1, 1, 1, 1, 1,
1.026145, -0.0743279, 0.6868879, 1, 1, 1, 1, 1,
1.026362, -0.6662605, 1.529996, 1, 1, 1, 1, 1,
1.029357, 0.3825944, 0.9049333, 1, 1, 1, 1, 1,
1.035857, -0.3842146, 2.10286, 1, 1, 1, 1, 1,
1.039167, 2.313506, 0.6099394, 1, 1, 1, 1, 1,
1.039613, 1.102354, 2.400455, 1, 1, 1, 1, 1,
1.041815, -0.3271143, 0.4148435, 1, 1, 1, 1, 1,
1.046589, 2.716818, 0.2154531, 1, 1, 1, 1, 1,
1.05281, -1.178922, 1.660523, 0, 0, 1, 1, 1,
1.055793, 0.4491621, 1.21113, 1, 0, 0, 1, 1,
1.058312, 3.000362, 0.3957572, 1, 0, 0, 1, 1,
1.059963, -1.592019, 2.422457, 1, 0, 0, 1, 1,
1.060236, -0.2908183, 3.457252, 1, 0, 0, 1, 1,
1.060456, -1.705394, 2.177476, 1, 0, 0, 1, 1,
1.063392, -1.363452, 3.878075, 0, 0, 0, 1, 1,
1.066895, 2.422442, -0.3848048, 0, 0, 0, 1, 1,
1.071103, -0.2670939, 0.9531006, 0, 0, 0, 1, 1,
1.079056, -1.681077, 2.27024, 0, 0, 0, 1, 1,
1.083327, -0.997564, 2.582845, 0, 0, 0, 1, 1,
1.086606, 1.089067, -0.4679612, 0, 0, 0, 1, 1,
1.086921, 0.3874572, 0.4674682, 0, 0, 0, 1, 1,
1.087385, 0.5686136, 0.5822967, 1, 1, 1, 1, 1,
1.093, 1.343273, -1.482322, 1, 1, 1, 1, 1,
1.095422, -0.1407423, 2.833119, 1, 1, 1, 1, 1,
1.098067, -0.1545907, 1.159868, 1, 1, 1, 1, 1,
1.102227, 0.7064945, 1.624463, 1, 1, 1, 1, 1,
1.109947, -0.9354243, 2.176594, 1, 1, 1, 1, 1,
1.109954, -0.7420613, 2.996397, 1, 1, 1, 1, 1,
1.116859, 0.4993976, 1.879524, 1, 1, 1, 1, 1,
1.117203, -1.993822, 1.223896, 1, 1, 1, 1, 1,
1.120338, -0.6096671, 0.6920882, 1, 1, 1, 1, 1,
1.127209, -0.8624469, 1.244813, 1, 1, 1, 1, 1,
1.129061, 0.6277282, 3.10018, 1, 1, 1, 1, 1,
1.132373, 1.477727, -1.076119, 1, 1, 1, 1, 1,
1.140391, 0.9819781, 0.924256, 1, 1, 1, 1, 1,
1.144611, -0.03818747, 1.907463, 1, 1, 1, 1, 1,
1.158122, 0.8017498, 1.456986, 0, 0, 1, 1, 1,
1.161368, -1.486826, 2.360896, 1, 0, 0, 1, 1,
1.163539, 1.693055, 1.73397, 1, 0, 0, 1, 1,
1.172658, 0.438328, 2.275167, 1, 0, 0, 1, 1,
1.175687, -0.9163099, 3.112783, 1, 0, 0, 1, 1,
1.182462, -0.5197212, 2.528954, 1, 0, 0, 1, 1,
1.18847, -1.897272, 3.233904, 0, 0, 0, 1, 1,
1.18944, -0.1383834, 2.694111, 0, 0, 0, 1, 1,
1.193217, -0.06723623, 2.048574, 0, 0, 0, 1, 1,
1.203753, 1.708997, -0.4262396, 0, 0, 0, 1, 1,
1.209569, 0.8921438, 0.2934913, 0, 0, 0, 1, 1,
1.217225, -0.01346688, 0.4144299, 0, 0, 0, 1, 1,
1.218107, 1.323054, 0.707828, 0, 0, 0, 1, 1,
1.223213, 0.6372355, 1.249456, 1, 1, 1, 1, 1,
1.223901, 0.007143931, 2.485961, 1, 1, 1, 1, 1,
1.224175, 0.7430791, 1.783968, 1, 1, 1, 1, 1,
1.225024, -0.1213373, 1.675151, 1, 1, 1, 1, 1,
1.228097, 0.1026552, -0.3776499, 1, 1, 1, 1, 1,
1.229854, -2.276016, 2.964882, 1, 1, 1, 1, 1,
1.230732, -0.04878471, 2.372578, 1, 1, 1, 1, 1,
1.236586, -1.543156, 2.805212, 1, 1, 1, 1, 1,
1.243329, -0.3827811, 3.223824, 1, 1, 1, 1, 1,
1.243535, -0.07449345, 2.671978, 1, 1, 1, 1, 1,
1.252927, 0.6690301, 3.23917, 1, 1, 1, 1, 1,
1.258769, 0.7516563, -0.7998894, 1, 1, 1, 1, 1,
1.258808, -1.157721, 1.463086, 1, 1, 1, 1, 1,
1.277466, -1.476234, 2.9399, 1, 1, 1, 1, 1,
1.279907, 0.8003798, 0.7461859, 1, 1, 1, 1, 1,
1.28135, -1.166738, 2.366604, 0, 0, 1, 1, 1,
1.299088, -0.2157423, 1.39112, 1, 0, 0, 1, 1,
1.302211, -0.2957332, 1.688114, 1, 0, 0, 1, 1,
1.314749, -0.01448995, 0.8782057, 1, 0, 0, 1, 1,
1.316064, -1.321428, 2.175911, 1, 0, 0, 1, 1,
1.316819, 1.998383, 1.02605, 1, 0, 0, 1, 1,
1.319324, 0.2208948, 2.301944, 0, 0, 0, 1, 1,
1.331519, 0.9419932, 0.7211131, 0, 0, 0, 1, 1,
1.34239, 0.1151881, 0.08983504, 0, 0, 0, 1, 1,
1.343987, -0.4471732, 1.114817, 0, 0, 0, 1, 1,
1.35268, 0.9826171, 2.772892, 0, 0, 0, 1, 1,
1.353342, 0.1981463, 2.169848, 0, 0, 0, 1, 1,
1.35569, 0.8460149, -0.5928831, 0, 0, 0, 1, 1,
1.357743, 0.01296036, 1.006935, 1, 1, 1, 1, 1,
1.363501, 0.7627323, 0.2414443, 1, 1, 1, 1, 1,
1.367027, -0.119453, 2.506736, 1, 1, 1, 1, 1,
1.376306, 0.100653, 1.331008, 1, 1, 1, 1, 1,
1.383584, 0.7191408, 1.561342, 1, 1, 1, 1, 1,
1.409187, -0.3654678, 2.49469, 1, 1, 1, 1, 1,
1.410546, -0.6484219, 2.522319, 1, 1, 1, 1, 1,
1.411428, 0.8641223, 1.559804, 1, 1, 1, 1, 1,
1.415295, 0.5095502, 1.033016, 1, 1, 1, 1, 1,
1.416015, 1.09628, 0.369987, 1, 1, 1, 1, 1,
1.431054, 0.08497192, 1.457144, 1, 1, 1, 1, 1,
1.435506, 0.6810343, 0.8559139, 1, 1, 1, 1, 1,
1.437796, -0.6075448, 2.809977, 1, 1, 1, 1, 1,
1.438448, -1.410681, 2.792101, 1, 1, 1, 1, 1,
1.439068, -0.4512862, 2.942936, 1, 1, 1, 1, 1,
1.44393, 0.7236766, 0.4977776, 0, 0, 1, 1, 1,
1.45569, 0.1390329, 2.499554, 1, 0, 0, 1, 1,
1.458093, -1.413795, 1.15997, 1, 0, 0, 1, 1,
1.461791, -0.973222, 2.584076, 1, 0, 0, 1, 1,
1.462171, -0.03881203, 1.106691, 1, 0, 0, 1, 1,
1.485806, -0.6160157, 3.096737, 1, 0, 0, 1, 1,
1.497748, -1.044694, 3.142946, 0, 0, 0, 1, 1,
1.501059, -0.2606839, 0.2821861, 0, 0, 0, 1, 1,
1.502419, 1.100583, 3.258111, 0, 0, 0, 1, 1,
1.513783, 0.144252, 2.322272, 0, 0, 0, 1, 1,
1.540514, 0.4227141, 2.151503, 0, 0, 0, 1, 1,
1.547692, 0.2323252, 3.032963, 0, 0, 0, 1, 1,
1.549866, 0.9685252, 0.6280244, 0, 0, 0, 1, 1,
1.584282, -0.725886, 0.8170303, 1, 1, 1, 1, 1,
1.584926, 0.6231818, 1.633743, 1, 1, 1, 1, 1,
1.588839, 0.4942885, 1.430908, 1, 1, 1, 1, 1,
1.589487, 0.2206668, 1.159205, 1, 1, 1, 1, 1,
1.598661, -0.7946119, 2.468294, 1, 1, 1, 1, 1,
1.607069, -0.4658195, 0.5638209, 1, 1, 1, 1, 1,
1.608624, 0.2888047, 2.645285, 1, 1, 1, 1, 1,
1.631998, -1.475636, 1.811137, 1, 1, 1, 1, 1,
1.639501, -0.8260204, 1.417795, 1, 1, 1, 1, 1,
1.645266, 0.6727561, 3.401824, 1, 1, 1, 1, 1,
1.64566, -0.7521822, 2.15168, 1, 1, 1, 1, 1,
1.64901, -0.06708319, 1.023722, 1, 1, 1, 1, 1,
1.655485, -0.5500277, 1.292875, 1, 1, 1, 1, 1,
1.660116, 0.2004171, -0.8026625, 1, 1, 1, 1, 1,
1.662873, -0.0378728, 2.756507, 1, 1, 1, 1, 1,
1.697465, 0.4261242, 1.815419, 0, 0, 1, 1, 1,
1.706125, -0.1331619, 0.8690985, 1, 0, 0, 1, 1,
1.708624, -0.5106382, 0.913376, 1, 0, 0, 1, 1,
1.71209, 0.2628023, 1.273787, 1, 0, 0, 1, 1,
1.712259, 0.4279386, 3.459854, 1, 0, 0, 1, 1,
1.715693, 0.04215011, 2.782391, 1, 0, 0, 1, 1,
1.718166, 0.2532448, 0.6892863, 0, 0, 0, 1, 1,
1.73072, -0.5636571, 1.14932, 0, 0, 0, 1, 1,
1.735345, -0.1644038, 2.037412, 0, 0, 0, 1, 1,
1.73664, 1.673236, -0.2751119, 0, 0, 0, 1, 1,
1.744054, -0.5299951, 1.570716, 0, 0, 0, 1, 1,
1.754655, -0.02888689, 2.698027, 0, 0, 0, 1, 1,
1.773123, -0.2840167, 1.594015, 0, 0, 0, 1, 1,
1.784116, 0.2058592, 2.522041, 1, 1, 1, 1, 1,
1.840751, 1.370531, 1.233177, 1, 1, 1, 1, 1,
1.858859, 1.188683, -0.3043135, 1, 1, 1, 1, 1,
1.862601, 0.4828599, 2.44415, 1, 1, 1, 1, 1,
1.870761, 0.9876944, 0.6985457, 1, 1, 1, 1, 1,
1.914724, 0.9184089, -0.6534202, 1, 1, 1, 1, 1,
1.925478, -0.008350271, 1.961413, 1, 1, 1, 1, 1,
1.93274, -0.860374, 2.778884, 1, 1, 1, 1, 1,
1.937515, -1.072553, 3.184703, 1, 1, 1, 1, 1,
1.954162, -0.4243707, 1.647767, 1, 1, 1, 1, 1,
1.995032, -2.626901, 1.370059, 1, 1, 1, 1, 1,
1.995794, -0.4764736, 1.722607, 1, 1, 1, 1, 1,
2.017825, 1.195517, 1.142967, 1, 1, 1, 1, 1,
2.047556, -1.320628, 2.04484, 1, 1, 1, 1, 1,
2.088745, 0.9769856, 0.6522373, 1, 1, 1, 1, 1,
2.118037, 0.8368297, 1.544584, 0, 0, 1, 1, 1,
2.153928, 0.03536565, 2.12509, 1, 0, 0, 1, 1,
2.167801, 2.352147, 0.683814, 1, 0, 0, 1, 1,
2.205221, -0.715367, 1.101373, 1, 0, 0, 1, 1,
2.241643, 0.1248523, 1.849375, 1, 0, 0, 1, 1,
2.247852, -0.246064, 2.799336, 1, 0, 0, 1, 1,
2.288093, 0.1691604, 3.33577, 0, 0, 0, 1, 1,
2.296845, 0.3448355, 1.068476, 0, 0, 0, 1, 1,
2.318261, 1.216441, -1.959285, 0, 0, 0, 1, 1,
2.31961, 0.7818653, 0.3370613, 0, 0, 0, 1, 1,
2.396581, -0.5119593, 3.184528, 0, 0, 0, 1, 1,
2.435824, -1.879672, 2.299073, 0, 0, 0, 1, 1,
2.453507, -0.2858452, 2.369034, 0, 0, 0, 1, 1,
2.454569, 0.5536751, 2.115163, 1, 1, 1, 1, 1,
2.460609, 0.1209191, 1.216094, 1, 1, 1, 1, 1,
2.541879, -0.8931656, 2.07017, 1, 1, 1, 1, 1,
2.660936, -2.254716, 1.220424, 1, 1, 1, 1, 1,
2.752723, 0.7185728, 1.033382, 1, 1, 1, 1, 1,
2.98193, 0.6782022, 3.510381, 1, 1, 1, 1, 1,
3.221977, 0.4553483, 0.7091634, 1, 1, 1, 1, 1
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
var radius = 9.598934;
var distance = 33.71585;
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
mvMatrix.translate( 0.1470523, 0.2064099, -0.2049189 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71585);
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
