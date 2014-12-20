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
-3.975004, -2.114082, -1.857068, 1, 0, 0, 1,
-3.525244, -0.2501119, -3.221661, 1, 0.007843138, 0, 1,
-3.141338, 0.7139703, -1.7177, 1, 0.01176471, 0, 1,
-2.63974, 1.083327, -1.305095, 1, 0.01960784, 0, 1,
-2.575742, -0.3586845, -1.814403, 1, 0.02352941, 0, 1,
-2.557681, 1.432718, -0.7436781, 1, 0.03137255, 0, 1,
-2.545696, -0.9797172, 0.3281793, 1, 0.03529412, 0, 1,
-2.527331, 0.3584135, -2.332462, 1, 0.04313726, 0, 1,
-2.451002, -1.678706, -1.595767, 1, 0.04705882, 0, 1,
-2.411475, -0.8516246, -0.3118533, 1, 0.05490196, 0, 1,
-2.343331, -0.974521, -3.07127, 1, 0.05882353, 0, 1,
-2.219667, -0.1597803, -0.8974986, 1, 0.06666667, 0, 1,
-2.217171, -0.110877, -2.10917, 1, 0.07058824, 0, 1,
-2.152397, -2.043961, -2.859352, 1, 0.07843138, 0, 1,
-2.147759, -0.2878428, -3.595498, 1, 0.08235294, 0, 1,
-2.134446, -0.05557135, -1.903177, 1, 0.09019608, 0, 1,
-2.114225, 0.7157041, -2.316501, 1, 0.09411765, 0, 1,
-2.045917, 0.7543582, -1.932841, 1, 0.1019608, 0, 1,
-2.023603, -1.110513, -2.613623, 1, 0.1098039, 0, 1,
-2.010979, -1.621622, -1.186999, 1, 0.1137255, 0, 1,
-2.001484, 0.3443374, -1.133602, 1, 0.1215686, 0, 1,
-1.973073, 1.090944, -2.517853, 1, 0.1254902, 0, 1,
-1.958738, -1.21184, -1.293279, 1, 0.1333333, 0, 1,
-1.955484, 1.068482, -1.015434, 1, 0.1372549, 0, 1,
-1.923911, 0.2051548, -1.374325, 1, 0.145098, 0, 1,
-1.870076, 0.05767208, -1.695698, 1, 0.1490196, 0, 1,
-1.840814, -0.3665009, -0.937807, 1, 0.1568628, 0, 1,
-1.837545, -1.26577, -2.293387, 1, 0.1607843, 0, 1,
-1.837304, -0.4896855, -0.8111531, 1, 0.1686275, 0, 1,
-1.83602, -1.07667, -2.338052, 1, 0.172549, 0, 1,
-1.818654, -0.1804187, -0.8405337, 1, 0.1803922, 0, 1,
-1.818245, 1.69908, -0.4441448, 1, 0.1843137, 0, 1,
-1.787933, 1.348661, 0.8607515, 1, 0.1921569, 0, 1,
-1.7744, -0.4886823, -2.306966, 1, 0.1960784, 0, 1,
-1.772517, -0.0446605, 0.05462839, 1, 0.2039216, 0, 1,
-1.760367, -0.557474, -1.832248, 1, 0.2117647, 0, 1,
-1.743124, 0.9350249, 0.7645294, 1, 0.2156863, 0, 1,
-1.74176, -0.3275224, -1.105164, 1, 0.2235294, 0, 1,
-1.728502, 0.8622698, -0.5218499, 1, 0.227451, 0, 1,
-1.727802, -0.9937707, -2.03453, 1, 0.2352941, 0, 1,
-1.700318, 0.0889944, -1.846134, 1, 0.2392157, 0, 1,
-1.682114, 1.52911, -1.445305, 1, 0.2470588, 0, 1,
-1.65767, -0.9126952, -1.559123, 1, 0.2509804, 0, 1,
-1.654723, -0.8810671, -1.591587, 1, 0.2588235, 0, 1,
-1.651859, -0.829199, -3.146837, 1, 0.2627451, 0, 1,
-1.633315, -0.2630686, -1.620954, 1, 0.2705882, 0, 1,
-1.625465, 0.5457584, -1.425088, 1, 0.2745098, 0, 1,
-1.594619, -2.171561, -1.500259, 1, 0.282353, 0, 1,
-1.583246, -0.1080666, -1.618303, 1, 0.2862745, 0, 1,
-1.578938, 0.1056699, -1.97949, 1, 0.2941177, 0, 1,
-1.578382, 0.4279514, -1.381978, 1, 0.3019608, 0, 1,
-1.57436, 0.9474144, 0.6938482, 1, 0.3058824, 0, 1,
-1.570649, -0.05634258, -0.3482477, 1, 0.3137255, 0, 1,
-1.544301, -0.5343772, -2.390634, 1, 0.3176471, 0, 1,
-1.542638, -0.7720308, -2.640957, 1, 0.3254902, 0, 1,
-1.541951, -1.624588, -2.387112, 1, 0.3294118, 0, 1,
-1.541909, -0.1539131, -2.329412, 1, 0.3372549, 0, 1,
-1.532279, -0.2645523, -2.969456, 1, 0.3411765, 0, 1,
-1.521299, -0.9629744, -2.047956, 1, 0.3490196, 0, 1,
-1.516678, 0.4842909, -1.024137, 1, 0.3529412, 0, 1,
-1.516302, -1.622748, -1.054562, 1, 0.3607843, 0, 1,
-1.515718, 1.439494, -1.53172, 1, 0.3647059, 0, 1,
-1.510281, -0.9519413, -2.102946, 1, 0.372549, 0, 1,
-1.508042, 0.4335801, 0.3950323, 1, 0.3764706, 0, 1,
-1.49884, -0.360655, -1.987702, 1, 0.3843137, 0, 1,
-1.495334, -0.8117663, -1.918705, 1, 0.3882353, 0, 1,
-1.495112, 1.556119, -0.7141232, 1, 0.3960784, 0, 1,
-1.470737, -0.9213481, -2.730231, 1, 0.4039216, 0, 1,
-1.467874, -0.1670033, -1.988244, 1, 0.4078431, 0, 1,
-1.445004, -0.7593457, -2.400821, 1, 0.4156863, 0, 1,
-1.444239, 1.128148, -1.379178, 1, 0.4196078, 0, 1,
-1.426532, -0.001951497, -2.517822, 1, 0.427451, 0, 1,
-1.417036, 0.7783698, -0.8813338, 1, 0.4313726, 0, 1,
-1.415465, 0.3917225, -1.750144, 1, 0.4392157, 0, 1,
-1.413822, 0.2089424, 0.4223244, 1, 0.4431373, 0, 1,
-1.403399, 0.1744134, 0.5249575, 1, 0.4509804, 0, 1,
-1.399856, 0.9900524, -0.8701358, 1, 0.454902, 0, 1,
-1.396426, 1.03991, -1.59207, 1, 0.4627451, 0, 1,
-1.392316, -1.488027, -2.890743, 1, 0.4666667, 0, 1,
-1.387592, 0.9902648, -0.3237504, 1, 0.4745098, 0, 1,
-1.382434, 0.9089121, -2.344828, 1, 0.4784314, 0, 1,
-1.378567, -1.272479, -2.59157, 1, 0.4862745, 0, 1,
-1.369424, -1.901882, -0.4479688, 1, 0.4901961, 0, 1,
-1.36812, -1.134586, -3.610897, 1, 0.4980392, 0, 1,
-1.353702, -0.09169175, -1.490968, 1, 0.5058824, 0, 1,
-1.351723, 0.9541474, -0.1631732, 1, 0.509804, 0, 1,
-1.345883, 0.3413818, -0.3346495, 1, 0.5176471, 0, 1,
-1.345161, -0.2780266, -0.5485882, 1, 0.5215687, 0, 1,
-1.340397, 1.468969, 0.9505767, 1, 0.5294118, 0, 1,
-1.337921, 1.006312, -0.2488225, 1, 0.5333334, 0, 1,
-1.314585, 0.4622292, -0.6948265, 1, 0.5411765, 0, 1,
-1.305097, -1.119309, -1.700605, 1, 0.5450981, 0, 1,
-1.300344, -0.3281971, -1.585307, 1, 0.5529412, 0, 1,
-1.299921, -1.180862, -3.573169, 1, 0.5568628, 0, 1,
-1.29922, -0.005767366, -3.170157, 1, 0.5647059, 0, 1,
-1.297587, -0.04732061, -0.1638654, 1, 0.5686275, 0, 1,
-1.297339, 0.4062434, -0.1933438, 1, 0.5764706, 0, 1,
-1.296705, -0.4999047, -2.07694, 1, 0.5803922, 0, 1,
-1.293281, 0.7803385, -0.4598451, 1, 0.5882353, 0, 1,
-1.292263, -1.179867, -0.6176256, 1, 0.5921569, 0, 1,
-1.289585, 1.313428, -1.502664, 1, 0.6, 0, 1,
-1.280219, -0.3640665, -1.235035, 1, 0.6078432, 0, 1,
-1.273477, 0.08864792, -2.062821, 1, 0.6117647, 0, 1,
-1.271056, -1.281749, -0.5288432, 1, 0.6196079, 0, 1,
-1.268331, -0.7933736, -1.359977, 1, 0.6235294, 0, 1,
-1.264571, 0.814593, -1.608233, 1, 0.6313726, 0, 1,
-1.263547, 0.02442759, -1.900636, 1, 0.6352941, 0, 1,
-1.253581, 1.050369, -2.191478, 1, 0.6431373, 0, 1,
-1.251879, -2.104383, -1.685003, 1, 0.6470588, 0, 1,
-1.25105, -0.4692012, -2.776402, 1, 0.654902, 0, 1,
-1.243811, 0.2824202, -1.807208, 1, 0.6588235, 0, 1,
-1.238677, 0.3114601, -0.2659292, 1, 0.6666667, 0, 1,
-1.235159, -0.05954902, -2.479278, 1, 0.6705883, 0, 1,
-1.229201, -0.05661602, -2.187932, 1, 0.6784314, 0, 1,
-1.228078, 1.151152, -2.023505, 1, 0.682353, 0, 1,
-1.215705, 0.05400554, 0.6577355, 1, 0.6901961, 0, 1,
-1.214352, 0.7386652, -2.888692, 1, 0.6941177, 0, 1,
-1.212114, 1.752139, -0.116558, 1, 0.7019608, 0, 1,
-1.201373, 2.122765, -1.200353, 1, 0.7098039, 0, 1,
-1.196154, 0.7068527, -2.379686, 1, 0.7137255, 0, 1,
-1.189829, -0.1484358, -0.7780449, 1, 0.7215686, 0, 1,
-1.180999, 1.875657, -0.4095322, 1, 0.7254902, 0, 1,
-1.168943, 0.981185, -1.942654, 1, 0.7333333, 0, 1,
-1.168571, -0.8030472, -1.111183, 1, 0.7372549, 0, 1,
-1.167826, -0.02950348, -0.4367074, 1, 0.7450981, 0, 1,
-1.162606, -1.137447, -2.749978, 1, 0.7490196, 0, 1,
-1.1585, -0.9057928, -3.297953, 1, 0.7568628, 0, 1,
-1.15697, -0.7765986, -2.897866, 1, 0.7607843, 0, 1,
-1.155494, 2.588703, -0.7110662, 1, 0.7686275, 0, 1,
-1.154867, 0.1698558, -1.044663, 1, 0.772549, 0, 1,
-1.152815, 1.54299, -0.5814121, 1, 0.7803922, 0, 1,
-1.150578, -1.081364, -0.548812, 1, 0.7843137, 0, 1,
-1.145211, 0.236991, -1.011302, 1, 0.7921569, 0, 1,
-1.142291, 0.4327902, -1.658154, 1, 0.7960784, 0, 1,
-1.139844, 0.05313508, -0.5275474, 1, 0.8039216, 0, 1,
-1.137683, -0.2707682, -2.793979, 1, 0.8117647, 0, 1,
-1.117973, -0.4667881, -2.171582, 1, 0.8156863, 0, 1,
-1.113896, -1.579488, -3.577271, 1, 0.8235294, 0, 1,
-1.106044, -1.163653, -2.400103, 1, 0.827451, 0, 1,
-1.10416, -2.003092, -2.571412, 1, 0.8352941, 0, 1,
-1.103368, 1.231903, 0.03435564, 1, 0.8392157, 0, 1,
-1.103009, -1.573799, -2.391264, 1, 0.8470588, 0, 1,
-1.102205, -0.747619, -2.955529, 1, 0.8509804, 0, 1,
-1.098794, 0.04004434, -0.7670949, 1, 0.8588235, 0, 1,
-1.089164, -1.122012, -2.611469, 1, 0.8627451, 0, 1,
-1.055574, 0.6636606, -2.330281, 1, 0.8705882, 0, 1,
-1.053775, 0.03452976, -2.67373, 1, 0.8745098, 0, 1,
-1.046689, -0.3406471, -3.303036, 1, 0.8823529, 0, 1,
-1.042573, 1.431391, -1.026149, 1, 0.8862745, 0, 1,
-1.025996, -0.4608634, -2.643023, 1, 0.8941177, 0, 1,
-1.019629, -2.574277, -3.94199, 1, 0.8980392, 0, 1,
-1.014177, -0.1232758, -2.867641, 1, 0.9058824, 0, 1,
-1.010789, -0.5693879, -1.383203, 1, 0.9137255, 0, 1,
-1.002201, 0.4007377, -0.08795889, 1, 0.9176471, 0, 1,
-0.9913274, 1.782981, -1.315173, 1, 0.9254902, 0, 1,
-0.9758865, -0.2029723, -2.608785, 1, 0.9294118, 0, 1,
-0.9719246, -0.149, 0.7366737, 1, 0.9372549, 0, 1,
-0.9671281, -1.723317, -1.084918, 1, 0.9411765, 0, 1,
-0.9653373, -1.009704, -1.98077, 1, 0.9490196, 0, 1,
-0.9647756, -1.095778, -2.390449, 1, 0.9529412, 0, 1,
-0.9642377, -0.7132598, -2.849946, 1, 0.9607843, 0, 1,
-0.9629663, -0.5504997, -2.192433, 1, 0.9647059, 0, 1,
-0.9553156, 0.2112875, -1.12073, 1, 0.972549, 0, 1,
-0.9527259, -0.2520581, -1.063471, 1, 0.9764706, 0, 1,
-0.9456704, 1.461593, 0.4499997, 1, 0.9843137, 0, 1,
-0.9410349, -1.17132, -2.417145, 1, 0.9882353, 0, 1,
-0.9407987, -0.36904, -3.429586, 1, 0.9960784, 0, 1,
-0.9405317, 0.1307834, -1.644362, 0.9960784, 1, 0, 1,
-0.9384982, -0.9499027, -2.28121, 0.9921569, 1, 0, 1,
-0.9370785, 0.4862415, -1.916905, 0.9843137, 1, 0, 1,
-0.9346749, 0.8419456, -1.817013, 0.9803922, 1, 0, 1,
-0.934349, 1.082354, -2.826516, 0.972549, 1, 0, 1,
-0.932, 1.445353, 0.1208079, 0.9686275, 1, 0, 1,
-0.9297424, -0.7099568, -2.75659, 0.9607843, 1, 0, 1,
-0.9197505, 1.77455, -0.2624288, 0.9568627, 1, 0, 1,
-0.90981, 0.08201669, -1.079396, 0.9490196, 1, 0, 1,
-0.9036304, -0.2797725, -1.519054, 0.945098, 1, 0, 1,
-0.9025037, -0.3126346, 0.04756951, 0.9372549, 1, 0, 1,
-0.9015725, -0.7309249, -1.90482, 0.9333333, 1, 0, 1,
-0.8997124, 0.7644445, -0.9464887, 0.9254902, 1, 0, 1,
-0.8979587, 1.230099, -0.5468526, 0.9215686, 1, 0, 1,
-0.89507, 0.1629735, -1.072008, 0.9137255, 1, 0, 1,
-0.8945999, -0.9277503, -1.580874, 0.9098039, 1, 0, 1,
-0.8856378, -0.7604812, -0.6208834, 0.9019608, 1, 0, 1,
-0.8852879, 1.856694, -1.157509, 0.8941177, 1, 0, 1,
-0.8842436, -0.01487169, -0.5836383, 0.8901961, 1, 0, 1,
-0.8835277, 1.07969, -1.624567, 0.8823529, 1, 0, 1,
-0.8739068, -0.4410837, 0.4212255, 0.8784314, 1, 0, 1,
-0.8597342, 0.2564529, -1.187047, 0.8705882, 1, 0, 1,
-0.8586078, 1.001348, -0.08060496, 0.8666667, 1, 0, 1,
-0.8553792, 0.6335378, 0.3630887, 0.8588235, 1, 0, 1,
-0.8530679, 0.1854292, -2.196685, 0.854902, 1, 0, 1,
-0.8459376, 0.6569524, -1.031393, 0.8470588, 1, 0, 1,
-0.8455434, -0.1320561, -2.500337, 0.8431373, 1, 0, 1,
-0.8444516, -1.724825, -1.85701, 0.8352941, 1, 0, 1,
-0.8408751, 0.7616085, -0.5993503, 0.8313726, 1, 0, 1,
-0.8370323, 1.211192, 0.00523377, 0.8235294, 1, 0, 1,
-0.8297059, 0.7705844, -0.5424363, 0.8196079, 1, 0, 1,
-0.8278421, -0.0159744, -3.578286, 0.8117647, 1, 0, 1,
-0.8268683, -0.6075558, -1.949991, 0.8078431, 1, 0, 1,
-0.8220023, 0.9640058, -1.130329, 0.8, 1, 0, 1,
-0.8188297, -0.3157013, -0.6376832, 0.7921569, 1, 0, 1,
-0.811091, 0.252611, -2.052841, 0.7882353, 1, 0, 1,
-0.8014904, -0.5024551, -3.393886, 0.7803922, 1, 0, 1,
-0.7783278, 0.1483147, 1.003944, 0.7764706, 1, 0, 1,
-0.7746242, 0.5028783, -0.4878115, 0.7686275, 1, 0, 1,
-0.7734654, 0.345029, -2.344716, 0.7647059, 1, 0, 1,
-0.770483, 1.435482, 1.207348, 0.7568628, 1, 0, 1,
-0.7670029, -0.6045237, -3.095293, 0.7529412, 1, 0, 1,
-0.7660643, -0.1960698, -0.1037103, 0.7450981, 1, 0, 1,
-0.7648748, -0.3306677, -1.645599, 0.7411765, 1, 0, 1,
-0.7590588, 0.2310041, -1.04624, 0.7333333, 1, 0, 1,
-0.7562014, -0.5977846, -3.275963, 0.7294118, 1, 0, 1,
-0.7510753, 0.3343783, -2.448598, 0.7215686, 1, 0, 1,
-0.7482008, 1.116329, -0.7271488, 0.7176471, 1, 0, 1,
-0.7448666, 0.4415208, -2.002595, 0.7098039, 1, 0, 1,
-0.7401661, 0.9797604, 0.5469993, 0.7058824, 1, 0, 1,
-0.7395371, 1.175289, 0.7262131, 0.6980392, 1, 0, 1,
-0.7380372, 0.7548145, 0.1223922, 0.6901961, 1, 0, 1,
-0.7243186, -0.6660311, -2.401485, 0.6862745, 1, 0, 1,
-0.721532, 0.1604014, -2.381929, 0.6784314, 1, 0, 1,
-0.7166566, 1.641842, 0.9156244, 0.6745098, 1, 0, 1,
-0.7155143, -2.100782, -1.655016, 0.6666667, 1, 0, 1,
-0.7134595, 0.3515636, -2.866292, 0.6627451, 1, 0, 1,
-0.7108473, 0.6776134, -0.556999, 0.654902, 1, 0, 1,
-0.7070709, -1.016424, -1.92598, 0.6509804, 1, 0, 1,
-0.7019102, -2.07886, -3.386624, 0.6431373, 1, 0, 1,
-0.696237, -0.1794003, -1.536616, 0.6392157, 1, 0, 1,
-0.6935602, 0.9221221, -0.3499838, 0.6313726, 1, 0, 1,
-0.6884605, 0.1184397, -0.2146169, 0.627451, 1, 0, 1,
-0.6865172, 0.6649127, -0.5713475, 0.6196079, 1, 0, 1,
-0.6802315, 0.0953206, -0.9380985, 0.6156863, 1, 0, 1,
-0.6787164, 0.1873321, -1.716622, 0.6078432, 1, 0, 1,
-0.6740303, -1.587023, -3.961178, 0.6039216, 1, 0, 1,
-0.670437, -0.01259792, -1.763765, 0.5960785, 1, 0, 1,
-0.6672246, -0.06682931, -1.53162, 0.5882353, 1, 0, 1,
-0.6657336, 0.2358353, -0.6866418, 0.5843138, 1, 0, 1,
-0.665644, -0.8750498, -2.29171, 0.5764706, 1, 0, 1,
-0.6636261, 1.035804, -0.5203779, 0.572549, 1, 0, 1,
-0.6624818, 2.164783, -1.604256, 0.5647059, 1, 0, 1,
-0.6600955, -0.436937, -1.220516, 0.5607843, 1, 0, 1,
-0.6565542, -0.8926039, -3.468494, 0.5529412, 1, 0, 1,
-0.6460538, -1.008236, -1.741409, 0.5490196, 1, 0, 1,
-0.645296, 0.2109622, -1.567762, 0.5411765, 1, 0, 1,
-0.6439189, 1.013675, 0.8874744, 0.5372549, 1, 0, 1,
-0.6409248, -0.5812651, -1.223527, 0.5294118, 1, 0, 1,
-0.6350107, 0.3069989, 0.2333354, 0.5254902, 1, 0, 1,
-0.6343335, 0.9807905, 0.3404083, 0.5176471, 1, 0, 1,
-0.6322421, -0.9753344, -2.786195, 0.5137255, 1, 0, 1,
-0.6207616, 0.3461858, -0.8015991, 0.5058824, 1, 0, 1,
-0.6198555, 0.7052264, 0.08626887, 0.5019608, 1, 0, 1,
-0.6114383, -1.02758, -2.374732, 0.4941176, 1, 0, 1,
-0.611326, -0.4539763, -3.089231, 0.4862745, 1, 0, 1,
-0.6095591, 0.2413222, -1.675126, 0.4823529, 1, 0, 1,
-0.6086394, 0.3193944, -0.2697842, 0.4745098, 1, 0, 1,
-0.6042015, 0.382011, -1.489036, 0.4705882, 1, 0, 1,
-0.6039055, -0.2030897, -0.4399682, 0.4627451, 1, 0, 1,
-0.6020539, -1.097462, -1.614644, 0.4588235, 1, 0, 1,
-0.5993816, 1.047795, -1.492504, 0.4509804, 1, 0, 1,
-0.5932378, 0.6126364, -1.535185, 0.4470588, 1, 0, 1,
-0.5921497, 0.3313608, 0.05590687, 0.4392157, 1, 0, 1,
-0.590049, 0.01843579, -1.101585, 0.4352941, 1, 0, 1,
-0.5893647, -1.216781, -3.119555, 0.427451, 1, 0, 1,
-0.5889149, -0.3267474, -1.125366, 0.4235294, 1, 0, 1,
-0.586706, 0.7705794, -2.057172, 0.4156863, 1, 0, 1,
-0.5805448, 1.233351, -0.2072354, 0.4117647, 1, 0, 1,
-0.572184, -0.4359557, -3.822995, 0.4039216, 1, 0, 1,
-0.5720719, 0.582912, -1.187902, 0.3960784, 1, 0, 1,
-0.5718071, 0.5275159, -1.001874, 0.3921569, 1, 0, 1,
-0.5688813, -0.03345219, -0.8666099, 0.3843137, 1, 0, 1,
-0.5647111, 0.870934, -1.455894, 0.3803922, 1, 0, 1,
-0.564545, -0.8525269, -2.684122, 0.372549, 1, 0, 1,
-0.5570967, 0.4657064, -1.609219, 0.3686275, 1, 0, 1,
-0.551861, 0.5658311, 0.1363634, 0.3607843, 1, 0, 1,
-0.5512949, 1.092029, -1.438863, 0.3568628, 1, 0, 1,
-0.5512846, -0.1034729, -1.812595, 0.3490196, 1, 0, 1,
-0.5512814, -0.2841601, -1.9795, 0.345098, 1, 0, 1,
-0.5497693, 1.424265, 0.09061286, 0.3372549, 1, 0, 1,
-0.5480915, 1.968074, 0.1569985, 0.3333333, 1, 0, 1,
-0.5473931, -0.8013333, -2.901036, 0.3254902, 1, 0, 1,
-0.547316, 0.09633711, -1.741831, 0.3215686, 1, 0, 1,
-0.5461536, -0.5604727, -2.553375, 0.3137255, 1, 0, 1,
-0.5412635, 0.1314271, -2.024055, 0.3098039, 1, 0, 1,
-0.5344112, -1.352234, -4.25097, 0.3019608, 1, 0, 1,
-0.5333109, 1.502109, -2.10693, 0.2941177, 1, 0, 1,
-0.5294706, 0.7291144, -1.741294, 0.2901961, 1, 0, 1,
-0.5294368, -0.8099518, -1.448046, 0.282353, 1, 0, 1,
-0.5282749, -1.192734, -3.338255, 0.2784314, 1, 0, 1,
-0.5258182, -1.30437, -1.447505, 0.2705882, 1, 0, 1,
-0.5247539, 0.4330571, 1.230571, 0.2666667, 1, 0, 1,
-0.5240186, 0.1475759, -1.563229, 0.2588235, 1, 0, 1,
-0.5193215, -0.7034064, -1.629272, 0.254902, 1, 0, 1,
-0.5172085, -1.081977, -1.314489, 0.2470588, 1, 0, 1,
-0.5080992, 1.480228, -0.8636184, 0.2431373, 1, 0, 1,
-0.5023053, -1.215657, -1.42461, 0.2352941, 1, 0, 1,
-0.495807, 0.8612703, -0.5881526, 0.2313726, 1, 0, 1,
-0.4930624, -1.624669, -2.969587, 0.2235294, 1, 0, 1,
-0.4925378, -0.06706433, -2.518885, 0.2196078, 1, 0, 1,
-0.4908781, 0.6637727, 0.1810541, 0.2117647, 1, 0, 1,
-0.4908383, 0.3066809, -0.8874055, 0.2078431, 1, 0, 1,
-0.4871703, 1.130246, 1.801259, 0.2, 1, 0, 1,
-0.4860907, 0.6189186, 0.6328822, 0.1921569, 1, 0, 1,
-0.4857014, -0.5971172, -2.709156, 0.1882353, 1, 0, 1,
-0.4808823, -1.656951, -3.843653, 0.1803922, 1, 0, 1,
-0.4736898, 1.748511, -2.335282, 0.1764706, 1, 0, 1,
-0.4703932, -0.2716025, -2.614305, 0.1686275, 1, 0, 1,
-0.4693574, 0.9276828, 0.6372294, 0.1647059, 1, 0, 1,
-0.4676354, 0.358216, -0.7434539, 0.1568628, 1, 0, 1,
-0.4673456, -0.7888397, -4.51655, 0.1529412, 1, 0, 1,
-0.4664759, -0.3103518, -3.560622, 0.145098, 1, 0, 1,
-0.4657003, -1.78957, -2.486736, 0.1411765, 1, 0, 1,
-0.4623007, -0.7823262, -2.146233, 0.1333333, 1, 0, 1,
-0.4537134, -1.58038, -1.787562, 0.1294118, 1, 0, 1,
-0.4508029, 0.5956494, 1.209853, 0.1215686, 1, 0, 1,
-0.439719, 0.3878503, -0.3143848, 0.1176471, 1, 0, 1,
-0.4388576, 0.347695, -0.7694006, 0.1098039, 1, 0, 1,
-0.4380843, 0.6180442, 1.62968, 0.1058824, 1, 0, 1,
-0.4370975, -1.252136, -3.749337, 0.09803922, 1, 0, 1,
-0.4362143, 0.01583269, -1.70577, 0.09019608, 1, 0, 1,
-0.4331759, 0.1306056, -2.591016, 0.08627451, 1, 0, 1,
-0.4225016, -0.1780424, -2.697159, 0.07843138, 1, 0, 1,
-0.4164765, 0.2788305, 0.07673866, 0.07450981, 1, 0, 1,
-0.4137203, 0.7134393, -0.05769851, 0.06666667, 1, 0, 1,
-0.4082825, 0.06295114, -1.065638, 0.0627451, 1, 0, 1,
-0.403241, 0.8670964, 0.6222997, 0.05490196, 1, 0, 1,
-0.3970819, -0.3159762, -3.692985, 0.05098039, 1, 0, 1,
-0.3961619, 0.1987351, 0.5873809, 0.04313726, 1, 0, 1,
-0.3944573, -0.3304988, -1.70831, 0.03921569, 1, 0, 1,
-0.3829617, -0.4278167, -1.896624, 0.03137255, 1, 0, 1,
-0.3792733, -0.557813, -3.908601, 0.02745098, 1, 0, 1,
-0.3759941, 2.742572, 0.342541, 0.01960784, 1, 0, 1,
-0.3757744, 1.041487, 1.114592, 0.01568628, 1, 0, 1,
-0.3744425, 1.488865, -0.9132463, 0.007843138, 1, 0, 1,
-0.3721158, -1.095746, -2.789517, 0.003921569, 1, 0, 1,
-0.3661786, -0.8370132, -1.808663, 0, 1, 0.003921569, 1,
-0.365758, 0.3562074, 0.3783926, 0, 1, 0.01176471, 1,
-0.3650982, 0.1490018, -0.7230769, 0, 1, 0.01568628, 1,
-0.3640331, 0.5961567, -0.4688238, 0, 1, 0.02352941, 1,
-0.3624499, -1.412361, -3.518109, 0, 1, 0.02745098, 1,
-0.362317, 0.8483955, 0.06162103, 0, 1, 0.03529412, 1,
-0.3605522, -1.531279, -3.030932, 0, 1, 0.03921569, 1,
-0.3599484, 0.7370002, 0.9535116, 0, 1, 0.04705882, 1,
-0.3587824, 0.2387436, -2.172528, 0, 1, 0.05098039, 1,
-0.3564383, -2.102648, -3.708266, 0, 1, 0.05882353, 1,
-0.3537305, 1.088786, -0.9671886, 0, 1, 0.0627451, 1,
-0.3496623, -0.7393025, -3.405865, 0, 1, 0.07058824, 1,
-0.349501, -0.08702242, -2.618826, 0, 1, 0.07450981, 1,
-0.3482953, 0.1602998, -0.5352351, 0, 1, 0.08235294, 1,
-0.3460537, 0.3458255, -2.864427, 0, 1, 0.08627451, 1,
-0.3436533, -0.4710731, -2.399065, 0, 1, 0.09411765, 1,
-0.3358551, -1.004156, -3.591619, 0, 1, 0.1019608, 1,
-0.3339664, 1.604644, 0.03165274, 0, 1, 0.1058824, 1,
-0.3292739, -0.6785606, -1.663875, 0, 1, 0.1137255, 1,
-0.3276665, 1.698072, -0.8780814, 0, 1, 0.1176471, 1,
-0.3270682, 1.033577, 0.4962864, 0, 1, 0.1254902, 1,
-0.3241129, -0.761627, -2.707559, 0, 1, 0.1294118, 1,
-0.3193732, 0.6315117, -1.66665, 0, 1, 0.1372549, 1,
-0.3172066, 1.219742, -1.28887, 0, 1, 0.1411765, 1,
-0.3171303, 2.516392, -1.044704, 0, 1, 0.1490196, 1,
-0.316643, 0.3673642, -0.6475376, 0, 1, 0.1529412, 1,
-0.315612, 0.3862422, 1.287932, 0, 1, 0.1607843, 1,
-0.3155341, -0.4639411, -3.121624, 0, 1, 0.1647059, 1,
-0.3122747, -0.00854234, -1.499625, 0, 1, 0.172549, 1,
-0.3072892, -1.194688, -2.476286, 0, 1, 0.1764706, 1,
-0.299753, 0.7056907, -0.8162436, 0, 1, 0.1843137, 1,
-0.2979621, 1.683282, 0.9463276, 0, 1, 0.1882353, 1,
-0.2963076, -0.3915929, -3.02602, 0, 1, 0.1960784, 1,
-0.2959765, -0.2613992, -1.781872, 0, 1, 0.2039216, 1,
-0.2958944, 1.266119, 1.011507, 0, 1, 0.2078431, 1,
-0.2953581, 1.235521, 0.002140613, 0, 1, 0.2156863, 1,
-0.2873484, -0.7461418, -4.44707, 0, 1, 0.2196078, 1,
-0.281884, -0.3337902, -4.880524, 0, 1, 0.227451, 1,
-0.2787766, 0.1383663, -1.704698, 0, 1, 0.2313726, 1,
-0.276021, -1.071036, -3.704358, 0, 1, 0.2392157, 1,
-0.2723323, 0.1940027, 0.4964678, 0, 1, 0.2431373, 1,
-0.2718964, 1.28505, 2.006546, 0, 1, 0.2509804, 1,
-0.268471, -0.3284232, -2.345659, 0, 1, 0.254902, 1,
-0.2673807, -0.6985425, -2.626446, 0, 1, 0.2627451, 1,
-0.2606514, 1.332551, 0.4184313, 0, 1, 0.2666667, 1,
-0.259377, 0.6914487, 0.7128485, 0, 1, 0.2745098, 1,
-0.2577749, 1.568946, -0.7304488, 0, 1, 0.2784314, 1,
-0.2531712, -0.06304341, -1.822314, 0, 1, 0.2862745, 1,
-0.2528465, -0.8772447, -2.495996, 0, 1, 0.2901961, 1,
-0.2525281, -1.600571, -4.046, 0, 1, 0.2980392, 1,
-0.2484754, 0.9127036, -0.4233801, 0, 1, 0.3058824, 1,
-0.2483764, 0.9563025, 0.9168984, 0, 1, 0.3098039, 1,
-0.2462675, -0.6300721, -1.925169, 0, 1, 0.3176471, 1,
-0.2419176, -0.3159653, -2.892213, 0, 1, 0.3215686, 1,
-0.240972, 0.6153478, -1.975718, 0, 1, 0.3294118, 1,
-0.2385529, -0.6852132, -3.700541, 0, 1, 0.3333333, 1,
-0.2351828, -0.4009077, -1.589038, 0, 1, 0.3411765, 1,
-0.2351523, -0.1268462, -2.474917, 0, 1, 0.345098, 1,
-0.2350035, -1.102197, -0.6740651, 0, 1, 0.3529412, 1,
-0.2297709, -3.487079, -2.077248, 0, 1, 0.3568628, 1,
-0.2281352, 0.33907, 0.9261643, 0, 1, 0.3647059, 1,
-0.2276812, 0.0686445, -1.726791, 0, 1, 0.3686275, 1,
-0.2233926, 1.240281, 0.2966666, 0, 1, 0.3764706, 1,
-0.2221842, 0.4124479, 1.215848, 0, 1, 0.3803922, 1,
-0.2205231, -0.06991524, -2.259295, 0, 1, 0.3882353, 1,
-0.2202589, -0.114986, -4.610168, 0, 1, 0.3921569, 1,
-0.2165416, 0.3403722, -0.8978096, 0, 1, 0.4, 1,
-0.2158498, 1.936066, -1.858474, 0, 1, 0.4078431, 1,
-0.2130858, 0.3429033, -0.3454307, 0, 1, 0.4117647, 1,
-0.2091765, 2.481019, -0.6403865, 0, 1, 0.4196078, 1,
-0.2076946, 0.2770697, -2.550593, 0, 1, 0.4235294, 1,
-0.2064717, -0.3746632, -2.222085, 0, 1, 0.4313726, 1,
-0.2056544, 0.8575474, 0.5276498, 0, 1, 0.4352941, 1,
-0.2056071, -0.4921524, -2.689338, 0, 1, 0.4431373, 1,
-0.199899, -0.8850188, -1.295439, 0, 1, 0.4470588, 1,
-0.1969006, -0.307308, -2.821313, 0, 1, 0.454902, 1,
-0.1948167, -0.1408206, -3.95998, 0, 1, 0.4588235, 1,
-0.1908407, -1.42832, -2.57616, 0, 1, 0.4666667, 1,
-0.1899918, -1.583097, -3.786374, 0, 1, 0.4705882, 1,
-0.1893239, 1.311554, -0.47437, 0, 1, 0.4784314, 1,
-0.1889749, 0.5192913, -1.369763, 0, 1, 0.4823529, 1,
-0.1882034, -0.6565408, -3.876632, 0, 1, 0.4901961, 1,
-0.1853184, 2.477338, -1.405905, 0, 1, 0.4941176, 1,
-0.1852754, 1.421605, -0.07075419, 0, 1, 0.5019608, 1,
-0.1837547, 0.8956341, -0.1563923, 0, 1, 0.509804, 1,
-0.179539, 0.8861052, -0.05352274, 0, 1, 0.5137255, 1,
-0.1788437, 0.6735137, 2.0551, 0, 1, 0.5215687, 1,
-0.175875, -1.040119, -2.609611, 0, 1, 0.5254902, 1,
-0.1750319, -1.020561, -3.37978, 0, 1, 0.5333334, 1,
-0.1749611, -1.314851, -2.926791, 0, 1, 0.5372549, 1,
-0.1731535, -0.1444252, -2.62435, 0, 1, 0.5450981, 1,
-0.1715288, -0.2649837, -1.732997, 0, 1, 0.5490196, 1,
-0.1699672, -0.08070973, -1.371566, 0, 1, 0.5568628, 1,
-0.1637809, 0.008042302, -2.735473, 0, 1, 0.5607843, 1,
-0.1604752, -0.8742571, -2.418984, 0, 1, 0.5686275, 1,
-0.1581022, 0.7013189, 0.05660661, 0, 1, 0.572549, 1,
-0.1564872, -0.4891859, -2.052311, 0, 1, 0.5803922, 1,
-0.1552299, -0.4826904, -3.332498, 0, 1, 0.5843138, 1,
-0.1551856, 0.7285531, 1.502263, 0, 1, 0.5921569, 1,
-0.1519706, 0.112217, 0.05044628, 0, 1, 0.5960785, 1,
-0.148127, -2.24586, -2.147239, 0, 1, 0.6039216, 1,
-0.1459991, -0.4730222, -3.487451, 0, 1, 0.6117647, 1,
-0.1458187, 0.6471353, 0.9358672, 0, 1, 0.6156863, 1,
-0.1423718, -0.4982702, -1.550174, 0, 1, 0.6235294, 1,
-0.1420918, 0.02379514, -0.5299493, 0, 1, 0.627451, 1,
-0.1399253, 0.4418679, -1.223051, 0, 1, 0.6352941, 1,
-0.1353658, -0.5591947, -3.213838, 0, 1, 0.6392157, 1,
-0.134385, -2.037177, -3.335499, 0, 1, 0.6470588, 1,
-0.1315229, 0.9917279, 0.129324, 0, 1, 0.6509804, 1,
-0.1302079, 0.4681813, 0.1116163, 0, 1, 0.6588235, 1,
-0.1248367, 0.2690782, 0.3885022, 0, 1, 0.6627451, 1,
-0.1218313, 0.2824596, -0.9654235, 0, 1, 0.6705883, 1,
-0.1214814, -0.2767215, -1.349501, 0, 1, 0.6745098, 1,
-0.120403, 0.5648136, -0.8437762, 0, 1, 0.682353, 1,
-0.1200183, 1.742448, 0.01532877, 0, 1, 0.6862745, 1,
-0.1198684, -1.467045, -2.600249, 0, 1, 0.6941177, 1,
-0.1194974, 1.255682, -1.214068, 0, 1, 0.7019608, 1,
-0.1177227, 0.4627945, 1.011636, 0, 1, 0.7058824, 1,
-0.1172559, -0.6082985, -3.313013, 0, 1, 0.7137255, 1,
-0.1107538, 0.3151986, -0.3475947, 0, 1, 0.7176471, 1,
-0.1083715, -0.2767709, -3.479857, 0, 1, 0.7254902, 1,
-0.1076164, -0.08715139, -1.648718, 0, 1, 0.7294118, 1,
-0.1075113, 0.9193113, -0.5862817, 0, 1, 0.7372549, 1,
-0.1068778, -0.8270167, -3.955724, 0, 1, 0.7411765, 1,
-0.1037643, 0.02679113, -1.657216, 0, 1, 0.7490196, 1,
-0.1018304, -0.1060982, -1.727752, 0, 1, 0.7529412, 1,
-0.1015843, 0.876325, -0.7810111, 0, 1, 0.7607843, 1,
-0.09964562, -0.0516191, -0.8834315, 0, 1, 0.7647059, 1,
-0.09577088, 0.6469566, -0.9680383, 0, 1, 0.772549, 1,
-0.09254324, -2.217857, -3.358379, 0, 1, 0.7764706, 1,
-0.08901437, -1.686568, -3.603301, 0, 1, 0.7843137, 1,
-0.08524726, -1.196605, -2.864906, 0, 1, 0.7882353, 1,
-0.07799987, 0.3965017, -1.468628, 0, 1, 0.7960784, 1,
-0.07681586, 1.629755, -1.418121, 0, 1, 0.8039216, 1,
-0.07621729, 0.5328935, -1.021281, 0, 1, 0.8078431, 1,
-0.07498054, 1.347009, -0.212816, 0, 1, 0.8156863, 1,
-0.07301562, 1.431512, -0.02237964, 0, 1, 0.8196079, 1,
-0.07128324, -0.6508214, -3.675243, 0, 1, 0.827451, 1,
-0.06573364, 0.09635296, 0.2537396, 0, 1, 0.8313726, 1,
-0.05864511, -1.302536, -3.906596, 0, 1, 0.8392157, 1,
-0.05844949, -1.660388, -1.414994, 0, 1, 0.8431373, 1,
-0.05620218, 1.077465, -0.3692105, 0, 1, 0.8509804, 1,
-0.05528023, 0.6896512, -0.4505028, 0, 1, 0.854902, 1,
-0.05341443, -0.1137403, -3.200492, 0, 1, 0.8627451, 1,
-0.04688542, -1.108543, -1.752066, 0, 1, 0.8666667, 1,
-0.04516144, 1.209391, -1.742618, 0, 1, 0.8745098, 1,
-0.04248252, 2.853235, -0.1386019, 0, 1, 0.8784314, 1,
-0.03913717, -0.6859087, -2.786326, 0, 1, 0.8862745, 1,
-0.03818975, 1.489073, -1.21632, 0, 1, 0.8901961, 1,
-0.03812318, -0.9881383, -4.055601, 0, 1, 0.8980392, 1,
-0.03615227, 0.3398903, -0.1390696, 0, 1, 0.9058824, 1,
-0.0356715, -0.9677029, -4.622026, 0, 1, 0.9098039, 1,
-0.02957308, 1.346177, -0.3732542, 0, 1, 0.9176471, 1,
-0.02948572, 0.4370741, -1.233301, 0, 1, 0.9215686, 1,
-0.02763927, -0.6656002, -3.608467, 0, 1, 0.9294118, 1,
-0.02068476, -0.7121908, -3.586386, 0, 1, 0.9333333, 1,
-0.01957181, 2.223886, -1.918387, 0, 1, 0.9411765, 1,
-0.01626625, -1.253454, -2.602843, 0, 1, 0.945098, 1,
-0.01573987, -0.5004265, -1.494787, 0, 1, 0.9529412, 1,
-0.01410679, -0.4719914, -1.081625, 0, 1, 0.9568627, 1,
-0.01329536, 1.132858, -0.3020948, 0, 1, 0.9647059, 1,
-0.01242483, -1.049812, -4.34932, 0, 1, 0.9686275, 1,
-0.01117052, -0.7675794, -2.68459, 0, 1, 0.9764706, 1,
-0.01027494, -0.3024241, -1.352119, 0, 1, 0.9803922, 1,
-0.008007744, -1.040787, -2.643204, 0, 1, 0.9882353, 1,
-0.006094908, 3.013458, -1.38963, 0, 1, 0.9921569, 1,
-0.00527251, 0.4342485, 0.8022352, 0, 1, 1, 1,
-0.003185161, -0.2508154, -3.595413, 0, 0.9921569, 1, 1,
0.0007152371, 0.4145475, -0.2370577, 0, 0.9882353, 1, 1,
0.001955624, 1.34766, -0.1819122, 0, 0.9803922, 1, 1,
0.003394118, 0.6155282, 0.5273671, 0, 0.9764706, 1, 1,
0.004408877, -0.06535771, 4.550198, 0, 0.9686275, 1, 1,
0.005018104, -0.8803161, 2.124185, 0, 0.9647059, 1, 1,
0.007795888, -0.2150109, 3.44342, 0, 0.9568627, 1, 1,
0.009014448, -0.02525338, 4.147647, 0, 0.9529412, 1, 1,
0.01933079, -0.1647918, 3.875767, 0, 0.945098, 1, 1,
0.02174282, 0.0118063, -0.1752548, 0, 0.9411765, 1, 1,
0.0241657, 1.205577, -0.3624841, 0, 0.9333333, 1, 1,
0.02509473, -0.9278916, 1.800971, 0, 0.9294118, 1, 1,
0.02561887, -0.4066671, 1.775218, 0, 0.9215686, 1, 1,
0.02726048, 1.996121, 0.812609, 0, 0.9176471, 1, 1,
0.02958173, 1.54523, -0.5692748, 0, 0.9098039, 1, 1,
0.03177204, 0.55715, 0.9485638, 0, 0.9058824, 1, 1,
0.03272557, 0.02969763, 1.394696, 0, 0.8980392, 1, 1,
0.03543387, 1.760217, 0.6442838, 0, 0.8901961, 1, 1,
0.03703093, -0.7731326, 3.137776, 0, 0.8862745, 1, 1,
0.03846126, -0.5506161, 3.231954, 0, 0.8784314, 1, 1,
0.04918339, -0.1264247, 3.508239, 0, 0.8745098, 1, 1,
0.05094555, -0.8811809, 4.198939, 0, 0.8666667, 1, 1,
0.0517175, -1.178017, 2.462651, 0, 0.8627451, 1, 1,
0.05387395, 0.07871453, 0.6792518, 0, 0.854902, 1, 1,
0.05612968, -0.2155703, 0.2486551, 0, 0.8509804, 1, 1,
0.0604108, -0.931521, 3.342039, 0, 0.8431373, 1, 1,
0.06215485, 1.59728, 1.140485, 0, 0.8392157, 1, 1,
0.06277804, 0.623129, 0.3810224, 0, 0.8313726, 1, 1,
0.06505103, 0.7598425, -0.01715265, 0, 0.827451, 1, 1,
0.06697894, 1.533729, 1.698959, 0, 0.8196079, 1, 1,
0.06728046, -1.727371, 2.996822, 0, 0.8156863, 1, 1,
0.0708415, 0.6057308, 1.926508, 0, 0.8078431, 1, 1,
0.07323394, -1.175032, 1.6165, 0, 0.8039216, 1, 1,
0.07350237, 0.5294384, 0.5491655, 0, 0.7960784, 1, 1,
0.07627968, -0.6429495, 3.706476, 0, 0.7882353, 1, 1,
0.07676861, -0.4169638, 3.049551, 0, 0.7843137, 1, 1,
0.07862064, 0.3838885, 0.5907838, 0, 0.7764706, 1, 1,
0.08345641, -0.8604728, 2.656854, 0, 0.772549, 1, 1,
0.08403734, 0.1628191, 0.2080605, 0, 0.7647059, 1, 1,
0.0864943, 0.01572751, 0.3534414, 0, 0.7607843, 1, 1,
0.08671252, -1.31884, 3.87652, 0, 0.7529412, 1, 1,
0.0895141, 1.680313, -0.7731712, 0, 0.7490196, 1, 1,
0.09708177, 1.816308, 0.1861789, 0, 0.7411765, 1, 1,
0.1008273, -0.6784994, 4.116261, 0, 0.7372549, 1, 1,
0.1032998, 0.528059, 0.5575068, 0, 0.7294118, 1, 1,
0.1088063, 0.6460964, 0.9776425, 0, 0.7254902, 1, 1,
0.1089957, -0.339435, 2.719566, 0, 0.7176471, 1, 1,
0.1113658, -1.659141, 2.818267, 0, 0.7137255, 1, 1,
0.1209728, -2.702148, 2.788015, 0, 0.7058824, 1, 1,
0.1213245, -0.9967768, 2.736714, 0, 0.6980392, 1, 1,
0.1224151, 1.684045, 0.7675486, 0, 0.6941177, 1, 1,
0.1224763, 0.627375, 1.045764, 0, 0.6862745, 1, 1,
0.1225603, 0.1113939, 1.899098, 0, 0.682353, 1, 1,
0.1226008, 0.9702204, -0.5207656, 0, 0.6745098, 1, 1,
0.1263991, 1.333466, -0.7008171, 0, 0.6705883, 1, 1,
0.1374034, -0.8894582, 3.968136, 0, 0.6627451, 1, 1,
0.1410514, 1.406737, -0.8352771, 0, 0.6588235, 1, 1,
0.1453392, -0.2014773, 1.621825, 0, 0.6509804, 1, 1,
0.1474237, 0.2176938, 0.1065021, 0, 0.6470588, 1, 1,
0.1476735, -0.9997724, 2.79185, 0, 0.6392157, 1, 1,
0.1527313, 1.580173, -0.3948835, 0, 0.6352941, 1, 1,
0.1569513, 0.5425546, 0.4975023, 0, 0.627451, 1, 1,
0.1595471, 0.3624479, 0.06424794, 0, 0.6235294, 1, 1,
0.1630374, 0.1680297, 2.554165, 0, 0.6156863, 1, 1,
0.1635062, -0.5289305, 2.736399, 0, 0.6117647, 1, 1,
0.1662404, -0.1899103, 2.749595, 0, 0.6039216, 1, 1,
0.1748444, -0.7722105, 3.525898, 0, 0.5960785, 1, 1,
0.1779366, -0.7389381, 2.231556, 0, 0.5921569, 1, 1,
0.1783284, -0.8339576, 2.437312, 0, 0.5843138, 1, 1,
0.1799503, -0.2796402, 1.404581, 0, 0.5803922, 1, 1,
0.1913234, -0.2563734, 3.475066, 0, 0.572549, 1, 1,
0.195246, 0.5359709, 0.3202429, 0, 0.5686275, 1, 1,
0.1972706, 1.378452, -0.7463563, 0, 0.5607843, 1, 1,
0.2211841, -0.3913034, 4.000111, 0, 0.5568628, 1, 1,
0.2212251, 2.755877, -0.2056216, 0, 0.5490196, 1, 1,
0.2218059, -0.8045726, 3.128244, 0, 0.5450981, 1, 1,
0.2264453, -0.36225, 1.973625, 0, 0.5372549, 1, 1,
0.2269513, 0.02837799, 2.747028, 0, 0.5333334, 1, 1,
0.2286293, 0.362102, 0.08430576, 0, 0.5254902, 1, 1,
0.2290734, 0.1005149, 2.942576, 0, 0.5215687, 1, 1,
0.2291885, 1.238965, -0.1584406, 0, 0.5137255, 1, 1,
0.2320898, 0.4455912, 0.9360065, 0, 0.509804, 1, 1,
0.2321354, -0.252806, 2.015884, 0, 0.5019608, 1, 1,
0.2350283, 0.7839448, 0.09806842, 0, 0.4941176, 1, 1,
0.2362268, 0.335804, 0.8562456, 0, 0.4901961, 1, 1,
0.2371999, -0.62793, 1.984288, 0, 0.4823529, 1, 1,
0.2409783, -0.6826915, 2.661145, 0, 0.4784314, 1, 1,
0.2435587, 1.904855, 0.03897999, 0, 0.4705882, 1, 1,
0.2438945, 1.379319, 0.4539409, 0, 0.4666667, 1, 1,
0.2526844, 0.06114339, 1.298409, 0, 0.4588235, 1, 1,
0.2529684, -0.1921533, 1.717356, 0, 0.454902, 1, 1,
0.2532653, -0.05693114, 2.394773, 0, 0.4470588, 1, 1,
0.2535431, -1.677214, 1.554355, 0, 0.4431373, 1, 1,
0.2542938, -0.2052942, 2.866152, 0, 0.4352941, 1, 1,
0.2546785, 0.5847398, 0.6337649, 0, 0.4313726, 1, 1,
0.2615934, -0.6074371, 3.141038, 0, 0.4235294, 1, 1,
0.2634404, 0.3410167, -0.4486473, 0, 0.4196078, 1, 1,
0.2636209, 1.689248, -0.295837, 0, 0.4117647, 1, 1,
0.2723005, -1.159086, 2.479753, 0, 0.4078431, 1, 1,
0.2770214, -0.7346478, 2.803111, 0, 0.4, 1, 1,
0.2806486, 0.00517007, 1.928091, 0, 0.3921569, 1, 1,
0.2830759, -0.8346981, 1.369914, 0, 0.3882353, 1, 1,
0.2854114, 0.9352993, 0.7378085, 0, 0.3803922, 1, 1,
0.2857927, -1.79084, 2.702685, 0, 0.3764706, 1, 1,
0.2861921, 0.5497149, -0.9951269, 0, 0.3686275, 1, 1,
0.2925225, 0.9767437, 0.6419368, 0, 0.3647059, 1, 1,
0.292972, 0.01606898, 1.348759, 0, 0.3568628, 1, 1,
0.2971684, -1.365022, 2.365978, 0, 0.3529412, 1, 1,
0.3010722, -0.9532324, 2.021844, 0, 0.345098, 1, 1,
0.3017116, -1.367755, 4.004272, 0, 0.3411765, 1, 1,
0.3053752, -0.9030233, 3.86445, 0, 0.3333333, 1, 1,
0.309031, -0.4667761, 3.931571, 0, 0.3294118, 1, 1,
0.3093105, -0.6080437, 2.888154, 0, 0.3215686, 1, 1,
0.3110512, -0.08788124, 4.042016, 0, 0.3176471, 1, 1,
0.3148645, -0.03125036, 2.595575, 0, 0.3098039, 1, 1,
0.3238563, -0.4530773, 4.30749, 0, 0.3058824, 1, 1,
0.3252056, -0.6449268, 3.027005, 0, 0.2980392, 1, 1,
0.326128, -0.754222, 1.931521, 0, 0.2901961, 1, 1,
0.3270514, 1.232029, -1.067986, 0, 0.2862745, 1, 1,
0.3363861, -0.3961909, 1.753123, 0, 0.2784314, 1, 1,
0.3399162, -0.8671786, -0.4845253, 0, 0.2745098, 1, 1,
0.3476478, -1.29383, 3.234745, 0, 0.2666667, 1, 1,
0.3481613, 1.184133, 0.8707257, 0, 0.2627451, 1, 1,
0.3485149, 0.132966, 0.7055601, 0, 0.254902, 1, 1,
0.3489505, -0.8228212, 1.936315, 0, 0.2509804, 1, 1,
0.3527553, 0.6017212, 0.9009847, 0, 0.2431373, 1, 1,
0.3634297, -0.953819, 2.730843, 0, 0.2392157, 1, 1,
0.3662318, 1.005665, 1.670427, 0, 0.2313726, 1, 1,
0.3709702, -2.485791, 1.741755, 0, 0.227451, 1, 1,
0.3722132, -0.8361682, 1.331019, 0, 0.2196078, 1, 1,
0.3735031, 0.6619247, -1.817475, 0, 0.2156863, 1, 1,
0.3742068, 1.321452, 1.289169, 0, 0.2078431, 1, 1,
0.3763011, 1.238001, 0.4601294, 0, 0.2039216, 1, 1,
0.38381, 0.2818969, 0.966729, 0, 0.1960784, 1, 1,
0.3870584, -0.4806781, 1.614543, 0, 0.1882353, 1, 1,
0.388231, -0.07420862, 1.748114, 0, 0.1843137, 1, 1,
0.3887673, 0.09197308, 2.10748, 0, 0.1764706, 1, 1,
0.3900664, 0.5751719, 1.18995, 0, 0.172549, 1, 1,
0.392231, 1.109044, 0.09677161, 0, 0.1647059, 1, 1,
0.392804, -0.2523362, 2.193306, 0, 0.1607843, 1, 1,
0.3975738, 0.005213764, 3.358993, 0, 0.1529412, 1, 1,
0.4033631, 0.2566429, 2.493266, 0, 0.1490196, 1, 1,
0.4053913, -0.9627218, 2.747671, 0, 0.1411765, 1, 1,
0.4065087, 0.2375086, -1.15061, 0, 0.1372549, 1, 1,
0.4103691, 0.8998463, -0.3380556, 0, 0.1294118, 1, 1,
0.4189331, 0.055881, 0.01601077, 0, 0.1254902, 1, 1,
0.4219134, -1.340116, 3.284203, 0, 0.1176471, 1, 1,
0.4237215, -0.3645513, 1.436508, 0, 0.1137255, 1, 1,
0.4242914, -0.1338477, 2.450951, 0, 0.1058824, 1, 1,
0.4301909, 1.980349, -0.1101249, 0, 0.09803922, 1, 1,
0.432522, 0.1088886, 0.1501074, 0, 0.09411765, 1, 1,
0.4362717, 0.9175671, -0.1594275, 0, 0.08627451, 1, 1,
0.4381379, -1.722228, 4.287127, 0, 0.08235294, 1, 1,
0.4392478, -0.6256685, 3.337111, 0, 0.07450981, 1, 1,
0.4424102, -0.5260517, 2.86108, 0, 0.07058824, 1, 1,
0.4437054, -2.010755, 1.391922, 0, 0.0627451, 1, 1,
0.4601551, -1.314176, 2.797782, 0, 0.05882353, 1, 1,
0.4666141, 2.019645, 0.2893756, 0, 0.05098039, 1, 1,
0.4672471, -2.239443, 2.995862, 0, 0.04705882, 1, 1,
0.4688803, -0.2156075, 1.9223, 0, 0.03921569, 1, 1,
0.4690998, -0.311984, 1.790363, 0, 0.03529412, 1, 1,
0.4804101, -0.6399739, 2.402365, 0, 0.02745098, 1, 1,
0.480806, -1.143372, 1.306931, 0, 0.02352941, 1, 1,
0.4816048, 0.02731373, 2.684368, 0, 0.01568628, 1, 1,
0.4871274, 1.544667, 0.3783441, 0, 0.01176471, 1, 1,
0.487841, -1.492128, 1.046018, 0, 0.003921569, 1, 1,
0.4910141, -1.026831, 4.147243, 0.003921569, 0, 1, 1,
0.4935099, -0.6096619, 4.356524, 0.007843138, 0, 1, 1,
0.5009484, -0.5265519, 3.215358, 0.01568628, 0, 1, 1,
0.501412, 0.8368339, 2.634811, 0.01960784, 0, 1, 1,
0.5021445, -1.610421, 3.462091, 0.02745098, 0, 1, 1,
0.5105821, -0.9473963, 3.476974, 0.03137255, 0, 1, 1,
0.5129515, 1.023607, 0.01214631, 0.03921569, 0, 1, 1,
0.5135091, 2.353195, 2.057166, 0.04313726, 0, 1, 1,
0.5168594, -0.5833721, 3.429448, 0.05098039, 0, 1, 1,
0.5174461, -0.6411232, 1.01894, 0.05490196, 0, 1, 1,
0.5192558, -0.6033614, 2.790303, 0.0627451, 0, 1, 1,
0.5198079, 0.5986909, 0.6377336, 0.06666667, 0, 1, 1,
0.5217782, -1.839497, 2.031464, 0.07450981, 0, 1, 1,
0.5239133, 1.390351, 0.7296436, 0.07843138, 0, 1, 1,
0.5277963, 1.605694, 1.017871, 0.08627451, 0, 1, 1,
0.5325537, -1.323669, 3.231869, 0.09019608, 0, 1, 1,
0.5347091, 0.1334195, 2.57543, 0.09803922, 0, 1, 1,
0.535272, -1.932722, 3.106635, 0.1058824, 0, 1, 1,
0.5395421, -0.3907921, 3.957563, 0.1098039, 0, 1, 1,
0.5408447, -0.2267509, 2.56838, 0.1176471, 0, 1, 1,
0.5409027, 1.578962, -0.4365163, 0.1215686, 0, 1, 1,
0.5410093, 0.1654999, 1.721693, 0.1294118, 0, 1, 1,
0.5452296, 0.03987917, 1.090499, 0.1333333, 0, 1, 1,
0.5455811, -0.6894386, 4.400454, 0.1411765, 0, 1, 1,
0.5475608, 0.565779, 1.382327, 0.145098, 0, 1, 1,
0.5510209, -0.4324836, 1.131862, 0.1529412, 0, 1, 1,
0.5523975, 2.026254, -0.7770505, 0.1568628, 0, 1, 1,
0.5542013, -0.3845762, 2.413, 0.1647059, 0, 1, 1,
0.5547929, -0.2106369, -0.9359519, 0.1686275, 0, 1, 1,
0.5571581, -2.05531, 1.704568, 0.1764706, 0, 1, 1,
0.5582741, 1.425989, 2.472147, 0.1803922, 0, 1, 1,
0.5592547, 0.5162966, 0.5038733, 0.1882353, 0, 1, 1,
0.5639793, -0.5766103, 0.9305033, 0.1921569, 0, 1, 1,
0.5720177, -1.283078, 2.560159, 0.2, 0, 1, 1,
0.5727378, -1.378778, 2.523077, 0.2078431, 0, 1, 1,
0.5762164, 0.338523, 1.893157, 0.2117647, 0, 1, 1,
0.5775239, 0.1194705, 1.563764, 0.2196078, 0, 1, 1,
0.5778863, 0.373719, 0.01444945, 0.2235294, 0, 1, 1,
0.5779965, -1.400694, 2.523183, 0.2313726, 0, 1, 1,
0.5804701, 0.2411873, -0.1874845, 0.2352941, 0, 1, 1,
0.5908167, 0.7260771, 0.9668559, 0.2431373, 0, 1, 1,
0.5988895, 0.06393834, 3.285614, 0.2470588, 0, 1, 1,
0.6054201, 1.644071, -1.011254, 0.254902, 0, 1, 1,
0.6094527, -0.2449717, 1.825089, 0.2588235, 0, 1, 1,
0.6111634, 2.198705, 0.01229793, 0.2666667, 0, 1, 1,
0.6131559, 0.6089263, 1.034368, 0.2705882, 0, 1, 1,
0.6171209, -0.4069661, 0.513372, 0.2784314, 0, 1, 1,
0.6178541, 1.126205, 1.420943, 0.282353, 0, 1, 1,
0.6192737, -1.286328, 4.910276, 0.2901961, 0, 1, 1,
0.6206857, -0.9779378, 1.177606, 0.2941177, 0, 1, 1,
0.6270369, 1.851358, 2.779687, 0.3019608, 0, 1, 1,
0.6279107, -0.04192823, 1.917633, 0.3098039, 0, 1, 1,
0.6352862, -1.17673, 4.476476, 0.3137255, 0, 1, 1,
0.638597, -0.8549398, 2.063004, 0.3215686, 0, 1, 1,
0.6452574, -1.469038, 4.383633, 0.3254902, 0, 1, 1,
0.6458642, -1.894611, 1.491729, 0.3333333, 0, 1, 1,
0.6506236, -1.6919, 0.6247823, 0.3372549, 0, 1, 1,
0.6524285, 2.025413, -0.4588381, 0.345098, 0, 1, 1,
0.6529343, -1.190082, 1.794392, 0.3490196, 0, 1, 1,
0.6572962, 0.08456622, 1.011944, 0.3568628, 0, 1, 1,
0.6598163, -0.01415579, 1.282647, 0.3607843, 0, 1, 1,
0.6602762, -0.5915561, 3.625047, 0.3686275, 0, 1, 1,
0.6619446, 0.1990552, 1.677629, 0.372549, 0, 1, 1,
0.6640493, -0.5988613, 3.028411, 0.3803922, 0, 1, 1,
0.6657994, 0.0175289, -0.3781377, 0.3843137, 0, 1, 1,
0.6737058, 1.390436, -0.3527015, 0.3921569, 0, 1, 1,
0.6966026, -0.6771739, 1.751802, 0.3960784, 0, 1, 1,
0.7002214, -1.475648, 1.928187, 0.4039216, 0, 1, 1,
0.7006789, 1.518362, 0.2334915, 0.4117647, 0, 1, 1,
0.7031688, -0.331057, 1.72841, 0.4156863, 0, 1, 1,
0.7047513, 0.08794293, 3.149229, 0.4235294, 0, 1, 1,
0.7091263, -0.1227252, 0.7128235, 0.427451, 0, 1, 1,
0.7112534, 1.013128, 0.5517814, 0.4352941, 0, 1, 1,
0.712127, 1.103799, 1.777845, 0.4392157, 0, 1, 1,
0.7198732, -0.461547, 3.381618, 0.4470588, 0, 1, 1,
0.7204609, 1.084475, 1.223601, 0.4509804, 0, 1, 1,
0.7205419, -2.868595, 3.135023, 0.4588235, 0, 1, 1,
0.7227301, 0.3885374, 1.52378, 0.4627451, 0, 1, 1,
0.7283052, -0.9917617, 2.794861, 0.4705882, 0, 1, 1,
0.7355203, -1.489695, 3.505049, 0.4745098, 0, 1, 1,
0.7414037, 0.8445666, -0.07635929, 0.4823529, 0, 1, 1,
0.7418504, -0.4301867, 2.595416, 0.4862745, 0, 1, 1,
0.7446445, 0.7146465, 1.317701, 0.4941176, 0, 1, 1,
0.7455814, -1.84681, 1.987937, 0.5019608, 0, 1, 1,
0.7468438, -0.4676933, 3.682724, 0.5058824, 0, 1, 1,
0.7485612, -0.2270143, 1.5492, 0.5137255, 0, 1, 1,
0.7501608, -0.1325157, 0.7384059, 0.5176471, 0, 1, 1,
0.7546867, -0.3249411, 2.542835, 0.5254902, 0, 1, 1,
0.7550529, -0.5715792, 2.873172, 0.5294118, 0, 1, 1,
0.7624841, 1.149508, 1.170414, 0.5372549, 0, 1, 1,
0.7626103, 1.623739, 0.0898971, 0.5411765, 0, 1, 1,
0.7646319, -1.676169, 3.608191, 0.5490196, 0, 1, 1,
0.7691551, 1.004941, -0.3066502, 0.5529412, 0, 1, 1,
0.7699489, -0.9768745, 2.455663, 0.5607843, 0, 1, 1,
0.7714989, -0.2058877, 1.333501, 0.5647059, 0, 1, 1,
0.7741466, 0.1877931, 0.6961595, 0.572549, 0, 1, 1,
0.7750369, -0.1226032, 3.614198, 0.5764706, 0, 1, 1,
0.7772295, 0.4407027, 1.029346, 0.5843138, 0, 1, 1,
0.7774249, 1.387317, 1.045067, 0.5882353, 0, 1, 1,
0.7807634, -1.131165, 3.625608, 0.5960785, 0, 1, 1,
0.7854926, -0.06143976, 0.6725836, 0.6039216, 0, 1, 1,
0.7877098, 0.335888, 2.472795, 0.6078432, 0, 1, 1,
0.7881167, 0.2115026, 0.7428469, 0.6156863, 0, 1, 1,
0.7890729, -0.01734422, 0.8332295, 0.6196079, 0, 1, 1,
0.7899736, -0.8182942, 2.12904, 0.627451, 0, 1, 1,
0.79088, -0.2801277, 1.502449, 0.6313726, 0, 1, 1,
0.7972458, 0.04127511, 1.825565, 0.6392157, 0, 1, 1,
0.8012078, -1.507503, -0.2975982, 0.6431373, 0, 1, 1,
0.8043785, 0.9139658, 1.218154, 0.6509804, 0, 1, 1,
0.8044042, 0.5515423, -0.05096503, 0.654902, 0, 1, 1,
0.8081718, -0.2726767, 3.044357, 0.6627451, 0, 1, 1,
0.8100623, -1.393251, 3.614221, 0.6666667, 0, 1, 1,
0.8142364, -0.2252995, 3.552077, 0.6745098, 0, 1, 1,
0.8174632, 1.251503, 3.579431, 0.6784314, 0, 1, 1,
0.8214022, -1.041355, 1.134348, 0.6862745, 0, 1, 1,
0.8276332, 1.350482, 0.652983, 0.6901961, 0, 1, 1,
0.8293988, -1.932226, 4.002683, 0.6980392, 0, 1, 1,
0.8322126, -1.045178, 3.049574, 0.7058824, 0, 1, 1,
0.8350317, -0.6340498, 1.918609, 0.7098039, 0, 1, 1,
0.840644, -0.9892809, 2.230078, 0.7176471, 0, 1, 1,
0.841706, -0.2262139, 2.381657, 0.7215686, 0, 1, 1,
0.8431315, 0.2826511, 3.774114, 0.7294118, 0, 1, 1,
0.848528, -0.7138851, 2.429385, 0.7333333, 0, 1, 1,
0.8505339, -2.66468, 2.342396, 0.7411765, 0, 1, 1,
0.8583586, 0.3698366, 1.107745, 0.7450981, 0, 1, 1,
0.8600804, 1.272943, -0.451681, 0.7529412, 0, 1, 1,
0.8603075, 0.2669089, 1.304705, 0.7568628, 0, 1, 1,
0.8630787, 0.2950055, 2.808076, 0.7647059, 0, 1, 1,
0.8634458, -1.208381, 3.10395, 0.7686275, 0, 1, 1,
0.8641858, -0.8753278, 4.211427, 0.7764706, 0, 1, 1,
0.8680587, -0.8859084, 3.184331, 0.7803922, 0, 1, 1,
0.8807271, 1.252756, 2.038385, 0.7882353, 0, 1, 1,
0.8814898, -2.177164, 3.02563, 0.7921569, 0, 1, 1,
0.889398, -1.22421, 2.682226, 0.8, 0, 1, 1,
0.8950954, 0.5800909, 0.4057393, 0.8078431, 0, 1, 1,
0.8955733, -1.226257, 5.081218, 0.8117647, 0, 1, 1,
0.8971997, -1.540297, 3.514268, 0.8196079, 0, 1, 1,
0.8981498, -0.6912414, 2.869356, 0.8235294, 0, 1, 1,
0.9030071, -0.3703789, 1.514498, 0.8313726, 0, 1, 1,
0.9031756, 0.06263477, -0.1733673, 0.8352941, 0, 1, 1,
0.9060563, 0.7118276, 2.093821, 0.8431373, 0, 1, 1,
0.912587, -0.2961427, 2.36016, 0.8470588, 0, 1, 1,
0.9190007, -1.582617, 3.613072, 0.854902, 0, 1, 1,
0.9211209, 0.7657241, 0.4846208, 0.8588235, 0, 1, 1,
0.9245578, 0.4221448, 1.510286, 0.8666667, 0, 1, 1,
0.926603, -0.255829, 1.336745, 0.8705882, 0, 1, 1,
0.9332703, -0.4597929, 4.009184, 0.8784314, 0, 1, 1,
0.9354436, 0.1849891, 3.021883, 0.8823529, 0, 1, 1,
0.9380887, 0.2984407, 1.068358, 0.8901961, 0, 1, 1,
0.9384339, 1.409758, 0.2420439, 0.8941177, 0, 1, 1,
0.9415216, -1.299493, 2.976229, 0.9019608, 0, 1, 1,
0.9615127, 1.230814, -0.9124881, 0.9098039, 0, 1, 1,
0.9618524, -0.4647753, -0.1441779, 0.9137255, 0, 1, 1,
0.9623629, -1.126444, 3.446404, 0.9215686, 0, 1, 1,
0.9627868, 0.7310814, -0.5046304, 0.9254902, 0, 1, 1,
0.964887, -1.781868, 0.3604616, 0.9333333, 0, 1, 1,
0.9690456, -0.2627484, 1.720427, 0.9372549, 0, 1, 1,
0.9692658, 0.5178343, -0.1191174, 0.945098, 0, 1, 1,
0.9699784, -0.8209935, 2.262047, 0.9490196, 0, 1, 1,
0.9700854, -1.590271, 1.334241, 0.9568627, 0, 1, 1,
0.9989315, 0.5976826, 1.931264, 0.9607843, 0, 1, 1,
1.003755, -0.06830586, -0.5006889, 0.9686275, 0, 1, 1,
1.005744, 0.7040345, 3.010889, 0.972549, 0, 1, 1,
1.009132, 0.3562942, 1.43248, 0.9803922, 0, 1, 1,
1.013365, -1.035203, 3.18279, 0.9843137, 0, 1, 1,
1.014592, -1.610333, 2.700636, 0.9921569, 0, 1, 1,
1.015462, -0.5365735, 2.279623, 0.9960784, 0, 1, 1,
1.019293, 0.556484, 2.625856, 1, 0, 0.9960784, 1,
1.021339, 1.458618, -0.4765794, 1, 0, 0.9882353, 1,
1.021939, 1.516458, 0.5749103, 1, 0, 0.9843137, 1,
1.030242, 1.017004, 0.4719268, 1, 0, 0.9764706, 1,
1.040415, -0.2326227, 1.099723, 1, 0, 0.972549, 1,
1.042446, 2.215976, -0.5594224, 1, 0, 0.9647059, 1,
1.05518, 0.1672028, -0.04217303, 1, 0, 0.9607843, 1,
1.062873, -0.2699574, 3.343121, 1, 0, 0.9529412, 1,
1.069601, 1.157031, 2.130806, 1, 0, 0.9490196, 1,
1.082853, 0.3294842, 1.18436, 1, 0, 0.9411765, 1,
1.086682, -0.174067, 1.567665, 1, 0, 0.9372549, 1,
1.09188, -1.315561, 3.67461, 1, 0, 0.9294118, 1,
1.092244, -2.261349, 5.539247, 1, 0, 0.9254902, 1,
1.093545, 0.8845013, 1.378299, 1, 0, 0.9176471, 1,
1.099125, -1.282668, 3.854925, 1, 0, 0.9137255, 1,
1.101896, 1.039089, 1.346312, 1, 0, 0.9058824, 1,
1.117629, 0.6379303, 0.1405622, 1, 0, 0.9019608, 1,
1.126938, -0.7243867, 0.5462007, 1, 0, 0.8941177, 1,
1.128981, -0.3256581, 1.092245, 1, 0, 0.8862745, 1,
1.1301, 0.7067754, 0.6619914, 1, 0, 0.8823529, 1,
1.135132, -0.5559766, 0.2418643, 1, 0, 0.8745098, 1,
1.142811, -1.350865, 1.879196, 1, 0, 0.8705882, 1,
1.156585, 0.4337664, 0.06975544, 1, 0, 0.8627451, 1,
1.163212, -0.3372323, 2.179368, 1, 0, 0.8588235, 1,
1.168996, 0.5726943, 2.024792, 1, 0, 0.8509804, 1,
1.17468, 0.8273271, -0.3765192, 1, 0, 0.8470588, 1,
1.176387, 0.1746105, 0.8348038, 1, 0, 0.8392157, 1,
1.179573, 0.469691, 1.5222, 1, 0, 0.8352941, 1,
1.192149, 1.002363, 1.619349, 1, 0, 0.827451, 1,
1.196056, -0.2256341, 0.8694862, 1, 0, 0.8235294, 1,
1.196724, -0.3736463, 2.783742, 1, 0, 0.8156863, 1,
1.197301, -0.4875323, -0.3492545, 1, 0, 0.8117647, 1,
1.201544, 0.8360217, 1.9302, 1, 0, 0.8039216, 1,
1.202165, 0.1403288, 1.598579, 1, 0, 0.7960784, 1,
1.202814, 0.6572416, -0.9209334, 1, 0, 0.7921569, 1,
1.205293, 0.07844162, 0.7907365, 1, 0, 0.7843137, 1,
1.213038, -0.6226493, 4.282011, 1, 0, 0.7803922, 1,
1.217527, 1.375248, -0.7286783, 1, 0, 0.772549, 1,
1.217579, -0.4989309, 2.246548, 1, 0, 0.7686275, 1,
1.218395, -0.3560837, 3.764542, 1, 0, 0.7607843, 1,
1.225585, 0.8708637, 0.03220315, 1, 0, 0.7568628, 1,
1.227191, -1.281889, 2.87538, 1, 0, 0.7490196, 1,
1.229972, 0.0971763, 1.99115, 1, 0, 0.7450981, 1,
1.232844, 0.8047873, 1.547435, 1, 0, 0.7372549, 1,
1.239138, 0.5148199, 0.1037146, 1, 0, 0.7333333, 1,
1.240039, 0.7283497, 1.743369, 1, 0, 0.7254902, 1,
1.241041, -2.13791, 3.014125, 1, 0, 0.7215686, 1,
1.259989, 0.7186703, 0.7275516, 1, 0, 0.7137255, 1,
1.261026, 0.7855601, 2.211529, 1, 0, 0.7098039, 1,
1.265568, -0.1180291, 2.193113, 1, 0, 0.7019608, 1,
1.268816, -0.8607923, 2.66294, 1, 0, 0.6941177, 1,
1.271747, -0.5548694, 0.8950878, 1, 0, 0.6901961, 1,
1.27512, 0.4898559, 1.714303, 1, 0, 0.682353, 1,
1.278049, -0.817264, 1.957002, 1, 0, 0.6784314, 1,
1.292088, -0.862548, 2.879093, 1, 0, 0.6705883, 1,
1.294857, -1.027103, 0.8796813, 1, 0, 0.6666667, 1,
1.297535, 1.205234, 0.1554718, 1, 0, 0.6588235, 1,
1.328892, -0.7055393, 2.691055, 1, 0, 0.654902, 1,
1.330083, 0.272125, 0.8858455, 1, 0, 0.6470588, 1,
1.334737, 0.5899492, 0.2573284, 1, 0, 0.6431373, 1,
1.335378, -1.197831, 1.29614, 1, 0, 0.6352941, 1,
1.338286, 2.185693, 1.137448, 1, 0, 0.6313726, 1,
1.36534, -0.9428539, 3.198488, 1, 0, 0.6235294, 1,
1.370203, -0.06902198, 1.0766, 1, 0, 0.6196079, 1,
1.371968, 0.5314321, 1.252421, 1, 0, 0.6117647, 1,
1.374457, 0.6520457, 0.6027617, 1, 0, 0.6078432, 1,
1.374932, 0.4456338, 1.549786, 1, 0, 0.6, 1,
1.376632, -1.998509, -0.08447374, 1, 0, 0.5921569, 1,
1.376764, 0.4779619, 2.47948, 1, 0, 0.5882353, 1,
1.380747, -0.9390386, 1.753857, 1, 0, 0.5803922, 1,
1.386899, -0.02008608, 1.178952, 1, 0, 0.5764706, 1,
1.388915, -0.682106, 2.487748, 1, 0, 0.5686275, 1,
1.39349, -0.175372, 0.07980608, 1, 0, 0.5647059, 1,
1.393734, -0.0882965, 0.9181822, 1, 0, 0.5568628, 1,
1.394135, 2.137329, -0.5920616, 1, 0, 0.5529412, 1,
1.394713, -1.20559, 2.909741, 1, 0, 0.5450981, 1,
1.402532, -0.8297545, 2.957905, 1, 0, 0.5411765, 1,
1.404613, -0.5271736, 2.75231, 1, 0, 0.5333334, 1,
1.409904, 1.054417, -0.433152, 1, 0, 0.5294118, 1,
1.411509, -2.831156, 2.184067, 1, 0, 0.5215687, 1,
1.413522, -1.375242, 1.387614, 1, 0, 0.5176471, 1,
1.423118, -0.2812684, 0.4207541, 1, 0, 0.509804, 1,
1.433277, -0.5490094, 3.437904, 1, 0, 0.5058824, 1,
1.433799, 1.382834, 0.9523759, 1, 0, 0.4980392, 1,
1.436441, 0.4849175, -0.418066, 1, 0, 0.4901961, 1,
1.437968, 0.4288831, 2.245626, 1, 0, 0.4862745, 1,
1.439694, -0.728172, 3.361569, 1, 0, 0.4784314, 1,
1.440299, 0.7454507, 1.806574, 1, 0, 0.4745098, 1,
1.449015, 0.7080604, 0.5883693, 1, 0, 0.4666667, 1,
1.453417, 0.7111685, 1.440354, 1, 0, 0.4627451, 1,
1.46338, 0.3789642, -0.09679566, 1, 0, 0.454902, 1,
1.463465, 0.5080001, 0.8833286, 1, 0, 0.4509804, 1,
1.464802, 2.068736, -0.08774718, 1, 0, 0.4431373, 1,
1.471426, 1.638487, 3.259639, 1, 0, 0.4392157, 1,
1.472271, -2.643897, 3.486314, 1, 0, 0.4313726, 1,
1.480506, 0.4248021, 2.445941, 1, 0, 0.427451, 1,
1.492825, -0.4208883, 0.9939982, 1, 0, 0.4196078, 1,
1.49493, 0.4373294, 0.9101409, 1, 0, 0.4156863, 1,
1.498293, -0.6521638, 3.555847, 1, 0, 0.4078431, 1,
1.499216, -2.66251, 0.1693306, 1, 0, 0.4039216, 1,
1.515694, -0.3040909, 1.708026, 1, 0, 0.3960784, 1,
1.522047, 1.770146, 0.4051603, 1, 0, 0.3882353, 1,
1.530582, 0.5471051, 1.679274, 1, 0, 0.3843137, 1,
1.530981, -0.2162237, 2.127818, 1, 0, 0.3764706, 1,
1.53338, 1.41113, 1.425277, 1, 0, 0.372549, 1,
1.53534, -0.5736533, 4.651173, 1, 0, 0.3647059, 1,
1.544463, 0.6812162, 0.2255612, 1, 0, 0.3607843, 1,
1.571472, 0.3669656, 3.66493, 1, 0, 0.3529412, 1,
1.577245, 1.51111, 0.5078604, 1, 0, 0.3490196, 1,
1.582829, -0.309663, 1.523614, 1, 0, 0.3411765, 1,
1.583558, -0.3536627, 2.894825, 1, 0, 0.3372549, 1,
1.588453, 0.214747, -0.1689396, 1, 0, 0.3294118, 1,
1.589416, -0.5215071, 0.3267686, 1, 0, 0.3254902, 1,
1.59515, -1.207796, 1.938217, 1, 0, 0.3176471, 1,
1.631517, 1.037365, 3.160271, 1, 0, 0.3137255, 1,
1.660657, 1.258543, 0.6551067, 1, 0, 0.3058824, 1,
1.679555, 0.213512, 2.676452, 1, 0, 0.2980392, 1,
1.686018, 0.745109, 3.442482, 1, 0, 0.2941177, 1,
1.688499, -0.3830006, 1.080399, 1, 0, 0.2862745, 1,
1.704288, -0.3761385, 1.35528, 1, 0, 0.282353, 1,
1.712967, -0.8090308, 1.620921, 1, 0, 0.2745098, 1,
1.722396, 0.700721, 0.838389, 1, 0, 0.2705882, 1,
1.722447, 0.9000472, 0.2700795, 1, 0, 0.2627451, 1,
1.745647, 0.1597441, 2.81242, 1, 0, 0.2588235, 1,
1.746104, 1.608549, 0.1914738, 1, 0, 0.2509804, 1,
1.767013, -0.1603363, 2.411866, 1, 0, 0.2470588, 1,
1.775122, -0.2595947, -0.1334163, 1, 0, 0.2392157, 1,
1.778628, -1.132787, 2.692679, 1, 0, 0.2352941, 1,
1.795269, 0.8830492, 2.456614, 1, 0, 0.227451, 1,
1.816843, 0.1993921, 0.07946525, 1, 0, 0.2235294, 1,
1.825341, -0.07721187, -0.4438653, 1, 0, 0.2156863, 1,
1.829383, -0.006897259, 2.014367, 1, 0, 0.2117647, 1,
1.829443, 1.547909, 1.58795, 1, 0, 0.2039216, 1,
1.851468, 0.7167504, 1.799179, 1, 0, 0.1960784, 1,
1.86398, 1.942886, 0.3640646, 1, 0, 0.1921569, 1,
1.87035, -0.2886511, 2.139411, 1, 0, 0.1843137, 1,
1.870761, 0.8971375, 1.551834, 1, 0, 0.1803922, 1,
1.879622, 2.574751, 0.6958636, 1, 0, 0.172549, 1,
1.886263, 0.6161419, -0.5530825, 1, 0, 0.1686275, 1,
1.899561, 0.4799227, 1.18993, 1, 0, 0.1607843, 1,
1.90002, 1.215086, 0.4514738, 1, 0, 0.1568628, 1,
1.943658, -1.005658, 1.462016, 1, 0, 0.1490196, 1,
1.95909, 0.9452463, -0.282778, 1, 0, 0.145098, 1,
1.963823, -1.550084, 2.665104, 1, 0, 0.1372549, 1,
1.97221, -0.778771, 1.961496, 1, 0, 0.1333333, 1,
1.980157, 0.1939308, -0.6796601, 1, 0, 0.1254902, 1,
2.001276, 0.756024, 0.7647648, 1, 0, 0.1215686, 1,
2.02812, -0.9337461, 0.8571263, 1, 0, 0.1137255, 1,
2.03122, 0.02105618, 1.460441, 1, 0, 0.1098039, 1,
2.044057, 0.7870009, 1.82564, 1, 0, 0.1019608, 1,
2.069756, 0.189706, 2.6882, 1, 0, 0.09411765, 1,
2.071714, 0.6730411, 1.074104, 1, 0, 0.09019608, 1,
2.081827, 0.2742041, 1.150893, 1, 0, 0.08235294, 1,
2.087705, -2.485226, 2.933405, 1, 0, 0.07843138, 1,
2.111898, 0.02766044, 2.42047, 1, 0, 0.07058824, 1,
2.131928, -1.109544, 1.560781, 1, 0, 0.06666667, 1,
2.193112, 0.8887942, 0.6998451, 1, 0, 0.05882353, 1,
2.265791, 0.218273, 0.1588835, 1, 0, 0.05490196, 1,
2.30027, -0.9200393, 1.435018, 1, 0, 0.04705882, 1,
2.323698, -0.9010021, 1.272942, 1, 0, 0.04313726, 1,
2.360926, 0.1650023, -0.2499366, 1, 0, 0.03529412, 1,
2.402411, 0.8629266, 0.01976774, 1, 0, 0.03137255, 1,
2.526537, 0.6872464, 1.476774, 1, 0, 0.02352941, 1,
2.929551, -0.8232731, 1.007694, 1, 0, 0.01960784, 1,
2.978482, 1.129546, 1.878237, 1, 0, 0.01176471, 1,
3.479191, 2.785382, 0.9546664, 1, 0, 0.007843138, 1
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
-0.2479067, -4.58892, -6.646675, 0, -0.5, 0.5, 0.5,
-0.2479067, -4.58892, -6.646675, 1, -0.5, 0.5, 0.5,
-0.2479067, -4.58892, -6.646675, 1, 1.5, 0.5, 0.5,
-0.2479067, -4.58892, -6.646675, 0, 1.5, 0.5, 0.5
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
-5.238491, -0.2368106, -6.646675, 0, -0.5, 0.5, 0.5,
-5.238491, -0.2368106, -6.646675, 1, -0.5, 0.5, 0.5,
-5.238491, -0.2368106, -6.646675, 1, 1.5, 0.5, 0.5,
-5.238491, -0.2368106, -6.646675, 0, 1.5, 0.5, 0.5
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
-5.238491, -4.58892, 0.3293617, 0, -0.5, 0.5, 0.5,
-5.238491, -4.58892, 0.3293617, 1, -0.5, 0.5, 0.5,
-5.238491, -4.58892, 0.3293617, 1, 1.5, 0.5, 0.5,
-5.238491, -4.58892, 0.3293617, 0, 1.5, 0.5, 0.5
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
-2, -3.584587, -5.03682,
2, -3.584587, -5.03682,
-2, -3.584587, -5.03682,
-2, -3.751976, -5.30513,
0, -3.584587, -5.03682,
0, -3.751976, -5.30513,
2, -3.584587, -5.03682,
2, -3.751976, -5.30513
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
-2, -4.086753, -5.841748, 0, -0.5, 0.5, 0.5,
-2, -4.086753, -5.841748, 1, -0.5, 0.5, 0.5,
-2, -4.086753, -5.841748, 1, 1.5, 0.5, 0.5,
-2, -4.086753, -5.841748, 0, 1.5, 0.5, 0.5,
0, -4.086753, -5.841748, 0, -0.5, 0.5, 0.5,
0, -4.086753, -5.841748, 1, -0.5, 0.5, 0.5,
0, -4.086753, -5.841748, 1, 1.5, 0.5, 0.5,
0, -4.086753, -5.841748, 0, 1.5, 0.5, 0.5,
2, -4.086753, -5.841748, 0, -0.5, 0.5, 0.5,
2, -4.086753, -5.841748, 1, -0.5, 0.5, 0.5,
2, -4.086753, -5.841748, 1, 1.5, 0.5, 0.5,
2, -4.086753, -5.841748, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-4.086817, -3, -5.03682,
-4.086817, 3, -5.03682,
-4.086817, -3, -5.03682,
-4.278763, -3, -5.30513,
-4.086817, -2, -5.03682,
-4.278763, -2, -5.30513,
-4.086817, -1, -5.03682,
-4.278763, -1, -5.30513,
-4.086817, 0, -5.03682,
-4.278763, 0, -5.30513,
-4.086817, 1, -5.03682,
-4.278763, 1, -5.30513,
-4.086817, 2, -5.03682,
-4.278763, 2, -5.30513,
-4.086817, 3, -5.03682,
-4.278763, 3, -5.30513
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
-4.662654, -3, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, -3, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, -3, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, -3, -5.841748, 0, 1.5, 0.5, 0.5,
-4.662654, -2, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, -2, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, -2, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, -2, -5.841748, 0, 1.5, 0.5, 0.5,
-4.662654, -1, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, -1, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, -1, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, -1, -5.841748, 0, 1.5, 0.5, 0.5,
-4.662654, 0, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, 0, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, 0, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, 0, -5.841748, 0, 1.5, 0.5, 0.5,
-4.662654, 1, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, 1, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, 1, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, 1, -5.841748, 0, 1.5, 0.5, 0.5,
-4.662654, 2, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, 2, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, 2, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, 2, -5.841748, 0, 1.5, 0.5, 0.5,
-4.662654, 3, -5.841748, 0, -0.5, 0.5, 0.5,
-4.662654, 3, -5.841748, 1, -0.5, 0.5, 0.5,
-4.662654, 3, -5.841748, 1, 1.5, 0.5, 0.5,
-4.662654, 3, -5.841748, 0, 1.5, 0.5, 0.5
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
-4.086817, -3.584587, -4,
-4.086817, -3.584587, 4,
-4.086817, -3.584587, -4,
-4.278763, -3.751976, -4,
-4.086817, -3.584587, -2,
-4.278763, -3.751976, -2,
-4.086817, -3.584587, 0,
-4.278763, -3.751976, 0,
-4.086817, -3.584587, 2,
-4.278763, -3.751976, 2,
-4.086817, -3.584587, 4,
-4.278763, -3.751976, 4
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
-4.662654, -4.086753, -4, 0, -0.5, 0.5, 0.5,
-4.662654, -4.086753, -4, 1, -0.5, 0.5, 0.5,
-4.662654, -4.086753, -4, 1, 1.5, 0.5, 0.5,
-4.662654, -4.086753, -4, 0, 1.5, 0.5, 0.5,
-4.662654, -4.086753, -2, 0, -0.5, 0.5, 0.5,
-4.662654, -4.086753, -2, 1, -0.5, 0.5, 0.5,
-4.662654, -4.086753, -2, 1, 1.5, 0.5, 0.5,
-4.662654, -4.086753, -2, 0, 1.5, 0.5, 0.5,
-4.662654, -4.086753, 0, 0, -0.5, 0.5, 0.5,
-4.662654, -4.086753, 0, 1, -0.5, 0.5, 0.5,
-4.662654, -4.086753, 0, 1, 1.5, 0.5, 0.5,
-4.662654, -4.086753, 0, 0, 1.5, 0.5, 0.5,
-4.662654, -4.086753, 2, 0, -0.5, 0.5, 0.5,
-4.662654, -4.086753, 2, 1, -0.5, 0.5, 0.5,
-4.662654, -4.086753, 2, 1, 1.5, 0.5, 0.5,
-4.662654, -4.086753, 2, 0, 1.5, 0.5, 0.5,
-4.662654, -4.086753, 4, 0, -0.5, 0.5, 0.5,
-4.662654, -4.086753, 4, 1, -0.5, 0.5, 0.5,
-4.662654, -4.086753, 4, 1, 1.5, 0.5, 0.5,
-4.662654, -4.086753, 4, 0, 1.5, 0.5, 0.5
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
-4.086817, -3.584587, -5.03682,
-4.086817, 3.110966, -5.03682,
-4.086817, -3.584587, 5.695544,
-4.086817, 3.110966, 5.695544,
-4.086817, -3.584587, -5.03682,
-4.086817, -3.584587, 5.695544,
-4.086817, 3.110966, -5.03682,
-4.086817, 3.110966, 5.695544,
-4.086817, -3.584587, -5.03682,
3.591004, -3.584587, -5.03682,
-4.086817, -3.584587, 5.695544,
3.591004, -3.584587, 5.695544,
-4.086817, 3.110966, -5.03682,
3.591004, 3.110966, -5.03682,
-4.086817, 3.110966, 5.695544,
3.591004, 3.110966, 5.695544,
3.591004, -3.584587, -5.03682,
3.591004, 3.110966, -5.03682,
3.591004, -3.584587, 5.695544,
3.591004, 3.110966, 5.695544,
3.591004, -3.584587, -5.03682,
3.591004, -3.584587, 5.695544,
3.591004, 3.110966, -5.03682,
3.591004, 3.110966, 5.695544
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
var radius = 7.901524;
var distance = 35.15477;
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
mvMatrix.translate( 0.2479067, 0.2368106, -0.3293617 );
mvMatrix.scale( 1.112722, 1.275964, 0.7960299 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.15477);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
tralkoxydim<-read.table("tralkoxydim.xyz")
```

```
## Error in read.table("tralkoxydim.xyz"): no lines available in input
```

```r
x<-tralkoxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
```

```r
y<-tralkoxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
```

```r
z<-tralkoxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'tralkoxydim' not found
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
-3.975004, -2.114082, -1.857068, 0, 0, 1, 1, 1,
-3.525244, -0.2501119, -3.221661, 1, 0, 0, 1, 1,
-3.141338, 0.7139703, -1.7177, 1, 0, 0, 1, 1,
-2.63974, 1.083327, -1.305095, 1, 0, 0, 1, 1,
-2.575742, -0.3586845, -1.814403, 1, 0, 0, 1, 1,
-2.557681, 1.432718, -0.7436781, 1, 0, 0, 1, 1,
-2.545696, -0.9797172, 0.3281793, 0, 0, 0, 1, 1,
-2.527331, 0.3584135, -2.332462, 0, 0, 0, 1, 1,
-2.451002, -1.678706, -1.595767, 0, 0, 0, 1, 1,
-2.411475, -0.8516246, -0.3118533, 0, 0, 0, 1, 1,
-2.343331, -0.974521, -3.07127, 0, 0, 0, 1, 1,
-2.219667, -0.1597803, -0.8974986, 0, 0, 0, 1, 1,
-2.217171, -0.110877, -2.10917, 0, 0, 0, 1, 1,
-2.152397, -2.043961, -2.859352, 1, 1, 1, 1, 1,
-2.147759, -0.2878428, -3.595498, 1, 1, 1, 1, 1,
-2.134446, -0.05557135, -1.903177, 1, 1, 1, 1, 1,
-2.114225, 0.7157041, -2.316501, 1, 1, 1, 1, 1,
-2.045917, 0.7543582, -1.932841, 1, 1, 1, 1, 1,
-2.023603, -1.110513, -2.613623, 1, 1, 1, 1, 1,
-2.010979, -1.621622, -1.186999, 1, 1, 1, 1, 1,
-2.001484, 0.3443374, -1.133602, 1, 1, 1, 1, 1,
-1.973073, 1.090944, -2.517853, 1, 1, 1, 1, 1,
-1.958738, -1.21184, -1.293279, 1, 1, 1, 1, 1,
-1.955484, 1.068482, -1.015434, 1, 1, 1, 1, 1,
-1.923911, 0.2051548, -1.374325, 1, 1, 1, 1, 1,
-1.870076, 0.05767208, -1.695698, 1, 1, 1, 1, 1,
-1.840814, -0.3665009, -0.937807, 1, 1, 1, 1, 1,
-1.837545, -1.26577, -2.293387, 1, 1, 1, 1, 1,
-1.837304, -0.4896855, -0.8111531, 0, 0, 1, 1, 1,
-1.83602, -1.07667, -2.338052, 1, 0, 0, 1, 1,
-1.818654, -0.1804187, -0.8405337, 1, 0, 0, 1, 1,
-1.818245, 1.69908, -0.4441448, 1, 0, 0, 1, 1,
-1.787933, 1.348661, 0.8607515, 1, 0, 0, 1, 1,
-1.7744, -0.4886823, -2.306966, 1, 0, 0, 1, 1,
-1.772517, -0.0446605, 0.05462839, 0, 0, 0, 1, 1,
-1.760367, -0.557474, -1.832248, 0, 0, 0, 1, 1,
-1.743124, 0.9350249, 0.7645294, 0, 0, 0, 1, 1,
-1.74176, -0.3275224, -1.105164, 0, 0, 0, 1, 1,
-1.728502, 0.8622698, -0.5218499, 0, 0, 0, 1, 1,
-1.727802, -0.9937707, -2.03453, 0, 0, 0, 1, 1,
-1.700318, 0.0889944, -1.846134, 0, 0, 0, 1, 1,
-1.682114, 1.52911, -1.445305, 1, 1, 1, 1, 1,
-1.65767, -0.9126952, -1.559123, 1, 1, 1, 1, 1,
-1.654723, -0.8810671, -1.591587, 1, 1, 1, 1, 1,
-1.651859, -0.829199, -3.146837, 1, 1, 1, 1, 1,
-1.633315, -0.2630686, -1.620954, 1, 1, 1, 1, 1,
-1.625465, 0.5457584, -1.425088, 1, 1, 1, 1, 1,
-1.594619, -2.171561, -1.500259, 1, 1, 1, 1, 1,
-1.583246, -0.1080666, -1.618303, 1, 1, 1, 1, 1,
-1.578938, 0.1056699, -1.97949, 1, 1, 1, 1, 1,
-1.578382, 0.4279514, -1.381978, 1, 1, 1, 1, 1,
-1.57436, 0.9474144, 0.6938482, 1, 1, 1, 1, 1,
-1.570649, -0.05634258, -0.3482477, 1, 1, 1, 1, 1,
-1.544301, -0.5343772, -2.390634, 1, 1, 1, 1, 1,
-1.542638, -0.7720308, -2.640957, 1, 1, 1, 1, 1,
-1.541951, -1.624588, -2.387112, 1, 1, 1, 1, 1,
-1.541909, -0.1539131, -2.329412, 0, 0, 1, 1, 1,
-1.532279, -0.2645523, -2.969456, 1, 0, 0, 1, 1,
-1.521299, -0.9629744, -2.047956, 1, 0, 0, 1, 1,
-1.516678, 0.4842909, -1.024137, 1, 0, 0, 1, 1,
-1.516302, -1.622748, -1.054562, 1, 0, 0, 1, 1,
-1.515718, 1.439494, -1.53172, 1, 0, 0, 1, 1,
-1.510281, -0.9519413, -2.102946, 0, 0, 0, 1, 1,
-1.508042, 0.4335801, 0.3950323, 0, 0, 0, 1, 1,
-1.49884, -0.360655, -1.987702, 0, 0, 0, 1, 1,
-1.495334, -0.8117663, -1.918705, 0, 0, 0, 1, 1,
-1.495112, 1.556119, -0.7141232, 0, 0, 0, 1, 1,
-1.470737, -0.9213481, -2.730231, 0, 0, 0, 1, 1,
-1.467874, -0.1670033, -1.988244, 0, 0, 0, 1, 1,
-1.445004, -0.7593457, -2.400821, 1, 1, 1, 1, 1,
-1.444239, 1.128148, -1.379178, 1, 1, 1, 1, 1,
-1.426532, -0.001951497, -2.517822, 1, 1, 1, 1, 1,
-1.417036, 0.7783698, -0.8813338, 1, 1, 1, 1, 1,
-1.415465, 0.3917225, -1.750144, 1, 1, 1, 1, 1,
-1.413822, 0.2089424, 0.4223244, 1, 1, 1, 1, 1,
-1.403399, 0.1744134, 0.5249575, 1, 1, 1, 1, 1,
-1.399856, 0.9900524, -0.8701358, 1, 1, 1, 1, 1,
-1.396426, 1.03991, -1.59207, 1, 1, 1, 1, 1,
-1.392316, -1.488027, -2.890743, 1, 1, 1, 1, 1,
-1.387592, 0.9902648, -0.3237504, 1, 1, 1, 1, 1,
-1.382434, 0.9089121, -2.344828, 1, 1, 1, 1, 1,
-1.378567, -1.272479, -2.59157, 1, 1, 1, 1, 1,
-1.369424, -1.901882, -0.4479688, 1, 1, 1, 1, 1,
-1.36812, -1.134586, -3.610897, 1, 1, 1, 1, 1,
-1.353702, -0.09169175, -1.490968, 0, 0, 1, 1, 1,
-1.351723, 0.9541474, -0.1631732, 1, 0, 0, 1, 1,
-1.345883, 0.3413818, -0.3346495, 1, 0, 0, 1, 1,
-1.345161, -0.2780266, -0.5485882, 1, 0, 0, 1, 1,
-1.340397, 1.468969, 0.9505767, 1, 0, 0, 1, 1,
-1.337921, 1.006312, -0.2488225, 1, 0, 0, 1, 1,
-1.314585, 0.4622292, -0.6948265, 0, 0, 0, 1, 1,
-1.305097, -1.119309, -1.700605, 0, 0, 0, 1, 1,
-1.300344, -0.3281971, -1.585307, 0, 0, 0, 1, 1,
-1.299921, -1.180862, -3.573169, 0, 0, 0, 1, 1,
-1.29922, -0.005767366, -3.170157, 0, 0, 0, 1, 1,
-1.297587, -0.04732061, -0.1638654, 0, 0, 0, 1, 1,
-1.297339, 0.4062434, -0.1933438, 0, 0, 0, 1, 1,
-1.296705, -0.4999047, -2.07694, 1, 1, 1, 1, 1,
-1.293281, 0.7803385, -0.4598451, 1, 1, 1, 1, 1,
-1.292263, -1.179867, -0.6176256, 1, 1, 1, 1, 1,
-1.289585, 1.313428, -1.502664, 1, 1, 1, 1, 1,
-1.280219, -0.3640665, -1.235035, 1, 1, 1, 1, 1,
-1.273477, 0.08864792, -2.062821, 1, 1, 1, 1, 1,
-1.271056, -1.281749, -0.5288432, 1, 1, 1, 1, 1,
-1.268331, -0.7933736, -1.359977, 1, 1, 1, 1, 1,
-1.264571, 0.814593, -1.608233, 1, 1, 1, 1, 1,
-1.263547, 0.02442759, -1.900636, 1, 1, 1, 1, 1,
-1.253581, 1.050369, -2.191478, 1, 1, 1, 1, 1,
-1.251879, -2.104383, -1.685003, 1, 1, 1, 1, 1,
-1.25105, -0.4692012, -2.776402, 1, 1, 1, 1, 1,
-1.243811, 0.2824202, -1.807208, 1, 1, 1, 1, 1,
-1.238677, 0.3114601, -0.2659292, 1, 1, 1, 1, 1,
-1.235159, -0.05954902, -2.479278, 0, 0, 1, 1, 1,
-1.229201, -0.05661602, -2.187932, 1, 0, 0, 1, 1,
-1.228078, 1.151152, -2.023505, 1, 0, 0, 1, 1,
-1.215705, 0.05400554, 0.6577355, 1, 0, 0, 1, 1,
-1.214352, 0.7386652, -2.888692, 1, 0, 0, 1, 1,
-1.212114, 1.752139, -0.116558, 1, 0, 0, 1, 1,
-1.201373, 2.122765, -1.200353, 0, 0, 0, 1, 1,
-1.196154, 0.7068527, -2.379686, 0, 0, 0, 1, 1,
-1.189829, -0.1484358, -0.7780449, 0, 0, 0, 1, 1,
-1.180999, 1.875657, -0.4095322, 0, 0, 0, 1, 1,
-1.168943, 0.981185, -1.942654, 0, 0, 0, 1, 1,
-1.168571, -0.8030472, -1.111183, 0, 0, 0, 1, 1,
-1.167826, -0.02950348, -0.4367074, 0, 0, 0, 1, 1,
-1.162606, -1.137447, -2.749978, 1, 1, 1, 1, 1,
-1.1585, -0.9057928, -3.297953, 1, 1, 1, 1, 1,
-1.15697, -0.7765986, -2.897866, 1, 1, 1, 1, 1,
-1.155494, 2.588703, -0.7110662, 1, 1, 1, 1, 1,
-1.154867, 0.1698558, -1.044663, 1, 1, 1, 1, 1,
-1.152815, 1.54299, -0.5814121, 1, 1, 1, 1, 1,
-1.150578, -1.081364, -0.548812, 1, 1, 1, 1, 1,
-1.145211, 0.236991, -1.011302, 1, 1, 1, 1, 1,
-1.142291, 0.4327902, -1.658154, 1, 1, 1, 1, 1,
-1.139844, 0.05313508, -0.5275474, 1, 1, 1, 1, 1,
-1.137683, -0.2707682, -2.793979, 1, 1, 1, 1, 1,
-1.117973, -0.4667881, -2.171582, 1, 1, 1, 1, 1,
-1.113896, -1.579488, -3.577271, 1, 1, 1, 1, 1,
-1.106044, -1.163653, -2.400103, 1, 1, 1, 1, 1,
-1.10416, -2.003092, -2.571412, 1, 1, 1, 1, 1,
-1.103368, 1.231903, 0.03435564, 0, 0, 1, 1, 1,
-1.103009, -1.573799, -2.391264, 1, 0, 0, 1, 1,
-1.102205, -0.747619, -2.955529, 1, 0, 0, 1, 1,
-1.098794, 0.04004434, -0.7670949, 1, 0, 0, 1, 1,
-1.089164, -1.122012, -2.611469, 1, 0, 0, 1, 1,
-1.055574, 0.6636606, -2.330281, 1, 0, 0, 1, 1,
-1.053775, 0.03452976, -2.67373, 0, 0, 0, 1, 1,
-1.046689, -0.3406471, -3.303036, 0, 0, 0, 1, 1,
-1.042573, 1.431391, -1.026149, 0, 0, 0, 1, 1,
-1.025996, -0.4608634, -2.643023, 0, 0, 0, 1, 1,
-1.019629, -2.574277, -3.94199, 0, 0, 0, 1, 1,
-1.014177, -0.1232758, -2.867641, 0, 0, 0, 1, 1,
-1.010789, -0.5693879, -1.383203, 0, 0, 0, 1, 1,
-1.002201, 0.4007377, -0.08795889, 1, 1, 1, 1, 1,
-0.9913274, 1.782981, -1.315173, 1, 1, 1, 1, 1,
-0.9758865, -0.2029723, -2.608785, 1, 1, 1, 1, 1,
-0.9719246, -0.149, 0.7366737, 1, 1, 1, 1, 1,
-0.9671281, -1.723317, -1.084918, 1, 1, 1, 1, 1,
-0.9653373, -1.009704, -1.98077, 1, 1, 1, 1, 1,
-0.9647756, -1.095778, -2.390449, 1, 1, 1, 1, 1,
-0.9642377, -0.7132598, -2.849946, 1, 1, 1, 1, 1,
-0.9629663, -0.5504997, -2.192433, 1, 1, 1, 1, 1,
-0.9553156, 0.2112875, -1.12073, 1, 1, 1, 1, 1,
-0.9527259, -0.2520581, -1.063471, 1, 1, 1, 1, 1,
-0.9456704, 1.461593, 0.4499997, 1, 1, 1, 1, 1,
-0.9410349, -1.17132, -2.417145, 1, 1, 1, 1, 1,
-0.9407987, -0.36904, -3.429586, 1, 1, 1, 1, 1,
-0.9405317, 0.1307834, -1.644362, 1, 1, 1, 1, 1,
-0.9384982, -0.9499027, -2.28121, 0, 0, 1, 1, 1,
-0.9370785, 0.4862415, -1.916905, 1, 0, 0, 1, 1,
-0.9346749, 0.8419456, -1.817013, 1, 0, 0, 1, 1,
-0.934349, 1.082354, -2.826516, 1, 0, 0, 1, 1,
-0.932, 1.445353, 0.1208079, 1, 0, 0, 1, 1,
-0.9297424, -0.7099568, -2.75659, 1, 0, 0, 1, 1,
-0.9197505, 1.77455, -0.2624288, 0, 0, 0, 1, 1,
-0.90981, 0.08201669, -1.079396, 0, 0, 0, 1, 1,
-0.9036304, -0.2797725, -1.519054, 0, 0, 0, 1, 1,
-0.9025037, -0.3126346, 0.04756951, 0, 0, 0, 1, 1,
-0.9015725, -0.7309249, -1.90482, 0, 0, 0, 1, 1,
-0.8997124, 0.7644445, -0.9464887, 0, 0, 0, 1, 1,
-0.8979587, 1.230099, -0.5468526, 0, 0, 0, 1, 1,
-0.89507, 0.1629735, -1.072008, 1, 1, 1, 1, 1,
-0.8945999, -0.9277503, -1.580874, 1, 1, 1, 1, 1,
-0.8856378, -0.7604812, -0.6208834, 1, 1, 1, 1, 1,
-0.8852879, 1.856694, -1.157509, 1, 1, 1, 1, 1,
-0.8842436, -0.01487169, -0.5836383, 1, 1, 1, 1, 1,
-0.8835277, 1.07969, -1.624567, 1, 1, 1, 1, 1,
-0.8739068, -0.4410837, 0.4212255, 1, 1, 1, 1, 1,
-0.8597342, 0.2564529, -1.187047, 1, 1, 1, 1, 1,
-0.8586078, 1.001348, -0.08060496, 1, 1, 1, 1, 1,
-0.8553792, 0.6335378, 0.3630887, 1, 1, 1, 1, 1,
-0.8530679, 0.1854292, -2.196685, 1, 1, 1, 1, 1,
-0.8459376, 0.6569524, -1.031393, 1, 1, 1, 1, 1,
-0.8455434, -0.1320561, -2.500337, 1, 1, 1, 1, 1,
-0.8444516, -1.724825, -1.85701, 1, 1, 1, 1, 1,
-0.8408751, 0.7616085, -0.5993503, 1, 1, 1, 1, 1,
-0.8370323, 1.211192, 0.00523377, 0, 0, 1, 1, 1,
-0.8297059, 0.7705844, -0.5424363, 1, 0, 0, 1, 1,
-0.8278421, -0.0159744, -3.578286, 1, 0, 0, 1, 1,
-0.8268683, -0.6075558, -1.949991, 1, 0, 0, 1, 1,
-0.8220023, 0.9640058, -1.130329, 1, 0, 0, 1, 1,
-0.8188297, -0.3157013, -0.6376832, 1, 0, 0, 1, 1,
-0.811091, 0.252611, -2.052841, 0, 0, 0, 1, 1,
-0.8014904, -0.5024551, -3.393886, 0, 0, 0, 1, 1,
-0.7783278, 0.1483147, 1.003944, 0, 0, 0, 1, 1,
-0.7746242, 0.5028783, -0.4878115, 0, 0, 0, 1, 1,
-0.7734654, 0.345029, -2.344716, 0, 0, 0, 1, 1,
-0.770483, 1.435482, 1.207348, 0, 0, 0, 1, 1,
-0.7670029, -0.6045237, -3.095293, 0, 0, 0, 1, 1,
-0.7660643, -0.1960698, -0.1037103, 1, 1, 1, 1, 1,
-0.7648748, -0.3306677, -1.645599, 1, 1, 1, 1, 1,
-0.7590588, 0.2310041, -1.04624, 1, 1, 1, 1, 1,
-0.7562014, -0.5977846, -3.275963, 1, 1, 1, 1, 1,
-0.7510753, 0.3343783, -2.448598, 1, 1, 1, 1, 1,
-0.7482008, 1.116329, -0.7271488, 1, 1, 1, 1, 1,
-0.7448666, 0.4415208, -2.002595, 1, 1, 1, 1, 1,
-0.7401661, 0.9797604, 0.5469993, 1, 1, 1, 1, 1,
-0.7395371, 1.175289, 0.7262131, 1, 1, 1, 1, 1,
-0.7380372, 0.7548145, 0.1223922, 1, 1, 1, 1, 1,
-0.7243186, -0.6660311, -2.401485, 1, 1, 1, 1, 1,
-0.721532, 0.1604014, -2.381929, 1, 1, 1, 1, 1,
-0.7166566, 1.641842, 0.9156244, 1, 1, 1, 1, 1,
-0.7155143, -2.100782, -1.655016, 1, 1, 1, 1, 1,
-0.7134595, 0.3515636, -2.866292, 1, 1, 1, 1, 1,
-0.7108473, 0.6776134, -0.556999, 0, 0, 1, 1, 1,
-0.7070709, -1.016424, -1.92598, 1, 0, 0, 1, 1,
-0.7019102, -2.07886, -3.386624, 1, 0, 0, 1, 1,
-0.696237, -0.1794003, -1.536616, 1, 0, 0, 1, 1,
-0.6935602, 0.9221221, -0.3499838, 1, 0, 0, 1, 1,
-0.6884605, 0.1184397, -0.2146169, 1, 0, 0, 1, 1,
-0.6865172, 0.6649127, -0.5713475, 0, 0, 0, 1, 1,
-0.6802315, 0.0953206, -0.9380985, 0, 0, 0, 1, 1,
-0.6787164, 0.1873321, -1.716622, 0, 0, 0, 1, 1,
-0.6740303, -1.587023, -3.961178, 0, 0, 0, 1, 1,
-0.670437, -0.01259792, -1.763765, 0, 0, 0, 1, 1,
-0.6672246, -0.06682931, -1.53162, 0, 0, 0, 1, 1,
-0.6657336, 0.2358353, -0.6866418, 0, 0, 0, 1, 1,
-0.665644, -0.8750498, -2.29171, 1, 1, 1, 1, 1,
-0.6636261, 1.035804, -0.5203779, 1, 1, 1, 1, 1,
-0.6624818, 2.164783, -1.604256, 1, 1, 1, 1, 1,
-0.6600955, -0.436937, -1.220516, 1, 1, 1, 1, 1,
-0.6565542, -0.8926039, -3.468494, 1, 1, 1, 1, 1,
-0.6460538, -1.008236, -1.741409, 1, 1, 1, 1, 1,
-0.645296, 0.2109622, -1.567762, 1, 1, 1, 1, 1,
-0.6439189, 1.013675, 0.8874744, 1, 1, 1, 1, 1,
-0.6409248, -0.5812651, -1.223527, 1, 1, 1, 1, 1,
-0.6350107, 0.3069989, 0.2333354, 1, 1, 1, 1, 1,
-0.6343335, 0.9807905, 0.3404083, 1, 1, 1, 1, 1,
-0.6322421, -0.9753344, -2.786195, 1, 1, 1, 1, 1,
-0.6207616, 0.3461858, -0.8015991, 1, 1, 1, 1, 1,
-0.6198555, 0.7052264, 0.08626887, 1, 1, 1, 1, 1,
-0.6114383, -1.02758, -2.374732, 1, 1, 1, 1, 1,
-0.611326, -0.4539763, -3.089231, 0, 0, 1, 1, 1,
-0.6095591, 0.2413222, -1.675126, 1, 0, 0, 1, 1,
-0.6086394, 0.3193944, -0.2697842, 1, 0, 0, 1, 1,
-0.6042015, 0.382011, -1.489036, 1, 0, 0, 1, 1,
-0.6039055, -0.2030897, -0.4399682, 1, 0, 0, 1, 1,
-0.6020539, -1.097462, -1.614644, 1, 0, 0, 1, 1,
-0.5993816, 1.047795, -1.492504, 0, 0, 0, 1, 1,
-0.5932378, 0.6126364, -1.535185, 0, 0, 0, 1, 1,
-0.5921497, 0.3313608, 0.05590687, 0, 0, 0, 1, 1,
-0.590049, 0.01843579, -1.101585, 0, 0, 0, 1, 1,
-0.5893647, -1.216781, -3.119555, 0, 0, 0, 1, 1,
-0.5889149, -0.3267474, -1.125366, 0, 0, 0, 1, 1,
-0.586706, 0.7705794, -2.057172, 0, 0, 0, 1, 1,
-0.5805448, 1.233351, -0.2072354, 1, 1, 1, 1, 1,
-0.572184, -0.4359557, -3.822995, 1, 1, 1, 1, 1,
-0.5720719, 0.582912, -1.187902, 1, 1, 1, 1, 1,
-0.5718071, 0.5275159, -1.001874, 1, 1, 1, 1, 1,
-0.5688813, -0.03345219, -0.8666099, 1, 1, 1, 1, 1,
-0.5647111, 0.870934, -1.455894, 1, 1, 1, 1, 1,
-0.564545, -0.8525269, -2.684122, 1, 1, 1, 1, 1,
-0.5570967, 0.4657064, -1.609219, 1, 1, 1, 1, 1,
-0.551861, 0.5658311, 0.1363634, 1, 1, 1, 1, 1,
-0.5512949, 1.092029, -1.438863, 1, 1, 1, 1, 1,
-0.5512846, -0.1034729, -1.812595, 1, 1, 1, 1, 1,
-0.5512814, -0.2841601, -1.9795, 1, 1, 1, 1, 1,
-0.5497693, 1.424265, 0.09061286, 1, 1, 1, 1, 1,
-0.5480915, 1.968074, 0.1569985, 1, 1, 1, 1, 1,
-0.5473931, -0.8013333, -2.901036, 1, 1, 1, 1, 1,
-0.547316, 0.09633711, -1.741831, 0, 0, 1, 1, 1,
-0.5461536, -0.5604727, -2.553375, 1, 0, 0, 1, 1,
-0.5412635, 0.1314271, -2.024055, 1, 0, 0, 1, 1,
-0.5344112, -1.352234, -4.25097, 1, 0, 0, 1, 1,
-0.5333109, 1.502109, -2.10693, 1, 0, 0, 1, 1,
-0.5294706, 0.7291144, -1.741294, 1, 0, 0, 1, 1,
-0.5294368, -0.8099518, -1.448046, 0, 0, 0, 1, 1,
-0.5282749, -1.192734, -3.338255, 0, 0, 0, 1, 1,
-0.5258182, -1.30437, -1.447505, 0, 0, 0, 1, 1,
-0.5247539, 0.4330571, 1.230571, 0, 0, 0, 1, 1,
-0.5240186, 0.1475759, -1.563229, 0, 0, 0, 1, 1,
-0.5193215, -0.7034064, -1.629272, 0, 0, 0, 1, 1,
-0.5172085, -1.081977, -1.314489, 0, 0, 0, 1, 1,
-0.5080992, 1.480228, -0.8636184, 1, 1, 1, 1, 1,
-0.5023053, -1.215657, -1.42461, 1, 1, 1, 1, 1,
-0.495807, 0.8612703, -0.5881526, 1, 1, 1, 1, 1,
-0.4930624, -1.624669, -2.969587, 1, 1, 1, 1, 1,
-0.4925378, -0.06706433, -2.518885, 1, 1, 1, 1, 1,
-0.4908781, 0.6637727, 0.1810541, 1, 1, 1, 1, 1,
-0.4908383, 0.3066809, -0.8874055, 1, 1, 1, 1, 1,
-0.4871703, 1.130246, 1.801259, 1, 1, 1, 1, 1,
-0.4860907, 0.6189186, 0.6328822, 1, 1, 1, 1, 1,
-0.4857014, -0.5971172, -2.709156, 1, 1, 1, 1, 1,
-0.4808823, -1.656951, -3.843653, 1, 1, 1, 1, 1,
-0.4736898, 1.748511, -2.335282, 1, 1, 1, 1, 1,
-0.4703932, -0.2716025, -2.614305, 1, 1, 1, 1, 1,
-0.4693574, 0.9276828, 0.6372294, 1, 1, 1, 1, 1,
-0.4676354, 0.358216, -0.7434539, 1, 1, 1, 1, 1,
-0.4673456, -0.7888397, -4.51655, 0, 0, 1, 1, 1,
-0.4664759, -0.3103518, -3.560622, 1, 0, 0, 1, 1,
-0.4657003, -1.78957, -2.486736, 1, 0, 0, 1, 1,
-0.4623007, -0.7823262, -2.146233, 1, 0, 0, 1, 1,
-0.4537134, -1.58038, -1.787562, 1, 0, 0, 1, 1,
-0.4508029, 0.5956494, 1.209853, 1, 0, 0, 1, 1,
-0.439719, 0.3878503, -0.3143848, 0, 0, 0, 1, 1,
-0.4388576, 0.347695, -0.7694006, 0, 0, 0, 1, 1,
-0.4380843, 0.6180442, 1.62968, 0, 0, 0, 1, 1,
-0.4370975, -1.252136, -3.749337, 0, 0, 0, 1, 1,
-0.4362143, 0.01583269, -1.70577, 0, 0, 0, 1, 1,
-0.4331759, 0.1306056, -2.591016, 0, 0, 0, 1, 1,
-0.4225016, -0.1780424, -2.697159, 0, 0, 0, 1, 1,
-0.4164765, 0.2788305, 0.07673866, 1, 1, 1, 1, 1,
-0.4137203, 0.7134393, -0.05769851, 1, 1, 1, 1, 1,
-0.4082825, 0.06295114, -1.065638, 1, 1, 1, 1, 1,
-0.403241, 0.8670964, 0.6222997, 1, 1, 1, 1, 1,
-0.3970819, -0.3159762, -3.692985, 1, 1, 1, 1, 1,
-0.3961619, 0.1987351, 0.5873809, 1, 1, 1, 1, 1,
-0.3944573, -0.3304988, -1.70831, 1, 1, 1, 1, 1,
-0.3829617, -0.4278167, -1.896624, 1, 1, 1, 1, 1,
-0.3792733, -0.557813, -3.908601, 1, 1, 1, 1, 1,
-0.3759941, 2.742572, 0.342541, 1, 1, 1, 1, 1,
-0.3757744, 1.041487, 1.114592, 1, 1, 1, 1, 1,
-0.3744425, 1.488865, -0.9132463, 1, 1, 1, 1, 1,
-0.3721158, -1.095746, -2.789517, 1, 1, 1, 1, 1,
-0.3661786, -0.8370132, -1.808663, 1, 1, 1, 1, 1,
-0.365758, 0.3562074, 0.3783926, 1, 1, 1, 1, 1,
-0.3650982, 0.1490018, -0.7230769, 0, 0, 1, 1, 1,
-0.3640331, 0.5961567, -0.4688238, 1, 0, 0, 1, 1,
-0.3624499, -1.412361, -3.518109, 1, 0, 0, 1, 1,
-0.362317, 0.8483955, 0.06162103, 1, 0, 0, 1, 1,
-0.3605522, -1.531279, -3.030932, 1, 0, 0, 1, 1,
-0.3599484, 0.7370002, 0.9535116, 1, 0, 0, 1, 1,
-0.3587824, 0.2387436, -2.172528, 0, 0, 0, 1, 1,
-0.3564383, -2.102648, -3.708266, 0, 0, 0, 1, 1,
-0.3537305, 1.088786, -0.9671886, 0, 0, 0, 1, 1,
-0.3496623, -0.7393025, -3.405865, 0, 0, 0, 1, 1,
-0.349501, -0.08702242, -2.618826, 0, 0, 0, 1, 1,
-0.3482953, 0.1602998, -0.5352351, 0, 0, 0, 1, 1,
-0.3460537, 0.3458255, -2.864427, 0, 0, 0, 1, 1,
-0.3436533, -0.4710731, -2.399065, 1, 1, 1, 1, 1,
-0.3358551, -1.004156, -3.591619, 1, 1, 1, 1, 1,
-0.3339664, 1.604644, 0.03165274, 1, 1, 1, 1, 1,
-0.3292739, -0.6785606, -1.663875, 1, 1, 1, 1, 1,
-0.3276665, 1.698072, -0.8780814, 1, 1, 1, 1, 1,
-0.3270682, 1.033577, 0.4962864, 1, 1, 1, 1, 1,
-0.3241129, -0.761627, -2.707559, 1, 1, 1, 1, 1,
-0.3193732, 0.6315117, -1.66665, 1, 1, 1, 1, 1,
-0.3172066, 1.219742, -1.28887, 1, 1, 1, 1, 1,
-0.3171303, 2.516392, -1.044704, 1, 1, 1, 1, 1,
-0.316643, 0.3673642, -0.6475376, 1, 1, 1, 1, 1,
-0.315612, 0.3862422, 1.287932, 1, 1, 1, 1, 1,
-0.3155341, -0.4639411, -3.121624, 1, 1, 1, 1, 1,
-0.3122747, -0.00854234, -1.499625, 1, 1, 1, 1, 1,
-0.3072892, -1.194688, -2.476286, 1, 1, 1, 1, 1,
-0.299753, 0.7056907, -0.8162436, 0, 0, 1, 1, 1,
-0.2979621, 1.683282, 0.9463276, 1, 0, 0, 1, 1,
-0.2963076, -0.3915929, -3.02602, 1, 0, 0, 1, 1,
-0.2959765, -0.2613992, -1.781872, 1, 0, 0, 1, 1,
-0.2958944, 1.266119, 1.011507, 1, 0, 0, 1, 1,
-0.2953581, 1.235521, 0.002140613, 1, 0, 0, 1, 1,
-0.2873484, -0.7461418, -4.44707, 0, 0, 0, 1, 1,
-0.281884, -0.3337902, -4.880524, 0, 0, 0, 1, 1,
-0.2787766, 0.1383663, -1.704698, 0, 0, 0, 1, 1,
-0.276021, -1.071036, -3.704358, 0, 0, 0, 1, 1,
-0.2723323, 0.1940027, 0.4964678, 0, 0, 0, 1, 1,
-0.2718964, 1.28505, 2.006546, 0, 0, 0, 1, 1,
-0.268471, -0.3284232, -2.345659, 0, 0, 0, 1, 1,
-0.2673807, -0.6985425, -2.626446, 1, 1, 1, 1, 1,
-0.2606514, 1.332551, 0.4184313, 1, 1, 1, 1, 1,
-0.259377, 0.6914487, 0.7128485, 1, 1, 1, 1, 1,
-0.2577749, 1.568946, -0.7304488, 1, 1, 1, 1, 1,
-0.2531712, -0.06304341, -1.822314, 1, 1, 1, 1, 1,
-0.2528465, -0.8772447, -2.495996, 1, 1, 1, 1, 1,
-0.2525281, -1.600571, -4.046, 1, 1, 1, 1, 1,
-0.2484754, 0.9127036, -0.4233801, 1, 1, 1, 1, 1,
-0.2483764, 0.9563025, 0.9168984, 1, 1, 1, 1, 1,
-0.2462675, -0.6300721, -1.925169, 1, 1, 1, 1, 1,
-0.2419176, -0.3159653, -2.892213, 1, 1, 1, 1, 1,
-0.240972, 0.6153478, -1.975718, 1, 1, 1, 1, 1,
-0.2385529, -0.6852132, -3.700541, 1, 1, 1, 1, 1,
-0.2351828, -0.4009077, -1.589038, 1, 1, 1, 1, 1,
-0.2351523, -0.1268462, -2.474917, 1, 1, 1, 1, 1,
-0.2350035, -1.102197, -0.6740651, 0, 0, 1, 1, 1,
-0.2297709, -3.487079, -2.077248, 1, 0, 0, 1, 1,
-0.2281352, 0.33907, 0.9261643, 1, 0, 0, 1, 1,
-0.2276812, 0.0686445, -1.726791, 1, 0, 0, 1, 1,
-0.2233926, 1.240281, 0.2966666, 1, 0, 0, 1, 1,
-0.2221842, 0.4124479, 1.215848, 1, 0, 0, 1, 1,
-0.2205231, -0.06991524, -2.259295, 0, 0, 0, 1, 1,
-0.2202589, -0.114986, -4.610168, 0, 0, 0, 1, 1,
-0.2165416, 0.3403722, -0.8978096, 0, 0, 0, 1, 1,
-0.2158498, 1.936066, -1.858474, 0, 0, 0, 1, 1,
-0.2130858, 0.3429033, -0.3454307, 0, 0, 0, 1, 1,
-0.2091765, 2.481019, -0.6403865, 0, 0, 0, 1, 1,
-0.2076946, 0.2770697, -2.550593, 0, 0, 0, 1, 1,
-0.2064717, -0.3746632, -2.222085, 1, 1, 1, 1, 1,
-0.2056544, 0.8575474, 0.5276498, 1, 1, 1, 1, 1,
-0.2056071, -0.4921524, -2.689338, 1, 1, 1, 1, 1,
-0.199899, -0.8850188, -1.295439, 1, 1, 1, 1, 1,
-0.1969006, -0.307308, -2.821313, 1, 1, 1, 1, 1,
-0.1948167, -0.1408206, -3.95998, 1, 1, 1, 1, 1,
-0.1908407, -1.42832, -2.57616, 1, 1, 1, 1, 1,
-0.1899918, -1.583097, -3.786374, 1, 1, 1, 1, 1,
-0.1893239, 1.311554, -0.47437, 1, 1, 1, 1, 1,
-0.1889749, 0.5192913, -1.369763, 1, 1, 1, 1, 1,
-0.1882034, -0.6565408, -3.876632, 1, 1, 1, 1, 1,
-0.1853184, 2.477338, -1.405905, 1, 1, 1, 1, 1,
-0.1852754, 1.421605, -0.07075419, 1, 1, 1, 1, 1,
-0.1837547, 0.8956341, -0.1563923, 1, 1, 1, 1, 1,
-0.179539, 0.8861052, -0.05352274, 1, 1, 1, 1, 1,
-0.1788437, 0.6735137, 2.0551, 0, 0, 1, 1, 1,
-0.175875, -1.040119, -2.609611, 1, 0, 0, 1, 1,
-0.1750319, -1.020561, -3.37978, 1, 0, 0, 1, 1,
-0.1749611, -1.314851, -2.926791, 1, 0, 0, 1, 1,
-0.1731535, -0.1444252, -2.62435, 1, 0, 0, 1, 1,
-0.1715288, -0.2649837, -1.732997, 1, 0, 0, 1, 1,
-0.1699672, -0.08070973, -1.371566, 0, 0, 0, 1, 1,
-0.1637809, 0.008042302, -2.735473, 0, 0, 0, 1, 1,
-0.1604752, -0.8742571, -2.418984, 0, 0, 0, 1, 1,
-0.1581022, 0.7013189, 0.05660661, 0, 0, 0, 1, 1,
-0.1564872, -0.4891859, -2.052311, 0, 0, 0, 1, 1,
-0.1552299, -0.4826904, -3.332498, 0, 0, 0, 1, 1,
-0.1551856, 0.7285531, 1.502263, 0, 0, 0, 1, 1,
-0.1519706, 0.112217, 0.05044628, 1, 1, 1, 1, 1,
-0.148127, -2.24586, -2.147239, 1, 1, 1, 1, 1,
-0.1459991, -0.4730222, -3.487451, 1, 1, 1, 1, 1,
-0.1458187, 0.6471353, 0.9358672, 1, 1, 1, 1, 1,
-0.1423718, -0.4982702, -1.550174, 1, 1, 1, 1, 1,
-0.1420918, 0.02379514, -0.5299493, 1, 1, 1, 1, 1,
-0.1399253, 0.4418679, -1.223051, 1, 1, 1, 1, 1,
-0.1353658, -0.5591947, -3.213838, 1, 1, 1, 1, 1,
-0.134385, -2.037177, -3.335499, 1, 1, 1, 1, 1,
-0.1315229, 0.9917279, 0.129324, 1, 1, 1, 1, 1,
-0.1302079, 0.4681813, 0.1116163, 1, 1, 1, 1, 1,
-0.1248367, 0.2690782, 0.3885022, 1, 1, 1, 1, 1,
-0.1218313, 0.2824596, -0.9654235, 1, 1, 1, 1, 1,
-0.1214814, -0.2767215, -1.349501, 1, 1, 1, 1, 1,
-0.120403, 0.5648136, -0.8437762, 1, 1, 1, 1, 1,
-0.1200183, 1.742448, 0.01532877, 0, 0, 1, 1, 1,
-0.1198684, -1.467045, -2.600249, 1, 0, 0, 1, 1,
-0.1194974, 1.255682, -1.214068, 1, 0, 0, 1, 1,
-0.1177227, 0.4627945, 1.011636, 1, 0, 0, 1, 1,
-0.1172559, -0.6082985, -3.313013, 1, 0, 0, 1, 1,
-0.1107538, 0.3151986, -0.3475947, 1, 0, 0, 1, 1,
-0.1083715, -0.2767709, -3.479857, 0, 0, 0, 1, 1,
-0.1076164, -0.08715139, -1.648718, 0, 0, 0, 1, 1,
-0.1075113, 0.9193113, -0.5862817, 0, 0, 0, 1, 1,
-0.1068778, -0.8270167, -3.955724, 0, 0, 0, 1, 1,
-0.1037643, 0.02679113, -1.657216, 0, 0, 0, 1, 1,
-0.1018304, -0.1060982, -1.727752, 0, 0, 0, 1, 1,
-0.1015843, 0.876325, -0.7810111, 0, 0, 0, 1, 1,
-0.09964562, -0.0516191, -0.8834315, 1, 1, 1, 1, 1,
-0.09577088, 0.6469566, -0.9680383, 1, 1, 1, 1, 1,
-0.09254324, -2.217857, -3.358379, 1, 1, 1, 1, 1,
-0.08901437, -1.686568, -3.603301, 1, 1, 1, 1, 1,
-0.08524726, -1.196605, -2.864906, 1, 1, 1, 1, 1,
-0.07799987, 0.3965017, -1.468628, 1, 1, 1, 1, 1,
-0.07681586, 1.629755, -1.418121, 1, 1, 1, 1, 1,
-0.07621729, 0.5328935, -1.021281, 1, 1, 1, 1, 1,
-0.07498054, 1.347009, -0.212816, 1, 1, 1, 1, 1,
-0.07301562, 1.431512, -0.02237964, 1, 1, 1, 1, 1,
-0.07128324, -0.6508214, -3.675243, 1, 1, 1, 1, 1,
-0.06573364, 0.09635296, 0.2537396, 1, 1, 1, 1, 1,
-0.05864511, -1.302536, -3.906596, 1, 1, 1, 1, 1,
-0.05844949, -1.660388, -1.414994, 1, 1, 1, 1, 1,
-0.05620218, 1.077465, -0.3692105, 1, 1, 1, 1, 1,
-0.05528023, 0.6896512, -0.4505028, 0, 0, 1, 1, 1,
-0.05341443, -0.1137403, -3.200492, 1, 0, 0, 1, 1,
-0.04688542, -1.108543, -1.752066, 1, 0, 0, 1, 1,
-0.04516144, 1.209391, -1.742618, 1, 0, 0, 1, 1,
-0.04248252, 2.853235, -0.1386019, 1, 0, 0, 1, 1,
-0.03913717, -0.6859087, -2.786326, 1, 0, 0, 1, 1,
-0.03818975, 1.489073, -1.21632, 0, 0, 0, 1, 1,
-0.03812318, -0.9881383, -4.055601, 0, 0, 0, 1, 1,
-0.03615227, 0.3398903, -0.1390696, 0, 0, 0, 1, 1,
-0.0356715, -0.9677029, -4.622026, 0, 0, 0, 1, 1,
-0.02957308, 1.346177, -0.3732542, 0, 0, 0, 1, 1,
-0.02948572, 0.4370741, -1.233301, 0, 0, 0, 1, 1,
-0.02763927, -0.6656002, -3.608467, 0, 0, 0, 1, 1,
-0.02068476, -0.7121908, -3.586386, 1, 1, 1, 1, 1,
-0.01957181, 2.223886, -1.918387, 1, 1, 1, 1, 1,
-0.01626625, -1.253454, -2.602843, 1, 1, 1, 1, 1,
-0.01573987, -0.5004265, -1.494787, 1, 1, 1, 1, 1,
-0.01410679, -0.4719914, -1.081625, 1, 1, 1, 1, 1,
-0.01329536, 1.132858, -0.3020948, 1, 1, 1, 1, 1,
-0.01242483, -1.049812, -4.34932, 1, 1, 1, 1, 1,
-0.01117052, -0.7675794, -2.68459, 1, 1, 1, 1, 1,
-0.01027494, -0.3024241, -1.352119, 1, 1, 1, 1, 1,
-0.008007744, -1.040787, -2.643204, 1, 1, 1, 1, 1,
-0.006094908, 3.013458, -1.38963, 1, 1, 1, 1, 1,
-0.00527251, 0.4342485, 0.8022352, 1, 1, 1, 1, 1,
-0.003185161, -0.2508154, -3.595413, 1, 1, 1, 1, 1,
0.0007152371, 0.4145475, -0.2370577, 1, 1, 1, 1, 1,
0.001955624, 1.34766, -0.1819122, 1, 1, 1, 1, 1,
0.003394118, 0.6155282, 0.5273671, 0, 0, 1, 1, 1,
0.004408877, -0.06535771, 4.550198, 1, 0, 0, 1, 1,
0.005018104, -0.8803161, 2.124185, 1, 0, 0, 1, 1,
0.007795888, -0.2150109, 3.44342, 1, 0, 0, 1, 1,
0.009014448, -0.02525338, 4.147647, 1, 0, 0, 1, 1,
0.01933079, -0.1647918, 3.875767, 1, 0, 0, 1, 1,
0.02174282, 0.0118063, -0.1752548, 0, 0, 0, 1, 1,
0.0241657, 1.205577, -0.3624841, 0, 0, 0, 1, 1,
0.02509473, -0.9278916, 1.800971, 0, 0, 0, 1, 1,
0.02561887, -0.4066671, 1.775218, 0, 0, 0, 1, 1,
0.02726048, 1.996121, 0.812609, 0, 0, 0, 1, 1,
0.02958173, 1.54523, -0.5692748, 0, 0, 0, 1, 1,
0.03177204, 0.55715, 0.9485638, 0, 0, 0, 1, 1,
0.03272557, 0.02969763, 1.394696, 1, 1, 1, 1, 1,
0.03543387, 1.760217, 0.6442838, 1, 1, 1, 1, 1,
0.03703093, -0.7731326, 3.137776, 1, 1, 1, 1, 1,
0.03846126, -0.5506161, 3.231954, 1, 1, 1, 1, 1,
0.04918339, -0.1264247, 3.508239, 1, 1, 1, 1, 1,
0.05094555, -0.8811809, 4.198939, 1, 1, 1, 1, 1,
0.0517175, -1.178017, 2.462651, 1, 1, 1, 1, 1,
0.05387395, 0.07871453, 0.6792518, 1, 1, 1, 1, 1,
0.05612968, -0.2155703, 0.2486551, 1, 1, 1, 1, 1,
0.0604108, -0.931521, 3.342039, 1, 1, 1, 1, 1,
0.06215485, 1.59728, 1.140485, 1, 1, 1, 1, 1,
0.06277804, 0.623129, 0.3810224, 1, 1, 1, 1, 1,
0.06505103, 0.7598425, -0.01715265, 1, 1, 1, 1, 1,
0.06697894, 1.533729, 1.698959, 1, 1, 1, 1, 1,
0.06728046, -1.727371, 2.996822, 1, 1, 1, 1, 1,
0.0708415, 0.6057308, 1.926508, 0, 0, 1, 1, 1,
0.07323394, -1.175032, 1.6165, 1, 0, 0, 1, 1,
0.07350237, 0.5294384, 0.5491655, 1, 0, 0, 1, 1,
0.07627968, -0.6429495, 3.706476, 1, 0, 0, 1, 1,
0.07676861, -0.4169638, 3.049551, 1, 0, 0, 1, 1,
0.07862064, 0.3838885, 0.5907838, 1, 0, 0, 1, 1,
0.08345641, -0.8604728, 2.656854, 0, 0, 0, 1, 1,
0.08403734, 0.1628191, 0.2080605, 0, 0, 0, 1, 1,
0.0864943, 0.01572751, 0.3534414, 0, 0, 0, 1, 1,
0.08671252, -1.31884, 3.87652, 0, 0, 0, 1, 1,
0.0895141, 1.680313, -0.7731712, 0, 0, 0, 1, 1,
0.09708177, 1.816308, 0.1861789, 0, 0, 0, 1, 1,
0.1008273, -0.6784994, 4.116261, 0, 0, 0, 1, 1,
0.1032998, 0.528059, 0.5575068, 1, 1, 1, 1, 1,
0.1088063, 0.6460964, 0.9776425, 1, 1, 1, 1, 1,
0.1089957, -0.339435, 2.719566, 1, 1, 1, 1, 1,
0.1113658, -1.659141, 2.818267, 1, 1, 1, 1, 1,
0.1209728, -2.702148, 2.788015, 1, 1, 1, 1, 1,
0.1213245, -0.9967768, 2.736714, 1, 1, 1, 1, 1,
0.1224151, 1.684045, 0.7675486, 1, 1, 1, 1, 1,
0.1224763, 0.627375, 1.045764, 1, 1, 1, 1, 1,
0.1225603, 0.1113939, 1.899098, 1, 1, 1, 1, 1,
0.1226008, 0.9702204, -0.5207656, 1, 1, 1, 1, 1,
0.1263991, 1.333466, -0.7008171, 1, 1, 1, 1, 1,
0.1374034, -0.8894582, 3.968136, 1, 1, 1, 1, 1,
0.1410514, 1.406737, -0.8352771, 1, 1, 1, 1, 1,
0.1453392, -0.2014773, 1.621825, 1, 1, 1, 1, 1,
0.1474237, 0.2176938, 0.1065021, 1, 1, 1, 1, 1,
0.1476735, -0.9997724, 2.79185, 0, 0, 1, 1, 1,
0.1527313, 1.580173, -0.3948835, 1, 0, 0, 1, 1,
0.1569513, 0.5425546, 0.4975023, 1, 0, 0, 1, 1,
0.1595471, 0.3624479, 0.06424794, 1, 0, 0, 1, 1,
0.1630374, 0.1680297, 2.554165, 1, 0, 0, 1, 1,
0.1635062, -0.5289305, 2.736399, 1, 0, 0, 1, 1,
0.1662404, -0.1899103, 2.749595, 0, 0, 0, 1, 1,
0.1748444, -0.7722105, 3.525898, 0, 0, 0, 1, 1,
0.1779366, -0.7389381, 2.231556, 0, 0, 0, 1, 1,
0.1783284, -0.8339576, 2.437312, 0, 0, 0, 1, 1,
0.1799503, -0.2796402, 1.404581, 0, 0, 0, 1, 1,
0.1913234, -0.2563734, 3.475066, 0, 0, 0, 1, 1,
0.195246, 0.5359709, 0.3202429, 0, 0, 0, 1, 1,
0.1972706, 1.378452, -0.7463563, 1, 1, 1, 1, 1,
0.2211841, -0.3913034, 4.000111, 1, 1, 1, 1, 1,
0.2212251, 2.755877, -0.2056216, 1, 1, 1, 1, 1,
0.2218059, -0.8045726, 3.128244, 1, 1, 1, 1, 1,
0.2264453, -0.36225, 1.973625, 1, 1, 1, 1, 1,
0.2269513, 0.02837799, 2.747028, 1, 1, 1, 1, 1,
0.2286293, 0.362102, 0.08430576, 1, 1, 1, 1, 1,
0.2290734, 0.1005149, 2.942576, 1, 1, 1, 1, 1,
0.2291885, 1.238965, -0.1584406, 1, 1, 1, 1, 1,
0.2320898, 0.4455912, 0.9360065, 1, 1, 1, 1, 1,
0.2321354, -0.252806, 2.015884, 1, 1, 1, 1, 1,
0.2350283, 0.7839448, 0.09806842, 1, 1, 1, 1, 1,
0.2362268, 0.335804, 0.8562456, 1, 1, 1, 1, 1,
0.2371999, -0.62793, 1.984288, 1, 1, 1, 1, 1,
0.2409783, -0.6826915, 2.661145, 1, 1, 1, 1, 1,
0.2435587, 1.904855, 0.03897999, 0, 0, 1, 1, 1,
0.2438945, 1.379319, 0.4539409, 1, 0, 0, 1, 1,
0.2526844, 0.06114339, 1.298409, 1, 0, 0, 1, 1,
0.2529684, -0.1921533, 1.717356, 1, 0, 0, 1, 1,
0.2532653, -0.05693114, 2.394773, 1, 0, 0, 1, 1,
0.2535431, -1.677214, 1.554355, 1, 0, 0, 1, 1,
0.2542938, -0.2052942, 2.866152, 0, 0, 0, 1, 1,
0.2546785, 0.5847398, 0.6337649, 0, 0, 0, 1, 1,
0.2615934, -0.6074371, 3.141038, 0, 0, 0, 1, 1,
0.2634404, 0.3410167, -0.4486473, 0, 0, 0, 1, 1,
0.2636209, 1.689248, -0.295837, 0, 0, 0, 1, 1,
0.2723005, -1.159086, 2.479753, 0, 0, 0, 1, 1,
0.2770214, -0.7346478, 2.803111, 0, 0, 0, 1, 1,
0.2806486, 0.00517007, 1.928091, 1, 1, 1, 1, 1,
0.2830759, -0.8346981, 1.369914, 1, 1, 1, 1, 1,
0.2854114, 0.9352993, 0.7378085, 1, 1, 1, 1, 1,
0.2857927, -1.79084, 2.702685, 1, 1, 1, 1, 1,
0.2861921, 0.5497149, -0.9951269, 1, 1, 1, 1, 1,
0.2925225, 0.9767437, 0.6419368, 1, 1, 1, 1, 1,
0.292972, 0.01606898, 1.348759, 1, 1, 1, 1, 1,
0.2971684, -1.365022, 2.365978, 1, 1, 1, 1, 1,
0.3010722, -0.9532324, 2.021844, 1, 1, 1, 1, 1,
0.3017116, -1.367755, 4.004272, 1, 1, 1, 1, 1,
0.3053752, -0.9030233, 3.86445, 1, 1, 1, 1, 1,
0.309031, -0.4667761, 3.931571, 1, 1, 1, 1, 1,
0.3093105, -0.6080437, 2.888154, 1, 1, 1, 1, 1,
0.3110512, -0.08788124, 4.042016, 1, 1, 1, 1, 1,
0.3148645, -0.03125036, 2.595575, 1, 1, 1, 1, 1,
0.3238563, -0.4530773, 4.30749, 0, 0, 1, 1, 1,
0.3252056, -0.6449268, 3.027005, 1, 0, 0, 1, 1,
0.326128, -0.754222, 1.931521, 1, 0, 0, 1, 1,
0.3270514, 1.232029, -1.067986, 1, 0, 0, 1, 1,
0.3363861, -0.3961909, 1.753123, 1, 0, 0, 1, 1,
0.3399162, -0.8671786, -0.4845253, 1, 0, 0, 1, 1,
0.3476478, -1.29383, 3.234745, 0, 0, 0, 1, 1,
0.3481613, 1.184133, 0.8707257, 0, 0, 0, 1, 1,
0.3485149, 0.132966, 0.7055601, 0, 0, 0, 1, 1,
0.3489505, -0.8228212, 1.936315, 0, 0, 0, 1, 1,
0.3527553, 0.6017212, 0.9009847, 0, 0, 0, 1, 1,
0.3634297, -0.953819, 2.730843, 0, 0, 0, 1, 1,
0.3662318, 1.005665, 1.670427, 0, 0, 0, 1, 1,
0.3709702, -2.485791, 1.741755, 1, 1, 1, 1, 1,
0.3722132, -0.8361682, 1.331019, 1, 1, 1, 1, 1,
0.3735031, 0.6619247, -1.817475, 1, 1, 1, 1, 1,
0.3742068, 1.321452, 1.289169, 1, 1, 1, 1, 1,
0.3763011, 1.238001, 0.4601294, 1, 1, 1, 1, 1,
0.38381, 0.2818969, 0.966729, 1, 1, 1, 1, 1,
0.3870584, -0.4806781, 1.614543, 1, 1, 1, 1, 1,
0.388231, -0.07420862, 1.748114, 1, 1, 1, 1, 1,
0.3887673, 0.09197308, 2.10748, 1, 1, 1, 1, 1,
0.3900664, 0.5751719, 1.18995, 1, 1, 1, 1, 1,
0.392231, 1.109044, 0.09677161, 1, 1, 1, 1, 1,
0.392804, -0.2523362, 2.193306, 1, 1, 1, 1, 1,
0.3975738, 0.005213764, 3.358993, 1, 1, 1, 1, 1,
0.4033631, 0.2566429, 2.493266, 1, 1, 1, 1, 1,
0.4053913, -0.9627218, 2.747671, 1, 1, 1, 1, 1,
0.4065087, 0.2375086, -1.15061, 0, 0, 1, 1, 1,
0.4103691, 0.8998463, -0.3380556, 1, 0, 0, 1, 1,
0.4189331, 0.055881, 0.01601077, 1, 0, 0, 1, 1,
0.4219134, -1.340116, 3.284203, 1, 0, 0, 1, 1,
0.4237215, -0.3645513, 1.436508, 1, 0, 0, 1, 1,
0.4242914, -0.1338477, 2.450951, 1, 0, 0, 1, 1,
0.4301909, 1.980349, -0.1101249, 0, 0, 0, 1, 1,
0.432522, 0.1088886, 0.1501074, 0, 0, 0, 1, 1,
0.4362717, 0.9175671, -0.1594275, 0, 0, 0, 1, 1,
0.4381379, -1.722228, 4.287127, 0, 0, 0, 1, 1,
0.4392478, -0.6256685, 3.337111, 0, 0, 0, 1, 1,
0.4424102, -0.5260517, 2.86108, 0, 0, 0, 1, 1,
0.4437054, -2.010755, 1.391922, 0, 0, 0, 1, 1,
0.4601551, -1.314176, 2.797782, 1, 1, 1, 1, 1,
0.4666141, 2.019645, 0.2893756, 1, 1, 1, 1, 1,
0.4672471, -2.239443, 2.995862, 1, 1, 1, 1, 1,
0.4688803, -0.2156075, 1.9223, 1, 1, 1, 1, 1,
0.4690998, -0.311984, 1.790363, 1, 1, 1, 1, 1,
0.4804101, -0.6399739, 2.402365, 1, 1, 1, 1, 1,
0.480806, -1.143372, 1.306931, 1, 1, 1, 1, 1,
0.4816048, 0.02731373, 2.684368, 1, 1, 1, 1, 1,
0.4871274, 1.544667, 0.3783441, 1, 1, 1, 1, 1,
0.487841, -1.492128, 1.046018, 1, 1, 1, 1, 1,
0.4910141, -1.026831, 4.147243, 1, 1, 1, 1, 1,
0.4935099, -0.6096619, 4.356524, 1, 1, 1, 1, 1,
0.5009484, -0.5265519, 3.215358, 1, 1, 1, 1, 1,
0.501412, 0.8368339, 2.634811, 1, 1, 1, 1, 1,
0.5021445, -1.610421, 3.462091, 1, 1, 1, 1, 1,
0.5105821, -0.9473963, 3.476974, 0, 0, 1, 1, 1,
0.5129515, 1.023607, 0.01214631, 1, 0, 0, 1, 1,
0.5135091, 2.353195, 2.057166, 1, 0, 0, 1, 1,
0.5168594, -0.5833721, 3.429448, 1, 0, 0, 1, 1,
0.5174461, -0.6411232, 1.01894, 1, 0, 0, 1, 1,
0.5192558, -0.6033614, 2.790303, 1, 0, 0, 1, 1,
0.5198079, 0.5986909, 0.6377336, 0, 0, 0, 1, 1,
0.5217782, -1.839497, 2.031464, 0, 0, 0, 1, 1,
0.5239133, 1.390351, 0.7296436, 0, 0, 0, 1, 1,
0.5277963, 1.605694, 1.017871, 0, 0, 0, 1, 1,
0.5325537, -1.323669, 3.231869, 0, 0, 0, 1, 1,
0.5347091, 0.1334195, 2.57543, 0, 0, 0, 1, 1,
0.535272, -1.932722, 3.106635, 0, 0, 0, 1, 1,
0.5395421, -0.3907921, 3.957563, 1, 1, 1, 1, 1,
0.5408447, -0.2267509, 2.56838, 1, 1, 1, 1, 1,
0.5409027, 1.578962, -0.4365163, 1, 1, 1, 1, 1,
0.5410093, 0.1654999, 1.721693, 1, 1, 1, 1, 1,
0.5452296, 0.03987917, 1.090499, 1, 1, 1, 1, 1,
0.5455811, -0.6894386, 4.400454, 1, 1, 1, 1, 1,
0.5475608, 0.565779, 1.382327, 1, 1, 1, 1, 1,
0.5510209, -0.4324836, 1.131862, 1, 1, 1, 1, 1,
0.5523975, 2.026254, -0.7770505, 1, 1, 1, 1, 1,
0.5542013, -0.3845762, 2.413, 1, 1, 1, 1, 1,
0.5547929, -0.2106369, -0.9359519, 1, 1, 1, 1, 1,
0.5571581, -2.05531, 1.704568, 1, 1, 1, 1, 1,
0.5582741, 1.425989, 2.472147, 1, 1, 1, 1, 1,
0.5592547, 0.5162966, 0.5038733, 1, 1, 1, 1, 1,
0.5639793, -0.5766103, 0.9305033, 1, 1, 1, 1, 1,
0.5720177, -1.283078, 2.560159, 0, 0, 1, 1, 1,
0.5727378, -1.378778, 2.523077, 1, 0, 0, 1, 1,
0.5762164, 0.338523, 1.893157, 1, 0, 0, 1, 1,
0.5775239, 0.1194705, 1.563764, 1, 0, 0, 1, 1,
0.5778863, 0.373719, 0.01444945, 1, 0, 0, 1, 1,
0.5779965, -1.400694, 2.523183, 1, 0, 0, 1, 1,
0.5804701, 0.2411873, -0.1874845, 0, 0, 0, 1, 1,
0.5908167, 0.7260771, 0.9668559, 0, 0, 0, 1, 1,
0.5988895, 0.06393834, 3.285614, 0, 0, 0, 1, 1,
0.6054201, 1.644071, -1.011254, 0, 0, 0, 1, 1,
0.6094527, -0.2449717, 1.825089, 0, 0, 0, 1, 1,
0.6111634, 2.198705, 0.01229793, 0, 0, 0, 1, 1,
0.6131559, 0.6089263, 1.034368, 0, 0, 0, 1, 1,
0.6171209, -0.4069661, 0.513372, 1, 1, 1, 1, 1,
0.6178541, 1.126205, 1.420943, 1, 1, 1, 1, 1,
0.6192737, -1.286328, 4.910276, 1, 1, 1, 1, 1,
0.6206857, -0.9779378, 1.177606, 1, 1, 1, 1, 1,
0.6270369, 1.851358, 2.779687, 1, 1, 1, 1, 1,
0.6279107, -0.04192823, 1.917633, 1, 1, 1, 1, 1,
0.6352862, -1.17673, 4.476476, 1, 1, 1, 1, 1,
0.638597, -0.8549398, 2.063004, 1, 1, 1, 1, 1,
0.6452574, -1.469038, 4.383633, 1, 1, 1, 1, 1,
0.6458642, -1.894611, 1.491729, 1, 1, 1, 1, 1,
0.6506236, -1.6919, 0.6247823, 1, 1, 1, 1, 1,
0.6524285, 2.025413, -0.4588381, 1, 1, 1, 1, 1,
0.6529343, -1.190082, 1.794392, 1, 1, 1, 1, 1,
0.6572962, 0.08456622, 1.011944, 1, 1, 1, 1, 1,
0.6598163, -0.01415579, 1.282647, 1, 1, 1, 1, 1,
0.6602762, -0.5915561, 3.625047, 0, 0, 1, 1, 1,
0.6619446, 0.1990552, 1.677629, 1, 0, 0, 1, 1,
0.6640493, -0.5988613, 3.028411, 1, 0, 0, 1, 1,
0.6657994, 0.0175289, -0.3781377, 1, 0, 0, 1, 1,
0.6737058, 1.390436, -0.3527015, 1, 0, 0, 1, 1,
0.6966026, -0.6771739, 1.751802, 1, 0, 0, 1, 1,
0.7002214, -1.475648, 1.928187, 0, 0, 0, 1, 1,
0.7006789, 1.518362, 0.2334915, 0, 0, 0, 1, 1,
0.7031688, -0.331057, 1.72841, 0, 0, 0, 1, 1,
0.7047513, 0.08794293, 3.149229, 0, 0, 0, 1, 1,
0.7091263, -0.1227252, 0.7128235, 0, 0, 0, 1, 1,
0.7112534, 1.013128, 0.5517814, 0, 0, 0, 1, 1,
0.712127, 1.103799, 1.777845, 0, 0, 0, 1, 1,
0.7198732, -0.461547, 3.381618, 1, 1, 1, 1, 1,
0.7204609, 1.084475, 1.223601, 1, 1, 1, 1, 1,
0.7205419, -2.868595, 3.135023, 1, 1, 1, 1, 1,
0.7227301, 0.3885374, 1.52378, 1, 1, 1, 1, 1,
0.7283052, -0.9917617, 2.794861, 1, 1, 1, 1, 1,
0.7355203, -1.489695, 3.505049, 1, 1, 1, 1, 1,
0.7414037, 0.8445666, -0.07635929, 1, 1, 1, 1, 1,
0.7418504, -0.4301867, 2.595416, 1, 1, 1, 1, 1,
0.7446445, 0.7146465, 1.317701, 1, 1, 1, 1, 1,
0.7455814, -1.84681, 1.987937, 1, 1, 1, 1, 1,
0.7468438, -0.4676933, 3.682724, 1, 1, 1, 1, 1,
0.7485612, -0.2270143, 1.5492, 1, 1, 1, 1, 1,
0.7501608, -0.1325157, 0.7384059, 1, 1, 1, 1, 1,
0.7546867, -0.3249411, 2.542835, 1, 1, 1, 1, 1,
0.7550529, -0.5715792, 2.873172, 1, 1, 1, 1, 1,
0.7624841, 1.149508, 1.170414, 0, 0, 1, 1, 1,
0.7626103, 1.623739, 0.0898971, 1, 0, 0, 1, 1,
0.7646319, -1.676169, 3.608191, 1, 0, 0, 1, 1,
0.7691551, 1.004941, -0.3066502, 1, 0, 0, 1, 1,
0.7699489, -0.9768745, 2.455663, 1, 0, 0, 1, 1,
0.7714989, -0.2058877, 1.333501, 1, 0, 0, 1, 1,
0.7741466, 0.1877931, 0.6961595, 0, 0, 0, 1, 1,
0.7750369, -0.1226032, 3.614198, 0, 0, 0, 1, 1,
0.7772295, 0.4407027, 1.029346, 0, 0, 0, 1, 1,
0.7774249, 1.387317, 1.045067, 0, 0, 0, 1, 1,
0.7807634, -1.131165, 3.625608, 0, 0, 0, 1, 1,
0.7854926, -0.06143976, 0.6725836, 0, 0, 0, 1, 1,
0.7877098, 0.335888, 2.472795, 0, 0, 0, 1, 1,
0.7881167, 0.2115026, 0.7428469, 1, 1, 1, 1, 1,
0.7890729, -0.01734422, 0.8332295, 1, 1, 1, 1, 1,
0.7899736, -0.8182942, 2.12904, 1, 1, 1, 1, 1,
0.79088, -0.2801277, 1.502449, 1, 1, 1, 1, 1,
0.7972458, 0.04127511, 1.825565, 1, 1, 1, 1, 1,
0.8012078, -1.507503, -0.2975982, 1, 1, 1, 1, 1,
0.8043785, 0.9139658, 1.218154, 1, 1, 1, 1, 1,
0.8044042, 0.5515423, -0.05096503, 1, 1, 1, 1, 1,
0.8081718, -0.2726767, 3.044357, 1, 1, 1, 1, 1,
0.8100623, -1.393251, 3.614221, 1, 1, 1, 1, 1,
0.8142364, -0.2252995, 3.552077, 1, 1, 1, 1, 1,
0.8174632, 1.251503, 3.579431, 1, 1, 1, 1, 1,
0.8214022, -1.041355, 1.134348, 1, 1, 1, 1, 1,
0.8276332, 1.350482, 0.652983, 1, 1, 1, 1, 1,
0.8293988, -1.932226, 4.002683, 1, 1, 1, 1, 1,
0.8322126, -1.045178, 3.049574, 0, 0, 1, 1, 1,
0.8350317, -0.6340498, 1.918609, 1, 0, 0, 1, 1,
0.840644, -0.9892809, 2.230078, 1, 0, 0, 1, 1,
0.841706, -0.2262139, 2.381657, 1, 0, 0, 1, 1,
0.8431315, 0.2826511, 3.774114, 1, 0, 0, 1, 1,
0.848528, -0.7138851, 2.429385, 1, 0, 0, 1, 1,
0.8505339, -2.66468, 2.342396, 0, 0, 0, 1, 1,
0.8583586, 0.3698366, 1.107745, 0, 0, 0, 1, 1,
0.8600804, 1.272943, -0.451681, 0, 0, 0, 1, 1,
0.8603075, 0.2669089, 1.304705, 0, 0, 0, 1, 1,
0.8630787, 0.2950055, 2.808076, 0, 0, 0, 1, 1,
0.8634458, -1.208381, 3.10395, 0, 0, 0, 1, 1,
0.8641858, -0.8753278, 4.211427, 0, 0, 0, 1, 1,
0.8680587, -0.8859084, 3.184331, 1, 1, 1, 1, 1,
0.8807271, 1.252756, 2.038385, 1, 1, 1, 1, 1,
0.8814898, -2.177164, 3.02563, 1, 1, 1, 1, 1,
0.889398, -1.22421, 2.682226, 1, 1, 1, 1, 1,
0.8950954, 0.5800909, 0.4057393, 1, 1, 1, 1, 1,
0.8955733, -1.226257, 5.081218, 1, 1, 1, 1, 1,
0.8971997, -1.540297, 3.514268, 1, 1, 1, 1, 1,
0.8981498, -0.6912414, 2.869356, 1, 1, 1, 1, 1,
0.9030071, -0.3703789, 1.514498, 1, 1, 1, 1, 1,
0.9031756, 0.06263477, -0.1733673, 1, 1, 1, 1, 1,
0.9060563, 0.7118276, 2.093821, 1, 1, 1, 1, 1,
0.912587, -0.2961427, 2.36016, 1, 1, 1, 1, 1,
0.9190007, -1.582617, 3.613072, 1, 1, 1, 1, 1,
0.9211209, 0.7657241, 0.4846208, 1, 1, 1, 1, 1,
0.9245578, 0.4221448, 1.510286, 1, 1, 1, 1, 1,
0.926603, -0.255829, 1.336745, 0, 0, 1, 1, 1,
0.9332703, -0.4597929, 4.009184, 1, 0, 0, 1, 1,
0.9354436, 0.1849891, 3.021883, 1, 0, 0, 1, 1,
0.9380887, 0.2984407, 1.068358, 1, 0, 0, 1, 1,
0.9384339, 1.409758, 0.2420439, 1, 0, 0, 1, 1,
0.9415216, -1.299493, 2.976229, 1, 0, 0, 1, 1,
0.9615127, 1.230814, -0.9124881, 0, 0, 0, 1, 1,
0.9618524, -0.4647753, -0.1441779, 0, 0, 0, 1, 1,
0.9623629, -1.126444, 3.446404, 0, 0, 0, 1, 1,
0.9627868, 0.7310814, -0.5046304, 0, 0, 0, 1, 1,
0.964887, -1.781868, 0.3604616, 0, 0, 0, 1, 1,
0.9690456, -0.2627484, 1.720427, 0, 0, 0, 1, 1,
0.9692658, 0.5178343, -0.1191174, 0, 0, 0, 1, 1,
0.9699784, -0.8209935, 2.262047, 1, 1, 1, 1, 1,
0.9700854, -1.590271, 1.334241, 1, 1, 1, 1, 1,
0.9989315, 0.5976826, 1.931264, 1, 1, 1, 1, 1,
1.003755, -0.06830586, -0.5006889, 1, 1, 1, 1, 1,
1.005744, 0.7040345, 3.010889, 1, 1, 1, 1, 1,
1.009132, 0.3562942, 1.43248, 1, 1, 1, 1, 1,
1.013365, -1.035203, 3.18279, 1, 1, 1, 1, 1,
1.014592, -1.610333, 2.700636, 1, 1, 1, 1, 1,
1.015462, -0.5365735, 2.279623, 1, 1, 1, 1, 1,
1.019293, 0.556484, 2.625856, 1, 1, 1, 1, 1,
1.021339, 1.458618, -0.4765794, 1, 1, 1, 1, 1,
1.021939, 1.516458, 0.5749103, 1, 1, 1, 1, 1,
1.030242, 1.017004, 0.4719268, 1, 1, 1, 1, 1,
1.040415, -0.2326227, 1.099723, 1, 1, 1, 1, 1,
1.042446, 2.215976, -0.5594224, 1, 1, 1, 1, 1,
1.05518, 0.1672028, -0.04217303, 0, 0, 1, 1, 1,
1.062873, -0.2699574, 3.343121, 1, 0, 0, 1, 1,
1.069601, 1.157031, 2.130806, 1, 0, 0, 1, 1,
1.082853, 0.3294842, 1.18436, 1, 0, 0, 1, 1,
1.086682, -0.174067, 1.567665, 1, 0, 0, 1, 1,
1.09188, -1.315561, 3.67461, 1, 0, 0, 1, 1,
1.092244, -2.261349, 5.539247, 0, 0, 0, 1, 1,
1.093545, 0.8845013, 1.378299, 0, 0, 0, 1, 1,
1.099125, -1.282668, 3.854925, 0, 0, 0, 1, 1,
1.101896, 1.039089, 1.346312, 0, 0, 0, 1, 1,
1.117629, 0.6379303, 0.1405622, 0, 0, 0, 1, 1,
1.126938, -0.7243867, 0.5462007, 0, 0, 0, 1, 1,
1.128981, -0.3256581, 1.092245, 0, 0, 0, 1, 1,
1.1301, 0.7067754, 0.6619914, 1, 1, 1, 1, 1,
1.135132, -0.5559766, 0.2418643, 1, 1, 1, 1, 1,
1.142811, -1.350865, 1.879196, 1, 1, 1, 1, 1,
1.156585, 0.4337664, 0.06975544, 1, 1, 1, 1, 1,
1.163212, -0.3372323, 2.179368, 1, 1, 1, 1, 1,
1.168996, 0.5726943, 2.024792, 1, 1, 1, 1, 1,
1.17468, 0.8273271, -0.3765192, 1, 1, 1, 1, 1,
1.176387, 0.1746105, 0.8348038, 1, 1, 1, 1, 1,
1.179573, 0.469691, 1.5222, 1, 1, 1, 1, 1,
1.192149, 1.002363, 1.619349, 1, 1, 1, 1, 1,
1.196056, -0.2256341, 0.8694862, 1, 1, 1, 1, 1,
1.196724, -0.3736463, 2.783742, 1, 1, 1, 1, 1,
1.197301, -0.4875323, -0.3492545, 1, 1, 1, 1, 1,
1.201544, 0.8360217, 1.9302, 1, 1, 1, 1, 1,
1.202165, 0.1403288, 1.598579, 1, 1, 1, 1, 1,
1.202814, 0.6572416, -0.9209334, 0, 0, 1, 1, 1,
1.205293, 0.07844162, 0.7907365, 1, 0, 0, 1, 1,
1.213038, -0.6226493, 4.282011, 1, 0, 0, 1, 1,
1.217527, 1.375248, -0.7286783, 1, 0, 0, 1, 1,
1.217579, -0.4989309, 2.246548, 1, 0, 0, 1, 1,
1.218395, -0.3560837, 3.764542, 1, 0, 0, 1, 1,
1.225585, 0.8708637, 0.03220315, 0, 0, 0, 1, 1,
1.227191, -1.281889, 2.87538, 0, 0, 0, 1, 1,
1.229972, 0.0971763, 1.99115, 0, 0, 0, 1, 1,
1.232844, 0.8047873, 1.547435, 0, 0, 0, 1, 1,
1.239138, 0.5148199, 0.1037146, 0, 0, 0, 1, 1,
1.240039, 0.7283497, 1.743369, 0, 0, 0, 1, 1,
1.241041, -2.13791, 3.014125, 0, 0, 0, 1, 1,
1.259989, 0.7186703, 0.7275516, 1, 1, 1, 1, 1,
1.261026, 0.7855601, 2.211529, 1, 1, 1, 1, 1,
1.265568, -0.1180291, 2.193113, 1, 1, 1, 1, 1,
1.268816, -0.8607923, 2.66294, 1, 1, 1, 1, 1,
1.271747, -0.5548694, 0.8950878, 1, 1, 1, 1, 1,
1.27512, 0.4898559, 1.714303, 1, 1, 1, 1, 1,
1.278049, -0.817264, 1.957002, 1, 1, 1, 1, 1,
1.292088, -0.862548, 2.879093, 1, 1, 1, 1, 1,
1.294857, -1.027103, 0.8796813, 1, 1, 1, 1, 1,
1.297535, 1.205234, 0.1554718, 1, 1, 1, 1, 1,
1.328892, -0.7055393, 2.691055, 1, 1, 1, 1, 1,
1.330083, 0.272125, 0.8858455, 1, 1, 1, 1, 1,
1.334737, 0.5899492, 0.2573284, 1, 1, 1, 1, 1,
1.335378, -1.197831, 1.29614, 1, 1, 1, 1, 1,
1.338286, 2.185693, 1.137448, 1, 1, 1, 1, 1,
1.36534, -0.9428539, 3.198488, 0, 0, 1, 1, 1,
1.370203, -0.06902198, 1.0766, 1, 0, 0, 1, 1,
1.371968, 0.5314321, 1.252421, 1, 0, 0, 1, 1,
1.374457, 0.6520457, 0.6027617, 1, 0, 0, 1, 1,
1.374932, 0.4456338, 1.549786, 1, 0, 0, 1, 1,
1.376632, -1.998509, -0.08447374, 1, 0, 0, 1, 1,
1.376764, 0.4779619, 2.47948, 0, 0, 0, 1, 1,
1.380747, -0.9390386, 1.753857, 0, 0, 0, 1, 1,
1.386899, -0.02008608, 1.178952, 0, 0, 0, 1, 1,
1.388915, -0.682106, 2.487748, 0, 0, 0, 1, 1,
1.39349, -0.175372, 0.07980608, 0, 0, 0, 1, 1,
1.393734, -0.0882965, 0.9181822, 0, 0, 0, 1, 1,
1.394135, 2.137329, -0.5920616, 0, 0, 0, 1, 1,
1.394713, -1.20559, 2.909741, 1, 1, 1, 1, 1,
1.402532, -0.8297545, 2.957905, 1, 1, 1, 1, 1,
1.404613, -0.5271736, 2.75231, 1, 1, 1, 1, 1,
1.409904, 1.054417, -0.433152, 1, 1, 1, 1, 1,
1.411509, -2.831156, 2.184067, 1, 1, 1, 1, 1,
1.413522, -1.375242, 1.387614, 1, 1, 1, 1, 1,
1.423118, -0.2812684, 0.4207541, 1, 1, 1, 1, 1,
1.433277, -0.5490094, 3.437904, 1, 1, 1, 1, 1,
1.433799, 1.382834, 0.9523759, 1, 1, 1, 1, 1,
1.436441, 0.4849175, -0.418066, 1, 1, 1, 1, 1,
1.437968, 0.4288831, 2.245626, 1, 1, 1, 1, 1,
1.439694, -0.728172, 3.361569, 1, 1, 1, 1, 1,
1.440299, 0.7454507, 1.806574, 1, 1, 1, 1, 1,
1.449015, 0.7080604, 0.5883693, 1, 1, 1, 1, 1,
1.453417, 0.7111685, 1.440354, 1, 1, 1, 1, 1,
1.46338, 0.3789642, -0.09679566, 0, 0, 1, 1, 1,
1.463465, 0.5080001, 0.8833286, 1, 0, 0, 1, 1,
1.464802, 2.068736, -0.08774718, 1, 0, 0, 1, 1,
1.471426, 1.638487, 3.259639, 1, 0, 0, 1, 1,
1.472271, -2.643897, 3.486314, 1, 0, 0, 1, 1,
1.480506, 0.4248021, 2.445941, 1, 0, 0, 1, 1,
1.492825, -0.4208883, 0.9939982, 0, 0, 0, 1, 1,
1.49493, 0.4373294, 0.9101409, 0, 0, 0, 1, 1,
1.498293, -0.6521638, 3.555847, 0, 0, 0, 1, 1,
1.499216, -2.66251, 0.1693306, 0, 0, 0, 1, 1,
1.515694, -0.3040909, 1.708026, 0, 0, 0, 1, 1,
1.522047, 1.770146, 0.4051603, 0, 0, 0, 1, 1,
1.530582, 0.5471051, 1.679274, 0, 0, 0, 1, 1,
1.530981, -0.2162237, 2.127818, 1, 1, 1, 1, 1,
1.53338, 1.41113, 1.425277, 1, 1, 1, 1, 1,
1.53534, -0.5736533, 4.651173, 1, 1, 1, 1, 1,
1.544463, 0.6812162, 0.2255612, 1, 1, 1, 1, 1,
1.571472, 0.3669656, 3.66493, 1, 1, 1, 1, 1,
1.577245, 1.51111, 0.5078604, 1, 1, 1, 1, 1,
1.582829, -0.309663, 1.523614, 1, 1, 1, 1, 1,
1.583558, -0.3536627, 2.894825, 1, 1, 1, 1, 1,
1.588453, 0.214747, -0.1689396, 1, 1, 1, 1, 1,
1.589416, -0.5215071, 0.3267686, 1, 1, 1, 1, 1,
1.59515, -1.207796, 1.938217, 1, 1, 1, 1, 1,
1.631517, 1.037365, 3.160271, 1, 1, 1, 1, 1,
1.660657, 1.258543, 0.6551067, 1, 1, 1, 1, 1,
1.679555, 0.213512, 2.676452, 1, 1, 1, 1, 1,
1.686018, 0.745109, 3.442482, 1, 1, 1, 1, 1,
1.688499, -0.3830006, 1.080399, 0, 0, 1, 1, 1,
1.704288, -0.3761385, 1.35528, 1, 0, 0, 1, 1,
1.712967, -0.8090308, 1.620921, 1, 0, 0, 1, 1,
1.722396, 0.700721, 0.838389, 1, 0, 0, 1, 1,
1.722447, 0.9000472, 0.2700795, 1, 0, 0, 1, 1,
1.745647, 0.1597441, 2.81242, 1, 0, 0, 1, 1,
1.746104, 1.608549, 0.1914738, 0, 0, 0, 1, 1,
1.767013, -0.1603363, 2.411866, 0, 0, 0, 1, 1,
1.775122, -0.2595947, -0.1334163, 0, 0, 0, 1, 1,
1.778628, -1.132787, 2.692679, 0, 0, 0, 1, 1,
1.795269, 0.8830492, 2.456614, 0, 0, 0, 1, 1,
1.816843, 0.1993921, 0.07946525, 0, 0, 0, 1, 1,
1.825341, -0.07721187, -0.4438653, 0, 0, 0, 1, 1,
1.829383, -0.006897259, 2.014367, 1, 1, 1, 1, 1,
1.829443, 1.547909, 1.58795, 1, 1, 1, 1, 1,
1.851468, 0.7167504, 1.799179, 1, 1, 1, 1, 1,
1.86398, 1.942886, 0.3640646, 1, 1, 1, 1, 1,
1.87035, -0.2886511, 2.139411, 1, 1, 1, 1, 1,
1.870761, 0.8971375, 1.551834, 1, 1, 1, 1, 1,
1.879622, 2.574751, 0.6958636, 1, 1, 1, 1, 1,
1.886263, 0.6161419, -0.5530825, 1, 1, 1, 1, 1,
1.899561, 0.4799227, 1.18993, 1, 1, 1, 1, 1,
1.90002, 1.215086, 0.4514738, 1, 1, 1, 1, 1,
1.943658, -1.005658, 1.462016, 1, 1, 1, 1, 1,
1.95909, 0.9452463, -0.282778, 1, 1, 1, 1, 1,
1.963823, -1.550084, 2.665104, 1, 1, 1, 1, 1,
1.97221, -0.778771, 1.961496, 1, 1, 1, 1, 1,
1.980157, 0.1939308, -0.6796601, 1, 1, 1, 1, 1,
2.001276, 0.756024, 0.7647648, 0, 0, 1, 1, 1,
2.02812, -0.9337461, 0.8571263, 1, 0, 0, 1, 1,
2.03122, 0.02105618, 1.460441, 1, 0, 0, 1, 1,
2.044057, 0.7870009, 1.82564, 1, 0, 0, 1, 1,
2.069756, 0.189706, 2.6882, 1, 0, 0, 1, 1,
2.071714, 0.6730411, 1.074104, 1, 0, 0, 1, 1,
2.081827, 0.2742041, 1.150893, 0, 0, 0, 1, 1,
2.087705, -2.485226, 2.933405, 0, 0, 0, 1, 1,
2.111898, 0.02766044, 2.42047, 0, 0, 0, 1, 1,
2.131928, -1.109544, 1.560781, 0, 0, 0, 1, 1,
2.193112, 0.8887942, 0.6998451, 0, 0, 0, 1, 1,
2.265791, 0.218273, 0.1588835, 0, 0, 0, 1, 1,
2.30027, -0.9200393, 1.435018, 0, 0, 0, 1, 1,
2.323698, -0.9010021, 1.272942, 1, 1, 1, 1, 1,
2.360926, 0.1650023, -0.2499366, 1, 1, 1, 1, 1,
2.402411, 0.8629266, 0.01976774, 1, 1, 1, 1, 1,
2.526537, 0.6872464, 1.476774, 1, 1, 1, 1, 1,
2.929551, -0.8232731, 1.007694, 1, 1, 1, 1, 1,
2.978482, 1.129546, 1.878237, 1, 1, 1, 1, 1,
3.479191, 2.785382, 0.9546664, 1, 1, 1, 1, 1
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
var radius = 9.775337;
var distance = 34.33546;
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
mvMatrix.translate( 0.2479067, 0.2368104, -0.3293617 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.33546);
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
