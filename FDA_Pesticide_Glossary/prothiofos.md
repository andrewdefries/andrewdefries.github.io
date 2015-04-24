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
-3.332988, -0.2165822, 0.2941142, 1, 0, 0, 1,
-2.8426, 0.03787342, 0.009446478, 1, 0.007843138, 0, 1,
-2.743436, -0.07471133, -1.517963, 1, 0.01176471, 0, 1,
-2.735327, 0.2137068, -0.7422109, 1, 0.01960784, 0, 1,
-2.647943, 0.03432246, -1.802812, 1, 0.02352941, 0, 1,
-2.629904, 0.8098539, -1.937709, 1, 0.03137255, 0, 1,
-2.624526, 2.232166, -1.674489, 1, 0.03529412, 0, 1,
-2.595314, 0.8325858, -0.2822755, 1, 0.04313726, 0, 1,
-2.536553, -1.92613, -1.83882, 1, 0.04705882, 0, 1,
-2.400351, -0.628827, -1.902246, 1, 0.05490196, 0, 1,
-2.376418, -2.099456, -1.142385, 1, 0.05882353, 0, 1,
-2.374841, 0.5905687, -1.638069, 1, 0.06666667, 0, 1,
-2.372741, -0.4952353, -2.191114, 1, 0.07058824, 0, 1,
-2.364588, -0.06460509, -2.216719, 1, 0.07843138, 0, 1,
-2.358505, -0.3378366, 0.9836032, 1, 0.08235294, 0, 1,
-2.310759, -0.2315613, -2.469707, 1, 0.09019608, 0, 1,
-2.2636, 0.1604349, -1.337002, 1, 0.09411765, 0, 1,
-2.227336, -0.4804041, -1.995178, 1, 0.1019608, 0, 1,
-2.209672, 0.4501136, -0.6666307, 1, 0.1098039, 0, 1,
-2.101724, -0.03151892, -0.6270964, 1, 0.1137255, 0, 1,
-2.100546, -0.04256282, -0.770828, 1, 0.1215686, 0, 1,
-2.064159, 0.5870491, -2.161537, 1, 0.1254902, 0, 1,
-2.063491, -1.835162, -3.018316, 1, 0.1333333, 0, 1,
-1.99674, -1.471535, -3.710495, 1, 0.1372549, 0, 1,
-1.989169, 0.2519711, -1.657948, 1, 0.145098, 0, 1,
-1.959722, 0.9460669, -1.170621, 1, 0.1490196, 0, 1,
-1.948186, -0.5278911, -1.681503, 1, 0.1568628, 0, 1,
-1.946538, -3.138076, -2.30638, 1, 0.1607843, 0, 1,
-1.924981, -0.2979836, -0.9115227, 1, 0.1686275, 0, 1,
-1.92384, -1.504988, -2.381094, 1, 0.172549, 0, 1,
-1.916031, 0.04769688, -1.832748, 1, 0.1803922, 0, 1,
-1.915797, 0.2674743, -0.2818646, 1, 0.1843137, 0, 1,
-1.879599, -0.3294005, -0.2814873, 1, 0.1921569, 0, 1,
-1.86457, 0.1517463, 0.3425598, 1, 0.1960784, 0, 1,
-1.841177, 0.8436037, -1.428637, 1, 0.2039216, 0, 1,
-1.834165, 0.7814656, 0.489906, 1, 0.2117647, 0, 1,
-1.833133, -1.991458, -4.071809, 1, 0.2156863, 0, 1,
-1.814014, 0.930296, -0.4039801, 1, 0.2235294, 0, 1,
-1.790132, 1.062609, 0.1478891, 1, 0.227451, 0, 1,
-1.779589, 0.8944562, -2.889633, 1, 0.2352941, 0, 1,
-1.74725, 0.2860991, -0.5103449, 1, 0.2392157, 0, 1,
-1.723207, -0.06313773, -1.680663, 1, 0.2470588, 0, 1,
-1.698064, 0.2427261, -0.8832777, 1, 0.2509804, 0, 1,
-1.695115, -0.5934852, -2.005939, 1, 0.2588235, 0, 1,
-1.686788, -0.8611869, -2.146566, 1, 0.2627451, 0, 1,
-1.672604, -0.5371745, -1.653448, 1, 0.2705882, 0, 1,
-1.63897, -0.6550856, -1.541847, 1, 0.2745098, 0, 1,
-1.628721, -0.7652022, -1.830869, 1, 0.282353, 0, 1,
-1.627474, 0.8707208, -2.745768, 1, 0.2862745, 0, 1,
-1.627336, 0.05953262, -0.8220331, 1, 0.2941177, 0, 1,
-1.625214, 0.1846836, -1.780052, 1, 0.3019608, 0, 1,
-1.623152, 0.3487038, 0.1310317, 1, 0.3058824, 0, 1,
-1.619835, -0.3045711, -1.883766, 1, 0.3137255, 0, 1,
-1.614004, 0.003056275, -1.87858, 1, 0.3176471, 0, 1,
-1.613874, -0.8314779, -3.755906, 1, 0.3254902, 0, 1,
-1.598874, 0.5350714, -1.052785, 1, 0.3294118, 0, 1,
-1.595992, -1.57772, -5.025789, 1, 0.3372549, 0, 1,
-1.587345, -1.53928, -2.240303, 1, 0.3411765, 0, 1,
-1.574931, 1.019813, -1.576803, 1, 0.3490196, 0, 1,
-1.570034, -1.348011, -2.236294, 1, 0.3529412, 0, 1,
-1.54935, -0.9111524, -2.625666, 1, 0.3607843, 0, 1,
-1.53341, 0.7671179, -0.04973284, 1, 0.3647059, 0, 1,
-1.528849, 0.5091791, -1.023613, 1, 0.372549, 0, 1,
-1.526543, -1.390425, -1.694834, 1, 0.3764706, 0, 1,
-1.520649, 0.636659, -0.9922047, 1, 0.3843137, 0, 1,
-1.513301, -0.3719665, -1.779081, 1, 0.3882353, 0, 1,
-1.508624, -1.986312, -3.93895, 1, 0.3960784, 0, 1,
-1.502551, 0.7894986, -0.8487128, 1, 0.4039216, 0, 1,
-1.498937, -0.1771783, -0.6508866, 1, 0.4078431, 0, 1,
-1.492581, -0.07811447, -1.852305, 1, 0.4156863, 0, 1,
-1.491448, -0.917332, -1.575086, 1, 0.4196078, 0, 1,
-1.491059, -0.006452523, -2.825898, 1, 0.427451, 0, 1,
-1.486714, 0.008121051, 0.460055, 1, 0.4313726, 0, 1,
-1.482241, 0.8716229, -1.923704, 1, 0.4392157, 0, 1,
-1.474101, 0.5116624, -1.470973, 1, 0.4431373, 0, 1,
-1.460834, 1.085429, -1.894257, 1, 0.4509804, 0, 1,
-1.448754, -0.4316816, -1.844347, 1, 0.454902, 0, 1,
-1.448511, -0.3536919, -0.7747685, 1, 0.4627451, 0, 1,
-1.442988, 1.122534, -0.2285233, 1, 0.4666667, 0, 1,
-1.434818, -0.7504861, -2.878248, 1, 0.4745098, 0, 1,
-1.431482, -0.009779947, -1.339711, 1, 0.4784314, 0, 1,
-1.430848, -0.4908635, -2.195477, 1, 0.4862745, 0, 1,
-1.412412, -0.2248486, -0.9497044, 1, 0.4901961, 0, 1,
-1.405059, -1.008718, -0.8643539, 1, 0.4980392, 0, 1,
-1.402877, 0.4534489, -3.345904, 1, 0.5058824, 0, 1,
-1.393824, -0.02757689, -2.867833, 1, 0.509804, 0, 1,
-1.391161, -0.05848687, -1.527283, 1, 0.5176471, 0, 1,
-1.38643, 1.304421, -0.5734341, 1, 0.5215687, 0, 1,
-1.38617, 1.148843, -2.569372, 1, 0.5294118, 0, 1,
-1.385969, 0.4875778, -1.085461, 1, 0.5333334, 0, 1,
-1.384752, -0.5231853, -0.8590108, 1, 0.5411765, 0, 1,
-1.378994, -0.2425485, -0.3505773, 1, 0.5450981, 0, 1,
-1.367873, -0.0787193, -0.214719, 1, 0.5529412, 0, 1,
-1.356968, -0.2189764, -1.827424, 1, 0.5568628, 0, 1,
-1.352569, 1.341958, 1.507273, 1, 0.5647059, 0, 1,
-1.351114, 1.514288, -0.1050792, 1, 0.5686275, 0, 1,
-1.344186, -0.2369878, -0.1831164, 1, 0.5764706, 0, 1,
-1.339208, 0.7965396, -1.912149, 1, 0.5803922, 0, 1,
-1.31147, -0.3970326, -1.745311, 1, 0.5882353, 0, 1,
-1.306053, 1.110544, -0.1633459, 1, 0.5921569, 0, 1,
-1.304557, -0.5204808, -2.012708, 1, 0.6, 0, 1,
-1.302005, -1.422313, -1.757437, 1, 0.6078432, 0, 1,
-1.295766, -2.11701, -1.996741, 1, 0.6117647, 0, 1,
-1.290459, -0.5700911, -1.655076, 1, 0.6196079, 0, 1,
-1.289498, 1.743222, 1.461144, 1, 0.6235294, 0, 1,
-1.288597, -0.7931963, -1.190358, 1, 0.6313726, 0, 1,
-1.286932, 1.289147, -0.6860595, 1, 0.6352941, 0, 1,
-1.280164, -0.202776, -2.116264, 1, 0.6431373, 0, 1,
-1.279469, 0.3023113, -0.8780363, 1, 0.6470588, 0, 1,
-1.269128, -0.6787229, -2.451059, 1, 0.654902, 0, 1,
-1.264236, -1.375619, -2.406196, 1, 0.6588235, 0, 1,
-1.260361, -0.6052322, -0.689011, 1, 0.6666667, 0, 1,
-1.236674, -0.9665694, -1.181335, 1, 0.6705883, 0, 1,
-1.230043, -0.07246596, -0.8758382, 1, 0.6784314, 0, 1,
-1.229793, 1.746422, 0.8220271, 1, 0.682353, 0, 1,
-1.228916, -1.285389, -1.529096, 1, 0.6901961, 0, 1,
-1.225159, -1.053805, -2.008955, 1, 0.6941177, 0, 1,
-1.222425, 1.090761, -1.933303, 1, 0.7019608, 0, 1,
-1.219005, 1.715124, -0.2161373, 1, 0.7098039, 0, 1,
-1.216475, -0.2647296, -4.344928, 1, 0.7137255, 0, 1,
-1.209128, -0.3261358, -2.601355, 1, 0.7215686, 0, 1,
-1.207678, 0.9364646, -1.836965, 1, 0.7254902, 0, 1,
-1.204331, 1.412458, 1.212425, 1, 0.7333333, 0, 1,
-1.201829, 0.09517214, -1.812755, 1, 0.7372549, 0, 1,
-1.197604, -0.1534973, -2.892793, 1, 0.7450981, 0, 1,
-1.195685, -1.389757, -2.9077, 1, 0.7490196, 0, 1,
-1.194166, -0.1254035, -2.356836, 1, 0.7568628, 0, 1,
-1.184138, 0.6264173, 0.4753166, 1, 0.7607843, 0, 1,
-1.179777, -1.011235, -1.088126, 1, 0.7686275, 0, 1,
-1.177348, 0.5805561, -0.6377189, 1, 0.772549, 0, 1,
-1.174193, -1.176102, -2.61451, 1, 0.7803922, 0, 1,
-1.167002, 1.136033, -1.289766, 1, 0.7843137, 0, 1,
-1.162414, 0.4116349, -0.4279146, 1, 0.7921569, 0, 1,
-1.15824, 0.8967774, -0.5307236, 1, 0.7960784, 0, 1,
-1.150922, -0.5181056, -2.373998, 1, 0.8039216, 0, 1,
-1.147944, -1.176923, -1.153481, 1, 0.8117647, 0, 1,
-1.143056, -0.9394686, -2.24889, 1, 0.8156863, 0, 1,
-1.139931, -0.6398729, -2.313461, 1, 0.8235294, 0, 1,
-1.124853, -0.5325573, -0.5312513, 1, 0.827451, 0, 1,
-1.124618, -0.05070394, -0.4460583, 1, 0.8352941, 0, 1,
-1.124581, 0.9799336, -1.758433, 1, 0.8392157, 0, 1,
-1.121061, -0.3464082, -3.126355, 1, 0.8470588, 0, 1,
-1.11937, -1.554359, -2.450439, 1, 0.8509804, 0, 1,
-1.11816, 0.1069915, -2.037482, 1, 0.8588235, 0, 1,
-1.11766, -0.8695883, -3.411971, 1, 0.8627451, 0, 1,
-1.108761, -0.2857692, -1.902444, 1, 0.8705882, 0, 1,
-1.108476, 0.9866887, -1.565437, 1, 0.8745098, 0, 1,
-1.098503, -1.652567, -0.9691857, 1, 0.8823529, 0, 1,
-1.094682, -0.527967, -0.8836718, 1, 0.8862745, 0, 1,
-1.087048, 0.6917981, 0.1446804, 1, 0.8941177, 0, 1,
-1.085795, 0.3315952, -0.7053943, 1, 0.8980392, 0, 1,
-1.08149, -1.442913, -3.691244, 1, 0.9058824, 0, 1,
-1.079165, -0.07992616, 0.3425612, 1, 0.9137255, 0, 1,
-1.071279, -1.437467, -2.156266, 1, 0.9176471, 0, 1,
-1.070757, -0.3732632, -2.506902, 1, 0.9254902, 0, 1,
-1.070499, -0.4295885, -0.7632125, 1, 0.9294118, 0, 1,
-1.067807, 0.3154458, -1.81047, 1, 0.9372549, 0, 1,
-1.064895, -1.21622, -0.3707765, 1, 0.9411765, 0, 1,
-1.064467, 0.3629371, -1.084495, 1, 0.9490196, 0, 1,
-1.063521, 0.9049162, -2.109904, 1, 0.9529412, 0, 1,
-1.057666, -0.5433447, -1.281708, 1, 0.9607843, 0, 1,
-1.057573, 0.1573118, -2.219038, 1, 0.9647059, 0, 1,
-1.055208, 1.23407, -1.404678, 1, 0.972549, 0, 1,
-1.052067, 0.02727017, -2.374577, 1, 0.9764706, 0, 1,
-1.047044, -0.9607989, -2.906053, 1, 0.9843137, 0, 1,
-1.046537, -0.06678923, -0.435951, 1, 0.9882353, 0, 1,
-1.046533, -1.898667, -2.309393, 1, 0.9960784, 0, 1,
-1.042104, 0.1181064, -1.791207, 0.9960784, 1, 0, 1,
-1.040478, 0.8465528, -1.556925, 0.9921569, 1, 0, 1,
-1.03872, -0.001156535, -0.7688996, 0.9843137, 1, 0, 1,
-1.03771, 1.058116, -0.8600575, 0.9803922, 1, 0, 1,
-1.036766, -0.1957861, -2.16284, 0.972549, 1, 0, 1,
-1.033489, 0.4119439, -2.044454, 0.9686275, 1, 0, 1,
-1.012983, 1.256638, 0.8216575, 0.9607843, 1, 0, 1,
-1.012117, 0.4242029, -0.07256696, 0.9568627, 1, 0, 1,
-1.008193, -0.3348786, -1.742886, 0.9490196, 1, 0, 1,
-1.007768, 0.5748585, -1.446813, 0.945098, 1, 0, 1,
-1.001822, -0.6989776, -1.782469, 0.9372549, 1, 0, 1,
-0.9984857, -0.8920987, -0.3350362, 0.9333333, 1, 0, 1,
-0.9981243, -0.412627, -3.603246, 0.9254902, 1, 0, 1,
-0.9940892, 1.191572, -0.725897, 0.9215686, 1, 0, 1,
-0.991409, 1.155713, -0.8340892, 0.9137255, 1, 0, 1,
-0.9875428, -0.7486957, -2.969441, 0.9098039, 1, 0, 1,
-0.9868145, -1.268171, -3.67216, 0.9019608, 1, 0, 1,
-0.9742362, -1.020076, -1.744484, 0.8941177, 1, 0, 1,
-0.9671863, -0.3519261, -1.44112, 0.8901961, 1, 0, 1,
-0.9664788, 2.327229, -1.73175, 0.8823529, 1, 0, 1,
-0.963066, 1.29457, -1.038028, 0.8784314, 1, 0, 1,
-0.9628717, 0.3250777, -1.018901, 0.8705882, 1, 0, 1,
-0.9608483, -0.3538527, -2.691782, 0.8666667, 1, 0, 1,
-0.9447148, 0.4472699, -1.033523, 0.8588235, 1, 0, 1,
-0.9424174, 0.8868847, 0.2395632, 0.854902, 1, 0, 1,
-0.9417053, -0.6079601, -1.979769, 0.8470588, 1, 0, 1,
-0.931778, -0.7715059, -3.908085, 0.8431373, 1, 0, 1,
-0.9302922, -0.9982601, -2.853512, 0.8352941, 1, 0, 1,
-0.9301077, 1.087162, -0.01835515, 0.8313726, 1, 0, 1,
-0.928861, -0.7193416, -2.762941, 0.8235294, 1, 0, 1,
-0.9278674, -1.271328, -3.634529, 0.8196079, 1, 0, 1,
-0.9135951, 0.05412242, -2.015793, 0.8117647, 1, 0, 1,
-0.9124852, -0.04488999, -1.23314, 0.8078431, 1, 0, 1,
-0.9098908, 0.3794007, -1.216685, 0.8, 1, 0, 1,
-0.9061919, -1.432206, -2.982553, 0.7921569, 1, 0, 1,
-0.9014004, 1.266899, -1.35243, 0.7882353, 1, 0, 1,
-0.886937, 0.7792739, 0.1142443, 0.7803922, 1, 0, 1,
-0.8835677, -0.1150085, 0.377887, 0.7764706, 1, 0, 1,
-0.8822168, -2.004115, -2.857425, 0.7686275, 1, 0, 1,
-0.8736593, 0.6060643, -1.826261, 0.7647059, 1, 0, 1,
-0.8694868, -0.5204113, -4.039964, 0.7568628, 1, 0, 1,
-0.8687207, 0.8765994, 0.6601802, 0.7529412, 1, 0, 1,
-0.8677233, -0.7364965, -0.2594503, 0.7450981, 1, 0, 1,
-0.8674187, 1.480895, -2.163405, 0.7411765, 1, 0, 1,
-0.8647879, -0.05561622, -1.403648, 0.7333333, 1, 0, 1,
-0.8580654, 0.8640624, -2.385813, 0.7294118, 1, 0, 1,
-0.855985, 0.1930238, -0.07178055, 0.7215686, 1, 0, 1,
-0.8558679, 0.0942638, -2.040685, 0.7176471, 1, 0, 1,
-0.8521205, -0.456378, -3.499941, 0.7098039, 1, 0, 1,
-0.8509043, 0.6567779, -1.617568, 0.7058824, 1, 0, 1,
-0.8497921, -0.7202182, -3.366802, 0.6980392, 1, 0, 1,
-0.8428842, 2.188908, -0.979623, 0.6901961, 1, 0, 1,
-0.8424248, -0.2153771, -2.880865, 0.6862745, 1, 0, 1,
-0.8388994, 1.091145, -1.198571, 0.6784314, 1, 0, 1,
-0.8388876, -3.039779, -1.971981, 0.6745098, 1, 0, 1,
-0.8374661, 1.355113, -0.24967, 0.6666667, 1, 0, 1,
-0.8369197, -0.5611139, -1.5425, 0.6627451, 1, 0, 1,
-0.8312941, -0.5250723, -1.716987, 0.654902, 1, 0, 1,
-0.8282991, -0.3433965, -1.739402, 0.6509804, 1, 0, 1,
-0.8249012, 0.6629046, -1.0808, 0.6431373, 1, 0, 1,
-0.823545, 0.7300835, 0.3439655, 0.6392157, 1, 0, 1,
-0.8206753, -0.05141903, -1.932737, 0.6313726, 1, 0, 1,
-0.8171999, 0.4726826, -1.605378, 0.627451, 1, 0, 1,
-0.816338, -0.0903739, -1.753842, 0.6196079, 1, 0, 1,
-0.8149838, 2.194686, -0.1479148, 0.6156863, 1, 0, 1,
-0.8106039, -0.9110254, -1.841884, 0.6078432, 1, 0, 1,
-0.8048543, 0.4343077, -3.176987, 0.6039216, 1, 0, 1,
-0.8031538, -0.3611464, -1.690508, 0.5960785, 1, 0, 1,
-0.8021827, 0.3158001, -1.87249, 0.5882353, 1, 0, 1,
-0.8004693, 1.28492, -0.8741012, 0.5843138, 1, 0, 1,
-0.8003386, 0.5179481, -0.9632089, 0.5764706, 1, 0, 1,
-0.7928941, 0.7104912, -0.06052896, 0.572549, 1, 0, 1,
-0.7920662, 0.4073302, -1.498112, 0.5647059, 1, 0, 1,
-0.7846717, -0.1418254, -2.349058, 0.5607843, 1, 0, 1,
-0.7801517, 0.4252447, -1.85426, 0.5529412, 1, 0, 1,
-0.7798622, -0.657508, -3.770996, 0.5490196, 1, 0, 1,
-0.7793095, 1.98942, -1.041897, 0.5411765, 1, 0, 1,
-0.7786895, -0.6970654, -2.546915, 0.5372549, 1, 0, 1,
-0.7744931, -1.959193, -1.974704, 0.5294118, 1, 0, 1,
-0.773098, 0.7949511, -1.061199, 0.5254902, 1, 0, 1,
-0.7706136, -0.6459123, -2.917921, 0.5176471, 1, 0, 1,
-0.7690323, 1.278415, -1.022846, 0.5137255, 1, 0, 1,
-0.7648548, -0.8421662, -1.955842, 0.5058824, 1, 0, 1,
-0.76074, -0.145604, -1.27806, 0.5019608, 1, 0, 1,
-0.7580477, -1.107497, -4.506302, 0.4941176, 1, 0, 1,
-0.7575281, 0.8383058, 0.531674, 0.4862745, 1, 0, 1,
-0.7571213, 0.9342786, -0.947185, 0.4823529, 1, 0, 1,
-0.7522666, -0.03931013, -0.2131396, 0.4745098, 1, 0, 1,
-0.7435797, 0.9284106, -0.8451855, 0.4705882, 1, 0, 1,
-0.7430293, -1.510728, -2.182131, 0.4627451, 1, 0, 1,
-0.7426077, -1.486597, -2.771582, 0.4588235, 1, 0, 1,
-0.7415594, -0.6080611, -1.357357, 0.4509804, 1, 0, 1,
-0.7409203, -0.2151689, -3.028432, 0.4470588, 1, 0, 1,
-0.7390019, 0.2165773, -2.600457, 0.4392157, 1, 0, 1,
-0.7328609, 0.7727557, -1.875811, 0.4352941, 1, 0, 1,
-0.7231296, 0.52853, 0.8369715, 0.427451, 1, 0, 1,
-0.7228802, -0.4702599, -4.084572, 0.4235294, 1, 0, 1,
-0.7138835, 0.4625692, -1.53657, 0.4156863, 1, 0, 1,
-0.7085556, 0.9110338, -0.8705009, 0.4117647, 1, 0, 1,
-0.7039189, 0.5030102, -0.4153096, 0.4039216, 1, 0, 1,
-0.697207, 0.335633, 0.04926807, 0.3960784, 1, 0, 1,
-0.6945505, -0.02950998, -0.5835501, 0.3921569, 1, 0, 1,
-0.6939025, 0.2310821, -1.783026, 0.3843137, 1, 0, 1,
-0.6938398, 0.3219385, -0.0384551, 0.3803922, 1, 0, 1,
-0.6856892, 0.6814778, -1.191775, 0.372549, 1, 0, 1,
-0.6811209, 0.7447005, 0.1062647, 0.3686275, 1, 0, 1,
-0.6793256, 1.392787, 1.181088, 0.3607843, 1, 0, 1,
-0.6763564, 0.9961155, 0.3839004, 0.3568628, 1, 0, 1,
-0.6679497, -0.7709553, -3.456858, 0.3490196, 1, 0, 1,
-0.6571082, 1.201505, -0.8385974, 0.345098, 1, 0, 1,
-0.6569082, -0.01252491, -1.216941, 0.3372549, 1, 0, 1,
-0.6568074, -0.1872507, -3.626906, 0.3333333, 1, 0, 1,
-0.6543545, -1.697445, -2.918802, 0.3254902, 1, 0, 1,
-0.6517987, 1.764975, -0.1253238, 0.3215686, 1, 0, 1,
-0.6397823, -0.6432433, -2.703562, 0.3137255, 1, 0, 1,
-0.6359568, 1.449613, -1.131605, 0.3098039, 1, 0, 1,
-0.6321445, 0.1458233, -1.382843, 0.3019608, 1, 0, 1,
-0.631689, -0.6054605, -1.020838, 0.2941177, 1, 0, 1,
-0.6207638, 1.693334, -1.955807, 0.2901961, 1, 0, 1,
-0.6141491, 0.1400185, -1.954786, 0.282353, 1, 0, 1,
-0.6092826, 0.08065737, -2.319656, 0.2784314, 1, 0, 1,
-0.6036959, 0.7641951, -2.153252, 0.2705882, 1, 0, 1,
-0.600288, 1.799526, 1.026481, 0.2666667, 1, 0, 1,
-0.6000404, -0.8830101, -2.678075, 0.2588235, 1, 0, 1,
-0.5976365, -0.03344822, -1.603217, 0.254902, 1, 0, 1,
-0.5936906, -0.08075671, -3.217685, 0.2470588, 1, 0, 1,
-0.5934762, -1.727219, -3.980433, 0.2431373, 1, 0, 1,
-0.5862268, -0.7643536, -4.966133, 0.2352941, 1, 0, 1,
-0.5848019, -0.002483797, -3.08375, 0.2313726, 1, 0, 1,
-0.5836805, 0.4662667, -2.083462, 0.2235294, 1, 0, 1,
-0.5783037, 1.739852, 0.4789556, 0.2196078, 1, 0, 1,
-0.5745459, 0.7309634, 2.630222, 0.2117647, 1, 0, 1,
-0.5739678, -0.2017364, -1.886161, 0.2078431, 1, 0, 1,
-0.572591, -1.756348, -3.039618, 0.2, 1, 0, 1,
-0.5724477, -1.198769, -1.79862, 0.1921569, 1, 0, 1,
-0.5714037, -1.549197, -4.06685, 0.1882353, 1, 0, 1,
-0.5693372, -0.4468427, -3.087769, 0.1803922, 1, 0, 1,
-0.5630848, -0.4931168, -0.8352829, 0.1764706, 1, 0, 1,
-0.5615137, -1.337896, -0.4719912, 0.1686275, 1, 0, 1,
-0.5569007, 0.4979057, -0.07348567, 0.1647059, 1, 0, 1,
-0.5568899, -1.495432, -2.637688, 0.1568628, 1, 0, 1,
-0.5516227, 2.729455, -0.1207333, 0.1529412, 1, 0, 1,
-0.5503518, -0.1075365, -0.3610035, 0.145098, 1, 0, 1,
-0.5471207, 0.2551942, -0.7934874, 0.1411765, 1, 0, 1,
-0.5463059, -1.95695, -3.586947, 0.1333333, 1, 0, 1,
-0.5401646, 1.267222, -0.9876581, 0.1294118, 1, 0, 1,
-0.5396551, -0.4549557, -2.902484, 0.1215686, 1, 0, 1,
-0.5354347, -0.2688188, -2.165942, 0.1176471, 1, 0, 1,
-0.5344576, 0.6567213, -1.063388, 0.1098039, 1, 0, 1,
-0.5332401, 0.2216257, -2.833762, 0.1058824, 1, 0, 1,
-0.527238, 0.1479283, -2.338359, 0.09803922, 1, 0, 1,
-0.5234119, 0.9577311, -0.03888388, 0.09019608, 1, 0, 1,
-0.5216361, 1.722279, 0.6507655, 0.08627451, 1, 0, 1,
-0.5184748, 1.326979, 0.3921551, 0.07843138, 1, 0, 1,
-0.5168894, -1.594233, -3.475221, 0.07450981, 1, 0, 1,
-0.515231, 0.9253717, -0.7366408, 0.06666667, 1, 0, 1,
-0.512502, 0.1754024, -0.4814884, 0.0627451, 1, 0, 1,
-0.4980392, 2.371623, -1.379746, 0.05490196, 1, 0, 1,
-0.4970001, 0.9419823, -0.9906849, 0.05098039, 1, 0, 1,
-0.4940206, -0.3922475, -3.869673, 0.04313726, 1, 0, 1,
-0.4935806, -0.9583923, -2.755557, 0.03921569, 1, 0, 1,
-0.4920384, 0.4342042, -2.844001, 0.03137255, 1, 0, 1,
-0.4917536, 0.6216364, -0.05209776, 0.02745098, 1, 0, 1,
-0.4808572, -0.3255404, -1.345604, 0.01960784, 1, 0, 1,
-0.4802372, 0.5608522, -0.6679947, 0.01568628, 1, 0, 1,
-0.4795872, 0.7841418, 0.178138, 0.007843138, 1, 0, 1,
-0.4731028, 0.2118394, 0.2841441, 0.003921569, 1, 0, 1,
-0.4691752, -1.144747, -1.588774, 0, 1, 0.003921569, 1,
-0.4680596, 0.4663617, -1.475789, 0, 1, 0.01176471, 1,
-0.4613379, 0.4917769, -2.421879, 0, 1, 0.01568628, 1,
-0.4577585, -0.3397497, -1.90143, 0, 1, 0.02352941, 1,
-0.4512451, -0.1341959, -0.7876391, 0, 1, 0.02745098, 1,
-0.4507785, 1.397952, -0.9578958, 0, 1, 0.03529412, 1,
-0.449856, -0.3793824, -2.271102, 0, 1, 0.03921569, 1,
-0.4481431, -0.8429303, -3.36494, 0, 1, 0.04705882, 1,
-0.4428364, 0.06312449, -0.2067544, 0, 1, 0.05098039, 1,
-0.4420881, -0.7914757, -2.558471, 0, 1, 0.05882353, 1,
-0.4353597, -0.3776968, -1.489741, 0, 1, 0.0627451, 1,
-0.434338, 0.888378, 0.1442405, 0, 1, 0.07058824, 1,
-0.4311616, 0.5362343, 0.07845981, 0, 1, 0.07450981, 1,
-0.4283925, -0.05955795, -2.257082, 0, 1, 0.08235294, 1,
-0.4278609, 0.5653974, 0.7758074, 0, 1, 0.08627451, 1,
-0.4276384, 0.02469459, -2.148409, 0, 1, 0.09411765, 1,
-0.4238456, 2.699838, -0.02910209, 0, 1, 0.1019608, 1,
-0.42336, 0.5420468, -0.2560393, 0, 1, 0.1058824, 1,
-0.4204859, -0.593747, -2.372602, 0, 1, 0.1137255, 1,
-0.4204231, -1.942993, -1.454707, 0, 1, 0.1176471, 1,
-0.4195128, -0.6947498, -1.140911, 0, 1, 0.1254902, 1,
-0.4191189, -1.139198, -3.016681, 0, 1, 0.1294118, 1,
-0.4127533, -0.3389143, -2.17555, 0, 1, 0.1372549, 1,
-0.4121748, -1.110052, -3.823026, 0, 1, 0.1411765, 1,
-0.4116316, 0.6238146, 0.04424355, 0, 1, 0.1490196, 1,
-0.4096663, 2.001582, -1.117206, 0, 1, 0.1529412, 1,
-0.4092074, 0.181914, 0.2064592, 0, 1, 0.1607843, 1,
-0.4062135, -0.03350369, -2.214328, 0, 1, 0.1647059, 1,
-0.4029908, 0.4929566, -0.3158536, 0, 1, 0.172549, 1,
-0.3983024, -1.436149, -2.43199, 0, 1, 0.1764706, 1,
-0.3947029, -0.3713035, -2.797208, 0, 1, 0.1843137, 1,
-0.3939657, 0.6165506, -0.3092219, 0, 1, 0.1882353, 1,
-0.3925169, 0.7670179, -0.7964135, 0, 1, 0.1960784, 1,
-0.3879211, -1.067705, -3.335485, 0, 1, 0.2039216, 1,
-0.384145, -0.4672125, -3.52901, 0, 1, 0.2078431, 1,
-0.3829854, 0.7038409, -0.7841648, 0, 1, 0.2156863, 1,
-0.3811722, -0.03368304, -0.9114567, 0, 1, 0.2196078, 1,
-0.3810974, -1.010622, -2.522217, 0, 1, 0.227451, 1,
-0.3763099, 1.333909, -0.7289608, 0, 1, 0.2313726, 1,
-0.3757069, -1.800689, -2.77965, 0, 1, 0.2392157, 1,
-0.3705601, -0.04470322, -0.2439563, 0, 1, 0.2431373, 1,
-0.3697766, -1.680729, -1.92895, 0, 1, 0.2509804, 1,
-0.369702, 0.4670038, -0.08625957, 0, 1, 0.254902, 1,
-0.3674952, 0.530179, -0.3273009, 0, 1, 0.2627451, 1,
-0.3604827, -1.331715, -3.248701, 0, 1, 0.2666667, 1,
-0.354151, -1.595154, -2.937993, 0, 1, 0.2745098, 1,
-0.3522579, -1.050949, -2.063961, 0, 1, 0.2784314, 1,
-0.3509217, 0.4474863, 0.2659881, 0, 1, 0.2862745, 1,
-0.3506219, 1.813369, -0.47877, 0, 1, 0.2901961, 1,
-0.3504877, 0.1856013, -0.6182717, 0, 1, 0.2980392, 1,
-0.3496147, -0.4701766, -2.105111, 0, 1, 0.3058824, 1,
-0.3494146, 0.9712989, 0.5550383, 0, 1, 0.3098039, 1,
-0.3493579, 0.9346341, 0.7511801, 0, 1, 0.3176471, 1,
-0.3469398, -0.9691039, -4.017001, 0, 1, 0.3215686, 1,
-0.3466791, 0.7069181, 1.283766, 0, 1, 0.3294118, 1,
-0.3462983, -0.2734223, -3.932665, 0, 1, 0.3333333, 1,
-0.3458883, -0.4651062, -3.710407, 0, 1, 0.3411765, 1,
-0.3453383, 0.6321287, -0.5574453, 0, 1, 0.345098, 1,
-0.3452055, 1.176807, -2.895517, 0, 1, 0.3529412, 1,
-0.3377555, 0.1283129, -0.8995345, 0, 1, 0.3568628, 1,
-0.3366572, -0.8426867, -1.567092, 0, 1, 0.3647059, 1,
-0.3358378, 0.7654627, -1.789569, 0, 1, 0.3686275, 1,
-0.3330345, 0.9657476, 0.1158123, 0, 1, 0.3764706, 1,
-0.3324613, 0.2449889, -1.673577, 0, 1, 0.3803922, 1,
-0.3313983, -0.5119841, -4.513631, 0, 1, 0.3882353, 1,
-0.3312871, -0.5031413, -3.490263, 0, 1, 0.3921569, 1,
-0.324854, 0.6376249, -0.8563071, 0, 1, 0.4, 1,
-0.3246119, 0.6879539, 0.98163, 0, 1, 0.4078431, 1,
-0.3244684, -0.4710649, -2.452575, 0, 1, 0.4117647, 1,
-0.321757, -1.210868, -2.740905, 0, 1, 0.4196078, 1,
-0.3166279, -0.198599, -2.795211, 0, 1, 0.4235294, 1,
-0.3145405, -0.223857, -3.088353, 0, 1, 0.4313726, 1,
-0.3067437, -1.542718, -2.975514, 0, 1, 0.4352941, 1,
-0.2926509, -0.9000334, -4.144104, 0, 1, 0.4431373, 1,
-0.2896493, 0.9824764, 0.4073057, 0, 1, 0.4470588, 1,
-0.2857403, -2.448125, -4.457587, 0, 1, 0.454902, 1,
-0.2808562, 0.0621975, -1.181418, 0, 1, 0.4588235, 1,
-0.2757949, 2.019165, -1.303406, 0, 1, 0.4666667, 1,
-0.2693118, -0.888881, -2.518565, 0, 1, 0.4705882, 1,
-0.2657844, -0.7169318, -3.672076, 0, 1, 0.4784314, 1,
-0.2641369, -0.4728992, -2.593755, 0, 1, 0.4823529, 1,
-0.257948, 1.673408, -0.4018784, 0, 1, 0.4901961, 1,
-0.2567733, -1.281603, -3.776023, 0, 1, 0.4941176, 1,
-0.2524907, -0.1114242, -0.9717821, 0, 1, 0.5019608, 1,
-0.2508699, -0.746533, -2.03891, 0, 1, 0.509804, 1,
-0.2492453, -1.24321, -3.884229, 0, 1, 0.5137255, 1,
-0.2486531, 0.9252182, -0.2172714, 0, 1, 0.5215687, 1,
-0.2486502, -1.887298, -2.901309, 0, 1, 0.5254902, 1,
-0.2466739, -0.1075545, -1.359623, 0, 1, 0.5333334, 1,
-0.2451974, -1.201687, -1.368059, 0, 1, 0.5372549, 1,
-0.240484, 0.175494, 0.06183628, 0, 1, 0.5450981, 1,
-0.2397884, -1.607857, -2.621227, 0, 1, 0.5490196, 1,
-0.2375641, 0.3917807, -1.326675, 0, 1, 0.5568628, 1,
-0.236408, 0.1562627, -1.732233, 0, 1, 0.5607843, 1,
-0.2356034, 0.7478657, -1.932184, 0, 1, 0.5686275, 1,
-0.2354236, -1.076563, -1.81507, 0, 1, 0.572549, 1,
-0.2343624, -0.2417014, -2.634398, 0, 1, 0.5803922, 1,
-0.2339675, 0.05454468, -1.591637, 0, 1, 0.5843138, 1,
-0.2317987, -0.1993901, -1.673421, 0, 1, 0.5921569, 1,
-0.2313937, -1.698772, -4.23917, 0, 1, 0.5960785, 1,
-0.2285061, -0.7595082, -3.615818, 0, 1, 0.6039216, 1,
-0.22448, -0.02685759, -0.6116689, 0, 1, 0.6117647, 1,
-0.2243619, -0.6066149, -3.130644, 0, 1, 0.6156863, 1,
-0.2230741, 0.4068673, 0.9097436, 0, 1, 0.6235294, 1,
-0.2069936, 0.6186565, -1.046893, 0, 1, 0.627451, 1,
-0.203747, 0.645845, 0.1943245, 0, 1, 0.6352941, 1,
-0.2036036, -0.4462742, -2.657489, 0, 1, 0.6392157, 1,
-0.2017203, 0.9327376, 0.8151776, 0, 1, 0.6470588, 1,
-0.200481, 0.5248256, -1.127852, 0, 1, 0.6509804, 1,
-0.1971582, 1.401174, 0.2828355, 0, 1, 0.6588235, 1,
-0.1971496, 0.2370785, -0.5432807, 0, 1, 0.6627451, 1,
-0.1911362, -1.331593, -3.91286, 0, 1, 0.6705883, 1,
-0.1867835, -0.3687818, -2.679849, 0, 1, 0.6745098, 1,
-0.18181, -0.2997907, -2.048966, 0, 1, 0.682353, 1,
-0.1781159, -0.457354, -4.047633, 0, 1, 0.6862745, 1,
-0.1702905, -1.4745, -4.242689, 0, 1, 0.6941177, 1,
-0.1686314, 0.7502649, -0.9218235, 0, 1, 0.7019608, 1,
-0.167517, -1.225198, -2.294812, 0, 1, 0.7058824, 1,
-0.1639559, -0.317685, -3.693641, 0, 1, 0.7137255, 1,
-0.1554077, 1.04907, -0.04811123, 0, 1, 0.7176471, 1,
-0.1485892, -0.06145777, -1.449064, 0, 1, 0.7254902, 1,
-0.1439719, -0.451251, -3.893969, 0, 1, 0.7294118, 1,
-0.1379359, -0.4346355, -3.607464, 0, 1, 0.7372549, 1,
-0.133437, 1.589266, -1.612659, 0, 1, 0.7411765, 1,
-0.1268714, 1.394042, 0.02207618, 0, 1, 0.7490196, 1,
-0.12656, 1.126861, 1.855436, 0, 1, 0.7529412, 1,
-0.1224427, 0.5821282, 0.03505449, 0, 1, 0.7607843, 1,
-0.1211473, -0.5426469, -3.969399, 0, 1, 0.7647059, 1,
-0.1210547, 0.3553993, -0.4829079, 0, 1, 0.772549, 1,
-0.1164519, -0.780659, -1.912436, 0, 1, 0.7764706, 1,
-0.1114987, -1.580058, -2.490106, 0, 1, 0.7843137, 1,
-0.1114604, 0.2259478, 1.428347, 0, 1, 0.7882353, 1,
-0.1103031, -0.01620864, -1.197593, 0, 1, 0.7960784, 1,
-0.09911362, 0.5657995, 0.9589902, 0, 1, 0.8039216, 1,
-0.09812149, 0.02261548, -2.814197, 0, 1, 0.8078431, 1,
-0.09692406, -0.4864254, -2.615422, 0, 1, 0.8156863, 1,
-0.09536612, 0.8944024, -0.8721433, 0, 1, 0.8196079, 1,
-0.09457771, 1.256775, 0.1050196, 0, 1, 0.827451, 1,
-0.09428398, -1.083647, -4.204765, 0, 1, 0.8313726, 1,
-0.09275632, 0.2736602, 0.312791, 0, 1, 0.8392157, 1,
-0.09153051, -0.1094487, -2.260081, 0, 1, 0.8431373, 1,
-0.08998682, 0.4095106, -0.932488, 0, 1, 0.8509804, 1,
-0.08882598, -0.5381772, -2.952342, 0, 1, 0.854902, 1,
-0.08857803, -0.5281829, -2.38533, 0, 1, 0.8627451, 1,
-0.08772258, -1.132547, -4.11073, 0, 1, 0.8666667, 1,
-0.08741749, 0.7004115, -0.2036877, 0, 1, 0.8745098, 1,
-0.08228242, -1.684524, -2.87996, 0, 1, 0.8784314, 1,
-0.07287356, 0.9707165, -2.155524, 0, 1, 0.8862745, 1,
-0.06950599, 1.130281, 0.2998739, 0, 1, 0.8901961, 1,
-0.06614153, 0.8277174, -0.5766184, 0, 1, 0.8980392, 1,
-0.06468814, 0.3750338, -0.5576713, 0, 1, 0.9058824, 1,
-0.0605006, -0.7523528, -3.621555, 0, 1, 0.9098039, 1,
-0.06045485, -1.831281, -1.511523, 0, 1, 0.9176471, 1,
-0.05831131, -2.21611, -3.932403, 0, 1, 0.9215686, 1,
-0.05610304, 0.1328813, 1.762488, 0, 1, 0.9294118, 1,
-0.05360289, -0.3559044, -3.25578, 0, 1, 0.9333333, 1,
-0.05299774, 0.5157219, -2.023175, 0, 1, 0.9411765, 1,
-0.0524118, 0.06034791, -1.332824, 0, 1, 0.945098, 1,
-0.05212391, 1.24041, 1.002526, 0, 1, 0.9529412, 1,
-0.05065418, -0.534787, -3.4884, 0, 1, 0.9568627, 1,
-0.0495124, 0.07089057, -0.8696243, 0, 1, 0.9647059, 1,
-0.04666049, 0.7698626, -0.3102015, 0, 1, 0.9686275, 1,
-0.04513377, 1.153531, -2.06074, 0, 1, 0.9764706, 1,
-0.04438469, 0.232174, 0.3443135, 0, 1, 0.9803922, 1,
-0.04273676, -1.369797, -2.197581, 0, 1, 0.9882353, 1,
-0.04268974, -0.2234563, -2.078463, 0, 1, 0.9921569, 1,
-0.04192361, 1.179742, -0.7653795, 0, 1, 1, 1,
-0.04120766, -1.085529, -2.307495, 0, 0.9921569, 1, 1,
-0.04106569, -0.1833975, -3.513619, 0, 0.9882353, 1, 1,
-0.0401029, -0.158375, -2.217615, 0, 0.9803922, 1, 1,
-0.03980457, 0.2227922, -0.7110348, 0, 0.9764706, 1, 1,
-0.03550352, -1.401618, -2.135115, 0, 0.9686275, 1, 1,
-0.03242043, -1.308653, -2.905296, 0, 0.9647059, 1, 1,
-0.03195833, 0.6703171, -0.5598214, 0, 0.9568627, 1, 1,
-0.02734274, -2.046618, -3.737233, 0, 0.9529412, 1, 1,
-0.02364906, -1.760654, -6.143527, 0, 0.945098, 1, 1,
-0.02339046, -0.04626534, -3.680676, 0, 0.9411765, 1, 1,
-0.02265009, 0.8862833, 0.02743963, 0, 0.9333333, 1, 1,
-0.01334005, -1.036534, -2.504178, 0, 0.9294118, 1, 1,
-0.01224606, -1.317458, -2.539593, 0, 0.9215686, 1, 1,
-0.009384454, 0.9402038, 0.1479175, 0, 0.9176471, 1, 1,
-0.007544167, 0.5925363, -0.3130617, 0, 0.9098039, 1, 1,
-0.003409092, 0.8445532, -1.669647, 0, 0.9058824, 1, 1,
-0.002800761, -0.8399606, -3.124777, 0, 0.8980392, 1, 1,
7.804808e-05, -1.249225, 1.699812, 0, 0.8901961, 1, 1,
0.002593508, -0.8121704, 1.644307, 0, 0.8862745, 1, 1,
0.002876397, 0.1195358, -1.22467, 0, 0.8784314, 1, 1,
0.004955004, -0.8813127, 1.069571, 0, 0.8745098, 1, 1,
0.007955917, 0.729327, -0.7904319, 0, 0.8666667, 1, 1,
0.01437173, 0.1450019, 0.186598, 0, 0.8627451, 1, 1,
0.01532441, 0.1403161, 0.2642722, 0, 0.854902, 1, 1,
0.01908903, 1.664526, 2.420397, 0, 0.8509804, 1, 1,
0.01945039, -0.5038441, 2.870686, 0, 0.8431373, 1, 1,
0.02018261, -0.325538, 1.889835, 0, 0.8392157, 1, 1,
0.02199819, -0.5162709, 3.362474, 0, 0.8313726, 1, 1,
0.02410306, -1.433788, 3.508353, 0, 0.827451, 1, 1,
0.0405686, -1.813661, 4.092658, 0, 0.8196079, 1, 1,
0.04130255, -0.3256773, 3.185017, 0, 0.8156863, 1, 1,
0.0430169, 1.558042, 0.1819646, 0, 0.8078431, 1, 1,
0.0479394, 0.6389875, 1.013923, 0, 0.8039216, 1, 1,
0.04846869, -1.139495, 3.478928, 0, 0.7960784, 1, 1,
0.05431388, -0.2091065, 3.330907, 0, 0.7882353, 1, 1,
0.05447812, 0.3235879, 0.03755961, 0, 0.7843137, 1, 1,
0.06897986, -1.284416, 3.090049, 0, 0.7764706, 1, 1,
0.06899352, 0.9510658, -0.2458903, 0, 0.772549, 1, 1,
0.07389589, 1.15452, -1.003406, 0, 0.7647059, 1, 1,
0.07979616, 0.08458771, 0.8491542, 0, 0.7607843, 1, 1,
0.08145636, -1.217974, 1.739044, 0, 0.7529412, 1, 1,
0.08229111, 0.109965, 0.8463234, 0, 0.7490196, 1, 1,
0.08434216, -0.5432234, 3.157273, 0, 0.7411765, 1, 1,
0.08579482, 0.1259446, 0.9337327, 0, 0.7372549, 1, 1,
0.0862434, 0.940999, 2.600128, 0, 0.7294118, 1, 1,
0.08910204, -1.095386, 3.275148, 0, 0.7254902, 1, 1,
0.09475684, -0.1760101, 2.768363, 0, 0.7176471, 1, 1,
0.095678, 0.02234492, 0.02779388, 0, 0.7137255, 1, 1,
0.1076807, 0.3560401, 0.09480239, 0, 0.7058824, 1, 1,
0.1081025, -1.564266, 1.73231, 0, 0.6980392, 1, 1,
0.1096364, -1.610939, 3.198399, 0, 0.6941177, 1, 1,
0.1116677, -0.8257478, 1.706655, 0, 0.6862745, 1, 1,
0.1122817, -1.895968, 1.921735, 0, 0.682353, 1, 1,
0.114507, -0.1425039, 2.135504, 0, 0.6745098, 1, 1,
0.1202427, -1.27016, 3.554343, 0, 0.6705883, 1, 1,
0.120921, 0.6274189, -0.371491, 0, 0.6627451, 1, 1,
0.1209392, 0.8172985, 0.9156429, 0, 0.6588235, 1, 1,
0.1214322, -0.560104, 2.289421, 0, 0.6509804, 1, 1,
0.122734, -1.340693, 2.27307, 0, 0.6470588, 1, 1,
0.1235418, -0.2662441, 1.782532, 0, 0.6392157, 1, 1,
0.129315, -0.1811618, 5.598385, 0, 0.6352941, 1, 1,
0.1307924, 0.7935358, -0.7944734, 0, 0.627451, 1, 1,
0.1309559, 2.229283, -0.9415548, 0, 0.6235294, 1, 1,
0.1310697, -0.07658137, 1.276341, 0, 0.6156863, 1, 1,
0.1324958, 0.1542042, 0.4559327, 0, 0.6117647, 1, 1,
0.1366292, 1.043579, -0.1469324, 0, 0.6039216, 1, 1,
0.1425305, -2.80159, 3.542056, 0, 0.5960785, 1, 1,
0.1431869, -0.8648019, 1.766443, 0, 0.5921569, 1, 1,
0.144347, 1.569623, -0.4496526, 0, 0.5843138, 1, 1,
0.144748, 0.3719321, 1.722253, 0, 0.5803922, 1, 1,
0.1449472, -0.1444489, 3.128414, 0, 0.572549, 1, 1,
0.1471267, 0.6679086, -1.038406, 0, 0.5686275, 1, 1,
0.1478917, 1.112898, 0.2254163, 0, 0.5607843, 1, 1,
0.1482533, -0.01473072, 0.5150591, 0, 0.5568628, 1, 1,
0.1544178, 0.1168828, 2.019062, 0, 0.5490196, 1, 1,
0.1589859, 0.5570274, -0.5852644, 0, 0.5450981, 1, 1,
0.1608161, 0.2142584, 1.286878, 0, 0.5372549, 1, 1,
0.1656967, 0.2010678, 0.2817435, 0, 0.5333334, 1, 1,
0.1676701, -0.8285639, 0.5637622, 0, 0.5254902, 1, 1,
0.1681261, -0.4297704, 4.097221, 0, 0.5215687, 1, 1,
0.1705701, 0.09376669, 0.7515512, 0, 0.5137255, 1, 1,
0.1723825, -0.3861132, 3.660747, 0, 0.509804, 1, 1,
0.1726453, 0.1520094, 0.9033932, 0, 0.5019608, 1, 1,
0.1762317, 0.5671121, -0.279931, 0, 0.4941176, 1, 1,
0.1785285, -1.02682, 1.950292, 0, 0.4901961, 1, 1,
0.1816605, -0.4599089, 2.949748, 0, 0.4823529, 1, 1,
0.1835327, 0.2796261, -0.2500322, 0, 0.4784314, 1, 1,
0.1835787, -0.6369852, 3.158013, 0, 0.4705882, 1, 1,
0.183644, -1.611538, 1.733445, 0, 0.4666667, 1, 1,
0.1865416, -0.7577185, 5.089549, 0, 0.4588235, 1, 1,
0.187194, -0.7170874, 2.459332, 0, 0.454902, 1, 1,
0.1888167, 0.01983527, 1.135348, 0, 0.4470588, 1, 1,
0.192581, -0.5771177, 3.211177, 0, 0.4431373, 1, 1,
0.1943133, 0.2875964, -0.02596061, 0, 0.4352941, 1, 1,
0.1954736, 0.03093052, 1.072353, 0, 0.4313726, 1, 1,
0.1957602, -0.5651675, 1.868622, 0, 0.4235294, 1, 1,
0.1965419, 1.64772, -1.544373, 0, 0.4196078, 1, 1,
0.2012902, -0.6953606, 1.351407, 0, 0.4117647, 1, 1,
0.205006, 0.2567907, 1.266428, 0, 0.4078431, 1, 1,
0.2142353, -1.053201, 2.450227, 0, 0.4, 1, 1,
0.2162236, 0.4037238, 1.043864, 0, 0.3921569, 1, 1,
0.2217238, 1.437654, -0.785099, 0, 0.3882353, 1, 1,
0.224181, 1.859503, 1.677866, 0, 0.3803922, 1, 1,
0.2250357, -1.122202, 1.971171, 0, 0.3764706, 1, 1,
0.2290537, 0.2467611, 0.3157199, 0, 0.3686275, 1, 1,
0.2293864, 0.7755994, 0.08939599, 0, 0.3647059, 1, 1,
0.2299739, -1.44377, 2.561078, 0, 0.3568628, 1, 1,
0.2324879, 2.163475, 2.339014, 0, 0.3529412, 1, 1,
0.2369859, -0.1007262, -0.3069788, 0, 0.345098, 1, 1,
0.2370692, 1.185723, -1.344278, 0, 0.3411765, 1, 1,
0.2427491, 0.78769, 0.9040632, 0, 0.3333333, 1, 1,
0.2428443, 0.8690826, -0.2735177, 0, 0.3294118, 1, 1,
0.244721, -0.4427095, 2.961805, 0, 0.3215686, 1, 1,
0.2453043, 0.6109335, 0.08832357, 0, 0.3176471, 1, 1,
0.2463374, -0.2751246, 1.851523, 0, 0.3098039, 1, 1,
0.2488041, -2.550525, 2.260971, 0, 0.3058824, 1, 1,
0.2525763, 0.9616888, 3.018634, 0, 0.2980392, 1, 1,
0.2557062, 1.040579, 0.4100588, 0, 0.2901961, 1, 1,
0.2563579, 1.672235, -1.683995, 0, 0.2862745, 1, 1,
0.2589164, 0.6990157, 1.192631, 0, 0.2784314, 1, 1,
0.2597837, -0.215379, 3.409782, 0, 0.2745098, 1, 1,
0.2608541, -2.238758, 1.323396, 0, 0.2666667, 1, 1,
0.2676656, -0.7153429, 1.684144, 0, 0.2627451, 1, 1,
0.2682559, 0.3503779, -1.006955, 0, 0.254902, 1, 1,
0.2683034, 1.538335, -0.8948126, 0, 0.2509804, 1, 1,
0.2692982, -0.533675, 2.559908, 0, 0.2431373, 1, 1,
0.2714399, -1.099301, 3.793788, 0, 0.2392157, 1, 1,
0.2720364, -1.166018, 3.950244, 0, 0.2313726, 1, 1,
0.2764073, 1.458244, -0.3168599, 0, 0.227451, 1, 1,
0.2769227, -1.127551, 3.442966, 0, 0.2196078, 1, 1,
0.2783752, 0.7524056, -0.7955856, 0, 0.2156863, 1, 1,
0.2787566, -0.4380204, 2.082825, 0, 0.2078431, 1, 1,
0.28045, -0.3693831, 1.254088, 0, 0.2039216, 1, 1,
0.2809552, -1.449198, 3.417662, 0, 0.1960784, 1, 1,
0.2818445, 0.7775121, -0.3228105, 0, 0.1882353, 1, 1,
0.2859231, 0.4789189, -2.028748, 0, 0.1843137, 1, 1,
0.2907734, 0.528797, 1.526065, 0, 0.1764706, 1, 1,
0.2956927, 0.01233867, 0.9380279, 0, 0.172549, 1, 1,
0.2963157, 1.204067, 0.06682175, 0, 0.1647059, 1, 1,
0.2971375, 1.52852, -1.248178, 0, 0.1607843, 1, 1,
0.2972059, 0.587522, -0.2723394, 0, 0.1529412, 1, 1,
0.3030635, 0.7420249, -0.8678991, 0, 0.1490196, 1, 1,
0.3038892, 0.614674, 0.2866843, 0, 0.1411765, 1, 1,
0.3040778, -0.08504396, 3.187385, 0, 0.1372549, 1, 1,
0.3050428, -0.2551989, 3.362312, 0, 0.1294118, 1, 1,
0.3057702, -0.007796065, 2.343071, 0, 0.1254902, 1, 1,
0.3088402, -1.955804, 3.575195, 0, 0.1176471, 1, 1,
0.3134135, -1.428084, 3.360955, 0, 0.1137255, 1, 1,
0.3141316, -0.008835514, 2.602439, 0, 0.1058824, 1, 1,
0.3153849, -0.8478677, 4.095858, 0, 0.09803922, 1, 1,
0.3255534, -0.7059984, 3.201378, 0, 0.09411765, 1, 1,
0.3270738, 1.68905, -0.03452068, 0, 0.08627451, 1, 1,
0.3303611, -1.513708, 2.567671, 0, 0.08235294, 1, 1,
0.3309217, -0.475385, 3.108428, 0, 0.07450981, 1, 1,
0.3330286, -0.2190374, 3.677625, 0, 0.07058824, 1, 1,
0.3346477, 0.6314039, 0.7404957, 0, 0.0627451, 1, 1,
0.343298, -0.04428886, 1.114536, 0, 0.05882353, 1, 1,
0.3475201, -0.9769462, 2.552575, 0, 0.05098039, 1, 1,
0.3545451, -0.6115515, 1.744305, 0, 0.04705882, 1, 1,
0.3548282, 0.7972853, 0.004852138, 0, 0.03921569, 1, 1,
0.3551695, 1.690311, 1.056123, 0, 0.03529412, 1, 1,
0.358969, 0.7696882, 1.202361, 0, 0.02745098, 1, 1,
0.3612888, 1.593872, 1.244756, 0, 0.02352941, 1, 1,
0.3691074, 0.2123983, 1.54993, 0, 0.01568628, 1, 1,
0.3730673, -0.1039597, 0.8245685, 0, 0.01176471, 1, 1,
0.3818572, 0.191667, 0.5380483, 0, 0.003921569, 1, 1,
0.386759, -0.001841011, 1.335947, 0.003921569, 0, 1, 1,
0.3889609, -0.8289883, 2.810264, 0.007843138, 0, 1, 1,
0.3905335, 1.003104, 0.1960378, 0.01568628, 0, 1, 1,
0.3920378, -1.715135, 4.030262, 0.01960784, 0, 1, 1,
0.3947537, -2.625306, 2.006975, 0.02745098, 0, 1, 1,
0.400581, -1.563403, 3.977461, 0.03137255, 0, 1, 1,
0.4088751, -0.7727506, 2.922816, 0.03921569, 0, 1, 1,
0.4148637, 0.8542054, 0.3965756, 0.04313726, 0, 1, 1,
0.4151025, 1.184252, 0.9121925, 0.05098039, 0, 1, 1,
0.4157878, -0.8308173, 1.937878, 0.05490196, 0, 1, 1,
0.4175787, -0.8643828, 2.351127, 0.0627451, 0, 1, 1,
0.4190016, 0.2908638, 1.86777, 0.06666667, 0, 1, 1,
0.4225175, -0.5683595, 2.00341, 0.07450981, 0, 1, 1,
0.4240232, 1.638987, 0.3110801, 0.07843138, 0, 1, 1,
0.4241796, -1.013788, 2.771605, 0.08627451, 0, 1, 1,
0.4242337, -0.7058342, 2.257476, 0.09019608, 0, 1, 1,
0.425011, 0.8583413, 0.2488773, 0.09803922, 0, 1, 1,
0.4267655, -0.2801549, 2.171497, 0.1058824, 0, 1, 1,
0.4304232, 0.5333387, 1.410522, 0.1098039, 0, 1, 1,
0.4337577, 2.931216, 0.5882443, 0.1176471, 0, 1, 1,
0.4373755, -2.128299, 2.992655, 0.1215686, 0, 1, 1,
0.4421727, 0.0122336, -0.217926, 0.1294118, 0, 1, 1,
0.4423442, -1.019767, 5.381032, 0.1333333, 0, 1, 1,
0.4476066, 2.50755, 0.9243217, 0.1411765, 0, 1, 1,
0.4515753, 0.5373952, -1.408215, 0.145098, 0, 1, 1,
0.4523973, -0.7240127, 1.887803, 0.1529412, 0, 1, 1,
0.4570993, 0.08257534, 0.9435163, 0.1568628, 0, 1, 1,
0.4612129, -0.7912449, 2.395964, 0.1647059, 0, 1, 1,
0.4622489, 0.9492214, -0.05272419, 0.1686275, 0, 1, 1,
0.4703504, 1.43175, -0.02170436, 0.1764706, 0, 1, 1,
0.4722254, 0.5677681, 1.176795, 0.1803922, 0, 1, 1,
0.4733708, 0.6139614, 0.8177075, 0.1882353, 0, 1, 1,
0.4801996, 2.280937, 0.1995462, 0.1921569, 0, 1, 1,
0.4826905, 0.1722822, 2.605112, 0.2, 0, 1, 1,
0.486968, 0.04399838, 3.233751, 0.2078431, 0, 1, 1,
0.48862, -2.463525, 2.763066, 0.2117647, 0, 1, 1,
0.4907387, 0.5686872, 1.270647, 0.2196078, 0, 1, 1,
0.4927256, 0.234862, 1.949976, 0.2235294, 0, 1, 1,
0.4932569, -0.2862375, 1.430007, 0.2313726, 0, 1, 1,
0.4980679, 1.508956, 1.093238, 0.2352941, 0, 1, 1,
0.4990599, 0.398862, -0.3122344, 0.2431373, 0, 1, 1,
0.5066459, -1.5568, 2.082475, 0.2470588, 0, 1, 1,
0.5070017, 1.278897, -0.07614707, 0.254902, 0, 1, 1,
0.5104077, 0.4613422, 1.542541, 0.2588235, 0, 1, 1,
0.5114956, 1.042846, 0.3681938, 0.2666667, 0, 1, 1,
0.5218621, -0.6627462, 3.515838, 0.2705882, 0, 1, 1,
0.5239511, 0.2545352, 0.7198355, 0.2784314, 0, 1, 1,
0.5279022, -0.6045145, 2.713869, 0.282353, 0, 1, 1,
0.5303988, 0.8492458, 0.8263169, 0.2901961, 0, 1, 1,
0.5325229, 1.447112, 1.957275, 0.2941177, 0, 1, 1,
0.5333742, -0.5067441, 1.526995, 0.3019608, 0, 1, 1,
0.5347356, 0.3688153, 2.75448, 0.3098039, 0, 1, 1,
0.5428329, -0.402494, 1.447792, 0.3137255, 0, 1, 1,
0.5457408, -0.6253298, 1.36262, 0.3215686, 0, 1, 1,
0.5496884, -0.2640142, 1.800372, 0.3254902, 0, 1, 1,
0.5552897, 1.156239, 0.8588702, 0.3333333, 0, 1, 1,
0.5555334, -0.9805924, 2.00726, 0.3372549, 0, 1, 1,
0.5574316, 0.2808917, 0.388492, 0.345098, 0, 1, 1,
0.558619, -0.08239129, -0.1853622, 0.3490196, 0, 1, 1,
0.5603161, -0.7519777, 3.538743, 0.3568628, 0, 1, 1,
0.5694922, 0.8641283, 0.2756011, 0.3607843, 0, 1, 1,
0.5747324, -1.257738, 1.43717, 0.3686275, 0, 1, 1,
0.5810212, -0.3443578, 0.1152631, 0.372549, 0, 1, 1,
0.5864979, -0.7134591, 2.33294, 0.3803922, 0, 1, 1,
0.5877142, 0.9163683, 0.2422192, 0.3843137, 0, 1, 1,
0.5880698, 0.6722603, 1.24762, 0.3921569, 0, 1, 1,
0.5887381, 0.743497, 0.7204996, 0.3960784, 0, 1, 1,
0.5984871, 0.9500799, 2.023547, 0.4039216, 0, 1, 1,
0.6002393, 0.3345651, 0.3126558, 0.4117647, 0, 1, 1,
0.6048244, -0.5711274, 1.562833, 0.4156863, 0, 1, 1,
0.6051631, -0.4462768, 3.719215, 0.4235294, 0, 1, 1,
0.6081586, 2.080037, -0.1189289, 0.427451, 0, 1, 1,
0.6082547, -2.978198, 1.441779, 0.4352941, 0, 1, 1,
0.6097775, 0.8555163, -1.316965, 0.4392157, 0, 1, 1,
0.6102679, -0.9605563, 3.164106, 0.4470588, 0, 1, 1,
0.6121511, -0.9060627, 2.578108, 0.4509804, 0, 1, 1,
0.613035, 0.6132495, 3.83801, 0.4588235, 0, 1, 1,
0.6174927, -0.4424888, 0.4553048, 0.4627451, 0, 1, 1,
0.6202545, -1.27482, 3.039875, 0.4705882, 0, 1, 1,
0.622501, 0.9496846, 1.31441, 0.4745098, 0, 1, 1,
0.6278586, 1.015382, 1.32915, 0.4823529, 0, 1, 1,
0.6355962, -0.2125842, -1.014543, 0.4862745, 0, 1, 1,
0.6389317, 0.1877839, 0.1729694, 0.4941176, 0, 1, 1,
0.6400849, 0.436367, 0.591763, 0.5019608, 0, 1, 1,
0.6461366, 0.8618491, 0.4576711, 0.5058824, 0, 1, 1,
0.6519749, -1.028449, 1.67699, 0.5137255, 0, 1, 1,
0.6594946, -0.1441155, 2.457579, 0.5176471, 0, 1, 1,
0.6647586, -0.0649678, 0.6504945, 0.5254902, 0, 1, 1,
0.669477, -0.1422705, 2.671412, 0.5294118, 0, 1, 1,
0.6719937, -0.4526373, 3.02715, 0.5372549, 0, 1, 1,
0.6757399, 0.2082574, 0.7839367, 0.5411765, 0, 1, 1,
0.6841702, -1.051091, 3.725349, 0.5490196, 0, 1, 1,
0.6854312, 0.6748013, 1.132936, 0.5529412, 0, 1, 1,
0.6884562, 1.182159, 0.1951938, 0.5607843, 0, 1, 1,
0.6884609, -0.3544503, 2.352243, 0.5647059, 0, 1, 1,
0.6890444, 0.6793345, 0.9931344, 0.572549, 0, 1, 1,
0.6897098, -1.129753, 3.548071, 0.5764706, 0, 1, 1,
0.6927562, -0.06174689, 2.77369, 0.5843138, 0, 1, 1,
0.7041554, -1.889739, 3.258075, 0.5882353, 0, 1, 1,
0.7045492, -0.1782569, 1.74402, 0.5960785, 0, 1, 1,
0.704914, 1.857477, 1.257225, 0.6039216, 0, 1, 1,
0.7099643, 0.7008092, 1.220406, 0.6078432, 0, 1, 1,
0.7100232, -0.9062271, 3.46422, 0.6156863, 0, 1, 1,
0.7106181, -0.9753417, 0.1243258, 0.6196079, 0, 1, 1,
0.7164357, -1.454568, 3.682709, 0.627451, 0, 1, 1,
0.7193199, -0.6290886, 1.089683, 0.6313726, 0, 1, 1,
0.7194102, 1.970006, -0.0548887, 0.6392157, 0, 1, 1,
0.7203165, -1.461323, 0.7966784, 0.6431373, 0, 1, 1,
0.725261, 0.8638758, 1.004189, 0.6509804, 0, 1, 1,
0.7271681, 0.5758411, 1.400506, 0.654902, 0, 1, 1,
0.7337773, 1.905855, 1.53764, 0.6627451, 0, 1, 1,
0.7360619, -0.7473632, 2.6813, 0.6666667, 0, 1, 1,
0.7375427, 0.5701379, 1.288133, 0.6745098, 0, 1, 1,
0.7406777, 0.6763525, 0.8644728, 0.6784314, 0, 1, 1,
0.7407146, 0.3476315, -0.6015382, 0.6862745, 0, 1, 1,
0.7409352, 0.05758612, 0.9451383, 0.6901961, 0, 1, 1,
0.7412918, -0.5739185, 3.338215, 0.6980392, 0, 1, 1,
0.7416966, -1.116129, 2.763086, 0.7058824, 0, 1, 1,
0.7424738, -0.05080516, 0.6364031, 0.7098039, 0, 1, 1,
0.7473602, 0.1861217, 1.890539, 0.7176471, 0, 1, 1,
0.7550873, 0.1219826, 1.430734, 0.7215686, 0, 1, 1,
0.7582515, 0.2369449, 0.1222582, 0.7294118, 0, 1, 1,
0.7614893, 0.530237, 1.569156, 0.7333333, 0, 1, 1,
0.7663249, 0.5495691, 2.091475, 0.7411765, 0, 1, 1,
0.7670398, -0.6144088, 2.30537, 0.7450981, 0, 1, 1,
0.7763807, -0.8229201, 2.11519, 0.7529412, 0, 1, 1,
0.7790995, -0.7904425, 1.336125, 0.7568628, 0, 1, 1,
0.7811043, -0.0007525224, 4.121084, 0.7647059, 0, 1, 1,
0.7814839, 0.349658, 0.8691054, 0.7686275, 0, 1, 1,
0.7822168, 1.103255, 2.357453, 0.7764706, 0, 1, 1,
0.784759, -1.309081, 1.594312, 0.7803922, 0, 1, 1,
0.7852792, -1.032289, 0.6342309, 0.7882353, 0, 1, 1,
0.7918964, 0.05870396, 2.768136, 0.7921569, 0, 1, 1,
0.7953139, 0.6430833, -0.01547432, 0.8, 0, 1, 1,
0.7955794, 0.4655945, -0.09225864, 0.8078431, 0, 1, 1,
0.7956104, 0.2841125, 1.749431, 0.8117647, 0, 1, 1,
0.8054371, 0.3334236, 0.171004, 0.8196079, 0, 1, 1,
0.8065321, -2.539392, 1.480499, 0.8235294, 0, 1, 1,
0.806544, -1.288964, 3.739655, 0.8313726, 0, 1, 1,
0.8143983, -1.994735, 3.987789, 0.8352941, 0, 1, 1,
0.8156096, -0.6144676, -0.007847187, 0.8431373, 0, 1, 1,
0.8161919, -0.3298023, 2.687886, 0.8470588, 0, 1, 1,
0.8191885, 0.619872, 0.6639695, 0.854902, 0, 1, 1,
0.8222954, -1.732067, 2.592881, 0.8588235, 0, 1, 1,
0.8261751, -1.628495, 3.86027, 0.8666667, 0, 1, 1,
0.8276646, 1.205856, 0.7167683, 0.8705882, 0, 1, 1,
0.828002, 0.5881699, 0.6865962, 0.8784314, 0, 1, 1,
0.8311884, 0.4943188, 2.240519, 0.8823529, 0, 1, 1,
0.83556, -0.01291751, 2.722818, 0.8901961, 0, 1, 1,
0.8390148, 1.253259, 1.788188, 0.8941177, 0, 1, 1,
0.8393651, -1.356081, 1.260867, 0.9019608, 0, 1, 1,
0.8467032, 1.28769, 1.328228, 0.9098039, 0, 1, 1,
0.850732, -0.004497207, 1.461032, 0.9137255, 0, 1, 1,
0.8544939, -0.8290809, 1.815212, 0.9215686, 0, 1, 1,
0.8558095, -1.011218, 2.148152, 0.9254902, 0, 1, 1,
0.8572513, 1.392512, -0.005785414, 0.9333333, 0, 1, 1,
0.859888, -1.106642, 3.194304, 0.9372549, 0, 1, 1,
0.8602139, 0.1274611, 2.863915, 0.945098, 0, 1, 1,
0.8653186, 2.335289, 0.9000188, 0.9490196, 0, 1, 1,
0.8662173, -0.7996284, 1.206478, 0.9568627, 0, 1, 1,
0.8786075, 0.178121, 1.431986, 0.9607843, 0, 1, 1,
0.8824503, 0.3900481, 0.5067879, 0.9686275, 0, 1, 1,
0.8918307, -0.7158008, 1.710016, 0.972549, 0, 1, 1,
0.892403, -0.8117149, 1.754782, 0.9803922, 0, 1, 1,
0.8952811, -0.5196633, 3.771574, 0.9843137, 0, 1, 1,
0.8991385, 0.4053831, 1.054725, 0.9921569, 0, 1, 1,
0.9004011, 0.5637816, 0.5107537, 0.9960784, 0, 1, 1,
0.9103759, 0.1846215, 0.09043722, 1, 0, 0.9960784, 1,
0.9186206, -1.868844, 0.1351318, 1, 0, 0.9882353, 1,
0.9195465, -0.5689219, 1.262312, 1, 0, 0.9843137, 1,
0.9245511, -0.07347887, 1.70721, 1, 0, 0.9764706, 1,
0.9250277, 1.292687, -0.08290909, 1, 0, 0.972549, 1,
0.929104, -1.435725, 3.301379, 1, 0, 0.9647059, 1,
0.9427414, 0.3145905, 0.381126, 1, 0, 0.9607843, 1,
0.9432299, -0.8991806, 2.022535, 1, 0, 0.9529412, 1,
0.9597015, 2.047627, -2.140295, 1, 0, 0.9490196, 1,
0.9677913, 0.2378891, 0.8401997, 1, 0, 0.9411765, 1,
0.9690234, 0.5746305, 1.485209, 1, 0, 0.9372549, 1,
0.9694107, 0.5914031, 1.444433, 1, 0, 0.9294118, 1,
0.9738456, -0.8630341, 2.259821, 1, 0, 0.9254902, 1,
0.9761076, 0.1379709, 0.4692436, 1, 0, 0.9176471, 1,
0.9773013, -2.839309, 4.503992, 1, 0, 0.9137255, 1,
0.9779117, -1.077363, 2.58368, 1, 0, 0.9058824, 1,
0.9779308, 0.3168826, 0.1704252, 1, 0, 0.9019608, 1,
0.9820755, 0.2749168, -0.05556053, 1, 0, 0.8941177, 1,
0.9848486, -0.2422708, 2.186515, 1, 0, 0.8862745, 1,
0.9854342, -1.210575, 2.103359, 1, 0, 0.8823529, 1,
0.9928505, -2.303178, 3.098453, 1, 0, 0.8745098, 1,
1.00048, 0.6711632, 2.118087, 1, 0, 0.8705882, 1,
1.002594, -0.845193, 3.015064, 1, 0, 0.8627451, 1,
1.006532, -0.8884021, 0.9871159, 1, 0, 0.8588235, 1,
1.014633, -1.315361, 2.182116, 1, 0, 0.8509804, 1,
1.040722, 0.4157289, 1.133679, 1, 0, 0.8470588, 1,
1.042682, 0.8278486, 0.5585612, 1, 0, 0.8392157, 1,
1.043119, -0.6945353, 0.3661876, 1, 0, 0.8352941, 1,
1.049166, 1.274403, 0.1009176, 1, 0, 0.827451, 1,
1.057705, -0.5446101, 2.549835, 1, 0, 0.8235294, 1,
1.060364, 0.7839526, 0.4495686, 1, 0, 0.8156863, 1,
1.065698, -1.615117, 2.176112, 1, 0, 0.8117647, 1,
1.066967, 0.3851478, 2.344689, 1, 0, 0.8039216, 1,
1.072493, -0.3518227, 2.372885, 1, 0, 0.7960784, 1,
1.07431, 1.215331, 0.5831501, 1, 0, 0.7921569, 1,
1.080816, -0.07851173, 1.7794, 1, 0, 0.7843137, 1,
1.08881, 1.583405, -0.4971081, 1, 0, 0.7803922, 1,
1.094003, 0.9723625, -0.2780853, 1, 0, 0.772549, 1,
1.095113, 0.2773209, 2.819778, 1, 0, 0.7686275, 1,
1.099821, 0.2204833, 1.071162, 1, 0, 0.7607843, 1,
1.104214, -0.5491644, 3.074661, 1, 0, 0.7568628, 1,
1.11138, 0.4823341, 0.7403453, 1, 0, 0.7490196, 1,
1.12862, -0.3423297, 0.7384742, 1, 0, 0.7450981, 1,
1.13174, -1.864813, 2.440743, 1, 0, 0.7372549, 1,
1.134614, 0.05295248, 0.8316557, 1, 0, 0.7333333, 1,
1.141757, -0.5968444, 0.9516144, 1, 0, 0.7254902, 1,
1.142493, -0.6968769, 2.025125, 1, 0, 0.7215686, 1,
1.160216, -0.3994927, 0.935869, 1, 0, 0.7137255, 1,
1.160857, -0.4458445, 2.41056, 1, 0, 0.7098039, 1,
1.162609, -1.384051, 1.320927, 1, 0, 0.7019608, 1,
1.169587, -0.8091386, 1.737334, 1, 0, 0.6941177, 1,
1.17101, -1.122001, 1.796393, 1, 0, 0.6901961, 1,
1.172751, 0.3846657, 1.268875, 1, 0, 0.682353, 1,
1.187777, 0.04476072, 1.020691, 1, 0, 0.6784314, 1,
1.189643, -0.9163415, 4.481954, 1, 0, 0.6705883, 1,
1.193487, -0.05052464, 2.552998, 1, 0, 0.6666667, 1,
1.198619, 1.954858, 0.5259361, 1, 0, 0.6588235, 1,
1.199538, 1.478699, -0.4472532, 1, 0, 0.654902, 1,
1.20635, 0.5495393, 1.39685, 1, 0, 0.6470588, 1,
1.207898, -0.4961414, 0.9170682, 1, 0, 0.6431373, 1,
1.209056, 0.2780243, 1.654082, 1, 0, 0.6352941, 1,
1.224663, -0.1818625, 2.077144, 1, 0, 0.6313726, 1,
1.224725, -0.7251909, 1.301586, 1, 0, 0.6235294, 1,
1.235295, -1.183697, 0.4810185, 1, 0, 0.6196079, 1,
1.236386, -0.2284864, 2.065692, 1, 0, 0.6117647, 1,
1.23725, -0.02161843, 1.73591, 1, 0, 0.6078432, 1,
1.23784, 0.226192, 1.922666, 1, 0, 0.6, 1,
1.238311, 1.185513, 0.9982675, 1, 0, 0.5921569, 1,
1.240162, -1.483956, 1.461753, 1, 0, 0.5882353, 1,
1.250418, -2.050907, 3.512619, 1, 0, 0.5803922, 1,
1.260143, 0.4809508, 0.1389549, 1, 0, 0.5764706, 1,
1.263705, 0.4626659, 1.547254, 1, 0, 0.5686275, 1,
1.274128, 1.761453, 0.2574031, 1, 0, 0.5647059, 1,
1.275841, 1.008574, -1.077027, 1, 0, 0.5568628, 1,
1.276795, 0.6657798, -0.2877464, 1, 0, 0.5529412, 1,
1.278858, -0.9807544, 0.5361372, 1, 0, 0.5450981, 1,
1.280874, 0.06620266, 2.334243, 1, 0, 0.5411765, 1,
1.28599, -0.6919984, -0.4206257, 1, 0, 0.5333334, 1,
1.308105, -0.2961952, 3.354053, 1, 0, 0.5294118, 1,
1.308218, 0.886101, 1.958183, 1, 0, 0.5215687, 1,
1.315225, -0.9257523, 1.903803, 1, 0, 0.5176471, 1,
1.318666, 2.113899, 0.2593951, 1, 0, 0.509804, 1,
1.323541, 2.128629, 1.3234, 1, 0, 0.5058824, 1,
1.332423, 0.6613557, 2.593302, 1, 0, 0.4980392, 1,
1.337486, 2.278551, -0.315546, 1, 0, 0.4901961, 1,
1.337826, 0.9490362, 0.4057913, 1, 0, 0.4862745, 1,
1.346435, 2.460838, 0.9992077, 1, 0, 0.4784314, 1,
1.37577, 1.273309, 0.09609903, 1, 0, 0.4745098, 1,
1.379626, 1.087111, 0.9368309, 1, 0, 0.4666667, 1,
1.382751, -0.9478456, 1.306158, 1, 0, 0.4627451, 1,
1.385191, 0.1087848, 3.349863, 1, 0, 0.454902, 1,
1.398935, -1.032236, 1.409322, 1, 0, 0.4509804, 1,
1.401458, -2.15309, 2.242153, 1, 0, 0.4431373, 1,
1.410477, 1.216979, 0.525908, 1, 0, 0.4392157, 1,
1.414917, -2.087617, 2.007266, 1, 0, 0.4313726, 1,
1.420556, -1.464184, 1.799263, 1, 0, 0.427451, 1,
1.431188, 0.6219475, 1.274045, 1, 0, 0.4196078, 1,
1.433512, -0.247292, 2.905306, 1, 0, 0.4156863, 1,
1.435159, -0.6208231, 1.406394, 1, 0, 0.4078431, 1,
1.441889, 0.3146764, 0.98353, 1, 0, 0.4039216, 1,
1.447112, 1.648736, 1.913112, 1, 0, 0.3960784, 1,
1.472304, 0.2379888, 2.879499, 1, 0, 0.3882353, 1,
1.477299, -1.890515, 3.599332, 1, 0, 0.3843137, 1,
1.4789, 0.7983382, 0.8379582, 1, 0, 0.3764706, 1,
1.479661, 1.41251, -1.438871, 1, 0, 0.372549, 1,
1.485258, -0.2041386, 1.230499, 1, 0, 0.3647059, 1,
1.485729, 0.1051504, -0.6560794, 1, 0, 0.3607843, 1,
1.494842, -0.3530844, 2.679319, 1, 0, 0.3529412, 1,
1.501474, -0.1244893, 1.652693, 1, 0, 0.3490196, 1,
1.514236, -0.01204277, 1.929265, 1, 0, 0.3411765, 1,
1.53281, 0.02054394, 2.020796, 1, 0, 0.3372549, 1,
1.546021, -0.712734, 0.7119064, 1, 0, 0.3294118, 1,
1.56769, 0.5545436, 1.36715, 1, 0, 0.3254902, 1,
1.576496, -0.6825549, 1.394705, 1, 0, 0.3176471, 1,
1.578731, -0.6101213, 1.746829, 1, 0, 0.3137255, 1,
1.593601, -0.8125995, 2.378253, 1, 0, 0.3058824, 1,
1.615368, 1.294168, 0.2826239, 1, 0, 0.2980392, 1,
1.674519, -0.09618455, 1.037745, 1, 0, 0.2941177, 1,
1.703151, -0.7736204, 1.71183, 1, 0, 0.2862745, 1,
1.708835, 1.883656, 0.6957314, 1, 0, 0.282353, 1,
1.717761, 0.6791301, 1.967317, 1, 0, 0.2745098, 1,
1.718733, 0.1118473, 0.9988627, 1, 0, 0.2705882, 1,
1.720266, -0.5216474, 1.388916, 1, 0, 0.2627451, 1,
1.748416, 1.839915, -0.1529409, 1, 0, 0.2588235, 1,
1.758174, 0.541043, 1.728526, 1, 0, 0.2509804, 1,
1.763208, -0.9754322, 2.795622, 1, 0, 0.2470588, 1,
1.767616, -1.11801, 1.2495, 1, 0, 0.2392157, 1,
1.772048, 1.077113, 1.575561, 1, 0, 0.2352941, 1,
1.783103, 0.5049418, -1.044379, 1, 0, 0.227451, 1,
1.793305, -0.7705379, 3.352378, 1, 0, 0.2235294, 1,
1.798956, 1.569751, -1.510373, 1, 0, 0.2156863, 1,
1.803883, -2.03891, 1.908306, 1, 0, 0.2117647, 1,
1.803946, 1.701409, 0.327876, 1, 0, 0.2039216, 1,
1.80643, 0.9931134, 2.539977, 1, 0, 0.1960784, 1,
1.875601, -0.4886876, 1.777327, 1, 0, 0.1921569, 1,
1.880621, 0.7022693, 1.535127, 1, 0, 0.1843137, 1,
1.895526, 1.368351, 1.638845, 1, 0, 0.1803922, 1,
1.900528, 1.022148, 2.705765, 1, 0, 0.172549, 1,
1.926973, -0.4157578, 1.150295, 1, 0, 0.1686275, 1,
1.955425, 0.5496227, 1.45243, 1, 0, 0.1607843, 1,
1.95818, -1.175983, 1.997488, 1, 0, 0.1568628, 1,
1.987227, 0.7392715, 1.090237, 1, 0, 0.1490196, 1,
1.997921, -0.01537392, 1.796174, 1, 0, 0.145098, 1,
2.044164, -0.8415791, 3.422556, 1, 0, 0.1372549, 1,
2.092953, -0.5726424, 0.7954796, 1, 0, 0.1333333, 1,
2.125161, -1.676212, 1.527156, 1, 0, 0.1254902, 1,
2.134997, -1.113122, 0.6066369, 1, 0, 0.1215686, 1,
2.13921, 0.6954355, 0.5469043, 1, 0, 0.1137255, 1,
2.141135, -1.04565, 1.678103, 1, 0, 0.1098039, 1,
2.165542, -0.08817285, 0.8279402, 1, 0, 0.1019608, 1,
2.170601, 0.3489141, 1.029551, 1, 0, 0.09411765, 1,
2.171544, 2.980468, -1.212554, 1, 0, 0.09019608, 1,
2.176143, -0.4448754, 1.504394, 1, 0, 0.08235294, 1,
2.253344, 0.09992631, 2.8131, 1, 0, 0.07843138, 1,
2.259507, 0.1359741, 1.475514, 1, 0, 0.07058824, 1,
2.27932, 0.6186588, 1.590027, 1, 0, 0.06666667, 1,
2.308942, -0.2572586, 3.363241, 1, 0, 0.05882353, 1,
2.415499, -1.624449, 3.944799, 1, 0, 0.05490196, 1,
2.422543, 0.4166483, -0.565146, 1, 0, 0.04705882, 1,
2.486473, -0.9898505, 2.050751, 1, 0, 0.04313726, 1,
2.52476, 1.074036, 2.442465, 1, 0, 0.03529412, 1,
2.652739, 0.2696612, 1.919882, 1, 0, 0.03137255, 1,
2.766187, -0.6110322, 0.2923539, 1, 0, 0.02352941, 1,
2.873531, -0.2322848, 0.9683409, 1, 0, 0.01960784, 1,
3.18652, -0.309219, 1.567059, 1, 0, 0.01176471, 1,
3.262366, 1.589134, 0.4278041, 1, 0, 0.007843138, 1
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
-0.03531098, -4.175169, -8.133781, 0, -0.5, 0.5, 0.5,
-0.03531098, -4.175169, -8.133781, 1, -0.5, 0.5, 0.5,
-0.03531098, -4.175169, -8.133781, 1, 1.5, 0.5, 0.5,
-0.03531098, -4.175169, -8.133781, 0, 1.5, 0.5, 0.5
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
-4.4509, -0.0788039, -8.133781, 0, -0.5, 0.5, 0.5,
-4.4509, -0.0788039, -8.133781, 1, -0.5, 0.5, 0.5,
-4.4509, -0.0788039, -8.133781, 1, 1.5, 0.5, 0.5,
-4.4509, -0.0788039, -8.133781, 0, 1.5, 0.5, 0.5
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
-4.4509, -4.175169, -0.2725708, 0, -0.5, 0.5, 0.5,
-4.4509, -4.175169, -0.2725708, 1, -0.5, 0.5, 0.5,
-4.4509, -4.175169, -0.2725708, 1, 1.5, 0.5, 0.5,
-4.4509, -4.175169, -0.2725708, 0, 1.5, 0.5, 0.5
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
-3, -3.229854, -6.319656,
3, -3.229854, -6.319656,
-3, -3.229854, -6.319656,
-3, -3.387407, -6.62201,
-2, -3.229854, -6.319656,
-2, -3.387407, -6.62201,
-1, -3.229854, -6.319656,
-1, -3.387407, -6.62201,
0, -3.229854, -6.319656,
0, -3.387407, -6.62201,
1, -3.229854, -6.319656,
1, -3.387407, -6.62201,
2, -3.229854, -6.319656,
2, -3.387407, -6.62201,
3, -3.229854, -6.319656,
3, -3.387407, -6.62201
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
-3, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
-3, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
-3, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
-3, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5,
-2, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
-2, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
-2, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
-2, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5,
-1, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
-1, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
-1, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
-1, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5,
0, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
0, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
0, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
0, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5,
1, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
1, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
1, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
1, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5,
2, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
2, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
2, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
2, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5,
3, -3.702512, -7.226718, 0, -0.5, 0.5, 0.5,
3, -3.702512, -7.226718, 1, -0.5, 0.5, 0.5,
3, -3.702512, -7.226718, 1, 1.5, 0.5, 0.5,
3, -3.702512, -7.226718, 0, 1.5, 0.5, 0.5
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
-3.431918, -3, -6.319656,
-3.431918, 2, -6.319656,
-3.431918, -3, -6.319656,
-3.601748, -3, -6.62201,
-3.431918, -2, -6.319656,
-3.601748, -2, -6.62201,
-3.431918, -1, -6.319656,
-3.601748, -1, -6.62201,
-3.431918, 0, -6.319656,
-3.601748, 0, -6.62201,
-3.431918, 1, -6.319656,
-3.601748, 1, -6.62201,
-3.431918, 2, -6.319656,
-3.601748, 2, -6.62201
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
-3.941409, -3, -7.226718, 0, -0.5, 0.5, 0.5,
-3.941409, -3, -7.226718, 1, -0.5, 0.5, 0.5,
-3.941409, -3, -7.226718, 1, 1.5, 0.5, 0.5,
-3.941409, -3, -7.226718, 0, 1.5, 0.5, 0.5,
-3.941409, -2, -7.226718, 0, -0.5, 0.5, 0.5,
-3.941409, -2, -7.226718, 1, -0.5, 0.5, 0.5,
-3.941409, -2, -7.226718, 1, 1.5, 0.5, 0.5,
-3.941409, -2, -7.226718, 0, 1.5, 0.5, 0.5,
-3.941409, -1, -7.226718, 0, -0.5, 0.5, 0.5,
-3.941409, -1, -7.226718, 1, -0.5, 0.5, 0.5,
-3.941409, -1, -7.226718, 1, 1.5, 0.5, 0.5,
-3.941409, -1, -7.226718, 0, 1.5, 0.5, 0.5,
-3.941409, 0, -7.226718, 0, -0.5, 0.5, 0.5,
-3.941409, 0, -7.226718, 1, -0.5, 0.5, 0.5,
-3.941409, 0, -7.226718, 1, 1.5, 0.5, 0.5,
-3.941409, 0, -7.226718, 0, 1.5, 0.5, 0.5,
-3.941409, 1, -7.226718, 0, -0.5, 0.5, 0.5,
-3.941409, 1, -7.226718, 1, -0.5, 0.5, 0.5,
-3.941409, 1, -7.226718, 1, 1.5, 0.5, 0.5,
-3.941409, 1, -7.226718, 0, 1.5, 0.5, 0.5,
-3.941409, 2, -7.226718, 0, -0.5, 0.5, 0.5,
-3.941409, 2, -7.226718, 1, -0.5, 0.5, 0.5,
-3.941409, 2, -7.226718, 1, 1.5, 0.5, 0.5,
-3.941409, 2, -7.226718, 0, 1.5, 0.5, 0.5
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
-3.431918, -3.229854, -6,
-3.431918, -3.229854, 4,
-3.431918, -3.229854, -6,
-3.601748, -3.387407, -6,
-3.431918, -3.229854, -4,
-3.601748, -3.387407, -4,
-3.431918, -3.229854, -2,
-3.601748, -3.387407, -2,
-3.431918, -3.229854, 0,
-3.601748, -3.387407, 0,
-3.431918, -3.229854, 2,
-3.601748, -3.387407, 2,
-3.431918, -3.229854, 4,
-3.601748, -3.387407, 4
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
-3.941409, -3.702512, -6, 0, -0.5, 0.5, 0.5,
-3.941409, -3.702512, -6, 1, -0.5, 0.5, 0.5,
-3.941409, -3.702512, -6, 1, 1.5, 0.5, 0.5,
-3.941409, -3.702512, -6, 0, 1.5, 0.5, 0.5,
-3.941409, -3.702512, -4, 0, -0.5, 0.5, 0.5,
-3.941409, -3.702512, -4, 1, -0.5, 0.5, 0.5,
-3.941409, -3.702512, -4, 1, 1.5, 0.5, 0.5,
-3.941409, -3.702512, -4, 0, 1.5, 0.5, 0.5,
-3.941409, -3.702512, -2, 0, -0.5, 0.5, 0.5,
-3.941409, -3.702512, -2, 1, -0.5, 0.5, 0.5,
-3.941409, -3.702512, -2, 1, 1.5, 0.5, 0.5,
-3.941409, -3.702512, -2, 0, 1.5, 0.5, 0.5,
-3.941409, -3.702512, 0, 0, -0.5, 0.5, 0.5,
-3.941409, -3.702512, 0, 1, -0.5, 0.5, 0.5,
-3.941409, -3.702512, 0, 1, 1.5, 0.5, 0.5,
-3.941409, -3.702512, 0, 0, 1.5, 0.5, 0.5,
-3.941409, -3.702512, 2, 0, -0.5, 0.5, 0.5,
-3.941409, -3.702512, 2, 1, -0.5, 0.5, 0.5,
-3.941409, -3.702512, 2, 1, 1.5, 0.5, 0.5,
-3.941409, -3.702512, 2, 0, 1.5, 0.5, 0.5,
-3.941409, -3.702512, 4, 0, -0.5, 0.5, 0.5,
-3.941409, -3.702512, 4, 1, -0.5, 0.5, 0.5,
-3.941409, -3.702512, 4, 1, 1.5, 0.5, 0.5,
-3.941409, -3.702512, 4, 0, 1.5, 0.5, 0.5
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
-3.431918, -3.229854, -6.319656,
-3.431918, 3.072246, -6.319656,
-3.431918, -3.229854, 5.774514,
-3.431918, 3.072246, 5.774514,
-3.431918, -3.229854, -6.319656,
-3.431918, -3.229854, 5.774514,
-3.431918, 3.072246, -6.319656,
-3.431918, 3.072246, 5.774514,
-3.431918, -3.229854, -6.319656,
3.361296, -3.229854, -6.319656,
-3.431918, -3.229854, 5.774514,
3.361296, -3.229854, 5.774514,
-3.431918, 3.072246, -6.319656,
3.361296, 3.072246, -6.319656,
-3.431918, 3.072246, 5.774514,
3.361296, 3.072246, 5.774514,
3.361296, -3.229854, -6.319656,
3.361296, 3.072246, -6.319656,
3.361296, -3.229854, 5.774514,
3.361296, 3.072246, 5.774514,
3.361296, -3.229854, -6.319656,
3.361296, -3.229854, 5.774514,
3.361296, 3.072246, -6.319656,
3.361296, 3.072246, 5.774514
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
var radius = 8.135684;
var distance = 36.19657;
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
mvMatrix.translate( 0.03531098, 0.0788039, 0.2725708 );
mvMatrix.scale( 1.294889, 1.395798, 0.7273307 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.19657);
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
prothiofos<-read.table("prothiofos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prothiofos$V2
```

```
## Error in eval(expr, envir, enclos): object 'prothiofos' not found
```

```r
y<-prothiofos$V3
```

```
## Error in eval(expr, envir, enclos): object 'prothiofos' not found
```

```r
z<-prothiofos$V4
```

```
## Error in eval(expr, envir, enclos): object 'prothiofos' not found
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
-3.332988, -0.2165822, 0.2941142, 0, 0, 1, 1, 1,
-2.8426, 0.03787342, 0.009446478, 1, 0, 0, 1, 1,
-2.743436, -0.07471133, -1.517963, 1, 0, 0, 1, 1,
-2.735327, 0.2137068, -0.7422109, 1, 0, 0, 1, 1,
-2.647943, 0.03432246, -1.802812, 1, 0, 0, 1, 1,
-2.629904, 0.8098539, -1.937709, 1, 0, 0, 1, 1,
-2.624526, 2.232166, -1.674489, 0, 0, 0, 1, 1,
-2.595314, 0.8325858, -0.2822755, 0, 0, 0, 1, 1,
-2.536553, -1.92613, -1.83882, 0, 0, 0, 1, 1,
-2.400351, -0.628827, -1.902246, 0, 0, 0, 1, 1,
-2.376418, -2.099456, -1.142385, 0, 0, 0, 1, 1,
-2.374841, 0.5905687, -1.638069, 0, 0, 0, 1, 1,
-2.372741, -0.4952353, -2.191114, 0, 0, 0, 1, 1,
-2.364588, -0.06460509, -2.216719, 1, 1, 1, 1, 1,
-2.358505, -0.3378366, 0.9836032, 1, 1, 1, 1, 1,
-2.310759, -0.2315613, -2.469707, 1, 1, 1, 1, 1,
-2.2636, 0.1604349, -1.337002, 1, 1, 1, 1, 1,
-2.227336, -0.4804041, -1.995178, 1, 1, 1, 1, 1,
-2.209672, 0.4501136, -0.6666307, 1, 1, 1, 1, 1,
-2.101724, -0.03151892, -0.6270964, 1, 1, 1, 1, 1,
-2.100546, -0.04256282, -0.770828, 1, 1, 1, 1, 1,
-2.064159, 0.5870491, -2.161537, 1, 1, 1, 1, 1,
-2.063491, -1.835162, -3.018316, 1, 1, 1, 1, 1,
-1.99674, -1.471535, -3.710495, 1, 1, 1, 1, 1,
-1.989169, 0.2519711, -1.657948, 1, 1, 1, 1, 1,
-1.959722, 0.9460669, -1.170621, 1, 1, 1, 1, 1,
-1.948186, -0.5278911, -1.681503, 1, 1, 1, 1, 1,
-1.946538, -3.138076, -2.30638, 1, 1, 1, 1, 1,
-1.924981, -0.2979836, -0.9115227, 0, 0, 1, 1, 1,
-1.92384, -1.504988, -2.381094, 1, 0, 0, 1, 1,
-1.916031, 0.04769688, -1.832748, 1, 0, 0, 1, 1,
-1.915797, 0.2674743, -0.2818646, 1, 0, 0, 1, 1,
-1.879599, -0.3294005, -0.2814873, 1, 0, 0, 1, 1,
-1.86457, 0.1517463, 0.3425598, 1, 0, 0, 1, 1,
-1.841177, 0.8436037, -1.428637, 0, 0, 0, 1, 1,
-1.834165, 0.7814656, 0.489906, 0, 0, 0, 1, 1,
-1.833133, -1.991458, -4.071809, 0, 0, 0, 1, 1,
-1.814014, 0.930296, -0.4039801, 0, 0, 0, 1, 1,
-1.790132, 1.062609, 0.1478891, 0, 0, 0, 1, 1,
-1.779589, 0.8944562, -2.889633, 0, 0, 0, 1, 1,
-1.74725, 0.2860991, -0.5103449, 0, 0, 0, 1, 1,
-1.723207, -0.06313773, -1.680663, 1, 1, 1, 1, 1,
-1.698064, 0.2427261, -0.8832777, 1, 1, 1, 1, 1,
-1.695115, -0.5934852, -2.005939, 1, 1, 1, 1, 1,
-1.686788, -0.8611869, -2.146566, 1, 1, 1, 1, 1,
-1.672604, -0.5371745, -1.653448, 1, 1, 1, 1, 1,
-1.63897, -0.6550856, -1.541847, 1, 1, 1, 1, 1,
-1.628721, -0.7652022, -1.830869, 1, 1, 1, 1, 1,
-1.627474, 0.8707208, -2.745768, 1, 1, 1, 1, 1,
-1.627336, 0.05953262, -0.8220331, 1, 1, 1, 1, 1,
-1.625214, 0.1846836, -1.780052, 1, 1, 1, 1, 1,
-1.623152, 0.3487038, 0.1310317, 1, 1, 1, 1, 1,
-1.619835, -0.3045711, -1.883766, 1, 1, 1, 1, 1,
-1.614004, 0.003056275, -1.87858, 1, 1, 1, 1, 1,
-1.613874, -0.8314779, -3.755906, 1, 1, 1, 1, 1,
-1.598874, 0.5350714, -1.052785, 1, 1, 1, 1, 1,
-1.595992, -1.57772, -5.025789, 0, 0, 1, 1, 1,
-1.587345, -1.53928, -2.240303, 1, 0, 0, 1, 1,
-1.574931, 1.019813, -1.576803, 1, 0, 0, 1, 1,
-1.570034, -1.348011, -2.236294, 1, 0, 0, 1, 1,
-1.54935, -0.9111524, -2.625666, 1, 0, 0, 1, 1,
-1.53341, 0.7671179, -0.04973284, 1, 0, 0, 1, 1,
-1.528849, 0.5091791, -1.023613, 0, 0, 0, 1, 1,
-1.526543, -1.390425, -1.694834, 0, 0, 0, 1, 1,
-1.520649, 0.636659, -0.9922047, 0, 0, 0, 1, 1,
-1.513301, -0.3719665, -1.779081, 0, 0, 0, 1, 1,
-1.508624, -1.986312, -3.93895, 0, 0, 0, 1, 1,
-1.502551, 0.7894986, -0.8487128, 0, 0, 0, 1, 1,
-1.498937, -0.1771783, -0.6508866, 0, 0, 0, 1, 1,
-1.492581, -0.07811447, -1.852305, 1, 1, 1, 1, 1,
-1.491448, -0.917332, -1.575086, 1, 1, 1, 1, 1,
-1.491059, -0.006452523, -2.825898, 1, 1, 1, 1, 1,
-1.486714, 0.008121051, 0.460055, 1, 1, 1, 1, 1,
-1.482241, 0.8716229, -1.923704, 1, 1, 1, 1, 1,
-1.474101, 0.5116624, -1.470973, 1, 1, 1, 1, 1,
-1.460834, 1.085429, -1.894257, 1, 1, 1, 1, 1,
-1.448754, -0.4316816, -1.844347, 1, 1, 1, 1, 1,
-1.448511, -0.3536919, -0.7747685, 1, 1, 1, 1, 1,
-1.442988, 1.122534, -0.2285233, 1, 1, 1, 1, 1,
-1.434818, -0.7504861, -2.878248, 1, 1, 1, 1, 1,
-1.431482, -0.009779947, -1.339711, 1, 1, 1, 1, 1,
-1.430848, -0.4908635, -2.195477, 1, 1, 1, 1, 1,
-1.412412, -0.2248486, -0.9497044, 1, 1, 1, 1, 1,
-1.405059, -1.008718, -0.8643539, 1, 1, 1, 1, 1,
-1.402877, 0.4534489, -3.345904, 0, 0, 1, 1, 1,
-1.393824, -0.02757689, -2.867833, 1, 0, 0, 1, 1,
-1.391161, -0.05848687, -1.527283, 1, 0, 0, 1, 1,
-1.38643, 1.304421, -0.5734341, 1, 0, 0, 1, 1,
-1.38617, 1.148843, -2.569372, 1, 0, 0, 1, 1,
-1.385969, 0.4875778, -1.085461, 1, 0, 0, 1, 1,
-1.384752, -0.5231853, -0.8590108, 0, 0, 0, 1, 1,
-1.378994, -0.2425485, -0.3505773, 0, 0, 0, 1, 1,
-1.367873, -0.0787193, -0.214719, 0, 0, 0, 1, 1,
-1.356968, -0.2189764, -1.827424, 0, 0, 0, 1, 1,
-1.352569, 1.341958, 1.507273, 0, 0, 0, 1, 1,
-1.351114, 1.514288, -0.1050792, 0, 0, 0, 1, 1,
-1.344186, -0.2369878, -0.1831164, 0, 0, 0, 1, 1,
-1.339208, 0.7965396, -1.912149, 1, 1, 1, 1, 1,
-1.31147, -0.3970326, -1.745311, 1, 1, 1, 1, 1,
-1.306053, 1.110544, -0.1633459, 1, 1, 1, 1, 1,
-1.304557, -0.5204808, -2.012708, 1, 1, 1, 1, 1,
-1.302005, -1.422313, -1.757437, 1, 1, 1, 1, 1,
-1.295766, -2.11701, -1.996741, 1, 1, 1, 1, 1,
-1.290459, -0.5700911, -1.655076, 1, 1, 1, 1, 1,
-1.289498, 1.743222, 1.461144, 1, 1, 1, 1, 1,
-1.288597, -0.7931963, -1.190358, 1, 1, 1, 1, 1,
-1.286932, 1.289147, -0.6860595, 1, 1, 1, 1, 1,
-1.280164, -0.202776, -2.116264, 1, 1, 1, 1, 1,
-1.279469, 0.3023113, -0.8780363, 1, 1, 1, 1, 1,
-1.269128, -0.6787229, -2.451059, 1, 1, 1, 1, 1,
-1.264236, -1.375619, -2.406196, 1, 1, 1, 1, 1,
-1.260361, -0.6052322, -0.689011, 1, 1, 1, 1, 1,
-1.236674, -0.9665694, -1.181335, 0, 0, 1, 1, 1,
-1.230043, -0.07246596, -0.8758382, 1, 0, 0, 1, 1,
-1.229793, 1.746422, 0.8220271, 1, 0, 0, 1, 1,
-1.228916, -1.285389, -1.529096, 1, 0, 0, 1, 1,
-1.225159, -1.053805, -2.008955, 1, 0, 0, 1, 1,
-1.222425, 1.090761, -1.933303, 1, 0, 0, 1, 1,
-1.219005, 1.715124, -0.2161373, 0, 0, 0, 1, 1,
-1.216475, -0.2647296, -4.344928, 0, 0, 0, 1, 1,
-1.209128, -0.3261358, -2.601355, 0, 0, 0, 1, 1,
-1.207678, 0.9364646, -1.836965, 0, 0, 0, 1, 1,
-1.204331, 1.412458, 1.212425, 0, 0, 0, 1, 1,
-1.201829, 0.09517214, -1.812755, 0, 0, 0, 1, 1,
-1.197604, -0.1534973, -2.892793, 0, 0, 0, 1, 1,
-1.195685, -1.389757, -2.9077, 1, 1, 1, 1, 1,
-1.194166, -0.1254035, -2.356836, 1, 1, 1, 1, 1,
-1.184138, 0.6264173, 0.4753166, 1, 1, 1, 1, 1,
-1.179777, -1.011235, -1.088126, 1, 1, 1, 1, 1,
-1.177348, 0.5805561, -0.6377189, 1, 1, 1, 1, 1,
-1.174193, -1.176102, -2.61451, 1, 1, 1, 1, 1,
-1.167002, 1.136033, -1.289766, 1, 1, 1, 1, 1,
-1.162414, 0.4116349, -0.4279146, 1, 1, 1, 1, 1,
-1.15824, 0.8967774, -0.5307236, 1, 1, 1, 1, 1,
-1.150922, -0.5181056, -2.373998, 1, 1, 1, 1, 1,
-1.147944, -1.176923, -1.153481, 1, 1, 1, 1, 1,
-1.143056, -0.9394686, -2.24889, 1, 1, 1, 1, 1,
-1.139931, -0.6398729, -2.313461, 1, 1, 1, 1, 1,
-1.124853, -0.5325573, -0.5312513, 1, 1, 1, 1, 1,
-1.124618, -0.05070394, -0.4460583, 1, 1, 1, 1, 1,
-1.124581, 0.9799336, -1.758433, 0, 0, 1, 1, 1,
-1.121061, -0.3464082, -3.126355, 1, 0, 0, 1, 1,
-1.11937, -1.554359, -2.450439, 1, 0, 0, 1, 1,
-1.11816, 0.1069915, -2.037482, 1, 0, 0, 1, 1,
-1.11766, -0.8695883, -3.411971, 1, 0, 0, 1, 1,
-1.108761, -0.2857692, -1.902444, 1, 0, 0, 1, 1,
-1.108476, 0.9866887, -1.565437, 0, 0, 0, 1, 1,
-1.098503, -1.652567, -0.9691857, 0, 0, 0, 1, 1,
-1.094682, -0.527967, -0.8836718, 0, 0, 0, 1, 1,
-1.087048, 0.6917981, 0.1446804, 0, 0, 0, 1, 1,
-1.085795, 0.3315952, -0.7053943, 0, 0, 0, 1, 1,
-1.08149, -1.442913, -3.691244, 0, 0, 0, 1, 1,
-1.079165, -0.07992616, 0.3425612, 0, 0, 0, 1, 1,
-1.071279, -1.437467, -2.156266, 1, 1, 1, 1, 1,
-1.070757, -0.3732632, -2.506902, 1, 1, 1, 1, 1,
-1.070499, -0.4295885, -0.7632125, 1, 1, 1, 1, 1,
-1.067807, 0.3154458, -1.81047, 1, 1, 1, 1, 1,
-1.064895, -1.21622, -0.3707765, 1, 1, 1, 1, 1,
-1.064467, 0.3629371, -1.084495, 1, 1, 1, 1, 1,
-1.063521, 0.9049162, -2.109904, 1, 1, 1, 1, 1,
-1.057666, -0.5433447, -1.281708, 1, 1, 1, 1, 1,
-1.057573, 0.1573118, -2.219038, 1, 1, 1, 1, 1,
-1.055208, 1.23407, -1.404678, 1, 1, 1, 1, 1,
-1.052067, 0.02727017, -2.374577, 1, 1, 1, 1, 1,
-1.047044, -0.9607989, -2.906053, 1, 1, 1, 1, 1,
-1.046537, -0.06678923, -0.435951, 1, 1, 1, 1, 1,
-1.046533, -1.898667, -2.309393, 1, 1, 1, 1, 1,
-1.042104, 0.1181064, -1.791207, 1, 1, 1, 1, 1,
-1.040478, 0.8465528, -1.556925, 0, 0, 1, 1, 1,
-1.03872, -0.001156535, -0.7688996, 1, 0, 0, 1, 1,
-1.03771, 1.058116, -0.8600575, 1, 0, 0, 1, 1,
-1.036766, -0.1957861, -2.16284, 1, 0, 0, 1, 1,
-1.033489, 0.4119439, -2.044454, 1, 0, 0, 1, 1,
-1.012983, 1.256638, 0.8216575, 1, 0, 0, 1, 1,
-1.012117, 0.4242029, -0.07256696, 0, 0, 0, 1, 1,
-1.008193, -0.3348786, -1.742886, 0, 0, 0, 1, 1,
-1.007768, 0.5748585, -1.446813, 0, 0, 0, 1, 1,
-1.001822, -0.6989776, -1.782469, 0, 0, 0, 1, 1,
-0.9984857, -0.8920987, -0.3350362, 0, 0, 0, 1, 1,
-0.9981243, -0.412627, -3.603246, 0, 0, 0, 1, 1,
-0.9940892, 1.191572, -0.725897, 0, 0, 0, 1, 1,
-0.991409, 1.155713, -0.8340892, 1, 1, 1, 1, 1,
-0.9875428, -0.7486957, -2.969441, 1, 1, 1, 1, 1,
-0.9868145, -1.268171, -3.67216, 1, 1, 1, 1, 1,
-0.9742362, -1.020076, -1.744484, 1, 1, 1, 1, 1,
-0.9671863, -0.3519261, -1.44112, 1, 1, 1, 1, 1,
-0.9664788, 2.327229, -1.73175, 1, 1, 1, 1, 1,
-0.963066, 1.29457, -1.038028, 1, 1, 1, 1, 1,
-0.9628717, 0.3250777, -1.018901, 1, 1, 1, 1, 1,
-0.9608483, -0.3538527, -2.691782, 1, 1, 1, 1, 1,
-0.9447148, 0.4472699, -1.033523, 1, 1, 1, 1, 1,
-0.9424174, 0.8868847, 0.2395632, 1, 1, 1, 1, 1,
-0.9417053, -0.6079601, -1.979769, 1, 1, 1, 1, 1,
-0.931778, -0.7715059, -3.908085, 1, 1, 1, 1, 1,
-0.9302922, -0.9982601, -2.853512, 1, 1, 1, 1, 1,
-0.9301077, 1.087162, -0.01835515, 1, 1, 1, 1, 1,
-0.928861, -0.7193416, -2.762941, 0, 0, 1, 1, 1,
-0.9278674, -1.271328, -3.634529, 1, 0, 0, 1, 1,
-0.9135951, 0.05412242, -2.015793, 1, 0, 0, 1, 1,
-0.9124852, -0.04488999, -1.23314, 1, 0, 0, 1, 1,
-0.9098908, 0.3794007, -1.216685, 1, 0, 0, 1, 1,
-0.9061919, -1.432206, -2.982553, 1, 0, 0, 1, 1,
-0.9014004, 1.266899, -1.35243, 0, 0, 0, 1, 1,
-0.886937, 0.7792739, 0.1142443, 0, 0, 0, 1, 1,
-0.8835677, -0.1150085, 0.377887, 0, 0, 0, 1, 1,
-0.8822168, -2.004115, -2.857425, 0, 0, 0, 1, 1,
-0.8736593, 0.6060643, -1.826261, 0, 0, 0, 1, 1,
-0.8694868, -0.5204113, -4.039964, 0, 0, 0, 1, 1,
-0.8687207, 0.8765994, 0.6601802, 0, 0, 0, 1, 1,
-0.8677233, -0.7364965, -0.2594503, 1, 1, 1, 1, 1,
-0.8674187, 1.480895, -2.163405, 1, 1, 1, 1, 1,
-0.8647879, -0.05561622, -1.403648, 1, 1, 1, 1, 1,
-0.8580654, 0.8640624, -2.385813, 1, 1, 1, 1, 1,
-0.855985, 0.1930238, -0.07178055, 1, 1, 1, 1, 1,
-0.8558679, 0.0942638, -2.040685, 1, 1, 1, 1, 1,
-0.8521205, -0.456378, -3.499941, 1, 1, 1, 1, 1,
-0.8509043, 0.6567779, -1.617568, 1, 1, 1, 1, 1,
-0.8497921, -0.7202182, -3.366802, 1, 1, 1, 1, 1,
-0.8428842, 2.188908, -0.979623, 1, 1, 1, 1, 1,
-0.8424248, -0.2153771, -2.880865, 1, 1, 1, 1, 1,
-0.8388994, 1.091145, -1.198571, 1, 1, 1, 1, 1,
-0.8388876, -3.039779, -1.971981, 1, 1, 1, 1, 1,
-0.8374661, 1.355113, -0.24967, 1, 1, 1, 1, 1,
-0.8369197, -0.5611139, -1.5425, 1, 1, 1, 1, 1,
-0.8312941, -0.5250723, -1.716987, 0, 0, 1, 1, 1,
-0.8282991, -0.3433965, -1.739402, 1, 0, 0, 1, 1,
-0.8249012, 0.6629046, -1.0808, 1, 0, 0, 1, 1,
-0.823545, 0.7300835, 0.3439655, 1, 0, 0, 1, 1,
-0.8206753, -0.05141903, -1.932737, 1, 0, 0, 1, 1,
-0.8171999, 0.4726826, -1.605378, 1, 0, 0, 1, 1,
-0.816338, -0.0903739, -1.753842, 0, 0, 0, 1, 1,
-0.8149838, 2.194686, -0.1479148, 0, 0, 0, 1, 1,
-0.8106039, -0.9110254, -1.841884, 0, 0, 0, 1, 1,
-0.8048543, 0.4343077, -3.176987, 0, 0, 0, 1, 1,
-0.8031538, -0.3611464, -1.690508, 0, 0, 0, 1, 1,
-0.8021827, 0.3158001, -1.87249, 0, 0, 0, 1, 1,
-0.8004693, 1.28492, -0.8741012, 0, 0, 0, 1, 1,
-0.8003386, 0.5179481, -0.9632089, 1, 1, 1, 1, 1,
-0.7928941, 0.7104912, -0.06052896, 1, 1, 1, 1, 1,
-0.7920662, 0.4073302, -1.498112, 1, 1, 1, 1, 1,
-0.7846717, -0.1418254, -2.349058, 1, 1, 1, 1, 1,
-0.7801517, 0.4252447, -1.85426, 1, 1, 1, 1, 1,
-0.7798622, -0.657508, -3.770996, 1, 1, 1, 1, 1,
-0.7793095, 1.98942, -1.041897, 1, 1, 1, 1, 1,
-0.7786895, -0.6970654, -2.546915, 1, 1, 1, 1, 1,
-0.7744931, -1.959193, -1.974704, 1, 1, 1, 1, 1,
-0.773098, 0.7949511, -1.061199, 1, 1, 1, 1, 1,
-0.7706136, -0.6459123, -2.917921, 1, 1, 1, 1, 1,
-0.7690323, 1.278415, -1.022846, 1, 1, 1, 1, 1,
-0.7648548, -0.8421662, -1.955842, 1, 1, 1, 1, 1,
-0.76074, -0.145604, -1.27806, 1, 1, 1, 1, 1,
-0.7580477, -1.107497, -4.506302, 1, 1, 1, 1, 1,
-0.7575281, 0.8383058, 0.531674, 0, 0, 1, 1, 1,
-0.7571213, 0.9342786, -0.947185, 1, 0, 0, 1, 1,
-0.7522666, -0.03931013, -0.2131396, 1, 0, 0, 1, 1,
-0.7435797, 0.9284106, -0.8451855, 1, 0, 0, 1, 1,
-0.7430293, -1.510728, -2.182131, 1, 0, 0, 1, 1,
-0.7426077, -1.486597, -2.771582, 1, 0, 0, 1, 1,
-0.7415594, -0.6080611, -1.357357, 0, 0, 0, 1, 1,
-0.7409203, -0.2151689, -3.028432, 0, 0, 0, 1, 1,
-0.7390019, 0.2165773, -2.600457, 0, 0, 0, 1, 1,
-0.7328609, 0.7727557, -1.875811, 0, 0, 0, 1, 1,
-0.7231296, 0.52853, 0.8369715, 0, 0, 0, 1, 1,
-0.7228802, -0.4702599, -4.084572, 0, 0, 0, 1, 1,
-0.7138835, 0.4625692, -1.53657, 0, 0, 0, 1, 1,
-0.7085556, 0.9110338, -0.8705009, 1, 1, 1, 1, 1,
-0.7039189, 0.5030102, -0.4153096, 1, 1, 1, 1, 1,
-0.697207, 0.335633, 0.04926807, 1, 1, 1, 1, 1,
-0.6945505, -0.02950998, -0.5835501, 1, 1, 1, 1, 1,
-0.6939025, 0.2310821, -1.783026, 1, 1, 1, 1, 1,
-0.6938398, 0.3219385, -0.0384551, 1, 1, 1, 1, 1,
-0.6856892, 0.6814778, -1.191775, 1, 1, 1, 1, 1,
-0.6811209, 0.7447005, 0.1062647, 1, 1, 1, 1, 1,
-0.6793256, 1.392787, 1.181088, 1, 1, 1, 1, 1,
-0.6763564, 0.9961155, 0.3839004, 1, 1, 1, 1, 1,
-0.6679497, -0.7709553, -3.456858, 1, 1, 1, 1, 1,
-0.6571082, 1.201505, -0.8385974, 1, 1, 1, 1, 1,
-0.6569082, -0.01252491, -1.216941, 1, 1, 1, 1, 1,
-0.6568074, -0.1872507, -3.626906, 1, 1, 1, 1, 1,
-0.6543545, -1.697445, -2.918802, 1, 1, 1, 1, 1,
-0.6517987, 1.764975, -0.1253238, 0, 0, 1, 1, 1,
-0.6397823, -0.6432433, -2.703562, 1, 0, 0, 1, 1,
-0.6359568, 1.449613, -1.131605, 1, 0, 0, 1, 1,
-0.6321445, 0.1458233, -1.382843, 1, 0, 0, 1, 1,
-0.631689, -0.6054605, -1.020838, 1, 0, 0, 1, 1,
-0.6207638, 1.693334, -1.955807, 1, 0, 0, 1, 1,
-0.6141491, 0.1400185, -1.954786, 0, 0, 0, 1, 1,
-0.6092826, 0.08065737, -2.319656, 0, 0, 0, 1, 1,
-0.6036959, 0.7641951, -2.153252, 0, 0, 0, 1, 1,
-0.600288, 1.799526, 1.026481, 0, 0, 0, 1, 1,
-0.6000404, -0.8830101, -2.678075, 0, 0, 0, 1, 1,
-0.5976365, -0.03344822, -1.603217, 0, 0, 0, 1, 1,
-0.5936906, -0.08075671, -3.217685, 0, 0, 0, 1, 1,
-0.5934762, -1.727219, -3.980433, 1, 1, 1, 1, 1,
-0.5862268, -0.7643536, -4.966133, 1, 1, 1, 1, 1,
-0.5848019, -0.002483797, -3.08375, 1, 1, 1, 1, 1,
-0.5836805, 0.4662667, -2.083462, 1, 1, 1, 1, 1,
-0.5783037, 1.739852, 0.4789556, 1, 1, 1, 1, 1,
-0.5745459, 0.7309634, 2.630222, 1, 1, 1, 1, 1,
-0.5739678, -0.2017364, -1.886161, 1, 1, 1, 1, 1,
-0.572591, -1.756348, -3.039618, 1, 1, 1, 1, 1,
-0.5724477, -1.198769, -1.79862, 1, 1, 1, 1, 1,
-0.5714037, -1.549197, -4.06685, 1, 1, 1, 1, 1,
-0.5693372, -0.4468427, -3.087769, 1, 1, 1, 1, 1,
-0.5630848, -0.4931168, -0.8352829, 1, 1, 1, 1, 1,
-0.5615137, -1.337896, -0.4719912, 1, 1, 1, 1, 1,
-0.5569007, 0.4979057, -0.07348567, 1, 1, 1, 1, 1,
-0.5568899, -1.495432, -2.637688, 1, 1, 1, 1, 1,
-0.5516227, 2.729455, -0.1207333, 0, 0, 1, 1, 1,
-0.5503518, -0.1075365, -0.3610035, 1, 0, 0, 1, 1,
-0.5471207, 0.2551942, -0.7934874, 1, 0, 0, 1, 1,
-0.5463059, -1.95695, -3.586947, 1, 0, 0, 1, 1,
-0.5401646, 1.267222, -0.9876581, 1, 0, 0, 1, 1,
-0.5396551, -0.4549557, -2.902484, 1, 0, 0, 1, 1,
-0.5354347, -0.2688188, -2.165942, 0, 0, 0, 1, 1,
-0.5344576, 0.6567213, -1.063388, 0, 0, 0, 1, 1,
-0.5332401, 0.2216257, -2.833762, 0, 0, 0, 1, 1,
-0.527238, 0.1479283, -2.338359, 0, 0, 0, 1, 1,
-0.5234119, 0.9577311, -0.03888388, 0, 0, 0, 1, 1,
-0.5216361, 1.722279, 0.6507655, 0, 0, 0, 1, 1,
-0.5184748, 1.326979, 0.3921551, 0, 0, 0, 1, 1,
-0.5168894, -1.594233, -3.475221, 1, 1, 1, 1, 1,
-0.515231, 0.9253717, -0.7366408, 1, 1, 1, 1, 1,
-0.512502, 0.1754024, -0.4814884, 1, 1, 1, 1, 1,
-0.4980392, 2.371623, -1.379746, 1, 1, 1, 1, 1,
-0.4970001, 0.9419823, -0.9906849, 1, 1, 1, 1, 1,
-0.4940206, -0.3922475, -3.869673, 1, 1, 1, 1, 1,
-0.4935806, -0.9583923, -2.755557, 1, 1, 1, 1, 1,
-0.4920384, 0.4342042, -2.844001, 1, 1, 1, 1, 1,
-0.4917536, 0.6216364, -0.05209776, 1, 1, 1, 1, 1,
-0.4808572, -0.3255404, -1.345604, 1, 1, 1, 1, 1,
-0.4802372, 0.5608522, -0.6679947, 1, 1, 1, 1, 1,
-0.4795872, 0.7841418, 0.178138, 1, 1, 1, 1, 1,
-0.4731028, 0.2118394, 0.2841441, 1, 1, 1, 1, 1,
-0.4691752, -1.144747, -1.588774, 1, 1, 1, 1, 1,
-0.4680596, 0.4663617, -1.475789, 1, 1, 1, 1, 1,
-0.4613379, 0.4917769, -2.421879, 0, 0, 1, 1, 1,
-0.4577585, -0.3397497, -1.90143, 1, 0, 0, 1, 1,
-0.4512451, -0.1341959, -0.7876391, 1, 0, 0, 1, 1,
-0.4507785, 1.397952, -0.9578958, 1, 0, 0, 1, 1,
-0.449856, -0.3793824, -2.271102, 1, 0, 0, 1, 1,
-0.4481431, -0.8429303, -3.36494, 1, 0, 0, 1, 1,
-0.4428364, 0.06312449, -0.2067544, 0, 0, 0, 1, 1,
-0.4420881, -0.7914757, -2.558471, 0, 0, 0, 1, 1,
-0.4353597, -0.3776968, -1.489741, 0, 0, 0, 1, 1,
-0.434338, 0.888378, 0.1442405, 0, 0, 0, 1, 1,
-0.4311616, 0.5362343, 0.07845981, 0, 0, 0, 1, 1,
-0.4283925, -0.05955795, -2.257082, 0, 0, 0, 1, 1,
-0.4278609, 0.5653974, 0.7758074, 0, 0, 0, 1, 1,
-0.4276384, 0.02469459, -2.148409, 1, 1, 1, 1, 1,
-0.4238456, 2.699838, -0.02910209, 1, 1, 1, 1, 1,
-0.42336, 0.5420468, -0.2560393, 1, 1, 1, 1, 1,
-0.4204859, -0.593747, -2.372602, 1, 1, 1, 1, 1,
-0.4204231, -1.942993, -1.454707, 1, 1, 1, 1, 1,
-0.4195128, -0.6947498, -1.140911, 1, 1, 1, 1, 1,
-0.4191189, -1.139198, -3.016681, 1, 1, 1, 1, 1,
-0.4127533, -0.3389143, -2.17555, 1, 1, 1, 1, 1,
-0.4121748, -1.110052, -3.823026, 1, 1, 1, 1, 1,
-0.4116316, 0.6238146, 0.04424355, 1, 1, 1, 1, 1,
-0.4096663, 2.001582, -1.117206, 1, 1, 1, 1, 1,
-0.4092074, 0.181914, 0.2064592, 1, 1, 1, 1, 1,
-0.4062135, -0.03350369, -2.214328, 1, 1, 1, 1, 1,
-0.4029908, 0.4929566, -0.3158536, 1, 1, 1, 1, 1,
-0.3983024, -1.436149, -2.43199, 1, 1, 1, 1, 1,
-0.3947029, -0.3713035, -2.797208, 0, 0, 1, 1, 1,
-0.3939657, 0.6165506, -0.3092219, 1, 0, 0, 1, 1,
-0.3925169, 0.7670179, -0.7964135, 1, 0, 0, 1, 1,
-0.3879211, -1.067705, -3.335485, 1, 0, 0, 1, 1,
-0.384145, -0.4672125, -3.52901, 1, 0, 0, 1, 1,
-0.3829854, 0.7038409, -0.7841648, 1, 0, 0, 1, 1,
-0.3811722, -0.03368304, -0.9114567, 0, 0, 0, 1, 1,
-0.3810974, -1.010622, -2.522217, 0, 0, 0, 1, 1,
-0.3763099, 1.333909, -0.7289608, 0, 0, 0, 1, 1,
-0.3757069, -1.800689, -2.77965, 0, 0, 0, 1, 1,
-0.3705601, -0.04470322, -0.2439563, 0, 0, 0, 1, 1,
-0.3697766, -1.680729, -1.92895, 0, 0, 0, 1, 1,
-0.369702, 0.4670038, -0.08625957, 0, 0, 0, 1, 1,
-0.3674952, 0.530179, -0.3273009, 1, 1, 1, 1, 1,
-0.3604827, -1.331715, -3.248701, 1, 1, 1, 1, 1,
-0.354151, -1.595154, -2.937993, 1, 1, 1, 1, 1,
-0.3522579, -1.050949, -2.063961, 1, 1, 1, 1, 1,
-0.3509217, 0.4474863, 0.2659881, 1, 1, 1, 1, 1,
-0.3506219, 1.813369, -0.47877, 1, 1, 1, 1, 1,
-0.3504877, 0.1856013, -0.6182717, 1, 1, 1, 1, 1,
-0.3496147, -0.4701766, -2.105111, 1, 1, 1, 1, 1,
-0.3494146, 0.9712989, 0.5550383, 1, 1, 1, 1, 1,
-0.3493579, 0.9346341, 0.7511801, 1, 1, 1, 1, 1,
-0.3469398, -0.9691039, -4.017001, 1, 1, 1, 1, 1,
-0.3466791, 0.7069181, 1.283766, 1, 1, 1, 1, 1,
-0.3462983, -0.2734223, -3.932665, 1, 1, 1, 1, 1,
-0.3458883, -0.4651062, -3.710407, 1, 1, 1, 1, 1,
-0.3453383, 0.6321287, -0.5574453, 1, 1, 1, 1, 1,
-0.3452055, 1.176807, -2.895517, 0, 0, 1, 1, 1,
-0.3377555, 0.1283129, -0.8995345, 1, 0, 0, 1, 1,
-0.3366572, -0.8426867, -1.567092, 1, 0, 0, 1, 1,
-0.3358378, 0.7654627, -1.789569, 1, 0, 0, 1, 1,
-0.3330345, 0.9657476, 0.1158123, 1, 0, 0, 1, 1,
-0.3324613, 0.2449889, -1.673577, 1, 0, 0, 1, 1,
-0.3313983, -0.5119841, -4.513631, 0, 0, 0, 1, 1,
-0.3312871, -0.5031413, -3.490263, 0, 0, 0, 1, 1,
-0.324854, 0.6376249, -0.8563071, 0, 0, 0, 1, 1,
-0.3246119, 0.6879539, 0.98163, 0, 0, 0, 1, 1,
-0.3244684, -0.4710649, -2.452575, 0, 0, 0, 1, 1,
-0.321757, -1.210868, -2.740905, 0, 0, 0, 1, 1,
-0.3166279, -0.198599, -2.795211, 0, 0, 0, 1, 1,
-0.3145405, -0.223857, -3.088353, 1, 1, 1, 1, 1,
-0.3067437, -1.542718, -2.975514, 1, 1, 1, 1, 1,
-0.2926509, -0.9000334, -4.144104, 1, 1, 1, 1, 1,
-0.2896493, 0.9824764, 0.4073057, 1, 1, 1, 1, 1,
-0.2857403, -2.448125, -4.457587, 1, 1, 1, 1, 1,
-0.2808562, 0.0621975, -1.181418, 1, 1, 1, 1, 1,
-0.2757949, 2.019165, -1.303406, 1, 1, 1, 1, 1,
-0.2693118, -0.888881, -2.518565, 1, 1, 1, 1, 1,
-0.2657844, -0.7169318, -3.672076, 1, 1, 1, 1, 1,
-0.2641369, -0.4728992, -2.593755, 1, 1, 1, 1, 1,
-0.257948, 1.673408, -0.4018784, 1, 1, 1, 1, 1,
-0.2567733, -1.281603, -3.776023, 1, 1, 1, 1, 1,
-0.2524907, -0.1114242, -0.9717821, 1, 1, 1, 1, 1,
-0.2508699, -0.746533, -2.03891, 1, 1, 1, 1, 1,
-0.2492453, -1.24321, -3.884229, 1, 1, 1, 1, 1,
-0.2486531, 0.9252182, -0.2172714, 0, 0, 1, 1, 1,
-0.2486502, -1.887298, -2.901309, 1, 0, 0, 1, 1,
-0.2466739, -0.1075545, -1.359623, 1, 0, 0, 1, 1,
-0.2451974, -1.201687, -1.368059, 1, 0, 0, 1, 1,
-0.240484, 0.175494, 0.06183628, 1, 0, 0, 1, 1,
-0.2397884, -1.607857, -2.621227, 1, 0, 0, 1, 1,
-0.2375641, 0.3917807, -1.326675, 0, 0, 0, 1, 1,
-0.236408, 0.1562627, -1.732233, 0, 0, 0, 1, 1,
-0.2356034, 0.7478657, -1.932184, 0, 0, 0, 1, 1,
-0.2354236, -1.076563, -1.81507, 0, 0, 0, 1, 1,
-0.2343624, -0.2417014, -2.634398, 0, 0, 0, 1, 1,
-0.2339675, 0.05454468, -1.591637, 0, 0, 0, 1, 1,
-0.2317987, -0.1993901, -1.673421, 0, 0, 0, 1, 1,
-0.2313937, -1.698772, -4.23917, 1, 1, 1, 1, 1,
-0.2285061, -0.7595082, -3.615818, 1, 1, 1, 1, 1,
-0.22448, -0.02685759, -0.6116689, 1, 1, 1, 1, 1,
-0.2243619, -0.6066149, -3.130644, 1, 1, 1, 1, 1,
-0.2230741, 0.4068673, 0.9097436, 1, 1, 1, 1, 1,
-0.2069936, 0.6186565, -1.046893, 1, 1, 1, 1, 1,
-0.203747, 0.645845, 0.1943245, 1, 1, 1, 1, 1,
-0.2036036, -0.4462742, -2.657489, 1, 1, 1, 1, 1,
-0.2017203, 0.9327376, 0.8151776, 1, 1, 1, 1, 1,
-0.200481, 0.5248256, -1.127852, 1, 1, 1, 1, 1,
-0.1971582, 1.401174, 0.2828355, 1, 1, 1, 1, 1,
-0.1971496, 0.2370785, -0.5432807, 1, 1, 1, 1, 1,
-0.1911362, -1.331593, -3.91286, 1, 1, 1, 1, 1,
-0.1867835, -0.3687818, -2.679849, 1, 1, 1, 1, 1,
-0.18181, -0.2997907, -2.048966, 1, 1, 1, 1, 1,
-0.1781159, -0.457354, -4.047633, 0, 0, 1, 1, 1,
-0.1702905, -1.4745, -4.242689, 1, 0, 0, 1, 1,
-0.1686314, 0.7502649, -0.9218235, 1, 0, 0, 1, 1,
-0.167517, -1.225198, -2.294812, 1, 0, 0, 1, 1,
-0.1639559, -0.317685, -3.693641, 1, 0, 0, 1, 1,
-0.1554077, 1.04907, -0.04811123, 1, 0, 0, 1, 1,
-0.1485892, -0.06145777, -1.449064, 0, 0, 0, 1, 1,
-0.1439719, -0.451251, -3.893969, 0, 0, 0, 1, 1,
-0.1379359, -0.4346355, -3.607464, 0, 0, 0, 1, 1,
-0.133437, 1.589266, -1.612659, 0, 0, 0, 1, 1,
-0.1268714, 1.394042, 0.02207618, 0, 0, 0, 1, 1,
-0.12656, 1.126861, 1.855436, 0, 0, 0, 1, 1,
-0.1224427, 0.5821282, 0.03505449, 0, 0, 0, 1, 1,
-0.1211473, -0.5426469, -3.969399, 1, 1, 1, 1, 1,
-0.1210547, 0.3553993, -0.4829079, 1, 1, 1, 1, 1,
-0.1164519, -0.780659, -1.912436, 1, 1, 1, 1, 1,
-0.1114987, -1.580058, -2.490106, 1, 1, 1, 1, 1,
-0.1114604, 0.2259478, 1.428347, 1, 1, 1, 1, 1,
-0.1103031, -0.01620864, -1.197593, 1, 1, 1, 1, 1,
-0.09911362, 0.5657995, 0.9589902, 1, 1, 1, 1, 1,
-0.09812149, 0.02261548, -2.814197, 1, 1, 1, 1, 1,
-0.09692406, -0.4864254, -2.615422, 1, 1, 1, 1, 1,
-0.09536612, 0.8944024, -0.8721433, 1, 1, 1, 1, 1,
-0.09457771, 1.256775, 0.1050196, 1, 1, 1, 1, 1,
-0.09428398, -1.083647, -4.204765, 1, 1, 1, 1, 1,
-0.09275632, 0.2736602, 0.312791, 1, 1, 1, 1, 1,
-0.09153051, -0.1094487, -2.260081, 1, 1, 1, 1, 1,
-0.08998682, 0.4095106, -0.932488, 1, 1, 1, 1, 1,
-0.08882598, -0.5381772, -2.952342, 0, 0, 1, 1, 1,
-0.08857803, -0.5281829, -2.38533, 1, 0, 0, 1, 1,
-0.08772258, -1.132547, -4.11073, 1, 0, 0, 1, 1,
-0.08741749, 0.7004115, -0.2036877, 1, 0, 0, 1, 1,
-0.08228242, -1.684524, -2.87996, 1, 0, 0, 1, 1,
-0.07287356, 0.9707165, -2.155524, 1, 0, 0, 1, 1,
-0.06950599, 1.130281, 0.2998739, 0, 0, 0, 1, 1,
-0.06614153, 0.8277174, -0.5766184, 0, 0, 0, 1, 1,
-0.06468814, 0.3750338, -0.5576713, 0, 0, 0, 1, 1,
-0.0605006, -0.7523528, -3.621555, 0, 0, 0, 1, 1,
-0.06045485, -1.831281, -1.511523, 0, 0, 0, 1, 1,
-0.05831131, -2.21611, -3.932403, 0, 0, 0, 1, 1,
-0.05610304, 0.1328813, 1.762488, 0, 0, 0, 1, 1,
-0.05360289, -0.3559044, -3.25578, 1, 1, 1, 1, 1,
-0.05299774, 0.5157219, -2.023175, 1, 1, 1, 1, 1,
-0.0524118, 0.06034791, -1.332824, 1, 1, 1, 1, 1,
-0.05212391, 1.24041, 1.002526, 1, 1, 1, 1, 1,
-0.05065418, -0.534787, -3.4884, 1, 1, 1, 1, 1,
-0.0495124, 0.07089057, -0.8696243, 1, 1, 1, 1, 1,
-0.04666049, 0.7698626, -0.3102015, 1, 1, 1, 1, 1,
-0.04513377, 1.153531, -2.06074, 1, 1, 1, 1, 1,
-0.04438469, 0.232174, 0.3443135, 1, 1, 1, 1, 1,
-0.04273676, -1.369797, -2.197581, 1, 1, 1, 1, 1,
-0.04268974, -0.2234563, -2.078463, 1, 1, 1, 1, 1,
-0.04192361, 1.179742, -0.7653795, 1, 1, 1, 1, 1,
-0.04120766, -1.085529, -2.307495, 1, 1, 1, 1, 1,
-0.04106569, -0.1833975, -3.513619, 1, 1, 1, 1, 1,
-0.0401029, -0.158375, -2.217615, 1, 1, 1, 1, 1,
-0.03980457, 0.2227922, -0.7110348, 0, 0, 1, 1, 1,
-0.03550352, -1.401618, -2.135115, 1, 0, 0, 1, 1,
-0.03242043, -1.308653, -2.905296, 1, 0, 0, 1, 1,
-0.03195833, 0.6703171, -0.5598214, 1, 0, 0, 1, 1,
-0.02734274, -2.046618, -3.737233, 1, 0, 0, 1, 1,
-0.02364906, -1.760654, -6.143527, 1, 0, 0, 1, 1,
-0.02339046, -0.04626534, -3.680676, 0, 0, 0, 1, 1,
-0.02265009, 0.8862833, 0.02743963, 0, 0, 0, 1, 1,
-0.01334005, -1.036534, -2.504178, 0, 0, 0, 1, 1,
-0.01224606, -1.317458, -2.539593, 0, 0, 0, 1, 1,
-0.009384454, 0.9402038, 0.1479175, 0, 0, 0, 1, 1,
-0.007544167, 0.5925363, -0.3130617, 0, 0, 0, 1, 1,
-0.003409092, 0.8445532, -1.669647, 0, 0, 0, 1, 1,
-0.002800761, -0.8399606, -3.124777, 1, 1, 1, 1, 1,
7.804808e-05, -1.249225, 1.699812, 1, 1, 1, 1, 1,
0.002593508, -0.8121704, 1.644307, 1, 1, 1, 1, 1,
0.002876397, 0.1195358, -1.22467, 1, 1, 1, 1, 1,
0.004955004, -0.8813127, 1.069571, 1, 1, 1, 1, 1,
0.007955917, 0.729327, -0.7904319, 1, 1, 1, 1, 1,
0.01437173, 0.1450019, 0.186598, 1, 1, 1, 1, 1,
0.01532441, 0.1403161, 0.2642722, 1, 1, 1, 1, 1,
0.01908903, 1.664526, 2.420397, 1, 1, 1, 1, 1,
0.01945039, -0.5038441, 2.870686, 1, 1, 1, 1, 1,
0.02018261, -0.325538, 1.889835, 1, 1, 1, 1, 1,
0.02199819, -0.5162709, 3.362474, 1, 1, 1, 1, 1,
0.02410306, -1.433788, 3.508353, 1, 1, 1, 1, 1,
0.0405686, -1.813661, 4.092658, 1, 1, 1, 1, 1,
0.04130255, -0.3256773, 3.185017, 1, 1, 1, 1, 1,
0.0430169, 1.558042, 0.1819646, 0, 0, 1, 1, 1,
0.0479394, 0.6389875, 1.013923, 1, 0, 0, 1, 1,
0.04846869, -1.139495, 3.478928, 1, 0, 0, 1, 1,
0.05431388, -0.2091065, 3.330907, 1, 0, 0, 1, 1,
0.05447812, 0.3235879, 0.03755961, 1, 0, 0, 1, 1,
0.06897986, -1.284416, 3.090049, 1, 0, 0, 1, 1,
0.06899352, 0.9510658, -0.2458903, 0, 0, 0, 1, 1,
0.07389589, 1.15452, -1.003406, 0, 0, 0, 1, 1,
0.07979616, 0.08458771, 0.8491542, 0, 0, 0, 1, 1,
0.08145636, -1.217974, 1.739044, 0, 0, 0, 1, 1,
0.08229111, 0.109965, 0.8463234, 0, 0, 0, 1, 1,
0.08434216, -0.5432234, 3.157273, 0, 0, 0, 1, 1,
0.08579482, 0.1259446, 0.9337327, 0, 0, 0, 1, 1,
0.0862434, 0.940999, 2.600128, 1, 1, 1, 1, 1,
0.08910204, -1.095386, 3.275148, 1, 1, 1, 1, 1,
0.09475684, -0.1760101, 2.768363, 1, 1, 1, 1, 1,
0.095678, 0.02234492, 0.02779388, 1, 1, 1, 1, 1,
0.1076807, 0.3560401, 0.09480239, 1, 1, 1, 1, 1,
0.1081025, -1.564266, 1.73231, 1, 1, 1, 1, 1,
0.1096364, -1.610939, 3.198399, 1, 1, 1, 1, 1,
0.1116677, -0.8257478, 1.706655, 1, 1, 1, 1, 1,
0.1122817, -1.895968, 1.921735, 1, 1, 1, 1, 1,
0.114507, -0.1425039, 2.135504, 1, 1, 1, 1, 1,
0.1202427, -1.27016, 3.554343, 1, 1, 1, 1, 1,
0.120921, 0.6274189, -0.371491, 1, 1, 1, 1, 1,
0.1209392, 0.8172985, 0.9156429, 1, 1, 1, 1, 1,
0.1214322, -0.560104, 2.289421, 1, 1, 1, 1, 1,
0.122734, -1.340693, 2.27307, 1, 1, 1, 1, 1,
0.1235418, -0.2662441, 1.782532, 0, 0, 1, 1, 1,
0.129315, -0.1811618, 5.598385, 1, 0, 0, 1, 1,
0.1307924, 0.7935358, -0.7944734, 1, 0, 0, 1, 1,
0.1309559, 2.229283, -0.9415548, 1, 0, 0, 1, 1,
0.1310697, -0.07658137, 1.276341, 1, 0, 0, 1, 1,
0.1324958, 0.1542042, 0.4559327, 1, 0, 0, 1, 1,
0.1366292, 1.043579, -0.1469324, 0, 0, 0, 1, 1,
0.1425305, -2.80159, 3.542056, 0, 0, 0, 1, 1,
0.1431869, -0.8648019, 1.766443, 0, 0, 0, 1, 1,
0.144347, 1.569623, -0.4496526, 0, 0, 0, 1, 1,
0.144748, 0.3719321, 1.722253, 0, 0, 0, 1, 1,
0.1449472, -0.1444489, 3.128414, 0, 0, 0, 1, 1,
0.1471267, 0.6679086, -1.038406, 0, 0, 0, 1, 1,
0.1478917, 1.112898, 0.2254163, 1, 1, 1, 1, 1,
0.1482533, -0.01473072, 0.5150591, 1, 1, 1, 1, 1,
0.1544178, 0.1168828, 2.019062, 1, 1, 1, 1, 1,
0.1589859, 0.5570274, -0.5852644, 1, 1, 1, 1, 1,
0.1608161, 0.2142584, 1.286878, 1, 1, 1, 1, 1,
0.1656967, 0.2010678, 0.2817435, 1, 1, 1, 1, 1,
0.1676701, -0.8285639, 0.5637622, 1, 1, 1, 1, 1,
0.1681261, -0.4297704, 4.097221, 1, 1, 1, 1, 1,
0.1705701, 0.09376669, 0.7515512, 1, 1, 1, 1, 1,
0.1723825, -0.3861132, 3.660747, 1, 1, 1, 1, 1,
0.1726453, 0.1520094, 0.9033932, 1, 1, 1, 1, 1,
0.1762317, 0.5671121, -0.279931, 1, 1, 1, 1, 1,
0.1785285, -1.02682, 1.950292, 1, 1, 1, 1, 1,
0.1816605, -0.4599089, 2.949748, 1, 1, 1, 1, 1,
0.1835327, 0.2796261, -0.2500322, 1, 1, 1, 1, 1,
0.1835787, -0.6369852, 3.158013, 0, 0, 1, 1, 1,
0.183644, -1.611538, 1.733445, 1, 0, 0, 1, 1,
0.1865416, -0.7577185, 5.089549, 1, 0, 0, 1, 1,
0.187194, -0.7170874, 2.459332, 1, 0, 0, 1, 1,
0.1888167, 0.01983527, 1.135348, 1, 0, 0, 1, 1,
0.192581, -0.5771177, 3.211177, 1, 0, 0, 1, 1,
0.1943133, 0.2875964, -0.02596061, 0, 0, 0, 1, 1,
0.1954736, 0.03093052, 1.072353, 0, 0, 0, 1, 1,
0.1957602, -0.5651675, 1.868622, 0, 0, 0, 1, 1,
0.1965419, 1.64772, -1.544373, 0, 0, 0, 1, 1,
0.2012902, -0.6953606, 1.351407, 0, 0, 0, 1, 1,
0.205006, 0.2567907, 1.266428, 0, 0, 0, 1, 1,
0.2142353, -1.053201, 2.450227, 0, 0, 0, 1, 1,
0.2162236, 0.4037238, 1.043864, 1, 1, 1, 1, 1,
0.2217238, 1.437654, -0.785099, 1, 1, 1, 1, 1,
0.224181, 1.859503, 1.677866, 1, 1, 1, 1, 1,
0.2250357, -1.122202, 1.971171, 1, 1, 1, 1, 1,
0.2290537, 0.2467611, 0.3157199, 1, 1, 1, 1, 1,
0.2293864, 0.7755994, 0.08939599, 1, 1, 1, 1, 1,
0.2299739, -1.44377, 2.561078, 1, 1, 1, 1, 1,
0.2324879, 2.163475, 2.339014, 1, 1, 1, 1, 1,
0.2369859, -0.1007262, -0.3069788, 1, 1, 1, 1, 1,
0.2370692, 1.185723, -1.344278, 1, 1, 1, 1, 1,
0.2427491, 0.78769, 0.9040632, 1, 1, 1, 1, 1,
0.2428443, 0.8690826, -0.2735177, 1, 1, 1, 1, 1,
0.244721, -0.4427095, 2.961805, 1, 1, 1, 1, 1,
0.2453043, 0.6109335, 0.08832357, 1, 1, 1, 1, 1,
0.2463374, -0.2751246, 1.851523, 1, 1, 1, 1, 1,
0.2488041, -2.550525, 2.260971, 0, 0, 1, 1, 1,
0.2525763, 0.9616888, 3.018634, 1, 0, 0, 1, 1,
0.2557062, 1.040579, 0.4100588, 1, 0, 0, 1, 1,
0.2563579, 1.672235, -1.683995, 1, 0, 0, 1, 1,
0.2589164, 0.6990157, 1.192631, 1, 0, 0, 1, 1,
0.2597837, -0.215379, 3.409782, 1, 0, 0, 1, 1,
0.2608541, -2.238758, 1.323396, 0, 0, 0, 1, 1,
0.2676656, -0.7153429, 1.684144, 0, 0, 0, 1, 1,
0.2682559, 0.3503779, -1.006955, 0, 0, 0, 1, 1,
0.2683034, 1.538335, -0.8948126, 0, 0, 0, 1, 1,
0.2692982, -0.533675, 2.559908, 0, 0, 0, 1, 1,
0.2714399, -1.099301, 3.793788, 0, 0, 0, 1, 1,
0.2720364, -1.166018, 3.950244, 0, 0, 0, 1, 1,
0.2764073, 1.458244, -0.3168599, 1, 1, 1, 1, 1,
0.2769227, -1.127551, 3.442966, 1, 1, 1, 1, 1,
0.2783752, 0.7524056, -0.7955856, 1, 1, 1, 1, 1,
0.2787566, -0.4380204, 2.082825, 1, 1, 1, 1, 1,
0.28045, -0.3693831, 1.254088, 1, 1, 1, 1, 1,
0.2809552, -1.449198, 3.417662, 1, 1, 1, 1, 1,
0.2818445, 0.7775121, -0.3228105, 1, 1, 1, 1, 1,
0.2859231, 0.4789189, -2.028748, 1, 1, 1, 1, 1,
0.2907734, 0.528797, 1.526065, 1, 1, 1, 1, 1,
0.2956927, 0.01233867, 0.9380279, 1, 1, 1, 1, 1,
0.2963157, 1.204067, 0.06682175, 1, 1, 1, 1, 1,
0.2971375, 1.52852, -1.248178, 1, 1, 1, 1, 1,
0.2972059, 0.587522, -0.2723394, 1, 1, 1, 1, 1,
0.3030635, 0.7420249, -0.8678991, 1, 1, 1, 1, 1,
0.3038892, 0.614674, 0.2866843, 1, 1, 1, 1, 1,
0.3040778, -0.08504396, 3.187385, 0, 0, 1, 1, 1,
0.3050428, -0.2551989, 3.362312, 1, 0, 0, 1, 1,
0.3057702, -0.007796065, 2.343071, 1, 0, 0, 1, 1,
0.3088402, -1.955804, 3.575195, 1, 0, 0, 1, 1,
0.3134135, -1.428084, 3.360955, 1, 0, 0, 1, 1,
0.3141316, -0.008835514, 2.602439, 1, 0, 0, 1, 1,
0.3153849, -0.8478677, 4.095858, 0, 0, 0, 1, 1,
0.3255534, -0.7059984, 3.201378, 0, 0, 0, 1, 1,
0.3270738, 1.68905, -0.03452068, 0, 0, 0, 1, 1,
0.3303611, -1.513708, 2.567671, 0, 0, 0, 1, 1,
0.3309217, -0.475385, 3.108428, 0, 0, 0, 1, 1,
0.3330286, -0.2190374, 3.677625, 0, 0, 0, 1, 1,
0.3346477, 0.6314039, 0.7404957, 0, 0, 0, 1, 1,
0.343298, -0.04428886, 1.114536, 1, 1, 1, 1, 1,
0.3475201, -0.9769462, 2.552575, 1, 1, 1, 1, 1,
0.3545451, -0.6115515, 1.744305, 1, 1, 1, 1, 1,
0.3548282, 0.7972853, 0.004852138, 1, 1, 1, 1, 1,
0.3551695, 1.690311, 1.056123, 1, 1, 1, 1, 1,
0.358969, 0.7696882, 1.202361, 1, 1, 1, 1, 1,
0.3612888, 1.593872, 1.244756, 1, 1, 1, 1, 1,
0.3691074, 0.2123983, 1.54993, 1, 1, 1, 1, 1,
0.3730673, -0.1039597, 0.8245685, 1, 1, 1, 1, 1,
0.3818572, 0.191667, 0.5380483, 1, 1, 1, 1, 1,
0.386759, -0.001841011, 1.335947, 1, 1, 1, 1, 1,
0.3889609, -0.8289883, 2.810264, 1, 1, 1, 1, 1,
0.3905335, 1.003104, 0.1960378, 1, 1, 1, 1, 1,
0.3920378, -1.715135, 4.030262, 1, 1, 1, 1, 1,
0.3947537, -2.625306, 2.006975, 1, 1, 1, 1, 1,
0.400581, -1.563403, 3.977461, 0, 0, 1, 1, 1,
0.4088751, -0.7727506, 2.922816, 1, 0, 0, 1, 1,
0.4148637, 0.8542054, 0.3965756, 1, 0, 0, 1, 1,
0.4151025, 1.184252, 0.9121925, 1, 0, 0, 1, 1,
0.4157878, -0.8308173, 1.937878, 1, 0, 0, 1, 1,
0.4175787, -0.8643828, 2.351127, 1, 0, 0, 1, 1,
0.4190016, 0.2908638, 1.86777, 0, 0, 0, 1, 1,
0.4225175, -0.5683595, 2.00341, 0, 0, 0, 1, 1,
0.4240232, 1.638987, 0.3110801, 0, 0, 0, 1, 1,
0.4241796, -1.013788, 2.771605, 0, 0, 0, 1, 1,
0.4242337, -0.7058342, 2.257476, 0, 0, 0, 1, 1,
0.425011, 0.8583413, 0.2488773, 0, 0, 0, 1, 1,
0.4267655, -0.2801549, 2.171497, 0, 0, 0, 1, 1,
0.4304232, 0.5333387, 1.410522, 1, 1, 1, 1, 1,
0.4337577, 2.931216, 0.5882443, 1, 1, 1, 1, 1,
0.4373755, -2.128299, 2.992655, 1, 1, 1, 1, 1,
0.4421727, 0.0122336, -0.217926, 1, 1, 1, 1, 1,
0.4423442, -1.019767, 5.381032, 1, 1, 1, 1, 1,
0.4476066, 2.50755, 0.9243217, 1, 1, 1, 1, 1,
0.4515753, 0.5373952, -1.408215, 1, 1, 1, 1, 1,
0.4523973, -0.7240127, 1.887803, 1, 1, 1, 1, 1,
0.4570993, 0.08257534, 0.9435163, 1, 1, 1, 1, 1,
0.4612129, -0.7912449, 2.395964, 1, 1, 1, 1, 1,
0.4622489, 0.9492214, -0.05272419, 1, 1, 1, 1, 1,
0.4703504, 1.43175, -0.02170436, 1, 1, 1, 1, 1,
0.4722254, 0.5677681, 1.176795, 1, 1, 1, 1, 1,
0.4733708, 0.6139614, 0.8177075, 1, 1, 1, 1, 1,
0.4801996, 2.280937, 0.1995462, 1, 1, 1, 1, 1,
0.4826905, 0.1722822, 2.605112, 0, 0, 1, 1, 1,
0.486968, 0.04399838, 3.233751, 1, 0, 0, 1, 1,
0.48862, -2.463525, 2.763066, 1, 0, 0, 1, 1,
0.4907387, 0.5686872, 1.270647, 1, 0, 0, 1, 1,
0.4927256, 0.234862, 1.949976, 1, 0, 0, 1, 1,
0.4932569, -0.2862375, 1.430007, 1, 0, 0, 1, 1,
0.4980679, 1.508956, 1.093238, 0, 0, 0, 1, 1,
0.4990599, 0.398862, -0.3122344, 0, 0, 0, 1, 1,
0.5066459, -1.5568, 2.082475, 0, 0, 0, 1, 1,
0.5070017, 1.278897, -0.07614707, 0, 0, 0, 1, 1,
0.5104077, 0.4613422, 1.542541, 0, 0, 0, 1, 1,
0.5114956, 1.042846, 0.3681938, 0, 0, 0, 1, 1,
0.5218621, -0.6627462, 3.515838, 0, 0, 0, 1, 1,
0.5239511, 0.2545352, 0.7198355, 1, 1, 1, 1, 1,
0.5279022, -0.6045145, 2.713869, 1, 1, 1, 1, 1,
0.5303988, 0.8492458, 0.8263169, 1, 1, 1, 1, 1,
0.5325229, 1.447112, 1.957275, 1, 1, 1, 1, 1,
0.5333742, -0.5067441, 1.526995, 1, 1, 1, 1, 1,
0.5347356, 0.3688153, 2.75448, 1, 1, 1, 1, 1,
0.5428329, -0.402494, 1.447792, 1, 1, 1, 1, 1,
0.5457408, -0.6253298, 1.36262, 1, 1, 1, 1, 1,
0.5496884, -0.2640142, 1.800372, 1, 1, 1, 1, 1,
0.5552897, 1.156239, 0.8588702, 1, 1, 1, 1, 1,
0.5555334, -0.9805924, 2.00726, 1, 1, 1, 1, 1,
0.5574316, 0.2808917, 0.388492, 1, 1, 1, 1, 1,
0.558619, -0.08239129, -0.1853622, 1, 1, 1, 1, 1,
0.5603161, -0.7519777, 3.538743, 1, 1, 1, 1, 1,
0.5694922, 0.8641283, 0.2756011, 1, 1, 1, 1, 1,
0.5747324, -1.257738, 1.43717, 0, 0, 1, 1, 1,
0.5810212, -0.3443578, 0.1152631, 1, 0, 0, 1, 1,
0.5864979, -0.7134591, 2.33294, 1, 0, 0, 1, 1,
0.5877142, 0.9163683, 0.2422192, 1, 0, 0, 1, 1,
0.5880698, 0.6722603, 1.24762, 1, 0, 0, 1, 1,
0.5887381, 0.743497, 0.7204996, 1, 0, 0, 1, 1,
0.5984871, 0.9500799, 2.023547, 0, 0, 0, 1, 1,
0.6002393, 0.3345651, 0.3126558, 0, 0, 0, 1, 1,
0.6048244, -0.5711274, 1.562833, 0, 0, 0, 1, 1,
0.6051631, -0.4462768, 3.719215, 0, 0, 0, 1, 1,
0.6081586, 2.080037, -0.1189289, 0, 0, 0, 1, 1,
0.6082547, -2.978198, 1.441779, 0, 0, 0, 1, 1,
0.6097775, 0.8555163, -1.316965, 0, 0, 0, 1, 1,
0.6102679, -0.9605563, 3.164106, 1, 1, 1, 1, 1,
0.6121511, -0.9060627, 2.578108, 1, 1, 1, 1, 1,
0.613035, 0.6132495, 3.83801, 1, 1, 1, 1, 1,
0.6174927, -0.4424888, 0.4553048, 1, 1, 1, 1, 1,
0.6202545, -1.27482, 3.039875, 1, 1, 1, 1, 1,
0.622501, 0.9496846, 1.31441, 1, 1, 1, 1, 1,
0.6278586, 1.015382, 1.32915, 1, 1, 1, 1, 1,
0.6355962, -0.2125842, -1.014543, 1, 1, 1, 1, 1,
0.6389317, 0.1877839, 0.1729694, 1, 1, 1, 1, 1,
0.6400849, 0.436367, 0.591763, 1, 1, 1, 1, 1,
0.6461366, 0.8618491, 0.4576711, 1, 1, 1, 1, 1,
0.6519749, -1.028449, 1.67699, 1, 1, 1, 1, 1,
0.6594946, -0.1441155, 2.457579, 1, 1, 1, 1, 1,
0.6647586, -0.0649678, 0.6504945, 1, 1, 1, 1, 1,
0.669477, -0.1422705, 2.671412, 1, 1, 1, 1, 1,
0.6719937, -0.4526373, 3.02715, 0, 0, 1, 1, 1,
0.6757399, 0.2082574, 0.7839367, 1, 0, 0, 1, 1,
0.6841702, -1.051091, 3.725349, 1, 0, 0, 1, 1,
0.6854312, 0.6748013, 1.132936, 1, 0, 0, 1, 1,
0.6884562, 1.182159, 0.1951938, 1, 0, 0, 1, 1,
0.6884609, -0.3544503, 2.352243, 1, 0, 0, 1, 1,
0.6890444, 0.6793345, 0.9931344, 0, 0, 0, 1, 1,
0.6897098, -1.129753, 3.548071, 0, 0, 0, 1, 1,
0.6927562, -0.06174689, 2.77369, 0, 0, 0, 1, 1,
0.7041554, -1.889739, 3.258075, 0, 0, 0, 1, 1,
0.7045492, -0.1782569, 1.74402, 0, 0, 0, 1, 1,
0.704914, 1.857477, 1.257225, 0, 0, 0, 1, 1,
0.7099643, 0.7008092, 1.220406, 0, 0, 0, 1, 1,
0.7100232, -0.9062271, 3.46422, 1, 1, 1, 1, 1,
0.7106181, -0.9753417, 0.1243258, 1, 1, 1, 1, 1,
0.7164357, -1.454568, 3.682709, 1, 1, 1, 1, 1,
0.7193199, -0.6290886, 1.089683, 1, 1, 1, 1, 1,
0.7194102, 1.970006, -0.0548887, 1, 1, 1, 1, 1,
0.7203165, -1.461323, 0.7966784, 1, 1, 1, 1, 1,
0.725261, 0.8638758, 1.004189, 1, 1, 1, 1, 1,
0.7271681, 0.5758411, 1.400506, 1, 1, 1, 1, 1,
0.7337773, 1.905855, 1.53764, 1, 1, 1, 1, 1,
0.7360619, -0.7473632, 2.6813, 1, 1, 1, 1, 1,
0.7375427, 0.5701379, 1.288133, 1, 1, 1, 1, 1,
0.7406777, 0.6763525, 0.8644728, 1, 1, 1, 1, 1,
0.7407146, 0.3476315, -0.6015382, 1, 1, 1, 1, 1,
0.7409352, 0.05758612, 0.9451383, 1, 1, 1, 1, 1,
0.7412918, -0.5739185, 3.338215, 1, 1, 1, 1, 1,
0.7416966, -1.116129, 2.763086, 0, 0, 1, 1, 1,
0.7424738, -0.05080516, 0.6364031, 1, 0, 0, 1, 1,
0.7473602, 0.1861217, 1.890539, 1, 0, 0, 1, 1,
0.7550873, 0.1219826, 1.430734, 1, 0, 0, 1, 1,
0.7582515, 0.2369449, 0.1222582, 1, 0, 0, 1, 1,
0.7614893, 0.530237, 1.569156, 1, 0, 0, 1, 1,
0.7663249, 0.5495691, 2.091475, 0, 0, 0, 1, 1,
0.7670398, -0.6144088, 2.30537, 0, 0, 0, 1, 1,
0.7763807, -0.8229201, 2.11519, 0, 0, 0, 1, 1,
0.7790995, -0.7904425, 1.336125, 0, 0, 0, 1, 1,
0.7811043, -0.0007525224, 4.121084, 0, 0, 0, 1, 1,
0.7814839, 0.349658, 0.8691054, 0, 0, 0, 1, 1,
0.7822168, 1.103255, 2.357453, 0, 0, 0, 1, 1,
0.784759, -1.309081, 1.594312, 1, 1, 1, 1, 1,
0.7852792, -1.032289, 0.6342309, 1, 1, 1, 1, 1,
0.7918964, 0.05870396, 2.768136, 1, 1, 1, 1, 1,
0.7953139, 0.6430833, -0.01547432, 1, 1, 1, 1, 1,
0.7955794, 0.4655945, -0.09225864, 1, 1, 1, 1, 1,
0.7956104, 0.2841125, 1.749431, 1, 1, 1, 1, 1,
0.8054371, 0.3334236, 0.171004, 1, 1, 1, 1, 1,
0.8065321, -2.539392, 1.480499, 1, 1, 1, 1, 1,
0.806544, -1.288964, 3.739655, 1, 1, 1, 1, 1,
0.8143983, -1.994735, 3.987789, 1, 1, 1, 1, 1,
0.8156096, -0.6144676, -0.007847187, 1, 1, 1, 1, 1,
0.8161919, -0.3298023, 2.687886, 1, 1, 1, 1, 1,
0.8191885, 0.619872, 0.6639695, 1, 1, 1, 1, 1,
0.8222954, -1.732067, 2.592881, 1, 1, 1, 1, 1,
0.8261751, -1.628495, 3.86027, 1, 1, 1, 1, 1,
0.8276646, 1.205856, 0.7167683, 0, 0, 1, 1, 1,
0.828002, 0.5881699, 0.6865962, 1, 0, 0, 1, 1,
0.8311884, 0.4943188, 2.240519, 1, 0, 0, 1, 1,
0.83556, -0.01291751, 2.722818, 1, 0, 0, 1, 1,
0.8390148, 1.253259, 1.788188, 1, 0, 0, 1, 1,
0.8393651, -1.356081, 1.260867, 1, 0, 0, 1, 1,
0.8467032, 1.28769, 1.328228, 0, 0, 0, 1, 1,
0.850732, -0.004497207, 1.461032, 0, 0, 0, 1, 1,
0.8544939, -0.8290809, 1.815212, 0, 0, 0, 1, 1,
0.8558095, -1.011218, 2.148152, 0, 0, 0, 1, 1,
0.8572513, 1.392512, -0.005785414, 0, 0, 0, 1, 1,
0.859888, -1.106642, 3.194304, 0, 0, 0, 1, 1,
0.8602139, 0.1274611, 2.863915, 0, 0, 0, 1, 1,
0.8653186, 2.335289, 0.9000188, 1, 1, 1, 1, 1,
0.8662173, -0.7996284, 1.206478, 1, 1, 1, 1, 1,
0.8786075, 0.178121, 1.431986, 1, 1, 1, 1, 1,
0.8824503, 0.3900481, 0.5067879, 1, 1, 1, 1, 1,
0.8918307, -0.7158008, 1.710016, 1, 1, 1, 1, 1,
0.892403, -0.8117149, 1.754782, 1, 1, 1, 1, 1,
0.8952811, -0.5196633, 3.771574, 1, 1, 1, 1, 1,
0.8991385, 0.4053831, 1.054725, 1, 1, 1, 1, 1,
0.9004011, 0.5637816, 0.5107537, 1, 1, 1, 1, 1,
0.9103759, 0.1846215, 0.09043722, 1, 1, 1, 1, 1,
0.9186206, -1.868844, 0.1351318, 1, 1, 1, 1, 1,
0.9195465, -0.5689219, 1.262312, 1, 1, 1, 1, 1,
0.9245511, -0.07347887, 1.70721, 1, 1, 1, 1, 1,
0.9250277, 1.292687, -0.08290909, 1, 1, 1, 1, 1,
0.929104, -1.435725, 3.301379, 1, 1, 1, 1, 1,
0.9427414, 0.3145905, 0.381126, 0, 0, 1, 1, 1,
0.9432299, -0.8991806, 2.022535, 1, 0, 0, 1, 1,
0.9597015, 2.047627, -2.140295, 1, 0, 0, 1, 1,
0.9677913, 0.2378891, 0.8401997, 1, 0, 0, 1, 1,
0.9690234, 0.5746305, 1.485209, 1, 0, 0, 1, 1,
0.9694107, 0.5914031, 1.444433, 1, 0, 0, 1, 1,
0.9738456, -0.8630341, 2.259821, 0, 0, 0, 1, 1,
0.9761076, 0.1379709, 0.4692436, 0, 0, 0, 1, 1,
0.9773013, -2.839309, 4.503992, 0, 0, 0, 1, 1,
0.9779117, -1.077363, 2.58368, 0, 0, 0, 1, 1,
0.9779308, 0.3168826, 0.1704252, 0, 0, 0, 1, 1,
0.9820755, 0.2749168, -0.05556053, 0, 0, 0, 1, 1,
0.9848486, -0.2422708, 2.186515, 0, 0, 0, 1, 1,
0.9854342, -1.210575, 2.103359, 1, 1, 1, 1, 1,
0.9928505, -2.303178, 3.098453, 1, 1, 1, 1, 1,
1.00048, 0.6711632, 2.118087, 1, 1, 1, 1, 1,
1.002594, -0.845193, 3.015064, 1, 1, 1, 1, 1,
1.006532, -0.8884021, 0.9871159, 1, 1, 1, 1, 1,
1.014633, -1.315361, 2.182116, 1, 1, 1, 1, 1,
1.040722, 0.4157289, 1.133679, 1, 1, 1, 1, 1,
1.042682, 0.8278486, 0.5585612, 1, 1, 1, 1, 1,
1.043119, -0.6945353, 0.3661876, 1, 1, 1, 1, 1,
1.049166, 1.274403, 0.1009176, 1, 1, 1, 1, 1,
1.057705, -0.5446101, 2.549835, 1, 1, 1, 1, 1,
1.060364, 0.7839526, 0.4495686, 1, 1, 1, 1, 1,
1.065698, -1.615117, 2.176112, 1, 1, 1, 1, 1,
1.066967, 0.3851478, 2.344689, 1, 1, 1, 1, 1,
1.072493, -0.3518227, 2.372885, 1, 1, 1, 1, 1,
1.07431, 1.215331, 0.5831501, 0, 0, 1, 1, 1,
1.080816, -0.07851173, 1.7794, 1, 0, 0, 1, 1,
1.08881, 1.583405, -0.4971081, 1, 0, 0, 1, 1,
1.094003, 0.9723625, -0.2780853, 1, 0, 0, 1, 1,
1.095113, 0.2773209, 2.819778, 1, 0, 0, 1, 1,
1.099821, 0.2204833, 1.071162, 1, 0, 0, 1, 1,
1.104214, -0.5491644, 3.074661, 0, 0, 0, 1, 1,
1.11138, 0.4823341, 0.7403453, 0, 0, 0, 1, 1,
1.12862, -0.3423297, 0.7384742, 0, 0, 0, 1, 1,
1.13174, -1.864813, 2.440743, 0, 0, 0, 1, 1,
1.134614, 0.05295248, 0.8316557, 0, 0, 0, 1, 1,
1.141757, -0.5968444, 0.9516144, 0, 0, 0, 1, 1,
1.142493, -0.6968769, 2.025125, 0, 0, 0, 1, 1,
1.160216, -0.3994927, 0.935869, 1, 1, 1, 1, 1,
1.160857, -0.4458445, 2.41056, 1, 1, 1, 1, 1,
1.162609, -1.384051, 1.320927, 1, 1, 1, 1, 1,
1.169587, -0.8091386, 1.737334, 1, 1, 1, 1, 1,
1.17101, -1.122001, 1.796393, 1, 1, 1, 1, 1,
1.172751, 0.3846657, 1.268875, 1, 1, 1, 1, 1,
1.187777, 0.04476072, 1.020691, 1, 1, 1, 1, 1,
1.189643, -0.9163415, 4.481954, 1, 1, 1, 1, 1,
1.193487, -0.05052464, 2.552998, 1, 1, 1, 1, 1,
1.198619, 1.954858, 0.5259361, 1, 1, 1, 1, 1,
1.199538, 1.478699, -0.4472532, 1, 1, 1, 1, 1,
1.20635, 0.5495393, 1.39685, 1, 1, 1, 1, 1,
1.207898, -0.4961414, 0.9170682, 1, 1, 1, 1, 1,
1.209056, 0.2780243, 1.654082, 1, 1, 1, 1, 1,
1.224663, -0.1818625, 2.077144, 1, 1, 1, 1, 1,
1.224725, -0.7251909, 1.301586, 0, 0, 1, 1, 1,
1.235295, -1.183697, 0.4810185, 1, 0, 0, 1, 1,
1.236386, -0.2284864, 2.065692, 1, 0, 0, 1, 1,
1.23725, -0.02161843, 1.73591, 1, 0, 0, 1, 1,
1.23784, 0.226192, 1.922666, 1, 0, 0, 1, 1,
1.238311, 1.185513, 0.9982675, 1, 0, 0, 1, 1,
1.240162, -1.483956, 1.461753, 0, 0, 0, 1, 1,
1.250418, -2.050907, 3.512619, 0, 0, 0, 1, 1,
1.260143, 0.4809508, 0.1389549, 0, 0, 0, 1, 1,
1.263705, 0.4626659, 1.547254, 0, 0, 0, 1, 1,
1.274128, 1.761453, 0.2574031, 0, 0, 0, 1, 1,
1.275841, 1.008574, -1.077027, 0, 0, 0, 1, 1,
1.276795, 0.6657798, -0.2877464, 0, 0, 0, 1, 1,
1.278858, -0.9807544, 0.5361372, 1, 1, 1, 1, 1,
1.280874, 0.06620266, 2.334243, 1, 1, 1, 1, 1,
1.28599, -0.6919984, -0.4206257, 1, 1, 1, 1, 1,
1.308105, -0.2961952, 3.354053, 1, 1, 1, 1, 1,
1.308218, 0.886101, 1.958183, 1, 1, 1, 1, 1,
1.315225, -0.9257523, 1.903803, 1, 1, 1, 1, 1,
1.318666, 2.113899, 0.2593951, 1, 1, 1, 1, 1,
1.323541, 2.128629, 1.3234, 1, 1, 1, 1, 1,
1.332423, 0.6613557, 2.593302, 1, 1, 1, 1, 1,
1.337486, 2.278551, -0.315546, 1, 1, 1, 1, 1,
1.337826, 0.9490362, 0.4057913, 1, 1, 1, 1, 1,
1.346435, 2.460838, 0.9992077, 1, 1, 1, 1, 1,
1.37577, 1.273309, 0.09609903, 1, 1, 1, 1, 1,
1.379626, 1.087111, 0.9368309, 1, 1, 1, 1, 1,
1.382751, -0.9478456, 1.306158, 1, 1, 1, 1, 1,
1.385191, 0.1087848, 3.349863, 0, 0, 1, 1, 1,
1.398935, -1.032236, 1.409322, 1, 0, 0, 1, 1,
1.401458, -2.15309, 2.242153, 1, 0, 0, 1, 1,
1.410477, 1.216979, 0.525908, 1, 0, 0, 1, 1,
1.414917, -2.087617, 2.007266, 1, 0, 0, 1, 1,
1.420556, -1.464184, 1.799263, 1, 0, 0, 1, 1,
1.431188, 0.6219475, 1.274045, 0, 0, 0, 1, 1,
1.433512, -0.247292, 2.905306, 0, 0, 0, 1, 1,
1.435159, -0.6208231, 1.406394, 0, 0, 0, 1, 1,
1.441889, 0.3146764, 0.98353, 0, 0, 0, 1, 1,
1.447112, 1.648736, 1.913112, 0, 0, 0, 1, 1,
1.472304, 0.2379888, 2.879499, 0, 0, 0, 1, 1,
1.477299, -1.890515, 3.599332, 0, 0, 0, 1, 1,
1.4789, 0.7983382, 0.8379582, 1, 1, 1, 1, 1,
1.479661, 1.41251, -1.438871, 1, 1, 1, 1, 1,
1.485258, -0.2041386, 1.230499, 1, 1, 1, 1, 1,
1.485729, 0.1051504, -0.6560794, 1, 1, 1, 1, 1,
1.494842, -0.3530844, 2.679319, 1, 1, 1, 1, 1,
1.501474, -0.1244893, 1.652693, 1, 1, 1, 1, 1,
1.514236, -0.01204277, 1.929265, 1, 1, 1, 1, 1,
1.53281, 0.02054394, 2.020796, 1, 1, 1, 1, 1,
1.546021, -0.712734, 0.7119064, 1, 1, 1, 1, 1,
1.56769, 0.5545436, 1.36715, 1, 1, 1, 1, 1,
1.576496, -0.6825549, 1.394705, 1, 1, 1, 1, 1,
1.578731, -0.6101213, 1.746829, 1, 1, 1, 1, 1,
1.593601, -0.8125995, 2.378253, 1, 1, 1, 1, 1,
1.615368, 1.294168, 0.2826239, 1, 1, 1, 1, 1,
1.674519, -0.09618455, 1.037745, 1, 1, 1, 1, 1,
1.703151, -0.7736204, 1.71183, 0, 0, 1, 1, 1,
1.708835, 1.883656, 0.6957314, 1, 0, 0, 1, 1,
1.717761, 0.6791301, 1.967317, 1, 0, 0, 1, 1,
1.718733, 0.1118473, 0.9988627, 1, 0, 0, 1, 1,
1.720266, -0.5216474, 1.388916, 1, 0, 0, 1, 1,
1.748416, 1.839915, -0.1529409, 1, 0, 0, 1, 1,
1.758174, 0.541043, 1.728526, 0, 0, 0, 1, 1,
1.763208, -0.9754322, 2.795622, 0, 0, 0, 1, 1,
1.767616, -1.11801, 1.2495, 0, 0, 0, 1, 1,
1.772048, 1.077113, 1.575561, 0, 0, 0, 1, 1,
1.783103, 0.5049418, -1.044379, 0, 0, 0, 1, 1,
1.793305, -0.7705379, 3.352378, 0, 0, 0, 1, 1,
1.798956, 1.569751, -1.510373, 0, 0, 0, 1, 1,
1.803883, -2.03891, 1.908306, 1, 1, 1, 1, 1,
1.803946, 1.701409, 0.327876, 1, 1, 1, 1, 1,
1.80643, 0.9931134, 2.539977, 1, 1, 1, 1, 1,
1.875601, -0.4886876, 1.777327, 1, 1, 1, 1, 1,
1.880621, 0.7022693, 1.535127, 1, 1, 1, 1, 1,
1.895526, 1.368351, 1.638845, 1, 1, 1, 1, 1,
1.900528, 1.022148, 2.705765, 1, 1, 1, 1, 1,
1.926973, -0.4157578, 1.150295, 1, 1, 1, 1, 1,
1.955425, 0.5496227, 1.45243, 1, 1, 1, 1, 1,
1.95818, -1.175983, 1.997488, 1, 1, 1, 1, 1,
1.987227, 0.7392715, 1.090237, 1, 1, 1, 1, 1,
1.997921, -0.01537392, 1.796174, 1, 1, 1, 1, 1,
2.044164, -0.8415791, 3.422556, 1, 1, 1, 1, 1,
2.092953, -0.5726424, 0.7954796, 1, 1, 1, 1, 1,
2.125161, -1.676212, 1.527156, 1, 1, 1, 1, 1,
2.134997, -1.113122, 0.6066369, 0, 0, 1, 1, 1,
2.13921, 0.6954355, 0.5469043, 1, 0, 0, 1, 1,
2.141135, -1.04565, 1.678103, 1, 0, 0, 1, 1,
2.165542, -0.08817285, 0.8279402, 1, 0, 0, 1, 1,
2.170601, 0.3489141, 1.029551, 1, 0, 0, 1, 1,
2.171544, 2.980468, -1.212554, 1, 0, 0, 1, 1,
2.176143, -0.4448754, 1.504394, 0, 0, 0, 1, 1,
2.253344, 0.09992631, 2.8131, 0, 0, 0, 1, 1,
2.259507, 0.1359741, 1.475514, 0, 0, 0, 1, 1,
2.27932, 0.6186588, 1.590027, 0, 0, 0, 1, 1,
2.308942, -0.2572586, 3.363241, 0, 0, 0, 1, 1,
2.415499, -1.624449, 3.944799, 0, 0, 0, 1, 1,
2.422543, 0.4166483, -0.565146, 0, 0, 0, 1, 1,
2.486473, -0.9898505, 2.050751, 1, 1, 1, 1, 1,
2.52476, 1.074036, 2.442465, 1, 1, 1, 1, 1,
2.652739, 0.2696612, 1.919882, 1, 1, 1, 1, 1,
2.766187, -0.6110322, 0.2923539, 1, 1, 1, 1, 1,
2.873531, -0.2322848, 0.9683409, 1, 1, 1, 1, 1,
3.18652, -0.309219, 1.567059, 1, 1, 1, 1, 1,
3.262366, 1.589134, 0.4278041, 1, 1, 1, 1, 1
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
var radius = 9.970501;
var distance = 35.02096;
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
mvMatrix.translate( 0.03531098, 0.0788039, 0.2725708 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.02096);
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