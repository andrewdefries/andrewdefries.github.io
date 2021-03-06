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
-3.7721, -1.532056, -1.073007, 1, 0, 0, 1,
-2.825183, -0.3703873, -0.3702397, 1, 0.007843138, 0, 1,
-2.759596, 0.06483873, -2.612151, 1, 0.01176471, 0, 1,
-2.69666, -0.3291353, -0.8926839, 1, 0.01960784, 0, 1,
-2.690166, -1.35231, -0.6131575, 1, 0.02352941, 0, 1,
-2.586044, 0.7964473, -0.2340827, 1, 0.03137255, 0, 1,
-2.572961, -0.330074, -2.381335, 1, 0.03529412, 0, 1,
-2.520139, 1.299485, 0.2561077, 1, 0.04313726, 0, 1,
-2.481589, -0.5460974, -0.8513434, 1, 0.04705882, 0, 1,
-2.469402, -1.107072, -1.873183, 1, 0.05490196, 0, 1,
-2.432779, 0.7735953, -1.293909, 1, 0.05882353, 0, 1,
-2.397065, -0.542426, -2.290511, 1, 0.06666667, 0, 1,
-2.381515, 0.3747292, -0.8414038, 1, 0.07058824, 0, 1,
-2.351676, 1.221386, -0.9864304, 1, 0.07843138, 0, 1,
-2.282822, 0.1649541, -3.092901, 1, 0.08235294, 0, 1,
-2.222789, -0.1111082, -1.94504, 1, 0.09019608, 0, 1,
-2.210373, -0.8794512, -1.352943, 1, 0.09411765, 0, 1,
-2.2042, 0.8980507, -1.93375, 1, 0.1019608, 0, 1,
-2.20078, 1.373574, -0.555157, 1, 0.1098039, 0, 1,
-2.173606, 0.1574461, -0.07842319, 1, 0.1137255, 0, 1,
-2.126092, 1.531509, -1.384745, 1, 0.1215686, 0, 1,
-2.111162, 0.3217937, -1.093454, 1, 0.1254902, 0, 1,
-2.068934, -0.433072, -2.814433, 1, 0.1333333, 0, 1,
-2.044273, -0.8976069, -0.6192582, 1, 0.1372549, 0, 1,
-2.043438, 0.7588681, -1.835331, 1, 0.145098, 0, 1,
-2.000051, 0.3416081, -0.9832343, 1, 0.1490196, 0, 1,
-1.992993, -0.06838183, -2.101464, 1, 0.1568628, 0, 1,
-1.976885, -0.5280101, -3.82038, 1, 0.1607843, 0, 1,
-1.969602, 1.07029, -0.3438492, 1, 0.1686275, 0, 1,
-1.920135, 0.03778338, -3.397794, 1, 0.172549, 0, 1,
-1.916118, -0.3724291, -0.7941011, 1, 0.1803922, 0, 1,
-1.902907, -0.1273345, -3.29435, 1, 0.1843137, 0, 1,
-1.890778, 0.5860002, -1.651407, 1, 0.1921569, 0, 1,
-1.885205, 2.101346, -0.9626979, 1, 0.1960784, 0, 1,
-1.883915, -1.210968, -2.990879, 1, 0.2039216, 0, 1,
-1.879533, -0.7056474, -1.80635, 1, 0.2117647, 0, 1,
-1.867858, 2.246348, -0.6275836, 1, 0.2156863, 0, 1,
-1.864009, -0.4676363, 0.2114365, 1, 0.2235294, 0, 1,
-1.832767, -1.261249, -3.641723, 1, 0.227451, 0, 1,
-1.819959, 0.2978973, -1.177902, 1, 0.2352941, 0, 1,
-1.782136, 1.145309, -1.139294, 1, 0.2392157, 0, 1,
-1.771057, 0.04609283, -0.09207542, 1, 0.2470588, 0, 1,
-1.759273, 0.1698684, -1.717504, 1, 0.2509804, 0, 1,
-1.754947, -0.1171349, -1.863416, 1, 0.2588235, 0, 1,
-1.75461, 1.21667, -0.410423, 1, 0.2627451, 0, 1,
-1.752971, -0.1366944, -2.068589, 1, 0.2705882, 0, 1,
-1.746234, -1.240015, -1.789739, 1, 0.2745098, 0, 1,
-1.730869, -0.9987277, -3.809328, 1, 0.282353, 0, 1,
-1.730658, -0.1260786, -2.67062, 1, 0.2862745, 0, 1,
-1.729883, -0.4947259, -0.2451303, 1, 0.2941177, 0, 1,
-1.71754, -0.445955, -0.8640873, 1, 0.3019608, 0, 1,
-1.714595, 1.067217, -0.8622904, 1, 0.3058824, 0, 1,
-1.709055, 0.1470002, -2.669268, 1, 0.3137255, 0, 1,
-1.697888, -0.5001066, 0.3850027, 1, 0.3176471, 0, 1,
-1.66582, 0.0180489, -2.146918, 1, 0.3254902, 0, 1,
-1.653294, -1.154528, -2.67948, 1, 0.3294118, 0, 1,
-1.641709, 0.3702226, -1.476575, 1, 0.3372549, 0, 1,
-1.63124, 1.897505, -0.07682317, 1, 0.3411765, 0, 1,
-1.627157, -0.7147921, -1.436001, 1, 0.3490196, 0, 1,
-1.620875, -0.3832215, -2.258146, 1, 0.3529412, 0, 1,
-1.620173, 0.3122629, -0.804318, 1, 0.3607843, 0, 1,
-1.620103, -0.5447978, -3.419389, 1, 0.3647059, 0, 1,
-1.619528, 0.4736072, -0.3391201, 1, 0.372549, 0, 1,
-1.617071, 1.030213, -2.159693, 1, 0.3764706, 0, 1,
-1.609591, -0.7085361, -1.525933, 1, 0.3843137, 0, 1,
-1.607997, 0.5415681, -1.809017, 1, 0.3882353, 0, 1,
-1.606526, -1.716474, -1.759158, 1, 0.3960784, 0, 1,
-1.602066, 0.5900772, -1.345974, 1, 0.4039216, 0, 1,
-1.593848, -0.3041746, -2.482689, 1, 0.4078431, 0, 1,
-1.588351, 1.625183, 0.5296836, 1, 0.4156863, 0, 1,
-1.540551, 0.674499, -0.06329226, 1, 0.4196078, 0, 1,
-1.529363, -0.6928225, -2.217266, 1, 0.427451, 0, 1,
-1.514606, -0.4327601, -3.095828, 1, 0.4313726, 0, 1,
-1.512161, 0.02874606, -1.461663, 1, 0.4392157, 0, 1,
-1.49367, 1.376586, 0.1808611, 1, 0.4431373, 0, 1,
-1.493293, 0.1092138, -2.365804, 1, 0.4509804, 0, 1,
-1.487688, 1.301304, -0.8140777, 1, 0.454902, 0, 1,
-1.483953, 0.8475708, 0.2961927, 1, 0.4627451, 0, 1,
-1.479656, -0.3012249, -1.48297, 1, 0.4666667, 0, 1,
-1.4725, 1.319933, -0.5287736, 1, 0.4745098, 0, 1,
-1.45157, 0.8360062, -0.5506914, 1, 0.4784314, 0, 1,
-1.432931, -1.795587, -2.538096, 1, 0.4862745, 0, 1,
-1.427861, -1.274216, -2.125806, 1, 0.4901961, 0, 1,
-1.423807, -0.3238523, -1.531243, 1, 0.4980392, 0, 1,
-1.422474, 2.093754, -0.5218046, 1, 0.5058824, 0, 1,
-1.418984, 0.4202886, -3.725094, 1, 0.509804, 0, 1,
-1.416881, 0.4072041, -0.6429851, 1, 0.5176471, 0, 1,
-1.407322, 1.209571, -0.307788, 1, 0.5215687, 0, 1,
-1.37805, 0.7109497, -0.911773, 1, 0.5294118, 0, 1,
-1.373596, 0.4346192, -0.964053, 1, 0.5333334, 0, 1,
-1.367644, 1.457056, -0.630658, 1, 0.5411765, 0, 1,
-1.361141, 0.9558671, -0.4517224, 1, 0.5450981, 0, 1,
-1.359189, -1.252785, -1.637388, 1, 0.5529412, 0, 1,
-1.356238, 0.008031409, -3.52014, 1, 0.5568628, 0, 1,
-1.355473, 0.8594373, 1.552621, 1, 0.5647059, 0, 1,
-1.350155, -1.130139, -1.96154, 1, 0.5686275, 0, 1,
-1.346953, -0.2002648, -1.484852, 1, 0.5764706, 0, 1,
-1.333743, -0.5126811, -0.6301947, 1, 0.5803922, 0, 1,
-1.328372, 0.5897452, -1.71015, 1, 0.5882353, 0, 1,
-1.32392, -0.1037757, -2.259348, 1, 0.5921569, 0, 1,
-1.320985, 0.5408303, -3.363731, 1, 0.6, 0, 1,
-1.318077, -0.7626894, -0.6935211, 1, 0.6078432, 0, 1,
-1.310798, -0.3479557, -2.248942, 1, 0.6117647, 0, 1,
-1.304849, -0.5635951, -2.082824, 1, 0.6196079, 0, 1,
-1.302676, -0.5367758, -1.508428, 1, 0.6235294, 0, 1,
-1.302341, -0.3441156, -3.091137, 1, 0.6313726, 0, 1,
-1.295142, -1.397415, -1.762038, 1, 0.6352941, 0, 1,
-1.294566, 0.07405908, -1.041466, 1, 0.6431373, 0, 1,
-1.292529, -0.937133, -1.351406, 1, 0.6470588, 0, 1,
-1.287638, -0.4342478, -1.80479, 1, 0.654902, 0, 1,
-1.287626, 2.287258, -1.131117, 1, 0.6588235, 0, 1,
-1.283053, -0.107767, -2.754013, 1, 0.6666667, 0, 1,
-1.278992, -0.02852777, -2.14204, 1, 0.6705883, 0, 1,
-1.277532, -0.7322216, -3.146424, 1, 0.6784314, 0, 1,
-1.276674, -0.691816, -2.790302, 1, 0.682353, 0, 1,
-1.273737, 0.1198373, -2.101071, 1, 0.6901961, 0, 1,
-1.252969, 1.920594, -1.292475, 1, 0.6941177, 0, 1,
-1.240018, 2.826357, -1.024551, 1, 0.7019608, 0, 1,
-1.228091, -0.6507923, -1.572552, 1, 0.7098039, 0, 1,
-1.222893, -0.009355561, -1.768265, 1, 0.7137255, 0, 1,
-1.220719, 0.4548929, -0.7051766, 1, 0.7215686, 0, 1,
-1.219098, 1.820406, 0.2072675, 1, 0.7254902, 0, 1,
-1.218922, 1.011228, -2.477781, 1, 0.7333333, 0, 1,
-1.21395, -0.2350017, -3.199913, 1, 0.7372549, 0, 1,
-1.212613, -0.3845322, -2.723745, 1, 0.7450981, 0, 1,
-1.210924, 0.6157656, -1.267171, 1, 0.7490196, 0, 1,
-1.210911, -0.5959277, -1.783566, 1, 0.7568628, 0, 1,
-1.203659, 0.9354245, -1.809641, 1, 0.7607843, 0, 1,
-1.202776, -0.2174796, -1.58157, 1, 0.7686275, 0, 1,
-1.202057, 1.216535, -0.116772, 1, 0.772549, 0, 1,
-1.199417, 1.395989, -1.350351, 1, 0.7803922, 0, 1,
-1.197063, 0.8712298, -1.359956, 1, 0.7843137, 0, 1,
-1.18211, -0.8569167, -2.34838, 1, 0.7921569, 0, 1,
-1.178638, -0.5535591, -1.343582, 1, 0.7960784, 0, 1,
-1.175789, 1.29617, -0.9751461, 1, 0.8039216, 0, 1,
-1.170862, -1.025514, -3.432655, 1, 0.8117647, 0, 1,
-1.165891, 0.2267563, -2.792281, 1, 0.8156863, 0, 1,
-1.16439, -1.477937, -2.444742, 1, 0.8235294, 0, 1,
-1.159909, -0.1179904, -1.957824, 1, 0.827451, 0, 1,
-1.157423, 0.9705232, -0.1248677, 1, 0.8352941, 0, 1,
-1.152366, -0.3474787, -1.648341, 1, 0.8392157, 0, 1,
-1.15167, 0.5605861, 0.5126981, 1, 0.8470588, 0, 1,
-1.149879, 0.7464474, -0.8725287, 1, 0.8509804, 0, 1,
-1.149646, -1.872816, -2.245874, 1, 0.8588235, 0, 1,
-1.147213, -1.091543, -2.477624, 1, 0.8627451, 0, 1,
-1.146002, -0.7717775, -2.875221, 1, 0.8705882, 0, 1,
-1.142575, 0.7981844, -2.076047, 1, 0.8745098, 0, 1,
-1.1408, -1.307581, -2.362367, 1, 0.8823529, 0, 1,
-1.140705, -2.106599, -4.241599, 1, 0.8862745, 0, 1,
-1.139147, 1.931654, -1.872315, 1, 0.8941177, 0, 1,
-1.130949, -1.692458, -2.786703, 1, 0.8980392, 0, 1,
-1.12904, 0.06077683, -0.9880517, 1, 0.9058824, 0, 1,
-1.12822, -0.8183878, 0.1400138, 1, 0.9137255, 0, 1,
-1.126334, -0.0340886, -0.6155616, 1, 0.9176471, 0, 1,
-1.124812, 0.6433018, -0.1718973, 1, 0.9254902, 0, 1,
-1.121673, -0.3232121, -0.8742466, 1, 0.9294118, 0, 1,
-1.116317, 1.29511, -0.7168905, 1, 0.9372549, 0, 1,
-1.115543, 0.1664989, -3.80366, 1, 0.9411765, 0, 1,
-1.114529, -0.6028984, -1.638182, 1, 0.9490196, 0, 1,
-1.108489, -0.9742326, -0.5158268, 1, 0.9529412, 0, 1,
-1.101591, 0.08625465, -1.704567, 1, 0.9607843, 0, 1,
-1.099572, 0.6772846, -1.039955, 1, 0.9647059, 0, 1,
-1.091603, -1.17369, -2.452702, 1, 0.972549, 0, 1,
-1.091329, 0.115453, -2.631628, 1, 0.9764706, 0, 1,
-1.085343, -0.3951268, -1.479046, 1, 0.9843137, 0, 1,
-1.079334, 0.9395261, -0.3416413, 1, 0.9882353, 0, 1,
-1.076146, -0.1679407, -0.3775641, 1, 0.9960784, 0, 1,
-1.071898, 0.599059, -1.346541, 0.9960784, 1, 0, 1,
-1.065943, -1.801855, -3.000083, 0.9921569, 1, 0, 1,
-1.064391, 1.94956, -1.654298, 0.9843137, 1, 0, 1,
-1.036745, 0.324518, -2.279971, 0.9803922, 1, 0, 1,
-1.033955, 0.4795618, -0.3912259, 0.972549, 1, 0, 1,
-1.031436, 0.467424, 0.7628762, 0.9686275, 1, 0, 1,
-1.029981, 0.4215759, -1.785606, 0.9607843, 1, 0, 1,
-1.028562, 2.948302, 1.769787, 0.9568627, 1, 0, 1,
-1.020535, 1.824145, -1.099507, 0.9490196, 1, 0, 1,
-1.020414, -0.2653813, -0.7302086, 0.945098, 1, 0, 1,
-1.019611, 0.2387489, -0.9248102, 0.9372549, 1, 0, 1,
-1.009872, 2.108791, -1.577092, 0.9333333, 1, 0, 1,
-1.008738, -0.4617961, -3.629598, 0.9254902, 1, 0, 1,
-1.007294, 0.8790047, -0.4218276, 0.9215686, 1, 0, 1,
-1.006361, 1.68795, 0.1747011, 0.9137255, 1, 0, 1,
-1.002883, -0.3590646, -2.558221, 0.9098039, 1, 0, 1,
-0.9845983, -1.481485, -1.457826, 0.9019608, 1, 0, 1,
-0.9809967, 1.679608, -0.4387873, 0.8941177, 1, 0, 1,
-0.9806503, -0.13309, -1.860898, 0.8901961, 1, 0, 1,
-0.9764743, 0.4358032, -2.01662, 0.8823529, 1, 0, 1,
-0.976083, 0.448648, -1.18264, 0.8784314, 1, 0, 1,
-0.9720185, -0.5534508, -2.840929, 0.8705882, 1, 0, 1,
-0.9717448, 0.5555464, -1.286878, 0.8666667, 1, 0, 1,
-0.9664904, -0.07384985, -1.070506, 0.8588235, 1, 0, 1,
-0.9626544, 1.428128, -0.21311, 0.854902, 1, 0, 1,
-0.9548585, -0.505003, -1.019284, 0.8470588, 1, 0, 1,
-0.9529458, -0.9176459, -1.439205, 0.8431373, 1, 0, 1,
-0.942192, -1.442153, -3.806752, 0.8352941, 1, 0, 1,
-0.9366491, 0.5293387, -1.079016, 0.8313726, 1, 0, 1,
-0.9355111, 2.099673, 1.706344, 0.8235294, 1, 0, 1,
-0.9347158, 0.7628492, -0.7323093, 0.8196079, 1, 0, 1,
-0.934394, 0.8537167, -2.092997, 0.8117647, 1, 0, 1,
-0.9331589, 1.475395, 0.2950418, 0.8078431, 1, 0, 1,
-0.9323742, 0.5917647, 0.3525295, 0.8, 1, 0, 1,
-0.9279994, 0.8160171, -0.4698255, 0.7921569, 1, 0, 1,
-0.9272791, -0.1622266, -2.07697, 0.7882353, 1, 0, 1,
-0.9257244, -0.4602492, -2.067838, 0.7803922, 1, 0, 1,
-0.9215181, -0.5658994, -4.040692, 0.7764706, 1, 0, 1,
-0.9184409, 2.541296, -1.513973, 0.7686275, 1, 0, 1,
-0.9087764, -0.6178262, 0.006014061, 0.7647059, 1, 0, 1,
-0.9084097, 0.9088876, 0.4385088, 0.7568628, 1, 0, 1,
-0.9065516, 0.6784621, -2.532275, 0.7529412, 1, 0, 1,
-0.8978545, -0.3728184, -0.5948482, 0.7450981, 1, 0, 1,
-0.894988, -0.07564903, -1.885499, 0.7411765, 1, 0, 1,
-0.8943187, 1.612676, -3.171378, 0.7333333, 1, 0, 1,
-0.8918501, -0.443132, -3.216369, 0.7294118, 1, 0, 1,
-0.8898697, -0.1650166, -3.079571, 0.7215686, 1, 0, 1,
-0.8852243, 1.103781, -1.444202, 0.7176471, 1, 0, 1,
-0.885012, -2.4481, -2.382847, 0.7098039, 1, 0, 1,
-0.8771747, -0.9918008, -1.479931, 0.7058824, 1, 0, 1,
-0.8689834, 0.3037408, -0.7902951, 0.6980392, 1, 0, 1,
-0.8682837, -2.444463, -3.944144, 0.6901961, 1, 0, 1,
-0.8671514, 1.81964, -0.3574462, 0.6862745, 1, 0, 1,
-0.8610946, -0.3688302, -1.140064, 0.6784314, 1, 0, 1,
-0.8579683, 0.7494246, -0.7777429, 0.6745098, 1, 0, 1,
-0.8517082, 0.8566695, 0.009893107, 0.6666667, 1, 0, 1,
-0.8502008, 0.1140079, -1.896814, 0.6627451, 1, 0, 1,
-0.8395234, 0.378076, -0.4286064, 0.654902, 1, 0, 1,
-0.8385945, -0.4544763, -2.687035, 0.6509804, 1, 0, 1,
-0.8383974, 0.5401405, 0.1526018, 0.6431373, 1, 0, 1,
-0.8379283, -1.199561, -3.680251, 0.6392157, 1, 0, 1,
-0.8376579, 0.6405752, -0.4225474, 0.6313726, 1, 0, 1,
-0.8335803, -1.166099, -2.437074, 0.627451, 1, 0, 1,
-0.8309327, -0.1402897, -1.955269, 0.6196079, 1, 0, 1,
-0.8298237, -0.7751896, -1.647383, 0.6156863, 1, 0, 1,
-0.8295291, 1.179343, -0.3103987, 0.6078432, 1, 0, 1,
-0.8286253, 0.02348408, -2.153213, 0.6039216, 1, 0, 1,
-0.8279169, -2.059411, -2.548587, 0.5960785, 1, 0, 1,
-0.8265447, -1.859842, -4.855729, 0.5882353, 1, 0, 1,
-0.8194368, 1.416622, -1.121188, 0.5843138, 1, 0, 1,
-0.8184565, 0.5794964, -0.4005073, 0.5764706, 1, 0, 1,
-0.8109421, -1.83128, -4.503946, 0.572549, 1, 0, 1,
-0.8031963, 1.220682, 0.1218056, 0.5647059, 1, 0, 1,
-0.7994022, -0.7887914, -2.222967, 0.5607843, 1, 0, 1,
-0.7984854, -0.1838674, -1.853817, 0.5529412, 1, 0, 1,
-0.7959685, -0.2826862, -2.214791, 0.5490196, 1, 0, 1,
-0.7958182, -0.2515217, -2.629097, 0.5411765, 1, 0, 1,
-0.7851228, 1.003589, -0.1709437, 0.5372549, 1, 0, 1,
-0.7848355, 0.9630352, 0.01829437, 0.5294118, 1, 0, 1,
-0.7835917, -1.190546, -3.329784, 0.5254902, 1, 0, 1,
-0.7776136, -0.4595713, -1.752846, 0.5176471, 1, 0, 1,
-0.7733695, -0.5548086, -2.44735, 0.5137255, 1, 0, 1,
-0.7720526, 0.771336, -2.268918, 0.5058824, 1, 0, 1,
-0.7612187, 0.2483573, -0.8737211, 0.5019608, 1, 0, 1,
-0.7520919, 0.202083, 0.04309317, 0.4941176, 1, 0, 1,
-0.7473112, -1.211354, -2.930223, 0.4862745, 1, 0, 1,
-0.741957, 1.745359, 0.2174992, 0.4823529, 1, 0, 1,
-0.7390843, -1.265433, -3.011756, 0.4745098, 1, 0, 1,
-0.736968, 0.7990417, -0.01217179, 0.4705882, 1, 0, 1,
-0.7343779, 0.2240421, -1.107794, 0.4627451, 1, 0, 1,
-0.7208617, -0.7349905, -3.75383, 0.4588235, 1, 0, 1,
-0.715495, 0.5215208, -2.020564, 0.4509804, 1, 0, 1,
-0.711922, 1.220441, -0.4770418, 0.4470588, 1, 0, 1,
-0.7056642, -0.3673223, -2.042289, 0.4392157, 1, 0, 1,
-0.6979281, 0.3005677, -1.695344, 0.4352941, 1, 0, 1,
-0.694669, 0.3955336, -0.428997, 0.427451, 1, 0, 1,
-0.6913521, -2.538807, -2.150161, 0.4235294, 1, 0, 1,
-0.6881229, -0.4122856, -2.007435, 0.4156863, 1, 0, 1,
-0.682209, 0.05576492, -1.875627, 0.4117647, 1, 0, 1,
-0.6783761, -0.2256451, -1.935108, 0.4039216, 1, 0, 1,
-0.6766436, 1.679003, -0.651437, 0.3960784, 1, 0, 1,
-0.6657535, -2.566668, -5.127217, 0.3921569, 1, 0, 1,
-0.6648906, -0.1332009, -0.6099536, 0.3843137, 1, 0, 1,
-0.6622361, 0.0529677, -1.824676, 0.3803922, 1, 0, 1,
-0.6602376, -1.372609, -2.334681, 0.372549, 1, 0, 1,
-0.6557738, 0.8537076, -0.492147, 0.3686275, 1, 0, 1,
-0.6556028, 1.026076, -0.5223809, 0.3607843, 1, 0, 1,
-0.6500659, -0.2773954, -2.326344, 0.3568628, 1, 0, 1,
-0.6460615, -1.103027, -3.817161, 0.3490196, 1, 0, 1,
-0.6457154, -0.09890775, 0.110039, 0.345098, 1, 0, 1,
-0.6437364, 1.098574, 0.2973202, 0.3372549, 1, 0, 1,
-0.6393036, 1.563201, 0.5797347, 0.3333333, 1, 0, 1,
-0.6366012, -0.4556511, -3.578523, 0.3254902, 1, 0, 1,
-0.635299, 0.7826818, -0.9221577, 0.3215686, 1, 0, 1,
-0.6352453, -0.2864874, -3.253644, 0.3137255, 1, 0, 1,
-0.6322144, -0.4621987, -0.3919315, 0.3098039, 1, 0, 1,
-0.6268464, -0.04790932, -2.047555, 0.3019608, 1, 0, 1,
-0.6246771, 1.651617, -0.3945507, 0.2941177, 1, 0, 1,
-0.6166121, 0.02006078, -2.138024, 0.2901961, 1, 0, 1,
-0.6149019, 0.6641191, -0.364923, 0.282353, 1, 0, 1,
-0.611868, -0.3796928, -0.7988933, 0.2784314, 1, 0, 1,
-0.6109169, -0.1674861, -1.075055, 0.2705882, 1, 0, 1,
-0.6108237, -0.3027355, -2.314409, 0.2666667, 1, 0, 1,
-0.6065813, 0.7255027, 0.04202626, 0.2588235, 1, 0, 1,
-0.5997843, 1.045876, -0.07549178, 0.254902, 1, 0, 1,
-0.5984171, 1.1398, -0.3761737, 0.2470588, 1, 0, 1,
-0.5981265, -2.32754, -3.000614, 0.2431373, 1, 0, 1,
-0.5799066, 0.03815052, -1.98359, 0.2352941, 1, 0, 1,
-0.5759417, -0.8501651, -2.234159, 0.2313726, 1, 0, 1,
-0.5712692, 0.7428736, -1.095627, 0.2235294, 1, 0, 1,
-0.5685871, 0.429713, -1.141642, 0.2196078, 1, 0, 1,
-0.5684004, 0.9896722, 1.530996, 0.2117647, 1, 0, 1,
-0.5681314, 0.9042529, 1.169967, 0.2078431, 1, 0, 1,
-0.5616908, -1.940456, -1.165293, 0.2, 1, 0, 1,
-0.5606894, 0.4140525, -1.069049, 0.1921569, 1, 0, 1,
-0.5594639, -0.3522786, -1.541785, 0.1882353, 1, 0, 1,
-0.5571824, -0.3234175, -2.883954, 0.1803922, 1, 0, 1,
-0.5559685, 0.3168494, -1.414704, 0.1764706, 1, 0, 1,
-0.55071, 0.2070776, -2.995877, 0.1686275, 1, 0, 1,
-0.5498344, 0.2634172, -1.816454, 0.1647059, 1, 0, 1,
-0.5480034, -0.7500677, -3.01596, 0.1568628, 1, 0, 1,
-0.5406655, -0.6214467, -2.230269, 0.1529412, 1, 0, 1,
-0.5312536, -0.5503157, -1.77766, 0.145098, 1, 0, 1,
-0.5286121, -0.9724211, -1.007795, 0.1411765, 1, 0, 1,
-0.5273842, -0.5707862, -1.858489, 0.1333333, 1, 0, 1,
-0.5230461, 0.339452, -0.7169277, 0.1294118, 1, 0, 1,
-0.5228265, 2.386494, 0.6873534, 0.1215686, 1, 0, 1,
-0.5220733, -0.2594047, -2.578143, 0.1176471, 1, 0, 1,
-0.5207663, -0.2964027, -1.572266, 0.1098039, 1, 0, 1,
-0.5207556, 0.0930413, -3.797045, 0.1058824, 1, 0, 1,
-0.5203131, 1.219761, 1.165122, 0.09803922, 1, 0, 1,
-0.5172199, 0.5058649, -0.9259502, 0.09019608, 1, 0, 1,
-0.5162988, -1.228368, -4.173605, 0.08627451, 1, 0, 1,
-0.5135132, 1.086791, -0.1386561, 0.07843138, 1, 0, 1,
-0.5118643, -0.03728669, -2.609425, 0.07450981, 1, 0, 1,
-0.5018994, 1.314422, -1.177672, 0.06666667, 1, 0, 1,
-0.4992541, 0.2025113, -2.764949, 0.0627451, 1, 0, 1,
-0.4899871, -0.6289831, -2.389399, 0.05490196, 1, 0, 1,
-0.481324, 1.30534, -0.9558868, 0.05098039, 1, 0, 1,
-0.4808392, -0.4095598, -1.441558, 0.04313726, 1, 0, 1,
-0.4795603, 0.2631852, -1.069201, 0.03921569, 1, 0, 1,
-0.471298, -0.3607192, -2.08094, 0.03137255, 1, 0, 1,
-0.4705234, -0.6230378, -2.174579, 0.02745098, 1, 0, 1,
-0.4675361, -1.340344, -3.644212, 0.01960784, 1, 0, 1,
-0.4643554, -1.031452, -5.147553, 0.01568628, 1, 0, 1,
-0.4638332, 0.1384686, -1.600704, 0.007843138, 1, 0, 1,
-0.4621366, -0.1041768, -2.421093, 0.003921569, 1, 0, 1,
-0.4612687, 1.084693, 0.08456486, 0, 1, 0.003921569, 1,
-0.4599941, 0.2197185, -0.5018673, 0, 1, 0.01176471, 1,
-0.4558378, -0.3814336, -2.1295, 0, 1, 0.01568628, 1,
-0.4556536, -1.990112, -2.003435, 0, 1, 0.02352941, 1,
-0.4538277, -0.1319104, -0.09084021, 0, 1, 0.02745098, 1,
-0.4497997, 1.197442, 0.6192553, 0, 1, 0.03529412, 1,
-0.4485584, -1.922201, -2.244673, 0, 1, 0.03921569, 1,
-0.4404305, -0.8910336, -3.092247, 0, 1, 0.04705882, 1,
-0.4356734, 1.026499, -0.5913742, 0, 1, 0.05098039, 1,
-0.4336018, 0.7523758, 0.5342846, 0, 1, 0.05882353, 1,
-0.4310672, 1.464049, -0.7074861, 0, 1, 0.0627451, 1,
-0.4264412, 0.7382123, -1.089547, 0, 1, 0.07058824, 1,
-0.4221524, -0.4419884, -3.003688, 0, 1, 0.07450981, 1,
-0.4214562, -0.04192922, -1.275911, 0, 1, 0.08235294, 1,
-0.4203553, -0.751893, -2.324835, 0, 1, 0.08627451, 1,
-0.4198951, -0.4854221, -4.069358, 0, 1, 0.09411765, 1,
-0.4169399, -1.067987, -3.217283, 0, 1, 0.1019608, 1,
-0.4156695, -1.603248, -4.260083, 0, 1, 0.1058824, 1,
-0.4124027, 0.1205987, -1.356264, 0, 1, 0.1137255, 1,
-0.4109683, -0.6036922, -2.970474, 0, 1, 0.1176471, 1,
-0.4108631, 0.5170378, -2.204431, 0, 1, 0.1254902, 1,
-0.4050222, 1.033692, 0.0970563, 0, 1, 0.1294118, 1,
-0.4044833, 1.31814, -0.22914, 0, 1, 0.1372549, 1,
-0.4028558, 0.3093276, 0.2538971, 0, 1, 0.1411765, 1,
-0.4020927, -1.214812, -3.593735, 0, 1, 0.1490196, 1,
-0.398206, 1.101135, -0.9733914, 0, 1, 0.1529412, 1,
-0.3950783, -1.274696, -1.581203, 0, 1, 0.1607843, 1,
-0.3948765, -0.3627367, -4.026207, 0, 1, 0.1647059, 1,
-0.3946699, -0.4690705, -3.233943, 0, 1, 0.172549, 1,
-0.3903978, -0.6150339, -1.744007, 0, 1, 0.1764706, 1,
-0.3850553, 0.7264558, -1.329952, 0, 1, 0.1843137, 1,
-0.3793491, 0.08176957, -1.526455, 0, 1, 0.1882353, 1,
-0.3678322, 0.4492451, -1.044964, 0, 1, 0.1960784, 1,
-0.3663062, -0.8057025, -3.222206, 0, 1, 0.2039216, 1,
-0.3650398, 0.04869457, -1.400216, 0, 1, 0.2078431, 1,
-0.3608826, 0.924598, -0.675504, 0, 1, 0.2156863, 1,
-0.3608035, -0.3324673, -2.721784, 0, 1, 0.2196078, 1,
-0.3512468, 0.8043333, -1.088778, 0, 1, 0.227451, 1,
-0.3506041, 0.2625015, -0.01730267, 0, 1, 0.2313726, 1,
-0.3504729, -1.595388, -2.96463, 0, 1, 0.2392157, 1,
-0.348687, -1.042786, -3.031415, 0, 1, 0.2431373, 1,
-0.3485372, 2.991692, 1.613388, 0, 1, 0.2509804, 1,
-0.3469714, 0.05743456, -0.2906799, 0, 1, 0.254902, 1,
-0.3380364, -0.01066615, -1.200618, 0, 1, 0.2627451, 1,
-0.3374937, 0.5677058, -2.190638, 0, 1, 0.2666667, 1,
-0.3324784, 0.495751, -0.1242434, 0, 1, 0.2745098, 1,
-0.3311249, 0.6763043, -0.3730025, 0, 1, 0.2784314, 1,
-0.3283851, -1.205469, -3.6879, 0, 1, 0.2862745, 1,
-0.32158, 1.123819, -0.7140185, 0, 1, 0.2901961, 1,
-0.3073632, 0.6802862, -0.9168586, 0, 1, 0.2980392, 1,
-0.3064058, 1.776024, -0.5658645, 0, 1, 0.3058824, 1,
-0.3042783, -0.3918272, -4.455512, 0, 1, 0.3098039, 1,
-0.3000981, -0.354293, -1.201299, 0, 1, 0.3176471, 1,
-0.2915701, -0.7663835, -3.645882, 0, 1, 0.3215686, 1,
-0.2911254, 0.4251256, -0.5364149, 0, 1, 0.3294118, 1,
-0.2906671, -2.032038, -3.52958, 0, 1, 0.3333333, 1,
-0.2902519, -0.3592608, -3.222807, 0, 1, 0.3411765, 1,
-0.2846318, -1.311527, -2.556086, 0, 1, 0.345098, 1,
-0.2833407, 0.4768891, -1.080659, 0, 1, 0.3529412, 1,
-0.2804022, -0.6880305, -1.942505, 0, 1, 0.3568628, 1,
-0.2750037, 0.611134, -2.060563, 0, 1, 0.3647059, 1,
-0.273304, -0.09148706, -2.915832, 0, 1, 0.3686275, 1,
-0.2680081, 0.9469392, -0.5214033, 0, 1, 0.3764706, 1,
-0.2677703, -0.117346, -2.616719, 0, 1, 0.3803922, 1,
-0.2664847, -0.1037249, -2.100825, 0, 1, 0.3882353, 1,
-0.2662021, -1.052368, -1.00215, 0, 1, 0.3921569, 1,
-0.260548, -0.06803894, -1.202156, 0, 1, 0.4, 1,
-0.2578096, -0.04601844, -2.558449, 0, 1, 0.4078431, 1,
-0.2563894, -0.01593022, -3.423559, 0, 1, 0.4117647, 1,
-0.2500707, -1.913846, -2.269518, 0, 1, 0.4196078, 1,
-0.2485191, 0.242887, -0.6119571, 0, 1, 0.4235294, 1,
-0.2475062, 1.496342, 0.6420386, 0, 1, 0.4313726, 1,
-0.2465537, 0.6001175, 0.0301603, 0, 1, 0.4352941, 1,
-0.2448894, 1.173959, 0.2994633, 0, 1, 0.4431373, 1,
-0.2330855, 0.1369145, -0.594425, 0, 1, 0.4470588, 1,
-0.2317356, -0.8204035, -3.161101, 0, 1, 0.454902, 1,
-0.2308105, 1.091997, -0.1627932, 0, 1, 0.4588235, 1,
-0.2305788, -0.3915059, -3.594171, 0, 1, 0.4666667, 1,
-0.2291047, 2.033601, -0.5360447, 0, 1, 0.4705882, 1,
-0.2213164, -0.1967385, -1.328472, 0, 1, 0.4784314, 1,
-0.2203454, 0.8218846, -1.663314, 0, 1, 0.4823529, 1,
-0.2154452, 0.3827723, -0.8126783, 0, 1, 0.4901961, 1,
-0.2076857, -0.563773, -1.309476, 0, 1, 0.4941176, 1,
-0.207148, -0.8881352, -5.208203, 0, 1, 0.5019608, 1,
-0.2046549, 0.9797007, 0.2475866, 0, 1, 0.509804, 1,
-0.2017692, 1.13462, 0.7070258, 0, 1, 0.5137255, 1,
-0.2000187, 0.3331605, 0.0521211, 0, 1, 0.5215687, 1,
-0.1968936, -1.911169, -4.556642, 0, 1, 0.5254902, 1,
-0.1945529, -1.153054, -2.830099, 0, 1, 0.5333334, 1,
-0.1923587, -0.1959778, -3.327933, 0, 1, 0.5372549, 1,
-0.1903725, -0.0003036561, -1.009997, 0, 1, 0.5450981, 1,
-0.1889706, -0.005215012, -1.854948, 0, 1, 0.5490196, 1,
-0.1845118, -0.05013821, -1.96412, 0, 1, 0.5568628, 1,
-0.1825561, -0.7182823, -3.225197, 0, 1, 0.5607843, 1,
-0.1795957, 0.6714446, -0.4485455, 0, 1, 0.5686275, 1,
-0.1772562, -0.1375106, -2.654771, 0, 1, 0.572549, 1,
-0.175298, -0.1254052, -1.703179, 0, 1, 0.5803922, 1,
-0.165415, -0.7538309, -2.453959, 0, 1, 0.5843138, 1,
-0.1595726, 0.4485497, -1.157066, 0, 1, 0.5921569, 1,
-0.1582089, -0.3909976, -2.692983, 0, 1, 0.5960785, 1,
-0.1530659, -0.3108898, -3.640848, 0, 1, 0.6039216, 1,
-0.147572, 0.7228086, -0.7057438, 0, 1, 0.6117647, 1,
-0.1472874, -0.9136617, -3.039748, 0, 1, 0.6156863, 1,
-0.1447629, 2.935342, 0.285899, 0, 1, 0.6235294, 1,
-0.1429661, 1.16228, 1.164448, 0, 1, 0.627451, 1,
-0.1423655, -1.842768, -3.225096, 0, 1, 0.6352941, 1,
-0.1393031, -0.2481648, -3.046288, 0, 1, 0.6392157, 1,
-0.1281095, 0.4211301, -0.9510582, 0, 1, 0.6470588, 1,
-0.1271321, 0.4188622, 1.454348, 0, 1, 0.6509804, 1,
-0.1253458, -1.462027, -3.629566, 0, 1, 0.6588235, 1,
-0.1227569, -0.5716417, -2.535852, 0, 1, 0.6627451, 1,
-0.1226644, 0.5391433, -1.634585, 0, 1, 0.6705883, 1,
-0.1219043, -0.9288679, -3.724688, 0, 1, 0.6745098, 1,
-0.1215587, -0.7914916, -3.171451, 0, 1, 0.682353, 1,
-0.1206198, 0.05038107, -1.601107, 0, 1, 0.6862745, 1,
-0.1200522, 1.120475, -2.157729, 0, 1, 0.6941177, 1,
-0.1183532, 0.2804495, -0.8657472, 0, 1, 0.7019608, 1,
-0.1135237, -1.755529, -4.633729, 0, 1, 0.7058824, 1,
-0.1116873, -0.820365, -3.838917, 0, 1, 0.7137255, 1,
-0.110488, 0.7340825, -0.1105598, 0, 1, 0.7176471, 1,
-0.1077984, 1.451545, 0.009425898, 0, 1, 0.7254902, 1,
-0.105047, -0.8542753, -4.195534, 0, 1, 0.7294118, 1,
-0.1049377, -0.8971617, -2.682067, 0, 1, 0.7372549, 1,
-0.1048055, 0.07296028, -0.8549808, 0, 1, 0.7411765, 1,
-0.1028998, 0.8700917, -1.62702, 0, 1, 0.7490196, 1,
-0.102491, -1.943067, -3.128386, 0, 1, 0.7529412, 1,
-0.09589019, 1.136535, 0.4444865, 0, 1, 0.7607843, 1,
-0.09434233, -0.5117708, -3.326579, 0, 1, 0.7647059, 1,
-0.08753664, -1.09051, -4.450206, 0, 1, 0.772549, 1,
-0.08528917, 0.5677503, 0.2753617, 0, 1, 0.7764706, 1,
-0.08512953, 0.3573892, -0.9750438, 0, 1, 0.7843137, 1,
-0.08304178, -0.136914, -3.090613, 0, 1, 0.7882353, 1,
-0.0820931, 0.2151165, -1.456652, 0, 1, 0.7960784, 1,
-0.07967234, -1.440756, -2.50727, 0, 1, 0.8039216, 1,
-0.07605752, 0.4772394, 0.7308028, 0, 1, 0.8078431, 1,
-0.07134017, -0.7200118, -3.111288, 0, 1, 0.8156863, 1,
-0.07075271, -0.5838911, -3.475507, 0, 1, 0.8196079, 1,
-0.06930119, 0.9905765, 1.069234, 0, 1, 0.827451, 1,
-0.06851055, 0.9121743, -0.5181442, 0, 1, 0.8313726, 1,
-0.067232, -1.228098, -2.791019, 0, 1, 0.8392157, 1,
-0.06657314, -1.037761, -1.663359, 0, 1, 0.8431373, 1,
-0.06620311, 1.15933, 0.5462931, 0, 1, 0.8509804, 1,
-0.06386718, 0.9484981, 1.372526, 0, 1, 0.854902, 1,
-0.06220346, 0.4767115, 0.4702721, 0, 1, 0.8627451, 1,
-0.05506238, -0.7131371, -2.311031, 0, 1, 0.8666667, 1,
-0.05267351, 0.01235816, -0.4694802, 0, 1, 0.8745098, 1,
-0.04697055, -0.08229686, -3.241035, 0, 1, 0.8784314, 1,
-0.04097942, 1.924881, -0.2512944, 0, 1, 0.8862745, 1,
-0.035258, 0.03276224, -1.494124, 0, 1, 0.8901961, 1,
-0.03362142, 1.681716, 0.4432397, 0, 1, 0.8980392, 1,
-0.03222423, 0.2369361, -0.6924716, 0, 1, 0.9058824, 1,
-0.03140863, 2.650116, 0.8424753, 0, 1, 0.9098039, 1,
-0.03104365, -0.5981866, -2.939287, 0, 1, 0.9176471, 1,
-0.02858084, -1.118146, -2.761704, 0, 1, 0.9215686, 1,
-0.02854708, -0.007418772, -1.756989, 0, 1, 0.9294118, 1,
-0.02738355, -0.1399526, -2.799335, 0, 1, 0.9333333, 1,
-0.02730254, -0.8058221, -3.252272, 0, 1, 0.9411765, 1,
-0.02596636, 0.1950553, 0.9374343, 0, 1, 0.945098, 1,
-0.0220446, -1.189576, -3.868036, 0, 1, 0.9529412, 1,
-0.02196765, -0.9702451, -3.833135, 0, 1, 0.9568627, 1,
-0.01296147, 0.3394257, 0.6409776, 0, 1, 0.9647059, 1,
-0.01125623, 0.09139454, -0.6283768, 0, 1, 0.9686275, 1,
-0.008699339, 0.6834891, -0.5742276, 0, 1, 0.9764706, 1,
-0.008439601, 1.128472, -1.094364, 0, 1, 0.9803922, 1,
-0.006163687, 1.313985, 1.421642, 0, 1, 0.9882353, 1,
-0.004402166, 0.5676593, 1.249409, 0, 1, 0.9921569, 1,
0.001309798, 1.319821, 0.219077, 0, 1, 1, 1,
0.001965272, 0.2888827, -0.4611631, 0, 0.9921569, 1, 1,
0.004236981, 0.143218, -0.6890697, 0, 0.9882353, 1, 1,
0.006301072, -1.022844, 2.914928, 0, 0.9803922, 1, 1,
0.008781453, 0.859533, -0.6852938, 0, 0.9764706, 1, 1,
0.01019276, 1.455416, -0.4914792, 0, 0.9686275, 1, 1,
0.01150442, 1.549601, 0.4501145, 0, 0.9647059, 1, 1,
0.01157161, -0.2647491, 2.789523, 0, 0.9568627, 1, 1,
0.01349332, -0.1927073, 3.361127, 0, 0.9529412, 1, 1,
0.01532907, 0.2624578, 1.775925, 0, 0.945098, 1, 1,
0.01756361, 1.194203, 0.6859078, 0, 0.9411765, 1, 1,
0.01899901, 0.4072221, 0.6658037, 0, 0.9333333, 1, 1,
0.02314046, 1.878794, 0.1405058, 0, 0.9294118, 1, 1,
0.02457616, 0.615711, 0.6378299, 0, 0.9215686, 1, 1,
0.02982576, 0.1908955, -0.6166235, 0, 0.9176471, 1, 1,
0.03090038, -0.1957908, 3.838828, 0, 0.9098039, 1, 1,
0.03222201, 0.4705612, -0.4306982, 0, 0.9058824, 1, 1,
0.03503206, -0.8899852, 4.047319, 0, 0.8980392, 1, 1,
0.03603484, 0.411114, -1.433087, 0, 0.8901961, 1, 1,
0.03769984, 0.1425909, 0.2730199, 0, 0.8862745, 1, 1,
0.03773968, 0.4076157, 1.186356, 0, 0.8784314, 1, 1,
0.0414099, 0.03759089, 0.1242111, 0, 0.8745098, 1, 1,
0.04306922, -1.407056, 1.297399, 0, 0.8666667, 1, 1,
0.04526342, -0.1948123, 3.411561, 0, 0.8627451, 1, 1,
0.04866092, -0.7516416, 2.402547, 0, 0.854902, 1, 1,
0.04881123, 0.711853, 0.811704, 0, 0.8509804, 1, 1,
0.04954159, 0.6112919, 0.774053, 0, 0.8431373, 1, 1,
0.04994613, -0.03025375, 1.408412, 0, 0.8392157, 1, 1,
0.05211957, -0.5906124, 4.907725, 0, 0.8313726, 1, 1,
0.05251059, -0.6986138, 1.999901, 0, 0.827451, 1, 1,
0.05389139, -0.2281753, 3.128944, 0, 0.8196079, 1, 1,
0.05408125, 0.3065202, 0.9195687, 0, 0.8156863, 1, 1,
0.05867605, 1.703642, 0.5605292, 0, 0.8078431, 1, 1,
0.0644403, -1.704483, 1.953033, 0, 0.8039216, 1, 1,
0.06517859, 0.4804288, -0.01859081, 0, 0.7960784, 1, 1,
0.06575886, -0.2205656, 3.265025, 0, 0.7882353, 1, 1,
0.06614619, -0.9693457, 2.409043, 0, 0.7843137, 1, 1,
0.06743295, -0.4791346, 0.05186656, 0, 0.7764706, 1, 1,
0.06752364, 0.9924339, -0.7091901, 0, 0.772549, 1, 1,
0.06808466, 0.6458949, 0.6851519, 0, 0.7647059, 1, 1,
0.06847452, 0.2274724, -0.06426211, 0, 0.7607843, 1, 1,
0.07065179, 0.2209514, 1.866639, 0, 0.7529412, 1, 1,
0.07159952, -0.455815, 2.299785, 0, 0.7490196, 1, 1,
0.07274615, -0.3718843, 2.948134, 0, 0.7411765, 1, 1,
0.07463611, 0.8311254, -0.3023277, 0, 0.7372549, 1, 1,
0.07614537, -0.7102824, 4.378252, 0, 0.7294118, 1, 1,
0.07853974, 0.4075589, 0.19808, 0, 0.7254902, 1, 1,
0.08189791, -0.1725439, 4.070361, 0, 0.7176471, 1, 1,
0.0824931, 0.8038225, -0.3498403, 0, 0.7137255, 1, 1,
0.08432988, 2.443122, 0.4337179, 0, 0.7058824, 1, 1,
0.08508496, 2.448917, -0.9675785, 0, 0.6980392, 1, 1,
0.08555199, 0.230075, -1.978171, 0, 0.6941177, 1, 1,
0.088884, -0.946054, 3.096704, 0, 0.6862745, 1, 1,
0.09211174, -0.246846, 2.199157, 0, 0.682353, 1, 1,
0.0922991, -0.8408126, 3.511458, 0, 0.6745098, 1, 1,
0.09474198, -0.7029898, 2.851956, 0, 0.6705883, 1, 1,
0.09536485, -0.03745171, 2.418712, 0, 0.6627451, 1, 1,
0.09608798, -1.167074, 4.201532, 0, 0.6588235, 1, 1,
0.09699563, -1.105237, 3.536071, 0, 0.6509804, 1, 1,
0.09804812, -0.3515534, 3.096375, 0, 0.6470588, 1, 1,
0.1039538, -0.07386897, 2.179123, 0, 0.6392157, 1, 1,
0.1063387, 1.001385, -0.4145761, 0, 0.6352941, 1, 1,
0.1063778, -0.5665081, 2.566858, 0, 0.627451, 1, 1,
0.1069031, -0.2524443, 1.052143, 0, 0.6235294, 1, 1,
0.1071306, -0.8454004, 2.923409, 0, 0.6156863, 1, 1,
0.1099627, 0.739817, 1.473563, 0, 0.6117647, 1, 1,
0.1099632, 0.6122563, -0.5488785, 0, 0.6039216, 1, 1,
0.1105795, -0.5095339, 2.01723, 0, 0.5960785, 1, 1,
0.1147404, -0.5064889, 1.506802, 0, 0.5921569, 1, 1,
0.1164434, -0.4626381, 3.112252, 0, 0.5843138, 1, 1,
0.1215738, 1.022114, -0.311123, 0, 0.5803922, 1, 1,
0.122234, -0.7005459, 1.377201, 0, 0.572549, 1, 1,
0.1260584, 0.1756359, 1.368803, 0, 0.5686275, 1, 1,
0.1330544, 0.00353539, 1.980301, 0, 0.5607843, 1, 1,
0.1334536, 1.923914, -0.9654089, 0, 0.5568628, 1, 1,
0.1339694, 0.5849131, -0.3361873, 0, 0.5490196, 1, 1,
0.1399542, -0.9618769, 3.636431, 0, 0.5450981, 1, 1,
0.1475033, 0.7784993, 0.7976909, 0, 0.5372549, 1, 1,
0.1503883, -1.159432, 2.913252, 0, 0.5333334, 1, 1,
0.1532535, -1.251925, 2.696089, 0, 0.5254902, 1, 1,
0.1566163, 1.015133, 0.7582063, 0, 0.5215687, 1, 1,
0.1580184, 1.244177, 0.3890245, 0, 0.5137255, 1, 1,
0.1614164, 0.1155861, 1.5399, 0, 0.509804, 1, 1,
0.1641169, 0.8708739, -0.3653352, 0, 0.5019608, 1, 1,
0.1645903, -0.9195519, 3.019201, 0, 0.4941176, 1, 1,
0.1663624, 0.9863396, 0.9992632, 0, 0.4901961, 1, 1,
0.1674293, -0.3397116, 2.159879, 0, 0.4823529, 1, 1,
0.1743136, -1.995853, 3.046451, 0, 0.4784314, 1, 1,
0.1752661, -0.2558539, 1.874016, 0, 0.4705882, 1, 1,
0.1762516, 0.5073152, -1.489878, 0, 0.4666667, 1, 1,
0.1795352, 0.7766425, 1.186289, 0, 0.4588235, 1, 1,
0.1816442, 1.836623, 0.717168, 0, 0.454902, 1, 1,
0.1821654, -1.246045, 3.729137, 0, 0.4470588, 1, 1,
0.1873535, 1.046528, -1.585527, 0, 0.4431373, 1, 1,
0.1893429, 0.6393245, -0.017287, 0, 0.4352941, 1, 1,
0.1911511, -1.245568, 2.673517, 0, 0.4313726, 1, 1,
0.1921891, 1.472121, -0.2511038, 0, 0.4235294, 1, 1,
0.1940263, 0.417072, 0.1421295, 0, 0.4196078, 1, 1,
0.2008161, -0.1672442, 3.489598, 0, 0.4117647, 1, 1,
0.2029229, -0.876256, 1.265335, 0, 0.4078431, 1, 1,
0.2046642, -1.096856, 1.530269, 0, 0.4, 1, 1,
0.2067117, -0.08181523, 2.654235, 0, 0.3921569, 1, 1,
0.2073384, -2.200566, 3.065968, 0, 0.3882353, 1, 1,
0.2101337, -0.6774757, 0.6580405, 0, 0.3803922, 1, 1,
0.2139832, -2.255471, 2.077194, 0, 0.3764706, 1, 1,
0.2186065, -1.92728, 1.917372, 0, 0.3686275, 1, 1,
0.218956, -0.3258147, 2.667437, 0, 0.3647059, 1, 1,
0.2190717, 0.7984519, 2.806052, 0, 0.3568628, 1, 1,
0.2204663, -0.4246996, 2.915956, 0, 0.3529412, 1, 1,
0.2232663, 0.7942213, -0.03732359, 0, 0.345098, 1, 1,
0.22577, -0.6672626, 2.066602, 0, 0.3411765, 1, 1,
0.2297726, 1.135465, 1.399525, 0, 0.3333333, 1, 1,
0.2311522, 0.4922785, -0.1806263, 0, 0.3294118, 1, 1,
0.2342349, 0.3071216, 0.1851696, 0, 0.3215686, 1, 1,
0.23591, 0.6157383, 0.05591544, 0, 0.3176471, 1, 1,
0.2370068, -0.693158, 2.247466, 0, 0.3098039, 1, 1,
0.2392926, 1.114052, 0.04072242, 0, 0.3058824, 1, 1,
0.2394106, -0.2645667, 2.43012, 0, 0.2980392, 1, 1,
0.2413819, 0.3004354, 1.947021, 0, 0.2901961, 1, 1,
0.2417997, -0.5225589, 2.40958, 0, 0.2862745, 1, 1,
0.2436383, -1.151273, 1.465812, 0, 0.2784314, 1, 1,
0.251788, 1.482767, 1.677995, 0, 0.2745098, 1, 1,
0.262096, -0.4094968, 0.4896624, 0, 0.2666667, 1, 1,
0.2642987, -1.332069, 3.057184, 0, 0.2627451, 1, 1,
0.2698327, 0.5720075, 2.680911, 0, 0.254902, 1, 1,
0.2702501, 1.328481, 0.2542817, 0, 0.2509804, 1, 1,
0.2724113, 0.4331019, 0.4522953, 0, 0.2431373, 1, 1,
0.2840115, 0.2330063, 1.281656, 0, 0.2392157, 1, 1,
0.2843642, 0.5077068, -0.1048234, 0, 0.2313726, 1, 1,
0.2899289, 0.09396707, 2.168897, 0, 0.227451, 1, 1,
0.2902432, -1.68193, 2.930375, 0, 0.2196078, 1, 1,
0.2903432, -0.2161955, 3.376507, 0, 0.2156863, 1, 1,
0.2913041, 1.579715, 0.4918418, 0, 0.2078431, 1, 1,
0.2935323, -0.4900612, 1.286261, 0, 0.2039216, 1, 1,
0.2940422, 0.08361921, 1.866673, 0, 0.1960784, 1, 1,
0.2958486, 0.1215783, 2.246607, 0, 0.1882353, 1, 1,
0.2975813, -0.02857968, 0.9706988, 0, 0.1843137, 1, 1,
0.3009343, 0.5737659, 0.2606759, 0, 0.1764706, 1, 1,
0.3031735, 1.46601, -0.01150789, 0, 0.172549, 1, 1,
0.3037994, -0.4423027, 2.240944, 0, 0.1647059, 1, 1,
0.3068159, -1.598884, 3.178773, 0, 0.1607843, 1, 1,
0.308293, 0.9814792, -0.6335603, 0, 0.1529412, 1, 1,
0.3223886, -0.4620893, 1.250382, 0, 0.1490196, 1, 1,
0.3230846, 0.6702271, 0.3743934, 0, 0.1411765, 1, 1,
0.3259114, -0.3734134, 4.06426, 0, 0.1372549, 1, 1,
0.3268288, -0.375353, 3.537291, 0, 0.1294118, 1, 1,
0.3294916, 0.1396677, 1.802183, 0, 0.1254902, 1, 1,
0.3299967, 1.729777, 1.169919, 0, 0.1176471, 1, 1,
0.3313898, -2.442029, 5.154346, 0, 0.1137255, 1, 1,
0.3332436, -0.6830657, 3.696268, 0, 0.1058824, 1, 1,
0.3353937, 0.62884, 0.224214, 0, 0.09803922, 1, 1,
0.3388248, 0.8633354, 0.6539076, 0, 0.09411765, 1, 1,
0.3424127, -0.1822588, 2.634231, 0, 0.08627451, 1, 1,
0.343112, -1.351617, 3.951375, 0, 0.08235294, 1, 1,
0.343491, 0.3401673, 0.8671167, 0, 0.07450981, 1, 1,
0.3580859, 0.4191345, 0.2728736, 0, 0.07058824, 1, 1,
0.3583166, -0.2881957, 3.412916, 0, 0.0627451, 1, 1,
0.3606058, -1.279629, 6.184458, 0, 0.05882353, 1, 1,
0.368646, -0.006028515, 2.214185, 0, 0.05098039, 1, 1,
0.3768488, 1.026446, 0.754042, 0, 0.04705882, 1, 1,
0.3851331, 1.97026, 0.6455005, 0, 0.03921569, 1, 1,
0.3885287, -0.1648953, 2.767948, 0, 0.03529412, 1, 1,
0.3931988, 0.9175959, 1.499464, 0, 0.02745098, 1, 1,
0.3957637, 0.7946079, -0.8103417, 0, 0.02352941, 1, 1,
0.3980688, -0.3334002, 2.676897, 0, 0.01568628, 1, 1,
0.3980996, -0.8753315, 1.403299, 0, 0.01176471, 1, 1,
0.4014297, -0.4756366, 3.168561, 0, 0.003921569, 1, 1,
0.4075505, -0.2590515, 3.391879, 0.003921569, 0, 1, 1,
0.4102845, 1.237991, -0.2675263, 0.007843138, 0, 1, 1,
0.4130857, 0.8572659, 0.9545121, 0.01568628, 0, 1, 1,
0.4132018, -0.07327645, 2.527381, 0.01960784, 0, 1, 1,
0.4190325, -0.240352, 3.22483, 0.02745098, 0, 1, 1,
0.4190773, -0.4705648, 1.457629, 0.03137255, 0, 1, 1,
0.4200865, 1.47459, 0.06272342, 0.03921569, 0, 1, 1,
0.4213912, 1.651075, 1.380547, 0.04313726, 0, 1, 1,
0.4235609, -0.646911, 1.901178, 0.05098039, 0, 1, 1,
0.4238735, 0.4439739, 0.3973021, 0.05490196, 0, 1, 1,
0.42727, -0.02930556, 1.102719, 0.0627451, 0, 1, 1,
0.4289945, 0.1352546, 2.462017, 0.06666667, 0, 1, 1,
0.4320873, 0.1590312, 1.406959, 0.07450981, 0, 1, 1,
0.4348811, -0.3267252, 3.245363, 0.07843138, 0, 1, 1,
0.4348903, 0.6353441, 0.5923675, 0.08627451, 0, 1, 1,
0.435944, -1.004655, 3.017807, 0.09019608, 0, 1, 1,
0.4361506, 0.8914599, 0.9998863, 0.09803922, 0, 1, 1,
0.4377631, 0.6554015, 0.1773427, 0.1058824, 0, 1, 1,
0.4436838, 1.848834, 0.482794, 0.1098039, 0, 1, 1,
0.4462198, -1.438133, 1.964684, 0.1176471, 0, 1, 1,
0.4518716, 0.4763788, 1.368655, 0.1215686, 0, 1, 1,
0.453951, -0.6841979, 3.245934, 0.1294118, 0, 1, 1,
0.4541623, 0.7329032, 0.9427429, 0.1333333, 0, 1, 1,
0.4547902, 0.5714639, 1.554807, 0.1411765, 0, 1, 1,
0.4553359, 1.502608, 1.120181, 0.145098, 0, 1, 1,
0.4555674, -0.8935226, 2.965151, 0.1529412, 0, 1, 1,
0.4570821, -0.1498297, 2.964365, 0.1568628, 0, 1, 1,
0.4650038, -0.7726936, 4.307757, 0.1647059, 0, 1, 1,
0.4662131, 1.82429, 0.6297769, 0.1686275, 0, 1, 1,
0.4680925, 0.01518654, 1.235129, 0.1764706, 0, 1, 1,
0.4821827, 0.4045175, -0.8679379, 0.1803922, 0, 1, 1,
0.4828009, 1.067795, -0.5319124, 0.1882353, 0, 1, 1,
0.4872517, 1.378603, 1.96918, 0.1921569, 0, 1, 1,
0.489287, -0.5505079, 1.990107, 0.2, 0, 1, 1,
0.4925391, 0.07634491, 1.640522, 0.2078431, 0, 1, 1,
0.4970683, -1.433288, 1.674041, 0.2117647, 0, 1, 1,
0.4990887, -1.188165, 3.580976, 0.2196078, 0, 1, 1,
0.5022785, -0.2984284, 1.584183, 0.2235294, 0, 1, 1,
0.5041749, 0.5968345, 2.383557, 0.2313726, 0, 1, 1,
0.5140119, 1.624876, -0.631538, 0.2352941, 0, 1, 1,
0.5174434, 0.7360588, 1.820203, 0.2431373, 0, 1, 1,
0.5220577, 0.6811836, 0.03982243, 0.2470588, 0, 1, 1,
0.5277684, 0.9627199, 0.9560206, 0.254902, 0, 1, 1,
0.5285331, 1.283092, 0.4826465, 0.2588235, 0, 1, 1,
0.5296609, 0.3509468, 2.567183, 0.2666667, 0, 1, 1,
0.5308825, 0.2703087, -0.3479645, 0.2705882, 0, 1, 1,
0.5310736, -0.5238746, 3.341026, 0.2784314, 0, 1, 1,
0.5335576, -0.624878, 1.880909, 0.282353, 0, 1, 1,
0.5348295, -1.419876, 3.293408, 0.2901961, 0, 1, 1,
0.5354874, 1.329427, 0.5281298, 0.2941177, 0, 1, 1,
0.5383701, 0.7169797, 0.9080351, 0.3019608, 0, 1, 1,
0.5389078, 0.614388, 1.956527, 0.3098039, 0, 1, 1,
0.5419872, 0.1920856, 1.268894, 0.3137255, 0, 1, 1,
0.5502836, -0.9130071, 4.269937, 0.3215686, 0, 1, 1,
0.5530733, -0.03625534, 1.55984, 0.3254902, 0, 1, 1,
0.5532845, 0.6028105, 1.206426, 0.3333333, 0, 1, 1,
0.5558566, -0.4529748, 2.48265, 0.3372549, 0, 1, 1,
0.5580918, -1.337065, 4.330712, 0.345098, 0, 1, 1,
0.5596249, 1.141011, -0.2884455, 0.3490196, 0, 1, 1,
0.5673674, 0.7890519, 0.3037614, 0.3568628, 0, 1, 1,
0.5681162, -1.002641, 1.596516, 0.3607843, 0, 1, 1,
0.5701389, -0.3999591, 2.81577, 0.3686275, 0, 1, 1,
0.5727865, 0.3932057, 2.753931, 0.372549, 0, 1, 1,
0.5730437, 1.688741, 0.2715514, 0.3803922, 0, 1, 1,
0.574684, 1.249685, -0.6278566, 0.3843137, 0, 1, 1,
0.5797995, -0.03585643, 0.3125058, 0.3921569, 0, 1, 1,
0.5863523, -0.04901811, 1.878342, 0.3960784, 0, 1, 1,
0.5924829, 0.239826, -0.1695156, 0.4039216, 0, 1, 1,
0.5950683, -1.020493, 3.101412, 0.4117647, 0, 1, 1,
0.5957533, -1.340574, 2.56114, 0.4156863, 0, 1, 1,
0.5963956, 0.1765525, 0.8034421, 0.4235294, 0, 1, 1,
0.6023883, 1.046586, 0.7748396, 0.427451, 0, 1, 1,
0.6083658, -0.6994452, 3.809877, 0.4352941, 0, 1, 1,
0.6116446, -2.260226, 3.318285, 0.4392157, 0, 1, 1,
0.6131077, -2.012083, 3.126638, 0.4470588, 0, 1, 1,
0.6133958, 0.0637721, 2.135307, 0.4509804, 0, 1, 1,
0.6148956, 1.158804, 1.172535, 0.4588235, 0, 1, 1,
0.6169205, -0.7486911, 0.3268446, 0.4627451, 0, 1, 1,
0.6182745, 0.5535411, 1.144453, 0.4705882, 0, 1, 1,
0.6187904, 1.703933, 0.3494625, 0.4745098, 0, 1, 1,
0.6190887, -1.704586, 2.807245, 0.4823529, 0, 1, 1,
0.6214983, -2.952036, 3.021763, 0.4862745, 0, 1, 1,
0.6338832, 0.1015402, 2.285157, 0.4941176, 0, 1, 1,
0.6462706, 1.137864, 1.854569, 0.5019608, 0, 1, 1,
0.6478179, 1.029654, 1.078286, 0.5058824, 0, 1, 1,
0.6498894, -0.9771561, 2.539922, 0.5137255, 0, 1, 1,
0.6506318, -1.230235, 1.972682, 0.5176471, 0, 1, 1,
0.651812, -0.5206584, 2.329934, 0.5254902, 0, 1, 1,
0.6522876, 0.699267, 1.575364, 0.5294118, 0, 1, 1,
0.6525958, 0.6463046, -0.3336186, 0.5372549, 0, 1, 1,
0.652988, -0.6153374, 1.943815, 0.5411765, 0, 1, 1,
0.6553031, -0.8056351, 0.7084447, 0.5490196, 0, 1, 1,
0.6605048, 1.248981, 0.3171898, 0.5529412, 0, 1, 1,
0.6614389, 1.595731, 1.214628, 0.5607843, 0, 1, 1,
0.6626583, -1.188717, 2.273195, 0.5647059, 0, 1, 1,
0.6635184, -0.2233127, 0.8560507, 0.572549, 0, 1, 1,
0.6646901, 0.570278, 0.1815024, 0.5764706, 0, 1, 1,
0.672156, -0.3666444, 1.720742, 0.5843138, 0, 1, 1,
0.6729935, 1.119081, 0.2278099, 0.5882353, 0, 1, 1,
0.6737136, 0.3766148, 0.5406524, 0.5960785, 0, 1, 1,
0.6806709, 0.5131209, 2.033723, 0.6039216, 0, 1, 1,
0.6821703, 0.4750758, 2.144693, 0.6078432, 0, 1, 1,
0.6859621, -0.9205204, 2.798034, 0.6156863, 0, 1, 1,
0.6870473, 1.087183, 1.247672, 0.6196079, 0, 1, 1,
0.6919265, 1.324541, 0.316401, 0.627451, 0, 1, 1,
0.7018739, -0.9194613, 3.832852, 0.6313726, 0, 1, 1,
0.7068896, 1.153241, -0.4296314, 0.6392157, 0, 1, 1,
0.7085049, 1.329049, 0.2604589, 0.6431373, 0, 1, 1,
0.7171546, 2.487064, -0.5786376, 0.6509804, 0, 1, 1,
0.7194912, -1.687852, 2.14011, 0.654902, 0, 1, 1,
0.7204744, -0.6343566, 0.2416327, 0.6627451, 0, 1, 1,
0.722455, -0.4242759, 1.002598, 0.6666667, 0, 1, 1,
0.7256522, 0.8023531, -0.3978812, 0.6745098, 0, 1, 1,
0.7334088, -0.5209411, 1.790432, 0.6784314, 0, 1, 1,
0.7400728, 1.644046, 1.607198, 0.6862745, 0, 1, 1,
0.741299, -1.630748, 1.268923, 0.6901961, 0, 1, 1,
0.7542992, 0.5570402, 0.4218738, 0.6980392, 0, 1, 1,
0.7545205, -0.9898066, 1.488933, 0.7058824, 0, 1, 1,
0.7548392, -0.9180439, 4.013478, 0.7098039, 0, 1, 1,
0.7562385, 0.3538919, 1.122133, 0.7176471, 0, 1, 1,
0.7593955, -1.241081, 3.041582, 0.7215686, 0, 1, 1,
0.7608814, -1.263325, 1.72727, 0.7294118, 0, 1, 1,
0.7628829, 0.8936436, 1.43249, 0.7333333, 0, 1, 1,
0.7669622, -0.9227623, 2.178497, 0.7411765, 0, 1, 1,
0.7669966, 0.1859499, 1.642638, 0.7450981, 0, 1, 1,
0.7680143, 0.4071186, 1.192208, 0.7529412, 0, 1, 1,
0.7752768, 1.641926, -0.1439719, 0.7568628, 0, 1, 1,
0.7836049, 0.007451575, 1.98668, 0.7647059, 0, 1, 1,
0.7862883, 0.3186592, 2.211725, 0.7686275, 0, 1, 1,
0.7864507, -1.256213, 0.9839482, 0.7764706, 0, 1, 1,
0.787822, 1.821464, 0.8396693, 0.7803922, 0, 1, 1,
0.7991304, -1.177168, 3.161447, 0.7882353, 0, 1, 1,
0.8027878, 0.2722896, 0.7301546, 0.7921569, 0, 1, 1,
0.8049047, -0.6431927, 2.168922, 0.8, 0, 1, 1,
0.8137868, -0.8576969, 1.77218, 0.8078431, 0, 1, 1,
0.8145061, -0.1435313, 1.957212, 0.8117647, 0, 1, 1,
0.8180407, -0.4332993, 2.527598, 0.8196079, 0, 1, 1,
0.8256583, -0.4653401, 1.667016, 0.8235294, 0, 1, 1,
0.8266605, 2.154929, 0.4706666, 0.8313726, 0, 1, 1,
0.8325119, -0.2274489, 0.2014896, 0.8352941, 0, 1, 1,
0.8331774, 0.9332808, -1.034999, 0.8431373, 0, 1, 1,
0.8367913, 1.035661, 0.6969305, 0.8470588, 0, 1, 1,
0.8381302, -0.04950526, 1.281417, 0.854902, 0, 1, 1,
0.8495812, 0.2374349, -0.2312438, 0.8588235, 0, 1, 1,
0.8530772, -0.1564511, 3.620043, 0.8666667, 0, 1, 1,
0.8539237, -0.8747754, 1.111905, 0.8705882, 0, 1, 1,
0.8559975, 2.110847, 0.932382, 0.8784314, 0, 1, 1,
0.8612652, 1.066769, -0.513223, 0.8823529, 0, 1, 1,
0.8649846, -0.7775229, 1.604332, 0.8901961, 0, 1, 1,
0.8669963, -0.7467685, 4.088582, 0.8941177, 0, 1, 1,
0.8689612, 1.61694, 0.1285539, 0.9019608, 0, 1, 1,
0.8703699, 0.1166498, -0.01132286, 0.9098039, 0, 1, 1,
0.8770581, -0.3569745, 3.92107, 0.9137255, 0, 1, 1,
0.8875427, 0.1517802, 1.547467, 0.9215686, 0, 1, 1,
0.8883194, 0.9662213, -0.8320127, 0.9254902, 0, 1, 1,
0.8885768, 1.426269, 2.141044, 0.9333333, 0, 1, 1,
0.8889892, 0.5731383, 1.085786, 0.9372549, 0, 1, 1,
0.8904442, 0.8051904, 0.07695717, 0.945098, 0, 1, 1,
0.8906405, -1.221154, 1.748984, 0.9490196, 0, 1, 1,
0.8929738, -1.244139, 2.486336, 0.9568627, 0, 1, 1,
0.8965571, -0.006622959, 0.5224375, 0.9607843, 0, 1, 1,
0.8974661, 0.7242141, 2.35514, 0.9686275, 0, 1, 1,
0.9021013, -0.26207, 0.28899, 0.972549, 0, 1, 1,
0.9030137, -0.8084368, 1.266799, 0.9803922, 0, 1, 1,
0.9033968, 0.8885543, 0.01509881, 0.9843137, 0, 1, 1,
0.9045238, 0.8198116, 0.780385, 0.9921569, 0, 1, 1,
0.9123918, 0.3132161, 0.4025998, 0.9960784, 0, 1, 1,
0.9185495, 0.02487465, 1.279009, 1, 0, 0.9960784, 1,
0.9220995, 0.7590343, 0.03279807, 1, 0, 0.9882353, 1,
0.9270312, -3.378723, 1.853521, 1, 0, 0.9843137, 1,
0.9299953, 1.445556, 1.953928, 1, 0, 0.9764706, 1,
0.9318024, -0.1586411, 0.7578207, 1, 0, 0.972549, 1,
0.9393153, 0.2085768, 1.406281, 1, 0, 0.9647059, 1,
0.9394244, -0.7398366, 3.217044, 1, 0, 0.9607843, 1,
0.9556434, -0.7645491, 1.728753, 1, 0, 0.9529412, 1,
0.9627882, 0.7969357, 2.72666, 1, 0, 0.9490196, 1,
0.9706829, 1.221128, 0.6168748, 1, 0, 0.9411765, 1,
0.9762807, 0.7458165, 2.425992, 1, 0, 0.9372549, 1,
0.9813057, 0.6301773, 1.255872, 1, 0, 0.9294118, 1,
0.9824244, -0.7042838, 3.598044, 1, 0, 0.9254902, 1,
0.9831112, 0.02640015, 1.176041, 1, 0, 0.9176471, 1,
0.9851255, -0.8760391, 2.186178, 1, 0, 0.9137255, 1,
0.985375, -1.11698, 2.170886, 1, 0, 0.9058824, 1,
0.986935, -0.2188691, 1.983325, 1, 0, 0.9019608, 1,
0.9891802, 0.4877346, -0.04799533, 1, 0, 0.8941177, 1,
0.992943, -2.136033, 2.428272, 1, 0, 0.8862745, 1,
0.9987825, 0.3329426, 0.5260934, 1, 0, 0.8823529, 1,
1.007039, 1.419965, 1.61616, 1, 0, 0.8745098, 1,
1.009805, -0.2300921, 2.295318, 1, 0, 0.8705882, 1,
1.016363, -0.01722508, 3.38548, 1, 0, 0.8627451, 1,
1.018189, 0.9782055, 0.05546407, 1, 0, 0.8588235, 1,
1.03395, -0.4000523, 1.76262, 1, 0, 0.8509804, 1,
1.036415, 0.3715389, 2.004372, 1, 0, 0.8470588, 1,
1.039074, 0.1603051, -0.7675269, 1, 0, 0.8392157, 1,
1.039562, -0.0885217, 1.133658, 1, 0, 0.8352941, 1,
1.045095, -0.5872548, 1.847762, 1, 0, 0.827451, 1,
1.046041, -1.880136, 2.153239, 1, 0, 0.8235294, 1,
1.051778, 0.8972295, -1.170995, 1, 0, 0.8156863, 1,
1.052402, -0.1980982, 1.166432, 1, 0, 0.8117647, 1,
1.052479, -1.061082, 0.285487, 1, 0, 0.8039216, 1,
1.055404, -1.024786, 3.905124, 1, 0, 0.7960784, 1,
1.062792, 0.1104552, 1.925344, 1, 0, 0.7921569, 1,
1.064539, -0.7894698, 2.212241, 1, 0, 0.7843137, 1,
1.065104, 0.1691264, 1.274194, 1, 0, 0.7803922, 1,
1.070394, 0.9398026, 1.740102, 1, 0, 0.772549, 1,
1.074862, 0.4589571, 1.123107, 1, 0, 0.7686275, 1,
1.075771, -0.1737149, 2.091271, 1, 0, 0.7607843, 1,
1.079728, -2.510321, 0.8475193, 1, 0, 0.7568628, 1,
1.092143, 0.4573988, -1.715822, 1, 0, 0.7490196, 1,
1.092624, 0.007595239, 1.664466, 1, 0, 0.7450981, 1,
1.092702, 0.9688756, -1.043952, 1, 0, 0.7372549, 1,
1.103576, -0.134839, 2.210973, 1, 0, 0.7333333, 1,
1.111877, 0.1924124, 2.408712, 1, 0, 0.7254902, 1,
1.119734, 1.116993, -0.2932224, 1, 0, 0.7215686, 1,
1.121271, 0.937372, 0.09655916, 1, 0, 0.7137255, 1,
1.125203, -1.073612, 3.404987, 1, 0, 0.7098039, 1,
1.126867, -1.308343, 2.273292, 1, 0, 0.7019608, 1,
1.129381, 0.6819839, 0.8984573, 1, 0, 0.6941177, 1,
1.130928, 1.798676, 0.3467673, 1, 0, 0.6901961, 1,
1.131974, -0.6673129, 1.866145, 1, 0, 0.682353, 1,
1.142705, -0.9544652, 1.56951, 1, 0, 0.6784314, 1,
1.149855, -0.3516414, 2.675708, 1, 0, 0.6705883, 1,
1.152777, 0.002708265, 3.658124, 1, 0, 0.6666667, 1,
1.153944, -0.7128032, 3.246025, 1, 0, 0.6588235, 1,
1.157406, 2.05176, 1.283437, 1, 0, 0.654902, 1,
1.162012, 0.5335889, -0.1914044, 1, 0, 0.6470588, 1,
1.162295, 0.726962, 1.078484, 1, 0, 0.6431373, 1,
1.16958, 0.3466286, 1.392319, 1, 0, 0.6352941, 1,
1.172197, 2.162044, -0.682829, 1, 0, 0.6313726, 1,
1.177066, -0.3662158, 3.127305, 1, 0, 0.6235294, 1,
1.177383, 0.1471939, -0.6947891, 1, 0, 0.6196079, 1,
1.183271, -0.2794757, 1.665358, 1, 0, 0.6117647, 1,
1.199749, -0.005634648, 2.0969, 1, 0, 0.6078432, 1,
1.200896, 0.855794, 2.239415, 1, 0, 0.6, 1,
1.204167, -0.7089292, 2.721293, 1, 0, 0.5921569, 1,
1.207392, -0.823444, 4.144762, 1, 0, 0.5882353, 1,
1.213051, 1.311545, 0.772697, 1, 0, 0.5803922, 1,
1.213163, 0.6969361, 3.177474, 1, 0, 0.5764706, 1,
1.215379, -0.4077864, -0.3353249, 1, 0, 0.5686275, 1,
1.222518, 0.2945772, 2.017056, 1, 0, 0.5647059, 1,
1.227731, -1.019193, 1.724883, 1, 0, 0.5568628, 1,
1.229269, 1.91611, 2.171936, 1, 0, 0.5529412, 1,
1.230046, -1.481961, 2.423862, 1, 0, 0.5450981, 1,
1.230397, 0.6526327, -0.9249203, 1, 0, 0.5411765, 1,
1.254135, 0.4060366, -0.1701071, 1, 0, 0.5333334, 1,
1.254359, -0.6713841, 2.864006, 1, 0, 0.5294118, 1,
1.25583, 0.3735272, 0.2792909, 1, 0, 0.5215687, 1,
1.255937, -0.9005864, 2.363264, 1, 0, 0.5176471, 1,
1.264354, 0.9701642, 0.2878323, 1, 0, 0.509804, 1,
1.271878, 1.174855, 1.433554, 1, 0, 0.5058824, 1,
1.273992, 0.4926709, 1.516918, 1, 0, 0.4980392, 1,
1.278914, -0.2718045, 2.253136, 1, 0, 0.4901961, 1,
1.280128, 1.21922, 1.871213, 1, 0, 0.4862745, 1,
1.282598, 0.629799, 2.879478, 1, 0, 0.4784314, 1,
1.288852, 0.1095174, 0.9357286, 1, 0, 0.4745098, 1,
1.293351, -0.8911725, 2.793749, 1, 0, 0.4666667, 1,
1.295704, -0.3382847, 2.962281, 1, 0, 0.4627451, 1,
1.30143, -0.4756208, 0.05119875, 1, 0, 0.454902, 1,
1.308082, -0.3333189, 0.7427664, 1, 0, 0.4509804, 1,
1.317037, 1.262545, 0.5385452, 1, 0, 0.4431373, 1,
1.337992, 0.7202594, -0.2307525, 1, 0, 0.4392157, 1,
1.338766, -0.4530568, 1.732285, 1, 0, 0.4313726, 1,
1.339949, -2.072302, 4.452698, 1, 0, 0.427451, 1,
1.344764, 0.9091707, 0.761288, 1, 0, 0.4196078, 1,
1.358763, 1.37068, 0.283447, 1, 0, 0.4156863, 1,
1.360292, -0.3784367, 2.896782, 1, 0, 0.4078431, 1,
1.368278, 0.3729115, 0.3098779, 1, 0, 0.4039216, 1,
1.369779, 0.5783912, 1.371491, 1, 0, 0.3960784, 1,
1.372239, 1.009565, 0.413977, 1, 0, 0.3882353, 1,
1.385016, 1.193833, 0.616497, 1, 0, 0.3843137, 1,
1.394748, 0.5842211, 1.816647, 1, 0, 0.3764706, 1,
1.397511, 0.8690224, 1.084876, 1, 0, 0.372549, 1,
1.405995, 0.3531955, 2.932024, 1, 0, 0.3647059, 1,
1.409871, -0.4592733, 3.028777, 1, 0, 0.3607843, 1,
1.43459, 1.469069, -1.53111, 1, 0, 0.3529412, 1,
1.437768, -1.410453, 3.192872, 1, 0, 0.3490196, 1,
1.437932, 0.9939126, 0.380566, 1, 0, 0.3411765, 1,
1.451181, -1.088905, 1.542013, 1, 0, 0.3372549, 1,
1.458218, 0.3800797, 1.251985, 1, 0, 0.3294118, 1,
1.462253, -0.5088773, 0.617188, 1, 0, 0.3254902, 1,
1.467185, 0.3499843, 0.9835981, 1, 0, 0.3176471, 1,
1.469218, 0.06901731, 2.511841, 1, 0, 0.3137255, 1,
1.470409, 0.983769, 1.600767, 1, 0, 0.3058824, 1,
1.501675, 0.3226819, 0.413454, 1, 0, 0.2980392, 1,
1.501823, -0.8020528, 2.843959, 1, 0, 0.2941177, 1,
1.513756, 0.4897957, -1.745118, 1, 0, 0.2862745, 1,
1.547104, 2.54402, 0.5202082, 1, 0, 0.282353, 1,
1.551397, 1.066769, 1.226947, 1, 0, 0.2745098, 1,
1.552226, -1.098799, 0.4624083, 1, 0, 0.2705882, 1,
1.553333, 0.4880788, 0.7669521, 1, 0, 0.2627451, 1,
1.602815, 0.4332693, 1.534742, 1, 0, 0.2588235, 1,
1.611054, -0.1442734, 0.03037389, 1, 0, 0.2509804, 1,
1.615261, -0.5720025, 0.1355865, 1, 0, 0.2470588, 1,
1.635336, 0.6709409, 1.149655, 1, 0, 0.2392157, 1,
1.643538, -0.2349283, 1.794924, 1, 0, 0.2352941, 1,
1.656112, 0.2749901, 2.379889, 1, 0, 0.227451, 1,
1.657118, -0.8126215, 2.067365, 1, 0, 0.2235294, 1,
1.661813, -0.154335, 1.455132, 1, 0, 0.2156863, 1,
1.754168, 1.416986, 1.016458, 1, 0, 0.2117647, 1,
1.757639, 0.4463271, 1.555951, 1, 0, 0.2039216, 1,
1.762981, 0.9289677, 1.073128, 1, 0, 0.1960784, 1,
1.769466, 0.9340026, 2.02167, 1, 0, 0.1921569, 1,
1.804535, -0.2962079, 2.208489, 1, 0, 0.1843137, 1,
1.8096, -2.126225, 1.028902, 1, 0, 0.1803922, 1,
1.817413, 0.1956201, 2.067402, 1, 0, 0.172549, 1,
1.828279, -0.4232409, 2.938136, 1, 0, 0.1686275, 1,
1.851288, -1.336446, 1.846947, 1, 0, 0.1607843, 1,
1.881181, 0.8588131, 1.60332, 1, 0, 0.1568628, 1,
1.888863, -1.579623, 1.977622, 1, 0, 0.1490196, 1,
1.894937, -0.9278516, 2.172594, 1, 0, 0.145098, 1,
1.915987, -1.772112, 1.2516, 1, 0, 0.1372549, 1,
1.940167, 0.3829209, 1.153163, 1, 0, 0.1333333, 1,
1.950331, -1.008204, 1.404481, 1, 0, 0.1254902, 1,
1.960457, 0.8234894, -0.01518855, 1, 0, 0.1215686, 1,
2.03448, 0.1368783, 3.400208, 1, 0, 0.1137255, 1,
2.073551, 0.6923734, -0.2947109, 1, 0, 0.1098039, 1,
2.118775, 0.2344735, 2.705625, 1, 0, 0.1019608, 1,
2.153322, -1.12122, 1.165771, 1, 0, 0.09411765, 1,
2.192055, -0.7657142, 2.932142, 1, 0, 0.09019608, 1,
2.249782, 1.788053, 1.024962, 1, 0, 0.08235294, 1,
2.268239, 2.595276, 0.08017275, 1, 0, 0.07843138, 1,
2.290084, -0.8593242, 2.362544, 1, 0, 0.07058824, 1,
2.356836, -0.9025764, 1.482805, 1, 0, 0.06666667, 1,
2.415017, 0.5719319, -0.1777732, 1, 0, 0.05882353, 1,
2.469831, 0.9426483, 1.200374, 1, 0, 0.05490196, 1,
2.477422, -0.05276517, 3.101711, 1, 0, 0.04705882, 1,
2.5228, 0.09241117, 2.329618, 1, 0, 0.04313726, 1,
2.56513, 0.5287133, 1.093818, 1, 0, 0.03529412, 1,
2.628992, -1.018518, 0.9777752, 1, 0, 0.03137255, 1,
2.789392, 0.7309319, 1.875407, 1, 0, 0.02352941, 1,
2.958589, -0.5932601, 0.1596972, 1, 0, 0.01960784, 1,
3.344262, -0.4649403, 0.7172301, 1, 0, 0.01176471, 1,
4.071054, 0.2317724, 3.534614, 1, 0, 0.007843138, 1
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
0.1494765, -4.458508, -7.139259, 0, -0.5, 0.5, 0.5,
0.1494765, -4.458508, -7.139259, 1, -0.5, 0.5, 0.5,
0.1494765, -4.458508, -7.139259, 1, 1.5, 0.5, 0.5,
0.1494765, -4.458508, -7.139259, 0, 1.5, 0.5, 0.5
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
-5.101515, -0.1935157, -7.139259, 0, -0.5, 0.5, 0.5,
-5.101515, -0.1935157, -7.139259, 1, -0.5, 0.5, 0.5,
-5.101515, -0.1935157, -7.139259, 1, 1.5, 0.5, 0.5,
-5.101515, -0.1935157, -7.139259, 0, 1.5, 0.5, 0.5
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
-5.101515, -4.458508, 0.4881277, 0, -0.5, 0.5, 0.5,
-5.101515, -4.458508, 0.4881277, 1, -0.5, 0.5, 0.5,
-5.101515, -4.458508, 0.4881277, 1, 1.5, 0.5, 0.5,
-5.101515, -4.458508, 0.4881277, 0, 1.5, 0.5, 0.5
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
-2, -3.474279, -5.379093,
4, -3.474279, -5.379093,
-2, -3.474279, -5.379093,
-2, -3.638317, -5.672454,
0, -3.474279, -5.379093,
0, -3.638317, -5.672454,
2, -3.474279, -5.379093,
2, -3.638317, -5.672454,
4, -3.474279, -5.379093,
4, -3.638317, -5.672454
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
"2",
"4"
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
-2, -3.966394, -6.259176, 0, -0.5, 0.5, 0.5,
-2, -3.966394, -6.259176, 1, -0.5, 0.5, 0.5,
-2, -3.966394, -6.259176, 1, 1.5, 0.5, 0.5,
-2, -3.966394, -6.259176, 0, 1.5, 0.5, 0.5,
0, -3.966394, -6.259176, 0, -0.5, 0.5, 0.5,
0, -3.966394, -6.259176, 1, -0.5, 0.5, 0.5,
0, -3.966394, -6.259176, 1, 1.5, 0.5, 0.5,
0, -3.966394, -6.259176, 0, 1.5, 0.5, 0.5,
2, -3.966394, -6.259176, 0, -0.5, 0.5, 0.5,
2, -3.966394, -6.259176, 1, -0.5, 0.5, 0.5,
2, -3.966394, -6.259176, 1, 1.5, 0.5, 0.5,
2, -3.966394, -6.259176, 0, 1.5, 0.5, 0.5,
4, -3.966394, -6.259176, 0, -0.5, 0.5, 0.5,
4, -3.966394, -6.259176, 1, -0.5, 0.5, 0.5,
4, -3.966394, -6.259176, 1, 1.5, 0.5, 0.5,
4, -3.966394, -6.259176, 0, 1.5, 0.5, 0.5
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
-3.889748, -3, -5.379093,
-3.889748, 2, -5.379093,
-3.889748, -3, -5.379093,
-4.091709, -3, -5.672454,
-3.889748, -2, -5.379093,
-4.091709, -2, -5.672454,
-3.889748, -1, -5.379093,
-4.091709, -1, -5.672454,
-3.889748, 0, -5.379093,
-4.091709, 0, -5.672454,
-3.889748, 1, -5.379093,
-4.091709, 1, -5.672454,
-3.889748, 2, -5.379093,
-4.091709, 2, -5.672454
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
-4.495631, -3, -6.259176, 0, -0.5, 0.5, 0.5,
-4.495631, -3, -6.259176, 1, -0.5, 0.5, 0.5,
-4.495631, -3, -6.259176, 1, 1.5, 0.5, 0.5,
-4.495631, -3, -6.259176, 0, 1.5, 0.5, 0.5,
-4.495631, -2, -6.259176, 0, -0.5, 0.5, 0.5,
-4.495631, -2, -6.259176, 1, -0.5, 0.5, 0.5,
-4.495631, -2, -6.259176, 1, 1.5, 0.5, 0.5,
-4.495631, -2, -6.259176, 0, 1.5, 0.5, 0.5,
-4.495631, -1, -6.259176, 0, -0.5, 0.5, 0.5,
-4.495631, -1, -6.259176, 1, -0.5, 0.5, 0.5,
-4.495631, -1, -6.259176, 1, 1.5, 0.5, 0.5,
-4.495631, -1, -6.259176, 0, 1.5, 0.5, 0.5,
-4.495631, 0, -6.259176, 0, -0.5, 0.5, 0.5,
-4.495631, 0, -6.259176, 1, -0.5, 0.5, 0.5,
-4.495631, 0, -6.259176, 1, 1.5, 0.5, 0.5,
-4.495631, 0, -6.259176, 0, 1.5, 0.5, 0.5,
-4.495631, 1, -6.259176, 0, -0.5, 0.5, 0.5,
-4.495631, 1, -6.259176, 1, -0.5, 0.5, 0.5,
-4.495631, 1, -6.259176, 1, 1.5, 0.5, 0.5,
-4.495631, 1, -6.259176, 0, 1.5, 0.5, 0.5,
-4.495631, 2, -6.259176, 0, -0.5, 0.5, 0.5,
-4.495631, 2, -6.259176, 1, -0.5, 0.5, 0.5,
-4.495631, 2, -6.259176, 1, 1.5, 0.5, 0.5,
-4.495631, 2, -6.259176, 0, 1.5, 0.5, 0.5
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
-3.889748, -3.474279, -4,
-3.889748, -3.474279, 6,
-3.889748, -3.474279, -4,
-4.091709, -3.638317, -4,
-3.889748, -3.474279, -2,
-4.091709, -3.638317, -2,
-3.889748, -3.474279, 0,
-4.091709, -3.638317, 0,
-3.889748, -3.474279, 2,
-4.091709, -3.638317, 2,
-3.889748, -3.474279, 4,
-4.091709, -3.638317, 4,
-3.889748, -3.474279, 6,
-4.091709, -3.638317, 6
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
-4.495631, -3.966394, -4, 0, -0.5, 0.5, 0.5,
-4.495631, -3.966394, -4, 1, -0.5, 0.5, 0.5,
-4.495631, -3.966394, -4, 1, 1.5, 0.5, 0.5,
-4.495631, -3.966394, -4, 0, 1.5, 0.5, 0.5,
-4.495631, -3.966394, -2, 0, -0.5, 0.5, 0.5,
-4.495631, -3.966394, -2, 1, -0.5, 0.5, 0.5,
-4.495631, -3.966394, -2, 1, 1.5, 0.5, 0.5,
-4.495631, -3.966394, -2, 0, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 0, 0, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 0, 1, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 0, 1, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 0, 0, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 2, 0, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 2, 1, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 2, 1, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 2, 0, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 4, 0, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 4, 1, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 4, 1, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 4, 0, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 6, 0, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 6, 1, -0.5, 0.5, 0.5,
-4.495631, -3.966394, 6, 1, 1.5, 0.5, 0.5,
-4.495631, -3.966394, 6, 0, 1.5, 0.5, 0.5
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
-3.889748, -3.474279, -5.379093,
-3.889748, 3.087248, -5.379093,
-3.889748, -3.474279, 6.355348,
-3.889748, 3.087248, 6.355348,
-3.889748, -3.474279, -5.379093,
-3.889748, -3.474279, 6.355348,
-3.889748, 3.087248, -5.379093,
-3.889748, 3.087248, 6.355348,
-3.889748, -3.474279, -5.379093,
4.188701, -3.474279, -5.379093,
-3.889748, -3.474279, 6.355348,
4.188701, -3.474279, 6.355348,
-3.889748, 3.087248, -5.379093,
4.188701, 3.087248, -5.379093,
-3.889748, 3.087248, 6.355348,
4.188701, 3.087248, 6.355348,
4.188701, -3.474279, -5.379093,
4.188701, 3.087248, -5.379093,
4.188701, -3.474279, 6.355348,
4.188701, 3.087248, 6.355348,
4.188701, -3.474279, -5.379093,
4.188701, -3.474279, 6.355348,
4.188701, 3.087248, -5.379093,
4.188701, 3.087248, 6.355348
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
var radius = 8.375364;
var distance = 37.26294;
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
mvMatrix.translate( -0.1494765, 0.1935157, -0.4881277 );
mvMatrix.scale( 1.120959, 1.380107, 0.7717119 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.26294);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
pyributicarb<-read.table("pyributicarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyributicarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyributicarb' not found
```

```r
y<-pyributicarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyributicarb' not found
```

```r
z<-pyributicarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyributicarb' not found
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
-3.7721, -1.532056, -1.073007, 0, 0, 1, 1, 1,
-2.825183, -0.3703873, -0.3702397, 1, 0, 0, 1, 1,
-2.759596, 0.06483873, -2.612151, 1, 0, 0, 1, 1,
-2.69666, -0.3291353, -0.8926839, 1, 0, 0, 1, 1,
-2.690166, -1.35231, -0.6131575, 1, 0, 0, 1, 1,
-2.586044, 0.7964473, -0.2340827, 1, 0, 0, 1, 1,
-2.572961, -0.330074, -2.381335, 0, 0, 0, 1, 1,
-2.520139, 1.299485, 0.2561077, 0, 0, 0, 1, 1,
-2.481589, -0.5460974, -0.8513434, 0, 0, 0, 1, 1,
-2.469402, -1.107072, -1.873183, 0, 0, 0, 1, 1,
-2.432779, 0.7735953, -1.293909, 0, 0, 0, 1, 1,
-2.397065, -0.542426, -2.290511, 0, 0, 0, 1, 1,
-2.381515, 0.3747292, -0.8414038, 0, 0, 0, 1, 1,
-2.351676, 1.221386, -0.9864304, 1, 1, 1, 1, 1,
-2.282822, 0.1649541, -3.092901, 1, 1, 1, 1, 1,
-2.222789, -0.1111082, -1.94504, 1, 1, 1, 1, 1,
-2.210373, -0.8794512, -1.352943, 1, 1, 1, 1, 1,
-2.2042, 0.8980507, -1.93375, 1, 1, 1, 1, 1,
-2.20078, 1.373574, -0.555157, 1, 1, 1, 1, 1,
-2.173606, 0.1574461, -0.07842319, 1, 1, 1, 1, 1,
-2.126092, 1.531509, -1.384745, 1, 1, 1, 1, 1,
-2.111162, 0.3217937, -1.093454, 1, 1, 1, 1, 1,
-2.068934, -0.433072, -2.814433, 1, 1, 1, 1, 1,
-2.044273, -0.8976069, -0.6192582, 1, 1, 1, 1, 1,
-2.043438, 0.7588681, -1.835331, 1, 1, 1, 1, 1,
-2.000051, 0.3416081, -0.9832343, 1, 1, 1, 1, 1,
-1.992993, -0.06838183, -2.101464, 1, 1, 1, 1, 1,
-1.976885, -0.5280101, -3.82038, 1, 1, 1, 1, 1,
-1.969602, 1.07029, -0.3438492, 0, 0, 1, 1, 1,
-1.920135, 0.03778338, -3.397794, 1, 0, 0, 1, 1,
-1.916118, -0.3724291, -0.7941011, 1, 0, 0, 1, 1,
-1.902907, -0.1273345, -3.29435, 1, 0, 0, 1, 1,
-1.890778, 0.5860002, -1.651407, 1, 0, 0, 1, 1,
-1.885205, 2.101346, -0.9626979, 1, 0, 0, 1, 1,
-1.883915, -1.210968, -2.990879, 0, 0, 0, 1, 1,
-1.879533, -0.7056474, -1.80635, 0, 0, 0, 1, 1,
-1.867858, 2.246348, -0.6275836, 0, 0, 0, 1, 1,
-1.864009, -0.4676363, 0.2114365, 0, 0, 0, 1, 1,
-1.832767, -1.261249, -3.641723, 0, 0, 0, 1, 1,
-1.819959, 0.2978973, -1.177902, 0, 0, 0, 1, 1,
-1.782136, 1.145309, -1.139294, 0, 0, 0, 1, 1,
-1.771057, 0.04609283, -0.09207542, 1, 1, 1, 1, 1,
-1.759273, 0.1698684, -1.717504, 1, 1, 1, 1, 1,
-1.754947, -0.1171349, -1.863416, 1, 1, 1, 1, 1,
-1.75461, 1.21667, -0.410423, 1, 1, 1, 1, 1,
-1.752971, -0.1366944, -2.068589, 1, 1, 1, 1, 1,
-1.746234, -1.240015, -1.789739, 1, 1, 1, 1, 1,
-1.730869, -0.9987277, -3.809328, 1, 1, 1, 1, 1,
-1.730658, -0.1260786, -2.67062, 1, 1, 1, 1, 1,
-1.729883, -0.4947259, -0.2451303, 1, 1, 1, 1, 1,
-1.71754, -0.445955, -0.8640873, 1, 1, 1, 1, 1,
-1.714595, 1.067217, -0.8622904, 1, 1, 1, 1, 1,
-1.709055, 0.1470002, -2.669268, 1, 1, 1, 1, 1,
-1.697888, -0.5001066, 0.3850027, 1, 1, 1, 1, 1,
-1.66582, 0.0180489, -2.146918, 1, 1, 1, 1, 1,
-1.653294, -1.154528, -2.67948, 1, 1, 1, 1, 1,
-1.641709, 0.3702226, -1.476575, 0, 0, 1, 1, 1,
-1.63124, 1.897505, -0.07682317, 1, 0, 0, 1, 1,
-1.627157, -0.7147921, -1.436001, 1, 0, 0, 1, 1,
-1.620875, -0.3832215, -2.258146, 1, 0, 0, 1, 1,
-1.620173, 0.3122629, -0.804318, 1, 0, 0, 1, 1,
-1.620103, -0.5447978, -3.419389, 1, 0, 0, 1, 1,
-1.619528, 0.4736072, -0.3391201, 0, 0, 0, 1, 1,
-1.617071, 1.030213, -2.159693, 0, 0, 0, 1, 1,
-1.609591, -0.7085361, -1.525933, 0, 0, 0, 1, 1,
-1.607997, 0.5415681, -1.809017, 0, 0, 0, 1, 1,
-1.606526, -1.716474, -1.759158, 0, 0, 0, 1, 1,
-1.602066, 0.5900772, -1.345974, 0, 0, 0, 1, 1,
-1.593848, -0.3041746, -2.482689, 0, 0, 0, 1, 1,
-1.588351, 1.625183, 0.5296836, 1, 1, 1, 1, 1,
-1.540551, 0.674499, -0.06329226, 1, 1, 1, 1, 1,
-1.529363, -0.6928225, -2.217266, 1, 1, 1, 1, 1,
-1.514606, -0.4327601, -3.095828, 1, 1, 1, 1, 1,
-1.512161, 0.02874606, -1.461663, 1, 1, 1, 1, 1,
-1.49367, 1.376586, 0.1808611, 1, 1, 1, 1, 1,
-1.493293, 0.1092138, -2.365804, 1, 1, 1, 1, 1,
-1.487688, 1.301304, -0.8140777, 1, 1, 1, 1, 1,
-1.483953, 0.8475708, 0.2961927, 1, 1, 1, 1, 1,
-1.479656, -0.3012249, -1.48297, 1, 1, 1, 1, 1,
-1.4725, 1.319933, -0.5287736, 1, 1, 1, 1, 1,
-1.45157, 0.8360062, -0.5506914, 1, 1, 1, 1, 1,
-1.432931, -1.795587, -2.538096, 1, 1, 1, 1, 1,
-1.427861, -1.274216, -2.125806, 1, 1, 1, 1, 1,
-1.423807, -0.3238523, -1.531243, 1, 1, 1, 1, 1,
-1.422474, 2.093754, -0.5218046, 0, 0, 1, 1, 1,
-1.418984, 0.4202886, -3.725094, 1, 0, 0, 1, 1,
-1.416881, 0.4072041, -0.6429851, 1, 0, 0, 1, 1,
-1.407322, 1.209571, -0.307788, 1, 0, 0, 1, 1,
-1.37805, 0.7109497, -0.911773, 1, 0, 0, 1, 1,
-1.373596, 0.4346192, -0.964053, 1, 0, 0, 1, 1,
-1.367644, 1.457056, -0.630658, 0, 0, 0, 1, 1,
-1.361141, 0.9558671, -0.4517224, 0, 0, 0, 1, 1,
-1.359189, -1.252785, -1.637388, 0, 0, 0, 1, 1,
-1.356238, 0.008031409, -3.52014, 0, 0, 0, 1, 1,
-1.355473, 0.8594373, 1.552621, 0, 0, 0, 1, 1,
-1.350155, -1.130139, -1.96154, 0, 0, 0, 1, 1,
-1.346953, -0.2002648, -1.484852, 0, 0, 0, 1, 1,
-1.333743, -0.5126811, -0.6301947, 1, 1, 1, 1, 1,
-1.328372, 0.5897452, -1.71015, 1, 1, 1, 1, 1,
-1.32392, -0.1037757, -2.259348, 1, 1, 1, 1, 1,
-1.320985, 0.5408303, -3.363731, 1, 1, 1, 1, 1,
-1.318077, -0.7626894, -0.6935211, 1, 1, 1, 1, 1,
-1.310798, -0.3479557, -2.248942, 1, 1, 1, 1, 1,
-1.304849, -0.5635951, -2.082824, 1, 1, 1, 1, 1,
-1.302676, -0.5367758, -1.508428, 1, 1, 1, 1, 1,
-1.302341, -0.3441156, -3.091137, 1, 1, 1, 1, 1,
-1.295142, -1.397415, -1.762038, 1, 1, 1, 1, 1,
-1.294566, 0.07405908, -1.041466, 1, 1, 1, 1, 1,
-1.292529, -0.937133, -1.351406, 1, 1, 1, 1, 1,
-1.287638, -0.4342478, -1.80479, 1, 1, 1, 1, 1,
-1.287626, 2.287258, -1.131117, 1, 1, 1, 1, 1,
-1.283053, -0.107767, -2.754013, 1, 1, 1, 1, 1,
-1.278992, -0.02852777, -2.14204, 0, 0, 1, 1, 1,
-1.277532, -0.7322216, -3.146424, 1, 0, 0, 1, 1,
-1.276674, -0.691816, -2.790302, 1, 0, 0, 1, 1,
-1.273737, 0.1198373, -2.101071, 1, 0, 0, 1, 1,
-1.252969, 1.920594, -1.292475, 1, 0, 0, 1, 1,
-1.240018, 2.826357, -1.024551, 1, 0, 0, 1, 1,
-1.228091, -0.6507923, -1.572552, 0, 0, 0, 1, 1,
-1.222893, -0.009355561, -1.768265, 0, 0, 0, 1, 1,
-1.220719, 0.4548929, -0.7051766, 0, 0, 0, 1, 1,
-1.219098, 1.820406, 0.2072675, 0, 0, 0, 1, 1,
-1.218922, 1.011228, -2.477781, 0, 0, 0, 1, 1,
-1.21395, -0.2350017, -3.199913, 0, 0, 0, 1, 1,
-1.212613, -0.3845322, -2.723745, 0, 0, 0, 1, 1,
-1.210924, 0.6157656, -1.267171, 1, 1, 1, 1, 1,
-1.210911, -0.5959277, -1.783566, 1, 1, 1, 1, 1,
-1.203659, 0.9354245, -1.809641, 1, 1, 1, 1, 1,
-1.202776, -0.2174796, -1.58157, 1, 1, 1, 1, 1,
-1.202057, 1.216535, -0.116772, 1, 1, 1, 1, 1,
-1.199417, 1.395989, -1.350351, 1, 1, 1, 1, 1,
-1.197063, 0.8712298, -1.359956, 1, 1, 1, 1, 1,
-1.18211, -0.8569167, -2.34838, 1, 1, 1, 1, 1,
-1.178638, -0.5535591, -1.343582, 1, 1, 1, 1, 1,
-1.175789, 1.29617, -0.9751461, 1, 1, 1, 1, 1,
-1.170862, -1.025514, -3.432655, 1, 1, 1, 1, 1,
-1.165891, 0.2267563, -2.792281, 1, 1, 1, 1, 1,
-1.16439, -1.477937, -2.444742, 1, 1, 1, 1, 1,
-1.159909, -0.1179904, -1.957824, 1, 1, 1, 1, 1,
-1.157423, 0.9705232, -0.1248677, 1, 1, 1, 1, 1,
-1.152366, -0.3474787, -1.648341, 0, 0, 1, 1, 1,
-1.15167, 0.5605861, 0.5126981, 1, 0, 0, 1, 1,
-1.149879, 0.7464474, -0.8725287, 1, 0, 0, 1, 1,
-1.149646, -1.872816, -2.245874, 1, 0, 0, 1, 1,
-1.147213, -1.091543, -2.477624, 1, 0, 0, 1, 1,
-1.146002, -0.7717775, -2.875221, 1, 0, 0, 1, 1,
-1.142575, 0.7981844, -2.076047, 0, 0, 0, 1, 1,
-1.1408, -1.307581, -2.362367, 0, 0, 0, 1, 1,
-1.140705, -2.106599, -4.241599, 0, 0, 0, 1, 1,
-1.139147, 1.931654, -1.872315, 0, 0, 0, 1, 1,
-1.130949, -1.692458, -2.786703, 0, 0, 0, 1, 1,
-1.12904, 0.06077683, -0.9880517, 0, 0, 0, 1, 1,
-1.12822, -0.8183878, 0.1400138, 0, 0, 0, 1, 1,
-1.126334, -0.0340886, -0.6155616, 1, 1, 1, 1, 1,
-1.124812, 0.6433018, -0.1718973, 1, 1, 1, 1, 1,
-1.121673, -0.3232121, -0.8742466, 1, 1, 1, 1, 1,
-1.116317, 1.29511, -0.7168905, 1, 1, 1, 1, 1,
-1.115543, 0.1664989, -3.80366, 1, 1, 1, 1, 1,
-1.114529, -0.6028984, -1.638182, 1, 1, 1, 1, 1,
-1.108489, -0.9742326, -0.5158268, 1, 1, 1, 1, 1,
-1.101591, 0.08625465, -1.704567, 1, 1, 1, 1, 1,
-1.099572, 0.6772846, -1.039955, 1, 1, 1, 1, 1,
-1.091603, -1.17369, -2.452702, 1, 1, 1, 1, 1,
-1.091329, 0.115453, -2.631628, 1, 1, 1, 1, 1,
-1.085343, -0.3951268, -1.479046, 1, 1, 1, 1, 1,
-1.079334, 0.9395261, -0.3416413, 1, 1, 1, 1, 1,
-1.076146, -0.1679407, -0.3775641, 1, 1, 1, 1, 1,
-1.071898, 0.599059, -1.346541, 1, 1, 1, 1, 1,
-1.065943, -1.801855, -3.000083, 0, 0, 1, 1, 1,
-1.064391, 1.94956, -1.654298, 1, 0, 0, 1, 1,
-1.036745, 0.324518, -2.279971, 1, 0, 0, 1, 1,
-1.033955, 0.4795618, -0.3912259, 1, 0, 0, 1, 1,
-1.031436, 0.467424, 0.7628762, 1, 0, 0, 1, 1,
-1.029981, 0.4215759, -1.785606, 1, 0, 0, 1, 1,
-1.028562, 2.948302, 1.769787, 0, 0, 0, 1, 1,
-1.020535, 1.824145, -1.099507, 0, 0, 0, 1, 1,
-1.020414, -0.2653813, -0.7302086, 0, 0, 0, 1, 1,
-1.019611, 0.2387489, -0.9248102, 0, 0, 0, 1, 1,
-1.009872, 2.108791, -1.577092, 0, 0, 0, 1, 1,
-1.008738, -0.4617961, -3.629598, 0, 0, 0, 1, 1,
-1.007294, 0.8790047, -0.4218276, 0, 0, 0, 1, 1,
-1.006361, 1.68795, 0.1747011, 1, 1, 1, 1, 1,
-1.002883, -0.3590646, -2.558221, 1, 1, 1, 1, 1,
-0.9845983, -1.481485, -1.457826, 1, 1, 1, 1, 1,
-0.9809967, 1.679608, -0.4387873, 1, 1, 1, 1, 1,
-0.9806503, -0.13309, -1.860898, 1, 1, 1, 1, 1,
-0.9764743, 0.4358032, -2.01662, 1, 1, 1, 1, 1,
-0.976083, 0.448648, -1.18264, 1, 1, 1, 1, 1,
-0.9720185, -0.5534508, -2.840929, 1, 1, 1, 1, 1,
-0.9717448, 0.5555464, -1.286878, 1, 1, 1, 1, 1,
-0.9664904, -0.07384985, -1.070506, 1, 1, 1, 1, 1,
-0.9626544, 1.428128, -0.21311, 1, 1, 1, 1, 1,
-0.9548585, -0.505003, -1.019284, 1, 1, 1, 1, 1,
-0.9529458, -0.9176459, -1.439205, 1, 1, 1, 1, 1,
-0.942192, -1.442153, -3.806752, 1, 1, 1, 1, 1,
-0.9366491, 0.5293387, -1.079016, 1, 1, 1, 1, 1,
-0.9355111, 2.099673, 1.706344, 0, 0, 1, 1, 1,
-0.9347158, 0.7628492, -0.7323093, 1, 0, 0, 1, 1,
-0.934394, 0.8537167, -2.092997, 1, 0, 0, 1, 1,
-0.9331589, 1.475395, 0.2950418, 1, 0, 0, 1, 1,
-0.9323742, 0.5917647, 0.3525295, 1, 0, 0, 1, 1,
-0.9279994, 0.8160171, -0.4698255, 1, 0, 0, 1, 1,
-0.9272791, -0.1622266, -2.07697, 0, 0, 0, 1, 1,
-0.9257244, -0.4602492, -2.067838, 0, 0, 0, 1, 1,
-0.9215181, -0.5658994, -4.040692, 0, 0, 0, 1, 1,
-0.9184409, 2.541296, -1.513973, 0, 0, 0, 1, 1,
-0.9087764, -0.6178262, 0.006014061, 0, 0, 0, 1, 1,
-0.9084097, 0.9088876, 0.4385088, 0, 0, 0, 1, 1,
-0.9065516, 0.6784621, -2.532275, 0, 0, 0, 1, 1,
-0.8978545, -0.3728184, -0.5948482, 1, 1, 1, 1, 1,
-0.894988, -0.07564903, -1.885499, 1, 1, 1, 1, 1,
-0.8943187, 1.612676, -3.171378, 1, 1, 1, 1, 1,
-0.8918501, -0.443132, -3.216369, 1, 1, 1, 1, 1,
-0.8898697, -0.1650166, -3.079571, 1, 1, 1, 1, 1,
-0.8852243, 1.103781, -1.444202, 1, 1, 1, 1, 1,
-0.885012, -2.4481, -2.382847, 1, 1, 1, 1, 1,
-0.8771747, -0.9918008, -1.479931, 1, 1, 1, 1, 1,
-0.8689834, 0.3037408, -0.7902951, 1, 1, 1, 1, 1,
-0.8682837, -2.444463, -3.944144, 1, 1, 1, 1, 1,
-0.8671514, 1.81964, -0.3574462, 1, 1, 1, 1, 1,
-0.8610946, -0.3688302, -1.140064, 1, 1, 1, 1, 1,
-0.8579683, 0.7494246, -0.7777429, 1, 1, 1, 1, 1,
-0.8517082, 0.8566695, 0.009893107, 1, 1, 1, 1, 1,
-0.8502008, 0.1140079, -1.896814, 1, 1, 1, 1, 1,
-0.8395234, 0.378076, -0.4286064, 0, 0, 1, 1, 1,
-0.8385945, -0.4544763, -2.687035, 1, 0, 0, 1, 1,
-0.8383974, 0.5401405, 0.1526018, 1, 0, 0, 1, 1,
-0.8379283, -1.199561, -3.680251, 1, 0, 0, 1, 1,
-0.8376579, 0.6405752, -0.4225474, 1, 0, 0, 1, 1,
-0.8335803, -1.166099, -2.437074, 1, 0, 0, 1, 1,
-0.8309327, -0.1402897, -1.955269, 0, 0, 0, 1, 1,
-0.8298237, -0.7751896, -1.647383, 0, 0, 0, 1, 1,
-0.8295291, 1.179343, -0.3103987, 0, 0, 0, 1, 1,
-0.8286253, 0.02348408, -2.153213, 0, 0, 0, 1, 1,
-0.8279169, -2.059411, -2.548587, 0, 0, 0, 1, 1,
-0.8265447, -1.859842, -4.855729, 0, 0, 0, 1, 1,
-0.8194368, 1.416622, -1.121188, 0, 0, 0, 1, 1,
-0.8184565, 0.5794964, -0.4005073, 1, 1, 1, 1, 1,
-0.8109421, -1.83128, -4.503946, 1, 1, 1, 1, 1,
-0.8031963, 1.220682, 0.1218056, 1, 1, 1, 1, 1,
-0.7994022, -0.7887914, -2.222967, 1, 1, 1, 1, 1,
-0.7984854, -0.1838674, -1.853817, 1, 1, 1, 1, 1,
-0.7959685, -0.2826862, -2.214791, 1, 1, 1, 1, 1,
-0.7958182, -0.2515217, -2.629097, 1, 1, 1, 1, 1,
-0.7851228, 1.003589, -0.1709437, 1, 1, 1, 1, 1,
-0.7848355, 0.9630352, 0.01829437, 1, 1, 1, 1, 1,
-0.7835917, -1.190546, -3.329784, 1, 1, 1, 1, 1,
-0.7776136, -0.4595713, -1.752846, 1, 1, 1, 1, 1,
-0.7733695, -0.5548086, -2.44735, 1, 1, 1, 1, 1,
-0.7720526, 0.771336, -2.268918, 1, 1, 1, 1, 1,
-0.7612187, 0.2483573, -0.8737211, 1, 1, 1, 1, 1,
-0.7520919, 0.202083, 0.04309317, 1, 1, 1, 1, 1,
-0.7473112, -1.211354, -2.930223, 0, 0, 1, 1, 1,
-0.741957, 1.745359, 0.2174992, 1, 0, 0, 1, 1,
-0.7390843, -1.265433, -3.011756, 1, 0, 0, 1, 1,
-0.736968, 0.7990417, -0.01217179, 1, 0, 0, 1, 1,
-0.7343779, 0.2240421, -1.107794, 1, 0, 0, 1, 1,
-0.7208617, -0.7349905, -3.75383, 1, 0, 0, 1, 1,
-0.715495, 0.5215208, -2.020564, 0, 0, 0, 1, 1,
-0.711922, 1.220441, -0.4770418, 0, 0, 0, 1, 1,
-0.7056642, -0.3673223, -2.042289, 0, 0, 0, 1, 1,
-0.6979281, 0.3005677, -1.695344, 0, 0, 0, 1, 1,
-0.694669, 0.3955336, -0.428997, 0, 0, 0, 1, 1,
-0.6913521, -2.538807, -2.150161, 0, 0, 0, 1, 1,
-0.6881229, -0.4122856, -2.007435, 0, 0, 0, 1, 1,
-0.682209, 0.05576492, -1.875627, 1, 1, 1, 1, 1,
-0.6783761, -0.2256451, -1.935108, 1, 1, 1, 1, 1,
-0.6766436, 1.679003, -0.651437, 1, 1, 1, 1, 1,
-0.6657535, -2.566668, -5.127217, 1, 1, 1, 1, 1,
-0.6648906, -0.1332009, -0.6099536, 1, 1, 1, 1, 1,
-0.6622361, 0.0529677, -1.824676, 1, 1, 1, 1, 1,
-0.6602376, -1.372609, -2.334681, 1, 1, 1, 1, 1,
-0.6557738, 0.8537076, -0.492147, 1, 1, 1, 1, 1,
-0.6556028, 1.026076, -0.5223809, 1, 1, 1, 1, 1,
-0.6500659, -0.2773954, -2.326344, 1, 1, 1, 1, 1,
-0.6460615, -1.103027, -3.817161, 1, 1, 1, 1, 1,
-0.6457154, -0.09890775, 0.110039, 1, 1, 1, 1, 1,
-0.6437364, 1.098574, 0.2973202, 1, 1, 1, 1, 1,
-0.6393036, 1.563201, 0.5797347, 1, 1, 1, 1, 1,
-0.6366012, -0.4556511, -3.578523, 1, 1, 1, 1, 1,
-0.635299, 0.7826818, -0.9221577, 0, 0, 1, 1, 1,
-0.6352453, -0.2864874, -3.253644, 1, 0, 0, 1, 1,
-0.6322144, -0.4621987, -0.3919315, 1, 0, 0, 1, 1,
-0.6268464, -0.04790932, -2.047555, 1, 0, 0, 1, 1,
-0.6246771, 1.651617, -0.3945507, 1, 0, 0, 1, 1,
-0.6166121, 0.02006078, -2.138024, 1, 0, 0, 1, 1,
-0.6149019, 0.6641191, -0.364923, 0, 0, 0, 1, 1,
-0.611868, -0.3796928, -0.7988933, 0, 0, 0, 1, 1,
-0.6109169, -0.1674861, -1.075055, 0, 0, 0, 1, 1,
-0.6108237, -0.3027355, -2.314409, 0, 0, 0, 1, 1,
-0.6065813, 0.7255027, 0.04202626, 0, 0, 0, 1, 1,
-0.5997843, 1.045876, -0.07549178, 0, 0, 0, 1, 1,
-0.5984171, 1.1398, -0.3761737, 0, 0, 0, 1, 1,
-0.5981265, -2.32754, -3.000614, 1, 1, 1, 1, 1,
-0.5799066, 0.03815052, -1.98359, 1, 1, 1, 1, 1,
-0.5759417, -0.8501651, -2.234159, 1, 1, 1, 1, 1,
-0.5712692, 0.7428736, -1.095627, 1, 1, 1, 1, 1,
-0.5685871, 0.429713, -1.141642, 1, 1, 1, 1, 1,
-0.5684004, 0.9896722, 1.530996, 1, 1, 1, 1, 1,
-0.5681314, 0.9042529, 1.169967, 1, 1, 1, 1, 1,
-0.5616908, -1.940456, -1.165293, 1, 1, 1, 1, 1,
-0.5606894, 0.4140525, -1.069049, 1, 1, 1, 1, 1,
-0.5594639, -0.3522786, -1.541785, 1, 1, 1, 1, 1,
-0.5571824, -0.3234175, -2.883954, 1, 1, 1, 1, 1,
-0.5559685, 0.3168494, -1.414704, 1, 1, 1, 1, 1,
-0.55071, 0.2070776, -2.995877, 1, 1, 1, 1, 1,
-0.5498344, 0.2634172, -1.816454, 1, 1, 1, 1, 1,
-0.5480034, -0.7500677, -3.01596, 1, 1, 1, 1, 1,
-0.5406655, -0.6214467, -2.230269, 0, 0, 1, 1, 1,
-0.5312536, -0.5503157, -1.77766, 1, 0, 0, 1, 1,
-0.5286121, -0.9724211, -1.007795, 1, 0, 0, 1, 1,
-0.5273842, -0.5707862, -1.858489, 1, 0, 0, 1, 1,
-0.5230461, 0.339452, -0.7169277, 1, 0, 0, 1, 1,
-0.5228265, 2.386494, 0.6873534, 1, 0, 0, 1, 1,
-0.5220733, -0.2594047, -2.578143, 0, 0, 0, 1, 1,
-0.5207663, -0.2964027, -1.572266, 0, 0, 0, 1, 1,
-0.5207556, 0.0930413, -3.797045, 0, 0, 0, 1, 1,
-0.5203131, 1.219761, 1.165122, 0, 0, 0, 1, 1,
-0.5172199, 0.5058649, -0.9259502, 0, 0, 0, 1, 1,
-0.5162988, -1.228368, -4.173605, 0, 0, 0, 1, 1,
-0.5135132, 1.086791, -0.1386561, 0, 0, 0, 1, 1,
-0.5118643, -0.03728669, -2.609425, 1, 1, 1, 1, 1,
-0.5018994, 1.314422, -1.177672, 1, 1, 1, 1, 1,
-0.4992541, 0.2025113, -2.764949, 1, 1, 1, 1, 1,
-0.4899871, -0.6289831, -2.389399, 1, 1, 1, 1, 1,
-0.481324, 1.30534, -0.9558868, 1, 1, 1, 1, 1,
-0.4808392, -0.4095598, -1.441558, 1, 1, 1, 1, 1,
-0.4795603, 0.2631852, -1.069201, 1, 1, 1, 1, 1,
-0.471298, -0.3607192, -2.08094, 1, 1, 1, 1, 1,
-0.4705234, -0.6230378, -2.174579, 1, 1, 1, 1, 1,
-0.4675361, -1.340344, -3.644212, 1, 1, 1, 1, 1,
-0.4643554, -1.031452, -5.147553, 1, 1, 1, 1, 1,
-0.4638332, 0.1384686, -1.600704, 1, 1, 1, 1, 1,
-0.4621366, -0.1041768, -2.421093, 1, 1, 1, 1, 1,
-0.4612687, 1.084693, 0.08456486, 1, 1, 1, 1, 1,
-0.4599941, 0.2197185, -0.5018673, 1, 1, 1, 1, 1,
-0.4558378, -0.3814336, -2.1295, 0, 0, 1, 1, 1,
-0.4556536, -1.990112, -2.003435, 1, 0, 0, 1, 1,
-0.4538277, -0.1319104, -0.09084021, 1, 0, 0, 1, 1,
-0.4497997, 1.197442, 0.6192553, 1, 0, 0, 1, 1,
-0.4485584, -1.922201, -2.244673, 1, 0, 0, 1, 1,
-0.4404305, -0.8910336, -3.092247, 1, 0, 0, 1, 1,
-0.4356734, 1.026499, -0.5913742, 0, 0, 0, 1, 1,
-0.4336018, 0.7523758, 0.5342846, 0, 0, 0, 1, 1,
-0.4310672, 1.464049, -0.7074861, 0, 0, 0, 1, 1,
-0.4264412, 0.7382123, -1.089547, 0, 0, 0, 1, 1,
-0.4221524, -0.4419884, -3.003688, 0, 0, 0, 1, 1,
-0.4214562, -0.04192922, -1.275911, 0, 0, 0, 1, 1,
-0.4203553, -0.751893, -2.324835, 0, 0, 0, 1, 1,
-0.4198951, -0.4854221, -4.069358, 1, 1, 1, 1, 1,
-0.4169399, -1.067987, -3.217283, 1, 1, 1, 1, 1,
-0.4156695, -1.603248, -4.260083, 1, 1, 1, 1, 1,
-0.4124027, 0.1205987, -1.356264, 1, 1, 1, 1, 1,
-0.4109683, -0.6036922, -2.970474, 1, 1, 1, 1, 1,
-0.4108631, 0.5170378, -2.204431, 1, 1, 1, 1, 1,
-0.4050222, 1.033692, 0.0970563, 1, 1, 1, 1, 1,
-0.4044833, 1.31814, -0.22914, 1, 1, 1, 1, 1,
-0.4028558, 0.3093276, 0.2538971, 1, 1, 1, 1, 1,
-0.4020927, -1.214812, -3.593735, 1, 1, 1, 1, 1,
-0.398206, 1.101135, -0.9733914, 1, 1, 1, 1, 1,
-0.3950783, -1.274696, -1.581203, 1, 1, 1, 1, 1,
-0.3948765, -0.3627367, -4.026207, 1, 1, 1, 1, 1,
-0.3946699, -0.4690705, -3.233943, 1, 1, 1, 1, 1,
-0.3903978, -0.6150339, -1.744007, 1, 1, 1, 1, 1,
-0.3850553, 0.7264558, -1.329952, 0, 0, 1, 1, 1,
-0.3793491, 0.08176957, -1.526455, 1, 0, 0, 1, 1,
-0.3678322, 0.4492451, -1.044964, 1, 0, 0, 1, 1,
-0.3663062, -0.8057025, -3.222206, 1, 0, 0, 1, 1,
-0.3650398, 0.04869457, -1.400216, 1, 0, 0, 1, 1,
-0.3608826, 0.924598, -0.675504, 1, 0, 0, 1, 1,
-0.3608035, -0.3324673, -2.721784, 0, 0, 0, 1, 1,
-0.3512468, 0.8043333, -1.088778, 0, 0, 0, 1, 1,
-0.3506041, 0.2625015, -0.01730267, 0, 0, 0, 1, 1,
-0.3504729, -1.595388, -2.96463, 0, 0, 0, 1, 1,
-0.348687, -1.042786, -3.031415, 0, 0, 0, 1, 1,
-0.3485372, 2.991692, 1.613388, 0, 0, 0, 1, 1,
-0.3469714, 0.05743456, -0.2906799, 0, 0, 0, 1, 1,
-0.3380364, -0.01066615, -1.200618, 1, 1, 1, 1, 1,
-0.3374937, 0.5677058, -2.190638, 1, 1, 1, 1, 1,
-0.3324784, 0.495751, -0.1242434, 1, 1, 1, 1, 1,
-0.3311249, 0.6763043, -0.3730025, 1, 1, 1, 1, 1,
-0.3283851, -1.205469, -3.6879, 1, 1, 1, 1, 1,
-0.32158, 1.123819, -0.7140185, 1, 1, 1, 1, 1,
-0.3073632, 0.6802862, -0.9168586, 1, 1, 1, 1, 1,
-0.3064058, 1.776024, -0.5658645, 1, 1, 1, 1, 1,
-0.3042783, -0.3918272, -4.455512, 1, 1, 1, 1, 1,
-0.3000981, -0.354293, -1.201299, 1, 1, 1, 1, 1,
-0.2915701, -0.7663835, -3.645882, 1, 1, 1, 1, 1,
-0.2911254, 0.4251256, -0.5364149, 1, 1, 1, 1, 1,
-0.2906671, -2.032038, -3.52958, 1, 1, 1, 1, 1,
-0.2902519, -0.3592608, -3.222807, 1, 1, 1, 1, 1,
-0.2846318, -1.311527, -2.556086, 1, 1, 1, 1, 1,
-0.2833407, 0.4768891, -1.080659, 0, 0, 1, 1, 1,
-0.2804022, -0.6880305, -1.942505, 1, 0, 0, 1, 1,
-0.2750037, 0.611134, -2.060563, 1, 0, 0, 1, 1,
-0.273304, -0.09148706, -2.915832, 1, 0, 0, 1, 1,
-0.2680081, 0.9469392, -0.5214033, 1, 0, 0, 1, 1,
-0.2677703, -0.117346, -2.616719, 1, 0, 0, 1, 1,
-0.2664847, -0.1037249, -2.100825, 0, 0, 0, 1, 1,
-0.2662021, -1.052368, -1.00215, 0, 0, 0, 1, 1,
-0.260548, -0.06803894, -1.202156, 0, 0, 0, 1, 1,
-0.2578096, -0.04601844, -2.558449, 0, 0, 0, 1, 1,
-0.2563894, -0.01593022, -3.423559, 0, 0, 0, 1, 1,
-0.2500707, -1.913846, -2.269518, 0, 0, 0, 1, 1,
-0.2485191, 0.242887, -0.6119571, 0, 0, 0, 1, 1,
-0.2475062, 1.496342, 0.6420386, 1, 1, 1, 1, 1,
-0.2465537, 0.6001175, 0.0301603, 1, 1, 1, 1, 1,
-0.2448894, 1.173959, 0.2994633, 1, 1, 1, 1, 1,
-0.2330855, 0.1369145, -0.594425, 1, 1, 1, 1, 1,
-0.2317356, -0.8204035, -3.161101, 1, 1, 1, 1, 1,
-0.2308105, 1.091997, -0.1627932, 1, 1, 1, 1, 1,
-0.2305788, -0.3915059, -3.594171, 1, 1, 1, 1, 1,
-0.2291047, 2.033601, -0.5360447, 1, 1, 1, 1, 1,
-0.2213164, -0.1967385, -1.328472, 1, 1, 1, 1, 1,
-0.2203454, 0.8218846, -1.663314, 1, 1, 1, 1, 1,
-0.2154452, 0.3827723, -0.8126783, 1, 1, 1, 1, 1,
-0.2076857, -0.563773, -1.309476, 1, 1, 1, 1, 1,
-0.207148, -0.8881352, -5.208203, 1, 1, 1, 1, 1,
-0.2046549, 0.9797007, 0.2475866, 1, 1, 1, 1, 1,
-0.2017692, 1.13462, 0.7070258, 1, 1, 1, 1, 1,
-0.2000187, 0.3331605, 0.0521211, 0, 0, 1, 1, 1,
-0.1968936, -1.911169, -4.556642, 1, 0, 0, 1, 1,
-0.1945529, -1.153054, -2.830099, 1, 0, 0, 1, 1,
-0.1923587, -0.1959778, -3.327933, 1, 0, 0, 1, 1,
-0.1903725, -0.0003036561, -1.009997, 1, 0, 0, 1, 1,
-0.1889706, -0.005215012, -1.854948, 1, 0, 0, 1, 1,
-0.1845118, -0.05013821, -1.96412, 0, 0, 0, 1, 1,
-0.1825561, -0.7182823, -3.225197, 0, 0, 0, 1, 1,
-0.1795957, 0.6714446, -0.4485455, 0, 0, 0, 1, 1,
-0.1772562, -0.1375106, -2.654771, 0, 0, 0, 1, 1,
-0.175298, -0.1254052, -1.703179, 0, 0, 0, 1, 1,
-0.165415, -0.7538309, -2.453959, 0, 0, 0, 1, 1,
-0.1595726, 0.4485497, -1.157066, 0, 0, 0, 1, 1,
-0.1582089, -0.3909976, -2.692983, 1, 1, 1, 1, 1,
-0.1530659, -0.3108898, -3.640848, 1, 1, 1, 1, 1,
-0.147572, 0.7228086, -0.7057438, 1, 1, 1, 1, 1,
-0.1472874, -0.9136617, -3.039748, 1, 1, 1, 1, 1,
-0.1447629, 2.935342, 0.285899, 1, 1, 1, 1, 1,
-0.1429661, 1.16228, 1.164448, 1, 1, 1, 1, 1,
-0.1423655, -1.842768, -3.225096, 1, 1, 1, 1, 1,
-0.1393031, -0.2481648, -3.046288, 1, 1, 1, 1, 1,
-0.1281095, 0.4211301, -0.9510582, 1, 1, 1, 1, 1,
-0.1271321, 0.4188622, 1.454348, 1, 1, 1, 1, 1,
-0.1253458, -1.462027, -3.629566, 1, 1, 1, 1, 1,
-0.1227569, -0.5716417, -2.535852, 1, 1, 1, 1, 1,
-0.1226644, 0.5391433, -1.634585, 1, 1, 1, 1, 1,
-0.1219043, -0.9288679, -3.724688, 1, 1, 1, 1, 1,
-0.1215587, -0.7914916, -3.171451, 1, 1, 1, 1, 1,
-0.1206198, 0.05038107, -1.601107, 0, 0, 1, 1, 1,
-0.1200522, 1.120475, -2.157729, 1, 0, 0, 1, 1,
-0.1183532, 0.2804495, -0.8657472, 1, 0, 0, 1, 1,
-0.1135237, -1.755529, -4.633729, 1, 0, 0, 1, 1,
-0.1116873, -0.820365, -3.838917, 1, 0, 0, 1, 1,
-0.110488, 0.7340825, -0.1105598, 1, 0, 0, 1, 1,
-0.1077984, 1.451545, 0.009425898, 0, 0, 0, 1, 1,
-0.105047, -0.8542753, -4.195534, 0, 0, 0, 1, 1,
-0.1049377, -0.8971617, -2.682067, 0, 0, 0, 1, 1,
-0.1048055, 0.07296028, -0.8549808, 0, 0, 0, 1, 1,
-0.1028998, 0.8700917, -1.62702, 0, 0, 0, 1, 1,
-0.102491, -1.943067, -3.128386, 0, 0, 0, 1, 1,
-0.09589019, 1.136535, 0.4444865, 0, 0, 0, 1, 1,
-0.09434233, -0.5117708, -3.326579, 1, 1, 1, 1, 1,
-0.08753664, -1.09051, -4.450206, 1, 1, 1, 1, 1,
-0.08528917, 0.5677503, 0.2753617, 1, 1, 1, 1, 1,
-0.08512953, 0.3573892, -0.9750438, 1, 1, 1, 1, 1,
-0.08304178, -0.136914, -3.090613, 1, 1, 1, 1, 1,
-0.0820931, 0.2151165, -1.456652, 1, 1, 1, 1, 1,
-0.07967234, -1.440756, -2.50727, 1, 1, 1, 1, 1,
-0.07605752, 0.4772394, 0.7308028, 1, 1, 1, 1, 1,
-0.07134017, -0.7200118, -3.111288, 1, 1, 1, 1, 1,
-0.07075271, -0.5838911, -3.475507, 1, 1, 1, 1, 1,
-0.06930119, 0.9905765, 1.069234, 1, 1, 1, 1, 1,
-0.06851055, 0.9121743, -0.5181442, 1, 1, 1, 1, 1,
-0.067232, -1.228098, -2.791019, 1, 1, 1, 1, 1,
-0.06657314, -1.037761, -1.663359, 1, 1, 1, 1, 1,
-0.06620311, 1.15933, 0.5462931, 1, 1, 1, 1, 1,
-0.06386718, 0.9484981, 1.372526, 0, 0, 1, 1, 1,
-0.06220346, 0.4767115, 0.4702721, 1, 0, 0, 1, 1,
-0.05506238, -0.7131371, -2.311031, 1, 0, 0, 1, 1,
-0.05267351, 0.01235816, -0.4694802, 1, 0, 0, 1, 1,
-0.04697055, -0.08229686, -3.241035, 1, 0, 0, 1, 1,
-0.04097942, 1.924881, -0.2512944, 1, 0, 0, 1, 1,
-0.035258, 0.03276224, -1.494124, 0, 0, 0, 1, 1,
-0.03362142, 1.681716, 0.4432397, 0, 0, 0, 1, 1,
-0.03222423, 0.2369361, -0.6924716, 0, 0, 0, 1, 1,
-0.03140863, 2.650116, 0.8424753, 0, 0, 0, 1, 1,
-0.03104365, -0.5981866, -2.939287, 0, 0, 0, 1, 1,
-0.02858084, -1.118146, -2.761704, 0, 0, 0, 1, 1,
-0.02854708, -0.007418772, -1.756989, 0, 0, 0, 1, 1,
-0.02738355, -0.1399526, -2.799335, 1, 1, 1, 1, 1,
-0.02730254, -0.8058221, -3.252272, 1, 1, 1, 1, 1,
-0.02596636, 0.1950553, 0.9374343, 1, 1, 1, 1, 1,
-0.0220446, -1.189576, -3.868036, 1, 1, 1, 1, 1,
-0.02196765, -0.9702451, -3.833135, 1, 1, 1, 1, 1,
-0.01296147, 0.3394257, 0.6409776, 1, 1, 1, 1, 1,
-0.01125623, 0.09139454, -0.6283768, 1, 1, 1, 1, 1,
-0.008699339, 0.6834891, -0.5742276, 1, 1, 1, 1, 1,
-0.008439601, 1.128472, -1.094364, 1, 1, 1, 1, 1,
-0.006163687, 1.313985, 1.421642, 1, 1, 1, 1, 1,
-0.004402166, 0.5676593, 1.249409, 1, 1, 1, 1, 1,
0.001309798, 1.319821, 0.219077, 1, 1, 1, 1, 1,
0.001965272, 0.2888827, -0.4611631, 1, 1, 1, 1, 1,
0.004236981, 0.143218, -0.6890697, 1, 1, 1, 1, 1,
0.006301072, -1.022844, 2.914928, 1, 1, 1, 1, 1,
0.008781453, 0.859533, -0.6852938, 0, 0, 1, 1, 1,
0.01019276, 1.455416, -0.4914792, 1, 0, 0, 1, 1,
0.01150442, 1.549601, 0.4501145, 1, 0, 0, 1, 1,
0.01157161, -0.2647491, 2.789523, 1, 0, 0, 1, 1,
0.01349332, -0.1927073, 3.361127, 1, 0, 0, 1, 1,
0.01532907, 0.2624578, 1.775925, 1, 0, 0, 1, 1,
0.01756361, 1.194203, 0.6859078, 0, 0, 0, 1, 1,
0.01899901, 0.4072221, 0.6658037, 0, 0, 0, 1, 1,
0.02314046, 1.878794, 0.1405058, 0, 0, 0, 1, 1,
0.02457616, 0.615711, 0.6378299, 0, 0, 0, 1, 1,
0.02982576, 0.1908955, -0.6166235, 0, 0, 0, 1, 1,
0.03090038, -0.1957908, 3.838828, 0, 0, 0, 1, 1,
0.03222201, 0.4705612, -0.4306982, 0, 0, 0, 1, 1,
0.03503206, -0.8899852, 4.047319, 1, 1, 1, 1, 1,
0.03603484, 0.411114, -1.433087, 1, 1, 1, 1, 1,
0.03769984, 0.1425909, 0.2730199, 1, 1, 1, 1, 1,
0.03773968, 0.4076157, 1.186356, 1, 1, 1, 1, 1,
0.0414099, 0.03759089, 0.1242111, 1, 1, 1, 1, 1,
0.04306922, -1.407056, 1.297399, 1, 1, 1, 1, 1,
0.04526342, -0.1948123, 3.411561, 1, 1, 1, 1, 1,
0.04866092, -0.7516416, 2.402547, 1, 1, 1, 1, 1,
0.04881123, 0.711853, 0.811704, 1, 1, 1, 1, 1,
0.04954159, 0.6112919, 0.774053, 1, 1, 1, 1, 1,
0.04994613, -0.03025375, 1.408412, 1, 1, 1, 1, 1,
0.05211957, -0.5906124, 4.907725, 1, 1, 1, 1, 1,
0.05251059, -0.6986138, 1.999901, 1, 1, 1, 1, 1,
0.05389139, -0.2281753, 3.128944, 1, 1, 1, 1, 1,
0.05408125, 0.3065202, 0.9195687, 1, 1, 1, 1, 1,
0.05867605, 1.703642, 0.5605292, 0, 0, 1, 1, 1,
0.0644403, -1.704483, 1.953033, 1, 0, 0, 1, 1,
0.06517859, 0.4804288, -0.01859081, 1, 0, 0, 1, 1,
0.06575886, -0.2205656, 3.265025, 1, 0, 0, 1, 1,
0.06614619, -0.9693457, 2.409043, 1, 0, 0, 1, 1,
0.06743295, -0.4791346, 0.05186656, 1, 0, 0, 1, 1,
0.06752364, 0.9924339, -0.7091901, 0, 0, 0, 1, 1,
0.06808466, 0.6458949, 0.6851519, 0, 0, 0, 1, 1,
0.06847452, 0.2274724, -0.06426211, 0, 0, 0, 1, 1,
0.07065179, 0.2209514, 1.866639, 0, 0, 0, 1, 1,
0.07159952, -0.455815, 2.299785, 0, 0, 0, 1, 1,
0.07274615, -0.3718843, 2.948134, 0, 0, 0, 1, 1,
0.07463611, 0.8311254, -0.3023277, 0, 0, 0, 1, 1,
0.07614537, -0.7102824, 4.378252, 1, 1, 1, 1, 1,
0.07853974, 0.4075589, 0.19808, 1, 1, 1, 1, 1,
0.08189791, -0.1725439, 4.070361, 1, 1, 1, 1, 1,
0.0824931, 0.8038225, -0.3498403, 1, 1, 1, 1, 1,
0.08432988, 2.443122, 0.4337179, 1, 1, 1, 1, 1,
0.08508496, 2.448917, -0.9675785, 1, 1, 1, 1, 1,
0.08555199, 0.230075, -1.978171, 1, 1, 1, 1, 1,
0.088884, -0.946054, 3.096704, 1, 1, 1, 1, 1,
0.09211174, -0.246846, 2.199157, 1, 1, 1, 1, 1,
0.0922991, -0.8408126, 3.511458, 1, 1, 1, 1, 1,
0.09474198, -0.7029898, 2.851956, 1, 1, 1, 1, 1,
0.09536485, -0.03745171, 2.418712, 1, 1, 1, 1, 1,
0.09608798, -1.167074, 4.201532, 1, 1, 1, 1, 1,
0.09699563, -1.105237, 3.536071, 1, 1, 1, 1, 1,
0.09804812, -0.3515534, 3.096375, 1, 1, 1, 1, 1,
0.1039538, -0.07386897, 2.179123, 0, 0, 1, 1, 1,
0.1063387, 1.001385, -0.4145761, 1, 0, 0, 1, 1,
0.1063778, -0.5665081, 2.566858, 1, 0, 0, 1, 1,
0.1069031, -0.2524443, 1.052143, 1, 0, 0, 1, 1,
0.1071306, -0.8454004, 2.923409, 1, 0, 0, 1, 1,
0.1099627, 0.739817, 1.473563, 1, 0, 0, 1, 1,
0.1099632, 0.6122563, -0.5488785, 0, 0, 0, 1, 1,
0.1105795, -0.5095339, 2.01723, 0, 0, 0, 1, 1,
0.1147404, -0.5064889, 1.506802, 0, 0, 0, 1, 1,
0.1164434, -0.4626381, 3.112252, 0, 0, 0, 1, 1,
0.1215738, 1.022114, -0.311123, 0, 0, 0, 1, 1,
0.122234, -0.7005459, 1.377201, 0, 0, 0, 1, 1,
0.1260584, 0.1756359, 1.368803, 0, 0, 0, 1, 1,
0.1330544, 0.00353539, 1.980301, 1, 1, 1, 1, 1,
0.1334536, 1.923914, -0.9654089, 1, 1, 1, 1, 1,
0.1339694, 0.5849131, -0.3361873, 1, 1, 1, 1, 1,
0.1399542, -0.9618769, 3.636431, 1, 1, 1, 1, 1,
0.1475033, 0.7784993, 0.7976909, 1, 1, 1, 1, 1,
0.1503883, -1.159432, 2.913252, 1, 1, 1, 1, 1,
0.1532535, -1.251925, 2.696089, 1, 1, 1, 1, 1,
0.1566163, 1.015133, 0.7582063, 1, 1, 1, 1, 1,
0.1580184, 1.244177, 0.3890245, 1, 1, 1, 1, 1,
0.1614164, 0.1155861, 1.5399, 1, 1, 1, 1, 1,
0.1641169, 0.8708739, -0.3653352, 1, 1, 1, 1, 1,
0.1645903, -0.9195519, 3.019201, 1, 1, 1, 1, 1,
0.1663624, 0.9863396, 0.9992632, 1, 1, 1, 1, 1,
0.1674293, -0.3397116, 2.159879, 1, 1, 1, 1, 1,
0.1743136, -1.995853, 3.046451, 1, 1, 1, 1, 1,
0.1752661, -0.2558539, 1.874016, 0, 0, 1, 1, 1,
0.1762516, 0.5073152, -1.489878, 1, 0, 0, 1, 1,
0.1795352, 0.7766425, 1.186289, 1, 0, 0, 1, 1,
0.1816442, 1.836623, 0.717168, 1, 0, 0, 1, 1,
0.1821654, -1.246045, 3.729137, 1, 0, 0, 1, 1,
0.1873535, 1.046528, -1.585527, 1, 0, 0, 1, 1,
0.1893429, 0.6393245, -0.017287, 0, 0, 0, 1, 1,
0.1911511, -1.245568, 2.673517, 0, 0, 0, 1, 1,
0.1921891, 1.472121, -0.2511038, 0, 0, 0, 1, 1,
0.1940263, 0.417072, 0.1421295, 0, 0, 0, 1, 1,
0.2008161, -0.1672442, 3.489598, 0, 0, 0, 1, 1,
0.2029229, -0.876256, 1.265335, 0, 0, 0, 1, 1,
0.2046642, -1.096856, 1.530269, 0, 0, 0, 1, 1,
0.2067117, -0.08181523, 2.654235, 1, 1, 1, 1, 1,
0.2073384, -2.200566, 3.065968, 1, 1, 1, 1, 1,
0.2101337, -0.6774757, 0.6580405, 1, 1, 1, 1, 1,
0.2139832, -2.255471, 2.077194, 1, 1, 1, 1, 1,
0.2186065, -1.92728, 1.917372, 1, 1, 1, 1, 1,
0.218956, -0.3258147, 2.667437, 1, 1, 1, 1, 1,
0.2190717, 0.7984519, 2.806052, 1, 1, 1, 1, 1,
0.2204663, -0.4246996, 2.915956, 1, 1, 1, 1, 1,
0.2232663, 0.7942213, -0.03732359, 1, 1, 1, 1, 1,
0.22577, -0.6672626, 2.066602, 1, 1, 1, 1, 1,
0.2297726, 1.135465, 1.399525, 1, 1, 1, 1, 1,
0.2311522, 0.4922785, -0.1806263, 1, 1, 1, 1, 1,
0.2342349, 0.3071216, 0.1851696, 1, 1, 1, 1, 1,
0.23591, 0.6157383, 0.05591544, 1, 1, 1, 1, 1,
0.2370068, -0.693158, 2.247466, 1, 1, 1, 1, 1,
0.2392926, 1.114052, 0.04072242, 0, 0, 1, 1, 1,
0.2394106, -0.2645667, 2.43012, 1, 0, 0, 1, 1,
0.2413819, 0.3004354, 1.947021, 1, 0, 0, 1, 1,
0.2417997, -0.5225589, 2.40958, 1, 0, 0, 1, 1,
0.2436383, -1.151273, 1.465812, 1, 0, 0, 1, 1,
0.251788, 1.482767, 1.677995, 1, 0, 0, 1, 1,
0.262096, -0.4094968, 0.4896624, 0, 0, 0, 1, 1,
0.2642987, -1.332069, 3.057184, 0, 0, 0, 1, 1,
0.2698327, 0.5720075, 2.680911, 0, 0, 0, 1, 1,
0.2702501, 1.328481, 0.2542817, 0, 0, 0, 1, 1,
0.2724113, 0.4331019, 0.4522953, 0, 0, 0, 1, 1,
0.2840115, 0.2330063, 1.281656, 0, 0, 0, 1, 1,
0.2843642, 0.5077068, -0.1048234, 0, 0, 0, 1, 1,
0.2899289, 0.09396707, 2.168897, 1, 1, 1, 1, 1,
0.2902432, -1.68193, 2.930375, 1, 1, 1, 1, 1,
0.2903432, -0.2161955, 3.376507, 1, 1, 1, 1, 1,
0.2913041, 1.579715, 0.4918418, 1, 1, 1, 1, 1,
0.2935323, -0.4900612, 1.286261, 1, 1, 1, 1, 1,
0.2940422, 0.08361921, 1.866673, 1, 1, 1, 1, 1,
0.2958486, 0.1215783, 2.246607, 1, 1, 1, 1, 1,
0.2975813, -0.02857968, 0.9706988, 1, 1, 1, 1, 1,
0.3009343, 0.5737659, 0.2606759, 1, 1, 1, 1, 1,
0.3031735, 1.46601, -0.01150789, 1, 1, 1, 1, 1,
0.3037994, -0.4423027, 2.240944, 1, 1, 1, 1, 1,
0.3068159, -1.598884, 3.178773, 1, 1, 1, 1, 1,
0.308293, 0.9814792, -0.6335603, 1, 1, 1, 1, 1,
0.3223886, -0.4620893, 1.250382, 1, 1, 1, 1, 1,
0.3230846, 0.6702271, 0.3743934, 1, 1, 1, 1, 1,
0.3259114, -0.3734134, 4.06426, 0, 0, 1, 1, 1,
0.3268288, -0.375353, 3.537291, 1, 0, 0, 1, 1,
0.3294916, 0.1396677, 1.802183, 1, 0, 0, 1, 1,
0.3299967, 1.729777, 1.169919, 1, 0, 0, 1, 1,
0.3313898, -2.442029, 5.154346, 1, 0, 0, 1, 1,
0.3332436, -0.6830657, 3.696268, 1, 0, 0, 1, 1,
0.3353937, 0.62884, 0.224214, 0, 0, 0, 1, 1,
0.3388248, 0.8633354, 0.6539076, 0, 0, 0, 1, 1,
0.3424127, -0.1822588, 2.634231, 0, 0, 0, 1, 1,
0.343112, -1.351617, 3.951375, 0, 0, 0, 1, 1,
0.343491, 0.3401673, 0.8671167, 0, 0, 0, 1, 1,
0.3580859, 0.4191345, 0.2728736, 0, 0, 0, 1, 1,
0.3583166, -0.2881957, 3.412916, 0, 0, 0, 1, 1,
0.3606058, -1.279629, 6.184458, 1, 1, 1, 1, 1,
0.368646, -0.006028515, 2.214185, 1, 1, 1, 1, 1,
0.3768488, 1.026446, 0.754042, 1, 1, 1, 1, 1,
0.3851331, 1.97026, 0.6455005, 1, 1, 1, 1, 1,
0.3885287, -0.1648953, 2.767948, 1, 1, 1, 1, 1,
0.3931988, 0.9175959, 1.499464, 1, 1, 1, 1, 1,
0.3957637, 0.7946079, -0.8103417, 1, 1, 1, 1, 1,
0.3980688, -0.3334002, 2.676897, 1, 1, 1, 1, 1,
0.3980996, -0.8753315, 1.403299, 1, 1, 1, 1, 1,
0.4014297, -0.4756366, 3.168561, 1, 1, 1, 1, 1,
0.4075505, -0.2590515, 3.391879, 1, 1, 1, 1, 1,
0.4102845, 1.237991, -0.2675263, 1, 1, 1, 1, 1,
0.4130857, 0.8572659, 0.9545121, 1, 1, 1, 1, 1,
0.4132018, -0.07327645, 2.527381, 1, 1, 1, 1, 1,
0.4190325, -0.240352, 3.22483, 1, 1, 1, 1, 1,
0.4190773, -0.4705648, 1.457629, 0, 0, 1, 1, 1,
0.4200865, 1.47459, 0.06272342, 1, 0, 0, 1, 1,
0.4213912, 1.651075, 1.380547, 1, 0, 0, 1, 1,
0.4235609, -0.646911, 1.901178, 1, 0, 0, 1, 1,
0.4238735, 0.4439739, 0.3973021, 1, 0, 0, 1, 1,
0.42727, -0.02930556, 1.102719, 1, 0, 0, 1, 1,
0.4289945, 0.1352546, 2.462017, 0, 0, 0, 1, 1,
0.4320873, 0.1590312, 1.406959, 0, 0, 0, 1, 1,
0.4348811, -0.3267252, 3.245363, 0, 0, 0, 1, 1,
0.4348903, 0.6353441, 0.5923675, 0, 0, 0, 1, 1,
0.435944, -1.004655, 3.017807, 0, 0, 0, 1, 1,
0.4361506, 0.8914599, 0.9998863, 0, 0, 0, 1, 1,
0.4377631, 0.6554015, 0.1773427, 0, 0, 0, 1, 1,
0.4436838, 1.848834, 0.482794, 1, 1, 1, 1, 1,
0.4462198, -1.438133, 1.964684, 1, 1, 1, 1, 1,
0.4518716, 0.4763788, 1.368655, 1, 1, 1, 1, 1,
0.453951, -0.6841979, 3.245934, 1, 1, 1, 1, 1,
0.4541623, 0.7329032, 0.9427429, 1, 1, 1, 1, 1,
0.4547902, 0.5714639, 1.554807, 1, 1, 1, 1, 1,
0.4553359, 1.502608, 1.120181, 1, 1, 1, 1, 1,
0.4555674, -0.8935226, 2.965151, 1, 1, 1, 1, 1,
0.4570821, -0.1498297, 2.964365, 1, 1, 1, 1, 1,
0.4650038, -0.7726936, 4.307757, 1, 1, 1, 1, 1,
0.4662131, 1.82429, 0.6297769, 1, 1, 1, 1, 1,
0.4680925, 0.01518654, 1.235129, 1, 1, 1, 1, 1,
0.4821827, 0.4045175, -0.8679379, 1, 1, 1, 1, 1,
0.4828009, 1.067795, -0.5319124, 1, 1, 1, 1, 1,
0.4872517, 1.378603, 1.96918, 1, 1, 1, 1, 1,
0.489287, -0.5505079, 1.990107, 0, 0, 1, 1, 1,
0.4925391, 0.07634491, 1.640522, 1, 0, 0, 1, 1,
0.4970683, -1.433288, 1.674041, 1, 0, 0, 1, 1,
0.4990887, -1.188165, 3.580976, 1, 0, 0, 1, 1,
0.5022785, -0.2984284, 1.584183, 1, 0, 0, 1, 1,
0.5041749, 0.5968345, 2.383557, 1, 0, 0, 1, 1,
0.5140119, 1.624876, -0.631538, 0, 0, 0, 1, 1,
0.5174434, 0.7360588, 1.820203, 0, 0, 0, 1, 1,
0.5220577, 0.6811836, 0.03982243, 0, 0, 0, 1, 1,
0.5277684, 0.9627199, 0.9560206, 0, 0, 0, 1, 1,
0.5285331, 1.283092, 0.4826465, 0, 0, 0, 1, 1,
0.5296609, 0.3509468, 2.567183, 0, 0, 0, 1, 1,
0.5308825, 0.2703087, -0.3479645, 0, 0, 0, 1, 1,
0.5310736, -0.5238746, 3.341026, 1, 1, 1, 1, 1,
0.5335576, -0.624878, 1.880909, 1, 1, 1, 1, 1,
0.5348295, -1.419876, 3.293408, 1, 1, 1, 1, 1,
0.5354874, 1.329427, 0.5281298, 1, 1, 1, 1, 1,
0.5383701, 0.7169797, 0.9080351, 1, 1, 1, 1, 1,
0.5389078, 0.614388, 1.956527, 1, 1, 1, 1, 1,
0.5419872, 0.1920856, 1.268894, 1, 1, 1, 1, 1,
0.5502836, -0.9130071, 4.269937, 1, 1, 1, 1, 1,
0.5530733, -0.03625534, 1.55984, 1, 1, 1, 1, 1,
0.5532845, 0.6028105, 1.206426, 1, 1, 1, 1, 1,
0.5558566, -0.4529748, 2.48265, 1, 1, 1, 1, 1,
0.5580918, -1.337065, 4.330712, 1, 1, 1, 1, 1,
0.5596249, 1.141011, -0.2884455, 1, 1, 1, 1, 1,
0.5673674, 0.7890519, 0.3037614, 1, 1, 1, 1, 1,
0.5681162, -1.002641, 1.596516, 1, 1, 1, 1, 1,
0.5701389, -0.3999591, 2.81577, 0, 0, 1, 1, 1,
0.5727865, 0.3932057, 2.753931, 1, 0, 0, 1, 1,
0.5730437, 1.688741, 0.2715514, 1, 0, 0, 1, 1,
0.574684, 1.249685, -0.6278566, 1, 0, 0, 1, 1,
0.5797995, -0.03585643, 0.3125058, 1, 0, 0, 1, 1,
0.5863523, -0.04901811, 1.878342, 1, 0, 0, 1, 1,
0.5924829, 0.239826, -0.1695156, 0, 0, 0, 1, 1,
0.5950683, -1.020493, 3.101412, 0, 0, 0, 1, 1,
0.5957533, -1.340574, 2.56114, 0, 0, 0, 1, 1,
0.5963956, 0.1765525, 0.8034421, 0, 0, 0, 1, 1,
0.6023883, 1.046586, 0.7748396, 0, 0, 0, 1, 1,
0.6083658, -0.6994452, 3.809877, 0, 0, 0, 1, 1,
0.6116446, -2.260226, 3.318285, 0, 0, 0, 1, 1,
0.6131077, -2.012083, 3.126638, 1, 1, 1, 1, 1,
0.6133958, 0.0637721, 2.135307, 1, 1, 1, 1, 1,
0.6148956, 1.158804, 1.172535, 1, 1, 1, 1, 1,
0.6169205, -0.7486911, 0.3268446, 1, 1, 1, 1, 1,
0.6182745, 0.5535411, 1.144453, 1, 1, 1, 1, 1,
0.6187904, 1.703933, 0.3494625, 1, 1, 1, 1, 1,
0.6190887, -1.704586, 2.807245, 1, 1, 1, 1, 1,
0.6214983, -2.952036, 3.021763, 1, 1, 1, 1, 1,
0.6338832, 0.1015402, 2.285157, 1, 1, 1, 1, 1,
0.6462706, 1.137864, 1.854569, 1, 1, 1, 1, 1,
0.6478179, 1.029654, 1.078286, 1, 1, 1, 1, 1,
0.6498894, -0.9771561, 2.539922, 1, 1, 1, 1, 1,
0.6506318, -1.230235, 1.972682, 1, 1, 1, 1, 1,
0.651812, -0.5206584, 2.329934, 1, 1, 1, 1, 1,
0.6522876, 0.699267, 1.575364, 1, 1, 1, 1, 1,
0.6525958, 0.6463046, -0.3336186, 0, 0, 1, 1, 1,
0.652988, -0.6153374, 1.943815, 1, 0, 0, 1, 1,
0.6553031, -0.8056351, 0.7084447, 1, 0, 0, 1, 1,
0.6605048, 1.248981, 0.3171898, 1, 0, 0, 1, 1,
0.6614389, 1.595731, 1.214628, 1, 0, 0, 1, 1,
0.6626583, -1.188717, 2.273195, 1, 0, 0, 1, 1,
0.6635184, -0.2233127, 0.8560507, 0, 0, 0, 1, 1,
0.6646901, 0.570278, 0.1815024, 0, 0, 0, 1, 1,
0.672156, -0.3666444, 1.720742, 0, 0, 0, 1, 1,
0.6729935, 1.119081, 0.2278099, 0, 0, 0, 1, 1,
0.6737136, 0.3766148, 0.5406524, 0, 0, 0, 1, 1,
0.6806709, 0.5131209, 2.033723, 0, 0, 0, 1, 1,
0.6821703, 0.4750758, 2.144693, 0, 0, 0, 1, 1,
0.6859621, -0.9205204, 2.798034, 1, 1, 1, 1, 1,
0.6870473, 1.087183, 1.247672, 1, 1, 1, 1, 1,
0.6919265, 1.324541, 0.316401, 1, 1, 1, 1, 1,
0.7018739, -0.9194613, 3.832852, 1, 1, 1, 1, 1,
0.7068896, 1.153241, -0.4296314, 1, 1, 1, 1, 1,
0.7085049, 1.329049, 0.2604589, 1, 1, 1, 1, 1,
0.7171546, 2.487064, -0.5786376, 1, 1, 1, 1, 1,
0.7194912, -1.687852, 2.14011, 1, 1, 1, 1, 1,
0.7204744, -0.6343566, 0.2416327, 1, 1, 1, 1, 1,
0.722455, -0.4242759, 1.002598, 1, 1, 1, 1, 1,
0.7256522, 0.8023531, -0.3978812, 1, 1, 1, 1, 1,
0.7334088, -0.5209411, 1.790432, 1, 1, 1, 1, 1,
0.7400728, 1.644046, 1.607198, 1, 1, 1, 1, 1,
0.741299, -1.630748, 1.268923, 1, 1, 1, 1, 1,
0.7542992, 0.5570402, 0.4218738, 1, 1, 1, 1, 1,
0.7545205, -0.9898066, 1.488933, 0, 0, 1, 1, 1,
0.7548392, -0.9180439, 4.013478, 1, 0, 0, 1, 1,
0.7562385, 0.3538919, 1.122133, 1, 0, 0, 1, 1,
0.7593955, -1.241081, 3.041582, 1, 0, 0, 1, 1,
0.7608814, -1.263325, 1.72727, 1, 0, 0, 1, 1,
0.7628829, 0.8936436, 1.43249, 1, 0, 0, 1, 1,
0.7669622, -0.9227623, 2.178497, 0, 0, 0, 1, 1,
0.7669966, 0.1859499, 1.642638, 0, 0, 0, 1, 1,
0.7680143, 0.4071186, 1.192208, 0, 0, 0, 1, 1,
0.7752768, 1.641926, -0.1439719, 0, 0, 0, 1, 1,
0.7836049, 0.007451575, 1.98668, 0, 0, 0, 1, 1,
0.7862883, 0.3186592, 2.211725, 0, 0, 0, 1, 1,
0.7864507, -1.256213, 0.9839482, 0, 0, 0, 1, 1,
0.787822, 1.821464, 0.8396693, 1, 1, 1, 1, 1,
0.7991304, -1.177168, 3.161447, 1, 1, 1, 1, 1,
0.8027878, 0.2722896, 0.7301546, 1, 1, 1, 1, 1,
0.8049047, -0.6431927, 2.168922, 1, 1, 1, 1, 1,
0.8137868, -0.8576969, 1.77218, 1, 1, 1, 1, 1,
0.8145061, -0.1435313, 1.957212, 1, 1, 1, 1, 1,
0.8180407, -0.4332993, 2.527598, 1, 1, 1, 1, 1,
0.8256583, -0.4653401, 1.667016, 1, 1, 1, 1, 1,
0.8266605, 2.154929, 0.4706666, 1, 1, 1, 1, 1,
0.8325119, -0.2274489, 0.2014896, 1, 1, 1, 1, 1,
0.8331774, 0.9332808, -1.034999, 1, 1, 1, 1, 1,
0.8367913, 1.035661, 0.6969305, 1, 1, 1, 1, 1,
0.8381302, -0.04950526, 1.281417, 1, 1, 1, 1, 1,
0.8495812, 0.2374349, -0.2312438, 1, 1, 1, 1, 1,
0.8530772, -0.1564511, 3.620043, 1, 1, 1, 1, 1,
0.8539237, -0.8747754, 1.111905, 0, 0, 1, 1, 1,
0.8559975, 2.110847, 0.932382, 1, 0, 0, 1, 1,
0.8612652, 1.066769, -0.513223, 1, 0, 0, 1, 1,
0.8649846, -0.7775229, 1.604332, 1, 0, 0, 1, 1,
0.8669963, -0.7467685, 4.088582, 1, 0, 0, 1, 1,
0.8689612, 1.61694, 0.1285539, 1, 0, 0, 1, 1,
0.8703699, 0.1166498, -0.01132286, 0, 0, 0, 1, 1,
0.8770581, -0.3569745, 3.92107, 0, 0, 0, 1, 1,
0.8875427, 0.1517802, 1.547467, 0, 0, 0, 1, 1,
0.8883194, 0.9662213, -0.8320127, 0, 0, 0, 1, 1,
0.8885768, 1.426269, 2.141044, 0, 0, 0, 1, 1,
0.8889892, 0.5731383, 1.085786, 0, 0, 0, 1, 1,
0.8904442, 0.8051904, 0.07695717, 0, 0, 0, 1, 1,
0.8906405, -1.221154, 1.748984, 1, 1, 1, 1, 1,
0.8929738, -1.244139, 2.486336, 1, 1, 1, 1, 1,
0.8965571, -0.006622959, 0.5224375, 1, 1, 1, 1, 1,
0.8974661, 0.7242141, 2.35514, 1, 1, 1, 1, 1,
0.9021013, -0.26207, 0.28899, 1, 1, 1, 1, 1,
0.9030137, -0.8084368, 1.266799, 1, 1, 1, 1, 1,
0.9033968, 0.8885543, 0.01509881, 1, 1, 1, 1, 1,
0.9045238, 0.8198116, 0.780385, 1, 1, 1, 1, 1,
0.9123918, 0.3132161, 0.4025998, 1, 1, 1, 1, 1,
0.9185495, 0.02487465, 1.279009, 1, 1, 1, 1, 1,
0.9220995, 0.7590343, 0.03279807, 1, 1, 1, 1, 1,
0.9270312, -3.378723, 1.853521, 1, 1, 1, 1, 1,
0.9299953, 1.445556, 1.953928, 1, 1, 1, 1, 1,
0.9318024, -0.1586411, 0.7578207, 1, 1, 1, 1, 1,
0.9393153, 0.2085768, 1.406281, 1, 1, 1, 1, 1,
0.9394244, -0.7398366, 3.217044, 0, 0, 1, 1, 1,
0.9556434, -0.7645491, 1.728753, 1, 0, 0, 1, 1,
0.9627882, 0.7969357, 2.72666, 1, 0, 0, 1, 1,
0.9706829, 1.221128, 0.6168748, 1, 0, 0, 1, 1,
0.9762807, 0.7458165, 2.425992, 1, 0, 0, 1, 1,
0.9813057, 0.6301773, 1.255872, 1, 0, 0, 1, 1,
0.9824244, -0.7042838, 3.598044, 0, 0, 0, 1, 1,
0.9831112, 0.02640015, 1.176041, 0, 0, 0, 1, 1,
0.9851255, -0.8760391, 2.186178, 0, 0, 0, 1, 1,
0.985375, -1.11698, 2.170886, 0, 0, 0, 1, 1,
0.986935, -0.2188691, 1.983325, 0, 0, 0, 1, 1,
0.9891802, 0.4877346, -0.04799533, 0, 0, 0, 1, 1,
0.992943, -2.136033, 2.428272, 0, 0, 0, 1, 1,
0.9987825, 0.3329426, 0.5260934, 1, 1, 1, 1, 1,
1.007039, 1.419965, 1.61616, 1, 1, 1, 1, 1,
1.009805, -0.2300921, 2.295318, 1, 1, 1, 1, 1,
1.016363, -0.01722508, 3.38548, 1, 1, 1, 1, 1,
1.018189, 0.9782055, 0.05546407, 1, 1, 1, 1, 1,
1.03395, -0.4000523, 1.76262, 1, 1, 1, 1, 1,
1.036415, 0.3715389, 2.004372, 1, 1, 1, 1, 1,
1.039074, 0.1603051, -0.7675269, 1, 1, 1, 1, 1,
1.039562, -0.0885217, 1.133658, 1, 1, 1, 1, 1,
1.045095, -0.5872548, 1.847762, 1, 1, 1, 1, 1,
1.046041, -1.880136, 2.153239, 1, 1, 1, 1, 1,
1.051778, 0.8972295, -1.170995, 1, 1, 1, 1, 1,
1.052402, -0.1980982, 1.166432, 1, 1, 1, 1, 1,
1.052479, -1.061082, 0.285487, 1, 1, 1, 1, 1,
1.055404, -1.024786, 3.905124, 1, 1, 1, 1, 1,
1.062792, 0.1104552, 1.925344, 0, 0, 1, 1, 1,
1.064539, -0.7894698, 2.212241, 1, 0, 0, 1, 1,
1.065104, 0.1691264, 1.274194, 1, 0, 0, 1, 1,
1.070394, 0.9398026, 1.740102, 1, 0, 0, 1, 1,
1.074862, 0.4589571, 1.123107, 1, 0, 0, 1, 1,
1.075771, -0.1737149, 2.091271, 1, 0, 0, 1, 1,
1.079728, -2.510321, 0.8475193, 0, 0, 0, 1, 1,
1.092143, 0.4573988, -1.715822, 0, 0, 0, 1, 1,
1.092624, 0.007595239, 1.664466, 0, 0, 0, 1, 1,
1.092702, 0.9688756, -1.043952, 0, 0, 0, 1, 1,
1.103576, -0.134839, 2.210973, 0, 0, 0, 1, 1,
1.111877, 0.1924124, 2.408712, 0, 0, 0, 1, 1,
1.119734, 1.116993, -0.2932224, 0, 0, 0, 1, 1,
1.121271, 0.937372, 0.09655916, 1, 1, 1, 1, 1,
1.125203, -1.073612, 3.404987, 1, 1, 1, 1, 1,
1.126867, -1.308343, 2.273292, 1, 1, 1, 1, 1,
1.129381, 0.6819839, 0.8984573, 1, 1, 1, 1, 1,
1.130928, 1.798676, 0.3467673, 1, 1, 1, 1, 1,
1.131974, -0.6673129, 1.866145, 1, 1, 1, 1, 1,
1.142705, -0.9544652, 1.56951, 1, 1, 1, 1, 1,
1.149855, -0.3516414, 2.675708, 1, 1, 1, 1, 1,
1.152777, 0.002708265, 3.658124, 1, 1, 1, 1, 1,
1.153944, -0.7128032, 3.246025, 1, 1, 1, 1, 1,
1.157406, 2.05176, 1.283437, 1, 1, 1, 1, 1,
1.162012, 0.5335889, -0.1914044, 1, 1, 1, 1, 1,
1.162295, 0.726962, 1.078484, 1, 1, 1, 1, 1,
1.16958, 0.3466286, 1.392319, 1, 1, 1, 1, 1,
1.172197, 2.162044, -0.682829, 1, 1, 1, 1, 1,
1.177066, -0.3662158, 3.127305, 0, 0, 1, 1, 1,
1.177383, 0.1471939, -0.6947891, 1, 0, 0, 1, 1,
1.183271, -0.2794757, 1.665358, 1, 0, 0, 1, 1,
1.199749, -0.005634648, 2.0969, 1, 0, 0, 1, 1,
1.200896, 0.855794, 2.239415, 1, 0, 0, 1, 1,
1.204167, -0.7089292, 2.721293, 1, 0, 0, 1, 1,
1.207392, -0.823444, 4.144762, 0, 0, 0, 1, 1,
1.213051, 1.311545, 0.772697, 0, 0, 0, 1, 1,
1.213163, 0.6969361, 3.177474, 0, 0, 0, 1, 1,
1.215379, -0.4077864, -0.3353249, 0, 0, 0, 1, 1,
1.222518, 0.2945772, 2.017056, 0, 0, 0, 1, 1,
1.227731, -1.019193, 1.724883, 0, 0, 0, 1, 1,
1.229269, 1.91611, 2.171936, 0, 0, 0, 1, 1,
1.230046, -1.481961, 2.423862, 1, 1, 1, 1, 1,
1.230397, 0.6526327, -0.9249203, 1, 1, 1, 1, 1,
1.254135, 0.4060366, -0.1701071, 1, 1, 1, 1, 1,
1.254359, -0.6713841, 2.864006, 1, 1, 1, 1, 1,
1.25583, 0.3735272, 0.2792909, 1, 1, 1, 1, 1,
1.255937, -0.9005864, 2.363264, 1, 1, 1, 1, 1,
1.264354, 0.9701642, 0.2878323, 1, 1, 1, 1, 1,
1.271878, 1.174855, 1.433554, 1, 1, 1, 1, 1,
1.273992, 0.4926709, 1.516918, 1, 1, 1, 1, 1,
1.278914, -0.2718045, 2.253136, 1, 1, 1, 1, 1,
1.280128, 1.21922, 1.871213, 1, 1, 1, 1, 1,
1.282598, 0.629799, 2.879478, 1, 1, 1, 1, 1,
1.288852, 0.1095174, 0.9357286, 1, 1, 1, 1, 1,
1.293351, -0.8911725, 2.793749, 1, 1, 1, 1, 1,
1.295704, -0.3382847, 2.962281, 1, 1, 1, 1, 1,
1.30143, -0.4756208, 0.05119875, 0, 0, 1, 1, 1,
1.308082, -0.3333189, 0.7427664, 1, 0, 0, 1, 1,
1.317037, 1.262545, 0.5385452, 1, 0, 0, 1, 1,
1.337992, 0.7202594, -0.2307525, 1, 0, 0, 1, 1,
1.338766, -0.4530568, 1.732285, 1, 0, 0, 1, 1,
1.339949, -2.072302, 4.452698, 1, 0, 0, 1, 1,
1.344764, 0.9091707, 0.761288, 0, 0, 0, 1, 1,
1.358763, 1.37068, 0.283447, 0, 0, 0, 1, 1,
1.360292, -0.3784367, 2.896782, 0, 0, 0, 1, 1,
1.368278, 0.3729115, 0.3098779, 0, 0, 0, 1, 1,
1.369779, 0.5783912, 1.371491, 0, 0, 0, 1, 1,
1.372239, 1.009565, 0.413977, 0, 0, 0, 1, 1,
1.385016, 1.193833, 0.616497, 0, 0, 0, 1, 1,
1.394748, 0.5842211, 1.816647, 1, 1, 1, 1, 1,
1.397511, 0.8690224, 1.084876, 1, 1, 1, 1, 1,
1.405995, 0.3531955, 2.932024, 1, 1, 1, 1, 1,
1.409871, -0.4592733, 3.028777, 1, 1, 1, 1, 1,
1.43459, 1.469069, -1.53111, 1, 1, 1, 1, 1,
1.437768, -1.410453, 3.192872, 1, 1, 1, 1, 1,
1.437932, 0.9939126, 0.380566, 1, 1, 1, 1, 1,
1.451181, -1.088905, 1.542013, 1, 1, 1, 1, 1,
1.458218, 0.3800797, 1.251985, 1, 1, 1, 1, 1,
1.462253, -0.5088773, 0.617188, 1, 1, 1, 1, 1,
1.467185, 0.3499843, 0.9835981, 1, 1, 1, 1, 1,
1.469218, 0.06901731, 2.511841, 1, 1, 1, 1, 1,
1.470409, 0.983769, 1.600767, 1, 1, 1, 1, 1,
1.501675, 0.3226819, 0.413454, 1, 1, 1, 1, 1,
1.501823, -0.8020528, 2.843959, 1, 1, 1, 1, 1,
1.513756, 0.4897957, -1.745118, 0, 0, 1, 1, 1,
1.547104, 2.54402, 0.5202082, 1, 0, 0, 1, 1,
1.551397, 1.066769, 1.226947, 1, 0, 0, 1, 1,
1.552226, -1.098799, 0.4624083, 1, 0, 0, 1, 1,
1.553333, 0.4880788, 0.7669521, 1, 0, 0, 1, 1,
1.602815, 0.4332693, 1.534742, 1, 0, 0, 1, 1,
1.611054, -0.1442734, 0.03037389, 0, 0, 0, 1, 1,
1.615261, -0.5720025, 0.1355865, 0, 0, 0, 1, 1,
1.635336, 0.6709409, 1.149655, 0, 0, 0, 1, 1,
1.643538, -0.2349283, 1.794924, 0, 0, 0, 1, 1,
1.656112, 0.2749901, 2.379889, 0, 0, 0, 1, 1,
1.657118, -0.8126215, 2.067365, 0, 0, 0, 1, 1,
1.661813, -0.154335, 1.455132, 0, 0, 0, 1, 1,
1.754168, 1.416986, 1.016458, 1, 1, 1, 1, 1,
1.757639, 0.4463271, 1.555951, 1, 1, 1, 1, 1,
1.762981, 0.9289677, 1.073128, 1, 1, 1, 1, 1,
1.769466, 0.9340026, 2.02167, 1, 1, 1, 1, 1,
1.804535, -0.2962079, 2.208489, 1, 1, 1, 1, 1,
1.8096, -2.126225, 1.028902, 1, 1, 1, 1, 1,
1.817413, 0.1956201, 2.067402, 1, 1, 1, 1, 1,
1.828279, -0.4232409, 2.938136, 1, 1, 1, 1, 1,
1.851288, -1.336446, 1.846947, 1, 1, 1, 1, 1,
1.881181, 0.8588131, 1.60332, 1, 1, 1, 1, 1,
1.888863, -1.579623, 1.977622, 1, 1, 1, 1, 1,
1.894937, -0.9278516, 2.172594, 1, 1, 1, 1, 1,
1.915987, -1.772112, 1.2516, 1, 1, 1, 1, 1,
1.940167, 0.3829209, 1.153163, 1, 1, 1, 1, 1,
1.950331, -1.008204, 1.404481, 1, 1, 1, 1, 1,
1.960457, 0.8234894, -0.01518855, 0, 0, 1, 1, 1,
2.03448, 0.1368783, 3.400208, 1, 0, 0, 1, 1,
2.073551, 0.6923734, -0.2947109, 1, 0, 0, 1, 1,
2.118775, 0.2344735, 2.705625, 1, 0, 0, 1, 1,
2.153322, -1.12122, 1.165771, 1, 0, 0, 1, 1,
2.192055, -0.7657142, 2.932142, 1, 0, 0, 1, 1,
2.249782, 1.788053, 1.024962, 0, 0, 0, 1, 1,
2.268239, 2.595276, 0.08017275, 0, 0, 0, 1, 1,
2.290084, -0.8593242, 2.362544, 0, 0, 0, 1, 1,
2.356836, -0.9025764, 1.482805, 0, 0, 0, 1, 1,
2.415017, 0.5719319, -0.1777732, 0, 0, 0, 1, 1,
2.469831, 0.9426483, 1.200374, 0, 0, 0, 1, 1,
2.477422, -0.05276517, 3.101711, 0, 0, 0, 1, 1,
2.5228, 0.09241117, 2.329618, 1, 1, 1, 1, 1,
2.56513, 0.5287133, 1.093818, 1, 1, 1, 1, 1,
2.628992, -1.018518, 0.9777752, 1, 1, 1, 1, 1,
2.789392, 0.7309319, 1.875407, 1, 1, 1, 1, 1,
2.958589, -0.5932601, 0.1596972, 1, 1, 1, 1, 1,
3.344262, -0.4649403, 0.7172301, 1, 1, 1, 1, 1,
4.071054, 0.2317724, 3.534614, 1, 1, 1, 1, 1
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
var radius = 10.23525;
var distance = 35.95087;
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
mvMatrix.translate( -0.1494765, 0.1935158, -0.4881277 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.95087);
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
