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
-3.51269, -0.0464408, -1.022679, 1, 0, 0, 1,
-3.467655, 0.230603, -2.876226, 1, 0.007843138, 0, 1,
-2.95806, -2.096381, -2.583266, 1, 0.01176471, 0, 1,
-2.900405, 0.5882353, -1.03813, 1, 0.01960784, 0, 1,
-2.596709, -1.102143, -3.251933, 1, 0.02352941, 0, 1,
-2.552113, 0.1071815, -2.040406, 1, 0.03137255, 0, 1,
-2.548573, -1.282239, -1.138622, 1, 0.03529412, 0, 1,
-2.500512, -0.1007797, 0.2379111, 1, 0.04313726, 0, 1,
-2.500365, 0.6140127, -0.913173, 1, 0.04705882, 0, 1,
-2.478786, -1.026463, -1.898195, 1, 0.05490196, 0, 1,
-2.465312, -1.286739, -4.000591, 1, 0.05882353, 0, 1,
-2.41321, 1.222159, -0.02572566, 1, 0.06666667, 0, 1,
-2.329077, -0.5344449, -1.895275, 1, 0.07058824, 0, 1,
-2.279663, 0.7115403, -1.133671, 1, 0.07843138, 0, 1,
-2.246608, 1.269527, -1.180535, 1, 0.08235294, 0, 1,
-2.235131, 0.11707, -0.5275854, 1, 0.09019608, 0, 1,
-2.224573, 0.1149846, -0.8237886, 1, 0.09411765, 0, 1,
-2.220293, -1.246685, 0.03791267, 1, 0.1019608, 0, 1,
-2.212126, -0.5252411, -2.467871, 1, 0.1098039, 0, 1,
-2.178726, 0.2210395, -0.8718063, 1, 0.1137255, 0, 1,
-2.148928, -0.3244717, -2.416172, 1, 0.1215686, 0, 1,
-2.100767, 0.8262592, -0.202994, 1, 0.1254902, 0, 1,
-2.08913, -1.573838, -2.256012, 1, 0.1333333, 0, 1,
-2.088541, 0.6851947, -2.018891, 1, 0.1372549, 0, 1,
-2.062604, 0.5557475, -1.391813, 1, 0.145098, 0, 1,
-2.048125, 0.01971836, 0.2957105, 1, 0.1490196, 0, 1,
-2.01799, 0.2768528, -1.048024, 1, 0.1568628, 0, 1,
-2.009311, -1.972824, -2.714603, 1, 0.1607843, 0, 1,
-2.004821, 0.02773261, 1.908153, 1, 0.1686275, 0, 1,
-1.988036, 0.5457336, -0.2547095, 1, 0.172549, 0, 1,
-1.983896, -0.3460638, -1.412752, 1, 0.1803922, 0, 1,
-1.964599, 0.2354397, -2.218396, 1, 0.1843137, 0, 1,
-1.961594, -0.9416685, -1.352128, 1, 0.1921569, 0, 1,
-1.95708, 0.03933352, -1.099298, 1, 0.1960784, 0, 1,
-1.896097, -0.517608, -1.422983, 1, 0.2039216, 0, 1,
-1.889117, -1.238269, -0.8359658, 1, 0.2117647, 0, 1,
-1.86593, 1.34423, -0.7035605, 1, 0.2156863, 0, 1,
-1.83985, 1.255263, -2.395925, 1, 0.2235294, 0, 1,
-1.835846, 0.3658869, -1.41911, 1, 0.227451, 0, 1,
-1.835541, -1.418195, -3.592762, 1, 0.2352941, 0, 1,
-1.832758, 0.987455, -0.5762993, 1, 0.2392157, 0, 1,
-1.8137, -0.7557629, -0.6029275, 1, 0.2470588, 0, 1,
-1.811674, 2.140205, -0.4603012, 1, 0.2509804, 0, 1,
-1.80852, -0.1475188, -2.672453, 1, 0.2588235, 0, 1,
-1.800868, 2.068739, 0.3480701, 1, 0.2627451, 0, 1,
-1.800318, -0.5389904, -1.756053, 1, 0.2705882, 0, 1,
-1.800157, 0.2932298, -0.6252809, 1, 0.2745098, 0, 1,
-1.774447, 0.02685612, -0.9276997, 1, 0.282353, 0, 1,
-1.744331, 0.03582615, -0.5749819, 1, 0.2862745, 0, 1,
-1.738811, 0.9405325, -1.418016, 1, 0.2941177, 0, 1,
-1.73565, 0.4902772, -1.228723, 1, 0.3019608, 0, 1,
-1.726828, 1.567488, -0.1625635, 1, 0.3058824, 0, 1,
-1.721102, 0.458865, -0.4256901, 1, 0.3137255, 0, 1,
-1.710967, 1.771746, -0.1989198, 1, 0.3176471, 0, 1,
-1.702711, 0.02278738, -3.74459, 1, 0.3254902, 0, 1,
-1.697344, -0.5708169, -1.114456, 1, 0.3294118, 0, 1,
-1.696199, -0.6218158, -1.218016, 1, 0.3372549, 0, 1,
-1.682406, -1.098631, -2.53084, 1, 0.3411765, 0, 1,
-1.672124, 1.324404, -0.9809999, 1, 0.3490196, 0, 1,
-1.667845, -1.109426, -1.242913, 1, 0.3529412, 0, 1,
-1.665709, 0.6665019, 0.2501811, 1, 0.3607843, 0, 1,
-1.664612, 0.4215375, 0.01253009, 1, 0.3647059, 0, 1,
-1.662936, -0.6496515, -2.48861, 1, 0.372549, 0, 1,
-1.6459, 1.40066, -0.8627234, 1, 0.3764706, 0, 1,
-1.638937, 0.6893881, -1.914472, 1, 0.3843137, 0, 1,
-1.633947, 0.165007, -1.9222, 1, 0.3882353, 0, 1,
-1.621666, 1.392432, -0.1453551, 1, 0.3960784, 0, 1,
-1.620626, 0.4654402, -1.087823, 1, 0.4039216, 0, 1,
-1.618573, -0.8599499, -2.294748, 1, 0.4078431, 0, 1,
-1.613366, 1.118632, -0.4827485, 1, 0.4156863, 0, 1,
-1.600009, 0.08945156, -0.3140877, 1, 0.4196078, 0, 1,
-1.598675, 0.9273923, -1.98001, 1, 0.427451, 0, 1,
-1.592296, -0.05117447, -0.01567093, 1, 0.4313726, 0, 1,
-1.587345, -0.5188334, -1.871404, 1, 0.4392157, 0, 1,
-1.587186, 0.9338065, -1.538276, 1, 0.4431373, 0, 1,
-1.569243, -0.1671071, -1.349286, 1, 0.4509804, 0, 1,
-1.558256, 0.8198237, -2.699587, 1, 0.454902, 0, 1,
-1.556332, 1.366387, -1.456519, 1, 0.4627451, 0, 1,
-1.53654, -1.298476, -1.833314, 1, 0.4666667, 0, 1,
-1.512585, -0.4279141, -1.209114, 1, 0.4745098, 0, 1,
-1.506897, 0.05778576, -1.502588, 1, 0.4784314, 0, 1,
-1.497002, 0.3431746, -0.8784026, 1, 0.4862745, 0, 1,
-1.495994, 1.096504, 0.6139042, 1, 0.4901961, 0, 1,
-1.469424, 0.3873396, -2.54059, 1, 0.4980392, 0, 1,
-1.437182, 0.3473005, -0.5622064, 1, 0.5058824, 0, 1,
-1.429431, -0.4179595, -1.765809, 1, 0.509804, 0, 1,
-1.42475, -1.243602, -3.395074, 1, 0.5176471, 0, 1,
-1.421269, -0.5079855, -3.731375, 1, 0.5215687, 0, 1,
-1.417511, -0.4810242, -1.299841, 1, 0.5294118, 0, 1,
-1.416809, -1.682891, -2.231787, 1, 0.5333334, 0, 1,
-1.405605, -1.492748, -1.344408, 1, 0.5411765, 0, 1,
-1.384135, -1.35925, -3.594549, 1, 0.5450981, 0, 1,
-1.379286, -0.6166179, 0.1976665, 1, 0.5529412, 0, 1,
-1.36942, -0.03665179, -1.340862, 1, 0.5568628, 0, 1,
-1.361349, 0.4983513, -0.8676007, 1, 0.5647059, 0, 1,
-1.329498, -0.5699104, -1.58007, 1, 0.5686275, 0, 1,
-1.328926, 0.4969636, -2.116757, 1, 0.5764706, 0, 1,
-1.326399, 0.2398286, -0.2491449, 1, 0.5803922, 0, 1,
-1.32362, 1.132577, -1.860904, 1, 0.5882353, 0, 1,
-1.323535, 0.2391865, -2.101413, 1, 0.5921569, 0, 1,
-1.316952, 2.041973, -1.405627, 1, 0.6, 0, 1,
-1.311772, 1.492545, 0.02270347, 1, 0.6078432, 0, 1,
-1.303339, -0.7758297, -2.61723, 1, 0.6117647, 0, 1,
-1.299669, -1.144449, -3.433294, 1, 0.6196079, 0, 1,
-1.275337, 1.131697, 0.02084475, 1, 0.6235294, 0, 1,
-1.275307, 1.099729, -1.938658, 1, 0.6313726, 0, 1,
-1.270548, -0.7729292, -1.077536, 1, 0.6352941, 0, 1,
-1.266863, -0.7409877, -1.227655, 1, 0.6431373, 0, 1,
-1.266653, 0.4705188, -1.593449, 1, 0.6470588, 0, 1,
-1.259906, 0.1535427, -1.800579, 1, 0.654902, 0, 1,
-1.259561, -0.1012075, -0.9092743, 1, 0.6588235, 0, 1,
-1.23419, 0.99199, -1.433908, 1, 0.6666667, 0, 1,
-1.229928, 1.078169, -0.8539926, 1, 0.6705883, 0, 1,
-1.229682, -1.895055, -3.088632, 1, 0.6784314, 0, 1,
-1.226608, 0.1846895, -1.056861, 1, 0.682353, 0, 1,
-1.224334, -0.7362096, -2.372707, 1, 0.6901961, 0, 1,
-1.209095, -0.01396714, -2.847772, 1, 0.6941177, 0, 1,
-1.208799, 0.5545596, -0.09369779, 1, 0.7019608, 0, 1,
-1.208741, -0.7007186, -0.9234033, 1, 0.7098039, 0, 1,
-1.190564, -0.8385884, -0.973444, 1, 0.7137255, 0, 1,
-1.18738, -1.680547, -1.607287, 1, 0.7215686, 0, 1,
-1.184867, 0.496972, 1.271391, 1, 0.7254902, 0, 1,
-1.177283, 0.3248989, -1.144616, 1, 0.7333333, 0, 1,
-1.172037, -1.991545, -2.509253, 1, 0.7372549, 0, 1,
-1.170694, 1.037172, 0.187314, 1, 0.7450981, 0, 1,
-1.165292, 1.405771, -2.703333, 1, 0.7490196, 0, 1,
-1.163607, 0.2582398, -2.0854, 1, 0.7568628, 0, 1,
-1.157764, -0.8124007, -0.7813838, 1, 0.7607843, 0, 1,
-1.153381, 0.6515744, -1.692995, 1, 0.7686275, 0, 1,
-1.151903, 0.9444595, -0.5147195, 1, 0.772549, 0, 1,
-1.148577, -0.8752384, -4.27798, 1, 0.7803922, 0, 1,
-1.131096, -0.2638695, -1.670792, 1, 0.7843137, 0, 1,
-1.124424, 0.3013507, -0.5761125, 1, 0.7921569, 0, 1,
-1.118371, -0.003283409, -1.685593, 1, 0.7960784, 0, 1,
-1.117092, 1.905725, 0.7348672, 1, 0.8039216, 0, 1,
-1.117022, -1.325763, -2.260593, 1, 0.8117647, 0, 1,
-1.114708, -0.3808939, -2.835043, 1, 0.8156863, 0, 1,
-1.113288, -0.4422359, -2.211681, 1, 0.8235294, 0, 1,
-1.109753, 1.039334, -1.027317, 1, 0.827451, 0, 1,
-1.106066, -0.7896785, -1.299849, 1, 0.8352941, 0, 1,
-1.101697, 0.1540639, -2.676837, 1, 0.8392157, 0, 1,
-1.098885, -2.160844, -3.804639, 1, 0.8470588, 0, 1,
-1.096617, 0.05669311, -1.481792, 1, 0.8509804, 0, 1,
-1.084751, 0.4106615, -2.425952, 1, 0.8588235, 0, 1,
-1.084078, 0.2635561, 0.3597762, 1, 0.8627451, 0, 1,
-1.081201, 3.275796, -0.5346538, 1, 0.8705882, 0, 1,
-1.069858, -0.03992634, -1.101375, 1, 0.8745098, 0, 1,
-1.064868, 0.4103308, -0.02920917, 1, 0.8823529, 0, 1,
-1.052761, -0.01229805, -1.323497, 1, 0.8862745, 0, 1,
-1.05056, 1.065527, -0.4404549, 1, 0.8941177, 0, 1,
-1.042084, 1.505128, 0.7895445, 1, 0.8980392, 0, 1,
-1.035292, 1.09505, -0.2038022, 1, 0.9058824, 0, 1,
-1.030249, -0.6405427, -4.682469, 1, 0.9137255, 0, 1,
-1.027818, -0.3152466, -3.260124, 1, 0.9176471, 0, 1,
-1.022401, 0.2250674, -0.06374148, 1, 0.9254902, 0, 1,
-1.018113, -0.6936008, -1.907414, 1, 0.9294118, 0, 1,
-1.016885, -1.065612, -2.952795, 1, 0.9372549, 0, 1,
-1.009537, 0.7374673, -1.338467, 1, 0.9411765, 0, 1,
-0.9979113, -0.515525, -1.186392, 1, 0.9490196, 0, 1,
-0.9977789, 1.278008, -1.334263, 1, 0.9529412, 0, 1,
-0.9800869, -1.698431, -2.614554, 1, 0.9607843, 0, 1,
-0.9639129, 0.9639206, 0.4537109, 1, 0.9647059, 0, 1,
-0.9615815, 0.4976305, 0.5134348, 1, 0.972549, 0, 1,
-0.9576073, 0.2567436, -1.246399, 1, 0.9764706, 0, 1,
-0.937201, -0.4724815, -3.276679, 1, 0.9843137, 0, 1,
-0.9337288, 0.4179115, -0.4195213, 1, 0.9882353, 0, 1,
-0.9336514, 0.05736249, -0.6643977, 1, 0.9960784, 0, 1,
-0.9295484, -1.158001, -1.963431, 0.9960784, 1, 0, 1,
-0.9292701, -0.2775097, -3.170321, 0.9921569, 1, 0, 1,
-0.925727, 1.957953, -0.6615642, 0.9843137, 1, 0, 1,
-0.9217751, 0.05459449, -0.3155818, 0.9803922, 1, 0, 1,
-0.9195945, 1.128409, -0.9860843, 0.972549, 1, 0, 1,
-0.9056351, -0.2719388, -2.380935, 0.9686275, 1, 0, 1,
-0.8983166, 2.098564, -0.5696003, 0.9607843, 1, 0, 1,
-0.8934338, -0.3266791, -2.555304, 0.9568627, 1, 0, 1,
-0.8846988, 0.01574861, -2.2928, 0.9490196, 1, 0, 1,
-0.8818749, 0.1811636, -1.88589, 0.945098, 1, 0, 1,
-0.8801534, 0.5873948, -2.991817, 0.9372549, 1, 0, 1,
-0.8668957, -0.03837875, -0.9252748, 0.9333333, 1, 0, 1,
-0.8559307, -0.01462165, -1.013643, 0.9254902, 1, 0, 1,
-0.8496508, -1.355846, -1.520972, 0.9215686, 1, 0, 1,
-0.8481969, 0.6474833, -1.099961, 0.9137255, 1, 0, 1,
-0.8449718, 1.611827, 0.1271104, 0.9098039, 1, 0, 1,
-0.8440555, 0.4012497, 0.5540185, 0.9019608, 1, 0, 1,
-0.8336588, 0.6289684, -2.065514, 0.8941177, 1, 0, 1,
-0.832211, -0.4460314, -2.694977, 0.8901961, 1, 0, 1,
-0.8276909, 0.1629424, -2.013718, 0.8823529, 1, 0, 1,
-0.8136735, -1.34403, -2.042969, 0.8784314, 1, 0, 1,
-0.8134203, 0.2187435, -0.7047135, 0.8705882, 1, 0, 1,
-0.8124793, 0.4118316, -2.656269, 0.8666667, 1, 0, 1,
-0.8118175, -1.631279, -1.791836, 0.8588235, 1, 0, 1,
-0.802185, 1.89369, 0.1994334, 0.854902, 1, 0, 1,
-0.7996759, -0.07169302, -1.97364, 0.8470588, 1, 0, 1,
-0.7977784, 0.1824481, 0.8022763, 0.8431373, 1, 0, 1,
-0.796501, 1.793491, -0.1438967, 0.8352941, 1, 0, 1,
-0.7952063, 1.522256, 0.6543621, 0.8313726, 1, 0, 1,
-0.7927147, 0.865208, -0.394217, 0.8235294, 1, 0, 1,
-0.781934, -0.4373951, -1.256024, 0.8196079, 1, 0, 1,
-0.7808595, 0.8658397, -0.466691, 0.8117647, 1, 0, 1,
-0.7800708, -0.1203662, -1.543494, 0.8078431, 1, 0, 1,
-0.7795862, 0.5527136, -1.233183, 0.8, 1, 0, 1,
-0.7741507, 0.3338696, -1.470308, 0.7921569, 1, 0, 1,
-0.7740799, 1.10474, 0.194946, 0.7882353, 1, 0, 1,
-0.7731211, 1.173734, 1.059428, 0.7803922, 1, 0, 1,
-0.7727211, 0.1655598, -2.550545, 0.7764706, 1, 0, 1,
-0.7689432, 0.760262, 0.1615164, 0.7686275, 1, 0, 1,
-0.7628801, -0.14731, -2.03493, 0.7647059, 1, 0, 1,
-0.7614027, 1.634223, -0.6081738, 0.7568628, 1, 0, 1,
-0.7532303, 1.319759, 0.1392913, 0.7529412, 1, 0, 1,
-0.7462903, -0.6421596, -3.596827, 0.7450981, 1, 0, 1,
-0.744319, 0.6608108, -1.106051, 0.7411765, 1, 0, 1,
-0.7371653, 0.4457387, -2.608805, 0.7333333, 1, 0, 1,
-0.7325128, -0.7552701, -1.997328, 0.7294118, 1, 0, 1,
-0.7285945, -1.024828, -3.349027, 0.7215686, 1, 0, 1,
-0.7281371, -1.394278, -2.376533, 0.7176471, 1, 0, 1,
-0.7260636, -0.9847522, -2.291035, 0.7098039, 1, 0, 1,
-0.7231407, 0.3072664, 1.511154, 0.7058824, 1, 0, 1,
-0.720726, 1.997379, 0.9932357, 0.6980392, 1, 0, 1,
-0.715363, 0.4807805, -2.18189, 0.6901961, 1, 0, 1,
-0.7118663, -0.2492993, -1.118494, 0.6862745, 1, 0, 1,
-0.7066556, -1.303708, -2.316564, 0.6784314, 1, 0, 1,
-0.7066427, 0.1666632, -2.123732, 0.6745098, 1, 0, 1,
-0.6998509, -0.003791493, -3.643477, 0.6666667, 1, 0, 1,
-0.6980451, 0.0316668, -1.203903, 0.6627451, 1, 0, 1,
-0.6926332, 0.6491675, 1.052285, 0.654902, 1, 0, 1,
-0.691148, 0.09552424, -0.5648237, 0.6509804, 1, 0, 1,
-0.6883718, -0.3998774, -1.847439, 0.6431373, 1, 0, 1,
-0.6869012, 0.1691724, -1.371204, 0.6392157, 1, 0, 1,
-0.6867535, -0.2586506, -0.7249786, 0.6313726, 1, 0, 1,
-0.681711, -0.8410479, -2.824467, 0.627451, 1, 0, 1,
-0.6807247, 0.8045815, -1.587955, 0.6196079, 1, 0, 1,
-0.6697091, -1.339469, -2.755471, 0.6156863, 1, 0, 1,
-0.6685433, 0.06880547, -2.899151, 0.6078432, 1, 0, 1,
-0.6619917, 0.4832548, -2.068512, 0.6039216, 1, 0, 1,
-0.6603396, -0.2018849, -2.353231, 0.5960785, 1, 0, 1,
-0.6593035, -0.4617952, -2.793254, 0.5882353, 1, 0, 1,
-0.6583808, -0.6640574, -5.010762, 0.5843138, 1, 0, 1,
-0.6514103, 0.7161082, -1.661819, 0.5764706, 1, 0, 1,
-0.6483209, 0.8447133, -0.7723526, 0.572549, 1, 0, 1,
-0.648123, 0.9531977, -0.2695783, 0.5647059, 1, 0, 1,
-0.6478634, -0.921692, -0.1964949, 0.5607843, 1, 0, 1,
-0.6422451, -0.4011514, -1.998174, 0.5529412, 1, 0, 1,
-0.6354648, 0.5988637, -1.461431, 0.5490196, 1, 0, 1,
-0.6344811, -0.1990611, -1.708609, 0.5411765, 1, 0, 1,
-0.6319139, -0.7863846, -2.297391, 0.5372549, 1, 0, 1,
-0.6280999, 0.04476806, -2.552643, 0.5294118, 1, 0, 1,
-0.6266263, 0.541909, -0.7795836, 0.5254902, 1, 0, 1,
-0.6252084, 0.04257522, -2.87721, 0.5176471, 1, 0, 1,
-0.6233404, 0.1820274, -2.583618, 0.5137255, 1, 0, 1,
-0.6219469, 0.1327112, -0.2576546, 0.5058824, 1, 0, 1,
-0.6214598, -0.8063108, -2.422648, 0.5019608, 1, 0, 1,
-0.6210065, 0.4104545, -0.3857976, 0.4941176, 1, 0, 1,
-0.6177936, -0.2739584, -1.458818, 0.4862745, 1, 0, 1,
-0.6125472, 1.673893, -0.3071033, 0.4823529, 1, 0, 1,
-0.6125169, 0.4524004, -1.476131, 0.4745098, 1, 0, 1,
-0.6096292, 0.5388661, -2.65431, 0.4705882, 1, 0, 1,
-0.6094275, -0.5767948, -1.804158, 0.4627451, 1, 0, 1,
-0.6082912, 0.3172263, -1.95762, 0.4588235, 1, 0, 1,
-0.6079563, 1.477841, 0.1871965, 0.4509804, 1, 0, 1,
-0.606897, 0.5262488, -1.66558, 0.4470588, 1, 0, 1,
-0.5992191, 1.134517, -3.308185, 0.4392157, 1, 0, 1,
-0.59549, -0.9058998, -1.466296, 0.4352941, 1, 0, 1,
-0.5944699, 0.6724126, 0.226156, 0.427451, 1, 0, 1,
-0.5930377, -0.7165134, -5.28597, 0.4235294, 1, 0, 1,
-0.5928552, -2.171965, -2.7907, 0.4156863, 1, 0, 1,
-0.5885708, 1.710139, 0.6399012, 0.4117647, 1, 0, 1,
-0.5850821, 1.478034, -1.187608, 0.4039216, 1, 0, 1,
-0.5832511, -0.1161295, -0.6892018, 0.3960784, 1, 0, 1,
-0.5804666, -1.480873, -2.179901, 0.3921569, 1, 0, 1,
-0.5797982, 0.8754884, -1.292207, 0.3843137, 1, 0, 1,
-0.576974, -0.1665086, -1.085513, 0.3803922, 1, 0, 1,
-0.5727734, 0.7899529, 0.2938063, 0.372549, 1, 0, 1,
-0.5690506, 1.278878, 0.1202582, 0.3686275, 1, 0, 1,
-0.5609532, 0.890865, -1.222992, 0.3607843, 1, 0, 1,
-0.5574775, 1.139031, 0.8087125, 0.3568628, 1, 0, 1,
-0.5517371, 0.08561316, -1.651099, 0.3490196, 1, 0, 1,
-0.5498827, 0.1982866, -1.700037, 0.345098, 1, 0, 1,
-0.5460801, -0.3180607, 0.2231566, 0.3372549, 1, 0, 1,
-0.5436134, -0.2712013, -3.635501, 0.3333333, 1, 0, 1,
-0.5429068, 0.3794303, -0.2300406, 0.3254902, 1, 0, 1,
-0.5398214, -1.4703, -3.098414, 0.3215686, 1, 0, 1,
-0.5370614, -1.171848, -2.808124, 0.3137255, 1, 0, 1,
-0.533939, 0.4618542, -2.392411, 0.3098039, 1, 0, 1,
-0.5336375, -1.44982, -1.830782, 0.3019608, 1, 0, 1,
-0.5216658, -0.3420868, 0.226796, 0.2941177, 1, 0, 1,
-0.5209638, 0.1070331, -0.5615281, 0.2901961, 1, 0, 1,
-0.5145711, -0.4678631, -2.690818, 0.282353, 1, 0, 1,
-0.5128877, -1.142574, -2.494111, 0.2784314, 1, 0, 1,
-0.5048599, -1.168262, -2.624131, 0.2705882, 1, 0, 1,
-0.5011526, -0.5764537, -0.07490296, 0.2666667, 1, 0, 1,
-0.4983283, -2.17443, -2.337576, 0.2588235, 1, 0, 1,
-0.4959739, -0.4679986, -2.119036, 0.254902, 1, 0, 1,
-0.4940186, 1.166649, -2.813151, 0.2470588, 1, 0, 1,
-0.4913683, -1.075439, -2.983674, 0.2431373, 1, 0, 1,
-0.4900067, -0.1866897, -1.978369, 0.2352941, 1, 0, 1,
-0.4895181, -1.303552, -3.165173, 0.2313726, 1, 0, 1,
-0.4892109, -0.3669571, -2.295172, 0.2235294, 1, 0, 1,
-0.4801499, 0.1301838, -1.669259, 0.2196078, 1, 0, 1,
-0.4777067, -1.634503, -0.9764944, 0.2117647, 1, 0, 1,
-0.4724922, 1.476451, -2.736905, 0.2078431, 1, 0, 1,
-0.4721774, 3.250034, -0.9959162, 0.2, 1, 0, 1,
-0.4650135, 0.6777524, 0.4210776, 0.1921569, 1, 0, 1,
-0.4593962, -0.8204399, -3.879538, 0.1882353, 1, 0, 1,
-0.4566475, -0.2770427, -1.520453, 0.1803922, 1, 0, 1,
-0.4558155, -1.507546, -1.625622, 0.1764706, 1, 0, 1,
-0.4518417, -1.880379, -2.700838, 0.1686275, 1, 0, 1,
-0.4505022, 0.4714719, -0.4419298, 0.1647059, 1, 0, 1,
-0.4504008, 0.2877978, 0.08242659, 0.1568628, 1, 0, 1,
-0.4488352, 0.5769178, -0.3972496, 0.1529412, 1, 0, 1,
-0.4463764, -1.874722, -0.840087, 0.145098, 1, 0, 1,
-0.4458768, 0.257369, -0.4921977, 0.1411765, 1, 0, 1,
-0.4440396, -0.7377175, -1.511039, 0.1333333, 1, 0, 1,
-0.4422503, -1.650769, -1.499738, 0.1294118, 1, 0, 1,
-0.4362221, 0.9973908, -0.4623567, 0.1215686, 1, 0, 1,
-0.43522, -1.176671, -3.453278, 0.1176471, 1, 0, 1,
-0.4348365, -1.379744, -2.594279, 0.1098039, 1, 0, 1,
-0.4343928, -1.41777, -1.933909, 0.1058824, 1, 0, 1,
-0.4341858, -0.6074327, -3.374005, 0.09803922, 1, 0, 1,
-0.4286801, -1.323243, -2.408716, 0.09019608, 1, 0, 1,
-0.42099, -2.000582, -2.458812, 0.08627451, 1, 0, 1,
-0.4179841, 1.457236, 0.3815064, 0.07843138, 1, 0, 1,
-0.4155409, 0.4303997, -2.499914, 0.07450981, 1, 0, 1,
-0.4124865, -0.6787099, -4.040581, 0.06666667, 1, 0, 1,
-0.4083233, 0.02875599, -2.856232, 0.0627451, 1, 0, 1,
-0.4078196, -1.899546, -4.058699, 0.05490196, 1, 0, 1,
-0.4015728, -0.1032912, -1.280571, 0.05098039, 1, 0, 1,
-0.3974943, 0.01701436, 0.4284503, 0.04313726, 1, 0, 1,
-0.3972112, 1.328244, -1.135306, 0.03921569, 1, 0, 1,
-0.3971464, -1.447279, -4.185751, 0.03137255, 1, 0, 1,
-0.396796, -0.8054514, -3.048486, 0.02745098, 1, 0, 1,
-0.3935882, -0.3417557, -1.217283, 0.01960784, 1, 0, 1,
-0.3913665, 0.7613552, 0.3079871, 0.01568628, 1, 0, 1,
-0.390954, -0.1638221, -1.133694, 0.007843138, 1, 0, 1,
-0.3889688, -2.003345, -4.156676, 0.003921569, 1, 0, 1,
-0.3840426, 0.5607166, -0.7629113, 0, 1, 0.003921569, 1,
-0.3837021, -0.3406337, -1.325831, 0, 1, 0.01176471, 1,
-0.3835179, -0.04519267, -3.105024, 0, 1, 0.01568628, 1,
-0.3825228, -0.3294976, -1.833688, 0, 1, 0.02352941, 1,
-0.3823325, 0.03241703, -2.960791, 0, 1, 0.02745098, 1,
-0.3798022, 1.813271, -0.1218264, 0, 1, 0.03529412, 1,
-0.379629, -0.4227132, -4.203561, 0, 1, 0.03921569, 1,
-0.3769911, 0.8318181, -0.4893424, 0, 1, 0.04705882, 1,
-0.3752532, -1.034502, -4.404457, 0, 1, 0.05098039, 1,
-0.3693952, 0.4019905, -0.6843115, 0, 1, 0.05882353, 1,
-0.3686174, -1.271032, -2.941563, 0, 1, 0.0627451, 1,
-0.3648517, -0.9075942, -2.715619, 0, 1, 0.07058824, 1,
-0.3645036, 1.561124, -0.2050666, 0, 1, 0.07450981, 1,
-0.3643676, 1.050837, 0.2490632, 0, 1, 0.08235294, 1,
-0.3638366, 1.473329, 0.684846, 0, 1, 0.08627451, 1,
-0.3611984, 0.893974, -1.415758, 0, 1, 0.09411765, 1,
-0.360072, 0.1230561, -2.316803, 0, 1, 0.1019608, 1,
-0.3597641, 0.5542316, -0.537854, 0, 1, 0.1058824, 1,
-0.3559725, 0.3561661, -0.572509, 0, 1, 0.1137255, 1,
-0.3456305, 0.3873373, -0.1145488, 0, 1, 0.1176471, 1,
-0.3428015, 1.423796, 0.5613636, 0, 1, 0.1254902, 1,
-0.3397335, -0.4302437, -1.055267, 0, 1, 0.1294118, 1,
-0.3394878, -0.5567389, -1.481221, 0, 1, 0.1372549, 1,
-0.3360508, -0.8814625, -2.721282, 0, 1, 0.1411765, 1,
-0.3333523, 1.221092, -0.03272465, 0, 1, 0.1490196, 1,
-0.3330916, -0.7091783, -3.521511, 0, 1, 0.1529412, 1,
-0.3317048, -1.908325, -3.472226, 0, 1, 0.1607843, 1,
-0.3312787, 0.2385789, -1.044589, 0, 1, 0.1647059, 1,
-0.3311944, -1.228924, -2.134399, 0, 1, 0.172549, 1,
-0.3179728, 0.9245389, 0.7729698, 0, 1, 0.1764706, 1,
-0.3090934, -2.155784, -3.058099, 0, 1, 0.1843137, 1,
-0.30182, 0.570227, 0.3178955, 0, 1, 0.1882353, 1,
-0.2989989, 0.00337255, -3.538429, 0, 1, 0.1960784, 1,
-0.2982185, 0.5045099, -0.4634919, 0, 1, 0.2039216, 1,
-0.2974108, 1.231254, -0.008592055, 0, 1, 0.2078431, 1,
-0.2972807, 0.08546918, -2.50345, 0, 1, 0.2156863, 1,
-0.2952583, -0.79717, -3.528141, 0, 1, 0.2196078, 1,
-0.2922356, 1.402187, 0.6061975, 0, 1, 0.227451, 1,
-0.2824626, 1.185872, 1.034876, 0, 1, 0.2313726, 1,
-0.2784419, 0.9610246, -0.7355831, 0, 1, 0.2392157, 1,
-0.2765976, -2.021358, -2.713109, 0, 1, 0.2431373, 1,
-0.2731454, 0.1514964, -1.549176, 0, 1, 0.2509804, 1,
-0.271515, 0.1490388, -0.3252919, 0, 1, 0.254902, 1,
-0.2690921, 2.535847, -1.490383, 0, 1, 0.2627451, 1,
-0.2602318, 0.3729566, -2.850431, 0, 1, 0.2666667, 1,
-0.2597618, 0.3372886, -0.01733213, 0, 1, 0.2745098, 1,
-0.2596239, -1.300619, -3.373657, 0, 1, 0.2784314, 1,
-0.2576163, 2.136652, 0.4983865, 0, 1, 0.2862745, 1,
-0.2521771, 1.12224, 1.151206, 0, 1, 0.2901961, 1,
-0.2462711, -0.8309911, -2.723272, 0, 1, 0.2980392, 1,
-0.24512, -0.5952869, -3.00709, 0, 1, 0.3058824, 1,
-0.2445728, -0.5027164, -2.568841, 0, 1, 0.3098039, 1,
-0.2418705, -0.5797624, -3.679242, 0, 1, 0.3176471, 1,
-0.241724, -0.3343447, -2.840638, 0, 1, 0.3215686, 1,
-0.2401546, 0.7245003, 0.7755988, 0, 1, 0.3294118, 1,
-0.2374987, -0.1597813, -2.164201, 0, 1, 0.3333333, 1,
-0.2368056, 0.633657, 0.4722388, 0, 1, 0.3411765, 1,
-0.2298303, 1.833341, -0.150107, 0, 1, 0.345098, 1,
-0.2282754, -1.045887, -3.31688, 0, 1, 0.3529412, 1,
-0.2279845, 1.260208, -0.4469108, 0, 1, 0.3568628, 1,
-0.2271374, -0.6962847, -2.619187, 0, 1, 0.3647059, 1,
-0.2198969, 0.1197392, -0.7456438, 0, 1, 0.3686275, 1,
-0.2168642, 0.8603363, -2.070608, 0, 1, 0.3764706, 1,
-0.2142422, 0.4964275, -0.4870825, 0, 1, 0.3803922, 1,
-0.2121365, 0.6199335, 0.3789944, 0, 1, 0.3882353, 1,
-0.2104082, 0.3942612, -0.411941, 0, 1, 0.3921569, 1,
-0.2085689, 1.174687, 1.337547, 0, 1, 0.4, 1,
-0.2069111, 0.03803039, -1.043824, 0, 1, 0.4078431, 1,
-0.2063899, 0.778699, -0.3791107, 0, 1, 0.4117647, 1,
-0.206091, 0.6444569, -1.699208, 0, 1, 0.4196078, 1,
-0.2057061, -0.05357405, -2.216887, 0, 1, 0.4235294, 1,
-0.2015228, 1.620703, -0.04379078, 0, 1, 0.4313726, 1,
-0.197781, -0.1174871, -3.011867, 0, 1, 0.4352941, 1,
-0.196549, -0.4141853, -2.516164, 0, 1, 0.4431373, 1,
-0.1955437, -0.312667, -2.805344, 0, 1, 0.4470588, 1,
-0.1951183, -1.746057, -5.200771, 0, 1, 0.454902, 1,
-0.1950741, 1.022021, -0.9173348, 0, 1, 0.4588235, 1,
-0.1939791, -0.2683751, -1.853351, 0, 1, 0.4666667, 1,
-0.1934572, -0.4374516, -2.135578, 0, 1, 0.4705882, 1,
-0.1907937, -0.3119366, -1.209015, 0, 1, 0.4784314, 1,
-0.1898605, 1.07587, -0.206192, 0, 1, 0.4823529, 1,
-0.1849004, 0.5582041, -0.1200898, 0, 1, 0.4901961, 1,
-0.1844702, 0.04226484, -1.662572, 0, 1, 0.4941176, 1,
-0.1823429, 1.510239, -1.168661, 0, 1, 0.5019608, 1,
-0.1804691, -0.3710096, -3.842087, 0, 1, 0.509804, 1,
-0.1747789, -1.126222, -2.670464, 0, 1, 0.5137255, 1,
-0.1715142, 2.265094, -1.785747, 0, 1, 0.5215687, 1,
-0.1707865, 0.196054, -1.421946, 0, 1, 0.5254902, 1,
-0.1604674, 1.30844, -0.6863163, 0, 1, 0.5333334, 1,
-0.1573077, -1.272329, -1.393365, 0, 1, 0.5372549, 1,
-0.1557486, -0.3379317, -3.859398, 0, 1, 0.5450981, 1,
-0.1543468, -1.049587, -3.451056, 0, 1, 0.5490196, 1,
-0.1535977, -0.1661535, -2.51247, 0, 1, 0.5568628, 1,
-0.1468229, -0.5387735, -2.481686, 0, 1, 0.5607843, 1,
-0.1454642, 0.8790229, -0.156361, 0, 1, 0.5686275, 1,
-0.1411676, 0.8448105, 0.4968153, 0, 1, 0.572549, 1,
-0.1408868, -2.614128, -2.507844, 0, 1, 0.5803922, 1,
-0.134616, 1.724217, -1.214343, 0, 1, 0.5843138, 1,
-0.1344538, 0.9771425, -0.1333557, 0, 1, 0.5921569, 1,
-0.1337266, 1.859967, 0.01335984, 0, 1, 0.5960785, 1,
-0.1314223, -2.64824, -3.356, 0, 1, 0.6039216, 1,
-0.1308421, -0.1183086, -0.3829229, 0, 1, 0.6117647, 1,
-0.1272416, 0.5338889, 0.801968, 0, 1, 0.6156863, 1,
-0.1246604, 1.253965, 1.349228, 0, 1, 0.6235294, 1,
-0.1238834, -1.2625, -3.580493, 0, 1, 0.627451, 1,
-0.120883, 1.161043, 0.5877919, 0, 1, 0.6352941, 1,
-0.1204397, 1.865505, 0.4387633, 0, 1, 0.6392157, 1,
-0.1196829, 2.291537, 0.7265944, 0, 1, 0.6470588, 1,
-0.1184603, -2.494369, -5.300251, 0, 1, 0.6509804, 1,
-0.1153425, -0.6015109, -3.118878, 0, 1, 0.6588235, 1,
-0.1093509, -0.2218334, -2.502496, 0, 1, 0.6627451, 1,
-0.1048154, 0.1420443, -1.161054, 0, 1, 0.6705883, 1,
-0.1024697, -0.9927754, -3.575573, 0, 1, 0.6745098, 1,
-0.1006171, 2.298674, -1.305207, 0, 1, 0.682353, 1,
-0.09564283, -0.6078802, -3.649794, 0, 1, 0.6862745, 1,
-0.08898444, -1.872702, -4.036571, 0, 1, 0.6941177, 1,
-0.08763426, -0.3180896, -2.082562, 0, 1, 0.7019608, 1,
-0.08096316, 0.4836159, -1.171429, 0, 1, 0.7058824, 1,
-0.07842845, 0.4034231, -2.279252, 0, 1, 0.7137255, 1,
-0.07299673, -0.6724997, -4.666806, 0, 1, 0.7176471, 1,
-0.06516993, -1.560794, -2.533743, 0, 1, 0.7254902, 1,
-0.0648286, 0.0469925, 0.6186962, 0, 1, 0.7294118, 1,
-0.06117546, -1.10032, -3.035831, 0, 1, 0.7372549, 1,
-0.06079304, 0.07597145, -1.529969, 0, 1, 0.7411765, 1,
-0.05919986, -0.3232515, -3.315062, 0, 1, 0.7490196, 1,
-0.05908439, 0.1808047, 0.6740807, 0, 1, 0.7529412, 1,
-0.05663328, 0.8479084, -0.691026, 0, 1, 0.7607843, 1,
-0.05090262, -0.08855847, -2.07155, 0, 1, 0.7647059, 1,
-0.05043326, 0.3069426, -0.03028799, 0, 1, 0.772549, 1,
-0.03982611, 1.102412, -1.795147, 0, 1, 0.7764706, 1,
-0.03981546, 0.02403339, -0.4669455, 0, 1, 0.7843137, 1,
-0.03833235, -0.5403059, -3.4504, 0, 1, 0.7882353, 1,
-0.03615963, -0.1332705, -2.746653, 0, 1, 0.7960784, 1,
-0.03608278, -0.4032456, -2.765157, 0, 1, 0.8039216, 1,
-0.03545472, 0.7366791, 1.002503, 0, 1, 0.8078431, 1,
-0.03361807, -1.049092, -3.777551, 0, 1, 0.8156863, 1,
-0.02678291, 1.574961, 0.08824389, 0, 1, 0.8196079, 1,
-0.02553305, -0.5934053, -4.333136, 0, 1, 0.827451, 1,
-0.01458717, -0.07556812, -2.972739, 0, 1, 0.8313726, 1,
-0.01364309, 1.23108, 0.1072367, 0, 1, 0.8392157, 1,
-0.008843794, 1.226956, 1.339139, 0, 1, 0.8431373, 1,
-0.0083847, -2.171439, -2.817855, 0, 1, 0.8509804, 1,
-0.007593843, 0.9929228, 0.3858873, 0, 1, 0.854902, 1,
-0.006065196, 0.3182693, -0.5886974, 0, 1, 0.8627451, 1,
-0.005874236, 1.442513, -0.7996884, 0, 1, 0.8666667, 1,
-0.00243049, -1.562997, -4.263992, 0, 1, 0.8745098, 1,
0.002864321, -1.325434, 3.342143, 0, 1, 0.8784314, 1,
0.003607105, -0.8188807, 3.256802, 0, 1, 0.8862745, 1,
0.009456315, 0.8779984, -0.2245194, 0, 1, 0.8901961, 1,
0.00997923, 0.4409565, -1.001041, 0, 1, 0.8980392, 1,
0.01092503, -0.4100169, 4.564721, 0, 1, 0.9058824, 1,
0.0111965, 0.3339663, 0.4943061, 0, 1, 0.9098039, 1,
0.01140481, 0.6750947, 1.847118, 0, 1, 0.9176471, 1,
0.01340051, 0.9502034, -2.671483, 0, 1, 0.9215686, 1,
0.01359487, 0.1403504, 0.8255207, 0, 1, 0.9294118, 1,
0.01867947, 0.5458402, 1.652434, 0, 1, 0.9333333, 1,
0.02121366, -0.6795259, 2.211279, 0, 1, 0.9411765, 1,
0.02477926, 0.2104135, 1.244452, 0, 1, 0.945098, 1,
0.02751958, -0.3092262, 3.52256, 0, 1, 0.9529412, 1,
0.02797343, -0.6448205, 4.225434, 0, 1, 0.9568627, 1,
0.02962077, 2.187589, 0.1595162, 0, 1, 0.9647059, 1,
0.03216457, -0.09213768, 4.254263, 0, 1, 0.9686275, 1,
0.03561578, -1.236859, 3.806634, 0, 1, 0.9764706, 1,
0.03662926, 0.2868027, 0.3642552, 0, 1, 0.9803922, 1,
0.04023204, -0.8405511, 4.404356, 0, 1, 0.9882353, 1,
0.04080362, -0.05841847, 1.053286, 0, 1, 0.9921569, 1,
0.04360235, 0.3438079, 0.5906448, 0, 1, 1, 1,
0.04733006, -1.214912, 3.583939, 0, 0.9921569, 1, 1,
0.04965109, 1.183809, 0.08867604, 0, 0.9882353, 1, 1,
0.05306682, -1.256847, 2.04823, 0, 0.9803922, 1, 1,
0.05354822, -0.06628627, 2.672031, 0, 0.9764706, 1, 1,
0.05422438, 0.688136, 0.7987524, 0, 0.9686275, 1, 1,
0.05525264, -1.232569, 3.204092, 0, 0.9647059, 1, 1,
0.05594296, 1.64459, 0.02099543, 0, 0.9568627, 1, 1,
0.05929223, -0.3112646, 2.524257, 0, 0.9529412, 1, 1,
0.05936148, 0.8167735, -0.8791655, 0, 0.945098, 1, 1,
0.06183786, -0.9393554, 3.383611, 0, 0.9411765, 1, 1,
0.06535561, -1.018461, 4.888757, 0, 0.9333333, 1, 1,
0.06702475, 0.5618854, -1.243263, 0, 0.9294118, 1, 1,
0.07520124, -0.3319093, 2.596813, 0, 0.9215686, 1, 1,
0.07660827, -0.3375179, 2.342841, 0, 0.9176471, 1, 1,
0.07945643, 0.8816235, 1.313299, 0, 0.9098039, 1, 1,
0.08294293, 0.4110236, 0.2661041, 0, 0.9058824, 1, 1,
0.08348265, -0.8515488, 4.053575, 0, 0.8980392, 1, 1,
0.0835819, -1.221287, 2.906529, 0, 0.8901961, 1, 1,
0.08370209, 0.5110154, 0.5793304, 0, 0.8862745, 1, 1,
0.08392693, -0.5602669, 3.538667, 0, 0.8784314, 1, 1,
0.08953965, -0.8408949, 2.376541, 0, 0.8745098, 1, 1,
0.09241705, -1.823445, 3.440845, 0, 0.8666667, 1, 1,
0.09375752, -0.4664088, 2.3015, 0, 0.8627451, 1, 1,
0.09427481, 1.843851, -0.6820134, 0, 0.854902, 1, 1,
0.09543681, -0.7176192, 1.071266, 0, 0.8509804, 1, 1,
0.1013195, -1.729852, 2.835878, 0, 0.8431373, 1, 1,
0.1020149, -1.591623, 0.8201771, 0, 0.8392157, 1, 1,
0.1037258, 1.41307, -0.6970419, 0, 0.8313726, 1, 1,
0.1054206, -0.8955082, 4.084948, 0, 0.827451, 1, 1,
0.1059857, 0.3925717, 0.2125947, 0, 0.8196079, 1, 1,
0.1070962, 0.6339759, -0.8640125, 0, 0.8156863, 1, 1,
0.1092604, 1.060847, 0.5312191, 0, 0.8078431, 1, 1,
0.1122316, 1.378462, -2.97556, 0, 0.8039216, 1, 1,
0.1213291, -0.8072084, 4.452625, 0, 0.7960784, 1, 1,
0.1231329, -0.475903, 3.093997, 0, 0.7882353, 1, 1,
0.1301316, -0.2565788, 3.474957, 0, 0.7843137, 1, 1,
0.1301694, -0.4820141, 2.019089, 0, 0.7764706, 1, 1,
0.131742, 1.415865, 0.6234387, 0, 0.772549, 1, 1,
0.1349981, -0.1404877, 2.931474, 0, 0.7647059, 1, 1,
0.1354653, 0.6118853, 0.6003136, 0, 0.7607843, 1, 1,
0.1365659, 1.11273, 1.852643, 0, 0.7529412, 1, 1,
0.1383295, 1.327384, -0.03435575, 0, 0.7490196, 1, 1,
0.1424107, 0.1832674, -0.2024314, 0, 0.7411765, 1, 1,
0.1494577, 0.08089545, 2.321234, 0, 0.7372549, 1, 1,
0.1534419, -0.1473367, 2.080556, 0, 0.7294118, 1, 1,
0.1564319, 0.5275689, 2.042374, 0, 0.7254902, 1, 1,
0.1595347, 0.7663336, -1.509553, 0, 0.7176471, 1, 1,
0.1605013, -0.2342623, 2.72735, 0, 0.7137255, 1, 1,
0.1617046, 0.00414428, 2.941845, 0, 0.7058824, 1, 1,
0.1617752, 0.3840664, 1.630074, 0, 0.6980392, 1, 1,
0.1635294, 1.090795, 1.2109, 0, 0.6941177, 1, 1,
0.1732303, -0.4857855, 3.026219, 0, 0.6862745, 1, 1,
0.1754771, -1.645629, 2.705233, 0, 0.682353, 1, 1,
0.1772624, 0.8245643, 1.346673, 0, 0.6745098, 1, 1,
0.179211, 0.4521555, 1.536823, 0, 0.6705883, 1, 1,
0.1800734, 0.6414385, 0.1074525, 0, 0.6627451, 1, 1,
0.1827421, 1.25883, 0.550038, 0, 0.6588235, 1, 1,
0.1843305, -1.96726, 2.273093, 0, 0.6509804, 1, 1,
0.1843701, 1.106873, 0.5099481, 0, 0.6470588, 1, 1,
0.1852202, 0.06256968, 2.400055, 0, 0.6392157, 1, 1,
0.1856247, 0.3415577, 2.08555, 0, 0.6352941, 1, 1,
0.1906388, -1.162283, 3.262779, 0, 0.627451, 1, 1,
0.1932305, 2.732522, 0.7086517, 0, 0.6235294, 1, 1,
0.1937801, -0.59507, 2.311806, 0, 0.6156863, 1, 1,
0.2014276, 1.206105, 1.020809, 0, 0.6117647, 1, 1,
0.2018491, -0.5354437, 1.704347, 0, 0.6039216, 1, 1,
0.203326, -0.8817013, 3.277307, 0, 0.5960785, 1, 1,
0.2065682, 0.6545535, 1.396881, 0, 0.5921569, 1, 1,
0.2070096, -0.2237222, 2.807639, 0, 0.5843138, 1, 1,
0.2088459, 0.2649507, 0.01061762, 0, 0.5803922, 1, 1,
0.2088527, -1.276617, 1.802728, 0, 0.572549, 1, 1,
0.2093494, 1.631889, -0.2470302, 0, 0.5686275, 1, 1,
0.2113771, -0.3964897, 3.563991, 0, 0.5607843, 1, 1,
0.2115545, -0.3964587, 2.482906, 0, 0.5568628, 1, 1,
0.2120685, 2.027534, 1.074474, 0, 0.5490196, 1, 1,
0.2168961, 0.3878413, -0.2065434, 0, 0.5450981, 1, 1,
0.2183811, -0.7913539, 3.207293, 0, 0.5372549, 1, 1,
0.2198598, 0.02388902, 2.72294, 0, 0.5333334, 1, 1,
0.2200818, -1.863034, 1.994117, 0, 0.5254902, 1, 1,
0.2228225, -1.522918, 3.823081, 0, 0.5215687, 1, 1,
0.2256704, -1.093101, 2.575414, 0, 0.5137255, 1, 1,
0.2265942, 1.452608, 0.8139672, 0, 0.509804, 1, 1,
0.2281071, -1.135599, 2.538386, 0, 0.5019608, 1, 1,
0.2288925, 1.39059, -1.349763, 0, 0.4941176, 1, 1,
0.229893, -0.3614516, 0.2388403, 0, 0.4901961, 1, 1,
0.2339301, 1.389132, 0.4476102, 0, 0.4823529, 1, 1,
0.2408969, 1.515244, -0.02077289, 0, 0.4784314, 1, 1,
0.2420678, 0.5294818, 1.523402, 0, 0.4705882, 1, 1,
0.2421924, -1.563313, 3.056948, 0, 0.4666667, 1, 1,
0.2429725, 0.7594593, -0.454528, 0, 0.4588235, 1, 1,
0.2478552, -0.4158557, 2.588474, 0, 0.454902, 1, 1,
0.2493751, -0.847143, 1.538711, 0, 0.4470588, 1, 1,
0.249884, -1.859474, 2.525961, 0, 0.4431373, 1, 1,
0.2534611, -0.1259099, 1.575939, 0, 0.4352941, 1, 1,
0.2540194, -0.3956051, 1.678464, 0, 0.4313726, 1, 1,
0.2563863, -0.0699539, 2.591169, 0, 0.4235294, 1, 1,
0.2681644, 0.7955453, 0.07090419, 0, 0.4196078, 1, 1,
0.2683594, -0.4854807, 2.293379, 0, 0.4117647, 1, 1,
0.2753262, 0.5057716, 1.571409, 0, 0.4078431, 1, 1,
0.279772, -0.4562759, 1.134259, 0, 0.4, 1, 1,
0.2806389, -0.2263511, 3.274172, 0, 0.3921569, 1, 1,
0.2829857, -1.363042, 4.204268, 0, 0.3882353, 1, 1,
0.2871552, 0.7285385, 0.5366682, 0, 0.3803922, 1, 1,
0.2908163, 1.223966, -0.09664177, 0, 0.3764706, 1, 1,
0.2972626, 2.564925, -0.5557756, 0, 0.3686275, 1, 1,
0.2988821, 1.465648, 1.754739, 0, 0.3647059, 1, 1,
0.2990362, 0.1965568, 0.4315984, 0, 0.3568628, 1, 1,
0.3107435, -0.06147568, 2.857022, 0, 0.3529412, 1, 1,
0.3140997, -0.3316833, 1.262546, 0, 0.345098, 1, 1,
0.3168151, 0.7444409, 0.9306396, 0, 0.3411765, 1, 1,
0.3222176, 0.3617702, -0.00615729, 0, 0.3333333, 1, 1,
0.327928, 1.901483, -1.861992, 0, 0.3294118, 1, 1,
0.3299215, -3.001991, 3.809519, 0, 0.3215686, 1, 1,
0.3344507, 0.248329, 1.384044, 0, 0.3176471, 1, 1,
0.338373, 0.513006, 2.012981, 0, 0.3098039, 1, 1,
0.338673, 0.4991079, -1.228787, 0, 0.3058824, 1, 1,
0.3400281, -0.3365709, 1.550448, 0, 0.2980392, 1, 1,
0.3405091, 1.959273, 1.178173, 0, 0.2901961, 1, 1,
0.3443298, 0.6393819, 1.573575, 0, 0.2862745, 1, 1,
0.3459775, -1.802435, 1.588679, 0, 0.2784314, 1, 1,
0.3464452, 2.18804, 1.883821, 0, 0.2745098, 1, 1,
0.347689, 0.5790154, 0.1033202, 0, 0.2666667, 1, 1,
0.3480153, -1.033908, 1.566159, 0, 0.2627451, 1, 1,
0.3491243, 0.421398, 0.9963837, 0, 0.254902, 1, 1,
0.3494373, -0.3829039, 3.579616, 0, 0.2509804, 1, 1,
0.3495362, -1.092424, 4.216367, 0, 0.2431373, 1, 1,
0.3524405, 1.318246, 0.2293032, 0, 0.2392157, 1, 1,
0.3599276, -1.724321, 2.968752, 0, 0.2313726, 1, 1,
0.3605901, 0.8805459, 1.005427, 0, 0.227451, 1, 1,
0.3623248, 0.589144, 1.513968, 0, 0.2196078, 1, 1,
0.3625142, -0.5420299, 2.711993, 0, 0.2156863, 1, 1,
0.3627383, 1.102808, -1.697592, 0, 0.2078431, 1, 1,
0.3706385, 0.7296182, -0.6125857, 0, 0.2039216, 1, 1,
0.3717361, 0.3482929, 0.8477516, 0, 0.1960784, 1, 1,
0.3749363, -0.2193634, 1.887438, 0, 0.1882353, 1, 1,
0.3749642, 0.08905175, 1.780174, 0, 0.1843137, 1, 1,
0.3763086, 1.223783, -0.1102115, 0, 0.1764706, 1, 1,
0.3769569, -2.569408, 3.915298, 0, 0.172549, 1, 1,
0.3796928, 0.3098407, 0.4085737, 0, 0.1647059, 1, 1,
0.3798777, 0.3394311, 0.8333147, 0, 0.1607843, 1, 1,
0.3891572, -0.5247219, 2.337606, 0, 0.1529412, 1, 1,
0.3901344, -1.358836, 1.98721, 0, 0.1490196, 1, 1,
0.3910266, -1.884051, 1.73321, 0, 0.1411765, 1, 1,
0.3912904, 2.391031, -0.6510194, 0, 0.1372549, 1, 1,
0.3942255, 0.3304688, 2.57306, 0, 0.1294118, 1, 1,
0.3980284, -0.5112783, 4.738347, 0, 0.1254902, 1, 1,
0.4067146, 0.2267917, 1.579182, 0, 0.1176471, 1, 1,
0.4083355, 0.6856163, 0.9984426, 0, 0.1137255, 1, 1,
0.4093525, 0.9815716, -0.260991, 0, 0.1058824, 1, 1,
0.4155015, 2.156324, 0.2697647, 0, 0.09803922, 1, 1,
0.417685, 0.0203311, 1.307886, 0, 0.09411765, 1, 1,
0.4199311, -1.925263, 0.7254851, 0, 0.08627451, 1, 1,
0.4199964, -0.4338942, 1.479085, 0, 0.08235294, 1, 1,
0.4256448, 0.03253241, 2.657985, 0, 0.07450981, 1, 1,
0.4337195, 0.06578047, 1.206262, 0, 0.07058824, 1, 1,
0.4339799, -0.141674, 2.941819, 0, 0.0627451, 1, 1,
0.4431975, -0.3358552, 2.37182, 0, 0.05882353, 1, 1,
0.4441954, -1.538925, 3.198875, 0, 0.05098039, 1, 1,
0.4464666, -0.4474705, 2.926228, 0, 0.04705882, 1, 1,
0.4468516, -1.121964, 1.467601, 0, 0.03921569, 1, 1,
0.4474386, 2.566872, -0.3208877, 0, 0.03529412, 1, 1,
0.4493473, 0.1990184, 1.212623, 0, 0.02745098, 1, 1,
0.4539183, 0.3750579, 3.038947, 0, 0.02352941, 1, 1,
0.4540115, 1.288073, 0.4584757, 0, 0.01568628, 1, 1,
0.4614299, -0.2549264, 1.072972, 0, 0.01176471, 1, 1,
0.4636632, -1.644924, 0.8406242, 0, 0.003921569, 1, 1,
0.4649643, -0.728363, 2.185287, 0.003921569, 0, 1, 1,
0.4655232, -1.773886, 5.082071, 0.007843138, 0, 1, 1,
0.4660894, -0.3012433, 2.408983, 0.01568628, 0, 1, 1,
0.4725289, -1.914393, 3.239004, 0.01960784, 0, 1, 1,
0.4733409, -1.755561, 3.156683, 0.02745098, 0, 1, 1,
0.4750346, 0.4459952, 2.715339, 0.03137255, 0, 1, 1,
0.4775799, -0.5998746, 4.427203, 0.03921569, 0, 1, 1,
0.4783131, -0.9636799, 3.043758, 0.04313726, 0, 1, 1,
0.4829687, -1.100134, 2.973986, 0.05098039, 0, 1, 1,
0.4830267, 0.9302397, 2.197914, 0.05490196, 0, 1, 1,
0.4845706, -1.50656, 4.32782, 0.0627451, 0, 1, 1,
0.4889434, -1.612596, 3.319657, 0.06666667, 0, 1, 1,
0.4910958, -1.004243, 2.927061, 0.07450981, 0, 1, 1,
0.4933532, 1.101963, 0.1192758, 0.07843138, 0, 1, 1,
0.4936717, 0.2250407, 2.278797, 0.08627451, 0, 1, 1,
0.4941373, -0.3952403, 1.652799, 0.09019608, 0, 1, 1,
0.4974603, -0.1663826, 2.525781, 0.09803922, 0, 1, 1,
0.4989533, 0.3651873, 0.8119264, 0.1058824, 0, 1, 1,
0.5003396, 0.8515796, -0.501785, 0.1098039, 0, 1, 1,
0.5018364, 0.6590363, -2.444715, 0.1176471, 0, 1, 1,
0.5036406, -1.564303, 4.272869, 0.1215686, 0, 1, 1,
0.5132387, 1.201606, 0.2855206, 0.1294118, 0, 1, 1,
0.515892, -0.1841252, 2.087246, 0.1333333, 0, 1, 1,
0.5188612, -1.229984, 3.473262, 0.1411765, 0, 1, 1,
0.5259112, -0.1877043, 2.211024, 0.145098, 0, 1, 1,
0.5270786, 1.245077, -0.4469685, 0.1529412, 0, 1, 1,
0.5296716, -1.094775, 2.480223, 0.1568628, 0, 1, 1,
0.5350456, 0.5662422, 1.694481, 0.1647059, 0, 1, 1,
0.5395232, -0.3813888, 2.614378, 0.1686275, 0, 1, 1,
0.5419893, 1.634152, 0.3290909, 0.1764706, 0, 1, 1,
0.5464748, -0.548867, 2.246004, 0.1803922, 0, 1, 1,
0.5472472, -0.3211108, 1.739434, 0.1882353, 0, 1, 1,
0.5539847, -0.757957, 1.958618, 0.1921569, 0, 1, 1,
0.5581856, 0.1504234, 3.759393, 0.2, 0, 1, 1,
0.5591902, -0.4005848, 2.250645, 0.2078431, 0, 1, 1,
0.5601484, 1.058877, 1.251797, 0.2117647, 0, 1, 1,
0.560167, 2.054293, 1.033007, 0.2196078, 0, 1, 1,
0.5670443, -2.425489, 1.827065, 0.2235294, 0, 1, 1,
0.5733328, 1.084549, 2.166459, 0.2313726, 0, 1, 1,
0.5737371, -0.2587064, 1.824099, 0.2352941, 0, 1, 1,
0.5747401, -0.3652522, 2.570979, 0.2431373, 0, 1, 1,
0.5773658, -0.1118797, -0.4181629, 0.2470588, 0, 1, 1,
0.5847605, -1.419534, 1.838009, 0.254902, 0, 1, 1,
0.5847957, -0.8229289, 1.433531, 0.2588235, 0, 1, 1,
0.5852057, -0.4542358, 0.2268166, 0.2666667, 0, 1, 1,
0.5855322, -0.8219023, 2.292779, 0.2705882, 0, 1, 1,
0.596354, -1.259359, 2.251891, 0.2784314, 0, 1, 1,
0.5986674, 0.3048626, -0.5930299, 0.282353, 0, 1, 1,
0.6006895, 0.1552292, 0.8933909, 0.2901961, 0, 1, 1,
0.6013693, -0.9859655, 2.865734, 0.2941177, 0, 1, 1,
0.6047221, 0.8820332, 1.872179, 0.3019608, 0, 1, 1,
0.6084833, 0.2565791, 0.3401848, 0.3098039, 0, 1, 1,
0.6144957, -0.9680285, 1.182392, 0.3137255, 0, 1, 1,
0.6147803, 0.07581408, 1.070177, 0.3215686, 0, 1, 1,
0.6179712, -0.8879972, 3.711894, 0.3254902, 0, 1, 1,
0.621052, 0.450668, 2.074997, 0.3333333, 0, 1, 1,
0.6258584, -1.547643, 1.159408, 0.3372549, 0, 1, 1,
0.6286073, 1.063957, 0.1487391, 0.345098, 0, 1, 1,
0.6299567, -1.252641, 2.682293, 0.3490196, 0, 1, 1,
0.6335956, -1.338272, 3.197911, 0.3568628, 0, 1, 1,
0.6366078, -0.5933048, 1.218308, 0.3607843, 0, 1, 1,
0.643818, -0.3438452, 1.649313, 0.3686275, 0, 1, 1,
0.6459268, -1.763907, 0.4996153, 0.372549, 0, 1, 1,
0.6492344, 0.2428616, 1.986166, 0.3803922, 0, 1, 1,
0.6530573, 0.5864852, 0.4795988, 0.3843137, 0, 1, 1,
0.6565772, 0.5788736, 0.5264359, 0.3921569, 0, 1, 1,
0.6575907, -0.4428053, 2.812134, 0.3960784, 0, 1, 1,
0.6636027, 0.689186, -0.6893353, 0.4039216, 0, 1, 1,
0.6658812, 1.591809, -0.7141711, 0.4117647, 0, 1, 1,
0.666195, 1.477441, -1.087341, 0.4156863, 0, 1, 1,
0.6683716, 0.4622995, 0.5322098, 0.4235294, 0, 1, 1,
0.6713324, 0.1140186, 2.1463, 0.427451, 0, 1, 1,
0.6727275, -0.7674421, 1.299861, 0.4352941, 0, 1, 1,
0.6728857, 0.006852983, 0.3862588, 0.4392157, 0, 1, 1,
0.6736635, -0.005135086, 2.925272, 0.4470588, 0, 1, 1,
0.6784481, 0.6565286, 0.4619589, 0.4509804, 0, 1, 1,
0.6839017, -0.2722122, 1.383471, 0.4588235, 0, 1, 1,
0.6882089, -0.2645964, 2.675606, 0.4627451, 0, 1, 1,
0.6884767, 0.2975186, 2.162163, 0.4705882, 0, 1, 1,
0.6888459, -0.1312088, 3.270803, 0.4745098, 0, 1, 1,
0.6908736, 0.08756886, 1.425501, 0.4823529, 0, 1, 1,
0.6931227, -0.2664323, -0.6332368, 0.4862745, 0, 1, 1,
0.6945432, 1.343661, 0.8199108, 0.4941176, 0, 1, 1,
0.6952557, 0.005855503, 2.568534, 0.5019608, 0, 1, 1,
0.6980507, 0.4764661, 0.8311485, 0.5058824, 0, 1, 1,
0.6987711, 0.8347673, 0.5116929, 0.5137255, 0, 1, 1,
0.6998087, 1.041445, 1.420012, 0.5176471, 0, 1, 1,
0.7015388, -1.074855, 1.398791, 0.5254902, 0, 1, 1,
0.7017443, -0.3068026, 2.183142, 0.5294118, 0, 1, 1,
0.7059152, 0.6710801, 2.927397, 0.5372549, 0, 1, 1,
0.7142473, -2.353783, 3.465103, 0.5411765, 0, 1, 1,
0.7171566, -1.396217, 1.941207, 0.5490196, 0, 1, 1,
0.7181745, -0.9969373, 3.329659, 0.5529412, 0, 1, 1,
0.7193304, -1.652905, 0.6441332, 0.5607843, 0, 1, 1,
0.7210632, 1.107096, 1.95195, 0.5647059, 0, 1, 1,
0.7269351, 0.1253046, 1.843874, 0.572549, 0, 1, 1,
0.7277609, -0.83938, 4.522146, 0.5764706, 0, 1, 1,
0.7298261, -2.046545, 3.976815, 0.5843138, 0, 1, 1,
0.7341012, -0.608407, 3.221489, 0.5882353, 0, 1, 1,
0.7345351, 1.27052, 1.252136, 0.5960785, 0, 1, 1,
0.7360288, 1.8864, 0.4719053, 0.6039216, 0, 1, 1,
0.7423787, -0.9582155, 1.788246, 0.6078432, 0, 1, 1,
0.7538969, -0.3408502, 0.7640471, 0.6156863, 0, 1, 1,
0.7596541, 1.019252, 0.1440167, 0.6196079, 0, 1, 1,
0.7615705, 1.248963, 0.8401712, 0.627451, 0, 1, 1,
0.7624685, 0.8132731, 2.688374, 0.6313726, 0, 1, 1,
0.7624829, 1.036366, 1.624187, 0.6392157, 0, 1, 1,
0.7647969, -0.4466207, 1.402717, 0.6431373, 0, 1, 1,
0.7672362, -0.007328042, -0.07736545, 0.6509804, 0, 1, 1,
0.767341, -0.1405076, 0.9576268, 0.654902, 0, 1, 1,
0.7700352, 0.3078197, 2.274111, 0.6627451, 0, 1, 1,
0.7758926, 0.6919085, 1.142798, 0.6666667, 0, 1, 1,
0.7777168, 0.5774508, 1.415035, 0.6745098, 0, 1, 1,
0.7864585, 1.104987, 3.090268, 0.6784314, 0, 1, 1,
0.7990743, -1.368701, 2.13348, 0.6862745, 0, 1, 1,
0.8033258, -1.859025, 2.568043, 0.6901961, 0, 1, 1,
0.8141371, -2.975147, 2.457607, 0.6980392, 0, 1, 1,
0.8159012, -0.2477619, 1.477123, 0.7058824, 0, 1, 1,
0.8227617, -1.478202, 2.928208, 0.7098039, 0, 1, 1,
0.8235583, -2.290506, 2.540904, 0.7176471, 0, 1, 1,
0.8237485, -0.3142531, 3.11591, 0.7215686, 0, 1, 1,
0.8249136, -0.6211494, 2.594271, 0.7294118, 0, 1, 1,
0.8334072, 1.0017, 2.365944, 0.7333333, 0, 1, 1,
0.8400782, -0.01650922, 1.461337, 0.7411765, 0, 1, 1,
0.8405755, 0.7114854, -0.5203415, 0.7450981, 0, 1, 1,
0.8416874, 0.07261466, 1.024787, 0.7529412, 0, 1, 1,
0.8429057, 0.8564127, -0.2368106, 0.7568628, 0, 1, 1,
0.846505, -0.4720435, 2.02156, 0.7647059, 0, 1, 1,
0.8480453, 1.613342, 0.7530384, 0.7686275, 0, 1, 1,
0.8483536, -0.5486333, 2.159362, 0.7764706, 0, 1, 1,
0.8489056, -0.8407726, 3.586376, 0.7803922, 0, 1, 1,
0.8559572, 0.81629, -2.866813, 0.7882353, 0, 1, 1,
0.8583113, -0.927358, 1.40095, 0.7921569, 0, 1, 1,
0.8609442, 0.2696665, -0.03883119, 0.8, 0, 1, 1,
0.8620796, 0.7890663, 1.168982, 0.8078431, 0, 1, 1,
0.8627419, 0.1447157, 1.644562, 0.8117647, 0, 1, 1,
0.863261, 0.6791821, 1.440039, 0.8196079, 0, 1, 1,
0.8680965, -1.531169, 3.580724, 0.8235294, 0, 1, 1,
0.881117, -0.3905155, 1.824578, 0.8313726, 0, 1, 1,
0.8903586, 1.310469, 1.659405, 0.8352941, 0, 1, 1,
0.8949807, 1.730071, 0.1955746, 0.8431373, 0, 1, 1,
0.8960269, -0.405556, 1.738092, 0.8470588, 0, 1, 1,
0.8997478, -1.104594, 2.67639, 0.854902, 0, 1, 1,
0.9031026, 0.5691085, 2.364119, 0.8588235, 0, 1, 1,
0.9054216, -1.876668, 5.369845, 0.8666667, 0, 1, 1,
0.9137495, -1.226819, 2.55601, 0.8705882, 0, 1, 1,
0.9276301, 0.01800469, 2.391032, 0.8784314, 0, 1, 1,
0.9293013, -0.1799626, 3.102142, 0.8823529, 0, 1, 1,
0.9315397, -0.9277773, 4.729194, 0.8901961, 0, 1, 1,
0.9376854, -0.3116041, 2.335596, 0.8941177, 0, 1, 1,
0.9386753, -0.7507238, 3.520422, 0.9019608, 0, 1, 1,
0.9456804, 1.238315, 0.3625461, 0.9098039, 0, 1, 1,
0.9478903, 0.36319, 0.07668876, 0.9137255, 0, 1, 1,
0.9480438, -2.199433, 1.741358, 0.9215686, 0, 1, 1,
0.9605367, -1.100882, 2.817477, 0.9254902, 0, 1, 1,
0.9614934, 1.14979, 1.054927, 0.9333333, 0, 1, 1,
0.9676236, 0.1759204, 1.980808, 0.9372549, 0, 1, 1,
0.9703104, -1.869162, 2.549278, 0.945098, 0, 1, 1,
0.975877, 0.3680854, 2.282811, 0.9490196, 0, 1, 1,
0.9812981, 1.139496, 0.9838367, 0.9568627, 0, 1, 1,
0.9942408, 2.779128, 0.4705265, 0.9607843, 0, 1, 1,
0.9943756, 0.7429274, 1.378598, 0.9686275, 0, 1, 1,
1.007257, 0.4658085, -0.7252569, 0.972549, 0, 1, 1,
1.009104, 1.048461, 0.1695868, 0.9803922, 0, 1, 1,
1.01079, -0.3065197, 1.298979, 0.9843137, 0, 1, 1,
1.012845, 0.8396406, -0.1220947, 0.9921569, 0, 1, 1,
1.013202, -0.6834831, 2.144322, 0.9960784, 0, 1, 1,
1.015884, -1.362964, 3.208452, 1, 0, 0.9960784, 1,
1.026849, -0.7848055, 2.928053, 1, 0, 0.9882353, 1,
1.029425, 0.1193878, 1.370958, 1, 0, 0.9843137, 1,
1.035106, 0.1961913, 1.851654, 1, 0, 0.9764706, 1,
1.035958, -0.8409595, 3.010394, 1, 0, 0.972549, 1,
1.03918, 0.3378978, 3.333194, 1, 0, 0.9647059, 1,
1.040647, -0.04443866, -0.1072084, 1, 0, 0.9607843, 1,
1.040786, 0.4186914, 0.4688212, 1, 0, 0.9529412, 1,
1.044212, -0.1318548, 1.807909, 1, 0, 0.9490196, 1,
1.045318, -1.126141, 0.7293638, 1, 0, 0.9411765, 1,
1.048264, 0.4267267, 2.208107, 1, 0, 0.9372549, 1,
1.055974, 0.7904231, 0.001724612, 1, 0, 0.9294118, 1,
1.060639, -1.521251, 2.045214, 1, 0, 0.9254902, 1,
1.061584, -0.4475373, 2.437897, 1, 0, 0.9176471, 1,
1.069323, 0.5989009, 1.037014, 1, 0, 0.9137255, 1,
1.07681, -0.9855739, -0.02451483, 1, 0, 0.9058824, 1,
1.078829, 0.9470747, 2.417786, 1, 0, 0.9019608, 1,
1.079454, -3.056727, 1.790294, 1, 0, 0.8941177, 1,
1.080799, 0.2562869, 0.3869231, 1, 0, 0.8862745, 1,
1.080973, -0.1660801, -0.6756108, 1, 0, 0.8823529, 1,
1.08342, 1.654808, -0.05590947, 1, 0, 0.8745098, 1,
1.085282, 0.3040194, 2.730454, 1, 0, 0.8705882, 1,
1.095391, -1.287562, 3.465341, 1, 0, 0.8627451, 1,
1.095985, -0.9536529, 1.745901, 1, 0, 0.8588235, 1,
1.097172, 1.074753, 1.09499, 1, 0, 0.8509804, 1,
1.097884, 1.659771, 0.5456203, 1, 0, 0.8470588, 1,
1.099027, 1.262929, 0.9936167, 1, 0, 0.8392157, 1,
1.099569, -2.383636, 4.727755, 1, 0, 0.8352941, 1,
1.101217, 0.4548397, 1.745899, 1, 0, 0.827451, 1,
1.111011, -1.609102, 3.315193, 1, 0, 0.8235294, 1,
1.11784, -0.1144848, 1.229368, 1, 0, 0.8156863, 1,
1.121527, -1.226611, 1.512101, 1, 0, 0.8117647, 1,
1.12308, 0.1393733, 2.547507, 1, 0, 0.8039216, 1,
1.130407, 0.1500335, 2.131329, 1, 0, 0.7960784, 1,
1.132661, 2.339526, 1.776332, 1, 0, 0.7921569, 1,
1.13335, -0.3600428, 2.904887, 1, 0, 0.7843137, 1,
1.134234, -0.5460311, 3.267541, 1, 0, 0.7803922, 1,
1.138206, -0.8773112, 2.456049, 1, 0, 0.772549, 1,
1.139729, 1.16733, 2.023688, 1, 0, 0.7686275, 1,
1.144081, 1.232293, 1.600418, 1, 0, 0.7607843, 1,
1.14535, -0.5708493, 1.821661, 1, 0, 0.7568628, 1,
1.145662, -0.3636823, 1.536487, 1, 0, 0.7490196, 1,
1.15183, -0.5537398, 2.653693, 1, 0, 0.7450981, 1,
1.161968, 0.7389987, 2.335832, 1, 0, 0.7372549, 1,
1.167637, -0.903793, 4.305372, 1, 0, 0.7333333, 1,
1.187332, 1.189647, 0.7294573, 1, 0, 0.7254902, 1,
1.207246, 1.278779, -1.039642, 1, 0, 0.7215686, 1,
1.210121, 1.775311, -0.7838997, 1, 0, 0.7137255, 1,
1.210984, 0.8669679, 0.79348, 1, 0, 0.7098039, 1,
1.215004, 0.1239821, 0.2821921, 1, 0, 0.7019608, 1,
1.218064, -0.5824872, 1.150397, 1, 0, 0.6941177, 1,
1.219659, -0.7969646, 2.490411, 1, 0, 0.6901961, 1,
1.224848, -0.9162893, 2.838157, 1, 0, 0.682353, 1,
1.230621, -0.8263199, 2.569714, 1, 0, 0.6784314, 1,
1.243768, 0.6601489, 0.2143285, 1, 0, 0.6705883, 1,
1.250551, -1.05138, 2.37146, 1, 0, 0.6666667, 1,
1.250952, 1.02878, -1.707284, 1, 0, 0.6588235, 1,
1.254836, 0.00808927, 1.023543, 1, 0, 0.654902, 1,
1.255944, -1.293928, 2.816246, 1, 0, 0.6470588, 1,
1.262994, -0.1493104, 1.994747, 1, 0, 0.6431373, 1,
1.268694, 0.3134156, 1.117284, 1, 0, 0.6352941, 1,
1.271394, 0.7561075, 1.363739, 1, 0, 0.6313726, 1,
1.282906, 0.6145932, 1.283947, 1, 0, 0.6235294, 1,
1.289591, 0.2740256, -0.2690992, 1, 0, 0.6196079, 1,
1.290153, 1.655535, 2.504132, 1, 0, 0.6117647, 1,
1.293312, -1.454756, 0.5023524, 1, 0, 0.6078432, 1,
1.304824, -0.2394195, 1.334011, 1, 0, 0.6, 1,
1.306041, -2.32726, 3.354831, 1, 0, 0.5921569, 1,
1.310472, 0.5857345, 0.07705798, 1, 0, 0.5882353, 1,
1.311327, 1.249448, -0.5695398, 1, 0, 0.5803922, 1,
1.315062, -0.6707897, 2.239994, 1, 0, 0.5764706, 1,
1.326568, 0.531097, 1.187722, 1, 0, 0.5686275, 1,
1.331174, -0.9375305, 1.721647, 1, 0, 0.5647059, 1,
1.336125, 0.06606527, 3.199944, 1, 0, 0.5568628, 1,
1.341317, 1.192383, 0.4314918, 1, 0, 0.5529412, 1,
1.341427, -0.5037709, 1.351549, 1, 0, 0.5450981, 1,
1.34389, 0.5716857, 2.613875, 1, 0, 0.5411765, 1,
1.344384, 0.1842154, -0.1123705, 1, 0, 0.5333334, 1,
1.346235, -1.318848, 2.431637, 1, 0, 0.5294118, 1,
1.348129, -0.8442416, 2.250838, 1, 0, 0.5215687, 1,
1.350085, 0.3962081, 1.584746, 1, 0, 0.5176471, 1,
1.352014, -0.1199117, 1.22049, 1, 0, 0.509804, 1,
1.357725, -0.1860332, 2.209128, 1, 0, 0.5058824, 1,
1.360031, 1.754782, 0.5221883, 1, 0, 0.4980392, 1,
1.363037, -1.000474, 2.069736, 1, 0, 0.4901961, 1,
1.371812, -1.612719, 1.427144, 1, 0, 0.4862745, 1,
1.377254, -0.222207, 0.5620468, 1, 0, 0.4784314, 1,
1.380956, 0.276187, 1.231793, 1, 0, 0.4745098, 1,
1.396238, 0.7781753, 0.5627006, 1, 0, 0.4666667, 1,
1.396515, -0.5403082, 0.5855282, 1, 0, 0.4627451, 1,
1.401611, -1.32193, 2.409753, 1, 0, 0.454902, 1,
1.401864, 1.506652, 0.6182088, 1, 0, 0.4509804, 1,
1.406314, 0.4431767, 0.6797006, 1, 0, 0.4431373, 1,
1.412997, -0.7053762, 3.106728, 1, 0, 0.4392157, 1,
1.413257, -1.412202, 2.155334, 1, 0, 0.4313726, 1,
1.425154, 0.8196907, 1.152332, 1, 0, 0.427451, 1,
1.437594, -0.4696382, 1.4024, 1, 0, 0.4196078, 1,
1.446072, 0.06142037, 1.616918, 1, 0, 0.4156863, 1,
1.448941, -0.4336094, 2.285059, 1, 0, 0.4078431, 1,
1.458804, -1.562002, 5.106277, 1, 0, 0.4039216, 1,
1.474455, -0.3877401, 2.31966, 1, 0, 0.3960784, 1,
1.47857, 0.2069283, 0.929018, 1, 0, 0.3882353, 1,
1.479318, 0.3157828, 0.5852434, 1, 0, 0.3843137, 1,
1.47981, -0.2273956, 2.398319, 1, 0, 0.3764706, 1,
1.48543, -0.7506028, 3.479045, 1, 0, 0.372549, 1,
1.492076, -1.963024, 2.694003, 1, 0, 0.3647059, 1,
1.492236, -2.310567, 4.439244, 1, 0, 0.3607843, 1,
1.515779, 0.7434568, 1.812037, 1, 0, 0.3529412, 1,
1.530514, 0.2425559, -0.01092773, 1, 0, 0.3490196, 1,
1.550367, -0.9909986, 0.8382614, 1, 0, 0.3411765, 1,
1.551501, -0.9941901, 2.512922, 1, 0, 0.3372549, 1,
1.556022, 0.6621944, 1.055901, 1, 0, 0.3294118, 1,
1.561964, 1.067605, -0.639057, 1, 0, 0.3254902, 1,
1.573838, -0.7180243, 1.446838, 1, 0, 0.3176471, 1,
1.574073, -0.3791895, 2.681126, 1, 0, 0.3137255, 1,
1.58891, 1.716974, 0.5058877, 1, 0, 0.3058824, 1,
1.607166, -0.4969633, 2.782816, 1, 0, 0.2980392, 1,
1.607235, -0.4901603, 1.978688, 1, 0, 0.2941177, 1,
1.608912, 0.6725859, 1.701512, 1, 0, 0.2862745, 1,
1.627016, -0.08157554, 1.24466, 1, 0, 0.282353, 1,
1.646968, 0.657334, 0.7602203, 1, 0, 0.2745098, 1,
1.656857, 1.168713, 0.1693786, 1, 0, 0.2705882, 1,
1.666417, -0.3450198, 0.5799772, 1, 0, 0.2627451, 1,
1.673185, 0.1235831, 2.201871, 1, 0, 0.2588235, 1,
1.688258, 1.226017, 2.432781, 1, 0, 0.2509804, 1,
1.694658, 0.021416, -0.2105197, 1, 0, 0.2470588, 1,
1.712709, -0.1391851, -0.8854837, 1, 0, 0.2392157, 1,
1.713541, -0.2932115, 2.709852, 1, 0, 0.2352941, 1,
1.727447, -1.138453, -1.442572, 1, 0, 0.227451, 1,
1.739324, 0.7237967, 1.482351, 1, 0, 0.2235294, 1,
1.743691, 0.8705754, 1.769768, 1, 0, 0.2156863, 1,
1.752419, 0.8842731, -0.5509478, 1, 0, 0.2117647, 1,
1.760479, -0.3199505, 1.316666, 1, 0, 0.2039216, 1,
1.7672, -1.4085, 2.587068, 1, 0, 0.1960784, 1,
1.775568, 1.527535, 1.223107, 1, 0, 0.1921569, 1,
1.787265, -0.03803659, 0.9030922, 1, 0, 0.1843137, 1,
1.822091, -1.773576, 1.321158, 1, 0, 0.1803922, 1,
1.823409, -0.5971441, 0.9796114, 1, 0, 0.172549, 1,
1.833932, 0.3190605, 1.243867, 1, 0, 0.1686275, 1,
1.852992, -1.68109, 3.900965, 1, 0, 0.1607843, 1,
1.867256, -1.020102, 0.8118204, 1, 0, 0.1568628, 1,
1.888102, 2.43441, 0.4127307, 1, 0, 0.1490196, 1,
1.894558, -0.1608398, 1.684945, 1, 0, 0.145098, 1,
1.950022, 0.1275505, 0.05399018, 1, 0, 0.1372549, 1,
1.999848, -0.1719416, 1.2628, 1, 0, 0.1333333, 1,
2.0211, -1.018399, 2.638002, 1, 0, 0.1254902, 1,
2.048651, 1.259807, 0.3104458, 1, 0, 0.1215686, 1,
2.065, 1.173993, -0.7482426, 1, 0, 0.1137255, 1,
2.079285, 1.530917, 1.56444, 1, 0, 0.1098039, 1,
2.082744, -0.7574393, 2.502877, 1, 0, 0.1019608, 1,
2.092784, -0.8952625, 2.097767, 1, 0, 0.09411765, 1,
2.092786, -0.7921901, 3.5553, 1, 0, 0.09019608, 1,
2.107195, 0.5759701, 2.674642, 1, 0, 0.08235294, 1,
2.155672, 0.6621792, 2.485838, 1, 0, 0.07843138, 1,
2.15852, 0.4678088, 0.6731778, 1, 0, 0.07058824, 1,
2.168243, 0.1047641, 1.19032, 1, 0, 0.06666667, 1,
2.238205, 2.695963, 1.181822, 1, 0, 0.05882353, 1,
2.255939, 0.07642903, -0.6931937, 1, 0, 0.05490196, 1,
2.276084, 0.6013617, 1.180035, 1, 0, 0.04705882, 1,
2.324151, -0.1367792, 2.820657, 1, 0, 0.04313726, 1,
2.332826, -0.1825133, 2.361602, 1, 0, 0.03529412, 1,
2.510307, -1.072368, 2.613899, 1, 0, 0.03137255, 1,
2.550962, -0.2390975, 2.558167, 1, 0, 0.02352941, 1,
2.557053, 0.6953495, 1.9423, 1, 0, 0.01960784, 1,
3.178774, 0.1300307, 0.3894027, 1, 0, 0.01176471, 1,
3.255889, 0.5832292, 2.362581, 1, 0, 0.007843138, 1
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
-0.1284007, -4.13009, -7.108833, 0, -0.5, 0.5, 0.5,
-0.1284007, -4.13009, -7.108833, 1, -0.5, 0.5, 0.5,
-0.1284007, -4.13009, -7.108833, 1, 1.5, 0.5, 0.5,
-0.1284007, -4.13009, -7.108833, 0, 1.5, 0.5, 0.5
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
-4.659964, 0.1095347, -7.108833, 0, -0.5, 0.5, 0.5,
-4.659964, 0.1095347, -7.108833, 1, -0.5, 0.5, 0.5,
-4.659964, 0.1095347, -7.108833, 1, 1.5, 0.5, 0.5,
-4.659964, 0.1095347, -7.108833, 0, 1.5, 0.5, 0.5
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
-4.659964, -4.13009, 0.03479695, 0, -0.5, 0.5, 0.5,
-4.659964, -4.13009, 0.03479695, 1, -0.5, 0.5, 0.5,
-4.659964, -4.13009, 0.03479695, 1, 1.5, 0.5, 0.5,
-4.659964, -4.13009, 0.03479695, 0, 1.5, 0.5, 0.5
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
-3, -3.151715, -5.460303,
3, -3.151715, -5.460303,
-3, -3.151715, -5.460303,
-3, -3.314777, -5.735058,
-2, -3.151715, -5.460303,
-2, -3.314777, -5.735058,
-1, -3.151715, -5.460303,
-1, -3.314777, -5.735058,
0, -3.151715, -5.460303,
0, -3.314777, -5.735058,
1, -3.151715, -5.460303,
1, -3.314777, -5.735058,
2, -3.151715, -5.460303,
2, -3.314777, -5.735058,
3, -3.151715, -5.460303,
3, -3.314777, -5.735058
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
-3, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
-3, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
-3, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
-3, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5,
-2, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
-2, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
-2, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
-2, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5,
-1, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
-1, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
-1, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
-1, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5,
0, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
0, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
0, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
0, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5,
1, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
1, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
1, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
1, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5,
2, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
2, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
2, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
2, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5,
3, -3.640902, -6.284568, 0, -0.5, 0.5, 0.5,
3, -3.640902, -6.284568, 1, -0.5, 0.5, 0.5,
3, -3.640902, -6.284568, 1, 1.5, 0.5, 0.5,
3, -3.640902, -6.284568, 0, 1.5, 0.5, 0.5
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
-3.614219, -3, -5.460303,
-3.614219, 3, -5.460303,
-3.614219, -3, -5.460303,
-3.78851, -3, -5.735058,
-3.614219, -2, -5.460303,
-3.78851, -2, -5.735058,
-3.614219, -1, -5.460303,
-3.78851, -1, -5.735058,
-3.614219, 0, -5.460303,
-3.78851, 0, -5.735058,
-3.614219, 1, -5.460303,
-3.78851, 1, -5.735058,
-3.614219, 2, -5.460303,
-3.78851, 2, -5.735058,
-3.614219, 3, -5.460303,
-3.78851, 3, -5.735058
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
-4.137092, -3, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, -3, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, -3, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, -3, -6.284568, 0, 1.5, 0.5, 0.5,
-4.137092, -2, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, -2, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, -2, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, -2, -6.284568, 0, 1.5, 0.5, 0.5,
-4.137092, -1, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, -1, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, -1, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, -1, -6.284568, 0, 1.5, 0.5, 0.5,
-4.137092, 0, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, 0, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, 0, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, 0, -6.284568, 0, 1.5, 0.5, 0.5,
-4.137092, 1, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, 1, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, 1, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, 1, -6.284568, 0, 1.5, 0.5, 0.5,
-4.137092, 2, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, 2, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, 2, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, 2, -6.284568, 0, 1.5, 0.5, 0.5,
-4.137092, 3, -6.284568, 0, -0.5, 0.5, 0.5,
-4.137092, 3, -6.284568, 1, -0.5, 0.5, 0.5,
-4.137092, 3, -6.284568, 1, 1.5, 0.5, 0.5,
-4.137092, 3, -6.284568, 0, 1.5, 0.5, 0.5
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
-3.614219, -3.151715, -4,
-3.614219, -3.151715, 4,
-3.614219, -3.151715, -4,
-3.78851, -3.314777, -4,
-3.614219, -3.151715, -2,
-3.78851, -3.314777, -2,
-3.614219, -3.151715, 0,
-3.78851, -3.314777, 0,
-3.614219, -3.151715, 2,
-3.78851, -3.314777, 2,
-3.614219, -3.151715, 4,
-3.78851, -3.314777, 4
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
-4.137092, -3.640902, -4, 0, -0.5, 0.5, 0.5,
-4.137092, -3.640902, -4, 1, -0.5, 0.5, 0.5,
-4.137092, -3.640902, -4, 1, 1.5, 0.5, 0.5,
-4.137092, -3.640902, -4, 0, 1.5, 0.5, 0.5,
-4.137092, -3.640902, -2, 0, -0.5, 0.5, 0.5,
-4.137092, -3.640902, -2, 1, -0.5, 0.5, 0.5,
-4.137092, -3.640902, -2, 1, 1.5, 0.5, 0.5,
-4.137092, -3.640902, -2, 0, 1.5, 0.5, 0.5,
-4.137092, -3.640902, 0, 0, -0.5, 0.5, 0.5,
-4.137092, -3.640902, 0, 1, -0.5, 0.5, 0.5,
-4.137092, -3.640902, 0, 1, 1.5, 0.5, 0.5,
-4.137092, -3.640902, 0, 0, 1.5, 0.5, 0.5,
-4.137092, -3.640902, 2, 0, -0.5, 0.5, 0.5,
-4.137092, -3.640902, 2, 1, -0.5, 0.5, 0.5,
-4.137092, -3.640902, 2, 1, 1.5, 0.5, 0.5,
-4.137092, -3.640902, 2, 0, 1.5, 0.5, 0.5,
-4.137092, -3.640902, 4, 0, -0.5, 0.5, 0.5,
-4.137092, -3.640902, 4, 1, -0.5, 0.5, 0.5,
-4.137092, -3.640902, 4, 1, 1.5, 0.5, 0.5,
-4.137092, -3.640902, 4, 0, 1.5, 0.5, 0.5
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
-3.614219, -3.151715, -5.460303,
-3.614219, 3.370784, -5.460303,
-3.614219, -3.151715, 5.529897,
-3.614219, 3.370784, 5.529897,
-3.614219, -3.151715, -5.460303,
-3.614219, -3.151715, 5.529897,
-3.614219, 3.370784, -5.460303,
-3.614219, 3.370784, 5.529897,
-3.614219, -3.151715, -5.460303,
3.357417, -3.151715, -5.460303,
-3.614219, -3.151715, 5.529897,
3.357417, -3.151715, 5.529897,
-3.614219, 3.370784, -5.460303,
3.357417, 3.370784, -5.460303,
-3.614219, 3.370784, 5.529897,
3.357417, 3.370784, 5.529897,
3.357417, -3.151715, -5.460303,
3.357417, 3.370784, -5.460303,
3.357417, -3.151715, 5.529897,
3.357417, 3.370784, 5.529897,
3.357417, -3.151715, -5.460303,
3.357417, -3.151715, 5.529897,
3.357417, 3.370784, -5.460303,
3.357417, 3.370784, 5.529897
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
var radius = 7.773613;
var distance = 34.58568;
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
mvMatrix.translate( 0.1284007, -0.1095347, -0.03479695 );
mvMatrix.scale( 1.205597, 1.288614, 0.7647707 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58568);
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
thiobencarb<-read.table("thiobencarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiobencarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
```

```r
y<-thiobencarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
```

```r
z<-thiobencarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiobencarb' not found
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
-3.51269, -0.0464408, -1.022679, 0, 0, 1, 1, 1,
-3.467655, 0.230603, -2.876226, 1, 0, 0, 1, 1,
-2.95806, -2.096381, -2.583266, 1, 0, 0, 1, 1,
-2.900405, 0.5882353, -1.03813, 1, 0, 0, 1, 1,
-2.596709, -1.102143, -3.251933, 1, 0, 0, 1, 1,
-2.552113, 0.1071815, -2.040406, 1, 0, 0, 1, 1,
-2.548573, -1.282239, -1.138622, 0, 0, 0, 1, 1,
-2.500512, -0.1007797, 0.2379111, 0, 0, 0, 1, 1,
-2.500365, 0.6140127, -0.913173, 0, 0, 0, 1, 1,
-2.478786, -1.026463, -1.898195, 0, 0, 0, 1, 1,
-2.465312, -1.286739, -4.000591, 0, 0, 0, 1, 1,
-2.41321, 1.222159, -0.02572566, 0, 0, 0, 1, 1,
-2.329077, -0.5344449, -1.895275, 0, 0, 0, 1, 1,
-2.279663, 0.7115403, -1.133671, 1, 1, 1, 1, 1,
-2.246608, 1.269527, -1.180535, 1, 1, 1, 1, 1,
-2.235131, 0.11707, -0.5275854, 1, 1, 1, 1, 1,
-2.224573, 0.1149846, -0.8237886, 1, 1, 1, 1, 1,
-2.220293, -1.246685, 0.03791267, 1, 1, 1, 1, 1,
-2.212126, -0.5252411, -2.467871, 1, 1, 1, 1, 1,
-2.178726, 0.2210395, -0.8718063, 1, 1, 1, 1, 1,
-2.148928, -0.3244717, -2.416172, 1, 1, 1, 1, 1,
-2.100767, 0.8262592, -0.202994, 1, 1, 1, 1, 1,
-2.08913, -1.573838, -2.256012, 1, 1, 1, 1, 1,
-2.088541, 0.6851947, -2.018891, 1, 1, 1, 1, 1,
-2.062604, 0.5557475, -1.391813, 1, 1, 1, 1, 1,
-2.048125, 0.01971836, 0.2957105, 1, 1, 1, 1, 1,
-2.01799, 0.2768528, -1.048024, 1, 1, 1, 1, 1,
-2.009311, -1.972824, -2.714603, 1, 1, 1, 1, 1,
-2.004821, 0.02773261, 1.908153, 0, 0, 1, 1, 1,
-1.988036, 0.5457336, -0.2547095, 1, 0, 0, 1, 1,
-1.983896, -0.3460638, -1.412752, 1, 0, 0, 1, 1,
-1.964599, 0.2354397, -2.218396, 1, 0, 0, 1, 1,
-1.961594, -0.9416685, -1.352128, 1, 0, 0, 1, 1,
-1.95708, 0.03933352, -1.099298, 1, 0, 0, 1, 1,
-1.896097, -0.517608, -1.422983, 0, 0, 0, 1, 1,
-1.889117, -1.238269, -0.8359658, 0, 0, 0, 1, 1,
-1.86593, 1.34423, -0.7035605, 0, 0, 0, 1, 1,
-1.83985, 1.255263, -2.395925, 0, 0, 0, 1, 1,
-1.835846, 0.3658869, -1.41911, 0, 0, 0, 1, 1,
-1.835541, -1.418195, -3.592762, 0, 0, 0, 1, 1,
-1.832758, 0.987455, -0.5762993, 0, 0, 0, 1, 1,
-1.8137, -0.7557629, -0.6029275, 1, 1, 1, 1, 1,
-1.811674, 2.140205, -0.4603012, 1, 1, 1, 1, 1,
-1.80852, -0.1475188, -2.672453, 1, 1, 1, 1, 1,
-1.800868, 2.068739, 0.3480701, 1, 1, 1, 1, 1,
-1.800318, -0.5389904, -1.756053, 1, 1, 1, 1, 1,
-1.800157, 0.2932298, -0.6252809, 1, 1, 1, 1, 1,
-1.774447, 0.02685612, -0.9276997, 1, 1, 1, 1, 1,
-1.744331, 0.03582615, -0.5749819, 1, 1, 1, 1, 1,
-1.738811, 0.9405325, -1.418016, 1, 1, 1, 1, 1,
-1.73565, 0.4902772, -1.228723, 1, 1, 1, 1, 1,
-1.726828, 1.567488, -0.1625635, 1, 1, 1, 1, 1,
-1.721102, 0.458865, -0.4256901, 1, 1, 1, 1, 1,
-1.710967, 1.771746, -0.1989198, 1, 1, 1, 1, 1,
-1.702711, 0.02278738, -3.74459, 1, 1, 1, 1, 1,
-1.697344, -0.5708169, -1.114456, 1, 1, 1, 1, 1,
-1.696199, -0.6218158, -1.218016, 0, 0, 1, 1, 1,
-1.682406, -1.098631, -2.53084, 1, 0, 0, 1, 1,
-1.672124, 1.324404, -0.9809999, 1, 0, 0, 1, 1,
-1.667845, -1.109426, -1.242913, 1, 0, 0, 1, 1,
-1.665709, 0.6665019, 0.2501811, 1, 0, 0, 1, 1,
-1.664612, 0.4215375, 0.01253009, 1, 0, 0, 1, 1,
-1.662936, -0.6496515, -2.48861, 0, 0, 0, 1, 1,
-1.6459, 1.40066, -0.8627234, 0, 0, 0, 1, 1,
-1.638937, 0.6893881, -1.914472, 0, 0, 0, 1, 1,
-1.633947, 0.165007, -1.9222, 0, 0, 0, 1, 1,
-1.621666, 1.392432, -0.1453551, 0, 0, 0, 1, 1,
-1.620626, 0.4654402, -1.087823, 0, 0, 0, 1, 1,
-1.618573, -0.8599499, -2.294748, 0, 0, 0, 1, 1,
-1.613366, 1.118632, -0.4827485, 1, 1, 1, 1, 1,
-1.600009, 0.08945156, -0.3140877, 1, 1, 1, 1, 1,
-1.598675, 0.9273923, -1.98001, 1, 1, 1, 1, 1,
-1.592296, -0.05117447, -0.01567093, 1, 1, 1, 1, 1,
-1.587345, -0.5188334, -1.871404, 1, 1, 1, 1, 1,
-1.587186, 0.9338065, -1.538276, 1, 1, 1, 1, 1,
-1.569243, -0.1671071, -1.349286, 1, 1, 1, 1, 1,
-1.558256, 0.8198237, -2.699587, 1, 1, 1, 1, 1,
-1.556332, 1.366387, -1.456519, 1, 1, 1, 1, 1,
-1.53654, -1.298476, -1.833314, 1, 1, 1, 1, 1,
-1.512585, -0.4279141, -1.209114, 1, 1, 1, 1, 1,
-1.506897, 0.05778576, -1.502588, 1, 1, 1, 1, 1,
-1.497002, 0.3431746, -0.8784026, 1, 1, 1, 1, 1,
-1.495994, 1.096504, 0.6139042, 1, 1, 1, 1, 1,
-1.469424, 0.3873396, -2.54059, 1, 1, 1, 1, 1,
-1.437182, 0.3473005, -0.5622064, 0, 0, 1, 1, 1,
-1.429431, -0.4179595, -1.765809, 1, 0, 0, 1, 1,
-1.42475, -1.243602, -3.395074, 1, 0, 0, 1, 1,
-1.421269, -0.5079855, -3.731375, 1, 0, 0, 1, 1,
-1.417511, -0.4810242, -1.299841, 1, 0, 0, 1, 1,
-1.416809, -1.682891, -2.231787, 1, 0, 0, 1, 1,
-1.405605, -1.492748, -1.344408, 0, 0, 0, 1, 1,
-1.384135, -1.35925, -3.594549, 0, 0, 0, 1, 1,
-1.379286, -0.6166179, 0.1976665, 0, 0, 0, 1, 1,
-1.36942, -0.03665179, -1.340862, 0, 0, 0, 1, 1,
-1.361349, 0.4983513, -0.8676007, 0, 0, 0, 1, 1,
-1.329498, -0.5699104, -1.58007, 0, 0, 0, 1, 1,
-1.328926, 0.4969636, -2.116757, 0, 0, 0, 1, 1,
-1.326399, 0.2398286, -0.2491449, 1, 1, 1, 1, 1,
-1.32362, 1.132577, -1.860904, 1, 1, 1, 1, 1,
-1.323535, 0.2391865, -2.101413, 1, 1, 1, 1, 1,
-1.316952, 2.041973, -1.405627, 1, 1, 1, 1, 1,
-1.311772, 1.492545, 0.02270347, 1, 1, 1, 1, 1,
-1.303339, -0.7758297, -2.61723, 1, 1, 1, 1, 1,
-1.299669, -1.144449, -3.433294, 1, 1, 1, 1, 1,
-1.275337, 1.131697, 0.02084475, 1, 1, 1, 1, 1,
-1.275307, 1.099729, -1.938658, 1, 1, 1, 1, 1,
-1.270548, -0.7729292, -1.077536, 1, 1, 1, 1, 1,
-1.266863, -0.7409877, -1.227655, 1, 1, 1, 1, 1,
-1.266653, 0.4705188, -1.593449, 1, 1, 1, 1, 1,
-1.259906, 0.1535427, -1.800579, 1, 1, 1, 1, 1,
-1.259561, -0.1012075, -0.9092743, 1, 1, 1, 1, 1,
-1.23419, 0.99199, -1.433908, 1, 1, 1, 1, 1,
-1.229928, 1.078169, -0.8539926, 0, 0, 1, 1, 1,
-1.229682, -1.895055, -3.088632, 1, 0, 0, 1, 1,
-1.226608, 0.1846895, -1.056861, 1, 0, 0, 1, 1,
-1.224334, -0.7362096, -2.372707, 1, 0, 0, 1, 1,
-1.209095, -0.01396714, -2.847772, 1, 0, 0, 1, 1,
-1.208799, 0.5545596, -0.09369779, 1, 0, 0, 1, 1,
-1.208741, -0.7007186, -0.9234033, 0, 0, 0, 1, 1,
-1.190564, -0.8385884, -0.973444, 0, 0, 0, 1, 1,
-1.18738, -1.680547, -1.607287, 0, 0, 0, 1, 1,
-1.184867, 0.496972, 1.271391, 0, 0, 0, 1, 1,
-1.177283, 0.3248989, -1.144616, 0, 0, 0, 1, 1,
-1.172037, -1.991545, -2.509253, 0, 0, 0, 1, 1,
-1.170694, 1.037172, 0.187314, 0, 0, 0, 1, 1,
-1.165292, 1.405771, -2.703333, 1, 1, 1, 1, 1,
-1.163607, 0.2582398, -2.0854, 1, 1, 1, 1, 1,
-1.157764, -0.8124007, -0.7813838, 1, 1, 1, 1, 1,
-1.153381, 0.6515744, -1.692995, 1, 1, 1, 1, 1,
-1.151903, 0.9444595, -0.5147195, 1, 1, 1, 1, 1,
-1.148577, -0.8752384, -4.27798, 1, 1, 1, 1, 1,
-1.131096, -0.2638695, -1.670792, 1, 1, 1, 1, 1,
-1.124424, 0.3013507, -0.5761125, 1, 1, 1, 1, 1,
-1.118371, -0.003283409, -1.685593, 1, 1, 1, 1, 1,
-1.117092, 1.905725, 0.7348672, 1, 1, 1, 1, 1,
-1.117022, -1.325763, -2.260593, 1, 1, 1, 1, 1,
-1.114708, -0.3808939, -2.835043, 1, 1, 1, 1, 1,
-1.113288, -0.4422359, -2.211681, 1, 1, 1, 1, 1,
-1.109753, 1.039334, -1.027317, 1, 1, 1, 1, 1,
-1.106066, -0.7896785, -1.299849, 1, 1, 1, 1, 1,
-1.101697, 0.1540639, -2.676837, 0, 0, 1, 1, 1,
-1.098885, -2.160844, -3.804639, 1, 0, 0, 1, 1,
-1.096617, 0.05669311, -1.481792, 1, 0, 0, 1, 1,
-1.084751, 0.4106615, -2.425952, 1, 0, 0, 1, 1,
-1.084078, 0.2635561, 0.3597762, 1, 0, 0, 1, 1,
-1.081201, 3.275796, -0.5346538, 1, 0, 0, 1, 1,
-1.069858, -0.03992634, -1.101375, 0, 0, 0, 1, 1,
-1.064868, 0.4103308, -0.02920917, 0, 0, 0, 1, 1,
-1.052761, -0.01229805, -1.323497, 0, 0, 0, 1, 1,
-1.05056, 1.065527, -0.4404549, 0, 0, 0, 1, 1,
-1.042084, 1.505128, 0.7895445, 0, 0, 0, 1, 1,
-1.035292, 1.09505, -0.2038022, 0, 0, 0, 1, 1,
-1.030249, -0.6405427, -4.682469, 0, 0, 0, 1, 1,
-1.027818, -0.3152466, -3.260124, 1, 1, 1, 1, 1,
-1.022401, 0.2250674, -0.06374148, 1, 1, 1, 1, 1,
-1.018113, -0.6936008, -1.907414, 1, 1, 1, 1, 1,
-1.016885, -1.065612, -2.952795, 1, 1, 1, 1, 1,
-1.009537, 0.7374673, -1.338467, 1, 1, 1, 1, 1,
-0.9979113, -0.515525, -1.186392, 1, 1, 1, 1, 1,
-0.9977789, 1.278008, -1.334263, 1, 1, 1, 1, 1,
-0.9800869, -1.698431, -2.614554, 1, 1, 1, 1, 1,
-0.9639129, 0.9639206, 0.4537109, 1, 1, 1, 1, 1,
-0.9615815, 0.4976305, 0.5134348, 1, 1, 1, 1, 1,
-0.9576073, 0.2567436, -1.246399, 1, 1, 1, 1, 1,
-0.937201, -0.4724815, -3.276679, 1, 1, 1, 1, 1,
-0.9337288, 0.4179115, -0.4195213, 1, 1, 1, 1, 1,
-0.9336514, 0.05736249, -0.6643977, 1, 1, 1, 1, 1,
-0.9295484, -1.158001, -1.963431, 1, 1, 1, 1, 1,
-0.9292701, -0.2775097, -3.170321, 0, 0, 1, 1, 1,
-0.925727, 1.957953, -0.6615642, 1, 0, 0, 1, 1,
-0.9217751, 0.05459449, -0.3155818, 1, 0, 0, 1, 1,
-0.9195945, 1.128409, -0.9860843, 1, 0, 0, 1, 1,
-0.9056351, -0.2719388, -2.380935, 1, 0, 0, 1, 1,
-0.8983166, 2.098564, -0.5696003, 1, 0, 0, 1, 1,
-0.8934338, -0.3266791, -2.555304, 0, 0, 0, 1, 1,
-0.8846988, 0.01574861, -2.2928, 0, 0, 0, 1, 1,
-0.8818749, 0.1811636, -1.88589, 0, 0, 0, 1, 1,
-0.8801534, 0.5873948, -2.991817, 0, 0, 0, 1, 1,
-0.8668957, -0.03837875, -0.9252748, 0, 0, 0, 1, 1,
-0.8559307, -0.01462165, -1.013643, 0, 0, 0, 1, 1,
-0.8496508, -1.355846, -1.520972, 0, 0, 0, 1, 1,
-0.8481969, 0.6474833, -1.099961, 1, 1, 1, 1, 1,
-0.8449718, 1.611827, 0.1271104, 1, 1, 1, 1, 1,
-0.8440555, 0.4012497, 0.5540185, 1, 1, 1, 1, 1,
-0.8336588, 0.6289684, -2.065514, 1, 1, 1, 1, 1,
-0.832211, -0.4460314, -2.694977, 1, 1, 1, 1, 1,
-0.8276909, 0.1629424, -2.013718, 1, 1, 1, 1, 1,
-0.8136735, -1.34403, -2.042969, 1, 1, 1, 1, 1,
-0.8134203, 0.2187435, -0.7047135, 1, 1, 1, 1, 1,
-0.8124793, 0.4118316, -2.656269, 1, 1, 1, 1, 1,
-0.8118175, -1.631279, -1.791836, 1, 1, 1, 1, 1,
-0.802185, 1.89369, 0.1994334, 1, 1, 1, 1, 1,
-0.7996759, -0.07169302, -1.97364, 1, 1, 1, 1, 1,
-0.7977784, 0.1824481, 0.8022763, 1, 1, 1, 1, 1,
-0.796501, 1.793491, -0.1438967, 1, 1, 1, 1, 1,
-0.7952063, 1.522256, 0.6543621, 1, 1, 1, 1, 1,
-0.7927147, 0.865208, -0.394217, 0, 0, 1, 1, 1,
-0.781934, -0.4373951, -1.256024, 1, 0, 0, 1, 1,
-0.7808595, 0.8658397, -0.466691, 1, 0, 0, 1, 1,
-0.7800708, -0.1203662, -1.543494, 1, 0, 0, 1, 1,
-0.7795862, 0.5527136, -1.233183, 1, 0, 0, 1, 1,
-0.7741507, 0.3338696, -1.470308, 1, 0, 0, 1, 1,
-0.7740799, 1.10474, 0.194946, 0, 0, 0, 1, 1,
-0.7731211, 1.173734, 1.059428, 0, 0, 0, 1, 1,
-0.7727211, 0.1655598, -2.550545, 0, 0, 0, 1, 1,
-0.7689432, 0.760262, 0.1615164, 0, 0, 0, 1, 1,
-0.7628801, -0.14731, -2.03493, 0, 0, 0, 1, 1,
-0.7614027, 1.634223, -0.6081738, 0, 0, 0, 1, 1,
-0.7532303, 1.319759, 0.1392913, 0, 0, 0, 1, 1,
-0.7462903, -0.6421596, -3.596827, 1, 1, 1, 1, 1,
-0.744319, 0.6608108, -1.106051, 1, 1, 1, 1, 1,
-0.7371653, 0.4457387, -2.608805, 1, 1, 1, 1, 1,
-0.7325128, -0.7552701, -1.997328, 1, 1, 1, 1, 1,
-0.7285945, -1.024828, -3.349027, 1, 1, 1, 1, 1,
-0.7281371, -1.394278, -2.376533, 1, 1, 1, 1, 1,
-0.7260636, -0.9847522, -2.291035, 1, 1, 1, 1, 1,
-0.7231407, 0.3072664, 1.511154, 1, 1, 1, 1, 1,
-0.720726, 1.997379, 0.9932357, 1, 1, 1, 1, 1,
-0.715363, 0.4807805, -2.18189, 1, 1, 1, 1, 1,
-0.7118663, -0.2492993, -1.118494, 1, 1, 1, 1, 1,
-0.7066556, -1.303708, -2.316564, 1, 1, 1, 1, 1,
-0.7066427, 0.1666632, -2.123732, 1, 1, 1, 1, 1,
-0.6998509, -0.003791493, -3.643477, 1, 1, 1, 1, 1,
-0.6980451, 0.0316668, -1.203903, 1, 1, 1, 1, 1,
-0.6926332, 0.6491675, 1.052285, 0, 0, 1, 1, 1,
-0.691148, 0.09552424, -0.5648237, 1, 0, 0, 1, 1,
-0.6883718, -0.3998774, -1.847439, 1, 0, 0, 1, 1,
-0.6869012, 0.1691724, -1.371204, 1, 0, 0, 1, 1,
-0.6867535, -0.2586506, -0.7249786, 1, 0, 0, 1, 1,
-0.681711, -0.8410479, -2.824467, 1, 0, 0, 1, 1,
-0.6807247, 0.8045815, -1.587955, 0, 0, 0, 1, 1,
-0.6697091, -1.339469, -2.755471, 0, 0, 0, 1, 1,
-0.6685433, 0.06880547, -2.899151, 0, 0, 0, 1, 1,
-0.6619917, 0.4832548, -2.068512, 0, 0, 0, 1, 1,
-0.6603396, -0.2018849, -2.353231, 0, 0, 0, 1, 1,
-0.6593035, -0.4617952, -2.793254, 0, 0, 0, 1, 1,
-0.6583808, -0.6640574, -5.010762, 0, 0, 0, 1, 1,
-0.6514103, 0.7161082, -1.661819, 1, 1, 1, 1, 1,
-0.6483209, 0.8447133, -0.7723526, 1, 1, 1, 1, 1,
-0.648123, 0.9531977, -0.2695783, 1, 1, 1, 1, 1,
-0.6478634, -0.921692, -0.1964949, 1, 1, 1, 1, 1,
-0.6422451, -0.4011514, -1.998174, 1, 1, 1, 1, 1,
-0.6354648, 0.5988637, -1.461431, 1, 1, 1, 1, 1,
-0.6344811, -0.1990611, -1.708609, 1, 1, 1, 1, 1,
-0.6319139, -0.7863846, -2.297391, 1, 1, 1, 1, 1,
-0.6280999, 0.04476806, -2.552643, 1, 1, 1, 1, 1,
-0.6266263, 0.541909, -0.7795836, 1, 1, 1, 1, 1,
-0.6252084, 0.04257522, -2.87721, 1, 1, 1, 1, 1,
-0.6233404, 0.1820274, -2.583618, 1, 1, 1, 1, 1,
-0.6219469, 0.1327112, -0.2576546, 1, 1, 1, 1, 1,
-0.6214598, -0.8063108, -2.422648, 1, 1, 1, 1, 1,
-0.6210065, 0.4104545, -0.3857976, 1, 1, 1, 1, 1,
-0.6177936, -0.2739584, -1.458818, 0, 0, 1, 1, 1,
-0.6125472, 1.673893, -0.3071033, 1, 0, 0, 1, 1,
-0.6125169, 0.4524004, -1.476131, 1, 0, 0, 1, 1,
-0.6096292, 0.5388661, -2.65431, 1, 0, 0, 1, 1,
-0.6094275, -0.5767948, -1.804158, 1, 0, 0, 1, 1,
-0.6082912, 0.3172263, -1.95762, 1, 0, 0, 1, 1,
-0.6079563, 1.477841, 0.1871965, 0, 0, 0, 1, 1,
-0.606897, 0.5262488, -1.66558, 0, 0, 0, 1, 1,
-0.5992191, 1.134517, -3.308185, 0, 0, 0, 1, 1,
-0.59549, -0.9058998, -1.466296, 0, 0, 0, 1, 1,
-0.5944699, 0.6724126, 0.226156, 0, 0, 0, 1, 1,
-0.5930377, -0.7165134, -5.28597, 0, 0, 0, 1, 1,
-0.5928552, -2.171965, -2.7907, 0, 0, 0, 1, 1,
-0.5885708, 1.710139, 0.6399012, 1, 1, 1, 1, 1,
-0.5850821, 1.478034, -1.187608, 1, 1, 1, 1, 1,
-0.5832511, -0.1161295, -0.6892018, 1, 1, 1, 1, 1,
-0.5804666, -1.480873, -2.179901, 1, 1, 1, 1, 1,
-0.5797982, 0.8754884, -1.292207, 1, 1, 1, 1, 1,
-0.576974, -0.1665086, -1.085513, 1, 1, 1, 1, 1,
-0.5727734, 0.7899529, 0.2938063, 1, 1, 1, 1, 1,
-0.5690506, 1.278878, 0.1202582, 1, 1, 1, 1, 1,
-0.5609532, 0.890865, -1.222992, 1, 1, 1, 1, 1,
-0.5574775, 1.139031, 0.8087125, 1, 1, 1, 1, 1,
-0.5517371, 0.08561316, -1.651099, 1, 1, 1, 1, 1,
-0.5498827, 0.1982866, -1.700037, 1, 1, 1, 1, 1,
-0.5460801, -0.3180607, 0.2231566, 1, 1, 1, 1, 1,
-0.5436134, -0.2712013, -3.635501, 1, 1, 1, 1, 1,
-0.5429068, 0.3794303, -0.2300406, 1, 1, 1, 1, 1,
-0.5398214, -1.4703, -3.098414, 0, 0, 1, 1, 1,
-0.5370614, -1.171848, -2.808124, 1, 0, 0, 1, 1,
-0.533939, 0.4618542, -2.392411, 1, 0, 0, 1, 1,
-0.5336375, -1.44982, -1.830782, 1, 0, 0, 1, 1,
-0.5216658, -0.3420868, 0.226796, 1, 0, 0, 1, 1,
-0.5209638, 0.1070331, -0.5615281, 1, 0, 0, 1, 1,
-0.5145711, -0.4678631, -2.690818, 0, 0, 0, 1, 1,
-0.5128877, -1.142574, -2.494111, 0, 0, 0, 1, 1,
-0.5048599, -1.168262, -2.624131, 0, 0, 0, 1, 1,
-0.5011526, -0.5764537, -0.07490296, 0, 0, 0, 1, 1,
-0.4983283, -2.17443, -2.337576, 0, 0, 0, 1, 1,
-0.4959739, -0.4679986, -2.119036, 0, 0, 0, 1, 1,
-0.4940186, 1.166649, -2.813151, 0, 0, 0, 1, 1,
-0.4913683, -1.075439, -2.983674, 1, 1, 1, 1, 1,
-0.4900067, -0.1866897, -1.978369, 1, 1, 1, 1, 1,
-0.4895181, -1.303552, -3.165173, 1, 1, 1, 1, 1,
-0.4892109, -0.3669571, -2.295172, 1, 1, 1, 1, 1,
-0.4801499, 0.1301838, -1.669259, 1, 1, 1, 1, 1,
-0.4777067, -1.634503, -0.9764944, 1, 1, 1, 1, 1,
-0.4724922, 1.476451, -2.736905, 1, 1, 1, 1, 1,
-0.4721774, 3.250034, -0.9959162, 1, 1, 1, 1, 1,
-0.4650135, 0.6777524, 0.4210776, 1, 1, 1, 1, 1,
-0.4593962, -0.8204399, -3.879538, 1, 1, 1, 1, 1,
-0.4566475, -0.2770427, -1.520453, 1, 1, 1, 1, 1,
-0.4558155, -1.507546, -1.625622, 1, 1, 1, 1, 1,
-0.4518417, -1.880379, -2.700838, 1, 1, 1, 1, 1,
-0.4505022, 0.4714719, -0.4419298, 1, 1, 1, 1, 1,
-0.4504008, 0.2877978, 0.08242659, 1, 1, 1, 1, 1,
-0.4488352, 0.5769178, -0.3972496, 0, 0, 1, 1, 1,
-0.4463764, -1.874722, -0.840087, 1, 0, 0, 1, 1,
-0.4458768, 0.257369, -0.4921977, 1, 0, 0, 1, 1,
-0.4440396, -0.7377175, -1.511039, 1, 0, 0, 1, 1,
-0.4422503, -1.650769, -1.499738, 1, 0, 0, 1, 1,
-0.4362221, 0.9973908, -0.4623567, 1, 0, 0, 1, 1,
-0.43522, -1.176671, -3.453278, 0, 0, 0, 1, 1,
-0.4348365, -1.379744, -2.594279, 0, 0, 0, 1, 1,
-0.4343928, -1.41777, -1.933909, 0, 0, 0, 1, 1,
-0.4341858, -0.6074327, -3.374005, 0, 0, 0, 1, 1,
-0.4286801, -1.323243, -2.408716, 0, 0, 0, 1, 1,
-0.42099, -2.000582, -2.458812, 0, 0, 0, 1, 1,
-0.4179841, 1.457236, 0.3815064, 0, 0, 0, 1, 1,
-0.4155409, 0.4303997, -2.499914, 1, 1, 1, 1, 1,
-0.4124865, -0.6787099, -4.040581, 1, 1, 1, 1, 1,
-0.4083233, 0.02875599, -2.856232, 1, 1, 1, 1, 1,
-0.4078196, -1.899546, -4.058699, 1, 1, 1, 1, 1,
-0.4015728, -0.1032912, -1.280571, 1, 1, 1, 1, 1,
-0.3974943, 0.01701436, 0.4284503, 1, 1, 1, 1, 1,
-0.3972112, 1.328244, -1.135306, 1, 1, 1, 1, 1,
-0.3971464, -1.447279, -4.185751, 1, 1, 1, 1, 1,
-0.396796, -0.8054514, -3.048486, 1, 1, 1, 1, 1,
-0.3935882, -0.3417557, -1.217283, 1, 1, 1, 1, 1,
-0.3913665, 0.7613552, 0.3079871, 1, 1, 1, 1, 1,
-0.390954, -0.1638221, -1.133694, 1, 1, 1, 1, 1,
-0.3889688, -2.003345, -4.156676, 1, 1, 1, 1, 1,
-0.3840426, 0.5607166, -0.7629113, 1, 1, 1, 1, 1,
-0.3837021, -0.3406337, -1.325831, 1, 1, 1, 1, 1,
-0.3835179, -0.04519267, -3.105024, 0, 0, 1, 1, 1,
-0.3825228, -0.3294976, -1.833688, 1, 0, 0, 1, 1,
-0.3823325, 0.03241703, -2.960791, 1, 0, 0, 1, 1,
-0.3798022, 1.813271, -0.1218264, 1, 0, 0, 1, 1,
-0.379629, -0.4227132, -4.203561, 1, 0, 0, 1, 1,
-0.3769911, 0.8318181, -0.4893424, 1, 0, 0, 1, 1,
-0.3752532, -1.034502, -4.404457, 0, 0, 0, 1, 1,
-0.3693952, 0.4019905, -0.6843115, 0, 0, 0, 1, 1,
-0.3686174, -1.271032, -2.941563, 0, 0, 0, 1, 1,
-0.3648517, -0.9075942, -2.715619, 0, 0, 0, 1, 1,
-0.3645036, 1.561124, -0.2050666, 0, 0, 0, 1, 1,
-0.3643676, 1.050837, 0.2490632, 0, 0, 0, 1, 1,
-0.3638366, 1.473329, 0.684846, 0, 0, 0, 1, 1,
-0.3611984, 0.893974, -1.415758, 1, 1, 1, 1, 1,
-0.360072, 0.1230561, -2.316803, 1, 1, 1, 1, 1,
-0.3597641, 0.5542316, -0.537854, 1, 1, 1, 1, 1,
-0.3559725, 0.3561661, -0.572509, 1, 1, 1, 1, 1,
-0.3456305, 0.3873373, -0.1145488, 1, 1, 1, 1, 1,
-0.3428015, 1.423796, 0.5613636, 1, 1, 1, 1, 1,
-0.3397335, -0.4302437, -1.055267, 1, 1, 1, 1, 1,
-0.3394878, -0.5567389, -1.481221, 1, 1, 1, 1, 1,
-0.3360508, -0.8814625, -2.721282, 1, 1, 1, 1, 1,
-0.3333523, 1.221092, -0.03272465, 1, 1, 1, 1, 1,
-0.3330916, -0.7091783, -3.521511, 1, 1, 1, 1, 1,
-0.3317048, -1.908325, -3.472226, 1, 1, 1, 1, 1,
-0.3312787, 0.2385789, -1.044589, 1, 1, 1, 1, 1,
-0.3311944, -1.228924, -2.134399, 1, 1, 1, 1, 1,
-0.3179728, 0.9245389, 0.7729698, 1, 1, 1, 1, 1,
-0.3090934, -2.155784, -3.058099, 0, 0, 1, 1, 1,
-0.30182, 0.570227, 0.3178955, 1, 0, 0, 1, 1,
-0.2989989, 0.00337255, -3.538429, 1, 0, 0, 1, 1,
-0.2982185, 0.5045099, -0.4634919, 1, 0, 0, 1, 1,
-0.2974108, 1.231254, -0.008592055, 1, 0, 0, 1, 1,
-0.2972807, 0.08546918, -2.50345, 1, 0, 0, 1, 1,
-0.2952583, -0.79717, -3.528141, 0, 0, 0, 1, 1,
-0.2922356, 1.402187, 0.6061975, 0, 0, 0, 1, 1,
-0.2824626, 1.185872, 1.034876, 0, 0, 0, 1, 1,
-0.2784419, 0.9610246, -0.7355831, 0, 0, 0, 1, 1,
-0.2765976, -2.021358, -2.713109, 0, 0, 0, 1, 1,
-0.2731454, 0.1514964, -1.549176, 0, 0, 0, 1, 1,
-0.271515, 0.1490388, -0.3252919, 0, 0, 0, 1, 1,
-0.2690921, 2.535847, -1.490383, 1, 1, 1, 1, 1,
-0.2602318, 0.3729566, -2.850431, 1, 1, 1, 1, 1,
-0.2597618, 0.3372886, -0.01733213, 1, 1, 1, 1, 1,
-0.2596239, -1.300619, -3.373657, 1, 1, 1, 1, 1,
-0.2576163, 2.136652, 0.4983865, 1, 1, 1, 1, 1,
-0.2521771, 1.12224, 1.151206, 1, 1, 1, 1, 1,
-0.2462711, -0.8309911, -2.723272, 1, 1, 1, 1, 1,
-0.24512, -0.5952869, -3.00709, 1, 1, 1, 1, 1,
-0.2445728, -0.5027164, -2.568841, 1, 1, 1, 1, 1,
-0.2418705, -0.5797624, -3.679242, 1, 1, 1, 1, 1,
-0.241724, -0.3343447, -2.840638, 1, 1, 1, 1, 1,
-0.2401546, 0.7245003, 0.7755988, 1, 1, 1, 1, 1,
-0.2374987, -0.1597813, -2.164201, 1, 1, 1, 1, 1,
-0.2368056, 0.633657, 0.4722388, 1, 1, 1, 1, 1,
-0.2298303, 1.833341, -0.150107, 1, 1, 1, 1, 1,
-0.2282754, -1.045887, -3.31688, 0, 0, 1, 1, 1,
-0.2279845, 1.260208, -0.4469108, 1, 0, 0, 1, 1,
-0.2271374, -0.6962847, -2.619187, 1, 0, 0, 1, 1,
-0.2198969, 0.1197392, -0.7456438, 1, 0, 0, 1, 1,
-0.2168642, 0.8603363, -2.070608, 1, 0, 0, 1, 1,
-0.2142422, 0.4964275, -0.4870825, 1, 0, 0, 1, 1,
-0.2121365, 0.6199335, 0.3789944, 0, 0, 0, 1, 1,
-0.2104082, 0.3942612, -0.411941, 0, 0, 0, 1, 1,
-0.2085689, 1.174687, 1.337547, 0, 0, 0, 1, 1,
-0.2069111, 0.03803039, -1.043824, 0, 0, 0, 1, 1,
-0.2063899, 0.778699, -0.3791107, 0, 0, 0, 1, 1,
-0.206091, 0.6444569, -1.699208, 0, 0, 0, 1, 1,
-0.2057061, -0.05357405, -2.216887, 0, 0, 0, 1, 1,
-0.2015228, 1.620703, -0.04379078, 1, 1, 1, 1, 1,
-0.197781, -0.1174871, -3.011867, 1, 1, 1, 1, 1,
-0.196549, -0.4141853, -2.516164, 1, 1, 1, 1, 1,
-0.1955437, -0.312667, -2.805344, 1, 1, 1, 1, 1,
-0.1951183, -1.746057, -5.200771, 1, 1, 1, 1, 1,
-0.1950741, 1.022021, -0.9173348, 1, 1, 1, 1, 1,
-0.1939791, -0.2683751, -1.853351, 1, 1, 1, 1, 1,
-0.1934572, -0.4374516, -2.135578, 1, 1, 1, 1, 1,
-0.1907937, -0.3119366, -1.209015, 1, 1, 1, 1, 1,
-0.1898605, 1.07587, -0.206192, 1, 1, 1, 1, 1,
-0.1849004, 0.5582041, -0.1200898, 1, 1, 1, 1, 1,
-0.1844702, 0.04226484, -1.662572, 1, 1, 1, 1, 1,
-0.1823429, 1.510239, -1.168661, 1, 1, 1, 1, 1,
-0.1804691, -0.3710096, -3.842087, 1, 1, 1, 1, 1,
-0.1747789, -1.126222, -2.670464, 1, 1, 1, 1, 1,
-0.1715142, 2.265094, -1.785747, 0, 0, 1, 1, 1,
-0.1707865, 0.196054, -1.421946, 1, 0, 0, 1, 1,
-0.1604674, 1.30844, -0.6863163, 1, 0, 0, 1, 1,
-0.1573077, -1.272329, -1.393365, 1, 0, 0, 1, 1,
-0.1557486, -0.3379317, -3.859398, 1, 0, 0, 1, 1,
-0.1543468, -1.049587, -3.451056, 1, 0, 0, 1, 1,
-0.1535977, -0.1661535, -2.51247, 0, 0, 0, 1, 1,
-0.1468229, -0.5387735, -2.481686, 0, 0, 0, 1, 1,
-0.1454642, 0.8790229, -0.156361, 0, 0, 0, 1, 1,
-0.1411676, 0.8448105, 0.4968153, 0, 0, 0, 1, 1,
-0.1408868, -2.614128, -2.507844, 0, 0, 0, 1, 1,
-0.134616, 1.724217, -1.214343, 0, 0, 0, 1, 1,
-0.1344538, 0.9771425, -0.1333557, 0, 0, 0, 1, 1,
-0.1337266, 1.859967, 0.01335984, 1, 1, 1, 1, 1,
-0.1314223, -2.64824, -3.356, 1, 1, 1, 1, 1,
-0.1308421, -0.1183086, -0.3829229, 1, 1, 1, 1, 1,
-0.1272416, 0.5338889, 0.801968, 1, 1, 1, 1, 1,
-0.1246604, 1.253965, 1.349228, 1, 1, 1, 1, 1,
-0.1238834, -1.2625, -3.580493, 1, 1, 1, 1, 1,
-0.120883, 1.161043, 0.5877919, 1, 1, 1, 1, 1,
-0.1204397, 1.865505, 0.4387633, 1, 1, 1, 1, 1,
-0.1196829, 2.291537, 0.7265944, 1, 1, 1, 1, 1,
-0.1184603, -2.494369, -5.300251, 1, 1, 1, 1, 1,
-0.1153425, -0.6015109, -3.118878, 1, 1, 1, 1, 1,
-0.1093509, -0.2218334, -2.502496, 1, 1, 1, 1, 1,
-0.1048154, 0.1420443, -1.161054, 1, 1, 1, 1, 1,
-0.1024697, -0.9927754, -3.575573, 1, 1, 1, 1, 1,
-0.1006171, 2.298674, -1.305207, 1, 1, 1, 1, 1,
-0.09564283, -0.6078802, -3.649794, 0, 0, 1, 1, 1,
-0.08898444, -1.872702, -4.036571, 1, 0, 0, 1, 1,
-0.08763426, -0.3180896, -2.082562, 1, 0, 0, 1, 1,
-0.08096316, 0.4836159, -1.171429, 1, 0, 0, 1, 1,
-0.07842845, 0.4034231, -2.279252, 1, 0, 0, 1, 1,
-0.07299673, -0.6724997, -4.666806, 1, 0, 0, 1, 1,
-0.06516993, -1.560794, -2.533743, 0, 0, 0, 1, 1,
-0.0648286, 0.0469925, 0.6186962, 0, 0, 0, 1, 1,
-0.06117546, -1.10032, -3.035831, 0, 0, 0, 1, 1,
-0.06079304, 0.07597145, -1.529969, 0, 0, 0, 1, 1,
-0.05919986, -0.3232515, -3.315062, 0, 0, 0, 1, 1,
-0.05908439, 0.1808047, 0.6740807, 0, 0, 0, 1, 1,
-0.05663328, 0.8479084, -0.691026, 0, 0, 0, 1, 1,
-0.05090262, -0.08855847, -2.07155, 1, 1, 1, 1, 1,
-0.05043326, 0.3069426, -0.03028799, 1, 1, 1, 1, 1,
-0.03982611, 1.102412, -1.795147, 1, 1, 1, 1, 1,
-0.03981546, 0.02403339, -0.4669455, 1, 1, 1, 1, 1,
-0.03833235, -0.5403059, -3.4504, 1, 1, 1, 1, 1,
-0.03615963, -0.1332705, -2.746653, 1, 1, 1, 1, 1,
-0.03608278, -0.4032456, -2.765157, 1, 1, 1, 1, 1,
-0.03545472, 0.7366791, 1.002503, 1, 1, 1, 1, 1,
-0.03361807, -1.049092, -3.777551, 1, 1, 1, 1, 1,
-0.02678291, 1.574961, 0.08824389, 1, 1, 1, 1, 1,
-0.02553305, -0.5934053, -4.333136, 1, 1, 1, 1, 1,
-0.01458717, -0.07556812, -2.972739, 1, 1, 1, 1, 1,
-0.01364309, 1.23108, 0.1072367, 1, 1, 1, 1, 1,
-0.008843794, 1.226956, 1.339139, 1, 1, 1, 1, 1,
-0.0083847, -2.171439, -2.817855, 1, 1, 1, 1, 1,
-0.007593843, 0.9929228, 0.3858873, 0, 0, 1, 1, 1,
-0.006065196, 0.3182693, -0.5886974, 1, 0, 0, 1, 1,
-0.005874236, 1.442513, -0.7996884, 1, 0, 0, 1, 1,
-0.00243049, -1.562997, -4.263992, 1, 0, 0, 1, 1,
0.002864321, -1.325434, 3.342143, 1, 0, 0, 1, 1,
0.003607105, -0.8188807, 3.256802, 1, 0, 0, 1, 1,
0.009456315, 0.8779984, -0.2245194, 0, 0, 0, 1, 1,
0.00997923, 0.4409565, -1.001041, 0, 0, 0, 1, 1,
0.01092503, -0.4100169, 4.564721, 0, 0, 0, 1, 1,
0.0111965, 0.3339663, 0.4943061, 0, 0, 0, 1, 1,
0.01140481, 0.6750947, 1.847118, 0, 0, 0, 1, 1,
0.01340051, 0.9502034, -2.671483, 0, 0, 0, 1, 1,
0.01359487, 0.1403504, 0.8255207, 0, 0, 0, 1, 1,
0.01867947, 0.5458402, 1.652434, 1, 1, 1, 1, 1,
0.02121366, -0.6795259, 2.211279, 1, 1, 1, 1, 1,
0.02477926, 0.2104135, 1.244452, 1, 1, 1, 1, 1,
0.02751958, -0.3092262, 3.52256, 1, 1, 1, 1, 1,
0.02797343, -0.6448205, 4.225434, 1, 1, 1, 1, 1,
0.02962077, 2.187589, 0.1595162, 1, 1, 1, 1, 1,
0.03216457, -0.09213768, 4.254263, 1, 1, 1, 1, 1,
0.03561578, -1.236859, 3.806634, 1, 1, 1, 1, 1,
0.03662926, 0.2868027, 0.3642552, 1, 1, 1, 1, 1,
0.04023204, -0.8405511, 4.404356, 1, 1, 1, 1, 1,
0.04080362, -0.05841847, 1.053286, 1, 1, 1, 1, 1,
0.04360235, 0.3438079, 0.5906448, 1, 1, 1, 1, 1,
0.04733006, -1.214912, 3.583939, 1, 1, 1, 1, 1,
0.04965109, 1.183809, 0.08867604, 1, 1, 1, 1, 1,
0.05306682, -1.256847, 2.04823, 1, 1, 1, 1, 1,
0.05354822, -0.06628627, 2.672031, 0, 0, 1, 1, 1,
0.05422438, 0.688136, 0.7987524, 1, 0, 0, 1, 1,
0.05525264, -1.232569, 3.204092, 1, 0, 0, 1, 1,
0.05594296, 1.64459, 0.02099543, 1, 0, 0, 1, 1,
0.05929223, -0.3112646, 2.524257, 1, 0, 0, 1, 1,
0.05936148, 0.8167735, -0.8791655, 1, 0, 0, 1, 1,
0.06183786, -0.9393554, 3.383611, 0, 0, 0, 1, 1,
0.06535561, -1.018461, 4.888757, 0, 0, 0, 1, 1,
0.06702475, 0.5618854, -1.243263, 0, 0, 0, 1, 1,
0.07520124, -0.3319093, 2.596813, 0, 0, 0, 1, 1,
0.07660827, -0.3375179, 2.342841, 0, 0, 0, 1, 1,
0.07945643, 0.8816235, 1.313299, 0, 0, 0, 1, 1,
0.08294293, 0.4110236, 0.2661041, 0, 0, 0, 1, 1,
0.08348265, -0.8515488, 4.053575, 1, 1, 1, 1, 1,
0.0835819, -1.221287, 2.906529, 1, 1, 1, 1, 1,
0.08370209, 0.5110154, 0.5793304, 1, 1, 1, 1, 1,
0.08392693, -0.5602669, 3.538667, 1, 1, 1, 1, 1,
0.08953965, -0.8408949, 2.376541, 1, 1, 1, 1, 1,
0.09241705, -1.823445, 3.440845, 1, 1, 1, 1, 1,
0.09375752, -0.4664088, 2.3015, 1, 1, 1, 1, 1,
0.09427481, 1.843851, -0.6820134, 1, 1, 1, 1, 1,
0.09543681, -0.7176192, 1.071266, 1, 1, 1, 1, 1,
0.1013195, -1.729852, 2.835878, 1, 1, 1, 1, 1,
0.1020149, -1.591623, 0.8201771, 1, 1, 1, 1, 1,
0.1037258, 1.41307, -0.6970419, 1, 1, 1, 1, 1,
0.1054206, -0.8955082, 4.084948, 1, 1, 1, 1, 1,
0.1059857, 0.3925717, 0.2125947, 1, 1, 1, 1, 1,
0.1070962, 0.6339759, -0.8640125, 1, 1, 1, 1, 1,
0.1092604, 1.060847, 0.5312191, 0, 0, 1, 1, 1,
0.1122316, 1.378462, -2.97556, 1, 0, 0, 1, 1,
0.1213291, -0.8072084, 4.452625, 1, 0, 0, 1, 1,
0.1231329, -0.475903, 3.093997, 1, 0, 0, 1, 1,
0.1301316, -0.2565788, 3.474957, 1, 0, 0, 1, 1,
0.1301694, -0.4820141, 2.019089, 1, 0, 0, 1, 1,
0.131742, 1.415865, 0.6234387, 0, 0, 0, 1, 1,
0.1349981, -0.1404877, 2.931474, 0, 0, 0, 1, 1,
0.1354653, 0.6118853, 0.6003136, 0, 0, 0, 1, 1,
0.1365659, 1.11273, 1.852643, 0, 0, 0, 1, 1,
0.1383295, 1.327384, -0.03435575, 0, 0, 0, 1, 1,
0.1424107, 0.1832674, -0.2024314, 0, 0, 0, 1, 1,
0.1494577, 0.08089545, 2.321234, 0, 0, 0, 1, 1,
0.1534419, -0.1473367, 2.080556, 1, 1, 1, 1, 1,
0.1564319, 0.5275689, 2.042374, 1, 1, 1, 1, 1,
0.1595347, 0.7663336, -1.509553, 1, 1, 1, 1, 1,
0.1605013, -0.2342623, 2.72735, 1, 1, 1, 1, 1,
0.1617046, 0.00414428, 2.941845, 1, 1, 1, 1, 1,
0.1617752, 0.3840664, 1.630074, 1, 1, 1, 1, 1,
0.1635294, 1.090795, 1.2109, 1, 1, 1, 1, 1,
0.1732303, -0.4857855, 3.026219, 1, 1, 1, 1, 1,
0.1754771, -1.645629, 2.705233, 1, 1, 1, 1, 1,
0.1772624, 0.8245643, 1.346673, 1, 1, 1, 1, 1,
0.179211, 0.4521555, 1.536823, 1, 1, 1, 1, 1,
0.1800734, 0.6414385, 0.1074525, 1, 1, 1, 1, 1,
0.1827421, 1.25883, 0.550038, 1, 1, 1, 1, 1,
0.1843305, -1.96726, 2.273093, 1, 1, 1, 1, 1,
0.1843701, 1.106873, 0.5099481, 1, 1, 1, 1, 1,
0.1852202, 0.06256968, 2.400055, 0, 0, 1, 1, 1,
0.1856247, 0.3415577, 2.08555, 1, 0, 0, 1, 1,
0.1906388, -1.162283, 3.262779, 1, 0, 0, 1, 1,
0.1932305, 2.732522, 0.7086517, 1, 0, 0, 1, 1,
0.1937801, -0.59507, 2.311806, 1, 0, 0, 1, 1,
0.2014276, 1.206105, 1.020809, 1, 0, 0, 1, 1,
0.2018491, -0.5354437, 1.704347, 0, 0, 0, 1, 1,
0.203326, -0.8817013, 3.277307, 0, 0, 0, 1, 1,
0.2065682, 0.6545535, 1.396881, 0, 0, 0, 1, 1,
0.2070096, -0.2237222, 2.807639, 0, 0, 0, 1, 1,
0.2088459, 0.2649507, 0.01061762, 0, 0, 0, 1, 1,
0.2088527, -1.276617, 1.802728, 0, 0, 0, 1, 1,
0.2093494, 1.631889, -0.2470302, 0, 0, 0, 1, 1,
0.2113771, -0.3964897, 3.563991, 1, 1, 1, 1, 1,
0.2115545, -0.3964587, 2.482906, 1, 1, 1, 1, 1,
0.2120685, 2.027534, 1.074474, 1, 1, 1, 1, 1,
0.2168961, 0.3878413, -0.2065434, 1, 1, 1, 1, 1,
0.2183811, -0.7913539, 3.207293, 1, 1, 1, 1, 1,
0.2198598, 0.02388902, 2.72294, 1, 1, 1, 1, 1,
0.2200818, -1.863034, 1.994117, 1, 1, 1, 1, 1,
0.2228225, -1.522918, 3.823081, 1, 1, 1, 1, 1,
0.2256704, -1.093101, 2.575414, 1, 1, 1, 1, 1,
0.2265942, 1.452608, 0.8139672, 1, 1, 1, 1, 1,
0.2281071, -1.135599, 2.538386, 1, 1, 1, 1, 1,
0.2288925, 1.39059, -1.349763, 1, 1, 1, 1, 1,
0.229893, -0.3614516, 0.2388403, 1, 1, 1, 1, 1,
0.2339301, 1.389132, 0.4476102, 1, 1, 1, 1, 1,
0.2408969, 1.515244, -0.02077289, 1, 1, 1, 1, 1,
0.2420678, 0.5294818, 1.523402, 0, 0, 1, 1, 1,
0.2421924, -1.563313, 3.056948, 1, 0, 0, 1, 1,
0.2429725, 0.7594593, -0.454528, 1, 0, 0, 1, 1,
0.2478552, -0.4158557, 2.588474, 1, 0, 0, 1, 1,
0.2493751, -0.847143, 1.538711, 1, 0, 0, 1, 1,
0.249884, -1.859474, 2.525961, 1, 0, 0, 1, 1,
0.2534611, -0.1259099, 1.575939, 0, 0, 0, 1, 1,
0.2540194, -0.3956051, 1.678464, 0, 0, 0, 1, 1,
0.2563863, -0.0699539, 2.591169, 0, 0, 0, 1, 1,
0.2681644, 0.7955453, 0.07090419, 0, 0, 0, 1, 1,
0.2683594, -0.4854807, 2.293379, 0, 0, 0, 1, 1,
0.2753262, 0.5057716, 1.571409, 0, 0, 0, 1, 1,
0.279772, -0.4562759, 1.134259, 0, 0, 0, 1, 1,
0.2806389, -0.2263511, 3.274172, 1, 1, 1, 1, 1,
0.2829857, -1.363042, 4.204268, 1, 1, 1, 1, 1,
0.2871552, 0.7285385, 0.5366682, 1, 1, 1, 1, 1,
0.2908163, 1.223966, -0.09664177, 1, 1, 1, 1, 1,
0.2972626, 2.564925, -0.5557756, 1, 1, 1, 1, 1,
0.2988821, 1.465648, 1.754739, 1, 1, 1, 1, 1,
0.2990362, 0.1965568, 0.4315984, 1, 1, 1, 1, 1,
0.3107435, -0.06147568, 2.857022, 1, 1, 1, 1, 1,
0.3140997, -0.3316833, 1.262546, 1, 1, 1, 1, 1,
0.3168151, 0.7444409, 0.9306396, 1, 1, 1, 1, 1,
0.3222176, 0.3617702, -0.00615729, 1, 1, 1, 1, 1,
0.327928, 1.901483, -1.861992, 1, 1, 1, 1, 1,
0.3299215, -3.001991, 3.809519, 1, 1, 1, 1, 1,
0.3344507, 0.248329, 1.384044, 1, 1, 1, 1, 1,
0.338373, 0.513006, 2.012981, 1, 1, 1, 1, 1,
0.338673, 0.4991079, -1.228787, 0, 0, 1, 1, 1,
0.3400281, -0.3365709, 1.550448, 1, 0, 0, 1, 1,
0.3405091, 1.959273, 1.178173, 1, 0, 0, 1, 1,
0.3443298, 0.6393819, 1.573575, 1, 0, 0, 1, 1,
0.3459775, -1.802435, 1.588679, 1, 0, 0, 1, 1,
0.3464452, 2.18804, 1.883821, 1, 0, 0, 1, 1,
0.347689, 0.5790154, 0.1033202, 0, 0, 0, 1, 1,
0.3480153, -1.033908, 1.566159, 0, 0, 0, 1, 1,
0.3491243, 0.421398, 0.9963837, 0, 0, 0, 1, 1,
0.3494373, -0.3829039, 3.579616, 0, 0, 0, 1, 1,
0.3495362, -1.092424, 4.216367, 0, 0, 0, 1, 1,
0.3524405, 1.318246, 0.2293032, 0, 0, 0, 1, 1,
0.3599276, -1.724321, 2.968752, 0, 0, 0, 1, 1,
0.3605901, 0.8805459, 1.005427, 1, 1, 1, 1, 1,
0.3623248, 0.589144, 1.513968, 1, 1, 1, 1, 1,
0.3625142, -0.5420299, 2.711993, 1, 1, 1, 1, 1,
0.3627383, 1.102808, -1.697592, 1, 1, 1, 1, 1,
0.3706385, 0.7296182, -0.6125857, 1, 1, 1, 1, 1,
0.3717361, 0.3482929, 0.8477516, 1, 1, 1, 1, 1,
0.3749363, -0.2193634, 1.887438, 1, 1, 1, 1, 1,
0.3749642, 0.08905175, 1.780174, 1, 1, 1, 1, 1,
0.3763086, 1.223783, -0.1102115, 1, 1, 1, 1, 1,
0.3769569, -2.569408, 3.915298, 1, 1, 1, 1, 1,
0.3796928, 0.3098407, 0.4085737, 1, 1, 1, 1, 1,
0.3798777, 0.3394311, 0.8333147, 1, 1, 1, 1, 1,
0.3891572, -0.5247219, 2.337606, 1, 1, 1, 1, 1,
0.3901344, -1.358836, 1.98721, 1, 1, 1, 1, 1,
0.3910266, -1.884051, 1.73321, 1, 1, 1, 1, 1,
0.3912904, 2.391031, -0.6510194, 0, 0, 1, 1, 1,
0.3942255, 0.3304688, 2.57306, 1, 0, 0, 1, 1,
0.3980284, -0.5112783, 4.738347, 1, 0, 0, 1, 1,
0.4067146, 0.2267917, 1.579182, 1, 0, 0, 1, 1,
0.4083355, 0.6856163, 0.9984426, 1, 0, 0, 1, 1,
0.4093525, 0.9815716, -0.260991, 1, 0, 0, 1, 1,
0.4155015, 2.156324, 0.2697647, 0, 0, 0, 1, 1,
0.417685, 0.0203311, 1.307886, 0, 0, 0, 1, 1,
0.4199311, -1.925263, 0.7254851, 0, 0, 0, 1, 1,
0.4199964, -0.4338942, 1.479085, 0, 0, 0, 1, 1,
0.4256448, 0.03253241, 2.657985, 0, 0, 0, 1, 1,
0.4337195, 0.06578047, 1.206262, 0, 0, 0, 1, 1,
0.4339799, -0.141674, 2.941819, 0, 0, 0, 1, 1,
0.4431975, -0.3358552, 2.37182, 1, 1, 1, 1, 1,
0.4441954, -1.538925, 3.198875, 1, 1, 1, 1, 1,
0.4464666, -0.4474705, 2.926228, 1, 1, 1, 1, 1,
0.4468516, -1.121964, 1.467601, 1, 1, 1, 1, 1,
0.4474386, 2.566872, -0.3208877, 1, 1, 1, 1, 1,
0.4493473, 0.1990184, 1.212623, 1, 1, 1, 1, 1,
0.4539183, 0.3750579, 3.038947, 1, 1, 1, 1, 1,
0.4540115, 1.288073, 0.4584757, 1, 1, 1, 1, 1,
0.4614299, -0.2549264, 1.072972, 1, 1, 1, 1, 1,
0.4636632, -1.644924, 0.8406242, 1, 1, 1, 1, 1,
0.4649643, -0.728363, 2.185287, 1, 1, 1, 1, 1,
0.4655232, -1.773886, 5.082071, 1, 1, 1, 1, 1,
0.4660894, -0.3012433, 2.408983, 1, 1, 1, 1, 1,
0.4725289, -1.914393, 3.239004, 1, 1, 1, 1, 1,
0.4733409, -1.755561, 3.156683, 1, 1, 1, 1, 1,
0.4750346, 0.4459952, 2.715339, 0, 0, 1, 1, 1,
0.4775799, -0.5998746, 4.427203, 1, 0, 0, 1, 1,
0.4783131, -0.9636799, 3.043758, 1, 0, 0, 1, 1,
0.4829687, -1.100134, 2.973986, 1, 0, 0, 1, 1,
0.4830267, 0.9302397, 2.197914, 1, 0, 0, 1, 1,
0.4845706, -1.50656, 4.32782, 1, 0, 0, 1, 1,
0.4889434, -1.612596, 3.319657, 0, 0, 0, 1, 1,
0.4910958, -1.004243, 2.927061, 0, 0, 0, 1, 1,
0.4933532, 1.101963, 0.1192758, 0, 0, 0, 1, 1,
0.4936717, 0.2250407, 2.278797, 0, 0, 0, 1, 1,
0.4941373, -0.3952403, 1.652799, 0, 0, 0, 1, 1,
0.4974603, -0.1663826, 2.525781, 0, 0, 0, 1, 1,
0.4989533, 0.3651873, 0.8119264, 0, 0, 0, 1, 1,
0.5003396, 0.8515796, -0.501785, 1, 1, 1, 1, 1,
0.5018364, 0.6590363, -2.444715, 1, 1, 1, 1, 1,
0.5036406, -1.564303, 4.272869, 1, 1, 1, 1, 1,
0.5132387, 1.201606, 0.2855206, 1, 1, 1, 1, 1,
0.515892, -0.1841252, 2.087246, 1, 1, 1, 1, 1,
0.5188612, -1.229984, 3.473262, 1, 1, 1, 1, 1,
0.5259112, -0.1877043, 2.211024, 1, 1, 1, 1, 1,
0.5270786, 1.245077, -0.4469685, 1, 1, 1, 1, 1,
0.5296716, -1.094775, 2.480223, 1, 1, 1, 1, 1,
0.5350456, 0.5662422, 1.694481, 1, 1, 1, 1, 1,
0.5395232, -0.3813888, 2.614378, 1, 1, 1, 1, 1,
0.5419893, 1.634152, 0.3290909, 1, 1, 1, 1, 1,
0.5464748, -0.548867, 2.246004, 1, 1, 1, 1, 1,
0.5472472, -0.3211108, 1.739434, 1, 1, 1, 1, 1,
0.5539847, -0.757957, 1.958618, 1, 1, 1, 1, 1,
0.5581856, 0.1504234, 3.759393, 0, 0, 1, 1, 1,
0.5591902, -0.4005848, 2.250645, 1, 0, 0, 1, 1,
0.5601484, 1.058877, 1.251797, 1, 0, 0, 1, 1,
0.560167, 2.054293, 1.033007, 1, 0, 0, 1, 1,
0.5670443, -2.425489, 1.827065, 1, 0, 0, 1, 1,
0.5733328, 1.084549, 2.166459, 1, 0, 0, 1, 1,
0.5737371, -0.2587064, 1.824099, 0, 0, 0, 1, 1,
0.5747401, -0.3652522, 2.570979, 0, 0, 0, 1, 1,
0.5773658, -0.1118797, -0.4181629, 0, 0, 0, 1, 1,
0.5847605, -1.419534, 1.838009, 0, 0, 0, 1, 1,
0.5847957, -0.8229289, 1.433531, 0, 0, 0, 1, 1,
0.5852057, -0.4542358, 0.2268166, 0, 0, 0, 1, 1,
0.5855322, -0.8219023, 2.292779, 0, 0, 0, 1, 1,
0.596354, -1.259359, 2.251891, 1, 1, 1, 1, 1,
0.5986674, 0.3048626, -0.5930299, 1, 1, 1, 1, 1,
0.6006895, 0.1552292, 0.8933909, 1, 1, 1, 1, 1,
0.6013693, -0.9859655, 2.865734, 1, 1, 1, 1, 1,
0.6047221, 0.8820332, 1.872179, 1, 1, 1, 1, 1,
0.6084833, 0.2565791, 0.3401848, 1, 1, 1, 1, 1,
0.6144957, -0.9680285, 1.182392, 1, 1, 1, 1, 1,
0.6147803, 0.07581408, 1.070177, 1, 1, 1, 1, 1,
0.6179712, -0.8879972, 3.711894, 1, 1, 1, 1, 1,
0.621052, 0.450668, 2.074997, 1, 1, 1, 1, 1,
0.6258584, -1.547643, 1.159408, 1, 1, 1, 1, 1,
0.6286073, 1.063957, 0.1487391, 1, 1, 1, 1, 1,
0.6299567, -1.252641, 2.682293, 1, 1, 1, 1, 1,
0.6335956, -1.338272, 3.197911, 1, 1, 1, 1, 1,
0.6366078, -0.5933048, 1.218308, 1, 1, 1, 1, 1,
0.643818, -0.3438452, 1.649313, 0, 0, 1, 1, 1,
0.6459268, -1.763907, 0.4996153, 1, 0, 0, 1, 1,
0.6492344, 0.2428616, 1.986166, 1, 0, 0, 1, 1,
0.6530573, 0.5864852, 0.4795988, 1, 0, 0, 1, 1,
0.6565772, 0.5788736, 0.5264359, 1, 0, 0, 1, 1,
0.6575907, -0.4428053, 2.812134, 1, 0, 0, 1, 1,
0.6636027, 0.689186, -0.6893353, 0, 0, 0, 1, 1,
0.6658812, 1.591809, -0.7141711, 0, 0, 0, 1, 1,
0.666195, 1.477441, -1.087341, 0, 0, 0, 1, 1,
0.6683716, 0.4622995, 0.5322098, 0, 0, 0, 1, 1,
0.6713324, 0.1140186, 2.1463, 0, 0, 0, 1, 1,
0.6727275, -0.7674421, 1.299861, 0, 0, 0, 1, 1,
0.6728857, 0.006852983, 0.3862588, 0, 0, 0, 1, 1,
0.6736635, -0.005135086, 2.925272, 1, 1, 1, 1, 1,
0.6784481, 0.6565286, 0.4619589, 1, 1, 1, 1, 1,
0.6839017, -0.2722122, 1.383471, 1, 1, 1, 1, 1,
0.6882089, -0.2645964, 2.675606, 1, 1, 1, 1, 1,
0.6884767, 0.2975186, 2.162163, 1, 1, 1, 1, 1,
0.6888459, -0.1312088, 3.270803, 1, 1, 1, 1, 1,
0.6908736, 0.08756886, 1.425501, 1, 1, 1, 1, 1,
0.6931227, -0.2664323, -0.6332368, 1, 1, 1, 1, 1,
0.6945432, 1.343661, 0.8199108, 1, 1, 1, 1, 1,
0.6952557, 0.005855503, 2.568534, 1, 1, 1, 1, 1,
0.6980507, 0.4764661, 0.8311485, 1, 1, 1, 1, 1,
0.6987711, 0.8347673, 0.5116929, 1, 1, 1, 1, 1,
0.6998087, 1.041445, 1.420012, 1, 1, 1, 1, 1,
0.7015388, -1.074855, 1.398791, 1, 1, 1, 1, 1,
0.7017443, -0.3068026, 2.183142, 1, 1, 1, 1, 1,
0.7059152, 0.6710801, 2.927397, 0, 0, 1, 1, 1,
0.7142473, -2.353783, 3.465103, 1, 0, 0, 1, 1,
0.7171566, -1.396217, 1.941207, 1, 0, 0, 1, 1,
0.7181745, -0.9969373, 3.329659, 1, 0, 0, 1, 1,
0.7193304, -1.652905, 0.6441332, 1, 0, 0, 1, 1,
0.7210632, 1.107096, 1.95195, 1, 0, 0, 1, 1,
0.7269351, 0.1253046, 1.843874, 0, 0, 0, 1, 1,
0.7277609, -0.83938, 4.522146, 0, 0, 0, 1, 1,
0.7298261, -2.046545, 3.976815, 0, 0, 0, 1, 1,
0.7341012, -0.608407, 3.221489, 0, 0, 0, 1, 1,
0.7345351, 1.27052, 1.252136, 0, 0, 0, 1, 1,
0.7360288, 1.8864, 0.4719053, 0, 0, 0, 1, 1,
0.7423787, -0.9582155, 1.788246, 0, 0, 0, 1, 1,
0.7538969, -0.3408502, 0.7640471, 1, 1, 1, 1, 1,
0.7596541, 1.019252, 0.1440167, 1, 1, 1, 1, 1,
0.7615705, 1.248963, 0.8401712, 1, 1, 1, 1, 1,
0.7624685, 0.8132731, 2.688374, 1, 1, 1, 1, 1,
0.7624829, 1.036366, 1.624187, 1, 1, 1, 1, 1,
0.7647969, -0.4466207, 1.402717, 1, 1, 1, 1, 1,
0.7672362, -0.007328042, -0.07736545, 1, 1, 1, 1, 1,
0.767341, -0.1405076, 0.9576268, 1, 1, 1, 1, 1,
0.7700352, 0.3078197, 2.274111, 1, 1, 1, 1, 1,
0.7758926, 0.6919085, 1.142798, 1, 1, 1, 1, 1,
0.7777168, 0.5774508, 1.415035, 1, 1, 1, 1, 1,
0.7864585, 1.104987, 3.090268, 1, 1, 1, 1, 1,
0.7990743, -1.368701, 2.13348, 1, 1, 1, 1, 1,
0.8033258, -1.859025, 2.568043, 1, 1, 1, 1, 1,
0.8141371, -2.975147, 2.457607, 1, 1, 1, 1, 1,
0.8159012, -0.2477619, 1.477123, 0, 0, 1, 1, 1,
0.8227617, -1.478202, 2.928208, 1, 0, 0, 1, 1,
0.8235583, -2.290506, 2.540904, 1, 0, 0, 1, 1,
0.8237485, -0.3142531, 3.11591, 1, 0, 0, 1, 1,
0.8249136, -0.6211494, 2.594271, 1, 0, 0, 1, 1,
0.8334072, 1.0017, 2.365944, 1, 0, 0, 1, 1,
0.8400782, -0.01650922, 1.461337, 0, 0, 0, 1, 1,
0.8405755, 0.7114854, -0.5203415, 0, 0, 0, 1, 1,
0.8416874, 0.07261466, 1.024787, 0, 0, 0, 1, 1,
0.8429057, 0.8564127, -0.2368106, 0, 0, 0, 1, 1,
0.846505, -0.4720435, 2.02156, 0, 0, 0, 1, 1,
0.8480453, 1.613342, 0.7530384, 0, 0, 0, 1, 1,
0.8483536, -0.5486333, 2.159362, 0, 0, 0, 1, 1,
0.8489056, -0.8407726, 3.586376, 1, 1, 1, 1, 1,
0.8559572, 0.81629, -2.866813, 1, 1, 1, 1, 1,
0.8583113, -0.927358, 1.40095, 1, 1, 1, 1, 1,
0.8609442, 0.2696665, -0.03883119, 1, 1, 1, 1, 1,
0.8620796, 0.7890663, 1.168982, 1, 1, 1, 1, 1,
0.8627419, 0.1447157, 1.644562, 1, 1, 1, 1, 1,
0.863261, 0.6791821, 1.440039, 1, 1, 1, 1, 1,
0.8680965, -1.531169, 3.580724, 1, 1, 1, 1, 1,
0.881117, -0.3905155, 1.824578, 1, 1, 1, 1, 1,
0.8903586, 1.310469, 1.659405, 1, 1, 1, 1, 1,
0.8949807, 1.730071, 0.1955746, 1, 1, 1, 1, 1,
0.8960269, -0.405556, 1.738092, 1, 1, 1, 1, 1,
0.8997478, -1.104594, 2.67639, 1, 1, 1, 1, 1,
0.9031026, 0.5691085, 2.364119, 1, 1, 1, 1, 1,
0.9054216, -1.876668, 5.369845, 1, 1, 1, 1, 1,
0.9137495, -1.226819, 2.55601, 0, 0, 1, 1, 1,
0.9276301, 0.01800469, 2.391032, 1, 0, 0, 1, 1,
0.9293013, -0.1799626, 3.102142, 1, 0, 0, 1, 1,
0.9315397, -0.9277773, 4.729194, 1, 0, 0, 1, 1,
0.9376854, -0.3116041, 2.335596, 1, 0, 0, 1, 1,
0.9386753, -0.7507238, 3.520422, 1, 0, 0, 1, 1,
0.9456804, 1.238315, 0.3625461, 0, 0, 0, 1, 1,
0.9478903, 0.36319, 0.07668876, 0, 0, 0, 1, 1,
0.9480438, -2.199433, 1.741358, 0, 0, 0, 1, 1,
0.9605367, -1.100882, 2.817477, 0, 0, 0, 1, 1,
0.9614934, 1.14979, 1.054927, 0, 0, 0, 1, 1,
0.9676236, 0.1759204, 1.980808, 0, 0, 0, 1, 1,
0.9703104, -1.869162, 2.549278, 0, 0, 0, 1, 1,
0.975877, 0.3680854, 2.282811, 1, 1, 1, 1, 1,
0.9812981, 1.139496, 0.9838367, 1, 1, 1, 1, 1,
0.9942408, 2.779128, 0.4705265, 1, 1, 1, 1, 1,
0.9943756, 0.7429274, 1.378598, 1, 1, 1, 1, 1,
1.007257, 0.4658085, -0.7252569, 1, 1, 1, 1, 1,
1.009104, 1.048461, 0.1695868, 1, 1, 1, 1, 1,
1.01079, -0.3065197, 1.298979, 1, 1, 1, 1, 1,
1.012845, 0.8396406, -0.1220947, 1, 1, 1, 1, 1,
1.013202, -0.6834831, 2.144322, 1, 1, 1, 1, 1,
1.015884, -1.362964, 3.208452, 1, 1, 1, 1, 1,
1.026849, -0.7848055, 2.928053, 1, 1, 1, 1, 1,
1.029425, 0.1193878, 1.370958, 1, 1, 1, 1, 1,
1.035106, 0.1961913, 1.851654, 1, 1, 1, 1, 1,
1.035958, -0.8409595, 3.010394, 1, 1, 1, 1, 1,
1.03918, 0.3378978, 3.333194, 1, 1, 1, 1, 1,
1.040647, -0.04443866, -0.1072084, 0, 0, 1, 1, 1,
1.040786, 0.4186914, 0.4688212, 1, 0, 0, 1, 1,
1.044212, -0.1318548, 1.807909, 1, 0, 0, 1, 1,
1.045318, -1.126141, 0.7293638, 1, 0, 0, 1, 1,
1.048264, 0.4267267, 2.208107, 1, 0, 0, 1, 1,
1.055974, 0.7904231, 0.001724612, 1, 0, 0, 1, 1,
1.060639, -1.521251, 2.045214, 0, 0, 0, 1, 1,
1.061584, -0.4475373, 2.437897, 0, 0, 0, 1, 1,
1.069323, 0.5989009, 1.037014, 0, 0, 0, 1, 1,
1.07681, -0.9855739, -0.02451483, 0, 0, 0, 1, 1,
1.078829, 0.9470747, 2.417786, 0, 0, 0, 1, 1,
1.079454, -3.056727, 1.790294, 0, 0, 0, 1, 1,
1.080799, 0.2562869, 0.3869231, 0, 0, 0, 1, 1,
1.080973, -0.1660801, -0.6756108, 1, 1, 1, 1, 1,
1.08342, 1.654808, -0.05590947, 1, 1, 1, 1, 1,
1.085282, 0.3040194, 2.730454, 1, 1, 1, 1, 1,
1.095391, -1.287562, 3.465341, 1, 1, 1, 1, 1,
1.095985, -0.9536529, 1.745901, 1, 1, 1, 1, 1,
1.097172, 1.074753, 1.09499, 1, 1, 1, 1, 1,
1.097884, 1.659771, 0.5456203, 1, 1, 1, 1, 1,
1.099027, 1.262929, 0.9936167, 1, 1, 1, 1, 1,
1.099569, -2.383636, 4.727755, 1, 1, 1, 1, 1,
1.101217, 0.4548397, 1.745899, 1, 1, 1, 1, 1,
1.111011, -1.609102, 3.315193, 1, 1, 1, 1, 1,
1.11784, -0.1144848, 1.229368, 1, 1, 1, 1, 1,
1.121527, -1.226611, 1.512101, 1, 1, 1, 1, 1,
1.12308, 0.1393733, 2.547507, 1, 1, 1, 1, 1,
1.130407, 0.1500335, 2.131329, 1, 1, 1, 1, 1,
1.132661, 2.339526, 1.776332, 0, 0, 1, 1, 1,
1.13335, -0.3600428, 2.904887, 1, 0, 0, 1, 1,
1.134234, -0.5460311, 3.267541, 1, 0, 0, 1, 1,
1.138206, -0.8773112, 2.456049, 1, 0, 0, 1, 1,
1.139729, 1.16733, 2.023688, 1, 0, 0, 1, 1,
1.144081, 1.232293, 1.600418, 1, 0, 0, 1, 1,
1.14535, -0.5708493, 1.821661, 0, 0, 0, 1, 1,
1.145662, -0.3636823, 1.536487, 0, 0, 0, 1, 1,
1.15183, -0.5537398, 2.653693, 0, 0, 0, 1, 1,
1.161968, 0.7389987, 2.335832, 0, 0, 0, 1, 1,
1.167637, -0.903793, 4.305372, 0, 0, 0, 1, 1,
1.187332, 1.189647, 0.7294573, 0, 0, 0, 1, 1,
1.207246, 1.278779, -1.039642, 0, 0, 0, 1, 1,
1.210121, 1.775311, -0.7838997, 1, 1, 1, 1, 1,
1.210984, 0.8669679, 0.79348, 1, 1, 1, 1, 1,
1.215004, 0.1239821, 0.2821921, 1, 1, 1, 1, 1,
1.218064, -0.5824872, 1.150397, 1, 1, 1, 1, 1,
1.219659, -0.7969646, 2.490411, 1, 1, 1, 1, 1,
1.224848, -0.9162893, 2.838157, 1, 1, 1, 1, 1,
1.230621, -0.8263199, 2.569714, 1, 1, 1, 1, 1,
1.243768, 0.6601489, 0.2143285, 1, 1, 1, 1, 1,
1.250551, -1.05138, 2.37146, 1, 1, 1, 1, 1,
1.250952, 1.02878, -1.707284, 1, 1, 1, 1, 1,
1.254836, 0.00808927, 1.023543, 1, 1, 1, 1, 1,
1.255944, -1.293928, 2.816246, 1, 1, 1, 1, 1,
1.262994, -0.1493104, 1.994747, 1, 1, 1, 1, 1,
1.268694, 0.3134156, 1.117284, 1, 1, 1, 1, 1,
1.271394, 0.7561075, 1.363739, 1, 1, 1, 1, 1,
1.282906, 0.6145932, 1.283947, 0, 0, 1, 1, 1,
1.289591, 0.2740256, -0.2690992, 1, 0, 0, 1, 1,
1.290153, 1.655535, 2.504132, 1, 0, 0, 1, 1,
1.293312, -1.454756, 0.5023524, 1, 0, 0, 1, 1,
1.304824, -0.2394195, 1.334011, 1, 0, 0, 1, 1,
1.306041, -2.32726, 3.354831, 1, 0, 0, 1, 1,
1.310472, 0.5857345, 0.07705798, 0, 0, 0, 1, 1,
1.311327, 1.249448, -0.5695398, 0, 0, 0, 1, 1,
1.315062, -0.6707897, 2.239994, 0, 0, 0, 1, 1,
1.326568, 0.531097, 1.187722, 0, 0, 0, 1, 1,
1.331174, -0.9375305, 1.721647, 0, 0, 0, 1, 1,
1.336125, 0.06606527, 3.199944, 0, 0, 0, 1, 1,
1.341317, 1.192383, 0.4314918, 0, 0, 0, 1, 1,
1.341427, -0.5037709, 1.351549, 1, 1, 1, 1, 1,
1.34389, 0.5716857, 2.613875, 1, 1, 1, 1, 1,
1.344384, 0.1842154, -0.1123705, 1, 1, 1, 1, 1,
1.346235, -1.318848, 2.431637, 1, 1, 1, 1, 1,
1.348129, -0.8442416, 2.250838, 1, 1, 1, 1, 1,
1.350085, 0.3962081, 1.584746, 1, 1, 1, 1, 1,
1.352014, -0.1199117, 1.22049, 1, 1, 1, 1, 1,
1.357725, -0.1860332, 2.209128, 1, 1, 1, 1, 1,
1.360031, 1.754782, 0.5221883, 1, 1, 1, 1, 1,
1.363037, -1.000474, 2.069736, 1, 1, 1, 1, 1,
1.371812, -1.612719, 1.427144, 1, 1, 1, 1, 1,
1.377254, -0.222207, 0.5620468, 1, 1, 1, 1, 1,
1.380956, 0.276187, 1.231793, 1, 1, 1, 1, 1,
1.396238, 0.7781753, 0.5627006, 1, 1, 1, 1, 1,
1.396515, -0.5403082, 0.5855282, 1, 1, 1, 1, 1,
1.401611, -1.32193, 2.409753, 0, 0, 1, 1, 1,
1.401864, 1.506652, 0.6182088, 1, 0, 0, 1, 1,
1.406314, 0.4431767, 0.6797006, 1, 0, 0, 1, 1,
1.412997, -0.7053762, 3.106728, 1, 0, 0, 1, 1,
1.413257, -1.412202, 2.155334, 1, 0, 0, 1, 1,
1.425154, 0.8196907, 1.152332, 1, 0, 0, 1, 1,
1.437594, -0.4696382, 1.4024, 0, 0, 0, 1, 1,
1.446072, 0.06142037, 1.616918, 0, 0, 0, 1, 1,
1.448941, -0.4336094, 2.285059, 0, 0, 0, 1, 1,
1.458804, -1.562002, 5.106277, 0, 0, 0, 1, 1,
1.474455, -0.3877401, 2.31966, 0, 0, 0, 1, 1,
1.47857, 0.2069283, 0.929018, 0, 0, 0, 1, 1,
1.479318, 0.3157828, 0.5852434, 0, 0, 0, 1, 1,
1.47981, -0.2273956, 2.398319, 1, 1, 1, 1, 1,
1.48543, -0.7506028, 3.479045, 1, 1, 1, 1, 1,
1.492076, -1.963024, 2.694003, 1, 1, 1, 1, 1,
1.492236, -2.310567, 4.439244, 1, 1, 1, 1, 1,
1.515779, 0.7434568, 1.812037, 1, 1, 1, 1, 1,
1.530514, 0.2425559, -0.01092773, 1, 1, 1, 1, 1,
1.550367, -0.9909986, 0.8382614, 1, 1, 1, 1, 1,
1.551501, -0.9941901, 2.512922, 1, 1, 1, 1, 1,
1.556022, 0.6621944, 1.055901, 1, 1, 1, 1, 1,
1.561964, 1.067605, -0.639057, 1, 1, 1, 1, 1,
1.573838, -0.7180243, 1.446838, 1, 1, 1, 1, 1,
1.574073, -0.3791895, 2.681126, 1, 1, 1, 1, 1,
1.58891, 1.716974, 0.5058877, 1, 1, 1, 1, 1,
1.607166, -0.4969633, 2.782816, 1, 1, 1, 1, 1,
1.607235, -0.4901603, 1.978688, 1, 1, 1, 1, 1,
1.608912, 0.6725859, 1.701512, 0, 0, 1, 1, 1,
1.627016, -0.08157554, 1.24466, 1, 0, 0, 1, 1,
1.646968, 0.657334, 0.7602203, 1, 0, 0, 1, 1,
1.656857, 1.168713, 0.1693786, 1, 0, 0, 1, 1,
1.666417, -0.3450198, 0.5799772, 1, 0, 0, 1, 1,
1.673185, 0.1235831, 2.201871, 1, 0, 0, 1, 1,
1.688258, 1.226017, 2.432781, 0, 0, 0, 1, 1,
1.694658, 0.021416, -0.2105197, 0, 0, 0, 1, 1,
1.712709, -0.1391851, -0.8854837, 0, 0, 0, 1, 1,
1.713541, -0.2932115, 2.709852, 0, 0, 0, 1, 1,
1.727447, -1.138453, -1.442572, 0, 0, 0, 1, 1,
1.739324, 0.7237967, 1.482351, 0, 0, 0, 1, 1,
1.743691, 0.8705754, 1.769768, 0, 0, 0, 1, 1,
1.752419, 0.8842731, -0.5509478, 1, 1, 1, 1, 1,
1.760479, -0.3199505, 1.316666, 1, 1, 1, 1, 1,
1.7672, -1.4085, 2.587068, 1, 1, 1, 1, 1,
1.775568, 1.527535, 1.223107, 1, 1, 1, 1, 1,
1.787265, -0.03803659, 0.9030922, 1, 1, 1, 1, 1,
1.822091, -1.773576, 1.321158, 1, 1, 1, 1, 1,
1.823409, -0.5971441, 0.9796114, 1, 1, 1, 1, 1,
1.833932, 0.3190605, 1.243867, 1, 1, 1, 1, 1,
1.852992, -1.68109, 3.900965, 1, 1, 1, 1, 1,
1.867256, -1.020102, 0.8118204, 1, 1, 1, 1, 1,
1.888102, 2.43441, 0.4127307, 1, 1, 1, 1, 1,
1.894558, -0.1608398, 1.684945, 1, 1, 1, 1, 1,
1.950022, 0.1275505, 0.05399018, 1, 1, 1, 1, 1,
1.999848, -0.1719416, 1.2628, 1, 1, 1, 1, 1,
2.0211, -1.018399, 2.638002, 1, 1, 1, 1, 1,
2.048651, 1.259807, 0.3104458, 0, 0, 1, 1, 1,
2.065, 1.173993, -0.7482426, 1, 0, 0, 1, 1,
2.079285, 1.530917, 1.56444, 1, 0, 0, 1, 1,
2.082744, -0.7574393, 2.502877, 1, 0, 0, 1, 1,
2.092784, -0.8952625, 2.097767, 1, 0, 0, 1, 1,
2.092786, -0.7921901, 3.5553, 1, 0, 0, 1, 1,
2.107195, 0.5759701, 2.674642, 0, 0, 0, 1, 1,
2.155672, 0.6621792, 2.485838, 0, 0, 0, 1, 1,
2.15852, 0.4678088, 0.6731778, 0, 0, 0, 1, 1,
2.168243, 0.1047641, 1.19032, 0, 0, 0, 1, 1,
2.238205, 2.695963, 1.181822, 0, 0, 0, 1, 1,
2.255939, 0.07642903, -0.6931937, 0, 0, 0, 1, 1,
2.276084, 0.6013617, 1.180035, 0, 0, 0, 1, 1,
2.324151, -0.1367792, 2.820657, 1, 1, 1, 1, 1,
2.332826, -0.1825133, 2.361602, 1, 1, 1, 1, 1,
2.510307, -1.072368, 2.613899, 1, 1, 1, 1, 1,
2.550962, -0.2390975, 2.558167, 1, 1, 1, 1, 1,
2.557053, 0.6953495, 1.9423, 1, 1, 1, 1, 1,
3.178774, 0.1300307, 0.3894027, 1, 1, 1, 1, 1,
3.255889, 0.5832292, 2.362581, 1, 1, 1, 1, 1
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
var radius = 9.634428;
var distance = 33.84052;
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
mvMatrix.translate( 0.1284006, -0.1095347, -0.03479695 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84052);
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
