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
-3.44343, -0.1068925, -2.02961, 1, 0, 0, 1,
-3.056875, -0.1020687, -2.029805, 1, 0.007843138, 0, 1,
-3.000525, -0.9706613, -0.958317, 1, 0.01176471, 0, 1,
-2.987927, -0.4256936, -1.66008, 1, 0.01960784, 0, 1,
-2.922465, -0.3819653, -0.6922824, 1, 0.02352941, 0, 1,
-2.581344, -0.4075387, -2.895271, 1, 0.03137255, 0, 1,
-2.576846, 0.7357795, 0.2422733, 1, 0.03529412, 0, 1,
-2.522079, 0.4996618, -0.2248904, 1, 0.04313726, 0, 1,
-2.476547, 0.1912877, -2.1813, 1, 0.04705882, 0, 1,
-2.474683, -0.8991348, -1.485906, 1, 0.05490196, 0, 1,
-2.427593, 0.8008065, -2.103901, 1, 0.05882353, 0, 1,
-2.369292, 1.234831, -0.7616528, 1, 0.06666667, 0, 1,
-2.233912, 0.2561204, -0.5533935, 1, 0.07058824, 0, 1,
-2.232375, 0.4988336, -1.820047, 1, 0.07843138, 0, 1,
-2.214845, 0.2881402, -1.405418, 1, 0.08235294, 0, 1,
-2.2091, -1.072423, -4.198901, 1, 0.09019608, 0, 1,
-2.204658, 0.4675333, -1.784025, 1, 0.09411765, 0, 1,
-2.1839, 0.9383643, -0.0336959, 1, 0.1019608, 0, 1,
-2.180164, 0.06963721, -2.690712, 1, 0.1098039, 0, 1,
-2.145074, -0.3465287, -2.818348, 1, 0.1137255, 0, 1,
-2.111484, 0.3244494, -3.103608, 1, 0.1215686, 0, 1,
-2.090328, -1.501504, -2.248092, 1, 0.1254902, 0, 1,
-2.084538, -0.9931739, -2.000691, 1, 0.1333333, 0, 1,
-2.014824, 0.8280672, -2.364372, 1, 0.1372549, 0, 1,
-1.996335, -3.014011, -3.7994, 1, 0.145098, 0, 1,
-1.969022, 0.2946624, -2.046429, 1, 0.1490196, 0, 1,
-1.968547, -0.8427169, -1.90025, 1, 0.1568628, 0, 1,
-1.965604, -1.337267, -2.846481, 1, 0.1607843, 0, 1,
-1.952413, -0.1474015, -1.725824, 1, 0.1686275, 0, 1,
-1.947935, -0.809366, -1.223949, 1, 0.172549, 0, 1,
-1.943071, 0.03625055, -1.646898, 1, 0.1803922, 0, 1,
-1.906115, -0.1921101, -1.796509, 1, 0.1843137, 0, 1,
-1.906112, -2.017485, -1.434089, 1, 0.1921569, 0, 1,
-1.896967, -1.244008, -3.528943, 1, 0.1960784, 0, 1,
-1.879401, -0.1963653, -1.319386, 1, 0.2039216, 0, 1,
-1.877657, 0.9781549, -2.392059, 1, 0.2117647, 0, 1,
-1.873434, -0.147289, -2.930145, 1, 0.2156863, 0, 1,
-1.858338, 0.24679, -0.9976557, 1, 0.2235294, 0, 1,
-1.791572, -0.7322528, -2.499941, 1, 0.227451, 0, 1,
-1.789753, 2.117633, -1.46379, 1, 0.2352941, 0, 1,
-1.787602, 0.0606722, -2.019088, 1, 0.2392157, 0, 1,
-1.765005, 0.5733428, -1.527313, 1, 0.2470588, 0, 1,
-1.760699, 0.9293072, -0.8312461, 1, 0.2509804, 0, 1,
-1.744769, 0.8910418, -1.319754, 1, 0.2588235, 0, 1,
-1.740847, 0.9631973, -1.776331, 1, 0.2627451, 0, 1,
-1.736851, 0.4260407, -1.571939, 1, 0.2705882, 0, 1,
-1.695501, 0.1484095, -1.351363, 1, 0.2745098, 0, 1,
-1.661927, -2.505302, -2.637933, 1, 0.282353, 0, 1,
-1.645787, -0.5531791, -3.927396, 1, 0.2862745, 0, 1,
-1.638843, -0.2584937, -1.851224, 1, 0.2941177, 0, 1,
-1.633106, -1.878234, -2.188274, 1, 0.3019608, 0, 1,
-1.63297, -0.4227091, -2.112139, 1, 0.3058824, 0, 1,
-1.628117, 2.067923, -0.4365875, 1, 0.3137255, 0, 1,
-1.603609, 0.2648894, -3.593177, 1, 0.3176471, 0, 1,
-1.572544, -0.2343014, 0.001247337, 1, 0.3254902, 0, 1,
-1.570105, -0.3519549, -1.023896, 1, 0.3294118, 0, 1,
-1.568557, -0.1123171, -0.7021317, 1, 0.3372549, 0, 1,
-1.566414, 1.257889, -2.274926, 1, 0.3411765, 0, 1,
-1.557852, 1.108996, 0.5309662, 1, 0.3490196, 0, 1,
-1.5567, -0.08438685, -2.053015, 1, 0.3529412, 0, 1,
-1.540855, 0.1589042, -2.791144, 1, 0.3607843, 0, 1,
-1.530377, 0.1664575, 0.246034, 1, 0.3647059, 0, 1,
-1.528248, -1.680826, -2.183014, 1, 0.372549, 0, 1,
-1.524738, 0.2100718, -1.985849, 1, 0.3764706, 0, 1,
-1.506092, -0.9589765, -0.1580421, 1, 0.3843137, 0, 1,
-1.505114, 0.2571189, -1.811088, 1, 0.3882353, 0, 1,
-1.504841, 1.123543, 0.3494265, 1, 0.3960784, 0, 1,
-1.504219, -0.1568594, -3.071532, 1, 0.4039216, 0, 1,
-1.499968, -0.1615947, -1.279993, 1, 0.4078431, 0, 1,
-1.499332, 0.8292147, -1.821877, 1, 0.4156863, 0, 1,
-1.497109, -0.4795453, -2.886587, 1, 0.4196078, 0, 1,
-1.489543, 1.052944, -1.014813, 1, 0.427451, 0, 1,
-1.470967, -0.0208823, -3.338219, 1, 0.4313726, 0, 1,
-1.469911, -0.0573151, -1.831833, 1, 0.4392157, 0, 1,
-1.463713, -1.002968, -2.668348, 1, 0.4431373, 0, 1,
-1.450423, 1.172195, -1.349935, 1, 0.4509804, 0, 1,
-1.442915, 0.3513368, -0.7123314, 1, 0.454902, 0, 1,
-1.433297, -0.788148, -2.598056, 1, 0.4627451, 0, 1,
-1.409189, -0.2055425, -1.581846, 1, 0.4666667, 0, 1,
-1.4054, 2.098744, -0.3970987, 1, 0.4745098, 0, 1,
-1.398847, 0.5736454, -0.8025196, 1, 0.4784314, 0, 1,
-1.370757, -0.8122025, -2.746372, 1, 0.4862745, 0, 1,
-1.363043, -0.02350632, -1.692052, 1, 0.4901961, 0, 1,
-1.358174, 0.2376396, -1.044083, 1, 0.4980392, 0, 1,
-1.355191, 0.7146911, 0.5029433, 1, 0.5058824, 0, 1,
-1.344431, -0.4638488, -1.011421, 1, 0.509804, 0, 1,
-1.343015, -0.5375424, -2.843213, 1, 0.5176471, 0, 1,
-1.338625, -1.403897, -3.693104, 1, 0.5215687, 0, 1,
-1.334525, 0.9446683, -1.059731, 1, 0.5294118, 0, 1,
-1.317604, 0.2525138, -2.344887, 1, 0.5333334, 0, 1,
-1.314924, 2.542111, -0.758002, 1, 0.5411765, 0, 1,
-1.307529, 0.9030529, -1.173133, 1, 0.5450981, 0, 1,
-1.303303, -0.02596091, -1.618972, 1, 0.5529412, 0, 1,
-1.288375, -0.1565107, -2.334053, 1, 0.5568628, 0, 1,
-1.284377, -0.3563074, -1.526063, 1, 0.5647059, 0, 1,
-1.279667, -0.09266566, -0.771762, 1, 0.5686275, 0, 1,
-1.270831, 1.344438, -0.7508039, 1, 0.5764706, 0, 1,
-1.26981, -0.3933517, -2.665196, 1, 0.5803922, 0, 1,
-1.267366, -0.4555756, -1.555218, 1, 0.5882353, 0, 1,
-1.253825, 0.8141459, -0.8748446, 1, 0.5921569, 0, 1,
-1.243284, 1.711182, -0.07646386, 1, 0.6, 0, 1,
-1.234492, -2.388816, -1.655448, 1, 0.6078432, 0, 1,
-1.228052, 0.4658588, -2.527409, 1, 0.6117647, 0, 1,
-1.224261, -0.7487515, -1.833314, 1, 0.6196079, 0, 1,
-1.220446, -0.01529914, -1.610982, 1, 0.6235294, 0, 1,
-1.196913, 0.6645973, 0.4918066, 1, 0.6313726, 0, 1,
-1.185277, -1.957853, -2.245683, 1, 0.6352941, 0, 1,
-1.171522, 0.454596, -1.687909, 1, 0.6431373, 0, 1,
-1.161173, 2.434401, -0.7177256, 1, 0.6470588, 0, 1,
-1.155829, 0.09850503, -2.384646, 1, 0.654902, 0, 1,
-1.153854, 1.157319, -2.171706, 1, 0.6588235, 0, 1,
-1.144088, -0.325552, -2.485352, 1, 0.6666667, 0, 1,
-1.13687, 1.530906, -1.116055, 1, 0.6705883, 0, 1,
-1.135796, -1.139678, -1.585167, 1, 0.6784314, 0, 1,
-1.131283, 0.4772958, -0.09181635, 1, 0.682353, 0, 1,
-1.131117, -0.9664375, -3.43304, 1, 0.6901961, 0, 1,
-1.10963, 0.1314176, -3.113188, 1, 0.6941177, 0, 1,
-1.093942, 1.661301, -1.65871, 1, 0.7019608, 0, 1,
-1.092446, 1.11614, -1.068722, 1, 0.7098039, 0, 1,
-1.088866, 2.223809, -0.3122682, 1, 0.7137255, 0, 1,
-1.088579, -0.05933009, -2.180024, 1, 0.7215686, 0, 1,
-1.078443, 0.9507992, -2.242618, 1, 0.7254902, 0, 1,
-1.073303, 0.559024, -2.41078, 1, 0.7333333, 0, 1,
-1.070034, -0.6045156, -2.146757, 1, 0.7372549, 0, 1,
-1.065185, -1.317978, -3.420072, 1, 0.7450981, 0, 1,
-1.05452, 0.9916223, -0.8305488, 1, 0.7490196, 0, 1,
-1.045596, -0.003755753, -1.361903, 1, 0.7568628, 0, 1,
-1.04554, -1.014105, -2.645948, 1, 0.7607843, 0, 1,
-1.043136, -0.6777234, -1.27751, 1, 0.7686275, 0, 1,
-1.038547, 0.7422147, -1.578485, 1, 0.772549, 0, 1,
-1.034685, 0.04846126, -0.01440245, 1, 0.7803922, 0, 1,
-1.033879, 1.8307, 1.207388, 1, 0.7843137, 0, 1,
-1.032621, 0.6701064, -0.9373177, 1, 0.7921569, 0, 1,
-1.031659, -0.8788562, -1.046231, 1, 0.7960784, 0, 1,
-1.02719, 0.6360736, -1.039506, 1, 0.8039216, 0, 1,
-1.022954, -1.386449, -2.493524, 1, 0.8117647, 0, 1,
-1.016477, 1.429089, -0.2132596, 1, 0.8156863, 0, 1,
-1.013855, -0.3723377, -2.903933, 1, 0.8235294, 0, 1,
-1.012635, 0.3539625, -3.041305, 1, 0.827451, 0, 1,
-1.005267, -1.406489, -3.429584, 1, 0.8352941, 0, 1,
-1.004033, 0.9110211, -3.71166, 1, 0.8392157, 0, 1,
-1.00027, -2.265074, -1.110818, 1, 0.8470588, 0, 1,
-0.9995964, -1.081877, -2.574288, 1, 0.8509804, 0, 1,
-0.9980555, 0.2163525, -2.485488, 1, 0.8588235, 0, 1,
-0.9932256, 0.558088, 0.4591133, 1, 0.8627451, 0, 1,
-0.9931462, 0.3118539, -3.087452, 1, 0.8705882, 0, 1,
-0.9872949, 0.3030896, -1.991114, 1, 0.8745098, 0, 1,
-0.9865338, 0.323011, -1.619289, 1, 0.8823529, 0, 1,
-0.9832529, 0.3703107, -1.380803, 1, 0.8862745, 0, 1,
-0.9823824, -0.9711655, -3.113896, 1, 0.8941177, 0, 1,
-0.9777755, 1.876053, -0.2229055, 1, 0.8980392, 0, 1,
-0.9771669, -0.6915688, -2.677294, 1, 0.9058824, 0, 1,
-0.9670786, -0.3691559, -2.029141, 1, 0.9137255, 0, 1,
-0.9670172, 0.9240825, 0.7774252, 1, 0.9176471, 0, 1,
-0.9588705, 1.95142, -1.656672, 1, 0.9254902, 0, 1,
-0.95671, 0.146586, -1.834154, 1, 0.9294118, 0, 1,
-0.9399328, -0.4191273, -2.403, 1, 0.9372549, 0, 1,
-0.9310534, -0.5906683, -0.4748307, 1, 0.9411765, 0, 1,
-0.9298859, 1.104652, 0.03118532, 1, 0.9490196, 0, 1,
-0.9274915, 1.617283, 0.1722035, 1, 0.9529412, 0, 1,
-0.9274461, 2.578736, -0.5421561, 1, 0.9607843, 0, 1,
-0.9245889, -2.208472, -4.477565, 1, 0.9647059, 0, 1,
-0.9184052, 0.2850536, -0.7753661, 1, 0.972549, 0, 1,
-0.9156889, 1.323933, -2.532869, 1, 0.9764706, 0, 1,
-0.912823, 1.706601, -0.7988027, 1, 0.9843137, 0, 1,
-0.9095949, -1.190331, -1.662409, 1, 0.9882353, 0, 1,
-0.9091121, -1.843302, -2.321174, 1, 0.9960784, 0, 1,
-0.8985904, -0.1991076, -1.195598, 0.9960784, 1, 0, 1,
-0.8963624, -0.2797274, -0.7306174, 0.9921569, 1, 0, 1,
-0.8954846, -0.8582915, -0.3171765, 0.9843137, 1, 0, 1,
-0.8936258, 1.372484, 0.3212626, 0.9803922, 1, 0, 1,
-0.890715, 0.3320231, -2.381893, 0.972549, 1, 0, 1,
-0.8905497, -1.902543, -3.126971, 0.9686275, 1, 0, 1,
-0.8900791, 0.08820414, -2.627565, 0.9607843, 1, 0, 1,
-0.8741538, -1.707882, -3.301082, 0.9568627, 1, 0, 1,
-0.8740911, 0.8615364, 0.2682219, 0.9490196, 1, 0, 1,
-0.8721408, -0.8411557, -3.171277, 0.945098, 1, 0, 1,
-0.8714169, 0.744094, -1.055317, 0.9372549, 1, 0, 1,
-0.8695573, -1.026419, -2.347764, 0.9333333, 1, 0, 1,
-0.8685002, -0.8923106, -3.812331, 0.9254902, 1, 0, 1,
-0.8655591, -0.161768, -2.229395, 0.9215686, 1, 0, 1,
-0.8641546, 0.5185373, -0.5047094, 0.9137255, 1, 0, 1,
-0.8637182, 0.5334548, -2.114983, 0.9098039, 1, 0, 1,
-0.8611274, -1.110171, -3.041439, 0.9019608, 1, 0, 1,
-0.851448, 0.06612605, -0.9405944, 0.8941177, 1, 0, 1,
-0.8497059, 0.2462559, -2.021564, 0.8901961, 1, 0, 1,
-0.8399236, -2.254358, -1.699813, 0.8823529, 1, 0, 1,
-0.8377303, -1.265419, -2.088971, 0.8784314, 1, 0, 1,
-0.8365501, -0.5193982, -1.750318, 0.8705882, 1, 0, 1,
-0.8340415, -0.439989, -1.798023, 0.8666667, 1, 0, 1,
-0.8306455, -1.119271, -4.00991, 0.8588235, 1, 0, 1,
-0.8280841, -1.097066, -3.583098, 0.854902, 1, 0, 1,
-0.8218257, -0.7086149, -0.3154347, 0.8470588, 1, 0, 1,
-0.8208279, -0.1037726, -0.6685066, 0.8431373, 1, 0, 1,
-0.8175388, 0.7976005, -1.433064, 0.8352941, 1, 0, 1,
-0.8153286, -0.4497665, -0.9729744, 0.8313726, 1, 0, 1,
-0.8119779, -0.5410507, -1.533538, 0.8235294, 1, 0, 1,
-0.8115191, -1.288971, -3.766109, 0.8196079, 1, 0, 1,
-0.8088152, -0.4903656, -1.014259, 0.8117647, 1, 0, 1,
-0.8066349, -0.9534856, -3.541434, 0.8078431, 1, 0, 1,
-0.8058884, 0.4570251, -1.560707, 0.8, 1, 0, 1,
-0.8053699, -1.262688, -2.701231, 0.7921569, 1, 0, 1,
-0.8028924, 1.495148, -0.0717845, 0.7882353, 1, 0, 1,
-0.8006505, -0.9025562, -1.247133, 0.7803922, 1, 0, 1,
-0.7948604, 0.02741926, -1.928584, 0.7764706, 1, 0, 1,
-0.7794148, 0.5861965, -1.177487, 0.7686275, 1, 0, 1,
-0.7693192, -0.4638042, -0.9955969, 0.7647059, 1, 0, 1,
-0.7692585, 1.560298, 1.234318, 0.7568628, 1, 0, 1,
-0.7685459, 0.7378296, -0.2075536, 0.7529412, 1, 0, 1,
-0.7677548, 0.5535167, -1.228465, 0.7450981, 1, 0, 1,
-0.7667621, -0.3120956, -2.276464, 0.7411765, 1, 0, 1,
-0.7656593, 1.031437, -0.003504067, 0.7333333, 1, 0, 1,
-0.7650919, -0.03338145, -1.175912, 0.7294118, 1, 0, 1,
-0.7613476, -0.6431892, -1.153957, 0.7215686, 1, 0, 1,
-0.7570269, 0.154505, -1.869606, 0.7176471, 1, 0, 1,
-0.7565158, -0.7447092, -2.316476, 0.7098039, 1, 0, 1,
-0.7563564, 0.09624118, -1.515492, 0.7058824, 1, 0, 1,
-0.7549988, -1.035147, -2.413159, 0.6980392, 1, 0, 1,
-0.7538002, -0.3781924, -1.224072, 0.6901961, 1, 0, 1,
-0.751038, -0.372082, -1.321502, 0.6862745, 1, 0, 1,
-0.7475772, 0.4254396, -1.115011, 0.6784314, 1, 0, 1,
-0.7473357, 0.1460389, -1.662729, 0.6745098, 1, 0, 1,
-0.7366041, -0.9485689, -2.006136, 0.6666667, 1, 0, 1,
-0.7351647, -0.6627873, -2.228058, 0.6627451, 1, 0, 1,
-0.7318413, -0.6897238, -0.1517179, 0.654902, 1, 0, 1,
-0.7263837, -0.5835412, -0.88207, 0.6509804, 1, 0, 1,
-0.7198814, -0.4159413, -2.260313, 0.6431373, 1, 0, 1,
-0.7198067, 0.08871738, -2.225331, 0.6392157, 1, 0, 1,
-0.7187592, -0.127889, -2.088105, 0.6313726, 1, 0, 1,
-0.7113095, -0.07210594, -2.411443, 0.627451, 1, 0, 1,
-0.7106342, 0.8382873, -1.204513, 0.6196079, 1, 0, 1,
-0.7103605, -1.399656, -3.960237, 0.6156863, 1, 0, 1,
-0.7063078, 0.6267362, -0.7610547, 0.6078432, 1, 0, 1,
-0.7060979, 1.136583, 0.6981192, 0.6039216, 1, 0, 1,
-0.7011768, 0.05396965, -0.5823016, 0.5960785, 1, 0, 1,
-0.6980972, -1.465616, -2.224685, 0.5882353, 1, 0, 1,
-0.6966993, -1.130681, -1.310221, 0.5843138, 1, 0, 1,
-0.6961684, -0.03441047, -0.1868602, 0.5764706, 1, 0, 1,
-0.6942157, -0.2837033, -1.810358, 0.572549, 1, 0, 1,
-0.6923391, 0.2168768, -1.631732, 0.5647059, 1, 0, 1,
-0.6916346, -1.68927, -2.573156, 0.5607843, 1, 0, 1,
-0.6865315, 0.1511695, -0.8606228, 0.5529412, 1, 0, 1,
-0.6808711, 1.010419, -1.166125, 0.5490196, 1, 0, 1,
-0.6769093, 1.683241, 0.4077758, 0.5411765, 1, 0, 1,
-0.6759598, 1.161078, -0.8171195, 0.5372549, 1, 0, 1,
-0.6724911, -1.846382, -3.195142, 0.5294118, 1, 0, 1,
-0.6705925, -0.9495754, -2.693008, 0.5254902, 1, 0, 1,
-0.6667375, 0.06037576, -0.1480474, 0.5176471, 1, 0, 1,
-0.6665801, -0.1271286, -2.459692, 0.5137255, 1, 0, 1,
-0.657397, -0.5765426, -3.677158, 0.5058824, 1, 0, 1,
-0.6434576, 1.291027, -0.4898697, 0.5019608, 1, 0, 1,
-0.6402457, -0.9913985, -2.797422, 0.4941176, 1, 0, 1,
-0.6355947, -0.03663014, 0.5739977, 0.4862745, 1, 0, 1,
-0.6354128, -0.1454643, -1.093996, 0.4823529, 1, 0, 1,
-0.6229416, 0.1449025, -1.04543, 0.4745098, 1, 0, 1,
-0.6224893, -0.2897011, -2.45892, 0.4705882, 1, 0, 1,
-0.6209304, 1.119026, -1.982138, 0.4627451, 1, 0, 1,
-0.6185357, -0.490827, -4.527473, 0.4588235, 1, 0, 1,
-0.6108174, 1.336973, -1.081344, 0.4509804, 1, 0, 1,
-0.608803, -2.15293, -4.180741, 0.4470588, 1, 0, 1,
-0.6080577, -0.9199834, -3.506453, 0.4392157, 1, 0, 1,
-0.6064985, 0.6963553, -0.1399498, 0.4352941, 1, 0, 1,
-0.6052602, 0.3733035, -2.415519, 0.427451, 1, 0, 1,
-0.6012034, 0.6022537, -2.285197, 0.4235294, 1, 0, 1,
-0.5990545, -0.1006302, -3.270214, 0.4156863, 1, 0, 1,
-0.598895, 1.079221, -2.4641, 0.4117647, 1, 0, 1,
-0.5984645, 0.3046823, 0.8353513, 0.4039216, 1, 0, 1,
-0.5983144, -2.222332, -3.819778, 0.3960784, 1, 0, 1,
-0.5949628, -0.997639, -2.853751, 0.3921569, 1, 0, 1,
-0.5946298, 1.339454, 0.8349961, 0.3843137, 1, 0, 1,
-0.5924104, 1.112099, -1.337705, 0.3803922, 1, 0, 1,
-0.585093, -1.097376, -3.436283, 0.372549, 1, 0, 1,
-0.5777758, -0.5754395, -2.765817, 0.3686275, 1, 0, 1,
-0.5703627, 0.1678918, -0.3453233, 0.3607843, 1, 0, 1,
-0.5675842, 0.8152374, -0.7943796, 0.3568628, 1, 0, 1,
-0.5673027, -2.915449, -4.102411, 0.3490196, 1, 0, 1,
-0.5669377, -0.4411544, -1.608547, 0.345098, 1, 0, 1,
-0.5632561, -1.591277, -3.272042, 0.3372549, 1, 0, 1,
-0.5590508, 0.3388025, -1.06646, 0.3333333, 1, 0, 1,
-0.5572442, 0.1842402, -1.16411, 0.3254902, 1, 0, 1,
-0.552601, -1.512436, -4.41456, 0.3215686, 1, 0, 1,
-0.548826, -0.220927, -0.9105665, 0.3137255, 1, 0, 1,
-0.5485895, -0.3143124, -4.383632, 0.3098039, 1, 0, 1,
-0.5458569, -0.1098526, -2.499155, 0.3019608, 1, 0, 1,
-0.5453064, -0.8757381, -3.244009, 0.2941177, 1, 0, 1,
-0.5433307, -0.1886493, -0.9852718, 0.2901961, 1, 0, 1,
-0.537621, 0.2064541, -0.2833099, 0.282353, 1, 0, 1,
-0.5320469, -1.415233, -2.104194, 0.2784314, 1, 0, 1,
-0.5298851, -1.041705, -2.974679, 0.2705882, 1, 0, 1,
-0.5247614, -1.543666, -5.074574, 0.2666667, 1, 0, 1,
-0.5193337, 1.99121, -1.018202, 0.2588235, 1, 0, 1,
-0.5192871, 0.004228105, -1.946461, 0.254902, 1, 0, 1,
-0.5137179, -1.096625, -3.723732, 0.2470588, 1, 0, 1,
-0.5131069, 0.3320617, 0.6439068, 0.2431373, 1, 0, 1,
-0.5124173, -0.5889742, -3.369873, 0.2352941, 1, 0, 1,
-0.5096698, 1.337863, 0.1744099, 0.2313726, 1, 0, 1,
-0.5084723, -0.3593606, -4.232128, 0.2235294, 1, 0, 1,
-0.4863628, 0.343282, 1.649345, 0.2196078, 1, 0, 1,
-0.4828491, 1.275377, 0.2418028, 0.2117647, 1, 0, 1,
-0.4805871, -2.860231, -3.129368, 0.2078431, 1, 0, 1,
-0.4798017, 1.081131, -0.4906114, 0.2, 1, 0, 1,
-0.4771205, -1.897113, -3.420913, 0.1921569, 1, 0, 1,
-0.4727257, 0.5627837, -0.3822266, 0.1882353, 1, 0, 1,
-0.4707896, -0.7575185, -2.509415, 0.1803922, 1, 0, 1,
-0.4702137, 0.85185, -1.060962, 0.1764706, 1, 0, 1,
-0.4692261, -1.714223, -1.840581, 0.1686275, 1, 0, 1,
-0.468883, -0.830789, -3.757149, 0.1647059, 1, 0, 1,
-0.4651668, -2.611501, -0.573505, 0.1568628, 1, 0, 1,
-0.4649098, -0.07169739, -1.14679, 0.1529412, 1, 0, 1,
-0.4627716, 1.440071, 0.4681977, 0.145098, 1, 0, 1,
-0.4624634, 0.3275163, -1.927271, 0.1411765, 1, 0, 1,
-0.4585329, 1.448396, -0.5161429, 0.1333333, 1, 0, 1,
-0.455733, -0.7609007, -1.963641, 0.1294118, 1, 0, 1,
-0.4534254, 1.710456, -0.01633717, 0.1215686, 1, 0, 1,
-0.4516478, 0.7266508, -0.8328263, 0.1176471, 1, 0, 1,
-0.4510807, -0.957754, -1.433219, 0.1098039, 1, 0, 1,
-0.4474795, 0.06425714, -1.007033, 0.1058824, 1, 0, 1,
-0.4448196, 1.748366, -1.244412, 0.09803922, 1, 0, 1,
-0.4437126, 1.493156, -1.34672, 0.09019608, 1, 0, 1,
-0.4436572, 1.134559, -0.6237698, 0.08627451, 1, 0, 1,
-0.440039, 0.6275082, 0.07646757, 0.07843138, 1, 0, 1,
-0.4371339, 0.5611249, -1.350505, 0.07450981, 1, 0, 1,
-0.4356828, 0.3527992, -1.828483, 0.06666667, 1, 0, 1,
-0.4341289, -0.3754418, -1.688072, 0.0627451, 1, 0, 1,
-0.4316434, 0.9667898, 0.8242652, 0.05490196, 1, 0, 1,
-0.4291488, -0.06086679, 0.2259714, 0.05098039, 1, 0, 1,
-0.4236824, -0.6634158, -2.60564, 0.04313726, 1, 0, 1,
-0.42175, 2.264949, 0.001171604, 0.03921569, 1, 0, 1,
-0.4211987, 0.7643678, -0.737698, 0.03137255, 1, 0, 1,
-0.4140823, -0.8752293, -2.630147, 0.02745098, 1, 0, 1,
-0.4065602, 0.8931433, 0.6333879, 0.01960784, 1, 0, 1,
-0.4027875, -0.04011741, -0.2525511, 0.01568628, 1, 0, 1,
-0.402212, -1.860661, -1.997674, 0.007843138, 1, 0, 1,
-0.3974782, -2.185713, -4.578367, 0.003921569, 1, 0, 1,
-0.3931581, 0.6401456, -0.2020316, 0, 1, 0.003921569, 1,
-0.3905403, -1.02847, -1.945686, 0, 1, 0.01176471, 1,
-0.3871388, -0.6561871, -3.033661, 0, 1, 0.01568628, 1,
-0.3854597, -0.106232, -3.294642, 0, 1, 0.02352941, 1,
-0.3847603, 1.593667, 0.7671698, 0, 1, 0.02745098, 1,
-0.3802596, -0.6411397, -1.718948, 0, 1, 0.03529412, 1,
-0.3787711, -2.10352, -3.49253, 0, 1, 0.03921569, 1,
-0.3786115, -0.3679574, -2.770904, 0, 1, 0.04705882, 1,
-0.3769022, 0.7877633, 1.40187, 0, 1, 0.05098039, 1,
-0.3766688, 1.013202, -1.111868, 0, 1, 0.05882353, 1,
-0.3707857, 0.5336146, -0.4997541, 0, 1, 0.0627451, 1,
-0.3663227, -0.867848, -4.186116, 0, 1, 0.07058824, 1,
-0.3629262, 1.106907, 0.6895245, 0, 1, 0.07450981, 1,
-0.36187, -0.6572119, -3.491284, 0, 1, 0.08235294, 1,
-0.3595124, -1.790769, -1.003998, 0, 1, 0.08627451, 1,
-0.3564914, 0.09105907, -2.678093, 0, 1, 0.09411765, 1,
-0.3560194, -1.540113, -3.655429, 0, 1, 0.1019608, 1,
-0.3545683, -1.073696, -3.38309, 0, 1, 0.1058824, 1,
-0.3532135, -2.216852, -2.062499, 0, 1, 0.1137255, 1,
-0.3525128, -1.973409, -3.34365, 0, 1, 0.1176471, 1,
-0.3409368, -0.05166906, 1.066993, 0, 1, 0.1254902, 1,
-0.3397036, -0.7039472, -3.236264, 0, 1, 0.1294118, 1,
-0.3396224, 0.4417802, 0.2764786, 0, 1, 0.1372549, 1,
-0.3380964, -0.9812996, -3.601606, 0, 1, 0.1411765, 1,
-0.337605, -0.1267176, -2.591633, 0, 1, 0.1490196, 1,
-0.3302571, 0.1029402, -3.085268, 0, 1, 0.1529412, 1,
-0.3301536, -0.02834901, -2.538043, 0, 1, 0.1607843, 1,
-0.326874, 0.5660824, -1.354452, 0, 1, 0.1647059, 1,
-0.3215852, -0.6921361, -3.435208, 0, 1, 0.172549, 1,
-0.3188429, -1.295663, -2.433296, 0, 1, 0.1764706, 1,
-0.3173568, 1.328831, -2.214311, 0, 1, 0.1843137, 1,
-0.3123327, 0.2571198, -0.8969768, 0, 1, 0.1882353, 1,
-0.3113574, -0.2418925, -1.958184, 0, 1, 0.1960784, 1,
-0.310144, 0.2220259, 1.042666, 0, 1, 0.2039216, 1,
-0.30781, 0.9698603, -0.04774854, 0, 1, 0.2078431, 1,
-0.307772, -0.1776001, -1.133241, 0, 1, 0.2156863, 1,
-0.3039964, -0.8851051, -2.834797, 0, 1, 0.2196078, 1,
-0.2978022, -1.191684, -3.42795, 0, 1, 0.227451, 1,
-0.2976817, -0.5761186, -3.210857, 0, 1, 0.2313726, 1,
-0.2954343, -0.1729572, -3.525819, 0, 1, 0.2392157, 1,
-0.2921247, 0.3700237, -1.198926, 0, 1, 0.2431373, 1,
-0.2914596, 0.9838502, -1.84057, 0, 1, 0.2509804, 1,
-0.2889397, -0.4651032, -2.012536, 0, 1, 0.254902, 1,
-0.2854052, -1.462298, -4.201996, 0, 1, 0.2627451, 1,
-0.2839324, 0.5376309, -1.183671, 0, 1, 0.2666667, 1,
-0.2784308, 0.5775124, -0.9048737, 0, 1, 0.2745098, 1,
-0.2768972, -0.4810841, -3.456069, 0, 1, 0.2784314, 1,
-0.2767027, 0.08238439, -3.458879, 0, 1, 0.2862745, 1,
-0.2761769, -0.5305198, -3.251369, 0, 1, 0.2901961, 1,
-0.2755567, -0.6043072, 0.1295255, 0, 1, 0.2980392, 1,
-0.272242, -2.372878, -2.534573, 0, 1, 0.3058824, 1,
-0.26626, -1.627525, -2.794528, 0, 1, 0.3098039, 1,
-0.2656423, 1.610272, 0.2653881, 0, 1, 0.3176471, 1,
-0.2646821, -2.53335, -3.742377, 0, 1, 0.3215686, 1,
-0.2636172, -0.6421279, -3.252661, 0, 1, 0.3294118, 1,
-0.2625759, -1.024023, -1.490153, 0, 1, 0.3333333, 1,
-0.2612912, -0.9230887, -4.420057, 0, 1, 0.3411765, 1,
-0.2588743, -0.3882896, -2.747543, 0, 1, 0.345098, 1,
-0.2547544, -0.6820393, -1.619695, 0, 1, 0.3529412, 1,
-0.2539071, -1.269895, -3.887281, 0, 1, 0.3568628, 1,
-0.2475684, 0.0006107969, -1.233101, 0, 1, 0.3647059, 1,
-0.2471849, -0.5776199, -2.782535, 0, 1, 0.3686275, 1,
-0.243519, -0.9473445, -3.624676, 0, 1, 0.3764706, 1,
-0.2401635, -0.3204749, -2.230206, 0, 1, 0.3803922, 1,
-0.2384561, 0.5375569, -0.07496899, 0, 1, 0.3882353, 1,
-0.2313872, 0.2248576, -1.925501, 0, 1, 0.3921569, 1,
-0.2295584, -0.7016867, -3.907969, 0, 1, 0.4, 1,
-0.2227028, -2.318127, -1.934526, 0, 1, 0.4078431, 1,
-0.222147, 0.3762434, 0.4753458, 0, 1, 0.4117647, 1,
-0.2200198, -0.638081, -3.813769, 0, 1, 0.4196078, 1,
-0.2142868, 0.8686828, 0.4988062, 0, 1, 0.4235294, 1,
-0.213321, 0.6256188, -0.7233364, 0, 1, 0.4313726, 1,
-0.2033975, -1.365243, -3.716193, 0, 1, 0.4352941, 1,
-0.2011242, -0.5005528, -1.520138, 0, 1, 0.4431373, 1,
-0.1970766, 0.8785468, -1.312103, 0, 1, 0.4470588, 1,
-0.1893039, 1.06742, -1.584325, 0, 1, 0.454902, 1,
-0.1875156, -1.742944, -3.670698, 0, 1, 0.4588235, 1,
-0.1874673, -1.582266, -3.413691, 0, 1, 0.4666667, 1,
-0.1847857, 0.2864296, -0.8560474, 0, 1, 0.4705882, 1,
-0.1824947, -0.4839494, -2.691285, 0, 1, 0.4784314, 1,
-0.1814435, -0.8291501, -0.853332, 0, 1, 0.4823529, 1,
-0.1767488, 0.1567614, -1.819743, 0, 1, 0.4901961, 1,
-0.1671063, -0.4896089, -2.879327, 0, 1, 0.4941176, 1,
-0.1619917, 0.622827, -0.2560273, 0, 1, 0.5019608, 1,
-0.161485, -0.8174946, -3.675588, 0, 1, 0.509804, 1,
-0.1611999, 0.737879, -1.040708, 0, 1, 0.5137255, 1,
-0.1597859, -0.8961919, -3.484134, 0, 1, 0.5215687, 1,
-0.1592931, 1.572473, 0.3133625, 0, 1, 0.5254902, 1,
-0.1581374, -0.1268581, -1.675507, 0, 1, 0.5333334, 1,
-0.1541094, -0.6486476, -3.485874, 0, 1, 0.5372549, 1,
-0.1516236, -0.7430513, -2.978179, 0, 1, 0.5450981, 1,
-0.1485575, -0.2766576, -2.785355, 0, 1, 0.5490196, 1,
-0.1474117, 0.290748, -0.1805368, 0, 1, 0.5568628, 1,
-0.143096, 1.396859, 2.091167, 0, 1, 0.5607843, 1,
-0.1323208, -0.04493831, -1.760972, 0, 1, 0.5686275, 1,
-0.1298375, -0.7072681, -2.378224, 0, 1, 0.572549, 1,
-0.1283322, 0.4623576, 0.8018041, 0, 1, 0.5803922, 1,
-0.1242958, -1.857162, -3.272671, 0, 1, 0.5843138, 1,
-0.1201777, 0.572103, 0.729819, 0, 1, 0.5921569, 1,
-0.1167662, -1.695249, -4.347116, 0, 1, 0.5960785, 1,
-0.115784, -1.701339, -3.976589, 0, 1, 0.6039216, 1,
-0.1148961, -0.8644218, -1.17946, 0, 1, 0.6117647, 1,
-0.1070038, 0.2255761, -0.7013933, 0, 1, 0.6156863, 1,
-0.1063762, -0.1590175, -2.340538, 0, 1, 0.6235294, 1,
-0.1057558, -1.613602, -2.963699, 0, 1, 0.627451, 1,
-0.1057527, 0.2842183, -1.131016, 0, 1, 0.6352941, 1,
-0.1037532, 1.364542, 0.296258, 0, 1, 0.6392157, 1,
-0.08835744, 1.82046, 1.021228, 0, 1, 0.6470588, 1,
-0.08459394, 0.5583944, -1.836314, 0, 1, 0.6509804, 1,
-0.08340377, 0.4456598, 0.2968124, 0, 1, 0.6588235, 1,
-0.08044118, -0.8405061, -4.239244, 0, 1, 0.6627451, 1,
-0.07519317, 0.2993971, -0.1189019, 0, 1, 0.6705883, 1,
-0.07454515, 0.1137174, -1.237834, 0, 1, 0.6745098, 1,
-0.0742015, 0.5552948, -2.294538, 0, 1, 0.682353, 1,
-0.07175779, -1.252548, -4.743814, 0, 1, 0.6862745, 1,
-0.07162862, 0.4649341, -0.6058823, 0, 1, 0.6941177, 1,
-0.0683241, -0.67919, -2.893718, 0, 1, 0.7019608, 1,
-0.06777199, -0.661979, -2.756486, 0, 1, 0.7058824, 1,
-0.06556395, 0.6716079, 0.4862263, 0, 1, 0.7137255, 1,
-0.0648473, -0.05605916, -0.6717668, 0, 1, 0.7176471, 1,
-0.06261648, 0.1342017, -1.453287, 0, 1, 0.7254902, 1,
-0.06051368, 0.1044519, 1.190528, 0, 1, 0.7294118, 1,
-0.05920033, -1.504639, -2.313891, 0, 1, 0.7372549, 1,
-0.05911845, 0.2251126, 0.5552911, 0, 1, 0.7411765, 1,
-0.05662924, -0.7113276, -2.384793, 0, 1, 0.7490196, 1,
-0.05556216, 0.7276483, 0.3940283, 0, 1, 0.7529412, 1,
-0.05419216, -0.8572884, -2.696136, 0, 1, 0.7607843, 1,
-0.05414727, -0.6142839, -2.953923, 0, 1, 0.7647059, 1,
-0.05246876, -1.740389, -4.500055, 0, 1, 0.772549, 1,
-0.03813697, 1.241099, -2.475603, 0, 1, 0.7764706, 1,
-0.03540036, 0.3297935, 1.748266, 0, 1, 0.7843137, 1,
-0.03384117, 1.431566, 2.083189, 0, 1, 0.7882353, 1,
-0.03336992, 0.01400334, -1.152175, 0, 1, 0.7960784, 1,
-0.03088119, 2.029211, -1.079525, 0, 1, 0.8039216, 1,
-0.0287717, -1.703972, -1.793123, 0, 1, 0.8078431, 1,
-0.0277921, -0.6294409, -4.266915, 0, 1, 0.8156863, 1,
-0.02415778, -1.632703, -3.52546, 0, 1, 0.8196079, 1,
-0.02405248, -0.08391301, -1.65178, 0, 1, 0.827451, 1,
-0.0149058, -1.336445, -3.099154, 0, 1, 0.8313726, 1,
-0.007541397, 1.250531, 1.005946, 0, 1, 0.8392157, 1,
-0.006969233, -0.4329214, -3.750363, 0, 1, 0.8431373, 1,
-0.002828635, -0.9323598, -3.396611, 0, 1, 0.8509804, 1,
-0.001880891, 0.1702704, 0.4800614, 0, 1, 0.854902, 1,
-0.001720031, 0.3232166, -0.1560577, 0, 1, 0.8627451, 1,
0.004512001, -0.7104034, 3.412102, 0, 1, 0.8666667, 1,
0.009434704, 0.2389675, 0.4846416, 0, 1, 0.8745098, 1,
0.0143458, -0.2780212, 3.500076, 0, 1, 0.8784314, 1,
0.01468381, -1.649914, 4.634598, 0, 1, 0.8862745, 1,
0.01482313, 0.5620004, 0.3392695, 0, 1, 0.8901961, 1,
0.01486901, 0.0971158, 1.991941, 0, 1, 0.8980392, 1,
0.01827387, 0.5550447, -1.138159, 0, 1, 0.9058824, 1,
0.02282553, -0.7523255, 3.692153, 0, 1, 0.9098039, 1,
0.02666703, 1.180503, -0.6303154, 0, 1, 0.9176471, 1,
0.03114373, 1.528516, -0.5159782, 0, 1, 0.9215686, 1,
0.0323803, -0.1172454, 3.951214, 0, 1, 0.9294118, 1,
0.03515656, -0.2699423, 1.807191, 0, 1, 0.9333333, 1,
0.03790116, 0.5833176, -1.361535, 0, 1, 0.9411765, 1,
0.03908627, 1.217008, -0.09129049, 0, 1, 0.945098, 1,
0.04184495, -0.419082, 3.620935, 0, 1, 0.9529412, 1,
0.04377969, -0.0397609, 0.9237159, 0, 1, 0.9568627, 1,
0.04601215, 1.087338, -1.612403, 0, 1, 0.9647059, 1,
0.0477132, -2.743265, 2.052351, 0, 1, 0.9686275, 1,
0.04879561, 1.657207, -0.4988081, 0, 1, 0.9764706, 1,
0.05599635, 0.6285275, -0.09980079, 0, 1, 0.9803922, 1,
0.05617283, 1.07159, -1.507978, 0, 1, 0.9882353, 1,
0.05915987, -2.545728, 3.906251, 0, 1, 0.9921569, 1,
0.06103098, -0.0790252, 2.751517, 0, 1, 1, 1,
0.06432279, 0.8776718, -0.7252154, 0, 0.9921569, 1, 1,
0.06606462, -1.121517, 2.167753, 0, 0.9882353, 1, 1,
0.07419135, -0.4354922, 2.704231, 0, 0.9803922, 1, 1,
0.07486439, -0.9741848, 2.934156, 0, 0.9764706, 1, 1,
0.07650787, 0.8751226, 2.282827, 0, 0.9686275, 1, 1,
0.07826507, -0.1647547, 2.109667, 0, 0.9647059, 1, 1,
0.07924929, 0.6769458, 0.5557411, 0, 0.9568627, 1, 1,
0.08594693, 0.3861285, -0.2612687, 0, 0.9529412, 1, 1,
0.08948868, -0.2820308, 3.165188, 0, 0.945098, 1, 1,
0.09136096, -0.01738238, 2.584389, 0, 0.9411765, 1, 1,
0.0955505, -0.3239279, 3.951391, 0, 0.9333333, 1, 1,
0.09774862, 0.8265716, -0.3996783, 0, 0.9294118, 1, 1,
0.1004781, -0.786659, 3.329598, 0, 0.9215686, 1, 1,
0.1020569, 1.075362, 0.9268971, 0, 0.9176471, 1, 1,
0.1025833, -0.4829787, 2.029885, 0, 0.9098039, 1, 1,
0.1034291, 0.1187401, 0.3055117, 0, 0.9058824, 1, 1,
0.104046, -3.112045, 2.737907, 0, 0.8980392, 1, 1,
0.1075427, 0.1566178, 0.5082073, 0, 0.8901961, 1, 1,
0.1158436, 0.07655158, 1.477692, 0, 0.8862745, 1, 1,
0.1158915, 0.6485353, 0.7675545, 0, 0.8784314, 1, 1,
0.1217021, 1.376852, -2.270599, 0, 0.8745098, 1, 1,
0.1230394, 0.3179395, -0.160236, 0, 0.8666667, 1, 1,
0.1237637, 0.6440873, -1.887258, 0, 0.8627451, 1, 1,
0.1262003, 0.2058559, 0.9257064, 0, 0.854902, 1, 1,
0.1287649, -0.08133265, 0.8048938, 0, 0.8509804, 1, 1,
0.1288909, 1.522492, -0.5891993, 0, 0.8431373, 1, 1,
0.1299296, -0.02793362, 4.03376, 0, 0.8392157, 1, 1,
0.1312244, -1.042475, 1.932118, 0, 0.8313726, 1, 1,
0.1315684, -0.6565593, 2.415482, 0, 0.827451, 1, 1,
0.1354472, 1.80825, -0.400716, 0, 0.8196079, 1, 1,
0.1376535, 0.05068824, -0.05470737, 0, 0.8156863, 1, 1,
0.1389427, 0.3631179, -0.5234841, 0, 0.8078431, 1, 1,
0.1396416, 0.1947036, -1.230251, 0, 0.8039216, 1, 1,
0.1396836, 0.4317608, 2.394066, 0, 0.7960784, 1, 1,
0.1405444, 0.1740433, 0.6378428, 0, 0.7882353, 1, 1,
0.1414211, -0.7151104, 3.328757, 0, 0.7843137, 1, 1,
0.1544112, -0.181931, 1.548841, 0, 0.7764706, 1, 1,
0.1609087, 1.154429, -0.1908159, 0, 0.772549, 1, 1,
0.1618143, -0.4616314, 2.52678, 0, 0.7647059, 1, 1,
0.1636752, -0.1000785, 3.894269, 0, 0.7607843, 1, 1,
0.1639229, 0.1512297, 2.527404, 0, 0.7529412, 1, 1,
0.170269, -1.088427, 4.175969, 0, 0.7490196, 1, 1,
0.1740092, 2.311201, 0.1763359, 0, 0.7411765, 1, 1,
0.1802643, -0.4354787, 2.569822, 0, 0.7372549, 1, 1,
0.1816917, -0.7832649, 4.03829, 0, 0.7294118, 1, 1,
0.1862979, 0.2572401, 1.448734, 0, 0.7254902, 1, 1,
0.1908377, 1.051276, 1.112859, 0, 0.7176471, 1, 1,
0.192932, -0.8423208, 2.417177, 0, 0.7137255, 1, 1,
0.1985493, -1.981952, 1.864438, 0, 0.7058824, 1, 1,
0.1998876, 0.3378392, -0.7906564, 0, 0.6980392, 1, 1,
0.201311, 0.4097046, -0.1879829, 0, 0.6941177, 1, 1,
0.203783, 3.03989, -0.8224285, 0, 0.6862745, 1, 1,
0.2037974, -0.4462266, 3.798728, 0, 0.682353, 1, 1,
0.2082522, 0.9844735, 0.1879813, 0, 0.6745098, 1, 1,
0.210011, -1.136319, 2.081183, 0, 0.6705883, 1, 1,
0.2100523, -0.5936173, 2.763367, 0, 0.6627451, 1, 1,
0.210492, 0.2451671, 1.996303, 0, 0.6588235, 1, 1,
0.2117293, 0.5422064, -0.0853288, 0, 0.6509804, 1, 1,
0.2120856, 0.1411191, -0.1080936, 0, 0.6470588, 1, 1,
0.2122027, -1.586443, 3.356181, 0, 0.6392157, 1, 1,
0.2158583, -0.9465615, 3.757795, 0, 0.6352941, 1, 1,
0.2195669, 0.06635782, 2.380027, 0, 0.627451, 1, 1,
0.2235253, -0.5160022, 2.044021, 0, 0.6235294, 1, 1,
0.2237953, 0.06754171, 1.091977, 0, 0.6156863, 1, 1,
0.2238046, 1.06729, -0.2400467, 0, 0.6117647, 1, 1,
0.231433, -1.286633, 4.162922, 0, 0.6039216, 1, 1,
0.2317118, 0.9867262, 0.5634739, 0, 0.5960785, 1, 1,
0.2317802, 0.5395402, -0.05129842, 0, 0.5921569, 1, 1,
0.2347825, 1.270193, 1.461229, 0, 0.5843138, 1, 1,
0.2351781, -1.649533, 4.564896, 0, 0.5803922, 1, 1,
0.2434076, 0.01951983, 1.119947, 0, 0.572549, 1, 1,
0.2444538, 1.759937, -1.675962, 0, 0.5686275, 1, 1,
0.2478506, -1.751882, 2.047301, 0, 0.5607843, 1, 1,
0.2481335, -1.24446, 2.071259, 0, 0.5568628, 1, 1,
0.2491133, 1.463216, 1.239774, 0, 0.5490196, 1, 1,
0.2515785, -0.1639421, 3.991681, 0, 0.5450981, 1, 1,
0.2531523, 0.7428991, -0.1327853, 0, 0.5372549, 1, 1,
0.2538014, 0.4498523, 1.734762, 0, 0.5333334, 1, 1,
0.2615294, -0.3582772, 1.796991, 0, 0.5254902, 1, 1,
0.2630243, -0.7028, 2.232365, 0, 0.5215687, 1, 1,
0.2638658, 2.081518, 1.798779, 0, 0.5137255, 1, 1,
0.2658727, 0.6550162, 0.3719797, 0, 0.509804, 1, 1,
0.2676888, 0.2189525, 2.516549, 0, 0.5019608, 1, 1,
0.2719569, -1.472652, 2.972768, 0, 0.4941176, 1, 1,
0.273908, -0.4258605, 2.467538, 0, 0.4901961, 1, 1,
0.2820936, -1.005359, 3.737499, 0, 0.4823529, 1, 1,
0.2888633, -1.051824, 1.477854, 0, 0.4784314, 1, 1,
0.2896084, 0.7189007, -0.3634887, 0, 0.4705882, 1, 1,
0.2913969, -2.011821, 2.630633, 0, 0.4666667, 1, 1,
0.2933695, 0.1072806, 2.06194, 0, 0.4588235, 1, 1,
0.2937716, -0.8220803, 3.453106, 0, 0.454902, 1, 1,
0.2958469, 0.7203575, 0.5670689, 0, 0.4470588, 1, 1,
0.297448, -0.07825588, 2.262416, 0, 0.4431373, 1, 1,
0.297701, -0.206661, 1.580934, 0, 0.4352941, 1, 1,
0.3055675, 0.3082886, 0.597061, 0, 0.4313726, 1, 1,
0.3060054, 1.307968, -0.3170209, 0, 0.4235294, 1, 1,
0.3083025, -2.54267, 0.9370269, 0, 0.4196078, 1, 1,
0.3091864, 1.496701, 1.332114, 0, 0.4117647, 1, 1,
0.3096355, 0.1280373, 1.000199, 0, 0.4078431, 1, 1,
0.3116287, 1.586617, 0.332983, 0, 0.4, 1, 1,
0.3132046, 0.113112, 1.79938, 0, 0.3921569, 1, 1,
0.313575, -0.1815489, 2.197446, 0, 0.3882353, 1, 1,
0.3174195, 0.635298, 0.5628946, 0, 0.3803922, 1, 1,
0.3179027, -1.43643, 3.003402, 0, 0.3764706, 1, 1,
0.3193384, 1.086049, -0.5100769, 0, 0.3686275, 1, 1,
0.3227436, 0.5168592, 1.220273, 0, 0.3647059, 1, 1,
0.3289734, 0.4433512, -0.2561032, 0, 0.3568628, 1, 1,
0.3291428, -0.8701202, 3.570664, 0, 0.3529412, 1, 1,
0.3314435, -1.395137, 1.002629, 0, 0.345098, 1, 1,
0.3318232, 0.2109758, 1.648383, 0, 0.3411765, 1, 1,
0.3347363, 0.03015695, 1.327758, 0, 0.3333333, 1, 1,
0.3435606, -0.1293486, 1.250529, 0, 0.3294118, 1, 1,
0.3475848, 0.645547, 0.9728714, 0, 0.3215686, 1, 1,
0.3548788, -0.09575596, 2.444422, 0, 0.3176471, 1, 1,
0.3570749, 0.3234999, -0.6206787, 0, 0.3098039, 1, 1,
0.3592715, 0.5484927, 1.591287, 0, 0.3058824, 1, 1,
0.3606714, 0.2259415, 1.902328, 0, 0.2980392, 1, 1,
0.3632605, 0.2930806, 1.39689, 0, 0.2901961, 1, 1,
0.3633314, -0.3159923, 2.367564, 0, 0.2862745, 1, 1,
0.3636448, 0.3762852, 0.8995903, 0, 0.2784314, 1, 1,
0.3681328, -0.424564, 3.894787, 0, 0.2745098, 1, 1,
0.3745754, -1.797377, 1.684089, 0, 0.2666667, 1, 1,
0.3765825, -0.2365845, 2.056779, 0, 0.2627451, 1, 1,
0.3796552, 1.258687, -0.5289141, 0, 0.254902, 1, 1,
0.3803783, 1.873258, -0.1985358, 0, 0.2509804, 1, 1,
0.3805854, -1.042966, 3.248494, 0, 0.2431373, 1, 1,
0.3828323, 2.674352, -1.342429, 0, 0.2392157, 1, 1,
0.385914, -1.760908, 2.770635, 0, 0.2313726, 1, 1,
0.3865912, 0.2311429, 0.8676579, 0, 0.227451, 1, 1,
0.3893698, -0.9058936, 4.16526, 0, 0.2196078, 1, 1,
0.3908457, -1.163195, 1.985157, 0, 0.2156863, 1, 1,
0.3961636, 1.499976, -0.04933449, 0, 0.2078431, 1, 1,
0.3999144, -0.5619618, 1.809215, 0, 0.2039216, 1, 1,
0.4027807, 0.1777458, 1.783822, 0, 0.1960784, 1, 1,
0.4029554, -0.8341399, 2.11276, 0, 0.1882353, 1, 1,
0.4036208, -1.55119, 1.952177, 0, 0.1843137, 1, 1,
0.4052116, -2.015126, 4.135215, 0, 0.1764706, 1, 1,
0.4061035, -1.8684, 3.477904, 0, 0.172549, 1, 1,
0.4080595, -0.3404235, 4.0333, 0, 0.1647059, 1, 1,
0.4125327, 0.2616891, 0.6204616, 0, 0.1607843, 1, 1,
0.4128857, 1.176599, -0.0362676, 0, 0.1529412, 1, 1,
0.4187381, -0.3935362, 1.574021, 0, 0.1490196, 1, 1,
0.4223558, 0.2108756, 0.6640852, 0, 0.1411765, 1, 1,
0.4233582, -0.05070761, 0.8661383, 0, 0.1372549, 1, 1,
0.4299713, 0.1460509, -1.119915, 0, 0.1294118, 1, 1,
0.4300433, 0.3001942, -0.5430041, 0, 0.1254902, 1, 1,
0.4333356, -0.1553833, 0.8525876, 0, 0.1176471, 1, 1,
0.4400621, -0.4894512, 3.248856, 0, 0.1137255, 1, 1,
0.4443458, -0.2812902, 2.404319, 0, 0.1058824, 1, 1,
0.4458902, 1.02316, -1.048017, 0, 0.09803922, 1, 1,
0.4464801, 0.3081374, 1.177837, 0, 0.09411765, 1, 1,
0.4466577, 0.03571381, 1.32387, 0, 0.08627451, 1, 1,
0.4508751, -0.6189877, 1.949159, 0, 0.08235294, 1, 1,
0.4523451, 0.4251489, 2.206963, 0, 0.07450981, 1, 1,
0.4542423, 1.54916, -0.6298982, 0, 0.07058824, 1, 1,
0.4573768, 0.01134574, 1.84864, 0, 0.0627451, 1, 1,
0.4630186, -0.6607631, 0.9646925, 0, 0.05882353, 1, 1,
0.4634555, -1.043007, 1.504696, 0, 0.05098039, 1, 1,
0.4692678, 1.428803, 1.09417, 0, 0.04705882, 1, 1,
0.46985, -0.2807817, 2.665638, 0, 0.03921569, 1, 1,
0.4708987, 0.5198841, 2.284462, 0, 0.03529412, 1, 1,
0.4727961, 1.63314, -0.2090939, 0, 0.02745098, 1, 1,
0.473612, 0.6116855, 2.554363, 0, 0.02352941, 1, 1,
0.4750277, 0.938727, 0.4331271, 0, 0.01568628, 1, 1,
0.4757894, -0.1182522, 0.5941013, 0, 0.01176471, 1, 1,
0.4772939, -1.143366, 0.8520567, 0, 0.003921569, 1, 1,
0.4797007, -0.9367666, 1.462434, 0.003921569, 0, 1, 1,
0.4801103, -0.9690253, 3.000381, 0.007843138, 0, 1, 1,
0.4844303, -0.8785886, 2.334088, 0.01568628, 0, 1, 1,
0.4847742, 1.591087, -0.5147807, 0.01960784, 0, 1, 1,
0.4891748, -0.7590647, 3.854677, 0.02745098, 0, 1, 1,
0.4905635, 0.3142392, 1.461134, 0.03137255, 0, 1, 1,
0.4907729, -0.5186263, 4.928587, 0.03921569, 0, 1, 1,
0.493143, -0.8511572, 2.751567, 0.04313726, 0, 1, 1,
0.4959431, 0.2746689, 1.074746, 0.05098039, 0, 1, 1,
0.5002543, -0.2736568, 2.303859, 0.05490196, 0, 1, 1,
0.5018722, 0.895758, 0.5316653, 0.0627451, 0, 1, 1,
0.5034323, 0.3080115, 1.386815, 0.06666667, 0, 1, 1,
0.5059581, 0.1434621, 0.8019317, 0.07450981, 0, 1, 1,
0.5083416, 1.024016, 2.029121, 0.07843138, 0, 1, 1,
0.5136019, -0.1718622, 1.694828, 0.08627451, 0, 1, 1,
0.5156367, 0.158924, 0.5073595, 0.09019608, 0, 1, 1,
0.5168724, -1.203064, 3.827432, 0.09803922, 0, 1, 1,
0.517202, -1.335332, 4.288683, 0.1058824, 0, 1, 1,
0.5199299, 1.669765, -1.568288, 0.1098039, 0, 1, 1,
0.5244097, -1.590986, 2.495985, 0.1176471, 0, 1, 1,
0.5267613, -0.1270923, 0.8130311, 0.1215686, 0, 1, 1,
0.5306691, 0.6099595, 1.459262, 0.1294118, 0, 1, 1,
0.5318403, -0.7043654, 2.380154, 0.1333333, 0, 1, 1,
0.5366927, 0.1562355, 2.113219, 0.1411765, 0, 1, 1,
0.5379146, 1.27407, -0.138773, 0.145098, 0, 1, 1,
0.5407777, 0.03267102, 3.920051, 0.1529412, 0, 1, 1,
0.5417653, -1.374613, 3.987768, 0.1568628, 0, 1, 1,
0.5427599, -1.471835, 2.953725, 0.1647059, 0, 1, 1,
0.5431097, -0.2377568, 2.960008, 0.1686275, 0, 1, 1,
0.543878, 0.08440452, 2.598954, 0.1764706, 0, 1, 1,
0.5454537, -0.04647715, 2.162732, 0.1803922, 0, 1, 1,
0.5457058, 0.4689498, 0.9368229, 0.1882353, 0, 1, 1,
0.5492399, -1.869461, 2.505861, 0.1921569, 0, 1, 1,
0.5494977, 1.307523, 0.3656303, 0.2, 0, 1, 1,
0.5534052, -0.6442813, 1.255497, 0.2078431, 0, 1, 1,
0.5547976, -0.1742771, 2.058827, 0.2117647, 0, 1, 1,
0.5568646, 0.1302577, -0.7184577, 0.2196078, 0, 1, 1,
0.5590039, 1.517021, 0.7177283, 0.2235294, 0, 1, 1,
0.5606747, 0.469882, -0.9066374, 0.2313726, 0, 1, 1,
0.5662239, 0.1932328, -0.2482976, 0.2352941, 0, 1, 1,
0.567491, 1.914661, -0.1210969, 0.2431373, 0, 1, 1,
0.5682718, 2.680553, -0.8948695, 0.2470588, 0, 1, 1,
0.5697157, 1.180419, 1.647642, 0.254902, 0, 1, 1,
0.5740556, 0.3451655, -0.06444018, 0.2588235, 0, 1, 1,
0.5754781, 0.07937653, 1.176445, 0.2666667, 0, 1, 1,
0.5761859, 0.01020044, 0.8423408, 0.2705882, 0, 1, 1,
0.5796964, -1.100206, 1.276804, 0.2784314, 0, 1, 1,
0.5842991, 0.1000335, 3.708994, 0.282353, 0, 1, 1,
0.5852922, 0.1829124, 1.462329, 0.2901961, 0, 1, 1,
0.5854471, -0.3365823, 2.415341, 0.2941177, 0, 1, 1,
0.5910314, 0.7357619, 0.6351054, 0.3019608, 0, 1, 1,
0.5997671, 1.079738, 0.4942921, 0.3098039, 0, 1, 1,
0.6028891, 0.6253091, 0.09544073, 0.3137255, 0, 1, 1,
0.6065241, 0.1211, -0.5415779, 0.3215686, 0, 1, 1,
0.6102836, -0.02652342, 1.999781, 0.3254902, 0, 1, 1,
0.6123156, -1.792714, 2.920888, 0.3333333, 0, 1, 1,
0.6135555, -0.9775727, 2.659634, 0.3372549, 0, 1, 1,
0.6151146, 0.8564852, 1.960767, 0.345098, 0, 1, 1,
0.6152582, 0.4919365, 1.904814, 0.3490196, 0, 1, 1,
0.6173253, -1.024998, 2.226197, 0.3568628, 0, 1, 1,
0.6186347, 0.9210723, 0.4456435, 0.3607843, 0, 1, 1,
0.6211058, 2.273236, -0.4208891, 0.3686275, 0, 1, 1,
0.621976, -0.734358, 1.13562, 0.372549, 0, 1, 1,
0.6242683, -2.047712, 3.667036, 0.3803922, 0, 1, 1,
0.6249146, -0.8469002, 0.183596, 0.3843137, 0, 1, 1,
0.626308, -1.503321, 0.08902541, 0.3921569, 0, 1, 1,
0.626519, 0.6535046, 0.09895907, 0.3960784, 0, 1, 1,
0.627422, -0.197919, 2.595289, 0.4039216, 0, 1, 1,
0.6331237, 0.3892623, 0.368622, 0.4117647, 0, 1, 1,
0.6378207, 0.2672502, 2.549508, 0.4156863, 0, 1, 1,
0.6379874, 1.104801, 0.5188229, 0.4235294, 0, 1, 1,
0.6424705, 0.7742974, 0.1235864, 0.427451, 0, 1, 1,
0.6480507, -1.051031, 2.49549, 0.4352941, 0, 1, 1,
0.6485064, 1.123924, 0.3747728, 0.4392157, 0, 1, 1,
0.6524187, 1.007299, -0.8831246, 0.4470588, 0, 1, 1,
0.6549554, 0.487965, 2.593808, 0.4509804, 0, 1, 1,
0.6632712, 0.753426, 0.8195069, 0.4588235, 0, 1, 1,
0.6647061, -0.3353108, -0.4081035, 0.4627451, 0, 1, 1,
0.6654941, 0.1410822, 1.298485, 0.4705882, 0, 1, 1,
0.6719654, -1.315691, 2.471286, 0.4745098, 0, 1, 1,
0.6793214, 0.3580008, 2.608857, 0.4823529, 0, 1, 1,
0.6827845, -0.4079703, 2.280671, 0.4862745, 0, 1, 1,
0.6952991, 2.052156, -0.7483506, 0.4941176, 0, 1, 1,
0.6983526, 2.230345, -0.6339211, 0.5019608, 0, 1, 1,
0.7057583, -0.8532395, 0.4514812, 0.5058824, 0, 1, 1,
0.7107359, -0.8073769, 1.577514, 0.5137255, 0, 1, 1,
0.7144245, 3.471664, 1.333867, 0.5176471, 0, 1, 1,
0.7172235, -1.838173, 1.599128, 0.5254902, 0, 1, 1,
0.7207709, -1.573138, 2.835969, 0.5294118, 0, 1, 1,
0.7287917, 0.382678, 1.916645, 0.5372549, 0, 1, 1,
0.7288245, -1.571408, 1.105876, 0.5411765, 0, 1, 1,
0.7295536, 0.2530399, 1.181007, 0.5490196, 0, 1, 1,
0.7331121, -0.133875, 2.454054, 0.5529412, 0, 1, 1,
0.7353597, -0.05519935, 0.9809036, 0.5607843, 0, 1, 1,
0.7380298, -0.2338186, 1.43032, 0.5647059, 0, 1, 1,
0.739134, 1.393662, -2.051382, 0.572549, 0, 1, 1,
0.7432122, -0.9080365, 2.975923, 0.5764706, 0, 1, 1,
0.7461197, 0.6944189, 2.06645, 0.5843138, 0, 1, 1,
0.7508977, -0.4789075, 1.31288, 0.5882353, 0, 1, 1,
0.7535152, 0.8313477, 0.9417001, 0.5960785, 0, 1, 1,
0.7631378, 0.7725434, 1.57109, 0.6039216, 0, 1, 1,
0.7639232, 0.6487762, 0.2216668, 0.6078432, 0, 1, 1,
0.7713774, -1.055653, 3.687049, 0.6156863, 0, 1, 1,
0.7714794, 0.4954827, 0.5378065, 0.6196079, 0, 1, 1,
0.7715607, -0.6896737, 1.166921, 0.627451, 0, 1, 1,
0.7718469, -0.08946113, 1.858376, 0.6313726, 0, 1, 1,
0.7722966, 1.848488, -0.736264, 0.6392157, 0, 1, 1,
0.7735696, -0.3403096, 0.8135161, 0.6431373, 0, 1, 1,
0.7739332, -0.3397149, 2.599731, 0.6509804, 0, 1, 1,
0.777769, 0.129263, 1.58695, 0.654902, 0, 1, 1,
0.7815313, -1.109914, 3.222287, 0.6627451, 0, 1, 1,
0.7821539, -0.3252603, 1.417441, 0.6666667, 0, 1, 1,
0.7824687, -0.2272208, 0.04248652, 0.6745098, 0, 1, 1,
0.7871783, 0.2887069, 2.929274, 0.6784314, 0, 1, 1,
0.7924858, -0.4902819, 2.247869, 0.6862745, 0, 1, 1,
0.7936693, -0.7491575, 2.318283, 0.6901961, 0, 1, 1,
0.8005992, -0.4129169, 3.888329, 0.6980392, 0, 1, 1,
0.8024741, -1.351729, 3.436042, 0.7058824, 0, 1, 1,
0.8058625, -0.2339293, 0.6613318, 0.7098039, 0, 1, 1,
0.8084024, 0.09338401, 1.015612, 0.7176471, 0, 1, 1,
0.8139168, 0.2682804, 0.798943, 0.7215686, 0, 1, 1,
0.8204527, -0.4262938, 2.051795, 0.7294118, 0, 1, 1,
0.8217246, -0.9603994, 3.951169, 0.7333333, 0, 1, 1,
0.8275936, 0.1751915, 1.803777, 0.7411765, 0, 1, 1,
0.8307004, -0.3860861, 0.9626507, 0.7450981, 0, 1, 1,
0.8315619, -1.282218, 1.727246, 0.7529412, 0, 1, 1,
0.8325544, 1.088895, 1.512228, 0.7568628, 0, 1, 1,
0.8336532, -0.6045728, 2.701868, 0.7647059, 0, 1, 1,
0.8394155, 0.3853188, 3.416117, 0.7686275, 0, 1, 1,
0.8442857, -0.2940576, 0.7844794, 0.7764706, 0, 1, 1,
0.8467039, 0.5277593, 0.4673392, 0.7803922, 0, 1, 1,
0.8522397, 0.1183691, 1.519626, 0.7882353, 0, 1, 1,
0.855871, 0.2548482, 0.5386896, 0.7921569, 0, 1, 1,
0.8564681, 0.007934676, 0.4005909, 0.8, 0, 1, 1,
0.8597136, 1.038671, 0.7882694, 0.8078431, 0, 1, 1,
0.8607597, -0.9473269, 3.168485, 0.8117647, 0, 1, 1,
0.8628438, -0.868234, 1.341703, 0.8196079, 0, 1, 1,
0.8685571, -0.7549079, 1.677674, 0.8235294, 0, 1, 1,
0.8693708, -1.35409, 4.036186, 0.8313726, 0, 1, 1,
0.8783023, 0.5596327, 3.612036, 0.8352941, 0, 1, 1,
0.884293, 0.5072031, 1.174138, 0.8431373, 0, 1, 1,
0.8947096, -0.9825531, 0.8922126, 0.8470588, 0, 1, 1,
0.8952335, -0.610473, 1.694715, 0.854902, 0, 1, 1,
0.9030252, 0.5975439, 0.4299766, 0.8588235, 0, 1, 1,
0.9033298, 1.63269, 1.059523, 0.8666667, 0, 1, 1,
0.9044792, -0.8373359, 1.428138, 0.8705882, 0, 1, 1,
0.9049821, -2.115035, 2.132915, 0.8784314, 0, 1, 1,
0.9098603, -1.66671, 2.65052, 0.8823529, 0, 1, 1,
0.9146186, -0.02042899, 1.885728, 0.8901961, 0, 1, 1,
0.9160628, 1.582616, 0.1187971, 0.8941177, 0, 1, 1,
0.9185603, -0.7002915, 0.57733, 0.9019608, 0, 1, 1,
0.9200255, 1.931054, 0.3751118, 0.9098039, 0, 1, 1,
0.9207774, -0.2227151, 2.514807, 0.9137255, 0, 1, 1,
0.9245316, 0.8589725, 0.9658572, 0.9215686, 0, 1, 1,
0.9282181, 0.7837398, -0.1278494, 0.9254902, 0, 1, 1,
0.9337274, -0.7547512, 2.509502, 0.9333333, 0, 1, 1,
0.9341519, -0.5991927, 3.24059, 0.9372549, 0, 1, 1,
0.9365596, 0.8200316, 0.7480327, 0.945098, 0, 1, 1,
0.9395214, -0.1411241, 1.073724, 0.9490196, 0, 1, 1,
0.9412522, -0.3169786, 2.264481, 0.9568627, 0, 1, 1,
0.9430138, -0.2190834, 1.755175, 0.9607843, 0, 1, 1,
0.9464127, -0.7733826, 1.71714, 0.9686275, 0, 1, 1,
0.9520801, 0.3260223, 0.7829934, 0.972549, 0, 1, 1,
0.9555578, 1.225196, 0.0243849, 0.9803922, 0, 1, 1,
0.9594138, -0.4793538, 2.376053, 0.9843137, 0, 1, 1,
0.9609517, 0.3858877, 0.7450714, 0.9921569, 0, 1, 1,
0.9612544, 1.175656, -0.8745506, 0.9960784, 0, 1, 1,
0.9643625, -0.2887265, 2.25982, 1, 0, 0.9960784, 1,
0.9648359, -0.3625169, 2.214415, 1, 0, 0.9882353, 1,
0.9664512, 1.515202, 1.513009, 1, 0, 0.9843137, 1,
0.9691432, 1.563908, 0.5311807, 1, 0, 0.9764706, 1,
0.9773302, 1.359184, 0.5714296, 1, 0, 0.972549, 1,
0.9894128, 0.0268034, -1.263301, 1, 0, 0.9647059, 1,
0.997789, -0.2906993, -0.09806527, 1, 0, 0.9607843, 1,
1.000621, 1.438214, 1.136659, 1, 0, 0.9529412, 1,
1.001298, 1.216873, 1.152463, 1, 0, 0.9490196, 1,
1.016048, -2.10213, 2.611279, 1, 0, 0.9411765, 1,
1.016837, -0.6240892, 2.276676, 1, 0, 0.9372549, 1,
1.016951, -0.4140065, 3.554239, 1, 0, 0.9294118, 1,
1.018213, 0.01889797, 2.799668, 1, 0, 0.9254902, 1,
1.019226, 1.537625, 1.822704, 1, 0, 0.9176471, 1,
1.019297, 0.6066702, 0.7218094, 1, 0, 0.9137255, 1,
1.019471, 0.7821485, 0.9626789, 1, 0, 0.9058824, 1,
1.02075, 0.08358588, 2.229545, 1, 0, 0.9019608, 1,
1.021072, 0.5961462, -0.1276277, 1, 0, 0.8941177, 1,
1.022603, -0.6788955, 2.676984, 1, 0, 0.8862745, 1,
1.024711, 0.2049501, 1.493254, 1, 0, 0.8823529, 1,
1.027123, -1.946168, 4.367849, 1, 0, 0.8745098, 1,
1.027319, 0.09310222, 1.582771, 1, 0, 0.8705882, 1,
1.046708, 0.6022277, -0.07763377, 1, 0, 0.8627451, 1,
1.047543, 2.003284, 0.3556978, 1, 0, 0.8588235, 1,
1.048319, 0.07609804, 1.255337, 1, 0, 0.8509804, 1,
1.048632, 0.6978595, 1.043798, 1, 0, 0.8470588, 1,
1.049195, 0.4214945, 0.9219882, 1, 0, 0.8392157, 1,
1.052502, 1.01279, 0.6273901, 1, 0, 0.8352941, 1,
1.062629, -0.1842068, 1.240333, 1, 0, 0.827451, 1,
1.068918, 0.6541414, 0.8158779, 1, 0, 0.8235294, 1,
1.06949, 0.1278793, 2.092043, 1, 0, 0.8156863, 1,
1.072688, 0.7364854, 0.2955686, 1, 0, 0.8117647, 1,
1.077689, 0.3092275, -0.7154174, 1, 0, 0.8039216, 1,
1.078399, 0.5724841, 2.555635, 1, 0, 0.7960784, 1,
1.081343, -0.64577, 1.935126, 1, 0, 0.7921569, 1,
1.08162, -0.03782948, 0.6834944, 1, 0, 0.7843137, 1,
1.083071, 1.085339, -0.5248462, 1, 0, 0.7803922, 1,
1.096479, -0.7242156, 1.245376, 1, 0, 0.772549, 1,
1.101166, 0.9650805, 0.3772502, 1, 0, 0.7686275, 1,
1.107832, -1.022694, 3.914173, 1, 0, 0.7607843, 1,
1.108238, 0.5974981, -0.7359888, 1, 0, 0.7568628, 1,
1.109593, 0.02066868, 0.877018, 1, 0, 0.7490196, 1,
1.127174, 0.3740828, 0.9595218, 1, 0, 0.7450981, 1,
1.132865, 1.603791, 1.696644, 1, 0, 0.7372549, 1,
1.141905, -0.8167674, 0.8005866, 1, 0, 0.7333333, 1,
1.142871, -0.416401, 2.361658, 1, 0, 0.7254902, 1,
1.147642, 2.155373, 0.9344043, 1, 0, 0.7215686, 1,
1.156608, -0.3934947, 1.995476, 1, 0, 0.7137255, 1,
1.163756, -0.6862078, 2.771198, 1, 0, 0.7098039, 1,
1.172439, 1.088566, 1.009375, 1, 0, 0.7019608, 1,
1.175993, -0.6894726, 2.076143, 1, 0, 0.6941177, 1,
1.18186, -0.5727171, 1.891694, 1, 0, 0.6901961, 1,
1.188828, 0.7060158, 0.8332444, 1, 0, 0.682353, 1,
1.194726, 1.413283, 0.8105682, 1, 0, 0.6784314, 1,
1.214983, 0.3642381, 2.26442, 1, 0, 0.6705883, 1,
1.222323, 0.7735075, 1.578792, 1, 0, 0.6666667, 1,
1.227959, -0.983308, 0.6289021, 1, 0, 0.6588235, 1,
1.235169, -0.87215, 1.708407, 1, 0, 0.654902, 1,
1.252411, -0.7060383, 2.627058, 1, 0, 0.6470588, 1,
1.262658, -0.6567214, 2.06787, 1, 0, 0.6431373, 1,
1.263748, 0.6765583, 1.331251, 1, 0, 0.6352941, 1,
1.27661, -0.7588434, 1.861163, 1, 0, 0.6313726, 1,
1.278675, 0.7838858, 0.5697813, 1, 0, 0.6235294, 1,
1.287505, -0.06560406, 0.5934789, 1, 0, 0.6196079, 1,
1.293742, 0.9864063, 2.008043, 1, 0, 0.6117647, 1,
1.297087, 1.756647, 0.9092937, 1, 0, 0.6078432, 1,
1.299211, -1.713676, 3.374246, 1, 0, 0.6, 1,
1.301753, 1.664043, 1.072336, 1, 0, 0.5921569, 1,
1.310244, 0.8618777, 1.914164, 1, 0, 0.5882353, 1,
1.311958, -0.8389702, 2.431064, 1, 0, 0.5803922, 1,
1.314378, 0.3044382, -0.4018986, 1, 0, 0.5764706, 1,
1.316287, 0.3076842, 0.909444, 1, 0, 0.5686275, 1,
1.321274, 1.27143, -1.493023, 1, 0, 0.5647059, 1,
1.324067, -0.882237, 2.074225, 1, 0, 0.5568628, 1,
1.324568, -0.008815111, 1.336831, 1, 0, 0.5529412, 1,
1.331773, 1.992213, -0.6991441, 1, 0, 0.5450981, 1,
1.339011, 0.2667868, 1.602089, 1, 0, 0.5411765, 1,
1.346969, 0.03137827, 2.828003, 1, 0, 0.5333334, 1,
1.351413, 0.1290092, 1.917317, 1, 0, 0.5294118, 1,
1.351541, 0.4988114, -0.389671, 1, 0, 0.5215687, 1,
1.367757, -1.23809, 2.23013, 1, 0, 0.5176471, 1,
1.369034, 0.6540643, 1.68572, 1, 0, 0.509804, 1,
1.369841, 1.603698, 2.074474, 1, 0, 0.5058824, 1,
1.373543, 0.4561727, 1.968364, 1, 0, 0.4980392, 1,
1.377213, -0.1120925, 3.170942, 1, 0, 0.4901961, 1,
1.378098, -0.5759793, 2.567019, 1, 0, 0.4862745, 1,
1.400526, -1.056806, 3.315873, 1, 0, 0.4784314, 1,
1.40196, -1.266157, 1.867229, 1, 0, 0.4745098, 1,
1.421746, 1.12302, 3.306213, 1, 0, 0.4666667, 1,
1.429182, 1.44845, -0.06095476, 1, 0, 0.4627451, 1,
1.445997, 0.908693, 1.00349, 1, 0, 0.454902, 1,
1.451167, -1.131862, 1.806885, 1, 0, 0.4509804, 1,
1.451631, 0.396487, 1.295167, 1, 0, 0.4431373, 1,
1.457349, 1.013554, -0.2145816, 1, 0, 0.4392157, 1,
1.457926, 0.5627907, 1.926336, 1, 0, 0.4313726, 1,
1.46043, 0.42883, 0.8913656, 1, 0, 0.427451, 1,
1.46402, 0.9557839, -1.426142, 1, 0, 0.4196078, 1,
1.472986, -2.592026, 2.810343, 1, 0, 0.4156863, 1,
1.477802, 0.2074007, 2.222535, 1, 0, 0.4078431, 1,
1.486479, 1.381835, -0.1201459, 1, 0, 0.4039216, 1,
1.500313, -0.8630046, 3.078964, 1, 0, 0.3960784, 1,
1.515749, 0.4247962, 0.3791547, 1, 0, 0.3882353, 1,
1.517139, -1.660482, 2.860449, 1, 0, 0.3843137, 1,
1.526213, 1.389693, 0.7880145, 1, 0, 0.3764706, 1,
1.531875, 0.6805419, 0.6703171, 1, 0, 0.372549, 1,
1.540334, -1.197059, 1.410585, 1, 0, 0.3647059, 1,
1.540946, 0.3293211, 2.23223, 1, 0, 0.3607843, 1,
1.544067, 0.3374004, 1.314703, 1, 0, 0.3529412, 1,
1.563893, -0.9140804, 0.4418625, 1, 0, 0.3490196, 1,
1.567037, -2.059209, 2.436612, 1, 0, 0.3411765, 1,
1.572299, -0.3209503, 1.575336, 1, 0, 0.3372549, 1,
1.573724, 2.616504, 0.8815425, 1, 0, 0.3294118, 1,
1.574139, -0.01333677, 2.754797, 1, 0, 0.3254902, 1,
1.580835, -1.555636, 2.576565, 1, 0, 0.3176471, 1,
1.584501, 0.7281428, -0.3228, 1, 0, 0.3137255, 1,
1.611982, -0.9767449, 3.563222, 1, 0, 0.3058824, 1,
1.624082, 1.539435, 1.356395, 1, 0, 0.2980392, 1,
1.628873, 1.371938, 1.519996, 1, 0, 0.2941177, 1,
1.630293, -0.5699449, 2.239053, 1, 0, 0.2862745, 1,
1.646487, 1.299398, 2.505737, 1, 0, 0.282353, 1,
1.649135, -1.508239, 1.095079, 1, 0, 0.2745098, 1,
1.656602, 0.4135177, 2.215869, 1, 0, 0.2705882, 1,
1.659958, 0.2394071, 1.974667, 1, 0, 0.2627451, 1,
1.674322, 0.03440928, 1.850985, 1, 0, 0.2588235, 1,
1.674833, -0.5479108, 2.667421, 1, 0, 0.2509804, 1,
1.683161, 1.176264, 1.546546, 1, 0, 0.2470588, 1,
1.696216, -0.1946744, 1.77593, 1, 0, 0.2392157, 1,
1.709041, -1.101497, 1.642998, 1, 0, 0.2352941, 1,
1.7199, -1.662058, 3.073772, 1, 0, 0.227451, 1,
1.738909, -0.305408, 2.329569, 1, 0, 0.2235294, 1,
1.762438, 1.48608, 0.5997661, 1, 0, 0.2156863, 1,
1.768573, 0.8709896, 0.4503432, 1, 0, 0.2117647, 1,
1.781354, -0.08531918, 1.902545, 1, 0, 0.2039216, 1,
1.782901, -0.5487164, 1.261114, 1, 0, 0.1960784, 1,
1.794363, -1.676013, 4.569138, 1, 0, 0.1921569, 1,
1.809985, -1.604115, 2.287043, 1, 0, 0.1843137, 1,
1.832427, -0.6701468, 1.43608, 1, 0, 0.1803922, 1,
1.846751, 1.541715, 0.9476732, 1, 0, 0.172549, 1,
1.847747, 0.07364259, 2.376238, 1, 0, 0.1686275, 1,
1.851304, -0.4853909, 3.451187, 1, 0, 0.1607843, 1,
1.897527, 0.4979588, 1.460883, 1, 0, 0.1568628, 1,
1.899203, -0.5674332, 0.8928456, 1, 0, 0.1490196, 1,
1.928811, 0.1276085, 2.030367, 1, 0, 0.145098, 1,
1.931955, -1.694001, 2.670446, 1, 0, 0.1372549, 1,
1.940514, 1.002302, 1.045447, 1, 0, 0.1333333, 1,
1.941892, -1.301684, 2.437371, 1, 0, 0.1254902, 1,
1.947788, 0.08208475, 1.67389, 1, 0, 0.1215686, 1,
1.953725, 1.344852, -0.6577191, 1, 0, 0.1137255, 1,
1.972718, -0.4172923, 0.5076263, 1, 0, 0.1098039, 1,
2.009928, 0.1693313, 3.589759, 1, 0, 0.1019608, 1,
2.010982, 0.8857902, 0.7620829, 1, 0, 0.09411765, 1,
2.012548, 0.2742416, 3.143785, 1, 0, 0.09019608, 1,
2.040578, -0.0522727, 1.129057, 1, 0, 0.08235294, 1,
2.068334, 0.4469476, 2.642006, 1, 0, 0.07843138, 1,
2.108477, -0.1788851, 2.838984, 1, 0, 0.07058824, 1,
2.185521, 0.6428404, 2.10661, 1, 0, 0.06666667, 1,
2.208129, 0.7363706, 2.112551, 1, 0, 0.05882353, 1,
2.277915, -0.4812009, 1.6621, 1, 0, 0.05490196, 1,
2.329638, -0.3152122, 0.4391589, 1, 0, 0.04705882, 1,
2.35849, -0.4947312, 2.644903, 1, 0, 0.04313726, 1,
2.410009, -1.860436, 1.515394, 1, 0, 0.03529412, 1,
2.477165, -0.2579299, 3.839383, 1, 0, 0.03137255, 1,
2.49583, -0.6292011, 0.7242747, 1, 0, 0.02352941, 1,
2.517833, -1.355505, 1.34795, 1, 0, 0.01960784, 1,
2.856588, -0.5542654, 1.863974, 1, 0, 0.01176471, 1,
2.899977, -0.2736006, 2.559634, 1, 0, 0.007843138, 1
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
-0.2717265, -4.227984, -6.77011, 0, -0.5, 0.5, 0.5,
-0.2717265, -4.227984, -6.77011, 1, -0.5, 0.5, 0.5,
-0.2717265, -4.227984, -6.77011, 1, 1.5, 0.5, 0.5,
-0.2717265, -4.227984, -6.77011, 0, 1.5, 0.5, 0.5
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
-4.518638, 0.1798093, -6.77011, 0, -0.5, 0.5, 0.5,
-4.518638, 0.1798093, -6.77011, 1, -0.5, 0.5, 0.5,
-4.518638, 0.1798093, -6.77011, 1, 1.5, 0.5, 0.5,
-4.518638, 0.1798093, -6.77011, 0, 1.5, 0.5, 0.5
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
-4.518638, -4.227984, -0.07299328, 0, -0.5, 0.5, 0.5,
-4.518638, -4.227984, -0.07299328, 1, -0.5, 0.5, 0.5,
-4.518638, -4.227984, -0.07299328, 1, 1.5, 0.5, 0.5,
-4.518638, -4.227984, -0.07299328, 0, 1.5, 0.5, 0.5
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
-3, -3.210801, -5.224621,
2, -3.210801, -5.224621,
-3, -3.210801, -5.224621,
-3, -3.380332, -5.482203,
-2, -3.210801, -5.224621,
-2, -3.380332, -5.482203,
-1, -3.210801, -5.224621,
-1, -3.380332, -5.482203,
0, -3.210801, -5.224621,
0, -3.380332, -5.482203,
1, -3.210801, -5.224621,
1, -3.380332, -5.482203,
2, -3.210801, -5.224621,
2, -3.380332, -5.482203
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
-3, -3.719393, -5.997365, 0, -0.5, 0.5, 0.5,
-3, -3.719393, -5.997365, 1, -0.5, 0.5, 0.5,
-3, -3.719393, -5.997365, 1, 1.5, 0.5, 0.5,
-3, -3.719393, -5.997365, 0, 1.5, 0.5, 0.5,
-2, -3.719393, -5.997365, 0, -0.5, 0.5, 0.5,
-2, -3.719393, -5.997365, 1, -0.5, 0.5, 0.5,
-2, -3.719393, -5.997365, 1, 1.5, 0.5, 0.5,
-2, -3.719393, -5.997365, 0, 1.5, 0.5, 0.5,
-1, -3.719393, -5.997365, 0, -0.5, 0.5, 0.5,
-1, -3.719393, -5.997365, 1, -0.5, 0.5, 0.5,
-1, -3.719393, -5.997365, 1, 1.5, 0.5, 0.5,
-1, -3.719393, -5.997365, 0, 1.5, 0.5, 0.5,
0, -3.719393, -5.997365, 0, -0.5, 0.5, 0.5,
0, -3.719393, -5.997365, 1, -0.5, 0.5, 0.5,
0, -3.719393, -5.997365, 1, 1.5, 0.5, 0.5,
0, -3.719393, -5.997365, 0, 1.5, 0.5, 0.5,
1, -3.719393, -5.997365, 0, -0.5, 0.5, 0.5,
1, -3.719393, -5.997365, 1, -0.5, 0.5, 0.5,
1, -3.719393, -5.997365, 1, 1.5, 0.5, 0.5,
1, -3.719393, -5.997365, 0, 1.5, 0.5, 0.5,
2, -3.719393, -5.997365, 0, -0.5, 0.5, 0.5,
2, -3.719393, -5.997365, 1, -0.5, 0.5, 0.5,
2, -3.719393, -5.997365, 1, 1.5, 0.5, 0.5,
2, -3.719393, -5.997365, 0, 1.5, 0.5, 0.5
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
-3.538582, -3, -5.224621,
-3.538582, 3, -5.224621,
-3.538582, -3, -5.224621,
-3.701924, -3, -5.482203,
-3.538582, -2, -5.224621,
-3.701924, -2, -5.482203,
-3.538582, -1, -5.224621,
-3.701924, -1, -5.482203,
-3.538582, 0, -5.224621,
-3.701924, 0, -5.482203,
-3.538582, 1, -5.224621,
-3.701924, 1, -5.482203,
-3.538582, 2, -5.224621,
-3.701924, 2, -5.482203,
-3.538582, 3, -5.224621,
-3.701924, 3, -5.482203
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
-4.02861, -3, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, -3, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, -3, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, -3, -5.997365, 0, 1.5, 0.5, 0.5,
-4.02861, -2, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, -2, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, -2, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, -2, -5.997365, 0, 1.5, 0.5, 0.5,
-4.02861, -1, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, -1, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, -1, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, -1, -5.997365, 0, 1.5, 0.5, 0.5,
-4.02861, 0, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, 0, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, 0, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, 0, -5.997365, 0, 1.5, 0.5, 0.5,
-4.02861, 1, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, 1, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, 1, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, 1, -5.997365, 0, 1.5, 0.5, 0.5,
-4.02861, 2, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, 2, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, 2, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, 2, -5.997365, 0, 1.5, 0.5, 0.5,
-4.02861, 3, -5.997365, 0, -0.5, 0.5, 0.5,
-4.02861, 3, -5.997365, 1, -0.5, 0.5, 0.5,
-4.02861, 3, -5.997365, 1, 1.5, 0.5, 0.5,
-4.02861, 3, -5.997365, 0, 1.5, 0.5, 0.5
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
-3.538582, -3.210801, -4,
-3.538582, -3.210801, 4,
-3.538582, -3.210801, -4,
-3.701924, -3.380332, -4,
-3.538582, -3.210801, -2,
-3.701924, -3.380332, -2,
-3.538582, -3.210801, 0,
-3.701924, -3.380332, 0,
-3.538582, -3.210801, 2,
-3.701924, -3.380332, 2,
-3.538582, -3.210801, 4,
-3.701924, -3.380332, 4
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
-4.02861, -3.719393, -4, 0, -0.5, 0.5, 0.5,
-4.02861, -3.719393, -4, 1, -0.5, 0.5, 0.5,
-4.02861, -3.719393, -4, 1, 1.5, 0.5, 0.5,
-4.02861, -3.719393, -4, 0, 1.5, 0.5, 0.5,
-4.02861, -3.719393, -2, 0, -0.5, 0.5, 0.5,
-4.02861, -3.719393, -2, 1, -0.5, 0.5, 0.5,
-4.02861, -3.719393, -2, 1, 1.5, 0.5, 0.5,
-4.02861, -3.719393, -2, 0, 1.5, 0.5, 0.5,
-4.02861, -3.719393, 0, 0, -0.5, 0.5, 0.5,
-4.02861, -3.719393, 0, 1, -0.5, 0.5, 0.5,
-4.02861, -3.719393, 0, 1, 1.5, 0.5, 0.5,
-4.02861, -3.719393, 0, 0, 1.5, 0.5, 0.5,
-4.02861, -3.719393, 2, 0, -0.5, 0.5, 0.5,
-4.02861, -3.719393, 2, 1, -0.5, 0.5, 0.5,
-4.02861, -3.719393, 2, 1, 1.5, 0.5, 0.5,
-4.02861, -3.719393, 2, 0, 1.5, 0.5, 0.5,
-4.02861, -3.719393, 4, 0, -0.5, 0.5, 0.5,
-4.02861, -3.719393, 4, 1, -0.5, 0.5, 0.5,
-4.02861, -3.719393, 4, 1, 1.5, 0.5, 0.5,
-4.02861, -3.719393, 4, 0, 1.5, 0.5, 0.5
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
-3.538582, -3.210801, -5.224621,
-3.538582, 3.57042, -5.224621,
-3.538582, -3.210801, 5.078635,
-3.538582, 3.57042, 5.078635,
-3.538582, -3.210801, -5.224621,
-3.538582, -3.210801, 5.078635,
-3.538582, 3.57042, -5.224621,
-3.538582, 3.57042, 5.078635,
-3.538582, -3.210801, -5.224621,
2.995129, -3.210801, -5.224621,
-3.538582, -3.210801, 5.078635,
2.995129, -3.210801, 5.078635,
-3.538582, 3.57042, -5.224621,
2.995129, 3.57042, -5.224621,
-3.538582, 3.57042, 5.078635,
2.995129, 3.57042, 5.078635,
2.995129, -3.210801, -5.224621,
2.995129, 3.57042, -5.224621,
2.995129, -3.210801, 5.078635,
2.995129, 3.57042, 5.078635,
2.995129, -3.210801, -5.224621,
2.995129, -3.210801, 5.078635,
2.995129, 3.57042, -5.224621,
2.995129, 3.57042, 5.078635
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
var radius = 7.453409;
var distance = 33.16106;
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
mvMatrix.translate( 0.2717265, -0.1798093, 0.07299328 );
mvMatrix.scale( 1.233414, 1.188396, 0.7821578 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.16106);
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
oxyfluorfen<-read.table("oxyfluorfen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxyfluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
```

```r
y<-oxyfluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
```

```r
z<-oxyfluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxyfluorfen' not found
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
-3.44343, -0.1068925, -2.02961, 0, 0, 1, 1, 1,
-3.056875, -0.1020687, -2.029805, 1, 0, 0, 1, 1,
-3.000525, -0.9706613, -0.958317, 1, 0, 0, 1, 1,
-2.987927, -0.4256936, -1.66008, 1, 0, 0, 1, 1,
-2.922465, -0.3819653, -0.6922824, 1, 0, 0, 1, 1,
-2.581344, -0.4075387, -2.895271, 1, 0, 0, 1, 1,
-2.576846, 0.7357795, 0.2422733, 0, 0, 0, 1, 1,
-2.522079, 0.4996618, -0.2248904, 0, 0, 0, 1, 1,
-2.476547, 0.1912877, -2.1813, 0, 0, 0, 1, 1,
-2.474683, -0.8991348, -1.485906, 0, 0, 0, 1, 1,
-2.427593, 0.8008065, -2.103901, 0, 0, 0, 1, 1,
-2.369292, 1.234831, -0.7616528, 0, 0, 0, 1, 1,
-2.233912, 0.2561204, -0.5533935, 0, 0, 0, 1, 1,
-2.232375, 0.4988336, -1.820047, 1, 1, 1, 1, 1,
-2.214845, 0.2881402, -1.405418, 1, 1, 1, 1, 1,
-2.2091, -1.072423, -4.198901, 1, 1, 1, 1, 1,
-2.204658, 0.4675333, -1.784025, 1, 1, 1, 1, 1,
-2.1839, 0.9383643, -0.0336959, 1, 1, 1, 1, 1,
-2.180164, 0.06963721, -2.690712, 1, 1, 1, 1, 1,
-2.145074, -0.3465287, -2.818348, 1, 1, 1, 1, 1,
-2.111484, 0.3244494, -3.103608, 1, 1, 1, 1, 1,
-2.090328, -1.501504, -2.248092, 1, 1, 1, 1, 1,
-2.084538, -0.9931739, -2.000691, 1, 1, 1, 1, 1,
-2.014824, 0.8280672, -2.364372, 1, 1, 1, 1, 1,
-1.996335, -3.014011, -3.7994, 1, 1, 1, 1, 1,
-1.969022, 0.2946624, -2.046429, 1, 1, 1, 1, 1,
-1.968547, -0.8427169, -1.90025, 1, 1, 1, 1, 1,
-1.965604, -1.337267, -2.846481, 1, 1, 1, 1, 1,
-1.952413, -0.1474015, -1.725824, 0, 0, 1, 1, 1,
-1.947935, -0.809366, -1.223949, 1, 0, 0, 1, 1,
-1.943071, 0.03625055, -1.646898, 1, 0, 0, 1, 1,
-1.906115, -0.1921101, -1.796509, 1, 0, 0, 1, 1,
-1.906112, -2.017485, -1.434089, 1, 0, 0, 1, 1,
-1.896967, -1.244008, -3.528943, 1, 0, 0, 1, 1,
-1.879401, -0.1963653, -1.319386, 0, 0, 0, 1, 1,
-1.877657, 0.9781549, -2.392059, 0, 0, 0, 1, 1,
-1.873434, -0.147289, -2.930145, 0, 0, 0, 1, 1,
-1.858338, 0.24679, -0.9976557, 0, 0, 0, 1, 1,
-1.791572, -0.7322528, -2.499941, 0, 0, 0, 1, 1,
-1.789753, 2.117633, -1.46379, 0, 0, 0, 1, 1,
-1.787602, 0.0606722, -2.019088, 0, 0, 0, 1, 1,
-1.765005, 0.5733428, -1.527313, 1, 1, 1, 1, 1,
-1.760699, 0.9293072, -0.8312461, 1, 1, 1, 1, 1,
-1.744769, 0.8910418, -1.319754, 1, 1, 1, 1, 1,
-1.740847, 0.9631973, -1.776331, 1, 1, 1, 1, 1,
-1.736851, 0.4260407, -1.571939, 1, 1, 1, 1, 1,
-1.695501, 0.1484095, -1.351363, 1, 1, 1, 1, 1,
-1.661927, -2.505302, -2.637933, 1, 1, 1, 1, 1,
-1.645787, -0.5531791, -3.927396, 1, 1, 1, 1, 1,
-1.638843, -0.2584937, -1.851224, 1, 1, 1, 1, 1,
-1.633106, -1.878234, -2.188274, 1, 1, 1, 1, 1,
-1.63297, -0.4227091, -2.112139, 1, 1, 1, 1, 1,
-1.628117, 2.067923, -0.4365875, 1, 1, 1, 1, 1,
-1.603609, 0.2648894, -3.593177, 1, 1, 1, 1, 1,
-1.572544, -0.2343014, 0.001247337, 1, 1, 1, 1, 1,
-1.570105, -0.3519549, -1.023896, 1, 1, 1, 1, 1,
-1.568557, -0.1123171, -0.7021317, 0, 0, 1, 1, 1,
-1.566414, 1.257889, -2.274926, 1, 0, 0, 1, 1,
-1.557852, 1.108996, 0.5309662, 1, 0, 0, 1, 1,
-1.5567, -0.08438685, -2.053015, 1, 0, 0, 1, 1,
-1.540855, 0.1589042, -2.791144, 1, 0, 0, 1, 1,
-1.530377, 0.1664575, 0.246034, 1, 0, 0, 1, 1,
-1.528248, -1.680826, -2.183014, 0, 0, 0, 1, 1,
-1.524738, 0.2100718, -1.985849, 0, 0, 0, 1, 1,
-1.506092, -0.9589765, -0.1580421, 0, 0, 0, 1, 1,
-1.505114, 0.2571189, -1.811088, 0, 0, 0, 1, 1,
-1.504841, 1.123543, 0.3494265, 0, 0, 0, 1, 1,
-1.504219, -0.1568594, -3.071532, 0, 0, 0, 1, 1,
-1.499968, -0.1615947, -1.279993, 0, 0, 0, 1, 1,
-1.499332, 0.8292147, -1.821877, 1, 1, 1, 1, 1,
-1.497109, -0.4795453, -2.886587, 1, 1, 1, 1, 1,
-1.489543, 1.052944, -1.014813, 1, 1, 1, 1, 1,
-1.470967, -0.0208823, -3.338219, 1, 1, 1, 1, 1,
-1.469911, -0.0573151, -1.831833, 1, 1, 1, 1, 1,
-1.463713, -1.002968, -2.668348, 1, 1, 1, 1, 1,
-1.450423, 1.172195, -1.349935, 1, 1, 1, 1, 1,
-1.442915, 0.3513368, -0.7123314, 1, 1, 1, 1, 1,
-1.433297, -0.788148, -2.598056, 1, 1, 1, 1, 1,
-1.409189, -0.2055425, -1.581846, 1, 1, 1, 1, 1,
-1.4054, 2.098744, -0.3970987, 1, 1, 1, 1, 1,
-1.398847, 0.5736454, -0.8025196, 1, 1, 1, 1, 1,
-1.370757, -0.8122025, -2.746372, 1, 1, 1, 1, 1,
-1.363043, -0.02350632, -1.692052, 1, 1, 1, 1, 1,
-1.358174, 0.2376396, -1.044083, 1, 1, 1, 1, 1,
-1.355191, 0.7146911, 0.5029433, 0, 0, 1, 1, 1,
-1.344431, -0.4638488, -1.011421, 1, 0, 0, 1, 1,
-1.343015, -0.5375424, -2.843213, 1, 0, 0, 1, 1,
-1.338625, -1.403897, -3.693104, 1, 0, 0, 1, 1,
-1.334525, 0.9446683, -1.059731, 1, 0, 0, 1, 1,
-1.317604, 0.2525138, -2.344887, 1, 0, 0, 1, 1,
-1.314924, 2.542111, -0.758002, 0, 0, 0, 1, 1,
-1.307529, 0.9030529, -1.173133, 0, 0, 0, 1, 1,
-1.303303, -0.02596091, -1.618972, 0, 0, 0, 1, 1,
-1.288375, -0.1565107, -2.334053, 0, 0, 0, 1, 1,
-1.284377, -0.3563074, -1.526063, 0, 0, 0, 1, 1,
-1.279667, -0.09266566, -0.771762, 0, 0, 0, 1, 1,
-1.270831, 1.344438, -0.7508039, 0, 0, 0, 1, 1,
-1.26981, -0.3933517, -2.665196, 1, 1, 1, 1, 1,
-1.267366, -0.4555756, -1.555218, 1, 1, 1, 1, 1,
-1.253825, 0.8141459, -0.8748446, 1, 1, 1, 1, 1,
-1.243284, 1.711182, -0.07646386, 1, 1, 1, 1, 1,
-1.234492, -2.388816, -1.655448, 1, 1, 1, 1, 1,
-1.228052, 0.4658588, -2.527409, 1, 1, 1, 1, 1,
-1.224261, -0.7487515, -1.833314, 1, 1, 1, 1, 1,
-1.220446, -0.01529914, -1.610982, 1, 1, 1, 1, 1,
-1.196913, 0.6645973, 0.4918066, 1, 1, 1, 1, 1,
-1.185277, -1.957853, -2.245683, 1, 1, 1, 1, 1,
-1.171522, 0.454596, -1.687909, 1, 1, 1, 1, 1,
-1.161173, 2.434401, -0.7177256, 1, 1, 1, 1, 1,
-1.155829, 0.09850503, -2.384646, 1, 1, 1, 1, 1,
-1.153854, 1.157319, -2.171706, 1, 1, 1, 1, 1,
-1.144088, -0.325552, -2.485352, 1, 1, 1, 1, 1,
-1.13687, 1.530906, -1.116055, 0, 0, 1, 1, 1,
-1.135796, -1.139678, -1.585167, 1, 0, 0, 1, 1,
-1.131283, 0.4772958, -0.09181635, 1, 0, 0, 1, 1,
-1.131117, -0.9664375, -3.43304, 1, 0, 0, 1, 1,
-1.10963, 0.1314176, -3.113188, 1, 0, 0, 1, 1,
-1.093942, 1.661301, -1.65871, 1, 0, 0, 1, 1,
-1.092446, 1.11614, -1.068722, 0, 0, 0, 1, 1,
-1.088866, 2.223809, -0.3122682, 0, 0, 0, 1, 1,
-1.088579, -0.05933009, -2.180024, 0, 0, 0, 1, 1,
-1.078443, 0.9507992, -2.242618, 0, 0, 0, 1, 1,
-1.073303, 0.559024, -2.41078, 0, 0, 0, 1, 1,
-1.070034, -0.6045156, -2.146757, 0, 0, 0, 1, 1,
-1.065185, -1.317978, -3.420072, 0, 0, 0, 1, 1,
-1.05452, 0.9916223, -0.8305488, 1, 1, 1, 1, 1,
-1.045596, -0.003755753, -1.361903, 1, 1, 1, 1, 1,
-1.04554, -1.014105, -2.645948, 1, 1, 1, 1, 1,
-1.043136, -0.6777234, -1.27751, 1, 1, 1, 1, 1,
-1.038547, 0.7422147, -1.578485, 1, 1, 1, 1, 1,
-1.034685, 0.04846126, -0.01440245, 1, 1, 1, 1, 1,
-1.033879, 1.8307, 1.207388, 1, 1, 1, 1, 1,
-1.032621, 0.6701064, -0.9373177, 1, 1, 1, 1, 1,
-1.031659, -0.8788562, -1.046231, 1, 1, 1, 1, 1,
-1.02719, 0.6360736, -1.039506, 1, 1, 1, 1, 1,
-1.022954, -1.386449, -2.493524, 1, 1, 1, 1, 1,
-1.016477, 1.429089, -0.2132596, 1, 1, 1, 1, 1,
-1.013855, -0.3723377, -2.903933, 1, 1, 1, 1, 1,
-1.012635, 0.3539625, -3.041305, 1, 1, 1, 1, 1,
-1.005267, -1.406489, -3.429584, 1, 1, 1, 1, 1,
-1.004033, 0.9110211, -3.71166, 0, 0, 1, 1, 1,
-1.00027, -2.265074, -1.110818, 1, 0, 0, 1, 1,
-0.9995964, -1.081877, -2.574288, 1, 0, 0, 1, 1,
-0.9980555, 0.2163525, -2.485488, 1, 0, 0, 1, 1,
-0.9932256, 0.558088, 0.4591133, 1, 0, 0, 1, 1,
-0.9931462, 0.3118539, -3.087452, 1, 0, 0, 1, 1,
-0.9872949, 0.3030896, -1.991114, 0, 0, 0, 1, 1,
-0.9865338, 0.323011, -1.619289, 0, 0, 0, 1, 1,
-0.9832529, 0.3703107, -1.380803, 0, 0, 0, 1, 1,
-0.9823824, -0.9711655, -3.113896, 0, 0, 0, 1, 1,
-0.9777755, 1.876053, -0.2229055, 0, 0, 0, 1, 1,
-0.9771669, -0.6915688, -2.677294, 0, 0, 0, 1, 1,
-0.9670786, -0.3691559, -2.029141, 0, 0, 0, 1, 1,
-0.9670172, 0.9240825, 0.7774252, 1, 1, 1, 1, 1,
-0.9588705, 1.95142, -1.656672, 1, 1, 1, 1, 1,
-0.95671, 0.146586, -1.834154, 1, 1, 1, 1, 1,
-0.9399328, -0.4191273, -2.403, 1, 1, 1, 1, 1,
-0.9310534, -0.5906683, -0.4748307, 1, 1, 1, 1, 1,
-0.9298859, 1.104652, 0.03118532, 1, 1, 1, 1, 1,
-0.9274915, 1.617283, 0.1722035, 1, 1, 1, 1, 1,
-0.9274461, 2.578736, -0.5421561, 1, 1, 1, 1, 1,
-0.9245889, -2.208472, -4.477565, 1, 1, 1, 1, 1,
-0.9184052, 0.2850536, -0.7753661, 1, 1, 1, 1, 1,
-0.9156889, 1.323933, -2.532869, 1, 1, 1, 1, 1,
-0.912823, 1.706601, -0.7988027, 1, 1, 1, 1, 1,
-0.9095949, -1.190331, -1.662409, 1, 1, 1, 1, 1,
-0.9091121, -1.843302, -2.321174, 1, 1, 1, 1, 1,
-0.8985904, -0.1991076, -1.195598, 1, 1, 1, 1, 1,
-0.8963624, -0.2797274, -0.7306174, 0, 0, 1, 1, 1,
-0.8954846, -0.8582915, -0.3171765, 1, 0, 0, 1, 1,
-0.8936258, 1.372484, 0.3212626, 1, 0, 0, 1, 1,
-0.890715, 0.3320231, -2.381893, 1, 0, 0, 1, 1,
-0.8905497, -1.902543, -3.126971, 1, 0, 0, 1, 1,
-0.8900791, 0.08820414, -2.627565, 1, 0, 0, 1, 1,
-0.8741538, -1.707882, -3.301082, 0, 0, 0, 1, 1,
-0.8740911, 0.8615364, 0.2682219, 0, 0, 0, 1, 1,
-0.8721408, -0.8411557, -3.171277, 0, 0, 0, 1, 1,
-0.8714169, 0.744094, -1.055317, 0, 0, 0, 1, 1,
-0.8695573, -1.026419, -2.347764, 0, 0, 0, 1, 1,
-0.8685002, -0.8923106, -3.812331, 0, 0, 0, 1, 1,
-0.8655591, -0.161768, -2.229395, 0, 0, 0, 1, 1,
-0.8641546, 0.5185373, -0.5047094, 1, 1, 1, 1, 1,
-0.8637182, 0.5334548, -2.114983, 1, 1, 1, 1, 1,
-0.8611274, -1.110171, -3.041439, 1, 1, 1, 1, 1,
-0.851448, 0.06612605, -0.9405944, 1, 1, 1, 1, 1,
-0.8497059, 0.2462559, -2.021564, 1, 1, 1, 1, 1,
-0.8399236, -2.254358, -1.699813, 1, 1, 1, 1, 1,
-0.8377303, -1.265419, -2.088971, 1, 1, 1, 1, 1,
-0.8365501, -0.5193982, -1.750318, 1, 1, 1, 1, 1,
-0.8340415, -0.439989, -1.798023, 1, 1, 1, 1, 1,
-0.8306455, -1.119271, -4.00991, 1, 1, 1, 1, 1,
-0.8280841, -1.097066, -3.583098, 1, 1, 1, 1, 1,
-0.8218257, -0.7086149, -0.3154347, 1, 1, 1, 1, 1,
-0.8208279, -0.1037726, -0.6685066, 1, 1, 1, 1, 1,
-0.8175388, 0.7976005, -1.433064, 1, 1, 1, 1, 1,
-0.8153286, -0.4497665, -0.9729744, 1, 1, 1, 1, 1,
-0.8119779, -0.5410507, -1.533538, 0, 0, 1, 1, 1,
-0.8115191, -1.288971, -3.766109, 1, 0, 0, 1, 1,
-0.8088152, -0.4903656, -1.014259, 1, 0, 0, 1, 1,
-0.8066349, -0.9534856, -3.541434, 1, 0, 0, 1, 1,
-0.8058884, 0.4570251, -1.560707, 1, 0, 0, 1, 1,
-0.8053699, -1.262688, -2.701231, 1, 0, 0, 1, 1,
-0.8028924, 1.495148, -0.0717845, 0, 0, 0, 1, 1,
-0.8006505, -0.9025562, -1.247133, 0, 0, 0, 1, 1,
-0.7948604, 0.02741926, -1.928584, 0, 0, 0, 1, 1,
-0.7794148, 0.5861965, -1.177487, 0, 0, 0, 1, 1,
-0.7693192, -0.4638042, -0.9955969, 0, 0, 0, 1, 1,
-0.7692585, 1.560298, 1.234318, 0, 0, 0, 1, 1,
-0.7685459, 0.7378296, -0.2075536, 0, 0, 0, 1, 1,
-0.7677548, 0.5535167, -1.228465, 1, 1, 1, 1, 1,
-0.7667621, -0.3120956, -2.276464, 1, 1, 1, 1, 1,
-0.7656593, 1.031437, -0.003504067, 1, 1, 1, 1, 1,
-0.7650919, -0.03338145, -1.175912, 1, 1, 1, 1, 1,
-0.7613476, -0.6431892, -1.153957, 1, 1, 1, 1, 1,
-0.7570269, 0.154505, -1.869606, 1, 1, 1, 1, 1,
-0.7565158, -0.7447092, -2.316476, 1, 1, 1, 1, 1,
-0.7563564, 0.09624118, -1.515492, 1, 1, 1, 1, 1,
-0.7549988, -1.035147, -2.413159, 1, 1, 1, 1, 1,
-0.7538002, -0.3781924, -1.224072, 1, 1, 1, 1, 1,
-0.751038, -0.372082, -1.321502, 1, 1, 1, 1, 1,
-0.7475772, 0.4254396, -1.115011, 1, 1, 1, 1, 1,
-0.7473357, 0.1460389, -1.662729, 1, 1, 1, 1, 1,
-0.7366041, -0.9485689, -2.006136, 1, 1, 1, 1, 1,
-0.7351647, -0.6627873, -2.228058, 1, 1, 1, 1, 1,
-0.7318413, -0.6897238, -0.1517179, 0, 0, 1, 1, 1,
-0.7263837, -0.5835412, -0.88207, 1, 0, 0, 1, 1,
-0.7198814, -0.4159413, -2.260313, 1, 0, 0, 1, 1,
-0.7198067, 0.08871738, -2.225331, 1, 0, 0, 1, 1,
-0.7187592, -0.127889, -2.088105, 1, 0, 0, 1, 1,
-0.7113095, -0.07210594, -2.411443, 1, 0, 0, 1, 1,
-0.7106342, 0.8382873, -1.204513, 0, 0, 0, 1, 1,
-0.7103605, -1.399656, -3.960237, 0, 0, 0, 1, 1,
-0.7063078, 0.6267362, -0.7610547, 0, 0, 0, 1, 1,
-0.7060979, 1.136583, 0.6981192, 0, 0, 0, 1, 1,
-0.7011768, 0.05396965, -0.5823016, 0, 0, 0, 1, 1,
-0.6980972, -1.465616, -2.224685, 0, 0, 0, 1, 1,
-0.6966993, -1.130681, -1.310221, 0, 0, 0, 1, 1,
-0.6961684, -0.03441047, -0.1868602, 1, 1, 1, 1, 1,
-0.6942157, -0.2837033, -1.810358, 1, 1, 1, 1, 1,
-0.6923391, 0.2168768, -1.631732, 1, 1, 1, 1, 1,
-0.6916346, -1.68927, -2.573156, 1, 1, 1, 1, 1,
-0.6865315, 0.1511695, -0.8606228, 1, 1, 1, 1, 1,
-0.6808711, 1.010419, -1.166125, 1, 1, 1, 1, 1,
-0.6769093, 1.683241, 0.4077758, 1, 1, 1, 1, 1,
-0.6759598, 1.161078, -0.8171195, 1, 1, 1, 1, 1,
-0.6724911, -1.846382, -3.195142, 1, 1, 1, 1, 1,
-0.6705925, -0.9495754, -2.693008, 1, 1, 1, 1, 1,
-0.6667375, 0.06037576, -0.1480474, 1, 1, 1, 1, 1,
-0.6665801, -0.1271286, -2.459692, 1, 1, 1, 1, 1,
-0.657397, -0.5765426, -3.677158, 1, 1, 1, 1, 1,
-0.6434576, 1.291027, -0.4898697, 1, 1, 1, 1, 1,
-0.6402457, -0.9913985, -2.797422, 1, 1, 1, 1, 1,
-0.6355947, -0.03663014, 0.5739977, 0, 0, 1, 1, 1,
-0.6354128, -0.1454643, -1.093996, 1, 0, 0, 1, 1,
-0.6229416, 0.1449025, -1.04543, 1, 0, 0, 1, 1,
-0.6224893, -0.2897011, -2.45892, 1, 0, 0, 1, 1,
-0.6209304, 1.119026, -1.982138, 1, 0, 0, 1, 1,
-0.6185357, -0.490827, -4.527473, 1, 0, 0, 1, 1,
-0.6108174, 1.336973, -1.081344, 0, 0, 0, 1, 1,
-0.608803, -2.15293, -4.180741, 0, 0, 0, 1, 1,
-0.6080577, -0.9199834, -3.506453, 0, 0, 0, 1, 1,
-0.6064985, 0.6963553, -0.1399498, 0, 0, 0, 1, 1,
-0.6052602, 0.3733035, -2.415519, 0, 0, 0, 1, 1,
-0.6012034, 0.6022537, -2.285197, 0, 0, 0, 1, 1,
-0.5990545, -0.1006302, -3.270214, 0, 0, 0, 1, 1,
-0.598895, 1.079221, -2.4641, 1, 1, 1, 1, 1,
-0.5984645, 0.3046823, 0.8353513, 1, 1, 1, 1, 1,
-0.5983144, -2.222332, -3.819778, 1, 1, 1, 1, 1,
-0.5949628, -0.997639, -2.853751, 1, 1, 1, 1, 1,
-0.5946298, 1.339454, 0.8349961, 1, 1, 1, 1, 1,
-0.5924104, 1.112099, -1.337705, 1, 1, 1, 1, 1,
-0.585093, -1.097376, -3.436283, 1, 1, 1, 1, 1,
-0.5777758, -0.5754395, -2.765817, 1, 1, 1, 1, 1,
-0.5703627, 0.1678918, -0.3453233, 1, 1, 1, 1, 1,
-0.5675842, 0.8152374, -0.7943796, 1, 1, 1, 1, 1,
-0.5673027, -2.915449, -4.102411, 1, 1, 1, 1, 1,
-0.5669377, -0.4411544, -1.608547, 1, 1, 1, 1, 1,
-0.5632561, -1.591277, -3.272042, 1, 1, 1, 1, 1,
-0.5590508, 0.3388025, -1.06646, 1, 1, 1, 1, 1,
-0.5572442, 0.1842402, -1.16411, 1, 1, 1, 1, 1,
-0.552601, -1.512436, -4.41456, 0, 0, 1, 1, 1,
-0.548826, -0.220927, -0.9105665, 1, 0, 0, 1, 1,
-0.5485895, -0.3143124, -4.383632, 1, 0, 0, 1, 1,
-0.5458569, -0.1098526, -2.499155, 1, 0, 0, 1, 1,
-0.5453064, -0.8757381, -3.244009, 1, 0, 0, 1, 1,
-0.5433307, -0.1886493, -0.9852718, 1, 0, 0, 1, 1,
-0.537621, 0.2064541, -0.2833099, 0, 0, 0, 1, 1,
-0.5320469, -1.415233, -2.104194, 0, 0, 0, 1, 1,
-0.5298851, -1.041705, -2.974679, 0, 0, 0, 1, 1,
-0.5247614, -1.543666, -5.074574, 0, 0, 0, 1, 1,
-0.5193337, 1.99121, -1.018202, 0, 0, 0, 1, 1,
-0.5192871, 0.004228105, -1.946461, 0, 0, 0, 1, 1,
-0.5137179, -1.096625, -3.723732, 0, 0, 0, 1, 1,
-0.5131069, 0.3320617, 0.6439068, 1, 1, 1, 1, 1,
-0.5124173, -0.5889742, -3.369873, 1, 1, 1, 1, 1,
-0.5096698, 1.337863, 0.1744099, 1, 1, 1, 1, 1,
-0.5084723, -0.3593606, -4.232128, 1, 1, 1, 1, 1,
-0.4863628, 0.343282, 1.649345, 1, 1, 1, 1, 1,
-0.4828491, 1.275377, 0.2418028, 1, 1, 1, 1, 1,
-0.4805871, -2.860231, -3.129368, 1, 1, 1, 1, 1,
-0.4798017, 1.081131, -0.4906114, 1, 1, 1, 1, 1,
-0.4771205, -1.897113, -3.420913, 1, 1, 1, 1, 1,
-0.4727257, 0.5627837, -0.3822266, 1, 1, 1, 1, 1,
-0.4707896, -0.7575185, -2.509415, 1, 1, 1, 1, 1,
-0.4702137, 0.85185, -1.060962, 1, 1, 1, 1, 1,
-0.4692261, -1.714223, -1.840581, 1, 1, 1, 1, 1,
-0.468883, -0.830789, -3.757149, 1, 1, 1, 1, 1,
-0.4651668, -2.611501, -0.573505, 1, 1, 1, 1, 1,
-0.4649098, -0.07169739, -1.14679, 0, 0, 1, 1, 1,
-0.4627716, 1.440071, 0.4681977, 1, 0, 0, 1, 1,
-0.4624634, 0.3275163, -1.927271, 1, 0, 0, 1, 1,
-0.4585329, 1.448396, -0.5161429, 1, 0, 0, 1, 1,
-0.455733, -0.7609007, -1.963641, 1, 0, 0, 1, 1,
-0.4534254, 1.710456, -0.01633717, 1, 0, 0, 1, 1,
-0.4516478, 0.7266508, -0.8328263, 0, 0, 0, 1, 1,
-0.4510807, -0.957754, -1.433219, 0, 0, 0, 1, 1,
-0.4474795, 0.06425714, -1.007033, 0, 0, 0, 1, 1,
-0.4448196, 1.748366, -1.244412, 0, 0, 0, 1, 1,
-0.4437126, 1.493156, -1.34672, 0, 0, 0, 1, 1,
-0.4436572, 1.134559, -0.6237698, 0, 0, 0, 1, 1,
-0.440039, 0.6275082, 0.07646757, 0, 0, 0, 1, 1,
-0.4371339, 0.5611249, -1.350505, 1, 1, 1, 1, 1,
-0.4356828, 0.3527992, -1.828483, 1, 1, 1, 1, 1,
-0.4341289, -0.3754418, -1.688072, 1, 1, 1, 1, 1,
-0.4316434, 0.9667898, 0.8242652, 1, 1, 1, 1, 1,
-0.4291488, -0.06086679, 0.2259714, 1, 1, 1, 1, 1,
-0.4236824, -0.6634158, -2.60564, 1, 1, 1, 1, 1,
-0.42175, 2.264949, 0.001171604, 1, 1, 1, 1, 1,
-0.4211987, 0.7643678, -0.737698, 1, 1, 1, 1, 1,
-0.4140823, -0.8752293, -2.630147, 1, 1, 1, 1, 1,
-0.4065602, 0.8931433, 0.6333879, 1, 1, 1, 1, 1,
-0.4027875, -0.04011741, -0.2525511, 1, 1, 1, 1, 1,
-0.402212, -1.860661, -1.997674, 1, 1, 1, 1, 1,
-0.3974782, -2.185713, -4.578367, 1, 1, 1, 1, 1,
-0.3931581, 0.6401456, -0.2020316, 1, 1, 1, 1, 1,
-0.3905403, -1.02847, -1.945686, 1, 1, 1, 1, 1,
-0.3871388, -0.6561871, -3.033661, 0, 0, 1, 1, 1,
-0.3854597, -0.106232, -3.294642, 1, 0, 0, 1, 1,
-0.3847603, 1.593667, 0.7671698, 1, 0, 0, 1, 1,
-0.3802596, -0.6411397, -1.718948, 1, 0, 0, 1, 1,
-0.3787711, -2.10352, -3.49253, 1, 0, 0, 1, 1,
-0.3786115, -0.3679574, -2.770904, 1, 0, 0, 1, 1,
-0.3769022, 0.7877633, 1.40187, 0, 0, 0, 1, 1,
-0.3766688, 1.013202, -1.111868, 0, 0, 0, 1, 1,
-0.3707857, 0.5336146, -0.4997541, 0, 0, 0, 1, 1,
-0.3663227, -0.867848, -4.186116, 0, 0, 0, 1, 1,
-0.3629262, 1.106907, 0.6895245, 0, 0, 0, 1, 1,
-0.36187, -0.6572119, -3.491284, 0, 0, 0, 1, 1,
-0.3595124, -1.790769, -1.003998, 0, 0, 0, 1, 1,
-0.3564914, 0.09105907, -2.678093, 1, 1, 1, 1, 1,
-0.3560194, -1.540113, -3.655429, 1, 1, 1, 1, 1,
-0.3545683, -1.073696, -3.38309, 1, 1, 1, 1, 1,
-0.3532135, -2.216852, -2.062499, 1, 1, 1, 1, 1,
-0.3525128, -1.973409, -3.34365, 1, 1, 1, 1, 1,
-0.3409368, -0.05166906, 1.066993, 1, 1, 1, 1, 1,
-0.3397036, -0.7039472, -3.236264, 1, 1, 1, 1, 1,
-0.3396224, 0.4417802, 0.2764786, 1, 1, 1, 1, 1,
-0.3380964, -0.9812996, -3.601606, 1, 1, 1, 1, 1,
-0.337605, -0.1267176, -2.591633, 1, 1, 1, 1, 1,
-0.3302571, 0.1029402, -3.085268, 1, 1, 1, 1, 1,
-0.3301536, -0.02834901, -2.538043, 1, 1, 1, 1, 1,
-0.326874, 0.5660824, -1.354452, 1, 1, 1, 1, 1,
-0.3215852, -0.6921361, -3.435208, 1, 1, 1, 1, 1,
-0.3188429, -1.295663, -2.433296, 1, 1, 1, 1, 1,
-0.3173568, 1.328831, -2.214311, 0, 0, 1, 1, 1,
-0.3123327, 0.2571198, -0.8969768, 1, 0, 0, 1, 1,
-0.3113574, -0.2418925, -1.958184, 1, 0, 0, 1, 1,
-0.310144, 0.2220259, 1.042666, 1, 0, 0, 1, 1,
-0.30781, 0.9698603, -0.04774854, 1, 0, 0, 1, 1,
-0.307772, -0.1776001, -1.133241, 1, 0, 0, 1, 1,
-0.3039964, -0.8851051, -2.834797, 0, 0, 0, 1, 1,
-0.2978022, -1.191684, -3.42795, 0, 0, 0, 1, 1,
-0.2976817, -0.5761186, -3.210857, 0, 0, 0, 1, 1,
-0.2954343, -0.1729572, -3.525819, 0, 0, 0, 1, 1,
-0.2921247, 0.3700237, -1.198926, 0, 0, 0, 1, 1,
-0.2914596, 0.9838502, -1.84057, 0, 0, 0, 1, 1,
-0.2889397, -0.4651032, -2.012536, 0, 0, 0, 1, 1,
-0.2854052, -1.462298, -4.201996, 1, 1, 1, 1, 1,
-0.2839324, 0.5376309, -1.183671, 1, 1, 1, 1, 1,
-0.2784308, 0.5775124, -0.9048737, 1, 1, 1, 1, 1,
-0.2768972, -0.4810841, -3.456069, 1, 1, 1, 1, 1,
-0.2767027, 0.08238439, -3.458879, 1, 1, 1, 1, 1,
-0.2761769, -0.5305198, -3.251369, 1, 1, 1, 1, 1,
-0.2755567, -0.6043072, 0.1295255, 1, 1, 1, 1, 1,
-0.272242, -2.372878, -2.534573, 1, 1, 1, 1, 1,
-0.26626, -1.627525, -2.794528, 1, 1, 1, 1, 1,
-0.2656423, 1.610272, 0.2653881, 1, 1, 1, 1, 1,
-0.2646821, -2.53335, -3.742377, 1, 1, 1, 1, 1,
-0.2636172, -0.6421279, -3.252661, 1, 1, 1, 1, 1,
-0.2625759, -1.024023, -1.490153, 1, 1, 1, 1, 1,
-0.2612912, -0.9230887, -4.420057, 1, 1, 1, 1, 1,
-0.2588743, -0.3882896, -2.747543, 1, 1, 1, 1, 1,
-0.2547544, -0.6820393, -1.619695, 0, 0, 1, 1, 1,
-0.2539071, -1.269895, -3.887281, 1, 0, 0, 1, 1,
-0.2475684, 0.0006107969, -1.233101, 1, 0, 0, 1, 1,
-0.2471849, -0.5776199, -2.782535, 1, 0, 0, 1, 1,
-0.243519, -0.9473445, -3.624676, 1, 0, 0, 1, 1,
-0.2401635, -0.3204749, -2.230206, 1, 0, 0, 1, 1,
-0.2384561, 0.5375569, -0.07496899, 0, 0, 0, 1, 1,
-0.2313872, 0.2248576, -1.925501, 0, 0, 0, 1, 1,
-0.2295584, -0.7016867, -3.907969, 0, 0, 0, 1, 1,
-0.2227028, -2.318127, -1.934526, 0, 0, 0, 1, 1,
-0.222147, 0.3762434, 0.4753458, 0, 0, 0, 1, 1,
-0.2200198, -0.638081, -3.813769, 0, 0, 0, 1, 1,
-0.2142868, 0.8686828, 0.4988062, 0, 0, 0, 1, 1,
-0.213321, 0.6256188, -0.7233364, 1, 1, 1, 1, 1,
-0.2033975, -1.365243, -3.716193, 1, 1, 1, 1, 1,
-0.2011242, -0.5005528, -1.520138, 1, 1, 1, 1, 1,
-0.1970766, 0.8785468, -1.312103, 1, 1, 1, 1, 1,
-0.1893039, 1.06742, -1.584325, 1, 1, 1, 1, 1,
-0.1875156, -1.742944, -3.670698, 1, 1, 1, 1, 1,
-0.1874673, -1.582266, -3.413691, 1, 1, 1, 1, 1,
-0.1847857, 0.2864296, -0.8560474, 1, 1, 1, 1, 1,
-0.1824947, -0.4839494, -2.691285, 1, 1, 1, 1, 1,
-0.1814435, -0.8291501, -0.853332, 1, 1, 1, 1, 1,
-0.1767488, 0.1567614, -1.819743, 1, 1, 1, 1, 1,
-0.1671063, -0.4896089, -2.879327, 1, 1, 1, 1, 1,
-0.1619917, 0.622827, -0.2560273, 1, 1, 1, 1, 1,
-0.161485, -0.8174946, -3.675588, 1, 1, 1, 1, 1,
-0.1611999, 0.737879, -1.040708, 1, 1, 1, 1, 1,
-0.1597859, -0.8961919, -3.484134, 0, 0, 1, 1, 1,
-0.1592931, 1.572473, 0.3133625, 1, 0, 0, 1, 1,
-0.1581374, -0.1268581, -1.675507, 1, 0, 0, 1, 1,
-0.1541094, -0.6486476, -3.485874, 1, 0, 0, 1, 1,
-0.1516236, -0.7430513, -2.978179, 1, 0, 0, 1, 1,
-0.1485575, -0.2766576, -2.785355, 1, 0, 0, 1, 1,
-0.1474117, 0.290748, -0.1805368, 0, 0, 0, 1, 1,
-0.143096, 1.396859, 2.091167, 0, 0, 0, 1, 1,
-0.1323208, -0.04493831, -1.760972, 0, 0, 0, 1, 1,
-0.1298375, -0.7072681, -2.378224, 0, 0, 0, 1, 1,
-0.1283322, 0.4623576, 0.8018041, 0, 0, 0, 1, 1,
-0.1242958, -1.857162, -3.272671, 0, 0, 0, 1, 1,
-0.1201777, 0.572103, 0.729819, 0, 0, 0, 1, 1,
-0.1167662, -1.695249, -4.347116, 1, 1, 1, 1, 1,
-0.115784, -1.701339, -3.976589, 1, 1, 1, 1, 1,
-0.1148961, -0.8644218, -1.17946, 1, 1, 1, 1, 1,
-0.1070038, 0.2255761, -0.7013933, 1, 1, 1, 1, 1,
-0.1063762, -0.1590175, -2.340538, 1, 1, 1, 1, 1,
-0.1057558, -1.613602, -2.963699, 1, 1, 1, 1, 1,
-0.1057527, 0.2842183, -1.131016, 1, 1, 1, 1, 1,
-0.1037532, 1.364542, 0.296258, 1, 1, 1, 1, 1,
-0.08835744, 1.82046, 1.021228, 1, 1, 1, 1, 1,
-0.08459394, 0.5583944, -1.836314, 1, 1, 1, 1, 1,
-0.08340377, 0.4456598, 0.2968124, 1, 1, 1, 1, 1,
-0.08044118, -0.8405061, -4.239244, 1, 1, 1, 1, 1,
-0.07519317, 0.2993971, -0.1189019, 1, 1, 1, 1, 1,
-0.07454515, 0.1137174, -1.237834, 1, 1, 1, 1, 1,
-0.0742015, 0.5552948, -2.294538, 1, 1, 1, 1, 1,
-0.07175779, -1.252548, -4.743814, 0, 0, 1, 1, 1,
-0.07162862, 0.4649341, -0.6058823, 1, 0, 0, 1, 1,
-0.0683241, -0.67919, -2.893718, 1, 0, 0, 1, 1,
-0.06777199, -0.661979, -2.756486, 1, 0, 0, 1, 1,
-0.06556395, 0.6716079, 0.4862263, 1, 0, 0, 1, 1,
-0.0648473, -0.05605916, -0.6717668, 1, 0, 0, 1, 1,
-0.06261648, 0.1342017, -1.453287, 0, 0, 0, 1, 1,
-0.06051368, 0.1044519, 1.190528, 0, 0, 0, 1, 1,
-0.05920033, -1.504639, -2.313891, 0, 0, 0, 1, 1,
-0.05911845, 0.2251126, 0.5552911, 0, 0, 0, 1, 1,
-0.05662924, -0.7113276, -2.384793, 0, 0, 0, 1, 1,
-0.05556216, 0.7276483, 0.3940283, 0, 0, 0, 1, 1,
-0.05419216, -0.8572884, -2.696136, 0, 0, 0, 1, 1,
-0.05414727, -0.6142839, -2.953923, 1, 1, 1, 1, 1,
-0.05246876, -1.740389, -4.500055, 1, 1, 1, 1, 1,
-0.03813697, 1.241099, -2.475603, 1, 1, 1, 1, 1,
-0.03540036, 0.3297935, 1.748266, 1, 1, 1, 1, 1,
-0.03384117, 1.431566, 2.083189, 1, 1, 1, 1, 1,
-0.03336992, 0.01400334, -1.152175, 1, 1, 1, 1, 1,
-0.03088119, 2.029211, -1.079525, 1, 1, 1, 1, 1,
-0.0287717, -1.703972, -1.793123, 1, 1, 1, 1, 1,
-0.0277921, -0.6294409, -4.266915, 1, 1, 1, 1, 1,
-0.02415778, -1.632703, -3.52546, 1, 1, 1, 1, 1,
-0.02405248, -0.08391301, -1.65178, 1, 1, 1, 1, 1,
-0.0149058, -1.336445, -3.099154, 1, 1, 1, 1, 1,
-0.007541397, 1.250531, 1.005946, 1, 1, 1, 1, 1,
-0.006969233, -0.4329214, -3.750363, 1, 1, 1, 1, 1,
-0.002828635, -0.9323598, -3.396611, 1, 1, 1, 1, 1,
-0.001880891, 0.1702704, 0.4800614, 0, 0, 1, 1, 1,
-0.001720031, 0.3232166, -0.1560577, 1, 0, 0, 1, 1,
0.004512001, -0.7104034, 3.412102, 1, 0, 0, 1, 1,
0.009434704, 0.2389675, 0.4846416, 1, 0, 0, 1, 1,
0.0143458, -0.2780212, 3.500076, 1, 0, 0, 1, 1,
0.01468381, -1.649914, 4.634598, 1, 0, 0, 1, 1,
0.01482313, 0.5620004, 0.3392695, 0, 0, 0, 1, 1,
0.01486901, 0.0971158, 1.991941, 0, 0, 0, 1, 1,
0.01827387, 0.5550447, -1.138159, 0, 0, 0, 1, 1,
0.02282553, -0.7523255, 3.692153, 0, 0, 0, 1, 1,
0.02666703, 1.180503, -0.6303154, 0, 0, 0, 1, 1,
0.03114373, 1.528516, -0.5159782, 0, 0, 0, 1, 1,
0.0323803, -0.1172454, 3.951214, 0, 0, 0, 1, 1,
0.03515656, -0.2699423, 1.807191, 1, 1, 1, 1, 1,
0.03790116, 0.5833176, -1.361535, 1, 1, 1, 1, 1,
0.03908627, 1.217008, -0.09129049, 1, 1, 1, 1, 1,
0.04184495, -0.419082, 3.620935, 1, 1, 1, 1, 1,
0.04377969, -0.0397609, 0.9237159, 1, 1, 1, 1, 1,
0.04601215, 1.087338, -1.612403, 1, 1, 1, 1, 1,
0.0477132, -2.743265, 2.052351, 1, 1, 1, 1, 1,
0.04879561, 1.657207, -0.4988081, 1, 1, 1, 1, 1,
0.05599635, 0.6285275, -0.09980079, 1, 1, 1, 1, 1,
0.05617283, 1.07159, -1.507978, 1, 1, 1, 1, 1,
0.05915987, -2.545728, 3.906251, 1, 1, 1, 1, 1,
0.06103098, -0.0790252, 2.751517, 1, 1, 1, 1, 1,
0.06432279, 0.8776718, -0.7252154, 1, 1, 1, 1, 1,
0.06606462, -1.121517, 2.167753, 1, 1, 1, 1, 1,
0.07419135, -0.4354922, 2.704231, 1, 1, 1, 1, 1,
0.07486439, -0.9741848, 2.934156, 0, 0, 1, 1, 1,
0.07650787, 0.8751226, 2.282827, 1, 0, 0, 1, 1,
0.07826507, -0.1647547, 2.109667, 1, 0, 0, 1, 1,
0.07924929, 0.6769458, 0.5557411, 1, 0, 0, 1, 1,
0.08594693, 0.3861285, -0.2612687, 1, 0, 0, 1, 1,
0.08948868, -0.2820308, 3.165188, 1, 0, 0, 1, 1,
0.09136096, -0.01738238, 2.584389, 0, 0, 0, 1, 1,
0.0955505, -0.3239279, 3.951391, 0, 0, 0, 1, 1,
0.09774862, 0.8265716, -0.3996783, 0, 0, 0, 1, 1,
0.1004781, -0.786659, 3.329598, 0, 0, 0, 1, 1,
0.1020569, 1.075362, 0.9268971, 0, 0, 0, 1, 1,
0.1025833, -0.4829787, 2.029885, 0, 0, 0, 1, 1,
0.1034291, 0.1187401, 0.3055117, 0, 0, 0, 1, 1,
0.104046, -3.112045, 2.737907, 1, 1, 1, 1, 1,
0.1075427, 0.1566178, 0.5082073, 1, 1, 1, 1, 1,
0.1158436, 0.07655158, 1.477692, 1, 1, 1, 1, 1,
0.1158915, 0.6485353, 0.7675545, 1, 1, 1, 1, 1,
0.1217021, 1.376852, -2.270599, 1, 1, 1, 1, 1,
0.1230394, 0.3179395, -0.160236, 1, 1, 1, 1, 1,
0.1237637, 0.6440873, -1.887258, 1, 1, 1, 1, 1,
0.1262003, 0.2058559, 0.9257064, 1, 1, 1, 1, 1,
0.1287649, -0.08133265, 0.8048938, 1, 1, 1, 1, 1,
0.1288909, 1.522492, -0.5891993, 1, 1, 1, 1, 1,
0.1299296, -0.02793362, 4.03376, 1, 1, 1, 1, 1,
0.1312244, -1.042475, 1.932118, 1, 1, 1, 1, 1,
0.1315684, -0.6565593, 2.415482, 1, 1, 1, 1, 1,
0.1354472, 1.80825, -0.400716, 1, 1, 1, 1, 1,
0.1376535, 0.05068824, -0.05470737, 1, 1, 1, 1, 1,
0.1389427, 0.3631179, -0.5234841, 0, 0, 1, 1, 1,
0.1396416, 0.1947036, -1.230251, 1, 0, 0, 1, 1,
0.1396836, 0.4317608, 2.394066, 1, 0, 0, 1, 1,
0.1405444, 0.1740433, 0.6378428, 1, 0, 0, 1, 1,
0.1414211, -0.7151104, 3.328757, 1, 0, 0, 1, 1,
0.1544112, -0.181931, 1.548841, 1, 0, 0, 1, 1,
0.1609087, 1.154429, -0.1908159, 0, 0, 0, 1, 1,
0.1618143, -0.4616314, 2.52678, 0, 0, 0, 1, 1,
0.1636752, -0.1000785, 3.894269, 0, 0, 0, 1, 1,
0.1639229, 0.1512297, 2.527404, 0, 0, 0, 1, 1,
0.170269, -1.088427, 4.175969, 0, 0, 0, 1, 1,
0.1740092, 2.311201, 0.1763359, 0, 0, 0, 1, 1,
0.1802643, -0.4354787, 2.569822, 0, 0, 0, 1, 1,
0.1816917, -0.7832649, 4.03829, 1, 1, 1, 1, 1,
0.1862979, 0.2572401, 1.448734, 1, 1, 1, 1, 1,
0.1908377, 1.051276, 1.112859, 1, 1, 1, 1, 1,
0.192932, -0.8423208, 2.417177, 1, 1, 1, 1, 1,
0.1985493, -1.981952, 1.864438, 1, 1, 1, 1, 1,
0.1998876, 0.3378392, -0.7906564, 1, 1, 1, 1, 1,
0.201311, 0.4097046, -0.1879829, 1, 1, 1, 1, 1,
0.203783, 3.03989, -0.8224285, 1, 1, 1, 1, 1,
0.2037974, -0.4462266, 3.798728, 1, 1, 1, 1, 1,
0.2082522, 0.9844735, 0.1879813, 1, 1, 1, 1, 1,
0.210011, -1.136319, 2.081183, 1, 1, 1, 1, 1,
0.2100523, -0.5936173, 2.763367, 1, 1, 1, 1, 1,
0.210492, 0.2451671, 1.996303, 1, 1, 1, 1, 1,
0.2117293, 0.5422064, -0.0853288, 1, 1, 1, 1, 1,
0.2120856, 0.1411191, -0.1080936, 1, 1, 1, 1, 1,
0.2122027, -1.586443, 3.356181, 0, 0, 1, 1, 1,
0.2158583, -0.9465615, 3.757795, 1, 0, 0, 1, 1,
0.2195669, 0.06635782, 2.380027, 1, 0, 0, 1, 1,
0.2235253, -0.5160022, 2.044021, 1, 0, 0, 1, 1,
0.2237953, 0.06754171, 1.091977, 1, 0, 0, 1, 1,
0.2238046, 1.06729, -0.2400467, 1, 0, 0, 1, 1,
0.231433, -1.286633, 4.162922, 0, 0, 0, 1, 1,
0.2317118, 0.9867262, 0.5634739, 0, 0, 0, 1, 1,
0.2317802, 0.5395402, -0.05129842, 0, 0, 0, 1, 1,
0.2347825, 1.270193, 1.461229, 0, 0, 0, 1, 1,
0.2351781, -1.649533, 4.564896, 0, 0, 0, 1, 1,
0.2434076, 0.01951983, 1.119947, 0, 0, 0, 1, 1,
0.2444538, 1.759937, -1.675962, 0, 0, 0, 1, 1,
0.2478506, -1.751882, 2.047301, 1, 1, 1, 1, 1,
0.2481335, -1.24446, 2.071259, 1, 1, 1, 1, 1,
0.2491133, 1.463216, 1.239774, 1, 1, 1, 1, 1,
0.2515785, -0.1639421, 3.991681, 1, 1, 1, 1, 1,
0.2531523, 0.7428991, -0.1327853, 1, 1, 1, 1, 1,
0.2538014, 0.4498523, 1.734762, 1, 1, 1, 1, 1,
0.2615294, -0.3582772, 1.796991, 1, 1, 1, 1, 1,
0.2630243, -0.7028, 2.232365, 1, 1, 1, 1, 1,
0.2638658, 2.081518, 1.798779, 1, 1, 1, 1, 1,
0.2658727, 0.6550162, 0.3719797, 1, 1, 1, 1, 1,
0.2676888, 0.2189525, 2.516549, 1, 1, 1, 1, 1,
0.2719569, -1.472652, 2.972768, 1, 1, 1, 1, 1,
0.273908, -0.4258605, 2.467538, 1, 1, 1, 1, 1,
0.2820936, -1.005359, 3.737499, 1, 1, 1, 1, 1,
0.2888633, -1.051824, 1.477854, 1, 1, 1, 1, 1,
0.2896084, 0.7189007, -0.3634887, 0, 0, 1, 1, 1,
0.2913969, -2.011821, 2.630633, 1, 0, 0, 1, 1,
0.2933695, 0.1072806, 2.06194, 1, 0, 0, 1, 1,
0.2937716, -0.8220803, 3.453106, 1, 0, 0, 1, 1,
0.2958469, 0.7203575, 0.5670689, 1, 0, 0, 1, 1,
0.297448, -0.07825588, 2.262416, 1, 0, 0, 1, 1,
0.297701, -0.206661, 1.580934, 0, 0, 0, 1, 1,
0.3055675, 0.3082886, 0.597061, 0, 0, 0, 1, 1,
0.3060054, 1.307968, -0.3170209, 0, 0, 0, 1, 1,
0.3083025, -2.54267, 0.9370269, 0, 0, 0, 1, 1,
0.3091864, 1.496701, 1.332114, 0, 0, 0, 1, 1,
0.3096355, 0.1280373, 1.000199, 0, 0, 0, 1, 1,
0.3116287, 1.586617, 0.332983, 0, 0, 0, 1, 1,
0.3132046, 0.113112, 1.79938, 1, 1, 1, 1, 1,
0.313575, -0.1815489, 2.197446, 1, 1, 1, 1, 1,
0.3174195, 0.635298, 0.5628946, 1, 1, 1, 1, 1,
0.3179027, -1.43643, 3.003402, 1, 1, 1, 1, 1,
0.3193384, 1.086049, -0.5100769, 1, 1, 1, 1, 1,
0.3227436, 0.5168592, 1.220273, 1, 1, 1, 1, 1,
0.3289734, 0.4433512, -0.2561032, 1, 1, 1, 1, 1,
0.3291428, -0.8701202, 3.570664, 1, 1, 1, 1, 1,
0.3314435, -1.395137, 1.002629, 1, 1, 1, 1, 1,
0.3318232, 0.2109758, 1.648383, 1, 1, 1, 1, 1,
0.3347363, 0.03015695, 1.327758, 1, 1, 1, 1, 1,
0.3435606, -0.1293486, 1.250529, 1, 1, 1, 1, 1,
0.3475848, 0.645547, 0.9728714, 1, 1, 1, 1, 1,
0.3548788, -0.09575596, 2.444422, 1, 1, 1, 1, 1,
0.3570749, 0.3234999, -0.6206787, 1, 1, 1, 1, 1,
0.3592715, 0.5484927, 1.591287, 0, 0, 1, 1, 1,
0.3606714, 0.2259415, 1.902328, 1, 0, 0, 1, 1,
0.3632605, 0.2930806, 1.39689, 1, 0, 0, 1, 1,
0.3633314, -0.3159923, 2.367564, 1, 0, 0, 1, 1,
0.3636448, 0.3762852, 0.8995903, 1, 0, 0, 1, 1,
0.3681328, -0.424564, 3.894787, 1, 0, 0, 1, 1,
0.3745754, -1.797377, 1.684089, 0, 0, 0, 1, 1,
0.3765825, -0.2365845, 2.056779, 0, 0, 0, 1, 1,
0.3796552, 1.258687, -0.5289141, 0, 0, 0, 1, 1,
0.3803783, 1.873258, -0.1985358, 0, 0, 0, 1, 1,
0.3805854, -1.042966, 3.248494, 0, 0, 0, 1, 1,
0.3828323, 2.674352, -1.342429, 0, 0, 0, 1, 1,
0.385914, -1.760908, 2.770635, 0, 0, 0, 1, 1,
0.3865912, 0.2311429, 0.8676579, 1, 1, 1, 1, 1,
0.3893698, -0.9058936, 4.16526, 1, 1, 1, 1, 1,
0.3908457, -1.163195, 1.985157, 1, 1, 1, 1, 1,
0.3961636, 1.499976, -0.04933449, 1, 1, 1, 1, 1,
0.3999144, -0.5619618, 1.809215, 1, 1, 1, 1, 1,
0.4027807, 0.1777458, 1.783822, 1, 1, 1, 1, 1,
0.4029554, -0.8341399, 2.11276, 1, 1, 1, 1, 1,
0.4036208, -1.55119, 1.952177, 1, 1, 1, 1, 1,
0.4052116, -2.015126, 4.135215, 1, 1, 1, 1, 1,
0.4061035, -1.8684, 3.477904, 1, 1, 1, 1, 1,
0.4080595, -0.3404235, 4.0333, 1, 1, 1, 1, 1,
0.4125327, 0.2616891, 0.6204616, 1, 1, 1, 1, 1,
0.4128857, 1.176599, -0.0362676, 1, 1, 1, 1, 1,
0.4187381, -0.3935362, 1.574021, 1, 1, 1, 1, 1,
0.4223558, 0.2108756, 0.6640852, 1, 1, 1, 1, 1,
0.4233582, -0.05070761, 0.8661383, 0, 0, 1, 1, 1,
0.4299713, 0.1460509, -1.119915, 1, 0, 0, 1, 1,
0.4300433, 0.3001942, -0.5430041, 1, 0, 0, 1, 1,
0.4333356, -0.1553833, 0.8525876, 1, 0, 0, 1, 1,
0.4400621, -0.4894512, 3.248856, 1, 0, 0, 1, 1,
0.4443458, -0.2812902, 2.404319, 1, 0, 0, 1, 1,
0.4458902, 1.02316, -1.048017, 0, 0, 0, 1, 1,
0.4464801, 0.3081374, 1.177837, 0, 0, 0, 1, 1,
0.4466577, 0.03571381, 1.32387, 0, 0, 0, 1, 1,
0.4508751, -0.6189877, 1.949159, 0, 0, 0, 1, 1,
0.4523451, 0.4251489, 2.206963, 0, 0, 0, 1, 1,
0.4542423, 1.54916, -0.6298982, 0, 0, 0, 1, 1,
0.4573768, 0.01134574, 1.84864, 0, 0, 0, 1, 1,
0.4630186, -0.6607631, 0.9646925, 1, 1, 1, 1, 1,
0.4634555, -1.043007, 1.504696, 1, 1, 1, 1, 1,
0.4692678, 1.428803, 1.09417, 1, 1, 1, 1, 1,
0.46985, -0.2807817, 2.665638, 1, 1, 1, 1, 1,
0.4708987, 0.5198841, 2.284462, 1, 1, 1, 1, 1,
0.4727961, 1.63314, -0.2090939, 1, 1, 1, 1, 1,
0.473612, 0.6116855, 2.554363, 1, 1, 1, 1, 1,
0.4750277, 0.938727, 0.4331271, 1, 1, 1, 1, 1,
0.4757894, -0.1182522, 0.5941013, 1, 1, 1, 1, 1,
0.4772939, -1.143366, 0.8520567, 1, 1, 1, 1, 1,
0.4797007, -0.9367666, 1.462434, 1, 1, 1, 1, 1,
0.4801103, -0.9690253, 3.000381, 1, 1, 1, 1, 1,
0.4844303, -0.8785886, 2.334088, 1, 1, 1, 1, 1,
0.4847742, 1.591087, -0.5147807, 1, 1, 1, 1, 1,
0.4891748, -0.7590647, 3.854677, 1, 1, 1, 1, 1,
0.4905635, 0.3142392, 1.461134, 0, 0, 1, 1, 1,
0.4907729, -0.5186263, 4.928587, 1, 0, 0, 1, 1,
0.493143, -0.8511572, 2.751567, 1, 0, 0, 1, 1,
0.4959431, 0.2746689, 1.074746, 1, 0, 0, 1, 1,
0.5002543, -0.2736568, 2.303859, 1, 0, 0, 1, 1,
0.5018722, 0.895758, 0.5316653, 1, 0, 0, 1, 1,
0.5034323, 0.3080115, 1.386815, 0, 0, 0, 1, 1,
0.5059581, 0.1434621, 0.8019317, 0, 0, 0, 1, 1,
0.5083416, 1.024016, 2.029121, 0, 0, 0, 1, 1,
0.5136019, -0.1718622, 1.694828, 0, 0, 0, 1, 1,
0.5156367, 0.158924, 0.5073595, 0, 0, 0, 1, 1,
0.5168724, -1.203064, 3.827432, 0, 0, 0, 1, 1,
0.517202, -1.335332, 4.288683, 0, 0, 0, 1, 1,
0.5199299, 1.669765, -1.568288, 1, 1, 1, 1, 1,
0.5244097, -1.590986, 2.495985, 1, 1, 1, 1, 1,
0.5267613, -0.1270923, 0.8130311, 1, 1, 1, 1, 1,
0.5306691, 0.6099595, 1.459262, 1, 1, 1, 1, 1,
0.5318403, -0.7043654, 2.380154, 1, 1, 1, 1, 1,
0.5366927, 0.1562355, 2.113219, 1, 1, 1, 1, 1,
0.5379146, 1.27407, -0.138773, 1, 1, 1, 1, 1,
0.5407777, 0.03267102, 3.920051, 1, 1, 1, 1, 1,
0.5417653, -1.374613, 3.987768, 1, 1, 1, 1, 1,
0.5427599, -1.471835, 2.953725, 1, 1, 1, 1, 1,
0.5431097, -0.2377568, 2.960008, 1, 1, 1, 1, 1,
0.543878, 0.08440452, 2.598954, 1, 1, 1, 1, 1,
0.5454537, -0.04647715, 2.162732, 1, 1, 1, 1, 1,
0.5457058, 0.4689498, 0.9368229, 1, 1, 1, 1, 1,
0.5492399, -1.869461, 2.505861, 1, 1, 1, 1, 1,
0.5494977, 1.307523, 0.3656303, 0, 0, 1, 1, 1,
0.5534052, -0.6442813, 1.255497, 1, 0, 0, 1, 1,
0.5547976, -0.1742771, 2.058827, 1, 0, 0, 1, 1,
0.5568646, 0.1302577, -0.7184577, 1, 0, 0, 1, 1,
0.5590039, 1.517021, 0.7177283, 1, 0, 0, 1, 1,
0.5606747, 0.469882, -0.9066374, 1, 0, 0, 1, 1,
0.5662239, 0.1932328, -0.2482976, 0, 0, 0, 1, 1,
0.567491, 1.914661, -0.1210969, 0, 0, 0, 1, 1,
0.5682718, 2.680553, -0.8948695, 0, 0, 0, 1, 1,
0.5697157, 1.180419, 1.647642, 0, 0, 0, 1, 1,
0.5740556, 0.3451655, -0.06444018, 0, 0, 0, 1, 1,
0.5754781, 0.07937653, 1.176445, 0, 0, 0, 1, 1,
0.5761859, 0.01020044, 0.8423408, 0, 0, 0, 1, 1,
0.5796964, -1.100206, 1.276804, 1, 1, 1, 1, 1,
0.5842991, 0.1000335, 3.708994, 1, 1, 1, 1, 1,
0.5852922, 0.1829124, 1.462329, 1, 1, 1, 1, 1,
0.5854471, -0.3365823, 2.415341, 1, 1, 1, 1, 1,
0.5910314, 0.7357619, 0.6351054, 1, 1, 1, 1, 1,
0.5997671, 1.079738, 0.4942921, 1, 1, 1, 1, 1,
0.6028891, 0.6253091, 0.09544073, 1, 1, 1, 1, 1,
0.6065241, 0.1211, -0.5415779, 1, 1, 1, 1, 1,
0.6102836, -0.02652342, 1.999781, 1, 1, 1, 1, 1,
0.6123156, -1.792714, 2.920888, 1, 1, 1, 1, 1,
0.6135555, -0.9775727, 2.659634, 1, 1, 1, 1, 1,
0.6151146, 0.8564852, 1.960767, 1, 1, 1, 1, 1,
0.6152582, 0.4919365, 1.904814, 1, 1, 1, 1, 1,
0.6173253, -1.024998, 2.226197, 1, 1, 1, 1, 1,
0.6186347, 0.9210723, 0.4456435, 1, 1, 1, 1, 1,
0.6211058, 2.273236, -0.4208891, 0, 0, 1, 1, 1,
0.621976, -0.734358, 1.13562, 1, 0, 0, 1, 1,
0.6242683, -2.047712, 3.667036, 1, 0, 0, 1, 1,
0.6249146, -0.8469002, 0.183596, 1, 0, 0, 1, 1,
0.626308, -1.503321, 0.08902541, 1, 0, 0, 1, 1,
0.626519, 0.6535046, 0.09895907, 1, 0, 0, 1, 1,
0.627422, -0.197919, 2.595289, 0, 0, 0, 1, 1,
0.6331237, 0.3892623, 0.368622, 0, 0, 0, 1, 1,
0.6378207, 0.2672502, 2.549508, 0, 0, 0, 1, 1,
0.6379874, 1.104801, 0.5188229, 0, 0, 0, 1, 1,
0.6424705, 0.7742974, 0.1235864, 0, 0, 0, 1, 1,
0.6480507, -1.051031, 2.49549, 0, 0, 0, 1, 1,
0.6485064, 1.123924, 0.3747728, 0, 0, 0, 1, 1,
0.6524187, 1.007299, -0.8831246, 1, 1, 1, 1, 1,
0.6549554, 0.487965, 2.593808, 1, 1, 1, 1, 1,
0.6632712, 0.753426, 0.8195069, 1, 1, 1, 1, 1,
0.6647061, -0.3353108, -0.4081035, 1, 1, 1, 1, 1,
0.6654941, 0.1410822, 1.298485, 1, 1, 1, 1, 1,
0.6719654, -1.315691, 2.471286, 1, 1, 1, 1, 1,
0.6793214, 0.3580008, 2.608857, 1, 1, 1, 1, 1,
0.6827845, -0.4079703, 2.280671, 1, 1, 1, 1, 1,
0.6952991, 2.052156, -0.7483506, 1, 1, 1, 1, 1,
0.6983526, 2.230345, -0.6339211, 1, 1, 1, 1, 1,
0.7057583, -0.8532395, 0.4514812, 1, 1, 1, 1, 1,
0.7107359, -0.8073769, 1.577514, 1, 1, 1, 1, 1,
0.7144245, 3.471664, 1.333867, 1, 1, 1, 1, 1,
0.7172235, -1.838173, 1.599128, 1, 1, 1, 1, 1,
0.7207709, -1.573138, 2.835969, 1, 1, 1, 1, 1,
0.7287917, 0.382678, 1.916645, 0, 0, 1, 1, 1,
0.7288245, -1.571408, 1.105876, 1, 0, 0, 1, 1,
0.7295536, 0.2530399, 1.181007, 1, 0, 0, 1, 1,
0.7331121, -0.133875, 2.454054, 1, 0, 0, 1, 1,
0.7353597, -0.05519935, 0.9809036, 1, 0, 0, 1, 1,
0.7380298, -0.2338186, 1.43032, 1, 0, 0, 1, 1,
0.739134, 1.393662, -2.051382, 0, 0, 0, 1, 1,
0.7432122, -0.9080365, 2.975923, 0, 0, 0, 1, 1,
0.7461197, 0.6944189, 2.06645, 0, 0, 0, 1, 1,
0.7508977, -0.4789075, 1.31288, 0, 0, 0, 1, 1,
0.7535152, 0.8313477, 0.9417001, 0, 0, 0, 1, 1,
0.7631378, 0.7725434, 1.57109, 0, 0, 0, 1, 1,
0.7639232, 0.6487762, 0.2216668, 0, 0, 0, 1, 1,
0.7713774, -1.055653, 3.687049, 1, 1, 1, 1, 1,
0.7714794, 0.4954827, 0.5378065, 1, 1, 1, 1, 1,
0.7715607, -0.6896737, 1.166921, 1, 1, 1, 1, 1,
0.7718469, -0.08946113, 1.858376, 1, 1, 1, 1, 1,
0.7722966, 1.848488, -0.736264, 1, 1, 1, 1, 1,
0.7735696, -0.3403096, 0.8135161, 1, 1, 1, 1, 1,
0.7739332, -0.3397149, 2.599731, 1, 1, 1, 1, 1,
0.777769, 0.129263, 1.58695, 1, 1, 1, 1, 1,
0.7815313, -1.109914, 3.222287, 1, 1, 1, 1, 1,
0.7821539, -0.3252603, 1.417441, 1, 1, 1, 1, 1,
0.7824687, -0.2272208, 0.04248652, 1, 1, 1, 1, 1,
0.7871783, 0.2887069, 2.929274, 1, 1, 1, 1, 1,
0.7924858, -0.4902819, 2.247869, 1, 1, 1, 1, 1,
0.7936693, -0.7491575, 2.318283, 1, 1, 1, 1, 1,
0.8005992, -0.4129169, 3.888329, 1, 1, 1, 1, 1,
0.8024741, -1.351729, 3.436042, 0, 0, 1, 1, 1,
0.8058625, -0.2339293, 0.6613318, 1, 0, 0, 1, 1,
0.8084024, 0.09338401, 1.015612, 1, 0, 0, 1, 1,
0.8139168, 0.2682804, 0.798943, 1, 0, 0, 1, 1,
0.8204527, -0.4262938, 2.051795, 1, 0, 0, 1, 1,
0.8217246, -0.9603994, 3.951169, 1, 0, 0, 1, 1,
0.8275936, 0.1751915, 1.803777, 0, 0, 0, 1, 1,
0.8307004, -0.3860861, 0.9626507, 0, 0, 0, 1, 1,
0.8315619, -1.282218, 1.727246, 0, 0, 0, 1, 1,
0.8325544, 1.088895, 1.512228, 0, 0, 0, 1, 1,
0.8336532, -0.6045728, 2.701868, 0, 0, 0, 1, 1,
0.8394155, 0.3853188, 3.416117, 0, 0, 0, 1, 1,
0.8442857, -0.2940576, 0.7844794, 0, 0, 0, 1, 1,
0.8467039, 0.5277593, 0.4673392, 1, 1, 1, 1, 1,
0.8522397, 0.1183691, 1.519626, 1, 1, 1, 1, 1,
0.855871, 0.2548482, 0.5386896, 1, 1, 1, 1, 1,
0.8564681, 0.007934676, 0.4005909, 1, 1, 1, 1, 1,
0.8597136, 1.038671, 0.7882694, 1, 1, 1, 1, 1,
0.8607597, -0.9473269, 3.168485, 1, 1, 1, 1, 1,
0.8628438, -0.868234, 1.341703, 1, 1, 1, 1, 1,
0.8685571, -0.7549079, 1.677674, 1, 1, 1, 1, 1,
0.8693708, -1.35409, 4.036186, 1, 1, 1, 1, 1,
0.8783023, 0.5596327, 3.612036, 1, 1, 1, 1, 1,
0.884293, 0.5072031, 1.174138, 1, 1, 1, 1, 1,
0.8947096, -0.9825531, 0.8922126, 1, 1, 1, 1, 1,
0.8952335, -0.610473, 1.694715, 1, 1, 1, 1, 1,
0.9030252, 0.5975439, 0.4299766, 1, 1, 1, 1, 1,
0.9033298, 1.63269, 1.059523, 1, 1, 1, 1, 1,
0.9044792, -0.8373359, 1.428138, 0, 0, 1, 1, 1,
0.9049821, -2.115035, 2.132915, 1, 0, 0, 1, 1,
0.9098603, -1.66671, 2.65052, 1, 0, 0, 1, 1,
0.9146186, -0.02042899, 1.885728, 1, 0, 0, 1, 1,
0.9160628, 1.582616, 0.1187971, 1, 0, 0, 1, 1,
0.9185603, -0.7002915, 0.57733, 1, 0, 0, 1, 1,
0.9200255, 1.931054, 0.3751118, 0, 0, 0, 1, 1,
0.9207774, -0.2227151, 2.514807, 0, 0, 0, 1, 1,
0.9245316, 0.8589725, 0.9658572, 0, 0, 0, 1, 1,
0.9282181, 0.7837398, -0.1278494, 0, 0, 0, 1, 1,
0.9337274, -0.7547512, 2.509502, 0, 0, 0, 1, 1,
0.9341519, -0.5991927, 3.24059, 0, 0, 0, 1, 1,
0.9365596, 0.8200316, 0.7480327, 0, 0, 0, 1, 1,
0.9395214, -0.1411241, 1.073724, 1, 1, 1, 1, 1,
0.9412522, -0.3169786, 2.264481, 1, 1, 1, 1, 1,
0.9430138, -0.2190834, 1.755175, 1, 1, 1, 1, 1,
0.9464127, -0.7733826, 1.71714, 1, 1, 1, 1, 1,
0.9520801, 0.3260223, 0.7829934, 1, 1, 1, 1, 1,
0.9555578, 1.225196, 0.0243849, 1, 1, 1, 1, 1,
0.9594138, -0.4793538, 2.376053, 1, 1, 1, 1, 1,
0.9609517, 0.3858877, 0.7450714, 1, 1, 1, 1, 1,
0.9612544, 1.175656, -0.8745506, 1, 1, 1, 1, 1,
0.9643625, -0.2887265, 2.25982, 1, 1, 1, 1, 1,
0.9648359, -0.3625169, 2.214415, 1, 1, 1, 1, 1,
0.9664512, 1.515202, 1.513009, 1, 1, 1, 1, 1,
0.9691432, 1.563908, 0.5311807, 1, 1, 1, 1, 1,
0.9773302, 1.359184, 0.5714296, 1, 1, 1, 1, 1,
0.9894128, 0.0268034, -1.263301, 1, 1, 1, 1, 1,
0.997789, -0.2906993, -0.09806527, 0, 0, 1, 1, 1,
1.000621, 1.438214, 1.136659, 1, 0, 0, 1, 1,
1.001298, 1.216873, 1.152463, 1, 0, 0, 1, 1,
1.016048, -2.10213, 2.611279, 1, 0, 0, 1, 1,
1.016837, -0.6240892, 2.276676, 1, 0, 0, 1, 1,
1.016951, -0.4140065, 3.554239, 1, 0, 0, 1, 1,
1.018213, 0.01889797, 2.799668, 0, 0, 0, 1, 1,
1.019226, 1.537625, 1.822704, 0, 0, 0, 1, 1,
1.019297, 0.6066702, 0.7218094, 0, 0, 0, 1, 1,
1.019471, 0.7821485, 0.9626789, 0, 0, 0, 1, 1,
1.02075, 0.08358588, 2.229545, 0, 0, 0, 1, 1,
1.021072, 0.5961462, -0.1276277, 0, 0, 0, 1, 1,
1.022603, -0.6788955, 2.676984, 0, 0, 0, 1, 1,
1.024711, 0.2049501, 1.493254, 1, 1, 1, 1, 1,
1.027123, -1.946168, 4.367849, 1, 1, 1, 1, 1,
1.027319, 0.09310222, 1.582771, 1, 1, 1, 1, 1,
1.046708, 0.6022277, -0.07763377, 1, 1, 1, 1, 1,
1.047543, 2.003284, 0.3556978, 1, 1, 1, 1, 1,
1.048319, 0.07609804, 1.255337, 1, 1, 1, 1, 1,
1.048632, 0.6978595, 1.043798, 1, 1, 1, 1, 1,
1.049195, 0.4214945, 0.9219882, 1, 1, 1, 1, 1,
1.052502, 1.01279, 0.6273901, 1, 1, 1, 1, 1,
1.062629, -0.1842068, 1.240333, 1, 1, 1, 1, 1,
1.068918, 0.6541414, 0.8158779, 1, 1, 1, 1, 1,
1.06949, 0.1278793, 2.092043, 1, 1, 1, 1, 1,
1.072688, 0.7364854, 0.2955686, 1, 1, 1, 1, 1,
1.077689, 0.3092275, -0.7154174, 1, 1, 1, 1, 1,
1.078399, 0.5724841, 2.555635, 1, 1, 1, 1, 1,
1.081343, -0.64577, 1.935126, 0, 0, 1, 1, 1,
1.08162, -0.03782948, 0.6834944, 1, 0, 0, 1, 1,
1.083071, 1.085339, -0.5248462, 1, 0, 0, 1, 1,
1.096479, -0.7242156, 1.245376, 1, 0, 0, 1, 1,
1.101166, 0.9650805, 0.3772502, 1, 0, 0, 1, 1,
1.107832, -1.022694, 3.914173, 1, 0, 0, 1, 1,
1.108238, 0.5974981, -0.7359888, 0, 0, 0, 1, 1,
1.109593, 0.02066868, 0.877018, 0, 0, 0, 1, 1,
1.127174, 0.3740828, 0.9595218, 0, 0, 0, 1, 1,
1.132865, 1.603791, 1.696644, 0, 0, 0, 1, 1,
1.141905, -0.8167674, 0.8005866, 0, 0, 0, 1, 1,
1.142871, -0.416401, 2.361658, 0, 0, 0, 1, 1,
1.147642, 2.155373, 0.9344043, 0, 0, 0, 1, 1,
1.156608, -0.3934947, 1.995476, 1, 1, 1, 1, 1,
1.163756, -0.6862078, 2.771198, 1, 1, 1, 1, 1,
1.172439, 1.088566, 1.009375, 1, 1, 1, 1, 1,
1.175993, -0.6894726, 2.076143, 1, 1, 1, 1, 1,
1.18186, -0.5727171, 1.891694, 1, 1, 1, 1, 1,
1.188828, 0.7060158, 0.8332444, 1, 1, 1, 1, 1,
1.194726, 1.413283, 0.8105682, 1, 1, 1, 1, 1,
1.214983, 0.3642381, 2.26442, 1, 1, 1, 1, 1,
1.222323, 0.7735075, 1.578792, 1, 1, 1, 1, 1,
1.227959, -0.983308, 0.6289021, 1, 1, 1, 1, 1,
1.235169, -0.87215, 1.708407, 1, 1, 1, 1, 1,
1.252411, -0.7060383, 2.627058, 1, 1, 1, 1, 1,
1.262658, -0.6567214, 2.06787, 1, 1, 1, 1, 1,
1.263748, 0.6765583, 1.331251, 1, 1, 1, 1, 1,
1.27661, -0.7588434, 1.861163, 1, 1, 1, 1, 1,
1.278675, 0.7838858, 0.5697813, 0, 0, 1, 1, 1,
1.287505, -0.06560406, 0.5934789, 1, 0, 0, 1, 1,
1.293742, 0.9864063, 2.008043, 1, 0, 0, 1, 1,
1.297087, 1.756647, 0.9092937, 1, 0, 0, 1, 1,
1.299211, -1.713676, 3.374246, 1, 0, 0, 1, 1,
1.301753, 1.664043, 1.072336, 1, 0, 0, 1, 1,
1.310244, 0.8618777, 1.914164, 0, 0, 0, 1, 1,
1.311958, -0.8389702, 2.431064, 0, 0, 0, 1, 1,
1.314378, 0.3044382, -0.4018986, 0, 0, 0, 1, 1,
1.316287, 0.3076842, 0.909444, 0, 0, 0, 1, 1,
1.321274, 1.27143, -1.493023, 0, 0, 0, 1, 1,
1.324067, -0.882237, 2.074225, 0, 0, 0, 1, 1,
1.324568, -0.008815111, 1.336831, 0, 0, 0, 1, 1,
1.331773, 1.992213, -0.6991441, 1, 1, 1, 1, 1,
1.339011, 0.2667868, 1.602089, 1, 1, 1, 1, 1,
1.346969, 0.03137827, 2.828003, 1, 1, 1, 1, 1,
1.351413, 0.1290092, 1.917317, 1, 1, 1, 1, 1,
1.351541, 0.4988114, -0.389671, 1, 1, 1, 1, 1,
1.367757, -1.23809, 2.23013, 1, 1, 1, 1, 1,
1.369034, 0.6540643, 1.68572, 1, 1, 1, 1, 1,
1.369841, 1.603698, 2.074474, 1, 1, 1, 1, 1,
1.373543, 0.4561727, 1.968364, 1, 1, 1, 1, 1,
1.377213, -0.1120925, 3.170942, 1, 1, 1, 1, 1,
1.378098, -0.5759793, 2.567019, 1, 1, 1, 1, 1,
1.400526, -1.056806, 3.315873, 1, 1, 1, 1, 1,
1.40196, -1.266157, 1.867229, 1, 1, 1, 1, 1,
1.421746, 1.12302, 3.306213, 1, 1, 1, 1, 1,
1.429182, 1.44845, -0.06095476, 1, 1, 1, 1, 1,
1.445997, 0.908693, 1.00349, 0, 0, 1, 1, 1,
1.451167, -1.131862, 1.806885, 1, 0, 0, 1, 1,
1.451631, 0.396487, 1.295167, 1, 0, 0, 1, 1,
1.457349, 1.013554, -0.2145816, 1, 0, 0, 1, 1,
1.457926, 0.5627907, 1.926336, 1, 0, 0, 1, 1,
1.46043, 0.42883, 0.8913656, 1, 0, 0, 1, 1,
1.46402, 0.9557839, -1.426142, 0, 0, 0, 1, 1,
1.472986, -2.592026, 2.810343, 0, 0, 0, 1, 1,
1.477802, 0.2074007, 2.222535, 0, 0, 0, 1, 1,
1.486479, 1.381835, -0.1201459, 0, 0, 0, 1, 1,
1.500313, -0.8630046, 3.078964, 0, 0, 0, 1, 1,
1.515749, 0.4247962, 0.3791547, 0, 0, 0, 1, 1,
1.517139, -1.660482, 2.860449, 0, 0, 0, 1, 1,
1.526213, 1.389693, 0.7880145, 1, 1, 1, 1, 1,
1.531875, 0.6805419, 0.6703171, 1, 1, 1, 1, 1,
1.540334, -1.197059, 1.410585, 1, 1, 1, 1, 1,
1.540946, 0.3293211, 2.23223, 1, 1, 1, 1, 1,
1.544067, 0.3374004, 1.314703, 1, 1, 1, 1, 1,
1.563893, -0.9140804, 0.4418625, 1, 1, 1, 1, 1,
1.567037, -2.059209, 2.436612, 1, 1, 1, 1, 1,
1.572299, -0.3209503, 1.575336, 1, 1, 1, 1, 1,
1.573724, 2.616504, 0.8815425, 1, 1, 1, 1, 1,
1.574139, -0.01333677, 2.754797, 1, 1, 1, 1, 1,
1.580835, -1.555636, 2.576565, 1, 1, 1, 1, 1,
1.584501, 0.7281428, -0.3228, 1, 1, 1, 1, 1,
1.611982, -0.9767449, 3.563222, 1, 1, 1, 1, 1,
1.624082, 1.539435, 1.356395, 1, 1, 1, 1, 1,
1.628873, 1.371938, 1.519996, 1, 1, 1, 1, 1,
1.630293, -0.5699449, 2.239053, 0, 0, 1, 1, 1,
1.646487, 1.299398, 2.505737, 1, 0, 0, 1, 1,
1.649135, -1.508239, 1.095079, 1, 0, 0, 1, 1,
1.656602, 0.4135177, 2.215869, 1, 0, 0, 1, 1,
1.659958, 0.2394071, 1.974667, 1, 0, 0, 1, 1,
1.674322, 0.03440928, 1.850985, 1, 0, 0, 1, 1,
1.674833, -0.5479108, 2.667421, 0, 0, 0, 1, 1,
1.683161, 1.176264, 1.546546, 0, 0, 0, 1, 1,
1.696216, -0.1946744, 1.77593, 0, 0, 0, 1, 1,
1.709041, -1.101497, 1.642998, 0, 0, 0, 1, 1,
1.7199, -1.662058, 3.073772, 0, 0, 0, 1, 1,
1.738909, -0.305408, 2.329569, 0, 0, 0, 1, 1,
1.762438, 1.48608, 0.5997661, 0, 0, 0, 1, 1,
1.768573, 0.8709896, 0.4503432, 1, 1, 1, 1, 1,
1.781354, -0.08531918, 1.902545, 1, 1, 1, 1, 1,
1.782901, -0.5487164, 1.261114, 1, 1, 1, 1, 1,
1.794363, -1.676013, 4.569138, 1, 1, 1, 1, 1,
1.809985, -1.604115, 2.287043, 1, 1, 1, 1, 1,
1.832427, -0.6701468, 1.43608, 1, 1, 1, 1, 1,
1.846751, 1.541715, 0.9476732, 1, 1, 1, 1, 1,
1.847747, 0.07364259, 2.376238, 1, 1, 1, 1, 1,
1.851304, -0.4853909, 3.451187, 1, 1, 1, 1, 1,
1.897527, 0.4979588, 1.460883, 1, 1, 1, 1, 1,
1.899203, -0.5674332, 0.8928456, 1, 1, 1, 1, 1,
1.928811, 0.1276085, 2.030367, 1, 1, 1, 1, 1,
1.931955, -1.694001, 2.670446, 1, 1, 1, 1, 1,
1.940514, 1.002302, 1.045447, 1, 1, 1, 1, 1,
1.941892, -1.301684, 2.437371, 1, 1, 1, 1, 1,
1.947788, 0.08208475, 1.67389, 0, 0, 1, 1, 1,
1.953725, 1.344852, -0.6577191, 1, 0, 0, 1, 1,
1.972718, -0.4172923, 0.5076263, 1, 0, 0, 1, 1,
2.009928, 0.1693313, 3.589759, 1, 0, 0, 1, 1,
2.010982, 0.8857902, 0.7620829, 1, 0, 0, 1, 1,
2.012548, 0.2742416, 3.143785, 1, 0, 0, 1, 1,
2.040578, -0.0522727, 1.129057, 0, 0, 0, 1, 1,
2.068334, 0.4469476, 2.642006, 0, 0, 0, 1, 1,
2.108477, -0.1788851, 2.838984, 0, 0, 0, 1, 1,
2.185521, 0.6428404, 2.10661, 0, 0, 0, 1, 1,
2.208129, 0.7363706, 2.112551, 0, 0, 0, 1, 1,
2.277915, -0.4812009, 1.6621, 0, 0, 0, 1, 1,
2.329638, -0.3152122, 0.4391589, 0, 0, 0, 1, 1,
2.35849, -0.4947312, 2.644903, 1, 1, 1, 1, 1,
2.410009, -1.860436, 1.515394, 1, 1, 1, 1, 1,
2.477165, -0.2579299, 3.839383, 1, 1, 1, 1, 1,
2.49583, -0.6292011, 0.7242747, 1, 1, 1, 1, 1,
2.517833, -1.355505, 1.34795, 1, 1, 1, 1, 1,
2.856588, -0.5542654, 1.863974, 1, 1, 1, 1, 1,
2.899977, -0.2736006, 2.559634, 1, 1, 1, 1, 1
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
var radius = 9.323569;
var distance = 32.74864;
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
mvMatrix.translate( 0.2717265, -0.1798093, 0.07299328 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.74864);
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
