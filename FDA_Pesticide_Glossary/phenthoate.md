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
-3.151982, -0.9278456, -1.892224, 1, 0, 0, 1,
-3.06938, -1.368668, -3.195816, 1, 0.007843138, 0, 1,
-2.613297, 0.3720987, -1.716976, 1, 0.01176471, 0, 1,
-2.467335, 0.2196954, -0.5217623, 1, 0.01960784, 0, 1,
-2.460902, 0.6878814, -1.132673, 1, 0.02352941, 0, 1,
-2.450574, 0.6506123, -2.640472, 1, 0.03137255, 0, 1,
-2.448224, -0.3272166, -2.521669, 1, 0.03529412, 0, 1,
-2.268419, -1.535794, -2.957059, 1, 0.04313726, 0, 1,
-2.248302, 1.843771, -1.652891, 1, 0.04705882, 0, 1,
-2.227017, 0.2015971, -1.02185, 1, 0.05490196, 0, 1,
-2.209211, -1.726129, -4.348276, 1, 0.05882353, 0, 1,
-2.203156, -0.7383037, -2.597926, 1, 0.06666667, 0, 1,
-2.190274, -0.740694, -0.3096903, 1, 0.07058824, 0, 1,
-2.183543, 1.901384, -0.1178422, 1, 0.07843138, 0, 1,
-2.170151, 0.1355327, -0.8088009, 1, 0.08235294, 0, 1,
-2.165203, -0.8610712, -1.419078, 1, 0.09019608, 0, 1,
-2.09983, -0.2839935, -3.622852, 1, 0.09411765, 0, 1,
-2.099642, -0.4668512, -0.5850498, 1, 0.1019608, 0, 1,
-2.060142, -1.196409, -2.199248, 1, 0.1098039, 0, 1,
-2.02902, 1.557441, -0.8987073, 1, 0.1137255, 0, 1,
-2.015089, -0.3611867, 0.24788, 1, 0.1215686, 0, 1,
-1.975968, 1.965094, -0.553634, 1, 0.1254902, 0, 1,
-1.922524, -0.04219665, -3.16948, 1, 0.1333333, 0, 1,
-1.922166, -0.1963664, -1.200366, 1, 0.1372549, 0, 1,
-1.917755, 0.4479031, -0.3424991, 1, 0.145098, 0, 1,
-1.909891, 0.9235075, -1.197287, 1, 0.1490196, 0, 1,
-1.897813, -0.9402134, -1.734555, 1, 0.1568628, 0, 1,
-1.89454, 1.368298, -0.3430475, 1, 0.1607843, 0, 1,
-1.890649, -0.6766521, -3.069906, 1, 0.1686275, 0, 1,
-1.878682, -0.334946, -3.373493, 1, 0.172549, 0, 1,
-1.876258, 0.472556, -3.187476, 1, 0.1803922, 0, 1,
-1.870735, -0.3301522, -1.754836, 1, 0.1843137, 0, 1,
-1.868208, -1.122947, -2.144561, 1, 0.1921569, 0, 1,
-1.867074, -2.022066, -2.111883, 1, 0.1960784, 0, 1,
-1.85429, 0.5250632, -1.603492, 1, 0.2039216, 0, 1,
-1.833889, -2.589156, -2.601381, 1, 0.2117647, 0, 1,
-1.817136, 1.298956, 1.065575, 1, 0.2156863, 0, 1,
-1.811649, -1.354888, -2.536663, 1, 0.2235294, 0, 1,
-1.804249, 1.708487, 0.9672164, 1, 0.227451, 0, 1,
-1.77524, 1.013703, 0.2510495, 1, 0.2352941, 0, 1,
-1.759706, 0.4401906, 0.4470237, 1, 0.2392157, 0, 1,
-1.711439, -0.3626013, -2.516068, 1, 0.2470588, 0, 1,
-1.711066, 2.089727, 0.1785377, 1, 0.2509804, 0, 1,
-1.697223, 0.4241531, 1.228206, 1, 0.2588235, 0, 1,
-1.680724, 2.003715, 0.0165581, 1, 0.2627451, 0, 1,
-1.679446, -0.3015741, -0.3066672, 1, 0.2705882, 0, 1,
-1.679087, -0.8733293, -1.696614, 1, 0.2745098, 0, 1,
-1.665546, -0.3019991, -0.4847117, 1, 0.282353, 0, 1,
-1.6626, -0.5468163, -2.724902, 1, 0.2862745, 0, 1,
-1.649472, 0.7411219, -1.298443, 1, 0.2941177, 0, 1,
-1.649445, 1.411589, 0.3569931, 1, 0.3019608, 0, 1,
-1.630213, -1.672918, -1.92629, 1, 0.3058824, 0, 1,
-1.629763, -0.1742725, -0.91703, 1, 0.3137255, 0, 1,
-1.628, 0.5014085, 0.1618403, 1, 0.3176471, 0, 1,
-1.601611, -0.6896026, -2.556082, 1, 0.3254902, 0, 1,
-1.592284, 1.106905, -2.118543, 1, 0.3294118, 0, 1,
-1.582716, 0.2074149, -0.8935863, 1, 0.3372549, 0, 1,
-1.573236, -2.061765, -2.485529, 1, 0.3411765, 0, 1,
-1.572545, 0.5808589, -2.149023, 1, 0.3490196, 0, 1,
-1.547856, -0.3063551, -2.203301, 1, 0.3529412, 0, 1,
-1.540199, -0.253311, 1.057754, 1, 0.3607843, 0, 1,
-1.537103, -0.4606037, -2.93384, 1, 0.3647059, 0, 1,
-1.525026, -0.3489872, -2.070129, 1, 0.372549, 0, 1,
-1.523704, 0.6917047, -0.8565735, 1, 0.3764706, 0, 1,
-1.521863, -1.138967, -2.397426, 1, 0.3843137, 0, 1,
-1.519164, -0.08209543, -0.8732525, 1, 0.3882353, 0, 1,
-1.517531, 0.5351996, -0.4392372, 1, 0.3960784, 0, 1,
-1.504416, 0.6468115, -0.3827606, 1, 0.4039216, 0, 1,
-1.499724, 0.8163987, 0.1999376, 1, 0.4078431, 0, 1,
-1.495057, 0.07236172, -0.9500571, 1, 0.4156863, 0, 1,
-1.491875, -1.675741, -1.702937, 1, 0.4196078, 0, 1,
-1.481098, -0.9204247, -2.083657, 1, 0.427451, 0, 1,
-1.478588, -0.3806869, -2.684862, 1, 0.4313726, 0, 1,
-1.474729, -1.291226, -2.241118, 1, 0.4392157, 0, 1,
-1.45522, 0.7402416, 0.4068345, 1, 0.4431373, 0, 1,
-1.453206, 0.1434719, 0.0295337, 1, 0.4509804, 0, 1,
-1.43077, -0.4248616, -3.0899, 1, 0.454902, 0, 1,
-1.430349, 0.3419312, -2.012195, 1, 0.4627451, 0, 1,
-1.42523, 0.01798946, -3.625224, 1, 0.4666667, 0, 1,
-1.398352, 0.7835154, 0.5282506, 1, 0.4745098, 0, 1,
-1.394321, 0.302493, -1.369035, 1, 0.4784314, 0, 1,
-1.391912, -0.6645466, -0.4919806, 1, 0.4862745, 0, 1,
-1.391281, 1.165937, -1.87445, 1, 0.4901961, 0, 1,
-1.366884, -0.7266003, -2.493429, 1, 0.4980392, 0, 1,
-1.364867, -0.4203913, -1.893093, 1, 0.5058824, 0, 1,
-1.357593, -0.9226844, -2.939377, 1, 0.509804, 0, 1,
-1.357305, 1.317704, -0.01926967, 1, 0.5176471, 0, 1,
-1.356756, -2.785314, -3.052298, 1, 0.5215687, 0, 1,
-1.350297, -1.968728, -2.060076, 1, 0.5294118, 0, 1,
-1.340841, 1.280804, -1.91065, 1, 0.5333334, 0, 1,
-1.337581, 1.525957, 0.5511206, 1, 0.5411765, 0, 1,
-1.332347, 0.8352582, -0.2793232, 1, 0.5450981, 0, 1,
-1.314859, -0.08598802, 0.1539923, 1, 0.5529412, 0, 1,
-1.313771, -1.490887, -4.711092, 1, 0.5568628, 0, 1,
-1.313654, -1.71995, -1.473284, 1, 0.5647059, 0, 1,
-1.303163, -0.6165702, -1.430931, 1, 0.5686275, 0, 1,
-1.300418, -2.175577, -3.080133, 1, 0.5764706, 0, 1,
-1.299865, 0.44692, -1.460287, 1, 0.5803922, 0, 1,
-1.296598, 0.5247615, -2.112892, 1, 0.5882353, 0, 1,
-1.291919, 0.7903991, 0.002798191, 1, 0.5921569, 0, 1,
-1.286158, -0.4524752, -2.541695, 1, 0.6, 0, 1,
-1.276608, 0.1062841, -2.654685, 1, 0.6078432, 0, 1,
-1.275906, 0.6284983, -1.661403, 1, 0.6117647, 0, 1,
-1.273531, -0.5029845, -0.2799063, 1, 0.6196079, 0, 1,
-1.261719, 0.440432, -0.2042423, 1, 0.6235294, 0, 1,
-1.260437, -1.797753, -1.683493, 1, 0.6313726, 0, 1,
-1.250701, -0.07837948, -2.251967, 1, 0.6352941, 0, 1,
-1.248733, -2.080914, -1.660706, 1, 0.6431373, 0, 1,
-1.24607, 1.84319, -0.4471695, 1, 0.6470588, 0, 1,
-1.242022, 1.407703, -0.9781616, 1, 0.654902, 0, 1,
-1.228858, -1.177473, -2.142845, 1, 0.6588235, 0, 1,
-1.226998, 0.8249115, -0.8901534, 1, 0.6666667, 0, 1,
-1.224207, -1.522651, -2.447043, 1, 0.6705883, 0, 1,
-1.212279, -0.7444521, -0.9335408, 1, 0.6784314, 0, 1,
-1.211156, 0.2383087, -1.056624, 1, 0.682353, 0, 1,
-1.208891, -0.009017007, -2.016108, 1, 0.6901961, 0, 1,
-1.208262, 0.3721133, -0.3942013, 1, 0.6941177, 0, 1,
-1.207124, -0.2046098, -2.360675, 1, 0.7019608, 0, 1,
-1.202794, -2.773815, -1.744535, 1, 0.7098039, 0, 1,
-1.201369, -0.3907741, -2.706501, 1, 0.7137255, 0, 1,
-1.198844, 1.58379, -1.257637, 1, 0.7215686, 0, 1,
-1.195633, 0.6968457, -0.8368523, 1, 0.7254902, 0, 1,
-1.194405, -1.649033, -3.633971, 1, 0.7333333, 0, 1,
-1.18749, 1.234984, -1.538865, 1, 0.7372549, 0, 1,
-1.176353, 1.422339, -0.171906, 1, 0.7450981, 0, 1,
-1.171398, -1.184951, -2.640387, 1, 0.7490196, 0, 1,
-1.170214, 0.1465203, -1.636499, 1, 0.7568628, 0, 1,
-1.166223, -2.39165, -2.842952, 1, 0.7607843, 0, 1,
-1.16109, -0.8836891, -3.049987, 1, 0.7686275, 0, 1,
-1.160195, -0.3400034, -2.49869, 1, 0.772549, 0, 1,
-1.151081, 0.1490488, -0.3399237, 1, 0.7803922, 0, 1,
-1.150924, 0.03329299, 0.4162424, 1, 0.7843137, 0, 1,
-1.145614, -1.095594, -3.142496, 1, 0.7921569, 0, 1,
-1.144209, 0.7091936, -0.4509651, 1, 0.7960784, 0, 1,
-1.141007, -0.5398129, -0.9909344, 1, 0.8039216, 0, 1,
-1.137546, -0.804736, -2.553041, 1, 0.8117647, 0, 1,
-1.136711, -1.576586, -1.730556, 1, 0.8156863, 0, 1,
-1.135221, 0.7330787, -0.4156803, 1, 0.8235294, 0, 1,
-1.132494, 1.541774, 0.03650526, 1, 0.827451, 0, 1,
-1.12485, 0.5563787, -1.181373, 1, 0.8352941, 0, 1,
-1.123878, -0.217649, -0.9279909, 1, 0.8392157, 0, 1,
-1.120401, 0.7647578, 1.029203, 1, 0.8470588, 0, 1,
-1.113342, -0.2609619, -2.293421, 1, 0.8509804, 0, 1,
-1.105279, -0.8232977, -2.807137, 1, 0.8588235, 0, 1,
-1.094593, 1.126236, -1.130471, 1, 0.8627451, 0, 1,
-1.093863, -1.196702, -3.205375, 1, 0.8705882, 0, 1,
-1.091911, 1.126439, -0.05171872, 1, 0.8745098, 0, 1,
-1.090786, 0.592415, -2.12753, 1, 0.8823529, 0, 1,
-1.089822, 0.5252579, -1.196218, 1, 0.8862745, 0, 1,
-1.086974, 0.9812294, 0.1546217, 1, 0.8941177, 0, 1,
-1.078077, 1.056596, 0.02609644, 1, 0.8980392, 0, 1,
-1.074588, -1.375435, -4.438955, 1, 0.9058824, 0, 1,
-1.072369, 1.197837, -1.102357, 1, 0.9137255, 0, 1,
-1.070269, -0.1753282, -0.5432913, 1, 0.9176471, 0, 1,
-1.068083, 0.6880319, -1.646852, 1, 0.9254902, 0, 1,
-1.068035, -1.048558, -2.506152, 1, 0.9294118, 0, 1,
-1.067074, -0.5183697, -1.443473, 1, 0.9372549, 0, 1,
-1.063571, 1.80404, 0.9748247, 1, 0.9411765, 0, 1,
-1.059453, 0.04953777, -2.561372, 1, 0.9490196, 0, 1,
-1.055761, -0.3659622, -3.051044, 1, 0.9529412, 0, 1,
-1.052865, 0.2832525, -0.7684956, 1, 0.9607843, 0, 1,
-1.052168, -0.1971232, -1.241363, 1, 0.9647059, 0, 1,
-1.040135, 0.9397786, -0.4740613, 1, 0.972549, 0, 1,
-1.040113, 1.511874, -0.2352128, 1, 0.9764706, 0, 1,
-1.035614, 1.280193, -2.101845, 1, 0.9843137, 0, 1,
-1.028957, -1.427745, -2.964411, 1, 0.9882353, 0, 1,
-1.028225, 0.8727978, -1.321142, 1, 0.9960784, 0, 1,
-1.02566, 0.5372644, -1.909162, 0.9960784, 1, 0, 1,
-1.025341, 0.04264754, -0.522832, 0.9921569, 1, 0, 1,
-1.019459, 0.3401862, -1.164183, 0.9843137, 1, 0, 1,
-1.013165, -2.408147, -2.808299, 0.9803922, 1, 0, 1,
-1.011754, -0.3421266, -0.2129623, 0.972549, 1, 0, 1,
-1.011693, -0.9247932, -3.058792, 0.9686275, 1, 0, 1,
-1.009991, 0.3461359, -1.859592, 0.9607843, 1, 0, 1,
-1.006089, 0.7997656, -1.016178, 0.9568627, 1, 0, 1,
-1.005523, 0.3866622, -3.886093, 0.9490196, 1, 0, 1,
-1.001352, 1.499056, -0.2453808, 0.945098, 1, 0, 1,
-0.9899096, 0.5202035, -1.339185, 0.9372549, 1, 0, 1,
-0.9787925, 0.5521555, -2.417615, 0.9333333, 1, 0, 1,
-0.9749814, -0.782387, -2.970001, 0.9254902, 1, 0, 1,
-0.9742323, 0.121954, -0.1010062, 0.9215686, 1, 0, 1,
-0.9729524, 0.1509073, -2.797451, 0.9137255, 1, 0, 1,
-0.9610108, 1.297387, -1.300578, 0.9098039, 1, 0, 1,
-0.9589508, 1.134382, 0.2665534, 0.9019608, 1, 0, 1,
-0.9466171, -0.3052249, -1.568734, 0.8941177, 1, 0, 1,
-0.945225, 0.1158482, -3.020783, 0.8901961, 1, 0, 1,
-0.9438644, 1.145598, 0.180926, 0.8823529, 1, 0, 1,
-0.9431072, -0.5211495, -2.008947, 0.8784314, 1, 0, 1,
-0.9403514, -0.9067246, -2.383176, 0.8705882, 1, 0, 1,
-0.9402137, 1.361536, -0.3474652, 0.8666667, 1, 0, 1,
-0.9401745, -0.3661544, -5.700405, 0.8588235, 1, 0, 1,
-0.9387605, 0.5459507, -2.824049, 0.854902, 1, 0, 1,
-0.9370469, -0.2295367, -2.454555, 0.8470588, 1, 0, 1,
-0.9357767, 1.131923, -1.716313, 0.8431373, 1, 0, 1,
-0.9354552, 0.8284585, 0.2939526, 0.8352941, 1, 0, 1,
-0.9303828, 0.2200744, -1.015321, 0.8313726, 1, 0, 1,
-0.925721, 1.299481, -1.946438, 0.8235294, 1, 0, 1,
-0.9094411, 0.8833905, -1.16596, 0.8196079, 1, 0, 1,
-0.9087156, -1.112043, -0.6306399, 0.8117647, 1, 0, 1,
-0.9044899, -1.823874, -2.510215, 0.8078431, 1, 0, 1,
-0.901565, -0.06630645, -2.481237, 0.8, 1, 0, 1,
-0.8930682, -0.6028402, -3.38791, 0.7921569, 1, 0, 1,
-0.8917455, -1.497453, -3.191302, 0.7882353, 1, 0, 1,
-0.8866596, -0.213517, -3.852082, 0.7803922, 1, 0, 1,
-0.8824359, -0.4498589, -2.607675, 0.7764706, 1, 0, 1,
-0.8821493, -0.6215734, -0.9075275, 0.7686275, 1, 0, 1,
-0.8730916, 1.103349, -0.3184604, 0.7647059, 1, 0, 1,
-0.8690591, -0.2052019, -3.219188, 0.7568628, 1, 0, 1,
-0.8683866, 0.09526035, -1.026855, 0.7529412, 1, 0, 1,
-0.868214, -0.9602287, -2.958999, 0.7450981, 1, 0, 1,
-0.8675128, 2.059695, 0.8992848, 0.7411765, 1, 0, 1,
-0.8644025, -0.60993, -2.792592, 0.7333333, 1, 0, 1,
-0.8629198, -0.3381725, -1.156786, 0.7294118, 1, 0, 1,
-0.8623687, -0.322848, -0.9258152, 0.7215686, 1, 0, 1,
-0.8537951, -0.5999442, -2.554201, 0.7176471, 1, 0, 1,
-0.8537652, -1.083942, -1.867138, 0.7098039, 1, 0, 1,
-0.8528305, -1.424544, -0.5028573, 0.7058824, 1, 0, 1,
-0.8474141, -0.03749776, -1.014658, 0.6980392, 1, 0, 1,
-0.8466689, -1.438828, -2.309399, 0.6901961, 1, 0, 1,
-0.8405259, 0.896104, -3.663451, 0.6862745, 1, 0, 1,
-0.8379769, -0.09088416, 0.063453, 0.6784314, 1, 0, 1,
-0.8358104, 1.339133, -0.9260987, 0.6745098, 1, 0, 1,
-0.8356085, -0.07543012, -0.7967917, 0.6666667, 1, 0, 1,
-0.8339912, -0.4971603, -3.830614, 0.6627451, 1, 0, 1,
-0.8300528, 0.253553, -0.3671424, 0.654902, 1, 0, 1,
-0.830042, -1.119297, -1.023272, 0.6509804, 1, 0, 1,
-0.8286978, 0.2458993, -1.212506, 0.6431373, 1, 0, 1,
-0.8279467, 0.6488333, -0.9981481, 0.6392157, 1, 0, 1,
-0.8217974, -0.3427673, -1.54289, 0.6313726, 1, 0, 1,
-0.8182055, -0.7585957, -2.8527, 0.627451, 1, 0, 1,
-0.8159487, 1.241456, 0.5641823, 0.6196079, 1, 0, 1,
-0.8127752, 0.1073641, -0.3896797, 0.6156863, 1, 0, 1,
-0.810156, 0.6222212, -2.216915, 0.6078432, 1, 0, 1,
-0.8008035, -0.6366103, -2.637913, 0.6039216, 1, 0, 1,
-0.7931986, -0.8053737, -2.855316, 0.5960785, 1, 0, 1,
-0.7848935, -0.7755595, -4.164487, 0.5882353, 1, 0, 1,
-0.7818463, -0.08772727, -2.100867, 0.5843138, 1, 0, 1,
-0.776297, 0.8206748, 1.469185, 0.5764706, 1, 0, 1,
-0.7725984, -0.3844869, -0.2995011, 0.572549, 1, 0, 1,
-0.7712536, 1.330562, -0.3997438, 0.5647059, 1, 0, 1,
-0.7588055, -0.4219061, -3.671356, 0.5607843, 1, 0, 1,
-0.7582142, -0.5991237, -2.915114, 0.5529412, 1, 0, 1,
-0.756245, 0.3112136, -0.6941532, 0.5490196, 1, 0, 1,
-0.7517697, 0.7273541, -0.2413284, 0.5411765, 1, 0, 1,
-0.7468982, -0.8406131, -0.717779, 0.5372549, 1, 0, 1,
-0.7459612, -0.9714849, -1.699771, 0.5294118, 1, 0, 1,
-0.7440392, -1.185282, -1.994179, 0.5254902, 1, 0, 1,
-0.7399682, 1.205109, -0.4984384, 0.5176471, 1, 0, 1,
-0.7366548, -0.8665148, -1.541288, 0.5137255, 1, 0, 1,
-0.7313446, -2.111558, -0.6517934, 0.5058824, 1, 0, 1,
-0.7294973, -0.1904491, -0.9163296, 0.5019608, 1, 0, 1,
-0.7271789, -0.4274709, -1.962948, 0.4941176, 1, 0, 1,
-0.7261441, 1.528632, -0.260565, 0.4862745, 1, 0, 1,
-0.7203737, -0.2826984, -0.4833608, 0.4823529, 1, 0, 1,
-0.7193335, -1.615638, -4.455672, 0.4745098, 1, 0, 1,
-0.719085, -0.5222368, -1.592561, 0.4705882, 1, 0, 1,
-0.7146693, -1.763911, -2.542337, 0.4627451, 1, 0, 1,
-0.7088615, 0.1215069, -2.298973, 0.4588235, 1, 0, 1,
-0.7075363, 2.038562, -0.2144319, 0.4509804, 1, 0, 1,
-0.7062676, 0.2130325, -1.856156, 0.4470588, 1, 0, 1,
-0.7044418, -0.6381079, -2.80995, 0.4392157, 1, 0, 1,
-0.7043763, -0.7343099, -2.192569, 0.4352941, 1, 0, 1,
-0.6952729, 0.08452195, -2.48005, 0.427451, 1, 0, 1,
-0.6886762, -0.6591264, -2.986964, 0.4235294, 1, 0, 1,
-0.6882161, -1.757405, -3.720617, 0.4156863, 1, 0, 1,
-0.6875032, -1.132958, -0.8460494, 0.4117647, 1, 0, 1,
-0.6867862, 2.237797, 0.1403214, 0.4039216, 1, 0, 1,
-0.6847535, -0.5695745, -4.079713, 0.3960784, 1, 0, 1,
-0.6776042, 0.4518105, -0.2358581, 0.3921569, 1, 0, 1,
-0.6749716, -0.3158849, -3.210484, 0.3843137, 1, 0, 1,
-0.674287, -0.1275139, -1.450934, 0.3803922, 1, 0, 1,
-0.6723534, 0.61353, 0.1286193, 0.372549, 1, 0, 1,
-0.6702991, 0.6977949, -0.5538375, 0.3686275, 1, 0, 1,
-0.6692138, 0.1901739, -0.9340275, 0.3607843, 1, 0, 1,
-0.6631123, -0.3368417, -2.640938, 0.3568628, 1, 0, 1,
-0.6617891, 0.5891047, -1.558119, 0.3490196, 1, 0, 1,
-0.6572644, 1.790364, -0.7475895, 0.345098, 1, 0, 1,
-0.6568207, -1.203619, -4.33736, 0.3372549, 1, 0, 1,
-0.654543, -1.284709, -2.821183, 0.3333333, 1, 0, 1,
-0.647194, 0.9030729, -0.1225161, 0.3254902, 1, 0, 1,
-0.6368591, -0.6695706, -3.819628, 0.3215686, 1, 0, 1,
-0.6315061, -0.003318455, -2.156982, 0.3137255, 1, 0, 1,
-0.6307082, 0.1833327, -1.317509, 0.3098039, 1, 0, 1,
-0.6285012, -0.2400102, -2.353832, 0.3019608, 1, 0, 1,
-0.6278799, 2.367038, 0.8528696, 0.2941177, 1, 0, 1,
-0.6245081, -1.056853, -1.851414, 0.2901961, 1, 0, 1,
-0.6212618, -0.1369946, -0.3339354, 0.282353, 1, 0, 1,
-0.6194395, -1.672884, -1.378996, 0.2784314, 1, 0, 1,
-0.6177931, -0.3976296, -0.5076014, 0.2705882, 1, 0, 1,
-0.6166053, -0.8340922, -3.670105, 0.2666667, 1, 0, 1,
-0.6147336, -1.735394, -2.618624, 0.2588235, 1, 0, 1,
-0.6142325, 0.6920211, -1.749138, 0.254902, 1, 0, 1,
-0.6133944, -0.7237986, -1.884109, 0.2470588, 1, 0, 1,
-0.612966, 0.7044377, -1.862047, 0.2431373, 1, 0, 1,
-0.6038833, 1.491623, -0.5666339, 0.2352941, 1, 0, 1,
-0.6030286, -0.6621978, -3.383211, 0.2313726, 1, 0, 1,
-0.6009293, -0.9403507, -2.128408, 0.2235294, 1, 0, 1,
-0.5917911, 0.09433504, -1.677417, 0.2196078, 1, 0, 1,
-0.5893465, 0.7064229, -1.282927, 0.2117647, 1, 0, 1,
-0.5889354, 0.06761114, -0.9424683, 0.2078431, 1, 0, 1,
-0.5878387, 0.7378886, -0.9952134, 0.2, 1, 0, 1,
-0.5848928, 1.343826, 0.5099893, 0.1921569, 1, 0, 1,
-0.5824624, -0.713494, -3.577546, 0.1882353, 1, 0, 1,
-0.5817469, -1.374138, -3.158293, 0.1803922, 1, 0, 1,
-0.5718539, 0.1017213, -0.002811266, 0.1764706, 1, 0, 1,
-0.5669869, 0.582856, 0.07136846, 0.1686275, 1, 0, 1,
-0.5660243, 0.6325845, -0.04328989, 0.1647059, 1, 0, 1,
-0.5625446, 0.2743462, -0.9385045, 0.1568628, 1, 0, 1,
-0.5597721, -1.462183, -2.516646, 0.1529412, 1, 0, 1,
-0.5594229, 0.09966131, -2.562738, 0.145098, 1, 0, 1,
-0.5592493, 0.2976424, -1.724052, 0.1411765, 1, 0, 1,
-0.5583866, -0.5734971, -3.588469, 0.1333333, 1, 0, 1,
-0.5569854, 2.825423, -1.128786, 0.1294118, 1, 0, 1,
-0.5514689, 0.8045208, -1.064571, 0.1215686, 1, 0, 1,
-0.5498155, -0.0131974, -2.442204, 0.1176471, 1, 0, 1,
-0.5486793, 1.667885, 0.4509141, 0.1098039, 1, 0, 1,
-0.5481917, 0.1176966, -0.5633451, 0.1058824, 1, 0, 1,
-0.5456775, 1.207946, -0.5336499, 0.09803922, 1, 0, 1,
-0.5381992, 0.459453, 0.1915071, 0.09019608, 1, 0, 1,
-0.5295196, -0.5366299, -2.807575, 0.08627451, 1, 0, 1,
-0.5250732, 0.5755926, -0.6912089, 0.07843138, 1, 0, 1,
-0.5228326, -0.004380563, -2.360861, 0.07450981, 1, 0, 1,
-0.5188805, -0.4790883, -0.4385898, 0.06666667, 1, 0, 1,
-0.5158931, -0.02473466, -2.042348, 0.0627451, 1, 0, 1,
-0.5126284, 0.9944442, -1.096603, 0.05490196, 1, 0, 1,
-0.5068099, -1.915103, -2.935901, 0.05098039, 1, 0, 1,
-0.5039807, -0.03799856, -2.317886, 0.04313726, 1, 0, 1,
-0.4997672, 0.533008, -1.003586, 0.03921569, 1, 0, 1,
-0.4969441, -1.111589, -2.955894, 0.03137255, 1, 0, 1,
-0.4967714, 0.7609191, 1.224686, 0.02745098, 1, 0, 1,
-0.490591, -1.610415, -3.202629, 0.01960784, 1, 0, 1,
-0.4889252, -0.3656072, -1.06139, 0.01568628, 1, 0, 1,
-0.4868665, 0.490842, -0.823576, 0.007843138, 1, 0, 1,
-0.4788625, -1.225815, -2.982243, 0.003921569, 1, 0, 1,
-0.4747364, -1.883667, -2.057183, 0, 1, 0.003921569, 1,
-0.4671295, -0.4040628, -3.011051, 0, 1, 0.01176471, 1,
-0.467043, -0.2413671, -2.891732, 0, 1, 0.01568628, 1,
-0.4629824, 0.5847145, -2.519616, 0, 1, 0.02352941, 1,
-0.4619518, 1.077653, -0.9399344, 0, 1, 0.02745098, 1,
-0.4547676, -0.09536988, -1.400321, 0, 1, 0.03529412, 1,
-0.451704, -0.6255391, -1.330263, 0, 1, 0.03921569, 1,
-0.4470174, -1.272644, -1.646568, 0, 1, 0.04705882, 1,
-0.4442157, -0.007474998, -0.6575769, 0, 1, 0.05098039, 1,
-0.4404842, -2.541156, -3.411849, 0, 1, 0.05882353, 1,
-0.434755, -0.9378337, -2.606595, 0, 1, 0.0627451, 1,
-0.4341809, 1.658605, 1.182197, 0, 1, 0.07058824, 1,
-0.4338194, -1.586841, -2.498001, 0, 1, 0.07450981, 1,
-0.4332784, -0.9049915, -1.662466, 0, 1, 0.08235294, 1,
-0.4329576, -0.2862109, -2.49908, 0, 1, 0.08627451, 1,
-0.4326721, 0.3311484, -0.8839514, 0, 1, 0.09411765, 1,
-0.4324081, -0.1157375, -0.7972908, 0, 1, 0.1019608, 1,
-0.4304165, -0.4422728, -2.047714, 0, 1, 0.1058824, 1,
-0.4221547, 0.1492307, -0.4526008, 0, 1, 0.1137255, 1,
-0.4181077, -0.5642169, -3.706873, 0, 1, 0.1176471, 1,
-0.4143077, 0.2356479, -0.9256513, 0, 1, 0.1254902, 1,
-0.4129616, 1.808939, -0.6006064, 0, 1, 0.1294118, 1,
-0.4118735, 0.6394102, -0.6103733, 0, 1, 0.1372549, 1,
-0.4066884, -0.1518271, -3.527877, 0, 1, 0.1411765, 1,
-0.4054655, 0.946697, -0.02705694, 0, 1, 0.1490196, 1,
-0.4043086, 0.2063564, -0.7730158, 0, 1, 0.1529412, 1,
-0.4022643, 0.9973112, -0.4933031, 0, 1, 0.1607843, 1,
-0.3968138, 1.812417, -1.626698, 0, 1, 0.1647059, 1,
-0.3930981, -0.02860592, 0.1145666, 0, 1, 0.172549, 1,
-0.3852898, -1.185309, -2.80796, 0, 1, 0.1764706, 1,
-0.3840942, -0.2997104, -2.539055, 0, 1, 0.1843137, 1,
-0.3823234, -0.9942671, -2.208307, 0, 1, 0.1882353, 1,
-0.3820585, -0.09089588, -3.368296, 0, 1, 0.1960784, 1,
-0.3819847, -2.214099, -4.625207, 0, 1, 0.2039216, 1,
-0.3787785, 1.334217, -1.040754, 0, 1, 0.2078431, 1,
-0.3785329, 0.7707476, -1.083196, 0, 1, 0.2156863, 1,
-0.3736421, 0.2676422, -0.9134011, 0, 1, 0.2196078, 1,
-0.3722596, 0.7736902, -1.044029, 0, 1, 0.227451, 1,
-0.3707855, -0.1683232, -1.174876, 0, 1, 0.2313726, 1,
-0.3660075, -1.0349, -3.309537, 0, 1, 0.2392157, 1,
-0.364632, 1.150419, 0.2247585, 0, 1, 0.2431373, 1,
-0.364469, -0.8644429, -2.346473, 0, 1, 0.2509804, 1,
-0.3629237, -0.7181441, -3.386395, 0, 1, 0.254902, 1,
-0.3606713, -0.1725809, -2.163885, 0, 1, 0.2627451, 1,
-0.3598381, 1.871276, -0.1177751, 0, 1, 0.2666667, 1,
-0.3519699, 0.7318591, -0.05150533, 0, 1, 0.2745098, 1,
-0.3514355, 0.05271463, 0.3488328, 0, 1, 0.2784314, 1,
-0.3505238, -0.4649084, -2.190003, 0, 1, 0.2862745, 1,
-0.3498772, -1.846518, -3.336505, 0, 1, 0.2901961, 1,
-0.3452217, -0.09293823, -1.681085, 0, 1, 0.2980392, 1,
-0.345084, 0.08613769, -1.529493, 0, 1, 0.3058824, 1,
-0.3442418, 0.9840373, 0.5203907, 0, 1, 0.3098039, 1,
-0.3441363, -1.72123, -3.140707, 0, 1, 0.3176471, 1,
-0.3404663, -0.9776656, -2.27523, 0, 1, 0.3215686, 1,
-0.3398521, -0.1879205, -2.857743, 0, 1, 0.3294118, 1,
-0.3395867, -1.753179, -0.224517, 0, 1, 0.3333333, 1,
-0.3354519, 1.225822, -0.04209632, 0, 1, 0.3411765, 1,
-0.3276415, 1.307899, -0.3589482, 0, 1, 0.345098, 1,
-0.3238949, 0.6371053, 1.681391, 0, 1, 0.3529412, 1,
-0.3221546, 0.87146, -1.132889, 0, 1, 0.3568628, 1,
-0.3056152, 1.265907, -0.4550971, 0, 1, 0.3647059, 1,
-0.3018165, -0.01570678, -0.6502268, 0, 1, 0.3686275, 1,
-0.301424, 0.4873921, -0.5153115, 0, 1, 0.3764706, 1,
-0.2948423, 0.0515712, -2.943768, 0, 1, 0.3803922, 1,
-0.2944157, 0.2598871, -1.139955, 0, 1, 0.3882353, 1,
-0.2938038, 0.6506709, -2.57276, 0, 1, 0.3921569, 1,
-0.2910097, -0.2533897, -2.710341, 0, 1, 0.4, 1,
-0.2889611, -0.4891659, -3.054131, 0, 1, 0.4078431, 1,
-0.2874992, 0.3157905, -0.398694, 0, 1, 0.4117647, 1,
-0.2853719, 0.5332012, -0.5005221, 0, 1, 0.4196078, 1,
-0.2792111, 1.406506, 1.279742, 0, 1, 0.4235294, 1,
-0.2704171, 0.6996034, -0.9136157, 0, 1, 0.4313726, 1,
-0.2703117, -0.8454498, -3.081993, 0, 1, 0.4352941, 1,
-0.270301, -0.831215, -2.383909, 0, 1, 0.4431373, 1,
-0.2681422, -0.9328039, -4.112834, 0, 1, 0.4470588, 1,
-0.2607496, 0.6531652, -1.3214, 0, 1, 0.454902, 1,
-0.2601436, -0.1787429, -3.26992, 0, 1, 0.4588235, 1,
-0.2592674, -0.9516313, -2.574523, 0, 1, 0.4666667, 1,
-0.2563111, -0.8286181, -0.9605609, 0, 1, 0.4705882, 1,
-0.2554049, -0.1070088, -0.7048979, 0, 1, 0.4784314, 1,
-0.2537741, 1.01803, 0.1684118, 0, 1, 0.4823529, 1,
-0.2526064, 0.811336, 2.087891, 0, 1, 0.4901961, 1,
-0.2485874, 0.951717, -0.2926727, 0, 1, 0.4941176, 1,
-0.2440283, 0.1382852, -0.509011, 0, 1, 0.5019608, 1,
-0.2378329, 0.1855653, -3.862409, 0, 1, 0.509804, 1,
-0.2365395, 0.9051779, 1.668375, 0, 1, 0.5137255, 1,
-0.2310464, -0.610397, -2.067695, 0, 1, 0.5215687, 1,
-0.2309114, -0.374214, -3.626477, 0, 1, 0.5254902, 1,
-0.2302488, 0.2332063, 0.4035977, 0, 1, 0.5333334, 1,
-0.2282121, -0.001054545, -3.103713, 0, 1, 0.5372549, 1,
-0.2242848, 0.1553222, -1.176431, 0, 1, 0.5450981, 1,
-0.2118323, 1.091884, -1.829834, 0, 1, 0.5490196, 1,
-0.2112015, 1.702846, 0.8615614, 0, 1, 0.5568628, 1,
-0.2089991, 1.612011, -0.1288096, 0, 1, 0.5607843, 1,
-0.2081622, -1.437539, -4.104566, 0, 1, 0.5686275, 1,
-0.2063684, -2.275655, -3.345084, 0, 1, 0.572549, 1,
-0.2042298, -0.1624016, -3.085382, 0, 1, 0.5803922, 1,
-0.2031896, -0.6913265, -4.124418, 0, 1, 0.5843138, 1,
-0.2029679, 1.135207, 1.425059, 0, 1, 0.5921569, 1,
-0.2015126, -0.6579798, -2.967992, 0, 1, 0.5960785, 1,
-0.2005073, 1.92541, 0.8053068, 0, 1, 0.6039216, 1,
-0.1929944, 0.8376772, -0.4246327, 0, 1, 0.6117647, 1,
-0.1926891, -0.04604477, -1.938788, 0, 1, 0.6156863, 1,
-0.192247, 1.131896, -1.473216, 0, 1, 0.6235294, 1,
-0.1912155, -0.2660102, -2.697099, 0, 1, 0.627451, 1,
-0.1831851, 0.4526347, 0.3823784, 0, 1, 0.6352941, 1,
-0.1825494, 0.7802292, 0.4828629, 0, 1, 0.6392157, 1,
-0.1811326, -0.009925225, -0.7865056, 0, 1, 0.6470588, 1,
-0.1779264, -0.1096032, -1.478956, 0, 1, 0.6509804, 1,
-0.1769889, -1.121786, -2.983401, 0, 1, 0.6588235, 1,
-0.171886, -0.4400691, -3.539094, 0, 1, 0.6627451, 1,
-0.1696089, 0.3696235, 1.571029, 0, 1, 0.6705883, 1,
-0.1691439, -0.5110444, -2.202689, 0, 1, 0.6745098, 1,
-0.1687021, -0.2995491, -3.226545, 0, 1, 0.682353, 1,
-0.1655074, -0.2929403, -3.010083, 0, 1, 0.6862745, 1,
-0.1640449, -0.556474, -3.980889, 0, 1, 0.6941177, 1,
-0.1614127, -2.283054, -3.65626, 0, 1, 0.7019608, 1,
-0.156666, 0.03181978, -1.763663, 0, 1, 0.7058824, 1,
-0.1548276, -1.164265, -2.744236, 0, 1, 0.7137255, 1,
-0.1532721, -0.7733462, -4.582522, 0, 1, 0.7176471, 1,
-0.1526555, -1.902393, -3.286408, 0, 1, 0.7254902, 1,
-0.1511763, -0.9702453, -3.419737, 0, 1, 0.7294118, 1,
-0.1497814, -3.087501, -1.284717, 0, 1, 0.7372549, 1,
-0.1438748, 0.3330139, 0.41489, 0, 1, 0.7411765, 1,
-0.141184, -0.1284183, -1.092861, 0, 1, 0.7490196, 1,
-0.1372664, -0.09804651, -3.396097, 0, 1, 0.7529412, 1,
-0.1344431, 0.1739785, -1.796852, 0, 1, 0.7607843, 1,
-0.1340985, 0.07133968, -0.7981127, 0, 1, 0.7647059, 1,
-0.1294452, 0.1822156, -1.533684, 0, 1, 0.772549, 1,
-0.1283118, -0.6764997, -3.05066, 0, 1, 0.7764706, 1,
-0.1263925, -0.2458938, -1.315727, 0, 1, 0.7843137, 1,
-0.1257304, 0.2562506, -0.3583806, 0, 1, 0.7882353, 1,
-0.1245167, 0.1551084, -1.536532, 0, 1, 0.7960784, 1,
-0.1231802, -1.698739, -1.794685, 0, 1, 0.8039216, 1,
-0.121028, 0.8804368, -0.4912194, 0, 1, 0.8078431, 1,
-0.1162147, 0.4431688, 0.129301, 0, 1, 0.8156863, 1,
-0.1160218, -0.09408792, -1.195436, 0, 1, 0.8196079, 1,
-0.1157108, 1.011527, 0.5813002, 0, 1, 0.827451, 1,
-0.1132097, -0.03688718, -1.29065, 0, 1, 0.8313726, 1,
-0.1115859, -0.2722667, -3.383292, 0, 1, 0.8392157, 1,
-0.110076, -0.08483442, -0.3046364, 0, 1, 0.8431373, 1,
-0.1092585, 0.9229579, -0.4808858, 0, 1, 0.8509804, 1,
-0.1080562, -1.087944, -2.131011, 0, 1, 0.854902, 1,
-0.1065158, 0.2188332, 0.2074517, 0, 1, 0.8627451, 1,
-0.1061096, 0.3477249, -1.069507, 0, 1, 0.8666667, 1,
-0.1046872, 0.5550728, 0.1893407, 0, 1, 0.8745098, 1,
-0.1044642, 2.298931, -1.25402, 0, 1, 0.8784314, 1,
-0.1027995, 1.951879, -0.2017425, 0, 1, 0.8862745, 1,
-0.09879056, -0.7907033, -2.123635, 0, 1, 0.8901961, 1,
-0.09814719, -1.238176, -3.165707, 0, 1, 0.8980392, 1,
-0.08576455, -1.200561, -3.836329, 0, 1, 0.9058824, 1,
-0.08542865, -0.9442096, -2.655124, 0, 1, 0.9098039, 1,
-0.08497242, 0.1790087, -1.260321, 0, 1, 0.9176471, 1,
-0.0836195, 3.371224, 0.5802425, 0, 1, 0.9215686, 1,
-0.08310331, -0.1386915, -1.203173, 0, 1, 0.9294118, 1,
-0.08293773, -0.7908325, -4.877894, 0, 1, 0.9333333, 1,
-0.07954705, 0.9843293, 0.4477561, 0, 1, 0.9411765, 1,
-0.07717466, -1.284893, -2.363928, 0, 1, 0.945098, 1,
-0.07678217, 0.8273209, 0.1609316, 0, 1, 0.9529412, 1,
-0.07573535, -1.184087, -1.620496, 0, 1, 0.9568627, 1,
-0.07559244, 1.291691, -1.118445, 0, 1, 0.9647059, 1,
-0.07488775, 1.039132, -0.4718425, 0, 1, 0.9686275, 1,
-0.06887756, 1.054775, -0.08765865, 0, 1, 0.9764706, 1,
-0.06267105, 0.8025438, -1.368883, 0, 1, 0.9803922, 1,
-0.0604878, 1.575409, 0.446279, 0, 1, 0.9882353, 1,
-0.05971151, -0.8019274, -1.556608, 0, 1, 0.9921569, 1,
-0.05839404, 0.5263835, 0.2471431, 0, 1, 1, 1,
-0.05833492, 0.7704075, 0.4632024, 0, 0.9921569, 1, 1,
-0.05470728, 0.8508517, -0.9461402, 0, 0.9882353, 1, 1,
-0.04727993, -0.4060367, -3.507972, 0, 0.9803922, 1, 1,
-0.04674417, -0.3227757, -5.042838, 0, 0.9764706, 1, 1,
-0.04601346, 1.329512, -0.9590727, 0, 0.9686275, 1, 1,
-0.03787018, 1.031365, 0.6547596, 0, 0.9647059, 1, 1,
-0.0332537, -1.168446, -3.180476, 0, 0.9568627, 1, 1,
-0.03259013, -0.02005252, -0.693347, 0, 0.9529412, 1, 1,
-0.02839348, 0.6937111, 0.1635121, 0, 0.945098, 1, 1,
-0.02171012, -0.6655962, -3.713655, 0, 0.9411765, 1, 1,
-0.01986851, 2.319356, -0.7454005, 0, 0.9333333, 1, 1,
-0.01248382, 0.329237, 0.6171294, 0, 0.9294118, 1, 1,
-0.01119184, 0.7060536, -2.250652, 0, 0.9215686, 1, 1,
-0.009380217, -0.1025376, -3.348411, 0, 0.9176471, 1, 1,
-0.00919562, -0.08126724, -3.538457, 0, 0.9098039, 1, 1,
-0.008574092, -0.2780527, -3.922256, 0, 0.9058824, 1, 1,
-0.008507631, 1.686141, 0.3628298, 0, 0.8980392, 1, 1,
0.001608537, 0.3303335, -0.1408045, 0, 0.8901961, 1, 1,
0.006714477, 1.369127, 0.6241019, 0, 0.8862745, 1, 1,
0.00748422, 1.168459, -2.779416, 0, 0.8784314, 1, 1,
0.00962956, 0.8971003, -0.6774336, 0, 0.8745098, 1, 1,
0.01043525, 0.1346175, -0.2952345, 0, 0.8666667, 1, 1,
0.01167407, -0.7520602, 3.415449, 0, 0.8627451, 1, 1,
0.01204078, -1.320525, 3.000132, 0, 0.854902, 1, 1,
0.0126956, 0.8652574, -1.49825, 0, 0.8509804, 1, 1,
0.01497782, -0.519486, 4.526123, 0, 0.8431373, 1, 1,
0.01585863, -0.333012, 3.454401, 0, 0.8392157, 1, 1,
0.01634225, -0.163296, 1.826366, 0, 0.8313726, 1, 1,
0.01644568, -0.1772419, 3.36305, 0, 0.827451, 1, 1,
0.01800637, 1.085892, -1.078243, 0, 0.8196079, 1, 1,
0.01882459, 1.198506, 1.111252, 0, 0.8156863, 1, 1,
0.02364733, -1.261295, 3.473853, 0, 0.8078431, 1, 1,
0.02433851, 0.1641183, 0.3084773, 0, 0.8039216, 1, 1,
0.02706984, 1.25807, -0.7638975, 0, 0.7960784, 1, 1,
0.02764304, -0.07197752, 3.917811, 0, 0.7882353, 1, 1,
0.02934177, 0.2408047, 2.639193, 0, 0.7843137, 1, 1,
0.03166132, 1.278858, -1.30649, 0, 0.7764706, 1, 1,
0.03377721, -1.018655, 1.778768, 0, 0.772549, 1, 1,
0.03421901, -0.4994283, 4.320868, 0, 0.7647059, 1, 1,
0.0416371, -0.5713171, 1.628396, 0, 0.7607843, 1, 1,
0.05038967, -0.6552043, 3.669176, 0, 0.7529412, 1, 1,
0.05495505, -1.325076, 2.881708, 0, 0.7490196, 1, 1,
0.05497253, -1.426085, 4.536711, 0, 0.7411765, 1, 1,
0.05677123, 0.4026464, 0.5537306, 0, 0.7372549, 1, 1,
0.05808932, 0.003189878, 0.2316262, 0, 0.7294118, 1, 1,
0.05876081, 1.303849, -0.3444482, 0, 0.7254902, 1, 1,
0.0643866, 0.5980346, -0.2838692, 0, 0.7176471, 1, 1,
0.06530441, 0.781552, 0.06594402, 0, 0.7137255, 1, 1,
0.06633997, -1.538633, 2.903088, 0, 0.7058824, 1, 1,
0.07001495, 0.4592698, 0.1994832, 0, 0.6980392, 1, 1,
0.072674, 1.44207, -0.5157138, 0, 0.6941177, 1, 1,
0.07444338, 0.019241, 0.396228, 0, 0.6862745, 1, 1,
0.07802555, 0.1167508, 0.8125747, 0, 0.682353, 1, 1,
0.08248856, 0.9147275, 2.053988, 0, 0.6745098, 1, 1,
0.08375129, 1.10673, -1.87129, 0, 0.6705883, 1, 1,
0.08900065, -0.1006546, 1.570336, 0, 0.6627451, 1, 1,
0.09367999, 0.1338184, -2.133051, 0, 0.6588235, 1, 1,
0.09478983, -0.1766112, 3.034157, 0, 0.6509804, 1, 1,
0.09771794, -0.01208659, 1.929128, 0, 0.6470588, 1, 1,
0.0982684, -0.7283379, 2.846974, 0, 0.6392157, 1, 1,
0.0998896, 1.310361, 0.5583764, 0, 0.6352941, 1, 1,
0.1013013, 0.435394, 0.3015111, 0, 0.627451, 1, 1,
0.1091996, 0.1698775, 1.400269, 0, 0.6235294, 1, 1,
0.1121763, 0.1899164, 1.886726, 0, 0.6156863, 1, 1,
0.112913, -0.5577999, 2.618487, 0, 0.6117647, 1, 1,
0.1150351, -0.8477587, 3.180199, 0, 0.6039216, 1, 1,
0.1199926, 1.962032, -0.5489386, 0, 0.5960785, 1, 1,
0.1208873, -0.2749993, 1.423504, 0, 0.5921569, 1, 1,
0.1222634, 0.3243572, -0.131644, 0, 0.5843138, 1, 1,
0.123343, -0.1071664, 2.936246, 0, 0.5803922, 1, 1,
0.1234474, -0.3841762, 4.275164, 0, 0.572549, 1, 1,
0.1273183, -2.371601, 3.227967, 0, 0.5686275, 1, 1,
0.1291623, 0.0566964, 2.75415, 0, 0.5607843, 1, 1,
0.1373905, 0.9159285, 0.03730908, 0, 0.5568628, 1, 1,
0.1383336, 0.3405566, 0.8933803, 0, 0.5490196, 1, 1,
0.1396037, -0.872435, 3.169073, 0, 0.5450981, 1, 1,
0.1401719, 0.202202, -0.9891405, 0, 0.5372549, 1, 1,
0.1412583, -0.4509005, 4.532966, 0, 0.5333334, 1, 1,
0.1423026, -0.2596465, 2.697701, 0, 0.5254902, 1, 1,
0.1426588, -0.8535693, 3.471294, 0, 0.5215687, 1, 1,
0.1463359, 0.9712642, 1.111964, 0, 0.5137255, 1, 1,
0.1475171, -0.2086846, 3.046807, 0, 0.509804, 1, 1,
0.1523518, -1.518622, 3.796666, 0, 0.5019608, 1, 1,
0.1541631, -0.272747, 2.157359, 0, 0.4941176, 1, 1,
0.1552604, 1.366098, 0.3846675, 0, 0.4901961, 1, 1,
0.1600281, -0.4629398, 5.23899, 0, 0.4823529, 1, 1,
0.1639801, 1.120627, -1.054705, 0, 0.4784314, 1, 1,
0.1652463, 0.9959385, 0.4090318, 0, 0.4705882, 1, 1,
0.168107, 1.770651, -0.4281255, 0, 0.4666667, 1, 1,
0.1705652, 0.0402471, 2.787861, 0, 0.4588235, 1, 1,
0.1722994, -0.0154524, 0.5868131, 0, 0.454902, 1, 1,
0.1754356, 0.1185367, 1.491524, 0, 0.4470588, 1, 1,
0.1782563, -1.468502, 1.041916, 0, 0.4431373, 1, 1,
0.1812711, 2.30883, -0.8926877, 0, 0.4352941, 1, 1,
0.1875918, -0.3180918, 3.062805, 0, 0.4313726, 1, 1,
0.1885356, 0.5962895, 0.4942858, 0, 0.4235294, 1, 1,
0.1906696, -0.7965618, 4.757, 0, 0.4196078, 1, 1,
0.2000053, -1.013703, 3.550614, 0, 0.4117647, 1, 1,
0.2007499, 0.5605306, -0.1304283, 0, 0.4078431, 1, 1,
0.2022271, 2.147817, -0.8086485, 0, 0.4, 1, 1,
0.2064629, -1.268113, 2.09421, 0, 0.3921569, 1, 1,
0.2084865, 0.3874764, 1.435571, 0, 0.3882353, 1, 1,
0.2087057, -0.6665425, 1.36538, 0, 0.3803922, 1, 1,
0.2100621, 0.8577081, -0.5232787, 0, 0.3764706, 1, 1,
0.2107112, 1.807357, 2.323961, 0, 0.3686275, 1, 1,
0.2124985, -0.686411, 3.79772, 0, 0.3647059, 1, 1,
0.2165331, -2.21664, 2.280988, 0, 0.3568628, 1, 1,
0.2218574, 0.0416857, 1.786011, 0, 0.3529412, 1, 1,
0.2232116, -0.6149172, 2.928709, 0, 0.345098, 1, 1,
0.2284979, 0.3433678, -0.6112443, 0, 0.3411765, 1, 1,
0.2307446, 1.89378, -0.3744654, 0, 0.3333333, 1, 1,
0.2328304, 1.159763, 0.6302135, 0, 0.3294118, 1, 1,
0.2362867, -0.4720074, 3.649192, 0, 0.3215686, 1, 1,
0.2420632, -0.08663164, 1.684545, 0, 0.3176471, 1, 1,
0.243594, 0.7977455, -0.1412695, 0, 0.3098039, 1, 1,
0.2477599, 0.759819, 0.637648, 0, 0.3058824, 1, 1,
0.2478566, 0.4856784, -1.630911, 0, 0.2980392, 1, 1,
0.2481095, -1.094079, 2.64853, 0, 0.2901961, 1, 1,
0.2483293, 1.009393, -0.3955219, 0, 0.2862745, 1, 1,
0.2490634, -0.4709912, 2.842182, 0, 0.2784314, 1, 1,
0.2495166, 0.9031278, 0.3433642, 0, 0.2745098, 1, 1,
0.2524057, -1.221311, 2.382968, 0, 0.2666667, 1, 1,
0.2526869, 1.755164, 0.320836, 0, 0.2627451, 1, 1,
0.2590488, -0.2694635, 0.6958355, 0, 0.254902, 1, 1,
0.2646677, -1.599383, 2.586732, 0, 0.2509804, 1, 1,
0.2655035, -1.089343, 3.459094, 0, 0.2431373, 1, 1,
0.2683898, -0.4529578, 3.646944, 0, 0.2392157, 1, 1,
0.2684293, 1.11113, 0.3420893, 0, 0.2313726, 1, 1,
0.2716764, 0.1521898, -0.6663909, 0, 0.227451, 1, 1,
0.2725127, 0.7597508, -0.3133491, 0, 0.2196078, 1, 1,
0.2736824, -0.7947761, 3.436066, 0, 0.2156863, 1, 1,
0.2737966, -1.46537, 1.991069, 0, 0.2078431, 1, 1,
0.2763078, -2.519988, 3.798126, 0, 0.2039216, 1, 1,
0.2775141, -0.4845175, 3.490706, 0, 0.1960784, 1, 1,
0.2805844, -0.9005157, 3.396632, 0, 0.1882353, 1, 1,
0.2816625, 0.4285224, 1.276231, 0, 0.1843137, 1, 1,
0.2873976, -0.8634641, 3.334263, 0, 0.1764706, 1, 1,
0.2902578, -0.5849221, 1.715907, 0, 0.172549, 1, 1,
0.2917604, -0.5943909, 3.703117, 0, 0.1647059, 1, 1,
0.2960207, -0.1047515, 1.213764, 0, 0.1607843, 1, 1,
0.296436, -0.5607198, 3.241889, 0, 0.1529412, 1, 1,
0.2980355, 0.3600664, -0.1735288, 0, 0.1490196, 1, 1,
0.3005814, -0.9087676, 2.872254, 0, 0.1411765, 1, 1,
0.3023404, 0.1105788, 2.664509, 0, 0.1372549, 1, 1,
0.3069389, 0.469328, 2.5805, 0, 0.1294118, 1, 1,
0.3079048, 1.776286, 0.03462511, 0, 0.1254902, 1, 1,
0.3087133, 1.657982, -0.4896509, 0, 0.1176471, 1, 1,
0.3087674, 0.7082606, -0.4945282, 0, 0.1137255, 1, 1,
0.3128861, 0.6331601, -0.5002728, 0, 0.1058824, 1, 1,
0.3130738, 0.4624054, 1.832647, 0, 0.09803922, 1, 1,
0.3234147, 0.6438795, 0.3018503, 0, 0.09411765, 1, 1,
0.3239075, 0.188925, 2.720171, 0, 0.08627451, 1, 1,
0.3291846, 1.309185, 0.07822254, 0, 0.08235294, 1, 1,
0.3293344, 1.768107, 0.6527594, 0, 0.07450981, 1, 1,
0.3315755, 1.583275, 1.10095, 0, 0.07058824, 1, 1,
0.3383395, 0.6094512, 0.2585951, 0, 0.0627451, 1, 1,
0.3412765, 0.5914552, 0.9482252, 0, 0.05882353, 1, 1,
0.3466216, 0.2524803, 1.137666, 0, 0.05098039, 1, 1,
0.3526837, 1.076076, 0.6465814, 0, 0.04705882, 1, 1,
0.3588925, -1.30216, 3.435185, 0, 0.03921569, 1, 1,
0.3634943, 0.9333595, -1.782493, 0, 0.03529412, 1, 1,
0.3708231, 0.5468666, 1.060963, 0, 0.02745098, 1, 1,
0.3718259, 0.3419389, 0.8428205, 0, 0.02352941, 1, 1,
0.3750695, 0.3222317, 0.6302589, 0, 0.01568628, 1, 1,
0.3774168, 1.026851, -0.7646207, 0, 0.01176471, 1, 1,
0.3857039, -1.054328, 2.511536, 0, 0.003921569, 1, 1,
0.3863419, 1.661258, 0.9151433, 0.003921569, 0, 1, 1,
0.3927523, -0.5909162, 1.432449, 0.007843138, 0, 1, 1,
0.3978675, -0.4190462, 2.062603, 0.01568628, 0, 1, 1,
0.3987315, 1.452411, 1.854287, 0.01960784, 0, 1, 1,
0.3997058, -2.017901, 2.822057, 0.02745098, 0, 1, 1,
0.4003583, 0.4841496, -0.3187119, 0.03137255, 0, 1, 1,
0.4026895, 0.8695698, 1.434098, 0.03921569, 0, 1, 1,
0.4058426, -0.1778087, 1.286299, 0.04313726, 0, 1, 1,
0.4104443, 0.1342398, 1.768602, 0.05098039, 0, 1, 1,
0.4106353, -0.8105369, 3.526357, 0.05490196, 0, 1, 1,
0.4126987, 0.5228539, 1.009718, 0.0627451, 0, 1, 1,
0.4141416, -1.043842, 2.505696, 0.06666667, 0, 1, 1,
0.4142153, 0.3953843, 0.8677068, 0.07450981, 0, 1, 1,
0.4162741, 0.5590405, 1.985201, 0.07843138, 0, 1, 1,
0.4203696, 1.738292, -1.523745, 0.08627451, 0, 1, 1,
0.4219474, -1.86467, 3.442708, 0.09019608, 0, 1, 1,
0.4323137, 0.4066198, 0.4335225, 0.09803922, 0, 1, 1,
0.4334927, -0.1533767, 2.67929, 0.1058824, 0, 1, 1,
0.4335537, -1.064093, 2.100668, 0.1098039, 0, 1, 1,
0.4362608, 2.408468, 0.08527949, 0.1176471, 0, 1, 1,
0.4385909, -2.238759, 3.326916, 0.1215686, 0, 1, 1,
0.4392038, -0.0826859, -0.2667428, 0.1294118, 0, 1, 1,
0.4394919, 1.056709, 1.786482, 0.1333333, 0, 1, 1,
0.4407121, -0.3530017, 2.027669, 0.1411765, 0, 1, 1,
0.4414091, 1.341448, -1.165148, 0.145098, 0, 1, 1,
0.4430352, -0.3793806, 1.68501, 0.1529412, 0, 1, 1,
0.4445921, -0.246166, 2.632738, 0.1568628, 0, 1, 1,
0.4446851, -0.2353216, 0.8309677, 0.1647059, 0, 1, 1,
0.4471443, 0.317564, 0.6793982, 0.1686275, 0, 1, 1,
0.4475021, -0.03436393, 2.220419, 0.1764706, 0, 1, 1,
0.4477266, -1.72833, 3.207103, 0.1803922, 0, 1, 1,
0.4482885, 2.140173, 1.338701, 0.1882353, 0, 1, 1,
0.4535172, -1.069971, 2.445945, 0.1921569, 0, 1, 1,
0.4570249, -0.8187697, 2.182101, 0.2, 0, 1, 1,
0.4600178, -1.522755, 3.214606, 0.2078431, 0, 1, 1,
0.4644079, 0.2272062, 0.9461636, 0.2117647, 0, 1, 1,
0.4701781, 0.8161563, 0.2342091, 0.2196078, 0, 1, 1,
0.474078, 0.1399515, 0.1025785, 0.2235294, 0, 1, 1,
0.4878852, 0.5825872, 0.6276442, 0.2313726, 0, 1, 1,
0.4882649, -0.5474356, 2.339121, 0.2352941, 0, 1, 1,
0.4913273, -0.6344022, 2.650108, 0.2431373, 0, 1, 1,
0.4919055, 0.3581773, 1.042698, 0.2470588, 0, 1, 1,
0.500255, -1.419453, 1.686903, 0.254902, 0, 1, 1,
0.5026039, 0.393031, 0.118927, 0.2588235, 0, 1, 1,
0.5043083, 0.9217889, -0.2463798, 0.2666667, 0, 1, 1,
0.5063136, -0.05923682, 1.461825, 0.2705882, 0, 1, 1,
0.5090696, -0.9995789, 3.937893, 0.2784314, 0, 1, 1,
0.511479, -1.132183, 2.25372, 0.282353, 0, 1, 1,
0.5160741, 1.385793, 1.398699, 0.2901961, 0, 1, 1,
0.5215421, 0.02368411, 2.571636, 0.2941177, 0, 1, 1,
0.5221751, -0.5142165, 2.129579, 0.3019608, 0, 1, 1,
0.5246663, 1.048629, 0.852064, 0.3098039, 0, 1, 1,
0.5266783, 0.003553144, 1.629341, 0.3137255, 0, 1, 1,
0.5271516, -1.39326, 2.084517, 0.3215686, 0, 1, 1,
0.5275311, -0.5596344, 1.75509, 0.3254902, 0, 1, 1,
0.5328289, 0.4963845, -0.239112, 0.3333333, 0, 1, 1,
0.5372547, 2.241195, 1.68728, 0.3372549, 0, 1, 1,
0.5388388, 0.2472243, -0.2720141, 0.345098, 0, 1, 1,
0.5441092, 0.3415479, -0.2508749, 0.3490196, 0, 1, 1,
0.5480028, -2.342667, 4.138441, 0.3568628, 0, 1, 1,
0.5484621, -0.5359395, 3.578076, 0.3607843, 0, 1, 1,
0.5487382, 0.827948, -1.68485, 0.3686275, 0, 1, 1,
0.5538341, -0.6814606, 2.431101, 0.372549, 0, 1, 1,
0.5611104, -1.309679, 2.458552, 0.3803922, 0, 1, 1,
0.561376, 1.041638, -0.1725377, 0.3843137, 0, 1, 1,
0.5676277, 0.6773792, 0.4589888, 0.3921569, 0, 1, 1,
0.5706193, -0.1030716, 0.7799774, 0.3960784, 0, 1, 1,
0.5770173, 0.7132156, -1.675625, 0.4039216, 0, 1, 1,
0.5779486, 0.06663788, 0.7888685, 0.4117647, 0, 1, 1,
0.5806268, 0.3149929, 1.818021, 0.4156863, 0, 1, 1,
0.5891025, -1.87783, 3.866797, 0.4235294, 0, 1, 1,
0.5894122, -0.8300133, 1.585903, 0.427451, 0, 1, 1,
0.5920849, -0.2680565, 1.156286, 0.4352941, 0, 1, 1,
0.5921259, -0.04648811, 3.616519, 0.4392157, 0, 1, 1,
0.5968836, -0.4377954, 1.284579, 0.4470588, 0, 1, 1,
0.599017, -0.9908881, 3.303917, 0.4509804, 0, 1, 1,
0.6034076, 0.2573373, 1.51884, 0.4588235, 0, 1, 1,
0.6091279, -0.4310323, 0.5785644, 0.4627451, 0, 1, 1,
0.6133254, 1.483325, 1.05301, 0.4705882, 0, 1, 1,
0.6147649, 0.774193, 1.693325, 0.4745098, 0, 1, 1,
0.6182919, 1.054848, -0.2532996, 0.4823529, 0, 1, 1,
0.6196819, -0.07162407, 1.605573, 0.4862745, 0, 1, 1,
0.6209601, 0.5763358, -0.1736635, 0.4941176, 0, 1, 1,
0.6224994, -1.34099, 2.371288, 0.5019608, 0, 1, 1,
0.623143, -1.581724, 3.537661, 0.5058824, 0, 1, 1,
0.6314461, 1.413528, 2.308833, 0.5137255, 0, 1, 1,
0.6321411, -1.804829, 0.7739764, 0.5176471, 0, 1, 1,
0.6375465, 0.0197129, 1.49975, 0.5254902, 0, 1, 1,
0.6445451, -0.1922459, -1.593001, 0.5294118, 0, 1, 1,
0.645977, -0.0765369, 1.461195, 0.5372549, 0, 1, 1,
0.6465773, -1.055176, 2.525564, 0.5411765, 0, 1, 1,
0.6473587, -2.545147, 2.207668, 0.5490196, 0, 1, 1,
0.6520098, -0.2366755, 0.7267381, 0.5529412, 0, 1, 1,
0.6544077, -1.383879, 1.287839, 0.5607843, 0, 1, 1,
0.6557965, -2.352971, 3.928991, 0.5647059, 0, 1, 1,
0.656027, 0.1272218, 1.619063, 0.572549, 0, 1, 1,
0.6586342, -0.7180176, 3.525758, 0.5764706, 0, 1, 1,
0.6662677, 0.8031116, 0.4213651, 0.5843138, 0, 1, 1,
0.6680772, 0.6869947, 2.454129, 0.5882353, 0, 1, 1,
0.6851315, 1.419482, 1.638317, 0.5960785, 0, 1, 1,
0.686422, 1.822139, -0.4613978, 0.6039216, 0, 1, 1,
0.6867005, -0.0154263, 2.600016, 0.6078432, 0, 1, 1,
0.6887723, -0.5413984, 3.434283, 0.6156863, 0, 1, 1,
0.7003399, -0.07616629, 2.622046, 0.6196079, 0, 1, 1,
0.7005881, -1.601215, 3.622973, 0.627451, 0, 1, 1,
0.702721, -1.23756, 5.20834, 0.6313726, 0, 1, 1,
0.7075184, -1.533934, 2.796305, 0.6392157, 0, 1, 1,
0.7115573, -0.1521234, 2.701649, 0.6431373, 0, 1, 1,
0.7131628, -1.92598, 1.930684, 0.6509804, 0, 1, 1,
0.7196571, 0.186861, 1.67997, 0.654902, 0, 1, 1,
0.7203888, 2.846686, 3.033761, 0.6627451, 0, 1, 1,
0.7264704, 0.6053348, 1.210331, 0.6666667, 0, 1, 1,
0.7277848, 0.8430272, -0.1296951, 0.6745098, 0, 1, 1,
0.7278897, -1.576357, 3.875054, 0.6784314, 0, 1, 1,
0.7315685, 0.8422973, 0.9310313, 0.6862745, 0, 1, 1,
0.7326608, -1.079842, 0.1936266, 0.6901961, 0, 1, 1,
0.7407362, -0.6771144, 3.425211, 0.6980392, 0, 1, 1,
0.748653, 1.406918, -0.9060748, 0.7058824, 0, 1, 1,
0.7535036, -1.31771, 2.428045, 0.7098039, 0, 1, 1,
0.7543607, -1.254227, 2.940091, 0.7176471, 0, 1, 1,
0.7590834, -2.343898, 3.853493, 0.7215686, 0, 1, 1,
0.7645522, 0.241705, 1.907873, 0.7294118, 0, 1, 1,
0.7731031, 0.2246327, 1.911153, 0.7333333, 0, 1, 1,
0.7745226, 1.052156, -0.4128178, 0.7411765, 0, 1, 1,
0.7802743, -1.436606, 3.376941, 0.7450981, 0, 1, 1,
0.7822549, 0.4673409, 0.1202258, 0.7529412, 0, 1, 1,
0.7868722, -1.320504, 2.389682, 0.7568628, 0, 1, 1,
0.7885307, -1.635378, 3.839555, 0.7647059, 0, 1, 1,
0.7947553, -0.4518648, 0.8239502, 0.7686275, 0, 1, 1,
0.8030486, -0.7064646, 3.931569, 0.7764706, 0, 1, 1,
0.8041011, 0.6879289, -0.4350416, 0.7803922, 0, 1, 1,
0.8063709, 0.5148544, 0.91724, 0.7882353, 0, 1, 1,
0.8146258, -0.6923305, 3.14422, 0.7921569, 0, 1, 1,
0.8194966, -1.106896, 2.921667, 0.8, 0, 1, 1,
0.8231336, -0.1062539, 1.800709, 0.8078431, 0, 1, 1,
0.82488, 0.9999627, 1.099528, 0.8117647, 0, 1, 1,
0.8257451, -0.0002848955, 2.070505, 0.8196079, 0, 1, 1,
0.8282021, 0.008605383, 0.6803411, 0.8235294, 0, 1, 1,
0.8290518, -0.7231303, 3.48446, 0.8313726, 0, 1, 1,
0.8353871, 1.495348, 0.4596055, 0.8352941, 0, 1, 1,
0.8740062, -1.712345, 2.418258, 0.8431373, 0, 1, 1,
0.876679, -0.3034427, 1.607546, 0.8470588, 0, 1, 1,
0.8824095, 0.6493496, 0.480047, 0.854902, 0, 1, 1,
0.8884769, -0.9953985, 2.390996, 0.8588235, 0, 1, 1,
0.8942364, 0.5421447, 0.6744958, 0.8666667, 0, 1, 1,
0.8978838, -0.3729992, 0.9971439, 0.8705882, 0, 1, 1,
0.9028656, 0.9164224, 0.03085847, 0.8784314, 0, 1, 1,
0.905768, 0.8419551, 0.4979871, 0.8823529, 0, 1, 1,
0.9104895, -0.2716535, 1.137789, 0.8901961, 0, 1, 1,
0.911422, 0.8961802, 0.4874292, 0.8941177, 0, 1, 1,
0.9217771, 0.9715848, 1.695555, 0.9019608, 0, 1, 1,
0.9223469, -1.618274, 3.964667, 0.9098039, 0, 1, 1,
0.9350221, 0.6597686, 0.0473893, 0.9137255, 0, 1, 1,
0.9353818, -0.3026066, 1.897872, 0.9215686, 0, 1, 1,
0.9403009, -1.318191, 3.043053, 0.9254902, 0, 1, 1,
0.9475668, 0.2622146, 1.904351, 0.9333333, 0, 1, 1,
0.9553511, -0.3530323, 1.839313, 0.9372549, 0, 1, 1,
0.956058, -0.7479203, 1.193976, 0.945098, 0, 1, 1,
0.9586743, 0.02827314, 0.02303974, 0.9490196, 0, 1, 1,
0.9603549, 0.5527332, 0.3813318, 0.9568627, 0, 1, 1,
0.9726512, -1.552123, 4.09072, 0.9607843, 0, 1, 1,
0.9788289, -0.1889623, 1.713331, 0.9686275, 0, 1, 1,
0.9815035, 1.664522, 0.1006337, 0.972549, 0, 1, 1,
0.9832519, 1.864057, -0.3330121, 0.9803922, 0, 1, 1,
0.9890441, -0.2150929, 1.579116, 0.9843137, 0, 1, 1,
0.9945564, -1.347353, 1.959754, 0.9921569, 0, 1, 1,
1.006282, 0.1187841, -0.6408082, 0.9960784, 0, 1, 1,
1.008012, 0.02376735, 1.63956, 1, 0, 0.9960784, 1,
1.012076, 0.05075024, 1.628033, 1, 0, 0.9882353, 1,
1.013362, 0.2369707, 1.803035, 1, 0, 0.9843137, 1,
1.016589, 0.0532346, 1.385641, 1, 0, 0.9764706, 1,
1.017074, 0.4246302, 1.022556, 1, 0, 0.972549, 1,
1.017591, 0.7368221, -0.6488957, 1, 0, 0.9647059, 1,
1.021154, 1.179136, 0.5476334, 1, 0, 0.9607843, 1,
1.021974, 1.019996, 0.8236954, 1, 0, 0.9529412, 1,
1.022633, -0.9513298, 2.65254, 1, 0, 0.9490196, 1,
1.02933, -0.994793, 2.429515, 1, 0, 0.9411765, 1,
1.031185, 0.3286994, 0.8981632, 1, 0, 0.9372549, 1,
1.031596, -1.302698, 2.94227, 1, 0, 0.9294118, 1,
1.038651, 0.1474655, 1.944728, 1, 0, 0.9254902, 1,
1.040225, 1.743183, -0.8938888, 1, 0, 0.9176471, 1,
1.04278, -0.4139715, 1.822942, 1, 0, 0.9137255, 1,
1.050567, 0.2068665, 1.172415, 1, 0, 0.9058824, 1,
1.052878, -1.380447, 4.40139, 1, 0, 0.9019608, 1,
1.055545, -1.630236, 1.811394, 1, 0, 0.8941177, 1,
1.058505, -0.2902402, 1.427189, 1, 0, 0.8862745, 1,
1.05864, 2.023459, 0.9832684, 1, 0, 0.8823529, 1,
1.067819, -0.6137638, 0.7010088, 1, 0, 0.8745098, 1,
1.079064, -0.8719731, 2.812978, 1, 0, 0.8705882, 1,
1.088544, -1.214924, 2.713485, 1, 0, 0.8627451, 1,
1.089109, 1.177563, -0.9645802, 1, 0, 0.8588235, 1,
1.091469, -2.178882, 2.465161, 1, 0, 0.8509804, 1,
1.113852, -0.06352763, 3.006677, 1, 0, 0.8470588, 1,
1.119244, 0.3180313, 1.487731, 1, 0, 0.8392157, 1,
1.122858, 1.078692, 2.095475, 1, 0, 0.8352941, 1,
1.12673, 0.08343284, 1.821641, 1, 0, 0.827451, 1,
1.133817, -0.9300858, 1.22767, 1, 0, 0.8235294, 1,
1.14039, -4.156543, 2.864365, 1, 0, 0.8156863, 1,
1.141473, 0.05190095, 1.901187, 1, 0, 0.8117647, 1,
1.142543, -0.000709519, 0.685592, 1, 0, 0.8039216, 1,
1.143428, -1.469415, 1.339478, 1, 0, 0.7960784, 1,
1.144374, 0.2245976, 0.2076385, 1, 0, 0.7921569, 1,
1.148466, 1.366758, 0.9714869, 1, 0, 0.7843137, 1,
1.156325, -0.8268234, 3.78812, 1, 0, 0.7803922, 1,
1.162742, -0.7106712, 2.067429, 1, 0, 0.772549, 1,
1.176512, 1.498719, 0.7648535, 1, 0, 0.7686275, 1,
1.179145, -0.4173235, 2.919512, 1, 0, 0.7607843, 1,
1.180035, 1.543657, -0.05292045, 1, 0, 0.7568628, 1,
1.184486, 0.8495955, 1.732733, 1, 0, 0.7490196, 1,
1.185646, 0.07885947, 3.29964, 1, 0, 0.7450981, 1,
1.18885, -1.131379, 2.460897, 1, 0, 0.7372549, 1,
1.195861, -0.3894133, 1.421132, 1, 0, 0.7333333, 1,
1.196077, -1.668289, 3.643915, 1, 0, 0.7254902, 1,
1.200147, 0.354892, 1.543122, 1, 0, 0.7215686, 1,
1.200708, 1.088581, 0.9201557, 1, 0, 0.7137255, 1,
1.202281, 0.0993406, 1.285796, 1, 0, 0.7098039, 1,
1.204124, 0.8577508, 0.2899524, 1, 0, 0.7019608, 1,
1.214494, -1.377505, 1.511704, 1, 0, 0.6941177, 1,
1.215164, -0.4053888, -0.01612553, 1, 0, 0.6901961, 1,
1.216559, 0.3374392, 0.3768241, 1, 0, 0.682353, 1,
1.223132, 0.5951495, 1.68789, 1, 0, 0.6784314, 1,
1.228162, -0.9684149, 3.749473, 1, 0, 0.6705883, 1,
1.230855, -0.6150423, 2.474342, 1, 0, 0.6666667, 1,
1.2333, -2.327489, 3.152653, 1, 0, 0.6588235, 1,
1.236197, -0.03093185, 1.038452, 1, 0, 0.654902, 1,
1.246318, -1.238475, 1.666133, 1, 0, 0.6470588, 1,
1.248036, -0.3462189, 2.964453, 1, 0, 0.6431373, 1,
1.251042, -0.7463138, 1.241249, 1, 0, 0.6352941, 1,
1.253566, 0.5203513, 0.8981445, 1, 0, 0.6313726, 1,
1.256462, 0.8095001, 0.01613129, 1, 0, 0.6235294, 1,
1.26345, 2.037583, -2.272899, 1, 0, 0.6196079, 1,
1.26536, -1.157546, 2.806505, 1, 0, 0.6117647, 1,
1.275803, -0.7969114, 2.063025, 1, 0, 0.6078432, 1,
1.291998, -1.058322, 0.5373045, 1, 0, 0.6, 1,
1.298451, -1.579196, 3.563292, 1, 0, 0.5921569, 1,
1.300963, -1.741955, 1.951182, 1, 0, 0.5882353, 1,
1.30334, 0.1367367, 1.240476, 1, 0, 0.5803922, 1,
1.303775, 0.8258575, 1.98188, 1, 0, 0.5764706, 1,
1.30389, 0.8991224, 0.5338098, 1, 0, 0.5686275, 1,
1.30514, -1.335334, 1.77543, 1, 0, 0.5647059, 1,
1.320061, -0.708096, 0.8318697, 1, 0, 0.5568628, 1,
1.345357, -1.616024, 1.762059, 1, 0, 0.5529412, 1,
1.351771, -0.8176292, 2.877726, 1, 0, 0.5450981, 1,
1.354373, -0.9539253, 2.943867, 1, 0, 0.5411765, 1,
1.357338, 1.624493, 1.289888, 1, 0, 0.5333334, 1,
1.366348, 0.2067999, 0.8684537, 1, 0, 0.5294118, 1,
1.369624, 1.040207, 0.9211776, 1, 0, 0.5215687, 1,
1.377391, -0.8399485, 2.5682, 1, 0, 0.5176471, 1,
1.379628, -0.1337329, 2.636883, 1, 0, 0.509804, 1,
1.388326, 0.4618506, -0.1182775, 1, 0, 0.5058824, 1,
1.395686, 0.9284121, 0.4843683, 1, 0, 0.4980392, 1,
1.424402, 0.3576978, 1.761929, 1, 0, 0.4901961, 1,
1.427019, 0.2212456, 1.630917, 1, 0, 0.4862745, 1,
1.444013, 0.2515043, 0.7312571, 1, 0, 0.4784314, 1,
1.446237, -0.7070359, 2.786822, 1, 0, 0.4745098, 1,
1.453562, 0.7436236, 2.734583, 1, 0, 0.4666667, 1,
1.463985, 0.03460068, 2.444345, 1, 0, 0.4627451, 1,
1.470089, 0.4117591, 0.3508448, 1, 0, 0.454902, 1,
1.474491, -0.2514029, 0.7709791, 1, 0, 0.4509804, 1,
1.47701, -1.686074, 2.671006, 1, 0, 0.4431373, 1,
1.477342, -0.7921396, 1.099182, 1, 0, 0.4392157, 1,
1.491675, -0.6135419, 1.802572, 1, 0, 0.4313726, 1,
1.499621, 0.5147086, 1.734102, 1, 0, 0.427451, 1,
1.501233, -0.1735638, 2.411687, 1, 0, 0.4196078, 1,
1.515025, 0.2659714, 3.326907, 1, 0, 0.4156863, 1,
1.528393, -0.6943859, 1.524666, 1, 0, 0.4078431, 1,
1.533109, -0.2093691, 1.867439, 1, 0, 0.4039216, 1,
1.548657, -0.4572304, 0.7917932, 1, 0, 0.3960784, 1,
1.559855, 0.306807, 2.280023, 1, 0, 0.3882353, 1,
1.566254, -0.741448, 2.310386, 1, 0, 0.3843137, 1,
1.569745, 0.7781895, 0.9454718, 1, 0, 0.3764706, 1,
1.576903, 0.1821773, 2.784179, 1, 0, 0.372549, 1,
1.579493, -2.068807, 3.847648, 1, 0, 0.3647059, 1,
1.580008, 0.3906735, 1.541577, 1, 0, 0.3607843, 1,
1.580589, 0.7057161, 2.112001, 1, 0, 0.3529412, 1,
1.580881, -0.08378117, 0.9400045, 1, 0, 0.3490196, 1,
1.602144, 0.9675156, 0.411183, 1, 0, 0.3411765, 1,
1.605355, 1.148211, 1.009625, 1, 0, 0.3372549, 1,
1.609873, 0.4234197, 0.8722765, 1, 0, 0.3294118, 1,
1.612206, 0.7330288, -0.314314, 1, 0, 0.3254902, 1,
1.629274, -0.9279875, 1.689875, 1, 0, 0.3176471, 1,
1.631882, -0.7812515, 2.358129, 1, 0, 0.3137255, 1,
1.672398, 0.2521604, 1.711097, 1, 0, 0.3058824, 1,
1.691836, -0.8827158, 1.916039, 1, 0, 0.2980392, 1,
1.693635, -0.4970039, 2.17665, 1, 0, 0.2941177, 1,
1.698432, 0.2333852, 1.84933, 1, 0, 0.2862745, 1,
1.699961, 0.09234793, 1.865827, 1, 0, 0.282353, 1,
1.702524, -0.3249519, 1.679503, 1, 0, 0.2745098, 1,
1.739283, 0.8483284, 3.633317, 1, 0, 0.2705882, 1,
1.754987, -0.4926694, 1.106874, 1, 0, 0.2627451, 1,
1.781062, -0.3987176, 0.8140932, 1, 0, 0.2588235, 1,
1.784627, -0.1667358, 2.377537, 1, 0, 0.2509804, 1,
1.830077, 1.370961, 3.276096, 1, 0, 0.2470588, 1,
1.842696, -0.3159579, 0.9270438, 1, 0, 0.2392157, 1,
1.847715, -1.264344, 3.193628, 1, 0, 0.2352941, 1,
1.859499, -0.9087064, 2.064574, 1, 0, 0.227451, 1,
1.860984, -0.8941329, 1.117687, 1, 0, 0.2235294, 1,
1.865539, -1.328044, 2.155951, 1, 0, 0.2156863, 1,
1.872889, 0.4991982, 2.277425, 1, 0, 0.2117647, 1,
1.873809, -0.6056792, 0.6668718, 1, 0, 0.2039216, 1,
1.876417, -1.25714, 2.055647, 1, 0, 0.1960784, 1,
1.893169, -0.2741071, 1.438101, 1, 0, 0.1921569, 1,
1.893444, -0.2369092, 1.244144, 1, 0, 0.1843137, 1,
1.897805, -0.04520531, 3.906214, 1, 0, 0.1803922, 1,
1.904577, 0.2192935, 2.042676, 1, 0, 0.172549, 1,
1.917422, 1.299789, 0.9031758, 1, 0, 0.1686275, 1,
1.917566, -1.483468, 1.283827, 1, 0, 0.1607843, 1,
1.920075, -2.022001, 1.906152, 1, 0, 0.1568628, 1,
1.928885, -0.1846458, 1.670306, 1, 0, 0.1490196, 1,
1.947656, 0.167393, 2.041878, 1, 0, 0.145098, 1,
1.951007, -0.167766, -0.1195126, 1, 0, 0.1372549, 1,
1.964474, 0.1053219, 1.525763, 1, 0, 0.1333333, 1,
2.014172, 0.302141, 3.211263, 1, 0, 0.1254902, 1,
2.014719, 1.54539, 1.107865, 1, 0, 0.1215686, 1,
2.023755, -1.337461, 3.403844, 1, 0, 0.1137255, 1,
2.072579, 0.7251195, 1.543819, 1, 0, 0.1098039, 1,
2.1014, 0.2122811, 1.184443, 1, 0, 0.1019608, 1,
2.14906, -0.5133566, 1.528202, 1, 0, 0.09411765, 1,
2.22576, -2.064014, 2.913514, 1, 0, 0.09019608, 1,
2.226588, -0.3431177, 2.312417, 1, 0, 0.08235294, 1,
2.287762, -1.24269, 1.798864, 1, 0, 0.07843138, 1,
2.290649, 0.4050122, 1.377663, 1, 0, 0.07058824, 1,
2.379325, -0.4480282, 0.3709325, 1, 0, 0.06666667, 1,
2.386347, -0.6786003, 1.038022, 1, 0, 0.05882353, 1,
2.386888, -1.748321, 1.413025, 1, 0, 0.05490196, 1,
2.424209, -0.476211, 1.625151, 1, 0, 0.04705882, 1,
2.505438, 0.1531262, 1.36218, 1, 0, 0.04313726, 1,
2.52817, 0.2156307, 1.32069, 1, 0, 0.03529412, 1,
2.540849, 0.02831462, 3.643837, 1, 0, 0.03137255, 1,
2.789132, -0.09657106, 2.308177, 1, 0, 0.02352941, 1,
2.955971, 0.9424414, 1.669109, 1, 0, 0.01960784, 1,
3.238523, 0.5925394, 1.770224, 1, 0, 0.01176471, 1,
3.238634, -1.192239, 0.8606619, 1, 0, 0.007843138, 1
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
0.04332602, -5.432499, -7.554633, 0, -0.5, 0.5, 0.5,
0.04332602, -5.432499, -7.554633, 1, -0.5, 0.5, 0.5,
0.04332602, -5.432499, -7.554633, 1, 1.5, 0.5, 0.5,
0.04332602, -5.432499, -7.554633, 0, 1.5, 0.5, 0.5
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
-4.235191, -0.3926594, -7.554633, 0, -0.5, 0.5, 0.5,
-4.235191, -0.3926594, -7.554633, 1, -0.5, 0.5, 0.5,
-4.235191, -0.3926594, -7.554633, 1, 1.5, 0.5, 0.5,
-4.235191, -0.3926594, -7.554633, 0, 1.5, 0.5, 0.5
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
-4.235191, -5.432499, -0.2307076, 0, -0.5, 0.5, 0.5,
-4.235191, -5.432499, -0.2307076, 1, -0.5, 0.5, 0.5,
-4.235191, -5.432499, -0.2307076, 1, 1.5, 0.5, 0.5,
-4.235191, -5.432499, -0.2307076, 0, 1.5, 0.5, 0.5
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
-3, -4.269459, -5.864496,
3, -4.269459, -5.864496,
-3, -4.269459, -5.864496,
-3, -4.463299, -6.146185,
-2, -4.269459, -5.864496,
-2, -4.463299, -6.146185,
-1, -4.269459, -5.864496,
-1, -4.463299, -6.146185,
0, -4.269459, -5.864496,
0, -4.463299, -6.146185,
1, -4.269459, -5.864496,
1, -4.463299, -6.146185,
2, -4.269459, -5.864496,
2, -4.463299, -6.146185,
3, -4.269459, -5.864496,
3, -4.463299, -6.146185
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
-3, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
-3, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
-3, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
-3, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5,
-2, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
-2, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
-2, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
-2, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5,
-1, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
-1, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
-1, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
-1, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5,
0, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
0, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
0, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
0, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5,
1, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
1, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
1, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
1, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5,
2, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
2, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
2, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
2, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5,
3, -4.850979, -6.709564, 0, -0.5, 0.5, 0.5,
3, -4.850979, -6.709564, 1, -0.5, 0.5, 0.5,
3, -4.850979, -6.709564, 1, 1.5, 0.5, 0.5,
3, -4.850979, -6.709564, 0, 1.5, 0.5, 0.5
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
-3.247841, -4, -5.864496,
-3.247841, 2, -5.864496,
-3.247841, -4, -5.864496,
-3.4124, -4, -6.146185,
-3.247841, -2, -5.864496,
-3.4124, -2, -6.146185,
-3.247841, 0, -5.864496,
-3.4124, 0, -6.146185,
-3.247841, 2, -5.864496,
-3.4124, 2, -6.146185
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
-3.741516, -4, -6.709564, 0, -0.5, 0.5, 0.5,
-3.741516, -4, -6.709564, 1, -0.5, 0.5, 0.5,
-3.741516, -4, -6.709564, 1, 1.5, 0.5, 0.5,
-3.741516, -4, -6.709564, 0, 1.5, 0.5, 0.5,
-3.741516, -2, -6.709564, 0, -0.5, 0.5, 0.5,
-3.741516, -2, -6.709564, 1, -0.5, 0.5, 0.5,
-3.741516, -2, -6.709564, 1, 1.5, 0.5, 0.5,
-3.741516, -2, -6.709564, 0, 1.5, 0.5, 0.5,
-3.741516, 0, -6.709564, 0, -0.5, 0.5, 0.5,
-3.741516, 0, -6.709564, 1, -0.5, 0.5, 0.5,
-3.741516, 0, -6.709564, 1, 1.5, 0.5, 0.5,
-3.741516, 0, -6.709564, 0, 1.5, 0.5, 0.5,
-3.741516, 2, -6.709564, 0, -0.5, 0.5, 0.5,
-3.741516, 2, -6.709564, 1, -0.5, 0.5, 0.5,
-3.741516, 2, -6.709564, 1, 1.5, 0.5, 0.5,
-3.741516, 2, -6.709564, 0, 1.5, 0.5, 0.5
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
-3.247841, -4.269459, -4,
-3.247841, -4.269459, 4,
-3.247841, -4.269459, -4,
-3.4124, -4.463299, -4,
-3.247841, -4.269459, -2,
-3.4124, -4.463299, -2,
-3.247841, -4.269459, 0,
-3.4124, -4.463299, 0,
-3.247841, -4.269459, 2,
-3.4124, -4.463299, 2,
-3.247841, -4.269459, 4,
-3.4124, -4.463299, 4
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
-3.741516, -4.850979, -4, 0, -0.5, 0.5, 0.5,
-3.741516, -4.850979, -4, 1, -0.5, 0.5, 0.5,
-3.741516, -4.850979, -4, 1, 1.5, 0.5, 0.5,
-3.741516, -4.850979, -4, 0, 1.5, 0.5, 0.5,
-3.741516, -4.850979, -2, 0, -0.5, 0.5, 0.5,
-3.741516, -4.850979, -2, 1, -0.5, 0.5, 0.5,
-3.741516, -4.850979, -2, 1, 1.5, 0.5, 0.5,
-3.741516, -4.850979, -2, 0, 1.5, 0.5, 0.5,
-3.741516, -4.850979, 0, 0, -0.5, 0.5, 0.5,
-3.741516, -4.850979, 0, 1, -0.5, 0.5, 0.5,
-3.741516, -4.850979, 0, 1, 1.5, 0.5, 0.5,
-3.741516, -4.850979, 0, 0, 1.5, 0.5, 0.5,
-3.741516, -4.850979, 2, 0, -0.5, 0.5, 0.5,
-3.741516, -4.850979, 2, 1, -0.5, 0.5, 0.5,
-3.741516, -4.850979, 2, 1, 1.5, 0.5, 0.5,
-3.741516, -4.850979, 2, 0, 1.5, 0.5, 0.5,
-3.741516, -4.850979, 4, 0, -0.5, 0.5, 0.5,
-3.741516, -4.850979, 4, 1, -0.5, 0.5, 0.5,
-3.741516, -4.850979, 4, 1, 1.5, 0.5, 0.5,
-3.741516, -4.850979, 4, 0, 1.5, 0.5, 0.5
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
-3.247841, -4.269459, -5.864496,
-3.247841, 3.48414, -5.864496,
-3.247841, -4.269459, 5.403081,
-3.247841, 3.48414, 5.403081,
-3.247841, -4.269459, -5.864496,
-3.247841, -4.269459, 5.403081,
-3.247841, 3.48414, -5.864496,
-3.247841, 3.48414, 5.403081,
-3.247841, -4.269459, -5.864496,
3.334493, -4.269459, -5.864496,
-3.247841, -4.269459, 5.403081,
3.334493, -4.269459, 5.403081,
-3.247841, 3.48414, -5.864496,
3.334493, 3.48414, -5.864496,
-3.247841, 3.48414, 5.403081,
3.334493, 3.48414, 5.403081,
3.334493, -4.269459, -5.864496,
3.334493, 3.48414, -5.864496,
3.334493, -4.269459, 5.403081,
3.334493, 3.48414, 5.403081,
3.334493, -4.269459, -5.864496,
3.334493, -4.269459, 5.403081,
3.334493, 3.48414, -5.864496,
3.334493, 3.48414, 5.403081
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
var radius = 8.105321;
var distance = 36.06149;
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
mvMatrix.translate( -0.04332602, 0.3926594, 0.2307076 );
mvMatrix.scale( 1.331387, 1.130266, 0.7777743 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.06149);
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
phenthoate<-read.table("phenthoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenthoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenthoate' not found
```

```r
y<-phenthoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenthoate' not found
```

```r
z<-phenthoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenthoate' not found
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
-3.151982, -0.9278456, -1.892224, 0, 0, 1, 1, 1,
-3.06938, -1.368668, -3.195816, 1, 0, 0, 1, 1,
-2.613297, 0.3720987, -1.716976, 1, 0, 0, 1, 1,
-2.467335, 0.2196954, -0.5217623, 1, 0, 0, 1, 1,
-2.460902, 0.6878814, -1.132673, 1, 0, 0, 1, 1,
-2.450574, 0.6506123, -2.640472, 1, 0, 0, 1, 1,
-2.448224, -0.3272166, -2.521669, 0, 0, 0, 1, 1,
-2.268419, -1.535794, -2.957059, 0, 0, 0, 1, 1,
-2.248302, 1.843771, -1.652891, 0, 0, 0, 1, 1,
-2.227017, 0.2015971, -1.02185, 0, 0, 0, 1, 1,
-2.209211, -1.726129, -4.348276, 0, 0, 0, 1, 1,
-2.203156, -0.7383037, -2.597926, 0, 0, 0, 1, 1,
-2.190274, -0.740694, -0.3096903, 0, 0, 0, 1, 1,
-2.183543, 1.901384, -0.1178422, 1, 1, 1, 1, 1,
-2.170151, 0.1355327, -0.8088009, 1, 1, 1, 1, 1,
-2.165203, -0.8610712, -1.419078, 1, 1, 1, 1, 1,
-2.09983, -0.2839935, -3.622852, 1, 1, 1, 1, 1,
-2.099642, -0.4668512, -0.5850498, 1, 1, 1, 1, 1,
-2.060142, -1.196409, -2.199248, 1, 1, 1, 1, 1,
-2.02902, 1.557441, -0.8987073, 1, 1, 1, 1, 1,
-2.015089, -0.3611867, 0.24788, 1, 1, 1, 1, 1,
-1.975968, 1.965094, -0.553634, 1, 1, 1, 1, 1,
-1.922524, -0.04219665, -3.16948, 1, 1, 1, 1, 1,
-1.922166, -0.1963664, -1.200366, 1, 1, 1, 1, 1,
-1.917755, 0.4479031, -0.3424991, 1, 1, 1, 1, 1,
-1.909891, 0.9235075, -1.197287, 1, 1, 1, 1, 1,
-1.897813, -0.9402134, -1.734555, 1, 1, 1, 1, 1,
-1.89454, 1.368298, -0.3430475, 1, 1, 1, 1, 1,
-1.890649, -0.6766521, -3.069906, 0, 0, 1, 1, 1,
-1.878682, -0.334946, -3.373493, 1, 0, 0, 1, 1,
-1.876258, 0.472556, -3.187476, 1, 0, 0, 1, 1,
-1.870735, -0.3301522, -1.754836, 1, 0, 0, 1, 1,
-1.868208, -1.122947, -2.144561, 1, 0, 0, 1, 1,
-1.867074, -2.022066, -2.111883, 1, 0, 0, 1, 1,
-1.85429, 0.5250632, -1.603492, 0, 0, 0, 1, 1,
-1.833889, -2.589156, -2.601381, 0, 0, 0, 1, 1,
-1.817136, 1.298956, 1.065575, 0, 0, 0, 1, 1,
-1.811649, -1.354888, -2.536663, 0, 0, 0, 1, 1,
-1.804249, 1.708487, 0.9672164, 0, 0, 0, 1, 1,
-1.77524, 1.013703, 0.2510495, 0, 0, 0, 1, 1,
-1.759706, 0.4401906, 0.4470237, 0, 0, 0, 1, 1,
-1.711439, -0.3626013, -2.516068, 1, 1, 1, 1, 1,
-1.711066, 2.089727, 0.1785377, 1, 1, 1, 1, 1,
-1.697223, 0.4241531, 1.228206, 1, 1, 1, 1, 1,
-1.680724, 2.003715, 0.0165581, 1, 1, 1, 1, 1,
-1.679446, -0.3015741, -0.3066672, 1, 1, 1, 1, 1,
-1.679087, -0.8733293, -1.696614, 1, 1, 1, 1, 1,
-1.665546, -0.3019991, -0.4847117, 1, 1, 1, 1, 1,
-1.6626, -0.5468163, -2.724902, 1, 1, 1, 1, 1,
-1.649472, 0.7411219, -1.298443, 1, 1, 1, 1, 1,
-1.649445, 1.411589, 0.3569931, 1, 1, 1, 1, 1,
-1.630213, -1.672918, -1.92629, 1, 1, 1, 1, 1,
-1.629763, -0.1742725, -0.91703, 1, 1, 1, 1, 1,
-1.628, 0.5014085, 0.1618403, 1, 1, 1, 1, 1,
-1.601611, -0.6896026, -2.556082, 1, 1, 1, 1, 1,
-1.592284, 1.106905, -2.118543, 1, 1, 1, 1, 1,
-1.582716, 0.2074149, -0.8935863, 0, 0, 1, 1, 1,
-1.573236, -2.061765, -2.485529, 1, 0, 0, 1, 1,
-1.572545, 0.5808589, -2.149023, 1, 0, 0, 1, 1,
-1.547856, -0.3063551, -2.203301, 1, 0, 0, 1, 1,
-1.540199, -0.253311, 1.057754, 1, 0, 0, 1, 1,
-1.537103, -0.4606037, -2.93384, 1, 0, 0, 1, 1,
-1.525026, -0.3489872, -2.070129, 0, 0, 0, 1, 1,
-1.523704, 0.6917047, -0.8565735, 0, 0, 0, 1, 1,
-1.521863, -1.138967, -2.397426, 0, 0, 0, 1, 1,
-1.519164, -0.08209543, -0.8732525, 0, 0, 0, 1, 1,
-1.517531, 0.5351996, -0.4392372, 0, 0, 0, 1, 1,
-1.504416, 0.6468115, -0.3827606, 0, 0, 0, 1, 1,
-1.499724, 0.8163987, 0.1999376, 0, 0, 0, 1, 1,
-1.495057, 0.07236172, -0.9500571, 1, 1, 1, 1, 1,
-1.491875, -1.675741, -1.702937, 1, 1, 1, 1, 1,
-1.481098, -0.9204247, -2.083657, 1, 1, 1, 1, 1,
-1.478588, -0.3806869, -2.684862, 1, 1, 1, 1, 1,
-1.474729, -1.291226, -2.241118, 1, 1, 1, 1, 1,
-1.45522, 0.7402416, 0.4068345, 1, 1, 1, 1, 1,
-1.453206, 0.1434719, 0.0295337, 1, 1, 1, 1, 1,
-1.43077, -0.4248616, -3.0899, 1, 1, 1, 1, 1,
-1.430349, 0.3419312, -2.012195, 1, 1, 1, 1, 1,
-1.42523, 0.01798946, -3.625224, 1, 1, 1, 1, 1,
-1.398352, 0.7835154, 0.5282506, 1, 1, 1, 1, 1,
-1.394321, 0.302493, -1.369035, 1, 1, 1, 1, 1,
-1.391912, -0.6645466, -0.4919806, 1, 1, 1, 1, 1,
-1.391281, 1.165937, -1.87445, 1, 1, 1, 1, 1,
-1.366884, -0.7266003, -2.493429, 1, 1, 1, 1, 1,
-1.364867, -0.4203913, -1.893093, 0, 0, 1, 1, 1,
-1.357593, -0.9226844, -2.939377, 1, 0, 0, 1, 1,
-1.357305, 1.317704, -0.01926967, 1, 0, 0, 1, 1,
-1.356756, -2.785314, -3.052298, 1, 0, 0, 1, 1,
-1.350297, -1.968728, -2.060076, 1, 0, 0, 1, 1,
-1.340841, 1.280804, -1.91065, 1, 0, 0, 1, 1,
-1.337581, 1.525957, 0.5511206, 0, 0, 0, 1, 1,
-1.332347, 0.8352582, -0.2793232, 0, 0, 0, 1, 1,
-1.314859, -0.08598802, 0.1539923, 0, 0, 0, 1, 1,
-1.313771, -1.490887, -4.711092, 0, 0, 0, 1, 1,
-1.313654, -1.71995, -1.473284, 0, 0, 0, 1, 1,
-1.303163, -0.6165702, -1.430931, 0, 0, 0, 1, 1,
-1.300418, -2.175577, -3.080133, 0, 0, 0, 1, 1,
-1.299865, 0.44692, -1.460287, 1, 1, 1, 1, 1,
-1.296598, 0.5247615, -2.112892, 1, 1, 1, 1, 1,
-1.291919, 0.7903991, 0.002798191, 1, 1, 1, 1, 1,
-1.286158, -0.4524752, -2.541695, 1, 1, 1, 1, 1,
-1.276608, 0.1062841, -2.654685, 1, 1, 1, 1, 1,
-1.275906, 0.6284983, -1.661403, 1, 1, 1, 1, 1,
-1.273531, -0.5029845, -0.2799063, 1, 1, 1, 1, 1,
-1.261719, 0.440432, -0.2042423, 1, 1, 1, 1, 1,
-1.260437, -1.797753, -1.683493, 1, 1, 1, 1, 1,
-1.250701, -0.07837948, -2.251967, 1, 1, 1, 1, 1,
-1.248733, -2.080914, -1.660706, 1, 1, 1, 1, 1,
-1.24607, 1.84319, -0.4471695, 1, 1, 1, 1, 1,
-1.242022, 1.407703, -0.9781616, 1, 1, 1, 1, 1,
-1.228858, -1.177473, -2.142845, 1, 1, 1, 1, 1,
-1.226998, 0.8249115, -0.8901534, 1, 1, 1, 1, 1,
-1.224207, -1.522651, -2.447043, 0, 0, 1, 1, 1,
-1.212279, -0.7444521, -0.9335408, 1, 0, 0, 1, 1,
-1.211156, 0.2383087, -1.056624, 1, 0, 0, 1, 1,
-1.208891, -0.009017007, -2.016108, 1, 0, 0, 1, 1,
-1.208262, 0.3721133, -0.3942013, 1, 0, 0, 1, 1,
-1.207124, -0.2046098, -2.360675, 1, 0, 0, 1, 1,
-1.202794, -2.773815, -1.744535, 0, 0, 0, 1, 1,
-1.201369, -0.3907741, -2.706501, 0, 0, 0, 1, 1,
-1.198844, 1.58379, -1.257637, 0, 0, 0, 1, 1,
-1.195633, 0.6968457, -0.8368523, 0, 0, 0, 1, 1,
-1.194405, -1.649033, -3.633971, 0, 0, 0, 1, 1,
-1.18749, 1.234984, -1.538865, 0, 0, 0, 1, 1,
-1.176353, 1.422339, -0.171906, 0, 0, 0, 1, 1,
-1.171398, -1.184951, -2.640387, 1, 1, 1, 1, 1,
-1.170214, 0.1465203, -1.636499, 1, 1, 1, 1, 1,
-1.166223, -2.39165, -2.842952, 1, 1, 1, 1, 1,
-1.16109, -0.8836891, -3.049987, 1, 1, 1, 1, 1,
-1.160195, -0.3400034, -2.49869, 1, 1, 1, 1, 1,
-1.151081, 0.1490488, -0.3399237, 1, 1, 1, 1, 1,
-1.150924, 0.03329299, 0.4162424, 1, 1, 1, 1, 1,
-1.145614, -1.095594, -3.142496, 1, 1, 1, 1, 1,
-1.144209, 0.7091936, -0.4509651, 1, 1, 1, 1, 1,
-1.141007, -0.5398129, -0.9909344, 1, 1, 1, 1, 1,
-1.137546, -0.804736, -2.553041, 1, 1, 1, 1, 1,
-1.136711, -1.576586, -1.730556, 1, 1, 1, 1, 1,
-1.135221, 0.7330787, -0.4156803, 1, 1, 1, 1, 1,
-1.132494, 1.541774, 0.03650526, 1, 1, 1, 1, 1,
-1.12485, 0.5563787, -1.181373, 1, 1, 1, 1, 1,
-1.123878, -0.217649, -0.9279909, 0, 0, 1, 1, 1,
-1.120401, 0.7647578, 1.029203, 1, 0, 0, 1, 1,
-1.113342, -0.2609619, -2.293421, 1, 0, 0, 1, 1,
-1.105279, -0.8232977, -2.807137, 1, 0, 0, 1, 1,
-1.094593, 1.126236, -1.130471, 1, 0, 0, 1, 1,
-1.093863, -1.196702, -3.205375, 1, 0, 0, 1, 1,
-1.091911, 1.126439, -0.05171872, 0, 0, 0, 1, 1,
-1.090786, 0.592415, -2.12753, 0, 0, 0, 1, 1,
-1.089822, 0.5252579, -1.196218, 0, 0, 0, 1, 1,
-1.086974, 0.9812294, 0.1546217, 0, 0, 0, 1, 1,
-1.078077, 1.056596, 0.02609644, 0, 0, 0, 1, 1,
-1.074588, -1.375435, -4.438955, 0, 0, 0, 1, 1,
-1.072369, 1.197837, -1.102357, 0, 0, 0, 1, 1,
-1.070269, -0.1753282, -0.5432913, 1, 1, 1, 1, 1,
-1.068083, 0.6880319, -1.646852, 1, 1, 1, 1, 1,
-1.068035, -1.048558, -2.506152, 1, 1, 1, 1, 1,
-1.067074, -0.5183697, -1.443473, 1, 1, 1, 1, 1,
-1.063571, 1.80404, 0.9748247, 1, 1, 1, 1, 1,
-1.059453, 0.04953777, -2.561372, 1, 1, 1, 1, 1,
-1.055761, -0.3659622, -3.051044, 1, 1, 1, 1, 1,
-1.052865, 0.2832525, -0.7684956, 1, 1, 1, 1, 1,
-1.052168, -0.1971232, -1.241363, 1, 1, 1, 1, 1,
-1.040135, 0.9397786, -0.4740613, 1, 1, 1, 1, 1,
-1.040113, 1.511874, -0.2352128, 1, 1, 1, 1, 1,
-1.035614, 1.280193, -2.101845, 1, 1, 1, 1, 1,
-1.028957, -1.427745, -2.964411, 1, 1, 1, 1, 1,
-1.028225, 0.8727978, -1.321142, 1, 1, 1, 1, 1,
-1.02566, 0.5372644, -1.909162, 1, 1, 1, 1, 1,
-1.025341, 0.04264754, -0.522832, 0, 0, 1, 1, 1,
-1.019459, 0.3401862, -1.164183, 1, 0, 0, 1, 1,
-1.013165, -2.408147, -2.808299, 1, 0, 0, 1, 1,
-1.011754, -0.3421266, -0.2129623, 1, 0, 0, 1, 1,
-1.011693, -0.9247932, -3.058792, 1, 0, 0, 1, 1,
-1.009991, 0.3461359, -1.859592, 1, 0, 0, 1, 1,
-1.006089, 0.7997656, -1.016178, 0, 0, 0, 1, 1,
-1.005523, 0.3866622, -3.886093, 0, 0, 0, 1, 1,
-1.001352, 1.499056, -0.2453808, 0, 0, 0, 1, 1,
-0.9899096, 0.5202035, -1.339185, 0, 0, 0, 1, 1,
-0.9787925, 0.5521555, -2.417615, 0, 0, 0, 1, 1,
-0.9749814, -0.782387, -2.970001, 0, 0, 0, 1, 1,
-0.9742323, 0.121954, -0.1010062, 0, 0, 0, 1, 1,
-0.9729524, 0.1509073, -2.797451, 1, 1, 1, 1, 1,
-0.9610108, 1.297387, -1.300578, 1, 1, 1, 1, 1,
-0.9589508, 1.134382, 0.2665534, 1, 1, 1, 1, 1,
-0.9466171, -0.3052249, -1.568734, 1, 1, 1, 1, 1,
-0.945225, 0.1158482, -3.020783, 1, 1, 1, 1, 1,
-0.9438644, 1.145598, 0.180926, 1, 1, 1, 1, 1,
-0.9431072, -0.5211495, -2.008947, 1, 1, 1, 1, 1,
-0.9403514, -0.9067246, -2.383176, 1, 1, 1, 1, 1,
-0.9402137, 1.361536, -0.3474652, 1, 1, 1, 1, 1,
-0.9401745, -0.3661544, -5.700405, 1, 1, 1, 1, 1,
-0.9387605, 0.5459507, -2.824049, 1, 1, 1, 1, 1,
-0.9370469, -0.2295367, -2.454555, 1, 1, 1, 1, 1,
-0.9357767, 1.131923, -1.716313, 1, 1, 1, 1, 1,
-0.9354552, 0.8284585, 0.2939526, 1, 1, 1, 1, 1,
-0.9303828, 0.2200744, -1.015321, 1, 1, 1, 1, 1,
-0.925721, 1.299481, -1.946438, 0, 0, 1, 1, 1,
-0.9094411, 0.8833905, -1.16596, 1, 0, 0, 1, 1,
-0.9087156, -1.112043, -0.6306399, 1, 0, 0, 1, 1,
-0.9044899, -1.823874, -2.510215, 1, 0, 0, 1, 1,
-0.901565, -0.06630645, -2.481237, 1, 0, 0, 1, 1,
-0.8930682, -0.6028402, -3.38791, 1, 0, 0, 1, 1,
-0.8917455, -1.497453, -3.191302, 0, 0, 0, 1, 1,
-0.8866596, -0.213517, -3.852082, 0, 0, 0, 1, 1,
-0.8824359, -0.4498589, -2.607675, 0, 0, 0, 1, 1,
-0.8821493, -0.6215734, -0.9075275, 0, 0, 0, 1, 1,
-0.8730916, 1.103349, -0.3184604, 0, 0, 0, 1, 1,
-0.8690591, -0.2052019, -3.219188, 0, 0, 0, 1, 1,
-0.8683866, 0.09526035, -1.026855, 0, 0, 0, 1, 1,
-0.868214, -0.9602287, -2.958999, 1, 1, 1, 1, 1,
-0.8675128, 2.059695, 0.8992848, 1, 1, 1, 1, 1,
-0.8644025, -0.60993, -2.792592, 1, 1, 1, 1, 1,
-0.8629198, -0.3381725, -1.156786, 1, 1, 1, 1, 1,
-0.8623687, -0.322848, -0.9258152, 1, 1, 1, 1, 1,
-0.8537951, -0.5999442, -2.554201, 1, 1, 1, 1, 1,
-0.8537652, -1.083942, -1.867138, 1, 1, 1, 1, 1,
-0.8528305, -1.424544, -0.5028573, 1, 1, 1, 1, 1,
-0.8474141, -0.03749776, -1.014658, 1, 1, 1, 1, 1,
-0.8466689, -1.438828, -2.309399, 1, 1, 1, 1, 1,
-0.8405259, 0.896104, -3.663451, 1, 1, 1, 1, 1,
-0.8379769, -0.09088416, 0.063453, 1, 1, 1, 1, 1,
-0.8358104, 1.339133, -0.9260987, 1, 1, 1, 1, 1,
-0.8356085, -0.07543012, -0.7967917, 1, 1, 1, 1, 1,
-0.8339912, -0.4971603, -3.830614, 1, 1, 1, 1, 1,
-0.8300528, 0.253553, -0.3671424, 0, 0, 1, 1, 1,
-0.830042, -1.119297, -1.023272, 1, 0, 0, 1, 1,
-0.8286978, 0.2458993, -1.212506, 1, 0, 0, 1, 1,
-0.8279467, 0.6488333, -0.9981481, 1, 0, 0, 1, 1,
-0.8217974, -0.3427673, -1.54289, 1, 0, 0, 1, 1,
-0.8182055, -0.7585957, -2.8527, 1, 0, 0, 1, 1,
-0.8159487, 1.241456, 0.5641823, 0, 0, 0, 1, 1,
-0.8127752, 0.1073641, -0.3896797, 0, 0, 0, 1, 1,
-0.810156, 0.6222212, -2.216915, 0, 0, 0, 1, 1,
-0.8008035, -0.6366103, -2.637913, 0, 0, 0, 1, 1,
-0.7931986, -0.8053737, -2.855316, 0, 0, 0, 1, 1,
-0.7848935, -0.7755595, -4.164487, 0, 0, 0, 1, 1,
-0.7818463, -0.08772727, -2.100867, 0, 0, 0, 1, 1,
-0.776297, 0.8206748, 1.469185, 1, 1, 1, 1, 1,
-0.7725984, -0.3844869, -0.2995011, 1, 1, 1, 1, 1,
-0.7712536, 1.330562, -0.3997438, 1, 1, 1, 1, 1,
-0.7588055, -0.4219061, -3.671356, 1, 1, 1, 1, 1,
-0.7582142, -0.5991237, -2.915114, 1, 1, 1, 1, 1,
-0.756245, 0.3112136, -0.6941532, 1, 1, 1, 1, 1,
-0.7517697, 0.7273541, -0.2413284, 1, 1, 1, 1, 1,
-0.7468982, -0.8406131, -0.717779, 1, 1, 1, 1, 1,
-0.7459612, -0.9714849, -1.699771, 1, 1, 1, 1, 1,
-0.7440392, -1.185282, -1.994179, 1, 1, 1, 1, 1,
-0.7399682, 1.205109, -0.4984384, 1, 1, 1, 1, 1,
-0.7366548, -0.8665148, -1.541288, 1, 1, 1, 1, 1,
-0.7313446, -2.111558, -0.6517934, 1, 1, 1, 1, 1,
-0.7294973, -0.1904491, -0.9163296, 1, 1, 1, 1, 1,
-0.7271789, -0.4274709, -1.962948, 1, 1, 1, 1, 1,
-0.7261441, 1.528632, -0.260565, 0, 0, 1, 1, 1,
-0.7203737, -0.2826984, -0.4833608, 1, 0, 0, 1, 1,
-0.7193335, -1.615638, -4.455672, 1, 0, 0, 1, 1,
-0.719085, -0.5222368, -1.592561, 1, 0, 0, 1, 1,
-0.7146693, -1.763911, -2.542337, 1, 0, 0, 1, 1,
-0.7088615, 0.1215069, -2.298973, 1, 0, 0, 1, 1,
-0.7075363, 2.038562, -0.2144319, 0, 0, 0, 1, 1,
-0.7062676, 0.2130325, -1.856156, 0, 0, 0, 1, 1,
-0.7044418, -0.6381079, -2.80995, 0, 0, 0, 1, 1,
-0.7043763, -0.7343099, -2.192569, 0, 0, 0, 1, 1,
-0.6952729, 0.08452195, -2.48005, 0, 0, 0, 1, 1,
-0.6886762, -0.6591264, -2.986964, 0, 0, 0, 1, 1,
-0.6882161, -1.757405, -3.720617, 0, 0, 0, 1, 1,
-0.6875032, -1.132958, -0.8460494, 1, 1, 1, 1, 1,
-0.6867862, 2.237797, 0.1403214, 1, 1, 1, 1, 1,
-0.6847535, -0.5695745, -4.079713, 1, 1, 1, 1, 1,
-0.6776042, 0.4518105, -0.2358581, 1, 1, 1, 1, 1,
-0.6749716, -0.3158849, -3.210484, 1, 1, 1, 1, 1,
-0.674287, -0.1275139, -1.450934, 1, 1, 1, 1, 1,
-0.6723534, 0.61353, 0.1286193, 1, 1, 1, 1, 1,
-0.6702991, 0.6977949, -0.5538375, 1, 1, 1, 1, 1,
-0.6692138, 0.1901739, -0.9340275, 1, 1, 1, 1, 1,
-0.6631123, -0.3368417, -2.640938, 1, 1, 1, 1, 1,
-0.6617891, 0.5891047, -1.558119, 1, 1, 1, 1, 1,
-0.6572644, 1.790364, -0.7475895, 1, 1, 1, 1, 1,
-0.6568207, -1.203619, -4.33736, 1, 1, 1, 1, 1,
-0.654543, -1.284709, -2.821183, 1, 1, 1, 1, 1,
-0.647194, 0.9030729, -0.1225161, 1, 1, 1, 1, 1,
-0.6368591, -0.6695706, -3.819628, 0, 0, 1, 1, 1,
-0.6315061, -0.003318455, -2.156982, 1, 0, 0, 1, 1,
-0.6307082, 0.1833327, -1.317509, 1, 0, 0, 1, 1,
-0.6285012, -0.2400102, -2.353832, 1, 0, 0, 1, 1,
-0.6278799, 2.367038, 0.8528696, 1, 0, 0, 1, 1,
-0.6245081, -1.056853, -1.851414, 1, 0, 0, 1, 1,
-0.6212618, -0.1369946, -0.3339354, 0, 0, 0, 1, 1,
-0.6194395, -1.672884, -1.378996, 0, 0, 0, 1, 1,
-0.6177931, -0.3976296, -0.5076014, 0, 0, 0, 1, 1,
-0.6166053, -0.8340922, -3.670105, 0, 0, 0, 1, 1,
-0.6147336, -1.735394, -2.618624, 0, 0, 0, 1, 1,
-0.6142325, 0.6920211, -1.749138, 0, 0, 0, 1, 1,
-0.6133944, -0.7237986, -1.884109, 0, 0, 0, 1, 1,
-0.612966, 0.7044377, -1.862047, 1, 1, 1, 1, 1,
-0.6038833, 1.491623, -0.5666339, 1, 1, 1, 1, 1,
-0.6030286, -0.6621978, -3.383211, 1, 1, 1, 1, 1,
-0.6009293, -0.9403507, -2.128408, 1, 1, 1, 1, 1,
-0.5917911, 0.09433504, -1.677417, 1, 1, 1, 1, 1,
-0.5893465, 0.7064229, -1.282927, 1, 1, 1, 1, 1,
-0.5889354, 0.06761114, -0.9424683, 1, 1, 1, 1, 1,
-0.5878387, 0.7378886, -0.9952134, 1, 1, 1, 1, 1,
-0.5848928, 1.343826, 0.5099893, 1, 1, 1, 1, 1,
-0.5824624, -0.713494, -3.577546, 1, 1, 1, 1, 1,
-0.5817469, -1.374138, -3.158293, 1, 1, 1, 1, 1,
-0.5718539, 0.1017213, -0.002811266, 1, 1, 1, 1, 1,
-0.5669869, 0.582856, 0.07136846, 1, 1, 1, 1, 1,
-0.5660243, 0.6325845, -0.04328989, 1, 1, 1, 1, 1,
-0.5625446, 0.2743462, -0.9385045, 1, 1, 1, 1, 1,
-0.5597721, -1.462183, -2.516646, 0, 0, 1, 1, 1,
-0.5594229, 0.09966131, -2.562738, 1, 0, 0, 1, 1,
-0.5592493, 0.2976424, -1.724052, 1, 0, 0, 1, 1,
-0.5583866, -0.5734971, -3.588469, 1, 0, 0, 1, 1,
-0.5569854, 2.825423, -1.128786, 1, 0, 0, 1, 1,
-0.5514689, 0.8045208, -1.064571, 1, 0, 0, 1, 1,
-0.5498155, -0.0131974, -2.442204, 0, 0, 0, 1, 1,
-0.5486793, 1.667885, 0.4509141, 0, 0, 0, 1, 1,
-0.5481917, 0.1176966, -0.5633451, 0, 0, 0, 1, 1,
-0.5456775, 1.207946, -0.5336499, 0, 0, 0, 1, 1,
-0.5381992, 0.459453, 0.1915071, 0, 0, 0, 1, 1,
-0.5295196, -0.5366299, -2.807575, 0, 0, 0, 1, 1,
-0.5250732, 0.5755926, -0.6912089, 0, 0, 0, 1, 1,
-0.5228326, -0.004380563, -2.360861, 1, 1, 1, 1, 1,
-0.5188805, -0.4790883, -0.4385898, 1, 1, 1, 1, 1,
-0.5158931, -0.02473466, -2.042348, 1, 1, 1, 1, 1,
-0.5126284, 0.9944442, -1.096603, 1, 1, 1, 1, 1,
-0.5068099, -1.915103, -2.935901, 1, 1, 1, 1, 1,
-0.5039807, -0.03799856, -2.317886, 1, 1, 1, 1, 1,
-0.4997672, 0.533008, -1.003586, 1, 1, 1, 1, 1,
-0.4969441, -1.111589, -2.955894, 1, 1, 1, 1, 1,
-0.4967714, 0.7609191, 1.224686, 1, 1, 1, 1, 1,
-0.490591, -1.610415, -3.202629, 1, 1, 1, 1, 1,
-0.4889252, -0.3656072, -1.06139, 1, 1, 1, 1, 1,
-0.4868665, 0.490842, -0.823576, 1, 1, 1, 1, 1,
-0.4788625, -1.225815, -2.982243, 1, 1, 1, 1, 1,
-0.4747364, -1.883667, -2.057183, 1, 1, 1, 1, 1,
-0.4671295, -0.4040628, -3.011051, 1, 1, 1, 1, 1,
-0.467043, -0.2413671, -2.891732, 0, 0, 1, 1, 1,
-0.4629824, 0.5847145, -2.519616, 1, 0, 0, 1, 1,
-0.4619518, 1.077653, -0.9399344, 1, 0, 0, 1, 1,
-0.4547676, -0.09536988, -1.400321, 1, 0, 0, 1, 1,
-0.451704, -0.6255391, -1.330263, 1, 0, 0, 1, 1,
-0.4470174, -1.272644, -1.646568, 1, 0, 0, 1, 1,
-0.4442157, -0.007474998, -0.6575769, 0, 0, 0, 1, 1,
-0.4404842, -2.541156, -3.411849, 0, 0, 0, 1, 1,
-0.434755, -0.9378337, -2.606595, 0, 0, 0, 1, 1,
-0.4341809, 1.658605, 1.182197, 0, 0, 0, 1, 1,
-0.4338194, -1.586841, -2.498001, 0, 0, 0, 1, 1,
-0.4332784, -0.9049915, -1.662466, 0, 0, 0, 1, 1,
-0.4329576, -0.2862109, -2.49908, 0, 0, 0, 1, 1,
-0.4326721, 0.3311484, -0.8839514, 1, 1, 1, 1, 1,
-0.4324081, -0.1157375, -0.7972908, 1, 1, 1, 1, 1,
-0.4304165, -0.4422728, -2.047714, 1, 1, 1, 1, 1,
-0.4221547, 0.1492307, -0.4526008, 1, 1, 1, 1, 1,
-0.4181077, -0.5642169, -3.706873, 1, 1, 1, 1, 1,
-0.4143077, 0.2356479, -0.9256513, 1, 1, 1, 1, 1,
-0.4129616, 1.808939, -0.6006064, 1, 1, 1, 1, 1,
-0.4118735, 0.6394102, -0.6103733, 1, 1, 1, 1, 1,
-0.4066884, -0.1518271, -3.527877, 1, 1, 1, 1, 1,
-0.4054655, 0.946697, -0.02705694, 1, 1, 1, 1, 1,
-0.4043086, 0.2063564, -0.7730158, 1, 1, 1, 1, 1,
-0.4022643, 0.9973112, -0.4933031, 1, 1, 1, 1, 1,
-0.3968138, 1.812417, -1.626698, 1, 1, 1, 1, 1,
-0.3930981, -0.02860592, 0.1145666, 1, 1, 1, 1, 1,
-0.3852898, -1.185309, -2.80796, 1, 1, 1, 1, 1,
-0.3840942, -0.2997104, -2.539055, 0, 0, 1, 1, 1,
-0.3823234, -0.9942671, -2.208307, 1, 0, 0, 1, 1,
-0.3820585, -0.09089588, -3.368296, 1, 0, 0, 1, 1,
-0.3819847, -2.214099, -4.625207, 1, 0, 0, 1, 1,
-0.3787785, 1.334217, -1.040754, 1, 0, 0, 1, 1,
-0.3785329, 0.7707476, -1.083196, 1, 0, 0, 1, 1,
-0.3736421, 0.2676422, -0.9134011, 0, 0, 0, 1, 1,
-0.3722596, 0.7736902, -1.044029, 0, 0, 0, 1, 1,
-0.3707855, -0.1683232, -1.174876, 0, 0, 0, 1, 1,
-0.3660075, -1.0349, -3.309537, 0, 0, 0, 1, 1,
-0.364632, 1.150419, 0.2247585, 0, 0, 0, 1, 1,
-0.364469, -0.8644429, -2.346473, 0, 0, 0, 1, 1,
-0.3629237, -0.7181441, -3.386395, 0, 0, 0, 1, 1,
-0.3606713, -0.1725809, -2.163885, 1, 1, 1, 1, 1,
-0.3598381, 1.871276, -0.1177751, 1, 1, 1, 1, 1,
-0.3519699, 0.7318591, -0.05150533, 1, 1, 1, 1, 1,
-0.3514355, 0.05271463, 0.3488328, 1, 1, 1, 1, 1,
-0.3505238, -0.4649084, -2.190003, 1, 1, 1, 1, 1,
-0.3498772, -1.846518, -3.336505, 1, 1, 1, 1, 1,
-0.3452217, -0.09293823, -1.681085, 1, 1, 1, 1, 1,
-0.345084, 0.08613769, -1.529493, 1, 1, 1, 1, 1,
-0.3442418, 0.9840373, 0.5203907, 1, 1, 1, 1, 1,
-0.3441363, -1.72123, -3.140707, 1, 1, 1, 1, 1,
-0.3404663, -0.9776656, -2.27523, 1, 1, 1, 1, 1,
-0.3398521, -0.1879205, -2.857743, 1, 1, 1, 1, 1,
-0.3395867, -1.753179, -0.224517, 1, 1, 1, 1, 1,
-0.3354519, 1.225822, -0.04209632, 1, 1, 1, 1, 1,
-0.3276415, 1.307899, -0.3589482, 1, 1, 1, 1, 1,
-0.3238949, 0.6371053, 1.681391, 0, 0, 1, 1, 1,
-0.3221546, 0.87146, -1.132889, 1, 0, 0, 1, 1,
-0.3056152, 1.265907, -0.4550971, 1, 0, 0, 1, 1,
-0.3018165, -0.01570678, -0.6502268, 1, 0, 0, 1, 1,
-0.301424, 0.4873921, -0.5153115, 1, 0, 0, 1, 1,
-0.2948423, 0.0515712, -2.943768, 1, 0, 0, 1, 1,
-0.2944157, 0.2598871, -1.139955, 0, 0, 0, 1, 1,
-0.2938038, 0.6506709, -2.57276, 0, 0, 0, 1, 1,
-0.2910097, -0.2533897, -2.710341, 0, 0, 0, 1, 1,
-0.2889611, -0.4891659, -3.054131, 0, 0, 0, 1, 1,
-0.2874992, 0.3157905, -0.398694, 0, 0, 0, 1, 1,
-0.2853719, 0.5332012, -0.5005221, 0, 0, 0, 1, 1,
-0.2792111, 1.406506, 1.279742, 0, 0, 0, 1, 1,
-0.2704171, 0.6996034, -0.9136157, 1, 1, 1, 1, 1,
-0.2703117, -0.8454498, -3.081993, 1, 1, 1, 1, 1,
-0.270301, -0.831215, -2.383909, 1, 1, 1, 1, 1,
-0.2681422, -0.9328039, -4.112834, 1, 1, 1, 1, 1,
-0.2607496, 0.6531652, -1.3214, 1, 1, 1, 1, 1,
-0.2601436, -0.1787429, -3.26992, 1, 1, 1, 1, 1,
-0.2592674, -0.9516313, -2.574523, 1, 1, 1, 1, 1,
-0.2563111, -0.8286181, -0.9605609, 1, 1, 1, 1, 1,
-0.2554049, -0.1070088, -0.7048979, 1, 1, 1, 1, 1,
-0.2537741, 1.01803, 0.1684118, 1, 1, 1, 1, 1,
-0.2526064, 0.811336, 2.087891, 1, 1, 1, 1, 1,
-0.2485874, 0.951717, -0.2926727, 1, 1, 1, 1, 1,
-0.2440283, 0.1382852, -0.509011, 1, 1, 1, 1, 1,
-0.2378329, 0.1855653, -3.862409, 1, 1, 1, 1, 1,
-0.2365395, 0.9051779, 1.668375, 1, 1, 1, 1, 1,
-0.2310464, -0.610397, -2.067695, 0, 0, 1, 1, 1,
-0.2309114, -0.374214, -3.626477, 1, 0, 0, 1, 1,
-0.2302488, 0.2332063, 0.4035977, 1, 0, 0, 1, 1,
-0.2282121, -0.001054545, -3.103713, 1, 0, 0, 1, 1,
-0.2242848, 0.1553222, -1.176431, 1, 0, 0, 1, 1,
-0.2118323, 1.091884, -1.829834, 1, 0, 0, 1, 1,
-0.2112015, 1.702846, 0.8615614, 0, 0, 0, 1, 1,
-0.2089991, 1.612011, -0.1288096, 0, 0, 0, 1, 1,
-0.2081622, -1.437539, -4.104566, 0, 0, 0, 1, 1,
-0.2063684, -2.275655, -3.345084, 0, 0, 0, 1, 1,
-0.2042298, -0.1624016, -3.085382, 0, 0, 0, 1, 1,
-0.2031896, -0.6913265, -4.124418, 0, 0, 0, 1, 1,
-0.2029679, 1.135207, 1.425059, 0, 0, 0, 1, 1,
-0.2015126, -0.6579798, -2.967992, 1, 1, 1, 1, 1,
-0.2005073, 1.92541, 0.8053068, 1, 1, 1, 1, 1,
-0.1929944, 0.8376772, -0.4246327, 1, 1, 1, 1, 1,
-0.1926891, -0.04604477, -1.938788, 1, 1, 1, 1, 1,
-0.192247, 1.131896, -1.473216, 1, 1, 1, 1, 1,
-0.1912155, -0.2660102, -2.697099, 1, 1, 1, 1, 1,
-0.1831851, 0.4526347, 0.3823784, 1, 1, 1, 1, 1,
-0.1825494, 0.7802292, 0.4828629, 1, 1, 1, 1, 1,
-0.1811326, -0.009925225, -0.7865056, 1, 1, 1, 1, 1,
-0.1779264, -0.1096032, -1.478956, 1, 1, 1, 1, 1,
-0.1769889, -1.121786, -2.983401, 1, 1, 1, 1, 1,
-0.171886, -0.4400691, -3.539094, 1, 1, 1, 1, 1,
-0.1696089, 0.3696235, 1.571029, 1, 1, 1, 1, 1,
-0.1691439, -0.5110444, -2.202689, 1, 1, 1, 1, 1,
-0.1687021, -0.2995491, -3.226545, 1, 1, 1, 1, 1,
-0.1655074, -0.2929403, -3.010083, 0, 0, 1, 1, 1,
-0.1640449, -0.556474, -3.980889, 1, 0, 0, 1, 1,
-0.1614127, -2.283054, -3.65626, 1, 0, 0, 1, 1,
-0.156666, 0.03181978, -1.763663, 1, 0, 0, 1, 1,
-0.1548276, -1.164265, -2.744236, 1, 0, 0, 1, 1,
-0.1532721, -0.7733462, -4.582522, 1, 0, 0, 1, 1,
-0.1526555, -1.902393, -3.286408, 0, 0, 0, 1, 1,
-0.1511763, -0.9702453, -3.419737, 0, 0, 0, 1, 1,
-0.1497814, -3.087501, -1.284717, 0, 0, 0, 1, 1,
-0.1438748, 0.3330139, 0.41489, 0, 0, 0, 1, 1,
-0.141184, -0.1284183, -1.092861, 0, 0, 0, 1, 1,
-0.1372664, -0.09804651, -3.396097, 0, 0, 0, 1, 1,
-0.1344431, 0.1739785, -1.796852, 0, 0, 0, 1, 1,
-0.1340985, 0.07133968, -0.7981127, 1, 1, 1, 1, 1,
-0.1294452, 0.1822156, -1.533684, 1, 1, 1, 1, 1,
-0.1283118, -0.6764997, -3.05066, 1, 1, 1, 1, 1,
-0.1263925, -0.2458938, -1.315727, 1, 1, 1, 1, 1,
-0.1257304, 0.2562506, -0.3583806, 1, 1, 1, 1, 1,
-0.1245167, 0.1551084, -1.536532, 1, 1, 1, 1, 1,
-0.1231802, -1.698739, -1.794685, 1, 1, 1, 1, 1,
-0.121028, 0.8804368, -0.4912194, 1, 1, 1, 1, 1,
-0.1162147, 0.4431688, 0.129301, 1, 1, 1, 1, 1,
-0.1160218, -0.09408792, -1.195436, 1, 1, 1, 1, 1,
-0.1157108, 1.011527, 0.5813002, 1, 1, 1, 1, 1,
-0.1132097, -0.03688718, -1.29065, 1, 1, 1, 1, 1,
-0.1115859, -0.2722667, -3.383292, 1, 1, 1, 1, 1,
-0.110076, -0.08483442, -0.3046364, 1, 1, 1, 1, 1,
-0.1092585, 0.9229579, -0.4808858, 1, 1, 1, 1, 1,
-0.1080562, -1.087944, -2.131011, 0, 0, 1, 1, 1,
-0.1065158, 0.2188332, 0.2074517, 1, 0, 0, 1, 1,
-0.1061096, 0.3477249, -1.069507, 1, 0, 0, 1, 1,
-0.1046872, 0.5550728, 0.1893407, 1, 0, 0, 1, 1,
-0.1044642, 2.298931, -1.25402, 1, 0, 0, 1, 1,
-0.1027995, 1.951879, -0.2017425, 1, 0, 0, 1, 1,
-0.09879056, -0.7907033, -2.123635, 0, 0, 0, 1, 1,
-0.09814719, -1.238176, -3.165707, 0, 0, 0, 1, 1,
-0.08576455, -1.200561, -3.836329, 0, 0, 0, 1, 1,
-0.08542865, -0.9442096, -2.655124, 0, 0, 0, 1, 1,
-0.08497242, 0.1790087, -1.260321, 0, 0, 0, 1, 1,
-0.0836195, 3.371224, 0.5802425, 0, 0, 0, 1, 1,
-0.08310331, -0.1386915, -1.203173, 0, 0, 0, 1, 1,
-0.08293773, -0.7908325, -4.877894, 1, 1, 1, 1, 1,
-0.07954705, 0.9843293, 0.4477561, 1, 1, 1, 1, 1,
-0.07717466, -1.284893, -2.363928, 1, 1, 1, 1, 1,
-0.07678217, 0.8273209, 0.1609316, 1, 1, 1, 1, 1,
-0.07573535, -1.184087, -1.620496, 1, 1, 1, 1, 1,
-0.07559244, 1.291691, -1.118445, 1, 1, 1, 1, 1,
-0.07488775, 1.039132, -0.4718425, 1, 1, 1, 1, 1,
-0.06887756, 1.054775, -0.08765865, 1, 1, 1, 1, 1,
-0.06267105, 0.8025438, -1.368883, 1, 1, 1, 1, 1,
-0.0604878, 1.575409, 0.446279, 1, 1, 1, 1, 1,
-0.05971151, -0.8019274, -1.556608, 1, 1, 1, 1, 1,
-0.05839404, 0.5263835, 0.2471431, 1, 1, 1, 1, 1,
-0.05833492, 0.7704075, 0.4632024, 1, 1, 1, 1, 1,
-0.05470728, 0.8508517, -0.9461402, 1, 1, 1, 1, 1,
-0.04727993, -0.4060367, -3.507972, 1, 1, 1, 1, 1,
-0.04674417, -0.3227757, -5.042838, 0, 0, 1, 1, 1,
-0.04601346, 1.329512, -0.9590727, 1, 0, 0, 1, 1,
-0.03787018, 1.031365, 0.6547596, 1, 0, 0, 1, 1,
-0.0332537, -1.168446, -3.180476, 1, 0, 0, 1, 1,
-0.03259013, -0.02005252, -0.693347, 1, 0, 0, 1, 1,
-0.02839348, 0.6937111, 0.1635121, 1, 0, 0, 1, 1,
-0.02171012, -0.6655962, -3.713655, 0, 0, 0, 1, 1,
-0.01986851, 2.319356, -0.7454005, 0, 0, 0, 1, 1,
-0.01248382, 0.329237, 0.6171294, 0, 0, 0, 1, 1,
-0.01119184, 0.7060536, -2.250652, 0, 0, 0, 1, 1,
-0.009380217, -0.1025376, -3.348411, 0, 0, 0, 1, 1,
-0.00919562, -0.08126724, -3.538457, 0, 0, 0, 1, 1,
-0.008574092, -0.2780527, -3.922256, 0, 0, 0, 1, 1,
-0.008507631, 1.686141, 0.3628298, 1, 1, 1, 1, 1,
0.001608537, 0.3303335, -0.1408045, 1, 1, 1, 1, 1,
0.006714477, 1.369127, 0.6241019, 1, 1, 1, 1, 1,
0.00748422, 1.168459, -2.779416, 1, 1, 1, 1, 1,
0.00962956, 0.8971003, -0.6774336, 1, 1, 1, 1, 1,
0.01043525, 0.1346175, -0.2952345, 1, 1, 1, 1, 1,
0.01167407, -0.7520602, 3.415449, 1, 1, 1, 1, 1,
0.01204078, -1.320525, 3.000132, 1, 1, 1, 1, 1,
0.0126956, 0.8652574, -1.49825, 1, 1, 1, 1, 1,
0.01497782, -0.519486, 4.526123, 1, 1, 1, 1, 1,
0.01585863, -0.333012, 3.454401, 1, 1, 1, 1, 1,
0.01634225, -0.163296, 1.826366, 1, 1, 1, 1, 1,
0.01644568, -0.1772419, 3.36305, 1, 1, 1, 1, 1,
0.01800637, 1.085892, -1.078243, 1, 1, 1, 1, 1,
0.01882459, 1.198506, 1.111252, 1, 1, 1, 1, 1,
0.02364733, -1.261295, 3.473853, 0, 0, 1, 1, 1,
0.02433851, 0.1641183, 0.3084773, 1, 0, 0, 1, 1,
0.02706984, 1.25807, -0.7638975, 1, 0, 0, 1, 1,
0.02764304, -0.07197752, 3.917811, 1, 0, 0, 1, 1,
0.02934177, 0.2408047, 2.639193, 1, 0, 0, 1, 1,
0.03166132, 1.278858, -1.30649, 1, 0, 0, 1, 1,
0.03377721, -1.018655, 1.778768, 0, 0, 0, 1, 1,
0.03421901, -0.4994283, 4.320868, 0, 0, 0, 1, 1,
0.0416371, -0.5713171, 1.628396, 0, 0, 0, 1, 1,
0.05038967, -0.6552043, 3.669176, 0, 0, 0, 1, 1,
0.05495505, -1.325076, 2.881708, 0, 0, 0, 1, 1,
0.05497253, -1.426085, 4.536711, 0, 0, 0, 1, 1,
0.05677123, 0.4026464, 0.5537306, 0, 0, 0, 1, 1,
0.05808932, 0.003189878, 0.2316262, 1, 1, 1, 1, 1,
0.05876081, 1.303849, -0.3444482, 1, 1, 1, 1, 1,
0.0643866, 0.5980346, -0.2838692, 1, 1, 1, 1, 1,
0.06530441, 0.781552, 0.06594402, 1, 1, 1, 1, 1,
0.06633997, -1.538633, 2.903088, 1, 1, 1, 1, 1,
0.07001495, 0.4592698, 0.1994832, 1, 1, 1, 1, 1,
0.072674, 1.44207, -0.5157138, 1, 1, 1, 1, 1,
0.07444338, 0.019241, 0.396228, 1, 1, 1, 1, 1,
0.07802555, 0.1167508, 0.8125747, 1, 1, 1, 1, 1,
0.08248856, 0.9147275, 2.053988, 1, 1, 1, 1, 1,
0.08375129, 1.10673, -1.87129, 1, 1, 1, 1, 1,
0.08900065, -0.1006546, 1.570336, 1, 1, 1, 1, 1,
0.09367999, 0.1338184, -2.133051, 1, 1, 1, 1, 1,
0.09478983, -0.1766112, 3.034157, 1, 1, 1, 1, 1,
0.09771794, -0.01208659, 1.929128, 1, 1, 1, 1, 1,
0.0982684, -0.7283379, 2.846974, 0, 0, 1, 1, 1,
0.0998896, 1.310361, 0.5583764, 1, 0, 0, 1, 1,
0.1013013, 0.435394, 0.3015111, 1, 0, 0, 1, 1,
0.1091996, 0.1698775, 1.400269, 1, 0, 0, 1, 1,
0.1121763, 0.1899164, 1.886726, 1, 0, 0, 1, 1,
0.112913, -0.5577999, 2.618487, 1, 0, 0, 1, 1,
0.1150351, -0.8477587, 3.180199, 0, 0, 0, 1, 1,
0.1199926, 1.962032, -0.5489386, 0, 0, 0, 1, 1,
0.1208873, -0.2749993, 1.423504, 0, 0, 0, 1, 1,
0.1222634, 0.3243572, -0.131644, 0, 0, 0, 1, 1,
0.123343, -0.1071664, 2.936246, 0, 0, 0, 1, 1,
0.1234474, -0.3841762, 4.275164, 0, 0, 0, 1, 1,
0.1273183, -2.371601, 3.227967, 0, 0, 0, 1, 1,
0.1291623, 0.0566964, 2.75415, 1, 1, 1, 1, 1,
0.1373905, 0.9159285, 0.03730908, 1, 1, 1, 1, 1,
0.1383336, 0.3405566, 0.8933803, 1, 1, 1, 1, 1,
0.1396037, -0.872435, 3.169073, 1, 1, 1, 1, 1,
0.1401719, 0.202202, -0.9891405, 1, 1, 1, 1, 1,
0.1412583, -0.4509005, 4.532966, 1, 1, 1, 1, 1,
0.1423026, -0.2596465, 2.697701, 1, 1, 1, 1, 1,
0.1426588, -0.8535693, 3.471294, 1, 1, 1, 1, 1,
0.1463359, 0.9712642, 1.111964, 1, 1, 1, 1, 1,
0.1475171, -0.2086846, 3.046807, 1, 1, 1, 1, 1,
0.1523518, -1.518622, 3.796666, 1, 1, 1, 1, 1,
0.1541631, -0.272747, 2.157359, 1, 1, 1, 1, 1,
0.1552604, 1.366098, 0.3846675, 1, 1, 1, 1, 1,
0.1600281, -0.4629398, 5.23899, 1, 1, 1, 1, 1,
0.1639801, 1.120627, -1.054705, 1, 1, 1, 1, 1,
0.1652463, 0.9959385, 0.4090318, 0, 0, 1, 1, 1,
0.168107, 1.770651, -0.4281255, 1, 0, 0, 1, 1,
0.1705652, 0.0402471, 2.787861, 1, 0, 0, 1, 1,
0.1722994, -0.0154524, 0.5868131, 1, 0, 0, 1, 1,
0.1754356, 0.1185367, 1.491524, 1, 0, 0, 1, 1,
0.1782563, -1.468502, 1.041916, 1, 0, 0, 1, 1,
0.1812711, 2.30883, -0.8926877, 0, 0, 0, 1, 1,
0.1875918, -0.3180918, 3.062805, 0, 0, 0, 1, 1,
0.1885356, 0.5962895, 0.4942858, 0, 0, 0, 1, 1,
0.1906696, -0.7965618, 4.757, 0, 0, 0, 1, 1,
0.2000053, -1.013703, 3.550614, 0, 0, 0, 1, 1,
0.2007499, 0.5605306, -0.1304283, 0, 0, 0, 1, 1,
0.2022271, 2.147817, -0.8086485, 0, 0, 0, 1, 1,
0.2064629, -1.268113, 2.09421, 1, 1, 1, 1, 1,
0.2084865, 0.3874764, 1.435571, 1, 1, 1, 1, 1,
0.2087057, -0.6665425, 1.36538, 1, 1, 1, 1, 1,
0.2100621, 0.8577081, -0.5232787, 1, 1, 1, 1, 1,
0.2107112, 1.807357, 2.323961, 1, 1, 1, 1, 1,
0.2124985, -0.686411, 3.79772, 1, 1, 1, 1, 1,
0.2165331, -2.21664, 2.280988, 1, 1, 1, 1, 1,
0.2218574, 0.0416857, 1.786011, 1, 1, 1, 1, 1,
0.2232116, -0.6149172, 2.928709, 1, 1, 1, 1, 1,
0.2284979, 0.3433678, -0.6112443, 1, 1, 1, 1, 1,
0.2307446, 1.89378, -0.3744654, 1, 1, 1, 1, 1,
0.2328304, 1.159763, 0.6302135, 1, 1, 1, 1, 1,
0.2362867, -0.4720074, 3.649192, 1, 1, 1, 1, 1,
0.2420632, -0.08663164, 1.684545, 1, 1, 1, 1, 1,
0.243594, 0.7977455, -0.1412695, 1, 1, 1, 1, 1,
0.2477599, 0.759819, 0.637648, 0, 0, 1, 1, 1,
0.2478566, 0.4856784, -1.630911, 1, 0, 0, 1, 1,
0.2481095, -1.094079, 2.64853, 1, 0, 0, 1, 1,
0.2483293, 1.009393, -0.3955219, 1, 0, 0, 1, 1,
0.2490634, -0.4709912, 2.842182, 1, 0, 0, 1, 1,
0.2495166, 0.9031278, 0.3433642, 1, 0, 0, 1, 1,
0.2524057, -1.221311, 2.382968, 0, 0, 0, 1, 1,
0.2526869, 1.755164, 0.320836, 0, 0, 0, 1, 1,
0.2590488, -0.2694635, 0.6958355, 0, 0, 0, 1, 1,
0.2646677, -1.599383, 2.586732, 0, 0, 0, 1, 1,
0.2655035, -1.089343, 3.459094, 0, 0, 0, 1, 1,
0.2683898, -0.4529578, 3.646944, 0, 0, 0, 1, 1,
0.2684293, 1.11113, 0.3420893, 0, 0, 0, 1, 1,
0.2716764, 0.1521898, -0.6663909, 1, 1, 1, 1, 1,
0.2725127, 0.7597508, -0.3133491, 1, 1, 1, 1, 1,
0.2736824, -0.7947761, 3.436066, 1, 1, 1, 1, 1,
0.2737966, -1.46537, 1.991069, 1, 1, 1, 1, 1,
0.2763078, -2.519988, 3.798126, 1, 1, 1, 1, 1,
0.2775141, -0.4845175, 3.490706, 1, 1, 1, 1, 1,
0.2805844, -0.9005157, 3.396632, 1, 1, 1, 1, 1,
0.2816625, 0.4285224, 1.276231, 1, 1, 1, 1, 1,
0.2873976, -0.8634641, 3.334263, 1, 1, 1, 1, 1,
0.2902578, -0.5849221, 1.715907, 1, 1, 1, 1, 1,
0.2917604, -0.5943909, 3.703117, 1, 1, 1, 1, 1,
0.2960207, -0.1047515, 1.213764, 1, 1, 1, 1, 1,
0.296436, -0.5607198, 3.241889, 1, 1, 1, 1, 1,
0.2980355, 0.3600664, -0.1735288, 1, 1, 1, 1, 1,
0.3005814, -0.9087676, 2.872254, 1, 1, 1, 1, 1,
0.3023404, 0.1105788, 2.664509, 0, 0, 1, 1, 1,
0.3069389, 0.469328, 2.5805, 1, 0, 0, 1, 1,
0.3079048, 1.776286, 0.03462511, 1, 0, 0, 1, 1,
0.3087133, 1.657982, -0.4896509, 1, 0, 0, 1, 1,
0.3087674, 0.7082606, -0.4945282, 1, 0, 0, 1, 1,
0.3128861, 0.6331601, -0.5002728, 1, 0, 0, 1, 1,
0.3130738, 0.4624054, 1.832647, 0, 0, 0, 1, 1,
0.3234147, 0.6438795, 0.3018503, 0, 0, 0, 1, 1,
0.3239075, 0.188925, 2.720171, 0, 0, 0, 1, 1,
0.3291846, 1.309185, 0.07822254, 0, 0, 0, 1, 1,
0.3293344, 1.768107, 0.6527594, 0, 0, 0, 1, 1,
0.3315755, 1.583275, 1.10095, 0, 0, 0, 1, 1,
0.3383395, 0.6094512, 0.2585951, 0, 0, 0, 1, 1,
0.3412765, 0.5914552, 0.9482252, 1, 1, 1, 1, 1,
0.3466216, 0.2524803, 1.137666, 1, 1, 1, 1, 1,
0.3526837, 1.076076, 0.6465814, 1, 1, 1, 1, 1,
0.3588925, -1.30216, 3.435185, 1, 1, 1, 1, 1,
0.3634943, 0.9333595, -1.782493, 1, 1, 1, 1, 1,
0.3708231, 0.5468666, 1.060963, 1, 1, 1, 1, 1,
0.3718259, 0.3419389, 0.8428205, 1, 1, 1, 1, 1,
0.3750695, 0.3222317, 0.6302589, 1, 1, 1, 1, 1,
0.3774168, 1.026851, -0.7646207, 1, 1, 1, 1, 1,
0.3857039, -1.054328, 2.511536, 1, 1, 1, 1, 1,
0.3863419, 1.661258, 0.9151433, 1, 1, 1, 1, 1,
0.3927523, -0.5909162, 1.432449, 1, 1, 1, 1, 1,
0.3978675, -0.4190462, 2.062603, 1, 1, 1, 1, 1,
0.3987315, 1.452411, 1.854287, 1, 1, 1, 1, 1,
0.3997058, -2.017901, 2.822057, 1, 1, 1, 1, 1,
0.4003583, 0.4841496, -0.3187119, 0, 0, 1, 1, 1,
0.4026895, 0.8695698, 1.434098, 1, 0, 0, 1, 1,
0.4058426, -0.1778087, 1.286299, 1, 0, 0, 1, 1,
0.4104443, 0.1342398, 1.768602, 1, 0, 0, 1, 1,
0.4106353, -0.8105369, 3.526357, 1, 0, 0, 1, 1,
0.4126987, 0.5228539, 1.009718, 1, 0, 0, 1, 1,
0.4141416, -1.043842, 2.505696, 0, 0, 0, 1, 1,
0.4142153, 0.3953843, 0.8677068, 0, 0, 0, 1, 1,
0.4162741, 0.5590405, 1.985201, 0, 0, 0, 1, 1,
0.4203696, 1.738292, -1.523745, 0, 0, 0, 1, 1,
0.4219474, -1.86467, 3.442708, 0, 0, 0, 1, 1,
0.4323137, 0.4066198, 0.4335225, 0, 0, 0, 1, 1,
0.4334927, -0.1533767, 2.67929, 0, 0, 0, 1, 1,
0.4335537, -1.064093, 2.100668, 1, 1, 1, 1, 1,
0.4362608, 2.408468, 0.08527949, 1, 1, 1, 1, 1,
0.4385909, -2.238759, 3.326916, 1, 1, 1, 1, 1,
0.4392038, -0.0826859, -0.2667428, 1, 1, 1, 1, 1,
0.4394919, 1.056709, 1.786482, 1, 1, 1, 1, 1,
0.4407121, -0.3530017, 2.027669, 1, 1, 1, 1, 1,
0.4414091, 1.341448, -1.165148, 1, 1, 1, 1, 1,
0.4430352, -0.3793806, 1.68501, 1, 1, 1, 1, 1,
0.4445921, -0.246166, 2.632738, 1, 1, 1, 1, 1,
0.4446851, -0.2353216, 0.8309677, 1, 1, 1, 1, 1,
0.4471443, 0.317564, 0.6793982, 1, 1, 1, 1, 1,
0.4475021, -0.03436393, 2.220419, 1, 1, 1, 1, 1,
0.4477266, -1.72833, 3.207103, 1, 1, 1, 1, 1,
0.4482885, 2.140173, 1.338701, 1, 1, 1, 1, 1,
0.4535172, -1.069971, 2.445945, 1, 1, 1, 1, 1,
0.4570249, -0.8187697, 2.182101, 0, 0, 1, 1, 1,
0.4600178, -1.522755, 3.214606, 1, 0, 0, 1, 1,
0.4644079, 0.2272062, 0.9461636, 1, 0, 0, 1, 1,
0.4701781, 0.8161563, 0.2342091, 1, 0, 0, 1, 1,
0.474078, 0.1399515, 0.1025785, 1, 0, 0, 1, 1,
0.4878852, 0.5825872, 0.6276442, 1, 0, 0, 1, 1,
0.4882649, -0.5474356, 2.339121, 0, 0, 0, 1, 1,
0.4913273, -0.6344022, 2.650108, 0, 0, 0, 1, 1,
0.4919055, 0.3581773, 1.042698, 0, 0, 0, 1, 1,
0.500255, -1.419453, 1.686903, 0, 0, 0, 1, 1,
0.5026039, 0.393031, 0.118927, 0, 0, 0, 1, 1,
0.5043083, 0.9217889, -0.2463798, 0, 0, 0, 1, 1,
0.5063136, -0.05923682, 1.461825, 0, 0, 0, 1, 1,
0.5090696, -0.9995789, 3.937893, 1, 1, 1, 1, 1,
0.511479, -1.132183, 2.25372, 1, 1, 1, 1, 1,
0.5160741, 1.385793, 1.398699, 1, 1, 1, 1, 1,
0.5215421, 0.02368411, 2.571636, 1, 1, 1, 1, 1,
0.5221751, -0.5142165, 2.129579, 1, 1, 1, 1, 1,
0.5246663, 1.048629, 0.852064, 1, 1, 1, 1, 1,
0.5266783, 0.003553144, 1.629341, 1, 1, 1, 1, 1,
0.5271516, -1.39326, 2.084517, 1, 1, 1, 1, 1,
0.5275311, -0.5596344, 1.75509, 1, 1, 1, 1, 1,
0.5328289, 0.4963845, -0.239112, 1, 1, 1, 1, 1,
0.5372547, 2.241195, 1.68728, 1, 1, 1, 1, 1,
0.5388388, 0.2472243, -0.2720141, 1, 1, 1, 1, 1,
0.5441092, 0.3415479, -0.2508749, 1, 1, 1, 1, 1,
0.5480028, -2.342667, 4.138441, 1, 1, 1, 1, 1,
0.5484621, -0.5359395, 3.578076, 1, 1, 1, 1, 1,
0.5487382, 0.827948, -1.68485, 0, 0, 1, 1, 1,
0.5538341, -0.6814606, 2.431101, 1, 0, 0, 1, 1,
0.5611104, -1.309679, 2.458552, 1, 0, 0, 1, 1,
0.561376, 1.041638, -0.1725377, 1, 0, 0, 1, 1,
0.5676277, 0.6773792, 0.4589888, 1, 0, 0, 1, 1,
0.5706193, -0.1030716, 0.7799774, 1, 0, 0, 1, 1,
0.5770173, 0.7132156, -1.675625, 0, 0, 0, 1, 1,
0.5779486, 0.06663788, 0.7888685, 0, 0, 0, 1, 1,
0.5806268, 0.3149929, 1.818021, 0, 0, 0, 1, 1,
0.5891025, -1.87783, 3.866797, 0, 0, 0, 1, 1,
0.5894122, -0.8300133, 1.585903, 0, 0, 0, 1, 1,
0.5920849, -0.2680565, 1.156286, 0, 0, 0, 1, 1,
0.5921259, -0.04648811, 3.616519, 0, 0, 0, 1, 1,
0.5968836, -0.4377954, 1.284579, 1, 1, 1, 1, 1,
0.599017, -0.9908881, 3.303917, 1, 1, 1, 1, 1,
0.6034076, 0.2573373, 1.51884, 1, 1, 1, 1, 1,
0.6091279, -0.4310323, 0.5785644, 1, 1, 1, 1, 1,
0.6133254, 1.483325, 1.05301, 1, 1, 1, 1, 1,
0.6147649, 0.774193, 1.693325, 1, 1, 1, 1, 1,
0.6182919, 1.054848, -0.2532996, 1, 1, 1, 1, 1,
0.6196819, -0.07162407, 1.605573, 1, 1, 1, 1, 1,
0.6209601, 0.5763358, -0.1736635, 1, 1, 1, 1, 1,
0.6224994, -1.34099, 2.371288, 1, 1, 1, 1, 1,
0.623143, -1.581724, 3.537661, 1, 1, 1, 1, 1,
0.6314461, 1.413528, 2.308833, 1, 1, 1, 1, 1,
0.6321411, -1.804829, 0.7739764, 1, 1, 1, 1, 1,
0.6375465, 0.0197129, 1.49975, 1, 1, 1, 1, 1,
0.6445451, -0.1922459, -1.593001, 1, 1, 1, 1, 1,
0.645977, -0.0765369, 1.461195, 0, 0, 1, 1, 1,
0.6465773, -1.055176, 2.525564, 1, 0, 0, 1, 1,
0.6473587, -2.545147, 2.207668, 1, 0, 0, 1, 1,
0.6520098, -0.2366755, 0.7267381, 1, 0, 0, 1, 1,
0.6544077, -1.383879, 1.287839, 1, 0, 0, 1, 1,
0.6557965, -2.352971, 3.928991, 1, 0, 0, 1, 1,
0.656027, 0.1272218, 1.619063, 0, 0, 0, 1, 1,
0.6586342, -0.7180176, 3.525758, 0, 0, 0, 1, 1,
0.6662677, 0.8031116, 0.4213651, 0, 0, 0, 1, 1,
0.6680772, 0.6869947, 2.454129, 0, 0, 0, 1, 1,
0.6851315, 1.419482, 1.638317, 0, 0, 0, 1, 1,
0.686422, 1.822139, -0.4613978, 0, 0, 0, 1, 1,
0.6867005, -0.0154263, 2.600016, 0, 0, 0, 1, 1,
0.6887723, -0.5413984, 3.434283, 1, 1, 1, 1, 1,
0.7003399, -0.07616629, 2.622046, 1, 1, 1, 1, 1,
0.7005881, -1.601215, 3.622973, 1, 1, 1, 1, 1,
0.702721, -1.23756, 5.20834, 1, 1, 1, 1, 1,
0.7075184, -1.533934, 2.796305, 1, 1, 1, 1, 1,
0.7115573, -0.1521234, 2.701649, 1, 1, 1, 1, 1,
0.7131628, -1.92598, 1.930684, 1, 1, 1, 1, 1,
0.7196571, 0.186861, 1.67997, 1, 1, 1, 1, 1,
0.7203888, 2.846686, 3.033761, 1, 1, 1, 1, 1,
0.7264704, 0.6053348, 1.210331, 1, 1, 1, 1, 1,
0.7277848, 0.8430272, -0.1296951, 1, 1, 1, 1, 1,
0.7278897, -1.576357, 3.875054, 1, 1, 1, 1, 1,
0.7315685, 0.8422973, 0.9310313, 1, 1, 1, 1, 1,
0.7326608, -1.079842, 0.1936266, 1, 1, 1, 1, 1,
0.7407362, -0.6771144, 3.425211, 1, 1, 1, 1, 1,
0.748653, 1.406918, -0.9060748, 0, 0, 1, 1, 1,
0.7535036, -1.31771, 2.428045, 1, 0, 0, 1, 1,
0.7543607, -1.254227, 2.940091, 1, 0, 0, 1, 1,
0.7590834, -2.343898, 3.853493, 1, 0, 0, 1, 1,
0.7645522, 0.241705, 1.907873, 1, 0, 0, 1, 1,
0.7731031, 0.2246327, 1.911153, 1, 0, 0, 1, 1,
0.7745226, 1.052156, -0.4128178, 0, 0, 0, 1, 1,
0.7802743, -1.436606, 3.376941, 0, 0, 0, 1, 1,
0.7822549, 0.4673409, 0.1202258, 0, 0, 0, 1, 1,
0.7868722, -1.320504, 2.389682, 0, 0, 0, 1, 1,
0.7885307, -1.635378, 3.839555, 0, 0, 0, 1, 1,
0.7947553, -0.4518648, 0.8239502, 0, 0, 0, 1, 1,
0.8030486, -0.7064646, 3.931569, 0, 0, 0, 1, 1,
0.8041011, 0.6879289, -0.4350416, 1, 1, 1, 1, 1,
0.8063709, 0.5148544, 0.91724, 1, 1, 1, 1, 1,
0.8146258, -0.6923305, 3.14422, 1, 1, 1, 1, 1,
0.8194966, -1.106896, 2.921667, 1, 1, 1, 1, 1,
0.8231336, -0.1062539, 1.800709, 1, 1, 1, 1, 1,
0.82488, 0.9999627, 1.099528, 1, 1, 1, 1, 1,
0.8257451, -0.0002848955, 2.070505, 1, 1, 1, 1, 1,
0.8282021, 0.008605383, 0.6803411, 1, 1, 1, 1, 1,
0.8290518, -0.7231303, 3.48446, 1, 1, 1, 1, 1,
0.8353871, 1.495348, 0.4596055, 1, 1, 1, 1, 1,
0.8740062, -1.712345, 2.418258, 1, 1, 1, 1, 1,
0.876679, -0.3034427, 1.607546, 1, 1, 1, 1, 1,
0.8824095, 0.6493496, 0.480047, 1, 1, 1, 1, 1,
0.8884769, -0.9953985, 2.390996, 1, 1, 1, 1, 1,
0.8942364, 0.5421447, 0.6744958, 1, 1, 1, 1, 1,
0.8978838, -0.3729992, 0.9971439, 0, 0, 1, 1, 1,
0.9028656, 0.9164224, 0.03085847, 1, 0, 0, 1, 1,
0.905768, 0.8419551, 0.4979871, 1, 0, 0, 1, 1,
0.9104895, -0.2716535, 1.137789, 1, 0, 0, 1, 1,
0.911422, 0.8961802, 0.4874292, 1, 0, 0, 1, 1,
0.9217771, 0.9715848, 1.695555, 1, 0, 0, 1, 1,
0.9223469, -1.618274, 3.964667, 0, 0, 0, 1, 1,
0.9350221, 0.6597686, 0.0473893, 0, 0, 0, 1, 1,
0.9353818, -0.3026066, 1.897872, 0, 0, 0, 1, 1,
0.9403009, -1.318191, 3.043053, 0, 0, 0, 1, 1,
0.9475668, 0.2622146, 1.904351, 0, 0, 0, 1, 1,
0.9553511, -0.3530323, 1.839313, 0, 0, 0, 1, 1,
0.956058, -0.7479203, 1.193976, 0, 0, 0, 1, 1,
0.9586743, 0.02827314, 0.02303974, 1, 1, 1, 1, 1,
0.9603549, 0.5527332, 0.3813318, 1, 1, 1, 1, 1,
0.9726512, -1.552123, 4.09072, 1, 1, 1, 1, 1,
0.9788289, -0.1889623, 1.713331, 1, 1, 1, 1, 1,
0.9815035, 1.664522, 0.1006337, 1, 1, 1, 1, 1,
0.9832519, 1.864057, -0.3330121, 1, 1, 1, 1, 1,
0.9890441, -0.2150929, 1.579116, 1, 1, 1, 1, 1,
0.9945564, -1.347353, 1.959754, 1, 1, 1, 1, 1,
1.006282, 0.1187841, -0.6408082, 1, 1, 1, 1, 1,
1.008012, 0.02376735, 1.63956, 1, 1, 1, 1, 1,
1.012076, 0.05075024, 1.628033, 1, 1, 1, 1, 1,
1.013362, 0.2369707, 1.803035, 1, 1, 1, 1, 1,
1.016589, 0.0532346, 1.385641, 1, 1, 1, 1, 1,
1.017074, 0.4246302, 1.022556, 1, 1, 1, 1, 1,
1.017591, 0.7368221, -0.6488957, 1, 1, 1, 1, 1,
1.021154, 1.179136, 0.5476334, 0, 0, 1, 1, 1,
1.021974, 1.019996, 0.8236954, 1, 0, 0, 1, 1,
1.022633, -0.9513298, 2.65254, 1, 0, 0, 1, 1,
1.02933, -0.994793, 2.429515, 1, 0, 0, 1, 1,
1.031185, 0.3286994, 0.8981632, 1, 0, 0, 1, 1,
1.031596, -1.302698, 2.94227, 1, 0, 0, 1, 1,
1.038651, 0.1474655, 1.944728, 0, 0, 0, 1, 1,
1.040225, 1.743183, -0.8938888, 0, 0, 0, 1, 1,
1.04278, -0.4139715, 1.822942, 0, 0, 0, 1, 1,
1.050567, 0.2068665, 1.172415, 0, 0, 0, 1, 1,
1.052878, -1.380447, 4.40139, 0, 0, 0, 1, 1,
1.055545, -1.630236, 1.811394, 0, 0, 0, 1, 1,
1.058505, -0.2902402, 1.427189, 0, 0, 0, 1, 1,
1.05864, 2.023459, 0.9832684, 1, 1, 1, 1, 1,
1.067819, -0.6137638, 0.7010088, 1, 1, 1, 1, 1,
1.079064, -0.8719731, 2.812978, 1, 1, 1, 1, 1,
1.088544, -1.214924, 2.713485, 1, 1, 1, 1, 1,
1.089109, 1.177563, -0.9645802, 1, 1, 1, 1, 1,
1.091469, -2.178882, 2.465161, 1, 1, 1, 1, 1,
1.113852, -0.06352763, 3.006677, 1, 1, 1, 1, 1,
1.119244, 0.3180313, 1.487731, 1, 1, 1, 1, 1,
1.122858, 1.078692, 2.095475, 1, 1, 1, 1, 1,
1.12673, 0.08343284, 1.821641, 1, 1, 1, 1, 1,
1.133817, -0.9300858, 1.22767, 1, 1, 1, 1, 1,
1.14039, -4.156543, 2.864365, 1, 1, 1, 1, 1,
1.141473, 0.05190095, 1.901187, 1, 1, 1, 1, 1,
1.142543, -0.000709519, 0.685592, 1, 1, 1, 1, 1,
1.143428, -1.469415, 1.339478, 1, 1, 1, 1, 1,
1.144374, 0.2245976, 0.2076385, 0, 0, 1, 1, 1,
1.148466, 1.366758, 0.9714869, 1, 0, 0, 1, 1,
1.156325, -0.8268234, 3.78812, 1, 0, 0, 1, 1,
1.162742, -0.7106712, 2.067429, 1, 0, 0, 1, 1,
1.176512, 1.498719, 0.7648535, 1, 0, 0, 1, 1,
1.179145, -0.4173235, 2.919512, 1, 0, 0, 1, 1,
1.180035, 1.543657, -0.05292045, 0, 0, 0, 1, 1,
1.184486, 0.8495955, 1.732733, 0, 0, 0, 1, 1,
1.185646, 0.07885947, 3.29964, 0, 0, 0, 1, 1,
1.18885, -1.131379, 2.460897, 0, 0, 0, 1, 1,
1.195861, -0.3894133, 1.421132, 0, 0, 0, 1, 1,
1.196077, -1.668289, 3.643915, 0, 0, 0, 1, 1,
1.200147, 0.354892, 1.543122, 0, 0, 0, 1, 1,
1.200708, 1.088581, 0.9201557, 1, 1, 1, 1, 1,
1.202281, 0.0993406, 1.285796, 1, 1, 1, 1, 1,
1.204124, 0.8577508, 0.2899524, 1, 1, 1, 1, 1,
1.214494, -1.377505, 1.511704, 1, 1, 1, 1, 1,
1.215164, -0.4053888, -0.01612553, 1, 1, 1, 1, 1,
1.216559, 0.3374392, 0.3768241, 1, 1, 1, 1, 1,
1.223132, 0.5951495, 1.68789, 1, 1, 1, 1, 1,
1.228162, -0.9684149, 3.749473, 1, 1, 1, 1, 1,
1.230855, -0.6150423, 2.474342, 1, 1, 1, 1, 1,
1.2333, -2.327489, 3.152653, 1, 1, 1, 1, 1,
1.236197, -0.03093185, 1.038452, 1, 1, 1, 1, 1,
1.246318, -1.238475, 1.666133, 1, 1, 1, 1, 1,
1.248036, -0.3462189, 2.964453, 1, 1, 1, 1, 1,
1.251042, -0.7463138, 1.241249, 1, 1, 1, 1, 1,
1.253566, 0.5203513, 0.8981445, 1, 1, 1, 1, 1,
1.256462, 0.8095001, 0.01613129, 0, 0, 1, 1, 1,
1.26345, 2.037583, -2.272899, 1, 0, 0, 1, 1,
1.26536, -1.157546, 2.806505, 1, 0, 0, 1, 1,
1.275803, -0.7969114, 2.063025, 1, 0, 0, 1, 1,
1.291998, -1.058322, 0.5373045, 1, 0, 0, 1, 1,
1.298451, -1.579196, 3.563292, 1, 0, 0, 1, 1,
1.300963, -1.741955, 1.951182, 0, 0, 0, 1, 1,
1.30334, 0.1367367, 1.240476, 0, 0, 0, 1, 1,
1.303775, 0.8258575, 1.98188, 0, 0, 0, 1, 1,
1.30389, 0.8991224, 0.5338098, 0, 0, 0, 1, 1,
1.30514, -1.335334, 1.77543, 0, 0, 0, 1, 1,
1.320061, -0.708096, 0.8318697, 0, 0, 0, 1, 1,
1.345357, -1.616024, 1.762059, 0, 0, 0, 1, 1,
1.351771, -0.8176292, 2.877726, 1, 1, 1, 1, 1,
1.354373, -0.9539253, 2.943867, 1, 1, 1, 1, 1,
1.357338, 1.624493, 1.289888, 1, 1, 1, 1, 1,
1.366348, 0.2067999, 0.8684537, 1, 1, 1, 1, 1,
1.369624, 1.040207, 0.9211776, 1, 1, 1, 1, 1,
1.377391, -0.8399485, 2.5682, 1, 1, 1, 1, 1,
1.379628, -0.1337329, 2.636883, 1, 1, 1, 1, 1,
1.388326, 0.4618506, -0.1182775, 1, 1, 1, 1, 1,
1.395686, 0.9284121, 0.4843683, 1, 1, 1, 1, 1,
1.424402, 0.3576978, 1.761929, 1, 1, 1, 1, 1,
1.427019, 0.2212456, 1.630917, 1, 1, 1, 1, 1,
1.444013, 0.2515043, 0.7312571, 1, 1, 1, 1, 1,
1.446237, -0.7070359, 2.786822, 1, 1, 1, 1, 1,
1.453562, 0.7436236, 2.734583, 1, 1, 1, 1, 1,
1.463985, 0.03460068, 2.444345, 1, 1, 1, 1, 1,
1.470089, 0.4117591, 0.3508448, 0, 0, 1, 1, 1,
1.474491, -0.2514029, 0.7709791, 1, 0, 0, 1, 1,
1.47701, -1.686074, 2.671006, 1, 0, 0, 1, 1,
1.477342, -0.7921396, 1.099182, 1, 0, 0, 1, 1,
1.491675, -0.6135419, 1.802572, 1, 0, 0, 1, 1,
1.499621, 0.5147086, 1.734102, 1, 0, 0, 1, 1,
1.501233, -0.1735638, 2.411687, 0, 0, 0, 1, 1,
1.515025, 0.2659714, 3.326907, 0, 0, 0, 1, 1,
1.528393, -0.6943859, 1.524666, 0, 0, 0, 1, 1,
1.533109, -0.2093691, 1.867439, 0, 0, 0, 1, 1,
1.548657, -0.4572304, 0.7917932, 0, 0, 0, 1, 1,
1.559855, 0.306807, 2.280023, 0, 0, 0, 1, 1,
1.566254, -0.741448, 2.310386, 0, 0, 0, 1, 1,
1.569745, 0.7781895, 0.9454718, 1, 1, 1, 1, 1,
1.576903, 0.1821773, 2.784179, 1, 1, 1, 1, 1,
1.579493, -2.068807, 3.847648, 1, 1, 1, 1, 1,
1.580008, 0.3906735, 1.541577, 1, 1, 1, 1, 1,
1.580589, 0.7057161, 2.112001, 1, 1, 1, 1, 1,
1.580881, -0.08378117, 0.9400045, 1, 1, 1, 1, 1,
1.602144, 0.9675156, 0.411183, 1, 1, 1, 1, 1,
1.605355, 1.148211, 1.009625, 1, 1, 1, 1, 1,
1.609873, 0.4234197, 0.8722765, 1, 1, 1, 1, 1,
1.612206, 0.7330288, -0.314314, 1, 1, 1, 1, 1,
1.629274, -0.9279875, 1.689875, 1, 1, 1, 1, 1,
1.631882, -0.7812515, 2.358129, 1, 1, 1, 1, 1,
1.672398, 0.2521604, 1.711097, 1, 1, 1, 1, 1,
1.691836, -0.8827158, 1.916039, 1, 1, 1, 1, 1,
1.693635, -0.4970039, 2.17665, 1, 1, 1, 1, 1,
1.698432, 0.2333852, 1.84933, 0, 0, 1, 1, 1,
1.699961, 0.09234793, 1.865827, 1, 0, 0, 1, 1,
1.702524, -0.3249519, 1.679503, 1, 0, 0, 1, 1,
1.739283, 0.8483284, 3.633317, 1, 0, 0, 1, 1,
1.754987, -0.4926694, 1.106874, 1, 0, 0, 1, 1,
1.781062, -0.3987176, 0.8140932, 1, 0, 0, 1, 1,
1.784627, -0.1667358, 2.377537, 0, 0, 0, 1, 1,
1.830077, 1.370961, 3.276096, 0, 0, 0, 1, 1,
1.842696, -0.3159579, 0.9270438, 0, 0, 0, 1, 1,
1.847715, -1.264344, 3.193628, 0, 0, 0, 1, 1,
1.859499, -0.9087064, 2.064574, 0, 0, 0, 1, 1,
1.860984, -0.8941329, 1.117687, 0, 0, 0, 1, 1,
1.865539, -1.328044, 2.155951, 0, 0, 0, 1, 1,
1.872889, 0.4991982, 2.277425, 1, 1, 1, 1, 1,
1.873809, -0.6056792, 0.6668718, 1, 1, 1, 1, 1,
1.876417, -1.25714, 2.055647, 1, 1, 1, 1, 1,
1.893169, -0.2741071, 1.438101, 1, 1, 1, 1, 1,
1.893444, -0.2369092, 1.244144, 1, 1, 1, 1, 1,
1.897805, -0.04520531, 3.906214, 1, 1, 1, 1, 1,
1.904577, 0.2192935, 2.042676, 1, 1, 1, 1, 1,
1.917422, 1.299789, 0.9031758, 1, 1, 1, 1, 1,
1.917566, -1.483468, 1.283827, 1, 1, 1, 1, 1,
1.920075, -2.022001, 1.906152, 1, 1, 1, 1, 1,
1.928885, -0.1846458, 1.670306, 1, 1, 1, 1, 1,
1.947656, 0.167393, 2.041878, 1, 1, 1, 1, 1,
1.951007, -0.167766, -0.1195126, 1, 1, 1, 1, 1,
1.964474, 0.1053219, 1.525763, 1, 1, 1, 1, 1,
2.014172, 0.302141, 3.211263, 1, 1, 1, 1, 1,
2.014719, 1.54539, 1.107865, 0, 0, 1, 1, 1,
2.023755, -1.337461, 3.403844, 1, 0, 0, 1, 1,
2.072579, 0.7251195, 1.543819, 1, 0, 0, 1, 1,
2.1014, 0.2122811, 1.184443, 1, 0, 0, 1, 1,
2.14906, -0.5133566, 1.528202, 1, 0, 0, 1, 1,
2.22576, -2.064014, 2.913514, 1, 0, 0, 1, 1,
2.226588, -0.3431177, 2.312417, 0, 0, 0, 1, 1,
2.287762, -1.24269, 1.798864, 0, 0, 0, 1, 1,
2.290649, 0.4050122, 1.377663, 0, 0, 0, 1, 1,
2.379325, -0.4480282, 0.3709325, 0, 0, 0, 1, 1,
2.386347, -0.6786003, 1.038022, 0, 0, 0, 1, 1,
2.386888, -1.748321, 1.413025, 0, 0, 0, 1, 1,
2.424209, -0.476211, 1.625151, 0, 0, 0, 1, 1,
2.505438, 0.1531262, 1.36218, 1, 1, 1, 1, 1,
2.52817, 0.2156307, 1.32069, 1, 1, 1, 1, 1,
2.540849, 0.02831462, 3.643837, 1, 1, 1, 1, 1,
2.789132, -0.09657106, 2.308177, 1, 1, 1, 1, 1,
2.955971, 0.9424414, 1.669109, 1, 1, 1, 1, 1,
3.238523, 0.5925394, 1.770224, 1, 1, 1, 1, 1,
3.238634, -1.192239, 0.8606619, 1, 1, 1, 1, 1
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
var radius = 9.970162;
var distance = 35.01978;
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
mvMatrix.translate( -0.04332614, 0.3926594, 0.2307076 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.01978);
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
