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
-3.026432, 1.304305, -0.2204686, 1, 0, 0, 1,
-2.879426, 0.7050992, -1.455075, 1, 0.007843138, 0, 1,
-2.784935, -1.319049, -1.517537, 1, 0.01176471, 0, 1,
-2.638199, 0.298209, -2.103593, 1, 0.01960784, 0, 1,
-2.603405, -0.9394796, -2.183501, 1, 0.02352941, 0, 1,
-2.571452, -0.09370323, -0.8698028, 1, 0.03137255, 0, 1,
-2.5651, -0.7226737, -2.265767, 1, 0.03529412, 0, 1,
-2.539817, 0.3898262, -0.458621, 1, 0.04313726, 0, 1,
-2.502819, -1.575198, -1.608709, 1, 0.04705882, 0, 1,
-2.494418, -0.346266, -2.678558, 1, 0.05490196, 0, 1,
-2.430082, 0.8141115, -1.651369, 1, 0.05882353, 0, 1,
-2.408441, -0.2029932, -1.566856, 1, 0.06666667, 0, 1,
-2.381277, 0.03861087, -1.46762, 1, 0.07058824, 0, 1,
-2.340444, -1.170235, -2.02598, 1, 0.07843138, 0, 1,
-2.302466, 1.410081, -1.402846, 1, 0.08235294, 0, 1,
-2.261153, 0.7258143, -1.119579, 1, 0.09019608, 0, 1,
-2.246525, 0.2771985, 0.1182071, 1, 0.09411765, 0, 1,
-2.199414, 0.1354613, -2.632973, 1, 0.1019608, 0, 1,
-2.182781, -0.3161513, -1.597649, 1, 0.1098039, 0, 1,
-2.167596, 0.4759001, 0.2403447, 1, 0.1137255, 0, 1,
-2.143861, -0.3720541, -1.795539, 1, 0.1215686, 0, 1,
-2.139961, -1.096468, -2.783491, 1, 0.1254902, 0, 1,
-2.130245, 0.6123255, -1.882143, 1, 0.1333333, 0, 1,
-2.129351, 0.5085304, 0.7259189, 1, 0.1372549, 0, 1,
-2.11576, 0.4568624, -0.9784461, 1, 0.145098, 0, 1,
-2.099844, 0.4623398, -1.784798, 1, 0.1490196, 0, 1,
-2.094621, -1.349841, -2.965739, 1, 0.1568628, 0, 1,
-2.036663, -0.2384897, -1.748752, 1, 0.1607843, 0, 1,
-2.032234, -1.422776, -4.017715, 1, 0.1686275, 0, 1,
-2.029276, -0.3336726, -1.224741, 1, 0.172549, 0, 1,
-2.026798, 1.530709, -0.5708344, 1, 0.1803922, 0, 1,
-2.019388, -0.4353357, -1.390347, 1, 0.1843137, 0, 1,
-2.006799, -1.69157, -1.146972, 1, 0.1921569, 0, 1,
-1.972454, -0.1025978, -0.6795636, 1, 0.1960784, 0, 1,
-1.896963, -0.3800271, -0.5771596, 1, 0.2039216, 0, 1,
-1.896529, 1.557212, -0.6551186, 1, 0.2117647, 0, 1,
-1.883835, -0.5180908, -1.987743, 1, 0.2156863, 0, 1,
-1.862515, -0.4195966, -2.068705, 1, 0.2235294, 0, 1,
-1.845646, 1.003946, -2.132393, 1, 0.227451, 0, 1,
-1.822525, 0.1426371, -1.996697, 1, 0.2352941, 0, 1,
-1.817143, 1.641879, -0.3655632, 1, 0.2392157, 0, 1,
-1.815454, 0.3717169, -1.180388, 1, 0.2470588, 0, 1,
-1.806669, 0.3380115, -2.843493, 1, 0.2509804, 0, 1,
-1.804433, 0.4984345, -2.636874, 1, 0.2588235, 0, 1,
-1.794696, -0.5681308, -1.085243, 1, 0.2627451, 0, 1,
-1.786956, -1.285604, -3.454248, 1, 0.2705882, 0, 1,
-1.757702, -0.5192187, -3.396504, 1, 0.2745098, 0, 1,
-1.742322, 0.2886143, -1.774055, 1, 0.282353, 0, 1,
-1.736343, -0.4621342, -2.284125, 1, 0.2862745, 0, 1,
-1.732142, 0.8056042, -4.261427, 1, 0.2941177, 0, 1,
-1.731818, -0.941373, -2.897468, 1, 0.3019608, 0, 1,
-1.723288, -0.7596382, -1.53428, 1, 0.3058824, 0, 1,
-1.721814, 0.7001298, -1.550042, 1, 0.3137255, 0, 1,
-1.706605, -0.3940088, -2.76254, 1, 0.3176471, 0, 1,
-1.703491, -0.6182922, -2.209713, 1, 0.3254902, 0, 1,
-1.70243, 0.3687454, 0.1444801, 1, 0.3294118, 0, 1,
-1.694216, -0.1452147, -2.01957, 1, 0.3372549, 0, 1,
-1.66478, -1.393692, -0.9366281, 1, 0.3411765, 0, 1,
-1.6364, 1.324072, -3.126371, 1, 0.3490196, 0, 1,
-1.564426, -0.7215985, -3.423941, 1, 0.3529412, 0, 1,
-1.55989, 2.273786, 0.2256624, 1, 0.3607843, 0, 1,
-1.554092, -0.008167238, -1.016497, 1, 0.3647059, 0, 1,
-1.55353, -0.1953487, -2.621615, 1, 0.372549, 0, 1,
-1.54279, 0.6378012, -1.41942, 1, 0.3764706, 0, 1,
-1.542649, -1.187198, -0.5627419, 1, 0.3843137, 0, 1,
-1.5414, -0.04671581, -1.070171, 1, 0.3882353, 0, 1,
-1.499895, 0.09880693, -0.4759668, 1, 0.3960784, 0, 1,
-1.482905, -0.06832466, -1.629055, 1, 0.4039216, 0, 1,
-1.478253, -0.6696395, -1.361975, 1, 0.4078431, 0, 1,
-1.471516, 1.586018, 0.3363588, 1, 0.4156863, 0, 1,
-1.467176, 0.5847704, -0.850062, 1, 0.4196078, 0, 1,
-1.466537, -1.779623, 0.2601921, 1, 0.427451, 0, 1,
-1.458558, -0.03810242, -1.26088, 1, 0.4313726, 0, 1,
-1.451368, 0.1076212, -3.089253, 1, 0.4392157, 0, 1,
-1.447188, -1.428912, -3.814075, 1, 0.4431373, 0, 1,
-1.444071, -0.2570263, -3.792144, 1, 0.4509804, 0, 1,
-1.440324, -1.484879, -1.742171, 1, 0.454902, 0, 1,
-1.417034, -0.0856091, -1.074683, 1, 0.4627451, 0, 1,
-1.412204, -1.048486, -1.888828, 1, 0.4666667, 0, 1,
-1.405868, 0.4800355, -0.7151351, 1, 0.4745098, 0, 1,
-1.386185, 0.6207863, -4.242874, 1, 0.4784314, 0, 1,
-1.385634, -2.014533, -2.78301, 1, 0.4862745, 0, 1,
-1.38288, -1.518817, -1.053406, 1, 0.4901961, 0, 1,
-1.376866, 0.2681231, -1.00858, 1, 0.4980392, 0, 1,
-1.36912, 1.000268, -0.9220441, 1, 0.5058824, 0, 1,
-1.367529, 1.198048, -1.310282, 1, 0.509804, 0, 1,
-1.358332, -0.9066439, -2.090561, 1, 0.5176471, 0, 1,
-1.349035, -1.378893, -5.302588, 1, 0.5215687, 0, 1,
-1.338551, -1.447981, -0.8053224, 1, 0.5294118, 0, 1,
-1.336266, 0.242806, -1.615236, 1, 0.5333334, 0, 1,
-1.330955, -0.1294498, -1.099713, 1, 0.5411765, 0, 1,
-1.32026, -0.3911406, -2.783912, 1, 0.5450981, 0, 1,
-1.318981, -0.2007932, -0.8431504, 1, 0.5529412, 0, 1,
-1.31435, 1.597207, -3.076161, 1, 0.5568628, 0, 1,
-1.312292, -0.1064095, -0.4231506, 1, 0.5647059, 0, 1,
-1.311104, -0.7485151, -1.180265, 1, 0.5686275, 0, 1,
-1.296785, 0.5827375, -2.193029, 1, 0.5764706, 0, 1,
-1.294937, 0.3012735, -0.998791, 1, 0.5803922, 0, 1,
-1.293552, -1.012869, -3.602217, 1, 0.5882353, 0, 1,
-1.288546, 1.375116, -1.760631, 1, 0.5921569, 0, 1,
-1.282292, -0.02485595, -0.8665017, 1, 0.6, 0, 1,
-1.2748, 0.5742396, -1.317895, 1, 0.6078432, 0, 1,
-1.268485, 1.141738, 0.3243046, 1, 0.6117647, 0, 1,
-1.264801, -1.155206, -2.472932, 1, 0.6196079, 0, 1,
-1.261836, 0.08233856, -2.725193, 1, 0.6235294, 0, 1,
-1.256193, -0.8849527, -0.2281711, 1, 0.6313726, 0, 1,
-1.253558, -0.9763666, -2.382882, 1, 0.6352941, 0, 1,
-1.251693, 0.768478, 0.08947586, 1, 0.6431373, 0, 1,
-1.24843, -0.5319282, -3.577598, 1, 0.6470588, 0, 1,
-1.244735, -0.1500907, -1.523468, 1, 0.654902, 0, 1,
-1.239631, 0.6364753, -1.458733, 1, 0.6588235, 0, 1,
-1.239461, -0.7426441, -0.5947598, 1, 0.6666667, 0, 1,
-1.238556, -1.052935, -2.581551, 1, 0.6705883, 0, 1,
-1.237251, -0.3027014, -0.01091114, 1, 0.6784314, 0, 1,
-1.226957, -1.778651, -2.099251, 1, 0.682353, 0, 1,
-1.221968, -0.5677969, -1.866205, 1, 0.6901961, 0, 1,
-1.21843, 0.4784825, -2.368208, 1, 0.6941177, 0, 1,
-1.217534, -1.516316, -2.282328, 1, 0.7019608, 0, 1,
-1.201106, 0.7950187, -2.155009, 1, 0.7098039, 0, 1,
-1.196981, -0.1095106, -1.601548, 1, 0.7137255, 0, 1,
-1.194162, 0.8389316, -2.701349, 1, 0.7215686, 0, 1,
-1.194057, -0.3637194, -2.390381, 1, 0.7254902, 0, 1,
-1.193777, 0.01730395, -3.434268, 1, 0.7333333, 0, 1,
-1.193684, 0.5145067, -0.6518649, 1, 0.7372549, 0, 1,
-1.19247, 0.01838484, -0.2885335, 1, 0.7450981, 0, 1,
-1.17904, 1.162989, -1.750261, 1, 0.7490196, 0, 1,
-1.178584, -0.9813344, -3.187643, 1, 0.7568628, 0, 1,
-1.175997, 0.8761803, -2.402171, 1, 0.7607843, 0, 1,
-1.171556, -0.1196207, -1.369985, 1, 0.7686275, 0, 1,
-1.170274, 1.716917, -2.53678, 1, 0.772549, 0, 1,
-1.168578, -1.297716, -3.069351, 1, 0.7803922, 0, 1,
-1.164669, -0.2734341, -0.6170142, 1, 0.7843137, 0, 1,
-1.164468, -0.8014147, 0.038971, 1, 0.7921569, 0, 1,
-1.160823, -2.02047, -1.835752, 1, 0.7960784, 0, 1,
-1.160475, -0.1684493, -1.3854, 1, 0.8039216, 0, 1,
-1.154966, -0.6063117, -2.429868, 1, 0.8117647, 0, 1,
-1.147863, 1.08052, 1.088772, 1, 0.8156863, 0, 1,
-1.139767, 0.2595441, -0.6936299, 1, 0.8235294, 0, 1,
-1.136358, -1.0061, -2.546262, 1, 0.827451, 0, 1,
-1.132369, -0.2583821, 0.1913741, 1, 0.8352941, 0, 1,
-1.130374, 0.1795282, -2.052317, 1, 0.8392157, 0, 1,
-1.122782, 1.360288, 0.09927379, 1, 0.8470588, 0, 1,
-1.121055, 0.2602254, -3.017549, 1, 0.8509804, 0, 1,
-1.117973, 0.2545748, -2.930552, 1, 0.8588235, 0, 1,
-1.112219, -0.831482, -2.049708, 1, 0.8627451, 0, 1,
-1.105725, 1.369455, 0.131966, 1, 0.8705882, 0, 1,
-1.086913, -0.7544348, -2.420018, 1, 0.8745098, 0, 1,
-1.077085, -0.5854689, -3.868219, 1, 0.8823529, 0, 1,
-1.073113, 0.6517638, -0.6797231, 1, 0.8862745, 0, 1,
-1.072545, -0.9020038, -3.500206, 1, 0.8941177, 0, 1,
-1.07079, 0.1795184, 0.04132833, 1, 0.8980392, 0, 1,
-1.066761, -0.4314643, -2.059768, 1, 0.9058824, 0, 1,
-1.048627, 1.270267, -0.8675798, 1, 0.9137255, 0, 1,
-1.046208, -1.415999, -3.332946, 1, 0.9176471, 0, 1,
-1.044071, -0.3440402, -1.296838, 1, 0.9254902, 0, 1,
-1.039037, 0.6107282, -1.504028, 1, 0.9294118, 0, 1,
-1.030311, -1.578909, -2.353686, 1, 0.9372549, 0, 1,
-1.018948, 0.8169313, -0.6564347, 1, 0.9411765, 0, 1,
-1.014643, 0.1770217, -2.331404, 1, 0.9490196, 0, 1,
-1.011698, 0.02626089, 0.1054321, 1, 0.9529412, 0, 1,
-1.010238, -1.730511, -4.663258, 1, 0.9607843, 0, 1,
-0.996818, 0.2634838, -1.036968, 1, 0.9647059, 0, 1,
-0.9945874, -0.3486277, -2.567745, 1, 0.972549, 0, 1,
-0.9881543, -0.1824298, -1.736921, 1, 0.9764706, 0, 1,
-0.9862461, -1.316895, -2.487891, 1, 0.9843137, 0, 1,
-0.9853526, 0.1158506, -2.569665, 1, 0.9882353, 0, 1,
-0.9850193, -2.590124, -3.701368, 1, 0.9960784, 0, 1,
-0.9817455, 1.638105, -1.51764, 0.9960784, 1, 0, 1,
-0.9731609, 0.5895557, -0.0852209, 0.9921569, 1, 0, 1,
-0.9681363, 0.5141635, 0.857209, 0.9843137, 1, 0, 1,
-0.964648, -1.858393, -1.329509, 0.9803922, 1, 0, 1,
-0.9614912, -0.6833509, -2.853435, 0.972549, 1, 0, 1,
-0.9588998, -0.5586705, -2.037673, 0.9686275, 1, 0, 1,
-0.9545279, 1.713134, 0.07925762, 0.9607843, 1, 0, 1,
-0.9535847, 2.027191, -1.483997, 0.9568627, 1, 0, 1,
-0.947107, -0.5290011, -1.972512, 0.9490196, 1, 0, 1,
-0.9459907, -2.050435, -1.711497, 0.945098, 1, 0, 1,
-0.9345925, -5.515203e-05, -1.837521, 0.9372549, 1, 0, 1,
-0.9339801, -0.5544735, -3.096711, 0.9333333, 1, 0, 1,
-0.9278756, 0.3261042, -1.761284, 0.9254902, 1, 0, 1,
-0.9257913, 0.3298652, 0.4436217, 0.9215686, 1, 0, 1,
-0.9253948, 0.1215153, -0.7173703, 0.9137255, 1, 0, 1,
-0.922435, -0.160054, -0.2053231, 0.9098039, 1, 0, 1,
-0.9207717, -0.9685812, -1.899783, 0.9019608, 1, 0, 1,
-0.9190989, 1.686926, -1.775643, 0.8941177, 1, 0, 1,
-0.9186255, 0.5877776, -0.7446304, 0.8901961, 1, 0, 1,
-0.9175292, -0.4766704, -3.27606, 0.8823529, 1, 0, 1,
-0.9168429, -1.579288, -2.058679, 0.8784314, 1, 0, 1,
-0.9145561, -0.1670604, -2.983526, 0.8705882, 1, 0, 1,
-0.9139986, 0.004772681, -2.063934, 0.8666667, 1, 0, 1,
-0.8999385, 0.1413671, -1.494378, 0.8588235, 1, 0, 1,
-0.8997999, -0.4091738, -3.178666, 0.854902, 1, 0, 1,
-0.892509, -0.2223313, -1.898605, 0.8470588, 1, 0, 1,
-0.8921124, -0.7900218, -1.776859, 0.8431373, 1, 0, 1,
-0.891836, 1.409123, -1.843642, 0.8352941, 1, 0, 1,
-0.8870015, -0.5196599, -2.656224, 0.8313726, 1, 0, 1,
-0.8844609, 0.1998463, -2.331617, 0.8235294, 1, 0, 1,
-0.8736057, 0.9652129, -2.236192, 0.8196079, 1, 0, 1,
-0.8717865, 0.3985589, -0.4648509, 0.8117647, 1, 0, 1,
-0.8706616, 2.826498, -0.7909958, 0.8078431, 1, 0, 1,
-0.862034, -1.266101, -2.84322, 0.8, 1, 0, 1,
-0.8615144, 1.293468, -1.442357, 0.7921569, 1, 0, 1,
-0.857694, -0.3745349, -1.175024, 0.7882353, 1, 0, 1,
-0.8560399, -1.699783, -2.423003, 0.7803922, 1, 0, 1,
-0.8554, -0.3680084, -2.980162, 0.7764706, 1, 0, 1,
-0.8495159, 2.097015, 0.2399174, 0.7686275, 1, 0, 1,
-0.8487043, -0.01013484, -1.157974, 0.7647059, 1, 0, 1,
-0.8389137, -1.531873, -3.279412, 0.7568628, 1, 0, 1,
-0.8360822, 1.508029, 2.462072, 0.7529412, 1, 0, 1,
-0.8296276, -1.166826, -1.036326, 0.7450981, 1, 0, 1,
-0.8265873, -0.6863328, -3.422477, 0.7411765, 1, 0, 1,
-0.8257618, 0.9294797, -2.263511, 0.7333333, 1, 0, 1,
-0.8193874, -1.658701, -2.890133, 0.7294118, 1, 0, 1,
-0.817494, -0.5791624, -1.431811, 0.7215686, 1, 0, 1,
-0.8143798, -0.5091131, -2.416596, 0.7176471, 1, 0, 1,
-0.8134275, -0.02322521, -0.9877535, 0.7098039, 1, 0, 1,
-0.8070861, 0.3648677, 0.5602198, 0.7058824, 1, 0, 1,
-0.7992533, -0.3980673, -1.657758, 0.6980392, 1, 0, 1,
-0.7990072, 0.789728, 0.3955659, 0.6901961, 1, 0, 1,
-0.7893131, -0.2257882, -1.841449, 0.6862745, 1, 0, 1,
-0.782326, 1.1218, 0.7696317, 0.6784314, 1, 0, 1,
-0.7749196, 0.1273317, -1.545624, 0.6745098, 1, 0, 1,
-0.7747563, -0.3596581, -0.1232253, 0.6666667, 1, 0, 1,
-0.7734873, 0.2417024, -3.797517, 0.6627451, 1, 0, 1,
-0.7716047, -0.6975266, -1.448325, 0.654902, 1, 0, 1,
-0.769635, 0.2696818, -1.957346, 0.6509804, 1, 0, 1,
-0.7673202, 0.2811931, -1.421255, 0.6431373, 1, 0, 1,
-0.7654067, -0.6706437, -2.91352, 0.6392157, 1, 0, 1,
-0.7627341, -0.3903082, -2.596826, 0.6313726, 1, 0, 1,
-0.7600636, 0.370069, -0.7491804, 0.627451, 1, 0, 1,
-0.7589189, -0.8663724, -3.090228, 0.6196079, 1, 0, 1,
-0.7461692, 0.6673585, 0.3352653, 0.6156863, 1, 0, 1,
-0.7424319, 1.536504, 0.2135788, 0.6078432, 1, 0, 1,
-0.7406386, -0.1198449, -1.603305, 0.6039216, 1, 0, 1,
-0.7392535, -0.1434735, -1.043416, 0.5960785, 1, 0, 1,
-0.7372518, 0.879572, -1.21946, 0.5882353, 1, 0, 1,
-0.7347494, 0.5986394, 0.571973, 0.5843138, 1, 0, 1,
-0.7327491, 0.8756055, -1.967634, 0.5764706, 1, 0, 1,
-0.731055, -0.238317, -1.810599, 0.572549, 1, 0, 1,
-0.7249185, 0.03767666, -1.36541, 0.5647059, 1, 0, 1,
-0.7248683, 0.4557692, -0.4264256, 0.5607843, 1, 0, 1,
-0.7190731, -0.4900594, -1.798811, 0.5529412, 1, 0, 1,
-0.7114297, 1.965827, -1.371967, 0.5490196, 1, 0, 1,
-0.7094678, -0.5383898, -1.977613, 0.5411765, 1, 0, 1,
-0.7080879, 0.4974871, -0.393771, 0.5372549, 1, 0, 1,
-0.7076474, 0.01665376, -1.508781, 0.5294118, 1, 0, 1,
-0.6910574, 1.704389, 0.509717, 0.5254902, 1, 0, 1,
-0.6815467, 2.130753, -0.8233169, 0.5176471, 1, 0, 1,
-0.6799293, 0.4564561, -1.645151, 0.5137255, 1, 0, 1,
-0.6795905, -0.13539, -3.388324, 0.5058824, 1, 0, 1,
-0.6772624, 0.5910192, -1.134312, 0.5019608, 1, 0, 1,
-0.6687762, 0.7800506, 0.2483023, 0.4941176, 1, 0, 1,
-0.6679242, -1.867222, -2.418603, 0.4862745, 1, 0, 1,
-0.6671245, -0.2881759, -4.674807, 0.4823529, 1, 0, 1,
-0.666316, 0.6527489, -0.7143674, 0.4745098, 1, 0, 1,
-0.6576119, -0.6406062, -3.550111, 0.4705882, 1, 0, 1,
-0.6558361, 0.3661931, -0.6467009, 0.4627451, 1, 0, 1,
-0.6557462, 0.104113, -1.975919, 0.4588235, 1, 0, 1,
-0.648607, 0.1851248, -1.673757, 0.4509804, 1, 0, 1,
-0.6480157, -0.7484748, -1.747477, 0.4470588, 1, 0, 1,
-0.6472503, 1.282539, -2.08501, 0.4392157, 1, 0, 1,
-0.6408948, -0.7523223, -1.022392, 0.4352941, 1, 0, 1,
-0.6360989, -0.6156203, -3.031982, 0.427451, 1, 0, 1,
-0.6318259, -0.7491229, -1.222969, 0.4235294, 1, 0, 1,
-0.6283392, -0.4972468, -3.2203, 0.4156863, 1, 0, 1,
-0.6278683, 0.2589877, -1.112933, 0.4117647, 1, 0, 1,
-0.6269361, 0.9142406, 0.6596583, 0.4039216, 1, 0, 1,
-0.6133611, -0.1151839, -1.614277, 0.3960784, 1, 0, 1,
-0.6116458, -1.711187, -2.578145, 0.3921569, 1, 0, 1,
-0.6111558, 0.2176403, -1.755251, 0.3843137, 1, 0, 1,
-0.6101794, -2.303023, -2.739213, 0.3803922, 1, 0, 1,
-0.6095747, 0.4734593, -2.040402, 0.372549, 1, 0, 1,
-0.6075573, -2.029353, -2.714573, 0.3686275, 1, 0, 1,
-0.6020721, -0.5735353, -1.273679, 0.3607843, 1, 0, 1,
-0.5980132, -0.7841614, -2.859034, 0.3568628, 1, 0, 1,
-0.59216, 0.8404945, -1.262114, 0.3490196, 1, 0, 1,
-0.5896167, 0.06138, -1.890163, 0.345098, 1, 0, 1,
-0.5876461, -1.623047, -2.357545, 0.3372549, 1, 0, 1,
-0.5853959, -1.379178, -2.842854, 0.3333333, 1, 0, 1,
-0.574308, 0.6359738, -0.3060054, 0.3254902, 1, 0, 1,
-0.5679664, -0.1839249, -2.875617, 0.3215686, 1, 0, 1,
-0.5674925, 0.1853708, -0.2136443, 0.3137255, 1, 0, 1,
-0.5666429, -0.4523009, 0.3255009, 0.3098039, 1, 0, 1,
-0.5648649, -0.7456427, -2.1516, 0.3019608, 1, 0, 1,
-0.55928, -1.384186, -3.055818, 0.2941177, 1, 0, 1,
-0.5583763, 1.472193, -1.218319, 0.2901961, 1, 0, 1,
-0.5573817, -0.40022, -1.938781, 0.282353, 1, 0, 1,
-0.555607, -1.039483, -2.422016, 0.2784314, 1, 0, 1,
-0.5534587, -0.3695183, -2.850151, 0.2705882, 1, 0, 1,
-0.5510574, -0.2222169, -2.545873, 0.2666667, 1, 0, 1,
-0.5491288, 1.024809, 0.588919, 0.2588235, 1, 0, 1,
-0.5451516, 0.05236199, -1.867499, 0.254902, 1, 0, 1,
-0.5381233, 0.09510577, -1.46428, 0.2470588, 1, 0, 1,
-0.5288664, 0.2357447, -2.034987, 0.2431373, 1, 0, 1,
-0.5253766, -0.7896017, -2.060872, 0.2352941, 1, 0, 1,
-0.5181911, 1.746026, -1.345147, 0.2313726, 1, 0, 1,
-0.5145811, 0.05226171, -0.8888075, 0.2235294, 1, 0, 1,
-0.5143067, -1.160971, -3.617927, 0.2196078, 1, 0, 1,
-0.5140936, 0.4352661, -0.1091727, 0.2117647, 1, 0, 1,
-0.5138521, 0.05479255, -2.105346, 0.2078431, 1, 0, 1,
-0.5110534, -0.2785355, -2.176733, 0.2, 1, 0, 1,
-0.5094287, -0.6907521, -2.136542, 0.1921569, 1, 0, 1,
-0.5005066, -0.7413489, -1.639713, 0.1882353, 1, 0, 1,
-0.4991189, -0.4124429, -3.18159, 0.1803922, 1, 0, 1,
-0.4955658, -1.079103, -2.102316, 0.1764706, 1, 0, 1,
-0.4939943, -1.439386, -1.626135, 0.1686275, 1, 0, 1,
-0.4930414, 0.08533521, -1.259068, 0.1647059, 1, 0, 1,
-0.4920928, -1.041229, -2.909807, 0.1568628, 1, 0, 1,
-0.4916258, 1.601146, 0.004328139, 0.1529412, 1, 0, 1,
-0.4867917, 0.4712015, 0.4048645, 0.145098, 1, 0, 1,
-0.4867676, -1.757329, -2.828769, 0.1411765, 1, 0, 1,
-0.4867111, -0.2550541, -0.3277162, 0.1333333, 1, 0, 1,
-0.4862935, -1.179341, -2.857664, 0.1294118, 1, 0, 1,
-0.4790816, -0.2797737, -2.24481, 0.1215686, 1, 0, 1,
-0.4771985, -1.124466, -4.144022, 0.1176471, 1, 0, 1,
-0.4768901, -0.1845458, -1.598956, 0.1098039, 1, 0, 1,
-0.4765489, 1.009036, 0.6893704, 0.1058824, 1, 0, 1,
-0.4762053, -1.390724, -2.448813, 0.09803922, 1, 0, 1,
-0.4716526, -0.2574638, -1.512098, 0.09019608, 1, 0, 1,
-0.4616144, -0.0248707, -1.128847, 0.08627451, 1, 0, 1,
-0.4590041, 0.1508378, -1.904157, 0.07843138, 1, 0, 1,
-0.4522576, 0.5080227, 1.625996, 0.07450981, 1, 0, 1,
-0.4510844, 0.04956365, 0.1861189, 0.06666667, 1, 0, 1,
-0.4490576, -0.7173119, -1.591307, 0.0627451, 1, 0, 1,
-0.4454302, 1.197921, -0.2085527, 0.05490196, 1, 0, 1,
-0.4417653, -0.1159561, -3.657558, 0.05098039, 1, 0, 1,
-0.4389737, -0.9961533, -1.396842, 0.04313726, 1, 0, 1,
-0.4379016, 0.4483703, -0.557349, 0.03921569, 1, 0, 1,
-0.4335057, -0.9099948, -2.057333, 0.03137255, 1, 0, 1,
-0.4310368, 0.9177596, -1.448576, 0.02745098, 1, 0, 1,
-0.4280066, 0.4033563, -0.02715392, 0.01960784, 1, 0, 1,
-0.4248662, -1.258374, -2.209791, 0.01568628, 1, 0, 1,
-0.4213348, 0.8576843, -0.07857589, 0.007843138, 1, 0, 1,
-0.4197541, 1.023404, -1.031361, 0.003921569, 1, 0, 1,
-0.4183405, -0.02437998, -1.462073, 0, 1, 0.003921569, 1,
-0.4174895, -0.03817957, -1.659516, 0, 1, 0.01176471, 1,
-0.4173019, 0.2751737, 2.95386, 0, 1, 0.01568628, 1,
-0.4135444, -1.896034, -2.709901, 0, 1, 0.02352941, 1,
-0.4115025, 0.7236412, -0.4360644, 0, 1, 0.02745098, 1,
-0.4040263, -0.1577935, -3.101403, 0, 1, 0.03529412, 1,
-0.4037875, -1.553875, -3.528956, 0, 1, 0.03921569, 1,
-0.4021218, -1.099904, -3.520163, 0, 1, 0.04705882, 1,
-0.3992739, 1.081603, 0.3446538, 0, 1, 0.05098039, 1,
-0.3970176, -1.5492, -1.535928, 0, 1, 0.05882353, 1,
-0.3950217, 0.6604086, -1.262599, 0, 1, 0.0627451, 1,
-0.3913346, 1.578842, 0.9587065, 0, 1, 0.07058824, 1,
-0.3912242, 1.043923, 0.5949529, 0, 1, 0.07450981, 1,
-0.3897272, -0.2401151, -3.883173, 0, 1, 0.08235294, 1,
-0.3851199, -0.9031048, -2.763924, 0, 1, 0.08627451, 1,
-0.3834607, 0.5053851, -0.6020606, 0, 1, 0.09411765, 1,
-0.3794506, 1.649622, -1.348964, 0, 1, 0.1019608, 1,
-0.3764481, -0.4374302, -3.505555, 0, 1, 0.1058824, 1,
-0.3725061, 0.4743232, -0.4014705, 0, 1, 0.1137255, 1,
-0.3670979, -0.9388669, -0.4905375, 0, 1, 0.1176471, 1,
-0.3618511, -0.3309082, -2.965149, 0, 1, 0.1254902, 1,
-0.3610165, 0.02134044, 0.2061987, 0, 1, 0.1294118, 1,
-0.3605461, -1.536113, -2.160015, 0, 1, 0.1372549, 1,
-0.3602157, -1.068153, -3.856287, 0, 1, 0.1411765, 1,
-0.3600045, 1.081461, -0.364886, 0, 1, 0.1490196, 1,
-0.3590189, -1.212652, -3.06458, 0, 1, 0.1529412, 1,
-0.3561755, 0.1127833, -1.871949, 0, 1, 0.1607843, 1,
-0.355716, 0.1644986, -1.613283, 0, 1, 0.1647059, 1,
-0.347664, 1.064368, -0.06678464, 0, 1, 0.172549, 1,
-0.3463664, 0.8887635, 1.118747, 0, 1, 0.1764706, 1,
-0.3461892, -0.1431593, -1.801404, 0, 1, 0.1843137, 1,
-0.3456532, -1.481506, -4.504421, 0, 1, 0.1882353, 1,
-0.345214, 0.6763117, 0.02036077, 0, 1, 0.1960784, 1,
-0.3414681, -1.216553, -4.280191, 0, 1, 0.2039216, 1,
-0.3413834, 0.02786343, -2.105454, 0, 1, 0.2078431, 1,
-0.3409886, -0.3359288, -0.3331701, 0, 1, 0.2156863, 1,
-0.3394023, -0.6562266, -3.464532, 0, 1, 0.2196078, 1,
-0.3367096, 0.3642111, -0.06064395, 0, 1, 0.227451, 1,
-0.3323766, -1.921695, -2.53427, 0, 1, 0.2313726, 1,
-0.3320137, 0.6373241, -0.6169518, 0, 1, 0.2392157, 1,
-0.3307096, -1.654256, -3.794762, 0, 1, 0.2431373, 1,
-0.3289215, 1.254105, 0.3686589, 0, 1, 0.2509804, 1,
-0.3287527, 1.044419, -0.0560895, 0, 1, 0.254902, 1,
-0.3256622, -1.396077, -2.719669, 0, 1, 0.2627451, 1,
-0.3207889, 0.1368806, 0.1923826, 0, 1, 0.2666667, 1,
-0.3202256, -0.6628411, -3.068933, 0, 1, 0.2745098, 1,
-0.3191012, 0.008285135, -2.274035, 0, 1, 0.2784314, 1,
-0.3179622, 0.3813969, -1.003104, 0, 1, 0.2862745, 1,
-0.317877, -1.104214, -2.720871, 0, 1, 0.2901961, 1,
-0.3135596, 0.390659, -1.292614, 0, 1, 0.2980392, 1,
-0.3133387, -0.2813854, -2.755398, 0, 1, 0.3058824, 1,
-0.3110181, 0.8572556, -1.657223, 0, 1, 0.3098039, 1,
-0.3100242, -1.31953, -2.933752, 0, 1, 0.3176471, 1,
-0.309467, 0.1289732, -1.552215, 0, 1, 0.3215686, 1,
-0.3071787, 0.2317591, 0.06689996, 0, 1, 0.3294118, 1,
-0.3066641, -0.03488512, -1.749845, 0, 1, 0.3333333, 1,
-0.3050285, 0.1158477, -0.3827669, 0, 1, 0.3411765, 1,
-0.3016787, 1.908848, 1.168608, 0, 1, 0.345098, 1,
-0.2988785, 0.2381454, -1.490409, 0, 1, 0.3529412, 1,
-0.2947554, -0.3531262, -3.048169, 0, 1, 0.3568628, 1,
-0.2859007, 0.2335012, -2.162727, 0, 1, 0.3647059, 1,
-0.2828069, -1.059134, -2.856995, 0, 1, 0.3686275, 1,
-0.2819801, 0.5697131, 1.616153, 0, 1, 0.3764706, 1,
-0.2803551, -2.132488, -1.404678, 0, 1, 0.3803922, 1,
-0.2795622, -1.080677, -2.857989, 0, 1, 0.3882353, 1,
-0.2767115, -0.7683815, -2.330783, 0, 1, 0.3921569, 1,
-0.2722541, -0.5171611, -1.958014, 0, 1, 0.4, 1,
-0.2692007, 0.4984137, -1.872249, 0, 1, 0.4078431, 1,
-0.2686996, -0.5158423, -2.113888, 0, 1, 0.4117647, 1,
-0.2640804, 0.8932622, 0.9314344, 0, 1, 0.4196078, 1,
-0.2629057, 0.8449631, 0.6780318, 0, 1, 0.4235294, 1,
-0.262523, -1.506303, -3.422195, 0, 1, 0.4313726, 1,
-0.2617983, 1.1991, -0.02218256, 0, 1, 0.4352941, 1,
-0.2574076, -0.1465787, -1.992336, 0, 1, 0.4431373, 1,
-0.2556109, -0.5236158, -1.815978, 0, 1, 0.4470588, 1,
-0.2554222, 0.2552702, 0.9791697, 0, 1, 0.454902, 1,
-0.2498041, 0.315511, 0.009549255, 0, 1, 0.4588235, 1,
-0.2496027, 0.7183843, -0.06330212, 0, 1, 0.4666667, 1,
-0.243202, 1.315839, -1.093763, 0, 1, 0.4705882, 1,
-0.2422992, 0.8181298, 0.6113685, 0, 1, 0.4784314, 1,
-0.2399707, -1.637479, -2.544613, 0, 1, 0.4823529, 1,
-0.2392474, -0.3978916, -4.233759, 0, 1, 0.4901961, 1,
-0.2355586, 1.221777, -0.1355915, 0, 1, 0.4941176, 1,
-0.2243934, 1.063628, -1.066599, 0, 1, 0.5019608, 1,
-0.2219555, 1.375054, -1.560713, 0, 1, 0.509804, 1,
-0.2207209, -0.3486112, -1.846178, 0, 1, 0.5137255, 1,
-0.2114896, -0.04975199, -2.311614, 0, 1, 0.5215687, 1,
-0.2065367, 0.0740542, -1.487718, 0, 1, 0.5254902, 1,
-0.2039194, -0.5601957, -2.094879, 0, 1, 0.5333334, 1,
-0.2025304, -1.071025, -3.310725, 0, 1, 0.5372549, 1,
-0.2024101, 1.15578, -0.09813158, 0, 1, 0.5450981, 1,
-0.2000291, -0.3883198, -2.621878, 0, 1, 0.5490196, 1,
-0.198417, -1.469707, -3.865576, 0, 1, 0.5568628, 1,
-0.1972324, -0.2675566, -2.407637, 0, 1, 0.5607843, 1,
-0.1909183, -0.3539161, -1.535857, 0, 1, 0.5686275, 1,
-0.1895237, -1.515015, -3.151254, 0, 1, 0.572549, 1,
-0.1890806, -0.181287, -1.358422, 0, 1, 0.5803922, 1,
-0.1875919, 0.4257976, -0.1801672, 0, 1, 0.5843138, 1,
-0.1875115, 0.4637452, -0.7785885, 0, 1, 0.5921569, 1,
-0.185633, 0.08549938, -0.9313996, 0, 1, 0.5960785, 1,
-0.1835713, -0.2936099, -3.051578, 0, 1, 0.6039216, 1,
-0.1823964, 1.057393, -0.3184509, 0, 1, 0.6117647, 1,
-0.1799098, -0.6411873, -3.165045, 0, 1, 0.6156863, 1,
-0.1775944, 0.8412526, -1.087275, 0, 1, 0.6235294, 1,
-0.1743109, 0.1552777, -0.5031222, 0, 1, 0.627451, 1,
-0.1685335, 1.279441, -0.1081914, 0, 1, 0.6352941, 1,
-0.1682466, -0.8364067, -2.654075, 0, 1, 0.6392157, 1,
-0.1664465, 1.134558, 0.268449, 0, 1, 0.6470588, 1,
-0.1660009, 0.1832544, -1.205762, 0, 1, 0.6509804, 1,
-0.164212, -0.9703786, -2.468506, 0, 1, 0.6588235, 1,
-0.1595844, -0.6831176, -2.103478, 0, 1, 0.6627451, 1,
-0.1595153, 0.6039943, -1.627276, 0, 1, 0.6705883, 1,
-0.1587009, -0.7032462, -1.585725, 0, 1, 0.6745098, 1,
-0.15835, -0.2367121, -2.370452, 0, 1, 0.682353, 1,
-0.1552247, 0.1751225, -0.5155773, 0, 1, 0.6862745, 1,
-0.1498261, -0.1441376, -1.779482, 0, 1, 0.6941177, 1,
-0.1483542, 0.1837795, -0.5120896, 0, 1, 0.7019608, 1,
-0.1471007, -0.07640629, -2.77888, 0, 1, 0.7058824, 1,
-0.1453185, -0.224, -1.286183, 0, 1, 0.7137255, 1,
-0.1422095, -0.01330418, -2.100573, 0, 1, 0.7176471, 1,
-0.1407717, 0.5652074, 0.5014077, 0, 1, 0.7254902, 1,
-0.1407189, 1.008037, -1.202599, 0, 1, 0.7294118, 1,
-0.1405979, 0.888404, -1.461531, 0, 1, 0.7372549, 1,
-0.1398501, -0.7391412, -3.038001, 0, 1, 0.7411765, 1,
-0.1372121, -0.9654914, -3.337985, 0, 1, 0.7490196, 1,
-0.1359859, -0.9875703, -3.159815, 0, 1, 0.7529412, 1,
-0.1325275, -1.198556, -4.200591, 0, 1, 0.7607843, 1,
-0.1322663, -0.2797492, -2.156803, 0, 1, 0.7647059, 1,
-0.1253602, 0.09290965, -2.592873, 0, 1, 0.772549, 1,
-0.1224705, -0.1575311, -1.554258, 0, 1, 0.7764706, 1,
-0.1208945, 0.6664516, 0.9180254, 0, 1, 0.7843137, 1,
-0.1173935, 1.070161, -0.8442984, 0, 1, 0.7882353, 1,
-0.1163988, -0.2062081, -1.677374, 0, 1, 0.7960784, 1,
-0.1160942, -1.171928, -3.742755, 0, 1, 0.8039216, 1,
-0.1158193, 0.00284123, -2.197539, 0, 1, 0.8078431, 1,
-0.1157103, -1.763254, -4.100446, 0, 1, 0.8156863, 1,
-0.1157042, 0.1963273, -1.938871, 0, 1, 0.8196079, 1,
-0.1154252, 1.613232, -1.947983, 0, 1, 0.827451, 1,
-0.1050854, -0.8645921, -2.187217, 0, 1, 0.8313726, 1,
-0.1021046, -0.7608289, -2.421463, 0, 1, 0.8392157, 1,
-0.09230382, 0.2230796, 2.49886, 0, 1, 0.8431373, 1,
-0.0922847, 0.5585446, -1.301551, 0, 1, 0.8509804, 1,
-0.09053634, 0.6361489, 0.0979266, 0, 1, 0.854902, 1,
-0.08912215, -0.5029319, -1.964402, 0, 1, 0.8627451, 1,
-0.08241057, -0.5668961, -1.952319, 0, 1, 0.8666667, 1,
-0.07326229, 1.118431, 0.303519, 0, 1, 0.8745098, 1,
-0.07245507, 0.6676894, -1.211437, 0, 1, 0.8784314, 1,
-0.06912146, 0.6105909, 0.311969, 0, 1, 0.8862745, 1,
-0.06645146, 1.213292, -0.3332892, 0, 1, 0.8901961, 1,
-0.06446262, 0.1921774, -0.9800455, 0, 1, 0.8980392, 1,
-0.06407186, -0.5173647, -2.664801, 0, 1, 0.9058824, 1,
-0.06013297, -0.335483, -2.551876, 0, 1, 0.9098039, 1,
-0.05973804, -0.2822816, -3.62138, 0, 1, 0.9176471, 1,
-0.0475654, 0.09079038, -0.356278, 0, 1, 0.9215686, 1,
-0.04066131, 0.2431306, -1.407142, 0, 1, 0.9294118, 1,
-0.03959088, 0.9802326, -0.148043, 0, 1, 0.9333333, 1,
-0.03536757, 1.675038, 1.831737, 0, 1, 0.9411765, 1,
-0.02904573, 0.325895, 1.473306, 0, 1, 0.945098, 1,
-0.02899978, 0.4010923, 1.00985, 0, 1, 0.9529412, 1,
-0.02769176, 2.014328, 1.85901, 0, 1, 0.9568627, 1,
-0.02451712, -0.6793472, -3.305517, 0, 1, 0.9647059, 1,
-0.02037266, 2.396455, 0.6074117, 0, 1, 0.9686275, 1,
-0.01795005, 0.07884061, -1.921994, 0, 1, 0.9764706, 1,
-0.0151826, 0.01056366, 0.2313331, 0, 1, 0.9803922, 1,
-0.004020288, 0.1490154, -0.3114885, 0, 1, 0.9882353, 1,
-0.003728237, -1.28297, -2.734093, 0, 1, 0.9921569, 1,
-0.001565101, -1.476473, -1.834421, 0, 1, 1, 1,
0.00311153, 0.6921569, 0.109529, 0, 0.9921569, 1, 1,
0.005722754, -1.41531, 2.053829, 0, 0.9882353, 1, 1,
0.006420789, -1.053905, 2.585009, 0, 0.9803922, 1, 1,
0.008440911, -1.354463, 2.65474, 0, 0.9764706, 1, 1,
0.01052924, -0.8302953, 4.695853, 0, 0.9686275, 1, 1,
0.01407103, -0.4717622, 2.329394, 0, 0.9647059, 1, 1,
0.01516896, 1.550393, -0.6758413, 0, 0.9568627, 1, 1,
0.01695049, 0.8756547, 0.4997388, 0, 0.9529412, 1, 1,
0.02193316, -0.3591172, 3.164864, 0, 0.945098, 1, 1,
0.02772832, 1.006506, -0.6519821, 0, 0.9411765, 1, 1,
0.04199867, 1.604965, 0.01887, 0, 0.9333333, 1, 1,
0.04433077, -0.2503477, 2.994154, 0, 0.9294118, 1, 1,
0.04781051, -0.1564041, 3.32981, 0, 0.9215686, 1, 1,
0.04913284, 0.2119769, 1.834585, 0, 0.9176471, 1, 1,
0.05082405, 0.6249123, 2.296832, 0, 0.9098039, 1, 1,
0.05333359, 1.578457, 0.702436, 0, 0.9058824, 1, 1,
0.05391946, 0.9617748, 1.51695, 0, 0.8980392, 1, 1,
0.0549744, 0.4359489, 0.7051838, 0, 0.8901961, 1, 1,
0.05505228, -1.212682, 3.00397, 0, 0.8862745, 1, 1,
0.05592415, 0.09675649, -0.4478878, 0, 0.8784314, 1, 1,
0.05767678, -0.05157292, 2.96335, 0, 0.8745098, 1, 1,
0.05995521, -0.971269, 2.929895, 0, 0.8666667, 1, 1,
0.06077807, 0.165278, 3.300851, 0, 0.8627451, 1, 1,
0.06117513, -1.081355, 2.765806, 0, 0.854902, 1, 1,
0.06516866, -0.8415601, 3.166408, 0, 0.8509804, 1, 1,
0.06614523, -0.1742308, 2.420149, 0, 0.8431373, 1, 1,
0.07047404, -1.602322, 1.815621, 0, 0.8392157, 1, 1,
0.07128447, 0.2777477, 0.5852228, 0, 0.8313726, 1, 1,
0.07219422, 0.5359035, 0.1128924, 0, 0.827451, 1, 1,
0.0739304, 1.146943, 1.681723, 0, 0.8196079, 1, 1,
0.07680734, -0.5132697, 2.45302, 0, 0.8156863, 1, 1,
0.07750072, -1.069939, 1.562251, 0, 0.8078431, 1, 1,
0.07781782, -0.5734665, 2.624806, 0, 0.8039216, 1, 1,
0.07957963, 1.164169, 0.9726301, 0, 0.7960784, 1, 1,
0.07972396, 0.7685266, 0.5320995, 0, 0.7882353, 1, 1,
0.0805116, 0.5427689, -1.302065, 0, 0.7843137, 1, 1,
0.08214178, 1.480631, 1.054021, 0, 0.7764706, 1, 1,
0.08512207, 0.09984099, -0.3461866, 0, 0.772549, 1, 1,
0.08538391, 0.9346421, -0.4302574, 0, 0.7647059, 1, 1,
0.08573178, -0.9719302, 2.681029, 0, 0.7607843, 1, 1,
0.08599292, -0.3342495, 3.329217, 0, 0.7529412, 1, 1,
0.08649343, -0.1548926, 2.855937, 0, 0.7490196, 1, 1,
0.08686297, 0.3321247, 0.1542855, 0, 0.7411765, 1, 1,
0.09697872, 0.08827624, 1.885569, 0, 0.7372549, 1, 1,
0.09711774, -0.2055493, 2.47779, 0, 0.7294118, 1, 1,
0.09767061, -0.208553, 2.379077, 0, 0.7254902, 1, 1,
0.1047603, -0.4158002, 3.016224, 0, 0.7176471, 1, 1,
0.1064324, 0.5199185, -0.5268607, 0, 0.7137255, 1, 1,
0.1089702, 1.967346, -0.5867726, 0, 0.7058824, 1, 1,
0.1118966, 0.7502664, -0.3173563, 0, 0.6980392, 1, 1,
0.1136571, 0.5406876, -0.3827837, 0, 0.6941177, 1, 1,
0.1229596, 0.2846355, 0.9216143, 0, 0.6862745, 1, 1,
0.1245913, -0.5311518, 1.784856, 0, 0.682353, 1, 1,
0.1267699, 0.113694, 1.488102, 0, 0.6745098, 1, 1,
0.1274753, -0.2018991, 2.178543, 0, 0.6705883, 1, 1,
0.1287819, -0.7866884, 2.118531, 0, 0.6627451, 1, 1,
0.1372499, 0.8948807, 1.496596, 0, 0.6588235, 1, 1,
0.1417405, -0.1097062, 0.7970942, 0, 0.6509804, 1, 1,
0.1443196, -1.475772, 3.174861, 0, 0.6470588, 1, 1,
0.1461739, 0.9969009, 0.7150234, 0, 0.6392157, 1, 1,
0.1470092, 0.696304, 0.9078526, 0, 0.6352941, 1, 1,
0.1474806, -2.134978, 4.61859, 0, 0.627451, 1, 1,
0.1479132, -1.457312, 1.424126, 0, 0.6235294, 1, 1,
0.1497757, -1.174357, 3.13817, 0, 0.6156863, 1, 1,
0.153212, 0.7466853, -0.355702, 0, 0.6117647, 1, 1,
0.1539058, 1.687725, 0.1372186, 0, 0.6039216, 1, 1,
0.1591366, -0.8249083, 3.288061, 0, 0.5960785, 1, 1,
0.1634569, 1.024214, 0.8555034, 0, 0.5921569, 1, 1,
0.1664512, -0.4117081, 3.983989, 0, 0.5843138, 1, 1,
0.1671302, 0.6172721, 1.127129, 0, 0.5803922, 1, 1,
0.1678757, 0.9103809, 0.4985852, 0, 0.572549, 1, 1,
0.1734391, -0.6770867, 2.272704, 0, 0.5686275, 1, 1,
0.1749868, 0.4926302, 0.007039828, 0, 0.5607843, 1, 1,
0.180887, 2.103371, 0.4601899, 0, 0.5568628, 1, 1,
0.1812628, -0.01221653, 2.227965, 0, 0.5490196, 1, 1,
0.182106, -0.4453281, 2.679105, 0, 0.5450981, 1, 1,
0.1849497, -1.127658, 4.058854, 0, 0.5372549, 1, 1,
0.1875387, 0.6938609, 0.07057481, 0, 0.5333334, 1, 1,
0.1937009, 0.02324729, 1.198652, 0, 0.5254902, 1, 1,
0.1959352, -0.2310212, 3.718905, 0, 0.5215687, 1, 1,
0.1975643, 0.4848933, -0.9024567, 0, 0.5137255, 1, 1,
0.1990587, 0.2404939, -0.3307877, 0, 0.509804, 1, 1,
0.2007802, -2.188061, 4.732789, 0, 0.5019608, 1, 1,
0.203502, -0.4253058, 2.579769, 0, 0.4941176, 1, 1,
0.2049057, -0.6973794, 1.439399, 0, 0.4901961, 1, 1,
0.2122411, -1.48404, 3.251738, 0, 0.4823529, 1, 1,
0.2165637, -0.4430562, 3.228268, 0, 0.4784314, 1, 1,
0.2274079, 0.1313474, 2.087896, 0, 0.4705882, 1, 1,
0.228261, -0.1947457, 3.591476, 0, 0.4666667, 1, 1,
0.228469, -1.786358, 2.003149, 0, 0.4588235, 1, 1,
0.232209, 0.7249311, -0.2541902, 0, 0.454902, 1, 1,
0.235124, -0.9583325, 2.974426, 0, 0.4470588, 1, 1,
0.2360229, 0.05079961, 0.9571882, 0, 0.4431373, 1, 1,
0.2370767, 0.6262143, 2.555542, 0, 0.4352941, 1, 1,
0.2392002, 0.5722721, -0.04224379, 0, 0.4313726, 1, 1,
0.2392883, 0.1841877, -0.6771606, 0, 0.4235294, 1, 1,
0.2395254, -0.1207099, 2.850725, 0, 0.4196078, 1, 1,
0.2399416, -0.501696, 2.397978, 0, 0.4117647, 1, 1,
0.2487408, 1.474344, 0.8887672, 0, 0.4078431, 1, 1,
0.2491331, -1.328784, 2.998697, 0, 0.4, 1, 1,
0.2521965, -0.1555829, 2.4184, 0, 0.3921569, 1, 1,
0.2522815, 1.264471, -1.54447, 0, 0.3882353, 1, 1,
0.253688, 0.5726014, 1.073576, 0, 0.3803922, 1, 1,
0.2567932, -0.9669667, 0.7847022, 0, 0.3764706, 1, 1,
0.2619945, 0.2901641, 0.8385208, 0, 0.3686275, 1, 1,
0.2628703, 0.5924687, 0.5754844, 0, 0.3647059, 1, 1,
0.2630053, 0.2114638, 0.3893592, 0, 0.3568628, 1, 1,
0.265558, 0.194641, -0.9108924, 0, 0.3529412, 1, 1,
0.2675051, -1.449833, 4.215308, 0, 0.345098, 1, 1,
0.2683559, 0.413487, 0.2412672, 0, 0.3411765, 1, 1,
0.2707694, -0.6296074, 3.746701, 0, 0.3333333, 1, 1,
0.2707786, -0.04866086, 1.272505, 0, 0.3294118, 1, 1,
0.271479, 0.4177242, 0.9028371, 0, 0.3215686, 1, 1,
0.2715036, -0.2850786, 2.491858, 0, 0.3176471, 1, 1,
0.272399, -0.400275, 2.873138, 0, 0.3098039, 1, 1,
0.2747075, 0.7842656, 0.6288456, 0, 0.3058824, 1, 1,
0.2775431, -0.1965116, 3.362244, 0, 0.2980392, 1, 1,
0.2832077, -1.048266, 2.466324, 0, 0.2901961, 1, 1,
0.2920028, -0.1624314, 2.390468, 0, 0.2862745, 1, 1,
0.2925511, 0.1363171, 1.747056, 0, 0.2784314, 1, 1,
0.2958024, 2.081789, -0.6260615, 0, 0.2745098, 1, 1,
0.3022925, 1.326574, -0.6657792, 0, 0.2666667, 1, 1,
0.3061842, -0.9811191, 1.949084, 0, 0.2627451, 1, 1,
0.3099634, -0.1856978, 1.133582, 0, 0.254902, 1, 1,
0.3175469, 0.4442882, 1.267319, 0, 0.2509804, 1, 1,
0.3200999, -0.2585948, 2.477675, 0, 0.2431373, 1, 1,
0.3201877, -0.3754744, 2.646405, 0, 0.2392157, 1, 1,
0.3232428, 1.426274, 0.8407152, 0, 0.2313726, 1, 1,
0.3245856, -0.4493457, 2.403932, 0, 0.227451, 1, 1,
0.338911, 0.5560978, 2.036636, 0, 0.2196078, 1, 1,
0.339167, -0.2439955, 2.000922, 0, 0.2156863, 1, 1,
0.3456076, -1.225602, 3.372934, 0, 0.2078431, 1, 1,
0.3525115, -1.732553, 4.238207, 0, 0.2039216, 1, 1,
0.3526147, 0.1750263, 1.329341, 0, 0.1960784, 1, 1,
0.3554423, -2.243994, 2.36105, 0, 0.1882353, 1, 1,
0.3558838, 1.840898, 1.669023, 0, 0.1843137, 1, 1,
0.3559565, -0.2529597, 3.64283, 0, 0.1764706, 1, 1,
0.3619724, 1.620134, -2.63494, 0, 0.172549, 1, 1,
0.3630112, -0.04917952, 0.9429687, 0, 0.1647059, 1, 1,
0.3653561, -1.745596, 1.915427, 0, 0.1607843, 1, 1,
0.3660555, 0.2006176, 1.438876, 0, 0.1529412, 1, 1,
0.3661978, -1.647362, 1.513845, 0, 0.1490196, 1, 1,
0.3666853, -0.8067337, 2.457989, 0, 0.1411765, 1, 1,
0.3711793, 0.06082871, 0.6542839, 0, 0.1372549, 1, 1,
0.3780791, 0.9857802, 0.3665064, 0, 0.1294118, 1, 1,
0.3793714, -0.3913621, 2.055588, 0, 0.1254902, 1, 1,
0.3813459, 0.8371602, 0.3009375, 0, 0.1176471, 1, 1,
0.3829999, 0.2677962, 1.611183, 0, 0.1137255, 1, 1,
0.3859855, 0.05593207, 1.145426, 0, 0.1058824, 1, 1,
0.3861479, 0.6195508, 1.669509, 0, 0.09803922, 1, 1,
0.3872319, -2.60549, 3.881307, 0, 0.09411765, 1, 1,
0.388543, 0.7909661, 0.009182886, 0, 0.08627451, 1, 1,
0.3886021, -0.8606934, 1.134913, 0, 0.08235294, 1, 1,
0.3897912, 0.7366059, 2.017392, 0, 0.07450981, 1, 1,
0.3944133, 1.026122, 0.4545047, 0, 0.07058824, 1, 1,
0.3983492, 0.03608127, -0.6873075, 0, 0.0627451, 1, 1,
0.4005485, -0.05543789, 3.100222, 0, 0.05882353, 1, 1,
0.4020427, 0.2576172, 3.013891, 0, 0.05098039, 1, 1,
0.4032772, 0.08559882, 0.4974334, 0, 0.04705882, 1, 1,
0.4048265, -0.8195176, 3.263343, 0, 0.03921569, 1, 1,
0.4050798, 0.2831362, 2.085392, 0, 0.03529412, 1, 1,
0.4083774, -0.4988357, 0.2475291, 0, 0.02745098, 1, 1,
0.4102335, 1.059508, 1.301881, 0, 0.02352941, 1, 1,
0.4205014, 1.083145, 1.600813, 0, 0.01568628, 1, 1,
0.4220769, -1.285097, 3.211382, 0, 0.01176471, 1, 1,
0.4247231, -0.9213058, 2.658252, 0, 0.003921569, 1, 1,
0.4271416, -0.5808088, 3.235333, 0.003921569, 0, 1, 1,
0.4333677, 0.1256809, 0.08418305, 0.007843138, 0, 1, 1,
0.4380021, 1.531312, 1.18337, 0.01568628, 0, 1, 1,
0.4408558, 1.927435, 0.7931556, 0.01960784, 0, 1, 1,
0.4412944, -1.492413, 3.066099, 0.02745098, 0, 1, 1,
0.4412982, 1.009396, -0.2078736, 0.03137255, 0, 1, 1,
0.4594416, 0.01853073, 0.6988152, 0.03921569, 0, 1, 1,
0.4628557, 0.482898, 1.323354, 0.04313726, 0, 1, 1,
0.4649294, -0.09158029, 2.943046, 0.05098039, 0, 1, 1,
0.4658375, -1.578926, 2.642459, 0.05490196, 0, 1, 1,
0.4688104, 0.3864723, 1.082589, 0.0627451, 0, 1, 1,
0.4702634, 1.655992, 0.6410832, 0.06666667, 0, 1, 1,
0.4731408, -0.2105265, 1.137932, 0.07450981, 0, 1, 1,
0.473451, -0.4736915, 1.852741, 0.07843138, 0, 1, 1,
0.477452, 0.4415087, 1.01558, 0.08627451, 0, 1, 1,
0.4808723, -0.1943789, 0.9823666, 0.09019608, 0, 1, 1,
0.4879299, 1.295969, 0.4773603, 0.09803922, 0, 1, 1,
0.4879843, -1.210792, 4.237565, 0.1058824, 0, 1, 1,
0.4944628, -0.5453099, 2.622726, 0.1098039, 0, 1, 1,
0.4975331, 0.4736584, 0.2022825, 0.1176471, 0, 1, 1,
0.4984279, -0.02396428, 2.238611, 0.1215686, 0, 1, 1,
0.5013031, 0.1881507, -0.3318519, 0.1294118, 0, 1, 1,
0.5018253, 1.123824, -1.803198, 0.1333333, 0, 1, 1,
0.5029408, -0.2524041, 3.601311, 0.1411765, 0, 1, 1,
0.503698, -1.59677, 1.926627, 0.145098, 0, 1, 1,
0.5119821, -0.9086134, 3.265513, 0.1529412, 0, 1, 1,
0.5132511, -0.02427488, 2.201363, 0.1568628, 0, 1, 1,
0.5135642, 0.6753425, 1.517866, 0.1647059, 0, 1, 1,
0.5165168, -0.6188264, 2.226484, 0.1686275, 0, 1, 1,
0.5173717, 0.616963, 0.822342, 0.1764706, 0, 1, 1,
0.5240288, -1.823217, 2.729702, 0.1803922, 0, 1, 1,
0.526188, -0.4917357, 1.816534, 0.1882353, 0, 1, 1,
0.5270025, -0.5161651, 4.210995, 0.1921569, 0, 1, 1,
0.5292498, 1.153879, 1.432398, 0.2, 0, 1, 1,
0.5314782, -1.142267, 2.422366, 0.2078431, 0, 1, 1,
0.5339369, -0.09060266, 1.528518, 0.2117647, 0, 1, 1,
0.5373784, -0.06448153, 1.311319, 0.2196078, 0, 1, 1,
0.542544, 0.9902194, -1.233239, 0.2235294, 0, 1, 1,
0.5425589, 1.446129, 1.164123, 0.2313726, 0, 1, 1,
0.5442781, -0.3379517, 1.627308, 0.2352941, 0, 1, 1,
0.5444754, 0.6007164, 1.699381, 0.2431373, 0, 1, 1,
0.5547071, -1.269476, 1.336126, 0.2470588, 0, 1, 1,
0.5575414, 0.2786297, 0.5080769, 0.254902, 0, 1, 1,
0.5615092, -0.8476335, 3.44085, 0.2588235, 0, 1, 1,
0.5636935, -0.5343945, 2.738008, 0.2666667, 0, 1, 1,
0.5651262, 0.3763164, 1.36159, 0.2705882, 0, 1, 1,
0.5716244, -1.937496, 2.055604, 0.2784314, 0, 1, 1,
0.5741552, -0.4065104, 1.598749, 0.282353, 0, 1, 1,
0.5794984, -0.4955563, 2.978246, 0.2901961, 0, 1, 1,
0.579779, -1.115864, 3.774792, 0.2941177, 0, 1, 1,
0.5937514, 1.235619, 1.30066, 0.3019608, 0, 1, 1,
0.5976509, 0.9924994, -0.5542567, 0.3098039, 0, 1, 1,
0.6011084, 0.1995917, 2.069819, 0.3137255, 0, 1, 1,
0.6036476, -0.5267763, 2.476681, 0.3215686, 0, 1, 1,
0.6038058, -2.108886, 2.559636, 0.3254902, 0, 1, 1,
0.6076839, -0.1495812, 3.083024, 0.3333333, 0, 1, 1,
0.6078145, 1.150767, 0.9513699, 0.3372549, 0, 1, 1,
0.6103456, -1.383925, 1.944662, 0.345098, 0, 1, 1,
0.6106196, -0.77991, 2.195964, 0.3490196, 0, 1, 1,
0.6113142, -0.7532486, 0.7858028, 0.3568628, 0, 1, 1,
0.6124976, 0.8281743, 0.5102696, 0.3607843, 0, 1, 1,
0.6131489, 1.285664, 0.1365756, 0.3686275, 0, 1, 1,
0.6136473, 0.7845433, -0.8887219, 0.372549, 0, 1, 1,
0.6138309, 0.1756179, 1.174878, 0.3803922, 0, 1, 1,
0.6202715, 0.4200428, 1.42664, 0.3843137, 0, 1, 1,
0.6219847, -0.06599614, 3.067877, 0.3921569, 0, 1, 1,
0.630205, -1.198982, 2.286853, 0.3960784, 0, 1, 1,
0.6429649, -0.4319791, 0.01823839, 0.4039216, 0, 1, 1,
0.6485863, 0.5020984, 0.7502414, 0.4117647, 0, 1, 1,
0.6486921, 0.7673739, 2.31062, 0.4156863, 0, 1, 1,
0.6492845, -1.532381, 4.921712, 0.4235294, 0, 1, 1,
0.6545566, 1.744303, 0.5667679, 0.427451, 0, 1, 1,
0.658153, 1.143007, 0.8460822, 0.4352941, 0, 1, 1,
0.6582651, -1.327233, 3.272482, 0.4392157, 0, 1, 1,
0.6612237, -0.9273492, 0.4209816, 0.4470588, 0, 1, 1,
0.6632192, -0.1176659, 0.9841449, 0.4509804, 0, 1, 1,
0.6635377, 0.4305456, 0.8172202, 0.4588235, 0, 1, 1,
0.6662878, 2.782667, -0.1567677, 0.4627451, 0, 1, 1,
0.6677909, -0.1144157, 2.712283, 0.4705882, 0, 1, 1,
0.6679664, -0.6593316, 1.522729, 0.4745098, 0, 1, 1,
0.6831532, -0.8265184, 1.6013, 0.4823529, 0, 1, 1,
0.6895083, 1.360324, -1.671029, 0.4862745, 0, 1, 1,
0.6912504, 1.602445, -0.09702709, 0.4941176, 0, 1, 1,
0.6926408, -0.3684153, 1.42908, 0.5019608, 0, 1, 1,
0.6967349, -0.1970477, 1.086378, 0.5058824, 0, 1, 1,
0.6995424, -1.54364, 2.244551, 0.5137255, 0, 1, 1,
0.7106575, 1.412735, 1.396812, 0.5176471, 0, 1, 1,
0.7159137, -2.523987, 3.33341, 0.5254902, 0, 1, 1,
0.7263855, 0.5237172, 0.9905684, 0.5294118, 0, 1, 1,
0.7280225, 0.1540056, 1.128697, 0.5372549, 0, 1, 1,
0.7284626, -0.6427084, 2.387722, 0.5411765, 0, 1, 1,
0.7313821, -0.0119588, 1.793666, 0.5490196, 0, 1, 1,
0.7321414, -0.5482529, 0.8267581, 0.5529412, 0, 1, 1,
0.732415, 1.567935, 0.6707613, 0.5607843, 0, 1, 1,
0.7327036, 2.292953, 1.201791, 0.5647059, 0, 1, 1,
0.7337884, -1.827194, 2.63807, 0.572549, 0, 1, 1,
0.7341977, -0.5601933, 3.831207, 0.5764706, 0, 1, 1,
0.7359869, 1.007278, 1.005656, 0.5843138, 0, 1, 1,
0.7365592, 0.002425321, 0.9774835, 0.5882353, 0, 1, 1,
0.7386521, 0.1670264, 1.617159, 0.5960785, 0, 1, 1,
0.7471251, 0.149741, -0.3935891, 0.6039216, 0, 1, 1,
0.7540567, 1.727169, -0.5494657, 0.6078432, 0, 1, 1,
0.7609065, 0.2520074, 0.6407685, 0.6156863, 0, 1, 1,
0.7686556, 0.5155894, 0.8513167, 0.6196079, 0, 1, 1,
0.7709184, -0.03820929, 2.859846, 0.627451, 0, 1, 1,
0.7726893, 1.912884, -0.4850118, 0.6313726, 0, 1, 1,
0.7739223, 0.8726727, 1.842261, 0.6392157, 0, 1, 1,
0.7741194, 1.675072, 0.1877088, 0.6431373, 0, 1, 1,
0.7796379, -0.2781584, 1.351237, 0.6509804, 0, 1, 1,
0.7872122, -1.059693, 1.54071, 0.654902, 0, 1, 1,
0.7875344, -0.09524203, -0.4627396, 0.6627451, 0, 1, 1,
0.8057946, 1.695321, 0.3244709, 0.6666667, 0, 1, 1,
0.8061658, 0.6612998, 1.731123, 0.6745098, 0, 1, 1,
0.8094957, -0.3578799, 0.6462491, 0.6784314, 0, 1, 1,
0.8122954, -0.4734853, 1.930507, 0.6862745, 0, 1, 1,
0.8131119, 0.007282556, 2.941179, 0.6901961, 0, 1, 1,
0.8174587, 1.600875, -0.1204789, 0.6980392, 0, 1, 1,
0.8189133, -0.003704835, 2.074269, 0.7058824, 0, 1, 1,
0.823018, 0.2306382, 2.197439, 0.7098039, 0, 1, 1,
0.8272701, 0.1277376, 0.05152257, 0.7176471, 0, 1, 1,
0.8293599, -1.738574, 3.102422, 0.7215686, 0, 1, 1,
0.8377197, -2.295549, 3.411022, 0.7294118, 0, 1, 1,
0.8476807, -1.772952, 4.228407, 0.7333333, 0, 1, 1,
0.8521401, -0.3736496, 0.3717231, 0.7411765, 0, 1, 1,
0.8533571, 0.4354708, 1.400311, 0.7450981, 0, 1, 1,
0.8568398, 1.703904, 1.668966, 0.7529412, 0, 1, 1,
0.8640327, 1.085819, 0.2772721, 0.7568628, 0, 1, 1,
0.8757238, 0.6536646, -0.5254682, 0.7647059, 0, 1, 1,
0.8758636, 1.713552, -0.04104119, 0.7686275, 0, 1, 1,
0.8762109, -1.123696, 1.514593, 0.7764706, 0, 1, 1,
0.8845556, 0.5935981, -0.2424593, 0.7803922, 0, 1, 1,
0.8848707, -0.9813782, 1.58375, 0.7882353, 0, 1, 1,
0.8851696, 1.069876, 2.387829, 0.7921569, 0, 1, 1,
0.8851945, -0.5381404, 1.558379, 0.8, 0, 1, 1,
0.8862518, -0.2789186, 1.924861, 0.8078431, 0, 1, 1,
0.8874272, 0.8743857, 1.240886, 0.8117647, 0, 1, 1,
0.8923507, 1.100801, -0.02917874, 0.8196079, 0, 1, 1,
0.8955102, 1.185457, 0.1588949, 0.8235294, 0, 1, 1,
0.9056461, -0.1097727, 1.533327, 0.8313726, 0, 1, 1,
0.9107699, -0.2418796, 1.282396, 0.8352941, 0, 1, 1,
0.9111892, -1.591402, 2.159834, 0.8431373, 0, 1, 1,
0.9116697, -0.7135801, 1.54542, 0.8470588, 0, 1, 1,
0.9121634, 1.299083, -1.589653, 0.854902, 0, 1, 1,
0.9124691, -0.09503574, 2.765864, 0.8588235, 0, 1, 1,
0.9127387, -0.2199203, 3.597243, 0.8666667, 0, 1, 1,
0.9200671, 2.054011, 0.09702427, 0.8705882, 0, 1, 1,
0.9247465, -0.9649864, 2.10076, 0.8784314, 0, 1, 1,
0.9365339, -0.8955095, 2.553361, 0.8823529, 0, 1, 1,
0.9369753, 1.126914, 2.143229, 0.8901961, 0, 1, 1,
0.9422308, 0.4560155, 2.120237, 0.8941177, 0, 1, 1,
0.9438033, 0.1352482, 2.469329, 0.9019608, 0, 1, 1,
0.9541683, 0.3410174, -0.264626, 0.9098039, 0, 1, 1,
0.9545829, 1.050189, 1.451509, 0.9137255, 0, 1, 1,
0.9594383, 1.471915, 0.2284926, 0.9215686, 0, 1, 1,
0.9624578, -0.7120807, 2.630353, 0.9254902, 0, 1, 1,
0.9701442, -0.3455237, 3.271713, 0.9333333, 0, 1, 1,
0.9738516, -1.544824, 1.158614, 0.9372549, 0, 1, 1,
0.9775776, -0.6844777, 3.929257, 0.945098, 0, 1, 1,
0.9819781, 0.5691616, 1.613166, 0.9490196, 0, 1, 1,
0.984135, -0.2095001, 0.7919126, 0.9568627, 0, 1, 1,
0.9912903, -1.468673, 2.15987, 0.9607843, 0, 1, 1,
0.992851, 0.8395928, -1.484906, 0.9686275, 0, 1, 1,
0.9943616, 1.625496, 0.9987835, 0.972549, 0, 1, 1,
0.9950874, -0.7689645, 1.897666, 0.9803922, 0, 1, 1,
1.001645, -0.7511242, 2.950202, 0.9843137, 0, 1, 1,
1.001963, -0.9571068, -0.489111, 0.9921569, 0, 1, 1,
1.002149, 0.6839893, 1.870837, 0.9960784, 0, 1, 1,
1.003785, -0.8094283, 2.26338, 1, 0, 0.9960784, 1,
1.01094, 0.9111351, 1.303414, 1, 0, 0.9882353, 1,
1.011079, -0.1957206, 2.785105, 1, 0, 0.9843137, 1,
1.018354, -0.5332878, 1.82487, 1, 0, 0.9764706, 1,
1.018828, -0.5653409, 2.917187, 1, 0, 0.972549, 1,
1.023724, 0.2851452, 0.9472804, 1, 0, 0.9647059, 1,
1.025976, 0.01369487, -0.1030691, 1, 0, 0.9607843, 1,
1.030234, -0.1188759, 1.576009, 1, 0, 0.9529412, 1,
1.034689, 0.3800845, 1.122339, 1, 0, 0.9490196, 1,
1.040526, -0.1888879, 1.560746, 1, 0, 0.9411765, 1,
1.046587, -0.4008378, 3.341848, 1, 0, 0.9372549, 1,
1.046997, -0.1058372, 0.6904017, 1, 0, 0.9294118, 1,
1.052066, -1.230141, 3.909838, 1, 0, 0.9254902, 1,
1.053274, 0.3242127, 0.1592462, 1, 0, 0.9176471, 1,
1.053611, -0.8195973, 3.667568, 1, 0, 0.9137255, 1,
1.061726, 0.9785889, 0.7972353, 1, 0, 0.9058824, 1,
1.066093, -0.06938645, 2.247637, 1, 0, 0.9019608, 1,
1.067135, 0.1155221, 2.472956, 1, 0, 0.8941177, 1,
1.080645, -0.1902303, 0.3389112, 1, 0, 0.8862745, 1,
1.081776, -0.3969305, 0.03279955, 1, 0, 0.8823529, 1,
1.087487, 1.430262, -0.0771677, 1, 0, 0.8745098, 1,
1.089731, 0.2625817, 1.511882, 1, 0, 0.8705882, 1,
1.090925, -1.514393, 2.867014, 1, 0, 0.8627451, 1,
1.094777, -0.4718125, 3.141259, 1, 0, 0.8588235, 1,
1.099481, -0.9276591, 3.434044, 1, 0, 0.8509804, 1,
1.104619, -0.4579165, 1.282732, 1, 0, 0.8470588, 1,
1.115305, 0.848563, 1.782681, 1, 0, 0.8392157, 1,
1.116472, 0.04978058, 0.2815637, 1, 0, 0.8352941, 1,
1.118903, -0.06527807, 0.05572664, 1, 0, 0.827451, 1,
1.121367, 0.9392786, 2.020833, 1, 0, 0.8235294, 1,
1.128673, -0.2366418, 1.656675, 1, 0, 0.8156863, 1,
1.132535, -1.386294, 1.167385, 1, 0, 0.8117647, 1,
1.133124, 0.90759, 1.127193, 1, 0, 0.8039216, 1,
1.136018, 2.143604, -0.5180741, 1, 0, 0.7960784, 1,
1.142273, -0.9557666, 2.262119, 1, 0, 0.7921569, 1,
1.143284, -0.9165003, 2.255786, 1, 0, 0.7843137, 1,
1.152755, 0.07287326, 1.898355, 1, 0, 0.7803922, 1,
1.158377, -0.6605912, 1.887911, 1, 0, 0.772549, 1,
1.159058, 0.5170467, 2.271005, 1, 0, 0.7686275, 1,
1.163682, -0.4485323, 3.849965, 1, 0, 0.7607843, 1,
1.177299, -2.878385, 3.545209, 1, 0, 0.7568628, 1,
1.18324, -2.466639, 1.737228, 1, 0, 0.7490196, 1,
1.184081, -1.494416, 2.450623, 1, 0, 0.7450981, 1,
1.187039, -0.3218927, 2.119518, 1, 0, 0.7372549, 1,
1.201591, 0.5508887, 1.499919, 1, 0, 0.7333333, 1,
1.203686, -0.3520777, 1.601204, 1, 0, 0.7254902, 1,
1.211386, -1.419176, 1.791828, 1, 0, 0.7215686, 1,
1.212472, 0.4616227, -0.2999849, 1, 0, 0.7137255, 1,
1.217008, 0.2982597, 2.65491, 1, 0, 0.7098039, 1,
1.220987, 0.2789772, 2.457825, 1, 0, 0.7019608, 1,
1.226655, 0.5587679, 2.727509, 1, 0, 0.6941177, 1,
1.226727, -0.7275821, 2.336694, 1, 0, 0.6901961, 1,
1.235928, 0.7766892, 0.8587079, 1, 0, 0.682353, 1,
1.236444, -1.137993, 1.203597, 1, 0, 0.6784314, 1,
1.246735, 0.1818396, 1.121934, 1, 0, 0.6705883, 1,
1.246848, -2.798999, 2.757226, 1, 0, 0.6666667, 1,
1.24994, -0.8837642, 0.9708794, 1, 0, 0.6588235, 1,
1.25334, 0.8912517, 0.491629, 1, 0, 0.654902, 1,
1.256035, 0.1544827, 1.040264, 1, 0, 0.6470588, 1,
1.25838, -0.681465, 2.726867, 1, 0, 0.6431373, 1,
1.261505, 1.04941, 0.8061725, 1, 0, 0.6352941, 1,
1.264723, -1.51856, 1.793044, 1, 0, 0.6313726, 1,
1.269074, 0.7662625, 1.991091, 1, 0, 0.6235294, 1,
1.269507, -0.6922827, 1.460631, 1, 0, 0.6196079, 1,
1.271514, -1.247961, 2.196477, 1, 0, 0.6117647, 1,
1.272751, -0.6279631, 4.814042, 1, 0, 0.6078432, 1,
1.291302, -0.2226639, 1.536325, 1, 0, 0.6, 1,
1.292376, -1.359093, 2.557961, 1, 0, 0.5921569, 1,
1.294978, 0.4344238, 2.453753, 1, 0, 0.5882353, 1,
1.29797, 0.5462509, 1.33206, 1, 0, 0.5803922, 1,
1.308558, 0.6439719, 1.596442, 1, 0, 0.5764706, 1,
1.326584, -0.8917266, 1.459302, 1, 0, 0.5686275, 1,
1.326897, 1.11293, 1.191222, 1, 0, 0.5647059, 1,
1.328165, -0.3236521, 2.032018, 1, 0, 0.5568628, 1,
1.330241, 0.07037016, 1.190543, 1, 0, 0.5529412, 1,
1.332271, -1.066953, 1.45716, 1, 0, 0.5450981, 1,
1.335286, 0.281672, 1.367041, 1, 0, 0.5411765, 1,
1.342851, -2.18468, 2.340418, 1, 0, 0.5333334, 1,
1.359875, 1.457117, 2.002024, 1, 0, 0.5294118, 1,
1.363178, -0.5250115, 2.44963, 1, 0, 0.5215687, 1,
1.363313, 0.3529868, 1.897456, 1, 0, 0.5176471, 1,
1.38873, -0.5037964, 2.328187, 1, 0, 0.509804, 1,
1.391338, -0.01378322, 0.3208276, 1, 0, 0.5058824, 1,
1.392181, 0.1085409, 3.249843, 1, 0, 0.4980392, 1,
1.397193, 1.037555, 0.5078679, 1, 0, 0.4901961, 1,
1.40585, 0.03390218, 2.670266, 1, 0, 0.4862745, 1,
1.418174, -0.4429089, 3.195001, 1, 0, 0.4784314, 1,
1.42857, -1.182973, 1.340828, 1, 0, 0.4745098, 1,
1.435618, -0.01334557, 1.209738, 1, 0, 0.4666667, 1,
1.436429, -0.7192225, 0.611551, 1, 0, 0.4627451, 1,
1.445279, -1.760343, 1.384816, 1, 0, 0.454902, 1,
1.448639, -1.104682, 0.2786937, 1, 0, 0.4509804, 1,
1.451725, 0.8123294, 1.154579, 1, 0, 0.4431373, 1,
1.451883, 0.4295104, 1.626371, 1, 0, 0.4392157, 1,
1.454847, -1.377233, 2.000172, 1, 0, 0.4313726, 1,
1.46772, 1.100814, 0.8275899, 1, 0, 0.427451, 1,
1.468813, 0.239296, 2.429985, 1, 0, 0.4196078, 1,
1.485315, 0.8153756, 0.3488935, 1, 0, 0.4156863, 1,
1.491081, -0.9476541, 2.53541, 1, 0, 0.4078431, 1,
1.492657, 0.09242314, 1.792814, 1, 0, 0.4039216, 1,
1.493674, 0.2577868, 2.05764, 1, 0, 0.3960784, 1,
1.508579, 0.3858558, 1.616496, 1, 0, 0.3882353, 1,
1.528023, -0.03422459, 2.390169, 1, 0, 0.3843137, 1,
1.530546, -0.4018499, 1.301805, 1, 0, 0.3764706, 1,
1.535019, 2.65464, -0.6124002, 1, 0, 0.372549, 1,
1.535975, 0.6539431, 2.289374, 1, 0, 0.3647059, 1,
1.536648, 0.817503, 0.4949139, 1, 0, 0.3607843, 1,
1.537442, 1.403923, 2.238308, 1, 0, 0.3529412, 1,
1.538445, 0.6588098, 0.3331144, 1, 0, 0.3490196, 1,
1.544289, 1.370592, 2.123896, 1, 0, 0.3411765, 1,
1.553781, 0.510551, 1.192337, 1, 0, 0.3372549, 1,
1.55609, -1.377243, 3.768221, 1, 0, 0.3294118, 1,
1.567921, 1.829651, 0.8607628, 1, 0, 0.3254902, 1,
1.579388, -1.186153, 2.879543, 1, 0, 0.3176471, 1,
1.583161, 2.415446, 0.5086902, 1, 0, 0.3137255, 1,
1.592499, 0.8551702, 1.326785, 1, 0, 0.3058824, 1,
1.598113, -0.6802262, 2.74196, 1, 0, 0.2980392, 1,
1.61008, 0.3075956, 2.284022, 1, 0, 0.2941177, 1,
1.611946, 0.9307692, 2.141054, 1, 0, 0.2862745, 1,
1.627368, 0.4071968, 2.02124, 1, 0, 0.282353, 1,
1.628438, 0.02964548, 4.096616, 1, 0, 0.2745098, 1,
1.629095, -1.333995, 2.592498, 1, 0, 0.2705882, 1,
1.649057, -1.191864, 1.34267, 1, 0, 0.2627451, 1,
1.653564, -0.03183547, 0.778897, 1, 0, 0.2588235, 1,
1.658994, -0.4484867, 2.830536, 1, 0, 0.2509804, 1,
1.660535, -0.3391611, 0.495113, 1, 0, 0.2470588, 1,
1.669453, -0.09614214, 1.237603, 1, 0, 0.2392157, 1,
1.69881, 1.044014, 1.314047, 1, 0, 0.2352941, 1,
1.699462, 0.6020909, 1.328777, 1, 0, 0.227451, 1,
1.701928, 2.063741, 0.4469909, 1, 0, 0.2235294, 1,
1.708395, -0.8271919, 1.018976, 1, 0, 0.2156863, 1,
1.709415, -1.058162, 1.794066, 1, 0, 0.2117647, 1,
1.734336, 0.8948372, 2.836235, 1, 0, 0.2039216, 1,
1.746509, 0.7408761, 2.489264, 1, 0, 0.1960784, 1,
1.753641, 1.224776, 0.2835718, 1, 0, 0.1921569, 1,
1.76678, -0.4692351, 2.295581, 1, 0, 0.1843137, 1,
1.769421, 1.074967, 0.8207366, 1, 0, 0.1803922, 1,
1.784804, 1.123707, -0.2231577, 1, 0, 0.172549, 1,
1.806912, 2.278131, 1.154349, 1, 0, 0.1686275, 1,
1.83055, 0.8683523, 1.926403, 1, 0, 0.1607843, 1,
1.919967, -0.162291, 0.9436278, 1, 0, 0.1568628, 1,
1.936111, -1.323395, 1.4992, 1, 0, 0.1490196, 1,
1.9587, 0.5123401, 0.1660071, 1, 0, 0.145098, 1,
1.994994, -0.6668195, 2.983244, 1, 0, 0.1372549, 1,
2.007499, 0.1268934, 0.1688582, 1, 0, 0.1333333, 1,
2.010113, -1.025724, 2.218493, 1, 0, 0.1254902, 1,
2.014964, -0.5069544, 2.669964, 1, 0, 0.1215686, 1,
2.034506, 0.8487487, 0.5975112, 1, 0, 0.1137255, 1,
2.036134, 0.1322634, 0.6955446, 1, 0, 0.1098039, 1,
2.095717, -0.6187839, 1.869066, 1, 0, 0.1019608, 1,
2.117894, 0.4118247, 0.3128412, 1, 0, 0.09411765, 1,
2.180715, 1.125297, 0.8902811, 1, 0, 0.09019608, 1,
2.189185, -1.329487, 1.883711, 1, 0, 0.08235294, 1,
2.196601, 1.32216, -0.3873196, 1, 0, 0.07843138, 1,
2.200675, -0.5130433, 1.713628, 1, 0, 0.07058824, 1,
2.230217, -0.7629432, 2.46531, 1, 0, 0.06666667, 1,
2.24763, 0.6503375, 2.739357, 1, 0, 0.05882353, 1,
2.266308, -1.196574, 1.420171, 1, 0, 0.05490196, 1,
2.320554, -0.7335216, 1.856932, 1, 0, 0.04705882, 1,
2.345601, 0.8485478, 2.794025, 1, 0, 0.04313726, 1,
2.389235, -1.596037, 2.699767, 1, 0, 0.03529412, 1,
2.467622, 0.2437115, 2.371543, 1, 0, 0.03137255, 1,
2.565152, -0.1608035, 1.120861, 1, 0, 0.02352941, 1,
2.632514, -1.484406, 1.677437, 1, 0, 0.01960784, 1,
2.678127, -0.3521402, 1.434055, 1, 0, 0.01176471, 1,
2.884343, -0.5509025, 0.4363685, 1, 0, 0.007843138, 1
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
-0.07104456, -3.845362, -7.035606, 0, -0.5, 0.5, 0.5,
-0.07104456, -3.845362, -7.035606, 1, -0.5, 0.5, 0.5,
-0.07104456, -3.845362, -7.035606, 1, 1.5, 0.5, 0.5,
-0.07104456, -3.845362, -7.035606, 0, 1.5, 0.5, 0.5
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
-4.028308, -0.02594328, -7.035606, 0, -0.5, 0.5, 0.5,
-4.028308, -0.02594328, -7.035606, 1, -0.5, 0.5, 0.5,
-4.028308, -0.02594328, -7.035606, 1, 1.5, 0.5, 0.5,
-4.028308, -0.02594328, -7.035606, 0, 1.5, 0.5, 0.5
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
-4.028308, -3.845362, -0.1904378, 0, -0.5, 0.5, 0.5,
-4.028308, -3.845362, -0.1904378, 1, -0.5, 0.5, 0.5,
-4.028308, -3.845362, -0.1904378, 1, 1.5, 0.5, 0.5,
-4.028308, -3.845362, -0.1904378, 0, 1.5, 0.5, 0.5
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
-3, -2.963958, -5.455952,
2, -2.963958, -5.455952,
-3, -2.963958, -5.455952,
-3, -3.110858, -5.719228,
-2, -2.963958, -5.455952,
-2, -3.110858, -5.719228,
-1, -2.963958, -5.455952,
-1, -3.110858, -5.719228,
0, -2.963958, -5.455952,
0, -3.110858, -5.719228,
1, -2.963958, -5.455952,
1, -3.110858, -5.719228,
2, -2.963958, -5.455952,
2, -3.110858, -5.719228
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
-3, -3.40466, -6.245779, 0, -0.5, 0.5, 0.5,
-3, -3.40466, -6.245779, 1, -0.5, 0.5, 0.5,
-3, -3.40466, -6.245779, 1, 1.5, 0.5, 0.5,
-3, -3.40466, -6.245779, 0, 1.5, 0.5, 0.5,
-2, -3.40466, -6.245779, 0, -0.5, 0.5, 0.5,
-2, -3.40466, -6.245779, 1, -0.5, 0.5, 0.5,
-2, -3.40466, -6.245779, 1, 1.5, 0.5, 0.5,
-2, -3.40466, -6.245779, 0, 1.5, 0.5, 0.5,
-1, -3.40466, -6.245779, 0, -0.5, 0.5, 0.5,
-1, -3.40466, -6.245779, 1, -0.5, 0.5, 0.5,
-1, -3.40466, -6.245779, 1, 1.5, 0.5, 0.5,
-1, -3.40466, -6.245779, 0, 1.5, 0.5, 0.5,
0, -3.40466, -6.245779, 0, -0.5, 0.5, 0.5,
0, -3.40466, -6.245779, 1, -0.5, 0.5, 0.5,
0, -3.40466, -6.245779, 1, 1.5, 0.5, 0.5,
0, -3.40466, -6.245779, 0, 1.5, 0.5, 0.5,
1, -3.40466, -6.245779, 0, -0.5, 0.5, 0.5,
1, -3.40466, -6.245779, 1, -0.5, 0.5, 0.5,
1, -3.40466, -6.245779, 1, 1.5, 0.5, 0.5,
1, -3.40466, -6.245779, 0, 1.5, 0.5, 0.5,
2, -3.40466, -6.245779, 0, -0.5, 0.5, 0.5,
2, -3.40466, -6.245779, 1, -0.5, 0.5, 0.5,
2, -3.40466, -6.245779, 1, 1.5, 0.5, 0.5,
2, -3.40466, -6.245779, 0, 1.5, 0.5, 0.5
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
-3.115094, -2, -5.455952,
-3.115094, 2, -5.455952,
-3.115094, -2, -5.455952,
-3.267296, -2, -5.719228,
-3.115094, -1, -5.455952,
-3.267296, -1, -5.719228,
-3.115094, 0, -5.455952,
-3.267296, 0, -5.719228,
-3.115094, 1, -5.455952,
-3.267296, 1, -5.719228,
-3.115094, 2, -5.455952,
-3.267296, 2, -5.719228
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
-3.571701, -2, -6.245779, 0, -0.5, 0.5, 0.5,
-3.571701, -2, -6.245779, 1, -0.5, 0.5, 0.5,
-3.571701, -2, -6.245779, 1, 1.5, 0.5, 0.5,
-3.571701, -2, -6.245779, 0, 1.5, 0.5, 0.5,
-3.571701, -1, -6.245779, 0, -0.5, 0.5, 0.5,
-3.571701, -1, -6.245779, 1, -0.5, 0.5, 0.5,
-3.571701, -1, -6.245779, 1, 1.5, 0.5, 0.5,
-3.571701, -1, -6.245779, 0, 1.5, 0.5, 0.5,
-3.571701, 0, -6.245779, 0, -0.5, 0.5, 0.5,
-3.571701, 0, -6.245779, 1, -0.5, 0.5, 0.5,
-3.571701, 0, -6.245779, 1, 1.5, 0.5, 0.5,
-3.571701, 0, -6.245779, 0, 1.5, 0.5, 0.5,
-3.571701, 1, -6.245779, 0, -0.5, 0.5, 0.5,
-3.571701, 1, -6.245779, 1, -0.5, 0.5, 0.5,
-3.571701, 1, -6.245779, 1, 1.5, 0.5, 0.5,
-3.571701, 1, -6.245779, 0, 1.5, 0.5, 0.5,
-3.571701, 2, -6.245779, 0, -0.5, 0.5, 0.5,
-3.571701, 2, -6.245779, 1, -0.5, 0.5, 0.5,
-3.571701, 2, -6.245779, 1, 1.5, 0.5, 0.5,
-3.571701, 2, -6.245779, 0, 1.5, 0.5, 0.5
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
-3.115094, -2.963958, -4,
-3.115094, -2.963958, 4,
-3.115094, -2.963958, -4,
-3.267296, -3.110858, -4,
-3.115094, -2.963958, -2,
-3.267296, -3.110858, -2,
-3.115094, -2.963958, 0,
-3.267296, -3.110858, 0,
-3.115094, -2.963958, 2,
-3.267296, -3.110858, 2,
-3.115094, -2.963958, 4,
-3.267296, -3.110858, 4
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
-3.571701, -3.40466, -4, 0, -0.5, 0.5, 0.5,
-3.571701, -3.40466, -4, 1, -0.5, 0.5, 0.5,
-3.571701, -3.40466, -4, 1, 1.5, 0.5, 0.5,
-3.571701, -3.40466, -4, 0, 1.5, 0.5, 0.5,
-3.571701, -3.40466, -2, 0, -0.5, 0.5, 0.5,
-3.571701, -3.40466, -2, 1, -0.5, 0.5, 0.5,
-3.571701, -3.40466, -2, 1, 1.5, 0.5, 0.5,
-3.571701, -3.40466, -2, 0, 1.5, 0.5, 0.5,
-3.571701, -3.40466, 0, 0, -0.5, 0.5, 0.5,
-3.571701, -3.40466, 0, 1, -0.5, 0.5, 0.5,
-3.571701, -3.40466, 0, 1, 1.5, 0.5, 0.5,
-3.571701, -3.40466, 0, 0, 1.5, 0.5, 0.5,
-3.571701, -3.40466, 2, 0, -0.5, 0.5, 0.5,
-3.571701, -3.40466, 2, 1, -0.5, 0.5, 0.5,
-3.571701, -3.40466, 2, 1, 1.5, 0.5, 0.5,
-3.571701, -3.40466, 2, 0, 1.5, 0.5, 0.5,
-3.571701, -3.40466, 4, 0, -0.5, 0.5, 0.5,
-3.571701, -3.40466, 4, 1, -0.5, 0.5, 0.5,
-3.571701, -3.40466, 4, 1, 1.5, 0.5, 0.5,
-3.571701, -3.40466, 4, 0, 1.5, 0.5, 0.5
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
-3.115094, -2.963958, -5.455952,
-3.115094, 2.912071, -5.455952,
-3.115094, -2.963958, 5.075077,
-3.115094, 2.912071, 5.075077,
-3.115094, -2.963958, -5.455952,
-3.115094, -2.963958, 5.075077,
-3.115094, 2.912071, -5.455952,
-3.115094, 2.912071, 5.075077,
-3.115094, -2.963958, -5.455952,
2.973005, -2.963958, -5.455952,
-3.115094, -2.963958, 5.075077,
2.973005, -2.963958, 5.075077,
-3.115094, 2.912071, -5.455952,
2.973005, 2.912071, -5.455952,
-3.115094, 2.912071, 5.075077,
2.973005, 2.912071, 5.075077,
2.973005, -2.963958, -5.455952,
2.973005, 2.912071, -5.455952,
2.973005, -2.963958, 5.075077,
2.973005, 2.912071, 5.075077,
2.973005, -2.963958, -5.455952,
2.973005, -2.963958, 5.075077,
2.973005, 2.912071, -5.455952,
2.973005, 2.912071, 5.075077
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
var radius = 7.213586;
var distance = 32.09406;
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
mvMatrix.translate( 0.07104456, 0.02594328, 0.1904378 );
mvMatrix.scale( 1.281101, 1.327337, 0.7406181 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.09406);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
pronamide<-read.table("pronamide.xyz")
```

```
## Error in read.table("pronamide.xyz"): no lines available in input
```

```r
x<-pronamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'pronamide' not found
```

```r
y<-pronamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'pronamide' not found
```

```r
z<-pronamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'pronamide' not found
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
-3.026432, 1.304305, -0.2204686, 0, 0, 1, 1, 1,
-2.879426, 0.7050992, -1.455075, 1, 0, 0, 1, 1,
-2.784935, -1.319049, -1.517537, 1, 0, 0, 1, 1,
-2.638199, 0.298209, -2.103593, 1, 0, 0, 1, 1,
-2.603405, -0.9394796, -2.183501, 1, 0, 0, 1, 1,
-2.571452, -0.09370323, -0.8698028, 1, 0, 0, 1, 1,
-2.5651, -0.7226737, -2.265767, 0, 0, 0, 1, 1,
-2.539817, 0.3898262, -0.458621, 0, 0, 0, 1, 1,
-2.502819, -1.575198, -1.608709, 0, 0, 0, 1, 1,
-2.494418, -0.346266, -2.678558, 0, 0, 0, 1, 1,
-2.430082, 0.8141115, -1.651369, 0, 0, 0, 1, 1,
-2.408441, -0.2029932, -1.566856, 0, 0, 0, 1, 1,
-2.381277, 0.03861087, -1.46762, 0, 0, 0, 1, 1,
-2.340444, -1.170235, -2.02598, 1, 1, 1, 1, 1,
-2.302466, 1.410081, -1.402846, 1, 1, 1, 1, 1,
-2.261153, 0.7258143, -1.119579, 1, 1, 1, 1, 1,
-2.246525, 0.2771985, 0.1182071, 1, 1, 1, 1, 1,
-2.199414, 0.1354613, -2.632973, 1, 1, 1, 1, 1,
-2.182781, -0.3161513, -1.597649, 1, 1, 1, 1, 1,
-2.167596, 0.4759001, 0.2403447, 1, 1, 1, 1, 1,
-2.143861, -0.3720541, -1.795539, 1, 1, 1, 1, 1,
-2.139961, -1.096468, -2.783491, 1, 1, 1, 1, 1,
-2.130245, 0.6123255, -1.882143, 1, 1, 1, 1, 1,
-2.129351, 0.5085304, 0.7259189, 1, 1, 1, 1, 1,
-2.11576, 0.4568624, -0.9784461, 1, 1, 1, 1, 1,
-2.099844, 0.4623398, -1.784798, 1, 1, 1, 1, 1,
-2.094621, -1.349841, -2.965739, 1, 1, 1, 1, 1,
-2.036663, -0.2384897, -1.748752, 1, 1, 1, 1, 1,
-2.032234, -1.422776, -4.017715, 0, 0, 1, 1, 1,
-2.029276, -0.3336726, -1.224741, 1, 0, 0, 1, 1,
-2.026798, 1.530709, -0.5708344, 1, 0, 0, 1, 1,
-2.019388, -0.4353357, -1.390347, 1, 0, 0, 1, 1,
-2.006799, -1.69157, -1.146972, 1, 0, 0, 1, 1,
-1.972454, -0.1025978, -0.6795636, 1, 0, 0, 1, 1,
-1.896963, -0.3800271, -0.5771596, 0, 0, 0, 1, 1,
-1.896529, 1.557212, -0.6551186, 0, 0, 0, 1, 1,
-1.883835, -0.5180908, -1.987743, 0, 0, 0, 1, 1,
-1.862515, -0.4195966, -2.068705, 0, 0, 0, 1, 1,
-1.845646, 1.003946, -2.132393, 0, 0, 0, 1, 1,
-1.822525, 0.1426371, -1.996697, 0, 0, 0, 1, 1,
-1.817143, 1.641879, -0.3655632, 0, 0, 0, 1, 1,
-1.815454, 0.3717169, -1.180388, 1, 1, 1, 1, 1,
-1.806669, 0.3380115, -2.843493, 1, 1, 1, 1, 1,
-1.804433, 0.4984345, -2.636874, 1, 1, 1, 1, 1,
-1.794696, -0.5681308, -1.085243, 1, 1, 1, 1, 1,
-1.786956, -1.285604, -3.454248, 1, 1, 1, 1, 1,
-1.757702, -0.5192187, -3.396504, 1, 1, 1, 1, 1,
-1.742322, 0.2886143, -1.774055, 1, 1, 1, 1, 1,
-1.736343, -0.4621342, -2.284125, 1, 1, 1, 1, 1,
-1.732142, 0.8056042, -4.261427, 1, 1, 1, 1, 1,
-1.731818, -0.941373, -2.897468, 1, 1, 1, 1, 1,
-1.723288, -0.7596382, -1.53428, 1, 1, 1, 1, 1,
-1.721814, 0.7001298, -1.550042, 1, 1, 1, 1, 1,
-1.706605, -0.3940088, -2.76254, 1, 1, 1, 1, 1,
-1.703491, -0.6182922, -2.209713, 1, 1, 1, 1, 1,
-1.70243, 0.3687454, 0.1444801, 1, 1, 1, 1, 1,
-1.694216, -0.1452147, -2.01957, 0, 0, 1, 1, 1,
-1.66478, -1.393692, -0.9366281, 1, 0, 0, 1, 1,
-1.6364, 1.324072, -3.126371, 1, 0, 0, 1, 1,
-1.564426, -0.7215985, -3.423941, 1, 0, 0, 1, 1,
-1.55989, 2.273786, 0.2256624, 1, 0, 0, 1, 1,
-1.554092, -0.008167238, -1.016497, 1, 0, 0, 1, 1,
-1.55353, -0.1953487, -2.621615, 0, 0, 0, 1, 1,
-1.54279, 0.6378012, -1.41942, 0, 0, 0, 1, 1,
-1.542649, -1.187198, -0.5627419, 0, 0, 0, 1, 1,
-1.5414, -0.04671581, -1.070171, 0, 0, 0, 1, 1,
-1.499895, 0.09880693, -0.4759668, 0, 0, 0, 1, 1,
-1.482905, -0.06832466, -1.629055, 0, 0, 0, 1, 1,
-1.478253, -0.6696395, -1.361975, 0, 0, 0, 1, 1,
-1.471516, 1.586018, 0.3363588, 1, 1, 1, 1, 1,
-1.467176, 0.5847704, -0.850062, 1, 1, 1, 1, 1,
-1.466537, -1.779623, 0.2601921, 1, 1, 1, 1, 1,
-1.458558, -0.03810242, -1.26088, 1, 1, 1, 1, 1,
-1.451368, 0.1076212, -3.089253, 1, 1, 1, 1, 1,
-1.447188, -1.428912, -3.814075, 1, 1, 1, 1, 1,
-1.444071, -0.2570263, -3.792144, 1, 1, 1, 1, 1,
-1.440324, -1.484879, -1.742171, 1, 1, 1, 1, 1,
-1.417034, -0.0856091, -1.074683, 1, 1, 1, 1, 1,
-1.412204, -1.048486, -1.888828, 1, 1, 1, 1, 1,
-1.405868, 0.4800355, -0.7151351, 1, 1, 1, 1, 1,
-1.386185, 0.6207863, -4.242874, 1, 1, 1, 1, 1,
-1.385634, -2.014533, -2.78301, 1, 1, 1, 1, 1,
-1.38288, -1.518817, -1.053406, 1, 1, 1, 1, 1,
-1.376866, 0.2681231, -1.00858, 1, 1, 1, 1, 1,
-1.36912, 1.000268, -0.9220441, 0, 0, 1, 1, 1,
-1.367529, 1.198048, -1.310282, 1, 0, 0, 1, 1,
-1.358332, -0.9066439, -2.090561, 1, 0, 0, 1, 1,
-1.349035, -1.378893, -5.302588, 1, 0, 0, 1, 1,
-1.338551, -1.447981, -0.8053224, 1, 0, 0, 1, 1,
-1.336266, 0.242806, -1.615236, 1, 0, 0, 1, 1,
-1.330955, -0.1294498, -1.099713, 0, 0, 0, 1, 1,
-1.32026, -0.3911406, -2.783912, 0, 0, 0, 1, 1,
-1.318981, -0.2007932, -0.8431504, 0, 0, 0, 1, 1,
-1.31435, 1.597207, -3.076161, 0, 0, 0, 1, 1,
-1.312292, -0.1064095, -0.4231506, 0, 0, 0, 1, 1,
-1.311104, -0.7485151, -1.180265, 0, 0, 0, 1, 1,
-1.296785, 0.5827375, -2.193029, 0, 0, 0, 1, 1,
-1.294937, 0.3012735, -0.998791, 1, 1, 1, 1, 1,
-1.293552, -1.012869, -3.602217, 1, 1, 1, 1, 1,
-1.288546, 1.375116, -1.760631, 1, 1, 1, 1, 1,
-1.282292, -0.02485595, -0.8665017, 1, 1, 1, 1, 1,
-1.2748, 0.5742396, -1.317895, 1, 1, 1, 1, 1,
-1.268485, 1.141738, 0.3243046, 1, 1, 1, 1, 1,
-1.264801, -1.155206, -2.472932, 1, 1, 1, 1, 1,
-1.261836, 0.08233856, -2.725193, 1, 1, 1, 1, 1,
-1.256193, -0.8849527, -0.2281711, 1, 1, 1, 1, 1,
-1.253558, -0.9763666, -2.382882, 1, 1, 1, 1, 1,
-1.251693, 0.768478, 0.08947586, 1, 1, 1, 1, 1,
-1.24843, -0.5319282, -3.577598, 1, 1, 1, 1, 1,
-1.244735, -0.1500907, -1.523468, 1, 1, 1, 1, 1,
-1.239631, 0.6364753, -1.458733, 1, 1, 1, 1, 1,
-1.239461, -0.7426441, -0.5947598, 1, 1, 1, 1, 1,
-1.238556, -1.052935, -2.581551, 0, 0, 1, 1, 1,
-1.237251, -0.3027014, -0.01091114, 1, 0, 0, 1, 1,
-1.226957, -1.778651, -2.099251, 1, 0, 0, 1, 1,
-1.221968, -0.5677969, -1.866205, 1, 0, 0, 1, 1,
-1.21843, 0.4784825, -2.368208, 1, 0, 0, 1, 1,
-1.217534, -1.516316, -2.282328, 1, 0, 0, 1, 1,
-1.201106, 0.7950187, -2.155009, 0, 0, 0, 1, 1,
-1.196981, -0.1095106, -1.601548, 0, 0, 0, 1, 1,
-1.194162, 0.8389316, -2.701349, 0, 0, 0, 1, 1,
-1.194057, -0.3637194, -2.390381, 0, 0, 0, 1, 1,
-1.193777, 0.01730395, -3.434268, 0, 0, 0, 1, 1,
-1.193684, 0.5145067, -0.6518649, 0, 0, 0, 1, 1,
-1.19247, 0.01838484, -0.2885335, 0, 0, 0, 1, 1,
-1.17904, 1.162989, -1.750261, 1, 1, 1, 1, 1,
-1.178584, -0.9813344, -3.187643, 1, 1, 1, 1, 1,
-1.175997, 0.8761803, -2.402171, 1, 1, 1, 1, 1,
-1.171556, -0.1196207, -1.369985, 1, 1, 1, 1, 1,
-1.170274, 1.716917, -2.53678, 1, 1, 1, 1, 1,
-1.168578, -1.297716, -3.069351, 1, 1, 1, 1, 1,
-1.164669, -0.2734341, -0.6170142, 1, 1, 1, 1, 1,
-1.164468, -0.8014147, 0.038971, 1, 1, 1, 1, 1,
-1.160823, -2.02047, -1.835752, 1, 1, 1, 1, 1,
-1.160475, -0.1684493, -1.3854, 1, 1, 1, 1, 1,
-1.154966, -0.6063117, -2.429868, 1, 1, 1, 1, 1,
-1.147863, 1.08052, 1.088772, 1, 1, 1, 1, 1,
-1.139767, 0.2595441, -0.6936299, 1, 1, 1, 1, 1,
-1.136358, -1.0061, -2.546262, 1, 1, 1, 1, 1,
-1.132369, -0.2583821, 0.1913741, 1, 1, 1, 1, 1,
-1.130374, 0.1795282, -2.052317, 0, 0, 1, 1, 1,
-1.122782, 1.360288, 0.09927379, 1, 0, 0, 1, 1,
-1.121055, 0.2602254, -3.017549, 1, 0, 0, 1, 1,
-1.117973, 0.2545748, -2.930552, 1, 0, 0, 1, 1,
-1.112219, -0.831482, -2.049708, 1, 0, 0, 1, 1,
-1.105725, 1.369455, 0.131966, 1, 0, 0, 1, 1,
-1.086913, -0.7544348, -2.420018, 0, 0, 0, 1, 1,
-1.077085, -0.5854689, -3.868219, 0, 0, 0, 1, 1,
-1.073113, 0.6517638, -0.6797231, 0, 0, 0, 1, 1,
-1.072545, -0.9020038, -3.500206, 0, 0, 0, 1, 1,
-1.07079, 0.1795184, 0.04132833, 0, 0, 0, 1, 1,
-1.066761, -0.4314643, -2.059768, 0, 0, 0, 1, 1,
-1.048627, 1.270267, -0.8675798, 0, 0, 0, 1, 1,
-1.046208, -1.415999, -3.332946, 1, 1, 1, 1, 1,
-1.044071, -0.3440402, -1.296838, 1, 1, 1, 1, 1,
-1.039037, 0.6107282, -1.504028, 1, 1, 1, 1, 1,
-1.030311, -1.578909, -2.353686, 1, 1, 1, 1, 1,
-1.018948, 0.8169313, -0.6564347, 1, 1, 1, 1, 1,
-1.014643, 0.1770217, -2.331404, 1, 1, 1, 1, 1,
-1.011698, 0.02626089, 0.1054321, 1, 1, 1, 1, 1,
-1.010238, -1.730511, -4.663258, 1, 1, 1, 1, 1,
-0.996818, 0.2634838, -1.036968, 1, 1, 1, 1, 1,
-0.9945874, -0.3486277, -2.567745, 1, 1, 1, 1, 1,
-0.9881543, -0.1824298, -1.736921, 1, 1, 1, 1, 1,
-0.9862461, -1.316895, -2.487891, 1, 1, 1, 1, 1,
-0.9853526, 0.1158506, -2.569665, 1, 1, 1, 1, 1,
-0.9850193, -2.590124, -3.701368, 1, 1, 1, 1, 1,
-0.9817455, 1.638105, -1.51764, 1, 1, 1, 1, 1,
-0.9731609, 0.5895557, -0.0852209, 0, 0, 1, 1, 1,
-0.9681363, 0.5141635, 0.857209, 1, 0, 0, 1, 1,
-0.964648, -1.858393, -1.329509, 1, 0, 0, 1, 1,
-0.9614912, -0.6833509, -2.853435, 1, 0, 0, 1, 1,
-0.9588998, -0.5586705, -2.037673, 1, 0, 0, 1, 1,
-0.9545279, 1.713134, 0.07925762, 1, 0, 0, 1, 1,
-0.9535847, 2.027191, -1.483997, 0, 0, 0, 1, 1,
-0.947107, -0.5290011, -1.972512, 0, 0, 0, 1, 1,
-0.9459907, -2.050435, -1.711497, 0, 0, 0, 1, 1,
-0.9345925, -5.515203e-05, -1.837521, 0, 0, 0, 1, 1,
-0.9339801, -0.5544735, -3.096711, 0, 0, 0, 1, 1,
-0.9278756, 0.3261042, -1.761284, 0, 0, 0, 1, 1,
-0.9257913, 0.3298652, 0.4436217, 0, 0, 0, 1, 1,
-0.9253948, 0.1215153, -0.7173703, 1, 1, 1, 1, 1,
-0.922435, -0.160054, -0.2053231, 1, 1, 1, 1, 1,
-0.9207717, -0.9685812, -1.899783, 1, 1, 1, 1, 1,
-0.9190989, 1.686926, -1.775643, 1, 1, 1, 1, 1,
-0.9186255, 0.5877776, -0.7446304, 1, 1, 1, 1, 1,
-0.9175292, -0.4766704, -3.27606, 1, 1, 1, 1, 1,
-0.9168429, -1.579288, -2.058679, 1, 1, 1, 1, 1,
-0.9145561, -0.1670604, -2.983526, 1, 1, 1, 1, 1,
-0.9139986, 0.004772681, -2.063934, 1, 1, 1, 1, 1,
-0.8999385, 0.1413671, -1.494378, 1, 1, 1, 1, 1,
-0.8997999, -0.4091738, -3.178666, 1, 1, 1, 1, 1,
-0.892509, -0.2223313, -1.898605, 1, 1, 1, 1, 1,
-0.8921124, -0.7900218, -1.776859, 1, 1, 1, 1, 1,
-0.891836, 1.409123, -1.843642, 1, 1, 1, 1, 1,
-0.8870015, -0.5196599, -2.656224, 1, 1, 1, 1, 1,
-0.8844609, 0.1998463, -2.331617, 0, 0, 1, 1, 1,
-0.8736057, 0.9652129, -2.236192, 1, 0, 0, 1, 1,
-0.8717865, 0.3985589, -0.4648509, 1, 0, 0, 1, 1,
-0.8706616, 2.826498, -0.7909958, 1, 0, 0, 1, 1,
-0.862034, -1.266101, -2.84322, 1, 0, 0, 1, 1,
-0.8615144, 1.293468, -1.442357, 1, 0, 0, 1, 1,
-0.857694, -0.3745349, -1.175024, 0, 0, 0, 1, 1,
-0.8560399, -1.699783, -2.423003, 0, 0, 0, 1, 1,
-0.8554, -0.3680084, -2.980162, 0, 0, 0, 1, 1,
-0.8495159, 2.097015, 0.2399174, 0, 0, 0, 1, 1,
-0.8487043, -0.01013484, -1.157974, 0, 0, 0, 1, 1,
-0.8389137, -1.531873, -3.279412, 0, 0, 0, 1, 1,
-0.8360822, 1.508029, 2.462072, 0, 0, 0, 1, 1,
-0.8296276, -1.166826, -1.036326, 1, 1, 1, 1, 1,
-0.8265873, -0.6863328, -3.422477, 1, 1, 1, 1, 1,
-0.8257618, 0.9294797, -2.263511, 1, 1, 1, 1, 1,
-0.8193874, -1.658701, -2.890133, 1, 1, 1, 1, 1,
-0.817494, -0.5791624, -1.431811, 1, 1, 1, 1, 1,
-0.8143798, -0.5091131, -2.416596, 1, 1, 1, 1, 1,
-0.8134275, -0.02322521, -0.9877535, 1, 1, 1, 1, 1,
-0.8070861, 0.3648677, 0.5602198, 1, 1, 1, 1, 1,
-0.7992533, -0.3980673, -1.657758, 1, 1, 1, 1, 1,
-0.7990072, 0.789728, 0.3955659, 1, 1, 1, 1, 1,
-0.7893131, -0.2257882, -1.841449, 1, 1, 1, 1, 1,
-0.782326, 1.1218, 0.7696317, 1, 1, 1, 1, 1,
-0.7749196, 0.1273317, -1.545624, 1, 1, 1, 1, 1,
-0.7747563, -0.3596581, -0.1232253, 1, 1, 1, 1, 1,
-0.7734873, 0.2417024, -3.797517, 1, 1, 1, 1, 1,
-0.7716047, -0.6975266, -1.448325, 0, 0, 1, 1, 1,
-0.769635, 0.2696818, -1.957346, 1, 0, 0, 1, 1,
-0.7673202, 0.2811931, -1.421255, 1, 0, 0, 1, 1,
-0.7654067, -0.6706437, -2.91352, 1, 0, 0, 1, 1,
-0.7627341, -0.3903082, -2.596826, 1, 0, 0, 1, 1,
-0.7600636, 0.370069, -0.7491804, 1, 0, 0, 1, 1,
-0.7589189, -0.8663724, -3.090228, 0, 0, 0, 1, 1,
-0.7461692, 0.6673585, 0.3352653, 0, 0, 0, 1, 1,
-0.7424319, 1.536504, 0.2135788, 0, 0, 0, 1, 1,
-0.7406386, -0.1198449, -1.603305, 0, 0, 0, 1, 1,
-0.7392535, -0.1434735, -1.043416, 0, 0, 0, 1, 1,
-0.7372518, 0.879572, -1.21946, 0, 0, 0, 1, 1,
-0.7347494, 0.5986394, 0.571973, 0, 0, 0, 1, 1,
-0.7327491, 0.8756055, -1.967634, 1, 1, 1, 1, 1,
-0.731055, -0.238317, -1.810599, 1, 1, 1, 1, 1,
-0.7249185, 0.03767666, -1.36541, 1, 1, 1, 1, 1,
-0.7248683, 0.4557692, -0.4264256, 1, 1, 1, 1, 1,
-0.7190731, -0.4900594, -1.798811, 1, 1, 1, 1, 1,
-0.7114297, 1.965827, -1.371967, 1, 1, 1, 1, 1,
-0.7094678, -0.5383898, -1.977613, 1, 1, 1, 1, 1,
-0.7080879, 0.4974871, -0.393771, 1, 1, 1, 1, 1,
-0.7076474, 0.01665376, -1.508781, 1, 1, 1, 1, 1,
-0.6910574, 1.704389, 0.509717, 1, 1, 1, 1, 1,
-0.6815467, 2.130753, -0.8233169, 1, 1, 1, 1, 1,
-0.6799293, 0.4564561, -1.645151, 1, 1, 1, 1, 1,
-0.6795905, -0.13539, -3.388324, 1, 1, 1, 1, 1,
-0.6772624, 0.5910192, -1.134312, 1, 1, 1, 1, 1,
-0.6687762, 0.7800506, 0.2483023, 1, 1, 1, 1, 1,
-0.6679242, -1.867222, -2.418603, 0, 0, 1, 1, 1,
-0.6671245, -0.2881759, -4.674807, 1, 0, 0, 1, 1,
-0.666316, 0.6527489, -0.7143674, 1, 0, 0, 1, 1,
-0.6576119, -0.6406062, -3.550111, 1, 0, 0, 1, 1,
-0.6558361, 0.3661931, -0.6467009, 1, 0, 0, 1, 1,
-0.6557462, 0.104113, -1.975919, 1, 0, 0, 1, 1,
-0.648607, 0.1851248, -1.673757, 0, 0, 0, 1, 1,
-0.6480157, -0.7484748, -1.747477, 0, 0, 0, 1, 1,
-0.6472503, 1.282539, -2.08501, 0, 0, 0, 1, 1,
-0.6408948, -0.7523223, -1.022392, 0, 0, 0, 1, 1,
-0.6360989, -0.6156203, -3.031982, 0, 0, 0, 1, 1,
-0.6318259, -0.7491229, -1.222969, 0, 0, 0, 1, 1,
-0.6283392, -0.4972468, -3.2203, 0, 0, 0, 1, 1,
-0.6278683, 0.2589877, -1.112933, 1, 1, 1, 1, 1,
-0.6269361, 0.9142406, 0.6596583, 1, 1, 1, 1, 1,
-0.6133611, -0.1151839, -1.614277, 1, 1, 1, 1, 1,
-0.6116458, -1.711187, -2.578145, 1, 1, 1, 1, 1,
-0.6111558, 0.2176403, -1.755251, 1, 1, 1, 1, 1,
-0.6101794, -2.303023, -2.739213, 1, 1, 1, 1, 1,
-0.6095747, 0.4734593, -2.040402, 1, 1, 1, 1, 1,
-0.6075573, -2.029353, -2.714573, 1, 1, 1, 1, 1,
-0.6020721, -0.5735353, -1.273679, 1, 1, 1, 1, 1,
-0.5980132, -0.7841614, -2.859034, 1, 1, 1, 1, 1,
-0.59216, 0.8404945, -1.262114, 1, 1, 1, 1, 1,
-0.5896167, 0.06138, -1.890163, 1, 1, 1, 1, 1,
-0.5876461, -1.623047, -2.357545, 1, 1, 1, 1, 1,
-0.5853959, -1.379178, -2.842854, 1, 1, 1, 1, 1,
-0.574308, 0.6359738, -0.3060054, 1, 1, 1, 1, 1,
-0.5679664, -0.1839249, -2.875617, 0, 0, 1, 1, 1,
-0.5674925, 0.1853708, -0.2136443, 1, 0, 0, 1, 1,
-0.5666429, -0.4523009, 0.3255009, 1, 0, 0, 1, 1,
-0.5648649, -0.7456427, -2.1516, 1, 0, 0, 1, 1,
-0.55928, -1.384186, -3.055818, 1, 0, 0, 1, 1,
-0.5583763, 1.472193, -1.218319, 1, 0, 0, 1, 1,
-0.5573817, -0.40022, -1.938781, 0, 0, 0, 1, 1,
-0.555607, -1.039483, -2.422016, 0, 0, 0, 1, 1,
-0.5534587, -0.3695183, -2.850151, 0, 0, 0, 1, 1,
-0.5510574, -0.2222169, -2.545873, 0, 0, 0, 1, 1,
-0.5491288, 1.024809, 0.588919, 0, 0, 0, 1, 1,
-0.5451516, 0.05236199, -1.867499, 0, 0, 0, 1, 1,
-0.5381233, 0.09510577, -1.46428, 0, 0, 0, 1, 1,
-0.5288664, 0.2357447, -2.034987, 1, 1, 1, 1, 1,
-0.5253766, -0.7896017, -2.060872, 1, 1, 1, 1, 1,
-0.5181911, 1.746026, -1.345147, 1, 1, 1, 1, 1,
-0.5145811, 0.05226171, -0.8888075, 1, 1, 1, 1, 1,
-0.5143067, -1.160971, -3.617927, 1, 1, 1, 1, 1,
-0.5140936, 0.4352661, -0.1091727, 1, 1, 1, 1, 1,
-0.5138521, 0.05479255, -2.105346, 1, 1, 1, 1, 1,
-0.5110534, -0.2785355, -2.176733, 1, 1, 1, 1, 1,
-0.5094287, -0.6907521, -2.136542, 1, 1, 1, 1, 1,
-0.5005066, -0.7413489, -1.639713, 1, 1, 1, 1, 1,
-0.4991189, -0.4124429, -3.18159, 1, 1, 1, 1, 1,
-0.4955658, -1.079103, -2.102316, 1, 1, 1, 1, 1,
-0.4939943, -1.439386, -1.626135, 1, 1, 1, 1, 1,
-0.4930414, 0.08533521, -1.259068, 1, 1, 1, 1, 1,
-0.4920928, -1.041229, -2.909807, 1, 1, 1, 1, 1,
-0.4916258, 1.601146, 0.004328139, 0, 0, 1, 1, 1,
-0.4867917, 0.4712015, 0.4048645, 1, 0, 0, 1, 1,
-0.4867676, -1.757329, -2.828769, 1, 0, 0, 1, 1,
-0.4867111, -0.2550541, -0.3277162, 1, 0, 0, 1, 1,
-0.4862935, -1.179341, -2.857664, 1, 0, 0, 1, 1,
-0.4790816, -0.2797737, -2.24481, 1, 0, 0, 1, 1,
-0.4771985, -1.124466, -4.144022, 0, 0, 0, 1, 1,
-0.4768901, -0.1845458, -1.598956, 0, 0, 0, 1, 1,
-0.4765489, 1.009036, 0.6893704, 0, 0, 0, 1, 1,
-0.4762053, -1.390724, -2.448813, 0, 0, 0, 1, 1,
-0.4716526, -0.2574638, -1.512098, 0, 0, 0, 1, 1,
-0.4616144, -0.0248707, -1.128847, 0, 0, 0, 1, 1,
-0.4590041, 0.1508378, -1.904157, 0, 0, 0, 1, 1,
-0.4522576, 0.5080227, 1.625996, 1, 1, 1, 1, 1,
-0.4510844, 0.04956365, 0.1861189, 1, 1, 1, 1, 1,
-0.4490576, -0.7173119, -1.591307, 1, 1, 1, 1, 1,
-0.4454302, 1.197921, -0.2085527, 1, 1, 1, 1, 1,
-0.4417653, -0.1159561, -3.657558, 1, 1, 1, 1, 1,
-0.4389737, -0.9961533, -1.396842, 1, 1, 1, 1, 1,
-0.4379016, 0.4483703, -0.557349, 1, 1, 1, 1, 1,
-0.4335057, -0.9099948, -2.057333, 1, 1, 1, 1, 1,
-0.4310368, 0.9177596, -1.448576, 1, 1, 1, 1, 1,
-0.4280066, 0.4033563, -0.02715392, 1, 1, 1, 1, 1,
-0.4248662, -1.258374, -2.209791, 1, 1, 1, 1, 1,
-0.4213348, 0.8576843, -0.07857589, 1, 1, 1, 1, 1,
-0.4197541, 1.023404, -1.031361, 1, 1, 1, 1, 1,
-0.4183405, -0.02437998, -1.462073, 1, 1, 1, 1, 1,
-0.4174895, -0.03817957, -1.659516, 1, 1, 1, 1, 1,
-0.4173019, 0.2751737, 2.95386, 0, 0, 1, 1, 1,
-0.4135444, -1.896034, -2.709901, 1, 0, 0, 1, 1,
-0.4115025, 0.7236412, -0.4360644, 1, 0, 0, 1, 1,
-0.4040263, -0.1577935, -3.101403, 1, 0, 0, 1, 1,
-0.4037875, -1.553875, -3.528956, 1, 0, 0, 1, 1,
-0.4021218, -1.099904, -3.520163, 1, 0, 0, 1, 1,
-0.3992739, 1.081603, 0.3446538, 0, 0, 0, 1, 1,
-0.3970176, -1.5492, -1.535928, 0, 0, 0, 1, 1,
-0.3950217, 0.6604086, -1.262599, 0, 0, 0, 1, 1,
-0.3913346, 1.578842, 0.9587065, 0, 0, 0, 1, 1,
-0.3912242, 1.043923, 0.5949529, 0, 0, 0, 1, 1,
-0.3897272, -0.2401151, -3.883173, 0, 0, 0, 1, 1,
-0.3851199, -0.9031048, -2.763924, 0, 0, 0, 1, 1,
-0.3834607, 0.5053851, -0.6020606, 1, 1, 1, 1, 1,
-0.3794506, 1.649622, -1.348964, 1, 1, 1, 1, 1,
-0.3764481, -0.4374302, -3.505555, 1, 1, 1, 1, 1,
-0.3725061, 0.4743232, -0.4014705, 1, 1, 1, 1, 1,
-0.3670979, -0.9388669, -0.4905375, 1, 1, 1, 1, 1,
-0.3618511, -0.3309082, -2.965149, 1, 1, 1, 1, 1,
-0.3610165, 0.02134044, 0.2061987, 1, 1, 1, 1, 1,
-0.3605461, -1.536113, -2.160015, 1, 1, 1, 1, 1,
-0.3602157, -1.068153, -3.856287, 1, 1, 1, 1, 1,
-0.3600045, 1.081461, -0.364886, 1, 1, 1, 1, 1,
-0.3590189, -1.212652, -3.06458, 1, 1, 1, 1, 1,
-0.3561755, 0.1127833, -1.871949, 1, 1, 1, 1, 1,
-0.355716, 0.1644986, -1.613283, 1, 1, 1, 1, 1,
-0.347664, 1.064368, -0.06678464, 1, 1, 1, 1, 1,
-0.3463664, 0.8887635, 1.118747, 1, 1, 1, 1, 1,
-0.3461892, -0.1431593, -1.801404, 0, 0, 1, 1, 1,
-0.3456532, -1.481506, -4.504421, 1, 0, 0, 1, 1,
-0.345214, 0.6763117, 0.02036077, 1, 0, 0, 1, 1,
-0.3414681, -1.216553, -4.280191, 1, 0, 0, 1, 1,
-0.3413834, 0.02786343, -2.105454, 1, 0, 0, 1, 1,
-0.3409886, -0.3359288, -0.3331701, 1, 0, 0, 1, 1,
-0.3394023, -0.6562266, -3.464532, 0, 0, 0, 1, 1,
-0.3367096, 0.3642111, -0.06064395, 0, 0, 0, 1, 1,
-0.3323766, -1.921695, -2.53427, 0, 0, 0, 1, 1,
-0.3320137, 0.6373241, -0.6169518, 0, 0, 0, 1, 1,
-0.3307096, -1.654256, -3.794762, 0, 0, 0, 1, 1,
-0.3289215, 1.254105, 0.3686589, 0, 0, 0, 1, 1,
-0.3287527, 1.044419, -0.0560895, 0, 0, 0, 1, 1,
-0.3256622, -1.396077, -2.719669, 1, 1, 1, 1, 1,
-0.3207889, 0.1368806, 0.1923826, 1, 1, 1, 1, 1,
-0.3202256, -0.6628411, -3.068933, 1, 1, 1, 1, 1,
-0.3191012, 0.008285135, -2.274035, 1, 1, 1, 1, 1,
-0.3179622, 0.3813969, -1.003104, 1, 1, 1, 1, 1,
-0.317877, -1.104214, -2.720871, 1, 1, 1, 1, 1,
-0.3135596, 0.390659, -1.292614, 1, 1, 1, 1, 1,
-0.3133387, -0.2813854, -2.755398, 1, 1, 1, 1, 1,
-0.3110181, 0.8572556, -1.657223, 1, 1, 1, 1, 1,
-0.3100242, -1.31953, -2.933752, 1, 1, 1, 1, 1,
-0.309467, 0.1289732, -1.552215, 1, 1, 1, 1, 1,
-0.3071787, 0.2317591, 0.06689996, 1, 1, 1, 1, 1,
-0.3066641, -0.03488512, -1.749845, 1, 1, 1, 1, 1,
-0.3050285, 0.1158477, -0.3827669, 1, 1, 1, 1, 1,
-0.3016787, 1.908848, 1.168608, 1, 1, 1, 1, 1,
-0.2988785, 0.2381454, -1.490409, 0, 0, 1, 1, 1,
-0.2947554, -0.3531262, -3.048169, 1, 0, 0, 1, 1,
-0.2859007, 0.2335012, -2.162727, 1, 0, 0, 1, 1,
-0.2828069, -1.059134, -2.856995, 1, 0, 0, 1, 1,
-0.2819801, 0.5697131, 1.616153, 1, 0, 0, 1, 1,
-0.2803551, -2.132488, -1.404678, 1, 0, 0, 1, 1,
-0.2795622, -1.080677, -2.857989, 0, 0, 0, 1, 1,
-0.2767115, -0.7683815, -2.330783, 0, 0, 0, 1, 1,
-0.2722541, -0.5171611, -1.958014, 0, 0, 0, 1, 1,
-0.2692007, 0.4984137, -1.872249, 0, 0, 0, 1, 1,
-0.2686996, -0.5158423, -2.113888, 0, 0, 0, 1, 1,
-0.2640804, 0.8932622, 0.9314344, 0, 0, 0, 1, 1,
-0.2629057, 0.8449631, 0.6780318, 0, 0, 0, 1, 1,
-0.262523, -1.506303, -3.422195, 1, 1, 1, 1, 1,
-0.2617983, 1.1991, -0.02218256, 1, 1, 1, 1, 1,
-0.2574076, -0.1465787, -1.992336, 1, 1, 1, 1, 1,
-0.2556109, -0.5236158, -1.815978, 1, 1, 1, 1, 1,
-0.2554222, 0.2552702, 0.9791697, 1, 1, 1, 1, 1,
-0.2498041, 0.315511, 0.009549255, 1, 1, 1, 1, 1,
-0.2496027, 0.7183843, -0.06330212, 1, 1, 1, 1, 1,
-0.243202, 1.315839, -1.093763, 1, 1, 1, 1, 1,
-0.2422992, 0.8181298, 0.6113685, 1, 1, 1, 1, 1,
-0.2399707, -1.637479, -2.544613, 1, 1, 1, 1, 1,
-0.2392474, -0.3978916, -4.233759, 1, 1, 1, 1, 1,
-0.2355586, 1.221777, -0.1355915, 1, 1, 1, 1, 1,
-0.2243934, 1.063628, -1.066599, 1, 1, 1, 1, 1,
-0.2219555, 1.375054, -1.560713, 1, 1, 1, 1, 1,
-0.2207209, -0.3486112, -1.846178, 1, 1, 1, 1, 1,
-0.2114896, -0.04975199, -2.311614, 0, 0, 1, 1, 1,
-0.2065367, 0.0740542, -1.487718, 1, 0, 0, 1, 1,
-0.2039194, -0.5601957, -2.094879, 1, 0, 0, 1, 1,
-0.2025304, -1.071025, -3.310725, 1, 0, 0, 1, 1,
-0.2024101, 1.15578, -0.09813158, 1, 0, 0, 1, 1,
-0.2000291, -0.3883198, -2.621878, 1, 0, 0, 1, 1,
-0.198417, -1.469707, -3.865576, 0, 0, 0, 1, 1,
-0.1972324, -0.2675566, -2.407637, 0, 0, 0, 1, 1,
-0.1909183, -0.3539161, -1.535857, 0, 0, 0, 1, 1,
-0.1895237, -1.515015, -3.151254, 0, 0, 0, 1, 1,
-0.1890806, -0.181287, -1.358422, 0, 0, 0, 1, 1,
-0.1875919, 0.4257976, -0.1801672, 0, 0, 0, 1, 1,
-0.1875115, 0.4637452, -0.7785885, 0, 0, 0, 1, 1,
-0.185633, 0.08549938, -0.9313996, 1, 1, 1, 1, 1,
-0.1835713, -0.2936099, -3.051578, 1, 1, 1, 1, 1,
-0.1823964, 1.057393, -0.3184509, 1, 1, 1, 1, 1,
-0.1799098, -0.6411873, -3.165045, 1, 1, 1, 1, 1,
-0.1775944, 0.8412526, -1.087275, 1, 1, 1, 1, 1,
-0.1743109, 0.1552777, -0.5031222, 1, 1, 1, 1, 1,
-0.1685335, 1.279441, -0.1081914, 1, 1, 1, 1, 1,
-0.1682466, -0.8364067, -2.654075, 1, 1, 1, 1, 1,
-0.1664465, 1.134558, 0.268449, 1, 1, 1, 1, 1,
-0.1660009, 0.1832544, -1.205762, 1, 1, 1, 1, 1,
-0.164212, -0.9703786, -2.468506, 1, 1, 1, 1, 1,
-0.1595844, -0.6831176, -2.103478, 1, 1, 1, 1, 1,
-0.1595153, 0.6039943, -1.627276, 1, 1, 1, 1, 1,
-0.1587009, -0.7032462, -1.585725, 1, 1, 1, 1, 1,
-0.15835, -0.2367121, -2.370452, 1, 1, 1, 1, 1,
-0.1552247, 0.1751225, -0.5155773, 0, 0, 1, 1, 1,
-0.1498261, -0.1441376, -1.779482, 1, 0, 0, 1, 1,
-0.1483542, 0.1837795, -0.5120896, 1, 0, 0, 1, 1,
-0.1471007, -0.07640629, -2.77888, 1, 0, 0, 1, 1,
-0.1453185, -0.224, -1.286183, 1, 0, 0, 1, 1,
-0.1422095, -0.01330418, -2.100573, 1, 0, 0, 1, 1,
-0.1407717, 0.5652074, 0.5014077, 0, 0, 0, 1, 1,
-0.1407189, 1.008037, -1.202599, 0, 0, 0, 1, 1,
-0.1405979, 0.888404, -1.461531, 0, 0, 0, 1, 1,
-0.1398501, -0.7391412, -3.038001, 0, 0, 0, 1, 1,
-0.1372121, -0.9654914, -3.337985, 0, 0, 0, 1, 1,
-0.1359859, -0.9875703, -3.159815, 0, 0, 0, 1, 1,
-0.1325275, -1.198556, -4.200591, 0, 0, 0, 1, 1,
-0.1322663, -0.2797492, -2.156803, 1, 1, 1, 1, 1,
-0.1253602, 0.09290965, -2.592873, 1, 1, 1, 1, 1,
-0.1224705, -0.1575311, -1.554258, 1, 1, 1, 1, 1,
-0.1208945, 0.6664516, 0.9180254, 1, 1, 1, 1, 1,
-0.1173935, 1.070161, -0.8442984, 1, 1, 1, 1, 1,
-0.1163988, -0.2062081, -1.677374, 1, 1, 1, 1, 1,
-0.1160942, -1.171928, -3.742755, 1, 1, 1, 1, 1,
-0.1158193, 0.00284123, -2.197539, 1, 1, 1, 1, 1,
-0.1157103, -1.763254, -4.100446, 1, 1, 1, 1, 1,
-0.1157042, 0.1963273, -1.938871, 1, 1, 1, 1, 1,
-0.1154252, 1.613232, -1.947983, 1, 1, 1, 1, 1,
-0.1050854, -0.8645921, -2.187217, 1, 1, 1, 1, 1,
-0.1021046, -0.7608289, -2.421463, 1, 1, 1, 1, 1,
-0.09230382, 0.2230796, 2.49886, 1, 1, 1, 1, 1,
-0.0922847, 0.5585446, -1.301551, 1, 1, 1, 1, 1,
-0.09053634, 0.6361489, 0.0979266, 0, 0, 1, 1, 1,
-0.08912215, -0.5029319, -1.964402, 1, 0, 0, 1, 1,
-0.08241057, -0.5668961, -1.952319, 1, 0, 0, 1, 1,
-0.07326229, 1.118431, 0.303519, 1, 0, 0, 1, 1,
-0.07245507, 0.6676894, -1.211437, 1, 0, 0, 1, 1,
-0.06912146, 0.6105909, 0.311969, 1, 0, 0, 1, 1,
-0.06645146, 1.213292, -0.3332892, 0, 0, 0, 1, 1,
-0.06446262, 0.1921774, -0.9800455, 0, 0, 0, 1, 1,
-0.06407186, -0.5173647, -2.664801, 0, 0, 0, 1, 1,
-0.06013297, -0.335483, -2.551876, 0, 0, 0, 1, 1,
-0.05973804, -0.2822816, -3.62138, 0, 0, 0, 1, 1,
-0.0475654, 0.09079038, -0.356278, 0, 0, 0, 1, 1,
-0.04066131, 0.2431306, -1.407142, 0, 0, 0, 1, 1,
-0.03959088, 0.9802326, -0.148043, 1, 1, 1, 1, 1,
-0.03536757, 1.675038, 1.831737, 1, 1, 1, 1, 1,
-0.02904573, 0.325895, 1.473306, 1, 1, 1, 1, 1,
-0.02899978, 0.4010923, 1.00985, 1, 1, 1, 1, 1,
-0.02769176, 2.014328, 1.85901, 1, 1, 1, 1, 1,
-0.02451712, -0.6793472, -3.305517, 1, 1, 1, 1, 1,
-0.02037266, 2.396455, 0.6074117, 1, 1, 1, 1, 1,
-0.01795005, 0.07884061, -1.921994, 1, 1, 1, 1, 1,
-0.0151826, 0.01056366, 0.2313331, 1, 1, 1, 1, 1,
-0.004020288, 0.1490154, -0.3114885, 1, 1, 1, 1, 1,
-0.003728237, -1.28297, -2.734093, 1, 1, 1, 1, 1,
-0.001565101, -1.476473, -1.834421, 1, 1, 1, 1, 1,
0.00311153, 0.6921569, 0.109529, 1, 1, 1, 1, 1,
0.005722754, -1.41531, 2.053829, 1, 1, 1, 1, 1,
0.006420789, -1.053905, 2.585009, 1, 1, 1, 1, 1,
0.008440911, -1.354463, 2.65474, 0, 0, 1, 1, 1,
0.01052924, -0.8302953, 4.695853, 1, 0, 0, 1, 1,
0.01407103, -0.4717622, 2.329394, 1, 0, 0, 1, 1,
0.01516896, 1.550393, -0.6758413, 1, 0, 0, 1, 1,
0.01695049, 0.8756547, 0.4997388, 1, 0, 0, 1, 1,
0.02193316, -0.3591172, 3.164864, 1, 0, 0, 1, 1,
0.02772832, 1.006506, -0.6519821, 0, 0, 0, 1, 1,
0.04199867, 1.604965, 0.01887, 0, 0, 0, 1, 1,
0.04433077, -0.2503477, 2.994154, 0, 0, 0, 1, 1,
0.04781051, -0.1564041, 3.32981, 0, 0, 0, 1, 1,
0.04913284, 0.2119769, 1.834585, 0, 0, 0, 1, 1,
0.05082405, 0.6249123, 2.296832, 0, 0, 0, 1, 1,
0.05333359, 1.578457, 0.702436, 0, 0, 0, 1, 1,
0.05391946, 0.9617748, 1.51695, 1, 1, 1, 1, 1,
0.0549744, 0.4359489, 0.7051838, 1, 1, 1, 1, 1,
0.05505228, -1.212682, 3.00397, 1, 1, 1, 1, 1,
0.05592415, 0.09675649, -0.4478878, 1, 1, 1, 1, 1,
0.05767678, -0.05157292, 2.96335, 1, 1, 1, 1, 1,
0.05995521, -0.971269, 2.929895, 1, 1, 1, 1, 1,
0.06077807, 0.165278, 3.300851, 1, 1, 1, 1, 1,
0.06117513, -1.081355, 2.765806, 1, 1, 1, 1, 1,
0.06516866, -0.8415601, 3.166408, 1, 1, 1, 1, 1,
0.06614523, -0.1742308, 2.420149, 1, 1, 1, 1, 1,
0.07047404, -1.602322, 1.815621, 1, 1, 1, 1, 1,
0.07128447, 0.2777477, 0.5852228, 1, 1, 1, 1, 1,
0.07219422, 0.5359035, 0.1128924, 1, 1, 1, 1, 1,
0.0739304, 1.146943, 1.681723, 1, 1, 1, 1, 1,
0.07680734, -0.5132697, 2.45302, 1, 1, 1, 1, 1,
0.07750072, -1.069939, 1.562251, 0, 0, 1, 1, 1,
0.07781782, -0.5734665, 2.624806, 1, 0, 0, 1, 1,
0.07957963, 1.164169, 0.9726301, 1, 0, 0, 1, 1,
0.07972396, 0.7685266, 0.5320995, 1, 0, 0, 1, 1,
0.0805116, 0.5427689, -1.302065, 1, 0, 0, 1, 1,
0.08214178, 1.480631, 1.054021, 1, 0, 0, 1, 1,
0.08512207, 0.09984099, -0.3461866, 0, 0, 0, 1, 1,
0.08538391, 0.9346421, -0.4302574, 0, 0, 0, 1, 1,
0.08573178, -0.9719302, 2.681029, 0, 0, 0, 1, 1,
0.08599292, -0.3342495, 3.329217, 0, 0, 0, 1, 1,
0.08649343, -0.1548926, 2.855937, 0, 0, 0, 1, 1,
0.08686297, 0.3321247, 0.1542855, 0, 0, 0, 1, 1,
0.09697872, 0.08827624, 1.885569, 0, 0, 0, 1, 1,
0.09711774, -0.2055493, 2.47779, 1, 1, 1, 1, 1,
0.09767061, -0.208553, 2.379077, 1, 1, 1, 1, 1,
0.1047603, -0.4158002, 3.016224, 1, 1, 1, 1, 1,
0.1064324, 0.5199185, -0.5268607, 1, 1, 1, 1, 1,
0.1089702, 1.967346, -0.5867726, 1, 1, 1, 1, 1,
0.1118966, 0.7502664, -0.3173563, 1, 1, 1, 1, 1,
0.1136571, 0.5406876, -0.3827837, 1, 1, 1, 1, 1,
0.1229596, 0.2846355, 0.9216143, 1, 1, 1, 1, 1,
0.1245913, -0.5311518, 1.784856, 1, 1, 1, 1, 1,
0.1267699, 0.113694, 1.488102, 1, 1, 1, 1, 1,
0.1274753, -0.2018991, 2.178543, 1, 1, 1, 1, 1,
0.1287819, -0.7866884, 2.118531, 1, 1, 1, 1, 1,
0.1372499, 0.8948807, 1.496596, 1, 1, 1, 1, 1,
0.1417405, -0.1097062, 0.7970942, 1, 1, 1, 1, 1,
0.1443196, -1.475772, 3.174861, 1, 1, 1, 1, 1,
0.1461739, 0.9969009, 0.7150234, 0, 0, 1, 1, 1,
0.1470092, 0.696304, 0.9078526, 1, 0, 0, 1, 1,
0.1474806, -2.134978, 4.61859, 1, 0, 0, 1, 1,
0.1479132, -1.457312, 1.424126, 1, 0, 0, 1, 1,
0.1497757, -1.174357, 3.13817, 1, 0, 0, 1, 1,
0.153212, 0.7466853, -0.355702, 1, 0, 0, 1, 1,
0.1539058, 1.687725, 0.1372186, 0, 0, 0, 1, 1,
0.1591366, -0.8249083, 3.288061, 0, 0, 0, 1, 1,
0.1634569, 1.024214, 0.8555034, 0, 0, 0, 1, 1,
0.1664512, -0.4117081, 3.983989, 0, 0, 0, 1, 1,
0.1671302, 0.6172721, 1.127129, 0, 0, 0, 1, 1,
0.1678757, 0.9103809, 0.4985852, 0, 0, 0, 1, 1,
0.1734391, -0.6770867, 2.272704, 0, 0, 0, 1, 1,
0.1749868, 0.4926302, 0.007039828, 1, 1, 1, 1, 1,
0.180887, 2.103371, 0.4601899, 1, 1, 1, 1, 1,
0.1812628, -0.01221653, 2.227965, 1, 1, 1, 1, 1,
0.182106, -0.4453281, 2.679105, 1, 1, 1, 1, 1,
0.1849497, -1.127658, 4.058854, 1, 1, 1, 1, 1,
0.1875387, 0.6938609, 0.07057481, 1, 1, 1, 1, 1,
0.1937009, 0.02324729, 1.198652, 1, 1, 1, 1, 1,
0.1959352, -0.2310212, 3.718905, 1, 1, 1, 1, 1,
0.1975643, 0.4848933, -0.9024567, 1, 1, 1, 1, 1,
0.1990587, 0.2404939, -0.3307877, 1, 1, 1, 1, 1,
0.2007802, -2.188061, 4.732789, 1, 1, 1, 1, 1,
0.203502, -0.4253058, 2.579769, 1, 1, 1, 1, 1,
0.2049057, -0.6973794, 1.439399, 1, 1, 1, 1, 1,
0.2122411, -1.48404, 3.251738, 1, 1, 1, 1, 1,
0.2165637, -0.4430562, 3.228268, 1, 1, 1, 1, 1,
0.2274079, 0.1313474, 2.087896, 0, 0, 1, 1, 1,
0.228261, -0.1947457, 3.591476, 1, 0, 0, 1, 1,
0.228469, -1.786358, 2.003149, 1, 0, 0, 1, 1,
0.232209, 0.7249311, -0.2541902, 1, 0, 0, 1, 1,
0.235124, -0.9583325, 2.974426, 1, 0, 0, 1, 1,
0.2360229, 0.05079961, 0.9571882, 1, 0, 0, 1, 1,
0.2370767, 0.6262143, 2.555542, 0, 0, 0, 1, 1,
0.2392002, 0.5722721, -0.04224379, 0, 0, 0, 1, 1,
0.2392883, 0.1841877, -0.6771606, 0, 0, 0, 1, 1,
0.2395254, -0.1207099, 2.850725, 0, 0, 0, 1, 1,
0.2399416, -0.501696, 2.397978, 0, 0, 0, 1, 1,
0.2487408, 1.474344, 0.8887672, 0, 0, 0, 1, 1,
0.2491331, -1.328784, 2.998697, 0, 0, 0, 1, 1,
0.2521965, -0.1555829, 2.4184, 1, 1, 1, 1, 1,
0.2522815, 1.264471, -1.54447, 1, 1, 1, 1, 1,
0.253688, 0.5726014, 1.073576, 1, 1, 1, 1, 1,
0.2567932, -0.9669667, 0.7847022, 1, 1, 1, 1, 1,
0.2619945, 0.2901641, 0.8385208, 1, 1, 1, 1, 1,
0.2628703, 0.5924687, 0.5754844, 1, 1, 1, 1, 1,
0.2630053, 0.2114638, 0.3893592, 1, 1, 1, 1, 1,
0.265558, 0.194641, -0.9108924, 1, 1, 1, 1, 1,
0.2675051, -1.449833, 4.215308, 1, 1, 1, 1, 1,
0.2683559, 0.413487, 0.2412672, 1, 1, 1, 1, 1,
0.2707694, -0.6296074, 3.746701, 1, 1, 1, 1, 1,
0.2707786, -0.04866086, 1.272505, 1, 1, 1, 1, 1,
0.271479, 0.4177242, 0.9028371, 1, 1, 1, 1, 1,
0.2715036, -0.2850786, 2.491858, 1, 1, 1, 1, 1,
0.272399, -0.400275, 2.873138, 1, 1, 1, 1, 1,
0.2747075, 0.7842656, 0.6288456, 0, 0, 1, 1, 1,
0.2775431, -0.1965116, 3.362244, 1, 0, 0, 1, 1,
0.2832077, -1.048266, 2.466324, 1, 0, 0, 1, 1,
0.2920028, -0.1624314, 2.390468, 1, 0, 0, 1, 1,
0.2925511, 0.1363171, 1.747056, 1, 0, 0, 1, 1,
0.2958024, 2.081789, -0.6260615, 1, 0, 0, 1, 1,
0.3022925, 1.326574, -0.6657792, 0, 0, 0, 1, 1,
0.3061842, -0.9811191, 1.949084, 0, 0, 0, 1, 1,
0.3099634, -0.1856978, 1.133582, 0, 0, 0, 1, 1,
0.3175469, 0.4442882, 1.267319, 0, 0, 0, 1, 1,
0.3200999, -0.2585948, 2.477675, 0, 0, 0, 1, 1,
0.3201877, -0.3754744, 2.646405, 0, 0, 0, 1, 1,
0.3232428, 1.426274, 0.8407152, 0, 0, 0, 1, 1,
0.3245856, -0.4493457, 2.403932, 1, 1, 1, 1, 1,
0.338911, 0.5560978, 2.036636, 1, 1, 1, 1, 1,
0.339167, -0.2439955, 2.000922, 1, 1, 1, 1, 1,
0.3456076, -1.225602, 3.372934, 1, 1, 1, 1, 1,
0.3525115, -1.732553, 4.238207, 1, 1, 1, 1, 1,
0.3526147, 0.1750263, 1.329341, 1, 1, 1, 1, 1,
0.3554423, -2.243994, 2.36105, 1, 1, 1, 1, 1,
0.3558838, 1.840898, 1.669023, 1, 1, 1, 1, 1,
0.3559565, -0.2529597, 3.64283, 1, 1, 1, 1, 1,
0.3619724, 1.620134, -2.63494, 1, 1, 1, 1, 1,
0.3630112, -0.04917952, 0.9429687, 1, 1, 1, 1, 1,
0.3653561, -1.745596, 1.915427, 1, 1, 1, 1, 1,
0.3660555, 0.2006176, 1.438876, 1, 1, 1, 1, 1,
0.3661978, -1.647362, 1.513845, 1, 1, 1, 1, 1,
0.3666853, -0.8067337, 2.457989, 1, 1, 1, 1, 1,
0.3711793, 0.06082871, 0.6542839, 0, 0, 1, 1, 1,
0.3780791, 0.9857802, 0.3665064, 1, 0, 0, 1, 1,
0.3793714, -0.3913621, 2.055588, 1, 0, 0, 1, 1,
0.3813459, 0.8371602, 0.3009375, 1, 0, 0, 1, 1,
0.3829999, 0.2677962, 1.611183, 1, 0, 0, 1, 1,
0.3859855, 0.05593207, 1.145426, 1, 0, 0, 1, 1,
0.3861479, 0.6195508, 1.669509, 0, 0, 0, 1, 1,
0.3872319, -2.60549, 3.881307, 0, 0, 0, 1, 1,
0.388543, 0.7909661, 0.009182886, 0, 0, 0, 1, 1,
0.3886021, -0.8606934, 1.134913, 0, 0, 0, 1, 1,
0.3897912, 0.7366059, 2.017392, 0, 0, 0, 1, 1,
0.3944133, 1.026122, 0.4545047, 0, 0, 0, 1, 1,
0.3983492, 0.03608127, -0.6873075, 0, 0, 0, 1, 1,
0.4005485, -0.05543789, 3.100222, 1, 1, 1, 1, 1,
0.4020427, 0.2576172, 3.013891, 1, 1, 1, 1, 1,
0.4032772, 0.08559882, 0.4974334, 1, 1, 1, 1, 1,
0.4048265, -0.8195176, 3.263343, 1, 1, 1, 1, 1,
0.4050798, 0.2831362, 2.085392, 1, 1, 1, 1, 1,
0.4083774, -0.4988357, 0.2475291, 1, 1, 1, 1, 1,
0.4102335, 1.059508, 1.301881, 1, 1, 1, 1, 1,
0.4205014, 1.083145, 1.600813, 1, 1, 1, 1, 1,
0.4220769, -1.285097, 3.211382, 1, 1, 1, 1, 1,
0.4247231, -0.9213058, 2.658252, 1, 1, 1, 1, 1,
0.4271416, -0.5808088, 3.235333, 1, 1, 1, 1, 1,
0.4333677, 0.1256809, 0.08418305, 1, 1, 1, 1, 1,
0.4380021, 1.531312, 1.18337, 1, 1, 1, 1, 1,
0.4408558, 1.927435, 0.7931556, 1, 1, 1, 1, 1,
0.4412944, -1.492413, 3.066099, 1, 1, 1, 1, 1,
0.4412982, 1.009396, -0.2078736, 0, 0, 1, 1, 1,
0.4594416, 0.01853073, 0.6988152, 1, 0, 0, 1, 1,
0.4628557, 0.482898, 1.323354, 1, 0, 0, 1, 1,
0.4649294, -0.09158029, 2.943046, 1, 0, 0, 1, 1,
0.4658375, -1.578926, 2.642459, 1, 0, 0, 1, 1,
0.4688104, 0.3864723, 1.082589, 1, 0, 0, 1, 1,
0.4702634, 1.655992, 0.6410832, 0, 0, 0, 1, 1,
0.4731408, -0.2105265, 1.137932, 0, 0, 0, 1, 1,
0.473451, -0.4736915, 1.852741, 0, 0, 0, 1, 1,
0.477452, 0.4415087, 1.01558, 0, 0, 0, 1, 1,
0.4808723, -0.1943789, 0.9823666, 0, 0, 0, 1, 1,
0.4879299, 1.295969, 0.4773603, 0, 0, 0, 1, 1,
0.4879843, -1.210792, 4.237565, 0, 0, 0, 1, 1,
0.4944628, -0.5453099, 2.622726, 1, 1, 1, 1, 1,
0.4975331, 0.4736584, 0.2022825, 1, 1, 1, 1, 1,
0.4984279, -0.02396428, 2.238611, 1, 1, 1, 1, 1,
0.5013031, 0.1881507, -0.3318519, 1, 1, 1, 1, 1,
0.5018253, 1.123824, -1.803198, 1, 1, 1, 1, 1,
0.5029408, -0.2524041, 3.601311, 1, 1, 1, 1, 1,
0.503698, -1.59677, 1.926627, 1, 1, 1, 1, 1,
0.5119821, -0.9086134, 3.265513, 1, 1, 1, 1, 1,
0.5132511, -0.02427488, 2.201363, 1, 1, 1, 1, 1,
0.5135642, 0.6753425, 1.517866, 1, 1, 1, 1, 1,
0.5165168, -0.6188264, 2.226484, 1, 1, 1, 1, 1,
0.5173717, 0.616963, 0.822342, 1, 1, 1, 1, 1,
0.5240288, -1.823217, 2.729702, 1, 1, 1, 1, 1,
0.526188, -0.4917357, 1.816534, 1, 1, 1, 1, 1,
0.5270025, -0.5161651, 4.210995, 1, 1, 1, 1, 1,
0.5292498, 1.153879, 1.432398, 0, 0, 1, 1, 1,
0.5314782, -1.142267, 2.422366, 1, 0, 0, 1, 1,
0.5339369, -0.09060266, 1.528518, 1, 0, 0, 1, 1,
0.5373784, -0.06448153, 1.311319, 1, 0, 0, 1, 1,
0.542544, 0.9902194, -1.233239, 1, 0, 0, 1, 1,
0.5425589, 1.446129, 1.164123, 1, 0, 0, 1, 1,
0.5442781, -0.3379517, 1.627308, 0, 0, 0, 1, 1,
0.5444754, 0.6007164, 1.699381, 0, 0, 0, 1, 1,
0.5547071, -1.269476, 1.336126, 0, 0, 0, 1, 1,
0.5575414, 0.2786297, 0.5080769, 0, 0, 0, 1, 1,
0.5615092, -0.8476335, 3.44085, 0, 0, 0, 1, 1,
0.5636935, -0.5343945, 2.738008, 0, 0, 0, 1, 1,
0.5651262, 0.3763164, 1.36159, 0, 0, 0, 1, 1,
0.5716244, -1.937496, 2.055604, 1, 1, 1, 1, 1,
0.5741552, -0.4065104, 1.598749, 1, 1, 1, 1, 1,
0.5794984, -0.4955563, 2.978246, 1, 1, 1, 1, 1,
0.579779, -1.115864, 3.774792, 1, 1, 1, 1, 1,
0.5937514, 1.235619, 1.30066, 1, 1, 1, 1, 1,
0.5976509, 0.9924994, -0.5542567, 1, 1, 1, 1, 1,
0.6011084, 0.1995917, 2.069819, 1, 1, 1, 1, 1,
0.6036476, -0.5267763, 2.476681, 1, 1, 1, 1, 1,
0.6038058, -2.108886, 2.559636, 1, 1, 1, 1, 1,
0.6076839, -0.1495812, 3.083024, 1, 1, 1, 1, 1,
0.6078145, 1.150767, 0.9513699, 1, 1, 1, 1, 1,
0.6103456, -1.383925, 1.944662, 1, 1, 1, 1, 1,
0.6106196, -0.77991, 2.195964, 1, 1, 1, 1, 1,
0.6113142, -0.7532486, 0.7858028, 1, 1, 1, 1, 1,
0.6124976, 0.8281743, 0.5102696, 1, 1, 1, 1, 1,
0.6131489, 1.285664, 0.1365756, 0, 0, 1, 1, 1,
0.6136473, 0.7845433, -0.8887219, 1, 0, 0, 1, 1,
0.6138309, 0.1756179, 1.174878, 1, 0, 0, 1, 1,
0.6202715, 0.4200428, 1.42664, 1, 0, 0, 1, 1,
0.6219847, -0.06599614, 3.067877, 1, 0, 0, 1, 1,
0.630205, -1.198982, 2.286853, 1, 0, 0, 1, 1,
0.6429649, -0.4319791, 0.01823839, 0, 0, 0, 1, 1,
0.6485863, 0.5020984, 0.7502414, 0, 0, 0, 1, 1,
0.6486921, 0.7673739, 2.31062, 0, 0, 0, 1, 1,
0.6492845, -1.532381, 4.921712, 0, 0, 0, 1, 1,
0.6545566, 1.744303, 0.5667679, 0, 0, 0, 1, 1,
0.658153, 1.143007, 0.8460822, 0, 0, 0, 1, 1,
0.6582651, -1.327233, 3.272482, 0, 0, 0, 1, 1,
0.6612237, -0.9273492, 0.4209816, 1, 1, 1, 1, 1,
0.6632192, -0.1176659, 0.9841449, 1, 1, 1, 1, 1,
0.6635377, 0.4305456, 0.8172202, 1, 1, 1, 1, 1,
0.6662878, 2.782667, -0.1567677, 1, 1, 1, 1, 1,
0.6677909, -0.1144157, 2.712283, 1, 1, 1, 1, 1,
0.6679664, -0.6593316, 1.522729, 1, 1, 1, 1, 1,
0.6831532, -0.8265184, 1.6013, 1, 1, 1, 1, 1,
0.6895083, 1.360324, -1.671029, 1, 1, 1, 1, 1,
0.6912504, 1.602445, -0.09702709, 1, 1, 1, 1, 1,
0.6926408, -0.3684153, 1.42908, 1, 1, 1, 1, 1,
0.6967349, -0.1970477, 1.086378, 1, 1, 1, 1, 1,
0.6995424, -1.54364, 2.244551, 1, 1, 1, 1, 1,
0.7106575, 1.412735, 1.396812, 1, 1, 1, 1, 1,
0.7159137, -2.523987, 3.33341, 1, 1, 1, 1, 1,
0.7263855, 0.5237172, 0.9905684, 1, 1, 1, 1, 1,
0.7280225, 0.1540056, 1.128697, 0, 0, 1, 1, 1,
0.7284626, -0.6427084, 2.387722, 1, 0, 0, 1, 1,
0.7313821, -0.0119588, 1.793666, 1, 0, 0, 1, 1,
0.7321414, -0.5482529, 0.8267581, 1, 0, 0, 1, 1,
0.732415, 1.567935, 0.6707613, 1, 0, 0, 1, 1,
0.7327036, 2.292953, 1.201791, 1, 0, 0, 1, 1,
0.7337884, -1.827194, 2.63807, 0, 0, 0, 1, 1,
0.7341977, -0.5601933, 3.831207, 0, 0, 0, 1, 1,
0.7359869, 1.007278, 1.005656, 0, 0, 0, 1, 1,
0.7365592, 0.002425321, 0.9774835, 0, 0, 0, 1, 1,
0.7386521, 0.1670264, 1.617159, 0, 0, 0, 1, 1,
0.7471251, 0.149741, -0.3935891, 0, 0, 0, 1, 1,
0.7540567, 1.727169, -0.5494657, 0, 0, 0, 1, 1,
0.7609065, 0.2520074, 0.6407685, 1, 1, 1, 1, 1,
0.7686556, 0.5155894, 0.8513167, 1, 1, 1, 1, 1,
0.7709184, -0.03820929, 2.859846, 1, 1, 1, 1, 1,
0.7726893, 1.912884, -0.4850118, 1, 1, 1, 1, 1,
0.7739223, 0.8726727, 1.842261, 1, 1, 1, 1, 1,
0.7741194, 1.675072, 0.1877088, 1, 1, 1, 1, 1,
0.7796379, -0.2781584, 1.351237, 1, 1, 1, 1, 1,
0.7872122, -1.059693, 1.54071, 1, 1, 1, 1, 1,
0.7875344, -0.09524203, -0.4627396, 1, 1, 1, 1, 1,
0.8057946, 1.695321, 0.3244709, 1, 1, 1, 1, 1,
0.8061658, 0.6612998, 1.731123, 1, 1, 1, 1, 1,
0.8094957, -0.3578799, 0.6462491, 1, 1, 1, 1, 1,
0.8122954, -0.4734853, 1.930507, 1, 1, 1, 1, 1,
0.8131119, 0.007282556, 2.941179, 1, 1, 1, 1, 1,
0.8174587, 1.600875, -0.1204789, 1, 1, 1, 1, 1,
0.8189133, -0.003704835, 2.074269, 0, 0, 1, 1, 1,
0.823018, 0.2306382, 2.197439, 1, 0, 0, 1, 1,
0.8272701, 0.1277376, 0.05152257, 1, 0, 0, 1, 1,
0.8293599, -1.738574, 3.102422, 1, 0, 0, 1, 1,
0.8377197, -2.295549, 3.411022, 1, 0, 0, 1, 1,
0.8476807, -1.772952, 4.228407, 1, 0, 0, 1, 1,
0.8521401, -0.3736496, 0.3717231, 0, 0, 0, 1, 1,
0.8533571, 0.4354708, 1.400311, 0, 0, 0, 1, 1,
0.8568398, 1.703904, 1.668966, 0, 0, 0, 1, 1,
0.8640327, 1.085819, 0.2772721, 0, 0, 0, 1, 1,
0.8757238, 0.6536646, -0.5254682, 0, 0, 0, 1, 1,
0.8758636, 1.713552, -0.04104119, 0, 0, 0, 1, 1,
0.8762109, -1.123696, 1.514593, 0, 0, 0, 1, 1,
0.8845556, 0.5935981, -0.2424593, 1, 1, 1, 1, 1,
0.8848707, -0.9813782, 1.58375, 1, 1, 1, 1, 1,
0.8851696, 1.069876, 2.387829, 1, 1, 1, 1, 1,
0.8851945, -0.5381404, 1.558379, 1, 1, 1, 1, 1,
0.8862518, -0.2789186, 1.924861, 1, 1, 1, 1, 1,
0.8874272, 0.8743857, 1.240886, 1, 1, 1, 1, 1,
0.8923507, 1.100801, -0.02917874, 1, 1, 1, 1, 1,
0.8955102, 1.185457, 0.1588949, 1, 1, 1, 1, 1,
0.9056461, -0.1097727, 1.533327, 1, 1, 1, 1, 1,
0.9107699, -0.2418796, 1.282396, 1, 1, 1, 1, 1,
0.9111892, -1.591402, 2.159834, 1, 1, 1, 1, 1,
0.9116697, -0.7135801, 1.54542, 1, 1, 1, 1, 1,
0.9121634, 1.299083, -1.589653, 1, 1, 1, 1, 1,
0.9124691, -0.09503574, 2.765864, 1, 1, 1, 1, 1,
0.9127387, -0.2199203, 3.597243, 1, 1, 1, 1, 1,
0.9200671, 2.054011, 0.09702427, 0, 0, 1, 1, 1,
0.9247465, -0.9649864, 2.10076, 1, 0, 0, 1, 1,
0.9365339, -0.8955095, 2.553361, 1, 0, 0, 1, 1,
0.9369753, 1.126914, 2.143229, 1, 0, 0, 1, 1,
0.9422308, 0.4560155, 2.120237, 1, 0, 0, 1, 1,
0.9438033, 0.1352482, 2.469329, 1, 0, 0, 1, 1,
0.9541683, 0.3410174, -0.264626, 0, 0, 0, 1, 1,
0.9545829, 1.050189, 1.451509, 0, 0, 0, 1, 1,
0.9594383, 1.471915, 0.2284926, 0, 0, 0, 1, 1,
0.9624578, -0.7120807, 2.630353, 0, 0, 0, 1, 1,
0.9701442, -0.3455237, 3.271713, 0, 0, 0, 1, 1,
0.9738516, -1.544824, 1.158614, 0, 0, 0, 1, 1,
0.9775776, -0.6844777, 3.929257, 0, 0, 0, 1, 1,
0.9819781, 0.5691616, 1.613166, 1, 1, 1, 1, 1,
0.984135, -0.2095001, 0.7919126, 1, 1, 1, 1, 1,
0.9912903, -1.468673, 2.15987, 1, 1, 1, 1, 1,
0.992851, 0.8395928, -1.484906, 1, 1, 1, 1, 1,
0.9943616, 1.625496, 0.9987835, 1, 1, 1, 1, 1,
0.9950874, -0.7689645, 1.897666, 1, 1, 1, 1, 1,
1.001645, -0.7511242, 2.950202, 1, 1, 1, 1, 1,
1.001963, -0.9571068, -0.489111, 1, 1, 1, 1, 1,
1.002149, 0.6839893, 1.870837, 1, 1, 1, 1, 1,
1.003785, -0.8094283, 2.26338, 1, 1, 1, 1, 1,
1.01094, 0.9111351, 1.303414, 1, 1, 1, 1, 1,
1.011079, -0.1957206, 2.785105, 1, 1, 1, 1, 1,
1.018354, -0.5332878, 1.82487, 1, 1, 1, 1, 1,
1.018828, -0.5653409, 2.917187, 1, 1, 1, 1, 1,
1.023724, 0.2851452, 0.9472804, 1, 1, 1, 1, 1,
1.025976, 0.01369487, -0.1030691, 0, 0, 1, 1, 1,
1.030234, -0.1188759, 1.576009, 1, 0, 0, 1, 1,
1.034689, 0.3800845, 1.122339, 1, 0, 0, 1, 1,
1.040526, -0.1888879, 1.560746, 1, 0, 0, 1, 1,
1.046587, -0.4008378, 3.341848, 1, 0, 0, 1, 1,
1.046997, -0.1058372, 0.6904017, 1, 0, 0, 1, 1,
1.052066, -1.230141, 3.909838, 0, 0, 0, 1, 1,
1.053274, 0.3242127, 0.1592462, 0, 0, 0, 1, 1,
1.053611, -0.8195973, 3.667568, 0, 0, 0, 1, 1,
1.061726, 0.9785889, 0.7972353, 0, 0, 0, 1, 1,
1.066093, -0.06938645, 2.247637, 0, 0, 0, 1, 1,
1.067135, 0.1155221, 2.472956, 0, 0, 0, 1, 1,
1.080645, -0.1902303, 0.3389112, 0, 0, 0, 1, 1,
1.081776, -0.3969305, 0.03279955, 1, 1, 1, 1, 1,
1.087487, 1.430262, -0.0771677, 1, 1, 1, 1, 1,
1.089731, 0.2625817, 1.511882, 1, 1, 1, 1, 1,
1.090925, -1.514393, 2.867014, 1, 1, 1, 1, 1,
1.094777, -0.4718125, 3.141259, 1, 1, 1, 1, 1,
1.099481, -0.9276591, 3.434044, 1, 1, 1, 1, 1,
1.104619, -0.4579165, 1.282732, 1, 1, 1, 1, 1,
1.115305, 0.848563, 1.782681, 1, 1, 1, 1, 1,
1.116472, 0.04978058, 0.2815637, 1, 1, 1, 1, 1,
1.118903, -0.06527807, 0.05572664, 1, 1, 1, 1, 1,
1.121367, 0.9392786, 2.020833, 1, 1, 1, 1, 1,
1.128673, -0.2366418, 1.656675, 1, 1, 1, 1, 1,
1.132535, -1.386294, 1.167385, 1, 1, 1, 1, 1,
1.133124, 0.90759, 1.127193, 1, 1, 1, 1, 1,
1.136018, 2.143604, -0.5180741, 1, 1, 1, 1, 1,
1.142273, -0.9557666, 2.262119, 0, 0, 1, 1, 1,
1.143284, -0.9165003, 2.255786, 1, 0, 0, 1, 1,
1.152755, 0.07287326, 1.898355, 1, 0, 0, 1, 1,
1.158377, -0.6605912, 1.887911, 1, 0, 0, 1, 1,
1.159058, 0.5170467, 2.271005, 1, 0, 0, 1, 1,
1.163682, -0.4485323, 3.849965, 1, 0, 0, 1, 1,
1.177299, -2.878385, 3.545209, 0, 0, 0, 1, 1,
1.18324, -2.466639, 1.737228, 0, 0, 0, 1, 1,
1.184081, -1.494416, 2.450623, 0, 0, 0, 1, 1,
1.187039, -0.3218927, 2.119518, 0, 0, 0, 1, 1,
1.201591, 0.5508887, 1.499919, 0, 0, 0, 1, 1,
1.203686, -0.3520777, 1.601204, 0, 0, 0, 1, 1,
1.211386, -1.419176, 1.791828, 0, 0, 0, 1, 1,
1.212472, 0.4616227, -0.2999849, 1, 1, 1, 1, 1,
1.217008, 0.2982597, 2.65491, 1, 1, 1, 1, 1,
1.220987, 0.2789772, 2.457825, 1, 1, 1, 1, 1,
1.226655, 0.5587679, 2.727509, 1, 1, 1, 1, 1,
1.226727, -0.7275821, 2.336694, 1, 1, 1, 1, 1,
1.235928, 0.7766892, 0.8587079, 1, 1, 1, 1, 1,
1.236444, -1.137993, 1.203597, 1, 1, 1, 1, 1,
1.246735, 0.1818396, 1.121934, 1, 1, 1, 1, 1,
1.246848, -2.798999, 2.757226, 1, 1, 1, 1, 1,
1.24994, -0.8837642, 0.9708794, 1, 1, 1, 1, 1,
1.25334, 0.8912517, 0.491629, 1, 1, 1, 1, 1,
1.256035, 0.1544827, 1.040264, 1, 1, 1, 1, 1,
1.25838, -0.681465, 2.726867, 1, 1, 1, 1, 1,
1.261505, 1.04941, 0.8061725, 1, 1, 1, 1, 1,
1.264723, -1.51856, 1.793044, 1, 1, 1, 1, 1,
1.269074, 0.7662625, 1.991091, 0, 0, 1, 1, 1,
1.269507, -0.6922827, 1.460631, 1, 0, 0, 1, 1,
1.271514, -1.247961, 2.196477, 1, 0, 0, 1, 1,
1.272751, -0.6279631, 4.814042, 1, 0, 0, 1, 1,
1.291302, -0.2226639, 1.536325, 1, 0, 0, 1, 1,
1.292376, -1.359093, 2.557961, 1, 0, 0, 1, 1,
1.294978, 0.4344238, 2.453753, 0, 0, 0, 1, 1,
1.29797, 0.5462509, 1.33206, 0, 0, 0, 1, 1,
1.308558, 0.6439719, 1.596442, 0, 0, 0, 1, 1,
1.326584, -0.8917266, 1.459302, 0, 0, 0, 1, 1,
1.326897, 1.11293, 1.191222, 0, 0, 0, 1, 1,
1.328165, -0.3236521, 2.032018, 0, 0, 0, 1, 1,
1.330241, 0.07037016, 1.190543, 0, 0, 0, 1, 1,
1.332271, -1.066953, 1.45716, 1, 1, 1, 1, 1,
1.335286, 0.281672, 1.367041, 1, 1, 1, 1, 1,
1.342851, -2.18468, 2.340418, 1, 1, 1, 1, 1,
1.359875, 1.457117, 2.002024, 1, 1, 1, 1, 1,
1.363178, -0.5250115, 2.44963, 1, 1, 1, 1, 1,
1.363313, 0.3529868, 1.897456, 1, 1, 1, 1, 1,
1.38873, -0.5037964, 2.328187, 1, 1, 1, 1, 1,
1.391338, -0.01378322, 0.3208276, 1, 1, 1, 1, 1,
1.392181, 0.1085409, 3.249843, 1, 1, 1, 1, 1,
1.397193, 1.037555, 0.5078679, 1, 1, 1, 1, 1,
1.40585, 0.03390218, 2.670266, 1, 1, 1, 1, 1,
1.418174, -0.4429089, 3.195001, 1, 1, 1, 1, 1,
1.42857, -1.182973, 1.340828, 1, 1, 1, 1, 1,
1.435618, -0.01334557, 1.209738, 1, 1, 1, 1, 1,
1.436429, -0.7192225, 0.611551, 1, 1, 1, 1, 1,
1.445279, -1.760343, 1.384816, 0, 0, 1, 1, 1,
1.448639, -1.104682, 0.2786937, 1, 0, 0, 1, 1,
1.451725, 0.8123294, 1.154579, 1, 0, 0, 1, 1,
1.451883, 0.4295104, 1.626371, 1, 0, 0, 1, 1,
1.454847, -1.377233, 2.000172, 1, 0, 0, 1, 1,
1.46772, 1.100814, 0.8275899, 1, 0, 0, 1, 1,
1.468813, 0.239296, 2.429985, 0, 0, 0, 1, 1,
1.485315, 0.8153756, 0.3488935, 0, 0, 0, 1, 1,
1.491081, -0.9476541, 2.53541, 0, 0, 0, 1, 1,
1.492657, 0.09242314, 1.792814, 0, 0, 0, 1, 1,
1.493674, 0.2577868, 2.05764, 0, 0, 0, 1, 1,
1.508579, 0.3858558, 1.616496, 0, 0, 0, 1, 1,
1.528023, -0.03422459, 2.390169, 0, 0, 0, 1, 1,
1.530546, -0.4018499, 1.301805, 1, 1, 1, 1, 1,
1.535019, 2.65464, -0.6124002, 1, 1, 1, 1, 1,
1.535975, 0.6539431, 2.289374, 1, 1, 1, 1, 1,
1.536648, 0.817503, 0.4949139, 1, 1, 1, 1, 1,
1.537442, 1.403923, 2.238308, 1, 1, 1, 1, 1,
1.538445, 0.6588098, 0.3331144, 1, 1, 1, 1, 1,
1.544289, 1.370592, 2.123896, 1, 1, 1, 1, 1,
1.553781, 0.510551, 1.192337, 1, 1, 1, 1, 1,
1.55609, -1.377243, 3.768221, 1, 1, 1, 1, 1,
1.567921, 1.829651, 0.8607628, 1, 1, 1, 1, 1,
1.579388, -1.186153, 2.879543, 1, 1, 1, 1, 1,
1.583161, 2.415446, 0.5086902, 1, 1, 1, 1, 1,
1.592499, 0.8551702, 1.326785, 1, 1, 1, 1, 1,
1.598113, -0.6802262, 2.74196, 1, 1, 1, 1, 1,
1.61008, 0.3075956, 2.284022, 1, 1, 1, 1, 1,
1.611946, 0.9307692, 2.141054, 0, 0, 1, 1, 1,
1.627368, 0.4071968, 2.02124, 1, 0, 0, 1, 1,
1.628438, 0.02964548, 4.096616, 1, 0, 0, 1, 1,
1.629095, -1.333995, 2.592498, 1, 0, 0, 1, 1,
1.649057, -1.191864, 1.34267, 1, 0, 0, 1, 1,
1.653564, -0.03183547, 0.778897, 1, 0, 0, 1, 1,
1.658994, -0.4484867, 2.830536, 0, 0, 0, 1, 1,
1.660535, -0.3391611, 0.495113, 0, 0, 0, 1, 1,
1.669453, -0.09614214, 1.237603, 0, 0, 0, 1, 1,
1.69881, 1.044014, 1.314047, 0, 0, 0, 1, 1,
1.699462, 0.6020909, 1.328777, 0, 0, 0, 1, 1,
1.701928, 2.063741, 0.4469909, 0, 0, 0, 1, 1,
1.708395, -0.8271919, 1.018976, 0, 0, 0, 1, 1,
1.709415, -1.058162, 1.794066, 1, 1, 1, 1, 1,
1.734336, 0.8948372, 2.836235, 1, 1, 1, 1, 1,
1.746509, 0.7408761, 2.489264, 1, 1, 1, 1, 1,
1.753641, 1.224776, 0.2835718, 1, 1, 1, 1, 1,
1.76678, -0.4692351, 2.295581, 1, 1, 1, 1, 1,
1.769421, 1.074967, 0.8207366, 1, 1, 1, 1, 1,
1.784804, 1.123707, -0.2231577, 1, 1, 1, 1, 1,
1.806912, 2.278131, 1.154349, 1, 1, 1, 1, 1,
1.83055, 0.8683523, 1.926403, 1, 1, 1, 1, 1,
1.919967, -0.162291, 0.9436278, 1, 1, 1, 1, 1,
1.936111, -1.323395, 1.4992, 1, 1, 1, 1, 1,
1.9587, 0.5123401, 0.1660071, 1, 1, 1, 1, 1,
1.994994, -0.6668195, 2.983244, 1, 1, 1, 1, 1,
2.007499, 0.1268934, 0.1688582, 1, 1, 1, 1, 1,
2.010113, -1.025724, 2.218493, 1, 1, 1, 1, 1,
2.014964, -0.5069544, 2.669964, 0, 0, 1, 1, 1,
2.034506, 0.8487487, 0.5975112, 1, 0, 0, 1, 1,
2.036134, 0.1322634, 0.6955446, 1, 0, 0, 1, 1,
2.095717, -0.6187839, 1.869066, 1, 0, 0, 1, 1,
2.117894, 0.4118247, 0.3128412, 1, 0, 0, 1, 1,
2.180715, 1.125297, 0.8902811, 1, 0, 0, 1, 1,
2.189185, -1.329487, 1.883711, 0, 0, 0, 1, 1,
2.196601, 1.32216, -0.3873196, 0, 0, 0, 1, 1,
2.200675, -0.5130433, 1.713628, 0, 0, 0, 1, 1,
2.230217, -0.7629432, 2.46531, 0, 0, 0, 1, 1,
2.24763, 0.6503375, 2.739357, 0, 0, 0, 1, 1,
2.266308, -1.196574, 1.420171, 0, 0, 0, 1, 1,
2.320554, -0.7335216, 1.856932, 0, 0, 0, 1, 1,
2.345601, 0.8485478, 2.794025, 1, 1, 1, 1, 1,
2.389235, -1.596037, 2.699767, 1, 1, 1, 1, 1,
2.467622, 0.2437115, 2.371543, 1, 1, 1, 1, 1,
2.565152, -0.1608035, 1.120861, 1, 1, 1, 1, 1,
2.632514, -1.484406, 1.677437, 1, 1, 1, 1, 1,
2.678127, -0.3521402, 1.434055, 1, 1, 1, 1, 1,
2.884343, -0.5509025, 0.4363685, 1, 1, 1, 1, 1
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
var radius = 9.060473;
var distance = 31.82453;
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
mvMatrix.translate( 0.07104456, 0.02594328, 0.1904378 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.82453);
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
