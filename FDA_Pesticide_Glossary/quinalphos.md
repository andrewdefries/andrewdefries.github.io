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
-3.359612, -1.434971, -1.279552, 1, 0, 0, 1,
-3.087739, -0.3286535, -2.342997, 1, 0.007843138, 0, 1,
-2.811983, 0.7379709, -1.635135, 1, 0.01176471, 0, 1,
-2.728648, -0.09566763, -2.9504, 1, 0.01960784, 0, 1,
-2.718513, -0.5846786, -0.3784677, 1, 0.02352941, 0, 1,
-2.651161, 0.5626908, -1.273667, 1, 0.03137255, 0, 1,
-2.648842, -0.4991371, -3.580524, 1, 0.03529412, 0, 1,
-2.641533, 0.2741978, -0.7911773, 1, 0.04313726, 0, 1,
-2.615102, 1.016588, -2.448722, 1, 0.04705882, 0, 1,
-2.558118, 0.7126998, -1.520665, 1, 0.05490196, 0, 1,
-2.531147, 1.166537, -1.416732, 1, 0.05882353, 0, 1,
-2.492142, 0.8815475, -1.404251, 1, 0.06666667, 0, 1,
-2.492008, 0.3458521, -0.910867, 1, 0.07058824, 0, 1,
-2.453995, 0.1009262, -0.9059891, 1, 0.07843138, 0, 1,
-2.410406, 0.9221492, -2.280029, 1, 0.08235294, 0, 1,
-2.386482, -0.7283833, -2.271143, 1, 0.09019608, 0, 1,
-2.386236, -0.2035749, -1.471515, 1, 0.09411765, 0, 1,
-2.383193, 0.2237733, -2.696177, 1, 0.1019608, 0, 1,
-2.350054, 0.6558129, -0.4447135, 1, 0.1098039, 0, 1,
-2.346776, -2.473429, -1.057061, 1, 0.1137255, 0, 1,
-2.336246, -1.666055, -3.137786, 1, 0.1215686, 0, 1,
-2.306169, -1.068856, -3.353487, 1, 0.1254902, 0, 1,
-2.287246, -0.0497916, -1.189113, 1, 0.1333333, 0, 1,
-2.238647, 0.3409972, -0.8470635, 1, 0.1372549, 0, 1,
-2.230501, 0.8664038, -1.529792, 1, 0.145098, 0, 1,
-2.202076, -0.121361, -2.805317, 1, 0.1490196, 0, 1,
-2.124201, 1.599894, -0.9173139, 1, 0.1568628, 0, 1,
-2.117624, -1.934204, -0.06362694, 1, 0.1607843, 0, 1,
-2.111501, 1.096709, -0.3975835, 1, 0.1686275, 0, 1,
-2.058139, 0.8860136, -1.764872, 1, 0.172549, 0, 1,
-2.050991, 0.01042475, -2.469276, 1, 0.1803922, 0, 1,
-2.027421, -2.017848, -1.649574, 1, 0.1843137, 0, 1,
-2.021158, 1.425406, -0.5025359, 1, 0.1921569, 0, 1,
-2.019254, -0.4661807, -2.282151, 1, 0.1960784, 0, 1,
-2.015505, -0.7799251, -1.001901, 1, 0.2039216, 0, 1,
-1.990762, 0.8332264, -0.7973681, 1, 0.2117647, 0, 1,
-1.987831, 1.8169, -0.8358698, 1, 0.2156863, 0, 1,
-1.962824, -1.985007, -3.163496, 1, 0.2235294, 0, 1,
-1.927593, 1.302567, -0.8142384, 1, 0.227451, 0, 1,
-1.92549, 1.920427, -1.442205, 1, 0.2352941, 0, 1,
-1.921828, -0.9153614, -1.709139, 1, 0.2392157, 0, 1,
-1.908802, -0.6594319, -1.231741, 1, 0.2470588, 0, 1,
-1.897858, -0.7834295, -0.7516673, 1, 0.2509804, 0, 1,
-1.897163, -0.8310907, -2.986812, 1, 0.2588235, 0, 1,
-1.892376, 1.194932, -1.371465, 1, 0.2627451, 0, 1,
-1.877273, 1.61469, 0.4998452, 1, 0.2705882, 0, 1,
-1.870826, 0.8200421, -2.097771, 1, 0.2745098, 0, 1,
-1.870655, 0.6212919, -1.819097, 1, 0.282353, 0, 1,
-1.810895, 1.200291, -0.9494628, 1, 0.2862745, 0, 1,
-1.798329, -1.752206, -1.473835, 1, 0.2941177, 0, 1,
-1.764388, -0.7429118, -0.5501809, 1, 0.3019608, 0, 1,
-1.761005, 1.233557, 0.3626643, 1, 0.3058824, 0, 1,
-1.74767, 0.9148695, -0.9869063, 1, 0.3137255, 0, 1,
-1.743759, -0.06351179, -1.415502, 1, 0.3176471, 0, 1,
-1.717716, 1.340101, -1.96739, 1, 0.3254902, 0, 1,
-1.68652, 1.51276, -1.495094, 1, 0.3294118, 0, 1,
-1.664633, -0.00121832, -0.6572742, 1, 0.3372549, 0, 1,
-1.654974, -0.4331119, -0.4017101, 1, 0.3411765, 0, 1,
-1.652681, -1.041903, -3.837571, 1, 0.3490196, 0, 1,
-1.641938, 0.4915773, -2.122103, 1, 0.3529412, 0, 1,
-1.633869, 0.3965893, -1.40153, 1, 0.3607843, 0, 1,
-1.618226, 0.595611, 0.3142723, 1, 0.3647059, 0, 1,
-1.612307, 0.381491, -0.9087564, 1, 0.372549, 0, 1,
-1.609279, -1.072199, -1.224068, 1, 0.3764706, 0, 1,
-1.608367, 0.04225865, -1.881168, 1, 0.3843137, 0, 1,
-1.570874, -0.6443988, -2.240121, 1, 0.3882353, 0, 1,
-1.561999, 0.3502573, -2.349125, 1, 0.3960784, 0, 1,
-1.550727, 1.054649, -0.2421556, 1, 0.4039216, 0, 1,
-1.547223, -0.827854, -2.781583, 1, 0.4078431, 0, 1,
-1.539373, 0.2403187, -1.431495, 1, 0.4156863, 0, 1,
-1.538573, 1.072969, 0.9424128, 1, 0.4196078, 0, 1,
-1.534781, 0.5257363, -0.5574334, 1, 0.427451, 0, 1,
-1.534111, 0.5798796, -1.694378, 1, 0.4313726, 0, 1,
-1.532999, -0.839378, -2.563921, 1, 0.4392157, 0, 1,
-1.52964, 0.4045157, -2.727104, 1, 0.4431373, 0, 1,
-1.528209, -0.1930091, -1.651049, 1, 0.4509804, 0, 1,
-1.52717, 0.2042364, -2.586976, 1, 0.454902, 0, 1,
-1.526027, -0.1123739, -2.267206, 1, 0.4627451, 0, 1,
-1.522523, -1.555069, -3.265246, 1, 0.4666667, 0, 1,
-1.519694, 2.664637, -2.537869, 1, 0.4745098, 0, 1,
-1.517352, 0.03087509, -1.252984, 1, 0.4784314, 0, 1,
-1.498816, 1.144681, 0.03458733, 1, 0.4862745, 0, 1,
-1.486844, 0.5245581, -2.535153, 1, 0.4901961, 0, 1,
-1.486132, 0.770026, -2.316112, 1, 0.4980392, 0, 1,
-1.481964, 0.3011921, -2.844882, 1, 0.5058824, 0, 1,
-1.477661, 0.8169592, -3.06481, 1, 0.509804, 0, 1,
-1.453665, -0.4969153, -2.38868, 1, 0.5176471, 0, 1,
-1.451921, 1.381586, -0.925886, 1, 0.5215687, 0, 1,
-1.445025, -0.6451955, -1.686674, 1, 0.5294118, 0, 1,
-1.396563, -0.3957955, -0.5190995, 1, 0.5333334, 0, 1,
-1.395555, 0.1063278, -1.149214, 1, 0.5411765, 0, 1,
-1.392572, -0.4353789, -2.705725, 1, 0.5450981, 0, 1,
-1.392433, 0.02305883, -1.407155, 1, 0.5529412, 0, 1,
-1.389269, -0.8296462, -3.663985, 1, 0.5568628, 0, 1,
-1.377557, -0.1060743, -0.378771, 1, 0.5647059, 0, 1,
-1.374278, 1.083846, -0.6645612, 1, 0.5686275, 0, 1,
-1.372475, -0.09957887, -2.748783, 1, 0.5764706, 0, 1,
-1.369725, 1.690016, -0.9853212, 1, 0.5803922, 0, 1,
-1.366104, 1.763228, -1.120738, 1, 0.5882353, 0, 1,
-1.360187, -1.740615, -1.794092, 1, 0.5921569, 0, 1,
-1.351181, -1.526597, -1.175144, 1, 0.6, 0, 1,
-1.350263, -0.3697942, -3.595374, 1, 0.6078432, 0, 1,
-1.332984, -1.455348, -2.408896, 1, 0.6117647, 0, 1,
-1.32236, 1.098952, -1.70689, 1, 0.6196079, 0, 1,
-1.320708, 0.4927226, -1.266815, 1, 0.6235294, 0, 1,
-1.308973, 1.553657, -1.760542, 1, 0.6313726, 0, 1,
-1.308782, -1.043592, -2.574498, 1, 0.6352941, 0, 1,
-1.305365, 0.6766335, -2.220909, 1, 0.6431373, 0, 1,
-1.292967, 0.2800294, -1.586733, 1, 0.6470588, 0, 1,
-1.282409, -0.8961313, -2.752228, 1, 0.654902, 0, 1,
-1.282072, 1.381348, -2.659527, 1, 0.6588235, 0, 1,
-1.276712, -0.03836215, -1.084968, 1, 0.6666667, 0, 1,
-1.268485, -0.508529, -1.986251, 1, 0.6705883, 0, 1,
-1.265686, 1.3855, 0.6182786, 1, 0.6784314, 0, 1,
-1.259323, -0.8378408, -3.341246, 1, 0.682353, 0, 1,
-1.24988, -1.320927, -1.878535, 1, 0.6901961, 0, 1,
-1.243716, -0.05721179, -1.492826, 1, 0.6941177, 0, 1,
-1.234091, -0.01557224, -2.133433, 1, 0.7019608, 0, 1,
-1.233052, -0.06819941, -1.928242, 1, 0.7098039, 0, 1,
-1.231518, -0.2192057, -2.081281, 1, 0.7137255, 0, 1,
-1.225243, -0.8002985, -3.010248, 1, 0.7215686, 0, 1,
-1.22234, 0.4099426, -0.5527644, 1, 0.7254902, 0, 1,
-1.216846, -1.13951, -1.19688, 1, 0.7333333, 0, 1,
-1.215012, -1.231286, -2.316444, 1, 0.7372549, 0, 1,
-1.211083, 1.568046, -0.141172, 1, 0.7450981, 0, 1,
-1.208955, 1.208059, -2.181055, 1, 0.7490196, 0, 1,
-1.203075, -1.024979, -2.409154, 1, 0.7568628, 0, 1,
-1.196265, 0.4830428, -0.06096695, 1, 0.7607843, 0, 1,
-1.194881, -0.5042692, -1.523115, 1, 0.7686275, 0, 1,
-1.194181, 0.3977797, -0.3096091, 1, 0.772549, 0, 1,
-1.193835, -2.002867, -4.554084, 1, 0.7803922, 0, 1,
-1.183989, -1.480187, -3.066325, 1, 0.7843137, 0, 1,
-1.179756, 0.04857948, -3.633408, 1, 0.7921569, 0, 1,
-1.17658, 1.081373, -1.727353, 1, 0.7960784, 0, 1,
-1.172777, 0.5818099, -1.007101, 1, 0.8039216, 0, 1,
-1.165933, -0.302894, -2.703256, 1, 0.8117647, 0, 1,
-1.164823, -0.0745515, -1.119443, 1, 0.8156863, 0, 1,
-1.15687, 2.072382, -1.134411, 1, 0.8235294, 0, 1,
-1.151739, -0.7500189, -3.067129, 1, 0.827451, 0, 1,
-1.151485, -0.4389532, -1.733464, 1, 0.8352941, 0, 1,
-1.144542, 0.1296384, 0.4905654, 1, 0.8392157, 0, 1,
-1.143739, -1.127059, -1.348055, 1, 0.8470588, 0, 1,
-1.140026, 1.280899, -0.6810373, 1, 0.8509804, 0, 1,
-1.136906, -0.1981444, -1.747801, 1, 0.8588235, 0, 1,
-1.135264, -1.982748, -2.919176, 1, 0.8627451, 0, 1,
-1.134545, -0.1761391, -1.483457, 1, 0.8705882, 0, 1,
-1.117703, -0.5816367, -1.815273, 1, 0.8745098, 0, 1,
-1.11583, -1.821085, -4.068102, 1, 0.8823529, 0, 1,
-1.107542, 1.162348, 0.4947269, 1, 0.8862745, 0, 1,
-1.104025, 0.08653885, -0.07029162, 1, 0.8941177, 0, 1,
-1.103349, 0.2940421, -2.161489, 1, 0.8980392, 0, 1,
-1.101952, -2.206475, -2.35196, 1, 0.9058824, 0, 1,
-1.101475, 0.7270474, -1.392789, 1, 0.9137255, 0, 1,
-1.083024, 0.2955762, -2.05415, 1, 0.9176471, 0, 1,
-1.076633, 1.15156, -0.733775, 1, 0.9254902, 0, 1,
-1.074382, 0.5678872, -0.3091343, 1, 0.9294118, 0, 1,
-1.070678, 0.2664416, -1.803551, 1, 0.9372549, 0, 1,
-1.065361, 1.812714, -3.073068, 1, 0.9411765, 0, 1,
-1.065346, 1.274325, -0.6058998, 1, 0.9490196, 0, 1,
-1.063773, 0.9710523, -1.008967, 1, 0.9529412, 0, 1,
-1.058849, 0.9809525, -2.526545, 1, 0.9607843, 0, 1,
-1.056595, 0.2060927, -2.472709, 1, 0.9647059, 0, 1,
-1.044614, 2.386098, -1.604351, 1, 0.972549, 0, 1,
-1.039822, -0.9692068, -2.049055, 1, 0.9764706, 0, 1,
-1.034679, -0.4038614, -1.060778, 1, 0.9843137, 0, 1,
-1.015769, 0.2485183, -0.6187608, 1, 0.9882353, 0, 1,
-1.008718, 0.1640569, -2.313686, 1, 0.9960784, 0, 1,
-1.004028, -0.3646231, -3.003166, 0.9960784, 1, 0, 1,
-1.002124, 0.3853659, -0.6252471, 0.9921569, 1, 0, 1,
-1.000813, 0.728112, -0.6762081, 0.9843137, 1, 0, 1,
-0.9957086, 0.3570548, -1.49098, 0.9803922, 1, 0, 1,
-0.9852815, -0.7511966, -1.787499, 0.972549, 1, 0, 1,
-0.9835925, 0.1699454, 0.06202812, 0.9686275, 1, 0, 1,
-0.9823333, -0.3807212, -2.345237, 0.9607843, 1, 0, 1,
-0.973673, -0.1930135, -2.420295, 0.9568627, 1, 0, 1,
-0.9731621, -0.8018625, -1.490441, 0.9490196, 1, 0, 1,
-0.9717731, 1.2486, -0.8792576, 0.945098, 1, 0, 1,
-0.9704506, -0.3950428, -2.036762, 0.9372549, 1, 0, 1,
-0.9652885, -0.310578, -2.698041, 0.9333333, 1, 0, 1,
-0.9572146, -0.1924721, -1.012321, 0.9254902, 1, 0, 1,
-0.9568323, 0.8842546, 0.1353897, 0.9215686, 1, 0, 1,
-0.9379884, -0.4700714, -0.7819868, 0.9137255, 1, 0, 1,
-0.9377487, 0.9568173, -2.57616, 0.9098039, 1, 0, 1,
-0.9362818, -0.0965374, -1.242472, 0.9019608, 1, 0, 1,
-0.9343891, 0.5436715, -1.470983, 0.8941177, 1, 0, 1,
-0.9318129, 1.637417, -0.2246726, 0.8901961, 1, 0, 1,
-0.9298778, 0.8498031, -0.8872001, 0.8823529, 1, 0, 1,
-0.9273468, 0.1914659, -1.572068, 0.8784314, 1, 0, 1,
-0.920405, 0.3317813, -1.576818, 0.8705882, 1, 0, 1,
-0.9126931, 1.340439, -1.549736, 0.8666667, 1, 0, 1,
-0.9118957, -1.083361, -3.369796, 0.8588235, 1, 0, 1,
-0.909813, 0.6849236, -0.9774834, 0.854902, 1, 0, 1,
-0.8940709, 0.4829265, 0.09679963, 0.8470588, 1, 0, 1,
-0.8937367, 0.6865982, -0.7002491, 0.8431373, 1, 0, 1,
-0.8919595, 0.1854841, -2.572574, 0.8352941, 1, 0, 1,
-0.8889801, -0.07860995, -1.363125, 0.8313726, 1, 0, 1,
-0.8844129, 0.3755953, -2.467978, 0.8235294, 1, 0, 1,
-0.8787505, 0.7834291, -0.6861116, 0.8196079, 1, 0, 1,
-0.8740734, 1.583122, -1.650755, 0.8117647, 1, 0, 1,
-0.8655477, -0.4847486, -0.5549896, 0.8078431, 1, 0, 1,
-0.8543286, -1.168735, -2.404643, 0.8, 1, 0, 1,
-0.8529534, 0.3468379, -0.6147789, 0.7921569, 1, 0, 1,
-0.8521528, 0.4436537, -0.8668602, 0.7882353, 1, 0, 1,
-0.8480649, -0.4085966, -1.499482, 0.7803922, 1, 0, 1,
-0.8477693, -0.07951926, -0.785902, 0.7764706, 1, 0, 1,
-0.8477371, -0.687095, -1.811789, 0.7686275, 1, 0, 1,
-0.8458464, 0.1012617, -1.599991, 0.7647059, 1, 0, 1,
-0.8399825, -2.51443, -3.702666, 0.7568628, 1, 0, 1,
-0.8399176, -0.07478607, -3.614005, 0.7529412, 1, 0, 1,
-0.8365002, -0.9057212, -3.311634, 0.7450981, 1, 0, 1,
-0.8334873, -1.628814, -5.193868, 0.7411765, 1, 0, 1,
-0.833469, -1.682759, -2.058391, 0.7333333, 1, 0, 1,
-0.8315198, 0.04792896, -1.813596, 0.7294118, 1, 0, 1,
-0.8311476, -0.6081361, -1.692311, 0.7215686, 1, 0, 1,
-0.8308693, -0.4778952, -2.014213, 0.7176471, 1, 0, 1,
-0.8264515, 0.1855935, -1.855319, 0.7098039, 1, 0, 1,
-0.825918, -1.162637, -2.67206, 0.7058824, 1, 0, 1,
-0.8252028, -1.858096, -4.031541, 0.6980392, 1, 0, 1,
-0.8248632, 1.627976, -0.6607502, 0.6901961, 1, 0, 1,
-0.8207789, 1.083218, -1.077903, 0.6862745, 1, 0, 1,
-0.8030417, -0.4724035, -1.736734, 0.6784314, 1, 0, 1,
-0.790537, 0.3577953, -0.2628603, 0.6745098, 1, 0, 1,
-0.7890654, -1.692921, -2.999289, 0.6666667, 1, 0, 1,
-0.7860907, -0.2337824, -1.271267, 0.6627451, 1, 0, 1,
-0.7857259, 0.04371518, -0.07645039, 0.654902, 1, 0, 1,
-0.7812771, -0.903658, -1.941189, 0.6509804, 1, 0, 1,
-0.7788047, 0.3469676, -2.942407, 0.6431373, 1, 0, 1,
-0.778666, -1.795521, -3.200856, 0.6392157, 1, 0, 1,
-0.7784146, 0.09315538, -0.5513483, 0.6313726, 1, 0, 1,
-0.7748015, -0.8476399, -2.436639, 0.627451, 1, 0, 1,
-0.7742152, 0.3159705, -1.432806, 0.6196079, 1, 0, 1,
-0.7690687, 0.2319563, -1.281668, 0.6156863, 1, 0, 1,
-0.7641061, 0.5415216, -0.524407, 0.6078432, 1, 0, 1,
-0.7592492, -0.1793066, 0.6453503, 0.6039216, 1, 0, 1,
-0.7572574, 0.7738963, 0.4269516, 0.5960785, 1, 0, 1,
-0.7565485, -0.5361165, -2.396725, 0.5882353, 1, 0, 1,
-0.7535008, 0.5773386, 0.1756534, 0.5843138, 1, 0, 1,
-0.7520739, 0.4065445, 0.5595967, 0.5764706, 1, 0, 1,
-0.7408646, 0.200127, -2.826294, 0.572549, 1, 0, 1,
-0.7397038, 0.7883899, -0.95367, 0.5647059, 1, 0, 1,
-0.7379508, -0.04983725, -1.691744, 0.5607843, 1, 0, 1,
-0.7343337, -0.170909, -0.5429276, 0.5529412, 1, 0, 1,
-0.7341316, 1.118011, -0.9374638, 0.5490196, 1, 0, 1,
-0.7322069, 0.109326, -1.874931, 0.5411765, 1, 0, 1,
-0.7292433, -0.9207737, -0.7986189, 0.5372549, 1, 0, 1,
-0.7257511, 0.3935469, -1.424208, 0.5294118, 1, 0, 1,
-0.720475, -0.8551254, -2.373723, 0.5254902, 1, 0, 1,
-0.7177389, 0.1256568, -0.1513703, 0.5176471, 1, 0, 1,
-0.7143537, 0.5444182, -1.67081, 0.5137255, 1, 0, 1,
-0.711257, 0.6598965, -0.757163, 0.5058824, 1, 0, 1,
-0.710837, 0.210365, -1.705949, 0.5019608, 1, 0, 1,
-0.7107892, -0.7889819, -0.8178326, 0.4941176, 1, 0, 1,
-0.6891826, -0.4771136, -2.803998, 0.4862745, 1, 0, 1,
-0.6852111, -0.1640262, -2.857397, 0.4823529, 1, 0, 1,
-0.6848685, 0.7900797, -1.707679, 0.4745098, 1, 0, 1,
-0.6837031, -1.128448, -2.786778, 0.4705882, 1, 0, 1,
-0.6825463, -0.01238887, -0.9322922, 0.4627451, 1, 0, 1,
-0.6806871, -0.6432053, -3.017141, 0.4588235, 1, 0, 1,
-0.6792549, -1.754425, -4.925348, 0.4509804, 1, 0, 1,
-0.6765464, 0.3211856, -2.990804, 0.4470588, 1, 0, 1,
-0.6688576, 0.3256087, -1.233302, 0.4392157, 1, 0, 1,
-0.6671242, 0.5956876, -1.023242, 0.4352941, 1, 0, 1,
-0.6669319, 0.907812, -0.2188068, 0.427451, 1, 0, 1,
-0.6647546, -1.409193, -3.609631, 0.4235294, 1, 0, 1,
-0.6635991, -1.806564, -3.138047, 0.4156863, 1, 0, 1,
-0.6603528, -0.4544598, -1.679077, 0.4117647, 1, 0, 1,
-0.6586169, 0.02845773, -0.0144107, 0.4039216, 1, 0, 1,
-0.6526888, -0.1701789, -1.306527, 0.3960784, 1, 0, 1,
-0.645826, 0.8479903, -1.108595, 0.3921569, 1, 0, 1,
-0.6426814, 0.09114435, -1.808, 0.3843137, 1, 0, 1,
-0.6411816, 1.60746, -1.144496, 0.3803922, 1, 0, 1,
-0.6390485, 0.1062294, -1.977776, 0.372549, 1, 0, 1,
-0.638384, -1.152702, -1.149442, 0.3686275, 1, 0, 1,
-0.6381549, 0.5073554, -1.747052, 0.3607843, 1, 0, 1,
-0.6255714, -0.002796011, -1.026263, 0.3568628, 1, 0, 1,
-0.62257, 1.081904, -0.2530703, 0.3490196, 1, 0, 1,
-0.6215585, 0.9651166, -0.940227, 0.345098, 1, 0, 1,
-0.6211626, -0.5185133, -1.521827, 0.3372549, 1, 0, 1,
-0.6192691, -0.1134161, -0.9767014, 0.3333333, 1, 0, 1,
-0.6141796, 0.03292544, -1.339354, 0.3254902, 1, 0, 1,
-0.6138549, 1.480985, -0.3413685, 0.3215686, 1, 0, 1,
-0.598815, 0.3659143, -1.808781, 0.3137255, 1, 0, 1,
-0.5968305, 0.7909191, 0.5253041, 0.3098039, 1, 0, 1,
-0.5960417, -0.4570127, -0.6530991, 0.3019608, 1, 0, 1,
-0.5944848, 0.5115303, 0.6100992, 0.2941177, 1, 0, 1,
-0.5938596, -0.1713545, -2.285311, 0.2901961, 1, 0, 1,
-0.5910985, -0.04191508, -1.573347, 0.282353, 1, 0, 1,
-0.5908662, 0.8247183, -1.07367, 0.2784314, 1, 0, 1,
-0.5878335, -0.9527001, -3.953682, 0.2705882, 1, 0, 1,
-0.5864958, 0.003780807, -0.3101259, 0.2666667, 1, 0, 1,
-0.5821124, -0.2823705, -2.761205, 0.2588235, 1, 0, 1,
-0.5742792, 0.5300792, 0.1312391, 0.254902, 1, 0, 1,
-0.5740615, -0.8736234, -1.891325, 0.2470588, 1, 0, 1,
-0.5739397, 1.3382, -0.6867302, 0.2431373, 1, 0, 1,
-0.5703641, -0.7691608, -3.234521, 0.2352941, 1, 0, 1,
-0.5660197, 0.6167539, -0.5086541, 0.2313726, 1, 0, 1,
-0.55878, 1.805882, -0.77575, 0.2235294, 1, 0, 1,
-0.5542529, -0.5745316, -2.13854, 0.2196078, 1, 0, 1,
-0.5522158, 1.385099, 0.02047324, 0.2117647, 1, 0, 1,
-0.5516711, 0.2127363, -2.735095, 0.2078431, 1, 0, 1,
-0.5513537, 0.5686001, -0.2137034, 0.2, 1, 0, 1,
-0.5512848, -0.3101369, -0.9815482, 0.1921569, 1, 0, 1,
-0.5487767, -0.2074584, -2.274029, 0.1882353, 1, 0, 1,
-0.5461565, -0.2742688, 0.1306153, 0.1803922, 1, 0, 1,
-0.5429474, 0.5680441, -0.6864342, 0.1764706, 1, 0, 1,
-0.5417514, -0.04980786, -1.64412, 0.1686275, 1, 0, 1,
-0.530854, -0.9656192, -3.538366, 0.1647059, 1, 0, 1,
-0.5293829, -0.06832881, -1.1282, 0.1568628, 1, 0, 1,
-0.5275297, -0.8497543, -1.998744, 0.1529412, 1, 0, 1,
-0.5272014, 1.065393, -1.804509, 0.145098, 1, 0, 1,
-0.5229889, 0.8031553, 0.6616945, 0.1411765, 1, 0, 1,
-0.5228244, -0.1034154, -1.277839, 0.1333333, 1, 0, 1,
-0.5223829, 0.09905278, -2.066307, 0.1294118, 1, 0, 1,
-0.5223809, 0.9322877, -3.201435, 0.1215686, 1, 0, 1,
-0.509143, 0.8816682, 0.565508, 0.1176471, 1, 0, 1,
-0.504986, -0.06113042, -0.5555739, 0.1098039, 1, 0, 1,
-0.5034619, -1.865143, -3.891832, 0.1058824, 1, 0, 1,
-0.4989585, 0.6285754, -1.478797, 0.09803922, 1, 0, 1,
-0.4985122, 0.7595391, 0.8238201, 0.09019608, 1, 0, 1,
-0.4913657, 1.287811, -1.865822, 0.08627451, 1, 0, 1,
-0.4896077, -0.1866734, -0.915533, 0.07843138, 1, 0, 1,
-0.4890473, -1.176406, -3.659385, 0.07450981, 1, 0, 1,
-0.4849969, 1.2855, -0.03205618, 0.06666667, 1, 0, 1,
-0.4831004, -0.1884329, -2.251876, 0.0627451, 1, 0, 1,
-0.4786483, -0.710193, -1.5782, 0.05490196, 1, 0, 1,
-0.4785445, 0.6552914, -0.3530793, 0.05098039, 1, 0, 1,
-0.4775308, 0.2351847, -0.9592537, 0.04313726, 1, 0, 1,
-0.4748987, 0.7551682, -0.4939223, 0.03921569, 1, 0, 1,
-0.474392, -0.005786589, -1.229168, 0.03137255, 1, 0, 1,
-0.4735213, 1.740835, 1.07031, 0.02745098, 1, 0, 1,
-0.4697056, 1.528825, -1.837258, 0.01960784, 1, 0, 1,
-0.4651982, 0.9802119, -1.429921, 0.01568628, 1, 0, 1,
-0.4586172, 0.08616336, -1.262202, 0.007843138, 1, 0, 1,
-0.4579613, -1.100296, -2.312087, 0.003921569, 1, 0, 1,
-0.4565037, -0.6863235, -2.920255, 0, 1, 0.003921569, 1,
-0.4557887, -0.187514, -0.2400561, 0, 1, 0.01176471, 1,
-0.4479515, 0.6613762, 0.0357024, 0, 1, 0.01568628, 1,
-0.4421366, -2.050927, -3.17978, 0, 1, 0.02352941, 1,
-0.4419053, 0.6578894, -1.773765, 0, 1, 0.02745098, 1,
-0.4363085, 0.826306, 0.6786349, 0, 1, 0.03529412, 1,
-0.4356914, -0.6128169, -1.391077, 0, 1, 0.03921569, 1,
-0.4344097, 0.348095, -1.862717, 0, 1, 0.04705882, 1,
-0.4320009, 0.9270934, -0.2524044, 0, 1, 0.05098039, 1,
-0.4307016, 0.505361, -2.472046, 0, 1, 0.05882353, 1,
-0.4296147, -0.5869853, -1.200801, 0, 1, 0.0627451, 1,
-0.4285282, 0.3523912, -1.544014, 0, 1, 0.07058824, 1,
-0.4282576, -0.1310554, -1.157869, 0, 1, 0.07450981, 1,
-0.4255684, 1.228088, -1.420773, 0, 1, 0.08235294, 1,
-0.424928, 0.6961935, -0.1242345, 0, 1, 0.08627451, 1,
-0.4228568, 0.8121103, -0.7444564, 0, 1, 0.09411765, 1,
-0.4177261, 0.1039397, -1.361825, 0, 1, 0.1019608, 1,
-0.4170042, 1.358189, -1.003636, 0, 1, 0.1058824, 1,
-0.4148792, 0.1215133, -1.818421, 0, 1, 0.1137255, 1,
-0.4068559, 1.032709, -1.937824, 0, 1, 0.1176471, 1,
-0.4055955, 1.317189, 0.5880433, 0, 1, 0.1254902, 1,
-0.4015801, 0.261578, -0.224765, 0, 1, 0.1294118, 1,
-0.4001831, 2.94024, 1.281429, 0, 1, 0.1372549, 1,
-0.3990402, 0.9176518, -0.3154129, 0, 1, 0.1411765, 1,
-0.3977329, 0.07075585, -1.937161, 0, 1, 0.1490196, 1,
-0.3977309, -1.940869, -3.494704, 0, 1, 0.1529412, 1,
-0.3954801, -0.113706, -1.778632, 0, 1, 0.1607843, 1,
-0.3953493, -0.9628541, -2.072323, 0, 1, 0.1647059, 1,
-0.3945131, 1.829543, -1.359181, 0, 1, 0.172549, 1,
-0.3935885, -0.7186872, -1.798782, 0, 1, 0.1764706, 1,
-0.3848888, 1.093948, -0.8335795, 0, 1, 0.1843137, 1,
-0.3813743, 2.594398, -1.535965, 0, 1, 0.1882353, 1,
-0.3810612, 0.01961697, -1.490458, 0, 1, 0.1960784, 1,
-0.3793558, -1.800527, -2.437688, 0, 1, 0.2039216, 1,
-0.3661976, -0.6763042, -1.900982, 0, 1, 0.2078431, 1,
-0.3611639, -0.5832348, -3.356852, 0, 1, 0.2156863, 1,
-0.3569956, -1.287777, -1.967376, 0, 1, 0.2196078, 1,
-0.3548179, 0.8138896, -0.1466524, 0, 1, 0.227451, 1,
-0.3541762, -0.6853611, -3.697032, 0, 1, 0.2313726, 1,
-0.3520493, 0.03147532, -1.455435, 0, 1, 0.2392157, 1,
-0.3520084, 0.1968968, -0.2546894, 0, 1, 0.2431373, 1,
-0.3413836, -0.08029228, -2.094378, 0, 1, 0.2509804, 1,
-0.3364711, -1.719669, -3.403508, 0, 1, 0.254902, 1,
-0.3359886, 0.6562724, 1.442641, 0, 1, 0.2627451, 1,
-0.3357869, -1.136995, -3.377463, 0, 1, 0.2666667, 1,
-0.3299978, -0.9112505, -1.43962, 0, 1, 0.2745098, 1,
-0.3290201, 1.737824, -0.04862148, 0, 1, 0.2784314, 1,
-0.3280862, -0.6152921, -2.277444, 0, 1, 0.2862745, 1,
-0.3260514, -1.0426, -3.556207, 0, 1, 0.2901961, 1,
-0.3246965, 0.6219858, -0.4642772, 0, 1, 0.2980392, 1,
-0.3243946, 0.1338247, -1.102674, 0, 1, 0.3058824, 1,
-0.3200541, -0.7935777, -4.538128, 0, 1, 0.3098039, 1,
-0.3186651, 0.8098803, -1.442563, 0, 1, 0.3176471, 1,
-0.3124057, 1.467499, 0.7492855, 0, 1, 0.3215686, 1,
-0.3081307, 0.313401, -2.409457, 0, 1, 0.3294118, 1,
-0.3077304, 0.1671566, 0.6617082, 0, 1, 0.3333333, 1,
-0.306986, 0.422553, -2.120417, 0, 1, 0.3411765, 1,
-0.3063471, 1.908687, -0.4626102, 0, 1, 0.345098, 1,
-0.305125, 1.423406, 0.8578256, 0, 1, 0.3529412, 1,
-0.304627, 0.6183495, 0.05462476, 0, 1, 0.3568628, 1,
-0.3035631, -0.7901486, -3.901249, 0, 1, 0.3647059, 1,
-0.302155, 0.1120612, -1.999464, 0, 1, 0.3686275, 1,
-0.301743, 0.1482823, -3.12227, 0, 1, 0.3764706, 1,
-0.2972396, -0.8127304, -1.095803, 0, 1, 0.3803922, 1,
-0.2961129, -0.6482261, -4.414114, 0, 1, 0.3882353, 1,
-0.2944717, 0.3567784, -0.2019577, 0, 1, 0.3921569, 1,
-0.2888789, 0.2569752, -1.786569, 0, 1, 0.4, 1,
-0.2872329, -0.3248089, -3.685894, 0, 1, 0.4078431, 1,
-0.2839768, 0.7731842, 0.7639129, 0, 1, 0.4117647, 1,
-0.2756747, -0.009479734, -1.943336, 0, 1, 0.4196078, 1,
-0.2745351, -0.6431502, -2.927215, 0, 1, 0.4235294, 1,
-0.2743706, 2.142158, -0.2218819, 0, 1, 0.4313726, 1,
-0.2728002, -0.0658519, -0.4523736, 0, 1, 0.4352941, 1,
-0.2658332, -0.08806384, -1.498715, 0, 1, 0.4431373, 1,
-0.262285, 0.6470042, -0.530053, 0, 1, 0.4470588, 1,
-0.2617223, -1.066337, -2.421315, 0, 1, 0.454902, 1,
-0.2598068, 0.2786935, -1.939862, 0, 1, 0.4588235, 1,
-0.2571502, -0.9600013, -4.483339, 0, 1, 0.4666667, 1,
-0.2560948, 1.53813, -1.129926, 0, 1, 0.4705882, 1,
-0.2530687, 0.5099027, -1.373196, 0, 1, 0.4784314, 1,
-0.2502493, 0.07239761, 0.6387241, 0, 1, 0.4823529, 1,
-0.2482767, 0.765627, -1.508504, 0, 1, 0.4901961, 1,
-0.2467462, 0.01470025, -2.215893, 0, 1, 0.4941176, 1,
-0.244031, 0.1638663, -0.9311364, 0, 1, 0.5019608, 1,
-0.2410042, -0.4448424, -3.536352, 0, 1, 0.509804, 1,
-0.2390377, 0.1995821, -2.237768, 0, 1, 0.5137255, 1,
-0.2340749, 0.5156867, 1.793383, 0, 1, 0.5215687, 1,
-0.2315391, -0.8886554, -3.541512, 0, 1, 0.5254902, 1,
-0.2278203, 0.1178143, -0.3605715, 0, 1, 0.5333334, 1,
-0.224213, -1.050925, -3.789445, 0, 1, 0.5372549, 1,
-0.2199475, -0.1817991, -1.970276, 0, 1, 0.5450981, 1,
-0.2191662, 0.4672628, -0.04815439, 0, 1, 0.5490196, 1,
-0.2122925, 0.4322564, -0.4031262, 0, 1, 0.5568628, 1,
-0.2064383, 0.4240704, -0.1886369, 0, 1, 0.5607843, 1,
-0.2058584, 0.9365339, 1.525918, 0, 1, 0.5686275, 1,
-0.2049181, -2.258962, -4.147576, 0, 1, 0.572549, 1,
-0.2010895, 0.4360733, -1.314489, 0, 1, 0.5803922, 1,
-0.1938942, 1.234141, 3.284698, 0, 1, 0.5843138, 1,
-0.1927814, 0.6738384, 0.7212483, 0, 1, 0.5921569, 1,
-0.1923313, -1.207012, -5.100647, 0, 1, 0.5960785, 1,
-0.1888029, 1.227959, -1.001064, 0, 1, 0.6039216, 1,
-0.1867523, 1.407955, -1.187685, 0, 1, 0.6117647, 1,
-0.1740482, -0.9162839, -5.636889, 0, 1, 0.6156863, 1,
-0.1718381, 0.1620992, -1.533738, 0, 1, 0.6235294, 1,
-0.1701112, 0.3506756, -1.566535, 0, 1, 0.627451, 1,
-0.1691738, 1.496649, -0.8679273, 0, 1, 0.6352941, 1,
-0.1691724, 1.396932, 1.682818, 0, 1, 0.6392157, 1,
-0.1673399, -0.7959851, -3.629593, 0, 1, 0.6470588, 1,
-0.1652584, 0.785305, -0.2575254, 0, 1, 0.6509804, 1,
-0.1611601, -0.02759833, -0.3778116, 0, 1, 0.6588235, 1,
-0.1567695, -0.400975, -2.467389, 0, 1, 0.6627451, 1,
-0.1547201, 1.663876, -1.503012, 0, 1, 0.6705883, 1,
-0.1536522, -0.4340565, -3.05445, 0, 1, 0.6745098, 1,
-0.1532456, -0.2017252, -4.296706, 0, 1, 0.682353, 1,
-0.1486544, 0.842095, -0.4390709, 0, 1, 0.6862745, 1,
-0.1467141, -0.2851651, -1.639447, 0, 1, 0.6941177, 1,
-0.1430236, -2.206355, -4.034714, 0, 1, 0.7019608, 1,
-0.1389749, -0.1998633, -2.68185, 0, 1, 0.7058824, 1,
-0.138011, -1.005347, -2.004111, 0, 1, 0.7137255, 1,
-0.1331608, -0.02872501, -0.06039979, 0, 1, 0.7176471, 1,
-0.132733, -0.4317643, -1.68165, 0, 1, 0.7254902, 1,
-0.1319645, -0.5199717, -2.103219, 0, 1, 0.7294118, 1,
-0.1310074, -0.1306419, -4.114486, 0, 1, 0.7372549, 1,
-0.1148192, -0.8858842, -4.813461, 0, 1, 0.7411765, 1,
-0.1127579, -0.4005329, -4.762607, 0, 1, 0.7490196, 1,
-0.1115198, 0.1372386, -0.7346365, 0, 1, 0.7529412, 1,
-0.1106668, -1.741929, -2.560663, 0, 1, 0.7607843, 1,
-0.1091601, 0.1736706, 0.4969631, 0, 1, 0.7647059, 1,
-0.1053988, 0.2490975, -0.4282706, 0, 1, 0.772549, 1,
-0.1031432, -1.284787, -1.192605, 0, 1, 0.7764706, 1,
-0.1016747, 0.2517977, -2.620221, 0, 1, 0.7843137, 1,
-0.1002416, -1.853103, -1.592718, 0, 1, 0.7882353, 1,
-0.0987925, -1.372916, -0.6500283, 0, 1, 0.7960784, 1,
-0.0987279, 1.036332, -0.2586976, 0, 1, 0.8039216, 1,
-0.0958425, -0.9115101, -2.876167, 0, 1, 0.8078431, 1,
-0.09185962, 0.2089661, -0.1050973, 0, 1, 0.8156863, 1,
-0.09022057, 0.4735987, 1.447022, 0, 1, 0.8196079, 1,
-0.08915119, -0.5294001, -2.109717, 0, 1, 0.827451, 1,
-0.08767463, 0.8670157, -0.6448272, 0, 1, 0.8313726, 1,
-0.08630604, -0.9658028, -1.545341, 0, 1, 0.8392157, 1,
-0.08614348, -1.339188, -4.153502, 0, 1, 0.8431373, 1,
-0.08084008, 1.261361, -0.7939555, 0, 1, 0.8509804, 1,
-0.07902839, -1.964958, -2.545498, 0, 1, 0.854902, 1,
-0.07863288, -0.2212706, -2.295635, 0, 1, 0.8627451, 1,
-0.07802485, -0.9362414, -2.51264, 0, 1, 0.8666667, 1,
-0.07773939, -0.3467549, -2.910564, 0, 1, 0.8745098, 1,
-0.07708807, 1.108384, -0.3994249, 0, 1, 0.8784314, 1,
-0.07600882, 0.7326879, -1.815832, 0, 1, 0.8862745, 1,
-0.0661111, 1.169788, -0.646529, 0, 1, 0.8901961, 1,
-0.06561604, 0.8231205, 0.0802926, 0, 1, 0.8980392, 1,
-0.06395993, -0.909237, -3.665401, 0, 1, 0.9058824, 1,
-0.06266654, -0.5123461, -4.026442, 0, 1, 0.9098039, 1,
-0.05380465, 0.0976292, -0.1276099, 0, 1, 0.9176471, 1,
-0.05302472, 0.6111825, 0.5498354, 0, 1, 0.9215686, 1,
-0.05238904, 0.7094238, 1.609892, 0, 1, 0.9294118, 1,
-0.04896623, 0.8971153, 0.555068, 0, 1, 0.9333333, 1,
-0.04181757, -0.08186461, -2.527732, 0, 1, 0.9411765, 1,
-0.03818318, 0.4072953, -0.8879634, 0, 1, 0.945098, 1,
-0.035557, -0.5322304, -1.710359, 0, 1, 0.9529412, 1,
-0.03234055, -0.3068666, -2.750466, 0, 1, 0.9568627, 1,
-0.03190318, -0.550239, -2.879024, 0, 1, 0.9647059, 1,
-0.02729354, 0.7609875, -0.1958268, 0, 1, 0.9686275, 1,
-0.02484808, 1.046295, 1.275459, 0, 1, 0.9764706, 1,
-0.02335003, 0.9667835, 0.379269, 0, 1, 0.9803922, 1,
-0.02176977, -1.154179, -3.362995, 0, 1, 0.9882353, 1,
-0.01868677, 2.200941, -0.4979114, 0, 1, 0.9921569, 1,
-0.01682739, 1.152025, 0.5406287, 0, 1, 1, 1,
-0.01589816, 0.07006895, -0.04987222, 0, 0.9921569, 1, 1,
-0.01380065, 0.7827065, 1.636861, 0, 0.9882353, 1, 1,
-0.0054559, 0.2479522, 0.6192814, 0, 0.9803922, 1, 1,
-0.003942263, 0.4965466, 1.094965, 0, 0.9764706, 1, 1,
-0.0004637315, 0.04250222, -1.34455, 0, 0.9686275, 1, 1,
0.001862668, 0.6753591, 0.137576, 0, 0.9647059, 1, 1,
0.003815671, 0.6801629, 1.55925, 0, 0.9568627, 1, 1,
0.007072258, -0.6515296, 2.667711, 0, 0.9529412, 1, 1,
0.009734617, -0.1312327, 4.574813, 0, 0.945098, 1, 1,
0.01037622, -0.2717921, 3.099185, 0, 0.9411765, 1, 1,
0.01051094, -0.4493394, 3.029331, 0, 0.9333333, 1, 1,
0.01293336, -0.6412933, 4.862793, 0, 0.9294118, 1, 1,
0.01493221, -3.36175, 4.100883, 0, 0.9215686, 1, 1,
0.02099486, -0.8167105, 2.642232, 0, 0.9176471, 1, 1,
0.02480279, -0.1634677, 2.308336, 0, 0.9098039, 1, 1,
0.0269619, -1.008436, 3.249746, 0, 0.9058824, 1, 1,
0.02809334, -0.2668136, 3.576638, 0, 0.8980392, 1, 1,
0.02937146, 0.9387644, 0.2403034, 0, 0.8901961, 1, 1,
0.03072257, -0.3329894, 3.889799, 0, 0.8862745, 1, 1,
0.0320381, -1.545742, 5.065804, 0, 0.8784314, 1, 1,
0.03457972, 0.33442, 0.9663944, 0, 0.8745098, 1, 1,
0.03459943, 0.3847026, -0.3668027, 0, 0.8666667, 1, 1,
0.03480792, -0.8683019, 3.881113, 0, 0.8627451, 1, 1,
0.03642255, 0.4512542, 0.5355659, 0, 0.854902, 1, 1,
0.03902074, -0.7724229, 3.077284, 0, 0.8509804, 1, 1,
0.04267681, 0.7903495, 1.131546, 0, 0.8431373, 1, 1,
0.04892059, 0.7279107, 0.7229518, 0, 0.8392157, 1, 1,
0.04927419, -1.655165, 4.288554, 0, 0.8313726, 1, 1,
0.05258157, -0.9759719, 3.770421, 0, 0.827451, 1, 1,
0.05946311, -1.353142, 3.887204, 0, 0.8196079, 1, 1,
0.06541248, -0.5363203, 4.970393, 0, 0.8156863, 1, 1,
0.06612024, 0.05397633, 1.072473, 0, 0.8078431, 1, 1,
0.06775995, 1.057047, -0.4756876, 0, 0.8039216, 1, 1,
0.07090403, -0.4116686, 5.533654, 0, 0.7960784, 1, 1,
0.07179348, 1.429782, -0.507317, 0, 0.7882353, 1, 1,
0.07383731, -2.086782, 2.633488, 0, 0.7843137, 1, 1,
0.07408862, -0.01107399, 2.142696, 0, 0.7764706, 1, 1,
0.07477538, -0.1388195, 1.743263, 0, 0.772549, 1, 1,
0.07778118, -0.3192902, 2.32353, 0, 0.7647059, 1, 1,
0.08277646, -1.217427, 3.106638, 0, 0.7607843, 1, 1,
0.08614224, -1.55746, 2.903942, 0, 0.7529412, 1, 1,
0.08790447, 0.4857848, -0.948888, 0, 0.7490196, 1, 1,
0.08914353, 1.287883, -0.9200587, 0, 0.7411765, 1, 1,
0.09258697, -0.681564, 1.719033, 0, 0.7372549, 1, 1,
0.0932244, 2.567251, 0.6476643, 0, 0.7294118, 1, 1,
0.09422493, -0.8086024, 1.175652, 0, 0.7254902, 1, 1,
0.0946738, 0.8121893, -2.239691, 0, 0.7176471, 1, 1,
0.09574535, 0.02247153, 1.598157, 0, 0.7137255, 1, 1,
0.09772248, -0.2278302, 2.407492, 0, 0.7058824, 1, 1,
0.1008075, -1.415617, 1.347398, 0, 0.6980392, 1, 1,
0.1030367, -0.8760862, 1.747149, 0, 0.6941177, 1, 1,
0.1043352, 0.1594034, -0.6441442, 0, 0.6862745, 1, 1,
0.112051, -1.159574, 4.245654, 0, 0.682353, 1, 1,
0.1141412, -1.110427, 1.573623, 0, 0.6745098, 1, 1,
0.1141972, 0.4938035, 1.247498, 0, 0.6705883, 1, 1,
0.1147412, -1.437659, 3.858222, 0, 0.6627451, 1, 1,
0.1151521, -1.410731, 2.762891, 0, 0.6588235, 1, 1,
0.1182253, 0.431308, -0.1300535, 0, 0.6509804, 1, 1,
0.1184952, 0.7820849, 0.6375729, 0, 0.6470588, 1, 1,
0.1236501, -0.6261484, 0.9452782, 0, 0.6392157, 1, 1,
0.1265078, 0.5182236, 0.514797, 0, 0.6352941, 1, 1,
0.1293118, 0.9114833, -0.2910724, 0, 0.627451, 1, 1,
0.1333244, -0.06370576, 3.082887, 0, 0.6235294, 1, 1,
0.1407601, -2.489848, 3.770339, 0, 0.6156863, 1, 1,
0.1419308, -0.4918187, 3.279203, 0, 0.6117647, 1, 1,
0.1424069, 0.3502558, -0.7206529, 0, 0.6039216, 1, 1,
0.1431048, 2.216606, -2.805886, 0, 0.5960785, 1, 1,
0.1444505, 0.3193893, 0.1003447, 0, 0.5921569, 1, 1,
0.1450623, -0.2750576, 3.573514, 0, 0.5843138, 1, 1,
0.1458319, -1.656306, 1.996162, 0, 0.5803922, 1, 1,
0.1479159, -1.917191, 2.622812, 0, 0.572549, 1, 1,
0.1523527, -0.8282439, 2.525425, 0, 0.5686275, 1, 1,
0.1533066, -0.09175715, 0.3837434, 0, 0.5607843, 1, 1,
0.1548933, -0.1757824, 1.740256, 0, 0.5568628, 1, 1,
0.155145, -0.7154925, 2.878192, 0, 0.5490196, 1, 1,
0.1554932, 1.381708, -0.01741734, 0, 0.5450981, 1, 1,
0.1581259, 0.5390572, 1.264923, 0, 0.5372549, 1, 1,
0.1601296, 1.079715, -1.477979, 0, 0.5333334, 1, 1,
0.1611847, 2.762357, 1.494492, 0, 0.5254902, 1, 1,
0.1663094, -0.6792993, 2.158328, 0, 0.5215687, 1, 1,
0.1663945, -0.8680368, 2.283156, 0, 0.5137255, 1, 1,
0.1683734, -0.120992, 1.842325, 0, 0.509804, 1, 1,
0.1698743, -0.1854635, 2.504558, 0, 0.5019608, 1, 1,
0.1721072, 0.3664529, 1.160248, 0, 0.4941176, 1, 1,
0.1767134, 1.331211, 2.03906, 0, 0.4901961, 1, 1,
0.1831059, 0.0642295, 1.573889, 0, 0.4823529, 1, 1,
0.1840336, -0.6387905, 2.522721, 0, 0.4784314, 1, 1,
0.1843733, 0.6050381, -0.356865, 0, 0.4705882, 1, 1,
0.1912243, 0.7877719, -2.371825, 0, 0.4666667, 1, 1,
0.1920986, -1.719111, 3.484554, 0, 0.4588235, 1, 1,
0.1931318, -0.6514831, 2.355913, 0, 0.454902, 1, 1,
0.1942585, 0.5254941, -1.226522, 0, 0.4470588, 1, 1,
0.1944199, -0.5466818, 1.550651, 0, 0.4431373, 1, 1,
0.1956278, 0.8927637, -2.024306, 0, 0.4352941, 1, 1,
0.1968684, -0.1099117, 1.900813, 0, 0.4313726, 1, 1,
0.1978648, -0.2495558, -0.1176145, 0, 0.4235294, 1, 1,
0.1982248, -1.195568, 2.791686, 0, 0.4196078, 1, 1,
0.1983095, -1.336738, 3.523583, 0, 0.4117647, 1, 1,
0.2026112, 1.301167, -1.127084, 0, 0.4078431, 1, 1,
0.2044942, -1.322967, 2.684639, 0, 0.4, 1, 1,
0.2108038, -0.8063722, 2.517998, 0, 0.3921569, 1, 1,
0.2135037, -0.5573884, 1.870545, 0, 0.3882353, 1, 1,
0.2150533, -0.7141998, 2.404037, 0, 0.3803922, 1, 1,
0.2152588, 0.6001829, 0.1203322, 0, 0.3764706, 1, 1,
0.218748, 0.8636696, -0.2981302, 0, 0.3686275, 1, 1,
0.2210205, -0.063715, 0.9904608, 0, 0.3647059, 1, 1,
0.2248156, 0.282121, 0.9504318, 0, 0.3568628, 1, 1,
0.2283016, 0.1142105, 0.7110816, 0, 0.3529412, 1, 1,
0.2301772, 0.7363281, 0.3780469, 0, 0.345098, 1, 1,
0.2308584, -0.2285722, 3.284325, 0, 0.3411765, 1, 1,
0.2322121, 0.5138249, -0.505099, 0, 0.3333333, 1, 1,
0.2327733, 2.266019, 0.2048342, 0, 0.3294118, 1, 1,
0.2329464, -0.7862793, 2.94065, 0, 0.3215686, 1, 1,
0.2332881, -0.2959609, 2.804528, 0, 0.3176471, 1, 1,
0.2346746, -0.9757992, 3.712285, 0, 0.3098039, 1, 1,
0.2360395, -0.700809, 2.688553, 0, 0.3058824, 1, 1,
0.2407382, -0.5988291, 1.581921, 0, 0.2980392, 1, 1,
0.2433403, 0.07366862, 3.573807, 0, 0.2901961, 1, 1,
0.2434554, -0.7782654, 2.899686, 0, 0.2862745, 1, 1,
0.2454319, -0.6349089, 4.644142, 0, 0.2784314, 1, 1,
0.2511837, 0.3745407, 1.520396, 0, 0.2745098, 1, 1,
0.2516855, 0.6657531, 1.896116, 0, 0.2666667, 1, 1,
0.2520601, 0.1786684, 2.082192, 0, 0.2627451, 1, 1,
0.2537305, -1.642964, 3.34574, 0, 0.254902, 1, 1,
0.2538626, 0.7616533, 2.468275, 0, 0.2509804, 1, 1,
0.2550113, 0.5356013, 0.153513, 0, 0.2431373, 1, 1,
0.260724, 0.3553824, 1.041831, 0, 0.2392157, 1, 1,
0.2617138, 1.869115, 0.4535742, 0, 0.2313726, 1, 1,
0.2640487, 0.3974036, 1.189246, 0, 0.227451, 1, 1,
0.265834, 0.6629185, 0.3941555, 0, 0.2196078, 1, 1,
0.2729339, -0.1492192, 1.53209, 0, 0.2156863, 1, 1,
0.2735825, 1.929612, 1.103984, 0, 0.2078431, 1, 1,
0.2804965, -0.2262951, 1.822161, 0, 0.2039216, 1, 1,
0.2818191, -0.4907305, 1.553268, 0, 0.1960784, 1, 1,
0.2856837, -1.200588, 3.598722, 0, 0.1882353, 1, 1,
0.2887098, 1.95196, 1.928291, 0, 0.1843137, 1, 1,
0.2901289, -0.6977602, 4.053059, 0, 0.1764706, 1, 1,
0.2911119, 0.732631, 2.015082, 0, 0.172549, 1, 1,
0.2917468, -0.5645822, 3.37376, 0, 0.1647059, 1, 1,
0.2940173, 0.7979711, -1.367194, 0, 0.1607843, 1, 1,
0.2940843, -0.1754315, 1.696418, 0, 0.1529412, 1, 1,
0.2962139, 0.9116023, -0.3350302, 0, 0.1490196, 1, 1,
0.2963066, -1.341189, 2.554879, 0, 0.1411765, 1, 1,
0.2966891, 0.07886116, 0.1159937, 0, 0.1372549, 1, 1,
0.297439, -0.3782409, 1.628987, 0, 0.1294118, 1, 1,
0.3015578, -0.6464258, 0.7658643, 0, 0.1254902, 1, 1,
0.3045121, -0.8909865, 3.364485, 0, 0.1176471, 1, 1,
0.3045411, 0.1725073, -0.7513757, 0, 0.1137255, 1, 1,
0.304649, -0.2096467, 1.30991, 0, 0.1058824, 1, 1,
0.3053079, 1.384635, 1.054471, 0, 0.09803922, 1, 1,
0.3126732, -0.1377141, 2.190279, 0, 0.09411765, 1, 1,
0.3166716, 1.357683, -0.901538, 0, 0.08627451, 1, 1,
0.3175721, -0.2356661, 2.545016, 0, 0.08235294, 1, 1,
0.3244706, -0.10694, 0.5269322, 0, 0.07450981, 1, 1,
0.3321235, -0.5152434, 4.202708, 0, 0.07058824, 1, 1,
0.3335165, 1.151315, -1.824321, 0, 0.0627451, 1, 1,
0.3351015, 0.3499832, -0.003995644, 0, 0.05882353, 1, 1,
0.3375613, -0.2945345, 1.965208, 0, 0.05098039, 1, 1,
0.3415222, -0.6772408, 4.05109, 0, 0.04705882, 1, 1,
0.3443664, 0.5465104, -1.082707, 0, 0.03921569, 1, 1,
0.3461674, -1.210814, 0.2982755, 0, 0.03529412, 1, 1,
0.3481987, -1.866975, 2.803796, 0, 0.02745098, 1, 1,
0.3534893, 0.6710339, -0.08606227, 0, 0.02352941, 1, 1,
0.3561054, 1.470937, 0.6658201, 0, 0.01568628, 1, 1,
0.3597344, 0.05179548, 0.09182946, 0, 0.01176471, 1, 1,
0.3604058, -1.844502, 3.411731, 0, 0.003921569, 1, 1,
0.3632483, -0.352968, 1.993539, 0.003921569, 0, 1, 1,
0.3667533, -0.9849371, 3.607751, 0.007843138, 0, 1, 1,
0.3772495, 0.498388, 0.2534773, 0.01568628, 0, 1, 1,
0.3816085, -1.580555, 3.418921, 0.01960784, 0, 1, 1,
0.3858733, 0.03871465, 2.665635, 0.02745098, 0, 1, 1,
0.3892833, 1.515433, 0.6013039, 0.03137255, 0, 1, 1,
0.3999923, -2.156536, 4.571244, 0.03921569, 0, 1, 1,
0.4092505, 1.984775, -1.156779, 0.04313726, 0, 1, 1,
0.4092721, 1.191772, 0.4464053, 0.05098039, 0, 1, 1,
0.4120297, 1.208506, 0.8350701, 0.05490196, 0, 1, 1,
0.4151087, -0.5024477, 2.452491, 0.0627451, 0, 1, 1,
0.4158546, 2.195734, 0.1519994, 0.06666667, 0, 1, 1,
0.4174552, -0.2136702, 1.635777, 0.07450981, 0, 1, 1,
0.4264532, -0.4839687, 2.684566, 0.07843138, 0, 1, 1,
0.4266158, 0.187196, -0.4464706, 0.08627451, 0, 1, 1,
0.4323572, 0.5418896, 1.320386, 0.09019608, 0, 1, 1,
0.4344655, 1.238972, 0.8934178, 0.09803922, 0, 1, 1,
0.4366065, -1.509889, 2.810758, 0.1058824, 0, 1, 1,
0.4378296, 0.7584441, 0.8052596, 0.1098039, 0, 1, 1,
0.4460861, -1.2919, 4.484406, 0.1176471, 0, 1, 1,
0.4548162, -1.009742, 2.04101, 0.1215686, 0, 1, 1,
0.4571564, 1.192162, -0.1295747, 0.1294118, 0, 1, 1,
0.4577592, 1.312924, 1.271112, 0.1333333, 0, 1, 1,
0.4657113, 1.013266, 0.190029, 0.1411765, 0, 1, 1,
0.466189, -0.606101, 2.779844, 0.145098, 0, 1, 1,
0.4666681, -2.018108, 2.58437, 0.1529412, 0, 1, 1,
0.4707411, -0.8347806, 2.982261, 0.1568628, 0, 1, 1,
0.4717053, 2.253783, 0.05159416, 0.1647059, 0, 1, 1,
0.4754478, 1.722257, 1.219838, 0.1686275, 0, 1, 1,
0.4756456, -0.601257, 2.194809, 0.1764706, 0, 1, 1,
0.4791259, -0.6280888, 2.93398, 0.1803922, 0, 1, 1,
0.4855497, -0.9406944, 1.838876, 0.1882353, 0, 1, 1,
0.4911743, -0.1473415, 3.397657, 0.1921569, 0, 1, 1,
0.4931417, 0.02227414, 2.699852, 0.2, 0, 1, 1,
0.495433, -0.5758625, 3.328049, 0.2078431, 0, 1, 1,
0.5022155, 1.170138, 1.086639, 0.2117647, 0, 1, 1,
0.5049601, -0.1659893, 1.587635, 0.2196078, 0, 1, 1,
0.5092799, -0.8566203, 3.406567, 0.2235294, 0, 1, 1,
0.510669, -1.806834, 3.189511, 0.2313726, 0, 1, 1,
0.5180564, -0.9176507, 2.063519, 0.2352941, 0, 1, 1,
0.5203052, 1.798146, -0.1681218, 0.2431373, 0, 1, 1,
0.5271308, -1.251435, 5.40205, 0.2470588, 0, 1, 1,
0.5275865, -0.6275718, 2.093729, 0.254902, 0, 1, 1,
0.5288789, 0.9777755, 0.5858819, 0.2588235, 0, 1, 1,
0.5295374, 1.051254, 1.985892, 0.2666667, 0, 1, 1,
0.5307969, 0.1354417, 2.205065, 0.2705882, 0, 1, 1,
0.5313848, -0.4539766, 2.022691, 0.2784314, 0, 1, 1,
0.5366343, 0.9979801, 0.9953401, 0.282353, 0, 1, 1,
0.5383872, -0.2098393, 1.15202, 0.2901961, 0, 1, 1,
0.5412457, -0.4723129, 3.669982, 0.2941177, 0, 1, 1,
0.5457069, 2.08737, 0.4370592, 0.3019608, 0, 1, 1,
0.5460659, 0.918525, 1.237718, 0.3098039, 0, 1, 1,
0.5494097, -0.8033099, 2.568673, 0.3137255, 0, 1, 1,
0.5494913, 1.001851, -0.0953363, 0.3215686, 0, 1, 1,
0.5499105, -2.371249, 1.763284, 0.3254902, 0, 1, 1,
0.5613662, -1.219175, 2.97834, 0.3333333, 0, 1, 1,
0.5675896, 1.392886, 1.284919, 0.3372549, 0, 1, 1,
0.5688504, 0.7981014, 0.8079035, 0.345098, 0, 1, 1,
0.5713455, 0.0006904059, 2.250401, 0.3490196, 0, 1, 1,
0.5808924, -1.16091, 3.557566, 0.3568628, 0, 1, 1,
0.5814738, 0.7234848, 0.5734382, 0.3607843, 0, 1, 1,
0.5844598, -0.7179008, 2.356582, 0.3686275, 0, 1, 1,
0.5880867, -0.7985345, 1.945134, 0.372549, 0, 1, 1,
0.5915464, 1.33158, 0.790563, 0.3803922, 0, 1, 1,
0.5971397, 0.1684193, 1.611666, 0.3843137, 0, 1, 1,
0.5971707, -0.08821695, 0.7729495, 0.3921569, 0, 1, 1,
0.6027692, -0.5693484, 2.495524, 0.3960784, 0, 1, 1,
0.6033143, 1.5395, 1.380395, 0.4039216, 0, 1, 1,
0.6035826, -1.701982, 3.066846, 0.4117647, 0, 1, 1,
0.605702, 0.09938681, 0.3879308, 0.4156863, 0, 1, 1,
0.6158222, -0.6169375, 2.166883, 0.4235294, 0, 1, 1,
0.6172006, -0.7223323, 2.162706, 0.427451, 0, 1, 1,
0.6352124, 0.1677925, -0.7498286, 0.4352941, 0, 1, 1,
0.6430655, 1.812946, 0.002025347, 0.4392157, 0, 1, 1,
0.6454585, 0.05595435, 2.503069, 0.4470588, 0, 1, 1,
0.6503907, -2.161612, 1.79377, 0.4509804, 0, 1, 1,
0.6517774, -0.5472224, 3.023584, 0.4588235, 0, 1, 1,
0.6569664, 2.741678, 0.5053489, 0.4627451, 0, 1, 1,
0.6599322, -1.580714, 1.978553, 0.4705882, 0, 1, 1,
0.6601936, 0.2391656, 0.5799196, 0.4745098, 0, 1, 1,
0.6626059, 1.160793, 1.832439, 0.4823529, 0, 1, 1,
0.6628687, 0.2128223, 1.673866, 0.4862745, 0, 1, 1,
0.675668, 0.3696401, 1.782568, 0.4941176, 0, 1, 1,
0.6781174, -0.9952248, 3.956432, 0.5019608, 0, 1, 1,
0.6842548, 0.08028904, 2.212412, 0.5058824, 0, 1, 1,
0.6952065, -1.040181, 3.487916, 0.5137255, 0, 1, 1,
0.6992223, 0.8680795, 0.04734715, 0.5176471, 0, 1, 1,
0.7000062, 0.516852, -0.8778722, 0.5254902, 0, 1, 1,
0.7061335, 1.972212, 0.3316154, 0.5294118, 0, 1, 1,
0.7126285, -1.249224, 2.94797, 0.5372549, 0, 1, 1,
0.7127704, -0.7129872, 4.293207, 0.5411765, 0, 1, 1,
0.7130179, 0.8540233, -0.9166197, 0.5490196, 0, 1, 1,
0.7177546, -1.098233, 3.546233, 0.5529412, 0, 1, 1,
0.7205166, -0.5791974, 1.976887, 0.5607843, 0, 1, 1,
0.7213646, -0.0867807, 3.867352, 0.5647059, 0, 1, 1,
0.721842, 0.2610671, 1.901166, 0.572549, 0, 1, 1,
0.7236649, -0.348326, 1.703771, 0.5764706, 0, 1, 1,
0.7271231, -0.4878105, 2.820649, 0.5843138, 0, 1, 1,
0.7291505, 2.539245, -0.4091793, 0.5882353, 0, 1, 1,
0.7304689, -1.214638, 1.5741, 0.5960785, 0, 1, 1,
0.7358071, 1.457637, 0.08340379, 0.6039216, 0, 1, 1,
0.7364249, 0.7266168, -0.4681869, 0.6078432, 0, 1, 1,
0.7373137, 0.6201416, 1.645896, 0.6156863, 0, 1, 1,
0.7420418, 0.284873, -1.00654, 0.6196079, 0, 1, 1,
0.7548642, -1.235526, 2.212367, 0.627451, 0, 1, 1,
0.7623879, -1.245821, 3.580651, 0.6313726, 0, 1, 1,
0.7655956, 0.3530589, -0.6587042, 0.6392157, 0, 1, 1,
0.7671034, 0.3675764, 0.5530147, 0.6431373, 0, 1, 1,
0.7685546, 0.9765474, -0.03403482, 0.6509804, 0, 1, 1,
0.7690656, 1.826821, 0.1071443, 0.654902, 0, 1, 1,
0.772591, -0.2725885, 4.157062, 0.6627451, 0, 1, 1,
0.7728195, 2.133803, 2.078425, 0.6666667, 0, 1, 1,
0.7761542, -1.784542, 4.1675, 0.6745098, 0, 1, 1,
0.7801428, -0.1972484, 1.176501, 0.6784314, 0, 1, 1,
0.7822891, 1.813533, 0.01370313, 0.6862745, 0, 1, 1,
0.7826202, -0.1780937, 2.375844, 0.6901961, 0, 1, 1,
0.7833686, 0.420321, 1.399958, 0.6980392, 0, 1, 1,
0.7871728, 0.480336, 0.8366867, 0.7058824, 0, 1, 1,
0.7902032, 0.5220471, 0.9025124, 0.7098039, 0, 1, 1,
0.803993, -1.275997, 1.252878, 0.7176471, 0, 1, 1,
0.806308, -1.507566, 2.591421, 0.7215686, 0, 1, 1,
0.8063812, -0.9073037, 0.8148815, 0.7294118, 0, 1, 1,
0.8088719, 1.053394, -0.5598779, 0.7333333, 0, 1, 1,
0.8127929, 0.6465576, 0.8328592, 0.7411765, 0, 1, 1,
0.8132999, 1.127348, -1.426972, 0.7450981, 0, 1, 1,
0.8136233, 1.53311, 0.3904612, 0.7529412, 0, 1, 1,
0.8180103, -1.085011, 3.133423, 0.7568628, 0, 1, 1,
0.8204998, 0.8629083, -0.05388627, 0.7647059, 0, 1, 1,
0.8217361, 0.1141807, 2.198672, 0.7686275, 0, 1, 1,
0.8230553, 0.0468291, 0.4369645, 0.7764706, 0, 1, 1,
0.8238774, 0.3974548, -0.2224418, 0.7803922, 0, 1, 1,
0.8240121, 0.3250996, 1.486555, 0.7882353, 0, 1, 1,
0.8289347, -0.3140324, 3.921973, 0.7921569, 0, 1, 1,
0.8309216, -1.524543, 2.019905, 0.8, 0, 1, 1,
0.8332269, 1.155321, 1.371896, 0.8078431, 0, 1, 1,
0.8383061, -0.05490622, 1.538744, 0.8117647, 0, 1, 1,
0.8390052, -0.5043122, 2.517395, 0.8196079, 0, 1, 1,
0.8403994, -0.7254904, 2.768381, 0.8235294, 0, 1, 1,
0.8421299, -1.283654, 3.620852, 0.8313726, 0, 1, 1,
0.8439736, -0.512877, 3.085603, 0.8352941, 0, 1, 1,
0.8440422, -2.721285, 3.28113, 0.8431373, 0, 1, 1,
0.846207, -1.430332, 3.061131, 0.8470588, 0, 1, 1,
0.8464282, -0.7121245, 3.622491, 0.854902, 0, 1, 1,
0.8487989, -1.317907, 2.761651, 0.8588235, 0, 1, 1,
0.8526822, -0.9169769, 2.393378, 0.8666667, 0, 1, 1,
0.8528259, -0.7391799, 2.785201, 0.8705882, 0, 1, 1,
0.8578628, -0.980867, 0.7193488, 0.8784314, 0, 1, 1,
0.8752103, -0.5771441, 0.5577402, 0.8823529, 0, 1, 1,
0.8783196, -0.967365, 0.8738775, 0.8901961, 0, 1, 1,
0.8894488, 0.8814935, 0.1135699, 0.8941177, 0, 1, 1,
0.893092, -0.05284809, 1.100544, 0.9019608, 0, 1, 1,
0.8994675, 0.5672781, 2.675638, 0.9098039, 0, 1, 1,
0.9027258, 0.3309433, 1.182089, 0.9137255, 0, 1, 1,
0.918215, -1.368125, 3.447621, 0.9215686, 0, 1, 1,
0.925225, 0.6446023, 2.066339, 0.9254902, 0, 1, 1,
0.9260445, 1.420879, -0.2608804, 0.9333333, 0, 1, 1,
0.9267427, 1.856566, 0.2333979, 0.9372549, 0, 1, 1,
0.9323691, 0.7506647, 0.1470896, 0.945098, 0, 1, 1,
0.9380791, 0.4460265, -0.225436, 0.9490196, 0, 1, 1,
0.9381118, -0.7991367, 3.432724, 0.9568627, 0, 1, 1,
0.939224, 0.638629, 1.282033, 0.9607843, 0, 1, 1,
0.9430134, -0.3743562, -0.2546381, 0.9686275, 0, 1, 1,
0.9561942, 0.1629432, 0.8624333, 0.972549, 0, 1, 1,
0.9678532, -0.09777933, 2.744716, 0.9803922, 0, 1, 1,
0.9694882, 0.8926554, 0.8337235, 0.9843137, 0, 1, 1,
0.9699187, 0.5699444, -0.8401272, 0.9921569, 0, 1, 1,
0.9736804, -0.2712407, 2.260849, 0.9960784, 0, 1, 1,
0.9775149, 0.585541, 0.1687922, 1, 0, 0.9960784, 1,
0.9811914, -2.06529, 0.6923482, 1, 0, 0.9882353, 1,
0.9831039, 0.569573, 0.03292678, 1, 0, 0.9843137, 1,
0.9865373, -0.5043492, 0.8791746, 1, 0, 0.9764706, 1,
0.9896215, -0.3329372, 1.940523, 1, 0, 0.972549, 1,
0.9906784, -0.4445097, 1.655027, 1, 0, 0.9647059, 1,
1.003384, 0.7794445, 0.2689275, 1, 0, 0.9607843, 1,
1.005154, 0.4446155, 0.6156702, 1, 0, 0.9529412, 1,
1.006692, 0.4848226, -0.3479405, 1, 0, 0.9490196, 1,
1.006849, -0.05730657, 2.106363, 1, 0, 0.9411765, 1,
1.023674, 0.6059637, 3.150658, 1, 0, 0.9372549, 1,
1.026796, 1.719263, 2.553447, 1, 0, 0.9294118, 1,
1.027825, -0.4661429, 1.837208, 1, 0, 0.9254902, 1,
1.028148, -3.069366, 2.617003, 1, 0, 0.9176471, 1,
1.043828, 0.003174995, -0.7245722, 1, 0, 0.9137255, 1,
1.057918, 0.4777054, 0.7637581, 1, 0, 0.9058824, 1,
1.061601, -1.110367, 0.6978372, 1, 0, 0.9019608, 1,
1.062609, -0.1014431, 2.30604, 1, 0, 0.8941177, 1,
1.062902, -0.1168549, 2.626071, 1, 0, 0.8862745, 1,
1.071692, -1.488395, 0.8878257, 1, 0, 0.8823529, 1,
1.081205, 2.606362, 0.2540107, 1, 0, 0.8745098, 1,
1.082893, -1.971867, 4.348726, 1, 0, 0.8705882, 1,
1.082941, 0.08829731, 1.737925, 1, 0, 0.8627451, 1,
1.085574, 0.6754183, 1.083727, 1, 0, 0.8588235, 1,
1.092318, 1.503609, 0.6577632, 1, 0, 0.8509804, 1,
1.108669, -0.4842483, 1.986658, 1, 0, 0.8470588, 1,
1.119695, 0.5473713, 0.8548974, 1, 0, 0.8392157, 1,
1.122155, 0.8131521, 0.5334785, 1, 0, 0.8352941, 1,
1.122911, -1.154963, 1.654555, 1, 0, 0.827451, 1,
1.124631, 2.325415, -1.356846, 1, 0, 0.8235294, 1,
1.124751, 0.3744005, 1.8402, 1, 0, 0.8156863, 1,
1.125903, 0.5800539, 1.023164, 1, 0, 0.8117647, 1,
1.130027, -0.2805466, 0.7218342, 1, 0, 0.8039216, 1,
1.133384, 0.7415469, 1.849753, 1, 0, 0.7960784, 1,
1.139129, 0.1136939, 1.789616, 1, 0, 0.7921569, 1,
1.149009, 1.351427, -0.1369914, 1, 0, 0.7843137, 1,
1.152899, -1.337477, 2.949594, 1, 0, 0.7803922, 1,
1.156397, 1.267968, 1.300983, 1, 0, 0.772549, 1,
1.160188, -0.6993885, 0.2136343, 1, 0, 0.7686275, 1,
1.162499, 0.4045716, 0.5370694, 1, 0, 0.7607843, 1,
1.166925, 1.028644, -0.5639766, 1, 0, 0.7568628, 1,
1.167916, 1.026427, 1.153018, 1, 0, 0.7490196, 1,
1.171521, -0.6208959, 0.4078819, 1, 0, 0.7450981, 1,
1.187531, 1.602814, 0.07574697, 1, 0, 0.7372549, 1,
1.193377, 0.33957, 1.695364, 1, 0, 0.7333333, 1,
1.195924, 1.058004, 1.794777, 1, 0, 0.7254902, 1,
1.20339, 1.404879, 2.430483, 1, 0, 0.7215686, 1,
1.211087, -1.048205, 2.643301, 1, 0, 0.7137255, 1,
1.219747, -0.2702959, 0.03819507, 1, 0, 0.7098039, 1,
1.220468, -1.026679, 2.366199, 1, 0, 0.7019608, 1,
1.234521, 0.6054043, 2.088992, 1, 0, 0.6941177, 1,
1.247298, 0.1304973, 0.916489, 1, 0, 0.6901961, 1,
1.249118, -2.26914, 4.222003, 1, 0, 0.682353, 1,
1.253722, 0.2847583, 2.479924, 1, 0, 0.6784314, 1,
1.262958, 1.828195, 1.612929, 1, 0, 0.6705883, 1,
1.265426, 0.3290614, 1.748628, 1, 0, 0.6666667, 1,
1.274393, -0.39115, 1.244897, 1, 0, 0.6588235, 1,
1.283388, -1.016705, 3.484386, 1, 0, 0.654902, 1,
1.284438, -0.3750316, 2.118745, 1, 0, 0.6470588, 1,
1.285799, -0.4255064, 1.47489, 1, 0, 0.6431373, 1,
1.288256, 1.089127, 2.388379, 1, 0, 0.6352941, 1,
1.289119, 0.5178052, 1.623999, 1, 0, 0.6313726, 1,
1.292027, 0.3290059, 1.010322, 1, 0, 0.6235294, 1,
1.296414, -0.9851031, 2.453653, 1, 0, 0.6196079, 1,
1.298446, -0.5716251, 1.083458, 1, 0, 0.6117647, 1,
1.300602, 2.142678, 1.270205, 1, 0, 0.6078432, 1,
1.304164, 1.346113, -0.1090265, 1, 0, 0.6, 1,
1.311535, -0.3797609, 1.812622, 1, 0, 0.5921569, 1,
1.331497, 0.7091575, 0.07214124, 1, 0, 0.5882353, 1,
1.333758, 1.426545, 3.003811, 1, 0, 0.5803922, 1,
1.337993, 1.024184, -0.2438022, 1, 0, 0.5764706, 1,
1.338602, 0.4617535, 1.54777, 1, 0, 0.5686275, 1,
1.345693, 0.3721467, 1.863161, 1, 0, 0.5647059, 1,
1.358878, -0.8609335, 1.739371, 1, 0, 0.5568628, 1,
1.394354, -0.5275379, 1.602778, 1, 0, 0.5529412, 1,
1.400407, 0.34998, 1.195973, 1, 0, 0.5450981, 1,
1.400572, -0.1811626, -0.1239821, 1, 0, 0.5411765, 1,
1.411994, 0.5413868, 1.932997, 1, 0, 0.5333334, 1,
1.417957, 1.758231, 0.5969831, 1, 0, 0.5294118, 1,
1.42469, 0.02852345, 1.387203, 1, 0, 0.5215687, 1,
1.438327, -0.5351885, -0.5690727, 1, 0, 0.5176471, 1,
1.444663, -1.493251, 2.846736, 1, 0, 0.509804, 1,
1.446869, 0.4605504, 0.7422259, 1, 0, 0.5058824, 1,
1.450205, -1.029513, 1.097019, 1, 0, 0.4980392, 1,
1.451595, -1.026414, 2.226712, 1, 0, 0.4901961, 1,
1.459274, 1.528596, -0.2411207, 1, 0, 0.4862745, 1,
1.46064, -0.8433947, 2.064999, 1, 0, 0.4784314, 1,
1.46445, 0.8743975, 0.5423976, 1, 0, 0.4745098, 1,
1.470223, -1.651391, 3.720554, 1, 0, 0.4666667, 1,
1.474398, -0.4516999, 2.825676, 1, 0, 0.4627451, 1,
1.484774, -0.09313906, 1.567687, 1, 0, 0.454902, 1,
1.496003, 0.4325962, 1.52542, 1, 0, 0.4509804, 1,
1.499566, -0.5488319, 2.696137, 1, 0, 0.4431373, 1,
1.522223, 0.7112409, 1.636126, 1, 0, 0.4392157, 1,
1.526157, 0.5410159, 1.479569, 1, 0, 0.4313726, 1,
1.526726, 2.04592, 1.364927, 1, 0, 0.427451, 1,
1.535275, -0.9570134, 1.639707, 1, 0, 0.4196078, 1,
1.539995, -0.4277372, -0.2778322, 1, 0, 0.4156863, 1,
1.545191, 0.08012743, 1.956092, 1, 0, 0.4078431, 1,
1.557392, -0.865773, 2.288247, 1, 0, 0.4039216, 1,
1.562581, 1.694003, 0.6981139, 1, 0, 0.3960784, 1,
1.562666, 1.126597, 2.073231, 1, 0, 0.3882353, 1,
1.594308, 0.5153286, 0.2952858, 1, 0, 0.3843137, 1,
1.597117, 0.2856813, 1.072857, 1, 0, 0.3764706, 1,
1.599327, 1.783803, 0.944998, 1, 0, 0.372549, 1,
1.600815, -0.3496375, 1.613121, 1, 0, 0.3647059, 1,
1.605784, 0.5443901, 0.9777952, 1, 0, 0.3607843, 1,
1.615794, -1.045044, 0.9972287, 1, 0, 0.3529412, 1,
1.617422, 0.4950496, 1.181763, 1, 0, 0.3490196, 1,
1.626167, -1.341032, 1.906392, 1, 0, 0.3411765, 1,
1.633187, -0.9051719, 2.073603, 1, 0, 0.3372549, 1,
1.633574, 0.4923783, 3.038799, 1, 0, 0.3294118, 1,
1.63457, 0.03939831, 0.4372364, 1, 0, 0.3254902, 1,
1.676688, 0.3407396, 0.2745178, 1, 0, 0.3176471, 1,
1.689188, -0.6970008, 0.6156148, 1, 0, 0.3137255, 1,
1.691656, 0.33769, 1.330537, 1, 0, 0.3058824, 1,
1.709197, 1.134436, 1.165462, 1, 0, 0.2980392, 1,
1.71016, -1.367266, 1.682451, 1, 0, 0.2941177, 1,
1.710404, -2.203892, 2.083381, 1, 0, 0.2862745, 1,
1.710782, -0.9146263, 2.208484, 1, 0, 0.282353, 1,
1.713768, 0.2285893, -0.234306, 1, 0, 0.2745098, 1,
1.724512, -1.255191, 2.688269, 1, 0, 0.2705882, 1,
1.729414, -0.2509621, 0.007908165, 1, 0, 0.2627451, 1,
1.731026, -0.1597659, 3.393056, 1, 0, 0.2588235, 1,
1.75881, 1.434052, 1.791971, 1, 0, 0.2509804, 1,
1.765402, -1.348319, 1.442295, 1, 0, 0.2470588, 1,
1.795945, 0.5072963, 1.67127, 1, 0, 0.2392157, 1,
1.835421, -1.565247, 1.792476, 1, 0, 0.2352941, 1,
1.840595, -0.07494737, 0.5716754, 1, 0, 0.227451, 1,
1.842485, -0.975833, 2.727512, 1, 0, 0.2235294, 1,
1.880784, 0.557187, 2.097864, 1, 0, 0.2156863, 1,
1.884512, 0.1109206, 0.3405103, 1, 0, 0.2117647, 1,
1.896591, -0.1719061, 3.294225, 1, 0, 0.2039216, 1,
1.904466, 0.6394097, 0.8193845, 1, 0, 0.1960784, 1,
1.913411, 1.867245, 1.554051, 1, 0, 0.1921569, 1,
1.920183, -0.6442434, 1.831861, 1, 0, 0.1843137, 1,
1.943911, 0.5082921, -0.07290053, 1, 0, 0.1803922, 1,
1.952054, -1.124192, 2.444355, 1, 0, 0.172549, 1,
1.953617, 2.647963, 0.6154551, 1, 0, 0.1686275, 1,
1.970603, -0.6344659, 2.751689, 1, 0, 0.1607843, 1,
1.973869, -0.8122924, 2.585758, 1, 0, 0.1568628, 1,
1.978289, -1.227082, 2.003438, 1, 0, 0.1490196, 1,
1.997209, 0.9416782, 1.273689, 1, 0, 0.145098, 1,
2.009211, 1.628483, 0.6919779, 1, 0, 0.1372549, 1,
2.01279, -0.7555882, 2.286695, 1, 0, 0.1333333, 1,
2.032862, 0.5429131, 1.095528, 1, 0, 0.1254902, 1,
2.066601, 0.4821487, 1.172192, 1, 0, 0.1215686, 1,
2.073663, -1.352553, 3.277279, 1, 0, 0.1137255, 1,
2.074911, -0.6846811, 1.823704, 1, 0, 0.1098039, 1,
2.105793, -1.938009, 2.554661, 1, 0, 0.1019608, 1,
2.121803, -0.3971243, 0.3557958, 1, 0, 0.09411765, 1,
2.147059, -0.09013476, 2.15363, 1, 0, 0.09019608, 1,
2.178982, -0.1728086, 2.365745, 1, 0, 0.08235294, 1,
2.208005, 0.9272608, 1.746691, 1, 0, 0.07843138, 1,
2.221348, -0.5835704, 1.27282, 1, 0, 0.07058824, 1,
2.267297, 0.1559032, 1.142433, 1, 0, 0.06666667, 1,
2.451176, -0.4292057, 1.521019, 1, 0, 0.05882353, 1,
2.458243, 1.106293, 0.2953582, 1, 0, 0.05490196, 1,
2.46565, -0.3371109, 2.81101, 1, 0, 0.04705882, 1,
2.511737, 1.347714, 0.04567531, 1, 0, 0.04313726, 1,
2.550156, 0.3563097, 0.9964588, 1, 0, 0.03529412, 1,
2.557922, -1.134537, 2.178577, 1, 0, 0.03137255, 1,
2.592261, 0.6465926, 0.7060343, 1, 0, 0.02352941, 1,
2.736025, 2.438067, 1.445691, 1, 0, 0.01960784, 1,
2.945823, -0.08104311, -2.29157, 1, 0, 0.01176471, 1,
3.376325, -0.845628, 1.181726, 1, 0, 0.007843138, 1
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
0.008356452, -4.429937, -7.530296, 0, -0.5, 0.5, 0.5,
0.008356452, -4.429937, -7.530296, 1, -0.5, 0.5, 0.5,
0.008356452, -4.429937, -7.530296, 1, 1.5, 0.5, 0.5,
0.008356452, -4.429937, -7.530296, 0, 1.5, 0.5, 0.5
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
-4.501353, -0.2107548, -7.530296, 0, -0.5, 0.5, 0.5,
-4.501353, -0.2107548, -7.530296, 1, -0.5, 0.5, 0.5,
-4.501353, -0.2107548, -7.530296, 1, 1.5, 0.5, 0.5,
-4.501353, -0.2107548, -7.530296, 0, 1.5, 0.5, 0.5
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
-4.501353, -4.429937, -0.05161738, 0, -0.5, 0.5, 0.5,
-4.501353, -4.429937, -0.05161738, 1, -0.5, 0.5, 0.5,
-4.501353, -4.429937, -0.05161738, 1, 1.5, 0.5, 0.5,
-4.501353, -4.429937, -0.05161738, 0, 1.5, 0.5, 0.5
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
-3, -3.45628, -5.804447,
3, -3.45628, -5.804447,
-3, -3.45628, -5.804447,
-3, -3.618556, -6.092089,
-2, -3.45628, -5.804447,
-2, -3.618556, -6.092089,
-1, -3.45628, -5.804447,
-1, -3.618556, -6.092089,
0, -3.45628, -5.804447,
0, -3.618556, -6.092089,
1, -3.45628, -5.804447,
1, -3.618556, -6.092089,
2, -3.45628, -5.804447,
2, -3.618556, -6.092089,
3, -3.45628, -5.804447,
3, -3.618556, -6.092089
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
-3, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
-3, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
-3, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
-3, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5,
-2, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
-2, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
-2, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
-2, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5,
-1, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
-1, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
-1, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
-1, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5,
0, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
0, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
0, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
0, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5,
1, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
1, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
1, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
1, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5,
2, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
2, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
2, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
2, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5,
3, -3.943109, -6.667372, 0, -0.5, 0.5, 0.5,
3, -3.943109, -6.667372, 1, -0.5, 0.5, 0.5,
3, -3.943109, -6.667372, 1, 1.5, 0.5, 0.5,
3, -3.943109, -6.667372, 0, 1.5, 0.5, 0.5
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
-3.460651, -3, -5.804447,
-3.460651, 2, -5.804447,
-3.460651, -3, -5.804447,
-3.634101, -3, -6.092089,
-3.460651, -2, -5.804447,
-3.634101, -2, -6.092089,
-3.460651, -1, -5.804447,
-3.634101, -1, -6.092089,
-3.460651, 0, -5.804447,
-3.634101, 0, -6.092089,
-3.460651, 1, -5.804447,
-3.634101, 1, -6.092089,
-3.460651, 2, -5.804447,
-3.634101, 2, -6.092089
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
-3.981002, -3, -6.667372, 0, -0.5, 0.5, 0.5,
-3.981002, -3, -6.667372, 1, -0.5, 0.5, 0.5,
-3.981002, -3, -6.667372, 1, 1.5, 0.5, 0.5,
-3.981002, -3, -6.667372, 0, 1.5, 0.5, 0.5,
-3.981002, -2, -6.667372, 0, -0.5, 0.5, 0.5,
-3.981002, -2, -6.667372, 1, -0.5, 0.5, 0.5,
-3.981002, -2, -6.667372, 1, 1.5, 0.5, 0.5,
-3.981002, -2, -6.667372, 0, 1.5, 0.5, 0.5,
-3.981002, -1, -6.667372, 0, -0.5, 0.5, 0.5,
-3.981002, -1, -6.667372, 1, -0.5, 0.5, 0.5,
-3.981002, -1, -6.667372, 1, 1.5, 0.5, 0.5,
-3.981002, -1, -6.667372, 0, 1.5, 0.5, 0.5,
-3.981002, 0, -6.667372, 0, -0.5, 0.5, 0.5,
-3.981002, 0, -6.667372, 1, -0.5, 0.5, 0.5,
-3.981002, 0, -6.667372, 1, 1.5, 0.5, 0.5,
-3.981002, 0, -6.667372, 0, 1.5, 0.5, 0.5,
-3.981002, 1, -6.667372, 0, -0.5, 0.5, 0.5,
-3.981002, 1, -6.667372, 1, -0.5, 0.5, 0.5,
-3.981002, 1, -6.667372, 1, 1.5, 0.5, 0.5,
-3.981002, 1, -6.667372, 0, 1.5, 0.5, 0.5,
-3.981002, 2, -6.667372, 0, -0.5, 0.5, 0.5,
-3.981002, 2, -6.667372, 1, -0.5, 0.5, 0.5,
-3.981002, 2, -6.667372, 1, 1.5, 0.5, 0.5,
-3.981002, 2, -6.667372, 0, 1.5, 0.5, 0.5
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
-3.460651, -3.45628, -4,
-3.460651, -3.45628, 4,
-3.460651, -3.45628, -4,
-3.634101, -3.618556, -4,
-3.460651, -3.45628, -2,
-3.634101, -3.618556, -2,
-3.460651, -3.45628, 0,
-3.634101, -3.618556, 0,
-3.460651, -3.45628, 2,
-3.634101, -3.618556, 2,
-3.460651, -3.45628, 4,
-3.634101, -3.618556, 4
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
-3.981002, -3.943109, -4, 0, -0.5, 0.5, 0.5,
-3.981002, -3.943109, -4, 1, -0.5, 0.5, 0.5,
-3.981002, -3.943109, -4, 1, 1.5, 0.5, 0.5,
-3.981002, -3.943109, -4, 0, 1.5, 0.5, 0.5,
-3.981002, -3.943109, -2, 0, -0.5, 0.5, 0.5,
-3.981002, -3.943109, -2, 1, -0.5, 0.5, 0.5,
-3.981002, -3.943109, -2, 1, 1.5, 0.5, 0.5,
-3.981002, -3.943109, -2, 0, 1.5, 0.5, 0.5,
-3.981002, -3.943109, 0, 0, -0.5, 0.5, 0.5,
-3.981002, -3.943109, 0, 1, -0.5, 0.5, 0.5,
-3.981002, -3.943109, 0, 1, 1.5, 0.5, 0.5,
-3.981002, -3.943109, 0, 0, 1.5, 0.5, 0.5,
-3.981002, -3.943109, 2, 0, -0.5, 0.5, 0.5,
-3.981002, -3.943109, 2, 1, -0.5, 0.5, 0.5,
-3.981002, -3.943109, 2, 1, 1.5, 0.5, 0.5,
-3.981002, -3.943109, 2, 0, 1.5, 0.5, 0.5,
-3.981002, -3.943109, 4, 0, -0.5, 0.5, 0.5,
-3.981002, -3.943109, 4, 1, -0.5, 0.5, 0.5,
-3.981002, -3.943109, 4, 1, 1.5, 0.5, 0.5,
-3.981002, -3.943109, 4, 0, 1.5, 0.5, 0.5
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
-3.460651, -3.45628, -5.804447,
-3.460651, 3.03477, -5.804447,
-3.460651, -3.45628, 5.701212,
-3.460651, 3.03477, 5.701212,
-3.460651, -3.45628, -5.804447,
-3.460651, -3.45628, 5.701212,
-3.460651, 3.03477, -5.804447,
-3.460651, 3.03477, 5.701212,
-3.460651, -3.45628, -5.804447,
3.477364, -3.45628, -5.804447,
-3.460651, -3.45628, 5.701212,
3.477364, -3.45628, 5.701212,
-3.460651, 3.03477, -5.804447,
3.477364, 3.03477, -5.804447,
-3.460651, 3.03477, 5.701212,
3.477364, 3.03477, 5.701212,
3.477364, -3.45628, -5.804447,
3.477364, 3.03477, -5.804447,
3.477364, -3.45628, 5.701212,
3.477364, 3.03477, 5.701212,
3.477364, -3.45628, -5.804447,
3.477364, -3.45628, 5.701212,
3.477364, 3.03477, -5.804447,
3.477364, 3.03477, 5.701212
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
var radius = 7.96777;
var distance = 35.44951;
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
mvMatrix.translate( -0.008356452, 0.2107548, 0.05161738 );
mvMatrix.scale( 1.241697, 1.327198, 0.748754 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.44951);
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
quinalphos<-read.table("quinalphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-quinalphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinalphos' not found
```

```r
y<-quinalphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinalphos' not found
```

```r
z<-quinalphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinalphos' not found
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
-3.359612, -1.434971, -1.279552, 0, 0, 1, 1, 1,
-3.087739, -0.3286535, -2.342997, 1, 0, 0, 1, 1,
-2.811983, 0.7379709, -1.635135, 1, 0, 0, 1, 1,
-2.728648, -0.09566763, -2.9504, 1, 0, 0, 1, 1,
-2.718513, -0.5846786, -0.3784677, 1, 0, 0, 1, 1,
-2.651161, 0.5626908, -1.273667, 1, 0, 0, 1, 1,
-2.648842, -0.4991371, -3.580524, 0, 0, 0, 1, 1,
-2.641533, 0.2741978, -0.7911773, 0, 0, 0, 1, 1,
-2.615102, 1.016588, -2.448722, 0, 0, 0, 1, 1,
-2.558118, 0.7126998, -1.520665, 0, 0, 0, 1, 1,
-2.531147, 1.166537, -1.416732, 0, 0, 0, 1, 1,
-2.492142, 0.8815475, -1.404251, 0, 0, 0, 1, 1,
-2.492008, 0.3458521, -0.910867, 0, 0, 0, 1, 1,
-2.453995, 0.1009262, -0.9059891, 1, 1, 1, 1, 1,
-2.410406, 0.9221492, -2.280029, 1, 1, 1, 1, 1,
-2.386482, -0.7283833, -2.271143, 1, 1, 1, 1, 1,
-2.386236, -0.2035749, -1.471515, 1, 1, 1, 1, 1,
-2.383193, 0.2237733, -2.696177, 1, 1, 1, 1, 1,
-2.350054, 0.6558129, -0.4447135, 1, 1, 1, 1, 1,
-2.346776, -2.473429, -1.057061, 1, 1, 1, 1, 1,
-2.336246, -1.666055, -3.137786, 1, 1, 1, 1, 1,
-2.306169, -1.068856, -3.353487, 1, 1, 1, 1, 1,
-2.287246, -0.0497916, -1.189113, 1, 1, 1, 1, 1,
-2.238647, 0.3409972, -0.8470635, 1, 1, 1, 1, 1,
-2.230501, 0.8664038, -1.529792, 1, 1, 1, 1, 1,
-2.202076, -0.121361, -2.805317, 1, 1, 1, 1, 1,
-2.124201, 1.599894, -0.9173139, 1, 1, 1, 1, 1,
-2.117624, -1.934204, -0.06362694, 1, 1, 1, 1, 1,
-2.111501, 1.096709, -0.3975835, 0, 0, 1, 1, 1,
-2.058139, 0.8860136, -1.764872, 1, 0, 0, 1, 1,
-2.050991, 0.01042475, -2.469276, 1, 0, 0, 1, 1,
-2.027421, -2.017848, -1.649574, 1, 0, 0, 1, 1,
-2.021158, 1.425406, -0.5025359, 1, 0, 0, 1, 1,
-2.019254, -0.4661807, -2.282151, 1, 0, 0, 1, 1,
-2.015505, -0.7799251, -1.001901, 0, 0, 0, 1, 1,
-1.990762, 0.8332264, -0.7973681, 0, 0, 0, 1, 1,
-1.987831, 1.8169, -0.8358698, 0, 0, 0, 1, 1,
-1.962824, -1.985007, -3.163496, 0, 0, 0, 1, 1,
-1.927593, 1.302567, -0.8142384, 0, 0, 0, 1, 1,
-1.92549, 1.920427, -1.442205, 0, 0, 0, 1, 1,
-1.921828, -0.9153614, -1.709139, 0, 0, 0, 1, 1,
-1.908802, -0.6594319, -1.231741, 1, 1, 1, 1, 1,
-1.897858, -0.7834295, -0.7516673, 1, 1, 1, 1, 1,
-1.897163, -0.8310907, -2.986812, 1, 1, 1, 1, 1,
-1.892376, 1.194932, -1.371465, 1, 1, 1, 1, 1,
-1.877273, 1.61469, 0.4998452, 1, 1, 1, 1, 1,
-1.870826, 0.8200421, -2.097771, 1, 1, 1, 1, 1,
-1.870655, 0.6212919, -1.819097, 1, 1, 1, 1, 1,
-1.810895, 1.200291, -0.9494628, 1, 1, 1, 1, 1,
-1.798329, -1.752206, -1.473835, 1, 1, 1, 1, 1,
-1.764388, -0.7429118, -0.5501809, 1, 1, 1, 1, 1,
-1.761005, 1.233557, 0.3626643, 1, 1, 1, 1, 1,
-1.74767, 0.9148695, -0.9869063, 1, 1, 1, 1, 1,
-1.743759, -0.06351179, -1.415502, 1, 1, 1, 1, 1,
-1.717716, 1.340101, -1.96739, 1, 1, 1, 1, 1,
-1.68652, 1.51276, -1.495094, 1, 1, 1, 1, 1,
-1.664633, -0.00121832, -0.6572742, 0, 0, 1, 1, 1,
-1.654974, -0.4331119, -0.4017101, 1, 0, 0, 1, 1,
-1.652681, -1.041903, -3.837571, 1, 0, 0, 1, 1,
-1.641938, 0.4915773, -2.122103, 1, 0, 0, 1, 1,
-1.633869, 0.3965893, -1.40153, 1, 0, 0, 1, 1,
-1.618226, 0.595611, 0.3142723, 1, 0, 0, 1, 1,
-1.612307, 0.381491, -0.9087564, 0, 0, 0, 1, 1,
-1.609279, -1.072199, -1.224068, 0, 0, 0, 1, 1,
-1.608367, 0.04225865, -1.881168, 0, 0, 0, 1, 1,
-1.570874, -0.6443988, -2.240121, 0, 0, 0, 1, 1,
-1.561999, 0.3502573, -2.349125, 0, 0, 0, 1, 1,
-1.550727, 1.054649, -0.2421556, 0, 0, 0, 1, 1,
-1.547223, -0.827854, -2.781583, 0, 0, 0, 1, 1,
-1.539373, 0.2403187, -1.431495, 1, 1, 1, 1, 1,
-1.538573, 1.072969, 0.9424128, 1, 1, 1, 1, 1,
-1.534781, 0.5257363, -0.5574334, 1, 1, 1, 1, 1,
-1.534111, 0.5798796, -1.694378, 1, 1, 1, 1, 1,
-1.532999, -0.839378, -2.563921, 1, 1, 1, 1, 1,
-1.52964, 0.4045157, -2.727104, 1, 1, 1, 1, 1,
-1.528209, -0.1930091, -1.651049, 1, 1, 1, 1, 1,
-1.52717, 0.2042364, -2.586976, 1, 1, 1, 1, 1,
-1.526027, -0.1123739, -2.267206, 1, 1, 1, 1, 1,
-1.522523, -1.555069, -3.265246, 1, 1, 1, 1, 1,
-1.519694, 2.664637, -2.537869, 1, 1, 1, 1, 1,
-1.517352, 0.03087509, -1.252984, 1, 1, 1, 1, 1,
-1.498816, 1.144681, 0.03458733, 1, 1, 1, 1, 1,
-1.486844, 0.5245581, -2.535153, 1, 1, 1, 1, 1,
-1.486132, 0.770026, -2.316112, 1, 1, 1, 1, 1,
-1.481964, 0.3011921, -2.844882, 0, 0, 1, 1, 1,
-1.477661, 0.8169592, -3.06481, 1, 0, 0, 1, 1,
-1.453665, -0.4969153, -2.38868, 1, 0, 0, 1, 1,
-1.451921, 1.381586, -0.925886, 1, 0, 0, 1, 1,
-1.445025, -0.6451955, -1.686674, 1, 0, 0, 1, 1,
-1.396563, -0.3957955, -0.5190995, 1, 0, 0, 1, 1,
-1.395555, 0.1063278, -1.149214, 0, 0, 0, 1, 1,
-1.392572, -0.4353789, -2.705725, 0, 0, 0, 1, 1,
-1.392433, 0.02305883, -1.407155, 0, 0, 0, 1, 1,
-1.389269, -0.8296462, -3.663985, 0, 0, 0, 1, 1,
-1.377557, -0.1060743, -0.378771, 0, 0, 0, 1, 1,
-1.374278, 1.083846, -0.6645612, 0, 0, 0, 1, 1,
-1.372475, -0.09957887, -2.748783, 0, 0, 0, 1, 1,
-1.369725, 1.690016, -0.9853212, 1, 1, 1, 1, 1,
-1.366104, 1.763228, -1.120738, 1, 1, 1, 1, 1,
-1.360187, -1.740615, -1.794092, 1, 1, 1, 1, 1,
-1.351181, -1.526597, -1.175144, 1, 1, 1, 1, 1,
-1.350263, -0.3697942, -3.595374, 1, 1, 1, 1, 1,
-1.332984, -1.455348, -2.408896, 1, 1, 1, 1, 1,
-1.32236, 1.098952, -1.70689, 1, 1, 1, 1, 1,
-1.320708, 0.4927226, -1.266815, 1, 1, 1, 1, 1,
-1.308973, 1.553657, -1.760542, 1, 1, 1, 1, 1,
-1.308782, -1.043592, -2.574498, 1, 1, 1, 1, 1,
-1.305365, 0.6766335, -2.220909, 1, 1, 1, 1, 1,
-1.292967, 0.2800294, -1.586733, 1, 1, 1, 1, 1,
-1.282409, -0.8961313, -2.752228, 1, 1, 1, 1, 1,
-1.282072, 1.381348, -2.659527, 1, 1, 1, 1, 1,
-1.276712, -0.03836215, -1.084968, 1, 1, 1, 1, 1,
-1.268485, -0.508529, -1.986251, 0, 0, 1, 1, 1,
-1.265686, 1.3855, 0.6182786, 1, 0, 0, 1, 1,
-1.259323, -0.8378408, -3.341246, 1, 0, 0, 1, 1,
-1.24988, -1.320927, -1.878535, 1, 0, 0, 1, 1,
-1.243716, -0.05721179, -1.492826, 1, 0, 0, 1, 1,
-1.234091, -0.01557224, -2.133433, 1, 0, 0, 1, 1,
-1.233052, -0.06819941, -1.928242, 0, 0, 0, 1, 1,
-1.231518, -0.2192057, -2.081281, 0, 0, 0, 1, 1,
-1.225243, -0.8002985, -3.010248, 0, 0, 0, 1, 1,
-1.22234, 0.4099426, -0.5527644, 0, 0, 0, 1, 1,
-1.216846, -1.13951, -1.19688, 0, 0, 0, 1, 1,
-1.215012, -1.231286, -2.316444, 0, 0, 0, 1, 1,
-1.211083, 1.568046, -0.141172, 0, 0, 0, 1, 1,
-1.208955, 1.208059, -2.181055, 1, 1, 1, 1, 1,
-1.203075, -1.024979, -2.409154, 1, 1, 1, 1, 1,
-1.196265, 0.4830428, -0.06096695, 1, 1, 1, 1, 1,
-1.194881, -0.5042692, -1.523115, 1, 1, 1, 1, 1,
-1.194181, 0.3977797, -0.3096091, 1, 1, 1, 1, 1,
-1.193835, -2.002867, -4.554084, 1, 1, 1, 1, 1,
-1.183989, -1.480187, -3.066325, 1, 1, 1, 1, 1,
-1.179756, 0.04857948, -3.633408, 1, 1, 1, 1, 1,
-1.17658, 1.081373, -1.727353, 1, 1, 1, 1, 1,
-1.172777, 0.5818099, -1.007101, 1, 1, 1, 1, 1,
-1.165933, -0.302894, -2.703256, 1, 1, 1, 1, 1,
-1.164823, -0.0745515, -1.119443, 1, 1, 1, 1, 1,
-1.15687, 2.072382, -1.134411, 1, 1, 1, 1, 1,
-1.151739, -0.7500189, -3.067129, 1, 1, 1, 1, 1,
-1.151485, -0.4389532, -1.733464, 1, 1, 1, 1, 1,
-1.144542, 0.1296384, 0.4905654, 0, 0, 1, 1, 1,
-1.143739, -1.127059, -1.348055, 1, 0, 0, 1, 1,
-1.140026, 1.280899, -0.6810373, 1, 0, 0, 1, 1,
-1.136906, -0.1981444, -1.747801, 1, 0, 0, 1, 1,
-1.135264, -1.982748, -2.919176, 1, 0, 0, 1, 1,
-1.134545, -0.1761391, -1.483457, 1, 0, 0, 1, 1,
-1.117703, -0.5816367, -1.815273, 0, 0, 0, 1, 1,
-1.11583, -1.821085, -4.068102, 0, 0, 0, 1, 1,
-1.107542, 1.162348, 0.4947269, 0, 0, 0, 1, 1,
-1.104025, 0.08653885, -0.07029162, 0, 0, 0, 1, 1,
-1.103349, 0.2940421, -2.161489, 0, 0, 0, 1, 1,
-1.101952, -2.206475, -2.35196, 0, 0, 0, 1, 1,
-1.101475, 0.7270474, -1.392789, 0, 0, 0, 1, 1,
-1.083024, 0.2955762, -2.05415, 1, 1, 1, 1, 1,
-1.076633, 1.15156, -0.733775, 1, 1, 1, 1, 1,
-1.074382, 0.5678872, -0.3091343, 1, 1, 1, 1, 1,
-1.070678, 0.2664416, -1.803551, 1, 1, 1, 1, 1,
-1.065361, 1.812714, -3.073068, 1, 1, 1, 1, 1,
-1.065346, 1.274325, -0.6058998, 1, 1, 1, 1, 1,
-1.063773, 0.9710523, -1.008967, 1, 1, 1, 1, 1,
-1.058849, 0.9809525, -2.526545, 1, 1, 1, 1, 1,
-1.056595, 0.2060927, -2.472709, 1, 1, 1, 1, 1,
-1.044614, 2.386098, -1.604351, 1, 1, 1, 1, 1,
-1.039822, -0.9692068, -2.049055, 1, 1, 1, 1, 1,
-1.034679, -0.4038614, -1.060778, 1, 1, 1, 1, 1,
-1.015769, 0.2485183, -0.6187608, 1, 1, 1, 1, 1,
-1.008718, 0.1640569, -2.313686, 1, 1, 1, 1, 1,
-1.004028, -0.3646231, -3.003166, 1, 1, 1, 1, 1,
-1.002124, 0.3853659, -0.6252471, 0, 0, 1, 1, 1,
-1.000813, 0.728112, -0.6762081, 1, 0, 0, 1, 1,
-0.9957086, 0.3570548, -1.49098, 1, 0, 0, 1, 1,
-0.9852815, -0.7511966, -1.787499, 1, 0, 0, 1, 1,
-0.9835925, 0.1699454, 0.06202812, 1, 0, 0, 1, 1,
-0.9823333, -0.3807212, -2.345237, 1, 0, 0, 1, 1,
-0.973673, -0.1930135, -2.420295, 0, 0, 0, 1, 1,
-0.9731621, -0.8018625, -1.490441, 0, 0, 0, 1, 1,
-0.9717731, 1.2486, -0.8792576, 0, 0, 0, 1, 1,
-0.9704506, -0.3950428, -2.036762, 0, 0, 0, 1, 1,
-0.9652885, -0.310578, -2.698041, 0, 0, 0, 1, 1,
-0.9572146, -0.1924721, -1.012321, 0, 0, 0, 1, 1,
-0.9568323, 0.8842546, 0.1353897, 0, 0, 0, 1, 1,
-0.9379884, -0.4700714, -0.7819868, 1, 1, 1, 1, 1,
-0.9377487, 0.9568173, -2.57616, 1, 1, 1, 1, 1,
-0.9362818, -0.0965374, -1.242472, 1, 1, 1, 1, 1,
-0.9343891, 0.5436715, -1.470983, 1, 1, 1, 1, 1,
-0.9318129, 1.637417, -0.2246726, 1, 1, 1, 1, 1,
-0.9298778, 0.8498031, -0.8872001, 1, 1, 1, 1, 1,
-0.9273468, 0.1914659, -1.572068, 1, 1, 1, 1, 1,
-0.920405, 0.3317813, -1.576818, 1, 1, 1, 1, 1,
-0.9126931, 1.340439, -1.549736, 1, 1, 1, 1, 1,
-0.9118957, -1.083361, -3.369796, 1, 1, 1, 1, 1,
-0.909813, 0.6849236, -0.9774834, 1, 1, 1, 1, 1,
-0.8940709, 0.4829265, 0.09679963, 1, 1, 1, 1, 1,
-0.8937367, 0.6865982, -0.7002491, 1, 1, 1, 1, 1,
-0.8919595, 0.1854841, -2.572574, 1, 1, 1, 1, 1,
-0.8889801, -0.07860995, -1.363125, 1, 1, 1, 1, 1,
-0.8844129, 0.3755953, -2.467978, 0, 0, 1, 1, 1,
-0.8787505, 0.7834291, -0.6861116, 1, 0, 0, 1, 1,
-0.8740734, 1.583122, -1.650755, 1, 0, 0, 1, 1,
-0.8655477, -0.4847486, -0.5549896, 1, 0, 0, 1, 1,
-0.8543286, -1.168735, -2.404643, 1, 0, 0, 1, 1,
-0.8529534, 0.3468379, -0.6147789, 1, 0, 0, 1, 1,
-0.8521528, 0.4436537, -0.8668602, 0, 0, 0, 1, 1,
-0.8480649, -0.4085966, -1.499482, 0, 0, 0, 1, 1,
-0.8477693, -0.07951926, -0.785902, 0, 0, 0, 1, 1,
-0.8477371, -0.687095, -1.811789, 0, 0, 0, 1, 1,
-0.8458464, 0.1012617, -1.599991, 0, 0, 0, 1, 1,
-0.8399825, -2.51443, -3.702666, 0, 0, 0, 1, 1,
-0.8399176, -0.07478607, -3.614005, 0, 0, 0, 1, 1,
-0.8365002, -0.9057212, -3.311634, 1, 1, 1, 1, 1,
-0.8334873, -1.628814, -5.193868, 1, 1, 1, 1, 1,
-0.833469, -1.682759, -2.058391, 1, 1, 1, 1, 1,
-0.8315198, 0.04792896, -1.813596, 1, 1, 1, 1, 1,
-0.8311476, -0.6081361, -1.692311, 1, 1, 1, 1, 1,
-0.8308693, -0.4778952, -2.014213, 1, 1, 1, 1, 1,
-0.8264515, 0.1855935, -1.855319, 1, 1, 1, 1, 1,
-0.825918, -1.162637, -2.67206, 1, 1, 1, 1, 1,
-0.8252028, -1.858096, -4.031541, 1, 1, 1, 1, 1,
-0.8248632, 1.627976, -0.6607502, 1, 1, 1, 1, 1,
-0.8207789, 1.083218, -1.077903, 1, 1, 1, 1, 1,
-0.8030417, -0.4724035, -1.736734, 1, 1, 1, 1, 1,
-0.790537, 0.3577953, -0.2628603, 1, 1, 1, 1, 1,
-0.7890654, -1.692921, -2.999289, 1, 1, 1, 1, 1,
-0.7860907, -0.2337824, -1.271267, 1, 1, 1, 1, 1,
-0.7857259, 0.04371518, -0.07645039, 0, 0, 1, 1, 1,
-0.7812771, -0.903658, -1.941189, 1, 0, 0, 1, 1,
-0.7788047, 0.3469676, -2.942407, 1, 0, 0, 1, 1,
-0.778666, -1.795521, -3.200856, 1, 0, 0, 1, 1,
-0.7784146, 0.09315538, -0.5513483, 1, 0, 0, 1, 1,
-0.7748015, -0.8476399, -2.436639, 1, 0, 0, 1, 1,
-0.7742152, 0.3159705, -1.432806, 0, 0, 0, 1, 1,
-0.7690687, 0.2319563, -1.281668, 0, 0, 0, 1, 1,
-0.7641061, 0.5415216, -0.524407, 0, 0, 0, 1, 1,
-0.7592492, -0.1793066, 0.6453503, 0, 0, 0, 1, 1,
-0.7572574, 0.7738963, 0.4269516, 0, 0, 0, 1, 1,
-0.7565485, -0.5361165, -2.396725, 0, 0, 0, 1, 1,
-0.7535008, 0.5773386, 0.1756534, 0, 0, 0, 1, 1,
-0.7520739, 0.4065445, 0.5595967, 1, 1, 1, 1, 1,
-0.7408646, 0.200127, -2.826294, 1, 1, 1, 1, 1,
-0.7397038, 0.7883899, -0.95367, 1, 1, 1, 1, 1,
-0.7379508, -0.04983725, -1.691744, 1, 1, 1, 1, 1,
-0.7343337, -0.170909, -0.5429276, 1, 1, 1, 1, 1,
-0.7341316, 1.118011, -0.9374638, 1, 1, 1, 1, 1,
-0.7322069, 0.109326, -1.874931, 1, 1, 1, 1, 1,
-0.7292433, -0.9207737, -0.7986189, 1, 1, 1, 1, 1,
-0.7257511, 0.3935469, -1.424208, 1, 1, 1, 1, 1,
-0.720475, -0.8551254, -2.373723, 1, 1, 1, 1, 1,
-0.7177389, 0.1256568, -0.1513703, 1, 1, 1, 1, 1,
-0.7143537, 0.5444182, -1.67081, 1, 1, 1, 1, 1,
-0.711257, 0.6598965, -0.757163, 1, 1, 1, 1, 1,
-0.710837, 0.210365, -1.705949, 1, 1, 1, 1, 1,
-0.7107892, -0.7889819, -0.8178326, 1, 1, 1, 1, 1,
-0.6891826, -0.4771136, -2.803998, 0, 0, 1, 1, 1,
-0.6852111, -0.1640262, -2.857397, 1, 0, 0, 1, 1,
-0.6848685, 0.7900797, -1.707679, 1, 0, 0, 1, 1,
-0.6837031, -1.128448, -2.786778, 1, 0, 0, 1, 1,
-0.6825463, -0.01238887, -0.9322922, 1, 0, 0, 1, 1,
-0.6806871, -0.6432053, -3.017141, 1, 0, 0, 1, 1,
-0.6792549, -1.754425, -4.925348, 0, 0, 0, 1, 1,
-0.6765464, 0.3211856, -2.990804, 0, 0, 0, 1, 1,
-0.6688576, 0.3256087, -1.233302, 0, 0, 0, 1, 1,
-0.6671242, 0.5956876, -1.023242, 0, 0, 0, 1, 1,
-0.6669319, 0.907812, -0.2188068, 0, 0, 0, 1, 1,
-0.6647546, -1.409193, -3.609631, 0, 0, 0, 1, 1,
-0.6635991, -1.806564, -3.138047, 0, 0, 0, 1, 1,
-0.6603528, -0.4544598, -1.679077, 1, 1, 1, 1, 1,
-0.6586169, 0.02845773, -0.0144107, 1, 1, 1, 1, 1,
-0.6526888, -0.1701789, -1.306527, 1, 1, 1, 1, 1,
-0.645826, 0.8479903, -1.108595, 1, 1, 1, 1, 1,
-0.6426814, 0.09114435, -1.808, 1, 1, 1, 1, 1,
-0.6411816, 1.60746, -1.144496, 1, 1, 1, 1, 1,
-0.6390485, 0.1062294, -1.977776, 1, 1, 1, 1, 1,
-0.638384, -1.152702, -1.149442, 1, 1, 1, 1, 1,
-0.6381549, 0.5073554, -1.747052, 1, 1, 1, 1, 1,
-0.6255714, -0.002796011, -1.026263, 1, 1, 1, 1, 1,
-0.62257, 1.081904, -0.2530703, 1, 1, 1, 1, 1,
-0.6215585, 0.9651166, -0.940227, 1, 1, 1, 1, 1,
-0.6211626, -0.5185133, -1.521827, 1, 1, 1, 1, 1,
-0.6192691, -0.1134161, -0.9767014, 1, 1, 1, 1, 1,
-0.6141796, 0.03292544, -1.339354, 1, 1, 1, 1, 1,
-0.6138549, 1.480985, -0.3413685, 0, 0, 1, 1, 1,
-0.598815, 0.3659143, -1.808781, 1, 0, 0, 1, 1,
-0.5968305, 0.7909191, 0.5253041, 1, 0, 0, 1, 1,
-0.5960417, -0.4570127, -0.6530991, 1, 0, 0, 1, 1,
-0.5944848, 0.5115303, 0.6100992, 1, 0, 0, 1, 1,
-0.5938596, -0.1713545, -2.285311, 1, 0, 0, 1, 1,
-0.5910985, -0.04191508, -1.573347, 0, 0, 0, 1, 1,
-0.5908662, 0.8247183, -1.07367, 0, 0, 0, 1, 1,
-0.5878335, -0.9527001, -3.953682, 0, 0, 0, 1, 1,
-0.5864958, 0.003780807, -0.3101259, 0, 0, 0, 1, 1,
-0.5821124, -0.2823705, -2.761205, 0, 0, 0, 1, 1,
-0.5742792, 0.5300792, 0.1312391, 0, 0, 0, 1, 1,
-0.5740615, -0.8736234, -1.891325, 0, 0, 0, 1, 1,
-0.5739397, 1.3382, -0.6867302, 1, 1, 1, 1, 1,
-0.5703641, -0.7691608, -3.234521, 1, 1, 1, 1, 1,
-0.5660197, 0.6167539, -0.5086541, 1, 1, 1, 1, 1,
-0.55878, 1.805882, -0.77575, 1, 1, 1, 1, 1,
-0.5542529, -0.5745316, -2.13854, 1, 1, 1, 1, 1,
-0.5522158, 1.385099, 0.02047324, 1, 1, 1, 1, 1,
-0.5516711, 0.2127363, -2.735095, 1, 1, 1, 1, 1,
-0.5513537, 0.5686001, -0.2137034, 1, 1, 1, 1, 1,
-0.5512848, -0.3101369, -0.9815482, 1, 1, 1, 1, 1,
-0.5487767, -0.2074584, -2.274029, 1, 1, 1, 1, 1,
-0.5461565, -0.2742688, 0.1306153, 1, 1, 1, 1, 1,
-0.5429474, 0.5680441, -0.6864342, 1, 1, 1, 1, 1,
-0.5417514, -0.04980786, -1.64412, 1, 1, 1, 1, 1,
-0.530854, -0.9656192, -3.538366, 1, 1, 1, 1, 1,
-0.5293829, -0.06832881, -1.1282, 1, 1, 1, 1, 1,
-0.5275297, -0.8497543, -1.998744, 0, 0, 1, 1, 1,
-0.5272014, 1.065393, -1.804509, 1, 0, 0, 1, 1,
-0.5229889, 0.8031553, 0.6616945, 1, 0, 0, 1, 1,
-0.5228244, -0.1034154, -1.277839, 1, 0, 0, 1, 1,
-0.5223829, 0.09905278, -2.066307, 1, 0, 0, 1, 1,
-0.5223809, 0.9322877, -3.201435, 1, 0, 0, 1, 1,
-0.509143, 0.8816682, 0.565508, 0, 0, 0, 1, 1,
-0.504986, -0.06113042, -0.5555739, 0, 0, 0, 1, 1,
-0.5034619, -1.865143, -3.891832, 0, 0, 0, 1, 1,
-0.4989585, 0.6285754, -1.478797, 0, 0, 0, 1, 1,
-0.4985122, 0.7595391, 0.8238201, 0, 0, 0, 1, 1,
-0.4913657, 1.287811, -1.865822, 0, 0, 0, 1, 1,
-0.4896077, -0.1866734, -0.915533, 0, 0, 0, 1, 1,
-0.4890473, -1.176406, -3.659385, 1, 1, 1, 1, 1,
-0.4849969, 1.2855, -0.03205618, 1, 1, 1, 1, 1,
-0.4831004, -0.1884329, -2.251876, 1, 1, 1, 1, 1,
-0.4786483, -0.710193, -1.5782, 1, 1, 1, 1, 1,
-0.4785445, 0.6552914, -0.3530793, 1, 1, 1, 1, 1,
-0.4775308, 0.2351847, -0.9592537, 1, 1, 1, 1, 1,
-0.4748987, 0.7551682, -0.4939223, 1, 1, 1, 1, 1,
-0.474392, -0.005786589, -1.229168, 1, 1, 1, 1, 1,
-0.4735213, 1.740835, 1.07031, 1, 1, 1, 1, 1,
-0.4697056, 1.528825, -1.837258, 1, 1, 1, 1, 1,
-0.4651982, 0.9802119, -1.429921, 1, 1, 1, 1, 1,
-0.4586172, 0.08616336, -1.262202, 1, 1, 1, 1, 1,
-0.4579613, -1.100296, -2.312087, 1, 1, 1, 1, 1,
-0.4565037, -0.6863235, -2.920255, 1, 1, 1, 1, 1,
-0.4557887, -0.187514, -0.2400561, 1, 1, 1, 1, 1,
-0.4479515, 0.6613762, 0.0357024, 0, 0, 1, 1, 1,
-0.4421366, -2.050927, -3.17978, 1, 0, 0, 1, 1,
-0.4419053, 0.6578894, -1.773765, 1, 0, 0, 1, 1,
-0.4363085, 0.826306, 0.6786349, 1, 0, 0, 1, 1,
-0.4356914, -0.6128169, -1.391077, 1, 0, 0, 1, 1,
-0.4344097, 0.348095, -1.862717, 1, 0, 0, 1, 1,
-0.4320009, 0.9270934, -0.2524044, 0, 0, 0, 1, 1,
-0.4307016, 0.505361, -2.472046, 0, 0, 0, 1, 1,
-0.4296147, -0.5869853, -1.200801, 0, 0, 0, 1, 1,
-0.4285282, 0.3523912, -1.544014, 0, 0, 0, 1, 1,
-0.4282576, -0.1310554, -1.157869, 0, 0, 0, 1, 1,
-0.4255684, 1.228088, -1.420773, 0, 0, 0, 1, 1,
-0.424928, 0.6961935, -0.1242345, 0, 0, 0, 1, 1,
-0.4228568, 0.8121103, -0.7444564, 1, 1, 1, 1, 1,
-0.4177261, 0.1039397, -1.361825, 1, 1, 1, 1, 1,
-0.4170042, 1.358189, -1.003636, 1, 1, 1, 1, 1,
-0.4148792, 0.1215133, -1.818421, 1, 1, 1, 1, 1,
-0.4068559, 1.032709, -1.937824, 1, 1, 1, 1, 1,
-0.4055955, 1.317189, 0.5880433, 1, 1, 1, 1, 1,
-0.4015801, 0.261578, -0.224765, 1, 1, 1, 1, 1,
-0.4001831, 2.94024, 1.281429, 1, 1, 1, 1, 1,
-0.3990402, 0.9176518, -0.3154129, 1, 1, 1, 1, 1,
-0.3977329, 0.07075585, -1.937161, 1, 1, 1, 1, 1,
-0.3977309, -1.940869, -3.494704, 1, 1, 1, 1, 1,
-0.3954801, -0.113706, -1.778632, 1, 1, 1, 1, 1,
-0.3953493, -0.9628541, -2.072323, 1, 1, 1, 1, 1,
-0.3945131, 1.829543, -1.359181, 1, 1, 1, 1, 1,
-0.3935885, -0.7186872, -1.798782, 1, 1, 1, 1, 1,
-0.3848888, 1.093948, -0.8335795, 0, 0, 1, 1, 1,
-0.3813743, 2.594398, -1.535965, 1, 0, 0, 1, 1,
-0.3810612, 0.01961697, -1.490458, 1, 0, 0, 1, 1,
-0.3793558, -1.800527, -2.437688, 1, 0, 0, 1, 1,
-0.3661976, -0.6763042, -1.900982, 1, 0, 0, 1, 1,
-0.3611639, -0.5832348, -3.356852, 1, 0, 0, 1, 1,
-0.3569956, -1.287777, -1.967376, 0, 0, 0, 1, 1,
-0.3548179, 0.8138896, -0.1466524, 0, 0, 0, 1, 1,
-0.3541762, -0.6853611, -3.697032, 0, 0, 0, 1, 1,
-0.3520493, 0.03147532, -1.455435, 0, 0, 0, 1, 1,
-0.3520084, 0.1968968, -0.2546894, 0, 0, 0, 1, 1,
-0.3413836, -0.08029228, -2.094378, 0, 0, 0, 1, 1,
-0.3364711, -1.719669, -3.403508, 0, 0, 0, 1, 1,
-0.3359886, 0.6562724, 1.442641, 1, 1, 1, 1, 1,
-0.3357869, -1.136995, -3.377463, 1, 1, 1, 1, 1,
-0.3299978, -0.9112505, -1.43962, 1, 1, 1, 1, 1,
-0.3290201, 1.737824, -0.04862148, 1, 1, 1, 1, 1,
-0.3280862, -0.6152921, -2.277444, 1, 1, 1, 1, 1,
-0.3260514, -1.0426, -3.556207, 1, 1, 1, 1, 1,
-0.3246965, 0.6219858, -0.4642772, 1, 1, 1, 1, 1,
-0.3243946, 0.1338247, -1.102674, 1, 1, 1, 1, 1,
-0.3200541, -0.7935777, -4.538128, 1, 1, 1, 1, 1,
-0.3186651, 0.8098803, -1.442563, 1, 1, 1, 1, 1,
-0.3124057, 1.467499, 0.7492855, 1, 1, 1, 1, 1,
-0.3081307, 0.313401, -2.409457, 1, 1, 1, 1, 1,
-0.3077304, 0.1671566, 0.6617082, 1, 1, 1, 1, 1,
-0.306986, 0.422553, -2.120417, 1, 1, 1, 1, 1,
-0.3063471, 1.908687, -0.4626102, 1, 1, 1, 1, 1,
-0.305125, 1.423406, 0.8578256, 0, 0, 1, 1, 1,
-0.304627, 0.6183495, 0.05462476, 1, 0, 0, 1, 1,
-0.3035631, -0.7901486, -3.901249, 1, 0, 0, 1, 1,
-0.302155, 0.1120612, -1.999464, 1, 0, 0, 1, 1,
-0.301743, 0.1482823, -3.12227, 1, 0, 0, 1, 1,
-0.2972396, -0.8127304, -1.095803, 1, 0, 0, 1, 1,
-0.2961129, -0.6482261, -4.414114, 0, 0, 0, 1, 1,
-0.2944717, 0.3567784, -0.2019577, 0, 0, 0, 1, 1,
-0.2888789, 0.2569752, -1.786569, 0, 0, 0, 1, 1,
-0.2872329, -0.3248089, -3.685894, 0, 0, 0, 1, 1,
-0.2839768, 0.7731842, 0.7639129, 0, 0, 0, 1, 1,
-0.2756747, -0.009479734, -1.943336, 0, 0, 0, 1, 1,
-0.2745351, -0.6431502, -2.927215, 0, 0, 0, 1, 1,
-0.2743706, 2.142158, -0.2218819, 1, 1, 1, 1, 1,
-0.2728002, -0.0658519, -0.4523736, 1, 1, 1, 1, 1,
-0.2658332, -0.08806384, -1.498715, 1, 1, 1, 1, 1,
-0.262285, 0.6470042, -0.530053, 1, 1, 1, 1, 1,
-0.2617223, -1.066337, -2.421315, 1, 1, 1, 1, 1,
-0.2598068, 0.2786935, -1.939862, 1, 1, 1, 1, 1,
-0.2571502, -0.9600013, -4.483339, 1, 1, 1, 1, 1,
-0.2560948, 1.53813, -1.129926, 1, 1, 1, 1, 1,
-0.2530687, 0.5099027, -1.373196, 1, 1, 1, 1, 1,
-0.2502493, 0.07239761, 0.6387241, 1, 1, 1, 1, 1,
-0.2482767, 0.765627, -1.508504, 1, 1, 1, 1, 1,
-0.2467462, 0.01470025, -2.215893, 1, 1, 1, 1, 1,
-0.244031, 0.1638663, -0.9311364, 1, 1, 1, 1, 1,
-0.2410042, -0.4448424, -3.536352, 1, 1, 1, 1, 1,
-0.2390377, 0.1995821, -2.237768, 1, 1, 1, 1, 1,
-0.2340749, 0.5156867, 1.793383, 0, 0, 1, 1, 1,
-0.2315391, -0.8886554, -3.541512, 1, 0, 0, 1, 1,
-0.2278203, 0.1178143, -0.3605715, 1, 0, 0, 1, 1,
-0.224213, -1.050925, -3.789445, 1, 0, 0, 1, 1,
-0.2199475, -0.1817991, -1.970276, 1, 0, 0, 1, 1,
-0.2191662, 0.4672628, -0.04815439, 1, 0, 0, 1, 1,
-0.2122925, 0.4322564, -0.4031262, 0, 0, 0, 1, 1,
-0.2064383, 0.4240704, -0.1886369, 0, 0, 0, 1, 1,
-0.2058584, 0.9365339, 1.525918, 0, 0, 0, 1, 1,
-0.2049181, -2.258962, -4.147576, 0, 0, 0, 1, 1,
-0.2010895, 0.4360733, -1.314489, 0, 0, 0, 1, 1,
-0.1938942, 1.234141, 3.284698, 0, 0, 0, 1, 1,
-0.1927814, 0.6738384, 0.7212483, 0, 0, 0, 1, 1,
-0.1923313, -1.207012, -5.100647, 1, 1, 1, 1, 1,
-0.1888029, 1.227959, -1.001064, 1, 1, 1, 1, 1,
-0.1867523, 1.407955, -1.187685, 1, 1, 1, 1, 1,
-0.1740482, -0.9162839, -5.636889, 1, 1, 1, 1, 1,
-0.1718381, 0.1620992, -1.533738, 1, 1, 1, 1, 1,
-0.1701112, 0.3506756, -1.566535, 1, 1, 1, 1, 1,
-0.1691738, 1.496649, -0.8679273, 1, 1, 1, 1, 1,
-0.1691724, 1.396932, 1.682818, 1, 1, 1, 1, 1,
-0.1673399, -0.7959851, -3.629593, 1, 1, 1, 1, 1,
-0.1652584, 0.785305, -0.2575254, 1, 1, 1, 1, 1,
-0.1611601, -0.02759833, -0.3778116, 1, 1, 1, 1, 1,
-0.1567695, -0.400975, -2.467389, 1, 1, 1, 1, 1,
-0.1547201, 1.663876, -1.503012, 1, 1, 1, 1, 1,
-0.1536522, -0.4340565, -3.05445, 1, 1, 1, 1, 1,
-0.1532456, -0.2017252, -4.296706, 1, 1, 1, 1, 1,
-0.1486544, 0.842095, -0.4390709, 0, 0, 1, 1, 1,
-0.1467141, -0.2851651, -1.639447, 1, 0, 0, 1, 1,
-0.1430236, -2.206355, -4.034714, 1, 0, 0, 1, 1,
-0.1389749, -0.1998633, -2.68185, 1, 0, 0, 1, 1,
-0.138011, -1.005347, -2.004111, 1, 0, 0, 1, 1,
-0.1331608, -0.02872501, -0.06039979, 1, 0, 0, 1, 1,
-0.132733, -0.4317643, -1.68165, 0, 0, 0, 1, 1,
-0.1319645, -0.5199717, -2.103219, 0, 0, 0, 1, 1,
-0.1310074, -0.1306419, -4.114486, 0, 0, 0, 1, 1,
-0.1148192, -0.8858842, -4.813461, 0, 0, 0, 1, 1,
-0.1127579, -0.4005329, -4.762607, 0, 0, 0, 1, 1,
-0.1115198, 0.1372386, -0.7346365, 0, 0, 0, 1, 1,
-0.1106668, -1.741929, -2.560663, 0, 0, 0, 1, 1,
-0.1091601, 0.1736706, 0.4969631, 1, 1, 1, 1, 1,
-0.1053988, 0.2490975, -0.4282706, 1, 1, 1, 1, 1,
-0.1031432, -1.284787, -1.192605, 1, 1, 1, 1, 1,
-0.1016747, 0.2517977, -2.620221, 1, 1, 1, 1, 1,
-0.1002416, -1.853103, -1.592718, 1, 1, 1, 1, 1,
-0.0987925, -1.372916, -0.6500283, 1, 1, 1, 1, 1,
-0.0987279, 1.036332, -0.2586976, 1, 1, 1, 1, 1,
-0.0958425, -0.9115101, -2.876167, 1, 1, 1, 1, 1,
-0.09185962, 0.2089661, -0.1050973, 1, 1, 1, 1, 1,
-0.09022057, 0.4735987, 1.447022, 1, 1, 1, 1, 1,
-0.08915119, -0.5294001, -2.109717, 1, 1, 1, 1, 1,
-0.08767463, 0.8670157, -0.6448272, 1, 1, 1, 1, 1,
-0.08630604, -0.9658028, -1.545341, 1, 1, 1, 1, 1,
-0.08614348, -1.339188, -4.153502, 1, 1, 1, 1, 1,
-0.08084008, 1.261361, -0.7939555, 1, 1, 1, 1, 1,
-0.07902839, -1.964958, -2.545498, 0, 0, 1, 1, 1,
-0.07863288, -0.2212706, -2.295635, 1, 0, 0, 1, 1,
-0.07802485, -0.9362414, -2.51264, 1, 0, 0, 1, 1,
-0.07773939, -0.3467549, -2.910564, 1, 0, 0, 1, 1,
-0.07708807, 1.108384, -0.3994249, 1, 0, 0, 1, 1,
-0.07600882, 0.7326879, -1.815832, 1, 0, 0, 1, 1,
-0.0661111, 1.169788, -0.646529, 0, 0, 0, 1, 1,
-0.06561604, 0.8231205, 0.0802926, 0, 0, 0, 1, 1,
-0.06395993, -0.909237, -3.665401, 0, 0, 0, 1, 1,
-0.06266654, -0.5123461, -4.026442, 0, 0, 0, 1, 1,
-0.05380465, 0.0976292, -0.1276099, 0, 0, 0, 1, 1,
-0.05302472, 0.6111825, 0.5498354, 0, 0, 0, 1, 1,
-0.05238904, 0.7094238, 1.609892, 0, 0, 0, 1, 1,
-0.04896623, 0.8971153, 0.555068, 1, 1, 1, 1, 1,
-0.04181757, -0.08186461, -2.527732, 1, 1, 1, 1, 1,
-0.03818318, 0.4072953, -0.8879634, 1, 1, 1, 1, 1,
-0.035557, -0.5322304, -1.710359, 1, 1, 1, 1, 1,
-0.03234055, -0.3068666, -2.750466, 1, 1, 1, 1, 1,
-0.03190318, -0.550239, -2.879024, 1, 1, 1, 1, 1,
-0.02729354, 0.7609875, -0.1958268, 1, 1, 1, 1, 1,
-0.02484808, 1.046295, 1.275459, 1, 1, 1, 1, 1,
-0.02335003, 0.9667835, 0.379269, 1, 1, 1, 1, 1,
-0.02176977, -1.154179, -3.362995, 1, 1, 1, 1, 1,
-0.01868677, 2.200941, -0.4979114, 1, 1, 1, 1, 1,
-0.01682739, 1.152025, 0.5406287, 1, 1, 1, 1, 1,
-0.01589816, 0.07006895, -0.04987222, 1, 1, 1, 1, 1,
-0.01380065, 0.7827065, 1.636861, 1, 1, 1, 1, 1,
-0.0054559, 0.2479522, 0.6192814, 1, 1, 1, 1, 1,
-0.003942263, 0.4965466, 1.094965, 0, 0, 1, 1, 1,
-0.0004637315, 0.04250222, -1.34455, 1, 0, 0, 1, 1,
0.001862668, 0.6753591, 0.137576, 1, 0, 0, 1, 1,
0.003815671, 0.6801629, 1.55925, 1, 0, 0, 1, 1,
0.007072258, -0.6515296, 2.667711, 1, 0, 0, 1, 1,
0.009734617, -0.1312327, 4.574813, 1, 0, 0, 1, 1,
0.01037622, -0.2717921, 3.099185, 0, 0, 0, 1, 1,
0.01051094, -0.4493394, 3.029331, 0, 0, 0, 1, 1,
0.01293336, -0.6412933, 4.862793, 0, 0, 0, 1, 1,
0.01493221, -3.36175, 4.100883, 0, 0, 0, 1, 1,
0.02099486, -0.8167105, 2.642232, 0, 0, 0, 1, 1,
0.02480279, -0.1634677, 2.308336, 0, 0, 0, 1, 1,
0.0269619, -1.008436, 3.249746, 0, 0, 0, 1, 1,
0.02809334, -0.2668136, 3.576638, 1, 1, 1, 1, 1,
0.02937146, 0.9387644, 0.2403034, 1, 1, 1, 1, 1,
0.03072257, -0.3329894, 3.889799, 1, 1, 1, 1, 1,
0.0320381, -1.545742, 5.065804, 1, 1, 1, 1, 1,
0.03457972, 0.33442, 0.9663944, 1, 1, 1, 1, 1,
0.03459943, 0.3847026, -0.3668027, 1, 1, 1, 1, 1,
0.03480792, -0.8683019, 3.881113, 1, 1, 1, 1, 1,
0.03642255, 0.4512542, 0.5355659, 1, 1, 1, 1, 1,
0.03902074, -0.7724229, 3.077284, 1, 1, 1, 1, 1,
0.04267681, 0.7903495, 1.131546, 1, 1, 1, 1, 1,
0.04892059, 0.7279107, 0.7229518, 1, 1, 1, 1, 1,
0.04927419, -1.655165, 4.288554, 1, 1, 1, 1, 1,
0.05258157, -0.9759719, 3.770421, 1, 1, 1, 1, 1,
0.05946311, -1.353142, 3.887204, 1, 1, 1, 1, 1,
0.06541248, -0.5363203, 4.970393, 1, 1, 1, 1, 1,
0.06612024, 0.05397633, 1.072473, 0, 0, 1, 1, 1,
0.06775995, 1.057047, -0.4756876, 1, 0, 0, 1, 1,
0.07090403, -0.4116686, 5.533654, 1, 0, 0, 1, 1,
0.07179348, 1.429782, -0.507317, 1, 0, 0, 1, 1,
0.07383731, -2.086782, 2.633488, 1, 0, 0, 1, 1,
0.07408862, -0.01107399, 2.142696, 1, 0, 0, 1, 1,
0.07477538, -0.1388195, 1.743263, 0, 0, 0, 1, 1,
0.07778118, -0.3192902, 2.32353, 0, 0, 0, 1, 1,
0.08277646, -1.217427, 3.106638, 0, 0, 0, 1, 1,
0.08614224, -1.55746, 2.903942, 0, 0, 0, 1, 1,
0.08790447, 0.4857848, -0.948888, 0, 0, 0, 1, 1,
0.08914353, 1.287883, -0.9200587, 0, 0, 0, 1, 1,
0.09258697, -0.681564, 1.719033, 0, 0, 0, 1, 1,
0.0932244, 2.567251, 0.6476643, 1, 1, 1, 1, 1,
0.09422493, -0.8086024, 1.175652, 1, 1, 1, 1, 1,
0.0946738, 0.8121893, -2.239691, 1, 1, 1, 1, 1,
0.09574535, 0.02247153, 1.598157, 1, 1, 1, 1, 1,
0.09772248, -0.2278302, 2.407492, 1, 1, 1, 1, 1,
0.1008075, -1.415617, 1.347398, 1, 1, 1, 1, 1,
0.1030367, -0.8760862, 1.747149, 1, 1, 1, 1, 1,
0.1043352, 0.1594034, -0.6441442, 1, 1, 1, 1, 1,
0.112051, -1.159574, 4.245654, 1, 1, 1, 1, 1,
0.1141412, -1.110427, 1.573623, 1, 1, 1, 1, 1,
0.1141972, 0.4938035, 1.247498, 1, 1, 1, 1, 1,
0.1147412, -1.437659, 3.858222, 1, 1, 1, 1, 1,
0.1151521, -1.410731, 2.762891, 1, 1, 1, 1, 1,
0.1182253, 0.431308, -0.1300535, 1, 1, 1, 1, 1,
0.1184952, 0.7820849, 0.6375729, 1, 1, 1, 1, 1,
0.1236501, -0.6261484, 0.9452782, 0, 0, 1, 1, 1,
0.1265078, 0.5182236, 0.514797, 1, 0, 0, 1, 1,
0.1293118, 0.9114833, -0.2910724, 1, 0, 0, 1, 1,
0.1333244, -0.06370576, 3.082887, 1, 0, 0, 1, 1,
0.1407601, -2.489848, 3.770339, 1, 0, 0, 1, 1,
0.1419308, -0.4918187, 3.279203, 1, 0, 0, 1, 1,
0.1424069, 0.3502558, -0.7206529, 0, 0, 0, 1, 1,
0.1431048, 2.216606, -2.805886, 0, 0, 0, 1, 1,
0.1444505, 0.3193893, 0.1003447, 0, 0, 0, 1, 1,
0.1450623, -0.2750576, 3.573514, 0, 0, 0, 1, 1,
0.1458319, -1.656306, 1.996162, 0, 0, 0, 1, 1,
0.1479159, -1.917191, 2.622812, 0, 0, 0, 1, 1,
0.1523527, -0.8282439, 2.525425, 0, 0, 0, 1, 1,
0.1533066, -0.09175715, 0.3837434, 1, 1, 1, 1, 1,
0.1548933, -0.1757824, 1.740256, 1, 1, 1, 1, 1,
0.155145, -0.7154925, 2.878192, 1, 1, 1, 1, 1,
0.1554932, 1.381708, -0.01741734, 1, 1, 1, 1, 1,
0.1581259, 0.5390572, 1.264923, 1, 1, 1, 1, 1,
0.1601296, 1.079715, -1.477979, 1, 1, 1, 1, 1,
0.1611847, 2.762357, 1.494492, 1, 1, 1, 1, 1,
0.1663094, -0.6792993, 2.158328, 1, 1, 1, 1, 1,
0.1663945, -0.8680368, 2.283156, 1, 1, 1, 1, 1,
0.1683734, -0.120992, 1.842325, 1, 1, 1, 1, 1,
0.1698743, -0.1854635, 2.504558, 1, 1, 1, 1, 1,
0.1721072, 0.3664529, 1.160248, 1, 1, 1, 1, 1,
0.1767134, 1.331211, 2.03906, 1, 1, 1, 1, 1,
0.1831059, 0.0642295, 1.573889, 1, 1, 1, 1, 1,
0.1840336, -0.6387905, 2.522721, 1, 1, 1, 1, 1,
0.1843733, 0.6050381, -0.356865, 0, 0, 1, 1, 1,
0.1912243, 0.7877719, -2.371825, 1, 0, 0, 1, 1,
0.1920986, -1.719111, 3.484554, 1, 0, 0, 1, 1,
0.1931318, -0.6514831, 2.355913, 1, 0, 0, 1, 1,
0.1942585, 0.5254941, -1.226522, 1, 0, 0, 1, 1,
0.1944199, -0.5466818, 1.550651, 1, 0, 0, 1, 1,
0.1956278, 0.8927637, -2.024306, 0, 0, 0, 1, 1,
0.1968684, -0.1099117, 1.900813, 0, 0, 0, 1, 1,
0.1978648, -0.2495558, -0.1176145, 0, 0, 0, 1, 1,
0.1982248, -1.195568, 2.791686, 0, 0, 0, 1, 1,
0.1983095, -1.336738, 3.523583, 0, 0, 0, 1, 1,
0.2026112, 1.301167, -1.127084, 0, 0, 0, 1, 1,
0.2044942, -1.322967, 2.684639, 0, 0, 0, 1, 1,
0.2108038, -0.8063722, 2.517998, 1, 1, 1, 1, 1,
0.2135037, -0.5573884, 1.870545, 1, 1, 1, 1, 1,
0.2150533, -0.7141998, 2.404037, 1, 1, 1, 1, 1,
0.2152588, 0.6001829, 0.1203322, 1, 1, 1, 1, 1,
0.218748, 0.8636696, -0.2981302, 1, 1, 1, 1, 1,
0.2210205, -0.063715, 0.9904608, 1, 1, 1, 1, 1,
0.2248156, 0.282121, 0.9504318, 1, 1, 1, 1, 1,
0.2283016, 0.1142105, 0.7110816, 1, 1, 1, 1, 1,
0.2301772, 0.7363281, 0.3780469, 1, 1, 1, 1, 1,
0.2308584, -0.2285722, 3.284325, 1, 1, 1, 1, 1,
0.2322121, 0.5138249, -0.505099, 1, 1, 1, 1, 1,
0.2327733, 2.266019, 0.2048342, 1, 1, 1, 1, 1,
0.2329464, -0.7862793, 2.94065, 1, 1, 1, 1, 1,
0.2332881, -0.2959609, 2.804528, 1, 1, 1, 1, 1,
0.2346746, -0.9757992, 3.712285, 1, 1, 1, 1, 1,
0.2360395, -0.700809, 2.688553, 0, 0, 1, 1, 1,
0.2407382, -0.5988291, 1.581921, 1, 0, 0, 1, 1,
0.2433403, 0.07366862, 3.573807, 1, 0, 0, 1, 1,
0.2434554, -0.7782654, 2.899686, 1, 0, 0, 1, 1,
0.2454319, -0.6349089, 4.644142, 1, 0, 0, 1, 1,
0.2511837, 0.3745407, 1.520396, 1, 0, 0, 1, 1,
0.2516855, 0.6657531, 1.896116, 0, 0, 0, 1, 1,
0.2520601, 0.1786684, 2.082192, 0, 0, 0, 1, 1,
0.2537305, -1.642964, 3.34574, 0, 0, 0, 1, 1,
0.2538626, 0.7616533, 2.468275, 0, 0, 0, 1, 1,
0.2550113, 0.5356013, 0.153513, 0, 0, 0, 1, 1,
0.260724, 0.3553824, 1.041831, 0, 0, 0, 1, 1,
0.2617138, 1.869115, 0.4535742, 0, 0, 0, 1, 1,
0.2640487, 0.3974036, 1.189246, 1, 1, 1, 1, 1,
0.265834, 0.6629185, 0.3941555, 1, 1, 1, 1, 1,
0.2729339, -0.1492192, 1.53209, 1, 1, 1, 1, 1,
0.2735825, 1.929612, 1.103984, 1, 1, 1, 1, 1,
0.2804965, -0.2262951, 1.822161, 1, 1, 1, 1, 1,
0.2818191, -0.4907305, 1.553268, 1, 1, 1, 1, 1,
0.2856837, -1.200588, 3.598722, 1, 1, 1, 1, 1,
0.2887098, 1.95196, 1.928291, 1, 1, 1, 1, 1,
0.2901289, -0.6977602, 4.053059, 1, 1, 1, 1, 1,
0.2911119, 0.732631, 2.015082, 1, 1, 1, 1, 1,
0.2917468, -0.5645822, 3.37376, 1, 1, 1, 1, 1,
0.2940173, 0.7979711, -1.367194, 1, 1, 1, 1, 1,
0.2940843, -0.1754315, 1.696418, 1, 1, 1, 1, 1,
0.2962139, 0.9116023, -0.3350302, 1, 1, 1, 1, 1,
0.2963066, -1.341189, 2.554879, 1, 1, 1, 1, 1,
0.2966891, 0.07886116, 0.1159937, 0, 0, 1, 1, 1,
0.297439, -0.3782409, 1.628987, 1, 0, 0, 1, 1,
0.3015578, -0.6464258, 0.7658643, 1, 0, 0, 1, 1,
0.3045121, -0.8909865, 3.364485, 1, 0, 0, 1, 1,
0.3045411, 0.1725073, -0.7513757, 1, 0, 0, 1, 1,
0.304649, -0.2096467, 1.30991, 1, 0, 0, 1, 1,
0.3053079, 1.384635, 1.054471, 0, 0, 0, 1, 1,
0.3126732, -0.1377141, 2.190279, 0, 0, 0, 1, 1,
0.3166716, 1.357683, -0.901538, 0, 0, 0, 1, 1,
0.3175721, -0.2356661, 2.545016, 0, 0, 0, 1, 1,
0.3244706, -0.10694, 0.5269322, 0, 0, 0, 1, 1,
0.3321235, -0.5152434, 4.202708, 0, 0, 0, 1, 1,
0.3335165, 1.151315, -1.824321, 0, 0, 0, 1, 1,
0.3351015, 0.3499832, -0.003995644, 1, 1, 1, 1, 1,
0.3375613, -0.2945345, 1.965208, 1, 1, 1, 1, 1,
0.3415222, -0.6772408, 4.05109, 1, 1, 1, 1, 1,
0.3443664, 0.5465104, -1.082707, 1, 1, 1, 1, 1,
0.3461674, -1.210814, 0.2982755, 1, 1, 1, 1, 1,
0.3481987, -1.866975, 2.803796, 1, 1, 1, 1, 1,
0.3534893, 0.6710339, -0.08606227, 1, 1, 1, 1, 1,
0.3561054, 1.470937, 0.6658201, 1, 1, 1, 1, 1,
0.3597344, 0.05179548, 0.09182946, 1, 1, 1, 1, 1,
0.3604058, -1.844502, 3.411731, 1, 1, 1, 1, 1,
0.3632483, -0.352968, 1.993539, 1, 1, 1, 1, 1,
0.3667533, -0.9849371, 3.607751, 1, 1, 1, 1, 1,
0.3772495, 0.498388, 0.2534773, 1, 1, 1, 1, 1,
0.3816085, -1.580555, 3.418921, 1, 1, 1, 1, 1,
0.3858733, 0.03871465, 2.665635, 1, 1, 1, 1, 1,
0.3892833, 1.515433, 0.6013039, 0, 0, 1, 1, 1,
0.3999923, -2.156536, 4.571244, 1, 0, 0, 1, 1,
0.4092505, 1.984775, -1.156779, 1, 0, 0, 1, 1,
0.4092721, 1.191772, 0.4464053, 1, 0, 0, 1, 1,
0.4120297, 1.208506, 0.8350701, 1, 0, 0, 1, 1,
0.4151087, -0.5024477, 2.452491, 1, 0, 0, 1, 1,
0.4158546, 2.195734, 0.1519994, 0, 0, 0, 1, 1,
0.4174552, -0.2136702, 1.635777, 0, 0, 0, 1, 1,
0.4264532, -0.4839687, 2.684566, 0, 0, 0, 1, 1,
0.4266158, 0.187196, -0.4464706, 0, 0, 0, 1, 1,
0.4323572, 0.5418896, 1.320386, 0, 0, 0, 1, 1,
0.4344655, 1.238972, 0.8934178, 0, 0, 0, 1, 1,
0.4366065, -1.509889, 2.810758, 0, 0, 0, 1, 1,
0.4378296, 0.7584441, 0.8052596, 1, 1, 1, 1, 1,
0.4460861, -1.2919, 4.484406, 1, 1, 1, 1, 1,
0.4548162, -1.009742, 2.04101, 1, 1, 1, 1, 1,
0.4571564, 1.192162, -0.1295747, 1, 1, 1, 1, 1,
0.4577592, 1.312924, 1.271112, 1, 1, 1, 1, 1,
0.4657113, 1.013266, 0.190029, 1, 1, 1, 1, 1,
0.466189, -0.606101, 2.779844, 1, 1, 1, 1, 1,
0.4666681, -2.018108, 2.58437, 1, 1, 1, 1, 1,
0.4707411, -0.8347806, 2.982261, 1, 1, 1, 1, 1,
0.4717053, 2.253783, 0.05159416, 1, 1, 1, 1, 1,
0.4754478, 1.722257, 1.219838, 1, 1, 1, 1, 1,
0.4756456, -0.601257, 2.194809, 1, 1, 1, 1, 1,
0.4791259, -0.6280888, 2.93398, 1, 1, 1, 1, 1,
0.4855497, -0.9406944, 1.838876, 1, 1, 1, 1, 1,
0.4911743, -0.1473415, 3.397657, 1, 1, 1, 1, 1,
0.4931417, 0.02227414, 2.699852, 0, 0, 1, 1, 1,
0.495433, -0.5758625, 3.328049, 1, 0, 0, 1, 1,
0.5022155, 1.170138, 1.086639, 1, 0, 0, 1, 1,
0.5049601, -0.1659893, 1.587635, 1, 0, 0, 1, 1,
0.5092799, -0.8566203, 3.406567, 1, 0, 0, 1, 1,
0.510669, -1.806834, 3.189511, 1, 0, 0, 1, 1,
0.5180564, -0.9176507, 2.063519, 0, 0, 0, 1, 1,
0.5203052, 1.798146, -0.1681218, 0, 0, 0, 1, 1,
0.5271308, -1.251435, 5.40205, 0, 0, 0, 1, 1,
0.5275865, -0.6275718, 2.093729, 0, 0, 0, 1, 1,
0.5288789, 0.9777755, 0.5858819, 0, 0, 0, 1, 1,
0.5295374, 1.051254, 1.985892, 0, 0, 0, 1, 1,
0.5307969, 0.1354417, 2.205065, 0, 0, 0, 1, 1,
0.5313848, -0.4539766, 2.022691, 1, 1, 1, 1, 1,
0.5366343, 0.9979801, 0.9953401, 1, 1, 1, 1, 1,
0.5383872, -0.2098393, 1.15202, 1, 1, 1, 1, 1,
0.5412457, -0.4723129, 3.669982, 1, 1, 1, 1, 1,
0.5457069, 2.08737, 0.4370592, 1, 1, 1, 1, 1,
0.5460659, 0.918525, 1.237718, 1, 1, 1, 1, 1,
0.5494097, -0.8033099, 2.568673, 1, 1, 1, 1, 1,
0.5494913, 1.001851, -0.0953363, 1, 1, 1, 1, 1,
0.5499105, -2.371249, 1.763284, 1, 1, 1, 1, 1,
0.5613662, -1.219175, 2.97834, 1, 1, 1, 1, 1,
0.5675896, 1.392886, 1.284919, 1, 1, 1, 1, 1,
0.5688504, 0.7981014, 0.8079035, 1, 1, 1, 1, 1,
0.5713455, 0.0006904059, 2.250401, 1, 1, 1, 1, 1,
0.5808924, -1.16091, 3.557566, 1, 1, 1, 1, 1,
0.5814738, 0.7234848, 0.5734382, 1, 1, 1, 1, 1,
0.5844598, -0.7179008, 2.356582, 0, 0, 1, 1, 1,
0.5880867, -0.7985345, 1.945134, 1, 0, 0, 1, 1,
0.5915464, 1.33158, 0.790563, 1, 0, 0, 1, 1,
0.5971397, 0.1684193, 1.611666, 1, 0, 0, 1, 1,
0.5971707, -0.08821695, 0.7729495, 1, 0, 0, 1, 1,
0.6027692, -0.5693484, 2.495524, 1, 0, 0, 1, 1,
0.6033143, 1.5395, 1.380395, 0, 0, 0, 1, 1,
0.6035826, -1.701982, 3.066846, 0, 0, 0, 1, 1,
0.605702, 0.09938681, 0.3879308, 0, 0, 0, 1, 1,
0.6158222, -0.6169375, 2.166883, 0, 0, 0, 1, 1,
0.6172006, -0.7223323, 2.162706, 0, 0, 0, 1, 1,
0.6352124, 0.1677925, -0.7498286, 0, 0, 0, 1, 1,
0.6430655, 1.812946, 0.002025347, 0, 0, 0, 1, 1,
0.6454585, 0.05595435, 2.503069, 1, 1, 1, 1, 1,
0.6503907, -2.161612, 1.79377, 1, 1, 1, 1, 1,
0.6517774, -0.5472224, 3.023584, 1, 1, 1, 1, 1,
0.6569664, 2.741678, 0.5053489, 1, 1, 1, 1, 1,
0.6599322, -1.580714, 1.978553, 1, 1, 1, 1, 1,
0.6601936, 0.2391656, 0.5799196, 1, 1, 1, 1, 1,
0.6626059, 1.160793, 1.832439, 1, 1, 1, 1, 1,
0.6628687, 0.2128223, 1.673866, 1, 1, 1, 1, 1,
0.675668, 0.3696401, 1.782568, 1, 1, 1, 1, 1,
0.6781174, -0.9952248, 3.956432, 1, 1, 1, 1, 1,
0.6842548, 0.08028904, 2.212412, 1, 1, 1, 1, 1,
0.6952065, -1.040181, 3.487916, 1, 1, 1, 1, 1,
0.6992223, 0.8680795, 0.04734715, 1, 1, 1, 1, 1,
0.7000062, 0.516852, -0.8778722, 1, 1, 1, 1, 1,
0.7061335, 1.972212, 0.3316154, 1, 1, 1, 1, 1,
0.7126285, -1.249224, 2.94797, 0, 0, 1, 1, 1,
0.7127704, -0.7129872, 4.293207, 1, 0, 0, 1, 1,
0.7130179, 0.8540233, -0.9166197, 1, 0, 0, 1, 1,
0.7177546, -1.098233, 3.546233, 1, 0, 0, 1, 1,
0.7205166, -0.5791974, 1.976887, 1, 0, 0, 1, 1,
0.7213646, -0.0867807, 3.867352, 1, 0, 0, 1, 1,
0.721842, 0.2610671, 1.901166, 0, 0, 0, 1, 1,
0.7236649, -0.348326, 1.703771, 0, 0, 0, 1, 1,
0.7271231, -0.4878105, 2.820649, 0, 0, 0, 1, 1,
0.7291505, 2.539245, -0.4091793, 0, 0, 0, 1, 1,
0.7304689, -1.214638, 1.5741, 0, 0, 0, 1, 1,
0.7358071, 1.457637, 0.08340379, 0, 0, 0, 1, 1,
0.7364249, 0.7266168, -0.4681869, 0, 0, 0, 1, 1,
0.7373137, 0.6201416, 1.645896, 1, 1, 1, 1, 1,
0.7420418, 0.284873, -1.00654, 1, 1, 1, 1, 1,
0.7548642, -1.235526, 2.212367, 1, 1, 1, 1, 1,
0.7623879, -1.245821, 3.580651, 1, 1, 1, 1, 1,
0.7655956, 0.3530589, -0.6587042, 1, 1, 1, 1, 1,
0.7671034, 0.3675764, 0.5530147, 1, 1, 1, 1, 1,
0.7685546, 0.9765474, -0.03403482, 1, 1, 1, 1, 1,
0.7690656, 1.826821, 0.1071443, 1, 1, 1, 1, 1,
0.772591, -0.2725885, 4.157062, 1, 1, 1, 1, 1,
0.7728195, 2.133803, 2.078425, 1, 1, 1, 1, 1,
0.7761542, -1.784542, 4.1675, 1, 1, 1, 1, 1,
0.7801428, -0.1972484, 1.176501, 1, 1, 1, 1, 1,
0.7822891, 1.813533, 0.01370313, 1, 1, 1, 1, 1,
0.7826202, -0.1780937, 2.375844, 1, 1, 1, 1, 1,
0.7833686, 0.420321, 1.399958, 1, 1, 1, 1, 1,
0.7871728, 0.480336, 0.8366867, 0, 0, 1, 1, 1,
0.7902032, 0.5220471, 0.9025124, 1, 0, 0, 1, 1,
0.803993, -1.275997, 1.252878, 1, 0, 0, 1, 1,
0.806308, -1.507566, 2.591421, 1, 0, 0, 1, 1,
0.8063812, -0.9073037, 0.8148815, 1, 0, 0, 1, 1,
0.8088719, 1.053394, -0.5598779, 1, 0, 0, 1, 1,
0.8127929, 0.6465576, 0.8328592, 0, 0, 0, 1, 1,
0.8132999, 1.127348, -1.426972, 0, 0, 0, 1, 1,
0.8136233, 1.53311, 0.3904612, 0, 0, 0, 1, 1,
0.8180103, -1.085011, 3.133423, 0, 0, 0, 1, 1,
0.8204998, 0.8629083, -0.05388627, 0, 0, 0, 1, 1,
0.8217361, 0.1141807, 2.198672, 0, 0, 0, 1, 1,
0.8230553, 0.0468291, 0.4369645, 0, 0, 0, 1, 1,
0.8238774, 0.3974548, -0.2224418, 1, 1, 1, 1, 1,
0.8240121, 0.3250996, 1.486555, 1, 1, 1, 1, 1,
0.8289347, -0.3140324, 3.921973, 1, 1, 1, 1, 1,
0.8309216, -1.524543, 2.019905, 1, 1, 1, 1, 1,
0.8332269, 1.155321, 1.371896, 1, 1, 1, 1, 1,
0.8383061, -0.05490622, 1.538744, 1, 1, 1, 1, 1,
0.8390052, -0.5043122, 2.517395, 1, 1, 1, 1, 1,
0.8403994, -0.7254904, 2.768381, 1, 1, 1, 1, 1,
0.8421299, -1.283654, 3.620852, 1, 1, 1, 1, 1,
0.8439736, -0.512877, 3.085603, 1, 1, 1, 1, 1,
0.8440422, -2.721285, 3.28113, 1, 1, 1, 1, 1,
0.846207, -1.430332, 3.061131, 1, 1, 1, 1, 1,
0.8464282, -0.7121245, 3.622491, 1, 1, 1, 1, 1,
0.8487989, -1.317907, 2.761651, 1, 1, 1, 1, 1,
0.8526822, -0.9169769, 2.393378, 1, 1, 1, 1, 1,
0.8528259, -0.7391799, 2.785201, 0, 0, 1, 1, 1,
0.8578628, -0.980867, 0.7193488, 1, 0, 0, 1, 1,
0.8752103, -0.5771441, 0.5577402, 1, 0, 0, 1, 1,
0.8783196, -0.967365, 0.8738775, 1, 0, 0, 1, 1,
0.8894488, 0.8814935, 0.1135699, 1, 0, 0, 1, 1,
0.893092, -0.05284809, 1.100544, 1, 0, 0, 1, 1,
0.8994675, 0.5672781, 2.675638, 0, 0, 0, 1, 1,
0.9027258, 0.3309433, 1.182089, 0, 0, 0, 1, 1,
0.918215, -1.368125, 3.447621, 0, 0, 0, 1, 1,
0.925225, 0.6446023, 2.066339, 0, 0, 0, 1, 1,
0.9260445, 1.420879, -0.2608804, 0, 0, 0, 1, 1,
0.9267427, 1.856566, 0.2333979, 0, 0, 0, 1, 1,
0.9323691, 0.7506647, 0.1470896, 0, 0, 0, 1, 1,
0.9380791, 0.4460265, -0.225436, 1, 1, 1, 1, 1,
0.9381118, -0.7991367, 3.432724, 1, 1, 1, 1, 1,
0.939224, 0.638629, 1.282033, 1, 1, 1, 1, 1,
0.9430134, -0.3743562, -0.2546381, 1, 1, 1, 1, 1,
0.9561942, 0.1629432, 0.8624333, 1, 1, 1, 1, 1,
0.9678532, -0.09777933, 2.744716, 1, 1, 1, 1, 1,
0.9694882, 0.8926554, 0.8337235, 1, 1, 1, 1, 1,
0.9699187, 0.5699444, -0.8401272, 1, 1, 1, 1, 1,
0.9736804, -0.2712407, 2.260849, 1, 1, 1, 1, 1,
0.9775149, 0.585541, 0.1687922, 1, 1, 1, 1, 1,
0.9811914, -2.06529, 0.6923482, 1, 1, 1, 1, 1,
0.9831039, 0.569573, 0.03292678, 1, 1, 1, 1, 1,
0.9865373, -0.5043492, 0.8791746, 1, 1, 1, 1, 1,
0.9896215, -0.3329372, 1.940523, 1, 1, 1, 1, 1,
0.9906784, -0.4445097, 1.655027, 1, 1, 1, 1, 1,
1.003384, 0.7794445, 0.2689275, 0, 0, 1, 1, 1,
1.005154, 0.4446155, 0.6156702, 1, 0, 0, 1, 1,
1.006692, 0.4848226, -0.3479405, 1, 0, 0, 1, 1,
1.006849, -0.05730657, 2.106363, 1, 0, 0, 1, 1,
1.023674, 0.6059637, 3.150658, 1, 0, 0, 1, 1,
1.026796, 1.719263, 2.553447, 1, 0, 0, 1, 1,
1.027825, -0.4661429, 1.837208, 0, 0, 0, 1, 1,
1.028148, -3.069366, 2.617003, 0, 0, 0, 1, 1,
1.043828, 0.003174995, -0.7245722, 0, 0, 0, 1, 1,
1.057918, 0.4777054, 0.7637581, 0, 0, 0, 1, 1,
1.061601, -1.110367, 0.6978372, 0, 0, 0, 1, 1,
1.062609, -0.1014431, 2.30604, 0, 0, 0, 1, 1,
1.062902, -0.1168549, 2.626071, 0, 0, 0, 1, 1,
1.071692, -1.488395, 0.8878257, 1, 1, 1, 1, 1,
1.081205, 2.606362, 0.2540107, 1, 1, 1, 1, 1,
1.082893, -1.971867, 4.348726, 1, 1, 1, 1, 1,
1.082941, 0.08829731, 1.737925, 1, 1, 1, 1, 1,
1.085574, 0.6754183, 1.083727, 1, 1, 1, 1, 1,
1.092318, 1.503609, 0.6577632, 1, 1, 1, 1, 1,
1.108669, -0.4842483, 1.986658, 1, 1, 1, 1, 1,
1.119695, 0.5473713, 0.8548974, 1, 1, 1, 1, 1,
1.122155, 0.8131521, 0.5334785, 1, 1, 1, 1, 1,
1.122911, -1.154963, 1.654555, 1, 1, 1, 1, 1,
1.124631, 2.325415, -1.356846, 1, 1, 1, 1, 1,
1.124751, 0.3744005, 1.8402, 1, 1, 1, 1, 1,
1.125903, 0.5800539, 1.023164, 1, 1, 1, 1, 1,
1.130027, -0.2805466, 0.7218342, 1, 1, 1, 1, 1,
1.133384, 0.7415469, 1.849753, 1, 1, 1, 1, 1,
1.139129, 0.1136939, 1.789616, 0, 0, 1, 1, 1,
1.149009, 1.351427, -0.1369914, 1, 0, 0, 1, 1,
1.152899, -1.337477, 2.949594, 1, 0, 0, 1, 1,
1.156397, 1.267968, 1.300983, 1, 0, 0, 1, 1,
1.160188, -0.6993885, 0.2136343, 1, 0, 0, 1, 1,
1.162499, 0.4045716, 0.5370694, 1, 0, 0, 1, 1,
1.166925, 1.028644, -0.5639766, 0, 0, 0, 1, 1,
1.167916, 1.026427, 1.153018, 0, 0, 0, 1, 1,
1.171521, -0.6208959, 0.4078819, 0, 0, 0, 1, 1,
1.187531, 1.602814, 0.07574697, 0, 0, 0, 1, 1,
1.193377, 0.33957, 1.695364, 0, 0, 0, 1, 1,
1.195924, 1.058004, 1.794777, 0, 0, 0, 1, 1,
1.20339, 1.404879, 2.430483, 0, 0, 0, 1, 1,
1.211087, -1.048205, 2.643301, 1, 1, 1, 1, 1,
1.219747, -0.2702959, 0.03819507, 1, 1, 1, 1, 1,
1.220468, -1.026679, 2.366199, 1, 1, 1, 1, 1,
1.234521, 0.6054043, 2.088992, 1, 1, 1, 1, 1,
1.247298, 0.1304973, 0.916489, 1, 1, 1, 1, 1,
1.249118, -2.26914, 4.222003, 1, 1, 1, 1, 1,
1.253722, 0.2847583, 2.479924, 1, 1, 1, 1, 1,
1.262958, 1.828195, 1.612929, 1, 1, 1, 1, 1,
1.265426, 0.3290614, 1.748628, 1, 1, 1, 1, 1,
1.274393, -0.39115, 1.244897, 1, 1, 1, 1, 1,
1.283388, -1.016705, 3.484386, 1, 1, 1, 1, 1,
1.284438, -0.3750316, 2.118745, 1, 1, 1, 1, 1,
1.285799, -0.4255064, 1.47489, 1, 1, 1, 1, 1,
1.288256, 1.089127, 2.388379, 1, 1, 1, 1, 1,
1.289119, 0.5178052, 1.623999, 1, 1, 1, 1, 1,
1.292027, 0.3290059, 1.010322, 0, 0, 1, 1, 1,
1.296414, -0.9851031, 2.453653, 1, 0, 0, 1, 1,
1.298446, -0.5716251, 1.083458, 1, 0, 0, 1, 1,
1.300602, 2.142678, 1.270205, 1, 0, 0, 1, 1,
1.304164, 1.346113, -0.1090265, 1, 0, 0, 1, 1,
1.311535, -0.3797609, 1.812622, 1, 0, 0, 1, 1,
1.331497, 0.7091575, 0.07214124, 0, 0, 0, 1, 1,
1.333758, 1.426545, 3.003811, 0, 0, 0, 1, 1,
1.337993, 1.024184, -0.2438022, 0, 0, 0, 1, 1,
1.338602, 0.4617535, 1.54777, 0, 0, 0, 1, 1,
1.345693, 0.3721467, 1.863161, 0, 0, 0, 1, 1,
1.358878, -0.8609335, 1.739371, 0, 0, 0, 1, 1,
1.394354, -0.5275379, 1.602778, 0, 0, 0, 1, 1,
1.400407, 0.34998, 1.195973, 1, 1, 1, 1, 1,
1.400572, -0.1811626, -0.1239821, 1, 1, 1, 1, 1,
1.411994, 0.5413868, 1.932997, 1, 1, 1, 1, 1,
1.417957, 1.758231, 0.5969831, 1, 1, 1, 1, 1,
1.42469, 0.02852345, 1.387203, 1, 1, 1, 1, 1,
1.438327, -0.5351885, -0.5690727, 1, 1, 1, 1, 1,
1.444663, -1.493251, 2.846736, 1, 1, 1, 1, 1,
1.446869, 0.4605504, 0.7422259, 1, 1, 1, 1, 1,
1.450205, -1.029513, 1.097019, 1, 1, 1, 1, 1,
1.451595, -1.026414, 2.226712, 1, 1, 1, 1, 1,
1.459274, 1.528596, -0.2411207, 1, 1, 1, 1, 1,
1.46064, -0.8433947, 2.064999, 1, 1, 1, 1, 1,
1.46445, 0.8743975, 0.5423976, 1, 1, 1, 1, 1,
1.470223, -1.651391, 3.720554, 1, 1, 1, 1, 1,
1.474398, -0.4516999, 2.825676, 1, 1, 1, 1, 1,
1.484774, -0.09313906, 1.567687, 0, 0, 1, 1, 1,
1.496003, 0.4325962, 1.52542, 1, 0, 0, 1, 1,
1.499566, -0.5488319, 2.696137, 1, 0, 0, 1, 1,
1.522223, 0.7112409, 1.636126, 1, 0, 0, 1, 1,
1.526157, 0.5410159, 1.479569, 1, 0, 0, 1, 1,
1.526726, 2.04592, 1.364927, 1, 0, 0, 1, 1,
1.535275, -0.9570134, 1.639707, 0, 0, 0, 1, 1,
1.539995, -0.4277372, -0.2778322, 0, 0, 0, 1, 1,
1.545191, 0.08012743, 1.956092, 0, 0, 0, 1, 1,
1.557392, -0.865773, 2.288247, 0, 0, 0, 1, 1,
1.562581, 1.694003, 0.6981139, 0, 0, 0, 1, 1,
1.562666, 1.126597, 2.073231, 0, 0, 0, 1, 1,
1.594308, 0.5153286, 0.2952858, 0, 0, 0, 1, 1,
1.597117, 0.2856813, 1.072857, 1, 1, 1, 1, 1,
1.599327, 1.783803, 0.944998, 1, 1, 1, 1, 1,
1.600815, -0.3496375, 1.613121, 1, 1, 1, 1, 1,
1.605784, 0.5443901, 0.9777952, 1, 1, 1, 1, 1,
1.615794, -1.045044, 0.9972287, 1, 1, 1, 1, 1,
1.617422, 0.4950496, 1.181763, 1, 1, 1, 1, 1,
1.626167, -1.341032, 1.906392, 1, 1, 1, 1, 1,
1.633187, -0.9051719, 2.073603, 1, 1, 1, 1, 1,
1.633574, 0.4923783, 3.038799, 1, 1, 1, 1, 1,
1.63457, 0.03939831, 0.4372364, 1, 1, 1, 1, 1,
1.676688, 0.3407396, 0.2745178, 1, 1, 1, 1, 1,
1.689188, -0.6970008, 0.6156148, 1, 1, 1, 1, 1,
1.691656, 0.33769, 1.330537, 1, 1, 1, 1, 1,
1.709197, 1.134436, 1.165462, 1, 1, 1, 1, 1,
1.71016, -1.367266, 1.682451, 1, 1, 1, 1, 1,
1.710404, -2.203892, 2.083381, 0, 0, 1, 1, 1,
1.710782, -0.9146263, 2.208484, 1, 0, 0, 1, 1,
1.713768, 0.2285893, -0.234306, 1, 0, 0, 1, 1,
1.724512, -1.255191, 2.688269, 1, 0, 0, 1, 1,
1.729414, -0.2509621, 0.007908165, 1, 0, 0, 1, 1,
1.731026, -0.1597659, 3.393056, 1, 0, 0, 1, 1,
1.75881, 1.434052, 1.791971, 0, 0, 0, 1, 1,
1.765402, -1.348319, 1.442295, 0, 0, 0, 1, 1,
1.795945, 0.5072963, 1.67127, 0, 0, 0, 1, 1,
1.835421, -1.565247, 1.792476, 0, 0, 0, 1, 1,
1.840595, -0.07494737, 0.5716754, 0, 0, 0, 1, 1,
1.842485, -0.975833, 2.727512, 0, 0, 0, 1, 1,
1.880784, 0.557187, 2.097864, 0, 0, 0, 1, 1,
1.884512, 0.1109206, 0.3405103, 1, 1, 1, 1, 1,
1.896591, -0.1719061, 3.294225, 1, 1, 1, 1, 1,
1.904466, 0.6394097, 0.8193845, 1, 1, 1, 1, 1,
1.913411, 1.867245, 1.554051, 1, 1, 1, 1, 1,
1.920183, -0.6442434, 1.831861, 1, 1, 1, 1, 1,
1.943911, 0.5082921, -0.07290053, 1, 1, 1, 1, 1,
1.952054, -1.124192, 2.444355, 1, 1, 1, 1, 1,
1.953617, 2.647963, 0.6154551, 1, 1, 1, 1, 1,
1.970603, -0.6344659, 2.751689, 1, 1, 1, 1, 1,
1.973869, -0.8122924, 2.585758, 1, 1, 1, 1, 1,
1.978289, -1.227082, 2.003438, 1, 1, 1, 1, 1,
1.997209, 0.9416782, 1.273689, 1, 1, 1, 1, 1,
2.009211, 1.628483, 0.6919779, 1, 1, 1, 1, 1,
2.01279, -0.7555882, 2.286695, 1, 1, 1, 1, 1,
2.032862, 0.5429131, 1.095528, 1, 1, 1, 1, 1,
2.066601, 0.4821487, 1.172192, 0, 0, 1, 1, 1,
2.073663, -1.352553, 3.277279, 1, 0, 0, 1, 1,
2.074911, -0.6846811, 1.823704, 1, 0, 0, 1, 1,
2.105793, -1.938009, 2.554661, 1, 0, 0, 1, 1,
2.121803, -0.3971243, 0.3557958, 1, 0, 0, 1, 1,
2.147059, -0.09013476, 2.15363, 1, 0, 0, 1, 1,
2.178982, -0.1728086, 2.365745, 0, 0, 0, 1, 1,
2.208005, 0.9272608, 1.746691, 0, 0, 0, 1, 1,
2.221348, -0.5835704, 1.27282, 0, 0, 0, 1, 1,
2.267297, 0.1559032, 1.142433, 0, 0, 0, 1, 1,
2.451176, -0.4292057, 1.521019, 0, 0, 0, 1, 1,
2.458243, 1.106293, 0.2953582, 0, 0, 0, 1, 1,
2.46565, -0.3371109, 2.81101, 0, 0, 0, 1, 1,
2.511737, 1.347714, 0.04567531, 1, 1, 1, 1, 1,
2.550156, 0.3563097, 0.9964588, 1, 1, 1, 1, 1,
2.557922, -1.134537, 2.178577, 1, 1, 1, 1, 1,
2.592261, 0.6465926, 0.7060343, 1, 1, 1, 1, 1,
2.736025, 2.438067, 1.445691, 1, 1, 1, 1, 1,
2.945823, -0.08104311, -2.29157, 1, 1, 1, 1, 1,
3.376325, -0.845628, 1.181726, 1, 1, 1, 1, 1
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
var radius = 9.818737;
var distance = 34.4879;
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
mvMatrix.translate( -0.008356571, 0.2107546, 0.05161738 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.4879);
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