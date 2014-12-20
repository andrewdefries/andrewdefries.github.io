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
-3.051765, 0.5873286, -1.920775, 1, 0, 0, 1,
-2.892677, 0.1461616, -0.1782732, 1, 0.007843138, 0, 1,
-2.823137, 0.02754037, -2.324828, 1, 0.01176471, 0, 1,
-2.719434, 0.3588486, -1.085064, 1, 0.01960784, 0, 1,
-2.541604, 0.2016741, -2.560194, 1, 0.02352941, 0, 1,
-2.438631, -1.787931, -1.185236, 1, 0.03137255, 0, 1,
-2.410157, -0.4967155, -2.974771, 1, 0.03529412, 0, 1,
-2.233284, -0.8242123, -2.933457, 1, 0.04313726, 0, 1,
-2.211674, 1.273867, -1.025299, 1, 0.04705882, 0, 1,
-2.198121, -0.3435951, -3.237605, 1, 0.05490196, 0, 1,
-2.192396, 1.20872, -2.023618, 1, 0.05882353, 0, 1,
-2.15823, 0.9138355, 0.4393317, 1, 0.06666667, 0, 1,
-2.102754, 0.987576, -1.731518, 1, 0.07058824, 0, 1,
-2.095912, 1.536261, 0.07503357, 1, 0.07843138, 0, 1,
-2.058622, -2.873379, -3.229868, 1, 0.08235294, 0, 1,
-2.058622, -1.941523, -2.3533, 1, 0.09019608, 0, 1,
-2.053107, 1.288879, -0.02308917, 1, 0.09411765, 0, 1,
-2.05099, 0.2343915, 0.6339768, 1, 0.1019608, 0, 1,
-2.016308, -0.1038216, 0.06911518, 1, 0.1098039, 0, 1,
-2.001817, -0.923171, -2.001135, 1, 0.1137255, 0, 1,
-1.97499, -0.4835359, -1.956524, 1, 0.1215686, 0, 1,
-1.974306, -0.5700803, -3.65108, 1, 0.1254902, 0, 1,
-1.956185, -1.973659, -3.326685, 1, 0.1333333, 0, 1,
-1.936298, 0.2226936, -1.995381, 1, 0.1372549, 0, 1,
-1.935724, 0.7901881, -0.74339, 1, 0.145098, 0, 1,
-1.846182, 0.4716754, -1.692095, 1, 0.1490196, 0, 1,
-1.841864, -1.004209, -1.98424, 1, 0.1568628, 0, 1,
-1.823021, 1.145875, 0.03608047, 1, 0.1607843, 0, 1,
-1.811552, -0.466152, -2.009279, 1, 0.1686275, 0, 1,
-1.78617, 1.645636, -1.392194, 1, 0.172549, 0, 1,
-1.785869, -0.420983, -1.053405, 1, 0.1803922, 0, 1,
-1.783289, -0.5104256, -1.275838, 1, 0.1843137, 0, 1,
-1.773859, 0.07407777, -1.971625, 1, 0.1921569, 0, 1,
-1.746978, -1.937216, -3.631978, 1, 0.1960784, 0, 1,
-1.730946, 0.574959, -0.9512073, 1, 0.2039216, 0, 1,
-1.721346, -1.284548, -2.445859, 1, 0.2117647, 0, 1,
-1.71625, -1.330167, -1.32419, 1, 0.2156863, 0, 1,
-1.678514, -1.496998, -2.10303, 1, 0.2235294, 0, 1,
-1.656134, -0.2920606, -3.67744, 1, 0.227451, 0, 1,
-1.654948, -0.05028453, -2.044773, 1, 0.2352941, 0, 1,
-1.638848, -0.1347113, -3.428773, 1, 0.2392157, 0, 1,
-1.638781, -1.47954, -1.309806, 1, 0.2470588, 0, 1,
-1.634138, 0.3813676, -0.8068229, 1, 0.2509804, 0, 1,
-1.617587, 1.073929, -2.062388, 1, 0.2588235, 0, 1,
-1.61746, 0.1955505, -1.355895, 1, 0.2627451, 0, 1,
-1.614195, 1.864829, -2.030256, 1, 0.2705882, 0, 1,
-1.605416, -0.5979443, -1.284731, 1, 0.2745098, 0, 1,
-1.600749, -0.4924077, -2.917319, 1, 0.282353, 0, 1,
-1.600177, 0.06368431, -1.670233, 1, 0.2862745, 0, 1,
-1.593587, 1.542365, -1.016272, 1, 0.2941177, 0, 1,
-1.570404, -1.082564, -2.572276, 1, 0.3019608, 0, 1,
-1.554527, 0.04825335, -0.7344859, 1, 0.3058824, 0, 1,
-1.551593, -0.927877, -3.090441, 1, 0.3137255, 0, 1,
-1.542106, 0.7087109, -1.972644, 1, 0.3176471, 0, 1,
-1.541351, 0.3673115, -0.6352852, 1, 0.3254902, 0, 1,
-1.53098, 1.179713, -0.573691, 1, 0.3294118, 0, 1,
-1.47475, -0.2539874, -1.02058, 1, 0.3372549, 0, 1,
-1.474666, 0.0830664, -1.381557, 1, 0.3411765, 0, 1,
-1.463148, -0.6016853, -0.4926251, 1, 0.3490196, 0, 1,
-1.444576, 2.694973, -1.18182, 1, 0.3529412, 0, 1,
-1.428462, 1.450765, -0.2674625, 1, 0.3607843, 0, 1,
-1.419799, -0.3490262, -2.485077, 1, 0.3647059, 0, 1,
-1.408445, 1.751475, -0.9606425, 1, 0.372549, 0, 1,
-1.399288, -0.225018, -2.542273, 1, 0.3764706, 0, 1,
-1.399071, -0.07265822, -1.648745, 1, 0.3843137, 0, 1,
-1.377637, -1.021933, -1.636591, 1, 0.3882353, 0, 1,
-1.375562, 0.9389112, -1.652734, 1, 0.3960784, 0, 1,
-1.373857, -1.577659, -3.22663, 1, 0.4039216, 0, 1,
-1.370329, -1.420537, -2.337786, 1, 0.4078431, 0, 1,
-1.349558, 0.6975356, -1.129694, 1, 0.4156863, 0, 1,
-1.33595, -1.345245, -2.571651, 1, 0.4196078, 0, 1,
-1.329581, 1.329475, -2.389457, 1, 0.427451, 0, 1,
-1.328334, 3.734943, -0.4091817, 1, 0.4313726, 0, 1,
-1.320089, -1.462684, -3.403211, 1, 0.4392157, 0, 1,
-1.315768, 1.022492, -1.996712, 1, 0.4431373, 0, 1,
-1.314575, 0.3685495, 1.29145, 1, 0.4509804, 0, 1,
-1.307754, -0.6488982, -1.005576, 1, 0.454902, 0, 1,
-1.305089, -0.416262, -3.780708, 1, 0.4627451, 0, 1,
-1.300774, 1.074916, -0.2698894, 1, 0.4666667, 0, 1,
-1.292616, 1.022628, -1.224287, 1, 0.4745098, 0, 1,
-1.287465, 0.5068974, -0.677768, 1, 0.4784314, 0, 1,
-1.270035, 1.154632, -1.416523, 1, 0.4862745, 0, 1,
-1.251771, -0.2062669, -1.672355, 1, 0.4901961, 0, 1,
-1.248407, 0.6185218, -0.3623161, 1, 0.4980392, 0, 1,
-1.246408, -0.6764039, -1.347615, 1, 0.5058824, 0, 1,
-1.245986, -0.0580888, -1.756401, 1, 0.509804, 0, 1,
-1.245771, -1.389128, -3.185875, 1, 0.5176471, 0, 1,
-1.241259, -0.4692265, -1.9612, 1, 0.5215687, 0, 1,
-1.238648, -1.536723, -1.839023, 1, 0.5294118, 0, 1,
-1.238222, -0.2757316, -2.931963, 1, 0.5333334, 0, 1,
-1.232162, -0.8175655, -0.9264362, 1, 0.5411765, 0, 1,
-1.231948, 1.221709, -0.3559194, 1, 0.5450981, 0, 1,
-1.231292, -1.604679, -3.669032, 1, 0.5529412, 0, 1,
-1.226618, 3.039866, 1.065857, 1, 0.5568628, 0, 1,
-1.217221, 0.5338662, -2.121364, 1, 0.5647059, 0, 1,
-1.216732, -0.1526108, -1.699157, 1, 0.5686275, 0, 1,
-1.215758, 0.1976741, -1.23033, 1, 0.5764706, 0, 1,
-1.213676, -0.3286959, -1.529243, 1, 0.5803922, 0, 1,
-1.199654, 0.1808504, -0.8228055, 1, 0.5882353, 0, 1,
-1.196367, -0.3221307, -2.762764, 1, 0.5921569, 0, 1,
-1.189318, 1.179365, 1.229002, 1, 0.6, 0, 1,
-1.186538, 1.040008, 0.1361664, 1, 0.6078432, 0, 1,
-1.178299, 0.6057643, -0.6024941, 1, 0.6117647, 0, 1,
-1.17501, -0.1772304, -0.8981492, 1, 0.6196079, 0, 1,
-1.17261, 0.5268273, 0.1329826, 1, 0.6235294, 0, 1,
-1.156485, 1.559521, -1.658746, 1, 0.6313726, 0, 1,
-1.153624, 0.2746136, -0.5762073, 1, 0.6352941, 0, 1,
-1.144886, 0.9371868, -0.1388878, 1, 0.6431373, 0, 1,
-1.143776, -1.408609, -1.744541, 1, 0.6470588, 0, 1,
-1.139538, -1.321339, -1.882032, 1, 0.654902, 0, 1,
-1.134748, 0.6735206, -1.98316, 1, 0.6588235, 0, 1,
-1.132507, -0.555287, -2.452807, 1, 0.6666667, 0, 1,
-1.124689, -0.3953589, -1.358278, 1, 0.6705883, 0, 1,
-1.113148, -0.7853877, -3.040432, 1, 0.6784314, 0, 1,
-1.10927, -1.307197, -2.184597, 1, 0.682353, 0, 1,
-1.104902, 0.2914678, -0.1326499, 1, 0.6901961, 0, 1,
-1.097107, 0.4414282, -1.318656, 1, 0.6941177, 0, 1,
-1.093805, 0.4507834, -0.8903285, 1, 0.7019608, 0, 1,
-1.091396, 0.9406106, -0.3595615, 1, 0.7098039, 0, 1,
-1.088851, -0.8356157, -1.937678, 1, 0.7137255, 0, 1,
-1.082468, -1.604101, -2.683574, 1, 0.7215686, 0, 1,
-1.080593, 0.1954293, -0.215937, 1, 0.7254902, 0, 1,
-1.077982, 1.70114, -1.504176, 1, 0.7333333, 0, 1,
-1.076788, -2.76443, -3.210743, 1, 0.7372549, 0, 1,
-1.059557, 1.098069, -0.7858462, 1, 0.7450981, 0, 1,
-1.0582, 0.2669961, -0.7845822, 1, 0.7490196, 0, 1,
-1.057139, 0.5586574, -0.6020899, 1, 0.7568628, 0, 1,
-1.047702, -0.552095, -0.8744727, 1, 0.7607843, 0, 1,
-1.047601, -1.039992, -1.365393, 1, 0.7686275, 0, 1,
-1.047597, 2.431331, 1.021048, 1, 0.772549, 0, 1,
-1.047187, -0.02294597, 0.2037815, 1, 0.7803922, 0, 1,
-1.042466, -0.2623369, -2.464453, 1, 0.7843137, 0, 1,
-1.041861, 0.8916826, 1.570742, 1, 0.7921569, 0, 1,
-1.040175, -0.7465817, -1.279188, 1, 0.7960784, 0, 1,
-1.039023, 0.03599546, -1.57106, 1, 0.8039216, 0, 1,
-1.036995, 0.251149, -0.533119, 1, 0.8117647, 0, 1,
-1.036158, 1.067619, 1.842464, 1, 0.8156863, 0, 1,
-1.035737, -0.4175061, -2.270086, 1, 0.8235294, 0, 1,
-1.035362, -0.8390685, -2.09375, 1, 0.827451, 0, 1,
-1.032898, 1.300726, -1.854073, 1, 0.8352941, 0, 1,
-1.030954, 0.4549525, -1.756544, 1, 0.8392157, 0, 1,
-1.021242, 1.880753, 0.2706857, 1, 0.8470588, 0, 1,
-1.02033, -0.7803994, -0.6654121, 1, 0.8509804, 0, 1,
-1.019493, -0.5940518, -2.278745, 1, 0.8588235, 0, 1,
-1.01846, 1.059579, -0.98821, 1, 0.8627451, 0, 1,
-1.016564, 1.223797, -0.840259, 1, 0.8705882, 0, 1,
-1.016474, -0.7764464, -4.135615, 1, 0.8745098, 0, 1,
-1.002845, 0.5367897, -0.2926643, 1, 0.8823529, 0, 1,
-0.9945818, 0.5944475, 0.1269546, 1, 0.8862745, 0, 1,
-0.9888084, 1.243811, -0.4461557, 1, 0.8941177, 0, 1,
-0.9868749, -0.8821294, -2.739339, 1, 0.8980392, 0, 1,
-0.9868283, -1.748792, -3.092602, 1, 0.9058824, 0, 1,
-0.9858372, -1.778433, -2.093865, 1, 0.9137255, 0, 1,
-0.978727, -0.7737752, -3.776969, 1, 0.9176471, 0, 1,
-0.9736853, 2.116498, -0.7581188, 1, 0.9254902, 0, 1,
-0.9647089, -0.05243436, -2.118888, 1, 0.9294118, 0, 1,
-0.9599823, -0.1274207, -3.32416, 1, 0.9372549, 0, 1,
-0.9567661, -0.3826095, -1.158633, 1, 0.9411765, 0, 1,
-0.9510575, 0.7878918, -2.697342, 1, 0.9490196, 0, 1,
-0.9447663, 0.08965745, -1.955752, 1, 0.9529412, 0, 1,
-0.9347951, 1.26762, -1.060613, 1, 0.9607843, 0, 1,
-0.9292836, 0.7585524, 0.0502934, 1, 0.9647059, 0, 1,
-0.9242162, 0.5843791, -1.891166, 1, 0.972549, 0, 1,
-0.9224964, 0.2945358, -2.205986, 1, 0.9764706, 0, 1,
-0.9219068, 0.1575542, -1.105116, 1, 0.9843137, 0, 1,
-0.9209608, 0.1216267, -0.165132, 1, 0.9882353, 0, 1,
-0.9206823, 0.5840119, -1.660685, 1, 0.9960784, 0, 1,
-0.9191667, -0.2172923, -0.8845671, 0.9960784, 1, 0, 1,
-0.9144812, 1.849851, -0.1499371, 0.9921569, 1, 0, 1,
-0.9144701, -0.9659386, -2.916296, 0.9843137, 1, 0, 1,
-0.9142147, -0.654193, -3.342651, 0.9803922, 1, 0, 1,
-0.90558, 0.01052798, -1.016136, 0.972549, 1, 0, 1,
-0.902719, 1.110054, -0.1505961, 0.9686275, 1, 0, 1,
-0.9009498, 1.256059, -0.5472752, 0.9607843, 1, 0, 1,
-0.8982516, -1.061745, -2.398209, 0.9568627, 1, 0, 1,
-0.8934597, -1.024158, -2.142449, 0.9490196, 1, 0, 1,
-0.8905284, 0.9223849, -1.844658, 0.945098, 1, 0, 1,
-0.8834256, 0.1600266, -1.161397, 0.9372549, 1, 0, 1,
-0.8817552, 0.4964375, -0.4010932, 0.9333333, 1, 0, 1,
-0.8765299, 0.4633566, -1.179805, 0.9254902, 1, 0, 1,
-0.8733873, -2.77961, -3.481262, 0.9215686, 1, 0, 1,
-0.8590875, 1.369292, -1.220843, 0.9137255, 1, 0, 1,
-0.8584858, -0.6410109, -0.3642125, 0.9098039, 1, 0, 1,
-0.8582555, -1.621585, -3.524979, 0.9019608, 1, 0, 1,
-0.8567187, -1.613244, -2.685215, 0.8941177, 1, 0, 1,
-0.8563668, -0.745416, -3.866526, 0.8901961, 1, 0, 1,
-0.8550123, -0.8363183, -1.906973, 0.8823529, 1, 0, 1,
-0.8518878, -1.209205, -2.847351, 0.8784314, 1, 0, 1,
-0.8494074, 0.9175598, 0.3784932, 0.8705882, 1, 0, 1,
-0.837019, -0.02522096, -1.476073, 0.8666667, 1, 0, 1,
-0.8326994, -2.230364, -1.889863, 0.8588235, 1, 0, 1,
-0.8322879, -0.5477611, -3.252888, 0.854902, 1, 0, 1,
-0.8249667, -0.1985213, -2.691938, 0.8470588, 1, 0, 1,
-0.8249135, 1.426066, -1.040768, 0.8431373, 1, 0, 1,
-0.8207442, 0.599847, -0.8820918, 0.8352941, 1, 0, 1,
-0.817541, 1.093118, -2.36334, 0.8313726, 1, 0, 1,
-0.8101857, -0.3568775, -0.8560012, 0.8235294, 1, 0, 1,
-0.809831, 0.5020709, -1.329005, 0.8196079, 1, 0, 1,
-0.8092628, 1.312009, 0.0184176, 0.8117647, 1, 0, 1,
-0.8081265, 0.05437903, -3.099598, 0.8078431, 1, 0, 1,
-0.8059396, -0.7353877, -2.391493, 0.8, 1, 0, 1,
-0.8012101, 1.112514, -0.01832967, 0.7921569, 1, 0, 1,
-0.8001294, 1.451193, -1.616686, 0.7882353, 1, 0, 1,
-0.7995827, 2.397282, -1.846013, 0.7803922, 1, 0, 1,
-0.7995605, -0.6915009, -3.918905, 0.7764706, 1, 0, 1,
-0.7913409, 2.784201, 0.7866682, 0.7686275, 1, 0, 1,
-0.7888449, -0.2227432, -1.760677, 0.7647059, 1, 0, 1,
-0.7860734, 1.71791, 0.05774632, 0.7568628, 1, 0, 1,
-0.7858083, 0.5871504, -1.812095, 0.7529412, 1, 0, 1,
-0.7849114, -0.4897632, -0.8356342, 0.7450981, 1, 0, 1,
-0.7828022, 1.63233, -1.671986, 0.7411765, 1, 0, 1,
-0.781653, -0.06098849, -0.9232623, 0.7333333, 1, 0, 1,
-0.7807047, 0.4065739, -1.542465, 0.7294118, 1, 0, 1,
-0.7793817, 0.8939987, 1.600547, 0.7215686, 1, 0, 1,
-0.7626482, 1.788058, 0.5131614, 0.7176471, 1, 0, 1,
-0.7618319, 0.5652559, -0.3291558, 0.7098039, 1, 0, 1,
-0.7614034, -0.5680104, -0.4373879, 0.7058824, 1, 0, 1,
-0.7552254, -0.6178257, -4.137727, 0.6980392, 1, 0, 1,
-0.7525865, -1.483973, -2.307356, 0.6901961, 1, 0, 1,
-0.7512227, 0.1990003, 0.1263677, 0.6862745, 1, 0, 1,
-0.7503046, -0.02133458, -2.311693, 0.6784314, 1, 0, 1,
-0.7475175, 0.2623376, -1.032568, 0.6745098, 1, 0, 1,
-0.7430406, 1.063549, 2.768202, 0.6666667, 1, 0, 1,
-0.7428308, -0.1834713, -0.09926389, 0.6627451, 1, 0, 1,
-0.7395669, 0.602734, -1.098027, 0.654902, 1, 0, 1,
-0.7335156, 0.4555956, -1.38954, 0.6509804, 1, 0, 1,
-0.7326558, -1.394149, -2.089648, 0.6431373, 1, 0, 1,
-0.7293197, -0.6373668, -2.189371, 0.6392157, 1, 0, 1,
-0.7272866, 0.04911043, -0.6939638, 0.6313726, 1, 0, 1,
-0.7268762, 0.04480124, -0.5633048, 0.627451, 1, 0, 1,
-0.7247235, 0.9646208, 1.510587, 0.6196079, 1, 0, 1,
-0.7226757, -0.4287514, -1.174109, 0.6156863, 1, 0, 1,
-0.717242, -1.127457, -3.583906, 0.6078432, 1, 0, 1,
-0.716308, -0.5125273, -1.831854, 0.6039216, 1, 0, 1,
-0.7085747, 0.5350519, -0.580787, 0.5960785, 1, 0, 1,
-0.7081522, -0.8629204, -2.208274, 0.5882353, 1, 0, 1,
-0.7034298, 0.6579449, 0.3776163, 0.5843138, 1, 0, 1,
-0.7000701, -0.5811148, -2.049879, 0.5764706, 1, 0, 1,
-0.6989343, -1.017482, -1.623036, 0.572549, 1, 0, 1,
-0.6952979, 2.198797, -0.3442777, 0.5647059, 1, 0, 1,
-0.6906253, -0.2273849, -2.040956, 0.5607843, 1, 0, 1,
-0.6902931, -0.4956821, -2.133511, 0.5529412, 1, 0, 1,
-0.6896181, 0.6704189, 0.3024534, 0.5490196, 1, 0, 1,
-0.686669, 0.5124022, -0.2753644, 0.5411765, 1, 0, 1,
-0.6859468, -0.02210597, -1.080924, 0.5372549, 1, 0, 1,
-0.6855692, -2.174413, -3.96907, 0.5294118, 1, 0, 1,
-0.6852176, 0.8761651, -1.232295, 0.5254902, 1, 0, 1,
-0.6806498, -0.4154206, -4.59961, 0.5176471, 1, 0, 1,
-0.6752775, 0.4686338, -0.9412048, 0.5137255, 1, 0, 1,
-0.6727651, 0.597823, -1.177561, 0.5058824, 1, 0, 1,
-0.6717129, -0.811763, -2.927769, 0.5019608, 1, 0, 1,
-0.6697897, -0.2665882, -1.473306, 0.4941176, 1, 0, 1,
-0.6678265, 1.77107, 0.1165338, 0.4862745, 1, 0, 1,
-0.6602513, 1.785726, 0.01837618, 0.4823529, 1, 0, 1,
-0.6581942, -1.754359, -2.11802, 0.4745098, 1, 0, 1,
-0.654104, -0.3071966, -1.341577, 0.4705882, 1, 0, 1,
-0.6483644, 1.567807, -1.972307, 0.4627451, 1, 0, 1,
-0.6483217, 1.545982, -2.439087, 0.4588235, 1, 0, 1,
-0.6450579, -0.3469824, -1.564739, 0.4509804, 1, 0, 1,
-0.6409765, 1.03465, 0.3420251, 0.4470588, 1, 0, 1,
-0.6394718, -0.5776544, -0.9170605, 0.4392157, 1, 0, 1,
-0.639146, -1.433365, -1.48043, 0.4352941, 1, 0, 1,
-0.6373525, 0.5796821, -0.8000497, 0.427451, 1, 0, 1,
-0.6348662, -0.5994977, -2.821776, 0.4235294, 1, 0, 1,
-0.6314122, -1.986401, -0.9764962, 0.4156863, 1, 0, 1,
-0.6313511, 0.1073012, -1.455273, 0.4117647, 1, 0, 1,
-0.6167519, 2.075402, -0.1491524, 0.4039216, 1, 0, 1,
-0.6148731, -1.921034, -1.701693, 0.3960784, 1, 0, 1,
-0.6122689, -0.0006145592, -0.8372995, 0.3921569, 1, 0, 1,
-0.6100119, -1.72843, -3.603259, 0.3843137, 1, 0, 1,
-0.6003277, 0.2135025, -1.997659, 0.3803922, 1, 0, 1,
-0.5953072, -0.2430713, -0.8144397, 0.372549, 1, 0, 1,
-0.5906779, 0.8144208, -0.06185572, 0.3686275, 1, 0, 1,
-0.5892504, -2.04249, -3.608195, 0.3607843, 1, 0, 1,
-0.5849429, -0.7590536, -2.175396, 0.3568628, 1, 0, 1,
-0.5826552, -0.557864, -0.555515, 0.3490196, 1, 0, 1,
-0.5716169, -0.8234049, -3.535105, 0.345098, 1, 0, 1,
-0.571246, 0.07633823, -3.933477, 0.3372549, 1, 0, 1,
-0.5690982, 0.1485124, 0.09691513, 0.3333333, 1, 0, 1,
-0.5688553, 0.2995778, 0.02671841, 0.3254902, 1, 0, 1,
-0.5680159, 0.0792016, -1.242567, 0.3215686, 1, 0, 1,
-0.5589784, -0.1856176, -1.805542, 0.3137255, 1, 0, 1,
-0.5578928, 1.396139, 0.1359526, 0.3098039, 1, 0, 1,
-0.5576194, 0.3294409, -1.795468, 0.3019608, 1, 0, 1,
-0.5573544, 0.5085645, -1.018946, 0.2941177, 1, 0, 1,
-0.5467311, -3.142841, -4.277191, 0.2901961, 1, 0, 1,
-0.5457189, 0.1530921, -3.288947, 0.282353, 1, 0, 1,
-0.5454143, -1.336005, -1.343069, 0.2784314, 1, 0, 1,
-0.5449594, -2.476843, -3.582999, 0.2705882, 1, 0, 1,
-0.5375012, 0.9275466, -0.8129615, 0.2666667, 1, 0, 1,
-0.5372336, -1.150627, -1.639404, 0.2588235, 1, 0, 1,
-0.5328365, -1.109781, -2.607552, 0.254902, 1, 0, 1,
-0.5284228, 0.3014374, -3.015025, 0.2470588, 1, 0, 1,
-0.5216603, 1.147511, -1.406371, 0.2431373, 1, 0, 1,
-0.5183575, -0.8044047, -2.901427, 0.2352941, 1, 0, 1,
-0.5170785, -0.1638521, -0.05331651, 0.2313726, 1, 0, 1,
-0.5160521, 1.113832, -0.8513882, 0.2235294, 1, 0, 1,
-0.5107293, -0.2339793, -3.217892, 0.2196078, 1, 0, 1,
-0.508877, -0.8267807, -2.80185, 0.2117647, 1, 0, 1,
-0.5048387, -1.139113, -1.917246, 0.2078431, 1, 0, 1,
-0.5013065, 0.04156689, -2.61183, 0.2, 1, 0, 1,
-0.497083, -1.137322, -3.461417, 0.1921569, 1, 0, 1,
-0.4959701, -0.3384094, -0.6419566, 0.1882353, 1, 0, 1,
-0.4950497, -0.3577758, -1.682426, 0.1803922, 1, 0, 1,
-0.4947248, -0.7967122, -3.772807, 0.1764706, 1, 0, 1,
-0.4938366, -2.196326, -3.263518, 0.1686275, 1, 0, 1,
-0.4928487, -0.742151, -4.099703, 0.1647059, 1, 0, 1,
-0.4925286, -0.5582122, -1.780477, 0.1568628, 1, 0, 1,
-0.4913177, 0.6535662, 0.71, 0.1529412, 1, 0, 1,
-0.4884312, 0.7242062, -1.60736, 0.145098, 1, 0, 1,
-0.4873228, -0.630505, 0.0359904, 0.1411765, 1, 0, 1,
-0.4872386, -1.502356, -1.954334, 0.1333333, 1, 0, 1,
-0.472898, 0.7605489, -0.972703, 0.1294118, 1, 0, 1,
-0.4724371, 0.7593353, 0.2479085, 0.1215686, 1, 0, 1,
-0.4718699, -0.5007928, -2.682665, 0.1176471, 1, 0, 1,
-0.4700791, 0.1612234, -1.979992, 0.1098039, 1, 0, 1,
-0.4543111, -1.44022, -3.612287, 0.1058824, 1, 0, 1,
-0.45162, -1.369191, -3.51402, 0.09803922, 1, 0, 1,
-0.450711, 0.4164039, -1.459333, 0.09019608, 1, 0, 1,
-0.4482969, -0.09678361, -1.89338, 0.08627451, 1, 0, 1,
-0.4338145, 0.2568176, -1.240144, 0.07843138, 1, 0, 1,
-0.4306379, 0.5854065, -1.860561, 0.07450981, 1, 0, 1,
-0.4286396, 0.7631099, 0.5803465, 0.06666667, 1, 0, 1,
-0.4276318, -0.06201118, -4.871545, 0.0627451, 1, 0, 1,
-0.4258779, -0.983987, -0.892083, 0.05490196, 1, 0, 1,
-0.4234902, 0.3089478, -1.209177, 0.05098039, 1, 0, 1,
-0.4233205, -1.705181, -2.007514, 0.04313726, 1, 0, 1,
-0.4214799, -0.707019, -2.827149, 0.03921569, 1, 0, 1,
-0.4163084, 1.313488, -0.4985635, 0.03137255, 1, 0, 1,
-0.4154778, 1.663055, 0.7093365, 0.02745098, 1, 0, 1,
-0.4120933, -2.054053, -3.907024, 0.01960784, 1, 0, 1,
-0.4108018, -1.083399, -1.987394, 0.01568628, 1, 0, 1,
-0.4086101, -0.8233599, -3.470322, 0.007843138, 1, 0, 1,
-0.4078453, -0.8937832, -1.830172, 0.003921569, 1, 0, 1,
-0.4071793, -1.37042, -4.762757, 0, 1, 0.003921569, 1,
-0.405908, -1.321174, -3.02516, 0, 1, 0.01176471, 1,
-0.4052167, -0.4805803, -3.321565, 0, 1, 0.01568628, 1,
-0.4014449, 0.6595018, -0.07277928, 0, 1, 0.02352941, 1,
-0.3981423, -0.2021496, -2.516289, 0, 1, 0.02745098, 1,
-0.3975805, -0.2738688, -2.413838, 0, 1, 0.03529412, 1,
-0.3974396, -1.055432, -2.303515, 0, 1, 0.03921569, 1,
-0.3961232, -0.8545851, -2.118817, 0, 1, 0.04705882, 1,
-0.3919837, 0.7680287, -2.256847, 0, 1, 0.05098039, 1,
-0.386121, -1.153598, -2.307142, 0, 1, 0.05882353, 1,
-0.3757162, -0.4903544, -2.382039, 0, 1, 0.0627451, 1,
-0.3726513, -1.538864, -1.847509, 0, 1, 0.07058824, 1,
-0.3711902, 1.535792, -0.9756182, 0, 1, 0.07450981, 1,
-0.3675143, 0.7790439, -0.02542452, 0, 1, 0.08235294, 1,
-0.364934, -0.1489892, -1.300442, 0, 1, 0.08627451, 1,
-0.3597017, 1.570634, -0.3639327, 0, 1, 0.09411765, 1,
-0.3580487, 0.4036707, -1.344466, 0, 1, 0.1019608, 1,
-0.3573367, 0.08225749, -2.847923, 0, 1, 0.1058824, 1,
-0.3548836, 0.7083356, -0.2974526, 0, 1, 0.1137255, 1,
-0.3547034, 0.04212709, -0.003706501, 0, 1, 0.1176471, 1,
-0.3533401, 1.174794, -1.200649, 0, 1, 0.1254902, 1,
-0.3458879, 0.8334792, -1.806552, 0, 1, 0.1294118, 1,
-0.3448468, -1.434139, -2.566328, 0, 1, 0.1372549, 1,
-0.3438373, 0.5156584, 0.3022937, 0, 1, 0.1411765, 1,
-0.3416545, 0.8309484, -0.6920917, 0, 1, 0.1490196, 1,
-0.3321536, -0.7730924, -2.82909, 0, 1, 0.1529412, 1,
-0.3315614, 0.563548, -0.9594163, 0, 1, 0.1607843, 1,
-0.3297479, -0.6285524, -3.169405, 0, 1, 0.1647059, 1,
-0.3274953, -1.274413, -3.151722, 0, 1, 0.172549, 1,
-0.3272291, -2.485141, -1.98967, 0, 1, 0.1764706, 1,
-0.3228711, -0.4252768, -3.721334, 0, 1, 0.1843137, 1,
-0.3215035, -1.692138, 0.00166769, 0, 1, 0.1882353, 1,
-0.3163205, -0.5913723, -1.685575, 0, 1, 0.1960784, 1,
-0.3117374, -0.7005385, -4.899809, 0, 1, 0.2039216, 1,
-0.2986947, -1.028128, -2.751779, 0, 1, 0.2078431, 1,
-0.2935366, -0.4793817, -2.897662, 0, 1, 0.2156863, 1,
-0.2929929, -1.420745, -3.802117, 0, 1, 0.2196078, 1,
-0.2910461, -1.014466, -4.072453, 0, 1, 0.227451, 1,
-0.2867635, 1.409429, -1.87883, 0, 1, 0.2313726, 1,
-0.2861654, 1.156206, -1.314813, 0, 1, 0.2392157, 1,
-0.2858604, 0.68661, 0.5443944, 0, 1, 0.2431373, 1,
-0.2832307, -0.2318019, -1.787475, 0, 1, 0.2509804, 1,
-0.2821327, 1.070987, 0.7094291, 0, 1, 0.254902, 1,
-0.2815104, 0.3560024, 1.405516, 0, 1, 0.2627451, 1,
-0.2812274, 0.3799919, -1.078368, 0, 1, 0.2666667, 1,
-0.2793863, -2.217845, -5.171785, 0, 1, 0.2745098, 1,
-0.2791663, -1.409307, -2.922395, 0, 1, 0.2784314, 1,
-0.2779173, 0.2675742, -1.307311, 0, 1, 0.2862745, 1,
-0.2753025, 0.790745, -0.146854, 0, 1, 0.2901961, 1,
-0.2678105, 1.451247, 1.540426, 0, 1, 0.2980392, 1,
-0.2677986, 1.554536, -1.134165, 0, 1, 0.3058824, 1,
-0.2649039, 2.043925, 0.1239599, 0, 1, 0.3098039, 1,
-0.2604754, -0.1102, -1.483731, 0, 1, 0.3176471, 1,
-0.2571887, 0.3333053, -0.3026685, 0, 1, 0.3215686, 1,
-0.2566188, 0.2157296, -2.484054, 0, 1, 0.3294118, 1,
-0.256433, -0.5461435, -2.061026, 0, 1, 0.3333333, 1,
-0.2382725, 0.4665911, -1.473157, 0, 1, 0.3411765, 1,
-0.2376776, -0.4263159, -2.515594, 0, 1, 0.345098, 1,
-0.2376584, 0.1220257, -0.6282824, 0, 1, 0.3529412, 1,
-0.2369175, -1.240896, -0.8809326, 0, 1, 0.3568628, 1,
-0.2356049, -0.6609461, -3.981826, 0, 1, 0.3647059, 1,
-0.2355814, 1.355105, 0.5912161, 0, 1, 0.3686275, 1,
-0.2300681, -1.501011, -1.119157, 0, 1, 0.3764706, 1,
-0.2251648, -0.8886185, -2.269257, 0, 1, 0.3803922, 1,
-0.2247753, -1.944441, -3.030666, 0, 1, 0.3882353, 1,
-0.2246502, -0.3829987, -2.502011, 0, 1, 0.3921569, 1,
-0.2240474, 0.5060115, -1.96049, 0, 1, 0.4, 1,
-0.2234909, 1.7231, -0.9389575, 0, 1, 0.4078431, 1,
-0.2130439, -0.2849509, -2.315324, 0, 1, 0.4117647, 1,
-0.2100545, -0.7322334, -1.972037, 0, 1, 0.4196078, 1,
-0.2081229, -0.07245527, -2.179943, 0, 1, 0.4235294, 1,
-0.2072639, 0.2867892, -1.445472, 0, 1, 0.4313726, 1,
-0.2060941, 1.121114, -0.8696525, 0, 1, 0.4352941, 1,
-0.2052814, -0.5561017, -1.676027, 0, 1, 0.4431373, 1,
-0.2003923, -0.2512106, -3.00197, 0, 1, 0.4470588, 1,
-0.2002994, 0.6194377, 0.6311518, 0, 1, 0.454902, 1,
-0.1997452, 0.1742042, -1.519764, 0, 1, 0.4588235, 1,
-0.1949797, -1.032933, -4.718425, 0, 1, 0.4666667, 1,
-0.1932989, 0.04082312, -0.923732, 0, 1, 0.4705882, 1,
-0.1929823, -1.800201, -3.902635, 0, 1, 0.4784314, 1,
-0.1918533, -0.8410907, -1.798069, 0, 1, 0.4823529, 1,
-0.1909545, -0.5335925, -2.276968, 0, 1, 0.4901961, 1,
-0.1875389, 0.9137335, -0.9248908, 0, 1, 0.4941176, 1,
-0.1790012, 2.185531, -3.104928, 0, 1, 0.5019608, 1,
-0.1782192, 0.9297841, 1.449682, 0, 1, 0.509804, 1,
-0.1769384, -0.413503, -0.4528024, 0, 1, 0.5137255, 1,
-0.1762234, -0.8627549, -4.276195, 0, 1, 0.5215687, 1,
-0.1762204, -0.07720543, -3.098547, 0, 1, 0.5254902, 1,
-0.1760745, 0.173972, -1.176659, 0, 1, 0.5333334, 1,
-0.1738394, 1.3636, 0.9633223, 0, 1, 0.5372549, 1,
-0.1689993, 0.1891678, -0.532435, 0, 1, 0.5450981, 1,
-0.1654755, -0.4395483, -2.487996, 0, 1, 0.5490196, 1,
-0.1649016, -1.535199, -2.224449, 0, 1, 0.5568628, 1,
-0.1624677, 0.6425514, -0.4068044, 0, 1, 0.5607843, 1,
-0.1621026, 1.050376, -0.09311047, 0, 1, 0.5686275, 1,
-0.1561328, 1.272057, 1.06893, 0, 1, 0.572549, 1,
-0.1554299, -1.235447, -2.06993, 0, 1, 0.5803922, 1,
-0.1523498, 1.513993, 0.4126697, 0, 1, 0.5843138, 1,
-0.1522285, -0.9992972, -3.947701, 0, 1, 0.5921569, 1,
-0.1516109, 1.550283, 0.8857564, 0, 1, 0.5960785, 1,
-0.149954, 0.3307166, -0.4279387, 0, 1, 0.6039216, 1,
-0.1489764, -0.847718, -2.051084, 0, 1, 0.6117647, 1,
-0.142057, -1.001299, -1.948199, 0, 1, 0.6156863, 1,
-0.1392055, 1.413333, 0.5688298, 0, 1, 0.6235294, 1,
-0.1364094, 2.315102, -1.585416, 0, 1, 0.627451, 1,
-0.1287448, -1.12872, -3.415016, 0, 1, 0.6352941, 1,
-0.1272109, -0.2368888, -1.78522, 0, 1, 0.6392157, 1,
-0.1154543, -2.00371, -2.337872, 0, 1, 0.6470588, 1,
-0.1111338, -0.8374216, -2.8421, 0, 1, 0.6509804, 1,
-0.1039898, 1.199086, -1.5122, 0, 1, 0.6588235, 1,
-0.09969295, 0.7165226, -1.835481, 0, 1, 0.6627451, 1,
-0.09838352, -0.1563467, -2.573984, 0, 1, 0.6705883, 1,
-0.09666482, -0.5891399, -1.463998, 0, 1, 0.6745098, 1,
-0.09505646, 0.3000532, -2.65148, 0, 1, 0.682353, 1,
-0.09495348, -0.1281487, -2.380039, 0, 1, 0.6862745, 1,
-0.09372512, -0.4720204, -1.225166, 0, 1, 0.6941177, 1,
-0.09229866, 0.02988198, -1.7246, 0, 1, 0.7019608, 1,
-0.09096253, 1.031323, 1.181102, 0, 1, 0.7058824, 1,
-0.08950955, -0.2425446, -2.305454, 0, 1, 0.7137255, 1,
-0.0893278, -0.9029875, -4.178021, 0, 1, 0.7176471, 1,
-0.07951886, -0.7506071, -1.704146, 0, 1, 0.7254902, 1,
-0.07931041, -1.271927, -3.241051, 0, 1, 0.7294118, 1,
-0.07705485, -1.408292, -0.9905437, 0, 1, 0.7372549, 1,
-0.07089843, 0.2661943, 0.5199718, 0, 1, 0.7411765, 1,
-0.07058387, -0.9191017, -3.840369, 0, 1, 0.7490196, 1,
-0.06945419, 1.379834, 0.2230846, 0, 1, 0.7529412, 1,
-0.06718467, 1.331558, -0.7552593, 0, 1, 0.7607843, 1,
-0.06641816, 0.6522853, -0.2633359, 0, 1, 0.7647059, 1,
-0.06530256, -0.8808571, -2.028725, 0, 1, 0.772549, 1,
-0.06451212, 1.057273, -0.08500069, 0, 1, 0.7764706, 1,
-0.05698404, 1.160718, 0.8222944, 0, 1, 0.7843137, 1,
-0.05553357, -0.4072561, -3.719822, 0, 1, 0.7882353, 1,
-0.05058665, -0.1591437, -2.504592, 0, 1, 0.7960784, 1,
-0.04989292, -0.5158331, -3.789694, 0, 1, 0.8039216, 1,
-0.04611121, 1.279862, -0.5118371, 0, 1, 0.8078431, 1,
-0.04247653, 0.1286388, 0.04662282, 0, 1, 0.8156863, 1,
-0.03922877, 0.4225601, 0.7705759, 0, 1, 0.8196079, 1,
-0.03619186, -1.26733, -3.308295, 0, 1, 0.827451, 1,
-0.03611797, 0.5145804, -1.073576, 0, 1, 0.8313726, 1,
-0.03466575, -1.173796, -2.585256, 0, 1, 0.8392157, 1,
-0.03339085, 2.074518, -0.5224904, 0, 1, 0.8431373, 1,
-0.02944788, 1.564743, 0.1680155, 0, 1, 0.8509804, 1,
-0.02905663, 0.03208119, -1.643866, 0, 1, 0.854902, 1,
-0.02706505, 1.561271, 0.0225668, 0, 1, 0.8627451, 1,
-0.02342899, -0.2747272, -3.766636, 0, 1, 0.8666667, 1,
-0.02315231, -0.4455034, -3.120831, 0, 1, 0.8745098, 1,
-0.02233041, 1.20928, -0.06875186, 0, 1, 0.8784314, 1,
-0.01675742, 1.372094, 0.6965593, 0, 1, 0.8862745, 1,
-0.0165613, 1.758264, -0.474396, 0, 1, 0.8901961, 1,
-0.0121004, -1.095312, -3.658607, 0, 1, 0.8980392, 1,
-0.008412517, -0.8341444, -1.865043, 0, 1, 0.9058824, 1,
-0.007134099, -0.6468109, -3.007781, 0, 1, 0.9098039, 1,
-0.005152366, -0.177355, -1.893811, 0, 1, 0.9176471, 1,
-0.004756168, -1.217635, -4.497101, 0, 1, 0.9215686, 1,
-0.004285329, 1.559887, 1.490396, 0, 1, 0.9294118, 1,
-0.003181895, -0.7583705, -3.795799, 0, 1, 0.9333333, 1,
-0.002304328, 0.3045513, -0.3986118, 0, 1, 0.9411765, 1,
-0.001217078, 0.9228217, 1.050579, 0, 1, 0.945098, 1,
0.003805025, 0.6078562, 0.3809845, 0, 1, 0.9529412, 1,
0.004535855, -0.9504049, 3.322292, 0, 1, 0.9568627, 1,
0.006304698, 1.183748, -0.3993269, 0, 1, 0.9647059, 1,
0.01310028, -0.8067775, 3.22876, 0, 1, 0.9686275, 1,
0.01665569, -0.7595421, 1.87237, 0, 1, 0.9764706, 1,
0.02132951, -0.01295621, 2.487747, 0, 1, 0.9803922, 1,
0.02523272, -0.08058838, 3.194979, 0, 1, 0.9882353, 1,
0.02565162, -0.2245055, 3.790963, 0, 1, 0.9921569, 1,
0.02640598, 0.7056836, 0.9016981, 0, 1, 1, 1,
0.02780204, -0.9174036, 2.169735, 0, 0.9921569, 1, 1,
0.03077615, 0.9876394, -0.6583316, 0, 0.9882353, 1, 1,
0.03090315, -0.6699033, 4.359022, 0, 0.9803922, 1, 1,
0.03264862, 0.780889, 1.045647, 0, 0.9764706, 1, 1,
0.03497514, 0.5697528, 0.3027621, 0, 0.9686275, 1, 1,
0.03985337, 0.07482092, 0.08064887, 0, 0.9647059, 1, 1,
0.04273434, -1.027189, 2.02591, 0, 0.9568627, 1, 1,
0.04324406, 1.260941, -0.2711754, 0, 0.9529412, 1, 1,
0.04378932, -1.033034, 2.656549, 0, 0.945098, 1, 1,
0.04517897, 0.1600758, -0.966749, 0, 0.9411765, 1, 1,
0.04808446, -0.3023795, 4.347009, 0, 0.9333333, 1, 1,
0.04933122, 2.230556, 0.3091772, 0, 0.9294118, 1, 1,
0.05088079, -1.326163, 3.226663, 0, 0.9215686, 1, 1,
0.05827887, 0.5157621, 1.155706, 0, 0.9176471, 1, 1,
0.06028192, -0.7011226, 2.981557, 0, 0.9098039, 1, 1,
0.06104686, -0.8728899, 2.521677, 0, 0.9058824, 1, 1,
0.06244479, -0.0618287, 3.037513, 0, 0.8980392, 1, 1,
0.06264036, -0.71087, 3.285853, 0, 0.8901961, 1, 1,
0.07927667, 0.3907366, 0.3492331, 0, 0.8862745, 1, 1,
0.08571145, 0.612573, 0.3629741, 0, 0.8784314, 1, 1,
0.08671678, -0.05134239, 2.315258, 0, 0.8745098, 1, 1,
0.08872314, -0.9142987, 2.510412, 0, 0.8666667, 1, 1,
0.08904141, -0.5615675, 3.548531, 0, 0.8627451, 1, 1,
0.0916135, -0.6385766, 2.729686, 0, 0.854902, 1, 1,
0.0936571, -1.020249, 3.783272, 0, 0.8509804, 1, 1,
0.09861942, -1.725205, 4.33502, 0, 0.8431373, 1, 1,
0.1018109, -2.410564, 2.55001, 0, 0.8392157, 1, 1,
0.1026697, -0.0104424, 2.431031, 0, 0.8313726, 1, 1,
0.1044615, -0.5985203, 2.638217, 0, 0.827451, 1, 1,
0.1052807, -2.126698, 1.709491, 0, 0.8196079, 1, 1,
0.1059611, -1.496394, 2.61329, 0, 0.8156863, 1, 1,
0.1107373, -0.4463321, 3.228338, 0, 0.8078431, 1, 1,
0.111673, -1.107258, 3.763222, 0, 0.8039216, 1, 1,
0.1155861, 0.6624803, -1.046399, 0, 0.7960784, 1, 1,
0.1176545, -0.9856436, 3.122882, 0, 0.7882353, 1, 1,
0.1199096, 0.08791537, 1.627764, 0, 0.7843137, 1, 1,
0.1213013, -1.046443, 3.009788, 0, 0.7764706, 1, 1,
0.1213041, -0.4440659, 4.64289, 0, 0.772549, 1, 1,
0.122215, -1.260965, 1.951696, 0, 0.7647059, 1, 1,
0.1229952, -0.1672045, 2.245887, 0, 0.7607843, 1, 1,
0.1262494, 1.248936, 0.1357272, 0, 0.7529412, 1, 1,
0.1323273, 0.1414828, 0.3529479, 0, 0.7490196, 1, 1,
0.1327495, -0.6126218, 3.810937, 0, 0.7411765, 1, 1,
0.1348926, 0.7483634, -1.117882, 0, 0.7372549, 1, 1,
0.1415828, -1.840713, 3.804619, 0, 0.7294118, 1, 1,
0.1415843, 0.8825854, -0.2812322, 0, 0.7254902, 1, 1,
0.1480553, -0.7332364, 2.077353, 0, 0.7176471, 1, 1,
0.1552566, 0.2378526, 0.1731581, 0, 0.7137255, 1, 1,
0.1575145, -0.7251008, 1.826369, 0, 0.7058824, 1, 1,
0.1583985, -0.9146261, 2.9553, 0, 0.6980392, 1, 1,
0.1592304, 2.061397, -0.075478, 0, 0.6941177, 1, 1,
0.16175, 0.1467212, 0.8382684, 0, 0.6862745, 1, 1,
0.1620814, 0.6418857, -0.008883919, 0, 0.682353, 1, 1,
0.1637017, -1.110755, 2.473524, 0, 0.6745098, 1, 1,
0.1682808, 0.8112579, 0.09056824, 0, 0.6705883, 1, 1,
0.1689356, -1.936727, 2.610044, 0, 0.6627451, 1, 1,
0.1706962, 1.399246, -0.4428892, 0, 0.6588235, 1, 1,
0.1722783, 0.8970867, 0.6737828, 0, 0.6509804, 1, 1,
0.1743446, 1.422465, 0.2791336, 0, 0.6470588, 1, 1,
0.1747112, -0.4642379, 1.959673, 0, 0.6392157, 1, 1,
0.1760104, -0.4103564, 3.810246, 0, 0.6352941, 1, 1,
0.1772588, -0.4843605, 1.983578, 0, 0.627451, 1, 1,
0.1788058, 1.376246, 1.80862, 0, 0.6235294, 1, 1,
0.1792491, 1.838365, -0.6894028, 0, 0.6156863, 1, 1,
0.180258, -0.3151709, 4.045595, 0, 0.6117647, 1, 1,
0.1821754, 0.918081, 0.2197449, 0, 0.6039216, 1, 1,
0.1821878, -1.985687, 4.910476, 0, 0.5960785, 1, 1,
0.1835744, 0.7817481, 0.1699937, 0, 0.5921569, 1, 1,
0.1836271, 0.6465032, 0.4370813, 0, 0.5843138, 1, 1,
0.186195, -1.348187, 1.469504, 0, 0.5803922, 1, 1,
0.187032, -0.7112172, 2.830676, 0, 0.572549, 1, 1,
0.1893667, 2.322939, 1.092916, 0, 0.5686275, 1, 1,
0.1911346, -0.2707313, 2.068899, 0, 0.5607843, 1, 1,
0.19385, 0.3433884, 0.104124, 0, 0.5568628, 1, 1,
0.2003188, 1.157903, -0.3677041, 0, 0.5490196, 1, 1,
0.2003794, -0.8832623, 1.435855, 0, 0.5450981, 1, 1,
0.2005855, -0.4297105, 3.083486, 0, 0.5372549, 1, 1,
0.2046393, -0.1053937, 2.609636, 0, 0.5333334, 1, 1,
0.2115243, -0.2690849, 1.468379, 0, 0.5254902, 1, 1,
0.2120199, 0.5359944, -0.3810654, 0, 0.5215687, 1, 1,
0.2152845, 0.6426671, -0.01271883, 0, 0.5137255, 1, 1,
0.2190721, -1.797353, 2.677005, 0, 0.509804, 1, 1,
0.2197248, 0.7501987, 0.5486642, 0, 0.5019608, 1, 1,
0.2208021, 0.1464865, 1.605925, 0, 0.4941176, 1, 1,
0.2212342, -0.7447756, 4.1785, 0, 0.4901961, 1, 1,
0.2236611, -0.469617, 3.388669, 0, 0.4823529, 1, 1,
0.2238295, 1.288742, -0.701188, 0, 0.4784314, 1, 1,
0.2268033, -0.1003453, 1.509079, 0, 0.4705882, 1, 1,
0.2269813, 0.3649898, -0.2931187, 0, 0.4666667, 1, 1,
0.2287761, 2.224965, 0.06810953, 0, 0.4588235, 1, 1,
0.2328334, 0.7646033, 0.6679696, 0, 0.454902, 1, 1,
0.237668, -1.460953, 2.481624, 0, 0.4470588, 1, 1,
0.242264, -0.5170773, 3.681671, 0, 0.4431373, 1, 1,
0.2437321, 0.2746908, 2.007873, 0, 0.4352941, 1, 1,
0.2452299, 1.715308, -0.7699811, 0, 0.4313726, 1, 1,
0.2458909, 1.234037, 0.1127047, 0, 0.4235294, 1, 1,
0.2491283, -0.07786739, 1.616836, 0, 0.4196078, 1, 1,
0.2518378, 0.4460551, 0.4532583, 0, 0.4117647, 1, 1,
0.2532442, 2.409502, 0.1131234, 0, 0.4078431, 1, 1,
0.2533637, -1.011595, 2.351555, 0, 0.4, 1, 1,
0.2555319, -0.2131154, 3.812014, 0, 0.3921569, 1, 1,
0.256615, 1.79479, -0.122069, 0, 0.3882353, 1, 1,
0.2572604, 0.1783987, 2.494144, 0, 0.3803922, 1, 1,
0.2591889, -1.525806, 3.463126, 0, 0.3764706, 1, 1,
0.2608038, -0.8391446, 2.469958, 0, 0.3686275, 1, 1,
0.2626309, -0.7092503, 2.164675, 0, 0.3647059, 1, 1,
0.2649929, 0.0534641, 1.486578, 0, 0.3568628, 1, 1,
0.2659616, -0.3482748, 2.020205, 0, 0.3529412, 1, 1,
0.2704283, 2.004452, -1.54182, 0, 0.345098, 1, 1,
0.2771823, -1.930412, 3.404541, 0, 0.3411765, 1, 1,
0.2819896, -0.8365924, 3.884922, 0, 0.3333333, 1, 1,
0.2827231, 0.0449939, 2.225941, 0, 0.3294118, 1, 1,
0.2862676, 0.8482095, 2.067315, 0, 0.3215686, 1, 1,
0.2868067, 0.2520694, 1.213319, 0, 0.3176471, 1, 1,
0.2879771, 1.233369, 1.462446, 0, 0.3098039, 1, 1,
0.2887485, -1.036426, 2.714159, 0, 0.3058824, 1, 1,
0.2890423, -0.6301225, 2.443162, 0, 0.2980392, 1, 1,
0.3007948, -0.9399312, 4.444698, 0, 0.2901961, 1, 1,
0.3034042, -0.6140496, 4.682501, 0, 0.2862745, 1, 1,
0.3038226, 1.656582, -2.475482, 0, 0.2784314, 1, 1,
0.3126969, 0.6387981, 1.127548, 0, 0.2745098, 1, 1,
0.3145263, -1.886741, 2.811805, 0, 0.2666667, 1, 1,
0.3154283, -0.1962578, 1.337056, 0, 0.2627451, 1, 1,
0.3166989, 0.7288282, 2.229808, 0, 0.254902, 1, 1,
0.3189612, -0.2977149, 2.31451, 0, 0.2509804, 1, 1,
0.3208414, -1.01302, 2.694545, 0, 0.2431373, 1, 1,
0.3237728, -0.5844303, 3.371074, 0, 0.2392157, 1, 1,
0.3262115, 1.270712, -0.02266164, 0, 0.2313726, 1, 1,
0.3296162, -0.2084675, 0.3138998, 0, 0.227451, 1, 1,
0.3297879, -1.509495, 4.965232, 0, 0.2196078, 1, 1,
0.3299243, 1.680218, -1.154336, 0, 0.2156863, 1, 1,
0.3310768, 1.416008, -0.2042493, 0, 0.2078431, 1, 1,
0.3321879, 0.3882606, 1.471159, 0, 0.2039216, 1, 1,
0.3333058, -0.4606239, 3.114421, 0, 0.1960784, 1, 1,
0.3384791, 0.4277629, 2.148672, 0, 0.1882353, 1, 1,
0.3396944, 1.166954, 0.7610302, 0, 0.1843137, 1, 1,
0.3407057, 0.1268027, 2.056263, 0, 0.1764706, 1, 1,
0.3504635, 0.5458906, -0.5027901, 0, 0.172549, 1, 1,
0.3510608, -0.004341197, -0.5523685, 0, 0.1647059, 1, 1,
0.3572486, -0.2149036, 2.446516, 0, 0.1607843, 1, 1,
0.3573084, -0.5382581, 4.572624, 0, 0.1529412, 1, 1,
0.3612035, -0.1227893, 1.329424, 0, 0.1490196, 1, 1,
0.3613703, -0.6455091, 1.944345, 0, 0.1411765, 1, 1,
0.3618054, -0.190488, 1.925078, 0, 0.1372549, 1, 1,
0.3626041, -0.8987829, -0.6598214, 0, 0.1294118, 1, 1,
0.3643973, 0.6059533, -1.108096, 0, 0.1254902, 1, 1,
0.3718761, 0.3508195, -0.3357609, 0, 0.1176471, 1, 1,
0.3739496, 0.02520604, 1.227552, 0, 0.1137255, 1, 1,
0.3817321, 0.7318264, 0.07384469, 0, 0.1058824, 1, 1,
0.38664, -1.060382, 1.81745, 0, 0.09803922, 1, 1,
0.3906988, -0.2218609, 3.042591, 0, 0.09411765, 1, 1,
0.39245, -0.499781, 1.774064, 0, 0.08627451, 1, 1,
0.3958397, -0.1458376, 2.472708, 0, 0.08235294, 1, 1,
0.4021933, 0.03844104, 1.720818, 0, 0.07450981, 1, 1,
0.4026657, 0.2995573, 0.6293694, 0, 0.07058824, 1, 1,
0.4088785, 0.281599, 1.21119, 0, 0.0627451, 1, 1,
0.4130805, 0.6492132, 0.180795, 0, 0.05882353, 1, 1,
0.4145899, -0.2607204, 2.28143, 0, 0.05098039, 1, 1,
0.4180623, -1.15898, 4.071599, 0, 0.04705882, 1, 1,
0.4198718, 0.1665463, 2.535615, 0, 0.03921569, 1, 1,
0.4245288, 0.2842299, 1.902803, 0, 0.03529412, 1, 1,
0.42528, -1.48169, 3.182939, 0, 0.02745098, 1, 1,
0.4279326, 0.2801564, 0.9350083, 0, 0.02352941, 1, 1,
0.4304095, 0.06913345, 3.419403, 0, 0.01568628, 1, 1,
0.433311, -2.242529, 3.612381, 0, 0.01176471, 1, 1,
0.4383937, -0.0406234, 1.939949, 0, 0.003921569, 1, 1,
0.4461996, -1.556852, 2.752607, 0.003921569, 0, 1, 1,
0.4463798, -2.523072, 2.951468, 0.007843138, 0, 1, 1,
0.4471704, -0.2023279, 2.480973, 0.01568628, 0, 1, 1,
0.457168, -0.6805545, 4.198034, 0.01960784, 0, 1, 1,
0.4580053, 1.122694, -0.2882273, 0.02745098, 0, 1, 1,
0.460159, 0.4285091, 2.396585, 0.03137255, 0, 1, 1,
0.4606298, -1.14178, 1.078749, 0.03921569, 0, 1, 1,
0.47118, 1.295448, 1.071596, 0.04313726, 0, 1, 1,
0.4712966, -1.628906, 2.181474, 0.05098039, 0, 1, 1,
0.4729377, 1.517245, -0.8033159, 0.05490196, 0, 1, 1,
0.4761549, -0.1856197, 3.551145, 0.0627451, 0, 1, 1,
0.4792385, 0.07042623, 2.607229, 0.06666667, 0, 1, 1,
0.4814726, -1.162307, 1.764798, 0.07450981, 0, 1, 1,
0.4829555, 0.769664, -2.157682, 0.07843138, 0, 1, 1,
0.4838109, -0.9112614, 1.974818, 0.08627451, 0, 1, 1,
0.4840552, 0.8773565, 0.9451834, 0.09019608, 0, 1, 1,
0.4846645, 0.3920879, 1.805863, 0.09803922, 0, 1, 1,
0.4857303, -1.542189, 2.539241, 0.1058824, 0, 1, 1,
0.4889766, -2.017509, 4.299861, 0.1098039, 0, 1, 1,
0.4895924, 0.09642298, 0.5912877, 0.1176471, 0, 1, 1,
0.493529, 0.5797696, -0.4775521, 0.1215686, 0, 1, 1,
0.4978216, -1.196765, 1.14018, 0.1294118, 0, 1, 1,
0.4985522, 0.4297014, -0.2118828, 0.1333333, 0, 1, 1,
0.5019569, 0.262316, -0.01610192, 0.1411765, 0, 1, 1,
0.5027586, 0.6120959, 1.962291, 0.145098, 0, 1, 1,
0.5058794, -1.298357, 2.477015, 0.1529412, 0, 1, 1,
0.5086905, -0.5905884, 0.9953116, 0.1568628, 0, 1, 1,
0.5174679, -0.9789137, 2.789111, 0.1647059, 0, 1, 1,
0.5188559, -2.412143, 1.999081, 0.1686275, 0, 1, 1,
0.5191675, -0.3356037, 1.547886, 0.1764706, 0, 1, 1,
0.5195793, -0.781804, 2.613575, 0.1803922, 0, 1, 1,
0.5232334, -1.49732, 0.1976562, 0.1882353, 0, 1, 1,
0.5241433, -0.2817571, 1.285322, 0.1921569, 0, 1, 1,
0.5246762, 0.92575, 0.1014808, 0.2, 0, 1, 1,
0.5297602, -1.474791, 3.006945, 0.2078431, 0, 1, 1,
0.532538, -0.1684569, 2.455613, 0.2117647, 0, 1, 1,
0.5338969, 1.134391, 1.386333, 0.2196078, 0, 1, 1,
0.5428093, 0.08398566, 1.81961, 0.2235294, 0, 1, 1,
0.5441865, -0.5235556, 3.840829, 0.2313726, 0, 1, 1,
0.5470268, 1.313065, -0.5562825, 0.2352941, 0, 1, 1,
0.5494245, 0.6990228, 0.8888412, 0.2431373, 0, 1, 1,
0.5497446, -1.054466, 1.626185, 0.2470588, 0, 1, 1,
0.5510513, -0.1800214, 3.551898, 0.254902, 0, 1, 1,
0.5545736, 1.168349, 2.275666, 0.2588235, 0, 1, 1,
0.5566136, 0.927658, -0.08263749, 0.2666667, 0, 1, 1,
0.5567502, 3.018279, 0.4409145, 0.2705882, 0, 1, 1,
0.5589805, -0.3085679, 2.399496, 0.2784314, 0, 1, 1,
0.560174, 1.086878, 2.117579, 0.282353, 0, 1, 1,
0.5623117, 1.414279, 0.6639325, 0.2901961, 0, 1, 1,
0.5630736, 1.688721, 0.640292, 0.2941177, 0, 1, 1,
0.5689969, -0.6211565, 1.624503, 0.3019608, 0, 1, 1,
0.569672, -1.92501, 4.026123, 0.3098039, 0, 1, 1,
0.573585, 3.038564, 0.08158141, 0.3137255, 0, 1, 1,
0.5742698, -0.2827874, 2.935511, 0.3215686, 0, 1, 1,
0.574531, 0.772783, 2.276378, 0.3254902, 0, 1, 1,
0.5774156, -0.2731612, 0.735997, 0.3333333, 0, 1, 1,
0.578486, 1.646835, 1.778387, 0.3372549, 0, 1, 1,
0.580749, 2.182723, 1.069644, 0.345098, 0, 1, 1,
0.5903099, 1.014229, -0.5339644, 0.3490196, 0, 1, 1,
0.5941515, 1.462274, -0.1361451, 0.3568628, 0, 1, 1,
0.5941948, -0.2422462, 0.2647671, 0.3607843, 0, 1, 1,
0.5949187, -1.717005, 4.761842, 0.3686275, 0, 1, 1,
0.597845, 0.1389626, 2.60047, 0.372549, 0, 1, 1,
0.5981199, 0.2460479, 1.421587, 0.3803922, 0, 1, 1,
0.6047837, -1.204488, 2.40081, 0.3843137, 0, 1, 1,
0.6055866, 2.240314, -0.3011799, 0.3921569, 0, 1, 1,
0.605969, 0.6592909, 0.06729067, 0.3960784, 0, 1, 1,
0.6088832, -0.5274035, 1.787844, 0.4039216, 0, 1, 1,
0.6135378, 1.149028, 0.6354212, 0.4117647, 0, 1, 1,
0.615495, -0.8111593, 2.713385, 0.4156863, 0, 1, 1,
0.6204192, 0.3106097, 0.4858881, 0.4235294, 0, 1, 1,
0.6207952, 0.8343653, 1.228498, 0.427451, 0, 1, 1,
0.624003, -1.31792, 2.987202, 0.4352941, 0, 1, 1,
0.6263684, -0.1269477, 1.601738, 0.4392157, 0, 1, 1,
0.6299226, 0.1337887, 0.541473, 0.4470588, 0, 1, 1,
0.6351845, -1.078114, 1.377339, 0.4509804, 0, 1, 1,
0.637805, -0.6131391, 0.8005424, 0.4588235, 0, 1, 1,
0.6380009, -1.026284, 3.538316, 0.4627451, 0, 1, 1,
0.6386521, 0.05128876, 0.9851324, 0.4705882, 0, 1, 1,
0.6432414, 0.6435886, -0.8844013, 0.4745098, 0, 1, 1,
0.645343, 1.085461, -1.234733, 0.4823529, 0, 1, 1,
0.6453674, 0.2119755, 1.640487, 0.4862745, 0, 1, 1,
0.6507658, -0.6347826, 2.227286, 0.4941176, 0, 1, 1,
0.6507875, -0.3992321, 1.507136, 0.5019608, 0, 1, 1,
0.6585651, 1.019209, 0.7481208, 0.5058824, 0, 1, 1,
0.6649351, -0.07379698, 3.166899, 0.5137255, 0, 1, 1,
0.6697413, 1.878606, 1.186877, 0.5176471, 0, 1, 1,
0.6720151, -0.2956573, 0.1424068, 0.5254902, 0, 1, 1,
0.6793769, 0.2343766, -0.5337937, 0.5294118, 0, 1, 1,
0.6838182, 1.02338, 0.4863718, 0.5372549, 0, 1, 1,
0.6880652, 0.6081294, -0.4018049, 0.5411765, 0, 1, 1,
0.6973865, 0.1208295, 2.902749, 0.5490196, 0, 1, 1,
0.6998655, -0.4472152, 2.212153, 0.5529412, 0, 1, 1,
0.7033926, -0.1009433, 1.548282, 0.5607843, 0, 1, 1,
0.7037194, -0.9372541, 2.169066, 0.5647059, 0, 1, 1,
0.7038143, 0.4056771, 2.53902, 0.572549, 0, 1, 1,
0.7038755, -0.7766523, 2.698777, 0.5764706, 0, 1, 1,
0.7097883, -0.4751325, 0.9786681, 0.5843138, 0, 1, 1,
0.7123584, 0.2088657, 1.869618, 0.5882353, 0, 1, 1,
0.7130921, 1.050493, -0.3571269, 0.5960785, 0, 1, 1,
0.7209585, 0.02646497, 2.267205, 0.6039216, 0, 1, 1,
0.7253076, -2.209304, 1.681757, 0.6078432, 0, 1, 1,
0.725852, -0.1177083, 2.535439, 0.6156863, 0, 1, 1,
0.7329335, -0.09087055, 0.7904661, 0.6196079, 0, 1, 1,
0.7336255, -0.1860618, 0.7731439, 0.627451, 0, 1, 1,
0.7367268, -1.453863, 3.31433, 0.6313726, 0, 1, 1,
0.7536685, -0.3880366, 2.241579, 0.6392157, 0, 1, 1,
0.7563167, -0.5253139, 1.245628, 0.6431373, 0, 1, 1,
0.7570702, -0.1461051, 1.258647, 0.6509804, 0, 1, 1,
0.7582989, 0.06570365, 2.354735, 0.654902, 0, 1, 1,
0.7584847, -2.736425, 4.548717, 0.6627451, 0, 1, 1,
0.7639957, 0.09329632, 0.3168569, 0.6666667, 0, 1, 1,
0.7721681, 0.1889244, 2.470882, 0.6745098, 0, 1, 1,
0.7800202, 0.377274, 2.644133, 0.6784314, 0, 1, 1,
0.7811697, 1.588665, 1.668075, 0.6862745, 0, 1, 1,
0.7813997, -1.539439, 3.012763, 0.6901961, 0, 1, 1,
0.7818713, 1.536824, 0.5359113, 0.6980392, 0, 1, 1,
0.7839854, 0.6851786, 3.381014, 0.7058824, 0, 1, 1,
0.7841663, -1.699689, 3.742699, 0.7098039, 0, 1, 1,
0.7925511, 0.3481037, 2.360859, 0.7176471, 0, 1, 1,
0.7925907, -0.4289939, 3.154182, 0.7215686, 0, 1, 1,
0.7934824, -0.9090716, 2.700396, 0.7294118, 0, 1, 1,
0.7950568, -0.1368129, 1.835837, 0.7333333, 0, 1, 1,
0.7959728, 0.4450137, 2.459993, 0.7411765, 0, 1, 1,
0.8045468, 1.162157, -0.01620004, 0.7450981, 0, 1, 1,
0.808987, 0.4570543, 1.904309, 0.7529412, 0, 1, 1,
0.8101213, -0.1537891, 1.245728, 0.7568628, 0, 1, 1,
0.8121976, -1.315478, 0.2592072, 0.7647059, 0, 1, 1,
0.8125239, 1.462987, 0.4824316, 0.7686275, 0, 1, 1,
0.8141937, -0.2095343, 2.381862, 0.7764706, 0, 1, 1,
0.8157215, 0.7261743, 0.568598, 0.7803922, 0, 1, 1,
0.8165144, -0.5767303, 1.25123, 0.7882353, 0, 1, 1,
0.8270075, 1.345523, -1.17572, 0.7921569, 0, 1, 1,
0.8275657, -1.072149, 2.326256, 0.8, 0, 1, 1,
0.8277432, -0.03878586, 0.7164217, 0.8078431, 0, 1, 1,
0.8310089, -1.007271, 3.374509, 0.8117647, 0, 1, 1,
0.8317118, 0.2853125, 1.722037, 0.8196079, 0, 1, 1,
0.8319769, 0.4281937, 2.424556, 0.8235294, 0, 1, 1,
0.8320397, -0.7805743, 2.677027, 0.8313726, 0, 1, 1,
0.8342395, 0.325811, 1.663523, 0.8352941, 0, 1, 1,
0.8402085, 0.1894755, 2.362365, 0.8431373, 0, 1, 1,
0.8451722, -0.7894039, 2.196949, 0.8470588, 0, 1, 1,
0.8457249, -0.386577, 1.874169, 0.854902, 0, 1, 1,
0.8505675, -0.8107624, 0.8683198, 0.8588235, 0, 1, 1,
0.8506472, 0.3778462, 2.760787, 0.8666667, 0, 1, 1,
0.8527758, 0.5707656, 1.864458, 0.8705882, 0, 1, 1,
0.8742725, -0.8021708, 2.103061, 0.8784314, 0, 1, 1,
0.8748743, -0.7771218, 1.222248, 0.8823529, 0, 1, 1,
0.8793093, -1.302702, 1.470967, 0.8901961, 0, 1, 1,
0.8873985, -1.406457, 3.825289, 0.8941177, 0, 1, 1,
0.8881955, -0.8263763, 1.956002, 0.9019608, 0, 1, 1,
0.8929505, -0.6957118, 1.599428, 0.9098039, 0, 1, 1,
0.90667, 0.1973739, 1.576393, 0.9137255, 0, 1, 1,
0.9075782, 1.826747, 1.28684, 0.9215686, 0, 1, 1,
0.910904, 0.8626506, 0.4319399, 0.9254902, 0, 1, 1,
0.9133224, 0.6770599, 1.40847, 0.9333333, 0, 1, 1,
0.9293069, 0.02349424, -1.182333, 0.9372549, 0, 1, 1,
0.9316624, 1.19072, 0.7297901, 0.945098, 0, 1, 1,
0.9321982, -0.3008212, 2.405259, 0.9490196, 0, 1, 1,
0.9327895, 0.717689, 2.404301, 0.9568627, 0, 1, 1,
0.9464582, 1.203191, 1.068864, 0.9607843, 0, 1, 1,
0.9534964, -0.2034896, 2.206107, 0.9686275, 0, 1, 1,
0.9632982, -0.462093, 1.680456, 0.972549, 0, 1, 1,
0.9647312, -0.9944223, 2.230837, 0.9803922, 0, 1, 1,
0.9666682, -0.05858132, 1.877078, 0.9843137, 0, 1, 1,
0.9715618, 0.3307674, -0.2700256, 0.9921569, 0, 1, 1,
0.9729028, 0.2356748, 3.203452, 0.9960784, 0, 1, 1,
0.9740125, 0.02256592, 0.7957115, 1, 0, 0.9960784, 1,
0.9743931, 0.2873392, 2.155882, 1, 0, 0.9882353, 1,
0.9834381, 0.1163746, 3.356837, 1, 0, 0.9843137, 1,
0.9945238, 1.03464, 0.6139061, 1, 0, 0.9764706, 1,
1.00157, -1.113277, 2.380076, 1, 0, 0.972549, 1,
1.005513, 0.4412586, 1.096479, 1, 0, 0.9647059, 1,
1.008481, -0.6310866, 2.64893, 1, 0, 0.9607843, 1,
1.022124, 0.3750902, 1.710881, 1, 0, 0.9529412, 1,
1.034716, -0.3239875, 1.928954, 1, 0, 0.9490196, 1,
1.035195, 0.02419401, 0.3228319, 1, 0, 0.9411765, 1,
1.039042, -0.5306335, 2.348746, 1, 0, 0.9372549, 1,
1.040241, 0.8442724, 0.9162381, 1, 0, 0.9294118, 1,
1.040569, -0.08747678, 0.9970866, 1, 0, 0.9254902, 1,
1.041653, -1.392741, 1.909708, 1, 0, 0.9176471, 1,
1.042507, 0.1051991, 2.790941, 1, 0, 0.9137255, 1,
1.050696, -0.05600703, 2.032296, 1, 0, 0.9058824, 1,
1.052907, -0.2523084, 1.172062, 1, 0, 0.9019608, 1,
1.054375, -0.7610195, 3.093212, 1, 0, 0.8941177, 1,
1.06116, 0.2559005, -0.01145753, 1, 0, 0.8862745, 1,
1.065995, -1.515733, 2.730109, 1, 0, 0.8823529, 1,
1.069906, 0.4526432, 2.881012, 1, 0, 0.8745098, 1,
1.070339, -0.846819, 2.417548, 1, 0, 0.8705882, 1,
1.076928, -0.3593395, 2.933894, 1, 0, 0.8627451, 1,
1.079235, 0.158269, 1.32409, 1, 0, 0.8588235, 1,
1.081864, 1.092358, -0.3628716, 1, 0, 0.8509804, 1,
1.083312, -0.4803621, 3.684156, 1, 0, 0.8470588, 1,
1.084724, -1.233183, 1.032115, 1, 0, 0.8392157, 1,
1.086153, 0.4155059, 0.9392888, 1, 0, 0.8352941, 1,
1.086629, 0.8635484, 1.374655, 1, 0, 0.827451, 1,
1.089254, 0.3514895, 1.779102, 1, 0, 0.8235294, 1,
1.094435, 1.151663, 2.482176, 1, 0, 0.8156863, 1,
1.095099, -2.618752, 2.627536, 1, 0, 0.8117647, 1,
1.097213, -1.698233, 2.021559, 1, 0, 0.8039216, 1,
1.108448, 0.1617639, 1.266484, 1, 0, 0.7960784, 1,
1.122407, -0.8563311, 2.370768, 1, 0, 0.7921569, 1,
1.123293, 0.1729466, 1.737198, 1, 0, 0.7843137, 1,
1.131076, 0.4640558, 3.969444, 1, 0, 0.7803922, 1,
1.136457, -0.1484145, 2.334468, 1, 0, 0.772549, 1,
1.138054, -0.9388648, 2.361341, 1, 0, 0.7686275, 1,
1.146571, 0.5419689, -0.05873831, 1, 0, 0.7607843, 1,
1.163277, -1.662174, 1.203718, 1, 0, 0.7568628, 1,
1.166801, -0.9005395, 2.050115, 1, 0, 0.7490196, 1,
1.169558, 0.1128382, 2.148124, 1, 0, 0.7450981, 1,
1.173057, 0.6730657, 1.912309, 1, 0, 0.7372549, 1,
1.176369, 0.0321985, 1.567445, 1, 0, 0.7333333, 1,
1.177903, -1.977876, 2.882428, 1, 0, 0.7254902, 1,
1.180455, 1.917193, -0.4922615, 1, 0, 0.7215686, 1,
1.18283, 1.145265, 1.563789, 1, 0, 0.7137255, 1,
1.185077, -1.221444, 1.026697, 1, 0, 0.7098039, 1,
1.185706, -1.478627, 4.168724, 1, 0, 0.7019608, 1,
1.187916, -0.1355859, 1.791004, 1, 0, 0.6941177, 1,
1.190496, 0.546113, 1.302727, 1, 0, 0.6901961, 1,
1.191467, 0.04403925, 2.249219, 1, 0, 0.682353, 1,
1.199724, 0.8596684, 1.220065, 1, 0, 0.6784314, 1,
1.204676, -0.4670007, 1.169122, 1, 0, 0.6705883, 1,
1.205453, -0.2800956, 0.2165361, 1, 0, 0.6666667, 1,
1.209372, 1.836349, -0.4276325, 1, 0, 0.6588235, 1,
1.22308, 0.368934, 0.8131412, 1, 0, 0.654902, 1,
1.238239, -1.354681, 3.317174, 1, 0, 0.6470588, 1,
1.239149, 0.448917, 0.7702262, 1, 0, 0.6431373, 1,
1.241296, 1.135849, -0.9117473, 1, 0, 0.6352941, 1,
1.252241, 0.4306584, 1.646335, 1, 0, 0.6313726, 1,
1.252774, 1.021598, 1.066789, 1, 0, 0.6235294, 1,
1.253799, 0.5605406, -0.6801795, 1, 0, 0.6196079, 1,
1.25974, 0.3679206, 2.453822, 1, 0, 0.6117647, 1,
1.262258, -0.2437425, 2.536079, 1, 0, 0.6078432, 1,
1.26665, -1.213578, 2.471128, 1, 0, 0.6, 1,
1.26703, -0.9702382, 2.77251, 1, 0, 0.5921569, 1,
1.27575, -0.7345842, 2.599333, 1, 0, 0.5882353, 1,
1.296197, 0.7043238, 1.881178, 1, 0, 0.5803922, 1,
1.303426, 1.077306, 1.690828, 1, 0, 0.5764706, 1,
1.318293, -0.7449026, 0.7827354, 1, 0, 0.5686275, 1,
1.323951, 2.473867, 1.044131, 1, 0, 0.5647059, 1,
1.326286, 0.6727279, 0.360305, 1, 0, 0.5568628, 1,
1.334359, -0.05562197, 1.947778, 1, 0, 0.5529412, 1,
1.338023, 0.1172434, 0.2154276, 1, 0, 0.5450981, 1,
1.339234, 0.9133642, 0.6660036, 1, 0, 0.5411765, 1,
1.340397, -0.4517564, 2.498729, 1, 0, 0.5333334, 1,
1.342252, 1.369525, 1.471865, 1, 0, 0.5294118, 1,
1.344298, 0.4296346, 1.479311, 1, 0, 0.5215687, 1,
1.356247, 0.7213649, 1.49342, 1, 0, 0.5176471, 1,
1.359041, -0.6546274, 3.255003, 1, 0, 0.509804, 1,
1.365369, 1.682216, -0.2902905, 1, 0, 0.5058824, 1,
1.371796, 1.431894, -0.05914345, 1, 0, 0.4980392, 1,
1.380399, 0.5626417, 0.2774857, 1, 0, 0.4901961, 1,
1.388415, 0.5181212, 2.553558, 1, 0, 0.4862745, 1,
1.393623, 0.59, -0.2722622, 1, 0, 0.4784314, 1,
1.397094, -0.6854022, 0.9557692, 1, 0, 0.4745098, 1,
1.399327, 0.3899197, 1.549194, 1, 0, 0.4666667, 1,
1.404174, -0.001251779, 2.384361, 1, 0, 0.4627451, 1,
1.407679, 0.1386321, 0.523645, 1, 0, 0.454902, 1,
1.445739, 1.04579, 2.214029, 1, 0, 0.4509804, 1,
1.462924, 0.2881345, 0.6421827, 1, 0, 0.4431373, 1,
1.465825, 0.3592376, -0.3216203, 1, 0, 0.4392157, 1,
1.484584, 1.058342, 1.112804, 1, 0, 0.4313726, 1,
1.501093, -0.5267926, 2.487829, 1, 0, 0.427451, 1,
1.518607, -1.561877, 2.586562, 1, 0, 0.4196078, 1,
1.527924, 0.1073002, 1.644083, 1, 0, 0.4156863, 1,
1.52829, 0.5090643, 0.6365657, 1, 0, 0.4078431, 1,
1.53719, -0.2150046, 1.928843, 1, 0, 0.4039216, 1,
1.551764, -0.6584291, 4.10872, 1, 0, 0.3960784, 1,
1.556825, 1.89966, 1.052827, 1, 0, 0.3882353, 1,
1.579114, 1.019682, 0.9741962, 1, 0, 0.3843137, 1,
1.582972, -0.2753007, 1.428424, 1, 0, 0.3764706, 1,
1.614955, 0.6069129, 1.462951, 1, 0, 0.372549, 1,
1.620998, -2.30779, 3.982501, 1, 0, 0.3647059, 1,
1.621186, -0.3233456, 2.345186, 1, 0, 0.3607843, 1,
1.622913, -0.6066868, 2.900317, 1, 0, 0.3529412, 1,
1.623887, 1.30278, 1.644049, 1, 0, 0.3490196, 1,
1.671448, -0.7453576, 2.145125, 1, 0, 0.3411765, 1,
1.678272, -1.784474, 2.443615, 1, 0, 0.3372549, 1,
1.680504, -0.9109121, 1.940233, 1, 0, 0.3294118, 1,
1.699665, 1.176553, 1.671291, 1, 0, 0.3254902, 1,
1.705333, -1.547696, 1.465153, 1, 0, 0.3176471, 1,
1.707162, 1.109285, 0.3779328, 1, 0, 0.3137255, 1,
1.707425, 0.3652081, 2.407011, 1, 0, 0.3058824, 1,
1.708422, -0.6232755, 2.493625, 1, 0, 0.2980392, 1,
1.715011, 0.8011904, 0.0310996, 1, 0, 0.2941177, 1,
1.715807, -0.4126597, 0.4582382, 1, 0, 0.2862745, 1,
1.721144, -0.3182257, 3.32505, 1, 0, 0.282353, 1,
1.721686, -1.066489, 2.443417, 1, 0, 0.2745098, 1,
1.734836, -1.628377, 2.824533, 1, 0, 0.2705882, 1,
1.764586, 0.6796783, 0.738507, 1, 0, 0.2627451, 1,
1.772843, -1.178868, 2.689423, 1, 0, 0.2588235, 1,
1.7923, 0.4719582, 1.172598, 1, 0, 0.2509804, 1,
1.799084, -0.5105329, 0.4827377, 1, 0, 0.2470588, 1,
1.830618, -0.6395004, 1.422387, 1, 0, 0.2392157, 1,
1.844869, -1.352517, 3.211172, 1, 0, 0.2352941, 1,
1.845498, -0.05571727, 1.123464, 1, 0, 0.227451, 1,
1.86884, 1.77291, 0.1220217, 1, 0, 0.2235294, 1,
1.868846, -1.389328, 2.132717, 1, 0, 0.2156863, 1,
1.913301, 0.9311209, 3.58266, 1, 0, 0.2117647, 1,
1.918387, 1.180701, 0.2723084, 1, 0, 0.2039216, 1,
1.928346, 0.5756701, 1.910958, 1, 0, 0.1960784, 1,
1.943324, 0.3217773, 1.318484, 1, 0, 0.1921569, 1,
1.945919, 0.01124658, 0.6649706, 1, 0, 0.1843137, 1,
1.968917, -2.375493, 1.650647, 1, 0, 0.1803922, 1,
1.976728, 0.8087904, 1.732823, 1, 0, 0.172549, 1,
1.986075, -1.338245, 2.822977, 1, 0, 0.1686275, 1,
1.986593, 0.7334201, 1.413919, 1, 0, 0.1607843, 1,
2.012133, -0.05793167, 1.903276, 1, 0, 0.1568628, 1,
2.046131, 1.391842, 2.669501, 1, 0, 0.1490196, 1,
2.059203, -0.822881, 2.694275, 1, 0, 0.145098, 1,
2.079563, 0.4918897, 3.216141, 1, 0, 0.1372549, 1,
2.088747, -0.3644662, -0.3459145, 1, 0, 0.1333333, 1,
2.090767, -0.3119541, -0.2399655, 1, 0, 0.1254902, 1,
2.129261, 0.1556275, 0.9255442, 1, 0, 0.1215686, 1,
2.146408, -0.3834934, 2.943755, 1, 0, 0.1137255, 1,
2.181806, 0.7856693, -0.2157246, 1, 0, 0.1098039, 1,
2.222469, -1.286242, 1.2622, 1, 0, 0.1019608, 1,
2.277946, -0.3774029, 2.973823, 1, 0, 0.09411765, 1,
2.282065, -1.193726, 2.568105, 1, 0, 0.09019608, 1,
2.292305, 0.1547935, 1.77596, 1, 0, 0.08235294, 1,
2.320456, 0.6535197, -0.2369427, 1, 0, 0.07843138, 1,
2.346673, 0.6591069, 3.185468, 1, 0, 0.07058824, 1,
2.350918, -0.6843067, 2.818386, 1, 0, 0.06666667, 1,
2.405817, -0.1385442, 2.18804, 1, 0, 0.05882353, 1,
2.487956, 0.9399984, 1.889111, 1, 0, 0.05490196, 1,
2.601576, -0.0002431652, 2.88639, 1, 0, 0.04705882, 1,
2.783932, -0.8169994, -0.7348176, 1, 0, 0.04313726, 1,
2.825022, 0.559002, 1.317845, 1, 0, 0.03529412, 1,
2.93679, 0.3500443, 2.704055, 1, 0, 0.03137255, 1,
2.979871, 0.3518173, 1.867323, 1, 0, 0.02352941, 1,
3.002035, -1.665328, 1.896327, 1, 0, 0.01960784, 1,
3.011967, -0.6447353, 3.23554, 1, 0, 0.01176471, 1,
3.458576, -0.2185712, -0.2832202, 1, 0, 0.007843138, 1
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
0.2034057, -4.308626, -6.89001, 0, -0.5, 0.5, 0.5,
0.2034057, -4.308626, -6.89001, 1, -0.5, 0.5, 0.5,
0.2034057, -4.308626, -6.89001, 1, 1.5, 0.5, 0.5,
0.2034057, -4.308626, -6.89001, 0, 1.5, 0.5, 0.5
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
-4.155268, 0.296051, -6.89001, 0, -0.5, 0.5, 0.5,
-4.155268, 0.296051, -6.89001, 1, -0.5, 0.5, 0.5,
-4.155268, 0.296051, -6.89001, 1, 1.5, 0.5, 0.5,
-4.155268, 0.296051, -6.89001, 0, 1.5, 0.5, 0.5
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
-4.155268, -4.308626, -0.1032765, 0, -0.5, 0.5, 0.5,
-4.155268, -4.308626, -0.1032765, 1, -0.5, 0.5, 0.5,
-4.155268, -4.308626, -0.1032765, 1, 1.5, 0.5, 0.5,
-4.155268, -4.308626, -0.1032765, 0, 1.5, 0.5, 0.5
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
-3, -3.246008, -5.323841,
3, -3.246008, -5.323841,
-3, -3.246008, -5.323841,
-3, -3.423111, -5.584869,
-2, -3.246008, -5.323841,
-2, -3.423111, -5.584869,
-1, -3.246008, -5.323841,
-1, -3.423111, -5.584869,
0, -3.246008, -5.323841,
0, -3.423111, -5.584869,
1, -3.246008, -5.323841,
1, -3.423111, -5.584869,
2, -3.246008, -5.323841,
2, -3.423111, -5.584869,
3, -3.246008, -5.323841,
3, -3.423111, -5.584869
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
-3, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
-3, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
-3, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
-3, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5,
-2, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
-2, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
-2, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
-2, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5,
-1, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
-1, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
-1, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
-1, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5,
0, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
0, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
0, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
0, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5,
1, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
1, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
1, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
1, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5,
2, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
2, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
2, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
2, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5,
3, -3.777317, -6.106925, 0, -0.5, 0.5, 0.5,
3, -3.777317, -6.106925, 1, -0.5, 0.5, 0.5,
3, -3.777317, -6.106925, 1, 1.5, 0.5, 0.5,
3, -3.777317, -6.106925, 0, 1.5, 0.5, 0.5
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
-3.14942, -3, -5.323841,
-3.14942, 3, -5.323841,
-3.14942, -3, -5.323841,
-3.317061, -3, -5.584869,
-3.14942, -2, -5.323841,
-3.317061, -2, -5.584869,
-3.14942, -1, -5.323841,
-3.317061, -1, -5.584869,
-3.14942, 0, -5.323841,
-3.317061, 0, -5.584869,
-3.14942, 1, -5.323841,
-3.317061, 1, -5.584869,
-3.14942, 2, -5.323841,
-3.317061, 2, -5.584869,
-3.14942, 3, -5.323841,
-3.317061, 3, -5.584869
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
-3.652344, -3, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, -3, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, -3, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, -3, -6.106925, 0, 1.5, 0.5, 0.5,
-3.652344, -2, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, -2, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, -2, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, -2, -6.106925, 0, 1.5, 0.5, 0.5,
-3.652344, -1, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, -1, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, -1, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, -1, -6.106925, 0, 1.5, 0.5, 0.5,
-3.652344, 0, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, 0, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, 0, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, 0, -6.106925, 0, 1.5, 0.5, 0.5,
-3.652344, 1, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, 1, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, 1, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, 1, -6.106925, 0, 1.5, 0.5, 0.5,
-3.652344, 2, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, 2, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, 2, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, 2, -6.106925, 0, 1.5, 0.5, 0.5,
-3.652344, 3, -6.106925, 0, -0.5, 0.5, 0.5,
-3.652344, 3, -6.106925, 1, -0.5, 0.5, 0.5,
-3.652344, 3, -6.106925, 1, 1.5, 0.5, 0.5,
-3.652344, 3, -6.106925, 0, 1.5, 0.5, 0.5
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
-3.14942, -3.246008, -4,
-3.14942, -3.246008, 4,
-3.14942, -3.246008, -4,
-3.317061, -3.423111, -4,
-3.14942, -3.246008, -2,
-3.317061, -3.423111, -2,
-3.14942, -3.246008, 0,
-3.317061, -3.423111, 0,
-3.14942, -3.246008, 2,
-3.317061, -3.423111, 2,
-3.14942, -3.246008, 4,
-3.317061, -3.423111, 4
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
-3.652344, -3.777317, -4, 0, -0.5, 0.5, 0.5,
-3.652344, -3.777317, -4, 1, -0.5, 0.5, 0.5,
-3.652344, -3.777317, -4, 1, 1.5, 0.5, 0.5,
-3.652344, -3.777317, -4, 0, 1.5, 0.5, 0.5,
-3.652344, -3.777317, -2, 0, -0.5, 0.5, 0.5,
-3.652344, -3.777317, -2, 1, -0.5, 0.5, 0.5,
-3.652344, -3.777317, -2, 1, 1.5, 0.5, 0.5,
-3.652344, -3.777317, -2, 0, 1.5, 0.5, 0.5,
-3.652344, -3.777317, 0, 0, -0.5, 0.5, 0.5,
-3.652344, -3.777317, 0, 1, -0.5, 0.5, 0.5,
-3.652344, -3.777317, 0, 1, 1.5, 0.5, 0.5,
-3.652344, -3.777317, 0, 0, 1.5, 0.5, 0.5,
-3.652344, -3.777317, 2, 0, -0.5, 0.5, 0.5,
-3.652344, -3.777317, 2, 1, -0.5, 0.5, 0.5,
-3.652344, -3.777317, 2, 1, 1.5, 0.5, 0.5,
-3.652344, -3.777317, 2, 0, 1.5, 0.5, 0.5,
-3.652344, -3.777317, 4, 0, -0.5, 0.5, 0.5,
-3.652344, -3.777317, 4, 1, -0.5, 0.5, 0.5,
-3.652344, -3.777317, 4, 1, 1.5, 0.5, 0.5,
-3.652344, -3.777317, 4, 0, 1.5, 0.5, 0.5
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
-3.14942, -3.246008, -5.323841,
-3.14942, 3.83811, -5.323841,
-3.14942, -3.246008, 5.117288,
-3.14942, 3.83811, 5.117288,
-3.14942, -3.246008, -5.323841,
-3.14942, -3.246008, 5.117288,
-3.14942, 3.83811, -5.323841,
-3.14942, 3.83811, 5.117288,
-3.14942, -3.246008, -5.323841,
3.556231, -3.246008, -5.323841,
-3.14942, -3.246008, 5.117288,
3.556231, -3.246008, 5.117288,
-3.14942, 3.83811, -5.323841,
3.556231, 3.83811, -5.323841,
-3.14942, 3.83811, 5.117288,
3.556231, 3.83811, 5.117288,
3.556231, -3.246008, -5.323841,
3.556231, 3.83811, -5.323841,
3.556231, -3.246008, 5.117288,
3.556231, 3.83811, 5.117288,
3.556231, -3.246008, -5.323841,
3.556231, -3.246008, 5.117288,
3.556231, 3.83811, -5.323841,
3.556231, 3.83811, 5.117288
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
var radius = 7.629901;
var distance = 33.94629;
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
mvMatrix.translate( -0.2034057, -0.296051, 0.1032765 );
mvMatrix.scale( 1.230246, 1.16452, 0.7901061 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94629);
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
tetraethyl_thiodipho<-read.table("tetraethyl_thiodipho.xyz")
```

```
## Error in read.table("tetraethyl_thiodipho.xyz"): no lines available in input
```

```r
x<-tetraethyl_thiodipho$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_thiodipho' not found
```

```r
y<-tetraethyl_thiodipho$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_thiodipho' not found
```

```r
z<-tetraethyl_thiodipho$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetraethyl_thiodipho' not found
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
-3.051765, 0.5873286, -1.920775, 0, 0, 1, 1, 1,
-2.892677, 0.1461616, -0.1782732, 1, 0, 0, 1, 1,
-2.823137, 0.02754037, -2.324828, 1, 0, 0, 1, 1,
-2.719434, 0.3588486, -1.085064, 1, 0, 0, 1, 1,
-2.541604, 0.2016741, -2.560194, 1, 0, 0, 1, 1,
-2.438631, -1.787931, -1.185236, 1, 0, 0, 1, 1,
-2.410157, -0.4967155, -2.974771, 0, 0, 0, 1, 1,
-2.233284, -0.8242123, -2.933457, 0, 0, 0, 1, 1,
-2.211674, 1.273867, -1.025299, 0, 0, 0, 1, 1,
-2.198121, -0.3435951, -3.237605, 0, 0, 0, 1, 1,
-2.192396, 1.20872, -2.023618, 0, 0, 0, 1, 1,
-2.15823, 0.9138355, 0.4393317, 0, 0, 0, 1, 1,
-2.102754, 0.987576, -1.731518, 0, 0, 0, 1, 1,
-2.095912, 1.536261, 0.07503357, 1, 1, 1, 1, 1,
-2.058622, -2.873379, -3.229868, 1, 1, 1, 1, 1,
-2.058622, -1.941523, -2.3533, 1, 1, 1, 1, 1,
-2.053107, 1.288879, -0.02308917, 1, 1, 1, 1, 1,
-2.05099, 0.2343915, 0.6339768, 1, 1, 1, 1, 1,
-2.016308, -0.1038216, 0.06911518, 1, 1, 1, 1, 1,
-2.001817, -0.923171, -2.001135, 1, 1, 1, 1, 1,
-1.97499, -0.4835359, -1.956524, 1, 1, 1, 1, 1,
-1.974306, -0.5700803, -3.65108, 1, 1, 1, 1, 1,
-1.956185, -1.973659, -3.326685, 1, 1, 1, 1, 1,
-1.936298, 0.2226936, -1.995381, 1, 1, 1, 1, 1,
-1.935724, 0.7901881, -0.74339, 1, 1, 1, 1, 1,
-1.846182, 0.4716754, -1.692095, 1, 1, 1, 1, 1,
-1.841864, -1.004209, -1.98424, 1, 1, 1, 1, 1,
-1.823021, 1.145875, 0.03608047, 1, 1, 1, 1, 1,
-1.811552, -0.466152, -2.009279, 0, 0, 1, 1, 1,
-1.78617, 1.645636, -1.392194, 1, 0, 0, 1, 1,
-1.785869, -0.420983, -1.053405, 1, 0, 0, 1, 1,
-1.783289, -0.5104256, -1.275838, 1, 0, 0, 1, 1,
-1.773859, 0.07407777, -1.971625, 1, 0, 0, 1, 1,
-1.746978, -1.937216, -3.631978, 1, 0, 0, 1, 1,
-1.730946, 0.574959, -0.9512073, 0, 0, 0, 1, 1,
-1.721346, -1.284548, -2.445859, 0, 0, 0, 1, 1,
-1.71625, -1.330167, -1.32419, 0, 0, 0, 1, 1,
-1.678514, -1.496998, -2.10303, 0, 0, 0, 1, 1,
-1.656134, -0.2920606, -3.67744, 0, 0, 0, 1, 1,
-1.654948, -0.05028453, -2.044773, 0, 0, 0, 1, 1,
-1.638848, -0.1347113, -3.428773, 0, 0, 0, 1, 1,
-1.638781, -1.47954, -1.309806, 1, 1, 1, 1, 1,
-1.634138, 0.3813676, -0.8068229, 1, 1, 1, 1, 1,
-1.617587, 1.073929, -2.062388, 1, 1, 1, 1, 1,
-1.61746, 0.1955505, -1.355895, 1, 1, 1, 1, 1,
-1.614195, 1.864829, -2.030256, 1, 1, 1, 1, 1,
-1.605416, -0.5979443, -1.284731, 1, 1, 1, 1, 1,
-1.600749, -0.4924077, -2.917319, 1, 1, 1, 1, 1,
-1.600177, 0.06368431, -1.670233, 1, 1, 1, 1, 1,
-1.593587, 1.542365, -1.016272, 1, 1, 1, 1, 1,
-1.570404, -1.082564, -2.572276, 1, 1, 1, 1, 1,
-1.554527, 0.04825335, -0.7344859, 1, 1, 1, 1, 1,
-1.551593, -0.927877, -3.090441, 1, 1, 1, 1, 1,
-1.542106, 0.7087109, -1.972644, 1, 1, 1, 1, 1,
-1.541351, 0.3673115, -0.6352852, 1, 1, 1, 1, 1,
-1.53098, 1.179713, -0.573691, 1, 1, 1, 1, 1,
-1.47475, -0.2539874, -1.02058, 0, 0, 1, 1, 1,
-1.474666, 0.0830664, -1.381557, 1, 0, 0, 1, 1,
-1.463148, -0.6016853, -0.4926251, 1, 0, 0, 1, 1,
-1.444576, 2.694973, -1.18182, 1, 0, 0, 1, 1,
-1.428462, 1.450765, -0.2674625, 1, 0, 0, 1, 1,
-1.419799, -0.3490262, -2.485077, 1, 0, 0, 1, 1,
-1.408445, 1.751475, -0.9606425, 0, 0, 0, 1, 1,
-1.399288, -0.225018, -2.542273, 0, 0, 0, 1, 1,
-1.399071, -0.07265822, -1.648745, 0, 0, 0, 1, 1,
-1.377637, -1.021933, -1.636591, 0, 0, 0, 1, 1,
-1.375562, 0.9389112, -1.652734, 0, 0, 0, 1, 1,
-1.373857, -1.577659, -3.22663, 0, 0, 0, 1, 1,
-1.370329, -1.420537, -2.337786, 0, 0, 0, 1, 1,
-1.349558, 0.6975356, -1.129694, 1, 1, 1, 1, 1,
-1.33595, -1.345245, -2.571651, 1, 1, 1, 1, 1,
-1.329581, 1.329475, -2.389457, 1, 1, 1, 1, 1,
-1.328334, 3.734943, -0.4091817, 1, 1, 1, 1, 1,
-1.320089, -1.462684, -3.403211, 1, 1, 1, 1, 1,
-1.315768, 1.022492, -1.996712, 1, 1, 1, 1, 1,
-1.314575, 0.3685495, 1.29145, 1, 1, 1, 1, 1,
-1.307754, -0.6488982, -1.005576, 1, 1, 1, 1, 1,
-1.305089, -0.416262, -3.780708, 1, 1, 1, 1, 1,
-1.300774, 1.074916, -0.2698894, 1, 1, 1, 1, 1,
-1.292616, 1.022628, -1.224287, 1, 1, 1, 1, 1,
-1.287465, 0.5068974, -0.677768, 1, 1, 1, 1, 1,
-1.270035, 1.154632, -1.416523, 1, 1, 1, 1, 1,
-1.251771, -0.2062669, -1.672355, 1, 1, 1, 1, 1,
-1.248407, 0.6185218, -0.3623161, 1, 1, 1, 1, 1,
-1.246408, -0.6764039, -1.347615, 0, 0, 1, 1, 1,
-1.245986, -0.0580888, -1.756401, 1, 0, 0, 1, 1,
-1.245771, -1.389128, -3.185875, 1, 0, 0, 1, 1,
-1.241259, -0.4692265, -1.9612, 1, 0, 0, 1, 1,
-1.238648, -1.536723, -1.839023, 1, 0, 0, 1, 1,
-1.238222, -0.2757316, -2.931963, 1, 0, 0, 1, 1,
-1.232162, -0.8175655, -0.9264362, 0, 0, 0, 1, 1,
-1.231948, 1.221709, -0.3559194, 0, 0, 0, 1, 1,
-1.231292, -1.604679, -3.669032, 0, 0, 0, 1, 1,
-1.226618, 3.039866, 1.065857, 0, 0, 0, 1, 1,
-1.217221, 0.5338662, -2.121364, 0, 0, 0, 1, 1,
-1.216732, -0.1526108, -1.699157, 0, 0, 0, 1, 1,
-1.215758, 0.1976741, -1.23033, 0, 0, 0, 1, 1,
-1.213676, -0.3286959, -1.529243, 1, 1, 1, 1, 1,
-1.199654, 0.1808504, -0.8228055, 1, 1, 1, 1, 1,
-1.196367, -0.3221307, -2.762764, 1, 1, 1, 1, 1,
-1.189318, 1.179365, 1.229002, 1, 1, 1, 1, 1,
-1.186538, 1.040008, 0.1361664, 1, 1, 1, 1, 1,
-1.178299, 0.6057643, -0.6024941, 1, 1, 1, 1, 1,
-1.17501, -0.1772304, -0.8981492, 1, 1, 1, 1, 1,
-1.17261, 0.5268273, 0.1329826, 1, 1, 1, 1, 1,
-1.156485, 1.559521, -1.658746, 1, 1, 1, 1, 1,
-1.153624, 0.2746136, -0.5762073, 1, 1, 1, 1, 1,
-1.144886, 0.9371868, -0.1388878, 1, 1, 1, 1, 1,
-1.143776, -1.408609, -1.744541, 1, 1, 1, 1, 1,
-1.139538, -1.321339, -1.882032, 1, 1, 1, 1, 1,
-1.134748, 0.6735206, -1.98316, 1, 1, 1, 1, 1,
-1.132507, -0.555287, -2.452807, 1, 1, 1, 1, 1,
-1.124689, -0.3953589, -1.358278, 0, 0, 1, 1, 1,
-1.113148, -0.7853877, -3.040432, 1, 0, 0, 1, 1,
-1.10927, -1.307197, -2.184597, 1, 0, 0, 1, 1,
-1.104902, 0.2914678, -0.1326499, 1, 0, 0, 1, 1,
-1.097107, 0.4414282, -1.318656, 1, 0, 0, 1, 1,
-1.093805, 0.4507834, -0.8903285, 1, 0, 0, 1, 1,
-1.091396, 0.9406106, -0.3595615, 0, 0, 0, 1, 1,
-1.088851, -0.8356157, -1.937678, 0, 0, 0, 1, 1,
-1.082468, -1.604101, -2.683574, 0, 0, 0, 1, 1,
-1.080593, 0.1954293, -0.215937, 0, 0, 0, 1, 1,
-1.077982, 1.70114, -1.504176, 0, 0, 0, 1, 1,
-1.076788, -2.76443, -3.210743, 0, 0, 0, 1, 1,
-1.059557, 1.098069, -0.7858462, 0, 0, 0, 1, 1,
-1.0582, 0.2669961, -0.7845822, 1, 1, 1, 1, 1,
-1.057139, 0.5586574, -0.6020899, 1, 1, 1, 1, 1,
-1.047702, -0.552095, -0.8744727, 1, 1, 1, 1, 1,
-1.047601, -1.039992, -1.365393, 1, 1, 1, 1, 1,
-1.047597, 2.431331, 1.021048, 1, 1, 1, 1, 1,
-1.047187, -0.02294597, 0.2037815, 1, 1, 1, 1, 1,
-1.042466, -0.2623369, -2.464453, 1, 1, 1, 1, 1,
-1.041861, 0.8916826, 1.570742, 1, 1, 1, 1, 1,
-1.040175, -0.7465817, -1.279188, 1, 1, 1, 1, 1,
-1.039023, 0.03599546, -1.57106, 1, 1, 1, 1, 1,
-1.036995, 0.251149, -0.533119, 1, 1, 1, 1, 1,
-1.036158, 1.067619, 1.842464, 1, 1, 1, 1, 1,
-1.035737, -0.4175061, -2.270086, 1, 1, 1, 1, 1,
-1.035362, -0.8390685, -2.09375, 1, 1, 1, 1, 1,
-1.032898, 1.300726, -1.854073, 1, 1, 1, 1, 1,
-1.030954, 0.4549525, -1.756544, 0, 0, 1, 1, 1,
-1.021242, 1.880753, 0.2706857, 1, 0, 0, 1, 1,
-1.02033, -0.7803994, -0.6654121, 1, 0, 0, 1, 1,
-1.019493, -0.5940518, -2.278745, 1, 0, 0, 1, 1,
-1.01846, 1.059579, -0.98821, 1, 0, 0, 1, 1,
-1.016564, 1.223797, -0.840259, 1, 0, 0, 1, 1,
-1.016474, -0.7764464, -4.135615, 0, 0, 0, 1, 1,
-1.002845, 0.5367897, -0.2926643, 0, 0, 0, 1, 1,
-0.9945818, 0.5944475, 0.1269546, 0, 0, 0, 1, 1,
-0.9888084, 1.243811, -0.4461557, 0, 0, 0, 1, 1,
-0.9868749, -0.8821294, -2.739339, 0, 0, 0, 1, 1,
-0.9868283, -1.748792, -3.092602, 0, 0, 0, 1, 1,
-0.9858372, -1.778433, -2.093865, 0, 0, 0, 1, 1,
-0.978727, -0.7737752, -3.776969, 1, 1, 1, 1, 1,
-0.9736853, 2.116498, -0.7581188, 1, 1, 1, 1, 1,
-0.9647089, -0.05243436, -2.118888, 1, 1, 1, 1, 1,
-0.9599823, -0.1274207, -3.32416, 1, 1, 1, 1, 1,
-0.9567661, -0.3826095, -1.158633, 1, 1, 1, 1, 1,
-0.9510575, 0.7878918, -2.697342, 1, 1, 1, 1, 1,
-0.9447663, 0.08965745, -1.955752, 1, 1, 1, 1, 1,
-0.9347951, 1.26762, -1.060613, 1, 1, 1, 1, 1,
-0.9292836, 0.7585524, 0.0502934, 1, 1, 1, 1, 1,
-0.9242162, 0.5843791, -1.891166, 1, 1, 1, 1, 1,
-0.9224964, 0.2945358, -2.205986, 1, 1, 1, 1, 1,
-0.9219068, 0.1575542, -1.105116, 1, 1, 1, 1, 1,
-0.9209608, 0.1216267, -0.165132, 1, 1, 1, 1, 1,
-0.9206823, 0.5840119, -1.660685, 1, 1, 1, 1, 1,
-0.9191667, -0.2172923, -0.8845671, 1, 1, 1, 1, 1,
-0.9144812, 1.849851, -0.1499371, 0, 0, 1, 1, 1,
-0.9144701, -0.9659386, -2.916296, 1, 0, 0, 1, 1,
-0.9142147, -0.654193, -3.342651, 1, 0, 0, 1, 1,
-0.90558, 0.01052798, -1.016136, 1, 0, 0, 1, 1,
-0.902719, 1.110054, -0.1505961, 1, 0, 0, 1, 1,
-0.9009498, 1.256059, -0.5472752, 1, 0, 0, 1, 1,
-0.8982516, -1.061745, -2.398209, 0, 0, 0, 1, 1,
-0.8934597, -1.024158, -2.142449, 0, 0, 0, 1, 1,
-0.8905284, 0.9223849, -1.844658, 0, 0, 0, 1, 1,
-0.8834256, 0.1600266, -1.161397, 0, 0, 0, 1, 1,
-0.8817552, 0.4964375, -0.4010932, 0, 0, 0, 1, 1,
-0.8765299, 0.4633566, -1.179805, 0, 0, 0, 1, 1,
-0.8733873, -2.77961, -3.481262, 0, 0, 0, 1, 1,
-0.8590875, 1.369292, -1.220843, 1, 1, 1, 1, 1,
-0.8584858, -0.6410109, -0.3642125, 1, 1, 1, 1, 1,
-0.8582555, -1.621585, -3.524979, 1, 1, 1, 1, 1,
-0.8567187, -1.613244, -2.685215, 1, 1, 1, 1, 1,
-0.8563668, -0.745416, -3.866526, 1, 1, 1, 1, 1,
-0.8550123, -0.8363183, -1.906973, 1, 1, 1, 1, 1,
-0.8518878, -1.209205, -2.847351, 1, 1, 1, 1, 1,
-0.8494074, 0.9175598, 0.3784932, 1, 1, 1, 1, 1,
-0.837019, -0.02522096, -1.476073, 1, 1, 1, 1, 1,
-0.8326994, -2.230364, -1.889863, 1, 1, 1, 1, 1,
-0.8322879, -0.5477611, -3.252888, 1, 1, 1, 1, 1,
-0.8249667, -0.1985213, -2.691938, 1, 1, 1, 1, 1,
-0.8249135, 1.426066, -1.040768, 1, 1, 1, 1, 1,
-0.8207442, 0.599847, -0.8820918, 1, 1, 1, 1, 1,
-0.817541, 1.093118, -2.36334, 1, 1, 1, 1, 1,
-0.8101857, -0.3568775, -0.8560012, 0, 0, 1, 1, 1,
-0.809831, 0.5020709, -1.329005, 1, 0, 0, 1, 1,
-0.8092628, 1.312009, 0.0184176, 1, 0, 0, 1, 1,
-0.8081265, 0.05437903, -3.099598, 1, 0, 0, 1, 1,
-0.8059396, -0.7353877, -2.391493, 1, 0, 0, 1, 1,
-0.8012101, 1.112514, -0.01832967, 1, 0, 0, 1, 1,
-0.8001294, 1.451193, -1.616686, 0, 0, 0, 1, 1,
-0.7995827, 2.397282, -1.846013, 0, 0, 0, 1, 1,
-0.7995605, -0.6915009, -3.918905, 0, 0, 0, 1, 1,
-0.7913409, 2.784201, 0.7866682, 0, 0, 0, 1, 1,
-0.7888449, -0.2227432, -1.760677, 0, 0, 0, 1, 1,
-0.7860734, 1.71791, 0.05774632, 0, 0, 0, 1, 1,
-0.7858083, 0.5871504, -1.812095, 0, 0, 0, 1, 1,
-0.7849114, -0.4897632, -0.8356342, 1, 1, 1, 1, 1,
-0.7828022, 1.63233, -1.671986, 1, 1, 1, 1, 1,
-0.781653, -0.06098849, -0.9232623, 1, 1, 1, 1, 1,
-0.7807047, 0.4065739, -1.542465, 1, 1, 1, 1, 1,
-0.7793817, 0.8939987, 1.600547, 1, 1, 1, 1, 1,
-0.7626482, 1.788058, 0.5131614, 1, 1, 1, 1, 1,
-0.7618319, 0.5652559, -0.3291558, 1, 1, 1, 1, 1,
-0.7614034, -0.5680104, -0.4373879, 1, 1, 1, 1, 1,
-0.7552254, -0.6178257, -4.137727, 1, 1, 1, 1, 1,
-0.7525865, -1.483973, -2.307356, 1, 1, 1, 1, 1,
-0.7512227, 0.1990003, 0.1263677, 1, 1, 1, 1, 1,
-0.7503046, -0.02133458, -2.311693, 1, 1, 1, 1, 1,
-0.7475175, 0.2623376, -1.032568, 1, 1, 1, 1, 1,
-0.7430406, 1.063549, 2.768202, 1, 1, 1, 1, 1,
-0.7428308, -0.1834713, -0.09926389, 1, 1, 1, 1, 1,
-0.7395669, 0.602734, -1.098027, 0, 0, 1, 1, 1,
-0.7335156, 0.4555956, -1.38954, 1, 0, 0, 1, 1,
-0.7326558, -1.394149, -2.089648, 1, 0, 0, 1, 1,
-0.7293197, -0.6373668, -2.189371, 1, 0, 0, 1, 1,
-0.7272866, 0.04911043, -0.6939638, 1, 0, 0, 1, 1,
-0.7268762, 0.04480124, -0.5633048, 1, 0, 0, 1, 1,
-0.7247235, 0.9646208, 1.510587, 0, 0, 0, 1, 1,
-0.7226757, -0.4287514, -1.174109, 0, 0, 0, 1, 1,
-0.717242, -1.127457, -3.583906, 0, 0, 0, 1, 1,
-0.716308, -0.5125273, -1.831854, 0, 0, 0, 1, 1,
-0.7085747, 0.5350519, -0.580787, 0, 0, 0, 1, 1,
-0.7081522, -0.8629204, -2.208274, 0, 0, 0, 1, 1,
-0.7034298, 0.6579449, 0.3776163, 0, 0, 0, 1, 1,
-0.7000701, -0.5811148, -2.049879, 1, 1, 1, 1, 1,
-0.6989343, -1.017482, -1.623036, 1, 1, 1, 1, 1,
-0.6952979, 2.198797, -0.3442777, 1, 1, 1, 1, 1,
-0.6906253, -0.2273849, -2.040956, 1, 1, 1, 1, 1,
-0.6902931, -0.4956821, -2.133511, 1, 1, 1, 1, 1,
-0.6896181, 0.6704189, 0.3024534, 1, 1, 1, 1, 1,
-0.686669, 0.5124022, -0.2753644, 1, 1, 1, 1, 1,
-0.6859468, -0.02210597, -1.080924, 1, 1, 1, 1, 1,
-0.6855692, -2.174413, -3.96907, 1, 1, 1, 1, 1,
-0.6852176, 0.8761651, -1.232295, 1, 1, 1, 1, 1,
-0.6806498, -0.4154206, -4.59961, 1, 1, 1, 1, 1,
-0.6752775, 0.4686338, -0.9412048, 1, 1, 1, 1, 1,
-0.6727651, 0.597823, -1.177561, 1, 1, 1, 1, 1,
-0.6717129, -0.811763, -2.927769, 1, 1, 1, 1, 1,
-0.6697897, -0.2665882, -1.473306, 1, 1, 1, 1, 1,
-0.6678265, 1.77107, 0.1165338, 0, 0, 1, 1, 1,
-0.6602513, 1.785726, 0.01837618, 1, 0, 0, 1, 1,
-0.6581942, -1.754359, -2.11802, 1, 0, 0, 1, 1,
-0.654104, -0.3071966, -1.341577, 1, 0, 0, 1, 1,
-0.6483644, 1.567807, -1.972307, 1, 0, 0, 1, 1,
-0.6483217, 1.545982, -2.439087, 1, 0, 0, 1, 1,
-0.6450579, -0.3469824, -1.564739, 0, 0, 0, 1, 1,
-0.6409765, 1.03465, 0.3420251, 0, 0, 0, 1, 1,
-0.6394718, -0.5776544, -0.9170605, 0, 0, 0, 1, 1,
-0.639146, -1.433365, -1.48043, 0, 0, 0, 1, 1,
-0.6373525, 0.5796821, -0.8000497, 0, 0, 0, 1, 1,
-0.6348662, -0.5994977, -2.821776, 0, 0, 0, 1, 1,
-0.6314122, -1.986401, -0.9764962, 0, 0, 0, 1, 1,
-0.6313511, 0.1073012, -1.455273, 1, 1, 1, 1, 1,
-0.6167519, 2.075402, -0.1491524, 1, 1, 1, 1, 1,
-0.6148731, -1.921034, -1.701693, 1, 1, 1, 1, 1,
-0.6122689, -0.0006145592, -0.8372995, 1, 1, 1, 1, 1,
-0.6100119, -1.72843, -3.603259, 1, 1, 1, 1, 1,
-0.6003277, 0.2135025, -1.997659, 1, 1, 1, 1, 1,
-0.5953072, -0.2430713, -0.8144397, 1, 1, 1, 1, 1,
-0.5906779, 0.8144208, -0.06185572, 1, 1, 1, 1, 1,
-0.5892504, -2.04249, -3.608195, 1, 1, 1, 1, 1,
-0.5849429, -0.7590536, -2.175396, 1, 1, 1, 1, 1,
-0.5826552, -0.557864, -0.555515, 1, 1, 1, 1, 1,
-0.5716169, -0.8234049, -3.535105, 1, 1, 1, 1, 1,
-0.571246, 0.07633823, -3.933477, 1, 1, 1, 1, 1,
-0.5690982, 0.1485124, 0.09691513, 1, 1, 1, 1, 1,
-0.5688553, 0.2995778, 0.02671841, 1, 1, 1, 1, 1,
-0.5680159, 0.0792016, -1.242567, 0, 0, 1, 1, 1,
-0.5589784, -0.1856176, -1.805542, 1, 0, 0, 1, 1,
-0.5578928, 1.396139, 0.1359526, 1, 0, 0, 1, 1,
-0.5576194, 0.3294409, -1.795468, 1, 0, 0, 1, 1,
-0.5573544, 0.5085645, -1.018946, 1, 0, 0, 1, 1,
-0.5467311, -3.142841, -4.277191, 1, 0, 0, 1, 1,
-0.5457189, 0.1530921, -3.288947, 0, 0, 0, 1, 1,
-0.5454143, -1.336005, -1.343069, 0, 0, 0, 1, 1,
-0.5449594, -2.476843, -3.582999, 0, 0, 0, 1, 1,
-0.5375012, 0.9275466, -0.8129615, 0, 0, 0, 1, 1,
-0.5372336, -1.150627, -1.639404, 0, 0, 0, 1, 1,
-0.5328365, -1.109781, -2.607552, 0, 0, 0, 1, 1,
-0.5284228, 0.3014374, -3.015025, 0, 0, 0, 1, 1,
-0.5216603, 1.147511, -1.406371, 1, 1, 1, 1, 1,
-0.5183575, -0.8044047, -2.901427, 1, 1, 1, 1, 1,
-0.5170785, -0.1638521, -0.05331651, 1, 1, 1, 1, 1,
-0.5160521, 1.113832, -0.8513882, 1, 1, 1, 1, 1,
-0.5107293, -0.2339793, -3.217892, 1, 1, 1, 1, 1,
-0.508877, -0.8267807, -2.80185, 1, 1, 1, 1, 1,
-0.5048387, -1.139113, -1.917246, 1, 1, 1, 1, 1,
-0.5013065, 0.04156689, -2.61183, 1, 1, 1, 1, 1,
-0.497083, -1.137322, -3.461417, 1, 1, 1, 1, 1,
-0.4959701, -0.3384094, -0.6419566, 1, 1, 1, 1, 1,
-0.4950497, -0.3577758, -1.682426, 1, 1, 1, 1, 1,
-0.4947248, -0.7967122, -3.772807, 1, 1, 1, 1, 1,
-0.4938366, -2.196326, -3.263518, 1, 1, 1, 1, 1,
-0.4928487, -0.742151, -4.099703, 1, 1, 1, 1, 1,
-0.4925286, -0.5582122, -1.780477, 1, 1, 1, 1, 1,
-0.4913177, 0.6535662, 0.71, 0, 0, 1, 1, 1,
-0.4884312, 0.7242062, -1.60736, 1, 0, 0, 1, 1,
-0.4873228, -0.630505, 0.0359904, 1, 0, 0, 1, 1,
-0.4872386, -1.502356, -1.954334, 1, 0, 0, 1, 1,
-0.472898, 0.7605489, -0.972703, 1, 0, 0, 1, 1,
-0.4724371, 0.7593353, 0.2479085, 1, 0, 0, 1, 1,
-0.4718699, -0.5007928, -2.682665, 0, 0, 0, 1, 1,
-0.4700791, 0.1612234, -1.979992, 0, 0, 0, 1, 1,
-0.4543111, -1.44022, -3.612287, 0, 0, 0, 1, 1,
-0.45162, -1.369191, -3.51402, 0, 0, 0, 1, 1,
-0.450711, 0.4164039, -1.459333, 0, 0, 0, 1, 1,
-0.4482969, -0.09678361, -1.89338, 0, 0, 0, 1, 1,
-0.4338145, 0.2568176, -1.240144, 0, 0, 0, 1, 1,
-0.4306379, 0.5854065, -1.860561, 1, 1, 1, 1, 1,
-0.4286396, 0.7631099, 0.5803465, 1, 1, 1, 1, 1,
-0.4276318, -0.06201118, -4.871545, 1, 1, 1, 1, 1,
-0.4258779, -0.983987, -0.892083, 1, 1, 1, 1, 1,
-0.4234902, 0.3089478, -1.209177, 1, 1, 1, 1, 1,
-0.4233205, -1.705181, -2.007514, 1, 1, 1, 1, 1,
-0.4214799, -0.707019, -2.827149, 1, 1, 1, 1, 1,
-0.4163084, 1.313488, -0.4985635, 1, 1, 1, 1, 1,
-0.4154778, 1.663055, 0.7093365, 1, 1, 1, 1, 1,
-0.4120933, -2.054053, -3.907024, 1, 1, 1, 1, 1,
-0.4108018, -1.083399, -1.987394, 1, 1, 1, 1, 1,
-0.4086101, -0.8233599, -3.470322, 1, 1, 1, 1, 1,
-0.4078453, -0.8937832, -1.830172, 1, 1, 1, 1, 1,
-0.4071793, -1.37042, -4.762757, 1, 1, 1, 1, 1,
-0.405908, -1.321174, -3.02516, 1, 1, 1, 1, 1,
-0.4052167, -0.4805803, -3.321565, 0, 0, 1, 1, 1,
-0.4014449, 0.6595018, -0.07277928, 1, 0, 0, 1, 1,
-0.3981423, -0.2021496, -2.516289, 1, 0, 0, 1, 1,
-0.3975805, -0.2738688, -2.413838, 1, 0, 0, 1, 1,
-0.3974396, -1.055432, -2.303515, 1, 0, 0, 1, 1,
-0.3961232, -0.8545851, -2.118817, 1, 0, 0, 1, 1,
-0.3919837, 0.7680287, -2.256847, 0, 0, 0, 1, 1,
-0.386121, -1.153598, -2.307142, 0, 0, 0, 1, 1,
-0.3757162, -0.4903544, -2.382039, 0, 0, 0, 1, 1,
-0.3726513, -1.538864, -1.847509, 0, 0, 0, 1, 1,
-0.3711902, 1.535792, -0.9756182, 0, 0, 0, 1, 1,
-0.3675143, 0.7790439, -0.02542452, 0, 0, 0, 1, 1,
-0.364934, -0.1489892, -1.300442, 0, 0, 0, 1, 1,
-0.3597017, 1.570634, -0.3639327, 1, 1, 1, 1, 1,
-0.3580487, 0.4036707, -1.344466, 1, 1, 1, 1, 1,
-0.3573367, 0.08225749, -2.847923, 1, 1, 1, 1, 1,
-0.3548836, 0.7083356, -0.2974526, 1, 1, 1, 1, 1,
-0.3547034, 0.04212709, -0.003706501, 1, 1, 1, 1, 1,
-0.3533401, 1.174794, -1.200649, 1, 1, 1, 1, 1,
-0.3458879, 0.8334792, -1.806552, 1, 1, 1, 1, 1,
-0.3448468, -1.434139, -2.566328, 1, 1, 1, 1, 1,
-0.3438373, 0.5156584, 0.3022937, 1, 1, 1, 1, 1,
-0.3416545, 0.8309484, -0.6920917, 1, 1, 1, 1, 1,
-0.3321536, -0.7730924, -2.82909, 1, 1, 1, 1, 1,
-0.3315614, 0.563548, -0.9594163, 1, 1, 1, 1, 1,
-0.3297479, -0.6285524, -3.169405, 1, 1, 1, 1, 1,
-0.3274953, -1.274413, -3.151722, 1, 1, 1, 1, 1,
-0.3272291, -2.485141, -1.98967, 1, 1, 1, 1, 1,
-0.3228711, -0.4252768, -3.721334, 0, 0, 1, 1, 1,
-0.3215035, -1.692138, 0.00166769, 1, 0, 0, 1, 1,
-0.3163205, -0.5913723, -1.685575, 1, 0, 0, 1, 1,
-0.3117374, -0.7005385, -4.899809, 1, 0, 0, 1, 1,
-0.2986947, -1.028128, -2.751779, 1, 0, 0, 1, 1,
-0.2935366, -0.4793817, -2.897662, 1, 0, 0, 1, 1,
-0.2929929, -1.420745, -3.802117, 0, 0, 0, 1, 1,
-0.2910461, -1.014466, -4.072453, 0, 0, 0, 1, 1,
-0.2867635, 1.409429, -1.87883, 0, 0, 0, 1, 1,
-0.2861654, 1.156206, -1.314813, 0, 0, 0, 1, 1,
-0.2858604, 0.68661, 0.5443944, 0, 0, 0, 1, 1,
-0.2832307, -0.2318019, -1.787475, 0, 0, 0, 1, 1,
-0.2821327, 1.070987, 0.7094291, 0, 0, 0, 1, 1,
-0.2815104, 0.3560024, 1.405516, 1, 1, 1, 1, 1,
-0.2812274, 0.3799919, -1.078368, 1, 1, 1, 1, 1,
-0.2793863, -2.217845, -5.171785, 1, 1, 1, 1, 1,
-0.2791663, -1.409307, -2.922395, 1, 1, 1, 1, 1,
-0.2779173, 0.2675742, -1.307311, 1, 1, 1, 1, 1,
-0.2753025, 0.790745, -0.146854, 1, 1, 1, 1, 1,
-0.2678105, 1.451247, 1.540426, 1, 1, 1, 1, 1,
-0.2677986, 1.554536, -1.134165, 1, 1, 1, 1, 1,
-0.2649039, 2.043925, 0.1239599, 1, 1, 1, 1, 1,
-0.2604754, -0.1102, -1.483731, 1, 1, 1, 1, 1,
-0.2571887, 0.3333053, -0.3026685, 1, 1, 1, 1, 1,
-0.2566188, 0.2157296, -2.484054, 1, 1, 1, 1, 1,
-0.256433, -0.5461435, -2.061026, 1, 1, 1, 1, 1,
-0.2382725, 0.4665911, -1.473157, 1, 1, 1, 1, 1,
-0.2376776, -0.4263159, -2.515594, 1, 1, 1, 1, 1,
-0.2376584, 0.1220257, -0.6282824, 0, 0, 1, 1, 1,
-0.2369175, -1.240896, -0.8809326, 1, 0, 0, 1, 1,
-0.2356049, -0.6609461, -3.981826, 1, 0, 0, 1, 1,
-0.2355814, 1.355105, 0.5912161, 1, 0, 0, 1, 1,
-0.2300681, -1.501011, -1.119157, 1, 0, 0, 1, 1,
-0.2251648, -0.8886185, -2.269257, 1, 0, 0, 1, 1,
-0.2247753, -1.944441, -3.030666, 0, 0, 0, 1, 1,
-0.2246502, -0.3829987, -2.502011, 0, 0, 0, 1, 1,
-0.2240474, 0.5060115, -1.96049, 0, 0, 0, 1, 1,
-0.2234909, 1.7231, -0.9389575, 0, 0, 0, 1, 1,
-0.2130439, -0.2849509, -2.315324, 0, 0, 0, 1, 1,
-0.2100545, -0.7322334, -1.972037, 0, 0, 0, 1, 1,
-0.2081229, -0.07245527, -2.179943, 0, 0, 0, 1, 1,
-0.2072639, 0.2867892, -1.445472, 1, 1, 1, 1, 1,
-0.2060941, 1.121114, -0.8696525, 1, 1, 1, 1, 1,
-0.2052814, -0.5561017, -1.676027, 1, 1, 1, 1, 1,
-0.2003923, -0.2512106, -3.00197, 1, 1, 1, 1, 1,
-0.2002994, 0.6194377, 0.6311518, 1, 1, 1, 1, 1,
-0.1997452, 0.1742042, -1.519764, 1, 1, 1, 1, 1,
-0.1949797, -1.032933, -4.718425, 1, 1, 1, 1, 1,
-0.1932989, 0.04082312, -0.923732, 1, 1, 1, 1, 1,
-0.1929823, -1.800201, -3.902635, 1, 1, 1, 1, 1,
-0.1918533, -0.8410907, -1.798069, 1, 1, 1, 1, 1,
-0.1909545, -0.5335925, -2.276968, 1, 1, 1, 1, 1,
-0.1875389, 0.9137335, -0.9248908, 1, 1, 1, 1, 1,
-0.1790012, 2.185531, -3.104928, 1, 1, 1, 1, 1,
-0.1782192, 0.9297841, 1.449682, 1, 1, 1, 1, 1,
-0.1769384, -0.413503, -0.4528024, 1, 1, 1, 1, 1,
-0.1762234, -0.8627549, -4.276195, 0, 0, 1, 1, 1,
-0.1762204, -0.07720543, -3.098547, 1, 0, 0, 1, 1,
-0.1760745, 0.173972, -1.176659, 1, 0, 0, 1, 1,
-0.1738394, 1.3636, 0.9633223, 1, 0, 0, 1, 1,
-0.1689993, 0.1891678, -0.532435, 1, 0, 0, 1, 1,
-0.1654755, -0.4395483, -2.487996, 1, 0, 0, 1, 1,
-0.1649016, -1.535199, -2.224449, 0, 0, 0, 1, 1,
-0.1624677, 0.6425514, -0.4068044, 0, 0, 0, 1, 1,
-0.1621026, 1.050376, -0.09311047, 0, 0, 0, 1, 1,
-0.1561328, 1.272057, 1.06893, 0, 0, 0, 1, 1,
-0.1554299, -1.235447, -2.06993, 0, 0, 0, 1, 1,
-0.1523498, 1.513993, 0.4126697, 0, 0, 0, 1, 1,
-0.1522285, -0.9992972, -3.947701, 0, 0, 0, 1, 1,
-0.1516109, 1.550283, 0.8857564, 1, 1, 1, 1, 1,
-0.149954, 0.3307166, -0.4279387, 1, 1, 1, 1, 1,
-0.1489764, -0.847718, -2.051084, 1, 1, 1, 1, 1,
-0.142057, -1.001299, -1.948199, 1, 1, 1, 1, 1,
-0.1392055, 1.413333, 0.5688298, 1, 1, 1, 1, 1,
-0.1364094, 2.315102, -1.585416, 1, 1, 1, 1, 1,
-0.1287448, -1.12872, -3.415016, 1, 1, 1, 1, 1,
-0.1272109, -0.2368888, -1.78522, 1, 1, 1, 1, 1,
-0.1154543, -2.00371, -2.337872, 1, 1, 1, 1, 1,
-0.1111338, -0.8374216, -2.8421, 1, 1, 1, 1, 1,
-0.1039898, 1.199086, -1.5122, 1, 1, 1, 1, 1,
-0.09969295, 0.7165226, -1.835481, 1, 1, 1, 1, 1,
-0.09838352, -0.1563467, -2.573984, 1, 1, 1, 1, 1,
-0.09666482, -0.5891399, -1.463998, 1, 1, 1, 1, 1,
-0.09505646, 0.3000532, -2.65148, 1, 1, 1, 1, 1,
-0.09495348, -0.1281487, -2.380039, 0, 0, 1, 1, 1,
-0.09372512, -0.4720204, -1.225166, 1, 0, 0, 1, 1,
-0.09229866, 0.02988198, -1.7246, 1, 0, 0, 1, 1,
-0.09096253, 1.031323, 1.181102, 1, 0, 0, 1, 1,
-0.08950955, -0.2425446, -2.305454, 1, 0, 0, 1, 1,
-0.0893278, -0.9029875, -4.178021, 1, 0, 0, 1, 1,
-0.07951886, -0.7506071, -1.704146, 0, 0, 0, 1, 1,
-0.07931041, -1.271927, -3.241051, 0, 0, 0, 1, 1,
-0.07705485, -1.408292, -0.9905437, 0, 0, 0, 1, 1,
-0.07089843, 0.2661943, 0.5199718, 0, 0, 0, 1, 1,
-0.07058387, -0.9191017, -3.840369, 0, 0, 0, 1, 1,
-0.06945419, 1.379834, 0.2230846, 0, 0, 0, 1, 1,
-0.06718467, 1.331558, -0.7552593, 0, 0, 0, 1, 1,
-0.06641816, 0.6522853, -0.2633359, 1, 1, 1, 1, 1,
-0.06530256, -0.8808571, -2.028725, 1, 1, 1, 1, 1,
-0.06451212, 1.057273, -0.08500069, 1, 1, 1, 1, 1,
-0.05698404, 1.160718, 0.8222944, 1, 1, 1, 1, 1,
-0.05553357, -0.4072561, -3.719822, 1, 1, 1, 1, 1,
-0.05058665, -0.1591437, -2.504592, 1, 1, 1, 1, 1,
-0.04989292, -0.5158331, -3.789694, 1, 1, 1, 1, 1,
-0.04611121, 1.279862, -0.5118371, 1, 1, 1, 1, 1,
-0.04247653, 0.1286388, 0.04662282, 1, 1, 1, 1, 1,
-0.03922877, 0.4225601, 0.7705759, 1, 1, 1, 1, 1,
-0.03619186, -1.26733, -3.308295, 1, 1, 1, 1, 1,
-0.03611797, 0.5145804, -1.073576, 1, 1, 1, 1, 1,
-0.03466575, -1.173796, -2.585256, 1, 1, 1, 1, 1,
-0.03339085, 2.074518, -0.5224904, 1, 1, 1, 1, 1,
-0.02944788, 1.564743, 0.1680155, 1, 1, 1, 1, 1,
-0.02905663, 0.03208119, -1.643866, 0, 0, 1, 1, 1,
-0.02706505, 1.561271, 0.0225668, 1, 0, 0, 1, 1,
-0.02342899, -0.2747272, -3.766636, 1, 0, 0, 1, 1,
-0.02315231, -0.4455034, -3.120831, 1, 0, 0, 1, 1,
-0.02233041, 1.20928, -0.06875186, 1, 0, 0, 1, 1,
-0.01675742, 1.372094, 0.6965593, 1, 0, 0, 1, 1,
-0.0165613, 1.758264, -0.474396, 0, 0, 0, 1, 1,
-0.0121004, -1.095312, -3.658607, 0, 0, 0, 1, 1,
-0.008412517, -0.8341444, -1.865043, 0, 0, 0, 1, 1,
-0.007134099, -0.6468109, -3.007781, 0, 0, 0, 1, 1,
-0.005152366, -0.177355, -1.893811, 0, 0, 0, 1, 1,
-0.004756168, -1.217635, -4.497101, 0, 0, 0, 1, 1,
-0.004285329, 1.559887, 1.490396, 0, 0, 0, 1, 1,
-0.003181895, -0.7583705, -3.795799, 1, 1, 1, 1, 1,
-0.002304328, 0.3045513, -0.3986118, 1, 1, 1, 1, 1,
-0.001217078, 0.9228217, 1.050579, 1, 1, 1, 1, 1,
0.003805025, 0.6078562, 0.3809845, 1, 1, 1, 1, 1,
0.004535855, -0.9504049, 3.322292, 1, 1, 1, 1, 1,
0.006304698, 1.183748, -0.3993269, 1, 1, 1, 1, 1,
0.01310028, -0.8067775, 3.22876, 1, 1, 1, 1, 1,
0.01665569, -0.7595421, 1.87237, 1, 1, 1, 1, 1,
0.02132951, -0.01295621, 2.487747, 1, 1, 1, 1, 1,
0.02523272, -0.08058838, 3.194979, 1, 1, 1, 1, 1,
0.02565162, -0.2245055, 3.790963, 1, 1, 1, 1, 1,
0.02640598, 0.7056836, 0.9016981, 1, 1, 1, 1, 1,
0.02780204, -0.9174036, 2.169735, 1, 1, 1, 1, 1,
0.03077615, 0.9876394, -0.6583316, 1, 1, 1, 1, 1,
0.03090315, -0.6699033, 4.359022, 1, 1, 1, 1, 1,
0.03264862, 0.780889, 1.045647, 0, 0, 1, 1, 1,
0.03497514, 0.5697528, 0.3027621, 1, 0, 0, 1, 1,
0.03985337, 0.07482092, 0.08064887, 1, 0, 0, 1, 1,
0.04273434, -1.027189, 2.02591, 1, 0, 0, 1, 1,
0.04324406, 1.260941, -0.2711754, 1, 0, 0, 1, 1,
0.04378932, -1.033034, 2.656549, 1, 0, 0, 1, 1,
0.04517897, 0.1600758, -0.966749, 0, 0, 0, 1, 1,
0.04808446, -0.3023795, 4.347009, 0, 0, 0, 1, 1,
0.04933122, 2.230556, 0.3091772, 0, 0, 0, 1, 1,
0.05088079, -1.326163, 3.226663, 0, 0, 0, 1, 1,
0.05827887, 0.5157621, 1.155706, 0, 0, 0, 1, 1,
0.06028192, -0.7011226, 2.981557, 0, 0, 0, 1, 1,
0.06104686, -0.8728899, 2.521677, 0, 0, 0, 1, 1,
0.06244479, -0.0618287, 3.037513, 1, 1, 1, 1, 1,
0.06264036, -0.71087, 3.285853, 1, 1, 1, 1, 1,
0.07927667, 0.3907366, 0.3492331, 1, 1, 1, 1, 1,
0.08571145, 0.612573, 0.3629741, 1, 1, 1, 1, 1,
0.08671678, -0.05134239, 2.315258, 1, 1, 1, 1, 1,
0.08872314, -0.9142987, 2.510412, 1, 1, 1, 1, 1,
0.08904141, -0.5615675, 3.548531, 1, 1, 1, 1, 1,
0.0916135, -0.6385766, 2.729686, 1, 1, 1, 1, 1,
0.0936571, -1.020249, 3.783272, 1, 1, 1, 1, 1,
0.09861942, -1.725205, 4.33502, 1, 1, 1, 1, 1,
0.1018109, -2.410564, 2.55001, 1, 1, 1, 1, 1,
0.1026697, -0.0104424, 2.431031, 1, 1, 1, 1, 1,
0.1044615, -0.5985203, 2.638217, 1, 1, 1, 1, 1,
0.1052807, -2.126698, 1.709491, 1, 1, 1, 1, 1,
0.1059611, -1.496394, 2.61329, 1, 1, 1, 1, 1,
0.1107373, -0.4463321, 3.228338, 0, 0, 1, 1, 1,
0.111673, -1.107258, 3.763222, 1, 0, 0, 1, 1,
0.1155861, 0.6624803, -1.046399, 1, 0, 0, 1, 1,
0.1176545, -0.9856436, 3.122882, 1, 0, 0, 1, 1,
0.1199096, 0.08791537, 1.627764, 1, 0, 0, 1, 1,
0.1213013, -1.046443, 3.009788, 1, 0, 0, 1, 1,
0.1213041, -0.4440659, 4.64289, 0, 0, 0, 1, 1,
0.122215, -1.260965, 1.951696, 0, 0, 0, 1, 1,
0.1229952, -0.1672045, 2.245887, 0, 0, 0, 1, 1,
0.1262494, 1.248936, 0.1357272, 0, 0, 0, 1, 1,
0.1323273, 0.1414828, 0.3529479, 0, 0, 0, 1, 1,
0.1327495, -0.6126218, 3.810937, 0, 0, 0, 1, 1,
0.1348926, 0.7483634, -1.117882, 0, 0, 0, 1, 1,
0.1415828, -1.840713, 3.804619, 1, 1, 1, 1, 1,
0.1415843, 0.8825854, -0.2812322, 1, 1, 1, 1, 1,
0.1480553, -0.7332364, 2.077353, 1, 1, 1, 1, 1,
0.1552566, 0.2378526, 0.1731581, 1, 1, 1, 1, 1,
0.1575145, -0.7251008, 1.826369, 1, 1, 1, 1, 1,
0.1583985, -0.9146261, 2.9553, 1, 1, 1, 1, 1,
0.1592304, 2.061397, -0.075478, 1, 1, 1, 1, 1,
0.16175, 0.1467212, 0.8382684, 1, 1, 1, 1, 1,
0.1620814, 0.6418857, -0.008883919, 1, 1, 1, 1, 1,
0.1637017, -1.110755, 2.473524, 1, 1, 1, 1, 1,
0.1682808, 0.8112579, 0.09056824, 1, 1, 1, 1, 1,
0.1689356, -1.936727, 2.610044, 1, 1, 1, 1, 1,
0.1706962, 1.399246, -0.4428892, 1, 1, 1, 1, 1,
0.1722783, 0.8970867, 0.6737828, 1, 1, 1, 1, 1,
0.1743446, 1.422465, 0.2791336, 1, 1, 1, 1, 1,
0.1747112, -0.4642379, 1.959673, 0, 0, 1, 1, 1,
0.1760104, -0.4103564, 3.810246, 1, 0, 0, 1, 1,
0.1772588, -0.4843605, 1.983578, 1, 0, 0, 1, 1,
0.1788058, 1.376246, 1.80862, 1, 0, 0, 1, 1,
0.1792491, 1.838365, -0.6894028, 1, 0, 0, 1, 1,
0.180258, -0.3151709, 4.045595, 1, 0, 0, 1, 1,
0.1821754, 0.918081, 0.2197449, 0, 0, 0, 1, 1,
0.1821878, -1.985687, 4.910476, 0, 0, 0, 1, 1,
0.1835744, 0.7817481, 0.1699937, 0, 0, 0, 1, 1,
0.1836271, 0.6465032, 0.4370813, 0, 0, 0, 1, 1,
0.186195, -1.348187, 1.469504, 0, 0, 0, 1, 1,
0.187032, -0.7112172, 2.830676, 0, 0, 0, 1, 1,
0.1893667, 2.322939, 1.092916, 0, 0, 0, 1, 1,
0.1911346, -0.2707313, 2.068899, 1, 1, 1, 1, 1,
0.19385, 0.3433884, 0.104124, 1, 1, 1, 1, 1,
0.2003188, 1.157903, -0.3677041, 1, 1, 1, 1, 1,
0.2003794, -0.8832623, 1.435855, 1, 1, 1, 1, 1,
0.2005855, -0.4297105, 3.083486, 1, 1, 1, 1, 1,
0.2046393, -0.1053937, 2.609636, 1, 1, 1, 1, 1,
0.2115243, -0.2690849, 1.468379, 1, 1, 1, 1, 1,
0.2120199, 0.5359944, -0.3810654, 1, 1, 1, 1, 1,
0.2152845, 0.6426671, -0.01271883, 1, 1, 1, 1, 1,
0.2190721, -1.797353, 2.677005, 1, 1, 1, 1, 1,
0.2197248, 0.7501987, 0.5486642, 1, 1, 1, 1, 1,
0.2208021, 0.1464865, 1.605925, 1, 1, 1, 1, 1,
0.2212342, -0.7447756, 4.1785, 1, 1, 1, 1, 1,
0.2236611, -0.469617, 3.388669, 1, 1, 1, 1, 1,
0.2238295, 1.288742, -0.701188, 1, 1, 1, 1, 1,
0.2268033, -0.1003453, 1.509079, 0, 0, 1, 1, 1,
0.2269813, 0.3649898, -0.2931187, 1, 0, 0, 1, 1,
0.2287761, 2.224965, 0.06810953, 1, 0, 0, 1, 1,
0.2328334, 0.7646033, 0.6679696, 1, 0, 0, 1, 1,
0.237668, -1.460953, 2.481624, 1, 0, 0, 1, 1,
0.242264, -0.5170773, 3.681671, 1, 0, 0, 1, 1,
0.2437321, 0.2746908, 2.007873, 0, 0, 0, 1, 1,
0.2452299, 1.715308, -0.7699811, 0, 0, 0, 1, 1,
0.2458909, 1.234037, 0.1127047, 0, 0, 0, 1, 1,
0.2491283, -0.07786739, 1.616836, 0, 0, 0, 1, 1,
0.2518378, 0.4460551, 0.4532583, 0, 0, 0, 1, 1,
0.2532442, 2.409502, 0.1131234, 0, 0, 0, 1, 1,
0.2533637, -1.011595, 2.351555, 0, 0, 0, 1, 1,
0.2555319, -0.2131154, 3.812014, 1, 1, 1, 1, 1,
0.256615, 1.79479, -0.122069, 1, 1, 1, 1, 1,
0.2572604, 0.1783987, 2.494144, 1, 1, 1, 1, 1,
0.2591889, -1.525806, 3.463126, 1, 1, 1, 1, 1,
0.2608038, -0.8391446, 2.469958, 1, 1, 1, 1, 1,
0.2626309, -0.7092503, 2.164675, 1, 1, 1, 1, 1,
0.2649929, 0.0534641, 1.486578, 1, 1, 1, 1, 1,
0.2659616, -0.3482748, 2.020205, 1, 1, 1, 1, 1,
0.2704283, 2.004452, -1.54182, 1, 1, 1, 1, 1,
0.2771823, -1.930412, 3.404541, 1, 1, 1, 1, 1,
0.2819896, -0.8365924, 3.884922, 1, 1, 1, 1, 1,
0.2827231, 0.0449939, 2.225941, 1, 1, 1, 1, 1,
0.2862676, 0.8482095, 2.067315, 1, 1, 1, 1, 1,
0.2868067, 0.2520694, 1.213319, 1, 1, 1, 1, 1,
0.2879771, 1.233369, 1.462446, 1, 1, 1, 1, 1,
0.2887485, -1.036426, 2.714159, 0, 0, 1, 1, 1,
0.2890423, -0.6301225, 2.443162, 1, 0, 0, 1, 1,
0.3007948, -0.9399312, 4.444698, 1, 0, 0, 1, 1,
0.3034042, -0.6140496, 4.682501, 1, 0, 0, 1, 1,
0.3038226, 1.656582, -2.475482, 1, 0, 0, 1, 1,
0.3126969, 0.6387981, 1.127548, 1, 0, 0, 1, 1,
0.3145263, -1.886741, 2.811805, 0, 0, 0, 1, 1,
0.3154283, -0.1962578, 1.337056, 0, 0, 0, 1, 1,
0.3166989, 0.7288282, 2.229808, 0, 0, 0, 1, 1,
0.3189612, -0.2977149, 2.31451, 0, 0, 0, 1, 1,
0.3208414, -1.01302, 2.694545, 0, 0, 0, 1, 1,
0.3237728, -0.5844303, 3.371074, 0, 0, 0, 1, 1,
0.3262115, 1.270712, -0.02266164, 0, 0, 0, 1, 1,
0.3296162, -0.2084675, 0.3138998, 1, 1, 1, 1, 1,
0.3297879, -1.509495, 4.965232, 1, 1, 1, 1, 1,
0.3299243, 1.680218, -1.154336, 1, 1, 1, 1, 1,
0.3310768, 1.416008, -0.2042493, 1, 1, 1, 1, 1,
0.3321879, 0.3882606, 1.471159, 1, 1, 1, 1, 1,
0.3333058, -0.4606239, 3.114421, 1, 1, 1, 1, 1,
0.3384791, 0.4277629, 2.148672, 1, 1, 1, 1, 1,
0.3396944, 1.166954, 0.7610302, 1, 1, 1, 1, 1,
0.3407057, 0.1268027, 2.056263, 1, 1, 1, 1, 1,
0.3504635, 0.5458906, -0.5027901, 1, 1, 1, 1, 1,
0.3510608, -0.004341197, -0.5523685, 1, 1, 1, 1, 1,
0.3572486, -0.2149036, 2.446516, 1, 1, 1, 1, 1,
0.3573084, -0.5382581, 4.572624, 1, 1, 1, 1, 1,
0.3612035, -0.1227893, 1.329424, 1, 1, 1, 1, 1,
0.3613703, -0.6455091, 1.944345, 1, 1, 1, 1, 1,
0.3618054, -0.190488, 1.925078, 0, 0, 1, 1, 1,
0.3626041, -0.8987829, -0.6598214, 1, 0, 0, 1, 1,
0.3643973, 0.6059533, -1.108096, 1, 0, 0, 1, 1,
0.3718761, 0.3508195, -0.3357609, 1, 0, 0, 1, 1,
0.3739496, 0.02520604, 1.227552, 1, 0, 0, 1, 1,
0.3817321, 0.7318264, 0.07384469, 1, 0, 0, 1, 1,
0.38664, -1.060382, 1.81745, 0, 0, 0, 1, 1,
0.3906988, -0.2218609, 3.042591, 0, 0, 0, 1, 1,
0.39245, -0.499781, 1.774064, 0, 0, 0, 1, 1,
0.3958397, -0.1458376, 2.472708, 0, 0, 0, 1, 1,
0.4021933, 0.03844104, 1.720818, 0, 0, 0, 1, 1,
0.4026657, 0.2995573, 0.6293694, 0, 0, 0, 1, 1,
0.4088785, 0.281599, 1.21119, 0, 0, 0, 1, 1,
0.4130805, 0.6492132, 0.180795, 1, 1, 1, 1, 1,
0.4145899, -0.2607204, 2.28143, 1, 1, 1, 1, 1,
0.4180623, -1.15898, 4.071599, 1, 1, 1, 1, 1,
0.4198718, 0.1665463, 2.535615, 1, 1, 1, 1, 1,
0.4245288, 0.2842299, 1.902803, 1, 1, 1, 1, 1,
0.42528, -1.48169, 3.182939, 1, 1, 1, 1, 1,
0.4279326, 0.2801564, 0.9350083, 1, 1, 1, 1, 1,
0.4304095, 0.06913345, 3.419403, 1, 1, 1, 1, 1,
0.433311, -2.242529, 3.612381, 1, 1, 1, 1, 1,
0.4383937, -0.0406234, 1.939949, 1, 1, 1, 1, 1,
0.4461996, -1.556852, 2.752607, 1, 1, 1, 1, 1,
0.4463798, -2.523072, 2.951468, 1, 1, 1, 1, 1,
0.4471704, -0.2023279, 2.480973, 1, 1, 1, 1, 1,
0.457168, -0.6805545, 4.198034, 1, 1, 1, 1, 1,
0.4580053, 1.122694, -0.2882273, 1, 1, 1, 1, 1,
0.460159, 0.4285091, 2.396585, 0, 0, 1, 1, 1,
0.4606298, -1.14178, 1.078749, 1, 0, 0, 1, 1,
0.47118, 1.295448, 1.071596, 1, 0, 0, 1, 1,
0.4712966, -1.628906, 2.181474, 1, 0, 0, 1, 1,
0.4729377, 1.517245, -0.8033159, 1, 0, 0, 1, 1,
0.4761549, -0.1856197, 3.551145, 1, 0, 0, 1, 1,
0.4792385, 0.07042623, 2.607229, 0, 0, 0, 1, 1,
0.4814726, -1.162307, 1.764798, 0, 0, 0, 1, 1,
0.4829555, 0.769664, -2.157682, 0, 0, 0, 1, 1,
0.4838109, -0.9112614, 1.974818, 0, 0, 0, 1, 1,
0.4840552, 0.8773565, 0.9451834, 0, 0, 0, 1, 1,
0.4846645, 0.3920879, 1.805863, 0, 0, 0, 1, 1,
0.4857303, -1.542189, 2.539241, 0, 0, 0, 1, 1,
0.4889766, -2.017509, 4.299861, 1, 1, 1, 1, 1,
0.4895924, 0.09642298, 0.5912877, 1, 1, 1, 1, 1,
0.493529, 0.5797696, -0.4775521, 1, 1, 1, 1, 1,
0.4978216, -1.196765, 1.14018, 1, 1, 1, 1, 1,
0.4985522, 0.4297014, -0.2118828, 1, 1, 1, 1, 1,
0.5019569, 0.262316, -0.01610192, 1, 1, 1, 1, 1,
0.5027586, 0.6120959, 1.962291, 1, 1, 1, 1, 1,
0.5058794, -1.298357, 2.477015, 1, 1, 1, 1, 1,
0.5086905, -0.5905884, 0.9953116, 1, 1, 1, 1, 1,
0.5174679, -0.9789137, 2.789111, 1, 1, 1, 1, 1,
0.5188559, -2.412143, 1.999081, 1, 1, 1, 1, 1,
0.5191675, -0.3356037, 1.547886, 1, 1, 1, 1, 1,
0.5195793, -0.781804, 2.613575, 1, 1, 1, 1, 1,
0.5232334, -1.49732, 0.1976562, 1, 1, 1, 1, 1,
0.5241433, -0.2817571, 1.285322, 1, 1, 1, 1, 1,
0.5246762, 0.92575, 0.1014808, 0, 0, 1, 1, 1,
0.5297602, -1.474791, 3.006945, 1, 0, 0, 1, 1,
0.532538, -0.1684569, 2.455613, 1, 0, 0, 1, 1,
0.5338969, 1.134391, 1.386333, 1, 0, 0, 1, 1,
0.5428093, 0.08398566, 1.81961, 1, 0, 0, 1, 1,
0.5441865, -0.5235556, 3.840829, 1, 0, 0, 1, 1,
0.5470268, 1.313065, -0.5562825, 0, 0, 0, 1, 1,
0.5494245, 0.6990228, 0.8888412, 0, 0, 0, 1, 1,
0.5497446, -1.054466, 1.626185, 0, 0, 0, 1, 1,
0.5510513, -0.1800214, 3.551898, 0, 0, 0, 1, 1,
0.5545736, 1.168349, 2.275666, 0, 0, 0, 1, 1,
0.5566136, 0.927658, -0.08263749, 0, 0, 0, 1, 1,
0.5567502, 3.018279, 0.4409145, 0, 0, 0, 1, 1,
0.5589805, -0.3085679, 2.399496, 1, 1, 1, 1, 1,
0.560174, 1.086878, 2.117579, 1, 1, 1, 1, 1,
0.5623117, 1.414279, 0.6639325, 1, 1, 1, 1, 1,
0.5630736, 1.688721, 0.640292, 1, 1, 1, 1, 1,
0.5689969, -0.6211565, 1.624503, 1, 1, 1, 1, 1,
0.569672, -1.92501, 4.026123, 1, 1, 1, 1, 1,
0.573585, 3.038564, 0.08158141, 1, 1, 1, 1, 1,
0.5742698, -0.2827874, 2.935511, 1, 1, 1, 1, 1,
0.574531, 0.772783, 2.276378, 1, 1, 1, 1, 1,
0.5774156, -0.2731612, 0.735997, 1, 1, 1, 1, 1,
0.578486, 1.646835, 1.778387, 1, 1, 1, 1, 1,
0.580749, 2.182723, 1.069644, 1, 1, 1, 1, 1,
0.5903099, 1.014229, -0.5339644, 1, 1, 1, 1, 1,
0.5941515, 1.462274, -0.1361451, 1, 1, 1, 1, 1,
0.5941948, -0.2422462, 0.2647671, 1, 1, 1, 1, 1,
0.5949187, -1.717005, 4.761842, 0, 0, 1, 1, 1,
0.597845, 0.1389626, 2.60047, 1, 0, 0, 1, 1,
0.5981199, 0.2460479, 1.421587, 1, 0, 0, 1, 1,
0.6047837, -1.204488, 2.40081, 1, 0, 0, 1, 1,
0.6055866, 2.240314, -0.3011799, 1, 0, 0, 1, 1,
0.605969, 0.6592909, 0.06729067, 1, 0, 0, 1, 1,
0.6088832, -0.5274035, 1.787844, 0, 0, 0, 1, 1,
0.6135378, 1.149028, 0.6354212, 0, 0, 0, 1, 1,
0.615495, -0.8111593, 2.713385, 0, 0, 0, 1, 1,
0.6204192, 0.3106097, 0.4858881, 0, 0, 0, 1, 1,
0.6207952, 0.8343653, 1.228498, 0, 0, 0, 1, 1,
0.624003, -1.31792, 2.987202, 0, 0, 0, 1, 1,
0.6263684, -0.1269477, 1.601738, 0, 0, 0, 1, 1,
0.6299226, 0.1337887, 0.541473, 1, 1, 1, 1, 1,
0.6351845, -1.078114, 1.377339, 1, 1, 1, 1, 1,
0.637805, -0.6131391, 0.8005424, 1, 1, 1, 1, 1,
0.6380009, -1.026284, 3.538316, 1, 1, 1, 1, 1,
0.6386521, 0.05128876, 0.9851324, 1, 1, 1, 1, 1,
0.6432414, 0.6435886, -0.8844013, 1, 1, 1, 1, 1,
0.645343, 1.085461, -1.234733, 1, 1, 1, 1, 1,
0.6453674, 0.2119755, 1.640487, 1, 1, 1, 1, 1,
0.6507658, -0.6347826, 2.227286, 1, 1, 1, 1, 1,
0.6507875, -0.3992321, 1.507136, 1, 1, 1, 1, 1,
0.6585651, 1.019209, 0.7481208, 1, 1, 1, 1, 1,
0.6649351, -0.07379698, 3.166899, 1, 1, 1, 1, 1,
0.6697413, 1.878606, 1.186877, 1, 1, 1, 1, 1,
0.6720151, -0.2956573, 0.1424068, 1, 1, 1, 1, 1,
0.6793769, 0.2343766, -0.5337937, 1, 1, 1, 1, 1,
0.6838182, 1.02338, 0.4863718, 0, 0, 1, 1, 1,
0.6880652, 0.6081294, -0.4018049, 1, 0, 0, 1, 1,
0.6973865, 0.1208295, 2.902749, 1, 0, 0, 1, 1,
0.6998655, -0.4472152, 2.212153, 1, 0, 0, 1, 1,
0.7033926, -0.1009433, 1.548282, 1, 0, 0, 1, 1,
0.7037194, -0.9372541, 2.169066, 1, 0, 0, 1, 1,
0.7038143, 0.4056771, 2.53902, 0, 0, 0, 1, 1,
0.7038755, -0.7766523, 2.698777, 0, 0, 0, 1, 1,
0.7097883, -0.4751325, 0.9786681, 0, 0, 0, 1, 1,
0.7123584, 0.2088657, 1.869618, 0, 0, 0, 1, 1,
0.7130921, 1.050493, -0.3571269, 0, 0, 0, 1, 1,
0.7209585, 0.02646497, 2.267205, 0, 0, 0, 1, 1,
0.7253076, -2.209304, 1.681757, 0, 0, 0, 1, 1,
0.725852, -0.1177083, 2.535439, 1, 1, 1, 1, 1,
0.7329335, -0.09087055, 0.7904661, 1, 1, 1, 1, 1,
0.7336255, -0.1860618, 0.7731439, 1, 1, 1, 1, 1,
0.7367268, -1.453863, 3.31433, 1, 1, 1, 1, 1,
0.7536685, -0.3880366, 2.241579, 1, 1, 1, 1, 1,
0.7563167, -0.5253139, 1.245628, 1, 1, 1, 1, 1,
0.7570702, -0.1461051, 1.258647, 1, 1, 1, 1, 1,
0.7582989, 0.06570365, 2.354735, 1, 1, 1, 1, 1,
0.7584847, -2.736425, 4.548717, 1, 1, 1, 1, 1,
0.7639957, 0.09329632, 0.3168569, 1, 1, 1, 1, 1,
0.7721681, 0.1889244, 2.470882, 1, 1, 1, 1, 1,
0.7800202, 0.377274, 2.644133, 1, 1, 1, 1, 1,
0.7811697, 1.588665, 1.668075, 1, 1, 1, 1, 1,
0.7813997, -1.539439, 3.012763, 1, 1, 1, 1, 1,
0.7818713, 1.536824, 0.5359113, 1, 1, 1, 1, 1,
0.7839854, 0.6851786, 3.381014, 0, 0, 1, 1, 1,
0.7841663, -1.699689, 3.742699, 1, 0, 0, 1, 1,
0.7925511, 0.3481037, 2.360859, 1, 0, 0, 1, 1,
0.7925907, -0.4289939, 3.154182, 1, 0, 0, 1, 1,
0.7934824, -0.9090716, 2.700396, 1, 0, 0, 1, 1,
0.7950568, -0.1368129, 1.835837, 1, 0, 0, 1, 1,
0.7959728, 0.4450137, 2.459993, 0, 0, 0, 1, 1,
0.8045468, 1.162157, -0.01620004, 0, 0, 0, 1, 1,
0.808987, 0.4570543, 1.904309, 0, 0, 0, 1, 1,
0.8101213, -0.1537891, 1.245728, 0, 0, 0, 1, 1,
0.8121976, -1.315478, 0.2592072, 0, 0, 0, 1, 1,
0.8125239, 1.462987, 0.4824316, 0, 0, 0, 1, 1,
0.8141937, -0.2095343, 2.381862, 0, 0, 0, 1, 1,
0.8157215, 0.7261743, 0.568598, 1, 1, 1, 1, 1,
0.8165144, -0.5767303, 1.25123, 1, 1, 1, 1, 1,
0.8270075, 1.345523, -1.17572, 1, 1, 1, 1, 1,
0.8275657, -1.072149, 2.326256, 1, 1, 1, 1, 1,
0.8277432, -0.03878586, 0.7164217, 1, 1, 1, 1, 1,
0.8310089, -1.007271, 3.374509, 1, 1, 1, 1, 1,
0.8317118, 0.2853125, 1.722037, 1, 1, 1, 1, 1,
0.8319769, 0.4281937, 2.424556, 1, 1, 1, 1, 1,
0.8320397, -0.7805743, 2.677027, 1, 1, 1, 1, 1,
0.8342395, 0.325811, 1.663523, 1, 1, 1, 1, 1,
0.8402085, 0.1894755, 2.362365, 1, 1, 1, 1, 1,
0.8451722, -0.7894039, 2.196949, 1, 1, 1, 1, 1,
0.8457249, -0.386577, 1.874169, 1, 1, 1, 1, 1,
0.8505675, -0.8107624, 0.8683198, 1, 1, 1, 1, 1,
0.8506472, 0.3778462, 2.760787, 1, 1, 1, 1, 1,
0.8527758, 0.5707656, 1.864458, 0, 0, 1, 1, 1,
0.8742725, -0.8021708, 2.103061, 1, 0, 0, 1, 1,
0.8748743, -0.7771218, 1.222248, 1, 0, 0, 1, 1,
0.8793093, -1.302702, 1.470967, 1, 0, 0, 1, 1,
0.8873985, -1.406457, 3.825289, 1, 0, 0, 1, 1,
0.8881955, -0.8263763, 1.956002, 1, 0, 0, 1, 1,
0.8929505, -0.6957118, 1.599428, 0, 0, 0, 1, 1,
0.90667, 0.1973739, 1.576393, 0, 0, 0, 1, 1,
0.9075782, 1.826747, 1.28684, 0, 0, 0, 1, 1,
0.910904, 0.8626506, 0.4319399, 0, 0, 0, 1, 1,
0.9133224, 0.6770599, 1.40847, 0, 0, 0, 1, 1,
0.9293069, 0.02349424, -1.182333, 0, 0, 0, 1, 1,
0.9316624, 1.19072, 0.7297901, 0, 0, 0, 1, 1,
0.9321982, -0.3008212, 2.405259, 1, 1, 1, 1, 1,
0.9327895, 0.717689, 2.404301, 1, 1, 1, 1, 1,
0.9464582, 1.203191, 1.068864, 1, 1, 1, 1, 1,
0.9534964, -0.2034896, 2.206107, 1, 1, 1, 1, 1,
0.9632982, -0.462093, 1.680456, 1, 1, 1, 1, 1,
0.9647312, -0.9944223, 2.230837, 1, 1, 1, 1, 1,
0.9666682, -0.05858132, 1.877078, 1, 1, 1, 1, 1,
0.9715618, 0.3307674, -0.2700256, 1, 1, 1, 1, 1,
0.9729028, 0.2356748, 3.203452, 1, 1, 1, 1, 1,
0.9740125, 0.02256592, 0.7957115, 1, 1, 1, 1, 1,
0.9743931, 0.2873392, 2.155882, 1, 1, 1, 1, 1,
0.9834381, 0.1163746, 3.356837, 1, 1, 1, 1, 1,
0.9945238, 1.03464, 0.6139061, 1, 1, 1, 1, 1,
1.00157, -1.113277, 2.380076, 1, 1, 1, 1, 1,
1.005513, 0.4412586, 1.096479, 1, 1, 1, 1, 1,
1.008481, -0.6310866, 2.64893, 0, 0, 1, 1, 1,
1.022124, 0.3750902, 1.710881, 1, 0, 0, 1, 1,
1.034716, -0.3239875, 1.928954, 1, 0, 0, 1, 1,
1.035195, 0.02419401, 0.3228319, 1, 0, 0, 1, 1,
1.039042, -0.5306335, 2.348746, 1, 0, 0, 1, 1,
1.040241, 0.8442724, 0.9162381, 1, 0, 0, 1, 1,
1.040569, -0.08747678, 0.9970866, 0, 0, 0, 1, 1,
1.041653, -1.392741, 1.909708, 0, 0, 0, 1, 1,
1.042507, 0.1051991, 2.790941, 0, 0, 0, 1, 1,
1.050696, -0.05600703, 2.032296, 0, 0, 0, 1, 1,
1.052907, -0.2523084, 1.172062, 0, 0, 0, 1, 1,
1.054375, -0.7610195, 3.093212, 0, 0, 0, 1, 1,
1.06116, 0.2559005, -0.01145753, 0, 0, 0, 1, 1,
1.065995, -1.515733, 2.730109, 1, 1, 1, 1, 1,
1.069906, 0.4526432, 2.881012, 1, 1, 1, 1, 1,
1.070339, -0.846819, 2.417548, 1, 1, 1, 1, 1,
1.076928, -0.3593395, 2.933894, 1, 1, 1, 1, 1,
1.079235, 0.158269, 1.32409, 1, 1, 1, 1, 1,
1.081864, 1.092358, -0.3628716, 1, 1, 1, 1, 1,
1.083312, -0.4803621, 3.684156, 1, 1, 1, 1, 1,
1.084724, -1.233183, 1.032115, 1, 1, 1, 1, 1,
1.086153, 0.4155059, 0.9392888, 1, 1, 1, 1, 1,
1.086629, 0.8635484, 1.374655, 1, 1, 1, 1, 1,
1.089254, 0.3514895, 1.779102, 1, 1, 1, 1, 1,
1.094435, 1.151663, 2.482176, 1, 1, 1, 1, 1,
1.095099, -2.618752, 2.627536, 1, 1, 1, 1, 1,
1.097213, -1.698233, 2.021559, 1, 1, 1, 1, 1,
1.108448, 0.1617639, 1.266484, 1, 1, 1, 1, 1,
1.122407, -0.8563311, 2.370768, 0, 0, 1, 1, 1,
1.123293, 0.1729466, 1.737198, 1, 0, 0, 1, 1,
1.131076, 0.4640558, 3.969444, 1, 0, 0, 1, 1,
1.136457, -0.1484145, 2.334468, 1, 0, 0, 1, 1,
1.138054, -0.9388648, 2.361341, 1, 0, 0, 1, 1,
1.146571, 0.5419689, -0.05873831, 1, 0, 0, 1, 1,
1.163277, -1.662174, 1.203718, 0, 0, 0, 1, 1,
1.166801, -0.9005395, 2.050115, 0, 0, 0, 1, 1,
1.169558, 0.1128382, 2.148124, 0, 0, 0, 1, 1,
1.173057, 0.6730657, 1.912309, 0, 0, 0, 1, 1,
1.176369, 0.0321985, 1.567445, 0, 0, 0, 1, 1,
1.177903, -1.977876, 2.882428, 0, 0, 0, 1, 1,
1.180455, 1.917193, -0.4922615, 0, 0, 0, 1, 1,
1.18283, 1.145265, 1.563789, 1, 1, 1, 1, 1,
1.185077, -1.221444, 1.026697, 1, 1, 1, 1, 1,
1.185706, -1.478627, 4.168724, 1, 1, 1, 1, 1,
1.187916, -0.1355859, 1.791004, 1, 1, 1, 1, 1,
1.190496, 0.546113, 1.302727, 1, 1, 1, 1, 1,
1.191467, 0.04403925, 2.249219, 1, 1, 1, 1, 1,
1.199724, 0.8596684, 1.220065, 1, 1, 1, 1, 1,
1.204676, -0.4670007, 1.169122, 1, 1, 1, 1, 1,
1.205453, -0.2800956, 0.2165361, 1, 1, 1, 1, 1,
1.209372, 1.836349, -0.4276325, 1, 1, 1, 1, 1,
1.22308, 0.368934, 0.8131412, 1, 1, 1, 1, 1,
1.238239, -1.354681, 3.317174, 1, 1, 1, 1, 1,
1.239149, 0.448917, 0.7702262, 1, 1, 1, 1, 1,
1.241296, 1.135849, -0.9117473, 1, 1, 1, 1, 1,
1.252241, 0.4306584, 1.646335, 1, 1, 1, 1, 1,
1.252774, 1.021598, 1.066789, 0, 0, 1, 1, 1,
1.253799, 0.5605406, -0.6801795, 1, 0, 0, 1, 1,
1.25974, 0.3679206, 2.453822, 1, 0, 0, 1, 1,
1.262258, -0.2437425, 2.536079, 1, 0, 0, 1, 1,
1.26665, -1.213578, 2.471128, 1, 0, 0, 1, 1,
1.26703, -0.9702382, 2.77251, 1, 0, 0, 1, 1,
1.27575, -0.7345842, 2.599333, 0, 0, 0, 1, 1,
1.296197, 0.7043238, 1.881178, 0, 0, 0, 1, 1,
1.303426, 1.077306, 1.690828, 0, 0, 0, 1, 1,
1.318293, -0.7449026, 0.7827354, 0, 0, 0, 1, 1,
1.323951, 2.473867, 1.044131, 0, 0, 0, 1, 1,
1.326286, 0.6727279, 0.360305, 0, 0, 0, 1, 1,
1.334359, -0.05562197, 1.947778, 0, 0, 0, 1, 1,
1.338023, 0.1172434, 0.2154276, 1, 1, 1, 1, 1,
1.339234, 0.9133642, 0.6660036, 1, 1, 1, 1, 1,
1.340397, -0.4517564, 2.498729, 1, 1, 1, 1, 1,
1.342252, 1.369525, 1.471865, 1, 1, 1, 1, 1,
1.344298, 0.4296346, 1.479311, 1, 1, 1, 1, 1,
1.356247, 0.7213649, 1.49342, 1, 1, 1, 1, 1,
1.359041, -0.6546274, 3.255003, 1, 1, 1, 1, 1,
1.365369, 1.682216, -0.2902905, 1, 1, 1, 1, 1,
1.371796, 1.431894, -0.05914345, 1, 1, 1, 1, 1,
1.380399, 0.5626417, 0.2774857, 1, 1, 1, 1, 1,
1.388415, 0.5181212, 2.553558, 1, 1, 1, 1, 1,
1.393623, 0.59, -0.2722622, 1, 1, 1, 1, 1,
1.397094, -0.6854022, 0.9557692, 1, 1, 1, 1, 1,
1.399327, 0.3899197, 1.549194, 1, 1, 1, 1, 1,
1.404174, -0.001251779, 2.384361, 1, 1, 1, 1, 1,
1.407679, 0.1386321, 0.523645, 0, 0, 1, 1, 1,
1.445739, 1.04579, 2.214029, 1, 0, 0, 1, 1,
1.462924, 0.2881345, 0.6421827, 1, 0, 0, 1, 1,
1.465825, 0.3592376, -0.3216203, 1, 0, 0, 1, 1,
1.484584, 1.058342, 1.112804, 1, 0, 0, 1, 1,
1.501093, -0.5267926, 2.487829, 1, 0, 0, 1, 1,
1.518607, -1.561877, 2.586562, 0, 0, 0, 1, 1,
1.527924, 0.1073002, 1.644083, 0, 0, 0, 1, 1,
1.52829, 0.5090643, 0.6365657, 0, 0, 0, 1, 1,
1.53719, -0.2150046, 1.928843, 0, 0, 0, 1, 1,
1.551764, -0.6584291, 4.10872, 0, 0, 0, 1, 1,
1.556825, 1.89966, 1.052827, 0, 0, 0, 1, 1,
1.579114, 1.019682, 0.9741962, 0, 0, 0, 1, 1,
1.582972, -0.2753007, 1.428424, 1, 1, 1, 1, 1,
1.614955, 0.6069129, 1.462951, 1, 1, 1, 1, 1,
1.620998, -2.30779, 3.982501, 1, 1, 1, 1, 1,
1.621186, -0.3233456, 2.345186, 1, 1, 1, 1, 1,
1.622913, -0.6066868, 2.900317, 1, 1, 1, 1, 1,
1.623887, 1.30278, 1.644049, 1, 1, 1, 1, 1,
1.671448, -0.7453576, 2.145125, 1, 1, 1, 1, 1,
1.678272, -1.784474, 2.443615, 1, 1, 1, 1, 1,
1.680504, -0.9109121, 1.940233, 1, 1, 1, 1, 1,
1.699665, 1.176553, 1.671291, 1, 1, 1, 1, 1,
1.705333, -1.547696, 1.465153, 1, 1, 1, 1, 1,
1.707162, 1.109285, 0.3779328, 1, 1, 1, 1, 1,
1.707425, 0.3652081, 2.407011, 1, 1, 1, 1, 1,
1.708422, -0.6232755, 2.493625, 1, 1, 1, 1, 1,
1.715011, 0.8011904, 0.0310996, 1, 1, 1, 1, 1,
1.715807, -0.4126597, 0.4582382, 0, 0, 1, 1, 1,
1.721144, -0.3182257, 3.32505, 1, 0, 0, 1, 1,
1.721686, -1.066489, 2.443417, 1, 0, 0, 1, 1,
1.734836, -1.628377, 2.824533, 1, 0, 0, 1, 1,
1.764586, 0.6796783, 0.738507, 1, 0, 0, 1, 1,
1.772843, -1.178868, 2.689423, 1, 0, 0, 1, 1,
1.7923, 0.4719582, 1.172598, 0, 0, 0, 1, 1,
1.799084, -0.5105329, 0.4827377, 0, 0, 0, 1, 1,
1.830618, -0.6395004, 1.422387, 0, 0, 0, 1, 1,
1.844869, -1.352517, 3.211172, 0, 0, 0, 1, 1,
1.845498, -0.05571727, 1.123464, 0, 0, 0, 1, 1,
1.86884, 1.77291, 0.1220217, 0, 0, 0, 1, 1,
1.868846, -1.389328, 2.132717, 0, 0, 0, 1, 1,
1.913301, 0.9311209, 3.58266, 1, 1, 1, 1, 1,
1.918387, 1.180701, 0.2723084, 1, 1, 1, 1, 1,
1.928346, 0.5756701, 1.910958, 1, 1, 1, 1, 1,
1.943324, 0.3217773, 1.318484, 1, 1, 1, 1, 1,
1.945919, 0.01124658, 0.6649706, 1, 1, 1, 1, 1,
1.968917, -2.375493, 1.650647, 1, 1, 1, 1, 1,
1.976728, 0.8087904, 1.732823, 1, 1, 1, 1, 1,
1.986075, -1.338245, 2.822977, 1, 1, 1, 1, 1,
1.986593, 0.7334201, 1.413919, 1, 1, 1, 1, 1,
2.012133, -0.05793167, 1.903276, 1, 1, 1, 1, 1,
2.046131, 1.391842, 2.669501, 1, 1, 1, 1, 1,
2.059203, -0.822881, 2.694275, 1, 1, 1, 1, 1,
2.079563, 0.4918897, 3.216141, 1, 1, 1, 1, 1,
2.088747, -0.3644662, -0.3459145, 1, 1, 1, 1, 1,
2.090767, -0.3119541, -0.2399655, 1, 1, 1, 1, 1,
2.129261, 0.1556275, 0.9255442, 0, 0, 1, 1, 1,
2.146408, -0.3834934, 2.943755, 1, 0, 0, 1, 1,
2.181806, 0.7856693, -0.2157246, 1, 0, 0, 1, 1,
2.222469, -1.286242, 1.2622, 1, 0, 0, 1, 1,
2.277946, -0.3774029, 2.973823, 1, 0, 0, 1, 1,
2.282065, -1.193726, 2.568105, 1, 0, 0, 1, 1,
2.292305, 0.1547935, 1.77596, 0, 0, 0, 1, 1,
2.320456, 0.6535197, -0.2369427, 0, 0, 0, 1, 1,
2.346673, 0.6591069, 3.185468, 0, 0, 0, 1, 1,
2.350918, -0.6843067, 2.818386, 0, 0, 0, 1, 1,
2.405817, -0.1385442, 2.18804, 0, 0, 0, 1, 1,
2.487956, 0.9399984, 1.889111, 0, 0, 0, 1, 1,
2.601576, -0.0002431652, 2.88639, 0, 0, 0, 1, 1,
2.783932, -0.8169994, -0.7348176, 1, 1, 1, 1, 1,
2.825022, 0.559002, 1.317845, 1, 1, 1, 1, 1,
2.93679, 0.3500443, 2.704055, 1, 1, 1, 1, 1,
2.979871, 0.3518173, 1.867323, 1, 1, 1, 1, 1,
3.002035, -1.665328, 1.896327, 1, 1, 1, 1, 1,
3.011967, -0.6447353, 3.23554, 1, 1, 1, 1, 1,
3.458576, -0.2185712, -0.2832202, 1, 1, 1, 1, 1
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
var radius = 9.5032;
var distance = 33.37959;
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
mvMatrix.translate( -0.2034059, -0.296051, 0.1032765 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.37959);
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
