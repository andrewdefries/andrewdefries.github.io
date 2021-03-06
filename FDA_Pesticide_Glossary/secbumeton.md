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
-2.862461, 0.1000553, -2.000745, 1, 0, 0, 1,
-2.74596, -0.8203587, -2.432157, 1, 0.007843138, 0, 1,
-2.699798, 0.1330926, -1.289211, 1, 0.01176471, 0, 1,
-2.672527, 1.236439, -0.6833085, 1, 0.01960784, 0, 1,
-2.620607, -1.273104, -1.027154, 1, 0.02352941, 0, 1,
-2.612897, -0.6199384, -2.809713, 1, 0.03137255, 0, 1,
-2.596533, 0.1114492, -2.564167, 1, 0.03529412, 0, 1,
-2.541513, -1.80232, -1.858439, 1, 0.04313726, 0, 1,
-2.540534, 0.6797476, -1.615974, 1, 0.04705882, 0, 1,
-2.531723, 0.861621, 0.9433592, 1, 0.05490196, 0, 1,
-2.487116, -1.096797, -2.099473, 1, 0.05882353, 0, 1,
-2.479626, -0.1953271, -2.001724, 1, 0.06666667, 0, 1,
-2.467538, 0.564575, -0.6091405, 1, 0.07058824, 0, 1,
-2.404586, -0.762245, -2.936584, 1, 0.07843138, 0, 1,
-2.380282, 1.153796, -2.632544, 1, 0.08235294, 0, 1,
-2.352376, -0.6169003, -2.350462, 1, 0.09019608, 0, 1,
-2.242295, -0.6600554, -2.630372, 1, 0.09411765, 0, 1,
-2.208303, -0.3036089, -3.867205, 1, 0.1019608, 0, 1,
-2.200785, -0.122425, -1.662143, 1, 0.1098039, 0, 1,
-2.197592, 1.693989, 0.2614127, 1, 0.1137255, 0, 1,
-2.157558, -1.807852, -4.521713, 1, 0.1215686, 0, 1,
-2.120647, 1.816189, -1.364535, 1, 0.1254902, 0, 1,
-2.113239, 0.2696089, -0.7636546, 1, 0.1333333, 0, 1,
-2.07014, 0.2547549, -1.786055, 1, 0.1372549, 0, 1,
-2.040354, 1.590282, -1.372717, 1, 0.145098, 0, 1,
-2.031989, 0.6683197, -1.979178, 1, 0.1490196, 0, 1,
-2.008841, 0.174763, -2.429776, 1, 0.1568628, 0, 1,
-1.972909, -1.62348, -3.306194, 1, 0.1607843, 0, 1,
-1.969943, -1.151615, -2.689943, 1, 0.1686275, 0, 1,
-1.964984, -1.229907, -1.3882, 1, 0.172549, 0, 1,
-1.940069, 1.833616, -0.1538677, 1, 0.1803922, 0, 1,
-1.923105, -0.3206735, -2.41882, 1, 0.1843137, 0, 1,
-1.883844, -0.2754456, -2.789758, 1, 0.1921569, 0, 1,
-1.877296, -1.873049, -1.835909, 1, 0.1960784, 0, 1,
-1.872714, -0.4973377, -0.3366909, 1, 0.2039216, 0, 1,
-1.861281, -1.016353, -2.408944, 1, 0.2117647, 0, 1,
-1.856868, -0.2877561, -0.5971158, 1, 0.2156863, 0, 1,
-1.847684, 0.2970898, -1.937112, 1, 0.2235294, 0, 1,
-1.819992, -0.6432042, -1.361248, 1, 0.227451, 0, 1,
-1.766682, -0.2209169, -1.057095, 1, 0.2352941, 0, 1,
-1.750983, -1.443768, -2.48882, 1, 0.2392157, 0, 1,
-1.749732, -0.1869386, -2.612044, 1, 0.2470588, 0, 1,
-1.739979, 0.1714723, -1.767586, 1, 0.2509804, 0, 1,
-1.728734, 1.284018, -0.8926042, 1, 0.2588235, 0, 1,
-1.708097, 0.8244225, -0.1115185, 1, 0.2627451, 0, 1,
-1.680885, -1.596611, -3.07566, 1, 0.2705882, 0, 1,
-1.673722, -1.198138, -3.396952, 1, 0.2745098, 0, 1,
-1.657876, -2.291568, -4.041018, 1, 0.282353, 0, 1,
-1.655207, 1.797497, 0.1123272, 1, 0.2862745, 0, 1,
-1.622579, -0.06459999, -1.957362, 1, 0.2941177, 0, 1,
-1.609778, -2.340011, 0.8937404, 1, 0.3019608, 0, 1,
-1.602666, -0.2307393, -1.107528, 1, 0.3058824, 0, 1,
-1.595884, -0.659133, -1.669104, 1, 0.3137255, 0, 1,
-1.577583, 0.5049534, -2.059734, 1, 0.3176471, 0, 1,
-1.571821, -0.2533787, -1.277726, 1, 0.3254902, 0, 1,
-1.568797, -0.7386054, -1.900092, 1, 0.3294118, 0, 1,
-1.568197, -0.3296906, -1.175431, 1, 0.3372549, 0, 1,
-1.547152, -0.3388905, 0.1464564, 1, 0.3411765, 0, 1,
-1.544926, 0.4678918, -2.064221, 1, 0.3490196, 0, 1,
-1.533644, -2.039163, -2.714705, 1, 0.3529412, 0, 1,
-1.525423, 0.841948, -0.2391103, 1, 0.3607843, 0, 1,
-1.503497, -0.2977827, -2.316613, 1, 0.3647059, 0, 1,
-1.503258, -0.707618, -3.17247, 1, 0.372549, 0, 1,
-1.499687, 0.3328142, -1.092932, 1, 0.3764706, 0, 1,
-1.498844, -1.47798, -2.860162, 1, 0.3843137, 0, 1,
-1.486997, 1.744355, 0.8800948, 1, 0.3882353, 0, 1,
-1.486202, 0.1011077, 0.08737117, 1, 0.3960784, 0, 1,
-1.484258, -0.5000592, -2.03322, 1, 0.4039216, 0, 1,
-1.484242, -1.205272, -2.116972, 1, 0.4078431, 0, 1,
-1.483749, 2.0128, -1.421623, 1, 0.4156863, 0, 1,
-1.468733, -0.5937555, -0.3342607, 1, 0.4196078, 0, 1,
-1.468091, -1.9048, -3.752369, 1, 0.427451, 0, 1,
-1.448912, 0.005082457, -2.035575, 1, 0.4313726, 0, 1,
-1.444956, 0.9740076, 0.4832432, 1, 0.4392157, 0, 1,
-1.414147, 0.08751149, -2.101289, 1, 0.4431373, 0, 1,
-1.414103, 0.2015485, -2.857717, 1, 0.4509804, 0, 1,
-1.410111, 0.9656672, 0.4485043, 1, 0.454902, 0, 1,
-1.39777, -1.779953, -1.093071, 1, 0.4627451, 0, 1,
-1.390655, 0.3948544, -2.511955, 1, 0.4666667, 0, 1,
-1.389471, -0.761167, -1.980345, 1, 0.4745098, 0, 1,
-1.379037, -0.6815318, -3.789777, 1, 0.4784314, 0, 1,
-1.373761, 0.04454092, -2.345607, 1, 0.4862745, 0, 1,
-1.370263, 0.02548859, -1.917052, 1, 0.4901961, 0, 1,
-1.361706, 0.4371886, 0.7173691, 1, 0.4980392, 0, 1,
-1.356538, 0.7694492, -0.3321777, 1, 0.5058824, 0, 1,
-1.344246, 1.006951, -0.4370266, 1, 0.509804, 0, 1,
-1.337588, 1.365287, 0.04161891, 1, 0.5176471, 0, 1,
-1.329767, 0.4256956, -0.3421304, 1, 0.5215687, 0, 1,
-1.322631, -0.1158096, -2.303505, 1, 0.5294118, 0, 1,
-1.315555, -1.018903, -2.019634, 1, 0.5333334, 0, 1,
-1.312917, -0.8060396, -2.197167, 1, 0.5411765, 0, 1,
-1.310951, 1.507784, -1.815616, 1, 0.5450981, 0, 1,
-1.309866, 0.2506613, -0.6244534, 1, 0.5529412, 0, 1,
-1.307921, 0.5859872, 0.2148274, 1, 0.5568628, 0, 1,
-1.293814, 1.229376, -1.508331, 1, 0.5647059, 0, 1,
-1.292953, -1.887562, -2.074049, 1, 0.5686275, 0, 1,
-1.290885, 0.3968829, -0.338073, 1, 0.5764706, 0, 1,
-1.283584, 2.295332, 0.1856311, 1, 0.5803922, 0, 1,
-1.282356, 0.2796455, -0.3146807, 1, 0.5882353, 0, 1,
-1.279491, -1.492715, -0.7044374, 1, 0.5921569, 0, 1,
-1.269426, 1.150261, -0.4442343, 1, 0.6, 0, 1,
-1.26369, 1.154746, -0.1735244, 1, 0.6078432, 0, 1,
-1.257125, 0.6064599, -1.26397, 1, 0.6117647, 0, 1,
-1.254989, 1.571641, -0.8517864, 1, 0.6196079, 0, 1,
-1.247007, -1.327595, -0.8826569, 1, 0.6235294, 0, 1,
-1.24592, 0.5775542, -0.1940409, 1, 0.6313726, 0, 1,
-1.231655, -1.015754, -4.259106, 1, 0.6352941, 0, 1,
-1.228864, 0.5891512, -1.399916, 1, 0.6431373, 0, 1,
-1.227242, 0.2207997, -2.308402, 1, 0.6470588, 0, 1,
-1.226214, 0.7495551, -1.731563, 1, 0.654902, 0, 1,
-1.218483, -0.01699336, -2.543311, 1, 0.6588235, 0, 1,
-1.216934, 0.3735179, -0.98638, 1, 0.6666667, 0, 1,
-1.215286, -1.570451, -3.096024, 1, 0.6705883, 0, 1,
-1.213686, 0.8884379, -1.724508, 1, 0.6784314, 0, 1,
-1.207388, 0.4288437, 0.3860017, 1, 0.682353, 0, 1,
-1.198717, 0.2935736, -1.969387, 1, 0.6901961, 0, 1,
-1.19208, -0.06660251, -1.843163, 1, 0.6941177, 0, 1,
-1.188715, -1.435402, -1.325137, 1, 0.7019608, 0, 1,
-1.186418, 0.8689204, -1.445208, 1, 0.7098039, 0, 1,
-1.18498, -3.019311, -4.607314, 1, 0.7137255, 0, 1,
-1.175803, 2.056164, -1.145967, 1, 0.7215686, 0, 1,
-1.169113, 1.375446, -2.725298, 1, 0.7254902, 0, 1,
-1.168627, -2.216466, -1.420399, 1, 0.7333333, 0, 1,
-1.132297, -0.9083601, -4.202374, 1, 0.7372549, 0, 1,
-1.131647, 0.9440946, -1.068128, 1, 0.7450981, 0, 1,
-1.130467, 2.035079, -0.3752324, 1, 0.7490196, 0, 1,
-1.117435, 1.618282, -1.265571, 1, 0.7568628, 0, 1,
-1.113353, -1.386488, -3.857544, 1, 0.7607843, 0, 1,
-1.112591, -0.0271135, -1.42899, 1, 0.7686275, 0, 1,
-1.109167, -0.5963362, -3.184405, 1, 0.772549, 0, 1,
-1.102534, -0.4553411, -2.336231, 1, 0.7803922, 0, 1,
-1.102458, 0.2195806, -1.364784, 1, 0.7843137, 0, 1,
-1.102235, 0.07010226, -2.493886, 1, 0.7921569, 0, 1,
-1.09502, 1.707951, -0.7520981, 1, 0.7960784, 0, 1,
-1.094341, 0.3782353, -1.036799, 1, 0.8039216, 0, 1,
-1.091929, -0.5876596, -3.039956, 1, 0.8117647, 0, 1,
-1.089395, -1.285902, -3.97832, 1, 0.8156863, 0, 1,
-1.08906, 0.06583249, -2.190098, 1, 0.8235294, 0, 1,
-1.080723, -0.08145782, -0.1722499, 1, 0.827451, 0, 1,
-1.080578, 0.5518686, -1.924224, 1, 0.8352941, 0, 1,
-1.071273, 1.510262, 0.3565827, 1, 0.8392157, 0, 1,
-1.063892, 1.588427, -0.9112301, 1, 0.8470588, 0, 1,
-1.058933, 0.3407989, -1.189227, 1, 0.8509804, 0, 1,
-1.048365, 0.8316385, -0.171395, 1, 0.8588235, 0, 1,
-1.04497, -0.873577, -2.343592, 1, 0.8627451, 0, 1,
-1.041531, 0.09504072, -0.8109803, 1, 0.8705882, 0, 1,
-1.02463, 0.4870705, -1.028274, 1, 0.8745098, 0, 1,
-1.012576, -1.531304, -2.489119, 1, 0.8823529, 0, 1,
-1.006604, 0.3586106, -2.504718, 1, 0.8862745, 0, 1,
-1.005826, 0.4769162, 0.1365499, 1, 0.8941177, 0, 1,
-1.005328, -1.670557, -4.441607, 1, 0.8980392, 0, 1,
-1.002615, -0.7552649, -3.165708, 1, 0.9058824, 0, 1,
-0.9993085, -0.1277526, -1.410483, 1, 0.9137255, 0, 1,
-0.9927991, 0.3678017, -2.131018, 1, 0.9176471, 0, 1,
-0.981829, -0.8721637, -2.898641, 1, 0.9254902, 0, 1,
-0.9792852, -0.258595, -2.262735, 1, 0.9294118, 0, 1,
-0.9755209, -1.147986, -3.27497, 1, 0.9372549, 0, 1,
-0.9626638, -0.8332479, -2.777154, 1, 0.9411765, 0, 1,
-0.9615248, -0.5921668, -1.837998, 1, 0.9490196, 0, 1,
-0.9550081, 0.5246984, -0.2812534, 1, 0.9529412, 0, 1,
-0.9472046, -0.1935478, -1.402736, 1, 0.9607843, 0, 1,
-0.9439034, -0.4077322, -2.955435, 1, 0.9647059, 0, 1,
-0.940845, 1.331236, -0.5572133, 1, 0.972549, 0, 1,
-0.9375001, -0.0186301, -1.713122, 1, 0.9764706, 0, 1,
-0.9374281, 0.2681373, 0.2888188, 1, 0.9843137, 0, 1,
-0.9356111, 1.071691, 0.0211814, 1, 0.9882353, 0, 1,
-0.9291826, 0.02310151, -1.431237, 1, 0.9960784, 0, 1,
-0.9137499, 0.7558728, 0.3045936, 0.9960784, 1, 0, 1,
-0.9121362, -1.24841, -2.854359, 0.9921569, 1, 0, 1,
-0.9067557, 0.9115239, -0.3824615, 0.9843137, 1, 0, 1,
-0.9067187, -0.7334935, -1.140296, 0.9803922, 1, 0, 1,
-0.9037331, 0.187762, -0.9830554, 0.972549, 1, 0, 1,
-0.8918195, 0.3087851, -2.537833, 0.9686275, 1, 0, 1,
-0.8914129, -0.67705, -2.591644, 0.9607843, 1, 0, 1,
-0.8891709, -1.906303, -0.3750133, 0.9568627, 1, 0, 1,
-0.8816507, -0.2128874, -3.010863, 0.9490196, 1, 0, 1,
-0.877386, 0.4756613, -0.5372119, 0.945098, 1, 0, 1,
-0.8772815, 0.0274268, -1.818289, 0.9372549, 1, 0, 1,
-0.8757443, 1.605218, -1.149752, 0.9333333, 1, 0, 1,
-0.8718554, 0.06826378, -1.595847, 0.9254902, 1, 0, 1,
-0.8701493, 0.003655036, -3.888988, 0.9215686, 1, 0, 1,
-0.8689619, 0.1254382, -1.217698, 0.9137255, 1, 0, 1,
-0.8685954, -0.4514833, -2.27282, 0.9098039, 1, 0, 1,
-0.8666215, 0.1167754, -1.892127, 0.9019608, 1, 0, 1,
-0.8643737, 0.7852639, 0.8699376, 0.8941177, 1, 0, 1,
-0.863129, -0.3489538, -1.33362, 0.8901961, 1, 0, 1,
-0.8625231, 0.8848507, 0.5264965, 0.8823529, 1, 0, 1,
-0.8589443, -1.158057, -2.465857, 0.8784314, 1, 0, 1,
-0.8549585, 0.1739974, -1.472436, 0.8705882, 1, 0, 1,
-0.85168, 0.9069219, -0.2665122, 0.8666667, 1, 0, 1,
-0.8490819, 1.092253, 0.7757422, 0.8588235, 1, 0, 1,
-0.838012, 0.1237766, -1.76733, 0.854902, 1, 0, 1,
-0.8328215, 0.8011616, -1.359344, 0.8470588, 1, 0, 1,
-0.8280312, 1.08259, -0.5010846, 0.8431373, 1, 0, 1,
-0.8258768, -0.3092106, -1.902577, 0.8352941, 1, 0, 1,
-0.8249512, 1.285656, -1.947642, 0.8313726, 1, 0, 1,
-0.8204404, 0.3957346, -0.4399834, 0.8235294, 1, 0, 1,
-0.8117727, 0.1684757, -2.702697, 0.8196079, 1, 0, 1,
-0.811753, -1.66574, -1.046398, 0.8117647, 1, 0, 1,
-0.8085942, 1.525666, -1.674774, 0.8078431, 1, 0, 1,
-0.8077877, -0.6906502, -3.055727, 0.8, 1, 0, 1,
-0.8052554, -1.688915, -2.459359, 0.7921569, 1, 0, 1,
-0.8049009, 1.301343, -1.338781, 0.7882353, 1, 0, 1,
-0.8023114, 0.4751922, -1.912248, 0.7803922, 1, 0, 1,
-0.7963068, -1.970052, -0.04491627, 0.7764706, 1, 0, 1,
-0.7888308, 0.3378763, -2.512152, 0.7686275, 1, 0, 1,
-0.788825, 0.8698251, -0.4197497, 0.7647059, 1, 0, 1,
-0.7887622, -1.764587, -2.830694, 0.7568628, 1, 0, 1,
-0.7832249, 1.930119, 1.092389, 0.7529412, 1, 0, 1,
-0.7806529, -0.657769, -1.515698, 0.7450981, 1, 0, 1,
-0.7792498, -0.1579076, -1.128233, 0.7411765, 1, 0, 1,
-0.7766669, -0.7829106, -2.638155, 0.7333333, 1, 0, 1,
-0.7760778, 0.4288514, -1.699706, 0.7294118, 1, 0, 1,
-0.7722943, -1.693496, -1.750054, 0.7215686, 1, 0, 1,
-0.770112, -0.1273134, -3.57179, 0.7176471, 1, 0, 1,
-0.7682988, 2.147971, -0.3749698, 0.7098039, 1, 0, 1,
-0.767575, -0.8333359, -3.874645, 0.7058824, 1, 0, 1,
-0.7659523, -0.2212755, -2.128388, 0.6980392, 1, 0, 1,
-0.762554, 0.8995053, -0.4039124, 0.6901961, 1, 0, 1,
-0.7621491, 0.6024777, -1.968681, 0.6862745, 1, 0, 1,
-0.7512759, -0.3068276, -1.426393, 0.6784314, 1, 0, 1,
-0.7482748, 1.392996, -0.1935868, 0.6745098, 1, 0, 1,
-0.7426932, 2.044491, 0.4014956, 0.6666667, 1, 0, 1,
-0.7415966, -0.5251091, -2.178071, 0.6627451, 1, 0, 1,
-0.7411094, 0.3251781, -2.430683, 0.654902, 1, 0, 1,
-0.7408625, 0.148996, -0.6983373, 0.6509804, 1, 0, 1,
-0.739704, -0.4924791, 0.1915747, 0.6431373, 1, 0, 1,
-0.7360629, 0.8118122, -0.7562133, 0.6392157, 1, 0, 1,
-0.7341001, 1.035189, -0.5940162, 0.6313726, 1, 0, 1,
-0.732501, 1.938862, -0.5120575, 0.627451, 1, 0, 1,
-0.7291195, 0.4851112, -0.1900856, 0.6196079, 1, 0, 1,
-0.7270572, 1.187997, -1.067124, 0.6156863, 1, 0, 1,
-0.7261528, 0.4963387, -1.269661, 0.6078432, 1, 0, 1,
-0.7215867, 0.2253111, -0.3360713, 0.6039216, 1, 0, 1,
-0.7215567, -0.001709627, -0.884303, 0.5960785, 1, 0, 1,
-0.7137808, 0.9091355, -1.836391, 0.5882353, 1, 0, 1,
-0.7129974, -2.28542, -2.278013, 0.5843138, 1, 0, 1,
-0.711271, 0.2454934, -1.598099, 0.5764706, 1, 0, 1,
-0.7073991, 0.2986612, -1.46143, 0.572549, 1, 0, 1,
-0.7073957, -0.5015202, -2.238346, 0.5647059, 1, 0, 1,
-0.7069861, -0.3036382, -2.833913, 0.5607843, 1, 0, 1,
-0.7055731, -0.5238391, -0.330566, 0.5529412, 1, 0, 1,
-0.7042491, -1.059175, -1.681179, 0.5490196, 1, 0, 1,
-0.7019602, -1.6054, -1.541913, 0.5411765, 1, 0, 1,
-0.701741, -0.654718, -1.337396, 0.5372549, 1, 0, 1,
-0.7002244, 0.9152367, -0.1054244, 0.5294118, 1, 0, 1,
-0.6965068, -0.7099239, -2.366716, 0.5254902, 1, 0, 1,
-0.6953246, 1.682355, -0.5812223, 0.5176471, 1, 0, 1,
-0.6942995, -1.988244, -0.8514608, 0.5137255, 1, 0, 1,
-0.6938826, 0.9759086, 0.8171074, 0.5058824, 1, 0, 1,
-0.6927696, -1.066654, -1.276248, 0.5019608, 1, 0, 1,
-0.6867219, -1.360277, -3.307114, 0.4941176, 1, 0, 1,
-0.6857349, 1.106463, -3.522255, 0.4862745, 1, 0, 1,
-0.6784746, -1.707969, -1.280736, 0.4823529, 1, 0, 1,
-0.6738315, 1.658898, -0.7757917, 0.4745098, 1, 0, 1,
-0.6728594, 0.02378116, -1.105494, 0.4705882, 1, 0, 1,
-0.6712492, -0.8674439, -0.302866, 0.4627451, 1, 0, 1,
-0.66926, 0.6467286, 0.0711114, 0.4588235, 1, 0, 1,
-0.6678954, 0.1143854, -1.725912, 0.4509804, 1, 0, 1,
-0.6669974, -0.09442565, -1.843278, 0.4470588, 1, 0, 1,
-0.6654737, 0.2276765, -2.209938, 0.4392157, 1, 0, 1,
-0.6647056, 1.32949, -0.4406047, 0.4352941, 1, 0, 1,
-0.6589149, -1.469058, -2.249689, 0.427451, 1, 0, 1,
-0.6580731, -0.4182968, -3.058594, 0.4235294, 1, 0, 1,
-0.6573499, -0.7321718, -2.321993, 0.4156863, 1, 0, 1,
-0.6549104, 0.005197584, -3.055287, 0.4117647, 1, 0, 1,
-0.6548968, 1.838898, -2.148649, 0.4039216, 1, 0, 1,
-0.654511, -0.9527163, -1.268462, 0.3960784, 1, 0, 1,
-0.6529988, -0.3899561, -2.410976, 0.3921569, 1, 0, 1,
-0.6483515, 0.4535599, -0.4891059, 0.3843137, 1, 0, 1,
-0.6382057, 0.9104732, -0.01626233, 0.3803922, 1, 0, 1,
-0.637366, -1.51858, -4.25037, 0.372549, 1, 0, 1,
-0.6325955, -0.8927428, -2.981363, 0.3686275, 1, 0, 1,
-0.6320055, 0.6232113, -0.5046871, 0.3607843, 1, 0, 1,
-0.6298187, -0.6141222, -3.682656, 0.3568628, 1, 0, 1,
-0.6284021, -1.067892, -0.7574046, 0.3490196, 1, 0, 1,
-0.6267757, 0.01277005, -2.320534, 0.345098, 1, 0, 1,
-0.6264169, 0.4137911, -3.008191, 0.3372549, 1, 0, 1,
-0.6262169, 1.75687, 0.6980327, 0.3333333, 1, 0, 1,
-0.6243903, 0.2347918, -0.9586141, 0.3254902, 1, 0, 1,
-0.6240408, 0.1304859, -2.423586, 0.3215686, 1, 0, 1,
-0.6229424, 1.816402, -0.5973815, 0.3137255, 1, 0, 1,
-0.6226602, -1.179433, -1.796297, 0.3098039, 1, 0, 1,
-0.6177105, 0.6855369, -0.1421322, 0.3019608, 1, 0, 1,
-0.6158442, -0.8130619, -3.703348, 0.2941177, 1, 0, 1,
-0.6132636, 0.1117956, -0.9508186, 0.2901961, 1, 0, 1,
-0.6113398, -1.548143, -2.999365, 0.282353, 1, 0, 1,
-0.6087718, 0.655394, -1.351933, 0.2784314, 1, 0, 1,
-0.6076364, 0.01973426, -1.798738, 0.2705882, 1, 0, 1,
-0.6056939, -1.715801, -0.9851963, 0.2666667, 1, 0, 1,
-0.6044576, -0.03517014, -2.440608, 0.2588235, 1, 0, 1,
-0.6033596, -0.1524424, -3.375303, 0.254902, 1, 0, 1,
-0.6028881, -0.6796958, -2.375006, 0.2470588, 1, 0, 1,
-0.6005511, -0.4209542, -1.534961, 0.2431373, 1, 0, 1,
-0.5983725, 1.559945, -1.514359, 0.2352941, 1, 0, 1,
-0.5973825, 1.287552, -0.1717034, 0.2313726, 1, 0, 1,
-0.5969239, -0.3697324, -1.536481, 0.2235294, 1, 0, 1,
-0.5948206, -0.8080204, -3.786752, 0.2196078, 1, 0, 1,
-0.5932167, 2.301236, 0.02663043, 0.2117647, 1, 0, 1,
-0.5917394, -0.8646904, -3.092197, 0.2078431, 1, 0, 1,
-0.591105, -0.4726283, -4.129273, 0.2, 1, 0, 1,
-0.58999, 2.381748, -0.4852829, 0.1921569, 1, 0, 1,
-0.5898778, 0.5526078, -0.1280997, 0.1882353, 1, 0, 1,
-0.5898588, -1.369801, -2.389311, 0.1803922, 1, 0, 1,
-0.5883617, -0.1454248, -1.214003, 0.1764706, 1, 0, 1,
-0.5872528, -0.7231398, -3.579734, 0.1686275, 1, 0, 1,
-0.5829561, 0.1272444, 0.3385692, 0.1647059, 1, 0, 1,
-0.5819442, -0.5346428, -2.111382, 0.1568628, 1, 0, 1,
-0.5730042, -0.3595533, -0.8705556, 0.1529412, 1, 0, 1,
-0.571775, -0.6992627, -2.401058, 0.145098, 1, 0, 1,
-0.568531, 3.03081, -0.4043415, 0.1411765, 1, 0, 1,
-0.5659179, -1.526841, -2.752387, 0.1333333, 1, 0, 1,
-0.5641474, -0.04880029, -4.256866, 0.1294118, 1, 0, 1,
-0.5628793, 0.8881089, -1.352754, 0.1215686, 1, 0, 1,
-0.5626884, -0.3637436, -2.763227, 0.1176471, 1, 0, 1,
-0.5547007, 0.3179225, -1.572714, 0.1098039, 1, 0, 1,
-0.5482113, 0.474155, 0.02055376, 0.1058824, 1, 0, 1,
-0.5448979, -0.4836725, -4.581157, 0.09803922, 1, 0, 1,
-0.5441973, 0.05946511, -1.913343, 0.09019608, 1, 0, 1,
-0.5409646, 0.02061166, -1.322111, 0.08627451, 1, 0, 1,
-0.5370873, -0.3833247, -1.887626, 0.07843138, 1, 0, 1,
-0.5370254, -0.3060926, -3.302177, 0.07450981, 1, 0, 1,
-0.5354617, -2.289935, -1.241667, 0.06666667, 1, 0, 1,
-0.5331826, -2.518454, -2.198086, 0.0627451, 1, 0, 1,
-0.5328718, -1.786333, -3.733036, 0.05490196, 1, 0, 1,
-0.5322402, -0.2412449, -1.465913, 0.05098039, 1, 0, 1,
-0.5263882, 2.259716, 0.3845879, 0.04313726, 1, 0, 1,
-0.5150971, 0.002846772, -2.096081, 0.03921569, 1, 0, 1,
-0.5107909, -1.612824, -2.909913, 0.03137255, 1, 0, 1,
-0.5022719, -0.585714, -1.66358, 0.02745098, 1, 0, 1,
-0.4957017, -0.8404473, -3.552384, 0.01960784, 1, 0, 1,
-0.4838137, 1.111061, 0.1627298, 0.01568628, 1, 0, 1,
-0.4818515, 0.9804991, -1.008256, 0.007843138, 1, 0, 1,
-0.4775908, -0.3714123, -1.081772, 0.003921569, 1, 0, 1,
-0.4775532, 0.2311566, -0.6607524, 0, 1, 0.003921569, 1,
-0.4772976, -0.8181438, -3.161079, 0, 1, 0.01176471, 1,
-0.4752772, -1.005091, -3.297674, 0, 1, 0.01568628, 1,
-0.4750857, -0.3404969, -3.304193, 0, 1, 0.02352941, 1,
-0.4741693, -0.3046259, -3.725134, 0, 1, 0.02745098, 1,
-0.4738364, 1.137249, -1.35509, 0, 1, 0.03529412, 1,
-0.4732697, 1.515556, -0.5448783, 0, 1, 0.03921569, 1,
-0.4708121, -0.7073236, -3.669926, 0, 1, 0.04705882, 1,
-0.4680618, 1.1653, -0.2039412, 0, 1, 0.05098039, 1,
-0.4662307, -0.9687842, -2.552769, 0, 1, 0.05882353, 1,
-0.4643557, 0.3976576, -2.787218, 0, 1, 0.0627451, 1,
-0.4623085, 1.011401, -0.8117888, 0, 1, 0.07058824, 1,
-0.4582444, 2.143075, -1.695977, 0, 1, 0.07450981, 1,
-0.4555804, -1.394414, -2.542542, 0, 1, 0.08235294, 1,
-0.4531714, -1.431391, -2.314534, 0, 1, 0.08627451, 1,
-0.4470247, -0.5224571, -3.246985, 0, 1, 0.09411765, 1,
-0.4441132, -1.166203, -4.144508, 0, 1, 0.1019608, 1,
-0.4422782, -0.2144576, -2.593111, 0, 1, 0.1058824, 1,
-0.4400952, -0.6647239, -1.910361, 0, 1, 0.1137255, 1,
-0.43894, 0.8961673, -1.160918, 0, 1, 0.1176471, 1,
-0.4374407, -0.0006446232, -0.1349246, 0, 1, 0.1254902, 1,
-0.4368198, -1.892306, -5.752969, 0, 1, 0.1294118, 1,
-0.4365854, -1.671314, -1.92075, 0, 1, 0.1372549, 1,
-0.4357108, -0.6393672, -1.586307, 0, 1, 0.1411765, 1,
-0.435344, 0.7168278, -0.2780753, 0, 1, 0.1490196, 1,
-0.4297296, -1.661134, -2.757038, 0, 1, 0.1529412, 1,
-0.4282947, -1.078403, -3.047359, 0, 1, 0.1607843, 1,
-0.4270188, 1.316039, 0.6105682, 0, 1, 0.1647059, 1,
-0.4251738, 0.4197505, 0.6809307, 0, 1, 0.172549, 1,
-0.4244444, -0.9288154, -2.755948, 0, 1, 0.1764706, 1,
-0.4229435, 1.024525, -1.662622, 0, 1, 0.1843137, 1,
-0.4227764, 0.09678984, -0.8377102, 0, 1, 0.1882353, 1,
-0.4225285, 1.922753, -1.651241, 0, 1, 0.1960784, 1,
-0.4183914, 1.304632, -1.423851, 0, 1, 0.2039216, 1,
-0.4143792, 0.975897, -0.4142427, 0, 1, 0.2078431, 1,
-0.4118291, 0.8684582, -0.3825846, 0, 1, 0.2156863, 1,
-0.4092215, -0.2915069, -2.077689, 0, 1, 0.2196078, 1,
-0.4078291, -1.418713, -2.417559, 0, 1, 0.227451, 1,
-0.4077986, 0.9166218, 0.4238022, 0, 1, 0.2313726, 1,
-0.4040223, -0.1059325, -3.41265, 0, 1, 0.2392157, 1,
-0.4021171, -0.2733067, -1.916534, 0, 1, 0.2431373, 1,
-0.3951389, -1.562041, -3.222815, 0, 1, 0.2509804, 1,
-0.393513, -3.024937, -3.007878, 0, 1, 0.254902, 1,
-0.3896479, 0.454249, -1.259161, 0, 1, 0.2627451, 1,
-0.3850178, 0.9834965, 0.2095167, 0, 1, 0.2666667, 1,
-0.3849648, 1.278471, 0.779295, 0, 1, 0.2745098, 1,
-0.3790287, -0.8741826, -2.118304, 0, 1, 0.2784314, 1,
-0.3780333, -1.753542, -3.399087, 0, 1, 0.2862745, 1,
-0.3766932, -0.04181139, -0.7903079, 0, 1, 0.2901961, 1,
-0.3708155, -1.300884, -2.56338, 0, 1, 0.2980392, 1,
-0.3673712, -0.5465116, -2.47588, 0, 1, 0.3058824, 1,
-0.3614106, 0.3835169, -1.122786, 0, 1, 0.3098039, 1,
-0.3582518, 1.000024, 0.3315728, 0, 1, 0.3176471, 1,
-0.3571658, -0.08556861, -1.671697, 0, 1, 0.3215686, 1,
-0.3567745, -0.5623307, -4.573768, 0, 1, 0.3294118, 1,
-0.3525548, 0.408824, 1.460907, 0, 1, 0.3333333, 1,
-0.3490294, -0.1425778, -1.41203, 0, 1, 0.3411765, 1,
-0.3479773, 1.598111, 1.508947, 0, 1, 0.345098, 1,
-0.3428181, -0.4982269, -1.816419, 0, 1, 0.3529412, 1,
-0.3374608, 1.264878, -0.7300306, 0, 1, 0.3568628, 1,
-0.3338285, -0.388477, -2.405892, 0, 1, 0.3647059, 1,
-0.3317525, 0.32207, -3.065374, 0, 1, 0.3686275, 1,
-0.3316602, -0.4262893, -3.96159, 0, 1, 0.3764706, 1,
-0.3228804, -0.3285955, -2.094681, 0, 1, 0.3803922, 1,
-0.3172562, 0.002062205, -0.8360465, 0, 1, 0.3882353, 1,
-0.3170097, -0.7478489, -0.9275049, 0, 1, 0.3921569, 1,
-0.3163931, -1.012365, -1.098662, 0, 1, 0.4, 1,
-0.3138771, 0.7753255, -1.080224, 0, 1, 0.4078431, 1,
-0.3099312, 0.4799358, 0.5590512, 0, 1, 0.4117647, 1,
-0.3023877, 0.1427208, -0.7089656, 0, 1, 0.4196078, 1,
-0.3010397, -0.1455837, -1.237675, 0, 1, 0.4235294, 1,
-0.2993308, -0.4124587, -4.300831, 0, 1, 0.4313726, 1,
-0.2979732, -0.4541302, -2.450208, 0, 1, 0.4352941, 1,
-0.2951866, 0.2645856, -1.805094, 0, 1, 0.4431373, 1,
-0.2869381, -0.2762963, -0.06750152, 0, 1, 0.4470588, 1,
-0.286835, -2.205549, -2.7063, 0, 1, 0.454902, 1,
-0.2860077, 1.383148, 0.5412118, 0, 1, 0.4588235, 1,
-0.2800237, -0.7699882, -4.100108, 0, 1, 0.4666667, 1,
-0.2749607, -1.778699, -1.410295, 0, 1, 0.4705882, 1,
-0.2724342, 0.8907032, -1.714592, 0, 1, 0.4784314, 1,
-0.2722822, -0.3429326, -2.494433, 0, 1, 0.4823529, 1,
-0.2692474, 0.3232921, -1.907158, 0, 1, 0.4901961, 1,
-0.2629115, 0.8997826, 0.7706845, 0, 1, 0.4941176, 1,
-0.2605418, -0.9285578, -4.433527, 0, 1, 0.5019608, 1,
-0.2580428, 0.05584634, -0.5654204, 0, 1, 0.509804, 1,
-0.2568572, -0.7262974, -3.378071, 0, 1, 0.5137255, 1,
-0.2542751, 0.6198344, -0.8258878, 0, 1, 0.5215687, 1,
-0.2414024, -1.516062, -3.966115, 0, 1, 0.5254902, 1,
-0.2403645, 0.679969, 0.7530009, 0, 1, 0.5333334, 1,
-0.2343696, -0.3357216, -2.62401, 0, 1, 0.5372549, 1,
-0.2336799, 0.3286482, -1.821269, 0, 1, 0.5450981, 1,
-0.2298311, 1.008671, -0.9582843, 0, 1, 0.5490196, 1,
-0.2216746, -1.44885, -4.007047, 0, 1, 0.5568628, 1,
-0.2132844, 1.414837, -0.4453619, 0, 1, 0.5607843, 1,
-0.2106729, 0.5268013, -0.03007625, 0, 1, 0.5686275, 1,
-0.2074314, 0.9492435, -0.9954239, 0, 1, 0.572549, 1,
-0.2048359, -0.2273101, -2.694397, 0, 1, 0.5803922, 1,
-0.202799, -1.119328, -1.862631, 0, 1, 0.5843138, 1,
-0.1967501, 0.2204371, -2.199887, 0, 1, 0.5921569, 1,
-0.1954469, -1.349815, -3.94968, 0, 1, 0.5960785, 1,
-0.1897124, -1.088776, -2.505739, 0, 1, 0.6039216, 1,
-0.1887554, 0.7723977, -1.473726, 0, 1, 0.6117647, 1,
-0.1880374, -2.08171, -3.420873, 0, 1, 0.6156863, 1,
-0.1847774, -0.466421, -2.320981, 0, 1, 0.6235294, 1,
-0.1845769, -1.998027, -1.776724, 0, 1, 0.627451, 1,
-0.1833553, -1.051524, -3.168603, 0, 1, 0.6352941, 1,
-0.1808109, -0.3749477, -2.133971, 0, 1, 0.6392157, 1,
-0.1785597, 0.559148, 1.751033, 0, 1, 0.6470588, 1,
-0.1772081, 1.352349, 0.6517893, 0, 1, 0.6509804, 1,
-0.1752692, 1.124228, -1.260037, 0, 1, 0.6588235, 1,
-0.1729431, -1.076367, -4.42, 0, 1, 0.6627451, 1,
-0.1709787, -0.7043748, -2.426213, 0, 1, 0.6705883, 1,
-0.1687748, 0.1821665, 1.379471, 0, 1, 0.6745098, 1,
-0.1616294, -0.6211672, -3.30139, 0, 1, 0.682353, 1,
-0.1508091, -0.2984062, -2.802115, 0, 1, 0.6862745, 1,
-0.1504102, 1.7137, 0.2693915, 0, 1, 0.6941177, 1,
-0.1450897, 1.709487, -0.6267797, 0, 1, 0.7019608, 1,
-0.1440939, 1.846155, -0.04251304, 0, 1, 0.7058824, 1,
-0.1422107, 0.01378527, -1.450212, 0, 1, 0.7137255, 1,
-0.1420752, -0.1999855, -4.087997, 0, 1, 0.7176471, 1,
-0.1340553, 0.1300732, -0.5900589, 0, 1, 0.7254902, 1,
-0.1285229, 0.8125018, 0.4083201, 0, 1, 0.7294118, 1,
-0.1234834, -1.178562, -1.599769, 0, 1, 0.7372549, 1,
-0.1218595, -1.31041, -3.012565, 0, 1, 0.7411765, 1,
-0.1199835, 2.771611, -0.3197942, 0, 1, 0.7490196, 1,
-0.1190315, 0.9280925, 1.478152, 0, 1, 0.7529412, 1,
-0.118961, 1.042552, -1.263615, 0, 1, 0.7607843, 1,
-0.1159922, -0.9789031, -2.081392, 0, 1, 0.7647059, 1,
-0.1153975, -0.8805733, -2.767146, 0, 1, 0.772549, 1,
-0.1124669, 1.74163, 1.388491, 0, 1, 0.7764706, 1,
-0.1104375, -0.7251198, -3.969355, 0, 1, 0.7843137, 1,
-0.1089482, 0.5051186, -2.460833, 0, 1, 0.7882353, 1,
-0.108686, 0.3499912, 1.171035, 0, 1, 0.7960784, 1,
-0.1056372, -0.2939702, -2.473578, 0, 1, 0.8039216, 1,
-0.1055121, 1.716293, -0.5930415, 0, 1, 0.8078431, 1,
-0.1004038, 0.4494528, 0.8197767, 0, 1, 0.8156863, 1,
-0.09939331, 0.04896981, -1.461355, 0, 1, 0.8196079, 1,
-0.09688248, 1.609201, -1.079612, 0, 1, 0.827451, 1,
-0.09584238, -0.9217286, -3.665175, 0, 1, 0.8313726, 1,
-0.0929609, 0.2440021, -1.664431, 0, 1, 0.8392157, 1,
-0.09187949, -0.221186, -2.826522, 0, 1, 0.8431373, 1,
-0.0898404, 0.6823031, -0.8053086, 0, 1, 0.8509804, 1,
-0.08750312, -0.04184236, -2.844009, 0, 1, 0.854902, 1,
-0.08603022, 1.643353, 2.866187, 0, 1, 0.8627451, 1,
-0.0820415, 0.8952327, -1.238691, 0, 1, 0.8666667, 1,
-0.08090414, 1.156057, 1.163396, 0, 1, 0.8745098, 1,
-0.08082921, -0.5548208, -2.832209, 0, 1, 0.8784314, 1,
-0.07823697, 0.1974771, -0.8494822, 0, 1, 0.8862745, 1,
-0.07522571, -0.5658941, -3.958761, 0, 1, 0.8901961, 1,
-0.07326446, 0.08379921, -0.4071012, 0, 1, 0.8980392, 1,
-0.07128904, -0.06753045, -1.790638, 0, 1, 0.9058824, 1,
-0.06619358, 1.726863, -0.1658092, 0, 1, 0.9098039, 1,
-0.059912, 0.05254734, 0.4735638, 0, 1, 0.9176471, 1,
-0.05868907, 0.2669761, -0.02305778, 0, 1, 0.9215686, 1,
-0.05305517, 0.7827123, 0.5228136, 0, 1, 0.9294118, 1,
-0.04995962, -1.347949, -3.182393, 0, 1, 0.9333333, 1,
-0.0469315, -0.552525, -3.390769, 0, 1, 0.9411765, 1,
-0.04100794, 0.5361347, -0.6448434, 0, 1, 0.945098, 1,
-0.0401859, -0.4923536, -2.028949, 0, 1, 0.9529412, 1,
-0.03947198, -0.5504646, -4.282629, 0, 1, 0.9568627, 1,
-0.03730662, 0.0240492, 0.2207762, 0, 1, 0.9647059, 1,
-0.03597314, -0.3295031, -3.19293, 0, 1, 0.9686275, 1,
-0.03335564, 2.813291, -0.2356645, 0, 1, 0.9764706, 1,
-0.03037389, 0.06235633, -0.8908366, 0, 1, 0.9803922, 1,
-0.02982282, -1.630499, -3.335077, 0, 1, 0.9882353, 1,
-0.02974072, -0.03540049, -2.597611, 0, 1, 0.9921569, 1,
-0.02584236, 0.7158705, 0.8737308, 0, 1, 1, 1,
-0.02506602, 0.774641, -0.3206901, 0, 0.9921569, 1, 1,
-0.01889651, 0.6999587, 0.07422345, 0, 0.9882353, 1, 1,
-0.01809073, 0.1788877, 1.376387, 0, 0.9803922, 1, 1,
-0.01742656, -0.4908458, -3.541851, 0, 0.9764706, 1, 1,
-0.01677858, 0.8604593, 1.432129, 0, 0.9686275, 1, 1,
-0.01455245, 0.8297831, -0.5374278, 0, 0.9647059, 1, 1,
-0.01306781, -0.1754184, -4.262712, 0, 0.9568627, 1, 1,
-0.01071607, 0.7112235, 0.766311, 0, 0.9529412, 1, 1,
-0.009762044, 0.1594044, -0.8700519, 0, 0.945098, 1, 1,
0.007707662, -0.9311202, 2.974472, 0, 0.9411765, 1, 1,
0.008094307, 1.450429, 0.1296954, 0, 0.9333333, 1, 1,
0.008845857, -1.709529, 1.91722, 0, 0.9294118, 1, 1,
0.008854023, -1.354476, 4.523301, 0, 0.9215686, 1, 1,
0.01347646, 0.1610947, 1.262028, 0, 0.9176471, 1, 1,
0.01443599, 0.8682775, 0.1147469, 0, 0.9098039, 1, 1,
0.0153912, 1.632346, 2.540324, 0, 0.9058824, 1, 1,
0.02034192, 0.4979228, -1.556403, 0, 0.8980392, 1, 1,
0.0226448, -0.5819983, 2.635911, 0, 0.8901961, 1, 1,
0.02520478, 0.4261436, -0.06568851, 0, 0.8862745, 1, 1,
0.02755703, -1.24155, 4.158567, 0, 0.8784314, 1, 1,
0.02856778, 1.15929, -0.3374874, 0, 0.8745098, 1, 1,
0.03062903, 0.2468235, -0.5978937, 0, 0.8666667, 1, 1,
0.04738285, 0.2910547, -0.003894218, 0, 0.8627451, 1, 1,
0.04851381, 0.09817576, 0.8459519, 0, 0.854902, 1, 1,
0.05044268, 1.296416, -0.7949104, 0, 0.8509804, 1, 1,
0.05047697, 0.166795, 1.028943, 0, 0.8431373, 1, 1,
0.05185058, 0.8487688, 1.181543, 0, 0.8392157, 1, 1,
0.052121, -0.6578979, 3.139334, 0, 0.8313726, 1, 1,
0.05439936, -0.4168071, 3.06699, 0, 0.827451, 1, 1,
0.05509965, 1.94605, 0.2627067, 0, 0.8196079, 1, 1,
0.05825158, -0.1638032, 2.725218, 0, 0.8156863, 1, 1,
0.06024763, 1.049544, 0.866224, 0, 0.8078431, 1, 1,
0.06126316, 0.05271772, 0.2246994, 0, 0.8039216, 1, 1,
0.06271145, 0.2561229, -0.3955895, 0, 0.7960784, 1, 1,
0.06362896, -1.1994, 3.827586, 0, 0.7882353, 1, 1,
0.06364527, 1.013053, 0.05072619, 0, 0.7843137, 1, 1,
0.06517362, 0.7663972, 0.0378983, 0, 0.7764706, 1, 1,
0.06770331, 0.6967643, -0.6070932, 0, 0.772549, 1, 1,
0.07710484, -0.1558855, 2.727199, 0, 0.7647059, 1, 1,
0.08239906, 0.09881584, 1.128135, 0, 0.7607843, 1, 1,
0.08389934, 0.8803924, -2.131825, 0, 0.7529412, 1, 1,
0.08567568, 0.1254888, 2.504101, 0, 0.7490196, 1, 1,
0.09016608, -1.135729, 4.455916, 0, 0.7411765, 1, 1,
0.09186435, -0.5984924, 4.544458, 0, 0.7372549, 1, 1,
0.09606561, 1.958333, 1.765478, 0, 0.7294118, 1, 1,
0.1039069, -0.9656119, 3.496221, 0, 0.7254902, 1, 1,
0.118033, -3.006706, 2.904094, 0, 0.7176471, 1, 1,
0.1193159, -2.959782, 3.621131, 0, 0.7137255, 1, 1,
0.1240203, -1.256708, 4.11561, 0, 0.7058824, 1, 1,
0.1282184, 1.523895, -0.1848276, 0, 0.6980392, 1, 1,
0.1338875, -0.894861, 3.246348, 0, 0.6941177, 1, 1,
0.1343826, -0.7254028, 2.586779, 0, 0.6862745, 1, 1,
0.1371104, 0.415591, -0.429201, 0, 0.682353, 1, 1,
0.1382348, -0.4824968, 3.491149, 0, 0.6745098, 1, 1,
0.1394475, 2.727086, -0.8808929, 0, 0.6705883, 1, 1,
0.1409268, 0.5997697, -0.3736914, 0, 0.6627451, 1, 1,
0.1415089, -1.708143, 2.552399, 0, 0.6588235, 1, 1,
0.1433562, -0.1365217, 2.45663, 0, 0.6509804, 1, 1,
0.1559605, -0.378211, 2.932693, 0, 0.6470588, 1, 1,
0.1561965, -0.1267075, 2.504301, 0, 0.6392157, 1, 1,
0.156553, 1.519414, -0.1392349, 0, 0.6352941, 1, 1,
0.1574584, -0.2651279, 2.161379, 0, 0.627451, 1, 1,
0.1586701, 1.148247, 0.8301836, 0, 0.6235294, 1, 1,
0.1591684, 1.05603, -0.03298417, 0, 0.6156863, 1, 1,
0.1599699, 2.050909, 0.06931634, 0, 0.6117647, 1, 1,
0.1643558, 0.9023551, 0.262865, 0, 0.6039216, 1, 1,
0.166477, -2.025176, 3.165742, 0, 0.5960785, 1, 1,
0.1670251, -0.6637695, 2.83372, 0, 0.5921569, 1, 1,
0.1673405, -0.4052397, 2.955392, 0, 0.5843138, 1, 1,
0.1681583, -0.1517751, 3.68467, 0, 0.5803922, 1, 1,
0.1697973, -0.9515328, 1.622794, 0, 0.572549, 1, 1,
0.1718351, 1.504049, 1.735803, 0, 0.5686275, 1, 1,
0.1720603, -0.961958, 4.147182, 0, 0.5607843, 1, 1,
0.1812062, 1.282402, -1.8815, 0, 0.5568628, 1, 1,
0.1821719, -0.317675, 1.080274, 0, 0.5490196, 1, 1,
0.183399, -0.5570047, 2.179133, 0, 0.5450981, 1, 1,
0.188057, -0.9869974, 3.989802, 0, 0.5372549, 1, 1,
0.1911234, 0.2897473, 0.5967444, 0, 0.5333334, 1, 1,
0.1931104, -0.1786628, 3.144965, 0, 0.5254902, 1, 1,
0.2016583, 1.378455, 0.6170231, 0, 0.5215687, 1, 1,
0.2080813, 0.5931014, 0.7688388, 0, 0.5137255, 1, 1,
0.2083757, -0.8451833, 3.293342, 0, 0.509804, 1, 1,
0.2117235, 0.9563212, -0.6798147, 0, 0.5019608, 1, 1,
0.2127616, -1.239725, 1.644669, 0, 0.4941176, 1, 1,
0.2138023, -1.908014, 4.95798, 0, 0.4901961, 1, 1,
0.2141355, -0.7596561, 3.363588, 0, 0.4823529, 1, 1,
0.2150986, 0.001217423, 3.111857, 0, 0.4784314, 1, 1,
0.2156515, 0.6848304, -0.5789979, 0, 0.4705882, 1, 1,
0.2198786, 0.04349705, 0.991016, 0, 0.4666667, 1, 1,
0.2213149, 1.380512, 0.3570708, 0, 0.4588235, 1, 1,
0.2217277, 0.9267429, -0.1310495, 0, 0.454902, 1, 1,
0.2261189, 0.0537264, 0.207496, 0, 0.4470588, 1, 1,
0.228225, -0.2388742, 2.329293, 0, 0.4431373, 1, 1,
0.2286855, -0.6022208, 1.970549, 0, 0.4352941, 1, 1,
0.234572, 0.09670645, 0.8968284, 0, 0.4313726, 1, 1,
0.2356628, 0.1500832, 1.398879, 0, 0.4235294, 1, 1,
0.2357614, -0.7646066, 0.7583508, 0, 0.4196078, 1, 1,
0.2386217, -0.2223743, 2.385049, 0, 0.4117647, 1, 1,
0.2429448, 1.058872, 0.9548342, 0, 0.4078431, 1, 1,
0.2462485, 0.3634151, -1.907642, 0, 0.4, 1, 1,
0.248246, -0.6903207, 3.994015, 0, 0.3921569, 1, 1,
0.2493181, -0.3300963, 2.145461, 0, 0.3882353, 1, 1,
0.256065, 0.4918238, 0.6359544, 0, 0.3803922, 1, 1,
0.2572357, -1.814134, 3.568317, 0, 0.3764706, 1, 1,
0.2581743, 0.345167, 2.156983, 0, 0.3686275, 1, 1,
0.2603836, 0.03361131, -0.1372241, 0, 0.3647059, 1, 1,
0.2616249, -0.280973, 3.741886, 0, 0.3568628, 1, 1,
0.2630435, 1.181555, 1.030915, 0, 0.3529412, 1, 1,
0.2636448, -0.2033543, 1.075205, 0, 0.345098, 1, 1,
0.2673927, 0.8476954, -0.8811793, 0, 0.3411765, 1, 1,
0.2674428, 0.3164491, 0.4397404, 0, 0.3333333, 1, 1,
0.2732034, -0.2276054, 2.631354, 0, 0.3294118, 1, 1,
0.2737389, -0.2288652, 1.829782, 0, 0.3215686, 1, 1,
0.2792115, 0.9757006, 0.7194938, 0, 0.3176471, 1, 1,
0.2824359, 0.9610906, -1.530362, 0, 0.3098039, 1, 1,
0.2833651, 0.2553123, 2.121702, 0, 0.3058824, 1, 1,
0.283927, 0.06494776, 1.718056, 0, 0.2980392, 1, 1,
0.2873606, -0.2551, 3.209446, 0, 0.2901961, 1, 1,
0.2917277, -0.04732353, 1.954498, 0, 0.2862745, 1, 1,
0.2928148, -0.346864, 3.215764, 0, 0.2784314, 1, 1,
0.2937165, -1.052521, 2.093416, 0, 0.2745098, 1, 1,
0.2938501, 0.2223573, 0.5266432, 0, 0.2666667, 1, 1,
0.2942899, -0.8515337, 2.642877, 0, 0.2627451, 1, 1,
0.3015802, 0.01244052, 2.113052, 0, 0.254902, 1, 1,
0.3042017, -1.285759, 4.489247, 0, 0.2509804, 1, 1,
0.3054092, 0.2214393, 1.845671, 0, 0.2431373, 1, 1,
0.3068881, 0.8662477, 2.012295, 0, 0.2392157, 1, 1,
0.3116255, 0.3167763, 0.08980159, 0, 0.2313726, 1, 1,
0.3207499, -0.6539607, 1.779992, 0, 0.227451, 1, 1,
0.3210209, 0.1692681, 2.196609, 0, 0.2196078, 1, 1,
0.3246276, -0.153148, 2.182927, 0, 0.2156863, 1, 1,
0.3284907, 1.017618, 0.4231631, 0, 0.2078431, 1, 1,
0.3316467, -1.450157, 4.124036, 0, 0.2039216, 1, 1,
0.3326861, 0.4103674, 0.9319196, 0, 0.1960784, 1, 1,
0.3328884, 0.4305323, 0.4537337, 0, 0.1882353, 1, 1,
0.3500687, -1.264302, 3.946495, 0, 0.1843137, 1, 1,
0.3514835, 0.3280453, 0.7541004, 0, 0.1764706, 1, 1,
0.3563896, 0.9114477, 0.6882368, 0, 0.172549, 1, 1,
0.3578224, -0.5489819, 1.497979, 0, 0.1647059, 1, 1,
0.3615291, 0.08645257, 0.2184379, 0, 0.1607843, 1, 1,
0.3620541, 1.498886, -0.06581449, 0, 0.1529412, 1, 1,
0.3636129, -1.074516, 3.320562, 0, 0.1490196, 1, 1,
0.3756318, 0.6367412, 0.4105127, 0, 0.1411765, 1, 1,
0.3768373, 0.2592691, 1.726179, 0, 0.1372549, 1, 1,
0.3773337, -0.02542201, 1.45072, 0, 0.1294118, 1, 1,
0.3775028, 1.270815, -0.3834498, 0, 0.1254902, 1, 1,
0.3778787, -0.5190032, 2.237457, 0, 0.1176471, 1, 1,
0.3789473, 1.157696, 1.151006, 0, 0.1137255, 1, 1,
0.3796207, -0.6308941, 2.944088, 0, 0.1058824, 1, 1,
0.3821527, 0.2047831, -0.2036552, 0, 0.09803922, 1, 1,
0.3873182, 0.648847, 2.650139, 0, 0.09411765, 1, 1,
0.3877677, 0.3078977, 0.9137332, 0, 0.08627451, 1, 1,
0.3891602, 0.455719, 0.8631781, 0, 0.08235294, 1, 1,
0.3922597, 1.801217, -0.3164226, 0, 0.07450981, 1, 1,
0.3986801, 0.7885177, -0.1825385, 0, 0.07058824, 1, 1,
0.4040596, -1.888311, 3.355311, 0, 0.0627451, 1, 1,
0.4055015, 1.083842, 1.546931, 0, 0.05882353, 1, 1,
0.4061863, 1.144385, 0.09352851, 0, 0.05098039, 1, 1,
0.4065801, 0.5532835, -0.4335554, 0, 0.04705882, 1, 1,
0.4082393, 0.08648033, 0.451251, 0, 0.03921569, 1, 1,
0.4091044, 0.6644573, 0.5644037, 0, 0.03529412, 1, 1,
0.410684, 0.7589432, 0.2813746, 0, 0.02745098, 1, 1,
0.4133084, 0.6210108, 1.801189, 0, 0.02352941, 1, 1,
0.4153813, 0.6305805, 0.2265236, 0, 0.01568628, 1, 1,
0.41831, -0.6669275, 3.518305, 0, 0.01176471, 1, 1,
0.4216833, 1.355085, 0.2302359, 0, 0.003921569, 1, 1,
0.4223044, 1.668384, 0.9686604, 0.003921569, 0, 1, 1,
0.4263006, -0.9584136, 2.527367, 0.007843138, 0, 1, 1,
0.4280912, 0.4921426, -0.220715, 0.01568628, 0, 1, 1,
0.4319338, -0.4917493, 1.595954, 0.01960784, 0, 1, 1,
0.4333231, 0.5349072, 2.219666, 0.02745098, 0, 1, 1,
0.4333763, -0.2192853, 0.6554229, 0.03137255, 0, 1, 1,
0.4336141, -0.1698203, 1.907619, 0.03921569, 0, 1, 1,
0.4364423, -0.2551051, 2.570314, 0.04313726, 0, 1, 1,
0.4423699, 0.7864296, -0.151069, 0.05098039, 0, 1, 1,
0.4431399, 0.4698756, 0.2067338, 0.05490196, 0, 1, 1,
0.4479858, 0.5902577, 0.1918778, 0.0627451, 0, 1, 1,
0.448458, 0.9507899, 0.9910376, 0.06666667, 0, 1, 1,
0.4486521, 0.9149604, 1.24533, 0.07450981, 0, 1, 1,
0.4496808, 0.9686197, 0.1594288, 0.07843138, 0, 1, 1,
0.4524468, -0.1654553, 2.83245, 0.08627451, 0, 1, 1,
0.4558391, -0.7376408, 2.501916, 0.09019608, 0, 1, 1,
0.4636667, 0.5794634, 1.554592, 0.09803922, 0, 1, 1,
0.4668835, 1.674387, -1.251179, 0.1058824, 0, 1, 1,
0.4708322, 1.053713, 0.9025115, 0.1098039, 0, 1, 1,
0.4758503, 0.05485107, 2.074616, 0.1176471, 0, 1, 1,
0.4775879, 0.2063021, 0.2511473, 0.1215686, 0, 1, 1,
0.4841715, 0.02974912, 1.977544, 0.1294118, 0, 1, 1,
0.4843415, -0.4347863, 2.793577, 0.1333333, 0, 1, 1,
0.4874518, -0.6856827, 3.258398, 0.1411765, 0, 1, 1,
0.4923419, -0.6318859, 4.37965, 0.145098, 0, 1, 1,
0.4992477, 0.9685385, -0.04177609, 0.1529412, 0, 1, 1,
0.4999351, -0.0877909, 1.147715, 0.1568628, 0, 1, 1,
0.5013371, -0.6006993, 1.457574, 0.1647059, 0, 1, 1,
0.5066476, 1.171114, 1.248162, 0.1686275, 0, 1, 1,
0.5075749, -0.7867115, 0.9753933, 0.1764706, 0, 1, 1,
0.5176408, 1.210641, 0.2934549, 0.1803922, 0, 1, 1,
0.5208804, 0.3150019, 1.524102, 0.1882353, 0, 1, 1,
0.5228152, 0.8065615, 0.5202536, 0.1921569, 0, 1, 1,
0.5261043, -0.7260559, 2.2128, 0.2, 0, 1, 1,
0.52694, -0.04966165, 1.035025, 0.2078431, 0, 1, 1,
0.5274118, -0.6208238, 3.509772, 0.2117647, 0, 1, 1,
0.5306379, -0.2652726, 2.525479, 0.2196078, 0, 1, 1,
0.536972, 0.9821389, -0.5767477, 0.2235294, 0, 1, 1,
0.5433255, -0.909319, 2.665892, 0.2313726, 0, 1, 1,
0.5437618, -0.6307813, 2.108194, 0.2352941, 0, 1, 1,
0.5470583, 0.5505049, 2.045735, 0.2431373, 0, 1, 1,
0.5529806, 0.5827625, 0.147245, 0.2470588, 0, 1, 1,
0.5578334, -0.3857099, 2.522895, 0.254902, 0, 1, 1,
0.5598281, 1.340482, -0.9966209, 0.2588235, 0, 1, 1,
0.5615035, 1.455868, 0.8700451, 0.2666667, 0, 1, 1,
0.562664, 1.015661, 0.03131568, 0.2705882, 0, 1, 1,
0.563171, -1.210241, 4.420611, 0.2784314, 0, 1, 1,
0.5662774, -0.2832829, 1.454477, 0.282353, 0, 1, 1,
0.5692317, 0.2605742, 0.7783547, 0.2901961, 0, 1, 1,
0.5696157, -0.7504034, 3.061342, 0.2941177, 0, 1, 1,
0.5698599, -1.408, 1.991945, 0.3019608, 0, 1, 1,
0.5724863, 0.554221, 1.607599, 0.3098039, 0, 1, 1,
0.5739757, -0.6497581, 3.975611, 0.3137255, 0, 1, 1,
0.5787411, -0.4926578, 1.176732, 0.3215686, 0, 1, 1,
0.5795377, 0.2904796, 2.09556, 0.3254902, 0, 1, 1,
0.5796387, 0.5060043, 1.223511, 0.3333333, 0, 1, 1,
0.5822977, 0.1139735, 0.4517514, 0.3372549, 0, 1, 1,
0.5871257, -1.966465, -0.3935728, 0.345098, 0, 1, 1,
0.5908004, -0.2201662, 1.004631, 0.3490196, 0, 1, 1,
0.5937762, 1.049356, -1.025205, 0.3568628, 0, 1, 1,
0.595942, 0.7381325, 0.5292392, 0.3607843, 0, 1, 1,
0.6023333, 0.3015677, 1.979498, 0.3686275, 0, 1, 1,
0.6063746, 0.4866109, 0.9008399, 0.372549, 0, 1, 1,
0.6122561, -0.3726164, 2.685312, 0.3803922, 0, 1, 1,
0.6204823, 1.585049, -1.744276, 0.3843137, 0, 1, 1,
0.6208615, 1.201559, 1.415758, 0.3921569, 0, 1, 1,
0.6210628, 0.2523812, 1.734777, 0.3960784, 0, 1, 1,
0.6309288, -1.347357, 2.721532, 0.4039216, 0, 1, 1,
0.6325718, 0.2066322, 1.138775, 0.4117647, 0, 1, 1,
0.6326237, -0.1524613, 2.686505, 0.4156863, 0, 1, 1,
0.6353807, -0.123766, 1.967666, 0.4235294, 0, 1, 1,
0.637109, 0.2431934, -0.4490905, 0.427451, 0, 1, 1,
0.6437678, -0.8026677, 2.861785, 0.4352941, 0, 1, 1,
0.6459994, -3.299956, 3.213249, 0.4392157, 0, 1, 1,
0.6480952, -1.652844, 0.6599581, 0.4470588, 0, 1, 1,
0.6483112, -1.850507, 3.694599, 0.4509804, 0, 1, 1,
0.648773, -0.4597354, 3.045902, 0.4588235, 0, 1, 1,
0.6488105, 0.7683887, 2.245312, 0.4627451, 0, 1, 1,
0.6517116, 2.059414, -0.4514062, 0.4705882, 0, 1, 1,
0.6575262, 0.1316015, 1.645346, 0.4745098, 0, 1, 1,
0.6616266, -0.4283584, 2.838747, 0.4823529, 0, 1, 1,
0.6692905, 0.5567674, 0.7985623, 0.4862745, 0, 1, 1,
0.6741728, -0.969749, 2.384731, 0.4941176, 0, 1, 1,
0.6772726, 0.2803783, 2.268961, 0.5019608, 0, 1, 1,
0.6806329, 0.2622891, 0.1579482, 0.5058824, 0, 1, 1,
0.6815597, 1.08094, 0.5006177, 0.5137255, 0, 1, 1,
0.6848098, 0.5064296, 1.503945, 0.5176471, 0, 1, 1,
0.6883818, 0.05331802, 1.222813, 0.5254902, 0, 1, 1,
0.6916339, 0.5869319, 0.6250145, 0.5294118, 0, 1, 1,
0.6937808, -0.8976517, 1.358481, 0.5372549, 0, 1, 1,
0.6945193, 0.03240413, 0.3435001, 0.5411765, 0, 1, 1,
0.6959793, 0.265969, 2.565559, 0.5490196, 0, 1, 1,
0.6991738, -1.245503, 1.668063, 0.5529412, 0, 1, 1,
0.7079372, 0.3786492, -0.7504978, 0.5607843, 0, 1, 1,
0.7149969, -0.2409974, 2.65608, 0.5647059, 0, 1, 1,
0.7167566, -0.3640009, 3.337302, 0.572549, 0, 1, 1,
0.7197277, -0.5996927, 4.009703, 0.5764706, 0, 1, 1,
0.7232652, 0.3367983, 2.360706, 0.5843138, 0, 1, 1,
0.7291037, -0.7497865, 2.339784, 0.5882353, 0, 1, 1,
0.7300039, -0.2026046, -0.2358024, 0.5960785, 0, 1, 1,
0.7312817, 0.3148082, 0.6994244, 0.6039216, 0, 1, 1,
0.7331877, 0.851847, 1.093674, 0.6078432, 0, 1, 1,
0.7389833, -2.174486, 0.8628029, 0.6156863, 0, 1, 1,
0.7421135, -1.32317, 4.148477, 0.6196079, 0, 1, 1,
0.7460166, 0.04095257, 2.735578, 0.627451, 0, 1, 1,
0.7463209, 1.049672, -0.0958642, 0.6313726, 0, 1, 1,
0.7488962, 0.1316116, 0.9512333, 0.6392157, 0, 1, 1,
0.756179, -0.2648565, 1.570575, 0.6431373, 0, 1, 1,
0.7591984, 1.139006, -0.5866016, 0.6509804, 0, 1, 1,
0.7649688, -0.4982805, 2.554778, 0.654902, 0, 1, 1,
0.7763093, 0.6156745, 1.15717, 0.6627451, 0, 1, 1,
0.7763957, -0.1364979, 1.060701, 0.6666667, 0, 1, 1,
0.7767888, 0.7329929, 1.584376, 0.6745098, 0, 1, 1,
0.7834322, 0.7473433, 0.8066317, 0.6784314, 0, 1, 1,
0.7851388, -0.154199, 2.596123, 0.6862745, 0, 1, 1,
0.7879696, -0.2991988, 1.625356, 0.6901961, 0, 1, 1,
0.789372, 0.2405396, 2.672272, 0.6980392, 0, 1, 1,
0.7961644, -1.142094, 3.431596, 0.7058824, 0, 1, 1,
0.804843, 0.4705351, -0.04126866, 0.7098039, 0, 1, 1,
0.805888, -1.064359, 4.093039, 0.7176471, 0, 1, 1,
0.8059418, 1.363892, -0.5959333, 0.7215686, 0, 1, 1,
0.8094395, -0.4197807, 0.8568108, 0.7294118, 0, 1, 1,
0.8100831, -0.1993822, 3.030655, 0.7333333, 0, 1, 1,
0.8142708, -1.946292, 2.930079, 0.7411765, 0, 1, 1,
0.817422, 0.1620424, 1.378779, 0.7450981, 0, 1, 1,
0.8234946, 0.1448328, 0.5172284, 0.7529412, 0, 1, 1,
0.8238615, 0.6335719, -0.04656008, 0.7568628, 0, 1, 1,
0.8281726, -0.1630899, 0.4536192, 0.7647059, 0, 1, 1,
0.8282381, -0.00767254, 1.760149, 0.7686275, 0, 1, 1,
0.8333389, -0.9457573, 3.637969, 0.7764706, 0, 1, 1,
0.8343922, 0.8933368, -0.06489749, 0.7803922, 0, 1, 1,
0.8396139, -0.7982876, 2.361157, 0.7882353, 0, 1, 1,
0.8410414, 0.4905806, 1.712552, 0.7921569, 0, 1, 1,
0.8458741, 0.8154081, 1.516506, 0.8, 0, 1, 1,
0.8491635, -0.5847343, 0.994167, 0.8078431, 0, 1, 1,
0.8497008, 0.3818259, 1.917314, 0.8117647, 0, 1, 1,
0.8540915, 0.8889238, 2.180468, 0.8196079, 0, 1, 1,
0.8577513, 0.4493588, 0.8107644, 0.8235294, 0, 1, 1,
0.8636397, 1.743059, 1.697728, 0.8313726, 0, 1, 1,
0.8656144, -1.68713, 3.673417, 0.8352941, 0, 1, 1,
0.866701, -1.643122, 0.4014271, 0.8431373, 0, 1, 1,
0.8700388, 0.002672343, 2.444065, 0.8470588, 0, 1, 1,
0.8728948, 1.113816, 1.472013, 0.854902, 0, 1, 1,
0.8797002, 0.4834626, 0.8864724, 0.8588235, 0, 1, 1,
0.880592, -1.263309, 3.457459, 0.8666667, 0, 1, 1,
0.8873709, -0.5475566, 1.744267, 0.8705882, 0, 1, 1,
0.8976926, -0.5219482, 1.710671, 0.8784314, 0, 1, 1,
0.904853, -0.6504678, 2.328929, 0.8823529, 0, 1, 1,
0.9064091, 1.853848, -0.6144553, 0.8901961, 0, 1, 1,
0.9123126, -0.9597278, 3.384723, 0.8941177, 0, 1, 1,
0.9141097, -1.282808, 2.820677, 0.9019608, 0, 1, 1,
0.9160479, 0.133816, 0.9741063, 0.9098039, 0, 1, 1,
0.9227297, -1.404509, 2.584237, 0.9137255, 0, 1, 1,
0.9241488, 1.242207, 0.7428369, 0.9215686, 0, 1, 1,
0.9296363, 0.06793691, 1.436649, 0.9254902, 0, 1, 1,
0.9327023, -1.808712, 2.851027, 0.9333333, 0, 1, 1,
0.9336461, 0.5198494, -0.191893, 0.9372549, 0, 1, 1,
0.9347778, -0.1325962, 2.677915, 0.945098, 0, 1, 1,
0.9356318, 0.2243668, 0.483224, 0.9490196, 0, 1, 1,
0.9484161, 0.7537955, 2.020328, 0.9568627, 0, 1, 1,
0.9500236, -1.421699, 2.129418, 0.9607843, 0, 1, 1,
0.9543221, 0.3491566, 1.367383, 0.9686275, 0, 1, 1,
0.9550096, -0.04972946, -0.06097041, 0.972549, 0, 1, 1,
0.9571399, -0.5480794, -0.06864934, 0.9803922, 0, 1, 1,
0.9574341, 0.4516658, 1.758922, 0.9843137, 0, 1, 1,
0.9679084, -0.990949, 3.533878, 0.9921569, 0, 1, 1,
0.9784981, -0.4979977, 0.5419892, 0.9960784, 0, 1, 1,
0.9854712, 0.9672021, -0.08734574, 1, 0, 0.9960784, 1,
0.9886118, 0.8112533, 1.986057, 1, 0, 0.9882353, 1,
0.9956651, -0.2456768, 2.051368, 1, 0, 0.9843137, 1,
0.9971756, 1.114116, 0.6634275, 1, 0, 0.9764706, 1,
0.9986833, -0.2137778, 2.987586, 1, 0, 0.972549, 1,
0.9988417, 1.646549, 0.6761203, 1, 0, 0.9647059, 1,
1.002421, 0.7916174, 1.790331, 1, 0, 0.9607843, 1,
1.012853, -0.3506854, 2.981167, 1, 0, 0.9529412, 1,
1.014474, 1.146519, -1.960726, 1, 0, 0.9490196, 1,
1.014621, -1.150185, 3.150927, 1, 0, 0.9411765, 1,
1.01511, -1.138906, 1.572787, 1, 0, 0.9372549, 1,
1.01676, -0.5636459, 2.45397, 1, 0, 0.9294118, 1,
1.021143, 2.144873, 0.8951234, 1, 0, 0.9254902, 1,
1.02385, 0.4296884, 2.762893, 1, 0, 0.9176471, 1,
1.02458, -1.288352, 1.919184, 1, 0, 0.9137255, 1,
1.037376, 0.1702935, 2.359476, 1, 0, 0.9058824, 1,
1.039176, 0.8083026, 1.741852, 1, 0, 0.9019608, 1,
1.044717, -0.6585174, 1.534907, 1, 0, 0.8941177, 1,
1.051179, 1.387584, 0.7187896, 1, 0, 0.8862745, 1,
1.055677, -0.4347607, 0.9906973, 1, 0, 0.8823529, 1,
1.056655, 0.1296133, 1.681368, 1, 0, 0.8745098, 1,
1.057189, 0.1919809, 3.090815, 1, 0, 0.8705882, 1,
1.059495, 0.7554263, 0.6551166, 1, 0, 0.8627451, 1,
1.076349, -0.7201772, 1.980906, 1, 0, 0.8588235, 1,
1.078467, 1.487618, -0.1875277, 1, 0, 0.8509804, 1,
1.078505, 1.076789, -0.3315589, 1, 0, 0.8470588, 1,
1.083881, -1.229422, 2.100271, 1, 0, 0.8392157, 1,
1.084299, 1.700164, 0.2896234, 1, 0, 0.8352941, 1,
1.091839, 0.496885, 1.187989, 1, 0, 0.827451, 1,
1.097183, -1.912266, 2.892564, 1, 0, 0.8235294, 1,
1.097556, -0.8461138, 1.592886, 1, 0, 0.8156863, 1,
1.100716, 1.646478, 0.9022067, 1, 0, 0.8117647, 1,
1.108006, 0.3374169, 0.448095, 1, 0, 0.8039216, 1,
1.110621, 0.2037222, -1.266343, 1, 0, 0.7960784, 1,
1.116434, -1.147779, 2.204451, 1, 0, 0.7921569, 1,
1.12339, -0.3594871, 2.137309, 1, 0, 0.7843137, 1,
1.127317, -0.3554007, 2.890845, 1, 0, 0.7803922, 1,
1.13299, 1.305532, 0.2743018, 1, 0, 0.772549, 1,
1.143018, -0.5808237, 3.641948, 1, 0, 0.7686275, 1,
1.147471, 0.47417, 2.050437, 1, 0, 0.7607843, 1,
1.147915, -0.2920529, 2.667348, 1, 0, 0.7568628, 1,
1.148295, 1.543342, -1.000337, 1, 0, 0.7490196, 1,
1.153337, 1.398523, 0.3163354, 1, 0, 0.7450981, 1,
1.153838, 0.3048254, 4.021434, 1, 0, 0.7372549, 1,
1.15604, -0.5470428, 1.06405, 1, 0, 0.7333333, 1,
1.157896, -0.5690283, 2.02859, 1, 0, 0.7254902, 1,
1.16655, -0.7902076, 3.413793, 1, 0, 0.7215686, 1,
1.171686, 0.6336451, 0.4701932, 1, 0, 0.7137255, 1,
1.175458, 0.8597148, 0.2145638, 1, 0, 0.7098039, 1,
1.177944, 0.3786494, 1.49857, 1, 0, 0.7019608, 1,
1.179678, -0.5656641, 2.612278, 1, 0, 0.6941177, 1,
1.180385, 0.8788868, 1.964705, 1, 0, 0.6901961, 1,
1.197439, 0.5961257, 1.956056, 1, 0, 0.682353, 1,
1.204576, 0.4820082, 0.8182697, 1, 0, 0.6784314, 1,
1.216426, -0.7403775, 3.424822, 1, 0, 0.6705883, 1,
1.218511, -0.7404237, 3.026539, 1, 0, 0.6666667, 1,
1.222755, -1.203102, 3.25606, 1, 0, 0.6588235, 1,
1.229357, -0.8293325, 2.745771, 1, 0, 0.654902, 1,
1.229477, -1.473054, 1.68557, 1, 0, 0.6470588, 1,
1.234374, -0.3060701, 2.927429, 1, 0, 0.6431373, 1,
1.237282, -1.042287, 3.047375, 1, 0, 0.6352941, 1,
1.247664, -0.2919442, 1.59744, 1, 0, 0.6313726, 1,
1.253377, 0.2828514, 3.255147, 1, 0, 0.6235294, 1,
1.25615, 0.06054231, 2.127512, 1, 0, 0.6196079, 1,
1.258813, -1.40251, 3.732291, 1, 0, 0.6117647, 1,
1.261414, -1.045612, 2.274966, 1, 0, 0.6078432, 1,
1.266563, 0.1229816, 1.116969, 1, 0, 0.6, 1,
1.276907, 0.5028003, 0.1055043, 1, 0, 0.5921569, 1,
1.286183, -1.963525, 3.843502, 1, 0, 0.5882353, 1,
1.294519, -0.2678499, 3.20705, 1, 0, 0.5803922, 1,
1.302248, 0.9257845, 0.6422909, 1, 0, 0.5764706, 1,
1.303819, -0.3394435, 2.573566, 1, 0, 0.5686275, 1,
1.311498, -0.197442, 2.753692, 1, 0, 0.5647059, 1,
1.316628, 0.7998074, 0.9066064, 1, 0, 0.5568628, 1,
1.319335, 1.216364, 1.960602, 1, 0, 0.5529412, 1,
1.332987, 0.8723134, 0.5154364, 1, 0, 0.5450981, 1,
1.347595, -1.246126, 2.298328, 1, 0, 0.5411765, 1,
1.35364, 1.418555, 1.010375, 1, 0, 0.5333334, 1,
1.358532, 1.46178, 2.441367, 1, 0, 0.5294118, 1,
1.35898, 0.1382935, 0.351442, 1, 0, 0.5215687, 1,
1.359339, -0.3950515, 2.321811, 1, 0, 0.5176471, 1,
1.364169, 0.01215492, 2.851487, 1, 0, 0.509804, 1,
1.377166, -0.4910678, 2.050369, 1, 0, 0.5058824, 1,
1.377687, -1.033352, 2.024783, 1, 0, 0.4980392, 1,
1.383528, -0.8291032, 3.146309, 1, 0, 0.4901961, 1,
1.385499, 0.2800986, 0.9465801, 1, 0, 0.4862745, 1,
1.392878, 0.6293738, 2.78746, 1, 0, 0.4784314, 1,
1.401323, 0.6370763, 1.655088, 1, 0, 0.4745098, 1,
1.404167, 0.6632014, 1.62096, 1, 0, 0.4666667, 1,
1.40493, -1.401547, 3.58831, 1, 0, 0.4627451, 1,
1.407812, -0.1151436, 2.30687, 1, 0, 0.454902, 1,
1.409836, -0.8612022, 2.090771, 1, 0, 0.4509804, 1,
1.41095, -0.004400769, 1.841046, 1, 0, 0.4431373, 1,
1.411526, -1.850494, 1.843846, 1, 0, 0.4392157, 1,
1.42038, -0.5152398, 1.950805, 1, 0, 0.4313726, 1,
1.438329, 1.022979, 0.5717972, 1, 0, 0.427451, 1,
1.442405, 0.1231866, 2.052571, 1, 0, 0.4196078, 1,
1.450748, 0.27225, 0.8194619, 1, 0, 0.4156863, 1,
1.453873, -1.21365, 0.7069371, 1, 0, 0.4078431, 1,
1.459707, 0.1273054, 3.371657, 1, 0, 0.4039216, 1,
1.47683, 1.624426, 1.529871, 1, 0, 0.3960784, 1,
1.478466, 1.052635, 0.0004506829, 1, 0, 0.3882353, 1,
1.485259, -0.2508223, 2.236442, 1, 0, 0.3843137, 1,
1.492942, 0.1270549, 1.492007, 1, 0, 0.3764706, 1,
1.509323, -0.77303, 0.3389837, 1, 0, 0.372549, 1,
1.516975, 0.5640199, 0.7148823, 1, 0, 0.3647059, 1,
1.524531, 0.6509305, 2.66657, 1, 0, 0.3607843, 1,
1.524825, -0.1513954, 3.631131, 1, 0, 0.3529412, 1,
1.531181, 0.08082137, 1.491046, 1, 0, 0.3490196, 1,
1.532555, 1.182746, 1.214031, 1, 0, 0.3411765, 1,
1.53279, -1.829124, 1.376181, 1, 0, 0.3372549, 1,
1.536147, 0.4686906, -0.1917677, 1, 0, 0.3294118, 1,
1.537558, -0.4708662, 2.003522, 1, 0, 0.3254902, 1,
1.54548, 0.9834174, 1.27681, 1, 0, 0.3176471, 1,
1.554751, 0.7620075, 1.189059, 1, 0, 0.3137255, 1,
1.557931, 0.5809141, -0.6543372, 1, 0, 0.3058824, 1,
1.558307, -1.046832, 1.324312, 1, 0, 0.2980392, 1,
1.574552, -0.1505018, 2.442479, 1, 0, 0.2941177, 1,
1.595515, 0.09558048, 2.845541, 1, 0, 0.2862745, 1,
1.606821, 0.3387383, 0.0811308, 1, 0, 0.282353, 1,
1.609961, 1.548187, 0.9407645, 1, 0, 0.2745098, 1,
1.611913, 0.03431819, 0.9232088, 1, 0, 0.2705882, 1,
1.637638, -0.09372635, 1.133639, 1, 0, 0.2627451, 1,
1.643226, 0.6655506, 2.217563, 1, 0, 0.2588235, 1,
1.654539, -0.6474129, 2.10121, 1, 0, 0.2509804, 1,
1.65864, -0.06131604, 3.318349, 1, 0, 0.2470588, 1,
1.665735, 0.9525358, -0.4428108, 1, 0, 0.2392157, 1,
1.668334, -0.2385288, 3.363704, 1, 0, 0.2352941, 1,
1.689139, -0.7543281, 0.8421169, 1, 0, 0.227451, 1,
1.729285, 0.1960815, 2.580293, 1, 0, 0.2235294, 1,
1.771239, -0.4173304, 0.5692353, 1, 0, 0.2156863, 1,
1.774926, -0.7371536, 3.070965, 1, 0, 0.2117647, 1,
1.777499, -0.8070706, 2.603363, 1, 0, 0.2039216, 1,
1.797631, 0.4915497, 2.23778, 1, 0, 0.1960784, 1,
1.833496, -1.619201, 2.014736, 1, 0, 0.1921569, 1,
1.882619, -0.5629702, 3.809515, 1, 0, 0.1843137, 1,
1.910999, -1.506206, 1.288392, 1, 0, 0.1803922, 1,
1.92018, -0.02712098, 1.442089, 1, 0, 0.172549, 1,
1.951636, -0.1715578, 1.701488, 1, 0, 0.1686275, 1,
1.958448, 1.846887, -1.732019, 1, 0, 0.1607843, 1,
1.963242, 2.111084, 1.41435, 1, 0, 0.1568628, 1,
1.973772, -0.1360304, 1.87791, 1, 0, 0.1490196, 1,
1.990479, -0.4240758, 1.289288, 1, 0, 0.145098, 1,
1.996598, -0.1374794, 1.870144, 1, 0, 0.1372549, 1,
2.024297, 0.4599787, 0.5324007, 1, 0, 0.1333333, 1,
2.025077, -0.7993569, 2.549377, 1, 0, 0.1254902, 1,
2.055271, -0.004353777, 0.4317454, 1, 0, 0.1215686, 1,
2.056165, 0.9828758, 0.9830546, 1, 0, 0.1137255, 1,
2.079247, 0.2450424, 1.328603, 1, 0, 0.1098039, 1,
2.082012, -0.9625566, 1.318307, 1, 0, 0.1019608, 1,
2.088377, -1.421812, 2.387583, 1, 0, 0.09411765, 1,
2.090718, 0.07983093, 1.784982, 1, 0, 0.09019608, 1,
2.103751, 2.161271, 0.4821, 1, 0, 0.08235294, 1,
2.17039, -1.497998, 2.569578, 1, 0, 0.07843138, 1,
2.268488, 0.9325883, 1.017767, 1, 0, 0.07058824, 1,
2.282311, 0.2049919, 3.6279, 1, 0, 0.06666667, 1,
2.284299, 0.07495799, 1.69711, 1, 0, 0.05882353, 1,
2.304621, 0.3460295, 1.408892, 1, 0, 0.05490196, 1,
2.360526, 1.091648, 1.770188, 1, 0, 0.04705882, 1,
2.38231, -1.130353, 1.966319, 1, 0, 0.04313726, 1,
2.418328, 1.107332, -0.5293227, 1, 0, 0.03529412, 1,
2.491555, 1.385703, 1.778719, 1, 0, 0.03137255, 1,
2.532544, 0.9537446, 1.711148, 1, 0, 0.02352941, 1,
2.563463, 1.058101, -0.337795, 1, 0, 0.01960784, 1,
2.617719, 1.605503, -0.7146201, 1, 0, 0.01176471, 1,
2.73795, 0.6643361, 0.4803879, 1, 0, 0.007843138, 1
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
-0.06225562, -4.373021, -7.568475, 0, -0.5, 0.5, 0.5,
-0.06225562, -4.373021, -7.568475, 1, -0.5, 0.5, 0.5,
-0.06225562, -4.373021, -7.568475, 1, 1.5, 0.5, 0.5,
-0.06225562, -4.373021, -7.568475, 0, 1.5, 0.5, 0.5
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
-3.811731, -0.1345732, -7.568475, 0, -0.5, 0.5, 0.5,
-3.811731, -0.1345732, -7.568475, 1, -0.5, 0.5, 0.5,
-3.811731, -0.1345732, -7.568475, 1, 1.5, 0.5, 0.5,
-3.811731, -0.1345732, -7.568475, 0, 1.5, 0.5, 0.5
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
-3.811731, -4.373021, -0.3974948, 0, -0.5, 0.5, 0.5,
-3.811731, -4.373021, -0.3974948, 1, -0.5, 0.5, 0.5,
-3.811731, -4.373021, -0.3974948, 1, 1.5, 0.5, 0.5,
-3.811731, -4.373021, -0.3974948, 0, 1.5, 0.5, 0.5
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
-2, -3.394918, -5.913633,
2, -3.394918, -5.913633,
-2, -3.394918, -5.913633,
-2, -3.557935, -6.18944,
-1, -3.394918, -5.913633,
-1, -3.557935, -6.18944,
0, -3.394918, -5.913633,
0, -3.557935, -6.18944,
1, -3.394918, -5.913633,
1, -3.557935, -6.18944,
2, -3.394918, -5.913633,
2, -3.557935, -6.18944
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
-2, -3.88397, -6.741055, 0, -0.5, 0.5, 0.5,
-2, -3.88397, -6.741055, 1, -0.5, 0.5, 0.5,
-2, -3.88397, -6.741055, 1, 1.5, 0.5, 0.5,
-2, -3.88397, -6.741055, 0, 1.5, 0.5, 0.5,
-1, -3.88397, -6.741055, 0, -0.5, 0.5, 0.5,
-1, -3.88397, -6.741055, 1, -0.5, 0.5, 0.5,
-1, -3.88397, -6.741055, 1, 1.5, 0.5, 0.5,
-1, -3.88397, -6.741055, 0, 1.5, 0.5, 0.5,
0, -3.88397, -6.741055, 0, -0.5, 0.5, 0.5,
0, -3.88397, -6.741055, 1, -0.5, 0.5, 0.5,
0, -3.88397, -6.741055, 1, 1.5, 0.5, 0.5,
0, -3.88397, -6.741055, 0, 1.5, 0.5, 0.5,
1, -3.88397, -6.741055, 0, -0.5, 0.5, 0.5,
1, -3.88397, -6.741055, 1, -0.5, 0.5, 0.5,
1, -3.88397, -6.741055, 1, 1.5, 0.5, 0.5,
1, -3.88397, -6.741055, 0, 1.5, 0.5, 0.5,
2, -3.88397, -6.741055, 0, -0.5, 0.5, 0.5,
2, -3.88397, -6.741055, 1, -0.5, 0.5, 0.5,
2, -3.88397, -6.741055, 1, 1.5, 0.5, 0.5,
2, -3.88397, -6.741055, 0, 1.5, 0.5, 0.5
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
-2.946467, -3, -5.913633,
-2.946467, 3, -5.913633,
-2.946467, -3, -5.913633,
-3.090678, -3, -6.18944,
-2.946467, -2, -5.913633,
-3.090678, -2, -6.18944,
-2.946467, -1, -5.913633,
-3.090678, -1, -6.18944,
-2.946467, 0, -5.913633,
-3.090678, 0, -6.18944,
-2.946467, 1, -5.913633,
-3.090678, 1, -6.18944,
-2.946467, 2, -5.913633,
-3.090678, 2, -6.18944,
-2.946467, 3, -5.913633,
-3.090678, 3, -6.18944
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
-3.379099, -3, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, -3, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, -3, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, -3, -6.741055, 0, 1.5, 0.5, 0.5,
-3.379099, -2, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, -2, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, -2, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, -2, -6.741055, 0, 1.5, 0.5, 0.5,
-3.379099, -1, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, -1, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, -1, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, -1, -6.741055, 0, 1.5, 0.5, 0.5,
-3.379099, 0, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, 0, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, 0, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, 0, -6.741055, 0, 1.5, 0.5, 0.5,
-3.379099, 1, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, 1, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, 1, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, 1, -6.741055, 0, 1.5, 0.5, 0.5,
-3.379099, 2, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, 2, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, 2, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, 2, -6.741055, 0, 1.5, 0.5, 0.5,
-3.379099, 3, -6.741055, 0, -0.5, 0.5, 0.5,
-3.379099, 3, -6.741055, 1, -0.5, 0.5, 0.5,
-3.379099, 3, -6.741055, 1, 1.5, 0.5, 0.5,
-3.379099, 3, -6.741055, 0, 1.5, 0.5, 0.5
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
-2.946467, -3.394918, -4,
-2.946467, -3.394918, 4,
-2.946467, -3.394918, -4,
-3.090678, -3.557935, -4,
-2.946467, -3.394918, -2,
-3.090678, -3.557935, -2,
-2.946467, -3.394918, 0,
-3.090678, -3.557935, 0,
-2.946467, -3.394918, 2,
-3.090678, -3.557935, 2,
-2.946467, -3.394918, 4,
-3.090678, -3.557935, 4
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
-3.379099, -3.88397, -4, 0, -0.5, 0.5, 0.5,
-3.379099, -3.88397, -4, 1, -0.5, 0.5, 0.5,
-3.379099, -3.88397, -4, 1, 1.5, 0.5, 0.5,
-3.379099, -3.88397, -4, 0, 1.5, 0.5, 0.5,
-3.379099, -3.88397, -2, 0, -0.5, 0.5, 0.5,
-3.379099, -3.88397, -2, 1, -0.5, 0.5, 0.5,
-3.379099, -3.88397, -2, 1, 1.5, 0.5, 0.5,
-3.379099, -3.88397, -2, 0, 1.5, 0.5, 0.5,
-3.379099, -3.88397, 0, 0, -0.5, 0.5, 0.5,
-3.379099, -3.88397, 0, 1, -0.5, 0.5, 0.5,
-3.379099, -3.88397, 0, 1, 1.5, 0.5, 0.5,
-3.379099, -3.88397, 0, 0, 1.5, 0.5, 0.5,
-3.379099, -3.88397, 2, 0, -0.5, 0.5, 0.5,
-3.379099, -3.88397, 2, 1, -0.5, 0.5, 0.5,
-3.379099, -3.88397, 2, 1, 1.5, 0.5, 0.5,
-3.379099, -3.88397, 2, 0, 1.5, 0.5, 0.5,
-3.379099, -3.88397, 4, 0, -0.5, 0.5, 0.5,
-3.379099, -3.88397, 4, 1, -0.5, 0.5, 0.5,
-3.379099, -3.88397, 4, 1, 1.5, 0.5, 0.5,
-3.379099, -3.88397, 4, 0, 1.5, 0.5, 0.5
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
-2.946467, -3.394918, -5.913633,
-2.946467, 3.125771, -5.913633,
-2.946467, -3.394918, 5.118644,
-2.946467, 3.125771, 5.118644,
-2.946467, -3.394918, -5.913633,
-2.946467, -3.394918, 5.118644,
-2.946467, 3.125771, -5.913633,
-2.946467, 3.125771, 5.118644,
-2.946467, -3.394918, -5.913633,
2.821956, -3.394918, -5.913633,
-2.946467, -3.394918, 5.118644,
2.821956, -3.394918, 5.118644,
-2.946467, 3.125771, -5.913633,
2.821956, 3.125771, -5.913633,
-2.946467, 3.125771, 5.118644,
2.821956, 3.125771, 5.118644,
2.821956, -3.394918, -5.913633,
2.821956, 3.125771, -5.913633,
2.821956, -3.394918, 5.118644,
2.821956, 3.125771, 5.118644,
2.821956, -3.394918, -5.913633,
2.821956, -3.394918, 5.118644,
2.821956, 3.125771, -5.913633,
2.821956, 3.125771, 5.118644
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
var radius = 7.504379;
var distance = 33.38783;
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
mvMatrix.translate( 0.06225562, 0.1345732, 0.3974948 );
mvMatrix.scale( 1.406603, 1.244329, 0.7354676 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.38783);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
secbumeton<-read.table("secbumeton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-secbumeton$V2
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
```

```r
y<-secbumeton$V3
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
```

```r
z<-secbumeton$V4
```

```
## Error in eval(expr, envir, enclos): object 'secbumeton' not found
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
-2.862461, 0.1000553, -2.000745, 0, 0, 1, 1, 1,
-2.74596, -0.8203587, -2.432157, 1, 0, 0, 1, 1,
-2.699798, 0.1330926, -1.289211, 1, 0, 0, 1, 1,
-2.672527, 1.236439, -0.6833085, 1, 0, 0, 1, 1,
-2.620607, -1.273104, -1.027154, 1, 0, 0, 1, 1,
-2.612897, -0.6199384, -2.809713, 1, 0, 0, 1, 1,
-2.596533, 0.1114492, -2.564167, 0, 0, 0, 1, 1,
-2.541513, -1.80232, -1.858439, 0, 0, 0, 1, 1,
-2.540534, 0.6797476, -1.615974, 0, 0, 0, 1, 1,
-2.531723, 0.861621, 0.9433592, 0, 0, 0, 1, 1,
-2.487116, -1.096797, -2.099473, 0, 0, 0, 1, 1,
-2.479626, -0.1953271, -2.001724, 0, 0, 0, 1, 1,
-2.467538, 0.564575, -0.6091405, 0, 0, 0, 1, 1,
-2.404586, -0.762245, -2.936584, 1, 1, 1, 1, 1,
-2.380282, 1.153796, -2.632544, 1, 1, 1, 1, 1,
-2.352376, -0.6169003, -2.350462, 1, 1, 1, 1, 1,
-2.242295, -0.6600554, -2.630372, 1, 1, 1, 1, 1,
-2.208303, -0.3036089, -3.867205, 1, 1, 1, 1, 1,
-2.200785, -0.122425, -1.662143, 1, 1, 1, 1, 1,
-2.197592, 1.693989, 0.2614127, 1, 1, 1, 1, 1,
-2.157558, -1.807852, -4.521713, 1, 1, 1, 1, 1,
-2.120647, 1.816189, -1.364535, 1, 1, 1, 1, 1,
-2.113239, 0.2696089, -0.7636546, 1, 1, 1, 1, 1,
-2.07014, 0.2547549, -1.786055, 1, 1, 1, 1, 1,
-2.040354, 1.590282, -1.372717, 1, 1, 1, 1, 1,
-2.031989, 0.6683197, -1.979178, 1, 1, 1, 1, 1,
-2.008841, 0.174763, -2.429776, 1, 1, 1, 1, 1,
-1.972909, -1.62348, -3.306194, 1, 1, 1, 1, 1,
-1.969943, -1.151615, -2.689943, 0, 0, 1, 1, 1,
-1.964984, -1.229907, -1.3882, 1, 0, 0, 1, 1,
-1.940069, 1.833616, -0.1538677, 1, 0, 0, 1, 1,
-1.923105, -0.3206735, -2.41882, 1, 0, 0, 1, 1,
-1.883844, -0.2754456, -2.789758, 1, 0, 0, 1, 1,
-1.877296, -1.873049, -1.835909, 1, 0, 0, 1, 1,
-1.872714, -0.4973377, -0.3366909, 0, 0, 0, 1, 1,
-1.861281, -1.016353, -2.408944, 0, 0, 0, 1, 1,
-1.856868, -0.2877561, -0.5971158, 0, 0, 0, 1, 1,
-1.847684, 0.2970898, -1.937112, 0, 0, 0, 1, 1,
-1.819992, -0.6432042, -1.361248, 0, 0, 0, 1, 1,
-1.766682, -0.2209169, -1.057095, 0, 0, 0, 1, 1,
-1.750983, -1.443768, -2.48882, 0, 0, 0, 1, 1,
-1.749732, -0.1869386, -2.612044, 1, 1, 1, 1, 1,
-1.739979, 0.1714723, -1.767586, 1, 1, 1, 1, 1,
-1.728734, 1.284018, -0.8926042, 1, 1, 1, 1, 1,
-1.708097, 0.8244225, -0.1115185, 1, 1, 1, 1, 1,
-1.680885, -1.596611, -3.07566, 1, 1, 1, 1, 1,
-1.673722, -1.198138, -3.396952, 1, 1, 1, 1, 1,
-1.657876, -2.291568, -4.041018, 1, 1, 1, 1, 1,
-1.655207, 1.797497, 0.1123272, 1, 1, 1, 1, 1,
-1.622579, -0.06459999, -1.957362, 1, 1, 1, 1, 1,
-1.609778, -2.340011, 0.8937404, 1, 1, 1, 1, 1,
-1.602666, -0.2307393, -1.107528, 1, 1, 1, 1, 1,
-1.595884, -0.659133, -1.669104, 1, 1, 1, 1, 1,
-1.577583, 0.5049534, -2.059734, 1, 1, 1, 1, 1,
-1.571821, -0.2533787, -1.277726, 1, 1, 1, 1, 1,
-1.568797, -0.7386054, -1.900092, 1, 1, 1, 1, 1,
-1.568197, -0.3296906, -1.175431, 0, 0, 1, 1, 1,
-1.547152, -0.3388905, 0.1464564, 1, 0, 0, 1, 1,
-1.544926, 0.4678918, -2.064221, 1, 0, 0, 1, 1,
-1.533644, -2.039163, -2.714705, 1, 0, 0, 1, 1,
-1.525423, 0.841948, -0.2391103, 1, 0, 0, 1, 1,
-1.503497, -0.2977827, -2.316613, 1, 0, 0, 1, 1,
-1.503258, -0.707618, -3.17247, 0, 0, 0, 1, 1,
-1.499687, 0.3328142, -1.092932, 0, 0, 0, 1, 1,
-1.498844, -1.47798, -2.860162, 0, 0, 0, 1, 1,
-1.486997, 1.744355, 0.8800948, 0, 0, 0, 1, 1,
-1.486202, 0.1011077, 0.08737117, 0, 0, 0, 1, 1,
-1.484258, -0.5000592, -2.03322, 0, 0, 0, 1, 1,
-1.484242, -1.205272, -2.116972, 0, 0, 0, 1, 1,
-1.483749, 2.0128, -1.421623, 1, 1, 1, 1, 1,
-1.468733, -0.5937555, -0.3342607, 1, 1, 1, 1, 1,
-1.468091, -1.9048, -3.752369, 1, 1, 1, 1, 1,
-1.448912, 0.005082457, -2.035575, 1, 1, 1, 1, 1,
-1.444956, 0.9740076, 0.4832432, 1, 1, 1, 1, 1,
-1.414147, 0.08751149, -2.101289, 1, 1, 1, 1, 1,
-1.414103, 0.2015485, -2.857717, 1, 1, 1, 1, 1,
-1.410111, 0.9656672, 0.4485043, 1, 1, 1, 1, 1,
-1.39777, -1.779953, -1.093071, 1, 1, 1, 1, 1,
-1.390655, 0.3948544, -2.511955, 1, 1, 1, 1, 1,
-1.389471, -0.761167, -1.980345, 1, 1, 1, 1, 1,
-1.379037, -0.6815318, -3.789777, 1, 1, 1, 1, 1,
-1.373761, 0.04454092, -2.345607, 1, 1, 1, 1, 1,
-1.370263, 0.02548859, -1.917052, 1, 1, 1, 1, 1,
-1.361706, 0.4371886, 0.7173691, 1, 1, 1, 1, 1,
-1.356538, 0.7694492, -0.3321777, 0, 0, 1, 1, 1,
-1.344246, 1.006951, -0.4370266, 1, 0, 0, 1, 1,
-1.337588, 1.365287, 0.04161891, 1, 0, 0, 1, 1,
-1.329767, 0.4256956, -0.3421304, 1, 0, 0, 1, 1,
-1.322631, -0.1158096, -2.303505, 1, 0, 0, 1, 1,
-1.315555, -1.018903, -2.019634, 1, 0, 0, 1, 1,
-1.312917, -0.8060396, -2.197167, 0, 0, 0, 1, 1,
-1.310951, 1.507784, -1.815616, 0, 0, 0, 1, 1,
-1.309866, 0.2506613, -0.6244534, 0, 0, 0, 1, 1,
-1.307921, 0.5859872, 0.2148274, 0, 0, 0, 1, 1,
-1.293814, 1.229376, -1.508331, 0, 0, 0, 1, 1,
-1.292953, -1.887562, -2.074049, 0, 0, 0, 1, 1,
-1.290885, 0.3968829, -0.338073, 0, 0, 0, 1, 1,
-1.283584, 2.295332, 0.1856311, 1, 1, 1, 1, 1,
-1.282356, 0.2796455, -0.3146807, 1, 1, 1, 1, 1,
-1.279491, -1.492715, -0.7044374, 1, 1, 1, 1, 1,
-1.269426, 1.150261, -0.4442343, 1, 1, 1, 1, 1,
-1.26369, 1.154746, -0.1735244, 1, 1, 1, 1, 1,
-1.257125, 0.6064599, -1.26397, 1, 1, 1, 1, 1,
-1.254989, 1.571641, -0.8517864, 1, 1, 1, 1, 1,
-1.247007, -1.327595, -0.8826569, 1, 1, 1, 1, 1,
-1.24592, 0.5775542, -0.1940409, 1, 1, 1, 1, 1,
-1.231655, -1.015754, -4.259106, 1, 1, 1, 1, 1,
-1.228864, 0.5891512, -1.399916, 1, 1, 1, 1, 1,
-1.227242, 0.2207997, -2.308402, 1, 1, 1, 1, 1,
-1.226214, 0.7495551, -1.731563, 1, 1, 1, 1, 1,
-1.218483, -0.01699336, -2.543311, 1, 1, 1, 1, 1,
-1.216934, 0.3735179, -0.98638, 1, 1, 1, 1, 1,
-1.215286, -1.570451, -3.096024, 0, 0, 1, 1, 1,
-1.213686, 0.8884379, -1.724508, 1, 0, 0, 1, 1,
-1.207388, 0.4288437, 0.3860017, 1, 0, 0, 1, 1,
-1.198717, 0.2935736, -1.969387, 1, 0, 0, 1, 1,
-1.19208, -0.06660251, -1.843163, 1, 0, 0, 1, 1,
-1.188715, -1.435402, -1.325137, 1, 0, 0, 1, 1,
-1.186418, 0.8689204, -1.445208, 0, 0, 0, 1, 1,
-1.18498, -3.019311, -4.607314, 0, 0, 0, 1, 1,
-1.175803, 2.056164, -1.145967, 0, 0, 0, 1, 1,
-1.169113, 1.375446, -2.725298, 0, 0, 0, 1, 1,
-1.168627, -2.216466, -1.420399, 0, 0, 0, 1, 1,
-1.132297, -0.9083601, -4.202374, 0, 0, 0, 1, 1,
-1.131647, 0.9440946, -1.068128, 0, 0, 0, 1, 1,
-1.130467, 2.035079, -0.3752324, 1, 1, 1, 1, 1,
-1.117435, 1.618282, -1.265571, 1, 1, 1, 1, 1,
-1.113353, -1.386488, -3.857544, 1, 1, 1, 1, 1,
-1.112591, -0.0271135, -1.42899, 1, 1, 1, 1, 1,
-1.109167, -0.5963362, -3.184405, 1, 1, 1, 1, 1,
-1.102534, -0.4553411, -2.336231, 1, 1, 1, 1, 1,
-1.102458, 0.2195806, -1.364784, 1, 1, 1, 1, 1,
-1.102235, 0.07010226, -2.493886, 1, 1, 1, 1, 1,
-1.09502, 1.707951, -0.7520981, 1, 1, 1, 1, 1,
-1.094341, 0.3782353, -1.036799, 1, 1, 1, 1, 1,
-1.091929, -0.5876596, -3.039956, 1, 1, 1, 1, 1,
-1.089395, -1.285902, -3.97832, 1, 1, 1, 1, 1,
-1.08906, 0.06583249, -2.190098, 1, 1, 1, 1, 1,
-1.080723, -0.08145782, -0.1722499, 1, 1, 1, 1, 1,
-1.080578, 0.5518686, -1.924224, 1, 1, 1, 1, 1,
-1.071273, 1.510262, 0.3565827, 0, 0, 1, 1, 1,
-1.063892, 1.588427, -0.9112301, 1, 0, 0, 1, 1,
-1.058933, 0.3407989, -1.189227, 1, 0, 0, 1, 1,
-1.048365, 0.8316385, -0.171395, 1, 0, 0, 1, 1,
-1.04497, -0.873577, -2.343592, 1, 0, 0, 1, 1,
-1.041531, 0.09504072, -0.8109803, 1, 0, 0, 1, 1,
-1.02463, 0.4870705, -1.028274, 0, 0, 0, 1, 1,
-1.012576, -1.531304, -2.489119, 0, 0, 0, 1, 1,
-1.006604, 0.3586106, -2.504718, 0, 0, 0, 1, 1,
-1.005826, 0.4769162, 0.1365499, 0, 0, 0, 1, 1,
-1.005328, -1.670557, -4.441607, 0, 0, 0, 1, 1,
-1.002615, -0.7552649, -3.165708, 0, 0, 0, 1, 1,
-0.9993085, -0.1277526, -1.410483, 0, 0, 0, 1, 1,
-0.9927991, 0.3678017, -2.131018, 1, 1, 1, 1, 1,
-0.981829, -0.8721637, -2.898641, 1, 1, 1, 1, 1,
-0.9792852, -0.258595, -2.262735, 1, 1, 1, 1, 1,
-0.9755209, -1.147986, -3.27497, 1, 1, 1, 1, 1,
-0.9626638, -0.8332479, -2.777154, 1, 1, 1, 1, 1,
-0.9615248, -0.5921668, -1.837998, 1, 1, 1, 1, 1,
-0.9550081, 0.5246984, -0.2812534, 1, 1, 1, 1, 1,
-0.9472046, -0.1935478, -1.402736, 1, 1, 1, 1, 1,
-0.9439034, -0.4077322, -2.955435, 1, 1, 1, 1, 1,
-0.940845, 1.331236, -0.5572133, 1, 1, 1, 1, 1,
-0.9375001, -0.0186301, -1.713122, 1, 1, 1, 1, 1,
-0.9374281, 0.2681373, 0.2888188, 1, 1, 1, 1, 1,
-0.9356111, 1.071691, 0.0211814, 1, 1, 1, 1, 1,
-0.9291826, 0.02310151, -1.431237, 1, 1, 1, 1, 1,
-0.9137499, 0.7558728, 0.3045936, 1, 1, 1, 1, 1,
-0.9121362, -1.24841, -2.854359, 0, 0, 1, 1, 1,
-0.9067557, 0.9115239, -0.3824615, 1, 0, 0, 1, 1,
-0.9067187, -0.7334935, -1.140296, 1, 0, 0, 1, 1,
-0.9037331, 0.187762, -0.9830554, 1, 0, 0, 1, 1,
-0.8918195, 0.3087851, -2.537833, 1, 0, 0, 1, 1,
-0.8914129, -0.67705, -2.591644, 1, 0, 0, 1, 1,
-0.8891709, -1.906303, -0.3750133, 0, 0, 0, 1, 1,
-0.8816507, -0.2128874, -3.010863, 0, 0, 0, 1, 1,
-0.877386, 0.4756613, -0.5372119, 0, 0, 0, 1, 1,
-0.8772815, 0.0274268, -1.818289, 0, 0, 0, 1, 1,
-0.8757443, 1.605218, -1.149752, 0, 0, 0, 1, 1,
-0.8718554, 0.06826378, -1.595847, 0, 0, 0, 1, 1,
-0.8701493, 0.003655036, -3.888988, 0, 0, 0, 1, 1,
-0.8689619, 0.1254382, -1.217698, 1, 1, 1, 1, 1,
-0.8685954, -0.4514833, -2.27282, 1, 1, 1, 1, 1,
-0.8666215, 0.1167754, -1.892127, 1, 1, 1, 1, 1,
-0.8643737, 0.7852639, 0.8699376, 1, 1, 1, 1, 1,
-0.863129, -0.3489538, -1.33362, 1, 1, 1, 1, 1,
-0.8625231, 0.8848507, 0.5264965, 1, 1, 1, 1, 1,
-0.8589443, -1.158057, -2.465857, 1, 1, 1, 1, 1,
-0.8549585, 0.1739974, -1.472436, 1, 1, 1, 1, 1,
-0.85168, 0.9069219, -0.2665122, 1, 1, 1, 1, 1,
-0.8490819, 1.092253, 0.7757422, 1, 1, 1, 1, 1,
-0.838012, 0.1237766, -1.76733, 1, 1, 1, 1, 1,
-0.8328215, 0.8011616, -1.359344, 1, 1, 1, 1, 1,
-0.8280312, 1.08259, -0.5010846, 1, 1, 1, 1, 1,
-0.8258768, -0.3092106, -1.902577, 1, 1, 1, 1, 1,
-0.8249512, 1.285656, -1.947642, 1, 1, 1, 1, 1,
-0.8204404, 0.3957346, -0.4399834, 0, 0, 1, 1, 1,
-0.8117727, 0.1684757, -2.702697, 1, 0, 0, 1, 1,
-0.811753, -1.66574, -1.046398, 1, 0, 0, 1, 1,
-0.8085942, 1.525666, -1.674774, 1, 0, 0, 1, 1,
-0.8077877, -0.6906502, -3.055727, 1, 0, 0, 1, 1,
-0.8052554, -1.688915, -2.459359, 1, 0, 0, 1, 1,
-0.8049009, 1.301343, -1.338781, 0, 0, 0, 1, 1,
-0.8023114, 0.4751922, -1.912248, 0, 0, 0, 1, 1,
-0.7963068, -1.970052, -0.04491627, 0, 0, 0, 1, 1,
-0.7888308, 0.3378763, -2.512152, 0, 0, 0, 1, 1,
-0.788825, 0.8698251, -0.4197497, 0, 0, 0, 1, 1,
-0.7887622, -1.764587, -2.830694, 0, 0, 0, 1, 1,
-0.7832249, 1.930119, 1.092389, 0, 0, 0, 1, 1,
-0.7806529, -0.657769, -1.515698, 1, 1, 1, 1, 1,
-0.7792498, -0.1579076, -1.128233, 1, 1, 1, 1, 1,
-0.7766669, -0.7829106, -2.638155, 1, 1, 1, 1, 1,
-0.7760778, 0.4288514, -1.699706, 1, 1, 1, 1, 1,
-0.7722943, -1.693496, -1.750054, 1, 1, 1, 1, 1,
-0.770112, -0.1273134, -3.57179, 1, 1, 1, 1, 1,
-0.7682988, 2.147971, -0.3749698, 1, 1, 1, 1, 1,
-0.767575, -0.8333359, -3.874645, 1, 1, 1, 1, 1,
-0.7659523, -0.2212755, -2.128388, 1, 1, 1, 1, 1,
-0.762554, 0.8995053, -0.4039124, 1, 1, 1, 1, 1,
-0.7621491, 0.6024777, -1.968681, 1, 1, 1, 1, 1,
-0.7512759, -0.3068276, -1.426393, 1, 1, 1, 1, 1,
-0.7482748, 1.392996, -0.1935868, 1, 1, 1, 1, 1,
-0.7426932, 2.044491, 0.4014956, 1, 1, 1, 1, 1,
-0.7415966, -0.5251091, -2.178071, 1, 1, 1, 1, 1,
-0.7411094, 0.3251781, -2.430683, 0, 0, 1, 1, 1,
-0.7408625, 0.148996, -0.6983373, 1, 0, 0, 1, 1,
-0.739704, -0.4924791, 0.1915747, 1, 0, 0, 1, 1,
-0.7360629, 0.8118122, -0.7562133, 1, 0, 0, 1, 1,
-0.7341001, 1.035189, -0.5940162, 1, 0, 0, 1, 1,
-0.732501, 1.938862, -0.5120575, 1, 0, 0, 1, 1,
-0.7291195, 0.4851112, -0.1900856, 0, 0, 0, 1, 1,
-0.7270572, 1.187997, -1.067124, 0, 0, 0, 1, 1,
-0.7261528, 0.4963387, -1.269661, 0, 0, 0, 1, 1,
-0.7215867, 0.2253111, -0.3360713, 0, 0, 0, 1, 1,
-0.7215567, -0.001709627, -0.884303, 0, 0, 0, 1, 1,
-0.7137808, 0.9091355, -1.836391, 0, 0, 0, 1, 1,
-0.7129974, -2.28542, -2.278013, 0, 0, 0, 1, 1,
-0.711271, 0.2454934, -1.598099, 1, 1, 1, 1, 1,
-0.7073991, 0.2986612, -1.46143, 1, 1, 1, 1, 1,
-0.7073957, -0.5015202, -2.238346, 1, 1, 1, 1, 1,
-0.7069861, -0.3036382, -2.833913, 1, 1, 1, 1, 1,
-0.7055731, -0.5238391, -0.330566, 1, 1, 1, 1, 1,
-0.7042491, -1.059175, -1.681179, 1, 1, 1, 1, 1,
-0.7019602, -1.6054, -1.541913, 1, 1, 1, 1, 1,
-0.701741, -0.654718, -1.337396, 1, 1, 1, 1, 1,
-0.7002244, 0.9152367, -0.1054244, 1, 1, 1, 1, 1,
-0.6965068, -0.7099239, -2.366716, 1, 1, 1, 1, 1,
-0.6953246, 1.682355, -0.5812223, 1, 1, 1, 1, 1,
-0.6942995, -1.988244, -0.8514608, 1, 1, 1, 1, 1,
-0.6938826, 0.9759086, 0.8171074, 1, 1, 1, 1, 1,
-0.6927696, -1.066654, -1.276248, 1, 1, 1, 1, 1,
-0.6867219, -1.360277, -3.307114, 1, 1, 1, 1, 1,
-0.6857349, 1.106463, -3.522255, 0, 0, 1, 1, 1,
-0.6784746, -1.707969, -1.280736, 1, 0, 0, 1, 1,
-0.6738315, 1.658898, -0.7757917, 1, 0, 0, 1, 1,
-0.6728594, 0.02378116, -1.105494, 1, 0, 0, 1, 1,
-0.6712492, -0.8674439, -0.302866, 1, 0, 0, 1, 1,
-0.66926, 0.6467286, 0.0711114, 1, 0, 0, 1, 1,
-0.6678954, 0.1143854, -1.725912, 0, 0, 0, 1, 1,
-0.6669974, -0.09442565, -1.843278, 0, 0, 0, 1, 1,
-0.6654737, 0.2276765, -2.209938, 0, 0, 0, 1, 1,
-0.6647056, 1.32949, -0.4406047, 0, 0, 0, 1, 1,
-0.6589149, -1.469058, -2.249689, 0, 0, 0, 1, 1,
-0.6580731, -0.4182968, -3.058594, 0, 0, 0, 1, 1,
-0.6573499, -0.7321718, -2.321993, 0, 0, 0, 1, 1,
-0.6549104, 0.005197584, -3.055287, 1, 1, 1, 1, 1,
-0.6548968, 1.838898, -2.148649, 1, 1, 1, 1, 1,
-0.654511, -0.9527163, -1.268462, 1, 1, 1, 1, 1,
-0.6529988, -0.3899561, -2.410976, 1, 1, 1, 1, 1,
-0.6483515, 0.4535599, -0.4891059, 1, 1, 1, 1, 1,
-0.6382057, 0.9104732, -0.01626233, 1, 1, 1, 1, 1,
-0.637366, -1.51858, -4.25037, 1, 1, 1, 1, 1,
-0.6325955, -0.8927428, -2.981363, 1, 1, 1, 1, 1,
-0.6320055, 0.6232113, -0.5046871, 1, 1, 1, 1, 1,
-0.6298187, -0.6141222, -3.682656, 1, 1, 1, 1, 1,
-0.6284021, -1.067892, -0.7574046, 1, 1, 1, 1, 1,
-0.6267757, 0.01277005, -2.320534, 1, 1, 1, 1, 1,
-0.6264169, 0.4137911, -3.008191, 1, 1, 1, 1, 1,
-0.6262169, 1.75687, 0.6980327, 1, 1, 1, 1, 1,
-0.6243903, 0.2347918, -0.9586141, 1, 1, 1, 1, 1,
-0.6240408, 0.1304859, -2.423586, 0, 0, 1, 1, 1,
-0.6229424, 1.816402, -0.5973815, 1, 0, 0, 1, 1,
-0.6226602, -1.179433, -1.796297, 1, 0, 0, 1, 1,
-0.6177105, 0.6855369, -0.1421322, 1, 0, 0, 1, 1,
-0.6158442, -0.8130619, -3.703348, 1, 0, 0, 1, 1,
-0.6132636, 0.1117956, -0.9508186, 1, 0, 0, 1, 1,
-0.6113398, -1.548143, -2.999365, 0, 0, 0, 1, 1,
-0.6087718, 0.655394, -1.351933, 0, 0, 0, 1, 1,
-0.6076364, 0.01973426, -1.798738, 0, 0, 0, 1, 1,
-0.6056939, -1.715801, -0.9851963, 0, 0, 0, 1, 1,
-0.6044576, -0.03517014, -2.440608, 0, 0, 0, 1, 1,
-0.6033596, -0.1524424, -3.375303, 0, 0, 0, 1, 1,
-0.6028881, -0.6796958, -2.375006, 0, 0, 0, 1, 1,
-0.6005511, -0.4209542, -1.534961, 1, 1, 1, 1, 1,
-0.5983725, 1.559945, -1.514359, 1, 1, 1, 1, 1,
-0.5973825, 1.287552, -0.1717034, 1, 1, 1, 1, 1,
-0.5969239, -0.3697324, -1.536481, 1, 1, 1, 1, 1,
-0.5948206, -0.8080204, -3.786752, 1, 1, 1, 1, 1,
-0.5932167, 2.301236, 0.02663043, 1, 1, 1, 1, 1,
-0.5917394, -0.8646904, -3.092197, 1, 1, 1, 1, 1,
-0.591105, -0.4726283, -4.129273, 1, 1, 1, 1, 1,
-0.58999, 2.381748, -0.4852829, 1, 1, 1, 1, 1,
-0.5898778, 0.5526078, -0.1280997, 1, 1, 1, 1, 1,
-0.5898588, -1.369801, -2.389311, 1, 1, 1, 1, 1,
-0.5883617, -0.1454248, -1.214003, 1, 1, 1, 1, 1,
-0.5872528, -0.7231398, -3.579734, 1, 1, 1, 1, 1,
-0.5829561, 0.1272444, 0.3385692, 1, 1, 1, 1, 1,
-0.5819442, -0.5346428, -2.111382, 1, 1, 1, 1, 1,
-0.5730042, -0.3595533, -0.8705556, 0, 0, 1, 1, 1,
-0.571775, -0.6992627, -2.401058, 1, 0, 0, 1, 1,
-0.568531, 3.03081, -0.4043415, 1, 0, 0, 1, 1,
-0.5659179, -1.526841, -2.752387, 1, 0, 0, 1, 1,
-0.5641474, -0.04880029, -4.256866, 1, 0, 0, 1, 1,
-0.5628793, 0.8881089, -1.352754, 1, 0, 0, 1, 1,
-0.5626884, -0.3637436, -2.763227, 0, 0, 0, 1, 1,
-0.5547007, 0.3179225, -1.572714, 0, 0, 0, 1, 1,
-0.5482113, 0.474155, 0.02055376, 0, 0, 0, 1, 1,
-0.5448979, -0.4836725, -4.581157, 0, 0, 0, 1, 1,
-0.5441973, 0.05946511, -1.913343, 0, 0, 0, 1, 1,
-0.5409646, 0.02061166, -1.322111, 0, 0, 0, 1, 1,
-0.5370873, -0.3833247, -1.887626, 0, 0, 0, 1, 1,
-0.5370254, -0.3060926, -3.302177, 1, 1, 1, 1, 1,
-0.5354617, -2.289935, -1.241667, 1, 1, 1, 1, 1,
-0.5331826, -2.518454, -2.198086, 1, 1, 1, 1, 1,
-0.5328718, -1.786333, -3.733036, 1, 1, 1, 1, 1,
-0.5322402, -0.2412449, -1.465913, 1, 1, 1, 1, 1,
-0.5263882, 2.259716, 0.3845879, 1, 1, 1, 1, 1,
-0.5150971, 0.002846772, -2.096081, 1, 1, 1, 1, 1,
-0.5107909, -1.612824, -2.909913, 1, 1, 1, 1, 1,
-0.5022719, -0.585714, -1.66358, 1, 1, 1, 1, 1,
-0.4957017, -0.8404473, -3.552384, 1, 1, 1, 1, 1,
-0.4838137, 1.111061, 0.1627298, 1, 1, 1, 1, 1,
-0.4818515, 0.9804991, -1.008256, 1, 1, 1, 1, 1,
-0.4775908, -0.3714123, -1.081772, 1, 1, 1, 1, 1,
-0.4775532, 0.2311566, -0.6607524, 1, 1, 1, 1, 1,
-0.4772976, -0.8181438, -3.161079, 1, 1, 1, 1, 1,
-0.4752772, -1.005091, -3.297674, 0, 0, 1, 1, 1,
-0.4750857, -0.3404969, -3.304193, 1, 0, 0, 1, 1,
-0.4741693, -0.3046259, -3.725134, 1, 0, 0, 1, 1,
-0.4738364, 1.137249, -1.35509, 1, 0, 0, 1, 1,
-0.4732697, 1.515556, -0.5448783, 1, 0, 0, 1, 1,
-0.4708121, -0.7073236, -3.669926, 1, 0, 0, 1, 1,
-0.4680618, 1.1653, -0.2039412, 0, 0, 0, 1, 1,
-0.4662307, -0.9687842, -2.552769, 0, 0, 0, 1, 1,
-0.4643557, 0.3976576, -2.787218, 0, 0, 0, 1, 1,
-0.4623085, 1.011401, -0.8117888, 0, 0, 0, 1, 1,
-0.4582444, 2.143075, -1.695977, 0, 0, 0, 1, 1,
-0.4555804, -1.394414, -2.542542, 0, 0, 0, 1, 1,
-0.4531714, -1.431391, -2.314534, 0, 0, 0, 1, 1,
-0.4470247, -0.5224571, -3.246985, 1, 1, 1, 1, 1,
-0.4441132, -1.166203, -4.144508, 1, 1, 1, 1, 1,
-0.4422782, -0.2144576, -2.593111, 1, 1, 1, 1, 1,
-0.4400952, -0.6647239, -1.910361, 1, 1, 1, 1, 1,
-0.43894, 0.8961673, -1.160918, 1, 1, 1, 1, 1,
-0.4374407, -0.0006446232, -0.1349246, 1, 1, 1, 1, 1,
-0.4368198, -1.892306, -5.752969, 1, 1, 1, 1, 1,
-0.4365854, -1.671314, -1.92075, 1, 1, 1, 1, 1,
-0.4357108, -0.6393672, -1.586307, 1, 1, 1, 1, 1,
-0.435344, 0.7168278, -0.2780753, 1, 1, 1, 1, 1,
-0.4297296, -1.661134, -2.757038, 1, 1, 1, 1, 1,
-0.4282947, -1.078403, -3.047359, 1, 1, 1, 1, 1,
-0.4270188, 1.316039, 0.6105682, 1, 1, 1, 1, 1,
-0.4251738, 0.4197505, 0.6809307, 1, 1, 1, 1, 1,
-0.4244444, -0.9288154, -2.755948, 1, 1, 1, 1, 1,
-0.4229435, 1.024525, -1.662622, 0, 0, 1, 1, 1,
-0.4227764, 0.09678984, -0.8377102, 1, 0, 0, 1, 1,
-0.4225285, 1.922753, -1.651241, 1, 0, 0, 1, 1,
-0.4183914, 1.304632, -1.423851, 1, 0, 0, 1, 1,
-0.4143792, 0.975897, -0.4142427, 1, 0, 0, 1, 1,
-0.4118291, 0.8684582, -0.3825846, 1, 0, 0, 1, 1,
-0.4092215, -0.2915069, -2.077689, 0, 0, 0, 1, 1,
-0.4078291, -1.418713, -2.417559, 0, 0, 0, 1, 1,
-0.4077986, 0.9166218, 0.4238022, 0, 0, 0, 1, 1,
-0.4040223, -0.1059325, -3.41265, 0, 0, 0, 1, 1,
-0.4021171, -0.2733067, -1.916534, 0, 0, 0, 1, 1,
-0.3951389, -1.562041, -3.222815, 0, 0, 0, 1, 1,
-0.393513, -3.024937, -3.007878, 0, 0, 0, 1, 1,
-0.3896479, 0.454249, -1.259161, 1, 1, 1, 1, 1,
-0.3850178, 0.9834965, 0.2095167, 1, 1, 1, 1, 1,
-0.3849648, 1.278471, 0.779295, 1, 1, 1, 1, 1,
-0.3790287, -0.8741826, -2.118304, 1, 1, 1, 1, 1,
-0.3780333, -1.753542, -3.399087, 1, 1, 1, 1, 1,
-0.3766932, -0.04181139, -0.7903079, 1, 1, 1, 1, 1,
-0.3708155, -1.300884, -2.56338, 1, 1, 1, 1, 1,
-0.3673712, -0.5465116, -2.47588, 1, 1, 1, 1, 1,
-0.3614106, 0.3835169, -1.122786, 1, 1, 1, 1, 1,
-0.3582518, 1.000024, 0.3315728, 1, 1, 1, 1, 1,
-0.3571658, -0.08556861, -1.671697, 1, 1, 1, 1, 1,
-0.3567745, -0.5623307, -4.573768, 1, 1, 1, 1, 1,
-0.3525548, 0.408824, 1.460907, 1, 1, 1, 1, 1,
-0.3490294, -0.1425778, -1.41203, 1, 1, 1, 1, 1,
-0.3479773, 1.598111, 1.508947, 1, 1, 1, 1, 1,
-0.3428181, -0.4982269, -1.816419, 0, 0, 1, 1, 1,
-0.3374608, 1.264878, -0.7300306, 1, 0, 0, 1, 1,
-0.3338285, -0.388477, -2.405892, 1, 0, 0, 1, 1,
-0.3317525, 0.32207, -3.065374, 1, 0, 0, 1, 1,
-0.3316602, -0.4262893, -3.96159, 1, 0, 0, 1, 1,
-0.3228804, -0.3285955, -2.094681, 1, 0, 0, 1, 1,
-0.3172562, 0.002062205, -0.8360465, 0, 0, 0, 1, 1,
-0.3170097, -0.7478489, -0.9275049, 0, 0, 0, 1, 1,
-0.3163931, -1.012365, -1.098662, 0, 0, 0, 1, 1,
-0.3138771, 0.7753255, -1.080224, 0, 0, 0, 1, 1,
-0.3099312, 0.4799358, 0.5590512, 0, 0, 0, 1, 1,
-0.3023877, 0.1427208, -0.7089656, 0, 0, 0, 1, 1,
-0.3010397, -0.1455837, -1.237675, 0, 0, 0, 1, 1,
-0.2993308, -0.4124587, -4.300831, 1, 1, 1, 1, 1,
-0.2979732, -0.4541302, -2.450208, 1, 1, 1, 1, 1,
-0.2951866, 0.2645856, -1.805094, 1, 1, 1, 1, 1,
-0.2869381, -0.2762963, -0.06750152, 1, 1, 1, 1, 1,
-0.286835, -2.205549, -2.7063, 1, 1, 1, 1, 1,
-0.2860077, 1.383148, 0.5412118, 1, 1, 1, 1, 1,
-0.2800237, -0.7699882, -4.100108, 1, 1, 1, 1, 1,
-0.2749607, -1.778699, -1.410295, 1, 1, 1, 1, 1,
-0.2724342, 0.8907032, -1.714592, 1, 1, 1, 1, 1,
-0.2722822, -0.3429326, -2.494433, 1, 1, 1, 1, 1,
-0.2692474, 0.3232921, -1.907158, 1, 1, 1, 1, 1,
-0.2629115, 0.8997826, 0.7706845, 1, 1, 1, 1, 1,
-0.2605418, -0.9285578, -4.433527, 1, 1, 1, 1, 1,
-0.2580428, 0.05584634, -0.5654204, 1, 1, 1, 1, 1,
-0.2568572, -0.7262974, -3.378071, 1, 1, 1, 1, 1,
-0.2542751, 0.6198344, -0.8258878, 0, 0, 1, 1, 1,
-0.2414024, -1.516062, -3.966115, 1, 0, 0, 1, 1,
-0.2403645, 0.679969, 0.7530009, 1, 0, 0, 1, 1,
-0.2343696, -0.3357216, -2.62401, 1, 0, 0, 1, 1,
-0.2336799, 0.3286482, -1.821269, 1, 0, 0, 1, 1,
-0.2298311, 1.008671, -0.9582843, 1, 0, 0, 1, 1,
-0.2216746, -1.44885, -4.007047, 0, 0, 0, 1, 1,
-0.2132844, 1.414837, -0.4453619, 0, 0, 0, 1, 1,
-0.2106729, 0.5268013, -0.03007625, 0, 0, 0, 1, 1,
-0.2074314, 0.9492435, -0.9954239, 0, 0, 0, 1, 1,
-0.2048359, -0.2273101, -2.694397, 0, 0, 0, 1, 1,
-0.202799, -1.119328, -1.862631, 0, 0, 0, 1, 1,
-0.1967501, 0.2204371, -2.199887, 0, 0, 0, 1, 1,
-0.1954469, -1.349815, -3.94968, 1, 1, 1, 1, 1,
-0.1897124, -1.088776, -2.505739, 1, 1, 1, 1, 1,
-0.1887554, 0.7723977, -1.473726, 1, 1, 1, 1, 1,
-0.1880374, -2.08171, -3.420873, 1, 1, 1, 1, 1,
-0.1847774, -0.466421, -2.320981, 1, 1, 1, 1, 1,
-0.1845769, -1.998027, -1.776724, 1, 1, 1, 1, 1,
-0.1833553, -1.051524, -3.168603, 1, 1, 1, 1, 1,
-0.1808109, -0.3749477, -2.133971, 1, 1, 1, 1, 1,
-0.1785597, 0.559148, 1.751033, 1, 1, 1, 1, 1,
-0.1772081, 1.352349, 0.6517893, 1, 1, 1, 1, 1,
-0.1752692, 1.124228, -1.260037, 1, 1, 1, 1, 1,
-0.1729431, -1.076367, -4.42, 1, 1, 1, 1, 1,
-0.1709787, -0.7043748, -2.426213, 1, 1, 1, 1, 1,
-0.1687748, 0.1821665, 1.379471, 1, 1, 1, 1, 1,
-0.1616294, -0.6211672, -3.30139, 1, 1, 1, 1, 1,
-0.1508091, -0.2984062, -2.802115, 0, 0, 1, 1, 1,
-0.1504102, 1.7137, 0.2693915, 1, 0, 0, 1, 1,
-0.1450897, 1.709487, -0.6267797, 1, 0, 0, 1, 1,
-0.1440939, 1.846155, -0.04251304, 1, 0, 0, 1, 1,
-0.1422107, 0.01378527, -1.450212, 1, 0, 0, 1, 1,
-0.1420752, -0.1999855, -4.087997, 1, 0, 0, 1, 1,
-0.1340553, 0.1300732, -0.5900589, 0, 0, 0, 1, 1,
-0.1285229, 0.8125018, 0.4083201, 0, 0, 0, 1, 1,
-0.1234834, -1.178562, -1.599769, 0, 0, 0, 1, 1,
-0.1218595, -1.31041, -3.012565, 0, 0, 0, 1, 1,
-0.1199835, 2.771611, -0.3197942, 0, 0, 0, 1, 1,
-0.1190315, 0.9280925, 1.478152, 0, 0, 0, 1, 1,
-0.118961, 1.042552, -1.263615, 0, 0, 0, 1, 1,
-0.1159922, -0.9789031, -2.081392, 1, 1, 1, 1, 1,
-0.1153975, -0.8805733, -2.767146, 1, 1, 1, 1, 1,
-0.1124669, 1.74163, 1.388491, 1, 1, 1, 1, 1,
-0.1104375, -0.7251198, -3.969355, 1, 1, 1, 1, 1,
-0.1089482, 0.5051186, -2.460833, 1, 1, 1, 1, 1,
-0.108686, 0.3499912, 1.171035, 1, 1, 1, 1, 1,
-0.1056372, -0.2939702, -2.473578, 1, 1, 1, 1, 1,
-0.1055121, 1.716293, -0.5930415, 1, 1, 1, 1, 1,
-0.1004038, 0.4494528, 0.8197767, 1, 1, 1, 1, 1,
-0.09939331, 0.04896981, -1.461355, 1, 1, 1, 1, 1,
-0.09688248, 1.609201, -1.079612, 1, 1, 1, 1, 1,
-0.09584238, -0.9217286, -3.665175, 1, 1, 1, 1, 1,
-0.0929609, 0.2440021, -1.664431, 1, 1, 1, 1, 1,
-0.09187949, -0.221186, -2.826522, 1, 1, 1, 1, 1,
-0.0898404, 0.6823031, -0.8053086, 1, 1, 1, 1, 1,
-0.08750312, -0.04184236, -2.844009, 0, 0, 1, 1, 1,
-0.08603022, 1.643353, 2.866187, 1, 0, 0, 1, 1,
-0.0820415, 0.8952327, -1.238691, 1, 0, 0, 1, 1,
-0.08090414, 1.156057, 1.163396, 1, 0, 0, 1, 1,
-0.08082921, -0.5548208, -2.832209, 1, 0, 0, 1, 1,
-0.07823697, 0.1974771, -0.8494822, 1, 0, 0, 1, 1,
-0.07522571, -0.5658941, -3.958761, 0, 0, 0, 1, 1,
-0.07326446, 0.08379921, -0.4071012, 0, 0, 0, 1, 1,
-0.07128904, -0.06753045, -1.790638, 0, 0, 0, 1, 1,
-0.06619358, 1.726863, -0.1658092, 0, 0, 0, 1, 1,
-0.059912, 0.05254734, 0.4735638, 0, 0, 0, 1, 1,
-0.05868907, 0.2669761, -0.02305778, 0, 0, 0, 1, 1,
-0.05305517, 0.7827123, 0.5228136, 0, 0, 0, 1, 1,
-0.04995962, -1.347949, -3.182393, 1, 1, 1, 1, 1,
-0.0469315, -0.552525, -3.390769, 1, 1, 1, 1, 1,
-0.04100794, 0.5361347, -0.6448434, 1, 1, 1, 1, 1,
-0.0401859, -0.4923536, -2.028949, 1, 1, 1, 1, 1,
-0.03947198, -0.5504646, -4.282629, 1, 1, 1, 1, 1,
-0.03730662, 0.0240492, 0.2207762, 1, 1, 1, 1, 1,
-0.03597314, -0.3295031, -3.19293, 1, 1, 1, 1, 1,
-0.03335564, 2.813291, -0.2356645, 1, 1, 1, 1, 1,
-0.03037389, 0.06235633, -0.8908366, 1, 1, 1, 1, 1,
-0.02982282, -1.630499, -3.335077, 1, 1, 1, 1, 1,
-0.02974072, -0.03540049, -2.597611, 1, 1, 1, 1, 1,
-0.02584236, 0.7158705, 0.8737308, 1, 1, 1, 1, 1,
-0.02506602, 0.774641, -0.3206901, 1, 1, 1, 1, 1,
-0.01889651, 0.6999587, 0.07422345, 1, 1, 1, 1, 1,
-0.01809073, 0.1788877, 1.376387, 1, 1, 1, 1, 1,
-0.01742656, -0.4908458, -3.541851, 0, 0, 1, 1, 1,
-0.01677858, 0.8604593, 1.432129, 1, 0, 0, 1, 1,
-0.01455245, 0.8297831, -0.5374278, 1, 0, 0, 1, 1,
-0.01306781, -0.1754184, -4.262712, 1, 0, 0, 1, 1,
-0.01071607, 0.7112235, 0.766311, 1, 0, 0, 1, 1,
-0.009762044, 0.1594044, -0.8700519, 1, 0, 0, 1, 1,
0.007707662, -0.9311202, 2.974472, 0, 0, 0, 1, 1,
0.008094307, 1.450429, 0.1296954, 0, 0, 0, 1, 1,
0.008845857, -1.709529, 1.91722, 0, 0, 0, 1, 1,
0.008854023, -1.354476, 4.523301, 0, 0, 0, 1, 1,
0.01347646, 0.1610947, 1.262028, 0, 0, 0, 1, 1,
0.01443599, 0.8682775, 0.1147469, 0, 0, 0, 1, 1,
0.0153912, 1.632346, 2.540324, 0, 0, 0, 1, 1,
0.02034192, 0.4979228, -1.556403, 1, 1, 1, 1, 1,
0.0226448, -0.5819983, 2.635911, 1, 1, 1, 1, 1,
0.02520478, 0.4261436, -0.06568851, 1, 1, 1, 1, 1,
0.02755703, -1.24155, 4.158567, 1, 1, 1, 1, 1,
0.02856778, 1.15929, -0.3374874, 1, 1, 1, 1, 1,
0.03062903, 0.2468235, -0.5978937, 1, 1, 1, 1, 1,
0.04738285, 0.2910547, -0.003894218, 1, 1, 1, 1, 1,
0.04851381, 0.09817576, 0.8459519, 1, 1, 1, 1, 1,
0.05044268, 1.296416, -0.7949104, 1, 1, 1, 1, 1,
0.05047697, 0.166795, 1.028943, 1, 1, 1, 1, 1,
0.05185058, 0.8487688, 1.181543, 1, 1, 1, 1, 1,
0.052121, -0.6578979, 3.139334, 1, 1, 1, 1, 1,
0.05439936, -0.4168071, 3.06699, 1, 1, 1, 1, 1,
0.05509965, 1.94605, 0.2627067, 1, 1, 1, 1, 1,
0.05825158, -0.1638032, 2.725218, 1, 1, 1, 1, 1,
0.06024763, 1.049544, 0.866224, 0, 0, 1, 1, 1,
0.06126316, 0.05271772, 0.2246994, 1, 0, 0, 1, 1,
0.06271145, 0.2561229, -0.3955895, 1, 0, 0, 1, 1,
0.06362896, -1.1994, 3.827586, 1, 0, 0, 1, 1,
0.06364527, 1.013053, 0.05072619, 1, 0, 0, 1, 1,
0.06517362, 0.7663972, 0.0378983, 1, 0, 0, 1, 1,
0.06770331, 0.6967643, -0.6070932, 0, 0, 0, 1, 1,
0.07710484, -0.1558855, 2.727199, 0, 0, 0, 1, 1,
0.08239906, 0.09881584, 1.128135, 0, 0, 0, 1, 1,
0.08389934, 0.8803924, -2.131825, 0, 0, 0, 1, 1,
0.08567568, 0.1254888, 2.504101, 0, 0, 0, 1, 1,
0.09016608, -1.135729, 4.455916, 0, 0, 0, 1, 1,
0.09186435, -0.5984924, 4.544458, 0, 0, 0, 1, 1,
0.09606561, 1.958333, 1.765478, 1, 1, 1, 1, 1,
0.1039069, -0.9656119, 3.496221, 1, 1, 1, 1, 1,
0.118033, -3.006706, 2.904094, 1, 1, 1, 1, 1,
0.1193159, -2.959782, 3.621131, 1, 1, 1, 1, 1,
0.1240203, -1.256708, 4.11561, 1, 1, 1, 1, 1,
0.1282184, 1.523895, -0.1848276, 1, 1, 1, 1, 1,
0.1338875, -0.894861, 3.246348, 1, 1, 1, 1, 1,
0.1343826, -0.7254028, 2.586779, 1, 1, 1, 1, 1,
0.1371104, 0.415591, -0.429201, 1, 1, 1, 1, 1,
0.1382348, -0.4824968, 3.491149, 1, 1, 1, 1, 1,
0.1394475, 2.727086, -0.8808929, 1, 1, 1, 1, 1,
0.1409268, 0.5997697, -0.3736914, 1, 1, 1, 1, 1,
0.1415089, -1.708143, 2.552399, 1, 1, 1, 1, 1,
0.1433562, -0.1365217, 2.45663, 1, 1, 1, 1, 1,
0.1559605, -0.378211, 2.932693, 1, 1, 1, 1, 1,
0.1561965, -0.1267075, 2.504301, 0, 0, 1, 1, 1,
0.156553, 1.519414, -0.1392349, 1, 0, 0, 1, 1,
0.1574584, -0.2651279, 2.161379, 1, 0, 0, 1, 1,
0.1586701, 1.148247, 0.8301836, 1, 0, 0, 1, 1,
0.1591684, 1.05603, -0.03298417, 1, 0, 0, 1, 1,
0.1599699, 2.050909, 0.06931634, 1, 0, 0, 1, 1,
0.1643558, 0.9023551, 0.262865, 0, 0, 0, 1, 1,
0.166477, -2.025176, 3.165742, 0, 0, 0, 1, 1,
0.1670251, -0.6637695, 2.83372, 0, 0, 0, 1, 1,
0.1673405, -0.4052397, 2.955392, 0, 0, 0, 1, 1,
0.1681583, -0.1517751, 3.68467, 0, 0, 0, 1, 1,
0.1697973, -0.9515328, 1.622794, 0, 0, 0, 1, 1,
0.1718351, 1.504049, 1.735803, 0, 0, 0, 1, 1,
0.1720603, -0.961958, 4.147182, 1, 1, 1, 1, 1,
0.1812062, 1.282402, -1.8815, 1, 1, 1, 1, 1,
0.1821719, -0.317675, 1.080274, 1, 1, 1, 1, 1,
0.183399, -0.5570047, 2.179133, 1, 1, 1, 1, 1,
0.188057, -0.9869974, 3.989802, 1, 1, 1, 1, 1,
0.1911234, 0.2897473, 0.5967444, 1, 1, 1, 1, 1,
0.1931104, -0.1786628, 3.144965, 1, 1, 1, 1, 1,
0.2016583, 1.378455, 0.6170231, 1, 1, 1, 1, 1,
0.2080813, 0.5931014, 0.7688388, 1, 1, 1, 1, 1,
0.2083757, -0.8451833, 3.293342, 1, 1, 1, 1, 1,
0.2117235, 0.9563212, -0.6798147, 1, 1, 1, 1, 1,
0.2127616, -1.239725, 1.644669, 1, 1, 1, 1, 1,
0.2138023, -1.908014, 4.95798, 1, 1, 1, 1, 1,
0.2141355, -0.7596561, 3.363588, 1, 1, 1, 1, 1,
0.2150986, 0.001217423, 3.111857, 1, 1, 1, 1, 1,
0.2156515, 0.6848304, -0.5789979, 0, 0, 1, 1, 1,
0.2198786, 0.04349705, 0.991016, 1, 0, 0, 1, 1,
0.2213149, 1.380512, 0.3570708, 1, 0, 0, 1, 1,
0.2217277, 0.9267429, -0.1310495, 1, 0, 0, 1, 1,
0.2261189, 0.0537264, 0.207496, 1, 0, 0, 1, 1,
0.228225, -0.2388742, 2.329293, 1, 0, 0, 1, 1,
0.2286855, -0.6022208, 1.970549, 0, 0, 0, 1, 1,
0.234572, 0.09670645, 0.8968284, 0, 0, 0, 1, 1,
0.2356628, 0.1500832, 1.398879, 0, 0, 0, 1, 1,
0.2357614, -0.7646066, 0.7583508, 0, 0, 0, 1, 1,
0.2386217, -0.2223743, 2.385049, 0, 0, 0, 1, 1,
0.2429448, 1.058872, 0.9548342, 0, 0, 0, 1, 1,
0.2462485, 0.3634151, -1.907642, 0, 0, 0, 1, 1,
0.248246, -0.6903207, 3.994015, 1, 1, 1, 1, 1,
0.2493181, -0.3300963, 2.145461, 1, 1, 1, 1, 1,
0.256065, 0.4918238, 0.6359544, 1, 1, 1, 1, 1,
0.2572357, -1.814134, 3.568317, 1, 1, 1, 1, 1,
0.2581743, 0.345167, 2.156983, 1, 1, 1, 1, 1,
0.2603836, 0.03361131, -0.1372241, 1, 1, 1, 1, 1,
0.2616249, -0.280973, 3.741886, 1, 1, 1, 1, 1,
0.2630435, 1.181555, 1.030915, 1, 1, 1, 1, 1,
0.2636448, -0.2033543, 1.075205, 1, 1, 1, 1, 1,
0.2673927, 0.8476954, -0.8811793, 1, 1, 1, 1, 1,
0.2674428, 0.3164491, 0.4397404, 1, 1, 1, 1, 1,
0.2732034, -0.2276054, 2.631354, 1, 1, 1, 1, 1,
0.2737389, -0.2288652, 1.829782, 1, 1, 1, 1, 1,
0.2792115, 0.9757006, 0.7194938, 1, 1, 1, 1, 1,
0.2824359, 0.9610906, -1.530362, 1, 1, 1, 1, 1,
0.2833651, 0.2553123, 2.121702, 0, 0, 1, 1, 1,
0.283927, 0.06494776, 1.718056, 1, 0, 0, 1, 1,
0.2873606, -0.2551, 3.209446, 1, 0, 0, 1, 1,
0.2917277, -0.04732353, 1.954498, 1, 0, 0, 1, 1,
0.2928148, -0.346864, 3.215764, 1, 0, 0, 1, 1,
0.2937165, -1.052521, 2.093416, 1, 0, 0, 1, 1,
0.2938501, 0.2223573, 0.5266432, 0, 0, 0, 1, 1,
0.2942899, -0.8515337, 2.642877, 0, 0, 0, 1, 1,
0.3015802, 0.01244052, 2.113052, 0, 0, 0, 1, 1,
0.3042017, -1.285759, 4.489247, 0, 0, 0, 1, 1,
0.3054092, 0.2214393, 1.845671, 0, 0, 0, 1, 1,
0.3068881, 0.8662477, 2.012295, 0, 0, 0, 1, 1,
0.3116255, 0.3167763, 0.08980159, 0, 0, 0, 1, 1,
0.3207499, -0.6539607, 1.779992, 1, 1, 1, 1, 1,
0.3210209, 0.1692681, 2.196609, 1, 1, 1, 1, 1,
0.3246276, -0.153148, 2.182927, 1, 1, 1, 1, 1,
0.3284907, 1.017618, 0.4231631, 1, 1, 1, 1, 1,
0.3316467, -1.450157, 4.124036, 1, 1, 1, 1, 1,
0.3326861, 0.4103674, 0.9319196, 1, 1, 1, 1, 1,
0.3328884, 0.4305323, 0.4537337, 1, 1, 1, 1, 1,
0.3500687, -1.264302, 3.946495, 1, 1, 1, 1, 1,
0.3514835, 0.3280453, 0.7541004, 1, 1, 1, 1, 1,
0.3563896, 0.9114477, 0.6882368, 1, 1, 1, 1, 1,
0.3578224, -0.5489819, 1.497979, 1, 1, 1, 1, 1,
0.3615291, 0.08645257, 0.2184379, 1, 1, 1, 1, 1,
0.3620541, 1.498886, -0.06581449, 1, 1, 1, 1, 1,
0.3636129, -1.074516, 3.320562, 1, 1, 1, 1, 1,
0.3756318, 0.6367412, 0.4105127, 1, 1, 1, 1, 1,
0.3768373, 0.2592691, 1.726179, 0, 0, 1, 1, 1,
0.3773337, -0.02542201, 1.45072, 1, 0, 0, 1, 1,
0.3775028, 1.270815, -0.3834498, 1, 0, 0, 1, 1,
0.3778787, -0.5190032, 2.237457, 1, 0, 0, 1, 1,
0.3789473, 1.157696, 1.151006, 1, 0, 0, 1, 1,
0.3796207, -0.6308941, 2.944088, 1, 0, 0, 1, 1,
0.3821527, 0.2047831, -0.2036552, 0, 0, 0, 1, 1,
0.3873182, 0.648847, 2.650139, 0, 0, 0, 1, 1,
0.3877677, 0.3078977, 0.9137332, 0, 0, 0, 1, 1,
0.3891602, 0.455719, 0.8631781, 0, 0, 0, 1, 1,
0.3922597, 1.801217, -0.3164226, 0, 0, 0, 1, 1,
0.3986801, 0.7885177, -0.1825385, 0, 0, 0, 1, 1,
0.4040596, -1.888311, 3.355311, 0, 0, 0, 1, 1,
0.4055015, 1.083842, 1.546931, 1, 1, 1, 1, 1,
0.4061863, 1.144385, 0.09352851, 1, 1, 1, 1, 1,
0.4065801, 0.5532835, -0.4335554, 1, 1, 1, 1, 1,
0.4082393, 0.08648033, 0.451251, 1, 1, 1, 1, 1,
0.4091044, 0.6644573, 0.5644037, 1, 1, 1, 1, 1,
0.410684, 0.7589432, 0.2813746, 1, 1, 1, 1, 1,
0.4133084, 0.6210108, 1.801189, 1, 1, 1, 1, 1,
0.4153813, 0.6305805, 0.2265236, 1, 1, 1, 1, 1,
0.41831, -0.6669275, 3.518305, 1, 1, 1, 1, 1,
0.4216833, 1.355085, 0.2302359, 1, 1, 1, 1, 1,
0.4223044, 1.668384, 0.9686604, 1, 1, 1, 1, 1,
0.4263006, -0.9584136, 2.527367, 1, 1, 1, 1, 1,
0.4280912, 0.4921426, -0.220715, 1, 1, 1, 1, 1,
0.4319338, -0.4917493, 1.595954, 1, 1, 1, 1, 1,
0.4333231, 0.5349072, 2.219666, 1, 1, 1, 1, 1,
0.4333763, -0.2192853, 0.6554229, 0, 0, 1, 1, 1,
0.4336141, -0.1698203, 1.907619, 1, 0, 0, 1, 1,
0.4364423, -0.2551051, 2.570314, 1, 0, 0, 1, 1,
0.4423699, 0.7864296, -0.151069, 1, 0, 0, 1, 1,
0.4431399, 0.4698756, 0.2067338, 1, 0, 0, 1, 1,
0.4479858, 0.5902577, 0.1918778, 1, 0, 0, 1, 1,
0.448458, 0.9507899, 0.9910376, 0, 0, 0, 1, 1,
0.4486521, 0.9149604, 1.24533, 0, 0, 0, 1, 1,
0.4496808, 0.9686197, 0.1594288, 0, 0, 0, 1, 1,
0.4524468, -0.1654553, 2.83245, 0, 0, 0, 1, 1,
0.4558391, -0.7376408, 2.501916, 0, 0, 0, 1, 1,
0.4636667, 0.5794634, 1.554592, 0, 0, 0, 1, 1,
0.4668835, 1.674387, -1.251179, 0, 0, 0, 1, 1,
0.4708322, 1.053713, 0.9025115, 1, 1, 1, 1, 1,
0.4758503, 0.05485107, 2.074616, 1, 1, 1, 1, 1,
0.4775879, 0.2063021, 0.2511473, 1, 1, 1, 1, 1,
0.4841715, 0.02974912, 1.977544, 1, 1, 1, 1, 1,
0.4843415, -0.4347863, 2.793577, 1, 1, 1, 1, 1,
0.4874518, -0.6856827, 3.258398, 1, 1, 1, 1, 1,
0.4923419, -0.6318859, 4.37965, 1, 1, 1, 1, 1,
0.4992477, 0.9685385, -0.04177609, 1, 1, 1, 1, 1,
0.4999351, -0.0877909, 1.147715, 1, 1, 1, 1, 1,
0.5013371, -0.6006993, 1.457574, 1, 1, 1, 1, 1,
0.5066476, 1.171114, 1.248162, 1, 1, 1, 1, 1,
0.5075749, -0.7867115, 0.9753933, 1, 1, 1, 1, 1,
0.5176408, 1.210641, 0.2934549, 1, 1, 1, 1, 1,
0.5208804, 0.3150019, 1.524102, 1, 1, 1, 1, 1,
0.5228152, 0.8065615, 0.5202536, 1, 1, 1, 1, 1,
0.5261043, -0.7260559, 2.2128, 0, 0, 1, 1, 1,
0.52694, -0.04966165, 1.035025, 1, 0, 0, 1, 1,
0.5274118, -0.6208238, 3.509772, 1, 0, 0, 1, 1,
0.5306379, -0.2652726, 2.525479, 1, 0, 0, 1, 1,
0.536972, 0.9821389, -0.5767477, 1, 0, 0, 1, 1,
0.5433255, -0.909319, 2.665892, 1, 0, 0, 1, 1,
0.5437618, -0.6307813, 2.108194, 0, 0, 0, 1, 1,
0.5470583, 0.5505049, 2.045735, 0, 0, 0, 1, 1,
0.5529806, 0.5827625, 0.147245, 0, 0, 0, 1, 1,
0.5578334, -0.3857099, 2.522895, 0, 0, 0, 1, 1,
0.5598281, 1.340482, -0.9966209, 0, 0, 0, 1, 1,
0.5615035, 1.455868, 0.8700451, 0, 0, 0, 1, 1,
0.562664, 1.015661, 0.03131568, 0, 0, 0, 1, 1,
0.563171, -1.210241, 4.420611, 1, 1, 1, 1, 1,
0.5662774, -0.2832829, 1.454477, 1, 1, 1, 1, 1,
0.5692317, 0.2605742, 0.7783547, 1, 1, 1, 1, 1,
0.5696157, -0.7504034, 3.061342, 1, 1, 1, 1, 1,
0.5698599, -1.408, 1.991945, 1, 1, 1, 1, 1,
0.5724863, 0.554221, 1.607599, 1, 1, 1, 1, 1,
0.5739757, -0.6497581, 3.975611, 1, 1, 1, 1, 1,
0.5787411, -0.4926578, 1.176732, 1, 1, 1, 1, 1,
0.5795377, 0.2904796, 2.09556, 1, 1, 1, 1, 1,
0.5796387, 0.5060043, 1.223511, 1, 1, 1, 1, 1,
0.5822977, 0.1139735, 0.4517514, 1, 1, 1, 1, 1,
0.5871257, -1.966465, -0.3935728, 1, 1, 1, 1, 1,
0.5908004, -0.2201662, 1.004631, 1, 1, 1, 1, 1,
0.5937762, 1.049356, -1.025205, 1, 1, 1, 1, 1,
0.595942, 0.7381325, 0.5292392, 1, 1, 1, 1, 1,
0.6023333, 0.3015677, 1.979498, 0, 0, 1, 1, 1,
0.6063746, 0.4866109, 0.9008399, 1, 0, 0, 1, 1,
0.6122561, -0.3726164, 2.685312, 1, 0, 0, 1, 1,
0.6204823, 1.585049, -1.744276, 1, 0, 0, 1, 1,
0.6208615, 1.201559, 1.415758, 1, 0, 0, 1, 1,
0.6210628, 0.2523812, 1.734777, 1, 0, 0, 1, 1,
0.6309288, -1.347357, 2.721532, 0, 0, 0, 1, 1,
0.6325718, 0.2066322, 1.138775, 0, 0, 0, 1, 1,
0.6326237, -0.1524613, 2.686505, 0, 0, 0, 1, 1,
0.6353807, -0.123766, 1.967666, 0, 0, 0, 1, 1,
0.637109, 0.2431934, -0.4490905, 0, 0, 0, 1, 1,
0.6437678, -0.8026677, 2.861785, 0, 0, 0, 1, 1,
0.6459994, -3.299956, 3.213249, 0, 0, 0, 1, 1,
0.6480952, -1.652844, 0.6599581, 1, 1, 1, 1, 1,
0.6483112, -1.850507, 3.694599, 1, 1, 1, 1, 1,
0.648773, -0.4597354, 3.045902, 1, 1, 1, 1, 1,
0.6488105, 0.7683887, 2.245312, 1, 1, 1, 1, 1,
0.6517116, 2.059414, -0.4514062, 1, 1, 1, 1, 1,
0.6575262, 0.1316015, 1.645346, 1, 1, 1, 1, 1,
0.6616266, -0.4283584, 2.838747, 1, 1, 1, 1, 1,
0.6692905, 0.5567674, 0.7985623, 1, 1, 1, 1, 1,
0.6741728, -0.969749, 2.384731, 1, 1, 1, 1, 1,
0.6772726, 0.2803783, 2.268961, 1, 1, 1, 1, 1,
0.6806329, 0.2622891, 0.1579482, 1, 1, 1, 1, 1,
0.6815597, 1.08094, 0.5006177, 1, 1, 1, 1, 1,
0.6848098, 0.5064296, 1.503945, 1, 1, 1, 1, 1,
0.6883818, 0.05331802, 1.222813, 1, 1, 1, 1, 1,
0.6916339, 0.5869319, 0.6250145, 1, 1, 1, 1, 1,
0.6937808, -0.8976517, 1.358481, 0, 0, 1, 1, 1,
0.6945193, 0.03240413, 0.3435001, 1, 0, 0, 1, 1,
0.6959793, 0.265969, 2.565559, 1, 0, 0, 1, 1,
0.6991738, -1.245503, 1.668063, 1, 0, 0, 1, 1,
0.7079372, 0.3786492, -0.7504978, 1, 0, 0, 1, 1,
0.7149969, -0.2409974, 2.65608, 1, 0, 0, 1, 1,
0.7167566, -0.3640009, 3.337302, 0, 0, 0, 1, 1,
0.7197277, -0.5996927, 4.009703, 0, 0, 0, 1, 1,
0.7232652, 0.3367983, 2.360706, 0, 0, 0, 1, 1,
0.7291037, -0.7497865, 2.339784, 0, 0, 0, 1, 1,
0.7300039, -0.2026046, -0.2358024, 0, 0, 0, 1, 1,
0.7312817, 0.3148082, 0.6994244, 0, 0, 0, 1, 1,
0.7331877, 0.851847, 1.093674, 0, 0, 0, 1, 1,
0.7389833, -2.174486, 0.8628029, 1, 1, 1, 1, 1,
0.7421135, -1.32317, 4.148477, 1, 1, 1, 1, 1,
0.7460166, 0.04095257, 2.735578, 1, 1, 1, 1, 1,
0.7463209, 1.049672, -0.0958642, 1, 1, 1, 1, 1,
0.7488962, 0.1316116, 0.9512333, 1, 1, 1, 1, 1,
0.756179, -0.2648565, 1.570575, 1, 1, 1, 1, 1,
0.7591984, 1.139006, -0.5866016, 1, 1, 1, 1, 1,
0.7649688, -0.4982805, 2.554778, 1, 1, 1, 1, 1,
0.7763093, 0.6156745, 1.15717, 1, 1, 1, 1, 1,
0.7763957, -0.1364979, 1.060701, 1, 1, 1, 1, 1,
0.7767888, 0.7329929, 1.584376, 1, 1, 1, 1, 1,
0.7834322, 0.7473433, 0.8066317, 1, 1, 1, 1, 1,
0.7851388, -0.154199, 2.596123, 1, 1, 1, 1, 1,
0.7879696, -0.2991988, 1.625356, 1, 1, 1, 1, 1,
0.789372, 0.2405396, 2.672272, 1, 1, 1, 1, 1,
0.7961644, -1.142094, 3.431596, 0, 0, 1, 1, 1,
0.804843, 0.4705351, -0.04126866, 1, 0, 0, 1, 1,
0.805888, -1.064359, 4.093039, 1, 0, 0, 1, 1,
0.8059418, 1.363892, -0.5959333, 1, 0, 0, 1, 1,
0.8094395, -0.4197807, 0.8568108, 1, 0, 0, 1, 1,
0.8100831, -0.1993822, 3.030655, 1, 0, 0, 1, 1,
0.8142708, -1.946292, 2.930079, 0, 0, 0, 1, 1,
0.817422, 0.1620424, 1.378779, 0, 0, 0, 1, 1,
0.8234946, 0.1448328, 0.5172284, 0, 0, 0, 1, 1,
0.8238615, 0.6335719, -0.04656008, 0, 0, 0, 1, 1,
0.8281726, -0.1630899, 0.4536192, 0, 0, 0, 1, 1,
0.8282381, -0.00767254, 1.760149, 0, 0, 0, 1, 1,
0.8333389, -0.9457573, 3.637969, 0, 0, 0, 1, 1,
0.8343922, 0.8933368, -0.06489749, 1, 1, 1, 1, 1,
0.8396139, -0.7982876, 2.361157, 1, 1, 1, 1, 1,
0.8410414, 0.4905806, 1.712552, 1, 1, 1, 1, 1,
0.8458741, 0.8154081, 1.516506, 1, 1, 1, 1, 1,
0.8491635, -0.5847343, 0.994167, 1, 1, 1, 1, 1,
0.8497008, 0.3818259, 1.917314, 1, 1, 1, 1, 1,
0.8540915, 0.8889238, 2.180468, 1, 1, 1, 1, 1,
0.8577513, 0.4493588, 0.8107644, 1, 1, 1, 1, 1,
0.8636397, 1.743059, 1.697728, 1, 1, 1, 1, 1,
0.8656144, -1.68713, 3.673417, 1, 1, 1, 1, 1,
0.866701, -1.643122, 0.4014271, 1, 1, 1, 1, 1,
0.8700388, 0.002672343, 2.444065, 1, 1, 1, 1, 1,
0.8728948, 1.113816, 1.472013, 1, 1, 1, 1, 1,
0.8797002, 0.4834626, 0.8864724, 1, 1, 1, 1, 1,
0.880592, -1.263309, 3.457459, 1, 1, 1, 1, 1,
0.8873709, -0.5475566, 1.744267, 0, 0, 1, 1, 1,
0.8976926, -0.5219482, 1.710671, 1, 0, 0, 1, 1,
0.904853, -0.6504678, 2.328929, 1, 0, 0, 1, 1,
0.9064091, 1.853848, -0.6144553, 1, 0, 0, 1, 1,
0.9123126, -0.9597278, 3.384723, 1, 0, 0, 1, 1,
0.9141097, -1.282808, 2.820677, 1, 0, 0, 1, 1,
0.9160479, 0.133816, 0.9741063, 0, 0, 0, 1, 1,
0.9227297, -1.404509, 2.584237, 0, 0, 0, 1, 1,
0.9241488, 1.242207, 0.7428369, 0, 0, 0, 1, 1,
0.9296363, 0.06793691, 1.436649, 0, 0, 0, 1, 1,
0.9327023, -1.808712, 2.851027, 0, 0, 0, 1, 1,
0.9336461, 0.5198494, -0.191893, 0, 0, 0, 1, 1,
0.9347778, -0.1325962, 2.677915, 0, 0, 0, 1, 1,
0.9356318, 0.2243668, 0.483224, 1, 1, 1, 1, 1,
0.9484161, 0.7537955, 2.020328, 1, 1, 1, 1, 1,
0.9500236, -1.421699, 2.129418, 1, 1, 1, 1, 1,
0.9543221, 0.3491566, 1.367383, 1, 1, 1, 1, 1,
0.9550096, -0.04972946, -0.06097041, 1, 1, 1, 1, 1,
0.9571399, -0.5480794, -0.06864934, 1, 1, 1, 1, 1,
0.9574341, 0.4516658, 1.758922, 1, 1, 1, 1, 1,
0.9679084, -0.990949, 3.533878, 1, 1, 1, 1, 1,
0.9784981, -0.4979977, 0.5419892, 1, 1, 1, 1, 1,
0.9854712, 0.9672021, -0.08734574, 1, 1, 1, 1, 1,
0.9886118, 0.8112533, 1.986057, 1, 1, 1, 1, 1,
0.9956651, -0.2456768, 2.051368, 1, 1, 1, 1, 1,
0.9971756, 1.114116, 0.6634275, 1, 1, 1, 1, 1,
0.9986833, -0.2137778, 2.987586, 1, 1, 1, 1, 1,
0.9988417, 1.646549, 0.6761203, 1, 1, 1, 1, 1,
1.002421, 0.7916174, 1.790331, 0, 0, 1, 1, 1,
1.012853, -0.3506854, 2.981167, 1, 0, 0, 1, 1,
1.014474, 1.146519, -1.960726, 1, 0, 0, 1, 1,
1.014621, -1.150185, 3.150927, 1, 0, 0, 1, 1,
1.01511, -1.138906, 1.572787, 1, 0, 0, 1, 1,
1.01676, -0.5636459, 2.45397, 1, 0, 0, 1, 1,
1.021143, 2.144873, 0.8951234, 0, 0, 0, 1, 1,
1.02385, 0.4296884, 2.762893, 0, 0, 0, 1, 1,
1.02458, -1.288352, 1.919184, 0, 0, 0, 1, 1,
1.037376, 0.1702935, 2.359476, 0, 0, 0, 1, 1,
1.039176, 0.8083026, 1.741852, 0, 0, 0, 1, 1,
1.044717, -0.6585174, 1.534907, 0, 0, 0, 1, 1,
1.051179, 1.387584, 0.7187896, 0, 0, 0, 1, 1,
1.055677, -0.4347607, 0.9906973, 1, 1, 1, 1, 1,
1.056655, 0.1296133, 1.681368, 1, 1, 1, 1, 1,
1.057189, 0.1919809, 3.090815, 1, 1, 1, 1, 1,
1.059495, 0.7554263, 0.6551166, 1, 1, 1, 1, 1,
1.076349, -0.7201772, 1.980906, 1, 1, 1, 1, 1,
1.078467, 1.487618, -0.1875277, 1, 1, 1, 1, 1,
1.078505, 1.076789, -0.3315589, 1, 1, 1, 1, 1,
1.083881, -1.229422, 2.100271, 1, 1, 1, 1, 1,
1.084299, 1.700164, 0.2896234, 1, 1, 1, 1, 1,
1.091839, 0.496885, 1.187989, 1, 1, 1, 1, 1,
1.097183, -1.912266, 2.892564, 1, 1, 1, 1, 1,
1.097556, -0.8461138, 1.592886, 1, 1, 1, 1, 1,
1.100716, 1.646478, 0.9022067, 1, 1, 1, 1, 1,
1.108006, 0.3374169, 0.448095, 1, 1, 1, 1, 1,
1.110621, 0.2037222, -1.266343, 1, 1, 1, 1, 1,
1.116434, -1.147779, 2.204451, 0, 0, 1, 1, 1,
1.12339, -0.3594871, 2.137309, 1, 0, 0, 1, 1,
1.127317, -0.3554007, 2.890845, 1, 0, 0, 1, 1,
1.13299, 1.305532, 0.2743018, 1, 0, 0, 1, 1,
1.143018, -0.5808237, 3.641948, 1, 0, 0, 1, 1,
1.147471, 0.47417, 2.050437, 1, 0, 0, 1, 1,
1.147915, -0.2920529, 2.667348, 0, 0, 0, 1, 1,
1.148295, 1.543342, -1.000337, 0, 0, 0, 1, 1,
1.153337, 1.398523, 0.3163354, 0, 0, 0, 1, 1,
1.153838, 0.3048254, 4.021434, 0, 0, 0, 1, 1,
1.15604, -0.5470428, 1.06405, 0, 0, 0, 1, 1,
1.157896, -0.5690283, 2.02859, 0, 0, 0, 1, 1,
1.16655, -0.7902076, 3.413793, 0, 0, 0, 1, 1,
1.171686, 0.6336451, 0.4701932, 1, 1, 1, 1, 1,
1.175458, 0.8597148, 0.2145638, 1, 1, 1, 1, 1,
1.177944, 0.3786494, 1.49857, 1, 1, 1, 1, 1,
1.179678, -0.5656641, 2.612278, 1, 1, 1, 1, 1,
1.180385, 0.8788868, 1.964705, 1, 1, 1, 1, 1,
1.197439, 0.5961257, 1.956056, 1, 1, 1, 1, 1,
1.204576, 0.4820082, 0.8182697, 1, 1, 1, 1, 1,
1.216426, -0.7403775, 3.424822, 1, 1, 1, 1, 1,
1.218511, -0.7404237, 3.026539, 1, 1, 1, 1, 1,
1.222755, -1.203102, 3.25606, 1, 1, 1, 1, 1,
1.229357, -0.8293325, 2.745771, 1, 1, 1, 1, 1,
1.229477, -1.473054, 1.68557, 1, 1, 1, 1, 1,
1.234374, -0.3060701, 2.927429, 1, 1, 1, 1, 1,
1.237282, -1.042287, 3.047375, 1, 1, 1, 1, 1,
1.247664, -0.2919442, 1.59744, 1, 1, 1, 1, 1,
1.253377, 0.2828514, 3.255147, 0, 0, 1, 1, 1,
1.25615, 0.06054231, 2.127512, 1, 0, 0, 1, 1,
1.258813, -1.40251, 3.732291, 1, 0, 0, 1, 1,
1.261414, -1.045612, 2.274966, 1, 0, 0, 1, 1,
1.266563, 0.1229816, 1.116969, 1, 0, 0, 1, 1,
1.276907, 0.5028003, 0.1055043, 1, 0, 0, 1, 1,
1.286183, -1.963525, 3.843502, 0, 0, 0, 1, 1,
1.294519, -0.2678499, 3.20705, 0, 0, 0, 1, 1,
1.302248, 0.9257845, 0.6422909, 0, 0, 0, 1, 1,
1.303819, -0.3394435, 2.573566, 0, 0, 0, 1, 1,
1.311498, -0.197442, 2.753692, 0, 0, 0, 1, 1,
1.316628, 0.7998074, 0.9066064, 0, 0, 0, 1, 1,
1.319335, 1.216364, 1.960602, 0, 0, 0, 1, 1,
1.332987, 0.8723134, 0.5154364, 1, 1, 1, 1, 1,
1.347595, -1.246126, 2.298328, 1, 1, 1, 1, 1,
1.35364, 1.418555, 1.010375, 1, 1, 1, 1, 1,
1.358532, 1.46178, 2.441367, 1, 1, 1, 1, 1,
1.35898, 0.1382935, 0.351442, 1, 1, 1, 1, 1,
1.359339, -0.3950515, 2.321811, 1, 1, 1, 1, 1,
1.364169, 0.01215492, 2.851487, 1, 1, 1, 1, 1,
1.377166, -0.4910678, 2.050369, 1, 1, 1, 1, 1,
1.377687, -1.033352, 2.024783, 1, 1, 1, 1, 1,
1.383528, -0.8291032, 3.146309, 1, 1, 1, 1, 1,
1.385499, 0.2800986, 0.9465801, 1, 1, 1, 1, 1,
1.392878, 0.6293738, 2.78746, 1, 1, 1, 1, 1,
1.401323, 0.6370763, 1.655088, 1, 1, 1, 1, 1,
1.404167, 0.6632014, 1.62096, 1, 1, 1, 1, 1,
1.40493, -1.401547, 3.58831, 1, 1, 1, 1, 1,
1.407812, -0.1151436, 2.30687, 0, 0, 1, 1, 1,
1.409836, -0.8612022, 2.090771, 1, 0, 0, 1, 1,
1.41095, -0.004400769, 1.841046, 1, 0, 0, 1, 1,
1.411526, -1.850494, 1.843846, 1, 0, 0, 1, 1,
1.42038, -0.5152398, 1.950805, 1, 0, 0, 1, 1,
1.438329, 1.022979, 0.5717972, 1, 0, 0, 1, 1,
1.442405, 0.1231866, 2.052571, 0, 0, 0, 1, 1,
1.450748, 0.27225, 0.8194619, 0, 0, 0, 1, 1,
1.453873, -1.21365, 0.7069371, 0, 0, 0, 1, 1,
1.459707, 0.1273054, 3.371657, 0, 0, 0, 1, 1,
1.47683, 1.624426, 1.529871, 0, 0, 0, 1, 1,
1.478466, 1.052635, 0.0004506829, 0, 0, 0, 1, 1,
1.485259, -0.2508223, 2.236442, 0, 0, 0, 1, 1,
1.492942, 0.1270549, 1.492007, 1, 1, 1, 1, 1,
1.509323, -0.77303, 0.3389837, 1, 1, 1, 1, 1,
1.516975, 0.5640199, 0.7148823, 1, 1, 1, 1, 1,
1.524531, 0.6509305, 2.66657, 1, 1, 1, 1, 1,
1.524825, -0.1513954, 3.631131, 1, 1, 1, 1, 1,
1.531181, 0.08082137, 1.491046, 1, 1, 1, 1, 1,
1.532555, 1.182746, 1.214031, 1, 1, 1, 1, 1,
1.53279, -1.829124, 1.376181, 1, 1, 1, 1, 1,
1.536147, 0.4686906, -0.1917677, 1, 1, 1, 1, 1,
1.537558, -0.4708662, 2.003522, 1, 1, 1, 1, 1,
1.54548, 0.9834174, 1.27681, 1, 1, 1, 1, 1,
1.554751, 0.7620075, 1.189059, 1, 1, 1, 1, 1,
1.557931, 0.5809141, -0.6543372, 1, 1, 1, 1, 1,
1.558307, -1.046832, 1.324312, 1, 1, 1, 1, 1,
1.574552, -0.1505018, 2.442479, 1, 1, 1, 1, 1,
1.595515, 0.09558048, 2.845541, 0, 0, 1, 1, 1,
1.606821, 0.3387383, 0.0811308, 1, 0, 0, 1, 1,
1.609961, 1.548187, 0.9407645, 1, 0, 0, 1, 1,
1.611913, 0.03431819, 0.9232088, 1, 0, 0, 1, 1,
1.637638, -0.09372635, 1.133639, 1, 0, 0, 1, 1,
1.643226, 0.6655506, 2.217563, 1, 0, 0, 1, 1,
1.654539, -0.6474129, 2.10121, 0, 0, 0, 1, 1,
1.65864, -0.06131604, 3.318349, 0, 0, 0, 1, 1,
1.665735, 0.9525358, -0.4428108, 0, 0, 0, 1, 1,
1.668334, -0.2385288, 3.363704, 0, 0, 0, 1, 1,
1.689139, -0.7543281, 0.8421169, 0, 0, 0, 1, 1,
1.729285, 0.1960815, 2.580293, 0, 0, 0, 1, 1,
1.771239, -0.4173304, 0.5692353, 0, 0, 0, 1, 1,
1.774926, -0.7371536, 3.070965, 1, 1, 1, 1, 1,
1.777499, -0.8070706, 2.603363, 1, 1, 1, 1, 1,
1.797631, 0.4915497, 2.23778, 1, 1, 1, 1, 1,
1.833496, -1.619201, 2.014736, 1, 1, 1, 1, 1,
1.882619, -0.5629702, 3.809515, 1, 1, 1, 1, 1,
1.910999, -1.506206, 1.288392, 1, 1, 1, 1, 1,
1.92018, -0.02712098, 1.442089, 1, 1, 1, 1, 1,
1.951636, -0.1715578, 1.701488, 1, 1, 1, 1, 1,
1.958448, 1.846887, -1.732019, 1, 1, 1, 1, 1,
1.963242, 2.111084, 1.41435, 1, 1, 1, 1, 1,
1.973772, -0.1360304, 1.87791, 1, 1, 1, 1, 1,
1.990479, -0.4240758, 1.289288, 1, 1, 1, 1, 1,
1.996598, -0.1374794, 1.870144, 1, 1, 1, 1, 1,
2.024297, 0.4599787, 0.5324007, 1, 1, 1, 1, 1,
2.025077, -0.7993569, 2.549377, 1, 1, 1, 1, 1,
2.055271, -0.004353777, 0.4317454, 0, 0, 1, 1, 1,
2.056165, 0.9828758, 0.9830546, 1, 0, 0, 1, 1,
2.079247, 0.2450424, 1.328603, 1, 0, 0, 1, 1,
2.082012, -0.9625566, 1.318307, 1, 0, 0, 1, 1,
2.088377, -1.421812, 2.387583, 1, 0, 0, 1, 1,
2.090718, 0.07983093, 1.784982, 1, 0, 0, 1, 1,
2.103751, 2.161271, 0.4821, 0, 0, 0, 1, 1,
2.17039, -1.497998, 2.569578, 0, 0, 0, 1, 1,
2.268488, 0.9325883, 1.017767, 0, 0, 0, 1, 1,
2.282311, 0.2049919, 3.6279, 0, 0, 0, 1, 1,
2.284299, 0.07495799, 1.69711, 0, 0, 0, 1, 1,
2.304621, 0.3460295, 1.408892, 0, 0, 0, 1, 1,
2.360526, 1.091648, 1.770188, 0, 0, 0, 1, 1,
2.38231, -1.130353, 1.966319, 1, 1, 1, 1, 1,
2.418328, 1.107332, -0.5293227, 1, 1, 1, 1, 1,
2.491555, 1.385703, 1.778719, 1, 1, 1, 1, 1,
2.532544, 0.9537446, 1.711148, 1, 1, 1, 1, 1,
2.563463, 1.058101, -0.337795, 1, 1, 1, 1, 1,
2.617719, 1.605503, -0.7146201, 1, 1, 1, 1, 1,
2.73795, 0.6643361, 0.4803879, 1, 1, 1, 1, 1
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
var radius = 9.345731;
var distance = 32.82648;
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
mvMatrix.translate( 0.06225562, 0.1345732, 0.3974948 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.82648);
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
