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
-3.680275, 0.8997235, -2.950574, 1, 0, 0, 1,
-3.215209, 0.3808665, -2.539481, 1, 0.007843138, 0, 1,
-2.966623, -1.230407, -1.695527, 1, 0.01176471, 0, 1,
-2.849833, 2.3556, -1.654972, 1, 0.01960784, 0, 1,
-2.651611, 0.7978022, -0.888039, 1, 0.02352941, 0, 1,
-2.64827, 0.3533372, -2.134849, 1, 0.03137255, 0, 1,
-2.539102, -1.271221, -2.590194, 1, 0.03529412, 0, 1,
-2.485873, 0.3780945, -0.834831, 1, 0.04313726, 0, 1,
-2.473489, -2.085217, -1.531171, 1, 0.04705882, 0, 1,
-2.453716, 1.180963, -0.703407, 1, 0.05490196, 0, 1,
-2.441026, -0.8283154, -1.229266, 1, 0.05882353, 0, 1,
-2.428406, -0.2089008, -0.1073342, 1, 0.06666667, 0, 1,
-2.354487, -0.1655793, -1.122088, 1, 0.07058824, 0, 1,
-2.309034, -0.8065603, -1.746192, 1, 0.07843138, 0, 1,
-2.274343, 0.7277971, -1.92729, 1, 0.08235294, 0, 1,
-2.183184, -1.088997, -3.219508, 1, 0.09019608, 0, 1,
-2.169109, -0.6968516, -2.808755, 1, 0.09411765, 0, 1,
-2.131431, -0.5893219, -1.354797, 1, 0.1019608, 0, 1,
-2.126494, 0.7481732, -0.2120352, 1, 0.1098039, 0, 1,
-2.123141, -0.6942622, -1.470129, 1, 0.1137255, 0, 1,
-2.10624, -0.02799635, -1.014166, 1, 0.1215686, 0, 1,
-2.09917, 0.9314549, -1.481008, 1, 0.1254902, 0, 1,
-2.09905, -0.4991489, -2.90403, 1, 0.1333333, 0, 1,
-2.086608, -0.1028946, -2.415978, 1, 0.1372549, 0, 1,
-2.079453, 0.6185973, -1.741022, 1, 0.145098, 0, 1,
-2.076456, -0.03058873, -1.823326, 1, 0.1490196, 0, 1,
-2.072001, -1.942225, -3.049453, 1, 0.1568628, 0, 1,
-2.001187, -0.444377, -2.2926, 1, 0.1607843, 0, 1,
-1.992035, 0.04716409, -3.660785, 1, 0.1686275, 0, 1,
-1.990929, 0.4755895, -1.202053, 1, 0.172549, 0, 1,
-1.955063, 1.550808, -2.031729, 1, 0.1803922, 0, 1,
-1.905884, -0.1618252, -1.425233, 1, 0.1843137, 0, 1,
-1.904099, -0.6373798, -1.34819, 1, 0.1921569, 0, 1,
-1.886992, -1.545674, -2.934937, 1, 0.1960784, 0, 1,
-1.884112, -1.797198, -2.928471, 1, 0.2039216, 0, 1,
-1.85004, 0.6416664, -2.72523, 1, 0.2117647, 0, 1,
-1.831841, -0.2288407, -3.860355, 1, 0.2156863, 0, 1,
-1.819171, -0.9217616, -0.6275191, 1, 0.2235294, 0, 1,
-1.818127, 0.6982163, -1.668748, 1, 0.227451, 0, 1,
-1.81765, -0.560024, -0.6190096, 1, 0.2352941, 0, 1,
-1.81154, 0.5786958, -2.379016, 1, 0.2392157, 0, 1,
-1.791156, 2.061611, 0.3032535, 1, 0.2470588, 0, 1,
-1.783424, 1.154636, -2.34746, 1, 0.2509804, 0, 1,
-1.773939, 1.221034, -1.230953, 1, 0.2588235, 0, 1,
-1.757073, -0.09907586, -0.9862963, 1, 0.2627451, 0, 1,
-1.753722, 0.9254449, -1.090597, 1, 0.2705882, 0, 1,
-1.744005, 0.4424478, -0.5868753, 1, 0.2745098, 0, 1,
-1.734755, -0.9177579, -2.567649, 1, 0.282353, 0, 1,
-1.733384, -1.061389, -2.312873, 1, 0.2862745, 0, 1,
-1.731997, 0.754474, -0.9638471, 1, 0.2941177, 0, 1,
-1.727711, 0.3201553, -0.1915192, 1, 0.3019608, 0, 1,
-1.723506, 0.9055033, -1.658234, 1, 0.3058824, 0, 1,
-1.719071, 1.02862, -1.661361, 1, 0.3137255, 0, 1,
-1.699585, -0.8964773, -2.193851, 1, 0.3176471, 0, 1,
-1.683388, -0.3819985, -1.7112, 1, 0.3254902, 0, 1,
-1.680524, 0.9101515, -1.427508, 1, 0.3294118, 0, 1,
-1.676685, 0.137391, -2.80049, 1, 0.3372549, 0, 1,
-1.671856, 0.621498, -1.634867, 1, 0.3411765, 0, 1,
-1.653204, -0.8021315, -0.2267633, 1, 0.3490196, 0, 1,
-1.628333, -0.3515043, -0.6183447, 1, 0.3529412, 0, 1,
-1.625695, -3.024208, -3.338107, 1, 0.3607843, 0, 1,
-1.615708, 0.4497015, -0.5445605, 1, 0.3647059, 0, 1,
-1.612043, -1.517112, -1.411676, 1, 0.372549, 0, 1,
-1.605437, -0.3687785, -0.5413796, 1, 0.3764706, 0, 1,
-1.602093, -1.049175, -2.178786, 1, 0.3843137, 0, 1,
-1.59761, 0.6734962, -2.275121, 1, 0.3882353, 0, 1,
-1.589236, 0.6832561, -2.427713, 1, 0.3960784, 0, 1,
-1.586627, 1.137357, -0.7404555, 1, 0.4039216, 0, 1,
-1.574396, -1.463485, -3.035562, 1, 0.4078431, 0, 1,
-1.574142, 1.209571, -2.855904, 1, 0.4156863, 0, 1,
-1.570132, 1.236757, -1.694024, 1, 0.4196078, 0, 1,
-1.567106, -1.316613, -1.172731, 1, 0.427451, 0, 1,
-1.562357, 2.469792, -1.163141, 1, 0.4313726, 0, 1,
-1.55114, -0.3182366, -2.576927, 1, 0.4392157, 0, 1,
-1.547615, 1.76514, -1.57865, 1, 0.4431373, 0, 1,
-1.530375, -0.5241438, -2.408324, 1, 0.4509804, 0, 1,
-1.5171, -3.293324, -1.875918, 1, 0.454902, 0, 1,
-1.505355, -0.9103709, -1.440221, 1, 0.4627451, 0, 1,
-1.49318, 1.107984, 0.1334009, 1, 0.4666667, 0, 1,
-1.481455, -0.8184474, -3.550791, 1, 0.4745098, 0, 1,
-1.478093, -0.6127543, -0.421626, 1, 0.4784314, 0, 1,
-1.469876, -1.00745, 0.8496048, 1, 0.4862745, 0, 1,
-1.463035, -1.461683, -2.967925, 1, 0.4901961, 0, 1,
-1.460511, 0.002446967, -1.551404, 1, 0.4980392, 0, 1,
-1.445587, 0.6498445, -0.08728766, 1, 0.5058824, 0, 1,
-1.439818, -0.5104361, -1.653783, 1, 0.509804, 0, 1,
-1.438884, 0.4787064, 0.3902359, 1, 0.5176471, 0, 1,
-1.416343, 0.4103067, 0.1279515, 1, 0.5215687, 0, 1,
-1.401894, -0.1711045, -3.670673, 1, 0.5294118, 0, 1,
-1.391313, 0.8646789, -0.868508, 1, 0.5333334, 0, 1,
-1.390257, -0.09861413, -2.156242, 1, 0.5411765, 0, 1,
-1.383578, -1.3461, -3.113015, 1, 0.5450981, 0, 1,
-1.379897, -0.313991, -0.4843532, 1, 0.5529412, 0, 1,
-1.37657, -0.06782123, 0.2932064, 1, 0.5568628, 0, 1,
-1.375355, -0.6049916, -3.49732, 1, 0.5647059, 0, 1,
-1.370283, 0.2098786, -1.844975, 1, 0.5686275, 0, 1,
-1.360195, -1.674925, -1.519977, 1, 0.5764706, 0, 1,
-1.358448, -0.5284683, -1.801961, 1, 0.5803922, 0, 1,
-1.343852, 1.094654, -0.9169596, 1, 0.5882353, 0, 1,
-1.326231, 0.1880544, -2.249401, 1, 0.5921569, 0, 1,
-1.319355, 0.2783605, -1.85496, 1, 0.6, 0, 1,
-1.317144, 0.8298938, -0.5527924, 1, 0.6078432, 0, 1,
-1.312898, -0.5097032, -1.951766, 1, 0.6117647, 0, 1,
-1.303024, 0.9086585, -1.338101, 1, 0.6196079, 0, 1,
-1.301938, 0.595607, -1.941321, 1, 0.6235294, 0, 1,
-1.292512, 0.08663176, -0.7890025, 1, 0.6313726, 0, 1,
-1.291282, -0.2441631, -0.6240208, 1, 0.6352941, 0, 1,
-1.287917, -0.445201, 1.407222, 1, 0.6431373, 0, 1,
-1.286004, -0.07024523, -0.5745409, 1, 0.6470588, 0, 1,
-1.283822, -0.8544579, -0.9682133, 1, 0.654902, 0, 1,
-1.277985, -0.05890411, -3.779938, 1, 0.6588235, 0, 1,
-1.265921, -0.8018996, -1.530441, 1, 0.6666667, 0, 1,
-1.245738, 0.397084, -2.268589, 1, 0.6705883, 0, 1,
-1.241615, 1.123369, -0.7633309, 1, 0.6784314, 0, 1,
-1.241421, 0.9309453, -2.307285, 1, 0.682353, 0, 1,
-1.237889, 1.556164, -0.5232455, 1, 0.6901961, 0, 1,
-1.233731, -0.1492646, -1.861399, 1, 0.6941177, 0, 1,
-1.228757, 1.227812, -2.217953, 1, 0.7019608, 0, 1,
-1.220358, -0.2753999, -1.246297, 1, 0.7098039, 0, 1,
-1.210033, -1.346282, -2.355822, 1, 0.7137255, 0, 1,
-1.205451, 1.732683, -0.8703638, 1, 0.7215686, 0, 1,
-1.204096, -0.9942029, -2.675316, 1, 0.7254902, 0, 1,
-1.197781, -0.2063105, -0.8160863, 1, 0.7333333, 0, 1,
-1.19243, 0.4310564, -2.295382, 1, 0.7372549, 0, 1,
-1.187379, 1.030782, -0.2894209, 1, 0.7450981, 0, 1,
-1.184487, -0.8081068, -1.584158, 1, 0.7490196, 0, 1,
-1.173971, 0.6454822, -2.557512, 1, 0.7568628, 0, 1,
-1.168494, 0.1076397, -1.796112, 1, 0.7607843, 0, 1,
-1.161872, 0.1747238, -2.243429, 1, 0.7686275, 0, 1,
-1.154635, 0.6062162, -1.445115, 1, 0.772549, 0, 1,
-1.154214, 0.6363266, -1.02115, 1, 0.7803922, 0, 1,
-1.149783, 0.2017035, -0.05024343, 1, 0.7843137, 0, 1,
-1.147591, 0.9139957, -0.9654279, 1, 0.7921569, 0, 1,
-1.142912, 0.7302006, -2.701432, 1, 0.7960784, 0, 1,
-1.138578, 0.1095583, -0.3968996, 1, 0.8039216, 0, 1,
-1.131109, -0.7763638, -1.174813, 1, 0.8117647, 0, 1,
-1.120209, 0.9251888, -1.656623, 1, 0.8156863, 0, 1,
-1.119606, 0.2115162, -1.542055, 1, 0.8235294, 0, 1,
-1.118389, 1.296031, -1.634368, 1, 0.827451, 0, 1,
-1.115413, -0.3503164, -1.315064, 1, 0.8352941, 0, 1,
-1.101846, -0.3668253, -1.447991, 1, 0.8392157, 0, 1,
-1.09964, 0.7635595, -1.790727, 1, 0.8470588, 0, 1,
-1.092018, 0.34911, -1.836193, 1, 0.8509804, 0, 1,
-1.090276, -0.6269889, -2.113651, 1, 0.8588235, 0, 1,
-1.07955, 0.7459099, 0.2867784, 1, 0.8627451, 0, 1,
-1.069974, 0.980768, -1.869383, 1, 0.8705882, 0, 1,
-1.068941, -0.003673154, -0.580426, 1, 0.8745098, 0, 1,
-1.063135, -0.4400753, -2.202541, 1, 0.8823529, 0, 1,
-1.060521, 0.848286, -2.509269, 1, 0.8862745, 0, 1,
-1.058852, 1.141514, -1.158397, 1, 0.8941177, 0, 1,
-1.058256, -0.3904168, -1.574196, 1, 0.8980392, 0, 1,
-1.057253, -1.006443, -4.487953, 1, 0.9058824, 0, 1,
-1.052666, 1.425554, 0.2908356, 1, 0.9137255, 0, 1,
-1.046881, -0.5102798, -1.959092, 1, 0.9176471, 0, 1,
-1.027857, -2.177012, -2.874843, 1, 0.9254902, 0, 1,
-1.023155, 0.05475888, -1.138733, 1, 0.9294118, 0, 1,
-1.018035, -0.1801053, -1.78923, 1, 0.9372549, 0, 1,
-1.009422, -0.8988925, -1.980371, 1, 0.9411765, 0, 1,
-1.003025, -0.9668203, -2.617065, 1, 0.9490196, 0, 1,
-0.9939148, 0.1149253, -1.908115, 1, 0.9529412, 0, 1,
-0.9923244, -1.257513, -2.303671, 1, 0.9607843, 0, 1,
-0.9899337, -0.2760732, -1.616684, 1, 0.9647059, 0, 1,
-0.9735891, 0.04820749, -3.089429, 1, 0.972549, 0, 1,
-0.9601831, 0.3512181, -1.812025, 1, 0.9764706, 0, 1,
-0.9537834, -1.192093, -3.198678, 1, 0.9843137, 0, 1,
-0.9503256, 0.6569142, 0.5818706, 1, 0.9882353, 0, 1,
-0.9452559, -1.455193, -2.990883, 1, 0.9960784, 0, 1,
-0.9447015, -0.1044948, -1.897972, 0.9960784, 1, 0, 1,
-0.9438932, 0.1590688, -1.016505, 0.9921569, 1, 0, 1,
-0.9342583, 2.194671, -1.132836, 0.9843137, 1, 0, 1,
-0.9310267, 0.09319761, -1.288113, 0.9803922, 1, 0, 1,
-0.9303337, 0.8725852, 0.1887613, 0.972549, 1, 0, 1,
-0.9154703, -0.1592798, -1.378513, 0.9686275, 1, 0, 1,
-0.9081231, 0.8569962, -0.6711076, 0.9607843, 1, 0, 1,
-0.9078675, -0.3435551, -1.675319, 0.9568627, 1, 0, 1,
-0.9052846, 0.2928446, 1.425999, 0.9490196, 1, 0, 1,
-0.8953662, -0.579699, -2.933482, 0.945098, 1, 0, 1,
-0.8844672, 1.262057, -1.843608, 0.9372549, 1, 0, 1,
-0.8830934, 0.3655355, -1.616671, 0.9333333, 1, 0, 1,
-0.880772, 1.70522, -0.2233538, 0.9254902, 1, 0, 1,
-0.8782363, -0.235143, -2.103966, 0.9215686, 1, 0, 1,
-0.8690258, -0.8000485, -3.101526, 0.9137255, 1, 0, 1,
-0.8663034, -0.6863607, -2.92275, 0.9098039, 1, 0, 1,
-0.8540308, 0.8037, -0.8655263, 0.9019608, 1, 0, 1,
-0.8536922, -0.6446961, -1.444568, 0.8941177, 1, 0, 1,
-0.8526618, -0.1500572, -0.9050558, 0.8901961, 1, 0, 1,
-0.850019, -0.9131917, -1.491227, 0.8823529, 1, 0, 1,
-0.8476526, -0.6481008, -2.147253, 0.8784314, 1, 0, 1,
-0.8423995, 0.1384026, -4.44467, 0.8705882, 1, 0, 1,
-0.8398986, -3.137995, -4.01373, 0.8666667, 1, 0, 1,
-0.836462, 0.191248, -1.548316, 0.8588235, 1, 0, 1,
-0.8349767, -0.9756249, -1.85426, 0.854902, 1, 0, 1,
-0.8333406, -1.103132, -3.840661, 0.8470588, 1, 0, 1,
-0.8321357, 0.1719728, -2.324537, 0.8431373, 1, 0, 1,
-0.8302529, -3.028271, -0.6128424, 0.8352941, 1, 0, 1,
-0.8267771, 0.1446471, -2.321536, 0.8313726, 1, 0, 1,
-0.825824, -0.1036261, -2.252065, 0.8235294, 1, 0, 1,
-0.8196483, -1.205755, -3.330292, 0.8196079, 1, 0, 1,
-0.8189105, 0.953511, -0.5704218, 0.8117647, 1, 0, 1,
-0.8112467, 0.6823609, 0.0139143, 0.8078431, 1, 0, 1,
-0.8093438, -0.09043705, -2.360552, 0.8, 1, 0, 1,
-0.8089797, -0.3681805, -2.057098, 0.7921569, 1, 0, 1,
-0.8062359, 1.136634, -0.6555483, 0.7882353, 1, 0, 1,
-0.8061395, -0.08278866, -2.624323, 0.7803922, 1, 0, 1,
-0.8051926, 0.0680715, 0.3323748, 0.7764706, 1, 0, 1,
-0.8049924, -0.1852279, -2.941322, 0.7686275, 1, 0, 1,
-0.8048348, -0.08415664, -0.3481227, 0.7647059, 1, 0, 1,
-0.7968435, 0.2853784, -2.392048, 0.7568628, 1, 0, 1,
-0.7961239, 1.743316, -0.4034604, 0.7529412, 1, 0, 1,
-0.7918012, 0.4760413, 0.08541547, 0.7450981, 1, 0, 1,
-0.789394, -0.6427138, -1.693456, 0.7411765, 1, 0, 1,
-0.7869921, 0.5858516, -1.646152, 0.7333333, 1, 0, 1,
-0.7860824, -1.440821, -0.6494497, 0.7294118, 1, 0, 1,
-0.7813722, 0.71943, -0.6365684, 0.7215686, 1, 0, 1,
-0.7779549, -1.940312, -1.554589, 0.7176471, 1, 0, 1,
-0.7686132, -0.1327802, -1.983151, 0.7098039, 1, 0, 1,
-0.7678654, 1.259104, -1.34948, 0.7058824, 1, 0, 1,
-0.767181, -1.695577, -3.367524, 0.6980392, 1, 0, 1,
-0.7657099, 1.182338, -0.7475727, 0.6901961, 1, 0, 1,
-0.7629002, 1.026838, -0.04525074, 0.6862745, 1, 0, 1,
-0.7593992, 1.134064, 0.6054767, 0.6784314, 1, 0, 1,
-0.7543221, 0.5667086, -0.5061479, 0.6745098, 1, 0, 1,
-0.7469214, -0.6511424, -1.88853, 0.6666667, 1, 0, 1,
-0.7441302, -0.04057431, -1.021435, 0.6627451, 1, 0, 1,
-0.743846, 1.493491, -0.1835835, 0.654902, 1, 0, 1,
-0.7438295, -0.4450778, -0.9373258, 0.6509804, 1, 0, 1,
-0.7389032, -1.153227, -2.34044, 0.6431373, 1, 0, 1,
-0.7350794, 0.5155039, -1.981111, 0.6392157, 1, 0, 1,
-0.7316512, 0.9025753, -2.001177, 0.6313726, 1, 0, 1,
-0.7276402, -0.9453083, -4.126914, 0.627451, 1, 0, 1,
-0.727621, 1.470195, -0.7456758, 0.6196079, 1, 0, 1,
-0.7271799, -0.07030667, -1.46532, 0.6156863, 1, 0, 1,
-0.7252541, 1.060176, -0.9495959, 0.6078432, 1, 0, 1,
-0.7251819, 1.108818, -1.215333, 0.6039216, 1, 0, 1,
-0.7237229, 0.07840016, -1.909951, 0.5960785, 1, 0, 1,
-0.7078019, 0.1013013, -2.27964, 0.5882353, 1, 0, 1,
-0.7071239, 0.753332, -2.686664, 0.5843138, 1, 0, 1,
-0.7039032, 0.3696484, 1.391155, 0.5764706, 1, 0, 1,
-0.7016246, -0.2191739, -2.114591, 0.572549, 1, 0, 1,
-0.6978714, 1.834043, 0.8723713, 0.5647059, 1, 0, 1,
-0.6964625, 0.554537, -0.8968196, 0.5607843, 1, 0, 1,
-0.6960828, -0.6188942, -2.193121, 0.5529412, 1, 0, 1,
-0.6921093, 1.073051, -1.732685, 0.5490196, 1, 0, 1,
-0.6912032, -1.085976, -4.310446, 0.5411765, 1, 0, 1,
-0.6853187, -1.053522, -2.922815, 0.5372549, 1, 0, 1,
-0.6827099, -0.4878519, -1.780329, 0.5294118, 1, 0, 1,
-0.6784359, -0.117898, -1.647143, 0.5254902, 1, 0, 1,
-0.6777443, -0.9481782, -2.905483, 0.5176471, 1, 0, 1,
-0.675762, 0.3113484, -0.1132558, 0.5137255, 1, 0, 1,
-0.6734584, -1.339014, -2.358758, 0.5058824, 1, 0, 1,
-0.6731893, -1.840616, -2.362731, 0.5019608, 1, 0, 1,
-0.6662458, 2.517954, -0.9332868, 0.4941176, 1, 0, 1,
-0.6638371, 0.2075842, -1.789182, 0.4862745, 1, 0, 1,
-0.663396, 1.405079, -1.201401, 0.4823529, 1, 0, 1,
-0.6632752, -0.4513304, -2.183001, 0.4745098, 1, 0, 1,
-0.6556548, 0.3098287, -1.87097, 0.4705882, 1, 0, 1,
-0.647302, -0.1047348, -0.5071499, 0.4627451, 1, 0, 1,
-0.6432086, -1.975251, -2.117911, 0.4588235, 1, 0, 1,
-0.6392332, 0.9224157, -1.229124, 0.4509804, 1, 0, 1,
-0.6383268, -0.4840298, -1.883936, 0.4470588, 1, 0, 1,
-0.6369763, 0.6176089, 0.1410285, 0.4392157, 1, 0, 1,
-0.6368555, 2.117038, 1.445119, 0.4352941, 1, 0, 1,
-0.6322969, -0.3090304, -2.921673, 0.427451, 1, 0, 1,
-0.6316184, 0.53082, -3.840062, 0.4235294, 1, 0, 1,
-0.6282389, -0.5053369, -2.693154, 0.4156863, 1, 0, 1,
-0.6230376, 0.05653507, -0.3847397, 0.4117647, 1, 0, 1,
-0.6166152, 2.101314, 0.5967185, 0.4039216, 1, 0, 1,
-0.6122828, 0.5086898, -1.494285, 0.3960784, 1, 0, 1,
-0.6048687, 0.5995296, -0.271197, 0.3921569, 1, 0, 1,
-0.6030753, -0.6114466, -4.802547, 0.3843137, 1, 0, 1,
-0.5920795, 1.726954, -0.6631128, 0.3803922, 1, 0, 1,
-0.5920175, 0.9211729, -0.771006, 0.372549, 1, 0, 1,
-0.5869321, 1.323969, -0.5895054, 0.3686275, 1, 0, 1,
-0.5842462, -1.557733, -4.285428, 0.3607843, 1, 0, 1,
-0.5827087, -0.59993, -2.874499, 0.3568628, 1, 0, 1,
-0.5820631, -0.5514408, -3.353228, 0.3490196, 1, 0, 1,
-0.5815361, -0.8706218, -2.9347, 0.345098, 1, 0, 1,
-0.5738204, -2.305045, -1.559263, 0.3372549, 1, 0, 1,
-0.5678198, -1.174567, -2.24106, 0.3333333, 1, 0, 1,
-0.5661533, 1.063748, -0.2685124, 0.3254902, 1, 0, 1,
-0.5628161, 0.5380321, 0.1067287, 0.3215686, 1, 0, 1,
-0.561272, 1.264204, 1.039202, 0.3137255, 1, 0, 1,
-0.5555647, -0.6945724, -2.823539, 0.3098039, 1, 0, 1,
-0.5495875, -0.2594405, -4.523487, 0.3019608, 1, 0, 1,
-0.5491853, -0.728488, -2.084599, 0.2941177, 1, 0, 1,
-0.541766, -0.7864114, -2.498168, 0.2901961, 1, 0, 1,
-0.540819, 0.04088911, -1.238578, 0.282353, 1, 0, 1,
-0.5382821, 0.5395845, -1.034059, 0.2784314, 1, 0, 1,
-0.5349107, 0.5890495, 0.1742448, 0.2705882, 1, 0, 1,
-0.5337811, -0.2404593, -2.8132, 0.2666667, 1, 0, 1,
-0.532788, 1.463702, -1.021974, 0.2588235, 1, 0, 1,
-0.5314187, -0.9628156, -2.010991, 0.254902, 1, 0, 1,
-0.5312949, 0.2117236, -0.344929, 0.2470588, 1, 0, 1,
-0.5308978, 0.7464069, -1.032941, 0.2431373, 1, 0, 1,
-0.5283697, -0.5002603, -2.158235, 0.2352941, 1, 0, 1,
-0.5249569, -0.1213921, -1.962825, 0.2313726, 1, 0, 1,
-0.5247297, 0.360448, -1.440567, 0.2235294, 1, 0, 1,
-0.5236373, 0.2242753, -1.904188, 0.2196078, 1, 0, 1,
-0.5146078, -1.044695, -3.186007, 0.2117647, 1, 0, 1,
-0.514098, -0.0162241, -2.45554, 0.2078431, 1, 0, 1,
-0.5128446, 1.397063, -0.08969863, 0.2, 1, 0, 1,
-0.5065631, 0.903679, 0.9649287, 0.1921569, 1, 0, 1,
-0.4963075, -0.428046, -3.726859, 0.1882353, 1, 0, 1,
-0.488751, 0.2795087, 0.3296097, 0.1803922, 1, 0, 1,
-0.4880706, -0.2133346, -3.294019, 0.1764706, 1, 0, 1,
-0.4879394, -1.05651, -3.224962, 0.1686275, 1, 0, 1,
-0.4842717, -0.3394046, -1.408096, 0.1647059, 1, 0, 1,
-0.481009, 0.8123221, 0.1433183, 0.1568628, 1, 0, 1,
-0.479489, 1.633941, -2.468626, 0.1529412, 1, 0, 1,
-0.4781164, 0.08129984, -0.650462, 0.145098, 1, 0, 1,
-0.4769639, 0.1408541, 0.888513, 0.1411765, 1, 0, 1,
-0.4744781, -0.5187303, -1.750368, 0.1333333, 1, 0, 1,
-0.4610786, -1.043757, -2.174198, 0.1294118, 1, 0, 1,
-0.4605279, 0.08973363, -1.480579, 0.1215686, 1, 0, 1,
-0.4579157, 0.9322276, -0.09246468, 0.1176471, 1, 0, 1,
-0.4537413, 0.1848965, -1.628036, 0.1098039, 1, 0, 1,
-0.4514085, -0.6353117, -1.69873, 0.1058824, 1, 0, 1,
-0.4508978, 0.2419719, -0.3955504, 0.09803922, 1, 0, 1,
-0.4503555, 1.331657, -0.9730446, 0.09019608, 1, 0, 1,
-0.4452205, -1.774314, -2.582055, 0.08627451, 1, 0, 1,
-0.4441458, 1.174447, -1.04362, 0.07843138, 1, 0, 1,
-0.4431848, 0.2634664, 0.09599503, 0.07450981, 1, 0, 1,
-0.4375366, 1.657676, -0.0185987, 0.06666667, 1, 0, 1,
-0.4373038, -1.021158, -1.851083, 0.0627451, 1, 0, 1,
-0.4334921, 0.6072558, -1.520715, 0.05490196, 1, 0, 1,
-0.4301453, 0.7088063, -0.05702174, 0.05098039, 1, 0, 1,
-0.4297826, -1.186561, -0.2293068, 0.04313726, 1, 0, 1,
-0.429701, 0.3540576, -2.086722, 0.03921569, 1, 0, 1,
-0.4287662, -1.992465, -2.429686, 0.03137255, 1, 0, 1,
-0.4243487, 0.3685864, -1.417673, 0.02745098, 1, 0, 1,
-0.4232045, -0.9748949, -2.166796, 0.01960784, 1, 0, 1,
-0.4226783, -1.906821, -3.942727, 0.01568628, 1, 0, 1,
-0.4218075, -0.6951745, -0.2919649, 0.007843138, 1, 0, 1,
-0.4153237, 0.285929, 0.422678, 0.003921569, 1, 0, 1,
-0.4152872, 0.9339793, -0.01869707, 0, 1, 0.003921569, 1,
-0.4116166, 0.09852254, -2.156932, 0, 1, 0.01176471, 1,
-0.4103666, -0.2093579, -1.601336, 0, 1, 0.01568628, 1,
-0.4071597, 0.1714311, -1.454406, 0, 1, 0.02352941, 1,
-0.402321, 0.5606205, -0.9026024, 0, 1, 0.02745098, 1,
-0.4022317, -0.7666243, -2.590978, 0, 1, 0.03529412, 1,
-0.3971998, -1.52082, -3.638682, 0, 1, 0.03921569, 1,
-0.3967095, -1.750757, -1.014441, 0, 1, 0.04705882, 1,
-0.3954578, 0.2839553, -2.48752, 0, 1, 0.05098039, 1,
-0.391933, 0.9081891, -1.239689, 0, 1, 0.05882353, 1,
-0.3916556, -0.2719455, -1.824196, 0, 1, 0.0627451, 1,
-0.3913731, 1.730808, -1.300477, 0, 1, 0.07058824, 1,
-0.3898432, 0.8556418, -0.07283219, 0, 1, 0.07450981, 1,
-0.3828704, -0.7714263, -1.719132, 0, 1, 0.08235294, 1,
-0.3815054, 1.371387, -1.606107, 0, 1, 0.08627451, 1,
-0.3810814, -0.1428254, -2.268414, 0, 1, 0.09411765, 1,
-0.3781703, 1.076641, -2.173082, 0, 1, 0.1019608, 1,
-0.3729315, -1.496492, -3.59021, 0, 1, 0.1058824, 1,
-0.3718119, -0.2100142, -3.455331, 0, 1, 0.1137255, 1,
-0.3670574, -1.395937, -1.520187, 0, 1, 0.1176471, 1,
-0.3653643, -0.4148747, -3.056355, 0, 1, 0.1254902, 1,
-0.3644661, -1.62503, -3.278777, 0, 1, 0.1294118, 1,
-0.3631651, -0.4202895, -1.207196, 0, 1, 0.1372549, 1,
-0.3583179, 0.2779276, -0.2180392, 0, 1, 0.1411765, 1,
-0.3578418, 0.6582155, 0.3515085, 0, 1, 0.1490196, 1,
-0.3562933, -0.05898246, -0.7205222, 0, 1, 0.1529412, 1,
-0.3536675, 0.02785254, -1.600461, 0, 1, 0.1607843, 1,
-0.3524288, 0.6904819, -2.469108, 0, 1, 0.1647059, 1,
-0.3508613, -0.4971508, -1.843142, 0, 1, 0.172549, 1,
-0.3501905, -1.069768, -3.931745, 0, 1, 0.1764706, 1,
-0.3395565, 1.021348, 0.2915869, 0, 1, 0.1843137, 1,
-0.3391352, 1.389035, -0.8974816, 0, 1, 0.1882353, 1,
-0.3374049, 0.6640747, -0.4920322, 0, 1, 0.1960784, 1,
-0.3269362, 0.6503797, -1.35724, 0, 1, 0.2039216, 1,
-0.3268491, -0.3336829, -2.337076, 0, 1, 0.2078431, 1,
-0.3265517, 1.034799, -0.3561564, 0, 1, 0.2156863, 1,
-0.3243263, 0.1923573, -2.503613, 0, 1, 0.2196078, 1,
-0.3242126, 0.2197948, -0.151859, 0, 1, 0.227451, 1,
-0.3191687, 0.9154958, -0.6961451, 0, 1, 0.2313726, 1,
-0.3152896, -0.08661003, -1.946845, 0, 1, 0.2392157, 1,
-0.313412, -0.006276419, -1.414707, 0, 1, 0.2431373, 1,
-0.3097196, -1.141807, -2.957797, 0, 1, 0.2509804, 1,
-0.3084618, -0.285636, -2.799401, 0, 1, 0.254902, 1,
-0.304011, 0.2188345, -1.880707, 0, 1, 0.2627451, 1,
-0.2997259, 1.126277, -1.811141, 0, 1, 0.2666667, 1,
-0.2994045, 0.818191, -0.5493687, 0, 1, 0.2745098, 1,
-0.2956569, -1.111594, -2.405629, 0, 1, 0.2784314, 1,
-0.2952428, 0.9017418, -0.6906275, 0, 1, 0.2862745, 1,
-0.2930597, 0.4686148, 0.3432757, 0, 1, 0.2901961, 1,
-0.2917522, -0.8875526, -3.357605, 0, 1, 0.2980392, 1,
-0.2895374, -3.22953, -1.93335, 0, 1, 0.3058824, 1,
-0.2814909, -1.146956, -3.822861, 0, 1, 0.3098039, 1,
-0.278825, -0.7928793, -2.836828, 0, 1, 0.3176471, 1,
-0.2749548, -0.4404136, -0.7144424, 0, 1, 0.3215686, 1,
-0.2743285, -0.03298461, -2.242213, 0, 1, 0.3294118, 1,
-0.2736538, -0.8695476, -2.876162, 0, 1, 0.3333333, 1,
-0.2582241, -0.3448004, -2.640336, 0, 1, 0.3411765, 1,
-0.2537079, 0.4024085, -1.498415, 0, 1, 0.345098, 1,
-0.2532365, 0.1631383, 0.2415069, 0, 1, 0.3529412, 1,
-0.2483616, -0.2699384, -3.782131, 0, 1, 0.3568628, 1,
-0.2478686, 0.3022234, 0.1465188, 0, 1, 0.3647059, 1,
-0.247531, -0.628895, -2.796584, 0, 1, 0.3686275, 1,
-0.2443739, -0.002825084, -1.673447, 0, 1, 0.3764706, 1,
-0.2424421, 0.1852961, -0.3546287, 0, 1, 0.3803922, 1,
-0.238444, 1.587865, -0.193016, 0, 1, 0.3882353, 1,
-0.2367156, -1.898062, -5.176724, 0, 1, 0.3921569, 1,
-0.2359655, 0.381786, -0.5428616, 0, 1, 0.4, 1,
-0.2345089, -1.65922, -3.724961, 0, 1, 0.4078431, 1,
-0.2333949, -0.5635105, -3.018175, 0, 1, 0.4117647, 1,
-0.2328875, -0.7897472, -2.572604, 0, 1, 0.4196078, 1,
-0.2315577, 0.6417008, 0.3070692, 0, 1, 0.4235294, 1,
-0.2311012, 1.464266, 1.645584, 0, 1, 0.4313726, 1,
-0.2295609, -0.8617173, -2.364496, 0, 1, 0.4352941, 1,
-0.2291371, 1.622665, -0.8908243, 0, 1, 0.4431373, 1,
-0.2276909, 0.8431727, -0.3721291, 0, 1, 0.4470588, 1,
-0.2273705, 0.3598705, -0.1787712, 0, 1, 0.454902, 1,
-0.2261745, 0.7770227, 0.7535488, 0, 1, 0.4588235, 1,
-0.2236147, 0.4964623, -0.3687255, 0, 1, 0.4666667, 1,
-0.2236105, -0.2876118, -2.487819, 0, 1, 0.4705882, 1,
-0.2232882, 0.6091183, -0.3380429, 0, 1, 0.4784314, 1,
-0.2214085, -0.4136667, -3.305432, 0, 1, 0.4823529, 1,
-0.2167618, 1.147403, 1.378947, 0, 1, 0.4901961, 1,
-0.2158178, 1.536635, 0.07803845, 0, 1, 0.4941176, 1,
-0.2153812, -0.6193954, -2.222171, 0, 1, 0.5019608, 1,
-0.213744, 2.284269, 0.2746963, 0, 1, 0.509804, 1,
-0.2128288, 1.834225, -1.712367, 0, 1, 0.5137255, 1,
-0.2089387, -1.455612, -3.525156, 0, 1, 0.5215687, 1,
-0.2078132, 0.2016208, 0.5017429, 0, 1, 0.5254902, 1,
-0.2054865, 1.614759, 0.001700438, 0, 1, 0.5333334, 1,
-0.2019392, 0.8669947, 0.245055, 0, 1, 0.5372549, 1,
-0.1958231, -0.3644276, -5.147689, 0, 1, 0.5450981, 1,
-0.1931969, -0.1273594, -1.53336, 0, 1, 0.5490196, 1,
-0.1927169, 0.2239363, -1.018727, 0, 1, 0.5568628, 1,
-0.1914742, 1.250004, 0.7221026, 0, 1, 0.5607843, 1,
-0.1910067, 0.8800939, 0.5168351, 0, 1, 0.5686275, 1,
-0.1895589, -0.3572842, -2.726059, 0, 1, 0.572549, 1,
-0.1848253, -0.0009039945, -0.5231872, 0, 1, 0.5803922, 1,
-0.183405, 0.5546119, -0.3466128, 0, 1, 0.5843138, 1,
-0.183286, -0.04807199, -2.930645, 0, 1, 0.5921569, 1,
-0.178149, 0.1771979, -2.3562, 0, 1, 0.5960785, 1,
-0.1738177, -0.6025706, -1.940496, 0, 1, 0.6039216, 1,
-0.1719983, -1.209169, -3.290532, 0, 1, 0.6117647, 1,
-0.1703877, -1.523798, -1.445974, 0, 1, 0.6156863, 1,
-0.1701089, -0.4350565, -3.628459, 0, 1, 0.6235294, 1,
-0.1687897, 0.515076, -0.01527302, 0, 1, 0.627451, 1,
-0.1656207, 1.062395, -0.7130043, 0, 1, 0.6352941, 1,
-0.1653602, 2.054815, 0.4793412, 0, 1, 0.6392157, 1,
-0.161391, -0.7403315, -1.433682, 0, 1, 0.6470588, 1,
-0.1587929, 1.207571, 0.5619479, 0, 1, 0.6509804, 1,
-0.155425, -0.5856152, -4.439886, 0, 1, 0.6588235, 1,
-0.1533023, -1.366136, -1.920353, 0, 1, 0.6627451, 1,
-0.1519629, 0.3638413, 2.201984, 0, 1, 0.6705883, 1,
-0.151298, 0.3328056, 0.2517701, 0, 1, 0.6745098, 1,
-0.1432783, -0.6208671, -5.226028, 0, 1, 0.682353, 1,
-0.1426148, -0.5649504, -0.2954157, 0, 1, 0.6862745, 1,
-0.1424314, 1.839026, 1.051204, 0, 1, 0.6941177, 1,
-0.1404032, 0.1600283, -0.8854223, 0, 1, 0.7019608, 1,
-0.1393097, 0.7418315, -0.3731377, 0, 1, 0.7058824, 1,
-0.1363601, 0.3600123, -0.91274, 0, 1, 0.7137255, 1,
-0.1274807, 1.365143, 0.5004419, 0, 1, 0.7176471, 1,
-0.123678, -0.7525733, -2.395798, 0, 1, 0.7254902, 1,
-0.1235935, 0.2371633, -0.5520455, 0, 1, 0.7294118, 1,
-0.1223789, -0.939097, -2.914073, 0, 1, 0.7372549, 1,
-0.1138066, -0.4709148, -2.019481, 0, 1, 0.7411765, 1,
-0.1117675, -0.1983714, -3.089797, 0, 1, 0.7490196, 1,
-0.1069144, -0.3609258, -1.283423, 0, 1, 0.7529412, 1,
-0.1013913, 0.8625632, 1.26861, 0, 1, 0.7607843, 1,
-0.09775771, 0.4770283, -0.2722534, 0, 1, 0.7647059, 1,
-0.09732603, -0.4361784, -1.990885, 0, 1, 0.772549, 1,
-0.09727161, 1.897471, 0.7999327, 0, 1, 0.7764706, 1,
-0.09423698, -1.452021, -3.729951, 0, 1, 0.7843137, 1,
-0.09113789, -0.75031, -2.860766, 0, 1, 0.7882353, 1,
-0.08608392, 0.7034315, -1.773876, 0, 1, 0.7960784, 1,
-0.08513018, -0.3359421, -3.042316, 0, 1, 0.8039216, 1,
-0.08464461, 1.240959, 1.1605, 0, 1, 0.8078431, 1,
-0.07793106, 1.001536, -0.5335086, 0, 1, 0.8156863, 1,
-0.07675666, -0.3737903, -2.018974, 0, 1, 0.8196079, 1,
-0.07046884, 0.214438, 0.4997905, 0, 1, 0.827451, 1,
-0.06964184, 0.8192316, -1.052548, 0, 1, 0.8313726, 1,
-0.06720433, -0.5248138, -2.068901, 0, 1, 0.8392157, 1,
-0.05962421, -0.7359766, -4.216334, 0, 1, 0.8431373, 1,
-0.05307559, -0.257756, -3.001977, 0, 1, 0.8509804, 1,
-0.04615381, 0.4719144, 0.858088, 0, 1, 0.854902, 1,
-0.03746431, 0.1940935, -1.25805, 0, 1, 0.8627451, 1,
-0.03569508, 0.5290967, -0.5462039, 0, 1, 0.8666667, 1,
-0.03492279, 1.155215, 0.3660064, 0, 1, 0.8745098, 1,
-0.03284249, 1.528252, 0.8972115, 0, 1, 0.8784314, 1,
-0.03155604, -0.568536, -2.036638, 0, 1, 0.8862745, 1,
-0.02695021, 2.641602, 0.1488877, 0, 1, 0.8901961, 1,
-0.02667423, -1.636621, -2.976135, 0, 1, 0.8980392, 1,
-0.02567861, 0.8204129, -0.175085, 0, 1, 0.9058824, 1,
-0.01807054, -0.4991925, -1.370649, 0, 1, 0.9098039, 1,
-0.01326215, -0.1446193, -3.884362, 0, 1, 0.9176471, 1,
-0.01061592, 0.2362815, 0.692475, 0, 1, 0.9215686, 1,
-0.01009529, 0.7305422, -0.7799557, 0, 1, 0.9294118, 1,
-0.008036152, 0.4177772, 0.1626767, 0, 1, 0.9333333, 1,
-0.002265497, 0.3287586, -0.2595421, 0, 1, 0.9411765, 1,
-0.001901366, 0.7676813, -0.5655228, 0, 1, 0.945098, 1,
-0.0006001926, 0.9735634, -0.2391321, 0, 1, 0.9529412, 1,
0.0008261781, 0.6764525, 1.716391, 0, 1, 0.9568627, 1,
0.002056072, -1.200904, 3.727378, 0, 1, 0.9647059, 1,
0.01005777, -1.492745, 4.279114, 0, 1, 0.9686275, 1,
0.02242636, -0.8907714, 3.720471, 0, 1, 0.9764706, 1,
0.02772664, 1.140784, -0.2188582, 0, 1, 0.9803922, 1,
0.02902345, -0.2092042, 2.93566, 0, 1, 0.9882353, 1,
0.02905126, -0.9081509, 6.139358, 0, 1, 0.9921569, 1,
0.03054024, 0.8124208, -0.5975809, 0, 1, 1, 1,
0.03701341, -0.3324366, 4.379689, 0, 0.9921569, 1, 1,
0.03785218, -1.624113, 2.93533, 0, 0.9882353, 1, 1,
0.03789015, 0.4731708, 0.547114, 0, 0.9803922, 1, 1,
0.03900421, -1.163513, 5.001346, 0, 0.9764706, 1, 1,
0.03941677, -0.7604851, 4.58414, 0, 0.9686275, 1, 1,
0.040821, 0.06281342, -0.2142058, 0, 0.9647059, 1, 1,
0.0443119, 2.075032, 0.4929856, 0, 0.9568627, 1, 1,
0.04483564, -0.140316, 3.868711, 0, 0.9529412, 1, 1,
0.04772887, -0.03306006, 2.938317, 0, 0.945098, 1, 1,
0.04997606, 1.878207, -0.6626902, 0, 0.9411765, 1, 1,
0.050345, -0.2215014, 2.433267, 0, 0.9333333, 1, 1,
0.05252366, -0.7414858, 3.320984, 0, 0.9294118, 1, 1,
0.05601183, 0.1099604, -1.32035, 0, 0.9215686, 1, 1,
0.05649608, 0.5627114, -2.241404, 0, 0.9176471, 1, 1,
0.06078511, -0.513611, 2.176143, 0, 0.9098039, 1, 1,
0.0615398, 0.2308015, 0.9016315, 0, 0.9058824, 1, 1,
0.06650151, 0.631797, 0.9122007, 0, 0.8980392, 1, 1,
0.06690381, -0.1910296, 1.78934, 0, 0.8901961, 1, 1,
0.06707961, 0.1907372, 0.257413, 0, 0.8862745, 1, 1,
0.06812335, 1.96914, -0.8600114, 0, 0.8784314, 1, 1,
0.07112315, -0.9541122, 3.875834, 0, 0.8745098, 1, 1,
0.0712887, -0.8654139, 3.212351, 0, 0.8666667, 1, 1,
0.0715425, 0.6266167, 1.780502, 0, 0.8627451, 1, 1,
0.07305747, 0.1761839, 1.063846, 0, 0.854902, 1, 1,
0.07370857, -1.653999, 1.1621, 0, 0.8509804, 1, 1,
0.08438411, -0.7470495, 1.552177, 0, 0.8431373, 1, 1,
0.08501561, 1.353747, -0.005896762, 0, 0.8392157, 1, 1,
0.08667992, 0.9325094, -1.840282, 0, 0.8313726, 1, 1,
0.08830148, -1.964475, 1.957315, 0, 0.827451, 1, 1,
0.0924471, -0.2313823, 1.843692, 0, 0.8196079, 1, 1,
0.09325876, 0.8867278, 1.747386, 0, 0.8156863, 1, 1,
0.097339, 1.181635, 1.611772, 0, 0.8078431, 1, 1,
0.09794522, -2.11452, 3.538627, 0, 0.8039216, 1, 1,
0.09914144, -0.1537507, 2.954564, 0, 0.7960784, 1, 1,
0.1003991, 0.2334023, -0.5394139, 0, 0.7882353, 1, 1,
0.1066464, 0.7723403, -0.2002004, 0, 0.7843137, 1, 1,
0.1069396, -2.070729, 4.857808, 0, 0.7764706, 1, 1,
0.1076872, 0.5790743, -0.2017711, 0, 0.772549, 1, 1,
0.1135632, 0.316811, -0.8781919, 0, 0.7647059, 1, 1,
0.1136804, -0.7453084, 3.147069, 0, 0.7607843, 1, 1,
0.1148752, 0.3686844, -0.2712884, 0, 0.7529412, 1, 1,
0.1152657, -1.226873, 2.474179, 0, 0.7490196, 1, 1,
0.1206183, -0.3416473, 3.162214, 0, 0.7411765, 1, 1,
0.1221642, 0.1490095, 2.157226, 0, 0.7372549, 1, 1,
0.1243544, 0.1138012, 1.823632, 0, 0.7294118, 1, 1,
0.1281102, -0.7623739, 3.926551, 0, 0.7254902, 1, 1,
0.1283864, 0.6496416, -0.05424099, 0, 0.7176471, 1, 1,
0.1313916, -0.737215, 1.758541, 0, 0.7137255, 1, 1,
0.1325613, -1.41527, 0.6140385, 0, 0.7058824, 1, 1,
0.1375979, -1.895469, 2.758483, 0, 0.6980392, 1, 1,
0.1393361, -0.03893705, 1.831758, 0, 0.6941177, 1, 1,
0.1406446, 1.340884, 0.01721503, 0, 0.6862745, 1, 1,
0.142743, 0.2222104, 1.433463, 0, 0.682353, 1, 1,
0.1441455, -0.1243627, 2.04752, 0, 0.6745098, 1, 1,
0.1476616, 0.1986791, 1.133229, 0, 0.6705883, 1, 1,
0.1546783, -0.6487476, 3.73359, 0, 0.6627451, 1, 1,
0.1572964, 0.01166431, 1.380229, 0, 0.6588235, 1, 1,
0.1594213, 0.3256828, 1.441304, 0, 0.6509804, 1, 1,
0.1628567, 0.6620362, 0.6373961, 0, 0.6470588, 1, 1,
0.1641021, 1.059044, -0.4076942, 0, 0.6392157, 1, 1,
0.1644876, -0.1811987, 2.607553, 0, 0.6352941, 1, 1,
0.1657797, 0.3306992, -0.6529699, 0, 0.627451, 1, 1,
0.1696483, -1.684783, 2.313332, 0, 0.6235294, 1, 1,
0.1704016, -1.093911, 2.658988, 0, 0.6156863, 1, 1,
0.1738691, -0.027039, 1.406757, 0, 0.6117647, 1, 1,
0.1739786, -1.120924, 3.478954, 0, 0.6039216, 1, 1,
0.1758583, 0.7630661, 0.03537839, 0, 0.5960785, 1, 1,
0.1800712, -0.6722816, 1.009971, 0, 0.5921569, 1, 1,
0.1888144, -0.09249728, 3.326241, 0, 0.5843138, 1, 1,
0.1898009, 1.750826, 0.3225937, 0, 0.5803922, 1, 1,
0.1954335, -0.395004, 2.123677, 0, 0.572549, 1, 1,
0.1956242, -1.443387, 3.631394, 0, 0.5686275, 1, 1,
0.199691, -0.25942, 2.634023, 0, 0.5607843, 1, 1,
0.1997494, -0.03342007, 2.389336, 0, 0.5568628, 1, 1,
0.2019807, -0.9936908, 2.335506, 0, 0.5490196, 1, 1,
0.2032949, 1.293436, 1.608699, 0, 0.5450981, 1, 1,
0.2034961, 1.340038, 1.506455, 0, 0.5372549, 1, 1,
0.2037153, 0.2575819, 1.132599, 0, 0.5333334, 1, 1,
0.2074839, 1.114503, 1.709028, 0, 0.5254902, 1, 1,
0.2081305, 0.3967083, 3.303523, 0, 0.5215687, 1, 1,
0.2086628, -0.7020715, 3.250438, 0, 0.5137255, 1, 1,
0.2101619, 3.505359, 0.5398315, 0, 0.509804, 1, 1,
0.2128984, 0.602817, 0.6295677, 0, 0.5019608, 1, 1,
0.2142961, 1.337065, 0.009570752, 0, 0.4941176, 1, 1,
0.2165724, 0.634576, -0.7991982, 0, 0.4901961, 1, 1,
0.2171902, -0.4421492, 5.260757, 0, 0.4823529, 1, 1,
0.2172858, 0.407842, 2.407093, 0, 0.4784314, 1, 1,
0.2189807, -0.3716163, 4.632107, 0, 0.4705882, 1, 1,
0.2225494, 1.174105, -1.300532, 0, 0.4666667, 1, 1,
0.2246989, 1.144718, 0.5980052, 0, 0.4588235, 1, 1,
0.2322807, -0.7211674, 4.11439, 0, 0.454902, 1, 1,
0.2328277, -1.502117, 3.200199, 0, 0.4470588, 1, 1,
0.2335451, -1.004007, 3.535485, 0, 0.4431373, 1, 1,
0.2373317, 2.919255, 0.5561075, 0, 0.4352941, 1, 1,
0.2387864, 1.969107, 0.1891534, 0, 0.4313726, 1, 1,
0.243851, 1.770651, -0.1530728, 0, 0.4235294, 1, 1,
0.2464936, 0.6032373, 2.491312, 0, 0.4196078, 1, 1,
0.2468962, -1.14195, 2.781233, 0, 0.4117647, 1, 1,
0.2581567, -0.3688684, 2.920986, 0, 0.4078431, 1, 1,
0.2608116, 1.665304, -1.068275, 0, 0.4, 1, 1,
0.261178, 0.07837465, 2.526045, 0, 0.3921569, 1, 1,
0.2619432, 1.057932, 1.216612, 0, 0.3882353, 1, 1,
0.2625102, -0.8084569, 3.2162, 0, 0.3803922, 1, 1,
0.2656166, 0.1910053, -0.8475231, 0, 0.3764706, 1, 1,
0.2697978, 0.6367081, 2.067197, 0, 0.3686275, 1, 1,
0.2707361, 1.731205, 0.8273424, 0, 0.3647059, 1, 1,
0.2722914, 0.9070994, -0.01530223, 0, 0.3568628, 1, 1,
0.2725712, -0.7820401, 3.729888, 0, 0.3529412, 1, 1,
0.2763116, 0.6273906, 1.467472, 0, 0.345098, 1, 1,
0.2876157, -0.6459748, 1.505775, 0, 0.3411765, 1, 1,
0.2900087, 0.9921286, 0.2616749, 0, 0.3333333, 1, 1,
0.2935639, -0.7900974, 3.177396, 0, 0.3294118, 1, 1,
0.2953272, -0.3882691, 3.366103, 0, 0.3215686, 1, 1,
0.2998393, 0.8584982, -0.3346218, 0, 0.3176471, 1, 1,
0.3022852, -0.3265651, 2.661464, 0, 0.3098039, 1, 1,
0.3044749, 1.627275, 1.881506, 0, 0.3058824, 1, 1,
0.3053495, -0.2908236, 3.648782, 0, 0.2980392, 1, 1,
0.3061467, -0.9176035, 1.546018, 0, 0.2901961, 1, 1,
0.3108379, -0.6698854, 2.766357, 0, 0.2862745, 1, 1,
0.3132825, 1.513914, -0.4020851, 0, 0.2784314, 1, 1,
0.315177, 1.130792, 0.9074832, 0, 0.2745098, 1, 1,
0.3160376, 0.5651572, 0.3724854, 0, 0.2666667, 1, 1,
0.316303, 1.341409, -0.2722011, 0, 0.2627451, 1, 1,
0.3176672, 1.089905, -1.751227, 0, 0.254902, 1, 1,
0.3202862, 0.8887973, -0.2143404, 0, 0.2509804, 1, 1,
0.3248732, -0.08017413, 2.676461, 0, 0.2431373, 1, 1,
0.3265243, 0.4439781, 1.295882, 0, 0.2392157, 1, 1,
0.3268074, 0.7173418, 2.364549, 0, 0.2313726, 1, 1,
0.330213, -0.6005279, 2.468133, 0, 0.227451, 1, 1,
0.3337062, -0.7843589, 4.466349, 0, 0.2196078, 1, 1,
0.3360814, -1.355023, 3.644959, 0, 0.2156863, 1, 1,
0.3391225, 0.4149442, 1.578108, 0, 0.2078431, 1, 1,
0.3416137, -1.176159, 2.867041, 0, 0.2039216, 1, 1,
0.347362, 1.017926, -3.063729, 0, 0.1960784, 1, 1,
0.3491193, 0.7109986, 1.212132, 0, 0.1882353, 1, 1,
0.3496645, -0.2338414, 2.09788, 0, 0.1843137, 1, 1,
0.358673, -0.5246519, 2.138396, 0, 0.1764706, 1, 1,
0.3589238, -1.059942, 3.415514, 0, 0.172549, 1, 1,
0.3595578, -1.111569, 3.278671, 0, 0.1647059, 1, 1,
0.3662223, 1.074371, 1.41157, 0, 0.1607843, 1, 1,
0.366703, 0.3789514, 1.461914, 0, 0.1529412, 1, 1,
0.3734455, 0.2344515, 1.621222, 0, 0.1490196, 1, 1,
0.3782353, 0.1312959, -0.8842716, 0, 0.1411765, 1, 1,
0.3791566, 1.136724, 0.4085191, 0, 0.1372549, 1, 1,
0.3802474, 0.5733189, 0.8076748, 0, 0.1294118, 1, 1,
0.3841552, 0.4987898, 0.07763772, 0, 0.1254902, 1, 1,
0.3884895, 0.6780021, 0.9945648, 0, 0.1176471, 1, 1,
0.3886499, 0.1210218, -0.1888823, 0, 0.1137255, 1, 1,
0.3921291, 0.0760166, 1.451578, 0, 0.1058824, 1, 1,
0.3924577, -0.935925, 3.09681, 0, 0.09803922, 1, 1,
0.3949545, 0.4229073, 0.8855786, 0, 0.09411765, 1, 1,
0.3968444, 0.1583283, 2.220324, 0, 0.08627451, 1, 1,
0.3968688, -0.1368909, 2.448486, 0, 0.08235294, 1, 1,
0.4005311, 1.851775, -1.398204, 0, 0.07450981, 1, 1,
0.4011143, -1.17363, 4.026769, 0, 0.07058824, 1, 1,
0.4011448, -1.431686, 4.278853, 0, 0.0627451, 1, 1,
0.4013964, -0.3674331, 1.594565, 0, 0.05882353, 1, 1,
0.403138, -0.138552, 1.931635, 0, 0.05098039, 1, 1,
0.4052509, 0.6279238, 1.077692, 0, 0.04705882, 1, 1,
0.4053256, -0.09850689, 2.234534, 0, 0.03921569, 1, 1,
0.4063262, -0.7560387, 2.314893, 0, 0.03529412, 1, 1,
0.4074687, -1.345456, 1.032822, 0, 0.02745098, 1, 1,
0.4084629, -0.03821632, 0.715753, 0, 0.02352941, 1, 1,
0.4108637, 0.9771848, 1.690724, 0, 0.01568628, 1, 1,
0.4118227, -0.9277971, 1.129464, 0, 0.01176471, 1, 1,
0.4159466, -0.5708295, 1.695482, 0, 0.003921569, 1, 1,
0.4234765, 1.85585, 0.2657073, 0.003921569, 0, 1, 1,
0.4292635, 0.3375971, 0.5097002, 0.007843138, 0, 1, 1,
0.4345759, -0.06316854, 2.069638, 0.01568628, 0, 1, 1,
0.4346091, -0.2649374, 1.033719, 0.01960784, 0, 1, 1,
0.4380075, 1.373747, 2.738197, 0.02745098, 0, 1, 1,
0.4380151, -0.1023514, 3.260457, 0.03137255, 0, 1, 1,
0.4432824, 2.510341, 0.8354686, 0.03921569, 0, 1, 1,
0.4456139, 1.485091, 0.541303, 0.04313726, 0, 1, 1,
0.4491481, -1.105414, 2.664899, 0.05098039, 0, 1, 1,
0.4492569, 2.787959, -1.454522, 0.05490196, 0, 1, 1,
0.4634485, 2.001796, 1.669103, 0.0627451, 0, 1, 1,
0.4647661, 1.342185, 1.474142, 0.06666667, 0, 1, 1,
0.4661121, -0.746275, 1.10011, 0.07450981, 0, 1, 1,
0.4705394, 1.208106, -0.4328313, 0.07843138, 0, 1, 1,
0.4719198, -0.2366638, 2.561704, 0.08627451, 0, 1, 1,
0.4731745, 1.337113, 1.634408, 0.09019608, 0, 1, 1,
0.4755651, -1.510794, 2.875783, 0.09803922, 0, 1, 1,
0.4787514, 0.7306156, -0.1931994, 0.1058824, 0, 1, 1,
0.4818359, -0.3869315, 3.130104, 0.1098039, 0, 1, 1,
0.483123, -0.4866882, 0.602212, 0.1176471, 0, 1, 1,
0.4851457, -0.1261341, 2.669004, 0.1215686, 0, 1, 1,
0.4852978, -1.387639, 3.559631, 0.1294118, 0, 1, 1,
0.485317, 1.122778, 0.04324324, 0.1333333, 0, 1, 1,
0.4873845, -2.567291, 2.712268, 0.1411765, 0, 1, 1,
0.4897813, 0.8383607, 0.9425645, 0.145098, 0, 1, 1,
0.4931419, 1.79719, 0.2369258, 0.1529412, 0, 1, 1,
0.5008538, -0.9361669, 3.042832, 0.1568628, 0, 1, 1,
0.5030373, 0.3450836, 2.045423, 0.1647059, 0, 1, 1,
0.5031338, -0.3835545, 1.749698, 0.1686275, 0, 1, 1,
0.5031386, 1.86883, 2.161627, 0.1764706, 0, 1, 1,
0.5062698, 1.673991, 0.5636219, 0.1803922, 0, 1, 1,
0.5076264, -0.2033198, 4.071215, 0.1882353, 0, 1, 1,
0.5101935, -0.4629532, 3.947594, 0.1921569, 0, 1, 1,
0.5103211, -0.1407537, 1.645739, 0.2, 0, 1, 1,
0.5105823, 0.3079959, 0.7241146, 0.2078431, 0, 1, 1,
0.5129758, -2.08257, 2.546989, 0.2117647, 0, 1, 1,
0.5155194, 0.6616941, 0.9186543, 0.2196078, 0, 1, 1,
0.5156676, -1.230368, 3.418829, 0.2235294, 0, 1, 1,
0.5161063, -0.6385345, 3.802791, 0.2313726, 0, 1, 1,
0.5171629, 0.4999812, 1.062977, 0.2352941, 0, 1, 1,
0.5200765, -0.437353, 1.295671, 0.2431373, 0, 1, 1,
0.5248594, -0.3757474, 3.500184, 0.2470588, 0, 1, 1,
0.5298108, 0.2702405, 0.7289523, 0.254902, 0, 1, 1,
0.5333447, -0.4013731, 2.304917, 0.2588235, 0, 1, 1,
0.5348915, 0.4380654, 1.417552, 0.2666667, 0, 1, 1,
0.53728, -0.4780268, 0.8739312, 0.2705882, 0, 1, 1,
0.5379046, -0.91381, 1.600267, 0.2784314, 0, 1, 1,
0.5392433, 0.6449233, -0.5202822, 0.282353, 0, 1, 1,
0.539991, -0.374803, 1.970095, 0.2901961, 0, 1, 1,
0.5445725, 0.2972221, 0.5358785, 0.2941177, 0, 1, 1,
0.5481646, 1.445442, 1.98062, 0.3019608, 0, 1, 1,
0.5500929, -1.090784, 4.335023, 0.3098039, 0, 1, 1,
0.5519015, 2.207552, -0.5084277, 0.3137255, 0, 1, 1,
0.5557663, 2.348155, 0.8121027, 0.3215686, 0, 1, 1,
0.5638483, -1.679508, 2.654779, 0.3254902, 0, 1, 1,
0.5777065, 1.937396, 0.3826273, 0.3333333, 0, 1, 1,
0.5780217, 0.9563695, 1.446594, 0.3372549, 0, 1, 1,
0.5831761, -0.4149758, 3.565603, 0.345098, 0, 1, 1,
0.5865735, 0.6568487, 0.6989928, 0.3490196, 0, 1, 1,
0.5879912, 0.07723971, 3.486033, 0.3568628, 0, 1, 1,
0.5906969, -1.165054, 2.961194, 0.3607843, 0, 1, 1,
0.5913131, 0.6428844, 1.899982, 0.3686275, 0, 1, 1,
0.5913721, -1.313995, 3.009469, 0.372549, 0, 1, 1,
0.5915806, -0.5366376, 3.215545, 0.3803922, 0, 1, 1,
0.5924801, -0.01375502, 1.404712, 0.3843137, 0, 1, 1,
0.5987693, 0.2870815, 0.3556752, 0.3921569, 0, 1, 1,
0.6030811, 1.418406, 2.211279, 0.3960784, 0, 1, 1,
0.6045472, 0.3630201, 2.228073, 0.4039216, 0, 1, 1,
0.6063725, 0.2458781, 2.399436, 0.4117647, 0, 1, 1,
0.607093, 0.9490114, 2.002253, 0.4156863, 0, 1, 1,
0.6079853, -1.200605, 3.766135, 0.4235294, 0, 1, 1,
0.6170322, -1.169792, 2.744685, 0.427451, 0, 1, 1,
0.6246711, -0.7182148, 3.152413, 0.4352941, 0, 1, 1,
0.6279525, 0.8307872, -0.8967282, 0.4392157, 0, 1, 1,
0.6328042, 1.547377, 1.831686, 0.4470588, 0, 1, 1,
0.6348419, 0.6233031, 0.6305801, 0.4509804, 0, 1, 1,
0.6348631, 1.092511, 1.749955, 0.4588235, 0, 1, 1,
0.6360794, 2.05424, 0.06272359, 0.4627451, 0, 1, 1,
0.6455162, 0.2794139, 0.7940794, 0.4705882, 0, 1, 1,
0.6478378, -1.851442, 0.5780455, 0.4745098, 0, 1, 1,
0.6479266, 0.2123837, 0.08248707, 0.4823529, 0, 1, 1,
0.6493203, 1.182237, 1.770107, 0.4862745, 0, 1, 1,
0.6540966, -0.3571483, 2.33954, 0.4941176, 0, 1, 1,
0.6560546, -0.5109406, 2.044341, 0.5019608, 0, 1, 1,
0.6572555, 0.9880087, 1.510787, 0.5058824, 0, 1, 1,
0.6686488, 0.8702812, 1.291554, 0.5137255, 0, 1, 1,
0.6775172, 0.3559589, -0.4122047, 0.5176471, 0, 1, 1,
0.6782795, 0.7721928, 1.047053, 0.5254902, 0, 1, 1,
0.681523, 1.997575, 1.503814, 0.5294118, 0, 1, 1,
0.682068, 2.10833, -1.35607, 0.5372549, 0, 1, 1,
0.6844917, 1.06829, 1.946176, 0.5411765, 0, 1, 1,
0.6848884, 0.8004743, 2.431023, 0.5490196, 0, 1, 1,
0.7029842, -0.6238334, 3.147064, 0.5529412, 0, 1, 1,
0.7083336, -0.3723173, 1.68839, 0.5607843, 0, 1, 1,
0.7105359, 0.08794517, 1.838663, 0.5647059, 0, 1, 1,
0.711046, 0.09582191, 1.744374, 0.572549, 0, 1, 1,
0.7114773, -0.1044115, 1.254244, 0.5764706, 0, 1, 1,
0.7119864, 0.8775381, 1.257721, 0.5843138, 0, 1, 1,
0.7125151, -0.8719951, 3.140743, 0.5882353, 0, 1, 1,
0.7129816, -1.83151, 3.447508, 0.5960785, 0, 1, 1,
0.7131582, 1.253572, 0.4289892, 0.6039216, 0, 1, 1,
0.7139386, -0.7177685, 3.346857, 0.6078432, 0, 1, 1,
0.7162033, 1.353639, 1.851661, 0.6156863, 0, 1, 1,
0.7182673, 1.680395, 0.2352555, 0.6196079, 0, 1, 1,
0.7301552, 0.6732672, 0.7516742, 0.627451, 0, 1, 1,
0.7347713, -0.6829625, 2.866395, 0.6313726, 0, 1, 1,
0.7394383, 0.01135482, 1.743751, 0.6392157, 0, 1, 1,
0.743108, -0.8642629, 1.536755, 0.6431373, 0, 1, 1,
0.743884, -0.03480583, 1.172292, 0.6509804, 0, 1, 1,
0.7501255, -0.8171747, 0.4322352, 0.654902, 0, 1, 1,
0.7522727, 0.4544826, -0.0523751, 0.6627451, 0, 1, 1,
0.7531037, 1.859793, -0.2414892, 0.6666667, 0, 1, 1,
0.753657, -0.6944922, 1.975691, 0.6745098, 0, 1, 1,
0.755398, 0.6325561, 0.3264977, 0.6784314, 0, 1, 1,
0.7583152, 0.151878, 0.5814037, 0.6862745, 0, 1, 1,
0.7599685, 0.340876, 1.769772, 0.6901961, 0, 1, 1,
0.7642897, -1.181272, 3.841915, 0.6980392, 0, 1, 1,
0.7682323, -0.9152111, 2.815138, 0.7058824, 0, 1, 1,
0.7689357, 0.9651372, 1.105567, 0.7098039, 0, 1, 1,
0.7707923, -1.258585, 4.198498, 0.7176471, 0, 1, 1,
0.7804072, -0.04629965, 0.9177143, 0.7215686, 0, 1, 1,
0.7861305, 0.4305002, 1.460322, 0.7294118, 0, 1, 1,
0.7877571, 1.085735, 2.108022, 0.7333333, 0, 1, 1,
0.7902629, -0.7120237, 3.114649, 0.7411765, 0, 1, 1,
0.796768, -0.9951875, 2.964379, 0.7450981, 0, 1, 1,
0.79933, -0.8410211, 3.687511, 0.7529412, 0, 1, 1,
0.8024769, 0.2985861, 1.263454, 0.7568628, 0, 1, 1,
0.8038457, 1.136254, 0.7071462, 0.7647059, 0, 1, 1,
0.8049957, 0.3662236, 1.674705, 0.7686275, 0, 1, 1,
0.8089187, 2.01633, 0.3932194, 0.7764706, 0, 1, 1,
0.8095002, 0.7059813, 1.579863, 0.7803922, 0, 1, 1,
0.8133023, -0.2856917, 1.947881, 0.7882353, 0, 1, 1,
0.8197152, 0.3680958, 0.6071745, 0.7921569, 0, 1, 1,
0.820709, -0.767983, 3.27021, 0.8, 0, 1, 1,
0.8217834, 1.345029, 0.6360897, 0.8078431, 0, 1, 1,
0.834067, -1.649099, 2.767058, 0.8117647, 0, 1, 1,
0.8360173, -0.1504425, 2.682976, 0.8196079, 0, 1, 1,
0.8496243, -0.7298082, 0.8167757, 0.8235294, 0, 1, 1,
0.8551453, 1.769117, -1.391829, 0.8313726, 0, 1, 1,
0.8597558, -1.56676, 3.620599, 0.8352941, 0, 1, 1,
0.8637996, -0.2359179, 2.433004, 0.8431373, 0, 1, 1,
0.8641756, 1.057141, 0.5967355, 0.8470588, 0, 1, 1,
0.8657961, 0.3309856, 1.385558, 0.854902, 0, 1, 1,
0.8679636, 1.609654, 1.307612, 0.8588235, 0, 1, 1,
0.8699082, -0.6788998, 1.677081, 0.8666667, 0, 1, 1,
0.8737474, 0.1310631, 1.054675, 0.8705882, 0, 1, 1,
0.8790752, 0.9023586, -1.234099, 0.8784314, 0, 1, 1,
0.8795117, -1.155432, 4.060407, 0.8823529, 0, 1, 1,
0.8807606, 0.864862, 1.722725, 0.8901961, 0, 1, 1,
0.8822231, 2.077144, 1.341855, 0.8941177, 0, 1, 1,
0.8829232, -1.182092, 1.897836, 0.9019608, 0, 1, 1,
0.8861442, -1.294707, 2.702115, 0.9098039, 0, 1, 1,
0.8896069, -0.415664, 1.161995, 0.9137255, 0, 1, 1,
0.9020169, -1.482591, 2.973087, 0.9215686, 0, 1, 1,
0.9020885, -0.3482231, 1.077925, 0.9254902, 0, 1, 1,
0.9045486, 0.8268186, 1.089326, 0.9333333, 0, 1, 1,
0.9081049, -0.375852, 2.015373, 0.9372549, 0, 1, 1,
0.9115868, 1.341712, 0.7318494, 0.945098, 0, 1, 1,
0.9155492, -0.2706924, 2.907339, 0.9490196, 0, 1, 1,
0.9211942, 3.058053, -0.6961726, 0.9568627, 0, 1, 1,
0.9250819, 0.8942291, 1.01582, 0.9607843, 0, 1, 1,
0.92654, -1.844138, 3.128024, 0.9686275, 0, 1, 1,
0.9267802, -1.694721, 1.183655, 0.972549, 0, 1, 1,
0.9274738, 0.9504758, 1.333218, 0.9803922, 0, 1, 1,
0.9277396, 0.8101812, -1.086095, 0.9843137, 0, 1, 1,
0.9283009, -1.20445, 3.506677, 0.9921569, 0, 1, 1,
0.9326457, 0.4457541, 2.326568, 0.9960784, 0, 1, 1,
0.9333286, -0.5635992, 1.176967, 1, 0, 0.9960784, 1,
0.9395738, 2.222849, -0.3779089, 1, 0, 0.9882353, 1,
0.9497235, -0.528115, 2.223255, 1, 0, 0.9843137, 1,
0.9506786, -0.01567939, 0.08369352, 1, 0, 0.9764706, 1,
0.9523605, -1.060966, 2.598989, 1, 0, 0.972549, 1,
0.9529329, -0.05155267, 3.112812, 1, 0, 0.9647059, 1,
0.9561659, -0.9799143, 1.504269, 1, 0, 0.9607843, 1,
0.957604, -1.677629, 3.48667, 1, 0, 0.9529412, 1,
0.9602302, 1.560213, 0.3282127, 1, 0, 0.9490196, 1,
0.9615513, -1.422187, 1.091244, 1, 0, 0.9411765, 1,
0.9624516, -0.9205972, 1.583157, 1, 0, 0.9372549, 1,
0.9633605, -0.6475636, 1.102314, 1, 0, 0.9294118, 1,
0.9651929, 0.6252836, 2.718538, 1, 0, 0.9254902, 1,
0.9673116, 0.4464922, 1.793784, 1, 0, 0.9176471, 1,
0.9673384, -0.7654299, 2.051478, 1, 0, 0.9137255, 1,
0.9680921, 0.6255884, 1.090243, 1, 0, 0.9058824, 1,
0.9719394, -0.06979237, 2.289328, 1, 0, 0.9019608, 1,
0.9741328, 2.030082, -1.053711, 1, 0, 0.8941177, 1,
0.9788979, 0.6529253, -0.2289484, 1, 0, 0.8862745, 1,
0.9819468, -0.7520515, 2.118846, 1, 0, 0.8823529, 1,
1.001388, -0.357775, 1.009488, 1, 0, 0.8745098, 1,
1.007252, -0.6559505, 2.057721, 1, 0, 0.8705882, 1,
1.008109, 1.804863, 0.6851164, 1, 0, 0.8627451, 1,
1.011901, -0.329412, 1.465676, 1, 0, 0.8588235, 1,
1.014547, -0.9218799, 1.703431, 1, 0, 0.8509804, 1,
1.027692, -0.8851689, 2.264578, 1, 0, 0.8470588, 1,
1.033422, -0.3279545, 2.346281, 1, 0, 0.8392157, 1,
1.036824, 1.445135, 0.3792382, 1, 0, 0.8352941, 1,
1.040999, -0.5809889, 2.768165, 1, 0, 0.827451, 1,
1.042072, 0.6311026, 1.578994, 1, 0, 0.8235294, 1,
1.043748, 0.09366868, 3.195196, 1, 0, 0.8156863, 1,
1.046195, -1.781433, 2.878847, 1, 0, 0.8117647, 1,
1.060108, 0.6121399, 1.796157, 1, 0, 0.8039216, 1,
1.06268, 1.99006, 0.469416, 1, 0, 0.7960784, 1,
1.067212, -0.3003224, 1.03755, 1, 0, 0.7921569, 1,
1.079502, -0.5579086, 2.486885, 1, 0, 0.7843137, 1,
1.081393, 0.3112559, 0.9609154, 1, 0, 0.7803922, 1,
1.087444, -1.383278, 1.556705, 1, 0, 0.772549, 1,
1.089555, 1.673952, 2.547957, 1, 0, 0.7686275, 1,
1.089875, -1.072854, 2.594056, 1, 0, 0.7607843, 1,
1.094147, -0.8086945, 4.33216, 1, 0, 0.7568628, 1,
1.094833, 0.5351446, 0.7790213, 1, 0, 0.7490196, 1,
1.103226, -0.703851, 2.206491, 1, 0, 0.7450981, 1,
1.104661, 0.3922927, 2.780366, 1, 0, 0.7372549, 1,
1.105808, -1.233466, 2.032137, 1, 0, 0.7333333, 1,
1.108357, -0.09889833, 0.3720121, 1, 0, 0.7254902, 1,
1.110712, 0.7097549, 0.9158571, 1, 0, 0.7215686, 1,
1.13134, 0.5818356, -1.257653, 1, 0, 0.7137255, 1,
1.14682, 0.9994804, 0.01756406, 1, 0, 0.7098039, 1,
1.148176, 0.0941557, 3.286895, 1, 0, 0.7019608, 1,
1.15028, -0.04075245, 1.700208, 1, 0, 0.6941177, 1,
1.151551, 0.4049214, 0.4137401, 1, 0, 0.6901961, 1,
1.155615, 0.2321872, 1.518623, 1, 0, 0.682353, 1,
1.159701, -0.1352694, 1.191756, 1, 0, 0.6784314, 1,
1.16403, -0.1328099, 3.593808, 1, 0, 0.6705883, 1,
1.164557, 0.7348189, 1.04462, 1, 0, 0.6666667, 1,
1.1677, 0.4969328, 1.286343, 1, 0, 0.6588235, 1,
1.175506, 0.0567696, 1.056581, 1, 0, 0.654902, 1,
1.184928, 0.01619964, 2.256984, 1, 0, 0.6470588, 1,
1.190619, -0.04844262, 2.419355, 1, 0, 0.6431373, 1,
1.203128, 1.329757, 1.571115, 1, 0, 0.6352941, 1,
1.211595, -0.1234493, 1.27718, 1, 0, 0.6313726, 1,
1.215916, 1.464129, -1.269555, 1, 0, 0.6235294, 1,
1.231996, -0.184856, 2.391233, 1, 0, 0.6196079, 1,
1.237293, -1.872386, 4.503159, 1, 0, 0.6117647, 1,
1.245262, 0.4961661, 1.724773, 1, 0, 0.6078432, 1,
1.246238, 0.7732792, 2.284792, 1, 0, 0.6, 1,
1.246629, -2.075789, 3.537808, 1, 0, 0.5921569, 1,
1.252398, 2.695665, 1.584045, 1, 0, 0.5882353, 1,
1.256999, 1.360668, -1.354111, 1, 0, 0.5803922, 1,
1.260507, -2.846171, 3.745564, 1, 0, 0.5764706, 1,
1.267827, -1.019373, 2.446505, 1, 0, 0.5686275, 1,
1.272772, 2.811637, 1.043247, 1, 0, 0.5647059, 1,
1.277845, -0.07275226, 0.1499745, 1, 0, 0.5568628, 1,
1.282497, -1.135935, 2.785303, 1, 0, 0.5529412, 1,
1.291819, 1.640634, 0.2076801, 1, 0, 0.5450981, 1,
1.293362, -0.06511126, 1.11837, 1, 0, 0.5411765, 1,
1.311236, 0.01524691, 4.019562, 1, 0, 0.5333334, 1,
1.311415, -0.09722329, 2.911135, 1, 0, 0.5294118, 1,
1.325957, -0.9527335, 1.805584, 1, 0, 0.5215687, 1,
1.334193, -1.080242, 2.710188, 1, 0, 0.5176471, 1,
1.335264, 1.150624, 0.5443272, 1, 0, 0.509804, 1,
1.348575, -0.02634, 1.675133, 1, 0, 0.5058824, 1,
1.353242, -0.7896856, 3.083367, 1, 0, 0.4980392, 1,
1.357157, -0.09931388, 0.5230846, 1, 0, 0.4901961, 1,
1.369625, 0.4931165, 0.8136602, 1, 0, 0.4862745, 1,
1.370691, -1.008536, 2.272797, 1, 0, 0.4784314, 1,
1.382367, -0.2129461, 2.742106, 1, 0, 0.4745098, 1,
1.395503, -1.340561, 0.2746008, 1, 0, 0.4666667, 1,
1.400153, -0.3050302, 0.8603162, 1, 0, 0.4627451, 1,
1.40712, 1.176778, 2.070504, 1, 0, 0.454902, 1,
1.409129, -0.1968707, 1.804549, 1, 0, 0.4509804, 1,
1.417449, 0.1057369, 1.244141, 1, 0, 0.4431373, 1,
1.430508, 1.901854, -0.2034603, 1, 0, 0.4392157, 1,
1.47071, 0.7627992, 0.5796232, 1, 0, 0.4313726, 1,
1.473246, -0.04306788, 1.57595, 1, 0, 0.427451, 1,
1.478464, -0.5140794, -0.6702837, 1, 0, 0.4196078, 1,
1.490271, 0.1379827, 3.303011, 1, 0, 0.4156863, 1,
1.503839, 1.342704, -0.4570189, 1, 0, 0.4078431, 1,
1.513878, -0.1568847, 2.080848, 1, 0, 0.4039216, 1,
1.522626, -0.2605322, 2.310157, 1, 0, 0.3960784, 1,
1.534448, 0.8370184, 1.831908, 1, 0, 0.3882353, 1,
1.537, 2.678764, -0.6757466, 1, 0, 0.3843137, 1,
1.54489, -0.3095799, 1.670337, 1, 0, 0.3764706, 1,
1.558892, -0.06002313, 1.548373, 1, 0, 0.372549, 1,
1.581159, 0.266403, 0.2931865, 1, 0, 0.3647059, 1,
1.587869, -1.127313, 0.7521362, 1, 0, 0.3607843, 1,
1.590947, 0.3508801, 1.721333, 1, 0, 0.3529412, 1,
1.59701, -0.3499239, 2.123517, 1, 0, 0.3490196, 1,
1.59941, -0.8773264, 2.912338, 1, 0, 0.3411765, 1,
1.600842, 0.07552197, 3.790356, 1, 0, 0.3372549, 1,
1.6158, 2.964093, 0.5059155, 1, 0, 0.3294118, 1,
1.627305, -0.2222403, 1.446296, 1, 0, 0.3254902, 1,
1.629428, -0.7381529, 2.416541, 1, 0, 0.3176471, 1,
1.630188, -0.6236252, 2.999663, 1, 0, 0.3137255, 1,
1.631201, -1.04817, 0.7328865, 1, 0, 0.3058824, 1,
1.684175, -0.1196641, 2.783725, 1, 0, 0.2980392, 1,
1.686518, -0.250813, 1.05488, 1, 0, 0.2941177, 1,
1.687407, -0.6964899, 1.583147, 1, 0, 0.2862745, 1,
1.717755, 0.2548964, 1.319551, 1, 0, 0.282353, 1,
1.730311, -0.227216, 1.438838, 1, 0, 0.2745098, 1,
1.747584, 0.5665729, 3.014616, 1, 0, 0.2705882, 1,
1.749197, 0.6297917, 1.199292, 1, 0, 0.2627451, 1,
1.753655, 0.02212861, 2.027899, 1, 0, 0.2588235, 1,
1.757867, 0.2927044, 2.404563, 1, 0, 0.2509804, 1,
1.76497, -0.5351844, 0.9591641, 1, 0, 0.2470588, 1,
1.811953, 0.4412495, 1.551683, 1, 0, 0.2392157, 1,
1.813063, -0.8359346, 3.111286, 1, 0, 0.2352941, 1,
1.818179, 1.367667, 0.7291444, 1, 0, 0.227451, 1,
1.818695, -0.8682837, 2.231846, 1, 0, 0.2235294, 1,
1.827676, 0.4007258, 1.96298, 1, 0, 0.2156863, 1,
1.862556, 2.60827, 1.10107, 1, 0, 0.2117647, 1,
1.878847, -1.756056, 4.331931, 1, 0, 0.2039216, 1,
1.893948, 0.2021596, 0.69015, 1, 0, 0.1960784, 1,
1.912995, 0.2717466, 2.596658, 1, 0, 0.1921569, 1,
1.917168, -0.8227152, 3.045444, 1, 0, 0.1843137, 1,
1.917403, -0.8038517, 0.9662915, 1, 0, 0.1803922, 1,
1.933517, 1.131184, -0.9767272, 1, 0, 0.172549, 1,
1.936542, 0.5589871, 1.535527, 1, 0, 0.1686275, 1,
1.950405, 0.1262049, 1.730459, 1, 0, 0.1607843, 1,
1.962695, 1.017703, 0.971288, 1, 0, 0.1568628, 1,
1.964425, -0.2265746, 1.402968, 1, 0, 0.1490196, 1,
1.982863, -1.095923, 1.850832, 1, 0, 0.145098, 1,
2.004058, -0.6085132, 0.9573604, 1, 0, 0.1372549, 1,
2.005325, 0.145902, 1.332583, 1, 0, 0.1333333, 1,
2.026594, 0.7326535, 2.127242, 1, 0, 0.1254902, 1,
2.05014, -0.949742, 2.633358, 1, 0, 0.1215686, 1,
2.059746, 1.499477, 0.5031624, 1, 0, 0.1137255, 1,
2.15123, -1.217633, 3.08654, 1, 0, 0.1098039, 1,
2.153154, -1.269702, 1.784988, 1, 0, 0.1019608, 1,
2.156839, 0.1444798, 2.48718, 1, 0, 0.09411765, 1,
2.162971, -0.6720561, 1.571742, 1, 0, 0.09019608, 1,
2.21479, -0.1238051, 1.820332, 1, 0, 0.08235294, 1,
2.215114, 0.3028318, 3.783749, 1, 0, 0.07843138, 1,
2.270063, 0.2960484, 2.55251, 1, 0, 0.07058824, 1,
2.308195, 0.6900064, -0.4653962, 1, 0, 0.06666667, 1,
2.323722, 0.628521, 1.563325, 1, 0, 0.05882353, 1,
2.490672, 0.4031249, 1.677921, 1, 0, 0.05490196, 1,
2.491981, -0.3395681, 1.188946, 1, 0, 0.04705882, 1,
2.585023, 0.21264, 1.086974, 1, 0, 0.04313726, 1,
2.658309, 0.001901997, 1.586764, 1, 0, 0.03529412, 1,
2.700393, 0.9466743, 2.396711, 1, 0, 0.03137255, 1,
2.87047, 1.151661, 2.763362, 1, 0, 0.02352941, 1,
2.954191, 0.03224188, -1.097434, 1, 0, 0.01960784, 1,
3.183083, -0.8368587, -0.3587976, 1, 0, 0.01176471, 1,
3.384851, 0.812486, 3.013125, 1, 0, 0.007843138, 1
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
-0.1477121, -4.445701, -7.152462, 0, -0.5, 0.5, 0.5,
-0.1477121, -4.445701, -7.152462, 1, -0.5, 0.5, 0.5,
-0.1477121, -4.445701, -7.152462, 1, 1.5, 0.5, 0.5,
-0.1477121, -4.445701, -7.152462, 0, 1.5, 0.5, 0.5
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
-4.877814, 0.1060171, -7.152462, 0, -0.5, 0.5, 0.5,
-4.877814, 0.1060171, -7.152462, 1, -0.5, 0.5, 0.5,
-4.877814, 0.1060171, -7.152462, 1, 1.5, 0.5, 0.5,
-4.877814, 0.1060171, -7.152462, 0, 1.5, 0.5, 0.5
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
-4.877814, -4.445701, 0.4566648, 0, -0.5, 0.5, 0.5,
-4.877814, -4.445701, 0.4566648, 1, -0.5, 0.5, 0.5,
-4.877814, -4.445701, 0.4566648, 1, 1.5, 0.5, 0.5,
-4.877814, -4.445701, 0.4566648, 0, 1.5, 0.5, 0.5
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
-2, -3.395305, -5.396509,
2, -3.395305, -5.396509,
-2, -3.395305, -5.396509,
-2, -3.570371, -5.689168,
0, -3.395305, -5.396509,
0, -3.570371, -5.689168,
2, -3.395305, -5.396509,
2, -3.570371, -5.689168
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
"0",
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
-2, -3.920503, -6.274485, 0, -0.5, 0.5, 0.5,
-2, -3.920503, -6.274485, 1, -0.5, 0.5, 0.5,
-2, -3.920503, -6.274485, 1, 1.5, 0.5, 0.5,
-2, -3.920503, -6.274485, 0, 1.5, 0.5, 0.5,
0, -3.920503, -6.274485, 0, -0.5, 0.5, 0.5,
0, -3.920503, -6.274485, 1, -0.5, 0.5, 0.5,
0, -3.920503, -6.274485, 1, 1.5, 0.5, 0.5,
0, -3.920503, -6.274485, 0, 1.5, 0.5, 0.5,
2, -3.920503, -6.274485, 0, -0.5, 0.5, 0.5,
2, -3.920503, -6.274485, 1, -0.5, 0.5, 0.5,
2, -3.920503, -6.274485, 1, 1.5, 0.5, 0.5,
2, -3.920503, -6.274485, 0, 1.5, 0.5, 0.5
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
-3.786252, -3, -5.396509,
-3.786252, 3, -5.396509,
-3.786252, -3, -5.396509,
-3.968179, -3, -5.689168,
-3.786252, -2, -5.396509,
-3.968179, -2, -5.689168,
-3.786252, -1, -5.396509,
-3.968179, -1, -5.689168,
-3.786252, 0, -5.396509,
-3.968179, 0, -5.689168,
-3.786252, 1, -5.396509,
-3.968179, 1, -5.689168,
-3.786252, 2, -5.396509,
-3.968179, 2, -5.689168,
-3.786252, 3, -5.396509,
-3.968179, 3, -5.689168
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
-4.332033, -3, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, -3, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, -3, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, -3, -6.274485, 0, 1.5, 0.5, 0.5,
-4.332033, -2, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, -2, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, -2, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, -2, -6.274485, 0, 1.5, 0.5, 0.5,
-4.332033, -1, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, -1, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, -1, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, -1, -6.274485, 0, 1.5, 0.5, 0.5,
-4.332033, 0, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, 0, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, 0, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, 0, -6.274485, 0, 1.5, 0.5, 0.5,
-4.332033, 1, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, 1, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, 1, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, 1, -6.274485, 0, 1.5, 0.5, 0.5,
-4.332033, 2, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, 2, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, 2, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, 2, -6.274485, 0, 1.5, 0.5, 0.5,
-4.332033, 3, -6.274485, 0, -0.5, 0.5, 0.5,
-4.332033, 3, -6.274485, 1, -0.5, 0.5, 0.5,
-4.332033, 3, -6.274485, 1, 1.5, 0.5, 0.5,
-4.332033, 3, -6.274485, 0, 1.5, 0.5, 0.5
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
-3.786252, -3.395305, -4,
-3.786252, -3.395305, 6,
-3.786252, -3.395305, -4,
-3.968179, -3.570371, -4,
-3.786252, -3.395305, -2,
-3.968179, -3.570371, -2,
-3.786252, -3.395305, 0,
-3.968179, -3.570371, 0,
-3.786252, -3.395305, 2,
-3.968179, -3.570371, 2,
-3.786252, -3.395305, 4,
-3.968179, -3.570371, 4,
-3.786252, -3.395305, 6,
-3.968179, -3.570371, 6
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
"4",
"6"
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
-4.332033, -3.920503, -4, 0, -0.5, 0.5, 0.5,
-4.332033, -3.920503, -4, 1, -0.5, 0.5, 0.5,
-4.332033, -3.920503, -4, 1, 1.5, 0.5, 0.5,
-4.332033, -3.920503, -4, 0, 1.5, 0.5, 0.5,
-4.332033, -3.920503, -2, 0, -0.5, 0.5, 0.5,
-4.332033, -3.920503, -2, 1, -0.5, 0.5, 0.5,
-4.332033, -3.920503, -2, 1, 1.5, 0.5, 0.5,
-4.332033, -3.920503, -2, 0, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 0, 0, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 0, 1, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 0, 1, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 0, 0, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 2, 0, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 2, 1, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 2, 1, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 2, 0, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 4, 0, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 4, 1, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 4, 1, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 4, 0, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 6, 0, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 6, 1, -0.5, 0.5, 0.5,
-4.332033, -3.920503, 6, 1, 1.5, 0.5, 0.5,
-4.332033, -3.920503, 6, 0, 1.5, 0.5, 0.5
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
-3.786252, -3.395305, -5.396509,
-3.786252, 3.607339, -5.396509,
-3.786252, -3.395305, 6.309839,
-3.786252, 3.607339, 6.309839,
-3.786252, -3.395305, -5.396509,
-3.786252, -3.395305, 6.309839,
-3.786252, 3.607339, -5.396509,
-3.786252, 3.607339, 6.309839,
-3.786252, -3.395305, -5.396509,
3.490828, -3.395305, -5.396509,
-3.786252, -3.395305, 6.309839,
3.490828, -3.395305, 6.309839,
-3.786252, 3.607339, -5.396509,
3.490828, 3.607339, -5.396509,
-3.786252, 3.607339, 6.309839,
3.490828, 3.607339, 6.309839,
3.490828, -3.395305, -5.396509,
3.490828, 3.607339, -5.396509,
3.490828, -3.395305, 6.309839,
3.490828, 3.607339, 6.309839,
3.490828, -3.395305, -5.396509,
3.490828, -3.395305, 6.309839,
3.490828, 3.607339, -5.396509,
3.490828, 3.607339, 6.309839
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
var radius = 8.255684;
var distance = 36.73047;
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
mvMatrix.translate( 0.1477121, -0.1060171, -0.4566648 );
mvMatrix.scale( 1.226619, 1.274691, 0.7625099 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.73047);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
oxadiargyl<-read.table("oxadiargyl.xyz")
```

```
## Error in read.table("oxadiargyl.xyz"): no lines available in input
```

```r
x<-oxadiargyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
```

```r
y<-oxadiargyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
```

```r
z<-oxadiargyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxadiargyl' not found
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
-3.680275, 0.8997235, -2.950574, 0, 0, 1, 1, 1,
-3.215209, 0.3808665, -2.539481, 1, 0, 0, 1, 1,
-2.966623, -1.230407, -1.695527, 1, 0, 0, 1, 1,
-2.849833, 2.3556, -1.654972, 1, 0, 0, 1, 1,
-2.651611, 0.7978022, -0.888039, 1, 0, 0, 1, 1,
-2.64827, 0.3533372, -2.134849, 1, 0, 0, 1, 1,
-2.539102, -1.271221, -2.590194, 0, 0, 0, 1, 1,
-2.485873, 0.3780945, -0.834831, 0, 0, 0, 1, 1,
-2.473489, -2.085217, -1.531171, 0, 0, 0, 1, 1,
-2.453716, 1.180963, -0.703407, 0, 0, 0, 1, 1,
-2.441026, -0.8283154, -1.229266, 0, 0, 0, 1, 1,
-2.428406, -0.2089008, -0.1073342, 0, 0, 0, 1, 1,
-2.354487, -0.1655793, -1.122088, 0, 0, 0, 1, 1,
-2.309034, -0.8065603, -1.746192, 1, 1, 1, 1, 1,
-2.274343, 0.7277971, -1.92729, 1, 1, 1, 1, 1,
-2.183184, -1.088997, -3.219508, 1, 1, 1, 1, 1,
-2.169109, -0.6968516, -2.808755, 1, 1, 1, 1, 1,
-2.131431, -0.5893219, -1.354797, 1, 1, 1, 1, 1,
-2.126494, 0.7481732, -0.2120352, 1, 1, 1, 1, 1,
-2.123141, -0.6942622, -1.470129, 1, 1, 1, 1, 1,
-2.10624, -0.02799635, -1.014166, 1, 1, 1, 1, 1,
-2.09917, 0.9314549, -1.481008, 1, 1, 1, 1, 1,
-2.09905, -0.4991489, -2.90403, 1, 1, 1, 1, 1,
-2.086608, -0.1028946, -2.415978, 1, 1, 1, 1, 1,
-2.079453, 0.6185973, -1.741022, 1, 1, 1, 1, 1,
-2.076456, -0.03058873, -1.823326, 1, 1, 1, 1, 1,
-2.072001, -1.942225, -3.049453, 1, 1, 1, 1, 1,
-2.001187, -0.444377, -2.2926, 1, 1, 1, 1, 1,
-1.992035, 0.04716409, -3.660785, 0, 0, 1, 1, 1,
-1.990929, 0.4755895, -1.202053, 1, 0, 0, 1, 1,
-1.955063, 1.550808, -2.031729, 1, 0, 0, 1, 1,
-1.905884, -0.1618252, -1.425233, 1, 0, 0, 1, 1,
-1.904099, -0.6373798, -1.34819, 1, 0, 0, 1, 1,
-1.886992, -1.545674, -2.934937, 1, 0, 0, 1, 1,
-1.884112, -1.797198, -2.928471, 0, 0, 0, 1, 1,
-1.85004, 0.6416664, -2.72523, 0, 0, 0, 1, 1,
-1.831841, -0.2288407, -3.860355, 0, 0, 0, 1, 1,
-1.819171, -0.9217616, -0.6275191, 0, 0, 0, 1, 1,
-1.818127, 0.6982163, -1.668748, 0, 0, 0, 1, 1,
-1.81765, -0.560024, -0.6190096, 0, 0, 0, 1, 1,
-1.81154, 0.5786958, -2.379016, 0, 0, 0, 1, 1,
-1.791156, 2.061611, 0.3032535, 1, 1, 1, 1, 1,
-1.783424, 1.154636, -2.34746, 1, 1, 1, 1, 1,
-1.773939, 1.221034, -1.230953, 1, 1, 1, 1, 1,
-1.757073, -0.09907586, -0.9862963, 1, 1, 1, 1, 1,
-1.753722, 0.9254449, -1.090597, 1, 1, 1, 1, 1,
-1.744005, 0.4424478, -0.5868753, 1, 1, 1, 1, 1,
-1.734755, -0.9177579, -2.567649, 1, 1, 1, 1, 1,
-1.733384, -1.061389, -2.312873, 1, 1, 1, 1, 1,
-1.731997, 0.754474, -0.9638471, 1, 1, 1, 1, 1,
-1.727711, 0.3201553, -0.1915192, 1, 1, 1, 1, 1,
-1.723506, 0.9055033, -1.658234, 1, 1, 1, 1, 1,
-1.719071, 1.02862, -1.661361, 1, 1, 1, 1, 1,
-1.699585, -0.8964773, -2.193851, 1, 1, 1, 1, 1,
-1.683388, -0.3819985, -1.7112, 1, 1, 1, 1, 1,
-1.680524, 0.9101515, -1.427508, 1, 1, 1, 1, 1,
-1.676685, 0.137391, -2.80049, 0, 0, 1, 1, 1,
-1.671856, 0.621498, -1.634867, 1, 0, 0, 1, 1,
-1.653204, -0.8021315, -0.2267633, 1, 0, 0, 1, 1,
-1.628333, -0.3515043, -0.6183447, 1, 0, 0, 1, 1,
-1.625695, -3.024208, -3.338107, 1, 0, 0, 1, 1,
-1.615708, 0.4497015, -0.5445605, 1, 0, 0, 1, 1,
-1.612043, -1.517112, -1.411676, 0, 0, 0, 1, 1,
-1.605437, -0.3687785, -0.5413796, 0, 0, 0, 1, 1,
-1.602093, -1.049175, -2.178786, 0, 0, 0, 1, 1,
-1.59761, 0.6734962, -2.275121, 0, 0, 0, 1, 1,
-1.589236, 0.6832561, -2.427713, 0, 0, 0, 1, 1,
-1.586627, 1.137357, -0.7404555, 0, 0, 0, 1, 1,
-1.574396, -1.463485, -3.035562, 0, 0, 0, 1, 1,
-1.574142, 1.209571, -2.855904, 1, 1, 1, 1, 1,
-1.570132, 1.236757, -1.694024, 1, 1, 1, 1, 1,
-1.567106, -1.316613, -1.172731, 1, 1, 1, 1, 1,
-1.562357, 2.469792, -1.163141, 1, 1, 1, 1, 1,
-1.55114, -0.3182366, -2.576927, 1, 1, 1, 1, 1,
-1.547615, 1.76514, -1.57865, 1, 1, 1, 1, 1,
-1.530375, -0.5241438, -2.408324, 1, 1, 1, 1, 1,
-1.5171, -3.293324, -1.875918, 1, 1, 1, 1, 1,
-1.505355, -0.9103709, -1.440221, 1, 1, 1, 1, 1,
-1.49318, 1.107984, 0.1334009, 1, 1, 1, 1, 1,
-1.481455, -0.8184474, -3.550791, 1, 1, 1, 1, 1,
-1.478093, -0.6127543, -0.421626, 1, 1, 1, 1, 1,
-1.469876, -1.00745, 0.8496048, 1, 1, 1, 1, 1,
-1.463035, -1.461683, -2.967925, 1, 1, 1, 1, 1,
-1.460511, 0.002446967, -1.551404, 1, 1, 1, 1, 1,
-1.445587, 0.6498445, -0.08728766, 0, 0, 1, 1, 1,
-1.439818, -0.5104361, -1.653783, 1, 0, 0, 1, 1,
-1.438884, 0.4787064, 0.3902359, 1, 0, 0, 1, 1,
-1.416343, 0.4103067, 0.1279515, 1, 0, 0, 1, 1,
-1.401894, -0.1711045, -3.670673, 1, 0, 0, 1, 1,
-1.391313, 0.8646789, -0.868508, 1, 0, 0, 1, 1,
-1.390257, -0.09861413, -2.156242, 0, 0, 0, 1, 1,
-1.383578, -1.3461, -3.113015, 0, 0, 0, 1, 1,
-1.379897, -0.313991, -0.4843532, 0, 0, 0, 1, 1,
-1.37657, -0.06782123, 0.2932064, 0, 0, 0, 1, 1,
-1.375355, -0.6049916, -3.49732, 0, 0, 0, 1, 1,
-1.370283, 0.2098786, -1.844975, 0, 0, 0, 1, 1,
-1.360195, -1.674925, -1.519977, 0, 0, 0, 1, 1,
-1.358448, -0.5284683, -1.801961, 1, 1, 1, 1, 1,
-1.343852, 1.094654, -0.9169596, 1, 1, 1, 1, 1,
-1.326231, 0.1880544, -2.249401, 1, 1, 1, 1, 1,
-1.319355, 0.2783605, -1.85496, 1, 1, 1, 1, 1,
-1.317144, 0.8298938, -0.5527924, 1, 1, 1, 1, 1,
-1.312898, -0.5097032, -1.951766, 1, 1, 1, 1, 1,
-1.303024, 0.9086585, -1.338101, 1, 1, 1, 1, 1,
-1.301938, 0.595607, -1.941321, 1, 1, 1, 1, 1,
-1.292512, 0.08663176, -0.7890025, 1, 1, 1, 1, 1,
-1.291282, -0.2441631, -0.6240208, 1, 1, 1, 1, 1,
-1.287917, -0.445201, 1.407222, 1, 1, 1, 1, 1,
-1.286004, -0.07024523, -0.5745409, 1, 1, 1, 1, 1,
-1.283822, -0.8544579, -0.9682133, 1, 1, 1, 1, 1,
-1.277985, -0.05890411, -3.779938, 1, 1, 1, 1, 1,
-1.265921, -0.8018996, -1.530441, 1, 1, 1, 1, 1,
-1.245738, 0.397084, -2.268589, 0, 0, 1, 1, 1,
-1.241615, 1.123369, -0.7633309, 1, 0, 0, 1, 1,
-1.241421, 0.9309453, -2.307285, 1, 0, 0, 1, 1,
-1.237889, 1.556164, -0.5232455, 1, 0, 0, 1, 1,
-1.233731, -0.1492646, -1.861399, 1, 0, 0, 1, 1,
-1.228757, 1.227812, -2.217953, 1, 0, 0, 1, 1,
-1.220358, -0.2753999, -1.246297, 0, 0, 0, 1, 1,
-1.210033, -1.346282, -2.355822, 0, 0, 0, 1, 1,
-1.205451, 1.732683, -0.8703638, 0, 0, 0, 1, 1,
-1.204096, -0.9942029, -2.675316, 0, 0, 0, 1, 1,
-1.197781, -0.2063105, -0.8160863, 0, 0, 0, 1, 1,
-1.19243, 0.4310564, -2.295382, 0, 0, 0, 1, 1,
-1.187379, 1.030782, -0.2894209, 0, 0, 0, 1, 1,
-1.184487, -0.8081068, -1.584158, 1, 1, 1, 1, 1,
-1.173971, 0.6454822, -2.557512, 1, 1, 1, 1, 1,
-1.168494, 0.1076397, -1.796112, 1, 1, 1, 1, 1,
-1.161872, 0.1747238, -2.243429, 1, 1, 1, 1, 1,
-1.154635, 0.6062162, -1.445115, 1, 1, 1, 1, 1,
-1.154214, 0.6363266, -1.02115, 1, 1, 1, 1, 1,
-1.149783, 0.2017035, -0.05024343, 1, 1, 1, 1, 1,
-1.147591, 0.9139957, -0.9654279, 1, 1, 1, 1, 1,
-1.142912, 0.7302006, -2.701432, 1, 1, 1, 1, 1,
-1.138578, 0.1095583, -0.3968996, 1, 1, 1, 1, 1,
-1.131109, -0.7763638, -1.174813, 1, 1, 1, 1, 1,
-1.120209, 0.9251888, -1.656623, 1, 1, 1, 1, 1,
-1.119606, 0.2115162, -1.542055, 1, 1, 1, 1, 1,
-1.118389, 1.296031, -1.634368, 1, 1, 1, 1, 1,
-1.115413, -0.3503164, -1.315064, 1, 1, 1, 1, 1,
-1.101846, -0.3668253, -1.447991, 0, 0, 1, 1, 1,
-1.09964, 0.7635595, -1.790727, 1, 0, 0, 1, 1,
-1.092018, 0.34911, -1.836193, 1, 0, 0, 1, 1,
-1.090276, -0.6269889, -2.113651, 1, 0, 0, 1, 1,
-1.07955, 0.7459099, 0.2867784, 1, 0, 0, 1, 1,
-1.069974, 0.980768, -1.869383, 1, 0, 0, 1, 1,
-1.068941, -0.003673154, -0.580426, 0, 0, 0, 1, 1,
-1.063135, -0.4400753, -2.202541, 0, 0, 0, 1, 1,
-1.060521, 0.848286, -2.509269, 0, 0, 0, 1, 1,
-1.058852, 1.141514, -1.158397, 0, 0, 0, 1, 1,
-1.058256, -0.3904168, -1.574196, 0, 0, 0, 1, 1,
-1.057253, -1.006443, -4.487953, 0, 0, 0, 1, 1,
-1.052666, 1.425554, 0.2908356, 0, 0, 0, 1, 1,
-1.046881, -0.5102798, -1.959092, 1, 1, 1, 1, 1,
-1.027857, -2.177012, -2.874843, 1, 1, 1, 1, 1,
-1.023155, 0.05475888, -1.138733, 1, 1, 1, 1, 1,
-1.018035, -0.1801053, -1.78923, 1, 1, 1, 1, 1,
-1.009422, -0.8988925, -1.980371, 1, 1, 1, 1, 1,
-1.003025, -0.9668203, -2.617065, 1, 1, 1, 1, 1,
-0.9939148, 0.1149253, -1.908115, 1, 1, 1, 1, 1,
-0.9923244, -1.257513, -2.303671, 1, 1, 1, 1, 1,
-0.9899337, -0.2760732, -1.616684, 1, 1, 1, 1, 1,
-0.9735891, 0.04820749, -3.089429, 1, 1, 1, 1, 1,
-0.9601831, 0.3512181, -1.812025, 1, 1, 1, 1, 1,
-0.9537834, -1.192093, -3.198678, 1, 1, 1, 1, 1,
-0.9503256, 0.6569142, 0.5818706, 1, 1, 1, 1, 1,
-0.9452559, -1.455193, -2.990883, 1, 1, 1, 1, 1,
-0.9447015, -0.1044948, -1.897972, 1, 1, 1, 1, 1,
-0.9438932, 0.1590688, -1.016505, 0, 0, 1, 1, 1,
-0.9342583, 2.194671, -1.132836, 1, 0, 0, 1, 1,
-0.9310267, 0.09319761, -1.288113, 1, 0, 0, 1, 1,
-0.9303337, 0.8725852, 0.1887613, 1, 0, 0, 1, 1,
-0.9154703, -0.1592798, -1.378513, 1, 0, 0, 1, 1,
-0.9081231, 0.8569962, -0.6711076, 1, 0, 0, 1, 1,
-0.9078675, -0.3435551, -1.675319, 0, 0, 0, 1, 1,
-0.9052846, 0.2928446, 1.425999, 0, 0, 0, 1, 1,
-0.8953662, -0.579699, -2.933482, 0, 0, 0, 1, 1,
-0.8844672, 1.262057, -1.843608, 0, 0, 0, 1, 1,
-0.8830934, 0.3655355, -1.616671, 0, 0, 0, 1, 1,
-0.880772, 1.70522, -0.2233538, 0, 0, 0, 1, 1,
-0.8782363, -0.235143, -2.103966, 0, 0, 0, 1, 1,
-0.8690258, -0.8000485, -3.101526, 1, 1, 1, 1, 1,
-0.8663034, -0.6863607, -2.92275, 1, 1, 1, 1, 1,
-0.8540308, 0.8037, -0.8655263, 1, 1, 1, 1, 1,
-0.8536922, -0.6446961, -1.444568, 1, 1, 1, 1, 1,
-0.8526618, -0.1500572, -0.9050558, 1, 1, 1, 1, 1,
-0.850019, -0.9131917, -1.491227, 1, 1, 1, 1, 1,
-0.8476526, -0.6481008, -2.147253, 1, 1, 1, 1, 1,
-0.8423995, 0.1384026, -4.44467, 1, 1, 1, 1, 1,
-0.8398986, -3.137995, -4.01373, 1, 1, 1, 1, 1,
-0.836462, 0.191248, -1.548316, 1, 1, 1, 1, 1,
-0.8349767, -0.9756249, -1.85426, 1, 1, 1, 1, 1,
-0.8333406, -1.103132, -3.840661, 1, 1, 1, 1, 1,
-0.8321357, 0.1719728, -2.324537, 1, 1, 1, 1, 1,
-0.8302529, -3.028271, -0.6128424, 1, 1, 1, 1, 1,
-0.8267771, 0.1446471, -2.321536, 1, 1, 1, 1, 1,
-0.825824, -0.1036261, -2.252065, 0, 0, 1, 1, 1,
-0.8196483, -1.205755, -3.330292, 1, 0, 0, 1, 1,
-0.8189105, 0.953511, -0.5704218, 1, 0, 0, 1, 1,
-0.8112467, 0.6823609, 0.0139143, 1, 0, 0, 1, 1,
-0.8093438, -0.09043705, -2.360552, 1, 0, 0, 1, 1,
-0.8089797, -0.3681805, -2.057098, 1, 0, 0, 1, 1,
-0.8062359, 1.136634, -0.6555483, 0, 0, 0, 1, 1,
-0.8061395, -0.08278866, -2.624323, 0, 0, 0, 1, 1,
-0.8051926, 0.0680715, 0.3323748, 0, 0, 0, 1, 1,
-0.8049924, -0.1852279, -2.941322, 0, 0, 0, 1, 1,
-0.8048348, -0.08415664, -0.3481227, 0, 0, 0, 1, 1,
-0.7968435, 0.2853784, -2.392048, 0, 0, 0, 1, 1,
-0.7961239, 1.743316, -0.4034604, 0, 0, 0, 1, 1,
-0.7918012, 0.4760413, 0.08541547, 1, 1, 1, 1, 1,
-0.789394, -0.6427138, -1.693456, 1, 1, 1, 1, 1,
-0.7869921, 0.5858516, -1.646152, 1, 1, 1, 1, 1,
-0.7860824, -1.440821, -0.6494497, 1, 1, 1, 1, 1,
-0.7813722, 0.71943, -0.6365684, 1, 1, 1, 1, 1,
-0.7779549, -1.940312, -1.554589, 1, 1, 1, 1, 1,
-0.7686132, -0.1327802, -1.983151, 1, 1, 1, 1, 1,
-0.7678654, 1.259104, -1.34948, 1, 1, 1, 1, 1,
-0.767181, -1.695577, -3.367524, 1, 1, 1, 1, 1,
-0.7657099, 1.182338, -0.7475727, 1, 1, 1, 1, 1,
-0.7629002, 1.026838, -0.04525074, 1, 1, 1, 1, 1,
-0.7593992, 1.134064, 0.6054767, 1, 1, 1, 1, 1,
-0.7543221, 0.5667086, -0.5061479, 1, 1, 1, 1, 1,
-0.7469214, -0.6511424, -1.88853, 1, 1, 1, 1, 1,
-0.7441302, -0.04057431, -1.021435, 1, 1, 1, 1, 1,
-0.743846, 1.493491, -0.1835835, 0, 0, 1, 1, 1,
-0.7438295, -0.4450778, -0.9373258, 1, 0, 0, 1, 1,
-0.7389032, -1.153227, -2.34044, 1, 0, 0, 1, 1,
-0.7350794, 0.5155039, -1.981111, 1, 0, 0, 1, 1,
-0.7316512, 0.9025753, -2.001177, 1, 0, 0, 1, 1,
-0.7276402, -0.9453083, -4.126914, 1, 0, 0, 1, 1,
-0.727621, 1.470195, -0.7456758, 0, 0, 0, 1, 1,
-0.7271799, -0.07030667, -1.46532, 0, 0, 0, 1, 1,
-0.7252541, 1.060176, -0.9495959, 0, 0, 0, 1, 1,
-0.7251819, 1.108818, -1.215333, 0, 0, 0, 1, 1,
-0.7237229, 0.07840016, -1.909951, 0, 0, 0, 1, 1,
-0.7078019, 0.1013013, -2.27964, 0, 0, 0, 1, 1,
-0.7071239, 0.753332, -2.686664, 0, 0, 0, 1, 1,
-0.7039032, 0.3696484, 1.391155, 1, 1, 1, 1, 1,
-0.7016246, -0.2191739, -2.114591, 1, 1, 1, 1, 1,
-0.6978714, 1.834043, 0.8723713, 1, 1, 1, 1, 1,
-0.6964625, 0.554537, -0.8968196, 1, 1, 1, 1, 1,
-0.6960828, -0.6188942, -2.193121, 1, 1, 1, 1, 1,
-0.6921093, 1.073051, -1.732685, 1, 1, 1, 1, 1,
-0.6912032, -1.085976, -4.310446, 1, 1, 1, 1, 1,
-0.6853187, -1.053522, -2.922815, 1, 1, 1, 1, 1,
-0.6827099, -0.4878519, -1.780329, 1, 1, 1, 1, 1,
-0.6784359, -0.117898, -1.647143, 1, 1, 1, 1, 1,
-0.6777443, -0.9481782, -2.905483, 1, 1, 1, 1, 1,
-0.675762, 0.3113484, -0.1132558, 1, 1, 1, 1, 1,
-0.6734584, -1.339014, -2.358758, 1, 1, 1, 1, 1,
-0.6731893, -1.840616, -2.362731, 1, 1, 1, 1, 1,
-0.6662458, 2.517954, -0.9332868, 1, 1, 1, 1, 1,
-0.6638371, 0.2075842, -1.789182, 0, 0, 1, 1, 1,
-0.663396, 1.405079, -1.201401, 1, 0, 0, 1, 1,
-0.6632752, -0.4513304, -2.183001, 1, 0, 0, 1, 1,
-0.6556548, 0.3098287, -1.87097, 1, 0, 0, 1, 1,
-0.647302, -0.1047348, -0.5071499, 1, 0, 0, 1, 1,
-0.6432086, -1.975251, -2.117911, 1, 0, 0, 1, 1,
-0.6392332, 0.9224157, -1.229124, 0, 0, 0, 1, 1,
-0.6383268, -0.4840298, -1.883936, 0, 0, 0, 1, 1,
-0.6369763, 0.6176089, 0.1410285, 0, 0, 0, 1, 1,
-0.6368555, 2.117038, 1.445119, 0, 0, 0, 1, 1,
-0.6322969, -0.3090304, -2.921673, 0, 0, 0, 1, 1,
-0.6316184, 0.53082, -3.840062, 0, 0, 0, 1, 1,
-0.6282389, -0.5053369, -2.693154, 0, 0, 0, 1, 1,
-0.6230376, 0.05653507, -0.3847397, 1, 1, 1, 1, 1,
-0.6166152, 2.101314, 0.5967185, 1, 1, 1, 1, 1,
-0.6122828, 0.5086898, -1.494285, 1, 1, 1, 1, 1,
-0.6048687, 0.5995296, -0.271197, 1, 1, 1, 1, 1,
-0.6030753, -0.6114466, -4.802547, 1, 1, 1, 1, 1,
-0.5920795, 1.726954, -0.6631128, 1, 1, 1, 1, 1,
-0.5920175, 0.9211729, -0.771006, 1, 1, 1, 1, 1,
-0.5869321, 1.323969, -0.5895054, 1, 1, 1, 1, 1,
-0.5842462, -1.557733, -4.285428, 1, 1, 1, 1, 1,
-0.5827087, -0.59993, -2.874499, 1, 1, 1, 1, 1,
-0.5820631, -0.5514408, -3.353228, 1, 1, 1, 1, 1,
-0.5815361, -0.8706218, -2.9347, 1, 1, 1, 1, 1,
-0.5738204, -2.305045, -1.559263, 1, 1, 1, 1, 1,
-0.5678198, -1.174567, -2.24106, 1, 1, 1, 1, 1,
-0.5661533, 1.063748, -0.2685124, 1, 1, 1, 1, 1,
-0.5628161, 0.5380321, 0.1067287, 0, 0, 1, 1, 1,
-0.561272, 1.264204, 1.039202, 1, 0, 0, 1, 1,
-0.5555647, -0.6945724, -2.823539, 1, 0, 0, 1, 1,
-0.5495875, -0.2594405, -4.523487, 1, 0, 0, 1, 1,
-0.5491853, -0.728488, -2.084599, 1, 0, 0, 1, 1,
-0.541766, -0.7864114, -2.498168, 1, 0, 0, 1, 1,
-0.540819, 0.04088911, -1.238578, 0, 0, 0, 1, 1,
-0.5382821, 0.5395845, -1.034059, 0, 0, 0, 1, 1,
-0.5349107, 0.5890495, 0.1742448, 0, 0, 0, 1, 1,
-0.5337811, -0.2404593, -2.8132, 0, 0, 0, 1, 1,
-0.532788, 1.463702, -1.021974, 0, 0, 0, 1, 1,
-0.5314187, -0.9628156, -2.010991, 0, 0, 0, 1, 1,
-0.5312949, 0.2117236, -0.344929, 0, 0, 0, 1, 1,
-0.5308978, 0.7464069, -1.032941, 1, 1, 1, 1, 1,
-0.5283697, -0.5002603, -2.158235, 1, 1, 1, 1, 1,
-0.5249569, -0.1213921, -1.962825, 1, 1, 1, 1, 1,
-0.5247297, 0.360448, -1.440567, 1, 1, 1, 1, 1,
-0.5236373, 0.2242753, -1.904188, 1, 1, 1, 1, 1,
-0.5146078, -1.044695, -3.186007, 1, 1, 1, 1, 1,
-0.514098, -0.0162241, -2.45554, 1, 1, 1, 1, 1,
-0.5128446, 1.397063, -0.08969863, 1, 1, 1, 1, 1,
-0.5065631, 0.903679, 0.9649287, 1, 1, 1, 1, 1,
-0.4963075, -0.428046, -3.726859, 1, 1, 1, 1, 1,
-0.488751, 0.2795087, 0.3296097, 1, 1, 1, 1, 1,
-0.4880706, -0.2133346, -3.294019, 1, 1, 1, 1, 1,
-0.4879394, -1.05651, -3.224962, 1, 1, 1, 1, 1,
-0.4842717, -0.3394046, -1.408096, 1, 1, 1, 1, 1,
-0.481009, 0.8123221, 0.1433183, 1, 1, 1, 1, 1,
-0.479489, 1.633941, -2.468626, 0, 0, 1, 1, 1,
-0.4781164, 0.08129984, -0.650462, 1, 0, 0, 1, 1,
-0.4769639, 0.1408541, 0.888513, 1, 0, 0, 1, 1,
-0.4744781, -0.5187303, -1.750368, 1, 0, 0, 1, 1,
-0.4610786, -1.043757, -2.174198, 1, 0, 0, 1, 1,
-0.4605279, 0.08973363, -1.480579, 1, 0, 0, 1, 1,
-0.4579157, 0.9322276, -0.09246468, 0, 0, 0, 1, 1,
-0.4537413, 0.1848965, -1.628036, 0, 0, 0, 1, 1,
-0.4514085, -0.6353117, -1.69873, 0, 0, 0, 1, 1,
-0.4508978, 0.2419719, -0.3955504, 0, 0, 0, 1, 1,
-0.4503555, 1.331657, -0.9730446, 0, 0, 0, 1, 1,
-0.4452205, -1.774314, -2.582055, 0, 0, 0, 1, 1,
-0.4441458, 1.174447, -1.04362, 0, 0, 0, 1, 1,
-0.4431848, 0.2634664, 0.09599503, 1, 1, 1, 1, 1,
-0.4375366, 1.657676, -0.0185987, 1, 1, 1, 1, 1,
-0.4373038, -1.021158, -1.851083, 1, 1, 1, 1, 1,
-0.4334921, 0.6072558, -1.520715, 1, 1, 1, 1, 1,
-0.4301453, 0.7088063, -0.05702174, 1, 1, 1, 1, 1,
-0.4297826, -1.186561, -0.2293068, 1, 1, 1, 1, 1,
-0.429701, 0.3540576, -2.086722, 1, 1, 1, 1, 1,
-0.4287662, -1.992465, -2.429686, 1, 1, 1, 1, 1,
-0.4243487, 0.3685864, -1.417673, 1, 1, 1, 1, 1,
-0.4232045, -0.9748949, -2.166796, 1, 1, 1, 1, 1,
-0.4226783, -1.906821, -3.942727, 1, 1, 1, 1, 1,
-0.4218075, -0.6951745, -0.2919649, 1, 1, 1, 1, 1,
-0.4153237, 0.285929, 0.422678, 1, 1, 1, 1, 1,
-0.4152872, 0.9339793, -0.01869707, 1, 1, 1, 1, 1,
-0.4116166, 0.09852254, -2.156932, 1, 1, 1, 1, 1,
-0.4103666, -0.2093579, -1.601336, 0, 0, 1, 1, 1,
-0.4071597, 0.1714311, -1.454406, 1, 0, 0, 1, 1,
-0.402321, 0.5606205, -0.9026024, 1, 0, 0, 1, 1,
-0.4022317, -0.7666243, -2.590978, 1, 0, 0, 1, 1,
-0.3971998, -1.52082, -3.638682, 1, 0, 0, 1, 1,
-0.3967095, -1.750757, -1.014441, 1, 0, 0, 1, 1,
-0.3954578, 0.2839553, -2.48752, 0, 0, 0, 1, 1,
-0.391933, 0.9081891, -1.239689, 0, 0, 0, 1, 1,
-0.3916556, -0.2719455, -1.824196, 0, 0, 0, 1, 1,
-0.3913731, 1.730808, -1.300477, 0, 0, 0, 1, 1,
-0.3898432, 0.8556418, -0.07283219, 0, 0, 0, 1, 1,
-0.3828704, -0.7714263, -1.719132, 0, 0, 0, 1, 1,
-0.3815054, 1.371387, -1.606107, 0, 0, 0, 1, 1,
-0.3810814, -0.1428254, -2.268414, 1, 1, 1, 1, 1,
-0.3781703, 1.076641, -2.173082, 1, 1, 1, 1, 1,
-0.3729315, -1.496492, -3.59021, 1, 1, 1, 1, 1,
-0.3718119, -0.2100142, -3.455331, 1, 1, 1, 1, 1,
-0.3670574, -1.395937, -1.520187, 1, 1, 1, 1, 1,
-0.3653643, -0.4148747, -3.056355, 1, 1, 1, 1, 1,
-0.3644661, -1.62503, -3.278777, 1, 1, 1, 1, 1,
-0.3631651, -0.4202895, -1.207196, 1, 1, 1, 1, 1,
-0.3583179, 0.2779276, -0.2180392, 1, 1, 1, 1, 1,
-0.3578418, 0.6582155, 0.3515085, 1, 1, 1, 1, 1,
-0.3562933, -0.05898246, -0.7205222, 1, 1, 1, 1, 1,
-0.3536675, 0.02785254, -1.600461, 1, 1, 1, 1, 1,
-0.3524288, 0.6904819, -2.469108, 1, 1, 1, 1, 1,
-0.3508613, -0.4971508, -1.843142, 1, 1, 1, 1, 1,
-0.3501905, -1.069768, -3.931745, 1, 1, 1, 1, 1,
-0.3395565, 1.021348, 0.2915869, 0, 0, 1, 1, 1,
-0.3391352, 1.389035, -0.8974816, 1, 0, 0, 1, 1,
-0.3374049, 0.6640747, -0.4920322, 1, 0, 0, 1, 1,
-0.3269362, 0.6503797, -1.35724, 1, 0, 0, 1, 1,
-0.3268491, -0.3336829, -2.337076, 1, 0, 0, 1, 1,
-0.3265517, 1.034799, -0.3561564, 1, 0, 0, 1, 1,
-0.3243263, 0.1923573, -2.503613, 0, 0, 0, 1, 1,
-0.3242126, 0.2197948, -0.151859, 0, 0, 0, 1, 1,
-0.3191687, 0.9154958, -0.6961451, 0, 0, 0, 1, 1,
-0.3152896, -0.08661003, -1.946845, 0, 0, 0, 1, 1,
-0.313412, -0.006276419, -1.414707, 0, 0, 0, 1, 1,
-0.3097196, -1.141807, -2.957797, 0, 0, 0, 1, 1,
-0.3084618, -0.285636, -2.799401, 0, 0, 0, 1, 1,
-0.304011, 0.2188345, -1.880707, 1, 1, 1, 1, 1,
-0.2997259, 1.126277, -1.811141, 1, 1, 1, 1, 1,
-0.2994045, 0.818191, -0.5493687, 1, 1, 1, 1, 1,
-0.2956569, -1.111594, -2.405629, 1, 1, 1, 1, 1,
-0.2952428, 0.9017418, -0.6906275, 1, 1, 1, 1, 1,
-0.2930597, 0.4686148, 0.3432757, 1, 1, 1, 1, 1,
-0.2917522, -0.8875526, -3.357605, 1, 1, 1, 1, 1,
-0.2895374, -3.22953, -1.93335, 1, 1, 1, 1, 1,
-0.2814909, -1.146956, -3.822861, 1, 1, 1, 1, 1,
-0.278825, -0.7928793, -2.836828, 1, 1, 1, 1, 1,
-0.2749548, -0.4404136, -0.7144424, 1, 1, 1, 1, 1,
-0.2743285, -0.03298461, -2.242213, 1, 1, 1, 1, 1,
-0.2736538, -0.8695476, -2.876162, 1, 1, 1, 1, 1,
-0.2582241, -0.3448004, -2.640336, 1, 1, 1, 1, 1,
-0.2537079, 0.4024085, -1.498415, 1, 1, 1, 1, 1,
-0.2532365, 0.1631383, 0.2415069, 0, 0, 1, 1, 1,
-0.2483616, -0.2699384, -3.782131, 1, 0, 0, 1, 1,
-0.2478686, 0.3022234, 0.1465188, 1, 0, 0, 1, 1,
-0.247531, -0.628895, -2.796584, 1, 0, 0, 1, 1,
-0.2443739, -0.002825084, -1.673447, 1, 0, 0, 1, 1,
-0.2424421, 0.1852961, -0.3546287, 1, 0, 0, 1, 1,
-0.238444, 1.587865, -0.193016, 0, 0, 0, 1, 1,
-0.2367156, -1.898062, -5.176724, 0, 0, 0, 1, 1,
-0.2359655, 0.381786, -0.5428616, 0, 0, 0, 1, 1,
-0.2345089, -1.65922, -3.724961, 0, 0, 0, 1, 1,
-0.2333949, -0.5635105, -3.018175, 0, 0, 0, 1, 1,
-0.2328875, -0.7897472, -2.572604, 0, 0, 0, 1, 1,
-0.2315577, 0.6417008, 0.3070692, 0, 0, 0, 1, 1,
-0.2311012, 1.464266, 1.645584, 1, 1, 1, 1, 1,
-0.2295609, -0.8617173, -2.364496, 1, 1, 1, 1, 1,
-0.2291371, 1.622665, -0.8908243, 1, 1, 1, 1, 1,
-0.2276909, 0.8431727, -0.3721291, 1, 1, 1, 1, 1,
-0.2273705, 0.3598705, -0.1787712, 1, 1, 1, 1, 1,
-0.2261745, 0.7770227, 0.7535488, 1, 1, 1, 1, 1,
-0.2236147, 0.4964623, -0.3687255, 1, 1, 1, 1, 1,
-0.2236105, -0.2876118, -2.487819, 1, 1, 1, 1, 1,
-0.2232882, 0.6091183, -0.3380429, 1, 1, 1, 1, 1,
-0.2214085, -0.4136667, -3.305432, 1, 1, 1, 1, 1,
-0.2167618, 1.147403, 1.378947, 1, 1, 1, 1, 1,
-0.2158178, 1.536635, 0.07803845, 1, 1, 1, 1, 1,
-0.2153812, -0.6193954, -2.222171, 1, 1, 1, 1, 1,
-0.213744, 2.284269, 0.2746963, 1, 1, 1, 1, 1,
-0.2128288, 1.834225, -1.712367, 1, 1, 1, 1, 1,
-0.2089387, -1.455612, -3.525156, 0, 0, 1, 1, 1,
-0.2078132, 0.2016208, 0.5017429, 1, 0, 0, 1, 1,
-0.2054865, 1.614759, 0.001700438, 1, 0, 0, 1, 1,
-0.2019392, 0.8669947, 0.245055, 1, 0, 0, 1, 1,
-0.1958231, -0.3644276, -5.147689, 1, 0, 0, 1, 1,
-0.1931969, -0.1273594, -1.53336, 1, 0, 0, 1, 1,
-0.1927169, 0.2239363, -1.018727, 0, 0, 0, 1, 1,
-0.1914742, 1.250004, 0.7221026, 0, 0, 0, 1, 1,
-0.1910067, 0.8800939, 0.5168351, 0, 0, 0, 1, 1,
-0.1895589, -0.3572842, -2.726059, 0, 0, 0, 1, 1,
-0.1848253, -0.0009039945, -0.5231872, 0, 0, 0, 1, 1,
-0.183405, 0.5546119, -0.3466128, 0, 0, 0, 1, 1,
-0.183286, -0.04807199, -2.930645, 0, 0, 0, 1, 1,
-0.178149, 0.1771979, -2.3562, 1, 1, 1, 1, 1,
-0.1738177, -0.6025706, -1.940496, 1, 1, 1, 1, 1,
-0.1719983, -1.209169, -3.290532, 1, 1, 1, 1, 1,
-0.1703877, -1.523798, -1.445974, 1, 1, 1, 1, 1,
-0.1701089, -0.4350565, -3.628459, 1, 1, 1, 1, 1,
-0.1687897, 0.515076, -0.01527302, 1, 1, 1, 1, 1,
-0.1656207, 1.062395, -0.7130043, 1, 1, 1, 1, 1,
-0.1653602, 2.054815, 0.4793412, 1, 1, 1, 1, 1,
-0.161391, -0.7403315, -1.433682, 1, 1, 1, 1, 1,
-0.1587929, 1.207571, 0.5619479, 1, 1, 1, 1, 1,
-0.155425, -0.5856152, -4.439886, 1, 1, 1, 1, 1,
-0.1533023, -1.366136, -1.920353, 1, 1, 1, 1, 1,
-0.1519629, 0.3638413, 2.201984, 1, 1, 1, 1, 1,
-0.151298, 0.3328056, 0.2517701, 1, 1, 1, 1, 1,
-0.1432783, -0.6208671, -5.226028, 1, 1, 1, 1, 1,
-0.1426148, -0.5649504, -0.2954157, 0, 0, 1, 1, 1,
-0.1424314, 1.839026, 1.051204, 1, 0, 0, 1, 1,
-0.1404032, 0.1600283, -0.8854223, 1, 0, 0, 1, 1,
-0.1393097, 0.7418315, -0.3731377, 1, 0, 0, 1, 1,
-0.1363601, 0.3600123, -0.91274, 1, 0, 0, 1, 1,
-0.1274807, 1.365143, 0.5004419, 1, 0, 0, 1, 1,
-0.123678, -0.7525733, -2.395798, 0, 0, 0, 1, 1,
-0.1235935, 0.2371633, -0.5520455, 0, 0, 0, 1, 1,
-0.1223789, -0.939097, -2.914073, 0, 0, 0, 1, 1,
-0.1138066, -0.4709148, -2.019481, 0, 0, 0, 1, 1,
-0.1117675, -0.1983714, -3.089797, 0, 0, 0, 1, 1,
-0.1069144, -0.3609258, -1.283423, 0, 0, 0, 1, 1,
-0.1013913, 0.8625632, 1.26861, 0, 0, 0, 1, 1,
-0.09775771, 0.4770283, -0.2722534, 1, 1, 1, 1, 1,
-0.09732603, -0.4361784, -1.990885, 1, 1, 1, 1, 1,
-0.09727161, 1.897471, 0.7999327, 1, 1, 1, 1, 1,
-0.09423698, -1.452021, -3.729951, 1, 1, 1, 1, 1,
-0.09113789, -0.75031, -2.860766, 1, 1, 1, 1, 1,
-0.08608392, 0.7034315, -1.773876, 1, 1, 1, 1, 1,
-0.08513018, -0.3359421, -3.042316, 1, 1, 1, 1, 1,
-0.08464461, 1.240959, 1.1605, 1, 1, 1, 1, 1,
-0.07793106, 1.001536, -0.5335086, 1, 1, 1, 1, 1,
-0.07675666, -0.3737903, -2.018974, 1, 1, 1, 1, 1,
-0.07046884, 0.214438, 0.4997905, 1, 1, 1, 1, 1,
-0.06964184, 0.8192316, -1.052548, 1, 1, 1, 1, 1,
-0.06720433, -0.5248138, -2.068901, 1, 1, 1, 1, 1,
-0.05962421, -0.7359766, -4.216334, 1, 1, 1, 1, 1,
-0.05307559, -0.257756, -3.001977, 1, 1, 1, 1, 1,
-0.04615381, 0.4719144, 0.858088, 0, 0, 1, 1, 1,
-0.03746431, 0.1940935, -1.25805, 1, 0, 0, 1, 1,
-0.03569508, 0.5290967, -0.5462039, 1, 0, 0, 1, 1,
-0.03492279, 1.155215, 0.3660064, 1, 0, 0, 1, 1,
-0.03284249, 1.528252, 0.8972115, 1, 0, 0, 1, 1,
-0.03155604, -0.568536, -2.036638, 1, 0, 0, 1, 1,
-0.02695021, 2.641602, 0.1488877, 0, 0, 0, 1, 1,
-0.02667423, -1.636621, -2.976135, 0, 0, 0, 1, 1,
-0.02567861, 0.8204129, -0.175085, 0, 0, 0, 1, 1,
-0.01807054, -0.4991925, -1.370649, 0, 0, 0, 1, 1,
-0.01326215, -0.1446193, -3.884362, 0, 0, 0, 1, 1,
-0.01061592, 0.2362815, 0.692475, 0, 0, 0, 1, 1,
-0.01009529, 0.7305422, -0.7799557, 0, 0, 0, 1, 1,
-0.008036152, 0.4177772, 0.1626767, 1, 1, 1, 1, 1,
-0.002265497, 0.3287586, -0.2595421, 1, 1, 1, 1, 1,
-0.001901366, 0.7676813, -0.5655228, 1, 1, 1, 1, 1,
-0.0006001926, 0.9735634, -0.2391321, 1, 1, 1, 1, 1,
0.0008261781, 0.6764525, 1.716391, 1, 1, 1, 1, 1,
0.002056072, -1.200904, 3.727378, 1, 1, 1, 1, 1,
0.01005777, -1.492745, 4.279114, 1, 1, 1, 1, 1,
0.02242636, -0.8907714, 3.720471, 1, 1, 1, 1, 1,
0.02772664, 1.140784, -0.2188582, 1, 1, 1, 1, 1,
0.02902345, -0.2092042, 2.93566, 1, 1, 1, 1, 1,
0.02905126, -0.9081509, 6.139358, 1, 1, 1, 1, 1,
0.03054024, 0.8124208, -0.5975809, 1, 1, 1, 1, 1,
0.03701341, -0.3324366, 4.379689, 1, 1, 1, 1, 1,
0.03785218, -1.624113, 2.93533, 1, 1, 1, 1, 1,
0.03789015, 0.4731708, 0.547114, 1, 1, 1, 1, 1,
0.03900421, -1.163513, 5.001346, 0, 0, 1, 1, 1,
0.03941677, -0.7604851, 4.58414, 1, 0, 0, 1, 1,
0.040821, 0.06281342, -0.2142058, 1, 0, 0, 1, 1,
0.0443119, 2.075032, 0.4929856, 1, 0, 0, 1, 1,
0.04483564, -0.140316, 3.868711, 1, 0, 0, 1, 1,
0.04772887, -0.03306006, 2.938317, 1, 0, 0, 1, 1,
0.04997606, 1.878207, -0.6626902, 0, 0, 0, 1, 1,
0.050345, -0.2215014, 2.433267, 0, 0, 0, 1, 1,
0.05252366, -0.7414858, 3.320984, 0, 0, 0, 1, 1,
0.05601183, 0.1099604, -1.32035, 0, 0, 0, 1, 1,
0.05649608, 0.5627114, -2.241404, 0, 0, 0, 1, 1,
0.06078511, -0.513611, 2.176143, 0, 0, 0, 1, 1,
0.0615398, 0.2308015, 0.9016315, 0, 0, 0, 1, 1,
0.06650151, 0.631797, 0.9122007, 1, 1, 1, 1, 1,
0.06690381, -0.1910296, 1.78934, 1, 1, 1, 1, 1,
0.06707961, 0.1907372, 0.257413, 1, 1, 1, 1, 1,
0.06812335, 1.96914, -0.8600114, 1, 1, 1, 1, 1,
0.07112315, -0.9541122, 3.875834, 1, 1, 1, 1, 1,
0.0712887, -0.8654139, 3.212351, 1, 1, 1, 1, 1,
0.0715425, 0.6266167, 1.780502, 1, 1, 1, 1, 1,
0.07305747, 0.1761839, 1.063846, 1, 1, 1, 1, 1,
0.07370857, -1.653999, 1.1621, 1, 1, 1, 1, 1,
0.08438411, -0.7470495, 1.552177, 1, 1, 1, 1, 1,
0.08501561, 1.353747, -0.005896762, 1, 1, 1, 1, 1,
0.08667992, 0.9325094, -1.840282, 1, 1, 1, 1, 1,
0.08830148, -1.964475, 1.957315, 1, 1, 1, 1, 1,
0.0924471, -0.2313823, 1.843692, 1, 1, 1, 1, 1,
0.09325876, 0.8867278, 1.747386, 1, 1, 1, 1, 1,
0.097339, 1.181635, 1.611772, 0, 0, 1, 1, 1,
0.09794522, -2.11452, 3.538627, 1, 0, 0, 1, 1,
0.09914144, -0.1537507, 2.954564, 1, 0, 0, 1, 1,
0.1003991, 0.2334023, -0.5394139, 1, 0, 0, 1, 1,
0.1066464, 0.7723403, -0.2002004, 1, 0, 0, 1, 1,
0.1069396, -2.070729, 4.857808, 1, 0, 0, 1, 1,
0.1076872, 0.5790743, -0.2017711, 0, 0, 0, 1, 1,
0.1135632, 0.316811, -0.8781919, 0, 0, 0, 1, 1,
0.1136804, -0.7453084, 3.147069, 0, 0, 0, 1, 1,
0.1148752, 0.3686844, -0.2712884, 0, 0, 0, 1, 1,
0.1152657, -1.226873, 2.474179, 0, 0, 0, 1, 1,
0.1206183, -0.3416473, 3.162214, 0, 0, 0, 1, 1,
0.1221642, 0.1490095, 2.157226, 0, 0, 0, 1, 1,
0.1243544, 0.1138012, 1.823632, 1, 1, 1, 1, 1,
0.1281102, -0.7623739, 3.926551, 1, 1, 1, 1, 1,
0.1283864, 0.6496416, -0.05424099, 1, 1, 1, 1, 1,
0.1313916, -0.737215, 1.758541, 1, 1, 1, 1, 1,
0.1325613, -1.41527, 0.6140385, 1, 1, 1, 1, 1,
0.1375979, -1.895469, 2.758483, 1, 1, 1, 1, 1,
0.1393361, -0.03893705, 1.831758, 1, 1, 1, 1, 1,
0.1406446, 1.340884, 0.01721503, 1, 1, 1, 1, 1,
0.142743, 0.2222104, 1.433463, 1, 1, 1, 1, 1,
0.1441455, -0.1243627, 2.04752, 1, 1, 1, 1, 1,
0.1476616, 0.1986791, 1.133229, 1, 1, 1, 1, 1,
0.1546783, -0.6487476, 3.73359, 1, 1, 1, 1, 1,
0.1572964, 0.01166431, 1.380229, 1, 1, 1, 1, 1,
0.1594213, 0.3256828, 1.441304, 1, 1, 1, 1, 1,
0.1628567, 0.6620362, 0.6373961, 1, 1, 1, 1, 1,
0.1641021, 1.059044, -0.4076942, 0, 0, 1, 1, 1,
0.1644876, -0.1811987, 2.607553, 1, 0, 0, 1, 1,
0.1657797, 0.3306992, -0.6529699, 1, 0, 0, 1, 1,
0.1696483, -1.684783, 2.313332, 1, 0, 0, 1, 1,
0.1704016, -1.093911, 2.658988, 1, 0, 0, 1, 1,
0.1738691, -0.027039, 1.406757, 1, 0, 0, 1, 1,
0.1739786, -1.120924, 3.478954, 0, 0, 0, 1, 1,
0.1758583, 0.7630661, 0.03537839, 0, 0, 0, 1, 1,
0.1800712, -0.6722816, 1.009971, 0, 0, 0, 1, 1,
0.1888144, -0.09249728, 3.326241, 0, 0, 0, 1, 1,
0.1898009, 1.750826, 0.3225937, 0, 0, 0, 1, 1,
0.1954335, -0.395004, 2.123677, 0, 0, 0, 1, 1,
0.1956242, -1.443387, 3.631394, 0, 0, 0, 1, 1,
0.199691, -0.25942, 2.634023, 1, 1, 1, 1, 1,
0.1997494, -0.03342007, 2.389336, 1, 1, 1, 1, 1,
0.2019807, -0.9936908, 2.335506, 1, 1, 1, 1, 1,
0.2032949, 1.293436, 1.608699, 1, 1, 1, 1, 1,
0.2034961, 1.340038, 1.506455, 1, 1, 1, 1, 1,
0.2037153, 0.2575819, 1.132599, 1, 1, 1, 1, 1,
0.2074839, 1.114503, 1.709028, 1, 1, 1, 1, 1,
0.2081305, 0.3967083, 3.303523, 1, 1, 1, 1, 1,
0.2086628, -0.7020715, 3.250438, 1, 1, 1, 1, 1,
0.2101619, 3.505359, 0.5398315, 1, 1, 1, 1, 1,
0.2128984, 0.602817, 0.6295677, 1, 1, 1, 1, 1,
0.2142961, 1.337065, 0.009570752, 1, 1, 1, 1, 1,
0.2165724, 0.634576, -0.7991982, 1, 1, 1, 1, 1,
0.2171902, -0.4421492, 5.260757, 1, 1, 1, 1, 1,
0.2172858, 0.407842, 2.407093, 1, 1, 1, 1, 1,
0.2189807, -0.3716163, 4.632107, 0, 0, 1, 1, 1,
0.2225494, 1.174105, -1.300532, 1, 0, 0, 1, 1,
0.2246989, 1.144718, 0.5980052, 1, 0, 0, 1, 1,
0.2322807, -0.7211674, 4.11439, 1, 0, 0, 1, 1,
0.2328277, -1.502117, 3.200199, 1, 0, 0, 1, 1,
0.2335451, -1.004007, 3.535485, 1, 0, 0, 1, 1,
0.2373317, 2.919255, 0.5561075, 0, 0, 0, 1, 1,
0.2387864, 1.969107, 0.1891534, 0, 0, 0, 1, 1,
0.243851, 1.770651, -0.1530728, 0, 0, 0, 1, 1,
0.2464936, 0.6032373, 2.491312, 0, 0, 0, 1, 1,
0.2468962, -1.14195, 2.781233, 0, 0, 0, 1, 1,
0.2581567, -0.3688684, 2.920986, 0, 0, 0, 1, 1,
0.2608116, 1.665304, -1.068275, 0, 0, 0, 1, 1,
0.261178, 0.07837465, 2.526045, 1, 1, 1, 1, 1,
0.2619432, 1.057932, 1.216612, 1, 1, 1, 1, 1,
0.2625102, -0.8084569, 3.2162, 1, 1, 1, 1, 1,
0.2656166, 0.1910053, -0.8475231, 1, 1, 1, 1, 1,
0.2697978, 0.6367081, 2.067197, 1, 1, 1, 1, 1,
0.2707361, 1.731205, 0.8273424, 1, 1, 1, 1, 1,
0.2722914, 0.9070994, -0.01530223, 1, 1, 1, 1, 1,
0.2725712, -0.7820401, 3.729888, 1, 1, 1, 1, 1,
0.2763116, 0.6273906, 1.467472, 1, 1, 1, 1, 1,
0.2876157, -0.6459748, 1.505775, 1, 1, 1, 1, 1,
0.2900087, 0.9921286, 0.2616749, 1, 1, 1, 1, 1,
0.2935639, -0.7900974, 3.177396, 1, 1, 1, 1, 1,
0.2953272, -0.3882691, 3.366103, 1, 1, 1, 1, 1,
0.2998393, 0.8584982, -0.3346218, 1, 1, 1, 1, 1,
0.3022852, -0.3265651, 2.661464, 1, 1, 1, 1, 1,
0.3044749, 1.627275, 1.881506, 0, 0, 1, 1, 1,
0.3053495, -0.2908236, 3.648782, 1, 0, 0, 1, 1,
0.3061467, -0.9176035, 1.546018, 1, 0, 0, 1, 1,
0.3108379, -0.6698854, 2.766357, 1, 0, 0, 1, 1,
0.3132825, 1.513914, -0.4020851, 1, 0, 0, 1, 1,
0.315177, 1.130792, 0.9074832, 1, 0, 0, 1, 1,
0.3160376, 0.5651572, 0.3724854, 0, 0, 0, 1, 1,
0.316303, 1.341409, -0.2722011, 0, 0, 0, 1, 1,
0.3176672, 1.089905, -1.751227, 0, 0, 0, 1, 1,
0.3202862, 0.8887973, -0.2143404, 0, 0, 0, 1, 1,
0.3248732, -0.08017413, 2.676461, 0, 0, 0, 1, 1,
0.3265243, 0.4439781, 1.295882, 0, 0, 0, 1, 1,
0.3268074, 0.7173418, 2.364549, 0, 0, 0, 1, 1,
0.330213, -0.6005279, 2.468133, 1, 1, 1, 1, 1,
0.3337062, -0.7843589, 4.466349, 1, 1, 1, 1, 1,
0.3360814, -1.355023, 3.644959, 1, 1, 1, 1, 1,
0.3391225, 0.4149442, 1.578108, 1, 1, 1, 1, 1,
0.3416137, -1.176159, 2.867041, 1, 1, 1, 1, 1,
0.347362, 1.017926, -3.063729, 1, 1, 1, 1, 1,
0.3491193, 0.7109986, 1.212132, 1, 1, 1, 1, 1,
0.3496645, -0.2338414, 2.09788, 1, 1, 1, 1, 1,
0.358673, -0.5246519, 2.138396, 1, 1, 1, 1, 1,
0.3589238, -1.059942, 3.415514, 1, 1, 1, 1, 1,
0.3595578, -1.111569, 3.278671, 1, 1, 1, 1, 1,
0.3662223, 1.074371, 1.41157, 1, 1, 1, 1, 1,
0.366703, 0.3789514, 1.461914, 1, 1, 1, 1, 1,
0.3734455, 0.2344515, 1.621222, 1, 1, 1, 1, 1,
0.3782353, 0.1312959, -0.8842716, 1, 1, 1, 1, 1,
0.3791566, 1.136724, 0.4085191, 0, 0, 1, 1, 1,
0.3802474, 0.5733189, 0.8076748, 1, 0, 0, 1, 1,
0.3841552, 0.4987898, 0.07763772, 1, 0, 0, 1, 1,
0.3884895, 0.6780021, 0.9945648, 1, 0, 0, 1, 1,
0.3886499, 0.1210218, -0.1888823, 1, 0, 0, 1, 1,
0.3921291, 0.0760166, 1.451578, 1, 0, 0, 1, 1,
0.3924577, -0.935925, 3.09681, 0, 0, 0, 1, 1,
0.3949545, 0.4229073, 0.8855786, 0, 0, 0, 1, 1,
0.3968444, 0.1583283, 2.220324, 0, 0, 0, 1, 1,
0.3968688, -0.1368909, 2.448486, 0, 0, 0, 1, 1,
0.4005311, 1.851775, -1.398204, 0, 0, 0, 1, 1,
0.4011143, -1.17363, 4.026769, 0, 0, 0, 1, 1,
0.4011448, -1.431686, 4.278853, 0, 0, 0, 1, 1,
0.4013964, -0.3674331, 1.594565, 1, 1, 1, 1, 1,
0.403138, -0.138552, 1.931635, 1, 1, 1, 1, 1,
0.4052509, 0.6279238, 1.077692, 1, 1, 1, 1, 1,
0.4053256, -0.09850689, 2.234534, 1, 1, 1, 1, 1,
0.4063262, -0.7560387, 2.314893, 1, 1, 1, 1, 1,
0.4074687, -1.345456, 1.032822, 1, 1, 1, 1, 1,
0.4084629, -0.03821632, 0.715753, 1, 1, 1, 1, 1,
0.4108637, 0.9771848, 1.690724, 1, 1, 1, 1, 1,
0.4118227, -0.9277971, 1.129464, 1, 1, 1, 1, 1,
0.4159466, -0.5708295, 1.695482, 1, 1, 1, 1, 1,
0.4234765, 1.85585, 0.2657073, 1, 1, 1, 1, 1,
0.4292635, 0.3375971, 0.5097002, 1, 1, 1, 1, 1,
0.4345759, -0.06316854, 2.069638, 1, 1, 1, 1, 1,
0.4346091, -0.2649374, 1.033719, 1, 1, 1, 1, 1,
0.4380075, 1.373747, 2.738197, 1, 1, 1, 1, 1,
0.4380151, -0.1023514, 3.260457, 0, 0, 1, 1, 1,
0.4432824, 2.510341, 0.8354686, 1, 0, 0, 1, 1,
0.4456139, 1.485091, 0.541303, 1, 0, 0, 1, 1,
0.4491481, -1.105414, 2.664899, 1, 0, 0, 1, 1,
0.4492569, 2.787959, -1.454522, 1, 0, 0, 1, 1,
0.4634485, 2.001796, 1.669103, 1, 0, 0, 1, 1,
0.4647661, 1.342185, 1.474142, 0, 0, 0, 1, 1,
0.4661121, -0.746275, 1.10011, 0, 0, 0, 1, 1,
0.4705394, 1.208106, -0.4328313, 0, 0, 0, 1, 1,
0.4719198, -0.2366638, 2.561704, 0, 0, 0, 1, 1,
0.4731745, 1.337113, 1.634408, 0, 0, 0, 1, 1,
0.4755651, -1.510794, 2.875783, 0, 0, 0, 1, 1,
0.4787514, 0.7306156, -0.1931994, 0, 0, 0, 1, 1,
0.4818359, -0.3869315, 3.130104, 1, 1, 1, 1, 1,
0.483123, -0.4866882, 0.602212, 1, 1, 1, 1, 1,
0.4851457, -0.1261341, 2.669004, 1, 1, 1, 1, 1,
0.4852978, -1.387639, 3.559631, 1, 1, 1, 1, 1,
0.485317, 1.122778, 0.04324324, 1, 1, 1, 1, 1,
0.4873845, -2.567291, 2.712268, 1, 1, 1, 1, 1,
0.4897813, 0.8383607, 0.9425645, 1, 1, 1, 1, 1,
0.4931419, 1.79719, 0.2369258, 1, 1, 1, 1, 1,
0.5008538, -0.9361669, 3.042832, 1, 1, 1, 1, 1,
0.5030373, 0.3450836, 2.045423, 1, 1, 1, 1, 1,
0.5031338, -0.3835545, 1.749698, 1, 1, 1, 1, 1,
0.5031386, 1.86883, 2.161627, 1, 1, 1, 1, 1,
0.5062698, 1.673991, 0.5636219, 1, 1, 1, 1, 1,
0.5076264, -0.2033198, 4.071215, 1, 1, 1, 1, 1,
0.5101935, -0.4629532, 3.947594, 1, 1, 1, 1, 1,
0.5103211, -0.1407537, 1.645739, 0, 0, 1, 1, 1,
0.5105823, 0.3079959, 0.7241146, 1, 0, 0, 1, 1,
0.5129758, -2.08257, 2.546989, 1, 0, 0, 1, 1,
0.5155194, 0.6616941, 0.9186543, 1, 0, 0, 1, 1,
0.5156676, -1.230368, 3.418829, 1, 0, 0, 1, 1,
0.5161063, -0.6385345, 3.802791, 1, 0, 0, 1, 1,
0.5171629, 0.4999812, 1.062977, 0, 0, 0, 1, 1,
0.5200765, -0.437353, 1.295671, 0, 0, 0, 1, 1,
0.5248594, -0.3757474, 3.500184, 0, 0, 0, 1, 1,
0.5298108, 0.2702405, 0.7289523, 0, 0, 0, 1, 1,
0.5333447, -0.4013731, 2.304917, 0, 0, 0, 1, 1,
0.5348915, 0.4380654, 1.417552, 0, 0, 0, 1, 1,
0.53728, -0.4780268, 0.8739312, 0, 0, 0, 1, 1,
0.5379046, -0.91381, 1.600267, 1, 1, 1, 1, 1,
0.5392433, 0.6449233, -0.5202822, 1, 1, 1, 1, 1,
0.539991, -0.374803, 1.970095, 1, 1, 1, 1, 1,
0.5445725, 0.2972221, 0.5358785, 1, 1, 1, 1, 1,
0.5481646, 1.445442, 1.98062, 1, 1, 1, 1, 1,
0.5500929, -1.090784, 4.335023, 1, 1, 1, 1, 1,
0.5519015, 2.207552, -0.5084277, 1, 1, 1, 1, 1,
0.5557663, 2.348155, 0.8121027, 1, 1, 1, 1, 1,
0.5638483, -1.679508, 2.654779, 1, 1, 1, 1, 1,
0.5777065, 1.937396, 0.3826273, 1, 1, 1, 1, 1,
0.5780217, 0.9563695, 1.446594, 1, 1, 1, 1, 1,
0.5831761, -0.4149758, 3.565603, 1, 1, 1, 1, 1,
0.5865735, 0.6568487, 0.6989928, 1, 1, 1, 1, 1,
0.5879912, 0.07723971, 3.486033, 1, 1, 1, 1, 1,
0.5906969, -1.165054, 2.961194, 1, 1, 1, 1, 1,
0.5913131, 0.6428844, 1.899982, 0, 0, 1, 1, 1,
0.5913721, -1.313995, 3.009469, 1, 0, 0, 1, 1,
0.5915806, -0.5366376, 3.215545, 1, 0, 0, 1, 1,
0.5924801, -0.01375502, 1.404712, 1, 0, 0, 1, 1,
0.5987693, 0.2870815, 0.3556752, 1, 0, 0, 1, 1,
0.6030811, 1.418406, 2.211279, 1, 0, 0, 1, 1,
0.6045472, 0.3630201, 2.228073, 0, 0, 0, 1, 1,
0.6063725, 0.2458781, 2.399436, 0, 0, 0, 1, 1,
0.607093, 0.9490114, 2.002253, 0, 0, 0, 1, 1,
0.6079853, -1.200605, 3.766135, 0, 0, 0, 1, 1,
0.6170322, -1.169792, 2.744685, 0, 0, 0, 1, 1,
0.6246711, -0.7182148, 3.152413, 0, 0, 0, 1, 1,
0.6279525, 0.8307872, -0.8967282, 0, 0, 0, 1, 1,
0.6328042, 1.547377, 1.831686, 1, 1, 1, 1, 1,
0.6348419, 0.6233031, 0.6305801, 1, 1, 1, 1, 1,
0.6348631, 1.092511, 1.749955, 1, 1, 1, 1, 1,
0.6360794, 2.05424, 0.06272359, 1, 1, 1, 1, 1,
0.6455162, 0.2794139, 0.7940794, 1, 1, 1, 1, 1,
0.6478378, -1.851442, 0.5780455, 1, 1, 1, 1, 1,
0.6479266, 0.2123837, 0.08248707, 1, 1, 1, 1, 1,
0.6493203, 1.182237, 1.770107, 1, 1, 1, 1, 1,
0.6540966, -0.3571483, 2.33954, 1, 1, 1, 1, 1,
0.6560546, -0.5109406, 2.044341, 1, 1, 1, 1, 1,
0.6572555, 0.9880087, 1.510787, 1, 1, 1, 1, 1,
0.6686488, 0.8702812, 1.291554, 1, 1, 1, 1, 1,
0.6775172, 0.3559589, -0.4122047, 1, 1, 1, 1, 1,
0.6782795, 0.7721928, 1.047053, 1, 1, 1, 1, 1,
0.681523, 1.997575, 1.503814, 1, 1, 1, 1, 1,
0.682068, 2.10833, -1.35607, 0, 0, 1, 1, 1,
0.6844917, 1.06829, 1.946176, 1, 0, 0, 1, 1,
0.6848884, 0.8004743, 2.431023, 1, 0, 0, 1, 1,
0.7029842, -0.6238334, 3.147064, 1, 0, 0, 1, 1,
0.7083336, -0.3723173, 1.68839, 1, 0, 0, 1, 1,
0.7105359, 0.08794517, 1.838663, 1, 0, 0, 1, 1,
0.711046, 0.09582191, 1.744374, 0, 0, 0, 1, 1,
0.7114773, -0.1044115, 1.254244, 0, 0, 0, 1, 1,
0.7119864, 0.8775381, 1.257721, 0, 0, 0, 1, 1,
0.7125151, -0.8719951, 3.140743, 0, 0, 0, 1, 1,
0.7129816, -1.83151, 3.447508, 0, 0, 0, 1, 1,
0.7131582, 1.253572, 0.4289892, 0, 0, 0, 1, 1,
0.7139386, -0.7177685, 3.346857, 0, 0, 0, 1, 1,
0.7162033, 1.353639, 1.851661, 1, 1, 1, 1, 1,
0.7182673, 1.680395, 0.2352555, 1, 1, 1, 1, 1,
0.7301552, 0.6732672, 0.7516742, 1, 1, 1, 1, 1,
0.7347713, -0.6829625, 2.866395, 1, 1, 1, 1, 1,
0.7394383, 0.01135482, 1.743751, 1, 1, 1, 1, 1,
0.743108, -0.8642629, 1.536755, 1, 1, 1, 1, 1,
0.743884, -0.03480583, 1.172292, 1, 1, 1, 1, 1,
0.7501255, -0.8171747, 0.4322352, 1, 1, 1, 1, 1,
0.7522727, 0.4544826, -0.0523751, 1, 1, 1, 1, 1,
0.7531037, 1.859793, -0.2414892, 1, 1, 1, 1, 1,
0.753657, -0.6944922, 1.975691, 1, 1, 1, 1, 1,
0.755398, 0.6325561, 0.3264977, 1, 1, 1, 1, 1,
0.7583152, 0.151878, 0.5814037, 1, 1, 1, 1, 1,
0.7599685, 0.340876, 1.769772, 1, 1, 1, 1, 1,
0.7642897, -1.181272, 3.841915, 1, 1, 1, 1, 1,
0.7682323, -0.9152111, 2.815138, 0, 0, 1, 1, 1,
0.7689357, 0.9651372, 1.105567, 1, 0, 0, 1, 1,
0.7707923, -1.258585, 4.198498, 1, 0, 0, 1, 1,
0.7804072, -0.04629965, 0.9177143, 1, 0, 0, 1, 1,
0.7861305, 0.4305002, 1.460322, 1, 0, 0, 1, 1,
0.7877571, 1.085735, 2.108022, 1, 0, 0, 1, 1,
0.7902629, -0.7120237, 3.114649, 0, 0, 0, 1, 1,
0.796768, -0.9951875, 2.964379, 0, 0, 0, 1, 1,
0.79933, -0.8410211, 3.687511, 0, 0, 0, 1, 1,
0.8024769, 0.2985861, 1.263454, 0, 0, 0, 1, 1,
0.8038457, 1.136254, 0.7071462, 0, 0, 0, 1, 1,
0.8049957, 0.3662236, 1.674705, 0, 0, 0, 1, 1,
0.8089187, 2.01633, 0.3932194, 0, 0, 0, 1, 1,
0.8095002, 0.7059813, 1.579863, 1, 1, 1, 1, 1,
0.8133023, -0.2856917, 1.947881, 1, 1, 1, 1, 1,
0.8197152, 0.3680958, 0.6071745, 1, 1, 1, 1, 1,
0.820709, -0.767983, 3.27021, 1, 1, 1, 1, 1,
0.8217834, 1.345029, 0.6360897, 1, 1, 1, 1, 1,
0.834067, -1.649099, 2.767058, 1, 1, 1, 1, 1,
0.8360173, -0.1504425, 2.682976, 1, 1, 1, 1, 1,
0.8496243, -0.7298082, 0.8167757, 1, 1, 1, 1, 1,
0.8551453, 1.769117, -1.391829, 1, 1, 1, 1, 1,
0.8597558, -1.56676, 3.620599, 1, 1, 1, 1, 1,
0.8637996, -0.2359179, 2.433004, 1, 1, 1, 1, 1,
0.8641756, 1.057141, 0.5967355, 1, 1, 1, 1, 1,
0.8657961, 0.3309856, 1.385558, 1, 1, 1, 1, 1,
0.8679636, 1.609654, 1.307612, 1, 1, 1, 1, 1,
0.8699082, -0.6788998, 1.677081, 1, 1, 1, 1, 1,
0.8737474, 0.1310631, 1.054675, 0, 0, 1, 1, 1,
0.8790752, 0.9023586, -1.234099, 1, 0, 0, 1, 1,
0.8795117, -1.155432, 4.060407, 1, 0, 0, 1, 1,
0.8807606, 0.864862, 1.722725, 1, 0, 0, 1, 1,
0.8822231, 2.077144, 1.341855, 1, 0, 0, 1, 1,
0.8829232, -1.182092, 1.897836, 1, 0, 0, 1, 1,
0.8861442, -1.294707, 2.702115, 0, 0, 0, 1, 1,
0.8896069, -0.415664, 1.161995, 0, 0, 0, 1, 1,
0.9020169, -1.482591, 2.973087, 0, 0, 0, 1, 1,
0.9020885, -0.3482231, 1.077925, 0, 0, 0, 1, 1,
0.9045486, 0.8268186, 1.089326, 0, 0, 0, 1, 1,
0.9081049, -0.375852, 2.015373, 0, 0, 0, 1, 1,
0.9115868, 1.341712, 0.7318494, 0, 0, 0, 1, 1,
0.9155492, -0.2706924, 2.907339, 1, 1, 1, 1, 1,
0.9211942, 3.058053, -0.6961726, 1, 1, 1, 1, 1,
0.9250819, 0.8942291, 1.01582, 1, 1, 1, 1, 1,
0.92654, -1.844138, 3.128024, 1, 1, 1, 1, 1,
0.9267802, -1.694721, 1.183655, 1, 1, 1, 1, 1,
0.9274738, 0.9504758, 1.333218, 1, 1, 1, 1, 1,
0.9277396, 0.8101812, -1.086095, 1, 1, 1, 1, 1,
0.9283009, -1.20445, 3.506677, 1, 1, 1, 1, 1,
0.9326457, 0.4457541, 2.326568, 1, 1, 1, 1, 1,
0.9333286, -0.5635992, 1.176967, 1, 1, 1, 1, 1,
0.9395738, 2.222849, -0.3779089, 1, 1, 1, 1, 1,
0.9497235, -0.528115, 2.223255, 1, 1, 1, 1, 1,
0.9506786, -0.01567939, 0.08369352, 1, 1, 1, 1, 1,
0.9523605, -1.060966, 2.598989, 1, 1, 1, 1, 1,
0.9529329, -0.05155267, 3.112812, 1, 1, 1, 1, 1,
0.9561659, -0.9799143, 1.504269, 0, 0, 1, 1, 1,
0.957604, -1.677629, 3.48667, 1, 0, 0, 1, 1,
0.9602302, 1.560213, 0.3282127, 1, 0, 0, 1, 1,
0.9615513, -1.422187, 1.091244, 1, 0, 0, 1, 1,
0.9624516, -0.9205972, 1.583157, 1, 0, 0, 1, 1,
0.9633605, -0.6475636, 1.102314, 1, 0, 0, 1, 1,
0.9651929, 0.6252836, 2.718538, 0, 0, 0, 1, 1,
0.9673116, 0.4464922, 1.793784, 0, 0, 0, 1, 1,
0.9673384, -0.7654299, 2.051478, 0, 0, 0, 1, 1,
0.9680921, 0.6255884, 1.090243, 0, 0, 0, 1, 1,
0.9719394, -0.06979237, 2.289328, 0, 0, 0, 1, 1,
0.9741328, 2.030082, -1.053711, 0, 0, 0, 1, 1,
0.9788979, 0.6529253, -0.2289484, 0, 0, 0, 1, 1,
0.9819468, -0.7520515, 2.118846, 1, 1, 1, 1, 1,
1.001388, -0.357775, 1.009488, 1, 1, 1, 1, 1,
1.007252, -0.6559505, 2.057721, 1, 1, 1, 1, 1,
1.008109, 1.804863, 0.6851164, 1, 1, 1, 1, 1,
1.011901, -0.329412, 1.465676, 1, 1, 1, 1, 1,
1.014547, -0.9218799, 1.703431, 1, 1, 1, 1, 1,
1.027692, -0.8851689, 2.264578, 1, 1, 1, 1, 1,
1.033422, -0.3279545, 2.346281, 1, 1, 1, 1, 1,
1.036824, 1.445135, 0.3792382, 1, 1, 1, 1, 1,
1.040999, -0.5809889, 2.768165, 1, 1, 1, 1, 1,
1.042072, 0.6311026, 1.578994, 1, 1, 1, 1, 1,
1.043748, 0.09366868, 3.195196, 1, 1, 1, 1, 1,
1.046195, -1.781433, 2.878847, 1, 1, 1, 1, 1,
1.060108, 0.6121399, 1.796157, 1, 1, 1, 1, 1,
1.06268, 1.99006, 0.469416, 1, 1, 1, 1, 1,
1.067212, -0.3003224, 1.03755, 0, 0, 1, 1, 1,
1.079502, -0.5579086, 2.486885, 1, 0, 0, 1, 1,
1.081393, 0.3112559, 0.9609154, 1, 0, 0, 1, 1,
1.087444, -1.383278, 1.556705, 1, 0, 0, 1, 1,
1.089555, 1.673952, 2.547957, 1, 0, 0, 1, 1,
1.089875, -1.072854, 2.594056, 1, 0, 0, 1, 1,
1.094147, -0.8086945, 4.33216, 0, 0, 0, 1, 1,
1.094833, 0.5351446, 0.7790213, 0, 0, 0, 1, 1,
1.103226, -0.703851, 2.206491, 0, 0, 0, 1, 1,
1.104661, 0.3922927, 2.780366, 0, 0, 0, 1, 1,
1.105808, -1.233466, 2.032137, 0, 0, 0, 1, 1,
1.108357, -0.09889833, 0.3720121, 0, 0, 0, 1, 1,
1.110712, 0.7097549, 0.9158571, 0, 0, 0, 1, 1,
1.13134, 0.5818356, -1.257653, 1, 1, 1, 1, 1,
1.14682, 0.9994804, 0.01756406, 1, 1, 1, 1, 1,
1.148176, 0.0941557, 3.286895, 1, 1, 1, 1, 1,
1.15028, -0.04075245, 1.700208, 1, 1, 1, 1, 1,
1.151551, 0.4049214, 0.4137401, 1, 1, 1, 1, 1,
1.155615, 0.2321872, 1.518623, 1, 1, 1, 1, 1,
1.159701, -0.1352694, 1.191756, 1, 1, 1, 1, 1,
1.16403, -0.1328099, 3.593808, 1, 1, 1, 1, 1,
1.164557, 0.7348189, 1.04462, 1, 1, 1, 1, 1,
1.1677, 0.4969328, 1.286343, 1, 1, 1, 1, 1,
1.175506, 0.0567696, 1.056581, 1, 1, 1, 1, 1,
1.184928, 0.01619964, 2.256984, 1, 1, 1, 1, 1,
1.190619, -0.04844262, 2.419355, 1, 1, 1, 1, 1,
1.203128, 1.329757, 1.571115, 1, 1, 1, 1, 1,
1.211595, -0.1234493, 1.27718, 1, 1, 1, 1, 1,
1.215916, 1.464129, -1.269555, 0, 0, 1, 1, 1,
1.231996, -0.184856, 2.391233, 1, 0, 0, 1, 1,
1.237293, -1.872386, 4.503159, 1, 0, 0, 1, 1,
1.245262, 0.4961661, 1.724773, 1, 0, 0, 1, 1,
1.246238, 0.7732792, 2.284792, 1, 0, 0, 1, 1,
1.246629, -2.075789, 3.537808, 1, 0, 0, 1, 1,
1.252398, 2.695665, 1.584045, 0, 0, 0, 1, 1,
1.256999, 1.360668, -1.354111, 0, 0, 0, 1, 1,
1.260507, -2.846171, 3.745564, 0, 0, 0, 1, 1,
1.267827, -1.019373, 2.446505, 0, 0, 0, 1, 1,
1.272772, 2.811637, 1.043247, 0, 0, 0, 1, 1,
1.277845, -0.07275226, 0.1499745, 0, 0, 0, 1, 1,
1.282497, -1.135935, 2.785303, 0, 0, 0, 1, 1,
1.291819, 1.640634, 0.2076801, 1, 1, 1, 1, 1,
1.293362, -0.06511126, 1.11837, 1, 1, 1, 1, 1,
1.311236, 0.01524691, 4.019562, 1, 1, 1, 1, 1,
1.311415, -0.09722329, 2.911135, 1, 1, 1, 1, 1,
1.325957, -0.9527335, 1.805584, 1, 1, 1, 1, 1,
1.334193, -1.080242, 2.710188, 1, 1, 1, 1, 1,
1.335264, 1.150624, 0.5443272, 1, 1, 1, 1, 1,
1.348575, -0.02634, 1.675133, 1, 1, 1, 1, 1,
1.353242, -0.7896856, 3.083367, 1, 1, 1, 1, 1,
1.357157, -0.09931388, 0.5230846, 1, 1, 1, 1, 1,
1.369625, 0.4931165, 0.8136602, 1, 1, 1, 1, 1,
1.370691, -1.008536, 2.272797, 1, 1, 1, 1, 1,
1.382367, -0.2129461, 2.742106, 1, 1, 1, 1, 1,
1.395503, -1.340561, 0.2746008, 1, 1, 1, 1, 1,
1.400153, -0.3050302, 0.8603162, 1, 1, 1, 1, 1,
1.40712, 1.176778, 2.070504, 0, 0, 1, 1, 1,
1.409129, -0.1968707, 1.804549, 1, 0, 0, 1, 1,
1.417449, 0.1057369, 1.244141, 1, 0, 0, 1, 1,
1.430508, 1.901854, -0.2034603, 1, 0, 0, 1, 1,
1.47071, 0.7627992, 0.5796232, 1, 0, 0, 1, 1,
1.473246, -0.04306788, 1.57595, 1, 0, 0, 1, 1,
1.478464, -0.5140794, -0.6702837, 0, 0, 0, 1, 1,
1.490271, 0.1379827, 3.303011, 0, 0, 0, 1, 1,
1.503839, 1.342704, -0.4570189, 0, 0, 0, 1, 1,
1.513878, -0.1568847, 2.080848, 0, 0, 0, 1, 1,
1.522626, -0.2605322, 2.310157, 0, 0, 0, 1, 1,
1.534448, 0.8370184, 1.831908, 0, 0, 0, 1, 1,
1.537, 2.678764, -0.6757466, 0, 0, 0, 1, 1,
1.54489, -0.3095799, 1.670337, 1, 1, 1, 1, 1,
1.558892, -0.06002313, 1.548373, 1, 1, 1, 1, 1,
1.581159, 0.266403, 0.2931865, 1, 1, 1, 1, 1,
1.587869, -1.127313, 0.7521362, 1, 1, 1, 1, 1,
1.590947, 0.3508801, 1.721333, 1, 1, 1, 1, 1,
1.59701, -0.3499239, 2.123517, 1, 1, 1, 1, 1,
1.59941, -0.8773264, 2.912338, 1, 1, 1, 1, 1,
1.600842, 0.07552197, 3.790356, 1, 1, 1, 1, 1,
1.6158, 2.964093, 0.5059155, 1, 1, 1, 1, 1,
1.627305, -0.2222403, 1.446296, 1, 1, 1, 1, 1,
1.629428, -0.7381529, 2.416541, 1, 1, 1, 1, 1,
1.630188, -0.6236252, 2.999663, 1, 1, 1, 1, 1,
1.631201, -1.04817, 0.7328865, 1, 1, 1, 1, 1,
1.684175, -0.1196641, 2.783725, 1, 1, 1, 1, 1,
1.686518, -0.250813, 1.05488, 1, 1, 1, 1, 1,
1.687407, -0.6964899, 1.583147, 0, 0, 1, 1, 1,
1.717755, 0.2548964, 1.319551, 1, 0, 0, 1, 1,
1.730311, -0.227216, 1.438838, 1, 0, 0, 1, 1,
1.747584, 0.5665729, 3.014616, 1, 0, 0, 1, 1,
1.749197, 0.6297917, 1.199292, 1, 0, 0, 1, 1,
1.753655, 0.02212861, 2.027899, 1, 0, 0, 1, 1,
1.757867, 0.2927044, 2.404563, 0, 0, 0, 1, 1,
1.76497, -0.5351844, 0.9591641, 0, 0, 0, 1, 1,
1.811953, 0.4412495, 1.551683, 0, 0, 0, 1, 1,
1.813063, -0.8359346, 3.111286, 0, 0, 0, 1, 1,
1.818179, 1.367667, 0.7291444, 0, 0, 0, 1, 1,
1.818695, -0.8682837, 2.231846, 0, 0, 0, 1, 1,
1.827676, 0.4007258, 1.96298, 0, 0, 0, 1, 1,
1.862556, 2.60827, 1.10107, 1, 1, 1, 1, 1,
1.878847, -1.756056, 4.331931, 1, 1, 1, 1, 1,
1.893948, 0.2021596, 0.69015, 1, 1, 1, 1, 1,
1.912995, 0.2717466, 2.596658, 1, 1, 1, 1, 1,
1.917168, -0.8227152, 3.045444, 1, 1, 1, 1, 1,
1.917403, -0.8038517, 0.9662915, 1, 1, 1, 1, 1,
1.933517, 1.131184, -0.9767272, 1, 1, 1, 1, 1,
1.936542, 0.5589871, 1.535527, 1, 1, 1, 1, 1,
1.950405, 0.1262049, 1.730459, 1, 1, 1, 1, 1,
1.962695, 1.017703, 0.971288, 1, 1, 1, 1, 1,
1.964425, -0.2265746, 1.402968, 1, 1, 1, 1, 1,
1.982863, -1.095923, 1.850832, 1, 1, 1, 1, 1,
2.004058, -0.6085132, 0.9573604, 1, 1, 1, 1, 1,
2.005325, 0.145902, 1.332583, 1, 1, 1, 1, 1,
2.026594, 0.7326535, 2.127242, 1, 1, 1, 1, 1,
2.05014, -0.949742, 2.633358, 0, 0, 1, 1, 1,
2.059746, 1.499477, 0.5031624, 1, 0, 0, 1, 1,
2.15123, -1.217633, 3.08654, 1, 0, 0, 1, 1,
2.153154, -1.269702, 1.784988, 1, 0, 0, 1, 1,
2.156839, 0.1444798, 2.48718, 1, 0, 0, 1, 1,
2.162971, -0.6720561, 1.571742, 1, 0, 0, 1, 1,
2.21479, -0.1238051, 1.820332, 0, 0, 0, 1, 1,
2.215114, 0.3028318, 3.783749, 0, 0, 0, 1, 1,
2.270063, 0.2960484, 2.55251, 0, 0, 0, 1, 1,
2.308195, 0.6900064, -0.4653962, 0, 0, 0, 1, 1,
2.323722, 0.628521, 1.563325, 0, 0, 0, 1, 1,
2.490672, 0.4031249, 1.677921, 0, 0, 0, 1, 1,
2.491981, -0.3395681, 1.188946, 0, 0, 0, 1, 1,
2.585023, 0.21264, 1.086974, 1, 1, 1, 1, 1,
2.658309, 0.001901997, 1.586764, 1, 1, 1, 1, 1,
2.700393, 0.9466743, 2.396711, 1, 1, 1, 1, 1,
2.87047, 1.151661, 2.763362, 1, 1, 1, 1, 1,
2.954191, 0.03224188, -1.097434, 1, 1, 1, 1, 1,
3.183083, -0.8368587, -0.3587976, 1, 1, 1, 1, 1,
3.384851, 0.812486, 3.013125, 1, 1, 1, 1, 1
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
var radius = 10.11502;
var distance = 35.52858;
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
mvMatrix.translate( 0.147712, -0.1060171, -0.4566648 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.52858);
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
