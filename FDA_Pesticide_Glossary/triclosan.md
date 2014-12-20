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
-3.161716, 1.128436, -1.13638, 1, 0, 0, 1,
-3.134076, 1.422147, -1.682872, 1, 0.007843138, 0, 1,
-3.105879, -0.6178763, -1.441796, 1, 0.01176471, 0, 1,
-2.763394, 0.12491, -0.8056943, 1, 0.01960784, 0, 1,
-2.756248, 0.1702786, -0.7336852, 1, 0.02352941, 0, 1,
-2.564054, -1.313946, -2.449141, 1, 0.03137255, 0, 1,
-2.527158, -0.3622661, -1.366705, 1, 0.03529412, 0, 1,
-2.474425, 0.3778298, -0.8976129, 1, 0.04313726, 0, 1,
-2.411866, -0.7013496, -2.273117, 1, 0.04705882, 0, 1,
-2.302824, 0.2502099, -2.40867, 1, 0.05490196, 0, 1,
-2.223922, -0.7254641, -2.64809, 1, 0.05882353, 0, 1,
-2.152666, -0.2923059, -2.134108, 1, 0.06666667, 0, 1,
-2.082268, 0.5377073, 0.7671958, 1, 0.07058824, 0, 1,
-2.071413, -0.8721746, -1.893005, 1, 0.07843138, 0, 1,
-2.044896, -0.117051, -0.3142209, 1, 0.08235294, 0, 1,
-2.039222, 2.060568, -0.515528, 1, 0.09019608, 0, 1,
-2.014014, 0.1937835, -2.66867, 1, 0.09411765, 0, 1,
-2.00313, -1.567399, -2.3558, 1, 0.1019608, 0, 1,
-2.001682, -0.2179249, -3.852615, 1, 0.1098039, 0, 1,
-1.98597, -1.741273, -2.774266, 1, 0.1137255, 0, 1,
-1.985804, 0.08559258, -1.631183, 1, 0.1215686, 0, 1,
-1.979961, 1.044201, -0.6689697, 1, 0.1254902, 0, 1,
-1.969266, -0.2028531, -2.588383, 1, 0.1333333, 0, 1,
-1.968039, -0.7254058, -2.233932, 1, 0.1372549, 0, 1,
-1.92899, 0.8879283, -0.3670236, 1, 0.145098, 0, 1,
-1.928843, -0.5052745, -0.8921146, 1, 0.1490196, 0, 1,
-1.907421, -1.368002, -2.318275, 1, 0.1568628, 0, 1,
-1.899211, 0.6571138, -2.98816, 1, 0.1607843, 0, 1,
-1.878853, -0.1892619, -0.4624149, 1, 0.1686275, 0, 1,
-1.864969, 0.1282645, -3.169926, 1, 0.172549, 0, 1,
-1.862912, 1.025246, -1.279506, 1, 0.1803922, 0, 1,
-1.861376, 1.04573, -2.026313, 1, 0.1843137, 0, 1,
-1.847385, -1.402489, -0.8217695, 1, 0.1921569, 0, 1,
-1.844031, -0.2454263, -2.848788, 1, 0.1960784, 0, 1,
-1.835788, 1.010395, -1.162021, 1, 0.2039216, 0, 1,
-1.834114, 1.071022, -0.5365734, 1, 0.2117647, 0, 1,
-1.818388, 0.9336709, -0.1761667, 1, 0.2156863, 0, 1,
-1.812933, -0.3327066, -0.7620105, 1, 0.2235294, 0, 1,
-1.811828, 0.2888354, -1.73998, 1, 0.227451, 0, 1,
-1.792403, -2.168443, -0.7259855, 1, 0.2352941, 0, 1,
-1.773061, -0.7775349, -1.33885, 1, 0.2392157, 0, 1,
-1.770682, 0.8871555, -0.8112544, 1, 0.2470588, 0, 1,
-1.764539, -0.04050689, -1.633855, 1, 0.2509804, 0, 1,
-1.763077, -0.5789688, -2.060613, 1, 0.2588235, 0, 1,
-1.756665, -0.102214, -2.961353, 1, 0.2627451, 0, 1,
-1.741294, -0.4196492, -2.959844, 1, 0.2705882, 0, 1,
-1.724674, 1.065399, -0.1061335, 1, 0.2745098, 0, 1,
-1.718768, -0.2818607, -1.402955, 1, 0.282353, 0, 1,
-1.718382, -0.5463873, -1.709394, 1, 0.2862745, 0, 1,
-1.712008, 1.149553, -1.53854, 1, 0.2941177, 0, 1,
-1.707691, 0.3832509, -0.9334063, 1, 0.3019608, 0, 1,
-1.678242, 1.103805, -1.417174, 1, 0.3058824, 0, 1,
-1.675695, -1.043706, -2.196243, 1, 0.3137255, 0, 1,
-1.673723, 0.3289141, -1.046036, 1, 0.3176471, 0, 1,
-1.661605, 2.391711, -1.637172, 1, 0.3254902, 0, 1,
-1.656717, -0.6615583, -3.214967, 1, 0.3294118, 0, 1,
-1.62389, -1.102053, -1.689342, 1, 0.3372549, 0, 1,
-1.592306, 0.6595405, -1.475282, 1, 0.3411765, 0, 1,
-1.58517, 0.4238103, 0.8072838, 1, 0.3490196, 0, 1,
-1.581961, -1.797209, -2.107849, 1, 0.3529412, 0, 1,
-1.581099, 1.498543, -2.261858, 1, 0.3607843, 0, 1,
-1.579187, -0.9480841, -2.104784, 1, 0.3647059, 0, 1,
-1.572219, -0.3390605, -1.582965, 1, 0.372549, 0, 1,
-1.571555, 0.4421138, -0.1098792, 1, 0.3764706, 0, 1,
-1.558358, 1.809965, 0.4726523, 1, 0.3843137, 0, 1,
-1.554916, -0.1234806, -2.232925, 1, 0.3882353, 0, 1,
-1.544905, -1.787231, -4.180356, 1, 0.3960784, 0, 1,
-1.543778, -0.3012491, -0.9069487, 1, 0.4039216, 0, 1,
-1.542724, 0.5595261, -2.624537, 1, 0.4078431, 0, 1,
-1.527538, 0.1470041, -0.6300304, 1, 0.4156863, 0, 1,
-1.524656, -2.119474, -5.395191, 1, 0.4196078, 0, 1,
-1.514402, 0.9502118, 0.4547442, 1, 0.427451, 0, 1,
-1.511479, -1.361308, -4.640114, 1, 0.4313726, 0, 1,
-1.482619, 2.470249, -1.189386, 1, 0.4392157, 0, 1,
-1.475159, 0.3997126, -1.365289, 1, 0.4431373, 0, 1,
-1.474276, 1.387468, 0.4543479, 1, 0.4509804, 0, 1,
-1.471979, 1.177709, -0.1334571, 1, 0.454902, 0, 1,
-1.470637, -0.1124579, -0.8165768, 1, 0.4627451, 0, 1,
-1.46149, 0.2089387, -2.073951, 1, 0.4666667, 0, 1,
-1.452709, 0.4341418, -1.657254, 1, 0.4745098, 0, 1,
-1.448838, -0.2970691, -1.320041, 1, 0.4784314, 0, 1,
-1.439202, -1.295452, -2.569767, 1, 0.4862745, 0, 1,
-1.436511, -0.5611159, -2.61557, 1, 0.4901961, 0, 1,
-1.434916, -0.5741691, -2.279902, 1, 0.4980392, 0, 1,
-1.42105, -0.8927166, -1.763589, 1, 0.5058824, 0, 1,
-1.416724, -0.5818427, -2.290076, 1, 0.509804, 0, 1,
-1.41301, 1.330214, -1.078493, 1, 0.5176471, 0, 1,
-1.405955, -1.023253, -2.647983, 1, 0.5215687, 0, 1,
-1.402434, 0.3622467, -1.294363, 1, 0.5294118, 0, 1,
-1.40103, -0.7039765, -3.97123, 1, 0.5333334, 0, 1,
-1.396976, 0.7091485, 0.5353001, 1, 0.5411765, 0, 1,
-1.390622, -1.910491, -2.055477, 1, 0.5450981, 0, 1,
-1.389036, -0.3640213, -1.527753, 1, 0.5529412, 0, 1,
-1.383755, 0.9718752, -0.9594992, 1, 0.5568628, 0, 1,
-1.379257, -0.8226553, -3.054666, 1, 0.5647059, 0, 1,
-1.369259, 1.159604, 0.1718096, 1, 0.5686275, 0, 1,
-1.366839, -1.085487, -1.234146, 1, 0.5764706, 0, 1,
-1.361871, -0.2391372, -0.9183968, 1, 0.5803922, 0, 1,
-1.357436, 1.001518, -0.4680656, 1, 0.5882353, 0, 1,
-1.353967, 0.5764025, -2.799309, 1, 0.5921569, 0, 1,
-1.345828, -0.06131937, -1.1846, 1, 0.6, 0, 1,
-1.335397, 0.4700182, -1.39134, 1, 0.6078432, 0, 1,
-1.328036, -1.189897, -3.164715, 1, 0.6117647, 0, 1,
-1.318935, -1.516301, -3.298947, 1, 0.6196079, 0, 1,
-1.318903, 0.4007317, -0.8052734, 1, 0.6235294, 0, 1,
-1.315354, 1.514176, -1.131997, 1, 0.6313726, 0, 1,
-1.31214, -1.596161, -2.029028, 1, 0.6352941, 0, 1,
-1.309504, 0.5529215, -2.584166, 1, 0.6431373, 0, 1,
-1.307735, 0.3071851, -1.666055, 1, 0.6470588, 0, 1,
-1.306819, -1.14455, -0.3881007, 1, 0.654902, 0, 1,
-1.305288, 1.925039, -0.1903623, 1, 0.6588235, 0, 1,
-1.301948, 0.5688419, -0.1036234, 1, 0.6666667, 0, 1,
-1.296527, 1.898833, -0.2276987, 1, 0.6705883, 0, 1,
-1.295612, 0.2454889, 0.6088049, 1, 0.6784314, 0, 1,
-1.290492, -0.3363052, -1.018143, 1, 0.682353, 0, 1,
-1.28987, 1.39287, -1.226192, 1, 0.6901961, 0, 1,
-1.287904, 2.070955, -0.9521676, 1, 0.6941177, 0, 1,
-1.271847, 1.515254, 0.7977874, 1, 0.7019608, 0, 1,
-1.269759, 0.7297974, -1.466979, 1, 0.7098039, 0, 1,
-1.263317, -0.00904774, 0.03503872, 1, 0.7137255, 0, 1,
-1.262573, 1.189847, -0.3730254, 1, 0.7215686, 0, 1,
-1.25265, -1.082676, -3.061519, 1, 0.7254902, 0, 1,
-1.252027, -0.1624564, -2.267513, 1, 0.7333333, 0, 1,
-1.251543, 0.8856701, -0.5834502, 1, 0.7372549, 0, 1,
-1.243344, 2.033417, 0.4811558, 1, 0.7450981, 0, 1,
-1.240312, 0.1116994, -1.711087, 1, 0.7490196, 0, 1,
-1.240214, 0.3320582, 1.315819, 1, 0.7568628, 0, 1,
-1.22673, 0.7803108, -2.685432, 1, 0.7607843, 0, 1,
-1.218139, 0.2645388, -0.6932097, 1, 0.7686275, 0, 1,
-1.211548, 0.1941769, -2.153129, 1, 0.772549, 0, 1,
-1.20961, -1.588317, -1.595451, 1, 0.7803922, 0, 1,
-1.204782, 0.1351347, -1.0985, 1, 0.7843137, 0, 1,
-1.203139, -0.704298, -1.831463, 1, 0.7921569, 0, 1,
-1.20201, 0.2470121, -0.1968454, 1, 0.7960784, 0, 1,
-1.192331, 0.3957831, -0.673781, 1, 0.8039216, 0, 1,
-1.187537, -0.4911047, -0.5453806, 1, 0.8117647, 0, 1,
-1.184284, -0.01166912, -1.445093, 1, 0.8156863, 0, 1,
-1.180751, 1.765005, -0.4846649, 1, 0.8235294, 0, 1,
-1.179286, 0.01308179, -0.771951, 1, 0.827451, 0, 1,
-1.177128, 0.4669497, -0.6423216, 1, 0.8352941, 0, 1,
-1.174685, 0.2116324, -1.794439, 1, 0.8392157, 0, 1,
-1.174297, 0.8230112, -0.7978284, 1, 0.8470588, 0, 1,
-1.170086, -0.9858525, -1.402473, 1, 0.8509804, 0, 1,
-1.169976, -1.294255, -2.457758, 1, 0.8588235, 0, 1,
-1.16475, 1.168308, -0.1638566, 1, 0.8627451, 0, 1,
-1.163456, 0.5612609, -0.6477402, 1, 0.8705882, 0, 1,
-1.163306, -0.6272421, -1.516244, 1, 0.8745098, 0, 1,
-1.158089, 1.818099, -0.7842878, 1, 0.8823529, 0, 1,
-1.154154, -1.900587, -2.09339, 1, 0.8862745, 0, 1,
-1.140732, 0.1367596, -4.157774, 1, 0.8941177, 0, 1,
-1.138528, -0.9477659, -2.040077, 1, 0.8980392, 0, 1,
-1.136323, -0.03509322, 0.5105524, 1, 0.9058824, 0, 1,
-1.134948, 0.5408735, -2.497818, 1, 0.9137255, 0, 1,
-1.129676, -0.6826434, -1.945529, 1, 0.9176471, 0, 1,
-1.126943, 0.9541891, -1.050159, 1, 0.9254902, 0, 1,
-1.114884, -0.6302037, -1.335887, 1, 0.9294118, 0, 1,
-1.10965, -0.9832763, -1.852356, 1, 0.9372549, 0, 1,
-1.109455, -0.445161, -0.571465, 1, 0.9411765, 0, 1,
-1.10697, 0.6482455, -0.7492672, 1, 0.9490196, 0, 1,
-1.106073, -1.354658, -3.93323, 1, 0.9529412, 0, 1,
-1.088332, 0.1440009, -2.889275, 1, 0.9607843, 0, 1,
-1.086784, -0.3243376, -0.4033301, 1, 0.9647059, 0, 1,
-1.08671, -0.2301546, -0.7972109, 1, 0.972549, 0, 1,
-1.084143, -0.6996142, -1.918148, 1, 0.9764706, 0, 1,
-1.082795, 0.3868456, -1.811915, 1, 0.9843137, 0, 1,
-1.081194, 1.781276, 1.013414, 1, 0.9882353, 0, 1,
-1.078424, -0.6398669, -2.200449, 1, 0.9960784, 0, 1,
-1.078232, 1.811309, -0.2708994, 0.9960784, 1, 0, 1,
-1.07672, 1.742834, 0.110618, 0.9921569, 1, 0, 1,
-1.074079, 1.431566, -1.254496, 0.9843137, 1, 0, 1,
-1.07331, -0.9289921, -1.658177, 0.9803922, 1, 0, 1,
-1.072714, -0.459921, -2.058966, 0.972549, 1, 0, 1,
-1.068172, -0.09826925, -1.902559, 0.9686275, 1, 0, 1,
-1.061413, 0.9360261, -0.1159937, 0.9607843, 1, 0, 1,
-1.054395, 1.567306, -0.1064783, 0.9568627, 1, 0, 1,
-1.04833, -1.155808, -3.123949, 0.9490196, 1, 0, 1,
-1.040011, -0.8740519, -2.179279, 0.945098, 1, 0, 1,
-1.036083, 2.152213, -0.09174446, 0.9372549, 1, 0, 1,
-1.031894, -0.06956138, -1.134741, 0.9333333, 1, 0, 1,
-1.004405, -0.07694849, -2.921767, 0.9254902, 1, 0, 1,
-1.000421, -0.2273719, -2.08419, 0.9215686, 1, 0, 1,
-0.9962708, 1.29305, -1.044797, 0.9137255, 1, 0, 1,
-0.9920118, 0.2972492, -0.8520574, 0.9098039, 1, 0, 1,
-0.9846101, 2.076639, 1.94533, 0.9019608, 1, 0, 1,
-0.98454, -0.5776199, -3.759315, 0.8941177, 1, 0, 1,
-0.984105, -0.148609, -0.3907275, 0.8901961, 1, 0, 1,
-0.9757606, 0.3268094, -1.578352, 0.8823529, 1, 0, 1,
-0.9757439, 1.862193, -0.3321534, 0.8784314, 1, 0, 1,
-0.9734314, 1.196356, -1.299673, 0.8705882, 1, 0, 1,
-0.9574587, -0.151389, -0.5207279, 0.8666667, 1, 0, 1,
-0.94762, 0.2977702, -1.518299, 0.8588235, 1, 0, 1,
-0.9452658, 0.6738383, -2.776313, 0.854902, 1, 0, 1,
-0.9430504, -0.4247797, -1.734392, 0.8470588, 1, 0, 1,
-0.9429668, -1.002695, -3.260435, 0.8431373, 1, 0, 1,
-0.935275, 0.511342, -1.896253, 0.8352941, 1, 0, 1,
-0.9347827, 0.3387749, -1.648374, 0.8313726, 1, 0, 1,
-0.9338017, 0.07111703, -2.463794, 0.8235294, 1, 0, 1,
-0.9312041, -0.8471805, -0.2728659, 0.8196079, 1, 0, 1,
-0.9308278, -0.5824427, -1.090086, 0.8117647, 1, 0, 1,
-0.923479, -0.1354834, -1.257405, 0.8078431, 1, 0, 1,
-0.9164997, 0.9308626, -1.902929, 0.8, 1, 0, 1,
-0.9115887, 0.2453226, -1.401846, 0.7921569, 1, 0, 1,
-0.9102846, -0.1333177, -3.744474, 0.7882353, 1, 0, 1,
-0.9006098, 0.9724258, -1.622529, 0.7803922, 1, 0, 1,
-0.8952501, 0.03574856, -2.67646, 0.7764706, 1, 0, 1,
-0.8902761, -0.7771237, -3.023863, 0.7686275, 1, 0, 1,
-0.889063, -1.378754, -3.848592, 0.7647059, 1, 0, 1,
-0.8882892, -1.444479, -2.406981, 0.7568628, 1, 0, 1,
-0.8859135, 1.191911, -2.237329, 0.7529412, 1, 0, 1,
-0.8837585, 0.4931458, 0.01210343, 0.7450981, 1, 0, 1,
-0.88016, 0.9227632, -2.432521, 0.7411765, 1, 0, 1,
-0.8743712, -0.06519747, -2.088769, 0.7333333, 1, 0, 1,
-0.8697565, -0.1943188, -0.5957727, 0.7294118, 1, 0, 1,
-0.8633012, 0.2555352, -0.4520567, 0.7215686, 1, 0, 1,
-0.8621674, -0.1063651, -0.7673641, 0.7176471, 1, 0, 1,
-0.8617148, -0.4297742, -0.4223315, 0.7098039, 1, 0, 1,
-0.8576565, 0.9590868, -0.659322, 0.7058824, 1, 0, 1,
-0.8541645, -1.565254, -2.532426, 0.6980392, 1, 0, 1,
-0.8535312, -0.4706011, -1.403861, 0.6901961, 1, 0, 1,
-0.8496679, 0.5467995, -2.09026, 0.6862745, 1, 0, 1,
-0.8489718, -0.8407696, -1.555023, 0.6784314, 1, 0, 1,
-0.8488483, 0.558454, -0.76391, 0.6745098, 1, 0, 1,
-0.8445526, -0.4372004, -2.10274, 0.6666667, 1, 0, 1,
-0.8329943, 0.711385, -1.199696, 0.6627451, 1, 0, 1,
-0.8219917, 0.9057135, 0.2400131, 0.654902, 1, 0, 1,
-0.8200748, -0.279139, -1.889736, 0.6509804, 1, 0, 1,
-0.8200071, -1.259489, -3.75492, 0.6431373, 1, 0, 1,
-0.8136258, 0.1825809, 0.1635629, 0.6392157, 1, 0, 1,
-0.811856, -1.312982, -1.604559, 0.6313726, 1, 0, 1,
-0.8079503, 0.03375614, -0.3580812, 0.627451, 1, 0, 1,
-0.7947783, 0.004443713, -0.8028352, 0.6196079, 1, 0, 1,
-0.7934685, -1.068427, -2.509652, 0.6156863, 1, 0, 1,
-0.7930145, -0.07568123, -4.156925, 0.6078432, 1, 0, 1,
-0.7926099, 3.109825, 1.303995, 0.6039216, 1, 0, 1,
-0.7915391, -0.7467943, -2.390967, 0.5960785, 1, 0, 1,
-0.7878407, 0.7707427, -1.415902, 0.5882353, 1, 0, 1,
-0.7866272, -0.1292035, -1.146509, 0.5843138, 1, 0, 1,
-0.7847031, 0.6343026, -0.1585634, 0.5764706, 1, 0, 1,
-0.7788056, -0.007093783, -1.587894, 0.572549, 1, 0, 1,
-0.7764603, -0.6310211, -3.966262, 0.5647059, 1, 0, 1,
-0.7756559, 0.2426726, -0.2075203, 0.5607843, 1, 0, 1,
-0.7723867, 0.2870021, -0.5596932, 0.5529412, 1, 0, 1,
-0.7707543, -0.1560649, -3.189119, 0.5490196, 1, 0, 1,
-0.7703853, -1.014379, -2.275744, 0.5411765, 1, 0, 1,
-0.7698079, 2.53946, -0.4953427, 0.5372549, 1, 0, 1,
-0.7591527, 1.27397, -2.103313, 0.5294118, 1, 0, 1,
-0.752463, -1.158717, -2.077702, 0.5254902, 1, 0, 1,
-0.7503415, -0.2291499, -2.220781, 0.5176471, 1, 0, 1,
-0.7485754, -0.1338623, -1.615349, 0.5137255, 1, 0, 1,
-0.7480255, -0.9135517, -2.028717, 0.5058824, 1, 0, 1,
-0.7441962, -1.050541, -0.7980742, 0.5019608, 1, 0, 1,
-0.7398833, 1.172721, 0.007425086, 0.4941176, 1, 0, 1,
-0.7368942, 0.5191613, -3.519894, 0.4862745, 1, 0, 1,
-0.7288094, -0.08176305, -0.5270282, 0.4823529, 1, 0, 1,
-0.7246734, -0.1158918, -2.151657, 0.4745098, 1, 0, 1,
-0.7206378, 1.168456, -0.02639228, 0.4705882, 1, 0, 1,
-0.7176679, 1.124048, 0.02415114, 0.4627451, 1, 0, 1,
-0.6963136, -0.4237119, -0.4392765, 0.4588235, 1, 0, 1,
-0.6960067, -0.04041354, -0.5491567, 0.4509804, 1, 0, 1,
-0.69383, -2.52385, -2.447711, 0.4470588, 1, 0, 1,
-0.6930842, 0.6324094, 0.4238867, 0.4392157, 1, 0, 1,
-0.6906122, -0.7023575, -3.410056, 0.4352941, 1, 0, 1,
-0.6887442, 1.303768, -2.5872, 0.427451, 1, 0, 1,
-0.6881739, -1.236761, -0.5472621, 0.4235294, 1, 0, 1,
-0.6854575, -0.4361241, -1.724334, 0.4156863, 1, 0, 1,
-0.6728028, 0.3794794, -2.130491, 0.4117647, 1, 0, 1,
-0.6698195, -0.6932324, -1.187799, 0.4039216, 1, 0, 1,
-0.6684881, -0.3102459, -2.56838, 0.3960784, 1, 0, 1,
-0.6671097, -0.3435948, -3.517416, 0.3921569, 1, 0, 1,
-0.6631854, -0.6844128, -3.177186, 0.3843137, 1, 0, 1,
-0.6595659, -0.9817705, -2.236889, 0.3803922, 1, 0, 1,
-0.656217, -2.112296, -2.839723, 0.372549, 1, 0, 1,
-0.6530702, -1.915521, -2.78023, 0.3686275, 1, 0, 1,
-0.6444641, 0.5476228, -0.7141445, 0.3607843, 1, 0, 1,
-0.6421333, -1.434879, -3.657643, 0.3568628, 1, 0, 1,
-0.6414852, -0.5535891, -3.101601, 0.3490196, 1, 0, 1,
-0.6313372, -0.2000873, -2.295244, 0.345098, 1, 0, 1,
-0.6280797, 0.5989797, -0.4452834, 0.3372549, 1, 0, 1,
-0.6275789, 1.351327, -1.233844, 0.3333333, 1, 0, 1,
-0.6240882, 1.050893, -1.492023, 0.3254902, 1, 0, 1,
-0.6222017, -0.3761049, -2.882574, 0.3215686, 1, 0, 1,
-0.6158702, 1.749094, -0.6897477, 0.3137255, 1, 0, 1,
-0.6145483, 0.1713188, -0.9532777, 0.3098039, 1, 0, 1,
-0.613336, -0.5890946, -2.785774, 0.3019608, 1, 0, 1,
-0.6112868, -0.1210705, -2.921485, 0.2941177, 1, 0, 1,
-0.610097, 0.2443455, -0.8305523, 0.2901961, 1, 0, 1,
-0.6097242, -0.4566047, -2.49831, 0.282353, 1, 0, 1,
-0.606796, 0.9137954, -2.200943, 0.2784314, 1, 0, 1,
-0.6051485, 0.1092208, -0.9529098, 0.2705882, 1, 0, 1,
-0.6048971, 0.524813, -1.826661, 0.2666667, 1, 0, 1,
-0.5918212, -1.251096, -0.3889641, 0.2588235, 1, 0, 1,
-0.5912635, 0.6011662, -0.06246743, 0.254902, 1, 0, 1,
-0.5891127, 2.018897, -1.61436, 0.2470588, 1, 0, 1,
-0.5873663, -1.253233, -1.89229, 0.2431373, 1, 0, 1,
-0.587238, 1.841084, 0.9675248, 0.2352941, 1, 0, 1,
-0.5819143, -0.2712127, -0.6556696, 0.2313726, 1, 0, 1,
-0.5788445, 1.472005, -1.479487, 0.2235294, 1, 0, 1,
-0.575055, 0.5525684, -3.742522, 0.2196078, 1, 0, 1,
-0.5734326, -1.318849, -3.156668, 0.2117647, 1, 0, 1,
-0.5717524, -0.2536515, -1.465261, 0.2078431, 1, 0, 1,
-0.570576, 0.03619466, -1.741749, 0.2, 1, 0, 1,
-0.5585271, 0.5337268, -1.250352, 0.1921569, 1, 0, 1,
-0.5566657, -1.052526, -3.495167, 0.1882353, 1, 0, 1,
-0.5535049, -0.6103023, -2.63389, 0.1803922, 1, 0, 1,
-0.5512251, 0.8968595, -0.3725262, 0.1764706, 1, 0, 1,
-0.5511539, 0.1939443, -0.9605499, 0.1686275, 1, 0, 1,
-0.5456586, -0.37603, -3.10715, 0.1647059, 1, 0, 1,
-0.5440027, -0.4873164, -1.631773, 0.1568628, 1, 0, 1,
-0.5380533, -0.7861958, -1.831572, 0.1529412, 1, 0, 1,
-0.5354984, -1.353063, -3.469239, 0.145098, 1, 0, 1,
-0.533334, -0.3612553, -1.74621, 0.1411765, 1, 0, 1,
-0.52717, -0.6341465, -1.02945, 0.1333333, 1, 0, 1,
-0.5269725, -1.361859, -3.880327, 0.1294118, 1, 0, 1,
-0.5235921, -0.5028054, -1.597955, 0.1215686, 1, 0, 1,
-0.5235585, -0.5672612, -2.501264, 0.1176471, 1, 0, 1,
-0.5231, -1.531096, -2.833508, 0.1098039, 1, 0, 1,
-0.5230364, 0.1270483, -1.165412, 0.1058824, 1, 0, 1,
-0.5189657, 1.15072, 0.4617151, 0.09803922, 1, 0, 1,
-0.5132518, -0.027638, -2.294196, 0.09019608, 1, 0, 1,
-0.511973, 0.1699661, -1.238926, 0.08627451, 1, 0, 1,
-0.5112345, 0.3069893, -2.034228, 0.07843138, 1, 0, 1,
-0.5107318, -0.1696775, -1.044538, 0.07450981, 1, 0, 1,
-0.509758, 0.1449066, -1.469259, 0.06666667, 1, 0, 1,
-0.5091213, -0.1555005, -1.531984, 0.0627451, 1, 0, 1,
-0.5076929, -2.885606, -2.904114, 0.05490196, 1, 0, 1,
-0.4978266, -2.033295, -3.806337, 0.05098039, 1, 0, 1,
-0.4976794, -0.2975093, -2.103266, 0.04313726, 1, 0, 1,
-0.4968875, 0.1156453, -0.9477265, 0.03921569, 1, 0, 1,
-0.491034, 0.8123184, 0.8797767, 0.03137255, 1, 0, 1,
-0.4904172, -2.036382, -2.267415, 0.02745098, 1, 0, 1,
-0.4897243, 0.3882674, -0.2121498, 0.01960784, 1, 0, 1,
-0.4835908, -0.0766487, -1.338749, 0.01568628, 1, 0, 1,
-0.4832428, 0.2730991, -2.712595, 0.007843138, 1, 0, 1,
-0.4815769, 1.367059, -0.0143734, 0.003921569, 1, 0, 1,
-0.4798484, -0.3422285, -1.854678, 0, 1, 0.003921569, 1,
-0.478465, -1.273963, -3.206723, 0, 1, 0.01176471, 1,
-0.4738695, 0.2393134, -1.724706, 0, 1, 0.01568628, 1,
-0.471204, -1.825515, -1.905168, 0, 1, 0.02352941, 1,
-0.4698201, 0.05067678, -2.269523, 0, 1, 0.02745098, 1,
-0.465839, 1.76157, -0.09507009, 0, 1, 0.03529412, 1,
-0.4647116, 0.9033623, 0.1465137, 0, 1, 0.03921569, 1,
-0.4626056, 0.2491386, -1.936513, 0, 1, 0.04705882, 1,
-0.4611723, -1.49204, -2.000915, 0, 1, 0.05098039, 1,
-0.4475684, 1.962658, -0.3240802, 0, 1, 0.05882353, 1,
-0.4450469, 1.037386, -0.8112752, 0, 1, 0.0627451, 1,
-0.4420952, 0.4391684, 0.144672, 0, 1, 0.07058824, 1,
-0.4416946, -1.169689, -2.617882, 0, 1, 0.07450981, 1,
-0.4325665, -0.1430097, -2.889226, 0, 1, 0.08235294, 1,
-0.4295249, 1.436427, -1.357826, 0, 1, 0.08627451, 1,
-0.4218322, -2.152249, -2.585794, 0, 1, 0.09411765, 1,
-0.4183966, -2.280192, -3.89281, 0, 1, 0.1019608, 1,
-0.4151459, 1.034676, 1.124019, 0, 1, 0.1058824, 1,
-0.4098532, 1.287653, 0.2867487, 0, 1, 0.1137255, 1,
-0.3998742, 1.166848, 0.695557, 0, 1, 0.1176471, 1,
-0.398069, 0.7724314, -1.248603, 0, 1, 0.1254902, 1,
-0.3964776, 2.055459, -1.444152, 0, 1, 0.1294118, 1,
-0.3944498, -0.6932821, -3.303225, 0, 1, 0.1372549, 1,
-0.3940527, -0.1640255, -2.332898, 0, 1, 0.1411765, 1,
-0.3931431, 0.797254, -2.525225, 0, 1, 0.1490196, 1,
-0.3897928, 0.9496506, 0.3068954, 0, 1, 0.1529412, 1,
-0.3867859, -0.4406708, -1.273169, 0, 1, 0.1607843, 1,
-0.38677, -0.2948289, -2.647787, 0, 1, 0.1647059, 1,
-0.386321, -0.2549865, -0.7551397, 0, 1, 0.172549, 1,
-0.384544, 2.182171, -0.1484163, 0, 1, 0.1764706, 1,
-0.3844283, -0.9013672, -2.075871, 0, 1, 0.1843137, 1,
-0.384377, 0.05196971, -0.3145203, 0, 1, 0.1882353, 1,
-0.3836919, -0.3961565, -1.296003, 0, 1, 0.1960784, 1,
-0.3819112, -0.208091, -2.820956, 0, 1, 0.2039216, 1,
-0.3799851, 0.6015289, -2.22785, 0, 1, 0.2078431, 1,
-0.3775291, 0.733147, 0.4936897, 0, 1, 0.2156863, 1,
-0.3773376, 1.704116, -0.008566048, 0, 1, 0.2196078, 1,
-0.375085, -0.9569991, -1.082545, 0, 1, 0.227451, 1,
-0.3703269, -1.939633, -1.624771, 0, 1, 0.2313726, 1,
-0.3617787, -1.014058, -2.031958, 0, 1, 0.2392157, 1,
-0.3598211, 0.9217786, -0.01866557, 0, 1, 0.2431373, 1,
-0.359473, -1.12292, -1.801777, 0, 1, 0.2509804, 1,
-0.356864, -0.1240414, -2.050605, 0, 1, 0.254902, 1,
-0.3548897, 0.7700634, -0.3825717, 0, 1, 0.2627451, 1,
-0.3467439, 0.1260517, -0.4541164, 0, 1, 0.2666667, 1,
-0.343722, 1.294338, -0.4218496, 0, 1, 0.2745098, 1,
-0.3432407, 0.5983956, 1.709675, 0, 1, 0.2784314, 1,
-0.3424087, -0.0352472, -2.083582, 0, 1, 0.2862745, 1,
-0.333703, -0.09717519, -2.464635, 0, 1, 0.2901961, 1,
-0.3323684, -0.5696688, -1.572133, 0, 1, 0.2980392, 1,
-0.3257354, 0.4114831, 0.04094484, 0, 1, 0.3058824, 1,
-0.3255869, -0.4575426, -0.3633749, 0, 1, 0.3098039, 1,
-0.3248867, -1.068191, -3.419049, 0, 1, 0.3176471, 1,
-0.3173418, -0.3003931, -3.568441, 0, 1, 0.3215686, 1,
-0.3158726, -1.253372, -2.710531, 0, 1, 0.3294118, 1,
-0.3153977, 1.049464, -1.19439, 0, 1, 0.3333333, 1,
-0.3132262, -0.4660511, -2.576018, 0, 1, 0.3411765, 1,
-0.3095111, 0.6303357, -0.0228098, 0, 1, 0.345098, 1,
-0.3052251, 1.69904, 0.06448732, 0, 1, 0.3529412, 1,
-0.3026435, -1.260543, -3.687721, 0, 1, 0.3568628, 1,
-0.3021584, -1.383931, -2.574014, 0, 1, 0.3647059, 1,
-0.3001239, 0.1326764, 0.2745838, 0, 1, 0.3686275, 1,
-0.298526, 0.4661329, -2.255496, 0, 1, 0.3764706, 1,
-0.2962082, 0.2766295, -0.2721507, 0, 1, 0.3803922, 1,
-0.2948015, 1.331717, 0.4571659, 0, 1, 0.3882353, 1,
-0.2913919, -0.6561855, -2.738078, 0, 1, 0.3921569, 1,
-0.2865701, 0.8523507, 0.3089367, 0, 1, 0.4, 1,
-0.2836207, 3.319779, 0.3769921, 0, 1, 0.4078431, 1,
-0.2714113, 0.4606087, 0.5452527, 0, 1, 0.4117647, 1,
-0.2556849, -1.047871, -3.132153, 0, 1, 0.4196078, 1,
-0.2540064, 0.07469386, -0.4740223, 0, 1, 0.4235294, 1,
-0.242489, 1.520194, -1.79635, 0, 1, 0.4313726, 1,
-0.2341969, -0.5710989, -2.913538, 0, 1, 0.4352941, 1,
-0.2325282, -1.326592, -3.215606, 0, 1, 0.4431373, 1,
-0.2321144, 0.001096822, -2.112477, 0, 1, 0.4470588, 1,
-0.2319369, 2.283538, 0.2044402, 0, 1, 0.454902, 1,
-0.2250558, 2.755306, 0.7272891, 0, 1, 0.4588235, 1,
-0.2159234, -0.1803725, -1.349503, 0, 1, 0.4666667, 1,
-0.2155012, -0.2690982, -1.57486, 0, 1, 0.4705882, 1,
-0.2151235, 1.27541, 0.4333517, 0, 1, 0.4784314, 1,
-0.2079024, -1.203263, -2.005165, 0, 1, 0.4823529, 1,
-0.2037296, -1.141546, -2.572464, 0, 1, 0.4901961, 1,
-0.2014055, 0.7001083, -1.115773, 0, 1, 0.4941176, 1,
-0.1947639, -0.1608005, -2.169935, 0, 1, 0.5019608, 1,
-0.1910318, -0.01292438, -0.5819199, 0, 1, 0.509804, 1,
-0.186915, 1.263675, 0.1276664, 0, 1, 0.5137255, 1,
-0.1860099, 0.3060636, -0.52184, 0, 1, 0.5215687, 1,
-0.1840867, -2.195462, -2.173779, 0, 1, 0.5254902, 1,
-0.1839825, 1.436061, 1.156334, 0, 1, 0.5333334, 1,
-0.1833039, 1.328703, 0.5451978, 0, 1, 0.5372549, 1,
-0.1823253, 0.2212119, -0.909595, 0, 1, 0.5450981, 1,
-0.1815853, 0.1757182, 0.1271679, 0, 1, 0.5490196, 1,
-0.180748, 0.3238281, -2.043649, 0, 1, 0.5568628, 1,
-0.1804176, -1.422554, -3.809055, 0, 1, 0.5607843, 1,
-0.1763372, 0.5099589, -0.4160117, 0, 1, 0.5686275, 1,
-0.1755431, 0.1007779, -1.59366, 0, 1, 0.572549, 1,
-0.1739013, -0.1941079, -2.808494, 0, 1, 0.5803922, 1,
-0.1670846, -0.749593, -4.237438, 0, 1, 0.5843138, 1,
-0.165996, -0.7654496, -1.654948, 0, 1, 0.5921569, 1,
-0.1630036, -0.6329295, -3.800169, 0, 1, 0.5960785, 1,
-0.1607255, -1.472974, -4.150247, 0, 1, 0.6039216, 1,
-0.1566078, 0.7655125, 0.925625, 0, 1, 0.6117647, 1,
-0.1452859, -1.768203, -4.424379, 0, 1, 0.6156863, 1,
-0.144834, 0.9597563, 0.02830418, 0, 1, 0.6235294, 1,
-0.1445178, -0.5431885, -3.97153, 0, 1, 0.627451, 1,
-0.1338739, 2.070649, 0.7046444, 0, 1, 0.6352941, 1,
-0.1256254, 0.2481604, -0.9537718, 0, 1, 0.6392157, 1,
-0.1247857, 0.7146168, -1.670191, 0, 1, 0.6470588, 1,
-0.1234948, 0.3948515, 0.4618747, 0, 1, 0.6509804, 1,
-0.1176026, -0.9229363, -2.966617, 0, 1, 0.6588235, 1,
-0.1146545, -1.246008, -2.459494, 0, 1, 0.6627451, 1,
-0.1143646, 1.17574, -0.7925792, 0, 1, 0.6705883, 1,
-0.1059052, 0.6341708, -0.1167162, 0, 1, 0.6745098, 1,
-0.1050447, 0.6287584, -0.2979476, 0, 1, 0.682353, 1,
-0.1008235, -0.6231782, -1.224874, 0, 1, 0.6862745, 1,
-0.09941339, -0.1271264, -1.461791, 0, 1, 0.6941177, 1,
-0.09411041, 1.002713, -1.481848, 0, 1, 0.7019608, 1,
-0.09359691, 0.692358, -0.5630104, 0, 1, 0.7058824, 1,
-0.09356587, -2.16447, -3.295177, 0, 1, 0.7137255, 1,
-0.0906064, -0.145916, -3.916467, 0, 1, 0.7176471, 1,
-0.09011674, -1.904962, -3.125428, 0, 1, 0.7254902, 1,
-0.08949942, 0.01203814, 0.05873612, 0, 1, 0.7294118, 1,
-0.08894068, -0.8881087, -1.909856, 0, 1, 0.7372549, 1,
-0.08877471, -1.147604, -5.512484, 0, 1, 0.7411765, 1,
-0.08817332, 1.538328, 1.527289, 0, 1, 0.7490196, 1,
-0.08590215, -0.4735374, -4.955419, 0, 1, 0.7529412, 1,
-0.08228442, -0.1448857, -3.290065, 0, 1, 0.7607843, 1,
-0.08212448, -0.9474021, -2.758434, 0, 1, 0.7647059, 1,
-0.07999416, 0.3138738, -0.6559809, 0, 1, 0.772549, 1,
-0.07572995, -0.9814269, -2.769, 0, 1, 0.7764706, 1,
-0.07481483, -0.02319468, 0.4986049, 0, 1, 0.7843137, 1,
-0.07223388, 0.1584172, -0.5302199, 0, 1, 0.7882353, 1,
-0.06728358, 0.2326762, 1.115938, 0, 1, 0.7960784, 1,
-0.0643258, 0.3597489, -0.04452447, 0, 1, 0.8039216, 1,
-0.06106292, -0.75669, -2.154517, 0, 1, 0.8078431, 1,
-0.05806787, 1.325715, 0.6309158, 0, 1, 0.8156863, 1,
-0.0543219, 1.367586, -0.1134276, 0, 1, 0.8196079, 1,
-0.05424282, -0.9664668, -4.008783, 0, 1, 0.827451, 1,
-0.05080444, 0.002615565, -0.9984615, 0, 1, 0.8313726, 1,
-0.04927773, 0.2839735, 1.713331, 0, 1, 0.8392157, 1,
-0.04836587, 0.7415678, -1.044521, 0, 1, 0.8431373, 1,
-0.04704677, 0.5852662, 1.139087, 0, 1, 0.8509804, 1,
-0.04603672, 0.2660807, 0.6725187, 0, 1, 0.854902, 1,
-0.04254925, 0.1041864, -0.9202973, 0, 1, 0.8627451, 1,
-0.04179586, 0.1364658, -1.845654, 0, 1, 0.8666667, 1,
-0.0400088, -1.361041, -3.22708, 0, 1, 0.8745098, 1,
-0.03911671, 0.5148283, 0.1451412, 0, 1, 0.8784314, 1,
-0.0260444, 0.05464201, -0.3889275, 0, 1, 0.8862745, 1,
-0.02006441, 0.197705, -0.5375478, 0, 1, 0.8901961, 1,
-0.0182834, 0.6063042, -0.357665, 0, 1, 0.8980392, 1,
-0.01181756, 0.08442367, -0.0341332, 0, 1, 0.9058824, 1,
-0.01030371, 0.4223775, -1.130303, 0, 1, 0.9098039, 1,
-0.008637204, -0.2795302, -3.645227, 0, 1, 0.9176471, 1,
-0.004569411, 0.03888187, 0.5545391, 0, 1, 0.9215686, 1,
-0.003181647, 0.04963313, 0.7838669, 0, 1, 0.9294118, 1,
-0.001787245, 1.341671, -0.09101097, 0, 1, 0.9333333, 1,
0.001094676, 0.9325728, -0.9661593, 0, 1, 0.9411765, 1,
0.001721304, 0.2065296, -0.6018108, 0, 1, 0.945098, 1,
0.003512416, -0.5127932, 3.219471, 0, 1, 0.9529412, 1,
0.005058453, -0.2067885, 3.661003, 0, 1, 0.9568627, 1,
0.005838832, 1.193209, 0.7719257, 0, 1, 0.9647059, 1,
0.008319192, -0.9330813, 0.8864902, 0, 1, 0.9686275, 1,
0.01103276, 0.9107175, -0.1909612, 0, 1, 0.9764706, 1,
0.01186258, -0.09049504, 3.0007, 0, 1, 0.9803922, 1,
0.01240899, -0.785785, 1.798322, 0, 1, 0.9882353, 1,
0.01347271, 2.022517, 1.744833, 0, 1, 0.9921569, 1,
0.01407742, 0.73456, 0.9762619, 0, 1, 1, 1,
0.01426938, 1.373523, -1.071477, 0, 0.9921569, 1, 1,
0.01570843, 0.7629542, 1.494868, 0, 0.9882353, 1, 1,
0.01759106, -0.9323806, 1.829021, 0, 0.9803922, 1, 1,
0.01798014, -0.2429572, 4.639521, 0, 0.9764706, 1, 1,
0.03329387, 1.171392, -0.053727, 0, 0.9686275, 1, 1,
0.04493795, 1.11666, 1.976817, 0, 0.9647059, 1, 1,
0.04786417, -0.1776879, 1.960725, 0, 0.9568627, 1, 1,
0.04830887, -0.5191997, 3.148396, 0, 0.9529412, 1, 1,
0.04844603, 0.8040898, -0.3962293, 0, 0.945098, 1, 1,
0.05096377, -0.6032965, 3.07197, 0, 0.9411765, 1, 1,
0.05615634, 0.875427, -1.181754, 0, 0.9333333, 1, 1,
0.05679033, -0.2551596, 3.393617, 0, 0.9294118, 1, 1,
0.05773171, 1.056418, 0.7831799, 0, 0.9215686, 1, 1,
0.05901159, -1.47288, 1.120816, 0, 0.9176471, 1, 1,
0.06322371, -0.9571537, 7.338465, 0, 0.9098039, 1, 1,
0.06391116, 0.3796329, 0.6918517, 0, 0.9058824, 1, 1,
0.0712632, 0.296831, -0.1789559, 0, 0.8980392, 1, 1,
0.07241502, 1.201906, -0.8523383, 0, 0.8901961, 1, 1,
0.07592653, -0.662461, 3.251267, 0, 0.8862745, 1, 1,
0.07725319, 0.7588324, 1.089462, 0, 0.8784314, 1, 1,
0.07738402, -0.04237835, 2.703348, 0, 0.8745098, 1, 1,
0.07879104, 0.4397261, -0.3811846, 0, 0.8666667, 1, 1,
0.1028031, 0.06447912, 1.161715, 0, 0.8627451, 1, 1,
0.1091949, -0.1419587, 1.783548, 0, 0.854902, 1, 1,
0.1129366, -0.6019201, 1.822193, 0, 0.8509804, 1, 1,
0.1162619, 1.514046, -0.1116055, 0, 0.8431373, 1, 1,
0.1206058, 0.3415983, 0.523827, 0, 0.8392157, 1, 1,
0.1242792, 0.4468841, 0.6550218, 0, 0.8313726, 1, 1,
0.1278908, 1.08337, -0.7561941, 0, 0.827451, 1, 1,
0.1322725, -0.3025426, 2.781783, 0, 0.8196079, 1, 1,
0.1338016, 0.2936988, 1.986408, 0, 0.8156863, 1, 1,
0.1381517, 0.61356, -0.2158863, 0, 0.8078431, 1, 1,
0.1451958, 0.0539097, 0.8279014, 0, 0.8039216, 1, 1,
0.1454694, 2.210631, 0.8419237, 0, 0.7960784, 1, 1,
0.1493802, -0.3672538, -0.446889, 0, 0.7882353, 1, 1,
0.1494499, 0.5478711, -0.1026072, 0, 0.7843137, 1, 1,
0.1499308, -1.360202, 1.513554, 0, 0.7764706, 1, 1,
0.1515985, 1.099212, -2.227571, 0, 0.772549, 1, 1,
0.1523137, 0.4358802, 0.5492518, 0, 0.7647059, 1, 1,
0.1533062, 1.120989, 1.568386, 0, 0.7607843, 1, 1,
0.1542951, -0.1277162, 2.916307, 0, 0.7529412, 1, 1,
0.155784, -0.221569, 2.031247, 0, 0.7490196, 1, 1,
0.1562304, -1.937531, 2.592505, 0, 0.7411765, 1, 1,
0.1627123, -0.4273591, 2.137581, 0, 0.7372549, 1, 1,
0.1667344, 2.061547, -0.4184905, 0, 0.7294118, 1, 1,
0.1668836, 1.833779, 0.05388496, 0, 0.7254902, 1, 1,
0.1678031, 0.1952591, 1.724185, 0, 0.7176471, 1, 1,
0.1688951, 0.6543872, 0.5198882, 0, 0.7137255, 1, 1,
0.1698205, 0.6555761, -0.4714491, 0, 0.7058824, 1, 1,
0.172132, 2.065322, 0.5487491, 0, 0.6980392, 1, 1,
0.172906, 1.04114, 0.7886313, 0, 0.6941177, 1, 1,
0.1729324, 0.01772388, 2.048394, 0, 0.6862745, 1, 1,
0.1753226, 2.175224, 0.04715737, 0, 0.682353, 1, 1,
0.1857726, 0.3313095, 0.4996021, 0, 0.6745098, 1, 1,
0.1905585, 0.8495111, -0.7387987, 0, 0.6705883, 1, 1,
0.1906681, 2.712099, 0.6239223, 0, 0.6627451, 1, 1,
0.1916861, -0.1569616, 2.109517, 0, 0.6588235, 1, 1,
0.1977469, 0.1052506, 2.455436, 0, 0.6509804, 1, 1,
0.1981051, -0.06199415, 3.076371, 0, 0.6470588, 1, 1,
0.198962, -0.5277658, 3.539056, 0, 0.6392157, 1, 1,
0.2016446, -0.9839672, 1.92057, 0, 0.6352941, 1, 1,
0.2017495, 1.173758, -0.6993613, 0, 0.627451, 1, 1,
0.2017538, 0.931077, -1.550332, 0, 0.6235294, 1, 1,
0.2034557, -0.6624271, 2.266088, 0, 0.6156863, 1, 1,
0.2126611, -0.7142889, 3.04047, 0, 0.6117647, 1, 1,
0.2138245, 1.320755, -1.712438, 0, 0.6039216, 1, 1,
0.2143397, -1.877248, 3.685697, 0, 0.5960785, 1, 1,
0.2213677, -0.3726355, 2.0279, 0, 0.5921569, 1, 1,
0.222892, -0.0826962, 0.9016732, 0, 0.5843138, 1, 1,
0.2243449, 0.9716148, 1.272628, 0, 0.5803922, 1, 1,
0.2302309, 1.734801, 0.7477862, 0, 0.572549, 1, 1,
0.2312344, 1.095413, 0.2992197, 0, 0.5686275, 1, 1,
0.2314284, 1.727635, -1.151682, 0, 0.5607843, 1, 1,
0.241569, 0.8169211, 1.809822, 0, 0.5568628, 1, 1,
0.2421496, 0.2604511, 0.6619601, 0, 0.5490196, 1, 1,
0.2441374, -0.5237953, 1.310482, 0, 0.5450981, 1, 1,
0.2458437, 0.8389789, -1.352891, 0, 0.5372549, 1, 1,
0.2461886, -0.8331292, 2.007394, 0, 0.5333334, 1, 1,
0.250281, 0.4740634, 0.8220941, 0, 0.5254902, 1, 1,
0.2508782, -0.3123835, 3.93406, 0, 0.5215687, 1, 1,
0.2540075, 0.6498191, 0.7541569, 0, 0.5137255, 1, 1,
0.2559238, 0.2819102, -0.03186096, 0, 0.509804, 1, 1,
0.2577765, 0.8605489, 1.190681, 0, 0.5019608, 1, 1,
0.2585016, -0.4951965, 2.001645, 0, 0.4941176, 1, 1,
0.2658392, -0.01453966, 2.393628, 0, 0.4901961, 1, 1,
0.2699296, 0.5145724, 1.299997, 0, 0.4823529, 1, 1,
0.2719113, 0.3356402, 0.8064405, 0, 0.4784314, 1, 1,
0.27241, -0.2417682, 3.461296, 0, 0.4705882, 1, 1,
0.2737496, 2.55962, -1.05058, 0, 0.4666667, 1, 1,
0.2761675, 0.4646031, 1.582232, 0, 0.4588235, 1, 1,
0.2807729, -0.4756759, 2.274297, 0, 0.454902, 1, 1,
0.283249, 1.214116, 0.2593059, 0, 0.4470588, 1, 1,
0.2836716, -0.1390383, 3.544847, 0, 0.4431373, 1, 1,
0.2847038, 0.07707155, 1.005222, 0, 0.4352941, 1, 1,
0.2848765, 0.184741, 0.5271366, 0, 0.4313726, 1, 1,
0.2852812, 0.00291346, 2.211507, 0, 0.4235294, 1, 1,
0.2886587, -0.4421213, 2.955771, 0, 0.4196078, 1, 1,
0.2930878, -0.1725557, 2.612645, 0, 0.4117647, 1, 1,
0.2965164, -1.93191, 4.142417, 0, 0.4078431, 1, 1,
0.2987953, -2.845112, 2.275607, 0, 0.4, 1, 1,
0.3019505, 0.479336, 0.06098999, 0, 0.3921569, 1, 1,
0.3026623, -0.2927615, 1.863225, 0, 0.3882353, 1, 1,
0.3134288, -1.678522, 2.612914, 0, 0.3803922, 1, 1,
0.3215558, 0.9158694, 0.5990669, 0, 0.3764706, 1, 1,
0.3220088, -0.2052679, 1.049305, 0, 0.3686275, 1, 1,
0.3254828, -0.1943424, 2.107925, 0, 0.3647059, 1, 1,
0.3264185, -1.504941, 1.901521, 0, 0.3568628, 1, 1,
0.3269033, 1.45963, 2.030867, 0, 0.3529412, 1, 1,
0.3269309, 0.1204193, -1.131115, 0, 0.345098, 1, 1,
0.3291079, -0.3411878, 2.108898, 0, 0.3411765, 1, 1,
0.33228, 0.4698035, 1.151339, 0, 0.3333333, 1, 1,
0.3381716, -1.776851, 3.262968, 0, 0.3294118, 1, 1,
0.3420856, 0.8314899, 1.030703, 0, 0.3215686, 1, 1,
0.3443605, 0.6002609, 1.182382, 0, 0.3176471, 1, 1,
0.3447438, -1.134533, 1.820074, 0, 0.3098039, 1, 1,
0.3449871, 2.350645, 0.3373858, 0, 0.3058824, 1, 1,
0.355286, -1.604372, 2.767197, 0, 0.2980392, 1, 1,
0.3572168, 0.3106266, -0.2583956, 0, 0.2901961, 1, 1,
0.3585746, 1.234498, -0.5459788, 0, 0.2862745, 1, 1,
0.35938, 1.256638, -1.377116, 0, 0.2784314, 1, 1,
0.3598686, -0.4806255, 1.905669, 0, 0.2745098, 1, 1,
0.3604661, 1.663182, -0.6435742, 0, 0.2666667, 1, 1,
0.362693, -2.147568, 2.767683, 0, 0.2627451, 1, 1,
0.3627443, -2.001371, 3.176383, 0, 0.254902, 1, 1,
0.3660479, -0.3315587, 3.083427, 0, 0.2509804, 1, 1,
0.3690418, 1.760228, -0.09425347, 0, 0.2431373, 1, 1,
0.3710437, 1.030356, 1.469914, 0, 0.2392157, 1, 1,
0.3736986, -1.578923, 2.049361, 0, 0.2313726, 1, 1,
0.381551, 0.9108476, 0.6361946, 0, 0.227451, 1, 1,
0.3836193, -0.7044341, 0.9113904, 0, 0.2196078, 1, 1,
0.3893324, 1.377721, 1.132469, 0, 0.2156863, 1, 1,
0.3916564, 0.1205371, 1.55914, 0, 0.2078431, 1, 1,
0.3923669, -0.8051433, 2.416713, 0, 0.2039216, 1, 1,
0.4026783, 0.3836412, 1.810799, 0, 0.1960784, 1, 1,
0.4031658, -0.7280473, 2.795243, 0, 0.1882353, 1, 1,
0.4048775, -0.2520562, 1.969972, 0, 0.1843137, 1, 1,
0.4073332, 1.065423, -0.4374886, 0, 0.1764706, 1, 1,
0.4139287, 0.3854617, 0.7618342, 0, 0.172549, 1, 1,
0.4177972, -1.364406, 1.820297, 0, 0.1647059, 1, 1,
0.4231851, 0.6802328, 0.0009319174, 0, 0.1607843, 1, 1,
0.4279839, -0.1590145, 2.579974, 0, 0.1529412, 1, 1,
0.428338, 0.9937493, -0.1447981, 0, 0.1490196, 1, 1,
0.4360724, -0.8362173, 3.935459, 0, 0.1411765, 1, 1,
0.4377782, -0.2178497, 0.7286888, 0, 0.1372549, 1, 1,
0.4430361, -0.9705213, 2.672363, 0, 0.1294118, 1, 1,
0.4433181, -0.3229131, 4.189373, 0, 0.1254902, 1, 1,
0.4509885, -1.470631, 2.727465, 0, 0.1176471, 1, 1,
0.4513649, 0.3556475, 0.7205957, 0, 0.1137255, 1, 1,
0.4540522, 0.8226197, 0.358282, 0, 0.1058824, 1, 1,
0.4551226, -0.6335723, 2.079314, 0, 0.09803922, 1, 1,
0.4552362, 0.4255378, 2.075656, 0, 0.09411765, 1, 1,
0.4554372, -1.233896, 2.608559, 0, 0.08627451, 1, 1,
0.4595305, 0.6121296, -0.7348619, 0, 0.08235294, 1, 1,
0.4647919, 1.794706, -1.229906, 0, 0.07450981, 1, 1,
0.467321, -1.008285, 1.623057, 0, 0.07058824, 1, 1,
0.468605, -1.437741, 3.462214, 0, 0.0627451, 1, 1,
0.4687388, 1.27193, -0.1800973, 0, 0.05882353, 1, 1,
0.4764892, 0.8151445, 0.1834716, 0, 0.05098039, 1, 1,
0.4891494, 0.0817441, 2.204885, 0, 0.04705882, 1, 1,
0.4895809, -0.9262309, 1.942573, 0, 0.03921569, 1, 1,
0.4899225, 2.432626, -1.895844, 0, 0.03529412, 1, 1,
0.4936687, -0.6333904, 2.763516, 0, 0.02745098, 1, 1,
0.4957666, -1.319351, 4.030261, 0, 0.02352941, 1, 1,
0.4973432, -0.05596177, 0.746272, 0, 0.01568628, 1, 1,
0.4973929, 1.126451, 0.6166069, 0, 0.01176471, 1, 1,
0.503219, -0.1411541, 0.9459481, 0, 0.003921569, 1, 1,
0.5046068, -0.8961214, 2.410644, 0.003921569, 0, 1, 1,
0.504927, 0.2283888, 0.6392766, 0.007843138, 0, 1, 1,
0.5109283, -1.067858, 3.733779, 0.01568628, 0, 1, 1,
0.515051, 0.2701654, 0.1679525, 0.01960784, 0, 1, 1,
0.5163607, -1.387583, 1.147081, 0.02745098, 0, 1, 1,
0.5165809, 0.9390588, 2.687786, 0.03137255, 0, 1, 1,
0.5174007, -0.4775193, 1.339337, 0.03921569, 0, 1, 1,
0.5179701, 0.04449113, 1.264235, 0.04313726, 0, 1, 1,
0.5202544, 1.28494, 0.3399298, 0.05098039, 0, 1, 1,
0.5209216, 0.1617645, 2.103467, 0.05490196, 0, 1, 1,
0.5229715, -0.5039304, 1.344001, 0.0627451, 0, 1, 1,
0.52369, 0.1042236, 1.723307, 0.06666667, 0, 1, 1,
0.5267528, 0.1141239, 1.9123, 0.07450981, 0, 1, 1,
0.5291389, 0.582616, -0.1781449, 0.07843138, 0, 1, 1,
0.5322695, -0.007100251, 0.8179742, 0.08627451, 0, 1, 1,
0.532337, 1.26651, 0.4517495, 0.09019608, 0, 1, 1,
0.5327535, -1.233114, 1.622237, 0.09803922, 0, 1, 1,
0.5331911, -1.385589, 3.080136, 0.1058824, 0, 1, 1,
0.539638, -0.955352, 2.573277, 0.1098039, 0, 1, 1,
0.5422061, 0.1463985, 1.059728, 0.1176471, 0, 1, 1,
0.542844, 0.1156519, 1.8308, 0.1215686, 0, 1, 1,
0.5439059, 0.5036957, -0.814717, 0.1294118, 0, 1, 1,
0.5452257, -0.5358164, 3.280236, 0.1333333, 0, 1, 1,
0.5477087, -0.2719937, 2.702205, 0.1411765, 0, 1, 1,
0.5497911, 0.5595462, 0.5667886, 0.145098, 0, 1, 1,
0.5516739, -1.861312, 4.271088, 0.1529412, 0, 1, 1,
0.5525042, 0.6185704, 1.627832, 0.1568628, 0, 1, 1,
0.5525097, 0.8016396, 0.2860128, 0.1647059, 0, 1, 1,
0.5549331, 0.2553214, 1.82139, 0.1686275, 0, 1, 1,
0.5588776, 0.205243, 0.5348226, 0.1764706, 0, 1, 1,
0.5603307, 0.5153736, 1.416717, 0.1803922, 0, 1, 1,
0.5617626, -0.3594849, 2.457283, 0.1882353, 0, 1, 1,
0.5628232, 0.2705495, 0.5354427, 0.1921569, 0, 1, 1,
0.5645797, -0.6488096, 2.953197, 0.2, 0, 1, 1,
0.5673897, -1.003233, 3.978213, 0.2078431, 0, 1, 1,
0.5691723, -0.4915973, 1.667065, 0.2117647, 0, 1, 1,
0.5781074, 1.291721, -1.345899, 0.2196078, 0, 1, 1,
0.5782146, 0.3394763, 2.596763, 0.2235294, 0, 1, 1,
0.5794634, -0.4119158, 1.567119, 0.2313726, 0, 1, 1,
0.5812442, -0.3938906, 1.006078, 0.2352941, 0, 1, 1,
0.5868507, -0.5705135, 2.361527, 0.2431373, 0, 1, 1,
0.5882425, 0.3163923, 0.528833, 0.2470588, 0, 1, 1,
0.5900832, 0.4184954, 1.94111, 0.254902, 0, 1, 1,
0.5914516, 0.7085668, -0.5568272, 0.2588235, 0, 1, 1,
0.5920278, 0.8417289, 2.726473, 0.2666667, 0, 1, 1,
0.5923641, -0.05673378, 2.190253, 0.2705882, 0, 1, 1,
0.5977759, -0.7224901, 1.679832, 0.2784314, 0, 1, 1,
0.5981862, 0.9016023, -0.3278427, 0.282353, 0, 1, 1,
0.5986686, -0.4454666, 1.306417, 0.2901961, 0, 1, 1,
0.6002842, -0.3909871, 0.7280483, 0.2941177, 0, 1, 1,
0.6075348, 1.019536, 1.63228, 0.3019608, 0, 1, 1,
0.609566, -0.3672957, 2.030725, 0.3098039, 0, 1, 1,
0.6101396, 1.300604, 0.271525, 0.3137255, 0, 1, 1,
0.6111165, 0.5802568, 0.7951187, 0.3215686, 0, 1, 1,
0.614907, -0.973286, 1.98412, 0.3254902, 0, 1, 1,
0.6166948, 2.327439, 0.8267916, 0.3333333, 0, 1, 1,
0.6214632, 1.40972, 0.6214805, 0.3372549, 0, 1, 1,
0.6232042, -0.1954666, 3.033069, 0.345098, 0, 1, 1,
0.6241761, 1.387056, 0.009296387, 0.3490196, 0, 1, 1,
0.6349517, -0.3120707, 2.201419, 0.3568628, 0, 1, 1,
0.6350694, 0.7114277, 1.907331, 0.3607843, 0, 1, 1,
0.6351081, 0.1221545, 2.128523, 0.3686275, 0, 1, 1,
0.6368068, -0.384486, 2.575294, 0.372549, 0, 1, 1,
0.6415195, -0.8341763, 1.603968, 0.3803922, 0, 1, 1,
0.6422242, 0.5137601, 1.860618, 0.3843137, 0, 1, 1,
0.642786, 0.4543536, 1.472361, 0.3921569, 0, 1, 1,
0.6428351, 2.172694, 1.190491, 0.3960784, 0, 1, 1,
0.6429515, -0.165842, 2.252374, 0.4039216, 0, 1, 1,
0.6443118, -0.9959568, 3.85707, 0.4117647, 0, 1, 1,
0.6443978, 1.791752, -0.6189284, 0.4156863, 0, 1, 1,
0.6448408, -0.475778, 2.927217, 0.4235294, 0, 1, 1,
0.6465705, -0.4895153, 2.376655, 0.427451, 0, 1, 1,
0.6481118, 1.177025, 0.6414139, 0.4352941, 0, 1, 1,
0.6527649, 0.3215561, 1.001737, 0.4392157, 0, 1, 1,
0.6531314, 0.5099681, -0.3563911, 0.4470588, 0, 1, 1,
0.6681265, -1.161281, 3.221969, 0.4509804, 0, 1, 1,
0.6683017, 1.323763, 2.532051, 0.4588235, 0, 1, 1,
0.6757114, 0.9284861, 1.322268, 0.4627451, 0, 1, 1,
0.6777955, -0.5021722, 1.642418, 0.4705882, 0, 1, 1,
0.6782259, -0.02189165, -0.4308845, 0.4745098, 0, 1, 1,
0.6821082, 0.1158788, 1.334855, 0.4823529, 0, 1, 1,
0.6824174, -0.07297051, 1.284652, 0.4862745, 0, 1, 1,
0.6835956, -0.7520722, 2.012156, 0.4941176, 0, 1, 1,
0.6838391, 0.9872836, 0.8996516, 0.5019608, 0, 1, 1,
0.6841819, -0.8541375, 3.996119, 0.5058824, 0, 1, 1,
0.6877587, -1.079613, 4.431528, 0.5137255, 0, 1, 1,
0.689346, -1.243951, 2.351292, 0.5176471, 0, 1, 1,
0.6916106, 0.1326367, 1.533188, 0.5254902, 0, 1, 1,
0.6918773, -0.1687529, 2.749903, 0.5294118, 0, 1, 1,
0.6927316, 0.9530986, 0.61399, 0.5372549, 0, 1, 1,
0.6943042, 0.887249, 2.340894, 0.5411765, 0, 1, 1,
0.7047155, -1.063934, 0.9652966, 0.5490196, 0, 1, 1,
0.7059431, -0.0313924, 3.406391, 0.5529412, 0, 1, 1,
0.7074455, 0.4478329, 0.2952636, 0.5607843, 0, 1, 1,
0.7086067, -0.5053521, 2.231506, 0.5647059, 0, 1, 1,
0.7149265, 0.0008483197, 2.028797, 0.572549, 0, 1, 1,
0.7183201, 1.371178, 1.74363, 0.5764706, 0, 1, 1,
0.7198805, -2.633891, 4.468053, 0.5843138, 0, 1, 1,
0.7208184, 0.6644192, 0.4955993, 0.5882353, 0, 1, 1,
0.7220426, -0.4657132, 2.444006, 0.5960785, 0, 1, 1,
0.7269557, -0.008571499, 1.735985, 0.6039216, 0, 1, 1,
0.7294579, 0.4882647, -0.1121634, 0.6078432, 0, 1, 1,
0.7326497, 0.2792006, 1.790641, 0.6156863, 0, 1, 1,
0.7357435, -1.059698, 2.419533, 0.6196079, 0, 1, 1,
0.7370599, -0.5843238, 2.985408, 0.627451, 0, 1, 1,
0.7415511, -1.543975, 2.566949, 0.6313726, 0, 1, 1,
0.7447094, 1.207433, 1.187175, 0.6392157, 0, 1, 1,
0.7482325, -1.068514, 3.064676, 0.6431373, 0, 1, 1,
0.760719, -0.4183706, 3.567786, 0.6509804, 0, 1, 1,
0.7611161, -0.5025255, 2.668275, 0.654902, 0, 1, 1,
0.7726184, 1.481886, 0.304493, 0.6627451, 0, 1, 1,
0.775546, -0.3834284, 1.77544, 0.6666667, 0, 1, 1,
0.7798429, -0.4223877, 2.106512, 0.6745098, 0, 1, 1,
0.7892019, 0.8968197, 0.3542158, 0.6784314, 0, 1, 1,
0.8144718, 0.7806168, 1.135868, 0.6862745, 0, 1, 1,
0.8174253, 0.5352265, 1.038751, 0.6901961, 0, 1, 1,
0.8268581, 0.592416, 1.402169, 0.6980392, 0, 1, 1,
0.8329673, 0.6464021, -0.4869184, 0.7058824, 0, 1, 1,
0.8370048, 0.9955543, -0.2280176, 0.7098039, 0, 1, 1,
0.8392617, 1.882017, 2.345829, 0.7176471, 0, 1, 1,
0.8396515, -0.02259055, 1.427018, 0.7215686, 0, 1, 1,
0.8409405, 0.01805891, 1.847312, 0.7294118, 0, 1, 1,
0.8431818, 1.721606, 0.0363661, 0.7333333, 0, 1, 1,
0.8456049, 0.2636675, -0.5364252, 0.7411765, 0, 1, 1,
0.8468912, -1.160295, 2.246372, 0.7450981, 0, 1, 1,
0.8489903, 2.216311, 0.04612491, 0.7529412, 0, 1, 1,
0.8531184, -0.4739672, 2.106238, 0.7568628, 0, 1, 1,
0.8571869, 1.367155, 0.9215573, 0.7647059, 0, 1, 1,
0.8602018, 1.350591, 1.724841, 0.7686275, 0, 1, 1,
0.8603562, -0.4723527, 2.52771, 0.7764706, 0, 1, 1,
0.8616468, -1.369242, 2.369911, 0.7803922, 0, 1, 1,
0.8701525, -0.3554383, 2.408565, 0.7882353, 0, 1, 1,
0.8752361, 0.7201223, 0.3858025, 0.7921569, 0, 1, 1,
0.876086, -3.72151, 1.70995, 0.8, 0, 1, 1,
0.8768922, -1.624252, 2.634321, 0.8078431, 0, 1, 1,
0.8877188, 0.7991555, -0.1358718, 0.8117647, 0, 1, 1,
0.8928472, -0.05998789, 3.48104, 0.8196079, 0, 1, 1,
0.8937057, -1.333265, 1.89072, 0.8235294, 0, 1, 1,
0.8979917, -1.24135, 2.605696, 0.8313726, 0, 1, 1,
0.902534, 1.170142, 1.676589, 0.8352941, 0, 1, 1,
0.9066129, 1.125064, 1.247823, 0.8431373, 0, 1, 1,
0.9160978, -0.4093037, 1.466656, 0.8470588, 0, 1, 1,
0.9357294, 2.386391, 2.06535, 0.854902, 0, 1, 1,
0.9364677, 0.0286764, 2.0945, 0.8588235, 0, 1, 1,
0.9368255, -0.04951815, -0.3131177, 0.8666667, 0, 1, 1,
0.9449262, 0.4885012, 0.4430234, 0.8705882, 0, 1, 1,
0.9460667, -0.001903636, 1.391907, 0.8784314, 0, 1, 1,
0.9485216, -1.862365, 5.437886, 0.8823529, 0, 1, 1,
0.9501503, 0.2088721, -0.198155, 0.8901961, 0, 1, 1,
0.9520112, 0.544999, 0.6547003, 0.8941177, 0, 1, 1,
0.9530795, 0.01402921, 0.6124474, 0.9019608, 0, 1, 1,
0.9534684, -0.7394874, 2.311942, 0.9098039, 0, 1, 1,
0.9561603, -0.5612251, 3.405637, 0.9137255, 0, 1, 1,
0.9568952, 0.9784458, 0.7722667, 0.9215686, 0, 1, 1,
0.9590613, -0.6961465, 2.492141, 0.9254902, 0, 1, 1,
0.9596879, -1.069167, 1.919508, 0.9333333, 0, 1, 1,
0.9623365, -0.3830057, 2.606077, 0.9372549, 0, 1, 1,
0.9674184, -1.502139, 2.33552, 0.945098, 0, 1, 1,
0.9681817, -1.15642, 3.659566, 0.9490196, 0, 1, 1,
0.9688543, 0.3876009, 1.547125, 0.9568627, 0, 1, 1,
0.9701166, -0.5191552, 1.077724, 0.9607843, 0, 1, 1,
0.9702761, -0.8895954, 1.090393, 0.9686275, 0, 1, 1,
0.9715853, -0.1410413, 1.746978, 0.972549, 0, 1, 1,
0.9717176, -0.6128016, 3.166931, 0.9803922, 0, 1, 1,
0.9735078, 0.02236565, 1.665744, 0.9843137, 0, 1, 1,
0.9775572, -0.4882501, 2.090271, 0.9921569, 0, 1, 1,
0.9779512, -2.095718, 2.748597, 0.9960784, 0, 1, 1,
0.9934488, -0.726903, 1.385475, 1, 0, 0.9960784, 1,
1.007592, 0.4597927, 0.5632815, 1, 0, 0.9882353, 1,
1.012177, -1.428315, 2.889779, 1, 0, 0.9843137, 1,
1.014097, -0.001836204, 1.728749, 1, 0, 0.9764706, 1,
1.015724, 0.8748459, 0.8507589, 1, 0, 0.972549, 1,
1.016219, 1.205866, -0.4446258, 1, 0, 0.9647059, 1,
1.016673, -0.4153699, 3.269365, 1, 0, 0.9607843, 1,
1.021116, -0.2251241, 1.584995, 1, 0, 0.9529412, 1,
1.025214, 0.4648435, 2.090512, 1, 0, 0.9490196, 1,
1.031744, 0.2319346, 2.641734, 1, 0, 0.9411765, 1,
1.033216, -0.458567, 3.481867, 1, 0, 0.9372549, 1,
1.034805, -0.3975487, 1.207864, 1, 0, 0.9294118, 1,
1.037089, -0.2281329, 1.954759, 1, 0, 0.9254902, 1,
1.039477, -1.501286, 3.40402, 1, 0, 0.9176471, 1,
1.047579, -1.030125, 1.349495, 1, 0, 0.9137255, 1,
1.048774, 1.692538, 1.609229, 1, 0, 0.9058824, 1,
1.058213, -0.3273498, 3.410492, 1, 0, 0.9019608, 1,
1.065949, -2.547726, 2.812401, 1, 0, 0.8941177, 1,
1.078102, 2.878746, 2.838055, 1, 0, 0.8862745, 1,
1.084226, -1.067199, 0.4000896, 1, 0, 0.8823529, 1,
1.084865, -0.1117093, 0.7983007, 1, 0, 0.8745098, 1,
1.090422, -0.5859098, 3.386769, 1, 0, 0.8705882, 1,
1.092903, 0.5568094, 1.357616, 1, 0, 0.8627451, 1,
1.093232, 0.192839, 0.6869217, 1, 0, 0.8588235, 1,
1.096075, -0.4099987, 3.650439, 1, 0, 0.8509804, 1,
1.105647, -0.8911664, 2.855985, 1, 0, 0.8470588, 1,
1.106709, 0.1685786, 1.14025, 1, 0, 0.8392157, 1,
1.110638, 0.1448147, 0.6603098, 1, 0, 0.8352941, 1,
1.113573, -2.490844, 4.321421, 1, 0, 0.827451, 1,
1.115132, 1.895194, -1.337047, 1, 0, 0.8235294, 1,
1.117897, 0.7986451, 1.665023, 1, 0, 0.8156863, 1,
1.118225, 1.175719, -0.9623311, 1, 0, 0.8117647, 1,
1.12249, 1.248708, 1.281372, 1, 0, 0.8039216, 1,
1.126107, 0.9606053, 2.605763, 1, 0, 0.7960784, 1,
1.129606, -1.367378, 3.38837, 1, 0, 0.7921569, 1,
1.133774, -0.4053557, 1.757346, 1, 0, 0.7843137, 1,
1.137441, -0.2197322, 2.145342, 1, 0, 0.7803922, 1,
1.141189, -0.7313362, 1.888967, 1, 0, 0.772549, 1,
1.143894, -1.1117, 1.362832, 1, 0, 0.7686275, 1,
1.143996, 0.7321677, 0.7830738, 1, 0, 0.7607843, 1,
1.153707, 0.4113815, 1.492854, 1, 0, 0.7568628, 1,
1.163604, 0.8945515, 1.027501, 1, 0, 0.7490196, 1,
1.168667, 0.8577662, 1.926948, 1, 0, 0.7450981, 1,
1.191908, -1.703945, 3.378559, 1, 0, 0.7372549, 1,
1.196876, 0.3449664, 2.3492, 1, 0, 0.7333333, 1,
1.203798, -1.297204, 3.575687, 1, 0, 0.7254902, 1,
1.207148, -0.637462, 3.072005, 1, 0, 0.7215686, 1,
1.211113, 1.567553, 0.4677989, 1, 0, 0.7137255, 1,
1.214657, 1.589763, -1.160064, 1, 0, 0.7098039, 1,
1.220863, 1.239772, 2.121623, 1, 0, 0.7019608, 1,
1.236487, -2.243195, 5.029647, 1, 0, 0.6941177, 1,
1.24464, -0.9766659, 1.794507, 1, 0, 0.6901961, 1,
1.24643, 0.6855139, -0.1745472, 1, 0, 0.682353, 1,
1.251806, -0.3930513, 2.664044, 1, 0, 0.6784314, 1,
1.259711, 1.146652, -1.36299, 1, 0, 0.6705883, 1,
1.271884, 1.166459, -0.5930623, 1, 0, 0.6666667, 1,
1.28211, 1.845048, 3.598827, 1, 0, 0.6588235, 1,
1.287516, 0.6086338, 1.538212, 1, 0, 0.654902, 1,
1.289597, 0.9441795, 0.3764674, 1, 0, 0.6470588, 1,
1.290783, -1.690217, 0.6967435, 1, 0, 0.6431373, 1,
1.293707, 0.5853076, 1.838591, 1, 0, 0.6352941, 1,
1.296108, -1.63175, 2.858924, 1, 0, 0.6313726, 1,
1.303978, -0.1540059, 1.713153, 1, 0, 0.6235294, 1,
1.315168, 0.1156001, 3.326432, 1, 0, 0.6196079, 1,
1.319484, 0.2089472, 1.310722, 1, 0, 0.6117647, 1,
1.329034, 0.8460604, 2.07137, 1, 0, 0.6078432, 1,
1.330095, 0.3249371, 1.118312, 1, 0, 0.6, 1,
1.336607, 0.5785686, 1.17186, 1, 0, 0.5921569, 1,
1.338745, -0.5055341, 2.043378, 1, 0, 0.5882353, 1,
1.339794, 1.029229, 0.9521695, 1, 0, 0.5803922, 1,
1.364625, 0.8064846, -0.5810548, 1, 0, 0.5764706, 1,
1.371294, -1.376149, 2.311949, 1, 0, 0.5686275, 1,
1.381437, 1.04765, 1.663126, 1, 0, 0.5647059, 1,
1.385974, 1.440035, 0.4491116, 1, 0, 0.5568628, 1,
1.399841, -0.4054239, 1.739038, 1, 0, 0.5529412, 1,
1.400994, -1.899285, 1.635616, 1, 0, 0.5450981, 1,
1.401639, 0.7229382, 2.34457, 1, 0, 0.5411765, 1,
1.402478, 1.264006, 1.240349, 1, 0, 0.5333334, 1,
1.409732, 1.579333, 1.013101, 1, 0, 0.5294118, 1,
1.415967, -0.6928756, 4.882846, 1, 0, 0.5215687, 1,
1.418712, -0.6935239, 2.442933, 1, 0, 0.5176471, 1,
1.427445, -0.04412634, 0.6209887, 1, 0, 0.509804, 1,
1.436459, 0.4645384, 1.492629, 1, 0, 0.5058824, 1,
1.440684, -0.9502357, 5.014601, 1, 0, 0.4980392, 1,
1.449534, 0.8381767, -0.6590132, 1, 0, 0.4901961, 1,
1.45555, -1.222086, 0.4600726, 1, 0, 0.4862745, 1,
1.477836, 0.8117579, 1.883432, 1, 0, 0.4784314, 1,
1.490416, 0.8151301, 1.895795, 1, 0, 0.4745098, 1,
1.491627, 1.158498, 0.964337, 1, 0, 0.4666667, 1,
1.494671, -0.3223917, 2.270983, 1, 0, 0.4627451, 1,
1.497814, 1.20895, 1.329158, 1, 0, 0.454902, 1,
1.512618, 1.153307, -0.4027324, 1, 0, 0.4509804, 1,
1.52926, 1.86278, 0.946575, 1, 0, 0.4431373, 1,
1.531905, -1.595106, 1.328025, 1, 0, 0.4392157, 1,
1.532179, 1.743387, 0.5164946, 1, 0, 0.4313726, 1,
1.537627, 0.1848416, 2.362883, 1, 0, 0.427451, 1,
1.539644, -1.388338, 3.192407, 1, 0, 0.4196078, 1,
1.540742, 0.03865591, 0.5506448, 1, 0, 0.4156863, 1,
1.559033, 1.223455, 0.9779498, 1, 0, 0.4078431, 1,
1.582852, -0.3561342, -0.6071927, 1, 0, 0.4039216, 1,
1.602137, 1.094462, -0.4650356, 1, 0, 0.3960784, 1,
1.60456, -1.050489, 1.965307, 1, 0, 0.3882353, 1,
1.607303, 2.000414, 0.5503018, 1, 0, 0.3843137, 1,
1.632971, 0.6205003, 0.229486, 1, 0, 0.3764706, 1,
1.634584, -0.2592433, 2.780726, 1, 0, 0.372549, 1,
1.640934, 1.264887, 0.7670107, 1, 0, 0.3647059, 1,
1.64797, -0.4625369, 1.454069, 1, 0, 0.3607843, 1,
1.654304, -1.349645, 1.304094, 1, 0, 0.3529412, 1,
1.655872, 0.6296522, 1.469515, 1, 0, 0.3490196, 1,
1.656274, 0.2352938, 2.271132, 1, 0, 0.3411765, 1,
1.660236, 1.232043, 0.9247274, 1, 0, 0.3372549, 1,
1.663754, 0.6052057, 2.929925, 1, 0, 0.3294118, 1,
1.673817, 0.5891098, 0.9244988, 1, 0, 0.3254902, 1,
1.676816, 0.7720367, 1.596134, 1, 0, 0.3176471, 1,
1.677729, 0.6537137, 0.2729883, 1, 0, 0.3137255, 1,
1.680925, 1.071163, 1.775179, 1, 0, 0.3058824, 1,
1.683786, 0.8506832, 0.4556796, 1, 0, 0.2980392, 1,
1.686298, -0.2385627, 1.351802, 1, 0, 0.2941177, 1,
1.70309, 1.094954, 1.284092, 1, 0, 0.2862745, 1,
1.711198, -1.216735, 3.04543, 1, 0, 0.282353, 1,
1.723054, -1.104083, 2.361807, 1, 0, 0.2745098, 1,
1.728595, 3.087116, -0.3547313, 1, 0, 0.2705882, 1,
1.744547, -0.1912374, 0.2746199, 1, 0, 0.2627451, 1,
1.752993, -1.931276, 1.902976, 1, 0, 0.2588235, 1,
1.753427, 2.658521, -0.5343349, 1, 0, 0.2509804, 1,
1.796143, -0.0004822442, 2.812217, 1, 0, 0.2470588, 1,
1.814226, 0.7561613, 2.42934, 1, 0, 0.2392157, 1,
1.818635, -0.2536548, 1.213431, 1, 0, 0.2352941, 1,
1.839747, 2.755754, 0.6244848, 1, 0, 0.227451, 1,
1.848927, 0.3513463, 0.9985734, 1, 0, 0.2235294, 1,
1.874897, -0.4310268, 3.706996, 1, 0, 0.2156863, 1,
1.881919, -0.7285926, 4.172351, 1, 0, 0.2117647, 1,
1.887353, 0.7664927, 0.6929524, 1, 0, 0.2039216, 1,
1.902522, 1.356129, 0.5737995, 1, 0, 0.1960784, 1,
1.908451, -1.737338, 2.051549, 1, 0, 0.1921569, 1,
1.910009, 1.188516, 1.23842, 1, 0, 0.1843137, 1,
1.926571, 0.3953598, 1.511955, 1, 0, 0.1803922, 1,
1.929677, -0.6015519, 3.707551, 1, 0, 0.172549, 1,
1.934229, -0.6261848, 0.9665145, 1, 0, 0.1686275, 1,
1.943673, 1.699145, -0.6721936, 1, 0, 0.1607843, 1,
1.955227, 1.045836, 0.8027232, 1, 0, 0.1568628, 1,
1.957849, -1.055624, 3.247221, 1, 0, 0.1490196, 1,
1.966961, -0.8609251, 1.41388, 1, 0, 0.145098, 1,
1.968164, 1.65996, 2.178763, 1, 0, 0.1372549, 1,
1.979749, -1.45308, 1.871994, 1, 0, 0.1333333, 1,
1.999103, -0.5715916, 2.729366, 1, 0, 0.1254902, 1,
2.001906, 1.009421, 2.231866, 1, 0, 0.1215686, 1,
2.047603, -1.02075, 1.555935, 1, 0, 0.1137255, 1,
2.068713, -0.5435181, 2.451684, 1, 0, 0.1098039, 1,
2.073421, 2.002846, -0.8519335, 1, 0, 0.1019608, 1,
2.102324, 2.340037, -0.4352292, 1, 0, 0.09411765, 1,
2.153812, 0.2599299, 1.719481, 1, 0, 0.09019608, 1,
2.192818, 1.238039, -0.6186862, 1, 0, 0.08235294, 1,
2.203409, 1.032198, 1.854104, 1, 0, 0.07843138, 1,
2.235735, -0.8377341, 2.489611, 1, 0, 0.07058824, 1,
2.251805, -0.7707725, 1.49769, 1, 0, 0.06666667, 1,
2.31865, -0.2752429, 2.568314, 1, 0, 0.05882353, 1,
2.352027, 1.187558, -0.1215041, 1, 0, 0.05490196, 1,
2.353384, -1.69579, 1.742041, 1, 0, 0.04705882, 1,
2.424713, 1.38715, 1.283442, 1, 0, 0.04313726, 1,
2.476817, -0.1539374, 0.5637518, 1, 0, 0.03529412, 1,
2.498702, -0.3371553, 1.115854, 1, 0, 0.03137255, 1,
2.523698, 0.8074679, 2.760965, 1, 0, 0.02352941, 1,
2.57274, 0.6982242, 1.295294, 1, 0, 0.01960784, 1,
2.653416, 1.039286, 0.8093617, 1, 0, 0.01176471, 1,
2.747318, -0.3220459, 2.436704, 1, 0, 0.007843138, 1
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
-0.2071991, -4.915009, -7.69072, 0, -0.5, 0.5, 0.5,
-0.2071991, -4.915009, -7.69072, 1, -0.5, 0.5, 0.5,
-0.2071991, -4.915009, -7.69072, 1, 1.5, 0.5, 0.5,
-0.2071991, -4.915009, -7.69072, 0, 1.5, 0.5, 0.5
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
-4.163297, -0.2008654, -7.69072, 0, -0.5, 0.5, 0.5,
-4.163297, -0.2008654, -7.69072, 1, -0.5, 0.5, 0.5,
-4.163297, -0.2008654, -7.69072, 1, 1.5, 0.5, 0.5,
-4.163297, -0.2008654, -7.69072, 0, 1.5, 0.5, 0.5
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
-4.163297, -4.915009, 0.9129906, 0, -0.5, 0.5, 0.5,
-4.163297, -4.915009, 0.9129906, 1, -0.5, 0.5, 0.5,
-4.163297, -4.915009, 0.9129906, 1, 1.5, 0.5, 0.5,
-4.163297, -4.915009, 0.9129906, 0, 1.5, 0.5, 0.5
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
-3, -3.827129, -5.705248,
2, -3.827129, -5.705248,
-3, -3.827129, -5.705248,
-3, -4.008442, -6.03616,
-2, -3.827129, -5.705248,
-2, -4.008442, -6.03616,
-1, -3.827129, -5.705248,
-1, -4.008442, -6.03616,
0, -3.827129, -5.705248,
0, -4.008442, -6.03616,
1, -3.827129, -5.705248,
1, -4.008442, -6.03616,
2, -3.827129, -5.705248,
2, -4.008442, -6.03616
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
-3, -4.371069, -6.697984, 0, -0.5, 0.5, 0.5,
-3, -4.371069, -6.697984, 1, -0.5, 0.5, 0.5,
-3, -4.371069, -6.697984, 1, 1.5, 0.5, 0.5,
-3, -4.371069, -6.697984, 0, 1.5, 0.5, 0.5,
-2, -4.371069, -6.697984, 0, -0.5, 0.5, 0.5,
-2, -4.371069, -6.697984, 1, -0.5, 0.5, 0.5,
-2, -4.371069, -6.697984, 1, 1.5, 0.5, 0.5,
-2, -4.371069, -6.697984, 0, 1.5, 0.5, 0.5,
-1, -4.371069, -6.697984, 0, -0.5, 0.5, 0.5,
-1, -4.371069, -6.697984, 1, -0.5, 0.5, 0.5,
-1, -4.371069, -6.697984, 1, 1.5, 0.5, 0.5,
-1, -4.371069, -6.697984, 0, 1.5, 0.5, 0.5,
0, -4.371069, -6.697984, 0, -0.5, 0.5, 0.5,
0, -4.371069, -6.697984, 1, -0.5, 0.5, 0.5,
0, -4.371069, -6.697984, 1, 1.5, 0.5, 0.5,
0, -4.371069, -6.697984, 0, 1.5, 0.5, 0.5,
1, -4.371069, -6.697984, 0, -0.5, 0.5, 0.5,
1, -4.371069, -6.697984, 1, -0.5, 0.5, 0.5,
1, -4.371069, -6.697984, 1, 1.5, 0.5, 0.5,
1, -4.371069, -6.697984, 0, 1.5, 0.5, 0.5,
2, -4.371069, -6.697984, 0, -0.5, 0.5, 0.5,
2, -4.371069, -6.697984, 1, -0.5, 0.5, 0.5,
2, -4.371069, -6.697984, 1, 1.5, 0.5, 0.5,
2, -4.371069, -6.697984, 0, 1.5, 0.5, 0.5
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
-3.250351, -2, -5.705248,
-3.250351, 2, -5.705248,
-3.250351, -2, -5.705248,
-3.402509, -2, -6.03616,
-3.250351, 0, -5.705248,
-3.402509, 0, -6.03616,
-3.250351, 2, -5.705248,
-3.402509, 2, -6.03616
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
"0",
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
-3.706824, -2, -6.697984, 0, -0.5, 0.5, 0.5,
-3.706824, -2, -6.697984, 1, -0.5, 0.5, 0.5,
-3.706824, -2, -6.697984, 1, 1.5, 0.5, 0.5,
-3.706824, -2, -6.697984, 0, 1.5, 0.5, 0.5,
-3.706824, 0, -6.697984, 0, -0.5, 0.5, 0.5,
-3.706824, 0, -6.697984, 1, -0.5, 0.5, 0.5,
-3.706824, 0, -6.697984, 1, 1.5, 0.5, 0.5,
-3.706824, 0, -6.697984, 0, 1.5, 0.5, 0.5,
-3.706824, 2, -6.697984, 0, -0.5, 0.5, 0.5,
-3.706824, 2, -6.697984, 1, -0.5, 0.5, 0.5,
-3.706824, 2, -6.697984, 1, 1.5, 0.5, 0.5,
-3.706824, 2, -6.697984, 0, 1.5, 0.5, 0.5
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
-3.250351, -3.827129, -4,
-3.250351, -3.827129, 6,
-3.250351, -3.827129, -4,
-3.402509, -4.008442, -4,
-3.250351, -3.827129, -2,
-3.402509, -4.008442, -2,
-3.250351, -3.827129, 0,
-3.402509, -4.008442, 0,
-3.250351, -3.827129, 2,
-3.402509, -4.008442, 2,
-3.250351, -3.827129, 4,
-3.402509, -4.008442, 4,
-3.250351, -3.827129, 6,
-3.402509, -4.008442, 6
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
-3.706824, -4.371069, -4, 0, -0.5, 0.5, 0.5,
-3.706824, -4.371069, -4, 1, -0.5, 0.5, 0.5,
-3.706824, -4.371069, -4, 1, 1.5, 0.5, 0.5,
-3.706824, -4.371069, -4, 0, 1.5, 0.5, 0.5,
-3.706824, -4.371069, -2, 0, -0.5, 0.5, 0.5,
-3.706824, -4.371069, -2, 1, -0.5, 0.5, 0.5,
-3.706824, -4.371069, -2, 1, 1.5, 0.5, 0.5,
-3.706824, -4.371069, -2, 0, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 0, 0, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 0, 1, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 0, 1, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 0, 0, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 2, 0, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 2, 1, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 2, 1, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 2, 0, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 4, 0, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 4, 1, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 4, 1, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 4, 0, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 6, 0, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 6, 1, -0.5, 0.5, 0.5,
-3.706824, -4.371069, 6, 1, 1.5, 0.5, 0.5,
-3.706824, -4.371069, 6, 0, 1.5, 0.5, 0.5
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
-3.250351, -3.827129, -5.705248,
-3.250351, 3.425399, -5.705248,
-3.250351, -3.827129, 7.531229,
-3.250351, 3.425399, 7.531229,
-3.250351, -3.827129, -5.705248,
-3.250351, -3.827129, 7.531229,
-3.250351, 3.425399, -5.705248,
-3.250351, 3.425399, 7.531229,
-3.250351, -3.827129, -5.705248,
2.835953, -3.827129, -5.705248,
-3.250351, -3.827129, 7.531229,
2.835953, -3.827129, 7.531229,
-3.250351, 3.425399, -5.705248,
2.835953, 3.425399, -5.705248,
-3.250351, 3.425399, 7.531229,
2.835953, 3.425399, 7.531229,
2.835953, -3.827129, -5.705248,
2.835953, 3.425399, -5.705248,
2.835953, -3.827129, 7.531229,
2.835953, 3.425399, 7.531229,
2.835953, -3.827129, -5.705248,
2.835953, -3.827129, 7.531229,
2.835953, 3.425399, -5.705248,
2.835953, 3.425399, 7.531229
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
var radius = 8.690058;
var distance = 38.66305;
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
mvMatrix.translate( 0.2071991, 0.2008654, -0.9129906 );
mvMatrix.scale( 1.543771, 1.295529, 0.709846 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.66305);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
triclosan<-read.table("triclosan.xyz")
```

```
## Error in read.table("triclosan.xyz"): no lines available in input
```

```r
x<-triclosan$V2
```

```
## Error in eval(expr, envir, enclos): object 'triclosan' not found
```

```r
y<-triclosan$V3
```

```
## Error in eval(expr, envir, enclos): object 'triclosan' not found
```

```r
z<-triclosan$V4
```

```
## Error in eval(expr, envir, enclos): object 'triclosan' not found
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
-3.161716, 1.128436, -1.13638, 0, 0, 1, 1, 1,
-3.134076, 1.422147, -1.682872, 1, 0, 0, 1, 1,
-3.105879, -0.6178763, -1.441796, 1, 0, 0, 1, 1,
-2.763394, 0.12491, -0.8056943, 1, 0, 0, 1, 1,
-2.756248, 0.1702786, -0.7336852, 1, 0, 0, 1, 1,
-2.564054, -1.313946, -2.449141, 1, 0, 0, 1, 1,
-2.527158, -0.3622661, -1.366705, 0, 0, 0, 1, 1,
-2.474425, 0.3778298, -0.8976129, 0, 0, 0, 1, 1,
-2.411866, -0.7013496, -2.273117, 0, 0, 0, 1, 1,
-2.302824, 0.2502099, -2.40867, 0, 0, 0, 1, 1,
-2.223922, -0.7254641, -2.64809, 0, 0, 0, 1, 1,
-2.152666, -0.2923059, -2.134108, 0, 0, 0, 1, 1,
-2.082268, 0.5377073, 0.7671958, 0, 0, 0, 1, 1,
-2.071413, -0.8721746, -1.893005, 1, 1, 1, 1, 1,
-2.044896, -0.117051, -0.3142209, 1, 1, 1, 1, 1,
-2.039222, 2.060568, -0.515528, 1, 1, 1, 1, 1,
-2.014014, 0.1937835, -2.66867, 1, 1, 1, 1, 1,
-2.00313, -1.567399, -2.3558, 1, 1, 1, 1, 1,
-2.001682, -0.2179249, -3.852615, 1, 1, 1, 1, 1,
-1.98597, -1.741273, -2.774266, 1, 1, 1, 1, 1,
-1.985804, 0.08559258, -1.631183, 1, 1, 1, 1, 1,
-1.979961, 1.044201, -0.6689697, 1, 1, 1, 1, 1,
-1.969266, -0.2028531, -2.588383, 1, 1, 1, 1, 1,
-1.968039, -0.7254058, -2.233932, 1, 1, 1, 1, 1,
-1.92899, 0.8879283, -0.3670236, 1, 1, 1, 1, 1,
-1.928843, -0.5052745, -0.8921146, 1, 1, 1, 1, 1,
-1.907421, -1.368002, -2.318275, 1, 1, 1, 1, 1,
-1.899211, 0.6571138, -2.98816, 1, 1, 1, 1, 1,
-1.878853, -0.1892619, -0.4624149, 0, 0, 1, 1, 1,
-1.864969, 0.1282645, -3.169926, 1, 0, 0, 1, 1,
-1.862912, 1.025246, -1.279506, 1, 0, 0, 1, 1,
-1.861376, 1.04573, -2.026313, 1, 0, 0, 1, 1,
-1.847385, -1.402489, -0.8217695, 1, 0, 0, 1, 1,
-1.844031, -0.2454263, -2.848788, 1, 0, 0, 1, 1,
-1.835788, 1.010395, -1.162021, 0, 0, 0, 1, 1,
-1.834114, 1.071022, -0.5365734, 0, 0, 0, 1, 1,
-1.818388, 0.9336709, -0.1761667, 0, 0, 0, 1, 1,
-1.812933, -0.3327066, -0.7620105, 0, 0, 0, 1, 1,
-1.811828, 0.2888354, -1.73998, 0, 0, 0, 1, 1,
-1.792403, -2.168443, -0.7259855, 0, 0, 0, 1, 1,
-1.773061, -0.7775349, -1.33885, 0, 0, 0, 1, 1,
-1.770682, 0.8871555, -0.8112544, 1, 1, 1, 1, 1,
-1.764539, -0.04050689, -1.633855, 1, 1, 1, 1, 1,
-1.763077, -0.5789688, -2.060613, 1, 1, 1, 1, 1,
-1.756665, -0.102214, -2.961353, 1, 1, 1, 1, 1,
-1.741294, -0.4196492, -2.959844, 1, 1, 1, 1, 1,
-1.724674, 1.065399, -0.1061335, 1, 1, 1, 1, 1,
-1.718768, -0.2818607, -1.402955, 1, 1, 1, 1, 1,
-1.718382, -0.5463873, -1.709394, 1, 1, 1, 1, 1,
-1.712008, 1.149553, -1.53854, 1, 1, 1, 1, 1,
-1.707691, 0.3832509, -0.9334063, 1, 1, 1, 1, 1,
-1.678242, 1.103805, -1.417174, 1, 1, 1, 1, 1,
-1.675695, -1.043706, -2.196243, 1, 1, 1, 1, 1,
-1.673723, 0.3289141, -1.046036, 1, 1, 1, 1, 1,
-1.661605, 2.391711, -1.637172, 1, 1, 1, 1, 1,
-1.656717, -0.6615583, -3.214967, 1, 1, 1, 1, 1,
-1.62389, -1.102053, -1.689342, 0, 0, 1, 1, 1,
-1.592306, 0.6595405, -1.475282, 1, 0, 0, 1, 1,
-1.58517, 0.4238103, 0.8072838, 1, 0, 0, 1, 1,
-1.581961, -1.797209, -2.107849, 1, 0, 0, 1, 1,
-1.581099, 1.498543, -2.261858, 1, 0, 0, 1, 1,
-1.579187, -0.9480841, -2.104784, 1, 0, 0, 1, 1,
-1.572219, -0.3390605, -1.582965, 0, 0, 0, 1, 1,
-1.571555, 0.4421138, -0.1098792, 0, 0, 0, 1, 1,
-1.558358, 1.809965, 0.4726523, 0, 0, 0, 1, 1,
-1.554916, -0.1234806, -2.232925, 0, 0, 0, 1, 1,
-1.544905, -1.787231, -4.180356, 0, 0, 0, 1, 1,
-1.543778, -0.3012491, -0.9069487, 0, 0, 0, 1, 1,
-1.542724, 0.5595261, -2.624537, 0, 0, 0, 1, 1,
-1.527538, 0.1470041, -0.6300304, 1, 1, 1, 1, 1,
-1.524656, -2.119474, -5.395191, 1, 1, 1, 1, 1,
-1.514402, 0.9502118, 0.4547442, 1, 1, 1, 1, 1,
-1.511479, -1.361308, -4.640114, 1, 1, 1, 1, 1,
-1.482619, 2.470249, -1.189386, 1, 1, 1, 1, 1,
-1.475159, 0.3997126, -1.365289, 1, 1, 1, 1, 1,
-1.474276, 1.387468, 0.4543479, 1, 1, 1, 1, 1,
-1.471979, 1.177709, -0.1334571, 1, 1, 1, 1, 1,
-1.470637, -0.1124579, -0.8165768, 1, 1, 1, 1, 1,
-1.46149, 0.2089387, -2.073951, 1, 1, 1, 1, 1,
-1.452709, 0.4341418, -1.657254, 1, 1, 1, 1, 1,
-1.448838, -0.2970691, -1.320041, 1, 1, 1, 1, 1,
-1.439202, -1.295452, -2.569767, 1, 1, 1, 1, 1,
-1.436511, -0.5611159, -2.61557, 1, 1, 1, 1, 1,
-1.434916, -0.5741691, -2.279902, 1, 1, 1, 1, 1,
-1.42105, -0.8927166, -1.763589, 0, 0, 1, 1, 1,
-1.416724, -0.5818427, -2.290076, 1, 0, 0, 1, 1,
-1.41301, 1.330214, -1.078493, 1, 0, 0, 1, 1,
-1.405955, -1.023253, -2.647983, 1, 0, 0, 1, 1,
-1.402434, 0.3622467, -1.294363, 1, 0, 0, 1, 1,
-1.40103, -0.7039765, -3.97123, 1, 0, 0, 1, 1,
-1.396976, 0.7091485, 0.5353001, 0, 0, 0, 1, 1,
-1.390622, -1.910491, -2.055477, 0, 0, 0, 1, 1,
-1.389036, -0.3640213, -1.527753, 0, 0, 0, 1, 1,
-1.383755, 0.9718752, -0.9594992, 0, 0, 0, 1, 1,
-1.379257, -0.8226553, -3.054666, 0, 0, 0, 1, 1,
-1.369259, 1.159604, 0.1718096, 0, 0, 0, 1, 1,
-1.366839, -1.085487, -1.234146, 0, 0, 0, 1, 1,
-1.361871, -0.2391372, -0.9183968, 1, 1, 1, 1, 1,
-1.357436, 1.001518, -0.4680656, 1, 1, 1, 1, 1,
-1.353967, 0.5764025, -2.799309, 1, 1, 1, 1, 1,
-1.345828, -0.06131937, -1.1846, 1, 1, 1, 1, 1,
-1.335397, 0.4700182, -1.39134, 1, 1, 1, 1, 1,
-1.328036, -1.189897, -3.164715, 1, 1, 1, 1, 1,
-1.318935, -1.516301, -3.298947, 1, 1, 1, 1, 1,
-1.318903, 0.4007317, -0.8052734, 1, 1, 1, 1, 1,
-1.315354, 1.514176, -1.131997, 1, 1, 1, 1, 1,
-1.31214, -1.596161, -2.029028, 1, 1, 1, 1, 1,
-1.309504, 0.5529215, -2.584166, 1, 1, 1, 1, 1,
-1.307735, 0.3071851, -1.666055, 1, 1, 1, 1, 1,
-1.306819, -1.14455, -0.3881007, 1, 1, 1, 1, 1,
-1.305288, 1.925039, -0.1903623, 1, 1, 1, 1, 1,
-1.301948, 0.5688419, -0.1036234, 1, 1, 1, 1, 1,
-1.296527, 1.898833, -0.2276987, 0, 0, 1, 1, 1,
-1.295612, 0.2454889, 0.6088049, 1, 0, 0, 1, 1,
-1.290492, -0.3363052, -1.018143, 1, 0, 0, 1, 1,
-1.28987, 1.39287, -1.226192, 1, 0, 0, 1, 1,
-1.287904, 2.070955, -0.9521676, 1, 0, 0, 1, 1,
-1.271847, 1.515254, 0.7977874, 1, 0, 0, 1, 1,
-1.269759, 0.7297974, -1.466979, 0, 0, 0, 1, 1,
-1.263317, -0.00904774, 0.03503872, 0, 0, 0, 1, 1,
-1.262573, 1.189847, -0.3730254, 0, 0, 0, 1, 1,
-1.25265, -1.082676, -3.061519, 0, 0, 0, 1, 1,
-1.252027, -0.1624564, -2.267513, 0, 0, 0, 1, 1,
-1.251543, 0.8856701, -0.5834502, 0, 0, 0, 1, 1,
-1.243344, 2.033417, 0.4811558, 0, 0, 0, 1, 1,
-1.240312, 0.1116994, -1.711087, 1, 1, 1, 1, 1,
-1.240214, 0.3320582, 1.315819, 1, 1, 1, 1, 1,
-1.22673, 0.7803108, -2.685432, 1, 1, 1, 1, 1,
-1.218139, 0.2645388, -0.6932097, 1, 1, 1, 1, 1,
-1.211548, 0.1941769, -2.153129, 1, 1, 1, 1, 1,
-1.20961, -1.588317, -1.595451, 1, 1, 1, 1, 1,
-1.204782, 0.1351347, -1.0985, 1, 1, 1, 1, 1,
-1.203139, -0.704298, -1.831463, 1, 1, 1, 1, 1,
-1.20201, 0.2470121, -0.1968454, 1, 1, 1, 1, 1,
-1.192331, 0.3957831, -0.673781, 1, 1, 1, 1, 1,
-1.187537, -0.4911047, -0.5453806, 1, 1, 1, 1, 1,
-1.184284, -0.01166912, -1.445093, 1, 1, 1, 1, 1,
-1.180751, 1.765005, -0.4846649, 1, 1, 1, 1, 1,
-1.179286, 0.01308179, -0.771951, 1, 1, 1, 1, 1,
-1.177128, 0.4669497, -0.6423216, 1, 1, 1, 1, 1,
-1.174685, 0.2116324, -1.794439, 0, 0, 1, 1, 1,
-1.174297, 0.8230112, -0.7978284, 1, 0, 0, 1, 1,
-1.170086, -0.9858525, -1.402473, 1, 0, 0, 1, 1,
-1.169976, -1.294255, -2.457758, 1, 0, 0, 1, 1,
-1.16475, 1.168308, -0.1638566, 1, 0, 0, 1, 1,
-1.163456, 0.5612609, -0.6477402, 1, 0, 0, 1, 1,
-1.163306, -0.6272421, -1.516244, 0, 0, 0, 1, 1,
-1.158089, 1.818099, -0.7842878, 0, 0, 0, 1, 1,
-1.154154, -1.900587, -2.09339, 0, 0, 0, 1, 1,
-1.140732, 0.1367596, -4.157774, 0, 0, 0, 1, 1,
-1.138528, -0.9477659, -2.040077, 0, 0, 0, 1, 1,
-1.136323, -0.03509322, 0.5105524, 0, 0, 0, 1, 1,
-1.134948, 0.5408735, -2.497818, 0, 0, 0, 1, 1,
-1.129676, -0.6826434, -1.945529, 1, 1, 1, 1, 1,
-1.126943, 0.9541891, -1.050159, 1, 1, 1, 1, 1,
-1.114884, -0.6302037, -1.335887, 1, 1, 1, 1, 1,
-1.10965, -0.9832763, -1.852356, 1, 1, 1, 1, 1,
-1.109455, -0.445161, -0.571465, 1, 1, 1, 1, 1,
-1.10697, 0.6482455, -0.7492672, 1, 1, 1, 1, 1,
-1.106073, -1.354658, -3.93323, 1, 1, 1, 1, 1,
-1.088332, 0.1440009, -2.889275, 1, 1, 1, 1, 1,
-1.086784, -0.3243376, -0.4033301, 1, 1, 1, 1, 1,
-1.08671, -0.2301546, -0.7972109, 1, 1, 1, 1, 1,
-1.084143, -0.6996142, -1.918148, 1, 1, 1, 1, 1,
-1.082795, 0.3868456, -1.811915, 1, 1, 1, 1, 1,
-1.081194, 1.781276, 1.013414, 1, 1, 1, 1, 1,
-1.078424, -0.6398669, -2.200449, 1, 1, 1, 1, 1,
-1.078232, 1.811309, -0.2708994, 1, 1, 1, 1, 1,
-1.07672, 1.742834, 0.110618, 0, 0, 1, 1, 1,
-1.074079, 1.431566, -1.254496, 1, 0, 0, 1, 1,
-1.07331, -0.9289921, -1.658177, 1, 0, 0, 1, 1,
-1.072714, -0.459921, -2.058966, 1, 0, 0, 1, 1,
-1.068172, -0.09826925, -1.902559, 1, 0, 0, 1, 1,
-1.061413, 0.9360261, -0.1159937, 1, 0, 0, 1, 1,
-1.054395, 1.567306, -0.1064783, 0, 0, 0, 1, 1,
-1.04833, -1.155808, -3.123949, 0, 0, 0, 1, 1,
-1.040011, -0.8740519, -2.179279, 0, 0, 0, 1, 1,
-1.036083, 2.152213, -0.09174446, 0, 0, 0, 1, 1,
-1.031894, -0.06956138, -1.134741, 0, 0, 0, 1, 1,
-1.004405, -0.07694849, -2.921767, 0, 0, 0, 1, 1,
-1.000421, -0.2273719, -2.08419, 0, 0, 0, 1, 1,
-0.9962708, 1.29305, -1.044797, 1, 1, 1, 1, 1,
-0.9920118, 0.2972492, -0.8520574, 1, 1, 1, 1, 1,
-0.9846101, 2.076639, 1.94533, 1, 1, 1, 1, 1,
-0.98454, -0.5776199, -3.759315, 1, 1, 1, 1, 1,
-0.984105, -0.148609, -0.3907275, 1, 1, 1, 1, 1,
-0.9757606, 0.3268094, -1.578352, 1, 1, 1, 1, 1,
-0.9757439, 1.862193, -0.3321534, 1, 1, 1, 1, 1,
-0.9734314, 1.196356, -1.299673, 1, 1, 1, 1, 1,
-0.9574587, -0.151389, -0.5207279, 1, 1, 1, 1, 1,
-0.94762, 0.2977702, -1.518299, 1, 1, 1, 1, 1,
-0.9452658, 0.6738383, -2.776313, 1, 1, 1, 1, 1,
-0.9430504, -0.4247797, -1.734392, 1, 1, 1, 1, 1,
-0.9429668, -1.002695, -3.260435, 1, 1, 1, 1, 1,
-0.935275, 0.511342, -1.896253, 1, 1, 1, 1, 1,
-0.9347827, 0.3387749, -1.648374, 1, 1, 1, 1, 1,
-0.9338017, 0.07111703, -2.463794, 0, 0, 1, 1, 1,
-0.9312041, -0.8471805, -0.2728659, 1, 0, 0, 1, 1,
-0.9308278, -0.5824427, -1.090086, 1, 0, 0, 1, 1,
-0.923479, -0.1354834, -1.257405, 1, 0, 0, 1, 1,
-0.9164997, 0.9308626, -1.902929, 1, 0, 0, 1, 1,
-0.9115887, 0.2453226, -1.401846, 1, 0, 0, 1, 1,
-0.9102846, -0.1333177, -3.744474, 0, 0, 0, 1, 1,
-0.9006098, 0.9724258, -1.622529, 0, 0, 0, 1, 1,
-0.8952501, 0.03574856, -2.67646, 0, 0, 0, 1, 1,
-0.8902761, -0.7771237, -3.023863, 0, 0, 0, 1, 1,
-0.889063, -1.378754, -3.848592, 0, 0, 0, 1, 1,
-0.8882892, -1.444479, -2.406981, 0, 0, 0, 1, 1,
-0.8859135, 1.191911, -2.237329, 0, 0, 0, 1, 1,
-0.8837585, 0.4931458, 0.01210343, 1, 1, 1, 1, 1,
-0.88016, 0.9227632, -2.432521, 1, 1, 1, 1, 1,
-0.8743712, -0.06519747, -2.088769, 1, 1, 1, 1, 1,
-0.8697565, -0.1943188, -0.5957727, 1, 1, 1, 1, 1,
-0.8633012, 0.2555352, -0.4520567, 1, 1, 1, 1, 1,
-0.8621674, -0.1063651, -0.7673641, 1, 1, 1, 1, 1,
-0.8617148, -0.4297742, -0.4223315, 1, 1, 1, 1, 1,
-0.8576565, 0.9590868, -0.659322, 1, 1, 1, 1, 1,
-0.8541645, -1.565254, -2.532426, 1, 1, 1, 1, 1,
-0.8535312, -0.4706011, -1.403861, 1, 1, 1, 1, 1,
-0.8496679, 0.5467995, -2.09026, 1, 1, 1, 1, 1,
-0.8489718, -0.8407696, -1.555023, 1, 1, 1, 1, 1,
-0.8488483, 0.558454, -0.76391, 1, 1, 1, 1, 1,
-0.8445526, -0.4372004, -2.10274, 1, 1, 1, 1, 1,
-0.8329943, 0.711385, -1.199696, 1, 1, 1, 1, 1,
-0.8219917, 0.9057135, 0.2400131, 0, 0, 1, 1, 1,
-0.8200748, -0.279139, -1.889736, 1, 0, 0, 1, 1,
-0.8200071, -1.259489, -3.75492, 1, 0, 0, 1, 1,
-0.8136258, 0.1825809, 0.1635629, 1, 0, 0, 1, 1,
-0.811856, -1.312982, -1.604559, 1, 0, 0, 1, 1,
-0.8079503, 0.03375614, -0.3580812, 1, 0, 0, 1, 1,
-0.7947783, 0.004443713, -0.8028352, 0, 0, 0, 1, 1,
-0.7934685, -1.068427, -2.509652, 0, 0, 0, 1, 1,
-0.7930145, -0.07568123, -4.156925, 0, 0, 0, 1, 1,
-0.7926099, 3.109825, 1.303995, 0, 0, 0, 1, 1,
-0.7915391, -0.7467943, -2.390967, 0, 0, 0, 1, 1,
-0.7878407, 0.7707427, -1.415902, 0, 0, 0, 1, 1,
-0.7866272, -0.1292035, -1.146509, 0, 0, 0, 1, 1,
-0.7847031, 0.6343026, -0.1585634, 1, 1, 1, 1, 1,
-0.7788056, -0.007093783, -1.587894, 1, 1, 1, 1, 1,
-0.7764603, -0.6310211, -3.966262, 1, 1, 1, 1, 1,
-0.7756559, 0.2426726, -0.2075203, 1, 1, 1, 1, 1,
-0.7723867, 0.2870021, -0.5596932, 1, 1, 1, 1, 1,
-0.7707543, -0.1560649, -3.189119, 1, 1, 1, 1, 1,
-0.7703853, -1.014379, -2.275744, 1, 1, 1, 1, 1,
-0.7698079, 2.53946, -0.4953427, 1, 1, 1, 1, 1,
-0.7591527, 1.27397, -2.103313, 1, 1, 1, 1, 1,
-0.752463, -1.158717, -2.077702, 1, 1, 1, 1, 1,
-0.7503415, -0.2291499, -2.220781, 1, 1, 1, 1, 1,
-0.7485754, -0.1338623, -1.615349, 1, 1, 1, 1, 1,
-0.7480255, -0.9135517, -2.028717, 1, 1, 1, 1, 1,
-0.7441962, -1.050541, -0.7980742, 1, 1, 1, 1, 1,
-0.7398833, 1.172721, 0.007425086, 1, 1, 1, 1, 1,
-0.7368942, 0.5191613, -3.519894, 0, 0, 1, 1, 1,
-0.7288094, -0.08176305, -0.5270282, 1, 0, 0, 1, 1,
-0.7246734, -0.1158918, -2.151657, 1, 0, 0, 1, 1,
-0.7206378, 1.168456, -0.02639228, 1, 0, 0, 1, 1,
-0.7176679, 1.124048, 0.02415114, 1, 0, 0, 1, 1,
-0.6963136, -0.4237119, -0.4392765, 1, 0, 0, 1, 1,
-0.6960067, -0.04041354, -0.5491567, 0, 0, 0, 1, 1,
-0.69383, -2.52385, -2.447711, 0, 0, 0, 1, 1,
-0.6930842, 0.6324094, 0.4238867, 0, 0, 0, 1, 1,
-0.6906122, -0.7023575, -3.410056, 0, 0, 0, 1, 1,
-0.6887442, 1.303768, -2.5872, 0, 0, 0, 1, 1,
-0.6881739, -1.236761, -0.5472621, 0, 0, 0, 1, 1,
-0.6854575, -0.4361241, -1.724334, 0, 0, 0, 1, 1,
-0.6728028, 0.3794794, -2.130491, 1, 1, 1, 1, 1,
-0.6698195, -0.6932324, -1.187799, 1, 1, 1, 1, 1,
-0.6684881, -0.3102459, -2.56838, 1, 1, 1, 1, 1,
-0.6671097, -0.3435948, -3.517416, 1, 1, 1, 1, 1,
-0.6631854, -0.6844128, -3.177186, 1, 1, 1, 1, 1,
-0.6595659, -0.9817705, -2.236889, 1, 1, 1, 1, 1,
-0.656217, -2.112296, -2.839723, 1, 1, 1, 1, 1,
-0.6530702, -1.915521, -2.78023, 1, 1, 1, 1, 1,
-0.6444641, 0.5476228, -0.7141445, 1, 1, 1, 1, 1,
-0.6421333, -1.434879, -3.657643, 1, 1, 1, 1, 1,
-0.6414852, -0.5535891, -3.101601, 1, 1, 1, 1, 1,
-0.6313372, -0.2000873, -2.295244, 1, 1, 1, 1, 1,
-0.6280797, 0.5989797, -0.4452834, 1, 1, 1, 1, 1,
-0.6275789, 1.351327, -1.233844, 1, 1, 1, 1, 1,
-0.6240882, 1.050893, -1.492023, 1, 1, 1, 1, 1,
-0.6222017, -0.3761049, -2.882574, 0, 0, 1, 1, 1,
-0.6158702, 1.749094, -0.6897477, 1, 0, 0, 1, 1,
-0.6145483, 0.1713188, -0.9532777, 1, 0, 0, 1, 1,
-0.613336, -0.5890946, -2.785774, 1, 0, 0, 1, 1,
-0.6112868, -0.1210705, -2.921485, 1, 0, 0, 1, 1,
-0.610097, 0.2443455, -0.8305523, 1, 0, 0, 1, 1,
-0.6097242, -0.4566047, -2.49831, 0, 0, 0, 1, 1,
-0.606796, 0.9137954, -2.200943, 0, 0, 0, 1, 1,
-0.6051485, 0.1092208, -0.9529098, 0, 0, 0, 1, 1,
-0.6048971, 0.524813, -1.826661, 0, 0, 0, 1, 1,
-0.5918212, -1.251096, -0.3889641, 0, 0, 0, 1, 1,
-0.5912635, 0.6011662, -0.06246743, 0, 0, 0, 1, 1,
-0.5891127, 2.018897, -1.61436, 0, 0, 0, 1, 1,
-0.5873663, -1.253233, -1.89229, 1, 1, 1, 1, 1,
-0.587238, 1.841084, 0.9675248, 1, 1, 1, 1, 1,
-0.5819143, -0.2712127, -0.6556696, 1, 1, 1, 1, 1,
-0.5788445, 1.472005, -1.479487, 1, 1, 1, 1, 1,
-0.575055, 0.5525684, -3.742522, 1, 1, 1, 1, 1,
-0.5734326, -1.318849, -3.156668, 1, 1, 1, 1, 1,
-0.5717524, -0.2536515, -1.465261, 1, 1, 1, 1, 1,
-0.570576, 0.03619466, -1.741749, 1, 1, 1, 1, 1,
-0.5585271, 0.5337268, -1.250352, 1, 1, 1, 1, 1,
-0.5566657, -1.052526, -3.495167, 1, 1, 1, 1, 1,
-0.5535049, -0.6103023, -2.63389, 1, 1, 1, 1, 1,
-0.5512251, 0.8968595, -0.3725262, 1, 1, 1, 1, 1,
-0.5511539, 0.1939443, -0.9605499, 1, 1, 1, 1, 1,
-0.5456586, -0.37603, -3.10715, 1, 1, 1, 1, 1,
-0.5440027, -0.4873164, -1.631773, 1, 1, 1, 1, 1,
-0.5380533, -0.7861958, -1.831572, 0, 0, 1, 1, 1,
-0.5354984, -1.353063, -3.469239, 1, 0, 0, 1, 1,
-0.533334, -0.3612553, -1.74621, 1, 0, 0, 1, 1,
-0.52717, -0.6341465, -1.02945, 1, 0, 0, 1, 1,
-0.5269725, -1.361859, -3.880327, 1, 0, 0, 1, 1,
-0.5235921, -0.5028054, -1.597955, 1, 0, 0, 1, 1,
-0.5235585, -0.5672612, -2.501264, 0, 0, 0, 1, 1,
-0.5231, -1.531096, -2.833508, 0, 0, 0, 1, 1,
-0.5230364, 0.1270483, -1.165412, 0, 0, 0, 1, 1,
-0.5189657, 1.15072, 0.4617151, 0, 0, 0, 1, 1,
-0.5132518, -0.027638, -2.294196, 0, 0, 0, 1, 1,
-0.511973, 0.1699661, -1.238926, 0, 0, 0, 1, 1,
-0.5112345, 0.3069893, -2.034228, 0, 0, 0, 1, 1,
-0.5107318, -0.1696775, -1.044538, 1, 1, 1, 1, 1,
-0.509758, 0.1449066, -1.469259, 1, 1, 1, 1, 1,
-0.5091213, -0.1555005, -1.531984, 1, 1, 1, 1, 1,
-0.5076929, -2.885606, -2.904114, 1, 1, 1, 1, 1,
-0.4978266, -2.033295, -3.806337, 1, 1, 1, 1, 1,
-0.4976794, -0.2975093, -2.103266, 1, 1, 1, 1, 1,
-0.4968875, 0.1156453, -0.9477265, 1, 1, 1, 1, 1,
-0.491034, 0.8123184, 0.8797767, 1, 1, 1, 1, 1,
-0.4904172, -2.036382, -2.267415, 1, 1, 1, 1, 1,
-0.4897243, 0.3882674, -0.2121498, 1, 1, 1, 1, 1,
-0.4835908, -0.0766487, -1.338749, 1, 1, 1, 1, 1,
-0.4832428, 0.2730991, -2.712595, 1, 1, 1, 1, 1,
-0.4815769, 1.367059, -0.0143734, 1, 1, 1, 1, 1,
-0.4798484, -0.3422285, -1.854678, 1, 1, 1, 1, 1,
-0.478465, -1.273963, -3.206723, 1, 1, 1, 1, 1,
-0.4738695, 0.2393134, -1.724706, 0, 0, 1, 1, 1,
-0.471204, -1.825515, -1.905168, 1, 0, 0, 1, 1,
-0.4698201, 0.05067678, -2.269523, 1, 0, 0, 1, 1,
-0.465839, 1.76157, -0.09507009, 1, 0, 0, 1, 1,
-0.4647116, 0.9033623, 0.1465137, 1, 0, 0, 1, 1,
-0.4626056, 0.2491386, -1.936513, 1, 0, 0, 1, 1,
-0.4611723, -1.49204, -2.000915, 0, 0, 0, 1, 1,
-0.4475684, 1.962658, -0.3240802, 0, 0, 0, 1, 1,
-0.4450469, 1.037386, -0.8112752, 0, 0, 0, 1, 1,
-0.4420952, 0.4391684, 0.144672, 0, 0, 0, 1, 1,
-0.4416946, -1.169689, -2.617882, 0, 0, 0, 1, 1,
-0.4325665, -0.1430097, -2.889226, 0, 0, 0, 1, 1,
-0.4295249, 1.436427, -1.357826, 0, 0, 0, 1, 1,
-0.4218322, -2.152249, -2.585794, 1, 1, 1, 1, 1,
-0.4183966, -2.280192, -3.89281, 1, 1, 1, 1, 1,
-0.4151459, 1.034676, 1.124019, 1, 1, 1, 1, 1,
-0.4098532, 1.287653, 0.2867487, 1, 1, 1, 1, 1,
-0.3998742, 1.166848, 0.695557, 1, 1, 1, 1, 1,
-0.398069, 0.7724314, -1.248603, 1, 1, 1, 1, 1,
-0.3964776, 2.055459, -1.444152, 1, 1, 1, 1, 1,
-0.3944498, -0.6932821, -3.303225, 1, 1, 1, 1, 1,
-0.3940527, -0.1640255, -2.332898, 1, 1, 1, 1, 1,
-0.3931431, 0.797254, -2.525225, 1, 1, 1, 1, 1,
-0.3897928, 0.9496506, 0.3068954, 1, 1, 1, 1, 1,
-0.3867859, -0.4406708, -1.273169, 1, 1, 1, 1, 1,
-0.38677, -0.2948289, -2.647787, 1, 1, 1, 1, 1,
-0.386321, -0.2549865, -0.7551397, 1, 1, 1, 1, 1,
-0.384544, 2.182171, -0.1484163, 1, 1, 1, 1, 1,
-0.3844283, -0.9013672, -2.075871, 0, 0, 1, 1, 1,
-0.384377, 0.05196971, -0.3145203, 1, 0, 0, 1, 1,
-0.3836919, -0.3961565, -1.296003, 1, 0, 0, 1, 1,
-0.3819112, -0.208091, -2.820956, 1, 0, 0, 1, 1,
-0.3799851, 0.6015289, -2.22785, 1, 0, 0, 1, 1,
-0.3775291, 0.733147, 0.4936897, 1, 0, 0, 1, 1,
-0.3773376, 1.704116, -0.008566048, 0, 0, 0, 1, 1,
-0.375085, -0.9569991, -1.082545, 0, 0, 0, 1, 1,
-0.3703269, -1.939633, -1.624771, 0, 0, 0, 1, 1,
-0.3617787, -1.014058, -2.031958, 0, 0, 0, 1, 1,
-0.3598211, 0.9217786, -0.01866557, 0, 0, 0, 1, 1,
-0.359473, -1.12292, -1.801777, 0, 0, 0, 1, 1,
-0.356864, -0.1240414, -2.050605, 0, 0, 0, 1, 1,
-0.3548897, 0.7700634, -0.3825717, 1, 1, 1, 1, 1,
-0.3467439, 0.1260517, -0.4541164, 1, 1, 1, 1, 1,
-0.343722, 1.294338, -0.4218496, 1, 1, 1, 1, 1,
-0.3432407, 0.5983956, 1.709675, 1, 1, 1, 1, 1,
-0.3424087, -0.0352472, -2.083582, 1, 1, 1, 1, 1,
-0.333703, -0.09717519, -2.464635, 1, 1, 1, 1, 1,
-0.3323684, -0.5696688, -1.572133, 1, 1, 1, 1, 1,
-0.3257354, 0.4114831, 0.04094484, 1, 1, 1, 1, 1,
-0.3255869, -0.4575426, -0.3633749, 1, 1, 1, 1, 1,
-0.3248867, -1.068191, -3.419049, 1, 1, 1, 1, 1,
-0.3173418, -0.3003931, -3.568441, 1, 1, 1, 1, 1,
-0.3158726, -1.253372, -2.710531, 1, 1, 1, 1, 1,
-0.3153977, 1.049464, -1.19439, 1, 1, 1, 1, 1,
-0.3132262, -0.4660511, -2.576018, 1, 1, 1, 1, 1,
-0.3095111, 0.6303357, -0.0228098, 1, 1, 1, 1, 1,
-0.3052251, 1.69904, 0.06448732, 0, 0, 1, 1, 1,
-0.3026435, -1.260543, -3.687721, 1, 0, 0, 1, 1,
-0.3021584, -1.383931, -2.574014, 1, 0, 0, 1, 1,
-0.3001239, 0.1326764, 0.2745838, 1, 0, 0, 1, 1,
-0.298526, 0.4661329, -2.255496, 1, 0, 0, 1, 1,
-0.2962082, 0.2766295, -0.2721507, 1, 0, 0, 1, 1,
-0.2948015, 1.331717, 0.4571659, 0, 0, 0, 1, 1,
-0.2913919, -0.6561855, -2.738078, 0, 0, 0, 1, 1,
-0.2865701, 0.8523507, 0.3089367, 0, 0, 0, 1, 1,
-0.2836207, 3.319779, 0.3769921, 0, 0, 0, 1, 1,
-0.2714113, 0.4606087, 0.5452527, 0, 0, 0, 1, 1,
-0.2556849, -1.047871, -3.132153, 0, 0, 0, 1, 1,
-0.2540064, 0.07469386, -0.4740223, 0, 0, 0, 1, 1,
-0.242489, 1.520194, -1.79635, 1, 1, 1, 1, 1,
-0.2341969, -0.5710989, -2.913538, 1, 1, 1, 1, 1,
-0.2325282, -1.326592, -3.215606, 1, 1, 1, 1, 1,
-0.2321144, 0.001096822, -2.112477, 1, 1, 1, 1, 1,
-0.2319369, 2.283538, 0.2044402, 1, 1, 1, 1, 1,
-0.2250558, 2.755306, 0.7272891, 1, 1, 1, 1, 1,
-0.2159234, -0.1803725, -1.349503, 1, 1, 1, 1, 1,
-0.2155012, -0.2690982, -1.57486, 1, 1, 1, 1, 1,
-0.2151235, 1.27541, 0.4333517, 1, 1, 1, 1, 1,
-0.2079024, -1.203263, -2.005165, 1, 1, 1, 1, 1,
-0.2037296, -1.141546, -2.572464, 1, 1, 1, 1, 1,
-0.2014055, 0.7001083, -1.115773, 1, 1, 1, 1, 1,
-0.1947639, -0.1608005, -2.169935, 1, 1, 1, 1, 1,
-0.1910318, -0.01292438, -0.5819199, 1, 1, 1, 1, 1,
-0.186915, 1.263675, 0.1276664, 1, 1, 1, 1, 1,
-0.1860099, 0.3060636, -0.52184, 0, 0, 1, 1, 1,
-0.1840867, -2.195462, -2.173779, 1, 0, 0, 1, 1,
-0.1839825, 1.436061, 1.156334, 1, 0, 0, 1, 1,
-0.1833039, 1.328703, 0.5451978, 1, 0, 0, 1, 1,
-0.1823253, 0.2212119, -0.909595, 1, 0, 0, 1, 1,
-0.1815853, 0.1757182, 0.1271679, 1, 0, 0, 1, 1,
-0.180748, 0.3238281, -2.043649, 0, 0, 0, 1, 1,
-0.1804176, -1.422554, -3.809055, 0, 0, 0, 1, 1,
-0.1763372, 0.5099589, -0.4160117, 0, 0, 0, 1, 1,
-0.1755431, 0.1007779, -1.59366, 0, 0, 0, 1, 1,
-0.1739013, -0.1941079, -2.808494, 0, 0, 0, 1, 1,
-0.1670846, -0.749593, -4.237438, 0, 0, 0, 1, 1,
-0.165996, -0.7654496, -1.654948, 0, 0, 0, 1, 1,
-0.1630036, -0.6329295, -3.800169, 1, 1, 1, 1, 1,
-0.1607255, -1.472974, -4.150247, 1, 1, 1, 1, 1,
-0.1566078, 0.7655125, 0.925625, 1, 1, 1, 1, 1,
-0.1452859, -1.768203, -4.424379, 1, 1, 1, 1, 1,
-0.144834, 0.9597563, 0.02830418, 1, 1, 1, 1, 1,
-0.1445178, -0.5431885, -3.97153, 1, 1, 1, 1, 1,
-0.1338739, 2.070649, 0.7046444, 1, 1, 1, 1, 1,
-0.1256254, 0.2481604, -0.9537718, 1, 1, 1, 1, 1,
-0.1247857, 0.7146168, -1.670191, 1, 1, 1, 1, 1,
-0.1234948, 0.3948515, 0.4618747, 1, 1, 1, 1, 1,
-0.1176026, -0.9229363, -2.966617, 1, 1, 1, 1, 1,
-0.1146545, -1.246008, -2.459494, 1, 1, 1, 1, 1,
-0.1143646, 1.17574, -0.7925792, 1, 1, 1, 1, 1,
-0.1059052, 0.6341708, -0.1167162, 1, 1, 1, 1, 1,
-0.1050447, 0.6287584, -0.2979476, 1, 1, 1, 1, 1,
-0.1008235, -0.6231782, -1.224874, 0, 0, 1, 1, 1,
-0.09941339, -0.1271264, -1.461791, 1, 0, 0, 1, 1,
-0.09411041, 1.002713, -1.481848, 1, 0, 0, 1, 1,
-0.09359691, 0.692358, -0.5630104, 1, 0, 0, 1, 1,
-0.09356587, -2.16447, -3.295177, 1, 0, 0, 1, 1,
-0.0906064, -0.145916, -3.916467, 1, 0, 0, 1, 1,
-0.09011674, -1.904962, -3.125428, 0, 0, 0, 1, 1,
-0.08949942, 0.01203814, 0.05873612, 0, 0, 0, 1, 1,
-0.08894068, -0.8881087, -1.909856, 0, 0, 0, 1, 1,
-0.08877471, -1.147604, -5.512484, 0, 0, 0, 1, 1,
-0.08817332, 1.538328, 1.527289, 0, 0, 0, 1, 1,
-0.08590215, -0.4735374, -4.955419, 0, 0, 0, 1, 1,
-0.08228442, -0.1448857, -3.290065, 0, 0, 0, 1, 1,
-0.08212448, -0.9474021, -2.758434, 1, 1, 1, 1, 1,
-0.07999416, 0.3138738, -0.6559809, 1, 1, 1, 1, 1,
-0.07572995, -0.9814269, -2.769, 1, 1, 1, 1, 1,
-0.07481483, -0.02319468, 0.4986049, 1, 1, 1, 1, 1,
-0.07223388, 0.1584172, -0.5302199, 1, 1, 1, 1, 1,
-0.06728358, 0.2326762, 1.115938, 1, 1, 1, 1, 1,
-0.0643258, 0.3597489, -0.04452447, 1, 1, 1, 1, 1,
-0.06106292, -0.75669, -2.154517, 1, 1, 1, 1, 1,
-0.05806787, 1.325715, 0.6309158, 1, 1, 1, 1, 1,
-0.0543219, 1.367586, -0.1134276, 1, 1, 1, 1, 1,
-0.05424282, -0.9664668, -4.008783, 1, 1, 1, 1, 1,
-0.05080444, 0.002615565, -0.9984615, 1, 1, 1, 1, 1,
-0.04927773, 0.2839735, 1.713331, 1, 1, 1, 1, 1,
-0.04836587, 0.7415678, -1.044521, 1, 1, 1, 1, 1,
-0.04704677, 0.5852662, 1.139087, 1, 1, 1, 1, 1,
-0.04603672, 0.2660807, 0.6725187, 0, 0, 1, 1, 1,
-0.04254925, 0.1041864, -0.9202973, 1, 0, 0, 1, 1,
-0.04179586, 0.1364658, -1.845654, 1, 0, 0, 1, 1,
-0.0400088, -1.361041, -3.22708, 1, 0, 0, 1, 1,
-0.03911671, 0.5148283, 0.1451412, 1, 0, 0, 1, 1,
-0.0260444, 0.05464201, -0.3889275, 1, 0, 0, 1, 1,
-0.02006441, 0.197705, -0.5375478, 0, 0, 0, 1, 1,
-0.0182834, 0.6063042, -0.357665, 0, 0, 0, 1, 1,
-0.01181756, 0.08442367, -0.0341332, 0, 0, 0, 1, 1,
-0.01030371, 0.4223775, -1.130303, 0, 0, 0, 1, 1,
-0.008637204, -0.2795302, -3.645227, 0, 0, 0, 1, 1,
-0.004569411, 0.03888187, 0.5545391, 0, 0, 0, 1, 1,
-0.003181647, 0.04963313, 0.7838669, 0, 0, 0, 1, 1,
-0.001787245, 1.341671, -0.09101097, 1, 1, 1, 1, 1,
0.001094676, 0.9325728, -0.9661593, 1, 1, 1, 1, 1,
0.001721304, 0.2065296, -0.6018108, 1, 1, 1, 1, 1,
0.003512416, -0.5127932, 3.219471, 1, 1, 1, 1, 1,
0.005058453, -0.2067885, 3.661003, 1, 1, 1, 1, 1,
0.005838832, 1.193209, 0.7719257, 1, 1, 1, 1, 1,
0.008319192, -0.9330813, 0.8864902, 1, 1, 1, 1, 1,
0.01103276, 0.9107175, -0.1909612, 1, 1, 1, 1, 1,
0.01186258, -0.09049504, 3.0007, 1, 1, 1, 1, 1,
0.01240899, -0.785785, 1.798322, 1, 1, 1, 1, 1,
0.01347271, 2.022517, 1.744833, 1, 1, 1, 1, 1,
0.01407742, 0.73456, 0.9762619, 1, 1, 1, 1, 1,
0.01426938, 1.373523, -1.071477, 1, 1, 1, 1, 1,
0.01570843, 0.7629542, 1.494868, 1, 1, 1, 1, 1,
0.01759106, -0.9323806, 1.829021, 1, 1, 1, 1, 1,
0.01798014, -0.2429572, 4.639521, 0, 0, 1, 1, 1,
0.03329387, 1.171392, -0.053727, 1, 0, 0, 1, 1,
0.04493795, 1.11666, 1.976817, 1, 0, 0, 1, 1,
0.04786417, -0.1776879, 1.960725, 1, 0, 0, 1, 1,
0.04830887, -0.5191997, 3.148396, 1, 0, 0, 1, 1,
0.04844603, 0.8040898, -0.3962293, 1, 0, 0, 1, 1,
0.05096377, -0.6032965, 3.07197, 0, 0, 0, 1, 1,
0.05615634, 0.875427, -1.181754, 0, 0, 0, 1, 1,
0.05679033, -0.2551596, 3.393617, 0, 0, 0, 1, 1,
0.05773171, 1.056418, 0.7831799, 0, 0, 0, 1, 1,
0.05901159, -1.47288, 1.120816, 0, 0, 0, 1, 1,
0.06322371, -0.9571537, 7.338465, 0, 0, 0, 1, 1,
0.06391116, 0.3796329, 0.6918517, 0, 0, 0, 1, 1,
0.0712632, 0.296831, -0.1789559, 1, 1, 1, 1, 1,
0.07241502, 1.201906, -0.8523383, 1, 1, 1, 1, 1,
0.07592653, -0.662461, 3.251267, 1, 1, 1, 1, 1,
0.07725319, 0.7588324, 1.089462, 1, 1, 1, 1, 1,
0.07738402, -0.04237835, 2.703348, 1, 1, 1, 1, 1,
0.07879104, 0.4397261, -0.3811846, 1, 1, 1, 1, 1,
0.1028031, 0.06447912, 1.161715, 1, 1, 1, 1, 1,
0.1091949, -0.1419587, 1.783548, 1, 1, 1, 1, 1,
0.1129366, -0.6019201, 1.822193, 1, 1, 1, 1, 1,
0.1162619, 1.514046, -0.1116055, 1, 1, 1, 1, 1,
0.1206058, 0.3415983, 0.523827, 1, 1, 1, 1, 1,
0.1242792, 0.4468841, 0.6550218, 1, 1, 1, 1, 1,
0.1278908, 1.08337, -0.7561941, 1, 1, 1, 1, 1,
0.1322725, -0.3025426, 2.781783, 1, 1, 1, 1, 1,
0.1338016, 0.2936988, 1.986408, 1, 1, 1, 1, 1,
0.1381517, 0.61356, -0.2158863, 0, 0, 1, 1, 1,
0.1451958, 0.0539097, 0.8279014, 1, 0, 0, 1, 1,
0.1454694, 2.210631, 0.8419237, 1, 0, 0, 1, 1,
0.1493802, -0.3672538, -0.446889, 1, 0, 0, 1, 1,
0.1494499, 0.5478711, -0.1026072, 1, 0, 0, 1, 1,
0.1499308, -1.360202, 1.513554, 1, 0, 0, 1, 1,
0.1515985, 1.099212, -2.227571, 0, 0, 0, 1, 1,
0.1523137, 0.4358802, 0.5492518, 0, 0, 0, 1, 1,
0.1533062, 1.120989, 1.568386, 0, 0, 0, 1, 1,
0.1542951, -0.1277162, 2.916307, 0, 0, 0, 1, 1,
0.155784, -0.221569, 2.031247, 0, 0, 0, 1, 1,
0.1562304, -1.937531, 2.592505, 0, 0, 0, 1, 1,
0.1627123, -0.4273591, 2.137581, 0, 0, 0, 1, 1,
0.1667344, 2.061547, -0.4184905, 1, 1, 1, 1, 1,
0.1668836, 1.833779, 0.05388496, 1, 1, 1, 1, 1,
0.1678031, 0.1952591, 1.724185, 1, 1, 1, 1, 1,
0.1688951, 0.6543872, 0.5198882, 1, 1, 1, 1, 1,
0.1698205, 0.6555761, -0.4714491, 1, 1, 1, 1, 1,
0.172132, 2.065322, 0.5487491, 1, 1, 1, 1, 1,
0.172906, 1.04114, 0.7886313, 1, 1, 1, 1, 1,
0.1729324, 0.01772388, 2.048394, 1, 1, 1, 1, 1,
0.1753226, 2.175224, 0.04715737, 1, 1, 1, 1, 1,
0.1857726, 0.3313095, 0.4996021, 1, 1, 1, 1, 1,
0.1905585, 0.8495111, -0.7387987, 1, 1, 1, 1, 1,
0.1906681, 2.712099, 0.6239223, 1, 1, 1, 1, 1,
0.1916861, -0.1569616, 2.109517, 1, 1, 1, 1, 1,
0.1977469, 0.1052506, 2.455436, 1, 1, 1, 1, 1,
0.1981051, -0.06199415, 3.076371, 1, 1, 1, 1, 1,
0.198962, -0.5277658, 3.539056, 0, 0, 1, 1, 1,
0.2016446, -0.9839672, 1.92057, 1, 0, 0, 1, 1,
0.2017495, 1.173758, -0.6993613, 1, 0, 0, 1, 1,
0.2017538, 0.931077, -1.550332, 1, 0, 0, 1, 1,
0.2034557, -0.6624271, 2.266088, 1, 0, 0, 1, 1,
0.2126611, -0.7142889, 3.04047, 1, 0, 0, 1, 1,
0.2138245, 1.320755, -1.712438, 0, 0, 0, 1, 1,
0.2143397, -1.877248, 3.685697, 0, 0, 0, 1, 1,
0.2213677, -0.3726355, 2.0279, 0, 0, 0, 1, 1,
0.222892, -0.0826962, 0.9016732, 0, 0, 0, 1, 1,
0.2243449, 0.9716148, 1.272628, 0, 0, 0, 1, 1,
0.2302309, 1.734801, 0.7477862, 0, 0, 0, 1, 1,
0.2312344, 1.095413, 0.2992197, 0, 0, 0, 1, 1,
0.2314284, 1.727635, -1.151682, 1, 1, 1, 1, 1,
0.241569, 0.8169211, 1.809822, 1, 1, 1, 1, 1,
0.2421496, 0.2604511, 0.6619601, 1, 1, 1, 1, 1,
0.2441374, -0.5237953, 1.310482, 1, 1, 1, 1, 1,
0.2458437, 0.8389789, -1.352891, 1, 1, 1, 1, 1,
0.2461886, -0.8331292, 2.007394, 1, 1, 1, 1, 1,
0.250281, 0.4740634, 0.8220941, 1, 1, 1, 1, 1,
0.2508782, -0.3123835, 3.93406, 1, 1, 1, 1, 1,
0.2540075, 0.6498191, 0.7541569, 1, 1, 1, 1, 1,
0.2559238, 0.2819102, -0.03186096, 1, 1, 1, 1, 1,
0.2577765, 0.8605489, 1.190681, 1, 1, 1, 1, 1,
0.2585016, -0.4951965, 2.001645, 1, 1, 1, 1, 1,
0.2658392, -0.01453966, 2.393628, 1, 1, 1, 1, 1,
0.2699296, 0.5145724, 1.299997, 1, 1, 1, 1, 1,
0.2719113, 0.3356402, 0.8064405, 1, 1, 1, 1, 1,
0.27241, -0.2417682, 3.461296, 0, 0, 1, 1, 1,
0.2737496, 2.55962, -1.05058, 1, 0, 0, 1, 1,
0.2761675, 0.4646031, 1.582232, 1, 0, 0, 1, 1,
0.2807729, -0.4756759, 2.274297, 1, 0, 0, 1, 1,
0.283249, 1.214116, 0.2593059, 1, 0, 0, 1, 1,
0.2836716, -0.1390383, 3.544847, 1, 0, 0, 1, 1,
0.2847038, 0.07707155, 1.005222, 0, 0, 0, 1, 1,
0.2848765, 0.184741, 0.5271366, 0, 0, 0, 1, 1,
0.2852812, 0.00291346, 2.211507, 0, 0, 0, 1, 1,
0.2886587, -0.4421213, 2.955771, 0, 0, 0, 1, 1,
0.2930878, -0.1725557, 2.612645, 0, 0, 0, 1, 1,
0.2965164, -1.93191, 4.142417, 0, 0, 0, 1, 1,
0.2987953, -2.845112, 2.275607, 0, 0, 0, 1, 1,
0.3019505, 0.479336, 0.06098999, 1, 1, 1, 1, 1,
0.3026623, -0.2927615, 1.863225, 1, 1, 1, 1, 1,
0.3134288, -1.678522, 2.612914, 1, 1, 1, 1, 1,
0.3215558, 0.9158694, 0.5990669, 1, 1, 1, 1, 1,
0.3220088, -0.2052679, 1.049305, 1, 1, 1, 1, 1,
0.3254828, -0.1943424, 2.107925, 1, 1, 1, 1, 1,
0.3264185, -1.504941, 1.901521, 1, 1, 1, 1, 1,
0.3269033, 1.45963, 2.030867, 1, 1, 1, 1, 1,
0.3269309, 0.1204193, -1.131115, 1, 1, 1, 1, 1,
0.3291079, -0.3411878, 2.108898, 1, 1, 1, 1, 1,
0.33228, 0.4698035, 1.151339, 1, 1, 1, 1, 1,
0.3381716, -1.776851, 3.262968, 1, 1, 1, 1, 1,
0.3420856, 0.8314899, 1.030703, 1, 1, 1, 1, 1,
0.3443605, 0.6002609, 1.182382, 1, 1, 1, 1, 1,
0.3447438, -1.134533, 1.820074, 1, 1, 1, 1, 1,
0.3449871, 2.350645, 0.3373858, 0, 0, 1, 1, 1,
0.355286, -1.604372, 2.767197, 1, 0, 0, 1, 1,
0.3572168, 0.3106266, -0.2583956, 1, 0, 0, 1, 1,
0.3585746, 1.234498, -0.5459788, 1, 0, 0, 1, 1,
0.35938, 1.256638, -1.377116, 1, 0, 0, 1, 1,
0.3598686, -0.4806255, 1.905669, 1, 0, 0, 1, 1,
0.3604661, 1.663182, -0.6435742, 0, 0, 0, 1, 1,
0.362693, -2.147568, 2.767683, 0, 0, 0, 1, 1,
0.3627443, -2.001371, 3.176383, 0, 0, 0, 1, 1,
0.3660479, -0.3315587, 3.083427, 0, 0, 0, 1, 1,
0.3690418, 1.760228, -0.09425347, 0, 0, 0, 1, 1,
0.3710437, 1.030356, 1.469914, 0, 0, 0, 1, 1,
0.3736986, -1.578923, 2.049361, 0, 0, 0, 1, 1,
0.381551, 0.9108476, 0.6361946, 1, 1, 1, 1, 1,
0.3836193, -0.7044341, 0.9113904, 1, 1, 1, 1, 1,
0.3893324, 1.377721, 1.132469, 1, 1, 1, 1, 1,
0.3916564, 0.1205371, 1.55914, 1, 1, 1, 1, 1,
0.3923669, -0.8051433, 2.416713, 1, 1, 1, 1, 1,
0.4026783, 0.3836412, 1.810799, 1, 1, 1, 1, 1,
0.4031658, -0.7280473, 2.795243, 1, 1, 1, 1, 1,
0.4048775, -0.2520562, 1.969972, 1, 1, 1, 1, 1,
0.4073332, 1.065423, -0.4374886, 1, 1, 1, 1, 1,
0.4139287, 0.3854617, 0.7618342, 1, 1, 1, 1, 1,
0.4177972, -1.364406, 1.820297, 1, 1, 1, 1, 1,
0.4231851, 0.6802328, 0.0009319174, 1, 1, 1, 1, 1,
0.4279839, -0.1590145, 2.579974, 1, 1, 1, 1, 1,
0.428338, 0.9937493, -0.1447981, 1, 1, 1, 1, 1,
0.4360724, -0.8362173, 3.935459, 1, 1, 1, 1, 1,
0.4377782, -0.2178497, 0.7286888, 0, 0, 1, 1, 1,
0.4430361, -0.9705213, 2.672363, 1, 0, 0, 1, 1,
0.4433181, -0.3229131, 4.189373, 1, 0, 0, 1, 1,
0.4509885, -1.470631, 2.727465, 1, 0, 0, 1, 1,
0.4513649, 0.3556475, 0.7205957, 1, 0, 0, 1, 1,
0.4540522, 0.8226197, 0.358282, 1, 0, 0, 1, 1,
0.4551226, -0.6335723, 2.079314, 0, 0, 0, 1, 1,
0.4552362, 0.4255378, 2.075656, 0, 0, 0, 1, 1,
0.4554372, -1.233896, 2.608559, 0, 0, 0, 1, 1,
0.4595305, 0.6121296, -0.7348619, 0, 0, 0, 1, 1,
0.4647919, 1.794706, -1.229906, 0, 0, 0, 1, 1,
0.467321, -1.008285, 1.623057, 0, 0, 0, 1, 1,
0.468605, -1.437741, 3.462214, 0, 0, 0, 1, 1,
0.4687388, 1.27193, -0.1800973, 1, 1, 1, 1, 1,
0.4764892, 0.8151445, 0.1834716, 1, 1, 1, 1, 1,
0.4891494, 0.0817441, 2.204885, 1, 1, 1, 1, 1,
0.4895809, -0.9262309, 1.942573, 1, 1, 1, 1, 1,
0.4899225, 2.432626, -1.895844, 1, 1, 1, 1, 1,
0.4936687, -0.6333904, 2.763516, 1, 1, 1, 1, 1,
0.4957666, -1.319351, 4.030261, 1, 1, 1, 1, 1,
0.4973432, -0.05596177, 0.746272, 1, 1, 1, 1, 1,
0.4973929, 1.126451, 0.6166069, 1, 1, 1, 1, 1,
0.503219, -0.1411541, 0.9459481, 1, 1, 1, 1, 1,
0.5046068, -0.8961214, 2.410644, 1, 1, 1, 1, 1,
0.504927, 0.2283888, 0.6392766, 1, 1, 1, 1, 1,
0.5109283, -1.067858, 3.733779, 1, 1, 1, 1, 1,
0.515051, 0.2701654, 0.1679525, 1, 1, 1, 1, 1,
0.5163607, -1.387583, 1.147081, 1, 1, 1, 1, 1,
0.5165809, 0.9390588, 2.687786, 0, 0, 1, 1, 1,
0.5174007, -0.4775193, 1.339337, 1, 0, 0, 1, 1,
0.5179701, 0.04449113, 1.264235, 1, 0, 0, 1, 1,
0.5202544, 1.28494, 0.3399298, 1, 0, 0, 1, 1,
0.5209216, 0.1617645, 2.103467, 1, 0, 0, 1, 1,
0.5229715, -0.5039304, 1.344001, 1, 0, 0, 1, 1,
0.52369, 0.1042236, 1.723307, 0, 0, 0, 1, 1,
0.5267528, 0.1141239, 1.9123, 0, 0, 0, 1, 1,
0.5291389, 0.582616, -0.1781449, 0, 0, 0, 1, 1,
0.5322695, -0.007100251, 0.8179742, 0, 0, 0, 1, 1,
0.532337, 1.26651, 0.4517495, 0, 0, 0, 1, 1,
0.5327535, -1.233114, 1.622237, 0, 0, 0, 1, 1,
0.5331911, -1.385589, 3.080136, 0, 0, 0, 1, 1,
0.539638, -0.955352, 2.573277, 1, 1, 1, 1, 1,
0.5422061, 0.1463985, 1.059728, 1, 1, 1, 1, 1,
0.542844, 0.1156519, 1.8308, 1, 1, 1, 1, 1,
0.5439059, 0.5036957, -0.814717, 1, 1, 1, 1, 1,
0.5452257, -0.5358164, 3.280236, 1, 1, 1, 1, 1,
0.5477087, -0.2719937, 2.702205, 1, 1, 1, 1, 1,
0.5497911, 0.5595462, 0.5667886, 1, 1, 1, 1, 1,
0.5516739, -1.861312, 4.271088, 1, 1, 1, 1, 1,
0.5525042, 0.6185704, 1.627832, 1, 1, 1, 1, 1,
0.5525097, 0.8016396, 0.2860128, 1, 1, 1, 1, 1,
0.5549331, 0.2553214, 1.82139, 1, 1, 1, 1, 1,
0.5588776, 0.205243, 0.5348226, 1, 1, 1, 1, 1,
0.5603307, 0.5153736, 1.416717, 1, 1, 1, 1, 1,
0.5617626, -0.3594849, 2.457283, 1, 1, 1, 1, 1,
0.5628232, 0.2705495, 0.5354427, 1, 1, 1, 1, 1,
0.5645797, -0.6488096, 2.953197, 0, 0, 1, 1, 1,
0.5673897, -1.003233, 3.978213, 1, 0, 0, 1, 1,
0.5691723, -0.4915973, 1.667065, 1, 0, 0, 1, 1,
0.5781074, 1.291721, -1.345899, 1, 0, 0, 1, 1,
0.5782146, 0.3394763, 2.596763, 1, 0, 0, 1, 1,
0.5794634, -0.4119158, 1.567119, 1, 0, 0, 1, 1,
0.5812442, -0.3938906, 1.006078, 0, 0, 0, 1, 1,
0.5868507, -0.5705135, 2.361527, 0, 0, 0, 1, 1,
0.5882425, 0.3163923, 0.528833, 0, 0, 0, 1, 1,
0.5900832, 0.4184954, 1.94111, 0, 0, 0, 1, 1,
0.5914516, 0.7085668, -0.5568272, 0, 0, 0, 1, 1,
0.5920278, 0.8417289, 2.726473, 0, 0, 0, 1, 1,
0.5923641, -0.05673378, 2.190253, 0, 0, 0, 1, 1,
0.5977759, -0.7224901, 1.679832, 1, 1, 1, 1, 1,
0.5981862, 0.9016023, -0.3278427, 1, 1, 1, 1, 1,
0.5986686, -0.4454666, 1.306417, 1, 1, 1, 1, 1,
0.6002842, -0.3909871, 0.7280483, 1, 1, 1, 1, 1,
0.6075348, 1.019536, 1.63228, 1, 1, 1, 1, 1,
0.609566, -0.3672957, 2.030725, 1, 1, 1, 1, 1,
0.6101396, 1.300604, 0.271525, 1, 1, 1, 1, 1,
0.6111165, 0.5802568, 0.7951187, 1, 1, 1, 1, 1,
0.614907, -0.973286, 1.98412, 1, 1, 1, 1, 1,
0.6166948, 2.327439, 0.8267916, 1, 1, 1, 1, 1,
0.6214632, 1.40972, 0.6214805, 1, 1, 1, 1, 1,
0.6232042, -0.1954666, 3.033069, 1, 1, 1, 1, 1,
0.6241761, 1.387056, 0.009296387, 1, 1, 1, 1, 1,
0.6349517, -0.3120707, 2.201419, 1, 1, 1, 1, 1,
0.6350694, 0.7114277, 1.907331, 1, 1, 1, 1, 1,
0.6351081, 0.1221545, 2.128523, 0, 0, 1, 1, 1,
0.6368068, -0.384486, 2.575294, 1, 0, 0, 1, 1,
0.6415195, -0.8341763, 1.603968, 1, 0, 0, 1, 1,
0.6422242, 0.5137601, 1.860618, 1, 0, 0, 1, 1,
0.642786, 0.4543536, 1.472361, 1, 0, 0, 1, 1,
0.6428351, 2.172694, 1.190491, 1, 0, 0, 1, 1,
0.6429515, -0.165842, 2.252374, 0, 0, 0, 1, 1,
0.6443118, -0.9959568, 3.85707, 0, 0, 0, 1, 1,
0.6443978, 1.791752, -0.6189284, 0, 0, 0, 1, 1,
0.6448408, -0.475778, 2.927217, 0, 0, 0, 1, 1,
0.6465705, -0.4895153, 2.376655, 0, 0, 0, 1, 1,
0.6481118, 1.177025, 0.6414139, 0, 0, 0, 1, 1,
0.6527649, 0.3215561, 1.001737, 0, 0, 0, 1, 1,
0.6531314, 0.5099681, -0.3563911, 1, 1, 1, 1, 1,
0.6681265, -1.161281, 3.221969, 1, 1, 1, 1, 1,
0.6683017, 1.323763, 2.532051, 1, 1, 1, 1, 1,
0.6757114, 0.9284861, 1.322268, 1, 1, 1, 1, 1,
0.6777955, -0.5021722, 1.642418, 1, 1, 1, 1, 1,
0.6782259, -0.02189165, -0.4308845, 1, 1, 1, 1, 1,
0.6821082, 0.1158788, 1.334855, 1, 1, 1, 1, 1,
0.6824174, -0.07297051, 1.284652, 1, 1, 1, 1, 1,
0.6835956, -0.7520722, 2.012156, 1, 1, 1, 1, 1,
0.6838391, 0.9872836, 0.8996516, 1, 1, 1, 1, 1,
0.6841819, -0.8541375, 3.996119, 1, 1, 1, 1, 1,
0.6877587, -1.079613, 4.431528, 1, 1, 1, 1, 1,
0.689346, -1.243951, 2.351292, 1, 1, 1, 1, 1,
0.6916106, 0.1326367, 1.533188, 1, 1, 1, 1, 1,
0.6918773, -0.1687529, 2.749903, 1, 1, 1, 1, 1,
0.6927316, 0.9530986, 0.61399, 0, 0, 1, 1, 1,
0.6943042, 0.887249, 2.340894, 1, 0, 0, 1, 1,
0.7047155, -1.063934, 0.9652966, 1, 0, 0, 1, 1,
0.7059431, -0.0313924, 3.406391, 1, 0, 0, 1, 1,
0.7074455, 0.4478329, 0.2952636, 1, 0, 0, 1, 1,
0.7086067, -0.5053521, 2.231506, 1, 0, 0, 1, 1,
0.7149265, 0.0008483197, 2.028797, 0, 0, 0, 1, 1,
0.7183201, 1.371178, 1.74363, 0, 0, 0, 1, 1,
0.7198805, -2.633891, 4.468053, 0, 0, 0, 1, 1,
0.7208184, 0.6644192, 0.4955993, 0, 0, 0, 1, 1,
0.7220426, -0.4657132, 2.444006, 0, 0, 0, 1, 1,
0.7269557, -0.008571499, 1.735985, 0, 0, 0, 1, 1,
0.7294579, 0.4882647, -0.1121634, 0, 0, 0, 1, 1,
0.7326497, 0.2792006, 1.790641, 1, 1, 1, 1, 1,
0.7357435, -1.059698, 2.419533, 1, 1, 1, 1, 1,
0.7370599, -0.5843238, 2.985408, 1, 1, 1, 1, 1,
0.7415511, -1.543975, 2.566949, 1, 1, 1, 1, 1,
0.7447094, 1.207433, 1.187175, 1, 1, 1, 1, 1,
0.7482325, -1.068514, 3.064676, 1, 1, 1, 1, 1,
0.760719, -0.4183706, 3.567786, 1, 1, 1, 1, 1,
0.7611161, -0.5025255, 2.668275, 1, 1, 1, 1, 1,
0.7726184, 1.481886, 0.304493, 1, 1, 1, 1, 1,
0.775546, -0.3834284, 1.77544, 1, 1, 1, 1, 1,
0.7798429, -0.4223877, 2.106512, 1, 1, 1, 1, 1,
0.7892019, 0.8968197, 0.3542158, 1, 1, 1, 1, 1,
0.8144718, 0.7806168, 1.135868, 1, 1, 1, 1, 1,
0.8174253, 0.5352265, 1.038751, 1, 1, 1, 1, 1,
0.8268581, 0.592416, 1.402169, 1, 1, 1, 1, 1,
0.8329673, 0.6464021, -0.4869184, 0, 0, 1, 1, 1,
0.8370048, 0.9955543, -0.2280176, 1, 0, 0, 1, 1,
0.8392617, 1.882017, 2.345829, 1, 0, 0, 1, 1,
0.8396515, -0.02259055, 1.427018, 1, 0, 0, 1, 1,
0.8409405, 0.01805891, 1.847312, 1, 0, 0, 1, 1,
0.8431818, 1.721606, 0.0363661, 1, 0, 0, 1, 1,
0.8456049, 0.2636675, -0.5364252, 0, 0, 0, 1, 1,
0.8468912, -1.160295, 2.246372, 0, 0, 0, 1, 1,
0.8489903, 2.216311, 0.04612491, 0, 0, 0, 1, 1,
0.8531184, -0.4739672, 2.106238, 0, 0, 0, 1, 1,
0.8571869, 1.367155, 0.9215573, 0, 0, 0, 1, 1,
0.8602018, 1.350591, 1.724841, 0, 0, 0, 1, 1,
0.8603562, -0.4723527, 2.52771, 0, 0, 0, 1, 1,
0.8616468, -1.369242, 2.369911, 1, 1, 1, 1, 1,
0.8701525, -0.3554383, 2.408565, 1, 1, 1, 1, 1,
0.8752361, 0.7201223, 0.3858025, 1, 1, 1, 1, 1,
0.876086, -3.72151, 1.70995, 1, 1, 1, 1, 1,
0.8768922, -1.624252, 2.634321, 1, 1, 1, 1, 1,
0.8877188, 0.7991555, -0.1358718, 1, 1, 1, 1, 1,
0.8928472, -0.05998789, 3.48104, 1, 1, 1, 1, 1,
0.8937057, -1.333265, 1.89072, 1, 1, 1, 1, 1,
0.8979917, -1.24135, 2.605696, 1, 1, 1, 1, 1,
0.902534, 1.170142, 1.676589, 1, 1, 1, 1, 1,
0.9066129, 1.125064, 1.247823, 1, 1, 1, 1, 1,
0.9160978, -0.4093037, 1.466656, 1, 1, 1, 1, 1,
0.9357294, 2.386391, 2.06535, 1, 1, 1, 1, 1,
0.9364677, 0.0286764, 2.0945, 1, 1, 1, 1, 1,
0.9368255, -0.04951815, -0.3131177, 1, 1, 1, 1, 1,
0.9449262, 0.4885012, 0.4430234, 0, 0, 1, 1, 1,
0.9460667, -0.001903636, 1.391907, 1, 0, 0, 1, 1,
0.9485216, -1.862365, 5.437886, 1, 0, 0, 1, 1,
0.9501503, 0.2088721, -0.198155, 1, 0, 0, 1, 1,
0.9520112, 0.544999, 0.6547003, 1, 0, 0, 1, 1,
0.9530795, 0.01402921, 0.6124474, 1, 0, 0, 1, 1,
0.9534684, -0.7394874, 2.311942, 0, 0, 0, 1, 1,
0.9561603, -0.5612251, 3.405637, 0, 0, 0, 1, 1,
0.9568952, 0.9784458, 0.7722667, 0, 0, 0, 1, 1,
0.9590613, -0.6961465, 2.492141, 0, 0, 0, 1, 1,
0.9596879, -1.069167, 1.919508, 0, 0, 0, 1, 1,
0.9623365, -0.3830057, 2.606077, 0, 0, 0, 1, 1,
0.9674184, -1.502139, 2.33552, 0, 0, 0, 1, 1,
0.9681817, -1.15642, 3.659566, 1, 1, 1, 1, 1,
0.9688543, 0.3876009, 1.547125, 1, 1, 1, 1, 1,
0.9701166, -0.5191552, 1.077724, 1, 1, 1, 1, 1,
0.9702761, -0.8895954, 1.090393, 1, 1, 1, 1, 1,
0.9715853, -0.1410413, 1.746978, 1, 1, 1, 1, 1,
0.9717176, -0.6128016, 3.166931, 1, 1, 1, 1, 1,
0.9735078, 0.02236565, 1.665744, 1, 1, 1, 1, 1,
0.9775572, -0.4882501, 2.090271, 1, 1, 1, 1, 1,
0.9779512, -2.095718, 2.748597, 1, 1, 1, 1, 1,
0.9934488, -0.726903, 1.385475, 1, 1, 1, 1, 1,
1.007592, 0.4597927, 0.5632815, 1, 1, 1, 1, 1,
1.012177, -1.428315, 2.889779, 1, 1, 1, 1, 1,
1.014097, -0.001836204, 1.728749, 1, 1, 1, 1, 1,
1.015724, 0.8748459, 0.8507589, 1, 1, 1, 1, 1,
1.016219, 1.205866, -0.4446258, 1, 1, 1, 1, 1,
1.016673, -0.4153699, 3.269365, 0, 0, 1, 1, 1,
1.021116, -0.2251241, 1.584995, 1, 0, 0, 1, 1,
1.025214, 0.4648435, 2.090512, 1, 0, 0, 1, 1,
1.031744, 0.2319346, 2.641734, 1, 0, 0, 1, 1,
1.033216, -0.458567, 3.481867, 1, 0, 0, 1, 1,
1.034805, -0.3975487, 1.207864, 1, 0, 0, 1, 1,
1.037089, -0.2281329, 1.954759, 0, 0, 0, 1, 1,
1.039477, -1.501286, 3.40402, 0, 0, 0, 1, 1,
1.047579, -1.030125, 1.349495, 0, 0, 0, 1, 1,
1.048774, 1.692538, 1.609229, 0, 0, 0, 1, 1,
1.058213, -0.3273498, 3.410492, 0, 0, 0, 1, 1,
1.065949, -2.547726, 2.812401, 0, 0, 0, 1, 1,
1.078102, 2.878746, 2.838055, 0, 0, 0, 1, 1,
1.084226, -1.067199, 0.4000896, 1, 1, 1, 1, 1,
1.084865, -0.1117093, 0.7983007, 1, 1, 1, 1, 1,
1.090422, -0.5859098, 3.386769, 1, 1, 1, 1, 1,
1.092903, 0.5568094, 1.357616, 1, 1, 1, 1, 1,
1.093232, 0.192839, 0.6869217, 1, 1, 1, 1, 1,
1.096075, -0.4099987, 3.650439, 1, 1, 1, 1, 1,
1.105647, -0.8911664, 2.855985, 1, 1, 1, 1, 1,
1.106709, 0.1685786, 1.14025, 1, 1, 1, 1, 1,
1.110638, 0.1448147, 0.6603098, 1, 1, 1, 1, 1,
1.113573, -2.490844, 4.321421, 1, 1, 1, 1, 1,
1.115132, 1.895194, -1.337047, 1, 1, 1, 1, 1,
1.117897, 0.7986451, 1.665023, 1, 1, 1, 1, 1,
1.118225, 1.175719, -0.9623311, 1, 1, 1, 1, 1,
1.12249, 1.248708, 1.281372, 1, 1, 1, 1, 1,
1.126107, 0.9606053, 2.605763, 1, 1, 1, 1, 1,
1.129606, -1.367378, 3.38837, 0, 0, 1, 1, 1,
1.133774, -0.4053557, 1.757346, 1, 0, 0, 1, 1,
1.137441, -0.2197322, 2.145342, 1, 0, 0, 1, 1,
1.141189, -0.7313362, 1.888967, 1, 0, 0, 1, 1,
1.143894, -1.1117, 1.362832, 1, 0, 0, 1, 1,
1.143996, 0.7321677, 0.7830738, 1, 0, 0, 1, 1,
1.153707, 0.4113815, 1.492854, 0, 0, 0, 1, 1,
1.163604, 0.8945515, 1.027501, 0, 0, 0, 1, 1,
1.168667, 0.8577662, 1.926948, 0, 0, 0, 1, 1,
1.191908, -1.703945, 3.378559, 0, 0, 0, 1, 1,
1.196876, 0.3449664, 2.3492, 0, 0, 0, 1, 1,
1.203798, -1.297204, 3.575687, 0, 0, 0, 1, 1,
1.207148, -0.637462, 3.072005, 0, 0, 0, 1, 1,
1.211113, 1.567553, 0.4677989, 1, 1, 1, 1, 1,
1.214657, 1.589763, -1.160064, 1, 1, 1, 1, 1,
1.220863, 1.239772, 2.121623, 1, 1, 1, 1, 1,
1.236487, -2.243195, 5.029647, 1, 1, 1, 1, 1,
1.24464, -0.9766659, 1.794507, 1, 1, 1, 1, 1,
1.24643, 0.6855139, -0.1745472, 1, 1, 1, 1, 1,
1.251806, -0.3930513, 2.664044, 1, 1, 1, 1, 1,
1.259711, 1.146652, -1.36299, 1, 1, 1, 1, 1,
1.271884, 1.166459, -0.5930623, 1, 1, 1, 1, 1,
1.28211, 1.845048, 3.598827, 1, 1, 1, 1, 1,
1.287516, 0.6086338, 1.538212, 1, 1, 1, 1, 1,
1.289597, 0.9441795, 0.3764674, 1, 1, 1, 1, 1,
1.290783, -1.690217, 0.6967435, 1, 1, 1, 1, 1,
1.293707, 0.5853076, 1.838591, 1, 1, 1, 1, 1,
1.296108, -1.63175, 2.858924, 1, 1, 1, 1, 1,
1.303978, -0.1540059, 1.713153, 0, 0, 1, 1, 1,
1.315168, 0.1156001, 3.326432, 1, 0, 0, 1, 1,
1.319484, 0.2089472, 1.310722, 1, 0, 0, 1, 1,
1.329034, 0.8460604, 2.07137, 1, 0, 0, 1, 1,
1.330095, 0.3249371, 1.118312, 1, 0, 0, 1, 1,
1.336607, 0.5785686, 1.17186, 1, 0, 0, 1, 1,
1.338745, -0.5055341, 2.043378, 0, 0, 0, 1, 1,
1.339794, 1.029229, 0.9521695, 0, 0, 0, 1, 1,
1.364625, 0.8064846, -0.5810548, 0, 0, 0, 1, 1,
1.371294, -1.376149, 2.311949, 0, 0, 0, 1, 1,
1.381437, 1.04765, 1.663126, 0, 0, 0, 1, 1,
1.385974, 1.440035, 0.4491116, 0, 0, 0, 1, 1,
1.399841, -0.4054239, 1.739038, 0, 0, 0, 1, 1,
1.400994, -1.899285, 1.635616, 1, 1, 1, 1, 1,
1.401639, 0.7229382, 2.34457, 1, 1, 1, 1, 1,
1.402478, 1.264006, 1.240349, 1, 1, 1, 1, 1,
1.409732, 1.579333, 1.013101, 1, 1, 1, 1, 1,
1.415967, -0.6928756, 4.882846, 1, 1, 1, 1, 1,
1.418712, -0.6935239, 2.442933, 1, 1, 1, 1, 1,
1.427445, -0.04412634, 0.6209887, 1, 1, 1, 1, 1,
1.436459, 0.4645384, 1.492629, 1, 1, 1, 1, 1,
1.440684, -0.9502357, 5.014601, 1, 1, 1, 1, 1,
1.449534, 0.8381767, -0.6590132, 1, 1, 1, 1, 1,
1.45555, -1.222086, 0.4600726, 1, 1, 1, 1, 1,
1.477836, 0.8117579, 1.883432, 1, 1, 1, 1, 1,
1.490416, 0.8151301, 1.895795, 1, 1, 1, 1, 1,
1.491627, 1.158498, 0.964337, 1, 1, 1, 1, 1,
1.494671, -0.3223917, 2.270983, 1, 1, 1, 1, 1,
1.497814, 1.20895, 1.329158, 0, 0, 1, 1, 1,
1.512618, 1.153307, -0.4027324, 1, 0, 0, 1, 1,
1.52926, 1.86278, 0.946575, 1, 0, 0, 1, 1,
1.531905, -1.595106, 1.328025, 1, 0, 0, 1, 1,
1.532179, 1.743387, 0.5164946, 1, 0, 0, 1, 1,
1.537627, 0.1848416, 2.362883, 1, 0, 0, 1, 1,
1.539644, -1.388338, 3.192407, 0, 0, 0, 1, 1,
1.540742, 0.03865591, 0.5506448, 0, 0, 0, 1, 1,
1.559033, 1.223455, 0.9779498, 0, 0, 0, 1, 1,
1.582852, -0.3561342, -0.6071927, 0, 0, 0, 1, 1,
1.602137, 1.094462, -0.4650356, 0, 0, 0, 1, 1,
1.60456, -1.050489, 1.965307, 0, 0, 0, 1, 1,
1.607303, 2.000414, 0.5503018, 0, 0, 0, 1, 1,
1.632971, 0.6205003, 0.229486, 1, 1, 1, 1, 1,
1.634584, -0.2592433, 2.780726, 1, 1, 1, 1, 1,
1.640934, 1.264887, 0.7670107, 1, 1, 1, 1, 1,
1.64797, -0.4625369, 1.454069, 1, 1, 1, 1, 1,
1.654304, -1.349645, 1.304094, 1, 1, 1, 1, 1,
1.655872, 0.6296522, 1.469515, 1, 1, 1, 1, 1,
1.656274, 0.2352938, 2.271132, 1, 1, 1, 1, 1,
1.660236, 1.232043, 0.9247274, 1, 1, 1, 1, 1,
1.663754, 0.6052057, 2.929925, 1, 1, 1, 1, 1,
1.673817, 0.5891098, 0.9244988, 1, 1, 1, 1, 1,
1.676816, 0.7720367, 1.596134, 1, 1, 1, 1, 1,
1.677729, 0.6537137, 0.2729883, 1, 1, 1, 1, 1,
1.680925, 1.071163, 1.775179, 1, 1, 1, 1, 1,
1.683786, 0.8506832, 0.4556796, 1, 1, 1, 1, 1,
1.686298, -0.2385627, 1.351802, 1, 1, 1, 1, 1,
1.70309, 1.094954, 1.284092, 0, 0, 1, 1, 1,
1.711198, -1.216735, 3.04543, 1, 0, 0, 1, 1,
1.723054, -1.104083, 2.361807, 1, 0, 0, 1, 1,
1.728595, 3.087116, -0.3547313, 1, 0, 0, 1, 1,
1.744547, -0.1912374, 0.2746199, 1, 0, 0, 1, 1,
1.752993, -1.931276, 1.902976, 1, 0, 0, 1, 1,
1.753427, 2.658521, -0.5343349, 0, 0, 0, 1, 1,
1.796143, -0.0004822442, 2.812217, 0, 0, 0, 1, 1,
1.814226, 0.7561613, 2.42934, 0, 0, 0, 1, 1,
1.818635, -0.2536548, 1.213431, 0, 0, 0, 1, 1,
1.839747, 2.755754, 0.6244848, 0, 0, 0, 1, 1,
1.848927, 0.3513463, 0.9985734, 0, 0, 0, 1, 1,
1.874897, -0.4310268, 3.706996, 0, 0, 0, 1, 1,
1.881919, -0.7285926, 4.172351, 1, 1, 1, 1, 1,
1.887353, 0.7664927, 0.6929524, 1, 1, 1, 1, 1,
1.902522, 1.356129, 0.5737995, 1, 1, 1, 1, 1,
1.908451, -1.737338, 2.051549, 1, 1, 1, 1, 1,
1.910009, 1.188516, 1.23842, 1, 1, 1, 1, 1,
1.926571, 0.3953598, 1.511955, 1, 1, 1, 1, 1,
1.929677, -0.6015519, 3.707551, 1, 1, 1, 1, 1,
1.934229, -0.6261848, 0.9665145, 1, 1, 1, 1, 1,
1.943673, 1.699145, -0.6721936, 1, 1, 1, 1, 1,
1.955227, 1.045836, 0.8027232, 1, 1, 1, 1, 1,
1.957849, -1.055624, 3.247221, 1, 1, 1, 1, 1,
1.966961, -0.8609251, 1.41388, 1, 1, 1, 1, 1,
1.968164, 1.65996, 2.178763, 1, 1, 1, 1, 1,
1.979749, -1.45308, 1.871994, 1, 1, 1, 1, 1,
1.999103, -0.5715916, 2.729366, 1, 1, 1, 1, 1,
2.001906, 1.009421, 2.231866, 0, 0, 1, 1, 1,
2.047603, -1.02075, 1.555935, 1, 0, 0, 1, 1,
2.068713, -0.5435181, 2.451684, 1, 0, 0, 1, 1,
2.073421, 2.002846, -0.8519335, 1, 0, 0, 1, 1,
2.102324, 2.340037, -0.4352292, 1, 0, 0, 1, 1,
2.153812, 0.2599299, 1.719481, 1, 0, 0, 1, 1,
2.192818, 1.238039, -0.6186862, 0, 0, 0, 1, 1,
2.203409, 1.032198, 1.854104, 0, 0, 0, 1, 1,
2.235735, -0.8377341, 2.489611, 0, 0, 0, 1, 1,
2.251805, -0.7707725, 1.49769, 0, 0, 0, 1, 1,
2.31865, -0.2752429, 2.568314, 0, 0, 0, 1, 1,
2.352027, 1.187558, -0.1215041, 0, 0, 0, 1, 1,
2.353384, -1.69579, 1.742041, 0, 0, 0, 1, 1,
2.424713, 1.38715, 1.283442, 1, 1, 1, 1, 1,
2.476817, -0.1539374, 0.5637518, 1, 1, 1, 1, 1,
2.498702, -0.3371553, 1.115854, 1, 1, 1, 1, 1,
2.523698, 0.8074679, 2.760965, 1, 1, 1, 1, 1,
2.57274, 0.6982242, 1.295294, 1, 1, 1, 1, 1,
2.653416, 1.039286, 0.8093617, 1, 1, 1, 1, 1,
2.747318, -0.3220459, 2.436704, 1, 1, 1, 1, 1
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
var radius = 10.50555;
var distance = 36.90031;
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
mvMatrix.translate( 0.207199, 0.2008653, -0.9129903 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.90031);
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
