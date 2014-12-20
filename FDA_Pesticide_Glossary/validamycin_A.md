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
-4.080733, -1.172149, -0.06791925, 1, 0, 0, 1,
-3.139025, -0.5669352, -1.067831, 1, 0.007843138, 0, 1,
-3.035532, 0.5199232, -0.6499412, 1, 0.01176471, 0, 1,
-2.528219, 1.437026, -0.7974491, 1, 0.01960784, 0, 1,
-2.52602, 1.217074, -0.5106142, 1, 0.02352941, 0, 1,
-2.465689, -0.183079, -2.035867, 1, 0.03137255, 0, 1,
-2.321487, 0.2166453, -1.37713, 1, 0.03529412, 0, 1,
-2.239929, 0.6202582, -2.219476, 1, 0.04313726, 0, 1,
-2.23673, 1.069977, 0.2840454, 1, 0.04705882, 0, 1,
-2.205465, 0.2987861, -2.247142, 1, 0.05490196, 0, 1,
-2.148305, 1.654446, 0.02598383, 1, 0.05882353, 0, 1,
-2.117762, -0.8831877, -2.718761, 1, 0.06666667, 0, 1,
-2.103568, -1.069903, -2.533176, 1, 0.07058824, 0, 1,
-2.065142, -0.03225986, -1.940982, 1, 0.07843138, 0, 1,
-2.040563, 0.8414401, -2.89549, 1, 0.08235294, 0, 1,
-2.032609, 1.39346, -1.544695, 1, 0.09019608, 0, 1,
-2.026437, -0.4052223, -1.741199, 1, 0.09411765, 0, 1,
-2.023499, -1.51891, -3.063731, 1, 0.1019608, 0, 1,
-1.950392, 0.3882169, -1.542824, 1, 0.1098039, 0, 1,
-1.943992, 0.7901915, -3.599722, 1, 0.1137255, 0, 1,
-1.943819, 0.07621069, -3.819795, 1, 0.1215686, 0, 1,
-1.937409, 0.8411643, -0.8804322, 1, 0.1254902, 0, 1,
-1.886751, 0.04117756, -1.913777, 1, 0.1333333, 0, 1,
-1.847817, 0.387492, -1.107867, 1, 0.1372549, 0, 1,
-1.84691, -0.2729649, 0.3702424, 1, 0.145098, 0, 1,
-1.845798, -1.809918, -3.625025, 1, 0.1490196, 0, 1,
-1.83496, -0.2006097, -2.269368, 1, 0.1568628, 0, 1,
-1.829625, 0.7709368, -0.2762731, 1, 0.1607843, 0, 1,
-1.815406, 2.178044, -1.153525, 1, 0.1686275, 0, 1,
-1.809498, -0.4390804, -2.75047, 1, 0.172549, 0, 1,
-1.80717, 0.7243944, -1.933515, 1, 0.1803922, 0, 1,
-1.806816, -1.055153, -3.452721, 1, 0.1843137, 0, 1,
-1.783988, -1.403788, -1.605546, 1, 0.1921569, 0, 1,
-1.782017, -1.832629, -1.048737, 1, 0.1960784, 0, 1,
-1.765789, -0.6585482, -2.698512, 1, 0.2039216, 0, 1,
-1.75708, -1.096904, -1.99708, 1, 0.2117647, 0, 1,
-1.74458, 0.05364963, -1.554143, 1, 0.2156863, 0, 1,
-1.730746, 0.05095758, -1.263615, 1, 0.2235294, 0, 1,
-1.715429, -0.5062032, -2.690575, 1, 0.227451, 0, 1,
-1.702348, 0.9264758, -3.349912, 1, 0.2352941, 0, 1,
-1.694443, 0.7841362, -1.869822, 1, 0.2392157, 0, 1,
-1.684972, -0.9212112, -1.010493, 1, 0.2470588, 0, 1,
-1.676558, -0.1260963, -1.47342, 1, 0.2509804, 0, 1,
-1.658867, 1.509623, -1.639776, 1, 0.2588235, 0, 1,
-1.655979, 0.6782129, -0.2619926, 1, 0.2627451, 0, 1,
-1.654712, -0.2449932, -1.611034, 1, 0.2705882, 0, 1,
-1.653276, 0.02796528, -1.805619, 1, 0.2745098, 0, 1,
-1.646834, -0.9921685, -2.058108, 1, 0.282353, 0, 1,
-1.640626, -2.19544, 0.03222527, 1, 0.2862745, 0, 1,
-1.639957, -0.7196255, -0.9091057, 1, 0.2941177, 0, 1,
-1.629778, 0.8216835, 0.002225896, 1, 0.3019608, 0, 1,
-1.628404, 0.2815977, -2.00845, 1, 0.3058824, 0, 1,
-1.625422, 1.17891, -0.9888204, 1, 0.3137255, 0, 1,
-1.619207, -0.6782091, -2.504952, 1, 0.3176471, 0, 1,
-1.611381, -1.032273, -1.74933, 1, 0.3254902, 0, 1,
-1.606601, 0.1727327, -1.690416, 1, 0.3294118, 0, 1,
-1.603861, 0.1205254, -0.7807665, 1, 0.3372549, 0, 1,
-1.60204, -2.14812, -2.305811, 1, 0.3411765, 0, 1,
-1.593694, -1.283886, -1.986212, 1, 0.3490196, 0, 1,
-1.591757, -1.328029, -3.820732, 1, 0.3529412, 0, 1,
-1.572241, 0.7346892, -1.372054, 1, 0.3607843, 0, 1,
-1.565212, -0.09589434, -1.088459, 1, 0.3647059, 0, 1,
-1.549425, 0.4533464, -0.5471765, 1, 0.372549, 0, 1,
-1.546682, 0.6987864, -0.4212225, 1, 0.3764706, 0, 1,
-1.531194, -2.322156, -0.5765333, 1, 0.3843137, 0, 1,
-1.531164, 0.916131, -1.921307, 1, 0.3882353, 0, 1,
-1.524865, -0.4264061, 1.095426, 1, 0.3960784, 0, 1,
-1.51596, 0.06026533, -3.478817, 1, 0.4039216, 0, 1,
-1.504742, 0.1098629, -3.185384, 1, 0.4078431, 0, 1,
-1.50171, 2.063529, -0.5469559, 1, 0.4156863, 0, 1,
-1.461437, -0.6557178, -1.070321, 1, 0.4196078, 0, 1,
-1.443202, 0.5013979, -1.388043, 1, 0.427451, 0, 1,
-1.438843, -0.7174368, -2.302965, 1, 0.4313726, 0, 1,
-1.431728, -0.3316378, -2.294685, 1, 0.4392157, 0, 1,
-1.429725, -1.583385, -2.404725, 1, 0.4431373, 0, 1,
-1.429718, 1.510246, -0.8451294, 1, 0.4509804, 0, 1,
-1.420551, -0.3043703, -1.213856, 1, 0.454902, 0, 1,
-1.416668, 0.01263345, -2.609349, 1, 0.4627451, 0, 1,
-1.396514, -1.206008, -2.110102, 1, 0.4666667, 0, 1,
-1.39631, -0.8091106, -2.644846, 1, 0.4745098, 0, 1,
-1.376272, 0.6168596, -0.6914549, 1, 0.4784314, 0, 1,
-1.360992, 0.1522291, -3.271246, 1, 0.4862745, 0, 1,
-1.359665, -0.1632634, -2.022842, 1, 0.4901961, 0, 1,
-1.345437, -0.6137861, -1.653857, 1, 0.4980392, 0, 1,
-1.335454, 0.1698564, -0.824005, 1, 0.5058824, 0, 1,
-1.334337, 0.6193725, -1.033329, 1, 0.509804, 0, 1,
-1.334092, 1.500288, -0.6894372, 1, 0.5176471, 0, 1,
-1.332204, 2.560483, 0.06681975, 1, 0.5215687, 0, 1,
-1.280163, 0.3376358, -2.275684, 1, 0.5294118, 0, 1,
-1.275663, 0.3276286, -0.9807596, 1, 0.5333334, 0, 1,
-1.271241, 1.725426, 1.134068, 1, 0.5411765, 0, 1,
-1.271171, 0.2213735, -1.109673, 1, 0.5450981, 0, 1,
-1.270783, 0.4130805, -1.764173, 1, 0.5529412, 0, 1,
-1.253218, 1.545433, -1.467969, 1, 0.5568628, 0, 1,
-1.249811, -1.446547, -3.924232, 1, 0.5647059, 0, 1,
-1.238277, -0.02769218, -1.187631, 1, 0.5686275, 0, 1,
-1.227316, -0.1225569, -1.815575, 1, 0.5764706, 0, 1,
-1.222963, 0.1625552, -2.31892, 1, 0.5803922, 0, 1,
-1.217846, 0.8600215, -0.7251129, 1, 0.5882353, 0, 1,
-1.214291, -0.8221818, -1.344562, 1, 0.5921569, 0, 1,
-1.213325, -0.9891588, -1.496807, 1, 0.6, 0, 1,
-1.210011, -0.04961849, -1.250192, 1, 0.6078432, 0, 1,
-1.20585, -0.02516554, -2.219989, 1, 0.6117647, 0, 1,
-1.199993, -0.9825645, -0.9925946, 1, 0.6196079, 0, 1,
-1.196882, 0.1754492, -0.8189529, 1, 0.6235294, 0, 1,
-1.195919, -0.2861844, -0.769824, 1, 0.6313726, 0, 1,
-1.186409, 0.2063681, -1.895105, 1, 0.6352941, 0, 1,
-1.183691, 0.255125, -0.03935654, 1, 0.6431373, 0, 1,
-1.176598, 0.5104924, -0.3431077, 1, 0.6470588, 0, 1,
-1.173779, 0.8615066, -1.025165, 1, 0.654902, 0, 1,
-1.170818, -0.007956143, 1.396175, 1, 0.6588235, 0, 1,
-1.169996, 1.728605, -0.4405302, 1, 0.6666667, 0, 1,
-1.168314, 0.1541664, -2.507272, 1, 0.6705883, 0, 1,
-1.159157, -0.1987596, -2.406065, 1, 0.6784314, 0, 1,
-1.139334, 0.505948, -0.4659865, 1, 0.682353, 0, 1,
-1.138402, 0.2092364, -2.09629, 1, 0.6901961, 0, 1,
-1.136018, 0.3617497, -2.101629, 1, 0.6941177, 0, 1,
-1.135534, -2.128324, -2.861279, 1, 0.7019608, 0, 1,
-1.129905, -0.7250537, -2.514917, 1, 0.7098039, 0, 1,
-1.125003, -1.347923, -2.397411, 1, 0.7137255, 0, 1,
-1.124042, -1.275635, -2.125586, 1, 0.7215686, 0, 1,
-1.118572, -0.2696226, -1.618695, 1, 0.7254902, 0, 1,
-1.118235, -0.8781529, -1.974385, 1, 0.7333333, 0, 1,
-1.117785, -1.430608, -2.478332, 1, 0.7372549, 0, 1,
-1.117324, -1.23594, -3.847574, 1, 0.7450981, 0, 1,
-1.117005, 0.3356401, -1.375561, 1, 0.7490196, 0, 1,
-1.116876, 0.329261, -2.683624, 1, 0.7568628, 0, 1,
-1.101296, 0.6313344, -0.008096915, 1, 0.7607843, 0, 1,
-1.09929, 0.02499398, -2.293285, 1, 0.7686275, 0, 1,
-1.096957, 0.02448275, -2.374829, 1, 0.772549, 0, 1,
-1.068586, -0.5692105, 0.3783723, 1, 0.7803922, 0, 1,
-1.065766, 0.8861035, -2.838001, 1, 0.7843137, 0, 1,
-1.064904, -0.7241923, -1.63645, 1, 0.7921569, 0, 1,
-1.056905, -0.9002746, -3.805605, 1, 0.7960784, 0, 1,
-1.051639, -0.405573, -1.746847, 1, 0.8039216, 0, 1,
-1.05102, 2.063183, -1.319699, 1, 0.8117647, 0, 1,
-1.040349, -0.1970344, -1.061634, 1, 0.8156863, 0, 1,
-1.037436, -0.6004419, -2.210143, 1, 0.8235294, 0, 1,
-1.037416, 0.735118, 0.4663146, 1, 0.827451, 0, 1,
-1.03655, 0.1876338, -1.020384, 1, 0.8352941, 0, 1,
-1.031706, -0.8096266, -3.685228, 1, 0.8392157, 0, 1,
-1.031467, -0.8022727, -3.163112, 1, 0.8470588, 0, 1,
-1.025297, 0.8281151, -3.042211, 1, 0.8509804, 0, 1,
-1.023508, -0.2725748, -2.312951, 1, 0.8588235, 0, 1,
-1.022572, -1.428401, -2.885693, 1, 0.8627451, 0, 1,
-1.021187, -0.1948065, -2.181017, 1, 0.8705882, 0, 1,
-1.013837, 0.2825336, -1.749613, 1, 0.8745098, 0, 1,
-1.007967, 0.5088463, 0.4980926, 1, 0.8823529, 0, 1,
-0.9950573, -0.7672368, -1.722152, 1, 0.8862745, 0, 1,
-0.9948086, -1.133025, -3.874345, 1, 0.8941177, 0, 1,
-0.9931091, 1.409957, 1.397019, 1, 0.8980392, 0, 1,
-0.9884128, -0.6137844, -2.511005, 1, 0.9058824, 0, 1,
-0.9811444, 0.51153, -1.862784, 1, 0.9137255, 0, 1,
-0.9741437, -0.1833808, -2.4807, 1, 0.9176471, 0, 1,
-0.9681733, -0.9627326, -0.9837187, 1, 0.9254902, 0, 1,
-0.9679261, 1.437647, 0.5459591, 1, 0.9294118, 0, 1,
-0.9675887, -0.7870038, -3.881004, 1, 0.9372549, 0, 1,
-0.9658006, -0.9509489, -1.216054, 1, 0.9411765, 0, 1,
-0.9652124, 0.07602053, -2.417136, 1, 0.9490196, 0, 1,
-0.9621761, 0.8959112, 0.599508, 1, 0.9529412, 0, 1,
-0.9578781, 1.425404, -0.9456564, 1, 0.9607843, 0, 1,
-0.9560462, -0.5310259, -3.167433, 1, 0.9647059, 0, 1,
-0.9558272, 0.2261498, -2.581901, 1, 0.972549, 0, 1,
-0.9543169, -1.189118, -1.683224, 1, 0.9764706, 0, 1,
-0.954026, -1.588877, -2.452055, 1, 0.9843137, 0, 1,
-0.9525064, 1.715156, -0.4582179, 1, 0.9882353, 0, 1,
-0.9483228, -1.415768, -1.78521, 1, 0.9960784, 0, 1,
-0.9382476, 0.1392381, -0.9763175, 0.9960784, 1, 0, 1,
-0.9374502, 0.7228945, -2.227017, 0.9921569, 1, 0, 1,
-0.9348125, 0.7592439, -1.514819, 0.9843137, 1, 0, 1,
-0.9290584, -1.794156, -2.038717, 0.9803922, 1, 0, 1,
-0.928182, 1.43684, -0.1744395, 0.972549, 1, 0, 1,
-0.9281501, -0.3238384, -2.446495, 0.9686275, 1, 0, 1,
-0.9251152, -0.6482436, -0.4363592, 0.9607843, 1, 0, 1,
-0.9205443, -2.18083, -3.267114, 0.9568627, 1, 0, 1,
-0.9177696, 0.2250213, -1.463378, 0.9490196, 1, 0, 1,
-0.9175268, -2.307204, -1.830118, 0.945098, 1, 0, 1,
-0.9143071, -0.5875283, -2.67592, 0.9372549, 1, 0, 1,
-0.9035835, 0.4086225, -1.320531, 0.9333333, 1, 0, 1,
-0.8989029, 1.902439, -0.3671987, 0.9254902, 1, 0, 1,
-0.8928458, 1.039579, 0.2317706, 0.9215686, 1, 0, 1,
-0.8869402, -0.8864888, -4.114756, 0.9137255, 1, 0, 1,
-0.8829691, -0.3430735, -1.94099, 0.9098039, 1, 0, 1,
-0.8763734, 0.5971531, -1.528555, 0.9019608, 1, 0, 1,
-0.8754239, 1.358582, 0.4416065, 0.8941177, 1, 0, 1,
-0.87467, -0.2805858, -0.5048457, 0.8901961, 1, 0, 1,
-0.8746325, -0.9059601, -1.252529, 0.8823529, 1, 0, 1,
-0.8734235, 1.349961, -0.09310318, 0.8784314, 1, 0, 1,
-0.8710046, 0.9252497, -1.026783, 0.8705882, 1, 0, 1,
-0.8642648, -0.383836, -2.974168, 0.8666667, 1, 0, 1,
-0.8565795, -0.6910242, -1.828958, 0.8588235, 1, 0, 1,
-0.8497277, -0.4097281, -0.6776823, 0.854902, 1, 0, 1,
-0.8411352, -0.05729378, -2.001702, 0.8470588, 1, 0, 1,
-0.8408784, 0.7423406, -2.809382, 0.8431373, 1, 0, 1,
-0.8303772, 0.9563187, -0.2960337, 0.8352941, 1, 0, 1,
-0.829802, 0.3403606, -3.658381, 0.8313726, 1, 0, 1,
-0.8285573, -1.245267, -3.219465, 0.8235294, 1, 0, 1,
-0.8280446, 0.4061632, -2.68538, 0.8196079, 1, 0, 1,
-0.8239503, 0.07576981, -0.5465368, 0.8117647, 1, 0, 1,
-0.8236411, 1.118094, -0.5277987, 0.8078431, 1, 0, 1,
-0.8206233, -0.09733077, -1.717721, 0.8, 1, 0, 1,
-0.8181206, -0.6260077, -2.218764, 0.7921569, 1, 0, 1,
-0.8176834, 0.1606019, -1.709908, 0.7882353, 1, 0, 1,
-0.8148206, 0.7006924, -1.412066, 0.7803922, 1, 0, 1,
-0.8110272, 0.6659483, -0.9526983, 0.7764706, 1, 0, 1,
-0.810891, 1.904366, 1.079634, 0.7686275, 1, 0, 1,
-0.8075907, 0.9958214, -0.2051068, 0.7647059, 1, 0, 1,
-0.8075211, -0.5065839, -1.7649, 0.7568628, 1, 0, 1,
-0.8071299, -0.4592941, -1.856017, 0.7529412, 1, 0, 1,
-0.801927, -0.002282342, 0.1342957, 0.7450981, 1, 0, 1,
-0.7963868, -0.03792709, -2.011185, 0.7411765, 1, 0, 1,
-0.7870058, 0.7057352, -0.3467351, 0.7333333, 1, 0, 1,
-0.7847065, -0.1150119, -3.430667, 0.7294118, 1, 0, 1,
-0.7815605, -0.6439043, -2.915384, 0.7215686, 1, 0, 1,
-0.7747717, 2.246897, -0.3639514, 0.7176471, 1, 0, 1,
-0.7703754, -3.096758, -2.923245, 0.7098039, 1, 0, 1,
-0.7691687, -0.5104052, -3.13472, 0.7058824, 1, 0, 1,
-0.7685438, 0.7727962, -0.6553462, 0.6980392, 1, 0, 1,
-0.7649653, -0.2521985, -3.539093, 0.6901961, 1, 0, 1,
-0.7547563, -1.71374, -3.825171, 0.6862745, 1, 0, 1,
-0.7400854, -0.2114793, -0.02647345, 0.6784314, 1, 0, 1,
-0.7379519, -1.515429, -3.956491, 0.6745098, 1, 0, 1,
-0.7357377, 0.4886035, -0.2502597, 0.6666667, 1, 0, 1,
-0.7302226, -0.6672608, -2.092062, 0.6627451, 1, 0, 1,
-0.7296808, 1.045222, 0.4351935, 0.654902, 1, 0, 1,
-0.7207411, 0.1380898, -1.599697, 0.6509804, 1, 0, 1,
-0.7198799, -1.759259, -3.319777, 0.6431373, 1, 0, 1,
-0.7106837, -0.2871286, -3.19359, 0.6392157, 1, 0, 1,
-0.7066158, -0.8330546, -1.466718, 0.6313726, 1, 0, 1,
-0.688067, -0.1300005, -0.9789395, 0.627451, 1, 0, 1,
-0.6832197, 0.3758716, -0.02653526, 0.6196079, 1, 0, 1,
-0.68175, 2.182705, -0.9867136, 0.6156863, 1, 0, 1,
-0.6786126, 0.2159369, 0.09532055, 0.6078432, 1, 0, 1,
-0.6765967, -0.6553518, -2.27392, 0.6039216, 1, 0, 1,
-0.6759958, 1.767815, -0.7148947, 0.5960785, 1, 0, 1,
-0.6759613, -0.7233472, -2.677363, 0.5882353, 1, 0, 1,
-0.6701233, 1.667466, -0.5584958, 0.5843138, 1, 0, 1,
-0.6640285, -0.9459493, -2.878276, 0.5764706, 1, 0, 1,
-0.6614624, 1.152085, -2.238949, 0.572549, 1, 0, 1,
-0.6587306, -1.755638, -2.405855, 0.5647059, 1, 0, 1,
-0.6573886, -1.87786, -1.078553, 0.5607843, 1, 0, 1,
-0.6551278, 0.4646173, 0.1846657, 0.5529412, 1, 0, 1,
-0.6533847, 1.197403, 0.9898269, 0.5490196, 1, 0, 1,
-0.6533623, -1.169522, -1.833716, 0.5411765, 1, 0, 1,
-0.653123, -1.34628, -0.928183, 0.5372549, 1, 0, 1,
-0.6498395, -1.527972, -2.512145, 0.5294118, 1, 0, 1,
-0.6453996, 0.8927897, -0.883736, 0.5254902, 1, 0, 1,
-0.6416707, -1.716765, -2.17662, 0.5176471, 1, 0, 1,
-0.6409401, -0.3842221, -2.486194, 0.5137255, 1, 0, 1,
-0.639026, -0.5058457, -3.156147, 0.5058824, 1, 0, 1,
-0.638459, 0.6330633, -0.321389, 0.5019608, 1, 0, 1,
-0.6357391, -0.6346284, -2.928697, 0.4941176, 1, 0, 1,
-0.6311301, 1.044656, -0.2778138, 0.4862745, 1, 0, 1,
-0.6260665, 1.61612, -1.533359, 0.4823529, 1, 0, 1,
-0.6257223, 0.9738956, -1.78536, 0.4745098, 1, 0, 1,
-0.6244977, 0.9480349, 0.3800067, 0.4705882, 1, 0, 1,
-0.6195261, -1.481955, -3.897051, 0.4627451, 1, 0, 1,
-0.6174384, 1.964409, 0.5547585, 0.4588235, 1, 0, 1,
-0.6173248, 1.361167, 0.1147146, 0.4509804, 1, 0, 1,
-0.6161032, 0.3389331, -0.2508487, 0.4470588, 1, 0, 1,
-0.6126713, 0.3552913, -1.040637, 0.4392157, 1, 0, 1,
-0.6079222, 0.1610382, -2.628007, 0.4352941, 1, 0, 1,
-0.6062681, -0.3827617, -3.062865, 0.427451, 1, 0, 1,
-0.6019285, -2.86721, -2.0025, 0.4235294, 1, 0, 1,
-0.6005128, 1.651266, -0.7400081, 0.4156863, 1, 0, 1,
-0.5990028, -0.557202, -0.4010424, 0.4117647, 1, 0, 1,
-0.5950501, -2.361282, -1.799377, 0.4039216, 1, 0, 1,
-0.5892307, -0.2429319, -1.955898, 0.3960784, 1, 0, 1,
-0.5870612, 0.03159551, -1.703125, 0.3921569, 1, 0, 1,
-0.586307, -0.1434491, -2.312547, 0.3843137, 1, 0, 1,
-0.5838451, -0.1477416, -1.842845, 0.3803922, 1, 0, 1,
-0.5795388, -0.2451888, -2.264044, 0.372549, 1, 0, 1,
-0.5770171, -1.377873, -3.769248, 0.3686275, 1, 0, 1,
-0.5757273, -0.8606511, -3.646988, 0.3607843, 1, 0, 1,
-0.5715665, 0.5197832, -2.50839, 0.3568628, 1, 0, 1,
-0.5654173, -0.1747275, -2.752609, 0.3490196, 1, 0, 1,
-0.564104, 1.114425, -1.806984, 0.345098, 1, 0, 1,
-0.5555912, 0.8678775, -1.122973, 0.3372549, 1, 0, 1,
-0.5548287, -0.5417581, -1.347369, 0.3333333, 1, 0, 1,
-0.5532981, 1.734105, -0.965792, 0.3254902, 1, 0, 1,
-0.550354, -0.8481408, -4.017284, 0.3215686, 1, 0, 1,
-0.5496824, 0.0002679622, -0.2700278, 0.3137255, 1, 0, 1,
-0.5466723, 0.4267342, -0.6997303, 0.3098039, 1, 0, 1,
-0.5446338, -0.5057368, -3.835489, 0.3019608, 1, 0, 1,
-0.5432588, 0.1479154, -2.964531, 0.2941177, 1, 0, 1,
-0.539083, 0.434974, -0.2673241, 0.2901961, 1, 0, 1,
-0.5332491, 0.7793872, -0.7683335, 0.282353, 1, 0, 1,
-0.533248, 1.367308, -1.349579, 0.2784314, 1, 0, 1,
-0.5324976, 1.280701, -1.490264, 0.2705882, 1, 0, 1,
-0.5290923, -0.9828112, -2.87026, 0.2666667, 1, 0, 1,
-0.5266079, 2.689128, -0.8573849, 0.2588235, 1, 0, 1,
-0.526452, -0.4287879, -3.115715, 0.254902, 1, 0, 1,
-0.5238003, -0.8930246, -3.502944, 0.2470588, 1, 0, 1,
-0.5237928, -0.5071549, -0.6056068, 0.2431373, 1, 0, 1,
-0.5227445, 0.8874235, -1.932042, 0.2352941, 1, 0, 1,
-0.5209267, 0.8358556, -1.684778, 0.2313726, 1, 0, 1,
-0.5192347, -0.3540678, -3.154094, 0.2235294, 1, 0, 1,
-0.5175934, -1.114404, -1.738974, 0.2196078, 1, 0, 1,
-0.5128751, 0.1992988, -1.156911, 0.2117647, 1, 0, 1,
-0.5069504, -0.6634631, -2.090835, 0.2078431, 1, 0, 1,
-0.5034246, 1.328412, -0.3899381, 0.2, 1, 0, 1,
-0.5026937, -0.6815233, -2.648242, 0.1921569, 1, 0, 1,
-0.5020069, 0.7117659, -1.750088, 0.1882353, 1, 0, 1,
-0.5018391, 0.7094265, -0.4869174, 0.1803922, 1, 0, 1,
-0.4946061, 0.6200633, -0.6790532, 0.1764706, 1, 0, 1,
-0.4906572, -0.4534138, -1.377884, 0.1686275, 1, 0, 1,
-0.4886189, 1.249983, -0.217385, 0.1647059, 1, 0, 1,
-0.4841396, -0.09300573, -2.356408, 0.1568628, 1, 0, 1,
-0.4831336, -1.329529, -1.396343, 0.1529412, 1, 0, 1,
-0.4822935, -0.6486676, -1.492278, 0.145098, 1, 0, 1,
-0.4791725, 0.02408758, -2.696918, 0.1411765, 1, 0, 1,
-0.4742573, 0.3128383, -0.4696535, 0.1333333, 1, 0, 1,
-0.4740318, -0.3495484, -1.344964, 0.1294118, 1, 0, 1,
-0.4668083, -1.308044, -1.164491, 0.1215686, 1, 0, 1,
-0.4664895, 0.1856301, -1.464096, 0.1176471, 1, 0, 1,
-0.4645513, 1.098503, -1.042579, 0.1098039, 1, 0, 1,
-0.4621145, -1.54494, -3.15037, 0.1058824, 1, 0, 1,
-0.4583634, -1.456669, -3.291097, 0.09803922, 1, 0, 1,
-0.4572267, -0.3601465, -2.9663, 0.09019608, 1, 0, 1,
-0.4568006, 0.3998184, -0.5645451, 0.08627451, 1, 0, 1,
-0.455505, 1.03951, 0.04659991, 0.07843138, 1, 0, 1,
-0.4546916, 0.2401479, -1.457789, 0.07450981, 1, 0, 1,
-0.4525758, -1.975024, -3.565657, 0.06666667, 1, 0, 1,
-0.4515174, -0.07514051, -0.2170312, 0.0627451, 1, 0, 1,
-0.4498397, -0.3086403, -3.275174, 0.05490196, 1, 0, 1,
-0.4457796, -1.037915, -2.821565, 0.05098039, 1, 0, 1,
-0.4416925, -1.180948, -3.845046, 0.04313726, 1, 0, 1,
-0.4407466, -0.05884242, -2.893804, 0.03921569, 1, 0, 1,
-0.4387908, 0.9852033, -0.6185446, 0.03137255, 1, 0, 1,
-0.4324817, 0.289793, -1.152266, 0.02745098, 1, 0, 1,
-0.4312163, -0.4666278, -1.501087, 0.01960784, 1, 0, 1,
-0.4289322, 0.4344261, -1.150624, 0.01568628, 1, 0, 1,
-0.4288766, -0.516292, -3.0068, 0.007843138, 1, 0, 1,
-0.4273985, 0.8664318, 0.0866857, 0.003921569, 1, 0, 1,
-0.4260099, 1.658741, -0.0920193, 0, 1, 0.003921569, 1,
-0.4249318, 0.2043148, -1.905185, 0, 1, 0.01176471, 1,
-0.4236055, 0.8271801, -1.344128, 0, 1, 0.01568628, 1,
-0.4133493, 2.044856, 0.7403607, 0, 1, 0.02352941, 1,
-0.4100487, -0.06983455, -1.588627, 0, 1, 0.02745098, 1,
-0.4090989, 2.378909, 0.2829482, 0, 1, 0.03529412, 1,
-0.4074914, -0.748496, -3.812602, 0, 1, 0.03921569, 1,
-0.4021945, -0.626608, -2.920449, 0, 1, 0.04705882, 1,
-0.402094, -1.12039, 0.125384, 0, 1, 0.05098039, 1,
-0.4016158, 1.573595, -0.6650777, 0, 1, 0.05882353, 1,
-0.4002558, 0.5199417, -1.847845, 0, 1, 0.0627451, 1,
-0.3998416, 0.4630058, -1.047293, 0, 1, 0.07058824, 1,
-0.3979875, 0.8046941, -1.45195, 0, 1, 0.07450981, 1,
-0.3951659, -0.3467947, -0.2334083, 0, 1, 0.08235294, 1,
-0.3928736, 1.28502, 0.4580908, 0, 1, 0.08627451, 1,
-0.3922153, 1.646349, -1.170322, 0, 1, 0.09411765, 1,
-0.3863344, 1.327607, 1.076601, 0, 1, 0.1019608, 1,
-0.384093, 0.09536889, -1.95314, 0, 1, 0.1058824, 1,
-0.3776159, -0.07529498, -1.698987, 0, 1, 0.1137255, 1,
-0.3745627, -0.6337674, -0.4965081, 0, 1, 0.1176471, 1,
-0.372146, 0.02044346, -1.748725, 0, 1, 0.1254902, 1,
-0.3630238, -0.3073985, -0.5501401, 0, 1, 0.1294118, 1,
-0.3620799, -1.423551, -1.525573, 0, 1, 0.1372549, 1,
-0.3595286, -0.03342749, 0.06929499, 0, 1, 0.1411765, 1,
-0.3550217, 1.347703, -0.9729286, 0, 1, 0.1490196, 1,
-0.3505686, -0.6548788, -1.846346, 0, 1, 0.1529412, 1,
-0.3391528, -2.164032, -1.545112, 0, 1, 0.1607843, 1,
-0.3379738, -2.040925, -3.632896, 0, 1, 0.1647059, 1,
-0.328603, -0.715229, -0.5376335, 0, 1, 0.172549, 1,
-0.3265608, 1.111919, -1.075387, 0, 1, 0.1764706, 1,
-0.3244072, 0.1371467, -0.7358685, 0, 1, 0.1843137, 1,
-0.3237723, -2.326401, -2.736244, 0, 1, 0.1882353, 1,
-0.323122, 1.331741, 0.06438138, 0, 1, 0.1960784, 1,
-0.3230459, -0.5841077, -3.678031, 0, 1, 0.2039216, 1,
-0.3116876, 1.345707, -0.2693084, 0, 1, 0.2078431, 1,
-0.3111133, -2.997111, -3.009542, 0, 1, 0.2156863, 1,
-0.3100266, -0.3186253, -3.491365, 0, 1, 0.2196078, 1,
-0.3098615, 1.270568, -0.2171542, 0, 1, 0.227451, 1,
-0.3096402, -0.4126924, -2.724213, 0, 1, 0.2313726, 1,
-0.3068455, -0.5331799, -2.024897, 0, 1, 0.2392157, 1,
-0.3052006, 0.06145994, -0.5488628, 0, 1, 0.2431373, 1,
-0.3028347, 1.05279, -0.8551448, 0, 1, 0.2509804, 1,
-0.3018743, -0.02434324, -3.484741, 0, 1, 0.254902, 1,
-0.2995572, 0.4883412, -0.772639, 0, 1, 0.2627451, 1,
-0.2993253, -0.8986913, -1.463955, 0, 1, 0.2666667, 1,
-0.2991847, 1.535288, 1.072327, 0, 1, 0.2745098, 1,
-0.295375, -2.699214, -2.148876, 0, 1, 0.2784314, 1,
-0.2946115, 1.177682, 1.105333, 0, 1, 0.2862745, 1,
-0.2942533, 0.07397068, -0.4868144, 0, 1, 0.2901961, 1,
-0.2939953, 0.9609867, 0.1113732, 0, 1, 0.2980392, 1,
-0.2921273, 0.02654998, -1.072185, 0, 1, 0.3058824, 1,
-0.291955, 0.8664188, -0.1565189, 0, 1, 0.3098039, 1,
-0.2918625, 0.9437658, 0.5534384, 0, 1, 0.3176471, 1,
-0.2752624, 0.830197, 1.776805, 0, 1, 0.3215686, 1,
-0.272698, -0.7561978, -2.20134, 0, 1, 0.3294118, 1,
-0.2720719, 0.1110341, -1.223679, 0, 1, 0.3333333, 1,
-0.2668013, 0.2754688, -1.762294, 0, 1, 0.3411765, 1,
-0.2663712, 0.7775242, 0.1538447, 0, 1, 0.345098, 1,
-0.2632291, 1.361474, 0.7735221, 0, 1, 0.3529412, 1,
-0.2606443, 0.2813883, -0.7290254, 0, 1, 0.3568628, 1,
-0.2578529, -1.079307, -2.267513, 0, 1, 0.3647059, 1,
-0.2574284, -0.4248957, -3.239021, 0, 1, 0.3686275, 1,
-0.2516999, -0.4430171, -2.418587, 0, 1, 0.3764706, 1,
-0.2489884, 0.767549, 0.3351191, 0, 1, 0.3803922, 1,
-0.2469934, 1.701804, -1.041081, 0, 1, 0.3882353, 1,
-0.2449655, 0.4722101, -0.04400225, 0, 1, 0.3921569, 1,
-0.2438992, 1.299074, 2.088708, 0, 1, 0.4, 1,
-0.2434123, 3.545259, 0.4526897, 0, 1, 0.4078431, 1,
-0.2431745, 0.1796948, -1.378649, 0, 1, 0.4117647, 1,
-0.2392363, -0.638199, -0.7660392, 0, 1, 0.4196078, 1,
-0.2369316, -0.6960784, -1.066823, 0, 1, 0.4235294, 1,
-0.2366112, -0.8831201, -4.593596, 0, 1, 0.4313726, 1,
-0.2359158, -1.322135, -3.458138, 0, 1, 0.4352941, 1,
-0.2337829, -0.5809069, -2.826705, 0, 1, 0.4431373, 1,
-0.2304154, 0.3802679, -1.887929, 0, 1, 0.4470588, 1,
-0.2292562, 0.2557059, 0.1210134, 0, 1, 0.454902, 1,
-0.226166, -0.1665776, -2.15202, 0, 1, 0.4588235, 1,
-0.2227566, -0.06140925, -1.406264, 0, 1, 0.4666667, 1,
-0.2218228, 0.4953119, 0.5678429, 0, 1, 0.4705882, 1,
-0.218582, 0.5488659, -0.6489024, 0, 1, 0.4784314, 1,
-0.2154908, 0.3002533, -1.896061, 0, 1, 0.4823529, 1,
-0.2152828, 0.7025206, 1.513928, 0, 1, 0.4901961, 1,
-0.2152003, 0.5932834, -1.702633, 0, 1, 0.4941176, 1,
-0.2106953, 1.553156, 0.1852936, 0, 1, 0.5019608, 1,
-0.2034049, 0.2977177, -0.9767665, 0, 1, 0.509804, 1,
-0.1939392, 0.1391688, -0.5045677, 0, 1, 0.5137255, 1,
-0.1925894, 0.7493793, -0.5977657, 0, 1, 0.5215687, 1,
-0.1918247, -1.842425, -2.97406, 0, 1, 0.5254902, 1,
-0.1907991, -0.6943464, -3.178875, 0, 1, 0.5333334, 1,
-0.1902783, 0.8633897, 0.474711, 0, 1, 0.5372549, 1,
-0.1886464, -0.9792639, -3.542125, 0, 1, 0.5450981, 1,
-0.1864546, 1.727015, -1.613615, 0, 1, 0.5490196, 1,
-0.1792254, -0.352734, -2.136502, 0, 1, 0.5568628, 1,
-0.17451, 1.746252, -0.3765254, 0, 1, 0.5607843, 1,
-0.1690275, 1.296369, -0.4775466, 0, 1, 0.5686275, 1,
-0.1675627, 0.8359967, -0.3646202, 0, 1, 0.572549, 1,
-0.1660876, -0.4767118, -1.267413, 0, 1, 0.5803922, 1,
-0.1637036, 0.4008795, -1.967956, 0, 1, 0.5843138, 1,
-0.1608427, -0.6135578, -1.412389, 0, 1, 0.5921569, 1,
-0.1514517, -1.19675, -2.585751, 0, 1, 0.5960785, 1,
-0.1446636, -0.2665606, -2.085643, 0, 1, 0.6039216, 1,
-0.1420568, -0.01060017, -1.340116, 0, 1, 0.6117647, 1,
-0.1405087, 0.01739583, -1.509815, 0, 1, 0.6156863, 1,
-0.1402716, 0.3581213, -1.943138, 0, 1, 0.6235294, 1,
-0.1390605, 1.615267, -0.3423098, 0, 1, 0.627451, 1,
-0.1384004, 0.537773, 0.2507038, 0, 1, 0.6352941, 1,
-0.1381892, -0.9673842, -4.078675, 0, 1, 0.6392157, 1,
-0.1319706, 1.231259, 0.2563633, 0, 1, 0.6470588, 1,
-0.1297507, 0.197936, -1.571862, 0, 1, 0.6509804, 1,
-0.1281974, 1.453465, -0.3158396, 0, 1, 0.6588235, 1,
-0.1267838, 1.557649, 0.644527, 0, 1, 0.6627451, 1,
-0.1228791, -1.638155, -4.266167, 0, 1, 0.6705883, 1,
-0.1212247, -0.7441292, -0.80484, 0, 1, 0.6745098, 1,
-0.1145081, -1.512908, -4.052533, 0, 1, 0.682353, 1,
-0.1123691, 0.3261519, -1.095295, 0, 1, 0.6862745, 1,
-0.1122026, 0.3670759, 1.015095, 0, 1, 0.6941177, 1,
-0.1117723, 0.28641, 0.7809055, 0, 1, 0.7019608, 1,
-0.1085691, -0.6291294, -3.194859, 0, 1, 0.7058824, 1,
-0.1081451, -0.04391312, -0.7575718, 0, 1, 0.7137255, 1,
-0.1065771, -0.5172237, -4.199966, 0, 1, 0.7176471, 1,
-0.105447, 1.212746, -2.630102, 0, 1, 0.7254902, 1,
-0.1054052, -0.05829143, -2.339767, 0, 1, 0.7294118, 1,
-0.1035378, -0.8624063, -4.197319, 0, 1, 0.7372549, 1,
-0.1001557, -0.4603317, -3.240505, 0, 1, 0.7411765, 1,
-0.09717052, -1.395973, -3.658958, 0, 1, 0.7490196, 1,
-0.09665205, -0.4714124, -2.805266, 0, 1, 0.7529412, 1,
-0.09506041, -1.223912, -3.839703, 0, 1, 0.7607843, 1,
-0.09493565, 0.9274444, 0.6446657, 0, 1, 0.7647059, 1,
-0.09448629, 0.02243493, -0.6403846, 0, 1, 0.772549, 1,
-0.09306038, 0.05214629, 2.93913, 0, 1, 0.7764706, 1,
-0.0914099, -0.09655129, -2.342136, 0, 1, 0.7843137, 1,
-0.08401638, -0.2576646, -1.666159, 0, 1, 0.7882353, 1,
-0.08117436, 0.5332496, 1.785125, 0, 1, 0.7960784, 1,
-0.07892982, -0.1408853, -1.316424, 0, 1, 0.8039216, 1,
-0.07872514, -0.9397081, -2.144906, 0, 1, 0.8078431, 1,
-0.07606584, -0.6922476, -2.101228, 0, 1, 0.8156863, 1,
-0.0760207, -1.231793, -2.459123, 0, 1, 0.8196079, 1,
-0.07197395, -0.2167225, -3.360478, 0, 1, 0.827451, 1,
-0.06895205, 0.9762099, 0.5354071, 0, 1, 0.8313726, 1,
-0.06598895, -1.085467, -2.793621, 0, 1, 0.8392157, 1,
-0.06022618, -0.9398429, -1.02035, 0, 1, 0.8431373, 1,
-0.05849736, -2.202514, -4.082676, 0, 1, 0.8509804, 1,
-0.05674231, 0.3120869, 0.2304079, 0, 1, 0.854902, 1,
-0.05584155, 0.705557, -0.6603809, 0, 1, 0.8627451, 1,
-0.05415845, -0.2313553, -2.703849, 0, 1, 0.8666667, 1,
-0.0512624, 0.333039, -0.8091338, 0, 1, 0.8745098, 1,
-0.04961163, -0.6092106, -3.960774, 0, 1, 0.8784314, 1,
-0.04876437, 0.8161358, -0.9926628, 0, 1, 0.8862745, 1,
-0.04636086, 0.04539886, -3.174272, 0, 1, 0.8901961, 1,
-0.04070754, -0.38718, -4.014383, 0, 1, 0.8980392, 1,
-0.03903316, 0.3007472, -1.388823, 0, 1, 0.9058824, 1,
-0.03894776, 0.3041527, 0.02849269, 0, 1, 0.9098039, 1,
-0.03521093, -1.696741, -3.45393, 0, 1, 0.9176471, 1,
-0.03003652, 0.1484734, 0.01527756, 0, 1, 0.9215686, 1,
-0.02877045, -0.8861834, -3.002507, 0, 1, 0.9294118, 1,
-0.02795546, -0.156275, -2.483026, 0, 1, 0.9333333, 1,
-0.02525783, 1.614744, 1.173677, 0, 1, 0.9411765, 1,
-0.01863072, 1.863133, 0.8936778, 0, 1, 0.945098, 1,
-0.01335198, -0.8996881, -0.5799254, 0, 1, 0.9529412, 1,
-0.01299408, 0.6625214, -0.1353658, 0, 1, 0.9568627, 1,
-0.008119072, -0.09577338, -0.4271204, 0, 1, 0.9647059, 1,
-0.003638934, 0.3446747, -0.6513659, 0, 1, 0.9686275, 1,
-0.001810003, -0.7014967, -3.363988, 0, 1, 0.9764706, 1,
-0.001135574, -1.344958, -3.75686, 0, 1, 0.9803922, 1,
-0.000509721, 0.1990219, -0.06907796, 0, 1, 0.9882353, 1,
0.001135137, 1.055749, -0.4589274, 0, 1, 0.9921569, 1,
0.004364623, -0.5729185, 1.707695, 0, 1, 1, 1,
0.004457502, 1.501318, -0.2444219, 0, 0.9921569, 1, 1,
0.007819463, 0.7657939, 0.3714167, 0, 0.9882353, 1, 1,
0.01086223, -0.4582659, 3.024506, 0, 0.9803922, 1, 1,
0.0135644, -2.557066, 0.2075636, 0, 0.9764706, 1, 1,
0.01444212, 0.3554288, 0.9857685, 0, 0.9686275, 1, 1,
0.01706556, 1.586395, 0.3474588, 0, 0.9647059, 1, 1,
0.02349546, 0.781832, -0.04960604, 0, 0.9568627, 1, 1,
0.02493546, -0.9382305, 2.509979, 0, 0.9529412, 1, 1,
0.02987712, -0.9914644, 3.6054, 0, 0.945098, 1, 1,
0.03042766, -0.2746343, 3.165494, 0, 0.9411765, 1, 1,
0.03352937, 0.5572544, 1.50091, 0, 0.9333333, 1, 1,
0.03399939, 0.1153023, 1.282731, 0, 0.9294118, 1, 1,
0.03720744, 0.4707507, -0.2358486, 0, 0.9215686, 1, 1,
0.03813141, -0.07255223, 1.693451, 0, 0.9176471, 1, 1,
0.0421187, 0.5893999, 0.5835131, 0, 0.9098039, 1, 1,
0.04336427, 0.08161437, 1.331817, 0, 0.9058824, 1, 1,
0.04635401, 0.4644978, -1.162403, 0, 0.8980392, 1, 1,
0.04669905, -0.3451382, 3.585197, 0, 0.8901961, 1, 1,
0.04722961, 1.082083, -0.8486249, 0, 0.8862745, 1, 1,
0.04813347, 1.010989, 0.1875429, 0, 0.8784314, 1, 1,
0.05050309, -0.1351671, 4.162007, 0, 0.8745098, 1, 1,
0.05411678, 1.118071, 0.1544484, 0, 0.8666667, 1, 1,
0.06341723, 0.4903972, 0.9171154, 0, 0.8627451, 1, 1,
0.06426006, 0.7313885, -0.788858, 0, 0.854902, 1, 1,
0.0646093, 0.6206867, -0.5662084, 0, 0.8509804, 1, 1,
0.06498333, 0.9961727, 0.5505292, 0, 0.8431373, 1, 1,
0.06542972, -1.048649, 3.462978, 0, 0.8392157, 1, 1,
0.06625028, -1.033134, 3.655756, 0, 0.8313726, 1, 1,
0.06841302, -0.006320537, 0.3805293, 0, 0.827451, 1, 1,
0.06872548, 0.1363384, -0.1802427, 0, 0.8196079, 1, 1,
0.07144873, 0.8259605, -0.4922759, 0, 0.8156863, 1, 1,
0.0732545, 0.2535854, 0.5757433, 0, 0.8078431, 1, 1,
0.07382575, 1.566404, 0.2497297, 0, 0.8039216, 1, 1,
0.07428374, 1.383266, -1.062381, 0, 0.7960784, 1, 1,
0.07485947, -1.284104, 1.303289, 0, 0.7882353, 1, 1,
0.0753815, -0.1011022, 2.169898, 0, 0.7843137, 1, 1,
0.07842589, 0.6818208, -0.07111032, 0, 0.7764706, 1, 1,
0.07859511, 0.8041174, -0.849829, 0, 0.772549, 1, 1,
0.08010501, 1.313436, 0.8476484, 0, 0.7647059, 1, 1,
0.08325218, 0.1490998, 1.725631, 0, 0.7607843, 1, 1,
0.08450233, 1.709635, -0.2513739, 0, 0.7529412, 1, 1,
0.0867169, 0.5676566, 1.305286, 0, 0.7490196, 1, 1,
0.09280452, -1.785853, 2.359029, 0, 0.7411765, 1, 1,
0.09406297, -1.046399, 3.572242, 0, 0.7372549, 1, 1,
0.09643355, -0.3554546, 3.684117, 0, 0.7294118, 1, 1,
0.1028419, 0.9212705, 0.8289164, 0, 0.7254902, 1, 1,
0.1032032, 1.396724, 0.9523219, 0, 0.7176471, 1, 1,
0.1034072, -1.118448, 1.668755, 0, 0.7137255, 1, 1,
0.1037013, -0.3095492, 3.831591, 0, 0.7058824, 1, 1,
0.1110108, 1.657769, -0.2519888, 0, 0.6980392, 1, 1,
0.1145452, -0.1940294, 2.811188, 0, 0.6941177, 1, 1,
0.1146086, 0.4060213, 0.6860162, 0, 0.6862745, 1, 1,
0.1171236, -0.6442628, 5.650095, 0, 0.682353, 1, 1,
0.1191558, -0.5908219, 3.738512, 0, 0.6745098, 1, 1,
0.1196515, -1.015224, 3.421876, 0, 0.6705883, 1, 1,
0.1210773, -0.1395884, 2.347101, 0, 0.6627451, 1, 1,
0.1211618, 2.091681, -0.5281672, 0, 0.6588235, 1, 1,
0.1224343, 0.6259207, 0.3685219, 0, 0.6509804, 1, 1,
0.1231974, 0.5541713, -0.773192, 0, 0.6470588, 1, 1,
0.1253971, -0.6278136, 3.994464, 0, 0.6392157, 1, 1,
0.1278452, -0.8144229, 3.398094, 0, 0.6352941, 1, 1,
0.1291486, -0.3104101, 2.483988, 0, 0.627451, 1, 1,
0.1298152, 0.08752853, 1.983475, 0, 0.6235294, 1, 1,
0.1402842, -1.559363, 2.158022, 0, 0.6156863, 1, 1,
0.1417099, -2.60457, 3.489272, 0, 0.6117647, 1, 1,
0.1445137, 0.5837561, -0.009124629, 0, 0.6039216, 1, 1,
0.1462573, 0.604643, -1.154743, 0, 0.5960785, 1, 1,
0.1493751, 0.2771644, 0.02843717, 0, 0.5921569, 1, 1,
0.1496777, -0.4883747, 2.355342, 0, 0.5843138, 1, 1,
0.1596364, 1.422988, -0.08994057, 0, 0.5803922, 1, 1,
0.1619765, 1.262213, -0.01189949, 0, 0.572549, 1, 1,
0.166343, -0.7099043, 3.882673, 0, 0.5686275, 1, 1,
0.1666364, 0.631372, 0.8148558, 0, 0.5607843, 1, 1,
0.1670764, -0.2067316, 1.795683, 0, 0.5568628, 1, 1,
0.1722115, -2.775125, 3.564362, 0, 0.5490196, 1, 1,
0.1726625, 2.794531, -1.763811, 0, 0.5450981, 1, 1,
0.1734267, 0.5353103, 0.351182, 0, 0.5372549, 1, 1,
0.1738496, -0.003024682, 1.857752, 0, 0.5333334, 1, 1,
0.1742387, -0.7386479, 2.745878, 0, 0.5254902, 1, 1,
0.1756884, -0.7321001, 2.045764, 0, 0.5215687, 1, 1,
0.1782926, 0.2029471, 1.937886, 0, 0.5137255, 1, 1,
0.1802702, 0.316153, 0.5369587, 0, 0.509804, 1, 1,
0.1810422, 1.909919, 0.8638712, 0, 0.5019608, 1, 1,
0.1883313, 0.9817498, -0.06556032, 0, 0.4941176, 1, 1,
0.1927281, -0.5243372, 3.958376, 0, 0.4901961, 1, 1,
0.193014, 1.018555, 0.9513893, 0, 0.4823529, 1, 1,
0.1962422, -0.4922298, 1.805278, 0, 0.4784314, 1, 1,
0.1966579, 1.285264, 0.6360124, 0, 0.4705882, 1, 1,
0.1992927, 0.5588577, 1.850959, 0, 0.4666667, 1, 1,
0.2002667, -0.8857955, 4.626961, 0, 0.4588235, 1, 1,
0.2026154, 0.3914371, -0.6698314, 0, 0.454902, 1, 1,
0.2058285, -1.620404, 3.318217, 0, 0.4470588, 1, 1,
0.2059744, -0.1742401, 1.625447, 0, 0.4431373, 1, 1,
0.2066143, 0.08768012, 2.356893, 0, 0.4352941, 1, 1,
0.2085862, 0.7979512, 0.8733821, 0, 0.4313726, 1, 1,
0.2121602, -0.1522631, 2.386727, 0, 0.4235294, 1, 1,
0.2126886, 0.818157, -1.026001, 0, 0.4196078, 1, 1,
0.2156254, -0.5453382, 3.571921, 0, 0.4117647, 1, 1,
0.2171448, 1.129706, 1.301829, 0, 0.4078431, 1, 1,
0.2181817, -0.2129872, 1.023768, 0, 0.4, 1, 1,
0.2198954, 1.529465, 0.7043858, 0, 0.3921569, 1, 1,
0.2201121, 0.1898464, 0.1426808, 0, 0.3882353, 1, 1,
0.2201697, -0.4992881, 1.495151, 0, 0.3803922, 1, 1,
0.2212571, -1.124379, 3.603302, 0, 0.3764706, 1, 1,
0.2214634, -0.5159577, 2.703437, 0, 0.3686275, 1, 1,
0.2216565, 1.038676, -1.198278, 0, 0.3647059, 1, 1,
0.2219488, -1.503959, 3.588221, 0, 0.3568628, 1, 1,
0.2244163, 0.7540241, -0.5042437, 0, 0.3529412, 1, 1,
0.2245121, -0.3008327, 2.226926, 0, 0.345098, 1, 1,
0.2273987, -0.1730173, 2.555387, 0, 0.3411765, 1, 1,
0.2296823, 0.6184365, 0.8664101, 0, 0.3333333, 1, 1,
0.2328953, -0.1487316, 1.144122, 0, 0.3294118, 1, 1,
0.240465, 0.3130861, 2.172781, 0, 0.3215686, 1, 1,
0.2496348, 0.6014295, 0.7841308, 0, 0.3176471, 1, 1,
0.2537636, -0.06493133, 0.487871, 0, 0.3098039, 1, 1,
0.2570298, -0.2854854, 2.523903, 0, 0.3058824, 1, 1,
0.2592055, 0.9057493, 0.5590357, 0, 0.2980392, 1, 1,
0.2597057, -1.180423, 3.608565, 0, 0.2901961, 1, 1,
0.2684247, 0.4085483, 1.312465, 0, 0.2862745, 1, 1,
0.2724152, 1.980244, 1.862131, 0, 0.2784314, 1, 1,
0.2866816, 0.3180045, 1.631917, 0, 0.2745098, 1, 1,
0.2883375, 0.08070356, -0.05665516, 0, 0.2666667, 1, 1,
0.2891897, 1.590936, 1.556789, 0, 0.2627451, 1, 1,
0.2924111, 0.938426, 1.073044, 0, 0.254902, 1, 1,
0.2926969, 0.7238305, 1.554346, 0, 0.2509804, 1, 1,
0.2937824, 0.2567496, 0.4995728, 0, 0.2431373, 1, 1,
0.2955256, 0.7159314, -1.162235, 0, 0.2392157, 1, 1,
0.2963967, 0.354301, -1.155594, 0, 0.2313726, 1, 1,
0.299877, 0.7187822, -1.132749, 0, 0.227451, 1, 1,
0.3022195, -0.4168438, 1.881236, 0, 0.2196078, 1, 1,
0.3038473, 0.9713953, -1.186221, 0, 0.2156863, 1, 1,
0.305294, -0.0005081042, 1.333595, 0, 0.2078431, 1, 1,
0.3084334, -2.137979, 2.928357, 0, 0.2039216, 1, 1,
0.3105608, -0.04214374, 0.2491318, 0, 0.1960784, 1, 1,
0.3119579, 0.9874134, 1.60534, 0, 0.1882353, 1, 1,
0.314438, 0.564504, 2.595338, 0, 0.1843137, 1, 1,
0.3234798, -1.729683, 3.299322, 0, 0.1764706, 1, 1,
0.3250863, 1.193931, 0.8059635, 0, 0.172549, 1, 1,
0.3255751, 0.2574974, 3.095735, 0, 0.1647059, 1, 1,
0.3268563, 0.388995, 1.474727, 0, 0.1607843, 1, 1,
0.3292864, -2.089263, 3.51402, 0, 0.1529412, 1, 1,
0.3298422, 0.6648488, -0.7490159, 0, 0.1490196, 1, 1,
0.3318608, 1.525725, -0.3133646, 0, 0.1411765, 1, 1,
0.3322884, -0.5374123, 3.091933, 0, 0.1372549, 1, 1,
0.3359233, -0.6981217, 2.573195, 0, 0.1294118, 1, 1,
0.3394914, 0.2963855, 0.9783541, 0, 0.1254902, 1, 1,
0.3398434, 0.8375009, 0.3808002, 0, 0.1176471, 1, 1,
0.3424012, -0.3733801, 3.900976, 0, 0.1137255, 1, 1,
0.3441272, -0.08576734, 0.04486852, 0, 0.1058824, 1, 1,
0.3447098, -0.3267749, 3.713828, 0, 0.09803922, 1, 1,
0.3493179, -0.414088, 1.848347, 0, 0.09411765, 1, 1,
0.3512573, 0.1513961, 0.3788518, 0, 0.08627451, 1, 1,
0.3625371, 0.113994, -0.5412432, 0, 0.08235294, 1, 1,
0.3667424, 0.2377425, 0.8085343, 0, 0.07450981, 1, 1,
0.3692982, -1.620554, 1.388461, 0, 0.07058824, 1, 1,
0.3693492, 0.2343308, -2.177284, 0, 0.0627451, 1, 1,
0.3721152, -1.136647, 2.077017, 0, 0.05882353, 1, 1,
0.3736071, -1.502452, 3.945211, 0, 0.05098039, 1, 1,
0.374969, -3.214312, 2.97801, 0, 0.04705882, 1, 1,
0.3767712, -0.8437032, 4.324381, 0, 0.03921569, 1, 1,
0.3784174, 1.246995, -0.365544, 0, 0.03529412, 1, 1,
0.3885931, 1.429081, 0.2371379, 0, 0.02745098, 1, 1,
0.3908186, -1.092482, 3.650895, 0, 0.02352941, 1, 1,
0.3923723, 1.250639, 1.148611, 0, 0.01568628, 1, 1,
0.3924648, -0.3009987, 3.247671, 0, 0.01176471, 1, 1,
0.3933874, -0.3872372, 2.256441, 0, 0.003921569, 1, 1,
0.3955836, -0.3100369, 1.99584, 0.003921569, 0, 1, 1,
0.3978136, 1.448034, -1.910584, 0.007843138, 0, 1, 1,
0.4094432, 1.445473, 0.1548528, 0.01568628, 0, 1, 1,
0.4134552, -1.440291, 5.166623, 0.01960784, 0, 1, 1,
0.4144341, -0.9270307, 2.499892, 0.02745098, 0, 1, 1,
0.4169835, 1.377125, -1.182308, 0.03137255, 0, 1, 1,
0.419082, -0.7071983, 1.657234, 0.03921569, 0, 1, 1,
0.419638, -0.01161779, 2.4133, 0.04313726, 0, 1, 1,
0.4211353, -0.2686796, 0.9171707, 0.05098039, 0, 1, 1,
0.421497, -1.453385, 2.036837, 0.05490196, 0, 1, 1,
0.425675, -0.8620346, 4.827042, 0.0627451, 0, 1, 1,
0.4276935, -0.9536851, 2.913392, 0.06666667, 0, 1, 1,
0.4339007, -1.034927, 4.275604, 0.07450981, 0, 1, 1,
0.4473682, 0.1275179, 1.160512, 0.07843138, 0, 1, 1,
0.4485577, -0.3856111, 3.958318, 0.08627451, 0, 1, 1,
0.4491566, -1.519918, 3.704102, 0.09019608, 0, 1, 1,
0.4502889, -0.4148847, 3.125917, 0.09803922, 0, 1, 1,
0.4527372, 0.6510909, -0.2317593, 0.1058824, 0, 1, 1,
0.4532681, 0.259836, 0.8385264, 0.1098039, 0, 1, 1,
0.4553186, -0.3207355, 2.428258, 0.1176471, 0, 1, 1,
0.4591702, -0.8753712, 3.798847, 0.1215686, 0, 1, 1,
0.4602257, -0.8086839, 3.980028, 0.1294118, 0, 1, 1,
0.461361, 0.9361635, 3.665149, 0.1333333, 0, 1, 1,
0.4748334, 0.4592872, 0.08786301, 0.1411765, 0, 1, 1,
0.4769382, -0.366669, 3.081778, 0.145098, 0, 1, 1,
0.4785524, -0.5829707, 2.395269, 0.1529412, 0, 1, 1,
0.4831992, -0.7514234, 3.218039, 0.1568628, 0, 1, 1,
0.4844199, 0.2452697, 1.358918, 0.1647059, 0, 1, 1,
0.4875374, -0.6459168, 2.456427, 0.1686275, 0, 1, 1,
0.4910598, 1.514564, -0.6719411, 0.1764706, 0, 1, 1,
0.4914407, -1.001576, 2.767848, 0.1803922, 0, 1, 1,
0.4935698, -0.01148043, 1.86594, 0.1882353, 0, 1, 1,
0.4945609, 0.8903548, -0.02508902, 0.1921569, 0, 1, 1,
0.4966401, -2.789132, 3.557663, 0.2, 0, 1, 1,
0.5056298, 1.629436, 1.883268, 0.2078431, 0, 1, 1,
0.5086731, -0.02427466, 2.51423, 0.2117647, 0, 1, 1,
0.5092743, -1.789808, 2.733521, 0.2196078, 0, 1, 1,
0.5185624, -0.9242108, 3.722768, 0.2235294, 0, 1, 1,
0.5243854, -1.0374, 2.808958, 0.2313726, 0, 1, 1,
0.526737, 0.7780364, -0.2914404, 0.2352941, 0, 1, 1,
0.5271333, -1.142223, 1.109014, 0.2431373, 0, 1, 1,
0.5285936, 0.401648, 1.742031, 0.2470588, 0, 1, 1,
0.5294009, -1.003216, 4.387249, 0.254902, 0, 1, 1,
0.5346835, -0.9470105, 1.872246, 0.2588235, 0, 1, 1,
0.5421687, -0.579975, 1.40259, 0.2666667, 0, 1, 1,
0.5450393, -1.280561, 1.943884, 0.2705882, 0, 1, 1,
0.5455736, 1.541678, -0.7422699, 0.2784314, 0, 1, 1,
0.5499682, -1.498017, 2.732971, 0.282353, 0, 1, 1,
0.5532234, -2.030494, 0.3080122, 0.2901961, 0, 1, 1,
0.5538388, 0.2732721, 1.066481, 0.2941177, 0, 1, 1,
0.5569605, 0.3254889, 1.76349, 0.3019608, 0, 1, 1,
0.5639591, 1.33263, 0.6558098, 0.3098039, 0, 1, 1,
0.5669882, 2.062362, 1.275754, 0.3137255, 0, 1, 1,
0.5820168, 0.08240227, 1.06429, 0.3215686, 0, 1, 1,
0.5876514, -1.583225, 1.101205, 0.3254902, 0, 1, 1,
0.5895573, 0.5315246, 0.1279675, 0.3333333, 0, 1, 1,
0.5907372, -0.9850654, 2.789079, 0.3372549, 0, 1, 1,
0.5943909, -0.2108848, 2.444284, 0.345098, 0, 1, 1,
0.5948574, 0.3825256, 0.7117818, 0.3490196, 0, 1, 1,
0.5980665, 0.3847546, 0.5386553, 0.3568628, 0, 1, 1,
0.6018487, -1.813149, 3.19381, 0.3607843, 0, 1, 1,
0.6047139, -1.530506, 3.823605, 0.3686275, 0, 1, 1,
0.6053705, -0.325078, 1.965319, 0.372549, 0, 1, 1,
0.6150977, 0.1334714, -0.1012562, 0.3803922, 0, 1, 1,
0.6153803, 1.873474, 0.6619189, 0.3843137, 0, 1, 1,
0.6207264, 0.4072228, 1.643788, 0.3921569, 0, 1, 1,
0.6232226, 1.724886, 0.447869, 0.3960784, 0, 1, 1,
0.6236814, 2.012938, 1.218003, 0.4039216, 0, 1, 1,
0.6259702, 1.051939, -0.652104, 0.4117647, 0, 1, 1,
0.6278774, 0.1424252, 0.767988, 0.4156863, 0, 1, 1,
0.6305257, 0.1116476, -0.2842023, 0.4235294, 0, 1, 1,
0.6308849, 1.982537, 2.297557, 0.427451, 0, 1, 1,
0.6340586, -0.7196646, 2.642609, 0.4352941, 0, 1, 1,
0.6355598, 0.3946966, -0.5815012, 0.4392157, 0, 1, 1,
0.6389124, -0.6128917, 3.0733, 0.4470588, 0, 1, 1,
0.6408569, -1.321098, 3.027924, 0.4509804, 0, 1, 1,
0.6409354, -1.58573, 3.141917, 0.4588235, 0, 1, 1,
0.6414934, -1.194786, 3.898241, 0.4627451, 0, 1, 1,
0.6426673, 0.5080549, 1.041707, 0.4705882, 0, 1, 1,
0.6470727, -0.414817, -0.5784872, 0.4745098, 0, 1, 1,
0.6504711, 0.6862776, 0.9154574, 0.4823529, 0, 1, 1,
0.654642, -1.227535, 3.478941, 0.4862745, 0, 1, 1,
0.6547752, 1.150339, 2.539622, 0.4941176, 0, 1, 1,
0.6553735, -0.9047661, 4.422967, 0.5019608, 0, 1, 1,
0.6577736, 0.1623423, 1.876703, 0.5058824, 0, 1, 1,
0.6689872, -0.3844861, 4.183341, 0.5137255, 0, 1, 1,
0.6773465, 1.112174, 0.73114, 0.5176471, 0, 1, 1,
0.6788085, -0.5778742, 4.613509, 0.5254902, 0, 1, 1,
0.6798828, 0.3529095, 2.183341, 0.5294118, 0, 1, 1,
0.6843267, -0.7832526, 4.801987, 0.5372549, 0, 1, 1,
0.6862484, -0.5911817, 0.7746499, 0.5411765, 0, 1, 1,
0.6899534, -0.1110953, 1.597158, 0.5490196, 0, 1, 1,
0.6911975, -0.2119526, 3.037292, 0.5529412, 0, 1, 1,
0.6942045, -0.2090043, 2.453249, 0.5607843, 0, 1, 1,
0.6993336, 0.9108315, 1.406848, 0.5647059, 0, 1, 1,
0.7018464, -0.3672259, 1.373857, 0.572549, 0, 1, 1,
0.7062628, 1.703123, -0.5721957, 0.5764706, 0, 1, 1,
0.7077408, 1.628586, 0.1865317, 0.5843138, 0, 1, 1,
0.7141348, 0.4216114, -0.2273941, 0.5882353, 0, 1, 1,
0.719372, 0.4276308, 0.6665748, 0.5960785, 0, 1, 1,
0.723182, 0.1480059, 1.135578, 0.6039216, 0, 1, 1,
0.7294867, -2.091141, 0.8749506, 0.6078432, 0, 1, 1,
0.7299381, 0.5582287, 1.343572, 0.6156863, 0, 1, 1,
0.7307417, 0.9875301, 0.8109484, 0.6196079, 0, 1, 1,
0.7334148, 2.255779, 1.724924, 0.627451, 0, 1, 1,
0.7360429, 0.003351269, -0.7277359, 0.6313726, 0, 1, 1,
0.7380049, -0.7538158, 2.408429, 0.6392157, 0, 1, 1,
0.7487831, 0.2026091, 1.97381, 0.6431373, 0, 1, 1,
0.7496588, -0.9435451, 0.9708759, 0.6509804, 0, 1, 1,
0.7499868, -1.345234, 1.823947, 0.654902, 0, 1, 1,
0.7501901, 0.8427755, 0.04092759, 0.6627451, 0, 1, 1,
0.7543371, 0.6615384, 0.5185105, 0.6666667, 0, 1, 1,
0.7564409, -0.6580325, 1.862164, 0.6745098, 0, 1, 1,
0.7624931, -1.391085, 1.974973, 0.6784314, 0, 1, 1,
0.7633414, 0.8308743, 0.3466317, 0.6862745, 0, 1, 1,
0.7640257, 0.4971972, 0.7007859, 0.6901961, 0, 1, 1,
0.7667659, 1.412536, 1.827354, 0.6980392, 0, 1, 1,
0.7674687, 0.07616119, 2.425684, 0.7058824, 0, 1, 1,
0.7684404, -2.186664, 2.247829, 0.7098039, 0, 1, 1,
0.7686961, 0.4797359, 0.8747105, 0.7176471, 0, 1, 1,
0.7785887, -1.175727, 1.449264, 0.7215686, 0, 1, 1,
0.7821673, 0.3482887, 0.7255173, 0.7294118, 0, 1, 1,
0.789133, -1.852042, 4.902249, 0.7333333, 0, 1, 1,
0.7914945, -2.099383, 1.841912, 0.7411765, 0, 1, 1,
0.7936169, 1.475515, 1.106863, 0.7450981, 0, 1, 1,
0.7969174, -0.9155648, 2.155243, 0.7529412, 0, 1, 1,
0.7971355, -2.170045, 2.338914, 0.7568628, 0, 1, 1,
0.8070799, -1.206953, 2.09675, 0.7647059, 0, 1, 1,
0.8093392, 1.546733, 0.1273198, 0.7686275, 0, 1, 1,
0.8116054, -0.7859004, 2.564438, 0.7764706, 0, 1, 1,
0.8146632, -0.3093718, 2.540699, 0.7803922, 0, 1, 1,
0.8281806, -2.972177, 2.24164, 0.7882353, 0, 1, 1,
0.831384, 0.5883868, 1.146735, 0.7921569, 0, 1, 1,
0.8368707, 0.1653128, 2.168712, 0.8, 0, 1, 1,
0.8540956, 0.002534845, 1.738326, 0.8078431, 0, 1, 1,
0.8566259, 0.6454197, 0.6752629, 0.8117647, 0, 1, 1,
0.8586498, 0.5875109, 2.488252, 0.8196079, 0, 1, 1,
0.859564, -1.290845, 2.937546, 0.8235294, 0, 1, 1,
0.8625191, -1.115405, 1.514385, 0.8313726, 0, 1, 1,
0.8638061, 1.762532, 1.354155, 0.8352941, 0, 1, 1,
0.867327, 0.6542389, 1.627956, 0.8431373, 0, 1, 1,
0.880409, -0.2096659, 1.837618, 0.8470588, 0, 1, 1,
0.8830962, 0.6287684, 0.5708278, 0.854902, 0, 1, 1,
0.8884179, -0.4410506, 1.70501, 0.8588235, 0, 1, 1,
0.9003615, -1.376749, 1.656976, 0.8666667, 0, 1, 1,
0.9102564, -0.2191633, 2.758598, 0.8705882, 0, 1, 1,
0.9137498, 1.400258, 1.728192, 0.8784314, 0, 1, 1,
0.9187677, 0.008355921, 2.214016, 0.8823529, 0, 1, 1,
0.9256113, 1.246015, -0.1003462, 0.8901961, 0, 1, 1,
0.9275244, 1.937837, 0.610723, 0.8941177, 0, 1, 1,
0.9282637, -1.623211, 2.126555, 0.9019608, 0, 1, 1,
0.9285802, -0.3589263, 0.9695941, 0.9098039, 0, 1, 1,
0.9291726, -0.5363089, 2.925677, 0.9137255, 0, 1, 1,
0.9390166, -0.02327972, 2.374478, 0.9215686, 0, 1, 1,
0.939364, -0.9438798, 2.409348, 0.9254902, 0, 1, 1,
0.9407491, 2.276355, 1.48972, 0.9333333, 0, 1, 1,
0.9417831, -1.149094, 2.250545, 0.9372549, 0, 1, 1,
0.9460537, 0.2747295, 1.087571, 0.945098, 0, 1, 1,
0.9499777, -1.811194, 2.245092, 0.9490196, 0, 1, 1,
0.9648479, -1.00974, 1.073698, 0.9568627, 0, 1, 1,
0.9661118, -0.7875569, 2.336073, 0.9607843, 0, 1, 1,
0.9702951, 2.006287, -0.4704715, 0.9686275, 0, 1, 1,
0.971029, -0.4888321, 1.69728, 0.972549, 0, 1, 1,
0.9827487, 2.037606, -0.600278, 0.9803922, 0, 1, 1,
0.9844577, -1.985717, 3.936319, 0.9843137, 0, 1, 1,
0.9853181, 0.1567968, 2.232713, 0.9921569, 0, 1, 1,
0.9869983, 0.5703631, -0.4270245, 0.9960784, 0, 1, 1,
0.9875781, 1.327161, 1.751655, 1, 0, 0.9960784, 1,
0.9894881, -0.008381942, 1.621949, 1, 0, 0.9882353, 1,
0.9966063, -2.194876, 1.941627, 1, 0, 0.9843137, 1,
1.00355, 0.4408901, 1.886132, 1, 0, 0.9764706, 1,
1.008182, -1.666429, 2.470418, 1, 0, 0.972549, 1,
1.008768, 0.3808783, 0.3901893, 1, 0, 0.9647059, 1,
1.013769, 0.2746325, 1.767266, 1, 0, 0.9607843, 1,
1.016798, 0.5242417, 0.6891814, 1, 0, 0.9529412, 1,
1.017479, -0.3537746, 3.226261, 1, 0, 0.9490196, 1,
1.021351, -0.2636969, 1.778887, 1, 0, 0.9411765, 1,
1.03303, -1.377747, 2.226583, 1, 0, 0.9372549, 1,
1.041476, 0.5109379, 0.2241332, 1, 0, 0.9294118, 1,
1.043442, -1.45084, 2.691967, 1, 0, 0.9254902, 1,
1.046104, 0.9484717, 0.5257291, 1, 0, 0.9176471, 1,
1.04613, -1.343226, 2.497699, 1, 0, 0.9137255, 1,
1.049656, 1.831807, 0.4099297, 1, 0, 0.9058824, 1,
1.051332, 0.3971396, 1.158473, 1, 0, 0.9019608, 1,
1.051455, -1.811828, 4.736564, 1, 0, 0.8941177, 1,
1.054681, 0.2159939, 2.424389, 1, 0, 0.8862745, 1,
1.05573, -0.378711, 2.805398, 1, 0, 0.8823529, 1,
1.058868, 0.4558487, 1.416531, 1, 0, 0.8745098, 1,
1.061221, 0.5020453, 1.740592, 1, 0, 0.8705882, 1,
1.062513, -0.961128, 2.099246, 1, 0, 0.8627451, 1,
1.07008, 0.481107, -0.3501725, 1, 0, 0.8588235, 1,
1.074235, -0.5830417, 1.900648, 1, 0, 0.8509804, 1,
1.075431, 0.4573811, 2.972642, 1, 0, 0.8470588, 1,
1.077612, -0.1540208, 1.4378, 1, 0, 0.8392157, 1,
1.079746, 1.526262, 0.20375, 1, 0, 0.8352941, 1,
1.08639, 0.7462505, 1.851696, 1, 0, 0.827451, 1,
1.089898, -1.077593, 2.086876, 1, 0, 0.8235294, 1,
1.093661, -0.2425727, 2.181525, 1, 0, 0.8156863, 1,
1.097215, 0.6934672, 0.5504005, 1, 0, 0.8117647, 1,
1.102886, -0.05225104, 1.74964, 1, 0, 0.8039216, 1,
1.119213, -0.5076995, 3.550996, 1, 0, 0.7960784, 1,
1.120011, 0.6357657, 1.927265, 1, 0, 0.7921569, 1,
1.122364, -1.683128, 2.634499, 1, 0, 0.7843137, 1,
1.126838, -1.265064, 3.055845, 1, 0, 0.7803922, 1,
1.12895, -1.29939, 1.969422, 1, 0, 0.772549, 1,
1.135404, 1.02545, -0.3593433, 1, 0, 0.7686275, 1,
1.139486, 0.2389262, 1.277681, 1, 0, 0.7607843, 1,
1.139886, -0.601512, 0.9214888, 1, 0, 0.7568628, 1,
1.143084, -0.2324295, 4.002529, 1, 0, 0.7490196, 1,
1.144749, -0.598325, 1.717837, 1, 0, 0.7450981, 1,
1.146754, -1.436904, 3.194842, 1, 0, 0.7372549, 1,
1.149072, 0.6777786, 1.466118, 1, 0, 0.7333333, 1,
1.15185, -0.4847874, 1.502042, 1, 0, 0.7254902, 1,
1.152442, 1.224322, 0.297758, 1, 0, 0.7215686, 1,
1.157468, 0.9062551, 0.6200338, 1, 0, 0.7137255, 1,
1.159543, 1.531966, 1.618275, 1, 0, 0.7098039, 1,
1.168652, 0.6197808, -0.6916353, 1, 0, 0.7019608, 1,
1.169008, -1.065358, 1.53713, 1, 0, 0.6941177, 1,
1.172077, -1.002503, -0.03952826, 1, 0, 0.6901961, 1,
1.173271, -1.310644, 2.041177, 1, 0, 0.682353, 1,
1.177841, 0.8886051, 0.7733868, 1, 0, 0.6784314, 1,
1.179597, 0.3991607, 2.615334, 1, 0, 0.6705883, 1,
1.180966, 1.051946, 1.320272, 1, 0, 0.6666667, 1,
1.181429, 1.255687, 0.2993777, 1, 0, 0.6588235, 1,
1.182721, -0.747958, 2.033352, 1, 0, 0.654902, 1,
1.182939, 0.1850675, 2.528982, 1, 0, 0.6470588, 1,
1.187965, 2.506464, 1.408336, 1, 0, 0.6431373, 1,
1.194333, -0.11282, 1.857718, 1, 0, 0.6352941, 1,
1.195358, -1.329633, 2.329649, 1, 0, 0.6313726, 1,
1.196699, 0.7375811, 0.3209735, 1, 0, 0.6235294, 1,
1.20544, 0.2680488, 3.982866, 1, 0, 0.6196079, 1,
1.209849, -0.3709634, 1.224135, 1, 0, 0.6117647, 1,
1.214333, -0.09732039, 0.9961959, 1, 0, 0.6078432, 1,
1.215352, -0.09654705, -0.08994655, 1, 0, 0.6, 1,
1.22076, -1.895519, 2.372014, 1, 0, 0.5921569, 1,
1.230786, 0.5786178, 1.228262, 1, 0, 0.5882353, 1,
1.231735, 1.042647, 0.2681697, 1, 0, 0.5803922, 1,
1.244974, 0.1244269, 1.699906, 1, 0, 0.5764706, 1,
1.24592, -0.423008, 3.310988, 1, 0, 0.5686275, 1,
1.246424, -1.096198, 0.7917725, 1, 0, 0.5647059, 1,
1.260484, -0.8387959, 2.618577, 1, 0, 0.5568628, 1,
1.267861, -0.3558825, 1.738576, 1, 0, 0.5529412, 1,
1.269278, 0.6864244, 1.53856, 1, 0, 0.5450981, 1,
1.271498, -0.7198914, 0.860564, 1, 0, 0.5411765, 1,
1.281363, 0.7115391, 0.6097385, 1, 0, 0.5333334, 1,
1.289024, 0.01936131, 1.055358, 1, 0, 0.5294118, 1,
1.292938, 0.9203513, 1.24059, 1, 0, 0.5215687, 1,
1.293177, -2.670094, 2.298087, 1, 0, 0.5176471, 1,
1.300482, 0.8673528, 0.1825435, 1, 0, 0.509804, 1,
1.328758, 1.746819, 0.5941389, 1, 0, 0.5058824, 1,
1.332456, -0.9240116, 1.405327, 1, 0, 0.4980392, 1,
1.335157, -0.7651577, 2.675767, 1, 0, 0.4901961, 1,
1.341174, 0.2976406, 1.882736, 1, 0, 0.4862745, 1,
1.350308, 0.7844719, 1.458397, 1, 0, 0.4784314, 1,
1.35031, 0.6474821, 0.9236239, 1, 0, 0.4745098, 1,
1.359166, -0.3301803, 1.95495, 1, 0, 0.4666667, 1,
1.361185, 0.4494672, 1.168935, 1, 0, 0.4627451, 1,
1.365526, -0.9531412, 1.962948, 1, 0, 0.454902, 1,
1.370782, -0.6858264, 3.450877, 1, 0, 0.4509804, 1,
1.389444, -0.169139, 1.378667, 1, 0, 0.4431373, 1,
1.400358, -0.8609657, 1.855921, 1, 0, 0.4392157, 1,
1.403738, -0.7391357, 3.201233, 1, 0, 0.4313726, 1,
1.404701, 0.7572016, 1.644974, 1, 0, 0.427451, 1,
1.412524, -1.368587, 1.492484, 1, 0, 0.4196078, 1,
1.412524, -1.202452, 1.448892, 1, 0, 0.4156863, 1,
1.423684, 0.5474857, 1.406748, 1, 0, 0.4078431, 1,
1.424169, -0.3398697, 1.537676, 1, 0, 0.4039216, 1,
1.430949, 0.02738706, 1.638576, 1, 0, 0.3960784, 1,
1.441608, 0.914102, 1.444593, 1, 0, 0.3882353, 1,
1.451047, -0.1106204, -0.4561655, 1, 0, 0.3843137, 1,
1.451717, -0.8215876, 3.672062, 1, 0, 0.3764706, 1,
1.455503, -0.552358, 0.155957, 1, 0, 0.372549, 1,
1.457069, 0.2400289, 1.553681, 1, 0, 0.3647059, 1,
1.459155, -0.7955428, 2.399872, 1, 0, 0.3607843, 1,
1.47055, -1.147053, 3.075971, 1, 0, 0.3529412, 1,
1.474705, 0.4042064, 0.6596602, 1, 0, 0.3490196, 1,
1.47821, -0.8146273, 2.085988, 1, 0, 0.3411765, 1,
1.481025, -0.1073539, 3.305327, 1, 0, 0.3372549, 1,
1.483406, -0.637571, 2.554281, 1, 0, 0.3294118, 1,
1.495993, 1.280652, 1.223221, 1, 0, 0.3254902, 1,
1.497404, 1.633466, 1.883723, 1, 0, 0.3176471, 1,
1.506822, -1.207334, 2.60429, 1, 0, 0.3137255, 1,
1.507221, -0.3362414, 2.363541, 1, 0, 0.3058824, 1,
1.523023, -2.147715, 1.757721, 1, 0, 0.2980392, 1,
1.530464, 0.3745534, 1.446573, 1, 0, 0.2941177, 1,
1.559953, -1.207963, 3.097247, 1, 0, 0.2862745, 1,
1.597109, -0.1718315, 0.7121974, 1, 0, 0.282353, 1,
1.598018, -0.7622425, 2.817561, 1, 0, 0.2745098, 1,
1.598384, -0.6700508, 1.519865, 1, 0, 0.2705882, 1,
1.607154, 0.8977856, 2.536689, 1, 0, 0.2627451, 1,
1.614588, -0.5399266, 1.795951, 1, 0, 0.2588235, 1,
1.647687, -0.7538256, 2.71164, 1, 0, 0.2509804, 1,
1.652544, 0.9431984, 2.018799, 1, 0, 0.2470588, 1,
1.661466, 0.9977059, 1.732812, 1, 0, 0.2392157, 1,
1.686852, -0.6234879, 1.051291, 1, 0, 0.2352941, 1,
1.69731, 1.611487, 1.109313, 1, 0, 0.227451, 1,
1.698096, 0.9163297, 0.6705011, 1, 0, 0.2235294, 1,
1.709527, 0.9383559, -0.3775099, 1, 0, 0.2156863, 1,
1.719019, -0.5028741, 3.752308, 1, 0, 0.2117647, 1,
1.722617, 0.5494289, 3.930295, 1, 0, 0.2039216, 1,
1.772121, 0.4722959, 1.125994, 1, 0, 0.1960784, 1,
1.793831, 0.4542331, 3.221251, 1, 0, 0.1921569, 1,
1.799615, 1.082636, 2.211499, 1, 0, 0.1843137, 1,
1.808256, 0.6964369, 0.1433294, 1, 0, 0.1803922, 1,
1.905854, 0.6276801, 0.6959873, 1, 0, 0.172549, 1,
1.942705, 0.4514184, 2.903477, 1, 0, 0.1686275, 1,
1.970557, -0.5200487, 1.318945, 1, 0, 0.1607843, 1,
1.978521, -0.1401168, 3.171509, 1, 0, 0.1568628, 1,
2.022036, -0.8957049, 1.999673, 1, 0, 0.1490196, 1,
2.027309, 0.5719869, 2.402828, 1, 0, 0.145098, 1,
2.031799, 0.9658777, 1.731914, 1, 0, 0.1372549, 1,
2.037519, 0.4795747, 1.754475, 1, 0, 0.1333333, 1,
2.03994, 0.5795128, 1.299788, 1, 0, 0.1254902, 1,
2.055124, -0.08957021, 0.3215074, 1, 0, 0.1215686, 1,
2.058283, -1.65103, 1.48987, 1, 0, 0.1137255, 1,
2.066646, -1.036202, 2.113529, 1, 0, 0.1098039, 1,
2.086869, -0.8956864, 1.443945, 1, 0, 0.1019608, 1,
2.121263, 1.424811, 1.402924, 1, 0, 0.09411765, 1,
2.12395, -0.2866614, 1.266101, 1, 0, 0.09019608, 1,
2.155439, -0.1956077, 0.6550792, 1, 0, 0.08235294, 1,
2.187713, 1.050404, 2.22657, 1, 0, 0.07843138, 1,
2.194542, -2.420522, 2.078591, 1, 0, 0.07058824, 1,
2.223625, 0.5440653, 2.703397, 1, 0, 0.06666667, 1,
2.261343, -0.2121795, 2.575827, 1, 0, 0.05882353, 1,
2.28614, 1.548687, 1.62151, 1, 0, 0.05490196, 1,
2.393347, 0.1897375, 3.054841, 1, 0, 0.04705882, 1,
2.418549, -1.975857, 2.098947, 1, 0, 0.04313726, 1,
2.434945, 0.7716237, 2.801499, 1, 0, 0.03529412, 1,
2.521079, -1.897168, 2.108304, 1, 0, 0.03137255, 1,
2.562493, -1.532858, 2.163498, 1, 0, 0.02352941, 1,
2.619442, -1.948082, 1.891019, 1, 0, 0.01960784, 1,
2.746099, -0.90289, 0.7351422, 1, 0, 0.01176471, 1,
2.802019, 1.17251, 0.8088393, 1, 0, 0.007843138, 1
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
-0.6393571, -4.36006, -6.329902, 0, -0.5, 0.5, 0.5,
-0.6393571, -4.36006, -6.329902, 1, -0.5, 0.5, 0.5,
-0.6393571, -4.36006, -6.329902, 1, 1.5, 0.5, 0.5,
-0.6393571, -4.36006, -6.329902, 0, 1.5, 0.5, 0.5
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
-5.24736, 0.1654731, -6.329902, 0, -0.5, 0.5, 0.5,
-5.24736, 0.1654731, -6.329902, 1, -0.5, 0.5, 0.5,
-5.24736, 0.1654731, -6.329902, 1, 1.5, 0.5, 0.5,
-5.24736, 0.1654731, -6.329902, 0, 1.5, 0.5, 0.5
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
-5.24736, -4.36006, 0.5282493, 0, -0.5, 0.5, 0.5,
-5.24736, -4.36006, 0.5282493, 1, -0.5, 0.5, 0.5,
-5.24736, -4.36006, 0.5282493, 1, 1.5, 0.5, 0.5,
-5.24736, -4.36006, 0.5282493, 0, 1.5, 0.5, 0.5
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
-4, -3.315706, -4.747252,
2, -3.315706, -4.747252,
-4, -3.315706, -4.747252,
-4, -3.489765, -5.011027,
-3, -3.315706, -4.747252,
-3, -3.489765, -5.011027,
-2, -3.315706, -4.747252,
-2, -3.489765, -5.011027,
-1, -3.315706, -4.747252,
-1, -3.489765, -5.011027,
0, -3.315706, -4.747252,
0, -3.489765, -5.011027,
1, -3.315706, -4.747252,
1, -3.489765, -5.011027,
2, -3.315706, -4.747252,
2, -3.489765, -5.011027
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
"-4",
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
-4, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
-4, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
-4, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
-4, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5,
-3, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
-3, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
-3, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
-3, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5,
-2, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
-2, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
-2, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
-2, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5,
-1, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
-1, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
-1, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
-1, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5,
0, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
0, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
0, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
0, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5,
1, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
1, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
1, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
1, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5,
2, -3.837883, -5.538577, 0, -0.5, 0.5, 0.5,
2, -3.837883, -5.538577, 1, -0.5, 0.5, 0.5,
2, -3.837883, -5.538577, 1, 1.5, 0.5, 0.5,
2, -3.837883, -5.538577, 0, 1.5, 0.5, 0.5
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
-4.183975, -3, -4.747252,
-4.183975, 3, -4.747252,
-4.183975, -3, -4.747252,
-4.361206, -3, -5.011027,
-4.183975, -2, -4.747252,
-4.361206, -2, -5.011027,
-4.183975, -1, -4.747252,
-4.361206, -1, -5.011027,
-4.183975, 0, -4.747252,
-4.361206, 0, -5.011027,
-4.183975, 1, -4.747252,
-4.361206, 1, -5.011027,
-4.183975, 2, -4.747252,
-4.361206, 2, -5.011027,
-4.183975, 3, -4.747252,
-4.361206, 3, -5.011027
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
-4.715667, -3, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, -3, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, -3, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, -3, -5.538577, 0, 1.5, 0.5, 0.5,
-4.715667, -2, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, -2, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, -2, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, -2, -5.538577, 0, 1.5, 0.5, 0.5,
-4.715667, -1, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, -1, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, -1, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, -1, -5.538577, 0, 1.5, 0.5, 0.5,
-4.715667, 0, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, 0, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, 0, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, 0, -5.538577, 0, 1.5, 0.5, 0.5,
-4.715667, 1, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, 1, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, 1, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, 1, -5.538577, 0, 1.5, 0.5, 0.5,
-4.715667, 2, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, 2, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, 2, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, 2, -5.538577, 0, 1.5, 0.5, 0.5,
-4.715667, 3, -5.538577, 0, -0.5, 0.5, 0.5,
-4.715667, 3, -5.538577, 1, -0.5, 0.5, 0.5,
-4.715667, 3, -5.538577, 1, 1.5, 0.5, 0.5,
-4.715667, 3, -5.538577, 0, 1.5, 0.5, 0.5
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
-4.183975, -3.315706, -4,
-4.183975, -3.315706, 4,
-4.183975, -3.315706, -4,
-4.361206, -3.489765, -4,
-4.183975, -3.315706, -2,
-4.361206, -3.489765, -2,
-4.183975, -3.315706, 0,
-4.361206, -3.489765, 0,
-4.183975, -3.315706, 2,
-4.361206, -3.489765, 2,
-4.183975, -3.315706, 4,
-4.361206, -3.489765, 4
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
-4.715667, -3.837883, -4, 0, -0.5, 0.5, 0.5,
-4.715667, -3.837883, -4, 1, -0.5, 0.5, 0.5,
-4.715667, -3.837883, -4, 1, 1.5, 0.5, 0.5,
-4.715667, -3.837883, -4, 0, 1.5, 0.5, 0.5,
-4.715667, -3.837883, -2, 0, -0.5, 0.5, 0.5,
-4.715667, -3.837883, -2, 1, -0.5, 0.5, 0.5,
-4.715667, -3.837883, -2, 1, 1.5, 0.5, 0.5,
-4.715667, -3.837883, -2, 0, 1.5, 0.5, 0.5,
-4.715667, -3.837883, 0, 0, -0.5, 0.5, 0.5,
-4.715667, -3.837883, 0, 1, -0.5, 0.5, 0.5,
-4.715667, -3.837883, 0, 1, 1.5, 0.5, 0.5,
-4.715667, -3.837883, 0, 0, 1.5, 0.5, 0.5,
-4.715667, -3.837883, 2, 0, -0.5, 0.5, 0.5,
-4.715667, -3.837883, 2, 1, -0.5, 0.5, 0.5,
-4.715667, -3.837883, 2, 1, 1.5, 0.5, 0.5,
-4.715667, -3.837883, 2, 0, 1.5, 0.5, 0.5,
-4.715667, -3.837883, 4, 0, -0.5, 0.5, 0.5,
-4.715667, -3.837883, 4, 1, -0.5, 0.5, 0.5,
-4.715667, -3.837883, 4, 1, 1.5, 0.5, 0.5,
-4.715667, -3.837883, 4, 0, 1.5, 0.5, 0.5
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
-4.183975, -3.315706, -4.747252,
-4.183975, 3.646652, -4.747252,
-4.183975, -3.315706, 5.803751,
-4.183975, 3.646652, 5.803751,
-4.183975, -3.315706, -4.747252,
-4.183975, -3.315706, 5.803751,
-4.183975, 3.646652, -4.747252,
-4.183975, 3.646652, 5.803751,
-4.183975, -3.315706, -4.747252,
2.90526, -3.315706, -4.747252,
-4.183975, -3.315706, 5.803751,
2.90526, -3.315706, 5.803751,
-4.183975, 3.646652, -4.747252,
2.90526, 3.646652, -4.747252,
-4.183975, 3.646652, 5.803751,
2.90526, 3.646652, 5.803751,
2.90526, -3.315706, -4.747252,
2.90526, 3.646652, -4.747252,
2.90526, -3.315706, 5.803751,
2.90526, 3.646652, 5.803751,
2.90526, -3.315706, -4.747252,
2.90526, -3.315706, 5.803751,
2.90526, 3.646652, -4.747252,
2.90526, 3.646652, 5.803751
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
var radius = 7.739133;
var distance = 34.43228;
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
mvMatrix.translate( 0.6393571, -0.1654731, -0.5282493 );
mvMatrix.scale( 1.180339, 1.201849, 0.7930718 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43228);
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
validamycin_A<-read.table("validamycin_A.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-validamycin_A$V2
```

```
## Error in eval(expr, envir, enclos): object 'validamycin_A' not found
```

```r
y<-validamycin_A$V3
```

```
## Error in eval(expr, envir, enclos): object 'validamycin_A' not found
```

```r
z<-validamycin_A$V4
```

```
## Error in eval(expr, envir, enclos): object 'validamycin_A' not found
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
-4.080733, -1.172149, -0.06791925, 0, 0, 1, 1, 1,
-3.139025, -0.5669352, -1.067831, 1, 0, 0, 1, 1,
-3.035532, 0.5199232, -0.6499412, 1, 0, 0, 1, 1,
-2.528219, 1.437026, -0.7974491, 1, 0, 0, 1, 1,
-2.52602, 1.217074, -0.5106142, 1, 0, 0, 1, 1,
-2.465689, -0.183079, -2.035867, 1, 0, 0, 1, 1,
-2.321487, 0.2166453, -1.37713, 0, 0, 0, 1, 1,
-2.239929, 0.6202582, -2.219476, 0, 0, 0, 1, 1,
-2.23673, 1.069977, 0.2840454, 0, 0, 0, 1, 1,
-2.205465, 0.2987861, -2.247142, 0, 0, 0, 1, 1,
-2.148305, 1.654446, 0.02598383, 0, 0, 0, 1, 1,
-2.117762, -0.8831877, -2.718761, 0, 0, 0, 1, 1,
-2.103568, -1.069903, -2.533176, 0, 0, 0, 1, 1,
-2.065142, -0.03225986, -1.940982, 1, 1, 1, 1, 1,
-2.040563, 0.8414401, -2.89549, 1, 1, 1, 1, 1,
-2.032609, 1.39346, -1.544695, 1, 1, 1, 1, 1,
-2.026437, -0.4052223, -1.741199, 1, 1, 1, 1, 1,
-2.023499, -1.51891, -3.063731, 1, 1, 1, 1, 1,
-1.950392, 0.3882169, -1.542824, 1, 1, 1, 1, 1,
-1.943992, 0.7901915, -3.599722, 1, 1, 1, 1, 1,
-1.943819, 0.07621069, -3.819795, 1, 1, 1, 1, 1,
-1.937409, 0.8411643, -0.8804322, 1, 1, 1, 1, 1,
-1.886751, 0.04117756, -1.913777, 1, 1, 1, 1, 1,
-1.847817, 0.387492, -1.107867, 1, 1, 1, 1, 1,
-1.84691, -0.2729649, 0.3702424, 1, 1, 1, 1, 1,
-1.845798, -1.809918, -3.625025, 1, 1, 1, 1, 1,
-1.83496, -0.2006097, -2.269368, 1, 1, 1, 1, 1,
-1.829625, 0.7709368, -0.2762731, 1, 1, 1, 1, 1,
-1.815406, 2.178044, -1.153525, 0, 0, 1, 1, 1,
-1.809498, -0.4390804, -2.75047, 1, 0, 0, 1, 1,
-1.80717, 0.7243944, -1.933515, 1, 0, 0, 1, 1,
-1.806816, -1.055153, -3.452721, 1, 0, 0, 1, 1,
-1.783988, -1.403788, -1.605546, 1, 0, 0, 1, 1,
-1.782017, -1.832629, -1.048737, 1, 0, 0, 1, 1,
-1.765789, -0.6585482, -2.698512, 0, 0, 0, 1, 1,
-1.75708, -1.096904, -1.99708, 0, 0, 0, 1, 1,
-1.74458, 0.05364963, -1.554143, 0, 0, 0, 1, 1,
-1.730746, 0.05095758, -1.263615, 0, 0, 0, 1, 1,
-1.715429, -0.5062032, -2.690575, 0, 0, 0, 1, 1,
-1.702348, 0.9264758, -3.349912, 0, 0, 0, 1, 1,
-1.694443, 0.7841362, -1.869822, 0, 0, 0, 1, 1,
-1.684972, -0.9212112, -1.010493, 1, 1, 1, 1, 1,
-1.676558, -0.1260963, -1.47342, 1, 1, 1, 1, 1,
-1.658867, 1.509623, -1.639776, 1, 1, 1, 1, 1,
-1.655979, 0.6782129, -0.2619926, 1, 1, 1, 1, 1,
-1.654712, -0.2449932, -1.611034, 1, 1, 1, 1, 1,
-1.653276, 0.02796528, -1.805619, 1, 1, 1, 1, 1,
-1.646834, -0.9921685, -2.058108, 1, 1, 1, 1, 1,
-1.640626, -2.19544, 0.03222527, 1, 1, 1, 1, 1,
-1.639957, -0.7196255, -0.9091057, 1, 1, 1, 1, 1,
-1.629778, 0.8216835, 0.002225896, 1, 1, 1, 1, 1,
-1.628404, 0.2815977, -2.00845, 1, 1, 1, 1, 1,
-1.625422, 1.17891, -0.9888204, 1, 1, 1, 1, 1,
-1.619207, -0.6782091, -2.504952, 1, 1, 1, 1, 1,
-1.611381, -1.032273, -1.74933, 1, 1, 1, 1, 1,
-1.606601, 0.1727327, -1.690416, 1, 1, 1, 1, 1,
-1.603861, 0.1205254, -0.7807665, 0, 0, 1, 1, 1,
-1.60204, -2.14812, -2.305811, 1, 0, 0, 1, 1,
-1.593694, -1.283886, -1.986212, 1, 0, 0, 1, 1,
-1.591757, -1.328029, -3.820732, 1, 0, 0, 1, 1,
-1.572241, 0.7346892, -1.372054, 1, 0, 0, 1, 1,
-1.565212, -0.09589434, -1.088459, 1, 0, 0, 1, 1,
-1.549425, 0.4533464, -0.5471765, 0, 0, 0, 1, 1,
-1.546682, 0.6987864, -0.4212225, 0, 0, 0, 1, 1,
-1.531194, -2.322156, -0.5765333, 0, 0, 0, 1, 1,
-1.531164, 0.916131, -1.921307, 0, 0, 0, 1, 1,
-1.524865, -0.4264061, 1.095426, 0, 0, 0, 1, 1,
-1.51596, 0.06026533, -3.478817, 0, 0, 0, 1, 1,
-1.504742, 0.1098629, -3.185384, 0, 0, 0, 1, 1,
-1.50171, 2.063529, -0.5469559, 1, 1, 1, 1, 1,
-1.461437, -0.6557178, -1.070321, 1, 1, 1, 1, 1,
-1.443202, 0.5013979, -1.388043, 1, 1, 1, 1, 1,
-1.438843, -0.7174368, -2.302965, 1, 1, 1, 1, 1,
-1.431728, -0.3316378, -2.294685, 1, 1, 1, 1, 1,
-1.429725, -1.583385, -2.404725, 1, 1, 1, 1, 1,
-1.429718, 1.510246, -0.8451294, 1, 1, 1, 1, 1,
-1.420551, -0.3043703, -1.213856, 1, 1, 1, 1, 1,
-1.416668, 0.01263345, -2.609349, 1, 1, 1, 1, 1,
-1.396514, -1.206008, -2.110102, 1, 1, 1, 1, 1,
-1.39631, -0.8091106, -2.644846, 1, 1, 1, 1, 1,
-1.376272, 0.6168596, -0.6914549, 1, 1, 1, 1, 1,
-1.360992, 0.1522291, -3.271246, 1, 1, 1, 1, 1,
-1.359665, -0.1632634, -2.022842, 1, 1, 1, 1, 1,
-1.345437, -0.6137861, -1.653857, 1, 1, 1, 1, 1,
-1.335454, 0.1698564, -0.824005, 0, 0, 1, 1, 1,
-1.334337, 0.6193725, -1.033329, 1, 0, 0, 1, 1,
-1.334092, 1.500288, -0.6894372, 1, 0, 0, 1, 1,
-1.332204, 2.560483, 0.06681975, 1, 0, 0, 1, 1,
-1.280163, 0.3376358, -2.275684, 1, 0, 0, 1, 1,
-1.275663, 0.3276286, -0.9807596, 1, 0, 0, 1, 1,
-1.271241, 1.725426, 1.134068, 0, 0, 0, 1, 1,
-1.271171, 0.2213735, -1.109673, 0, 0, 0, 1, 1,
-1.270783, 0.4130805, -1.764173, 0, 0, 0, 1, 1,
-1.253218, 1.545433, -1.467969, 0, 0, 0, 1, 1,
-1.249811, -1.446547, -3.924232, 0, 0, 0, 1, 1,
-1.238277, -0.02769218, -1.187631, 0, 0, 0, 1, 1,
-1.227316, -0.1225569, -1.815575, 0, 0, 0, 1, 1,
-1.222963, 0.1625552, -2.31892, 1, 1, 1, 1, 1,
-1.217846, 0.8600215, -0.7251129, 1, 1, 1, 1, 1,
-1.214291, -0.8221818, -1.344562, 1, 1, 1, 1, 1,
-1.213325, -0.9891588, -1.496807, 1, 1, 1, 1, 1,
-1.210011, -0.04961849, -1.250192, 1, 1, 1, 1, 1,
-1.20585, -0.02516554, -2.219989, 1, 1, 1, 1, 1,
-1.199993, -0.9825645, -0.9925946, 1, 1, 1, 1, 1,
-1.196882, 0.1754492, -0.8189529, 1, 1, 1, 1, 1,
-1.195919, -0.2861844, -0.769824, 1, 1, 1, 1, 1,
-1.186409, 0.2063681, -1.895105, 1, 1, 1, 1, 1,
-1.183691, 0.255125, -0.03935654, 1, 1, 1, 1, 1,
-1.176598, 0.5104924, -0.3431077, 1, 1, 1, 1, 1,
-1.173779, 0.8615066, -1.025165, 1, 1, 1, 1, 1,
-1.170818, -0.007956143, 1.396175, 1, 1, 1, 1, 1,
-1.169996, 1.728605, -0.4405302, 1, 1, 1, 1, 1,
-1.168314, 0.1541664, -2.507272, 0, 0, 1, 1, 1,
-1.159157, -0.1987596, -2.406065, 1, 0, 0, 1, 1,
-1.139334, 0.505948, -0.4659865, 1, 0, 0, 1, 1,
-1.138402, 0.2092364, -2.09629, 1, 0, 0, 1, 1,
-1.136018, 0.3617497, -2.101629, 1, 0, 0, 1, 1,
-1.135534, -2.128324, -2.861279, 1, 0, 0, 1, 1,
-1.129905, -0.7250537, -2.514917, 0, 0, 0, 1, 1,
-1.125003, -1.347923, -2.397411, 0, 0, 0, 1, 1,
-1.124042, -1.275635, -2.125586, 0, 0, 0, 1, 1,
-1.118572, -0.2696226, -1.618695, 0, 0, 0, 1, 1,
-1.118235, -0.8781529, -1.974385, 0, 0, 0, 1, 1,
-1.117785, -1.430608, -2.478332, 0, 0, 0, 1, 1,
-1.117324, -1.23594, -3.847574, 0, 0, 0, 1, 1,
-1.117005, 0.3356401, -1.375561, 1, 1, 1, 1, 1,
-1.116876, 0.329261, -2.683624, 1, 1, 1, 1, 1,
-1.101296, 0.6313344, -0.008096915, 1, 1, 1, 1, 1,
-1.09929, 0.02499398, -2.293285, 1, 1, 1, 1, 1,
-1.096957, 0.02448275, -2.374829, 1, 1, 1, 1, 1,
-1.068586, -0.5692105, 0.3783723, 1, 1, 1, 1, 1,
-1.065766, 0.8861035, -2.838001, 1, 1, 1, 1, 1,
-1.064904, -0.7241923, -1.63645, 1, 1, 1, 1, 1,
-1.056905, -0.9002746, -3.805605, 1, 1, 1, 1, 1,
-1.051639, -0.405573, -1.746847, 1, 1, 1, 1, 1,
-1.05102, 2.063183, -1.319699, 1, 1, 1, 1, 1,
-1.040349, -0.1970344, -1.061634, 1, 1, 1, 1, 1,
-1.037436, -0.6004419, -2.210143, 1, 1, 1, 1, 1,
-1.037416, 0.735118, 0.4663146, 1, 1, 1, 1, 1,
-1.03655, 0.1876338, -1.020384, 1, 1, 1, 1, 1,
-1.031706, -0.8096266, -3.685228, 0, 0, 1, 1, 1,
-1.031467, -0.8022727, -3.163112, 1, 0, 0, 1, 1,
-1.025297, 0.8281151, -3.042211, 1, 0, 0, 1, 1,
-1.023508, -0.2725748, -2.312951, 1, 0, 0, 1, 1,
-1.022572, -1.428401, -2.885693, 1, 0, 0, 1, 1,
-1.021187, -0.1948065, -2.181017, 1, 0, 0, 1, 1,
-1.013837, 0.2825336, -1.749613, 0, 0, 0, 1, 1,
-1.007967, 0.5088463, 0.4980926, 0, 0, 0, 1, 1,
-0.9950573, -0.7672368, -1.722152, 0, 0, 0, 1, 1,
-0.9948086, -1.133025, -3.874345, 0, 0, 0, 1, 1,
-0.9931091, 1.409957, 1.397019, 0, 0, 0, 1, 1,
-0.9884128, -0.6137844, -2.511005, 0, 0, 0, 1, 1,
-0.9811444, 0.51153, -1.862784, 0, 0, 0, 1, 1,
-0.9741437, -0.1833808, -2.4807, 1, 1, 1, 1, 1,
-0.9681733, -0.9627326, -0.9837187, 1, 1, 1, 1, 1,
-0.9679261, 1.437647, 0.5459591, 1, 1, 1, 1, 1,
-0.9675887, -0.7870038, -3.881004, 1, 1, 1, 1, 1,
-0.9658006, -0.9509489, -1.216054, 1, 1, 1, 1, 1,
-0.9652124, 0.07602053, -2.417136, 1, 1, 1, 1, 1,
-0.9621761, 0.8959112, 0.599508, 1, 1, 1, 1, 1,
-0.9578781, 1.425404, -0.9456564, 1, 1, 1, 1, 1,
-0.9560462, -0.5310259, -3.167433, 1, 1, 1, 1, 1,
-0.9558272, 0.2261498, -2.581901, 1, 1, 1, 1, 1,
-0.9543169, -1.189118, -1.683224, 1, 1, 1, 1, 1,
-0.954026, -1.588877, -2.452055, 1, 1, 1, 1, 1,
-0.9525064, 1.715156, -0.4582179, 1, 1, 1, 1, 1,
-0.9483228, -1.415768, -1.78521, 1, 1, 1, 1, 1,
-0.9382476, 0.1392381, -0.9763175, 1, 1, 1, 1, 1,
-0.9374502, 0.7228945, -2.227017, 0, 0, 1, 1, 1,
-0.9348125, 0.7592439, -1.514819, 1, 0, 0, 1, 1,
-0.9290584, -1.794156, -2.038717, 1, 0, 0, 1, 1,
-0.928182, 1.43684, -0.1744395, 1, 0, 0, 1, 1,
-0.9281501, -0.3238384, -2.446495, 1, 0, 0, 1, 1,
-0.9251152, -0.6482436, -0.4363592, 1, 0, 0, 1, 1,
-0.9205443, -2.18083, -3.267114, 0, 0, 0, 1, 1,
-0.9177696, 0.2250213, -1.463378, 0, 0, 0, 1, 1,
-0.9175268, -2.307204, -1.830118, 0, 0, 0, 1, 1,
-0.9143071, -0.5875283, -2.67592, 0, 0, 0, 1, 1,
-0.9035835, 0.4086225, -1.320531, 0, 0, 0, 1, 1,
-0.8989029, 1.902439, -0.3671987, 0, 0, 0, 1, 1,
-0.8928458, 1.039579, 0.2317706, 0, 0, 0, 1, 1,
-0.8869402, -0.8864888, -4.114756, 1, 1, 1, 1, 1,
-0.8829691, -0.3430735, -1.94099, 1, 1, 1, 1, 1,
-0.8763734, 0.5971531, -1.528555, 1, 1, 1, 1, 1,
-0.8754239, 1.358582, 0.4416065, 1, 1, 1, 1, 1,
-0.87467, -0.2805858, -0.5048457, 1, 1, 1, 1, 1,
-0.8746325, -0.9059601, -1.252529, 1, 1, 1, 1, 1,
-0.8734235, 1.349961, -0.09310318, 1, 1, 1, 1, 1,
-0.8710046, 0.9252497, -1.026783, 1, 1, 1, 1, 1,
-0.8642648, -0.383836, -2.974168, 1, 1, 1, 1, 1,
-0.8565795, -0.6910242, -1.828958, 1, 1, 1, 1, 1,
-0.8497277, -0.4097281, -0.6776823, 1, 1, 1, 1, 1,
-0.8411352, -0.05729378, -2.001702, 1, 1, 1, 1, 1,
-0.8408784, 0.7423406, -2.809382, 1, 1, 1, 1, 1,
-0.8303772, 0.9563187, -0.2960337, 1, 1, 1, 1, 1,
-0.829802, 0.3403606, -3.658381, 1, 1, 1, 1, 1,
-0.8285573, -1.245267, -3.219465, 0, 0, 1, 1, 1,
-0.8280446, 0.4061632, -2.68538, 1, 0, 0, 1, 1,
-0.8239503, 0.07576981, -0.5465368, 1, 0, 0, 1, 1,
-0.8236411, 1.118094, -0.5277987, 1, 0, 0, 1, 1,
-0.8206233, -0.09733077, -1.717721, 1, 0, 0, 1, 1,
-0.8181206, -0.6260077, -2.218764, 1, 0, 0, 1, 1,
-0.8176834, 0.1606019, -1.709908, 0, 0, 0, 1, 1,
-0.8148206, 0.7006924, -1.412066, 0, 0, 0, 1, 1,
-0.8110272, 0.6659483, -0.9526983, 0, 0, 0, 1, 1,
-0.810891, 1.904366, 1.079634, 0, 0, 0, 1, 1,
-0.8075907, 0.9958214, -0.2051068, 0, 0, 0, 1, 1,
-0.8075211, -0.5065839, -1.7649, 0, 0, 0, 1, 1,
-0.8071299, -0.4592941, -1.856017, 0, 0, 0, 1, 1,
-0.801927, -0.002282342, 0.1342957, 1, 1, 1, 1, 1,
-0.7963868, -0.03792709, -2.011185, 1, 1, 1, 1, 1,
-0.7870058, 0.7057352, -0.3467351, 1, 1, 1, 1, 1,
-0.7847065, -0.1150119, -3.430667, 1, 1, 1, 1, 1,
-0.7815605, -0.6439043, -2.915384, 1, 1, 1, 1, 1,
-0.7747717, 2.246897, -0.3639514, 1, 1, 1, 1, 1,
-0.7703754, -3.096758, -2.923245, 1, 1, 1, 1, 1,
-0.7691687, -0.5104052, -3.13472, 1, 1, 1, 1, 1,
-0.7685438, 0.7727962, -0.6553462, 1, 1, 1, 1, 1,
-0.7649653, -0.2521985, -3.539093, 1, 1, 1, 1, 1,
-0.7547563, -1.71374, -3.825171, 1, 1, 1, 1, 1,
-0.7400854, -0.2114793, -0.02647345, 1, 1, 1, 1, 1,
-0.7379519, -1.515429, -3.956491, 1, 1, 1, 1, 1,
-0.7357377, 0.4886035, -0.2502597, 1, 1, 1, 1, 1,
-0.7302226, -0.6672608, -2.092062, 1, 1, 1, 1, 1,
-0.7296808, 1.045222, 0.4351935, 0, 0, 1, 1, 1,
-0.7207411, 0.1380898, -1.599697, 1, 0, 0, 1, 1,
-0.7198799, -1.759259, -3.319777, 1, 0, 0, 1, 1,
-0.7106837, -0.2871286, -3.19359, 1, 0, 0, 1, 1,
-0.7066158, -0.8330546, -1.466718, 1, 0, 0, 1, 1,
-0.688067, -0.1300005, -0.9789395, 1, 0, 0, 1, 1,
-0.6832197, 0.3758716, -0.02653526, 0, 0, 0, 1, 1,
-0.68175, 2.182705, -0.9867136, 0, 0, 0, 1, 1,
-0.6786126, 0.2159369, 0.09532055, 0, 0, 0, 1, 1,
-0.6765967, -0.6553518, -2.27392, 0, 0, 0, 1, 1,
-0.6759958, 1.767815, -0.7148947, 0, 0, 0, 1, 1,
-0.6759613, -0.7233472, -2.677363, 0, 0, 0, 1, 1,
-0.6701233, 1.667466, -0.5584958, 0, 0, 0, 1, 1,
-0.6640285, -0.9459493, -2.878276, 1, 1, 1, 1, 1,
-0.6614624, 1.152085, -2.238949, 1, 1, 1, 1, 1,
-0.6587306, -1.755638, -2.405855, 1, 1, 1, 1, 1,
-0.6573886, -1.87786, -1.078553, 1, 1, 1, 1, 1,
-0.6551278, 0.4646173, 0.1846657, 1, 1, 1, 1, 1,
-0.6533847, 1.197403, 0.9898269, 1, 1, 1, 1, 1,
-0.6533623, -1.169522, -1.833716, 1, 1, 1, 1, 1,
-0.653123, -1.34628, -0.928183, 1, 1, 1, 1, 1,
-0.6498395, -1.527972, -2.512145, 1, 1, 1, 1, 1,
-0.6453996, 0.8927897, -0.883736, 1, 1, 1, 1, 1,
-0.6416707, -1.716765, -2.17662, 1, 1, 1, 1, 1,
-0.6409401, -0.3842221, -2.486194, 1, 1, 1, 1, 1,
-0.639026, -0.5058457, -3.156147, 1, 1, 1, 1, 1,
-0.638459, 0.6330633, -0.321389, 1, 1, 1, 1, 1,
-0.6357391, -0.6346284, -2.928697, 1, 1, 1, 1, 1,
-0.6311301, 1.044656, -0.2778138, 0, 0, 1, 1, 1,
-0.6260665, 1.61612, -1.533359, 1, 0, 0, 1, 1,
-0.6257223, 0.9738956, -1.78536, 1, 0, 0, 1, 1,
-0.6244977, 0.9480349, 0.3800067, 1, 0, 0, 1, 1,
-0.6195261, -1.481955, -3.897051, 1, 0, 0, 1, 1,
-0.6174384, 1.964409, 0.5547585, 1, 0, 0, 1, 1,
-0.6173248, 1.361167, 0.1147146, 0, 0, 0, 1, 1,
-0.6161032, 0.3389331, -0.2508487, 0, 0, 0, 1, 1,
-0.6126713, 0.3552913, -1.040637, 0, 0, 0, 1, 1,
-0.6079222, 0.1610382, -2.628007, 0, 0, 0, 1, 1,
-0.6062681, -0.3827617, -3.062865, 0, 0, 0, 1, 1,
-0.6019285, -2.86721, -2.0025, 0, 0, 0, 1, 1,
-0.6005128, 1.651266, -0.7400081, 0, 0, 0, 1, 1,
-0.5990028, -0.557202, -0.4010424, 1, 1, 1, 1, 1,
-0.5950501, -2.361282, -1.799377, 1, 1, 1, 1, 1,
-0.5892307, -0.2429319, -1.955898, 1, 1, 1, 1, 1,
-0.5870612, 0.03159551, -1.703125, 1, 1, 1, 1, 1,
-0.586307, -0.1434491, -2.312547, 1, 1, 1, 1, 1,
-0.5838451, -0.1477416, -1.842845, 1, 1, 1, 1, 1,
-0.5795388, -0.2451888, -2.264044, 1, 1, 1, 1, 1,
-0.5770171, -1.377873, -3.769248, 1, 1, 1, 1, 1,
-0.5757273, -0.8606511, -3.646988, 1, 1, 1, 1, 1,
-0.5715665, 0.5197832, -2.50839, 1, 1, 1, 1, 1,
-0.5654173, -0.1747275, -2.752609, 1, 1, 1, 1, 1,
-0.564104, 1.114425, -1.806984, 1, 1, 1, 1, 1,
-0.5555912, 0.8678775, -1.122973, 1, 1, 1, 1, 1,
-0.5548287, -0.5417581, -1.347369, 1, 1, 1, 1, 1,
-0.5532981, 1.734105, -0.965792, 1, 1, 1, 1, 1,
-0.550354, -0.8481408, -4.017284, 0, 0, 1, 1, 1,
-0.5496824, 0.0002679622, -0.2700278, 1, 0, 0, 1, 1,
-0.5466723, 0.4267342, -0.6997303, 1, 0, 0, 1, 1,
-0.5446338, -0.5057368, -3.835489, 1, 0, 0, 1, 1,
-0.5432588, 0.1479154, -2.964531, 1, 0, 0, 1, 1,
-0.539083, 0.434974, -0.2673241, 1, 0, 0, 1, 1,
-0.5332491, 0.7793872, -0.7683335, 0, 0, 0, 1, 1,
-0.533248, 1.367308, -1.349579, 0, 0, 0, 1, 1,
-0.5324976, 1.280701, -1.490264, 0, 0, 0, 1, 1,
-0.5290923, -0.9828112, -2.87026, 0, 0, 0, 1, 1,
-0.5266079, 2.689128, -0.8573849, 0, 0, 0, 1, 1,
-0.526452, -0.4287879, -3.115715, 0, 0, 0, 1, 1,
-0.5238003, -0.8930246, -3.502944, 0, 0, 0, 1, 1,
-0.5237928, -0.5071549, -0.6056068, 1, 1, 1, 1, 1,
-0.5227445, 0.8874235, -1.932042, 1, 1, 1, 1, 1,
-0.5209267, 0.8358556, -1.684778, 1, 1, 1, 1, 1,
-0.5192347, -0.3540678, -3.154094, 1, 1, 1, 1, 1,
-0.5175934, -1.114404, -1.738974, 1, 1, 1, 1, 1,
-0.5128751, 0.1992988, -1.156911, 1, 1, 1, 1, 1,
-0.5069504, -0.6634631, -2.090835, 1, 1, 1, 1, 1,
-0.5034246, 1.328412, -0.3899381, 1, 1, 1, 1, 1,
-0.5026937, -0.6815233, -2.648242, 1, 1, 1, 1, 1,
-0.5020069, 0.7117659, -1.750088, 1, 1, 1, 1, 1,
-0.5018391, 0.7094265, -0.4869174, 1, 1, 1, 1, 1,
-0.4946061, 0.6200633, -0.6790532, 1, 1, 1, 1, 1,
-0.4906572, -0.4534138, -1.377884, 1, 1, 1, 1, 1,
-0.4886189, 1.249983, -0.217385, 1, 1, 1, 1, 1,
-0.4841396, -0.09300573, -2.356408, 1, 1, 1, 1, 1,
-0.4831336, -1.329529, -1.396343, 0, 0, 1, 1, 1,
-0.4822935, -0.6486676, -1.492278, 1, 0, 0, 1, 1,
-0.4791725, 0.02408758, -2.696918, 1, 0, 0, 1, 1,
-0.4742573, 0.3128383, -0.4696535, 1, 0, 0, 1, 1,
-0.4740318, -0.3495484, -1.344964, 1, 0, 0, 1, 1,
-0.4668083, -1.308044, -1.164491, 1, 0, 0, 1, 1,
-0.4664895, 0.1856301, -1.464096, 0, 0, 0, 1, 1,
-0.4645513, 1.098503, -1.042579, 0, 0, 0, 1, 1,
-0.4621145, -1.54494, -3.15037, 0, 0, 0, 1, 1,
-0.4583634, -1.456669, -3.291097, 0, 0, 0, 1, 1,
-0.4572267, -0.3601465, -2.9663, 0, 0, 0, 1, 1,
-0.4568006, 0.3998184, -0.5645451, 0, 0, 0, 1, 1,
-0.455505, 1.03951, 0.04659991, 0, 0, 0, 1, 1,
-0.4546916, 0.2401479, -1.457789, 1, 1, 1, 1, 1,
-0.4525758, -1.975024, -3.565657, 1, 1, 1, 1, 1,
-0.4515174, -0.07514051, -0.2170312, 1, 1, 1, 1, 1,
-0.4498397, -0.3086403, -3.275174, 1, 1, 1, 1, 1,
-0.4457796, -1.037915, -2.821565, 1, 1, 1, 1, 1,
-0.4416925, -1.180948, -3.845046, 1, 1, 1, 1, 1,
-0.4407466, -0.05884242, -2.893804, 1, 1, 1, 1, 1,
-0.4387908, 0.9852033, -0.6185446, 1, 1, 1, 1, 1,
-0.4324817, 0.289793, -1.152266, 1, 1, 1, 1, 1,
-0.4312163, -0.4666278, -1.501087, 1, 1, 1, 1, 1,
-0.4289322, 0.4344261, -1.150624, 1, 1, 1, 1, 1,
-0.4288766, -0.516292, -3.0068, 1, 1, 1, 1, 1,
-0.4273985, 0.8664318, 0.0866857, 1, 1, 1, 1, 1,
-0.4260099, 1.658741, -0.0920193, 1, 1, 1, 1, 1,
-0.4249318, 0.2043148, -1.905185, 1, 1, 1, 1, 1,
-0.4236055, 0.8271801, -1.344128, 0, 0, 1, 1, 1,
-0.4133493, 2.044856, 0.7403607, 1, 0, 0, 1, 1,
-0.4100487, -0.06983455, -1.588627, 1, 0, 0, 1, 1,
-0.4090989, 2.378909, 0.2829482, 1, 0, 0, 1, 1,
-0.4074914, -0.748496, -3.812602, 1, 0, 0, 1, 1,
-0.4021945, -0.626608, -2.920449, 1, 0, 0, 1, 1,
-0.402094, -1.12039, 0.125384, 0, 0, 0, 1, 1,
-0.4016158, 1.573595, -0.6650777, 0, 0, 0, 1, 1,
-0.4002558, 0.5199417, -1.847845, 0, 0, 0, 1, 1,
-0.3998416, 0.4630058, -1.047293, 0, 0, 0, 1, 1,
-0.3979875, 0.8046941, -1.45195, 0, 0, 0, 1, 1,
-0.3951659, -0.3467947, -0.2334083, 0, 0, 0, 1, 1,
-0.3928736, 1.28502, 0.4580908, 0, 0, 0, 1, 1,
-0.3922153, 1.646349, -1.170322, 1, 1, 1, 1, 1,
-0.3863344, 1.327607, 1.076601, 1, 1, 1, 1, 1,
-0.384093, 0.09536889, -1.95314, 1, 1, 1, 1, 1,
-0.3776159, -0.07529498, -1.698987, 1, 1, 1, 1, 1,
-0.3745627, -0.6337674, -0.4965081, 1, 1, 1, 1, 1,
-0.372146, 0.02044346, -1.748725, 1, 1, 1, 1, 1,
-0.3630238, -0.3073985, -0.5501401, 1, 1, 1, 1, 1,
-0.3620799, -1.423551, -1.525573, 1, 1, 1, 1, 1,
-0.3595286, -0.03342749, 0.06929499, 1, 1, 1, 1, 1,
-0.3550217, 1.347703, -0.9729286, 1, 1, 1, 1, 1,
-0.3505686, -0.6548788, -1.846346, 1, 1, 1, 1, 1,
-0.3391528, -2.164032, -1.545112, 1, 1, 1, 1, 1,
-0.3379738, -2.040925, -3.632896, 1, 1, 1, 1, 1,
-0.328603, -0.715229, -0.5376335, 1, 1, 1, 1, 1,
-0.3265608, 1.111919, -1.075387, 1, 1, 1, 1, 1,
-0.3244072, 0.1371467, -0.7358685, 0, 0, 1, 1, 1,
-0.3237723, -2.326401, -2.736244, 1, 0, 0, 1, 1,
-0.323122, 1.331741, 0.06438138, 1, 0, 0, 1, 1,
-0.3230459, -0.5841077, -3.678031, 1, 0, 0, 1, 1,
-0.3116876, 1.345707, -0.2693084, 1, 0, 0, 1, 1,
-0.3111133, -2.997111, -3.009542, 1, 0, 0, 1, 1,
-0.3100266, -0.3186253, -3.491365, 0, 0, 0, 1, 1,
-0.3098615, 1.270568, -0.2171542, 0, 0, 0, 1, 1,
-0.3096402, -0.4126924, -2.724213, 0, 0, 0, 1, 1,
-0.3068455, -0.5331799, -2.024897, 0, 0, 0, 1, 1,
-0.3052006, 0.06145994, -0.5488628, 0, 0, 0, 1, 1,
-0.3028347, 1.05279, -0.8551448, 0, 0, 0, 1, 1,
-0.3018743, -0.02434324, -3.484741, 0, 0, 0, 1, 1,
-0.2995572, 0.4883412, -0.772639, 1, 1, 1, 1, 1,
-0.2993253, -0.8986913, -1.463955, 1, 1, 1, 1, 1,
-0.2991847, 1.535288, 1.072327, 1, 1, 1, 1, 1,
-0.295375, -2.699214, -2.148876, 1, 1, 1, 1, 1,
-0.2946115, 1.177682, 1.105333, 1, 1, 1, 1, 1,
-0.2942533, 0.07397068, -0.4868144, 1, 1, 1, 1, 1,
-0.2939953, 0.9609867, 0.1113732, 1, 1, 1, 1, 1,
-0.2921273, 0.02654998, -1.072185, 1, 1, 1, 1, 1,
-0.291955, 0.8664188, -0.1565189, 1, 1, 1, 1, 1,
-0.2918625, 0.9437658, 0.5534384, 1, 1, 1, 1, 1,
-0.2752624, 0.830197, 1.776805, 1, 1, 1, 1, 1,
-0.272698, -0.7561978, -2.20134, 1, 1, 1, 1, 1,
-0.2720719, 0.1110341, -1.223679, 1, 1, 1, 1, 1,
-0.2668013, 0.2754688, -1.762294, 1, 1, 1, 1, 1,
-0.2663712, 0.7775242, 0.1538447, 1, 1, 1, 1, 1,
-0.2632291, 1.361474, 0.7735221, 0, 0, 1, 1, 1,
-0.2606443, 0.2813883, -0.7290254, 1, 0, 0, 1, 1,
-0.2578529, -1.079307, -2.267513, 1, 0, 0, 1, 1,
-0.2574284, -0.4248957, -3.239021, 1, 0, 0, 1, 1,
-0.2516999, -0.4430171, -2.418587, 1, 0, 0, 1, 1,
-0.2489884, 0.767549, 0.3351191, 1, 0, 0, 1, 1,
-0.2469934, 1.701804, -1.041081, 0, 0, 0, 1, 1,
-0.2449655, 0.4722101, -0.04400225, 0, 0, 0, 1, 1,
-0.2438992, 1.299074, 2.088708, 0, 0, 0, 1, 1,
-0.2434123, 3.545259, 0.4526897, 0, 0, 0, 1, 1,
-0.2431745, 0.1796948, -1.378649, 0, 0, 0, 1, 1,
-0.2392363, -0.638199, -0.7660392, 0, 0, 0, 1, 1,
-0.2369316, -0.6960784, -1.066823, 0, 0, 0, 1, 1,
-0.2366112, -0.8831201, -4.593596, 1, 1, 1, 1, 1,
-0.2359158, -1.322135, -3.458138, 1, 1, 1, 1, 1,
-0.2337829, -0.5809069, -2.826705, 1, 1, 1, 1, 1,
-0.2304154, 0.3802679, -1.887929, 1, 1, 1, 1, 1,
-0.2292562, 0.2557059, 0.1210134, 1, 1, 1, 1, 1,
-0.226166, -0.1665776, -2.15202, 1, 1, 1, 1, 1,
-0.2227566, -0.06140925, -1.406264, 1, 1, 1, 1, 1,
-0.2218228, 0.4953119, 0.5678429, 1, 1, 1, 1, 1,
-0.218582, 0.5488659, -0.6489024, 1, 1, 1, 1, 1,
-0.2154908, 0.3002533, -1.896061, 1, 1, 1, 1, 1,
-0.2152828, 0.7025206, 1.513928, 1, 1, 1, 1, 1,
-0.2152003, 0.5932834, -1.702633, 1, 1, 1, 1, 1,
-0.2106953, 1.553156, 0.1852936, 1, 1, 1, 1, 1,
-0.2034049, 0.2977177, -0.9767665, 1, 1, 1, 1, 1,
-0.1939392, 0.1391688, -0.5045677, 1, 1, 1, 1, 1,
-0.1925894, 0.7493793, -0.5977657, 0, 0, 1, 1, 1,
-0.1918247, -1.842425, -2.97406, 1, 0, 0, 1, 1,
-0.1907991, -0.6943464, -3.178875, 1, 0, 0, 1, 1,
-0.1902783, 0.8633897, 0.474711, 1, 0, 0, 1, 1,
-0.1886464, -0.9792639, -3.542125, 1, 0, 0, 1, 1,
-0.1864546, 1.727015, -1.613615, 1, 0, 0, 1, 1,
-0.1792254, -0.352734, -2.136502, 0, 0, 0, 1, 1,
-0.17451, 1.746252, -0.3765254, 0, 0, 0, 1, 1,
-0.1690275, 1.296369, -0.4775466, 0, 0, 0, 1, 1,
-0.1675627, 0.8359967, -0.3646202, 0, 0, 0, 1, 1,
-0.1660876, -0.4767118, -1.267413, 0, 0, 0, 1, 1,
-0.1637036, 0.4008795, -1.967956, 0, 0, 0, 1, 1,
-0.1608427, -0.6135578, -1.412389, 0, 0, 0, 1, 1,
-0.1514517, -1.19675, -2.585751, 1, 1, 1, 1, 1,
-0.1446636, -0.2665606, -2.085643, 1, 1, 1, 1, 1,
-0.1420568, -0.01060017, -1.340116, 1, 1, 1, 1, 1,
-0.1405087, 0.01739583, -1.509815, 1, 1, 1, 1, 1,
-0.1402716, 0.3581213, -1.943138, 1, 1, 1, 1, 1,
-0.1390605, 1.615267, -0.3423098, 1, 1, 1, 1, 1,
-0.1384004, 0.537773, 0.2507038, 1, 1, 1, 1, 1,
-0.1381892, -0.9673842, -4.078675, 1, 1, 1, 1, 1,
-0.1319706, 1.231259, 0.2563633, 1, 1, 1, 1, 1,
-0.1297507, 0.197936, -1.571862, 1, 1, 1, 1, 1,
-0.1281974, 1.453465, -0.3158396, 1, 1, 1, 1, 1,
-0.1267838, 1.557649, 0.644527, 1, 1, 1, 1, 1,
-0.1228791, -1.638155, -4.266167, 1, 1, 1, 1, 1,
-0.1212247, -0.7441292, -0.80484, 1, 1, 1, 1, 1,
-0.1145081, -1.512908, -4.052533, 1, 1, 1, 1, 1,
-0.1123691, 0.3261519, -1.095295, 0, 0, 1, 1, 1,
-0.1122026, 0.3670759, 1.015095, 1, 0, 0, 1, 1,
-0.1117723, 0.28641, 0.7809055, 1, 0, 0, 1, 1,
-0.1085691, -0.6291294, -3.194859, 1, 0, 0, 1, 1,
-0.1081451, -0.04391312, -0.7575718, 1, 0, 0, 1, 1,
-0.1065771, -0.5172237, -4.199966, 1, 0, 0, 1, 1,
-0.105447, 1.212746, -2.630102, 0, 0, 0, 1, 1,
-0.1054052, -0.05829143, -2.339767, 0, 0, 0, 1, 1,
-0.1035378, -0.8624063, -4.197319, 0, 0, 0, 1, 1,
-0.1001557, -0.4603317, -3.240505, 0, 0, 0, 1, 1,
-0.09717052, -1.395973, -3.658958, 0, 0, 0, 1, 1,
-0.09665205, -0.4714124, -2.805266, 0, 0, 0, 1, 1,
-0.09506041, -1.223912, -3.839703, 0, 0, 0, 1, 1,
-0.09493565, 0.9274444, 0.6446657, 1, 1, 1, 1, 1,
-0.09448629, 0.02243493, -0.6403846, 1, 1, 1, 1, 1,
-0.09306038, 0.05214629, 2.93913, 1, 1, 1, 1, 1,
-0.0914099, -0.09655129, -2.342136, 1, 1, 1, 1, 1,
-0.08401638, -0.2576646, -1.666159, 1, 1, 1, 1, 1,
-0.08117436, 0.5332496, 1.785125, 1, 1, 1, 1, 1,
-0.07892982, -0.1408853, -1.316424, 1, 1, 1, 1, 1,
-0.07872514, -0.9397081, -2.144906, 1, 1, 1, 1, 1,
-0.07606584, -0.6922476, -2.101228, 1, 1, 1, 1, 1,
-0.0760207, -1.231793, -2.459123, 1, 1, 1, 1, 1,
-0.07197395, -0.2167225, -3.360478, 1, 1, 1, 1, 1,
-0.06895205, 0.9762099, 0.5354071, 1, 1, 1, 1, 1,
-0.06598895, -1.085467, -2.793621, 1, 1, 1, 1, 1,
-0.06022618, -0.9398429, -1.02035, 1, 1, 1, 1, 1,
-0.05849736, -2.202514, -4.082676, 1, 1, 1, 1, 1,
-0.05674231, 0.3120869, 0.2304079, 0, 0, 1, 1, 1,
-0.05584155, 0.705557, -0.6603809, 1, 0, 0, 1, 1,
-0.05415845, -0.2313553, -2.703849, 1, 0, 0, 1, 1,
-0.0512624, 0.333039, -0.8091338, 1, 0, 0, 1, 1,
-0.04961163, -0.6092106, -3.960774, 1, 0, 0, 1, 1,
-0.04876437, 0.8161358, -0.9926628, 1, 0, 0, 1, 1,
-0.04636086, 0.04539886, -3.174272, 0, 0, 0, 1, 1,
-0.04070754, -0.38718, -4.014383, 0, 0, 0, 1, 1,
-0.03903316, 0.3007472, -1.388823, 0, 0, 0, 1, 1,
-0.03894776, 0.3041527, 0.02849269, 0, 0, 0, 1, 1,
-0.03521093, -1.696741, -3.45393, 0, 0, 0, 1, 1,
-0.03003652, 0.1484734, 0.01527756, 0, 0, 0, 1, 1,
-0.02877045, -0.8861834, -3.002507, 0, 0, 0, 1, 1,
-0.02795546, -0.156275, -2.483026, 1, 1, 1, 1, 1,
-0.02525783, 1.614744, 1.173677, 1, 1, 1, 1, 1,
-0.01863072, 1.863133, 0.8936778, 1, 1, 1, 1, 1,
-0.01335198, -0.8996881, -0.5799254, 1, 1, 1, 1, 1,
-0.01299408, 0.6625214, -0.1353658, 1, 1, 1, 1, 1,
-0.008119072, -0.09577338, -0.4271204, 1, 1, 1, 1, 1,
-0.003638934, 0.3446747, -0.6513659, 1, 1, 1, 1, 1,
-0.001810003, -0.7014967, -3.363988, 1, 1, 1, 1, 1,
-0.001135574, -1.344958, -3.75686, 1, 1, 1, 1, 1,
-0.000509721, 0.1990219, -0.06907796, 1, 1, 1, 1, 1,
0.001135137, 1.055749, -0.4589274, 1, 1, 1, 1, 1,
0.004364623, -0.5729185, 1.707695, 1, 1, 1, 1, 1,
0.004457502, 1.501318, -0.2444219, 1, 1, 1, 1, 1,
0.007819463, 0.7657939, 0.3714167, 1, 1, 1, 1, 1,
0.01086223, -0.4582659, 3.024506, 1, 1, 1, 1, 1,
0.0135644, -2.557066, 0.2075636, 0, 0, 1, 1, 1,
0.01444212, 0.3554288, 0.9857685, 1, 0, 0, 1, 1,
0.01706556, 1.586395, 0.3474588, 1, 0, 0, 1, 1,
0.02349546, 0.781832, -0.04960604, 1, 0, 0, 1, 1,
0.02493546, -0.9382305, 2.509979, 1, 0, 0, 1, 1,
0.02987712, -0.9914644, 3.6054, 1, 0, 0, 1, 1,
0.03042766, -0.2746343, 3.165494, 0, 0, 0, 1, 1,
0.03352937, 0.5572544, 1.50091, 0, 0, 0, 1, 1,
0.03399939, 0.1153023, 1.282731, 0, 0, 0, 1, 1,
0.03720744, 0.4707507, -0.2358486, 0, 0, 0, 1, 1,
0.03813141, -0.07255223, 1.693451, 0, 0, 0, 1, 1,
0.0421187, 0.5893999, 0.5835131, 0, 0, 0, 1, 1,
0.04336427, 0.08161437, 1.331817, 0, 0, 0, 1, 1,
0.04635401, 0.4644978, -1.162403, 1, 1, 1, 1, 1,
0.04669905, -0.3451382, 3.585197, 1, 1, 1, 1, 1,
0.04722961, 1.082083, -0.8486249, 1, 1, 1, 1, 1,
0.04813347, 1.010989, 0.1875429, 1, 1, 1, 1, 1,
0.05050309, -0.1351671, 4.162007, 1, 1, 1, 1, 1,
0.05411678, 1.118071, 0.1544484, 1, 1, 1, 1, 1,
0.06341723, 0.4903972, 0.9171154, 1, 1, 1, 1, 1,
0.06426006, 0.7313885, -0.788858, 1, 1, 1, 1, 1,
0.0646093, 0.6206867, -0.5662084, 1, 1, 1, 1, 1,
0.06498333, 0.9961727, 0.5505292, 1, 1, 1, 1, 1,
0.06542972, -1.048649, 3.462978, 1, 1, 1, 1, 1,
0.06625028, -1.033134, 3.655756, 1, 1, 1, 1, 1,
0.06841302, -0.006320537, 0.3805293, 1, 1, 1, 1, 1,
0.06872548, 0.1363384, -0.1802427, 1, 1, 1, 1, 1,
0.07144873, 0.8259605, -0.4922759, 1, 1, 1, 1, 1,
0.0732545, 0.2535854, 0.5757433, 0, 0, 1, 1, 1,
0.07382575, 1.566404, 0.2497297, 1, 0, 0, 1, 1,
0.07428374, 1.383266, -1.062381, 1, 0, 0, 1, 1,
0.07485947, -1.284104, 1.303289, 1, 0, 0, 1, 1,
0.0753815, -0.1011022, 2.169898, 1, 0, 0, 1, 1,
0.07842589, 0.6818208, -0.07111032, 1, 0, 0, 1, 1,
0.07859511, 0.8041174, -0.849829, 0, 0, 0, 1, 1,
0.08010501, 1.313436, 0.8476484, 0, 0, 0, 1, 1,
0.08325218, 0.1490998, 1.725631, 0, 0, 0, 1, 1,
0.08450233, 1.709635, -0.2513739, 0, 0, 0, 1, 1,
0.0867169, 0.5676566, 1.305286, 0, 0, 0, 1, 1,
0.09280452, -1.785853, 2.359029, 0, 0, 0, 1, 1,
0.09406297, -1.046399, 3.572242, 0, 0, 0, 1, 1,
0.09643355, -0.3554546, 3.684117, 1, 1, 1, 1, 1,
0.1028419, 0.9212705, 0.8289164, 1, 1, 1, 1, 1,
0.1032032, 1.396724, 0.9523219, 1, 1, 1, 1, 1,
0.1034072, -1.118448, 1.668755, 1, 1, 1, 1, 1,
0.1037013, -0.3095492, 3.831591, 1, 1, 1, 1, 1,
0.1110108, 1.657769, -0.2519888, 1, 1, 1, 1, 1,
0.1145452, -0.1940294, 2.811188, 1, 1, 1, 1, 1,
0.1146086, 0.4060213, 0.6860162, 1, 1, 1, 1, 1,
0.1171236, -0.6442628, 5.650095, 1, 1, 1, 1, 1,
0.1191558, -0.5908219, 3.738512, 1, 1, 1, 1, 1,
0.1196515, -1.015224, 3.421876, 1, 1, 1, 1, 1,
0.1210773, -0.1395884, 2.347101, 1, 1, 1, 1, 1,
0.1211618, 2.091681, -0.5281672, 1, 1, 1, 1, 1,
0.1224343, 0.6259207, 0.3685219, 1, 1, 1, 1, 1,
0.1231974, 0.5541713, -0.773192, 1, 1, 1, 1, 1,
0.1253971, -0.6278136, 3.994464, 0, 0, 1, 1, 1,
0.1278452, -0.8144229, 3.398094, 1, 0, 0, 1, 1,
0.1291486, -0.3104101, 2.483988, 1, 0, 0, 1, 1,
0.1298152, 0.08752853, 1.983475, 1, 0, 0, 1, 1,
0.1402842, -1.559363, 2.158022, 1, 0, 0, 1, 1,
0.1417099, -2.60457, 3.489272, 1, 0, 0, 1, 1,
0.1445137, 0.5837561, -0.009124629, 0, 0, 0, 1, 1,
0.1462573, 0.604643, -1.154743, 0, 0, 0, 1, 1,
0.1493751, 0.2771644, 0.02843717, 0, 0, 0, 1, 1,
0.1496777, -0.4883747, 2.355342, 0, 0, 0, 1, 1,
0.1596364, 1.422988, -0.08994057, 0, 0, 0, 1, 1,
0.1619765, 1.262213, -0.01189949, 0, 0, 0, 1, 1,
0.166343, -0.7099043, 3.882673, 0, 0, 0, 1, 1,
0.1666364, 0.631372, 0.8148558, 1, 1, 1, 1, 1,
0.1670764, -0.2067316, 1.795683, 1, 1, 1, 1, 1,
0.1722115, -2.775125, 3.564362, 1, 1, 1, 1, 1,
0.1726625, 2.794531, -1.763811, 1, 1, 1, 1, 1,
0.1734267, 0.5353103, 0.351182, 1, 1, 1, 1, 1,
0.1738496, -0.003024682, 1.857752, 1, 1, 1, 1, 1,
0.1742387, -0.7386479, 2.745878, 1, 1, 1, 1, 1,
0.1756884, -0.7321001, 2.045764, 1, 1, 1, 1, 1,
0.1782926, 0.2029471, 1.937886, 1, 1, 1, 1, 1,
0.1802702, 0.316153, 0.5369587, 1, 1, 1, 1, 1,
0.1810422, 1.909919, 0.8638712, 1, 1, 1, 1, 1,
0.1883313, 0.9817498, -0.06556032, 1, 1, 1, 1, 1,
0.1927281, -0.5243372, 3.958376, 1, 1, 1, 1, 1,
0.193014, 1.018555, 0.9513893, 1, 1, 1, 1, 1,
0.1962422, -0.4922298, 1.805278, 1, 1, 1, 1, 1,
0.1966579, 1.285264, 0.6360124, 0, 0, 1, 1, 1,
0.1992927, 0.5588577, 1.850959, 1, 0, 0, 1, 1,
0.2002667, -0.8857955, 4.626961, 1, 0, 0, 1, 1,
0.2026154, 0.3914371, -0.6698314, 1, 0, 0, 1, 1,
0.2058285, -1.620404, 3.318217, 1, 0, 0, 1, 1,
0.2059744, -0.1742401, 1.625447, 1, 0, 0, 1, 1,
0.2066143, 0.08768012, 2.356893, 0, 0, 0, 1, 1,
0.2085862, 0.7979512, 0.8733821, 0, 0, 0, 1, 1,
0.2121602, -0.1522631, 2.386727, 0, 0, 0, 1, 1,
0.2126886, 0.818157, -1.026001, 0, 0, 0, 1, 1,
0.2156254, -0.5453382, 3.571921, 0, 0, 0, 1, 1,
0.2171448, 1.129706, 1.301829, 0, 0, 0, 1, 1,
0.2181817, -0.2129872, 1.023768, 0, 0, 0, 1, 1,
0.2198954, 1.529465, 0.7043858, 1, 1, 1, 1, 1,
0.2201121, 0.1898464, 0.1426808, 1, 1, 1, 1, 1,
0.2201697, -0.4992881, 1.495151, 1, 1, 1, 1, 1,
0.2212571, -1.124379, 3.603302, 1, 1, 1, 1, 1,
0.2214634, -0.5159577, 2.703437, 1, 1, 1, 1, 1,
0.2216565, 1.038676, -1.198278, 1, 1, 1, 1, 1,
0.2219488, -1.503959, 3.588221, 1, 1, 1, 1, 1,
0.2244163, 0.7540241, -0.5042437, 1, 1, 1, 1, 1,
0.2245121, -0.3008327, 2.226926, 1, 1, 1, 1, 1,
0.2273987, -0.1730173, 2.555387, 1, 1, 1, 1, 1,
0.2296823, 0.6184365, 0.8664101, 1, 1, 1, 1, 1,
0.2328953, -0.1487316, 1.144122, 1, 1, 1, 1, 1,
0.240465, 0.3130861, 2.172781, 1, 1, 1, 1, 1,
0.2496348, 0.6014295, 0.7841308, 1, 1, 1, 1, 1,
0.2537636, -0.06493133, 0.487871, 1, 1, 1, 1, 1,
0.2570298, -0.2854854, 2.523903, 0, 0, 1, 1, 1,
0.2592055, 0.9057493, 0.5590357, 1, 0, 0, 1, 1,
0.2597057, -1.180423, 3.608565, 1, 0, 0, 1, 1,
0.2684247, 0.4085483, 1.312465, 1, 0, 0, 1, 1,
0.2724152, 1.980244, 1.862131, 1, 0, 0, 1, 1,
0.2866816, 0.3180045, 1.631917, 1, 0, 0, 1, 1,
0.2883375, 0.08070356, -0.05665516, 0, 0, 0, 1, 1,
0.2891897, 1.590936, 1.556789, 0, 0, 0, 1, 1,
0.2924111, 0.938426, 1.073044, 0, 0, 0, 1, 1,
0.2926969, 0.7238305, 1.554346, 0, 0, 0, 1, 1,
0.2937824, 0.2567496, 0.4995728, 0, 0, 0, 1, 1,
0.2955256, 0.7159314, -1.162235, 0, 0, 0, 1, 1,
0.2963967, 0.354301, -1.155594, 0, 0, 0, 1, 1,
0.299877, 0.7187822, -1.132749, 1, 1, 1, 1, 1,
0.3022195, -0.4168438, 1.881236, 1, 1, 1, 1, 1,
0.3038473, 0.9713953, -1.186221, 1, 1, 1, 1, 1,
0.305294, -0.0005081042, 1.333595, 1, 1, 1, 1, 1,
0.3084334, -2.137979, 2.928357, 1, 1, 1, 1, 1,
0.3105608, -0.04214374, 0.2491318, 1, 1, 1, 1, 1,
0.3119579, 0.9874134, 1.60534, 1, 1, 1, 1, 1,
0.314438, 0.564504, 2.595338, 1, 1, 1, 1, 1,
0.3234798, -1.729683, 3.299322, 1, 1, 1, 1, 1,
0.3250863, 1.193931, 0.8059635, 1, 1, 1, 1, 1,
0.3255751, 0.2574974, 3.095735, 1, 1, 1, 1, 1,
0.3268563, 0.388995, 1.474727, 1, 1, 1, 1, 1,
0.3292864, -2.089263, 3.51402, 1, 1, 1, 1, 1,
0.3298422, 0.6648488, -0.7490159, 1, 1, 1, 1, 1,
0.3318608, 1.525725, -0.3133646, 1, 1, 1, 1, 1,
0.3322884, -0.5374123, 3.091933, 0, 0, 1, 1, 1,
0.3359233, -0.6981217, 2.573195, 1, 0, 0, 1, 1,
0.3394914, 0.2963855, 0.9783541, 1, 0, 0, 1, 1,
0.3398434, 0.8375009, 0.3808002, 1, 0, 0, 1, 1,
0.3424012, -0.3733801, 3.900976, 1, 0, 0, 1, 1,
0.3441272, -0.08576734, 0.04486852, 1, 0, 0, 1, 1,
0.3447098, -0.3267749, 3.713828, 0, 0, 0, 1, 1,
0.3493179, -0.414088, 1.848347, 0, 0, 0, 1, 1,
0.3512573, 0.1513961, 0.3788518, 0, 0, 0, 1, 1,
0.3625371, 0.113994, -0.5412432, 0, 0, 0, 1, 1,
0.3667424, 0.2377425, 0.8085343, 0, 0, 0, 1, 1,
0.3692982, -1.620554, 1.388461, 0, 0, 0, 1, 1,
0.3693492, 0.2343308, -2.177284, 0, 0, 0, 1, 1,
0.3721152, -1.136647, 2.077017, 1, 1, 1, 1, 1,
0.3736071, -1.502452, 3.945211, 1, 1, 1, 1, 1,
0.374969, -3.214312, 2.97801, 1, 1, 1, 1, 1,
0.3767712, -0.8437032, 4.324381, 1, 1, 1, 1, 1,
0.3784174, 1.246995, -0.365544, 1, 1, 1, 1, 1,
0.3885931, 1.429081, 0.2371379, 1, 1, 1, 1, 1,
0.3908186, -1.092482, 3.650895, 1, 1, 1, 1, 1,
0.3923723, 1.250639, 1.148611, 1, 1, 1, 1, 1,
0.3924648, -0.3009987, 3.247671, 1, 1, 1, 1, 1,
0.3933874, -0.3872372, 2.256441, 1, 1, 1, 1, 1,
0.3955836, -0.3100369, 1.99584, 1, 1, 1, 1, 1,
0.3978136, 1.448034, -1.910584, 1, 1, 1, 1, 1,
0.4094432, 1.445473, 0.1548528, 1, 1, 1, 1, 1,
0.4134552, -1.440291, 5.166623, 1, 1, 1, 1, 1,
0.4144341, -0.9270307, 2.499892, 1, 1, 1, 1, 1,
0.4169835, 1.377125, -1.182308, 0, 0, 1, 1, 1,
0.419082, -0.7071983, 1.657234, 1, 0, 0, 1, 1,
0.419638, -0.01161779, 2.4133, 1, 0, 0, 1, 1,
0.4211353, -0.2686796, 0.9171707, 1, 0, 0, 1, 1,
0.421497, -1.453385, 2.036837, 1, 0, 0, 1, 1,
0.425675, -0.8620346, 4.827042, 1, 0, 0, 1, 1,
0.4276935, -0.9536851, 2.913392, 0, 0, 0, 1, 1,
0.4339007, -1.034927, 4.275604, 0, 0, 0, 1, 1,
0.4473682, 0.1275179, 1.160512, 0, 0, 0, 1, 1,
0.4485577, -0.3856111, 3.958318, 0, 0, 0, 1, 1,
0.4491566, -1.519918, 3.704102, 0, 0, 0, 1, 1,
0.4502889, -0.4148847, 3.125917, 0, 0, 0, 1, 1,
0.4527372, 0.6510909, -0.2317593, 0, 0, 0, 1, 1,
0.4532681, 0.259836, 0.8385264, 1, 1, 1, 1, 1,
0.4553186, -0.3207355, 2.428258, 1, 1, 1, 1, 1,
0.4591702, -0.8753712, 3.798847, 1, 1, 1, 1, 1,
0.4602257, -0.8086839, 3.980028, 1, 1, 1, 1, 1,
0.461361, 0.9361635, 3.665149, 1, 1, 1, 1, 1,
0.4748334, 0.4592872, 0.08786301, 1, 1, 1, 1, 1,
0.4769382, -0.366669, 3.081778, 1, 1, 1, 1, 1,
0.4785524, -0.5829707, 2.395269, 1, 1, 1, 1, 1,
0.4831992, -0.7514234, 3.218039, 1, 1, 1, 1, 1,
0.4844199, 0.2452697, 1.358918, 1, 1, 1, 1, 1,
0.4875374, -0.6459168, 2.456427, 1, 1, 1, 1, 1,
0.4910598, 1.514564, -0.6719411, 1, 1, 1, 1, 1,
0.4914407, -1.001576, 2.767848, 1, 1, 1, 1, 1,
0.4935698, -0.01148043, 1.86594, 1, 1, 1, 1, 1,
0.4945609, 0.8903548, -0.02508902, 1, 1, 1, 1, 1,
0.4966401, -2.789132, 3.557663, 0, 0, 1, 1, 1,
0.5056298, 1.629436, 1.883268, 1, 0, 0, 1, 1,
0.5086731, -0.02427466, 2.51423, 1, 0, 0, 1, 1,
0.5092743, -1.789808, 2.733521, 1, 0, 0, 1, 1,
0.5185624, -0.9242108, 3.722768, 1, 0, 0, 1, 1,
0.5243854, -1.0374, 2.808958, 1, 0, 0, 1, 1,
0.526737, 0.7780364, -0.2914404, 0, 0, 0, 1, 1,
0.5271333, -1.142223, 1.109014, 0, 0, 0, 1, 1,
0.5285936, 0.401648, 1.742031, 0, 0, 0, 1, 1,
0.5294009, -1.003216, 4.387249, 0, 0, 0, 1, 1,
0.5346835, -0.9470105, 1.872246, 0, 0, 0, 1, 1,
0.5421687, -0.579975, 1.40259, 0, 0, 0, 1, 1,
0.5450393, -1.280561, 1.943884, 0, 0, 0, 1, 1,
0.5455736, 1.541678, -0.7422699, 1, 1, 1, 1, 1,
0.5499682, -1.498017, 2.732971, 1, 1, 1, 1, 1,
0.5532234, -2.030494, 0.3080122, 1, 1, 1, 1, 1,
0.5538388, 0.2732721, 1.066481, 1, 1, 1, 1, 1,
0.5569605, 0.3254889, 1.76349, 1, 1, 1, 1, 1,
0.5639591, 1.33263, 0.6558098, 1, 1, 1, 1, 1,
0.5669882, 2.062362, 1.275754, 1, 1, 1, 1, 1,
0.5820168, 0.08240227, 1.06429, 1, 1, 1, 1, 1,
0.5876514, -1.583225, 1.101205, 1, 1, 1, 1, 1,
0.5895573, 0.5315246, 0.1279675, 1, 1, 1, 1, 1,
0.5907372, -0.9850654, 2.789079, 1, 1, 1, 1, 1,
0.5943909, -0.2108848, 2.444284, 1, 1, 1, 1, 1,
0.5948574, 0.3825256, 0.7117818, 1, 1, 1, 1, 1,
0.5980665, 0.3847546, 0.5386553, 1, 1, 1, 1, 1,
0.6018487, -1.813149, 3.19381, 1, 1, 1, 1, 1,
0.6047139, -1.530506, 3.823605, 0, 0, 1, 1, 1,
0.6053705, -0.325078, 1.965319, 1, 0, 0, 1, 1,
0.6150977, 0.1334714, -0.1012562, 1, 0, 0, 1, 1,
0.6153803, 1.873474, 0.6619189, 1, 0, 0, 1, 1,
0.6207264, 0.4072228, 1.643788, 1, 0, 0, 1, 1,
0.6232226, 1.724886, 0.447869, 1, 0, 0, 1, 1,
0.6236814, 2.012938, 1.218003, 0, 0, 0, 1, 1,
0.6259702, 1.051939, -0.652104, 0, 0, 0, 1, 1,
0.6278774, 0.1424252, 0.767988, 0, 0, 0, 1, 1,
0.6305257, 0.1116476, -0.2842023, 0, 0, 0, 1, 1,
0.6308849, 1.982537, 2.297557, 0, 0, 0, 1, 1,
0.6340586, -0.7196646, 2.642609, 0, 0, 0, 1, 1,
0.6355598, 0.3946966, -0.5815012, 0, 0, 0, 1, 1,
0.6389124, -0.6128917, 3.0733, 1, 1, 1, 1, 1,
0.6408569, -1.321098, 3.027924, 1, 1, 1, 1, 1,
0.6409354, -1.58573, 3.141917, 1, 1, 1, 1, 1,
0.6414934, -1.194786, 3.898241, 1, 1, 1, 1, 1,
0.6426673, 0.5080549, 1.041707, 1, 1, 1, 1, 1,
0.6470727, -0.414817, -0.5784872, 1, 1, 1, 1, 1,
0.6504711, 0.6862776, 0.9154574, 1, 1, 1, 1, 1,
0.654642, -1.227535, 3.478941, 1, 1, 1, 1, 1,
0.6547752, 1.150339, 2.539622, 1, 1, 1, 1, 1,
0.6553735, -0.9047661, 4.422967, 1, 1, 1, 1, 1,
0.6577736, 0.1623423, 1.876703, 1, 1, 1, 1, 1,
0.6689872, -0.3844861, 4.183341, 1, 1, 1, 1, 1,
0.6773465, 1.112174, 0.73114, 1, 1, 1, 1, 1,
0.6788085, -0.5778742, 4.613509, 1, 1, 1, 1, 1,
0.6798828, 0.3529095, 2.183341, 1, 1, 1, 1, 1,
0.6843267, -0.7832526, 4.801987, 0, 0, 1, 1, 1,
0.6862484, -0.5911817, 0.7746499, 1, 0, 0, 1, 1,
0.6899534, -0.1110953, 1.597158, 1, 0, 0, 1, 1,
0.6911975, -0.2119526, 3.037292, 1, 0, 0, 1, 1,
0.6942045, -0.2090043, 2.453249, 1, 0, 0, 1, 1,
0.6993336, 0.9108315, 1.406848, 1, 0, 0, 1, 1,
0.7018464, -0.3672259, 1.373857, 0, 0, 0, 1, 1,
0.7062628, 1.703123, -0.5721957, 0, 0, 0, 1, 1,
0.7077408, 1.628586, 0.1865317, 0, 0, 0, 1, 1,
0.7141348, 0.4216114, -0.2273941, 0, 0, 0, 1, 1,
0.719372, 0.4276308, 0.6665748, 0, 0, 0, 1, 1,
0.723182, 0.1480059, 1.135578, 0, 0, 0, 1, 1,
0.7294867, -2.091141, 0.8749506, 0, 0, 0, 1, 1,
0.7299381, 0.5582287, 1.343572, 1, 1, 1, 1, 1,
0.7307417, 0.9875301, 0.8109484, 1, 1, 1, 1, 1,
0.7334148, 2.255779, 1.724924, 1, 1, 1, 1, 1,
0.7360429, 0.003351269, -0.7277359, 1, 1, 1, 1, 1,
0.7380049, -0.7538158, 2.408429, 1, 1, 1, 1, 1,
0.7487831, 0.2026091, 1.97381, 1, 1, 1, 1, 1,
0.7496588, -0.9435451, 0.9708759, 1, 1, 1, 1, 1,
0.7499868, -1.345234, 1.823947, 1, 1, 1, 1, 1,
0.7501901, 0.8427755, 0.04092759, 1, 1, 1, 1, 1,
0.7543371, 0.6615384, 0.5185105, 1, 1, 1, 1, 1,
0.7564409, -0.6580325, 1.862164, 1, 1, 1, 1, 1,
0.7624931, -1.391085, 1.974973, 1, 1, 1, 1, 1,
0.7633414, 0.8308743, 0.3466317, 1, 1, 1, 1, 1,
0.7640257, 0.4971972, 0.7007859, 1, 1, 1, 1, 1,
0.7667659, 1.412536, 1.827354, 1, 1, 1, 1, 1,
0.7674687, 0.07616119, 2.425684, 0, 0, 1, 1, 1,
0.7684404, -2.186664, 2.247829, 1, 0, 0, 1, 1,
0.7686961, 0.4797359, 0.8747105, 1, 0, 0, 1, 1,
0.7785887, -1.175727, 1.449264, 1, 0, 0, 1, 1,
0.7821673, 0.3482887, 0.7255173, 1, 0, 0, 1, 1,
0.789133, -1.852042, 4.902249, 1, 0, 0, 1, 1,
0.7914945, -2.099383, 1.841912, 0, 0, 0, 1, 1,
0.7936169, 1.475515, 1.106863, 0, 0, 0, 1, 1,
0.7969174, -0.9155648, 2.155243, 0, 0, 0, 1, 1,
0.7971355, -2.170045, 2.338914, 0, 0, 0, 1, 1,
0.8070799, -1.206953, 2.09675, 0, 0, 0, 1, 1,
0.8093392, 1.546733, 0.1273198, 0, 0, 0, 1, 1,
0.8116054, -0.7859004, 2.564438, 0, 0, 0, 1, 1,
0.8146632, -0.3093718, 2.540699, 1, 1, 1, 1, 1,
0.8281806, -2.972177, 2.24164, 1, 1, 1, 1, 1,
0.831384, 0.5883868, 1.146735, 1, 1, 1, 1, 1,
0.8368707, 0.1653128, 2.168712, 1, 1, 1, 1, 1,
0.8540956, 0.002534845, 1.738326, 1, 1, 1, 1, 1,
0.8566259, 0.6454197, 0.6752629, 1, 1, 1, 1, 1,
0.8586498, 0.5875109, 2.488252, 1, 1, 1, 1, 1,
0.859564, -1.290845, 2.937546, 1, 1, 1, 1, 1,
0.8625191, -1.115405, 1.514385, 1, 1, 1, 1, 1,
0.8638061, 1.762532, 1.354155, 1, 1, 1, 1, 1,
0.867327, 0.6542389, 1.627956, 1, 1, 1, 1, 1,
0.880409, -0.2096659, 1.837618, 1, 1, 1, 1, 1,
0.8830962, 0.6287684, 0.5708278, 1, 1, 1, 1, 1,
0.8884179, -0.4410506, 1.70501, 1, 1, 1, 1, 1,
0.9003615, -1.376749, 1.656976, 1, 1, 1, 1, 1,
0.9102564, -0.2191633, 2.758598, 0, 0, 1, 1, 1,
0.9137498, 1.400258, 1.728192, 1, 0, 0, 1, 1,
0.9187677, 0.008355921, 2.214016, 1, 0, 0, 1, 1,
0.9256113, 1.246015, -0.1003462, 1, 0, 0, 1, 1,
0.9275244, 1.937837, 0.610723, 1, 0, 0, 1, 1,
0.9282637, -1.623211, 2.126555, 1, 0, 0, 1, 1,
0.9285802, -0.3589263, 0.9695941, 0, 0, 0, 1, 1,
0.9291726, -0.5363089, 2.925677, 0, 0, 0, 1, 1,
0.9390166, -0.02327972, 2.374478, 0, 0, 0, 1, 1,
0.939364, -0.9438798, 2.409348, 0, 0, 0, 1, 1,
0.9407491, 2.276355, 1.48972, 0, 0, 0, 1, 1,
0.9417831, -1.149094, 2.250545, 0, 0, 0, 1, 1,
0.9460537, 0.2747295, 1.087571, 0, 0, 0, 1, 1,
0.9499777, -1.811194, 2.245092, 1, 1, 1, 1, 1,
0.9648479, -1.00974, 1.073698, 1, 1, 1, 1, 1,
0.9661118, -0.7875569, 2.336073, 1, 1, 1, 1, 1,
0.9702951, 2.006287, -0.4704715, 1, 1, 1, 1, 1,
0.971029, -0.4888321, 1.69728, 1, 1, 1, 1, 1,
0.9827487, 2.037606, -0.600278, 1, 1, 1, 1, 1,
0.9844577, -1.985717, 3.936319, 1, 1, 1, 1, 1,
0.9853181, 0.1567968, 2.232713, 1, 1, 1, 1, 1,
0.9869983, 0.5703631, -0.4270245, 1, 1, 1, 1, 1,
0.9875781, 1.327161, 1.751655, 1, 1, 1, 1, 1,
0.9894881, -0.008381942, 1.621949, 1, 1, 1, 1, 1,
0.9966063, -2.194876, 1.941627, 1, 1, 1, 1, 1,
1.00355, 0.4408901, 1.886132, 1, 1, 1, 1, 1,
1.008182, -1.666429, 2.470418, 1, 1, 1, 1, 1,
1.008768, 0.3808783, 0.3901893, 1, 1, 1, 1, 1,
1.013769, 0.2746325, 1.767266, 0, 0, 1, 1, 1,
1.016798, 0.5242417, 0.6891814, 1, 0, 0, 1, 1,
1.017479, -0.3537746, 3.226261, 1, 0, 0, 1, 1,
1.021351, -0.2636969, 1.778887, 1, 0, 0, 1, 1,
1.03303, -1.377747, 2.226583, 1, 0, 0, 1, 1,
1.041476, 0.5109379, 0.2241332, 1, 0, 0, 1, 1,
1.043442, -1.45084, 2.691967, 0, 0, 0, 1, 1,
1.046104, 0.9484717, 0.5257291, 0, 0, 0, 1, 1,
1.04613, -1.343226, 2.497699, 0, 0, 0, 1, 1,
1.049656, 1.831807, 0.4099297, 0, 0, 0, 1, 1,
1.051332, 0.3971396, 1.158473, 0, 0, 0, 1, 1,
1.051455, -1.811828, 4.736564, 0, 0, 0, 1, 1,
1.054681, 0.2159939, 2.424389, 0, 0, 0, 1, 1,
1.05573, -0.378711, 2.805398, 1, 1, 1, 1, 1,
1.058868, 0.4558487, 1.416531, 1, 1, 1, 1, 1,
1.061221, 0.5020453, 1.740592, 1, 1, 1, 1, 1,
1.062513, -0.961128, 2.099246, 1, 1, 1, 1, 1,
1.07008, 0.481107, -0.3501725, 1, 1, 1, 1, 1,
1.074235, -0.5830417, 1.900648, 1, 1, 1, 1, 1,
1.075431, 0.4573811, 2.972642, 1, 1, 1, 1, 1,
1.077612, -0.1540208, 1.4378, 1, 1, 1, 1, 1,
1.079746, 1.526262, 0.20375, 1, 1, 1, 1, 1,
1.08639, 0.7462505, 1.851696, 1, 1, 1, 1, 1,
1.089898, -1.077593, 2.086876, 1, 1, 1, 1, 1,
1.093661, -0.2425727, 2.181525, 1, 1, 1, 1, 1,
1.097215, 0.6934672, 0.5504005, 1, 1, 1, 1, 1,
1.102886, -0.05225104, 1.74964, 1, 1, 1, 1, 1,
1.119213, -0.5076995, 3.550996, 1, 1, 1, 1, 1,
1.120011, 0.6357657, 1.927265, 0, 0, 1, 1, 1,
1.122364, -1.683128, 2.634499, 1, 0, 0, 1, 1,
1.126838, -1.265064, 3.055845, 1, 0, 0, 1, 1,
1.12895, -1.29939, 1.969422, 1, 0, 0, 1, 1,
1.135404, 1.02545, -0.3593433, 1, 0, 0, 1, 1,
1.139486, 0.2389262, 1.277681, 1, 0, 0, 1, 1,
1.139886, -0.601512, 0.9214888, 0, 0, 0, 1, 1,
1.143084, -0.2324295, 4.002529, 0, 0, 0, 1, 1,
1.144749, -0.598325, 1.717837, 0, 0, 0, 1, 1,
1.146754, -1.436904, 3.194842, 0, 0, 0, 1, 1,
1.149072, 0.6777786, 1.466118, 0, 0, 0, 1, 1,
1.15185, -0.4847874, 1.502042, 0, 0, 0, 1, 1,
1.152442, 1.224322, 0.297758, 0, 0, 0, 1, 1,
1.157468, 0.9062551, 0.6200338, 1, 1, 1, 1, 1,
1.159543, 1.531966, 1.618275, 1, 1, 1, 1, 1,
1.168652, 0.6197808, -0.6916353, 1, 1, 1, 1, 1,
1.169008, -1.065358, 1.53713, 1, 1, 1, 1, 1,
1.172077, -1.002503, -0.03952826, 1, 1, 1, 1, 1,
1.173271, -1.310644, 2.041177, 1, 1, 1, 1, 1,
1.177841, 0.8886051, 0.7733868, 1, 1, 1, 1, 1,
1.179597, 0.3991607, 2.615334, 1, 1, 1, 1, 1,
1.180966, 1.051946, 1.320272, 1, 1, 1, 1, 1,
1.181429, 1.255687, 0.2993777, 1, 1, 1, 1, 1,
1.182721, -0.747958, 2.033352, 1, 1, 1, 1, 1,
1.182939, 0.1850675, 2.528982, 1, 1, 1, 1, 1,
1.187965, 2.506464, 1.408336, 1, 1, 1, 1, 1,
1.194333, -0.11282, 1.857718, 1, 1, 1, 1, 1,
1.195358, -1.329633, 2.329649, 1, 1, 1, 1, 1,
1.196699, 0.7375811, 0.3209735, 0, 0, 1, 1, 1,
1.20544, 0.2680488, 3.982866, 1, 0, 0, 1, 1,
1.209849, -0.3709634, 1.224135, 1, 0, 0, 1, 1,
1.214333, -0.09732039, 0.9961959, 1, 0, 0, 1, 1,
1.215352, -0.09654705, -0.08994655, 1, 0, 0, 1, 1,
1.22076, -1.895519, 2.372014, 1, 0, 0, 1, 1,
1.230786, 0.5786178, 1.228262, 0, 0, 0, 1, 1,
1.231735, 1.042647, 0.2681697, 0, 0, 0, 1, 1,
1.244974, 0.1244269, 1.699906, 0, 0, 0, 1, 1,
1.24592, -0.423008, 3.310988, 0, 0, 0, 1, 1,
1.246424, -1.096198, 0.7917725, 0, 0, 0, 1, 1,
1.260484, -0.8387959, 2.618577, 0, 0, 0, 1, 1,
1.267861, -0.3558825, 1.738576, 0, 0, 0, 1, 1,
1.269278, 0.6864244, 1.53856, 1, 1, 1, 1, 1,
1.271498, -0.7198914, 0.860564, 1, 1, 1, 1, 1,
1.281363, 0.7115391, 0.6097385, 1, 1, 1, 1, 1,
1.289024, 0.01936131, 1.055358, 1, 1, 1, 1, 1,
1.292938, 0.9203513, 1.24059, 1, 1, 1, 1, 1,
1.293177, -2.670094, 2.298087, 1, 1, 1, 1, 1,
1.300482, 0.8673528, 0.1825435, 1, 1, 1, 1, 1,
1.328758, 1.746819, 0.5941389, 1, 1, 1, 1, 1,
1.332456, -0.9240116, 1.405327, 1, 1, 1, 1, 1,
1.335157, -0.7651577, 2.675767, 1, 1, 1, 1, 1,
1.341174, 0.2976406, 1.882736, 1, 1, 1, 1, 1,
1.350308, 0.7844719, 1.458397, 1, 1, 1, 1, 1,
1.35031, 0.6474821, 0.9236239, 1, 1, 1, 1, 1,
1.359166, -0.3301803, 1.95495, 1, 1, 1, 1, 1,
1.361185, 0.4494672, 1.168935, 1, 1, 1, 1, 1,
1.365526, -0.9531412, 1.962948, 0, 0, 1, 1, 1,
1.370782, -0.6858264, 3.450877, 1, 0, 0, 1, 1,
1.389444, -0.169139, 1.378667, 1, 0, 0, 1, 1,
1.400358, -0.8609657, 1.855921, 1, 0, 0, 1, 1,
1.403738, -0.7391357, 3.201233, 1, 0, 0, 1, 1,
1.404701, 0.7572016, 1.644974, 1, 0, 0, 1, 1,
1.412524, -1.368587, 1.492484, 0, 0, 0, 1, 1,
1.412524, -1.202452, 1.448892, 0, 0, 0, 1, 1,
1.423684, 0.5474857, 1.406748, 0, 0, 0, 1, 1,
1.424169, -0.3398697, 1.537676, 0, 0, 0, 1, 1,
1.430949, 0.02738706, 1.638576, 0, 0, 0, 1, 1,
1.441608, 0.914102, 1.444593, 0, 0, 0, 1, 1,
1.451047, -0.1106204, -0.4561655, 0, 0, 0, 1, 1,
1.451717, -0.8215876, 3.672062, 1, 1, 1, 1, 1,
1.455503, -0.552358, 0.155957, 1, 1, 1, 1, 1,
1.457069, 0.2400289, 1.553681, 1, 1, 1, 1, 1,
1.459155, -0.7955428, 2.399872, 1, 1, 1, 1, 1,
1.47055, -1.147053, 3.075971, 1, 1, 1, 1, 1,
1.474705, 0.4042064, 0.6596602, 1, 1, 1, 1, 1,
1.47821, -0.8146273, 2.085988, 1, 1, 1, 1, 1,
1.481025, -0.1073539, 3.305327, 1, 1, 1, 1, 1,
1.483406, -0.637571, 2.554281, 1, 1, 1, 1, 1,
1.495993, 1.280652, 1.223221, 1, 1, 1, 1, 1,
1.497404, 1.633466, 1.883723, 1, 1, 1, 1, 1,
1.506822, -1.207334, 2.60429, 1, 1, 1, 1, 1,
1.507221, -0.3362414, 2.363541, 1, 1, 1, 1, 1,
1.523023, -2.147715, 1.757721, 1, 1, 1, 1, 1,
1.530464, 0.3745534, 1.446573, 1, 1, 1, 1, 1,
1.559953, -1.207963, 3.097247, 0, 0, 1, 1, 1,
1.597109, -0.1718315, 0.7121974, 1, 0, 0, 1, 1,
1.598018, -0.7622425, 2.817561, 1, 0, 0, 1, 1,
1.598384, -0.6700508, 1.519865, 1, 0, 0, 1, 1,
1.607154, 0.8977856, 2.536689, 1, 0, 0, 1, 1,
1.614588, -0.5399266, 1.795951, 1, 0, 0, 1, 1,
1.647687, -0.7538256, 2.71164, 0, 0, 0, 1, 1,
1.652544, 0.9431984, 2.018799, 0, 0, 0, 1, 1,
1.661466, 0.9977059, 1.732812, 0, 0, 0, 1, 1,
1.686852, -0.6234879, 1.051291, 0, 0, 0, 1, 1,
1.69731, 1.611487, 1.109313, 0, 0, 0, 1, 1,
1.698096, 0.9163297, 0.6705011, 0, 0, 0, 1, 1,
1.709527, 0.9383559, -0.3775099, 0, 0, 0, 1, 1,
1.719019, -0.5028741, 3.752308, 1, 1, 1, 1, 1,
1.722617, 0.5494289, 3.930295, 1, 1, 1, 1, 1,
1.772121, 0.4722959, 1.125994, 1, 1, 1, 1, 1,
1.793831, 0.4542331, 3.221251, 1, 1, 1, 1, 1,
1.799615, 1.082636, 2.211499, 1, 1, 1, 1, 1,
1.808256, 0.6964369, 0.1433294, 1, 1, 1, 1, 1,
1.905854, 0.6276801, 0.6959873, 1, 1, 1, 1, 1,
1.942705, 0.4514184, 2.903477, 1, 1, 1, 1, 1,
1.970557, -0.5200487, 1.318945, 1, 1, 1, 1, 1,
1.978521, -0.1401168, 3.171509, 1, 1, 1, 1, 1,
2.022036, -0.8957049, 1.999673, 1, 1, 1, 1, 1,
2.027309, 0.5719869, 2.402828, 1, 1, 1, 1, 1,
2.031799, 0.9658777, 1.731914, 1, 1, 1, 1, 1,
2.037519, 0.4795747, 1.754475, 1, 1, 1, 1, 1,
2.03994, 0.5795128, 1.299788, 1, 1, 1, 1, 1,
2.055124, -0.08957021, 0.3215074, 0, 0, 1, 1, 1,
2.058283, -1.65103, 1.48987, 1, 0, 0, 1, 1,
2.066646, -1.036202, 2.113529, 1, 0, 0, 1, 1,
2.086869, -0.8956864, 1.443945, 1, 0, 0, 1, 1,
2.121263, 1.424811, 1.402924, 1, 0, 0, 1, 1,
2.12395, -0.2866614, 1.266101, 1, 0, 0, 1, 1,
2.155439, -0.1956077, 0.6550792, 0, 0, 0, 1, 1,
2.187713, 1.050404, 2.22657, 0, 0, 0, 1, 1,
2.194542, -2.420522, 2.078591, 0, 0, 0, 1, 1,
2.223625, 0.5440653, 2.703397, 0, 0, 0, 1, 1,
2.261343, -0.2121795, 2.575827, 0, 0, 0, 1, 1,
2.28614, 1.548687, 1.62151, 0, 0, 0, 1, 1,
2.393347, 0.1897375, 3.054841, 0, 0, 0, 1, 1,
2.418549, -1.975857, 2.098947, 1, 1, 1, 1, 1,
2.434945, 0.7716237, 2.801499, 1, 1, 1, 1, 1,
2.521079, -1.897168, 2.108304, 1, 1, 1, 1, 1,
2.562493, -1.532858, 2.163498, 1, 1, 1, 1, 1,
2.619442, -1.948082, 1.891019, 1, 1, 1, 1, 1,
2.746099, -0.90289, 0.7351422, 1, 1, 1, 1, 1,
2.802019, 1.17251, 0.8088393, 1, 1, 1, 1, 1
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
var radius = 9.613858;
var distance = 33.76827;
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
mvMatrix.translate( 0.6393571, -0.165473, -0.5282493 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76827);
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
