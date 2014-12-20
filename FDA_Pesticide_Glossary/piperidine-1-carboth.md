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
-3.220772, 0.01387843, -3.162188, 1, 0, 0, 1,
-2.892505, 0.6847373, -1.058817, 1, 0.007843138, 0, 1,
-2.611763, 0.3875328, -1.449536, 1, 0.01176471, 0, 1,
-2.563114, -1.044634, -2.14957, 1, 0.01960784, 0, 1,
-2.434211, 0.3807214, -1.640649, 1, 0.02352941, 0, 1,
-2.333618, -0.4962009, -2.50963, 1, 0.03137255, 0, 1,
-2.272694, -0.3761984, -0.06771006, 1, 0.03529412, 0, 1,
-2.244147, 0.8448583, -0.5092971, 1, 0.04313726, 0, 1,
-2.139256, -1.528561, -1.716056, 1, 0.04705882, 0, 1,
-2.12013, 1.016266, -1.776384, 1, 0.05490196, 0, 1,
-2.11331, -1.161146, -1.906255, 1, 0.05882353, 0, 1,
-2.098776, -0.1857932, -0.4589464, 1, 0.06666667, 0, 1,
-2.086867, -0.9570935, -0.2965041, 1, 0.07058824, 0, 1,
-2.08657, -0.08946022, -2.098832, 1, 0.07843138, 0, 1,
-2.077991, -1.071677, -1.768872, 1, 0.08235294, 0, 1,
-2.075632, 1.091947, -0.775326, 1, 0.09019608, 0, 1,
-2.04442, 3.012156, 0.7769946, 1, 0.09411765, 0, 1,
-2.02069, -0.2740791, -1.828941, 1, 0.1019608, 0, 1,
-2.020672, -0.4341926, -3.931034, 1, 0.1098039, 0, 1,
-1.981946, -1.35361, -1.450107, 1, 0.1137255, 0, 1,
-1.965464, 0.06210101, -0.4603235, 1, 0.1215686, 0, 1,
-1.955929, -0.8827317, -1.054317, 1, 0.1254902, 0, 1,
-1.952472, 0.5945559, 0.02734189, 1, 0.1333333, 0, 1,
-1.949232, -0.5990362, -2.183837, 1, 0.1372549, 0, 1,
-1.946823, 0.4955111, -1.722202, 1, 0.145098, 0, 1,
-1.934734, 2.110845, -1.6901, 1, 0.1490196, 0, 1,
-1.928972, -0.5978048, -2.36465, 1, 0.1568628, 0, 1,
-1.916263, 2.096095, -0.5149633, 1, 0.1607843, 0, 1,
-1.904318, 0.1281777, -2.628694, 1, 0.1686275, 0, 1,
-1.88151, 0.764189, -0.8629294, 1, 0.172549, 0, 1,
-1.872545, 1.173221, 0.4574214, 1, 0.1803922, 0, 1,
-1.868494, -0.3809923, -2.781449, 1, 0.1843137, 0, 1,
-1.856968, 1.622249, -0.2493627, 1, 0.1921569, 0, 1,
-1.794164, 1.006462, -1.358553, 1, 0.1960784, 0, 1,
-1.79202, 0.3981896, -1.050329, 1, 0.2039216, 0, 1,
-1.782228, -0.9037262, -2.226774, 1, 0.2117647, 0, 1,
-1.76802, -0.5818177, -3.013556, 1, 0.2156863, 0, 1,
-1.762709, 0.4415478, -0.2254125, 1, 0.2235294, 0, 1,
-1.735574, -0.007241889, 1.052543, 1, 0.227451, 0, 1,
-1.732594, -0.8201308, -2.582043, 1, 0.2352941, 0, 1,
-1.731231, -0.500695, -1.964156, 1, 0.2392157, 0, 1,
-1.724653, -1.761769, -2.447371, 1, 0.2470588, 0, 1,
-1.6813, -1.084193, -1.163089, 1, 0.2509804, 0, 1,
-1.673842, -0.8360901, -2.024868, 1, 0.2588235, 0, 1,
-1.667062, -0.5852629, -1.755539, 1, 0.2627451, 0, 1,
-1.666492, -0.9610952, -1.972161, 1, 0.2705882, 0, 1,
-1.654316, 1.263622, 0.03255687, 1, 0.2745098, 0, 1,
-1.6374, -0.7109991, -3.000635, 1, 0.282353, 0, 1,
-1.635023, -0.2964254, -0.8590844, 1, 0.2862745, 0, 1,
-1.631998, 1.116975, -1.122992, 1, 0.2941177, 0, 1,
-1.624249, -0.03873264, -0.3254517, 1, 0.3019608, 0, 1,
-1.61961, -1.258899, -3.298352, 1, 0.3058824, 0, 1,
-1.614924, -0.9468902, -3.22069, 1, 0.3137255, 0, 1,
-1.597042, 0.1306448, -1.313613, 1, 0.3176471, 0, 1,
-1.57736, 1.033018, -1.772887, 1, 0.3254902, 0, 1,
-1.569474, -2.057301, -2.210442, 1, 0.3294118, 0, 1,
-1.561488, 1.583812, -0.5427433, 1, 0.3372549, 0, 1,
-1.555448, 0.02608036, -0.8797247, 1, 0.3411765, 0, 1,
-1.53816, 2.986628, 0.5889502, 1, 0.3490196, 0, 1,
-1.536353, -0.4586837, -2.102927, 1, 0.3529412, 0, 1,
-1.532789, -1.185221, -3.076469, 1, 0.3607843, 0, 1,
-1.530241, 0.8623453, -0.0171196, 1, 0.3647059, 0, 1,
-1.528786, 0.8890772, -1.869257, 1, 0.372549, 0, 1,
-1.511834, 1.081996, -1.343153, 1, 0.3764706, 0, 1,
-1.508336, -0.6178735, -2.048597, 1, 0.3843137, 0, 1,
-1.507586, -0.5747615, -2.999221, 1, 0.3882353, 0, 1,
-1.507412, 0.9709921, -1.087441, 1, 0.3960784, 0, 1,
-1.496339, -0.503866, -1.834648, 1, 0.4039216, 0, 1,
-1.488526, 2.232665, -1.609355, 1, 0.4078431, 0, 1,
-1.478247, 0.4190018, -2.251417, 1, 0.4156863, 0, 1,
-1.456235, -1.738673, -1.429782, 1, 0.4196078, 0, 1,
-1.45585, 0.05657009, -1.463957, 1, 0.427451, 0, 1,
-1.454135, -1.514871, -3.899277, 1, 0.4313726, 0, 1,
-1.45372, 3.126663, -1.653712, 1, 0.4392157, 0, 1,
-1.446847, -0.370833, -1.749627, 1, 0.4431373, 0, 1,
-1.444486, -0.05839789, -1.427867, 1, 0.4509804, 0, 1,
-1.439592, -0.5276915, -1.753093, 1, 0.454902, 0, 1,
-1.428722, 0.3562535, -0.4233553, 1, 0.4627451, 0, 1,
-1.42615, -1.044687, -3.088331, 1, 0.4666667, 0, 1,
-1.424425, 0.9813811, 0.2657424, 1, 0.4745098, 0, 1,
-1.416831, -0.9989519, -2.230517, 1, 0.4784314, 0, 1,
-1.412913, -1.127666, -3.310114, 1, 0.4862745, 0, 1,
-1.40867, 0.3491858, -0.6325189, 1, 0.4901961, 0, 1,
-1.402118, -1.111011, -2.433451, 1, 0.4980392, 0, 1,
-1.400653, 0.3654366, -2.380987, 1, 0.5058824, 0, 1,
-1.396157, -0.8928694, -2.048835, 1, 0.509804, 0, 1,
-1.389915, -0.4935785, -2.569016, 1, 0.5176471, 0, 1,
-1.389541, -0.1013543, 0.153848, 1, 0.5215687, 0, 1,
-1.382995, -0.4253313, -2.398435, 1, 0.5294118, 0, 1,
-1.379486, 0.4193012, -0.7752014, 1, 0.5333334, 0, 1,
-1.378422, -1.397933, -2.16361, 1, 0.5411765, 0, 1,
-1.375262, 0.9016891, -0.5287782, 1, 0.5450981, 0, 1,
-1.374577, -0.0130066, -2.025359, 1, 0.5529412, 0, 1,
-1.373105, -0.4156685, -3.777805, 1, 0.5568628, 0, 1,
-1.370376, -0.8760295, -1.292116, 1, 0.5647059, 0, 1,
-1.352999, -0.201322, -0.5463924, 1, 0.5686275, 0, 1,
-1.325595, -0.5365271, -1.383945, 1, 0.5764706, 0, 1,
-1.324123, -0.9285285, -2.292328, 1, 0.5803922, 0, 1,
-1.322752, 0.235651, -1.38513, 1, 0.5882353, 0, 1,
-1.315251, -0.06875774, -1.819621, 1, 0.5921569, 0, 1,
-1.309827, -1.164263, -0.8695068, 1, 0.6, 0, 1,
-1.295287, 0.1731741, -2.708747, 1, 0.6078432, 0, 1,
-1.29299, -0.8175195, -1.521512, 1, 0.6117647, 0, 1,
-1.290033, 0.7596579, -2.011205, 1, 0.6196079, 0, 1,
-1.287435, -0.6291717, -1.261676, 1, 0.6235294, 0, 1,
-1.287418, 1.042208, -1.065939, 1, 0.6313726, 0, 1,
-1.287377, 0.2325463, -0.8650323, 1, 0.6352941, 0, 1,
-1.281281, -0.5106467, -1.482599, 1, 0.6431373, 0, 1,
-1.276356, 0.01268568, -2.621975, 1, 0.6470588, 0, 1,
-1.262359, 0.01549088, -0.01718814, 1, 0.654902, 0, 1,
-1.261577, 0.9424003, 0.9443721, 1, 0.6588235, 0, 1,
-1.256231, -0.4943221, -1.162997, 1, 0.6666667, 0, 1,
-1.255044, 0.03582212, -2.856075, 1, 0.6705883, 0, 1,
-1.251971, -0.7992145, -3.340507, 1, 0.6784314, 0, 1,
-1.244951, -0.7367126, -2.271939, 1, 0.682353, 0, 1,
-1.233343, -1.214503, -0.5928833, 1, 0.6901961, 0, 1,
-1.218299, -0.2450475, -2.683673, 1, 0.6941177, 0, 1,
-1.21289, -0.7262362, -2.496105, 1, 0.7019608, 0, 1,
-1.208751, 0.07059118, -1.742118, 1, 0.7098039, 0, 1,
-1.183001, -1.894147, -3.247751, 1, 0.7137255, 0, 1,
-1.182641, -0.6042536, -1.938262, 1, 0.7215686, 0, 1,
-1.181212, 1.155844, -1.680157, 1, 0.7254902, 0, 1,
-1.179893, -2.105913, -2.697921, 1, 0.7333333, 0, 1,
-1.173053, -0.8351368, 0.3151371, 1, 0.7372549, 0, 1,
-1.169732, 0.7411204, 0.0210382, 1, 0.7450981, 0, 1,
-1.169083, -0.4839397, -0.9052177, 1, 0.7490196, 0, 1,
-1.168225, -2.083016, -3.961068, 1, 0.7568628, 0, 1,
-1.167417, -0.2356756, -1.594077, 1, 0.7607843, 0, 1,
-1.16712, 1.370134, -0.8196715, 1, 0.7686275, 0, 1,
-1.165811, 1.297709, -0.1438531, 1, 0.772549, 0, 1,
-1.160633, 0.681501, -1.352491, 1, 0.7803922, 0, 1,
-1.159345, 0.5001829, -2.385902, 1, 0.7843137, 0, 1,
-1.159066, 0.8862183, 0.3787623, 1, 0.7921569, 0, 1,
-1.155322, -1.624359, -2.981097, 1, 0.7960784, 0, 1,
-1.147174, -1.185233, -2.947998, 1, 0.8039216, 0, 1,
-1.122438, 1.585703, -0.8032546, 1, 0.8117647, 0, 1,
-1.122274, -1.206481, -0.2626562, 1, 0.8156863, 0, 1,
-1.120057, 1.702049, -1.999458, 1, 0.8235294, 0, 1,
-1.119486, 1.759971, -0.818241, 1, 0.827451, 0, 1,
-1.110975, 0.8066635, -1.848792, 1, 0.8352941, 0, 1,
-1.110918, 0.1010474, -0.228924, 1, 0.8392157, 0, 1,
-1.110902, -1.339875, -3.293463, 1, 0.8470588, 0, 1,
-1.109042, 0.06919315, -1.777263, 1, 0.8509804, 0, 1,
-1.108144, -1.252038, -2.437936, 1, 0.8588235, 0, 1,
-1.101722, 0.9655321, -1.813128, 1, 0.8627451, 0, 1,
-1.098773, -0.08715124, -2.050077, 1, 0.8705882, 0, 1,
-1.09653, 0.8338474, -1.087, 1, 0.8745098, 0, 1,
-1.090235, -0.09416895, -0.8942077, 1, 0.8823529, 0, 1,
-1.090227, -0.7453137, -2.196277, 1, 0.8862745, 0, 1,
-1.085383, 0.7576382, -1.63394, 1, 0.8941177, 0, 1,
-1.082367, 0.5362599, -0.5101241, 1, 0.8980392, 0, 1,
-1.082219, -1.161045, -2.840161, 1, 0.9058824, 0, 1,
-1.07958, -0.5821826, -1.383904, 1, 0.9137255, 0, 1,
-1.075332, -0.6934462, -1.900236, 1, 0.9176471, 0, 1,
-1.069808, -1.019682, -2.109129, 1, 0.9254902, 0, 1,
-1.054542, -0.009067792, -2.007161, 1, 0.9294118, 0, 1,
-1.048355, 0.4372198, -2.910069, 1, 0.9372549, 0, 1,
-1.043447, 0.7758574, -1.058277, 1, 0.9411765, 0, 1,
-1.040719, -0.7552947, -2.424981, 1, 0.9490196, 0, 1,
-1.036862, 0.668162, -1.682277, 1, 0.9529412, 0, 1,
-1.033491, -2.008203, -2.309692, 1, 0.9607843, 0, 1,
-1.029887, 0.09822235, -4.473608, 1, 0.9647059, 0, 1,
-1.028617, -0.8109378, -1.181974, 1, 0.972549, 0, 1,
-1.023615, -0.3404617, -1.626996, 1, 0.9764706, 0, 1,
-1.018092, 0.8657593, -2.110208, 1, 0.9843137, 0, 1,
-1.017146, 0.9841554, -1.270533, 1, 0.9882353, 0, 1,
-1.012409, 1.574499, -0.4299107, 1, 0.9960784, 0, 1,
-1.009274, 2.037107, 0.4452366, 0.9960784, 1, 0, 1,
-1.008965, 0.4912212, -1.744089, 0.9921569, 1, 0, 1,
-1.008836, -0.4876598, -1.824981, 0.9843137, 1, 0, 1,
-1.006966, -0.8742522, -1.605168, 0.9803922, 1, 0, 1,
-0.9918799, 0.3469385, -2.287357, 0.972549, 1, 0, 1,
-0.9917831, 0.5207542, -1.490577, 0.9686275, 1, 0, 1,
-0.9861358, 0.08666157, -2.197401, 0.9607843, 1, 0, 1,
-0.9774699, -1.371413, -2.92968, 0.9568627, 1, 0, 1,
-0.9764757, 0.3911594, -1.497557, 0.9490196, 1, 0, 1,
-0.9739111, -1.349119, -2.711063, 0.945098, 1, 0, 1,
-0.9736992, -0.8981378, -0.3092098, 0.9372549, 1, 0, 1,
-0.972584, -0.005824297, -0.6005126, 0.9333333, 1, 0, 1,
-0.9710953, -0.5838212, -3.49218, 0.9254902, 1, 0, 1,
-0.9638628, 1.326094, 1.049176, 0.9215686, 1, 0, 1,
-0.9616894, -0.0914886, -0.7785034, 0.9137255, 1, 0, 1,
-0.9585707, -0.3245944, -2.441369, 0.9098039, 1, 0, 1,
-0.9557303, 2.094168, -2.501733, 0.9019608, 1, 0, 1,
-0.9543474, 0.4562879, -2.672747, 0.8941177, 1, 0, 1,
-0.9536705, -0.0136339, -2.720862, 0.8901961, 1, 0, 1,
-0.9518707, 1.726668, -0.9502842, 0.8823529, 1, 0, 1,
-0.941576, -0.0927429, -3.287558, 0.8784314, 1, 0, 1,
-0.928031, -0.04032866, -0.7261324, 0.8705882, 1, 0, 1,
-0.9261416, 0.3929537, -2.918563, 0.8666667, 1, 0, 1,
-0.9222643, 0.1647814, -1.927236, 0.8588235, 1, 0, 1,
-0.9178836, 1.329624, -1.599215, 0.854902, 1, 0, 1,
-0.9145731, 1.212219, -0.4803371, 0.8470588, 1, 0, 1,
-0.9124039, 1.411544, -0.5410233, 0.8431373, 1, 0, 1,
-0.9021677, 0.4155377, -1.925823, 0.8352941, 1, 0, 1,
-0.8922045, 0.6142951, -0.7963025, 0.8313726, 1, 0, 1,
-0.8862191, -2.119074, -3.362006, 0.8235294, 1, 0, 1,
-0.8829589, -0.8484025, -2.753872, 0.8196079, 1, 0, 1,
-0.8826278, -1.053052, -3.278909, 0.8117647, 1, 0, 1,
-0.8714126, -1.344145, -2.829764, 0.8078431, 1, 0, 1,
-0.8703149, -0.06260506, -2.496637, 0.8, 1, 0, 1,
-0.8681797, -0.06694683, -0.7326319, 0.7921569, 1, 0, 1,
-0.8673486, 0.7796826, -1.094893, 0.7882353, 1, 0, 1,
-0.8663507, 1.487238, -1.259771, 0.7803922, 1, 0, 1,
-0.8661361, 1.689705, -0.9059507, 0.7764706, 1, 0, 1,
-0.8643471, 0.1896699, -1.962829, 0.7686275, 1, 0, 1,
-0.8549461, -0.8118019, -1.665741, 0.7647059, 1, 0, 1,
-0.8532865, 0.3119508, -1.656033, 0.7568628, 1, 0, 1,
-0.8494141, -0.9180552, -2.944305, 0.7529412, 1, 0, 1,
-0.8480399, 0.4821409, -1.145771, 0.7450981, 1, 0, 1,
-0.8473722, 1.050575, -0.2026979, 0.7411765, 1, 0, 1,
-0.8396509, 0.6347421, 0.5355794, 0.7333333, 1, 0, 1,
-0.8357088, 1.505958, -0.1148909, 0.7294118, 1, 0, 1,
-0.8300244, 1.449106, 1.053945, 0.7215686, 1, 0, 1,
-0.8286846, 0.506638, -1.398593, 0.7176471, 1, 0, 1,
-0.8285167, -0.425562, -2.51034, 0.7098039, 1, 0, 1,
-0.8262851, 0.7342287, -1.843774, 0.7058824, 1, 0, 1,
-0.8251842, 1.724205, -0.2012141, 0.6980392, 1, 0, 1,
-0.8243534, -1.691517, -0.739907, 0.6901961, 1, 0, 1,
-0.8212591, -0.02308722, -0.5135987, 0.6862745, 1, 0, 1,
-0.8169893, 0.6616673, -0.5982108, 0.6784314, 1, 0, 1,
-0.816085, -1.061751, -3.080411, 0.6745098, 1, 0, 1,
-0.814303, 0.7447809, 1.288623, 0.6666667, 1, 0, 1,
-0.8118602, -0.03747664, 0.2552881, 0.6627451, 1, 0, 1,
-0.8094405, 1.980526, -0.1511273, 0.654902, 1, 0, 1,
-0.8060941, 0.06988156, -2.434704, 0.6509804, 1, 0, 1,
-0.8027126, 1.594887, -2.071408, 0.6431373, 1, 0, 1,
-0.8007439, 0.2963977, -0.7445817, 0.6392157, 1, 0, 1,
-0.8000114, 1.242454, -1.081071, 0.6313726, 1, 0, 1,
-0.7978068, -1.392275, -3.726017, 0.627451, 1, 0, 1,
-0.7951359, -1.453328, -3.332625, 0.6196079, 1, 0, 1,
-0.7918839, 0.1363366, -2.548347, 0.6156863, 1, 0, 1,
-0.7859521, 0.1249996, -2.827834, 0.6078432, 1, 0, 1,
-0.7848037, -1.310498, -3.555916, 0.6039216, 1, 0, 1,
-0.7840483, -0.3349618, -3.204424, 0.5960785, 1, 0, 1,
-0.7832834, 0.4867133, 0.4000455, 0.5882353, 1, 0, 1,
-0.7736772, -0.5127116, -2.945063, 0.5843138, 1, 0, 1,
-0.7735161, -0.5433118, -1.003794, 0.5764706, 1, 0, 1,
-0.7728763, 0.999063, -2.301157, 0.572549, 1, 0, 1,
-0.7662866, -0.2153293, -1.460825, 0.5647059, 1, 0, 1,
-0.7609255, -1.970007, -1.945589, 0.5607843, 1, 0, 1,
-0.7606013, -0.1994973, -1.631049, 0.5529412, 1, 0, 1,
-0.7592728, -0.645926, -1.510538, 0.5490196, 1, 0, 1,
-0.7591543, -2.40594, -1.946573, 0.5411765, 1, 0, 1,
-0.7544099, 0.4563953, 0.06907231, 0.5372549, 1, 0, 1,
-0.7508768, 0.9539719, 0.006834537, 0.5294118, 1, 0, 1,
-0.7455618, -0.6008984, -0.9492043, 0.5254902, 1, 0, 1,
-0.7347561, -0.5406528, -2.869017, 0.5176471, 1, 0, 1,
-0.7345796, 0.1656501, -2.009074, 0.5137255, 1, 0, 1,
-0.7307248, -1.538579, -1.963598, 0.5058824, 1, 0, 1,
-0.7255753, -0.02604809, -1.644629, 0.5019608, 1, 0, 1,
-0.722483, 0.1678981, -2.381226, 0.4941176, 1, 0, 1,
-0.7224339, 0.4597862, -1.57664, 0.4862745, 1, 0, 1,
-0.7145364, 2.876162, -0.05302088, 0.4823529, 1, 0, 1,
-0.711888, -0.7176925, -1.229584, 0.4745098, 1, 0, 1,
-0.7099566, -1.002749, -2.520114, 0.4705882, 1, 0, 1,
-0.6990778, 0.3893278, -1.284276, 0.4627451, 1, 0, 1,
-0.6983798, 2.503451, -0.986304, 0.4588235, 1, 0, 1,
-0.6946755, 0.6215476, -1.035003, 0.4509804, 1, 0, 1,
-0.6933048, -0.5055592, -3.540617, 0.4470588, 1, 0, 1,
-0.693299, -0.001257771, -0.2061451, 0.4392157, 1, 0, 1,
-0.6916828, 0.2409509, 0.2035686, 0.4352941, 1, 0, 1,
-0.6844029, -0.04936188, -0.863755, 0.427451, 1, 0, 1,
-0.6726982, -1.142019, -3.220454, 0.4235294, 1, 0, 1,
-0.6706775, 1.473251, -1.841739, 0.4156863, 1, 0, 1,
-0.6577229, -0.2059417, -1.541582, 0.4117647, 1, 0, 1,
-0.6554272, 0.0115217, -1.706309, 0.4039216, 1, 0, 1,
-0.6518567, -1.767872, -2.333326, 0.3960784, 1, 0, 1,
-0.6468186, 0.4453214, 0.4783743, 0.3921569, 1, 0, 1,
-0.6392232, -0.09513532, -1.673482, 0.3843137, 1, 0, 1,
-0.6335382, -0.6123022, -2.956282, 0.3803922, 1, 0, 1,
-0.6255068, 0.03481374, -2.912907, 0.372549, 1, 0, 1,
-0.6222335, 0.3294912, -0.8717583, 0.3686275, 1, 0, 1,
-0.6191002, 0.6599455, -0.2129936, 0.3607843, 1, 0, 1,
-0.6188837, -0.502309, -1.551253, 0.3568628, 1, 0, 1,
-0.6164806, 0.9041326, -0.8945286, 0.3490196, 1, 0, 1,
-0.6137536, 0.2471013, -0.6997361, 0.345098, 1, 0, 1,
-0.6101186, 2.097349, -0.7049656, 0.3372549, 1, 0, 1,
-0.6029865, -0.365516, -2.319177, 0.3333333, 1, 0, 1,
-0.6022708, 0.7390186, -1.683881, 0.3254902, 1, 0, 1,
-0.5964065, -0.08616496, -1.564626, 0.3215686, 1, 0, 1,
-0.5951625, 0.7342374, -0.8230916, 0.3137255, 1, 0, 1,
-0.5850337, 1.596432, 0.665813, 0.3098039, 1, 0, 1,
-0.5812423, -1.048678, -2.637506, 0.3019608, 1, 0, 1,
-0.57928, 0.1910143, -1.627754, 0.2941177, 1, 0, 1,
-0.5758908, -0.4830495, -2.467148, 0.2901961, 1, 0, 1,
-0.5747762, 1.299576, 0.322538, 0.282353, 1, 0, 1,
-0.5711048, 0.6662005, -0.279032, 0.2784314, 1, 0, 1,
-0.5678527, -0.4863713, -0.784826, 0.2705882, 1, 0, 1,
-0.5617996, -1.458166, -3.855701, 0.2666667, 1, 0, 1,
-0.5610542, -2.372921, -2.717043, 0.2588235, 1, 0, 1,
-0.5597025, -1.002326, -3.002175, 0.254902, 1, 0, 1,
-0.5501445, 1.026097, 1.450936, 0.2470588, 1, 0, 1,
-0.5489467, -0.8138149, -1.504821, 0.2431373, 1, 0, 1,
-0.5470381, -1.414202, -2.911935, 0.2352941, 1, 0, 1,
-0.5440538, -0.2708751, -2.822566, 0.2313726, 1, 0, 1,
-0.5435307, -0.9368806, -2.625235, 0.2235294, 1, 0, 1,
-0.5388166, 1.09371, -2.028524, 0.2196078, 1, 0, 1,
-0.5378689, -0.6552386, -1.249837, 0.2117647, 1, 0, 1,
-0.5370713, 0.3276913, -1.971169, 0.2078431, 1, 0, 1,
-0.5324128, 1.773823, -0.05908517, 0.2, 1, 0, 1,
-0.5320033, 0.4156245, -2.423551, 0.1921569, 1, 0, 1,
-0.5308685, -0.4852242, -2.861167, 0.1882353, 1, 0, 1,
-0.5192098, 0.2075119, -1.422621, 0.1803922, 1, 0, 1,
-0.5182909, -0.4685396, -3.135259, 0.1764706, 1, 0, 1,
-0.5130852, 1.658811, -0.1205285, 0.1686275, 1, 0, 1,
-0.5109829, 0.7415047, 0.06054561, 0.1647059, 1, 0, 1,
-0.5105949, -0.7895817, -0.4620903, 0.1568628, 1, 0, 1,
-0.5071586, -1.431461, -2.674958, 0.1529412, 1, 0, 1,
-0.5036799, -1.260926, -3.565545, 0.145098, 1, 0, 1,
-0.5032535, 0.9953622, 0.9505177, 0.1411765, 1, 0, 1,
-0.5011575, 0.5797464, -1.437307, 0.1333333, 1, 0, 1,
-0.4997065, -0.2825339, -1.174706, 0.1294118, 1, 0, 1,
-0.497292, 0.7056054, -0.1759166, 0.1215686, 1, 0, 1,
-0.4930196, -1.828195, -3.029775, 0.1176471, 1, 0, 1,
-0.4824805, -0.5571088, -2.347269, 0.1098039, 1, 0, 1,
-0.4822178, 0.770338, 2.250113, 0.1058824, 1, 0, 1,
-0.4778184, -1.014492, -1.911264, 0.09803922, 1, 0, 1,
-0.4774125, -0.7997045, -2.596473, 0.09019608, 1, 0, 1,
-0.4759132, 0.2554615, -1.02812, 0.08627451, 1, 0, 1,
-0.4740425, -0.08881368, -0.2265816, 0.07843138, 1, 0, 1,
-0.4624415, -1.029154, -5.014928, 0.07450981, 1, 0, 1,
-0.4600771, -0.05196299, -1.365434, 0.06666667, 1, 0, 1,
-0.4461232, 0.9426082, -0.799301, 0.0627451, 1, 0, 1,
-0.4458326, 2.348035, -0.5776071, 0.05490196, 1, 0, 1,
-0.4445422, -0.2935818, -2.17609, 0.05098039, 1, 0, 1,
-0.4423523, 1.06043, -0.3666089, 0.04313726, 1, 0, 1,
-0.4420403, 0.5517796, -2.442878, 0.03921569, 1, 0, 1,
-0.4403596, 0.07129777, -0.7725244, 0.03137255, 1, 0, 1,
-0.4394654, -1.141047, -4.092246, 0.02745098, 1, 0, 1,
-0.4382304, 0.1831291, -3.733824, 0.01960784, 1, 0, 1,
-0.4359784, -0.1304329, -0.4832876, 0.01568628, 1, 0, 1,
-0.4353248, 1.569372, -0.4437398, 0.007843138, 1, 0, 1,
-0.4279856, 1.50757, -1.219238, 0.003921569, 1, 0, 1,
-0.4232795, -0.07839408, -1.578266, 0, 1, 0.003921569, 1,
-0.4228809, -3.151449, -4.523265, 0, 1, 0.01176471, 1,
-0.4228669, 0.2241129, -2.914191, 0, 1, 0.01568628, 1,
-0.4221263, 0.5926518, -1.101624, 0, 1, 0.02352941, 1,
-0.4176465, 0.9397438, -0.003135884, 0, 1, 0.02745098, 1,
-0.4173747, -0.7995815, -2.623786, 0, 1, 0.03529412, 1,
-0.4108231, 0.8220135, -1.151414, 0, 1, 0.03921569, 1,
-0.4096025, 0.4169922, -0.5917408, 0, 1, 0.04705882, 1,
-0.4070188, -0.360666, -1.723346, 0, 1, 0.05098039, 1,
-0.4008311, -0.7739322, -1.166264, 0, 1, 0.05882353, 1,
-0.3969643, -0.6990776, -2.474801, 0, 1, 0.0627451, 1,
-0.3939005, 0.401149, -1.220631, 0, 1, 0.07058824, 1,
-0.3923113, -0.3585602, -1.476449, 0, 1, 0.07450981, 1,
-0.3914173, -0.4534455, -2.227436, 0, 1, 0.08235294, 1,
-0.3854541, 1.687266, 0.09433795, 0, 1, 0.08627451, 1,
-0.3847635, -0.3221214, -3.483015, 0, 1, 0.09411765, 1,
-0.3840772, -0.1865223, -2.236757, 0, 1, 0.1019608, 1,
-0.3770784, -0.3677, -2.89096, 0, 1, 0.1058824, 1,
-0.3763684, 0.8183125, -1.768581, 0, 1, 0.1137255, 1,
-0.3750008, 0.7338268, -2.469164, 0, 1, 0.1176471, 1,
-0.3723117, 0.4518367, -2.520323, 0, 1, 0.1254902, 1,
-0.3695787, -0.3680987, -0.5272594, 0, 1, 0.1294118, 1,
-0.3639777, 0.4176088, -0.09092765, 0, 1, 0.1372549, 1,
-0.3622447, -1.719451, -1.756817, 0, 1, 0.1411765, 1,
-0.3598814, 0.004696125, -2.133078, 0, 1, 0.1490196, 1,
-0.3588089, 0.1760235, -2.074573, 0, 1, 0.1529412, 1,
-0.3561718, 0.02181117, 0.1965061, 0, 1, 0.1607843, 1,
-0.3535743, -0.8426943, -2.815345, 0, 1, 0.1647059, 1,
-0.3505532, 0.03648068, -1.514447, 0, 1, 0.172549, 1,
-0.3497128, -0.3395426, -1.0837, 0, 1, 0.1764706, 1,
-0.3445552, -0.4952844, -2.994417, 0, 1, 0.1843137, 1,
-0.3375222, -0.07142005, -2.06301, 0, 1, 0.1882353, 1,
-0.3362236, 0.3333578, -0.8825145, 0, 1, 0.1960784, 1,
-0.3347696, -0.0008777872, -0.7587481, 0, 1, 0.2039216, 1,
-0.3338051, 0.1087098, -0.3771965, 0, 1, 0.2078431, 1,
-0.3322069, -0.5255541, -4.969116, 0, 1, 0.2156863, 1,
-0.3303439, -0.1430604, -0.8558977, 0, 1, 0.2196078, 1,
-0.3300691, -1.003976, -3.921114, 0, 1, 0.227451, 1,
-0.3259046, 1.259015, -1.218397, 0, 1, 0.2313726, 1,
-0.3258907, -1.107009, -4.153726, 0, 1, 0.2392157, 1,
-0.3251501, 0.3296325, -0.1948784, 0, 1, 0.2431373, 1,
-0.3237986, -0.2725917, -3.6879, 0, 1, 0.2509804, 1,
-0.3212143, 0.5623958, -0.4761324, 0, 1, 0.254902, 1,
-0.318886, -0.7851449, -2.51519, 0, 1, 0.2627451, 1,
-0.3130875, -1.364921, -3.349484, 0, 1, 0.2666667, 1,
-0.30791, -2.999937, -3.994545, 0, 1, 0.2745098, 1,
-0.3026458, 0.4374476, -1.019132, 0, 1, 0.2784314, 1,
-0.2989483, 0.921601, -0.8635251, 0, 1, 0.2862745, 1,
-0.2964826, 0.6941383, -1.528012, 0, 1, 0.2901961, 1,
-0.2956191, -1.353593, -2.504544, 0, 1, 0.2980392, 1,
-0.2860712, 1.774586, 1.215206, 0, 1, 0.3058824, 1,
-0.2811231, -0.6502773, -2.33142, 0, 1, 0.3098039, 1,
-0.2795321, 0.3800016, -0.03524716, 0, 1, 0.3176471, 1,
-0.2789572, -1.146314, -2.752016, 0, 1, 0.3215686, 1,
-0.2781774, 1.6625, -0.5422342, 0, 1, 0.3294118, 1,
-0.2736663, 1.0493, -0.3234181, 0, 1, 0.3333333, 1,
-0.2617649, 0.005610676, -2.121548, 0, 1, 0.3411765, 1,
-0.2594527, -0.9185202, -4.218729, 0, 1, 0.345098, 1,
-0.2525794, 1.690839, -2.032113, 0, 1, 0.3529412, 1,
-0.2515905, -0.3267688, -2.618302, 0, 1, 0.3568628, 1,
-0.251253, -0.7195006, -4.54531, 0, 1, 0.3647059, 1,
-0.2502612, 0.5611485, -0.1560872, 0, 1, 0.3686275, 1,
-0.2497156, 1.219219, -0.5344296, 0, 1, 0.3764706, 1,
-0.2478745, -0.979573, -4.680349, 0, 1, 0.3803922, 1,
-0.2460428, -0.1324864, -0.8631633, 0, 1, 0.3882353, 1,
-0.2456359, -0.6910418, -4.125054, 0, 1, 0.3921569, 1,
-0.2386028, -1.27153, -3.925131, 0, 1, 0.4, 1,
-0.2278308, -0.1577396, -0.7790929, 0, 1, 0.4078431, 1,
-0.2247553, -0.5992, -3.315107, 0, 1, 0.4117647, 1,
-0.2234675, 1.05792, -1.926955, 0, 1, 0.4196078, 1,
-0.2225972, 0.3221684, -1.047876, 0, 1, 0.4235294, 1,
-0.2220679, -0.333239, -1.242579, 0, 1, 0.4313726, 1,
-0.2189516, -0.7556206, -4.26875, 0, 1, 0.4352941, 1,
-0.2176047, -1.591634, -3.273984, 0, 1, 0.4431373, 1,
-0.2172901, 0.2057176, -0.6746386, 0, 1, 0.4470588, 1,
-0.2157048, -0.5218746, -3.178879, 0, 1, 0.454902, 1,
-0.2117469, 0.1493056, -1.766635, 0, 1, 0.4588235, 1,
-0.2110686, 1.818303, 0.7084863, 0, 1, 0.4666667, 1,
-0.2103471, -0.5699461, -2.397021, 0, 1, 0.4705882, 1,
-0.2073565, 1.039546, -0.07879886, 0, 1, 0.4784314, 1,
-0.2053119, 0.7061428, -1.112656, 0, 1, 0.4823529, 1,
-0.1950242, -1.156469, -2.517563, 0, 1, 0.4901961, 1,
-0.1928899, 1.143087, -2.03862, 0, 1, 0.4941176, 1,
-0.1923039, -0.3593661, -4.103545, 0, 1, 0.5019608, 1,
-0.189244, 0.53382, -0.1641776, 0, 1, 0.509804, 1,
-0.1840498, -0.6085665, -2.932392, 0, 1, 0.5137255, 1,
-0.1820278, -0.9085388, -1.822363, 0, 1, 0.5215687, 1,
-0.1807975, -0.5503991, -2.103824, 0, 1, 0.5254902, 1,
-0.1779183, 2.757818, 0.7134885, 0, 1, 0.5333334, 1,
-0.1768771, -0.5447912, -1.175333, 0, 1, 0.5372549, 1,
-0.1759229, -1.181262, -3.794816, 0, 1, 0.5450981, 1,
-0.1712249, -0.4710003, -2.741546, 0, 1, 0.5490196, 1,
-0.1616282, -0.8064953, -2.210796, 0, 1, 0.5568628, 1,
-0.1558355, -1.15188, -3.317252, 0, 1, 0.5607843, 1,
-0.1549937, 0.3028207, -0.1213363, 0, 1, 0.5686275, 1,
-0.1526349, 0.143833, -0.6305994, 0, 1, 0.572549, 1,
-0.151327, 1.140753, -0.3238332, 0, 1, 0.5803922, 1,
-0.1498681, 1.413603, 0.5119903, 0, 1, 0.5843138, 1,
-0.1490971, 1.18575, -1.217934, 0, 1, 0.5921569, 1,
-0.1487252, 0.5948924, 0.6747074, 0, 1, 0.5960785, 1,
-0.1484973, -0.6109313, -4.102871, 0, 1, 0.6039216, 1,
-0.1478615, -0.2664, -2.127232, 0, 1, 0.6117647, 1,
-0.1447781, 0.5569275, -0.9357145, 0, 1, 0.6156863, 1,
-0.1407798, -0.2876179, -1.667829, 0, 1, 0.6235294, 1,
-0.1358849, 1.254186, 0.8429195, 0, 1, 0.627451, 1,
-0.1335349, 1.422971, -1.055893, 0, 1, 0.6352941, 1,
-0.1314605, -0.9823082, -1.787853, 0, 1, 0.6392157, 1,
-0.1302779, -0.007074606, -2.268842, 0, 1, 0.6470588, 1,
-0.1271149, -0.4597967, -2.48369, 0, 1, 0.6509804, 1,
-0.1206465, -1.122828, -3.11262, 0, 1, 0.6588235, 1,
-0.1203855, 0.8015679, -0.9478353, 0, 1, 0.6627451, 1,
-0.1172119, -1.716531, -4.860492, 0, 1, 0.6705883, 1,
-0.1145208, 0.7906635, 0.307184, 0, 1, 0.6745098, 1,
-0.1136495, 0.9556363, 0.8590333, 0, 1, 0.682353, 1,
-0.1123049, 1.08528, -0.8859193, 0, 1, 0.6862745, 1,
-0.1118007, 0.02864239, 0.7244518, 0, 1, 0.6941177, 1,
-0.1111352, 0.04384851, -2.716595, 0, 1, 0.7019608, 1,
-0.1111316, 0.5418499, -1.259244, 0, 1, 0.7058824, 1,
-0.1100813, -0.6658826, -5.810846, 0, 1, 0.7137255, 1,
-0.1086171, -0.4446791, -3.227047, 0, 1, 0.7176471, 1,
-0.107786, 0.08194879, 0.5056301, 0, 1, 0.7254902, 1,
-0.103082, -1.219749, -3.119502, 0, 1, 0.7294118, 1,
-0.1003277, -0.2121448, -3.728782, 0, 1, 0.7372549, 1,
-0.09891178, -1.22191, -2.896152, 0, 1, 0.7411765, 1,
-0.09862659, 0.2232989, -0.4653663, 0, 1, 0.7490196, 1,
-0.09839222, -1.224896, -1.188451, 0, 1, 0.7529412, 1,
-0.09783399, -0.5562351, -3.107669, 0, 1, 0.7607843, 1,
-0.09406717, 2.334358, 0.642932, 0, 1, 0.7647059, 1,
-0.08841617, -0.01398539, -2.192128, 0, 1, 0.772549, 1,
-0.08414037, -0.5098985, -1.376567, 0, 1, 0.7764706, 1,
-0.08238675, -0.5104636, -3.843851, 0, 1, 0.7843137, 1,
-0.0793004, -1.446706, -4.216904, 0, 1, 0.7882353, 1,
-0.07813717, 0.6608957, 1.592542, 0, 1, 0.7960784, 1,
-0.07380749, 0.7942581, 0.1100088, 0, 1, 0.8039216, 1,
-0.06770698, -0.2360698, -4.418736, 0, 1, 0.8078431, 1,
-0.06643033, 2.19861, 1.280964, 0, 1, 0.8156863, 1,
-0.06364156, 0.8940061, 0.2489622, 0, 1, 0.8196079, 1,
-0.06255391, 0.3897711, -0.2323178, 0, 1, 0.827451, 1,
-0.06157633, 0.730038, -0.9177641, 0, 1, 0.8313726, 1,
-0.05709963, -1.875869, -2.058863, 0, 1, 0.8392157, 1,
-0.05628472, -0.3722319, -3.617077, 0, 1, 0.8431373, 1,
-0.05531696, -0.6482436, -3.966634, 0, 1, 0.8509804, 1,
-0.05045566, -1.615599, -3.705787, 0, 1, 0.854902, 1,
-0.04810337, 0.5830182, 0.4047352, 0, 1, 0.8627451, 1,
-0.04757341, 1.050155, 0.228221, 0, 1, 0.8666667, 1,
-0.04710867, 0.2184166, -0.486722, 0, 1, 0.8745098, 1,
-0.0460278, 0.2088389, -1.307363, 0, 1, 0.8784314, 1,
-0.04562789, 1.132866, 1.921542, 0, 1, 0.8862745, 1,
-0.04560111, -0.7832978, -4.247558, 0, 1, 0.8901961, 1,
-0.04381486, 0.08590042, -0.2566898, 0, 1, 0.8980392, 1,
-0.04143516, 1.263406, 0.4379041, 0, 1, 0.9058824, 1,
-0.04088854, 0.6226006, 0.2336043, 0, 1, 0.9098039, 1,
-0.04046051, 1.024642, -2.156531, 0, 1, 0.9176471, 1,
-0.03701842, 0.2462465, -0.5794541, 0, 1, 0.9215686, 1,
-0.03093753, -0.7432323, -3.348181, 0, 1, 0.9294118, 1,
-0.02576616, 1.740507, -0.9027494, 0, 1, 0.9333333, 1,
-0.02549841, 3.057165, -1.158806, 0, 1, 0.9411765, 1,
-0.02392828, 2.537466, 0.4221312, 0, 1, 0.945098, 1,
-0.02278041, 0.5654126, -0.6643522, 0, 1, 0.9529412, 1,
-0.02216511, 0.4879523, 1.231791, 0, 1, 0.9568627, 1,
-0.01863501, -1.747279, -2.804504, 0, 1, 0.9647059, 1,
-0.01625927, 2.070921, -0.9255193, 0, 1, 0.9686275, 1,
-0.01509278, 1.152531, -0.6444628, 0, 1, 0.9764706, 1,
-0.01387001, 0.5621549, 0.3905997, 0, 1, 0.9803922, 1,
-0.01331744, 1.43409, -0.4248214, 0, 1, 0.9882353, 1,
-0.01245445, 0.1506655, -0.7090465, 0, 1, 0.9921569, 1,
-0.01051991, 0.5730787, 1.255184, 0, 1, 1, 1,
-0.004525315, -1.057602, -2.829406, 0, 0.9921569, 1, 1,
-0.00382266, 0.3673801, 1.638894, 0, 0.9882353, 1, 1,
0.0005675079, -0.3485329, 5.281161, 0, 0.9803922, 1, 1,
0.0006318539, -0.1425039, 2.325356, 0, 0.9764706, 1, 1,
0.001328738, -0.4095371, 1.87455, 0, 0.9686275, 1, 1,
0.002073444, -0.4127375, 2.794994, 0, 0.9647059, 1, 1,
0.002360455, -1.57309, 4.595144, 0, 0.9568627, 1, 1,
0.008792835, -0.8226447, 3.751077, 0, 0.9529412, 1, 1,
0.008814609, -0.2264322, 3.735655, 0, 0.945098, 1, 1,
0.008934933, -0.507615, 3.252832, 0, 0.9411765, 1, 1,
0.0103088, 0.9159819, 2.298975, 0, 0.9333333, 1, 1,
0.01555348, 0.3562079, 2.020268, 0, 0.9294118, 1, 1,
0.01561866, 0.1796289, 0.7676295, 0, 0.9215686, 1, 1,
0.0164864, -0.6798898, 3.405434, 0, 0.9176471, 1, 1,
0.01871042, 0.4050444, 0.7844969, 0, 0.9098039, 1, 1,
0.02431772, -0.1213305, 3.820022, 0, 0.9058824, 1, 1,
0.02590135, -0.4044171, 3.212587, 0, 0.8980392, 1, 1,
0.02902165, 1.412866, 0.7120032, 0, 0.8901961, 1, 1,
0.03006942, 0.1666826, 0.6156442, 0, 0.8862745, 1, 1,
0.03112584, -0.07353862, 3.973196, 0, 0.8784314, 1, 1,
0.04172924, 1.168067, 0.005616345, 0, 0.8745098, 1, 1,
0.04284946, -0.9201702, 2.905191, 0, 0.8666667, 1, 1,
0.04336923, -0.1785211, 4.656787, 0, 0.8627451, 1, 1,
0.04432062, -1.661065, 3.058331, 0, 0.854902, 1, 1,
0.04999594, 0.7079475, 2.009063, 0, 0.8509804, 1, 1,
0.05131546, -1.149654, 1.932959, 0, 0.8431373, 1, 1,
0.05139815, 2.27953, 0.04041914, 0, 0.8392157, 1, 1,
0.0535674, -2.048615, 0.7800378, 0, 0.8313726, 1, 1,
0.05441681, -1.005221, 2.569109, 0, 0.827451, 1, 1,
0.0559739, -0.5672711, 2.924069, 0, 0.8196079, 1, 1,
0.05665641, 0.293344, -0.9325562, 0, 0.8156863, 1, 1,
0.05976181, -0.2841311, 1.707341, 0, 0.8078431, 1, 1,
0.05979845, -0.42809, 3.168379, 0, 0.8039216, 1, 1,
0.06051748, -0.1948163, 2.951092, 0, 0.7960784, 1, 1,
0.06066466, -0.7199564, 2.191071, 0, 0.7882353, 1, 1,
0.06210958, 0.9926902, -0.165356, 0, 0.7843137, 1, 1,
0.07326219, -0.8547563, 2.97777, 0, 0.7764706, 1, 1,
0.07596979, 0.5045024, 0.8256957, 0, 0.772549, 1, 1,
0.07630423, 1.64147, 1.036566, 0, 0.7647059, 1, 1,
0.08423121, 0.3832232, 0.02490666, 0, 0.7607843, 1, 1,
0.08937232, 0.9668056, -0.1914467, 0, 0.7529412, 1, 1,
0.09466867, -2.065825, 5.0369, 0, 0.7490196, 1, 1,
0.100466, -0.5132608, 3.830914, 0, 0.7411765, 1, 1,
0.1026311, 2.113806, 0.3830765, 0, 0.7372549, 1, 1,
0.104317, -1.148515, 3.495851, 0, 0.7294118, 1, 1,
0.1084871, -0.6039758, 2.814032, 0, 0.7254902, 1, 1,
0.1189279, -0.5928085, 2.953946, 0, 0.7176471, 1, 1,
0.1227637, -1.56336, 4.732243, 0, 0.7137255, 1, 1,
0.1240744, 1.009197, -0.1650542, 0, 0.7058824, 1, 1,
0.1254166, -0.2304458, 2.697399, 0, 0.6980392, 1, 1,
0.1258178, 0.567253, -1.164471, 0, 0.6941177, 1, 1,
0.1265694, 0.3261888, -1.493964, 0, 0.6862745, 1, 1,
0.1288361, -0.01456054, 1.328875, 0, 0.682353, 1, 1,
0.1308244, 1.378503, 0.3788196, 0, 0.6745098, 1, 1,
0.1313151, -1.374497, 2.492226, 0, 0.6705883, 1, 1,
0.1327175, 0.4746029, -0.6742588, 0, 0.6627451, 1, 1,
0.1362804, -1.161888, 3.595817, 0, 0.6588235, 1, 1,
0.1419943, -1.534601, 2.343071, 0, 0.6509804, 1, 1,
0.1424974, 0.1451313, 0.6824945, 0, 0.6470588, 1, 1,
0.1429626, 0.1049621, 0.2072794, 0, 0.6392157, 1, 1,
0.143637, 1.638394, 1.836031, 0, 0.6352941, 1, 1,
0.1459245, 1.72999, 1.298566, 0, 0.627451, 1, 1,
0.14959, 0.1948738, 1.559775, 0, 0.6235294, 1, 1,
0.1531483, 1.048887, 0.4044227, 0, 0.6156863, 1, 1,
0.1553929, 0.2400838, 0.4632192, 0, 0.6117647, 1, 1,
0.1585908, 1.273547, 0.6767625, 0, 0.6039216, 1, 1,
0.1594813, -2.833116, 2.595989, 0, 0.5960785, 1, 1,
0.1655024, 1.029031, 0.5505844, 0, 0.5921569, 1, 1,
0.1657903, 0.5038968, 0.4367481, 0, 0.5843138, 1, 1,
0.1710987, -0.6077947, 3.258117, 0, 0.5803922, 1, 1,
0.1758585, 0.7230493, 1.653474, 0, 0.572549, 1, 1,
0.1867344, -1.468067, 1.775815, 0, 0.5686275, 1, 1,
0.187759, -1.078555, 1.362594, 0, 0.5607843, 1, 1,
0.1899828, -0.603475, 3.433466, 0, 0.5568628, 1, 1,
0.1901049, -0.4888066, 3.414787, 0, 0.5490196, 1, 1,
0.1903654, -0.5174471, 3.677923, 0, 0.5450981, 1, 1,
0.1950367, -0.6725634, 2.813724, 0, 0.5372549, 1, 1,
0.195816, 0.01870301, 2.34409, 0, 0.5333334, 1, 1,
0.1975197, -1.139537, 2.533489, 0, 0.5254902, 1, 1,
0.19904, -1.554794, 2.971936, 0, 0.5215687, 1, 1,
0.2009715, 1.37449, 1.720215, 0, 0.5137255, 1, 1,
0.2064728, 0.7348115, -1.072342, 0, 0.509804, 1, 1,
0.209616, 0.522563, -0.3136269, 0, 0.5019608, 1, 1,
0.2138594, -1.034264, 2.882895, 0, 0.4941176, 1, 1,
0.215397, -0.3088919, 2.138023, 0, 0.4901961, 1, 1,
0.2157533, -0.8860106, 3.555288, 0, 0.4823529, 1, 1,
0.216301, 0.5410843, -0.2238972, 0, 0.4784314, 1, 1,
0.2178524, -1.482225, 1.308018, 0, 0.4705882, 1, 1,
0.2183319, -1.745666, 3.05024, 0, 0.4666667, 1, 1,
0.2209487, 0.2595937, -0.0434639, 0, 0.4588235, 1, 1,
0.2227412, 2.821323, -1.415236, 0, 0.454902, 1, 1,
0.2233378, -0.469303, 1.056152, 0, 0.4470588, 1, 1,
0.2253056, -0.3194609, 2.574476, 0, 0.4431373, 1, 1,
0.225636, -0.6312634, 2.490619, 0, 0.4352941, 1, 1,
0.2269227, 1.757693, -0.227195, 0, 0.4313726, 1, 1,
0.2324671, 0.03822105, 2.392088, 0, 0.4235294, 1, 1,
0.2338551, -0.2314445, 2.922838, 0, 0.4196078, 1, 1,
0.2340519, 1.856808, 1.532849, 0, 0.4117647, 1, 1,
0.2365711, 1.356322, 1.171378, 0, 0.4078431, 1, 1,
0.2397275, 0.5132551, 1.552452, 0, 0.4, 1, 1,
0.2400644, -1.475462, 5.208753, 0, 0.3921569, 1, 1,
0.2408785, 2.448776, -0.9947993, 0, 0.3882353, 1, 1,
0.2418394, -0.04590071, 2.159552, 0, 0.3803922, 1, 1,
0.2441488, 1.835008, -0.7819843, 0, 0.3764706, 1, 1,
0.2548858, -0.6539702, 2.140693, 0, 0.3686275, 1, 1,
0.2572199, 2.223819, 0.07644911, 0, 0.3647059, 1, 1,
0.2624158, -0.7088053, 3.892786, 0, 0.3568628, 1, 1,
0.2625223, -0.1458883, 1.445994, 0, 0.3529412, 1, 1,
0.2634356, -0.8370927, 2.678385, 0, 0.345098, 1, 1,
0.2656016, 0.3502863, 1.97504, 0, 0.3411765, 1, 1,
0.2704664, -1.673176, 3.128141, 0, 0.3333333, 1, 1,
0.2706104, 0.1715967, 0.3016495, 0, 0.3294118, 1, 1,
0.2750203, 1.126402, -0.7563865, 0, 0.3215686, 1, 1,
0.2786393, 0.544997, 0.8999568, 0, 0.3176471, 1, 1,
0.2796776, 0.895379, -1.396674, 0, 0.3098039, 1, 1,
0.2837057, 1.520982, -0.380006, 0, 0.3058824, 1, 1,
0.2848015, -0.4095801, 3.053916, 0, 0.2980392, 1, 1,
0.2850555, 0.6308995, -0.08540832, 0, 0.2901961, 1, 1,
0.2894294, -0.8426241, 3.485206, 0, 0.2862745, 1, 1,
0.2903628, -0.07578316, 1.169768, 0, 0.2784314, 1, 1,
0.2925017, -0.16704, 1.007966, 0, 0.2745098, 1, 1,
0.2957845, -0.1214976, 1.130944, 0, 0.2666667, 1, 1,
0.2994213, -0.8904751, 2.316036, 0, 0.2627451, 1, 1,
0.3024678, 2.503973, -0.4165454, 0, 0.254902, 1, 1,
0.3024784, -1.093722, 2.494529, 0, 0.2509804, 1, 1,
0.3027031, 0.3473633, -0.8163339, 0, 0.2431373, 1, 1,
0.3069532, -0.5419405, 2.114584, 0, 0.2392157, 1, 1,
0.3092014, -0.9744091, 4.308053, 0, 0.2313726, 1, 1,
0.309548, 0.6328529, 1.936817, 0, 0.227451, 1, 1,
0.3102207, 1.949922, 0.5485108, 0, 0.2196078, 1, 1,
0.3111279, 1.263929, 2.73618, 0, 0.2156863, 1, 1,
0.31134, 0.6528465, 0.009316026, 0, 0.2078431, 1, 1,
0.3119607, -1.926331, 3.171739, 0, 0.2039216, 1, 1,
0.3135968, 2.162803, 0.819529, 0, 0.1960784, 1, 1,
0.314514, -0.5436092, 4.107361, 0, 0.1882353, 1, 1,
0.3163115, 1.434114, 0.9988804, 0, 0.1843137, 1, 1,
0.3207858, 0.3246956, 2.001, 0, 0.1764706, 1, 1,
0.321531, -1.029682, 2.312804, 0, 0.172549, 1, 1,
0.3221874, 0.4652325, 0.3322721, 0, 0.1647059, 1, 1,
0.3239532, 0.381514, 1.388211, 0, 0.1607843, 1, 1,
0.3243658, -0.4097537, 1.722902, 0, 0.1529412, 1, 1,
0.3254424, -0.4052447, 1.21585, 0, 0.1490196, 1, 1,
0.3254511, 0.6814055, 1.054037, 0, 0.1411765, 1, 1,
0.3385038, -1.360927, 1.877215, 0, 0.1372549, 1, 1,
0.3451205, -0.7339612, 1.106797, 0, 0.1294118, 1, 1,
0.3512342, 1.852874, -0.2403747, 0, 0.1254902, 1, 1,
0.3614548, -1.483477, 2.761436, 0, 0.1176471, 1, 1,
0.3632407, 1.248577, 1.522363, 0, 0.1137255, 1, 1,
0.363984, 0.05367303, 0.9757754, 0, 0.1058824, 1, 1,
0.367034, 0.1042707, 1.370101, 0, 0.09803922, 1, 1,
0.3670844, 0.874908, 0.3421679, 0, 0.09411765, 1, 1,
0.3688679, 1.294789, 0.8439065, 0, 0.08627451, 1, 1,
0.3693951, 0.3690598, 1.78926, 0, 0.08235294, 1, 1,
0.3702563, -0.9734705, 2.665563, 0, 0.07450981, 1, 1,
0.3706751, 1.431543, -0.2576016, 0, 0.07058824, 1, 1,
0.3741474, -1.319399, 3.548002, 0, 0.0627451, 1, 1,
0.3790161, 2.182061, 0.1085349, 0, 0.05882353, 1, 1,
0.381843, -0.8997324, 3.08088, 0, 0.05098039, 1, 1,
0.3842354, -1.250562, 2.093594, 0, 0.04705882, 1, 1,
0.3868978, 0.844534, 0.3447307, 0, 0.03921569, 1, 1,
0.3875863, 1.389436, 0.3417995, 0, 0.03529412, 1, 1,
0.3883699, 0.5847771, 1.13765, 0, 0.02745098, 1, 1,
0.3884815, 1.138639, 0.5193887, 0, 0.02352941, 1, 1,
0.3919956, -0.6094683, 3.34974, 0, 0.01568628, 1, 1,
0.3932866, 1.104295, 0.7062581, 0, 0.01176471, 1, 1,
0.3946038, -0.6084764, 1.974624, 0, 0.003921569, 1, 1,
0.3947573, -1.585388, 3.97049, 0.003921569, 0, 1, 1,
0.3965024, 0.2379696, 1.617571, 0.007843138, 0, 1, 1,
0.3988332, -1.256285, 2.203646, 0.01568628, 0, 1, 1,
0.4036983, -0.9281775, 3.055232, 0.01960784, 0, 1, 1,
0.4047846, -1.090171, 2.896663, 0.02745098, 0, 1, 1,
0.4099127, -0.9195071, 1.985028, 0.03137255, 0, 1, 1,
0.4112069, 1.577587, -0.411495, 0.03921569, 0, 1, 1,
0.4200498, -1.755912, 2.656069, 0.04313726, 0, 1, 1,
0.4230539, 0.6188787, 0.2081248, 0.05098039, 0, 1, 1,
0.4240759, -1.702259, 1.738071, 0.05490196, 0, 1, 1,
0.4264303, 1.224441, -1.420493, 0.0627451, 0, 1, 1,
0.4273934, 0.04507098, 1.072802, 0.06666667, 0, 1, 1,
0.4277124, -1.184227, 2.517033, 0.07450981, 0, 1, 1,
0.4311807, -1.057114, 2.09392, 0.07843138, 0, 1, 1,
0.4320651, 0.8289903, -0.08185844, 0.08627451, 0, 1, 1,
0.4335432, 1.420926, -0.8537262, 0.09019608, 0, 1, 1,
0.4368469, 1.168174, 2.225035, 0.09803922, 0, 1, 1,
0.4373893, 0.9579335, 1.056118, 0.1058824, 0, 1, 1,
0.4486251, -0.4238924, 5.040707, 0.1098039, 0, 1, 1,
0.4510485, 2.571526, -1.354004, 0.1176471, 0, 1, 1,
0.4552407, 0.4971642, 0.6811349, 0.1215686, 0, 1, 1,
0.4556924, -1.326163, 1.952403, 0.1294118, 0, 1, 1,
0.4570506, -0.3369238, 1.389827, 0.1333333, 0, 1, 1,
0.4590687, -0.5768191, 1.389774, 0.1411765, 0, 1, 1,
0.4601593, 0.5240261, 2.101506, 0.145098, 0, 1, 1,
0.461667, 0.8862614, 0.3503321, 0.1529412, 0, 1, 1,
0.4636125, 0.9910097, 0.8116331, 0.1568628, 0, 1, 1,
0.4680739, -0.7588354, 1.847701, 0.1647059, 0, 1, 1,
0.468994, 0.7203926, 0.09323177, 0.1686275, 0, 1, 1,
0.4811352, 0.1049735, 1.631483, 0.1764706, 0, 1, 1,
0.4818473, -3.482481, 4.360928, 0.1803922, 0, 1, 1,
0.4833972, -1.977004, 3.162209, 0.1882353, 0, 1, 1,
0.4836189, -0.03313387, 1.847793, 0.1921569, 0, 1, 1,
0.4847269, -0.480578, 3.087464, 0.2, 0, 1, 1,
0.4988812, 1.553462, 1.380499, 0.2078431, 0, 1, 1,
0.4992165, 0.1123548, 3.463705, 0.2117647, 0, 1, 1,
0.4992814, -0.6988767, 1.373796, 0.2196078, 0, 1, 1,
0.5045001, 0.7244304, 0.8993407, 0.2235294, 0, 1, 1,
0.5046402, -0.560545, 2.637168, 0.2313726, 0, 1, 1,
0.505039, -0.5304609, 2.759468, 0.2352941, 0, 1, 1,
0.50687, 1.627941, -0.07790299, 0.2431373, 0, 1, 1,
0.5072727, -1.35219, 3.224046, 0.2470588, 0, 1, 1,
0.5087244, 0.2119434, 1.242917, 0.254902, 0, 1, 1,
0.513304, -0.2201189, 2.92227, 0.2588235, 0, 1, 1,
0.5135351, -1.221698, 0.9390291, 0.2666667, 0, 1, 1,
0.5149835, 0.06963209, 0.6945488, 0.2705882, 0, 1, 1,
0.5157438, 0.6054314, 2.397984, 0.2784314, 0, 1, 1,
0.516345, -0.6293012, 2.052647, 0.282353, 0, 1, 1,
0.5203556, 0.7892424, -0.7518729, 0.2901961, 0, 1, 1,
0.5225996, 0.896726, -1.495088, 0.2941177, 0, 1, 1,
0.5228266, 1.045657, 0.1057933, 0.3019608, 0, 1, 1,
0.5230869, 1.863001, 0.8753639, 0.3098039, 0, 1, 1,
0.5244687, -0.1773616, 4.396258, 0.3137255, 0, 1, 1,
0.5248746, 1.845012, 1.512865, 0.3215686, 0, 1, 1,
0.5259259, -0.3576875, 1.940904, 0.3254902, 0, 1, 1,
0.5265718, 1.173519, 0.4503953, 0.3333333, 0, 1, 1,
0.5351214, 0.1378537, 0.04065232, 0.3372549, 0, 1, 1,
0.5378811, -0.2418606, 2.378764, 0.345098, 0, 1, 1,
0.5381026, -0.1978835, 1.073072, 0.3490196, 0, 1, 1,
0.5396306, -0.8042629, 0.7455506, 0.3568628, 0, 1, 1,
0.5445636, -0.1146471, 2.770907, 0.3607843, 0, 1, 1,
0.5457901, -0.4991355, 3.674939, 0.3686275, 0, 1, 1,
0.5491927, 2.144158, 1.053547, 0.372549, 0, 1, 1,
0.5517733, -2.859409, 1.491227, 0.3803922, 0, 1, 1,
0.5541368, 2.064533, 0.6883888, 0.3843137, 0, 1, 1,
0.5542531, -2.198188, 2.603257, 0.3921569, 0, 1, 1,
0.5547114, 1.240477, 0.3431962, 0.3960784, 0, 1, 1,
0.5642189, -0.2377702, 3.164617, 0.4039216, 0, 1, 1,
0.5644594, -0.4004272, 2.53847, 0.4117647, 0, 1, 1,
0.566631, 1.10648, -1.028581, 0.4156863, 0, 1, 1,
0.5695897, 0.8127391, -0.6830337, 0.4235294, 0, 1, 1,
0.5701858, 0.4866442, 0.4646115, 0.427451, 0, 1, 1,
0.5709605, -0.09885693, 1.058903, 0.4352941, 0, 1, 1,
0.5788394, 0.9323043, 2.360468, 0.4392157, 0, 1, 1,
0.5818332, 0.5164766, 0.07652111, 0.4470588, 0, 1, 1,
0.5828569, 0.8295323, 0.5379028, 0.4509804, 0, 1, 1,
0.5839755, -1.155336, 3.503996, 0.4588235, 0, 1, 1,
0.5862136, -0.4819391, 2.480735, 0.4627451, 0, 1, 1,
0.5974439, 0.5711836, 1.908923, 0.4705882, 0, 1, 1,
0.5998637, 0.9063158, -0.3882704, 0.4745098, 0, 1, 1,
0.6001926, 0.998614, 0.4477601, 0.4823529, 0, 1, 1,
0.6020685, 0.639487, 0.4883851, 0.4862745, 0, 1, 1,
0.6069306, 0.9877127, -0.3757155, 0.4941176, 0, 1, 1,
0.609639, 0.05009646, 0.7210236, 0.5019608, 0, 1, 1,
0.6111628, 0.7993021, 0.1349155, 0.5058824, 0, 1, 1,
0.611461, -0.4138407, 1.13578, 0.5137255, 0, 1, 1,
0.6124845, 1.880414, -0.93128, 0.5176471, 0, 1, 1,
0.6150041, -1.380113, 2.583379, 0.5254902, 0, 1, 1,
0.6174937, 2.385992, 1.543305, 0.5294118, 0, 1, 1,
0.6210196, 1.862794, 1.405574, 0.5372549, 0, 1, 1,
0.6211853, -1.527287, 4.286568, 0.5411765, 0, 1, 1,
0.6215466, 0.7633867, -0.6574724, 0.5490196, 0, 1, 1,
0.6391879, -0.2450054, 2.381588, 0.5529412, 0, 1, 1,
0.6417357, -1.542673, 4.438201, 0.5607843, 0, 1, 1,
0.6444151, -0.7049603, 3.161293, 0.5647059, 0, 1, 1,
0.645174, -0.1626356, 1.683074, 0.572549, 0, 1, 1,
0.6487358, 0.2284508, 1.377993, 0.5764706, 0, 1, 1,
0.6508697, -0.3292553, 2.571254, 0.5843138, 0, 1, 1,
0.6527275, 2.316132, 0.2928146, 0.5882353, 0, 1, 1,
0.6588482, 1.086903, 0.4392623, 0.5960785, 0, 1, 1,
0.6604367, -1.22086, 2.706508, 0.6039216, 0, 1, 1,
0.6636727, -1.34012, 3.248321, 0.6078432, 0, 1, 1,
0.6645334, 1.324836, 1.248044, 0.6156863, 0, 1, 1,
0.6666721, 0.1138463, 0.1076632, 0.6196079, 0, 1, 1,
0.6708096, -1.022429, 3.952662, 0.627451, 0, 1, 1,
0.671362, 0.3493429, 1.441111, 0.6313726, 0, 1, 1,
0.6731913, -0.8012275, -0.3770115, 0.6392157, 0, 1, 1,
0.6753854, 2.321872, 0.8581902, 0.6431373, 0, 1, 1,
0.6821319, -0.1901839, 2.476307, 0.6509804, 0, 1, 1,
0.686407, 0.40834, 1.038081, 0.654902, 0, 1, 1,
0.6864857, -0.8128989, 2.268878, 0.6627451, 0, 1, 1,
0.6925744, 0.8059216, 1.373707, 0.6666667, 0, 1, 1,
0.6949822, 0.246886, 1.076845, 0.6745098, 0, 1, 1,
0.7027283, -2.000449, 1.502105, 0.6784314, 0, 1, 1,
0.7038274, 0.4978052, 1.270736, 0.6862745, 0, 1, 1,
0.7040213, 0.3925701, 2.08356, 0.6901961, 0, 1, 1,
0.7064447, 0.1847337, 1.21542, 0.6980392, 0, 1, 1,
0.7077575, -0.6702113, 1.694626, 0.7058824, 0, 1, 1,
0.7105033, 1.453387, 1.738606, 0.7098039, 0, 1, 1,
0.7125923, -0.337532, 2.237486, 0.7176471, 0, 1, 1,
0.7202963, 0.4045103, 0.5935726, 0.7215686, 0, 1, 1,
0.7212289, -0.3067934, 2.181081, 0.7294118, 0, 1, 1,
0.7258906, -0.3176169, 2.902353, 0.7333333, 0, 1, 1,
0.7260541, 0.008357512, -0.3579569, 0.7411765, 0, 1, 1,
0.7269452, -0.03122593, 0.8356526, 0.7450981, 0, 1, 1,
0.7292991, 0.6518437, 0.2317622, 0.7529412, 0, 1, 1,
0.7294682, -1.219466, 0.8069894, 0.7568628, 0, 1, 1,
0.7412702, 0.2901019, 1.302069, 0.7647059, 0, 1, 1,
0.74257, 1.516629, 0.4399821, 0.7686275, 0, 1, 1,
0.7575415, -1.744545, 2.396859, 0.7764706, 0, 1, 1,
0.7590714, -0.06658707, -0.252235, 0.7803922, 0, 1, 1,
0.7635896, -0.7545131, 3.743505, 0.7882353, 0, 1, 1,
0.7659332, -0.4581009, 1.73111, 0.7921569, 0, 1, 1,
0.7687116, 1.05758, 1.614178, 0.8, 0, 1, 1,
0.7700325, -1.51248, 1.128762, 0.8078431, 0, 1, 1,
0.7727299, -0.07609703, 1.486844, 0.8117647, 0, 1, 1,
0.7763036, -2.229822, 3.932646, 0.8196079, 0, 1, 1,
0.784484, 0.7334113, -0.05523078, 0.8235294, 0, 1, 1,
0.7975551, 0.5278037, 1.192531, 0.8313726, 0, 1, 1,
0.8041152, -1.71834, 3.248921, 0.8352941, 0, 1, 1,
0.80479, -1.261532, 1.633173, 0.8431373, 0, 1, 1,
0.8049047, -1.234363, 3.75554, 0.8470588, 0, 1, 1,
0.8168266, 0.9008397, 2.040428, 0.854902, 0, 1, 1,
0.8299593, 2.360909, 0.09493424, 0.8588235, 0, 1, 1,
0.8325481, -0.2766415, 1.998691, 0.8666667, 0, 1, 1,
0.8350064, -1.017609, 2.797908, 0.8705882, 0, 1, 1,
0.8352758, -0.03388556, 1.915771, 0.8784314, 0, 1, 1,
0.8394019, 1.621765, 1.454341, 0.8823529, 0, 1, 1,
0.8412002, 0.1985245, 1.877251, 0.8901961, 0, 1, 1,
0.8427402, 0.2528389, 0.03788096, 0.8941177, 0, 1, 1,
0.8433407, -0.8857468, 2.176327, 0.9019608, 0, 1, 1,
0.843789, 1.159892, 0.4225233, 0.9098039, 0, 1, 1,
0.8492439, -1.567493, 2.902529, 0.9137255, 0, 1, 1,
0.8499811, -1.254491, 3.77428, 0.9215686, 0, 1, 1,
0.8520581, -0.4205188, 4.131703, 0.9254902, 0, 1, 1,
0.8525819, -0.6915486, 2.745223, 0.9333333, 0, 1, 1,
0.8595505, -0.05823699, 2.11796, 0.9372549, 0, 1, 1,
0.8602515, -1.173941, 3.492451, 0.945098, 0, 1, 1,
0.8683434, -0.02983433, 0.05101856, 0.9490196, 0, 1, 1,
0.8776968, -1.536748, 0.9388363, 0.9568627, 0, 1, 1,
0.877731, -0.2760597, 2.136065, 0.9607843, 0, 1, 1,
0.8793218, -0.6017175, 1.019392, 0.9686275, 0, 1, 1,
0.8804243, 1.038019, 1.397524, 0.972549, 0, 1, 1,
0.8869424, -1.579942, 3.162749, 0.9803922, 0, 1, 1,
0.887305, 0.7089799, 0.1649213, 0.9843137, 0, 1, 1,
0.8873139, -0.5541738, 1.805008, 0.9921569, 0, 1, 1,
0.8983768, -1.247538, 0.6584682, 0.9960784, 0, 1, 1,
0.9094181, -0.934612, 2.366495, 1, 0, 0.9960784, 1,
0.914641, -0.7642529, 2.414346, 1, 0, 0.9882353, 1,
0.9193852, -1.408124, 2.093728, 1, 0, 0.9843137, 1,
0.926562, 0.8481606, 0.6605356, 1, 0, 0.9764706, 1,
0.9268854, -0.3014655, 3.742148, 1, 0, 0.972549, 1,
0.9273248, -2.097152, 2.132447, 1, 0, 0.9647059, 1,
0.9294422, -1.252378, 1.713608, 1, 0, 0.9607843, 1,
0.933452, 0.5168885, 0.2098853, 1, 0, 0.9529412, 1,
0.9512342, -1.00037, 1.871911, 1, 0, 0.9490196, 1,
0.9582137, 0.4809422, 0.4537895, 1, 0, 0.9411765, 1,
0.9676217, 0.3443198, 1.667054, 1, 0, 0.9372549, 1,
0.9710956, -1.054343, 2.202714, 1, 0, 0.9294118, 1,
0.9727788, 1.208599, 0.4681659, 1, 0, 0.9254902, 1,
0.982136, -1.329153, 3.158551, 1, 0, 0.9176471, 1,
0.9873294, 0.9009784, 0.07168364, 1, 0, 0.9137255, 1,
0.9874282, 0.4102186, 1.818223, 1, 0, 0.9058824, 1,
0.9926147, 0.9910616, -0.738804, 1, 0, 0.9019608, 1,
0.9971899, 2.266102, 0.7021683, 1, 0, 0.8941177, 1,
1.001129, 0.5660167, 1.403118, 1, 0, 0.8862745, 1,
1.008568, 0.3987378, 0.3021762, 1, 0, 0.8823529, 1,
1.008819, -1.144987, 3.573061, 1, 0, 0.8745098, 1,
1.012366, -2.072035, 2.150902, 1, 0, 0.8705882, 1,
1.018271, 1.741566, -0.513499, 1, 0, 0.8627451, 1,
1.021443, 0.5423549, 1.241547, 1, 0, 0.8588235, 1,
1.025904, -0.1712649, 1.361302, 1, 0, 0.8509804, 1,
1.032181, 1.2099, -0.3516016, 1, 0, 0.8470588, 1,
1.03489, -0.2247669, 0.4892763, 1, 0, 0.8392157, 1,
1.03811, -0.7439638, 1.624183, 1, 0, 0.8352941, 1,
1.053698, -0.2342614, 0.5285523, 1, 0, 0.827451, 1,
1.058965, -0.0869467, 1.290509, 1, 0, 0.8235294, 1,
1.061776, -0.2162629, 0.5295492, 1, 0, 0.8156863, 1,
1.06451, -0.003985691, 1.018801, 1, 0, 0.8117647, 1,
1.081524, 0.8688757, 0.4304084, 1, 0, 0.8039216, 1,
1.087421, 0.7352384, 2.191166, 1, 0, 0.7960784, 1,
1.087467, -0.1946075, 2.86896, 1, 0, 0.7921569, 1,
1.094062, -0.8121982, 1.612792, 1, 0, 0.7843137, 1,
1.095785, -0.2504877, 1.916356, 1, 0, 0.7803922, 1,
1.110731, 0.5019659, 1.153607, 1, 0, 0.772549, 1,
1.118361, 0.8973, 3.420225, 1, 0, 0.7686275, 1,
1.118594, 1.359602, 0.5365963, 1, 0, 0.7607843, 1,
1.123103, 0.7946938, 1.303104, 1, 0, 0.7568628, 1,
1.131569, -1.211424, 3.268953, 1, 0, 0.7490196, 1,
1.132873, -0.5129216, 2.408245, 1, 0, 0.7450981, 1,
1.14288, -1.719204, 1.727911, 1, 0, 0.7372549, 1,
1.146435, 0.3082838, -0.216065, 1, 0, 0.7333333, 1,
1.150567, 0.7154009, 0.9365159, 1, 0, 0.7254902, 1,
1.182321, -2.220105, 1.484879, 1, 0, 0.7215686, 1,
1.187628, 0.440562, 0.2752909, 1, 0, 0.7137255, 1,
1.190376, 0.4107147, 2.331294, 1, 0, 0.7098039, 1,
1.190398, 1.365877, 1.423851, 1, 0, 0.7019608, 1,
1.196943, -1.778544, 1.916261, 1, 0, 0.6941177, 1,
1.197943, 1.782063, 1.677564, 1, 0, 0.6901961, 1,
1.198835, -0.7638385, 2.571362, 1, 0, 0.682353, 1,
1.203254, -0.3090346, 1.598153, 1, 0, 0.6784314, 1,
1.206633, -1.322859, 2.297932, 1, 0, 0.6705883, 1,
1.213834, 0.8929504, 2.166739, 1, 0, 0.6666667, 1,
1.220089, -1.753839, 2.130522, 1, 0, 0.6588235, 1,
1.235345, 0.5371152, 1.792868, 1, 0, 0.654902, 1,
1.235999, 0.6665985, 1.081153, 1, 0, 0.6470588, 1,
1.251265, -1.59039, 3.037487, 1, 0, 0.6431373, 1,
1.253322, 0.1319815, 0.1813004, 1, 0, 0.6352941, 1,
1.256021, 0.6012028, 1.619262, 1, 0, 0.6313726, 1,
1.257025, 0.398381, 1.557398, 1, 0, 0.6235294, 1,
1.274354, -2.15167, 2.134836, 1, 0, 0.6196079, 1,
1.278162, -0.8269885, 3.308199, 1, 0, 0.6117647, 1,
1.284273, 1.545926, 1.208919, 1, 0, 0.6078432, 1,
1.285872, -0.4907475, -0.3749112, 1, 0, 0.6, 1,
1.296221, 0.3781969, 1.217199, 1, 0, 0.5921569, 1,
1.296592, 0.4696795, 1.15182, 1, 0, 0.5882353, 1,
1.296938, -1.528087, 2.07285, 1, 0, 0.5803922, 1,
1.298823, -0.2095245, 2.067921, 1, 0, 0.5764706, 1,
1.300185, 0.9748392, -0.003820885, 1, 0, 0.5686275, 1,
1.304328, 0.6456658, -0.8912268, 1, 0, 0.5647059, 1,
1.3073, -0.3202737, 2.064136, 1, 0, 0.5568628, 1,
1.31792, 0.2399688, 0.7308159, 1, 0, 0.5529412, 1,
1.321663, -0.3770848, 1.166056, 1, 0, 0.5450981, 1,
1.324187, 0.1680549, 1.413299, 1, 0, 0.5411765, 1,
1.327932, 0.6264663, 2.156163, 1, 0, 0.5333334, 1,
1.331368, 1.224618, -0.753713, 1, 0, 0.5294118, 1,
1.331642, 0.9381878, 1.057884, 1, 0, 0.5215687, 1,
1.337485, -1.488448, 4.439811, 1, 0, 0.5176471, 1,
1.338723, 0.3761259, 0.2892348, 1, 0, 0.509804, 1,
1.33968, 1.255695, 1.444776, 1, 0, 0.5058824, 1,
1.343813, -1.741728, 2.922062, 1, 0, 0.4980392, 1,
1.34519, -0.02807064, 1.995401, 1, 0, 0.4901961, 1,
1.349011, -0.3482451, 1.464653, 1, 0, 0.4862745, 1,
1.355398, -0.7542889, 1.330163, 1, 0, 0.4784314, 1,
1.357879, 1.307792, -0.2187816, 1, 0, 0.4745098, 1,
1.360616, -0.8342602, 2.464629, 1, 0, 0.4666667, 1,
1.360797, -0.2981478, 2.203988, 1, 0, 0.4627451, 1,
1.365387, -0.428302, 2.383241, 1, 0, 0.454902, 1,
1.377225, 0.5308688, 0.3577637, 1, 0, 0.4509804, 1,
1.377725, -0.2954868, 3.013766, 1, 0, 0.4431373, 1,
1.381848, -0.05382491, 2.541395, 1, 0, 0.4392157, 1,
1.388931, 0.931701, 0.1978025, 1, 0, 0.4313726, 1,
1.393391, -0.4011576, 1.351695, 1, 0, 0.427451, 1,
1.396614, -0.2911649, 1.343208, 1, 0, 0.4196078, 1,
1.398939, -0.3820604, 1.430567, 1, 0, 0.4156863, 1,
1.400767, 0.6523799, 1.306941, 1, 0, 0.4078431, 1,
1.423784, -0.07181352, 2.640346, 1, 0, 0.4039216, 1,
1.429046, -0.1638079, 1.810898, 1, 0, 0.3960784, 1,
1.431291, -1.41441, 1.626172, 1, 0, 0.3882353, 1,
1.432887, 0.1844926, 0.9016268, 1, 0, 0.3843137, 1,
1.441185, 0.1813483, 1.061328, 1, 0, 0.3764706, 1,
1.478194, 0.01654229, 2.419269, 1, 0, 0.372549, 1,
1.479818, 0.3534879, 1.247383, 1, 0, 0.3647059, 1,
1.487655, -0.9007632, 0.6176718, 1, 0, 0.3607843, 1,
1.493015, -1.554439, 2.590517, 1, 0, 0.3529412, 1,
1.497673, 0.7342446, -0.3184555, 1, 0, 0.3490196, 1,
1.509336, 0.2156292, 1.672859, 1, 0, 0.3411765, 1,
1.519047, 1.160101, 1.071638, 1, 0, 0.3372549, 1,
1.519773, 0.4883124, 0.9210588, 1, 0, 0.3294118, 1,
1.523493, -0.4612446, 2.075161, 1, 0, 0.3254902, 1,
1.541028, 0.2930215, 1.864638, 1, 0, 0.3176471, 1,
1.544473, -0.3207308, 2.136713, 1, 0, 0.3137255, 1,
1.544991, -0.6352115, 1.877596, 1, 0, 0.3058824, 1,
1.575306, -1.044441, 3.087799, 1, 0, 0.2980392, 1,
1.59117, 0.0249857, 1.379431, 1, 0, 0.2941177, 1,
1.607767, -0.8080326, 0.4715941, 1, 0, 0.2862745, 1,
1.610354, -0.2284961, 1.841771, 1, 0, 0.282353, 1,
1.621529, -2.374369, 1.416875, 1, 0, 0.2745098, 1,
1.621807, -0.7179697, 1.348498, 1, 0, 0.2705882, 1,
1.636606, -0.6179874, 2.408439, 1, 0, 0.2627451, 1,
1.640982, 0.6925809, -0.2504182, 1, 0, 0.2588235, 1,
1.64594, -0.7019734, 1.831769, 1, 0, 0.2509804, 1,
1.6462, -0.7130972, 2.648946, 1, 0, 0.2470588, 1,
1.692792, -0.5107601, 0.6664653, 1, 0, 0.2392157, 1,
1.699359, 0.6147699, 1.093023, 1, 0, 0.2352941, 1,
1.703238, -2.113931, 2.905076, 1, 0, 0.227451, 1,
1.760294, 1.348522, 0.4270568, 1, 0, 0.2235294, 1,
1.78081, 0.2207792, 0.8699937, 1, 0, 0.2156863, 1,
1.807848, 0.5987038, 2.26719, 1, 0, 0.2117647, 1,
1.835304, 0.4316286, 1.648876, 1, 0, 0.2039216, 1,
1.852504, -0.310976, 2.003261, 1, 0, 0.1960784, 1,
1.857784, 1.883354, -0.369054, 1, 0, 0.1921569, 1,
1.879925, -0.03885309, 1.763277, 1, 0, 0.1843137, 1,
1.880198, -1.323127, 3.241644, 1, 0, 0.1803922, 1,
1.892683, 1.371286, 0.9514407, 1, 0, 0.172549, 1,
1.893027, -0.6634335, 3.338903, 1, 0, 0.1686275, 1,
1.942289, 0.2152772, 2.934521, 1, 0, 0.1607843, 1,
1.946888, 0.5449189, -0.5290426, 1, 0, 0.1568628, 1,
1.966437, -1.928342, 2.195949, 1, 0, 0.1490196, 1,
1.969672, 1.031349, 2.801722, 1, 0, 0.145098, 1,
1.977228, -0.2405938, 1.355675, 1, 0, 0.1372549, 1,
2.006592, 0.3864834, 0.8180826, 1, 0, 0.1333333, 1,
2.013689, -0.5958387, 0.223232, 1, 0, 0.1254902, 1,
2.035151, 1.867645, 0.01824993, 1, 0, 0.1215686, 1,
2.041154, 0.521853, 0.08642896, 1, 0, 0.1137255, 1,
2.043126, 0.2720405, 1.714985, 1, 0, 0.1098039, 1,
2.071318, -0.8085339, 1.436317, 1, 0, 0.1019608, 1,
2.096018, 0.2310052, 0.6925147, 1, 0, 0.09411765, 1,
2.10245, 0.4100774, 0.7380956, 1, 0, 0.09019608, 1,
2.174191, -0.9410483, 3.141024, 1, 0, 0.08235294, 1,
2.199334, 1.021354, 2.743772, 1, 0, 0.07843138, 1,
2.203257, 0.137296, 1.993225, 1, 0, 0.07058824, 1,
2.234907, -0.91016, 2.940976, 1, 0, 0.06666667, 1,
2.354143, 0.0460589, 1.79037, 1, 0, 0.05882353, 1,
2.357221, -0.556269, 1.805147, 1, 0, 0.05490196, 1,
2.440732, 2.612228, 1.881107, 1, 0, 0.04705882, 1,
2.533741, 0.7124577, -0.7793595, 1, 0, 0.04313726, 1,
2.57379, -1.918164, 0.4829665, 1, 0, 0.03529412, 1,
2.621514, -2.640146, 2.87618, 1, 0, 0.03137255, 1,
2.796006, 0.2112892, 0.4257993, 1, 0, 0.02352941, 1,
2.854004, 0.02769179, -0.3736616, 1, 0, 0.01960784, 1,
3.122014, 0.8178083, 1.840358, 1, 0, 0.01176471, 1,
3.454747, 0.5113871, 1.767416, 1, 0, 0.007843138, 1
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
0.1169875, -4.602731, -7.690941, 0, -0.5, 0.5, 0.5,
0.1169875, -4.602731, -7.690941, 1, -0.5, 0.5, 0.5,
0.1169875, -4.602731, -7.690941, 1, 1.5, 0.5, 0.5,
0.1169875, -4.602731, -7.690941, 0, 1.5, 0.5, 0.5
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
-4.352272, -0.1779094, -7.690941, 0, -0.5, 0.5, 0.5,
-4.352272, -0.1779094, -7.690941, 1, -0.5, 0.5, 0.5,
-4.352272, -0.1779094, -7.690941, 1, 1.5, 0.5, 0.5,
-4.352272, -0.1779094, -7.690941, 0, 1.5, 0.5, 0.5
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
-4.352272, -4.602731, -0.2648427, 0, -0.5, 0.5, 0.5,
-4.352272, -4.602731, -0.2648427, 1, -0.5, 0.5, 0.5,
-4.352272, -4.602731, -0.2648427, 1, 1.5, 0.5, 0.5,
-4.352272, -4.602731, -0.2648427, 0, 1.5, 0.5, 0.5
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
-3, -3.581619, -5.977226,
3, -3.581619, -5.977226,
-3, -3.581619, -5.977226,
-3, -3.751804, -6.262846,
-2, -3.581619, -5.977226,
-2, -3.751804, -6.262846,
-1, -3.581619, -5.977226,
-1, -3.751804, -6.262846,
0, -3.581619, -5.977226,
0, -3.751804, -6.262846,
1, -3.581619, -5.977226,
1, -3.751804, -6.262846,
2, -3.581619, -5.977226,
2, -3.751804, -6.262846,
3, -3.581619, -5.977226,
3, -3.751804, -6.262846
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
-3, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
-3, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
-3, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
-3, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5,
-2, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
-2, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
-2, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
-2, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5,
-1, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
-1, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
-1, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
-1, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5,
0, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
0, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
0, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
0, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5,
1, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
1, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
1, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
1, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5,
2, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
2, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
2, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
2, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5,
3, -4.092175, -6.834084, 0, -0.5, 0.5, 0.5,
3, -4.092175, -6.834084, 1, -0.5, 0.5, 0.5,
3, -4.092175, -6.834084, 1, 1.5, 0.5, 0.5,
3, -4.092175, -6.834084, 0, 1.5, 0.5, 0.5
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
-3.320904, -3, -5.977226,
-3.320904, 3, -5.977226,
-3.320904, -3, -5.977226,
-3.492799, -3, -6.262846,
-3.320904, -2, -5.977226,
-3.492799, -2, -6.262846,
-3.320904, -1, -5.977226,
-3.492799, -1, -6.262846,
-3.320904, 0, -5.977226,
-3.492799, 0, -6.262846,
-3.320904, 1, -5.977226,
-3.492799, 1, -6.262846,
-3.320904, 2, -5.977226,
-3.492799, 2, -6.262846,
-3.320904, 3, -5.977226,
-3.492799, 3, -6.262846
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
-3.836588, -3, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, -3, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, -3, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, -3, -6.834084, 0, 1.5, 0.5, 0.5,
-3.836588, -2, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, -2, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, -2, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, -2, -6.834084, 0, 1.5, 0.5, 0.5,
-3.836588, -1, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, -1, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, -1, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, -1, -6.834084, 0, 1.5, 0.5, 0.5,
-3.836588, 0, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, 0, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, 0, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, 0, -6.834084, 0, 1.5, 0.5, 0.5,
-3.836588, 1, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, 1, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, 1, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, 1, -6.834084, 0, 1.5, 0.5, 0.5,
-3.836588, 2, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, 2, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, 2, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, 2, -6.834084, 0, 1.5, 0.5, 0.5,
-3.836588, 3, -6.834084, 0, -0.5, 0.5, 0.5,
-3.836588, 3, -6.834084, 1, -0.5, 0.5, 0.5,
-3.836588, 3, -6.834084, 1, 1.5, 0.5, 0.5,
-3.836588, 3, -6.834084, 0, 1.5, 0.5, 0.5
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
-3.320904, -3.581619, -4,
-3.320904, -3.581619, 4,
-3.320904, -3.581619, -4,
-3.492799, -3.751804, -4,
-3.320904, -3.581619, -2,
-3.492799, -3.751804, -2,
-3.320904, -3.581619, 0,
-3.492799, -3.751804, 0,
-3.320904, -3.581619, 2,
-3.492799, -3.751804, 2,
-3.320904, -3.581619, 4,
-3.492799, -3.751804, 4
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
-3.836588, -4.092175, -4, 0, -0.5, 0.5, 0.5,
-3.836588, -4.092175, -4, 1, -0.5, 0.5, 0.5,
-3.836588, -4.092175, -4, 1, 1.5, 0.5, 0.5,
-3.836588, -4.092175, -4, 0, 1.5, 0.5, 0.5,
-3.836588, -4.092175, -2, 0, -0.5, 0.5, 0.5,
-3.836588, -4.092175, -2, 1, -0.5, 0.5, 0.5,
-3.836588, -4.092175, -2, 1, 1.5, 0.5, 0.5,
-3.836588, -4.092175, -2, 0, 1.5, 0.5, 0.5,
-3.836588, -4.092175, 0, 0, -0.5, 0.5, 0.5,
-3.836588, -4.092175, 0, 1, -0.5, 0.5, 0.5,
-3.836588, -4.092175, 0, 1, 1.5, 0.5, 0.5,
-3.836588, -4.092175, 0, 0, 1.5, 0.5, 0.5,
-3.836588, -4.092175, 2, 0, -0.5, 0.5, 0.5,
-3.836588, -4.092175, 2, 1, -0.5, 0.5, 0.5,
-3.836588, -4.092175, 2, 1, 1.5, 0.5, 0.5,
-3.836588, -4.092175, 2, 0, 1.5, 0.5, 0.5,
-3.836588, -4.092175, 4, 0, -0.5, 0.5, 0.5,
-3.836588, -4.092175, 4, 1, -0.5, 0.5, 0.5,
-3.836588, -4.092175, 4, 1, 1.5, 0.5, 0.5,
-3.836588, -4.092175, 4, 0, 1.5, 0.5, 0.5
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
-3.320904, -3.581619, -5.977226,
-3.320904, 3.2258, -5.977226,
-3.320904, -3.581619, 5.447541,
-3.320904, 3.2258, 5.447541,
-3.320904, -3.581619, -5.977226,
-3.320904, -3.581619, 5.447541,
-3.320904, 3.2258, -5.977226,
-3.320904, 3.2258, 5.447541,
-3.320904, -3.581619, -5.977226,
3.554879, -3.581619, -5.977226,
-3.320904, -3.581619, 5.447541,
3.554879, -3.581619, 5.447541,
-3.320904, 3.2258, -5.977226,
3.554879, 3.2258, -5.977226,
-3.320904, 3.2258, 5.447541,
3.554879, 3.2258, 5.447541,
3.554879, -3.581619, -5.977226,
3.554879, 3.2258, -5.977226,
3.554879, -3.581619, 5.447541,
3.554879, 3.2258, 5.447541,
3.554879, -3.581619, -5.977226,
3.554879, -3.581619, 5.447541,
3.554879, 3.2258, -5.977226,
3.554879, 3.2258, 5.447541
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
var radius = 7.994434;
var distance = 35.56814;
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
mvMatrix.translate( -0.1169875, 0.1779094, 0.2648427 );
mvMatrix.scale( 1.257128, 1.269753, 0.756579 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.56814);
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
piperidine-1-carboth<-read.table("piperidine-1-carboth.xyz")
```

```
## Error in read.table("piperidine-1-carboth.xyz"): no lines available in input
```

```r
x<-piperidine-1-carboth$V2
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
```

```r
y<-piperidine-1-carboth$V3
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
```

```r
z<-piperidine-1-carboth$V4
```

```
## Error in eval(expr, envir, enclos): object 'piperidine' not found
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
-3.220772, 0.01387843, -3.162188, 0, 0, 1, 1, 1,
-2.892505, 0.6847373, -1.058817, 1, 0, 0, 1, 1,
-2.611763, 0.3875328, -1.449536, 1, 0, 0, 1, 1,
-2.563114, -1.044634, -2.14957, 1, 0, 0, 1, 1,
-2.434211, 0.3807214, -1.640649, 1, 0, 0, 1, 1,
-2.333618, -0.4962009, -2.50963, 1, 0, 0, 1, 1,
-2.272694, -0.3761984, -0.06771006, 0, 0, 0, 1, 1,
-2.244147, 0.8448583, -0.5092971, 0, 0, 0, 1, 1,
-2.139256, -1.528561, -1.716056, 0, 0, 0, 1, 1,
-2.12013, 1.016266, -1.776384, 0, 0, 0, 1, 1,
-2.11331, -1.161146, -1.906255, 0, 0, 0, 1, 1,
-2.098776, -0.1857932, -0.4589464, 0, 0, 0, 1, 1,
-2.086867, -0.9570935, -0.2965041, 0, 0, 0, 1, 1,
-2.08657, -0.08946022, -2.098832, 1, 1, 1, 1, 1,
-2.077991, -1.071677, -1.768872, 1, 1, 1, 1, 1,
-2.075632, 1.091947, -0.775326, 1, 1, 1, 1, 1,
-2.04442, 3.012156, 0.7769946, 1, 1, 1, 1, 1,
-2.02069, -0.2740791, -1.828941, 1, 1, 1, 1, 1,
-2.020672, -0.4341926, -3.931034, 1, 1, 1, 1, 1,
-1.981946, -1.35361, -1.450107, 1, 1, 1, 1, 1,
-1.965464, 0.06210101, -0.4603235, 1, 1, 1, 1, 1,
-1.955929, -0.8827317, -1.054317, 1, 1, 1, 1, 1,
-1.952472, 0.5945559, 0.02734189, 1, 1, 1, 1, 1,
-1.949232, -0.5990362, -2.183837, 1, 1, 1, 1, 1,
-1.946823, 0.4955111, -1.722202, 1, 1, 1, 1, 1,
-1.934734, 2.110845, -1.6901, 1, 1, 1, 1, 1,
-1.928972, -0.5978048, -2.36465, 1, 1, 1, 1, 1,
-1.916263, 2.096095, -0.5149633, 1, 1, 1, 1, 1,
-1.904318, 0.1281777, -2.628694, 0, 0, 1, 1, 1,
-1.88151, 0.764189, -0.8629294, 1, 0, 0, 1, 1,
-1.872545, 1.173221, 0.4574214, 1, 0, 0, 1, 1,
-1.868494, -0.3809923, -2.781449, 1, 0, 0, 1, 1,
-1.856968, 1.622249, -0.2493627, 1, 0, 0, 1, 1,
-1.794164, 1.006462, -1.358553, 1, 0, 0, 1, 1,
-1.79202, 0.3981896, -1.050329, 0, 0, 0, 1, 1,
-1.782228, -0.9037262, -2.226774, 0, 0, 0, 1, 1,
-1.76802, -0.5818177, -3.013556, 0, 0, 0, 1, 1,
-1.762709, 0.4415478, -0.2254125, 0, 0, 0, 1, 1,
-1.735574, -0.007241889, 1.052543, 0, 0, 0, 1, 1,
-1.732594, -0.8201308, -2.582043, 0, 0, 0, 1, 1,
-1.731231, -0.500695, -1.964156, 0, 0, 0, 1, 1,
-1.724653, -1.761769, -2.447371, 1, 1, 1, 1, 1,
-1.6813, -1.084193, -1.163089, 1, 1, 1, 1, 1,
-1.673842, -0.8360901, -2.024868, 1, 1, 1, 1, 1,
-1.667062, -0.5852629, -1.755539, 1, 1, 1, 1, 1,
-1.666492, -0.9610952, -1.972161, 1, 1, 1, 1, 1,
-1.654316, 1.263622, 0.03255687, 1, 1, 1, 1, 1,
-1.6374, -0.7109991, -3.000635, 1, 1, 1, 1, 1,
-1.635023, -0.2964254, -0.8590844, 1, 1, 1, 1, 1,
-1.631998, 1.116975, -1.122992, 1, 1, 1, 1, 1,
-1.624249, -0.03873264, -0.3254517, 1, 1, 1, 1, 1,
-1.61961, -1.258899, -3.298352, 1, 1, 1, 1, 1,
-1.614924, -0.9468902, -3.22069, 1, 1, 1, 1, 1,
-1.597042, 0.1306448, -1.313613, 1, 1, 1, 1, 1,
-1.57736, 1.033018, -1.772887, 1, 1, 1, 1, 1,
-1.569474, -2.057301, -2.210442, 1, 1, 1, 1, 1,
-1.561488, 1.583812, -0.5427433, 0, 0, 1, 1, 1,
-1.555448, 0.02608036, -0.8797247, 1, 0, 0, 1, 1,
-1.53816, 2.986628, 0.5889502, 1, 0, 0, 1, 1,
-1.536353, -0.4586837, -2.102927, 1, 0, 0, 1, 1,
-1.532789, -1.185221, -3.076469, 1, 0, 0, 1, 1,
-1.530241, 0.8623453, -0.0171196, 1, 0, 0, 1, 1,
-1.528786, 0.8890772, -1.869257, 0, 0, 0, 1, 1,
-1.511834, 1.081996, -1.343153, 0, 0, 0, 1, 1,
-1.508336, -0.6178735, -2.048597, 0, 0, 0, 1, 1,
-1.507586, -0.5747615, -2.999221, 0, 0, 0, 1, 1,
-1.507412, 0.9709921, -1.087441, 0, 0, 0, 1, 1,
-1.496339, -0.503866, -1.834648, 0, 0, 0, 1, 1,
-1.488526, 2.232665, -1.609355, 0, 0, 0, 1, 1,
-1.478247, 0.4190018, -2.251417, 1, 1, 1, 1, 1,
-1.456235, -1.738673, -1.429782, 1, 1, 1, 1, 1,
-1.45585, 0.05657009, -1.463957, 1, 1, 1, 1, 1,
-1.454135, -1.514871, -3.899277, 1, 1, 1, 1, 1,
-1.45372, 3.126663, -1.653712, 1, 1, 1, 1, 1,
-1.446847, -0.370833, -1.749627, 1, 1, 1, 1, 1,
-1.444486, -0.05839789, -1.427867, 1, 1, 1, 1, 1,
-1.439592, -0.5276915, -1.753093, 1, 1, 1, 1, 1,
-1.428722, 0.3562535, -0.4233553, 1, 1, 1, 1, 1,
-1.42615, -1.044687, -3.088331, 1, 1, 1, 1, 1,
-1.424425, 0.9813811, 0.2657424, 1, 1, 1, 1, 1,
-1.416831, -0.9989519, -2.230517, 1, 1, 1, 1, 1,
-1.412913, -1.127666, -3.310114, 1, 1, 1, 1, 1,
-1.40867, 0.3491858, -0.6325189, 1, 1, 1, 1, 1,
-1.402118, -1.111011, -2.433451, 1, 1, 1, 1, 1,
-1.400653, 0.3654366, -2.380987, 0, 0, 1, 1, 1,
-1.396157, -0.8928694, -2.048835, 1, 0, 0, 1, 1,
-1.389915, -0.4935785, -2.569016, 1, 0, 0, 1, 1,
-1.389541, -0.1013543, 0.153848, 1, 0, 0, 1, 1,
-1.382995, -0.4253313, -2.398435, 1, 0, 0, 1, 1,
-1.379486, 0.4193012, -0.7752014, 1, 0, 0, 1, 1,
-1.378422, -1.397933, -2.16361, 0, 0, 0, 1, 1,
-1.375262, 0.9016891, -0.5287782, 0, 0, 0, 1, 1,
-1.374577, -0.0130066, -2.025359, 0, 0, 0, 1, 1,
-1.373105, -0.4156685, -3.777805, 0, 0, 0, 1, 1,
-1.370376, -0.8760295, -1.292116, 0, 0, 0, 1, 1,
-1.352999, -0.201322, -0.5463924, 0, 0, 0, 1, 1,
-1.325595, -0.5365271, -1.383945, 0, 0, 0, 1, 1,
-1.324123, -0.9285285, -2.292328, 1, 1, 1, 1, 1,
-1.322752, 0.235651, -1.38513, 1, 1, 1, 1, 1,
-1.315251, -0.06875774, -1.819621, 1, 1, 1, 1, 1,
-1.309827, -1.164263, -0.8695068, 1, 1, 1, 1, 1,
-1.295287, 0.1731741, -2.708747, 1, 1, 1, 1, 1,
-1.29299, -0.8175195, -1.521512, 1, 1, 1, 1, 1,
-1.290033, 0.7596579, -2.011205, 1, 1, 1, 1, 1,
-1.287435, -0.6291717, -1.261676, 1, 1, 1, 1, 1,
-1.287418, 1.042208, -1.065939, 1, 1, 1, 1, 1,
-1.287377, 0.2325463, -0.8650323, 1, 1, 1, 1, 1,
-1.281281, -0.5106467, -1.482599, 1, 1, 1, 1, 1,
-1.276356, 0.01268568, -2.621975, 1, 1, 1, 1, 1,
-1.262359, 0.01549088, -0.01718814, 1, 1, 1, 1, 1,
-1.261577, 0.9424003, 0.9443721, 1, 1, 1, 1, 1,
-1.256231, -0.4943221, -1.162997, 1, 1, 1, 1, 1,
-1.255044, 0.03582212, -2.856075, 0, 0, 1, 1, 1,
-1.251971, -0.7992145, -3.340507, 1, 0, 0, 1, 1,
-1.244951, -0.7367126, -2.271939, 1, 0, 0, 1, 1,
-1.233343, -1.214503, -0.5928833, 1, 0, 0, 1, 1,
-1.218299, -0.2450475, -2.683673, 1, 0, 0, 1, 1,
-1.21289, -0.7262362, -2.496105, 1, 0, 0, 1, 1,
-1.208751, 0.07059118, -1.742118, 0, 0, 0, 1, 1,
-1.183001, -1.894147, -3.247751, 0, 0, 0, 1, 1,
-1.182641, -0.6042536, -1.938262, 0, 0, 0, 1, 1,
-1.181212, 1.155844, -1.680157, 0, 0, 0, 1, 1,
-1.179893, -2.105913, -2.697921, 0, 0, 0, 1, 1,
-1.173053, -0.8351368, 0.3151371, 0, 0, 0, 1, 1,
-1.169732, 0.7411204, 0.0210382, 0, 0, 0, 1, 1,
-1.169083, -0.4839397, -0.9052177, 1, 1, 1, 1, 1,
-1.168225, -2.083016, -3.961068, 1, 1, 1, 1, 1,
-1.167417, -0.2356756, -1.594077, 1, 1, 1, 1, 1,
-1.16712, 1.370134, -0.8196715, 1, 1, 1, 1, 1,
-1.165811, 1.297709, -0.1438531, 1, 1, 1, 1, 1,
-1.160633, 0.681501, -1.352491, 1, 1, 1, 1, 1,
-1.159345, 0.5001829, -2.385902, 1, 1, 1, 1, 1,
-1.159066, 0.8862183, 0.3787623, 1, 1, 1, 1, 1,
-1.155322, -1.624359, -2.981097, 1, 1, 1, 1, 1,
-1.147174, -1.185233, -2.947998, 1, 1, 1, 1, 1,
-1.122438, 1.585703, -0.8032546, 1, 1, 1, 1, 1,
-1.122274, -1.206481, -0.2626562, 1, 1, 1, 1, 1,
-1.120057, 1.702049, -1.999458, 1, 1, 1, 1, 1,
-1.119486, 1.759971, -0.818241, 1, 1, 1, 1, 1,
-1.110975, 0.8066635, -1.848792, 1, 1, 1, 1, 1,
-1.110918, 0.1010474, -0.228924, 0, 0, 1, 1, 1,
-1.110902, -1.339875, -3.293463, 1, 0, 0, 1, 1,
-1.109042, 0.06919315, -1.777263, 1, 0, 0, 1, 1,
-1.108144, -1.252038, -2.437936, 1, 0, 0, 1, 1,
-1.101722, 0.9655321, -1.813128, 1, 0, 0, 1, 1,
-1.098773, -0.08715124, -2.050077, 1, 0, 0, 1, 1,
-1.09653, 0.8338474, -1.087, 0, 0, 0, 1, 1,
-1.090235, -0.09416895, -0.8942077, 0, 0, 0, 1, 1,
-1.090227, -0.7453137, -2.196277, 0, 0, 0, 1, 1,
-1.085383, 0.7576382, -1.63394, 0, 0, 0, 1, 1,
-1.082367, 0.5362599, -0.5101241, 0, 0, 0, 1, 1,
-1.082219, -1.161045, -2.840161, 0, 0, 0, 1, 1,
-1.07958, -0.5821826, -1.383904, 0, 0, 0, 1, 1,
-1.075332, -0.6934462, -1.900236, 1, 1, 1, 1, 1,
-1.069808, -1.019682, -2.109129, 1, 1, 1, 1, 1,
-1.054542, -0.009067792, -2.007161, 1, 1, 1, 1, 1,
-1.048355, 0.4372198, -2.910069, 1, 1, 1, 1, 1,
-1.043447, 0.7758574, -1.058277, 1, 1, 1, 1, 1,
-1.040719, -0.7552947, -2.424981, 1, 1, 1, 1, 1,
-1.036862, 0.668162, -1.682277, 1, 1, 1, 1, 1,
-1.033491, -2.008203, -2.309692, 1, 1, 1, 1, 1,
-1.029887, 0.09822235, -4.473608, 1, 1, 1, 1, 1,
-1.028617, -0.8109378, -1.181974, 1, 1, 1, 1, 1,
-1.023615, -0.3404617, -1.626996, 1, 1, 1, 1, 1,
-1.018092, 0.8657593, -2.110208, 1, 1, 1, 1, 1,
-1.017146, 0.9841554, -1.270533, 1, 1, 1, 1, 1,
-1.012409, 1.574499, -0.4299107, 1, 1, 1, 1, 1,
-1.009274, 2.037107, 0.4452366, 1, 1, 1, 1, 1,
-1.008965, 0.4912212, -1.744089, 0, 0, 1, 1, 1,
-1.008836, -0.4876598, -1.824981, 1, 0, 0, 1, 1,
-1.006966, -0.8742522, -1.605168, 1, 0, 0, 1, 1,
-0.9918799, 0.3469385, -2.287357, 1, 0, 0, 1, 1,
-0.9917831, 0.5207542, -1.490577, 1, 0, 0, 1, 1,
-0.9861358, 0.08666157, -2.197401, 1, 0, 0, 1, 1,
-0.9774699, -1.371413, -2.92968, 0, 0, 0, 1, 1,
-0.9764757, 0.3911594, -1.497557, 0, 0, 0, 1, 1,
-0.9739111, -1.349119, -2.711063, 0, 0, 0, 1, 1,
-0.9736992, -0.8981378, -0.3092098, 0, 0, 0, 1, 1,
-0.972584, -0.005824297, -0.6005126, 0, 0, 0, 1, 1,
-0.9710953, -0.5838212, -3.49218, 0, 0, 0, 1, 1,
-0.9638628, 1.326094, 1.049176, 0, 0, 0, 1, 1,
-0.9616894, -0.0914886, -0.7785034, 1, 1, 1, 1, 1,
-0.9585707, -0.3245944, -2.441369, 1, 1, 1, 1, 1,
-0.9557303, 2.094168, -2.501733, 1, 1, 1, 1, 1,
-0.9543474, 0.4562879, -2.672747, 1, 1, 1, 1, 1,
-0.9536705, -0.0136339, -2.720862, 1, 1, 1, 1, 1,
-0.9518707, 1.726668, -0.9502842, 1, 1, 1, 1, 1,
-0.941576, -0.0927429, -3.287558, 1, 1, 1, 1, 1,
-0.928031, -0.04032866, -0.7261324, 1, 1, 1, 1, 1,
-0.9261416, 0.3929537, -2.918563, 1, 1, 1, 1, 1,
-0.9222643, 0.1647814, -1.927236, 1, 1, 1, 1, 1,
-0.9178836, 1.329624, -1.599215, 1, 1, 1, 1, 1,
-0.9145731, 1.212219, -0.4803371, 1, 1, 1, 1, 1,
-0.9124039, 1.411544, -0.5410233, 1, 1, 1, 1, 1,
-0.9021677, 0.4155377, -1.925823, 1, 1, 1, 1, 1,
-0.8922045, 0.6142951, -0.7963025, 1, 1, 1, 1, 1,
-0.8862191, -2.119074, -3.362006, 0, 0, 1, 1, 1,
-0.8829589, -0.8484025, -2.753872, 1, 0, 0, 1, 1,
-0.8826278, -1.053052, -3.278909, 1, 0, 0, 1, 1,
-0.8714126, -1.344145, -2.829764, 1, 0, 0, 1, 1,
-0.8703149, -0.06260506, -2.496637, 1, 0, 0, 1, 1,
-0.8681797, -0.06694683, -0.7326319, 1, 0, 0, 1, 1,
-0.8673486, 0.7796826, -1.094893, 0, 0, 0, 1, 1,
-0.8663507, 1.487238, -1.259771, 0, 0, 0, 1, 1,
-0.8661361, 1.689705, -0.9059507, 0, 0, 0, 1, 1,
-0.8643471, 0.1896699, -1.962829, 0, 0, 0, 1, 1,
-0.8549461, -0.8118019, -1.665741, 0, 0, 0, 1, 1,
-0.8532865, 0.3119508, -1.656033, 0, 0, 0, 1, 1,
-0.8494141, -0.9180552, -2.944305, 0, 0, 0, 1, 1,
-0.8480399, 0.4821409, -1.145771, 1, 1, 1, 1, 1,
-0.8473722, 1.050575, -0.2026979, 1, 1, 1, 1, 1,
-0.8396509, 0.6347421, 0.5355794, 1, 1, 1, 1, 1,
-0.8357088, 1.505958, -0.1148909, 1, 1, 1, 1, 1,
-0.8300244, 1.449106, 1.053945, 1, 1, 1, 1, 1,
-0.8286846, 0.506638, -1.398593, 1, 1, 1, 1, 1,
-0.8285167, -0.425562, -2.51034, 1, 1, 1, 1, 1,
-0.8262851, 0.7342287, -1.843774, 1, 1, 1, 1, 1,
-0.8251842, 1.724205, -0.2012141, 1, 1, 1, 1, 1,
-0.8243534, -1.691517, -0.739907, 1, 1, 1, 1, 1,
-0.8212591, -0.02308722, -0.5135987, 1, 1, 1, 1, 1,
-0.8169893, 0.6616673, -0.5982108, 1, 1, 1, 1, 1,
-0.816085, -1.061751, -3.080411, 1, 1, 1, 1, 1,
-0.814303, 0.7447809, 1.288623, 1, 1, 1, 1, 1,
-0.8118602, -0.03747664, 0.2552881, 1, 1, 1, 1, 1,
-0.8094405, 1.980526, -0.1511273, 0, 0, 1, 1, 1,
-0.8060941, 0.06988156, -2.434704, 1, 0, 0, 1, 1,
-0.8027126, 1.594887, -2.071408, 1, 0, 0, 1, 1,
-0.8007439, 0.2963977, -0.7445817, 1, 0, 0, 1, 1,
-0.8000114, 1.242454, -1.081071, 1, 0, 0, 1, 1,
-0.7978068, -1.392275, -3.726017, 1, 0, 0, 1, 1,
-0.7951359, -1.453328, -3.332625, 0, 0, 0, 1, 1,
-0.7918839, 0.1363366, -2.548347, 0, 0, 0, 1, 1,
-0.7859521, 0.1249996, -2.827834, 0, 0, 0, 1, 1,
-0.7848037, -1.310498, -3.555916, 0, 0, 0, 1, 1,
-0.7840483, -0.3349618, -3.204424, 0, 0, 0, 1, 1,
-0.7832834, 0.4867133, 0.4000455, 0, 0, 0, 1, 1,
-0.7736772, -0.5127116, -2.945063, 0, 0, 0, 1, 1,
-0.7735161, -0.5433118, -1.003794, 1, 1, 1, 1, 1,
-0.7728763, 0.999063, -2.301157, 1, 1, 1, 1, 1,
-0.7662866, -0.2153293, -1.460825, 1, 1, 1, 1, 1,
-0.7609255, -1.970007, -1.945589, 1, 1, 1, 1, 1,
-0.7606013, -0.1994973, -1.631049, 1, 1, 1, 1, 1,
-0.7592728, -0.645926, -1.510538, 1, 1, 1, 1, 1,
-0.7591543, -2.40594, -1.946573, 1, 1, 1, 1, 1,
-0.7544099, 0.4563953, 0.06907231, 1, 1, 1, 1, 1,
-0.7508768, 0.9539719, 0.006834537, 1, 1, 1, 1, 1,
-0.7455618, -0.6008984, -0.9492043, 1, 1, 1, 1, 1,
-0.7347561, -0.5406528, -2.869017, 1, 1, 1, 1, 1,
-0.7345796, 0.1656501, -2.009074, 1, 1, 1, 1, 1,
-0.7307248, -1.538579, -1.963598, 1, 1, 1, 1, 1,
-0.7255753, -0.02604809, -1.644629, 1, 1, 1, 1, 1,
-0.722483, 0.1678981, -2.381226, 1, 1, 1, 1, 1,
-0.7224339, 0.4597862, -1.57664, 0, 0, 1, 1, 1,
-0.7145364, 2.876162, -0.05302088, 1, 0, 0, 1, 1,
-0.711888, -0.7176925, -1.229584, 1, 0, 0, 1, 1,
-0.7099566, -1.002749, -2.520114, 1, 0, 0, 1, 1,
-0.6990778, 0.3893278, -1.284276, 1, 0, 0, 1, 1,
-0.6983798, 2.503451, -0.986304, 1, 0, 0, 1, 1,
-0.6946755, 0.6215476, -1.035003, 0, 0, 0, 1, 1,
-0.6933048, -0.5055592, -3.540617, 0, 0, 0, 1, 1,
-0.693299, -0.001257771, -0.2061451, 0, 0, 0, 1, 1,
-0.6916828, 0.2409509, 0.2035686, 0, 0, 0, 1, 1,
-0.6844029, -0.04936188, -0.863755, 0, 0, 0, 1, 1,
-0.6726982, -1.142019, -3.220454, 0, 0, 0, 1, 1,
-0.6706775, 1.473251, -1.841739, 0, 0, 0, 1, 1,
-0.6577229, -0.2059417, -1.541582, 1, 1, 1, 1, 1,
-0.6554272, 0.0115217, -1.706309, 1, 1, 1, 1, 1,
-0.6518567, -1.767872, -2.333326, 1, 1, 1, 1, 1,
-0.6468186, 0.4453214, 0.4783743, 1, 1, 1, 1, 1,
-0.6392232, -0.09513532, -1.673482, 1, 1, 1, 1, 1,
-0.6335382, -0.6123022, -2.956282, 1, 1, 1, 1, 1,
-0.6255068, 0.03481374, -2.912907, 1, 1, 1, 1, 1,
-0.6222335, 0.3294912, -0.8717583, 1, 1, 1, 1, 1,
-0.6191002, 0.6599455, -0.2129936, 1, 1, 1, 1, 1,
-0.6188837, -0.502309, -1.551253, 1, 1, 1, 1, 1,
-0.6164806, 0.9041326, -0.8945286, 1, 1, 1, 1, 1,
-0.6137536, 0.2471013, -0.6997361, 1, 1, 1, 1, 1,
-0.6101186, 2.097349, -0.7049656, 1, 1, 1, 1, 1,
-0.6029865, -0.365516, -2.319177, 1, 1, 1, 1, 1,
-0.6022708, 0.7390186, -1.683881, 1, 1, 1, 1, 1,
-0.5964065, -0.08616496, -1.564626, 0, 0, 1, 1, 1,
-0.5951625, 0.7342374, -0.8230916, 1, 0, 0, 1, 1,
-0.5850337, 1.596432, 0.665813, 1, 0, 0, 1, 1,
-0.5812423, -1.048678, -2.637506, 1, 0, 0, 1, 1,
-0.57928, 0.1910143, -1.627754, 1, 0, 0, 1, 1,
-0.5758908, -0.4830495, -2.467148, 1, 0, 0, 1, 1,
-0.5747762, 1.299576, 0.322538, 0, 0, 0, 1, 1,
-0.5711048, 0.6662005, -0.279032, 0, 0, 0, 1, 1,
-0.5678527, -0.4863713, -0.784826, 0, 0, 0, 1, 1,
-0.5617996, -1.458166, -3.855701, 0, 0, 0, 1, 1,
-0.5610542, -2.372921, -2.717043, 0, 0, 0, 1, 1,
-0.5597025, -1.002326, -3.002175, 0, 0, 0, 1, 1,
-0.5501445, 1.026097, 1.450936, 0, 0, 0, 1, 1,
-0.5489467, -0.8138149, -1.504821, 1, 1, 1, 1, 1,
-0.5470381, -1.414202, -2.911935, 1, 1, 1, 1, 1,
-0.5440538, -0.2708751, -2.822566, 1, 1, 1, 1, 1,
-0.5435307, -0.9368806, -2.625235, 1, 1, 1, 1, 1,
-0.5388166, 1.09371, -2.028524, 1, 1, 1, 1, 1,
-0.5378689, -0.6552386, -1.249837, 1, 1, 1, 1, 1,
-0.5370713, 0.3276913, -1.971169, 1, 1, 1, 1, 1,
-0.5324128, 1.773823, -0.05908517, 1, 1, 1, 1, 1,
-0.5320033, 0.4156245, -2.423551, 1, 1, 1, 1, 1,
-0.5308685, -0.4852242, -2.861167, 1, 1, 1, 1, 1,
-0.5192098, 0.2075119, -1.422621, 1, 1, 1, 1, 1,
-0.5182909, -0.4685396, -3.135259, 1, 1, 1, 1, 1,
-0.5130852, 1.658811, -0.1205285, 1, 1, 1, 1, 1,
-0.5109829, 0.7415047, 0.06054561, 1, 1, 1, 1, 1,
-0.5105949, -0.7895817, -0.4620903, 1, 1, 1, 1, 1,
-0.5071586, -1.431461, -2.674958, 0, 0, 1, 1, 1,
-0.5036799, -1.260926, -3.565545, 1, 0, 0, 1, 1,
-0.5032535, 0.9953622, 0.9505177, 1, 0, 0, 1, 1,
-0.5011575, 0.5797464, -1.437307, 1, 0, 0, 1, 1,
-0.4997065, -0.2825339, -1.174706, 1, 0, 0, 1, 1,
-0.497292, 0.7056054, -0.1759166, 1, 0, 0, 1, 1,
-0.4930196, -1.828195, -3.029775, 0, 0, 0, 1, 1,
-0.4824805, -0.5571088, -2.347269, 0, 0, 0, 1, 1,
-0.4822178, 0.770338, 2.250113, 0, 0, 0, 1, 1,
-0.4778184, -1.014492, -1.911264, 0, 0, 0, 1, 1,
-0.4774125, -0.7997045, -2.596473, 0, 0, 0, 1, 1,
-0.4759132, 0.2554615, -1.02812, 0, 0, 0, 1, 1,
-0.4740425, -0.08881368, -0.2265816, 0, 0, 0, 1, 1,
-0.4624415, -1.029154, -5.014928, 1, 1, 1, 1, 1,
-0.4600771, -0.05196299, -1.365434, 1, 1, 1, 1, 1,
-0.4461232, 0.9426082, -0.799301, 1, 1, 1, 1, 1,
-0.4458326, 2.348035, -0.5776071, 1, 1, 1, 1, 1,
-0.4445422, -0.2935818, -2.17609, 1, 1, 1, 1, 1,
-0.4423523, 1.06043, -0.3666089, 1, 1, 1, 1, 1,
-0.4420403, 0.5517796, -2.442878, 1, 1, 1, 1, 1,
-0.4403596, 0.07129777, -0.7725244, 1, 1, 1, 1, 1,
-0.4394654, -1.141047, -4.092246, 1, 1, 1, 1, 1,
-0.4382304, 0.1831291, -3.733824, 1, 1, 1, 1, 1,
-0.4359784, -0.1304329, -0.4832876, 1, 1, 1, 1, 1,
-0.4353248, 1.569372, -0.4437398, 1, 1, 1, 1, 1,
-0.4279856, 1.50757, -1.219238, 1, 1, 1, 1, 1,
-0.4232795, -0.07839408, -1.578266, 1, 1, 1, 1, 1,
-0.4228809, -3.151449, -4.523265, 1, 1, 1, 1, 1,
-0.4228669, 0.2241129, -2.914191, 0, 0, 1, 1, 1,
-0.4221263, 0.5926518, -1.101624, 1, 0, 0, 1, 1,
-0.4176465, 0.9397438, -0.003135884, 1, 0, 0, 1, 1,
-0.4173747, -0.7995815, -2.623786, 1, 0, 0, 1, 1,
-0.4108231, 0.8220135, -1.151414, 1, 0, 0, 1, 1,
-0.4096025, 0.4169922, -0.5917408, 1, 0, 0, 1, 1,
-0.4070188, -0.360666, -1.723346, 0, 0, 0, 1, 1,
-0.4008311, -0.7739322, -1.166264, 0, 0, 0, 1, 1,
-0.3969643, -0.6990776, -2.474801, 0, 0, 0, 1, 1,
-0.3939005, 0.401149, -1.220631, 0, 0, 0, 1, 1,
-0.3923113, -0.3585602, -1.476449, 0, 0, 0, 1, 1,
-0.3914173, -0.4534455, -2.227436, 0, 0, 0, 1, 1,
-0.3854541, 1.687266, 0.09433795, 0, 0, 0, 1, 1,
-0.3847635, -0.3221214, -3.483015, 1, 1, 1, 1, 1,
-0.3840772, -0.1865223, -2.236757, 1, 1, 1, 1, 1,
-0.3770784, -0.3677, -2.89096, 1, 1, 1, 1, 1,
-0.3763684, 0.8183125, -1.768581, 1, 1, 1, 1, 1,
-0.3750008, 0.7338268, -2.469164, 1, 1, 1, 1, 1,
-0.3723117, 0.4518367, -2.520323, 1, 1, 1, 1, 1,
-0.3695787, -0.3680987, -0.5272594, 1, 1, 1, 1, 1,
-0.3639777, 0.4176088, -0.09092765, 1, 1, 1, 1, 1,
-0.3622447, -1.719451, -1.756817, 1, 1, 1, 1, 1,
-0.3598814, 0.004696125, -2.133078, 1, 1, 1, 1, 1,
-0.3588089, 0.1760235, -2.074573, 1, 1, 1, 1, 1,
-0.3561718, 0.02181117, 0.1965061, 1, 1, 1, 1, 1,
-0.3535743, -0.8426943, -2.815345, 1, 1, 1, 1, 1,
-0.3505532, 0.03648068, -1.514447, 1, 1, 1, 1, 1,
-0.3497128, -0.3395426, -1.0837, 1, 1, 1, 1, 1,
-0.3445552, -0.4952844, -2.994417, 0, 0, 1, 1, 1,
-0.3375222, -0.07142005, -2.06301, 1, 0, 0, 1, 1,
-0.3362236, 0.3333578, -0.8825145, 1, 0, 0, 1, 1,
-0.3347696, -0.0008777872, -0.7587481, 1, 0, 0, 1, 1,
-0.3338051, 0.1087098, -0.3771965, 1, 0, 0, 1, 1,
-0.3322069, -0.5255541, -4.969116, 1, 0, 0, 1, 1,
-0.3303439, -0.1430604, -0.8558977, 0, 0, 0, 1, 1,
-0.3300691, -1.003976, -3.921114, 0, 0, 0, 1, 1,
-0.3259046, 1.259015, -1.218397, 0, 0, 0, 1, 1,
-0.3258907, -1.107009, -4.153726, 0, 0, 0, 1, 1,
-0.3251501, 0.3296325, -0.1948784, 0, 0, 0, 1, 1,
-0.3237986, -0.2725917, -3.6879, 0, 0, 0, 1, 1,
-0.3212143, 0.5623958, -0.4761324, 0, 0, 0, 1, 1,
-0.318886, -0.7851449, -2.51519, 1, 1, 1, 1, 1,
-0.3130875, -1.364921, -3.349484, 1, 1, 1, 1, 1,
-0.30791, -2.999937, -3.994545, 1, 1, 1, 1, 1,
-0.3026458, 0.4374476, -1.019132, 1, 1, 1, 1, 1,
-0.2989483, 0.921601, -0.8635251, 1, 1, 1, 1, 1,
-0.2964826, 0.6941383, -1.528012, 1, 1, 1, 1, 1,
-0.2956191, -1.353593, -2.504544, 1, 1, 1, 1, 1,
-0.2860712, 1.774586, 1.215206, 1, 1, 1, 1, 1,
-0.2811231, -0.6502773, -2.33142, 1, 1, 1, 1, 1,
-0.2795321, 0.3800016, -0.03524716, 1, 1, 1, 1, 1,
-0.2789572, -1.146314, -2.752016, 1, 1, 1, 1, 1,
-0.2781774, 1.6625, -0.5422342, 1, 1, 1, 1, 1,
-0.2736663, 1.0493, -0.3234181, 1, 1, 1, 1, 1,
-0.2617649, 0.005610676, -2.121548, 1, 1, 1, 1, 1,
-0.2594527, -0.9185202, -4.218729, 1, 1, 1, 1, 1,
-0.2525794, 1.690839, -2.032113, 0, 0, 1, 1, 1,
-0.2515905, -0.3267688, -2.618302, 1, 0, 0, 1, 1,
-0.251253, -0.7195006, -4.54531, 1, 0, 0, 1, 1,
-0.2502612, 0.5611485, -0.1560872, 1, 0, 0, 1, 1,
-0.2497156, 1.219219, -0.5344296, 1, 0, 0, 1, 1,
-0.2478745, -0.979573, -4.680349, 1, 0, 0, 1, 1,
-0.2460428, -0.1324864, -0.8631633, 0, 0, 0, 1, 1,
-0.2456359, -0.6910418, -4.125054, 0, 0, 0, 1, 1,
-0.2386028, -1.27153, -3.925131, 0, 0, 0, 1, 1,
-0.2278308, -0.1577396, -0.7790929, 0, 0, 0, 1, 1,
-0.2247553, -0.5992, -3.315107, 0, 0, 0, 1, 1,
-0.2234675, 1.05792, -1.926955, 0, 0, 0, 1, 1,
-0.2225972, 0.3221684, -1.047876, 0, 0, 0, 1, 1,
-0.2220679, -0.333239, -1.242579, 1, 1, 1, 1, 1,
-0.2189516, -0.7556206, -4.26875, 1, 1, 1, 1, 1,
-0.2176047, -1.591634, -3.273984, 1, 1, 1, 1, 1,
-0.2172901, 0.2057176, -0.6746386, 1, 1, 1, 1, 1,
-0.2157048, -0.5218746, -3.178879, 1, 1, 1, 1, 1,
-0.2117469, 0.1493056, -1.766635, 1, 1, 1, 1, 1,
-0.2110686, 1.818303, 0.7084863, 1, 1, 1, 1, 1,
-0.2103471, -0.5699461, -2.397021, 1, 1, 1, 1, 1,
-0.2073565, 1.039546, -0.07879886, 1, 1, 1, 1, 1,
-0.2053119, 0.7061428, -1.112656, 1, 1, 1, 1, 1,
-0.1950242, -1.156469, -2.517563, 1, 1, 1, 1, 1,
-0.1928899, 1.143087, -2.03862, 1, 1, 1, 1, 1,
-0.1923039, -0.3593661, -4.103545, 1, 1, 1, 1, 1,
-0.189244, 0.53382, -0.1641776, 1, 1, 1, 1, 1,
-0.1840498, -0.6085665, -2.932392, 1, 1, 1, 1, 1,
-0.1820278, -0.9085388, -1.822363, 0, 0, 1, 1, 1,
-0.1807975, -0.5503991, -2.103824, 1, 0, 0, 1, 1,
-0.1779183, 2.757818, 0.7134885, 1, 0, 0, 1, 1,
-0.1768771, -0.5447912, -1.175333, 1, 0, 0, 1, 1,
-0.1759229, -1.181262, -3.794816, 1, 0, 0, 1, 1,
-0.1712249, -0.4710003, -2.741546, 1, 0, 0, 1, 1,
-0.1616282, -0.8064953, -2.210796, 0, 0, 0, 1, 1,
-0.1558355, -1.15188, -3.317252, 0, 0, 0, 1, 1,
-0.1549937, 0.3028207, -0.1213363, 0, 0, 0, 1, 1,
-0.1526349, 0.143833, -0.6305994, 0, 0, 0, 1, 1,
-0.151327, 1.140753, -0.3238332, 0, 0, 0, 1, 1,
-0.1498681, 1.413603, 0.5119903, 0, 0, 0, 1, 1,
-0.1490971, 1.18575, -1.217934, 0, 0, 0, 1, 1,
-0.1487252, 0.5948924, 0.6747074, 1, 1, 1, 1, 1,
-0.1484973, -0.6109313, -4.102871, 1, 1, 1, 1, 1,
-0.1478615, -0.2664, -2.127232, 1, 1, 1, 1, 1,
-0.1447781, 0.5569275, -0.9357145, 1, 1, 1, 1, 1,
-0.1407798, -0.2876179, -1.667829, 1, 1, 1, 1, 1,
-0.1358849, 1.254186, 0.8429195, 1, 1, 1, 1, 1,
-0.1335349, 1.422971, -1.055893, 1, 1, 1, 1, 1,
-0.1314605, -0.9823082, -1.787853, 1, 1, 1, 1, 1,
-0.1302779, -0.007074606, -2.268842, 1, 1, 1, 1, 1,
-0.1271149, -0.4597967, -2.48369, 1, 1, 1, 1, 1,
-0.1206465, -1.122828, -3.11262, 1, 1, 1, 1, 1,
-0.1203855, 0.8015679, -0.9478353, 1, 1, 1, 1, 1,
-0.1172119, -1.716531, -4.860492, 1, 1, 1, 1, 1,
-0.1145208, 0.7906635, 0.307184, 1, 1, 1, 1, 1,
-0.1136495, 0.9556363, 0.8590333, 1, 1, 1, 1, 1,
-0.1123049, 1.08528, -0.8859193, 0, 0, 1, 1, 1,
-0.1118007, 0.02864239, 0.7244518, 1, 0, 0, 1, 1,
-0.1111352, 0.04384851, -2.716595, 1, 0, 0, 1, 1,
-0.1111316, 0.5418499, -1.259244, 1, 0, 0, 1, 1,
-0.1100813, -0.6658826, -5.810846, 1, 0, 0, 1, 1,
-0.1086171, -0.4446791, -3.227047, 1, 0, 0, 1, 1,
-0.107786, 0.08194879, 0.5056301, 0, 0, 0, 1, 1,
-0.103082, -1.219749, -3.119502, 0, 0, 0, 1, 1,
-0.1003277, -0.2121448, -3.728782, 0, 0, 0, 1, 1,
-0.09891178, -1.22191, -2.896152, 0, 0, 0, 1, 1,
-0.09862659, 0.2232989, -0.4653663, 0, 0, 0, 1, 1,
-0.09839222, -1.224896, -1.188451, 0, 0, 0, 1, 1,
-0.09783399, -0.5562351, -3.107669, 0, 0, 0, 1, 1,
-0.09406717, 2.334358, 0.642932, 1, 1, 1, 1, 1,
-0.08841617, -0.01398539, -2.192128, 1, 1, 1, 1, 1,
-0.08414037, -0.5098985, -1.376567, 1, 1, 1, 1, 1,
-0.08238675, -0.5104636, -3.843851, 1, 1, 1, 1, 1,
-0.0793004, -1.446706, -4.216904, 1, 1, 1, 1, 1,
-0.07813717, 0.6608957, 1.592542, 1, 1, 1, 1, 1,
-0.07380749, 0.7942581, 0.1100088, 1, 1, 1, 1, 1,
-0.06770698, -0.2360698, -4.418736, 1, 1, 1, 1, 1,
-0.06643033, 2.19861, 1.280964, 1, 1, 1, 1, 1,
-0.06364156, 0.8940061, 0.2489622, 1, 1, 1, 1, 1,
-0.06255391, 0.3897711, -0.2323178, 1, 1, 1, 1, 1,
-0.06157633, 0.730038, -0.9177641, 1, 1, 1, 1, 1,
-0.05709963, -1.875869, -2.058863, 1, 1, 1, 1, 1,
-0.05628472, -0.3722319, -3.617077, 1, 1, 1, 1, 1,
-0.05531696, -0.6482436, -3.966634, 1, 1, 1, 1, 1,
-0.05045566, -1.615599, -3.705787, 0, 0, 1, 1, 1,
-0.04810337, 0.5830182, 0.4047352, 1, 0, 0, 1, 1,
-0.04757341, 1.050155, 0.228221, 1, 0, 0, 1, 1,
-0.04710867, 0.2184166, -0.486722, 1, 0, 0, 1, 1,
-0.0460278, 0.2088389, -1.307363, 1, 0, 0, 1, 1,
-0.04562789, 1.132866, 1.921542, 1, 0, 0, 1, 1,
-0.04560111, -0.7832978, -4.247558, 0, 0, 0, 1, 1,
-0.04381486, 0.08590042, -0.2566898, 0, 0, 0, 1, 1,
-0.04143516, 1.263406, 0.4379041, 0, 0, 0, 1, 1,
-0.04088854, 0.6226006, 0.2336043, 0, 0, 0, 1, 1,
-0.04046051, 1.024642, -2.156531, 0, 0, 0, 1, 1,
-0.03701842, 0.2462465, -0.5794541, 0, 0, 0, 1, 1,
-0.03093753, -0.7432323, -3.348181, 0, 0, 0, 1, 1,
-0.02576616, 1.740507, -0.9027494, 1, 1, 1, 1, 1,
-0.02549841, 3.057165, -1.158806, 1, 1, 1, 1, 1,
-0.02392828, 2.537466, 0.4221312, 1, 1, 1, 1, 1,
-0.02278041, 0.5654126, -0.6643522, 1, 1, 1, 1, 1,
-0.02216511, 0.4879523, 1.231791, 1, 1, 1, 1, 1,
-0.01863501, -1.747279, -2.804504, 1, 1, 1, 1, 1,
-0.01625927, 2.070921, -0.9255193, 1, 1, 1, 1, 1,
-0.01509278, 1.152531, -0.6444628, 1, 1, 1, 1, 1,
-0.01387001, 0.5621549, 0.3905997, 1, 1, 1, 1, 1,
-0.01331744, 1.43409, -0.4248214, 1, 1, 1, 1, 1,
-0.01245445, 0.1506655, -0.7090465, 1, 1, 1, 1, 1,
-0.01051991, 0.5730787, 1.255184, 1, 1, 1, 1, 1,
-0.004525315, -1.057602, -2.829406, 1, 1, 1, 1, 1,
-0.00382266, 0.3673801, 1.638894, 1, 1, 1, 1, 1,
0.0005675079, -0.3485329, 5.281161, 1, 1, 1, 1, 1,
0.0006318539, -0.1425039, 2.325356, 0, 0, 1, 1, 1,
0.001328738, -0.4095371, 1.87455, 1, 0, 0, 1, 1,
0.002073444, -0.4127375, 2.794994, 1, 0, 0, 1, 1,
0.002360455, -1.57309, 4.595144, 1, 0, 0, 1, 1,
0.008792835, -0.8226447, 3.751077, 1, 0, 0, 1, 1,
0.008814609, -0.2264322, 3.735655, 1, 0, 0, 1, 1,
0.008934933, -0.507615, 3.252832, 0, 0, 0, 1, 1,
0.0103088, 0.9159819, 2.298975, 0, 0, 0, 1, 1,
0.01555348, 0.3562079, 2.020268, 0, 0, 0, 1, 1,
0.01561866, 0.1796289, 0.7676295, 0, 0, 0, 1, 1,
0.0164864, -0.6798898, 3.405434, 0, 0, 0, 1, 1,
0.01871042, 0.4050444, 0.7844969, 0, 0, 0, 1, 1,
0.02431772, -0.1213305, 3.820022, 0, 0, 0, 1, 1,
0.02590135, -0.4044171, 3.212587, 1, 1, 1, 1, 1,
0.02902165, 1.412866, 0.7120032, 1, 1, 1, 1, 1,
0.03006942, 0.1666826, 0.6156442, 1, 1, 1, 1, 1,
0.03112584, -0.07353862, 3.973196, 1, 1, 1, 1, 1,
0.04172924, 1.168067, 0.005616345, 1, 1, 1, 1, 1,
0.04284946, -0.9201702, 2.905191, 1, 1, 1, 1, 1,
0.04336923, -0.1785211, 4.656787, 1, 1, 1, 1, 1,
0.04432062, -1.661065, 3.058331, 1, 1, 1, 1, 1,
0.04999594, 0.7079475, 2.009063, 1, 1, 1, 1, 1,
0.05131546, -1.149654, 1.932959, 1, 1, 1, 1, 1,
0.05139815, 2.27953, 0.04041914, 1, 1, 1, 1, 1,
0.0535674, -2.048615, 0.7800378, 1, 1, 1, 1, 1,
0.05441681, -1.005221, 2.569109, 1, 1, 1, 1, 1,
0.0559739, -0.5672711, 2.924069, 1, 1, 1, 1, 1,
0.05665641, 0.293344, -0.9325562, 1, 1, 1, 1, 1,
0.05976181, -0.2841311, 1.707341, 0, 0, 1, 1, 1,
0.05979845, -0.42809, 3.168379, 1, 0, 0, 1, 1,
0.06051748, -0.1948163, 2.951092, 1, 0, 0, 1, 1,
0.06066466, -0.7199564, 2.191071, 1, 0, 0, 1, 1,
0.06210958, 0.9926902, -0.165356, 1, 0, 0, 1, 1,
0.07326219, -0.8547563, 2.97777, 1, 0, 0, 1, 1,
0.07596979, 0.5045024, 0.8256957, 0, 0, 0, 1, 1,
0.07630423, 1.64147, 1.036566, 0, 0, 0, 1, 1,
0.08423121, 0.3832232, 0.02490666, 0, 0, 0, 1, 1,
0.08937232, 0.9668056, -0.1914467, 0, 0, 0, 1, 1,
0.09466867, -2.065825, 5.0369, 0, 0, 0, 1, 1,
0.100466, -0.5132608, 3.830914, 0, 0, 0, 1, 1,
0.1026311, 2.113806, 0.3830765, 0, 0, 0, 1, 1,
0.104317, -1.148515, 3.495851, 1, 1, 1, 1, 1,
0.1084871, -0.6039758, 2.814032, 1, 1, 1, 1, 1,
0.1189279, -0.5928085, 2.953946, 1, 1, 1, 1, 1,
0.1227637, -1.56336, 4.732243, 1, 1, 1, 1, 1,
0.1240744, 1.009197, -0.1650542, 1, 1, 1, 1, 1,
0.1254166, -0.2304458, 2.697399, 1, 1, 1, 1, 1,
0.1258178, 0.567253, -1.164471, 1, 1, 1, 1, 1,
0.1265694, 0.3261888, -1.493964, 1, 1, 1, 1, 1,
0.1288361, -0.01456054, 1.328875, 1, 1, 1, 1, 1,
0.1308244, 1.378503, 0.3788196, 1, 1, 1, 1, 1,
0.1313151, -1.374497, 2.492226, 1, 1, 1, 1, 1,
0.1327175, 0.4746029, -0.6742588, 1, 1, 1, 1, 1,
0.1362804, -1.161888, 3.595817, 1, 1, 1, 1, 1,
0.1419943, -1.534601, 2.343071, 1, 1, 1, 1, 1,
0.1424974, 0.1451313, 0.6824945, 1, 1, 1, 1, 1,
0.1429626, 0.1049621, 0.2072794, 0, 0, 1, 1, 1,
0.143637, 1.638394, 1.836031, 1, 0, 0, 1, 1,
0.1459245, 1.72999, 1.298566, 1, 0, 0, 1, 1,
0.14959, 0.1948738, 1.559775, 1, 0, 0, 1, 1,
0.1531483, 1.048887, 0.4044227, 1, 0, 0, 1, 1,
0.1553929, 0.2400838, 0.4632192, 1, 0, 0, 1, 1,
0.1585908, 1.273547, 0.6767625, 0, 0, 0, 1, 1,
0.1594813, -2.833116, 2.595989, 0, 0, 0, 1, 1,
0.1655024, 1.029031, 0.5505844, 0, 0, 0, 1, 1,
0.1657903, 0.5038968, 0.4367481, 0, 0, 0, 1, 1,
0.1710987, -0.6077947, 3.258117, 0, 0, 0, 1, 1,
0.1758585, 0.7230493, 1.653474, 0, 0, 0, 1, 1,
0.1867344, -1.468067, 1.775815, 0, 0, 0, 1, 1,
0.187759, -1.078555, 1.362594, 1, 1, 1, 1, 1,
0.1899828, -0.603475, 3.433466, 1, 1, 1, 1, 1,
0.1901049, -0.4888066, 3.414787, 1, 1, 1, 1, 1,
0.1903654, -0.5174471, 3.677923, 1, 1, 1, 1, 1,
0.1950367, -0.6725634, 2.813724, 1, 1, 1, 1, 1,
0.195816, 0.01870301, 2.34409, 1, 1, 1, 1, 1,
0.1975197, -1.139537, 2.533489, 1, 1, 1, 1, 1,
0.19904, -1.554794, 2.971936, 1, 1, 1, 1, 1,
0.2009715, 1.37449, 1.720215, 1, 1, 1, 1, 1,
0.2064728, 0.7348115, -1.072342, 1, 1, 1, 1, 1,
0.209616, 0.522563, -0.3136269, 1, 1, 1, 1, 1,
0.2138594, -1.034264, 2.882895, 1, 1, 1, 1, 1,
0.215397, -0.3088919, 2.138023, 1, 1, 1, 1, 1,
0.2157533, -0.8860106, 3.555288, 1, 1, 1, 1, 1,
0.216301, 0.5410843, -0.2238972, 1, 1, 1, 1, 1,
0.2178524, -1.482225, 1.308018, 0, 0, 1, 1, 1,
0.2183319, -1.745666, 3.05024, 1, 0, 0, 1, 1,
0.2209487, 0.2595937, -0.0434639, 1, 0, 0, 1, 1,
0.2227412, 2.821323, -1.415236, 1, 0, 0, 1, 1,
0.2233378, -0.469303, 1.056152, 1, 0, 0, 1, 1,
0.2253056, -0.3194609, 2.574476, 1, 0, 0, 1, 1,
0.225636, -0.6312634, 2.490619, 0, 0, 0, 1, 1,
0.2269227, 1.757693, -0.227195, 0, 0, 0, 1, 1,
0.2324671, 0.03822105, 2.392088, 0, 0, 0, 1, 1,
0.2338551, -0.2314445, 2.922838, 0, 0, 0, 1, 1,
0.2340519, 1.856808, 1.532849, 0, 0, 0, 1, 1,
0.2365711, 1.356322, 1.171378, 0, 0, 0, 1, 1,
0.2397275, 0.5132551, 1.552452, 0, 0, 0, 1, 1,
0.2400644, -1.475462, 5.208753, 1, 1, 1, 1, 1,
0.2408785, 2.448776, -0.9947993, 1, 1, 1, 1, 1,
0.2418394, -0.04590071, 2.159552, 1, 1, 1, 1, 1,
0.2441488, 1.835008, -0.7819843, 1, 1, 1, 1, 1,
0.2548858, -0.6539702, 2.140693, 1, 1, 1, 1, 1,
0.2572199, 2.223819, 0.07644911, 1, 1, 1, 1, 1,
0.2624158, -0.7088053, 3.892786, 1, 1, 1, 1, 1,
0.2625223, -0.1458883, 1.445994, 1, 1, 1, 1, 1,
0.2634356, -0.8370927, 2.678385, 1, 1, 1, 1, 1,
0.2656016, 0.3502863, 1.97504, 1, 1, 1, 1, 1,
0.2704664, -1.673176, 3.128141, 1, 1, 1, 1, 1,
0.2706104, 0.1715967, 0.3016495, 1, 1, 1, 1, 1,
0.2750203, 1.126402, -0.7563865, 1, 1, 1, 1, 1,
0.2786393, 0.544997, 0.8999568, 1, 1, 1, 1, 1,
0.2796776, 0.895379, -1.396674, 1, 1, 1, 1, 1,
0.2837057, 1.520982, -0.380006, 0, 0, 1, 1, 1,
0.2848015, -0.4095801, 3.053916, 1, 0, 0, 1, 1,
0.2850555, 0.6308995, -0.08540832, 1, 0, 0, 1, 1,
0.2894294, -0.8426241, 3.485206, 1, 0, 0, 1, 1,
0.2903628, -0.07578316, 1.169768, 1, 0, 0, 1, 1,
0.2925017, -0.16704, 1.007966, 1, 0, 0, 1, 1,
0.2957845, -0.1214976, 1.130944, 0, 0, 0, 1, 1,
0.2994213, -0.8904751, 2.316036, 0, 0, 0, 1, 1,
0.3024678, 2.503973, -0.4165454, 0, 0, 0, 1, 1,
0.3024784, -1.093722, 2.494529, 0, 0, 0, 1, 1,
0.3027031, 0.3473633, -0.8163339, 0, 0, 0, 1, 1,
0.3069532, -0.5419405, 2.114584, 0, 0, 0, 1, 1,
0.3092014, -0.9744091, 4.308053, 0, 0, 0, 1, 1,
0.309548, 0.6328529, 1.936817, 1, 1, 1, 1, 1,
0.3102207, 1.949922, 0.5485108, 1, 1, 1, 1, 1,
0.3111279, 1.263929, 2.73618, 1, 1, 1, 1, 1,
0.31134, 0.6528465, 0.009316026, 1, 1, 1, 1, 1,
0.3119607, -1.926331, 3.171739, 1, 1, 1, 1, 1,
0.3135968, 2.162803, 0.819529, 1, 1, 1, 1, 1,
0.314514, -0.5436092, 4.107361, 1, 1, 1, 1, 1,
0.3163115, 1.434114, 0.9988804, 1, 1, 1, 1, 1,
0.3207858, 0.3246956, 2.001, 1, 1, 1, 1, 1,
0.321531, -1.029682, 2.312804, 1, 1, 1, 1, 1,
0.3221874, 0.4652325, 0.3322721, 1, 1, 1, 1, 1,
0.3239532, 0.381514, 1.388211, 1, 1, 1, 1, 1,
0.3243658, -0.4097537, 1.722902, 1, 1, 1, 1, 1,
0.3254424, -0.4052447, 1.21585, 1, 1, 1, 1, 1,
0.3254511, 0.6814055, 1.054037, 1, 1, 1, 1, 1,
0.3385038, -1.360927, 1.877215, 0, 0, 1, 1, 1,
0.3451205, -0.7339612, 1.106797, 1, 0, 0, 1, 1,
0.3512342, 1.852874, -0.2403747, 1, 0, 0, 1, 1,
0.3614548, -1.483477, 2.761436, 1, 0, 0, 1, 1,
0.3632407, 1.248577, 1.522363, 1, 0, 0, 1, 1,
0.363984, 0.05367303, 0.9757754, 1, 0, 0, 1, 1,
0.367034, 0.1042707, 1.370101, 0, 0, 0, 1, 1,
0.3670844, 0.874908, 0.3421679, 0, 0, 0, 1, 1,
0.3688679, 1.294789, 0.8439065, 0, 0, 0, 1, 1,
0.3693951, 0.3690598, 1.78926, 0, 0, 0, 1, 1,
0.3702563, -0.9734705, 2.665563, 0, 0, 0, 1, 1,
0.3706751, 1.431543, -0.2576016, 0, 0, 0, 1, 1,
0.3741474, -1.319399, 3.548002, 0, 0, 0, 1, 1,
0.3790161, 2.182061, 0.1085349, 1, 1, 1, 1, 1,
0.381843, -0.8997324, 3.08088, 1, 1, 1, 1, 1,
0.3842354, -1.250562, 2.093594, 1, 1, 1, 1, 1,
0.3868978, 0.844534, 0.3447307, 1, 1, 1, 1, 1,
0.3875863, 1.389436, 0.3417995, 1, 1, 1, 1, 1,
0.3883699, 0.5847771, 1.13765, 1, 1, 1, 1, 1,
0.3884815, 1.138639, 0.5193887, 1, 1, 1, 1, 1,
0.3919956, -0.6094683, 3.34974, 1, 1, 1, 1, 1,
0.3932866, 1.104295, 0.7062581, 1, 1, 1, 1, 1,
0.3946038, -0.6084764, 1.974624, 1, 1, 1, 1, 1,
0.3947573, -1.585388, 3.97049, 1, 1, 1, 1, 1,
0.3965024, 0.2379696, 1.617571, 1, 1, 1, 1, 1,
0.3988332, -1.256285, 2.203646, 1, 1, 1, 1, 1,
0.4036983, -0.9281775, 3.055232, 1, 1, 1, 1, 1,
0.4047846, -1.090171, 2.896663, 1, 1, 1, 1, 1,
0.4099127, -0.9195071, 1.985028, 0, 0, 1, 1, 1,
0.4112069, 1.577587, -0.411495, 1, 0, 0, 1, 1,
0.4200498, -1.755912, 2.656069, 1, 0, 0, 1, 1,
0.4230539, 0.6188787, 0.2081248, 1, 0, 0, 1, 1,
0.4240759, -1.702259, 1.738071, 1, 0, 0, 1, 1,
0.4264303, 1.224441, -1.420493, 1, 0, 0, 1, 1,
0.4273934, 0.04507098, 1.072802, 0, 0, 0, 1, 1,
0.4277124, -1.184227, 2.517033, 0, 0, 0, 1, 1,
0.4311807, -1.057114, 2.09392, 0, 0, 0, 1, 1,
0.4320651, 0.8289903, -0.08185844, 0, 0, 0, 1, 1,
0.4335432, 1.420926, -0.8537262, 0, 0, 0, 1, 1,
0.4368469, 1.168174, 2.225035, 0, 0, 0, 1, 1,
0.4373893, 0.9579335, 1.056118, 0, 0, 0, 1, 1,
0.4486251, -0.4238924, 5.040707, 1, 1, 1, 1, 1,
0.4510485, 2.571526, -1.354004, 1, 1, 1, 1, 1,
0.4552407, 0.4971642, 0.6811349, 1, 1, 1, 1, 1,
0.4556924, -1.326163, 1.952403, 1, 1, 1, 1, 1,
0.4570506, -0.3369238, 1.389827, 1, 1, 1, 1, 1,
0.4590687, -0.5768191, 1.389774, 1, 1, 1, 1, 1,
0.4601593, 0.5240261, 2.101506, 1, 1, 1, 1, 1,
0.461667, 0.8862614, 0.3503321, 1, 1, 1, 1, 1,
0.4636125, 0.9910097, 0.8116331, 1, 1, 1, 1, 1,
0.4680739, -0.7588354, 1.847701, 1, 1, 1, 1, 1,
0.468994, 0.7203926, 0.09323177, 1, 1, 1, 1, 1,
0.4811352, 0.1049735, 1.631483, 1, 1, 1, 1, 1,
0.4818473, -3.482481, 4.360928, 1, 1, 1, 1, 1,
0.4833972, -1.977004, 3.162209, 1, 1, 1, 1, 1,
0.4836189, -0.03313387, 1.847793, 1, 1, 1, 1, 1,
0.4847269, -0.480578, 3.087464, 0, 0, 1, 1, 1,
0.4988812, 1.553462, 1.380499, 1, 0, 0, 1, 1,
0.4992165, 0.1123548, 3.463705, 1, 0, 0, 1, 1,
0.4992814, -0.6988767, 1.373796, 1, 0, 0, 1, 1,
0.5045001, 0.7244304, 0.8993407, 1, 0, 0, 1, 1,
0.5046402, -0.560545, 2.637168, 1, 0, 0, 1, 1,
0.505039, -0.5304609, 2.759468, 0, 0, 0, 1, 1,
0.50687, 1.627941, -0.07790299, 0, 0, 0, 1, 1,
0.5072727, -1.35219, 3.224046, 0, 0, 0, 1, 1,
0.5087244, 0.2119434, 1.242917, 0, 0, 0, 1, 1,
0.513304, -0.2201189, 2.92227, 0, 0, 0, 1, 1,
0.5135351, -1.221698, 0.9390291, 0, 0, 0, 1, 1,
0.5149835, 0.06963209, 0.6945488, 0, 0, 0, 1, 1,
0.5157438, 0.6054314, 2.397984, 1, 1, 1, 1, 1,
0.516345, -0.6293012, 2.052647, 1, 1, 1, 1, 1,
0.5203556, 0.7892424, -0.7518729, 1, 1, 1, 1, 1,
0.5225996, 0.896726, -1.495088, 1, 1, 1, 1, 1,
0.5228266, 1.045657, 0.1057933, 1, 1, 1, 1, 1,
0.5230869, 1.863001, 0.8753639, 1, 1, 1, 1, 1,
0.5244687, -0.1773616, 4.396258, 1, 1, 1, 1, 1,
0.5248746, 1.845012, 1.512865, 1, 1, 1, 1, 1,
0.5259259, -0.3576875, 1.940904, 1, 1, 1, 1, 1,
0.5265718, 1.173519, 0.4503953, 1, 1, 1, 1, 1,
0.5351214, 0.1378537, 0.04065232, 1, 1, 1, 1, 1,
0.5378811, -0.2418606, 2.378764, 1, 1, 1, 1, 1,
0.5381026, -0.1978835, 1.073072, 1, 1, 1, 1, 1,
0.5396306, -0.8042629, 0.7455506, 1, 1, 1, 1, 1,
0.5445636, -0.1146471, 2.770907, 1, 1, 1, 1, 1,
0.5457901, -0.4991355, 3.674939, 0, 0, 1, 1, 1,
0.5491927, 2.144158, 1.053547, 1, 0, 0, 1, 1,
0.5517733, -2.859409, 1.491227, 1, 0, 0, 1, 1,
0.5541368, 2.064533, 0.6883888, 1, 0, 0, 1, 1,
0.5542531, -2.198188, 2.603257, 1, 0, 0, 1, 1,
0.5547114, 1.240477, 0.3431962, 1, 0, 0, 1, 1,
0.5642189, -0.2377702, 3.164617, 0, 0, 0, 1, 1,
0.5644594, -0.4004272, 2.53847, 0, 0, 0, 1, 1,
0.566631, 1.10648, -1.028581, 0, 0, 0, 1, 1,
0.5695897, 0.8127391, -0.6830337, 0, 0, 0, 1, 1,
0.5701858, 0.4866442, 0.4646115, 0, 0, 0, 1, 1,
0.5709605, -0.09885693, 1.058903, 0, 0, 0, 1, 1,
0.5788394, 0.9323043, 2.360468, 0, 0, 0, 1, 1,
0.5818332, 0.5164766, 0.07652111, 1, 1, 1, 1, 1,
0.5828569, 0.8295323, 0.5379028, 1, 1, 1, 1, 1,
0.5839755, -1.155336, 3.503996, 1, 1, 1, 1, 1,
0.5862136, -0.4819391, 2.480735, 1, 1, 1, 1, 1,
0.5974439, 0.5711836, 1.908923, 1, 1, 1, 1, 1,
0.5998637, 0.9063158, -0.3882704, 1, 1, 1, 1, 1,
0.6001926, 0.998614, 0.4477601, 1, 1, 1, 1, 1,
0.6020685, 0.639487, 0.4883851, 1, 1, 1, 1, 1,
0.6069306, 0.9877127, -0.3757155, 1, 1, 1, 1, 1,
0.609639, 0.05009646, 0.7210236, 1, 1, 1, 1, 1,
0.6111628, 0.7993021, 0.1349155, 1, 1, 1, 1, 1,
0.611461, -0.4138407, 1.13578, 1, 1, 1, 1, 1,
0.6124845, 1.880414, -0.93128, 1, 1, 1, 1, 1,
0.6150041, -1.380113, 2.583379, 1, 1, 1, 1, 1,
0.6174937, 2.385992, 1.543305, 1, 1, 1, 1, 1,
0.6210196, 1.862794, 1.405574, 0, 0, 1, 1, 1,
0.6211853, -1.527287, 4.286568, 1, 0, 0, 1, 1,
0.6215466, 0.7633867, -0.6574724, 1, 0, 0, 1, 1,
0.6391879, -0.2450054, 2.381588, 1, 0, 0, 1, 1,
0.6417357, -1.542673, 4.438201, 1, 0, 0, 1, 1,
0.6444151, -0.7049603, 3.161293, 1, 0, 0, 1, 1,
0.645174, -0.1626356, 1.683074, 0, 0, 0, 1, 1,
0.6487358, 0.2284508, 1.377993, 0, 0, 0, 1, 1,
0.6508697, -0.3292553, 2.571254, 0, 0, 0, 1, 1,
0.6527275, 2.316132, 0.2928146, 0, 0, 0, 1, 1,
0.6588482, 1.086903, 0.4392623, 0, 0, 0, 1, 1,
0.6604367, -1.22086, 2.706508, 0, 0, 0, 1, 1,
0.6636727, -1.34012, 3.248321, 0, 0, 0, 1, 1,
0.6645334, 1.324836, 1.248044, 1, 1, 1, 1, 1,
0.6666721, 0.1138463, 0.1076632, 1, 1, 1, 1, 1,
0.6708096, -1.022429, 3.952662, 1, 1, 1, 1, 1,
0.671362, 0.3493429, 1.441111, 1, 1, 1, 1, 1,
0.6731913, -0.8012275, -0.3770115, 1, 1, 1, 1, 1,
0.6753854, 2.321872, 0.8581902, 1, 1, 1, 1, 1,
0.6821319, -0.1901839, 2.476307, 1, 1, 1, 1, 1,
0.686407, 0.40834, 1.038081, 1, 1, 1, 1, 1,
0.6864857, -0.8128989, 2.268878, 1, 1, 1, 1, 1,
0.6925744, 0.8059216, 1.373707, 1, 1, 1, 1, 1,
0.6949822, 0.246886, 1.076845, 1, 1, 1, 1, 1,
0.7027283, -2.000449, 1.502105, 1, 1, 1, 1, 1,
0.7038274, 0.4978052, 1.270736, 1, 1, 1, 1, 1,
0.7040213, 0.3925701, 2.08356, 1, 1, 1, 1, 1,
0.7064447, 0.1847337, 1.21542, 1, 1, 1, 1, 1,
0.7077575, -0.6702113, 1.694626, 0, 0, 1, 1, 1,
0.7105033, 1.453387, 1.738606, 1, 0, 0, 1, 1,
0.7125923, -0.337532, 2.237486, 1, 0, 0, 1, 1,
0.7202963, 0.4045103, 0.5935726, 1, 0, 0, 1, 1,
0.7212289, -0.3067934, 2.181081, 1, 0, 0, 1, 1,
0.7258906, -0.3176169, 2.902353, 1, 0, 0, 1, 1,
0.7260541, 0.008357512, -0.3579569, 0, 0, 0, 1, 1,
0.7269452, -0.03122593, 0.8356526, 0, 0, 0, 1, 1,
0.7292991, 0.6518437, 0.2317622, 0, 0, 0, 1, 1,
0.7294682, -1.219466, 0.8069894, 0, 0, 0, 1, 1,
0.7412702, 0.2901019, 1.302069, 0, 0, 0, 1, 1,
0.74257, 1.516629, 0.4399821, 0, 0, 0, 1, 1,
0.7575415, -1.744545, 2.396859, 0, 0, 0, 1, 1,
0.7590714, -0.06658707, -0.252235, 1, 1, 1, 1, 1,
0.7635896, -0.7545131, 3.743505, 1, 1, 1, 1, 1,
0.7659332, -0.4581009, 1.73111, 1, 1, 1, 1, 1,
0.7687116, 1.05758, 1.614178, 1, 1, 1, 1, 1,
0.7700325, -1.51248, 1.128762, 1, 1, 1, 1, 1,
0.7727299, -0.07609703, 1.486844, 1, 1, 1, 1, 1,
0.7763036, -2.229822, 3.932646, 1, 1, 1, 1, 1,
0.784484, 0.7334113, -0.05523078, 1, 1, 1, 1, 1,
0.7975551, 0.5278037, 1.192531, 1, 1, 1, 1, 1,
0.8041152, -1.71834, 3.248921, 1, 1, 1, 1, 1,
0.80479, -1.261532, 1.633173, 1, 1, 1, 1, 1,
0.8049047, -1.234363, 3.75554, 1, 1, 1, 1, 1,
0.8168266, 0.9008397, 2.040428, 1, 1, 1, 1, 1,
0.8299593, 2.360909, 0.09493424, 1, 1, 1, 1, 1,
0.8325481, -0.2766415, 1.998691, 1, 1, 1, 1, 1,
0.8350064, -1.017609, 2.797908, 0, 0, 1, 1, 1,
0.8352758, -0.03388556, 1.915771, 1, 0, 0, 1, 1,
0.8394019, 1.621765, 1.454341, 1, 0, 0, 1, 1,
0.8412002, 0.1985245, 1.877251, 1, 0, 0, 1, 1,
0.8427402, 0.2528389, 0.03788096, 1, 0, 0, 1, 1,
0.8433407, -0.8857468, 2.176327, 1, 0, 0, 1, 1,
0.843789, 1.159892, 0.4225233, 0, 0, 0, 1, 1,
0.8492439, -1.567493, 2.902529, 0, 0, 0, 1, 1,
0.8499811, -1.254491, 3.77428, 0, 0, 0, 1, 1,
0.8520581, -0.4205188, 4.131703, 0, 0, 0, 1, 1,
0.8525819, -0.6915486, 2.745223, 0, 0, 0, 1, 1,
0.8595505, -0.05823699, 2.11796, 0, 0, 0, 1, 1,
0.8602515, -1.173941, 3.492451, 0, 0, 0, 1, 1,
0.8683434, -0.02983433, 0.05101856, 1, 1, 1, 1, 1,
0.8776968, -1.536748, 0.9388363, 1, 1, 1, 1, 1,
0.877731, -0.2760597, 2.136065, 1, 1, 1, 1, 1,
0.8793218, -0.6017175, 1.019392, 1, 1, 1, 1, 1,
0.8804243, 1.038019, 1.397524, 1, 1, 1, 1, 1,
0.8869424, -1.579942, 3.162749, 1, 1, 1, 1, 1,
0.887305, 0.7089799, 0.1649213, 1, 1, 1, 1, 1,
0.8873139, -0.5541738, 1.805008, 1, 1, 1, 1, 1,
0.8983768, -1.247538, 0.6584682, 1, 1, 1, 1, 1,
0.9094181, -0.934612, 2.366495, 1, 1, 1, 1, 1,
0.914641, -0.7642529, 2.414346, 1, 1, 1, 1, 1,
0.9193852, -1.408124, 2.093728, 1, 1, 1, 1, 1,
0.926562, 0.8481606, 0.6605356, 1, 1, 1, 1, 1,
0.9268854, -0.3014655, 3.742148, 1, 1, 1, 1, 1,
0.9273248, -2.097152, 2.132447, 1, 1, 1, 1, 1,
0.9294422, -1.252378, 1.713608, 0, 0, 1, 1, 1,
0.933452, 0.5168885, 0.2098853, 1, 0, 0, 1, 1,
0.9512342, -1.00037, 1.871911, 1, 0, 0, 1, 1,
0.9582137, 0.4809422, 0.4537895, 1, 0, 0, 1, 1,
0.9676217, 0.3443198, 1.667054, 1, 0, 0, 1, 1,
0.9710956, -1.054343, 2.202714, 1, 0, 0, 1, 1,
0.9727788, 1.208599, 0.4681659, 0, 0, 0, 1, 1,
0.982136, -1.329153, 3.158551, 0, 0, 0, 1, 1,
0.9873294, 0.9009784, 0.07168364, 0, 0, 0, 1, 1,
0.9874282, 0.4102186, 1.818223, 0, 0, 0, 1, 1,
0.9926147, 0.9910616, -0.738804, 0, 0, 0, 1, 1,
0.9971899, 2.266102, 0.7021683, 0, 0, 0, 1, 1,
1.001129, 0.5660167, 1.403118, 0, 0, 0, 1, 1,
1.008568, 0.3987378, 0.3021762, 1, 1, 1, 1, 1,
1.008819, -1.144987, 3.573061, 1, 1, 1, 1, 1,
1.012366, -2.072035, 2.150902, 1, 1, 1, 1, 1,
1.018271, 1.741566, -0.513499, 1, 1, 1, 1, 1,
1.021443, 0.5423549, 1.241547, 1, 1, 1, 1, 1,
1.025904, -0.1712649, 1.361302, 1, 1, 1, 1, 1,
1.032181, 1.2099, -0.3516016, 1, 1, 1, 1, 1,
1.03489, -0.2247669, 0.4892763, 1, 1, 1, 1, 1,
1.03811, -0.7439638, 1.624183, 1, 1, 1, 1, 1,
1.053698, -0.2342614, 0.5285523, 1, 1, 1, 1, 1,
1.058965, -0.0869467, 1.290509, 1, 1, 1, 1, 1,
1.061776, -0.2162629, 0.5295492, 1, 1, 1, 1, 1,
1.06451, -0.003985691, 1.018801, 1, 1, 1, 1, 1,
1.081524, 0.8688757, 0.4304084, 1, 1, 1, 1, 1,
1.087421, 0.7352384, 2.191166, 1, 1, 1, 1, 1,
1.087467, -0.1946075, 2.86896, 0, 0, 1, 1, 1,
1.094062, -0.8121982, 1.612792, 1, 0, 0, 1, 1,
1.095785, -0.2504877, 1.916356, 1, 0, 0, 1, 1,
1.110731, 0.5019659, 1.153607, 1, 0, 0, 1, 1,
1.118361, 0.8973, 3.420225, 1, 0, 0, 1, 1,
1.118594, 1.359602, 0.5365963, 1, 0, 0, 1, 1,
1.123103, 0.7946938, 1.303104, 0, 0, 0, 1, 1,
1.131569, -1.211424, 3.268953, 0, 0, 0, 1, 1,
1.132873, -0.5129216, 2.408245, 0, 0, 0, 1, 1,
1.14288, -1.719204, 1.727911, 0, 0, 0, 1, 1,
1.146435, 0.3082838, -0.216065, 0, 0, 0, 1, 1,
1.150567, 0.7154009, 0.9365159, 0, 0, 0, 1, 1,
1.182321, -2.220105, 1.484879, 0, 0, 0, 1, 1,
1.187628, 0.440562, 0.2752909, 1, 1, 1, 1, 1,
1.190376, 0.4107147, 2.331294, 1, 1, 1, 1, 1,
1.190398, 1.365877, 1.423851, 1, 1, 1, 1, 1,
1.196943, -1.778544, 1.916261, 1, 1, 1, 1, 1,
1.197943, 1.782063, 1.677564, 1, 1, 1, 1, 1,
1.198835, -0.7638385, 2.571362, 1, 1, 1, 1, 1,
1.203254, -0.3090346, 1.598153, 1, 1, 1, 1, 1,
1.206633, -1.322859, 2.297932, 1, 1, 1, 1, 1,
1.213834, 0.8929504, 2.166739, 1, 1, 1, 1, 1,
1.220089, -1.753839, 2.130522, 1, 1, 1, 1, 1,
1.235345, 0.5371152, 1.792868, 1, 1, 1, 1, 1,
1.235999, 0.6665985, 1.081153, 1, 1, 1, 1, 1,
1.251265, -1.59039, 3.037487, 1, 1, 1, 1, 1,
1.253322, 0.1319815, 0.1813004, 1, 1, 1, 1, 1,
1.256021, 0.6012028, 1.619262, 1, 1, 1, 1, 1,
1.257025, 0.398381, 1.557398, 0, 0, 1, 1, 1,
1.274354, -2.15167, 2.134836, 1, 0, 0, 1, 1,
1.278162, -0.8269885, 3.308199, 1, 0, 0, 1, 1,
1.284273, 1.545926, 1.208919, 1, 0, 0, 1, 1,
1.285872, -0.4907475, -0.3749112, 1, 0, 0, 1, 1,
1.296221, 0.3781969, 1.217199, 1, 0, 0, 1, 1,
1.296592, 0.4696795, 1.15182, 0, 0, 0, 1, 1,
1.296938, -1.528087, 2.07285, 0, 0, 0, 1, 1,
1.298823, -0.2095245, 2.067921, 0, 0, 0, 1, 1,
1.300185, 0.9748392, -0.003820885, 0, 0, 0, 1, 1,
1.304328, 0.6456658, -0.8912268, 0, 0, 0, 1, 1,
1.3073, -0.3202737, 2.064136, 0, 0, 0, 1, 1,
1.31792, 0.2399688, 0.7308159, 0, 0, 0, 1, 1,
1.321663, -0.3770848, 1.166056, 1, 1, 1, 1, 1,
1.324187, 0.1680549, 1.413299, 1, 1, 1, 1, 1,
1.327932, 0.6264663, 2.156163, 1, 1, 1, 1, 1,
1.331368, 1.224618, -0.753713, 1, 1, 1, 1, 1,
1.331642, 0.9381878, 1.057884, 1, 1, 1, 1, 1,
1.337485, -1.488448, 4.439811, 1, 1, 1, 1, 1,
1.338723, 0.3761259, 0.2892348, 1, 1, 1, 1, 1,
1.33968, 1.255695, 1.444776, 1, 1, 1, 1, 1,
1.343813, -1.741728, 2.922062, 1, 1, 1, 1, 1,
1.34519, -0.02807064, 1.995401, 1, 1, 1, 1, 1,
1.349011, -0.3482451, 1.464653, 1, 1, 1, 1, 1,
1.355398, -0.7542889, 1.330163, 1, 1, 1, 1, 1,
1.357879, 1.307792, -0.2187816, 1, 1, 1, 1, 1,
1.360616, -0.8342602, 2.464629, 1, 1, 1, 1, 1,
1.360797, -0.2981478, 2.203988, 1, 1, 1, 1, 1,
1.365387, -0.428302, 2.383241, 0, 0, 1, 1, 1,
1.377225, 0.5308688, 0.3577637, 1, 0, 0, 1, 1,
1.377725, -0.2954868, 3.013766, 1, 0, 0, 1, 1,
1.381848, -0.05382491, 2.541395, 1, 0, 0, 1, 1,
1.388931, 0.931701, 0.1978025, 1, 0, 0, 1, 1,
1.393391, -0.4011576, 1.351695, 1, 0, 0, 1, 1,
1.396614, -0.2911649, 1.343208, 0, 0, 0, 1, 1,
1.398939, -0.3820604, 1.430567, 0, 0, 0, 1, 1,
1.400767, 0.6523799, 1.306941, 0, 0, 0, 1, 1,
1.423784, -0.07181352, 2.640346, 0, 0, 0, 1, 1,
1.429046, -0.1638079, 1.810898, 0, 0, 0, 1, 1,
1.431291, -1.41441, 1.626172, 0, 0, 0, 1, 1,
1.432887, 0.1844926, 0.9016268, 0, 0, 0, 1, 1,
1.441185, 0.1813483, 1.061328, 1, 1, 1, 1, 1,
1.478194, 0.01654229, 2.419269, 1, 1, 1, 1, 1,
1.479818, 0.3534879, 1.247383, 1, 1, 1, 1, 1,
1.487655, -0.9007632, 0.6176718, 1, 1, 1, 1, 1,
1.493015, -1.554439, 2.590517, 1, 1, 1, 1, 1,
1.497673, 0.7342446, -0.3184555, 1, 1, 1, 1, 1,
1.509336, 0.2156292, 1.672859, 1, 1, 1, 1, 1,
1.519047, 1.160101, 1.071638, 1, 1, 1, 1, 1,
1.519773, 0.4883124, 0.9210588, 1, 1, 1, 1, 1,
1.523493, -0.4612446, 2.075161, 1, 1, 1, 1, 1,
1.541028, 0.2930215, 1.864638, 1, 1, 1, 1, 1,
1.544473, -0.3207308, 2.136713, 1, 1, 1, 1, 1,
1.544991, -0.6352115, 1.877596, 1, 1, 1, 1, 1,
1.575306, -1.044441, 3.087799, 1, 1, 1, 1, 1,
1.59117, 0.0249857, 1.379431, 1, 1, 1, 1, 1,
1.607767, -0.8080326, 0.4715941, 0, 0, 1, 1, 1,
1.610354, -0.2284961, 1.841771, 1, 0, 0, 1, 1,
1.621529, -2.374369, 1.416875, 1, 0, 0, 1, 1,
1.621807, -0.7179697, 1.348498, 1, 0, 0, 1, 1,
1.636606, -0.6179874, 2.408439, 1, 0, 0, 1, 1,
1.640982, 0.6925809, -0.2504182, 1, 0, 0, 1, 1,
1.64594, -0.7019734, 1.831769, 0, 0, 0, 1, 1,
1.6462, -0.7130972, 2.648946, 0, 0, 0, 1, 1,
1.692792, -0.5107601, 0.6664653, 0, 0, 0, 1, 1,
1.699359, 0.6147699, 1.093023, 0, 0, 0, 1, 1,
1.703238, -2.113931, 2.905076, 0, 0, 0, 1, 1,
1.760294, 1.348522, 0.4270568, 0, 0, 0, 1, 1,
1.78081, 0.2207792, 0.8699937, 0, 0, 0, 1, 1,
1.807848, 0.5987038, 2.26719, 1, 1, 1, 1, 1,
1.835304, 0.4316286, 1.648876, 1, 1, 1, 1, 1,
1.852504, -0.310976, 2.003261, 1, 1, 1, 1, 1,
1.857784, 1.883354, -0.369054, 1, 1, 1, 1, 1,
1.879925, -0.03885309, 1.763277, 1, 1, 1, 1, 1,
1.880198, -1.323127, 3.241644, 1, 1, 1, 1, 1,
1.892683, 1.371286, 0.9514407, 1, 1, 1, 1, 1,
1.893027, -0.6634335, 3.338903, 1, 1, 1, 1, 1,
1.942289, 0.2152772, 2.934521, 1, 1, 1, 1, 1,
1.946888, 0.5449189, -0.5290426, 1, 1, 1, 1, 1,
1.966437, -1.928342, 2.195949, 1, 1, 1, 1, 1,
1.969672, 1.031349, 2.801722, 1, 1, 1, 1, 1,
1.977228, -0.2405938, 1.355675, 1, 1, 1, 1, 1,
2.006592, 0.3864834, 0.8180826, 1, 1, 1, 1, 1,
2.013689, -0.5958387, 0.223232, 1, 1, 1, 1, 1,
2.035151, 1.867645, 0.01824993, 0, 0, 1, 1, 1,
2.041154, 0.521853, 0.08642896, 1, 0, 0, 1, 1,
2.043126, 0.2720405, 1.714985, 1, 0, 0, 1, 1,
2.071318, -0.8085339, 1.436317, 1, 0, 0, 1, 1,
2.096018, 0.2310052, 0.6925147, 1, 0, 0, 1, 1,
2.10245, 0.4100774, 0.7380956, 1, 0, 0, 1, 1,
2.174191, -0.9410483, 3.141024, 0, 0, 0, 1, 1,
2.199334, 1.021354, 2.743772, 0, 0, 0, 1, 1,
2.203257, 0.137296, 1.993225, 0, 0, 0, 1, 1,
2.234907, -0.91016, 2.940976, 0, 0, 0, 1, 1,
2.354143, 0.0460589, 1.79037, 0, 0, 0, 1, 1,
2.357221, -0.556269, 1.805147, 0, 0, 0, 1, 1,
2.440732, 2.612228, 1.881107, 0, 0, 0, 1, 1,
2.533741, 0.7124577, -0.7793595, 1, 1, 1, 1, 1,
2.57379, -1.918164, 0.4829665, 1, 1, 1, 1, 1,
2.621514, -2.640146, 2.87618, 1, 1, 1, 1, 1,
2.796006, 0.2112892, 0.4257993, 1, 1, 1, 1, 1,
2.854004, 0.02769179, -0.3736616, 1, 1, 1, 1, 1,
3.122014, 0.8178083, 1.840358, 1, 1, 1, 1, 1,
3.454747, 0.5113871, 1.767416, 1, 1, 1, 1, 1
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
var radius = 9.850723;
var distance = 34.60024;
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
mvMatrix.translate( -0.1169875, 0.1779094, 0.2648427 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.60024);
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
