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
-3.080019, 0.2366048, -1.199272, 1, 0, 0, 1,
-2.87429, 0.5618597, -0.6033598, 1, 0.007843138, 0, 1,
-2.8092, 0.8393148, -0.1915296, 1, 0.01176471, 0, 1,
-2.703634, 0.1962607, -1.915289, 1, 0.01960784, 0, 1,
-2.649804, 1.357064, 1.04134, 1, 0.02352941, 0, 1,
-2.447689, -2.558296, -1.385705, 1, 0.03137255, 0, 1,
-2.262497, 1.850276, -0.04064823, 1, 0.03529412, 0, 1,
-2.24947, 0.177335, -1.776955, 1, 0.04313726, 0, 1,
-2.229155, 0.8997689, -0.8847367, 1, 0.04705882, 0, 1,
-2.203728, 0.9946019, -1.61863, 1, 0.05490196, 0, 1,
-2.202813, -0.8786796, -1.240326, 1, 0.05882353, 0, 1,
-2.200413, -2.163285, -3.406282, 1, 0.06666667, 0, 1,
-2.182032, -0.278388, -1.872307, 1, 0.07058824, 0, 1,
-2.177638, -2.051186, -1.211036, 1, 0.07843138, 0, 1,
-2.061514, 0.3627358, -2.260876, 1, 0.08235294, 0, 1,
-2.050194, 2.065708, 1.080997, 1, 0.09019608, 0, 1,
-2.023978, 0.03167178, -1.039689, 1, 0.09411765, 0, 1,
-2.023382, 1.568151, 0.9483199, 1, 0.1019608, 0, 1,
-2.00852, -1.949559, -2.38013, 1, 0.1098039, 0, 1,
-1.999112, -0.2175249, -1.88268, 1, 0.1137255, 0, 1,
-1.965348, 0.0167332, -1.507316, 1, 0.1215686, 0, 1,
-1.947478, -1.307405, -1.595429, 1, 0.1254902, 0, 1,
-1.930326, 1.088964, 0.1911031, 1, 0.1333333, 0, 1,
-1.91695, 0.9274892, 1.46546, 1, 0.1372549, 0, 1,
-1.913963, -0.2683814, -3.185645, 1, 0.145098, 0, 1,
-1.878559, 0.3398718, -1.044703, 1, 0.1490196, 0, 1,
-1.853441, -1.026175, -0.9550375, 1, 0.1568628, 0, 1,
-1.82961, -1.024064, -2.114629, 1, 0.1607843, 0, 1,
-1.825857, 0.5173088, -1.701858, 1, 0.1686275, 0, 1,
-1.823693, 0.4466563, -1.171625, 1, 0.172549, 0, 1,
-1.806668, -0.4615149, -1.863924, 1, 0.1803922, 0, 1,
-1.790338, 1.054056, -1.956817, 1, 0.1843137, 0, 1,
-1.777404, 0.6100431, -0.916815, 1, 0.1921569, 0, 1,
-1.774968, 0.6047253, -0.7301766, 1, 0.1960784, 0, 1,
-1.737509, -0.8633192, -2.540751, 1, 0.2039216, 0, 1,
-1.724667, 0.2162085, 0.5943779, 1, 0.2117647, 0, 1,
-1.723114, -0.4848, -3.070368, 1, 0.2156863, 0, 1,
-1.721488, -1.502733, -1.736692, 1, 0.2235294, 0, 1,
-1.714921, 0.5235846, -1.663864, 1, 0.227451, 0, 1,
-1.696495, -0.5866811, -1.985076, 1, 0.2352941, 0, 1,
-1.687832, 0.5833526, 0.1558084, 1, 0.2392157, 0, 1,
-1.687689, -1.295188, -1.958755, 1, 0.2470588, 0, 1,
-1.657268, 1.990296, -0.9202496, 1, 0.2509804, 0, 1,
-1.654073, -0.5235953, -0.1885799, 1, 0.2588235, 0, 1,
-1.648179, 0.9979958, 0.1114991, 1, 0.2627451, 0, 1,
-1.640124, 0.002647274, -0.5701475, 1, 0.2705882, 0, 1,
-1.599379, 1.728224, -0.1213606, 1, 0.2745098, 0, 1,
-1.597506, -0.2915967, -2.260676, 1, 0.282353, 0, 1,
-1.592385, -0.9914301, -2.260307, 1, 0.2862745, 0, 1,
-1.5886, 1.370787, -0.3706526, 1, 0.2941177, 0, 1,
-1.576506, -0.2626336, -2.643637, 1, 0.3019608, 0, 1,
-1.573447, -1.930142, -2.034159, 1, 0.3058824, 0, 1,
-1.56777, 0.2204191, 0.8470289, 1, 0.3137255, 0, 1,
-1.56758, -1.166727, -1.222449, 1, 0.3176471, 0, 1,
-1.565007, 1.045553, -2.494367, 1, 0.3254902, 0, 1,
-1.550097, 0.261506, -1.146696, 1, 0.3294118, 0, 1,
-1.540611, -0.1102827, -0.782743, 1, 0.3372549, 0, 1,
-1.534144, -0.4187249, -1.973101, 1, 0.3411765, 0, 1,
-1.529169, -0.7516283, -2.096284, 1, 0.3490196, 0, 1,
-1.522739, 0.7261572, -1.408764, 1, 0.3529412, 0, 1,
-1.521572, -0.4897168, -2.121993, 1, 0.3607843, 0, 1,
-1.520532, 1.253356, -1.576443, 1, 0.3647059, 0, 1,
-1.497999, -0.212505, -1.947603, 1, 0.372549, 0, 1,
-1.491637, -1.267714, -2.379901, 1, 0.3764706, 0, 1,
-1.483708, 0.8955408, 0.295309, 1, 0.3843137, 0, 1,
-1.476737, 0.666057, -0.2178658, 1, 0.3882353, 0, 1,
-1.46373, -0.5268877, -2.0504, 1, 0.3960784, 0, 1,
-1.460137, -1.4665, -2.859302, 1, 0.4039216, 0, 1,
-1.451822, -0.2958824, -0.9614868, 1, 0.4078431, 0, 1,
-1.449393, 0.108696, -3.401181, 1, 0.4156863, 0, 1,
-1.442038, -0.6796005, -1.142532, 1, 0.4196078, 0, 1,
-1.439723, -0.9257256, -1.948385, 1, 0.427451, 0, 1,
-1.423064, -0.2699836, -1.235677, 1, 0.4313726, 0, 1,
-1.409914, 1.453002, -1.224181, 1, 0.4392157, 0, 1,
-1.408951, 0.3319715, -1.300388, 1, 0.4431373, 0, 1,
-1.403216, -1.087296, -3.687252, 1, 0.4509804, 0, 1,
-1.392105, 0.376969, -1.823594, 1, 0.454902, 0, 1,
-1.391856, 0.01851746, -2.853611, 1, 0.4627451, 0, 1,
-1.378235, -0.7426912, -2.333916, 1, 0.4666667, 0, 1,
-1.371697, 2.136452, -1.052777, 1, 0.4745098, 0, 1,
-1.37004, 0.2410984, -2.139177, 1, 0.4784314, 0, 1,
-1.368689, -0.859596, -2.079524, 1, 0.4862745, 0, 1,
-1.363637, 0.3259723, -1.947364, 1, 0.4901961, 0, 1,
-1.358429, 0.8355441, -2.449373, 1, 0.4980392, 0, 1,
-1.338827, 0.01878489, 0.5728603, 1, 0.5058824, 0, 1,
-1.336346, 1.486628, -1.535019, 1, 0.509804, 0, 1,
-1.334538, -0.6871599, -1.885595, 1, 0.5176471, 0, 1,
-1.333498, 0.2389507, -0.7642066, 1, 0.5215687, 0, 1,
-1.330701, 0.3958425, -1.721546, 1, 0.5294118, 0, 1,
-1.330697, -0.7724908, -1.720032, 1, 0.5333334, 0, 1,
-1.330079, 1.860254, -0.3965535, 1, 0.5411765, 0, 1,
-1.324676, 2.45571, 0.8816428, 1, 0.5450981, 0, 1,
-1.304189, 1.568718, -2.930831, 1, 0.5529412, 0, 1,
-1.301592, -0.09618934, -1.597402, 1, 0.5568628, 0, 1,
-1.294772, -0.3993208, -1.941921, 1, 0.5647059, 0, 1,
-1.287224, 0.6667691, -0.4224044, 1, 0.5686275, 0, 1,
-1.277489, -0.7003755, -2.975302, 1, 0.5764706, 0, 1,
-1.262694, 3.020236, -1.505472, 1, 0.5803922, 0, 1,
-1.257182, -0.9432005, -2.86334, 1, 0.5882353, 0, 1,
-1.249198, -0.05538911, -1.35669, 1, 0.5921569, 0, 1,
-1.232547, 0.2457104, -1.349908, 1, 0.6, 0, 1,
-1.228408, -0.5300564, -4.070644, 1, 0.6078432, 0, 1,
-1.217713, 0.7125573, -0.6521745, 1, 0.6117647, 0, 1,
-1.213969, 0.05864113, -2.366239, 1, 0.6196079, 0, 1,
-1.210206, -0.8754501, -2.748629, 1, 0.6235294, 0, 1,
-1.209986, -1.662015, -0.9508618, 1, 0.6313726, 0, 1,
-1.192024, 1.371107, 0.3318041, 1, 0.6352941, 0, 1,
-1.186224, 2.604501, 0.7526947, 1, 0.6431373, 0, 1,
-1.184582, 0.5101151, -1.128345, 1, 0.6470588, 0, 1,
-1.18245, -0.6847997, -2.151418, 1, 0.654902, 0, 1,
-1.180447, 0.02258736, -2.763097, 1, 0.6588235, 0, 1,
-1.179134, 1.943802, 0.6385664, 1, 0.6666667, 0, 1,
-1.176032, -0.2432282, -0.4765546, 1, 0.6705883, 0, 1,
-1.172802, 2.138713, -0.8139321, 1, 0.6784314, 0, 1,
-1.149119, -0.03961965, -0.1164252, 1, 0.682353, 0, 1,
-1.147723, 0.4382863, -1.345425, 1, 0.6901961, 0, 1,
-1.14146, -0.3601578, -4.34126, 1, 0.6941177, 0, 1,
-1.137837, 0.1946131, -0.7597165, 1, 0.7019608, 0, 1,
-1.136584, -1.304763, -2.329407, 1, 0.7098039, 0, 1,
-1.130733, -0.8209864, -1.91015, 1, 0.7137255, 0, 1,
-1.123059, 0.6378909, 0.08164213, 1, 0.7215686, 0, 1,
-1.122274, -0.6563517, -4.332755, 1, 0.7254902, 0, 1,
-1.12021, -0.5018972, -1.947408, 1, 0.7333333, 0, 1,
-1.118755, 0.2041305, -1.318149, 1, 0.7372549, 0, 1,
-1.103997, 1.015793, -1.090221, 1, 0.7450981, 0, 1,
-1.095679, 0.9867113, 0.6226227, 1, 0.7490196, 0, 1,
-1.092353, -1.721476, -3.775661, 1, 0.7568628, 0, 1,
-1.085009, -1.723473, -3.12664, 1, 0.7607843, 0, 1,
-1.080055, 0.7279139, -2.063807, 1, 0.7686275, 0, 1,
-1.078102, -1.625834, -2.05924, 1, 0.772549, 0, 1,
-1.076544, 1.727659, -0.7331024, 1, 0.7803922, 0, 1,
-1.075353, 0.3949474, -1.687593, 1, 0.7843137, 0, 1,
-1.068176, -1.347181, -3.213347, 1, 0.7921569, 0, 1,
-1.061074, 0.5755351, 0.292594, 1, 0.7960784, 0, 1,
-1.058944, 0.09014644, -0.7961363, 1, 0.8039216, 0, 1,
-1.058581, 0.2772828, -1.634325, 1, 0.8117647, 0, 1,
-1.056807, 1.124905, -0.9109797, 1, 0.8156863, 0, 1,
-1.05523, 1.029393, -2.042692, 1, 0.8235294, 0, 1,
-1.054886, 1.256025, -0.7394353, 1, 0.827451, 0, 1,
-1.052593, -0.5028626, -1.31568, 1, 0.8352941, 0, 1,
-1.049527, 1.321432, -1.046579, 1, 0.8392157, 0, 1,
-1.042009, 0.4096403, -0.937085, 1, 0.8470588, 0, 1,
-1.028675, 1.653774, 0.1482999, 1, 0.8509804, 0, 1,
-1.01789, -0.2265975, -2.706305, 1, 0.8588235, 0, 1,
-1.017334, -1.285122, -5.199942, 1, 0.8627451, 0, 1,
-1.016398, -1.019086, -2.066839, 1, 0.8705882, 0, 1,
-1.009336, -0.1165974, -1.344093, 1, 0.8745098, 0, 1,
-1.005183, -1.264628, -2.438319, 1, 0.8823529, 0, 1,
-0.9908448, -0.1927278, -1.585504, 1, 0.8862745, 0, 1,
-0.9908413, -0.6482486, -1.544518, 1, 0.8941177, 0, 1,
-0.9862748, 1.628748, 1.884905, 1, 0.8980392, 0, 1,
-0.9810967, 0.1108618, -1.24765, 1, 0.9058824, 0, 1,
-0.9794966, 0.5033684, -0.2757234, 1, 0.9137255, 0, 1,
-0.9667259, -0.1984891, -1.427493, 1, 0.9176471, 0, 1,
-0.9665172, -0.1467466, 0.04076161, 1, 0.9254902, 0, 1,
-0.9605833, 0.209375, -2.223273, 1, 0.9294118, 0, 1,
-0.9542457, -0.1569929, -1.074826, 1, 0.9372549, 0, 1,
-0.9542217, -1.765929, -2.035099, 1, 0.9411765, 0, 1,
-0.9534371, -0.1813238, -2.870659, 1, 0.9490196, 0, 1,
-0.9474773, -0.06879764, -1.003798, 1, 0.9529412, 0, 1,
-0.9396698, 0.5800416, -2.044119, 1, 0.9607843, 0, 1,
-0.9290626, 0.2085382, -0.4085992, 1, 0.9647059, 0, 1,
-0.9277343, -0.4429413, -1.392104, 1, 0.972549, 0, 1,
-0.9171106, 0.5254267, -0.6650971, 1, 0.9764706, 0, 1,
-0.9151502, 0.6075917, -0.1841721, 1, 0.9843137, 0, 1,
-0.9134833, 0.4899955, -0.8951101, 1, 0.9882353, 0, 1,
-0.90454, -0.9489598, -0.7073087, 1, 0.9960784, 0, 1,
-0.9036519, 1.947629, -1.516354, 0.9960784, 1, 0, 1,
-0.8969901, -1.739904, -2.195297, 0.9921569, 1, 0, 1,
-0.8910717, 0.08019023, -1.304829, 0.9843137, 1, 0, 1,
-0.8873748, -1.004083, -1.678136, 0.9803922, 1, 0, 1,
-0.8871007, -1.583873, -1.597948, 0.972549, 1, 0, 1,
-0.8850644, 2.103008, -0.2808709, 0.9686275, 1, 0, 1,
-0.88469, -1.251592, -1.971453, 0.9607843, 1, 0, 1,
-0.8845023, -1.10937, -1.56869, 0.9568627, 1, 0, 1,
-0.8812233, -2.613728, -2.409711, 0.9490196, 1, 0, 1,
-0.8694736, -0.9417568, -2.662091, 0.945098, 1, 0, 1,
-0.8645658, 0.1957354, -1.732817, 0.9372549, 1, 0, 1,
-0.8639265, 0.2734061, 0.6936085, 0.9333333, 1, 0, 1,
-0.8619819, 1.009691, -0.7168527, 0.9254902, 1, 0, 1,
-0.8575233, 0.9123684, -1.344586, 0.9215686, 1, 0, 1,
-0.8574458, 1.896633, -0.7651539, 0.9137255, 1, 0, 1,
-0.8531666, 0.00681467, -2.660578, 0.9098039, 1, 0, 1,
-0.8484536, -0.0846587, -2.398272, 0.9019608, 1, 0, 1,
-0.8450431, -0.08247177, -1.883678, 0.8941177, 1, 0, 1,
-0.8431392, -0.8173685, -3.950228, 0.8901961, 1, 0, 1,
-0.8419232, -0.02105115, -1.637194, 0.8823529, 1, 0, 1,
-0.8382109, -1.211731, -2.98491, 0.8784314, 1, 0, 1,
-0.8332955, 0.08015613, -1.714337, 0.8705882, 1, 0, 1,
-0.8310827, 1.898179, 0.310853, 0.8666667, 1, 0, 1,
-0.830915, -0.730136, -1.720711, 0.8588235, 1, 0, 1,
-0.8284997, -0.07973695, -3.6294, 0.854902, 1, 0, 1,
-0.8273375, -0.3053069, -2.163532, 0.8470588, 1, 0, 1,
-0.8262085, 0.1201206, -0.7463326, 0.8431373, 1, 0, 1,
-0.8250827, 1.461909, -1.229121, 0.8352941, 1, 0, 1,
-0.8219253, -0.6888819, -2.706413, 0.8313726, 1, 0, 1,
-0.8122593, 0.3018387, 0.5046731, 0.8235294, 1, 0, 1,
-0.8080676, 0.0006631717, -1.781551, 0.8196079, 1, 0, 1,
-0.8061253, 0.1138361, -3.492594, 0.8117647, 1, 0, 1,
-0.8056809, 0.4024665, -1.671763, 0.8078431, 1, 0, 1,
-0.80524, 0.542738, 0.2330935, 0.8, 1, 0, 1,
-0.8033363, 0.7512161, -1.434939, 0.7921569, 1, 0, 1,
-0.8030191, -2.549539, -1.757529, 0.7882353, 1, 0, 1,
-0.793145, 0.5022677, -1.520225, 0.7803922, 1, 0, 1,
-0.7919084, -1.015381, -1.279189, 0.7764706, 1, 0, 1,
-0.7846074, 1.579697, -0.6765279, 0.7686275, 1, 0, 1,
-0.7711659, -0.8131182, -3.220137, 0.7647059, 1, 0, 1,
-0.7706581, 0.3856696, -1.992649, 0.7568628, 1, 0, 1,
-0.7670986, 0.5770108, -0.6528387, 0.7529412, 1, 0, 1,
-0.7666752, -0.06062102, -1.341045, 0.7450981, 1, 0, 1,
-0.7641523, 0.6323185, -0.1382007, 0.7411765, 1, 0, 1,
-0.7611873, -2.770187, -3.062954, 0.7333333, 1, 0, 1,
-0.7424519, 0.811152, -1.131656, 0.7294118, 1, 0, 1,
-0.7325947, 0.2033597, -1.08631, 0.7215686, 1, 0, 1,
-0.7311242, 0.1371452, -1.407357, 0.7176471, 1, 0, 1,
-0.7301771, -0.4890649, -0.9957739, 0.7098039, 1, 0, 1,
-0.7291103, 0.2635351, -0.3422489, 0.7058824, 1, 0, 1,
-0.7276601, 0.02729833, -0.8268287, 0.6980392, 1, 0, 1,
-0.7271193, 1.212159, -1.735721, 0.6901961, 1, 0, 1,
-0.7268032, -0.5391517, -4.091777, 0.6862745, 1, 0, 1,
-0.7252331, -0.7445322, -3.582707, 0.6784314, 1, 0, 1,
-0.7198776, 1.412778, -2.395729, 0.6745098, 1, 0, 1,
-0.7188063, -0.5212151, -2.218041, 0.6666667, 1, 0, 1,
-0.7147418, 0.7455274, -0.7281349, 0.6627451, 1, 0, 1,
-0.7114644, 0.7978851, 0.05512969, 0.654902, 1, 0, 1,
-0.711217, -0.3032514, -2.543862, 0.6509804, 1, 0, 1,
-0.7051308, 0.04588773, -1.891932, 0.6431373, 1, 0, 1,
-0.6992317, -1.554424, -1.34172, 0.6392157, 1, 0, 1,
-0.6979491, -0.3815862, -3.349404, 0.6313726, 1, 0, 1,
-0.6963539, -0.5587671, -3.819638, 0.627451, 1, 0, 1,
-0.6932828, 1.291271, -1.240487, 0.6196079, 1, 0, 1,
-0.6918421, 0.8631661, -2.669262, 0.6156863, 1, 0, 1,
-0.6865057, 1.532601, 0.970748, 0.6078432, 1, 0, 1,
-0.6826307, -0.7518831, -1.184024, 0.6039216, 1, 0, 1,
-0.6815462, -0.1604809, -1.488412, 0.5960785, 1, 0, 1,
-0.6792417, -0.6476707, -2.878961, 0.5882353, 1, 0, 1,
-0.6628698, -0.1541186, -0.8485806, 0.5843138, 1, 0, 1,
-0.6614416, 0.6523044, -0.6702946, 0.5764706, 1, 0, 1,
-0.6612189, -0.650104, -2.562412, 0.572549, 1, 0, 1,
-0.6605047, -0.3850846, -3.368491, 0.5647059, 1, 0, 1,
-0.6573351, 0.2702193, 0.2856593, 0.5607843, 1, 0, 1,
-0.6542853, -0.184115, -1.238802, 0.5529412, 1, 0, 1,
-0.6542444, -0.1771705, -2.258029, 0.5490196, 1, 0, 1,
-0.6511401, 1.703768, 1.057078, 0.5411765, 1, 0, 1,
-0.650053, 0.9881796, -2.612677, 0.5372549, 1, 0, 1,
-0.6498098, 0.2152221, -0.6399475, 0.5294118, 1, 0, 1,
-0.6492985, -0.1319367, -1.368384, 0.5254902, 1, 0, 1,
-0.6428219, -0.395737, -0.8104305, 0.5176471, 1, 0, 1,
-0.6419346, 0.4240561, -2.02971, 0.5137255, 1, 0, 1,
-0.6403654, 0.4754419, -0.3652367, 0.5058824, 1, 0, 1,
-0.6308277, 0.4367435, 0.574968, 0.5019608, 1, 0, 1,
-0.625655, 0.3770021, -0.8234214, 0.4941176, 1, 0, 1,
-0.6230419, -0.02096423, -0.1494983, 0.4862745, 1, 0, 1,
-0.6220884, 0.4102824, -0.2798961, 0.4823529, 1, 0, 1,
-0.6211921, -0.7606912, -3.484601, 0.4745098, 1, 0, 1,
-0.6185092, -0.3041886, -0.5218286, 0.4705882, 1, 0, 1,
-0.6152065, -0.7526415, -4.027629, 0.4627451, 1, 0, 1,
-0.6146172, -0.9358413, -3.483359, 0.4588235, 1, 0, 1,
-0.6095899, -0.2388755, -2.454947, 0.4509804, 1, 0, 1,
-0.6063359, 0.5986372, 0.2127348, 0.4470588, 1, 0, 1,
-0.6036929, -0.8518609, -0.7481247, 0.4392157, 1, 0, 1,
-0.6021912, -2.472917, -4.106924, 0.4352941, 1, 0, 1,
-0.5995812, 0.7929173, 1.366138, 0.427451, 1, 0, 1,
-0.5973938, 0.55958, -0.2264031, 0.4235294, 1, 0, 1,
-0.5950893, 0.1550852, -1.764048, 0.4156863, 1, 0, 1,
-0.5885347, 0.7312376, -0.09997692, 0.4117647, 1, 0, 1,
-0.5847628, -0.7982412, -2.343316, 0.4039216, 1, 0, 1,
-0.5821251, 0.4291154, -2.032122, 0.3960784, 1, 0, 1,
-0.5789778, 0.8666589, 2.221369, 0.3921569, 1, 0, 1,
-0.5753293, 0.67181, -1.8131, 0.3843137, 1, 0, 1,
-0.571602, -0.2643712, -1.338531, 0.3803922, 1, 0, 1,
-0.5705037, 0.7411402, -2.457437, 0.372549, 1, 0, 1,
-0.5704959, 0.4033025, -2.45569, 0.3686275, 1, 0, 1,
-0.5679189, -1.113163, -2.893621, 0.3607843, 1, 0, 1,
-0.5678656, 0.3805822, -2.190272, 0.3568628, 1, 0, 1,
-0.5677648, 0.01036748, -1.879063, 0.3490196, 1, 0, 1,
-0.5644395, -0.8690129, -3.048207, 0.345098, 1, 0, 1,
-0.5614201, 0.2920877, -0.07132129, 0.3372549, 1, 0, 1,
-0.552418, -0.2238895, -1.742146, 0.3333333, 1, 0, 1,
-0.5483782, 0.6247378, -1.257571, 0.3254902, 1, 0, 1,
-0.5476708, -0.3760017, -3.06454, 0.3215686, 1, 0, 1,
-0.546866, -0.3566032, -4.453013, 0.3137255, 1, 0, 1,
-0.5465045, -0.779002, -2.807243, 0.3098039, 1, 0, 1,
-0.5462386, 0.2265141, -1.438506, 0.3019608, 1, 0, 1,
-0.5441208, -1.802829, -3.548342, 0.2941177, 1, 0, 1,
-0.5403694, 1.269603, -0.2621884, 0.2901961, 1, 0, 1,
-0.5395805, 0.642121, -0.290861, 0.282353, 1, 0, 1,
-0.5388101, -0.3872232, -0.376015, 0.2784314, 1, 0, 1,
-0.5266508, 1.036607, -1.243836, 0.2705882, 1, 0, 1,
-0.5238611, -1.914142, -2.687811, 0.2666667, 1, 0, 1,
-0.5191231, -0.9400175, -2.261387, 0.2588235, 1, 0, 1,
-0.5180438, 1.124879, 1.00467, 0.254902, 1, 0, 1,
-0.5175022, 0.1294366, -1.587374, 0.2470588, 1, 0, 1,
-0.5157625, 0.1442719, -1.300533, 0.2431373, 1, 0, 1,
-0.5139531, 1.01765, -1.77034, 0.2352941, 1, 0, 1,
-0.5117759, 0.7063673, -0.556185, 0.2313726, 1, 0, 1,
-0.5083202, -0.4183759, -4.970912, 0.2235294, 1, 0, 1,
-0.5074083, -0.404123, -4.591838, 0.2196078, 1, 0, 1,
-0.5066009, -1.533519, -2.994188, 0.2117647, 1, 0, 1,
-0.5059784, 0.1160823, -2.141517, 0.2078431, 1, 0, 1,
-0.5034456, 1.441125, -0.03771785, 0.2, 1, 0, 1,
-0.5033847, -0.4484233, -4.808102, 0.1921569, 1, 0, 1,
-0.5003443, 0.938288, -0.4554358, 0.1882353, 1, 0, 1,
-0.4982932, -0.7640598, -2.766547, 0.1803922, 1, 0, 1,
-0.4890668, -1.018743, -0.5388399, 0.1764706, 1, 0, 1,
-0.4864886, 1.464844, -2.595478, 0.1686275, 1, 0, 1,
-0.4854484, -0.8722041, -2.39974, 0.1647059, 1, 0, 1,
-0.4842173, -0.3460575, -3.018192, 0.1568628, 1, 0, 1,
-0.4753068, -1.766981, -2.352704, 0.1529412, 1, 0, 1,
-0.4646702, -1.288163, -2.380303, 0.145098, 1, 0, 1,
-0.454366, -0.7973691, -3.419231, 0.1411765, 1, 0, 1,
-0.4539178, -0.2248725, -1.844235, 0.1333333, 1, 0, 1,
-0.4538628, 0.4371836, -2.672956, 0.1294118, 1, 0, 1,
-0.4483705, -0.8109598, -4.638295, 0.1215686, 1, 0, 1,
-0.4370557, 0.3560853, -0.7664592, 0.1176471, 1, 0, 1,
-0.436852, 0.7598608, 0.363974, 0.1098039, 1, 0, 1,
-0.4346929, -1.017802, -1.949033, 0.1058824, 1, 0, 1,
-0.4346834, -1.124231, -3.289685, 0.09803922, 1, 0, 1,
-0.4308609, -0.9841138, -3.11384, 0.09019608, 1, 0, 1,
-0.430148, 1.457455, 0.6204857, 0.08627451, 1, 0, 1,
-0.4289805, 0.8488511, -0.0361543, 0.07843138, 1, 0, 1,
-0.4253157, -0.3165058, -1.258416, 0.07450981, 1, 0, 1,
-0.4216246, -0.8947828, -1.196527, 0.06666667, 1, 0, 1,
-0.4183558, -0.3336115, -2.479413, 0.0627451, 1, 0, 1,
-0.418349, 1.455507, 0.3363472, 0.05490196, 1, 0, 1,
-0.4176086, 2.177016, -0.3421305, 0.05098039, 1, 0, 1,
-0.4175971, 0.04665357, -0.1680258, 0.04313726, 1, 0, 1,
-0.4156196, -1.181579, -2.922648, 0.03921569, 1, 0, 1,
-0.4131316, 0.6412312, -2.450761, 0.03137255, 1, 0, 1,
-0.4127813, 0.02622805, 1.62004, 0.02745098, 1, 0, 1,
-0.4120204, 0.498924, -0.7744013, 0.01960784, 1, 0, 1,
-0.4080153, -1.91261, -3.194621, 0.01568628, 1, 0, 1,
-0.4054588, 0.9384503, 0.2328816, 0.007843138, 1, 0, 1,
-0.4043985, -0.8152592, -3.831601, 0.003921569, 1, 0, 1,
-0.4019143, 0.1492043, -1.706706, 0, 1, 0.003921569, 1,
-0.3996685, -0.3954211, -2.782216, 0, 1, 0.01176471, 1,
-0.3986388, -1.431669, -2.47554, 0, 1, 0.01568628, 1,
-0.3975825, 0.1502814, -1.193816, 0, 1, 0.02352941, 1,
-0.3933083, 0.21012, -0.2259575, 0, 1, 0.02745098, 1,
-0.3917671, 1.315447, -2.313477, 0, 1, 0.03529412, 1,
-0.3866199, 2.998522, 1.001105, 0, 1, 0.03921569, 1,
-0.3817278, -0.8713149, -2.566615, 0, 1, 0.04705882, 1,
-0.3787523, -0.9451764, -2.3859, 0, 1, 0.05098039, 1,
-0.3772068, -1.615156, -1.730565, 0, 1, 0.05882353, 1,
-0.3749616, 0.01973538, -1.769566, 0, 1, 0.0627451, 1,
-0.3733393, -0.5205153, -3.129784, 0, 1, 0.07058824, 1,
-0.3714756, -0.2688953, -2.197832, 0, 1, 0.07450981, 1,
-0.3692693, 0.9140146, 1.557195, 0, 1, 0.08235294, 1,
-0.3684148, -0.4700102, -2.033826, 0, 1, 0.08627451, 1,
-0.3668205, -1.097734, -1.321395, 0, 1, 0.09411765, 1,
-0.3660442, 0.2095, -0.179415, 0, 1, 0.1019608, 1,
-0.3618381, -0.6796932, -2.494016, 0, 1, 0.1058824, 1,
-0.3597912, 0.2180478, -0.8702093, 0, 1, 0.1137255, 1,
-0.3593977, 2.154234, -0.9170869, 0, 1, 0.1176471, 1,
-0.3591393, 0.3518112, 0.4780657, 0, 1, 0.1254902, 1,
-0.3511441, -0.3624145, -2.351506, 0, 1, 0.1294118, 1,
-0.350906, 0.8761069, -0.3742767, 0, 1, 0.1372549, 1,
-0.3500356, -0.6441151, -2.711156, 0, 1, 0.1411765, 1,
-0.3462902, 3.501746, -1.128697, 0, 1, 0.1490196, 1,
-0.3459405, -1.320709, -0.7540988, 0, 1, 0.1529412, 1,
-0.3404213, 0.07761648, -1.707082, 0, 1, 0.1607843, 1,
-0.3388221, 0.2005801, -0.1829498, 0, 1, 0.1647059, 1,
-0.3373393, 0.6800097, -0.6834034, 0, 1, 0.172549, 1,
-0.3343985, -2.159199, -3.797155, 0, 1, 0.1764706, 1,
-0.3339143, -1.110602, -3.984942, 0, 1, 0.1843137, 1,
-0.3337384, 0.2939721, -0.5507373, 0, 1, 0.1882353, 1,
-0.3318198, 0.6484746, 0.09617896, 0, 1, 0.1960784, 1,
-0.3287229, -1.384144, -4.069341, 0, 1, 0.2039216, 1,
-0.3269341, -0.02238441, -0.6500663, 0, 1, 0.2078431, 1,
-0.3267753, -0.5116659, -0.8413632, 0, 1, 0.2156863, 1,
-0.3264671, -0.5090222, -3.848192, 0, 1, 0.2196078, 1,
-0.3218837, -0.0608657, -1.3801, 0, 1, 0.227451, 1,
-0.3205677, -0.5990338, -4.04581, 0, 1, 0.2313726, 1,
-0.3185117, -0.355218, -1.572173, 0, 1, 0.2392157, 1,
-0.3121318, -0.7115179, -2.714499, 0, 1, 0.2431373, 1,
-0.3117363, 0.6625182, -1.259439, 0, 1, 0.2509804, 1,
-0.3034887, 0.392897, -1.281926, 0, 1, 0.254902, 1,
-0.3023925, 0.1724754, -2.03529, 0, 1, 0.2627451, 1,
-0.302364, -1.004474, -3.346036, 0, 1, 0.2666667, 1,
-0.2942917, -0.3055702, -3.158905, 0, 1, 0.2745098, 1,
-0.2888003, 1.647791, 0.1355296, 0, 1, 0.2784314, 1,
-0.2887534, 0.273508, 0.3506537, 0, 1, 0.2862745, 1,
-0.2802209, 0.5861605, -0.6079024, 0, 1, 0.2901961, 1,
-0.2801882, -1.031132, -3.886637, 0, 1, 0.2980392, 1,
-0.2797564, -0.3934212, -2.677733, 0, 1, 0.3058824, 1,
-0.2796333, -0.2248357, -2.322485, 0, 1, 0.3098039, 1,
-0.277574, 0.4355688, 0.144751, 0, 1, 0.3176471, 1,
-0.274832, -1.280597, -3.245113, 0, 1, 0.3215686, 1,
-0.2746598, -1.231662, -3.475533, 0, 1, 0.3294118, 1,
-0.2741098, 0.1469042, -2.905896, 0, 1, 0.3333333, 1,
-0.2740371, 1.964175, 0.3548091, 0, 1, 0.3411765, 1,
-0.2723451, -1.110903, -2.171179, 0, 1, 0.345098, 1,
-0.2681202, -0.916855, -3.918382, 0, 1, 0.3529412, 1,
-0.2668405, -2.314696, -1.388727, 0, 1, 0.3568628, 1,
-0.2600738, 1.235049, -0.4139938, 0, 1, 0.3647059, 1,
-0.2589221, -0.746675, -2.692139, 0, 1, 0.3686275, 1,
-0.2573773, -1.922955, -3.733036, 0, 1, 0.3764706, 1,
-0.255092, -0.8617473, -2.819695, 0, 1, 0.3803922, 1,
-0.254261, -0.3060383, -3.353472, 0, 1, 0.3882353, 1,
-0.2527528, -0.2580215, -0.5080914, 0, 1, 0.3921569, 1,
-0.2476112, -0.1924561, -3.288157, 0, 1, 0.4, 1,
-0.2449792, -0.752908, -2.560915, 0, 1, 0.4078431, 1,
-0.2449216, 1.123698, -0.4100547, 0, 1, 0.4117647, 1,
-0.2273889, 1.451516, 0.693545, 0, 1, 0.4196078, 1,
-0.2268007, -1.037171, -3.938475, 0, 1, 0.4235294, 1,
-0.2206588, -1.509281, -1.211834, 0, 1, 0.4313726, 1,
-0.2186753, -1.044164, -3.324684, 0, 1, 0.4352941, 1,
-0.2183035, -0.2409229, -1.422227, 0, 1, 0.4431373, 1,
-0.2164896, 0.1224483, -1.404397, 0, 1, 0.4470588, 1,
-0.2153314, -1.198936, -3.466395, 0, 1, 0.454902, 1,
-0.215071, 0.8679369, 0.686152, 0, 1, 0.4588235, 1,
-0.207216, -0.7628002, -3.145009, 0, 1, 0.4666667, 1,
-0.2047051, 0.1328037, -0.5234337, 0, 1, 0.4705882, 1,
-0.2045174, -1.245351, -3.305791, 0, 1, 0.4784314, 1,
-0.2028852, 0.2222147, -1.865772, 0, 1, 0.4823529, 1,
-0.2017945, 0.5118052, -0.7408212, 0, 1, 0.4901961, 1,
-0.2001518, -1.21329, -2.340684, 0, 1, 0.4941176, 1,
-0.199575, 1.291973, 1.015762, 0, 1, 0.5019608, 1,
-0.1979485, 0.1507862, -0.061491, 0, 1, 0.509804, 1,
-0.1967783, 1.914125, 0.06123614, 0, 1, 0.5137255, 1,
-0.1901326, 0.6901943, -0.3232931, 0, 1, 0.5215687, 1,
-0.189975, -1.311048, -3.009271, 0, 1, 0.5254902, 1,
-0.1884261, 2.323114, 0.07097287, 0, 1, 0.5333334, 1,
-0.1846254, -0.9519894, -2.868831, 0, 1, 0.5372549, 1,
-0.1830624, -1.236449, -3.385853, 0, 1, 0.5450981, 1,
-0.1779878, -1.08303, -3.057976, 0, 1, 0.5490196, 1,
-0.17757, 0.5087808, -0.4991573, 0, 1, 0.5568628, 1,
-0.1737951, 1.329747, -0.3707049, 0, 1, 0.5607843, 1,
-0.1651189, 1.122113, -0.4054881, 0, 1, 0.5686275, 1,
-0.1626193, 0.6635458, -0.8434936, 0, 1, 0.572549, 1,
-0.1622201, 1.003409, 0.5350473, 0, 1, 0.5803922, 1,
-0.1597009, 0.0845209, -1.510791, 0, 1, 0.5843138, 1,
-0.156381, 0.2174888, -1.089446, 0, 1, 0.5921569, 1,
-0.1563317, 1.339328, 1.049053, 0, 1, 0.5960785, 1,
-0.154001, -0.1514016, -2.047921, 0, 1, 0.6039216, 1,
-0.1537706, 0.01573849, -1.443434, 0, 1, 0.6117647, 1,
-0.1460674, 0.2181213, -0.9006881, 0, 1, 0.6156863, 1,
-0.1442196, -0.3956951, -1.543729, 0, 1, 0.6235294, 1,
-0.143177, 0.4497912, 0.905416, 0, 1, 0.627451, 1,
-0.1427857, -0.03427531, -0.6668706, 0, 1, 0.6352941, 1,
-0.1402043, 0.1548114, 1.276147, 0, 1, 0.6392157, 1,
-0.1347553, 0.6022192, 0.9997282, 0, 1, 0.6470588, 1,
-0.1338306, 1.297954, -1.040817, 0, 1, 0.6509804, 1,
-0.1328565, -1.114422, -4.135207, 0, 1, 0.6588235, 1,
-0.1328512, -1.116606, -3.53313, 0, 1, 0.6627451, 1,
-0.1299089, 0.6611983, 0.1597238, 0, 1, 0.6705883, 1,
-0.1297827, -2.532522, -1.58504, 0, 1, 0.6745098, 1,
-0.1257871, -0.02358792, -2.726441, 0, 1, 0.682353, 1,
-0.1254016, 1.188372, -0.3423534, 0, 1, 0.6862745, 1,
-0.1228813, 0.04669531, -2.814403, 0, 1, 0.6941177, 1,
-0.1213477, 0.1311285, -0.05286407, 0, 1, 0.7019608, 1,
-0.1185912, -0.9866211, -4.044126, 0, 1, 0.7058824, 1,
-0.1122633, -0.06636386, -1.840968, 0, 1, 0.7137255, 1,
-0.1096889, -0.3912387, -2.783273, 0, 1, 0.7176471, 1,
-0.1061055, 0.6040599, -0.03345685, 0, 1, 0.7254902, 1,
-0.1060017, 0.1688075, -2.003825, 0, 1, 0.7294118, 1,
-0.1030249, -2.082174, -3.199055, 0, 1, 0.7372549, 1,
-0.1027657, 0.2026149, -0.9087588, 0, 1, 0.7411765, 1,
-0.09821472, 0.2478995, -0.3856003, 0, 1, 0.7490196, 1,
-0.09773147, 0.2503267, 0.02484525, 0, 1, 0.7529412, 1,
-0.09767722, -0.6146405, -3.172251, 0, 1, 0.7607843, 1,
-0.09414197, 0.1971003, -0.7718731, 0, 1, 0.7647059, 1,
-0.09195692, 1.232612, -0.5547398, 0, 1, 0.772549, 1,
-0.08906662, -2.573384, -3.241168, 0, 1, 0.7764706, 1,
-0.08747838, 0.1874229, -2.335163, 0, 1, 0.7843137, 1,
-0.08622751, -0.9790741, -2.142757, 0, 1, 0.7882353, 1,
-0.08219567, -2.532502, -3.767007, 0, 1, 0.7960784, 1,
-0.08025273, 0.08337729, 0.4449472, 0, 1, 0.8039216, 1,
-0.07861012, 0.1155095, -0.04413564, 0, 1, 0.8078431, 1,
-0.06835289, -3.374907, -2.938143, 0, 1, 0.8156863, 1,
-0.06715851, 1.520948, 1.298362, 0, 1, 0.8196079, 1,
-0.06395473, -0.0363066, -1.849273, 0, 1, 0.827451, 1,
-0.05628763, -0.7080609, -2.691139, 0, 1, 0.8313726, 1,
-0.05215841, -0.6396165, -3.959342, 0, 1, 0.8392157, 1,
-0.0509011, 0.8842085, -0.1497575, 0, 1, 0.8431373, 1,
-0.04766459, -0.7149808, -3.572073, 0, 1, 0.8509804, 1,
-0.04733827, 1.229441, 0.185647, 0, 1, 0.854902, 1,
-0.04209314, 0.5011442, 0.1033615, 0, 1, 0.8627451, 1,
-0.04098306, 1.074003, -0.4960341, 0, 1, 0.8666667, 1,
-0.04053025, 1.906778, -1.03099, 0, 1, 0.8745098, 1,
-0.0389971, 1.153263, 0.1926066, 0, 1, 0.8784314, 1,
-0.03704915, -1.632004, -3.800409, 0, 1, 0.8862745, 1,
-0.03465022, 0.761319, 0.6065295, 0, 1, 0.8901961, 1,
-0.03450529, -0.1499336, -5.333879, 0, 1, 0.8980392, 1,
-0.03448258, 1.152391, 1.214284, 0, 1, 0.9058824, 1,
-0.03053297, -0.8524727, -4.091647, 0, 1, 0.9098039, 1,
-0.02919926, 0.1818392, -0.03205594, 0, 1, 0.9176471, 1,
-0.02640074, 1.308899, -0.8981641, 0, 1, 0.9215686, 1,
-0.02217621, -0.05795058, -1.982101, 0, 1, 0.9294118, 1,
-0.0205094, -0.3223623, -3.385286, 0, 1, 0.9333333, 1,
-0.01763236, -0.457195, -1.691307, 0, 1, 0.9411765, 1,
-0.01257904, -2.392424, -4.216223, 0, 1, 0.945098, 1,
-0.00793634, 0.1365347, -0.623853, 0, 1, 0.9529412, 1,
-0.003939406, -2.353084, -2.47791, 0, 1, 0.9568627, 1,
-0.002672075, 0.1987381, 1.965571, 0, 1, 0.9647059, 1,
0.004033103, 0.3023812, 0.01639587, 0, 1, 0.9686275, 1,
0.01082086, 0.6490265, 0.1766763, 0, 1, 0.9764706, 1,
0.01140449, 0.6855561, 0.7315406, 0, 1, 0.9803922, 1,
0.01680703, 0.7808815, 0.6550135, 0, 1, 0.9882353, 1,
0.01684905, 1.765927, -0.6103972, 0, 1, 0.9921569, 1,
0.01843608, -0.1993965, 4.741, 0, 1, 1, 1,
0.02445741, 0.04528079, 1.046955, 0, 0.9921569, 1, 1,
0.02545601, -0.1342458, 4.529484, 0, 0.9882353, 1, 1,
0.02741908, 0.3590988, 1.784465, 0, 0.9803922, 1, 1,
0.03000087, -0.9522762, 2.789361, 0, 0.9764706, 1, 1,
0.0350318, 0.4248734, 0.7438683, 0, 0.9686275, 1, 1,
0.03647363, 1.908807, 0.1286871, 0, 0.9647059, 1, 1,
0.03650241, 0.5880727, 2.593857, 0, 0.9568627, 1, 1,
0.03658707, 1.404908, -0.3714926, 0, 0.9529412, 1, 1,
0.03730568, 2.32747, 0.7676727, 0, 0.945098, 1, 1,
0.03878234, -0.5944712, 0.3928947, 0, 0.9411765, 1, 1,
0.03911521, -1.31861, 4.755965, 0, 0.9333333, 1, 1,
0.03981664, -2.231209, 0.9960454, 0, 0.9294118, 1, 1,
0.0402141, -0.8749046, 4.817997, 0, 0.9215686, 1, 1,
0.05261191, -0.2879861, 2.923943, 0, 0.9176471, 1, 1,
0.05285905, -0.2825497, 3.886297, 0, 0.9098039, 1, 1,
0.05286495, -0.9162666, 4.047378, 0, 0.9058824, 1, 1,
0.05319024, -0.8685052, 2.862249, 0, 0.8980392, 1, 1,
0.05390152, -0.4977674, 4.38554, 0, 0.8901961, 1, 1,
0.05958713, 0.5225821, -0.5431003, 0, 0.8862745, 1, 1,
0.06366793, -0.2567768, 2.037846, 0, 0.8784314, 1, 1,
0.06428973, 0.4186505, -2.178525, 0, 0.8745098, 1, 1,
0.06976296, -1.861699, 1.528553, 0, 0.8666667, 1, 1,
0.07004362, 0.09146128, 1.893261, 0, 0.8627451, 1, 1,
0.07133727, 1.365948, 0.8203158, 0, 0.854902, 1, 1,
0.07501434, -0.5693139, 3.744933, 0, 0.8509804, 1, 1,
0.07528941, 2.026536, 0.9381941, 0, 0.8431373, 1, 1,
0.07732112, 1.513692, 0.106606, 0, 0.8392157, 1, 1,
0.08160121, 0.1063849, -0.2229243, 0, 0.8313726, 1, 1,
0.08265243, -0.9891611, 1.05641, 0, 0.827451, 1, 1,
0.0851965, 1.705484, 2.007957, 0, 0.8196079, 1, 1,
0.08631846, 0.80322, -0.4265663, 0, 0.8156863, 1, 1,
0.08991327, 1.978655, -1.154201, 0, 0.8078431, 1, 1,
0.09430901, 0.6670856, -0.7152634, 0, 0.8039216, 1, 1,
0.09518542, 1.909031, -2.541381, 0, 0.7960784, 1, 1,
0.1043561, -0.7660913, 3.007115, 0, 0.7882353, 1, 1,
0.1075295, -0.5123162, 2.78929, 0, 0.7843137, 1, 1,
0.1088401, -0.3684471, 3.237394, 0, 0.7764706, 1, 1,
0.1120352, 0.6016851, -0.5606318, 0, 0.772549, 1, 1,
0.1163451, 0.3698707, 0.2618343, 0, 0.7647059, 1, 1,
0.1183971, -0.8354413, 0.6310073, 0, 0.7607843, 1, 1,
0.1246826, -0.9059792, 2.196486, 0, 0.7529412, 1, 1,
0.1271224, 3.033637, -0.8140476, 0, 0.7490196, 1, 1,
0.1274299, 1.081716, 0.07221004, 0, 0.7411765, 1, 1,
0.1282442, -1.218155, 3.160558, 0, 0.7372549, 1, 1,
0.1288817, 1.606007, 0.994394, 0, 0.7294118, 1, 1,
0.1311506, -1.245697, 2.571609, 0, 0.7254902, 1, 1,
0.1368949, -1.942861, 4.590508, 0, 0.7176471, 1, 1,
0.1384591, 0.204272, 0.8217146, 0, 0.7137255, 1, 1,
0.1410454, -0.4104668, 2.653366, 0, 0.7058824, 1, 1,
0.1423124, -0.442758, 2.685019, 0, 0.6980392, 1, 1,
0.1428122, 2.078727, 0.9477796, 0, 0.6941177, 1, 1,
0.1443734, 0.41052, 2.094678, 0, 0.6862745, 1, 1,
0.1467532, 1.149601, -1.784335, 0, 0.682353, 1, 1,
0.1475409, -1.731222, 3.817162, 0, 0.6745098, 1, 1,
0.1514167, 0.3238868, 0.808503, 0, 0.6705883, 1, 1,
0.1530407, -0.624427, 4.443904, 0, 0.6627451, 1, 1,
0.1534545, 0.2002508, 0.9936305, 0, 0.6588235, 1, 1,
0.1543675, -0.9217455, 4.168146, 0, 0.6509804, 1, 1,
0.1562592, -1.547793, 2.69164, 0, 0.6470588, 1, 1,
0.1572917, -0.9234422, 3.15133, 0, 0.6392157, 1, 1,
0.1587802, -0.616064, 3.222813, 0, 0.6352941, 1, 1,
0.1631545, -1.130345, 1.484586, 0, 0.627451, 1, 1,
0.1656328, 0.2055332, 0.4548677, 0, 0.6235294, 1, 1,
0.1738747, -0.1687249, 1.35289, 0, 0.6156863, 1, 1,
0.178287, -1.992296, 2.106684, 0, 0.6117647, 1, 1,
0.1799869, -0.06312314, 2.032333, 0, 0.6039216, 1, 1,
0.1804529, -0.6488237, 3.966918, 0, 0.5960785, 1, 1,
0.182211, 1.297133, -0.7087124, 0, 0.5921569, 1, 1,
0.1839087, 0.5861599, 1.404759, 0, 0.5843138, 1, 1,
0.184384, 1.517788, -0.6947213, 0, 0.5803922, 1, 1,
0.1940258, -0.9508372, 3.69746, 0, 0.572549, 1, 1,
0.1953016, -0.2364971, 2.218434, 0, 0.5686275, 1, 1,
0.2013855, 0.9871069, 1.691824, 0, 0.5607843, 1, 1,
0.2030917, -1.090334, 3.005005, 0, 0.5568628, 1, 1,
0.2038458, 0.2103348, -2.300048, 0, 0.5490196, 1, 1,
0.2069144, 0.6506107, -0.7255028, 0, 0.5450981, 1, 1,
0.2072567, 0.5538632, -0.2884161, 0, 0.5372549, 1, 1,
0.2082063, -1.286165, 5.606253, 0, 0.5333334, 1, 1,
0.2098861, -1.061424, 1.551459, 0, 0.5254902, 1, 1,
0.2132562, -0.5976606, 3.075538, 0, 0.5215687, 1, 1,
0.214772, 0.5431492, 0.7411202, 0, 0.5137255, 1, 1,
0.2178401, -0.989694, 2.284892, 0, 0.509804, 1, 1,
0.2180301, -1.049737, 3.066085, 0, 0.5019608, 1, 1,
0.2198526, -0.8518698, 2.36845, 0, 0.4941176, 1, 1,
0.2206474, -0.02948281, 3.037812, 0, 0.4901961, 1, 1,
0.2214547, -0.6745522, 4.772205, 0, 0.4823529, 1, 1,
0.2281461, -0.4611191, 2.635199, 0, 0.4784314, 1, 1,
0.2286862, 0.05447917, 1.503429, 0, 0.4705882, 1, 1,
0.2288475, -0.1992577, 3.335415, 0, 0.4666667, 1, 1,
0.23289, -1.178746, 1.286394, 0, 0.4588235, 1, 1,
0.2339316, 0.564566, 1.884401, 0, 0.454902, 1, 1,
0.2361305, 0.7265931, 0.6771188, 0, 0.4470588, 1, 1,
0.2363943, 0.06676482, 1.379377, 0, 0.4431373, 1, 1,
0.2391081, 1.35552, 0.6326225, 0, 0.4352941, 1, 1,
0.2392345, -0.03113314, 2.268038, 0, 0.4313726, 1, 1,
0.2397613, 0.8790493, -0.2452891, 0, 0.4235294, 1, 1,
0.2416877, -0.6365238, 2.595397, 0, 0.4196078, 1, 1,
0.2424414, -1.664764, 3.278436, 0, 0.4117647, 1, 1,
0.2464723, 1.213801, -1.246759, 0, 0.4078431, 1, 1,
0.2501682, -0.4774163, 3.10452, 0, 0.4, 1, 1,
0.250192, -1.790617, 3.612465, 0, 0.3921569, 1, 1,
0.2523032, 0.3801116, 1.374521, 0, 0.3882353, 1, 1,
0.2589023, 0.6885702, -0.09804758, 0, 0.3803922, 1, 1,
0.2640453, -2.591264, 1.64908, 0, 0.3764706, 1, 1,
0.2674262, 1.219696, 0.5427153, 0, 0.3686275, 1, 1,
0.2700588, -0.06541087, 1.458297, 0, 0.3647059, 1, 1,
0.2709789, 2.252742, 1.230868, 0, 0.3568628, 1, 1,
0.2738649, 0.2340258, -0.3070955, 0, 0.3529412, 1, 1,
0.2767754, -0.7935472, 2.623226, 0, 0.345098, 1, 1,
0.2768194, 1.327608, 0.6106614, 0, 0.3411765, 1, 1,
0.2812541, 1.219732, 0.051052, 0, 0.3333333, 1, 1,
0.2841036, -1.033728, 1.498806, 0, 0.3294118, 1, 1,
0.2850364, -1.534529, 3.645079, 0, 0.3215686, 1, 1,
0.2890991, 0.7128216, 0.4090001, 0, 0.3176471, 1, 1,
0.2909108, -1.081113, 3.982325, 0, 0.3098039, 1, 1,
0.2928867, 1.057928, 0.5729048, 0, 0.3058824, 1, 1,
0.2947145, -0.9610468, 4.010906, 0, 0.2980392, 1, 1,
0.2997887, 0.4892563, -0.3345763, 0, 0.2901961, 1, 1,
0.3030089, -0.4716004, 2.577111, 0, 0.2862745, 1, 1,
0.3060865, 0.4248339, 1.400815, 0, 0.2784314, 1, 1,
0.3071924, 0.5120424, 0.1380472, 0, 0.2745098, 1, 1,
0.3072476, 0.4607892, -0.2395833, 0, 0.2666667, 1, 1,
0.310414, -0.9156343, 2.454653, 0, 0.2627451, 1, 1,
0.316446, -0.5218995, 2.808064, 0, 0.254902, 1, 1,
0.3344681, -0.4005361, 3.0323, 0, 0.2509804, 1, 1,
0.3351717, -1.16213, 2.515991, 0, 0.2431373, 1, 1,
0.3355571, 0.007228791, 3.592247, 0, 0.2392157, 1, 1,
0.338107, 0.1992205, 0.9059075, 0, 0.2313726, 1, 1,
0.3388302, -1.40138, 5.498735, 0, 0.227451, 1, 1,
0.3410176, -0.6062043, 3.906878, 0, 0.2196078, 1, 1,
0.3453477, -1.548237, 1.487334, 0, 0.2156863, 1, 1,
0.3475451, 1.087623, -1.561378, 0, 0.2078431, 1, 1,
0.3487941, -1.551606, 4.632419, 0, 0.2039216, 1, 1,
0.3490894, -1.520766, 3.087136, 0, 0.1960784, 1, 1,
0.3518265, 0.7324551, 0.18062, 0, 0.1882353, 1, 1,
0.3572902, -0.2702864, 1.639415, 0, 0.1843137, 1, 1,
0.3595712, 0.9265525, 1.13863, 0, 0.1764706, 1, 1,
0.3655267, 0.7076281, -0.1184119, 0, 0.172549, 1, 1,
0.366713, -1.321509, 4.637009, 0, 0.1647059, 1, 1,
0.3745055, -0.4088056, 1.551457, 0, 0.1607843, 1, 1,
0.3762344, -0.5312574, 2.008993, 0, 0.1529412, 1, 1,
0.3782239, 0.1078431, 1.927886, 0, 0.1490196, 1, 1,
0.3796053, -0.09809477, 0.870419, 0, 0.1411765, 1, 1,
0.3812733, -0.3451606, 2.905574, 0, 0.1372549, 1, 1,
0.3824247, 0.3882911, 0.471849, 0, 0.1294118, 1, 1,
0.3903307, -0.7902492, 4.438643, 0, 0.1254902, 1, 1,
0.3975733, -2.267744, 2.624383, 0, 0.1176471, 1, 1,
0.3979465, -0.1652991, 0.5192018, 0, 0.1137255, 1, 1,
0.3988072, 0.02703871, 0.3924436, 0, 0.1058824, 1, 1,
0.4016082, -0.7220141, 2.841158, 0, 0.09803922, 1, 1,
0.4016912, -0.9918602, 3.483853, 0, 0.09411765, 1, 1,
0.4017541, -0.7921875, 0.2331592, 0, 0.08627451, 1, 1,
0.4047592, -1.762328, 2.638515, 0, 0.08235294, 1, 1,
0.4080282, -0.5766652, 2.458584, 0, 0.07450981, 1, 1,
0.4083574, -0.3994328, 1.905155, 0, 0.07058824, 1, 1,
0.4091149, 1.332999, 0.02450783, 0, 0.0627451, 1, 1,
0.4095807, 1.687842, 0.2625528, 0, 0.05882353, 1, 1,
0.4113892, 0.2555116, 0.6481243, 0, 0.05098039, 1, 1,
0.4180236, -0.3605101, 1.738156, 0, 0.04705882, 1, 1,
0.4215694, -0.3351862, 2.302518, 0, 0.03921569, 1, 1,
0.4234761, 0.2196204, 0.315422, 0, 0.03529412, 1, 1,
0.427736, 1.274847, -0.8882354, 0, 0.02745098, 1, 1,
0.4303483, -0.4339317, 2.445381, 0, 0.02352941, 1, 1,
0.439837, -0.2517499, 1.497406, 0, 0.01568628, 1, 1,
0.4402898, -1.187639, 3.173139, 0, 0.01176471, 1, 1,
0.442828, -1.674034, 3.42401, 0, 0.003921569, 1, 1,
0.4487191, -1.235756, 2.536091, 0.003921569, 0, 1, 1,
0.4511827, 0.5907344, 0.3763677, 0.007843138, 0, 1, 1,
0.4517653, -0.398978, 3.311217, 0.01568628, 0, 1, 1,
0.4520279, -0.3179945, 0.2330018, 0.01960784, 0, 1, 1,
0.4535545, -0.3591156, 1.994161, 0.02745098, 0, 1, 1,
0.4542772, 0.9471427, 1.15091, 0.03137255, 0, 1, 1,
0.4542908, -0.2899987, 2.772691, 0.03921569, 0, 1, 1,
0.4547964, -0.4376855, 3.161297, 0.04313726, 0, 1, 1,
0.4550284, 0.34001, 1.872224, 0.05098039, 0, 1, 1,
0.4560193, 0.116036, -0.3023461, 0.05490196, 0, 1, 1,
0.4564991, -0.337241, 3.050763, 0.0627451, 0, 1, 1,
0.4633403, 0.3359278, 1.252931, 0.06666667, 0, 1, 1,
0.4656629, 1.558043, 0.9282385, 0.07450981, 0, 1, 1,
0.4661487, 1.253251, -0.7917605, 0.07843138, 0, 1, 1,
0.4661507, -1.004197, 2.747631, 0.08627451, 0, 1, 1,
0.4670096, -0.7649233, 3.007293, 0.09019608, 0, 1, 1,
0.4671243, 1.387915, 0.8344682, 0.09803922, 0, 1, 1,
0.4673696, -1.806862, 1.502807, 0.1058824, 0, 1, 1,
0.4894675, -0.6328685, 3.295854, 0.1098039, 0, 1, 1,
0.4902088, 1.007369, 2.066012, 0.1176471, 0, 1, 1,
0.4955601, 0.3547652, 2.119581, 0.1215686, 0, 1, 1,
0.4960374, 1.018701, 0.8839641, 0.1294118, 0, 1, 1,
0.4986929, -1.563953, 1.638934, 0.1333333, 0, 1, 1,
0.502962, 1.437626, -1.215798, 0.1411765, 0, 1, 1,
0.5044167, 0.08992281, 1.430143, 0.145098, 0, 1, 1,
0.5120329, 0.1475239, 0.1427184, 0.1529412, 0, 1, 1,
0.5138732, 0.6227782, 0.8729735, 0.1568628, 0, 1, 1,
0.5210934, -0.8440453, 2.727546, 0.1647059, 0, 1, 1,
0.5242667, -0.6678705, 1.587197, 0.1686275, 0, 1, 1,
0.5368437, 1.338682, 1.682045, 0.1764706, 0, 1, 1,
0.5395155, 0.9289035, -1.096164, 0.1803922, 0, 1, 1,
0.5402033, 0.05924126, 3.420308, 0.1882353, 0, 1, 1,
0.5434678, 1.090281, 1.203584, 0.1921569, 0, 1, 1,
0.5440156, -1.835226, 2.693862, 0.2, 0, 1, 1,
0.5463628, -0.6424805, 2.780481, 0.2078431, 0, 1, 1,
0.5474247, -1.746974, 2.388187, 0.2117647, 0, 1, 1,
0.5491804, 0.4559544, -0.1464695, 0.2196078, 0, 1, 1,
0.5519335, -1.559644, 2.352758, 0.2235294, 0, 1, 1,
0.552538, 0.3319289, 0.3715162, 0.2313726, 0, 1, 1,
0.5540109, -0.9293061, 1.77519, 0.2352941, 0, 1, 1,
0.5548817, 0.9591382, 1.705405, 0.2431373, 0, 1, 1,
0.5618455, -0.1298899, 0.9088834, 0.2470588, 0, 1, 1,
0.5658489, 0.4649792, 0.395029, 0.254902, 0, 1, 1,
0.5701647, -1.060195, 2.660654, 0.2588235, 0, 1, 1,
0.5705176, -1.051618, 1.95425, 0.2666667, 0, 1, 1,
0.5711189, 0.6944421, 2.74486, 0.2705882, 0, 1, 1,
0.5726238, 0.264903, -0.1698888, 0.2784314, 0, 1, 1,
0.5744264, 0.1674124, 1.180278, 0.282353, 0, 1, 1,
0.576028, -0.6893238, 2.12513, 0.2901961, 0, 1, 1,
0.577684, 0.6541664, 1.50365, 0.2941177, 0, 1, 1,
0.5818089, 0.1140007, 3.605965, 0.3019608, 0, 1, 1,
0.5837415, 1.084424, 0.5381597, 0.3098039, 0, 1, 1,
0.5863109, 0.9588163, 0.1067332, 0.3137255, 0, 1, 1,
0.5888638, -0.9654464, 0.7780358, 0.3215686, 0, 1, 1,
0.5904611, 0.726028, 1.724483, 0.3254902, 0, 1, 1,
0.5942193, -0.2301276, 2.040776, 0.3333333, 0, 1, 1,
0.5999096, 0.07848604, 1.48511, 0.3372549, 0, 1, 1,
0.6046766, 1.117477, -0.4199684, 0.345098, 0, 1, 1,
0.6056273, 2.274343, 0.57516, 0.3490196, 0, 1, 1,
0.6067513, 0.02632569, 1.158456, 0.3568628, 0, 1, 1,
0.6086993, -1.170046, 4.408783, 0.3607843, 0, 1, 1,
0.6215308, -0.9852021, 4.460133, 0.3686275, 0, 1, 1,
0.623882, 0.39577, 0.1740154, 0.372549, 0, 1, 1,
0.6298941, 0.4317302, -1.348633, 0.3803922, 0, 1, 1,
0.6342137, -0.07363001, 3.356447, 0.3843137, 0, 1, 1,
0.6416712, 1.421302, -0.02433129, 0.3921569, 0, 1, 1,
0.6423952, -0.7485112, 2.756826, 0.3960784, 0, 1, 1,
0.6620075, -0.5707294, 1.637455, 0.4039216, 0, 1, 1,
0.66222, -0.02006939, 1.395371, 0.4117647, 0, 1, 1,
0.6644188, 2.028485, -0.0738796, 0.4156863, 0, 1, 1,
0.666398, -0.007059808, 1.388627, 0.4235294, 0, 1, 1,
0.6671391, 0.7360551, 1.805419, 0.427451, 0, 1, 1,
0.6677769, -0.5652776, 2.750489, 0.4352941, 0, 1, 1,
0.6692693, 0.9425958, 0.1729651, 0.4392157, 0, 1, 1,
0.6714427, 1.553904, -0.1185097, 0.4470588, 0, 1, 1,
0.6748706, -1.42469, 3.890347, 0.4509804, 0, 1, 1,
0.6763649, -1.01189, 1.776647, 0.4588235, 0, 1, 1,
0.6764202, -0.7973083, 3.823851, 0.4627451, 0, 1, 1,
0.6778811, 0.1301754, -0.4258226, 0.4705882, 0, 1, 1,
0.6798064, -1.087974, 4.214868, 0.4745098, 0, 1, 1,
0.6826792, -0.4624289, 0.6143563, 0.4823529, 0, 1, 1,
0.6834422, 0.6625777, 1.573678, 0.4862745, 0, 1, 1,
0.6842312, -0.3348933, 1.949706, 0.4941176, 0, 1, 1,
0.6853857, -0.874298, 3.980603, 0.5019608, 0, 1, 1,
0.6865539, -0.7524256, 2.121887, 0.5058824, 0, 1, 1,
0.6935618, -0.5577834, 2.584387, 0.5137255, 0, 1, 1,
0.6971544, -0.9338405, 1.436394, 0.5176471, 0, 1, 1,
0.697175, -0.4565197, 2.783786, 0.5254902, 0, 1, 1,
0.7024952, -0.5180485, 0.8523212, 0.5294118, 0, 1, 1,
0.7043087, 1.359212, 1.534145, 0.5372549, 0, 1, 1,
0.7129932, 0.9193623, -0.314707, 0.5411765, 0, 1, 1,
0.7152369, -1.208655, 2.229648, 0.5490196, 0, 1, 1,
0.7155321, 0.6259519, -0.9437634, 0.5529412, 0, 1, 1,
0.7167389, -0.9977882, 1.508667, 0.5607843, 0, 1, 1,
0.732717, -0.505686, 1.661122, 0.5647059, 0, 1, 1,
0.7352188, -1.848079, 2.749915, 0.572549, 0, 1, 1,
0.7365872, -0.5706786, 1.312309, 0.5764706, 0, 1, 1,
0.7399757, 2.306303, 2.28028, 0.5843138, 0, 1, 1,
0.7429937, -0.6137623, 2.687804, 0.5882353, 0, 1, 1,
0.745245, -0.07089014, 1.868362, 0.5960785, 0, 1, 1,
0.7499629, -0.4162545, 2.309908, 0.6039216, 0, 1, 1,
0.7506617, 0.4308592, 0.4675961, 0.6078432, 0, 1, 1,
0.7509213, -0.09578581, 3.258767, 0.6156863, 0, 1, 1,
0.7510725, 0.3158982, 1.677951, 0.6196079, 0, 1, 1,
0.751543, 1.579075, 0.6278866, 0.627451, 0, 1, 1,
0.7521594, -0.05156868, 1.93715, 0.6313726, 0, 1, 1,
0.7621302, 1.802337, -0.1317208, 0.6392157, 0, 1, 1,
0.7635722, 0.3828471, 1.311589, 0.6431373, 0, 1, 1,
0.7680069, 0.6917466, 0.6478041, 0.6509804, 0, 1, 1,
0.7689748, 0.1283393, 2.505521, 0.654902, 0, 1, 1,
0.7748682, -0.1076657, 3.141262, 0.6627451, 0, 1, 1,
0.7769468, -0.2303864, 1.096248, 0.6666667, 0, 1, 1,
0.7842496, 1.072749, 0.6012527, 0.6745098, 0, 1, 1,
0.785928, 0.247213, 1.796059, 0.6784314, 0, 1, 1,
0.7874453, 0.1443361, 0.3856522, 0.6862745, 0, 1, 1,
0.7876295, -1.028554, 3.457469, 0.6901961, 0, 1, 1,
0.7904382, 0.8518423, 0.433149, 0.6980392, 0, 1, 1,
0.8010976, 0.434416, 0.151177, 0.7058824, 0, 1, 1,
0.8014448, -0.3390155, 1.63466, 0.7098039, 0, 1, 1,
0.8028919, -1.754295, 3.1263, 0.7176471, 0, 1, 1,
0.807497, 0.4001588, 1.416161, 0.7215686, 0, 1, 1,
0.8077649, 1.935948, 0.160189, 0.7294118, 0, 1, 1,
0.8082699, -1.110674, 2.170819, 0.7333333, 0, 1, 1,
0.8147662, 1.38444, -0.3449703, 0.7411765, 0, 1, 1,
0.8158094, 0.3082691, 1.521973, 0.7450981, 0, 1, 1,
0.8160107, -0.696312, 2.23507, 0.7529412, 0, 1, 1,
0.8208893, -0.4959547, 1.98743, 0.7568628, 0, 1, 1,
0.8294142, 0.4278463, 1.32057, 0.7647059, 0, 1, 1,
0.831875, -0.2226597, 1.364953, 0.7686275, 0, 1, 1,
0.8340926, -2.051049, 3.088493, 0.7764706, 0, 1, 1,
0.8371695, 1.613537, 1.22684, 0.7803922, 0, 1, 1,
0.8389881, 0.03104487, 1.250424, 0.7882353, 0, 1, 1,
0.8408262, -0.4953835, 2.121581, 0.7921569, 0, 1, 1,
0.8476726, -0.9445556, 4.848298, 0.8, 0, 1, 1,
0.8481411, 0.2183921, 1.018701, 0.8078431, 0, 1, 1,
0.8489105, 0.7629065, -0.467663, 0.8117647, 0, 1, 1,
0.849242, -0.577576, 2.817316, 0.8196079, 0, 1, 1,
0.8515708, 1.706298, 0.126124, 0.8235294, 0, 1, 1,
0.8568552, -0.01561897, 0.9062366, 0.8313726, 0, 1, 1,
0.8631515, -0.2317092, 3.035152, 0.8352941, 0, 1, 1,
0.8691049, 0.8449603, 0.7932612, 0.8431373, 0, 1, 1,
0.8701692, 0.4890977, 1.088557, 0.8470588, 0, 1, 1,
0.8721498, -0.4525582, 1.401446, 0.854902, 0, 1, 1,
0.8724453, 0.601202, 0.8643506, 0.8588235, 0, 1, 1,
0.8737804, -0.5487299, 1.325755, 0.8666667, 0, 1, 1,
0.8786025, 0.9162776, -0.2962567, 0.8705882, 0, 1, 1,
0.8810669, -0.685119, 0.3128417, 0.8784314, 0, 1, 1,
0.8863255, 0.2254686, 0.9320267, 0.8823529, 0, 1, 1,
0.8876516, -0.3237206, 1.56039, 0.8901961, 0, 1, 1,
0.8899755, 1.782376, 2.780552, 0.8941177, 0, 1, 1,
0.8901596, 0.6811336, 0.3552917, 0.9019608, 0, 1, 1,
0.8979684, -0.7313403, 2.298398, 0.9098039, 0, 1, 1,
0.8989043, 0.9335193, 1.096428, 0.9137255, 0, 1, 1,
0.908842, 0.9255596, -0.6676922, 0.9215686, 0, 1, 1,
0.9145696, -0.9211915, 0.6888052, 0.9254902, 0, 1, 1,
0.927218, -0.9478493, 1.831971, 0.9333333, 0, 1, 1,
0.9301848, 1.090798, 0.1869335, 0.9372549, 0, 1, 1,
0.9305924, -0.2008799, 1.543383, 0.945098, 0, 1, 1,
0.9343651, -0.6628241, 3.282126, 0.9490196, 0, 1, 1,
0.9399088, -0.3838118, 3.80772, 0.9568627, 0, 1, 1,
0.9448578, -0.172191, 0.3737526, 0.9607843, 0, 1, 1,
0.9488598, 0.4986327, 0.9591542, 0.9686275, 0, 1, 1,
0.9615158, 1.174087, 2.906399, 0.972549, 0, 1, 1,
0.9667017, -0.4130646, 1.963379, 0.9803922, 0, 1, 1,
0.9693331, 0.1951652, 0.790531, 0.9843137, 0, 1, 1,
0.9701447, -0.9440298, 2.421605, 0.9921569, 0, 1, 1,
0.9720731, 0.473958, -0.1061031, 0.9960784, 0, 1, 1,
0.9909708, 0.009539081, 1.298956, 1, 0, 0.9960784, 1,
0.9920532, -0.7199754, 1.339982, 1, 0, 0.9882353, 1,
0.9932604, 1.560915, 1.915251, 1, 0, 0.9843137, 1,
0.9943621, 0.5570776, 2.056929, 1, 0, 0.9764706, 1,
0.9953167, -2.081187, 3.135933, 1, 0, 0.972549, 1,
0.9970189, 0.1672869, 1.071318, 1, 0, 0.9647059, 1,
0.9997979, 0.3549682, 0.7970737, 1, 0, 0.9607843, 1,
1.001315, -0.7994438, 3.952246, 1, 0, 0.9529412, 1,
1.005226, 0.6806916, 1.559945, 1, 0, 0.9490196, 1,
1.01014, 0.2478927, 0.2314305, 1, 0, 0.9411765, 1,
1.01053, -1.457336, 3.964742, 1, 0, 0.9372549, 1,
1.010799, -1.454368, 1.249869, 1, 0, 0.9294118, 1,
1.014854, 0.1523585, 2.510157, 1, 0, 0.9254902, 1,
1.020226, -0.3747551, 1.714872, 1, 0, 0.9176471, 1,
1.032073, 1.072993, 1.731348, 1, 0, 0.9137255, 1,
1.032864, -2.349697, 2.399948, 1, 0, 0.9058824, 1,
1.033146, 0.2897099, 0.7594171, 1, 0, 0.9019608, 1,
1.033447, 0.6790574, -1.638426, 1, 0, 0.8941177, 1,
1.033722, -1.080582, 0.914521, 1, 0, 0.8862745, 1,
1.037166, 0.06278821, 0.7181408, 1, 0, 0.8823529, 1,
1.048183, -0.2907474, 1.367001, 1, 0, 0.8745098, 1,
1.048747, -0.1486274, 1.862736, 1, 0, 0.8705882, 1,
1.048959, -0.9362281, 3.042074, 1, 0, 0.8627451, 1,
1.059246, -0.5459248, 1.867618, 1, 0, 0.8588235, 1,
1.061175, 1.442246, 2.213082, 1, 0, 0.8509804, 1,
1.069667, -0.94239, 0.5727082, 1, 0, 0.8470588, 1,
1.074449, -0.07098593, 1.197714, 1, 0, 0.8392157, 1,
1.078344, -1.241064, 2.851527, 1, 0, 0.8352941, 1,
1.08452, 1.504456, -1.526782, 1, 0, 0.827451, 1,
1.085659, 0.2703516, 2.58689, 1, 0, 0.8235294, 1,
1.092436, 1.448578, 2.506593, 1, 0, 0.8156863, 1,
1.092762, 0.2603276, 2.361453, 1, 0, 0.8117647, 1,
1.093228, 2.429372, -1.072147, 1, 0, 0.8039216, 1,
1.096156, 0.5504724, 0.5793523, 1, 0, 0.7960784, 1,
1.104102, -0.4813138, 3.026192, 1, 0, 0.7921569, 1,
1.108953, 1.321897, 1.860165, 1, 0, 0.7843137, 1,
1.114103, -0.6684916, 3.702904, 1, 0, 0.7803922, 1,
1.114282, -0.9879199, 3.665691, 1, 0, 0.772549, 1,
1.116137, -0.4835807, 2.810079, 1, 0, 0.7686275, 1,
1.116377, 1.494393, 0.4777185, 1, 0, 0.7607843, 1,
1.128364, 0.8094082, 2.403471, 1, 0, 0.7568628, 1,
1.141711, -0.9956704, 2.92241, 1, 0, 0.7490196, 1,
1.144802, -0.06932557, 1.583102, 1, 0, 0.7450981, 1,
1.154107, -0.5864513, 4.30776, 1, 0, 0.7372549, 1,
1.16244, 1.36089, -1.295562, 1, 0, 0.7333333, 1,
1.168429, 1.130877, 2.874797, 1, 0, 0.7254902, 1,
1.171128, -0.5627396, 2.237721, 1, 0, 0.7215686, 1,
1.179253, 0.3234102, 2.467399, 1, 0, 0.7137255, 1,
1.180692, 0.9840319, 2.390723, 1, 0, 0.7098039, 1,
1.186102, -0.4257996, 2.53764, 1, 0, 0.7019608, 1,
1.189793, -0.5872812, 2.068907, 1, 0, 0.6941177, 1,
1.19599, -0.8773178, 3.790633, 1, 0, 0.6901961, 1,
1.201052, -0.09563613, 0.5582765, 1, 0, 0.682353, 1,
1.203872, -1.297302, 1.800619, 1, 0, 0.6784314, 1,
1.206736, 0.02227405, 2.607625, 1, 0, 0.6705883, 1,
1.213261, -0.1360667, 1.061226, 1, 0, 0.6666667, 1,
1.215809, 1.097829, 0.6829465, 1, 0, 0.6588235, 1,
1.216168, 0.7078907, 0.05058985, 1, 0, 0.654902, 1,
1.233095, 0.4781077, 1.006832, 1, 0, 0.6470588, 1,
1.234491, 0.7620671, -0.1145162, 1, 0, 0.6431373, 1,
1.237079, 0.2380517, -0.1738798, 1, 0, 0.6352941, 1,
1.241435, 1.067199, 1.327406, 1, 0, 0.6313726, 1,
1.24442, -1.350741, 3.615011, 1, 0, 0.6235294, 1,
1.244525, 1.468128, 0.2877426, 1, 0, 0.6196079, 1,
1.259957, -0.2725612, 1.862286, 1, 0, 0.6117647, 1,
1.268303, 0.5839835, 0.8231217, 1, 0, 0.6078432, 1,
1.273564, -1.312382, 2.99347, 1, 0, 0.6, 1,
1.278354, -0.1171472, 2.090163, 1, 0, 0.5921569, 1,
1.288562, -0.8725722, 3.008204, 1, 0, 0.5882353, 1,
1.290964, -0.721557, 1.099062, 1, 0, 0.5803922, 1,
1.294135, 2.014558, 1.949033, 1, 0, 0.5764706, 1,
1.301944, -0.641655, 2.061212, 1, 0, 0.5686275, 1,
1.307782, 0.2319804, 2.367084, 1, 0, 0.5647059, 1,
1.308292, 0.6083407, -0.8836643, 1, 0, 0.5568628, 1,
1.309285, 0.5247643, -0.1918926, 1, 0, 0.5529412, 1,
1.313824, 0.0120571, 1.096156, 1, 0, 0.5450981, 1,
1.314397, -0.1786347, 1.055454, 1, 0, 0.5411765, 1,
1.318682, -0.1305996, 0.7391031, 1, 0, 0.5333334, 1,
1.333895, -0.3434504, 1.670801, 1, 0, 0.5294118, 1,
1.341429, 0.5448582, 2.215118, 1, 0, 0.5215687, 1,
1.356539, -0.174467, 0.9837183, 1, 0, 0.5176471, 1,
1.366773, -0.6562138, 1.29833, 1, 0, 0.509804, 1,
1.373692, -0.5919164, -0.572644, 1, 0, 0.5058824, 1,
1.374658, -0.3541342, 0.5642919, 1, 0, 0.4980392, 1,
1.381645, -1.516455, 1.710975, 1, 0, 0.4901961, 1,
1.384471, 1.318015, 0.6003787, 1, 0, 0.4862745, 1,
1.385858, 1.378116, 0.7148468, 1, 0, 0.4784314, 1,
1.390525, 0.7186372, -0.7227802, 1, 0, 0.4745098, 1,
1.392612, 0.1886069, 0.4275462, 1, 0, 0.4666667, 1,
1.396313, -2.721995, 1.886067, 1, 0, 0.4627451, 1,
1.411012, -0.3584242, 0.4200796, 1, 0, 0.454902, 1,
1.414192, -0.2075846, 1.273405, 1, 0, 0.4509804, 1,
1.418145, -0.8244357, 1.792425, 1, 0, 0.4431373, 1,
1.423328, 0.3798514, 1.93706, 1, 0, 0.4392157, 1,
1.42684, 2.597122, 0.3259003, 1, 0, 0.4313726, 1,
1.429722, 1.379756, -1.017125, 1, 0, 0.427451, 1,
1.435919, 1.252466, -0.8667143, 1, 0, 0.4196078, 1,
1.442949, 1.320899, 0.5512987, 1, 0, 0.4156863, 1,
1.443344, -0.7558386, 2.331711, 1, 0, 0.4078431, 1,
1.448168, -0.2214941, 1.660058, 1, 0, 0.4039216, 1,
1.453355, 0.7272168, 1.351858, 1, 0, 0.3960784, 1,
1.467768, 0.1042764, 0.6554745, 1, 0, 0.3882353, 1,
1.485113, -0.6850801, 0.371019, 1, 0, 0.3843137, 1,
1.486326, 0.2812519, 1.782582, 1, 0, 0.3764706, 1,
1.492453, -0.06251682, 0.9001022, 1, 0, 0.372549, 1,
1.497302, -1.663193, 2.245333, 1, 0, 0.3647059, 1,
1.507495, -1.497032, 1.405777, 1, 0, 0.3607843, 1,
1.510204, -0.1879044, 1.597704, 1, 0, 0.3529412, 1,
1.527901, 0.1078778, 3.081023, 1, 0, 0.3490196, 1,
1.54013, -0.4057491, 1.462753, 1, 0, 0.3411765, 1,
1.54586, -0.8050917, 0.6465631, 1, 0, 0.3372549, 1,
1.558299, 0.0791247, 1.655531, 1, 0, 0.3294118, 1,
1.570873, 1.227411, 0.4524278, 1, 0, 0.3254902, 1,
1.581125, -0.4490575, 0.4722517, 1, 0, 0.3176471, 1,
1.588195, 1.230447, 2.131797, 1, 0, 0.3137255, 1,
1.614707, -1.281549, 1.642023, 1, 0, 0.3058824, 1,
1.614873, 0.05850323, 1.574946, 1, 0, 0.2980392, 1,
1.622084, 0.5483962, 1.81468, 1, 0, 0.2941177, 1,
1.638622, 0.4205273, -0.3273596, 1, 0, 0.2862745, 1,
1.645789, 0.6038772, 1.185873, 1, 0, 0.282353, 1,
1.653909, -0.222197, 1.733248, 1, 0, 0.2745098, 1,
1.668379, -0.4807187, 2.714211, 1, 0, 0.2705882, 1,
1.675656, 0.4783754, 1.064123, 1, 0, 0.2627451, 1,
1.675907, -0.4532911, -0.004621368, 1, 0, 0.2588235, 1,
1.687288, 0.9136601, 3.073203, 1, 0, 0.2509804, 1,
1.70313, 0.1550381, 1.423388, 1, 0, 0.2470588, 1,
1.707968, -0.02142096, 0.7882551, 1, 0, 0.2392157, 1,
1.708096, -0.5072808, 0.9909886, 1, 0, 0.2352941, 1,
1.714547, 1.192955, 2.536888, 1, 0, 0.227451, 1,
1.729446, 0.8025929, 0.7350814, 1, 0, 0.2235294, 1,
1.733573, -0.3863791, 1.975756, 1, 0, 0.2156863, 1,
1.736204, 1.27171, 1.156054, 1, 0, 0.2117647, 1,
1.741498, 0.08814804, 2.607433, 1, 0, 0.2039216, 1,
1.741565, -0.2678165, 2.194928, 1, 0, 0.1960784, 1,
1.743301, 0.06460104, 1.067119, 1, 0, 0.1921569, 1,
1.756788, 0.3082762, 1.240025, 1, 0, 0.1843137, 1,
1.765474, -0.1408545, 2.599748, 1, 0, 0.1803922, 1,
1.789783, 0.2836334, 2.776453, 1, 0, 0.172549, 1,
1.799813, -0.2529788, 0.2660768, 1, 0, 0.1686275, 1,
1.811492, 0.4887586, 1.295418, 1, 0, 0.1607843, 1,
1.836027, 0.1047027, 1.559469, 1, 0, 0.1568628, 1,
1.858284, 0.7695999, 0.9203503, 1, 0, 0.1490196, 1,
1.872088, 2.549403, 0.5212207, 1, 0, 0.145098, 1,
1.883682, 1.181302, -0.2459685, 1, 0, 0.1372549, 1,
1.906649, -0.5278892, 2.128646, 1, 0, 0.1333333, 1,
1.916703, -0.6868969, 3.10632, 1, 0, 0.1254902, 1,
1.933201, -0.2237325, 1.794051, 1, 0, 0.1215686, 1,
1.949606, 0.1350392, 1.845861, 1, 0, 0.1137255, 1,
1.953565, 1.593773, 1.549499, 1, 0, 0.1098039, 1,
1.999298, -0.6153085, 0.4019754, 1, 0, 0.1019608, 1,
2.144659, -0.256213, 1.89215, 1, 0, 0.09411765, 1,
2.181927, -0.2254137, 0.2914774, 1, 0, 0.09019608, 1,
2.193419, 1.063548, 1.410412, 1, 0, 0.08235294, 1,
2.199028, 1.083335, 0.7643203, 1, 0, 0.07843138, 1,
2.214104, 0.3380156, 2.06313, 1, 0, 0.07058824, 1,
2.228917, -0.2598326, 1.189667, 1, 0, 0.06666667, 1,
2.274527, -1.44715, 1.74982, 1, 0, 0.05882353, 1,
2.478245, 0.6274797, 2.915869, 1, 0, 0.05490196, 1,
2.520132, -1.735417, 1.906655, 1, 0, 0.04705882, 1,
2.542507, 0.4897359, -0.2190024, 1, 0, 0.04313726, 1,
2.571075, -0.1204488, 0.7253407, 1, 0, 0.03529412, 1,
2.724998, 1.765473, 1.755092, 1, 0, 0.03137255, 1,
2.979953, 0.1368216, 0.6239045, 1, 0, 0.02352941, 1,
2.99099, -0.06187269, 0.7056661, 1, 0, 0.01960784, 1,
3.003336, 0.5490033, 1.654008, 1, 0, 0.01176471, 1,
3.012424, -1.600863, 2.386955, 1, 0, 0.007843138, 1
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
-0.03379714, -4.5405, -7.188231, 0, -0.5, 0.5, 0.5,
-0.03379714, -4.5405, -7.188231, 1, -0.5, 0.5, 0.5,
-0.03379714, -4.5405, -7.188231, 1, 1.5, 0.5, 0.5,
-0.03379714, -4.5405, -7.188231, 0, 1.5, 0.5, 0.5
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
-4.112688, 0.0634197, -7.188231, 0, -0.5, 0.5, 0.5,
-4.112688, 0.0634197, -7.188231, 1, -0.5, 0.5, 0.5,
-4.112688, 0.0634197, -7.188231, 1, 1.5, 0.5, 0.5,
-4.112688, 0.0634197, -7.188231, 0, 1.5, 0.5, 0.5
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
-4.112688, -4.5405, 0.1361871, 0, -0.5, 0.5, 0.5,
-4.112688, -4.5405, 0.1361871, 1, -0.5, 0.5, 0.5,
-4.112688, -4.5405, 0.1361871, 1, 1.5, 0.5, 0.5,
-4.112688, -4.5405, 0.1361871, 0, 1.5, 0.5, 0.5
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
-3, -3.478057, -5.497981,
3, -3.478057, -5.497981,
-3, -3.478057, -5.497981,
-3, -3.65513, -5.779689,
-2, -3.478057, -5.497981,
-2, -3.65513, -5.779689,
-1, -3.478057, -5.497981,
-1, -3.65513, -5.779689,
0, -3.478057, -5.497981,
0, -3.65513, -5.779689,
1, -3.478057, -5.497981,
1, -3.65513, -5.779689,
2, -3.478057, -5.497981,
2, -3.65513, -5.779689,
3, -3.478057, -5.497981,
3, -3.65513, -5.779689
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
-3, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
-3, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
-3, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
-3, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5,
-2, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
-2, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
-2, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
-2, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5,
-1, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
-1, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
-1, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
-1, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5,
0, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
0, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
0, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
0, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5,
1, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
1, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
1, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
1, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5,
2, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
2, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
2, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
2, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5,
3, -4.009278, -6.343106, 0, -0.5, 0.5, 0.5,
3, -4.009278, -6.343106, 1, -0.5, 0.5, 0.5,
3, -4.009278, -6.343106, 1, 1.5, 0.5, 0.5,
3, -4.009278, -6.343106, 0, 1.5, 0.5, 0.5
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
-3.171405, -3, -5.497981,
-3.171405, 3, -5.497981,
-3.171405, -3, -5.497981,
-3.328285, -3, -5.779689,
-3.171405, -2, -5.497981,
-3.328285, -2, -5.779689,
-3.171405, -1, -5.497981,
-3.328285, -1, -5.779689,
-3.171405, 0, -5.497981,
-3.328285, 0, -5.779689,
-3.171405, 1, -5.497981,
-3.328285, 1, -5.779689,
-3.171405, 2, -5.497981,
-3.328285, 2, -5.779689,
-3.171405, 3, -5.497981,
-3.328285, 3, -5.779689
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
-3.642046, -3, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, -3, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, -3, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, -3, -6.343106, 0, 1.5, 0.5, 0.5,
-3.642046, -2, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, -2, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, -2, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, -2, -6.343106, 0, 1.5, 0.5, 0.5,
-3.642046, -1, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, -1, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, -1, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, -1, -6.343106, 0, 1.5, 0.5, 0.5,
-3.642046, 0, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, 0, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, 0, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, 0, -6.343106, 0, 1.5, 0.5, 0.5,
-3.642046, 1, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, 1, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, 1, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, 1, -6.343106, 0, 1.5, 0.5, 0.5,
-3.642046, 2, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, 2, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, 2, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, 2, -6.343106, 0, 1.5, 0.5, 0.5,
-3.642046, 3, -6.343106, 0, -0.5, 0.5, 0.5,
-3.642046, 3, -6.343106, 1, -0.5, 0.5, 0.5,
-3.642046, 3, -6.343106, 1, 1.5, 0.5, 0.5,
-3.642046, 3, -6.343106, 0, 1.5, 0.5, 0.5
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
-3.171405, -3.478057, -4,
-3.171405, -3.478057, 4,
-3.171405, -3.478057, -4,
-3.328285, -3.65513, -4,
-3.171405, -3.478057, -2,
-3.328285, -3.65513, -2,
-3.171405, -3.478057, 0,
-3.328285, -3.65513, 0,
-3.171405, -3.478057, 2,
-3.328285, -3.65513, 2,
-3.171405, -3.478057, 4,
-3.328285, -3.65513, 4
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
-3.642046, -4.009278, -4, 0, -0.5, 0.5, 0.5,
-3.642046, -4.009278, -4, 1, -0.5, 0.5, 0.5,
-3.642046, -4.009278, -4, 1, 1.5, 0.5, 0.5,
-3.642046, -4.009278, -4, 0, 1.5, 0.5, 0.5,
-3.642046, -4.009278, -2, 0, -0.5, 0.5, 0.5,
-3.642046, -4.009278, -2, 1, -0.5, 0.5, 0.5,
-3.642046, -4.009278, -2, 1, 1.5, 0.5, 0.5,
-3.642046, -4.009278, -2, 0, 1.5, 0.5, 0.5,
-3.642046, -4.009278, 0, 0, -0.5, 0.5, 0.5,
-3.642046, -4.009278, 0, 1, -0.5, 0.5, 0.5,
-3.642046, -4.009278, 0, 1, 1.5, 0.5, 0.5,
-3.642046, -4.009278, 0, 0, 1.5, 0.5, 0.5,
-3.642046, -4.009278, 2, 0, -0.5, 0.5, 0.5,
-3.642046, -4.009278, 2, 1, -0.5, 0.5, 0.5,
-3.642046, -4.009278, 2, 1, 1.5, 0.5, 0.5,
-3.642046, -4.009278, 2, 0, 1.5, 0.5, 0.5,
-3.642046, -4.009278, 4, 0, -0.5, 0.5, 0.5,
-3.642046, -4.009278, 4, 1, -0.5, 0.5, 0.5,
-3.642046, -4.009278, 4, 1, 1.5, 0.5, 0.5,
-3.642046, -4.009278, 4, 0, 1.5, 0.5, 0.5
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
-3.171405, -3.478057, -5.497981,
-3.171405, 3.604896, -5.497981,
-3.171405, -3.478057, 5.770355,
-3.171405, 3.604896, 5.770355,
-3.171405, -3.478057, -5.497981,
-3.171405, -3.478057, 5.770355,
-3.171405, 3.604896, -5.497981,
-3.171405, 3.604896, 5.770355,
-3.171405, -3.478057, -5.497981,
3.103811, -3.478057, -5.497981,
-3.171405, -3.478057, 5.770355,
3.103811, -3.478057, 5.770355,
-3.171405, 3.604896, -5.497981,
3.103811, 3.604896, -5.497981,
-3.171405, 3.604896, 5.770355,
3.103811, 3.604896, 5.770355,
3.103811, -3.478057, -5.497981,
3.103811, 3.604896, -5.497981,
3.103811, -3.478057, 5.770355,
3.103811, 3.604896, 5.770355,
3.103811, -3.478057, -5.497981,
3.103811, -3.478057, 5.770355,
3.103811, 3.604896, -5.497981,
3.103811, 3.604896, 5.770355
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
var radius = 7.857356;
var distance = 34.95827;
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
mvMatrix.translate( 0.03379714, -0.0634197, -0.1361871 );
mvMatrix.scale( 1.353822, 1.199433, 0.7539292 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.95827);
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
sodium_dimethyldithi<-read.table("sodium_dimethyldithi.xyz", skip=1)
```

```
## Error in read.table("sodium_dimethyldithi.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-sodium_dimethyldithi$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
```

```r
y<-sodium_dimethyldithi$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
```

```r
z<-sodium_dimethyldithi$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_dimethyldithi' not found
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
-3.080019, 0.2366048, -1.199272, 0, 0, 1, 1, 1,
-2.87429, 0.5618597, -0.6033598, 1, 0, 0, 1, 1,
-2.8092, 0.8393148, -0.1915296, 1, 0, 0, 1, 1,
-2.703634, 0.1962607, -1.915289, 1, 0, 0, 1, 1,
-2.649804, 1.357064, 1.04134, 1, 0, 0, 1, 1,
-2.447689, -2.558296, -1.385705, 1, 0, 0, 1, 1,
-2.262497, 1.850276, -0.04064823, 0, 0, 0, 1, 1,
-2.24947, 0.177335, -1.776955, 0, 0, 0, 1, 1,
-2.229155, 0.8997689, -0.8847367, 0, 0, 0, 1, 1,
-2.203728, 0.9946019, -1.61863, 0, 0, 0, 1, 1,
-2.202813, -0.8786796, -1.240326, 0, 0, 0, 1, 1,
-2.200413, -2.163285, -3.406282, 0, 0, 0, 1, 1,
-2.182032, -0.278388, -1.872307, 0, 0, 0, 1, 1,
-2.177638, -2.051186, -1.211036, 1, 1, 1, 1, 1,
-2.061514, 0.3627358, -2.260876, 1, 1, 1, 1, 1,
-2.050194, 2.065708, 1.080997, 1, 1, 1, 1, 1,
-2.023978, 0.03167178, -1.039689, 1, 1, 1, 1, 1,
-2.023382, 1.568151, 0.9483199, 1, 1, 1, 1, 1,
-2.00852, -1.949559, -2.38013, 1, 1, 1, 1, 1,
-1.999112, -0.2175249, -1.88268, 1, 1, 1, 1, 1,
-1.965348, 0.0167332, -1.507316, 1, 1, 1, 1, 1,
-1.947478, -1.307405, -1.595429, 1, 1, 1, 1, 1,
-1.930326, 1.088964, 0.1911031, 1, 1, 1, 1, 1,
-1.91695, 0.9274892, 1.46546, 1, 1, 1, 1, 1,
-1.913963, -0.2683814, -3.185645, 1, 1, 1, 1, 1,
-1.878559, 0.3398718, -1.044703, 1, 1, 1, 1, 1,
-1.853441, -1.026175, -0.9550375, 1, 1, 1, 1, 1,
-1.82961, -1.024064, -2.114629, 1, 1, 1, 1, 1,
-1.825857, 0.5173088, -1.701858, 0, 0, 1, 1, 1,
-1.823693, 0.4466563, -1.171625, 1, 0, 0, 1, 1,
-1.806668, -0.4615149, -1.863924, 1, 0, 0, 1, 1,
-1.790338, 1.054056, -1.956817, 1, 0, 0, 1, 1,
-1.777404, 0.6100431, -0.916815, 1, 0, 0, 1, 1,
-1.774968, 0.6047253, -0.7301766, 1, 0, 0, 1, 1,
-1.737509, -0.8633192, -2.540751, 0, 0, 0, 1, 1,
-1.724667, 0.2162085, 0.5943779, 0, 0, 0, 1, 1,
-1.723114, -0.4848, -3.070368, 0, 0, 0, 1, 1,
-1.721488, -1.502733, -1.736692, 0, 0, 0, 1, 1,
-1.714921, 0.5235846, -1.663864, 0, 0, 0, 1, 1,
-1.696495, -0.5866811, -1.985076, 0, 0, 0, 1, 1,
-1.687832, 0.5833526, 0.1558084, 0, 0, 0, 1, 1,
-1.687689, -1.295188, -1.958755, 1, 1, 1, 1, 1,
-1.657268, 1.990296, -0.9202496, 1, 1, 1, 1, 1,
-1.654073, -0.5235953, -0.1885799, 1, 1, 1, 1, 1,
-1.648179, 0.9979958, 0.1114991, 1, 1, 1, 1, 1,
-1.640124, 0.002647274, -0.5701475, 1, 1, 1, 1, 1,
-1.599379, 1.728224, -0.1213606, 1, 1, 1, 1, 1,
-1.597506, -0.2915967, -2.260676, 1, 1, 1, 1, 1,
-1.592385, -0.9914301, -2.260307, 1, 1, 1, 1, 1,
-1.5886, 1.370787, -0.3706526, 1, 1, 1, 1, 1,
-1.576506, -0.2626336, -2.643637, 1, 1, 1, 1, 1,
-1.573447, -1.930142, -2.034159, 1, 1, 1, 1, 1,
-1.56777, 0.2204191, 0.8470289, 1, 1, 1, 1, 1,
-1.56758, -1.166727, -1.222449, 1, 1, 1, 1, 1,
-1.565007, 1.045553, -2.494367, 1, 1, 1, 1, 1,
-1.550097, 0.261506, -1.146696, 1, 1, 1, 1, 1,
-1.540611, -0.1102827, -0.782743, 0, 0, 1, 1, 1,
-1.534144, -0.4187249, -1.973101, 1, 0, 0, 1, 1,
-1.529169, -0.7516283, -2.096284, 1, 0, 0, 1, 1,
-1.522739, 0.7261572, -1.408764, 1, 0, 0, 1, 1,
-1.521572, -0.4897168, -2.121993, 1, 0, 0, 1, 1,
-1.520532, 1.253356, -1.576443, 1, 0, 0, 1, 1,
-1.497999, -0.212505, -1.947603, 0, 0, 0, 1, 1,
-1.491637, -1.267714, -2.379901, 0, 0, 0, 1, 1,
-1.483708, 0.8955408, 0.295309, 0, 0, 0, 1, 1,
-1.476737, 0.666057, -0.2178658, 0, 0, 0, 1, 1,
-1.46373, -0.5268877, -2.0504, 0, 0, 0, 1, 1,
-1.460137, -1.4665, -2.859302, 0, 0, 0, 1, 1,
-1.451822, -0.2958824, -0.9614868, 0, 0, 0, 1, 1,
-1.449393, 0.108696, -3.401181, 1, 1, 1, 1, 1,
-1.442038, -0.6796005, -1.142532, 1, 1, 1, 1, 1,
-1.439723, -0.9257256, -1.948385, 1, 1, 1, 1, 1,
-1.423064, -0.2699836, -1.235677, 1, 1, 1, 1, 1,
-1.409914, 1.453002, -1.224181, 1, 1, 1, 1, 1,
-1.408951, 0.3319715, -1.300388, 1, 1, 1, 1, 1,
-1.403216, -1.087296, -3.687252, 1, 1, 1, 1, 1,
-1.392105, 0.376969, -1.823594, 1, 1, 1, 1, 1,
-1.391856, 0.01851746, -2.853611, 1, 1, 1, 1, 1,
-1.378235, -0.7426912, -2.333916, 1, 1, 1, 1, 1,
-1.371697, 2.136452, -1.052777, 1, 1, 1, 1, 1,
-1.37004, 0.2410984, -2.139177, 1, 1, 1, 1, 1,
-1.368689, -0.859596, -2.079524, 1, 1, 1, 1, 1,
-1.363637, 0.3259723, -1.947364, 1, 1, 1, 1, 1,
-1.358429, 0.8355441, -2.449373, 1, 1, 1, 1, 1,
-1.338827, 0.01878489, 0.5728603, 0, 0, 1, 1, 1,
-1.336346, 1.486628, -1.535019, 1, 0, 0, 1, 1,
-1.334538, -0.6871599, -1.885595, 1, 0, 0, 1, 1,
-1.333498, 0.2389507, -0.7642066, 1, 0, 0, 1, 1,
-1.330701, 0.3958425, -1.721546, 1, 0, 0, 1, 1,
-1.330697, -0.7724908, -1.720032, 1, 0, 0, 1, 1,
-1.330079, 1.860254, -0.3965535, 0, 0, 0, 1, 1,
-1.324676, 2.45571, 0.8816428, 0, 0, 0, 1, 1,
-1.304189, 1.568718, -2.930831, 0, 0, 0, 1, 1,
-1.301592, -0.09618934, -1.597402, 0, 0, 0, 1, 1,
-1.294772, -0.3993208, -1.941921, 0, 0, 0, 1, 1,
-1.287224, 0.6667691, -0.4224044, 0, 0, 0, 1, 1,
-1.277489, -0.7003755, -2.975302, 0, 0, 0, 1, 1,
-1.262694, 3.020236, -1.505472, 1, 1, 1, 1, 1,
-1.257182, -0.9432005, -2.86334, 1, 1, 1, 1, 1,
-1.249198, -0.05538911, -1.35669, 1, 1, 1, 1, 1,
-1.232547, 0.2457104, -1.349908, 1, 1, 1, 1, 1,
-1.228408, -0.5300564, -4.070644, 1, 1, 1, 1, 1,
-1.217713, 0.7125573, -0.6521745, 1, 1, 1, 1, 1,
-1.213969, 0.05864113, -2.366239, 1, 1, 1, 1, 1,
-1.210206, -0.8754501, -2.748629, 1, 1, 1, 1, 1,
-1.209986, -1.662015, -0.9508618, 1, 1, 1, 1, 1,
-1.192024, 1.371107, 0.3318041, 1, 1, 1, 1, 1,
-1.186224, 2.604501, 0.7526947, 1, 1, 1, 1, 1,
-1.184582, 0.5101151, -1.128345, 1, 1, 1, 1, 1,
-1.18245, -0.6847997, -2.151418, 1, 1, 1, 1, 1,
-1.180447, 0.02258736, -2.763097, 1, 1, 1, 1, 1,
-1.179134, 1.943802, 0.6385664, 1, 1, 1, 1, 1,
-1.176032, -0.2432282, -0.4765546, 0, 0, 1, 1, 1,
-1.172802, 2.138713, -0.8139321, 1, 0, 0, 1, 1,
-1.149119, -0.03961965, -0.1164252, 1, 0, 0, 1, 1,
-1.147723, 0.4382863, -1.345425, 1, 0, 0, 1, 1,
-1.14146, -0.3601578, -4.34126, 1, 0, 0, 1, 1,
-1.137837, 0.1946131, -0.7597165, 1, 0, 0, 1, 1,
-1.136584, -1.304763, -2.329407, 0, 0, 0, 1, 1,
-1.130733, -0.8209864, -1.91015, 0, 0, 0, 1, 1,
-1.123059, 0.6378909, 0.08164213, 0, 0, 0, 1, 1,
-1.122274, -0.6563517, -4.332755, 0, 0, 0, 1, 1,
-1.12021, -0.5018972, -1.947408, 0, 0, 0, 1, 1,
-1.118755, 0.2041305, -1.318149, 0, 0, 0, 1, 1,
-1.103997, 1.015793, -1.090221, 0, 0, 0, 1, 1,
-1.095679, 0.9867113, 0.6226227, 1, 1, 1, 1, 1,
-1.092353, -1.721476, -3.775661, 1, 1, 1, 1, 1,
-1.085009, -1.723473, -3.12664, 1, 1, 1, 1, 1,
-1.080055, 0.7279139, -2.063807, 1, 1, 1, 1, 1,
-1.078102, -1.625834, -2.05924, 1, 1, 1, 1, 1,
-1.076544, 1.727659, -0.7331024, 1, 1, 1, 1, 1,
-1.075353, 0.3949474, -1.687593, 1, 1, 1, 1, 1,
-1.068176, -1.347181, -3.213347, 1, 1, 1, 1, 1,
-1.061074, 0.5755351, 0.292594, 1, 1, 1, 1, 1,
-1.058944, 0.09014644, -0.7961363, 1, 1, 1, 1, 1,
-1.058581, 0.2772828, -1.634325, 1, 1, 1, 1, 1,
-1.056807, 1.124905, -0.9109797, 1, 1, 1, 1, 1,
-1.05523, 1.029393, -2.042692, 1, 1, 1, 1, 1,
-1.054886, 1.256025, -0.7394353, 1, 1, 1, 1, 1,
-1.052593, -0.5028626, -1.31568, 1, 1, 1, 1, 1,
-1.049527, 1.321432, -1.046579, 0, 0, 1, 1, 1,
-1.042009, 0.4096403, -0.937085, 1, 0, 0, 1, 1,
-1.028675, 1.653774, 0.1482999, 1, 0, 0, 1, 1,
-1.01789, -0.2265975, -2.706305, 1, 0, 0, 1, 1,
-1.017334, -1.285122, -5.199942, 1, 0, 0, 1, 1,
-1.016398, -1.019086, -2.066839, 1, 0, 0, 1, 1,
-1.009336, -0.1165974, -1.344093, 0, 0, 0, 1, 1,
-1.005183, -1.264628, -2.438319, 0, 0, 0, 1, 1,
-0.9908448, -0.1927278, -1.585504, 0, 0, 0, 1, 1,
-0.9908413, -0.6482486, -1.544518, 0, 0, 0, 1, 1,
-0.9862748, 1.628748, 1.884905, 0, 0, 0, 1, 1,
-0.9810967, 0.1108618, -1.24765, 0, 0, 0, 1, 1,
-0.9794966, 0.5033684, -0.2757234, 0, 0, 0, 1, 1,
-0.9667259, -0.1984891, -1.427493, 1, 1, 1, 1, 1,
-0.9665172, -0.1467466, 0.04076161, 1, 1, 1, 1, 1,
-0.9605833, 0.209375, -2.223273, 1, 1, 1, 1, 1,
-0.9542457, -0.1569929, -1.074826, 1, 1, 1, 1, 1,
-0.9542217, -1.765929, -2.035099, 1, 1, 1, 1, 1,
-0.9534371, -0.1813238, -2.870659, 1, 1, 1, 1, 1,
-0.9474773, -0.06879764, -1.003798, 1, 1, 1, 1, 1,
-0.9396698, 0.5800416, -2.044119, 1, 1, 1, 1, 1,
-0.9290626, 0.2085382, -0.4085992, 1, 1, 1, 1, 1,
-0.9277343, -0.4429413, -1.392104, 1, 1, 1, 1, 1,
-0.9171106, 0.5254267, -0.6650971, 1, 1, 1, 1, 1,
-0.9151502, 0.6075917, -0.1841721, 1, 1, 1, 1, 1,
-0.9134833, 0.4899955, -0.8951101, 1, 1, 1, 1, 1,
-0.90454, -0.9489598, -0.7073087, 1, 1, 1, 1, 1,
-0.9036519, 1.947629, -1.516354, 1, 1, 1, 1, 1,
-0.8969901, -1.739904, -2.195297, 0, 0, 1, 1, 1,
-0.8910717, 0.08019023, -1.304829, 1, 0, 0, 1, 1,
-0.8873748, -1.004083, -1.678136, 1, 0, 0, 1, 1,
-0.8871007, -1.583873, -1.597948, 1, 0, 0, 1, 1,
-0.8850644, 2.103008, -0.2808709, 1, 0, 0, 1, 1,
-0.88469, -1.251592, -1.971453, 1, 0, 0, 1, 1,
-0.8845023, -1.10937, -1.56869, 0, 0, 0, 1, 1,
-0.8812233, -2.613728, -2.409711, 0, 0, 0, 1, 1,
-0.8694736, -0.9417568, -2.662091, 0, 0, 0, 1, 1,
-0.8645658, 0.1957354, -1.732817, 0, 0, 0, 1, 1,
-0.8639265, 0.2734061, 0.6936085, 0, 0, 0, 1, 1,
-0.8619819, 1.009691, -0.7168527, 0, 0, 0, 1, 1,
-0.8575233, 0.9123684, -1.344586, 0, 0, 0, 1, 1,
-0.8574458, 1.896633, -0.7651539, 1, 1, 1, 1, 1,
-0.8531666, 0.00681467, -2.660578, 1, 1, 1, 1, 1,
-0.8484536, -0.0846587, -2.398272, 1, 1, 1, 1, 1,
-0.8450431, -0.08247177, -1.883678, 1, 1, 1, 1, 1,
-0.8431392, -0.8173685, -3.950228, 1, 1, 1, 1, 1,
-0.8419232, -0.02105115, -1.637194, 1, 1, 1, 1, 1,
-0.8382109, -1.211731, -2.98491, 1, 1, 1, 1, 1,
-0.8332955, 0.08015613, -1.714337, 1, 1, 1, 1, 1,
-0.8310827, 1.898179, 0.310853, 1, 1, 1, 1, 1,
-0.830915, -0.730136, -1.720711, 1, 1, 1, 1, 1,
-0.8284997, -0.07973695, -3.6294, 1, 1, 1, 1, 1,
-0.8273375, -0.3053069, -2.163532, 1, 1, 1, 1, 1,
-0.8262085, 0.1201206, -0.7463326, 1, 1, 1, 1, 1,
-0.8250827, 1.461909, -1.229121, 1, 1, 1, 1, 1,
-0.8219253, -0.6888819, -2.706413, 1, 1, 1, 1, 1,
-0.8122593, 0.3018387, 0.5046731, 0, 0, 1, 1, 1,
-0.8080676, 0.0006631717, -1.781551, 1, 0, 0, 1, 1,
-0.8061253, 0.1138361, -3.492594, 1, 0, 0, 1, 1,
-0.8056809, 0.4024665, -1.671763, 1, 0, 0, 1, 1,
-0.80524, 0.542738, 0.2330935, 1, 0, 0, 1, 1,
-0.8033363, 0.7512161, -1.434939, 1, 0, 0, 1, 1,
-0.8030191, -2.549539, -1.757529, 0, 0, 0, 1, 1,
-0.793145, 0.5022677, -1.520225, 0, 0, 0, 1, 1,
-0.7919084, -1.015381, -1.279189, 0, 0, 0, 1, 1,
-0.7846074, 1.579697, -0.6765279, 0, 0, 0, 1, 1,
-0.7711659, -0.8131182, -3.220137, 0, 0, 0, 1, 1,
-0.7706581, 0.3856696, -1.992649, 0, 0, 0, 1, 1,
-0.7670986, 0.5770108, -0.6528387, 0, 0, 0, 1, 1,
-0.7666752, -0.06062102, -1.341045, 1, 1, 1, 1, 1,
-0.7641523, 0.6323185, -0.1382007, 1, 1, 1, 1, 1,
-0.7611873, -2.770187, -3.062954, 1, 1, 1, 1, 1,
-0.7424519, 0.811152, -1.131656, 1, 1, 1, 1, 1,
-0.7325947, 0.2033597, -1.08631, 1, 1, 1, 1, 1,
-0.7311242, 0.1371452, -1.407357, 1, 1, 1, 1, 1,
-0.7301771, -0.4890649, -0.9957739, 1, 1, 1, 1, 1,
-0.7291103, 0.2635351, -0.3422489, 1, 1, 1, 1, 1,
-0.7276601, 0.02729833, -0.8268287, 1, 1, 1, 1, 1,
-0.7271193, 1.212159, -1.735721, 1, 1, 1, 1, 1,
-0.7268032, -0.5391517, -4.091777, 1, 1, 1, 1, 1,
-0.7252331, -0.7445322, -3.582707, 1, 1, 1, 1, 1,
-0.7198776, 1.412778, -2.395729, 1, 1, 1, 1, 1,
-0.7188063, -0.5212151, -2.218041, 1, 1, 1, 1, 1,
-0.7147418, 0.7455274, -0.7281349, 1, 1, 1, 1, 1,
-0.7114644, 0.7978851, 0.05512969, 0, 0, 1, 1, 1,
-0.711217, -0.3032514, -2.543862, 1, 0, 0, 1, 1,
-0.7051308, 0.04588773, -1.891932, 1, 0, 0, 1, 1,
-0.6992317, -1.554424, -1.34172, 1, 0, 0, 1, 1,
-0.6979491, -0.3815862, -3.349404, 1, 0, 0, 1, 1,
-0.6963539, -0.5587671, -3.819638, 1, 0, 0, 1, 1,
-0.6932828, 1.291271, -1.240487, 0, 0, 0, 1, 1,
-0.6918421, 0.8631661, -2.669262, 0, 0, 0, 1, 1,
-0.6865057, 1.532601, 0.970748, 0, 0, 0, 1, 1,
-0.6826307, -0.7518831, -1.184024, 0, 0, 0, 1, 1,
-0.6815462, -0.1604809, -1.488412, 0, 0, 0, 1, 1,
-0.6792417, -0.6476707, -2.878961, 0, 0, 0, 1, 1,
-0.6628698, -0.1541186, -0.8485806, 0, 0, 0, 1, 1,
-0.6614416, 0.6523044, -0.6702946, 1, 1, 1, 1, 1,
-0.6612189, -0.650104, -2.562412, 1, 1, 1, 1, 1,
-0.6605047, -0.3850846, -3.368491, 1, 1, 1, 1, 1,
-0.6573351, 0.2702193, 0.2856593, 1, 1, 1, 1, 1,
-0.6542853, -0.184115, -1.238802, 1, 1, 1, 1, 1,
-0.6542444, -0.1771705, -2.258029, 1, 1, 1, 1, 1,
-0.6511401, 1.703768, 1.057078, 1, 1, 1, 1, 1,
-0.650053, 0.9881796, -2.612677, 1, 1, 1, 1, 1,
-0.6498098, 0.2152221, -0.6399475, 1, 1, 1, 1, 1,
-0.6492985, -0.1319367, -1.368384, 1, 1, 1, 1, 1,
-0.6428219, -0.395737, -0.8104305, 1, 1, 1, 1, 1,
-0.6419346, 0.4240561, -2.02971, 1, 1, 1, 1, 1,
-0.6403654, 0.4754419, -0.3652367, 1, 1, 1, 1, 1,
-0.6308277, 0.4367435, 0.574968, 1, 1, 1, 1, 1,
-0.625655, 0.3770021, -0.8234214, 1, 1, 1, 1, 1,
-0.6230419, -0.02096423, -0.1494983, 0, 0, 1, 1, 1,
-0.6220884, 0.4102824, -0.2798961, 1, 0, 0, 1, 1,
-0.6211921, -0.7606912, -3.484601, 1, 0, 0, 1, 1,
-0.6185092, -0.3041886, -0.5218286, 1, 0, 0, 1, 1,
-0.6152065, -0.7526415, -4.027629, 1, 0, 0, 1, 1,
-0.6146172, -0.9358413, -3.483359, 1, 0, 0, 1, 1,
-0.6095899, -0.2388755, -2.454947, 0, 0, 0, 1, 1,
-0.6063359, 0.5986372, 0.2127348, 0, 0, 0, 1, 1,
-0.6036929, -0.8518609, -0.7481247, 0, 0, 0, 1, 1,
-0.6021912, -2.472917, -4.106924, 0, 0, 0, 1, 1,
-0.5995812, 0.7929173, 1.366138, 0, 0, 0, 1, 1,
-0.5973938, 0.55958, -0.2264031, 0, 0, 0, 1, 1,
-0.5950893, 0.1550852, -1.764048, 0, 0, 0, 1, 1,
-0.5885347, 0.7312376, -0.09997692, 1, 1, 1, 1, 1,
-0.5847628, -0.7982412, -2.343316, 1, 1, 1, 1, 1,
-0.5821251, 0.4291154, -2.032122, 1, 1, 1, 1, 1,
-0.5789778, 0.8666589, 2.221369, 1, 1, 1, 1, 1,
-0.5753293, 0.67181, -1.8131, 1, 1, 1, 1, 1,
-0.571602, -0.2643712, -1.338531, 1, 1, 1, 1, 1,
-0.5705037, 0.7411402, -2.457437, 1, 1, 1, 1, 1,
-0.5704959, 0.4033025, -2.45569, 1, 1, 1, 1, 1,
-0.5679189, -1.113163, -2.893621, 1, 1, 1, 1, 1,
-0.5678656, 0.3805822, -2.190272, 1, 1, 1, 1, 1,
-0.5677648, 0.01036748, -1.879063, 1, 1, 1, 1, 1,
-0.5644395, -0.8690129, -3.048207, 1, 1, 1, 1, 1,
-0.5614201, 0.2920877, -0.07132129, 1, 1, 1, 1, 1,
-0.552418, -0.2238895, -1.742146, 1, 1, 1, 1, 1,
-0.5483782, 0.6247378, -1.257571, 1, 1, 1, 1, 1,
-0.5476708, -0.3760017, -3.06454, 0, 0, 1, 1, 1,
-0.546866, -0.3566032, -4.453013, 1, 0, 0, 1, 1,
-0.5465045, -0.779002, -2.807243, 1, 0, 0, 1, 1,
-0.5462386, 0.2265141, -1.438506, 1, 0, 0, 1, 1,
-0.5441208, -1.802829, -3.548342, 1, 0, 0, 1, 1,
-0.5403694, 1.269603, -0.2621884, 1, 0, 0, 1, 1,
-0.5395805, 0.642121, -0.290861, 0, 0, 0, 1, 1,
-0.5388101, -0.3872232, -0.376015, 0, 0, 0, 1, 1,
-0.5266508, 1.036607, -1.243836, 0, 0, 0, 1, 1,
-0.5238611, -1.914142, -2.687811, 0, 0, 0, 1, 1,
-0.5191231, -0.9400175, -2.261387, 0, 0, 0, 1, 1,
-0.5180438, 1.124879, 1.00467, 0, 0, 0, 1, 1,
-0.5175022, 0.1294366, -1.587374, 0, 0, 0, 1, 1,
-0.5157625, 0.1442719, -1.300533, 1, 1, 1, 1, 1,
-0.5139531, 1.01765, -1.77034, 1, 1, 1, 1, 1,
-0.5117759, 0.7063673, -0.556185, 1, 1, 1, 1, 1,
-0.5083202, -0.4183759, -4.970912, 1, 1, 1, 1, 1,
-0.5074083, -0.404123, -4.591838, 1, 1, 1, 1, 1,
-0.5066009, -1.533519, -2.994188, 1, 1, 1, 1, 1,
-0.5059784, 0.1160823, -2.141517, 1, 1, 1, 1, 1,
-0.5034456, 1.441125, -0.03771785, 1, 1, 1, 1, 1,
-0.5033847, -0.4484233, -4.808102, 1, 1, 1, 1, 1,
-0.5003443, 0.938288, -0.4554358, 1, 1, 1, 1, 1,
-0.4982932, -0.7640598, -2.766547, 1, 1, 1, 1, 1,
-0.4890668, -1.018743, -0.5388399, 1, 1, 1, 1, 1,
-0.4864886, 1.464844, -2.595478, 1, 1, 1, 1, 1,
-0.4854484, -0.8722041, -2.39974, 1, 1, 1, 1, 1,
-0.4842173, -0.3460575, -3.018192, 1, 1, 1, 1, 1,
-0.4753068, -1.766981, -2.352704, 0, 0, 1, 1, 1,
-0.4646702, -1.288163, -2.380303, 1, 0, 0, 1, 1,
-0.454366, -0.7973691, -3.419231, 1, 0, 0, 1, 1,
-0.4539178, -0.2248725, -1.844235, 1, 0, 0, 1, 1,
-0.4538628, 0.4371836, -2.672956, 1, 0, 0, 1, 1,
-0.4483705, -0.8109598, -4.638295, 1, 0, 0, 1, 1,
-0.4370557, 0.3560853, -0.7664592, 0, 0, 0, 1, 1,
-0.436852, 0.7598608, 0.363974, 0, 0, 0, 1, 1,
-0.4346929, -1.017802, -1.949033, 0, 0, 0, 1, 1,
-0.4346834, -1.124231, -3.289685, 0, 0, 0, 1, 1,
-0.4308609, -0.9841138, -3.11384, 0, 0, 0, 1, 1,
-0.430148, 1.457455, 0.6204857, 0, 0, 0, 1, 1,
-0.4289805, 0.8488511, -0.0361543, 0, 0, 0, 1, 1,
-0.4253157, -0.3165058, -1.258416, 1, 1, 1, 1, 1,
-0.4216246, -0.8947828, -1.196527, 1, 1, 1, 1, 1,
-0.4183558, -0.3336115, -2.479413, 1, 1, 1, 1, 1,
-0.418349, 1.455507, 0.3363472, 1, 1, 1, 1, 1,
-0.4176086, 2.177016, -0.3421305, 1, 1, 1, 1, 1,
-0.4175971, 0.04665357, -0.1680258, 1, 1, 1, 1, 1,
-0.4156196, -1.181579, -2.922648, 1, 1, 1, 1, 1,
-0.4131316, 0.6412312, -2.450761, 1, 1, 1, 1, 1,
-0.4127813, 0.02622805, 1.62004, 1, 1, 1, 1, 1,
-0.4120204, 0.498924, -0.7744013, 1, 1, 1, 1, 1,
-0.4080153, -1.91261, -3.194621, 1, 1, 1, 1, 1,
-0.4054588, 0.9384503, 0.2328816, 1, 1, 1, 1, 1,
-0.4043985, -0.8152592, -3.831601, 1, 1, 1, 1, 1,
-0.4019143, 0.1492043, -1.706706, 1, 1, 1, 1, 1,
-0.3996685, -0.3954211, -2.782216, 1, 1, 1, 1, 1,
-0.3986388, -1.431669, -2.47554, 0, 0, 1, 1, 1,
-0.3975825, 0.1502814, -1.193816, 1, 0, 0, 1, 1,
-0.3933083, 0.21012, -0.2259575, 1, 0, 0, 1, 1,
-0.3917671, 1.315447, -2.313477, 1, 0, 0, 1, 1,
-0.3866199, 2.998522, 1.001105, 1, 0, 0, 1, 1,
-0.3817278, -0.8713149, -2.566615, 1, 0, 0, 1, 1,
-0.3787523, -0.9451764, -2.3859, 0, 0, 0, 1, 1,
-0.3772068, -1.615156, -1.730565, 0, 0, 0, 1, 1,
-0.3749616, 0.01973538, -1.769566, 0, 0, 0, 1, 1,
-0.3733393, -0.5205153, -3.129784, 0, 0, 0, 1, 1,
-0.3714756, -0.2688953, -2.197832, 0, 0, 0, 1, 1,
-0.3692693, 0.9140146, 1.557195, 0, 0, 0, 1, 1,
-0.3684148, -0.4700102, -2.033826, 0, 0, 0, 1, 1,
-0.3668205, -1.097734, -1.321395, 1, 1, 1, 1, 1,
-0.3660442, 0.2095, -0.179415, 1, 1, 1, 1, 1,
-0.3618381, -0.6796932, -2.494016, 1, 1, 1, 1, 1,
-0.3597912, 0.2180478, -0.8702093, 1, 1, 1, 1, 1,
-0.3593977, 2.154234, -0.9170869, 1, 1, 1, 1, 1,
-0.3591393, 0.3518112, 0.4780657, 1, 1, 1, 1, 1,
-0.3511441, -0.3624145, -2.351506, 1, 1, 1, 1, 1,
-0.350906, 0.8761069, -0.3742767, 1, 1, 1, 1, 1,
-0.3500356, -0.6441151, -2.711156, 1, 1, 1, 1, 1,
-0.3462902, 3.501746, -1.128697, 1, 1, 1, 1, 1,
-0.3459405, -1.320709, -0.7540988, 1, 1, 1, 1, 1,
-0.3404213, 0.07761648, -1.707082, 1, 1, 1, 1, 1,
-0.3388221, 0.2005801, -0.1829498, 1, 1, 1, 1, 1,
-0.3373393, 0.6800097, -0.6834034, 1, 1, 1, 1, 1,
-0.3343985, -2.159199, -3.797155, 1, 1, 1, 1, 1,
-0.3339143, -1.110602, -3.984942, 0, 0, 1, 1, 1,
-0.3337384, 0.2939721, -0.5507373, 1, 0, 0, 1, 1,
-0.3318198, 0.6484746, 0.09617896, 1, 0, 0, 1, 1,
-0.3287229, -1.384144, -4.069341, 1, 0, 0, 1, 1,
-0.3269341, -0.02238441, -0.6500663, 1, 0, 0, 1, 1,
-0.3267753, -0.5116659, -0.8413632, 1, 0, 0, 1, 1,
-0.3264671, -0.5090222, -3.848192, 0, 0, 0, 1, 1,
-0.3218837, -0.0608657, -1.3801, 0, 0, 0, 1, 1,
-0.3205677, -0.5990338, -4.04581, 0, 0, 0, 1, 1,
-0.3185117, -0.355218, -1.572173, 0, 0, 0, 1, 1,
-0.3121318, -0.7115179, -2.714499, 0, 0, 0, 1, 1,
-0.3117363, 0.6625182, -1.259439, 0, 0, 0, 1, 1,
-0.3034887, 0.392897, -1.281926, 0, 0, 0, 1, 1,
-0.3023925, 0.1724754, -2.03529, 1, 1, 1, 1, 1,
-0.302364, -1.004474, -3.346036, 1, 1, 1, 1, 1,
-0.2942917, -0.3055702, -3.158905, 1, 1, 1, 1, 1,
-0.2888003, 1.647791, 0.1355296, 1, 1, 1, 1, 1,
-0.2887534, 0.273508, 0.3506537, 1, 1, 1, 1, 1,
-0.2802209, 0.5861605, -0.6079024, 1, 1, 1, 1, 1,
-0.2801882, -1.031132, -3.886637, 1, 1, 1, 1, 1,
-0.2797564, -0.3934212, -2.677733, 1, 1, 1, 1, 1,
-0.2796333, -0.2248357, -2.322485, 1, 1, 1, 1, 1,
-0.277574, 0.4355688, 0.144751, 1, 1, 1, 1, 1,
-0.274832, -1.280597, -3.245113, 1, 1, 1, 1, 1,
-0.2746598, -1.231662, -3.475533, 1, 1, 1, 1, 1,
-0.2741098, 0.1469042, -2.905896, 1, 1, 1, 1, 1,
-0.2740371, 1.964175, 0.3548091, 1, 1, 1, 1, 1,
-0.2723451, -1.110903, -2.171179, 1, 1, 1, 1, 1,
-0.2681202, -0.916855, -3.918382, 0, 0, 1, 1, 1,
-0.2668405, -2.314696, -1.388727, 1, 0, 0, 1, 1,
-0.2600738, 1.235049, -0.4139938, 1, 0, 0, 1, 1,
-0.2589221, -0.746675, -2.692139, 1, 0, 0, 1, 1,
-0.2573773, -1.922955, -3.733036, 1, 0, 0, 1, 1,
-0.255092, -0.8617473, -2.819695, 1, 0, 0, 1, 1,
-0.254261, -0.3060383, -3.353472, 0, 0, 0, 1, 1,
-0.2527528, -0.2580215, -0.5080914, 0, 0, 0, 1, 1,
-0.2476112, -0.1924561, -3.288157, 0, 0, 0, 1, 1,
-0.2449792, -0.752908, -2.560915, 0, 0, 0, 1, 1,
-0.2449216, 1.123698, -0.4100547, 0, 0, 0, 1, 1,
-0.2273889, 1.451516, 0.693545, 0, 0, 0, 1, 1,
-0.2268007, -1.037171, -3.938475, 0, 0, 0, 1, 1,
-0.2206588, -1.509281, -1.211834, 1, 1, 1, 1, 1,
-0.2186753, -1.044164, -3.324684, 1, 1, 1, 1, 1,
-0.2183035, -0.2409229, -1.422227, 1, 1, 1, 1, 1,
-0.2164896, 0.1224483, -1.404397, 1, 1, 1, 1, 1,
-0.2153314, -1.198936, -3.466395, 1, 1, 1, 1, 1,
-0.215071, 0.8679369, 0.686152, 1, 1, 1, 1, 1,
-0.207216, -0.7628002, -3.145009, 1, 1, 1, 1, 1,
-0.2047051, 0.1328037, -0.5234337, 1, 1, 1, 1, 1,
-0.2045174, -1.245351, -3.305791, 1, 1, 1, 1, 1,
-0.2028852, 0.2222147, -1.865772, 1, 1, 1, 1, 1,
-0.2017945, 0.5118052, -0.7408212, 1, 1, 1, 1, 1,
-0.2001518, -1.21329, -2.340684, 1, 1, 1, 1, 1,
-0.199575, 1.291973, 1.015762, 1, 1, 1, 1, 1,
-0.1979485, 0.1507862, -0.061491, 1, 1, 1, 1, 1,
-0.1967783, 1.914125, 0.06123614, 1, 1, 1, 1, 1,
-0.1901326, 0.6901943, -0.3232931, 0, 0, 1, 1, 1,
-0.189975, -1.311048, -3.009271, 1, 0, 0, 1, 1,
-0.1884261, 2.323114, 0.07097287, 1, 0, 0, 1, 1,
-0.1846254, -0.9519894, -2.868831, 1, 0, 0, 1, 1,
-0.1830624, -1.236449, -3.385853, 1, 0, 0, 1, 1,
-0.1779878, -1.08303, -3.057976, 1, 0, 0, 1, 1,
-0.17757, 0.5087808, -0.4991573, 0, 0, 0, 1, 1,
-0.1737951, 1.329747, -0.3707049, 0, 0, 0, 1, 1,
-0.1651189, 1.122113, -0.4054881, 0, 0, 0, 1, 1,
-0.1626193, 0.6635458, -0.8434936, 0, 0, 0, 1, 1,
-0.1622201, 1.003409, 0.5350473, 0, 0, 0, 1, 1,
-0.1597009, 0.0845209, -1.510791, 0, 0, 0, 1, 1,
-0.156381, 0.2174888, -1.089446, 0, 0, 0, 1, 1,
-0.1563317, 1.339328, 1.049053, 1, 1, 1, 1, 1,
-0.154001, -0.1514016, -2.047921, 1, 1, 1, 1, 1,
-0.1537706, 0.01573849, -1.443434, 1, 1, 1, 1, 1,
-0.1460674, 0.2181213, -0.9006881, 1, 1, 1, 1, 1,
-0.1442196, -0.3956951, -1.543729, 1, 1, 1, 1, 1,
-0.143177, 0.4497912, 0.905416, 1, 1, 1, 1, 1,
-0.1427857, -0.03427531, -0.6668706, 1, 1, 1, 1, 1,
-0.1402043, 0.1548114, 1.276147, 1, 1, 1, 1, 1,
-0.1347553, 0.6022192, 0.9997282, 1, 1, 1, 1, 1,
-0.1338306, 1.297954, -1.040817, 1, 1, 1, 1, 1,
-0.1328565, -1.114422, -4.135207, 1, 1, 1, 1, 1,
-0.1328512, -1.116606, -3.53313, 1, 1, 1, 1, 1,
-0.1299089, 0.6611983, 0.1597238, 1, 1, 1, 1, 1,
-0.1297827, -2.532522, -1.58504, 1, 1, 1, 1, 1,
-0.1257871, -0.02358792, -2.726441, 1, 1, 1, 1, 1,
-0.1254016, 1.188372, -0.3423534, 0, 0, 1, 1, 1,
-0.1228813, 0.04669531, -2.814403, 1, 0, 0, 1, 1,
-0.1213477, 0.1311285, -0.05286407, 1, 0, 0, 1, 1,
-0.1185912, -0.9866211, -4.044126, 1, 0, 0, 1, 1,
-0.1122633, -0.06636386, -1.840968, 1, 0, 0, 1, 1,
-0.1096889, -0.3912387, -2.783273, 1, 0, 0, 1, 1,
-0.1061055, 0.6040599, -0.03345685, 0, 0, 0, 1, 1,
-0.1060017, 0.1688075, -2.003825, 0, 0, 0, 1, 1,
-0.1030249, -2.082174, -3.199055, 0, 0, 0, 1, 1,
-0.1027657, 0.2026149, -0.9087588, 0, 0, 0, 1, 1,
-0.09821472, 0.2478995, -0.3856003, 0, 0, 0, 1, 1,
-0.09773147, 0.2503267, 0.02484525, 0, 0, 0, 1, 1,
-0.09767722, -0.6146405, -3.172251, 0, 0, 0, 1, 1,
-0.09414197, 0.1971003, -0.7718731, 1, 1, 1, 1, 1,
-0.09195692, 1.232612, -0.5547398, 1, 1, 1, 1, 1,
-0.08906662, -2.573384, -3.241168, 1, 1, 1, 1, 1,
-0.08747838, 0.1874229, -2.335163, 1, 1, 1, 1, 1,
-0.08622751, -0.9790741, -2.142757, 1, 1, 1, 1, 1,
-0.08219567, -2.532502, -3.767007, 1, 1, 1, 1, 1,
-0.08025273, 0.08337729, 0.4449472, 1, 1, 1, 1, 1,
-0.07861012, 0.1155095, -0.04413564, 1, 1, 1, 1, 1,
-0.06835289, -3.374907, -2.938143, 1, 1, 1, 1, 1,
-0.06715851, 1.520948, 1.298362, 1, 1, 1, 1, 1,
-0.06395473, -0.0363066, -1.849273, 1, 1, 1, 1, 1,
-0.05628763, -0.7080609, -2.691139, 1, 1, 1, 1, 1,
-0.05215841, -0.6396165, -3.959342, 1, 1, 1, 1, 1,
-0.0509011, 0.8842085, -0.1497575, 1, 1, 1, 1, 1,
-0.04766459, -0.7149808, -3.572073, 1, 1, 1, 1, 1,
-0.04733827, 1.229441, 0.185647, 0, 0, 1, 1, 1,
-0.04209314, 0.5011442, 0.1033615, 1, 0, 0, 1, 1,
-0.04098306, 1.074003, -0.4960341, 1, 0, 0, 1, 1,
-0.04053025, 1.906778, -1.03099, 1, 0, 0, 1, 1,
-0.0389971, 1.153263, 0.1926066, 1, 0, 0, 1, 1,
-0.03704915, -1.632004, -3.800409, 1, 0, 0, 1, 1,
-0.03465022, 0.761319, 0.6065295, 0, 0, 0, 1, 1,
-0.03450529, -0.1499336, -5.333879, 0, 0, 0, 1, 1,
-0.03448258, 1.152391, 1.214284, 0, 0, 0, 1, 1,
-0.03053297, -0.8524727, -4.091647, 0, 0, 0, 1, 1,
-0.02919926, 0.1818392, -0.03205594, 0, 0, 0, 1, 1,
-0.02640074, 1.308899, -0.8981641, 0, 0, 0, 1, 1,
-0.02217621, -0.05795058, -1.982101, 0, 0, 0, 1, 1,
-0.0205094, -0.3223623, -3.385286, 1, 1, 1, 1, 1,
-0.01763236, -0.457195, -1.691307, 1, 1, 1, 1, 1,
-0.01257904, -2.392424, -4.216223, 1, 1, 1, 1, 1,
-0.00793634, 0.1365347, -0.623853, 1, 1, 1, 1, 1,
-0.003939406, -2.353084, -2.47791, 1, 1, 1, 1, 1,
-0.002672075, 0.1987381, 1.965571, 1, 1, 1, 1, 1,
0.004033103, 0.3023812, 0.01639587, 1, 1, 1, 1, 1,
0.01082086, 0.6490265, 0.1766763, 1, 1, 1, 1, 1,
0.01140449, 0.6855561, 0.7315406, 1, 1, 1, 1, 1,
0.01680703, 0.7808815, 0.6550135, 1, 1, 1, 1, 1,
0.01684905, 1.765927, -0.6103972, 1, 1, 1, 1, 1,
0.01843608, -0.1993965, 4.741, 1, 1, 1, 1, 1,
0.02445741, 0.04528079, 1.046955, 1, 1, 1, 1, 1,
0.02545601, -0.1342458, 4.529484, 1, 1, 1, 1, 1,
0.02741908, 0.3590988, 1.784465, 1, 1, 1, 1, 1,
0.03000087, -0.9522762, 2.789361, 0, 0, 1, 1, 1,
0.0350318, 0.4248734, 0.7438683, 1, 0, 0, 1, 1,
0.03647363, 1.908807, 0.1286871, 1, 0, 0, 1, 1,
0.03650241, 0.5880727, 2.593857, 1, 0, 0, 1, 1,
0.03658707, 1.404908, -0.3714926, 1, 0, 0, 1, 1,
0.03730568, 2.32747, 0.7676727, 1, 0, 0, 1, 1,
0.03878234, -0.5944712, 0.3928947, 0, 0, 0, 1, 1,
0.03911521, -1.31861, 4.755965, 0, 0, 0, 1, 1,
0.03981664, -2.231209, 0.9960454, 0, 0, 0, 1, 1,
0.0402141, -0.8749046, 4.817997, 0, 0, 0, 1, 1,
0.05261191, -0.2879861, 2.923943, 0, 0, 0, 1, 1,
0.05285905, -0.2825497, 3.886297, 0, 0, 0, 1, 1,
0.05286495, -0.9162666, 4.047378, 0, 0, 0, 1, 1,
0.05319024, -0.8685052, 2.862249, 1, 1, 1, 1, 1,
0.05390152, -0.4977674, 4.38554, 1, 1, 1, 1, 1,
0.05958713, 0.5225821, -0.5431003, 1, 1, 1, 1, 1,
0.06366793, -0.2567768, 2.037846, 1, 1, 1, 1, 1,
0.06428973, 0.4186505, -2.178525, 1, 1, 1, 1, 1,
0.06976296, -1.861699, 1.528553, 1, 1, 1, 1, 1,
0.07004362, 0.09146128, 1.893261, 1, 1, 1, 1, 1,
0.07133727, 1.365948, 0.8203158, 1, 1, 1, 1, 1,
0.07501434, -0.5693139, 3.744933, 1, 1, 1, 1, 1,
0.07528941, 2.026536, 0.9381941, 1, 1, 1, 1, 1,
0.07732112, 1.513692, 0.106606, 1, 1, 1, 1, 1,
0.08160121, 0.1063849, -0.2229243, 1, 1, 1, 1, 1,
0.08265243, -0.9891611, 1.05641, 1, 1, 1, 1, 1,
0.0851965, 1.705484, 2.007957, 1, 1, 1, 1, 1,
0.08631846, 0.80322, -0.4265663, 1, 1, 1, 1, 1,
0.08991327, 1.978655, -1.154201, 0, 0, 1, 1, 1,
0.09430901, 0.6670856, -0.7152634, 1, 0, 0, 1, 1,
0.09518542, 1.909031, -2.541381, 1, 0, 0, 1, 1,
0.1043561, -0.7660913, 3.007115, 1, 0, 0, 1, 1,
0.1075295, -0.5123162, 2.78929, 1, 0, 0, 1, 1,
0.1088401, -0.3684471, 3.237394, 1, 0, 0, 1, 1,
0.1120352, 0.6016851, -0.5606318, 0, 0, 0, 1, 1,
0.1163451, 0.3698707, 0.2618343, 0, 0, 0, 1, 1,
0.1183971, -0.8354413, 0.6310073, 0, 0, 0, 1, 1,
0.1246826, -0.9059792, 2.196486, 0, 0, 0, 1, 1,
0.1271224, 3.033637, -0.8140476, 0, 0, 0, 1, 1,
0.1274299, 1.081716, 0.07221004, 0, 0, 0, 1, 1,
0.1282442, -1.218155, 3.160558, 0, 0, 0, 1, 1,
0.1288817, 1.606007, 0.994394, 1, 1, 1, 1, 1,
0.1311506, -1.245697, 2.571609, 1, 1, 1, 1, 1,
0.1368949, -1.942861, 4.590508, 1, 1, 1, 1, 1,
0.1384591, 0.204272, 0.8217146, 1, 1, 1, 1, 1,
0.1410454, -0.4104668, 2.653366, 1, 1, 1, 1, 1,
0.1423124, -0.442758, 2.685019, 1, 1, 1, 1, 1,
0.1428122, 2.078727, 0.9477796, 1, 1, 1, 1, 1,
0.1443734, 0.41052, 2.094678, 1, 1, 1, 1, 1,
0.1467532, 1.149601, -1.784335, 1, 1, 1, 1, 1,
0.1475409, -1.731222, 3.817162, 1, 1, 1, 1, 1,
0.1514167, 0.3238868, 0.808503, 1, 1, 1, 1, 1,
0.1530407, -0.624427, 4.443904, 1, 1, 1, 1, 1,
0.1534545, 0.2002508, 0.9936305, 1, 1, 1, 1, 1,
0.1543675, -0.9217455, 4.168146, 1, 1, 1, 1, 1,
0.1562592, -1.547793, 2.69164, 1, 1, 1, 1, 1,
0.1572917, -0.9234422, 3.15133, 0, 0, 1, 1, 1,
0.1587802, -0.616064, 3.222813, 1, 0, 0, 1, 1,
0.1631545, -1.130345, 1.484586, 1, 0, 0, 1, 1,
0.1656328, 0.2055332, 0.4548677, 1, 0, 0, 1, 1,
0.1738747, -0.1687249, 1.35289, 1, 0, 0, 1, 1,
0.178287, -1.992296, 2.106684, 1, 0, 0, 1, 1,
0.1799869, -0.06312314, 2.032333, 0, 0, 0, 1, 1,
0.1804529, -0.6488237, 3.966918, 0, 0, 0, 1, 1,
0.182211, 1.297133, -0.7087124, 0, 0, 0, 1, 1,
0.1839087, 0.5861599, 1.404759, 0, 0, 0, 1, 1,
0.184384, 1.517788, -0.6947213, 0, 0, 0, 1, 1,
0.1940258, -0.9508372, 3.69746, 0, 0, 0, 1, 1,
0.1953016, -0.2364971, 2.218434, 0, 0, 0, 1, 1,
0.2013855, 0.9871069, 1.691824, 1, 1, 1, 1, 1,
0.2030917, -1.090334, 3.005005, 1, 1, 1, 1, 1,
0.2038458, 0.2103348, -2.300048, 1, 1, 1, 1, 1,
0.2069144, 0.6506107, -0.7255028, 1, 1, 1, 1, 1,
0.2072567, 0.5538632, -0.2884161, 1, 1, 1, 1, 1,
0.2082063, -1.286165, 5.606253, 1, 1, 1, 1, 1,
0.2098861, -1.061424, 1.551459, 1, 1, 1, 1, 1,
0.2132562, -0.5976606, 3.075538, 1, 1, 1, 1, 1,
0.214772, 0.5431492, 0.7411202, 1, 1, 1, 1, 1,
0.2178401, -0.989694, 2.284892, 1, 1, 1, 1, 1,
0.2180301, -1.049737, 3.066085, 1, 1, 1, 1, 1,
0.2198526, -0.8518698, 2.36845, 1, 1, 1, 1, 1,
0.2206474, -0.02948281, 3.037812, 1, 1, 1, 1, 1,
0.2214547, -0.6745522, 4.772205, 1, 1, 1, 1, 1,
0.2281461, -0.4611191, 2.635199, 1, 1, 1, 1, 1,
0.2286862, 0.05447917, 1.503429, 0, 0, 1, 1, 1,
0.2288475, -0.1992577, 3.335415, 1, 0, 0, 1, 1,
0.23289, -1.178746, 1.286394, 1, 0, 0, 1, 1,
0.2339316, 0.564566, 1.884401, 1, 0, 0, 1, 1,
0.2361305, 0.7265931, 0.6771188, 1, 0, 0, 1, 1,
0.2363943, 0.06676482, 1.379377, 1, 0, 0, 1, 1,
0.2391081, 1.35552, 0.6326225, 0, 0, 0, 1, 1,
0.2392345, -0.03113314, 2.268038, 0, 0, 0, 1, 1,
0.2397613, 0.8790493, -0.2452891, 0, 0, 0, 1, 1,
0.2416877, -0.6365238, 2.595397, 0, 0, 0, 1, 1,
0.2424414, -1.664764, 3.278436, 0, 0, 0, 1, 1,
0.2464723, 1.213801, -1.246759, 0, 0, 0, 1, 1,
0.2501682, -0.4774163, 3.10452, 0, 0, 0, 1, 1,
0.250192, -1.790617, 3.612465, 1, 1, 1, 1, 1,
0.2523032, 0.3801116, 1.374521, 1, 1, 1, 1, 1,
0.2589023, 0.6885702, -0.09804758, 1, 1, 1, 1, 1,
0.2640453, -2.591264, 1.64908, 1, 1, 1, 1, 1,
0.2674262, 1.219696, 0.5427153, 1, 1, 1, 1, 1,
0.2700588, -0.06541087, 1.458297, 1, 1, 1, 1, 1,
0.2709789, 2.252742, 1.230868, 1, 1, 1, 1, 1,
0.2738649, 0.2340258, -0.3070955, 1, 1, 1, 1, 1,
0.2767754, -0.7935472, 2.623226, 1, 1, 1, 1, 1,
0.2768194, 1.327608, 0.6106614, 1, 1, 1, 1, 1,
0.2812541, 1.219732, 0.051052, 1, 1, 1, 1, 1,
0.2841036, -1.033728, 1.498806, 1, 1, 1, 1, 1,
0.2850364, -1.534529, 3.645079, 1, 1, 1, 1, 1,
0.2890991, 0.7128216, 0.4090001, 1, 1, 1, 1, 1,
0.2909108, -1.081113, 3.982325, 1, 1, 1, 1, 1,
0.2928867, 1.057928, 0.5729048, 0, 0, 1, 1, 1,
0.2947145, -0.9610468, 4.010906, 1, 0, 0, 1, 1,
0.2997887, 0.4892563, -0.3345763, 1, 0, 0, 1, 1,
0.3030089, -0.4716004, 2.577111, 1, 0, 0, 1, 1,
0.3060865, 0.4248339, 1.400815, 1, 0, 0, 1, 1,
0.3071924, 0.5120424, 0.1380472, 1, 0, 0, 1, 1,
0.3072476, 0.4607892, -0.2395833, 0, 0, 0, 1, 1,
0.310414, -0.9156343, 2.454653, 0, 0, 0, 1, 1,
0.316446, -0.5218995, 2.808064, 0, 0, 0, 1, 1,
0.3344681, -0.4005361, 3.0323, 0, 0, 0, 1, 1,
0.3351717, -1.16213, 2.515991, 0, 0, 0, 1, 1,
0.3355571, 0.007228791, 3.592247, 0, 0, 0, 1, 1,
0.338107, 0.1992205, 0.9059075, 0, 0, 0, 1, 1,
0.3388302, -1.40138, 5.498735, 1, 1, 1, 1, 1,
0.3410176, -0.6062043, 3.906878, 1, 1, 1, 1, 1,
0.3453477, -1.548237, 1.487334, 1, 1, 1, 1, 1,
0.3475451, 1.087623, -1.561378, 1, 1, 1, 1, 1,
0.3487941, -1.551606, 4.632419, 1, 1, 1, 1, 1,
0.3490894, -1.520766, 3.087136, 1, 1, 1, 1, 1,
0.3518265, 0.7324551, 0.18062, 1, 1, 1, 1, 1,
0.3572902, -0.2702864, 1.639415, 1, 1, 1, 1, 1,
0.3595712, 0.9265525, 1.13863, 1, 1, 1, 1, 1,
0.3655267, 0.7076281, -0.1184119, 1, 1, 1, 1, 1,
0.366713, -1.321509, 4.637009, 1, 1, 1, 1, 1,
0.3745055, -0.4088056, 1.551457, 1, 1, 1, 1, 1,
0.3762344, -0.5312574, 2.008993, 1, 1, 1, 1, 1,
0.3782239, 0.1078431, 1.927886, 1, 1, 1, 1, 1,
0.3796053, -0.09809477, 0.870419, 1, 1, 1, 1, 1,
0.3812733, -0.3451606, 2.905574, 0, 0, 1, 1, 1,
0.3824247, 0.3882911, 0.471849, 1, 0, 0, 1, 1,
0.3903307, -0.7902492, 4.438643, 1, 0, 0, 1, 1,
0.3975733, -2.267744, 2.624383, 1, 0, 0, 1, 1,
0.3979465, -0.1652991, 0.5192018, 1, 0, 0, 1, 1,
0.3988072, 0.02703871, 0.3924436, 1, 0, 0, 1, 1,
0.4016082, -0.7220141, 2.841158, 0, 0, 0, 1, 1,
0.4016912, -0.9918602, 3.483853, 0, 0, 0, 1, 1,
0.4017541, -0.7921875, 0.2331592, 0, 0, 0, 1, 1,
0.4047592, -1.762328, 2.638515, 0, 0, 0, 1, 1,
0.4080282, -0.5766652, 2.458584, 0, 0, 0, 1, 1,
0.4083574, -0.3994328, 1.905155, 0, 0, 0, 1, 1,
0.4091149, 1.332999, 0.02450783, 0, 0, 0, 1, 1,
0.4095807, 1.687842, 0.2625528, 1, 1, 1, 1, 1,
0.4113892, 0.2555116, 0.6481243, 1, 1, 1, 1, 1,
0.4180236, -0.3605101, 1.738156, 1, 1, 1, 1, 1,
0.4215694, -0.3351862, 2.302518, 1, 1, 1, 1, 1,
0.4234761, 0.2196204, 0.315422, 1, 1, 1, 1, 1,
0.427736, 1.274847, -0.8882354, 1, 1, 1, 1, 1,
0.4303483, -0.4339317, 2.445381, 1, 1, 1, 1, 1,
0.439837, -0.2517499, 1.497406, 1, 1, 1, 1, 1,
0.4402898, -1.187639, 3.173139, 1, 1, 1, 1, 1,
0.442828, -1.674034, 3.42401, 1, 1, 1, 1, 1,
0.4487191, -1.235756, 2.536091, 1, 1, 1, 1, 1,
0.4511827, 0.5907344, 0.3763677, 1, 1, 1, 1, 1,
0.4517653, -0.398978, 3.311217, 1, 1, 1, 1, 1,
0.4520279, -0.3179945, 0.2330018, 1, 1, 1, 1, 1,
0.4535545, -0.3591156, 1.994161, 1, 1, 1, 1, 1,
0.4542772, 0.9471427, 1.15091, 0, 0, 1, 1, 1,
0.4542908, -0.2899987, 2.772691, 1, 0, 0, 1, 1,
0.4547964, -0.4376855, 3.161297, 1, 0, 0, 1, 1,
0.4550284, 0.34001, 1.872224, 1, 0, 0, 1, 1,
0.4560193, 0.116036, -0.3023461, 1, 0, 0, 1, 1,
0.4564991, -0.337241, 3.050763, 1, 0, 0, 1, 1,
0.4633403, 0.3359278, 1.252931, 0, 0, 0, 1, 1,
0.4656629, 1.558043, 0.9282385, 0, 0, 0, 1, 1,
0.4661487, 1.253251, -0.7917605, 0, 0, 0, 1, 1,
0.4661507, -1.004197, 2.747631, 0, 0, 0, 1, 1,
0.4670096, -0.7649233, 3.007293, 0, 0, 0, 1, 1,
0.4671243, 1.387915, 0.8344682, 0, 0, 0, 1, 1,
0.4673696, -1.806862, 1.502807, 0, 0, 0, 1, 1,
0.4894675, -0.6328685, 3.295854, 1, 1, 1, 1, 1,
0.4902088, 1.007369, 2.066012, 1, 1, 1, 1, 1,
0.4955601, 0.3547652, 2.119581, 1, 1, 1, 1, 1,
0.4960374, 1.018701, 0.8839641, 1, 1, 1, 1, 1,
0.4986929, -1.563953, 1.638934, 1, 1, 1, 1, 1,
0.502962, 1.437626, -1.215798, 1, 1, 1, 1, 1,
0.5044167, 0.08992281, 1.430143, 1, 1, 1, 1, 1,
0.5120329, 0.1475239, 0.1427184, 1, 1, 1, 1, 1,
0.5138732, 0.6227782, 0.8729735, 1, 1, 1, 1, 1,
0.5210934, -0.8440453, 2.727546, 1, 1, 1, 1, 1,
0.5242667, -0.6678705, 1.587197, 1, 1, 1, 1, 1,
0.5368437, 1.338682, 1.682045, 1, 1, 1, 1, 1,
0.5395155, 0.9289035, -1.096164, 1, 1, 1, 1, 1,
0.5402033, 0.05924126, 3.420308, 1, 1, 1, 1, 1,
0.5434678, 1.090281, 1.203584, 1, 1, 1, 1, 1,
0.5440156, -1.835226, 2.693862, 0, 0, 1, 1, 1,
0.5463628, -0.6424805, 2.780481, 1, 0, 0, 1, 1,
0.5474247, -1.746974, 2.388187, 1, 0, 0, 1, 1,
0.5491804, 0.4559544, -0.1464695, 1, 0, 0, 1, 1,
0.5519335, -1.559644, 2.352758, 1, 0, 0, 1, 1,
0.552538, 0.3319289, 0.3715162, 1, 0, 0, 1, 1,
0.5540109, -0.9293061, 1.77519, 0, 0, 0, 1, 1,
0.5548817, 0.9591382, 1.705405, 0, 0, 0, 1, 1,
0.5618455, -0.1298899, 0.9088834, 0, 0, 0, 1, 1,
0.5658489, 0.4649792, 0.395029, 0, 0, 0, 1, 1,
0.5701647, -1.060195, 2.660654, 0, 0, 0, 1, 1,
0.5705176, -1.051618, 1.95425, 0, 0, 0, 1, 1,
0.5711189, 0.6944421, 2.74486, 0, 0, 0, 1, 1,
0.5726238, 0.264903, -0.1698888, 1, 1, 1, 1, 1,
0.5744264, 0.1674124, 1.180278, 1, 1, 1, 1, 1,
0.576028, -0.6893238, 2.12513, 1, 1, 1, 1, 1,
0.577684, 0.6541664, 1.50365, 1, 1, 1, 1, 1,
0.5818089, 0.1140007, 3.605965, 1, 1, 1, 1, 1,
0.5837415, 1.084424, 0.5381597, 1, 1, 1, 1, 1,
0.5863109, 0.9588163, 0.1067332, 1, 1, 1, 1, 1,
0.5888638, -0.9654464, 0.7780358, 1, 1, 1, 1, 1,
0.5904611, 0.726028, 1.724483, 1, 1, 1, 1, 1,
0.5942193, -0.2301276, 2.040776, 1, 1, 1, 1, 1,
0.5999096, 0.07848604, 1.48511, 1, 1, 1, 1, 1,
0.6046766, 1.117477, -0.4199684, 1, 1, 1, 1, 1,
0.6056273, 2.274343, 0.57516, 1, 1, 1, 1, 1,
0.6067513, 0.02632569, 1.158456, 1, 1, 1, 1, 1,
0.6086993, -1.170046, 4.408783, 1, 1, 1, 1, 1,
0.6215308, -0.9852021, 4.460133, 0, 0, 1, 1, 1,
0.623882, 0.39577, 0.1740154, 1, 0, 0, 1, 1,
0.6298941, 0.4317302, -1.348633, 1, 0, 0, 1, 1,
0.6342137, -0.07363001, 3.356447, 1, 0, 0, 1, 1,
0.6416712, 1.421302, -0.02433129, 1, 0, 0, 1, 1,
0.6423952, -0.7485112, 2.756826, 1, 0, 0, 1, 1,
0.6620075, -0.5707294, 1.637455, 0, 0, 0, 1, 1,
0.66222, -0.02006939, 1.395371, 0, 0, 0, 1, 1,
0.6644188, 2.028485, -0.0738796, 0, 0, 0, 1, 1,
0.666398, -0.007059808, 1.388627, 0, 0, 0, 1, 1,
0.6671391, 0.7360551, 1.805419, 0, 0, 0, 1, 1,
0.6677769, -0.5652776, 2.750489, 0, 0, 0, 1, 1,
0.6692693, 0.9425958, 0.1729651, 0, 0, 0, 1, 1,
0.6714427, 1.553904, -0.1185097, 1, 1, 1, 1, 1,
0.6748706, -1.42469, 3.890347, 1, 1, 1, 1, 1,
0.6763649, -1.01189, 1.776647, 1, 1, 1, 1, 1,
0.6764202, -0.7973083, 3.823851, 1, 1, 1, 1, 1,
0.6778811, 0.1301754, -0.4258226, 1, 1, 1, 1, 1,
0.6798064, -1.087974, 4.214868, 1, 1, 1, 1, 1,
0.6826792, -0.4624289, 0.6143563, 1, 1, 1, 1, 1,
0.6834422, 0.6625777, 1.573678, 1, 1, 1, 1, 1,
0.6842312, -0.3348933, 1.949706, 1, 1, 1, 1, 1,
0.6853857, -0.874298, 3.980603, 1, 1, 1, 1, 1,
0.6865539, -0.7524256, 2.121887, 1, 1, 1, 1, 1,
0.6935618, -0.5577834, 2.584387, 1, 1, 1, 1, 1,
0.6971544, -0.9338405, 1.436394, 1, 1, 1, 1, 1,
0.697175, -0.4565197, 2.783786, 1, 1, 1, 1, 1,
0.7024952, -0.5180485, 0.8523212, 1, 1, 1, 1, 1,
0.7043087, 1.359212, 1.534145, 0, 0, 1, 1, 1,
0.7129932, 0.9193623, -0.314707, 1, 0, 0, 1, 1,
0.7152369, -1.208655, 2.229648, 1, 0, 0, 1, 1,
0.7155321, 0.6259519, -0.9437634, 1, 0, 0, 1, 1,
0.7167389, -0.9977882, 1.508667, 1, 0, 0, 1, 1,
0.732717, -0.505686, 1.661122, 1, 0, 0, 1, 1,
0.7352188, -1.848079, 2.749915, 0, 0, 0, 1, 1,
0.7365872, -0.5706786, 1.312309, 0, 0, 0, 1, 1,
0.7399757, 2.306303, 2.28028, 0, 0, 0, 1, 1,
0.7429937, -0.6137623, 2.687804, 0, 0, 0, 1, 1,
0.745245, -0.07089014, 1.868362, 0, 0, 0, 1, 1,
0.7499629, -0.4162545, 2.309908, 0, 0, 0, 1, 1,
0.7506617, 0.4308592, 0.4675961, 0, 0, 0, 1, 1,
0.7509213, -0.09578581, 3.258767, 1, 1, 1, 1, 1,
0.7510725, 0.3158982, 1.677951, 1, 1, 1, 1, 1,
0.751543, 1.579075, 0.6278866, 1, 1, 1, 1, 1,
0.7521594, -0.05156868, 1.93715, 1, 1, 1, 1, 1,
0.7621302, 1.802337, -0.1317208, 1, 1, 1, 1, 1,
0.7635722, 0.3828471, 1.311589, 1, 1, 1, 1, 1,
0.7680069, 0.6917466, 0.6478041, 1, 1, 1, 1, 1,
0.7689748, 0.1283393, 2.505521, 1, 1, 1, 1, 1,
0.7748682, -0.1076657, 3.141262, 1, 1, 1, 1, 1,
0.7769468, -0.2303864, 1.096248, 1, 1, 1, 1, 1,
0.7842496, 1.072749, 0.6012527, 1, 1, 1, 1, 1,
0.785928, 0.247213, 1.796059, 1, 1, 1, 1, 1,
0.7874453, 0.1443361, 0.3856522, 1, 1, 1, 1, 1,
0.7876295, -1.028554, 3.457469, 1, 1, 1, 1, 1,
0.7904382, 0.8518423, 0.433149, 1, 1, 1, 1, 1,
0.8010976, 0.434416, 0.151177, 0, 0, 1, 1, 1,
0.8014448, -0.3390155, 1.63466, 1, 0, 0, 1, 1,
0.8028919, -1.754295, 3.1263, 1, 0, 0, 1, 1,
0.807497, 0.4001588, 1.416161, 1, 0, 0, 1, 1,
0.8077649, 1.935948, 0.160189, 1, 0, 0, 1, 1,
0.8082699, -1.110674, 2.170819, 1, 0, 0, 1, 1,
0.8147662, 1.38444, -0.3449703, 0, 0, 0, 1, 1,
0.8158094, 0.3082691, 1.521973, 0, 0, 0, 1, 1,
0.8160107, -0.696312, 2.23507, 0, 0, 0, 1, 1,
0.8208893, -0.4959547, 1.98743, 0, 0, 0, 1, 1,
0.8294142, 0.4278463, 1.32057, 0, 0, 0, 1, 1,
0.831875, -0.2226597, 1.364953, 0, 0, 0, 1, 1,
0.8340926, -2.051049, 3.088493, 0, 0, 0, 1, 1,
0.8371695, 1.613537, 1.22684, 1, 1, 1, 1, 1,
0.8389881, 0.03104487, 1.250424, 1, 1, 1, 1, 1,
0.8408262, -0.4953835, 2.121581, 1, 1, 1, 1, 1,
0.8476726, -0.9445556, 4.848298, 1, 1, 1, 1, 1,
0.8481411, 0.2183921, 1.018701, 1, 1, 1, 1, 1,
0.8489105, 0.7629065, -0.467663, 1, 1, 1, 1, 1,
0.849242, -0.577576, 2.817316, 1, 1, 1, 1, 1,
0.8515708, 1.706298, 0.126124, 1, 1, 1, 1, 1,
0.8568552, -0.01561897, 0.9062366, 1, 1, 1, 1, 1,
0.8631515, -0.2317092, 3.035152, 1, 1, 1, 1, 1,
0.8691049, 0.8449603, 0.7932612, 1, 1, 1, 1, 1,
0.8701692, 0.4890977, 1.088557, 1, 1, 1, 1, 1,
0.8721498, -0.4525582, 1.401446, 1, 1, 1, 1, 1,
0.8724453, 0.601202, 0.8643506, 1, 1, 1, 1, 1,
0.8737804, -0.5487299, 1.325755, 1, 1, 1, 1, 1,
0.8786025, 0.9162776, -0.2962567, 0, 0, 1, 1, 1,
0.8810669, -0.685119, 0.3128417, 1, 0, 0, 1, 1,
0.8863255, 0.2254686, 0.9320267, 1, 0, 0, 1, 1,
0.8876516, -0.3237206, 1.56039, 1, 0, 0, 1, 1,
0.8899755, 1.782376, 2.780552, 1, 0, 0, 1, 1,
0.8901596, 0.6811336, 0.3552917, 1, 0, 0, 1, 1,
0.8979684, -0.7313403, 2.298398, 0, 0, 0, 1, 1,
0.8989043, 0.9335193, 1.096428, 0, 0, 0, 1, 1,
0.908842, 0.9255596, -0.6676922, 0, 0, 0, 1, 1,
0.9145696, -0.9211915, 0.6888052, 0, 0, 0, 1, 1,
0.927218, -0.9478493, 1.831971, 0, 0, 0, 1, 1,
0.9301848, 1.090798, 0.1869335, 0, 0, 0, 1, 1,
0.9305924, -0.2008799, 1.543383, 0, 0, 0, 1, 1,
0.9343651, -0.6628241, 3.282126, 1, 1, 1, 1, 1,
0.9399088, -0.3838118, 3.80772, 1, 1, 1, 1, 1,
0.9448578, -0.172191, 0.3737526, 1, 1, 1, 1, 1,
0.9488598, 0.4986327, 0.9591542, 1, 1, 1, 1, 1,
0.9615158, 1.174087, 2.906399, 1, 1, 1, 1, 1,
0.9667017, -0.4130646, 1.963379, 1, 1, 1, 1, 1,
0.9693331, 0.1951652, 0.790531, 1, 1, 1, 1, 1,
0.9701447, -0.9440298, 2.421605, 1, 1, 1, 1, 1,
0.9720731, 0.473958, -0.1061031, 1, 1, 1, 1, 1,
0.9909708, 0.009539081, 1.298956, 1, 1, 1, 1, 1,
0.9920532, -0.7199754, 1.339982, 1, 1, 1, 1, 1,
0.9932604, 1.560915, 1.915251, 1, 1, 1, 1, 1,
0.9943621, 0.5570776, 2.056929, 1, 1, 1, 1, 1,
0.9953167, -2.081187, 3.135933, 1, 1, 1, 1, 1,
0.9970189, 0.1672869, 1.071318, 1, 1, 1, 1, 1,
0.9997979, 0.3549682, 0.7970737, 0, 0, 1, 1, 1,
1.001315, -0.7994438, 3.952246, 1, 0, 0, 1, 1,
1.005226, 0.6806916, 1.559945, 1, 0, 0, 1, 1,
1.01014, 0.2478927, 0.2314305, 1, 0, 0, 1, 1,
1.01053, -1.457336, 3.964742, 1, 0, 0, 1, 1,
1.010799, -1.454368, 1.249869, 1, 0, 0, 1, 1,
1.014854, 0.1523585, 2.510157, 0, 0, 0, 1, 1,
1.020226, -0.3747551, 1.714872, 0, 0, 0, 1, 1,
1.032073, 1.072993, 1.731348, 0, 0, 0, 1, 1,
1.032864, -2.349697, 2.399948, 0, 0, 0, 1, 1,
1.033146, 0.2897099, 0.7594171, 0, 0, 0, 1, 1,
1.033447, 0.6790574, -1.638426, 0, 0, 0, 1, 1,
1.033722, -1.080582, 0.914521, 0, 0, 0, 1, 1,
1.037166, 0.06278821, 0.7181408, 1, 1, 1, 1, 1,
1.048183, -0.2907474, 1.367001, 1, 1, 1, 1, 1,
1.048747, -0.1486274, 1.862736, 1, 1, 1, 1, 1,
1.048959, -0.9362281, 3.042074, 1, 1, 1, 1, 1,
1.059246, -0.5459248, 1.867618, 1, 1, 1, 1, 1,
1.061175, 1.442246, 2.213082, 1, 1, 1, 1, 1,
1.069667, -0.94239, 0.5727082, 1, 1, 1, 1, 1,
1.074449, -0.07098593, 1.197714, 1, 1, 1, 1, 1,
1.078344, -1.241064, 2.851527, 1, 1, 1, 1, 1,
1.08452, 1.504456, -1.526782, 1, 1, 1, 1, 1,
1.085659, 0.2703516, 2.58689, 1, 1, 1, 1, 1,
1.092436, 1.448578, 2.506593, 1, 1, 1, 1, 1,
1.092762, 0.2603276, 2.361453, 1, 1, 1, 1, 1,
1.093228, 2.429372, -1.072147, 1, 1, 1, 1, 1,
1.096156, 0.5504724, 0.5793523, 1, 1, 1, 1, 1,
1.104102, -0.4813138, 3.026192, 0, 0, 1, 1, 1,
1.108953, 1.321897, 1.860165, 1, 0, 0, 1, 1,
1.114103, -0.6684916, 3.702904, 1, 0, 0, 1, 1,
1.114282, -0.9879199, 3.665691, 1, 0, 0, 1, 1,
1.116137, -0.4835807, 2.810079, 1, 0, 0, 1, 1,
1.116377, 1.494393, 0.4777185, 1, 0, 0, 1, 1,
1.128364, 0.8094082, 2.403471, 0, 0, 0, 1, 1,
1.141711, -0.9956704, 2.92241, 0, 0, 0, 1, 1,
1.144802, -0.06932557, 1.583102, 0, 0, 0, 1, 1,
1.154107, -0.5864513, 4.30776, 0, 0, 0, 1, 1,
1.16244, 1.36089, -1.295562, 0, 0, 0, 1, 1,
1.168429, 1.130877, 2.874797, 0, 0, 0, 1, 1,
1.171128, -0.5627396, 2.237721, 0, 0, 0, 1, 1,
1.179253, 0.3234102, 2.467399, 1, 1, 1, 1, 1,
1.180692, 0.9840319, 2.390723, 1, 1, 1, 1, 1,
1.186102, -0.4257996, 2.53764, 1, 1, 1, 1, 1,
1.189793, -0.5872812, 2.068907, 1, 1, 1, 1, 1,
1.19599, -0.8773178, 3.790633, 1, 1, 1, 1, 1,
1.201052, -0.09563613, 0.5582765, 1, 1, 1, 1, 1,
1.203872, -1.297302, 1.800619, 1, 1, 1, 1, 1,
1.206736, 0.02227405, 2.607625, 1, 1, 1, 1, 1,
1.213261, -0.1360667, 1.061226, 1, 1, 1, 1, 1,
1.215809, 1.097829, 0.6829465, 1, 1, 1, 1, 1,
1.216168, 0.7078907, 0.05058985, 1, 1, 1, 1, 1,
1.233095, 0.4781077, 1.006832, 1, 1, 1, 1, 1,
1.234491, 0.7620671, -0.1145162, 1, 1, 1, 1, 1,
1.237079, 0.2380517, -0.1738798, 1, 1, 1, 1, 1,
1.241435, 1.067199, 1.327406, 1, 1, 1, 1, 1,
1.24442, -1.350741, 3.615011, 0, 0, 1, 1, 1,
1.244525, 1.468128, 0.2877426, 1, 0, 0, 1, 1,
1.259957, -0.2725612, 1.862286, 1, 0, 0, 1, 1,
1.268303, 0.5839835, 0.8231217, 1, 0, 0, 1, 1,
1.273564, -1.312382, 2.99347, 1, 0, 0, 1, 1,
1.278354, -0.1171472, 2.090163, 1, 0, 0, 1, 1,
1.288562, -0.8725722, 3.008204, 0, 0, 0, 1, 1,
1.290964, -0.721557, 1.099062, 0, 0, 0, 1, 1,
1.294135, 2.014558, 1.949033, 0, 0, 0, 1, 1,
1.301944, -0.641655, 2.061212, 0, 0, 0, 1, 1,
1.307782, 0.2319804, 2.367084, 0, 0, 0, 1, 1,
1.308292, 0.6083407, -0.8836643, 0, 0, 0, 1, 1,
1.309285, 0.5247643, -0.1918926, 0, 0, 0, 1, 1,
1.313824, 0.0120571, 1.096156, 1, 1, 1, 1, 1,
1.314397, -0.1786347, 1.055454, 1, 1, 1, 1, 1,
1.318682, -0.1305996, 0.7391031, 1, 1, 1, 1, 1,
1.333895, -0.3434504, 1.670801, 1, 1, 1, 1, 1,
1.341429, 0.5448582, 2.215118, 1, 1, 1, 1, 1,
1.356539, -0.174467, 0.9837183, 1, 1, 1, 1, 1,
1.366773, -0.6562138, 1.29833, 1, 1, 1, 1, 1,
1.373692, -0.5919164, -0.572644, 1, 1, 1, 1, 1,
1.374658, -0.3541342, 0.5642919, 1, 1, 1, 1, 1,
1.381645, -1.516455, 1.710975, 1, 1, 1, 1, 1,
1.384471, 1.318015, 0.6003787, 1, 1, 1, 1, 1,
1.385858, 1.378116, 0.7148468, 1, 1, 1, 1, 1,
1.390525, 0.7186372, -0.7227802, 1, 1, 1, 1, 1,
1.392612, 0.1886069, 0.4275462, 1, 1, 1, 1, 1,
1.396313, -2.721995, 1.886067, 1, 1, 1, 1, 1,
1.411012, -0.3584242, 0.4200796, 0, 0, 1, 1, 1,
1.414192, -0.2075846, 1.273405, 1, 0, 0, 1, 1,
1.418145, -0.8244357, 1.792425, 1, 0, 0, 1, 1,
1.423328, 0.3798514, 1.93706, 1, 0, 0, 1, 1,
1.42684, 2.597122, 0.3259003, 1, 0, 0, 1, 1,
1.429722, 1.379756, -1.017125, 1, 0, 0, 1, 1,
1.435919, 1.252466, -0.8667143, 0, 0, 0, 1, 1,
1.442949, 1.320899, 0.5512987, 0, 0, 0, 1, 1,
1.443344, -0.7558386, 2.331711, 0, 0, 0, 1, 1,
1.448168, -0.2214941, 1.660058, 0, 0, 0, 1, 1,
1.453355, 0.7272168, 1.351858, 0, 0, 0, 1, 1,
1.467768, 0.1042764, 0.6554745, 0, 0, 0, 1, 1,
1.485113, -0.6850801, 0.371019, 0, 0, 0, 1, 1,
1.486326, 0.2812519, 1.782582, 1, 1, 1, 1, 1,
1.492453, -0.06251682, 0.9001022, 1, 1, 1, 1, 1,
1.497302, -1.663193, 2.245333, 1, 1, 1, 1, 1,
1.507495, -1.497032, 1.405777, 1, 1, 1, 1, 1,
1.510204, -0.1879044, 1.597704, 1, 1, 1, 1, 1,
1.527901, 0.1078778, 3.081023, 1, 1, 1, 1, 1,
1.54013, -0.4057491, 1.462753, 1, 1, 1, 1, 1,
1.54586, -0.8050917, 0.6465631, 1, 1, 1, 1, 1,
1.558299, 0.0791247, 1.655531, 1, 1, 1, 1, 1,
1.570873, 1.227411, 0.4524278, 1, 1, 1, 1, 1,
1.581125, -0.4490575, 0.4722517, 1, 1, 1, 1, 1,
1.588195, 1.230447, 2.131797, 1, 1, 1, 1, 1,
1.614707, -1.281549, 1.642023, 1, 1, 1, 1, 1,
1.614873, 0.05850323, 1.574946, 1, 1, 1, 1, 1,
1.622084, 0.5483962, 1.81468, 1, 1, 1, 1, 1,
1.638622, 0.4205273, -0.3273596, 0, 0, 1, 1, 1,
1.645789, 0.6038772, 1.185873, 1, 0, 0, 1, 1,
1.653909, -0.222197, 1.733248, 1, 0, 0, 1, 1,
1.668379, -0.4807187, 2.714211, 1, 0, 0, 1, 1,
1.675656, 0.4783754, 1.064123, 1, 0, 0, 1, 1,
1.675907, -0.4532911, -0.004621368, 1, 0, 0, 1, 1,
1.687288, 0.9136601, 3.073203, 0, 0, 0, 1, 1,
1.70313, 0.1550381, 1.423388, 0, 0, 0, 1, 1,
1.707968, -0.02142096, 0.7882551, 0, 0, 0, 1, 1,
1.708096, -0.5072808, 0.9909886, 0, 0, 0, 1, 1,
1.714547, 1.192955, 2.536888, 0, 0, 0, 1, 1,
1.729446, 0.8025929, 0.7350814, 0, 0, 0, 1, 1,
1.733573, -0.3863791, 1.975756, 0, 0, 0, 1, 1,
1.736204, 1.27171, 1.156054, 1, 1, 1, 1, 1,
1.741498, 0.08814804, 2.607433, 1, 1, 1, 1, 1,
1.741565, -0.2678165, 2.194928, 1, 1, 1, 1, 1,
1.743301, 0.06460104, 1.067119, 1, 1, 1, 1, 1,
1.756788, 0.3082762, 1.240025, 1, 1, 1, 1, 1,
1.765474, -0.1408545, 2.599748, 1, 1, 1, 1, 1,
1.789783, 0.2836334, 2.776453, 1, 1, 1, 1, 1,
1.799813, -0.2529788, 0.2660768, 1, 1, 1, 1, 1,
1.811492, 0.4887586, 1.295418, 1, 1, 1, 1, 1,
1.836027, 0.1047027, 1.559469, 1, 1, 1, 1, 1,
1.858284, 0.7695999, 0.9203503, 1, 1, 1, 1, 1,
1.872088, 2.549403, 0.5212207, 1, 1, 1, 1, 1,
1.883682, 1.181302, -0.2459685, 1, 1, 1, 1, 1,
1.906649, -0.5278892, 2.128646, 1, 1, 1, 1, 1,
1.916703, -0.6868969, 3.10632, 1, 1, 1, 1, 1,
1.933201, -0.2237325, 1.794051, 0, 0, 1, 1, 1,
1.949606, 0.1350392, 1.845861, 1, 0, 0, 1, 1,
1.953565, 1.593773, 1.549499, 1, 0, 0, 1, 1,
1.999298, -0.6153085, 0.4019754, 1, 0, 0, 1, 1,
2.144659, -0.256213, 1.89215, 1, 0, 0, 1, 1,
2.181927, -0.2254137, 0.2914774, 1, 0, 0, 1, 1,
2.193419, 1.063548, 1.410412, 0, 0, 0, 1, 1,
2.199028, 1.083335, 0.7643203, 0, 0, 0, 1, 1,
2.214104, 0.3380156, 2.06313, 0, 0, 0, 1, 1,
2.228917, -0.2598326, 1.189667, 0, 0, 0, 1, 1,
2.274527, -1.44715, 1.74982, 0, 0, 0, 1, 1,
2.478245, 0.6274797, 2.915869, 0, 0, 0, 1, 1,
2.520132, -1.735417, 1.906655, 0, 0, 0, 1, 1,
2.542507, 0.4897359, -0.2190024, 1, 1, 1, 1, 1,
2.571075, -0.1204488, 0.7253407, 1, 1, 1, 1, 1,
2.724998, 1.765473, 1.755092, 1, 1, 1, 1, 1,
2.979953, 0.1368216, 0.6239045, 1, 1, 1, 1, 1,
2.99099, -0.06187269, 0.7056661, 1, 1, 1, 1, 1,
3.003336, 0.5490033, 1.654008, 1, 1, 1, 1, 1,
3.012424, -1.600863, 2.386955, 1, 1, 1, 1, 1
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
var radius = 9.710726;
var distance = 34.10852;
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
mvMatrix.translate( 0.03379703, -0.06341982, -0.1361871 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10852);
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