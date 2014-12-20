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
-3.599059, 0.599493, -1.538695, 1, 0, 0, 1,
-3.401835, -0.1914135, -0.9652807, 1, 0.007843138, 0, 1,
-2.847686, -0.2805603, -1.170282, 1, 0.01176471, 0, 1,
-2.814904, 0.3506194, -3.105227, 1, 0.01960784, 0, 1,
-2.734582, -0.5490459, -3.09389, 1, 0.02352941, 0, 1,
-2.690392, -1.585202, -2.705786, 1, 0.03137255, 0, 1,
-2.579891, -0.773926, -2.407522, 1, 0.03529412, 0, 1,
-2.554652, -0.7321742, -1.426084, 1, 0.04313726, 0, 1,
-2.52431, -0.4750809, -1.20338, 1, 0.04705882, 0, 1,
-2.520515, -0.4227135, -1.488689, 1, 0.05490196, 0, 1,
-2.506209, -0.7709187, -2.398971, 1, 0.05882353, 0, 1,
-2.482402, -0.4888309, -1.399113, 1, 0.06666667, 0, 1,
-2.416203, -0.00483407, -0.4681371, 1, 0.07058824, 0, 1,
-2.392133, -0.9544148, -1.044454, 1, 0.07843138, 0, 1,
-2.352773, 0.2652087, -1.75466, 1, 0.08235294, 0, 1,
-2.245385, -1.311209, -1.538027, 1, 0.09019608, 0, 1,
-2.163352, -1.145192, -0.9570906, 1, 0.09411765, 0, 1,
-2.150163, 1.521135, -1.130834, 1, 0.1019608, 0, 1,
-2.149683, -0.1192229, -1.717957, 1, 0.1098039, 0, 1,
-2.113207, -0.4157705, -3.082073, 1, 0.1137255, 0, 1,
-2.09962, 0.2465436, -4.133336, 1, 0.1215686, 0, 1,
-2.076275, 0.6146153, -0.5706252, 1, 0.1254902, 0, 1,
-2.052207, -0.5381791, -0.8576094, 1, 0.1333333, 0, 1,
-2.045249, -0.3755676, -2.253948, 1, 0.1372549, 0, 1,
-2.037553, 0.5860037, -2.579819, 1, 0.145098, 0, 1,
-2.037142, -0.1373066, -1.666604, 1, 0.1490196, 0, 1,
-2.030917, -1.269234, -0.6153775, 1, 0.1568628, 0, 1,
-2.013237, 0.2875753, -1.910376, 1, 0.1607843, 0, 1,
-2.00036, 0.6705806, -0.733497, 1, 0.1686275, 0, 1,
-1.977366, -0.3598416, -2.672928, 1, 0.172549, 0, 1,
-1.954953, -1.770955, -1.950325, 1, 0.1803922, 0, 1,
-1.872105, -0.9099617, -1.677046, 1, 0.1843137, 0, 1,
-1.829024, -1.327593, -0.8912738, 1, 0.1921569, 0, 1,
-1.754754, 0.2618693, -2.059302, 1, 0.1960784, 0, 1,
-1.750035, 0.5769627, -0.189668, 1, 0.2039216, 0, 1,
-1.734527, -0.1198347, -2.644359, 1, 0.2117647, 0, 1,
-1.731446, 0.3707929, -0.8630632, 1, 0.2156863, 0, 1,
-1.719484, -1.128211, -1.275998, 1, 0.2235294, 0, 1,
-1.716895, 0.7050132, -0.3725634, 1, 0.227451, 0, 1,
-1.710881, 0.7757244, -0.3143045, 1, 0.2352941, 0, 1,
-1.704469, 0.1129678, -1.624102, 1, 0.2392157, 0, 1,
-1.691064, -2.23447, -1.408291, 1, 0.2470588, 0, 1,
-1.666064, 1.048284, -0.8657076, 1, 0.2509804, 0, 1,
-1.665302, 0.6936777, 1.029863, 1, 0.2588235, 0, 1,
-1.660315, -0.5482076, -0.6528538, 1, 0.2627451, 0, 1,
-1.647506, -0.6369432, -3.521449, 1, 0.2705882, 0, 1,
-1.633762, -0.7533618, -4.084418, 1, 0.2745098, 0, 1,
-1.626285, 0.5016733, -2.325552, 1, 0.282353, 0, 1,
-1.611204, -0.6227356, -1.790496, 1, 0.2862745, 0, 1,
-1.601698, -0.1082143, -3.338958, 1, 0.2941177, 0, 1,
-1.596265, 0.818134, -2.227807, 1, 0.3019608, 0, 1,
-1.592062, -0.0999679, -2.135111, 1, 0.3058824, 0, 1,
-1.57964, -0.9540871, -3.962156, 1, 0.3137255, 0, 1,
-1.571529, -1.87687, -0.9131891, 1, 0.3176471, 0, 1,
-1.566676, 1.400816, -0.154897, 1, 0.3254902, 0, 1,
-1.550816, -0.2088922, -1.539138, 1, 0.3294118, 0, 1,
-1.544007, -0.06661496, -1.203405, 1, 0.3372549, 0, 1,
-1.540197, 0.1775388, -0.3623909, 1, 0.3411765, 0, 1,
-1.524616, 1.458894, -1.537747, 1, 0.3490196, 0, 1,
-1.523927, -0.5097057, -1.663903, 1, 0.3529412, 0, 1,
-1.515446, -0.3823343, -1.920509, 1, 0.3607843, 0, 1,
-1.502789, -0.2587976, -1.84868, 1, 0.3647059, 0, 1,
-1.498208, -0.722504, -0.9446834, 1, 0.372549, 0, 1,
-1.491137, 1.402148, -0.1471112, 1, 0.3764706, 0, 1,
-1.477058, -0.877413, -2.073326, 1, 0.3843137, 0, 1,
-1.464677, -0.5530429, -1.935921, 1, 0.3882353, 0, 1,
-1.456259, -2.132281, -2.364285, 1, 0.3960784, 0, 1,
-1.451229, -1.41901, -1.764534, 1, 0.4039216, 0, 1,
-1.447635, 0.6597642, -1.439723, 1, 0.4078431, 0, 1,
-1.435259, -0.8063659, -1.673085, 1, 0.4156863, 0, 1,
-1.427299, -0.4802361, -0.3750733, 1, 0.4196078, 0, 1,
-1.422848, 0.8238849, -1.488328, 1, 0.427451, 0, 1,
-1.419487, 1.650463, 0.4816371, 1, 0.4313726, 0, 1,
-1.418483, 1.597119, 1.678822, 1, 0.4392157, 0, 1,
-1.407018, 0.3708565, -1.703968, 1, 0.4431373, 0, 1,
-1.402605, -1.125172, -2.725266, 1, 0.4509804, 0, 1,
-1.397891, 0.9708875, -0.9795604, 1, 0.454902, 0, 1,
-1.390446, -0.06721748, -2.466406, 1, 0.4627451, 0, 1,
-1.38401, -0.5353947, -2.175788, 1, 0.4666667, 0, 1,
-1.38386, -0.4194523, -1.42105, 1, 0.4745098, 0, 1,
-1.3597, -0.1643203, -3.212298, 1, 0.4784314, 0, 1,
-1.353808, 2.076241, -2.661072, 1, 0.4862745, 0, 1,
-1.349697, -1.757011, -3.854517, 1, 0.4901961, 0, 1,
-1.347308, 0.3437103, 1.175341, 1, 0.4980392, 0, 1,
-1.344113, -0.06959775, -3.648708, 1, 0.5058824, 0, 1,
-1.338481, -0.625542, -3.114811, 1, 0.509804, 0, 1,
-1.337886, 1.133863, -1.954692, 1, 0.5176471, 0, 1,
-1.333642, 1.809344, -0.6121172, 1, 0.5215687, 0, 1,
-1.332162, -0.2063681, -3.10085, 1, 0.5294118, 0, 1,
-1.328237, 1.460416, -0.912897, 1, 0.5333334, 0, 1,
-1.325028, 0.0260585, -0.2411402, 1, 0.5411765, 0, 1,
-1.322881, -0.7742358, -2.919751, 1, 0.5450981, 0, 1,
-1.313803, -2.134923, -2.991532, 1, 0.5529412, 0, 1,
-1.312687, -0.1729927, -2.640672, 1, 0.5568628, 0, 1,
-1.310975, 0.7798058, -0.008544478, 1, 0.5647059, 0, 1,
-1.295111, 1.324643, -2.156904, 1, 0.5686275, 0, 1,
-1.293154, -0.1886681, -2.869284, 1, 0.5764706, 0, 1,
-1.290758, -0.7785894, -1.062716, 1, 0.5803922, 0, 1,
-1.285183, -2.032992, -3.48267, 1, 0.5882353, 0, 1,
-1.284116, -0.4232201, -1.897909, 1, 0.5921569, 0, 1,
-1.279074, -1.812613, -1.508773, 1, 0.6, 0, 1,
-1.277429, -1.188707, -1.799976, 1, 0.6078432, 0, 1,
-1.274677, -1.564618, -2.753875, 1, 0.6117647, 0, 1,
-1.274253, -1.502156, -2.497391, 1, 0.6196079, 0, 1,
-1.268654, 2.04263, 0.06235483, 1, 0.6235294, 0, 1,
-1.265057, 0.7335151, -0.891979, 1, 0.6313726, 0, 1,
-1.263797, -0.2779635, -1.623532, 1, 0.6352941, 0, 1,
-1.262139, -0.4535997, -1.392134, 1, 0.6431373, 0, 1,
-1.257701, -0.987842, -1.948013, 1, 0.6470588, 0, 1,
-1.255657, 0.5881128, -1.233044, 1, 0.654902, 0, 1,
-1.255331, 2.309119, -1.818319, 1, 0.6588235, 0, 1,
-1.252463, -0.4403286, -3.566911, 1, 0.6666667, 0, 1,
-1.251031, 0.1126022, -1.577484, 1, 0.6705883, 0, 1,
-1.244675, 0.3453069, -0.4010796, 1, 0.6784314, 0, 1,
-1.236924, 1.240471, -0.5790403, 1, 0.682353, 0, 1,
-1.22969, 0.3062153, -0.2510372, 1, 0.6901961, 0, 1,
-1.229589, 0.7114956, 0.4305145, 1, 0.6941177, 0, 1,
-1.229095, 0.3406368, -0.6931959, 1, 0.7019608, 0, 1,
-1.22207, 1.506421, -0.5827923, 1, 0.7098039, 0, 1,
-1.213868, 0.0006468467, -0.399296, 1, 0.7137255, 0, 1,
-1.201366, 0.8507488, -0.5017388, 1, 0.7215686, 0, 1,
-1.200284, -0.1972856, -2.078228, 1, 0.7254902, 0, 1,
-1.195098, -1.419172, -2.225532, 1, 0.7333333, 0, 1,
-1.192669, 0.481625, -0.8397986, 1, 0.7372549, 0, 1,
-1.192375, -0.3484858, -0.5876331, 1, 0.7450981, 0, 1,
-1.187134, -0.2913859, -2.948524, 1, 0.7490196, 0, 1,
-1.173881, 1.558259, -1.979485, 1, 0.7568628, 0, 1,
-1.170987, 1.859677, 0.4278214, 1, 0.7607843, 0, 1,
-1.166301, 0.2741683, -1.840036, 1, 0.7686275, 0, 1,
-1.15809, 0.2136851, -1.986891, 1, 0.772549, 0, 1,
-1.154585, -0.06931313, -1.564986, 1, 0.7803922, 0, 1,
-1.152708, -0.8790379, -2.030824, 1, 0.7843137, 0, 1,
-1.151604, -0.4283471, -2.462534, 1, 0.7921569, 0, 1,
-1.150306, -1.142478, -0.7947272, 1, 0.7960784, 0, 1,
-1.135834, 0.6727796, -0.6151294, 1, 0.8039216, 0, 1,
-1.134084, 2.401953, -1.756914, 1, 0.8117647, 0, 1,
-1.131796, 0.3551141, -0.944154, 1, 0.8156863, 0, 1,
-1.13137, -1.195085, -1.744628, 1, 0.8235294, 0, 1,
-1.13006, 1.461979, -1.045522, 1, 0.827451, 0, 1,
-1.129928, -0.4022145, -1.347211, 1, 0.8352941, 0, 1,
-1.122736, 0.7242836, -1.352626, 1, 0.8392157, 0, 1,
-1.119937, 0.5896654, -1.351385, 1, 0.8470588, 0, 1,
-1.113031, 1.27793, -0.2940302, 1, 0.8509804, 0, 1,
-1.108562, 0.5348796, -1.256628, 1, 0.8588235, 0, 1,
-1.104011, 2.022602, 1.049136, 1, 0.8627451, 0, 1,
-1.10295, 0.5642102, -2.34077, 1, 0.8705882, 0, 1,
-1.098738, -1.668151, -1.852474, 1, 0.8745098, 0, 1,
-1.097834, -0.6097788, -0.6139694, 1, 0.8823529, 0, 1,
-1.093043, -1.225672, -2.356231, 1, 0.8862745, 0, 1,
-1.091319, -0.2986202, -1.729634, 1, 0.8941177, 0, 1,
-1.087729, 1.444659, -0.3333804, 1, 0.8980392, 0, 1,
-1.087494, 0.2166124, -0.7437345, 1, 0.9058824, 0, 1,
-1.086008, -1.160771, -1.77552, 1, 0.9137255, 0, 1,
-1.085357, -1.570589, -0.7500543, 1, 0.9176471, 0, 1,
-1.085311, 1.189931, 0.1475884, 1, 0.9254902, 0, 1,
-1.084568, 1.345592, -2.279154, 1, 0.9294118, 0, 1,
-1.075871, 0.3507647, 0.3974038, 1, 0.9372549, 0, 1,
-1.069523, 0.4591645, -0.3688613, 1, 0.9411765, 0, 1,
-1.066784, 1.605913, 0.4615804, 1, 0.9490196, 0, 1,
-1.064576, 0.4925862, -2.335562, 1, 0.9529412, 0, 1,
-1.060422, 0.04685583, -1.155815, 1, 0.9607843, 0, 1,
-1.057802, 0.9327325, -0.4766408, 1, 0.9647059, 0, 1,
-1.057773, 0.5807561, -2.983019, 1, 0.972549, 0, 1,
-1.054445, -0.1043745, -0.7293627, 1, 0.9764706, 0, 1,
-1.043512, -1.916508, -2.080619, 1, 0.9843137, 0, 1,
-1.038978, -1.277467, -1.712031, 1, 0.9882353, 0, 1,
-1.036084, 2.517642, 0.1627005, 1, 0.9960784, 0, 1,
-1.031337, -1.050682, -2.992382, 0.9960784, 1, 0, 1,
-1.030915, 0.4146211, -0.9489923, 0.9921569, 1, 0, 1,
-1.029034, -0.5262807, -3.767323, 0.9843137, 1, 0, 1,
-1.025919, 1.135153, 0.1833041, 0.9803922, 1, 0, 1,
-1.025914, -0.8242084, -2.006232, 0.972549, 1, 0, 1,
-1.01423, 0.5837396, -1.595236, 0.9686275, 1, 0, 1,
-1.009975, 0.4630772, -0.3865549, 0.9607843, 1, 0, 1,
-1.003678, -0.2490481, -1.997237, 0.9568627, 1, 0, 1,
-0.999381, 0.6816817, -2.601455, 0.9490196, 1, 0, 1,
-0.9984877, -0.6461865, -3.893008, 0.945098, 1, 0, 1,
-0.9977408, 0.4472515, -0.8902516, 0.9372549, 1, 0, 1,
-0.9934759, -1.32445, -3.145741, 0.9333333, 1, 0, 1,
-0.9903582, -0.7333394, -1.466027, 0.9254902, 1, 0, 1,
-0.9902749, -1.158824, -4.158347, 0.9215686, 1, 0, 1,
-0.985026, -0.6821141, -2.506637, 0.9137255, 1, 0, 1,
-0.9783583, 1.276929, 1.371794, 0.9098039, 1, 0, 1,
-0.9770952, -1.405747, -3.110823, 0.9019608, 1, 0, 1,
-0.9737218, -0.1330497, -0.8091193, 0.8941177, 1, 0, 1,
-0.9657667, 0.4275866, -2.229189, 0.8901961, 1, 0, 1,
-0.9639392, -0.1059813, -2.717329, 0.8823529, 1, 0, 1,
-0.9601803, -0.3632351, -1.117861, 0.8784314, 1, 0, 1,
-0.9536464, 0.9862238, -0.2126944, 0.8705882, 1, 0, 1,
-0.9477468, 0.8793654, -0.351555, 0.8666667, 1, 0, 1,
-0.9451779, -0.1056286, -0.3582772, 0.8588235, 1, 0, 1,
-0.9425693, 0.8034891, -0.2498569, 0.854902, 1, 0, 1,
-0.9421328, 0.1319036, -2.724527, 0.8470588, 1, 0, 1,
-0.9416681, 0.7098548, -0.03501112, 0.8431373, 1, 0, 1,
-0.9262956, 0.1210065, -1.09744, 0.8352941, 1, 0, 1,
-0.9235418, 0.269262, -1.715626, 0.8313726, 1, 0, 1,
-0.9197801, -0.7746281, -0.9053755, 0.8235294, 1, 0, 1,
-0.9186544, 1.194358, -1.182866, 0.8196079, 1, 0, 1,
-0.9167988, -0.1191722, -0.9385067, 0.8117647, 1, 0, 1,
-0.9158931, -0.5016938, -2.921489, 0.8078431, 1, 0, 1,
-0.9125697, 1.068263, -1.610638, 0.8, 1, 0, 1,
-0.9119499, -2.092273, -1.661197, 0.7921569, 1, 0, 1,
-0.9065023, 0.2078523, -0.2205797, 0.7882353, 1, 0, 1,
-0.9041046, 0.8121226, -0.3864104, 0.7803922, 1, 0, 1,
-0.899514, -2.122492, -1.721562, 0.7764706, 1, 0, 1,
-0.895234, -0.6611879, -2.559248, 0.7686275, 1, 0, 1,
-0.8915529, -0.4864851, -2.053765, 0.7647059, 1, 0, 1,
-0.8894765, -0.6321998, -2.223978, 0.7568628, 1, 0, 1,
-0.88843, 0.8334392, -1.641767, 0.7529412, 1, 0, 1,
-0.8873389, 0.4106806, 0.08524557, 0.7450981, 1, 0, 1,
-0.8829622, 1.148185, -0.300285, 0.7411765, 1, 0, 1,
-0.8748573, -1.603728, -2.977323, 0.7333333, 1, 0, 1,
-0.872317, 2.156493, 0.04581498, 0.7294118, 1, 0, 1,
-0.8680534, -0.1080387, -0.3818299, 0.7215686, 1, 0, 1,
-0.8654644, 0.5169859, -0.7679916, 0.7176471, 1, 0, 1,
-0.8527374, -2.061113, -2.268011, 0.7098039, 1, 0, 1,
-0.8375289, -0.3727581, -1.847335, 0.7058824, 1, 0, 1,
-0.8338135, 0.3492936, 0.2097299, 0.6980392, 1, 0, 1,
-0.8327165, -0.01134662, -1.737608, 0.6901961, 1, 0, 1,
-0.8326046, -1.780011, -3.456096, 0.6862745, 1, 0, 1,
-0.82056, -0.04315566, -0.7196835, 0.6784314, 1, 0, 1,
-0.8198735, -0.3898448, -3.647668, 0.6745098, 1, 0, 1,
-0.8184283, 0.7462598, -1.375407, 0.6666667, 1, 0, 1,
-0.8150316, -1.602689, -2.302145, 0.6627451, 1, 0, 1,
-0.8150254, -1.135849, -2.177112, 0.654902, 1, 0, 1,
-0.8142006, -1.10431, -1.514383, 0.6509804, 1, 0, 1,
-0.8093485, -0.2077698, -2.687018, 0.6431373, 1, 0, 1,
-0.8028036, 1.086398, -0.2711926, 0.6392157, 1, 0, 1,
-0.8003225, -1.025773, -1.55957, 0.6313726, 1, 0, 1,
-0.7991784, -0.9559319, 0.9735172, 0.627451, 1, 0, 1,
-0.7932407, -2.72434, -2.242574, 0.6196079, 1, 0, 1,
-0.7866939, 0.1692485, -2.355207, 0.6156863, 1, 0, 1,
-0.7851341, 0.3294401, -0.02583763, 0.6078432, 1, 0, 1,
-0.7773124, 2.299465, -0.9488011, 0.6039216, 1, 0, 1,
-0.7746615, -0.1686369, -0.9127373, 0.5960785, 1, 0, 1,
-0.7724911, -2.433059, -4.047117, 0.5882353, 1, 0, 1,
-0.768883, -0.1239578, -1.634636, 0.5843138, 1, 0, 1,
-0.7661673, 0.00749872, -0.7621784, 0.5764706, 1, 0, 1,
-0.7653709, 2.082225, -0.4291793, 0.572549, 1, 0, 1,
-0.7612128, 0.2740358, -1.957127, 0.5647059, 1, 0, 1,
-0.7587309, -0.3025428, -2.483432, 0.5607843, 1, 0, 1,
-0.7575896, -0.2702506, -4.467464, 0.5529412, 1, 0, 1,
-0.7493938, 0.1440221, 2.237936, 0.5490196, 1, 0, 1,
-0.7478087, -0.07439046, -2.492051, 0.5411765, 1, 0, 1,
-0.7444398, -1.468731, -1.413962, 0.5372549, 1, 0, 1,
-0.7405654, -0.8543665, -3.667902, 0.5294118, 1, 0, 1,
-0.7404569, 1.433543, 0.4533892, 0.5254902, 1, 0, 1,
-0.7339296, -0.09510109, -1.331284, 0.5176471, 1, 0, 1,
-0.7337171, 0.3568162, -2.750921, 0.5137255, 1, 0, 1,
-0.7333205, 1.00119, 0.2953628, 0.5058824, 1, 0, 1,
-0.728516, -0.618746, -2.682726, 0.5019608, 1, 0, 1,
-0.7248576, 0.5360856, -0.7163126, 0.4941176, 1, 0, 1,
-0.7164481, 0.03172857, -1.374517, 0.4862745, 1, 0, 1,
-0.7106402, 0.1640084, -0.6979781, 0.4823529, 1, 0, 1,
-0.7005148, -0.5061371, -4.378738, 0.4745098, 1, 0, 1,
-0.6995176, 2.089372, -2.231546, 0.4705882, 1, 0, 1,
-0.6975366, -0.8710968, -1.445064, 0.4627451, 1, 0, 1,
-0.6956057, 1.332562, -0.7123501, 0.4588235, 1, 0, 1,
-0.6933624, -1.590703, -3.378308, 0.4509804, 1, 0, 1,
-0.6921398, 0.9862749, -0.1716433, 0.4470588, 1, 0, 1,
-0.6856394, 0.04911078, -0.6227368, 0.4392157, 1, 0, 1,
-0.6849663, 0.1885802, -0.9626903, 0.4352941, 1, 0, 1,
-0.6807253, -1.260922, -2.366063, 0.427451, 1, 0, 1,
-0.6798515, -0.5924612, -2.947304, 0.4235294, 1, 0, 1,
-0.6758359, 0.7580259, -1.497772, 0.4156863, 1, 0, 1,
-0.6722426, 0.3359636, -1.163883, 0.4117647, 1, 0, 1,
-0.6693389, -1.932275, -4.128749, 0.4039216, 1, 0, 1,
-0.6661578, 0.2064655, -1.609512, 0.3960784, 1, 0, 1,
-0.6592839, 1.537889, -0.7105626, 0.3921569, 1, 0, 1,
-0.6591404, -0.6116464, -2.450218, 0.3843137, 1, 0, 1,
-0.6558324, -0.7832417, -2.415209, 0.3803922, 1, 0, 1,
-0.6527548, 0.3674618, -2.762756, 0.372549, 1, 0, 1,
-0.6510225, 0.2882917, -3.568737, 0.3686275, 1, 0, 1,
-0.6443222, 0.3128608, -1.575586, 0.3607843, 1, 0, 1,
-0.6418252, -0.8910377, -2.280903, 0.3568628, 1, 0, 1,
-0.6403922, 0.3034484, 0.2691101, 0.3490196, 1, 0, 1,
-0.6400493, 1.776973, -1.374928, 0.345098, 1, 0, 1,
-0.6378595, -0.1230637, -3.225565, 0.3372549, 1, 0, 1,
-0.6334299, 0.06233273, -2.32807, 0.3333333, 1, 0, 1,
-0.6330209, 0.4962963, -0.4195805, 0.3254902, 1, 0, 1,
-0.6256366, -0.8007913, -2.576329, 0.3215686, 1, 0, 1,
-0.6244481, -0.7096753, -3.902199, 0.3137255, 1, 0, 1,
-0.6237378, -0.8426295, -2.930459, 0.3098039, 1, 0, 1,
-0.6231588, -1.350356, -4.776424, 0.3019608, 1, 0, 1,
-0.6230117, -0.7815005, -2.699492, 0.2941177, 1, 0, 1,
-0.6220574, 0.9383217, 0.2677019, 0.2901961, 1, 0, 1,
-0.6167824, 0.621979, 0.6504625, 0.282353, 1, 0, 1,
-0.6133391, -0.7703107, -1.215354, 0.2784314, 1, 0, 1,
-0.6127805, 0.1528644, -2.155814, 0.2705882, 1, 0, 1,
-0.6111342, 1.765876, -0.397444, 0.2666667, 1, 0, 1,
-0.6105067, -0.7603323, -1.950105, 0.2588235, 1, 0, 1,
-0.6100098, 1.611487, -0.3329597, 0.254902, 1, 0, 1,
-0.6096428, 1.019309, 1.634129, 0.2470588, 1, 0, 1,
-0.6090134, -0.909678, -2.860953, 0.2431373, 1, 0, 1,
-0.6036115, 0.024243, -2.322561, 0.2352941, 1, 0, 1,
-0.5954686, -0.3798392, -3.764362, 0.2313726, 1, 0, 1,
-0.5934051, 0.9284021, -1.651037, 0.2235294, 1, 0, 1,
-0.5931845, -0.910184, -2.053985, 0.2196078, 1, 0, 1,
-0.5906187, -0.2756349, -3.819798, 0.2117647, 1, 0, 1,
-0.5899119, 1.080376, -2.081754, 0.2078431, 1, 0, 1,
-0.5849054, 0.6927876, 0.2289625, 0.2, 1, 0, 1,
-0.5830531, -0.6445267, -2.511959, 0.1921569, 1, 0, 1,
-0.5744444, -0.7465564, -1.950979, 0.1882353, 1, 0, 1,
-0.5740029, -0.8921224, -2.555294, 0.1803922, 1, 0, 1,
-0.5704833, -1.24332, -2.37253, 0.1764706, 1, 0, 1,
-0.5645998, -1.323014, -4.72872, 0.1686275, 1, 0, 1,
-0.5622737, -2.336506, -2.006685, 0.1647059, 1, 0, 1,
-0.562253, 0.3921921, 0.8286573, 0.1568628, 1, 0, 1,
-0.5621166, -0.5858754, -1.175001, 0.1529412, 1, 0, 1,
-0.5618021, -1.151996, -3.937325, 0.145098, 1, 0, 1,
-0.5605164, 0.4918205, -0.7089561, 0.1411765, 1, 0, 1,
-0.5572825, -0.4003497, -0.3802838, 0.1333333, 1, 0, 1,
-0.5527065, 0.6883527, -0.8714983, 0.1294118, 1, 0, 1,
-0.5522932, 0.670027, -1.500478, 0.1215686, 1, 0, 1,
-0.5503246, 0.5382051, -1.540979, 0.1176471, 1, 0, 1,
-0.5492952, 0.6446217, 0.7847666, 0.1098039, 1, 0, 1,
-0.5478607, 0.3142357, -1.12142, 0.1058824, 1, 0, 1,
-0.5445374, -0.04757399, -2.597355, 0.09803922, 1, 0, 1,
-0.5426218, -0.02160613, -0.7233086, 0.09019608, 1, 0, 1,
-0.5413455, 0.5787602, -0.3956375, 0.08627451, 1, 0, 1,
-0.5362641, 0.4179048, -1.59193, 0.07843138, 1, 0, 1,
-0.5362123, 0.04858175, -0.6563184, 0.07450981, 1, 0, 1,
-0.5343949, -1.111889, -2.902283, 0.06666667, 1, 0, 1,
-0.5323246, -0.04885175, -2.346916, 0.0627451, 1, 0, 1,
-0.5243841, -0.9810387, -3.984332, 0.05490196, 1, 0, 1,
-0.5223399, -0.9577623, -3.64273, 0.05098039, 1, 0, 1,
-0.5191044, -0.5950949, -1.535052, 0.04313726, 1, 0, 1,
-0.518214, 0.3072326, -0.2730412, 0.03921569, 1, 0, 1,
-0.5179307, -1.163152, -4.233974, 0.03137255, 1, 0, 1,
-0.5166919, 0.4375662, -1.373188, 0.02745098, 1, 0, 1,
-0.5159443, -0.1192082, -2.991949, 0.01960784, 1, 0, 1,
-0.5148116, -1.345536, -4.01823, 0.01568628, 1, 0, 1,
-0.5109072, 0.7124744, -2.037315, 0.007843138, 1, 0, 1,
-0.5068104, -0.3694601, -1.504147, 0.003921569, 1, 0, 1,
-0.5049088, -1.312961, -4.181688, 0, 1, 0.003921569, 1,
-0.5028241, -0.9801963, -3.364854, 0, 1, 0.01176471, 1,
-0.5016707, 1.841514, 0.09535614, 0, 1, 0.01568628, 1,
-0.4959015, -0.4035426, -3.074885, 0, 1, 0.02352941, 1,
-0.4930027, 1.272028, 0.5352538, 0, 1, 0.02745098, 1,
-0.4922272, 0.520734, -0.6760071, 0, 1, 0.03529412, 1,
-0.4871035, 0.4017767, -0.524343, 0, 1, 0.03921569, 1,
-0.4774123, 0.6827247, -1.824502, 0, 1, 0.04705882, 1,
-0.4752961, -0.4763696, -3.738029, 0, 1, 0.05098039, 1,
-0.4744371, -1.494205, -2.243345, 0, 1, 0.05882353, 1,
-0.4744335, -1.289851, -3.199348, 0, 1, 0.0627451, 1,
-0.47031, 1.187043, 0.7294528, 0, 1, 0.07058824, 1,
-0.4655725, -0.8759277, -1.683853, 0, 1, 0.07450981, 1,
-0.4623607, -0.04085213, -1.627446, 0, 1, 0.08235294, 1,
-0.4569138, 0.02038133, -2.456018, 0, 1, 0.08627451, 1,
-0.4560813, -0.7702509, -2.482608, 0, 1, 0.09411765, 1,
-0.4542995, 1.281423, 0.6875873, 0, 1, 0.1019608, 1,
-0.4525336, 1.359953, -1.343153, 0, 1, 0.1058824, 1,
-0.4503571, 0.2433895, -2.577388, 0, 1, 0.1137255, 1,
-0.4488832, 1.209254, -0.9785237, 0, 1, 0.1176471, 1,
-0.4459538, 1.078266, 0.3442341, 0, 1, 0.1254902, 1,
-0.4382985, 1.594081, -0.151992, 0, 1, 0.1294118, 1,
-0.4370007, -0.5956823, -4.028396, 0, 1, 0.1372549, 1,
-0.4345195, -0.1004858, -1.045324, 0, 1, 0.1411765, 1,
-0.4343992, -0.391553, -4.378848, 0, 1, 0.1490196, 1,
-0.4308491, -1.008086, -1.617162, 0, 1, 0.1529412, 1,
-0.4283718, 1.032401, -0.3634676, 0, 1, 0.1607843, 1,
-0.4156739, 0.9366198, -1.148673, 0, 1, 0.1647059, 1,
-0.4108704, 1.565258, -1.406805, 0, 1, 0.172549, 1,
-0.4081839, 0.472924, -0.659545, 0, 1, 0.1764706, 1,
-0.4027123, -0.817847, -2.768658, 0, 1, 0.1843137, 1,
-0.3937359, 0.3508181, -0.9072298, 0, 1, 0.1882353, 1,
-0.3906986, 0.1261634, -1.670776, 0, 1, 0.1960784, 1,
-0.3859828, 0.4263963, -0.3990018, 0, 1, 0.2039216, 1,
-0.3791441, -0.8307261, -3.055875, 0, 1, 0.2078431, 1,
-0.3781472, -0.190655, -1.410142, 0, 1, 0.2156863, 1,
-0.3753853, -1.019228, -2.061281, 0, 1, 0.2196078, 1,
-0.3752916, -0.6083374, -4.794329, 0, 1, 0.227451, 1,
-0.375037, -2.810155, -1.652361, 0, 1, 0.2313726, 1,
-0.3749634, 1.307214, -0.680716, 0, 1, 0.2392157, 1,
-0.3739488, 0.131514, -0.8789871, 0, 1, 0.2431373, 1,
-0.3729692, 0.1521078, 0.3259125, 0, 1, 0.2509804, 1,
-0.3722639, 0.3742233, -1.986066, 0, 1, 0.254902, 1,
-0.3710465, -0.822746, -1.849607, 0, 1, 0.2627451, 1,
-0.3703244, 0.9837922, -0.06311364, 0, 1, 0.2666667, 1,
-0.3677943, 0.09879749, -0.7932969, 0, 1, 0.2745098, 1,
-0.3652025, 1.617024, -0.8401325, 0, 1, 0.2784314, 1,
-0.3627405, 0.772892, -0.691263, 0, 1, 0.2862745, 1,
-0.3610202, 2.073562, 0.6283895, 0, 1, 0.2901961, 1,
-0.3607657, 0.108072, -1.880777, 0, 1, 0.2980392, 1,
-0.3599958, 1.09484, 0.6770594, 0, 1, 0.3058824, 1,
-0.3586361, -0.5572429, -1.108422, 0, 1, 0.3098039, 1,
-0.3534745, -0.6425296, -0.2826647, 0, 1, 0.3176471, 1,
-0.3494558, 0.2362441, -0.7719195, 0, 1, 0.3215686, 1,
-0.3431118, -0.2922477, -3.029216, 0, 1, 0.3294118, 1,
-0.3388861, -2.165864, -1.547909, 0, 1, 0.3333333, 1,
-0.3356834, -0.8106572, -2.428061, 0, 1, 0.3411765, 1,
-0.3205573, -0.4125979, -1.153624, 0, 1, 0.345098, 1,
-0.3173158, -0.3080335, -0.4094217, 0, 1, 0.3529412, 1,
-0.3172575, -0.6207316, -3.151641, 0, 1, 0.3568628, 1,
-0.3133667, 0.5722537, 0.9240816, 0, 1, 0.3647059, 1,
-0.3102965, -0.7574886, -2.780924, 0, 1, 0.3686275, 1,
-0.307525, -0.5547932, -3.187533, 0, 1, 0.3764706, 1,
-0.3072964, 0.4590066, -2.30269, 0, 1, 0.3803922, 1,
-0.3062512, -1.201921, -2.223989, 0, 1, 0.3882353, 1,
-0.2912126, -0.3204766, -3.471749, 0, 1, 0.3921569, 1,
-0.2904246, -2.818675, -3.330901, 0, 1, 0.4, 1,
-0.2877125, -1.099611, -2.507476, 0, 1, 0.4078431, 1,
-0.2836235, 0.4215556, -0.8023494, 0, 1, 0.4117647, 1,
-0.2766687, -1.716039, -4.385082, 0, 1, 0.4196078, 1,
-0.2752987, -0.9094811, -2.257872, 0, 1, 0.4235294, 1,
-0.2740333, -0.9231911, -3.550683, 0, 1, 0.4313726, 1,
-0.2732277, -0.9300179, -2.579155, 0, 1, 0.4352941, 1,
-0.2696947, -1.087239, -3.159919, 0, 1, 0.4431373, 1,
-0.2683508, 0.5708269, -1.064686, 0, 1, 0.4470588, 1,
-0.2676174, -0.7462341, -4.229573, 0, 1, 0.454902, 1,
-0.2667638, 0.2248177, 0.1100073, 0, 1, 0.4588235, 1,
-0.2656668, -1.209625, -2.41817, 0, 1, 0.4666667, 1,
-0.2629843, -2.40089, -2.879369, 0, 1, 0.4705882, 1,
-0.2590906, 1.070083, -0.167163, 0, 1, 0.4784314, 1,
-0.2517758, -0.8624895, -0.8440143, 0, 1, 0.4823529, 1,
-0.2473567, -1.904217, -3.033669, 0, 1, 0.4901961, 1,
-0.2445988, -0.319263, -3.734661, 0, 1, 0.4941176, 1,
-0.2441331, 0.3838696, -2.54031, 0, 1, 0.5019608, 1,
-0.2437164, -0.3363109, -2.573193, 0, 1, 0.509804, 1,
-0.2422313, -0.9222057, -3.316478, 0, 1, 0.5137255, 1,
-0.2409361, -1.466392, -2.751129, 0, 1, 0.5215687, 1,
-0.2363238, -0.1673542, -2.912458, 0, 1, 0.5254902, 1,
-0.2304606, 1.179176, -1.484481, 0, 1, 0.5333334, 1,
-0.2285646, 1.637924, -0.09939662, 0, 1, 0.5372549, 1,
-0.2263275, -1.08542, -3.259044, 0, 1, 0.5450981, 1,
-0.2225546, 1.026588, 1.17224, 0, 1, 0.5490196, 1,
-0.22136, -0.1701271, -3.108201, 0, 1, 0.5568628, 1,
-0.2181494, 0.7674382, -1.675896, 0, 1, 0.5607843, 1,
-0.2153292, 1.290783, -0.1106186, 0, 1, 0.5686275, 1,
-0.214394, 0.1584082, 0.3457263, 0, 1, 0.572549, 1,
-0.2118751, -1.138186, -3.98611, 0, 1, 0.5803922, 1,
-0.2016309, 0.8096249, -0.03058565, 0, 1, 0.5843138, 1,
-0.1998699, -0.7363502, -3.908304, 0, 1, 0.5921569, 1,
-0.1981071, 0.5233182, -0.2867441, 0, 1, 0.5960785, 1,
-0.1958046, -1.781357, -1.259606, 0, 1, 0.6039216, 1,
-0.1920178, -1.020924, -3.012632, 0, 1, 0.6117647, 1,
-0.1918794, -1.221769, -2.644851, 0, 1, 0.6156863, 1,
-0.1917657, -0.7288863, -3.45438, 0, 1, 0.6235294, 1,
-0.1909422, 0.7425891, -1.892209, 0, 1, 0.627451, 1,
-0.1907374, -0.6832583, -3.858785, 0, 1, 0.6352941, 1,
-0.1819249, -0.4414375, -3.11948, 0, 1, 0.6392157, 1,
-0.1776012, -0.2311884, -2.882766, 0, 1, 0.6470588, 1,
-0.1728066, 0.4822883, -0.2389657, 0, 1, 0.6509804, 1,
-0.1726651, -0.3609441, -3.544046, 0, 1, 0.6588235, 1,
-0.1675737, -0.985781, -1.739498, 0, 1, 0.6627451, 1,
-0.1672121, -1.212585, -4.645837, 0, 1, 0.6705883, 1,
-0.1661417, 0.9265769, 0.5127746, 0, 1, 0.6745098, 1,
-0.1624604, -0.4512023, -3.746356, 0, 1, 0.682353, 1,
-0.1620879, 0.7374414, -2.026489, 0, 1, 0.6862745, 1,
-0.1615258, -1.095, -3.231899, 0, 1, 0.6941177, 1,
-0.1605714, 0.3234129, -0.05774434, 0, 1, 0.7019608, 1,
-0.154744, 0.1158197, -0.5969982, 0, 1, 0.7058824, 1,
-0.1547094, 1.901112, -0.8349565, 0, 1, 0.7137255, 1,
-0.152313, -1.869045, -3.103156, 0, 1, 0.7176471, 1,
-0.1500792, -0.6873336, -2.056953, 0, 1, 0.7254902, 1,
-0.1478555, -2.429252, -1.088863, 0, 1, 0.7294118, 1,
-0.1428829, 1.995805, 0.5309855, 0, 1, 0.7372549, 1,
-0.1416043, -0.2479147, -1.73382, 0, 1, 0.7411765, 1,
-0.1365902, -0.2509192, -2.603248, 0, 1, 0.7490196, 1,
-0.1362301, -1.004767, -4.85732, 0, 1, 0.7529412, 1,
-0.1349234, -0.6442266, -4.043983, 0, 1, 0.7607843, 1,
-0.1338491, -0.6683739, -3.402887, 0, 1, 0.7647059, 1,
-0.1330785, -0.8854337, -4.273635, 0, 1, 0.772549, 1,
-0.1286559, -0.6863355, -3.049986, 0, 1, 0.7764706, 1,
-0.1277877, -1.994975, -2.899107, 0, 1, 0.7843137, 1,
-0.1229226, -0.2424256, -3.42133, 0, 1, 0.7882353, 1,
-0.1228354, 0.5198084, -1.597137, 0, 1, 0.7960784, 1,
-0.122502, 0.6151978, -0.636484, 0, 1, 0.8039216, 1,
-0.1197185, -1.005037, -4.541519, 0, 1, 0.8078431, 1,
-0.1159146, 0.4019382, -0.2796189, 0, 1, 0.8156863, 1,
-0.1157096, -0.4359113, -3.044418, 0, 1, 0.8196079, 1,
-0.1132921, 1.359132, -0.6328333, 0, 1, 0.827451, 1,
-0.1118977, -0.4384219, -3.515651, 0, 1, 0.8313726, 1,
-0.1110895, -0.8937187, -4.066364, 0, 1, 0.8392157, 1,
-0.1091487, -0.7815177, -4.260144, 0, 1, 0.8431373, 1,
-0.1088749, 0.6377599, -0.756465, 0, 1, 0.8509804, 1,
-0.1049347, 1.223871, -0.1743495, 0, 1, 0.854902, 1,
-0.1009298, 1.434611, -0.1307711, 0, 1, 0.8627451, 1,
-0.09873766, 1.023851, -0.6048685, 0, 1, 0.8666667, 1,
-0.09686521, -0.6397079, -3.621063, 0, 1, 0.8745098, 1,
-0.09667034, -0.08716106, -3.143114, 0, 1, 0.8784314, 1,
-0.09502088, -0.5507694, -4.426092, 0, 1, 0.8862745, 1,
-0.09213392, 0.8524107, -1.319413, 0, 1, 0.8901961, 1,
-0.09169992, -2.186337, -4.107228, 0, 1, 0.8980392, 1,
-0.07970253, 1.513746, 0.4940669, 0, 1, 0.9058824, 1,
-0.07822462, 0.2807962, 1.61525, 0, 1, 0.9098039, 1,
-0.0744889, 0.8326333, -0.4771661, 0, 1, 0.9176471, 1,
-0.07078588, 1.585152, 0.2597007, 0, 1, 0.9215686, 1,
-0.06948379, 0.4141268, 0.526008, 0, 1, 0.9294118, 1,
-0.06930608, 0.3390103, -0.9110441, 0, 1, 0.9333333, 1,
-0.06383869, -0.3728566, -3.329144, 0, 1, 0.9411765, 1,
-0.06183133, 0.3054995, 0.0511991, 0, 1, 0.945098, 1,
-0.06131622, -0.6317227, -2.847919, 0, 1, 0.9529412, 1,
-0.05653942, -0.009015783, -3.561631, 0, 1, 0.9568627, 1,
-0.05043995, -0.3247501, -0.5249727, 0, 1, 0.9647059, 1,
-0.04780531, -1.179883, -3.738778, 0, 1, 0.9686275, 1,
-0.04503408, -0.8355569, -4.395238, 0, 1, 0.9764706, 1,
-0.03557216, 1.096261, 1.403548, 0, 1, 0.9803922, 1,
-0.03161927, 0.2048932, 0.870887, 0, 1, 0.9882353, 1,
-0.03072169, 0.9253268, 0.1436719, 0, 1, 0.9921569, 1,
-0.02979641, -0.4825121, -2.462488, 0, 1, 1, 1,
-0.02898143, -0.09371106, -3.345563, 0, 0.9921569, 1, 1,
-0.02399951, -1.44797, -4.602335, 0, 0.9882353, 1, 1,
-0.02370528, 1.526404, 0.2620209, 0, 0.9803922, 1, 1,
-0.01970793, 0.1734831, -0.4323947, 0, 0.9764706, 1, 1,
-0.01254712, -1.115123, -2.640513, 0, 0.9686275, 1, 1,
-0.01215698, -0.7319657, -2.37813, 0, 0.9647059, 1, 1,
-0.005898282, -1.434136, -3.081118, 0, 0.9568627, 1, 1,
-0.005019566, 0.548373, 0.01887803, 0, 0.9529412, 1, 1,
-0.004484301, -0.5879822, -1.942088, 0, 0.945098, 1, 1,
-0.004215457, 0.4720187, -0.7890317, 0, 0.9411765, 1, 1,
0.0006206906, -1.153805, 1.984409, 0, 0.9333333, 1, 1,
0.003006479, 1.308251, -0.1531385, 0, 0.9294118, 1, 1,
0.009281563, 0.5716492, -0.3113583, 0, 0.9215686, 1, 1,
0.01454502, -0.1421129, 1.520544, 0, 0.9176471, 1, 1,
0.01456828, 2.156751, -1.7132, 0, 0.9098039, 1, 1,
0.01700852, 1.975472, 1.966163, 0, 0.9058824, 1, 1,
0.01853481, -0.2565923, 1.428794, 0, 0.8980392, 1, 1,
0.02380069, -1.311357, 3.694922, 0, 0.8901961, 1, 1,
0.02452189, -1.741036, 4.608989, 0, 0.8862745, 1, 1,
0.02731759, -0.9961736, 3.521015, 0, 0.8784314, 1, 1,
0.03146925, -1.336075, 2.451706, 0, 0.8745098, 1, 1,
0.0366005, 0.972461, -1.114723, 0, 0.8666667, 1, 1,
0.03876052, -0.1726542, 6.717714, 0, 0.8627451, 1, 1,
0.04015949, 0.2352336, 0.2146434, 0, 0.854902, 1, 1,
0.04037205, -0.4279933, 5.179016, 0, 0.8509804, 1, 1,
0.04061301, -0.9468408, 3.363106, 0, 0.8431373, 1, 1,
0.04130518, 0.04576095, 0.09447376, 0, 0.8392157, 1, 1,
0.04355776, -0.3741398, 1.334242, 0, 0.8313726, 1, 1,
0.04897952, -0.3882915, 4.582962, 0, 0.827451, 1, 1,
0.0498359, -1.927737, 3.804153, 0, 0.8196079, 1, 1,
0.05381795, 0.09901915, 0.5817023, 0, 0.8156863, 1, 1,
0.05415214, -0.6215162, 3.304494, 0, 0.8078431, 1, 1,
0.05542177, -1.634921, 1.564853, 0, 0.8039216, 1, 1,
0.05563366, 0.3868925, -0.2530449, 0, 0.7960784, 1, 1,
0.05671129, -0.4218287, 2.432034, 0, 0.7882353, 1, 1,
0.06230435, -0.108988, 2.033085, 0, 0.7843137, 1, 1,
0.06414521, -1.114115, 2.772037, 0, 0.7764706, 1, 1,
0.06839721, 0.6179473, 0.1382099, 0, 0.772549, 1, 1,
0.06931695, 1.477863, 0.6326212, 0, 0.7647059, 1, 1,
0.07541921, -0.6046713, 3.400275, 0, 0.7607843, 1, 1,
0.08277113, 0.1717424, 0.8725388, 0, 0.7529412, 1, 1,
0.08514812, -0.8774176, 1.807818, 0, 0.7490196, 1, 1,
0.08732546, 0.4706976, 0.8515909, 0, 0.7411765, 1, 1,
0.08765541, 0.04519885, 1.271763, 0, 0.7372549, 1, 1,
0.09178054, -1.781316, 4.217259, 0, 0.7294118, 1, 1,
0.09345287, -0.7871461, 2.883026, 0, 0.7254902, 1, 1,
0.0971242, 0.01282694, 0.3916045, 0, 0.7176471, 1, 1,
0.09849846, -2.512803, 2.64333, 0, 0.7137255, 1, 1,
0.09896697, -0.4389634, 1.887774, 0, 0.7058824, 1, 1,
0.1060099, -1.046781, 4.001578, 0, 0.6980392, 1, 1,
0.110997, -0.9500319, 1.315322, 0, 0.6941177, 1, 1,
0.1117675, 0.004557085, 1.847727, 0, 0.6862745, 1, 1,
0.1126785, 1.34959, 0.6565199, 0, 0.682353, 1, 1,
0.113749, 1.341925, -0.5269912, 0, 0.6745098, 1, 1,
0.1141042, -0.321116, 1.76647, 0, 0.6705883, 1, 1,
0.1179629, -0.1664865, 1.678062, 0, 0.6627451, 1, 1,
0.1194863, -0.3593704, 2.327488, 0, 0.6588235, 1, 1,
0.1196667, -0.6808326, 4.465094, 0, 0.6509804, 1, 1,
0.122466, 0.228877, 0.7196102, 0, 0.6470588, 1, 1,
0.1238063, 0.3636887, 1.590376, 0, 0.6392157, 1, 1,
0.1254177, -2.08323, 1.684151, 0, 0.6352941, 1, 1,
0.1285642, 0.2773336, 1.123094, 0, 0.627451, 1, 1,
0.1319805, 1.379907, 1.066507, 0, 0.6235294, 1, 1,
0.1349828, 0.06877283, 1.029341, 0, 0.6156863, 1, 1,
0.1380465, -1.167063, 4.138634, 0, 0.6117647, 1, 1,
0.1455268, -0.2811731, 3.307441, 0, 0.6039216, 1, 1,
0.1530524, 0.4951242, 2.33607, 0, 0.5960785, 1, 1,
0.1621123, -0.1752674, 2.271448, 0, 0.5921569, 1, 1,
0.1621188, -1.296639, 3.241449, 0, 0.5843138, 1, 1,
0.1625272, -0.05379786, 1.292498, 0, 0.5803922, 1, 1,
0.1647146, -1.253653, 3.168287, 0, 0.572549, 1, 1,
0.1655007, 0.707781, 1.924018, 0, 0.5686275, 1, 1,
0.1695594, 0.8349712, 1.863876, 0, 0.5607843, 1, 1,
0.1705859, 0.8464703, -0.7888951, 0, 0.5568628, 1, 1,
0.1716068, -0.1830439, 3.427065, 0, 0.5490196, 1, 1,
0.1799649, -1.178233, 3.520846, 0, 0.5450981, 1, 1,
0.1876376, -1.741458, 0.9184535, 0, 0.5372549, 1, 1,
0.1901375, -0.3515468, 1.774059, 0, 0.5333334, 1, 1,
0.1959466, -0.9384183, 4.766089, 0, 0.5254902, 1, 1,
0.1974579, 1.798377, 1.168901, 0, 0.5215687, 1, 1,
0.2019746, 0.3101985, -0.02149664, 0, 0.5137255, 1, 1,
0.2027312, -1.051044, 2.688781, 0, 0.509804, 1, 1,
0.20674, -0.5741783, 3.852801, 0, 0.5019608, 1, 1,
0.2114407, 0.3530183, 0.7614396, 0, 0.4941176, 1, 1,
0.2146234, -0.5163116, -0.1863244, 0, 0.4901961, 1, 1,
0.2166386, -0.3469799, 2.763026, 0, 0.4823529, 1, 1,
0.2167254, -0.2409116, 1.187856, 0, 0.4784314, 1, 1,
0.2215816, -1.428271, 2.774755, 0, 0.4705882, 1, 1,
0.222707, 1.059798, 0.1149421, 0, 0.4666667, 1, 1,
0.2276556, 0.7637653, 1.170854, 0, 0.4588235, 1, 1,
0.2293084, 0.264832, -0.5196173, 0, 0.454902, 1, 1,
0.2333761, 0.7976499, 0.07617756, 0, 0.4470588, 1, 1,
0.2357012, -0.3848707, 1.742653, 0, 0.4431373, 1, 1,
0.2424015, 0.3986636, 0.6379661, 0, 0.4352941, 1, 1,
0.2447008, -1.03585, 2.72338, 0, 0.4313726, 1, 1,
0.2475698, 0.2952924, 1.095051, 0, 0.4235294, 1, 1,
0.249532, 0.391164, 1.686388, 0, 0.4196078, 1, 1,
0.2506402, 0.4519785, 0.7511842, 0, 0.4117647, 1, 1,
0.2527989, 0.1738206, 1.19707, 0, 0.4078431, 1, 1,
0.2545263, 0.6847541, -0.09584095, 0, 0.4, 1, 1,
0.2547577, -1.757346, 2.297845, 0, 0.3921569, 1, 1,
0.2566565, -1.02136, 4.942172, 0, 0.3882353, 1, 1,
0.2588207, 0.9498874, -0.05090186, 0, 0.3803922, 1, 1,
0.2623765, -0.5665595, 0.4871365, 0, 0.3764706, 1, 1,
0.2623865, -0.1596238, 2.247152, 0, 0.3686275, 1, 1,
0.2626529, -0.720583, 2.644988, 0, 0.3647059, 1, 1,
0.2680483, -0.4047799, 3.298726, 0, 0.3568628, 1, 1,
0.2697404, 0.4605867, 1.810701, 0, 0.3529412, 1, 1,
0.2698781, 0.5222183, -0.152833, 0, 0.345098, 1, 1,
0.2714886, 1.006366, -0.5215225, 0, 0.3411765, 1, 1,
0.273377, 1.473985, 0.9062733, 0, 0.3333333, 1, 1,
0.2784437, -0.43093, 2.076451, 0, 0.3294118, 1, 1,
0.2822935, 1.19714, -0.6114958, 0, 0.3215686, 1, 1,
0.2848856, -0.1083427, 1.149226, 0, 0.3176471, 1, 1,
0.2863196, 0.06054299, 0.2243382, 0, 0.3098039, 1, 1,
0.2881964, -1.259309, 4.067382, 0, 0.3058824, 1, 1,
0.2886188, 1.210841, 1.154128, 0, 0.2980392, 1, 1,
0.2890822, 1.105103, 0.03627755, 0, 0.2901961, 1, 1,
0.2915201, -0.303152, 2.384053, 0, 0.2862745, 1, 1,
0.2918725, -0.4588027, 4.42982, 0, 0.2784314, 1, 1,
0.2932005, -2.845749, 3.544281, 0, 0.2745098, 1, 1,
0.2975591, -0.6421334, 3.470076, 0, 0.2666667, 1, 1,
0.2994287, 0.381771, -0.975045, 0, 0.2627451, 1, 1,
0.2995712, -0.8850744, 0.9820579, 0, 0.254902, 1, 1,
0.3006161, -1.617137, 1.646899, 0, 0.2509804, 1, 1,
0.3015653, -1.635556, 2.89292, 0, 0.2431373, 1, 1,
0.3023399, -0.3024079, 1.304241, 0, 0.2392157, 1, 1,
0.3037286, -0.2126231, 2.190074, 0, 0.2313726, 1, 1,
0.3077216, 0.172604, 0.9653144, 0, 0.227451, 1, 1,
0.3084946, 2.513721, -1.558666, 0, 0.2196078, 1, 1,
0.3085132, 0.6362861, 1.838237, 0, 0.2156863, 1, 1,
0.3114394, 0.3456035, -0.946627, 0, 0.2078431, 1, 1,
0.3165734, 2.816596, 0.2950606, 0, 0.2039216, 1, 1,
0.3216961, -1.91389, 4.025858, 0, 0.1960784, 1, 1,
0.3219816, -0.3139554, 2.313328, 0, 0.1882353, 1, 1,
0.3222618, 0.4530893, 1.126321, 0, 0.1843137, 1, 1,
0.3229666, -1.165546, 5.320788, 0, 0.1764706, 1, 1,
0.3280112, -0.889118, 2.704299, 0, 0.172549, 1, 1,
0.3300743, -0.9821633, 2.662974, 0, 0.1647059, 1, 1,
0.333827, -0.6660272, 3.510949, 0, 0.1607843, 1, 1,
0.3342222, 1.785506, 1.555206, 0, 0.1529412, 1, 1,
0.3342477, -0.157617, 1.723983, 0, 0.1490196, 1, 1,
0.3367261, -0.1027116, 2.209132, 0, 0.1411765, 1, 1,
0.3384019, -2.146406, 2.793686, 0, 0.1372549, 1, 1,
0.3418829, -1.277947, 2.654328, 0, 0.1294118, 1, 1,
0.3463955, -0.1398299, 2.908186, 0, 0.1254902, 1, 1,
0.3485863, -0.2458696, 1.575367, 0, 0.1176471, 1, 1,
0.3503664, -0.4453239, 3.427731, 0, 0.1137255, 1, 1,
0.3529059, 1.508084, -0.8192565, 0, 0.1058824, 1, 1,
0.3530048, -1.264744, 2.081444, 0, 0.09803922, 1, 1,
0.3589832, 0.5079356, 1.708415, 0, 0.09411765, 1, 1,
0.3626642, 0.3247179, -0.9918101, 0, 0.08627451, 1, 1,
0.3654538, -0.4180173, 1.838546, 0, 0.08235294, 1, 1,
0.3667146, 0.6212697, 0.2530331, 0, 0.07450981, 1, 1,
0.3684042, -1.133285, 2.43942, 0, 0.07058824, 1, 1,
0.3745915, -1.59881, 2.649658, 0, 0.0627451, 1, 1,
0.3750043, -0.2303858, 1.204073, 0, 0.05882353, 1, 1,
0.3786497, 0.8838782, -1.86824, 0, 0.05098039, 1, 1,
0.3800215, 1.613404, -0.8275634, 0, 0.04705882, 1, 1,
0.3847166, -0.6712668, 3.388259, 0, 0.03921569, 1, 1,
0.3851284, 2.809182, -0.4828727, 0, 0.03529412, 1, 1,
0.3866241, -0.2794608, 1.988878, 0, 0.02745098, 1, 1,
0.3911123, -0.7543648, 3.717565, 0, 0.02352941, 1, 1,
0.395686, 0.01409539, 1.093729, 0, 0.01568628, 1, 1,
0.3971213, -0.771476, 3.617881, 0, 0.01176471, 1, 1,
0.3996176, -0.1167594, 2.949571, 0, 0.003921569, 1, 1,
0.4049503, -0.619084, 3.005723, 0.003921569, 0, 1, 1,
0.4066852, 0.6241294, 1.829659, 0.007843138, 0, 1, 1,
0.4076357, 0.2417508, 1.514287, 0.01568628, 0, 1, 1,
0.4083847, 1.323586, -0.4579738, 0.01960784, 0, 1, 1,
0.4132967, -0.129101, 1.029508, 0.02745098, 0, 1, 1,
0.4133203, 1.263488, -0.7513342, 0.03137255, 0, 1, 1,
0.4146125, 2.079442, 0.6598917, 0.03921569, 0, 1, 1,
0.414933, -0.8592778, 2.980984, 0.04313726, 0, 1, 1,
0.4166361, -0.7981917, 2.851961, 0.05098039, 0, 1, 1,
0.421639, -1.020209, 3.205046, 0.05490196, 0, 1, 1,
0.4320374, 1.601994, 0.05123933, 0.0627451, 0, 1, 1,
0.4331156, 0.6047884, 1.350109, 0.06666667, 0, 1, 1,
0.4352252, 0.1139161, 2.232488, 0.07450981, 0, 1, 1,
0.4380184, -1.167227, 3.505879, 0.07843138, 0, 1, 1,
0.4385544, -1.002909, 2.720321, 0.08627451, 0, 1, 1,
0.4391127, 1.099306, -0.5651721, 0.09019608, 0, 1, 1,
0.4403298, -0.07411476, 0.08076815, 0.09803922, 0, 1, 1,
0.4409099, -0.1639704, 2.667834, 0.1058824, 0, 1, 1,
0.4428397, -1.438858, 2.855044, 0.1098039, 0, 1, 1,
0.4471236, 0.7003779, -0.7993084, 0.1176471, 0, 1, 1,
0.4487602, -2.12797, 3.324829, 0.1215686, 0, 1, 1,
0.449669, 0.1592766, 0.7936965, 0.1294118, 0, 1, 1,
0.4533204, 1.519457, 0.4922238, 0.1333333, 0, 1, 1,
0.4580836, 1.34864, 1.022232, 0.1411765, 0, 1, 1,
0.4613964, -1.018892, 2.197285, 0.145098, 0, 1, 1,
0.4685069, 0.5947316, 0.787884, 0.1529412, 0, 1, 1,
0.4688304, -1.235995, 1.739873, 0.1568628, 0, 1, 1,
0.469016, -0.4948122, 0.7663136, 0.1647059, 0, 1, 1,
0.4709788, 0.3056154, 1.064094, 0.1686275, 0, 1, 1,
0.4755082, 0.5711676, -0.42541, 0.1764706, 0, 1, 1,
0.4786678, -0.4260381, 1.814116, 0.1803922, 0, 1, 1,
0.4860803, 0.319667, 0.32728, 0.1882353, 0, 1, 1,
0.4863082, 0.5133775, -0.1427761, 0.1921569, 0, 1, 1,
0.4866298, 1.365659, -0.09862254, 0.2, 0, 1, 1,
0.4893996, 0.4899635, 0.8859291, 0.2078431, 0, 1, 1,
0.4902461, -0.01243515, 2.376458, 0.2117647, 0, 1, 1,
0.4966597, 1.123811, 1.305081, 0.2196078, 0, 1, 1,
0.4973846, 0.2080593, 1.164769, 0.2235294, 0, 1, 1,
0.4974698, -2.019655, 2.045424, 0.2313726, 0, 1, 1,
0.4996957, -1.459082, 1.864076, 0.2352941, 0, 1, 1,
0.503134, -0.7440274, 0.4957924, 0.2431373, 0, 1, 1,
0.5071306, -0.2299694, 2.844874, 0.2470588, 0, 1, 1,
0.5102025, -0.7407848, 0.3732713, 0.254902, 0, 1, 1,
0.511943, 0.9519201, 0.3468176, 0.2588235, 0, 1, 1,
0.5170183, 0.7449458, -0.9742187, 0.2666667, 0, 1, 1,
0.5200005, -0.7252684, 2.038309, 0.2705882, 0, 1, 1,
0.5201271, -0.2650932, 1.300271, 0.2784314, 0, 1, 1,
0.5208579, -0.132655, 3.225134, 0.282353, 0, 1, 1,
0.5235208, 1.334448, 1.465853, 0.2901961, 0, 1, 1,
0.5248106, -0.09388866, 2.45641, 0.2941177, 0, 1, 1,
0.5269621, -1.039961, 1.75852, 0.3019608, 0, 1, 1,
0.5288464, -0.1143273, 0.9307377, 0.3098039, 0, 1, 1,
0.5314353, 0.3822743, 1.127755, 0.3137255, 0, 1, 1,
0.5350715, -0.8412351, 3.886267, 0.3215686, 0, 1, 1,
0.5354712, 0.5488253, 1.323417, 0.3254902, 0, 1, 1,
0.5369089, 0.3593245, -1.858062, 0.3333333, 0, 1, 1,
0.5444193, -0.487004, 3.644784, 0.3372549, 0, 1, 1,
0.5445026, -0.7307698, 2.823894, 0.345098, 0, 1, 1,
0.5467758, 1.057174, -0.4860487, 0.3490196, 0, 1, 1,
0.5524152, -1.141959, -0.1229355, 0.3568628, 0, 1, 1,
0.5600932, 0.7422369, 1.193245, 0.3607843, 0, 1, 1,
0.5680185, 0.1706196, 1.485695, 0.3686275, 0, 1, 1,
0.5748925, -0.09003787, 2.056108, 0.372549, 0, 1, 1,
0.5851555, -0.07675069, 1.518345, 0.3803922, 0, 1, 1,
0.5883247, 0.6073041, 0.6260366, 0.3843137, 0, 1, 1,
0.5927668, 0.1978715, 0.4545065, 0.3921569, 0, 1, 1,
0.5934536, -1.417051, 2.561628, 0.3960784, 0, 1, 1,
0.5938351, 0.9361658, -0.9485237, 0.4039216, 0, 1, 1,
0.5940182, 1.654184, 0.206208, 0.4117647, 0, 1, 1,
0.600197, 0.02845436, 2.392522, 0.4156863, 0, 1, 1,
0.6011299, -1.026585, 1.088869, 0.4235294, 0, 1, 1,
0.605742, -0.09890786, 1.237305, 0.427451, 0, 1, 1,
0.6127847, 0.01664097, 0.4904063, 0.4352941, 0, 1, 1,
0.6143945, -0.7294009, 2.359746, 0.4392157, 0, 1, 1,
0.6186466, -0.7371099, 1.064479, 0.4470588, 0, 1, 1,
0.6202357, -0.009711659, 1.361305, 0.4509804, 0, 1, 1,
0.6224838, -0.6853047, 1.946867, 0.4588235, 0, 1, 1,
0.6260076, -0.3215576, 2.339708, 0.4627451, 0, 1, 1,
0.6324302, -0.1143253, 1.508184, 0.4705882, 0, 1, 1,
0.6327407, -0.6427354, 2.610875, 0.4745098, 0, 1, 1,
0.6368596, 0.6920562, 0.9325409, 0.4823529, 0, 1, 1,
0.6377003, 1.521721, 0.1162066, 0.4862745, 0, 1, 1,
0.6390531, -0.2817185, 1.630056, 0.4941176, 0, 1, 1,
0.6394659, 2.420095, 1.145287, 0.5019608, 0, 1, 1,
0.6433421, 1.27033, 1.214282, 0.5058824, 0, 1, 1,
0.6462453, -0.01215493, 0.9583427, 0.5137255, 0, 1, 1,
0.6510623, -2.112175, 2.950344, 0.5176471, 0, 1, 1,
0.6545645, -1.425592, 2.50421, 0.5254902, 0, 1, 1,
0.6567966, -0.8072532, 1.603765, 0.5294118, 0, 1, 1,
0.6593248, -0.1503384, 2.480096, 0.5372549, 0, 1, 1,
0.6608881, 0.6753754, 0.7977524, 0.5411765, 0, 1, 1,
0.6610112, -0.2240869, 2.433692, 0.5490196, 0, 1, 1,
0.6620185, -0.7433724, 1.915101, 0.5529412, 0, 1, 1,
0.6637373, -0.1751478, 0.1176392, 0.5607843, 0, 1, 1,
0.6763153, -1.370563, 3.397197, 0.5647059, 0, 1, 1,
0.6813496, 0.3706297, 1.787801, 0.572549, 0, 1, 1,
0.6815544, 0.8633371, -0.3560537, 0.5764706, 0, 1, 1,
0.6826501, -1.027905, 3.410472, 0.5843138, 0, 1, 1,
0.6870124, 0.9109179, 0.6433874, 0.5882353, 0, 1, 1,
0.6877753, 1.135776, 0.3465638, 0.5960785, 0, 1, 1,
0.6932815, -0.422592, 1.938738, 0.6039216, 0, 1, 1,
0.694065, -1.029601, 2.507598, 0.6078432, 0, 1, 1,
0.7019825, 0.8232506, -0.01641556, 0.6156863, 0, 1, 1,
0.7029203, -0.4947137, 2.283958, 0.6196079, 0, 1, 1,
0.7068103, -1.045675, 3.092785, 0.627451, 0, 1, 1,
0.7078727, -1.141586, 2.464852, 0.6313726, 0, 1, 1,
0.7103402, -1.207835, 3.088081, 0.6392157, 0, 1, 1,
0.7125089, 2.276611, 2.194045, 0.6431373, 0, 1, 1,
0.7140319, -0.7075373, 2.647873, 0.6509804, 0, 1, 1,
0.7161193, -0.3648523, 2.689527, 0.654902, 0, 1, 1,
0.7217179, -1.587807, 3.762089, 0.6627451, 0, 1, 1,
0.7233626, -1.207688, 2.948433, 0.6666667, 0, 1, 1,
0.7236076, 0.8143479, -0.3034306, 0.6745098, 0, 1, 1,
0.7388444, -0.7082329, 1.601629, 0.6784314, 0, 1, 1,
0.7434695, -2.029153, 4.265533, 0.6862745, 0, 1, 1,
0.7501256, -1.448241, 1.524809, 0.6901961, 0, 1, 1,
0.7602264, -0.9075491, 1.070858, 0.6980392, 0, 1, 1,
0.7652454, 0.5508455, 0.2932787, 0.7058824, 0, 1, 1,
0.766367, 0.09562004, 3.314481, 0.7098039, 0, 1, 1,
0.7679256, 0.6837373, 1.688558, 0.7176471, 0, 1, 1,
0.7692261, 0.6940646, 1.671468, 0.7215686, 0, 1, 1,
0.7797835, 1.774478, -0.7507492, 0.7294118, 0, 1, 1,
0.7813083, 0.7545893, -1.196603, 0.7333333, 0, 1, 1,
0.7854084, -0.2887288, 0.6449721, 0.7411765, 0, 1, 1,
0.7917584, 0.7760623, 0.1173157, 0.7450981, 0, 1, 1,
0.8012086, 0.3953724, 1.946066, 0.7529412, 0, 1, 1,
0.8028252, 1.780031, 0.3195547, 0.7568628, 0, 1, 1,
0.8173498, 0.5408215, 1.449501, 0.7647059, 0, 1, 1,
0.8181704, -0.2856869, 1.522618, 0.7686275, 0, 1, 1,
0.8181924, 0.3763112, 0.5085223, 0.7764706, 0, 1, 1,
0.8189393, 0.990129, 0.3988907, 0.7803922, 0, 1, 1,
0.8210442, -0.0312757, 2.501905, 0.7882353, 0, 1, 1,
0.8219626, 0.6239665, 0.6724803, 0.7921569, 0, 1, 1,
0.8224738, -1.269686, 1.146682, 0.8, 0, 1, 1,
0.834464, -0.6861919, -0.07998696, 0.8078431, 0, 1, 1,
0.8418841, 1.07083, 1.979636, 0.8117647, 0, 1, 1,
0.8512433, -0.2403301, 2.50001, 0.8196079, 0, 1, 1,
0.8619174, -0.2983405, 1.621645, 0.8235294, 0, 1, 1,
0.8682588, 0.09448197, 1.901905, 0.8313726, 0, 1, 1,
0.8697327, -0.5332335, 1.565421, 0.8352941, 0, 1, 1,
0.8701016, 1.020635, 1.18043, 0.8431373, 0, 1, 1,
0.8709599, -0.149652, 0.8774716, 0.8470588, 0, 1, 1,
0.8712571, 0.1277797, 0.6349264, 0.854902, 0, 1, 1,
0.8850319, -0.2817747, 1.9177, 0.8588235, 0, 1, 1,
0.890022, 0.8073949, 1.248125, 0.8666667, 0, 1, 1,
0.8975318, 0.6977161, -0.2657431, 0.8705882, 0, 1, 1,
0.898982, 0.9081964, 0.117135, 0.8784314, 0, 1, 1,
0.8989912, 2.135938, 0.4179724, 0.8823529, 0, 1, 1,
0.9129487, -0.6488773, 0.735425, 0.8901961, 0, 1, 1,
0.9228391, -0.1335922, 1.148839, 0.8941177, 0, 1, 1,
0.9273977, 1.410944, 0.8876237, 0.9019608, 0, 1, 1,
0.9304944, -0.707567, 3.415212, 0.9098039, 0, 1, 1,
0.9373646, -2.208457, 1.417936, 0.9137255, 0, 1, 1,
0.9383148, 1.260253, 0.4980202, 0.9215686, 0, 1, 1,
0.938854, 0.04126303, 0.7829329, 0.9254902, 0, 1, 1,
0.9388821, -0.7773473, 1.107679, 0.9333333, 0, 1, 1,
0.9424903, -0.5016015, 1.479055, 0.9372549, 0, 1, 1,
0.9570333, -0.2575913, 1.578455, 0.945098, 0, 1, 1,
0.9636081, -2.713714, 2.542765, 0.9490196, 0, 1, 1,
0.966099, -0.6999263, 2.759434, 0.9568627, 0, 1, 1,
0.9669867, -0.2219985, 1.626216, 0.9607843, 0, 1, 1,
0.9689528, 1.514316, 0.8121673, 0.9686275, 0, 1, 1,
0.9699678, 1.015718, 0.4627942, 0.972549, 0, 1, 1,
0.9728425, -0.4332209, 2.596699, 0.9803922, 0, 1, 1,
0.9743473, -1.475799, 3.000614, 0.9843137, 0, 1, 1,
0.9782748, 0.3384717, 1.023381, 0.9921569, 0, 1, 1,
0.9846506, 0.1604171, 0.8362186, 0.9960784, 0, 1, 1,
0.9937254, 1.524478, -0.4196705, 1, 0, 0.9960784, 1,
0.9984981, 1.644295, -1.578726, 1, 0, 0.9882353, 1,
0.9995839, 0.1426839, 1.92619, 1, 0, 0.9843137, 1,
1.016546, -0.07420058, 1.379915, 1, 0, 0.9764706, 1,
1.016772, -0.1891351, 1.42004, 1, 0, 0.972549, 1,
1.020832, -0.3232971, 0.5312706, 1, 0, 0.9647059, 1,
1.023028, -0.3482555, 2.994087, 1, 0, 0.9607843, 1,
1.024813, 0.5916212, 0.5188611, 1, 0, 0.9529412, 1,
1.025996, -0.7748433, 2.561942, 1, 0, 0.9490196, 1,
1.027116, 1.847958, -0.4987536, 1, 0, 0.9411765, 1,
1.02734, 0.1870143, 1.654837, 1, 0, 0.9372549, 1,
1.02846, -0.5163025, 0.6344407, 1, 0, 0.9294118, 1,
1.030139, -1.139783, 1.037703, 1, 0, 0.9254902, 1,
1.04422, -0.2264472, 3.210648, 1, 0, 0.9176471, 1,
1.04438, 0.621522, 0.1573841, 1, 0, 0.9137255, 1,
1.051818, -0.3989848, 1.281394, 1, 0, 0.9058824, 1,
1.068944, -0.2018673, 0.1374366, 1, 0, 0.9019608, 1,
1.07007, 0.2970505, 1.866035, 1, 0, 0.8941177, 1,
1.07189, -3.240677, 1.706916, 1, 0, 0.8862745, 1,
1.078287, -0.4805755, 2.142593, 1, 0, 0.8823529, 1,
1.079492, -1.115788, 2.96438, 1, 0, 0.8745098, 1,
1.08082, 0.7365444, 0.8109291, 1, 0, 0.8705882, 1,
1.083411, 0.3954637, 2.180115, 1, 0, 0.8627451, 1,
1.083581, -1.140966, -0.9489671, 1, 0, 0.8588235, 1,
1.094576, -0.737745, 4.030281, 1, 0, 0.8509804, 1,
1.097438, 0.1653093, 1.499967, 1, 0, 0.8470588, 1,
1.099678, 0.6026538, 0.7890838, 1, 0, 0.8392157, 1,
1.104415, -1.27915, 1.835674, 1, 0, 0.8352941, 1,
1.108593, 0.2948097, 2.81662, 1, 0, 0.827451, 1,
1.114462, 1.205585, -1.147992, 1, 0, 0.8235294, 1,
1.118919, 1.760442, 1.393446, 1, 0, 0.8156863, 1,
1.119886, 0.3133708, 1.0706, 1, 0, 0.8117647, 1,
1.124536, 0.3664021, 0.9905884, 1, 0, 0.8039216, 1,
1.128313, 0.04111641, 1.885842, 1, 0, 0.7960784, 1,
1.129585, -0.8802893, 1.017029, 1, 0, 0.7921569, 1,
1.137796, 0.4309054, 1.007567, 1, 0, 0.7843137, 1,
1.142207, 0.5331551, 2.530331, 1, 0, 0.7803922, 1,
1.150948, -0.1586303, 2.295957, 1, 0, 0.772549, 1,
1.162242, -0.6490096, 1.398382, 1, 0, 0.7686275, 1,
1.16528, 2.853364, 1.016934, 1, 0, 0.7607843, 1,
1.168568, 0.1166399, 1.015494, 1, 0, 0.7568628, 1,
1.171699, 1.314007, -0.2477649, 1, 0, 0.7490196, 1,
1.172401, 0.453582, 1.384419, 1, 0, 0.7450981, 1,
1.173002, -0.6946494, 0.5467504, 1, 0, 0.7372549, 1,
1.178111, -0.1421759, 3.513339, 1, 0, 0.7333333, 1,
1.180135, -0.8367345, 3.61522, 1, 0, 0.7254902, 1,
1.189363, -0.2007915, 0.7843213, 1, 0, 0.7215686, 1,
1.18944, -0.2010422, 1.52739, 1, 0, 0.7137255, 1,
1.198222, -1.267524, 3.819267, 1, 0, 0.7098039, 1,
1.203816, 0.8804352, 1.324368, 1, 0, 0.7019608, 1,
1.204202, -0.4196932, 2.892102, 1, 0, 0.6941177, 1,
1.211796, 0.8311996, 0.3814995, 1, 0, 0.6901961, 1,
1.21442, -1.348785, -0.4180815, 1, 0, 0.682353, 1,
1.21473, -1.312643, 4.258612, 1, 0, 0.6784314, 1,
1.219184, -0.09975037, 0.8288732, 1, 0, 0.6705883, 1,
1.221828, 0.3455999, 2.038424, 1, 0, 0.6666667, 1,
1.23057, 0.8860766, 0.4443698, 1, 0, 0.6588235, 1,
1.232517, 2.806417, 1.028911, 1, 0, 0.654902, 1,
1.236333, -1.957651, 2.308703, 1, 0, 0.6470588, 1,
1.243379, -0.5977248, 2.274985, 1, 0, 0.6431373, 1,
1.248345, 0.05638556, 0.9267643, 1, 0, 0.6352941, 1,
1.255223, 0.01594823, 0.7602873, 1, 0, 0.6313726, 1,
1.277211, 0.5237471, -0.8478009, 1, 0, 0.6235294, 1,
1.297262, -0.7403153, 3.819181, 1, 0, 0.6196079, 1,
1.30919, 0.3739996, 0.4841622, 1, 0, 0.6117647, 1,
1.310311, 0.9240522, 2.785944, 1, 0, 0.6078432, 1,
1.314151, 1.732908, 1.072992, 1, 0, 0.6, 1,
1.331837, 0.9106172, 1.436377, 1, 0, 0.5921569, 1,
1.342815, 1.868178, -0.7288883, 1, 0, 0.5882353, 1,
1.343738, 1.286454, 1.229694, 1, 0, 0.5803922, 1,
1.350923, 0.5276811, 1.987748, 1, 0, 0.5764706, 1,
1.358659, -0.01095093, 1.124081, 1, 0, 0.5686275, 1,
1.363193, 0.4205767, -0.1949541, 1, 0, 0.5647059, 1,
1.368705, -1.043375, 2.357282, 1, 0, 0.5568628, 1,
1.372838, 0.09567818, 3.134398, 1, 0, 0.5529412, 1,
1.373073, -0.6657101, 1.933909, 1, 0, 0.5450981, 1,
1.374921, 1.114272, 1.116518, 1, 0, 0.5411765, 1,
1.387543, -1.121525, 2.008253, 1, 0, 0.5333334, 1,
1.401898, 0.5690676, 0.6140854, 1, 0, 0.5294118, 1,
1.406338, -3.271382, 2.018244, 1, 0, 0.5215687, 1,
1.41838, -0.2356316, 2.247495, 1, 0, 0.5176471, 1,
1.421941, 0.9486981, -0.06520986, 1, 0, 0.509804, 1,
1.423403, 0.1091127, 2.044186, 1, 0, 0.5058824, 1,
1.424955, 1.035241, 1.507991, 1, 0, 0.4980392, 1,
1.425308, -1.158815, 3.719797, 1, 0, 0.4901961, 1,
1.446904, -0.6981367, 1.534915, 1, 0, 0.4862745, 1,
1.452948, -1.354288, 1.581539, 1, 0, 0.4784314, 1,
1.457116, 0.567308, 0.8870481, 1, 0, 0.4745098, 1,
1.457736, 1.518158, 0.8677288, 1, 0, 0.4666667, 1,
1.462862, -0.0771916, -0.1458224, 1, 0, 0.4627451, 1,
1.465196, -0.3683565, 1.604179, 1, 0, 0.454902, 1,
1.468729, -1.682646, 1.896199, 1, 0, 0.4509804, 1,
1.472737, -1.824672, 2.4361, 1, 0, 0.4431373, 1,
1.477659, -0.1673386, 0.130726, 1, 0, 0.4392157, 1,
1.493291, 0.2020081, 0.136714, 1, 0, 0.4313726, 1,
1.509385, -0.7618405, 1.614386, 1, 0, 0.427451, 1,
1.526869, -1.095568, -0.7645503, 1, 0, 0.4196078, 1,
1.534876, -1.18871, 1.492734, 1, 0, 0.4156863, 1,
1.536369, -1.284372, 3.423344, 1, 0, 0.4078431, 1,
1.558001, 1.748251, 1.067634, 1, 0, 0.4039216, 1,
1.558622, -0.835379, 2.196729, 1, 0, 0.3960784, 1,
1.563582, -0.275006, 1.247727, 1, 0, 0.3882353, 1,
1.565247, 0.1695009, 2.279813, 1, 0, 0.3843137, 1,
1.568191, 0.753678, 1.300323, 1, 0, 0.3764706, 1,
1.580219, 0.08153794, 3.092446, 1, 0, 0.372549, 1,
1.603063, -0.7025934, 0.2065944, 1, 0, 0.3647059, 1,
1.606154, -1.416512, 2.301372, 1, 0, 0.3607843, 1,
1.611567, -0.6978146, 0.8864396, 1, 0, 0.3529412, 1,
1.613945, 1.771274, 1.634759, 1, 0, 0.3490196, 1,
1.616027, -0.6922768, 0.5520697, 1, 0, 0.3411765, 1,
1.627842, -0.2115031, 0.499261, 1, 0, 0.3372549, 1,
1.629917, 1.785755, 0.3201368, 1, 0, 0.3294118, 1,
1.636621, -0.1505166, 1.750172, 1, 0, 0.3254902, 1,
1.649255, -0.01262146, 0.3180166, 1, 0, 0.3176471, 1,
1.658193, 0.9316865, 1.465088, 1, 0, 0.3137255, 1,
1.661165, 0.8811903, 1.168098, 1, 0, 0.3058824, 1,
1.703207, 0.5406046, 1.439727, 1, 0, 0.2980392, 1,
1.70879, -0.5413524, 2.408844, 1, 0, 0.2941177, 1,
1.711689, 0.2229274, 0.6311432, 1, 0, 0.2862745, 1,
1.716497, -0.1201185, 3.422414, 1, 0, 0.282353, 1,
1.753415, 0.05647438, 0.9960994, 1, 0, 0.2745098, 1,
1.757137, 0.6690584, 1.093769, 1, 0, 0.2705882, 1,
1.785128, 1.020924, 2.007243, 1, 0, 0.2627451, 1,
1.788574, -0.4050845, 1.545945, 1, 0, 0.2588235, 1,
1.805275, -0.982834, 0.1546518, 1, 0, 0.2509804, 1,
1.82414, 0.1385675, -0.28277, 1, 0, 0.2470588, 1,
1.824828, 0.3056035, 2.757714, 1, 0, 0.2392157, 1,
1.829154, 1.01221, 1.82417, 1, 0, 0.2352941, 1,
1.868675, 0.3567715, 2.358611, 1, 0, 0.227451, 1,
1.876794, -1.462927, 2.378386, 1, 0, 0.2235294, 1,
1.896139, 0.6068969, 1.432662, 1, 0, 0.2156863, 1,
1.896444, -0.06503154, 2.188721, 1, 0, 0.2117647, 1,
1.903216, -0.3127486, 1.236902, 1, 0, 0.2039216, 1,
1.909359, 0.4515107, -0.01500446, 1, 0, 0.1960784, 1,
1.951545, 0.4894165, 2.099293, 1, 0, 0.1921569, 1,
1.983028, -0.5565965, 3.085695, 1, 0, 0.1843137, 1,
1.992045, -3.104095, 1.883111, 1, 0, 0.1803922, 1,
1.994026, 2.313766, 0.8142846, 1, 0, 0.172549, 1,
2.00864, -0.6439608, 2.298297, 1, 0, 0.1686275, 1,
2.025385, -0.978133, 1.784552, 1, 0, 0.1607843, 1,
2.040898, -1.91626, 1.639851, 1, 0, 0.1568628, 1,
2.101743, 2.127046, -0.2372507, 1, 0, 0.1490196, 1,
2.127333, 0.04074403, 0.7612603, 1, 0, 0.145098, 1,
2.14795, -0.5809525, 1.466728, 1, 0, 0.1372549, 1,
2.156826, 1.091354, 0.3709825, 1, 0, 0.1333333, 1,
2.203799, 1.321825, -0.08497488, 1, 0, 0.1254902, 1,
2.226628, 1.687209, -0.104025, 1, 0, 0.1215686, 1,
2.22727, -1.29763, 1.135112, 1, 0, 0.1137255, 1,
2.251323, 1.15528, 1.723781, 1, 0, 0.1098039, 1,
2.324903, 1.232216, 1.085543, 1, 0, 0.1019608, 1,
2.349564, -0.8533384, 1.467589, 1, 0, 0.09411765, 1,
2.389844, 0.1149317, 1.800175, 1, 0, 0.09019608, 1,
2.40375, 0.4513981, 0.8086491, 1, 0, 0.08235294, 1,
2.426045, -1.617349, 2.939872, 1, 0, 0.07843138, 1,
2.441981, 0.3673173, 2.128387, 1, 0, 0.07058824, 1,
2.444865, 0.4367667, 1.478096, 1, 0, 0.06666667, 1,
2.457764, 1.048048, 1.952917, 1, 0, 0.05882353, 1,
2.477003, -1.80884, 2.862634, 1, 0, 0.05490196, 1,
2.49672, 0.4181383, 3.008909, 1, 0, 0.04705882, 1,
2.525419, 1.766387, 1.489444, 1, 0, 0.04313726, 1,
2.537393, -1.595697, 0.7107826, 1, 0, 0.03529412, 1,
2.678365, -1.457386, 0.8499369, 1, 0, 0.03137255, 1,
2.688137, 0.9851173, -0.2229932, 1, 0, 0.02352941, 1,
2.700911, -1.328513, 1.125308, 1, 0, 0.01960784, 1,
2.708437, 0.7934576, 1.914221, 1, 0, 0.01176471, 1,
2.874829, -0.07359777, 0.08093765, 1, 0, 0.007843138, 1
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
-0.3621148, -4.309527, -6.819289, 0, -0.5, 0.5, 0.5,
-0.3621148, -4.309527, -6.819289, 1, -0.5, 0.5, 0.5,
-0.3621148, -4.309527, -6.819289, 1, 1.5, 0.5, 0.5,
-0.3621148, -4.309527, -6.819289, 0, 1.5, 0.5, 0.5
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
-4.696383, -0.2090093, -6.819289, 0, -0.5, 0.5, 0.5,
-4.696383, -0.2090093, -6.819289, 1, -0.5, 0.5, 0.5,
-4.696383, -0.2090093, -6.819289, 1, 1.5, 0.5, 0.5,
-4.696383, -0.2090093, -6.819289, 0, 1.5, 0.5, 0.5
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
-4.696383, -4.309527, 0.930197, 0, -0.5, 0.5, 0.5,
-4.696383, -4.309527, 0.930197, 1, -0.5, 0.5, 0.5,
-4.696383, -4.309527, 0.930197, 1, 1.5, 0.5, 0.5,
-4.696383, -4.309527, 0.930197, 0, 1.5, 0.5, 0.5
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
-3, -3.363254, -5.030946,
2, -3.363254, -5.030946,
-3, -3.363254, -5.030946,
-3, -3.520966, -5.329003,
-2, -3.363254, -5.030946,
-2, -3.520966, -5.329003,
-1, -3.363254, -5.030946,
-1, -3.520966, -5.329003,
0, -3.363254, -5.030946,
0, -3.520966, -5.329003,
1, -3.363254, -5.030946,
1, -3.520966, -5.329003,
2, -3.363254, -5.030946,
2, -3.520966, -5.329003
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
-3, -3.83639, -5.925117, 0, -0.5, 0.5, 0.5,
-3, -3.83639, -5.925117, 1, -0.5, 0.5, 0.5,
-3, -3.83639, -5.925117, 1, 1.5, 0.5, 0.5,
-3, -3.83639, -5.925117, 0, 1.5, 0.5, 0.5,
-2, -3.83639, -5.925117, 0, -0.5, 0.5, 0.5,
-2, -3.83639, -5.925117, 1, -0.5, 0.5, 0.5,
-2, -3.83639, -5.925117, 1, 1.5, 0.5, 0.5,
-2, -3.83639, -5.925117, 0, 1.5, 0.5, 0.5,
-1, -3.83639, -5.925117, 0, -0.5, 0.5, 0.5,
-1, -3.83639, -5.925117, 1, -0.5, 0.5, 0.5,
-1, -3.83639, -5.925117, 1, 1.5, 0.5, 0.5,
-1, -3.83639, -5.925117, 0, 1.5, 0.5, 0.5,
0, -3.83639, -5.925117, 0, -0.5, 0.5, 0.5,
0, -3.83639, -5.925117, 1, -0.5, 0.5, 0.5,
0, -3.83639, -5.925117, 1, 1.5, 0.5, 0.5,
0, -3.83639, -5.925117, 0, 1.5, 0.5, 0.5,
1, -3.83639, -5.925117, 0, -0.5, 0.5, 0.5,
1, -3.83639, -5.925117, 1, -0.5, 0.5, 0.5,
1, -3.83639, -5.925117, 1, 1.5, 0.5, 0.5,
1, -3.83639, -5.925117, 0, 1.5, 0.5, 0.5,
2, -3.83639, -5.925117, 0, -0.5, 0.5, 0.5,
2, -3.83639, -5.925117, 1, -0.5, 0.5, 0.5,
2, -3.83639, -5.925117, 1, 1.5, 0.5, 0.5,
2, -3.83639, -5.925117, 0, 1.5, 0.5, 0.5
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
-3.696167, -3, -5.030946,
-3.696167, 2, -5.030946,
-3.696167, -3, -5.030946,
-3.86287, -3, -5.329003,
-3.696167, -2, -5.030946,
-3.86287, -2, -5.329003,
-3.696167, -1, -5.030946,
-3.86287, -1, -5.329003,
-3.696167, 0, -5.030946,
-3.86287, 0, -5.329003,
-3.696167, 1, -5.030946,
-3.86287, 1, -5.329003,
-3.696167, 2, -5.030946,
-3.86287, 2, -5.329003
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
-4.196275, -3, -5.925117, 0, -0.5, 0.5, 0.5,
-4.196275, -3, -5.925117, 1, -0.5, 0.5, 0.5,
-4.196275, -3, -5.925117, 1, 1.5, 0.5, 0.5,
-4.196275, -3, -5.925117, 0, 1.5, 0.5, 0.5,
-4.196275, -2, -5.925117, 0, -0.5, 0.5, 0.5,
-4.196275, -2, -5.925117, 1, -0.5, 0.5, 0.5,
-4.196275, -2, -5.925117, 1, 1.5, 0.5, 0.5,
-4.196275, -2, -5.925117, 0, 1.5, 0.5, 0.5,
-4.196275, -1, -5.925117, 0, -0.5, 0.5, 0.5,
-4.196275, -1, -5.925117, 1, -0.5, 0.5, 0.5,
-4.196275, -1, -5.925117, 1, 1.5, 0.5, 0.5,
-4.196275, -1, -5.925117, 0, 1.5, 0.5, 0.5,
-4.196275, 0, -5.925117, 0, -0.5, 0.5, 0.5,
-4.196275, 0, -5.925117, 1, -0.5, 0.5, 0.5,
-4.196275, 0, -5.925117, 1, 1.5, 0.5, 0.5,
-4.196275, 0, -5.925117, 0, 1.5, 0.5, 0.5,
-4.196275, 1, -5.925117, 0, -0.5, 0.5, 0.5,
-4.196275, 1, -5.925117, 1, -0.5, 0.5, 0.5,
-4.196275, 1, -5.925117, 1, 1.5, 0.5, 0.5,
-4.196275, 1, -5.925117, 0, 1.5, 0.5, 0.5,
-4.196275, 2, -5.925117, 0, -0.5, 0.5, 0.5,
-4.196275, 2, -5.925117, 1, -0.5, 0.5, 0.5,
-4.196275, 2, -5.925117, 1, 1.5, 0.5, 0.5,
-4.196275, 2, -5.925117, 0, 1.5, 0.5, 0.5
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
-3.696167, -3.363254, -4,
-3.696167, -3.363254, 6,
-3.696167, -3.363254, -4,
-3.86287, -3.520966, -4,
-3.696167, -3.363254, -2,
-3.86287, -3.520966, -2,
-3.696167, -3.363254, 0,
-3.86287, -3.520966, 0,
-3.696167, -3.363254, 2,
-3.86287, -3.520966, 2,
-3.696167, -3.363254, 4,
-3.86287, -3.520966, 4,
-3.696167, -3.363254, 6,
-3.86287, -3.520966, 6
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
-4.196275, -3.83639, -4, 0, -0.5, 0.5, 0.5,
-4.196275, -3.83639, -4, 1, -0.5, 0.5, 0.5,
-4.196275, -3.83639, -4, 1, 1.5, 0.5, 0.5,
-4.196275, -3.83639, -4, 0, 1.5, 0.5, 0.5,
-4.196275, -3.83639, -2, 0, -0.5, 0.5, 0.5,
-4.196275, -3.83639, -2, 1, -0.5, 0.5, 0.5,
-4.196275, -3.83639, -2, 1, 1.5, 0.5, 0.5,
-4.196275, -3.83639, -2, 0, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 0, 0, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 0, 1, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 0, 1, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 0, 0, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 2, 0, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 2, 1, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 2, 1, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 2, 0, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 4, 0, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 4, 1, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 4, 1, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 4, 0, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 6, 0, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 6, 1, -0.5, 0.5, 0.5,
-4.196275, -3.83639, 6, 1, 1.5, 0.5, 0.5,
-4.196275, -3.83639, 6, 0, 1.5, 0.5, 0.5
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
-3.696167, -3.363254, -5.030946,
-3.696167, 2.945235, -5.030946,
-3.696167, -3.363254, 6.89134,
-3.696167, 2.945235, 6.89134,
-3.696167, -3.363254, -5.030946,
-3.696167, -3.363254, 6.89134,
-3.696167, 2.945235, -5.030946,
-3.696167, 2.945235, 6.89134,
-3.696167, -3.363254, -5.030946,
2.971937, -3.363254, -5.030946,
-3.696167, -3.363254, 6.89134,
2.971937, -3.363254, 6.89134,
-3.696167, 2.945235, -5.030946,
2.971937, 2.945235, -5.030946,
-3.696167, 2.945235, 6.89134,
2.971937, 2.945235, 6.89134,
2.971937, -3.363254, -5.030946,
2.971937, 2.945235, -5.030946,
2.971937, -3.363254, 6.89134,
2.971937, 2.945235, 6.89134,
2.971937, -3.363254, -5.030946,
2.971937, -3.363254, 6.89134,
2.971937, 2.945235, -5.030946,
2.971937, 2.945235, 6.89134
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
var radius = 8.034616;
var distance = 35.74692;
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
mvMatrix.translate( 0.3621148, 0.2090093, -0.930197 );
mvMatrix.scale( 1.302797, 1.377063, 0.7286509 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74692);
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
sulphur<-read.table("sulphur.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulphur$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulphur' not found
```

```r
y<-sulphur$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulphur' not found
```

```r
z<-sulphur$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulphur' not found
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
-3.599059, 0.599493, -1.538695, 0, 0, 1, 1, 1,
-3.401835, -0.1914135, -0.9652807, 1, 0, 0, 1, 1,
-2.847686, -0.2805603, -1.170282, 1, 0, 0, 1, 1,
-2.814904, 0.3506194, -3.105227, 1, 0, 0, 1, 1,
-2.734582, -0.5490459, -3.09389, 1, 0, 0, 1, 1,
-2.690392, -1.585202, -2.705786, 1, 0, 0, 1, 1,
-2.579891, -0.773926, -2.407522, 0, 0, 0, 1, 1,
-2.554652, -0.7321742, -1.426084, 0, 0, 0, 1, 1,
-2.52431, -0.4750809, -1.20338, 0, 0, 0, 1, 1,
-2.520515, -0.4227135, -1.488689, 0, 0, 0, 1, 1,
-2.506209, -0.7709187, -2.398971, 0, 0, 0, 1, 1,
-2.482402, -0.4888309, -1.399113, 0, 0, 0, 1, 1,
-2.416203, -0.00483407, -0.4681371, 0, 0, 0, 1, 1,
-2.392133, -0.9544148, -1.044454, 1, 1, 1, 1, 1,
-2.352773, 0.2652087, -1.75466, 1, 1, 1, 1, 1,
-2.245385, -1.311209, -1.538027, 1, 1, 1, 1, 1,
-2.163352, -1.145192, -0.9570906, 1, 1, 1, 1, 1,
-2.150163, 1.521135, -1.130834, 1, 1, 1, 1, 1,
-2.149683, -0.1192229, -1.717957, 1, 1, 1, 1, 1,
-2.113207, -0.4157705, -3.082073, 1, 1, 1, 1, 1,
-2.09962, 0.2465436, -4.133336, 1, 1, 1, 1, 1,
-2.076275, 0.6146153, -0.5706252, 1, 1, 1, 1, 1,
-2.052207, -0.5381791, -0.8576094, 1, 1, 1, 1, 1,
-2.045249, -0.3755676, -2.253948, 1, 1, 1, 1, 1,
-2.037553, 0.5860037, -2.579819, 1, 1, 1, 1, 1,
-2.037142, -0.1373066, -1.666604, 1, 1, 1, 1, 1,
-2.030917, -1.269234, -0.6153775, 1, 1, 1, 1, 1,
-2.013237, 0.2875753, -1.910376, 1, 1, 1, 1, 1,
-2.00036, 0.6705806, -0.733497, 0, 0, 1, 1, 1,
-1.977366, -0.3598416, -2.672928, 1, 0, 0, 1, 1,
-1.954953, -1.770955, -1.950325, 1, 0, 0, 1, 1,
-1.872105, -0.9099617, -1.677046, 1, 0, 0, 1, 1,
-1.829024, -1.327593, -0.8912738, 1, 0, 0, 1, 1,
-1.754754, 0.2618693, -2.059302, 1, 0, 0, 1, 1,
-1.750035, 0.5769627, -0.189668, 0, 0, 0, 1, 1,
-1.734527, -0.1198347, -2.644359, 0, 0, 0, 1, 1,
-1.731446, 0.3707929, -0.8630632, 0, 0, 0, 1, 1,
-1.719484, -1.128211, -1.275998, 0, 0, 0, 1, 1,
-1.716895, 0.7050132, -0.3725634, 0, 0, 0, 1, 1,
-1.710881, 0.7757244, -0.3143045, 0, 0, 0, 1, 1,
-1.704469, 0.1129678, -1.624102, 0, 0, 0, 1, 1,
-1.691064, -2.23447, -1.408291, 1, 1, 1, 1, 1,
-1.666064, 1.048284, -0.8657076, 1, 1, 1, 1, 1,
-1.665302, 0.6936777, 1.029863, 1, 1, 1, 1, 1,
-1.660315, -0.5482076, -0.6528538, 1, 1, 1, 1, 1,
-1.647506, -0.6369432, -3.521449, 1, 1, 1, 1, 1,
-1.633762, -0.7533618, -4.084418, 1, 1, 1, 1, 1,
-1.626285, 0.5016733, -2.325552, 1, 1, 1, 1, 1,
-1.611204, -0.6227356, -1.790496, 1, 1, 1, 1, 1,
-1.601698, -0.1082143, -3.338958, 1, 1, 1, 1, 1,
-1.596265, 0.818134, -2.227807, 1, 1, 1, 1, 1,
-1.592062, -0.0999679, -2.135111, 1, 1, 1, 1, 1,
-1.57964, -0.9540871, -3.962156, 1, 1, 1, 1, 1,
-1.571529, -1.87687, -0.9131891, 1, 1, 1, 1, 1,
-1.566676, 1.400816, -0.154897, 1, 1, 1, 1, 1,
-1.550816, -0.2088922, -1.539138, 1, 1, 1, 1, 1,
-1.544007, -0.06661496, -1.203405, 0, 0, 1, 1, 1,
-1.540197, 0.1775388, -0.3623909, 1, 0, 0, 1, 1,
-1.524616, 1.458894, -1.537747, 1, 0, 0, 1, 1,
-1.523927, -0.5097057, -1.663903, 1, 0, 0, 1, 1,
-1.515446, -0.3823343, -1.920509, 1, 0, 0, 1, 1,
-1.502789, -0.2587976, -1.84868, 1, 0, 0, 1, 1,
-1.498208, -0.722504, -0.9446834, 0, 0, 0, 1, 1,
-1.491137, 1.402148, -0.1471112, 0, 0, 0, 1, 1,
-1.477058, -0.877413, -2.073326, 0, 0, 0, 1, 1,
-1.464677, -0.5530429, -1.935921, 0, 0, 0, 1, 1,
-1.456259, -2.132281, -2.364285, 0, 0, 0, 1, 1,
-1.451229, -1.41901, -1.764534, 0, 0, 0, 1, 1,
-1.447635, 0.6597642, -1.439723, 0, 0, 0, 1, 1,
-1.435259, -0.8063659, -1.673085, 1, 1, 1, 1, 1,
-1.427299, -0.4802361, -0.3750733, 1, 1, 1, 1, 1,
-1.422848, 0.8238849, -1.488328, 1, 1, 1, 1, 1,
-1.419487, 1.650463, 0.4816371, 1, 1, 1, 1, 1,
-1.418483, 1.597119, 1.678822, 1, 1, 1, 1, 1,
-1.407018, 0.3708565, -1.703968, 1, 1, 1, 1, 1,
-1.402605, -1.125172, -2.725266, 1, 1, 1, 1, 1,
-1.397891, 0.9708875, -0.9795604, 1, 1, 1, 1, 1,
-1.390446, -0.06721748, -2.466406, 1, 1, 1, 1, 1,
-1.38401, -0.5353947, -2.175788, 1, 1, 1, 1, 1,
-1.38386, -0.4194523, -1.42105, 1, 1, 1, 1, 1,
-1.3597, -0.1643203, -3.212298, 1, 1, 1, 1, 1,
-1.353808, 2.076241, -2.661072, 1, 1, 1, 1, 1,
-1.349697, -1.757011, -3.854517, 1, 1, 1, 1, 1,
-1.347308, 0.3437103, 1.175341, 1, 1, 1, 1, 1,
-1.344113, -0.06959775, -3.648708, 0, 0, 1, 1, 1,
-1.338481, -0.625542, -3.114811, 1, 0, 0, 1, 1,
-1.337886, 1.133863, -1.954692, 1, 0, 0, 1, 1,
-1.333642, 1.809344, -0.6121172, 1, 0, 0, 1, 1,
-1.332162, -0.2063681, -3.10085, 1, 0, 0, 1, 1,
-1.328237, 1.460416, -0.912897, 1, 0, 0, 1, 1,
-1.325028, 0.0260585, -0.2411402, 0, 0, 0, 1, 1,
-1.322881, -0.7742358, -2.919751, 0, 0, 0, 1, 1,
-1.313803, -2.134923, -2.991532, 0, 0, 0, 1, 1,
-1.312687, -0.1729927, -2.640672, 0, 0, 0, 1, 1,
-1.310975, 0.7798058, -0.008544478, 0, 0, 0, 1, 1,
-1.295111, 1.324643, -2.156904, 0, 0, 0, 1, 1,
-1.293154, -0.1886681, -2.869284, 0, 0, 0, 1, 1,
-1.290758, -0.7785894, -1.062716, 1, 1, 1, 1, 1,
-1.285183, -2.032992, -3.48267, 1, 1, 1, 1, 1,
-1.284116, -0.4232201, -1.897909, 1, 1, 1, 1, 1,
-1.279074, -1.812613, -1.508773, 1, 1, 1, 1, 1,
-1.277429, -1.188707, -1.799976, 1, 1, 1, 1, 1,
-1.274677, -1.564618, -2.753875, 1, 1, 1, 1, 1,
-1.274253, -1.502156, -2.497391, 1, 1, 1, 1, 1,
-1.268654, 2.04263, 0.06235483, 1, 1, 1, 1, 1,
-1.265057, 0.7335151, -0.891979, 1, 1, 1, 1, 1,
-1.263797, -0.2779635, -1.623532, 1, 1, 1, 1, 1,
-1.262139, -0.4535997, -1.392134, 1, 1, 1, 1, 1,
-1.257701, -0.987842, -1.948013, 1, 1, 1, 1, 1,
-1.255657, 0.5881128, -1.233044, 1, 1, 1, 1, 1,
-1.255331, 2.309119, -1.818319, 1, 1, 1, 1, 1,
-1.252463, -0.4403286, -3.566911, 1, 1, 1, 1, 1,
-1.251031, 0.1126022, -1.577484, 0, 0, 1, 1, 1,
-1.244675, 0.3453069, -0.4010796, 1, 0, 0, 1, 1,
-1.236924, 1.240471, -0.5790403, 1, 0, 0, 1, 1,
-1.22969, 0.3062153, -0.2510372, 1, 0, 0, 1, 1,
-1.229589, 0.7114956, 0.4305145, 1, 0, 0, 1, 1,
-1.229095, 0.3406368, -0.6931959, 1, 0, 0, 1, 1,
-1.22207, 1.506421, -0.5827923, 0, 0, 0, 1, 1,
-1.213868, 0.0006468467, -0.399296, 0, 0, 0, 1, 1,
-1.201366, 0.8507488, -0.5017388, 0, 0, 0, 1, 1,
-1.200284, -0.1972856, -2.078228, 0, 0, 0, 1, 1,
-1.195098, -1.419172, -2.225532, 0, 0, 0, 1, 1,
-1.192669, 0.481625, -0.8397986, 0, 0, 0, 1, 1,
-1.192375, -0.3484858, -0.5876331, 0, 0, 0, 1, 1,
-1.187134, -0.2913859, -2.948524, 1, 1, 1, 1, 1,
-1.173881, 1.558259, -1.979485, 1, 1, 1, 1, 1,
-1.170987, 1.859677, 0.4278214, 1, 1, 1, 1, 1,
-1.166301, 0.2741683, -1.840036, 1, 1, 1, 1, 1,
-1.15809, 0.2136851, -1.986891, 1, 1, 1, 1, 1,
-1.154585, -0.06931313, -1.564986, 1, 1, 1, 1, 1,
-1.152708, -0.8790379, -2.030824, 1, 1, 1, 1, 1,
-1.151604, -0.4283471, -2.462534, 1, 1, 1, 1, 1,
-1.150306, -1.142478, -0.7947272, 1, 1, 1, 1, 1,
-1.135834, 0.6727796, -0.6151294, 1, 1, 1, 1, 1,
-1.134084, 2.401953, -1.756914, 1, 1, 1, 1, 1,
-1.131796, 0.3551141, -0.944154, 1, 1, 1, 1, 1,
-1.13137, -1.195085, -1.744628, 1, 1, 1, 1, 1,
-1.13006, 1.461979, -1.045522, 1, 1, 1, 1, 1,
-1.129928, -0.4022145, -1.347211, 1, 1, 1, 1, 1,
-1.122736, 0.7242836, -1.352626, 0, 0, 1, 1, 1,
-1.119937, 0.5896654, -1.351385, 1, 0, 0, 1, 1,
-1.113031, 1.27793, -0.2940302, 1, 0, 0, 1, 1,
-1.108562, 0.5348796, -1.256628, 1, 0, 0, 1, 1,
-1.104011, 2.022602, 1.049136, 1, 0, 0, 1, 1,
-1.10295, 0.5642102, -2.34077, 1, 0, 0, 1, 1,
-1.098738, -1.668151, -1.852474, 0, 0, 0, 1, 1,
-1.097834, -0.6097788, -0.6139694, 0, 0, 0, 1, 1,
-1.093043, -1.225672, -2.356231, 0, 0, 0, 1, 1,
-1.091319, -0.2986202, -1.729634, 0, 0, 0, 1, 1,
-1.087729, 1.444659, -0.3333804, 0, 0, 0, 1, 1,
-1.087494, 0.2166124, -0.7437345, 0, 0, 0, 1, 1,
-1.086008, -1.160771, -1.77552, 0, 0, 0, 1, 1,
-1.085357, -1.570589, -0.7500543, 1, 1, 1, 1, 1,
-1.085311, 1.189931, 0.1475884, 1, 1, 1, 1, 1,
-1.084568, 1.345592, -2.279154, 1, 1, 1, 1, 1,
-1.075871, 0.3507647, 0.3974038, 1, 1, 1, 1, 1,
-1.069523, 0.4591645, -0.3688613, 1, 1, 1, 1, 1,
-1.066784, 1.605913, 0.4615804, 1, 1, 1, 1, 1,
-1.064576, 0.4925862, -2.335562, 1, 1, 1, 1, 1,
-1.060422, 0.04685583, -1.155815, 1, 1, 1, 1, 1,
-1.057802, 0.9327325, -0.4766408, 1, 1, 1, 1, 1,
-1.057773, 0.5807561, -2.983019, 1, 1, 1, 1, 1,
-1.054445, -0.1043745, -0.7293627, 1, 1, 1, 1, 1,
-1.043512, -1.916508, -2.080619, 1, 1, 1, 1, 1,
-1.038978, -1.277467, -1.712031, 1, 1, 1, 1, 1,
-1.036084, 2.517642, 0.1627005, 1, 1, 1, 1, 1,
-1.031337, -1.050682, -2.992382, 1, 1, 1, 1, 1,
-1.030915, 0.4146211, -0.9489923, 0, 0, 1, 1, 1,
-1.029034, -0.5262807, -3.767323, 1, 0, 0, 1, 1,
-1.025919, 1.135153, 0.1833041, 1, 0, 0, 1, 1,
-1.025914, -0.8242084, -2.006232, 1, 0, 0, 1, 1,
-1.01423, 0.5837396, -1.595236, 1, 0, 0, 1, 1,
-1.009975, 0.4630772, -0.3865549, 1, 0, 0, 1, 1,
-1.003678, -0.2490481, -1.997237, 0, 0, 0, 1, 1,
-0.999381, 0.6816817, -2.601455, 0, 0, 0, 1, 1,
-0.9984877, -0.6461865, -3.893008, 0, 0, 0, 1, 1,
-0.9977408, 0.4472515, -0.8902516, 0, 0, 0, 1, 1,
-0.9934759, -1.32445, -3.145741, 0, 0, 0, 1, 1,
-0.9903582, -0.7333394, -1.466027, 0, 0, 0, 1, 1,
-0.9902749, -1.158824, -4.158347, 0, 0, 0, 1, 1,
-0.985026, -0.6821141, -2.506637, 1, 1, 1, 1, 1,
-0.9783583, 1.276929, 1.371794, 1, 1, 1, 1, 1,
-0.9770952, -1.405747, -3.110823, 1, 1, 1, 1, 1,
-0.9737218, -0.1330497, -0.8091193, 1, 1, 1, 1, 1,
-0.9657667, 0.4275866, -2.229189, 1, 1, 1, 1, 1,
-0.9639392, -0.1059813, -2.717329, 1, 1, 1, 1, 1,
-0.9601803, -0.3632351, -1.117861, 1, 1, 1, 1, 1,
-0.9536464, 0.9862238, -0.2126944, 1, 1, 1, 1, 1,
-0.9477468, 0.8793654, -0.351555, 1, 1, 1, 1, 1,
-0.9451779, -0.1056286, -0.3582772, 1, 1, 1, 1, 1,
-0.9425693, 0.8034891, -0.2498569, 1, 1, 1, 1, 1,
-0.9421328, 0.1319036, -2.724527, 1, 1, 1, 1, 1,
-0.9416681, 0.7098548, -0.03501112, 1, 1, 1, 1, 1,
-0.9262956, 0.1210065, -1.09744, 1, 1, 1, 1, 1,
-0.9235418, 0.269262, -1.715626, 1, 1, 1, 1, 1,
-0.9197801, -0.7746281, -0.9053755, 0, 0, 1, 1, 1,
-0.9186544, 1.194358, -1.182866, 1, 0, 0, 1, 1,
-0.9167988, -0.1191722, -0.9385067, 1, 0, 0, 1, 1,
-0.9158931, -0.5016938, -2.921489, 1, 0, 0, 1, 1,
-0.9125697, 1.068263, -1.610638, 1, 0, 0, 1, 1,
-0.9119499, -2.092273, -1.661197, 1, 0, 0, 1, 1,
-0.9065023, 0.2078523, -0.2205797, 0, 0, 0, 1, 1,
-0.9041046, 0.8121226, -0.3864104, 0, 0, 0, 1, 1,
-0.899514, -2.122492, -1.721562, 0, 0, 0, 1, 1,
-0.895234, -0.6611879, -2.559248, 0, 0, 0, 1, 1,
-0.8915529, -0.4864851, -2.053765, 0, 0, 0, 1, 1,
-0.8894765, -0.6321998, -2.223978, 0, 0, 0, 1, 1,
-0.88843, 0.8334392, -1.641767, 0, 0, 0, 1, 1,
-0.8873389, 0.4106806, 0.08524557, 1, 1, 1, 1, 1,
-0.8829622, 1.148185, -0.300285, 1, 1, 1, 1, 1,
-0.8748573, -1.603728, -2.977323, 1, 1, 1, 1, 1,
-0.872317, 2.156493, 0.04581498, 1, 1, 1, 1, 1,
-0.8680534, -0.1080387, -0.3818299, 1, 1, 1, 1, 1,
-0.8654644, 0.5169859, -0.7679916, 1, 1, 1, 1, 1,
-0.8527374, -2.061113, -2.268011, 1, 1, 1, 1, 1,
-0.8375289, -0.3727581, -1.847335, 1, 1, 1, 1, 1,
-0.8338135, 0.3492936, 0.2097299, 1, 1, 1, 1, 1,
-0.8327165, -0.01134662, -1.737608, 1, 1, 1, 1, 1,
-0.8326046, -1.780011, -3.456096, 1, 1, 1, 1, 1,
-0.82056, -0.04315566, -0.7196835, 1, 1, 1, 1, 1,
-0.8198735, -0.3898448, -3.647668, 1, 1, 1, 1, 1,
-0.8184283, 0.7462598, -1.375407, 1, 1, 1, 1, 1,
-0.8150316, -1.602689, -2.302145, 1, 1, 1, 1, 1,
-0.8150254, -1.135849, -2.177112, 0, 0, 1, 1, 1,
-0.8142006, -1.10431, -1.514383, 1, 0, 0, 1, 1,
-0.8093485, -0.2077698, -2.687018, 1, 0, 0, 1, 1,
-0.8028036, 1.086398, -0.2711926, 1, 0, 0, 1, 1,
-0.8003225, -1.025773, -1.55957, 1, 0, 0, 1, 1,
-0.7991784, -0.9559319, 0.9735172, 1, 0, 0, 1, 1,
-0.7932407, -2.72434, -2.242574, 0, 0, 0, 1, 1,
-0.7866939, 0.1692485, -2.355207, 0, 0, 0, 1, 1,
-0.7851341, 0.3294401, -0.02583763, 0, 0, 0, 1, 1,
-0.7773124, 2.299465, -0.9488011, 0, 0, 0, 1, 1,
-0.7746615, -0.1686369, -0.9127373, 0, 0, 0, 1, 1,
-0.7724911, -2.433059, -4.047117, 0, 0, 0, 1, 1,
-0.768883, -0.1239578, -1.634636, 0, 0, 0, 1, 1,
-0.7661673, 0.00749872, -0.7621784, 1, 1, 1, 1, 1,
-0.7653709, 2.082225, -0.4291793, 1, 1, 1, 1, 1,
-0.7612128, 0.2740358, -1.957127, 1, 1, 1, 1, 1,
-0.7587309, -0.3025428, -2.483432, 1, 1, 1, 1, 1,
-0.7575896, -0.2702506, -4.467464, 1, 1, 1, 1, 1,
-0.7493938, 0.1440221, 2.237936, 1, 1, 1, 1, 1,
-0.7478087, -0.07439046, -2.492051, 1, 1, 1, 1, 1,
-0.7444398, -1.468731, -1.413962, 1, 1, 1, 1, 1,
-0.7405654, -0.8543665, -3.667902, 1, 1, 1, 1, 1,
-0.7404569, 1.433543, 0.4533892, 1, 1, 1, 1, 1,
-0.7339296, -0.09510109, -1.331284, 1, 1, 1, 1, 1,
-0.7337171, 0.3568162, -2.750921, 1, 1, 1, 1, 1,
-0.7333205, 1.00119, 0.2953628, 1, 1, 1, 1, 1,
-0.728516, -0.618746, -2.682726, 1, 1, 1, 1, 1,
-0.7248576, 0.5360856, -0.7163126, 1, 1, 1, 1, 1,
-0.7164481, 0.03172857, -1.374517, 0, 0, 1, 1, 1,
-0.7106402, 0.1640084, -0.6979781, 1, 0, 0, 1, 1,
-0.7005148, -0.5061371, -4.378738, 1, 0, 0, 1, 1,
-0.6995176, 2.089372, -2.231546, 1, 0, 0, 1, 1,
-0.6975366, -0.8710968, -1.445064, 1, 0, 0, 1, 1,
-0.6956057, 1.332562, -0.7123501, 1, 0, 0, 1, 1,
-0.6933624, -1.590703, -3.378308, 0, 0, 0, 1, 1,
-0.6921398, 0.9862749, -0.1716433, 0, 0, 0, 1, 1,
-0.6856394, 0.04911078, -0.6227368, 0, 0, 0, 1, 1,
-0.6849663, 0.1885802, -0.9626903, 0, 0, 0, 1, 1,
-0.6807253, -1.260922, -2.366063, 0, 0, 0, 1, 1,
-0.6798515, -0.5924612, -2.947304, 0, 0, 0, 1, 1,
-0.6758359, 0.7580259, -1.497772, 0, 0, 0, 1, 1,
-0.6722426, 0.3359636, -1.163883, 1, 1, 1, 1, 1,
-0.6693389, -1.932275, -4.128749, 1, 1, 1, 1, 1,
-0.6661578, 0.2064655, -1.609512, 1, 1, 1, 1, 1,
-0.6592839, 1.537889, -0.7105626, 1, 1, 1, 1, 1,
-0.6591404, -0.6116464, -2.450218, 1, 1, 1, 1, 1,
-0.6558324, -0.7832417, -2.415209, 1, 1, 1, 1, 1,
-0.6527548, 0.3674618, -2.762756, 1, 1, 1, 1, 1,
-0.6510225, 0.2882917, -3.568737, 1, 1, 1, 1, 1,
-0.6443222, 0.3128608, -1.575586, 1, 1, 1, 1, 1,
-0.6418252, -0.8910377, -2.280903, 1, 1, 1, 1, 1,
-0.6403922, 0.3034484, 0.2691101, 1, 1, 1, 1, 1,
-0.6400493, 1.776973, -1.374928, 1, 1, 1, 1, 1,
-0.6378595, -0.1230637, -3.225565, 1, 1, 1, 1, 1,
-0.6334299, 0.06233273, -2.32807, 1, 1, 1, 1, 1,
-0.6330209, 0.4962963, -0.4195805, 1, 1, 1, 1, 1,
-0.6256366, -0.8007913, -2.576329, 0, 0, 1, 1, 1,
-0.6244481, -0.7096753, -3.902199, 1, 0, 0, 1, 1,
-0.6237378, -0.8426295, -2.930459, 1, 0, 0, 1, 1,
-0.6231588, -1.350356, -4.776424, 1, 0, 0, 1, 1,
-0.6230117, -0.7815005, -2.699492, 1, 0, 0, 1, 1,
-0.6220574, 0.9383217, 0.2677019, 1, 0, 0, 1, 1,
-0.6167824, 0.621979, 0.6504625, 0, 0, 0, 1, 1,
-0.6133391, -0.7703107, -1.215354, 0, 0, 0, 1, 1,
-0.6127805, 0.1528644, -2.155814, 0, 0, 0, 1, 1,
-0.6111342, 1.765876, -0.397444, 0, 0, 0, 1, 1,
-0.6105067, -0.7603323, -1.950105, 0, 0, 0, 1, 1,
-0.6100098, 1.611487, -0.3329597, 0, 0, 0, 1, 1,
-0.6096428, 1.019309, 1.634129, 0, 0, 0, 1, 1,
-0.6090134, -0.909678, -2.860953, 1, 1, 1, 1, 1,
-0.6036115, 0.024243, -2.322561, 1, 1, 1, 1, 1,
-0.5954686, -0.3798392, -3.764362, 1, 1, 1, 1, 1,
-0.5934051, 0.9284021, -1.651037, 1, 1, 1, 1, 1,
-0.5931845, -0.910184, -2.053985, 1, 1, 1, 1, 1,
-0.5906187, -0.2756349, -3.819798, 1, 1, 1, 1, 1,
-0.5899119, 1.080376, -2.081754, 1, 1, 1, 1, 1,
-0.5849054, 0.6927876, 0.2289625, 1, 1, 1, 1, 1,
-0.5830531, -0.6445267, -2.511959, 1, 1, 1, 1, 1,
-0.5744444, -0.7465564, -1.950979, 1, 1, 1, 1, 1,
-0.5740029, -0.8921224, -2.555294, 1, 1, 1, 1, 1,
-0.5704833, -1.24332, -2.37253, 1, 1, 1, 1, 1,
-0.5645998, -1.323014, -4.72872, 1, 1, 1, 1, 1,
-0.5622737, -2.336506, -2.006685, 1, 1, 1, 1, 1,
-0.562253, 0.3921921, 0.8286573, 1, 1, 1, 1, 1,
-0.5621166, -0.5858754, -1.175001, 0, 0, 1, 1, 1,
-0.5618021, -1.151996, -3.937325, 1, 0, 0, 1, 1,
-0.5605164, 0.4918205, -0.7089561, 1, 0, 0, 1, 1,
-0.5572825, -0.4003497, -0.3802838, 1, 0, 0, 1, 1,
-0.5527065, 0.6883527, -0.8714983, 1, 0, 0, 1, 1,
-0.5522932, 0.670027, -1.500478, 1, 0, 0, 1, 1,
-0.5503246, 0.5382051, -1.540979, 0, 0, 0, 1, 1,
-0.5492952, 0.6446217, 0.7847666, 0, 0, 0, 1, 1,
-0.5478607, 0.3142357, -1.12142, 0, 0, 0, 1, 1,
-0.5445374, -0.04757399, -2.597355, 0, 0, 0, 1, 1,
-0.5426218, -0.02160613, -0.7233086, 0, 0, 0, 1, 1,
-0.5413455, 0.5787602, -0.3956375, 0, 0, 0, 1, 1,
-0.5362641, 0.4179048, -1.59193, 0, 0, 0, 1, 1,
-0.5362123, 0.04858175, -0.6563184, 1, 1, 1, 1, 1,
-0.5343949, -1.111889, -2.902283, 1, 1, 1, 1, 1,
-0.5323246, -0.04885175, -2.346916, 1, 1, 1, 1, 1,
-0.5243841, -0.9810387, -3.984332, 1, 1, 1, 1, 1,
-0.5223399, -0.9577623, -3.64273, 1, 1, 1, 1, 1,
-0.5191044, -0.5950949, -1.535052, 1, 1, 1, 1, 1,
-0.518214, 0.3072326, -0.2730412, 1, 1, 1, 1, 1,
-0.5179307, -1.163152, -4.233974, 1, 1, 1, 1, 1,
-0.5166919, 0.4375662, -1.373188, 1, 1, 1, 1, 1,
-0.5159443, -0.1192082, -2.991949, 1, 1, 1, 1, 1,
-0.5148116, -1.345536, -4.01823, 1, 1, 1, 1, 1,
-0.5109072, 0.7124744, -2.037315, 1, 1, 1, 1, 1,
-0.5068104, -0.3694601, -1.504147, 1, 1, 1, 1, 1,
-0.5049088, -1.312961, -4.181688, 1, 1, 1, 1, 1,
-0.5028241, -0.9801963, -3.364854, 1, 1, 1, 1, 1,
-0.5016707, 1.841514, 0.09535614, 0, 0, 1, 1, 1,
-0.4959015, -0.4035426, -3.074885, 1, 0, 0, 1, 1,
-0.4930027, 1.272028, 0.5352538, 1, 0, 0, 1, 1,
-0.4922272, 0.520734, -0.6760071, 1, 0, 0, 1, 1,
-0.4871035, 0.4017767, -0.524343, 1, 0, 0, 1, 1,
-0.4774123, 0.6827247, -1.824502, 1, 0, 0, 1, 1,
-0.4752961, -0.4763696, -3.738029, 0, 0, 0, 1, 1,
-0.4744371, -1.494205, -2.243345, 0, 0, 0, 1, 1,
-0.4744335, -1.289851, -3.199348, 0, 0, 0, 1, 1,
-0.47031, 1.187043, 0.7294528, 0, 0, 0, 1, 1,
-0.4655725, -0.8759277, -1.683853, 0, 0, 0, 1, 1,
-0.4623607, -0.04085213, -1.627446, 0, 0, 0, 1, 1,
-0.4569138, 0.02038133, -2.456018, 0, 0, 0, 1, 1,
-0.4560813, -0.7702509, -2.482608, 1, 1, 1, 1, 1,
-0.4542995, 1.281423, 0.6875873, 1, 1, 1, 1, 1,
-0.4525336, 1.359953, -1.343153, 1, 1, 1, 1, 1,
-0.4503571, 0.2433895, -2.577388, 1, 1, 1, 1, 1,
-0.4488832, 1.209254, -0.9785237, 1, 1, 1, 1, 1,
-0.4459538, 1.078266, 0.3442341, 1, 1, 1, 1, 1,
-0.4382985, 1.594081, -0.151992, 1, 1, 1, 1, 1,
-0.4370007, -0.5956823, -4.028396, 1, 1, 1, 1, 1,
-0.4345195, -0.1004858, -1.045324, 1, 1, 1, 1, 1,
-0.4343992, -0.391553, -4.378848, 1, 1, 1, 1, 1,
-0.4308491, -1.008086, -1.617162, 1, 1, 1, 1, 1,
-0.4283718, 1.032401, -0.3634676, 1, 1, 1, 1, 1,
-0.4156739, 0.9366198, -1.148673, 1, 1, 1, 1, 1,
-0.4108704, 1.565258, -1.406805, 1, 1, 1, 1, 1,
-0.4081839, 0.472924, -0.659545, 1, 1, 1, 1, 1,
-0.4027123, -0.817847, -2.768658, 0, 0, 1, 1, 1,
-0.3937359, 0.3508181, -0.9072298, 1, 0, 0, 1, 1,
-0.3906986, 0.1261634, -1.670776, 1, 0, 0, 1, 1,
-0.3859828, 0.4263963, -0.3990018, 1, 0, 0, 1, 1,
-0.3791441, -0.8307261, -3.055875, 1, 0, 0, 1, 1,
-0.3781472, -0.190655, -1.410142, 1, 0, 0, 1, 1,
-0.3753853, -1.019228, -2.061281, 0, 0, 0, 1, 1,
-0.3752916, -0.6083374, -4.794329, 0, 0, 0, 1, 1,
-0.375037, -2.810155, -1.652361, 0, 0, 0, 1, 1,
-0.3749634, 1.307214, -0.680716, 0, 0, 0, 1, 1,
-0.3739488, 0.131514, -0.8789871, 0, 0, 0, 1, 1,
-0.3729692, 0.1521078, 0.3259125, 0, 0, 0, 1, 1,
-0.3722639, 0.3742233, -1.986066, 0, 0, 0, 1, 1,
-0.3710465, -0.822746, -1.849607, 1, 1, 1, 1, 1,
-0.3703244, 0.9837922, -0.06311364, 1, 1, 1, 1, 1,
-0.3677943, 0.09879749, -0.7932969, 1, 1, 1, 1, 1,
-0.3652025, 1.617024, -0.8401325, 1, 1, 1, 1, 1,
-0.3627405, 0.772892, -0.691263, 1, 1, 1, 1, 1,
-0.3610202, 2.073562, 0.6283895, 1, 1, 1, 1, 1,
-0.3607657, 0.108072, -1.880777, 1, 1, 1, 1, 1,
-0.3599958, 1.09484, 0.6770594, 1, 1, 1, 1, 1,
-0.3586361, -0.5572429, -1.108422, 1, 1, 1, 1, 1,
-0.3534745, -0.6425296, -0.2826647, 1, 1, 1, 1, 1,
-0.3494558, 0.2362441, -0.7719195, 1, 1, 1, 1, 1,
-0.3431118, -0.2922477, -3.029216, 1, 1, 1, 1, 1,
-0.3388861, -2.165864, -1.547909, 1, 1, 1, 1, 1,
-0.3356834, -0.8106572, -2.428061, 1, 1, 1, 1, 1,
-0.3205573, -0.4125979, -1.153624, 1, 1, 1, 1, 1,
-0.3173158, -0.3080335, -0.4094217, 0, 0, 1, 1, 1,
-0.3172575, -0.6207316, -3.151641, 1, 0, 0, 1, 1,
-0.3133667, 0.5722537, 0.9240816, 1, 0, 0, 1, 1,
-0.3102965, -0.7574886, -2.780924, 1, 0, 0, 1, 1,
-0.307525, -0.5547932, -3.187533, 1, 0, 0, 1, 1,
-0.3072964, 0.4590066, -2.30269, 1, 0, 0, 1, 1,
-0.3062512, -1.201921, -2.223989, 0, 0, 0, 1, 1,
-0.2912126, -0.3204766, -3.471749, 0, 0, 0, 1, 1,
-0.2904246, -2.818675, -3.330901, 0, 0, 0, 1, 1,
-0.2877125, -1.099611, -2.507476, 0, 0, 0, 1, 1,
-0.2836235, 0.4215556, -0.8023494, 0, 0, 0, 1, 1,
-0.2766687, -1.716039, -4.385082, 0, 0, 0, 1, 1,
-0.2752987, -0.9094811, -2.257872, 0, 0, 0, 1, 1,
-0.2740333, -0.9231911, -3.550683, 1, 1, 1, 1, 1,
-0.2732277, -0.9300179, -2.579155, 1, 1, 1, 1, 1,
-0.2696947, -1.087239, -3.159919, 1, 1, 1, 1, 1,
-0.2683508, 0.5708269, -1.064686, 1, 1, 1, 1, 1,
-0.2676174, -0.7462341, -4.229573, 1, 1, 1, 1, 1,
-0.2667638, 0.2248177, 0.1100073, 1, 1, 1, 1, 1,
-0.2656668, -1.209625, -2.41817, 1, 1, 1, 1, 1,
-0.2629843, -2.40089, -2.879369, 1, 1, 1, 1, 1,
-0.2590906, 1.070083, -0.167163, 1, 1, 1, 1, 1,
-0.2517758, -0.8624895, -0.8440143, 1, 1, 1, 1, 1,
-0.2473567, -1.904217, -3.033669, 1, 1, 1, 1, 1,
-0.2445988, -0.319263, -3.734661, 1, 1, 1, 1, 1,
-0.2441331, 0.3838696, -2.54031, 1, 1, 1, 1, 1,
-0.2437164, -0.3363109, -2.573193, 1, 1, 1, 1, 1,
-0.2422313, -0.9222057, -3.316478, 1, 1, 1, 1, 1,
-0.2409361, -1.466392, -2.751129, 0, 0, 1, 1, 1,
-0.2363238, -0.1673542, -2.912458, 1, 0, 0, 1, 1,
-0.2304606, 1.179176, -1.484481, 1, 0, 0, 1, 1,
-0.2285646, 1.637924, -0.09939662, 1, 0, 0, 1, 1,
-0.2263275, -1.08542, -3.259044, 1, 0, 0, 1, 1,
-0.2225546, 1.026588, 1.17224, 1, 0, 0, 1, 1,
-0.22136, -0.1701271, -3.108201, 0, 0, 0, 1, 1,
-0.2181494, 0.7674382, -1.675896, 0, 0, 0, 1, 1,
-0.2153292, 1.290783, -0.1106186, 0, 0, 0, 1, 1,
-0.214394, 0.1584082, 0.3457263, 0, 0, 0, 1, 1,
-0.2118751, -1.138186, -3.98611, 0, 0, 0, 1, 1,
-0.2016309, 0.8096249, -0.03058565, 0, 0, 0, 1, 1,
-0.1998699, -0.7363502, -3.908304, 0, 0, 0, 1, 1,
-0.1981071, 0.5233182, -0.2867441, 1, 1, 1, 1, 1,
-0.1958046, -1.781357, -1.259606, 1, 1, 1, 1, 1,
-0.1920178, -1.020924, -3.012632, 1, 1, 1, 1, 1,
-0.1918794, -1.221769, -2.644851, 1, 1, 1, 1, 1,
-0.1917657, -0.7288863, -3.45438, 1, 1, 1, 1, 1,
-0.1909422, 0.7425891, -1.892209, 1, 1, 1, 1, 1,
-0.1907374, -0.6832583, -3.858785, 1, 1, 1, 1, 1,
-0.1819249, -0.4414375, -3.11948, 1, 1, 1, 1, 1,
-0.1776012, -0.2311884, -2.882766, 1, 1, 1, 1, 1,
-0.1728066, 0.4822883, -0.2389657, 1, 1, 1, 1, 1,
-0.1726651, -0.3609441, -3.544046, 1, 1, 1, 1, 1,
-0.1675737, -0.985781, -1.739498, 1, 1, 1, 1, 1,
-0.1672121, -1.212585, -4.645837, 1, 1, 1, 1, 1,
-0.1661417, 0.9265769, 0.5127746, 1, 1, 1, 1, 1,
-0.1624604, -0.4512023, -3.746356, 1, 1, 1, 1, 1,
-0.1620879, 0.7374414, -2.026489, 0, 0, 1, 1, 1,
-0.1615258, -1.095, -3.231899, 1, 0, 0, 1, 1,
-0.1605714, 0.3234129, -0.05774434, 1, 0, 0, 1, 1,
-0.154744, 0.1158197, -0.5969982, 1, 0, 0, 1, 1,
-0.1547094, 1.901112, -0.8349565, 1, 0, 0, 1, 1,
-0.152313, -1.869045, -3.103156, 1, 0, 0, 1, 1,
-0.1500792, -0.6873336, -2.056953, 0, 0, 0, 1, 1,
-0.1478555, -2.429252, -1.088863, 0, 0, 0, 1, 1,
-0.1428829, 1.995805, 0.5309855, 0, 0, 0, 1, 1,
-0.1416043, -0.2479147, -1.73382, 0, 0, 0, 1, 1,
-0.1365902, -0.2509192, -2.603248, 0, 0, 0, 1, 1,
-0.1362301, -1.004767, -4.85732, 0, 0, 0, 1, 1,
-0.1349234, -0.6442266, -4.043983, 0, 0, 0, 1, 1,
-0.1338491, -0.6683739, -3.402887, 1, 1, 1, 1, 1,
-0.1330785, -0.8854337, -4.273635, 1, 1, 1, 1, 1,
-0.1286559, -0.6863355, -3.049986, 1, 1, 1, 1, 1,
-0.1277877, -1.994975, -2.899107, 1, 1, 1, 1, 1,
-0.1229226, -0.2424256, -3.42133, 1, 1, 1, 1, 1,
-0.1228354, 0.5198084, -1.597137, 1, 1, 1, 1, 1,
-0.122502, 0.6151978, -0.636484, 1, 1, 1, 1, 1,
-0.1197185, -1.005037, -4.541519, 1, 1, 1, 1, 1,
-0.1159146, 0.4019382, -0.2796189, 1, 1, 1, 1, 1,
-0.1157096, -0.4359113, -3.044418, 1, 1, 1, 1, 1,
-0.1132921, 1.359132, -0.6328333, 1, 1, 1, 1, 1,
-0.1118977, -0.4384219, -3.515651, 1, 1, 1, 1, 1,
-0.1110895, -0.8937187, -4.066364, 1, 1, 1, 1, 1,
-0.1091487, -0.7815177, -4.260144, 1, 1, 1, 1, 1,
-0.1088749, 0.6377599, -0.756465, 1, 1, 1, 1, 1,
-0.1049347, 1.223871, -0.1743495, 0, 0, 1, 1, 1,
-0.1009298, 1.434611, -0.1307711, 1, 0, 0, 1, 1,
-0.09873766, 1.023851, -0.6048685, 1, 0, 0, 1, 1,
-0.09686521, -0.6397079, -3.621063, 1, 0, 0, 1, 1,
-0.09667034, -0.08716106, -3.143114, 1, 0, 0, 1, 1,
-0.09502088, -0.5507694, -4.426092, 1, 0, 0, 1, 1,
-0.09213392, 0.8524107, -1.319413, 0, 0, 0, 1, 1,
-0.09169992, -2.186337, -4.107228, 0, 0, 0, 1, 1,
-0.07970253, 1.513746, 0.4940669, 0, 0, 0, 1, 1,
-0.07822462, 0.2807962, 1.61525, 0, 0, 0, 1, 1,
-0.0744889, 0.8326333, -0.4771661, 0, 0, 0, 1, 1,
-0.07078588, 1.585152, 0.2597007, 0, 0, 0, 1, 1,
-0.06948379, 0.4141268, 0.526008, 0, 0, 0, 1, 1,
-0.06930608, 0.3390103, -0.9110441, 1, 1, 1, 1, 1,
-0.06383869, -0.3728566, -3.329144, 1, 1, 1, 1, 1,
-0.06183133, 0.3054995, 0.0511991, 1, 1, 1, 1, 1,
-0.06131622, -0.6317227, -2.847919, 1, 1, 1, 1, 1,
-0.05653942, -0.009015783, -3.561631, 1, 1, 1, 1, 1,
-0.05043995, -0.3247501, -0.5249727, 1, 1, 1, 1, 1,
-0.04780531, -1.179883, -3.738778, 1, 1, 1, 1, 1,
-0.04503408, -0.8355569, -4.395238, 1, 1, 1, 1, 1,
-0.03557216, 1.096261, 1.403548, 1, 1, 1, 1, 1,
-0.03161927, 0.2048932, 0.870887, 1, 1, 1, 1, 1,
-0.03072169, 0.9253268, 0.1436719, 1, 1, 1, 1, 1,
-0.02979641, -0.4825121, -2.462488, 1, 1, 1, 1, 1,
-0.02898143, -0.09371106, -3.345563, 1, 1, 1, 1, 1,
-0.02399951, -1.44797, -4.602335, 1, 1, 1, 1, 1,
-0.02370528, 1.526404, 0.2620209, 1, 1, 1, 1, 1,
-0.01970793, 0.1734831, -0.4323947, 0, 0, 1, 1, 1,
-0.01254712, -1.115123, -2.640513, 1, 0, 0, 1, 1,
-0.01215698, -0.7319657, -2.37813, 1, 0, 0, 1, 1,
-0.005898282, -1.434136, -3.081118, 1, 0, 0, 1, 1,
-0.005019566, 0.548373, 0.01887803, 1, 0, 0, 1, 1,
-0.004484301, -0.5879822, -1.942088, 1, 0, 0, 1, 1,
-0.004215457, 0.4720187, -0.7890317, 0, 0, 0, 1, 1,
0.0006206906, -1.153805, 1.984409, 0, 0, 0, 1, 1,
0.003006479, 1.308251, -0.1531385, 0, 0, 0, 1, 1,
0.009281563, 0.5716492, -0.3113583, 0, 0, 0, 1, 1,
0.01454502, -0.1421129, 1.520544, 0, 0, 0, 1, 1,
0.01456828, 2.156751, -1.7132, 0, 0, 0, 1, 1,
0.01700852, 1.975472, 1.966163, 0, 0, 0, 1, 1,
0.01853481, -0.2565923, 1.428794, 1, 1, 1, 1, 1,
0.02380069, -1.311357, 3.694922, 1, 1, 1, 1, 1,
0.02452189, -1.741036, 4.608989, 1, 1, 1, 1, 1,
0.02731759, -0.9961736, 3.521015, 1, 1, 1, 1, 1,
0.03146925, -1.336075, 2.451706, 1, 1, 1, 1, 1,
0.0366005, 0.972461, -1.114723, 1, 1, 1, 1, 1,
0.03876052, -0.1726542, 6.717714, 1, 1, 1, 1, 1,
0.04015949, 0.2352336, 0.2146434, 1, 1, 1, 1, 1,
0.04037205, -0.4279933, 5.179016, 1, 1, 1, 1, 1,
0.04061301, -0.9468408, 3.363106, 1, 1, 1, 1, 1,
0.04130518, 0.04576095, 0.09447376, 1, 1, 1, 1, 1,
0.04355776, -0.3741398, 1.334242, 1, 1, 1, 1, 1,
0.04897952, -0.3882915, 4.582962, 1, 1, 1, 1, 1,
0.0498359, -1.927737, 3.804153, 1, 1, 1, 1, 1,
0.05381795, 0.09901915, 0.5817023, 1, 1, 1, 1, 1,
0.05415214, -0.6215162, 3.304494, 0, 0, 1, 1, 1,
0.05542177, -1.634921, 1.564853, 1, 0, 0, 1, 1,
0.05563366, 0.3868925, -0.2530449, 1, 0, 0, 1, 1,
0.05671129, -0.4218287, 2.432034, 1, 0, 0, 1, 1,
0.06230435, -0.108988, 2.033085, 1, 0, 0, 1, 1,
0.06414521, -1.114115, 2.772037, 1, 0, 0, 1, 1,
0.06839721, 0.6179473, 0.1382099, 0, 0, 0, 1, 1,
0.06931695, 1.477863, 0.6326212, 0, 0, 0, 1, 1,
0.07541921, -0.6046713, 3.400275, 0, 0, 0, 1, 1,
0.08277113, 0.1717424, 0.8725388, 0, 0, 0, 1, 1,
0.08514812, -0.8774176, 1.807818, 0, 0, 0, 1, 1,
0.08732546, 0.4706976, 0.8515909, 0, 0, 0, 1, 1,
0.08765541, 0.04519885, 1.271763, 0, 0, 0, 1, 1,
0.09178054, -1.781316, 4.217259, 1, 1, 1, 1, 1,
0.09345287, -0.7871461, 2.883026, 1, 1, 1, 1, 1,
0.0971242, 0.01282694, 0.3916045, 1, 1, 1, 1, 1,
0.09849846, -2.512803, 2.64333, 1, 1, 1, 1, 1,
0.09896697, -0.4389634, 1.887774, 1, 1, 1, 1, 1,
0.1060099, -1.046781, 4.001578, 1, 1, 1, 1, 1,
0.110997, -0.9500319, 1.315322, 1, 1, 1, 1, 1,
0.1117675, 0.004557085, 1.847727, 1, 1, 1, 1, 1,
0.1126785, 1.34959, 0.6565199, 1, 1, 1, 1, 1,
0.113749, 1.341925, -0.5269912, 1, 1, 1, 1, 1,
0.1141042, -0.321116, 1.76647, 1, 1, 1, 1, 1,
0.1179629, -0.1664865, 1.678062, 1, 1, 1, 1, 1,
0.1194863, -0.3593704, 2.327488, 1, 1, 1, 1, 1,
0.1196667, -0.6808326, 4.465094, 1, 1, 1, 1, 1,
0.122466, 0.228877, 0.7196102, 1, 1, 1, 1, 1,
0.1238063, 0.3636887, 1.590376, 0, 0, 1, 1, 1,
0.1254177, -2.08323, 1.684151, 1, 0, 0, 1, 1,
0.1285642, 0.2773336, 1.123094, 1, 0, 0, 1, 1,
0.1319805, 1.379907, 1.066507, 1, 0, 0, 1, 1,
0.1349828, 0.06877283, 1.029341, 1, 0, 0, 1, 1,
0.1380465, -1.167063, 4.138634, 1, 0, 0, 1, 1,
0.1455268, -0.2811731, 3.307441, 0, 0, 0, 1, 1,
0.1530524, 0.4951242, 2.33607, 0, 0, 0, 1, 1,
0.1621123, -0.1752674, 2.271448, 0, 0, 0, 1, 1,
0.1621188, -1.296639, 3.241449, 0, 0, 0, 1, 1,
0.1625272, -0.05379786, 1.292498, 0, 0, 0, 1, 1,
0.1647146, -1.253653, 3.168287, 0, 0, 0, 1, 1,
0.1655007, 0.707781, 1.924018, 0, 0, 0, 1, 1,
0.1695594, 0.8349712, 1.863876, 1, 1, 1, 1, 1,
0.1705859, 0.8464703, -0.7888951, 1, 1, 1, 1, 1,
0.1716068, -0.1830439, 3.427065, 1, 1, 1, 1, 1,
0.1799649, -1.178233, 3.520846, 1, 1, 1, 1, 1,
0.1876376, -1.741458, 0.9184535, 1, 1, 1, 1, 1,
0.1901375, -0.3515468, 1.774059, 1, 1, 1, 1, 1,
0.1959466, -0.9384183, 4.766089, 1, 1, 1, 1, 1,
0.1974579, 1.798377, 1.168901, 1, 1, 1, 1, 1,
0.2019746, 0.3101985, -0.02149664, 1, 1, 1, 1, 1,
0.2027312, -1.051044, 2.688781, 1, 1, 1, 1, 1,
0.20674, -0.5741783, 3.852801, 1, 1, 1, 1, 1,
0.2114407, 0.3530183, 0.7614396, 1, 1, 1, 1, 1,
0.2146234, -0.5163116, -0.1863244, 1, 1, 1, 1, 1,
0.2166386, -0.3469799, 2.763026, 1, 1, 1, 1, 1,
0.2167254, -0.2409116, 1.187856, 1, 1, 1, 1, 1,
0.2215816, -1.428271, 2.774755, 0, 0, 1, 1, 1,
0.222707, 1.059798, 0.1149421, 1, 0, 0, 1, 1,
0.2276556, 0.7637653, 1.170854, 1, 0, 0, 1, 1,
0.2293084, 0.264832, -0.5196173, 1, 0, 0, 1, 1,
0.2333761, 0.7976499, 0.07617756, 1, 0, 0, 1, 1,
0.2357012, -0.3848707, 1.742653, 1, 0, 0, 1, 1,
0.2424015, 0.3986636, 0.6379661, 0, 0, 0, 1, 1,
0.2447008, -1.03585, 2.72338, 0, 0, 0, 1, 1,
0.2475698, 0.2952924, 1.095051, 0, 0, 0, 1, 1,
0.249532, 0.391164, 1.686388, 0, 0, 0, 1, 1,
0.2506402, 0.4519785, 0.7511842, 0, 0, 0, 1, 1,
0.2527989, 0.1738206, 1.19707, 0, 0, 0, 1, 1,
0.2545263, 0.6847541, -0.09584095, 0, 0, 0, 1, 1,
0.2547577, -1.757346, 2.297845, 1, 1, 1, 1, 1,
0.2566565, -1.02136, 4.942172, 1, 1, 1, 1, 1,
0.2588207, 0.9498874, -0.05090186, 1, 1, 1, 1, 1,
0.2623765, -0.5665595, 0.4871365, 1, 1, 1, 1, 1,
0.2623865, -0.1596238, 2.247152, 1, 1, 1, 1, 1,
0.2626529, -0.720583, 2.644988, 1, 1, 1, 1, 1,
0.2680483, -0.4047799, 3.298726, 1, 1, 1, 1, 1,
0.2697404, 0.4605867, 1.810701, 1, 1, 1, 1, 1,
0.2698781, 0.5222183, -0.152833, 1, 1, 1, 1, 1,
0.2714886, 1.006366, -0.5215225, 1, 1, 1, 1, 1,
0.273377, 1.473985, 0.9062733, 1, 1, 1, 1, 1,
0.2784437, -0.43093, 2.076451, 1, 1, 1, 1, 1,
0.2822935, 1.19714, -0.6114958, 1, 1, 1, 1, 1,
0.2848856, -0.1083427, 1.149226, 1, 1, 1, 1, 1,
0.2863196, 0.06054299, 0.2243382, 1, 1, 1, 1, 1,
0.2881964, -1.259309, 4.067382, 0, 0, 1, 1, 1,
0.2886188, 1.210841, 1.154128, 1, 0, 0, 1, 1,
0.2890822, 1.105103, 0.03627755, 1, 0, 0, 1, 1,
0.2915201, -0.303152, 2.384053, 1, 0, 0, 1, 1,
0.2918725, -0.4588027, 4.42982, 1, 0, 0, 1, 1,
0.2932005, -2.845749, 3.544281, 1, 0, 0, 1, 1,
0.2975591, -0.6421334, 3.470076, 0, 0, 0, 1, 1,
0.2994287, 0.381771, -0.975045, 0, 0, 0, 1, 1,
0.2995712, -0.8850744, 0.9820579, 0, 0, 0, 1, 1,
0.3006161, -1.617137, 1.646899, 0, 0, 0, 1, 1,
0.3015653, -1.635556, 2.89292, 0, 0, 0, 1, 1,
0.3023399, -0.3024079, 1.304241, 0, 0, 0, 1, 1,
0.3037286, -0.2126231, 2.190074, 0, 0, 0, 1, 1,
0.3077216, 0.172604, 0.9653144, 1, 1, 1, 1, 1,
0.3084946, 2.513721, -1.558666, 1, 1, 1, 1, 1,
0.3085132, 0.6362861, 1.838237, 1, 1, 1, 1, 1,
0.3114394, 0.3456035, -0.946627, 1, 1, 1, 1, 1,
0.3165734, 2.816596, 0.2950606, 1, 1, 1, 1, 1,
0.3216961, -1.91389, 4.025858, 1, 1, 1, 1, 1,
0.3219816, -0.3139554, 2.313328, 1, 1, 1, 1, 1,
0.3222618, 0.4530893, 1.126321, 1, 1, 1, 1, 1,
0.3229666, -1.165546, 5.320788, 1, 1, 1, 1, 1,
0.3280112, -0.889118, 2.704299, 1, 1, 1, 1, 1,
0.3300743, -0.9821633, 2.662974, 1, 1, 1, 1, 1,
0.333827, -0.6660272, 3.510949, 1, 1, 1, 1, 1,
0.3342222, 1.785506, 1.555206, 1, 1, 1, 1, 1,
0.3342477, -0.157617, 1.723983, 1, 1, 1, 1, 1,
0.3367261, -0.1027116, 2.209132, 1, 1, 1, 1, 1,
0.3384019, -2.146406, 2.793686, 0, 0, 1, 1, 1,
0.3418829, -1.277947, 2.654328, 1, 0, 0, 1, 1,
0.3463955, -0.1398299, 2.908186, 1, 0, 0, 1, 1,
0.3485863, -0.2458696, 1.575367, 1, 0, 0, 1, 1,
0.3503664, -0.4453239, 3.427731, 1, 0, 0, 1, 1,
0.3529059, 1.508084, -0.8192565, 1, 0, 0, 1, 1,
0.3530048, -1.264744, 2.081444, 0, 0, 0, 1, 1,
0.3589832, 0.5079356, 1.708415, 0, 0, 0, 1, 1,
0.3626642, 0.3247179, -0.9918101, 0, 0, 0, 1, 1,
0.3654538, -0.4180173, 1.838546, 0, 0, 0, 1, 1,
0.3667146, 0.6212697, 0.2530331, 0, 0, 0, 1, 1,
0.3684042, -1.133285, 2.43942, 0, 0, 0, 1, 1,
0.3745915, -1.59881, 2.649658, 0, 0, 0, 1, 1,
0.3750043, -0.2303858, 1.204073, 1, 1, 1, 1, 1,
0.3786497, 0.8838782, -1.86824, 1, 1, 1, 1, 1,
0.3800215, 1.613404, -0.8275634, 1, 1, 1, 1, 1,
0.3847166, -0.6712668, 3.388259, 1, 1, 1, 1, 1,
0.3851284, 2.809182, -0.4828727, 1, 1, 1, 1, 1,
0.3866241, -0.2794608, 1.988878, 1, 1, 1, 1, 1,
0.3911123, -0.7543648, 3.717565, 1, 1, 1, 1, 1,
0.395686, 0.01409539, 1.093729, 1, 1, 1, 1, 1,
0.3971213, -0.771476, 3.617881, 1, 1, 1, 1, 1,
0.3996176, -0.1167594, 2.949571, 1, 1, 1, 1, 1,
0.4049503, -0.619084, 3.005723, 1, 1, 1, 1, 1,
0.4066852, 0.6241294, 1.829659, 1, 1, 1, 1, 1,
0.4076357, 0.2417508, 1.514287, 1, 1, 1, 1, 1,
0.4083847, 1.323586, -0.4579738, 1, 1, 1, 1, 1,
0.4132967, -0.129101, 1.029508, 1, 1, 1, 1, 1,
0.4133203, 1.263488, -0.7513342, 0, 0, 1, 1, 1,
0.4146125, 2.079442, 0.6598917, 1, 0, 0, 1, 1,
0.414933, -0.8592778, 2.980984, 1, 0, 0, 1, 1,
0.4166361, -0.7981917, 2.851961, 1, 0, 0, 1, 1,
0.421639, -1.020209, 3.205046, 1, 0, 0, 1, 1,
0.4320374, 1.601994, 0.05123933, 1, 0, 0, 1, 1,
0.4331156, 0.6047884, 1.350109, 0, 0, 0, 1, 1,
0.4352252, 0.1139161, 2.232488, 0, 0, 0, 1, 1,
0.4380184, -1.167227, 3.505879, 0, 0, 0, 1, 1,
0.4385544, -1.002909, 2.720321, 0, 0, 0, 1, 1,
0.4391127, 1.099306, -0.5651721, 0, 0, 0, 1, 1,
0.4403298, -0.07411476, 0.08076815, 0, 0, 0, 1, 1,
0.4409099, -0.1639704, 2.667834, 0, 0, 0, 1, 1,
0.4428397, -1.438858, 2.855044, 1, 1, 1, 1, 1,
0.4471236, 0.7003779, -0.7993084, 1, 1, 1, 1, 1,
0.4487602, -2.12797, 3.324829, 1, 1, 1, 1, 1,
0.449669, 0.1592766, 0.7936965, 1, 1, 1, 1, 1,
0.4533204, 1.519457, 0.4922238, 1, 1, 1, 1, 1,
0.4580836, 1.34864, 1.022232, 1, 1, 1, 1, 1,
0.4613964, -1.018892, 2.197285, 1, 1, 1, 1, 1,
0.4685069, 0.5947316, 0.787884, 1, 1, 1, 1, 1,
0.4688304, -1.235995, 1.739873, 1, 1, 1, 1, 1,
0.469016, -0.4948122, 0.7663136, 1, 1, 1, 1, 1,
0.4709788, 0.3056154, 1.064094, 1, 1, 1, 1, 1,
0.4755082, 0.5711676, -0.42541, 1, 1, 1, 1, 1,
0.4786678, -0.4260381, 1.814116, 1, 1, 1, 1, 1,
0.4860803, 0.319667, 0.32728, 1, 1, 1, 1, 1,
0.4863082, 0.5133775, -0.1427761, 1, 1, 1, 1, 1,
0.4866298, 1.365659, -0.09862254, 0, 0, 1, 1, 1,
0.4893996, 0.4899635, 0.8859291, 1, 0, 0, 1, 1,
0.4902461, -0.01243515, 2.376458, 1, 0, 0, 1, 1,
0.4966597, 1.123811, 1.305081, 1, 0, 0, 1, 1,
0.4973846, 0.2080593, 1.164769, 1, 0, 0, 1, 1,
0.4974698, -2.019655, 2.045424, 1, 0, 0, 1, 1,
0.4996957, -1.459082, 1.864076, 0, 0, 0, 1, 1,
0.503134, -0.7440274, 0.4957924, 0, 0, 0, 1, 1,
0.5071306, -0.2299694, 2.844874, 0, 0, 0, 1, 1,
0.5102025, -0.7407848, 0.3732713, 0, 0, 0, 1, 1,
0.511943, 0.9519201, 0.3468176, 0, 0, 0, 1, 1,
0.5170183, 0.7449458, -0.9742187, 0, 0, 0, 1, 1,
0.5200005, -0.7252684, 2.038309, 0, 0, 0, 1, 1,
0.5201271, -0.2650932, 1.300271, 1, 1, 1, 1, 1,
0.5208579, -0.132655, 3.225134, 1, 1, 1, 1, 1,
0.5235208, 1.334448, 1.465853, 1, 1, 1, 1, 1,
0.5248106, -0.09388866, 2.45641, 1, 1, 1, 1, 1,
0.5269621, -1.039961, 1.75852, 1, 1, 1, 1, 1,
0.5288464, -0.1143273, 0.9307377, 1, 1, 1, 1, 1,
0.5314353, 0.3822743, 1.127755, 1, 1, 1, 1, 1,
0.5350715, -0.8412351, 3.886267, 1, 1, 1, 1, 1,
0.5354712, 0.5488253, 1.323417, 1, 1, 1, 1, 1,
0.5369089, 0.3593245, -1.858062, 1, 1, 1, 1, 1,
0.5444193, -0.487004, 3.644784, 1, 1, 1, 1, 1,
0.5445026, -0.7307698, 2.823894, 1, 1, 1, 1, 1,
0.5467758, 1.057174, -0.4860487, 1, 1, 1, 1, 1,
0.5524152, -1.141959, -0.1229355, 1, 1, 1, 1, 1,
0.5600932, 0.7422369, 1.193245, 1, 1, 1, 1, 1,
0.5680185, 0.1706196, 1.485695, 0, 0, 1, 1, 1,
0.5748925, -0.09003787, 2.056108, 1, 0, 0, 1, 1,
0.5851555, -0.07675069, 1.518345, 1, 0, 0, 1, 1,
0.5883247, 0.6073041, 0.6260366, 1, 0, 0, 1, 1,
0.5927668, 0.1978715, 0.4545065, 1, 0, 0, 1, 1,
0.5934536, -1.417051, 2.561628, 1, 0, 0, 1, 1,
0.5938351, 0.9361658, -0.9485237, 0, 0, 0, 1, 1,
0.5940182, 1.654184, 0.206208, 0, 0, 0, 1, 1,
0.600197, 0.02845436, 2.392522, 0, 0, 0, 1, 1,
0.6011299, -1.026585, 1.088869, 0, 0, 0, 1, 1,
0.605742, -0.09890786, 1.237305, 0, 0, 0, 1, 1,
0.6127847, 0.01664097, 0.4904063, 0, 0, 0, 1, 1,
0.6143945, -0.7294009, 2.359746, 0, 0, 0, 1, 1,
0.6186466, -0.7371099, 1.064479, 1, 1, 1, 1, 1,
0.6202357, -0.009711659, 1.361305, 1, 1, 1, 1, 1,
0.6224838, -0.6853047, 1.946867, 1, 1, 1, 1, 1,
0.6260076, -0.3215576, 2.339708, 1, 1, 1, 1, 1,
0.6324302, -0.1143253, 1.508184, 1, 1, 1, 1, 1,
0.6327407, -0.6427354, 2.610875, 1, 1, 1, 1, 1,
0.6368596, 0.6920562, 0.9325409, 1, 1, 1, 1, 1,
0.6377003, 1.521721, 0.1162066, 1, 1, 1, 1, 1,
0.6390531, -0.2817185, 1.630056, 1, 1, 1, 1, 1,
0.6394659, 2.420095, 1.145287, 1, 1, 1, 1, 1,
0.6433421, 1.27033, 1.214282, 1, 1, 1, 1, 1,
0.6462453, -0.01215493, 0.9583427, 1, 1, 1, 1, 1,
0.6510623, -2.112175, 2.950344, 1, 1, 1, 1, 1,
0.6545645, -1.425592, 2.50421, 1, 1, 1, 1, 1,
0.6567966, -0.8072532, 1.603765, 1, 1, 1, 1, 1,
0.6593248, -0.1503384, 2.480096, 0, 0, 1, 1, 1,
0.6608881, 0.6753754, 0.7977524, 1, 0, 0, 1, 1,
0.6610112, -0.2240869, 2.433692, 1, 0, 0, 1, 1,
0.6620185, -0.7433724, 1.915101, 1, 0, 0, 1, 1,
0.6637373, -0.1751478, 0.1176392, 1, 0, 0, 1, 1,
0.6763153, -1.370563, 3.397197, 1, 0, 0, 1, 1,
0.6813496, 0.3706297, 1.787801, 0, 0, 0, 1, 1,
0.6815544, 0.8633371, -0.3560537, 0, 0, 0, 1, 1,
0.6826501, -1.027905, 3.410472, 0, 0, 0, 1, 1,
0.6870124, 0.9109179, 0.6433874, 0, 0, 0, 1, 1,
0.6877753, 1.135776, 0.3465638, 0, 0, 0, 1, 1,
0.6932815, -0.422592, 1.938738, 0, 0, 0, 1, 1,
0.694065, -1.029601, 2.507598, 0, 0, 0, 1, 1,
0.7019825, 0.8232506, -0.01641556, 1, 1, 1, 1, 1,
0.7029203, -0.4947137, 2.283958, 1, 1, 1, 1, 1,
0.7068103, -1.045675, 3.092785, 1, 1, 1, 1, 1,
0.7078727, -1.141586, 2.464852, 1, 1, 1, 1, 1,
0.7103402, -1.207835, 3.088081, 1, 1, 1, 1, 1,
0.7125089, 2.276611, 2.194045, 1, 1, 1, 1, 1,
0.7140319, -0.7075373, 2.647873, 1, 1, 1, 1, 1,
0.7161193, -0.3648523, 2.689527, 1, 1, 1, 1, 1,
0.7217179, -1.587807, 3.762089, 1, 1, 1, 1, 1,
0.7233626, -1.207688, 2.948433, 1, 1, 1, 1, 1,
0.7236076, 0.8143479, -0.3034306, 1, 1, 1, 1, 1,
0.7388444, -0.7082329, 1.601629, 1, 1, 1, 1, 1,
0.7434695, -2.029153, 4.265533, 1, 1, 1, 1, 1,
0.7501256, -1.448241, 1.524809, 1, 1, 1, 1, 1,
0.7602264, -0.9075491, 1.070858, 1, 1, 1, 1, 1,
0.7652454, 0.5508455, 0.2932787, 0, 0, 1, 1, 1,
0.766367, 0.09562004, 3.314481, 1, 0, 0, 1, 1,
0.7679256, 0.6837373, 1.688558, 1, 0, 0, 1, 1,
0.7692261, 0.6940646, 1.671468, 1, 0, 0, 1, 1,
0.7797835, 1.774478, -0.7507492, 1, 0, 0, 1, 1,
0.7813083, 0.7545893, -1.196603, 1, 0, 0, 1, 1,
0.7854084, -0.2887288, 0.6449721, 0, 0, 0, 1, 1,
0.7917584, 0.7760623, 0.1173157, 0, 0, 0, 1, 1,
0.8012086, 0.3953724, 1.946066, 0, 0, 0, 1, 1,
0.8028252, 1.780031, 0.3195547, 0, 0, 0, 1, 1,
0.8173498, 0.5408215, 1.449501, 0, 0, 0, 1, 1,
0.8181704, -0.2856869, 1.522618, 0, 0, 0, 1, 1,
0.8181924, 0.3763112, 0.5085223, 0, 0, 0, 1, 1,
0.8189393, 0.990129, 0.3988907, 1, 1, 1, 1, 1,
0.8210442, -0.0312757, 2.501905, 1, 1, 1, 1, 1,
0.8219626, 0.6239665, 0.6724803, 1, 1, 1, 1, 1,
0.8224738, -1.269686, 1.146682, 1, 1, 1, 1, 1,
0.834464, -0.6861919, -0.07998696, 1, 1, 1, 1, 1,
0.8418841, 1.07083, 1.979636, 1, 1, 1, 1, 1,
0.8512433, -0.2403301, 2.50001, 1, 1, 1, 1, 1,
0.8619174, -0.2983405, 1.621645, 1, 1, 1, 1, 1,
0.8682588, 0.09448197, 1.901905, 1, 1, 1, 1, 1,
0.8697327, -0.5332335, 1.565421, 1, 1, 1, 1, 1,
0.8701016, 1.020635, 1.18043, 1, 1, 1, 1, 1,
0.8709599, -0.149652, 0.8774716, 1, 1, 1, 1, 1,
0.8712571, 0.1277797, 0.6349264, 1, 1, 1, 1, 1,
0.8850319, -0.2817747, 1.9177, 1, 1, 1, 1, 1,
0.890022, 0.8073949, 1.248125, 1, 1, 1, 1, 1,
0.8975318, 0.6977161, -0.2657431, 0, 0, 1, 1, 1,
0.898982, 0.9081964, 0.117135, 1, 0, 0, 1, 1,
0.8989912, 2.135938, 0.4179724, 1, 0, 0, 1, 1,
0.9129487, -0.6488773, 0.735425, 1, 0, 0, 1, 1,
0.9228391, -0.1335922, 1.148839, 1, 0, 0, 1, 1,
0.9273977, 1.410944, 0.8876237, 1, 0, 0, 1, 1,
0.9304944, -0.707567, 3.415212, 0, 0, 0, 1, 1,
0.9373646, -2.208457, 1.417936, 0, 0, 0, 1, 1,
0.9383148, 1.260253, 0.4980202, 0, 0, 0, 1, 1,
0.938854, 0.04126303, 0.7829329, 0, 0, 0, 1, 1,
0.9388821, -0.7773473, 1.107679, 0, 0, 0, 1, 1,
0.9424903, -0.5016015, 1.479055, 0, 0, 0, 1, 1,
0.9570333, -0.2575913, 1.578455, 0, 0, 0, 1, 1,
0.9636081, -2.713714, 2.542765, 1, 1, 1, 1, 1,
0.966099, -0.6999263, 2.759434, 1, 1, 1, 1, 1,
0.9669867, -0.2219985, 1.626216, 1, 1, 1, 1, 1,
0.9689528, 1.514316, 0.8121673, 1, 1, 1, 1, 1,
0.9699678, 1.015718, 0.4627942, 1, 1, 1, 1, 1,
0.9728425, -0.4332209, 2.596699, 1, 1, 1, 1, 1,
0.9743473, -1.475799, 3.000614, 1, 1, 1, 1, 1,
0.9782748, 0.3384717, 1.023381, 1, 1, 1, 1, 1,
0.9846506, 0.1604171, 0.8362186, 1, 1, 1, 1, 1,
0.9937254, 1.524478, -0.4196705, 1, 1, 1, 1, 1,
0.9984981, 1.644295, -1.578726, 1, 1, 1, 1, 1,
0.9995839, 0.1426839, 1.92619, 1, 1, 1, 1, 1,
1.016546, -0.07420058, 1.379915, 1, 1, 1, 1, 1,
1.016772, -0.1891351, 1.42004, 1, 1, 1, 1, 1,
1.020832, -0.3232971, 0.5312706, 1, 1, 1, 1, 1,
1.023028, -0.3482555, 2.994087, 0, 0, 1, 1, 1,
1.024813, 0.5916212, 0.5188611, 1, 0, 0, 1, 1,
1.025996, -0.7748433, 2.561942, 1, 0, 0, 1, 1,
1.027116, 1.847958, -0.4987536, 1, 0, 0, 1, 1,
1.02734, 0.1870143, 1.654837, 1, 0, 0, 1, 1,
1.02846, -0.5163025, 0.6344407, 1, 0, 0, 1, 1,
1.030139, -1.139783, 1.037703, 0, 0, 0, 1, 1,
1.04422, -0.2264472, 3.210648, 0, 0, 0, 1, 1,
1.04438, 0.621522, 0.1573841, 0, 0, 0, 1, 1,
1.051818, -0.3989848, 1.281394, 0, 0, 0, 1, 1,
1.068944, -0.2018673, 0.1374366, 0, 0, 0, 1, 1,
1.07007, 0.2970505, 1.866035, 0, 0, 0, 1, 1,
1.07189, -3.240677, 1.706916, 0, 0, 0, 1, 1,
1.078287, -0.4805755, 2.142593, 1, 1, 1, 1, 1,
1.079492, -1.115788, 2.96438, 1, 1, 1, 1, 1,
1.08082, 0.7365444, 0.8109291, 1, 1, 1, 1, 1,
1.083411, 0.3954637, 2.180115, 1, 1, 1, 1, 1,
1.083581, -1.140966, -0.9489671, 1, 1, 1, 1, 1,
1.094576, -0.737745, 4.030281, 1, 1, 1, 1, 1,
1.097438, 0.1653093, 1.499967, 1, 1, 1, 1, 1,
1.099678, 0.6026538, 0.7890838, 1, 1, 1, 1, 1,
1.104415, -1.27915, 1.835674, 1, 1, 1, 1, 1,
1.108593, 0.2948097, 2.81662, 1, 1, 1, 1, 1,
1.114462, 1.205585, -1.147992, 1, 1, 1, 1, 1,
1.118919, 1.760442, 1.393446, 1, 1, 1, 1, 1,
1.119886, 0.3133708, 1.0706, 1, 1, 1, 1, 1,
1.124536, 0.3664021, 0.9905884, 1, 1, 1, 1, 1,
1.128313, 0.04111641, 1.885842, 1, 1, 1, 1, 1,
1.129585, -0.8802893, 1.017029, 0, 0, 1, 1, 1,
1.137796, 0.4309054, 1.007567, 1, 0, 0, 1, 1,
1.142207, 0.5331551, 2.530331, 1, 0, 0, 1, 1,
1.150948, -0.1586303, 2.295957, 1, 0, 0, 1, 1,
1.162242, -0.6490096, 1.398382, 1, 0, 0, 1, 1,
1.16528, 2.853364, 1.016934, 1, 0, 0, 1, 1,
1.168568, 0.1166399, 1.015494, 0, 0, 0, 1, 1,
1.171699, 1.314007, -0.2477649, 0, 0, 0, 1, 1,
1.172401, 0.453582, 1.384419, 0, 0, 0, 1, 1,
1.173002, -0.6946494, 0.5467504, 0, 0, 0, 1, 1,
1.178111, -0.1421759, 3.513339, 0, 0, 0, 1, 1,
1.180135, -0.8367345, 3.61522, 0, 0, 0, 1, 1,
1.189363, -0.2007915, 0.7843213, 0, 0, 0, 1, 1,
1.18944, -0.2010422, 1.52739, 1, 1, 1, 1, 1,
1.198222, -1.267524, 3.819267, 1, 1, 1, 1, 1,
1.203816, 0.8804352, 1.324368, 1, 1, 1, 1, 1,
1.204202, -0.4196932, 2.892102, 1, 1, 1, 1, 1,
1.211796, 0.8311996, 0.3814995, 1, 1, 1, 1, 1,
1.21442, -1.348785, -0.4180815, 1, 1, 1, 1, 1,
1.21473, -1.312643, 4.258612, 1, 1, 1, 1, 1,
1.219184, -0.09975037, 0.8288732, 1, 1, 1, 1, 1,
1.221828, 0.3455999, 2.038424, 1, 1, 1, 1, 1,
1.23057, 0.8860766, 0.4443698, 1, 1, 1, 1, 1,
1.232517, 2.806417, 1.028911, 1, 1, 1, 1, 1,
1.236333, -1.957651, 2.308703, 1, 1, 1, 1, 1,
1.243379, -0.5977248, 2.274985, 1, 1, 1, 1, 1,
1.248345, 0.05638556, 0.9267643, 1, 1, 1, 1, 1,
1.255223, 0.01594823, 0.7602873, 1, 1, 1, 1, 1,
1.277211, 0.5237471, -0.8478009, 0, 0, 1, 1, 1,
1.297262, -0.7403153, 3.819181, 1, 0, 0, 1, 1,
1.30919, 0.3739996, 0.4841622, 1, 0, 0, 1, 1,
1.310311, 0.9240522, 2.785944, 1, 0, 0, 1, 1,
1.314151, 1.732908, 1.072992, 1, 0, 0, 1, 1,
1.331837, 0.9106172, 1.436377, 1, 0, 0, 1, 1,
1.342815, 1.868178, -0.7288883, 0, 0, 0, 1, 1,
1.343738, 1.286454, 1.229694, 0, 0, 0, 1, 1,
1.350923, 0.5276811, 1.987748, 0, 0, 0, 1, 1,
1.358659, -0.01095093, 1.124081, 0, 0, 0, 1, 1,
1.363193, 0.4205767, -0.1949541, 0, 0, 0, 1, 1,
1.368705, -1.043375, 2.357282, 0, 0, 0, 1, 1,
1.372838, 0.09567818, 3.134398, 0, 0, 0, 1, 1,
1.373073, -0.6657101, 1.933909, 1, 1, 1, 1, 1,
1.374921, 1.114272, 1.116518, 1, 1, 1, 1, 1,
1.387543, -1.121525, 2.008253, 1, 1, 1, 1, 1,
1.401898, 0.5690676, 0.6140854, 1, 1, 1, 1, 1,
1.406338, -3.271382, 2.018244, 1, 1, 1, 1, 1,
1.41838, -0.2356316, 2.247495, 1, 1, 1, 1, 1,
1.421941, 0.9486981, -0.06520986, 1, 1, 1, 1, 1,
1.423403, 0.1091127, 2.044186, 1, 1, 1, 1, 1,
1.424955, 1.035241, 1.507991, 1, 1, 1, 1, 1,
1.425308, -1.158815, 3.719797, 1, 1, 1, 1, 1,
1.446904, -0.6981367, 1.534915, 1, 1, 1, 1, 1,
1.452948, -1.354288, 1.581539, 1, 1, 1, 1, 1,
1.457116, 0.567308, 0.8870481, 1, 1, 1, 1, 1,
1.457736, 1.518158, 0.8677288, 1, 1, 1, 1, 1,
1.462862, -0.0771916, -0.1458224, 1, 1, 1, 1, 1,
1.465196, -0.3683565, 1.604179, 0, 0, 1, 1, 1,
1.468729, -1.682646, 1.896199, 1, 0, 0, 1, 1,
1.472737, -1.824672, 2.4361, 1, 0, 0, 1, 1,
1.477659, -0.1673386, 0.130726, 1, 0, 0, 1, 1,
1.493291, 0.2020081, 0.136714, 1, 0, 0, 1, 1,
1.509385, -0.7618405, 1.614386, 1, 0, 0, 1, 1,
1.526869, -1.095568, -0.7645503, 0, 0, 0, 1, 1,
1.534876, -1.18871, 1.492734, 0, 0, 0, 1, 1,
1.536369, -1.284372, 3.423344, 0, 0, 0, 1, 1,
1.558001, 1.748251, 1.067634, 0, 0, 0, 1, 1,
1.558622, -0.835379, 2.196729, 0, 0, 0, 1, 1,
1.563582, -0.275006, 1.247727, 0, 0, 0, 1, 1,
1.565247, 0.1695009, 2.279813, 0, 0, 0, 1, 1,
1.568191, 0.753678, 1.300323, 1, 1, 1, 1, 1,
1.580219, 0.08153794, 3.092446, 1, 1, 1, 1, 1,
1.603063, -0.7025934, 0.2065944, 1, 1, 1, 1, 1,
1.606154, -1.416512, 2.301372, 1, 1, 1, 1, 1,
1.611567, -0.6978146, 0.8864396, 1, 1, 1, 1, 1,
1.613945, 1.771274, 1.634759, 1, 1, 1, 1, 1,
1.616027, -0.6922768, 0.5520697, 1, 1, 1, 1, 1,
1.627842, -0.2115031, 0.499261, 1, 1, 1, 1, 1,
1.629917, 1.785755, 0.3201368, 1, 1, 1, 1, 1,
1.636621, -0.1505166, 1.750172, 1, 1, 1, 1, 1,
1.649255, -0.01262146, 0.3180166, 1, 1, 1, 1, 1,
1.658193, 0.9316865, 1.465088, 1, 1, 1, 1, 1,
1.661165, 0.8811903, 1.168098, 1, 1, 1, 1, 1,
1.703207, 0.5406046, 1.439727, 1, 1, 1, 1, 1,
1.70879, -0.5413524, 2.408844, 1, 1, 1, 1, 1,
1.711689, 0.2229274, 0.6311432, 0, 0, 1, 1, 1,
1.716497, -0.1201185, 3.422414, 1, 0, 0, 1, 1,
1.753415, 0.05647438, 0.9960994, 1, 0, 0, 1, 1,
1.757137, 0.6690584, 1.093769, 1, 0, 0, 1, 1,
1.785128, 1.020924, 2.007243, 1, 0, 0, 1, 1,
1.788574, -0.4050845, 1.545945, 1, 0, 0, 1, 1,
1.805275, -0.982834, 0.1546518, 0, 0, 0, 1, 1,
1.82414, 0.1385675, -0.28277, 0, 0, 0, 1, 1,
1.824828, 0.3056035, 2.757714, 0, 0, 0, 1, 1,
1.829154, 1.01221, 1.82417, 0, 0, 0, 1, 1,
1.868675, 0.3567715, 2.358611, 0, 0, 0, 1, 1,
1.876794, -1.462927, 2.378386, 0, 0, 0, 1, 1,
1.896139, 0.6068969, 1.432662, 0, 0, 0, 1, 1,
1.896444, -0.06503154, 2.188721, 1, 1, 1, 1, 1,
1.903216, -0.3127486, 1.236902, 1, 1, 1, 1, 1,
1.909359, 0.4515107, -0.01500446, 1, 1, 1, 1, 1,
1.951545, 0.4894165, 2.099293, 1, 1, 1, 1, 1,
1.983028, -0.5565965, 3.085695, 1, 1, 1, 1, 1,
1.992045, -3.104095, 1.883111, 1, 1, 1, 1, 1,
1.994026, 2.313766, 0.8142846, 1, 1, 1, 1, 1,
2.00864, -0.6439608, 2.298297, 1, 1, 1, 1, 1,
2.025385, -0.978133, 1.784552, 1, 1, 1, 1, 1,
2.040898, -1.91626, 1.639851, 1, 1, 1, 1, 1,
2.101743, 2.127046, -0.2372507, 1, 1, 1, 1, 1,
2.127333, 0.04074403, 0.7612603, 1, 1, 1, 1, 1,
2.14795, -0.5809525, 1.466728, 1, 1, 1, 1, 1,
2.156826, 1.091354, 0.3709825, 1, 1, 1, 1, 1,
2.203799, 1.321825, -0.08497488, 1, 1, 1, 1, 1,
2.226628, 1.687209, -0.104025, 0, 0, 1, 1, 1,
2.22727, -1.29763, 1.135112, 1, 0, 0, 1, 1,
2.251323, 1.15528, 1.723781, 1, 0, 0, 1, 1,
2.324903, 1.232216, 1.085543, 1, 0, 0, 1, 1,
2.349564, -0.8533384, 1.467589, 1, 0, 0, 1, 1,
2.389844, 0.1149317, 1.800175, 1, 0, 0, 1, 1,
2.40375, 0.4513981, 0.8086491, 0, 0, 0, 1, 1,
2.426045, -1.617349, 2.939872, 0, 0, 0, 1, 1,
2.441981, 0.3673173, 2.128387, 0, 0, 0, 1, 1,
2.444865, 0.4367667, 1.478096, 0, 0, 0, 1, 1,
2.457764, 1.048048, 1.952917, 0, 0, 0, 1, 1,
2.477003, -1.80884, 2.862634, 0, 0, 0, 1, 1,
2.49672, 0.4181383, 3.008909, 0, 0, 0, 1, 1,
2.525419, 1.766387, 1.489444, 1, 1, 1, 1, 1,
2.537393, -1.595697, 0.7107826, 1, 1, 1, 1, 1,
2.678365, -1.457386, 0.8499369, 1, 1, 1, 1, 1,
2.688137, 0.9851173, -0.2229932, 1, 1, 1, 1, 1,
2.700911, -1.328513, 1.125308, 1, 1, 1, 1, 1,
2.708437, 0.7934576, 1.914221, 1, 1, 1, 1, 1,
2.874829, -0.07359777, 0.08093765, 1, 1, 1, 1, 1
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
var radius = 9.870927;
var distance = 34.67121;
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
mvMatrix.translate( 0.3621148, 0.2090093, -0.930197 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67121);
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
